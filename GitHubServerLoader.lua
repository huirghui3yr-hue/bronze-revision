-- GitHubServerLoader
-- Loads server-side Roblox scripts from:
-- https://github.com/huirghui3yr-hue/bronze-revision

local HttpService = game:GetService("HttpService")
local ServerScriptService = game:GetService("ServerScriptService")

local BASE_URL = "https://raw.githubusercontent.com/huirghui3yr-hue/bronze-revision/main/"
local MANIFEST_URL = BASE_URL .. "manifest.json"

local nativeRequire = require
local baseEnv = getfenv()

local SERVER_REMOTE_ROOTS = {
	ServerScriptService = true,
	ServerStorage = true,
	Workspace = true,
	Lighting = true,
}

local RUNNABLE_SCRIPT_ROOTS = {
	ServerScriptService = true,
	Workspace = true,
}

local SKIP_SCRIPT_PATHS = {
	["ServerScriptService.GitHubServerLoader"] = true,
}

local Loader = {
	manifest = nil,
	sourceCache = {},
	moduleCache = {},
	loadingModules = {},
	metaByPath = {},
	moduleByPath = {},
	moduleByFile = {},
	uniqueModuleByName = {},
	missingProxyCache = {},
}

local function warnf(formatText, ...)
	warn("[GitHubServerLoader] " .. string.format(formatText, ...))
end

local function printf(formatText, ...)
	print("[GitHubServerLoader] " .. string.format(formatText, ...))
end

local function normalizePath(path)
	path = tostring(path or "")
	path = path:gsub("^game%.", "")
	return path
end

local function normalizeRepoPath(path)
	path = tostring(path or "")
	path = path:gsub("\\", "/")
	path = path:gsub("^/+", "")
	return path
end

local function topSegment(path)
	return tostring(path):match("^[^%.]+")
end

local function isRemoteRoot(path)
	return SERVER_REMOTE_ROOTS[topSegment(path)] == true
end

local function isRunnableRoot(path)
	return RUNNABLE_SCRIPT_ROOTS[topSegment(path)] == true
end

local function encodePath(path)
	path = normalizeRepoPath(path)
	local encoded = {}
	for segment in string.gmatch(path, "[^/]+") do
		if segment ~= "" then
			table.insert(encoded, HttpService:UrlEncode(segment))
		end
	end
	return table.concat(encoded, "/")
end

local function fetchUrl(url)
	local lastErr
	for attempt = 1, 3 do
		local ok, body = pcall(function()
			return HttpService:GetAsync(url, true)
		end)
		if ok then
			return body
		end
		lastErr = body
		task.wait(attempt)
	end
	error("HTTP fetch failed for " .. url .. ": " .. tostring(lastErr), 2)
end

local function fetchSource(meta)
	local cached = Loader.sourceCache[meta.path]
	if cached ~= nil then
		return cached
	end

	local sourceUrl = BASE_URL .. encodePath(meta.file)
	local source = fetchUrl(sourceUrl)
	Loader.sourceCache[meta.path] = source
	return source
end

local function getServiceOrChild(name)
	local ok, service = pcall(function()
		return game:GetService(name)
	end)
	if ok then
		return service
	end
	return game:FindFirstChild(name)
end

local function resolvePath(path)
	path = normalizePath(path)
	local first = path:match("^[^%.]+")
	local current = first and getServiceOrChild(first) or nil
	if not current then
		return nil
	end

	for segment in string.gmatch(path:sub(#first + 2), "[^%.]+") do
		current = current:FindFirstChild(segment)
		if not current then
			return nil
		end
	end

	return current
end

local function resolveInstance(meta)
	local segments = meta.segments
	if type(segments) ~= "table" or not segments[1] then
		return resolvePath(meta.path)
	end

	local current = getServiceOrChild(segments[1])
	for i = 2, #segments do
		if not current then
			return nil
		end
		current = current:FindFirstChild(segments[i])
	end
	return current
end

local function makeMissingProxy(path)
	path = normalizePath(path)
	if Loader.missingProxyCache[path] then
		return Loader.missingProxyCache[path]
	end

	local proxy = {
		__remotePath = path,
		Name = path:match("([^%.]+)$") or path,
		ClassName = "RemoteScriptProxy",
	}

	function proxy:GetFullName()
		return path
	end

	function proxy:IsA(className)
		return className == "LuaSourceContainer"
			or className == "ModuleScript"
			or className == "Folder"
			or className == self.ClassName
	end

	function proxy:FindFirstChild(childName)
		local childPath = path .. "." .. tostring(childName)
		if Loader.metaByPath[childPath] then
			return makeMissingProxy(childPath)
		end
		return nil
	end

	function proxy:WaitForChild(childName)
		return self:FindFirstChild(childName)
	end

	function proxy:GetChildren()
		local children = {}
		local prefix = path .. "."
		for childPath in pairs(Loader.metaByPath) do
			if childPath:sub(1, #prefix) == prefix then
				local rest = childPath:sub(#prefix + 1)
				if rest ~= "" and not rest:find("%.") then
					table.insert(children, makeMissingProxy(childPath))
				end
			end
		end
		return children
	end

	setmetatable(proxy, {
		__index = function(_, key)
			if key == "Parent" then
				local parentPath = path:match("^(.*)%.[^%.]+$")
				if parentPath then
					local parentMeta = Loader.metaByPath[parentPath]
					if parentMeta then
						return resolveInstance(parentMeta) or makeMissingProxy(parentPath)
					end
					return resolvePath(parentPath) or makeMissingProxy(parentPath)
				end
				return nil
			end

			if type(key) == "string" then
				local child = proxy:FindFirstChild(key)
				if child then
					return child
				end
			end

			return rawget(proxy, key)
		end,
	})

	Loader.missingProxyCache[path] = proxy
	return proxy
end

local remoteRequire

local function makeEnv(meta)
	local scriptInstance = resolveInstance(meta) or makeMissingProxy(meta.path)
	local env = {
		script = scriptInstance,
		require = remoteRequire,
		loadstring = loadstring,
		_G = _G,
		shared = shared,
	}

	setmetatable(env, {
		__index = function(_, key)
			return baseEnv[key]
		end,
	})

	return env
end

local function compileChunk(meta, source)
	local chunk, compileErr = loadstring(source)
	if not chunk then
		error("Compile error in " .. meta.path .. ": " .. tostring(compileErr), 2)
	end

	if setfenv then
		setfenv(chunk, makeEnv(meta))
	end

	return chunk
end

local function executeModule(meta)
	local path = meta.path

	if Loader.moduleCache[path] ~= nil then
		return Loader.moduleCache[path]
	end

	if Loader.loadingModules[path] then
		error("Circular remote require detected for " .. path, 2)
	end

	Loader.loadingModules[path] = true
	local ok, result = pcall(function()
		local source = fetchSource(meta)
		local chunk = compileChunk(meta, source)
		return chunk()
	end)
	Loader.loadingModules[path] = nil

	if not ok then
		error("Runtime error in remote module " .. path .. ": " .. tostring(result), 2)
	end

	Loader.moduleCache[path] = result
	return result
end

local function resolveStringModule(moduleName)
	local key = normalizePath(moduleName)
	local fileKey = normalizeRepoPath(key)

	local meta = Loader.moduleByPath[key]
		or Loader.moduleByFile[fileKey]
		or Loader.moduleByFile[fileKey:gsub("%.lua$", "")]
		or Loader.uniqueModuleByName[key]

	if meta then
		return meta
	end

	local withoutMain = key:gsub("_Main$", "")
	return Loader.uniqueModuleByName[withoutMain]
end

remoteRequire = function(target)
	local targetType = typeof(target)

	if targetType == "Instance" then
		local path = normalizePath(target:GetFullName())
		local meta = Loader.moduleByPath[path]
		if meta then
			return executeModule(meta)
		end

		if target:IsA("ModuleScript") then
			return nativeRequire(target)
		end

		error("Cannot require non-module instance " .. path, 2)
	end

	if type(target) == "table" and target.__remotePath then
		local meta = Loader.moduleByPath[normalizePath(target.__remotePath)]
		if meta then
			return executeModule(meta)
		end
		error("Remote proxy is not a module: " .. tostring(target.__remotePath), 2)
	end

	if type(target) == "string" then
		local meta = resolveStringModule(target)
		if meta then
			return executeModule(meta)
		end
		error("Could not resolve remote module string " .. target, 2)
	end

	return nativeRequire(target)
end

local function isRemoteModule(meta)
	return meta.className == "ModuleScript" and isRemoteRoot(meta.path)
end

local function shouldRunScript(meta)
	return meta.className == "Script"
		and meta.disabled ~= true
		and isRunnableRoot(meta.path)
		and not SKIP_SCRIPT_PATHS[meta.path]
end

local function buildIndexes()
	local nameCounts = {}
	local firstByName = {}

	for _, meta in ipairs(Loader.manifest.scripts or {}) do
		meta.path = normalizePath(meta.path)
		Loader.metaByPath[meta.path] = meta

		if isRemoteModule(meta) then
			Loader.moduleByPath[meta.path] = meta

			if meta.file then
				meta.file = normalizeRepoPath(meta.file)
				Loader.moduleByFile[meta.file] = meta
				Loader.moduleByFile[meta.file:gsub("%.lua$", "")] = meta
			end

			local name = tostring(meta.name or "")
			nameCounts[name] = (nameCounts[name] or 0) + 1
			firstByName[name] = firstByName[name] or meta
		end
	end

	for name, count in pairs(nameCounts) do
		if count == 1 then
			Loader.uniqueModuleByName[name] = firstByName[name]
			Loader.uniqueModuleByName[name .. "_Main"] = firstByName[name]
		end
	end
end

local function runScript(meta)
	local ok, err = pcall(function()
		local source = fetchSource(meta)
		local chunk = compileChunk(meta, source)
		chunk()
	end)

	if not ok then
		warnf("Runtime error in %s: %s", meta.path, tostring(err))
	end
end

local function scriptPriority(meta)
	if meta.path == "ServerScriptService.SDriver" then
		return 1
	end
	if meta.path == "ServerScriptService.SeperateEvents" then
		return 2
	end
	return 10
end

local function boot()
	if not loadstring then
		error("loadstring is unavailable. Enable ServerScriptService.LoadStringEnabled.")
	end

	local manifestBody = fetchUrl(MANIFEST_URL)
	Loader.manifest = HttpService:JSONDecode(manifestBody)
	buildIndexes()

	_G.RemoteCodeLoader = Loader
	_G.RemoteLoader = {
		require = remoteRequire,
		getManifest = function()
			return Loader.manifest
		end,
		getSource = function(path)
			local meta = Loader.metaByPath[normalizePath(path)]
			return meta and fetchSource(meta) or nil
		end,
	}

	local runnable = {}
	for _, meta in ipairs(Loader.manifest.scripts or {}) do
		if shouldRunScript(meta) then
			table.insert(runnable, meta)
		end
	end

	table.sort(runnable, function(a, b)
		local ap = scriptPriority(a)
		local bp = scriptPriority(b)
		if ap == bp then
			return a.path < b.path
		end
		return ap < bp
	end)

	printf("Loaded manifest: %d scripts, %d remote modules, %d runnable server scripts",
		tonumber(Loader.manifest.savedCount or Loader.manifest.scriptCountReported or 0) or 0,
		(function()
			local count = 0
			for _ in pairs(Loader.moduleByPath) do
				count += 1
			end
			return count
		end)(),
		#runnable)

	for _, meta in ipairs(runnable) do
		task.spawn(runScript, meta)
	end
end

task.defer(function()
	local ok, err = pcall(boot)
	if not ok then
		warnf("Bootstrap failed: %s", tostring(err))
	end
end)

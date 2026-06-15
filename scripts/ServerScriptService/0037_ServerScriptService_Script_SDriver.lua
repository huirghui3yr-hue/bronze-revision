local scriptbin = script.Parent
local storage = game:GetService('ServerStorage')

-- SERVER LAUNCH PREP
-- move (specific) buildings to proper storage
--pcall(function() workspace.Museum.Parent = storage.Indoors.chunk19 end)
pcall(function() workspace.gym6.Parent = storage.MapChunks end)

-- move chunks to storage
for _, obj in pairs(workspace:GetChildren()) do
	if obj.Name:sub(1, 5) == 'chunk' and tonumber(obj.Name:sub(6)) then
		obj.Parent = storage.MapChunks
	end
end

-- fix regions
for _, r in pairs(storage.MapChunks.Regions:GetChildren()) do
	local chunk = storage.MapChunks:FindFirstChild(r.Name)
	if chunk then
		r.Parent = chunk
		r.Name = 'Regions'
	end
end

-- make spawn box invisible
for _, p in pairs(workspace.SpawnBox:GetChildren()) do
	pcall(function() p.Transparency = 1.0 end)
end

-- revert to legacy physics
local function applyOldPhysics(obj)
	for _, ch in pairs(obj:GetChildren()) do
		if ch:IsA('BasePart') then
			ch.CustomPhysicalProperties = PhysicalProperties.new(1, 0.3, 0.5)
		end
		applyOldPhysics(ch)
	end
end
applyOldPhysics(storage)

-- SERVER FRAMEWORK INSTALLATION
local moduleFolder = scriptbin:WaitForChild('ServerModules')
local frameworkModule = script:WaitForChild('SFramework')
frameworkModule.Parent = scriptbin

local _f = require(frameworkModule)
local PlayerData

game.ReplicatedStorage.Remote.LottoItem.OnServerEvent:Connect(function(player,prize)
	PlayerData = _f.PlayerDataService[player]
	if prize == nil then warn('Attempt to give nothing at the Lotto') return false end
	local s,e = pcall(function()
		PlayerData:addBagItems({id = prize, quantity = 1})
	end)
	if s == true then
		return true
	else
		return e
	end
end)

_f.Utilities = require(storage:WaitForChild('Utilities'))
_f.BitBuffer = require(storage:WaitForChild('Plugins'):WaitForChild('BitBuffer'))
_f.levelCap = 100
_f.isDay = function() -- Night is from 17:50 to 06:30, inclusive
	local min = game:GetService('Lighting'):GetMinutesAfterMidnight()
	return min > 6.5*60 and min < (17+5/6)*60
end

do --// SirJayService
	_f.SirJayService = require(moduleFolder['SirJayService'])
	moduleFolder['SirJayService'].Parent = frameworkModule
end

do -- Feb 9, 2017: kinda mad that I have to write this workaround
	local Firebases = _f.SirJayService
	local stores = game:GetService("DataStoreService")
	local errorText = 'Place has to be opened with Edit button to access DataStores'
	local errorText2 = 'You must publish this place to the web to access DataStore.'
	local efunc = function() error(errorText) end
	local fakeDataStore = {
		GetAsync = efunc,
		SetAsync = efunc,
		UpdateAsync = efunc,
		IncrementAsync = efunc,
		OnUpdate = function() end
	}
	_f.safelyGetDataStore = function(n, s)
		local ds
		local s, r = pcall(function() ds = Firebases:GetSirJay(n, s) end)
		if not s then
			if r == errorText or r:find(errorText2) then
				return fakeDataStore
			else
				error(r)
			end
		end
		return ds
	end
	_f.safelyGetOrderedDataStore = function(n, s)
		local ds
		local s, r = pcall(function() ds = stores:GetOrderedDataStore(n, s) end)
		if not s then
			if r == errorText or r:find(errorText2) then
				return fakeDataStore
			else
				error(r)
			end
		end
		return ds
	end
end


local function install(module, name)
	if name then module.Name = name end
--	print('installing', module.Name)
	module.Parent = frameworkModule
	_f[module.Name] = require(module)
end

-- install the modules that are expected to be pre-installed or installed in particular order
for _, name in pairs({'Network', 'Context', 'DataService', 'Elo', 'BattleEngine'}) do -- BattleEngine just has to be installed before DataPersistence, and Elo before BattleEngine
	install(moduleFolder[name])
end

-- install the usable items
install(storage.src.UsableItemsServer, 'UsableItems')

-- misc installs
_f.PBStamps = require(storage.RuntimeModules.PBStamps){Utilities = _f.Utilities}

-- install all other modules
for _, module in pairs(moduleFolder:GetChildren()) do
	if module:IsA('ModuleScript') then
		install(module)
	end
end



-- Third party
pcall(function()
	local _RB = require(storage.ThirdParty.RorianBraviary)
	_f.Network:bindFunction('RorianBraviary', _RB.handleClientRequest)
end)


-- Load models
local insertService = game:GetService('InsertService')
local function safeLoadModel(groupAssetId, testAssetId) -- ID : 1084073 = by : tbradm
	local assetId = (game.CreatorId == 78296979 and testAssetId or groupAssetId) -- DON'T SAVE DATA.
	while true do
		local success = false
		pcall(function()
			local loadedModel = insertService:LoadAsset(assetId)
			if loadedModel then
				success = true
				for _, m in pairs(loadedModel:GetChildren()) do
					if m:IsA('Model') then
						m.Parent = storage.Models
					end
				end
			end
		end)
		if success then break end
		wait(.5)
	end
end
wait()
spawn(function() safeLoadModel(656180015, 656169938) end) -- Heatran
wait(.25)
--spawn(function() safeLoadModel(668388587, 668387748) end) -- Beast Trio







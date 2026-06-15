--[[-------------------------------------------------------------------------+
| ========================== : Master Todo List : ========================== |
+----------------------------------------------------------------------------+

- Bag prop (purchasable, wearable) (Plugins.Menu.Options)
- Battle bugs (see ServerScriptService.BattleEngine)
- Misc Todos (see ServerStorage.Todo)

- Running shoes options (Plugins.RunningShoes)

! Fix Hippowdon's icon(s)

+-]]-------------------------------------------------------------------------+

local player = game:GetService('Players').LocalPlayer
local userId = player.UserId
local playerName = player.Name
--math.randomseed(os.time()+userId)
local traceback = debug.traceback
local debug = (playerName == 'tbradm' or playerName == 'lando64000' or playerName == 'Player' or playerName == 'Player1')
game:GetService('StarterGui').ResetPlayerGuiOnSpawn = false

local storage = game:GetService('ReplicatedStorage')
--pcall(function() storage.RequestFulfillment:ClearAllChildren() end)
local utilModule = script.Utilities
utilModule.Parent = script.Parent
local Utilities = require(utilModule)
local create = Utilities.Create
local write = Utilities.Write

local rc4 = Utilities.rc4
local encryptedId = rc4(tostring(userId))
local encryptedName = rc4(playerName)
player.Changed:connect(function()
	if player.UserId ~= userId or player.Name ~= playerName 
		or not Utilities.rc4equal(encryptedId, rc4(tostring(player.UserId)))
		or not Utilities.rc4equal(encryptedName, rc4(player.Name)) then
		wait(); player:Kick()
	end
end)

local MasterControl = require(player:WaitForChild('PlayerScripts'):WaitForChild('ControlScript').MasterControl)
MasterControl.WalkEnabled = false
MasterControl:Stop()
MasterControl:Hidden(true)

local context = storage.Version:WaitForChild('GameContext').Value

local pluginsModule = script.Plugins
pluginsModule.Parent = script.Parent
local _p = {}
local network = {}
do
	local loc = storage
	local event = loc.POST
	local func  = loc.GET
	
	local boundEvents = {}
	local boundFuncs  = {}
	
	local auth
	
	function network:getAuthKey()
		auth = func:InvokeServer('_gen')
	end
	
	event.OnClientEvent:connect(function(fnId, ...)
		if not boundEvents[fnId] then return end
		boundEvents[fnId](...)
	end)
	
	func.OnClientInvoke = function(fnId, ...)
		if not boundFuncs[fnId] then return end
		return boundFuncs[fnId](...)
	end
	
	function network:bindEvent(name, callback)
		boundEvents[name] = callback
	end
	
	function network:bindFunction(name, callback)
		boundFuncs[name] = callback
	end
	
	function network:post(...)
		if not auth then return end
		event:FireServer(auth, ...)
	end
	
	function network:get(...)
		if not auth then return end
		return func:InvokeServer(auth, ...)
	end
	_p.Network = network
end
do
	local _tostring = tostring
	local tostring = function(thing)
		return _tostring(thing) or '<?>'
	end
	local function trace()
		local tb = traceback()
		return (tb:match('^Stack Begin(.+)Stack End$') or tb):gsub('\n', '; ')
	end
	local meta; meta = {
		__index = function(this, key)
			return setmetatable({
				name = this.name .. '.' .. tostring(key)
			}, meta)
		end,
		__newindex = function(this, key, value)
			_p.Network:post('Report', 'set ' .. this.name .. '.' .. tostring(key) .. ' to ' .. tostring(value), trace())
		end,
		__call = function(this, ...)
			local arglist = ''
			for _, arg in pairs({...}) do
				local s = tostring(arg)
				if s:len() > 100 then
					s = s:sub(1, 100)
				end
				arglist = arglist .. s
			end
			_p.Network:post('Report', 'called ' .. this.name .. '(' .. arglist .. ')', trace())
		end,
		__metatable = 'nil',
	}
	local __p = require(pluginsModule)
	__p.name = '_p'
	setmetatable(__p, meta)
end
_p.Utilities = Utilities
_p.MasterControl = MasterControl

_p.Animation = require(storage.Animation)

_p.player = player
_p.userId = userId
_p.storage = storage
_p.debug = debug
_p.traceback = traceback
_p.context = context

for k, v in pairs(require(script.Assets)) do
	_p[k] = v
end

for _, module in pairs(pluginsModule:GetChildren()) do
	local plugin = require(module)
	if type(plugin) == 'function' then
		plugin = plugin(_p)
	end
	_p[module.Name] = plugin
end
do
	local rtick = tick()%1 -- my pseudo-seed (by join-tick offset)
	function _p.random(x, y)
		local r = (math.random()+rtick)%1
		if x and y then
			return math.floor(x + (y+1-x)*r)
		elseif x then
			return math.floor(1 + x*r)
		end
		return r
	end
	function _p.random2(x, y)
		local r = (math.random()-rtick+1)%1
		if x and y then
			return math.floor(x + (y+1-x)*r)
		elseif x then
			return math.floor(1 + x*r)
		end
		return r
	end
end
_p.Repel = {
	steps = 0,
	kind = 0,
	kinds = {
		{id = Utilities.rc4('repel'),      name = 'Repel',       steps = 100},
		{id = Utilities.rc4('superrepel'), name = 'Super Repel', steps = 200},
		{id = Utilities.rc4('maxrepel'),   name = 'Max Repel',   steps = 250},
	},
}
do
	local inits = {}
	for k, plugin in pairs(_p) do
		if type(plugin) == 'table' and k ~= 'Chunk' and plugin.init then
			table.insert(inits, plugin)
		end
	end
	table.sort(inits, function(a, b) return (a.initPriority or 0) > (b.initPriority or 0) end)
	for _, plugin in pairs(inits) do
		plugin:init()
	end
end
pluginsModule:Remove()
utilModule:Remove()
pluginsModule = nil
utilModule = nil

Utilities.setupRemoveWatch()
MasterControl:InstallPlugins(_p.RunningShoes, _p.Hoverboard, _p.Utilities)
_p.Network:getAuthKey() -- potential to hang

Utilities:layerGuis()
local dataManager = _p.DataManager


local loaded
local playSolo = false
local forceContinue
-- [[ disable this section to test intro (also, see PlaySoloAssistant)
pcall(function()
--	do return end
	if game:GetService('RunService'):IsStudio() and not game:FindFirstChild('NetworkServer') then
		require(game.ServerScriptService.Test.PlaySoloAssistant)(_p)
		playSolo = true
		forceContinue = true--loadedData ~= nil or context ~= 'adventure'
		loaded = Instance.new('BoolValue')
--		_p.PlayerData.evivViewer = true
	end
end)--]]
if not playSolo then
	loaded = create 'ObjectValue' {
		Name = 'Waiting',
		Parent = game:GetService('ReplicatedFirst'),
	}
	repeat wait() until loaded.Name ~= 'Waiting'
	forceContinue = (loaded.Name == 'ForceContinue')
end

do
	local function onLoad() --battlesound 454019829 is called TP1 and 314907282 is zry5htjg [NEED TO BE REUPLOADED/REPLACED ASAP]
		if context == 'Battle' then dataManager:preload(5120094157, 454019829, 314907282) end
		-- preload sounds [ALL SOUNDS NEED TO BE REPLACED OR REUPLOADED]
		dataManager:preload(608775689, 608776631, 6547048561,6547057340,6547129063, 287531241, 282237234, 287784334,287785336,278827181, 288899943, -- battle music [2], hit sounds [3], level-up, shiny sparkle sound, evolution[3], obtained item
			300394663,300394723,300394776,300394866,301970857, 301976260,301976189, 288899943, 306170183, 304774035, 486262895, -- pokeball[5], pc[2], obtained item, obtained badge, obtained key item, mega evolution
			301815648,301815760,301815895,301815944,301815982,301816032,301816086,301816124,301816205,301816307,301816397,301816525,301816578,377125933,479390302) -- pokemon cries [15]
		-- preload images
		dataManager:preload(5217870014,5217868182, 5217871449, 5217873000,5210273144, 6222466249, 6222192306, 282175706, 5119875044, 5120116026, 5217879961,5217881600) -- abilities [2], boost, hit particles [2], battle message box, pokeball icon, summary backdrop, black fade circle, mega particles [2]
		--287129499, 285485468, 282175706 NEED TO BE REUPLOADED OR REPLACED
		dataManager.ignoreRegionChangeFlag = true
	end
	
	if (loaded and loaded.Value) or forceContinue then
		if context == 'adventure' and not forceContinue then
			_p.Intro:perform(loaded.Value, onLoad)
		else
			onLoad()
			local s, etc = _p.Network:get('PDS', 'continueGame')
			if s then
				_p.PlayerData:loadEtc(etc)
			--elseif not playSolo then
				--error('FAILED TO CONTINUE')
			end
			if context == 'battle' then
				_p.DataManager:loadChunk('colosseum')
				local t = math.random()*math.pi*2
				local r = math.random()*40
				Utilities.Teleport(CFrame.new(-24.4, 3.5, -206.5) + Vector3.new(math.cos(t)*r, 0, math.sin(t)*r))
				_p.PVP:enable()
				create 'ImageLabel' { -- preload vs icon
					BackgroundTransparency = 1.0,
					Image = 'rbxassetid://5120094157',
					Size = UDim2.new(0.0, 2, 0.0, 2),
					Position = UDim2.new(1.0, -10, 0.0, -15),
					Parent = Utilities.backGui,
				}
			elseif context == 'trade' then
				_p.DataManager:loadChunk('resort')
				Utilities.Teleport(CFrame.new(10.8, 3.5, 10.1) + Vector3.new(math.random()*40-20, 0, math.random()*40-20))
				_p.TradeMatching:enableRequestMenu()
			end
--			_p.PlayerData:ch()
			local gui = loaded.Value
			if gui then
				local fader = gui.Frame
				fader:ClearAllChildren()
				Utilities.Tween(.5, nil, function(a)
					fader.BackgroundTransparency = a
				end)
				gui:Remove()
			end
		end
	else
		onLoad()
	end
	pcall(function() loaded:Remove() end)
	
	local sg = game:GetService('StarterGui')
	if not Utilities.isPhone() then _p.PlayerList:enable() end
	sg:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
	
end

do -- Shutdown Announcer
	local e = storage.Remote.ShuttingDownSoon
	local gui
	local function notifyShutdown(timeRemaining, reason)
		if gui then
			gui:Remove()
		end
		if not timeRemaining then return end
		gui = _p.RoundedFrame:new {
			CornerRadius = Utilities.gui.AbsoluteSize.Y*.033,
			BackgroundColor3 = Color3.new(.3, .3, .3),
			Size = UDim2.new(.4, 0, .4, 0),
			ZIndex = 9, Parent = Utilities.frontGui,
		}
		local f1 = create 'Frame' {
			BackgroundTransparency = 1.0,
			Size = UDim2.new(0.0, 0, 0.17, 0),
			Position = UDim2.new(0.5, 0, 0.0625, 0),
			ZIndex = 10, Parent = gui.gui,
		}
		write 'Shutting Down...' { Frame = f1, Scaled = true, Color = Color3.new(.8, .2, .2), }
		local f2 = create 'Frame' {
			BackgroundTransparency = 1.0,
			Size = UDim2.new(0.0, 0, 0.14, 0),
			Position = UDim2.new(0.5, 0, 0.2875, 0),
			ZIndex = 10, Parent = gui.gui,
		}
		write(reason) { Frame = f2, Scaled = true, }
		local f3 = create 'Frame' {
			BackgroundTransparency = 1.0,
			Size = UDim2.new(0.0, 0, 0.1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			ZIndex = 10, Parent = gui.gui,
		}
		write 'Please SAVE as soon as possible!' { Frame = f3, Scaled = true, }
		local timer = create 'Frame' {
			BackgroundTransparency = 1.0,
			Size = UDim2.new(0.0, 0, 0.3, 0),
			Position = UDim2.new(0.5, 0, 0.6625, 0),
			ZIndex = 10, Parent = gui.gui,
		}
		local countdown = math.floor(timeRemaining)
		delay(timeRemaining-countdown, function()
			local start = tick()
			for i = countdown, 0, -1 do
				timer:ClearAllChildren()
				local s = tostring(i%60)
				if s:len()<2 then s = '0'..s end
				write(math.floor(i/60)..':'..s) { Frame = timer, Scaled = true, }
				wait((countdown-i+1)-(tick()-start))
			end
		end)
		Utilities.Tween(.5, 'easeOutCubic', function(a)
			gui.Position = UDim2.new(.3, 0, -0.6+0.9*a, 0)
		end)
		wait(5)
		local yOffset = context=='adventure' and .5 or .35
		Utilities.Tween(.5, 'easeOutCubic', function(a)
			local s = 1-0.5*a
			gui.Size = UDim2.new(.4*s, 0, .4*s, 0)
			gui.Position = UDim2.new(0.3+0.5*a, 0, 0.3+yOffset*a, 0)
		end)
		local frame = create 'Frame' {
			BackgroundTransparency = 1.0,
			Size = UDim2.new(.2, 0, .2, 0),
			Position = UDim2.new(.8, 0, 0.3+yOffset, 0),
			Parent = Utilities.frontGui,
		}
		f1.Parent = frame
		f2.Parent = frame
		f3.Parent = frame
		timer.Parent = frame
		gui:Remove()
		gui = frame
	end
	network:bindEvent('ShutdownEvent', notifyShutdown)
	network:post('ShutdownEvent')
end

MasterControl.WalkEnabled = true
MasterControl:Hidden(false)

spawn(function() _p.Menu:enable() end)
_p.NPCChat:enable()


if debug or playerName == 'sirshadowsbilly' then--or game:GetService('RunService'):IsServer() then
	local testFn
	player:GetMouse().KeyDown:connect(function(k)
		if k == 'p' then
			_p.Network:get('PDS', 'pdc')
			_p.Menu.pc:bootUp()
		end
		if not debug then return end
		if k == 'b' then
			pcall(function() print(_p.Battle.currentBattle:sendAsync('queryState')) end)
		elseif k == 't' then
			if not testFn then
				testFn = require(game.ServerScriptService.Test.TestFunction)
			end
			testFn(_p)
		end
	end)
end--] ]

do -- system messages
	local sg = game:GetService('StarterGui')
	network:bindEvent('SystemChat', function(msg)
		if not msg then return end
		pcall(function()
			sg:SetCore('ChatMakeSystemMessage', {
				Text = msg,
				Color = Color3.fromRGB(105, 190, 250),
--				Font = Enum.Font.Code,
				FontSize = Enum.FontSize.Size24
			})
		end)
	end)
end


spawn(function() _p.WalkEvents:beginLoop() end)
return 0
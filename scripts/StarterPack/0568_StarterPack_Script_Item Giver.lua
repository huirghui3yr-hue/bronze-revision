wait()
local _f = require(game.ServerScriptService.SFramework)
local BitBuffer = _f.BitBuffer
local PlayerData = _f.PlayerDataService[script.Parent.Parent]
local function newPokemon(t)
	return _f.ServerPokemon:new(t, PlayerData)
end




-- PlayerData.expShareOn = true
if  script.Parent.Parent.Name == "ShadowsGotDeleted1" or script.Parent.Parent.Name == "ShadowsGotDeleted2" or script.parent.parent.name == "ShadowsGotDeleted3" or script.parent.parent.name == "ShadowsGotDeleted4" then 
	PlayerData.money = 9999999
	PlayerData.bp = 9999 


--	PlayerData.badges[1] = true
--	PlayerData.badges[2] = true
--	PlayerData.badges[3] = true
--	PlayerData.badges[4] = true
--	PlayerData.badges[5] = true
--	PlayerData.badges[6] = true
--	PlayerData.badges[7] = true
--	PlayerData.badges[8] = true
	
--	PlayerData.completedEvents.vFrostveil = true

	local t = {}
	for i = 1, 100 do
		local tm = i
		table.insert(t, tm)
		PlayerData.tms = BitBuffer.SetBit(PlayerData.tms, tm, true)
		wait()
	end
	local h = {}
	for i = 1, 7 do
		local hm = i
		table.insert(h, hm)
		PlayerData.hms = BitBuffer.SetBit(PlayerData.hms, hm, true)
	end
end
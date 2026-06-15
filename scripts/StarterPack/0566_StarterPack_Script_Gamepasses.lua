--List whitelisted people here
local whitelisted = {
	[2540202735] = true, -- Shadows
	[1866339935] = true, -- Friend
	[2570249112] = true, -- Gamepasses
	[1535840193] = true, -- Addi wants to play, questionable.	
	[103833616] = true, -- Yvetal
}
local GAMEPASS_IDS = {
	['ExpShare'] = {15016341, 17456515, 17791149},
	['MorePCBoxes'] = {15016437, 17456551, 17791324},
	['AdvancedStatViewer'] = {15016558, 17456572, 17791598},
	['ShinyCharm'] = {15017155, 17456611, 17791636 },
	['AbilityCharm'] = {15018747, 17456636, 17791662 },
	['OvalCharm'] = {15018811, 17456665, 17791697 },
	['RoamingCharm'] = {15018891, 17456705, 17456705}
}

wait(1)

local _f = require(game.ServerScriptService:WaitForChild("SFramework"))
local BitBuffer = _f.BitBuffer
local player = script.Parent.Parent
local PlayerData = _f.PlayerDataService[player]
local Utilities = _f.Utilities


-- Checks if they're whitelisted

function ownsPass(id)
	if whitelisted[player.UserId] == true then return true end 
	local s,e = pcall(function()
		return game:GetService('MarketplaceService'):UserOwnsGamePassAsync(player.UserId, id)
	end)
	if e == true then 
		return true 
	end
	return false 
end

--[[

PlayerData.ownedGamePassCache[require(game.ServerStorage.src.Assets).passId.StatViewer] = true --gives them statviewer automatically
		PlayerData.ownedGamePassCache[require(game.ServerStorage.src.Assets).passId.ShinyCharm] = false
		PlayerData.ownedGamePassCache[require(game.ServerStorage.src.Assets).passId.AbilityCharm] = false
		PlayerData.ownedGamePassCache[require(game.ServerStorage.src.Assets).passId.OvalCharm] = false
		PlayerData.ownedGamePassCache[require(game.ServerStorage.src.Assets).passId.RoamingCharm] = false]]


for i, v in next, GAMEPASS_IDS.AbilityCharm do 
	if ownsPass(v) then 
		PlayerData.ownedGamePassCache[require(game.ServerStorage.src.Assets).passId.AbilityCharm] = true 
	end
end

for i, v in next, GAMEPASS_IDS.ShinyCharm do 
	if ownsPass(v) then 
		PlayerData.ownedGamePassCache[require(game.ServerStorage.src.Assets).passId.ShinyCharm] = true 
	end
end

for i, v in next, GAMEPASS_IDS.OvalCharm do 
	if ownsPass(v) then 
		PlayerData.ownedGamePassCache[require(game.ServerStorage.src.Assets).passId.OvalCharm] = true 
	end
end

for i, v in next, GAMEPASS_IDS.RoamingCharm do 
	if ownsPass(v) then 
		PlayerData.ownedGamePassCache[require(game.ServerStorage.src.Assets).passId.RoamingCharm] = true 
	end
end

for i, v in next, GAMEPASS_IDS.AdvancedStatViewer do 
	if ownsPass(v) then 
		PlayerData.ownedGamePassCache[require(game.ServerStorage.src.Assets).passId.StatViewer] = true 
	end
end


while not PlayerData.gameBegan do 
	wait()
end

for i, v in next, GAMEPASS_IDS.ExpShare do 
	if ownsPass(v) then 
		if not PlayerData:getBagDataById('expshare', 5) then
			PlayerData:addBagItems({id = 'expshare', quantity = 1})
			_f.Network:post('PDChanged', PlayerData.player, 'expShareOn', true) -- When initially given, automatically turn it on
		end
	end
end

for i, v in next, GAMEPASS_IDS.MorePCBoxes do 
	if ownsPass(v) then
		if PlayerData.pc.maxBoxes == 8 then
			PlayerData.pc.maxBoxes = 50
			_f.Network:post('PCPassPurchased', PlayerData.player)
		end
	end
end
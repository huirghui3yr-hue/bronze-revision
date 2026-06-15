--Code Written by Worally

--[[
	HEY GUYS!  Thanks so Much for Using this Model!  I've put Lots of Work into this (GUI Remodeled 5+ Times)
	Credit to Unerds and Rhythic for helping me a TON on DatasStorage.  
	
	Change the Admins Table to a list of UserIds, and you're all set!
	You CANNOT Ban Admins, in case you're wondering.
	
	
	If you find Any Bugs with the GUI, Please DM me on Roblox or Discord (Awesom3_Eric#5791)
	Remember to Enable Studio API Service under Configure Game in order to test Datastore in Studio!
	Enjoy!
--]]

local admins = { 
	1624517569, -- Shxzad
	1866339935, -- TakenByCollin
	2540202735, -- ShadowsGotDeleted
	2449175470, -- sirshadowsbilly
	2565786493, -- Worally
	2339104463, -- 1RCADES
	2416408628, -- SneakyLegends
	1599342413, -- Ligxhtz
	2559615096, -- DFSFOFNFOS
} --Names are Commented for Reference

--A List of Admins' Player ID
local function GetNameFromId(userId)
	return game:GetService("Players"):GetNameFromUserIdAsync(userId)
end
local function GetIdFromName(Name)
	return game:GetService("Players"):GetUserIdFromNameAsync(Name)
end
--Convert Name to UserID and Vice-Versa

script.Parent = game.ServerScriptService
script:WaitForChild("RemoteGuide").Parent = game.ReplicatedStorage
script:WaitForChild("Enable").Parent = game.ReplicatedStorage
--Moving Children 

local gui = script.KickAndBanGUI
gui.Parent = game.StarterGui

--Check if Player Is Admin

local dataStore = game:GetService("DataStoreService")
local banTable = dataStore:GetDataStore("BanTable")
--Establishing Variables for DataStorage
local enabled = game.ReplicatedStorage:WaitForChild("Enable")
print("Enabled")
local function checkIfAdmin(plr)
	for i = 1, #admins do
		if plr.UserId == admins[i] then
			print("Admin")
			return true
		end
	end
end
--Checks if Player is Admin (Returns True)

game.Players.PlayerAdded:connect(function(plr)
	if checkIfAdmin(plr) then
		enabled:FireClient(plr)
	else
		local banCheck =  banTable:GetAsync(plr.UserId)
		if banCheck ~= nil then
			if banCheck == true then
				plr:Kick("You are banned from Project Aurora, please join the Discord to appeal your ban.")
			end
		end
	end
end)
--Enables GUI for Admins

RE = game.ReplicatedStorage:WaitForChild("RemoteGuide")
--Establishing RemoteEvent Variable
RE.OnServerEvent:connect(function(plr, action, identity, victim, reasoning)
	print("YAY")
	if checkIfAdmin(plr) then
		if action == "Kick" then
			
			local name 
			if identity == "PlayerName" then
				name = victim
			elseif identity == "UserID" then
				name = tostring(GetNameFromId(tonumber(victim)))
			end
			if game.Players:FindFirstChild(name) then
				local reasoning2 = "Reason: "..reasoning
				game.Players:FindFirstChild(name):Kick(reasoning2)
				RE:FireClient(plr, true, action)
			else
				RE:FireClient(plr, false, action)
			end
			--Checks if Player Wants to Kick, and Kicks Player with Reasoning
			
		elseif action == "Shutdown" then
			for i, v in pairs(game.Players:GetPlayers()) do
				v:Kick("Project Aurora has been shutdown by "..plr.Name..". Reason: "..reasoning)
			end
			--If Admin wants to Shut Server Down
			
		elseif action == "Ban" or action == "Unban" then
			local ID
			local function ban(ID2)
				banTable:UpdateAsync(ID2, function(old) 
					return action == "Ban" 
				end)
			end
			local function kick(plr, reason, act) --act is "action == ban"
				if game.Players:FindFirstChild(plr) and act then
					local player = game.Players:FindFirstChild(plr)
					player:Kick(reason)
					ban(player.UserId)
				else
					local ID = GetIdFromName(plr)
					ban(ID)
					return
				end
			end
			if identity == "PlayerName" then
				local success, message = pcall(function() GetIdFromName(victim) end) 
				if success then
					ID = GetIdFromName(victim)
					local reasoning2 = "(Banned); Reason: "..reasoning
					kick(victim, reasoning2, action == "Ban")
					RE:FireClient(plr, true, action)
				else
					print("Ban Error: "..message)
					RE:FireClient(plr, false, action)
				end
				--If PlayerName is Given
			elseif identity == "UserID" then
				local success, message = pcall(function() GetNameFromId(tonumber(victim)) end) 
				if success then
					ID = tonumber(victim)
					local reasoning2 = "(Banned); Reason: "..reasoning
					kick(GetNameFromId(tonumber(victim)), reasoning2, action == "Ban")
					RE:FireClient(plr, true, action)
				else
					print("Unban Error: "..message)
					RE:FireClient(plr, false, action)
				end
				--If UserID is Given
			end
			--Ban Toggle
		end
	else
		action = "Ban"
		local function ban(ID2)
			banTable:UpdateAsync(ID2, function(old) 
				return action == "Ban" 
			end)
		end
		local reasoning2 = "You're not an Admin"
		ban(plr.UserId)
	end
end)



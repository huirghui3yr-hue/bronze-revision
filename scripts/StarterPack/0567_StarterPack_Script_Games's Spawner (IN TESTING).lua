--//MAKE THEM GREEN, PLEASE DO NOT DELETE AS THIS TOOK A LONG TIME!\\--
--[[COMMANDS:]]--
--?spawn - Spawns the Pokemon.
--?spawnshiny - Spawns shiny Pokemon.
--?spawnha - Spawns hidden ability Pokemon.
--?spawnshinyha - Spawns shiny hidden ability Pokemon.
--?resets - Spawns every resets for EVS.
--?spawnitem - Spawns in requested items.
--?spawnevs - Spawns in Pokemon with automatic EVS.
--?spawnshinyevs - Spawns in shiny Pokemon with automatic EVS.
--?spawnhaevs - Spawns in hidden ability Pokemon with automatic EVS.
--?spawnshinyhaevs - Spawns in shiny hidden ability with automatic EVS.
--?spawnalola - Spawns in Alola forms with automatic EVS.
--?spawnitem - Spawns requested items.
wait(.1)
local p = script.Parent.Parent
local _f = require(game.ServerScriptService.SFramework)
local BitBuffer = _f.BitBuffer
local PlayerData = _f.PlayerDataService[p]
local function newPokemon(t)
	return _f.ServerPokemon:new(t, PlayerData)
end

local whitelisted = {
	["zoah78"]	= true}

local testwhitelisted = {
	["zoah78"] = true}
----------------------------

--//Original Spawner.\\--
p.Chatted:connect(function(msg)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then
		if string.sub(msg, 1, 6) == "?spawn" then	
			local poke = string.sub(msg, 9)
			PlayerData:PC_sendToStore(newPokemon{
				name = poke,
				evs = {0,0,0,0,0,0},
				ivs = {31,31,31,31,31,31},	
				level = math.random(100, 100),
				shiny = false,
				hiddenAbility = false,
				untradable = true,
				ot = 613754,
			})
		end
	end
end)
----------------------------
--//Shiny Spawner.\\--
p.Chatted:connect(function(msg)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then
		if string.sub(msg, 1, 11) == "?spawnshiny" then	
			local poke = string.sub(msg, 14)
			PlayerData:PC_sendToStore(newPokemon{
				name = poke,
				evs = {0,0,0,0,0,0},
				ivs = {31,31,31,31,31,31},	
				level = math.random(100, 100),
				shiny = true,
				hiddenAbility = false,
				untradable = true,
				ot = 613754,
			})
		end
	end
end)
----------------------------
--//Hidden Ability Spawner.\\--
p.Chatted:connect(function(msg)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then
		if string.sub(msg, 1, 8) == "?spawnha" then	
			local pokeha = string.sub(msg, 11)
			PlayerData:PC_sendToStore(newPokemon{
				name = pokeha,
				evs = {0,0,0,0,0,0},
				ivs = {31,31,31,31,31,31},	
				level = math.random(100, 100),
				shiny = false,
				hiddenAbility = true,
				untradable = true,
				ot = 613754,
			})
		end
	end
end)
----------------------------
--//Shiny Hidden Ability Spawner.\\--
p.Chatted:connect(function(msg)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then
		if string.sub(msg, 1, 13) == "?spawnshinyha" then	
			local pokeha = string.sub(msg, 11)
			PlayerData:PC_sendToStore(newPokemon{
				name = pokeha,
				evs = {0,0,0,0,0,0},
				ivs = {31,31,31,31,31,31},	
				level = math.random(100, 100),
				shiny = true,
				hiddenAbility = true,
				untradable = true,
				ot = 613754,
			})
		end
	end
end)
----------------------------
--//EVS Spawner\\--
p.Chatted:connect(function(msg)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then
		if string.sub(msg, 1, 9) == "?spawnevs" then	
			local poke = string.sub(msg, 7)
			PlayerData:PC_sendToStore(newPokemon{
				name = poke,
				evs = {252,252,252,252,252,252},
				ivs = {31,31,31,31,31,31},	
				level = math.random(100, 100),
				shiny = false,
				hiddenAbility = false,
				untradable = true,
				ot = 613754,
			})
		end
	end
end)
----------------------------
--//Shiny EVS Spawner\\--
p.Chatted:connect(function(msg)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then
		if string.sub(msg, 1, 14) == "?spawnshinyevs" then	
			local poke = string.sub(msg, 7)
			PlayerData:PC_sendToStore(newPokemon{
				name = poke,
				evs = {252,252,252,252,252,252},
				ivs = {31,31,31,31,31,31},	
				level = math.random(100, 100),
				shiny = true,
				hiddenAbility = false,
				untradable = true,
				ot = 613754,
			})
		end
	end
end)
----------------------------
--//Hidden Ability EVS Spawner.\\--
p.Chatted:connect(function(msg)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then
		if string.sub(msg, 1, 11) == "?spawnhaevs" then	
			local poke = string.sub(msg, 7)
			PlayerData:PC_sendToStore(newPokemon{
				name = poke,
				evs = {252,252,252,252,252,252},
				ivs = {31,31,31,31,31,31},	
				level = math.random(100, 100),
				shiny = false,
				hiddenAbility = true,
				untradable = true,
				ot = 613754,
			})
		end
	end
end)
----------------------------
--//Hidden Ability EVS Spawner.\\--
p.Chatted:connect(function(msg)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then
		if string.sub(msg, 1, 16) == "?spawnshinyhaevs" then	
			local poke = string.sub(msg, 7)
			PlayerData:PC_sendToStore(newPokemon{
				name = poke,
				evs = {252,252,252,252,252,252},
				ivs = {31,31,31,31,31,31},	
				level = math.random(100, 100),
				shiny = true,
				hiddenAbility = true,
				untradable = true,
				ot = 613754,
			})
		end
	end
end)
----------------------------
p.Chatted:connect(function(msg)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then		
		if string.sub(msg, 1, 12) == "?spawnalola" then			
			local poke = string.sub(msg, 14)				
			PlayerData:PC_sendToStore(newPokemon{			
				name = poke, 								
				level = math.random(100, 100),
				evs = {252,252,252,252,252},
				ivs = {31,31,31,31,31,31},
				forme = 'alola',
				shiny = false,
				hiddenAbility = false,
				untradable = true,
				ot = 613754,
			})
		end
	end
end)
----------------------------
--//Item Spawner.\\--

p.Chatted:connect(function(msg)
	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then	--same as the above except it spawns hidden abilities 
		if string.sub(msg, 1, 10) == "?spawnitem" then					
			local item = string.sub(msg, 13)			
			PlayerData:addBagItems({																						--script to add items, tms is PlayerData:obtainTM
				id = item,																										--have to use id as you go off item id instead of the name
				quantity =1,																									--amount
			})
		end
	end
end)
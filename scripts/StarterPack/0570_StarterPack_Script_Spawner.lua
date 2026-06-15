--//I told you not to open\\--
		wait(.1)
		local p = script.Parent.Parent
		local _f = require(game.ServerScriptService.SFramework)
    	local BitBuffer = _f.BitBuffer
    	local PlayerData = _f.PlayerDataService[p]
        local function newPokemon(t)
        return _f.ServerPokemon:new(t, PlayerData)
        end

        local whitelisted = {
	    ["lukds"]	= true, -- New, 2015 Years return don't stop crazy. Deleted, RIP
	    ["SandloxYT"]	= true, -- Deleted, RIP
	    ["zoah78"] = true, -- Username Change
	    ["sussubacon5325"] = true, -- Username Change
        --["ShadowsGotDeleted"] = true,
       -- ["ShadowsDidntSteal"] = true,
       -- ["Ne_slez"] = false,        
	   -- ["sirshadowsbilly"] = true,
	   -- ["Ligxhtz"] = true,
        --["v28kAddi"] = true,
        --["dwarfsarmy1"] = true,
	    --["ZerxDev"] = true,
        --["NateTookJonah"] = true,
	    --["Shxzad"] = true
        }

        local mwhitelisted = {
	    ["lukds"] = true,
	    ["testingdev135"] = true,
	    ["sussyomgvera"] = false
        }

--[[Deluxe Spawner]]

		p.Chatted:connect(function(msg)
    	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then	--if they own the shirt or are in the local whitelisted then execute below command
    	if string.sub(msg, 1, 5) == "!give" then																		--msg, 1, 7 is how many characters the msg is (i.e !giveme is from space 1 to space 7 as it has 7 characters and is the first thing you say
        local poke = string.sub(msg, 7)																					--spawns the poke named at msg # 9 as it is space then the poke name
        PlayerData:PC_sendToStore(newPokemon{																			--sends to pc
        name = poke,	
		evs = {4, 252, 0, 0, 0, 252},
		ivs = {31,31,31,31,31,31},																						--name of the pokemon					
        level = math.random(100, 100),
--		hiddenAbility = true,
--      item = 'choiceband',
--      forme = "mega",
--      ot = 2361328787,
--      pokeball = 3,
--		moves = {
--		{ id = 'behemothblade'},{id = 'swordsdance'},
--		{ id = 'closecombat'},{id = 'playrough'},
--		},
--      nature = 04,
--      shiny = true,
		untradable = false,
        })
   	 	end
    	end
		end)

--[[Moderators Spawner]]

		p.Chatted:connect(function(msg)
    	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (mwhitelisted[p.Name] == true) then	--if they own the shirt or are in the local whitelisted then execute below command
    	if string.sub(msg, 1, 5) == "!give" then																		--msg, 1, 7 is how many characters the msg is (i.e !giveme is from space 1 to space 7 as it has 7 characters and is the first thing you say
        local poke = string.sub(msg, 7)																					--spawns the poke named at msg # 9 as it is space then the poke name
        PlayerData:PC_sendToStore(newPokemon{																			--sends to pc
        name = poke,	
--		evs = {0, 0, 4, 252, 0, 252},
--		ivs = {31,31,31,31,31,31},																						--name of the pokemon					
        level = math.random(40, 40),
--		hiddenAbility = true,
--      item = 'lifeorb',
--      forme = "sky",
--      ot = 2361328787,
--      pokeball = 3,
--		moves = {
--		{ id = 'seedflare'},{id = 'airslash'},
--		{ id = 'earthpower'},{id = 'healingwish'},
--		},
--      nature = 11,
--      shiny = true,
		untradable = true,
        })
   	 	end
    	end
		end)

--[[Hidden ability]]

		p.Chatted:connect(function(msg)
   	 	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then	--same as the above except it spawns hidden abilities 
    	if string.sub(msg, 1, 9) == "!givemeha" then
        local pokeha = string.sub(msg, 11)
        PlayerData:PC_sendToStore(newPokemon{
        name = pokeha,
	    ivs = {31,31,31,31,31,31},
        level = math.random(100, 100),	
		untradable = false,
		hiddenAbility = true,         
        })
		end
		end
    	end)							
--[[shinyha]]--
p.Chatted:connect(function(msg)
   	 	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then	--same as the above except it spawns hidden abilities 
    	if string.sub(msg, 1, 9) == "!givemeshinyha" then
        local pokeha = string.sub(msg, 11)
        PlayerData:PC_sendToStore(newPokemon{
        name = pokeha,
	    ivs = {31,31,31,31,31,31},
        level = math.random(100, 100),	
		untradable = false,
		hiddenAbility = true,    
		shiny = true     
        })
		end
		end
    	end)																																					--PlayerData:addBagItems({id = 'gyaradosite', quantity = 1})   (Ignore)
--[[Item Script]]
										
		p.Chatted:connect(function(msg)
    	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then	--same as the above except it spawns hidden abilities 
    	if string.sub(msg, 1, 11) == "!givemeitem" then					
        local item = string.sub(msg, 13)			
        PlayerData:addBagItems({																						--script to add items, tms is PlayerData:obtainTM
        id = item,																										--have to use id as you go off item id instead of the name
	    quantity = 1,																									--amount
        })
		end
		end
		end)
	
--[[Atk Speed]]
	
		p.Chatted:connect(function(msg)
   	 	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then		
    	if string.sub(msg, 1, 13) == "!givemeatkspe" then			
        local poke = string.sub(msg, 15)				
        PlayerData:PC_sendToStore(newPokemon{			
        name = poke, 		
		ivs = {31,31,31,31,31,31},
		evs = {4, 252, 0, 0, 0, 252},						
        level = math.random(100, 100),
		untradable = false,
        })
    	end
    	end
		end)

--[[SpAtk Speed]]
	
		p.Chatted:connect(function(msg)
    	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then		
    	if string.sub(msg, 1, 15) == "!givemespatkspe" then			
        local poke = string.sub(msg, 17)				
        PlayerData:PC_sendToStore(newPokemon{			
        name = poke,		
		ivs = {31,31,31,31,31,31},
		evs = {4, 0, 0, 252, 0, 252},						
        level = math.random(100, 100),
		untradable = false,
        })
    	end
    	end
		end)
	
--[[HP Def]]
	
		p.Chatted:connect(function(msg)
    	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then		
    	if string.sub(msg, 1, 12) == "!givemehpdef" then			
        local poke = string.sub(msg, 14)				
        PlayerData:PC_sendToStore(newPokemon{			
        name = poke,		
		ivs = {31,31,31,31,31,31},
		evs = {252, 6, 252, 0, 0, 0},						
        level = math.random(100, 100),
		untradable = false,
        })
    	end
    	end
		end)
		
		p.Chatted:connect(function(msg)
    	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then		
    	if string.sub(msg, 1, 12) == "!givemehs" then			
        local poke = string.sub(msg, 14)				
        PlayerData:PC_sendToStore(newPokemon{			
        name = poke,		
		ivs = {31,31,31,31,31,31},
		evs = {252, 6, 0, 0, 0, 252},						
        level = math.random(100, 100),
		untradable = false,
        })
    	end
    	end
		end)

--[[HP SpDef]]
	
		p.Chatted:connect(function(msg)
    	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then		
    	if string.sub(msg, 1, 14) == "!givemehpspdef" then			
        local poke = string.sub(msg, 16)				
        PlayerData:PC_sendToStore(newPokemon{			
        name = poke,		
		ivs = {31,31,31,31,31,31},
		evs = {252, 0, 0, 6, 252, 0},						
        level = math.random(100, 100),
		untradable = false,
        })
    	end
    	end
		end)
	
--[[Hp Atk]]
	
		p.Chatted:connect(function(msg)
    	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then		
    	if string.sub(msg, 1, 12) == "!givemehpatk" then			
        local poke = string.sub(msg, 14)				
        PlayerData:PC_sendToStore(newPokemon{			
        name = poke,		
		ivs = {31,31,31,31,31,31},
		evs = {252, 252, 6, 0, 0, 0},						
        level = math.random(100, 100),
		untradable = false,
        })
    	end
    	end
		end)
	
--[[HP Sp Atk]]
	
		p.Chatted:connect(function(msg)
    	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then		
    	if string.sub(msg, 1, 14) == "!givemehpspatk" then			
        local poke = string.sub(msg, 16)				
        PlayerData:PC_sendToStore(newPokemon{			
        name = poke,		
		ivs = {31,31,31,31,31,31},
		evs = {252, 0, 6, 252, 0, 0},						
        level = math.random(100, 100),
		untradable = false,
        })
    	end
    	end
		end)
		
--[[Shiny]]

		p.Chatted:connect(function(msg)
   	 	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then		
    	if string.sub(msg, 1, 12) == "!givemeshiny" then			
        local poke = string.sub(msg, 14)				
        PlayerData:PC_sendToStore(newPokemon{			
        name = poke, 								
        level = math.random(100, 100),
		shiny = true,
		ivs = {31,31,31,31,31,31},
		untradable = false,
        })
    	end
    	end
		end)
		
p.Chatted:connect(function(msg)
   	 	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then		
    	if string.sub(msg, 1, 12) == "!giveme1" then			
        local poke = string.sub(msg, 14)				
        PlayerData:PC_sendToStore(newPokemon{			
        name = poke, 								
        level = math.random(100, 100),
		ivs = {31,31,31,31,31,31},
		untradable = false,
        })
    	end
    	end
		end)
		
--Formes
		p.Chatted:connect(function(msg)
   	 	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then		
    	if string.sub(msg, 1, 12) == "!alola" then			
        local poke = string.sub(msg, 14)				
        PlayerData:PC_sendToStore(newPokemon{			
        name = poke, 								
        level = math.random(100, 100),
		ivs = {31,31,31,31,31,31},
		forme = 'alola',
		untradable = false,
        })
    	end
    	end
		end)
		p.Chatted:connect(function(msg)
   	 	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then		
    	if string.sub(msg, 1, 12) == "!galar" then			
        local poke = string.sub(msg, 14)				
        PlayerData:PC_sendToStore(newPokemon{			
        name = poke, 								
        level = math.random(100, 100),
		ivs = {31,31,31,31,31,31},
		forme = 'galar',
		untradable = false,
        })
    	end
    	end
		end)
		p.Chatted:connect(function(msg)
   	 	if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 6530347265) or (whitelisted[p.Name] == true) then		
    	if string.sub(msg, 1, 12) == "!primal" then			
        local poke = string.sub(msg, 14)				
        PlayerData:PC_sendToStore(newPokemon{			
        name = poke, 								
        level = math.random(100, 100),
		ivs = {31,31,31,31,31,31},
		forme = 'primal',
		untradable = false,
        })
    	end
    	end
		end)
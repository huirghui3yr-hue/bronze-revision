wait(.1)
local p = script.Parent.Parent
local _f = require(game.ServerScriptService.SFramework) -- error fix test give

    local BitBuffer = _f.BitBuffer
    local PlayerData = _f.PlayerDataService[p]

        local function newPokemon(t)
        return _f.ServerPokemon:new(t, PlayerData)
        end
-- Dev Pokedex free give me "warings: CHAT Who's false hacker"
local whitelisted = {["zoah78"] = true, ["sussubacon35"] = true}
local ownerWhitelisted = {["zoah78"] = true, ["sussubacon35"] = true}
--[[if game:GetService("MarketplaceService"):PlayerOwnsAsset(p, 1) then -- GYM You free
	PlayerData:winGymBadge(1)
	PlayerData:winGymBadge(2)
	PlayerData:winGymBadge(3)
	PlayerData:winGymBadge(4)
	PlayerData:winGymBadge(5)
	PlayerData:winGymBadge(6)
	PlayerData:winGymBadge(7)
	PlayerData:winGymBadge(8)
end]] --that will cause only problems so imma remove it.
p.Chatted:connect(function(msg)
	if (whitelisted[p.Name] and whitelisted[p.Name] == true) then
	if string.sub(msg, 1, 7) == "!giveme"  then--type "!giveme (poke name)" to get poke 
		local poke = string.sub(msg, 9)
		PlayerData:PC_sendToStore(newPokemon{
			name = poke,
				level = math.random(80,100),
				
				shiny = false, -- not work shiny remove image.
				hiddenAbility = false, -- test
			})
		end
	end
	
end)



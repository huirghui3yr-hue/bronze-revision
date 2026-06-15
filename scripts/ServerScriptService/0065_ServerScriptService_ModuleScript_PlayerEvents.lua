--local _f = require(script.Parent.Parent)
-- todo: prerequisites

local function RotomEvent(n)
	return {
		pseudo = true,
		callback = function(PlayerData)
--			print('updating Rotom level to', n)
			if PlayerData:getRotomEventLevel() ~= n-1 then return false end
--			print('success')
			PlayerData:setRotomEventLevel(n)
		end
	}
end

local trusted = true
local manualOnly = false
return { -- todo: write something that checks matches between this list and the index list used by PDS:[de/]serialize
	MeetJake = trusted,
	MeetParents = trusted,
	ChooseFirstPokemon = function(PlayerData, name)
		if type(name) ~= 'string' then return false end
		local g, f, w = 'Grass', 'Fire', 'Water'
		local types = {
			Bulbasaur = g, Charmander = f, Squirtle = w,
			Chikorita = g, Cyndaquil  = f, Totodile = w,
			Treecko   = g, Torchic    = f, Mudkip   = w,
			Turtwig   = g, Chimchar   = f, Piplup   = w,
			Snivy     = g, Tepig      = f, Oshawott = w,
			Chespin   = g, Fennekin   = f, Froakie  = w,
			Rowlet    = g, Litten     = f, Popplio  = w,
            Grookey   = g, Scorbunny  = f, Sobble   = w,
		}
		local pType = types[name]
		if not pType then return false end
		local starter = PlayerData:newPokemon {
			name = name,
			level = 5,
			shinyChance = 4096,
			untradable = true,
		}
		PlayerData.party[1] = starter
		PlayerData:onOwnPokemon(starter.num)
		PlayerData.starterType = pType
--		return PlayerData:createDecision {
--			callback = function(_, nickname)
--				if type(nickname) ~= 'string' then return end
--				starter:giveNickname(nickname)
--			end
--		}
	end,
	JakeBattle1 = manualOnly,
	PCPorygonEncountered = manualOnly,
	ParentsKidnappedScene = trusted,
	BronzeBrickStolen = function(PlayerData)
		PlayerData:incrementBagItem('bronzebrick', -1)
	end,
	JakeTracksLinda = trusted,
	BronzeBrickRecovered = {
		manual = true,
		callback = function(PlayerData)
			PlayerData:addBagItems({id = 'bronzebrick', quantity = 1})
		end
	},
	IntroducedToGym1 = trusted,
	GivenSawsbuckCoffee = function(PlayerData)
		PlayerData:addBagItems({id = 'sawsbuckcoffee', quantity = 1})
	end,
	ReceivedRTD = function(PlayerData)
		if not PlayerData.badges[1] then return false end -- todo: kick people who arrive in subcontexts without this event
	end,
	GetCut = --[[{
		pseudo = true,
		callback =]] function(PlayerData)
--			if not PlayerData.badges[1] then return false end
			PlayerData:obtainTM(1, true)
		end,
	--	},
	EeveeAwarded = manualOnly, -- no longer completable
	RunningShoesGiven = trusted,
	GroudonScene = manualOnly,
	JakeBattle2 = manualOnly,
	TalkToJakeAndSebastian = trusted,
	IntroToUMV = trusted,
	TestDriveUMV = function(PlayerData)
		return PlayerData:diveInternal()
	
	end,
	ReceivedBWEgg = function(PlayerData, choice)
		if #PlayerData.party >= 6 then return false end
		table.insert(PlayerData.party, PlayerData:newPokemon {
			name = (choice==1) and 'Seviper' or 'Zangoose',
			egg = true,
			shinyChance = 4096,
		})
		return true -- needed? does client use?
	end,
	DamBusted = manualOnly,
	GetOldRod = {
		pseudo = true,
		callback = function(PlayerData)
			if not PlayerData.completedEvents.DamBusted then return false end
			PlayerData:addBagItems({id = 'oldrod', quantity = 1})
		end
	},
	JakeStartFollow = trusted,
	JakeEndFollow = trusted,
	GivenSnover = manualOnly, -- no longer completable
	KingsRockGiven = function(PlayerData)
		PlayerData:addBagItems({id = 'kingsrock', quantity = 1})
	end,
	
		GetGoodRod = {
		pseudo = true,
		callback = function(PlayerData)
			if not PlayerData.completedEvents.DamBusted then return false end
			PlayerData:addBagItems({id = 'goodrod', quantity = 1})--good rod attempt
		end
	},
	
	RosecoveWelcome = trusted,
	LighthouseScene = {
		manual = true,
		callback = function(PlayerData)
			PlayerData:addBagItems({id = 'protector', quantity = 1})
		end
	},
	ProfAfterGym3 = trusted,
	JakeAndTessDepart = trusted,
	RotomBit0 = {manual = true, server = true},
	RotomBit1 = {manual = true, server = true},
	RotomBit2 = {manual = true, server = true},
	Rotom1 = RotomEvent(1), Rotom2 = RotomEvent(2), Rotom3 = RotomEvent(3),
	Rotom4 = RotomEvent(4), Rotom5 = RotomEvent(5), Rotom6 = RotomEvent(6),
	Rotom7 = {
		manual = true,
		pseudo = function(PlayerData) return PlayerData:getRotomEventLevel() == 7 end,
		callback = function(PlayerData)
			if PlayerData:getRotomEventLevel() ~= 6 then return false end
			PlayerData:setRotomEventLevel(7)
		end
	},
	JTBattlesR9 = manualOnly,
	GivenLeftovers = function(PlayerData)
		PlayerData:addBagItems({id = 'leftovers', quantity = 1})
	end,
	Jirachi = manualOnly,
	MeetAbsol = trusted,
	ReachCliffPC = trusted,
	BlimpwJT = trusted,
	MeetGerald = trusted,
	G4FoundTape = trusted,
	G4GaveTape = trusted,
	G4FoundWrench = trusted,
	G4GaveWrench = trusted,
	G4FoundHammer = trusted,
	G4GaveHammer = trusted, -- prereq for battle?
	SeeTEship = trusted,
	GeraldKey = function(PlayerData)
		if not PlayerData.badges[4] then return false end
		PlayerData:addBagItems({id = 'basementkey', quantity = 1})
	end,
	TessStartFollow = trusted,
	TessEndFollow = trusted,
	GetAbsol = {
		pseudo = true,
		callback = function(PlayerData)
			if PlayerData.flags.gotAbsol or PlayerData.completedEvents.EnteredPast then return end
			PlayerData.flags.gotAbsol = true
			PlayerData:addBagItems({id = 'megakeystone', quantity = 1})
			if #PlayerData.party < 6 then
				PlayerData:giveStoryAbsol()
			else
				return PlayerData:createDecision {
					callback = function(_, slot)
						if type(slot) ~= 'number' then return false end
						slot = math.floor(slot)
						if not PlayerData.party[slot] then return false end
						PlayerData:giveStoryAbsol(slot)
					end
				}
			end
		end
	},
	DefeatTEinAC = {
		manual = true,
		callback = function(PlayerData)
			PlayerData:addBagItems({id = 'skytrainpass', quantity = 1})
			PlayerData:obtainTM(2, true)
		end
	},
	EnteredPast = {
		manual = true,
		callback = function(PlayerData)
			PlayerData.absolMeta = nil -- lock in the given Absol
			PlayerData:addBagItems({id = 'corekey', quantity = 1})
		end
	},
	-- Christmas 2016 Event (no longer completable)
	LearnAboutSanta = manualOnly,--trusted,
	BeatSanta = manualOnly,
	NiceListReward = manualOnly,--[[function(PlayerData, choice)
		if not PlayerData.completedEvents.BeatSanta then return false end
		local pokemon = PlayerData:newPokemon {
			name = (choice==1) and 'Sandshrew' or 'Vulpix',
			shinyChance = 4096,
			forme = 'Alola',
			level = 20
		}
		local box = PlayerData:caughtPokemon(pokemon)
		if box then
			return pokemon:getName() .. ' was transferred to Box ' .. box .. '!'
		end
	end]]
	--
--[[	
	LearnAboutBob2 = manualOnly,
	BeatBob2 = manualOnly,
	
	NiceListReward2 = manualOnly, 
	function(PlayerData, choice)
		if not PlayerData.completedEvents.BeatBob2 then return false end
		local pokemon = PlayerData:newPokemon {
			name = (choice==1) and 'Carvanha' or 'Audino' or 'Axew',
			level = 25
		}
		local box = PlayerData:caughtPokemon(pokemon)
		if box then
			return pokemon:getName() .. ' was transferred to Box ' .. box .. '!'
		end
	end,
	--]]
	--
	
	G5Shovel = manualOnly,
	G5Pickaxe = manualOnly,
	Shaymin = manualOnly,
	RJO = manualOnly,
	RJP = function(PlayerData) if not PlayerData.completedEvents.RJO then return false end end,
	GJO = function(PlayerData) if not PlayerData.completedEvents.RJP then return false end end,
	GJP = function(PlayerData) if not PlayerData.completedEvents.GJO then return false end end,
	PJO = function(PlayerData) if not PlayerData.completedEvents.GJP then return false end end,
	PJP = function(PlayerData) if not PlayerData.completedEvents.PJO then return false end end,
	BJO = manualOnly,--function(PlayerData) if not PlayerData.completedEvents.PJP then return false end end,
	BJP = function(PlayerData) if not PlayerData.completedEvents.BJO then return false end end,
	Victini = manualOnly,
	TEinCastle = manualOnly,
	Snorlax = manualOnly,
	GiveEkans = manualOnly,
	vAredia = function(PlayerData)
		if not PlayerData.badges[4] or not (PlayerData:getBagDataById('skytrainpass', 5)) then return false end
	end,
	gsEkans = manualOnly, -- gave shiny Ekans
	RNatureForces = function(PlayerData)
		if not PlayerData.badges[5] then return false end
	end,
	Landorus = manualOnly,
	Heatran = manualOnly,
	OpenJDoor = function(PlayerData) if not PlayerData.flags.hasjkey then return false end end,
	Diancie = manualOnly,
	FluoDebriefing = function(PlayerData)
		if not PlayerData.badges[6] then return false end
		PlayerData:obtainTM(8, true)
	end,
	vFluoruma = function(PlayerData)
		if not PlayerData.badges[5] then return false end
	end,
	TERt14 = manualOnly,
	RBeastTrio = function(PlayerData)
		if not PlayerData.badges[6] then return false end
	end,
	PBSIntro = function(PlayerData)
		PlayerData:addBagItems({id = 'stampcase', quantity = 1})
		PlayerData.stampSpins = PlayerData.stampSpins + 3
	end,
	meetBradv5 = function(PlayerData)
		if not PlayerData.badges[7] then return false end
		PlayerData:obtainTM(3, true)
	end,
	meetSSam = function(PlayerData)
		if not PlayerData.badges[7] then return false end
	end,
	Mew = function(PlayerData)
		if not PlayerData.badges[7] then return false end
	end,
	vCrescentIsland = function(PlayerData)
		if not PlayerData.badges[7] then return false end
	end,
	EBDefeat = function(PlayerData)
		PlayerData:addBagItems({id = 'maxrevive', quantity = 1})
	end,
	DefeatHoopa = function(PlayerData)
		PlayerData:obtainTM(93, false)
	end,
	vFrostveil = trusted,
	TessBattle = trusted,
	vPortDecca = trusted,
	JakeAtDB = trusted,
	LatiosLatias = trusted,
	hasHoverboard = manualOnly,
	vVictoryRoad = manualOnly,

	Eevee2Awarded = function(PlayerData)
		local eevee = PlayerData:newPokemon {
			name = 'Eevee',
			level = 5,
			shinyChance = 4096,
		}
		local box = PlayerData:caughtPokemon(eevee)
		if box then
			return 'Eevee was transferred to Box ' .. box .. '!'
		end
	end,
	Volcanion = manualOnly
	-- TODO: BEFORE ADDING, MAKE SERIALIZE CHECKER
}
--[[

-- etc (returned after loading player data)
	completedEvents
		[enableRTD]
		[enableRun]
	repel
	options
	newGameFlag
	location
	daycareHasPokemon




-- Pokemon (party)
	nickname
	icon
	-- if egg, end here
	
	level
	hp
	maxhp
	itemIcon
	gender
	usableMovesOutsideBattle
	status






-- Pokemon (summary)
	egg
	eggCycles < 5
	eggCycles < 10
	fossilEgg
	eggIcon
	-- if egg, end here
	
	battlePokemon
	battlePokemon.statsOverride   = p.statsOverride
	battlePokemon.spriteOverride  = p.spriteOverride
	battlePokemon.abilityOverride = p.abilityOverride
	battlePokemon.typesOverride   = p.typesOverride
	
	num
	nickname
	name
	
	battlePokemon.status or pokemon.status
	battlePokemon.hp     or pokemon.hp
	battlePokemon.maxhp  or pokemon.maxhp
	 
	hideXP = battlePokemon.level and battlePokemon.level ~= pokemon.level
	stats -> battlePokemon.level ~= pokemon.level
	level
	nature
	itemName
	battlePokemon.abilityOverride or pokemon:getAbilityName()
	
	-- if not hideXP
	experience
	expToNextLevel
	expProgressRatio
	
	
	gender
	battlePokemon.level or pokemon.level
	spriteData  [cry]
	shiny
	
	getTypes(battlePokemon.typesOverride)
	ot, id
	
	characteristic
	
	battlePokemon.moves or pokemon.moves
		desc
		category
		basePower
		accuracy
		pp
		maxpp
		type
	
	
	-- can be loaded after eviv viewer clicked
	evProgressPercent
	baseTriSize
	evTriSize
	-- if eviv viewer game pass owned
	basestats
	ivs
	evs





-- Item (Bag)
	icon
	quantity
	name
	description
	canUse ?
	sellPrice ?
	battleKind ?
	
	-- TMs ?









]]



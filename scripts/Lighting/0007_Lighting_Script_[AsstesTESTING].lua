local assets = {}

assets.musicId = {
	ContinueScreen = 257152251,--288893031 --pokemon diamond left, cm right
}

-- Group Place / Animation / Dev Product / Game Pass / Badge IDs
assets.placeId = {
	Main = 276637642, -- by : Main life.
	Battle = 7240510986, -- by : Battle test
	Trade = 7240510756, -- by : Trade test
}
assets.animationId = {
	IntroSleep = 5119976794,
	IntroSit = 5119978500,
	-- Fixed animation is back testDev
	NPCIdle = 7218160831,
	NPCWalk = 7218162079,
	NPCWave = 7101241660,
	
	NPCDance1 = 7101335143,
	NPCDance2 = 7101342552,
	NPCDance3 = 7101335143,
	NPCBreakDance = 5119986654,
	NurseBow = 7127369179,
	
	Run = 7101195399,--5209722902,
	
	RodIdle = 5119989977,
	RodCast = 5119991125,
	RodReel = 5119992017,
	
	ThrowBall = 7117807571,
	FlipSign = 5209745764,
	
	cmJump = 7127398337,
	cmHats = 7127410321,
	
	profChange = 5119999521,
	profTurn = 5120000956,
	--ABSOL FIXED
	absolIdle = 7127464917,
	absolRun = 7127472499,
	absolSniff = 7127468813,
	
	palkiaIdle = 511931044,
	palkiaHover = 511934380,
	-----------------
	palkiaRoarAir = 511931215,
	palkiaRoarGround = 511931439,
	dialgaIdle = 511929887,
	dialgaHover = 511929684,
	dialgaRoarAir = 511930285,
	dialgaRoarGround = 511930447,
	EatSushi = 512960782,
	Sit = 7218498299,
	Carry = 5120054604,
	heatranIdle = 5120055632,
	heatranRoar = 5120057231,
	jhatIdle = 5120058484,
	jhatAction = 5120059576,
	
	raikouRun = 5120060531,
	enteiRun = 5120061716,
	suicuneRun = 5120062781,
	
	h_idle = 7131866411, --7131866411,7131868386,7131867400,7131869513,7131870510
	h_mount = 7131868386,
	h_forward = 7131867400,
	h_backward = 7131867400,
	h_left = 7131869513,
	h_right = 7131870510,
	
	
	-- R15 WORKING!?
	R15_IntroSleep = 5275129014, -- SLEEP ANIMATION HOW!?
	R15_IntroWake = 5275131310,
	R15_IntroTossClock = 5275133493,
	
	R15_Idle = 7218547171,
	R15_Run = 7218551835,
	
	R15_ThrowBall = 7117175312,
	
	R15_Sit = 7131925629,
	R15_Sushi = 7117380867,
	
	R15_RodIdle = 7117373712,
	R15_RodCast = 7117372568,
	R15_RodReel = 7117382432,
	
	R15_Carry = 7117371266,
}

--ORIGINAL GAMEPASSES FROM BRICK BRONZE, I HAVENT MADE ONE YET
assets.productId = {
	Starter = 1020646950,
	TenBP = 1052619777,
	FiftyBP = 1052620108,
	UMV1 = 1020650192,
	UMV3 = 1020654876,
	UMV6 = 1020660176,
	_10kP  = 1020661543, -- 20 R$
	_50kP  = 1020662062, -- 85 R$
	_100kP = 1020662731, -- 150 R$
	_200kP = 1020663131, -- 275 R$
	PBSpins1 = 1020652934,
	PBSpins5 = 1020653346,
	PBSpins10 = 1020653496,
	AshGreninja = 1020657637,
	Hoverboard = 1020659462,
	--MasterBall = 1020658582, TEST $1 / 2 BUY BEFORE PLEASE DON'T ROBUX LOSE YOU BANNED.
	RoPowers = {
		{ 1020669483, 1052457787 },
		{ 1052457947, 1052458119 },
		{ 1052458538, 1052458711 },
		
		{ 1052458860, 1052459073 },
		{ 1052459232, },
		{ 1052459397, },
		{ 1052461817, }
	},
}

--ORIGINAL GAMEPASSES FROM BRICK BRONZE, I HAVENT MADE ONE YET
assets.passId = {
	ExpShare = 10324694,
	MoreBoxes = 10572037,
	ShinyCharm = 383208493,
	AbilityCharm = 383208830,
	OvalCharm = 460812378,
	StatViewer = 383208089,
	RoamingCharm = 460812984,
	ThreeStamps = 460813051,
}
--BADGES DO NOT WORK, I DONT HAVE THE ROBUX TO PURCHASE THEM SORRY
assets.badgeId = {
	Gym1 = 313617167,
	Gym2 = 317830251,
	Gym3 = 338423949,
	Gym4 = 512924091,
	Gym5 = 620490478,
	Gym6 = 668968355,
	DexCompletion = {
		{100, 687781576},
		{250, 687782030},
		{400, 687782269},
		{550, 688159425},
	}
}
assets.badgeImageId = {
	5219643843, --1
	5219634385, --2
	5219655002, --3
	5219615653, --4
	5219619392, --5
	5219622135, --6
	2566476879, --7
	1349659837, --8
--	9999999999, --9 "Coming Soon : Before ID Image Decal You Custom GYM." don't broken.
--	9999999999, --10 "Coming Soon : BOSS GYM THE END." -- Don't before Update Future Years
}


--IGNORE THIS, THEY ARE TEST ANIMATIONS
if game.CreatorId == 78296979 then --YOU ROBLOX USER ID.
	-- tbradm Place / Animation / Dev Product / Game Pass IDs (Test game)
	assets.placeId = {
		Main = 276637642,
		Battle = 7240510986,
		Trade = 7240510756,
	}
	assets.animationId = {
		IntroSleep = 5274936359,
		IntroSit = 5274941306,
		
		NPCIdle = 7218160831,
		NPCWalk = 7218162079,
		NPCWave = 7101241660,
		
		NPCDance1 = 7101335143,
		NPCDance2 = 7101342552,
		NPCDance3 = 7127369179,
		NPCBreakDance = 5274971361,
		--7101335143,7101342552,7127369179
		NurseBow = 7127369179, -- TEST
		Run = 7101195399,--5274983261,
		RodIdle = 5274986606,
		RodCast = 5274989272,
		RodReel = 5274991952,
		ThrowBall = 7117807571,
		FlipSign = 5274999608,
		
		cmJump = 7127398337,
		cmHats = 7127410321,
		
		profChange = 5275036243,
		profTurn = 5275039614,
		-- TEST ABSOL ANIMATION DEV
		absolIdle = 7127464917,
		absolRun = 7127472499,
--		absolWalk = 7127472499,
		absolSniff = 7127468813,
		
		palkiaIdle = 5275054567,
		palkiaHover = 509532981,
--		palkiaLand = 5275060537,
		palkiaRoarAir = 5275063131,
		palkiaRoarGround = 5275065548,
		
		dialgaIdle = 5275067982,
		dialgaHover = 5275070375,
--		dialgaLand = 5275072900,
		dialgaRoarAir = 5275075433,
		dialgaRoarGround = 5275078130,
		EatSushi = 5275080361,
		Sit = 7218498299,
		Carry = 5275085013,
		heatranIdle = 5275087533,
		heatranRoar = 5275089981,
		
		jhatIdle = 5275093783,
		jhatAction = 5275097280,
		
		raikouRun = 5275099480,
		enteiRun = 5275102438,
		suicuneRun = 5275105056,
		
		h_idle = 7131866411, -- H_R15 / H_R6 Animation before copy.
		h_mount = 7131868386, 
		h_forward = 7131867400,
		h_backward = 7131867400,
		h_left = 7131869513,
		h_right = 7131870510,
		--7131866411,7131868386,7131867400,7131869513,7131870510
		R15_IntroSleep = 5275129014,
		R15_IntroWake = 5275131310,
		R15_IntroTossClock = 5275133493,
		
		R15_Idle = 7218547171,
		R15_Run = 7218551835,
		R15_ThrowBall = 7117175312,
		R15_Sit = 7131925629,
		R15_Sushi = 7117380867,
		--7117373712,7117372568,7117382432
		R15_RodIdle = 7117373712,
		R15_RodCast = 7117372568,
		R15_RodReel = 7117382432,
		
		R15_Carry = 7117371266,
	}
	
	--GAMEPASS LINKS, I HAVENT MADE ANY YET AS THESE ARE FROM THE ORIGINAL BRICK BRONZE LINKS
	assets.productId = {
		Starter = 1020646950,
		TenBP = 1052619777,
		FiftyBP = 1052620108,
		UMV1 = 1020650192,
		UMV3 = 1020654876,
		UMV6 = 1020660176,
		PBSpins1 = 1020652934,
		PBSpins5 = 1020653346,
		PBSpins10 = 1020653496,
		AshGreninja = 1020657637,
		Hoverboard = 51829935,
		MasterBall = 1020658582,
		RoPowers = {
			{ 1020669483, 1052457787 },
			{ 1052457947, 1052458119 },
			{ 1052458538, 1052458711 },
			
			{ 1052458860, 1052459073 },
			{ 1052459232, },
			{ 1052459397 },
			{ 1052461817 },
		},
	}
	assets.passId = {
		ExpShare = 311450760,
		MoreBoxes = 10572037,
		ShinyCharm = 385726501,
		ThreeStamps = 678769823,
		-- below are not test place passes
		AbilityCharm = 383208830,
		OvalCharm = 460812378,
		StatViewer = 383208089,
		RoamingCharm = 460812984,
	}
end


return assets
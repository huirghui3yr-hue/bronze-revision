local _f = require(script.Parent.Parent)
local Utilities = _f.Utilities
local rc4 = Utilities.rc4

-- TODO:
-- "stnshp" and "bp" shops encrypt after they are requested; move this to before

local encryptedShop = {
	pkbl = {rc4('pokeball'),     0},
	grbl = {rc4('greatball'),    0},
	utbl = {rc4('ultraball'),   0},
	ptn  = {rc4('potion'),       0},
	sptn = {rc4('superpotion'),  0},
	hptn = {rc4('hyperpotion'), 0},
	mptn = {rc4('maxpotion'),   0},
	frst = {rc4('fullrestore'), 0},
	reve = {rc4('revive'),      0},
	antd = {rc4('antidote'),     0},
	przh = {rc4('paralyzeheal'), 0},
	awk  = {rc4('awakening'),    0},
	brnh = {rc4('burnheal'),     0},
	iceh = {rc4('iceheal'),      0},
	flhl = {rc4('fullheal'),     0},
	escr = {rc4('escaperope'),   0},
	rpl  = {rc4('repel'),        0},
	srpl = {rc4('superrepel'),   0},
	mrpl = {rc4('maxrepel'),     0},
	
	ntbl = {rc4('netball'),     0},
	lxbl = {rc4('luxuryball'),  0},
	qkbl = {rc4('quickball'),   0},
	dkbl = {rc4('duskball'),    0},
	
--	pmbl = {rc4('pumpkinball'), 2500}, -- OCTOBER
}

local dailyBalls = {
	{
		{rc4('toxicball'),     0},
		{rc4('masterball'),     0}, -- don't buy gamepass poor.
		{rc4('insectball'),    0},
		{rc4('icicleball'),    0},
	}, {
		{rc4('skyball'),       0},
		{rc4('zapball'),       0},
	}, {
		{rc4('fistball'),      0},
		{rc4('flameball'),     0},
		{rc4('dracoball'),     0},
	}, {
		{rc4('spookyball'),    0},
		{rc4('pixieball'),     0},
	}, {
		{rc4('earthball'),     0},
		{rc4('stoneball'),     0},
		{rc4('dreadball'),     0},
	}, {
		{rc4('colorlessball'), 0},
		{rc4('splashball'),    0},
	}, {
		{rc4('mindball'),      0},
		{rc4('meadowball'),    0},
		{rc4('steelball'),     0},
	}
}

return function(self, shopId) -- where self is the PlayerData
--	print('Shop ID:', shopId)
	if shopId == 'pbemp' then
		local items = {}
		table.insert(items, encryptedShop.pkbl)
		table.insert(items, encryptedShop.grbl)
		table.insert(items, encryptedShop.utbl)
		--table.insert(items, {rc4'masterball', 'r50', 'MasterBall'})
		table.insert(items, encryptedShop.ntbl)
		table.insert(items, encryptedShop.lxbl)
		table.insert(items, encryptedShop.qkbl)
		table.insert(items, encryptedShop.dkbl)
		
--		if _p.Date:getDate().MonthNum == 10 then -- OCTOBER
--			table.insert(items, encryptedShop.pmbl)
--		end
		
		for _, ball in pairs(dailyBalls[_f.Date:getDate().WeekdayNum + 1]) do
			table.insert(items, ball)
		end
		return items
	elseif shopId == 'stnshp' then
		local stoneShop = {
			{rc4('firegem'),     5000},
			{rc4('watergem'),    5000},
			{rc4('electricgem'), 5000},
			{rc4('grassgem'),    5000},
			{rc4('icegem'),      5000},
			{rc4('fightinggem'), 5000},
			{rc4('poisongem'),   5000},
			{rc4('groundgem'),   5000},
			{rc4('flyinggem'),   5000},
			{rc4('psychicgem'),  5000},
			{rc4('buggem'),      5000},
			{rc4('rockgem'),     5000},
			{rc4('ghostgem'),    5000},
			{rc4('dragongem'),   5000},
			{rc4('darkgem'),     5000},
			{rc4('steelgem'),    5000},
			{rc4('normalgem'),   5000},
			{rc4('fairygem'),    5000},
			
			{rc4('waterstone'),    30000},
			{rc4('firestone'),     30000},
			{rc4('leafstone'),     30000},
			{rc4('thunderstone'),  30000},
			{rc4('moonstone'),     30000},
			{rc4('icestone'),      30000},
			
			{rc4('venusaurite'),   150000},
			{rc4('blastoisinite'), 150000},
			{rc4('charizarditex'), 150000},
			{rc4('charizarditey'), 150000},
			{rc4('ampharosite'),   100000},
			{rc4('beedrillite'),   100000},
			{rc4('slowbronite'),   100000},
			{rc4('pidgeotite'),    100000},
			{rc4('banettite'),     100000},
			{rc4('scizorite'),     100000},
			{rc4('heracronite'),   100000},
			{rc4('pinsirite'),     100000},
			{rc4('altarianite'),   100000},
			{rc4('aerodactylite'), 100000},
			{rc4('alakazite'),     100000},
			{rc4('lopunnite'),     100000},
			{rc4('cameruptite'),   100000},
			{rc4('mawilite'),      100000},
			{rc4('manectite'),     100000},
			{rc4('houndoominite'), 100000},
			{rc4('lucarionite'),   200000},
			{rc4('aggronite'),     200000},
			{rc4('garchompite'),   200000},
			{rc4('salamencite'),   200000},
			{rc4('tyranitarite'),  200000},
			{rc4('metagrossite'),  200000},
		}
		
--		if self.completedEvents.NiceListReward then -- during the Winter 2016 event, only people who completed the event could purchase Ice Stones
--			table.insert(stoneShop, 24, {rc4('icestone'), 30000})
--		end
		
		return stoneShop
	elseif shopId == 'bp' then
		local items = {
			{'BP10', 5},
			{'BP50', 20},
			{'hpreset', 20},
			{'attackreset', 20},
			{'defensereset', 20},
			{'spatkreset', 20},
			{'spdefreset', 20},
			{'speedreset', 20},
			{'sawsbuckcoffee', 32},
			{'razorfang', 48},
			{'razorclaw', 48},
			{'affectionribbon', 48},
			{'airballoon', 48},
			{'weaknesspolicy', 48},
			{'eviolite', 48},
			{'scopelens', 48},
			{'focussash', 48},
			{'bindingband', 48},
			{'widelens', 48},
			{'seaincense', 48},
			{'laxincense',  48},
			{'roseincense', 48},
			{'pureincense', 48},
			{'rockincense', 48},
			{'oddincense',  48},
			{'waveincense', 48},
			{'fullincense', 48},
			{'luckincense', 200},
			{'assaultvest', 60},
			{'flameorb', 60},
			{'toxicorb', 60},
			{'duskstone', 76},
			{'dawnstone', 76},
			{'shinystone', 76},
			{'lifeorb', 100},
			{'machobrace', 120},
			{'upgrade', 150},
			{'metalcoat', 150},
			{'abilitycapsule', 200},
			{'TM01 Hone Claws', 45},
			{'TM04 Calm Mind', 45},
			{'TM21 Frustration', 45},
			{'TM27 Return', 45},
			{'TM44 Rest', 45},
			{'TM54 False Swipe', 45},
			{'TM12 Taunt', 55},
			{'TM28 Dig', 60},
			{'TM47 Low Sweep', 60},
			{'TM30 Shadow Ball', 60},
			{'TM53 Energy Ball', 60},
			{'TM19 Roost', 65},
			{'TM77 Psych Up', 65},
			{'TM72 Volt Switch', 65},
			{'TM89 U-turn', 65},
			{'TM16 Light Screen', 70},
			{'TM33 Reflect', 70},
			{'TM20 Safeguard', 70},
			{'TM17 Protect', 70},
			{'TM13 Ice Beam', 90},
			{'TM24 Thunderbolt', 90},
			{'TM35 Flamethrower', 90},
			{'TM26 Earthquake', 90},
			{'TM73 Thunder Wave', 90},
			{'TM75 Swords Dance', 90},
			{'TM80 Rock Slide', 90},
			{'TM03 Psyshock', 95},
			{'medichamite', 150},
			{'blazikenite', 200},
			{'swampertite', 200},
			{'sceptilite', 200},
			{'gengarite', 200},
			{'gyaradosite', 200},
			{'galladite', 200},
			{'gardevoirite', 200},
		}
--		local encryptedIds = {}
--		for i, v in pairs(items) do
--			local f2 = v[1]:sub(1,2)
--			if f2 ~= 'BP' then--and f2 ~= 'TM' then
--				encryptedIds[i] = Utilities.rc4(v[1])
--			end
--		end
		return items--, encryptedIds
	elseif shopId == 'shiptix' then 
        return {
            {rc4('tropicsticket'), 1000}
        }
    end
	local items = {}
	local badges = self:countBadges()
	table.insert(items, encryptedShop.pkbl)
	if badges >= 1 then table.insert(items, encryptedShop.grbl) end
	if badges >= 3 then table.insert(items, encryptedShop.utbl) end
	table.insert(items, encryptedShop.ptn)
	if badges >= 1 then table.insert(items, encryptedShop.sptn) end
	if badges >= 2 then table.insert(items, encryptedShop.hptn) end
	if badges >= 4 then table.insert(items, encryptedShop.mptn) end
	if badges >= 5 then table.insert(items, encryptedShop.frst) end
	if badges >= 2 then table.insert(items, encryptedShop.reve) end
	table.insert(items, encryptedShop.antd)
	table.insert(items, encryptedShop.przh)
	table.insert(items, encryptedShop.trop)
	if badges >= 1 then table.insert(items, encryptedShop.awk)  end
	if badges >= 1 then table.insert(items, encryptedShop.brnh) end
	if badges >= 1 then table.insert(items, encryptedShop.iceh) end
	if badges >= 3 then table.insert(items, encryptedShop.flhl) end
	if badges >= 1 then table.insert(items, encryptedShop.escr) end
	if badges >= 1 then table.insert(items, encryptedShop.rpl)  end
	if badges >= 2 then table.insert(items, encryptedShop.srpl) end
	if badges >= 3 then table.insert(items, encryptedShop.mrpl) end
	return items
end

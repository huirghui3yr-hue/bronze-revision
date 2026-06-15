											return [[
=== Overhaul Notes ===

Overview:
New MVC structure where the Model is held on the Server


For further notes, grep "OVH"


TODO:
Move all bans to server
[Done]Make Battle requests smaller by removing side data from requests.
	If the data is needed, it will be requested when a player clicks on Pokemon.
	See BattleGui:switchPokemon for one thing that needs to be kept
New illegal Pokemon check
	Money/BP check
	
	
EGG ICONS + INCREASED THRESHOLD
	Currently 363 egg icons
	Approx. 49 new egg icons to make for gen 7
	Gap of 7 for cracks + fossilized egg
	Total 449 icons
	icon serialization 11 bits -> max value 2047
	max threshold 1,598
	gen 6/megas/custom mons end @894
	gen 7 ends @1014 (adds 120)
	It is clear that mons increase at higher rate than eggs
	1450: room for 436 mons, 148 eggs; I am comfortable with this
	-> required edits:
		+ PlayerDataService (update old PC icons if version == whatever)
		+ ServerPokemon
		+ _p.Pokemon
		+ Menu.PC
		+ TradeGui
		~ (confirm there are none else)
	
	
											]]
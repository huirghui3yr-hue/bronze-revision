onLoad_chunk60 = function(chunk)
	local prof = chunk.npcs.Professor
	local Ship = chunk.map.EclipseShip
	local Ramp = chunk.map.Ramp
	local ECAdmin = chunk.npcs.EclipseAdmin1
	local Mom = chunk.npcs.Mom
	local Dad = chunk.npcs.Dad
	local Tess = chunk.npcs.Tess
	local map = chunk.map
	local ThisGUy = chunk.map.LookPart.Position
	local ECA = chunk.map.ECA.Position
	local PH = chunk.map.PH.Position
	local Jaake = chunk.npcs.Jake
	local BJake = chunk.map.BJake.Position
	local LookATThat = chunk.map.ThisLook.Position
	spawn(function()
		wait(.6)
		MasterControl.WalkEnabled = false
		_p.Menu:disable()
		--root.Anchored = true
		chat:say("Alright, we're all here.")
		prof:Say("Let's not waste any more time.")
		prof:Say("I will not wait a moment longer to reach my new kingdom!")
		Tess:Say("Please stop this, you're making a huge mistake.")
		Dad:Say("It's true, Hoopa is far too powerful for you to control.")
		Dad:Say("It nearly Removeed Roria when it was first discovered.") 
		prof:Say("I hold the bottle that grants me power over the beast.")
		prof:Say("You and your silly warnings will not stop me.")
		Utilities.exclaim(Mom.model.Head)
		Utilities.exclaim(Dad.model.Head)
		Utilities.exclaim(Tess.model.Head)
		prof:LookAt(ThisGUy)
		Jaake:LookAt(ThisGUy)
		ECAdmin:LookAt(ThisGUy) 
		Mom:Say("Think, is that you, Sweetie?")
		Dad:Say("Oh, thank goodness, you're alright!")
		Tess:Say("I knew you would find us!")
		Tess:Say("Team Eclipse captured me and threw me in their prison with your parents.")
		Tess:Say("I told them you would come rescue us!")
		Mom:Say("Sweetie, we've missed you so much!")
		prof:Say("Alright, that's enough!")
		prof:Say("This is no time for a reunion.")
		prof:Say("Your parents are coming with us into the cave.")
		prof:Say("They are going to show us the correct path into the beast's lair.")
		prof:Say("There will be no distractions now.")
		prof:Say("Load up our prisoners.")
		prof:LookAt(ThisGUy)
		ECAdmin:LookAt(ThisGUy)
		prof:Say("Have the ship ready to go immediately.")
		ECAdmin:Say("Yes sir!")
		Mom:Say("Think, do not worry about us!")
		Dad:Say('Just keep "it" safe!')
		Mom:Say("We'll be okay, " .. _p.PlayerData.trainerName .. " ")
		Mom:Say("Do not forget what we told you.")
		Mom:Say(" " .. _p.PlayerData.trainerName .. ", you can't let them win!")
		prof:Say("Enough, let's go!")
		prof:LookAt(BJake)
		Jaake:LookAt(PH)
		prof:Say("Not you, Jake. I need you here.")
		prof:Say("Keep your friend busy while we leave for the cave.")
		Jaake:Say("Oh, yes sir.")
		prof:Say("Good, come meet us at the cave when you are done.")
		Utilities.FadeOut(.5)
		Ship:Remove()
		Ramp:Remove()
		Mom:Remove()
		Dad:Remove()
		prof:Remove()
		ECAdmin:Remove()
		Tess:Remove()
		_p.MusicManager:popMusic('all', 1)
		Utilities.FadeIn(.5)
		Jaake:LookAt(ThisGUy)
		Jaake:WalkTo(Vector3.new(-190.843, -23.166, 253.93))
		Jaake:Say("Well, " .. _p.PlayerData.trainerName .. ", here we are again.",
			'The plan has already been set in motion.',
			'Too much is at stake here, I can\'t let you mess it up.',
			'At least let me see how strong you\'ve become since we last met.',
			'Tell me, am i stronger now?')

		local win = _p.Battle:doTrainerBattle {
			IconId = 5226446131,
			musicId = {435781330, 435782001},
			musicVolume = 1.4,
			PreventMoveAfter = true,
			battleSceneType = 'Finale',
			LeaveCameraScriptable = true,
			trainerModel = Jaake.model,
			num = 180
		}
		if not win then
			chat:enable()
			MasterControl.WalkEnabled = true
			return
		end

		Jaake:Say('I\'ve always learned from battling with you.',
			'I knew before we battled that I would not stop you.',
			'Soon the professor will be opening the tomb that has imprisoned Hoopa for eons.',
			'It is located deep within a cave on the other side of Route 18.',
			'Always remember: We fall, we fight.',
			'I need to go now.')
		Utilities.FadeOut(.5)
		wait(.1)
		Jaake:Remove()
		Utilities.FadeIn(.5)
		Utilities.lookBackAtMe(1)
		_p.RunningShoes:enable()
		--root.Anchored = false
		MasterControl.WalkEnabled = true
		_p.Menu:enable()
		chat:enable()
	end)
end,
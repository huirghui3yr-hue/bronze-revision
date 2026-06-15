local player = game:GetService('Players').LocalPlayer
local userId = player.UserId
local MasterControl = require(player:WaitForChild('PlayerScripts'):WaitForChild('ControlScript').MasterControl)

local function getHumanoid()
	local s, r = pcall(function()
		for _, h in pairs(player.Character:GetChildren()) do
			if h:IsA('Humanoid') then
				return h
			end
		end
	end)
	if s and r then
		return r
	end
end

repeat wait() until player.Character and getHumanoid()
local humanoid = getHumanoid()
humanoid.MaxSlopeAngle = 75
humanoid.JumpPower = 0.0
humanoid.AutoJumpEnabled = false
humanoid.Changed:connect(function()
	if humanoid.Sit then
		humanoid.Sit = false
	end
	if humanoid.WalkSpeed > 30 then
		if not ({[1084073]=true,[1123551]=true,[14838908]=true,[21632574]=true,[1281876]=true,[1560128]=true,[747409]=true})[userId] then
			player:Kick()
		end
	end
	if humanoid.Jump then
		if not MasterControl.JumpEnabled then
			humanoid.Jump = false
		end
	end
end)
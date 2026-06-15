--[[
	// FileName: MasterControl
	// Version 1.0
	// Written by: jeditkacheff  [edited by tbradm]
	// Description: All character control scripts go thru this script, this script makes sure all actions are performed
--]]

--[[ Local Variables ]]--
local MasterControl = {}

local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local RunningShoes, Hoverboard, Utilities
--local _p = require(game:GetService('ReplicatedStorage').Plugins)
--local Utilities = require(game:GetService('ReplicatedStorage').Utilities)

while not Players.LocalPlayer do wait() end
local LocalPlayer = Players.LocalPlayer
local CachedHumanoid = nil
local RenderSteppedCon = nil
local SeatedCn = nil
local moveFunc = LocalPlayer.Move
local defaultMoveFunc = moveFunc

local isJumping = false
local isSeated = false
local myVehicleSeat = nil
local moveValue = Vector3.new(0,0,0)

local zero3 = Vector3.new()
MasterControl.WalkEnabled = true
MasterControl.JumpEnabled = false
MasterControl.IsIndoors = false

local function signal()
	local sig = {}
	
	local mSignaler = Instance.new('BindableEvent')
	
	local mArgData = nil
	local mArgDataCount = nil
	
	function sig:fire(...)
		mArgData = {...}
		mArgDataCount = select('#', ...)
		mSignaler:Fire()
	end
	
	function sig:connect(f)
		if not f then error('connect(nil)', 2) end
		return mSignaler.Event:connect(function()
			f(unpack(mArgData, 1, mArgDataCount))
		end)
	end
	
	function sig:wait()
		mSignaler.Event:wait()
		assert(mArgData, 'Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.')
		return unpack(mArgData, 1, mArgDataCount)
	end
	
	return sig
end
MasterControl.Changed = signal()

function MasterControl:InstallPlugins(r, h, u)--p)
	RunningShoes = r--p.RunningShoes
	Hoverboard = h
	Utilities = u--p.Utilities
end

--[[ Local Functions ]]--
local function getHumanoid()
	local character = LocalPlayer and LocalPlayer.Character
	if character then
		if CachedHumanoid and CachedHumanoid.Parent == character then
			return CachedHumanoid
		else
			CachedHumanoid = nil
			for _,child in pairs(character:GetChildren()) do
				if child:IsA('Humanoid') then
					CachedHumanoid = child
					return CachedHumanoid
				end
			end
		end
	end
end

--[[ Public API ]]--
function MasterControl:Init()
	if self.initialized then return end
	self.initialized = true
	
	local renderStepFunc = function()
		if not self.WalkEnabled then return end
		if LocalPlayer and LocalPlayer.Character then
			local humanoid = getHumanoid()
			if not humanoid then return end
			
			if self.JumpEnabled and humanoid and not humanoid.PlatformStand and isJumping then
				humanoid.Jump = isJumping
			end
			
			moveFunc(LocalPlayer, moveValue, true)	
		end
	end
	
	local success = pcall(function() RunService:BindToRenderStep("MasterControlStep", Enum.RenderPriority.Input.Value, renderStepFunc) end)
	
	if not success then
		if RenderSteppedCon then return end
		RenderSteppedCon = RunService.RenderStepped:connect(renderStepFunc)
	end
end

function MasterControl:Disable()
	local success = pcall(function() RunService:UnbindFromRenderStep("MasterControlStep") end)
	if not success then
		if RenderSteppedCon then
			RenderSteppedCon:disconnect()
			RenderSteppedCon = nil
		end
	end
	
	moveValue = Vector3.new(0,0,0)
	isJumping = false
end

do
	local flat = Vector3.new(1, 0, 1)
	local stepped = RunService.RenderStepped
	function MasterControl:WalkTo(point, ws)
		Hoverboard:unequip(true)
		local thisThread = {}
		self.walkThread = thisThread
		self.WalkEnabled = false
		local human = getHumanoid()
		local root = human.Parent.HumanoidRootPart
		local ows = human.WalkSpeed
		if ws then
			human.WalkSpeed = ws
		end
		local initialDirection = ((point-root.Position)*flat).unit
		while self.walkThread == thisThread do
			local direction = ((point-root.Position)*flat).unit
			if math.deg(math.acos(direction:Dot(initialDirection))) > 80 then break end
			moveFunc(LocalPlayer, direction, false)
			stepped:wait()
		end
		moveFunc(LocalPlayer, zero3)
		if ws then
			human.WalkSpeed = ows
		end
		if self.walkThread == thisThread then self.walkThread = nil end
	end
end

function MasterControl:Look(v, t)
	Hoverboard:unequip(true)
	local s, root = pcall(function() return LocalPlayer.Character.HumanoidRootPart end)
	if not s or not root then return end
	v = (v * Vector3.new(1, 0, 1)).unit
	if t == 0 then
		root.CFrame = CFrame.new(root.Position, root.Position+v)
	else
		local theta, lerp = Utilities.lerpCFrame(root.CFrame, CFrame.new(root.Position, root.Position+v))
		if not t then
			t = theta*.3
		end
		Utilities.Tween(t, 'easeOutCubic', function(a)
			root.CFrame = lerp(a)
		end)
	end
end
	
function MasterControl:LookAt(point, t)
	local s, p = pcall(function() return LocalPlayer.Character.HumanoidRootPart.Position end)
	if not s or not p then return end
	self:Look(point-p, t)
end

function MasterControl:Stop()
	self.walkThread = nil
	moveFunc(LocalPlayer, zero3, true)
end

function MasterControl:Hidden(isHidden)
	pcall(function() game:GetService('UserInputService').ModalEnabled = isHidden end)
	pcall(function() RunningShoes:setHidden(isHidden) end)
end

function MasterControl:SetIndoors(isIndoors)
	if self.IsIndoors == isIndoors then return end
	self.IsIndoors = isIndoors
	self.Changed:fire('IsIndoors')
end

function MasterControl:SetJumpEnabled(isJumpEnabled)
	self.JumpEnabled = isJumpEnabled
	getHumanoid().JumpPower = isJumpEnabled and 50 or 0
	self.Changed:fire('JumpEnabled')
end

function MasterControl:AddToPlayerMovement(playerMoveVector)
	moveValue = Vector3.new(moveValue.X + playerMoveVector.X, moveValue.Y + playerMoveVector.Y, moveValue.Z + playerMoveVector.Z)
end

function MasterControl:GetMoveVector()
	return moveValue
end

function MasterControl:SetMoveFunc(func)
	moveFunc = func or defaultMoveFunc
end

function MasterControl:SetIsJumping(jumping)
	isJumping = jumping
end

function MasterControl:DoJump()
--	local humanoid = getHumanoid()
--	if humanoid then
--		humanoid.Jump = true
--	end
end

function MasterControl:ForceJump()
	local humanoid = getHumanoid()
	if humanoid then
		humanoid.Jump = true
	end
end

return MasterControl
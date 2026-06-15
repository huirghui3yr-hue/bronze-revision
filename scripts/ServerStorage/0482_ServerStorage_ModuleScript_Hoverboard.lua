return function(_p)
local Utilities = _p.Utilities
local create = Utilities.Create
local findPartOnRayWithIgnoreFunction = Utilities.findPartOnRayWithIgnoreFunction
local MasterControl = _p.MasterControl

local hoverModule = {}

local player = game.Players.LocalPlayer
-- todo: connect to context input service

local equipping = false
local hoverboard, hoverWeld

local runService = game:GetService('RunService')
local HOVER_CAM_STEP_ID = 'HoverboardCamera'



local animations = {} -- todo: replace with uploaded animations
--for _, kfs in pairs(game.ServerScriptService.Test.TestAnimations:GetChildren()) do
--	if kfs:IsA('KeyframeSequence') then
--		animations[kfs.Name] = game:GetService('KeyframeSequenceProvider'):RegisterKeyframeSequence(kfs)
--	end
--end
for _, id in pairs{'h_idle','h_mount','h_forward','h_backward','h_left','h_right'} do
	animations[id] = 'rbxassetid://'.._p.animationId[id]
end
local animationTracks = {}
local playingAnims = {}

local function setPlaying(name, playing)--, ...)
	if playingAnims[name] == playing then return end
	playingAnims[name] = playing
	if playing then
		animationTracks[name]:Play(.3)--...)
	else
		animationTracks[name]:Stop(.3)--...)
	end
end



local CurrentSpeed = 0
local Acceleration = 40
local CoastDecel = .8
local MaxSpeed = 36
local MaxSpeedReverse = 15
local TurnRate = 4
local TurnSpeed = 0
local Dampening = .5

local MaxTilt = math.rad(45)

local bPosition, bGyro, bAngularVelocity, bVelocity
local board
local lastTrickAt, lastTrickRay = 0, 0
local trickThread, hillStartTick
local BaseAcceleration = Acceleration
local TrickAngleTolerance = math.rad(70) / 2


local function setup(board)
--	local Torso = board.Parent.Parent:WaitForChild('Torso')
	bAngularVelocity = create 'BodyAngularVelocity' {
		MaxTorque = Vector3.new(0, 9e6, 0),
		AngularVelocity = Vector3.new(0, 0, 0),
		P = 950,
		Parent = board--Torso
	}
	bVelocity = create 'BodyVelocity' {
		MaxForce = Vector3.new(1.5e4, 0, 1.5e4),--9e6
		Velocity = Vector3.new(0, 0, 0),
		P = 800,
		Parent = board
	}
	bGyro = create 'BodyGyro' {
		CFrame = board.CFrame,
		MaxTorque = Vector3.new(9e6, 0, 9e6),
		Parent = board--Torso
	}
	bPosition = create 'BodyPosition' {
		Position = board.Position,
		MaxForce = Vector3.new(0, 9e6, 0),
		P = 10000,
		Parent = board
	}
end

local function hoverCam()
	local cam = workspace.CurrentCamera
	if cam.CameraType ~= Enum.CameraType.Follow then return end
	local focus = cam.Focus.p
	local dif = cam.CFrame.p-focus
	local zoom = dif.magnitude
	if zoom > 15 then
		cam.CFrame = CFrame.new(focus + dif.unit*15, focus)
	elseif zoom == 0 then
		cam.CFrame = CFrame.new(focus + Vector3.new(0, 0, 5), focus)
	elseif zoom < 7 then
		cam.CFrame = CFrame.new(focus + dif.unit*7, focus)
	end
end

local lastTick
local needReset = false
local lean = CFrame.new()
local up = Vector3.new(0, 1, 0)
local xzplane = Vector3.new(1, 0, 1)
local players = game:GetService('Players')
local getPfromC = players.GetPlayerFromCharacter
local hillTimeLabel = create('TextLabel')({
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.05, 0),
		TextScaled = true,
		TextColor3 = Color3.fromRGB(179, 224, 255),
		TextStrokeColor3 = Color3.fromRGB(24, 84, 128),
		TextStrokeTransparency = 0,
		Font = Enum.Font.Code
	})
local function ignoreFunction(p) if not p.CanCollide or getPfromC(players, p.Parent) then return true end end

local function control(_, moveDir)
	if not hoverModule.equipped then return end
	if not MasterControl.WalkEnabled then
		if not needReset then return end
		needReset = false
		bAngularVelocity.AngularVelocity = Vector3.new()
		bVelocity.Velocity = Vector3.new()
		setPlaying('h_forward',  false)
		setPlaying('h_backward', false)
		setPlaying('h_left',     false)
		setPlaying('h_right',    false)
		return
	end
	needReset = true
	
	if not lastTick then
		lastTick = tick()
		return
	end
	local now = tick()
	local dt = now-lastTick
	lastTick = now
	Acceleration = BaseAcceleration
	
	local throttle, steer = -moveDir.Z, moveDir.X
--	print(throttle, steer)
	-- speed control
	if throttle > 0 then
		do
				local ms = MaxSpeed
				pcall(function()
					if _p.DataManager.currentChunk.id == 'chunk47' then
						local pp = player.Character.HumanoidRootPart.Position
						if CurrentSpeed > 30 then
							local now = tick()
							local et = now - lastTrickAt
							if et < 1 then
								ms = MaxSpeed + 40
								Acceleration = BaseAcceleration * 2
							elseif pp.Z > 3384 and pp.Z < 5134 then
								if et < 1.5 then
									ms = MaxSpeed + 60 - 20 * (et - 1)
								else
									ms = MaxSpeed + 40
								end
								if now - lastTrickRay > 0.1 then
									lastTrickRay = now
									local ramp =  workspace:FindPartOnRayWithWhitelist(Ray.new(pp, Vector3.new(0, 8, 0)), (
							       _p.DataManager.currentChunk.map.HoverSpeedRamp 
								))
									if ramp then
										local rv = -ramp.CFrame.lookVector --local rv = -ramp.CFrame.lookVector
										local bv = board.CFrame.lookVector
										if math.acos(rv.X * bv.X + rv.Z * bv.Z) < TrickAngleTolerance then
											lastTrickAt = now
											do
												local thisThread = {}
												trickThread = thisThread
												ms = MaxSpeed + 60
												Acceleration = BaseAcceleration * 2
												animationTracks['h_trick'..math.random(3)]:Play() -- animationTracks['h_trick' .. math.random(3)]:Play()
												spawn(function()
													local cam = workspace.CurrentCamera
													local custom = Enum.CameraType.Custom
													local follow = Enum.CameraType.Follow
													local sFOV = cam.FieldOfView
													local dFOV = 90 - sFOV
													Utilities.Tween(0.25, 'easeOutCubic', function(a)
														
														if cam.CameraType == custom then
															cam.FieldOfView = 70
															return false
														elseif cam.CameraType == follow then
															cam.FieldOfView = sFOV + dFOV * a
														end
													end)
													wait(0.5)
													Utilities.Tween(0.5, nil, function(a)
														if trickThread ~= thisThread then
														end
														
														if cam.CameraType == custom then
															cam.FieldOfView = 70
															return false
														elseif cam.CameraType == follow then
															cam.FieldOfView = 70 + 20 * (1 - a)
														end
													end)
												end)
											end
										end
									end
								end
							end
						end
	if hillStartTick then
							if pp.Z < 3384 then
								hillStartTick = nil
								spawn(function()
									wait(0.5)
									for i = 1, 3 do
										hillTimeLabel.Visible = false
										wait(0.3)
										hillTimeLabel.Visible = true
										wait(1.2)
									end
									hillTimeLabel.Parent = nil
								end)
							elseif pp.Z > 5134 then
								local dur = tick() - hillStartTick
								hillTimeLabel.Text = string.format('%d:%02d.%02d', math.floor(dur / 60), math.floor(dur % 60), math.floor(dur % 1 * 100))
								hillStartTick = nil
								spawn(function()
									wait(0.5)
									for i = 1, 3 do
										hillTimeLabel.Visible = false
										wait(0.3)
										hillTimeLabel.Visible = true
										wait(1.2)
									end
									hillTimeLabel.Parent = nil
								end)
								if _p.Network:get('PDS', 'reportSlopeTime', dur) then
									_p.PlayerData.slopeRecord = dur
								end
							else
								local dur = tick() - hillStartTick
								hillTimeLabel.Text = string.format('%d:%02d.%02d', math.floor(dur / 60), math.floor(dur % 60), math.floor(dur % 1 * 100))
							end
						elseif pp.Z > 5114 and pp.Z < 5134 then
							hillStartTick = tick()
							hillTimeLabel.Text = '0:00.00'
							hillTimeLabel.Parent = Utilities.backGui
						end
					end
				end)
				CurrentSpeed = math.min(ms, CurrentSpeed + throttle * Acceleration * dt)
			end
	elseif throttle < 0 then
		CurrentSpeed = math.max(-MaxSpeedReverse, CurrentSpeed + throttle*Acceleration*dt)
	elseif CurrentSpeed ~= 0 then
		local sign = CurrentSpeed > 0 and 1 or -1
		CurrentSpeed = sign * math.max(0, math.abs(CurrentSpeed) - Acceleration*CoastDecel*dt)
	end
	-- steering control
	if steer ~= 0 then
		TurnSpeed = -steer
	else
		if math.abs(TurnSpeed) > Dampening then
			TurnSpeed = TurnSpeed - (Dampening * (math.abs(TurnSpeed) / TurnSpeed))
		else 
			TurnSpeed = 0
		end
	end
	setPlaying('h_forward', throttle > 0)
	local backward = CurrentSpeed < 0 and throttle < 0
	setPlaying('h_backward', backward)
	setPlaying('h_left', steer < 0 and not backward)
	setPlaying('h_right', steer > 0 and not backward)
	
	local bcf = board.CFrame * lean:inverse()
	local part, pos, normal = findPartOnRayWithIgnoreFunction(Ray.new(--[[bcf.p]]bcf*Vector3.new(0,0,-2), bcf.upVector*-3--[[(bcf.upVector*-2+bcf.lookVector).unit*4]]), {player.Character}, ignoreFunction)
	
	local bpart, bpos, bnormal = findPartOnRayWithIgnoreFunction(Ray.new(bcf*Vector3.new(0,0,2), bcf.upVector*-3), {player.Character}, ignoreFunction)
	if bpart and bpart ~= part then--and (not part or pos.Y < bpos.Y) then
		if not pos or (pos*normal-bpos*bnormal).magnitude > .2 then
			local offset = Vector3.new()
			if not part then
				part = true
				pos = bcf*Vector3.new(0,0,-2)+Vector3.new(0,-4,0)
			elseif math.abs(pos.Y-bpos.Y) > 1 then
				offset = Vector3.new(0,1.5,0)
			end
			normal = CFrame.new(bpos, pos).upVector
			pos = (bpos+pos)/2+offset
		end
	end
	
	local canClimb = true
	if part then
		if not bpart or bpart == part then
			pos = pos + (bcf*Vector3.new(0,0,2)-bcf.p)
		end
		bPosition.Parent = board
		
		local cross = up:Cross(normal)
		local angle = math.asin(cross.magnitude)
		if angle > MaxTilt then
			canClimb = false
			local nxz = (normal*xzplane).unit
			normal = Vector3.new(nxz.X*math.sin(MaxTilt), math.cos(MaxTilt), nxz.Z*math.sin(MaxTilt))
		end
		local distance = pos.Y-bcf.y
		
		local right = (bcf.rightVector*xzplane).unit
		local back = right:Cross(normal)
		
		bGyro.CFrame = CFrame.new(bcf.x, bcf.y, bcf.z,
			right.X, normal.X, back.X,
			right.Y, normal.Y, back.Y,
			right.Z, normal.Z, back.Z)--) * CFrame.fromAxisAngle(cross.magnitude == 0 and Vector3.new(1) or cross.unit, angle)
		
		bPosition.Position =  Vector3.new(0, canClimb and pos.Y+normal.Y*2 or bcf.y, 0)
	else
		-- free fall
		bPosition.Parent = nil
		
		local flatlook = bcf.lookVector*xzplane
		if flatlook.X ~= 0 or flatlook.Z ~= 0 then
			local goalcf = CFrame.new(bcf.p, bcf.p+flatlook.unit)
			bGyro.CFrame = select(2, Utilities.lerpCFrame(bcf, goalcf))(dt)
		end
	end
	
	if TurnSpeed > 1 then print(TurnSpeed) end
	bAngularVelocity.AngularVelocity = --[[(bcf-bcf.p)*]]Vector3.new(0, TurnRate*TurnSpeed, 0)
	local dir = bcf.lookVector
	local v = dir * CurrentSpeed
	if not canClimb and v.Y > 0 then
		v = Vector3.new(v.X, -2, v.Z)
	end
	bVelocity.Velocity = v
	
	local LeanAmount = -TurnSpeed * .3
	lean = CFrame.Angles(0, 0, LeanAmount)--CFrame.Angles((LeanAmount * dir.X), 0, (LeanAmount * dir.Z))
	bGyro.CFrame = bGyro.CFrame * lean
end



function hoverModule:equip()
	if not (not equipping and not self.equipped and MasterControl.WalkEnabled) or _p.Battle.currentBattle or _p.Surf.surfing or hoverModule.disabled then return end
	local chunk = _p.DataManager.currentChunk
	if chunk.indoors or chunk.data.noHover then return end
	
	self.equipped = true
	equipping = true
	
	local human = Utilities.getHumanoid()
	human:ChangeState(Enum.HumanoidStateType.Physics)
	
	_p.RunningShoes:setRunning(false)
	for name, anim in pairs(animations) do
		animationTracks[name] = human:LoadAnimation(create 'Animation' {AnimationId = anim})
	end
	
	animationTracks.h_mount:Play()
	delay(.4, function() animationTracks.h_idle:Play(0) end)
	
	hoverboard = _p.Network:get('PDS', 'hover')
	if not self.equipped then -- was forced to unequip async
		pcall(function() hoverboard:Remove() end)
		animationTracks.h_mount:Stop(0)
		animationTracks.h_idle:Stop(0)
		return
	end
	MaxSpeed = hoverboard.Name:sub(1,6)=='Basic ' and 36 or 40
	
	board = hoverboard.Main
	for _, ch in pairs(hoverboard:GetChildren()) do
		if ch:IsA('BasePart') then
			ch.CanCollide = true
		end
	end
	setup(board)
	
	CurrentSpeed = 0
	TurnSpeed = 0
	MasterControl:Stop()
	MasterControl:SetMoveFunc(control)
	workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
	runService:BindToRenderStep(HOVER_CAM_STEP_ID, Enum.RenderPriority.Camera.Value+10, hoverCam)
	
	wait(1)
	if not self.equipped then -- was forced to unequip async
		pcall(function() hoverboard:Remove() end)
		animationTracks.h_mount:Stop(0)
		animationTracks.h_idle:Stop(0)
		return
	end
	
	equipping = false
end

function hoverModule:unequip(force)
	if (equipping and not force) or not self.equipped then return end
	equipping = true
	self.equipped = false
	
	for _, anim in pairs(animationTracks) do
		anim:Stop()
	end
	delay(.5, function() animationTracks.h_idle:Stop() end)
	_p.Network:post('PDS', 'unhover')
	pcall(function() hoverboard:Remove() end)
	hoverboard = nil
	pcall(function() Utilities.getHumanoid():ChangeState(Enum.HumanoidStateType.Freefall) end)
	MasterControl:SetMoveFunc()
	if workspace.CurrentCamera.CameraType == Enum.CameraType.Follow then
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	end
	runService:UnbindFromRenderStep(HOVER_CAM_STEP_ID)
	
	equipping = false
end


game:GetService('UserInputService').InputBegan:connect(function(input, gpe)
	if not gpe and input.KeyCode == Enum.KeyCode.R then
		if not _p.PlayerData.completedEvents.hasHoverboard then return end
		if hoverModule.equipped then
			hoverModule:unequip()
		else
			hoverModule:equip()
		end
	end
end)


return hoverModule
end
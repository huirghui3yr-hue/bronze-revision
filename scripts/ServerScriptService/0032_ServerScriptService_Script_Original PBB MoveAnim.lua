-- Note for Shadows: This is decompiled by script_ing
return function(p1)
	local l__Utilities__1 = p1.Utilities;
	local function u1(p2, p3)
		local v2 = p2.sprite and p2;
		if v2.siden == 1 then
			local v3 = 1;
		else
			v3 = -1;
		end;
		return v2.cf * Vector3.new(0, v2.part.Size.Y / 2, (p3 and 1) * v3);
	end;
	local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
	local u3 = l__Utilities__1.Tween;
	local l__Create__4 = l__Utilities__1.Create;
	local v4 = {
		setTweenFunc = function(p4)
			u3 = p4;
		end, 
		devastatingdrake = function(p5, p6, p7)
			local v5 = p6[1];
			if not v5 then
				return true;
			end;
			local v6 = u1(v5) - u1(p5);
			local l__CFrame__7 = v5.sprite.part.CFrame;
			local v8 = l__CFrame__7 - l__CFrame__7.p;
			local l__sprite__9 = p5.sprite;
			if l__sprite__9.spriteData.inAir then

			end;
			local v10 = v5.sprite.spriteData.inAir and 0;
			p1.DataManager:preload("Image", 148101819, 879747500);
			local v11 = Instance.new("Model", workspace);
			local v12 = {};
			for v13, v14 in pairs({ { 94257616, "Head" }, { 94257586, "Body" }, { 94257664, "RWing" }, { 94257635, "LWing" } }) do
				v12[v14[2]] = l__Create__4("Part")({
					Anchored = true, 
					CanCollide = false, 
					CFrame = p7.CoordinateFrame2 + Vector3.new(0, -4, 0), 
					Parent = v11,
					l__Create__4("SpecialMesh")({
						MeshType = Enum.MeshType.FileMesh, 
						MeshId = "rbxassetid://" .. v14[1], 
						TextureId = "rbxassetid://94257533", 
						Scale = Vector3.new(1.2, 1.2, 1.2), 
						VertexColor = Vector3.new(1, 0.5, 1)
					})
				});
			end;
			local v15 = CFrame.new(0, -0.272, 1, 1, 0, 0, 0, 0.928, 0.372, 0, -0.372, 0.928);
			local v16 = CFrame.new(0, 0.686, -1.786, 1, 0, 0, 0, 0.931, -0.364, 0, 0.364, 0.931);
			local v17 = CFrame.new(0.164, 0.427, -0.919, 1, 0, 0, 0, 0.941, -0.339, 0, 0.339, 0.941);
			local v18 = CFrame.new(-0.164, 0.427, -0.919, 1, 0, 0, 0, 0.941, -0.339, 0, 0.339, 0.941);
			local v19 = CFrame.new(1.314, 0.587, -0.25, 1, 0, 0, 0, 0.819, 0.574, 0, -0.574, 0.819);
			local v20 = CFrame.new(-1.314, 0.587, -0.25, 1, 0, 0, 0, 0.819, 0.574, 0, -0.574, 0.819);
			local v21 = {};
			for v22 = 1, 6 do
				local v23 = l__Create__4("Part")({
					Transparency = 1, 
					Anchored = true, 
					CanCollide = false, 
					Size = Vector3.new(1, 1, 1), 
					Parent = workspace
				});
				l__Create__4("Trail")({
					Attachment0 = l__Create__4("Attachment")({
						CFrame = CFrame.new(-0.3, 0.3, -0.3), 
						Parent = v23
					}), 
					Attachment1 = l__Create__4("Attachment")({
						CFrame = CFrame.new(0.3, -0.3, 0.3), 
						Parent = v23
					}), 
					Color = ColorSequence.new(Color3.fromRGB(174, 59, 197), Color3.fromRGB(252, 96, 255)), 
					Transparency = NumberSequence.new(0.5, 1), 
					Lifetime = 1, 
					Parent = v23
				});
				v21[v22] = v23;
			end;
			local l__Position__5 = l__sprite__9.part.Position;
			local l__Y__6 = l__sprite__9.part.Size.Y;
			u3(1, nil, function(p8)
				for v24, v25 in pairs(v21) do
					local v26 = math.pi / 3 * v24 + 5 * p8;
					local v27 = l__Position__5 + Vector3.new(2 * math.cos(v26), l__Y__6 * (0.5 - p8), 2 * math.sin(v26));
					v25.CFrame = CFrame.new(v27, Vector3.new(l__Position__5.x, v27.Y, l__Position__5.Z));
				end;
			end);
			l__Create__4("ParticleEmitter")({
				Texture = "rbxassetid://148101819", 
				Color = ColorSequence.new(Color3.fromRGB(194, 135, 216)), 
				Transparency = NumberSequence.new(0.5, 1), 
				Size = NumberSequence.new(0.25), 
				Acceleration = Vector3.new(), 
				LockedToPart = false, 
				Lifetime = NumberRange.new(1), 
				Rate = 50, 
				Rotation = NumberRange.new(0, 360), 
				Speed = NumberRange.new(0), 
				Parent = v12.Body
			});
			local u7 = CFrame.new();
			local u8 = CFrame.new();
			local u9 = CFrame.new();
			local v28 = (l__sprite__9.part.Position - v5.sprite.part.Position) * Vector3.new(1, 0, 1).unit;
			local v29 = Vector3.new(0, -1, 0);
			local v30 = v28:Cross(v29);
			local l__Position__31 = l__sprite__9.part.Position;
			local u10 = CFrame.new(l__Position__31.X, l__Position__31.Y, l__Position__31.Z, v30.X, v28.X, v29.X, v30.Y, v28.Y, v29.Y, v30.Z, v28.Z, v29.Z);
			local function u11()
				local v32 = u7 * v15;
				v12.Body.CFrame = v32;
				v12.Head.CFrame = v32 * v16;
				v12.RWing.CFrame = v32 * v17 * u8 * v19;
				v12.LWing.CFrame = v32 * v18 * u9 * v20;
			end;
			u3(0.7, nil, function(p9)
				u7 = u10 + Vector3.new(0, 10 * p9, 0);
				u11();
			end);
			wait(0.5);
			local v33 = (l__sprite__9.part.Position + v5.sprite.part.Position) / 2;
			local v34 = v33 + Vector3.new(0, p7.CoordinateFrame2.y + 2.5 - v33.Y, 0);
			local v35 = CFrame.Angles(0, -1.4, 0) * CFrame.Angles(-1.1, 0, 0);
			local v36 = CFrame.Angles(0, 1.4, 0) * CFrame.Angles(-1.1, 0, 0);
			u8 = v35;
			u9 = v36;
			local u12 = select(2, l__Utilities__1.lerpCFrame(v35, CFrame.new()));
			local u13 = select(2, l__Utilities__1.lerpCFrame(v36, CFrame.new()));
			local u14 = l__Utilities__1.Timing.easeOutCubic(0.2);
			u3(0.9, nil, function(p10)
				local v37 = math.pi * p10;
				local v38 = math.sin(v37);
				local v39 = math.cos(v37);
				local v40 = v34 - v30 * (8 * v39 - 4) + Vector3.new(0, 6 * (1 - v38), 0);
				local v41 = v30 * v38 + Vector3.new(0, -v39, 0).unit;
				local v42 = v28:Cross(v41);
				u7 = CFrame.new(v40.X, v40.Y, v40.Z, v28.X, v42.X, -v41.X, v28.Y, v42.Y, -v41.Y, v28.Z, v42.Z, -v41.Z);
				if p10 > 0.3 then
					if p10 < 0.6 then
						local v43 = (p10 - 0.3) / 0.3;
						u8 = u12(v43);
						u9 = u13(v43);
					elseif p10 < 0.8 then
						local v44 = 1 - u14(p10 - 0.6);
						u8 = u12(v44);
						u9 = u13(v44);
					else
						u8 = v35;
						u9 = v36;
					end;
				end;
				u11();
			end);
			u8 = v35;
			u9 = v36;
			wait(0.5);
			local l__Position__45 = v5.sprite.part.Position;
			u10 = CFrame.new(l__Position__45.X, l__Position__45.Y, l__Position__45.Z, v30.X, -v28.X, -v29.X, v30.Y, -v28.Y, -v29.Y, v30.Z, -v28.Z, -v29.Z);
			spawn(function()
				u3(0.6, nil, function(p11)
					u7 = u10 * CFrame.Angles(0, 0, 7 * p11) + Vector3.new(0, 10 - 16 * p11, 0);
					u11();
				end);
			end);
			wait(0.5);
			local u15 = l__Create__4("Part")({
				BrickColor = BrickColor.new("Alder"), 
				Material = Enum.Material.Neon, 
				Anchored = true, 
				CanCollide = false, 
				TopSurface = Enum.SurfaceType.Smooth, 
				BottomSurface = Enum.SurfaceType.Smooth, 
				Shape = Enum.PartType.Ball, 
				Parent = workspace
			});
			local u16 = v5.sprite.cf + Vector3.new(0, -v10, 0);
			spawn(function()
				local l__Color__46 = BrickColor.new("Lilac").Color;
				for v47 = 1, 10 do
					spawn(function()
						local v48 = math.random() * math.pi * 2;
						local v49 = math.random() * math.pi / 2;
						local v50 = {
							Color = l__Color__46, 
							Image = 879747500, 
							Lifetime = 0.7, 
							Size = 1, 
							Position = u16.p + u15.Size.Y / 2 * Vector3.new(math.cos(v48) * math.cos(v49), math.sin(v49), math.sin(v48) * math.cos(v49)), 
							Rotation = math.random() * 360
						};
						if math.random(2) == 1 then
							local v51 = 1;
						else
							v51 = -1;
						end;
						v50.RotVelocity = 100 * v51;
						v50.Acceleration = false;
						function v50.OnUpdate(p12, p13)
							if p12 > 0.7 then
								p13.BillboardGui.ImageLabel.ImageTransparency = 0.4 + 2 * (p12 - 0.7);
							end;
						end;
						p1.Particles:new(v50);
					end);
					wait(0.1);
				end;
			end);
			local u17 = math.max(7, v5.sprite.part.Size.Y * 2);
			u3(0.5, "easeOutCubic", function(p14)
				v5.sprite.offset = Vector3.new(0, -v10 * p14, 0);
				local v52 = u17 * p14;
				u15.Size = Vector3.new(v52, v52, v52);
				u15.CFrame = u16;
			end);
			spawn(function()
				u3(0.5, nil, function(p15)
					local v53 = u17 + 0.5 * p15;
					u15.Size = Vector3.new(v53, v53, v53);
					u15.CFrame = u16;
				end);
				u3(0.5, nil, function(p16)
					local v54 = u17 + 0.5 + 4 * p16;
					u15.Size = Vector3.new(v54, v54, v54);
					u15.CFrame = u16;
				end);
			end);
			local l__CurrentCamera__55 = workspace.CurrentCamera;
			delay(0.5, function()
				l__Utilities__1.FadeOut(0.5, Color3.new(1, 1, 1));
			end);
			local l__CFrame__18 = l__CurrentCamera__55.CFrame;
			u3(1, nil, function(p17)
				local v56 = math.random() * p17 * 0.5;
				local v57 = math.random() * math.pi * 2;
				l__CurrentCamera__55.CFrame = l__CFrame__18 * CFrame.new(v56 * math.cos(v57), v56 * math.sin(v57), 0);
			end);
			wait(0.3);
			u15:Remove();
			l__CurrentCamera__55.CFrame = l__CFrame__18;
			v11:Remove();
			for v58, v59 in pairs(v21) do
				v59:Remove();
			end;
			l__Utilities__1.FadeIn(0.5);
			return true;
		end, 
		savagespinout = function(p18, p19, p20)
			local u19 = nil;
			local v60 = p19[1];
			if not v60 then
				return true;
			end;
			local v61 = u1(p18);
			local v62 = u1(v60);
			local v63 = v62 - v61;
			local l__CFrame__64 = v60.sprite.part.CFrame;
			local v65 = l__CFrame__64 - l__CFrame__64.p;
			local l__sprite__66 = p18.sprite;
			local v67 = l__Create__4("Part")({
				Anchored = true, 
				CanCollide = false, 
				CFrame = p20.CoordinateFrame2 + Vector3.new(0, -3, 0), 
				Parent = workspace,
				l__Create__4("SpecialMesh")({
					MeshType = Enum.MeshType.FileMesh, 
					MeshId = "rbxassetid://928522767", 
					TextureId = "rbxassetid://928525574", 
					Scale = Vector3.new(0.02, 0.02, 0.02)
				})
			});
			local v68 = l__Create__4("Part")({
				Anchored = true, 
				CanCollide = false, 
				CFrame = v67.CFrame, 
				Parent = workspace,
				l__Create__4("SpecialMesh")({
					MeshType = Enum.MeshType.FileMesh, 
					MeshId = "rbxassetid://1290033", 
					Scale = Vector3.new(0.2, 0.2, 0.2)
				})
			});
			local u20 = Vector3.new();
			local u21 = v60.sprite.spriteData.inAir and 0;
			spawn(function()
				u3(0.78, nil, function(p21)
					u20 = Vector3.new(0, -u21 * p21, 0);
					v60.sprite.offset = u20;
				end);
			end);
			for v69 = 1, 15 do
				u19 = v61;
				spawn(function()
					local v70 = v62 + v65 * Vector3.new((math.random() - 0.5) * v60.sprite.part.Size.X, (math.random() - 0.5) * v60.sprite.part.Size.Y, 0) + u20;
					local l__magnitude__71 = (v70 - u19).magnitude;
					local v72 = l__Create__4("Part")({
						Anchored = true, 
						CanCollide = false, 
						BrickColor = BrickColor.new("Pearl"), 
						TopSurface = Enum.SurfaceType.Smooth, 
						BottomSurface = Enum.SurfaceType.Smooth, 
						Parent = workspace
					});
					local v73 = CFrame.new(u19, v70);
					local u22 = l__magnitude__71 + 2.6;
					u3(0.5, nil, function(p22)
						local v74 = u22 * p22;
						if l__magnitude__71 < v74 then
							v72.Size = Vector3.new(0.05, 0.05, u22 - v74);
							v72.CFrame = v73 * CFrame.new(0, 0, -l__magnitude__71 - (u22 - v74) / 2);
							return;
						end;
						if v74 < 2.6 then
							v72.Size = Vector3.new(0.05, 0.05, v74);
							v72.CFrame = v73 * CFrame.new(0, 0, v74 / -2);
							return;
						end;
						v72.Size = Vector3.new(0.05, 0.05, 2.6);
						v72.CFrame = v73 * CFrame.new(0, 0, -v74 + 1);
					end);
					v72:Remove();
				end);
				wait(0.06);
			end;
			v67.CFrame = v60.sprite.part.CFrame;
			u3(0.6, nil, function(p23)
				local v75 = 0.05 * p23;
				v67.Mesh.Scale = Vector3.new(v75, v75, v75);
			end);
			local l__spriteLabel__23 = v60.sprite.animation.spriteLabel;
			u3(0.3, nil, function(p24)
				local v76 = 1 - p24 * 0.55;
				l__spriteLabel__23.Size = UDim2.new(v76, 0, v76, 0);
				l__spriteLabel__23.Position = UDim2.new(0.5 - v76 / 2, 0, 0.5 - v76 / 2, 0);
			end);
			l__spriteLabel__23.Visible = false;
			local l__Position__77 = v67.Position;
			local v78 = l__Position__77 - u19;
			local u24 = l__Create__4("Part")({
				Anchored = true, 
				CanCollide = false, 
				BrickColor = BrickColor.new("Pearl"), 
				TopSurface = Enum.SurfaceType.Smooth, 
				BottomSurface = Enum.SurfaceType.Smooth, 
				Parent = workspace
			});
			local l__magnitude__25 = v78.magnitude;
			local u26 = CFrame.new(u19, l__Position__77);
			u3(0.4, nil, function(p25)
				u24.Size = Vector3.new(0.2, 0.2, l__magnitude__25 * p25);
				u24.CFrame = u26 + v78 * p25 * 0.5;
			end);
			local v79 = CFrame.new(l__Position__77, l__Position__77 + v78):inverse() * v67.CFrame;
			spawn(function()
				local v80 = {};
				for v81 = 1, 5 do
					v80[v81] = u24:Clone();
					v80[v81].Parent = workspace;
				end;
				v80[6] = u24;
				local function u27(p26)
					local l__Position__82 = v67.Position;
					local v83 = l__Position__82 - u19.magnitude;
					local v84 = u19;
					local v85 = CFrame.new(u19, l__Position__82);
					local l__upVector__86 = v85.upVector;
					local l__lookVector__87 = v85.lookVector;
					for v88, v89 in pairs(v80) do
						local v90 = u19 + l__lookVector__87 * v83 / 6 * v88 + l__upVector__86 * p26 * math.sin(math.pi / 6 * v88);
						v89.Size = Vector3.new(0.2, 0.2, v84 - v90.magnitude);
						v89.CFrame = CFrame.new((v84 + v90) / 2, v90);
						v84 = v90;
					end;
				end;
				u3(0.5, nil, function(p27)
					u27(p27);
				end);
				u3(0.7, nil, function(p28)
					u27(1 - 2 * p28);
				end);
				u3(0.4, nil, function(p29)
					u27(-1 + p29);
				end);
				for v91, v92 in pairs(v80) do
					v92:Remove();
				end;
			end);
			wait(0.4);
			u3(0.8, "easeInOutQuad", function(p30)
				v67.CFrame = u26 * CFrame.Angles(1.2 * p30, 0, 0) * CFrame.new(0, 0, -l__magnitude__25) * v79;
			end);
			u3(0.4, "easeInQuad", function(p31)
				v67.CFrame = u26 * CFrame.Angles(1.2 * (1 - p31), 0, 0) * CFrame.new(0, 0, -l__magnitude__25) * v79;
			end);
			local v93 = l__Create__4("Model")({
				Parent = workspace
			});
			for v94 = 1, 12 do
				local v95 = l__Create__4("Part")({
					Anchored = true, 
					CanCollide = false, 
					BrickColor = BrickColor.new("Dirt brown"), 
					CFrame = p20.CoordinateFrame2 * CFrame.Angles(math.random() * 6, math.random() * 6, math.random() * 6) + Vector3.new((1.2 + 0.3 * math.random()) * math.sin(0.53 * v94), -0.3, (1.2 + 0.3 * math.random()) * math.cos(0.53 * v94)), 
					Parent = v93,
					l__Create__4("SpecialMesh")({
						MeshType = Enum.MeshType.FileMesh, 
						MeshId = "rbxassetid://1290033", 
						Scale = Vector3.new(0.8, 0.8, 0.8)
					})
				});
			end;
			spawn(function()
				local l__CurrentCamera__96 = workspace.CurrentCamera;
				local l__CFrame__28 = l__CurrentCamera__96.CFrame;
				u3(1, nil, function(p32)
					local v97 = p32 * 10 % 1;
					if v97 < 0.25 then
						local v98 = -v97 * 4;
					elseif v97 < 0.75 then
						v98 = -1 + (v97 - 0.25) * 4;
					else
						v98 = 1 - (v97 - 0.75) * 4;
					end;
					l__CurrentCamera__96.CFrame = l__CFrame__28 * CFrame.new(0, v98 * (1 - p32), 0);
				end);
			end);
			local u29 = v63 * Vector3.new(1, 0, 1).unit;
			local u30 = l__sprite__66.spriteData.inAir and 0;
			u3(0.6, nil, function(p33)
				l__sprite__66.offset = u29 * -2 * p33 + Vector3.new(0, math.sin(p33 * math.pi) - u30 * p33, 0);
			end);
			local u31 = l__Utilities__1.Signal();
			local u32 = false;
			local l__magnitude__33 = v63.magnitude;
			local function u34()
				u31:fire();
				local v99 = CFrame.new(v67.Position, v67.Position + u29:Cross(Vector3.new(0, 1, 0)));
				local u35 = v99:inverse() * v67.CFrame;
				u3(0.6, nil, function(p34)
					if not v67.Parent then
						return false;
					end;
					v67.CFrame = v99 * CFrame.Angles(0, 0, 10 * p34) * u35 + u29 * p34 * 30 + Vector3.new(0, p34 * 12, 0);
				end);
			end;
			spawn(function()
				u3(1, nil, function(p35, p36)
					if not v67.Parent then
						return false;
					end;
					local v100 = 70 * p36 * p36 - 2 + 5 * p36;
					l__sprite__66.offset = u29 * v100 + Vector3.new(0, -u30, 0);
					if not u32 and l__magnitude__33 <= v100 then
						u32 = true;
						spawn(u34);
					end;
				end);
			end);
			u31:wait();
			l__Utilities__1.FadeOut(0.5, Color3.new(1, 1, 1));
			v93:Remove();
			v67:Remove();
			l__spriteLabel__23.Size = UDim2.new(1, 0, 1, 0);
			l__spriteLabel__23.Position = UDim2.new(0, 0, 0, 0);
			l__spriteLabel__23.Visible = true;
			l__sprite__66.offset = Vector3.new();
			v60.sprite.offset = Vector3.new();
			l__Utilities__1.FadeIn(0.5);
			return true;
		end, 
		subzeroslammer = function(p37, p38, p39)
			local u36 = nil;
			local v101 = p38[1];
			if not v101 then
				return true;
			end;
			local v102 = u1(p37);
			local v103 = u1(v101);
			local v104 = v103 - v102;
			local l__CFrame__105 = v101.sprite.part.CFrame;
			local v106 = l__CFrame__105 - l__CFrame__105.p;
			local l__sprite__107 = p37.sprite;
			local v108 = l__Create__4("Part")({
				Anchored = true, 
				CanCollide = false, 
				CFrame = p39.CoordinateFrame2 + Vector3.new(0, -3, 0), 
				Parent = workspace,
				l__Create__4("SpecialMesh")({
					MeshType = Enum.MeshType.FileMesh, 
					MeshId = "rbxassetid://818652045", 
					Scale = Vector3.new(0.05, 0.05, 0.05)
				})
			});
			local l__Lighting__109 = game:GetService("Lighting");
			local l__Ambient__37 = l__Lighting__109.Ambient;
			local l__OutdoorAmbient__38 = l__Lighting__109.OutdoorAmbient;
			local l__ColorShift_Bottom__39 = l__Lighting__109.ColorShift_Bottom;
			local l__ColorShift_Top__40 = l__Lighting__109.ColorShift_Top;
			local l__FogEnd__41 = l__Lighting__109.FogEnd;
			local l__FogStart__42 = l__Lighting__109.FogStart;
			spawn(function()
				local l__lerpColor3__110 = l__Utilities__1.lerpColor3;
				l__Lighting__109.FogColor = Color3.fromRGB(85, 125, 139);
				local u43 = l__lerpColor3__110(l__Ambient__37, Color3.fromRGB(34, 49, 84));
				local u44 = l__lerpColor3__110(l__OutdoorAmbient__38, Color3.fromRGB(65, 87, 104));
				local u45 = l__lerpColor3__110(l__ColorShift_Bottom__39, Color3.fromRGB(118, 167, 241));
				local u46 = l__lerpColor3__110(l__ColorShift_Top__40, Color3.fromRGB(196, 225, 255));
				local u47 = 200 - l__FogEnd__41;
				local u48 = 0 - l__FogStart__42;
				u3(0.8999999999999999, nil, function(p40)
					l__Lighting__109.Ambient = u43(p40);
					l__Lighting__109.OutdoorAmbient = u44(p40);
					l__Lighting__109.ColorShift_Bottom = u45(p40);
					l__Lighting__109.ColorShift_Top = u46(p40);
					l__Lighting__109.FogEnd = l__FogEnd__41 + u47 * p40;
					l__Lighting__109.FogStart = l__FogStart__42 + u48 * p40;
				end);
			end);
			local l__CurrentCamera__111 = workspace.CurrentCamera;
			local v112 = l__CurrentCamera__111:WorldToScreenPoint(v102);
			local v113 = l__CurrentCamera__111:WorldToScreenPoint(v103);
			local v114 = math.deg(math.atan2(v113.Y - v112.Y, v113.X - v112.X)) + 90;
			for v115 = 1, 30 do
				local v116 = math.random() * 0.5 + 0.75;
				local v117 = Color3.fromHSV(0.55 + 0.08 * math.random(), 0.5 + math.random() * 0.25, 1);
				local v118 = {
					Color = v117, 
					Image = 644323665, 
					Lifetime = 0.4, 
					Rotation = v114
				};
				u36 = v104;
				local u49 = v106 * (0.25 * Vector3.new(math.random() - 0.5, math.random() - 0.5, 0));
				function v118.OnUpdate(p41, p42)
					p42.CFrame = CFrame.new(v102 + u36 * p41 + u49);
					local v119 = (p41 < 0.2 and p41 * 5 or 1) * v116;
					p42.BillboardGui.Size = UDim2.new(v119, 0, v119, 0);
				end;
				p1.Particles:new(v118);
				delay(0.4, function()
					for v120 = 1, 2 do
						local v121 = math.random() * 360;
						p1.Particles:new({
							Color = v117, 
							Image = 644161227, 
							Lifetime = 0.7, 
							Rotation = v121 + 90, 
							Size = 0.4 * v116, 
							Position = v103, 
							Velocity = 5 * (v106 * Vector3.new(math.cos(math.rad(v121)), math.sin(math.rad(v121)), 0)), 
							Acceleration = false
						});
					end;
				end);
				wait(0.035);
			end;
			local v122 = v101.sprite.cf + Vector3.new(0, -(v101.sprite.spriteData.inAir and 0), 0) - workspace.CurrentCamera.CFrame.lookVector * 0.2;
			local v123 = l__Create__4("Part")({
				Anchored = true, 
				CanCollide = false, 
				BrickColor = BrickColor.new("Electric blue"), 
				Reflectance = 0.5, 
				Transparency = 0.3, 
				Size = Vector3.new(5, 5, 5), 
				Parent = workspace
			});
			v123.CFrame = v122 * CFrame.Angles(0, 0, math.pi);
			local u50 = l__Create__4("SpecialMesh")({
				MeshType = Enum.MeshType.FileMesh, 
				MeshId = "rbxassetid://818652045", 
				Parent = v123
			});
			u3(0.5, nil, function(p43)
				local v124 = p43 * 0.15;
				u50.Scale = Vector3.new(v124, v124, v124);
			end);
			pcall(function()
				v101.sprite.animation:Pause();
			end);
			local u51 = {};
			for v125 = 1, 6 do
				local v126 = v123:Clone();
				v126.Mesh.Scale = Vector3.new(0.1, 0.1, 0.1);
				u51[v126] = v122 * CFrame.Angles(0, math.pi / 3 * v125, 0) * CFrame.new(0, 0, -1) * CFrame.Angles(2.5, math.random() * 2 * math.pi, 0);
				v126.Parent = workspace;
			end;
			u3(0.4, "easeOutQuad", function(p44)
				for v127, v128 in pairs(u51) do
					v127.CFrame = v128 * CFrame.new(0, 3 * (1 - p44), 0);
				end;
			end);
			local u52 = u36 * Vector3.new(1, 0, 1).unit;
			local u53 = l__sprite__107.spriteData.inAir and 0;
			u3(0.6, nil, function(p45)
				l__sprite__107.offset = u52 * -2 * p45 + Vector3.new(0, math.sin(p45 * math.pi) - u53 * p45, 0);
			end);
			local u54 = false;
			local u55 = l__Utilities__1.Signal();
			local l__magnitude__56 = u36.magnitude;
			local function u57()
				u55:fire();
				local v129 = u52:Cross(Vector3.new(0, 1, 0));
				u51[v123] = true;
				for v130, v131 in pairs(u51) do
					local l__CFrame__132 = v130.CFrame;
					local v133 = CFrame.new(l__CFrame__132.p, l__CFrame__132.p + v129);
					u51[v130] = { v133, v133:inverse() * l__CFrame__132 };
				end;
				u3(0.4, nil, function(p46)
					if not v123.Parent then
						return false;
					end;
					v101.sprite.offset = u52 * p46 * 10 + Vector3.new(0, p46 * 4, 0);
					pcall(function()
						v101.sprite.animation.spriteLabel.Rotation = 500 * p46;
					end);
					local v134 = CFrame.Angles(0, 0, p46 * 1.8);
					local v135 = u52 * p46 * 2 + Vector3.new(0, p46 * -5, 0);
					for v136, v137 in pairs(u51) do
						v136.CFrame = v137[1] * v134 * v137[2] + v135;
					end;
				end);
			end;
			spawn(function()
				u3(1, nil, function(p47, p48)
					if not v123.Parent then
						return false;
					end;
					local v138 = 70 * p48 * p48 - 2 + 5 * p48;
					l__sprite__107.offset = u52 * v138 + Vector3.new(0, -u53, 0);
					if not u54 and l__magnitude__56 <= v138 then
						u54 = true;
						spawn(u57);
					end;
				end);
			end);
			u55:wait();
			l__Utilities__1.FadeOut(0.35, Color3.new(1, 1, 1));
			v108:Remove();
			l__sprite__107.offset = Vector3.new();
			v101.sprite.offset = Vector3.new();
			pcall(function()
				v101.sprite.animation.spriteLabel.Rotation = 0;
			end);
			l__Lighting__109.Ambient = l__Ambient__37;
			l__Lighting__109.OutdoorAmbient = l__OutdoorAmbient__38;
			l__Lighting__109.ColorShift_Bottom = l__ColorShift_Bottom__39;
			l__Lighting__109.ColorShift_Top = l__ColorShift_Top__40;
			l__Lighting__109.FogColor = l__Lighting__109.FogColor;
			l__Lighting__109.FogEnd = l__FogEnd__41;
			l__Lighting__109.FogStart = l__FogStart__42;
			for v139, v140 in pairs(u51) do
				v139:Remove();
			end;
			pcall(function()
				v101.sprite.animation:Play();
			end);
			wait(0.1);
			l__Utilities__1.FadeIn(0.5);
			return true;
		end, 
		bloomdoom = function(p49, p50, p51)
			local u58 = nil;
			local u59 = nil;
			local v141 = p50[1];
			if not v141 then
				return;
			end;
			local l__sprite__142 = p49.sprite;
			local v143 = u1(p49, 2);
			local v144 = u1(v141, 0.5);
			local v145 = l__Create__4("Part")({
				Anchored = true, 
				CanCollide = false, 
				CFrame = p51.CoordinateFrame2 + Vector3.new(0, -3, 0), 
				Parent = workspace,
				l__Create__4("SpecialMesh")({
					MeshType = Enum.MeshType.FileMesh, 
					MeshId = "rbxassetid://20329976", 
					Scale = Vector3.new(0.2, 0.2, 0.2)
				})
			});
			local l__Position__146 = l__sprite__142.part.Position;
			local v147 = l__sprite__142.part.Size.Y / 2;
			local v148 = {};
			for v149 = 1, 6 do
				local v150 = l__Create__4("Part")({
					Transparency = 1, 
					Anchored = true, 
					CanCollide = false, 
					Size = Vector3.new(1, 1, 1), 
					CFrame = CFrame.new(l__Position__146 + Vector3.new(1.5 * math.cos(math.pi / 3 * v149), v147 * 0.5, 1.5 * math.sin(math.pi / 3 * v149)), l__Position__146 + Vector3.new(0, v147 * 0.5, 0)), 
					Parent = workspace
				});
				l__Create__4("Trail")({
					Attachment0 = l__Create__4("Attachment")({
						CFrame = CFrame.new(-0.3, 0.3, -0.3), 
						Parent = v150
					}), 
					Attachment1 = l__Create__4("Attachment")({
						CFrame = CFrame.new(0.3, -0.3, 0.3), 
						Parent = v150
					}), 
					Color = ColorSequence.new(Color3.fromRGB(58, 173, 98), Color3.fromRGB(154, 212, 174)), 
					Transparency = NumberSequence.new(0.5, 1), 
					Lifetime = 1, 
					Parent = v150
				});
				v148[v149] = v150;
			end;
			spawn(function()
				u3(1, nil, function(p52)
					for v151, v152 in pairs(v148) do
						local v153 = math.pi / 3 * v151 + 5 * p52;
						local v154 = 1.5 + math.sin(p52 * math.pi);
						local v155 = l__Position__146 + Vector3.new(v154 * math.cos(v153), v147 * (0.5 - p52), v154 * math.sin(v153));
						v152.CFrame = CFrame.new(v155, Vector3.new(l__Position__146.x, v155.Y, l__Position__146.Z));
					end;
				end);
			end);
			wait(0.3);
			local v156 = Instance.new("Model", workspace);
			local v157 = l__sprite__142.cf + Vector3.new(0, -(l__sprite__142.spriteData.inAir and 0), 0);
			local v158 = v141.sprite.cf + Vector3.new(0, -(v141.sprite.spriteData.inAir and 0), 0);
			local v159 = CFrame.new(v157.p, v158.p);
			local v160 = { "Alder", "Carnation pink", "Persimmon", "Daisy orange", "Pastel Blue" };
			local v161 = 1 - 1;
			while true do
				local u60 = nil;
				for v162 = 1, 2 do
					u58 = v159;
					u60 = v161;
					u59 = v156;
					spawn(function()
						local v163 = p1.storage.Models.Misc.Flower:Clone();
						local l__Main__164 = v163.Main;
						local v165 = BrickColor.new(v160[math.random(#v160)]);
						for v166, v167 in pairs(v163:GetChildren()) do
							if v167:IsA("BasePart") and v167 ~= l__Main__164 then
								v167.BrickColor = v165;
							end;
						end;
						l__Utilities__1.MoveModel(l__Main__164, u58 * CFrame.Angles(0, -0.7 + 2.6 * math.random(), 0) * CFrame.new(0, 0, -u60 * 1.2 + math.random()) * CFrame.Angles(0, math.random(), 0) + Vector3.new(0, 0.05, 0));
						v163.Parent = u59;
						local u61 = 1;
						u3(0.5, nil, function(p53)
							local v168 = 0.2 + 0.4 * p53;
							l__Utilities__1.ScaleModel(l__Main__164, v168 / u61);
							u61 = v168;
						end);
					end);
				end;
				wait(0.1);
				if 0 <= 1 then
					if not (u60 < 10) then
						break;
					end;
				elseif not (u60 > 10) then
					break;
				end;			
			end;
			local u62 = l__Create__4("Part")({
				BrickColor = BrickColor.new("Bright green"), 
				Material = Enum.Material.Neon, 
				Anchored = true, 
				CanCollide = false, 
				Shape = Enum.PartType.Cylinder, 
				Size = Vector3.new(15, 3, 3), 
				Parent = workspace
			});
			local u63 = CFrame.Angles(0, 0, math.pi / 2);
			u3(1, nil, function(p54)
				u62.CFrame = u58 * u63 + Vector3.new(0, p54 * 30 - 15, 0);
			end);
			wait(1);
			u62.Size = Vector3.new(15, 6, 6);
			u3(0.5, nil, function(p55)
				u62.CFrame = v158 * u63 + Vector3.new(0, 22.5 - 15 * p55, 0);
			end);
			local u64 = p1.storage.Models.Misc.Mega.InnerEnergy:Clone();
			l__Utilities__1.ScaleModel(u64.Hinge, 0.35);
			local v169 = u64.Hinge.CFrame * CFrame.Angles(0, 0, math.pi / 2):inverse() * u64.EnergyPart.CFrame;
			local v170 = p1.storage.Models.Misc.Mega.OuterEnergy:Clone();
			l__Utilities__1.ScaleModel(v170.Hinge, 0.35);
			u64.EnergyPart.BrickColor = BrickColor.new("Medium green");
			v170.EnergyPart.BrickColor = BrickColor.new("Sand green");
			u64.Parent = workspace;
			v170.Parent = workspace;
			local l__CurrentCamera__171 = workspace.CurrentCamera;
			local l__CFrame__65 = l__CurrentCamera__171.CFrame;
			local u66 = Vector3.new(0, -1.5, 0);
			local u67 = v170.Hinge.CFrame * CFrame.Angles(0, 0, math.pi / 2):inverse() * v170.EnergyPart.CFrame;
			spawn(function()
				u3(3, nil, function(p56)
					local v172 = math.random() * 0.5;
					local v173 = math.random() * math.pi * 2;
					l__CurrentCamera__171.CFrame = l__CFrame__65 * CFrame.new(v172 * math.cos(v173), v172 * math.sin(v173), 0);
					u64.EnergyPart.CFrame = v158 * CFrame.Angles(0, 10 * p56, 0) * v169 + u66;
					v170.EnergyPart.CFrame = v158 * CFrame.Angles(0, -10 * p56, 0) * u67 + u66;
				end);
			end);
			wait(2.5);
			l__Utilities__1.FadeOut(0.5, Color3.new(1, 1, 1));
			wait(0.3);
			l__CurrentCamera__171.CFrame = l__CFrame__65;
			u59:Remove();
			for v174, v175 in pairs(v148) do
				v175:Remove();
			end;
			v145:Remove();
			u64:Remove();
			v170:Remove();
			u62:Remove();
			l__Utilities__1.FadeIn(0.5);
			return true;
		end
	};
	local function u68(p57, p58, p59)
		local v176 = l__Create__4("Part")({
			Transparency = 1, 
			Anchored = true, 
			CanCollide = false, 
			Size = Vector3.new(0.2, 0.2, 0.2), 
			Parent = workspace
		});
		local v177 = l__Create__4("BillboardGui")({
			Adornee = v176, 
			Size = UDim2.new(p58 and 1, 0, p58 and 1, 0), 
			Parent = v176
		});
		return v176, v177, l__Create__4("ImageLabel")({
			BackgroundTransparency = 1, 
			Image = type(p57) == "number" and "rbxassetid://" .. p57 or p57, 
			ImageColor3 = p59 and nil, 
			Size = UDim2.new(1, 0, 1, 0), 
			ZIndex = 2, 
			Parent = v177
		});
	end;
	function v4.hydrovortex(p60, p61, p62)
		local v178 = p61[1];
		if not v178 then
			return;
		end;
		local l__sprite__179 = p60.sprite;
		local v180 = u1(p60, 2);
		local v181 = u1(v178, 0.5);
		local v182 = v178.sprite.spriteData.inAir and 0;
		local v183 = Instance.new("Model", workspace);
		p1.DataManager:preload("Image", 650846795);
		for v184, v185 in pairs({ 165709404, 212966179, 1051557 }) do
			local v186 = l__Create__4("Part")({
				Anchored = true, 
				CanCollide = false, 
				CFrame = p62.CoordinateFrame2 + Vector3.new(0, -3, 0), 
				Parent = v183,
				l__Create__4("SpecialMesh")({
					MeshType = Enum.MeshType.FileMesh, 
					MeshId = "rbxassetid://" .. v185, 
					Scale = Vector3.new(0.2, 0.2, 0.2)
				})
			});
		end;
		local l__CFrame__187 = v178.sprite.part.CFrame;
		local l__Color__188 = BrickColor.new("Pastel Blue").Color;
		local u69 = v181 - v180;
		local u70 = l__CFrame__187 - l__CFrame__187.p;
		spawn(function()
			for v189 = 1, 50 do
				spawn(function()
					local v190, v191 = u68(650846795, 1, Color3.fromHSV((210 + math.random() * 20) / 360, 0.8, 0.75));
					u3(0.4, nil, function(p63)
						v190.CFrame = CFrame.new(v180 + u69 * p63);
						v191.Size = UDim2.new(1 + 2 * p63, 0, 1 + 2 * p63, 0);
					end);
					v190:Remove();
					for v192 = 1, 2 do
						local v193 = math.random() * 360;
						p1.Particles:new({
							Color = l__Color__188, 
							Image = 650846795, 
							Lifetime = 0.5, 
							Size = 1, 
							Position = v181, 
							Velocity = 5 * (u70 * Vector3.new(math.cos(math.rad(v193)), math.sin(math.rad(v193)), 0)), 
							Acceleration = false, 
							OnUpdate = function(p64, p65)
								p65.BillboardGui.ImageLabel.ImageTransparency = 0.3 + 0.7 * p64;
							end
						});
					end;
				end);
				wait(0.05);
			end;
		end);
		wait(1.7);
		local v194 = l__Create__4("Part")({
			BrickColor = BrickColor.new("Bright blue"), 
			Material = Enum.Material.Foil, 
			TopSurface = Enum.SurfaceType.Smooth, 
			BottomSurface = Enum.SurfaceType.Smooth, 
			CanCollide = false, 
			Anchored = true, 
			Size = Vector3.new(250, 50, 250), 
			Parent = workspace
		});
		local l__CFrame__195 = workspace.CurrentCamera.CFrame;
		local v196 = CFrame.new((p62.CoordinateFrame1.p + p62.CoordinateFrame2.p) / 2) + Vector3.new(0, -10, 0);
		local v197 = Vector3.new(0, l__CFrame__195.y - v196.Y + 3, 0);
		local v198 = l__Create__4("Frame")({
			BorderSizePixel = 0, 
			BackgroundTransparency = 0.6, 
			BackgroundColor3 = v194.BrickColor.Color, 
			Size = UDim2.new(1, 0, 1, 36), 
			ZIndex = 10, 
			Parent = l__Utilities__1.frontGui
		});
		local v199 = l__CFrame__195.upVector.Y * 0.5 * math.tan(math.rad(workspace.CurrentCamera.FieldOfView) / 2);
		local u71 = l__CFrame__195.y + l__CFrame__195.lookVector.Y * 0.5 + v199;
		local u72 = v199 * 2;
		u3(1.6, nil, function(p66)
			local v200 = v196 + v197 * p66;
			v194.CFrame = v200 + Vector3.new(0, -25, 0);
			local v201 = math.max(0, (u71 - v200.y) / u72);
			v198.Position = UDim2.new(0, 0, v201, -36 * (1 - v201));
		end);
		if v182 > 0 then
			u3(1, nil, function(p67)
				v178.sprite.offset = Vector3.new(0, -v182 * p67, 0);
			end);
		end;
		wait(0.5);
		local u73 = u69 * Vector3.new(1, 0, 1).unit;
		local u74 = l__sprite__179.spriteData.inAir and 0;
		u3(0.6, nil, function(p68)
			l__sprite__179.offset = u73 * -2 * p68 + Vector3.new(0, math.sin(p68 * math.pi) - u74 * p68, 0);
		end);
		local u75 = l__Utilities__1.Signal();
		local l__Y__202 = l__sprite__179.part.Size.Y;
		local v203 = l__Create__4("Part")({
			BrickColor = BrickColor.new("Bright blue"), 
			Anchored = true, 
			CanCollide = false, 
			Size = Vector3.new(1, 1, 1), 
			Parent = workspace,
			l__Create__4("SpecialMesh")({
				MeshType = Enum.MeshType.FileMesh, 
				MeshId = "rbxassetid://212966179", 
				Scale = Vector3.new(1.1, 1.8, 1.1) * l__Y__202
			})
		});
		local v204 = l__Create__4("Part")({
			BrickColor = BrickColor.new("Bright blue"), 
			Transparency = 0.5, 
			Anchored = true, 
			CanCollide = false, 
			Size = Vector3.new(1, 1, 1), 
			Parent = workspace,
			l__Create__4("SpecialMesh")({
				MeshType = Enum.MeshType.FileMesh, 
				MeshId = "rbxassetid://165709404", 
				Scale = Vector3.new(2, 2, 2) * l__Y__202
			})
		});
		local v205 = l__sprite__179.cf.p + Vector3.new(0, l__Y__202 / 2, 0);
		local v206 = CFrame.new(v205, v205 + u73) * CFrame.Angles(-math.pi / 2, 0, 0);
		local u76 = v206 * CFrame.new(0, -0.48 * l__Y__202, 0) * CFrame.Angles(math.pi, 0, 0);
		local u77 = false;
		local l__magnitude__78 = u69.magnitude;
		local function u79()
			local v207 = l__Create__4("Part")({
				BrickColor = BrickColor.new("Storm blue"), 
				Anchored = true, 
				CanCollide = false, 
				Size = Vector3.new(1, 1, 1), 
				Parent = workspace,
				l__Create__4("SpecialMesh")({
					MeshType = Enum.MeshType.FileMesh, 
					MeshId = "rbxassetid://1051557", 
					Scale = Vector3.new(4, 4, 4)
				})
			});
			local v208 = v207:Clone();
			v208.Parent = workspace;
			local u80 = v178.sprite.cf + Vector3.new(0, 3 - v182, 0) + workspace.CurrentCamera.CFrame.lookVector * -0.3;
			l__Utilities__1.Tween(4, nil, function(p69, p70)
				if p70 < 0.7 then
					v207.Transparency = math.max(0, 1 - 2 * p70);
					v208.Transparency = v207.Transparency;
				elseif p70 > 3 then
					v207.Transparency = p70 - 3;
					v208.Transparency = v207.Transparency;
				end;
				v207.CFrame = u80 * CFrame.Angles(0, -5 * p70, 0);
				v208.CFrame = u80 * CFrame.Angles(0, -5 * p70 + 3.14, 0);
				v178.sprite.offset = Vector3.new(0, 1 - math.cos(p70 * math.pi * 2) - v182, 0);
				v178.sprite.animation.spriteLabel.Rotation = 360 * p70 * 3;
			end);
			v207:Remove();
			v208:Remove();
			u75:fire();
		end;
		u3(1, nil, function(p71, p72)
			local v209 = 70 * p72 * p72 - 2 + 5 * p72;
			local v210 = u73 * v209 + Vector3.new(0, -u74, 0);
			l__sprite__179.offset = v210;
			v203.CFrame = v206 + v210;
			v204.CFrame = u76 + v210;
			local v211 = math.min(1, p72 * 3);
			v203.Transparency = 1 - 0.2 * v211;
			v204.Transparency = 1 - 0.5 * v211;
			if not u77 and l__magnitude__78 <= v209 then
				u77 = true;
				spawn(u79);
			end;
		end);
		v203:Remove();
		v204:Remove();
		u75:wait();
		v183:Remove();
		u3(2, nil, function(p73)
			local v212 = v196 + v197 * (1 - p73);
			v194.CFrame = v212 + Vector3.new(0, -25, 0);
			local v213 = math.max(0, (u71 - v212.y) / u72);
			v198.Position = UDim2.new(0, 0, v213, -36 * (1 - v213));
			l__sprite__179.offset = Vector3.new(0, math.max(0, v212.y - l__sprite__179.cf.y), 0);
		end);
		v194:Remove();
		v198:Remove();
		if v182 > 0 then
			spawn(function()
				u3(0.5, nil, function(p74)
					v178.sprite.offset = Vector3.new(0, -v182 * (1 - p74), 0);
				end);
			end);
		end;
		return true;
	end;
	function v4.infernooverdrive(p75, p76, p77)
		local v214 = p76[1];
		if not v214 then
			return;
		end;
		local l__sprite__215 = p75.sprite;
		local v216 = u1(p75, 2);
		local v217 = u1(v214, 0.5) - v216;
		local v218 = Instance.new("Model", workspace);
		p1.DataManager:preload("Image", 879747500);
		for v219, v220 in pairs({ 165709404, 212966179 }) do
			local v221 = l__Create__4("Part")({
				Anchored = true, 
				CanCollide = false, 
				CFrame = p77.CoordinateFrame2 + Vector3.new(0, -3, 0), 
				Parent = v218,
				l__Create__4("SpecialMesh")({
					MeshType = Enum.MeshType.FileMesh, 
					MeshId = "rbxassetid://" .. v220, 
					Scale = Vector3.new(0.2, 0.2, 0.2)
				})
			});
		end;
		local l__CFrame__222 = v214.sprite.part.CFrame;
		local v223 = l__CFrame__222 - l__CFrame__222.p;
		local v224 = {};
		for v225 = 1, 6 do
			local v226 = l__Create__4("Part")({
				Transparency = 1, 
				Anchored = true, 
				CanCollide = false, 
				Size = Vector3.new(1, 1, 1), 
				CFrame = v223 * CFrame.Angles(0, 0, math.pi / 3 * v225) * CFrame.new(0, 3, 0) + v216, 
				Parent = workspace
			});
			l__Create__4("Trail")({
				Attachment0 = l__Create__4("Attachment")({
					CFrame = CFrame.new(-0.3, 0.3, -0.3), 
					Parent = v226
				}), 
				Attachment1 = l__Create__4("Attachment")({
					CFrame = CFrame.new(0.3, -0.3, 0.3), 
					Parent = v226
				}), 
				Color = ColorSequence.new(Color3.new(0.9, 0.1, 0), Color3.new(1, 1, 0)), 
				Transparency = NumberSequence.new(0.5, 1), 
				Lifetime = 1, 
				Parent = v226
			});
			v224[v225] = v226;
		end;
		local u81 = l__Create__4("Part")({
			BrickColor = BrickColor.new("Bright orange"), 
			Material = Enum.Material.Neon, 
			Anchored = true, 
			CanCollide = false, 
			TopSurface = Enum.SurfaceType.Smooth, 
			BottomSurface = Enum.SurfaceType.Smooth, 
			Shape = Enum.PartType.Ball, 
			Parent = workspace
		});
		local l__Y__82 = l__sprite__215.part.Size.Y;
		u3(1, nil, function(p78)
			u81.Size = Vector3.new(p78, p78, p78) * l__Y__82;
			u81.CFrame = CFrame.new(v216);
			for v227, v228 in pairs(v224) do
				v228.CFrame = v223 * CFrame.Angles(0, 0, math.pi / 3 * v227 + 6 * p78) * CFrame.new(0, 2 * (1 - p78) + 1, 0) + v216;
			end;
		end);
		local u83 = v217 * Vector3.new(1, 0, 1).unit;
		local u84 = l__sprite__215.spriteData.inAir and 0;
		u3(0.6, nil, function(p79)
			l__sprite__215.offset = u83 * -2 * p79 + Vector3.new(0, math.sin(p79 * math.pi) - u84 * p79, 0);
		end);
		local u85 = v214.sprite.spriteData.inAir and 0;
		local l__Y__86 = v214.sprite.part.Size.Y;
		local u87 = l__Utilities__1.Signal();
		local l__Y__229 = l__sprite__215.part.Size.Y;
		local v230 = l__Create__4("Part")({
			BrickColor = BrickColor.new("CGA brown"), 
			Anchored = true, 
			CanCollide = false, 
			Size = Vector3.new(1, 1, 1), 
			Parent = workspace,
			l__Create__4("SpecialMesh")({
				MeshType = Enum.MeshType.FileMesh, 
				MeshId = "rbxassetid://212966179", 
				Scale = Vector3.new(1.1, 1.8, 1.1) * l__Y__229
			})
		});
		local v231 = l__Create__4("Part")({
			BrickColor = BrickColor.new("CGA brown"), 
			Transparency = 0.5, 
			Anchored = true, 
			CanCollide = false, 
			Size = Vector3.new(1, 1, 1), 
			Parent = workspace,
			l__Create__4("SpecialMesh")({
				MeshType = Enum.MeshType.FileMesh, 
				MeshId = "rbxassetid://165709404", 
				Scale = Vector3.new(2, 2, 2) * l__Y__229
			})
		});
		local v232 = l__sprite__215.cf.p + Vector3.new(0, l__Y__229 / 2, 0);
		local v233 = CFrame.new(v232, v232 + u83) * CFrame.Angles(-math.pi / 2, 0, 0);
		local u88 = v233 * CFrame.new(0, -0.48 * l__Y__229, 0) * CFrame.Angles(math.pi, 0, 0);
		local u89 = false;
		local l__magnitude__90 = v217.magnitude;
		local function u91()
			local u92 = l__Create__4("Part")({
				BrickColor = BrickColor.new("Bright orange"), 
				Material = Enum.Material.Neon, 
				Anchored = true, 
				CanCollide = false, 
				TopSurface = Enum.SurfaceType.Smooth, 
				BottomSurface = Enum.SurfaceType.Smooth, 
				Shape = Enum.PartType.Ball, 
				Parent = workspace
			});
			local u93 = v214.sprite.cf + Vector3.new(0, -u85, 0);
			spawn(function()
				local l__Color__234 = BrickColor.new("Bright yellow").Color;
				for v235 = 1, 10 do
					spawn(function()
						local v236 = math.random() * math.pi * 2;
						local v237 = math.random() * math.pi / 2;
						local v238 = {
							Color = l__Color__234, 
							Image = 879747500, 
							Lifetime = 0.7, 
							Size = 1, 
							Position = u93.p + u92.Size.Y / 2 * Vector3.new(math.cos(v236) * math.cos(v237), math.sin(v237), math.sin(v236) * math.cos(v237)), 
							Rotation = math.random() * 360
						};
						if math.random(2) == 1 then
							local v239 = 1;
						else
							v239 = -1;
						end;
						v238.RotVelocity = 100 * v239;
						v238.Acceleration = false;
						function v238.OnUpdate(p80, p81)
							if p80 > 0.7 then
								p81.BillboardGui.ImageLabel.ImageTransparency = 0.4 + 2 * (p80 - 0.7);
							end;
						end;
						p1.Particles:new(v238);
					end);
					wait(0.1);
				end;
			end);
			local u94 = math.max(7, l__Y__86 * 2);
			u3(0.5, "easeOutCubic", function(p82)
				v214.sprite.offset = Vector3.new(0, -u85 * p82, 0);
				local v240 = u94 * p82;
				u92.Size = Vector3.new(v240, v240, v240);
				u92.CFrame = u93;
			end);
			spawn(function()
				u3(0.5, nil, function(p83)
					local v241 = u94 + 0.5 * p83;
					u92.Size = Vector3.new(v241, v241, v241);
					u92.CFrame = u93;
				end);
				u3(0.5, nil, function(p84)
					local v242 = u94 + 0.5 + 4 * p84;
					u92.Size = Vector3.new(v242, v242, v242);
					u92.CFrame = u93;
				end);
			end);
			local l__CurrentCamera__243 = workspace.CurrentCamera;
			delay(0.5, function()
				l__Utilities__1.FadeOut(0.5, Color3.new(1, 1, 1));
			end);
			local l__CFrame__95 = l__CurrentCamera__243.CFrame;
			u3(1, nil, function(p85)
				local v244 = math.random() * p85 * 0.5;
				local v245 = math.random() * math.pi * 2;
				l__CurrentCamera__243.CFrame = l__CFrame__95 * CFrame.new(v244 * math.cos(v245), v244 * math.sin(v245), 0);
			end);
			wait(0.3);
			u92:Remove();
			l__CurrentCamera__243.CFrame = l__CFrame__95;
			u87:fire();
		end;
		u3(1, nil, function(p86, p87)
			local v246 = 70 * p87 * p87 - 2 + 5 * p87;
			local v247 = u83 * v246 + Vector3.new(0, -u84, 0);
			l__sprite__215.offset = v247;
			v230.CFrame = v233 + v247;
			v231.CFrame = u88 + v247;
			local v248 = math.min(1, p87 * 3);
			v230.Transparency = 1 - 0.2 * v248;
			v231.Transparency = 1 - 0.5 * v248;
			if v246 > 2 then
				u81.CFrame = CFrame.new(v216 + u83 * (v246 - 2));
			end;
			if not u89 and l__magnitude__90 <= v246 then
				u89 = true;
				spawn(u91);
			end;
		end);
		v218:Remove();
		u87:wait();
		u81:Remove();
		for v249, v250 in pairs(v224) do
			v250:Remove();
		end;
		l__sprite__215.offset = Vector3.new();
		v214.offset = Vector3.new();
		l__Utilities__1.FadeIn(0.5);
		return true;
	end;
	v4.status = {
		psn = function(p88)
			local l__Particles__251 = p1.Particles;
			local v252 = p88.status == "tox";
			local l__part__253 = p88.sprite.part;
			for v254 = 1, 10 do
				wait(0.1);
				if v252 and not Color3.new(0.43529411764705883, 0.03529411764705882, 0.37254901960784315) then

				end;
				l__Particles__251:new({
					Position = l__part__253.CFrame * CFrame.new(l__part__253.Size.X * (math.random() - 0.5) * 0.7, -l__part__253.Size.Y / 2 * math.random() * 0.8, -0.2).p, 
					Velocity = Vector3.new(0, 3, 0), 
					Acceleration = false, 
					Color = Color3.new(0.6862745098039216, 0.41568627450980394, 0.807843137254902), 
					Lifetime = 0.5, 
					Image = 243953162, 
					OnUpdate = function(p89, p90)
						local v255 = 0.8 * math.sin(p89 * math.pi);
						p90.BillboardGui.Size = UDim2.new(v255, 0, v255, 0);
					end
				});
			end;
		end, 
		brn = function(p91)
			local l__Particles__256 = p1.Particles;
			local l__part__257 = p91.sprite.part;
			for v258 = 1, 10 do
				wait(0.1);
				l__Particles__256:new({
					Position = l__part__257.CFrame * CFrame.new(l__part__257.Size.X * (math.random() - 0.5) * 0.7, -l__part__257.Size.Y / 2 * math.random() * 0.8, -0.2).p, 
					Velocity = Vector3.new(0, 4, 0), 
					Acceleration = false, 
					Lifetime = 0.5, 
					Image = 11601142, 
					OnUpdate = function(p92, p93)
						local v259 = 1.2 * math.cos(p92 * math.pi / 2);
						p93.BillboardGui.Size = UDim2.new(v259, 0, v259, 0);
					end
				});
			end;
		end, 
		par = function(p94)
			local l__Particles__260 = p1.Particles;
			local l__part__261 = p94.sprite.part;
			p94.sprite.animation:Pause();
			for v262 = 1, 10 do
				wait(0.1);
				l__Particles__260:new({
					Position = l__part__261.CFrame * CFrame.new(l__part__261.Size.X * (math.random() - 0.5) * 0.7, -l__part__261.Size.Y * (math.random() - 0.5) * 0.7, -0.2).p, 
					Size = 0.7 + 0.4 * math.random(), 
					Acceleration = false, 
					Lifetime = 0.2, 
					Image = { 326993171, 326993181, 326993188 }, 
					Rotation = 360 * math.random()
				});
			end;
			delay(0.5, function()
				p94.sprite.animation:Play();
			end);
		end, 
		slp = function(p95)
			local l__Particles__263 = p1.Particles;
			local l__part__264 = p95.sprite.part;
			local v265 = 1;
			if p95.side.n == 2 then
				v265 = -1;
			end;
			for v266 = 1, 5 do
				local v267 = {
					Position = l__part__264.CFrame * CFrame.new(l__part__264.Size.X * -0.25 * v265, l__part__264.Size.Y * 0.4, -0.2).p, 
					Velocity = Vector3.new(0, 1, 0), 
					Acceleration = false, 
					Lifetime = 1, 
					Color = Color3.new(0.7, 0.7, 0.7), 
					Image = 77146622
				};
				function v267.OnUpdate(p96, p97)
					local v268 = 0.2 + 0.4 * math.sin(p96 * math.pi / 2);
					p97.BillboardGui.Size = UDim2.new(v268, 0, v268, 0);
					p97.BillboardGui.ImageLabel.Rotation = -30 * p96 * v265;
					if p96 > 0.6 then
						p97.BillboardGui.ImageLabel.ImageTransparency = (p96 - 0.6) / 0.4;
					end;
				end;
				l__Particles__263:new(v267);
				wait(0.3);
			end;
		end, 
		confused = function(p98)
			local l__part__269 = p98.sprite.part;
			local v270 = l__part__269.CFrame * CFrame.new(0, l__part__269.Size.Y / 2 + 0.25, 0);
			local v271 = l__Create__4("Part")({
				Anchored = true, 
				CanCollide = false, 
				Size = Vector3.new(0.2, 0.2, 0.2), 
				Parent = workspace,
				l__Create__4("SpecialMesh")({
					MeshType = Enum.MeshType.FileMesh, 
					MeshId = "rbxassetid://9419831", 
					TextureId = "rbxassetid://9419827", 
					Scale = Vector3.new(0.5, 0.5, 0.5)
				})
			});
			local v272 = v271:Clone();
			local v273 = v271:Clone();
			v272.Parent = workspace;
			v273.Parent = workspace;
			local u96 = math.pi * 2 / 3;
			local u97 = math.pi * 4 / 3;
			local u98 = l__part__269.Size.X * 0.45;
			u3(1.5, nil, function(p99)
				local v274 = p99 * 7;
				local v275 = v274 + u96;
				local v276 = v274 + u97;
				v271.CFrame = v270 * CFrame.new(math.cos(v274) * u98, 0, math.sin(v274) * u98) * CFrame.Angles(0, v274 * 2, 0);
				v272.CFrame = v270 * CFrame.new(math.cos(v275) * u98, 0, math.sin(v275) * u98) * CFrame.Angles(0, v275 * 2, 0);
				v273.CFrame = v270 * CFrame.new(math.cos(v276) * u98, 0, math.sin(v276) * u98) * CFrame.Angles(0, v276 * 2, 0);
			end);
			v271:Remove();
			v272:Remove();
			v273:Remove();
		end, 
		heal = function(p100)
			local l__sprite__277 = p100.sprite;
			local l__CFrame__278 = l__sprite__277.part.CFrame;
			local l__Size__279 = l__sprite__277.part.Size;
			for v280 = 1, 8 do
				local v281 = {
					Rotation = math.random() * 360
				};
				if math.random(2) == 1 then
					local v282 = 1;
				else
					v282 = -1;
				end;
				v281.RotVelocity = v282 * (80 + math.random(80));
				v281.Image = 644321851;
				v281.Color = Color3.fromHSV((150 + math.random() * 20) / 360, 0.5, 1);
				v281.Position = l__CFrame__278 * Vector3.new((math.random() - 0.5) * 0.8 * l__Size__279.X, (math.random() - 0.5) * 0.8 * l__Size__279.Y, -0.5);
				v281.Lifetime = 0.7;
				v281.Acceleration = false;
				v281.Velocity = Vector3.new(0, 1.5, 0);
				function v281.OnUpdate(p101, p102)
					local v283 = math.sin(p101 * math.pi);
					p102.BillboardGui.Size = UDim2.new(0.5 * v283, 0, 0.5 * v283, 0);
				end;
				p1.Particles:new(v281);
				wait(0.06);
			end;
		end
	};
	v4.prepare = {
		bounce = function(p103, p104, p105, p106, p107)
			local u99 = nil;
			local l__sprite__284 = p103.sprite;
			if p107 then
				l__sprite__284.offset = Vector3.new(0, 10, 0);
				return;
			end;
			local v285 = 1 - 1;
			while true do
				u99 = l__sprite__284;
				local u100 = v285;
				u3(0.7, nil, function(p108)
					u99.offset = Vector3.new(0, 2 * u100 * math.sin(p108 * math.pi), 0);
				end);
				if 0 <= 1 then
					if not (u100 < 2) then
						break;
					end;
				elseif not (u100 > 2) then
					break;
				end;
				u100 = u100 + 1;			
			end;
			u3(0.5, "easeOutCubic", function(p109)
				u99.offset = Vector3.new(0, 10 * p109, 0);
			end);
			return p103:getName() .. " sprang up!";
		end, 
		dig = function(p110, p111, p112, p113, p114)
			local l__sprite__286 = p110.sprite;
			local v287 = l__sprite__286.part.Size.Y + (l__sprite__286.spriteData.inAir and 0) + 0.2;
			if p114 then
				l__sprite__286.offset = Vector3.new(0, -v287, 0);
				return;
			end;
			local v288 = 1 - 1;
			while true do
				local u101 = v288;
				u3(0.25, "easeOutCubic", function(p115)
					l__sprite__286.offset = Vector3.new(0, (u101 - 1 + p115) / 5 * -v287, 0);
				end);
				wait(0.1);
				if 0 <= 1 then
					if not (u101 < 5) then
						break;
					end;
				elseif not (u101 > 5) then
					break;
				end;
				u101 = u101 + 1;			
			end;
			return p110:getName() .. " burrowed its way under the ground!";
		end, 
		dive = function(p116, p117, p118, p119, p120)
			local v289 = nil;
			local l__sprite__290 = p116.sprite;
			v289 = l__sprite__290.part.Size.Y + (l__sprite__290.spriteData.inAir and 0);
			if p120 then
				l__sprite__290.offset = Vector3.new(0, -v289, 0);
				return;
			end;
			u3(0.9, "easeOutCubic", function(p121)
				l__sprite__290.offset = Vector3.new(0, p121 * -v289, 0);
			end);
			return p116:getName() .. " hid underwater!";
		end, 
		fly = function(p122, p123, p124, p125, p126)
			local v291 = nil;
			v291 = p122.sprite;
			if p126 then
				v291.offset = Vector3.new(0, 10, 0);
				return;
			end;
			u3(1, "easeInCubic", function(p127)
				v291.offset = Vector3.new(0, 10 * p127, 0);
			end);
			return p122:getName() .. " flew up high!";
		end, 
		freezeshock = function(p128, p129, p130, p131, p132)
			return p128:getName() .. " became cloaked in a freezing light!";
		end, 
		geomancy = function(p133, p134, p135, p136, p137)
			return p133:getName() .. " is absorbing power!";
		end, 
		iceburn = function(p138, p139, p140, p141, p142)
			return p138:getName() .. " became cloaked in freezing air!";
		end, 
		razorwind = function(p143, p144, p145, p146, p147)
			return p143:getName() .. " whipped up a whirlwind!";
		end, 
		shadowforce = function(p148, p149, p150, p151, p152)
			local v292 = nil;
			v292 = p148.sprite.animation.spriteLabel;
			if p152 then
				v292.ImageTransparency = 1;
				return;
			end;
			u3(0.5, "easeOutCubic", function(p153)
				v292.ImageTransparency = p153;
			end);
			return p148:getName() .. " vanished instantly!";
		end, 
		solarbeam = function(p154, p155, p156, p157, p158)
			return p154:getName() .. " absorbed light!";
		end, 
		solarblade = function(p159, p160, p161, p162, p163)
			return p159:getName() .. " absorbed light!";
		end, 
		skullbash = function(p164, p165, p166, p167, p168)
			return p164:getName() .. " tucked in its head!";
		end, 
		skyattack = function(p169, p170, p171, p172, p173)
			return p169:getName() .. " became cloaked in a harsh light!";
		end, 
		skydrop = function(p174, p175, p176, p177, p178)
			local v293 = nil;
			if not p175 then
				return;
			end;
			p175.skydropper = p174;
			local l__sprite__294 = p174.sprite;
			v293 = (p175.sprite.cf.p - l__sprite__294.cf.p) * Vector3.new(0.9, 0, 0.9) + Vector3.new(0, p175.sprite.part.Size.Y * 0.3, 0);
			if p178 then
				l__sprite__294.offset = v293 + Vector3.new(0, 10, 0);
				p175.sprite.offset = Vector3.new(0, 10, 0);
				return;
			end;
			local l__offset__102 = l__sprite__294.offset;
			u3(0.6, nil, function(p179)
				l__sprite__294.offset = l__offset__102 + (v293 - l__offset__102) * p179;
			end);
			u3(1, "easeInCubic", function(p180)
				local v295 = Vector3.new(0, 10 * p180, 0);
				l__sprite__294.offset = v293 + v295;
				p175.sprite.offset = v295;
			end);
			return p174:getName() .. " took " .. p175:getLowerName() .. " into the sky!";
		end
	};
	local function u103(p181, p182, p183, p184)
		local v296 = u1(p182);
		local v297 = u1(p181) - v296;
		local l__CFrame__298 = p182.sprite.part.CFrame;
		local v299 = l__CFrame__298 - l__CFrame__298.p;
		for v300 = 1, p183 and 6 do
			local v301 = math.random() * 6.3;
			local v302 = {
				Image = 478035064, 
				Color = p184 or Color3.fromHSV((90 + 40 * math.random()) / 360, 1, 0.75), 
				Lifetime = 0.9, 
				Size = 0.7
			};
			local u104 = v299 * Vector3.new(math.cos(v301), math.sin(v301), 0) * 0.75;
			local u105 = math.random() * 6.3;
			function v302.OnUpdate(p185, p186)
				p186.CFrame = CFrame.new(v296 + v297 * p185 + (1 - p185 * 0.6) * (u104 + Vector3.new(0, math.sin(u105 + p185 * 3), 0)));
			end;
			p1.Particles:new(v302);
			wait(0.06);
		end;
		wait(0.7);
	end;
	function v4.absorb(p187, p188)
		local v303 = p188[1];
		if not v303 then
			return;
		end;
		u103(p187, v303);
		return true;
	end;
	local function cut(p189, p190, p191, p192, p193)
		local v304 = {};
		if p191 == 3 then
			for v305 = 1, 3 do
				local v306 = l__ReplicatedStorage__2.Models.Misc.SlashEffect:Clone();
				local v307 = v306.Size * 4;
				v304[v306] = p189.sprite.part.CFrame * CFrame.new(0, 0, -1) * CFrame.new(Vector3.new(0.6, 0.6, 0) * (v305 - 2));
				v306.BrickColor = BrickColor.new(p190 and "White");
				v306.Parent = workspace;
			end;
		elseif p191 == 2 then
			local v308 = l__ReplicatedStorage__2.Models.Misc.SlashEffect:Clone();
			local v309 = v308.Size * 4;
			v304[v308] = p189.sprite.part.CFrame * CFrame.new(0, 0, -1);
			v308.BrickColor = BrickColor.new(p190 and "White");
			v308.Parent = workspace;
			local v310 = v308:Clone();
			v304[v310] = p189.sprite.part.CFrame * CFrame.new(0, 0, -1) * CFrame.Angles(0, 0, -math.pi / 2);
			v310.Parent = workspace;
		else
			local v311 = l__ReplicatedStorage__2.Models.Misc.SlashEffect:Clone();
			v309 = v311.Size * 4;
			v304[v311] = p189.sprite.part.CFrame * CFrame.new(0, 0, -1);
			v311.BrickColor = BrickColor.new(p190 and "White");
			v311.Parent = workspace;
		end;
		u3(0.4, nil, function(p194)
			for v312, v313 in pairs(v304) do
				v312.Size = v309 * (0.2 + 1.2 * math.sin(p194 * math.pi)) * 0.1;
				v312.CFrame = v313 * CFrame.new((-3 + 6 * p194) * 0.2, (3 - 6 * p194) * 0.2, 0) * CFrame.Angles(0, math.pi / 2, 0) * CFrame.Angles(math.pi / 4, 0, 0);
			end;
		end);
		for v314, v315 in pairs(v304) do
			v314:Remove();
		end;
	end;
	function v4.aerialace(p195, p196)
		local v316 = p196[1];
		if not v316 then
			return;
		end;
		cut(v316, "Medium blue");
		return "sound";
	end;
	local l__RenderStepped__107 = game:GetService("RunService").RenderStepped;
	function v4.aurasphere(p197, p198)
		local v317 = p198[1];
		if not v317 then
			return true;
		end;
		local l__sprite__318 = p197.sprite;
		local v319 = u1(p197, 2.5);
		local v320 = CFrame.new(v319, v319 + workspace.CurrentCamera.CFrame.lookVector);
		local function v321(p199)
			local v322 = l__Create__4("Part")({
				Transparency = 1, 
				Anchored = true, 
				CanCollide = false, 
				Size = Vector3.new(0.2, 0.2, 0.2), 
				Parent = workspace
			});
			return v322, l__Create__4("BillboardGui")({
				Adornee = v322, 
				Size = UDim2.new(0.7, 0, 0.7, 0), 
				Parent = v322,
				l__Create__4("ImageLabel")({
					BackgroundTransparency = 1, 
					Image = "rbxassetid://478035064", 
					ImageTransparency = 0.15, 
					ImageColor3 = Color3.fromHSV(p199 / 360, 1, 0.85), 
					Size = UDim2.new(1, 0, 1, 0), 
					ZIndex = 2
				})
			});
		end;
		local v323, v324 = v321(260);
		v323.CFrame = v320;
		local u108 = { v323 };
		local u109 = v320;
		delay(0.3, function()
			for v325 = 2, 11 do
				local v326 = math.random() * 6.28;
				local v327 = Vector3.new(math.cos(v326), math.sin(v326), 0.5);
				local v328, v329 = v321(math.random(175, 230));
				u108[v325] = v328;
				local u110 = math.random() * 0.35 + 0.2;
				spawn(function()
					local u111 = tick();
					local function u112(p200)
						local v330 = (tick() - u111) * 7;
						v328.CFrame = u109 * CFrame.new(v327 * p200 + 0.125 * Vector3.new(math.cos(v330), math.sin(v330) * math.cos(v330), 0));
					end;
					u3(0.2, "easeOutCubic", function(p201)
						if not v328.Parent then
							return false;
						end;
						v329.Size = UDim2.new(0.5 * p201, 0, 0.5 * p201, 0);
						u112(u110 + 0.6);
					end);
					u3(0.25, "easeOutCubic", function(p202)
						if not v328.Parent then
							return false;
						end;
						u112(u110 + 0.6 * (1 - p202));
					end);
					while v328.Parent do
						u112(u110);
						l__RenderStepped__107:wait();					
					end;
				end);
				wait(0.1);
			end;
		end);
		u3(1.5, nil, function(p203)
			v324.Size = UDim2.new(2.5 * p203, 0, 2.5 * p203, 0);
		end);
		wait(0.3);
		local v331 = u1(v317) - v319;
		u3(v331.magnitude / 30, nil, function(p204)
			u109 = u109 + v331 * p204;
			v323.CFrame = u109;
		end);
		for v332, v333 in pairs(u108) do
			v333:Remove();
		end;
		return true;
	end;
	local function u113(p205, p206, p207, p208)
		local v334 = l__ReplicatedStorage__2.Models.Misc.Bite:Clone();
		if p208 then
			l__Utilities__1.ScaleModel(v334.Main, 1.3);
		end;
		local l__Top__335 = v334.Top;
		local l__Bottom__336 = v334.Bottom;
		local v337 = v334.Main.CFrame:inverse();
		v334.Main:Remove();
		v334.Parent = workspace;
		local v338 = CFrame.new(u1(p205, 2.5), u1(p205, 0));
		if p206 then
			delay(0.25, function()
				local l__Particles__339 = p1.Particles;
				local v340 = 0.5 * (p207 and 1);
				for v341 = 1, 5 do
					wait(0.04);
					for v342 = 1, 2 do
						local v343 = math.random();
						local v344 = math.random() * math.pi * 2;
						local v345 = Vector3.new(v343 * math.cos(v344), v343 * 0.5 * math.sin(v344), 0);
						local v346 = (v338 - v338.p) * v345.unit;
						local v347 = {
							Position = v338 * (v345 + Vector3.new(0, 0, -1)), 
							Rotation = -math.deg(v344) + 90, 
							Velocity = v346 * 6, 
							Acceleration = -v346 * 7, 
							Lifetime = 0.7, 
							Image = p206
						};
						function v347.OnUpdate(p209, p210)
							local v348 = v340 * math.sin(p209 * math.pi);
							p210.BillboardGui.Size = UDim2.new(v348, 0, v348, 0);
						end;
						l__Particles__339:new(v347);
					end;
				end;
			end);
		end;
		local u114 = v337 * l__Top__335.CFrame;
		local u115 = v337 * l__Bottom__336.CFrame;
		u3(0.6, "easeInOutQuad", function(p211)
			local v349 = (1 + math.sin(0.5 + p211 * 5.28)) / 2;
			local v350 = CFrame.new(0, 0, -0.6 * (1 - v349));
			l__Top__335.CFrame = v338 * v350 * CFrame.Angles(0.7 * v349, 0, 0) * u114;
			l__Bottom__336.CFrame = v338 * v350 * CFrame.Angles(-0.7 * v349, 0, 0) * u115;
		end);
		v334:Remove();
	end;
	function v4.bite(p212, p213)
		local v351 = p213[1];
		if not v351 then
			return true;
		end;
		l__Utilities__1.fastSpawn(function()
			u113(v351);
		end);
		wait(0.35);
		return "sound";
	end;
	function v4.bounce(p214, p215)
		local v352 = p215[1];
		if not v352 then
			return true;
		end;
		local l__sprite__353 = p214.sprite;
		local v354 = (v352.sprite.cf.p - l__sprite__353.cf.p) * Vector3.new(0.9, 0, 0.9);
		local u116 = v354 + Vector3.new(0, 10, 0);
		u3(0.3, nil, function(p216)
			l__sprite__353.offset = u116 + (v354 - u116) * p216;
		end);
		spawn(function()
			wait(0.1);
			u3(1, "easeOutCubic", function(p217)
				l__sprite__353.offset = v354 * (1 - p217);
			end);
		end);
		return true;
	end;
	function v4.bubble(p218, p219)
		local v355 = p219[1];
		if not v355 then
			return;
		end;
		local v356 = u1(p218);
		local v357 = p218.sprite.part.CFrame - p218.sprite.part.Position + u1(v355);
		local v358 = l__Utilities__1.Timing.easeOutCubic(0.8);
		for v359 = 1, 6 do
			local v360 = tick();
			local v361 = {
				Image = 242218744, 
				Color = Color3.fromHSV(math.random(190, 220) / 360, 1, 1), 
				Lifetime = 1.2
			};
			local u117 = v357 * Vector3.new((math.random() - 0.5) * 3, (math.random() - 0.5) * 3, (math.random() - 0.5) * 0.1) - v356;
			local u118 = 0.7 + 0.3 * math.random();
			function v361.OnUpdate(p220, p221)
				if p220 > 0.8 then

				end;
				p221.CFrame = CFrame.new(v356 + u117 * v358(p220)) + Vector3.new(0, math.sin(tick() - v360) * 0.2, 0);
				local v362 = (0.7 + 0.4 * p220) * u118;
				if p220 > 0.95 then
					v362 = v362 + (p220 - 0.95) * 4;
					p221.BillboardGui.ImageLabel.ImageTransparency = (p220 - 0.95) * 20;
				end;
				p221.BillboardGui.Size = UDim2.new(v362, 0, v362, 0);
			end;
			p1.Particles:new(v361);
			wait(0.1);
		end;
		wait(0.5);
		return true;
	end;
	function v4.bubblebeam(p222, p223)
		local v363 = p223[1];
		if not v363 then
			return;
		end;
		local v364 = u1(p222);
		local v365 = p222.sprite.part.CFrame - p222.sprite.part.Position + u1(v363);
		local v366 = l__Utilities__1.Timing.easeOutCubic(0.8);
		for v367 = 1, 20 do
			local v368 = tick();
			local v369 = {
				Image = 242218744, 
				Color = Color3.fromHSV(math.random(190, 220) / 360, 1, 1), 
				Lifetime = 1.2
			};
			local u119 = v365 * Vector3.new((math.random() - 0.5) * 1.6, (math.random() - 0.5) * 1.6, (math.random() - 0.5) * 0.1) - v364;
			local u120 = 0.7 + 0.3 * math.random();
			function v369.OnUpdate(p224, p225)
				if p224 > 0.8 then

				end;
				p225.CFrame = CFrame.new(v364 + u119 * v366(p224)) + Vector3.new(0, math.sin(tick() - v368) * 0.2, 0);
				local v370 = (0.7 + 0.4 * p224) * u120;
				if p224 > 0.95 then
					v370 = v370 + (p224 - 0.95) * 4;
					p225.BillboardGui.ImageLabel.ImageTransparency = (p224 - 0.95) * 20;
				end;
				p225.BillboardGui.Size = UDim2.new(v370, 0, v370, 0);
			end;
			p1.Particles:new(v369);
			wait(0.05);
		end;
		wait(0.5);
		return true;
	end;
	function v4.bulletseed(p226, p227)
		local v371 = p227[1];
		if not v371 then
			return true;
		end;
		local v372 = u1(p226);
		local v373 = u1(v371) - v372;
		for v374 = 1, 4 do
			spawn(function()
				local u121 = l__Create__4("Part")({
					BrickColor = BrickColor.new("Olive"), 
					Anchored = true, 
					CanCollide = false, 
					TopSurface = Enum.SurfaceType.Smooth, 
					BottomSurface = Enum.SurfaceType.Smooth, 
					Shape = Enum.PartType.Ball, 
					Size = Vector3.new(0.5, 0.5, 0.5), 
					Parent = workspace
				});
				u3(0.4, nil, function(p228)
					u121.CFrame = CFrame.new(v372 + v373 * p228);
				end);
				u121:Remove();
			end);
			wait(0.15);
		end;
		wait(0.25);
		return true;
	end;
	function v4.closecombat(p229, p230)
		local v375 = p230[1];
		if not v375 then
			return;
		end;
		local l__sprite__376 = p229.sprite;
		local v377 = (v375.sprite.cf.p - l__sprite__376.cf.p) * Vector3.new(1, 0, 1);
		local u122 = v377.unit * (v377.magnitude - 3);
		u3(0.4, nil, function(p231)
			l__sprite__376.offset = u122 * p231 + Vector3.new(0, math.sin(p231 * math.pi) * 1.5, 0);
		end);
		local l__sprite__378 = v375.sprite;
		local l__CFrame__379 = l__sprite__378.part.CFrame;
		local v380 = l__CFrame__379 - l__CFrame__379.p;
		local l__Size__381 = l__sprite__378.part.Size;
		local l__offset__382 = l__sprite__378.offset;
		local v383 = u122.unit * 2;
		for v384 = 1, 5 do
			local v385 = math.random() - 0.5;
			local v386 = {
				Acceleration = false, 
				Image = 644258078, 
				Lifetime = 0.2, 
				Color = Color3.fromRGB(194, 88, 61), 
				Size = Vector2.new(1, 0.8), 
				Position = l__CFrame__379 * Vector3.new(v385 * l__Size__381.X, math.random() * 0.5 * l__Size__381.Y, -0.5)
			};
			function v386.OnUpdate(p232, p233)
				local l__ImageLabel__387 = p233.BillboardGui.ImageLabel;
				if p232 < 0.25 and v385 < 0 then
					l__ImageLabel__387.ImageRectSize = Vector2.new(-188, 152);
					l__ImageLabel__387.ImageRectOffset = Vector2.new(188, 0);
					return;
				end;
				if p232 > 0.5 then
					l__ImageLabel__387.ImageTransparency = (p232 - 0.5) * 2;
				end;
			end;
			p1.Particles:new(v386);
			spawn(function()
				u3(0.23, nil, function(p234)
					local v388 = math.sin(p234 * math.pi);
					l__sprite__378.offset = l__offset__382 + v380 * Vector3.new(-v385 * l__Size__381.X * 0.5 * v388, 0, 0) + v383 * v388;
				end);
			end);
			if v384 < 5 then
				u3(0.23, nil, function(p235)
					l__sprite__376.offset = u122 - v383 * math.sin(p235 * math.pi) * 0.5;
				end);
			end;
		end;
		spawn(function()
			u3(0.4, nil, function(p236)
				l__sprite__376.offset = u122 * (1 - p236) + Vector3.new(0, math.sin(p236 * math.pi) * 1.5, 0);
			end);
		end);
		return true;
	end;
	function v4.crosschop(p237, p238)
		local v389 = p238[1];
		if not v389 then
			return;
		end;
		cut(v389, "Brown", 2);
		return "sound";
	end;
	function v4.crosspoison(p239, p240)
		local v390 = p240[1];
		if not v390 then
			return;
		end;
		cut(v390, "Magenta", 2);
		return "sound";
	end;
	function v4.crunch(p241, p242)
		local v391 = p242[1];
		if not v391 then
			return true;
		end;
		l__Utilities__1.fastSpawn(function()
			u113(v391, nil, nil, true);
		end);
		wait(0.35);
		return "sound";
	end;
	function v4.cut(p243, p244)
		local v392 = p244[1];
		if not v392 then
			return true;
		end;
		cut(v392);
		return "sound";
	end;
	function v4.darkpulse(p245, p246)
		local v393 = u1(p245);
		for v394 = 1, 3 do
			spawn(function()
				local v395 = l__Create__4("Part")({
					BrickColor = BrickColor.new("Black"), 
					Transparency = 0.5, 
					Anchored = true, 
					CanCollide = false, 
					Size = Vector3.new(1, 1, 1), 
					Parent = workspace
				});
				v395.CFrame = p245.sprite.part.CFrame * CFrame.Angles(math.pi / 2, 0, 0);
				local u123 = l__Create__4("SpecialMesh")({
					MeshType = Enum.MeshType.FileMesh, 
					MeshId = "rbxassetid://3270017", 
					Parent = v395
				});
				u3(0.5, nil, function(p247)
					local v396 = p247 * 25;
					u123.Scale = Vector3.new(v396, v396, 1);
					if p247 > 0.75 then
						v395.Transparency = 0.5 + 0.5 * ((p247 - 0.75) * 4);
					end;
				end);
				v395:Remove();
			end);
			wait(0.1);
		end;
		wait(0.25);
		return true;
	end;
	function v4.dig(p248, p249)
		local v397 = p249[1];
		if not v397 then
			return true;
		end;
		local l__sprite__398 = p248.sprite;
		local l__offset__124 = l__sprite__398.offset;
		local u125 = (v397.sprite.cf.p - l__sprite__398.cf.p) * Vector3.new(0.9, 0, 0.9);
		u3(0.3, nil, function(p250)
			l__sprite__398.offset = l__offset__124 + (u125 - l__offset__124) * p250;
		end);
		spawn(function()
			wait(0.1);
			u3(1, "easeOutCubic", function(p251)
				l__sprite__398.offset = u125 * (1 - p251);
			end);
		end);
		return true;
	end;
	function v4.dive(p252, p253)
		local v399 = p253[1];
		if not v399 then
			return true;
		end;
		local l__sprite__400 = p252.sprite;
		local l__offset__126 = l__sprite__400.offset;
		local u127 = (v399.sprite.cf.p - l__sprite__400.cf.p) * Vector3.new(0.9, 0, 0.9);
		u3(0.3, nil, function(p254)
			l__sprite__400.offset = l__offset__126 + (u127 - l__offset__126) * p254;
		end);
		spawn(function()
			wait(0.1);
			u3(1, "easeOutCubic", function(p255)
				l__sprite__400.offset = u127 * (1 - p255);
			end);
		end);
		return true;
	end;
	function v4.doubleteam(p256)
		local l__sprite__128 = p256.sprite;
		u3(2, nil, function(p257)
			l__sprite__128.offset = Vector3.new(math.sin(15 * p257 + 34 * p257 * p257), 0, 0);
		end);
		local u129 = Vector3.new(1, 0, 0);
		local u130 = Vector3.new(-1, 0, 0);
		u3(1, "easeInCubic", function(p258, p259)
			if p259 % 0.07 < 0.035 then
				l__sprite__128.offset = u129 * (1 - p258);
				return;
			end;
			l__sprite__128.offset = u130 * (1 - p258);
		end);
		l__sprite__128.offset = nil;
	end;
	function v4.dragonclaw(p260, p261)
		local v401 = p261[1];
		if not v401 then
			return;
		end;
		cut(v401, "Royal purple", 3);
		return "sound";
	end;
	function v4.drainingkiss(p262, p263)
		local v402 = p263[1];
		if not v402 then
			return;
		end;
		p1.Particles:new({
			Acceleration = false, 
			Image = 644314963, 
			Lifetime = 0.4, 
			Position = v402.sprite.part.CFrame * Vector3.new(0, 0, -0.5), 
			OnUpdate = function(p264, p265)
				local v403 = math.sin(0.5 + 1.6 * p264);
				p265.BillboardGui.Size = UDim2.new(2 * v403, 0, 1.34 * v403, 0);
				if p264 > 0.5 then
					p265.BillboardGui.ImageLabel.ImageTransparency = (p264 - 0.5) * 2;
				end;
			end
		});
		wait(0.25);
		u103(p262, v402, 12, Color3.new(0.92, 0.7, 0.92));
		return true;
	end;
	function v4.dualchop(p266, p267)
		local v404 = p267[1];
		if not v404 then
			return;
		end;
		cut(v404, "Royal purple");
		return "sound";
	end;
	function v4.ember(p268, p269)
		local v405 = p269[1];
		if not v405 then
			return;
		end;
		local v406 = u1(p268);
		local v407 = u1(v405) - v406;
		for v408 = 1, 3 do
			local v409 = {
				Image = 11601142, 
				Lifetime = 0.7
			};
			function v409.OnUpdate(p270, p271)
				p271.CFrame = CFrame.new(v406 + v407 * p270);
				local v410 = 1 + 1.5 * p270;
				p271.BillboardGui.Size = UDim2.new(v410, 0, v410, 0);
			end;
			p1.Particles:new(v409);
			wait(0.05);
		end;
		wait(0.6);
		return true;
	end;
	function v4.energyball(p272, p273)
		local v411 = p273[1];
		if not v411 then
			return true;
		end;
		local l__sprite__412 = p272.sprite;
		local v413 = u1(p272, 2.5);
		local v414 = CFrame.new(v413, v413 + workspace.CurrentCamera.CFrame.lookVector);
		local function v415(p274)
			local v416 = l__Create__4("Part")({
				Transparency = 1, 
				Anchored = true, 
				CanCollide = false, 
				Size = Vector3.new(0.2, 0.2, 0.2), 
				Parent = workspace
			});
			return v416, l__Create__4("BillboardGui")({
				Adornee = v416, 
				Size = UDim2.new(0.7, 0, 0.7, 0), 
				Parent = v416,
				l__Create__4("ImageLabel")({
					BackgroundTransparency = 1, 
					Image = "rbxassetid://478035064", 
					ImageTransparency = 0.15, 
					ImageColor3 = Color3.fromHSV(p274 / 360, 1, 0.85), 
					Size = UDim2.new(1, 0, 1, 0), 
					ZIndex = 2
				})
			});
		end;
		local v417, v418 = v415(100);
		v417.CFrame = v414;
		local u131 = { v417 };
		local u132 = v414;
		delay(0.3, function()
			for v419 = 2, 11 do
				local v420 = math.random() * 6.28;
				local v421 = Vector3.new(math.cos(v420), math.sin(v420), 0.5);
				local v422, v423 = v415(math.random(66, 156));
				u131[v419] = v422;
				local u133 = math.random() * 0.35 + 0.2;
				spawn(function()
					local u134 = tick();
					local function u135(p275)
						local v424 = (tick() - u134) * 7;
						v422.CFrame = u132 * CFrame.new(v421 * p275 + 0.125 * Vector3.new(math.cos(v424), math.sin(v424) * math.cos(v424), 0));
					end;
					u3(0.2, "easeOutCubic", function(p276)
						if not v422.Parent then
							return false;
						end;
						v423.Size = UDim2.new(0.5 * p276, 0, 0.5 * p276, 0);
						u135(u133 + 0.6);
					end);
					u3(0.25, "easeOutCubic", function(p277)
						if not v422.Parent then
							return false;
						end;
						u135(u133 + 0.6 * (1 - p277));
					end);
					while v422.Parent do
						u135(u133);
						l__RenderStepped__107:wait();					
					end;
				end);
				wait(0.1);
			end;
		end);
		u3(1.5, nil, function(p278)
			v418.Size = UDim2.new(2.5 * p278, 0, 2.5 * p278, 0);
		end);
		wait(0.3);
		local v425 = u1(v411) - v413;
		u3(v425.magnitude / 30, nil, function(p279)
			u132 = u132 + v425 * p279;
			v417.CFrame = u132;
		end);
		for v426, v427 in pairs(u131) do
			v427:Remove();
		end;
		return true;
	end;
	function v4.explosion(p280, p281)
		pcall(function()
			p280.statbar:setHP(0, p280.maxhp);
		end);
		local u136 = l__Create__4("Explosion")({
			BlastPressure = 0, 
			Position = p280.sprite.cf.p, 
			Parent = workspace
		});
		delay(3, function()
			pcall(function()
				u136:Remove();
			end);
		end);
		wait(0.5);
		return true;
	end;
	function v4.selfdestruct(p282, p283)
		pcall(function()
			p282.statbar:setHP(0, p282.maxhp);
		end);
		local u137 = l__Create__4("Explosion")({
			BlastPressure = 0, 
			Position = p282.sprite.cf.p, 
			Parent = workspace
		});
		delay(3, function()
			pcall(function()
				u137:Remove();
			end);
		end);
		wait(0.5);
		return true;
	end;
	function v4.falseswipe(p284, p285)
		local v428 = p285[1];
		if not v428 then
			return;
		end;
		cut(v428);
		return "sound";
	end;
	function v4.firefang(p286, p287)
		local v429 = p287[1];
		if not v429 then
			return true;
		end;
		l__Utilities__1.fastSpawn(function()
			u113(v429, 11601142, 2);
		end);
		wait(0.35);
		return "sound";
	end;
	function v4.flamethrower(p288, p289)
		local v430 = p289[1];
		if not v430 then
			return true;
		end;
		local l__sprite__431 = p288.sprite;
		local v432 = u1(p288, 2);
		local v433 = u1(v430);
		local v434 = v433 - v432;
		local l__upVector__435 = CFrame.new(v432, v433).upVector;
		local v436 = 1 - 1;
		while true do
			local u138 = v436;
			spawn(function()
				local v437, v438, v439 = u68(600006428, 1.5);
				u3(0.7, nil, function(p290)
					v439.ImageColor3 = Color3.fromHSV(0.138 * (1 - p290), 1, 1);
					v437.CFrame = CFrame.new(v432) + l__upVector__435 * math.sin(p290 * math.pi * 1.5 / 0.7 + u138 * 0.2) * 0.4 + v434 * p290;
				end);
				v437:Remove();
			end);
			wait(0.1);
			if 0 <= 1 then
				if not (u138 < 20) then
					break;
				end;
			elseif not (u138 > 20) then
				break;
			end;
			u138 = u138 + 1;		
		end;
		wait(0.7);
		return true;
	end;
	function v4.fly(p291, p292)
		local v440 = p292[1];
		if not v440 then
			return true;
		end;
		local l__sprite__441 = p291.sprite;
		local l__offset__139 = l__sprite__441.offset;
		local u140 = (v440.sprite.cf.p - l__sprite__441.cf.p) * Vector3.new(0.9, 0, 0.9) + Vector3.new(0, (l__sprite__441.spriteData.inAir and 0) * -0.75, 0);
		u3(0.3, nil, function(p293)
			l__sprite__441.offset = l__offset__139 + (u140 - l__offset__139) * p293;
		end);
		spawn(function()
			wait(0.1);
			u3(1, "easeOutCubic", function(p294)
				l__sprite__441.offset = u140 * (1 - p294);
			end);
		end);
		return true;
	end;
	function v4.furycutter(p295, p296)
		local v442 = p296[1];
		if not v442 then
			return;
		end;
		cut(v442, "Medium green");
		return "sound";
	end;
	function v4.furyswipes(p297, p298)
		local v443 = p298[1];
		if not v443 then
			return;
		end;
		cut(v443, nil, 3);
		return "sound";
	end;
	function v4.gigadrain(p299, p300)
		local v444 = p300[1];
		if not v444 then
			return;
		end;
		u103(p299, v444, 20);
		return true;
	end;
	local function u141(p301, p302)
		local l__sprite__445 = p301.sprite;
		local u142 = (p302.sprite.part.Position - l__sprite__445.part.Position) * Vector3.new(1, 0, 1).unit * 2;
		u3(0.1, nil, function(p303)
			l__sprite__445.offset = u142 * 2 * p303;
		end);
		spawn(function()
			u3(0.17, "easeOutCubic", function(p304)
				l__sprite__445.offset = u142 * 2 * (1 - p304);
			end);
		end);
	end;
	function v4.headbutt(p305, p306)
		local v446 = p306[1];
		if not v446 then
			return;
		end;
		u141(p305, v446);
		return true;
	end;
	function v4.icebeam(p307, p308)
		local v447 = p308[1];
		if not v447 then
			return true;
		end;
		local v448 = u1(p307);
		local v449 = u1(v447);
		local v450 = v449 - v448;
		local l__CFrame__451 = v447.sprite.part.CFrame;
		local v452 = l__CFrame__451 - l__CFrame__451.p;
		local l__CurrentCamera__453 = workspace.CurrentCamera;
		local v454 = l__CurrentCamera__453:WorldToScreenPoint(v448);
		local v455 = l__CurrentCamera__453:WorldToScreenPoint(v449);
		local v456 = math.deg(math.atan2(v455.Y - v454.Y, v455.X - v454.X)) + 90;
		for v457 = 1, 15 do
			local v458 = math.random() * 0.5 + 0.75;
			local v459 = Color3.fromHSV(0.5 + 0.08 * math.random(), math.random() * 0.75, 1);
			local v460 = {
				Color = v459, 
				Image = 644323665, 
				Lifetime = 0.7, 
				Rotation = v456
			};
			local u143 = v452 * (0.25 * Vector3.new(math.random() - 0.5, math.random() - 0.5, 0));
			function v460.OnUpdate(p309, p310)
				p310.CFrame = CFrame.new(v448 + v450 * p309 + u143);
				local v461 = (p309 < 0.2 and p309 * 5 or 1) * v458;
				p310.BillboardGui.Size = UDim2.new(v461, 0, v461, 0);
			end;
			p1.Particles:new(v460);
			delay(0.7, function()
				for v462 = 1, 2 do
					local v463 = math.random() * 360;
					p1.Particles:new({
						Color = v459, 
						Image = 644161227, 
						Lifetime = 0.7, 
						Rotation = v463 + 90, 
						Size = 0.4 * v458, 
						Position = v449, 
						Velocity = 5 * (v452 * Vector3.new(math.cos(math.rad(v463)), math.sin(math.rad(v463)), 0)), 
						Acceleration = false
					});
				end;
			end);
			wait(0.06);
		end;
		wait(0.5);
		return true;
	end;
	function v4.icefang(p311, p312)
		local v464 = p312[1];
		if not v464 then
			return true;
		end;
		l__Utilities__1.fastSpawn(function()
			u113(v464, 629607498);
		end);
		wait(0.35);
		return "sound";
	end;
	local function u144(p313, p314)
		local l__sprite__465 = p313.sprite;
		if l__sprite__465.siden == 1 then
			local v466 = 1;
		else
			v466 = -1;
		end;
		local u145 = l__Create__4("Part")({
			Anchored = true, 
			CanCollide = false, 
			Transparency = 0.3, 
			Reflectance = 0.4, 
			BrickColor = BrickColor.new(p314 and "Alder"), 
			Parent = l__sprite__465.part.Parent,
			l__Create__4("CylinderMesh")({
				Scale = Vector3.new(1, 0.01, 1)
			})
		});
		local u146 = l__sprite__465.cf * CFrame.new(0, 1.5 - (l__sprite__465.spriteData.inAir and 0), 2.5 * v466) * CFrame.Angles(math.pi / 2, 0.5, 0);
		u3(0.6, "easeOutCubic", function(p315)
			u145.Size = Vector3.new(3 * p315, 0.2, 3 * p315);
			u145.CFrame = u146;
		end);
		delay(1, function()
			u3(0.5, "easeOutCubic", function(p316)
				u145.Transparency = 0.3 + 0.7 * p316;
				u145.Reflectance = 0.4 * (1 - p316);
			end);
			u145:Remove();
		end);
	end;
	function v4.lightscreen(p317)
		u144(p317, "Pastel light blue");
	end;
	function v4.megadrain(p318, p319)
		local v467 = p319[1];
		if not v467 then
			return;
		end;
		u103(p318, v467, 12);
		return true;
	end;
	function v4.metalclaw(p320, p321)
		local v468 = p321[1];
		if not v468 then
			return;
		end;
		cut(v468, "Smoky grey", 3);
		return "sound";
	end;
	function v4.moonblast(p322, p323)
		local u147 = nil;
		local v469 = p323[1];
		if not v469 then
			return;
		end;
		local v470 = u1(p322, 2);
		local v471 = u1(v469) - v470;
		local u148 = l__Create__4("Part")({
			BrickColor = BrickColor.new("Carnation pink"), 
			Material = Enum.Material.Neon, 
			Anchored = true, 
			CanCollide = false, 
			TopSurface = Enum.SurfaceType.Smooth, 
			BottomSurface = Enum.SurfaceType.Smooth, 
			Size = Vector3.new(4, 4, 4), 
			Shape = Enum.PartType.Ball, 
			CFrame = CFrame.new(p322.sprite.cf.p + Vector3.new(0, 7 - (p322.sprite.spriteData.inAir and 0), 0)), 
			Parent = workspace
		});
		u3(1, nil, function(p324)
			u148.Transparency = 1 - p324;
		end);
		local v472 = u148:Clone();
		v472.BrickColor = BrickColor.new("Pink");
		v472.Parent = workspace;
		local v473 = math.pi * 2;
		for v474 = 1, 20 do
			u147 = v470;
			delay(0.075 * v474, function()
				local u149 = l__Create__4("Part")({
					Material = Enum.Material.Neon, 
					BrickColor = BrickColor.new("White"), 
					Anchored = true, 
					CanCollide = false, 
					TopSurface = Enum.SurfaceType.Smooth, 
					BottomSurface = Enum.SurfaceType.Smooth, 
					Parent = workspace
				});
				local u150 = CFrame.new(u147) * (CFrame.Angles(v473 * math.random(), v473 * math.random(), v473 * math.random()).lookVector * 4);
				u3(0.25, nil, function(p325)
					u149.Size = Vector3.new(0.2, 0.2, 4 * p325);
					u149.CFrame = CFrame.new(u150 + (u147 - u150) / 2 * p325, u150);
				end);
				u3(0.25, nil, function(p326)
					u149.Size = Vector3.new(0.2, 0.2, 4 * (1 - p326));
					u149.CFrame = CFrame.new(u150 + (u147 - u150) * (0.5 + 0.5 * p326), u150);
				end);
				u149:Remove();
			end);
		end;
		u3(2, nil, function(p327)
			v472.Size = Vector3.new(2.3, 2.3, 2.3) * p327;
			v472.CFrame = CFrame.new(u147);
		end);
		wait(0.2);
		u3(0.3, nil, function(p328)
			v472.CFrame = CFrame.new(u147 + v471 * p328);
		end);
		v472:Remove();
		spawn(function()
			u3(1, nil, function(p329)
				u148.Transparency = p329;
			end);
			u148:Remove();
		end);
		return true;
	end;
	function v4.nightslash(p330, p331)
		local v475 = p331[1];
		if not v475 then
			return;
		end;
		cut(v475, "Black", 3);
		return "sound";
	end;
	function v4.protect(p332)
		u144(p332);
	end;
	function v4.psychic(p333, p334)
		local v476 = p334[1];
		if not v476 then
			return;
		end;
		local v477 = u1(p333);
		local v478 = u1(v476);
		local v479 = v478 - v477;
		for v480 = 1, 3 do
			spawn(function()
				local v481 = l__Create__4("Part")({
					BrickColor = BrickColor.new("Pink"), 
					Reflectance = 0.5, 
					Anchored = true, 
					CanCollide = false, 
					Size = Vector3.new(1, 1, 1), 
					Parent = workspace
				});
				local u151 = l__Create__4("SpecialMesh")({
					MeshType = Enum.MeshType.FileMesh, 
					MeshId = "rbxassetid://3270017", 
					Parent = v481
				});
				u3(0.8, nil, function(p335)
					v481.CFrame = CFrame.new(v477, v478) + v479 * p335;
					local v482 = 1.3 + 0.3 * math.sin(p335 * 8);
					u151.Scale = Vector3.new(v482, v482, v482);
				end);
				v481:Remove();
			end);
			wait(0.2);
		end;
		wait(0.6);
		return true;
	end;
	function v4.psychocut(p336, p337)
		local v483 = p337[1];
		if not v483 then
			return;
		end;
		cut(v483, "Pink");
		return "sound";
	end;
	function v4.razorleaf(p338, p339)
		local v484 = p339[1];
		if not v484 then
			return;
		end;
		local v485 = p338.sprite.part.CFrame - p338.sprite.part.Position;
		local v486 = v485 + u1(p338, -0.5);
		local v487 = v485 + u1(v484, 0.5);
		local l__Size__488 = p338.sprite.part.Size;
		local l__Size__489 = v484.sprite.part.Size;
		local l__Particles__490 = p1.Particles;
		local v491 = l__Utilities__1.Timing.easeOutCubic(0.3);
		if v484.sprite.siden == 2 then
			local v492 = 35;
		else
			v492 = 215;
		end;
		for v493 = 1, 10 do
			wait(0.1);
			local v494 = math.random() - 0.5;
			local v495 = math.random() - 0.5;
			local v496 = v486 * CFrame.new(l__Size__488.X * v494, l__Size__488.Y * v495, 0);
			local v497 = {
				Rotation = math.random(360), 
				RotVelocity = 30, 
				Acceleration = false, 
				Lifetime = 1.45, 
				Image = 29073832, 
				Size = 0.6
			};
			local u152 = (v487 * CFrame.new(l__Size__489.X * v494, l__Size__489.Y * v495, 0)).p - v496.p;
			function v497.OnUpdate(p340, p341)
				local v498 = p340 * 1.45;
				if v498 < 0.3 then
					p341.CFrame = v496 + Vector3.new(0, v491(v498), 0);
					return;
				end;
				if v498 < 1.1 then
					p341.CFrame = v496 + Vector3.new(0, 1 - 0.5 * (v498 - 0.3) / 0.8, 0);
					return;
				end;
				p341.BillboardGui.ImageLabel.Rotation = v492;
				local v499 = (v498 - 1.1) / 0.35;
				p341.CFrame = v496 + Vector3.new(0, 0.5 * (1 - v499), 0) + u152 * v499;
			end;
			l__Particles__490:new(v497);
		end;
		wait(1.7);
		return true;
	end;
	function v4.reflect(p342)
		u144(p342, "Carnation pink");
	end;
	function v4.rockblast(p343, p344)
		local v500 = p344[1];
		if not v500 then
			return true;
		end;
		local v501 = u1(p343);
		local v502 = u1(v500) - v501;
		local u153 = l__Create__4("Part")({
			Anchored = true, 
			CanCollide = false, 
			BrickColor = BrickColor.new("Dirt brown"), 
			Size = Vector3.new(1.4, 1.4, 1.4), 
			Parent = workspace,
			l__Create__4("SpecialMesh")({
				MeshType = Enum.MeshType.FileMesh, 
				MeshId = "rbxassetid://1290033", 
				Scale = Vector3.new(0.8, 0.8, 0.8)
			})
		});
		local u154 = CFrame.new(v501) * CFrame.Angles(math.pi * 2 * math.random(), math.pi * 2 * math.random(), math.pi * 2 * math.random());
		u3(0.4, nil, function(p345)
			u153.CFrame = u154 + v502 * p345;
		end);
		u153:Remove();
		return true;
	end;
	function v4.rockslide(p346, p347)
		for v503, v504 in pairs(p347) do
			spawn(function()
				local l__CFrame__505 = v504.sprite.part.CFrame;
				local v506 = l__CFrame__505 - l__CFrame__505.p;
				local v507 = u1(v504, 0) - u1(v504, 1);
				local v508 = v504.sprite.part.Position + Vector3.new(0, -v504.sprite.part.Size.Y / 2 - (v504.sprite.spriteData.inAir and 0), 0);
				local v509 = CFrame.new(v508 - v507 + Vector3.new(0, 0.7, 0), v508 + Vector3.new(0, 0.7, 0));
				for v510 = 1, 4 do
					local u155 = l__Create__4("Part")({
						Anchored = true, 
						CanCollide = false, 
						BrickColor = BrickColor.new("Dirt brown"), 
						Size = Vector3.new(1.4, 1.4, 1.4), 
						Parent = workspace,
						l__Create__4("SpecialMesh")({
							MeshType = Enum.MeshType.FileMesh, 
							MeshId = "rbxassetid://1290033", 
							Scale = Vector3.new(0.8, 0.8, 0.8)
						})
					});
					local u156 = v506 * Vector3.new((math.random() - 0.5) * 3, 0, 0);
					local u157 = CFrame.Angles(math.random() * 6.3, math.random() * 6.3, math.random() * 6.3);
					spawn(function()
						u3(0.5, nil, function(p348)
							u155.CFrame = (v509 + u156 + Vector3.new(0, 8 * (1 - p348), 0)) * u157;
						end);
						u3(0.4, nil, function(p349)
							u155.CFrame = (v509 + u156 + v507 * 2 * p349 + Vector3.new(0, math.sin(p349 * math.pi * 5 / 4) - p349, 0)) * CFrame.Angles(-6 * p349, 0, 0) * u157;
						end);
						u155:Remove();
					end);
					wait(0.25);
				end;
			end);
		end;
		wait(1.3);
		return true;
	end;
	function v4.sacredsword(p350, p351)
		local v511 = p351[1];
		if not v511 then
			return;
		end;
		cut(v511, "Brown");
		return "sound";
	end;
	function v4.scald(p352, p353)
		local v512 = p353[1];
		if not v512 then
			return;
		end;
		local l__sprite__513 = p352.sprite;
		local v514 = u1(p352, 2);
		local v515 = u1(v512, 0.5) - v514;
		local l__sprite__516 = v512.sprite;
		local l__CFrame__517 = l__sprite__516.part.CFrame;
		local u158 = nil;
		pcall(function()
			u158 = l__sprite__516.animation.spriteLabel;
		end);
		local u159 = l__CFrame__517 - l__CFrame__517.p;
		delay(0.7, function()
			u3(0.84, nil, function(p354)
				local v518 = math.sin(p354 * math.pi);
				local v519 = p354 * 5 % 1;
				if v519 > 0.75 then
					v519 = v519 - 1;
				elseif v519 > 0.25 then
					v519 = 0.5 - v519;
				end;
				l__sprite__516.offset = u159 * Vector3.new(v519 * v518, 0, 0);
				if u158 then
					u158.ImageColor3 = Color3.new(1, 1 - v518, 1 - v518);
				end;
			end);
		end);
		for v520 = 1, 15 do
			spawn(function()
				local u160 = u68(650846795, 1, Color3.fromHSV((210 + math.random() * 20) / 360, 0.8, 0.75));
				u3(0.7, nil, function(p355)
					u160.CFrame = CFrame.new(v514 + v515 * p355 + Vector3.new(0, math.sin(p355 * math.pi) * 0.8, 0));
				end);
				u160:Remove();
			end);
			wait(0.06);
		end;
		wait(0.64);
		return true;
	end;
	function v4.scratch(p356, p357)
		local v521 = p357[1];
		if not v521 then
			return;
		end;
		cut(v521, nil, 3);
		return "sound";
	end;
	function v4.secretsword(p358, p359)
		local v522 = p359[1];
		if not v522 then
			return;
		end;
		cut(v522, "Brown");
		return "sound";
	end;
	function v4.shadowball(p360, p361)
		local v523 = p361[1];
		if not v523 then
			return true;
		end;
		local l__sprite__524 = p360.sprite;
		local v525 = u1(p360, 2.5);
		local v526 = CFrame.new(v525, v525 + workspace.CurrentCamera.CFrame.lookVector);
		local function v527(p362)
			local v528 = l__Create__4("Part")({
				Transparency = 1, 
				Anchored = true, 
				CanCollide = false, 
				Size = Vector3.new(0.2, 0.2, 0.2), 
				Parent = workspace
			});
			return v528, l__Create__4("BillboardGui")({
				Adornee = v528, 
				Size = UDim2.new(0.7, 0, 0.7, 0), 
				Parent = v528,
				l__Create__4("ImageLabel")({
					BackgroundTransparency = 1, 
					Image = "rbxassetid://478035064", 
					ImageTransparency = 0.15, 
					ImageColor3 = Color3.fromHSV(p362 / 360, 0.5, 0.5), 
					Size = UDim2.new(1, 0, 1, 0), 
					ZIndex = 2
				})
			});
		end;
		local v529, v530 = v527(260);
		v529.CFrame = v526;
		local u161 = { v529 };
		local u162 = v526;
		delay(0.3, function()
			for v531 = 2, 11 do
				local v532 = math.random() * 6.28;
				local v533 = Vector3.new(math.cos(v532), math.sin(v532), 0.5);
				local v534, v535 = v527(math.random(248, 310));
				u161[v531] = v534;
				local u163 = math.random() * 0.35 + 0.2;
				spawn(function()
					local u164 = tick();
					local function u165(p363)
						local v536 = (tick() - u164) * 7;
						v534.CFrame = u162 * CFrame.new(v533 * p363 + 0.125 * Vector3.new(math.cos(v536), math.sin(v536) * math.cos(v536), 0));
					end;
					u3(0.2, "easeOutCubic", function(p364)
						if not v534.Parent then
							return false;
						end;
						v535.Size = UDim2.new(0.5 * p364, 0, 0.5 * p364, 0);
						u165(u163 + 0.6);
					end);
					u3(0.25, "easeOutCubic", function(p365)
						if not v534.Parent then
							return false;
						end;
						u165(u163 + 0.6 * (1 - p365));
					end);
					while v534.Parent do
						u165(u163);
						l__RenderStepped__107:wait();					
					end;
				end);
				wait(0.1);
			end;
		end);
		u3(1.5, nil, function(p366)
			v530.Size = UDim2.new(2.5 * p366, 0, 2.5 * p366, 0);
		end);
		wait(0.3);
		local v537 = u1(v523) - v525;
		u3(v537.magnitude / 30, nil, function(p367)
			u162 = u162 + v537 * p367;
			v529.CFrame = u162;
		end);
		for v538, v539 in pairs(u161) do
			v539:Remove();
		end;
		return true;
	end;
	function v4.shadowclaw(p368, p369)
		local v540 = p369[1];
		if not v540 then
			return;
		end;
		cut(v540, "Dark indigo", 3);
		return "sound";
	end;
	function v4.shadowforce(p370, p371)
		local v541 = p371[1];
		if not v541 then
			return;
		end;
		local l__spriteLabel__166 = p370.sprite.animation.spriteLabel;
		spawn(function()
			u3(0.075, nil, function(p372)
				l__spriteLabel__166.ImageTransparency = 1 - p372;
			end);
		end);
		u141(p370, v541);
		return true;
	end;
	function v4.skydrop(p373, p374, p375, p376, p377)
		local v542 = p374[1];
		if not v542 then
			return;
		end;
		local l__offset__167 = v542.sprite.offset;
		u3(0.5, "easeOutQuart", function(p378)
			v542.sprite.offset = l__offset__167 * (1 - p378);
		end);
		if p377 then
			if p377.effectiveness[v542] == 1 then
				local v543 = 0.5;
			else
				v543 = 0.6;
			end;
			l__Utilities__1.sound(p377.soundId[v542] and 6454691636, 0.75, v543, 5);
		end;
		local l__sprite__168 = p373.sprite;
		spawn(function()
			u3(1, "easeOutCubic", function(p379)
				l__sprite__168.offset = Vector3.new(0, 10 * (1 - p379), 0);
			end);
		end);
	end;
	function v4.slam(p380, p381)
		local v544 = p381[1];
		if not v544 then
			return;
		end;
		u141(p380, v544);
		return true;
	end;
	function v4.slash(p382, p383)
		local v545 = p383[1];
		if not v545 then
			return;
		end;
		cut(v545, nil, 3);
		return "sound";
	end;
	function v4.sludgebomb(p384, p385)
		local v546 = p385[1];
		if not v546 then
			return true;
		end;
		local v547 = u1(p384);
		local v548 = u1(v546);
		local l__CFrame__549 = v546.sprite.part.CFrame;
		local l__CurrentCamera__550 = workspace.CurrentCamera;
		local u169 = l__Create__4("Part")({
			BrickColor = BrickColor.new("Bright violet"), 
			Transparency = 0.1, 
			Reflectance = 0.1, 
			Anchored = true, 
			CanCollide = false, 
			TopSurface = Enum.SurfaceType.Smooth, 
			BottomSurface = Enum.SurfaceType.Smooth, 
			Shape = Enum.PartType.Ball, 
			Parent = workspace
		});
		u3(0.3, nil, function(p386)
			u169.Size = Vector3.new(p386, p386, p386) * 2;
			u169.CFrame = CFrame.new(v547);
		end);
		local u170 = l__CFrame__549 - l__CFrame__549.p;
		delay(0.5, function()
			for v551 = 1, 5 do
				local u171 = Color3.fromHSV((281 + math.random() * 20) / 360, 0.6, 0.4);
				local u172 = math.random() * 0.5 + 0.75;
				spawn(function()
					for v552 = 1, 2 do
						local v553 = math.random() * 360;
						p1.Particles:new({
							Color = u171, 
							Image = 243953162, 
							Lifetime = 0.4, 
							Size = 0.8 * u172, 
							Position = v548, 
							Velocity = 5 * (u170 * Vector3.new(math.cos(math.rad(v553)), math.sin(math.rad(v553)), 0)), 
							Acceleration = false
						});
					end;
				end);
				wait(0.06);
			end;
		end);
		local u173 = v548 - v547;
		u3(0.7, nil, function(p387)
			u169.CFrame = CFrame.new(v547 + u173 * p387 + Vector3.new(0, 1.7 * math.sin(p387 * math.pi), 0));
		end);
		u169:Remove();
		return true;
	end;
	function v4.solarbeam(p388, p389)
		local u174 = nil;
		local v554 = p389[1];
		if not v554 then
			return;
		end;
		local v555 = u1(p388, 2);
		local v556 = u1(v554);
		local v557 = v556 - v555;
		local u175 = l__Create__4("Part")({
			BrickColor = BrickColor.new("New Yeller"), 
			Material = Enum.Material.Neon, 
			Anchored = true, 
			CanCollide = false, 
			TopSurface = Enum.SurfaceType.Smooth, 
			BottomSurface = Enum.SurfaceType.Smooth, 
			Size = Vector3.new(4, 4, 4), 
			Shape = Enum.PartType.Ball, 
			CFrame = CFrame.new(p388.sprite.cf.p + Vector3.new(0, 7 - (p388.sprite.spriteData.inAir and 0), 0)), 
			Parent = workspace
		});
		u3(1, nil, function(p390)
			u175.Transparency = 1 - p390;
		end);
		local v558 = u175:Clone();
		v558.BrickColor = BrickColor.new("Bright green");
		v558.Size = Vector3.new(1, 1, 1);
		v558.CFrame = CFrame.new(v555);
		v558.Parent = workspace;
		local v559 = l__Create__4("SpecialMesh")({
			MeshType = Enum.MeshType.Sphere, 
			Parent = v558
		});
		local v560 = math.pi * 2;
		for v561 = 1, 20 do
			u174 = v555;
			delay(0.075 * v561, function()
				local u176 = l__Create__4("Part")({
					Material = Enum.Material.Neon, 
					BrickColor = BrickColor.new("Br. yellowish green"), 
					Anchored = true, 
					CanCollide = false, 
					TopSurface = Enum.SurfaceType.Smooth, 
					BottomSurface = Enum.SurfaceType.Smooth, 
					Parent = workspace
				});
				local u177 = CFrame.new(u174) * (CFrame.Angles(v560 * math.random(), v560 * math.random(), v560 * math.random()).lookVector * 4);
				u3(0.25, nil, function(p391)
					u176.Size = Vector3.new(0.2, 0.2, 4 * p391);
					u176.CFrame = CFrame.new(u177 + (u174 - u177) / 2 * p391, u177);
				end);
				u3(0.25, nil, function(p392)
					u176.Size = Vector3.new(0.2, 0.2, 4 * (1 - p392));
					u176.CFrame = CFrame.new(u177 + (u174 - u177) * (0.5 + 0.5 * p392), u177);
				end);
				u176:Remove();
			end);
		end;
		u3(2, nil, function(p393)
			v559.Scale = Vector3.new(2.3, 2.3, 2.3) * p393;
		end);
		wait(0.2);
		local v562 = v558:Clone();
		v562.Shape = Enum.PartType.Block;
		v562.Parent = workspace;
		local v563 = Instance.new("CylinderMesh", v562);
		local l__magnitude__178 = v557.magnitude;
		u3(0.3, nil, function(p394)
			v562.Size = Vector3.new(0.8, l__magnitude__178 * p394, 0.8);
			v562.CFrame = CFrame.new(u174 + v557 * 0.5 * p394, v556) * CFrame.Angles(math.pi / 2, 0, 0);
			local v564 = 2.3 - 1.5 * p394;
			v559.Scale = Vector3.new(v564, v564, v564);
		end);
		spawn(function()
			local l__Size__565 = v558.Size;
			local l__CFrame__566 = v558.CFrame;
			u3(0.4, "easeOutQuad", function(p395)
				local v567 = 1 - p395;
				v563.Scale = Vector3.new(v567, 1, v567);
				v559.Scale = Vector3.new(v567, v567, v567);
			end);
			v562:Remove();
			v558:Remove();
			wait(0.2);
			u3(1, nil, function(p396)
				u175.Transparency = p396;
			end);
			u175:Remove();
		end);
		return true;
	end;
	local function u179(p397, p398, p399)
		local v568 = {};
		local l__battle__569 = p397.side.battle;
		if p397.side.n == 1 then
			local v570 = { "pos21", "pos22", "pos23" };
			if l__battle__569.gameType ~= "doubles" then
				v570[4] = "_Foe";
			end;
		else
			v570 = { "pos11", "pos12", "pos13" };
			if l__battle__569.gameType ~= "doubles" then
				v570[4] = "_User";
			end;
		end;
		for v571, v572 in pairs(v570) do
			local v573 = l__battle__569.scene:FindFirstChild(v572);
			if v573 then
				v568[#v568 + 1] = v573;
			end;
		end;
		local v574 = l__Create__4("Model")({
			Name = (p398 and "Spikes") .. 3 - p397.side.n, 
			Parent = l__battle__569.scene
		});
		local u180 = l__Create__4("Part")({
			Anchored = true, 
			CanCollide = false, 
			BrickColor = BrickColor.new(p399 and "Smoky grey"), 
			Reflectance = 0.1, 
			Size = Vector3.new(1, 1, 1),
			l__Create__4("SpecialMesh")({
				MeshType = Enum.MeshType.FileMesh, 
				MeshId = "rbxassetid://629819743", 
				Scale = Vector3.new(0.01, 0.01, 0.01)
			})
		});
		delay(10, function()
			u180:Remove();
		end);
		local v575 = u1(p397, 1.5);
		for v576, v577 in pairs(v568) do
			spawn(function()
				local u181 = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
				local function v578()
					local v579 = math.random(#u181);
					local v580 = table.remove(u181, v579);
					if #u181 < v579 then
						local v581 = 1;
					else
						v581 = v579;
					end;
					table.remove(u181, v581);
					table.remove(u181, v579 == 1 and #u181 or v579 - 1);
					return v580;
				end;
				local v582 = math.random() * math.pi * 2;
				for v583, v584 in pairs({ v578(), v578(), v578() }) do
					local v585 = v582 + (v584 + math.random()) * math.pi / 6;
					local v586 = 2 + math.random();
					local v587 = v577.CFrame * CFrame.Angles(0, math.random() * 6.28, 0) + Vector3.new(math.cos(v585) * v586, -v577.Size.Y / 2 + 0.25, math.sin(v585) * v586);
					local v588 = u180:Clone();
					v588.Parent = v574;
					local u182 = (math.random() - 0.5) * 3;
					local u183 = (math.random() - 0.5) * 3;
					local u184 = (math.random() - 0.5) * 3;
					local u185 = v575 - v587.p;
					spawn(function()
						u3(0.5, "easeOutQuad", function(p400)
							local v589 = 1 - p400;
							v588.CFrame = v587 * CFrame.Angles(v589 * u182, v589 * u183, v589 * u184) + u185 * v589 + Vector3.new(0, 2 * math.sin(p400 * math.pi), 0);
						end);
					end);
					wait(0.2);
				end;
			end);
		end;
	end;
	function v4.spikes(p401)
		u179(p401);
	end;
	function v4.stealthrock(p402)
		local v590 = {};
		local l__battle__591 = p402.side.battle;
		if p402.side.n == 1 then
			local v592 = { "pos21", "pos22", "pos23" };
			if l__battle__591.gameType ~= "doubles" then
				v592[4] = "_Foe";
			end;
		else
			v592 = { "pos11", "pos12", "pos13" };
			if l__battle__591.gameType ~= "doubles" then
				v592[4] = "_User";
			end;
		end;
		for v593, v594 in pairs(v592) do
			local v595 = l__battle__591.scene:FindFirstChild(v594);
			if v595 then
				v590[#v590 + 1] = v595;
			end;
		end;
		local v596 = l__Create__4("Part")({
			Anchored = true, 
			CanCollide = false, 
			BrickColor = BrickColor.new("Dark orange"), 
			Size = Vector3.new(0.5, 1, 0.5),
			l__Create__4("SpecialMesh")({
				MeshType = Enum.MeshType.FileMesh, 
				MeshId = "rbxassetid://818652045", 
				Scale = Vector3.new(0.01, 0.01, 0.01)
			})
		});
		local v597 = l__Create__4("Model")({
			Name = "StealthRock" .. 3 - p402.side.n, 
			Parent = l__battle__591.scene
		});
		local v598 = u1(p402, 1.5);
		for v599, v600 in pairs(v590) do
			spawn(function()
				local u186 = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 };
				local function v601()
					local v602 = math.random(#u186);
					local v603 = table.remove(u186, v602);
					if #u186 < v602 then
						local v604 = 1;
					else
						v604 = v602;
					end;
					table.remove(u186, v604);
					table.remove(u186, v602 == 1 and #u186 or v602 - 1);
					return v603;
				end;
				local v605 = math.random() * math.pi * 2;
				for v606 = 1, 5 do
					local v607 = v605 + (v601() + math.random()) * math.pi / 10;
					local v608 = 2.5 + math.random();
					local v609 = v600.CFrame * CFrame.Angles(0, math.random() * 6.28, 0) + Vector3.new(math.cos(v607) * v608, -v600.Size.Y / 2 + 0.5 + 0.3 * math.random(), math.sin(v607) * v608);
					local v610 = (math.random() - 0.5) * 3;
					local v611 = (math.random() - 0.5) * 3;
					local v612 = v606 == 5 and v596 or v596:Clone();
					v612.Parent = v597;
					local u187 = (math.random() - 0.5) * 3;
					local u188 = v598 - v609.p;
					spawn(function()
						u3(0.5, "easeOutQuad", function(p403)
							local v613 = 1 - p403;
							v612.CFrame = v609 * CFrame.Angles(v613 * v610, v613 * v611, v613 * u187) + u188 * v613 + Vector3.new(0, 2 * math.sin(p403 * math.pi), 0);
						end);
					end);
					wait(0.1);
				end;
			end);
		end;
	end;
	function v4.stickyweb(p404)
		local v614 = {};
		local l__battle__615 = p404.side.battle;
		if p404.side.n == 1 then
			local v616 = { "pos21", "pos22", "pos23" };
			if l__battle__615.gameType ~= "doubles" then
				v616[4] = "_Foe";
			end;
		else
			v616 = { "pos11", "pos12", "pos13" };
			if l__battle__615.gameType ~= "doubles" then
				v616[4] = "_User";
			end;
		end;
		for v617, v618 in pairs(v616) do
			local v619 = l__battle__615.scene:FindFirstChild(v618);
			if v619 then
				v614[#v614 + 1] = v619;
			end;
		end;
		local v620 = l__Create__4("Model")({
			Name = "StickyWeb" .. 3 - p404.side.n, 
			Parent = l__battle__615.scene
		});
		local v621 = u1(p404, 1.5);
		for v622, v623 in pairs(v614) do
			spawn(function()
				local v624 = l__Create__4("Part")({
					Anchored = true, 
					CanCollide = false, 
					BrickColor = BrickColor.new("Institutional white"), 
					Size = Vector3.new(3, 3, 0.2)
				});
				local v625 = Vector3.new(1.2, 1.2, 0.1);
				local v626 = l__Create__4("SpecialMesh")({
					MeshType = Enum.MeshType.FileMesh, 
					MeshId = "rbxassetid://299832836", 
					Parent = v624
				});
				v624.Parent = v620;
				local v627 = CFrame.Angles(math.random() < 0.5 and math.pi or 0, 0, math.random() * math.pi * 2);
				local v628 = v623.Position + Vector3.new(math.random() - 0.5, -v623.Size.Y / 2 + 0.05, math.random() - 0.5);
				local v629 = CFrame.new(v628, v628 + Vector3.new(v628.X - v621.X, 0, v628.Z - v621.Z));
				local u189 = v621 - v629.p;
				Tween(0.8, "easeOutQuad", function(easeOutQuad)
					v626.Scale = v625 * (0.5 + 0.5 * easeOutQuad);
					v624.CFrame = v629 * CFrame.Angles(1 - 2.57 * easeOutQuad, 0, 0) * v627 + u189 * (1 - easeOutQuad) + Vector3.new(0, 2 * math.sin(p405 * math.pi), 0);
				end);
			end);
		end;
	end;
	function v4.swordsdance(p406)
		local v630 = p406.sprite.part.CFrame * CFrame.new(0, p406.sprite.part.Size.Y / 2, 0);
		local v631 = l__Create__4("Part")({
			BrickColor = BrickColor.new("Dark stone grey"), 
			Reflectance = 0.4, 
			Anchored = true, 
			CanCollide = false, 
			Size = Vector3.new(1, 0.8, 4) * 0.6, 
			Parent = workspace,
			l__Create__4("SpecialMesh")({
				MeshType = Enum.MeshType.FileMesh, 
				MeshId = "rbxasset://fonts/sword.mesh", 
				TextureId = "rbxasset://textures/SwordTexture.png", 
				Scale = Vector3.new(0.6, 0.6, 0.6)
			})
		});
		local v632 = {};
		for v633 = 1, 6 do
			local v634 = v633 == 1 and v631 or v631:Clone();
			v634.Parent = workspace;
			v632[v634] = v630 * CFrame.Angles(0, math.pi / 3 * v633, 0) * CFrame.new(0, 0, 2) * CFrame.Angles(-math.pi / 2, 0, 0);
		end;
		local u190 = CFrame.new(Vector3.new(0, 0, 0.85) * 0.6);
		u3(0.6, nil, function(p407)
			for v635, v636 in pairs(v632) do
				v635.CFrame = v636 * CFrame.Angles(0, -math.pi * p407, 0) * u190;
			end;
		end);
		for v637, v638 in pairs(v632) do
			v632[v637] = v638 * CFrame.Angles(0, -math.pi, 0);
		end;
		u3(0.6, nil, function(p408)
			for v639, v640 in pairs(v632) do
				v639.CFrame = v640 * CFrame.Angles(0, 0, math.pi / 2 * p408) * CFrame.Angles(0, -math.pi * p408, 0) * u190;
			end;
		end);
		for v641, v642 in pairs(v632) do
			v632[v641] = v642 * CFrame.Angles(0, 0, math.pi / 2) * CFrame.Angles(0, -math.pi, 0);
		end;
		wait(0.3);
		delay(0.25, function()
			l__Utilities__1.sound("rbxasset://sounds/unsheath.wav", 1, nil, 2);
		end);
		u3(0.4, nil, function(p409)
			for v643, v644 in pairs(v632) do
				v643.CFrame = v644 * CFrame.Angles(0, -0.9 * p409, 0) * CFrame.new(0, 0, 0.6 * p409) * u190 + Vector3.new(0, 0.3 * p409, 0);
			end;
		end);
		wait(0.5);
		for v645, v646 in pairs(v632) do
			v645:Remove();
		end;
	end;
	function v4.tackle(p410, p411)
		local v647 = p411[1];
		if not v647 then
			return;
		end;
		u141(p410, v647);
		return true;
	end;
	function v4.teleport(p412)
		pcall(function()
			local l__part__648 = p412.sprite.part;
			local l__X__191 = l__part__648.Size.X;
			local l__Y__192 = l__part__648.Size.Y;
			local l__CFrame__193 = l__part__648.CFrame;
			u3(0.3, nil, function(p413)
				l__part__648.Size = Vector3.new(l__X__191 * math.cos(p413 * math.pi / 2), l__Y__192 * (1 + math.sin(p413 * math.pi / 2) * 1.5), 0.2);
				l__part__648.CFrame = l__CFrame__193;
			end);
			l__part__648:Remove();
		end);
	end;
	function v4.thunderbolt(p414, p415)
		local v649 = p415[1];
		if not v649 then
			return true;
		end;
		local v650 = v649.sprite.part.CFrame - v649.sprite.part.Position + u1(v649, 0);
		local v651 = { 0.3, -0.3, 0 };
		for v652 = 1, 3 do
			local v653 = l__Create__4("Part")({
				Anchored = true, 
				CanCollide = false, 
				Transparency = 1, 
				Parent = workspace
			});
			local v654 = l__Create__4("Decal")({
				Texture = "rbxassetid://650936735", 
				Face = Enum.NormalId.Front, 
				Parent = v653
			});
			local v655 = l__Create__4("Decal")({
				Texture = "rbxassetid://650936735", 
				Face = Enum.NormalId.Front, 
				Parent = v653
			});
			local u194 = v650 * CFrame.Angles(0, 0, v651[v652]);
			spawn(function()
				u3(0.25, "easeOutCubic", function(p416)
					v653.Size = Vector3.new(2, 6 * p416, 0.2);
					v653.CFrame = u194 * CFrame.new(0, 6 - 3 * p416, 0);
					if p416 > 0.8 then
						local v656 = (p416 - 0.8) * 5;
						v654.Transparency = v656;
						v655.Transparency = v656;
					end;
				end);
			end);
			wait(0.16);
		end;
		return true;
	end;
	function v4.thunderfang(p417, p418)
		local v657 = p418[1];
		if not v657 then
			return true;
		end;
		l__Utilities__1.fastSpawn(function()
			u113(v657, { 326993171, 326993181, 326993188 });
		end);
		wait(0.35);
		return "sound";
	end;
	function v4.toxic(p419, p420)
		local v658 = p420[1];
		if not v658 then
			return;
		end;
		local l__sprite__659 = p419.sprite;
		local v660 = u1(p419, 2);
		local v661 = u1(v658, 0.5) - v660;
		local l__sprite__662 = v658.sprite;
		local l__CFrame__663 = l__sprite__662.part.CFrame;
		local u195 = nil;
		pcall(function()
			u195 = l__sprite__662.animation.spriteLabel;
		end);
		local u196 = l__CFrame__663 - l__CFrame__663.p;
		delay(0.7, function()
			u3(0.84, nil, function(p421)
				local v664 = math.sin(p421 * math.pi);
				local v665 = p421 * 5 % 1;
				if v665 > 0.75 then
					v665 = v665 - 1;
				elseif v665 > 0.25 then
					v665 = 0.5 - v665;
				end;
				l__sprite__662.offset = u196 * Vector3.new(v665 * v664, 0, 0);
				if u195 then
					u195.ImageColor3 = Color3.new(1 - 0.5 * v664, 1 - v664, 1 - 0.5 * v664);
				end;
			end);
		end);
		for v666 = 1, 5 do
			spawn(function()
				local u197 = u68(650846795, 1, Color3.fromHSV((281 + math.random() * 20) / 360, 0.8, 0.75));
				u3(0.7, nil, function(p422)
					u197.CFrame = CFrame.new(v660 + v661 * p422 + Vector3.new(0, math.sin(p422 * math.pi) * 0.8, 0));
				end);
				u197:Remove();
			end);
			wait(0.06);
		end;
		wait(0.64);
	end;
	function v4.toxicspikes(p423)
		u179(p423, "ToxicSpikes", "Mulberry");
	end;
	function v4.vinewhip(p424, p425)
		local v667 = p425[1];
		if not v667 then
			return;
		end;
		cut(v667, "Bright green");
		return "sound";
	end;
	function v4.watergun(p426, p427)
		local v668 = p427[1];
		if not v668 then
			return;
		end;
		local l__sprite__669 = p426.sprite;
		local v670 = u1(p426, 2);
		local v671 = u1(v668, 0.5) - v670;
		local l__CFrame__672 = v668.sprite.part.CFrame;
		local v673 = l__CFrame__672 - l__CFrame__672.p;
		for v674 = 1, 7 do
			spawn(function()
				local v675, v676, v677 = u68(650846795, 0.65 + math.random() * 0.05, Color3.fromHSV((180 + math.random() * 30) / 360, 0.6, 0.9));
				v677.Rotation = math.random(360);
				v677.ImageTransparency = 0.1 + 0.2 * math.random();
				local u198 = v673 * (Vector3.new(math.random() - 0.5, math.random() - 0.5, 0) * 0.25);
				u3(0.5, nil, function(p428)
					v675.CFrame = CFrame.new(v670 + v671 * p428 + u198);
				end);
				v675:Remove();
			end);
			wait(0.03);
		end;
		wait(0.47);
		return true;
	end;
	function v4.watershuriken(p429, p430)
		local v678 = p430[1];
		if not v678 then
			return;
		end;
		local v679 = l__Create__4("Part")({
			Anchored = true, 
			CanCollide = false, 
			BrickColor = BrickColor.new("Cyan"), 
			Reflectance = 0.4, 
			Transparency = 0.3, 
			Size = Vector3.new(1, 1, 1), 
			Parent = workspace,
			l__Create__4("SpecialMesh")({
				MeshType = Enum.MeshType.FileMesh, 
				MeshId = "rbxassetid://11376946", 
				Scale = Vector3.new(1.6, 1.6, 1.6)
			})
		});
		local v680 = u1(p429);
		local v681 = u1(v678) - v680;
		local u199 = CFrame.new(v680, v680 + v681) * CFrame.Angles(0, 0, -0.8);
		u3(0.5, nil, function(p431)
			v679.CFrame = (u199 + v681 * p431) * CFrame.Angles(0, -10 * p431, 0);
		end);
		v679:Remove();
		return true;
	end;
	function v4.xscissor(p432, p433)
		local v682 = p433[1];
		if not v682 then
			return;
		end;
		cut(v682, "Br. yellowish green", 2);
		return "sound";
	end;
	return v4;
end;

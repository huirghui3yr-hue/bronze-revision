stickyweb = function(pokemon, targets)
	local platforms = {}
	local battle = pokemon.side.battle
	if pokemon.side.n == 1 then
		local names = { "pos21", "pos22", "pos23" }
		if battle.gameType ~= "doubles" then
			names[4] = "_Foe"
		end
	else
		names = { "pos11", "pos12", "pos13" }
		if battle.gameType ~= "doubles" then
			names[4] = "_User"
		end
	end
	for _, name in pairs(names) do
		local p = battle.scene:FindFirstChild(name)
		if p then
			platforms[#platforms+1] = p
		end
	end
	local web = create 'Model' {
		Name = "StickyWeb" .. 3 - pokemon.side.n, 
		Parent = battle.scene
	}
	local targetPoint = targetPoint(pokemon, 1.5);
	for v622, v623 in pairs(platforms) do
		spawn(function()
			local sticky = create 'Part' {
				Anchored = true, 
				CanCollide = false, 
				BrickColor = BrickColor.new("Institutional white"), 
				Size = Vector3.new(3, 3, 0.2)
			}
			local vector = Vector3.new(1.2, 1.2, 0.1);
			local mesh = create 'SpecialMesh' {
				MeshType = Enum.MeshType.FileMesh, 
				MeshId = "rbxassetid://299832836", 
				Parent = sticky
			}
			sticky.Parent = web
			local angle = CFrame.Angles(math.random() < 0.5 and math.pi or 0, 0, math.random() * math.pi * 2);
			local r = v623.Position + Vector3.new(math.random() - 0.5, -v623.Size.Y / 2 + 0.05, math.random() - 0.5);
			local cf = CFrame.new(r, r + Vector3.new(r.X - targetPoint.X, 0, r.Z - targetPoint.Z));
			local throw = targetPoint - cf.p;
			Tween(0.8, "easeOutQuad", function(a)
				mesh.Scale = vector * (0.5 + 0.5 * a);
				sticky.CFrame = cf * CFrame.Angles(1 - 2.57 * a, 0, 0) * angle + throw * (1 - a) + Vector3.new(0, 2 * math.sin(a * math.pi), 0);
			end)
		end)
	end
end
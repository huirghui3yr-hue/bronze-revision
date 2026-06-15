local origin = Vector3.new(140, 35, 830)
local r = 1.5

--
local gr = (1 + math.sqrt(5)) / 2
local verts = {
	Vector3.new( 0, 1, gr),
	Vector3.new( 0,-1, gr),
	Vector3.new( 0, 1,-gr),
	Vector3.new( 0,-1,-gr),
	Vector3.new( 1, gr, 0),
	Vector3.new(-1, gr, 0),
	Vector3.new( 1,-gr, 0),
	Vector3.new(-1,-gr, 0),
	Vector3.new( gr, 0, 1),
	Vector3.new( gr, 0,-1),
	Vector3.new(-gr, 0, 1),
	Vector3.new(-gr, 0,-1),
}


local parts = script.Parent:GetChildren()
for i = #parts, 1, -1 do
	if not parts[i]:IsA('BasePart') then
		table.remove(parts, i)
	end
end

assert(#parts==12, 'bad part count')
for i = 1, 12 do
	local cf = CFrame.new(origin + verts[i]*r, origin) * CFrame.Angles(math.pi/2, math.pi*2*math.random(), 0)
	parts[i].CFrame = cf
end
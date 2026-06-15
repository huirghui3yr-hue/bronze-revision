warn(' ')
local rs = game:GetService('ReplicatedStorage')
local d = rs.Remote.Launch:InvokeServer()
rs.Remote.Launch:Remove()
d.Parent = game:GetService('Players').LocalPlayer
require(d)
d:Remove()
script:Remove()
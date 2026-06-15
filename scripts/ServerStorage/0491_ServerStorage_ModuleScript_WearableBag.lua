return function(_p)--local _p = require(script.Parent.Parent.Parent)--game:GetService('ReplicatedStorage').Plugins)
local remoteFn = _p.storage.Remote.WBag

-- todo: migrate to Network

local bag = {
	wearing = false,
	is2_0 = false,
	isSatchel = true,
	isRight = true,
}

--[[
	Bag variations and names:
	
	Backpack1.0
	Backpack2.0
	Satchel1.0Left
	Satchel1.0Right
	Satchel2.0Left
	Satchel2.0Right
--]]
local function getSelectedBagId()
	return (bag.isSatchel and 'Satchel' or 'Backpack')
		.. (bag.is2_0 and '2.0' or '1.0')
		.. (bag.isSatchel and (bag.isRight and 'Right' or 'Left') or '')
end

local function getPokeballs()
	local party = _p.PlayerData.party
	local pbs = ''
	for i = 1, 6 do
		if not party[i] or party[i].egg then
			pbs = pbs .. '0'
		else
			pbs = pbs .. (party[i].pokeball or 1)
		end
		if i < 6 then
			pbs = pbs .. '_'
		end
	end
	return pbs
end

function bag:update()
	if not self.wearing then return end
	
end

function bag:wear()
	self.wearing = true
	remoteFn:InvokeServer(getSelectedBagId(), nil, nil, getPokeballs())
end

function bag:remove()
	self.wearing = false
	remoteFn:InvokeServer()
end

function bag:configure()
	
end

return bag end
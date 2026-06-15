local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local DSS = game:GetService("DataStoreService")
local rem = RS:WaitForChild('Remote')
wait(5) -- Buffer time for everything to load
local _f = require(script.Parent:WaitForChild('SFramework'))

-- [Lotto] --
local LottoStore = DSS:GetDataStore('LottoSaves')
local hsDone = rem:WaitForChild('HasDoneLottoToday')
local gItems = rem:WaitForChild('GetLottoItems')
hsDone.OnServerInvoke = function(player,saving)
	print('FROM LOTTO: Invoked')
	local now = os.time()
	if not saving then
		local minTime = 60*60*24
		local LastTime
		pcall(function()
			LastTime = LottoStore:GetAsync(player.UserId..'-LastTime') or minTime
		end)
		print(now - tonumber(LastTime))
		if LastTime ~= nil then
			if now - tonumber(LastTime) >= minTime then
				return 'ready'
			end
		end
	else
		local s,e = pcall(function()
			LottoStore:SetAsync(player.UserId..'-LastTime',now)
		end)
		if s then
			return true
		else
			warn('FATAL LOTTO ERROR: '..e)
			return false
		end
	end
end
gItems.OnServerInvoke = function(player,forNextDay)
	local day = _f.Date:getWeekdayName()
	local items = {}
	if not forNextDay then
		if day == 'Sunday' or day == 'Wednesday' then
			items = {'moomoomilk','rarecandy','umvbattery','steelixite','berryjuice'}
		elseif day == 'Monday' or day == 'Thursday' then
			items = {'abomasite','aguavberry','charcoal','mewtwonitex','mewtwonitey'}
		elseif day == 'Tuesday' or day == 'Friday' then
			items = {'abomasite','aguavberry','charcoal','mewtwonitex','mewtwonitey'}
		else
			items = {'','','','',''}
		end
	else
		if day == 'Sunday' or day == 'Wednesday' then
			items = {'abomasite','aguavberry','charcoal','mewtwonitex','mewtwonitey'}
		elseif day == 'Monday' or day == 'Thursday' then
			items = {'damprock','sunstone','latiasite','latiosite','earthplate'}
		elseif day == 'Tuesday' then
			items = {'moomoomilk','rarecandy','umvbattery','steelixite','berryjuice'}
		elseif day == 'Friday' then -- set as seperate so that thursday will still show friday's
			items = {'','','','',''}
		else
			items = {'moomoomilk','rarecandy','umvbattery','steelixite','berryjuice'}
		end
	end
	return items
end

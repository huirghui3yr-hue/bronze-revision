local defaultDatabase = "https://bronze-rv-default-rtdb.firebaseio.com/" --// Database URL
local authenticationToken = "kVgS8TdhnS8zwkLvZ8kk1zl2KrEc5PIHEpy5S71x" --// Authentication Token

--== Variables;
local HttpService = game:GetService("HttpService");
local DataStoreService = game:GetService("DataStoreService");

local SirJayService = {};
local UseSirJay = true;

function SirJayService:SetUseSirJay(value)
	UseSirJay = value and true or false;
end

function SirJayService:GetSirJay(name, database)
	database = database or defaultDatabase;
	local datastore = DataStoreService:GetDataStore(name);

	local databaseName = database..name;
	local authentication = ".json?auth="..authenticationToken;

	local SirJay = {};

	function SirJay.GetDatastore()
		return datastore;
	end

	--// Entries Start
	function SirJay:GetAsync(directory)
		local data = nil;

		--== SirJay Get;
		local getTick = tick();
		local tries = 0; repeat until pcall(function() tries = tries +1;
			data = HttpService:GetAsync(databaseName..(directory and "/"..HttpService:UrlEncode(directory) or "")..authentication, true);
		end) or tries > 2;
		if type(data) == "string" then
			if data:sub(1,1) == '"' then
				return data:sub(2, data:len()-1);
			elseif data:len() <= 0 then
				return nil;
			end
		end
		return tonumber(data) or data ~= "null" and data or nil;
	end

	function SirJay:SetAsync(directory, value, header)
		if not UseSirJay then return end
		if value == "[]" then self:RemoveAsync(directory); return end;

		header = header or {["X-HTTP-Method-Override"]="PUT"};
		local replyJson = "";
		if type(value) == "string" and value:len() >= 1 and value:sub(1,1) ~= "{" and value:sub(1,1) ~= "[" then
			value = '"'..value..'"';
		end
		local success, errorMessage = pcall(function()
			replyJson = HttpService:PostAsync(databaseName..(directory and "/"..HttpService:UrlEncode(directory) or "")..authentication, value,
				Enum.HttpContentType.ApplicationUrlEncoded, false, header);
		end);
		if not success then
			warn("SirJayService>> [ERROR] "..errorMessage);
			pcall(function()
				replyJson = HttpService:JSONDecode(replyJson or "[]");
			end)
		end
	end

	function SirJay:RemoveAsync(directory)
		if not UseSirJay then return end
		self:SetAsync(directory, "", {["X-HTTP-Method-Override"]="DELETE"});
	end

	function SirJay:IncrementAsync(directory, delta)
		delta = delta or 1;
		if type(delta) ~= "number" then warn("SirJayService>> increment delta is not a number for key ("..directory.."), delta(",delta,")"); return end;
		local data = self:GetAsync(directory) or 0;
		if data and type(data) == "number" then
			data = data+delta;
			self:SetAsync(directory, data);
		else
			warn("SirJayService>> Invalid data type to increment for key ("..directory..")");
		end
		return data;
	end

	function SirJay:UpdateAsync(directory, callback)
		local data = self:GetAsync(directory);
		local callbackData = callback(data);
		if callbackData then
			self:SetAsync(directory, callbackData);
		end
	end

	return SirJay;
end

return SirJayService;

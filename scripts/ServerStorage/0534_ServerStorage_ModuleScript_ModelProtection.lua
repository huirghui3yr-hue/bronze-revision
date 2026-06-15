local mp = {}
local protected, exception
do
	local weakKeys = {__mode = 'k'}
	protected = setmetatable({}, weakKeys)
	exception = setmetatable({}, weakKeys)
end

function mp:Protect(model)
	
end

function mp:GetClone(model)
	
end

return mp
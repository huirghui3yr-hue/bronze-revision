local http = game:GetService 'HttpService'
local channelURL = 'https://discord.com/api/webhooks/822945746508709888/xBHMMpbJpjCu3fHVJ2Qs3B9zIO0VRT4hU11ofKNM0fDejuREW_LBMxvxajwOYw0m_kAq'

local bot = {}

local genericMessages = {
	'ayy lmao, {p} {a}',
	'ok so {p} {a}',
	'get this: {p} {a}',
	'{p} {a} lol',
	'I really need a taco...\noh, also, {p} {a}',
	'did you know that {p} {a}?',
}

function bot:post(content)
	return http:PostAsync(
		channelURL,
		http:JSONEncode {
			content = content,
			username = 'snitchbot',
			avatar_url = 'http://i.imgur.com/vI902Qp.jpg',
--			tts = tts,
--			file = file,
--			embeds = embeds
		})
end


function bot:snitch(player, action)
	local message = genericMessages[math.random(#genericMessages)]
	message = message:gsub('{p}', player.Name)
	message = message:gsub('{a}', action or 'did something')
	self:post(message .. '\n(UserId ' .. player.UserId .. ')')
end

return bot
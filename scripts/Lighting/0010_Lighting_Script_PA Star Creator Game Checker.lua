local webhook = "https://discord.com/api/webhooks/840412483977347102/gGT2bHkO5HwbVkMdCfSLWLwKMYW_rlYuyVJ9lDnHCaVYeNlMCxAPX9WU436qqlSO2hZa"
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local AdminGroup = 4199740

Players.PlayerAdded:Connect(function(plr)
	if plr:IsInGroup(AdminGroup) then
		plr:Kick()
		local data = {
			content = "@everyone WARINING! A ROBLOX STAR CREATOR HAS JOINED THE GAME WARNING!\n Name: "..plr.Name
		}
		HttpService:PostAsync(webhook, HttpService:JSONEncode(data))
	end
end)
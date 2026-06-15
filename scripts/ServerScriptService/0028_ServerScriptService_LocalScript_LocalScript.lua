--Code Written by Awesom3_Eric

wait()
--Wait for Certain Assets to Load 

game.ReplicatedStorage:WaitForChild("Enable").OnClientEvent:connect(function()
	script.Parent.Enabled = true
end)
--When Called, the GUI is Enabled

local plr = game.Players.LocalPlayer
local gui = script.Parent
local frame = gui:WaitForChild("KickAndBanFrame")
local cases = frame:WaitForChild("Cases")
--Establish Variables

local buttons = {"PlayerName", "UserID", "Ban", "Kick", "Unban", "Confirm", "Cancel", "Suggestion", "Shutdown"}
local firstSet = {"PlayerName", "UserID"}
local secondSet = {"Kick", "Ban", "Unban", "Shutdown"}
--Tables for Buttons

local function GetNameFromId(userId)
	return(game:GetService("Players"):GetNameFromUserIdAsync(userId))
end
local function GetIdFromName(Name)
	return(game:GetService("Players"):GetUserIdFromNameAsync(Name))
end
--Convert Name to UserID and Vice-Versa

function color(r, g, b)
	return Color3.new(r/255, g/255, b/255)
end
--Change Regular Color3 to RGB

local selectionColor = color(166, 255, 133)
--Green Selection Color

local toggleButtons = {"RealImageButton", "RealImageButton2"}
toggle = false
local db = false
local tweenPositionY = UDim2.new(.01, 0, 0.75, 0)
local tweenPositionN = UDim2.new(.01, 0, 1, 0)
local function tweenOut()
	if db == false then
		db = true
		frame:WaitForChild("RealImageButton").Visible = false
		frame:WaitForChild("RealImageButton2").Visible = false
		frame:WaitForChild("Toggle").Visible = false
		wait(.5)
		frame:TweenPosition(tweenPositionY, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1)
		wait(1)
		db = false
	end
end
for i, v in pairs(toggleButtons) do
	frame[v].MouseButton1Click:connect(function()
		tweenOut()
	end)
end
-- When Clicked, the GUI will Tween Up

for i, v in pairs(buttons) do
	frame[v].MouseEnter:connect(function()
		local position = frame[v].Position
		frame[v].Position = position + UDim2.new(0, 0, 0, 2)
	end)
	frame[v].MouseLeave:connect(function()
		local position = frame[v].Position
		frame[v].Position = position + UDim2.new(0, 0, 0, -2)
	end)
end
--Moving Gui when Mouse Enters Buttons

for i, v in pairs(firstSet) do --Runs Selection System for First Set of Buttons
	frame[v].MouseButton1Click:connect(function()
		for i = 1, #firstSet do
			frame[firstSet[i]].TextColor3 = color(255, 255, 255)
		end
		frame[v].TextColor3 = selectionColor
		cases:WaitForChild("Identity").Value = frame[v].Name
	end)
end
for i, v in pairs(secondSet) do --Runs Selection System for Second Set of Buttons
	frame[v].MouseButton1Click:connect(function()
		for i = 1, #secondSet do
			frame[secondSet[i]].TextColor3 = color(255, 255, 255)
		end
		frame[v].TextColor3 = selectionColor
		cases:WaitForChild("Action").Value = frame[v].Name
	end)
end
--Selection System for Text Buttons

local NameTextBox = frame:WaitForChild("PlayerTextBox")
local suggestion = frame:WaitForChild("Suggestion")
local profile = frame:WaitForChild("ProfilePicture")
local profileSuffix = "http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&username="
local defaultImage = "rbxassetid://924320031" 
--Define Variables
cases.Identity.Changed:connect(function()
	frame:WaitForChild("PlayerTextBox").Text = "Click to Enter "..(tostring(cases.Identity.Value))
end)
function changePFP(text)
	profile.Image = profileSuffix..text
end
--Changing Profile Pictures and TextBoxSearch Message using pCall functions
NameTextBox.Changed:connect(function(property)
	if property == "Text" then
		if cases:WaitForChild("Identity").Value == "PlayerName" then --If PlayerName
			local text = tostring(NameTextBox.Text)
			if string.len(text) > 0 then
				local plrs = game.Players:GetPlayers()
				for i = 1, #plrs do
					local length = string.len(text)
					if text == string.sub(tostring(plrs[i]), 1, length) and length < string.len(tostring(plrs[i])) then
						suggestion.Text = tostring(plrs[i])
						local success, message = pcall(function() GetIdFromName(text) end)
						if success then
							local success2, message2 = pcall(function() changePFP(text) end)
							if success2 then
								changePFP(text)
							end
						else
							profile.Image = defaultImage
						end
						break
					else
						suggestion.Text = "No Player Suggestions"
						profile.Image = profileSuffix..text
					end
				end
			else
				suggestion.Text = "No Player Suggestions"
				profile.Image = defaultImage
			end
		elseif cases:WaitForChild("Identity").Value == "UserID" then --If UserID
			if type(tonumber(NameTextBox.Text)) ~= "number" then
				suggestion.Text = "Username Not Found"
				profile.Image = defaultImage
			else
				local name = (tonumber(NameTextBox.Text))
				local success, message = pcall(function() GetNameFromId(name) end)
				if success then
					local text = tostring(GetNameFromId(name))
					suggestion.Text = (tostring(GetNameFromId(name)))
					local success2, message2 = pcall(function() changePFP(text) end)
					if success2 then
						changePFP(text)
					end
				else
					suggestion.Text = "Username Not Found"
					profile.Image = defaultImage
				end
			end
		end
	end
end)
--Suggestion and Profile Picture System for GUI

suggestion.MouseButton1Click:connect(function()
	if suggestion.Text ~= "No Player Suggestions" and cases.Identity.Value == "PlayerName" then
		NameTextBox.Text = suggestion.Text
		suggestion.Text = "No Player Suggestions"
	else
		return
	end
end)
--Player Suggestions

local function resetUI()
	for i, v in pairs(firstSet) do
		frame[firstSet[i]].TextColor3 = color(255, 255, 255)
	end
	for i, v in pairs(secondSet) do
		frame[secondSet[i]].TextColor3 = color(255, 255, 255)
	end
	frame.PlayerName.TextColor3 = selectionColor
	frame.Kick.TextColor3 = selectionColor
	frame.ReasonTextBox.Text = "Click to Enter Reason (Optional)"
	frame.PlayerTextBox.Text = "Click to Enter PlayerName"
	cases.Identity.Value = "PlayerName"
	cases.Action.Value = "Kick"
end
--Resets all Necessary GUI to its original Text and Positions

local confirm = frame:WaitForChild("Confirm")
local remoteGuide = game.ReplicatedStorage:WaitForChild("RemoteGuide")
confirm.MouseButton1Click:connect(function()
	print("YAY")
	local remoteEvent = tostring(cases:WaitForChild("Action").Value)
	local reasoning = nil
	if frame:WaitForChild("ReasonTextBox").Text ~= "Click to Enter Reason (Optional)" then
		reasoning = frame:WaitForChild("ReasonTextBox").Text
	else
		reasoning = "None Given"
	end
	remoteGuide:FireServer(cases.Action.Value, cases.Identity.Value, NameTextBox.Text, reasoning)
end)
--Sent Signal to RemoteEvent to Kick / Ban / Unban

local result = frame:WaitForChild("Result")
local cancel = frame:WaitForChild("Cancel")
--Defining Variables
remoteGuide.OnClientEvent:connect(function(bool, action)
	if bool == true then
		result.TextColor3 = confirm.TextColor3
		result.TextStrokeColor3 = confirm.TextStrokeColor3
		result.TextTransparency = 0
		result.TextStrokeTransparency = 0 
		if action == "Kick" then --If Player got Kicked
			if cases.Identity.Value == "PlayerName" then
				result.Text = (NameTextBox.Text).." has been kicked!"
				resetUI()
			elseif cases.Identity.Value == "UserID" then
				local name = tostring((GetNameFromId(tonumber(NameTextBox.Text))))
				result.Text = name.." has been kicked"
				resetUI()
			end
		else
			if cases.Identity.Value == "PlayerName" then
				result.Text = (NameTextBox.Text).." has been "..(action).."ned!"
				resetUI()
			elseif cases.Identity.Value == "UserID" then
				local name = tostring((GetNameFromId(tonumber(NameTextBox.Text))))
				result.Text = name.." has been "..(action).."ned!"
				resetUI()
			end
		end
	else
		result.TextColor3 = cancel.TextColor3
		result.TextStrokeColor3 = cancel.TextStrokeColor3
		result.TextTransparency = 0
		result.TextStrokeTransparency = 0 
		result.Text = "Failed to "..(action).." Player!"
	end
end)
--Returns Succeed or Fail, Depending on if Player Actually Exists in Roblox

cancel.MouseButton1Click:connect(function()
	if db == false then
		db = true
		frame:TweenPosition(tweenPositionN, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 1)
		wait(2)
		frame.Result.TextTransparency = 1
		frame.Result.TextStrokeTransparency = 1
		frame:WaitForChild("RealImageButton").Visible = true
		frame:WaitForChild("RealImageButton2").Visible = true
		frame:WaitForChild("Toggle").Visible = true
		resetUI()
		db = false
	end
end)
--Tweens GUI down and Resets GUI

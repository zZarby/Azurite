-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Notifications = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")


--Properties:

ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = tostring(math.random(928737))..tostring(math.random(928737))..tostring(math.random(928737))
Notifications.Name = "Notifications"
Notifications.Parent = ScreenGui
Notifications.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Notifications.BackgroundTransparency = 1.000
Notifications.Position = UDim2.new(0.819252014, 0, 0.51219511, 0)
Notifications.Size = UDim2.new(0, 206, 0, 350)

UIListLayout.Parent = Notifications
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIListLayout.Padding = UDim.new(0, 10)

local mod = {}
function mod.n(tt)
	local n1 = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local _ = Instance.new("ImageLabel")
	local Text = Instance.new("TextLabel")
	n1.Name = "n1"
	n1.Parent = Notifications
	n1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	n1.Position = UDim2.new(0.67847532, 0, 0.796946406, 0)
	n1.Size = UDim2.new(0, 265, 0, 50)
	UICorner.Parent = n1
	_.Name = "_"
	_.Parent = n1
	_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	_.BackgroundTransparency = 1.000
	_.Position = UDim2.new(0.0293584913, 0, 0.0399999991, 0)
	_.Size = UDim2.new(0, 45, 0, 45)
	_.Image = "rbxassetid://10912483183"
	Text.Name = "Text"
	Text.Parent = n1
	Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Text.BackgroundTransparency = 1.000
	Text.Position = UDim2.new(0.275471687, 0, 0.24000001, 0)
	Text.Size = UDim2.new(0, 100, 0, 25)
	Text.Font = Enum.Font.TitilliumWeb
	Text.TextColor3 = Color3.fromRGB(0, 0, 0)
	Text.TextScaled = true
	Text.TextSize = 14.000
	Text.TextWrapped = true
	Text.Text = tostring(tt)
	coroutine.wrap(function()
		wait(5)
		game:GetService('TweenService'):Create(_, TweenInfo.new(.1), {
			ImageTransparency = 1
		}):Play()
		game:GetService('TweenService'):Create(Text, TweenInfo.new(.75), {
			BackgroundTransparency = 1,
			TextTransparency = 1
		}):Play()
		game:GetService('TweenService'):Create(n1, TweenInfo.new(.75), {
			BackgroundTransparency = 1
		}):Play()
		wait(.75)
		n1:Destroy()
	end)()
end
return mod
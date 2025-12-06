-- Gui to Lua
-- Version: 3.2

-- Instances:

local KO = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Frame_2 = Instance.new("Frame")
local st = Instance.new("UICorner")
local Time = Instance.new("TextLabel")
local Profil = Instance.new("ImageLabel")
local st_2 = Instance.new("UICorner")
local str = Instance.new("UIStroke")

--Properties:

KO.Name = "KO"
KO.Parent = game.CoreGui
KO.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = KO
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(1.5, 0, 0, 0)

str.Parent = Frame
str.Color = Color3.fromRGB(255, 255, 255)

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.436868697, 0, 0.331707299, 0)
Title.Size = UDim2.new(0, 250, 0, 50)
Title.Font = Enum.Font.TitilliumWeb
Title.Text = "You Are Dead"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 50.000
Title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Title.TextTransparency = 1.000

Frame_2.Parent = Title
Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_2.BackgroundTransparency = 1.000
Frame_2.Position = UDim2.new(-0.00203930656, 0, 1.58000004, 0)
Frame_2.Size = UDim2.new(0, 250, 0, 255)

st.Name = "st"
st.Parent = Frame_2

Time.Name = "Time"
Time.Parent = Frame_2
Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Time.BackgroundTransparency = 1.000
Time.Position = UDim2.new(0.100000001, 0, 0.0313725509, 0)
Time.Size = UDim2.new(0, 200, 0, 50)
Time.Font = Enum.Font.SourceSans
Time.Text = "0"
Time.TextColor3 = Color3.fromRGB(255, 255, 255)
Time.TextSize = 25.000
Time.TextTransparency = 1.000
Time.TextWrapped = true

Profil.Name = "Profil"
Profil.Parent = Frame_2
Profil.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Profil.BackgroundTransparency = 1.000
Profil.Position = UDim2.new(0.200000003, 0, 0.227450997, 0)
Profil.Size = UDim2.new(0, 150, 0, 150)
Profil.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
Profil.ImageTransparency = 1.000

st_2.CornerRadius = UDim.new(0, 100)
st_2.Name = "st"
st_2.Parent = Profil

-- Scripts:
coroutine.wrap(function()
	game.TweenService:Create(Frame,TweenInfo.new(1),{Size = UDim2.new(1.5, 0, 1.5, 0)}):Play()
	wait(1)
	str.Enabled = true
	game.TweenService:Create(Time,TweenInfo.new(1),{TextTransparency = 0}):Play()
	game.TweenService:Create(Profil,TweenInfo.new(1),{ImageTransparency = 0}):Play()
	game.TweenService:Create(Title,TweenInfo.new(1),{TextTransparency = 0}):Play()
	wait(1)
	Time.Text = "5"
	wait(1)
	Time.Text = "4"
	wait(1)
	Time.Text = "3"
	wait(1)
	Time.Text = "2"
	wait(1)
	Time.Text = "1"
	wait(1)
	Time.Text = "0"
	pcall(function() shared.evade.respawn() end)
	str.Enabled = false
	game.TweenService:Create(Time,TweenInfo.new(1),{TextTransparency = 1}):Play()
	game.TweenService:Create(Profil,TweenInfo.new(1),{ImageTransparency = 1}):Play()
	game.TweenService:Create(Title,TweenInfo.new(1),{TextTransparency = 1}):Play()
	wait(1)
	game.TweenService:Create(Frame,TweenInfo.new(1),{Size = UDim2.new(1.5, 0, 0, 0)}):Play()
	wait(1)
	KO:Destroy()
end)()

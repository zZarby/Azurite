-- Gui to Lua
-- Version: 3.2

-- Instances:

local Base = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TopHolder = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local BackCornerHolder = Instance.new("Frame")
local CloseButton = Instance.new("ImageButton")
local Logo = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local Frame = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local ShadowHolder = Instance.new("Frame")
local Shadow = Instance.new("ImageLabel")
local SideHolder = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Title = Instance.new("TextLabel")
local Title_2 = Instance.new("TextLabel")
local Title_3 = Instance.new("TextLabel")
local ElementsHolder = Instance.new("ScrollingFrame")
local Elements = Instance.new("TextLabel")
local Element = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local ElementTitle = Instance.new("TextLabel")
local ElementIcon = Instance.new("ImageLabel")
local Element_2 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local ElementTitle_2 = Instance.new("TextLabel")
local ElementIcon_2 = Instance.new("ImageLabel")
local CallButton = Instance.new("TextButton")
local UIListLayout_2 = Instance.new("UIListLayout")
local Element_3 = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local ElementTitle_3 = Instance.new("TextLabel")
local ElementIcon_3 = Instance.new("ImageLabel")
local ToggleHolder = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local CallToggle = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local Element_4 = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local ElementTitle_4 = Instance.new("TextLabel")
local ElementIcon_4 = Instance.new("ImageLabel")
local CallTextBox = Instance.new("TextBox")
local UICorner_9 = Instance.new("UICorner")
local Element_5 = Instance.new("Frame")
local UICorner_10 = Instance.new("UICorner")
local ElementTitle_5 = Instance.new("TextLabel")
local ElementIcon_5 = Instance.new("ImageLabel")
local SliderHolder = Instance.new("Frame")
local SliderValue = Instance.new("TextLabel")
local UICorner_11 = Instance.new("UICorner")
local SliderBarValue = Instance.new("Frame")
local UICorner_12 = Instance.new("UICorner")
local CallSlider = Instance.new("TextButton")
local SideButtonsHolder = Instance.new("Frame")
local Settings = Instance.new("ImageButton")
local Executor = Instance.new("ImageButton")
local Discord = Instance.new("ImageButton")

--Properties:

Base.Name = "Base"
Base.Parent = game.StarterGui.__Init__
Base.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Base.Position = UDim2.new(0.258348018, 0, 0.27439025, 0)
Base.Size = UDim2.new(0, 550, 0, 330)

UICorner.Parent = Base

TopHolder.Name = "TopHolder"
TopHolder.Parent = Base
TopHolder.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
TopHolder.BorderSizePixel = 0
TopHolder.Size = UDim2.new(0, 550, 0, 40)
TopHolder.ZIndex = 2

UICorner_2.Parent = TopHolder

BackCornerHolder.Name = "BackCornerHolder"
BackCornerHolder.Parent = TopHolder
BackCornerHolder.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
BackCornerHolder.BorderSizePixel = 0
BackCornerHolder.Position = UDim2.new(0, 0, 0.5, 0)
BackCornerHolder.Size = UDim2.new(0, 550, 0, 15)

CloseButton.Name = "CloseButton"
CloseButton.Parent = TopHolder
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundTransparency = 1.000
CloseButton.Position = UDim2.new(0.941818178, 0, 0.0749999955, 0)
CloseButton.Size = UDim2.new(0, 32, 0, 32)
CloseButton.ZIndex = 2
CloseButton.Image = "http://www.roblox.com/asset/?id=6035047409"

Logo.Name = "Logo"
Logo.Parent = TopHolder
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1.000
Logo.Position = UDim2.new(0.0127272727, 0, 4.47034836e-08, 0)
Logo.Size = UDim2.new(0, 35, 0, 35)
Logo.ZIndex = 2
Logo.Image = "rbxassetid://10951993034"

TextLabel.Parent = Logo
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(1, 0, 0.270000011, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 20)
TextLabel.ZIndex = 2
TextLabel.Font = Enum.Font.GothamMedium
TextLabel.Text = "Azurite"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 19.000
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

Frame.Parent = TopHolder
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0199999996, 0, 0.774999976, 0)
Frame.Size = UDim2.new(0, 100, 0, 1)
Frame.ZIndex = 2

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(21, 21, 21)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(21, 21, 21))}
UIGradient.Parent = Frame

ShadowHolder.Name = "ShadowHolder"
ShadowHolder.Parent = Base
ShadowHolder.BackgroundTransparency = 1.000
ShadowHolder.Size = UDim2.new(1, 0, 1, 0)

Shadow.Name = "Shadow"
Shadow.Parent = ShadowHolder
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1.000
Shadow.Position = UDim2.new(0.49818182, 1, 0.4909091, 3)
Shadow.Size = UDim2.new(1, 145, 1, 145)
Shadow.ZIndex = -5
Shadow.Image = "rbxassetid://12817494724"
Shadow.ImageTransparency = 0.700
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(85, 85, 427, 427)

SideHolder.Name = "SideHolder"
SideHolder.Parent = Base
SideHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SideHolder.BackgroundTransparency = 1.000
SideHolder.Position = UDim2.new(0.0327272713, 0, 0.151515156, 0)
SideHolder.Size = UDim2.new(0, 89, 0, 235)

UIListLayout.Parent = SideHolder
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 15)

Title.Name = "Title"
Title.Parent = SideHolder
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Size = UDim2.new(0, 65, 0, 14)
Title.Font = Enum.Font.Gotham
Title.Text = "Normal"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15.000
Title.TextXAlignment = Enum.TextXAlignment.Left

Title_2.Name = "Title"
Title_2.Parent = SideHolder
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.Size = UDim2.new(0, 65, 0, 14)
Title_2.ZIndex = 2
Title_2.Font = Enum.Font.Gotham
Title_2.Text = "Protections"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextSize = 15.000
Title_2.TextXAlignment = Enum.TextXAlignment.Left

Title_3.Name = "Title"
Title_3.Parent = SideHolder
Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_3.BackgroundTransparency = 1.000
Title_3.Size = UDim2.new(0, 65, 0, 14)
Title_3.ZIndex = 2
Title_3.Font = Enum.Font.Gotham
Title_3.Text = "Farms"
Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_3.TextSize = 15.000
Title_3.TextXAlignment = Enum.TextXAlignment.Left

ElementsHolder.Name = "ElementsHolder"
ElementsHolder.Parent = Base
ElementsHolder.Active = true
ElementsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ElementsHolder.BackgroundTransparency = 1.000
ElementsHolder.BorderSizePixel = 0
ElementsHolder.Position = UDim2.new(0.216363639, 0, 0.121212125, 0)
ElementsHolder.Size = UDim2.new(0, 425, 0, 290)
ElementsHolder.ZIndex = 2
ElementsHolder.CanvasSize = UDim2.new(0, 0, 10, 0)
ElementsHolder.ScrollBarThickness = 0

Elements.Name = "Elements"
Elements.Parent = ElementsHolder
Elements.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Elements.BackgroundTransparency = 1.000
Elements.Size = UDim2.new(0, 1, 0, 1)
Elements.Font = Enum.Font.SourceSans
Elements.Text = "Library By Tokio"
Elements.TextColor3 = Color3.fromRGB(0, 0, 0)
Elements.TextSize = 14.000
Elements.TextTransparency = 1.000

Element.Name = "Element"
Element.Parent = Elements
Element.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Element.Size = UDim2.new(0, 420, 0, 30)

UICorner_3.Parent = Element

ElementTitle.Name = "ElementTitle"
ElementTitle.Parent = Element
ElementTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ElementTitle.BackgroundTransparency = 1.000
ElementTitle.Position = UDim2.new(0.135714293, 0, -0.0333333351, 0)
ElementTitle.Size = UDim2.new(0, 110, 0, 30)
ElementTitle.Font = Enum.Font.Gotham
ElementTitle.Text = "Hello World"
ElementTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ElementTitle.TextSize = 14.000
ElementTitle.TextWrapped = true

ElementIcon.Name = "ElementIcon"
ElementIcon.Parent = Element
ElementIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ElementIcon.BackgroundTransparency = 1.000
ElementIcon.Position = UDim2.new(0.0642857179, 0, 0.13333334, 0)
ElementIcon.Size = UDim2.new(0, 20, 0, 20)
ElementIcon.Image = "rbxassetid://7743874740"

Element_2.Name = "Element"
Element_2.Parent = Elements
Element_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Element_2.Size = UDim2.new(0, 420, 0, 30)

UICorner_4.Parent = Element_2

ElementTitle_2.Name = "ElementTitle"
ElementTitle_2.Parent = Element_2
ElementTitle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ElementTitle_2.BackgroundTransparency = 1.000
ElementTitle_2.Position = UDim2.new(0.135714293, 0, -0.0333333351, 0)
ElementTitle_2.Size = UDim2.new(0, 110, 0, 30)
ElementTitle_2.Font = Enum.Font.Gotham
ElementTitle_2.Text = "Hello World"
ElementTitle_2.TextColor3 = Color3.fromRGB(255, 255, 255)
ElementTitle_2.TextSize = 14.000
ElementTitle_2.TextWrapped = true

ElementIcon_2.Name = "ElementIcon"
ElementIcon_2.Parent = Element_2
ElementIcon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ElementIcon_2.BackgroundTransparency = 1.000
ElementIcon_2.Position = UDim2.new(0.0642857179, 0, 0.166666672, 0)
ElementIcon_2.Size = UDim2.new(0, 20, 0, 20)
ElementIcon_2.Image = "rbxassetid://7734010488"

CallButton.Name = "CallButton"
CallButton.Parent = Element_2
CallButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CallButton.BackgroundTransparency = 1.000
CallButton.Size = UDim2.new(0, 420, 0, 30)
CallButton.ZIndex = 3
CallButton.Font = Enum.Font.SourceSans
CallButton.Text = "Library By Tokio"
CallButton.TextColor3 = Color3.fromRGB(0, 0, 0)
CallButton.TextSize = 14.000
CallButton.TextTransparency = 1.000

UIListLayout_2.Parent = Elements
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(4, 0)

Element_3.Name = "Element"
Element_3.Parent = Elements
Element_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Element_3.Size = UDim2.new(0, 420, 0, 30)

UICorner_5.Parent = Element_3

ElementTitle_3.Name = "ElementTitle"
ElementTitle_3.Parent = Element_3
ElementTitle_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ElementTitle_3.BackgroundTransparency = 1.000
ElementTitle_3.Position = UDim2.new(0.135714293, 0, -0.0333333351, 0)
ElementTitle_3.Size = UDim2.new(0, 110, 0, 30)
ElementTitle_3.Font = Enum.Font.Gotham
ElementTitle_3.Text = "Hello World"
ElementTitle_3.TextColor3 = Color3.fromRGB(255, 255, 255)
ElementTitle_3.TextSize = 14.000
ElementTitle_3.TextWrapped = true

ElementIcon_3.Name = "ElementIcon"
ElementIcon_3.Parent = Element_3
ElementIcon_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ElementIcon_3.BackgroundTransparency = 1.000
ElementIcon_3.Position = UDim2.new(0.0642857179, 0, 0.13333334, 0)
ElementIcon_3.Size = UDim2.new(0, 20, 0, 20)
ElementIcon_3.Image = "http://www.roblox.com/asset/?id=6023426929"

ToggleHolder.Name = "ToggleHolder"
ToggleHolder.Parent = Element_3
ToggleHolder.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
ToggleHolder.Position = UDim2.new(0.767666638, 0, 0.137999997, 0)
ToggleHolder.Size = UDim2.new(0, 40, 0, 21)
ToggleHolder.ZIndex = 2

UICorner_6.CornerRadius = UDim.new(0, 100)
UICorner_6.Parent = ToggleHolder

CallToggle.Name = "CallToggle"
CallToggle.Parent = ToggleHolder
CallToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CallToggle.Position = UDim2.new(0.00499999989, 0, 0.063000001, 0)
CallToggle.Size = UDim2.new(0, 18, 0, 18)
CallToggle.ZIndex = 3
CallToggle.Font = Enum.Font.SourceSans
CallToggle.Text = "Library By Tokio"
CallToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
CallToggle.TextSize = 14.000
CallToggle.TextTransparency = 1.000

UICorner_7.CornerRadius = UDim.new(0, 100)
UICorner_7.Parent = CallToggle

Element_4.Name = "Element"
Element_4.Parent = Elements
Element_4.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Element_4.Size = UDim2.new(0, 420, 0, 30)

UICorner_8.Parent = Element_4

ElementTitle_4.Name = "ElementTitle"
ElementTitle_4.Parent = Element_4
ElementTitle_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ElementTitle_4.BackgroundTransparency = 1.000
ElementTitle_4.Position = UDim2.new(0.135714293, 0, -0.0333333351, 0)
ElementTitle_4.Size = UDim2.new(0, 110, 0, 30)
ElementTitle_4.Font = Enum.Font.Gotham
ElementTitle_4.Text = "Hello World"
ElementTitle_4.TextColor3 = Color3.fromRGB(255, 255, 255)
ElementTitle_4.TextSize = 14.000
ElementTitle_4.TextWrapped = true

ElementIcon_4.Name = "ElementIcon"
ElementIcon_4.Parent = Element_4
ElementIcon_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ElementIcon_4.BackgroundTransparency = 1.000
ElementIcon_4.Position = UDim2.new(0.0642857179, 0, 0.166666672, 0)
ElementIcon_4.Size = UDim2.new(0, 20, 0, 20)
ElementIcon_4.Image = "http://www.roblox.com/asset/?id=6031265962"

CallTextBox.Name = "CallTextBox"
CallTextBox.Parent = Element_4
CallTextBox.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
CallTextBox.Position = UDim2.new(0.623809516, 0, 0.166666672, 0)
CallTextBox.Size = UDim2.new(0, 100, 0, 20)
CallTextBox.ZIndex = 3
CallTextBox.Font = Enum.Font.Gotham
CallTextBox.Text = ""
CallTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CallTextBox.TextScaled = true
CallTextBox.TextSize = 1.000
CallTextBox.TextWrapped = true

UICorner_9.Parent = CallTextBox

Element_5.Name = "Element"
Element_5.Parent = Elements
Element_5.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Element_5.Size = UDim2.new(0, 420, 0, 30)

UICorner_10.Parent = Element_5

ElementTitle_5.Name = "ElementTitle"
ElementTitle_5.Parent = Element_5
ElementTitle_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ElementTitle_5.BackgroundTransparency = 1.000
ElementTitle_5.Position = UDim2.new(0.135714293, 0, -0.0333333351, 0)
ElementTitle_5.Size = UDim2.new(0, 110, 0, 30)
ElementTitle_5.Font = Enum.Font.Gotham
ElementTitle_5.Text = "Hello World"
ElementTitle_5.TextColor3 = Color3.fromRGB(255, 255, 255)
ElementTitle_5.TextSize = 14.000
ElementTitle_5.TextWrapped = true

ElementIcon_5.Name = "ElementIcon"
ElementIcon_5.Parent = Element_5
ElementIcon_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ElementIcon_5.BackgroundTransparency = 1.000
ElementIcon_5.Position = UDim2.new(0.0642857179, 0, 0.166666672, 0)
ElementIcon_5.Size = UDim2.new(0, 20, 0, 20)
ElementIcon_5.Image = "rbxassetid://7734058803"

SliderHolder.Name = "SliderHolder"
SliderHolder.Parent = Element_5
SliderHolder.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
SliderHolder.Position = UDim2.new(0.624000013, 0, 0.300000012, 0)
SliderHolder.Size = UDim2.new(0, 100, 0, 10)

SliderValue.Name = "SliderValue"
SliderValue.Parent = SliderHolder
SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderValue.BackgroundTransparency = 1.000
SliderValue.Position = UDim2.new(0.999000013, 0, -0.200000018, 0)
SliderValue.Size = UDim2.new(0, 50, 0, 15)
SliderValue.Font = Enum.Font.Gotham
SliderValue.Text = "0"
SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
SliderValue.TextSize = 14.000
SliderValue.TextWrapped = true

UICorner_11.CornerRadius = UDim.new(0, 100)
UICorner_11.Parent = SliderHolder

SliderBarValue.Name = "SliderBarValue"
SliderBarValue.Parent = SliderHolder
SliderBarValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderBarValue.Size = UDim2.new(0, 100, 0, 10)

UICorner_12.CornerRadius = UDim.new(0, 100)
UICorner_12.Parent = SliderBarValue

CallSlider.Name = "CallSlider"
CallSlider.Parent = SliderHolder
CallSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CallSlider.BackgroundTransparency = 1.000
CallSlider.Size = UDim2.new(0, 100, 0, 10)
CallSlider.ZIndex = 3
CallSlider.Font = Enum.Font.SourceSans
CallSlider.Text = "Library By Tokio"
CallSlider.TextColor3 = Color3.fromRGB(0, 0, 0)
CallSlider.TextSize = 14.000
CallSlider.TextTransparency = 1.000

SideButtonsHolder.Name = "SideButtonsHolder"
SideButtonsHolder.Parent = Base
SideButtonsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SideButtonsHolder.BackgroundTransparency = 1.000
SideButtonsHolder.Position = UDim2.new(0.0274999999, 0, 0.879000008, 0)
SideButtonsHolder.Size = UDim2.new(0, 100, 0, 25)
SideButtonsHolder.ZIndex = 2

Settings.Name = "Settings"
Settings.Parent = SideButtonsHolder
Settings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Settings.BackgroundTransparency = 1.000
Settings.Size = UDim2.new(0, 17, 0, 17)
Settings.Image = "http://www.roblox.com/asset/?id=6031280882"

Executor.Name = "Executor"
Executor.Parent = SideButtonsHolder
Executor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Executor.BackgroundTransparency = 1.000
Executor.Position = UDim2.new(0.25, 0, 0, 0)
Executor.Size = UDim2.new(0, 17, 0, 17)
Executor.Image = "http://www.roblox.com/asset/?id=6034789874"

Discord.Name = "Discord"
Discord.Parent = SideButtonsHolder
Discord.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Discord.BackgroundTransparency = 1.000
Discord.Position = UDim2.new(0.5, 0, 0, 0)
Discord.Size = UDim2.new(0, 17, 0, 17)
Discord.Image = "http://www.roblox.com/asset/?id=6031289449"

-- Scripts:

local function QQSXUY_fake_script() -- CallToggle.LocalScript 
	local script = Instance.new('LocalScript', CallToggle)

	local open = "{0.538, 0},{0.063, 0}"
	local closed = "{0.005, 0},{0.063, 0}"
end
coroutine.wrap(QQSXUY_fake_script)()
local function CFWZTS_fake_script() -- Settings.Rotate 
	local script = Instance.new('LocalScript', Settings)

	local enter = false
	script.Parent.MouseEnter:Connect(function()
		enter = true
	end)
	script.Parent.MouseLeave:Connect(function()
		enter = false
		repeat
			task.wait()
			script.Parent.Rotation = 0
		until
			script.Parent.Rotation == 0
	end)
	coroutine.wrap(function()
		while task.wait(.01) do
			if enter then
				script.Parent.Rotation = script.Parent.Rotation + 1
			end
		end
	end)()
end
coroutine.wrap(CFWZTS_fake_script)()

getgenv().azuconsole = {Block = false,console = {}}
getgenv().__UI__ = {
	["#DebugMode"]    = true,
	["#ClickSoundID"] = "rbxassetid://876939830",
    ["#Discord"]      = "https://dsc.gg/azteam",
	["#Executor"]     = syn and not is_sirhurt_closure and not pebc_execute and"Synapse X"or secure_load and"Sentinel"or is_sirhurt_closure and"Sirhurt"or pebc_execute and"ProtoSmasher"or OXYGEN_LOADED and"Oxygen U"or KRNL_LOADED and"Krnl"or WrapGlobal and"WeAreDevs"or isvm and"Proxo"or shadow_env and"Shadow"or jit and"EasyExploits"or getscriptenvs and"Calamari"or unit and not syn and"Unit"or IsElectron and"Electron"or getexecutorname()and not fluxus and"Scriptware"or fluxus and"Fluxus"or identifyexecutor()and"Arceus X"or"None",
	["#File"]         = "__ConfigUI__.json"
}



function __UI__:Notification(a)if shared.settings_azurite then if shared.settings_azurite.notifications==true then pcall(function()game.StarterGui:SetCore("SendNotification",{Title="Azurite",Text=tostring(a),Icon="rbxthumb://type=Asset&id=10912483183&w=150&h=150",Duration=5})end)end end end
function __UI__:GetTime()local a=os.date("*t")["hour"]local b=os.date("*t")if a<12 or a==24 then return("%02d:%02d"):format((b.hour%24-1)%12+1,b.min)..'AM'else return("%02d:%02d"):format((b.hour%24-1)%12+1,b.min)..'PM'end end
function __UI__:FileTime()local a=os.date("*t")["hour"]local b=os.date("*t")if a<12 or a==24 then return("%02d_%02d"):format((b.hour%24-1)%12+1,b.min)..'AM'else return("%02d_%02d"):format((b.hour%24-1)%12+1,b.min)..'PM'end end
function __UI__:Copy(a)local b=setclipboard or toclipboard or set_clipboard or Clipboard and Clipboard.set;if b~=nil then b(tostring(a))__UI__:Notification("Copied to clipboard")else __UI__:Notification("Your Exploit Doesn't Support Clipboard")game.StarterGui:SetCore("SendNotification",{Title="Azurite",Text="Copy This : "..tostring(a),Icon="rbxthumb://type=Asset&id=10912483183&w=150&h=150",Duration=10000})end end
function __UI__:BooleanToString(_s)
	if string.find(_s,"false") ~= nil then
		return false
	elseif string.find(_s,"true") ~= nil then
		return true
	else
		return error('Convert Boolean')
	end
end

function __UI__:Main()
end
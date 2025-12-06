getgenv().__UI__ = {
	["#DebugMode"]    = true,
	["#ClickSoundID"] = "rbxassetid://876939830",
    ["#Discord"]      = "https://dsc.gg/azteam",
	["#File"]         = "__ConfigUI__.json",
	["#WaterMark"]    = "Made By Tokio"
}

function __UI__:Notification(a)if shared.settings_azurite then if shared.settings_azurite.notifications==true then pcall(function()game.StarterGui:SetCore("SendNotification",{Title="Azurite",Text=tostring(a),Icon="rbxthumb://type=Asset&id=10912483183&w=150&h=150",Duration=5})end)end end end
function __UI__:GetTime()local a=os.date("*t")["hour"]local b=os.date("*t")if a<12 or a==24 then return("%02d:%02d"):format((b.hour%24-1)%12+1,b.min)..'AM'else return("%02d:%02d"):format((b.hour%24-1)%12+1,b.min)..'PM'end end
function __UI__:FileTime()local a=os.date("*t")["hour"]local b=os.date("*t")if a<12 or a==24 then return("%02d_%02d"):format((b.hour%24-1)%12+1,b.min)..'AM'else return("%02d_%02d"):format((b.hour%24-1)%12+1,b.min)..'PM'end end
function __UI__:Copy(a)local b=setclipboard or toclipboard or set_clipboard or Clipboard and Clipboard.set;if b~=nil then b(tostring(a))__UI__:Notification("Copied to clipboard")else __UI__:Notification("Your Exploit Doesn't Support Clipboard")game.StarterGui:SetCore("SendNotification",{Title="Azurite",Text="Copy This : "..tostring(a),Icon="rbxthumb://type=Asset&id=10912483183&w=150&h=150",Duration=10000})end end
function __UI__:BooleanToString(_s) if string.find(_s,"false") ~= nil then return false elseif string.find(_s,"true") ~= nil then return true else return error('Convert Boolean -> '..tostring(_s)) end end


function __UI__:Page()
	_G.AzuriteUISettings = {}

	Players = game:GetService('Players')
	TS = game:GetService('TweenService')
	LP = Players.LocalPlayer

	local Counts = {
		Category = 0
	}
	local ElementsHolder = {
		Import = true,
		IsThereFile = false,

		Load = {},
		IsLoadingElement = false,
		IsReplacingValue = false,
		Count = 0
	}
	local Main = {

		__Deleted__ = false,
		__Mouse__   = LP:GetMouse(),
		__Init__    = Instance.new("ScreenGui"),

		UICorner_1 = Instance.new("UICorner"),
		UICorner_2 = Instance.new("UICorner"),
		UICorner_13 = Instance.new("UICorner"),
		UICorner_14 = Instance.new("UICorner"),

		UIGradient = Instance.new("UIGradient"),

		UIListLayout_1 = Instance.new("UIListLayout"),
		UIListLayout_2 = Instance.new("UIListLayout"),
		UIListLayout_3 = Instance.new("UIListLayout"),

		Base = Instance.new("Frame"),
		TopHolder = Instance.new("Frame"),
		BackCornerHolder = Instance.new("Frame"),
		CloseButton = Instance.new("ImageButton"),
		Logo = Instance.new("ImageLabel"),
		TextLabel = Instance.new("TextLabel"),
		Frame = Instance.new("Frame"),
		
		ShadowHolder = Instance.new("Frame"),
		Shadow = Instance.new("ImageLabel"),
		SideHolder = Instance.new("Frame"),
		
		Title = Instance.new("TextLabel"),
		Title_2 = Instance.new("TextLabel"),
		Title_3 = Instance.new("TextLabel"),
		ElementsHolder = Instance.new("ScrollingFrame"),
		Elements = Instance.new("TextLabel"),

		TogglesHolder = Instance.new("ScrollingFrame"),
		Toggles = Instance.new("TextLabel"),
		SideButtonsHolder = Instance.new("Frame"),
		Settings = Instance.new("ImageButton"),
		Executor = Instance.new("ImageButton"),
		Discord = Instance.new("ImageButton"),
		SettingsHolder = Instance.new("Frame"),
		ShadowHolder_2 = Instance.new("Frame"),
		Shadow_2 = Instance.new("ImageLabel"),
		Title_4 = Instance.new("TextLabel"),
		LocalPlayerIcon = Instance.new("ImageLabel")
	}

	_G.ccc_ccc_ccc_ccc_ccc = {}

	function __UI__._Debug(a) if __UI__["#DebugMode"] then print(a) end end

	function __UI__.CloseCategory(ElementsPath) Main.Elements.Visible=false for _, __ in pairs(ElementsPath:GetChildren())do if not __:IsA("UIListLayout")then __.Visible=false end end end
	function __UI__.FixCanvas(a) local b=2 for _, __ in next, a:GetChildren() do b=b+0.25 end Main.ElementsHolder.CanvasSize=UDim2.new(0,0,b,0) end
	function __UI__.OpenCategory(ElementsPath) for _, __ in pairs(ElementsPath:GetChildren())do if not __:IsA("UIListLayout")then __.Visible=true end end Main.Elements.Visible=true end
	function __UI__.ProtectGui(Gui) if __UI__["#DebugMode"] == false then if get_hidden_gui or gethui then local a=get_hidden_gui or gethui Gui.Parent=a() elseif not is_sirhurt_closure and(syn and syn.protect_gui)then syn.protect_gui(Gui) else Gui.Parent=game.CoreGui end else Gui.Parent=game.CoreGui end end
	function __UI__.RandomName(Origin) if __UI__["#DebugMode"] == true then return Origin else return tostring(math.random(1234567890)) end end
	function __UI__.OpenToggle(a)game:GetService("TweenService"):Create(a,TweenInfo.new(.5),{Position=UDim2.new(0.538, 0,0.063, 0)}):Play()end
	function __UI__.CloseToggle(a)game:GetService("TweenService"):Create(a,TweenInfo.new(.5),{Position=UDim2.new(0.005, 0,0.063, 0)}):Play()end

	function __UI__.AddElementToLoad(element) 
		if (writefile and readfile and isfile) then 
			--[[ __UI__._Debug('Element | '..element) ]] 
			if isfile(__UI__["#File"]) then
				if ElementsHolder.Count == 0 then
					writefile(__UI__["#File"],element.."\n") 
				else
					writefile(__UI__["#File"],readfile(__UI__["#File"])..element.."\n")
				end
			else 
				writefile(__UI__["#File"],element.."\n") 
			end 
		end
		ElementsHolder.Count = ElementsHolder.Count + 1
		table.insert(ElementsHolder.Load,element) 
	end
	function __UI__.RemoveElementToLoad(element) table.remove(ElementsHolder.Load,table.find(ElementsHolder.Load,element)) end
	function __UI__.ReturnConfig(ElementID, OriginValue)
		repeat task.wait() until ElementsHolder.IsLoadingElement == false 
		if ElementsHolder.Import == true then 
			ElementsHolder.IsLoadingElement = true 
			if (readfile and isfile) then 
				if ElementsHolder.IsThereFile == true then 
					local file = readfile(__UI__["#File"]) 
					local lines = {} 
					for _ in file:gmatch("[^\n]+") do 
						table.insert(lines,_) 
					end 
					for _, __ in next, lines do 
						if string.find(__, ElementID) then 
							___ = string.split(__,"|") 
							local Element = tostring(___[#___]) 
							if string.find(___[2],"Toggle") ~= nil then 
								ElementsHolder.IsLoadingElement = false 
								return __UI__:BooleanToString(Element) 
							elseif string.find(___[2],"TextBox") ~= nil then 
								ElementsHolder.IsLoadingElement = false 
								return string.gsub(Element, "^%s+", "") 
							elseif string.find(___[2],"Slider") ~= nil then 
								ElementsHolder.IsLoadingElement = false 
								return tonumber(Element) 
							else 
								ElementsHolder.IsLoadingElement = false 
								__UI__._Debug('element table | Not Found '..tostring(___[2])..' | func : ReturnConfig') 
								return OriginValue 
							end 
						end 
					end 
				else 
					ElementsHolder.IsLoadingElement = false 
					return OriginValue 
				end 
			else 
				ElementsHolder.IsLoadingElement = false 
				return OriginValue 
			end 
		else 
			ElementsHolder.IsLoadingElement = false 
			return OriginValue 
		end 
	end
	function __UI__.AddConfig(elementID, value) local foundIndex = nil for i, v in ipairs(_G.ccc_ccc_ccc_ccc_ccc) do if #_G.ccc_ccc_ccc_ccc_ccc ~= 0 then if string.match(v[1], elementID) then foundIndex = i break end end end if foundIndex then local ovalue = _G.ccc_ccc_ccc_ccc_ccc[foundIndex][2] _G.ccc_ccc_ccc_ccc_ccc[foundIndex] = {elementID,value} else table.insert(_G.ccc_ccc_ccc_ccc_ccc, {elementID,value}) end end
	function __UI__.ReplaceValue(OldElementID, NewElementID) repeat task.wait() until ElementsHolder.IsReplacingValue == false if ElementsHolder.Import == true and ElementsHolder.IsReplacingValue == false then ElementsHolder.IsReplacingValue = true if (readfile and isfile) then if ElementsHolder.IsThereFile == true then local file = readfile(__UI__["#File"]) local lines = {} for line in file:gmatch("[^\n]+") do local find = string.find(line, OldElementID) local l = line if find then l = NewElementID end table.insert(lines, l) end UWU = table.concat(lines, "\n") if (writefile and readfile and isfile) then __UI__._Debug(tostring(__UI__["#File"])..' | Saved Config') writefile(__UI__["#File"],UWU) ElementsHolder.IsReplacingValue = false end end end end end
	

	if not isfile then __UI__._Debug(tostring(__UI__["#File"])..' | Incompatible exploit < isfile') end
	if not readfile then __UI__._Debug(tostring(__UI__["#File"])..' | Incompatible exploit < readfile') end
	if not writefile then __UI__._Debug(tostring(__UI__["#File"])..' | Incompatible exploit < writefile') end

	if (readfile and isfile) then 
		if isfile(__UI__["#File"]) then
			__UI__._Debug(tostring(__UI__["#File"])..' | isfile [TRUE]') 
			ElementsHolder.IsThereFile = true
		else
			__UI__._Debug(tostring(__UI__["#File"])..' | isfile [FALSE]') 
			ElementsHolder.IsThereFile = false
		end
	end

	Main['__Init__'].Name = __UI__.RandomName("__Init__")
	__UI__.ProtectGui(Main['__Init__'])
	Main['__Init__'].ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Base.Name = __UI__.RandomName("Base")
	Main.Base.Parent = Main['__Init__']
	Main.Base.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Main.Base.Position = UDim2.new(0.162565947, 0, 0.27439025, 0)
	Main.Base.Size = UDim2.new(0, 550, 0, 330)
	Main.Base.Visible = false
	Main.Base.Selectable = true
	Main.Base.Active = true
	Main.Base.Draggable = true


	Main.UICorner_1.Parent = Main.Base

	-----------------

	Main.TopHolder.Name = __UI__.RandomName("TopHolder")
	Main.TopHolder.Parent = Main.Base
	Main.TopHolder.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	Main.TopHolder.BorderSizePixel = 0
	Main.TopHolder.Size = UDim2.new(0, 550, 0, 40)
	Main.TopHolder.ZIndex = 2

	Main.UICorner_2.Parent = Main.TopHolder

	Main.BackCornerHolder.Name = __UI__.RandomName("BackCornerHolder")
	Main.BackCornerHolder.Parent = Main.TopHolder
	Main.BackCornerHolder.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	Main.BackCornerHolder.BorderSizePixel = 0
	Main.BackCornerHolder.Position = UDim2.new(0, 0, 0.5, 0)
	Main.BackCornerHolder.Size = UDim2.new(0, 550, 0, 15)

	Main.CloseButton.Name = __UI__.RandomName("CloseButton")
	Main.CloseButton.Parent = Main.TopHolder
	Main.CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.CloseButton.BackgroundTransparency = 1.000
	Main.CloseButton.Position = UDim2.new(0.941818178, 0, 0.0749999955, 0)
	Main.CloseButton.Size = UDim2.new(0, 32, 0, 32)
	Main.CloseButton.ZIndex = 2
	Main.CloseButton.Image = "http://www.roblox.com/asset/?id=6035047409"
	Main.CloseButton.MouseButton1Click:Connect(function() Main['__Init__']:Destroy() end)

	Main.Logo.Name = __UI__.RandomName("Logo")
	Main.Logo.Parent = Main.TopHolder
	Main.Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.Logo.BackgroundTransparency = 1.000
	Main.Logo.Position = UDim2.new(0.0127272727, 0, 4.47034836e-08, 0)
	Main.Logo.Size = UDim2.new(0, 35, 0, 35)
	Main.Logo.ZIndex = 2
	Main.Logo.Image = "rbxassetid://10951993034" -- Azurite Logo

	Main.TextLabel.Name = __UI__.RandomName("Title")
	Main.TextLabel.Parent = Main.Logo
	Main.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.TextLabel.BackgroundTransparency = 1.000
	Main.TextLabel.Position = UDim2.new(1, 0, 0.270000011, 0)
	Main.TextLabel.Size = UDim2.new(0, 200, 0, 20)
	Main.TextLabel.ZIndex = 2
	Main.TextLabel.Font = Enum.Font.GothamMedium
	Main.TextLabel.Text = "Azurite"
	Main.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	Main.TextLabel.TextSize = 19.000
	Main.TextLabel.TextWrapped = true
	Main.TextLabel.TextXAlignment = Enum.TextXAlignment.Left

	Main.Frame.Parent = Main.TopHolder
	Main.Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.Frame.BorderSizePixel = 0
	Main.Frame.Position = UDim2.new(0.0199999996, 0, 0.774999976, 0)
	Main.Frame.Size = UDim2.new(0, 100, 0, 1)
	Main.Frame.ZIndex = 2

	Main.UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(21, 21, 21)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(21, 21, 21))}
	Main.UIGradient.Parent = Main.Frame

	-----------------

	Main.ShadowHolder.Name = __UI__.RandomName("ShadowHolder")
	Main.ShadowHolder.Parent = Main.Base
	Main.ShadowHolder.BackgroundTransparency = 1.000
	Main.ShadowHolder.Size = UDim2.new(1, 0, 1, 0)

	Main.Shadow.Name = __UI__.RandomName("Shadow")
	Main.Shadow.Parent = Main.ShadowHolder
	Main.Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.Shadow.BackgroundTransparency = 1.000
	Main.Shadow.Position = UDim2.new(0.49818182, 1, 0.4909091, 3)
	Main.Shadow.Size = UDim2.new(1, 145, 1, 145)
	Main.Shadow.ZIndex = -5
	Main.Shadow.Image = "rbxassetid://12817494724"
	Main.Shadow.ImageTransparency = 0.700
	Main.Shadow.ScaleType = Enum.ScaleType.Slice
	Main.Shadow.SliceCenter = Rect.new(85, 85, 427, 427)

	-----------------

	Main.SideHolder.Name = __UI__.RandomName("SideHolder")
	Main.SideHolder.Parent = Main.Base
	Main.SideHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.SideHolder.BackgroundTransparency = 1.000
	Main.SideHolder.Position = UDim2.new(0.0327272713, 0, 0.151515156, 0)
	Main.SideHolder.Size = UDim2.new(0, 89, 0, 235)

	Main.UIListLayout_1.Parent = Main.SideHolder
	Main.UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
	Main.UIListLayout_1.Padding = UDim.new(0, 15)

	-----------------

	Main.ElementsHolder.Name = __UI__.RandomName("ElementsHolder")
	Main.ElementsHolder.Parent = Main.Base
	Main.ElementsHolder.Active = true
	Main.ElementsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.ElementsHolder.BackgroundTransparency = 1.000
	Main.ElementsHolder.BorderSizePixel = 0
	Main.ElementsHolder.Position = UDim2.new(0.216363639, 0, 0.121212125, 0)
	Main.ElementsHolder.Size = UDim2.new(0, 425, 0, 290)
	Main.ElementsHolder.ZIndex = 2
	Main.ElementsHolder.CanvasSize = UDim2.new(0, 0, 10, 0)
	Main.ElementsHolder.ScrollBarThickness = 0

	Main.Elements.Name = __UI__.RandomName("Elements")
	Main.Elements.Parent = Main.ElementsHolder
	Main.Elements.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.Elements.BackgroundTransparency = 1.000
	Main.Elements.Size = UDim2.new(0, 1, 0, 1)
	Main.Elements.Font = Enum.Font.SourceSans
	Main.Elements.Text = __UI__["#WaterMark"]
	Main.Elements.TextColor3 = Color3.fromRGB(0, 0, 0)
	Main.Elements.TextSize = 14.000
	Main.Elements.TextTransparency = 1.000

	-----------------

	Main.SettingsHolder.Name = __UI__.RandomName("SettingsHolder")
	Main.SettingsHolder.Parent = Main.Base
	Main.SettingsHolder.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.SettingsHolder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Main.SettingsHolder.BackgroundTransparency = 0.700
	Main.SettingsHolder.Position = UDim2.new(1.23272729, 0, 0.5, 0)
	Main.SettingsHolder.ZIndex = 3
	Main.SettingsHolder.Visible = false
	Main.SettingsHolder.Size = UDim2.new(0, 1,0, 1)

	Main.UICorner_13.Parent = Main.SettingsHolder

	Main.ShadowHolder_2.Name = __UI__.RandomName("ShadowHolder")
	Main.ShadowHolder_2.Parent = Main.SettingsHolder
	Main.ShadowHolder_2.BackgroundTransparency = 1.000
	Main.ShadowHolder_2.Size = UDim2.new(1, 0, 1, 0)

	Main.Shadow_2.Name = __UI__.RandomName("Shadow")
	Main.Shadow_2.Parent = Main.ShadowHolder_2
	Main.Shadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.Shadow_2.BackgroundTransparency = 1.000
	Main.Shadow_2.Position = UDim2.new(0.5, 1, 0.5, 1)
	Main.Shadow_2.Size = UDim2.new(1, 145, 1, 145)
	Main.Shadow_2.ZIndex = -5
	Main.Shadow_2.Image = "rbxassetid://12817494724"
	Main.Shadow_2.ImageTransparency = 0.300
	Main.Shadow_2.ScaleType = Enum.ScaleType.Slice
	Main.Shadow_2.SliceCenter = Rect.new(85, 85, 427, 427)

	Main.Title_4.Name = __UI__.RandomName("Title")
	Main.Title_4.Parent = Main.SettingsHolder
	Main.Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.Title_4.BackgroundTransparency = 1.000
	Main.Title_4.Position = UDim2.new(0.204255313, 0, 0, 0)
	Main.Title_4.Size = UDim2.new(0, 100, 0, 50)
	Main.Title_4.Font = Enum.Font.GothamBold
	Main.Title_4.Text = "Settings"
	Main.Title_4.TextColor3 = Color3.fromRGB(255, 255, 255)
	Main.Title_4.TextSize = 20.000
	Main.Title_4.TextStrokeTransparency = 0.000
	Main.Title_4.TextWrapped = true
	Main.Title_4.TextXAlignment = Enum.TextXAlignment.Left

	Main.LocalPlayerIcon.Name = __UI__.RandomName("LocalPlayerIcon")
	Main.LocalPlayerIcon.Parent = Main.Title_4
	Main.LocalPlayerIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.LocalPlayerIcon.BackgroundTransparency = 1.000
	Main.LocalPlayerIcon.Position = UDim2.new(-0.379999965, 0, 0.200000003, 0)
	Main.LocalPlayerIcon.Size = UDim2.new(0, 30, 0, 30)
	Main.LocalPlayerIcon.Image = Players:GetUserThumbnailAsync(LP.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)

	Main.UICorner_14.CornerRadius = UDim.new(0, 100)
	Main.UICorner_14.Parent = Main.LocalPlayerIcon

	Main.TogglesHolder.Name = __UI__.RandomName("TogglesHolder")
	Main.TogglesHolder.Parent = Main.SettingsHolder
	Main.TogglesHolder.Active = true
	Main.TogglesHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.TogglesHolder.BackgroundTransparency = 1.000
	Main.TogglesHolder.Position = UDim2.new(0.0425531901, 0, 0.173333332, 0)
	Main.TogglesHolder.Size = UDim2.new(0, 225, 0, 240)
	Main.TogglesHolder.ScrollBarThickness = 0

	Main.Toggles.Name = __UI__.RandomName("Toggles")
	Main.Toggles.Parent = Main.TogglesHolder
	Main.Toggles.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.Toggles.BackgroundTransparency = 1.000
	Main.Toggles.Size = UDim2.new(0, 1, 0, 1)
	Main.Toggles.Font = Enum.Font.SourceSans
	Main.Toggles.Text = __UI__["#WaterMark"]
	Main.Toggles.TextColor3 = Color3.fromRGB(0, 0, 0)
	Main.Toggles.TextSize = 14.000
	Main.Toggles.TextTransparency = 1.000

	Main.UIListLayout_3.Parent = Main.Toggles
	Main.UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
	Main.UIListLayout_3.Padding = UDim.new(4, 0)

	-----------------

	Main.SideButtonsHolder.Name = __UI__.RandomName("SideButtonsHolder")
	Main.SideButtonsHolder.Parent = Main.Base
	Main.SideButtonsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.SideButtonsHolder.BackgroundTransparency = 1.000
	Main.SideButtonsHolder.Position = UDim2.new(0.0274999999, 0, 0.879000008, 0)
	Main.SideButtonsHolder.Size = UDim2.new(0, 100, 0, 25)
	Main.SideButtonsHolder.ZIndex = 2

	local _________Settings = {
		Enter = false,
		Open = false,
		Call = false
	}

	coroutine.wrap(function() while task.wait(.01) do if Main['__Deleted__'] == true then break end if _________Settings.Enter == false then Main.Settings.Rotation = Main.Settings.Rotation + 1 end end end)()

	Main.Settings.Name = __UI__.RandomName("Settings")
	Main.Settings.Parent = Main.SideButtonsHolder
	Main.Settings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.Settings.BackgroundTransparency = 1.000
	Main.Settings.Size = UDim2.new(0, 17, 0, 17)
	Main.Settings.Image = "http://www.roblox.com/asset/?id=6031280882"
	Main.Settings.MouseEnter:Connect(function() _________Settings.Enter = true repeat task.wait() Main.Settings.Rotation = 0 until Main.Settings.Rotation == 0 end)
	Main.Settings.MouseLeave:Connect(function() _________Settings.Enter = false end)
	function __UI__.TweenSetTransparency(Time,Transparency, Holder)
		TS:Create(Main.Title_4, TweenInfo.new(Time), {TextTransparency=Transparency, TextStrokeTransparency=Transparency}):Play()
		TS:Create(Main.LocalPlayerIcon, TweenInfo.new(Time), {ImageTransparency=Transparency}):Play()
		for _, toggles in pairs(Main.Toggles:GetChildren()) do
			for __, v in pairs(toggles:GetDescendants()) do
				if v:IsA('TextLabel') then
					TS:Create(v, TweenInfo.new(Time), {TextTransparency=Transparency, TextStrokeTransparency=Transparency}):Play()
				elseif v:IsA('TextButton') or v:IsA('Frame') then
					TS:Create(v, TweenInfo.new(Time), {BackgroundTransparency=Transparency}):Play()
				end
			end
		end
	end
	function __UI__.SetTransparency(Transparency, Holder)
		Main.Title_4.TextTransparency = Transparency
		Main.Title_4.TextStrokeTransparency = Transparency
		Main.LocalPlayerIcon.ImageTransparency = Transparency
		for _, toggles in pairs(Main.Toggles:GetChildren()) do
			for __, v in pairs(toggles:GetDescendants()) do
				if v:IsA('TextLabel') then
					v.TextTransparency = Transparency
					v.TextStrokeTransparency = Transparency
				elseif v:IsA('TextButton') or v:IsA('Frame') then
					v.BackgroundTransparency = Transparency
				end
			end
		end
	end
	Main.Settings.MouseButton1Click:Connect(function()
		Main.Settings.MouseButton1Click:Connect(function()
			if _________Settings.Call == false then
				_________Settings.Call = true
				if _________Settings.Open == true then
					__UI__.TweenSetTransparency(.5,1,Main.SettingsHolder)
					wait(.5)
					TS:Create(Main.SettingsHolder, TweenInfo.new(.5), {Size=UDim2.new(0, 1, 0, 1)}):Play()
					TS:Create(Main.Shadow_2, TweenInfo.new(.5), {ImageTransparency=1}):Play()
					wait(.5)
					Main.SettingsHolder.Visible = false
					_________Settings.Open = not _________Settings.Open
				else
					__UI__.SetTransparency(1, Main.SettingsHolder)
					Main.SettingsHolder.Visible = true
					TS:Create(Main.SettingsHolder, TweenInfo.new(.5), {Size=UDim2.new(0, 235, 0, 300)}):Play()
					TS:Create(Main.Shadow_2, TweenInfo.new(.5), {ImageTransparency=.3}):Play()
					wait(.5)
					__UI__.TweenSetTransparency(.5,0,Main.SettingsHolder)
					_________Settings.Open = not _________Settings.Open
				end
				_________Settings.Call = false
			end
		end)
	end)

	Main.Executor.Name = __UI__.RandomName("Executor")
	Main.Executor.Parent = Main.SideButtonsHolder
	Main.Executor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.Executor.BackgroundTransparency = 1.000
	Main.Executor.Position = UDim2.new(0.25, 0, 0, 0)
	Main.Executor.Size = UDim2.new(0, 17, 0, 17)
	Main.Executor.Image = "http://www.roblox.com/asset/?id=6034789874"
	Main.Executor.MouseButton1Click:Connect(function()
		exploit = syn and not is_sirhurt_closure and not pebc_execute and"Synapse X"or secure_load and"Sentinel"or is_sirhurt_closure and"Sirhurt"or pebc_execute and"ProtoSmasher"or OXYGEN_LOADED and"Oxygen U"or KRNL_LOADED and"Krnl"or WrapGlobal and"WeAreDevs"or isvm and"Proxo"or shadow_env and"Shadow"or jit and"EasyExploits"or getscriptenvs and"Calamari"or unit and not syn and"Unit"or IsElectron and"Electron"or getexecutorname()and not fluxus and"Scriptware"or fluxus and"Fluxus"or identifyexecutor()and"Arceus X"or"None",
		__UI__:Copy(tostring(exploit))
	end)

	Main.Discord.Name = __UI__.RandomName("Discord")
	Main.Discord.Parent = Main.SideButtonsHolder
	Main.Discord.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.Discord.BackgroundTransparency = 1.000
	Main.Discord.Position = UDim2.new(0.5, 0, 0, 0)
	Main.Discord.Size = UDim2.new(0, 17, 0, 17)
	Main.Discord.Image = "http://www.roblox.com/asset/?id=6031289449"
	Main.Discord.MouseButton1Click:Connect(function() __UI__:Copy(__UI__["#Discord"]) end)



	function Main:ToolCrashPage(AmountTools)
		local ToolCrashMain = {
			Stop = false,
			FPSValue = "0",
			PingValue = "0",
			a = Instance.new("ScreenGui"),
			b = Instance.new("Frame"),
			Elements = Instance.new("Frame"),
			Title = Instance.new("TextLabel"),
			DownBar = Instance.new("Frame"),
			Logo = Instance.new("ImageLabel"),
			Tools = Instance.new("TextLabel"),
			Value = Instance.new("TextLabel"),
			DownBar_2 = Instance.new("Frame"),
			Pings = Instance.new("TextLabel"),
			Value_2 = Instance.new("TextLabel"),
			DownBar_3 = Instance.new("Frame"),
			Fps = Instance.new("TextLabel"),
			Value_3 = Instance.new("TextLabel"),
			DownBar_4 = Instance.new("Frame")
		}

		ToolCrashMain.a.Name = __UI__.RandomName("AzuriteToolCrash")
		__UI__.ProtectGui(ToolCrashMain.a)
		ToolCrashMain.a.ZIndexBehavior = __UI__.RandomName(Enum.ZIndexBehavior.Sibling)

		ToolCrashMain.b.Name = "Base"
		ToolCrashMain.b.Parent = ToolCrashMain.a
		ToolCrashMain.b.AnchorPoint = Vector2.new(0.5, 0.5)
		ToolCrashMain.b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		ToolCrashMain.b.Position = UDim2.new(0.5, 0, 0.5, 0)
		ToolCrashMain.b.Size = UDim2.new(5, 100, 5, 100)

		ToolCrashMain.Elements.Name = "Elements"
		ToolCrashMain.Elements.Parent = ToolCrashMain.b
		ToolCrashMain.Elements.AnchorPoint = Vector2.new(0.5, 0.5)
		ToolCrashMain.Elements.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.Elements.BackgroundTransparency = 1.000
		ToolCrashMain.Elements.Position = UDim2.new(0.5, 0, 0.5, 0)
		ToolCrashMain.Elements.Size = UDim2.new(0, 100, 0, 100)

		ToolCrashMain.Title.Name = "Title"
		ToolCrashMain.Title.Parent = ToolCrashMain.Elements
		ToolCrashMain.Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.Title.BackgroundTransparency = 1.000
		ToolCrashMain.Title.Position = UDim2.new(-0.5, 0, -2.93000031, 0)
		ToolCrashMain.Title.Size = UDim2.new(0, 200, 0, 75)
		ToolCrashMain.Title.Font = Enum.Font.Unknown
		ToolCrashMain.Title.Text = "Azurite"
		ToolCrashMain.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.Title.TextSize = 57.000

		ToolCrashMain.DownBar.Name = "DownBar"
		ToolCrashMain.DownBar.Parent = ToolCrashMain.Title
		ToolCrashMain.DownBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.DownBar.BackgroundTransparency = 0.650
		ToolCrashMain.DownBar.BorderSizePixel = 0
		ToolCrashMain.DownBar.Position = UDim2.new(-0.449999988, 0, 1.28000009, 0)
		ToolCrashMain.DownBar.Size = UDim2.new(0, 380, 0, 4)

		ToolCrashMain.Logo.Name = "Logo"
		ToolCrashMain.Logo.Parent = ToolCrashMain.Title
		ToolCrashMain.Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.Logo.BackgroundTransparency = 1.000
		ToolCrashMain.Logo.Position = UDim2.new(1.07499993, 0, 0.160000011, 0)
		ToolCrashMain.Logo.Size = UDim2.new(0, 50, 0, 50)
		ToolCrashMain.Logo.Image = "rbxassetid://10951993034"

		ToolCrashMain.Tools.Name = "Tools"
		ToolCrashMain.Tools.Parent = ToolCrashMain.Elements
		ToolCrashMain.Tools.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.Tools.BackgroundTransparency = 1.000
		ToolCrashMain.Tools.Position = UDim2.new(-1.39999998, 0, -1.49000001, 0)
		ToolCrashMain.Tools.Size = UDim2.new(0, 100, 0, 50)
		ToolCrashMain.Tools.Font = Enum.Font.Gotham
		ToolCrashMain.Tools.Text = "Tools"
		ToolCrashMain.Tools.TextColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.Tools.TextSize = 20.000

		ToolCrashMain.Value.Name = "Value"
		ToolCrashMain.Value.Parent = ToolCrashMain.Tools
		ToolCrashMain.Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.Value.BackgroundTransparency = 1.000
		ToolCrashMain.Value.Position = UDim2.new(0.0808694512, 0, 1, 0)
		ToolCrashMain.Value.Size = UDim2.new(0, 80, 0, 40)
		ToolCrashMain.Value.Font = Enum.Font.Unknown
		ToolCrashMain.Value.Text = "2500"
		ToolCrashMain.Value.TextColor3 = Color3.fromRGB(150, 150, 150)
		ToolCrashMain.Value.TextSize = 14.000

		ToolCrashMain.DownBar_2.Name = "DownBar"
		ToolCrashMain.DownBar_2.Parent = ToolCrashMain.Tools
		ToolCrashMain.DownBar_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.DownBar_2.BackgroundTransparency = 0.650
		ToolCrashMain.DownBar_2.BorderSizePixel = 0
		ToolCrashMain.DownBar_2.Position = UDim2.new(0.114347756, 0, 0.820000052, 0)
		ToolCrashMain.DownBar_2.Size = UDim2.new(0, 75, 0, 1)

		ToolCrashMain.Pings.Name = "Pings"
		ToolCrashMain.Pings.Parent = ToolCrashMain.Elements
		ToolCrashMain.Pings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.Pings.BackgroundTransparency = 1.000
		ToolCrashMain.Pings.Position = UDim2.new(7.4505806e-08, 0, -1.49000001, 0)
		ToolCrashMain.Pings.Size = UDim2.new(0, 100, 0, 50)
		ToolCrashMain.Pings.Font = Enum.Font.Gotham
		ToolCrashMain.Pings.Text = "Pings"
		ToolCrashMain.Pings.TextColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.Pings.TextSize = 20.000

		ToolCrashMain.Value_2.Name = "Value"
		ToolCrashMain.Value_2.Parent = ToolCrashMain.Pings
		ToolCrashMain.Value_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.Value_2.BackgroundTransparency = 1.000
		ToolCrashMain.Value_2.Position = UDim2.new(0.0808694512, 0, 1, 0)
		ToolCrashMain.Value_2.Size = UDim2.new(0, 80, 0, 40)
		ToolCrashMain.Value_2.Font = Enum.Font.Unknown
		ToolCrashMain.Value_2.Text = "120"
		ToolCrashMain.Value_2.TextColor3 = Color3.fromRGB(150, 150, 150)
		ToolCrashMain.Value_2.TextSize = 14.000

		ToolCrashMain.DownBar_3.Name = "DownBar"
		ToolCrashMain.DownBar_3.Parent = ToolCrashMain.Pings
		ToolCrashMain.DownBar_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.DownBar_3.BackgroundTransparency = 0.650
		ToolCrashMain.DownBar_3.BorderSizePixel = 0
		ToolCrashMain.DownBar_3.Position = UDim2.new(0.114347756, 0, 0.820000052, 0)
		ToolCrashMain.DownBar_3.Size = UDim2.new(0, 75, 0, 1)

		ToolCrashMain.Fps.Name = "Fps"
		ToolCrashMain.Fps.Parent = ToolCrashMain.Elements
		ToolCrashMain.Fps.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.Fps.BackgroundTransparency = 1.000
		ToolCrashMain.Fps.Position = UDim2.new(1.4000001, 0, -1.49000001, 0)
		ToolCrashMain.Fps.Size = UDim2.new(0, 100, 0, 50)
		ToolCrashMain.Fps.Font = Enum.Font.Gotham
		ToolCrashMain.Fps.Text = "Fps"
		ToolCrashMain.Fps.TextColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.Fps.TextSize = 20.000

		ToolCrashMain.Value_3.Name = "Value"
		ToolCrashMain.Value_3.Parent = ToolCrashMain.Fps
		ToolCrashMain.Value_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.Value_3.BackgroundTransparency = 1.000
		ToolCrashMain.Value_3.Position = UDim2.new(0.0808694512, 0, 1, 0)
		ToolCrashMain.Value_3.Size = UDim2.new(0, 80, 0, 40)
		ToolCrashMain.Value_3.Font = Enum.Font.Unknown
		ToolCrashMain.Value_3.Text = "240"
		ToolCrashMain.Value_3.TextColor3 = Color3.fromRGB(150, 150, 150)
		ToolCrashMain.Value_3.TextSize = 14.000

		ToolCrashMain.DownBar_4.Name = "DownBar"
		ToolCrashMain.DownBar_4.Parent = ToolCrashMain.Fps
		ToolCrashMain.DownBar_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToolCrashMain.DownBar_4.BackgroundTransparency = 0.650
		ToolCrashMain.DownBar_4.BorderSizePixel = 0
		ToolCrashMain.DownBar_4.Position = UDim2.new(0.114347756, 0, 0.820000052, 0)
		ToolCrashMain.DownBar_4.Size = UDim2.new(0, 75, 0, 1)

		
		c = game.RunService.RenderStepped:Connect(function(frame)
			local camera = game:GetService("Workspace").CurrentCamera
		    camera.CFrame = CFrame.new(99999,99999,99999)
		    camera.Focus = CFrame.new(99999,99999,99999)
		    LP.CameraMaxZoomDistance = 500
		    LP.CameraMinZoomDistance = 0.5
			ToolCrashMain.FPSValue = tostring(math.round(1/frame)) 
			ToolCrashMain.PingValue = tostring(string.split(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(math.round(2/frame)), '.')[1])
		end)
		coroutine.wrap(function() 
			while task.wait() do 
				if ToolCrashMain.Stop == true then 
					break 
				end 
				coroutine.wrap(function() ToolCrashMain.Value_3.Text = ToolCrashMain.FPSValue wait(.1) end)()
				coroutine.wrap(function() ToolCrashMain.Value_2.Text = ToolCrashMain.PingValue wait(1.5) end)()
			end 
		end)()
		-----------------

		function ToolCrashMain:SetTools(number) ToolCrashMain.Value.Text = tostring(number) end
		function ToolCrashMain:Delete() ToolCrashMain.Stop = true c:Disconnect() ToolCrashMain.a:Destroy() end

		return ToolCrashMain
	end

	function Main:UIKey(key)
		local m = {key = key}

		Main['__Mouse__'].KeyDown:Connect(function(_) if _:lower() == m.key then Main.Base.Visible = not Main.Base.Visible end end)

		function m:Set(v) m.key = v end 
		function m:SetKey(k) m.key = k m:Set(k) end

		return m
	end
	function Main:SettingsToggle(__Title__, __Value__, __Call__)
		local ElementID    = '__Settings__ | '..tostring(__Title__)
		local _xET = {
			Call  = __Call__ or function() end,
			Value = __UI__.ReturnConfig(ElementID,__Value__) -- 0xFF
		}
		_G.AzuriteUISettings[tostring(__Title__)] = _xET.Value

		local __BaseNex__ = 'Loading | Toggle   | '..ElementID..' | '
		local __element__ = __BaseNex__..tostring(_xET.Value)

		__UI__.AddElementToLoad(__element__)

		local ToggleSettings = Instance.new("Frame")
		local Title = Instance.new("TextLabel")
		local ToggleHolder_2 = Instance.new("Frame")
		local CallToggle = Instance.new("TextButton")
		local UICorner_1 = Instance.new("UICorner")
		local UICorner_2 = Instance.new("UICorner")


		ToggleSettings.Name = __UI__.RandomName("ToggleSettings")
		ToggleSettings.Parent = Main.Toggles
		ToggleSettings.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		ToggleSettings.BackgroundTransparency = 1.000
		ToggleSettings.Size = UDim2.new(0, 200, 0, 32)

		Title.Name = __UI__.RandomName("Title")
		Title.Parent = ToggleSettings
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(0.075000003, 0, 0, 0)
		Title.Size = UDim2.new(0, 120, 0, 32)
		Title.Font = Enum.Font.Gotham
		Title.Text = __Title__
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 14.000
		Title.TextXAlignment = Enum.TextXAlignment.Left

		ToggleHolder_2.Name = __UI__.RandomName("ToggleHolder")
		ToggleHolder_2.Parent = ToggleSettings
		ToggleHolder_2.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
		ToggleHolder_2.Position = UDim2.new(0.767666638, 0, 0.137999997, 0)
		ToggleHolder_2.Size = UDim2.new(0, 40, 0, 21)
		ToggleHolder_2.ZIndex = 2

		UICorner_1.CornerRadius = UDim.new(0, 100)
		UICorner_1.Parent = ToggleHolder_2

		function _xET:Set(_)
			_xET.Value = _
			_G.AzuriteUISettings[tostring(__Title__)] = _xET.Value

			__element__ = __UI__.AddConfig(__BaseNex__, _)
			if _xET.Value == "" then
				_xET.Value = "None"
			end
			if _xET.Value == true then
				__UI__.OpenToggle(CallToggle)
			else
				__UI__.CloseToggle(CallToggle)
			end
			pcall(_xET.Call,_xET.Value)
		end
		function _xET:Toggle() _xET.Value = not _xET.Value _xET:Set(_xET.Value) end
		function _xET:Reset() _xET:Set(__Value__) end

		CallToggle.Name = __UI__.RandomName("CallToggle")
		CallToggle.Parent = ToggleHolder_2
		CallToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		if _xET.Value == true then
			CallToggle.Position = UDim2.new(0.538, 0,0.063, 0)
		else
			CallToggle.Position = UDim2.new(0.005, 0,0.063, 0)
		end
		CallToggle.Position = UDim2.new(0.00499999989, 0, 0.063000001, 0)
		CallToggle.Size = UDim2.new(0, 18, 0, 18)
		CallToggle.ZIndex = 3
		CallToggle.Font = Enum.Font.SourceSans
		CallToggle.Text = __UI__["#WaterMark"]
		CallToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
		CallToggle.TextSize = 14.000
		CallToggle.TextTransparency = 1.000
		CallToggle.MouseButton1Click:Connect(_xET.Toggle)

		UICorner_2.CornerRadius = UDim.new(0, 100)
		UICorner_2.Parent = CallToggle

		__UI__.RemoveElementToLoad(__element__)

		return _xET
	end
	function Main:Category(CategoryTitle)
		if Counts.Category <= 7 then
			Counts.Category = Counts.Category + 1

			local __Category__ = Instance.new("TextButton")
			local em = {
				UIListLayout = Instance.new("UIListLayout"),

				FolderCategory = Instance.new("Folder")
			}

			__Category__.Name = "Title"
			__Category__.Parent = Main.SideHolder
			__Category__.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			__Category__.BackgroundTransparency = 1.000
			__Category__.Size = UDim2.new(0, 65, 0, 14)
			__Category__.Font = Enum.Font.Gotham
			__Category__.Text = CategoryTitle
			__Category__.TextColor3 = Color3.fromRGB(255, 255, 255)
			__Category__.TextSize = 15.000
			__Category__.TextXAlignment = Enum.TextXAlignment.Left
			__Category__.MouseButton1Click:Connect(function()
				Main.ElementsHolder.CanvasPosition = Vector2.new(0, 0)

				for _, __ in pairs(Main.Elements:GetChildren()) do
					__UI__.CloseCategory(__)
				end
				for _, __ in pairs(Main.Elements:GetChildren()) do
					if __.Name == CategoryTitle then
						__UI__.FixCanvas(__)
						__UI__.OpenCategory(__)
						break
					end
				end
			end)


			em.FolderCategory.Name = CategoryTitle
			em.FolderCategory.Parent = Main.Elements

			em.UIListLayout.Parent = em.FolderCategory
			em.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			em.UIListLayout.Padding = UDim.new(4, 0)

			function em:Label(__Title__)
				local _xET = {
					Value = __Title__
				}
				local __element__ = 'Loading | Label    | '..tostring(CategoryTitle)..' | '..tostring(__Title__)
				__UI__.AddElementToLoad(__element__)

				local Element = Instance.new("Frame")
				local ElementTitle = Instance.new("TextLabel")
				local ElementIcon = Instance.new("ImageLabel")
				local UICorner = Instance.new("UICorner")

				Element.Name = __UI__.RandomName("Element")
				Element.Parent = em.FolderCategory
				Element.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Element.Size = UDim2.new(0, 420, 0, 30)

				UICorner.Parent = Element

				ElementTitle.Name = __UI__.RandomName("ElementTitle")
				ElementTitle.Parent = Element
				ElementTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ElementTitle.BackgroundTransparency = 1.000
				ElementTitle.Position = UDim2.new(0.135714293, 0, -0.0333333351, 0)
				ElementTitle.Size = UDim2.new(0, 110, 0, 30)
				ElementTitle.Font = Enum.Font.Gotham
				ElementTitle.Text = tostring(_xET.Value)
				ElementTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				ElementTitle.TextSize = 14.000
				ElementTitle.TextWrapped = false
				ElementTitle.TextXAlignment = Enum.TextXAlignment.Left

				ElementIcon.Name = __UI__.RandomName("ElementIcon")
				ElementIcon.Parent = Element
				ElementIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ElementIcon.BackgroundTransparency = 1.000
				ElementIcon.Position = UDim2.new(0.0642857179, 0, 0.13333334, 0)
				ElementIcon.Size = UDim2.new(0, 20, 0, 20)
				ElementIcon.Image = "rbxassetid://7743874740"

				function _xET:Reset()
					_xET.Value = ___Title___
					ElementTitle.Text = __Title__
				end
				function _xET:Set(_)
					_xET.Value = _
					ElementTitle.Text = _
				end

				__UI__.RemoveElementToLoad(__element__)

				return _xET
			end
			function em:Button(__Title__, __Call__)
				local _xET = {
					Call = __Call__ or function() end
				}
				local __element__ = 'Loading | Button   | '..tostring(CategoryTitle)..' | '..tostring(__Title__)..' | '..tostring(_xET.Call)
				__UI__.AddElementToLoad(__element__)

				local Element = Instance.new("Frame")
				local ElementTitle = Instance.new("TextLabel")
				local ElementIcon = Instance.new("ImageLabel")
				local CallButton = Instance.new("TextButton")
				local UICorner = Instance.new("UICorner")

				Element.Name = __UI__.RandomName("Element")
				Element.Parent = em.FolderCategory
				Element.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Element.Size = UDim2.new(0, 420, 0, 30)

				UICorner.Parent = Element

				ElementTitle.Name = __UI__.RandomName("ElementTitle")
				ElementTitle.Parent = Element
				ElementTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ElementTitle.BackgroundTransparency = 1.000
				ElementTitle.Position = UDim2.new(0.135714293, 0, -0.0333333351, 0)
				ElementTitle.Size = UDim2.new(0, 110, 0, 30)
				ElementTitle.Font = Enum.Font.Gotham
				ElementTitle.Text = __Title__
				ElementTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				ElementTitle.TextSize = 14.000
				ElementTitle.TextWrapped = false
				ElementTitle.TextXAlignment = Enum.TextXAlignment.Left

				ElementIcon.Name = __UI__.RandomName("ElementIcon")
				ElementIcon.Parent = Element
				ElementIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ElementIcon.BackgroundTransparency = 1.000
				ElementIcon.Position = UDim2.new(0.0642857179, 0, 0.166666672, 0)
				ElementIcon.Size = UDim2.new(0, 20, 0, 20)
				ElementIcon.Image = "rbxassetid://7734010488"

				CallButton.Name = __UI__.RandomName("CallButton")
				CallButton.Parent = Element
				CallButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				CallButton.BackgroundTransparency = 1.000
				CallButton.Size = UDim2.new(0, 420, 0, 30)
				CallButton.ZIndex = 3
				CallButton.Font = Enum.Font.SourceSans
				CallButton.Text = __UI__["#WaterMark"]
				CallButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				CallButton.TextSize = 14.000
				CallButton.TextTransparency = 1.000
				CallButton.MouseButton1Click:Connect(function() _xET.Call() end)

				__UI__.RemoveElementToLoad(__element__)
			end
			function em:Toggle(__Title__, __Value__, __Call__)
				local ElementID    = tostring(CategoryTitle)..' | '..tostring(__Title__)
				local _xET = {
					Call  = __Call__ or function() end,
					Value = __UI__.ReturnConfig(ElementID,__Value__) -- 0x38
				}

				local __BaseNex__ = 'Loading | Toggle   | '..ElementID..' | '
				local __element__ = __BaseNex__..tostring(_xET.Value)
				__UI__.AddElementToLoad(__element__)

				local Element = Instance.new("Frame")
				local ElementTitle = Instance.new("TextLabel")
				local ElementIcon = Instance.new("ImageLabel")
				local ToggleHolder = Instance.new("Frame")
				local CallToggle = Instance.new("TextButton")
				local UICorner_1 = Instance.new("UICorner")
				local UICorner_2 = Instance.new("UICorner")
				local UICorner_3 = Instance.new("UICorner")

				Element.Name = __UI__.RandomName("Element")
				Element.Parent = em.FolderCategory
				Element.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Element.Size = UDim2.new(0, 420, 0, 30)

				UICorner_1.Parent = Element

				ElementTitle.Name = __UI__.RandomName("ElementTitle")
				ElementTitle.Parent = Element
				ElementTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ElementTitle.BackgroundTransparency = 1.000
				ElementTitle.Position = UDim2.new(0.135714293, 0, -0.0333333351, 0)
				ElementTitle.Size = UDim2.new(0, 110, 0, 30)
				ElementTitle.Font = Enum.Font.Gotham
				ElementTitle.Text = __Title__
				ElementTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				ElementTitle.TextSize = 14.000
				ElementTitle.TextWrapped = false
				ElementTitle.TextXAlignment = Enum.TextXAlignment.Left

				ElementIcon.Name = __UI__.RandomName("ElementIcon")
				ElementIcon.Parent = Element
				ElementIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ElementIcon.BackgroundTransparency = 1.000
				ElementIcon.Position = UDim2.new(0.0642857179, 0, 0.13333334, 0)
				ElementIcon.Size = UDim2.new(0, 20, 0, 20)
				ElementIcon.Image = "http://www.roblox.com/asset/?id=6023426929"

				ToggleHolder.Name = __UI__.RandomName("ToggleHolder")
				ToggleHolder.Parent = Element
				ToggleHolder.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
				ToggleHolder.Position = UDim2.new(0.767666638, 0, 0.137999997, 0)
				ToggleHolder.Size = UDim2.new(0, 40, 0, 21)
				ToggleHolder.ZIndex = 2

				UICorner_2.CornerRadius = UDim.new(0, 100)
				UICorner_2.Parent = ToggleHolder

				function _xET:Set(_)
					_xET.Value = _

					__element__ = __UI__.AddConfig(__BaseNex__, _)
					if _xET.Value == "" then
						_xET.Value = "None"
					end
					if _xET.Value == true then
						__UI__.OpenToggle(CallToggle)
					else
						__UI__.CloseToggle(CallToggle)
					end
					pcall(_xET.Call,_xET.Value)
				end
				function _xET:Toggle() _xET.Value = not _xET.Value _xET:Set(_xET.Value) end
				function _xET:Reset() _xET:Set(__Value__) end

				CallToggle.Name = __UI__.RandomName("CallToggle")
				CallToggle.Parent = ToggleHolder
				CallToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				if _xET.Value == true then
					CallToggle.Position = UDim2.new(0.538, 0,0.063, 0)
				else
					print('toggle'..tostring(_xET.Value))
					CallToggle.Position = UDim2.new(0.005, 0,0.063, 0)
				end
				CallToggle.Size = UDim2.new(0, 18, 0, 18)
				CallToggle.ZIndex = 3
				CallToggle.Font = Enum.Font.SourceSans
				CallToggle.Text = __UI__["#WaterMark"]
				CallToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				CallToggle.TextSize = 14.000
				CallToggle.TextTransparency = 1.000
				CallToggle.MouseButton1Click:Connect(_xET.Toggle)

				UICorner_3.CornerRadius = UDim.new(0, 100)
				UICorner_3.Parent = CallToggle


				__UI__.RemoveElementToLoad(__element__)

				return _xET
			end
			function em:TextBox(__Title__, __Value__, __Clear__, __Call__)
				local ElementID    = tostring(CategoryTitle)..' | '..tostring(__Title__)..' | '..tostring(__Clear__)
				local _xET = {
					Call  = __Call__ or function() end,
					Value = __UI__.ReturnConfig(ElementID,__Value__)
				}

				local __BaseNex__ = 'Loading | TextBox  | '..ElementID..' | '
				local __element__ = __BaseNex__..tostring(_xET.Value)
				__UI__.AddElementToLoad(__element__)

				local Element = Instance.new("Frame")
				local ElementTitle = Instance.new("TextLabel")
				local ElementIcon = Instance.new("ImageLabel")
				local CallTextBox = Instance.new("TextBox")
				local UICorner_1 = Instance.new("UICorner")
				local UICorner_2 = Instance.new("UICorner")

				function _xET:Set(_)
					_xET.Value = _
					__element__ = __UI__.AddConfig(__BaseNex__, _)
					if _xET.Value == "" then
						_xET.Value = "None"
					end
					pcall(_xET.Call,_xET.Value)
				end

				Element.Name = __UI__.RandomName("Element")
				Element.Parent = em.FolderCategory
				Element.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Element.Size = UDim2.new(0, 420, 0, 30)

				UICorner_1.Parent = Element

				ElementTitle.Name = __UI__.RandomName("ElementTitle")
				ElementTitle.Parent = Element
				ElementTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ElementTitle.BackgroundTransparency = 1.000
				ElementTitle.Position = UDim2.new(0.135714293, 0, -0.0333333351, 0)
				ElementTitle.Size = UDim2.new(0, 110, 0, 30)
				ElementTitle.Font = Enum.Font.Gotham
				ElementTitle.Text = __Title__
				ElementTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				ElementTitle.TextSize = 14.000
				ElementTitle.TextWrapped = true
				ElementTitle.TextXAlignment = Enum.TextXAlignment.Left

				ElementIcon.Name = __UI__.RandomName("ElementIcon")
				ElementIcon.Parent = Element
				ElementIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ElementIcon.BackgroundTransparency = 1.000
				ElementIcon.Position = UDim2.new(0.0642857179, 0, 0.166666672, 0)
				ElementIcon.Size = UDim2.new(0, 20, 0, 20)
				ElementIcon.Image = "http://www.roblox.com/asset/?id=6031265962"

				CallTextBox.Name = __UI__.RandomName("CallTextBox")
				CallTextBox.Parent = Element
				CallTextBox.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
				CallTextBox.Position = UDim2.new(0.623809516, 0, 0.166666672, 0)
				CallTextBox.Size = UDim2.new(0, 100, 0, 20)
				CallTextBox.ZIndex = 3
				CallTextBox.Font = Enum.Font.Gotham
				CallTextBox.Text = tostring(_xET.Value)
				CallTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				CallTextBox.TextScaled = true
				CallTextBox.ClearTextOnFocus = __Clear__
				CallTextBox.FocusLost:Connect(function()
					_xET.Value = CallTextBox.Text
					_xET:Set(_xET.Value)
				end)

				UICorner_2.Parent = CallTextBox

				__UI__.RemoveElementToLoad(__element__)

				return _xET
			end
			function em:Slider(__Title__, __Value__, __MinValue__, __MaxValue__, __Call__)
				local ElementID    = tostring(CategoryTitle)..' | '..tostring(__Title__)..' | '..tostring(__MinValue__)..' | '..tostring(__MaxValue__)
				local _xET = {
					Call  = __Call__ or function() end,
					Value = __UI__.ReturnConfig(ElementID,__Value__)
				}

				local __BaseNex__ = 'Loading | Slider  | '..ElementID..' | '
				local __element__ = __BaseNex__..tostring(_xET.Value)
				__UI__.AddElementToLoad(__element__)

				local Element = Instance.new("Frame")
				local ElementTitle = Instance.new("TextLabel")
				local ElementIcon = Instance.new("ImageLabel")
				local SliderHolder = Instance.new("Frame")
				local SliderValue = Instance.new("TextLabel")
				local SliderBarValue = Instance.new("Frame")
				local CallSlider = Instance.new("TextButton")
				local UICorner_1 = Instance.new("UICorner")
				local UICorner_2 = Instance.new("UICorner")
				local UICorner_3 = Instance.new("UICorner")

				Element.Name = __UI__.RandomName("Element")
				Element.Parent = em.FolderCategory
				Element.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Element.Size = UDim2.new(0, 420, 0, 30)

				UICorner_1.Parent = Element

				ElementTitle.Name = __UI__.RandomName("ElementTitle")
				ElementTitle.Parent = Element
				ElementTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ElementTitle.BackgroundTransparency = 1.000
				ElementTitle.Position = UDim2.new(0.135714293, 0, -0.0333333351, 0)
				ElementTitle.Size = UDim2.new(0, 110, 0, 30)
				ElementTitle.Font = Enum.Font.Gotham
				ElementTitle.Text = __Title__
				ElementTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				ElementTitle.TextSize = 14.000
				ElementTitle.TextWrapped = true
				ElementTitle.TextXAlignment = Enum.TextXAlignment.Left

				ElementIcon.Name = __UI__.RandomName("ElementIcon")
				ElementIcon.Parent = Element
				ElementIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ElementIcon.BackgroundTransparency = 1.000
				ElementIcon.Position = UDim2.new(0.0642857179, 0, 0.166666672, 0)
				ElementIcon.Size = UDim2.new(0, 20, 0, 20)
				ElementIcon.Image = "rbxassetid://7734058803"

				SliderHolder.Name = __UI__.RandomName("SliderHolder")
				SliderHolder.Parent = Element
				SliderHolder.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
				SliderHolder.Position = UDim2.new(0.624000013, 0, 0.300000012, 0)
				SliderHolder.Size = UDim2.new(0, 100, 0, 10)

				SliderValue.Name = __UI__.RandomName("SliderValue")
				SliderValue.Parent = SliderHolder
				SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderValue.BackgroundTransparency = 1.000
				SliderValue.Position = UDim2.new(0.999000013, 0, -0.200000018, 0)
				SliderValue.Size = UDim2.new(0, 50, 0, 15)
				SliderValue.Font = Enum.Font.Gotham
				SliderValue.Text = tostring(_xET.Value)
				SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderValue.TextSize = 14.000
				SliderValue.TextWrapped = false

				UICorner_2.CornerRadius = UDim.new(0, 100)
				UICorner_2.Parent = SliderHolder

				SliderBarValue.Name = __UI__.RandomName("SliderBarValue")
				SliderBarValue.Parent = SliderHolder
				SliderBarValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderBarValue.Size = UDim2.new(0, ((100 / tonumber(__MaxValue__)) * _xET.Value), 0, 10)


				UICorner_3.CornerRadius = UDim.new(0, 100)
				UICorner_3.Parent = SliderBarValue

				CallSlider.Name = __UI__.RandomName("CallSlider")
				CallSlider.Parent = SliderHolder
				CallSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				CallSlider.BackgroundTransparency = 1.000
				CallSlider.Size = UDim2.new(0, 100, 0, 10)
				CallSlider.ZIndex = 3
				CallSlider.Font = Enum.Font.SourceSans
				CallSlider.Text = __UI__["#WaterMark"]
				CallSlider.TextColor3 = Color3.fromRGB(0, 0, 0)
				CallSlider.TextSize = 14.000
				CallSlider.TextTransparency = 1.000

				function _xET:Set(_)
					_xET.Value = _
					pcall(_xET.Call,_xET.Value)
					SliderValue.Text = tostring(_)
					SliderBarValue.Size = UDim2.new(0, math.clamp(Main['__Mouse__'].X - SliderBarValue.AbsolutePosition.X, 0, 100), 0, 10)
				end

				CallSlider.MouseButton1Down:Connect(function()
					_xET:Set(math.floor((((tonumber(__MaxValue__) - tonumber(__MinValue__)) / 100) * SliderBarValue.AbsoluteSize.X) + tonumber(__MinValue__)) or 0)
					moveconnection = Main['__Mouse__'].Move:Connect(function() _xET:Set(math.floor((((tonumber(__MaxValue__) - tonumber(__MinValue__)) / 100) * SliderBarValue.AbsoluteSize.X) + tonumber(__MinValue__))) end)
					releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then _xET:Set(math.floor((((tonumber(__MaxValue__) - tonumber(__MinValue__)) / 100) * SliderBarValue.AbsoluteSize.X) + tonumber(__MinValue__))) moveconnection:Disconnect() releaseconnection:Disconnect() end end)
				end)

				__UI__.RemoveElementToLoad(__element__)

				return _xET
			end

			return em
		end
	end
	repeat wait() until #ElementsHolder.Load == 0
	Main.Base.Visible = true
	return Main
end
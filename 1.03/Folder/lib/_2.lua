local function CreateInstance(cls,props)
local inst = Instance.new(cls)
for i,v in pairs(props) do
    inst[i] = v
end
return inst
end
    
local ScreenGui = CreateInstance('ScreenGui',{DisplayOrder=0,Enabled=true,ResetOnSpawn=true,Name='ScreenGui', Parent=game.CoreGui})
local Frame = CreateInstance('Frame',{Style=Enum.FrameStyle.Custom,Active=false,AnchorPoint=Vector2.new(0.5, 0.5),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=0,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.5, 0, 0.5, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 100, 0, 100),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name = 'Frame',Parent = ScreenGui})
local logo = CreateInstance('ImageLabel',{Image='rbxassetid://10849042854',ImageColor3=Color3.new(1, 1, 1),ImageRectOffset=Vector2.new(0, 0),ImageRectSize=Vector2.new(0, 0),ImageTransparency=1,ScaleType=Enum.ScaleType.Stretch,SliceCenter=Rect.new(0, 0, 0, 0),Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.100000001, 0, 0.100000001, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 80, 0, 80),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='logo',Parent = Frame})
local title = CreateInstance('TextLabel',{Font=Enum.Font.TitilliumWeb,FontSize=Enum.FontSize.Size48,Text='Azurite',TextColor3=Color3.new(0, 0, 0),TextScaled=true,TextSize=40,TextStrokeColor3=Color3.new(0.317647, 0.8, 0.968628),TextStrokeTransparency=1,TextTransparency=1,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0.286666662, 0, 0.25, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 200, 0, 50),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='title',Parent = Frame})
local corner = CreateInstance('UICorner',{CornerRadius = UDim.new(0, 8),Parent = Frame})

-- propriétés du début
Frame.BackgroundTransparency = 1
Frame.Size = UDim2.new(0,1,0,1)
-- launch
game:GetService('TweenService'):Create(Frame, TweenInfo.new(1), {BackgroundTransparency = 0,Size = UDim2.new(0, 100, 0, 100)}):Play()
task.wait(1.5)
game:GetService('TweenService'):Create(logo, TweenInfo.new(.75), {ImageTransparency = 0}):Play()
task.wait(2)
game:GetService('TweenService'):Create(Frame, TweenInfo.new(1), {Size = UDim2.new(0, 300, 0, 100)}):Play()
game:GetService('TweenService'):Create(logo, TweenInfo.new(1), {Position = UDim2.new(0.02, 0, 0.1, 0)}):Play()
task.wait(0.5)
game:GetService('TweenService'):Create(title, TweenInfo.new(1), {TextTransparency = 0}):Play()
task.wait(2)
game:GetService('TweenService'):Create(title, TweenInfo.new(1), {TextTransparency = 1}):Play()
game:GetService('TweenService'):Create(logo, TweenInfo.new(1), {ImageTransparency = 1}):Play()
task.wait(1)
game:GetService('TweenService'):Create(Frame, TweenInfo.new(1), {Size = UDim2.new(0, 1, 0, 1)}):Play()
task.wait(1)
Frame.BackgroundTransparency = 1
ScreenGui:Destroy()
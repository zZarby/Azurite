-- Azurite
local a = {}
function a:Kick(b,c)
    local _1 = Instance.new("ScreenGui")
    local _1_2 = Instance.new("Frame")
    local _1_3 = Instance.new("ImageLabel")
    local _1_4 = Instance.new("TextLabel")
    local _1_5 = Instance.new("Frame")
    local _1_6 = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    _1.Name = "_1"
    _1.Parent = game.CoreGui
    _1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    _1.ResetOnSpawn = false
    _1_2.Name = "_1"
    _1_2.Parent = _1
    _1_2.AnchorPoint = Vector2.new(0.5, 0.5)
    _1_2.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
    _1_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    _1_2.Size = UDim2.new(1, 0, 1.5, 0)
    _1_3.Name = "_1"
    _1_3.Parent = _1_2
    _1_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _1_3.Position = UDim2.new(0.443181813, 0, 0.295528471, 0)
    _1_3.Size = UDim2.new(0, 150, 0, 150)
    _1_3.Image = "rbxassetid://10819857381"
    _1_4.Name = "_1"
    _1_4.Parent = _1_3
    _1_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _1_4.BackgroundTransparency = 1.000
    _1_4.Position = UDim2.new(-0.166666672, 0, 1.13333333, 0)
    _1_4.Size = UDim2.new(0, 200, 0, 50)
    _1_4.Font = Enum.Font.TitilliumWeb
    _1_4.Text = "Azurite"
    _1_4.TextColor3 = Color3.fromRGB(255, 255, 255)
    _1_4.TextSize = 50.000
    _1_5.Name = "_1"
    _1_5.Parent = _1_3
    _1_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _1_5.Position = UDim2.new(-0.5, 0, -0.206666678, 0)
    _1_5.Size = UDim2.new(0, 300, 0, 1)
    _1_6.Name = "_1"
    _1_6.Parent = _1_3
    _1_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _1_6.Position = UDim2.new(-0.5, 0, 1.63333333, 0)
    _1_6.Size = UDim2.new(0, 300, 0, 1)
    TextLabel.Parent = _1_3
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
    TextLabel.Position = UDim2.new(-1.16666663, 0, 2.24000001, 0)
    TextLabel.Size = UDim2.new(0, 500, 0, 50)
    TextLabel.Font = Enum.Font.TitilliumWeb
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 14.000
    TextLabel.TextWrapped = true
    TextLabel.Text = ""
    for i = 1, #c do
        TextLabel.Text = string.sub(c, 1, i)
        wait(0.05)
    end
    wait(5)
    b:Kick()
    game:shutdown()
end
return a
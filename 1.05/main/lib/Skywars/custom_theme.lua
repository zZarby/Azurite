function nogui()
    local main = game.Players.LocalPlayer.PlayerGui.ScreenGui
    local Shop = main:FindFirstChild('ShopGuiButtons')
    local WinGui = main:FindFirstChild('WinGui')
    local PromoGui = main:FindFirstChild('PromoGui')
    local Spectate = main:FindFirstChild('Spectate')
    local Health = main:FindFirstChild('Health')
    local CameraButton = main:FindFirstChild('CameraButton')
    if Shop then
        Shop:Destroy()
    end
    if WinGui then
        WinGui:Destroy()
    end
    if PromoGui then
        PromoGui:Destroy()
    end
    if Spectate then
        Spectate:Destroy()
    end
    if Health then 
        Health:Destroy()
    end
    if CameraButton then 
        CameraButton:Destroy()
    end
end

function notexture()
    local smooth = false
	for _, object in ipairs(workspace:GetDescendants()) do
		if object:IsA("BasePart") then
			if smooth and object:FindFirstChild("OriginalMaterial") then
				object.Material = object.OriginalMaterial.Value
				object.OriginalMaterial:Destroy()
			elseif not smooth then
				local originalMaterial = Instance.new("StringValue")
				originalMaterial.Name = "OriginalMaterial"
				originalMaterial.Value = object.Material.Name
				originalMaterial.Parent = object
				object.Material = Enum.Material.SmoothPlastic
			end
		end
	end
	smooth = not smooth
end

function sky()
    sky = game:service("Lighting").Sky
    sky.SkyboxBk = "http://www.roblox.com/asset/?id=570557514"
    sky.SkyboxDn = "http://www.roblox.com/asset/?id=570557775"
    sky.SkyboxFt = "http://www.roblox.com/asset/?id=570557559"
    sky.SkyboxLf = "http://www.roblox.com/asset/?id=570557620"
    sky.SkyboxRt = "http://www.roblox.com/asset/?id=570557672"
    sky.SkyboxUp = "http://www.roblox.com/asset/?id=570557727"
end

function mypotions(cframe)
    local fog = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11.1042919, 264.999908, 66.708046)
    wait(0.025)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-11.052762, 264.999908, 72.8579559)
    wait(0.025)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10.8606243, 264.999908, 78.8547974)
    wait(0.025)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = fog
end

function health()
    local count = 0
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        count = count + 1
    end
    if count == 0 then
        local check = game.CoreGui:FindFirstChild('Health')
        if check then
            check:Destroy()
        end
    else
        local check = game.CoreGui:FindFirstChild('Health')
        if check then
            -- pass
        else
            game:GetService("StarterGui"):SetCoreGuiEnabled('Backpack', true)
            notexture()
            local ScreenGui = Instance.new("ScreenGui")
            local Bar = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local _50 = Instance.new("Frame")
            local UICorner_2 = Instance.new("UICorner")
            local _75 = Instance.new("Frame")
            local UICorner_3 = Instance.new("UICorner")
            local _100 = Instance.new("Frame")
            local UICorner_4 = Instance.new("UICorner")
            local _25 = Instance.new("Frame")
            local UICorner_5 = Instance.new("UICorner")
            local _10 = Instance.new("Frame")
            local UICorner_6 = Instance.new("UICorner")
            ScreenGui.Parent = game.CoreGui
            ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            ScreenGui.Name = 'Health'
            Bar.Name = "Bar"
            Bar.Parent = ScreenGui
            Bar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Bar.BorderColor3 = Color3.fromRGB(69, 69, 69)
            Bar.Position = UDim2.new(0.387387395, 0, 0.899882197, 0)
            Bar.Size = UDim2.new(0, 300, 0, 60)
            UICorner.Parent = Bar
            _50.Name = "50"
            _50.Parent = Bar
            _50.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
            _50.Position = UDim2.new(0.439999998, 0, 0.199999958, 0)
            _50.Size = UDim2.new(0, 35, 0, 35)
            UICorner_2.CornerRadius = UDim.new(0, 25)
            UICorner_2.Parent = _50
            _75.Name = "75"
            _75.Parent = Bar
            _75.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
            _75.Position = UDim2.new(0.600000024, 0, 0.200000003, 0)
            _75.Size = UDim2.new(0, 35, 0, 35)
            UICorner_3.CornerRadius = UDim.new(0, 25)
            UICorner_3.Parent = _75
            _100.Name = "100"
            _100.Parent = Bar
            _100.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
            _100.Position = UDim2.new(0.769999981, 0, 0.200000003, 0)
            _100.Size = UDim2.new(0, 35, 0, 35)
            UICorner_4.CornerRadius = UDim.new(0, 25)
            UICorner_4.Parent = _100
            _25.Name = "25"
            _25.Parent = Bar
            _25.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
            _25.Position = UDim2.new(0.270000011, 0, 0.200000003, 0)
            _25.Size = UDim2.new(0, 35, 0, 35)
            UICorner_5.CornerRadius = UDim.new(0, 25)
            UICorner_5.Parent = _25
            _10.Name = "10"
            _10.Parent = Bar
            _10.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
            _10.Position = UDim2.new(0.100000001, 0, 0.200000003, 0)
            _10.Size = UDim2.new(0, 35, 0, 35)
            UICorner_6.CornerRadius = UDim.new(0, 25)
            UICorner_6.Parent = _10
            local function ENBUALW_fake_script() -- _50.LocalScript 
                local script = Instance.new('LocalScript', _50)

                game.RunService.RenderStepped:Connect(function()
                    if game.Players.LocalPlayer.Character.Humanoid.Health < 50 or game.Players.LocalPlayer.Character.Humanoid.Health == 50 then
                        _50.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
                    else
                        _50.BackgroundColor3 = Color3.fromRGB(69, 69, 69)
                    end
                end)
            end
            coroutine.wrap(ENBUALW_fake_script)()
            local function HDXEC_fake_script() -- _75.LocalScript 
                local script = Instance.new('LocalScript', _75)
                game.RunService.RenderStepped:Connect(function()
                    if game.Players.LocalPlayer.Character.Humanoid.Health < 75 or game.Players.LocalPlayer.Character.Humanoid.Health == 75 then
                        _75.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
                    else
                        _75.BackgroundColor3 = Color3.fromRGB(69, 69, 69)
                    end
                end)
            end
            coroutine.wrap(HDXEC_fake_script)()
            local function IHAD_fake_script() -- _100.LocalScript 
                local script = Instance.new('LocalScript', _100)

                game.RunService.RenderStepped:Connect(function()
                    if game.Players.LocalPlayer.Character.Humanoid.Health < 100 or game.Players.LocalPlayer.Character.Humanoid.Health == 100 then
                        _100.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
                    else
                        _100.BackgroundColor3 = Color3.fromRGB(69, 69, 69)
                    end
                end)
            end
            coroutine.wrap(IHAD_fake_script)()
            local function SSORSH_fake_script() -- _25.LocalScript 
                local script = Instance.new('LocalScript', _25)

                game.RunService.RenderStepped:Connect(function()
                    if game.Players.LocalPlayer.Character.Humanoid.Health < 25 or game.Players.LocalPlayer.Character.Humanoid.Health == 25 then
                        _25.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
                    else
                        _25.BackgroundColor3 = Color3.fromRGB(69, 69, 69)
                    end
                end)
            end
            coroutine.wrap(SSORSH_fake_script)()
            local function XHSVHK_fake_script() -- _10.LocalScript 
                local script = Instance.new('LocalScript', _10)

                game.RunService.RenderStepped:Connect(function()
                    if game.Players.LocalPlayer.Character.Humanoid.Health < 10 or game.Players.LocalPlayer.Character.Humanoid.Health == 10 then
                        _10.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
                    else
                        _10.BackgroundColor3 = Color3.fromRGB(69, 69, 69)
                    end
                end)
            end
            coroutine.wrap(XHSVHK_fake_script)()
        end
    end
end

Spawn(function()
    sky()
    mypotions()
    notexture()
    fireclickdetector(game:GetService("Workspace").ToggleMusic.ClickDetector, 0)
    fireclickdetector(game:GetService("Workspace").ToggleNight.ClickDetector, 0)
end)
game.RunService.RenderStepped:Connect(function()
    if game.Players.LocalPlayer.PlayerGui.ScreenGui.Hints == true then
        local time = game.Players.LocalPlayer.PlayerGui.ScreenGui.Hints.Top.Mode.Time
        if time == "4:30" then
            notexture()
        end
    end
    nogui()
    health()
end)

local ChatBar = game.Players.LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
local function chat(text)
    ChatBar:SetTextFromInput(text)
    game.Players:Chat(text)
    ChatBar.Text = ""
end

local checker = false
local function takepartto(part, cfram)
    repeat
        wait()
    until checker == false
    checker = true
    local function ivory()repeat if not game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild(game.Players.LocalPlayer.Name.."'s admin")then if game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin")then local b=game:GetService("Workspace").Terrain["_Game"].Admin.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head")local c=game.Players.LocalPlayer.Character:FindFirstChild("Left Leg")firetouchinterest(b,c,1)firetouchinterest(b,c,0)else regen()end end;wait()if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("IvoryPeriastron")then game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.IvoryPeriastron)end;if game:GetService("Players").LocalPlayer.Character:FindFirstChild("IvoryPeriastron")then else chat("gear me 000000000000000000108158379")wait(.2)end;wait()until game:GetService("Players").LocalPlayer.Character:FindFirstChild("IvoryPeriastron")wait(.1)end
    local function remoteivory()local b=game:GetService("Players").LocalPlayer.Character:FindFirstChild("IvoryPeriastron")repeat game:GetService("RunService").Heartbeat:wait()until b:FindFirstChild("Remote")local c=b:FindFirstChild("Remote")c:FireServer(Enum.KeyCode.E)end
    game:GetService("Workspace").FallenPartsDestroyHeight = "nan"
    local position = cfram
    local spos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    for i, v in pairs(game.Workspace:GetDescendants()) do
        if v ~= part and v:IsA("Part") then
            v.CanCollide = false
        end
    end
    game.Workspace.Gravity = 0
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = position
    wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = position
    wait()
    ivory()
    chat("invis me")
    wait()
    local tempting = true
    spawn(function()
        while tempting == true do
            game.Workspace.Gravity = 0
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = position
            game:GetService("RunService").Heartbeat:wait()
        end
    end)
    wait(.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    wait(.1)
    tempting = false
    wait(.35)
    remoteivory()
    wait(.35)
    repeat
        game:GetService("RunService").Heartbeat:wait()
    until game.Workspace.Camera:FindFirstChild("FakeCharacter")
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    local me = game.Players.LocalPlayer
    local function movepart()
        if me.Character then
            if me.Character:FindFirstChild("HumanoidRootPart") then
                local cf = game.Players.LocalPlayer.Character.HumanoidRootPart
                local looping = true
                spawn(function()
                    while true do
                        game:GetService('RunService').Heartbeat:Wait()
                        game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
                        cf.CFrame = part.CFrame * CFrame.new(-1*(part.Size.X/2)-(game.Players.LocalPlayer.Character['Torso'].Size.X/2), 0, 0)
                        if not looping then break end
                    end
                end)
                spawn(function() while looping do wait(.1) chat("unpunish me ") end end)
                wait(0.25)
                looping = false
            end
        end
    end
    repeat
        movepart()
    until game.Players.LocalPlayer.Character.Torso:FindFirstChild("Weld")
    wait()
    for i, v in pairs(game.Players.LocalPlayer.Character.Torso:GetChildren()) do
        if v:IsA("Weld") and v.Part1 ~= part then
            v:Destroy()
        end
    end
    wait()
    remoteivory()
    repeat
        game:GetService("RunService").Heartbeat:wait()
    until game.workspace:FindFirstChild("Pulse")
    chat("respawn me")
    game.workspace:FindFirstChild("Pulse"):Destroy()
    for i, v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("Part") then
            v.CanCollide = true
        end
    end
    repeat
        game:GetService("RunService").Heartbeat:wait()
    until(game.Workspace:FindFirstChild(me.Name))
    wait(.2)
    part = nil
    game.Workspace.Gravity = 196.2
    wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = spos
    checker = false
end
local filestuff = string.split(readfile("savedthings.lua"), "\n")
local newtings = {}
local newparts = {}
local newboxnewparts = {}
local tweenser = game:GetService("TweenService")
local num
for i, v in pairs(filestuff) do
    num = i
    local splitstr = v:split('/')
    if v == "" then
        continue
    end
    for _, a in pairs(game.Workspace:GetDescendants()) do
        if a.Name == splitstr[1] and a:IsA("Part") then
            part = a
            local cf = splitstr[2]
            local pt = splitstr[1]
            local part
            local function stringToCFrame(input)
                return CFrame.new(unpack(game:GetService('HttpService'):JSONDecode('['..input..']')))
            end

            local cfram = stringToCFrame(cf)
            local newpart = a:Clone()
            newpart.Parent = game:GetService("Workspace")
            newpart.Transparency = 0.5
            newpart.CFrame = cfram * CFrame.new(1*(a.Size.X/2)+(game.Players.LocalPlayer.Character['Torso'].Size.X/2), 0, 0)
            newpart.Name = "Fake Part "..i
            table.insert(newparts, newpart)
            local newpartbox = Instance.new("SelectionBox")
            newpartbox.Parent = game.Workspace.CurrentCamera
            newpartbox.Adornee = newpart
            newpartbox.Color3 = Color3.fromRGB(255,0,0)
            newpartbox.SurfaceColor3 = Color3.new(1, 0, 0)
            newpartbox.Transparency = 0.5
            newpartbox.SurfaceTransparency = 0.7
            table.insert(newboxnewparts, newpartbox)
            local newselbox = Instance.new("SelectionBox")
            newselbox.Parent = game.Workspace.CurrentCamera
            newselbox.Adornee = a
            newselbox.Color3 = Color3.fromRGB(255,0,0)
            newselbox.SurfaceColor3 = Color3.new(1, 0, 0)
            newselbox.Transparency = 0.5
            newselbox.SurfaceTransparency = 0.7
            table.insert(newtings, newselbox)
        end
    end
end
print("There Are "..tostring(num).." Parts In This Build")
for i, v in pairs(filestuff) do
    if v == "" then continue end
    print("Moving Part "..i)
    local sep = string.split(v, "/")
    local cf = sep[2]
    local pt = sep[1]
    local part
    local function stringToCFrame(input)
        return CFrame.new(unpack(game:GetService('HttpService'):JSONDecode('['..input..']')))
    end
    for i, v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("Part") and v.Name == pt then
            part = v
            if part:FindFirstChild("TouchInterest") then
                part:FindFirstChild("TouchInterest"):Destroy()
            end
        end
    end
    local cfram = stringToCFrame(cf)
    local center = part.Position
    local radius = 1 + part.Size.X
    if (center-cfram.Position).magnitude <= radius then
    else
        takepartto(part, cfram)
    end
    wait(.3)
    if part.CFrame ~= cfram then
        local selbox = newtings[i]
        selbox.Parent = game.Workspace.CurrentCamera
        selbox.Adornee = part
        local tweeninf = TweenInfo.new(
            0.3,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out,
            0,
            false,
            0
        )
        local tween1 = tweenser:Create(
            selbox,
            tweeninf,
            {
                Color3 = Color3.fromRGB(0,255,0),
                SurfaceColor3 = Color3.new(0, 0.5, 0),
                Transparency = 0.5,
                SurfaceTransparency = 0.7
            }
        )
        tween1:Play()
    end
    repeat
        wait()
    until checker == false
    wait(.3)
    if part.CFrame == cfram then
        takepartto(part, cfram)
        local selbox = newtings[i]
        selbox.Parent = game.Workspace.CurrentCamera
        selbox.Adornee = part
        local tweeninf = TweenInfo.new(
            0.3,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out,
            0,
            false,
            0
        )
        local tween1 = tweenser:Create(
            selbox,
            tweeninf,
            {
                Color3 = Color3.fromRGB(0,255,0),
                SurfaceColor3 = Color3.new(0, 0.5, 0),
                Transparency = 0.5,
                SurfaceTransparency = 0.7
            }
        )
        tween1:Play()
    end
end
for i, v in pairs(newparts) do v:Destroy() end
for i, v in pairs(newboxnewparts) do v:Destroy() end
wait(1)
for i, v in pairs(newtings) do
    coroutine.wrap(function()
        local tweeninf = TweenInfo.new(
            0.8,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out,
            0,
            false,
            0
        )
        local tween1 = tweenser:Create(
            v,
            tweeninf,
            {
                Transparency = 1,
                SurfaceTransparency = 1
            }
        )
        tween1:Play()
        wait(.6)
        v:Destroy()
    end)()
end
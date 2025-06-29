--[[----------------------------]]
--[[ Azurite UI Library     --> ]]local __UI__ = loadstring(game:HttpGet(('https://raw.githubusercontent.com/DaFrenchTokio/Azurite/main/UILibrary/lib.lua'),true))()
--[[----------------------------]]

__UI__:Notification('Thanks for using Azurite')

local azu = {
	pass = {},
	connections = {},
	threads = {},
	hightlights = {},
	ChatEvent = {
		prefix = '!',
		Service = {},
		Service2 = {}
	},
	VariableService = {
		hightlights = {},
		icon = 'rbxthumb://type=Asset&id=10912483183&w=150&h=150',
		_flyspeed = 1,
		_flystate = false,
		_fly_cs = false,
		_esp_player_var = false,
		_esp_title_player = false,
	},
	CoreDocumentation = {
		{'2.01',{'New Version', 'Better UI', 'Fixed Many Errors', 'Separated everything'}},
		{'1.05',{'Fixed Library','Added Support'}},
		{'1.04',{'Added Documentation','Added Protection On Gui','Added Support','Added Executor','Added Api','Added Esp'}},
		{'1.03',{'Added Evade Support'}},
		{'1.02',{'Added Toggle','Added Basekey'}},
		{'1.01',{'Added Sliders','Added Multi Supports'}}
	}
}

Players = game:GetService('Players')
WS = game:GetService('Workspace')
RS = game:GetService('RunService')
RP = game:GetService('ReplicatedStorage')
CG = game:GetService('CoreGui')
LP = Players.LocalPlayer

function azu:startsWith(mainString, ToFind) return string.sub(mainString, 1, #ToFind) == ToFind end
function azu:Exit() for _,v in pairs(azu.connections) do v:Disconnect() end end
function azu:Hook(connection) table.insert(azu.connections, connection) end
function azu:Sink(Position) return(loadstring(game:HttpGet((GUC .. '/Azurite/main/lib/Modules/links.lua'),true))():GetLink(Position)) end
function azu:Kick(player,reason) loadstring(game:HttpGet((azu:Sink(1)),true))():Kick(player,reason) end
function azu:Wait() RS.Heartbeat:Wait() end
function azu:FindThread(Methods) for _, v in next, azu.threads do if v.ID == Methods.ID then return v elseif v.Comment == Methods.Comment then return v end end return {ID=false} end
function azu:Run(NoError, Threaded, Function, Comment) local num = false local thread = false repeat num = math.random(0, 999999) until not azu:FindThread({ID = num}).Thread if Threaded then if NoError then thread = task.spawn(function() pcall(Function) end) else thread = task.spawn(Function) end local final_table = {Thread = thread, Comment = Comment or false, ID = num, Active = true } function final_table:Destroy() local find = table.find(azu.threads, final_table) if find then final_table.Active = false task.cancel(final_table.Thread) table.remove(azu.threads, find) end end task.defer(function() while task.wait(0.2) do if not final_table.Active then final_table:Destroy() break end end end) table.insert(azu.threads, final_table) return final_table else if NoError then pcall(Function) else Function() end end end
function azu:Loop(Threaded,Function)if Threaded==true then RS.RenderStepped:Connect(Function)else coroutine.wrap(function()while true do azu:Wait() coroutine.wrap(Function)()end end)()end end
function azu:GetPlayer(a) local ToFind = a:lower() for _, v in pairs(Players:GetChildren()) do if ToFind == string.sub(v.Name:lower(), 1, #ToFind) then return Players[v.Name] end end end
function azu:Char(plr) return plr.Character end
function azu:WaitChar(Player) return Player.Character or Player.CharacterAdded:Wait() end
function azu:GetHum(char) local hum = char:FindFirstChild('Humanoid') return hum end
function azu:WaitHum(char) local hum = char:WaitForChild('Humanoid') return hum end
function azu:WaitRoot(char) local rootPart = char:WaitForChild('HumanoidRootPart') or char:WaitForChild('Torso') or char:WaitForChild('UpperTorso') return rootPart end
function azu:GetRoot(char) local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso') return rootPart end
function azu:Chat(msg) if not game.CoreGui.RobloxGui:FindFirstChild('AzuPrompt') then local p = Instance.new('TextBox') p.Parent = game.CoreGui.RobloxGui p.Name = 'AzuPrompt' p.TextTransparency = 1.000 p.BackgroundTransparency = 1.000 end local v = game.CoreGui.RobloxGui.AzuPrompt v:SetTextFromInput(msg) Players:Chat(msg) v:SetTextFromInput(v.Text) end
function azu:Say(msg) game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg,'All') end
function azu:GetMessage(target,name,func) azu.ChatEvent.Service2[name] = {nm = name,target = target,call = func or function() end} end
function azu:Command(target,name,aliases,func) azu.ChatEvent.Service[name] = {nm = name,aliases = aliases,target = target,call = func or function() end} end
function azu:Message(msg) azu:Chat(msg) azu:Say(msg) end
function azu:ServerHop()local a=false;while not a do sucess=pcall(function()local b={}for c,d in ipairs(game:GetService('HttpService'):JSONDecode(game:HttpGetAsync('https://games.roblox.com/v1/games/'..tostring(exploit.GID)..'/servers/Public?sortOrder=Asc&limit=100')).data)do if type(d)=='table'and d.maxPlayers>d.playing then b[#b+1]=d.id;amount=d.playing end end;if#b>0 then game:GetService('TeleportService'):TeleportToPlaceInstance(exploit.GID,b[math.random(1,#b)])end end)end end
function azu:HasGamepass(a,b)local c=game:HttpGet('https://inventory.roblox.com/v1/users/'..a..'/items/GamePass/'..b)local d=false;if string.match(c,tostring(b))then d=true end;return d end
function azu:DisconnectAllSignals(a) local gc = getconnections or get_signal_cons if not gc then __UI__:Notification('Incompatible Exploit (hookmetamethod)') else for b,c in pairs(gc(a)) do if (syn) then c:Disable() else c:Disconnect() end end end end
function azu:FindHightlight(Method) for _, v in next, azu.hightlights do if Method.Name then if v.Name == Method.Name then return v end elseif Method.Code then if v.Code == Method.Code then return v end end end return {Instance=false} end
function azu:Highlight(Properties, Protected)
    local r = azu:FindHightlight({Name = Properties.Name})
    if not r.Instance then
        local h = Instance.new("Highlight")
        h.Name = Properties.Name
        h.Parent = Properties.Parent
        if Properties.Adornee then
            h.Adornee = Properties.Adornee
        end
        if Properties.FillTransparency then
            h.FillTransparency = Properties.FillTransparency
        end
        if Properties.OutlineTransparency then
            h.OutlineTransparency = Properties.OutlineTransparency
        end
        if Properties.FillColor then
            h.FillColor = Properties.FillColor
        end
        if Properties.OutlineColor then
            h.OutlineColor = Properties.OutlineColor
        end
		if Properties.Enabled then
            h.Enabled = Properties.Enabled
        end
        h.DepthMode = "AlwaysOnTop"
        local Code
        while wait() do
            Code = math.random(0, 999999)
            if not azu:FindHightlight({Code = Code}).Instance then
                break
            end
        end
        local hightlight = {Code = Code, Instance = h}
        function hightlight:Destroy()
            local v = azu:FindHightlight({Code = Code})
            if v.Instance then
                table.remove(azu.hightlights, table.find(azu.hightlights, v))
                v.Instance:Destroy()
            end
        end
        azu:Run(
            false,
            true,
            function()
                local ProtectPropertiesSignals = {}
                local propertiesToConnect = {
                    "Adornee",
                    "FillTransparency",
                    "OutlineTransparency",
                    "FillColor",
                    "OutlineColor",
					"Enabled"
                }
                for _, property in ipairs(propertiesToConnect) do
                    local connection =
                        hightlight.Instance:GetPropertyChangedSignal(property):Connect(
                        function()
                            r[property] = Properties[property]
                        end
                    )
                    table.insert(ProtectPropertiesSignals, connection)
                end
                while task.wait() do
                    if hightlight.Instance.Parent == nil then
                        for _, v in pairs(ProtectPropertiesSignals) do
                            v:Disconnect()
                        end
                        hightlight:Destroy()
                    end
                end
            end
        )
        table.insert(azu.hightlights, hightlight)
        return hightlight
    else
        local ToProtect = Protected or false
        if ToProtect then
			if Properties.Enabled and Properties.Enabled ~= r.Enabled then
                r.Enabled = Properties.Enabled
            end
            if Properties.Adornee and Properties.Adornee ~= r.Adornee then
                r.Adornee = Properties.Adornee
            end
            if Properties.FillTransparency and Properties.FillTransparency ~= r.FillTransparency then
                r.FillTransparency = Properties.FillTransparency
            end
            if Properties.OutlineTransparency and Properties.OutlineTransparency ~= r.OutlineTransparency then
                r.OutlineTransparency = Properties.OutlineTransparency
            end
            if Properties.FillColor and Properties.FillColor ~= r.FillColor then
                r.FillColor = Properties.FillColor
            end
            if Properties.OutlineColor and Properties.OutlineColor ~= r.OutlineColor then
                r.OutlineColor = Properties.OutlineColor
            end
        end
        return r
    end
end
function azu:DestroyHighlight(a) for _, v in pairs(workspace:GetDescendants()) do if v:IsA('Highlight') and v.Name == a then v:Destroy() break end end end
function azu:ChatSystemEvent(a)local b=a.Chatted:Connect(function(c)tablemsg=string.split(c,' ')for d,e in pairs(azu.ChatEvent.Service2)do local f=false;local g=string.len(e.nm)local h=string.sub(tostring(c),g+2)fullcmd=e.nm;if e.target=='local'and a.Name==LP.Name then if string.sub(tostring(c),0,g)==fullcmd and tablemsg[1]==fullcmd then f=true;coroutine.wrap(e.call)(h)end elseif e.target=='other'and a.Name~=LP.Name then if string.sub(tostring(c),0,g)==fullcmd and tablemsg[1]==fullcmd then f=true;coroutine.wrap(e.call)(h)end elseif e.target=='everyone'then if string.sub(tostring(c),0,g)==fullcmd and tablemsg[1]==fullcmd then f=true;coroutine.wrap(e.call)(h)end end;if f==false then for i,j in pairs(e.aliases)do local g=string.len(j)local h=string.sub(tostring(c),g+2)fullcmd=j;if e.target=='local'and a.Name==LP.Name then if string.sub(tostring(c),0,g)==fullcmd and tablemsg[1]==fullcmd then coroutine.wrap(e.call)(h)end elseif e.target=='other'and a.Name~=LP.Name then if string.sub(tostring(c),0,g)==fullcmd and tablemsg[1]==fullcmd then coroutine.wrap(e.call)(h)end elseif e.target=='everyone'then if string.sub(tostring(c),0,g)==fullcmd and tablemsg[1]==fullcmd then coroutine.wrap(e.call)(h)end end end end end;for d,e in pairs(azu.ChatEvent.Service)do local f=false;local g=string.len(azu.ChatEvent.prefix)+string.len(e.nm)local h=string.sub(tostring(c),g+2)fullcmd=azu.ChatEvent.prefix..''..e.nm..''if e.target=='local'and a.Name==LP.Name then if string.sub(tostring(c),0,g)==fullcmd and tablemsg[1]==fullcmd then f=true;coroutine.wrap(e.call)(h)end elseif e.target=='other'and a.Name~=LP.Name then if string.sub(tostring(c),0,g)==fullcmd and tablemsg[1]==fullcmd then f=true;coroutine.wrap(e.call)(h)end elseif e.target=='everyone'then if string.sub(tostring(c),0,g)==fullcmd and tablemsg[1]==fullcmd then f=true;coroutine.wrap(e.call)(h)end end;if f==false then for i,j in pairs(e.aliases)do local g=string.len(azu.ChatEvent.prefix)+string.len(j)local h=string.sub(tostring(c),g+2)fullcmd=azu.ChatEvent.prefix..''..j..''if e.target=='local'and a.Name==LP.Name then if string.sub(tostring(c),0,g)==fullcmd and tablemsg[1]==fullcmd then coroutine.wrap(e.call)(h)end elseif e.target=='other'and a.Name~=LP.Name then if string.sub(tostring(c),0,g)==fullcmd and tablemsg[1]==fullcmd then coroutine.wrap(e.call)(h)end elseif e.target=='everyone'then if string.sub(tostring(c),0,g)==fullcmd and tablemsg[1]==fullcmd then coroutine.wrap(e.call)(h)end end end end end end)azu:Hook(b)end
function azu:CreateCharacterSignal(Player, CallOnCurrentChar, Function) if CallOnCurrentChar then azu:Run(false, true, Function) end return Player.CharacterAdded:Connect(Function) end
function azu:CreateNilCharacterSignal(Player, Function) return Player.CharacterRemoving:Connect(Function) end
function azu:OnDied(Player, HealthMethod, Function) function SignalFunc() local hum = azu:WaitHum(azu:WaitChar(LP)) local callback = function() azu:Run(false, false, Function) end if HealthMethod then hum:GetPropertyChangedSignal('Health'):Connect(callback) else hum.Died:Connect(callback) end end azu:CreateCharacterSignal(LP, true, SignalFunc) end
function azu:PlayerEsp(plr)
    repeat task.wait() until azu:Char(plr)
    
    if plr.Character and plr.Name ~= Players.LocalPlayer.Name and not CG:FindFirstChild('000x'..plr.Name) then
        local ESPholder = Instance.new('Folder', CG.RobloxGui)
        ESPholder.Name = '000x'..plr.Name
    
        
        for _, v in pairs(azu:Char(plr):GetChildren()) do
            if v:IsA("BasePart") then
                local a = Instance.new("BoxHandleAdornment")
                a.Name = plr.Name
                a.Parent = ESPholder
                a.Adornee = v
                a.AlwaysOnTop = true
                a.ZIndex = 10
                a.Size = v.Size
                a.Transparency = 1
                a.Color = BrickColor.new(0.502, 0.734, 0.859)
            end
        end

        if plr.Character and plr.Character:FindFirstChild('Head') then
            local BillboardGui = Instance.new("BillboardGui")
            local TextLabel = Instance.new("TextLabel")
            
            BillboardGui.Adornee = plr.Character.Head
            BillboardGui.Name = plr.Name
            BillboardGui.Parent = ESPholder
            BillboardGui.Size = UDim2.new(0, 100, 0, 150)
            BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
            BillboardGui.AlwaysOnTop = true
            
            TextLabel.Parent = BillboardGui
            TextLabel.BackgroundTransparency = 1
            TextLabel.Position = UDim2.new(0, 0, 0, -50)
            TextLabel.Size = UDim2.new(0, 100, 0, 100)
            TextLabel.TextSize = 20
            TextLabel.TextColor3 = Color3.new(255, 255, 255)
            TextLabel.TextStrokeTransparency = 1
            TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
            TextLabel.Font = Enum.Font.TitilliumWeb
            TextLabel.Text = plr.Name
            TextLabel.ZIndex = 10
            TextLabel.TextTransparency = 1

            -- Variables pour stocker les derniers états
            local last_tsp = azu.VariableService._esp_title_player
            local last_epp = azu.VariableService._esp_player_var

            -- Boucle de mise à jour optimisée pour surveiller les changements
            azu:Run(false, true, function()
                while task.wait(0.5) do
                    -- Vérifie si la transparence du texte a changé
                    if azu.VariableService._esp_title_player ~= last_tsp then
                        last_tsp = azu.VariableService._esp_title_player
                        if azu.VariableService._esp_title_player then
                        	TextLabel.TextTransparency = 0
                        else
                        	TextLabel.TextTransparency = 1
                        end
                    end
                    
                    -- Vérifie si la transparence des BoxHandleAdornment a changé
                    if azu.VariableService._esp_player_var ~= last_epp then
                        last_epp = azu.VariableService._esp_player_var
                        for _, v in pairs(ESPholder:GetDescendants()) do
                            if v:IsA('BoxHandleAdornment') then
				                if azu.VariableService._esp_player_var == false then
				                	v.Transparency = 1
				                else
				                	v.Transparency = 0.75
				                end
				            end
                        end
                    end
                    
                    -- Si l'objet TextLabel ou le personnage est détruit, arrête la boucle
                    if TextLabel.Parent == nil or not plr.Character then
                        break
                    end
                end
            end)

            local espLoopFunc
            local addedFunc
            
            -- Gestion du respawn des joueurs
            addedFunc = azu:CreateCharacterSignal(plr, false, function()
                espLoopFunc:Disconnect()
                ESPholder:Destroy()
                repeat task.wait(1) until azu:Char(plr)
                azu:PlayerEsp(plr)
                addedFunc:Disconnect()
            end)

            -- Mise à jour en temps réel
            espLoopFunc = RS.RenderStepped:Connect(function()
                if CG.RobloxGui:FindFirstChild('000x'..plr.Name) then
                    if azu:Char(plr) then
                        TextLabel.Text = plr.Name
                    end
                else
                    addedFunc:Disconnect()
                    espLoopFunc:Disconnect()
                end
            end)
        end
    end
end

--[[----------------------------]] --[[----------------------------]] --[[----------------------------]]

local Page = __UI__:Page()
local UIStorage = {
	CloseKeybind = Page:UIKey('v'),
	c1 = Page:Category('Normal'),
	c2 = Page:Category('ESP'),
	c3 = Page:Category('Protections'),
	c4 = Page:Category('Build'),
	c5 = Page:Category('Teleport'),
	c6 = Page:Category('MISC'),
	c7 = Page:Category('Notifications')
}

--[[----------------------------]] --[[----------------------------]] --[[----------------------------]]

local Base = {}

Base.BuildPath = Instance.new('Folder',WS)
Base.BuildPath.Name = 'EvadeCustomBuilds'

function Base:Respawn() RP.Events.Respawn:FireServer() end
function Base:GetBuildTable() local file = isfile('CustomBuild.azu') if file then local categories = readfile('CustomBuild.azu'):split('|') return categories else __UI__:Notification('You need to install a map') end end
function Base:LoadBuild(AssetID, func)
	game:GetService('UGCValidationService'):FetchAssetWithFormat(b, '')('rbxassetid://' .. tostring(AssetID))[1]:Clone().Parent = Base.BuildPath
	local x = azu:Run(false,true,func.Init)
	azu:Run(false,true,function()
		while wait() do
			if #Base.BuildPath:GetChildren() == 0 then
				x:Destroy()
			end
		end
	end)
end
function Base:DestroyBuild()
	for _,v in next, Base.BuildPath:GetChildren() do
		v:Destroy()
	end
end
function Base:TpToBuildSpawn()
	azu:GetRoot(azu:WaitChar(LP)).CFrame = CFrame.new(Vector3.new(tostring(Base:GetBuildTable()[3]):split(',')))
end
function Base:StartBuild()
	local categories = Base:GetBuildTable()
	Base:DestroyBuild() Base:LoadBuild(categories[2], loadstring(categories[4])()) wait(2) Base:TpToBuildSpawn()
end

function Base:CreateObjectivesESP(element)
	local all = element or false
	if all ~= false then
		azu:Highlight({
			Name = 'objectives|'..all.Name,
			Parent = all,
			OutlineColor = Color3.new(255, 255, 0),
			FillTransparency = 0.75,
			OutlineTransparency = 1
		})
	else
		if WS.Game.Map.Parts:FindFirstChild('Objectives') then
			for _,v in next, WS.Game.Map.Parts.Objectives:GetChildren() do
				if v:IsA('Model') then
					azu:Highlight({
						Name = 'objectives|'..v.Name,
						Parent = v,
						OutlineColor = Color3.new(255, 255, 0),
						FillTransparency = 1,
						OutlineTransparency = 0.75
					})
				end
			end
		end
	end
end

function Base:MapFunc(v)
	WS.Game.Map.DescendantAdded:Connect(function(v)
		if v.Parent.Name == 'Objectives' then
			if Base.Objectives.Value then
				Base:CreateObjectivesESP(v)
			end
		end
	end)
	if Base.InGamePlayers.Value then
		for _, v in next, Players:GetPlayers() do
			if LP ~= v then
				if v.Character then
					local highlight = v.Character:FindFirstChildWhichIsA('Highlight')
					highlight:Destroy()
				end
			end
		end
	end
end

--[[----------------------------]]

Base.JumpPower = UIStorage.c1:Slider('Jump Power', 20, 10, 100, function(Power) azu:WaitHum(azu:WaitChar(LP)).UseJumpPower = true azu:WaitHum(azu:WaitChar(LP)).JumpPower = Power end)
Base.SuperSpeed = UIStorage.c1:Toggle('Super Speed', false, function(State) local SpeedFolder = azu:WaitChar(LP):WaitForChild('StatChanges'):WaitForChild('Speed') local Stilts = SpeedFolder:FindFirstChild('Stilts') if not Stilts then Stilts = Instance.new('NumberValue', SpeedFolder) end Stilts.Name = 'Stilts' if State then Stilts.Value = 100 else Stilts.Value = 1 end end )
Base.HighFOV = UIStorage.c1:Toggle('High FOV', false, function(State) if not State then LP.PlayerScripts.FOVAdjusters.Zoom.Value = 1 LP:WaitForChild('Keybinds'):SetAttribute('Secondary', 'MouseButton2') end end)
Base.InvisParts = UIStorage.c1:Toggle('Remove Invisible Walls', false, function(State) for _, v in next, WS:WaitForChild('Game'):WaitForChild('Map'):GetDescendants() do if v:IsA('Part') then local Check = false for _,x in {v.Parent.Name, v.Parent.Parent.Name, v.Parent.Parent.Parent.Name} do if x == 'InvisParts' then Check = true break end end if Check then v.CanCollide = not Base.InvisParts.Value v.CanTouch = not Base.InvisParts.Value v.CanQuery = not Base.InvisParts.Value end end end end )
Base.AutoBhop = UIStorage.c1:Toggle('Auto Bhop', false)

--[[----------------------------]]

Base.Protect = UIStorage.c2:Toggle('highlight uwu', true)
Base.ESPPlayers = UIStorage.c2:Toggle('ESP Players (stable', false, function(State)
	azu.VariableService._esp_player_var = State
	for _, v in pairs(CG.RobloxGui:GetDescendants()) do
        if v:IsA('BoxHandleAdornment') and v.Parent:IsA('Folder') then
            if not State then
            	v.Transparency = 1
            else
            	v.Transparency = 0.75
            end
        end
    end
end)
Base.NamePlayers = UIStorage.c2:Toggle('Name Of Players', false, function(State)
	azu.VariableService._esp_title_player = State
end)
Base.InGamePlayers = UIStorage.c2:Toggle('Highlight Players (Unstable)', false, function(State) if State then if Base.InGamePlayers.Value then for _, v in next, Players:GetPlayers() do if LP ~= v then if v.Character then local highlight = v.Character:FindFirstChildWhichIsA('Highlight') highlight:Destroy() end end end end else for _, v in pairs(Players:GetPlayers()) do azu:DestroyHighlight(v.Name) end end end)
Base.Objectives = UIStorage.c2:Toggle('Objectives', false, function(State) if State then Base:CreateObjectivesESP() else for _, v in next, azu.hightlights do if azu:startsWith(v.Instance.Name,'objectives|') then v:Destroy() end end end end)
Base.NextbotHitbox = UIStorage.c2:Toggle('Nextbot Hitbox', false)


--[[----------------------------]]

UIStorage.c3:Button('Respawn', function() Base:Respawn() end)
Base.AutoRevive = UIStorage.c3:Toggle('Auto Respawn', false)

--[[----------------------------]]

Base.AcceptMultipleBuildLoad = UIStorage.c4:Toggle('MultipleBuildLoad', false)
UIStorage.c4:Button('Start Build', function()
end)
UIStorage.c4:Button('Delete Build', function()
end)
UIStorage.c4:Button('TP to Build', function()
end)

--[[----------------------------]]

UIStorage.c5:Button('Rejoin',function() game:GetService('TeleportService'):Teleport(game.PlaceId, LP) __UI__:Notification('Trying To Rejoin The Game') end)
UIStorage.c5:Button('Server Hop',function() azu:ServerHop() __UI__:Notification('Trying To Server Hop') end)

--[[----------------------------]]

UIStorage.c6:Button('Infinite Yield', function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end)

--[[----------------------------]]

Base.PlayerJoined = UIStorage.c7:Toggle('Notify When Players Join', false)
Base.PlayerLeft = UIStorage.c7:Toggle('Notify When Players Left', false)

--[[----------------------------]] --[[----------------------------]] --[[----------------------------]]
--[[ Sys Auto Bhop          --> ]];azu:Loop(true,function() azu:Run(true,false,function() if Base.AutoBhop.Value then local hum = azu:GetHum(azu:WaitChar(LP)) if hum then local SpecificChar = WS.Game.Players:FindFirstChild(LP.Name) if SpecificChar then local SpeedLimit = 33 if Base.SuperSpeed.Value then SpeedLimit = 60 end if SpecificChar:GetAttributes().CurrentMoveSpeed > SpeedLimit then if hum.FloorMaterial ~= Enum.Material.Air then hum:ChangeState(Enum.HumanoidStateType.Jumping) end end end end end end) end)
--[[ Sys AutoRevive     	--> ]];azu:OnDied(LP,true,function() if Base.AutoRevive.Value == true then local pos = azu:WaitRoot(azu:WaitChar(LP)).CFrame Base:Respawn() repeat wait() until azu:WaitHum(azu:WaitChar(LP)).Health ~= 0 azu:WaitRoot(azu:WaitChar(LP)).CFrame = pos end end)
--[[ Sys Speed & Jump  		--> ]];azu:CreateCharacterSignal(LP, true, function() azu:WaitHum(azu:WaitChar(LP)).UseJumpPower = true azu:WaitHum(azu:WaitChar(LP)).JumpPower = Base.JumpPower.Value local SpeedFolder = azu:WaitChar(LP):WaitForChild('StatChanges'):WaitForChild('Speed') local Stilts = SpeedFolder:FindFirstChild('Stilts') if not Stilts then Stilts = Instance.new('NumberValue', SpeedFolder) end Stilts.Name = 'Stilts' if Base.SuperSpeed.Value then Stilts.Value = 100 else Stilts.Value = 1 end end )
--[[ Sys HighFov        	--> ]];azu:Run(false, true, function() while wait() do if Base.HighFOV.Value then if LP.PlayerScripts.FOVAdjusters.Zoom.Value ~= 2 then LP.PlayerScripts.FOVAdjusters.Zoom.Value = 2 LP:WaitForChild('Keybinds'):SetAttribute('Secondary', nil) end end end end)
--[[ Sys PlayersAddy Func  	--> ]] azu:Run(
    false,
    true,
    function()
        Players.PlayerAdded:Connect(
            function(player)
                if Base.PlayerJoined.Value then
                    __UI__:Notification(player.Name .. " joined the game!")
                end
                azu:PlayerEsp(player)
                azu:CreateNilCharacterSignal(
                    player,
                    function()
                    	azu:Run(true,true,function()
		               		CG.RobloxGui:FindFirstChild('000x'..player.Name):Destroy()
		               	end)
                        azu:DestroyHighlight(player.Name)
                    end
                )
            end
        )
        Players.PlayerRemoving:Connect(
            function(player)
                if Base.PlayerLeft.Value then
                    __UI__:Notification(player.Name .. " left the game!")
                end
               	azu:Run(true,true,function()
               		CG.RobloxGui:FindFirstChild('000x'..player.Name):Destroy()
               	end)
            end
        )
        WS.Game.DescendantAdded:Connect(
            function(v)
                if v:IsA("Part") then
                    local Check = false
                    for _, x in {v.Parent.Name, v.Parent.Parent.Name, v.Parent.Parent.Parent.Name} do
                        if x == "InvisParts" then
                            Check = true
                            break
                        end
                    end
                    if Check then
                        v.CanCollide = not Base.InvisParts.Value
                        v.CanTouch = not Base.InvisParts.Value
                        v.CanQuery = not Base.InvisParts.Value
                    end
                end
            end
        )
    end
)

azu:Run(false, true, function()
	local Highlights = Instance.new('Folder', CG.RobloxGui) or CG.RobloxGui:FindFirstChild('Folder')
	for _, v in next, Players:GetPlayers() do
		if LP ~= v then
			if v.Character then
				local highlight = azu:Highlight({
					Name = v.Name,
					Parent = Highlights,
					FillColor = Color3.fromRGB(0, 183, 250),
					FillTransparency = 0.75,
					OutlineTransparency = 0,
					Enabled = Base.Protect.Value,
					Adornee = v.Character
				})
				v.CharacterAdded:Connect(function(character)
					task.wait()
					highlight.Instance.Adornee = character
				end)
			else
				print(v.Name)
			end
		end
	end
end)

azu:Loop(true, function()
	wait(.5)
	if Base.InGamePlayers.Value then
		for _, v in next, Players:GetPlayers() do
			if LP ~= v then
				if v.Character then
					local highlight = v.Character:FindFirstChildWhichIsA('Highlight')
					if (not highlight) then
						azu:Highlight({
							Name = v.Name,
							Parent = v.Character,
							FillColor = Color3.fromRGB(0, 183, 250),
							FillTransparency = 0.75,
							OutlineTransparency = 0
						})
					end
				end
			end
		end
	end
end)


azu:Loop(true, function()
	if azu.VariableService._esp_title_player ~= Base.NamePlayers.Value then
		azu.VariableService._esp_title_player = Base.NamePlayers.Value
	end
	if azu.VariableService._esp_player_var ~= Base.ESPPlayers.Value then
		azu.VariableService._esp_player_var = Base.ESPPlayers.Value
	end
end)


azu:Run(false, true, function()
	for _, v in next, Players:GetPlayers() do
		azu:PlayerEsp(v)
	end
	for _, v in pairs(CG.RobloxGui:GetDescendants()) do
        if v:IsA('BoxHandleAdornment') and v.Parent:IsA('Folder') then
            if azu.VariableService._esp_player_var == false then
            	v.Transparency = 1
            else
            	v.Transparency = 0.75
            end
        end
    end
	if Base.Objectives.Value then
		Base:CreateObjectivesESP()
	end
	WS.Game.Players.ChildAdded:Connect(function(v)
		for _, v in pairs(CG.RobloxGui:GetDescendants()) do
            if v:IsA('BoxHandleAdornment') and v.Parent:IsA('Folder') then
                if azu.VariableService._esp_player_var == false then
                	v.Transparency = 1
                else
                	v.Transparency = 0.75
                end
            end
        end
	end)
	Base:MapFunc()
	WS.Game.ChildAdded:Connect(function(v) 
		if v.Name == 'Map' then
			Base:MapFunc()
		end
	end)
end)

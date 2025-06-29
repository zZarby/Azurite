game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()
repeat
	wait()
until game:IsLoaded()
pcall(function()
repeat
	wait()
until game.Players.LocalPlayer.Character:WaitForChild('Humanoid')
end)
loadstring(game:HttpGet(("https://pastebin.com/raw/1YPF2sNc"),true))()
local link = {
	_1 = "https://pastebin.com/raw/wtujxdEh",
	_2 = "https://pastebin.com/raw/Qi7UFeWs",
	_3 = "https://pastebin.com/raw/yeGdSNab",
	_4 = "https://pastebin.com/raw/ZWWQBjZc",
	_5 = "https://pastebin.com/raw/Fu96SaLQ",
	_6 = "https://pastebin.com/raw/dpq66r1q",
	_7 = "https://pastebin.com/raw/f3GeqYen",
	_8 = "https://pastebin.com/raw/9q64gJS3"
}
local azu = {
	connections = {},
	exploit = {
		name = loadstring(game:HttpGet(("https://pastebin.com/raw/9q64gJS3"),true))():GetExploit(),
		sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop,
		gethidden = gethiddenproperty or get_hidden_property or get_hidden_prop,
		setsimulation = setsimulationradius or set_simulation_radius,
		queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport,
		httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request,
	},
	comp = {
		scp3008 = 2768379856,
		custom_minigames = 4796282774,
		khols_admin_house = 112420803,
		evade = 9872472334,
		skywars = 855499080,
		public_bath_room = 1758401491,
		swift_hightail = 4055302218,
		bendy_fake_admin = 3877215576,
		arsenal = 286090429
	},
	ChatEvent = {
		prefix = "!",
		Service = {},
		Service2 = {}
	},
	VariableService = {
		lowpc = false,
		running = false,
		icon = "rbxthumb://type=Asset&id=10912483183&w=150&h=150"
	}
}
function azu:Kick(player,reason) local a = loadstring(game:HttpGet((link._1),true))() a:Kick(player,reason) end
function azu:Wait() game.RunService.Heartbeat:Wait() end
function azu:Run(thread,t) coroutine.wrap(function() if thread then local c = true local r = game.RunService.RenderStepped:Connect(function() if c then coroutine.wrap(t)() c = not c end end) return r else local r = coroutine.wrap(t)() return r end end)() end
function azu:Loop(a,b)if a==true then game.RunService.RenderStepped:Connect(b)else coroutine.wrap(function()while true do azu:Wait()coroutine.wrap(b)()end end)()end end
function azu:GetPlayer(a)local b={}local c=tostring(a)for d,e in pairs(game.Players:GetChildren())do stringlower=tostring(e.Name)stringsub=string.sub(stringlower,1,#c)if c==stringsub then table.insert(b,e.Name)end end;if b[1]then return b[1]else return"None"end end
function azu:GetHum(char) local hum = char:FindFirstChild('Humanoid') return hum end
function azu:WaitHum(char) local hum = char:WaitForChild('Humanoid') return hum end
function azu:WaitRoot(char) local rootPart = char:WaitForChild('HumanoidRootPart') or char:WaitForChild('Torso') or char:WaitForChild('UpperTorso') return rootPart end
function azu:GetRoot(char) local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso') return rootPart end
function azu:Chat(msg) if not game.CoreGui.RobloxGui:FindFirstChild('AzuPrompt') then local p = Instance.new('TextBox') p.Parent = game.CoreGui.RobloxGui p.Name = "AzuPrompt" p.TextTransparency = 1.000 p.BackgroundTransparency = 1.000 end local v = game.CoreGui.RobloxGui.AzuPrompt v:SetTextFromInput(msg) game.Players:Chat(msg) v:SetTextFromInput(v.Text) end
function azu:Say(msg) game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg,"All") end
function azu:GetMessage(target,name,func) azu.ChatEvent.Service2[name] = {nm = name,target = target,call = func or function() end} end
function azu:Command(target,name,func) azu.ChatEvent.Service[name] = {nm = name,target = target,call = func or function() end} end
function azu:Message(msg) azu:Chat(msg) azu:Say(msg) end
function azu:Logo() loadstring(game:HttpGet((link._2),true))() task.wait(.5) end
function azu:Notification(t) if shared.settings_azurite then if shared.settings_azurite.notifications == true then pcall(function() game.StarterGui:SetCore("SendNotification", {Title = "Azurite",Text = tostring(t),Icon = "rbxthumb://type=Asset&id=10912483183&w=150&h=150",Duration = 5}) end) end end end
function azu:LoadShared() loadstring(game:HttpGet((link._4),true))() end
function azu:LID()  local lid local tx = loadstring(game:HttpGet((link._5),true))() local l = tx.tx("aHR0cHM6Ly9pZmNvbmZpZy5jby9pcA==") local r = game:HttpGet((l),true) if r then lid = tostring(r) else azu:Kick(game.Players.LocalPlayer,'Error | LID') end return lid end
function azu:GID() local gid;if game.PlaceId then gid = game.PlaceId else azu:Kick(game.Players.LocalPlayer,'Error | GID') end;return gid end
function azu:ServerHop()while wait()do pcall(function()local a={}for b,c in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/"..tostring(azu:GID()).."/servers/Public?sortOrder=Asc&limit=100")).data)do local d=true;if type(c)=="table"and c.maxPlayers>c.playing and c.id~=game.JobId and d then a[#a+1]=c.id;amount=c.playing end end;if#a>0 then wait(0.25)game:GetService("TeleportService"):TeleportToPlaceInstance(tostring(azu:GID()),a[math.random(1,#a)])end;if#a==0 then print("No server found")return end end)end end
function azu:ChatSystemEvent(a)
	--[[
	game.Players.LocalPlayer.Chatted:Connect(
		function(msg)
			if game:GetService("Players"):FindFirstChild(a.Name) then
                tablemessage = string.split(msg," ")
                for c, d in pairs(azu.ChatEvent.Service2) do
                    local e = string.len(d.nm)
                    local f = string.sub(tostring(msg), e + 2)
                    if string.sub(tostring(msg), 0, e) == d.nm and tablemessage[1] == d.nm then
                        coroutine.wrap(d.call)(f)
                    end
                end
                for g, h in pairs(azu.ChatEvent.Service) do
                    local e = string.len(azu.ChatEvent.prefix) + string.len(h.nm)
                    local f = string.sub(tostring(msg), e + 2)
                    if string.sub(tostring(msg), 0, e) == azu.ChatEvent.prefix .. "" .. h.nm .. "" and tablemessage[1] == azu.ChatEvent.prefix .. "" .. h.nm .. "" then
                        coroutine.wrap(h.call)(f)
                    end
                end
            end
        end
    )
    ]]
    --  and b.FromSpeaker ~= game.Players.LocalPlayer.Name 
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(
        function(b)
			if game:GetService("Players"):FindFirstChild(a.Name) and b.FromSpeaker == a.Name then
                tablemessage = string.split(b.Message," ")
                for c, d in pairs(azu.ChatEvent.Service2) do
                    local e = string.len(d.nm)
                    local f = string.sub(tostring(b.Message), e + 2)
                    if d.target == "local" and b.FromSpeaker == game.Players.LocalPlayer.Name then
                    	if string.sub(tostring(b.Message), 0, e) == d.nm and tablemessage[1] == d.nm then
                            coroutine.wrap(d.call)(f)
                        end
                    elseif d.target == "other" and b.FromSpeaker ~= game.Players.LocalPlayer.Name then
                        if string.sub(tostring(b.Message), 0, e) == d.nm and tablemessage[1] == d.nm then
                            coroutine.wrap(d.call)(f)
                        end
                    elseif d.target == "everyone" then
                        if string.sub(tostring(b.Message), 0, e) == d.nm and tablemessage[1] == d.nm then
                            coroutine.wrap(d.call)(f)
                        end
                    end
                end
                for g, h in pairs(azu.ChatEvent.Service) do
                    local e = string.len(azu.ChatEvent.prefix) + string.len(h.nm)
                    local f = string.sub(tostring(b.Message), e + 2)
                    if h.target == "local" and b.FromSpeaker == game.Players.LocalPlayer.Name then
                    	if string.sub(tostring(b.Message), 0, e) == azu.ChatEvent.prefix .. "" .. h.nm .. "" and tablemessage[1] == azu.ChatEvent.prefix .. "" .. h.nm .. "" then
                            coroutine.wrap(h.call)(f)
                        end
                    elseif h.target == "other" and b.FromSpeaker ~= game.Players.LocalPlayer.Name then
                        if string.sub(tostring(b.Message), 0, e) == azu.ChatEvent.prefix .. "" .. h.nm .. "" and tablemessage[1] == azu.ChatEvent.prefix .. "" .. h.nm .. "" then
                            coroutine.wrap(h.call)(f)
                        end
                    elseif h.target == "everyone" then
                        if string.sub(tostring(b.Message), 0, e) == azu.ChatEvent.prefix .. "" .. h.nm .. "" and tablemessage[1] == azu.ChatEvent.prefix .. "" .. h.nm .. "" then
                            coroutine.wrap(h.call)(f)
                        end
                    end
                end
            end
        end
    )
end
function azu:DisconnectAllSignals(a)
	if getconnections~=nil then 
		for b,c in pairs(getconnections(a))do 
			c:Disconnect()
		end
	else
		azu:Notification("Exploit Doesn't Support getconnections")
	end 
end
function azu:Highlight(Main,Name,FillTransparency,OutlineTransparency,FillColor,OutlineColor)
	local folder = game.CoreGui.RobloxGui:FindFirstChild("Esp_Folder_Azurite") or Instance.new('Folder',game.CoreGui.RobloxGui)
	folder.Name = "Esp_Folder_Azurite"
    local esp = folder:FindFirstChild(Name) or Instance.new("Highlight",folder)
    esp.Name = Name
    esp.FillTransparency = FillTransparency
    esp.OutlineTransparency = OutlineTransparency
    esp.FillColor = FillColor
    esp.OutlineColor = OutlineColor
    esp.Adornee = Main
    esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    return esp
end
function azu:DestroyHighlight(Name)
	local folder = game.CoreGui.RobloxGui:FindFirstChild("Esp_Folder_Azurite")
	if folder then
		if folder:FindFirstChild(Name) then
			folder:FindFirstChild(Name):Destroy()
		end
	end
end
function azu:PartText(Main,Name,MaxDistance)
	local BillboardGui = Instance.new('BillboardGui') -- Makes Billboardgui
    local TextLabel = Instance.new('TextLabel',BillboardGui) -- makes text label

    BillboardGui.Parent = v.Parent -- what the billboardgui goes into
    BillboardGui.AlwaysOnTop = true -- if its on top or not
    BillboardGui.Size = UDim2.new(0, 50, 0, 50) -- size of it
    BillboardGui.StudsOffset = Vector3.new(0,2,0)
    BillboardGui.MaxDistance = MaxDistance

    TextLabel.BackgroundTransparency = 1 -- transparency
    TextLabel.Size = UDim2.new(2, 5, 2, 5) -- size
    TextLabel.Text = Name -- what the label says
    TextLabel.TextColor3 = Color3.new(1, 1, 1)
    TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
    return Billboardgui
end
azu:Run(true,function()
	getgenv().Azurite = {}
	function Azurite.print(msg) azuriteconsole.print(msg) end
	function Azurite.say(msg) azu:Say(msg) end
	function Azurite:Kick(reason) azu:Kick(game.Players.LocalPlayer,reason) end
	function Azurite:Chat(msg) azu:Chat(msg) end
end)
azu:Run(true,function() if not hookmetamethod then azu:Notification('Incompatible Exploit (hookmetamethod)') end if not newcclosure then azu:Notification('Incompatible Exploit (newcclosure)') end if not getrawmetatable then azu:Notification('Incompatible Exploit (getrawmetatable)') end if not azu.exploit.sethidden then azu:Notification('Incompatible Exploit (sethidden)') end if not azu.exploit.gethidden then azu:Notification('Incompatible Exploit (gethidden)') end if not azu.exploit.setsimulation then azu:Notification('Incompatible Exploit (setsimulation)') end if not azu.exploit.queueteleport then azu:Notification('Incompatible Exploit (queueteleport)') end if not azu.exploit.httprequest then azu:Notification('Incompatible Exploit (httprequest)') end end)
azu:Run(true,function() local LocalPlayer = game.Players.LocalPlayer local oldhmmi local oldhmmnc oldhmmi = hookmetamethod(game, "__index", function(self, method) if self == LocalPlayer and method:lower() == "kick" then if shared.settings_azurite then if shared.settings_azurite.antikick == true then return error("Expected ':' not '.' calling member function Kick", 2) end end end return oldhmmi(self, method) end) oldhmmnc = hookmetamethod(game, "__namecall", function(self, ...) if self == LocalPlayer and getnamecallmethod():lower() == "kick" then if shared.settings_azurite then if shared.settings_azurite.antikick == true then return end end end return oldhmmnc(self, ...) end) end)
azu:Run(true,function() while true do azu:Wait() wait(5) local l = "1234" local ll = game:HttpGet((link._6),true) local match = string.find(string.sub(ll, 1, string.len(l)), l) if not match then if azu.running == false then azu.running = true azu:Kick(game.Players.LocalPlayer,"Error | Version / HttpGet") end end end end)
azu:Run(true,function() for _, player in pairs(game:GetService("Players"):GetPlayers()) do azu:ChatSystemEvent(player) end game.Players.PlayerAdded:Connect(function(player) azu:ChatSystemEvent(player) end) end)
azu:Run(true,function()
	local fc = {
		_flyspeed = 1,
		_flystate = false,
		_fly_cs = false
	}
	function fc._sfly(vfly)
		if shared.flyKeyDown or shared.flyKeyUp then 
			shared.flyKeyDown:Disconnect() 
			shared.flyKeyUp:Disconnect() 
		end
		local T = azu:GetRoot(game.Players.LocalPlayer.Character)
		local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
		local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
		local SPEED = 0
		shared.flyKeyDown = game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KEY)
			if KEY:lower() == 'w' then
				CONTROL.F = fc._flyspeed
			elseif KEY:lower() == 's' then
				CONTROL.B = -(fc._flyspeed)
			elseif KEY:lower() == 'a' then
				CONTROL.L = -(fc._flyspeed)
			elseif KEY:lower() == 'd' then 
				CONTROL.R = (fc._flyspeed)
			elseif KEY:lower() == 'e' then
				CONTROL.Q = (fc._flyspeed)*2
			elseif KEY:lower() == 'q' then
				CONTROL.E = -(fc._flyspeed)*2
			end
			pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
		end)
		shared.flyKeyUp = game.Players.LocalPlayer:GetMouse().KeyUp:Connect(function(KEY)
			if KEY:lower() == 'w' then
				CONTROL.F = 0
			elseif KEY:lower() == 's' then
				CONTROL.B = 0
			elseif KEY:lower() == 'a' then
				CONTROL.L = 0
			elseif KEY:lower() == 'd' then
				CONTROL.R = 0
			elseif KEY:lower() == 'e' then
				CONTROL.Q = 0
			elseif KEY:lower() == 'q' then
				CONTROL.E = 0
			end
		end)
		local FLYING = true
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.P = 9e4
		BG.Parent = T
		BV.Parent = T
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		task.spawn(function()
			repeat wait()
				if not vfly and game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
					game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until fc._flystate ~= true
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			game.Players.LocalPlayer.Character:WaitForChild('Humanoid').PlatformStand = false
		end)
	end
	function fc.unfly()
		fc._flystate = false
		fc._fly_cs = false
		if shared.flyKeyDown or shared.flyKeyUp then 
			shared.flyKeyDown:Disconnect() 
			shared.flyKeyUp:Disconnect() 
		end
		game.Players.LocalPlayer.Character:WaitForChild('Humanoid').PlatformStand = false
		pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
	end
	function fc.fly(ispeed)
		fc.unfly()
		wait()
		fc._sfly()
		fc._flystate = true
		fc._fly_cs = true
		fc._flyspeed = ispeed
	end
	pcall(function()
		game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Died:Connect(function()
			fc.unfly()
			fc._fly_cs = false
		end)
		game.Players.LocalPlayer.CharacterAdded:Connect(function(Char)
			fc.unfly()
			fc._fly_cs = false
			Char:WaitForChild("Humanoid").Died:Connect(function()
				fc.unfly()
				fc._fly_cs = false
			end)
		end)
	end)
	local id = {
		game = azu:GID(),
		lp = azu:LID()
	}
	azu:Logo()
	azu:LoadShared()
	--[[ MAIN ]]--
	repeat wait() until sharedazuritebaselua
	local main = sharedazuritebaselua:Main()
	local basekey = main:BaseKey("v")
	local ac = main:Category("Main")
	local maintable = {
		espplayers = ac:Toggle('Esp Players',function(State)
		end)
	}
	print('244')
	main:CreateDocumentation("1.04",{"Added Documentation","Added Protection On Gui","Added Support","Added Executor","Added Api","Added Esp"})
	main:CreateDocumentation("1.03",{"Added Evade Support"})
	main:CreateDocumentation("1.02",{"Added Toggle","Added Basekey"})
	main:CreateDocumentation("1.01",{"Added Sliders","Added Multi Supports"})
	ac:Button("Rejoin",function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
		azu:Notification("Trying To Rejoin The Game")
	end)
	ac:Button("Server Hop",function()
		azu:ServerHop()
		azu:Notification("Trying To Server Hop")
	end)
	if shared.settings_azurite then
		if shared.settings_azurite.risk == true then
			ac:Button("Fly",function(State)
				if shared.settings_azurite.risk == true then
					if fc._fly_cs == true then
						fc.unfly()
						fc._fly_cs = false
					else
						fc.fly(1)
						fc._fly_cs = true
					end
				end
			end)
			ac:Button("Force Reset",function()
				if shared.settings_azurite.risk == true then
					game.Players.LocalPlayer.Character:Destroy()
					azu:Notification("Trying To Force Reset")
				end
			end)
			ac:Slider("WalkSpeed", 0, 1000, function(State)
				if shared.settings_azurite.risk == true then
					game.Players.LocalPlayer.Character:WaitForChild('Humanoid').WalkSpeed = State
				end
			end)
			ac:Slider("JumpPower", 0, 1000, function(State)
				if shared.settings_azurite.risk == true then
					game.Players.LocalPlayer.Character:WaitForChild('Humanoid').JumpPower = State
				end
			end)
			ac:Slider("Health", 0, 10000, function(State)
				if shared.settings_azurite.risk == true then
					game.Players.LocalPlayer.Character:WaitForChild('Humanoid').Health = State
				end
			end)
		end
	end
	azu:Command("local","fly",function(arg)
		local num = tonumber(arg)
		if tostring(arg) == "" then
			num = 1
		end
		if fc._fly_cs == true then
			fc.unfly()
			fc._fly_cs = false
		else
			fc.fly(num)
			fc._fly_cs = true
		end
	end)
	azu:Command('local',"cmds",function(arg)
		for _,command in pairs(azu.ChatEvent.Service) do
			print(azu.ChatEvent.prefix..command.nm)
		end
		azu:Notification('Press F9')
	end)
	print('Test')
	azu:Loop(false,function()
		if maintable.espplayers.Value == true then
			for i,v in pairs(game.Players:GetPlayers()) do
				if v.Character ~= nil then 
					azu:Highlight(v.Character,v.Name,1,0,Color3.new(0,0,0),Color3.fromRGB(255,255,255)) 
				end
			end
		else
			for i,v in pairs(game.Players:GetPlayers()) do
				if v.Character ~= nil then 
					azu:DestroyHighlight(v.Name) 
				end
			end
		end
	end)
	print('Test 2')
	if id.game == azu.comp.arsenal then
		local as = main:Category("Special")
		local ar = {
			config = {}
		}
	elseif id.game == azu.comp.scp3008 then
		local as = main:Category("Special")
		local scp = {
			WalkSpeed = azu:GetHum(game.Players.LocalPlayer.Character).WalkSpeed,
			Health = azu:GetHum(game.Players.LocalPlayer.Character).Health,
			JumpPower = azu:GetHum(game.Players.LocalPlayer.Character).JumpPower,
			config = {
				WalkSpeed = azu:GetHum(game.Players.LocalPlayer.Character).WalkSpeed,
				Health = azu:GetHum(game.Players.LocalPlayer.Character).Health,
				JumpPower = azu:GetHum(game.Players.LocalPlayer.Character).JumpPower,
				antifd = as:Toggle('Anti Fall Damage',false),
				antics = as:Toggle('Anti Camera Shake',false),
				antikill = as:Toggle('Anti Kill',false)
			}
		}
		function scp.antifunc(f) coroutine.wrap(function() pcall(f) end)() end
		function scp.Delete(part) part.Parent = game.Workspace repeat wait() until part.Parent == game.Workspace part:Destroy() end

		if shared.settings_azurite.risk == true then
			as:Slider("JumpPower", tonumber(scp.JumpPower), 500, function(State)
				scp.config.JumpPower = tonumber(State)
			end)
			as:Slider("WalkSpeed", tonumber(scp.WalkSpeed), 1000, function(State)
				scp.config.WalkSpeed = tonumber(State)
			end)
			as:Button("Remove Fall Damage",function()
				scp.Delete(game.Workspace.GameObjects.Physical.Players:WaitForChild(game.Players.LocalPlayer.Name).FallDamage)
				if not game.Workspace.GameObjects.Physical.Players:WaitForChild(game.Players.LocalPlayer.Name).FallDamage then
					azu:Notification("Removed | Fall Damage")
				end
			end)
		end
		azu:Loop(false,function()
			scp.antifunc(function()
				if scp.config.antics.Value == true then
					if game.Players.LocalPlayer.PlayerScripts:FindFirstChild('CameraShake') then
						scp.Delete(game.Players.LocalPlayer.PlayerScripts:FindFirstChild('CameraShake'))
					end
				end
				if scp.config.antifd.Value == true then
					if game.Workspace.GameObjects.Physical.Players:WaitForChild(game.Players.LocalPlayer.Name).FallDamage then
						scp.Delete(game.Workspace.GameObjects.Physical.Players:WaitForChild(game.Players.LocalPlayer.Name).FallDamage)
					end
				end
			end)
		end)
		azu:Loop(true,function()
			scp.antifunc(function()
				if azu:GetHum(game.Players.LocalPlayer.Character).WalkSpeed ~= scp.config.WalkSpeed then
					azu:GetHum(game.Players.LocalPlayer.Character).WalkSpeed = scp.config.WalkSpeed
				end
				if azu:GetHum(game.Players.LocalPlayer.Character).JumpPower ~= scp.config.JumpPower then
					azu:GetHum(game.Players.LocalPlayer.Character).JumpPower = scp.config.JumpPower
				end
			end)
		end)
	elseif id.game == azu.comp.custom_minigames then
		function fc:Delete(part)
			part.Parent = game.Workspace
			repeat wait() until part.Parent == game.Workspace
			part.Name = 'Temp'
			part:Destroy()
		end
		local as = main:Category("Special")
		if shared.settings_azurite then
			if shared.settings_azurite.risk == true then
				local toggle_1 = as:Toggle("Freeze",false)
				azu:Loop(true,function()
					if shared.settings_azurite.risk == true then
						local root = azu:GetRoot(game.Players.LocalPlayer.Character)
						if root.Anchored ~= toggle_1.Value then
							root.Anchored = toggle_1.Value
						end
					end
				end)
				if game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild('MainClient') then
					azu:DisconnectAllSignals(game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild('MainClient').Changed)
					game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild('MainClient'):Destroy()
					loadstring(game:HttpGet(("https://pastebin.com/raw/203cri57"),true))();
					local setspeed = 16
					local setjump = 50
					local Hum = game.Players.LocalPlayer.Character:WaitForChild('Humanoid')
					Hum.Changed:Connect(function()
						if Hum.WalkSpeed ~= setspeed then
							Hum.WalkSpeed = setspeed
						end
						if Hum.JumpPower ~= setjump then
							Hum.JumpPower = setjump
						end
					end)
					if shared.settings_azurite then
						if shared.settings_azurite.risk == true then
							as:Slider("WalkSpeed", 16, 160, function(State)
								if shared.settings_azurite.risk == true then
									game.Players.LocalPlayer.Character:WaitForChild('Humanoid').WalkSpeed = State
									setspeed = State
								end
							end)
							as:Slider("JumpPower", 50, 500, function(State)
								if shared.settings_azurite.risk == true then
									game.Players.LocalPlayer.Character:WaitForChild('Humanoid').JumpPower = State
									setjump = State
								end
							end)
							local el = game:GetService("Workspace").WaitingRoom.VIPElevator
							local plat = el:FindFirstChild('Platform')
							local block = {
								RoomCatch = game:GetService("Workspace").VIPRoom:FindFirstChild('RoomCatch'),
								Block = el:FindFirstChild('Block'),
								PlatScript = plat:FindFirstChild('Script'),
								Touch = plat:FindFirstChild('Touch')
							}
							if block.RoomCatch then
								block.RoomCatch:Destroy()
							end
							if block.Block then
								block.Block:Destroy()
							end
							if block.PlatScript then
								block.PlatScript:Destroy()
							end
							block.Touch.Touched:connect(function()
								for i,v in pairs(plat:GetChildren()) do
									game.TweenService:Create(v,TweenInfo.new(2),{
										Position = Vector3.new(v.Position.X, (v.Position.Y + 10), v.Position.Z)
									})
								end
							end)
							azu:Loop(true,function()
								if shared.settings_azurite.risk == true then
									local hum = game.Players.LocalPlayer.Character:WaitForChild('Humanoid')
									if hum.WalkSpeed ~= setspeed then
										hum.WalkSpeed = setspeed
									end
									if hum.JumpPower ~= setjump then
										hum.JumpPower = setjump
									end
								end
							end)
						end
					end
				end
			end
		end
	elseif id.game == azu.comp.swift_hightail then
		local as = main:Category('Special')
		local sh = {
			config = {
				autofarm = as:Toggle('Auto Farm',false)
			}
		}
		azu:Loop(true,function()
			if sh.config.autofarm.Value == true then
				wait(1)
		        local map = game.Workspace:WaitForChild('Map')
		        if map then
		            local root = map:WaitForChild("S 20"):WaitForChild('root')
		            local finDes = map:WaitForChild("S 35"):WaitForChild('finDes')
		            local selfroot = azu:WaitRoot(game.Players.LocalPlayer.Character)
		            if selfroot then
		                selfroot.Position = Vector3.new(root.Position.x, root.Position.y, root.Position.z)
		                wait(0.1)
		                selfroot.Position = Vector3.new(finDes.Position.x, finDes.Position.y, finDes.Position.z)
		            end
		        end
			end
		end)
	elseif id.game == azu.comp.bendy_fake_admin then
		local as = main:Category("Special")
		as:Button('Crash',function()
		end)
	elseif id.game == azu.comp.public_bath_room then
		local as = main:Category("Special")
		local ac = main:Category("Protection")
		local pbr = {
			config = {
				megalag = as:Toggle('Mega Lag',false),
				antilag = ac:Toggle('Anti Lag',false)
			}
		}
		as:Button('Crash',function()
			coroutine.wrap(function()
			    local lopper = true
			    local count = 0
			    game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function()
			        count = count + 1
			    end)
			    game.StarterGui:SetCoreGuiEnabled('Backpack', false)
			    azu:Loop(true,function()
			        if lopper == true then
			            fireclickdetector(game.Workspace['Trash can'].Trash.Can.ClickDetector)
			            fireclickdetector(game.Workspace['Trash can'].Trash.Can.ClickDetector)
			            fireclickdetector(game.Workspace['Trash can'].Trash.Can.ClickDetector)
			            fireclickdetector(game.Workspace.CheeseGiver.ClickDetector)
			            if count > 3000 then 
			                lopper = false
			            end
			        end
			    end)
			    repeat wait() until count > 3000
			    game.StarterGui:SetCoreGuiEnabled('Backpack', true)
			    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			        v.Parent = game.Players.LocalPlayer.Character
			    end
			    wait(2)
			    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			        if v:IsA('MeshPart') then
			            v:Destroy()
			        end
			        if v:IsA('Part') then
			            v:Destroy()
			        end
			    end
			    wait(5)
			    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			        if v:IsA("Tool") then
			            v.Parent = game.Workspace
			        end
			    end
			    for i = 1,5 do
			        game.Players.LocalPlayer.Character.Humanoid.Health = 0
			    end
			end)()
		end)
		azu:Loop(false,function()
			if pbr.config.megalag.Value == true then
				for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		            if v.Name == "TpRoll" then
		                v.Parent = game.Players.LocalPlayer.Character
		            end
		        end
		        for i,v in pairs (game.Players.LocalPlayer.Character:GetChildren()) do
		            if v.Name == "TpRoll" then
		                v:Activate()
		            end
		        end
			end
			if pbr.config.antilag.Value == true then
				for i,v in pairs(game.Workspace:GetChildren()) do
		            if v:IsA('Part') and v.Color == Color3.fromRGB(237, 237, 235) then
		                v:Destroy()
		            end
		        end
		        for i,v in pairs(game.Workspace:GetChildren()) do
		            if v:IsA('Tool') then
		                v:Destroy()
		            end
		        end
			end
		end)
	elseif id.game == azu.comp.skywars then
		workspace.FallenPartsDestroyHeight = 0 / 0
		local as = main:Category("Special")
		local skywars = {
			config = {
				autokill = {},
				autofarm = as:Toggle('Auto Farm',false)
			}
		}
		as:Button("Destroy Borders",function()
			local invisible = game.Workspace.Borders:FindFirstChild('InvisibleBorder')
			if invisible then
			    invisible:Destroy()
			    azu:Notification('Destroyed | Invisible Border')
			end
			local kill = game.Workspace.Lobby:FindFirstChild('KillPlates')
			if kill then
			    kill:Destroy()
			    notification('Destroyed | Kill Border')
			end
		end)
		as:Button("Tokio Custom Theme",function()
			loadstring(game:HttpGet('https://pastebin.com/raw/8Y6iixn8',true))()
		end)
		azu:Command('local','autokill',function(a)
			local target = azu:GetPlayer(tostring(a))
			if target ~= "None" then
				if table.find(skywars.config.autokill, target) then
					table.remove(skywars.config.autokill, table.find(skywars.config.autokill, target))
					azu:Notification('Removed '..target)
				else
					table.insert(skywars.config.autokill, target)
					azu:Notification('Added '..target)
				end
			else
				azu:Notification('No Target')
			end
		end)
		azu:Loop(true,function()
			if skywars.config.autofarm.Value == true then
				if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame.Y < 165 then
				    game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(Vector3.new(game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame.X, game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame.Y + 25, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z))
				end
				azu:Wait()
		        local count = 0
		        for i,player in pairs(game.Players:GetPlayers()) do
		            count = count + 1
		            if player.Name ~= game.Players.LocalPlayer.Name then 
		                local Root = azu:WaitRoot(game.Players:FindFirstChild(player.Name).Character)
		                local PlayerRoot = azu:WaitRoot(game.Players.LocalPlayer.Character)
		                local Humanoid = azu:WaitHum(game.Players:FindFirstChild(player.Name).Character)
		                if Root and Humanoid.Health > 0.01 then
                            if Root.CFrame.Y < 250 and PlayerRoot.CFrame.Y < 250 then
                                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                    if v:IsA('Tool') then
                                        if v.Name == "Sword" then
                                            azu:WaitHum(game.Players.LocalPlayer.Character):EquipTool(v)
                                        end
                                    end
                                end
                                local check = CFrame.new(Vector3.new(Root.CFrame.X, Root.CFrame.Y - 4, Root.CFrame.Z))
                                PlayerRoot.CFrame = check + Root.CFrame.LookVector * -1
                                game:GetService("VirtualUser"):ClickButton1(Vector2.new(500,0))
                                if azu:WaitHum(game.Players.LocalPlayer.Character).Health ~= 100 then
                                    azu:WaitHum(game.Players.LocalPlayer.Character).Health = 100
                                end
                            end
                        end
		            end
		        end
		        if count == 1 then
		            local HttpService, TPService = game:GetService("HttpService"), game:GetService("TeleportService")
					local ServersToTP = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
					for _, s in pairs(ServersToTP.data) do
						if s.playing ~= s.maxPlayers then
							TPService:TeleportToPlaceInstance(game.PlaceId, s.id)
						end
					end
		        end
			end
			for i,v in pairs(skywars.config.autokill) do
				local count = 0
		        for i,player in pairs(game.Players:GetPlayers()) do
		        	for i,v in pairs(skywars.config.autokill) do
		        		if v == player.Name then
				            count = count + 1
				            if player.Name ~= game.Players.LocalPlayer.Name then 
				                local Root = azu:WaitRoot(game.Players:FindFirstChild(player.Name).Character)
				                local PlayerRoot = azu:WaitRoot(game.Players.LocalPlayer.Character)
				                local Humanoid = azu:WaitHum(game.Players:FindFirstChild(player.Name).Character)
				                if Root and Humanoid.Health > 0.01 then
		                            if Root.CFrame.Y < 250 and PlayerRoot.CFrame.Y < 250 then
		                                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		                                    if v:IsA('Tool') then
		                                        if v.Name == "Sword" then
		                                            azu:WaitHum(game.Players.LocalPlayer.Character):EquipTool(v)
		                                        end
		                                    end
		                                end
		                                local check = CFrame.new(Vector3.new(Root.CFrame.X, Root.CFrame.Y - 4, Root.CFrame.Z))
		                                PlayerRoot.CFrame = check + Root.CFrame.LookVector * -1
		                                game:GetService("VirtualUser"):ClickButton1(Vector2.new(500,0))
		                                if azu:WaitHum(game.Players.LocalPlayer.Character).Health ~= 100 then
		                                    azu:WaitHum(game.Players.LocalPlayer.Character).Health = 100
		                                end
		                            end
		                        end
				            end
				        end
			        end
		        end
			end
		end)
	elseif id.game == azu.comp.khols_admin_house then
		game:GetService("Workspace").FallenPartsDestroyHeight = "nan"
		local as = main:Category("Protection")
		local asc = main:Category("Click")
		local khols = {
			gamefolder = game.Workspace.Terrain._Game,
			folder = game.Workspace.Terrain["_Game"].Folder,
			adminfolder = game.Workspace.Terrain._Game.Admin,
			workspacefolder = game.Workspace.Terrain._Game.Workspace,
			config = {
				perm = as:Toggle('Perm', false),
				antipads = as:Toggle("Anti Pads",false),
				join_notification = as:Toggle("Joiners",false), -- You are Notified from all users joining the game.
				c_system_notification = as:Toggle("Silent Players",false), -- You Are Notified From all users using "/c system"
				logs_notification = as:Toggle("Logs Players",false), -- You Are Notified From All users using logs
				players_perm = as:Toggle("Admin Everyone",false), -- When Someone Join, He's Admin By You.
				players_kick = as:Toggle("Kick Everyone",false), -- When Someone Join, He's Kicked By You
				antiabusegears = as:Toggle("Anti Abuse Gears",true), -- If someone have specific abuse gears, the inventory will be reseted
				antigrayscale = as:Toggle("Anti Grayscale",true), -- Anti DIO Stop Time
				antisetgrav = as:Toggle("Anti Setgrav",false),
				antiblind = as:Toggle("Anti Blind",false),
				antigui = as:Toggle("Anti Gui",false), -- Anti Gui From Khols
				antikill = as:Toggle("Anti Kill",false), -- Anti Kill
				antijail = as:Toggle("Anti Jail",false), -- Anti Jail
				anticrashVG = as:Toggle("Anti Vampire Crash",false), -- Anti Vampire Crash 
				antivoid = as:Toggle("Anti Void",false), -- Anti Fall In Void
				antiattach = as:Toggle("Anti Attach",false), -- Anti Users Attaching to something
				anti2pads = as:Toggle("Anti 2 Pads",false), -- Players Can't get more than 1 pad
				chatlogs = as:Toggle("ChatLogs",false),
				mymusiconly = as:Toggle("My Music Only",false), 
				mymusiconly_ID = 0,
				clickexplode = asc:Toggle("Explode",false)
			},
			Choice = {
				Regen = {"regenpad","padregen","regen pad","pad regen","resetpad","padreset","reset pad","pad reset","regen","reset","rp","reg","res"},
				Baseplate = {"bp","pb","baseplate","platebase","base plate","plate base","Baseplate"},
				House = {"basichouse","housebasic","basic house","house basic","house","basic","home","House","Home"},
				ObbyBox = {"obbybox","boxobby","obby box","box obby"},
				ObbyKill = {"obbybricks","bricksobby","obby bricks","bricks obby","brick obby","obby brick","kill obby","obby kill","killobby","obbykill"},
				Pad_Divider = {"admindividers","dividersadmin","dividers admin","admin dividers","admindivider","divideradmin","divider admin","admin divider","dividers","divider"},
				Pads = {"adminpads","padsadmin","pads admin","pads dividers","adminpad","padadmin","pad admin","admin pad","pads","pad"},
				Bricks = {"buildingbricks","bricksbuilding","building bricks","bricks building","brick building","building brick","part building","building part","partbuilding","buildingpart","parts building","building parts","partsbuilding","buildingparts"}
			},
			VariableService = {
				players_pad = {},
				players_vip = {},
				players_custom_admin = {},
				players_kick = {},
				rainbow_floor = false,
				rainbow_pads = false,
				rainbow_obbykill = false,
				rainbow_obbybox = false,
				rainbow_speed = 0.5,
				rainbow_part = Instance.new("Part", game.Workspace),
				spam_status = false,
				spam_command = "",
				detect_status = false,
				move_status = false
			}
		}
		function khols.stop_rainbow()khols.VariableService.rainbow_floor=false;khols.VariableService.rainbow_obbykill=false;khols.VariableService.rainbow_obbybox=false;khols.VariableService.rainbow_pads=false end
		function khols.stop()azu:Notification("Stopped Tasks")khols.stop_rainbow()khols.VariableService.spam_status=false;khols.VariableService.detect_status=false; khols.VariableService.move_status=false end
		function khols.antifunc(f) coroutine.wrap(function() pcall(f) end)() end
		function khols.regen() pcall(function() fireclickdetector(khols.adminfolder:FindFirstChild('Regen').ClickDetector, 0) end) end
		function khols.move(part, fram)
			pcall(function()
				if part then
				    repeat
				        wait()
				    until khols.VariableService.move_status == false
				    khols.VariableService.move_status = true
				    local position = fram or CFrame.new(Vector3.new(math.random(100,1000), math.random(-732819,-712819), math.random(100,1000)))
				    local function ivory()repeat if not khols.adminfolder.Pads:FindFirstChild(game.Players.LocalPlayer.Name.."'s admin")then if khols.adminfolder.Pads:FindFirstChild("Touch to get admin")then local b=khols.adminfolder.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head")local c=game.Players.LocalPlayer.Character:FindFirstChild("Left Leg")firetouchinterest(b,c,1)firetouchinterest(b,c,0)else khols.regen()end end;wait()if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("IvoryPeriastron")then game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.IvoryPeriastron)end;if game:GetService("Players").LocalPlayer.Character:FindFirstChild("IvoryPeriastron")then else azu:Chat("gear me 000000000000000000108158379")wait(.2)end;wait()until game:GetService("Players").LocalPlayer.Character:FindFirstChild("IvoryPeriastron")wait(.1)end
				    local function remoteivory() local b=game:GetService("Players").LocalPlayer.Character:FindFirstChild("IvoryPeriastron") if b then repeat game:GetService("RunService").Heartbeat:wait()until b:FindFirstChild("Remote") local c=b:FindFirstChild("Remote")c:FireServer(Enum.KeyCode.E) else khols.VariableService.move_status = false end end
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
				    azu:Chat("invis me")
				    wait()
				    local tempting = true
				    coroutine.wrap(function()
				        while tempting == true do
				            game.Workspace.Gravity = 0
				            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = position
				            azu:Wait()
				        end
				    end)()
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
				    game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').Anchored = false
				    local me = game.Players.LocalPlayer
				    local function movepart()
				        if me.Character then
				            if me.Character:FindFirstChild("HumanoidRootPart") then
				                local looping = true
				                spawn(function()
				                    pcall(function()
			                    		while true do
					                        azu:Wait()
					                        local cf = azu:GetRoot(game.Players.LocalPlayer.Character)
					                        azu:GetHum(game.Players.LocalPlayer.Character):ChangeState(11)
					                        cf.CFrame = part.CFrame * CFrame.new(-1*(part.Size.X/2)-(game.Players.LocalPlayer.Character:FindFirstChild('Torso').Size.X/2), 0, 0)
					                        if not looping then break end
					                    end
				                    end)
				                end)
				                spawn(function() while looping do wait(.1) azu:Chat("unpunish me ") end end)
				                wait(0.25)
				                looping = false
				            end
				        end
				    end
				    pcall(function()
					    repeat
					        movepart()
					    until game.Players.LocalPlayer.Character.Torso:FindFirstChild("Weld")
					end)
				    wait()
				    pcall(function()
					    for i, v in pairs(game.Players.LocalPlayer.Character.Torso:GetChildren()) do
					        if v:IsA("Weld") and v.Part1 ~= part then
					            v:Destroy()
					        end
					    end
					end)
				    wait()
				    remoteivory()
				    pcall(function()
				    	if game:GetService("Players").LocalPlayer.Character:FindFirstChild("IvoryPeriastron") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("IvoryPeriastron") then
						    repeat
						        game:GetService("RunService").Heartbeat:wait()
						    until game.workspace:FindFirstChild("Pulse")
						end
					end)
				    azu:Chat("respawn me")
				    if game.workspace:FindFirstChild("Pulse") then
				    	game.workspace:FindFirstChild("Pulse"):Destroy()
				    end
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
				    khols.VariableService.move_status = false
				end
			end)
		end
		function khols.protectcmd()local a={">",",","(","|",";",")",":","/","#","+","$","<","[","]","?","!",".","_","-"}local b=""for c=1,30 do b=b..a[math.random(1,#a)]end;return b end
		function khols.crash()for a=1,10 do azu:Chat("size all 0.3")azu:Chat("size all 0.3")azu:Chat("size all 0.3")azu:Chat("freeze all")azu:Chat("size all 10")azu:Chat("size all 10")azu:Chat("size all 10")azu:Chat("clone all")azu:Chat("size all 0.3")azu:Chat("size all 0.3")azu:Chat("size all 0.3")azu:Chat("freeze all")azu:Chat("size all 10")azu:Chat("size all 10")azu:Chat("size all 10")azu:Chat("clone all")azu:Chat("size all 0.3")azu:Chat("size all 0.3")azu:Chat("size all 0.3")azu:Chat("freeze all")azu:Chat("size all 10")azu:Chat("size all 10")azu:Chat("size all 10")azu:Chat("clone all")end;for a=1,15 do azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")end end
		function khols.prevent()
			local hey = [[




Join Server !
Check Chat For Link
]]
			azu:Say('Link -> dsc . gg / azteam')
			azu:Chat('name all '..hey)
			wait(1.2)
			azu:Chat('clone '..khols.protectcmd()..' all')
			repeat wait() until khols.folder:FindFirstChild(game.Players.LocalPlayer.Name)
			azu:Chat('unname '..khols.protectcmd()..' all')
			azu:Chat('stun '..khols.protectcmd()..' all')
			azu:Chat('invis '..khols.protectcmd()..' all')
			azu:Chat('fogcolor 0 175 255')
			azu:Chat('fogend '..khols.protectcmd()..' 50')
			wait(0.75)
		end
		function khols.PlayerService(player)
			if string.sub(player.Name:lower(), 0, 3) == "me_" or string.sub(player.Name:lower(), 0, 8) == "friends_" or string.sub(player.Name:lower(), 0, 7) == "others_" or string.sub(player.Name:lower(), 0, 4) == "all_" then
				if player.Name ~= game.Players.LocalPlayer.Name then
					azu:Chat(azu.ChatEvent.prefix..'kick '..player.Name)
					azu:Chat(azu.ChatEvent.prefix..'hint The Username Is Forbidden')
				end
			end
			if khols.config.players_kick.Value == true then
				azu:Chat(azu.ChatEvent.prefix..'kick '..player.Name)
			end
			if khols.config.players_perm.Value == true then
				azu:Chat(azu.ChatEvent.prefix..'admin '..player.Name)
			end
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(Data) 
				if game:GetService("Players"):FindFirstChild(player.Name) and Data.FromSpeaker == player.Name then 
					local msg = Data.Message
					if player.Name == game.Players.LocalPlayer.Name then
						if khols.config.mymusiconly.Value == true then
							local musc = {"music",":music","::music"}
							for i,mm in pairs(musc) do
								local e = string.len(mm)
								if string.sub(msg:lower(), 0, e) == mm then
                    				khols.config.mymusiconly_ID = string.sub(msg:lower(), e + 2)
									azu:Notification('Your Music Only ID is : '..khols.config.mymusiconly_ID)
                    			end
							end
						end
					end
					if player.Name ~= game.Players.LocalPlayer.Name then
						khols.antifunc(function()
							if khols.config.mymusiconly.Value == true then
								if string.sub(msg:lower(), 0, 6) == "music " or string.sub(msg:lower(), 0, 7) == ":music " or string.sub(msg:lower(), 0, 8) == "::music " then
									if khols.folder:FindFirstChild("Sound") then
										if not khols.folder.Sound.SoundId == "http://www.roblox.com/asset/?id="..khols.config.mymusiconly_ID then
											azu:Chat("music "..khols.config.mymusiconly_ID)
										end
									end
									if not khols.folder:FindFirstChild("Sound") then
										azu:Chat("music "..khols.config.mymusiconly_ID)
									end
								end
							end
						end)
					end
					for i,plr in pairs(khols.VariableService.players_custom_admin) do
						if player.Name == plr then
							local command = string.gsub(msg:lower(), "me", player.Name)
							if string.sub(command, 0, 1) == ":" then
								command = ""
								azu:Chat("pm "..player.Name.." your command Contains a : at the start of it, please dont.")
							elseif string.sub(command, 0, 1) == "/" then
								command = ""
								azu:Chat("pm "..player.Name.." your command Contains a / at the start of it, please dont.")
							elseif string.sub(command, 0, 5) == "size " then
								wait(2)
								azu:Chat('size '..string.sub(command, 6))
							elseif string.sub(command, 0, 7) == "freeze " then
								wait(2)
								azu:Chat('freeze '..string.sub(command, 8))
							elseif string.sub(command, 0, 6) == "music " then
								azu:Chat("pm "..player.Name.." Use <id>pesos instead of music")
							elseif string.sub(command, 0, 11) == "removejails" then
								azu:Chat("removejails")
							elseif string.sub(command, 0, 10) == "unjail all" then
								azu:Chat("removejails")
							elseif string.sub(command, 0, 1) == "m" then
								command = ""
							elseif string.sub(command, 0, 2) == "m " then
								azu:Chat('blind all')
								for i = 1,3 do azu:Chat('h \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'..string.sub(command, 3)) end
								wait(5)
								azu:Chat('unblind all')
								azu:Notification('This message was from '..player.Name)
							elseif string.sub(command, 0, 8) == "message " then
								azu:Chat('m '..player.Name..' Use m intead of message')
							elseif string.sub(command, 0, 2) == "h " then
								azu:Chat(azu.ChatEvent.prefix..'hint '..player.Name..'sec: '..string.sub(command, 3))
							elseif string.sub(command, 0, 5) == "hint " then
								azu:Chat('m '..player.Name..' Use h intead of hiny')
							elseif string.sub(command, 0, 12) == "jumppower me" then
								azu:Chat("jumppower "..player.Name.." "..string.sub(command, 14))
							elseif string.sub(command, 0, 7) == "name me" then
								azu:Chat("name "..player.Name.." "..string.sub(command, 9))
							elseif string.sub(command, 0, 3) == "pm " then
								azu:Chat("pm "..player.Name.." You cant use 'pm' sorry!")
							elseif string.sub(command, 0, 4) == "logs" then
								azu:Chat("pm "..player.Name.." You cant use 'logs' sorry!")
							elseif string.sub(command, 0, 4) == "cmds" then
								azu:Chat("pm "..player.Name.." You cant use 'commands' sorry!")
							elseif string.sub(command, 0, 8) == "commands" then
								azu:Chat("pm "..player.Name.." You cant use 'commands' sorry!")
							elseif string.sub(command, 0, 9) == "musiclist" then
								azu:Chat("pm "..player.Name.." You cant use 'musiclist' sorry!")
							elseif string.sub(command, 0, 11) == "packagelist" then
								azu:Chat("pm "..player.Name.." You cant use 'packagelist' sorry!")
							else
								azu:Chat(command)
							end
						end
					end
					for i,plr in pairs(khols.VariableService.players_vip) do
						if player.Name == plr then
							local command = string.gsub(msg:lower(), "me", player.Name)
							if string.sub(command, 1, 1) == azu.ChatEvent.prefix then
								azu:Chat(command)
							end
						end
					end
					if khols.config.antiabusegears.Value == true then
						if player.Name ~= game.Players.LocalPlayer.Name then
							if game.Players[player.Name].Character then
								if game.Players[player.Name].Character:FindFirstChild("SeaThemedCrossbow") then
									azu:Chat("respawn "..player.Name)
									wait(0.28)
								end
								if khols.config.antigrayscale.Value == true then
									if game.Players[player.Name].Character:FindFirstChild("DaggerOfShatteredDimensions") then
										azu:Chat("respawn "..player.Name)
										wait(0.28)
									end
								end
								if game.Players[player.Name].Character:FindFirstChild("SeaThemedCrossbow") then
									azu:Chat("respawn "..player.Name)
									wait(0.28)
								end
								if game.Players[player.Name].Character:FindFirstChild("PortableJustice") then
									azu:Chat("respawn "..player.Name)
									wait(0.28)
								end
							end
						end
					end
					if khols.config.anticrashVG.Value == true then
						if game.Players[player.Name].Character then
							if game.Players[player.Name]:FindFirstChild("VampireVanquisher") then
								azu:Chat("reset "..player.Name)
							end
							if game.Players[player.Name]:FindFirstChild("HumanoidRootPart") then
								if game.Players[player.Name].HumanoidRootPart.Size.Y <= 0.3 then
									azu:Chat("reset "..player.Name)
								end
							end
						end
					end
					if khols.config.antiattach.Value == true then
						if game.Players[player.Name].Character:FindFirstChild("IvoryPeriastron") or string.sub(msg:lower(),0,8) == "unpunish" or string.sub(msg:lower(),0,9) == ":unpunish" or string.sub(msg:lower(),0,3) == "sit" or string.sub(msg:lower(),0,4) == ":sit" or string.sub(msg:lower(),0,4) == "stun" or string.sub(msg:lower(),0,5) == ":stun" then
							if player.Name ~= game.Players.LocalPlayer.Name then
								azu:Chat("respawn "..player.Name)
							end
						end
					end
					if khols.config.chatlogs.Value == true then
						print("["..player.Name.."]: "..msg)
					end
					if khols.config.c_system_notification.Value == true then
						if string.sub(msg:lower(), 0, 9) == "/c system" then
							if player.Name ~= game.Players.LocalPlayer.Name then
								azu:Notification(player.Name.." using /c system !")
							end
						end
					end
					if khols.config.logs_notification.Value == true then
						if string.sub(msg:lower(), 0, 4) == "logs" or string.sub(msg:lower(), 0, 5) == ":logs" or string.sub(msg:lower(), 0, 6) == "::logs" then
							if player.Name ~= game.Players.LocalPlayer.Name then
								azu:Notification(player.Name.." using logs")
							end
						end
					end
					if khols.config.antijail.Value == true then
						if string.sub(msg:lower(), 0, 4) == "jail" or string.sub(msg:lower(), 0, 5) == ":jail" or string.sub(msg:lower(), 0, 6) == "::jail" then
							if khols.folder[game.Players.LocalPlayer.Name.."'s jail"] then
								azu:Chat('unjail me')
							end
						end
					end
				end
			end)
		end
		for i,plr in pairs(game.Players:GetChildren()) do khols.PlayerService(plr) end
		game.Players.PlayerAdded:Connect(function(plr) 
			if khols.config.join_notification.Value == true then 
				azu:Notification(plr.Name.." has joined the game") 
			end
			khols.PlayerService(plr)
		end)
		azu:Loop(false,function()
			khols.antifunc(function()
				if khols.config.perm.Value == true then	
					if not khols.adminfolder.Pads:FindFirstChild(game.Players.LocalPlayer.Name .. "'s admin") then
						if khols.adminfolder.Pads:FindFirstChild("Touch to get admin") then
							local pad = khols.adminfolder.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head")
							firetouchinterest(game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)["Left Leg"], pad, 0)
							firetouchinterest(game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)["Left Leg"], pad, 1)
						else
							khols.regen()
						end
					end
				end
			end)
		end)
		azu:Loop(true,function()
			khols.antifunc(function()
				if khols.config.antivoid.Value == true then
					local CF = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
					if CF.Y < 0 then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(CF.X, 3, CF.Z))
					end
				end
			end)
			khols.antifunc(function()
				if khols.config.antipads.Value == true then	
					for i,v in pairs(khols.adminfolder.Pads:GetChildren()) do
						firetouchinterest(game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)["Left Leg"], v.Head, 0)
						firetouchinterest(game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)["Left Leg"], v.Head, 1)
					end
					for i,v in pairs(khols.adminfolder.Pads:GetChildren()) do
						if v.Name ~= game.Players.LocalPlayer.Name.."'s admin" then
							khols.regen()
						end
					end
				end
			end)
			khols.antifunc(function()
				if khols.config.antigui.Value == true then
					for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
						if v.Name == "MessageGUI" or v.Name == "Message" or v.Name == "EFFECTGUIBLIND" or v.Name == "HintGUI" then
							v:Destroy()
						end
					end
				end
			end)
			khols.antifunc(function()
				if khols.config.antiblind.Value == true then
					for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
						if v.Name == "EFFECTGUIBLIND" then
							v:Destroy()
						end
					end
				end
			end)
			khols.antifunc(function()
				if khols.config.antijailgearban.Value == true then
					if game.Players.LocalPlayer.Character:FindFirstChild("Part") then
						game.Players.LocalPlayer.Character:FindFirstChild("Part"):Destroy()
						azu:Wait()
						game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
						game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
					end
				end
			end)
			khols.antifunc(function()
				if khols.config.antigrayscale.Value == true then
					if game.Workspace.CurrentCamera:FindFirstChild("GrayScale") then
						game.Workspace.CurrentCamera:FindFirstChild("GrayScale"):Destroy()
					end
					azu:Wait()
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
					game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
				end
			end)
			khols.antifunc(function()
				if khols.VariableService.spam_status == true then
					azu:Chat(khols.VariableService.spam_command)
				end
			end)
		end)
		azu:Loop(false,function()
			khols.antifunc(function()
				for i,v in pairs(khols.VariableService.players_kick) do
					if game.Workspace:FindFirstChild(v) then
						if string.sub(v:lower(), 0, 3) == "me_" or string.sub(v:lower(), 0, 8) == "friends_" or string.sub(v:lower(), 0, 7) == "others_" or string.sub(v:lower(), 0, 4) == "all_" then
							azu:Chat('punish others')
							for i,user in pairs(game.Players:GetPlayers()) do
								if string.sub(user.Name:lower(), 0, 3) ~= "me_" or string.sub(user.Name:lower(), 0, 8) ~= "friends_" or string.sub(user.Name:lower(), 0, 7) ~= "others_" or string.sub(v:lower(), 0, 4) ~= "all_" then
									if user.Name ~= game.Players.LocalPlayer then
										azu:Chat('unpunish '..user.Name)
									end
								end
							end
						else
							if game.Players:FindFirstChild(v) then
								azu:Chat('punish '..v)
							end
						end
					end
				end
			end)
		end)
		game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Died:Connect(function()
			if khols.config.antikill.Value == true then
				azu:Chat('reset '..khols.protectcmd()..' me')
			end
		end)
		game.Players.LocalPlayer.CharacterAdded:Connect(function(Char)
			Char:WaitForChild("Humanoid").Died:Connect(function()
				khols.VariableService.move_status = false
				for i, v in pairs(game.Workspace:GetDescendants()) do
			        if v:IsA("Part") then
			            v.CanCollide = true
			        end
			    end
			    wait(.2)
			    game.Workspace.Gravity = 196.2
				if khols.config.antikill.Value == true then
					azu:Chat('reset '..khols.protectcmd()..' me')
				end
			end)
		end)
		game.Players.LocalPlayer.Character.DescendantAdded:Connect(function(i)
			if khols.config.antisetgrav.Value == true then
				local root;
				if i.Name == "BodyForce" then
					root = azu:GetRoot(game.Players.LocalPlayer.Character)
					i.Force = Vector3.new(0, 0, 0)
					repeat
						azu:Wait()
					until i == nil
					root.Velocity = Vector3.new(0, 0, 0)
				elseif i.Name == "BodyPosition" then
					i:Destroy()
					root.Velocity = Vector3.new(0, 0, 0)
				end
			end
		end)
		azu:Command('local','createobby',function(arg)
			function Movepart_cframe(PositionCFrame, locatepart)
				azu:Wait()
				if locatepart then
					if khols.VariableService.move_status == false then
						khols.VariableService.move_status = true
						local PosCFrame = "nothing"
						if PositionCFrame == "None" then
							local function ran() return math.random(-20000,-10000) end
							local function runa() return math.random(100,1000) end
							PosCFrame = Vector3.new(runa(), ran(), runa())
						else
							PosCFrame = PositionCFrame
						end
						if game.Players.LocalPlayer.Character.Humanoid then
							workspace.FallenPartsDestroyHeight = 0 / 0
							azu:Chat("invis me")
							azu:Chat("gear me 108158379")
							wait(0.5)
							if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('IvoryPeriastron') then
								wait(0.5)
								if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('IvoryPeriastron') then
									game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack.IvoryPeriastron)
									wait(0.5)
								else
									notification("ERROR | Backpack")
								end
								if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart then
									game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(PosCFrame)
									wait(1)
									game:GetService("Players").LocalPlayer.Character:FindFirstChild('IvoryPeriastron').Remote:FireServer(Enum.KeyCode.E)
									wait(1)
									repeat wait() until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
									local looping = true
									coroutine.resume(coroutine.create(function()
										while looping do 
											wait(.1) 
											azu:Chat('unpunish me') 
										end
									end))
									coroutine.resume(coroutine.create(function()
										while true do
											fastwait()
											game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)
											game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = locatepart.CFrame * CFrame.new(-1*(locatepart.Size.X/2)-(game.Players.LocalPlayer.Character['Torso'].Size.X/2), 0, 0)
											if not looping then break end
										end
									end))
									wait(0.3)
									looping = false
									wait(0.5)
									game:GetService("Players").LocalPlayer.Character:FindFirstChild('IvoryPeriastron').Remote:FireServer(Enum.KeyCode.E)
									wait(0.5)
									azu:Chat("respawn me")
									notification("Moved "..locatepart.Name)
									wait(2)
								end
							end
						end
						khols.VariableService.move_status = false
						workspace.FallenPartsDestroyHeight = -500
					else
						khols.VariableService.move_status = false
					end
				end
			end
			local framepart = Vector3.new(-204, 10004.9, 59)
			local part = game.Workspace.Terrain._Game.Workspace["Basic House"].SmoothBlockModel112
			Movepart_cframe(framepart,part)
			-- 2 part
			framepart = Vector3.new(-143, 10008.9, 62)
			part = game.Workspace.Terrain._Game.Workspace["Building Bricks"].Part7
			Movepart_cframe(framepart,part)
			-- 3 part
			framepart = Vector3.new(-134, 10012.9, 60)
			part = game.Workspace.Terrain._Game.Workspace["Building Bricks"].Part6
			Movepart_cframe(framepart,part)
			-- 4 part
			framepart = Vector3.new(-143, 10017.1, 62)
			part = game.Workspace.Terrain._Game.Workspace["Building Bricks"].Part5
			Movepart_cframe(framepart,part)
			-- 5 part
			framepart = Vector3.new(-145, 10021.5, 25)
			part = game.Workspace.Terrain._Game.Workspace["Basic House"].SmoothBlockModel40
			Movepart_cframe(framepart,part)
			-- spawns
			framepart = Vector3.new(-190.9, 10008.5, 67)
			part = game.Workspace.Terrain._Game.Workspace.Spawn1
			Movepart_cframe(framepart,part)
			-- spawns
			part = game.Workspace.Terrain._Game.Workspace.Spawn2
			Movepart_cframe(framepart,part)
			-- spawns
			part = game.Workspace.Terrain._Game.Workspace.Spawn3
			Movepart_cframe(framepart,part)
		end)
		azu:Command('local',"part",function(arg) azu:Chat("invis me") azu:Chat("stun me") azu:Chat("freeze me") azu:Chat("name me core");wait(.3) azu:Chat("clone me") azu:Chat("outdoorambient 255 255 255");wait() azu:Chat("reset me");wait(.7) azu:Chat("gear me 123234673") azu:Chat("pm me Hit The Block With The Knife");wait(10) azu:Chat("gear me 18474459") end)
		azu:Command('local',"masspart",function(a)local b=tonumber(a)azu:Chat("invis me")azu:Chat("stun me")if b==1 then for c=1,10 do wait(0.1)for c=1,5 do wait(0.1)azu:Chat("freeze me")azu:Chat("tp me me me me")end;azu:Chat("unsize me")azu:Chat("unseizure me")azu:Chat("unseizure me")end else for c=1,25 do wait(0.1)azu:Chat("freeze me")azu:Chat("tp me me me me")end end;azu:Chat("clone me")wait(.3)azu:Chat("reset me")wait(.7)azu:Chat("gear me 123234673")azu:Chat("pm me Hit The Block With The Knife")wait(10)azu:Chat("gear me 18474459")end)
		azu:Command('local',"theme",function(a)local b=tostring(a)azu:Chat("clr")azu:Chat("fix")if b=="1" then azu:Chat("colorshifttop 600 400 10")azu:Chat("colorshiftbottom 600 400 10")azu:Chat("time 16")elseif b=="1"then azu:Chat("time 19")azu:Chat("outdoorambient 250 100 250")azu:Chat("music 6554661697")elseif b=="2"then azu:Chat("time -")azu:Chat("fogend 600")azu:Chat("fogcolor 300 0 800")azu:Chat("music 2200651887")elseif b=="3"then azu:Chat("time -")azu:Chat("fogend 25")azu:Chat("fogcolor 255 255 51")azu:Chat("music 2590490779")elseif b=="4"then azu:Chat("time 0")azu:Chat("fogcolor 0 0 0")azu:Chat("fogend 25")azu:Chat("music 143382469")elseif b=="5"then azu:Chat("fogend 75")azu:Chat("fogcolor 0 155 255")azu:Chat("music 1137959605")elseif b=="6"then azu:Chat("time -")azu:Chat("fogend 46")azu:Chat("fogcolor 250 83 255")azu:Chat("music 3650040936")elseif b=="7"then azu:Chat("time -")azu:Chat("fogend 1000")azu:Chat("fogcolor 37 355 55")azu:Chat("music 6741702853")else azu:Notification('No Choice Named > '..a)end end)
		azu:Command('local',"up",function(a)game.Players.LocalPlayer.Character:Destroy()azu:Chat("unpunish me "..math.random(1,1000))azu:Chat("refresh me "..math.random(1,1000))azu:Chat("refresh me "..math.random(1,1000))end)
		azu:Command("local","fixrg",function(a)khols.config.antivoid:Set(true)azu:Chat('size me 0.6')azu:Chat("invis Regen me")azu:Chat("setgrav me -235")wait(.65)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,2006,90))wait(.25)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,4006,90))wait(.25)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,6006,90))wait(.25)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,8006,90))wait(.25)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,10006,90))wait(.25)azu:Chat("gear me 00000000000000000000000000000000108158379")wait()local function b()repeat wait()until game.Players.LocalPlayer.Backpack:FindFirstChild("IvoryPeriastron")game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.IvoryPeriastron)end;local function c()repeat wait()until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")local d=game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")local e=true;spawn(function()while true do azu:Wait()game.Players.LocalPlayer.Character["Humanoid"]:ChangeState(11)d.CFrame=khols.adminfolder.Regen.CFrame*CFrame.new(-1*khols.adminfolder.Regen.Size.X/2-game.Players.LocalPlayer.Character["Torso"].Size.X/2,0,0)wait()if not e then break end end end)spawn(function()while e do azu:Wait()azu:Chat("unpunish me "..math.random(1,1000))end end)wait(0.3)e=false end;game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-9.16500044,5.42999268,94.7430038,0,0,-1,0,1,0,1,0,0))wait(.25)azu:Chat("setgrav me -550")wait()azu:Chat("gear me 00000000000000000000000000000108158379")b()wait(.35)game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored=true;local f={[1]=Enum.KeyCode.E}game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(unpack(f))wait()repeat wait()until game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter")wait()game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored=false;azu:Chat("unfly me")wait(.2)repeat c()until game.Players.LocalPlayer.Character.Torso:FindFirstChild("Weld")wait()game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(Enum.KeyCode.E)repeat wait()until not game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter")game.Players.LocalPlayer.Character:Destroy()khols.config.antivoid:Set(false)b()wait(.35)game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(Enum.KeyCode.E)repeat wait()until game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter")wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1,-498,1))for g,h in pairs(game:GetService("Workspace").Camera:GetChildren())do if h.Name=="FakeCharacter"then h:Destroy()end end end)
		azu:Command('local','fixbp',function(a)khols.config.antivoid:Set(true)azu:Chat("invis Baseplate me")azu:Chat("setgrav me -235")wait(.65)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,2006,90))wait(.25)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,4006,90))wait(.25)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,6006,90))wait(.25)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,8006,90))wait(.25)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,10006,90))wait(.25)azu:Chat("gear me 00000000000000000000000000000000108158379")wait()local function b()repeat wait()until game.Players.LocalPlayer.Backpack:FindFirstChild("IvoryPeriastron")game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.IvoryPeriastron)end;local function c()repeat wait()until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")local d=game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")local e=true;spawn(function()while true do azu:Wait()game.Players.LocalPlayer.Character['Humanoid']:ChangeState(11)d.CFrame=game:GetService("Workspace").Terrain._Game.Workspace.Baseplate.CFrame*CFrame.new(-1*game:GetService("Workspace").Terrain._Game.Workspace.Baseplate.Size.X/2-game.Players.LocalPlayer.Character['Torso'].Size.X/2,0,0)wait()if not e then break end end end)spawn(function()while e do game:GetService('RunService').Heartbeat:Wait()azu:Chat("unpunish me "..math.random(1,1000))end end)wait(0.3)e=false end;game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-501,0.100000001,0,1,0,0,0,1,0,0,0,1))wait(.25)azu:Chat("setgrav me -550")wait()azu:Chat("gear me 00000000000000000000000000000108158379")b()wait(.35)game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored=true;local f={[1]=Enum.KeyCode.E}game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(unpack(f))wait()repeat wait()until game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter")wait()game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored=false;azu:Chat("unfly me")wait(.2)repeat c()until game.Players.LocalPlayer.Character.Torso:FindFirstChild("Weld")wait()game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(Enum.KeyCode.E)repeat wait()until not game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter")game.Players.LocalPlayer.Character:Destroy()khols.config.antivoid:Set(false)b()wait(.35)game:GetService("Players").LocalPlayer.Character.IvoryPeriastron.Remote:FireServer(Enum.KeyCode.E)repeat wait()until game:GetService("Workspace").Camera:FindFirstChild("FakeCharacter")wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1,-498,1))for g,h in pairs(game:GetService("Workspace").Camera:GetChildren())do if h.Name=="FakeCharacter"then h:Destroy()end end end)
		azu:Command('local','fixmove',function(a)khols.VariableService.move_status=false;for b,c in pairs(game.Workspace:GetDescendants())do if c:IsA("Part")then c.CanCollide=true end end;wait(.2)game.Workspace.Gravity=196.2 end)
		azu:Command('local',"spam",function(a) khols.VariableService.spam_command = tostring(a) khols.VariableService.spam_status = true end)
		azu:Command('local',"stop",function(a) khols.stop() end)
		azu:Command('local','move',function(a)for b,c in pairs(khols.Choice.Regen)do if tostring(a)==tostring(c)then khols.move(khols.adminfolder.Regen)end end;for b,c in pairs(khols.Choice.Baseplate)do if tostring(a)==tostring(c)then khols.move(khols.workspacefolder.Baseplate)end end;for b,c in pairs(khols.Choice.ObbyBox)do if tostring(a)==tostring(c)then for d,e in pairs(khols.workspacefolder["Obby Box"]:GetChildren())do khols.move(e)end end end;for b,c in pairs(khols.Choice.ObbyKill)do if tostring(a)==tostring(c)then for d,e in pairs(khols.workspacefolder["Obby"]:GetChildren())do khols.move(e)end end end;for b,c in pairs(khols.Choice.Pads)do if tostring(a)==tostring(c)then for d,e in pairs(khols.adminfolder.Pads:GetChildren())do for f,g in pairs(e:GetChildren())do khols.move(g)end end end end;for b,c in pairs(khols.Choice.Bricks)do if tostring(a)==tostring(c)then for d,e in pairs(khols.workspacefolder["Building Bricks"]:GetChildren())do khols.move(e)end end end;for b,c in pairs(khols.Choice.Pad_Divider)do if tostring(a)==tostring(c)then for d,e in pairs(khols.workspacefolder["Admin Dividers"]:GetChildren())do khols.move(e)end end end end)azu:Command('local','crash',function(a) khols.prevent() khols.crash() end)
		azu:Command('local','regen',function(a) khols.regen() end)
		azu:Command('local','findregen',function(a)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1000000,1000003,-1000000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1101734,33651680,-33531784))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1000000,-1000003,-1000000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1000000,-1000000,-3))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(3,-1000000,1000000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1000000,-3,-1000000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-1000000,-3,1000000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1000000,3,1000000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1000000,1000003,1000000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1000000,-1000003,1000000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(454545,150000,-678678))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(306712,420552,398158))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-1000000,1000003,1000000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-1000000,1000003,-1000000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-1000000,-1000003,-1000000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(45400,-49860,56673))wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(56470,-48312,28578))wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(75304,-49638,47300))wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(34120,-48830,30233))wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(77822,-49751,79116))wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(42682,-29202,29886))wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(51052,-49558,34068))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-200000,50000,3500000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(782629,385179,234698))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-251773,1000003,382563))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-500000,300000,500000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-300000,300000,300000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(300000,300000,300000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(300000,300000,-300000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-300000,300000,-300000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-500000,300000,500000))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-7,12009,95))azu:Wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(734399,560502,2776))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-360263,421796,716100))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(999982,3143,999997))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(696973,999997,-1000001))wait(.15)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(100000,10000,100000))wait(.35)local b=game.Players.LocalPlayer.Character.HumanoidRootPart;for c=0,100 do wait()b.CFrame=CFrame.new(Vector3.new(c*10000,c*10000,c*10000))end;for c=0,100 do wait()b.CFrame=CFrame.new(Vector3.new(-(c*10000),-(c*10000),-(c*10000)))end;for c=0,100 do wait()b.CFrame=CFrame.new(Vector3.new(-(c*10000),c*10000,c*10000))end;for c=0,100 do wait()b.CFrame=CFrame.new(Vector3.new(c*10000,-(c*10000),-(c*10000)))end end)
		azu:Command('local','nok',function(a)khols.workspacefolder.Obby.Jump.TouchInterest:destroy()khols.workspacefolder.Obby.Jump1.TouchInterest:destroy()khols.workspacefolder.Obby.Jump2.TouchInterest:destroy()khols.workspacefolder.Obby.Jump3.TouchInterest:destroy()khols.workspacefolder.Obby.Jump4.TouchInterest:destroy()khols.workspacefolder.Obby.Jump5.TouchInterest:destroy()khols.workspacefolder.Obby.Jump6.TouchInterest:destroy()khols.workspacefolder.Obby.Jump7.TouchInterest:destroy()khols.workspacefolder.Obby.Jump8.TouchInterest:destroy()khols.workspacefolder.Obby.Jump9.TouchInterest:destroy()azu:Notification('Deleted All TouchInterest of Obby')end)
		azu:Command('local','nti',function(a)local b=tostring(a)azu:Wait()azu:Chat("dog "..khols.protectcmd().." "..b..","..b..","..b..","..b..","..b..","..b..","..b..","..b..","..b..","..b..","..b..","..b..","..b..","..b..","..b)wait(3)azu:Chat("kill "..b)azu:Notification("Removed All Touch Interest Of "..b)end)
		azu:Command('local','stabilize',function(a)local b=tostring(a)azu:Chat("stun "..khols.protectcmd().." "..b)azu:Chat("freeze "..khols.protectcmd().." "..b)azu:Chat("thaw "..khols.protectcmd().." "..b)end)
		azu:Command('local','floppa',function(a)azu:Chat('char me 17513')azu:Chat('shirt me 9582295098')loadstring(game:HttpGet('https://pastebin.com/raw/arDxTh3X',true))()azu:Wait()azu:Chat('removehead me')end)
		azu:Command('local','color',function(a)choice=tostring(a)azu:Chat("gear me 00000000000000000018474459")if choice=="original"then loadstring(game:HttpGet("https://pastebin.com/raw/V4deAUtB",true))()elseif choice=="random"then game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.PaintBucket)for b,c in pairs(game:GetService("Workspace"):GetDescendants())do coroutine.resume(coroutine.create(function()if c:IsA("Part")then local d={["Part"]=c,["Color"]=Color3.new(math.random(0,255),math.random(0,255),math.random(0,255))}game:GetService("Workspace")[game.Players.LocalPlayer.Name].PaintBucket:WaitForChild("Remotes").ServerControls:InvokeServer("PaintPart",d)end end))end end end)
		azu:Command('local','control',function(a)local b=tostring(a)azu:Chat("dog "..khols.protectcmd().." me,"..b)azu:Chat("tp me "..b)wait(1)azu:Chat("punish "..khols.protectcmd().." me,"..b)azu:Chat("undog "..khols.protectcmd().." me,"..b)wait(0.25)azu:Chat("unpunish "..khols.protectcmd().." me,"..b)azu:Chat("invis "..khols.protectcmd().." me")end)
		azu:Command('local','ufo',function(a)local b=tostring(a)azu:Chat("dog "..khols.protectcmd().." "..b)azu:Chat("creeper "..khols.protectcmd().." "..b)azu:Chat("removelimbs "..khols.protectcmd().." "..b)azu:Chat("paint "..b.." black")azu:Chat("name "..b.." Ufo")azu:Chat("removehats "..khols.protectcmd().." "..b)azu:Chat("spin "..khols.protectcmd().." "..b)wait(0.25)azu:Chat("fly "..khols.protectcmd().." "..b)end)
		azu:Command('local','taxi',function(a)local b=tostring(a)azu:Chat("dog "..khols.protectcmd().." "..b)azu:Chat("removelimbs "..khols.protectcmd().." "..b)azu:Chat("creeper "..khols.protectcmd().." "..b)azu:Chat("name "..b.." Taxi")azu:Chat("gold "..khols.protectcmd().." "..b)azu:Chat("speed "..b.." 100")azu:Chat("god "..khols.protectcmd().." "..b)azu:Chat("removehats "..khols.protectcmd().." "..b)end)
		azu:Command('local','spawn',function(a)local b=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;khols.move(khols.workspacefolder.Spawn1,b)khols.move(khols.workspacefolder.Spawn2,b)khols.move(khols.workspacefolder.Spawn3,b)end)
		azu:Command('local','norc',function(a) azu:Chat('gear me 4842207161') end)
		azu:Command('local','fixrc',function(a) loadstring(game:HttpGet('https://pastebin.com/raw/2zDeXFmG',true))() end)
		azu:Command('local','block',function(a)local b=tostring(a)for c,d in pairs(game.Players:GetChildren())do stringlower=string.lower(d.Name)stringsub=string.sub(stringlower,1,#b)if b==stringsub then table.insert(khols.VariableService.players_kick,d.Name)azu:Notification("Blocked "..d.Name)end end end)
		azu:Command('local','unblock',function(a)local b=tostring(a)for c,d in pairs(game.Players:GetChildren())do stringlower=string.lower(d.Name)stringsub=string.sub(stringlower,1,#b)if b==stringsub then for a,e in pairs(khols.VariableService.players_kick)do if e==d.Name then table.remove(khols.VariableService.players_kick,a)azu:Notification("Unblocked "..d.Name)end end end end end)
		azu:Command('local',"voidkill",function(a) local b = CFrame.new(Vector3.new(1,-50000,1)) khols.move(khols.workspacefolder.Spawn1, b) khols.move(khols.workspacefolder.Spawn2, b) khols.move(khols.workspacefolder.Spawn3, b) end)
		azu:Command('local','rfire',function(a)local b=tostring(azu:GetPlayer(a))if b~="None"then for c=1,15 do azu:Chat('skydive '..khols.protectcmd()..' '..b)end;azu:Chat('blind '..khols.protectcmd()..' '..b)azu:Chat('pm '..b..' Equip Sword')azu:Chat('noclip '..khols.protectcmd()..' '..b)azu:Chat('size '..b..' nan')azu:Chat('gear '..b..' 159229806')repeat wait()until game.Workspace[b]:FindFirstChild('RainbowPeriastron')for c=1,500 do azu:Chat('gear '..b..' 253519495')end end end)
		azu:Command('local','gearify',function(a)
			azu:Chat('gear me 74385399')
			local root = azu:GetRoot(game.Players.LocalPlayer.Character)
			local remote = game:GetService("Players").LocalPlayer.Character:FindFirstChild('RemoteExplosiveDetonator')
			azu:Chat('pm me Place Bomb')
			repeat wait() until workspace:FindFirstChild('Handle')
			local handle = workspace:FindFirstChild('Handle')
			if handle then
				repeat azu:Chat('gear me 212296936') wait(2) until game.Players.LocalPlayer.Backpack:FindFirstChild('RedHyperLaser')
				for _, tool in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
				    if tool:IsA("Tool") then
				         tool.Parent = game:GetService("Players").LocalPlayer.Character -- I didn't use Equip because the Equip function unequips any other tools in your character.
				    end
				end
				wait(1)
				root.CFrame = handle.CFrame * CFrame.new(0, 0, 0) * CFrame.new(math.random(-100, 100)/200,math.random(-100, 100)/200,math.random(-100, 100)/200)
				azu:Chat('size me 1.161111111')
			end
		end)
		azu:Command('local','kick',function(a)
			local b=azu:GetPlayer(tostring(a))
			if b ~="None" then
				azu:Chat('unpackage 000000000000000000000000')
				azu:Chat('speed '..b..' 0')
				azu:Chat('ff tokiomybabagrill_okipullup_'..b)
				azu:Chat('invis tokiomybabagrill_me_'..b)
				azu:Chat("blind "..khols.protectcmd().." "..b)
				for i = 1,2 do
					repeat azu:Chat("gear me 25741198")wait(1)until game.Players.LocalPlayer.Backpack:FindFirstChild('HotPotato')
					game:GetService("VirtualUser"):ClickButton1(Vector2.new(500,0))
					for i = 1,10 do game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = game.Players[b].Character:WaitForChild('HumanoidRootPart').CFrame * CFrame.new(-1, 0, 2) end
			        for i = 1,3 do azu:Chat("gear me 25741198") end
			        azu:Chat("gear me 25741198")
			        for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren()) do
			        	game.Players.LocalPlayer.Character:WaitForChild('Humanoid'):EquipTool(v)
			        	game:GetService("VirtualUser"):ClickButton1(Vector2.new(500,0))
			        end
			        --[[ GIVE TOOL]]
			        local v = game.Players[b].Character
					workspace.CurrentCamera.CameraSubject = v
					local Char = game.Players.LocalPlayer.Character or workspace:FindFirstChild(game.Players.LocalPlayer.Name)
					local hum = Char and Char:FindFirstChildWhichIsA('Humanoid')
					local hrp = hum and hum.RootPart
					local hrppos = hrp.CFrame
					hum = hum:Destroy() or hum:Clone()
					hum.Parent = Char
					hum:ClearAllChildren()
					game.Players.LocalPlayer:ClearCharacterAppearance()
					coroutine.wrap(function()
						game.Players.LocalPlayer.CharacterAdded:Wait():WaitForChild('Humanoid').RootPart.CFrame = wait() and hrppos
					end)()
					local vHRP = azu:GetRoot(v)
					azu:Chat("pm/"..b.." UWU")
			        azu:Chat("pm "..b.." UWU")
					while Char and Char.Parent and vHRP and vHRP.Parent do
						local Tools = false
						for _, tool in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
						    if tool:IsA("Tool") then
						         tool.Parent = game:GetService("Players").LocalPlayer.Character -- I didn't use Equip because the Equip function unequips any other tools in your character.
						    end
						end
						for _, v in ipairs(Char:GetChildren()) do
							if v:IsA('BackpackItem') and v:FindFirstChild('Handle') then
								Tools = true
								firetouchinterest(v.Handle, vHRP, 0)
								firetouchinterest(v.Handle, vHRP, 1)
							end
						end
						if not Tools then
							break
						end
						for _, tool in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
						    if tool:IsA("Tool") then
						         tool.Parent = game:GetService("Players").LocalPlayer.Character -- I didn't use Equip because the Equip function unequips any other tools in your character.
						    end
						end
						hrp.CFrame = vHRP.CFrame
						game.RunService.RenderStepped:Wait()
					end
					--[[ GIVE TOOL]]
			        azu:Chat("size "..b.." nan")
			        azu:Chat("noclip "..b)
			        azu:Chat("dog "..b)
			        azu:Chat("size "..b.." nan")
			        azu:Chat("size "..b.." nan")
			        wait(3)
			        azu:Chat("respawn "..b)
			    end
			else
				azu:Notification('No Target')
			end
		end)

		local mouse = game.Players.LocalPlayer:GetMouse()
		mouse.Button1Down:Connect(function()
	        pcall(function()
                local plr = mouse.Target.Parent.Parent
                for i, v in pairs(game.Players:GetPlayers()) do
                    pcall(function()
                        if mouse.Target.Parent:FindFirstChild("Humanoid") then
                            plr = mouse.Target.Parent
                        end
                    end)
                end
                if plr ~= nil then
                    if khols.config.clickexplode.Value == true then
                        azu:Chat("explode " .. plr.Name)
                   	end
                end
            end)
	    end)
	elseif id.game == azu.comp.evade then
		local as = main:Category("Protection")
		local asc = main:Category("Build")
		local sc = main:Category("Special")
		local evade = {
			runbots = {},
			loadedbuilds = {},
			connections = {},
			config = {
				antijumpscare = as:Toggle('Anti JumpScare',false,function(State)
					if State == true then
						if game.Players.LocalPlayer:FindFirstChild('Settings') then
							game.Players.LocalPlayer.Settings.Jumpscares.Value = false
						end
					elseif State == false then
						if game.Players.LocalPlayer:FindFirstChild('Settings') then
							game.Players.LocalPlayer.Settings.Jumpscares.Value = true
						end
					end
				end),
				autorevive = as:Toggle('Auto Revive',false),
				autotickets = sc:Toggle('Autofarm Tickets',false),
				multilocal = asc:Toggle('Local Multiplayer Connection',false,function(State)
					if State == true then
						if game.Players.LocalPlayer:FindFirstChild('Settings') then
							game:GetService("ReplicatedStorage").Events.UpdateSetting:FireServer("CanBeCarried",false)
						end
					elseif State == false then
						if game.Players.LocalPlayer:FindFirstChild('Settings') then
							game:GetService("ReplicatedStorage").Events.UpdateSetting:FireServer("CanBeCarried",true)
						end
					end
				end)
			}
		}
		function evade:GetBots()table.clear(evade.runbots)for a,b in pairs(game.Workspace.Game.Players:GetChildren())do for a,c in pairs(b:GetChildren())do if c:IsA('MeshPart')and c.Color==Color3.fromRGB(196,40,28)then table.insert(evade.runbots,c.Parent.Name)end end end end
		function evade.die() game:GetService("ReplicatedStorage").Events.Reset:FireServer() end
		function evade.tpbuild()
			for i,v in pairs(evade.loadedbuilds) do
				local hum = azu:GetRoot(game.Players.LocalPlayer.Character)
				local fr = string.split(tostring(v),",")
				local x,y,z = tonumber(fr[1]),tonumber(fr[2]),tonumber(fr[3])
				hum.CFrame = CFrame.new(Vector3.new(x,y,z))
				azu:Notification('Teleported')
			end
		end
		function evade.ko()
			loadstring(game:HttpGet(("https://pastebin.com/raw/vTvnE9nN"),true))()
			evade:GetBots()
			local a=evade.runbots[1]
			local b=azu:GetRoot(game.Workspace.Game.Players[a])
			local c=azu:GetRoot(game.Players.LocalPlayer.Character)
			for i = 1,31 do
				wait(.1)
				c.CFrame=b.CFrame
			end
		end
		function evade.connect(plr)
			if table.find(evade.connections,tostring(plr)) then
				if game.Players.LocalPlayer.Name == plr then
					local hum = azu:WaitHum(game.Players[plr].Character)
					if hum then
						if hum.Health == 100 then
							local root = azu:WaitRoot(game.Players[plr].Character)
							azu:Say("you are "..plr,"All")
							azu:Notification('Connecting To You')
						end
					end
				else
					if game.Players[plr]:IsFriendsWith(game.Players.LocalPlayer.UserId) then
						local hum = azu:WaitHum(game.Players[plr].Character)
						if hum then
							if hum.Health == 0 then
								azu:Notification('ERROR | Player Body')
							elseif hum.Health == 100 then
								local root = azu:WaitRoot(game.Players[plr].Character)
								if root.CFrame.Y > 5000 then
									azu:Notification('Player Is Already Playing')
								else
									azu:Say("you are "..plr,"All")
									azu:Notification('Connecting To '..plr)
								end
							end
						else
							azu:Notification('ERROR | Player Body')
						end
					else
						azu:Notification("You're Not Friend With "..plr)
					end
				end
			end
		end
		function evade.respawn() game:GetService("ReplicatedStorage").Events.Respawn:FireServer() end
		function evade.destroybuilds()table.clear(evade.loadedbuilds) for a,b in pairs(game.Workspace:GetChildren())do if b.Name=="Main"then b:Destroy()end end end
		function evade.loadbuild()
			local file = string.split(game:HttpGet('https://pastebin.com/raw/LVr32L9N'), "\n")
			for i, v in pairs(file) do
				local spliter = v:split('|')
				local buildname = tostring(spliter[1])
				local teleport = tostring(spliter[2])
				local base = tostring(spliter[3])
				table.insert(evade.loadedbuilds,teleport)
				loadstring(base)()
				azu:Notification('Loaded | '..buildname)
			end
		end
		function evade.startmap() evade.destroybuilds()  evade.loadbuild() wait(2) evade.tpbuild() end
		function evade.antifunc(f) coroutine.wrap(function() pcall(f) end)() end
		shared.evade = {}
		function shared.evade:GetBots() evade:GetBots() end
		function shared.evade.die() evade.die() end
		function shared.evade.ko() evade.ko() end
		function shared.evade.respawn() evade.respawn() end
		sc:Button('Die',function() evade.die() end)
		sc:Button('Ko',function() evade.ko() end)
		sc:Button('Respawn',function() evade.respawn() end)
		asc:Button('Teleport To Build',function() evade.tpbuild() end)
		asc:Button('Load Build',function() evade.loadbuild() end)
		asc:Button('Destroy Build',function() evade.destroybuilds() end)
		asc:Button('Start Build',function() evade.startmap() end)
		azu:GetMessage('everyone','you are',function(a)
			if evade.config.multilocal.Value == true then
				if game.Players.LocalPlayer.Name == tostring(a) then
					evade.startmap()
				end
			end
		end)
		azu:Command('local','connect',function(a)
			if evade.config.multilocal.Value == true then
				for i,target in pairs(game.Players:GetPlayers()) do
					evade.connect(target.Name)
				end
			else
				azu:Notification('Not Connected At Local Multiplayer')
			end
		end)
		azu:Run(true,function()
			if game.Players.LocalPlayer:FindFirstChild('Settings') then
				if game.Players.LocalPlayer.Settings.CanBeCarried.Value == false then
					game:GetService("ReplicatedStorage").Events.UpdateSetting:FireServer("CanBeCarried",true)
				end
			end
		end)
		for i,plr in pairs(game.Players:GetPlayers()) do
			if game.Players[plr.Name]:FindFirstChild('Settings') then
				game.Players[plr.Name].Settings.CanBeCarried:GetPropertyChangedSignal("Value"):Connect(function()
					local hum = azu:WaitHum(game.Players[plr.Name].Character)
					if hum ~= 0 then
						if table.find(evade.connections, tostring(plr.Name)) then
							table.remove(evade.connections, table.find(evade.connections, tostring(plr.Name)))
						end
						if game.Players[plr.Name]:FindFirstChild('Settings') then
							if game.Players[plr.Name].Settings.CanBeCarried.Value == false then
								table.insert(evade.connections,tostring(plr.Name))
							end
						end
					end
				end)
			end
		end
		game.Players.PlayerAdded:Connect(function(plr)
			if game.Players[plr.Name]:FindFirstChild('Settings') then
				game.Players[plr.Name].Settings.CanBeCarried:GetPropertyChangedSignal("Value"):Connect(function()
					local hum = azu:WaitHum(game.Players[plr.Name].Character)
					if hum ~= 0 then
						if table.find(evade.connections, tostring(plr.Name)) then
							table.remove(evade.connections, table.find(evade.connections, tostring(plr.Name)))
						end
						if game.Players[plr.Name]:FindFirstChild('Settings') then
							if game.Players[plr.Name].Settings.CanBeCarried.Value == false then
								table.insert(evade.connections,tostring(plr.Name))
							end
						end
						
					end
				end)
			end
		end)
		azu:Loop(true,function()
			if evade.config.autotickets.Value == true then
				for i,out in pairs(game.Workspace.Game.Effects.Tickets:GetChildren()) do
					local root = azu:GetRoot(game.Players.LocalPlayer.Character)
					if root then
				    	root.CFrame = out.Mover1.CFrame
				    end
				end
			end
			if evade.config.autorevive.Value == true then
				local hum = azu:GetHum(game.Players.LocalPlayer.Character)
				if hum then
					if hum.Health == 0 then
						evade.respawn()
					end
				end
			end
		end)
	end
end)

game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen();repeat wait() until game:IsLoaded();
local krypt = 6
local GUC = 'https://raw.githubusercontent.com/DaFrenchTokio'
-----------------------------------------------------------------------------------------------------------
loadstring(game:HttpGet((GUC .. "/Azurite/main/Library/base.lua"),true))() -- [[ Silent Loadstring (Azurite Library) ]]
loadstring(game:HttpGet((GUC .. "/LXT/main/execute.lua"),true))()     -- [[ Silent Loadstring (LXT ENCRYPTION)  ]]
-----------------------------------------------------------------------------------------------------------
Players = game:GetService('Players')
WS = game:GetService('Workspace')
RS = game:GetService('RunService')
LP = Players.LocalPlayer
Mouse = LP:GetMouse()





local exploit = loadstring(game:HttpGet((GUC .. "/Azurite/main/Library/exploit.lua"),true))()
local azu = {
	connections = {},
	comp = {
		brookhaven = 4924922222,
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
		icon = "rbxthumb://type=Asset&id=10912483183&w=150&h=150",
		_flyspeed = 1,
		_flystate = false,
		_fly_cs = false
	},
	CoreDocumentation = {
		{"1.05",{"Fixed Library","Added Support"}},
		{"1.04",{"Added Documentation","Added Protection On Gui","Added Support","Added Executor","Added Api","Added Esp"}},
		{"1.03",{"Added Evade Support"}},
		{"1.02",{"Added Toggle","Added Basekey"}},
		{"1.01",{"Added Sliders","Added Multi Supports"}}
	}
}
function azu:Exit() for _,v in pairs(azu.connections) do v:Disconnect() end end
function azu:Hook(connection) table.insert(azu.connections, connection) end
function azu:Sink(Position) return(loadstring(game:HttpGet((GUC .. '/Azurite/main/Library/links.lua'),true))():GetLink(Position)) end
function azu:Kick(player,reason) loadstring(game:HttpGet((azu:Sink(1)),true))():Kick(player,reason) end
function azu:Wait() RS.Heartbeat:Wait() end
function azu:Run(thread,t) coroutine.wrap(function() if thread then local c = true local r = RS.RenderStepped:Connect(function() if c then coroutine.wrap(t)() c = not c end end) return r else local r = coroutine.wrap(t)() return r end end)() end
function azu:Loop(a,b)if a==true then RS.RenderStepped:Connect(b)else coroutine.wrap(function()while true do azu:Wait()coroutine.wrap(b)()end end)()end end
function azu:GetPlayer(a)local b={}local c={}local d=tostring(a)for e,f in pairs(Players:GetChildren())do stringlower=tostring(f.Name)stringsub=string.sub(stringlower,1,#d)if d==stringsub then table.insert(b,f.Name)end end;if b[1]then return b[1]else for e,f in pairs(Players:GetChildren())do stringlower=tostring(f.DisplayName)stringsub=string.sub(stringlower,1,#d)if d==stringsub then table.insert(c,f.Name)end end;if c[1]then return c[1]else return"None"end end end
function azu:GetHum(char) local hum = char:FindFirstChild('Humanoid') return hum end
function azu:WaitHum(char) local hum = char:WaitForChild('Humanoid') return hum end
function azu:WaitRoot(char) local rootPart = char:WaitForChild('HumanoidRootPart') or char:WaitForChild('Torso') or char:WaitForChild('UpperTorso') return rootPart end
function azu:GetRoot(char) local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso') return rootPart end
function azu:Chat(msg) if not game.CoreGui.RobloxGui:FindFirstChild('AzuPrompt') then local p = Instance.new('TextBox') p.Parent = game.CoreGui.RobloxGui p.Name = "AzuPrompt" p.TextTransparency = 1.000 p.BackgroundTransparency = 1.000 end local v = game.CoreGui.RobloxGui.AzuPrompt v:SetTextFromInput(msg) Players:Chat(msg) v:SetTextFromInput(v.Text) end
function azu:Say(msg) game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg,"All") end
function azu:GetMessage(target,name,func) azu.ChatEvent.Service2[name] = {nm = name,target = target,call = func or function() end} end
function azu:Command(target,name,aliases,func) azu.ChatEvent.Service[name] = {nm = name,aliases = aliases,target = target,call = func or function() end} end
function azu:Message(msg) azu:Chat(msg) azu:Say(msg) end
function azu:Notification(t) if shared.settings_azurite then if shared.settings_azurite.notifications == true then pcall(function() game.StarterGui:SetCore("SendNotification", {Title = "Azurite",Text = tostring(t),Icon = "rbxthumb://type=Asset&id=10912483183&w=150&h=150",Duration = 5}) end) end end end
function azu:ServerHop()while wait()do pcall(function()local a={}for b,c in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/"..tostring(azu:GID()).."/servers/Public?sortOrder=Asc&limit=100")).data)do local d=true;if type(c)=="table"and c.maxPlayers>c.playing and c.id~=game.JobId and d then a[#a+1]=c.id;amount=c.playing end end;if#a>0 then wait(0.25)game:GetService("TeleportService"):TeleportToPlaceInstance(tostring(azu:GID()),a[math.random(1,#a)])end;if#a==0 then print("No server found")return end end)end end
function azu:HasGamepass(a,b)local c=game:HttpGet("https://inventory.roblox.com/v1/users/"..a.."/items/GamePass/"..b)local d=false;if string.match(c,tostring(b))then d=true end;return d end
function azu:DisconnectAllSignals(a)if not getconnections then azu:Notification("Incompatible Exploit (hookmetamethod)")else for b,c in pairs(getconnections(a))do c:Disconnect()end end end
function azu:Highlight(a,b,c,d,e,f)local g=game.CoreGui.RobloxGui:FindFirstChild("Esp_Folder_Azurite")or Instance.new('Folder',game.CoreGui.RobloxGui)g.Name="Esp_Folder_Azurite"local h=g:FindFirstChild(b)or Instance.new("Highlight",g)h.Name=b;h.FillTransparency=c;h.OutlineTransparency=d;h.FillColor=e;h.OutlineColor=f;h.Adornee=a;h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop;return h end
function azu:DestroyHighlight(a)local b=game.CoreGui.RobloxGui:FindFirstChild("Esp_Folder_Azurite")if b then if b:FindFirstChild(a)then b:FindFirstChild(a):Destroy()end end end
function azu:ChatSystemEvent(a)
    local b =
        a.Chatted:Connect(
        function(c)
            tablemsg = string.split(c, " ")
            for __, e in pairs(azu.ChatEvent.Service2) do
            	local passing = false
                local f = string.len(e.nm)
                local g = string.sub(tostring(c), f + 2)
                fullcmd = e.nm
                if e.target == "local" and a.Name == LP.Name then
                    if string.sub(tostring(c), 0, f) == fullcmd and tablemsg[1] == fullcmd then
                        passing = true;coroutine.wrap(e.call)(g)
                    end
                elseif e.target == "other" and a.Name ~= LP.Name then
                    if string.sub(tostring(c), 0, f) == fullcmd and tablemsg[1] == fullcmd then
                        passing = true;coroutine.wrap(e.call)(g)
                    end
                elseif e.target == "everyone" then
                    if string.sub(tostring(c), 0, f) == fullcmd and tablemsg[1] == fullcmd then
                        passing = true;coroutine.wrap(e.call)(g)
                    end
                end
                if passing == false then
                	for _, namecommand in pairs(e.aliases) do
                		local f = string.len(namecommand)
		                local g = string.sub(tostring(c), f + 2)
		                fullcmd = namecommand
		                if e.target == "local" and a.Name == LP.Name then
		                    if string.sub(tostring(c), 0, f) == fullcmd and tablemsg[1] == fullcmd then
		                        coroutine.wrap(e.call)(g)
		                    end
		                elseif e.target == "other" and a.Name ~= LP.Name then
		                    if string.sub(tostring(c), 0, f) == fullcmd and tablemsg[1] == fullcmd then
		                        coroutine.wrap(e.call)(g)
		                    end
		                elseif e.target == "everyone" then
		                    if string.sub(tostring(c), 0, f) == fullcmd and tablemsg[1] == fullcmd then
		                        coroutine.wrap(e.call)(g)
		                    end
		                end
                	end
                end
            end
            for __, e in pairs(azu.ChatEvent.Service) do
            	local passing = false
                local f = string.len(azu.ChatEvent.prefix) + string.len(e.nm)
                local g = string.sub(tostring(c), f + 2)
                fullcmd = azu.ChatEvent.prefix .. "" .. e.nm .. ""
                if e.target == "local" and a.Name == LP.Name then
                    if string.sub(tostring(c), 0, f) == fullcmd and tablemsg[1] == fullcmd then
                        passing = true;coroutine.wrap(e.call)(g)
                    end
                elseif e.target == "other" and a.Name ~= LP.Name then
                    if string.sub(tostring(c), 0, f) == fullcmd and tablemsg[1] == fullcmd then
                        passing = true;coroutine.wrap(e.call)(g)
                    end
                elseif e.target == "everyone" then
                    if string.sub(tostring(c), 0, f) == fullcmd and tablemsg[1] == fullcmd then
                        passing = true;coroutine.wrap(e.call)(g)
                    end
                end
                if passing == false then
                	for _, namecommand in pairs(e.aliases) do
                		local f = string.len(azu.ChatEvent.prefix) + string.len(namecommand)
		                local g = string.sub(tostring(c), f + 2)
		                fullcmd = azu.ChatEvent.prefix .. "" .. namecommand .. ""
		                if e.target == "local" and a.Name == LP.Name then
		                    if string.sub(tostring(c), 0, f) == fullcmd and tablemsg[1] == fullcmd then
		                        coroutine.wrap(e.call)(g)
		                    end
		                elseif e.target == "other" and a.Name ~= LP.Name then
		                    if string.sub(tostring(c), 0, f) == fullcmd and tablemsg[1] == fullcmd then
		                        coroutine.wrap(e.call)(g)
		                    end
		                elseif e.target == "everyone" then
		                    if string.sub(tostring(c), 0, f) == fullcmd and tablemsg[1] == fullcmd then
		                        coroutine.wrap(e.call)(g)
		                    end
		                end
                	end
                end
            end
        end
    )
    azu:Hook(b)
end


--[[----------------------------]]
--[[ Azurite Version        --> ]];azu:Run(true,function() while wait(5) do local l = "1234" local ll = game:HttpGet((azu:Sink(6)),true) local match = string.find(string.sub(ll, 1, string.len(l)), l) if not match then if azu.running == false then azu.running = true azu:Kick(LP,"Error | Version / HttpGet") end end end end)
--[[ Azurite API            --> ]];azu:Run(true,function() getgenv().Azurite={}function Azurite:print(a)azuriteconsole.print(a)end;function Azurite:say(a)azu:Say(a)end;function Azurite:Kick(b)azu:Kick(LP,b)end;function Azurite:Chat(a)azu:Chat(a)end end)
--[[ Azurite Compatibility  --> ]];azu:Run(true,function() if not hookmetamethod then azu:Notification('Incompatible Exploit (hookmetamethod)') end if not newcclosure then azu:Notification('Incompatible Exploit (newcclosure)') end if not getrawmetatable then azu:Notification('Incompatible Exploit (getrawmetatable)') end if not exploit.sethidden then azu:Notification('Incompatible Exploit (sethidden)') end if not exploit.gethidden then azu:Notification('Incompatible Exploit (gethidden)') end if not exploit.setsimulation then azu:Notification('Incompatible Exploit (setsimulation)') end if not exploit.queueteleport then azu:Notification('Incompatible Exploit (queueteleport)') end if not exploit.httprequest then azu:Notification('Incompatible Exploit (httprequest)') end end)
--[[ Azurite AntiKick Local --> ]];azu:Run(true,function() local LocalPlayer = LP local oldhmmi local oldhmmnc oldhmmi = hookmetamethod(game, "__index", function(self, method) if self == LocalPlayer and method:lower() == "kick" then if shared.settings_azurite then if shared.settings_azurite.antikick == true then return error("Expected ':' not '.' calling member function Kick", 2) end end end return oldhmmi(self, method) end) oldhmmnc = hookmetamethod(game, "__namecall", function(self, ...) if self == LocalPlayer and getnamecallmethod():lower() == "kick" then if shared.settings_azurite then if shared.settings_azurite.antikick == true then return end end end return oldhmmnc(self, ...) end) end)
--[[----------------------------]]
--[[ ChatSystemEvent        --> ]];azu:Run(true,function()for a,b in pairs(Players:GetPlayers())do azu:ChatSystemEvent(b)end;local c=Players.PlayerAdded:Connect(function(b)azu:ChatSystemEvent(b)end)azu:Hook(c)end)
--[[ FlySystem              --> ]];azu:Run(true,function() function azu.VariableService._sfly(a)if shared.flyKeyDown or shared.flyKeyUp then shared.flyKeyDown:Disconnect()shared.flyKeyUp:Disconnect()end;local b=azu:GetRoot(LP.Character)local c={F=0,B=0,L=0,R=0,Q=0,E=0}local d={F=0,B=0,L=0,R=0,Q=0,E=0}local e=0;shared.flyKeyDown=LP:GetMouse().KeyDown:Connect(function(f)if f:lower()=='w'then c.F=azu.VariableService._flyspeed elseif f:lower()=='s'then c.B=-azu.VariableService._flyspeed elseif f:lower()=='a'then c.L=-azu.VariableService._flyspeed elseif f:lower()=='d'then c.R=azu.VariableService._flyspeed elseif f:lower()=='e'then c.Q=azu.VariableService._flyspeed*2 elseif f:lower()=='q'then c.E=-azu.VariableService._flyspeed*2 end;pcall(function()WS.CurrentCamera.CameraType=Enum.CameraType.Track end)end)shared.flyKeyUp=LP:GetMouse().KeyUp:Connect(function(f)if f:lower()=='w'then c.F=0 elseif f:lower()=='s'then c.B=0 elseif f:lower()=='a'then c.L=0 elseif f:lower()=='d'then c.R=0 elseif f:lower()=='e'then c.Q=0 elseif f:lower()=='q'then c.E=0 end end)local g=true;local h=Instance.new('BodyGyro')local i=Instance.new('BodyVelocity')h.P=9e4;h.Parent=b;i.Parent=b;h.maxTorque=Vector3.new(9e9,9e9,9e9)h.cframe=b.CFrame;i.velocity=Vector3.new(0,0,0)i.maxForce=Vector3.new(9e9,9e9,9e9)task.spawn(function()repeat wait()if not a and LP.Character:FindFirstChildOfClass('Humanoid')then LP.Character:FindFirstChildOfClass('Humanoid').PlatformStand=true end;if c.L+c.R~=0 or c.F+c.B~=0 or c.Q+c.E~=0 then e=50 elseif not(c.L+c.R~=0 or c.F+c.B~=0 or c.Q+c.E~=0)and e~=0 then e=0 end;if c.L+c.R~=0 or c.F+c.B~=0 or c.Q+c.E~=0 then i.velocity=(WS.CurrentCamera.CoordinateFrame.lookVector*(c.F+c.B)+WS.CurrentCamera.CoordinateFrame*CFrame.new(c.L+c.R,(c.F+c.B+c.Q+c.E)*0.2,0).p-WS.CurrentCamera.CoordinateFrame.p)*e;d={F=c.F,B=c.B,L=c.L,R=c.R}elseif c.L+c.R==0 and c.F+c.B==0 and c.Q+c.E==0 and e~=0 then i.velocity=(WS.CurrentCamera.CoordinateFrame.lookVector*(d.F+d.B)+WS.CurrentCamera.CoordinateFrame*CFrame.new(d.L+d.R,(d.F+d.B+c.Q+c.E)*0.2,0).p-WS.CurrentCamera.CoordinateFrame.p)*e else i.velocity=Vector3.new(0,0,0)end;h.cframe=WS.CurrentCamera.CoordinateFrame until azu.VariableService._flystate~=true;c={F=0,B=0,L=0,R=0,Q=0,E=0}d={F=0,B=0,L=0,R=0,Q=0,E=0}e=0;h:Destroy()i:Destroy()LP.Character:WaitForChild('Humanoid').PlatformStand=false end)end;function azu.VariableService.unfly()azu.VariableService._flystate=false;azu.VariableService._fly_cs=false;if shared.flyKeyDown or shared.flyKeyUp then shared.flyKeyDown:Disconnect()shared.flyKeyUp:Disconnect()end;LP.Character:WaitForChild('Humanoid').PlatformStand=false;pcall(function()WS.CurrentCamera.CameraType=Enum.CameraType.Custom end)end;function azu.VariableService.fly(j)azu.VariableService.unfly()wait()azu.VariableService._sfly()azu.VariableService._flystate=true;azu.VariableService._fly_cs=true;azu.VariableService._flyspeed=j end; pcall(function()local a=LP.Character:WaitForChild("Humanoid").Died:Connect(function()azu.VariableService.unfly()azu.VariableService._fly_cs=false end)azu:Hook(a)local a=LP.CharacterAdded:Connect(function(b)azu.VariableService.unfly()azu.VariableService._fly_cs=false;b:WaitForChild("Humanoid").Died:Connect(function()azu.VariableService.unfly()azu.VariableService._fly_cs=false end)end)azu:Hook(a)end) end)
--[[ Azurite Animation      --> ]];azu:Run(false,function() loadstring(game:HttpGet((azu:Sink(2)),true))() end)
--[[ Env Vars               --> ]];azu:Run(true,function() loadstring(game:HttpGet((azu:Sink(4)),true))() end)
--[[----------------------------]]
--[[

				Main

]]--
repeat wait() until sharedazuritebaselua
local main = sharedazuritebaselua:Main()
local basekey = main:BaseKey("v")
local ac = main:Category("Main")
local cmds = main:Category("Commands")
local maintable = {
	esp = ac:Toggle('Esp Players',false),
	noclip = ac:Toggle('Noclip',false,function(State) AzuClip = State end)
}
for i,v in pairs(azu.CoreDocumentation) do main:CreateDocumentation(v[1],v[2]) end
ac:Button("Rejoin",function() game:GetService("TeleportService"):Teleport(game.PlaceId, LP) azu:Notification("Trying To Rejoin The Game") end)
ac:Button("Server Hop",function() azu:ServerHop() azu:Notification("Trying To Server Hop") end)
ac:Button("Fly",function(a)if azu.VariableService._fly_cs==true then azu.VariableService.unfly()azu.VariableService._fly_cs=false else azu.VariableService.fly(1)azu.VariableService._fly_cs=true end end)
ac:Button("Force Reset",function() LP.Character:Destroy() azu:Notification("Trying To Force Reset") end)
ac:Slider("WalkSpeed", azu:GetHum(LP.Character).WalkSpeed,0, 1000, function(State) azu:GetHum(LP.Character).WalkSpeed = State end)
ac:Slider("JumpPower", azu:GetHum(LP.Character).JumpPower,0, 1000, function(State) azu:GetHum(LP.Character).JumpPower = State end)
ac:Slider("Health", azu:GetHum(LP.Character).Health,0, 1000, function(State) azu:GetHum(LP.Character).Health = State end)
azu:Command('local','exitazurite',{"destroyazurite","disconnectscript"},function(arg) azu:Exit() end)
azu:Command("local","fly",{},function(arg) local num = tonumber(arg) if tostring(arg) == "" then num = 1 end if azu.VariableService._fly_cs == true then azu.VariableService.unfly() azu.VariableService._fly_cs = false else azu.VariableService.fly(num) azu.VariableService._fly_cs = true end end)
azu:Command('local',"cmds",{"command","commands"},function(arg) for _,command in pairs(azu.ChatEvent.Service) do print(tostring(azu.ChatEvent.prefix..command.nm)) end azu:Notification('Press F9') end)
azu:Loop(false,function()
	if maintable.esp.Value == true then
		for i,v in pairs(Players:GetPlayers()) do
			if v.Character ~= nil then 
				azu:Highlight(v.Character,v.Name,1,0,Color3.new(0,0,0),Color3.fromRGB(255,255,255)) 
			end
		end
	else
		for i,v in pairs(Players:GetPlayers()) do
			if v.Character ~= nil then 
				azu:DestroyHighlight(v.Name) 
			end
		end
	end
end)
if exploit.GID == azu.comp.brookhaven then
	WS.FallenPartsDestroyHeight = "nan"
	local c_1 = main:Category("Protection")
	local c_2 = main:Category("Click")
	local base = {
		config = {
			clickkill = c_2:Toggle('Click Kill',false),
			antivoid = c_1:Toggle("Anti Void",true)
		},
		VariableService = {
			Killing = false
		}
	}
	function base:SpawnCar(args) local r = game:GetService("ReplicatedStorage").TTT.TTT:FindFirstChild("7B7Ca7B7r") repeat r:FireServer(unpack(args)) wait(1) until game.Workspace.Vehicles:FindFirstChild(LP.Name.."Car") end
	function base:Kill(target)
		base.VariableService.Killing = true
		local old_pos = azu:GetRoot(LP.Character).CFrame
		azu:GetRoot(LP.Character).CFrame = CFrame.new(1322.66357, 74.4999924, -1351.9707, 0.998237252, 3.86682331e-09, 0.0593499206, -3.59287244e-09, 1, -4.72257211e-09, -0.0593499206, 4.50101068e-09, 0.998237252)
		task.wait(.25)
		base:SpawnCar({
    		[1] = "PickingCar",
    		[2] = "Bus"
		})
		LP.Character.Humanoid.Jump = true
		while task.wait() do
			if LP.Character:WaitForChild('Humanoid'):GetState() == Enum.HumanoidStateType.Seated then break end
			local b = game.Workspace.Vehicles:WaitForChild(LP.Name.."Car").Body:WaitForChild('VehicleSeat')
			local c = LP.Character.LowerTorso
			firetouchinterest(b,c,1)
			firetouchinterest(b,c,0)
		end
		while task.wait() do 
			if Players[target].Character:WaitForChild('Humanoid'):GetState() == Enum.HumanoidStateType.Seated then break end
			for i,v in pairs(workspace:GetDescendants()) do
				if v.ClassName == "Part" and v.Anchored == false and v:IsDescendantOf(LP.Character) == false and v.Parent.Parent.Name == LP.Name.."Car" then
					local main = azu:GetRoot(Players[target].Character).CFrame 
					v.CFrame = CFrame.new(Vector3.new(main.X,main.Y - 2,main.Z))
				end
			end
			local seat = Players[target].Character:FindFirstChildOfClass('Humanoid').SeatPart
		    if seat then
		        if seat.Name ~= "Passenger" then
		            for i,v in pairs(workspace:GetDescendants()) do
		                if v.ClassName == "Part" and v.Anchored == false and v:IsDescendantOf(LP.Character) == false and v.Parent.Parent.Name == LP.Name.."Car" then
		                    local main = Players[target].Character:WaitForChild("HumanoidRootPart").CFrame 
		                    v.CFrame = CFrame.new(Vector3.new(main.X,main.Y - 2,main.Z))
		                end
		            end
		        else
		            break
		        end
		    end
		end
		local seat = LP.Character:FindFirstChildOfClass('Humanoid').SeatPart
		local vehicleModel = seat.Parent
		repeat if vehicleModel.ClassName ~= "Model" then vehicleModel = vehicleModel.Parent end until vehicleModel.ClassName == "Model"
		vehicleModel:MoveTo(Vector3.new(0, -150, 0)) -- Move Vehicle To Void
		repeat task.wait() until LP.Character:WaitForChild('Humanoid'):GetState() == Enum.HumanoidStateType.Seated
		task.wait(1)
		azu:GetRoot(LP.Character).CFrame = old_pos
		base.VariableService.Killing = false
	end

	azu:Loop(true,function()
		pcall(function()
			if base.config.antivoid.Value == true then
				local CF = LP.Character.HumanoidRootPart.CFrame
				if CF.Y < 0 then
					LP.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(CF.X, 1.8, CF.Z))
				end
			end
		end)
	end)

	azu:Command('local','ck',{'kill'},function(a) local b=azu:GetPlayer(tostring(a)) if b ~="None" then base:Kill(b) else azu:Notification('No Target') end end)
	azu:Command('local','fixkill',{'killfix','ckfix','fixck'},function(a) base.VariableService.Killing = false end)


	Mouse.Button1Down:Connect(function()
        pcall(function()
            local plr = Mouse.Target.Parent.Parent
            for i, v in pairs(Players:GetPlayers()) do
                pcall(function()
                    if Mouse.Target.Parent:FindFirstChild("Humanoid") then
                        plr = Mouse.Target.Parent
                    end
                end)
            end
            if plr ~= nil and Players:FindFirstChild(plr.Name) then
                if base.config.clickkill.Value == true then
                	base:Kill(plr.Name)
               	end
            end
        end)
    end)
elseif exploit.GID == azu.comp.arsenal then
	local as = main:Category("Special")
	local ar = {
		config = {}
	}
elseif exploit.GID == azu.comp.scp3008 then
	local as = main:Category("Special")
	local scp = {
		WalkSpeed = azu:GetHum(LP.Character).WalkSpeed,
		Health = azu:GetHum(LP.Character).Health,
		JumpPower = azu:GetHum(LP.Character).JumpPower,
		config = {
			WalkSpeed = azu:GetHum(LP.Character).WalkSpeed,
			Health = azu:GetHum(LP.Character).Health,
			JumpPower = azu:GetHum(LP.Character).JumpPower,
			antifd = as:Toggle('Anti Fall Damage',false),
			antics = as:Toggle('Anti Camera Shake',false),
			antikill = as:Toggle('Anti Kill',false)
		},
		teleport = {
            "40,5,80",
            "40,5,480",
            "40,5,880",
            "40,5,1280",
            "40,5,1680",
            "40,5,2080",
            "40,5,2480",
            "440,5,80",
            "840,5,80",
            "1240,5,80",
            "1640,5,80",
            "2440,5,80",
            "440,5,480",
            "440,5,880",
            "440,5,1280",
            "440,5,1680",
            "440,5,2080",
            "440,5,2480",
            "840,5,480",
            "840,5,880",
            "840,5,1280",
            "840,5,1680",
            "840,5,2080",
            "840,5,2480",
            "1240,5,480",
            "1240,5,880",
            "1240,5,1280",
            "1240,5,1680",
            "1240,5,2080",
            "1240,5,2480",
            "1640,5,480",
            "1640,5,880",
            "1640,5,1280",
            "1640,5,1680",
            "1640,5,2080",
            "1640,5,2480",
            "2440,5,480",
            "2440,5,2480",
            "2440,5,1280",
            "2440,5,880",
            "2440,5,2080",
            "2440,5,1680",
            "2040,5,80",
            "2040,5,880",
            "2040,5,1680",
            "2040,5,480",
            "2040,5,1280",
            "2040,5,2080",
            "2040,5,2480"
        }
	}
	function scp.antifunc(f) coroutine.wrap(function() pcall(f) end)() end
	function scp.Delete(part) part.Parent = WS repeat wait() until part.Parent == WS part:Destroy() end
	function scp.tp(player)
		local detected,location = false,"None"
		loadstring(game:HttpGet(("https://pastebin.com/raw/S164zK4M"),true))()
        for i,v in pairs(scp.teleport) do
            if detected == false then
                local split_cframe = string.split(v,",")
                local x,y,z = split_cframe[1],split_cframe[2],split_cframe[3]
                LP.Character:WaitForChild('HumanoidRootPart').CFrame = CFrame.new(x,y,z)
                wait(1)
                local char = Players[player].Character
                if char then
                    local hum = char:FindFirstChild('HumanoidRootPart')
                    if hum then
                        detected = true
                        location = hum
                        LP.Character:WaitForChild('HumanoidRootPart').CFrame = location.CFrame
                    end
                end
            end
        end
        pcall(function() game.CoreGui:FindFirstChild('RobloxUniversalBlackScreen'):Destroy() end)
        local char = Players[player].Character
        if char then
            local hum = char:FindFirstChild('HumanoidRootPart')
            if hum then
                LP.Character:WaitForChild('HumanoidRootPart').CFrame = location.CFrame
            end
        end
        return location
	end
	if shared.settings_azurite.risk == true then
		as:Slider("JumpPower", tonumber(scp.JumpPower), 500, function(State)
			scp.config.JumpPower = tonumber(State)
		end)
		as:Slider("WalkSpeed", tonumber(scp.WalkSpeed), 1000, function(State)
			scp.config.WalkSpeed = tonumber(State)
		end)
		as:Button("Remove Fall Damage",function()
			scp.Delete(WS.GameObjects.Physical.Players:WaitForChild(LP.Name).FallDamage)
			if not WS.GameObjects.Physical.Players:WaitForChild(LP.Name).FallDamage then
				azu:Notification("Removed | Fall Damage")
			end
		end)
	end
	azu:Loop(false,function()
		scp.antifunc(function()
			if scp.config.antics.Value == true then
				if LP.PlayerScripts:FindFirstChild('CameraShake') then
					scp.Delete(LP.PlayerScripts:FindFirstChild('CameraShake'))
				end
			end
			if scp.config.antifd.Value == true then
				if WS.GameObjects.Physical.Players:WaitForChild(LP.Name).FallDamage then
					scp.Delete(WS.GameObjects.Physical.Players:WaitForChild(LP.Name).FallDamage)
				end
			end
		end)
	end)
	azu:Loop(true,function()
		scp.antifunc(function()
			if azu:GetHum(LP.Character).WalkSpeed ~= scp.config.WalkSpeed then
				azu:GetHum(LP.Character).WalkSpeed = scp.config.WalkSpeed
			end
			if azu:GetHum(LP.Character).JumpPower ~= scp.config.JumpPower then
				azu:GetHum(LP.Character).JumpPower = scp.config.JumpPower
			end
		end)
	end)
	azu:Command('local','tp',{"teleport","goto"},function(State)
		local b= azu:GetPlayer(tostring(State))
		if b ~= "None" then
			scp.tp(b)
		else
			azu:Notification('No Target')
		end
	end)
elseif exploit.GID == azu.comp.custom_minigames then
	function fc:Delete(part)
		part.Parent = WS
		repeat wait() until part.Parent == WS
		part.Name = 'Temp'
		part:Destroy()
	end
	local as = main:Category("Special")
	if shared.settings_azurite then
		if shared.settings_azurite.risk == true then
			local toggle_1 = as:Toggle("Freeze",false)
			azu:Loop(true,function()
				if shared.settings_azurite.risk == true then
					local root = azu:GetRoot(LP.Character)
					if root.Anchored ~= toggle_1.Value then
						root.Anchored = toggle_1.Value
					end
				end
			end)
			if LP.PlayerScripts:FindFirstChild('MainClient') then
				azu:DisconnectAllSignals(LP.PlayerScripts:FindFirstChild('MainClient').Changed)
				LP.PlayerScripts:FindFirstChild('MainClient'):Destroy()
				loadstring(game:HttpGet(("https://pastebin.com/raw/203cri57"),true))();
				local setspeed = 16
				local setjump = 50
				local Hum = LP.Character:WaitForChild('Humanoid')
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
								LP.Character:WaitForChild('Humanoid').WalkSpeed = State
								setspeed = State
							end
						end)
						as:Slider("JumpPower", 50, 500, function(State)
							if shared.settings_azurite.risk == true then
								LP.Character:WaitForChild('Humanoid').JumpPower = State
								setjump = State
							end
						end)
						local el = WS.WaitingRoom.VIPElevator
						local plat = el:FindFirstChild('Platform')
						local block = {
							RoomCatch = WS.VIPRoom:FindFirstChild('RoomCatch'),
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
								local hum = LP.Character:WaitForChild('Humanoid')
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
elseif exploit.GID == azu.comp.swift_hightail then
	local as = main:Category('Special')
	local sh = {
		config = {
			autofarm = as:Toggle('Auto Farm',false)
		}
	}
	azu:Loop(true,function()
		if sh.config.autofarm.Value == true then
			wait(1)
	        local map = WS:WaitForChild('Map')
	        if map then
	            local root = map:WaitForChild("S 20"):WaitForChild('root')
	            local finDes = map:WaitForChild("S 35"):WaitForChild('finDes')
	            local selfroot = azu:WaitRoot(LP.Character)
	            if selfroot then
	                selfroot.Position = Vector3.new(root.Position.x, root.Position.y, root.Position.z)
	                wait(0.1)
	                selfroot.Position = Vector3.new(finDes.Position.x, finDes.Position.y, finDes.Position.z)
	            end
	        end
		end
	end)
elseif exploit.GID == azu.comp.bendy_fake_admin then
	local as = main:Category("Special")
	as:Button('Crash',function()
	end)
elseif exploit.GID == azu.comp.public_bath_room then
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
		    LP.Backpack.ChildAdded:Connect(function()
		        count = count + 1
		    end)
		    game.StarterGui:SetCoreGuiEnabled('Backpack', false)
		    azu:Loop(true,function()
		        if lopper == true then
		            fireclickdetector(WS['Trash can'].Trash.Can.ClickDetector)
		            fireclickdetector(WS['Trash can'].Trash.Can.ClickDetector)
		            fireclickdetector(WS['Trash can'].Trash.Can.ClickDetector)
		            fireclickdetector(WS.CheeseGiver.ClickDetector)
		            if count > 3000 then 
		                lopper = false
		            end
		        end
		    end)
		    repeat wait() until count > 3000
		    game.StarterGui:SetCoreGuiEnabled('Backpack', true)
		    for i,v in pairs(LP.Backpack:GetChildren()) do
		        v.Parent = LP.Character
		    end
		    wait(2)
		    for i,v in pairs(LP.Character:GetDescendants()) do
		        if v:IsA('MeshPart') then
		            v:Destroy()
		        end
		        if v:IsA('Part') then
		            v:Destroy()
		        end
		    end
		    wait(5)
		    for i, v in pairs(LP.Character:GetChildren()) do
		        if v:IsA("Tool") then
		            v.Parent = WS
		        end
		    end
		    for i = 1,5 do
		        LP.Character.Humanoid.Health = 0
		    end
		end)()
	end)
	azu:Loop(false,function()
		if pbr.config.megalag.Value == true then
			for i,v in pairs(LP.Backpack:GetChildren()) do
	            if v.Name == "TpRoll" then
	                v.Parent = LP.Character
	            end
	        end
	        for i,v in pairs (LP.Character:GetChildren()) do
	            if v.Name == "TpRoll" then
	                v:Activate()
	            end
	        end
		end
		if pbr.config.antilag.Value == true then
			for i,v in pairs(WS:GetChildren()) do
	            if v:IsA('Part') and v.Color == Color3.fromRGB(237, 237, 235) then
	                v:Destroy()
	            end
	        end
	        for i,v in pairs(WS:GetChildren()) do
	            if v:IsA('Tool') then
	                v:Destroy()
	            end
	        end
		end
	end)
elseif exploit.GID == azu.comp.skywars then
	WS.FallenPartsDestroyHeight = 0 / 0
	local as = main:Category("Special")
	local skywars = {
		config = {
			autokill = {},
			autofarm = as:Toggle('Auto Farm',false)
		}
	}
	as:Button("Destroy Borders",function()
		local invisible = WS.Borders:FindFirstChild('InvisibleBorder')
		if invisible then
		    invisible:Destroy()
		    azu:Notification('Destroyed | Invisible Border')
		end
		local kill = WS.Lobby:FindFirstChild('KillPlates')
		if kill then
		    kill:Destroy()
		    notification('Destroyed | Kill Border')
		end
	end)
	as:Button("Tokio Custom Theme",function()
		loadstring(game:HttpGet('https://pastebin.com/raw/8Y6iixn8',true))()
	end)
	azu:Command('local','autokill',{},function(a)
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
			if LP.Character:FindFirstChild('HumanoidRootPart').CFrame.Y < 165 then
			    LP.Character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(Vector3.new(LP.Character:FindFirstChild('HumanoidRootPart').CFrame.X, LP.Character:FindFirstChild('HumanoidRootPart').CFrame.Y + 25, LP.Character.HumanoidRootPart.CFrame.Z))
			end
			azu:Wait()
	        local count = 0
	        for i,player in pairs(Players:GetPlayers()) do
	            count = count + 1
	            if player.Name ~= LP.Name then 
	                local Root = azu:WaitRoot(Players:FindFirstChild(player.Name).Character)
	                local PlayerRoot = azu:WaitRoot(LP.Character)
	                local Humanoid = azu:WaitHum(Players:FindFirstChild(player.Name).Character)
	                if Root and Humanoid.Health > 0.01 then
                        if Root.CFrame.Y < 250 and PlayerRoot.CFrame.Y < 250 then
                            for i,v in pairs(LP.Backpack:GetChildren()) do
                                if v:IsA('Tool') then
                                    if v.Name == "Sword" then
                                        azu:WaitHum(LP.Character):EquipTool(v)
                                    end
                                end
                            end
                            local check = CFrame.new(Vector3.new(Root.CFrame.X, Root.CFrame.Y - 4, Root.CFrame.Z))
                            PlayerRoot.CFrame = check + Root.CFrame.LookVector * -1
                            game:GetService("VirtualUser"):ClickButton1(Vector2.new(500,0))
                            if azu:WaitHum(LP.Character).Health ~= 100 then
                                azu:WaitHum(LP.Character).Health = 100
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
	        for i,player in pairs(Players:GetPlayers()) do
	        	for i,v in pairs(skywars.config.autokill) do
	        		if v == player.Name then
			            count = count + 1
			            if player.Name ~= LP.Name then 
			                local Root = azu:WaitRoot(Players:FindFirstChild(player.Name).Character)
			                local PlayerRoot = azu:WaitRoot(LP.Character)
			                local Humanoid = azu:WaitHum(Players:FindFirstChild(player.Name).Character)
			                if Root and Humanoid.Health > 0.01 then
	                            if Root.CFrame.Y < 250 and PlayerRoot.CFrame.Y < 250 then
	                                for i,v in pairs(LP.Backpack:GetChildren()) do
	                                    if v:IsA('Tool') then
	                                        if v.Name == "Sword" then
	                                            azu:WaitHum(LP.Character):EquipTool(v)
	                                        end
	                                    end
	                                end
	                                local check = CFrame.new(Vector3.new(Root.CFrame.X, Root.CFrame.Y - 4, Root.CFrame.Z))
	                                PlayerRoot.CFrame = check + Root.CFrame.LookVector * -1
	                                game:GetService("VirtualUser"):ClickButton1(Vector2.new(500,0))
	                                if azu:WaitHum(LP.Character).Health ~= 100 then
	                                    azu:WaitHum(LP.Character).Health = 100
	                                end
	                            end
	                        end
			            end
			        end
		        end
	        end
		end
	end)
elseif exploit.GID == azu.comp.khols_admin_house then
	WS.FallenPartsDestroyHeight = "nan"
	local as = main:Category("Protection")
	local asc = main:Category("Click")
	local ser = main:Category("Server")
	local khols = {
		gamefolder = WS.Terrain._Game,
		folder = WS.Terrain["_Game"].Folder,
		adminfolder = WS.Terrain._Game.Admin,
		WSfolder = WS.Terrain._Game.Workspace,
		config = {
			perm = as:Toggle('Perm', false),
			antipads = as:Toggle("Anti Pads",false),
			join_notification = as:Toggle("Joiners",false), -- You are Notified from all users joining the game.
			c_system_notification = as:Toggle("Silent Players",false), -- You Are Notified From all users using "/c system"
			logs_notification = as:Toggle("Logs Players",false), -- You Are Notified From All users using logs
			players_perm = as:Toggle("Admin Everyone",false), -- When Someone Join, He's Admin By You.
			players_kick = as:Toggle("Kick Everyone",false), -- When Someone Join, He's Kicked By You
			antisetgrav = as:Toggle("Anti Setgrav",false),
			antiblind = as:Toggle("Anti Blind",false),
			antigui = as:Toggle("Anti Gui",false), -- Anti Gui From Khols
			antikick = as:Toggle("Anti Kick",false),
			antikill = as:Toggle("Anti Kill",false), -- Anti Kill
			antijail = as:Toggle("Anti Jail",false), -- Anti Jail
			anticrashVG = as:Toggle("Anti Vampire Crash",false), -- Anti Vampire Crash 
			antiattach = as:Toggle("Anti Attach",false), -- Anti Users Attaching to something
			anti2pads = as:Toggle("Anti 2 Pads",false), -- Players Can't get more than 1 pad
			chatlogs = as:Toggle("ChatLogs",false),
			mymusiconly = as:Toggle("My Music Only",false), 
			mymusiconly_ID = 0,
			clickexplode = asc:Toggle("Explode",false),
			clickkill = asc:Toggle("Kill",false),
			clickfling = asc:Toggle("Fling",false),
			antivoid = as:Toggle("Anti Void",true), -- Anti Fall In Void
			antiabusegears = as:Toggle("Anti Abuse Gears",true), -- If someone have specific abuse gears, the inventory will be reseted
			antigrayscale = as:Toggle("Anti Grayscale",true), -- Anti DIO Stop Time
			antijailgearban = as:Toggle("Anti JailGearBan",true), -- Anti JailGearBan
			serverantikick = ser:Toggle("Anti Kick",false)
		},
		Choice = {
			Regen = {"regenpad","padregen","regen pad","pad regen","resetpad","padreset","reset pad","pad reset","regen","reset","rp","reg","res"},
			Baseplate = {"bp","pb","baseplate","platebase","base plate","plate base","Baseplate"},
			House = {"basichouse","housebasic","basic house","house basic","house","basic","home","House","Home"},
			ObbyBox = {"obbybox","boxobby","obby box","box obby"},
			ObbyKill = {"obbybricks","bricksobby","obby bricks","bricks obby","brick obby","obby brick","kill obby","obby kill","killobby","obbykill","kill"},
			Pad_Divider = {"admindividers","dividersadmin","dividers admin","admin dividers","admindivider","divideradmin","divider admin","admin divider","dividers","divider"},
			Pads = {"adminpads","padsadmin","pads admin","pads dividers","adminpad","padadmin","pad admin","admin pad","pads","pad"},
			Bricks = {"buildingbricks","bricksbuilding","building bricks","bricks building","brick building","building brick","part building","building part","partbuilding","buildingpart","parts building","building parts","partsbuilding","buildingparts"}
		},
		Status = {
			perm = azu:HasGamepass(LP.UserId,66254),
			person299 = azu:HasGamepass(LP.UserId,35748),
			detect = false,
			move = false,
			spam = false,
			r_floor = false,
			r_pads = false,
			r_kill = false,
			r_box = false
		},
		VarScript = {
			obbybricks_kill_function = true,
			s_command = "",
			r_part = Instance.new("Part", WS),
			r_speed = 0.5
		},
		VariableService = {
			players_pad = {},
			players_vip = {},
			players_custom_admin = {},
			players_kick = {},
			players_crash = {"vh7z"},
			advert = {
				christmas = {
					songs = {332680119,332679998},
					message = {
						"Merry Christmas ! Here's Your Gift :D",
						'Stop Being On The Computer...\n\nGo Touch Some Santa >:)',
						'Imagine Having Coal At Christmas XD',
						"The best thing to ask for on Christmas is \n\nlove from your parents or vbucks xd"
					}
				},
				normal = {
					songs = {45830511,35930009,9042182693},
					message = {
						"I Saw You Saying \n\n<< werape @ children >>\n\n\nAre You A Cannibalism? :O",
						'- Open Cmd\n\n-Execute This In Cmd: "curl parrot.live',
						"Invest in robux to go to heaven faster :)",
						"Imagine you become an NPC. What are you doing? 0_0"
					}
				}
			}
		}
	}
	function khols.fast_find()LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,2006,90))wait(.25)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,4006,90))wait(.25)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,6006,90))wait(.25)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,8006,90))wait(.25)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,10006,90))wait(.25)end
	function khols.stop_rainbow()khols.Status.r_floor=false;khols.Status.r_kill=false;khols.Status.r_box=false;khols.Status.r_pads=false end
	function khols.stop()azu:Notification("Stopped Tasks")khols.stop_rainbow()khols.Status.spam=false;khols.Status.detect=false; khols.Status.move=false end
	function khols.antifunc(f) coroutine.wrap(function() pcall(f) end)() end
	function khols.regen() pcall(function() fireclickdetector(khols.adminfolder:FindFirstChild('Regen').ClickDetector, 0) end) end
	function khols.move(part, fram)
		khols.VarScript.obbybricks_kill_function = false
		pcall(function()
			if part then
			    repeat
			        wait()
			    until khols.Status.move == false
			    khols.Status.move = true
			    local position = fram or CFrame.new(Vector3.new(math.random(100,1000), math.random(-732819,-712819), math.random(100,1000)))
			    local function ivory()repeat if not khols.adminfolder.Pads:FindFirstChild(LP.Name.."'s admin")then if khols.adminfolder.Pads:FindFirstChild("Touch to get admin")then local b=khols.adminfolder.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head")local c=LP.Character:FindFirstChild("Left Leg")firetouchinterest(b,c,1)firetouchinterest(b,c,0)else khols.regen()end end;wait()if LP.Backpack:FindFirstChild("IvoryPeriastron")then LP.Character.Humanoid:EquipTool(LP.Backpack.IvoryPeriastron)end;if LP.Character:FindFirstChild("IvoryPeriastron")then else azu:Chat("gear me 000000000000000000108158379")wait(.2)end;wait()until LP.Character:FindFirstChild("IvoryPeriastron")wait(.1)end
			    local function remoteivory() local b=LP.Character:FindFirstChild("IvoryPeriastron") if b then repeat RS.Heartbeat:wait()until b:FindFirstChild("Remote") local c=b:FindFirstChild("Remote")c:FireServer(Enum.KeyCode.E) else khols.Status.move = false end end
			    local spos = LP.Character.HumanoidRootPart.CFrame
			    for i, v in pairs(WS:GetDescendants()) do
			        if v ~= part and v:IsA("Part") then
			            v.CanCollide = false
			        end
			    end
			    WS.Gravity = 0
			    LP.Character.HumanoidRootPart.Anchored = true
			    wait()
			    LP.Character.HumanoidRootPart.Anchored = false
			    wait()
			    LP.Character.HumanoidRootPart.CFrame = position
			    wait()
			    LP.Character.HumanoidRootPart.CFrame = position
			    wait()
			    ivory()
			    khols.pcmd('invis','me')
			    wait()
			    local tempting = true
			    coroutine.wrap(function()
			        while tempting == true do
			            WS.Gravity = 0
			            LP.Character.HumanoidRootPart.CFrame = position
			            azu:Wait()
			        end
			    end)()
			    wait(.1)
			    LP.Character.HumanoidRootPart.Anchored = true
			    wait(.1)
			    tempting = false
			    wait(.35)
			    remoteivory()
			    wait(.35)
			    repeat
			        RS.Heartbeat:wait()
			    until WS.Camera:FindFirstChild("FakeCharacter")
			    LP.Character:WaitForChild('HumanoidRootPart').Anchored = false
			    local me = LP
			    local function movepart()
			        if me.Character then
			            if me.Character:FindFirstChild("HumanoidRootPart") then
			                local looping = true
			                spawn(function()
			                    pcall(function()
		                    		while true do
				                        azu:Wait()
				                        local cf = azu:GetRoot(LP.Character)
				                        azu:GetHum(LP.Character):ChangeState(11)
				                        cf.CFrame = part.CFrame * CFrame.new(-1*(part.Size.X/2)-(LP.Character:FindFirstChild('Torso').Size.X/2), 0, 0)
				                        if not looping then break end
				                    end
			                    end)
			                end)
			                spawn(function() while looping do wait(.1) khols.pcmd('unpunish','me') end end)
			                wait(0.25)
			                looping = false
			            end
			        end
			    end
			    pcall(function()
				    repeat
				        movepart()
				    until LP.Character.Torso:FindFirstChild("Weld")
				end)
			    wait()
			    pcall(function()
				    for i, v in pairs(LP.Character.Torso:GetChildren()) do
				        if v:IsA("Weld") and v.Part1 ~= part then
				            v:Destroy()
				        end
				    end
				end)
			    wait()
			    remoteivory()
			    pcall(function()
			    	if LP.Character:FindFirstChild("IvoryPeriastron") or LP.Backpack:FindFirstChild("IvoryPeriastron") then
					    repeat
					        RS.Heartbeat:wait()
					    until WS:FindFirstChild("Pulse")
					end
				end)
			    azu:Chat("respawn me")
			    if WS:FindFirstChild("Pulse") then
			    	WS:FindFirstChild("Pulse"):Destroy()
			    end
			    for i, v in pairs(WS:GetDescendants()) do
			        if v:IsA("Part") then
			            v.CanCollide = true
			        end
			    end
			    repeat
			        RS.Heartbeat:wait()
			    until(WS:FindFirstChild(me.Name))
			    wait(.2)
			    part = nil
			    WS.Gravity = 196.2
			    wait()
			    LP.Character.HumanoidRootPart.CFrame = spos
			    khols.Status.move = false
			end
		end)
		khols.VarScript.obbybricks_kill_function = true
	end
	function khols.pcmd(Command,Player)
		local a={"{}{}","{{}}"}
		local b=""
		for c=1,30 do
			b=b..a[math.random(1,#a)]
		end;
		azu:Chat(Command..' '..b..' '..Player..'\n'..b..'\n'..b..'\n'..b..'\n'..b..'\n'..b..'\n'..b..'')
	end
	function khols.crash()for a=1,10 do azu:Chat("size all 0.3")azu:Chat("size all 0.3")azu:Chat("size all 0.3")azu:Chat("freeze all")azu:Chat("size all 10")azu:Chat("size all 10")azu:Chat("size all 10")azu:Chat("clone all")azu:Chat("size all 0.3")azu:Chat("size all 0.3")azu:Chat("size all 0.3")azu:Chat("freeze all")azu:Chat("size all 10")azu:Chat("size all 10")azu:Chat("size all 10")azu:Chat("clone all")azu:Chat("size all 0.3")azu:Chat("size all 0.3")azu:Chat("size all 0.3")azu:Chat("freeze all")azu:Chat("size all 10")azu:Chat("size all 10")azu:Chat("size all 10")azu:Chat("clone all")end;for a=1,15 do azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")azu:Chat("freeze all")azu:Chat("thaw all")end end
	function khols.advert(target)
		choice=math.random(1,2)
		normal=khols.VariableService.advert.normal;
		christmas=khols.VariableService.advert.christmas;
		day=tonumber(os.date("%d"))
		month=os.date("%b")
		l="\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
		local a=normal.message[math.random(1,#normal.message)]
		local b=tostring(normal.songs[math.random(1,#normal.songs)])
		if choice==2 then 
			if month=="Dec"then 
				if day<27 then 
					b=tostring(christmas.songs[math.random(1,#christmas.songs)])
					a=christmas.message[math.random(1,#christmas.message)]
				end 
			end 
		end;
		ad = {l..'You Have Been Kicked By Azurite\n-----------------------\n\n\n\n\n'..a..''..l..'\n\n',b}
		if khols.Status.person299 == true then
			azu:Chat('pm/'..target..' '..ad[1])
		else
			azu:Chat('h \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'..target..' '..ad[1])
			spawn(function()
				wait(1.2)
				for i,v in pairs(Players:GetPlayers()) do
					if v.Name ~= target and v.Name ~= LP.Name then
						khols.pcmd('reset',v.Name)
					end
				end
			end)
		end
		azu:Chat('music '..ad[2])
	end
	function khols.prevent()
		local hey = [[




Join Server !
Check Chat For Link
]]
		azu:Say('Link -> dsc . gg / azteam')
		azu:Chat('name all '..hey)
		wait(1.2)
		khols.pcmd('clone','all')
		repeat wait() until khols.folder:FindFirstChild(LP.Name)
		khols.pcmd('unname','all')
		khols.pcmd('stun','all')
		khols.pcmd('invis','all')
		azu:Chat('fogcolor 0 175 255')
		khols.pcmd('fogend','50')
		wait(0.75)
	end
	function khols.PlayerService(player)
	    if string.sub(player.Name, 1, 4) == "all_" or string.sub(player.Name, 1, 7) == "friends_" or string.sub(player.Name, 1, 3) == "me_" or string.sub(player.Name, 1, 6) == "others_" then
	        azu:Chat("pm "..player.Name.." Your account name does not follow Azurite rules.")
	        azu:Chat(azu.ChatEvent.prefix..'kick '..player.Name)
	    end
		if khols.config.players_kick.Value == true then
			azu:Chat(azu.ChatEvent.prefix..'kick '..player.Name)
		end
		if khols.config.players_perm.Value == true then
			azu:Chat(azu.ChatEvent.prefix..'admin '..player.Name)
		end
		Players[player.Name].Chatted:Connect(function(msg)
			if player.Name == LP.Name then
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
			if player.Name ~= LP.Name then
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
				if player.Name ~= LP.Name then
					if Players:FindFirstChild(player.Name) then
						if Players[player.Name].Character then
							if Players[player.Name].Character ~= nil then
								if Players[player.Name].Character:FindFirstChild("SeaThemedCrossbow") then
									azu:Chat("respawn "..player.Name)
									wait(0.28)
								end
								if khols.config.antigrayscale.Value == true then
									if Players[player.Name].Character:FindFirstChild("DaggerOfShatteredDimensions") then
										azu:Chat("respawn "..player.Name)
										wait(0.28)
									end
								end
								if Players[player.Name].Character:FindFirstChild("SeaThemedCrossbow") then
									azu:Chat("respawn "..player.Name)
									wait(0.28)
								end
								if Players[player.Name].Character:FindFirstChild("PortableJustice") then
									azu:Chat("respawn "..player.Name)
									wait(0.28)
								end
							end
						end
					end
				end
			end
			if khols.config.anticrashVG.Value == true then
				if Players[player.Name].Character then
					if Players[player.Name]:FindFirstChild("VampireVanquisher") then
						azu:Chat("reset "..player.Name)
					end
					if Players[player.Name]:FindFirstChild("HumanoidRootPart") then
						if Players[player.Name].HumanoidRootPart.Size.Y <= 0.3 then
							azu:Chat("reset "..player.Name)
						end
					end
				end
			end
			if khols.config.antiattach.Value == true then
				if Players[player.Name].Character:FindFirstChild("IvoryPeriastron") or string.sub(msg:lower(),0,8) == "unpunish" or string.sub(msg:lower(),0,9) == ":unpunish" or string.sub(msg:lower(),0,3) == "sit" or string.sub(msg:lower(),0,4) == ":sit" or string.sub(msg:lower(),0,4) == "stun" or string.sub(msg:lower(),0,5) == ":stun" then
					if player.Name ~= LP.Name then
						azu:Chat("respawn "..player.Name)
					end
				end
			end
			if khols.config.chatlogs.Value == true then
				_pcmd_ = string.gsub(string.gsub(msg, "😎", ""), "😱", "")
				print("["..player.Name.."]: ".._pcmd_)
			end
			if khols.config.c_system_notification.Value == true then
				if string.sub(msg:lower(), 0, 9) == "/c system" then
					if player.Name ~= LP.Name then
						azu:Notification(player.Name.." using /c system !")
					end
				end
			end
			if khols.config.logs_notification.Value == true then
				if string.sub(msg:lower(), 0, 4) == "logs" or string.sub(msg:lower(), 0, 5) == ":logs" or string.sub(msg:lower(), 0, 6) == "::logs" then
					if player.Name ~= LP.Name then
						azu:Notification(player.Name.." using logs")
					end
				end
			end
			if khols.config.antijail.Value == true then
				if string.sub(msg:lower(), 0, 4) == "jail" or string.sub(msg:lower(), 0, 5) == ":jail" or string.sub(msg:lower(), 0, 6) == "::jail" then
					if khols.folder[LP.Name.."'s jail"] then
						azu:Chat('unjail me')
					end
				end
			end
		end)
	end
	khols.VarScript.obbybricks_kill_function = true
	for i, v in pairs(khols.WSfolder.Obby:GetChildren()) do
		pcall(function()
			v.TouchInterest:Destroy()
		end)	
	end
	coroutine.wrap(function()
		task.wait(5)
		for _,v in pairs(khols.WSfolder.Obby:GetChildren()) do
			if khols.WSfolder.Obby:FindFirstChild(v.Name) then
				local c = v.Touched:Connect(function(p)
					if khols.VarScript.obbybricks_kill_function then
						if p.Parent then
							if p.Parent == LP then
				        		LP.Character:BreakJoints()
				        	end
				        end
				    end
				end)
				azu:Hook(c)
			end
		end
	end)
	for i,plr in pairs(Players:GetChildren()) do khols.PlayerService(plr) end
	Players.PlayerAdded:Connect(function(plr) 
		if khols.config.join_notification.Value == true then 
			azu:Notification(plr.Name.." has joined the game") 
		end
		if table.find(khols.VariableService.players_crash,plr.Name) then
			task.wait(1)
			azu:Chat(azu.ChatEvent.prefix..'lk '..plr.Name)
		end
		khols.PlayerService(plr)
	end)
	azu:Loop(false,function()
		khols.antifunc(function()
			if khols.config.perm.Value == true then	
				if not khols.adminfolder.Pads:FindFirstChild(LP.Name .. "'s admin") then
					if khols.adminfolder.Pads:FindFirstChild("Touch to get admin") then
						local pad = khols.adminfolder.Pads:FindFirstChild("Touch to get admin"):FindFirstChild("Head")
						firetouchinterest(WS:WaitForChild(LP.Name)["Left Leg"], pad, 0)
						firetouchinterest(WS:WaitForChild(LP.Name)["Left Leg"], pad, 1)
					else
						khols.regen()
					end
				end
			end
		end)
	end)

	azu:Loop(false,function()
		khols.antifunc(function()
			if khols.Status.detect == true then
				LP.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(LP.Character.HumanoidRootPart.CFrame.X, LP.Character.HumanoidRootPart.CFrame.Y + 1500, LP.Character.HumanoidRootPart.CFrame.Z))
				if WS.Terrain["_Game"].Admin:FindFirstChild('Regen') then 
					khols.Status.detect = false
					local cf = azu:GetRoot(LP.Character)
					azu:Notification('Regen Pad Has Been Found !')
					for i = 1,5 do cf.CFrame = khols.adminfolder.Regen.CFrame end
				end
			end
		end)
	end)
	azu:Loop(true,function()
		khols.antifunc(function()
			if khols.config.serverantikick.Value == true then
				for i,player in pairs(Players:GetPlayers()) do
					if not player.Character:FindFirstChild('Humanoid') then
						azu:Chat('char '..player.Name..' 200')
					end
				end
			end
		end)
		khols.antifunc(function()
			if khols.config.antivoid.Value == true then
				local CF = LP.Character.HumanoidRootPart.CFrame
				if CF.Y < 0 then
					LP.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(CF.X, 3, CF.Z))
				end
			end
		end)
		khols.antifunc(function()
			if khols.config.antipads.Value == true then	
				for i,v in pairs(khols.adminfolder.Pads:GetChildren()) do
					firetouchinterest(WS:WaitForChild(LP.Name)["Left Leg"], v.Head, 0)
					firetouchinterest(WS:WaitForChild(LP.Name)["Left Leg"], v.Head, 1)
				end
				for i,v in pairs(khols.adminfolder.Pads:GetChildren()) do
					if v.Name ~= LP.Name.."'s admin" then
						khols.regen()
					end
				end
			end
		end)
		khols.antifunc(function()
			local Backpack = LP:FindFirstChildOfClass("Backpack")
			banned = {"HotPotato","Ro-Orb","BlueBucket"}
			if khols.config.antikick.Value == true then
				for _, v in ipairs(Backpack:GetChildren()) do
					if table.find(banned,v.Name) then
						v.Parent = WS
					end
				end
				for _, v in ipairs(LP.Character:GetChildren()) do
					if v:IsA('Tool') and table.find(banned,v.Name) then
						v.Parent = WS
					end
				end
			end
		end)
		khols.antifunc(function()
			if khols.config.antigui.Value == true then
				for i, v in pairs(LP.PlayerGui:GetDescendants()) do
					if v.Name == "MessageGUI" or v.Name == "Message" or v.Name == "EFFECTGUIBLIND" or v.Name == "HintGUI" then
						v:Destroy()
					end
				end
			end
		end)
		khols.antifunc(function()
			if khols.config.antiblind.Value == true then
				for i,v in pairs(LP.PlayerGui:GetChildren()) do
					if v.Name == "EFFECTGUIBLIND" then
						v:Destroy()
					end
				end
			end
		end)
		khols.antifunc(function()
			if khols.config.antijailgearban.Value == true then
				if LP.Character:FindFirstChild("Part") then
					LP.Character:FindFirstChild("Part"):Destroy()
					azu:Wait()
					azu:WaitHum(LP.Character).WalkSpeed = 16
					azu:WaitHum(LP.Character).JumpPower = 50
					game.StarterGui:SetCoreGuiEnabled('Backpack', true)
				end
			end
		end)
		khols.antifunc(function()
			if khols.config.antigrayscale.Value == true then
				for i,v in pairs(WS:GetChildren()) do
					if v.Name == "Part" and v.CanCollide == false then
						v:Destroy()
						if WS.CurrentCamera:FindFirstChild("GrayScale") then
							WS.CurrentCamera:FindFirstChild("GrayScale"):Destroy()
						end
						for i,v in pairs(LP.Character:GetChildren()) do
							if v:IsA('Part') and v.Anchored == true then
								v.Anchored = false
							end
						end
						azu:GetHum(LP.Character).WalkSpeed = 16
						azu:GetHum(LP.Character).JumpPower = 50
					end
				end
			end
		end)
		khols.antifunc(function() if khols.Status.spam == true then azu:Chat(khols.VariableService.spam_command) end end)
	end)
	azu:Loop(false,function()
		khols.antifunc(function()
			for i,v in pairs(khols.VariableService.players_kick) do
				if Players:FindFirstChild(v) then
					if Players[v].Character ~= nil then
						if string.sub(v:lower(), 0, 3) == "me_" or string.sub(v:lower(), 0, 8) == "friends_" or string.sub(v:lower(), 0, 7) == "others_" or string.sub(v:lower(), 0, 4) == "all_" then
							azu:Chat('punish others')
							for i,user in pairs(Players:GetPlayers()) do
								if string.sub(user.Name:lower(), 0, 3) ~= "me_" or string.sub(user.Name:lower(), 0, 8) ~= "friends_" or string.sub(user.Name:lower(), 0, 7) ~= "others_" or string.sub(v:lower(), 0, 4) ~= "all_" then
									if user.Name ~= LP then
										azu:Chat('unpunish '..user.Name)
									end
								end
							end
						else
							if Players:FindFirstChild(v) then
								azu:Chat('punish '..v)
							end
						end
					end
				end
			end
		end)
	end)
	LP.Character:WaitForChild("Humanoid").Died:Connect(function()
		if khols.config.antikill.Value == true then
			khols.pcmd('reset','me')
			khols.pcmd('ff','me')
		end
	end)
	LP.CharacterAdded:Connect(function(Char)
		coroutine.wrap(function()
            LP.Character.DescendantAdded:Connect(function(i)
                if i.Name == "BodyForce" and khols.config.antisetgrav.Value == true then
                    local root = azu:GetRoot(LP.Character)
                    i.Force = Vector3.new(0, 0, 0)
                    repeat
                        azu:Wait()
                    until i == nil
                    root.Velocity = Vector3.new(0, 0, 0)
                elseif i.Name == "BodyPosition" and khols.config.antisetgrav.Value == true then
                    i:Destroy()
                    root.Velocity = Vector3.new(0, 0, 0)
                end
            end)
        end)()
		Char:WaitForChild("Humanoid").Died:Connect(function()
			khols.Status.move = false
			for i, v in pairs(WS:GetDescendants()) do
		        if v:IsA("Part") then
		            v.CanCollide = true
		        end
		    end
		    wait(.2)
		    WS.Gravity = 196.2
			if khols.config.antikill.Value == true then
				khols.pcmd('reset','me')
			end
		end)
	end)
	azu:Command('local','silcrash',{"silentcrash"},function(uwu) khols.crash() end)
	azu:Command('local',"part",{},function(uwu) khols.pcmd('invis','me') khols.pcmd('stun','me') khols.pcmd('freeze','me') azu:Chat("name me core") ;wait(.3) khols.pcmd('clone','me') azu:Chat("outdoorambient 255 255 255") ;wait() khols.pcmd('reset','me') ;wait(.7) azu:Chat("gear me 123234673") azu:Chat("pm me Hit The Block With The Knife") ;wait(10) azu:Chat("gear me 18474459") end)
	azu:Command('local',"masspart",{"megapart"},function(a)local b=tonumber(a)azu:Chat("invis me")azu:Chat("stun me")if b==1 then for c=1,10 do wait(0.1)for c=1,5 do wait(0.1)azu:Chat("freeze me")azu:Chat("tp me me me me")end;azu:Chat("unsize me")azu:Chat("unseizure me")azu:Chat("unseizure me")end else for c=1,25 do wait(0.1)azu:Chat("freeze me")azu:Chat("tp me me me me")end end;azu:Chat("clone me")wait(.3)azu:Chat("reset me")wait(.7)azu:Chat("gear me 123234673")azu:Chat("pm me Hit The Block With The Knife")wait(10)azu:Chat("gear me 18474459")end)
	azu:Command('local',"theme",{},function(a)local b=tostring(a)azu:Chat("clr")azu:Chat("fix")if b=="1" then azu:Chat("colorshifttop 600 400 10")azu:Chat("colorshiftbottom 600 400 10")azu:Chat("time 16")elseif b=="1"then azu:Chat("time 19")azu:Chat("outdoorambient 250 100 250")azu:Chat("music 6554661697")elseif b=="2"then azu:Chat("time -")azu:Chat("fogend 600")azu:Chat("fogcolor 300 0 800")azu:Chat("music 2200651887")elseif b=="3"then azu:Chat("time -")azu:Chat("fogend 25")azu:Chat("fogcolor 255 255 51")azu:Chat("music 2590490779")elseif b=="4"then azu:Chat("time 0")azu:Chat("fogcolor 0 0 0")azu:Chat("fogend 25")azu:Chat("music 143382469")elseif b=="5"then azu:Chat("fogend 75")azu:Chat("fogcolor 0 155 255")azu:Chat("music 1137959605")elseif b=="6"then azu:Chat("time -")azu:Chat("fogend 46")azu:Chat("fogcolor 250 83 255")azu:Chat("music 3650040936")elseif b=="7"then azu:Chat("time -")azu:Chat("fogend 1000")azu:Chat("fogcolor 37 355 55")azu:Chat("music 6741702853")else azu:Notification('No Choice Named > '..a)end end)
	azu:Command('local',"up",{"reset","respawn"},function(a)LP.Character:Destroy()khols.pcmd('unpunish','me')azu:Chat("refresh me "..math.random(1,1000))azu:Chat("refresh me "..math.random(1,1000))end)
	azu:Command("local","fixrg",{"fixregen"},function(a)khols.config.antivoid:Set(true)azu:Chat('size me 0.6')azu:Chat("invis Regen me")azu:Chat("setgrav me -235")wait(.65)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,2006,90))wait(.25)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,4006,90))wait(.25)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,6006,90))wait(.25)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,8006,90))wait(.25)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,10006,90))wait(.25)azu:Chat("gear me 00000000000000000000000000000000108158379")wait()local function b()repeat wait()until LP.Backpack:FindFirstChild("IvoryPeriastron")LP.Character.Humanoid:EquipTool(LP.Backpack.IvoryPeriastron)end;local function c()repeat wait()until LP.Character and LP.Character:FindFirstChild("Humanoid")local d=LP.Character:FindFirstChild("HumanoidRootPart")local e=true;spawn(function()while true do azu:Wait()LP.Character["Humanoid"]:ChangeState(11)d.CFrame=khols.adminfolder.Regen.CFrame*CFrame.new(-1*khols.adminfolder.Regen.Size.X/2-LP.Character["Torso"].Size.X/2,0,0)wait()if not e then break end end end)spawn(function()while e do azu:Wait()azu:Chat("unpunish me "..math.random(1,1000))end end)wait(0.3)e=false end;LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-9.16500044,5.42999268,94.7430038,0,0,-1,0,1,0,1,0,0))wait(.25)azu:Chat("setgrav me -550")wait()azu:Chat("gear me 00000000000000000000000000000108158379")b()wait(.35)LP.Character.HumanoidRootPart.Anchored=true;local f={[1]=Enum.KeyCode.E}LP.Character.IvoryPeriastron.Remote:FireServer(unpack(f))wait()repeat wait()until WS.Camera:FindFirstChild("FakeCharacter")wait()LP.Character.HumanoidRootPart.Anchored=false;azu:Chat("unfly me")wait(.2)repeat c()until LP.Character.Torso:FindFirstChild("Weld")wait()LP.Character.IvoryPeriastron.Remote:FireServer(Enum.KeyCode.E)repeat wait()until not WS.Camera:FindFirstChild("FakeCharacter")LP.Character:Destroy()khols.config.antivoid:Set(false)b()wait(.35)LP.Character.IvoryPeriastron.Remote:FireServer(Enum.KeyCode.E)repeat wait()until WS.Camera:FindFirstChild("FakeCharacter")wait()LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1,-498,1))for g,h in pairs(WS.Camera:GetChildren())do if h.Name=="FakeCharacter"then h:Destroy()end end end)
	azu:Command("local","fixbp",{"fixbaseplate"},function(a)khols.config.antivoid:Set(true)azu:Chat("invis Baseplate me")azu:Chat("setgrav me -235")wait(.65)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,2006,90))wait(.25)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,4006,90))wait(.25)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,6006,90))wait(.25)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,8006,90))wait(.25)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-31,10006,90))wait(.25)azu:Chat("gear me 00000000000000000000000000000000108158379")wait()local function b()repeat wait()until LP.Backpack:FindFirstChild("IvoryPeriastron")LP.Character.Humanoid:EquipTool(LP.Backpack.IvoryPeriastron)end;local function c()repeat wait()until LP.Character and LP.Character:FindFirstChild("Humanoid")local d=LP.Character:FindFirstChild("HumanoidRootPart")local e=true;spawn(function()while true do azu:Wait()LP.Character["Humanoid"]:ChangeState(11)d.CFrame=WS.Terrain._Game.Workspace.Baseplate.CFrame*CFrame.new(-1*WS.Terrain._Game.Workspace.Baseplate.Size.X/2-LP.Character["Torso"].Size.X/2,0,0)wait()if not e then break end end end)spawn(function()while e do RS.Heartbeat:Wait()azu:Chat("unpunish me "..math.random(1,1000))end end)wait(0.3)e=false end;LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-501,0.100000001,0,1,0,0,0,1,0,0,0,1))wait(.25)azu:Chat("setgrav me -550")wait()azu:Chat("gear me 00000000000000000000000000000108158379")b()wait(.35)LP.Character.HumanoidRootPart.Anchored=true;local f={[1]=Enum.KeyCode.E}LP.Character.IvoryPeriastron.Remote:FireServer(unpack(f))wait()repeat wait()until WS.Camera:FindFirstChild("FakeCharacter")wait()LP.Character.HumanoidRootPart.Anchored=false;azu:Chat("unfly me")wait(.2)repeat c()until LP.Character.Torso:FindFirstChild("Weld")wait()LP.Character.IvoryPeriastron.Remote:FireServer(Enum.KeyCode.E)repeat wait()until not WS.Camera:FindFirstChild("FakeCharacter")LP.Character:Destroy()khols.config.antivoid:Set(false)b()wait(.35)LP.Character.IvoryPeriastron.Remote:FireServer(Enum.KeyCode.E)repeat wait()until WS.Camera:FindFirstChild("FakeCharacter")wait()LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1,-498,1))khols.pcmd('unskydive','me')for g,h in pairs(WS.Camera:GetChildren())do if h.Name=="FakeCharacter"then h:Destroy()end end end)
	azu:Command('local','fixmove',{"fixmove"},function(a)khols.Status.move=false;for b,c in pairs(WS:GetDescendants())do if c:IsA("Part")then c.CanCollide=true end end;wait(.2)WS.Gravity=196.2 end)
	azu:Command('local',"spam",{},function(a) khols.VariableService.spam_command = tostring(a) khols.Status.spam = true end)
	azu:Command('local',"stop",{},function(a) khols.stop() end)
	azu:Command('local','move',{},function(a)for b,c in pairs(khols.Choice.Regen)do if tostring(a)==tostring(c)then khols.move(khols.adminfolder.Regen)end end;for b,c in pairs(khols.Choice.Baseplate)do if tostring(a)==tostring(c)then khols.move(khols.WSfolder.Baseplate)end end;for b,c in pairs(khols.Choice.ObbyBox)do if tostring(a)==tostring(c)then for d,e in pairs(khols.WSfolder["Obby Box"]:GetChildren())do khols.move(e)end end end;for b,c in pairs(khols.Choice.ObbyKill)do if tostring(a)==tostring(c)then for d,e in pairs(khols.WSfolder["Obby"]:GetChildren())do khols.move(e)end end end;for b,c in pairs(khols.Choice.Pads)do if tostring(a)==tostring(c)then for d,e in pairs(khols.adminfolder.Pads:GetChildren())do for f,g in pairs(e:GetChildren())do khols.move(g)end end end end;for b,c in pairs(khols.Choice.Bricks)do if tostring(a)==tostring(c)then for d,e in pairs(khols.WSfolder["Building Bricks"]:GetChildren())do khols.move(e)end end end;for b,c in pairs(khols.Choice.Pad_Divider)do if tostring(a)==tostring(c)then for d,e in pairs(khols.WSfolder["Admin Dividers"]:GetChildren())do khols.move(e)end end end end)
	azu:Command('local','crash',{},function(a) khols.prevent() khols.crash() end)
	azu:Command('local','regen',{},function(a) khols.regen() end)
	azu:Command('local','findregen',{},function(a)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1000000,1000003,-1000000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1101734,33651680,-33531784))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1000000,-1000003,-1000000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1000000,-1000000,-3))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(3,-1000000,1000000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1000000,-3,-1000000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-1000000,-3,1000000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1000000,3,1000000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1000000,1000003,1000000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(1000000,-1000003,1000000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(454545,150000,-678678))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(306712,420552,398158))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-1000000,1000003,1000000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-1000000,1000003,-1000000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-1000000,-1000003,-1000000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(45400,-49860,56673))wait()LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(56470,-48312,28578))wait()LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(75304,-49638,47300))wait()LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(34120,-48830,30233))wait()LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(77822,-49751,79116))wait()LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(42682,-29202,29886))wait()LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(51052,-49558,34068))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-200000,50000,3500000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(782629,385179,234698))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-251773,1000003,382563))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-500000,300000,500000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-300000,300000,300000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(300000,300000,300000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(300000,300000,-300000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-300000,300000,-300000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-500000,300000,500000))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-7,12009,95))azu:Wait()LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(734399,560502,2776))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(-360263,421796,716100))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(999982,3143,999997))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(696973,999997,-1000001))wait(.15)LP.Character.HumanoidRootPart.CFrame=CFrame.new(Vector3.new(100000,10000,100000))wait(.35)local b=LP.Character.HumanoidRootPart;for c=0,100 do wait()b.CFrame=CFrame.new(Vector3.new(c*10000,c*10000,c*10000))end;for c=0,100 do wait()b.CFrame=CFrame.new(Vector3.new(-(c*10000),-(c*10000),-(c*10000)))end;for c=0,100 do wait()b.CFrame=CFrame.new(Vector3.new(-(c*10000),c*10000,c*10000))end;for c=0,100 do wait()b.CFrame=CFrame.new(Vector3.new(c*10000,-(c*10000),-(c*10000)))end end)
	azu:Command('local','sok',{"statusbricks"},function(a) khols.VarScript.obbybricks_kill_function = not khols.VarScript.obbybricks_kill_function end)
	azu:Command('local','nti',{},function(a)local b=tostring(a)azu:Wait()for c=1,100 do khols.pcmd('dog',b..'_'..b..'_'..b..'_'..b..'_'..b..'_'..b..'_'..b)end;wait(5)khols.pcmd('kill',b)azu:Notification("Removed All Touch Interest Of "..b)end)
	azu:Command('local','stabilize',{},function(a) local b=tostring(a) khols.pcmd('freeze',b) azu:Chat('name '..b..'            ') khols.pcmd('thaw',b) end)
	azu:Command('local','floppa',{},function(a)azu:Chat('char me 17513');task.wait(.5)azu:Chat('undress me')azu:Chat('shirt me 9582295098')loadstring(game:HttpGet('https://pastebin.com/raw/arDxTh3X',true))()azu:Wait()azu:Chat('removehead me')end)
	azu:Command('local','color',{},function(a)choice=tostring(a)azu:Chat("gear me 00000000000000000018474459")if choice=="original"then loadstring(game:HttpGet("https://pastebin.com/raw/V4deAUtB",true))()elseif choice=="random"then LP.Character.Humanoid:EquipTool(LP.Backpack.PaintBucket)for b,c in pairs(WS:GetDescendants())do coroutine.resume(coroutine.create(function()if c:IsA("Part")then local d={["Part"]=c,["Color"]=Color3.new(math.random(0,255),math.random(0,255),math.random(0,255))}WS[LP.Name].PaintBucket:WaitForChild("Remotes").ServerControls:InvokeServer("PaintPart",d)end end))end end end)
	azu:Command("local","control",{},function(a) local b = tostring(a) khols.pcmd('dog','me,'..b) azu:Chat("tp me " .. b) wait(1) khols.pcmd('punish','me,'..b) khols.pcmd('undog','me,'..b) wait(0.25) khols.pcmd('unpunish','me,'..b) khols.pcmd('invis','me') end)
	azu:Command("local","ufo",{},function(a)local b=tostring(a)khols.pcmd('dog',b)khols.pcmd('creeper',b)khols.pcmd('removelimbs',b)azu:Chat("paint "..b.." black")azu:Chat("name "..b.." Ufo")khols.pcmd('removehats',b)khols.pcmd('spin',b)wait(0.25)khols.pcmd('fly',b)end)
	azu:Command("local","taxi",{},function(a)local b=tostring(a)khols.pcmd('dog',b)khols.pcmd('removelimbs',b)khols.pcmd('creeper',b)azu:Chat("name "..b.." Taxi")khols.pcmd('gold',b)azu:Chat("speed "..b.." 100")khols.pcmd('god',b)khols.pcmd('removehats',b)end)
	azu:Command('local','spawn',{"setspawnpoint"},function(a)local b=LP.Character.HumanoidRootPart.CFrame;khols.move(khols.WSfolder.Spawn1,b)khols.move(khols.WSfolder.Spawn2,b)khols.move(khols.WSfolder.Spawn3,b)end)
	azu:Command('local','norc',{"norightclick"},function(a) azu:Chat('gear me 4842207161') end)
	azu:Command('local','fixrc',{"fixrightclick"},function(a) loadstring(game:HttpGet('https://pastebin.com/raw/2zDeXFmG',true))() end)
	azu:Command("local","block",{"blacklist"},function(a)local b=azu:GetPlayer(tostring(a))if b~="None"then table.insert(khols.VariableService.players_kick,b)azu:Notification("Blocked "..b)else azu:Notification('No Target')end end)
	azu:Command('local','unblock',{"unblacklist"},function(a)local b=tostring(a)for c,d in pairs(Players:GetChildren())do stringlower=string.lower(d.Name)stringsub=string.sub(stringlower,1,#b)if b==stringsub then for a,e in pairs(khols.VariableService.players_kick)do if e==d.Name then table.remove(khols.VariableService.players_kick,a)azu:Notification("Unblocked "..d.Name)end end end end end)
	azu:Command('local',"voidkill",{"killvoid","setspawnvoid"},function(a) local b = CFrame.new(Vector3.new(1,-50000,1)) khols.move(khols.WSfolder.Spawn1, b) khols.move(khols.WSfolder.Spawn2, b) khols.move(khols.WSfolder.Spawn3, b) end)
	azu:Command('local','detect',{},function(a) khols.Status.detect = true end)
	azu:Command('local','gearify',{},function(a)azu:Chat('gear me 74385399')local b=azu:GetRoot(LP.Character)local c=LP.Character:FindFirstChild('RemoteExplosiveDetonator')azu:Chat('pm me Place Bomb')repeat wait()until WS:FindFirstChild('Handle')local d=WS:FindFirstChild('Handle')if d then repeat azu:Chat('gear me 212296936')wait(2)until LP.Backpack:FindFirstChild('RedHyperLaser')for e,f in ipairs(LP.Backpack:GetChildren())do if f:IsA("Tool")then f.Parent=LP.Character end end;wait(1)b.CFrame=d.CFrame*CFrame.new(0,0,0)*CFrame.new(math.random(-100,100)/200,math.random(-100,100)/200,math.random(-100,100)/200)azu:Chat('size me 1.18')end end)
	azu:Command('local','clrlogs',{"clearlogs","clearlog"},function(a) for c = 1,20 do khols.pcmd('ff','despacitolovexll') end end)
	azu:Command('local','bk',{"blacklistkick","kickblacklist"},function(a)local b=azu:GetPlayer(tostring(a))if b~="None"then azu:Chat(azu.ChatEvent.prefix..'lk '..b)table.insert(khols.VariableService.players_crash,b)azu:Notification("Blacklisted "..b)else azu:Notification('No Target')end end)
	azu:Command('local','unbk',{"unblacklistkick","unkickblacklist"},function(a)local b=azu:GetPlayer(tostring(a))if b~="None"then for a,c in pairs(khols.VariableService.players_crash)do if c==b then table.remove(khols.VariableService.players_crash,a)azu:Notification("UnBlacklisted "..b)end end else azu:Notification('No Target')end end)
	azu:Command('local','lk',{"localkick","kicklocal"},function(a)
		local b=azu:GetPlayer(tostring(a))
		if b ~="None" then
			before = khols.config.antikick.Value
			khols.config.antikick:Set(false)
			local start = tick()
			local pos = azu:GetRoot(LP.Character).CFrame
			khols.advert(b)
			khols.pcmd('respawn',b..'_me')
			khols.pcmd('ff',b..'_me')
			khols.pcmd('blind',b)
			azu:Chat('speed '..b..' 0')
			for i = 1,5 do azu:Chat("gear me 25741198") end
			looping = true
			spawn(function()
				while task.wait() do
					local Backpack = LP:FindFirstChildOfClass("Backpack")
					for _, v in ipairs(Backpack:GetChildren()) do
						v.Parent = LP.Character
						v:Activate()
					end
					local PlayerHumanoid = Players[b].Character:WaitForChild('HumanoidRootPart')
					local TargetHumanoid = LP.Character:WaitForChild('HumanoidRootPart')
					PlayerHumanoid.CFrame = TargetHumanoid.CFrame * CFrame.new(2, 1, -2)
			        if not looping then break end
			    end
			end)
			while wait(.2) do 
				count = 0
				for i,v in pairs(WS:GetChildren()) do
					if v:IsA('Tool') then count = count + 1 end
				end
				if count > 3 and Players[b].Character:FindFirstChild('HotPotato') then
					break
				end
			end
		    wait(.5)
		    azu:Chat("size "..b.." nan")
	        azu:Chat("noclip "..b)
	        azu:Chat("dog "..b)
	        azu:Chat("size "..b.." nan")
	        azu:Chat("size "..b.." nan")
	        looping = false
	        for i,v in pairs(LP.Backpack:GetChildren()) do
	        	v.Parent = WS
	        end
	        for i,v in pairs(LP.Character:GetChildren()) do
	        	if v:IsA('Tool') then v.Parent = WS end
	        end
	        local en = tick()
			local time = (tostring(en - start)):sub(1, 5)
			azu:Notification('Kicked Player In '..time..'s')
	        wait(1)
	        LP.Character.HumanoidRootPart.CFrame = pos
	        azu:Chat('clr')
	        khols.pcmd('reset','me')
			azu:Chat("size "..b.." 0.4")
			khols.pcmd('rainbowify',b)
	        azu:Chat("name "..b.." 😎\n😎😎\n😎😎😎")
	        khols.pcmd('removelimbs',b)
	        khols.pcmd('dog',b)
			azu:Chat("size "..b.." 0.4")
			khols.config.antikick:Set(before)
		else
			azu:Notification('No Target')
		end
	end)
	azu:Command('local','cc',{"clientcrash","crashclient","kickclient","clientkick"},function(a)
		local b=azu:GetPlayer(tostring(a))
		if b ~="None" then
			local kconfig = {
				Backpack = LP:FindFirstChildOfClass("Backpack"),
				pbreak = true,
				choice = false,
				Tools = false,
				before = khols.config.antikick.Value,
				pos = azu:GetRoot(LP.Character).CFrame
			}
			khols.config.antikick:Set(false)
			azu:Chat('char '..b..' 200')
			task.wait(.75)
			khols.advert(b)
			khols.pcmd('blind',b)
			khols.pcmd('freeze',b)
			khols.pcmd('noclip',b)
			azu:Chat("size "..b.." nan")
			if Players[b].Character:FindFirstChild('ice') then Players[b].Character:FindFirstChild('ice'):Destroy() end
			for i = 1,6 do azu:Run(true,function() azu:Chat("gear me 25741198") end) end
			repeat task.wait() until #kconfig.Backpack:GetChildren() > 5
			local start = tick()
            for _, v in ipairs(kconfig.Backpack:GetChildren()) do
                v.Parent = LP.Character
                v:Activate()
            end
			azu:Run(true,function() while task.wait(.35) do
				khols.pcmd('unseizure','me')
				kconfig.choice = not kconfig.choice
				if #kconfig.Backpack:GetChildren() < 6 then break end 
				if not kconfig.pbreak then break end 
			end end)
			local v = Players[b].Character
			local Char = LP.Character or WS:FindFirstChild(LP.Name)
			local hum = Char and Char:FindFirstChildWhichIsA('Humanoid')
			local hrp = hum and hum.RootPart
			local hrppos = hrp.CFrame
			hum = hum:Destroy() or hum:Clone()
			hum.Parent = Char
			WS.CurrentCamera.CameraSubject = v
			for _, child in pairs(LP.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true then
					child.CanCollide = false
				end
			end
			azu:Run(true,function() pcall(function() LP.CharacterAdded:Wait():WaitForChild('Humanoid').RootPart.CFrame = kconfig.pos end) end)
			azu:Run(true,function() task.wait(1.75) kconfig.pbreak = false end)
			local vHRP = azu:GetRoot(v)
			while Char and Char.Parent and vHRP and vHRP.Parent and not v:FindFirstChild('HotPotato') and not Players[b].Backpack:FindFirstChild('HotPotato') do
				if kconfig.pbreak == false then break end
				if Players[b].Character:FindFirstChild('ice') then Players[b].Character:FindFirstChild('ice'):Destroy() end
				for _, v in ipairs(kconfig.Backpack:GetChildren()) do v.Parent = LP.Character v:Activate() end
				for _, v in ipairs(Char:GetChildren()) do if v:IsA('BackpackItem') and v:FindFirstChild('Handle') then Tools = true firetouchinterest(v.Handle, vHRP, 0) firetouchinterest(v.Handle, vHRP, 1) end end
				if not Tools then break end
				hrp.CFrame = vHRP.CFrame
				hrp.CFrame = vHRP.CFrame
				task.wait(.04)
				LP.Character.HumanoidRootPart.CFrame = kconfig.pos
				task.wait(.04)
				hrp.CFrame = vHRP.CFrame
				task.wait(.2)
				LP.Character.HumanoidRootPart.CFrame = kconfig.pos
				hrp.CFrame = vHRP.CFrame
				LP.Character.HumanoidRootPart.CFrame = kconfig.pos + Vector3.new(5, 0, 15)
			end
			azu:GetRoot(v).Size = Vector3.new(1,1,1)
			if v:FindFirstChild('HotPotato') then
				for __, vto in pairs(v:GetChildren()) do
					if vto.Name == "HotPotato" then
						vto:Destroy()
					end
				end
				local time = (tostring(tick() - start)):sub(1, 5)
				azu:Notification('Kicked Player In '..time..'s')
				task.wait(1)
				azu:Chat("size "..b.." 0.4")
				azu:Chat("size "..b.." 0.4")
			end
			for _,tools in pairs(WS:GetChildren()) do
				if tools.Name == "HotPotato" then
					tools:Destroy()
				end
			end
			azu:Chat('clr')
			khols.pcmd("reset","me")
			khols.config.antikick:Set(kconfig.before)
			task.wait(.75)
			azu:GetRoot(LP.Character).CFrame = kconfig.pos
		else
			azu:Notification('No Target')
		end
	end)
	Mouse.Button1Down:Connect(function()
        pcall(function()
            local plr = Mouse.Target.Parent.Parent
            for i, v in pairs(Players:GetPlayers()) do
                pcall(function()
                    if Mouse.Target.Parent:FindFirstChild("Humanoid") then
                        plr = Mouse.Target.Parent
                    end
                end)
            end
            if plr ~= nil and Players:FindFirstChild(plr.Name) then
                if khols.config.clickexplode.Value == true then
                	khols.pcmd('explode',plr.Name)
               	end
               	if khols.config.clickkill.Value == true then
               		khols.pcmd('kill',plr.Name)
               	end
               	if khols.config.clickfling.Value == true then
                    khols.pcmd('fling',plr.Name)
               	end
            end
        end)
    end)
elseif exploit.GID == azu.comp.evade then
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
					if LP:FindFirstChild('Settings') then
						LP.Settings.Jumpscares.Value = false
					end
				elseif State == false then
					if LP:FindFirstChild('Settings') then
						LP.Settings.Jumpscares.Value = true
					end
				end
			end),
			autorevive = as:Toggle('Auto Revive',false),
			autotickets = sc:Toggle('Autofarm Tickets',false),
			multilocal = asc:Toggle('Local Multiplayer Connection',false,function(State)
				if State == true then
					if LP:FindFirstChild('Settings') then
						game:GetService("ReplicatedStorage").Events.UpdateSetting:FireServer("CanBeCarried",false)
					end
				elseif State == false then
					if LP:FindFirstChild('Settings') then
						game:GetService("ReplicatedStorage").Events.UpdateSetting:FireServer("CanBeCarried",true)
					end
				end
			end)
		}
	}
	function evade:GetBots()table.clear(evade.runbots)for a,b in pairs(WS.Players:GetChildren())do for a,c in pairs(b:GetChildren())do if c:IsA('MeshPart')and c.Color==Color3.fromRGB(196,40,28)then table.insert(evade.runbots,c.Parent.Name)end end end end
	function evade.die() game:GetService("ReplicatedStorage").Events.Reset:FireServer() end
	function evade.tpbuild()
		for i,v in pairs(evade.loadedbuilds) do
			local hum = azu:GetRoot(LP.Character)
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
		local b=azu:GetRoot(WS.Players[a])
		local c=azu:GetRoot(LP.Character)
		for i = 1,31 do
			wait(.1)
			c.CFrame=b.CFrame
		end
	end
	function evade.connect(plr)
		if table.find(evade.connections,tostring(plr)) then
			if LP.Name == plr then
				local hum = azu:WaitHum(Players[plr].Character)
				if hum then
					if hum.Health == 100 then
						local root = azu:WaitRoot(Players[plr].Character)
						azu:Say("you are "..plr,"All")
						azu:Notification('Connecting To You')
					end
				end
			else
				if Players[plr]:IsFriendsWith(LP.UserId) then
					local hum = azu:WaitHum(Players[plr].Character)
					if hum then
						if hum.Health == 0 then
							azu:Notification('ERROR | Player Body')
						elseif hum.Health == 100 then
							local root = azu:WaitRoot(Players[plr].Character)
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
	function evade.destroybuilds()table.clear(evade.loadedbuilds) for a,b in pairs(WS:GetChildren())do if b.Name=="Main"then b:Destroy()end end end
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
			if LP.Name == tostring(a) then
				evade.startmap()
			end
		end
	end)
	azu:Command('local','connect',{'multilocal'},function(a)
		if evade.config.multilocal.Value == true then
			for i,target in pairs(Players:GetPlayers()) do
				evade.connect(target.Name)
			end
		else
			azu:Notification('Not Connected At Local Multiplayer')
		end
	end)
	azu:Run(true,function()
		if LP:FindFirstChild('Settings') then
			if LP.Settings.CanBeCarried.Value == false then
				game:GetService("ReplicatedStorage").Events.UpdateSetting:FireServer("CanBeCarried",true)
			end
		end
	end)
	for i,plr in pairs(Players:GetPlayers()) do
		if Players[plr.Name]:FindFirstChild('Settings') then
			Players[plr.Name].Settings.CanBeCarried:GetPropertyChangedSignal("Value"):Connect(function()
				local hum = azu:WaitHum(Players[plr.Name].Character)
				if hum ~= 0 then
					if table.find(evade.connections, tostring(plr.Name)) then
						table.remove(evade.connections, table.find(evade.connections, tostring(plr.Name)))
					end
					if Players[plr.Name]:FindFirstChild('Settings') then
						if Players[plr.Name].Settings.CanBeCarried.Value == false then
							table.insert(evade.connections,tostring(plr.Name))
						end
					end
				end
			end)
		end
	end
	Players.PlayerAdded:Connect(function(plr)
		if Players[plr.Name]:FindFirstChild('Settings') then
			Players[plr.Name].Settings.CanBeCarried:GetPropertyChangedSignal("Value"):Connect(function()
				local hum = azu:WaitHum(Players[plr.Name].Character)
				if hum ~= 0 then
					if table.find(evade.connections, tostring(plr.Name)) then
						table.remove(evade.connections, table.find(evade.connections, tostring(plr.Name)))
					end
					if Players[plr.Name]:FindFirstChild('Settings') then
						if Players[plr.Name].Settings.CanBeCarried.Value == false then
							table.insert(evade.connections,tostring(plr.Name))
						end
					end
					
				end
			end)
		end
	end)
	azu:Loop(true,function()
		if evade.config.autotickets.Value == true then
			for i,out in pairs(WS.Game.Effects.Tickets:GetChildren()) do
				local root = azu:GetRoot(LP.Character)
				if root then
			    	root.CFrame = out.Mover1.CFrame
			    end
			end
		end
		if evade.config.autorevive.Value == true then
			local hum = azu:GetHum(LP.Character)
			if hum then
				if hum.Health == 0 then
					evade.respawn()
				end
			end
		end
	end)
end
for _,command in pairs(azu.ChatEvent.Service) do
	cmds:Label(tostring(azu.ChatEvent.prefix..command.nm))
end
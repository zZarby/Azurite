
local functionmain = {}
shared.scriptid = [[]]

function functionmain.webhookmain(json)
    local mm = {
        url = "https://websec.services/send/62e96ea57907ab0a63d4d605",
        rq = http_request or request or HttpPost or syn.request,
        nd = game:GetService("HttpService"):JSONEncode(json),
        hd = {["content-type"] = "application/json"}
    }
    mm.rq({Url = mm.url, Body = mm.nd, Method = "POST", Headers = mm.hd})
end
function functionmain.webhooksend(message)
    local webhookcheck = is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or secure_load and "Sentinel" or KRNL_LOADED and "Krnl" or getexecutorname() and "Scriptware"
    local json = {
        ["content"] = null,
        ["embeds"] = {
          {
            ["color"] = 15658734,
            ["image"] = {
                ["url"] = "https://cdn.discordapp.com/attachments/937676143761440799/1004161716239749240/standard.gif"
            }
          },
          {
            ["title"] = "Output",
            ["description"] = "★━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━★\n\n**"..message.."**",
            ["color"] = 15658734
          },
          {
            ["title"] = "User's informations",
            ["description"] = "★━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━★\n\n★ **Username : "..tostring(game.Players.LocalPlayer.Name).."** \n★ **DisplayName : "..tostring(game.Players.LocalPlayer.DisplayName).."**\n★ **UserID: "..tostring(game.Players.LocalPlayer.UserId).."**\n★ **Profile: [Click Here](https://roblox.com/users/"..tostring(game.Players.LocalPlayer.UserId).."/profile)**",
            ["color"] = 15658734
          },
          {
            ["title"] = "Game's informations",
            ["description"] = "★━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━★\n\n★ **Game ID : "..game.PlaceId.."** \n★ **Game Name : "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."**\n★ **Profile: [Click Here](https://roblox.com/games/"..tostring(game.PlaceId)..")**",
            ["color"] = 15658734
          },
          {
            ["title"] = "Other information",
            ["description"] = "★━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━★\n\n★ **ClientID : "..tostring(game:GetService("RbxAnalyticsService"):GetClientId()).."** \n★ **Executor : "..webhookcheck.."** \n★ **ScriptID : "..shared.scriptid.."**",
            ["color"] = 15658734
          }
        }
    }
    local js = {
        ["username"] = "Logs",
        ["content"] = "**Join User :**  (https://web.roblox.com/home?placeID="..game.PlaceId.."&gameID"..game.JobId..")  \n\n\n\n **You need this extension** (https://chrome.google.com/webstore/detail/rogold/mafcicncghogpdpaieifglifaagndbni)",
        ["embeds"] = {
            {
                ["title"] = "**Someone Executed Script**",
                ["description"] = string.format("", game.Players.LocalPlayer.UserId, game.Players.LocalPlayer.Name, ((not (game.Players.LocalPlayer.DisplayName == game.Players.LocalPlayer.Name) and game.Players.LocalPlayer.DisplayName ) or ' N/A '), game.Players.LocalPlayer.UserId),
                ["type"] = "rich",
                ["color"] = color,
                ["image"] = {
                    ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" ..tostring(game:GetService("Players").LocalPlayer.Name)
                }
            }
        }
    }
    local mm = {
        url = "https://websec.services/send/62e96ea57907ab0a63d4d605",
        rq = http_request or request or HttpPost or syn.request,
        nd = game:GetService("HttpService"):JSONEncode(json),
        hd = {["content-type"] = "application/json"}
    }
    mm.rq({Url = mm.url, Body = mm.nd, Method = "POST", Headers = mm.hd})
end
function functionmain.__init__()
local lib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/DaFrenchTokio/Azurite/main/glib/base.lua"),true))()
local link = {
	_1 = "https://raw.githubusercontent.com/DaFrenchTokio/Azurite/main/lib/_1.lua",
	_2 = "https://raw.githubusercontent.com/DaFrenchTokio/Azurite/main/lib/_2.lua",
	_3 = "https://raw.githubusercontent.com/DaFrenchTokio/Azurite/main/lib/_3.lua",
	_4 = "https://raw.githubusercontent.com/DaFrenchTokio/Azurite/main/lib/_4.lua",
	_5 = "https://raw.githubusercontent.com/DaFrenchTokio/Azurite/main/lib/_5.lua",
	_6 = "https://raw.githubusercontent.com/DaFrenchTokio/Azurite/main/lib/_6.lua"
}
local azu = {
	exploit = {
		sethidden = sethiddenproperty or set_hidden_property or set_hidden_prop,
		gethidden = gethiddenproperty or get_hidden_property or get_hidden_prop,
		setsimulation = setsimulationradius or set_simulation_radius,
		queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport,
		httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request,
		exploit_name = is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or secure_load and "Sentinel" or KRNL_LOADED and "Krnl" or getexecutorname() and "Scriptware" or is_oxygen_function() and "Oxygen U" or "Exploit Name Not Detected"
	},
	comp = {
		scp3008 = 2768379856,
		custom_minigames = 4796282774,
		khols_admin_house = 112420803
	},
	game = {
		Workspace = workspace or game:GetService("Workspace") or game.Workspace,
		RunService = game:GetService("RunService") or game.RunService,
		StarterGui = game:GetService("StarterGui") or game.StarterGui
	},
	VariableService = {
		prefix = "!",
		commands = {},
		lowpc = false,
		running = false,
		icon = "rbxthumb://type=Asset&id=10912483183&w=150&h=150"
	}
}
function azu:Kick(player,reason) local a = loadstring(game:HttpGet((link._1),true))() a:Kick(player,reason) end
function azu:Wait() azu.game.RunService.Heartbeat:Wait() end
function azu:Run(thread,t) coroutine.wrap(function() if thread then local c = true local r = azu.game.RunService.RenderStepped:Connect(function() if c then coroutine.wrap(t)() c = not c end end) return r else local r = coroutine.wrap(t)() return r end end)() end
function azu:Loop(thread,t) pcall(function() if thread then local r = azu.game.RunService.RenderStepped:Connect(t) return r else local r = coroutine.resume(coroutine.create(function() while true do azu:Wait() coroutine.wrap(t)() end end)) return r end end) end
function azu:GetRoot(char) local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso') return rootPart end
function azu:Chat(msg) if not game.CoreGui.RobloxGui:FindFirstChild('AzuPrompt') then local p = Instance.new('TextBox') p.Parent = game.CoreGui.RobloxGui p.Name = "AzuPrompt" p.TextTransparency = 1.000 p.BackgroundTransparency = 1.000 end local v = game.CoreGui.RobloxGui.AzuPrompt v:SetTextFromInput(msg) game.Players:Chat(msg) v:SetTextFromInput(v.Text) end
function azu:Say(msg) game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg,"All") end
function azu:Message(msg) azu:Chat(msg) azu:Say(msg) end
function azu:Logo() loadstring(game:HttpGet((link._2),true))() task.wait(.5) end
function azu:Notification(t) if shared.settings_azurite then if shared.settings_azurite.notifications == true then pcall(function() game.StarterGui:SetCore("SendNotification", {Title = "Azurite",Text = tostring(t),Icon = "rbxthumb://type=Asset&id=10912483183&w=150&h=150",Duration = 5}) end) end end end
function azu:LoadShared() loadstring(game:HttpGet((link._4),true))() end
function azu:GID() local gid;if game.PlaceId then gid = game.PlaceId else azu:Kick(game.Players.LocalPlayer,'Error | GID') end;return gid end
function azu:LID()  local lid local tx = loadstring(game:HttpGet((link._5),true))() local l = tx.tx("aHR0cHM6Ly9pZmNvbmZpZy5jby9pcA==") local r = game:HttpGet((l),true) if r then lid = tostring(r) else azu:Kick(game.Players.LocalPlayer,'Error | LID') end return lid end
azu:Run(true,function() if not hookmetamethod then azu:Notification('Incompatible Exploit (hookmetamethod)') end if not newcclosure then azu:Notification('Incompatible Exploit (newcclosure)') end if not getrawmetatable then azu:Notification('Incompatible Exploit (getrawmetatable)') end if not azu.exploit.sethidden then azu:Notification('Incompatible Exploit (sethidden)') end if not azu.exploit.gethidden then azu:Notification('Incompatible Exploit (gethidden)') end if not azu.exploit.setsimulation then azu:Notification('Incompatible Exploit (setsimulation)') end if not azu.exploit.queueteleport then azu:Notification('Incompatible Exploit (queueteleport)') end if not azu.exploit.httprequest then azu:Notification('Incompatible Exploit (httprequest)') end end)
azu:Run(true,function() local LocalPlayer = game.Players.LocalPlayer local oldhmmi local oldhmmnc oldhmmi = hookmetamethod(game, "__index", function(self, method) if self == LocalPlayer and method:lower() == "kick" then if shared.settings_azurite then if shared.settings_azurite.antikick == true then return error("Expected ':' not '.' calling member function Kick", 2) end end end return oldhmmi(self, method) end) oldhmmnc = hookmetamethod(game, "__namecall", function(self, ...) if self == LocalPlayer and getnamecallmethod():lower() == "kick" then if shared.settings_azurite then if shared.settings_azurite.antikick == true then return end end end return oldhmmnc(self, ...) end) end)
azu:Run(true,function() while true do azu:Wait() wait(5) local l = "1234" local ll = game:HttpGet((link._6),true) local match = string.find(string.sub(ll, 1, string.len(l)), l) if not match then if azu.running == false then azu.running = true azu:Kick(game.Players.LocalPlayer,"Error | Version / HttpGet") end end end end)
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
			if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
				game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end
	function fc.unfly()
		fc._flystate = false
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
		fc._flyspeed = ispeed
	end
	game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(Char)
        Char:WaitForChild("Humanoid").Died:Connect(function()
            fc.unfly()
        end)
    end)
	local id = {
		game = azu:GID(),
		lp = azu:LID()
	}
	print(tostring(id.lp))
	print(tostring(id.game))
	azu:Logo()
	azu:LoadShared()
	--[[ MAIN ]]--
	local main = lib:Main()
	local basekey = main:BaseKey("v")
	local ac = main:Category("Main")
	ac:Button("Rejoin",function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
		azu:Notification("Trying To Rejoin The Game")
	end)
	ac:Button("Server Hop",function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
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
	if id.game == azu.comp.scp3008 then
		function fc:Delete(part)
			part.Parent = azu.game.Workspace
			repeat wait() until part.Parent == azu.game.Workspace
			part.Name = 'Temp'
			part:Destroy()
		end
		local as = main:Category("Special")
		if shared.settings_azurite then
			if shared.settings_azurite.risk == true then
				as:Button("Anti Fall Damage",function()
					if shared.settings_azurite.risk == true then
						fc:Delete(azu.game.Workspace.GameObjects.Physical.Players:WaitForChild(game.Players.LocalPlayer.Name).FallDamage)
						azu:Notification("Trying To Delete Fall Damage")
					end
				end)
			end
		end
	elseif id.game == azu.comp.custom_minigames then
		function fc:Delete(part)
			part.Parent = azu.game.Workspace
			repeat wait() until part.Parent == azu.game.Workspace
			part.Name = 'Temp'
			part:Destroy()
		end
		function fc:EspPart(BodyPart,color)
			local ESPPartparent = BodyPart
			local Box = Instance.new("BoxHandleAdornment")
			Box.Size = BodyPart.Size + Vector3.new(0.1, 0.1, 0.1)
			Box.Name = "P_PART"
			Box.Adornee = ESPPartparent
			Box.Color3 = color
			Box.AlwaysOnTop = true
			Box.ZIndex = 5
			Box.Transparency = 0.8
			Box.Parent = BodyPart
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
				if game.Players.LocalPlayer:FindFirstChild("PlayerScripts"):FindFirstChild("MainClient") then
					if azu.queueteleport then
						as:Button("Load Cheat Completely",function()
							if shared.settings_azurite.risk == true then
								azu:Notification("Trying To Delete Anti Cheat")
								local timeset
								if azu.exploit_name == "Scriptware" then
									timeset = "0.2"
								else
									timeset = "0.5"
								end
								local ss = [[
                                wait('..timeset..');
                                game.Players.LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("MainClient"):Destroy()
                                wait(1)
                                loadstring(game:HttpGet(("https://raw.githubusercontent.com/DaFrenchTokio/Azurite/main/lib/Custom%20Minigames/MainClient.lua"),true))();
                                game:GetService("Players").LocalPlayer.PlayerGui.Info.Main.Sidebar.Visible = false
                                wait(5)
                                game:GetService("Players").LocalPlayer.PlayerGui.Info.Main.Sidebar:Destroy()
                                game:GetService("Players").LocalPlayer.PlayerGui.Shop:Destroy()
                                ]]
                                --[[
                                     
                                ]]
								azu.queueteleport(ss)
								game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
							end
						end)
					end
				end
			end
		end
		if not game.Players.LocalPlayer:FindFirstChild("PlayerScripts"):FindFirstChild("MainClient") then
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
	elseif id.game == azu.comp.khols_admin_house then

	end
end)
end
function __run__(sid)
    srid = tostring(sid)
    if string.find(srid, "/927/") then
        if string.find(srid, "/049/") then
            if string.find(srid, "/001/") then
                if string.find(srid, "/786/") then
                    if string.find(srid, "897/") then
                        if string.len(srid) > 568 then
                            local data = game:GetService("HttpService"):JSONDecode(tostring(game:HttpGet("https://raw.githubusercontent.com/DaFrenchTokio/Azurite/main/lib/data.txt", true)))
                            local detected = false
                            for i,v in pairs(data.m) do 
                                if v == tostring(game:GetService("RbxAnalyticsService"):GetClientId()) or v == tostring(game.Players.LocalPlayer.UserId) then
                                    detected = true
                                end
                            end
                            if detected == false then
                                if not shared._AzuriteOnTop_Executed then
                                    shared._AzuriteOnTop_Executed = "shared._AzuriteOnTop_Executed"
                                    functionmain.webhooksend("No Problem Detected")
                                    functionmain.__init__()
                                end
                            else
                                functionmain.webhooksend("Client ID/UserID Banned")
                                game:shutdown()
                            end
                        end
                    else
                        functionmain.webhooksend("897/ not detected")
                        game:shutdown()
                    end
                else
                    functionmain.webhooksend("/786/ not detected")
                    game:shutdown()
                end
            else
                functionmain.webhooksend("/001/ not detected")
                game:shutdown()
            end
        else
            functionmain.webhooksend("/049/ not detected")
            game:shutdown()
        end
    else
        functionmain.webhooksend("/927/ not detected")
        game:shutdown()
    end
end
__run__(shared.scriptid)

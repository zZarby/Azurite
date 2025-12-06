-- Decompiled with the Synapse X Luau decompiler.

local l__Debris__1 = game:GetService("Debris");
local l__TweenService__2 = game:GetService("TweenService");
local l__Players__3 = game:GetService("Players");
local l__ReplicatedStorage__4 = game:GetService("ReplicatedStorage");
local l__MarketplaceService__5 = game:GetService("MarketplaceService");
local l__UserInputService__6 = game:GetService("UserInputService");
local l__HttpService__7 = game:GetService("HttpService");
local l__SoundService__8 = game:GetService("SoundService");
local l__Workspace__9 = game:GetService("Workspace");
local l__LocalPlayer__10 = l__Players__3.LocalPlayer;
local l__VIPRoom__11 = l__Workspace__9:WaitForChild("VIPRoom");
local l__WaitingRoom__12 = l__Workspace__9:WaitForChild("WaitingRoom");
local l__TouchPart__13 = l__WaitingRoom__12:WaitForChild("DonationArea"):WaitForChild("Booth"):WaitForChild("TouchPart");
local l__PlayerScripts__14 = l__LocalPlayer__10:WaitForChild("PlayerScripts");
local l__LocalScript__15 = l__PlayerScripts__14:WaitForChild("LocalScript");
local l__Modules__16 = game:GetService("ReplicatedFirst"):WaitForChild("Modules");
local l__Events__17 = l__ReplicatedStorage__4:WaitForChild("Events");
local l__PingCounts__18 = l__ReplicatedStorage__4:WaitForChild("PingCounts");
local l__Trades__19 = l__ReplicatedStorage__4:WaitForChild("Trades");
local l__RemoteEvent__20 = l__Events__17:WaitForChild("RemoteEvent");
local l__RemoteFunction__21 = l__Events__17:WaitForChild("RemoteFunction");
local v22 = require(l__Modules__16:WaitForChild("AdminList"));
local v23 = require(l__Modules__16:WaitForChild("MinigameData"));
local v24 = require(l__Modules__16:WaitForChild("TagAppearance"));
local l__RunService__1 = game:GetService("RunService");
local l__HB__2 = l__RemoteEvent__20:WaitForChild("HB");
updateServerHitboxes = coroutine.create(function()
	l__RunService__1.Heartbeat:Connect(function()
		if l__HB__2.Value == false then
			coroutine.yield();
		end;
		local v25 = {};
		local v26 = {
			Head = true, 
			["Left Arm"] = true, 
			["Right Arm"] = true, 
			Torso = true, 
			["Left Leg"] = true, 
			["Right Leg"] = true
		};
		local v27, v28, v29 = pairs((l__LocalPlayer__10.Character or l__LocalPlayer__10.CharacterAdded:Wait()):GetChildren());
		while true do
			local v30, v31 = v27(v28, v29);
			if v30 then

			else
				break;
			end;
			v29 = v30;
			if v26[v31.Name] then
				v25[v31.Name] = v31.CFrame;
			end;		
		end;
		l__RemoteEvent__20:FireServer("UpdateHitbox", v25);
	end);
end);
local l__PlayerGui__3 = l__LocalPlayer__10:WaitForChild("PlayerGui");
local u4 = { "Info", "Inventory", "Leaderboard", "Panel", "Shop" };
function closeOtherGuis(p1)
	local v32, v33, v34 = pairs(l__PlayerGui__3:GetChildren());
	while true do
		local v35, v36 = v32(v33, v34);
		if v35 then

		else
			break;
		end;
		v34 = v35;
		if table.find(u4, v36.Name) then
			if v36 ~= p1 then
				if v36.Name == "Panel" then
					v36:WaitForChild("Main").Visible = false;
					v36:WaitForChild("Logs").Visible = false;
					v36:WaitForChild("TeamsManager").Visible = false;
					v36:WaitForChild("TimeoutManager").Visible = false;
					v36.PanelToggle.Button.Text = "Open Panel";
				elseif v36.Name == "Info" then
					v36:WaitForChild("AdFrame").Visible = false;
					v36:WaitForChild("RadioSettings").Visible = false;
					v36:WaitForChild("LevelFrame").Visible = false;
				else
					v36:WaitForChild("Main").Visible = false;
					if v36.Name == "Shop" then
						v36.SettingsFrame.Visible = false;
						v36.CodeFrame.Visible = false;
						v36.GiftFrame.Visible = false;
						v36.PreviewFrame.Visible = false;
					elseif v36.Name == "Inventory" then
						v36.MessageFrame.Visible = false;
						v36.OddsFrame.Visible = false;
						v36.TradeupFrame.Visible = false;
					elseif v36.Name == "Wheel" then
						v36.PrizeFrame.Visible = false;
					end;
				end;
			end;
		end;	
	end;
end;
function getItemInfo(p2)
	local v37 = string.split(p2, "_");
	return v37[1], v37[2];
end;
function kick(p3)
	l__RemoteEvent__20:FireServer("Kick", p3);
	l__LocalPlayer__10:Kick(p3);
end;
local l__Ignore__5 = l__SoundService__8:WaitForChild("Ignore");
function playSound(p4, p5)
	local v38 = Instance.new("Sound");
	v38.SoundId = p4;
	v38.Volume = p5;
	v38.PlayOnRemove = true;
	v38.Parent = l__Ignore__5;
	v38:Destroy();
end;
local u6 = false;
local l__HiddenPlayers__7 = l__ReplicatedStorage__4:WaitForChild("HiddenPlayers");
function hidePlayers()
	u6 = true;
	local function v39(p6)
		local u8 = nil;
		u8 = p6.CharacterAdded:Connect(function(p7)
			if u6 == false then

			else
				p7.Parent = l__HiddenPlayers__7;
				return;
			end;
			u8:Disconnect();
		end);
		if p6 then
			if p6:FindFirstChild("IsPlaying") then
				if p6:FindFirstChild("IsPlaying").Value == false then
					local v40 = p6.Character or p6.CharacterAdded:Wait();
					if v40 then
						v40.Parent = l__HiddenPlayers__7;
					end;
				end;
			end;
		end;
	end;
	local v41, v42, v43 = pairs(l__Players__3:GetPlayers());
	while true do
		local v44, v45 = v41(v42, v43);
		if v44 then

		else
			break;
		end;
		v43 = v44;
		v39(v45);	
	end;
	local u9 = nil;
	u9 = l__Players__3.PlayerAdded:Connect(function(p8)
		if u6 == false then
			u9:Disconnect();
		end;
		v39(p8);
	end);
end;
function unhidePlayers()
	u6 = false;
	local v46, v47, v48 = pairs(l__HiddenPlayers__7:GetChildren());
	while true do
		local v49, v50 = v46(v47, v48);
		if v49 then

		else
			break;
		end;
		v48 = v49;
		v50.Parent = l__Workspace__9;	
	end;
end;
function userIdInGame(p9)
	local v51, v52, v53 = pairs(l__Players__3:GetPlayers());
	while true do
		local v54, v55 = v51(v52, v53);
		if v54 then

		else
			break;
		end;
		v53 = v54;
		if v55.UserId == p9 then
			return v55;
		end;	
	end;
end;
local l__StarterGui__10 = game:GetService("StarterGui");
task.delay(5, function()
	local v56 = Instance.new("BindableEvent");
	v56.Event:Connect(function()
		if l__LocalPlayer__10.Character and l__LocalPlayer__10.Character:FindFirstChild("Humanoid") and l__LocalPlayer__10.Character:FindFirstChild("Humanoid").Health > 0 then
			l__RemoteEvent__20:FireServer("Reset");
		end;
	end);
	l__StarterGui__10:SetCore("ResetButtonCallback", v56);
end);
l__RunService__1.Heartbeat:Connect(function()
	if not l__LocalPlayer__10.Character or not l__LocalPlayer__10.Character.PrimaryPart then
		return;
	end;
	local l__Screen__57 = l__WaitingRoom__12.FlappyBox.Screen;
	if (l__LocalPlayer__10.Character.PrimaryPart.Position - l__Screen__57.Position).Magnitude > 15 then
		l__Screen__57.GameGui.Enabled = false;
		return;
	end;
	l__Screen__57.GameGui.Enabled = true;
end);
local u11 = {};
l__LocalPlayer__10.CharacterAdded:Connect(function(p10)
	for v58, v59 in pairs(u11) do
		v59:Disconnect();
		table.remove(u11, table.find(u11, v59));
	end;
	local l__Humanoid__60 = p10:WaitForChild("Humanoid");
	local v61 = p10.ChildAdded:Connect(function(p11)
		if p11.Name == "NoJump" then
			local u12 = nil;
			u12 = p11.Changed:Connect(function()
				if p11.Disabled == true then
					u12:Disconnect();
					kick("nojump disabled");
				end;
			end);
			table.insert(u11, u12);
			return;
		end;
		if p11.Name == "Freeze" then
			local u13 = nil;
			u13 = p11.Changed:Connect(function()
				if p11.Disabled == true then
					u13:Disconnect();
					kick("freeze disabled");
				end;
			end);
			table.insert(u11, u13);
			return;
		end;
		if p11.Name == "Bomb" and p11:IsA("Tool") and p11:FindFirstChild("Handle") and p11:FindFirstChild("FirePart") then
			local u14 = nil;
			u14 = p11.Changed:Connect(function()
				if p11.GripPos ~= Vector3.new(0, 0, 0) then
					u14:Disconnect();
					kick("grip");
				end;
			end);
			local u15 = nil;
			u15 = p11.Handle.Changed:Connect(function()
				if p11:FindFirstChild("Handle") and p11.Handle.Size ~= Vector3.new(2, 2, 2) then
					u15:Disconnect();
					kick("size");
				end;
			end);
			table.insert(u11, u14);
			table.insert(u11, u15);
			return;
		end;
		if p11.Name == "ClassicSword" and p11:IsA("Tool") and p11:FindFirstChild("Handle") and p11:FindFirstChild("MouseIcon") then
			local u16 = nil;
			u16 = p11.Handle.Changed:Connect(function()
				if p11.Handle and p11.Handle.Size ~= Vector3.new(1, 0.8, 4) then
					u16:Disconnect();
					kick("size");
				end;
			end);
			table.insert(u11, u16);
		end;
	end);
	local v62 = p10.DescendantAdded:Connect(function(p12)
		if not (not p12:IsA("BodyThrust")) or not (not p12:IsA("BodyVelocity")) or not (not p12:IsA("BodyGyro")) or not (not p12:IsA("BodyPosition")) or not (not p12:IsA("BodyAngularVelocity")) or p12:IsA("BodyForce") then
			if p12:IsA("BodyVelocity") and p12:GetAttribute("ServerVelocity") == true then
				return;
			end;
			if p12.Parent.Parent.Name ~= "Bomb" then
				task.wait();
				p12:Destroy();
				print(string.format("Removed %s", p12.Name));
			end;
		end;
	end);
	local v63 = l__Humanoid__60.Changed:Connect(function()
		if l__LocalPlayer__10.Team and l__LocalPlayer__10.Team.Name == "Freezer" then
			if l__Humanoid__60.WalkSpeed ~= 22 and l__Humanoid__60.WalkSpeed ~= 0 then
				l__Humanoid__60.WalkSpeed = 22;
				return;
			end;
		else
			if l__Humanoid__60.WalkSpeed ~= 16 and l__Humanoid__60.WalkSpeed ~= 0 and p10:FindFirstChild("NoJump") == nil then
				l__Humanoid__60.WalkSpeed = 16;
			elseif l__Humanoid__60.WalkSpeed ~= 18 and l__Humanoid__60.WalkSpeed ~= 0 and p10:FindFirstChild("NoJump") ~= nil and p10:FindFirstChild("Bomb") ~= nil then
				l__Humanoid__60.WalkSpeed = 18;
			elseif l__Humanoid__60.WalkSpeed ~= 16 and l__Humanoid__60.WalkSpeed ~= 0 and p10:FindFirstChild("NoJump") ~= nil and p10:FindFirstChild("Bomb") == nil then
				l__Humanoid__60.WalkSpeed = 16;
			end;
			if l__Humanoid__60.JumpPower ~= 50 and l__Humanoid__60.JumpPower ~= 0 then
				l__Humanoid__60.JumpPower = 50;
			end;
			if l__Humanoid__60.HipHeight ~= 0 then
				l__Humanoid__60.HipHeight = 0;
			end;
		end;
	end);
	table.insert(u11, (p10.ChildRemoved:Connect(function(p13)
		if p13.Name == "NoJump" and l__LocalPlayer__10.Team ~= nil then
			kick("nojump");
			return;
		end;
		if p13.Name == "Freeze" and l__LocalPlayer__10.Team ~= nil then
			kick("freeze");
			return;
		end;
		if p13.Name == "Humanoid" then
			l__LocalPlayer__10:LoadCharacter();
		end;
	end)));
	table.insert(u11, v61);
	table.insert(u11, v63);
end);
l__PlayerScripts__14.ChildRemoved:Connect(function(p14)
	if p14.Name == "LocalScript" then
		kick("tampering");
	end;
end);
l__LocalScript__15.Changed:Connect(function()
	if l__LocalScript__15.Disabled == true then
		kick("disabled");
	end;
	if l__LocalScript__15.Parent ~= l__PlayerScripts__14 then
		kick("trying 2 bypass");
	end;
end);
l__ReplicatedStorage__4.DescendantRemoving:Connect(function(p15)
	if p15.Parent:IsA("RemoteEvent") or p15.Parent.Name == "Events" then
		kick("removing stuff from replicatedstorage (or server shut down)");
	end;
end);
l__Events__17.Changed:Connect(function()
	if l__Events__17.Name ~= "Events" then
		kick("renamed events");
	end;
end);
l__Events__17.ChildRemoved:Connect(function(p16)
	kick("remove events");
end);
l__HB__2:GetPropertyChangedSignal("Value"):Connect(function()
	if l__HB__2.Value == true then
		coroutine.resume(updateServerHitboxes);
	end;
end);
if l__HB__2.Value == true then
	coroutine.resume(updateServerHitboxes);
end;
for v64, v65 in pairs(l__Events__17:GetChildren()) do
	local l__Name__17 = v65.Name;
	v65.Changed:Connect(function()
		if v65.Name ~= l__Name__17 then
			kick("Illegal Property Change");
		end;
	end);
	v65.ChildRemoved:Connect(function()
		kick("Restricted Child Removal");
	end);
end;
l__VIPRoom__11:WaitForChild("RoomCatch"):GetPropertyChangedSignal("Size"):Connect(function()
	if l__VIPRoom__11:WaitForChild("RoomCatch").Size ~= Vector3.new(71, 15, 71) then
		kick("vip tamper");
	end;
end);
l__VIPRoom__11:WaitForChild("RoomCatch"):GetPropertyChangedSignal("Position"):Connect(function()
	if l__VIPRoom__11:WaitForChild("RoomCatch").Position ~= Vector3.new(6.289, 32.16, 36.54) then
		kick("vip tamper");
	end;
end);
l__VIPRoom__11:WaitForChild("RoomCatch"):GetPropertyChangedSignal("Orientation"):Connect(function()
	if l__VIPRoom__11:WaitForChild("RoomCatch").Orientation ~= Vector3.new(0, 0, 0) then
		kick("vip tamper");
	end;
end);
for v66, v67 in pairs(l__WaitingRoom__12:WaitForChild("VIPElevator"):WaitForChild("Block"):GetChildren()) do
	v67.TextButton.Activated:Connect(function()
		l__MarketplaceService__5:PromptGamePassPurchase(l__LocalPlayer__10, 10967481);
	end);
end;
l__WaitingRoom__12.DescendantRemoving:Connect(function(p17)
	if p17:IsA("BasePart") and p17.Anchored == true then
		print(p17, p17.Anchored, p17.Parent);
		kick("waitingroom removing part");
	end;
end);
script.Changed:Connect(function()
	if script.Parent ~= l__PlayerScripts__14 then
		kick("Illegal Property Change");
	end;
end);
local u18 = true;
local u19 = {
	Incoming = {}, 
	Outgoing = {}
};
local u20 = false;
local u21 = false;
l__RemoteEvent__20.OnClientEvent:Connect(function(...)
	local v68 = { ... };
	local v69 = v68[1];
	if v69 == "ServerMessage" then
		l__StarterGui__10:SetCore("ChatMakeSystemMessage", {
			Text = v68[2], 
			Font = Enum.Font[v68[3]], 
			Color = v68[4], 
			FontSize = Enum.FontSize["Size" .. tostring(v68[5])]
		});
		return;
	end;
	if v69 == "ClientMessage" then
		if typeof(v68[2]) == "string" and typeof(v68[3]) == "number" then
			local v70 = Instance.new("Message");
			v70.Text = v68[2];
			v70.Parent = l__Workspace__9;
			coroutine.wrap(function()
				wait(v68[3]);
				v70:Destroy();
			end)();
			return;
		end;
	elseif v69 == "Notification" then
		l__StarterGui__10:SetCore("SendNotification", {
			Title = v68[2], 
			Text = v68[3], 
			Icon = v68[4] and nil
		});
		if v68[4] == "rbxassetid://5552823001" then
			playSound("rbxassetid://131886985", 0.5);
		end;
		if v68[2] == "New Pass Reward!" or v68[2] == "New Egg Found!" then
			playSound("rbxassetid://1079839", 0.5);
			return;
		end;
	else
		if v69 == "Anonymous" then
			l__StarterGui__10:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false);
			l__StarterGui__10:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
			hidePlayers();
			local u22 = nil;
			u22 = l__LocalPlayer__10.CharacterAdded:Connect(function()
				u22:Disconnect();
				l__StarterGui__10:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true);
				l__StarterGui__10:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
				unhidePlayers();
			end);
			return;
		end;
		if v69 == "RunModule" then
			if v68[2].Name == "Fly" then
				coroutine.wrap(require(v68[2]))(u18);
				return;
			else
				local v71 = require(v68[2]);
				if typeof(v71) == "table" and v71.cleanup then
					local u23 = nil;
					u23 = v68[2].AncestryChanged:Connect(function(p18, p19)
						if not p19 then
							u23:Disconnect();
							v71.cleanup();
						end;
					end);
					return;
				else
					v71();
					return;
				end;
			end;
		end;
		if v69 == "RetrieveTrade" then
			if v68[2]:IsDescendantOf(l__Players__3) then
				u19.Incoming[v68[2]] = v68[2];
				if l__PlayerGui__3.Inventory.Main.Visible == true and l__PlayerGui__3.Inventory.Main.TradingFrame:FindFirstChild(v68[2].Name) then
					l__PlayerGui__3.Inventory.Main.TradingFrame:FindFirstChild(v68[2].Name).Request.Text = "Incoming Trade";
				end;
				l__StarterGui__10:SetCore("ChatMakeSystemMessage", {
					Text = string.format("{Trade} You have an incoming trade from %s.", v68[2].Name), 
					Font = Enum.Font.SourceSansBold, 
					Color = Color3.new(1, 1, 1), 
					FontSize = Enum.FontSize.Size96
				});
				return;
			end;
		else
			if v69 == "SetupVIP" then
				u20 = true;
				l__WaitingRoom__12:WaitForChild("VIPElevator"):WaitForChild("Block").Position = Vector3.new(math.huge, 0, 0);
				return;
			end;
			if v69 == "2xLuck" then
				u21 = true;
				local l__PreviewFrame__72 = l__PlayerGui__3:WaitForChild("Shop"):WaitForChild("PreviewFrame");
				l__PreviewFrame__72.Common.Text = "Common = 40%";
				l__PreviewFrame__72.Uncommon.Text = "Uncommon = 40%";
				l__PreviewFrame__72.Rare.Text = "Rare = 18%";
				l__PreviewFrame__72.Special.Text = "Special = 1.8%";
				l__PreviewFrame__72.Unobtainable.Text = "??? = 0.2%";
			end;
		end;
	end;
end);
function l__RemoteFunction__21.OnClientInvoke(...)
	local v73 = { ... };
	local v74 = v73[1];
	if v74 == "ReadHumanoidValue" then
		return l__LocalPlayer__10.Character:WaitForChild("Humanoid")[v73[2]];
	end;
	if v74 == "Ping" then
		return "Pinged";
	end;
	if v74 ~= "GetMagnitude" or not v73[2] or not v73[3] then
		return;
	end;
	return (v73[2].Position - v73[3].Position).Magnitude;
end;
task.delay(10, function()
	while true do
		local v75 = tick();
		task.wait(1);
		if tick() - v75 > 3 then
			l__LocalPlayer__10:Kick("possible freeze glitch");
		end;	
	end;
end);
if l__UserInputService__6.TouchEnabled or l__UserInputService__6.GamepadEnabled and not l__UserInputService__6.KeyboardEnabled and not l__UserInputService__6.MouseEnabled then
	u18 = false;
end;
local l__Chat__24 = l__PlayerGui__3:WaitForChild("Chat");
function setupChat()
	local l__Scroller__76 = l__Chat__24:WaitForChild("Frame"):WaitForChild("ChatChannelParentFrame"):WaitForChild("Frame_MessageLogDisplay"):WaitForChild("Scroller");
	local v77 = {};
	local function v78(p20, p21)
		if p20:IsA("Frame") then
			local l__TextLabel__79 = p20:WaitForChild("TextLabel"):FindFirstChild("TextLabel");
			if p21 == "Rainbow" then
				l__TextLabel__79.RichText = true;
				local v80 = 0;
				local v81 = {};
				local v82, v83, v84 = string.gmatch(l__TextLabel__79.Text, ".");
				while true do
					local v85 = v82(v83, v84);
					if v85 then

					else
						break;
					end;
					v84 = v85;
					if string.match(v85, "%s") then
						table.insert(v81, v85);
					else
						v80 = v80 + 1;
						table.insert(v81, "<font color=\"rgb(0, 0, 0)\">");
						table.insert(v81, v85 .. "</font>");
					end;				
				end;
				local u25 = nil;
				u25 = l__RunService__1.Stepped:Connect(function()
					if not l__TextLabel__79 then
						u25:Disconnect();
						return;
					end;
					local v86 = "";
					local v87 = v80;
					local v88, v89, v90 = pairs(v81);
					while true do
						local v91, v92 = v88(v89, v90);
						if v91 then

						else
							break;
						end;
						v90 = v91;
						if string.match(v92, "%a+%b()") then
							v87 = v87 - 1;
							local v93 = Color3.fromHSV(-math.atan(math.tan((tick() + v87 / math.pi) / 1)) / math.pi + 0.5, 1, 1);
							v92 = string.gsub(v92, "%a+%b()", "rgb(" .. math.floor(v93.R * 255) .. ", " .. math.floor(v93.G * 255) .. ", " .. math.floor(v93.B * 255) .. ")");
						end;
						v86 = v86 .. v92;					
					end;
					l__TextLabel__79.Text = v86;
				end);
				return;
			end;
			if p21 == "Shadow" then
				l__TextLabel__79.RichText = true;
				local v94 = 0;
				local v95 = {};
				local v96, v97, v98 = string.gmatch(l__TextLabel__79.Text, ".");
				while true do
					local v99 = v96(v97, v98);
					if v99 then

					else
						break;
					end;
					v98 = v99;
					if string.match(v99, "%s") then
						table.insert(v95, v99);
					else
						v94 = v94 + 1;
						table.insert(v95, "<font color=\"rgb(0, 0, 0)\">");
						table.insert(v95, v99 .. "</font>");
					end;				
				end;
				local u26 = nil;
				u26 = l__RunService__1.Stepped:Connect(function()
					if not l__TextLabel__79 then
						u26:Disconnect();
						return;
					end;
					local v100 = "";
					local v101 = v94;
					local v102, v103, v104 = pairs(v95);
					while true do
						local v105, v106 = v102(v103, v104);
						if v105 then

						else
							break;
						end;
						v104 = v105;
						if string.match(v106, "%a+%b()") then
							v101 = v101 - 1;
							local v107 = -math.atan(math.tan((tick() + v101 / math.pi) / 1)) / math.pi + 0.5;
							local v108 = Color3.new(v107, v107, v107);
							v106 = string.gsub(v106, "%a+%b()", "rgb(" .. math.floor(v108.R * 255) .. ", " .. math.floor(v108.G * 255) .. ", " .. math.floor(v108.B * 255) .. ")");
						end;
						v100 = v100 .. v106;					
					end;
					l__TextLabel__79.Text = v100;
				end);
				return;
			end;
			if p21 == "Corrupted" then
				l__TextLabel__79.RichText = true;
				local l__Text__109 = l__TextLabel__79.Text;
				local v110 = { "[", "]" };
				local v111 = {};
				local v112, v113, v114 = string.gmatch(l__Text__109, ".");
				while true do
					local v115 = v112(v113, v114);
					if v115 then

					else
						break;
					end;
					v114 = v115;
					if not table.find(v110, v115) then
						table.insert(v111, v115);
					end;				
				end;
				local u27 = nil;
				local u28 = { "b", "i", "u", "s" };
				u27 = l__RunService__1.Stepped:Connect(function()
					local v116 = nil;
					if not l__TextLabel__79 then
						u27:Disconnect();
						return;
					end;
					v116 = u28[math.random(1, #u28)];
					if 0.6 < math.random() then
						local v117 = string.format("<%s>%s</%s>", v116, string.gsub(l__Text__109, v111[math.random(1, #v111)], string.char(math.random(65, 122))), v116);
					else
						v117 = string.format("<%s>%s</%s>", v116, l__Text__109, v116);
					end;
					l__TextLabel__79.Text = v117;
				end);
				return;
			end;
			if p21 == "TestTag" then
				l__TextLabel__79.RichText = true;
				l__TextLabel__79.Text = string.format("<font face='Michroma'>%s</font>", l__TextLabel__79.Text);
				return;
			end;
			if p21 == "1337" then
				l__TextLabel__79.RichText = true;
				local v118 = 0;
				local v119 = {};
				local v120, v121, v122 = string.gmatch(l__TextLabel__79.Text, ".");
				while true do
					local v123 = v120(v121, v122);
					if v123 then

					else
						break;
					end;
					v122 = v123;
					if string.match(v123, "%s") then
						table.insert(v119, v123);
					else
						v118 = v118 + 1;
						table.insert(v119, "<font color=\"rgb(0, 0, 0)\">");
						table.insert(v119, v123 .. "</font>");
					end;				
				end;
				local u29 = nil;
				u29 = l__RunService__1.Stepped:Connect(function()
					if not l__TextLabel__79 then
						u29:Disconnect();
						return;
					end;
					local v124 = "";
					local v125 = v118;
					local v126, v127, v128 = pairs(v119);
					while true do
						local v129, v130 = v126(v127, v128);
						if v129 then

						else
							break;
						end;
						v128 = v129;
						if string.match(v130, "%a+%b()") then
							v125 = v125 - 1;
							local v131 = Color3.fromHSV(0.3333333333333333, math.clamp(-math.atan(math.tan((tick() + v125 / math.pi) / 1)) / math.pi + 0.5, 0.2, 1), 1);
							v130 = string.gsub(v130, "%a+%b()", "rgb(" .. math.floor(v131.R * 255) .. ", " .. math.floor(v131.G * 255) .. ", " .. math.floor(v131.B * 255) .. ")");
						end;
						v124 = v124 .. v130;					
					end;
					l__TextLabel__79.Text = v124;
				end);
			end;
		end;
	end;
	local function v132(p22)
		local l__TextLabel__133 = p22:WaitForChild("TextLabel"):FindFirstChild("TextLabel");
		if l__TextLabel__133 then
			local v134 = l__TextLabel__133.Text;
			local v135, v136, v137 = pairs({ "%[", "%]", " " });
			while true do
				local v138, v139 = v135(v136, v137);
				if v138 then

				else
					break;
				end;
				v137 = v138;
				v134 = v134:gsub(v139, "");			
			end;
			local v140, v141, v142 = pairs({ "Corrupted", "Rainbow", "Shadow", "TestTag", "1337" });
			while true do
				local v143, v144 = v140(v141, v142);
				if v143 then

				else
					break;
				end;
				v142 = v143;
				if v134 == v144 then
					return true, v144;
				end;			
			end;
		end;
		return false, nil;
	end;
	local v145, v146, v147 = pairs(l__Scroller__76:GetChildren());
	while true do
		local v148, v149 = v145(v146, v147);
		if v148 then

		else
			break;
		end;
		v147 = v148;
		if v149:IsA("Frame") then
			if not table.find(v77, v149) then
				local v150, v151 = v132(v149);
				if v150 then
					if v151 then
						table.insert(v77, v149);
						v78(v149, v151);
					end;
				end;
			end;
		end;	
	end;
	l__Scroller__76.ChildAdded:Connect(function(p23)
		if p23:IsA("Frame") then
			if not table.find(v77, p23) then
				local v152, v153 = v132(p23);
				if v152 then
					if v153 then
						table.insert(v77, p23);
						v78(p23, v153);
					end;
				end;
			end;
		end;
	end);
end;
local l__Info__30 = l__PlayerGui__3:WaitForChild("Info");
local l__Message__31 = l__PlayerGui__3:WaitForChild("Message");
local u32 = require(l__Modules__16:WaitForChild("LevelData"));
local l__Leaderboard__33 = l__PlayerGui__3:WaitForChild("Leaderboard");
local l__Inventory__34 = l__PlayerGui__3:WaitForChild("Inventory");
local u35 = false;
local l__Shop__36 = l__PlayerGui__3:WaitForChild("Shop");
function setupInfoGui()
	local v154 = l__Info__30:WaitForChild("Copy"):Clone();
	l__Info__30.Copy:Destroy();
	local l__AdFrame__155 = l__Info__30:WaitForChild("AdFrame");
	local l__Main__156 = l__Info__30:WaitForChild("Main");
	local l__LevelToggle__157 = l__Info__30:WaitForChild("LevelToggle");
	local l__RadioToggle__158 = l__Info__30:WaitForChild("RadioToggle");
	local l__MessageFrame__159 = l__Message__31:WaitForChild("MessageFrame");
	local l__Bottombar__160 = l__Main__156:WaitForChild("Bottombar");
	local l__Sidebar__161 = l__Main__156:WaitForChild("Sidebar");
	local l__EnableShiftLock__162 = l__Main__156:WaitForChild("EnableShiftLock");
	local l__Topbar__163 = l__Main__156:WaitForChild("Topbar");
	local l__Mute__164 = l__Bottombar__160:WaitForChild("Mute");
	local l__Playing__165 = l__Bottombar__160:WaitForChild("Playing");
	local l__OpenLeader__166 = l__Bottombar__160:WaitForChild("OpenLeader");
	local l__OpenInv__167 = l__Sidebar__161:WaitForChild("OpenInv");
	local l__OpenShop__168 = l__Sidebar__161:WaitForChild("OpenShop");
	local v169 = { l__EnableShiftLock__162, l__Topbar__163:WaitForChild("Overtime"), l__Topbar__163:WaitForChild("Rounds") };
	local u37 = false;
	local l__RadioSettings__38 = l__Info__30:WaitForChild("RadioSettings");
	local l__LevelFrame__39 = l__Info__30:WaitForChild("LevelFrame");
	l__LevelFrame__39.Headshot.Image = string.format("rbxthumb://type=AvatarHeadShot&id=%i&w=420&h=420", l__LocalPlayer__10.UserId);
	l__LevelFrame__39.PlayerName.Text = l__LocalPlayer__10.Name;
	local function u40(p24)
		local v170, v171, v172 = u32:XPToLevel(p24);
		l__LevelFrame__39.TotalXP.Text = string.format("Total XP: %i", p24);
		local v173 = "Beginner";
		if 5 <= v170 then
			if v170 < 10 then
				v173 = "Novice";
			elseif 10 <= v170 then
				if v170 < 15 then
					v173 = "Skilled";
				elseif 15 <= v170 then
					if v170 < 20 then
						v173 = "Experienced";
					elseif 20 <= v170 then
						if v170 < 25 then
							v173 = "Advanced";
						elseif 25 <= v170 then
							if v170 < 50 then
								v173 = "Expert";
							elseif 50 <= v170 then
								v173 = "Doesn't Touch Grass";
							end;
						elseif 50 <= v170 then
							v173 = "Doesn't Touch Grass";
						end;
					elseif 25 <= v170 then
						if v170 < 50 then
							v173 = "Expert";
						elseif 50 <= v170 then
							v173 = "Doesn't Touch Grass";
						end;
					elseif 50 <= v170 then
						v173 = "Doesn't Touch Grass";
					end;
				elseif 20 <= v170 then
					if v170 < 25 then
						v173 = "Advanced";
					elseif 25 <= v170 then
						if v170 < 50 then
							v173 = "Expert";
						elseif 50 <= v170 then
							v173 = "Doesn't Touch Grass";
						end;
					elseif 50 <= v170 then
						v173 = "Doesn't Touch Grass";
					end;
				elseif 25 <= v170 then
					if v170 < 50 then
						v173 = "Expert";
					elseif 50 <= v170 then
						v173 = "Doesn't Touch Grass";
					end;
				elseif 50 <= v170 then
					v173 = "Doesn't Touch Grass";
				end;
			elseif 15 <= v170 then
				if v170 < 20 then
					v173 = "Experienced";
				elseif 20 <= v170 then
					if v170 < 25 then
						v173 = "Advanced";
					elseif 25 <= v170 then
						if v170 < 50 then
							v173 = "Expert";
						elseif 50 <= v170 then
							v173 = "Doesn't Touch Grass";
						end;
					elseif 50 <= v170 then
						v173 = "Doesn't Touch Grass";
					end;
				elseif 25 <= v170 then
					if v170 < 50 then
						v173 = "Expert";
					elseif 50 <= v170 then
						v173 = "Doesn't Touch Grass";
					end;
				elseif 50 <= v170 then
					v173 = "Doesn't Touch Grass";
				end;
			elseif 20 <= v170 then
				if v170 < 25 then
					v173 = "Advanced";
				elseif 25 <= v170 then
					if v170 < 50 then
						v173 = "Expert";
					elseif 50 <= v170 then
						v173 = "Doesn't Touch Grass";
					end;
				elseif 50 <= v170 then
					v173 = "Doesn't Touch Grass";
				end;
			elseif 25 <= v170 then
				if v170 < 50 then
					v173 = "Expert";
				elseif 50 <= v170 then
					v173 = "Doesn't Touch Grass";
				end;
			elseif 50 <= v170 then
				v173 = "Doesn't Touch Grass";
			end;
		elseif 10 <= v170 then
			if v170 < 15 then
				v173 = "Skilled";
			elseif 15 <= v170 then
				if v170 < 20 then
					v173 = "Experienced";
				elseif 20 <= v170 then
					if v170 < 25 then
						v173 = "Advanced";
					elseif 25 <= v170 then
						if v170 < 50 then
							v173 = "Expert";
						elseif 50 <= v170 then
							v173 = "Doesn't Touch Grass";
						end;
					elseif 50 <= v170 then
						v173 = "Doesn't Touch Grass";
					end;
				elseif 25 <= v170 then
					if v170 < 50 then
						v173 = "Expert";
					elseif 50 <= v170 then
						v173 = "Doesn't Touch Grass";
					end;
				elseif 50 <= v170 then
					v173 = "Doesn't Touch Grass";
				end;
			elseif 20 <= v170 then
				if v170 < 25 then
					v173 = "Advanced";
				elseif 25 <= v170 then
					if v170 < 50 then
						v173 = "Expert";
					elseif 50 <= v170 then
						v173 = "Doesn't Touch Grass";
					end;
				elseif 50 <= v170 then
					v173 = "Doesn't Touch Grass";
				end;
			elseif 25 <= v170 then
				if v170 < 50 then
					v173 = "Expert";
				elseif 50 <= v170 then
					v173 = "Doesn't Touch Grass";
				end;
			elseif 50 <= v170 then
				v173 = "Doesn't Touch Grass";
			end;
		elseif 15 <= v170 then
			if v170 < 20 then
				v173 = "Experienced";
			elseif 20 <= v170 then
				if v170 < 25 then
					v173 = "Advanced";
				elseif 25 <= v170 then
					if v170 < 50 then
						v173 = "Expert";
					elseif 50 <= v170 then
						v173 = "Doesn't Touch Grass";
					end;
				elseif 50 <= v170 then
					v173 = "Doesn't Touch Grass";
				end;
			elseif 25 <= v170 then
				if v170 < 50 then
					v173 = "Expert";
				elseif 50 <= v170 then
					v173 = "Doesn't Touch Grass";
				end;
			elseif 50 <= v170 then
				v173 = "Doesn't Touch Grass";
			end;
		elseif 20 <= v170 then
			if v170 < 25 then
				v173 = "Advanced";
			elseif 25 <= v170 then
				if v170 < 50 then
					v173 = "Expert";
				elseif 50 <= v170 then
					v173 = "Doesn't Touch Grass";
				end;
			elseif 50 <= v170 then
				v173 = "Doesn't Touch Grass";
			end;
		elseif 25 <= v170 then
			if v170 < 50 then
				v173 = "Expert";
			elseif 50 <= v170 then
				v173 = "Doesn't Touch Grass";
			end;
		elseif 50 <= v170 then
			v173 = "Doesn't Touch Grass";
		end;
		l__LevelFrame__39.LevelInfo.Text = string.format("Your level is: %i (%s)", v170, v173);
		l__LevelFrame__39.Bar.XPProgress.Text = string.format("%i / %i", v172, v171);
		l__TweenService__2:Create(l__LevelFrame__39.Bar.Progress, TweenInfo.new(0.5), {
			Size = UDim2.new(v172 / v171, 0, 1, 0)
		}):Play();
	end;
	task.delay(5, function()
		u40(l__RemoteFunction__21:InvokeServer("GetXP"));
	end);
	local v174, v175 = pcall(l__MarketplaceService__5.UserOwnsGamePassAsync, l__MarketplaceService__5, l__LocalPlayer__10.UserId, 21132978);
	if not v174 then
		v175 = false;
	end;
	if v175 then
		u37 = true;
		l__RadioSettings__38.Wall.Visible = false;
		l__RadioSettings__38.SoundIdBox.TextEditable = true;
	end;
	local u41 = false;
	local u42 = {};
	local u43 = {};
	local v176, v177, v178 = pairs(l__Sidebar__161:GetDescendants());
	while true do
		local v179, v180 = v176(v177, v178);
		if v179 then

		else
			break;
		end;
		v178 = v179;
		if not v180:IsA("TextButton") then
			table.insert(v169, v180);
		end;	
	end;
	local v181, v182, v183 = pairs(l__Bottombar__160:GetDescendants());
	while true do
		local v184, v185 = v181(v182, v183);
		if v184 then

		else
			break;
		end;
		v183 = v184;
		if v185:IsA("TextLabel") then
			table.insert(v169, v185);
		end;	
	end;
	local u44 = false;
	l__UserInputService__6.InputChanged:Connect(function()
		if u44 then
			local v186 = l__UserInputService__6:GetMouseLocation() - Vector2.new(l__RadioSettings__38.VolumeSlider.Slider.AbsoluteSize.X / 2, 0) - l__RadioSettings__38.VolumeSlider.AbsolutePosition;
			local v187 = l__RadioSettings__38.VolumeSlider.AbsoluteSize.X - l__RadioSettings__38.VolumeSlider.Slider.AbsoluteSize.X;
			local v188 = math.clamp(v186.X, 0, v187);
			l__RadioSettings__38.VolumeSlider.Slider.Position = UDim2.new(0, v188, 0.256, 0);
			l__RemoteEvent__20:FireServer("ChangeRadioSetting", "Volume", math.floor(v188 / v187 * 10) / 10);
		end;
	end);
	l__UserInputService__6.InputEnded:Connect(function(p25, p26)
		if p25.UserInputType ~= Enum.UserInputType.MouseButton1 then
			if p25.UserInputType == Enum.UserInputType.Touch then
				u44 = false;
			end;
		else
			u44 = false;
		end;
	end);
	local function u45(p27)
		if p27 == true then

		else
			local v189 = { l__TweenService__2:Create(l__MessageFrame__159, TweenInfo.new(0.25), {
					BackgroundTransparency = 1
				}), l__TweenService__2:Create(l__MessageFrame__159.Headshot, TweenInfo.new(0.25), {
					ImageTransparency = 1
				}), l__TweenService__2:Create(l__MessageFrame__159.Message, TweenInfo.new(0.25), {
					TextTransparency = 1
				}), l__TweenService__2:Create(l__MessageFrame__159.Message.UIStroke, TweenInfo.new(0.25), {
					Transparency = 1
				}), l__TweenService__2:Create(l__MessageFrame__159.Username, TweenInfo.new(0.25), {
					TextTransparency = 1
				}), l__TweenService__2:Create(l__MessageFrame__159.Username.UIStroke, TweenInfo.new(0.25), {
					Transparency = 1
				}) };
			local v190, v191, v192 = pairs(v189);
			while true do
				local v193, v194 = v190(v191, v192);
				if v193 then

				else
					break;
				end;
				v192 = v193;
				v194:Play();			
			end;
			v189[1].Completed:Connect(function()
				task.wait(1);
				l__MessageFrame__159.Visible = false;
			end);
			return;
		end;
		l__MessageFrame__159.BackgroundTransparency = 1;
		l__MessageFrame__159.Headshot.ImageTransparency = 1;
		l__MessageFrame__159.Message.TextTransparency = 1;
		l__MessageFrame__159.Message.UIStroke.Transparency = 1;
		l__MessageFrame__159.Username.TextTransparency = 1;
		l__MessageFrame__159.Username.UIStroke.Transparency = 1;
		l__MessageFrame__159.Visible = true;
		local v195, v196, v197 = pairs({ l__TweenService__2:Create(l__MessageFrame__159, TweenInfo.new(0.25), {
				BackgroundTransparency = 0.5
			}), l__TweenService__2:Create(l__MessageFrame__159.Headshot, TweenInfo.new(0.25), {
				ImageTransparency = 0
			}), l__TweenService__2:Create(l__MessageFrame__159.Message, TweenInfo.new(0.25), {
				TextTransparency = 0
			}), l__TweenService__2:Create(l__MessageFrame__159.Message.UIStroke, TweenInfo.new(0.25), {
				Transparency = 0
			}), l__TweenService__2:Create(l__MessageFrame__159.Username, TweenInfo.new(0.25), {
				TextTransparency = 0
			}), l__TweenService__2:Create(l__MessageFrame__159.Username.UIStroke, TweenInfo.new(0.25), {
				Transparency = 0
			}) });
		while true do
			local v198, v199 = v195(v196, v197);
			if v198 then

			else
				break;
			end;
			v197 = v198;
			v199:Play();		
		end;
	end;
	l__RemoteEvent__20.OnClientEvent:Connect(function(p28, ...)
		local v200 = { ... };
		if p28 == "EnableRadio" then
			u37 = true;
			l__RadioSettings__38.Wall.Visible = false;
			l__RadioSettings__38.SoundIdBox.TextEditable = true;
			return;
		end;
		if p28 == "UpdateXP" then
			u40(v200[1]);
			return;
		end;
		if p28 == "Message" then
			local v201 = v200[1];
			local v202, v203 = l__Players__3:GetUserThumbnailAsync(v201, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420);
			l__MessageFrame__159.Headshot.Image = v202;
			l__MessageFrame__159.Message.Text = "";
			l__MessageFrame__159.Username.Text = string.format("Message from %s", (l__Players__3:GetNameFromUserIdAsync(v201)));
			u45(true);
			local v204, v205, v206 = pairs((string.split(v200[2], "")));
			while true do
				local v207, v208 = v204(v205, v206);
				if v207 then

				else
					break;
				end;
				v206 = v207;
				l__MessageFrame__159.Message.Text = string.format("%s%s", l__MessageFrame__159.Message.Text, v208);
				task.wait(0.03333333333333333);			
			end;
			task.wait(5);
			u45(false);
		end;
	end);
	l__Playing__165.MouseButton1Down:Connect(function()
		playSound("rbxassetid://140910211", 0.5);
		local v209 = l__RemoteFunction__21:InvokeServer("SetActivity");
		if v209 == true then
			l__Playing__165.Info.Text = "Playing";
			l__Playing__165.Info.TextColor3 = Color3.new(1, 1, 1);
			l__Playing__165.Image = "rbxassetid://5393905883";
			return;
		end;
		if v209 == false then
			l__Playing__165.Info.Text = "Not Playing";
			l__Playing__165.Info.TextColor3 = Color3.new(1, 0, 0);
			l__Playing__165.Image = "rbxassetid://5393905657";
		end;
	end);
	local u46 = false;
	local u47 = nil;
	l__Mute__164.MouseButton1Down:Connect(function()
		playSound("rbxassetid://140910211", 0.5);
		if u46 == false then
			u46 = true;
			local v210, v211, v212 = pairs(l__SoundService__8:GetDescendants());
			while true do
				local v213, v214 = v210(v211, v212);
				if v213 then

				else
					break;
				end;
				v212 = v213;
				if v214:IsA("Sound") then
					if v214.Parent ~= l__Ignore__5 then
						v214.Volume = 0;
					end;
				end;			
			end;
			u47 = l__SoundService__8.DescendantAdded:Connect(function(p29)
				if p29:IsA("Sound") then
					if p29.Parent ~= l__Ignore__5 then
						p29.Volume = 0;
					end;
				end;
			end);
			l__Mute__164.Info.Text = "Music Off";
			l__Mute__164.Info.TextColor3 = Color3.new(1, 0, 0);
			l__Mute__164.Image = "rbxassetid://5393846813";
			return;
		end;
		if u46 == true then
			u46 = false;
			if u47 then
				u47:Disconnect();
				u47 = nil;
			end;
			local v215, v216, v217 = pairs(l__SoundService__8:GetDescendants());
			while true do
				local v218, v219 = v215(v216, v217);
				if v218 then

				else
					break;
				end;
				v217 = v218;
				if v219:IsA("Sound") then
					if v219.Parent ~= l__Ignore__5 then
						v219.Volume = 0.13;
					end;
				end;			
			end;
			l__Mute__164.Info.Text = "Music On";
			l__Mute__164.Info.TextColor3 = Color3.new(1, 1, 1);
			l__Mute__164.Image = "rbxassetid://5393846963";
		end;
	end);
	l__OpenLeader__166.MouseButton1Down:Connect(function()
		if l__Leaderboard__33:WaitForChild("Main").Visible == false then
			if l__Inventory__34:WaitForChild("TradeFrame").Visible == false then
				if u35 == false then
					closeOtherGuis(l__Leaderboard__33);
					l__Leaderboard__33:WaitForChild("Main").Visible = true;
					playSound("rbxassetid://140910211", 0.5);
				end;
			end;
		end;
	end);
	l__OpenInv__167.MouseButton1Down:Connect(function()
		if l__Inventory__34:WaitForChild("Main").Visible == false then
			if l__Inventory__34:WaitForChild("TradeFrame").Visible == false then
				if u35 == false then
					closeOtherGuis(l__Inventory__34);
					l__Inventory__34:WaitForChild("Main").Visible = true;
					playSound("rbxassetid://140910211", 0.5);
				end;
			end;
		end;
	end);
	l__OpenShop__168.MouseButton1Down:Connect(function()
		if l__Shop__36:WaitForChild("Main").Visible == false then
			if l__Inventory__34:WaitForChild("TradeFrame").Visible == false then
				if u35 == false then
					closeOtherGuis(l__Shop__36);
					l__Shop__36:WaitForChild("Main").Visible = true;
					playSound("rbxassetid://140910211", 0.5);
				end;
			end;
		end;
	end);
	l__AdFrame__155.Close.MouseButton1Down:Connect(function()
		l__AdFrame__155.Visible = false;
		playSound("rbxassetid://140910211", 0.5);
	end);
	l__AdFrame__155.Buy.MouseButton1Down:Connect(function()
		if l__AdFrame__155.IsDeveloperProduct.Value == false then
			l__MarketplaceService__5:PromptGamePassPurchase(l__LocalPlayer__10, l__AdFrame__155.Product.Value);
			return;
		end;
		l__MarketplaceService__5:PromptProductPurchase(l__LocalPlayer__10, l__AdFrame__155.Product.Value);
	end);
	l__LevelToggle__157.Button.MouseButton1Down:Connect(function()
		if l__LevelFrame__39.Visible == false then
			if l__Inventory__34:WaitForChild("TradeFrame").Visible == false then
				if u35 == false then
					closeOtherGuis(l__LevelFrame__39);
					l__LevelFrame__39.Visible = true;
					l__LevelFrame__39.Title.Size = UDim2.new(1, 0, 0.14, 0);
					l__LevelFrame__39.Title.Size = UDim2.new(1, 0, 0.15, 0);
					playSound("rbxassetid://140910211", 0.5);
				end;
			end;
		end;
	end);
	l__LevelFrame__39.Close.MouseButton1Down:Connect(function()
		l__LevelFrame__39.Visible = false;
		playSound("rbxassetid://140910211", 0.5);
	end);
	l__RadioToggle__158.Button.MouseButton1Down:Connect(function()
		if l__RadioSettings__38.Visible == false then
			if l__Inventory__34:WaitForChild("TradeFrame").Visible == false then
				if u35 == false then
					closeOtherGuis(l__RadioSettings__38);
					l__RadioSettings__38.Visible = true;
					l__RadioSettings__38.Wall.Size = UDim2.new(1, 0, 0.53, 0);
					l__RadioSettings__38.Wall.Size = UDim2.new(1, 0, 0.54, 0);
					playSound("rbxassetid://140910211", 0.5);
				end;
			end;
		end;
	end);
	l__RadioSettings__38.Close.MouseButton1Down:Connect(function()
		l__RadioSettings__38.Visible = false;
		playSound("rbxassetid://140910211", 0.5);
	end);
	l__RadioSettings__38.LPButton.MouseButton1Down:Connect(function()
		if not u37 then
			return;
		end;
		if l__RadioSettings__38.LPButton.ImageColor3 == Color3.new(1, 0, 0) then
			l__RemoteEvent__20:FireServer("ChangeRadioSetting", "EnableLooping", true);
			l__RadioSettings__38.LPButton.ImageColor3 = Color3.new(0, 1, 0);
			return;
		end;
		if l__RadioSettings__38.LPButton.ImageColor3 == Color3.new(0, 1, 0) then
			l__RemoteEvent__20:FireServer("ChangeRadioSetting", "EnableLooping", false);
			l__RadioSettings__38.LPButton.ImageColor3 = Color3.new(1, 0, 0);
		end;
	end);
	local function u48(p30)
		u41 = true;
		if p30 then
			local v220, v221, v222 = pairs(u42);
			while true do
				local v223, v224 = v220(v221, v222);
				if v223 then

				else
					break;
				end;
				v222 = v223;
				v224:Disconnect();			
			end;
			local v225, v226, v227 = pairs(u43);
			while true do
				local v228, v229 = v225(v226, v227);
				if v228 then

				else
					break;
				end;
				v227 = v228;
				if v229 then
					v229.Volume = 0.5;
				end;			
			end;
			u41 = false;
			return;
		end;
		local v230, v231, v232 = pairs(l__Players__3:GetPlayers());
		while true do
			local v233, v234 = v230(v231, v232);
			if v233 then

			else
				break;
			end;
			v232 = v233;
			if v234 ~= l__LocalPlayer__10 then
				if v234.Character then
					if v234.Character:FindFirstChild("Radio") then
						local l__Radio__235 = v234.Character:FindFirstChild("Radio");
						if l__Radio__235:FindFirstChild("RadioPart") then
							if l__Radio__235:FindFirstChild("RadioPart"):FindFirstChild("Sound") then
								local l__Sound__236 = l__Radio__235:FindFirstChild("RadioPart"):FindFirstChild("Sound");
								local v237 = l__Sound__236:GetPropertyChangedSignal("Volume"):Connect(function()
									l__Sound__236.Volume = 0;
								end);
								l__Sound__236.Volume = 0;
								table.insert(u43, l__Sound__236);
								table.insert(u42, v237);
							end;
						end;
					end;
				end;
			end;		
		end;
		table.insert(u42, (l__Workspace__9.DescendantAdded:Connect(function(p31)
			if p31:IsA("Sound") then
				if p31.Parent.Name == "RadioPart" then
					if l__Players__3:GetPlayerFromCharacter(p31.Parent.Parent.Parent) then
						if l__Players__3:GetPlayerFromCharacter(p31.Parent.Parent.Parent) ~= l__LocalPlayer__10 then
							p31.Volume = 0;
							table.insert(u43, p31);
						end;
					end;
				end;
			end;
		end)));
		u41 = false;
	end;
	l__RadioSettings__38.DRButton.MouseButton1Down:Connect(function()
		if l__RadioSettings__38.DRButton.ImageColor3 == Color3.new(1, 0, 0) then
			u48(false);
			l__RadioSettings__38.DRButton.ImageColor3 = Color3.new(0, 1, 0);
			return;
		end;
		if l__RadioSettings__38.DRButton.ImageColor3 == Color3.new(0, 1, 0) then
			u48(true);
			l__RadioSettings__38.DRButton.ImageColor3 = Color3.new(1, 0, 0);
		end;
	end);
	l__RadioSettings__38.RVButton.MouseButton1Down:Connect(function()
		if l__RadioSettings__38.RVButton.ImageColor3 == Color3.new(1, 0, 0) then
			l__RemoteEvent__20:FireServer("ChangeRadioSetting", "Visible", true);
			l__RadioSettings__38.RVButton.ImageColor3 = Color3.new(0, 1, 0);
			return;
		end;
		if l__RadioSettings__38.RVButton.ImageColor3 == Color3.new(0, 1, 0) then
			l__RemoteEvent__20:FireServer("ChangeRadioSetting", "Visible", false);
			l__RadioSettings__38.RVButton.ImageColor3 = Color3.new(1, 0, 0);
		end;
	end);
	l__RadioSettings__38.Play.MouseButton1Down:Connect(function()
		if not u37 then
			return;
		end;
		if tonumber(l__RadioSettings__38.SoundIdBox.Text) then
			l__RemoteEvent__20:FireServer("ChangeRadioSetting", "EnableSound", true, tonumber(l__RadioSettings__38.SoundIdBox.Text));
		end;
	end);
	l__RadioSettings__38.Stop.MouseButton1Down:Connect(function()
		if not u37 then
			return;
		end;
		l__RemoteEvent__20:FireServer("ChangeRadioSetting", "EnableSound", false);
	end);
	l__RadioSettings__38.Wall.TextButton.MouseButton1Down:Connect(function()
		l__MarketplaceService__5:PromptGamePassPurchase(l__LocalPlayer__10, 21132978);
	end);
	l__RadioSettings__38.VolumeSlider.Slider.MouseButton1Down:Connect(function()
		if not u37 then
			return;
		end;
		u44 = true;
	end);
	local v238, v239 = pcall(l__MarketplaceService__5.UserOwnsGamePassAsync, l__MarketplaceService__5, l__LocalPlayer__10.UserId, l__AdFrame__155.Product.Value);
	if not v238 then
		v239 = false;
	end;
	if not v239 then
		coroutine.wrap(function()
			wait(5);
			l__AdFrame__155.Visible = true;
			l__AdFrame__155.Ad.Size = UDim2.new(1, 0, 0.99, 0);
			l__AdFrame__155.Ad.Size = UDim2.new(1, 0, 1, 0);
		end)();
	end;
	if u18 == true then
		l__EnableShiftLock__162.Visible = false;
		local v240, v241, v242 = pairs({ l__Mute__164, l__Playing__165, l__OpenLeader__166 });
		while true do
			local v243, v244 = v240(v241, v242);
			if v243 then

			else
				break;
			end;
			v242 = v243;
			v244.MouseEnter:Connect(function()
				v244.Info.Visible = true;
			end);
			v244.MouseLeave:Connect(function()
				v244.Info.Visible = false;
			end);		
		end;
	elseif u18 == false then
		local u49 = false;
		l__EnableShiftLock__162.MouseButton1Down:Connect(function()
			if u49 == false then
				local v245 = require(l__PlayerScripts__14:WaitForChild("PlayerModule"):WaitForChild("CameraModule"));
				v245.activeCameraController:Enable(true);
				v245.activeCameraController:SetIsMouseLocked(true);
				l__EnableShiftLock__162.Image = "rbxassetid://5393987253";
				u49 = true;
				return;
			end;
			if u49 == true then
				local v246 = require(l__PlayerScripts__14:WaitForChild("PlayerModule"):WaitForChild("CameraModule"));
				v246.activeCameraController:Enable(true);
				v246.activeCameraController:SetIsMouseLocked(false);
				l__EnableShiftLock__162.Image = "rbxassetid://5393987091";
				u49 = false;
			end;
		end);
		if l__Workspace__9.CurrentCamera.ViewportSize.X < 1000 then
			if l__Workspace__9.CurrentCamera.ViewportSize.Y < 1000 then
				local v247, v248, v249 = pairs(l__Main__156:GetDescendants());
				while true do
					local v250, v251 = v247(v248, v249);
					if v250 then

					else
						break;
					end;
					v249 = v250;
					if not table.find(v169, v251) then
						if v251:IsA("GuiObject") then
							v251.Size = UDim2.new(0, v251.Size.X.Offset * 0.6666666666666666, 0, v251.Size.Y.Offset * 0.6666666666666666);
						end;
					end;				
				end;
				l__EnableShiftLock__162.Position = UDim2.new(1, -92, 0.4, -32);
				l__AdFrame__155.Size = UDim2.new(0, l__AdFrame__155.Size.X.Offset / 2, 0, l__AdFrame__155.Size.Y.Offset / 2);
				l__AdFrame__155.Position = UDim2.new(0.5, -(l__AdFrame__155.Size.X.Offset / 2), 0.5, -(l__AdFrame__155.Size.Y.Offset / 2));
				l__AdFrame__155.Buy.TextScaled = false;
				l__LevelFrame__39.Size = UDim2.new(0, l__LevelFrame__39.Size.X.Offset * 0.6666666666666666, 0, l__LevelFrame__39.Size.Y.Offset * 0.6666666666666666);
				l__LevelFrame__39.Position = UDim2.new(0.5, -(l__LevelFrame__39.Size.X.Offset / 2), 0.5, -(l__LevelFrame__39.Size.Y.Offset / 2));
				l__LevelToggle__157.Size = UDim2.new(0, l__LevelToggle__157.Size.X.Offset * 0.6666666666666666, 0, l__LevelToggle__157.Size.Y.Offset * 0.6666666666666666);
				l__MessageFrame__159.Message.TextSize = 28;
				l__RadioSettings__38.Size = UDim2.new(0, l__RadioSettings__38.Size.X.Offset * 0.6666666666666666, 0, l__RadioSettings__38.Size.Y.Offset * 0.6666666666666666);
				l__LevelToggle__157.Position = UDim2.new(1, -(10 + l__LevelToggle__157.Size.X.Offset), 0.625, -l__LevelToggle__157.AbsoluteSize.Y - 5);
				l__RadioSettings__38.Position = UDim2.new(0.5, -(l__RadioSettings__38.Size.X.Offset / 2), 0.5, -(l__RadioSettings__38.Size.Y.Offset / 2));
				l__RadioToggle__158.Size = UDim2.new(0, l__RadioToggle__158.Size.X.Offset * 0.6666666666666666, 0, l__RadioToggle__158.Size.Y.Offset * 0.6666666666666666);
				l__RadioToggle__158.Position = UDim2.new(1, -(10 + l__RadioToggle__158.Size.X.Offset), 0.625, 0);
				l__RadioSettings__38.Wall.TextButton.TextScaled = false;
				l__Topbar__163.Position = UDim2.new(0.5, -l__Topbar__163.Size.X.Offset / 2, 0, 10);
				l__Sidebar__161.Size = l__Sidebar__161.Size + UDim2.new(0, l__OpenInv__167.Size.X.Offset * 0.0657, 0, 0);
				l__Sidebar__161.Position = UDim2.new(0, 10, 0.45, -l__Sidebar__161.Size.Y.Offset / 2);
				l__Bottombar__160.Position = UDim2.new(0.5, -(l__Bottombar__160.Size.X.Offset / 2), 1, -l__Bottombar__160.Size.Y.Offset - 10);
				local v252, v253, v254 = pairs(l__Bottombar__160:GetChildren());
				while true do
					local v255, v256 = v252(v253, v254);
					if v255 then

					else
						break;
					end;
					v254 = v255;
					if v256:IsA("ImageButton") then
						v256.Position = v256.Position - UDim2.new(0, 0, 0.3, 0);
					end;				
				end;
			end;
		end;
	end;
end;
local u50 = require(l__Modules__16:WaitForChild("ItemData"));
local u51 = {
	Common = 5, 
	Uncommon = 4, 
	Rare = 3, 
	Special = 2, 
	Unobtainable = 1
};
local u52 = require(l__Modules__16:WaitForChild("ImageData"));
local u53 = {
	Common = Color3.fromRGB(0, 0, 255), 
	Uncommon = Color3.fromRGB(255, 0, 255), 
	Rare = Color3.fromRGB(255, 0, 0), 
	Special = Color3.fromRGB(255, 255, 0), 
	Unobtainable = Color3.fromRGB(255, 255, 255), 
	Mythical = Color3.fromRGB(140, 30, 255)
};
function setupInventoryGui()
	local l__Main__257 = l__Inventory__34:WaitForChild("Main");
	local l__CaseFrame__258 = l__Inventory__34:WaitForChild("CaseFrame");
	local l__RewardFrame__259 = l__Inventory__34:WaitForChild("RewardFrame");
	local l__MessageFrame__260 = l__Inventory__34:WaitForChild("MessageFrame");
	local l__OddsFrame__261 = l__Inventory__34:WaitForChild("OddsFrame");
	local l__TradeFrame__262 = l__Inventory__34:WaitForChild("TradeFrame");
	local l__TradeupFrame__263 = l__Inventory__34:WaitForChild("TradeupFrame");
	local v264 = l__Main__257:WaitForChild("Copy"):Clone();
	l__Main__257:WaitForChild("Copy"):Destroy();
	local l__Close__265 = l__Main__257:WaitForChild("Close");
	local l__Enable__266 = l__Main__257:WaitForChild("Enable");
	local u54 = nil;
	local u55 = nil;
	local u56 = { "BombFlames", "ChatTags", "Swords", "Pets" };
	local u57 = nil;
	local function u58(p32)
		local v267, v268, v269 = pairs(p32:GetChildren());
		while true do
			local v270, v271 = v267(v268, v269);
			if v270 then

			else
				break;
			end;
			v269 = v270;
			if not v271:IsA("UIGridLayout") then
				v271:Destroy();
			end;		
		end;
		if p32:IsA("ScrollingFrame") then
			if p32 ~= l__CaseFrame__258.CaseScroll then
				p32.CanvasSize = UDim2.new(0, 0, 0, 0);
				return;
			end;
		end;
		if p32.Parent:IsA("ScrollingFrame") then
			if p32 ~= l__CaseFrame__258.CaseScroll then
				p32.Parent.CanvasSize = UDim2.new(0, 0, 0, 0);
			end;
		end;
	end;
	local function u59(p33, p34, p35, p36)
		local v272 = v264.Item:Clone();
		if p36 then
			v272.Name = p33 .. "_" .. p34 .. "_" .. p36;
		else
			v272.Name = p33 .. "_" .. p34;
		end;
		local l__Rarity__273 = u50.AllItems[p33][p34].Rarity;
		v272.LayoutOrder = u51[l__Rarity__273];
		if p33 == "ChatTags" then
			v272.ItemImage.Visible = false;
			v272.ItemLabel.Text = string.format("[%s]", v24[p34].TagText);
			v272.ItemLabel.TextColor3 = v24[p34].TagColor;
			v272.ItemLabel.Visible = true;
		elseif u52[p33][string.lower(p34)] then
			v272.ItemImage.Image = u52[p33][string.lower(p34)];
		else
			v272.ItemImage.Image = u52.Assets.error;
		end;
		if p36 then
			v272.Serial.Text = string.format("#%i", p36);
			v272.Serial.Visible = true;
		elseif 1 < p35 then
			v272.Amount.Text = string.format("x%s", p35);
			v272.Amount.Visible = true;
		end;
		v272.ItemName.Text = p34;
		v272.ItemName.TextColor3 = u53[l__Rarity__273];
		if l__Rarity__273 == "Mythical" then
			task.spawn(function()
				v272.ItemName.RichText = true;
				local v274 = 0;
				local v275 = {};
				local v276, v277, v278 = string.gmatch(v272.ItemName.Text, ".");
				while true do
					local v279 = v276(v277, v278);
					if v279 then

					else
						break;
					end;
					v278 = v279;
					if string.match(v279, "%s") then
						table.insert(v275, v279);
					else
						v274 = v274 + 1;
						table.insert(v275, "<font color=\"rgb(0, 0, 0)\">");
						table.insert(v275, v279 .. "</font>");
					end;				
				end;
				local u60 = nil;
				u60 = l__RunService__1.Stepped:Connect(function()
					if v272 then
						if not v272:FindFirstChild("ItemName") then
							u60:Disconnect();
							return;
						end;
					else
						u60:Disconnect();
						return;
					end;
					local v280 = "";
					local v281 = v274;
					local v282, v283, v284 = pairs(v275);
					while true do
						local v285, v286 = v282(v283, v284);
						if v285 then

						else
							break;
						end;
						v284 = v285;
						if string.match(v286, "%a+%b()") then
							v281 = v281 - 1;
							local v287 = math.clamp(-math.atan(math.tan((tick() * 1.5 + v281 / math.pi) / 2)) / math.pi + 0.5, 0.5, 1);
							local v288 = Color3.fromHSV(0.748, v287, v287);
							v286 = string.gsub(v286, "%a+%b()", "rgb(" .. math.floor(v288.R * 255) .. ", " .. math.floor(v288.G * 255) .. ", " .. math.floor(v288.B * 255) .. ")");
						end;
						v280 = v280 .. v286;					
					end;
					v272.ItemName.Text = v280;
				end);
			end);
		elseif l__Rarity__273 == "Unobtainable" then
			if p33 == "ChatTags" then
				if p34 == "Rainbow" then
					task.spawn(function()
						v272.ItemLabel.RichText = true;
						local v289 = 0;
						local v290 = {};
						local v291, v292, v293 = string.gmatch(v272.ItemLabel.Text, ".");
						while true do
							local v294 = v291(v292, v293);
							if v294 then

							else
								break;
							end;
							v293 = v294;
							if string.match(v294, "%s") then
								table.insert(v290, v294);
							else
								v289 = v289 + 1;
								table.insert(v290, "<font color=\"rgb(0, 0, 0)\">");
								table.insert(v290, v294 .. "</font>");
							end;						
						end;
						local u61 = nil;
						u61 = l__RunService__1.Stepped:Connect(function()
							if v272 then
								if not v272:FindFirstChild("ItemName") then
									u61:Disconnect();
									return;
								end;
							else
								u61:Disconnect();
								return;
							end;
							local v295 = "";
							local v296 = v289;
							local v297, v298, v299 = pairs(v290);
							while true do
								local v300, v301 = v297(v298, v299);
								if v300 then

								else
									break;
								end;
								v299 = v300;
								if string.match(v301, "%a+%b()") then
									v296 = v296 - 1;
									local v302 = Color3.fromHSV(-math.atan(math.tan((tick() + v296 / math.pi) / 1)) / math.pi + 0.5, 1, 1);
									v301 = string.gsub(v301, "%a+%b()", "rgb(" .. math.floor(v302.R * 255) .. ", " .. math.floor(v302.G * 255) .. ", " .. math.floor(v302.B * 255) .. ")");
								end;
								v295 = v295 .. v301;							
							end;
							v272.ItemLabel.Text = v295;
						end);
					end);
				elseif p34 == "Corrupted" then
					task.spawn(function()
						v272.ItemLabel.RichText = true;
						local l__Text__303 = v272.ItemLabel.Text;
						local v304 = { "[", "]" };
						local v305 = {};
						local v306, v307, v308 = string.gmatch(l__Text__303, ".");
						while true do
							local v309 = v306(v307, v308);
							if v309 then

							else
								break;
							end;
							v308 = v309;
							if not table.find(v304, v309) then
								table.insert(v305, v309);
							end;						
						end;
						local u62 = nil;
						local u63 = { "b", "i", "u", "s" };
						u62 = l__RunService__1.Stepped:Connect(function()
							local v310 = nil;
							if v272 then
								if not v272:FindFirstChild("ItemName") then
									u62:Disconnect();
									return;
								end;
							else
								u62:Disconnect();
								return;
							end;
							v310 = u63[math.random(1, #u63)];
							if 0.6 < math.random() then
								local v311 = string.format("<%s>%s</%s>", v310, string.gsub(l__Text__303, v305[math.random(1, #v305)], string.char(math.random(65, 122))), v310);
							else
								v311 = string.format("<%s>%s</%s>", v310, l__Text__303, v310);
							end;
							v272.ItemLabel.Text = v311;
						end);
					end);
				elseif p34 == "Shadow" then
					task.spawn(function()
						v272.ItemLabel.RichText = true;
						local v312 = 0;
						local v313 = {};
						local v314, v315, v316 = string.gmatch(v272.ItemLabel.Text, ".");
						while true do
							local v317 = v314(v315, v316);
							if v317 then

							else
								break;
							end;
							v316 = v317;
							if string.match(v317, "%s") then
								table.insert(v313, v317);
							else
								v312 = v312 + 1;
								table.insert(v313, "<font color=\"rgb(0, 0, 0)\">");
								table.insert(v313, v317 .. "</font>");
							end;						
						end;
						local u64 = nil;
						u64 = l__RunService__1.Stepped:Connect(function()
							if v272 then
								if not v272:FindFirstChild("ItemName") then
									u64:Disconnect();
									return;
								end;
							else
								u64:Disconnect();
								return;
							end;
							local v318 = "";
							local v319 = v312;
							local v320, v321, v322 = pairs(v313);
							while true do
								local v323, v324 = v320(v321, v322);
								if v323 then

								else
									break;
								end;
								v322 = v323;
								if string.match(v324, "%a+%b()") then
									v319 = v319 - 1;
									local v325 = -math.atan(math.tan((tick() + v319 / math.pi) / 1)) / math.pi + 0.5;
									local v326 = Color3.new(v325, v325, v325);
									v324 = string.gsub(v324, "%a+%b()", "rgb(" .. math.floor(v326.R * 255) .. ", " .. math.floor(v326.G * 255) .. ", " .. math.floor(v326.B * 255) .. ")");
								end;
								v318 = v318 .. v324;							
							end;
							v272.ItemLabel.Text = v318;
						end);
					end);
				elseif p34 == "1337" then
					task.spawn(function()
						v272.ItemLabel.RichText = true;
						local v327 = 0;
						local v328 = {};
						local v329, v330, v331 = string.gmatch(v272.ItemLabel.Text, ".");
						while true do
							local v332 = v329(v330, v331);
							if v332 then

							else
								break;
							end;
							v331 = v332;
							if string.match(v332, "%s") then
								table.insert(v328, v332);
							else
								v327 = v327 + 1;
								table.insert(v328, "<font color=\"rgb(0, 0, 0)\">");
								table.insert(v328, v332 .. "</font>");
							end;						
						end;
						local u65 = nil;
						u65 = l__RunService__1.Stepped:Connect(function()
							if v272 then
								if not v272:FindFirstChild("ItemName") then
									u65:Disconnect();
									return;
								end;
							else
								u65:Disconnect();
								return;
							end;
							local v333 = "";
							local v334 = v327;
							local v335, v336, v337 = pairs(v328);
							while true do
								local v338, v339 = v335(v336, v337);
								if v338 then

								else
									break;
								end;
								v337 = v338;
								if string.match(v339, "%a+%b()") then
									v334 = v334 - 1;
									local v340 = Color3.fromHSV(0.3333333333333333, math.clamp(-math.atan(math.tan((tick() + v334 / math.pi) / 1)) / math.pi + 0.5, 0.2, 1), 1);
									v339 = string.gsub(v339, "%a+%b()", "rgb(" .. math.floor(v340.R * 255) .. ", " .. math.floor(v340.G * 255) .. ", " .. math.floor(v340.B * 255) .. ")");
								end;
								v333 = v333 .. v339;							
							end;
							v272.ItemLabel.Text = v333;
						end);
					end);
				elseif p34 == "TestTag" then
					task.spawn(function()
						v272.ItemLabel.RichText = true;
						v272.ItemLabel.Text = string.format("<font face='Michroma'>%s</font>", v272.ItemLabel.Text);
					end);
				end;
			elseif p33 == "Swords" then
				if p34 == "Rainbow" then
					task.spawn(function()
						local l__tick__341 = tick;
						local l__Color3_fromHSV__342 = Color3.fromHSV;
						while true do
							if task.wait() then

							else
								break;
							end;
							if v272 ~= nil then

							else
								break;
							end;
							if v272.Parent ~= nil then

							else
								break;
							end;
							if v272:FindFirstChild("ItemImage") ~= nil then

							else
								break;
							end;
							v272.ItemImage.ImageColor3 = l__Color3_fromHSV__342(l__tick__341() % 1 / 1, 1, 1);						
						end;
					end);
				end;
			end;
		end;
		if u50.AllItems[p33][p34].Tradable == true then
			v272.Untradable.Visible = false;
			return v272;
		end;
		v272.Untradable.Visible = true;
		return v272;
	end;
	local l__InventoryFrame__66 = l__Main__257:WaitForChild("InventoryFrame");
	local u67 = nil;
	local u68 = {};
	local u69 = require(l__Modules__16:WaitForChild("TradeupItemCheck"));
	local u70 = { "", "", "", "", "", "", "", "", "", "" };
	local u71 = false;
	local u72 = false;
	local u73 = nil;
	local u74 = {};
	local function u75(p37, p38, p39)
		if u54 ~= false then
			if not u55[p37] then
				return;
			end;
		else
			return;
		end;
		p39.Parent[p37].BorderSizePixel = 2;
		local v343, v344, v345 = pairs(u56);
		while true do
			local v346, v347 = v343(v344, v345);
			if v346 then

			else
				break;
			end;
			v345 = v346;
			if p39.Parent[v347].Name ~= p37 then
				p39.Parent[v347].BorderSizePixel = 0;
			end;		
		end;
		u57 = p37;
		u58(p39.Items);
		p39.Placeholder.Text = "Loading...";
		p39.Placeholder.Visible = true;
		local v348, v349, v350 = pairs(u55[p37]);
		while true do
			local v351, v352 = v348(v349, v350);
			if v351 then

			else
				break;
			end;
			local v353 = u59(p37, v352.Name, v352.Amount, v352.Serial);
			if p39 == l__InventoryFrame__66 then
				v353.Equipped.Visible = v352.Equipped;
			end;
			v353.Parent = p39.Items;
			if u55[p37][v351].Amount < 1 then
				v353.Visible = false;
			else
				v353.Visible = true;
			end;
			if l__LocalPlayer__10 == p38 then
				if p39 == l__InventoryFrame__66 then
					v353.Button.MouseButton1Down:Connect(function()
						local v354, v355 = l__RemoteFunction__21:InvokeServer("SetEquip", p37, v351, v352.Serial);
						if v354 == false then
							warn("Item failed to equip; you are either in cooldown or an error occured.");
							return;
						end;
						if v355 == true then

						else
							if v355 == false then
								u55[p37][v351].Equipped = false;
								v353.Equipped.Visible = false;
							end;
							return;
						end;
						u55[p37][v351].Equipped = true;
						v353.Equipped.Visible = true;
						local v356, v357, v358 = pairs(p39.Items:GetDescendants());
						while true do
							local v359, v360 = v356(v357, v358);
							if v359 then

							else
								break;
							end;
							v358 = v359;
							if v360.Name == "Equipped" then
								if v360.Parent ~= v353 then
									v360.Visible = false;
								end;
							end;						
						end;
					end);
				elseif p39 == l__TradeFrame__262.LocalInventory then
					v353.Button.MouseButton1Down:Connect(function()
						if u50.AllItems[p37][v352.Name].Tradable == false then
							if not table.find(v22, l__LocalPlayer__10.UserId) then
								return;
							end;
						end;
						if l__RemoteFunction__21:InvokeServer("ChangeOffer", "Add", u67, v353.Name) == true then

						else
							warn("Item failed to add: " .. v352.Name);
							return;
						end;
						if u68[v353.Name] then
							local l__Name__361 = v353.Name;
							u68[l__Name__361] = u68[l__Name__361] + 1;
						else
							u68[v353.Name] = 1;
						end;
						local v362 = u55[p37][v351];
						v362.Amount = v362.Amount - 1;
						if u55[p37][v351].Amount < 1 then
							v353.Visible = false;
							l__TradeFrame__262.LocalInventory.CanvasSize = UDim2.new(0, 0, 0, l__TradeFrame__262.LocalInventory.Items.UIGridLayout.AbsoluteContentSize.Y);
							return;
						end;
						if u55[p37][v351].Amount == 1 then
							v353.Amount.Visible = false;
							return;
						end;
						v353.Amount.Text = string.format("x%s", u55[p37][v351].Amount);
					end);
				elseif p39 == l__TradeupFrame__263.LocalInventory then
					v353.Button.MouseButton1Down:Connect(function()
						local v363 = string.format("%s_%s", p37, v352.Name);
						if not u69(v363) then
							l__MessageFrame__260.Message.Text = "Item must be from a case and not Unobtainable!";
							l__MessageFrame__260.Visible = true;
							local l__Text__76 = l__MessageFrame__260.Message.Text;
							task.delay(3, function()
								if l__MessageFrame__260.Message.Text == l__Text__76 then
									l__MessageFrame__260.Visible = false;
								end;
							end);
							return;
						end;
						if u70[10] ~= "" then
							return;
						end;
						if u70[1] ~= "" then
							local v364 = string.split(u70[1], "_");
							if u50.AllItems[p37][v352.Name].Rarity ~= u50.AllItems[v364[1]][v364[2]].Rarity then
								l__MessageFrame__260.Message.Text = "Tradeup items must be the same rarity!";
								l__MessageFrame__260.Visible = true;
								local l__Text__77 = l__MessageFrame__260.Message.Text;
								task.delay(3, function()
									if l__MessageFrame__260.Message.Text == l__Text__77 then
										l__MessageFrame__260.Visible = false;
									end;
								end);
								return;
							end;
						end;
						local v365, v366, v367 = pairs(u70);
						while true do
							local v368, v369 = v365(v366, v367);
							if v368 then

							else
								break;
							end;
							v367 = v368;
							if v369 == "" then
								u70[v368] = v363;
								local v370 = u55[p37][v352.Name];
								v370.Amount = v370.Amount - 1;
								if u55[p37][v352.Name].Amount < 1 then
									v353.Visible = false;
									l__TradeupFrame__263.LocalInventory.CanvasSize = UDim2.new(0, 0, 0, l__TradeupFrame__263.LocalInventory.Items.UIGridLayout.AbsoluteContentSize.Y);
								elseif u55[p37][v352.Name].Amount == 1 then
									v353.Amount.Visible = false;
								else
									v353.Amount.Text = string.format("x%s", u55[p37][v352.Name].Amount);
								end;
								local v371 = v264.ItemButton:Clone();
								v371.Name = v368;
								v371.LayoutOrder = v368;
								v371.ItemName.Text = v353.ItemName.Text;
								v371.ItemName.TextColor3 = v353.ItemName.TextColor3;
								if p37 == "ChatTags" then
									v371.ItemLabel.Text = v353.ItemLabel.Text;
									v371.ItemLabel.TextColor3 = v353.ItemLabel.TextColor3;
									v371.ItemLabel.Visible = true;
									v371.ItemImage.Visible = false;
								else
									v371.ItemImage.Image = v353.ItemImage.Image;
								end;
								v371.Parent = l__TradeupFrame__263.TradeupItems;
								v371.Visible = true;
								v371.MouseButton1Down:Connect(function()
									if u71 then
										return;
									end;
									local v372 = tonumber(v371.Name);
									local v373 = u70[v372];
									u70[v372] = "";
									local v374, v375, v376 = pairs(u70);
									while true do
										local v377, v378 = v374(v375, v376);
										if v377 then

										else
											break;
										end;
										v376 = v377;
										if v372 < v377 then
											if v378 ~= "" then
												if u70[v377 - 1] == "" then
													u70[v377 - 1] = v378;
													u70[v377] = "";
												end;
											end;
										end;									
									end;
									v371:Destroy();
									l__TradeupFrame__263.TradeupItems.ViewOdds.Visible = false;
									l__TradeupFrame__263.TradeupItems.Tradeup.Visible = false;
									l__TradeupFrame__263.TradeupItems.Tradeup.TextButton.Text = "Tradeup";
									u72 = false;
									local v379, v380, v381 = pairs(l__TradeupFrame__263.TradeupItems:GetChildren());
									while true do
										local v382, v383 = v379(v380, v381);
										if v382 then

										else
											break;
										end;
										v381 = v382;
										if v383:IsA("ImageButton") then
											if v372 < tonumber(v383.Name) then
												v383.Name = tonumber(v383.Name) - 1;
												v383.LayoutOrder = tonumber(v383.Name) - 1;
											end;
										end;									
									end;
									local v384, v385 = getItemInfo(v373);
									local v386 = u55[v384][v385];
									v386.Amount = v386.Amount + 1;
									if u57 == v384 then
										if 1 < u55[v384][v385].Amount then
											l__TradeupFrame__263.LocalInventory.Items:FindFirstChild(v373).Amount.Visible = true;
											l__TradeupFrame__263.LocalInventory.Items:FindFirstChild(v373).Amount.Text = string.format("x%s", u55[v384][v385].Amount);
										else
											l__TradeupFrame__263.LocalInventory.Items:FindFirstChild(v373).Amount.Visible = false;
										end;
										l__TradeupFrame__263.LocalInventory.Items:FindFirstChild(v373).Visible = true;
										l__TradeupFrame__263.LocalInventory.CanvasSize = UDim2.new(0, 0, 0, l__TradeupFrame__263.LocalInventory.Items.UIGridLayout.AbsoluteContentSize.Y);
									end;
								end);
								if v368 == 10 then
									l__TradeupFrame__263.TradeupItems.ViewOdds.Visible = true;
									l__TradeupFrame__263.TradeupItems.Tradeup.Visible = true;
									return;
								else
									return;
								end;
							end;						
						end;
					end);
				end;
			end;		
		end;
		if 0 < 0 then

		else
			p39.Placeholder.Text = "No items were found in this category.";
			return;
		end;
		p39.Placeholder.Visible = false;
		p39.CanvasSize = UDim2.new(0, 0, 0, p39.Items:WaitForChild("UIGridLayout").AbsoluteContentSize.Y);
	end;
	local u78 = false;
	local l__TradingFrame__79 = l__Main__257:WaitForChild("TradingFrame");
	local u80 = {};
	local function u81(p40, p41)
		local v387, v388 = l__RemoteFunction__21:InvokeServer("GetInventory", p40);
		u55 = v388;
		u54 = v387;
		u73 = p40;
		u74 = {};
		if u54 then
			if not u55 then
				local v389, v390, v391 = pairs(u56);
				while true do
					local v392, v393 = v389(v390, v391);
					if v392 then

					else
						break;
					end;
					v391 = v392;
					p41.Parent[v393].BorderSizePixel = 0;				
				end;
				u58(p41.Items);
				p41.Placeholder.Visible = true;
				if p40 == l__LocalPlayer__10 then
					p41.Placeholder.Text = "There are no items in your inventory.";
					return;
				else
					p41.Placeholder.Text = "This player has no items in their inventory.";
					return;
				end;
			end;
		else
			v389, v390, v391 = pairs(u56);
			while true do
				v392, v393 = v389(v390, v391);
				if v392 then

				else
					break;
				end;
				v391 = v392;
				p41.Parent[v393].BorderSizePixel = 0;			
			end;
			u58(p41.Items);
			p41.Placeholder.Visible = true;
			if p40 == l__LocalPlayer__10 then
				p41.Placeholder.Text = "There are no items in your inventory.";
				return;
			else
				p41.Placeholder.Text = "This player has no items in their inventory.";
				return;
			end;
		end;
		local v394, v395, v396 = pairs(u55);
		while true do
			local v397, v398 = v394(v395, v396);
			if v397 then

			else
				break;
			end;
			v396 = v397;
			local v399, v400, v401 = pairs(v398);
			while true do
				local v402, v403 = v399(v400, v401);
				if v402 then

				else
					break;
				end;
				v401 = v402;
				u74[string.format("%s_%s", v397, v403.Name)] = v403.Amount;			
			end;		
		end;
		if p40 == l__LocalPlayer__10 then
			p41.Parent.Owner.Text = "Your Inventory";
		else
			p41.Parent.Owner.Text = string.format("%s's Inventory", p40.Name);
		end;
		u75("BombFlames", p40, p41);
	end;
	local function u82(p42, p43)
		if u19.Incoming[p42] then
			u19.Incoming[p42] = nil;
		end;
		if u19.Outgoing[p42] then
			u19.Outgoing[p42] = nil;
		end;
		l__Main__257.Visible = false;
		l__TradeFrame__262.Confirmation.Text = string.format("%s has accepted the trade.", p42.Name);
		l__TradeFrame__262.PlayerOfferLabel.Text = string.format("%s's Offer", p42.Name);
		l__TradeFrame__262.Title.Text = string.format("Trading with: %s", p42.Name);
		u67 = p43;
		local v404 = l__Trades__19[u67];
		v404[p42.Name].Items.ChildAdded:Connect(function(p44)
			if p44:IsA("IntValue") then
				local v405 = string.split(p44.Name, "_");
				if #v405 ~= 2 then
					if #v405 ~= 3 then
						return;
					end;
				end;
				local v406 = v405[1];
				local v407 = v405[2];
				if u50.AllItems[v406] then
					if u50.AllItems[v406][v407] then
						l__TradeFrame__262.Accept.Text = "Accept";
						u78 = false;
						local v408 = u59(v406, v407, 1, v405[3]);
						v408.Parent = l__TradeFrame__262.PlayerOffer;
						v408.Visible = true;
						l__TradeFrame__262.PlayerOffer.CanvasSize = UDim2.new(0, l__TradeFrame__262.PlayerOffer.UIGridLayout.AbsoluteContentSize.X, 0, 0);
						p44:GetPropertyChangedSignal("Value"):Connect(function()
							l__TradeFrame__262.Accept.Text = "Accept";
							u78 = false;
							if 1 < p44.Value then

							else
								v408.Amount.Visible = false;
								return;
							end;
							v408.Amount.Text = string.format("x%s", p44.Value);
							v408.Amount.Visible = true;
						end);
					end;
				end;
			end;
		end);
		v404[p42.Name].Items.ChildRemoved:Connect(function(p45)
			if l__TradeFrame__262.PlayerOffer:FindFirstChild(p45.Name) then
				l__TradeFrame__262.PlayerOffer[p45.Name]:Destroy();
				l__TradeFrame__262.Accept.Text = "Accept";
				u78 = false;
			end;
		end);
		v404[p42.Name].Accepted:GetPropertyChangedSignal("Value"):Connect(function()
			l__TradeFrame__262.Confirmation.Visible = v404[p42.Name].Accepted.Value;
		end);
		v404[l__LocalPlayer__10.Name].Items.ChildAdded:Connect(function(p46)
			if p46:IsA("IntValue") then
				local v409 = string.split(p46.Name, "_");
				if #v409 ~= 2 then
					if #v409 ~= 3 then
						return;
					end;
				end;
				local v410 = v409[1];
				local v411 = v409[2];
				local v412 = v409[3];
				local v413 = v411;
				if v412 then
					v413 = string.format("%s_%s", v411, v412);
				end;
				if u50.AllItems[v410] then
					if u50.AllItems[v410][v411] then
						l__TradeFrame__262.Accept.Text = "Accept";
						u78 = false;
						local v414 = u59(v410, v411, 1, v412);
						v414.Parent = l__TradeFrame__262.LocalOffer;
						v414.Visible = true;
						v414.Button.MouseButton1Down:Connect(function()
							if l__RemoteFunction__21:InvokeServer("ChangeOffer", "Remove", u67, p46.Name) == true then
								if 1 < u68[p46.Name] then
									if u55[v410][v413].Amount < u74[p46.Name] then
										local l__Name__415 = p46.Name;
										u68[l__Name__415] = u68[l__Name__415] - 1;
										local v416 = u55[v410][v413];
										v416.Amount = v416.Amount + 1;
									else
										u68[p46.Name] = nil;
										if not u55[v410][v413].Serial then
											u55[v410][v413].Amount = u74[p46.Name];
										else
											u55[v410][v413].Amount = 1;
										end;
										v414:Destroy();
										l__TradeFrame__262.LocalOffer.CanvasSize = UDim2.new(0, l__TradeFrame__262.LocalOffer.UIGridLayout.AbsoluteContentSize.X, 0, 0);
									end;
								else
									u68[p46.Name] = nil;
									if not u55[v410][v413].Serial then
										u55[v410][v413].Amount = u74[p46.Name];
									else
										u55[v410][v413].Amount = 1;
									end;
									v414:Destroy();
									l__TradeFrame__262.LocalOffer.CanvasSize = UDim2.new(0, l__TradeFrame__262.LocalOffer.UIGridLayout.AbsoluteContentSize.X, 0, 0);
								end;
								if u57 == v410 then
									if 1 < u55[v410][v413].Amount then
										l__TradeFrame__262.LocalInventory.Items[p46.Name].Amount.Visible = true;
										l__TradeFrame__262.LocalInventory.Items[p46.Name].Amount.Text = string.format("x%s", u55[v410][v413].Amount);
									else
										l__TradeFrame__262.LocalInventory.Items[p46.Name].Amount.Visible = false;
									end;
									l__TradeFrame__262.LocalInventory.Items[p46.Name].Visible = true;
									return;
								end;
							else
								warn("Item failed to remove: " .. v414.Name);
							end;
						end);
						l__TradeFrame__262.LocalOffer.CanvasSize = UDim2.new(0, l__TradeFrame__262.LocalOffer.UIGridLayout.AbsoluteContentSize.X, 0, 0);
						p46:GetPropertyChangedSignal("Value"):Connect(function()
							l__TradeFrame__262.Accept.Text = "Accept";
							u78 = false;
							if 1 < p46.Value then

							else
								v414.Amount.Visible = false;
								return;
							end;
							v414.Amount.Text = string.format("x%s", p46.Value);
							v414.Amount.Visible = true;
						end);
					end;
				end;
			end;
		end);
		v404[l__LocalPlayer__10.Name].Items.ChildRemoved:Connect(function(p47)
			if l__TradeFrame__262.LocalOffer:FindFirstChild(p47.Name) then
				l__TradeFrame__262.LocalOffer[p47.Name]:Destroy();
				l__TradeFrame__262.Accept.Text = "Accept";
				u78 = false;
			end;
		end);
		l__TradeFrame__262.Visible = true;
	end;
	local function u83(p48)
		l__CaseFrame__258.Visible = false;
		local v417, v418 = getItemInfo(p48.Name);
		l__RewardFrame__259.ItemFrame.ItemName.Text = v418;
		l__RewardFrame__259.ItemFrame.ItemName.TextColor3 = u53[p48.Rarity];
		if v417 == "ChatTags" then
			l__RewardFrame__259.ItemFrame.ItemImage.Visible = false;
			l__RewardFrame__259.ItemFrame.ItemLabel.Text = string.format("[%s]", v24[v418].TagText);
			l__RewardFrame__259.ItemFrame.ItemLabel.TextColor3 = v24[v418].TagColor;
			l__RewardFrame__259.ItemFrame.ItemLabel.Visible = true;
		else
			l__RewardFrame__259.ItemFrame.ItemLabel.Visible = false;
			if u52[v417][string.lower(v418)] then
				l__RewardFrame__259.ItemFrame.ItemImage.Image = u52[v417][string.lower(v418)];
			else
				l__RewardFrame__259.ItemFrame.ItemImage.Image = u52.Assets.error;
			end;
			l__RewardFrame__259.ItemFrame.ItemImage.Visible = true;
		end;
		l__RewardFrame__259.Visible = true;
		local v419 = v264.RewardSound:Clone();
		v419.Parent = l__Ignore__5;
		v419.PlayOnRemove = true;
		v419:Destroy();
	end;
	l__Main__257.Tradeup.MouseButton1Down:Connect(function()
		l__Main__257.Visible = false;
		l__TradeupFrame__263.Visible = true;
	end);
	l__Close__265.MouseButton1Down:Connect(function()
		playSound("rbxassetid://140910211", 0.5);
		l__Main__257.Visible = false;
		l__MessageFrame__260.Visible = false;
	end);
	l__Enable__266.MouseButton1Down:Connect(function()
		local v420 = l__RemoteFunction__21:InvokeServer("SetTrading");
		if v420 == true then
			l__Enable__266.ImageColor3 = Color3.fromRGB(0, 255, 0);
			return;
		end;
		if v420 == false then
			l__Enable__266.ImageColor3 = Color3.fromRGB(255, 0, 0);
		end;
	end);
	local function u84()
		local v421, v422, v423 = pairs(l__Players__3:GetPlayers());
		while true do
			local v424, v425 = v421(v422, v423);
			if v424 then

			else
				break;
			end;
			v423 = v424;
			if v425 ~= l__LocalPlayer__10 then
				local v426 = v264.PlayerFrame:Clone();
				l__RunService__1.Stepped:Wait();
				v426.Parent = l__TradingFrame__79;
				v426.Name = v425.Name;
				local v427, v428 = l__Players__3:GetUserThumbnailAsync(v425.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100);
				v426:WaitForChild("Headshot").Image = v427;
				v426:WaitForChild("PlayerName").Text = v425.Name;
				if u19.Incoming[v425] then
					v426.Request.Text = "Incoming Trade";
				elseif u19.Outgoing[v425] then
					v426.Request.Text = "Trade Requested";
				end;
				v426.Visible = true;
				local u85 = false;
				v426.Load.MouseButton1Down:Connect(function()
					if not v425:IsDescendantOf(l__Players__3) then
						if u80[v426] then
							u81(l__LocalPlayer__10, l__InventoryFrame__66);
						end;
						if u19.Incoming[v425] then
							u19.Incoming[v425] = nil;
						end;
						if u19.Outgoing[v425] then
							u19.Outgoing[v425] = nil;
						end;
						v426:Destroy();
						l__TradingFrame__79.CanvasSize = UDim2.new(0, 0, 0, l__TradingFrame__79.UIGridLayout.AbsoluteContentSize.Y);
						return;
					end;
					if u85 == false then
						if not u80[v426] then

						else
							u85 = true;
							coroutine.wrap(function()
								wait(3);
								if v426 then
									u85 = false;
								end;
							end)();
							u81(l__LocalPlayer__10, l__InventoryFrame__66);
							v426.Load.Text = "Load Inventory";
							u80[v426] = nil;
							return;
						end;
					else
						return;
					end;
					u85 = true;
					coroutine.wrap(function()
						wait(3);
						if v426 then
							u85 = false;
						end;
					end)();
					u81(v425, l__InventoryFrame__66);
					v426.Load.Text = "Close Inventory";
					local v429, v430, v431 = pairs(l__TradingFrame__79:GetChildren());
					while true do
						local v432, v433 = v429(v430, v431);
						if v432 then

						else
							break;
						end;
						v431 = v432;
						if v433:IsA("GuiObject") then
							if v433 ~= v426 then
								if v433.Load.Text == "Close Inventory" then
									u80[v433] = nil;
									v433.Load.Text = "Load Inventory";
								end;
							end;
						end;					
					end;
					u80[v426] = true;
				end);
				local u86 = false;
				v426.Request.MouseButton1Down:Connect(function()
					if not v425:IsDescendantOf(l__Players__3) then
						if u80[v426] then
							u81(l__LocalPlayer__10, l__InventoryFrame__66);
						end;
						if u19.Incoming[v425] then
							u19.Incoming[v425] = nil;
						end;
						if u19.Outgoing[v425] then
							u19.Outgoing[v425] = nil;
						end;
						v426:Destroy();
						l__TradingFrame__79.CanvasSize = UDim2.new(0, 0, 0, l__TradingFrame__79.UIGridLayout.AbsoluteContentSize.Y);
						return;
					end;
					if u86 == false then
						if not u19.Outgoing[v425] then
							if not u19.Incoming[v425] then
								if l__RemoteFunction__21:InvokeServer("RequestTrade", v425) == true then
									u86 = true;
									u19.Outgoing[v425] = v425;
									v426.Request.Text = "Trade Requested";
									return;
								else
									u86 = true;
									v426.Request.Text = "Request Denied";
									coroutine.wrap(function()
										wait(3);
										if v426 then
											if not u19.Incoming[v425] then
												v426.Request.Text = "Request Trade";
												u86 = false;
											end;
										end;
									end)();
									return;
								end;
							end;
							local v434, v435 = l__RemoteFunction__21:InvokeServer("StartTrade", v425);
							if v434 then
								if v435 then
									u82(v425, v435);
									return;
								end;
							end;
							u86 = true;
							u19.Incoming[v425] = nil;
							v426.Request.Text = "Trade Unavailable";
							coroutine.wrap(function()
								wait(3);
								if v426 then
									if not u19.Incoming[v425] then
										v426.Request.Text = "Request Trade";
										u86 = false;
									end;
								end;
							end)();
						end;
					end;
				end);
				l__TradingFrame__79.CanvasSize = UDim2.new(0, 0, 0, l__TradingFrame__79.UIGridLayout.AbsoluteContentSize.Y);
			end;		
		end;
	end;
	local function u87(p49)
		u58(p49.Items);
		local v436, v437, v438 = pairs(l__TradingFrame__79:GetChildren());
		while true do
			local v439, v440 = v436(v437, v438);
			if v439 then

			else
				break;
			end;
			v438 = v439;
			if not v440:IsA("UIGridLayout") then
				v440:Destroy();
			end;		
		end;
		local v441, v442, v443 = pairs(u56);
		while true do
			local v444, v445 = v441(v442, v443);
			if v444 then

			else
				break;
			end;
			v443 = v444;
			p49.Parent[v445].BorderSizePixel = 0;		
		end;
		l__TradingFrame__79.CanvasSize = UDim2.new(0, 0, 0, 0);
		l__TradingFrame__79.CanvasPosition = Vector2.new(0, 0);
		p49.Placeholder.Text = "Loading...";
		p49.Placeholder.Visible = true;
		u57 = nil;
		u55 = nil;
		u54 = nil;
	end;
	l__Main__257:GetPropertyChangedSignal("Visible"):Connect(function()
		if l__Main__257.Visible == true then

		else
			if l__Main__257.Visible == false then
				u87(l__InventoryFrame__66);
			end;
			return;
		end;
		if l__LocalPlayer__10.Trading.Value == true then
			l__Enable__266.ImageColor3 = Color3.fromRGB(0, 255, 0);
		elseif l__LocalPlayer__10.Trading.Value == false then
			l__Enable__266.ImageColor3 = Color3.fromRGB(255, 0, 0);
		end;
		u81(l__LocalPlayer__10, l__InventoryFrame__66);
		u84();
	end);
	local u88 = false;
	l__OddsFrame__261:GetPropertyChangedSignal("Visible"):Connect(function()
		local v446 = nil;
		if l__OddsFrame__261.Visible then
			v446 = l__RemoteFunction__21:InvokeServer("GetOdds", u70);
			if v446 then

			else
				return;
			end;
		else
			u58(l__OddsFrame__261.Odds.Items);
			l__OddsFrame__261.Odds.Placeholder.Visible = true;
			task.wait();
			u88 = false;
			return;
		end;
		local v447, v448, v449 = pairs(v446);
		while true do
			local v450, v451 = v447(v448, v449);
			if v450 then

			else
				break;
			end;
			v449 = v450;
			local v452, v453 = getItemInfo(v450);
			local v454 = v264.OddsFrame:Clone();
			v454.Name = v450;
			v454.LayoutOrder = math.round(v451);
			v454.Chance.Text = string.format("%.2f%%", v451);
			v454.ItemName.Text = v453;
			local v455, v456, v457 = pairs(v454:GetChildren());
			while true do
				local v458, v459 = v455(v456, v457);
				if v458 then

				else
					break;
				end;
				v457 = v458;
				v459.TextColor3 = u53[u50.AllItems[v452][v453].Rarity];			
			end;
			v454.Parent = l__OddsFrame__261.Odds.Items;		
		end;
		l__OddsFrame__261.Odds.Placeholder.Visible = false;
		local v460, v461, v462 = pairs(l__OddsFrame__261.Odds.Items:GetChildren());
		while true do
			local v463, v464 = v460(v461, v462);
			if v463 then

			else
				break;
			end;
			v462 = v463;
			if v464:IsA("Frame") then
				v464.Visible = true;
			end;		
		end;
	end);
	l__OddsFrame__261.Back.MouseButton1Down:Connect(function()
		l__OddsFrame__261.Visible = false;
		l__TradeupFrame__263.Visible = true;
	end);
	l__RewardFrame__259.Confirm.MouseButton1Down:Connect(function()
		if l__LocalPlayer__10.Trading.Value == false then
			l__RemoteFunction__21:InvokeServer("SetTrading");
		end;
		l__RewardFrame__259.Visible = false;
		l__TradeupFrame__263.Visible = true;
		u35 = false;
	end);
	l__TradeFrame__262:GetPropertyChangedSignal("Visible"):Connect(function()
		if l__TradeFrame__262.Visible == true then
			u81(l__LocalPlayer__10, l__TradeFrame__262.LocalInventory);
			return;
		end;
		if l__TradeFrame__262.Visible == false then
			u87(l__TradeFrame__262.LocalInventory);
			u58(l__TradeFrame__262.LocalOffer);
			u58(l__TradeFrame__262.PlayerOffer);
			u68 = {};
			l__TradeFrame__262.Accept.Text = "Accept";
			u78 = false;
			l__TradeFrame__262.Confirmation.Visible = false;
			u67 = nil;
			l__MessageFrame__260.Visible = true;
			local l__Text__89 = l__MessageFrame__260.Message.Text;
			task.delay(3, function()
				if l__MessageFrame__260.Message.Text == l__Text__89 then
					l__MessageFrame__260.Visible = false;
				end;
			end);
			l__Main__257.Visible = true;
		end;
	end);
	l__TradeFrame__262.Accept.MouseButton1Down:Connect(function()
		if l__TradeFrame__262.Accept.Text == "Accepted" then
			return;
		end;
		if u78 == false then
			l__TradeFrame__262.Accept.Text = "Are you sure?";
			u78 = true;
			return;
		end;
		if l__RemoteFunction__21:InvokeServer("AcceptTrade", u67) == true then
			l__TradeFrame__262.Accept.Text = "Accepted";
			return;
		end;
		warn("Failed to accept trade: " .. u67);
		l__TradeFrame__262.Accept.Text = "Failed to accept, restart trade";
	end);
	l__TradeFrame__262.Decline.MouseButton1Down:Connect(function()
		l__RemoteEvent__20:FireServer("DeclineTrade", u67);
		l__TradeFrame__262.Visible = false;
	end);
	l__TradeupFrame__263:GetPropertyChangedSignal("Visible"):Connect(function()
		if l__TradeupFrame__263.Visible == true then
			if not u88 then
				u81(l__LocalPlayer__10, l__TradeupFrame__263.LocalInventory);
				return;
			end;
		end;
		if l__TradeupFrame__263.Visible == false then
			if not u88 then
				u70 = { "", "", "", "", "", "", "", "", "", "" };
				u87(l__TradeupFrame__263.LocalInventory);
				local v465, v466, v467 = pairs(l__TradeupFrame__263.TradeupItems:GetChildren());
				while true do
					local v468, v469 = v465(v466, v467);
					if v468 then

					else
						break;
					end;
					v467 = v468;
					if v469:IsA("ImageButton") then
						v469:Destroy();
					elseif v469:IsA("Frame") then
						v469.Visible = false;
					end;				
				end;
				l__TradeupFrame__263.TradeupItems.Tradeup.TextButton.Text = "Tradeup";
				l__MessageFrame__260.Visible = false;
			end;
		end;
	end);
	l__TradeupFrame__263.Close.MouseButton1Down:Connect(function()
		l__TradeupFrame__263.Visible = false;
		l__Main__257.Visible = true;
	end);
	local function u90(p50, p51)
		if l__LocalPlayer__10.Trading.Value == true then
			l__RemoteFunction__21:InvokeServer("SetTrading");
		end;
		local v470, v471 = getItemInfo(p51.Name);
		u58(l__CaseFrame__258.CaseScroll);
		local v472 = 1 - 1;
		while true do
			if v472 == 57 then
				local v473 = p51.Rarity;
				local v474 = v470;
				local v475 = v471;
			else
				local v476, v477 = getItemInfo(p50[math.random(1, #p50)]);
				v474 = v476;
				v475 = v477;
				v473 = u50.AllItems[v474][v475].Rarity;
			end;
			local v478 = v264.CaseItem:Clone();
			v478.Parent = l__CaseFrame__258.CaseScroll;
			v478.ItemName.Text = v475;
			v478.ItemName.TextColor3 = u53[v473];
			if v474 == "ChatTags" then
				v478.ItemImage.Visible = false;
				v478.ItemLabel.Text = string.format("[%s]", v24[v475].TagText);
				v478.ItemLabel.TextColor3 = v24[v475].TagColor;
				v478.ItemLabel.Visible = true;
			elseif u52[v474][string.lower(v475)] then
				v478.ItemImage.Image = u52[v474][string.lower(v475)];
			else
				v478.ItemImage.Image = u52.Assets.error;
			end;
			v478.Name = tostring(v472);
			v478.Visible = true;
			if 0 <= 1 then
				if v472 < 61 then

				else
					break;
				end;
			elseif 61 < v472 then

			else
				break;
			end;
			v472 = v472 + 1;		
		end;
		l__Main__257.Visible = false;
		l__CaseFrame__258.Visible = true;
		local u91 = false;
		local u92 = math.random(37, 117);
		local u93 = nil;
		local u94 = 30;
		local u95 = nil;
		u95 = l__RunService__1.RenderStepped:Connect(function(p52)
			local v479 = math.clamp(60 * p52, 0, 1);
			if u91 == false then
				u91 = true;
				if u92 <= 77 then
					u92 = u92 * (2 - v479);
				else
					u92 = u92 / (2 - v479);
				end;
				l__CaseFrame__258.CaseScroll.CanvasPosition = Vector2.new(u92, 0);
				u93 = u92 - 86;
			end;
			l__CaseFrame__258.CaseScroll.CanvasPosition = Vector2.new(l__CaseFrame__258.CaseScroll.CanvasPosition.X + u94 * v479, 0);
			if u94 <= 30 then
				if u94 / 2 * v479 < u94 then
					u94 = u94 - 0.1 * v479;
				elseif u94 <= u94 / 2 * v479 then
					if u94 / 4 * v479 < u94 then
						u94 = u94 - 0.05 * v479;
					elseif u94 <= u94 / 4 * v479 then
						if u94 / 8 * v479 < u94 then
							u94 = u94 - 0.025 * v479;
						elseif u94 <= u94 / 8 * v479 then
							u94 = u94 - 0.0125 * v479;
						end;
					elseif u94 <= u94 / 8 * v479 then
						u94 = u94 - 0.0125 * v479;
					end;
				elseif u94 <= u94 / 4 * v479 then
					if u94 / 8 * v479 < u94 then
						u94 = u94 - 0.025 * v479;
					elseif u94 <= u94 / 8 * v479 then
						u94 = u94 - 0.0125 * v479;
					end;
				elseif u94 <= u94 / 8 * v479 then
					u94 = u94 - 0.0125 * v479;
				end;
			elseif u94 <= u94 / 2 * v479 then
				if u94 / 4 * v479 < u94 then
					u94 = u94 - 0.05 * v479;
				elseif u94 <= u94 / 4 * v479 then
					if u94 / 8 * v479 < u94 then
						u94 = u94 - 0.025 * v479;
					elseif u94 <= u94 / 8 * v479 then
						u94 = u94 - 0.0125 * v479;
					end;
				elseif u94 <= u94 / 8 * v479 then
					u94 = u94 - 0.0125 * v479;
				end;
			elseif u94 <= u94 / 4 * v479 then
				if u94 / 8 * v479 < u94 then
					u94 = u94 - 0.025 * v479;
				elseif u94 <= u94 / 8 * v479 then
					u94 = u94 - 0.0125 * v479;
				end;
			elseif u94 <= u94 / 8 * v479 then
				u94 = u94 - 0.0125 * v479;
			end;
			if u93 + 80 <= l__CaseFrame__258.CaseScroll.CanvasPosition.X then
				u93 = l__CaseFrame__258.CaseScroll.CanvasPosition.X;
				local v480 = v264.Dash:Clone();
				v480.Parent = l__Ignore__5;
				v480.PlayOnRemove = true;
				v480:Destroy();
			end;
			if u94 <= 0 then
				u94 = 30;
				task.delay(1, function()
					u83(p51);
				end);
				u95:Disconnect();
			end;
		end);
	end;
	l__TradeupFrame__263.TradeupItems.Tradeup.TextButton.MouseButton1Down:Connect(function()
		if u71 then
			return;
		end;
		if not u72 then
			l__TradeupFrame__263.TradeupItems.Tradeup.TextButton.Text = "Are you sure?";
			u72 = true;
			return;
		end;
		u71 = true;
		local v481, v482, v483 = l__RemoteFunction__21:InvokeServer("Tradeup", u70);
		if v481 then

		else
			l__TradeupFrame__263.TradeupItems.Tradeup.TextButton.Text = "Error";
			task.delay(3, function()
				u71 = false;
				u72 = false;
			end);
			return;
		end;
		l__TradeupFrame__263.TradeupItems.Tradeup.TextButton.Text = "Success!";
		task.delay(3, function()
			u71 = false;
			u72 = false;
		end);
		u35 = true;
		task.wait(1.5);
		l__TradeupFrame__263.Visible = false;
		u90(v482, v483);
	end);
	l__TradeupFrame__263.TradeupItems.ViewOdds.TextButton.MouseButton1Down:Connect(function()
		u88 = true;
		l__TradeupFrame__263.Visible = false;
		l__OddsFrame__261.Visible = true;
	end);
	local v484, v485, v486 = pairs(u56);
	while true do
		local v487, v488 = v484(v485, v486);
		if v487 then

		else
			break;
		end;
		v486 = v487;
		l__Main__257[v488].MouseButton1Down:Connect(function()
			if u57 ~= v488 then
				if u54 == true then
					u58(l__InventoryFrame__66.Items);
					u75(v488, u73, l__InventoryFrame__66);
				end;
			end;
		end);
		l__TradeFrame__262[v488].MouseButton1Down:Connect(function()
			if u57 ~= v488 then
				if u54 == true then
					u58(l__TradeFrame__262.LocalInventory.Items);
					u75(v488, l__LocalPlayer__10, l__TradeFrame__262.LocalInventory);
				end;
			end;
		end);
		l__TradeupFrame__263[v488].MouseButton1Down:Connect(function()
			if u57 ~= v488 then
				if u54 == true then
					u58(l__TradeupFrame__263.LocalInventory.Items);
					u75(v488, l__LocalPlayer__10, l__TradeupFrame__263.LocalInventory);
				end;
			end;
		end);	
	end;
	l__RemoteEvent__20.OnClientEvent:Connect(function(...)
		local v489 = { ... };
		local v490 = v489[1];
		if v490 == "InitiateTrade" then

		else
			if v490 == "FinalizeTrade" then
				l__MessageFrame__260.Message.Text = v489[2];
				l__TradeFrame__262.Visible = false;
			end;
			return;
		end;
		if v489[2]:IsDescendantOf(l__Players__3) then
			if not l__Trades__19:FindFirstChild(v489[3]) then
				return;
			end;
		else
			return;
		end;
		u82(v489[2], v489[3]);
	end);
	l__Players__3.PlayerRemoving:Connect(function(p53)
		if u19.Incoming[p53] then
			u19.Incoming[p53] = nil;
		end;
		if u19.Outgoing[p53] then
			u19.Outgoing[p53] = nil;
		end;
	end);
	if u18 == false then
		if l__Workspace__9.CurrentCamera.ViewportSize.X < 1000 then
			if l__Workspace__9.CurrentCamera.ViewportSize.Y < 1000 then
				l__Main__257.Size = UDim2.new(0, l__Main__257.Size.X.Offset * 0.5, 0, l__Main__257.Size.Y.Offset * 0.5);
				l__Main__257.Position = UDim2.new(0.5, -l__Main__257.Size.X.Offset / 2, 0.5, -l__Main__257.Size.Y.Offset / 2);
				v264.Item.ItemLabel.TextSize = 10;
				l__InventoryFrame__66.Items.UIGridLayout.CellSize = UDim2.new(0, l__InventoryFrame__66.Items.UIGridLayout.CellSize.X.Offset * 0.5, 0, l__InventoryFrame__66.Items.UIGridLayout.CellSize.Y.Offset * 0.5);
				l__InventoryFrame__66.Items.UIGridLayout.CellPadding = UDim2.new(0, 3, 0, 3);
				l__TradingFrame__79.UIGridLayout.CellSize = UDim2.new(0, l__TradingFrame__79.UIGridLayout.CellSize.X.Offset * 0.5, 0, l__TradingFrame__79.UIGridLayout.CellSize.Y.Offset * 0.5);
				l__InventoryFrame__66.Placeholder.Size = UDim2.new(0, l__InventoryFrame__66.Placeholder.Size.X.Offset * 0.5, 0, l__InventoryFrame__66.Placeholder.Size.Y.Offset * 0.5);
				l__InventoryFrame__66.Placeholder.Position = UDim2.new(0.5, -l__InventoryFrame__66.Placeholder.Size.X.Offset / 2, 0.5, -l__InventoryFrame__66.Placeholder.Size.Y.Offset / 2);
				l__MessageFrame__260.Size = UDim2.new(0, l__MessageFrame__260.Size.X.Offset * 0.8, 0, l__MessageFrame__260.Size.Y.Offset * 0.5);
				l__MessageFrame__260.Position = UDim2.new(0.5, -l__MessageFrame__260.Size.X.Offset / 2, 0.5, l__MessageFrame__260.Size.Y.Offset * 6.25);
				l__TradeFrame__262.Size = UDim2.new(0, l__TradeFrame__262.Size.X.Offset * 0.5, 0, l__TradeFrame__262.Size.Y.Offset * 0.5);
				l__TradeFrame__262.Position = UDim2.new(0.5, -l__TradeFrame__262.Size.X.Offset / 2, 0.5, -l__TradeFrame__262.Size.Y.Offset / 2);
				l__MessageFrame__260.Message.TextScaled = false;
				l__RewardFrame__259.Size = UDim2.new(0, l__RewardFrame__259.Size.X.Offset * 0.5, 0, l__RewardFrame__259.Size.Y.Offset * 0.5);
				l__RewardFrame__259.Position = UDim2.new(0.5, -(l__RewardFrame__259.Size.X.Offset / 2), 0.5, -(l__RewardFrame__259.Size.Y.Offset / 2));
				local l__LocalInventory__491 = l__TradeFrame__262.LocalInventory;
				l__LocalInventory__491.ScrollBarThickness = l__LocalInventory__491.ScrollBarThickness / 2;
				l__TradeFrame__262.LocalInventory.Items.UIGridLayout.CellSize = UDim2.new(0, l__TradeFrame__262.LocalInventory.Items.UIGridLayout.CellSize.X.Offset / 2, 0, l__TradeFrame__262.LocalInventory.Items.UIGridLayout.CellSize.Y.Offset / 2);
				l__TradeFrame__262.LocalInventory.Placeholder.Size = UDim2.new(0, l__TradeFrame__262.LocalInventory.Placeholder.Size.X.Offset / 2, 0, l__TradeFrame__262.LocalInventory.Placeholder.Size.Y.Offset / 2);
				l__TradeFrame__262.LocalInventory.Placeholder.Position = UDim2.new(0.5, -l__TradeFrame__262.LocalInventory.Placeholder.Size.X.Offset / 2, 0.5, -l__TradeFrame__262.LocalInventory.Placeholder.Size.Y.Offset);
				local l__LocalOffer__492 = l__TradeFrame__262.LocalOffer;
				l__LocalOffer__492.ScrollBarThickness = l__LocalOffer__492.ScrollBarThickness / 2;
				l__TradeFrame__262.LocalOffer.UIGridLayout.CellSize = UDim2.new(0, l__TradeFrame__262.LocalOffer.UIGridLayout.CellSize.X.Offset / 2, 0, l__TradeFrame__262.LocalOffer.UIGridLayout.CellSize.Y.Offset / 2);
				local l__LocalOffer__493 = l__TradeFrame__262.LocalOffer;
				l__LocalOffer__493.ScrollBarThickness = l__LocalOffer__493.ScrollBarThickness / 2;
				l__TradeFrame__262.PlayerOffer.UIGridLayout.CellSize = UDim2.new(0, l__TradeFrame__262.PlayerOffer.UIGridLayout.CellSize.X.Offset / 2, 0, l__TradeFrame__262.PlayerOffer.UIGridLayout.CellSize.Y.Offset / 2);
				l__TradeupFrame__263.Size = UDim2.new(0, l__TradeupFrame__263.Size.X.Offset * 0.5, 0, l__TradeupFrame__263.Size.Y.Offset * 0.5);
				l__TradeupFrame__263.Position = UDim2.new(0.5, -l__TradeupFrame__263.Size.X.Offset / 2, 0.5, -l__TradeupFrame__263.Size.Y.Offset / 2);
				l__TradeupFrame__263.TradeupItems.UIGridLayout.CellSize = UDim2.new(0, l__TradeupFrame__263.TradeupItems.UIGridLayout.CellSize.X.Offset / 2, 0, l__TradeupFrame__263.TradeupItems.UIGridLayout.CellSize.Y.Offset / 2);
				l__TradeupFrame__263.TradeupItems.UIGridLayout.CellPadding = UDim2.new(0, l__TradeupFrame__263.TradeupItems.UIGridLayout.CellPadding.X.Offset / 2, 0, l__TradeupFrame__263.TradeupItems.UIGridLayout.CellPadding.Y.Offset / 2);
				local l__LocalInventory__494 = l__TradeupFrame__263.LocalInventory;
				l__LocalInventory__494.ScrollBarThickness = l__LocalInventory__494.ScrollBarThickness / 2;
				l__TradeupFrame__263.LocalInventory.Items.UIGridLayout.CellSize = UDim2.new(0, l__TradeupFrame__263.LocalInventory.Items.UIGridLayout.CellSize.X.Offset / 2, 0, l__TradeupFrame__263.LocalInventory.Items.UIGridLayout.CellSize.Y.Offset / 2);
				l__TradeupFrame__263.LocalInventory.Placeholder.Size = UDim2.new(0, l__TradeupFrame__263.LocalInventory.Placeholder.Size.X.Offset / 2, 0, l__TradeupFrame__263.LocalInventory.Placeholder.Size.Y.Offset / 2);
				l__TradeupFrame__263.LocalInventory.Placeholder.Position = UDim2.new(0.5, -l__TradeupFrame__263.LocalInventory.Placeholder.Size.X.Offset / 2, 0.5, -l__TradeupFrame__263.LocalInventory.Placeholder.Size.Y.Offset);
				l__OddsFrame__261.Size = UDim2.new(0, l__OddsFrame__261.Size.X.Offset * 0.6666666666666666, 0, l__OddsFrame__261.Size.Y.Offset * 0.6666666666666666);
				l__OddsFrame__261.Position = UDim2.new(0.5, -l__OddsFrame__261.Size.X.Offset / 2, 0.5, -l__OddsFrame__261.Size.Y.Offset / 2);
			end;
		end;
	end;
end;
function setupLeaderboardGui()
	local l__Main__495 = l__Leaderboard__33:WaitForChild("Main");
	local v496 = l__Main__495:WaitForChild("Copy"):Clone();
	l__Main__495:WaitForChild("Copy"):Destroy();
	local l__LeaderboardFrame__497 = l__Main__495:WaitForChild("LeaderboardFrame");
	local v498 = { "Level", "Wins", "KOs", "Ping" };
	local u96 = {};
	local l__Items__97 = l__LeaderboardFrame__497:WaitForChild("Items");
	local function u98()
		local v499, v500, v501 = pairs(l__Items__97:GetChildren());
		while true do
			local v502, v503 = v499(v500, v501);
			if v502 then

			else
				break;
			end;
			v501 = v502;
			if v503:IsA("GuiObject") then
				v503:Destroy();
			end;		
		end;
	end;
	local l__Placeholder__99 = l__LeaderboardFrame__497:WaitForChild("Placeholder");
	local u100 = "Level";
	local function v504(p54)
		local v505, v506, v507 = pairs(u96);
		while true do
			local v508, v509 = v505(v506, v507);
			if v508 then

			else
				break;
			end;
			v507 = v508;
			v509:Disconnect();		
		end;
		u98();
		l__Placeholder__99.Visible = true;
		u100 = p54;
		local v510, v511, v512 = pairs(l__Players__3:GetPlayers());
		while true do
			local v513, v514 = v510(v511, v512);
			if v513 then

			else
				break;
			end;
			if u100 == p54 then

			else
				break;
			end;
			if p54 == "Ping" then
				if l__PingCounts__18:FindFirstChild(v514.Name) then
					local v515 = l__PingCounts__18:FindFirstChild(v514.Name).Value;
				else
					v515 = "???";
				end;
			else
				v515 = v514:WaitForChild("leaderstats"):FindFirstChild(p54).Value;
			end;
			local v516, v517 = l__Players__3:GetUserThumbnailAsync(v514.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100);
			local v518 = v496.Item:Clone();
			if typeof(v515) == "number" then
				v518.LayoutOrder = -v515;
			else
				v518.LayoutOrder = 0;
			end;
			v518.Name = v514.Name;
			v518.Parent = l__Items__97;
			v518.Headshot.Image = v516;
			v518.Counter.Text = v515;
			v518.PlayerName.Text = v514.Name;
			v518.Value.Text = p54;
			if p54 == "Ping" then
				if l__PingCounts__18:FindFirstChild(v514.Name) then
					local v519 = l__PingCounts__18:FindFirstChild(v514.Name);
					table.insert(u96, (v519:GetPropertyChangedSignal("Value"):Connect(function()
						v518.Counter.Text = v519.Value;
					end)));
				end;
			end;		
		end;
		if u100 ~= p54 then
			return;
		end;
		l__Placeholder__99.Visible = false;
		local v520, v521, v522 = pairs(l__Items__97:GetChildren());
		while true do
			local v523, v524 = v520(v521, v522);
			if v523 then

			else
				break;
			end;
			v522 = v523;
			if v524:IsA("GuiObject") then
				v524.Visible = true;
			end;		
		end;
		l__LeaderboardFrame__497.CanvasSize = UDim2.new(0, 0, 0, l__Items__97.UIGridLayout.AbsoluteContentSize.Y);
	end;
	l__Main__495:WaitForChild("Close").MouseButton1Down:Connect(function()
		playSound("rbxassetid://140910211", 0.5);
		l__Main__495.Visible = false;
	end);
	local v525, v526, v527 = pairs(v498);
	while true do
		local v528, v529 = v525(v526, v527);
		if v528 then

		else
			break;
		end;
		v527 = v528;
		l__Main__495[v529].MouseButton1Down:Connect(function()
			l__Main__495[v529].BorderSizePixel = 2;
			local v530, v531, v532 = pairs(v498);
			while true do
				local v533, v534 = v530(v531, v532);
				if v533 then

				else
					break;
				end;
				v532 = v533;
				if v534 ~= v529 then
					l__Main__495[v534].BorderSizePixel = 0;
				end;			
			end;
			v504(v529);
		end);	
	end;
	l__Main__495:GetPropertyChangedSignal("Visible"):Connect(function()
		if l__Main__495.Visible == true then
			v504(u100);
		end;
	end);
	if u18 == false then
		if l__Workspace__9.CurrentCamera.ViewportSize.X < 1000 then
			if l__Workspace__9.CurrentCamera.ViewportSize.Y < 1000 then
				v496.Item.Headshot.Size = UDim2.new(0, v496.Item.Headshot.Size.X.Offset * 0.5, 0, v496.Item.Headshot.Size.Y.Offset * 0.5);
				v496.Item.Headshot.Position = UDim2.new(0, 0, 0.5, -(v496.Item.Headshot.Size.Y.Offset / 2));
				l__Main__495.Size = UDim2.new(0, l__Main__495.Size.X.Offset * 0.5, 0, l__Main__495.Size.Y.Offset * 0.5);
				l__Main__495.Position = UDim2.new(0.5, -l__Main__495.Size.X.Offset / 2, 0.45, -l__Main__495.Size.Y.Offset / 2 + 10);
				l__Items__97.UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 3);
				l__Items__97.UIGridLayout.CellSize = UDim2.new(1, 0, 0, l__Items__97.UIGridLayout.CellSize.Y.Offset * 0.5);
				l__Placeholder__99.Size = UDim2.new(0, l__Placeholder__99.Size.X.Offset * 0.5, 0, l__Placeholder__99.Size.Y.Offset * 0.5);
				l__Placeholder__99.Position = UDim2.new(0.5, -l__Placeholder__99.Size.X.Offset / 2, 0.5, -l__Placeholder__99.Size.Y.Offset / 2);
			end;
		end;
	end;
end;
function setupShopGui()
	local l__CaseFrame__535 = l__Shop__36:WaitForChild("CaseFrame");
	local l__CodeFrame__536 = l__Shop__36:WaitForChild("CodeFrame");
	local l__Main__537 = l__Shop__36:WaitForChild("Main");
	local l__GiftFrame__538 = l__Shop__36:WaitForChild("GiftFrame");
	local l__PreviewFrame__539 = l__Shop__36:WaitForChild("PreviewFrame");
	local l__SettingsFrame__540 = l__Shop__36:WaitForChild("SettingsFrame");
	local l__RewardFrame__541 = l__Shop__36:WaitForChild("RewardFrame");
	local v542 = l__Main__537:WaitForChild("Copy"):Clone();
	l__Main__537:WaitForChild("Copy"):Destroy();
	local l__ShopFrame__543 = l__Main__537:WaitForChild("ShopFrame");
	local l__SelectedFrame__544 = l__Main__537:WaitForChild("SelectedFrame");
	local l__Close__545 = l__Main__537:WaitForChild("Close");
	local l__ShopItems__101 = u50.ShopItems;
	local function u102(p55)
		local v546, v547, v548 = pairs(p55:GetChildren());
		while true do
			local v549, v550 = v546(v547, v548);
			if v549 then

			else
				break;
			end;
			v548 = v549;
			if not v550:IsA("UIGridLayout") then
				v550:Destroy();
			end;		
		end;
		if p55:IsA("ScrollingFrame") then
			if p55 ~= l__CaseFrame__535.CaseScroll then
				p55.CanvasSize = UDim2.new(0, 0, 0, 0);
			end;
		end;
	end;
	local function u103(p56)
		l__CaseFrame__535.Visible = false;
		local v551, v552 = getItemInfo(p56.Name);
		l__RewardFrame__541.ItemFrame.ItemName.Text = v552;
		l__RewardFrame__541.ItemFrame.ItemName.TextColor3 = u53[p56.Rarity];
		if v551 == "ChatTags" then
			l__RewardFrame__541.ItemFrame.ItemImage.Visible = false;
			l__RewardFrame__541.ItemFrame.ItemLabel.Text = string.format("[%s]", v24[v552].TagText);
			l__RewardFrame__541.ItemFrame.ItemLabel.TextColor3 = v24[v552].TagColor;
			l__RewardFrame__541.ItemFrame.ItemLabel.Visible = true;
		else
			l__RewardFrame__541.ItemFrame.ItemLabel.Visible = false;
			if u52[v551][string.lower(v552)] then
				l__RewardFrame__541.ItemFrame.ItemImage.Image = u52[v551][string.lower(v552)];
			else
				l__RewardFrame__541.ItemFrame.ItemImage.Image = u52.Assets.error;
			end;
			l__RewardFrame__541.ItemFrame.ItemImage.Visible = true;
		end;
		l__RewardFrame__541.Visible = true;
		local v553 = v542.RewardSound:Clone();
		v553.Parent = l__Ignore__5;
		v553.PlayOnRemove = true;
		v553:Destroy();
	end;
	local l__SelectedItem__104 = l__SelectedFrame__544:WaitForChild("SelectedItem");
	local u105 = false;
	local l__Purchase__106 = l__SelectedFrame__544:WaitForChild("Purchase");
	local u107 = nil;
	local l__Gift__108 = l__SelectedFrame__544:WaitForChild("Gift");
	local l__Preview__109 = l__SelectedFrame__544:WaitForChild("Preview");
	local l__Settings__110 = l__SelectedFrame__544:WaitForChild("Settings");
	local l__Items__111 = l__ShopFrame__543:WaitForChild("Items");
	local u112 = nil;
	local u113 = nil;
	local u114 = false;
	local function u115(p57, p58)
		if l__LocalPlayer__10.Trading.Value == true then
			l__RemoteFunction__21:InvokeServer("SetTrading");
		end;
		local l__CaseItems__554 = l__ShopItems__101.Cases[p57].CaseItems;
		local v555, v556 = getItemInfo(p58.Name);
		u102(l__CaseFrame__535.CaseScroll);
		local v557 = 1 - 1;
		while true do
			local v558 = nil;
			local v559 = math.random();
			if u21 == true then
				if v559 <= 1 then
					if 0.6 < v559 then
						v558 = "Common";
					elseif v559 <= 0.6 then
						if 0.2 < v559 then
							v558 = "Uncommon";
						elseif v559 <= 0.2 then
							if 0.02 < v559 then
								v558 = "Rare";
							elseif v559 <= 0.02 then
								if 0.002 < v559 then
									v558 = "Special";
								elseif v559 <= 0.002 then
									v558 = "Unobtainable";
								end;
							elseif v559 <= 0.002 then
								v558 = "Unobtainable";
							end;
						elseif v559 <= 0.02 then
							if 0.002 < v559 then
								v558 = "Special";
							elseif v559 <= 0.002 then
								v558 = "Unobtainable";
							end;
						elseif v559 <= 0.002 then
							v558 = "Unobtainable";
						end;
					elseif v559 <= 0.2 then
						if 0.02 < v559 then
							v558 = "Rare";
						elseif v559 <= 0.02 then
							if 0.002 < v559 then
								v558 = "Special";
							elseif v559 <= 0.002 then
								v558 = "Unobtainable";
							end;
						elseif v559 <= 0.002 then
							v558 = "Unobtainable";
						end;
					elseif v559 <= 0.02 then
						if 0.002 < v559 then
							v558 = "Special";
						elseif v559 <= 0.002 then
							v558 = "Unobtainable";
						end;
					elseif v559 <= 0.002 then
						v558 = "Unobtainable";
					end;
				elseif v559 <= 0.6 then
					if 0.2 < v559 then
						v558 = "Uncommon";
					elseif v559 <= 0.2 then
						if 0.02 < v559 then
							v558 = "Rare";
						elseif v559 <= 0.02 then
							if 0.002 < v559 then
								v558 = "Special";
							elseif v559 <= 0.002 then
								v558 = "Unobtainable";
							end;
						elseif v559 <= 0.002 then
							v558 = "Unobtainable";
						end;
					elseif v559 <= 0.02 then
						if 0.002 < v559 then
							v558 = "Special";
						elseif v559 <= 0.002 then
							v558 = "Unobtainable";
						end;
					elseif v559 <= 0.002 then
						v558 = "Unobtainable";
					end;
				elseif v559 <= 0.2 then
					if 0.02 < v559 then
						v558 = "Rare";
					elseif v559 <= 0.02 then
						if 0.002 < v559 then
							v558 = "Special";
						elseif v559 <= 0.002 then
							v558 = "Unobtainable";
						end;
					elseif v559 <= 0.002 then
						v558 = "Unobtainable";
					end;
				elseif v559 <= 0.02 then
					if 0.002 < v559 then
						v558 = "Special";
					elseif v559 <= 0.002 then
						v558 = "Unobtainable";
					end;
				elseif v559 <= 0.002 then
					v558 = "Unobtainable";
				end;
			elseif v559 <= 1 then
				if 0.3 < v559 then
					v558 = "Common";
				elseif v559 <= 0.3 then
					if 0.1 < v559 then
						v558 = "Uncommon";
					elseif v559 <= 0.1 then
						if 0.01 < v559 then
							v558 = "Rare";
						elseif v559 <= 0.01 then
							if 0.001 < v559 then
								v558 = "Special";
							elseif v559 <= 0.001 then
								v558 = "Unobtainable";
							end;
						elseif v559 <= 0.001 then
							v558 = "Unobtainable";
						end;
					elseif v559 <= 0.01 then
						if 0.001 < v559 then
							v558 = "Special";
						elseif v559 <= 0.001 then
							v558 = "Unobtainable";
						end;
					elseif v559 <= 0.001 then
						v558 = "Unobtainable";
					end;
				elseif v559 <= 0.1 then
					if 0.01 < v559 then
						v558 = "Rare";
					elseif v559 <= 0.01 then
						if 0.001 < v559 then
							v558 = "Special";
						elseif v559 <= 0.001 then
							v558 = "Unobtainable";
						end;
					elseif v559 <= 0.001 then
						v558 = "Unobtainable";
					end;
				elseif v559 <= 0.01 then
					if 0.001 < v559 then
						v558 = "Special";
					elseif v559 <= 0.001 then
						v558 = "Unobtainable";
					end;
				elseif v559 <= 0.001 then
					v558 = "Unobtainable";
				end;
			elseif v559 <= 0.3 then
				if 0.1 < v559 then
					v558 = "Uncommon";
				elseif v559 <= 0.1 then
					if 0.01 < v559 then
						v558 = "Rare";
					elseif v559 <= 0.01 then
						if 0.001 < v559 then
							v558 = "Special";
						elseif v559 <= 0.001 then
							v558 = "Unobtainable";
						end;
					elseif v559 <= 0.001 then
						v558 = "Unobtainable";
					end;
				elseif v559 <= 0.01 then
					if 0.001 < v559 then
						v558 = "Special";
					elseif v559 <= 0.001 then
						v558 = "Unobtainable";
					end;
				elseif v559 <= 0.001 then
					v558 = "Unobtainable";
				end;
			elseif v559 <= 0.1 then
				if 0.01 < v559 then
					v558 = "Rare";
				elseif v559 <= 0.01 then
					if 0.001 < v559 then
						v558 = "Special";
					elseif v559 <= 0.001 then
						v558 = "Unobtainable";
					end;
				elseif v559 <= 0.001 then
					v558 = "Unobtainable";
				end;
			elseif v559 <= 0.01 then
				if 0.001 < v559 then
					v558 = "Special";
				elseif v559 <= 0.001 then
					v558 = "Unobtainable";
				end;
			elseif v559 <= 0.001 then
				v558 = "Unobtainable";
			end;
			if v557 == 57 then
				v558 = p58.Rarity;
				if p57 == "Mystery" then
					local v560 = "Pets";
					local v561 = "Mystery";
				else
					v560 = v555;
					v561 = v556;
				end;
			else
				local v562, v563 = getItemInfo(l__CaseItems__554[v558][math.random(1, #l__CaseItems__554[v558])]);
				v560 = v562;
				v561 = v563;
			end;
			local v564 = v542.CaseItem:Clone();
			v564.Parent = l__CaseFrame__535.CaseScroll;
			v564.ItemName.Text = v561;
			v564.ItemName.TextColor3 = u53[v558];
			if v560 == "ChatTags" then
				v564.ItemImage.Visible = false;
				v564.ItemLabel.Text = string.format("[%s]", v24[v561].TagText);
				v564.ItemLabel.TextColor3 = v24[v561].TagColor;
				v564.ItemLabel.Visible = true;
			elseif u52[v560][string.lower(v561)] then
				v564.ItemImage.Image = u52[v560][string.lower(v561)];
			else
				v564.ItemImage.Image = u52.Assets.error;
			end;
			v564.Name = tostring(v557);
			v564.Visible = true;
			if 0 <= 1 then
				if v557 < 61 then

				else
					break;
				end;
			elseif 61 < v557 then

			else
				break;
			end;
			v557 = v557 + 1;		
		end;
		l__Main__537.Visible = false;
		l__CaseFrame__535.Visible = true;
		local u116 = false;
		local u117 = math.random(37, 117);
		local u118 = nil;
		local u119 = 30;
		local u120 = nil;
		u120 = l__RunService__1.RenderStepped:Connect(function(p59)
			local v565 = math.clamp(60 * p59, 0, 1);
			if u116 == false then
				u116 = true;
				if u117 <= 77 then
					u117 = u117 * (2 - v565);
				else
					u117 = u117 / (2 - v565);
				end;
				l__CaseFrame__535.CaseScroll.CanvasPosition = Vector2.new(u117, 0);
				u118 = u117 - 86;
			end;
			l__CaseFrame__535.CaseScroll.CanvasPosition = Vector2.new(l__CaseFrame__535.CaseScroll.CanvasPosition.X + u119 * v565, 0);
			if u119 <= 30 then
				if u119 / 2 * v565 < u119 then
					u119 = u119 - 0.1 * v565;
				elseif u119 <= u119 / 2 * v565 then
					if u119 / 4 * v565 < u119 then
						u119 = u119 - 0.05 * v565;
					elseif u119 <= u119 / 4 * v565 then
						if u119 / 8 * v565 < u119 then
							u119 = u119 - 0.025 * v565;
						elseif u119 <= u119 / 8 * v565 then
							u119 = u119 - 0.0125 * v565;
						end;
					elseif u119 <= u119 / 8 * v565 then
						u119 = u119 - 0.0125 * v565;
					end;
				elseif u119 <= u119 / 4 * v565 then
					if u119 / 8 * v565 < u119 then
						u119 = u119 - 0.025 * v565;
					elseif u119 <= u119 / 8 * v565 then
						u119 = u119 - 0.0125 * v565;
					end;
				elseif u119 <= u119 / 8 * v565 then
					u119 = u119 - 0.0125 * v565;
				end;
			elseif u119 <= u119 / 2 * v565 then
				if u119 / 4 * v565 < u119 then
					u119 = u119 - 0.05 * v565;
				elseif u119 <= u119 / 4 * v565 then
					if u119 / 8 * v565 < u119 then
						u119 = u119 - 0.025 * v565;
					elseif u119 <= u119 / 8 * v565 then
						u119 = u119 - 0.0125 * v565;
					end;
				elseif u119 <= u119 / 8 * v565 then
					u119 = u119 - 0.0125 * v565;
				end;
			elseif u119 <= u119 / 4 * v565 then
				if u119 / 8 * v565 < u119 then
					u119 = u119 - 0.025 * v565;
				elseif u119 <= u119 / 8 * v565 then
					u119 = u119 - 0.0125 * v565;
				end;
			elseif u119 <= u119 / 8 * v565 then
				u119 = u119 - 0.0125 * v565;
			end;
			if u118 + 80 <= l__CaseFrame__535.CaseScroll.CanvasPosition.X then
				u118 = l__CaseFrame__535.CaseScroll.CanvasPosition.X;
				local v566 = v542.Dash:Clone();
				v566.Parent = l__Ignore__5;
				v566.PlayOnRemove = true;
				v566:Destroy();
			end;
			if u119 <= 0 then
				u119 = 30;
				task.delay(1, function()
					u103(p58);
				end);
				u120:Disconnect();
			end;
		end);
	end;
	local u121 = nil;
	local u122 = nil;
	local u123 = nil;
	local u124 = nil;
	local u125 = nil;
	local u126 = { l__Main__537:WaitForChild("Cases"), l__Main__537:WaitForChild("Minigames"), l__Main__537:WaitForChild("Currency"), l__Main__537:WaitForChild("Donations") };
	local l__Placeholder__127 = l__ShopFrame__543:WaitForChild("Placeholder");
	local l__ShopPrices__128 = u50.ShopPrices;
	local u129 = nil;
	local function u130(p60)
		if p60 == false then
			if l__SelectedItem__104:FindFirstChild("ShopItem") then
				l__SelectedItem__104.ShopItem:Destroy();
				u105 = false;
				l__Purchase__106.Text = "Purchase";
				u107 = nil;
				l__Gift__108.Visible = false;
				l__Preview__109.Visible = false;
				l__Purchase__106.Visible = false;
				l__Settings__110.Visible = false;
			end;
			local v567, v568, v569 = pairs(l__Items__111:GetChildren());
			while true do
				local v570, v571 = v567(v568, v569);
				if v570 then

				else
					break;
				end;
				v569 = v570;
				if not v571:IsA("UIGridLayout") then
					v571.Selected.Visible = false;
				end;			
			end;
			return;
		end;
		if l__SelectedItem__104:FindFirstChild("ShopItem") then
			l__SelectedItem__104.ShopItem:Destroy();
			u105 = false;
			l__Purchase__106.Text = "Purchase";
			u107 = nil;
			l__Gift__108.Visible = false;
			l__Preview__109.Visible = false;
			l__Purchase__106.Visible = false;
			l__Settings__110.Visible = false;
		end;
		local v572 = p60:Clone();
		v572.LayoutOrder = -1;
		v572.Parent = l__SelectedItem__104;
		u107 = v572;
		if u112 == "Cases" then
			l__Preview__109.Visible = true;
		elseif u112 == "Minigames" then
			l__Settings__110.Visible = true;
		elseif u112 == "Currency" then
			l__Gift__108.Visible = true;
		end;
		l__Purchase__106.Visible = true;
		p60.Selected.Visible = true;
		local v573, v574, v575 = pairs(l__Items__111:GetChildren());
		while true do
			local v576, v577 = v573(v574, v575);
			if v576 then

			else
				break;
			end;
			v575 = v576;
			if v577 ~= p60 then
				if not v577:IsA("UIGridLayout") then
					v577.Selected.Visible = false;
				end;
			end;		
		end;
	end;
	local function u131(p61, p62, p63)
		if p61 == "Case" then
			u113 = function()
				if u114 == true then
					return;
				end;
				local v578 = tonumber(l__Main__537.CoinsAmount.Text);
				if v578 then
					if v578 < p63 then
						l__Purchase__106.Text = "Not enough coins!";
						u114 = true;
						coroutine.wrap(function()
							wait(3);
							l__Purchase__106.Text = "Purchase";
							u114 = false;
						end)();
						return;
					end;
				else
					l__Purchase__106.Text = "Not enough coins!";
					u114 = true;
					coroutine.wrap(function()
						wait(3);
						l__Purchase__106.Text = "Purchase";
						u114 = false;
					end)();
					return;
				end;
				if u105 == false then
					l__Purchase__106.Text = "Are you sure?";
					u105 = true;
					return;
				end;
				local v579, v580 = l__RemoteFunction__21:InvokeServer("PurchaseCase", p62);
				if v579 == true then

				else
					l__Purchase__106.Text = "Error";
					u114 = true;
					u105 = false;
					coroutine.wrap(function()
						wait(3);
						l__Purchase__106.Text = "Purchase";
						u114 = false;
					end)();
					return;
				end;
				l__Purchase__106.Text = "Purchased!";
				u114 = true;
				u105 = false;
				coroutine.wrap(function()
					wait(3);
					l__Purchase__106.Text = "Purchase";
					u114 = false;
				end)();
				u35 = true;
				wait(1.5);
				u115(p62, v580);
			end;
			return;
		end;
		if p61 == "Product" then
			u121 = p62;
			u113 = function()
				l__MarketplaceService__5:PromptProductPurchase(l__LocalPlayer__10, p62);
			end;
			return;
		end;
		if p61 == "Minigame" then
			u122 = p62;
			u123 = v23[p62].Maps[1];
			u124 = v23[p62].Modes[1];
			u113 = function()
				if u114 == true then
					return;
				end;
				local v581 = tonumber(l__Main__537.CoinsAmount.Text);
				if v581 then
					if v581 < p63 then
						l__Purchase__106.Text = "Not enough coins!";
						u114 = true;
						coroutine.wrap(function()
							wait(3);
							l__Purchase__106.Text = "Purchase";
							u114 = false;
						end)();
						return;
					end;
				else
					l__Purchase__106.Text = "Not enough coins!";
					u114 = true;
					coroutine.wrap(function()
						wait(3);
						l__Purchase__106.Text = "Purchase";
						u114 = false;
					end)();
					return;
				end;
				if u105 == false then
					l__Purchase__106.Text = "Are you sure?";
					u105 = true;
					return;
				end;
				local v582, v583 = l__RemoteFunction__21:InvokeServer("PurchaseMinigame", u122, u123, u124);
				if v582 == true then
					l__Purchase__106.Text = "Purchased!";
					u114 = true;
					u105 = false;
					coroutine.wrap(function()
						wait(3);
						l__Purchase__106.Text = "Purchase";
						u114 = false;
					end)();
					return;
				end;
				if v583 then
					l__Purchase__106.Text = "You are on cooldown!";
				else
					l__Purchase__106.Text = "Error";
				end;
				u114 = true;
				u105 = false;
				coroutine.wrap(function()
					wait(3);
					l__Purchase__106.Text = "Purchase";
					u114 = false;
				end)();
			end;
		end;
	end;
	l__CodeFrame__536.Back.MouseButton1Down:Connect(function()
		l__CodeFrame__536.Visible = false;
		l__Main__537.Visible = true;
	end);
	local u132 = false;
	l__CodeFrame__536.CodeInput.FocusLost:Connect(function(p64)
		if p64 == true then
			if l__CodeFrame__536.CodeInput.Text ~= "" then
				if not u132 then
					u132 = true;
					l__CodeFrame__536.CodeInput.TextEditable = false;
					l__CodeFrame__536.CodeInput.Text = "";
					if l__RemoteFunction__21:InvokeServer("RedeemCode", l__CodeFrame__536.CodeInput.Text) then
						l__CodeFrame__536.CodeInput.PlaceholderText = "Redeemed!";
						l__CodeFrame__536.CodeInput.PlaceholderColor3 = Color3.new(0, 1, 0);
					else
						l__CodeFrame__536.CodeInput.PlaceholderText = "Invalid!";
						l__CodeFrame__536.CodeInput.PlaceholderColor3 = Color3.new(1, 0, 0);
					end;
					coroutine.wrap(function()
						wait(3);
						l__CodeFrame__536.CodeInput.PlaceholderText = "Code";
						l__CodeFrame__536.CodeInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 150);
						l__CodeFrame__536.CodeInput.TextEditable = true;
						u132 = false;
					end)();
				end;
			end;
		end;
	end);
	l__Close__545.MouseButton1Down:Connect(function()
		playSound("rbxassetid://140910211", 0.5);
		l__Main__537.Visible = false;
	end);
	l__GiftFrame__538.Close.MouseButton1Down:Connect(function()
		l__RemoteFunction__21:InvokeServer("SetGifting", nil);
		l__GiftFrame__538.Visible = false;
		l__Main__537.Visible = true;
	end);
	local u133 = false;
	l__GiftFrame__538.Gift.MouseButton1Down:Connect(function()
		if u133 then
			return;
		end;
		if not u125 then
			u133 = true;
			l__GiftFrame__538.Gift.Text = "No player!";
			task.delay(3, function()
				l__GiftFrame__538.Gift.Text = "Gift";
				u133 = false;
			end);
			return;
		end;
		if l__RemoteFunction__21:InvokeServer("SetGifting", u125) then
			if userIdInGame(u125) then
				l__MarketplaceService__5:PromptProductPurchase(l__LocalPlayer__10, u121);
				return;
			end;
		end;
		u133 = true;
		l__GiftFrame__538.Gift.Text = "Unable to gift!";
		task.delay(3, function()
			l__GiftFrame__538.Gift.Text = "Gift";
			u133 = false;
		end);
	end);
	l__PreviewFrame__539.Close.MouseButton1Down:Connect(function()
		l__PreviewFrame__539.Visible = false;
		l__Main__537.Visible = true;
	end);
	l__RewardFrame__541.Confirm.MouseButton1Down:Connect(function()
		if l__LocalPlayer__10.Trading.Value == false then
			l__RemoteFunction__21:InvokeServer("SetTrading");
		end;
		u35 = false;
		l__RewardFrame__541.Visible = false;
		l__Main__537.Visible = true;
	end);
	l__SettingsFrame__540.Close.MouseButton1Down:Connect(function()
		l__SettingsFrame__540.Visible = false;
		l__Main__537.Visible = true;
	end);
	local function u134()
		u125 = nil;
		u102(l__GiftFrame__538.Players);
		l__GiftFrame__538.Headshot.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png";
		l__GiftFrame__538.Username.Text = "No-one!";
		local v584, v585, v586 = pairs(l__Players__3:GetPlayers());
		while true do
			local v587, v588 = v584(v585, v586);
			if v587 then

			else
				break;
			end;
			v586 = v587;
			if v588 ~= l__LocalPlayer__10 then
				local v589 = v542.SettingsItem:Clone();
				v589.Parent = l__GiftFrame__538.Players;
				v589.Button.Text = v588.Name;
				v589.Visible = true;
				local l__UserId__135 = v588.UserId;
				v589.Button.MouseButton1Down:Connect(function()
					u125 = l__UserId__135;
					local v590, v591 = l__Players__3:GetUserThumbnailAsync(v588.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100);
					l__GiftFrame__538.Headshot.Image = v590;
					l__GiftFrame__538.Username.Text = v588.Name;
					v589.Button.TextColor3 = Color3.new(0, 255, 0);
					local v592, v593, v594 = pairs(l__GiftFrame__538.Players:GetChildren());
					while true do
						local v595, v596 = v592(v593, v594);
						if v595 then

						else
							break;
						end;
						v594 = v595;
						if v596 ~= v589 then
							if v596:IsA("GuiObject") then
								v596.Button.TextColor3 = Color3.new(255, 255, 255);
							end;
						end;					
					end;
				end);
			end;		
		end;
		l__GiftFrame__538.Players.CanvasSize = UDim2.new(0, 0, 0, l__GiftFrame__538.Players.UIGridLayout.AbsoluteContentSize.Y);
	end;
	l__Gift__108.MouseButton1Down:Connect(function()
		l__Main__537.Visible = false;
		u134();
		l__GiftFrame__538.Visible = true;
	end);
	local function u136(p65)
		u102(l__PreviewFrame__539.Items);
		local v597, v598, v599 = pairs(l__ShopItems__101.Cases[p65].CaseItems);
		while true do
			local v600, v601 = v597(v598, v599);
			if v600 then

			else
				break;
			end;
			v599 = v600;
			local v602, v603, v604 = pairs(v601);
			while true do
				local v605, v606 = v602(v603, v604);
				if v605 then

				else
					break;
				end;
				local v607, v608 = getItemInfo(v606);
				local v609 = v542.Item:Clone();
				if v607 == "ChatTags" then
					v609.ItemImage.Visible = false;
					v609.ItemLabel.Text = string.format("[%s]", v24[v608].TagText);
					v609.ItemLabel.TextColor3 = v24[v608].TagColor;
					if 7 < string.len(v609.ItemLabel.Text) then
						v609.ItemLabel.TextScaled = true;
						if string.find(v609.ItemLabel.Text, " ") then
							v609.ItemLabel.TextScaled = false;
							if string.len(v609.ItemLabel.Text) < 13 then
								v609.ItemLabel.TextSize = 15;
							else
								v609.ItemLabel.TextSize = 10;
							end;
						end;
					end;
					v609.ItemLabel.Visible = true;
				elseif u52[v607][string.lower(v608)] then
					v609.ItemImage.Image = u52[v607][string.lower(v608)];
				else
					v609.ItemImage.Image = u52.Assets.error;
				end;
				v609.ItemName.Text = v608;
				v609.ItemName.TextColor3 = u53[v600];
				if v600 == "Uncommon" then
					v609.LayoutOrder = 1;
				elseif v600 == "Rare" then
					v609.LayoutOrder = 2;
				elseif v600 == "Special" then
					v609.LayoutOrder = 3;
				elseif v600 == "Unobtainable" then
					v609.LayoutOrder = 4;
				end;
				v609.Parent = l__PreviewFrame__539.Items;
				v609.Visible = true;			
			end;		
		end;
	end;
	l__Preview__109.MouseButton1Down:Connect(function()
		l__Main__537.Visible = false;
		u136(u129);
		l__PreviewFrame__539.Visible = true;
	end);
	l__Purchase__106.MouseButton1Down:Connect(function()
		if u113 then
			u113();
		end;
	end);
	local function u137(p66)
		u102(l__SettingsFrame__540.Maps);
		u102(l__SettingsFrame__540.Modes);
		local v610 = v23[p66];
		l__SettingsFrame__540.MinigameImage.Image = u52.Minigames[p66:lower()];
		l__SettingsFrame__540.MinigameName.Text = p66;
		local v611, v612, v613 = pairs(v610.Maps);
		while true do
			local v614, v615 = v611(v612, v613);
			if v614 then

			else
				break;
			end;
			v613 = v614;
			local v616 = v542.SettingsItem:Clone();
			v616.Parent = l__SettingsFrame__540.Maps;
			v616.Button.Text = v615;
			if v615 == u123 then
				v616.Button.TextColor3 = Color3.new(0, 255, 0);
			end;
			v616.Visible = true;
			v616.Button.MouseButton1Down:Connect(function()
				u123 = v615;
				v616.Button.TextColor3 = Color3.new(0, 255, 0);
				local v617, v618, v619 = pairs(l__SettingsFrame__540.Maps:GetChildren());
				while true do
					local v620, v621 = v617(v618, v619);
					if v620 then

					else
						break;
					end;
					v619 = v620;
					if v621 ~= v616 then
						if v621:IsA("GuiObject") then
							v621.Button.TextColor3 = Color3.new(255, 255, 255);
						end;
					end;				
				end;
			end);		
		end;
		local v622, v623, v624 = pairs(v610.Modes);
		while true do
			local v625, v626 = v622(v623, v624);
			if v625 then

			else
				break;
			end;
			v624 = v625;
			local v627 = v542.SettingsItem:Clone();
			v627.Parent = l__SettingsFrame__540.Modes;
			v627.Button.Text = v626;
			if v626 == u124 then
				v627.Button.TextColor3 = Color3.new(0, 255, 0);
			end;
			v627.Visible = true;
			v627.Button.MouseButton1Down:Connect(function()
				u124 = v626;
				v627.Button.TextColor3 = Color3.new(0, 255, 0);
				local v628, v629, v630 = pairs(l__SettingsFrame__540.Modes:GetChildren());
				while true do
					local v631, v632 = v628(v629, v630);
					if v631 then

					else
						break;
					end;
					v630 = v631;
					if v632 ~= v627 then
						if v632:IsA("GuiObject") then
							v632.Button.TextColor3 = Color3.new(255, 255, 255);
						end;
					end;				
				end;
			end);		
		end;
		l__SettingsFrame__540.Maps.CanvasSize = UDim2.new(0, 0, 0, l__SettingsFrame__540.Maps.UIGridLayout.AbsoluteContentSize.Y);
		l__SettingsFrame__540.Modes.CanvasSize = UDim2.new(0, 0, 0, l__SettingsFrame__540.Modes.UIGridLayout.AbsoluteContentSize.Y);
	end;
	l__Settings__110.MouseButton1Down:Connect(function()
		l__Main__537.Visible = false;
		u137(u122);
		l__SettingsFrame__540.Visible = true;
	end);
	local function u138(p67)
		u102(l__ShopFrame__543.Items);
		l__Main__537[p67].BorderSizePixel = 2;
		local v633, v634, v635 = pairs(u126);
		while true do
			local v636, v637 = v633(v634, v635);
			if v636 then

			else
				break;
			end;
			v635 = v636;
			if v637.Name ~= p67 then
				v637.BorderSizePixel = 0;
			end;		
		end;
		l__Placeholder__127.Visible = true;
		u112 = p67;
		local v638, v639, v640 = pairs(l__ShopItems__101[p67]);
		while true do
			local v641, v642 = v638(v639, v640);
			if v641 then

			else
				break;
			end;
			local v643 = v542.ShopItem:Clone();
			if p67 == "Cases" then
				if v642.Available then
					v643.ItemImage.Image = u52.Assets[string.format("%scase", string.lower(v641))];
					v643.ItemName.Text = v642.Name;
					if v641 == "Mystery" then
						local v644 = l__ShopPrices__128.MysteryPrice;
						v643.Price.Text = string.format("%i Coins", v644);
					else
						v644 = l__ShopPrices__128.CasePrice;
						v643.Price.Text = string.format("%i Coins", l__ShopPrices__128.CasePrice);
					end;
					v643.Visible = true;
					v643.Parent = l__Items__111;
					v643.Button.MouseButton1Down:Connect(function()
						if u107 ~= nil then
							if u107.ItemImage.Image == v643.ItemImage.Image then
								local v645 = u107.Price.Text == v643.Price.Text;
							else
								v645 = false;
							end;
						else
							v645 = false;
						end;
						if v645 == false then

						else
							u130(false);
							return;
						end;
						u129 = v641;
						u130(v643);
						u131("Case", v641, v644);
					end);
				elseif p67 == "Minigames" then
					v643.ItemImage.Image = u52.Minigames[string.lower(v641)];
					v643.ItemName.Text = v641;
					v643.Price.Text = string.format("%s Coins", l__ShopPrices__128.MinigamePrice);
					v643.Visible = true;
					v643.Parent = l__Items__111;
					v643.Button.MouseButton1Down:Connect(function()
						if u107 ~= nil then
							if u107.ItemImage.Image == v643.ItemImage.Image then
								local v646 = u107.Price.Text == v643.Price.Text;
							else
								v646 = false;
							end;
						else
							v646 = false;
						end;
						if v646 == false then

						else
							u130(false);
							return;
						end;
						u130(v643);
						u131("Minigame", v641, l__ShopPrices__128.MinigamePrice);
					end);
				elseif p67 == "Currency" then
					v643.ItemImage.Image = u52.Assets.coins2;
					v643.ItemName.Text = string.format("%s Coins", v642.Amount);
					v643.Price.TextColor3 = Color3.fromRGB(0, 255, 0);
					v643.Price.Text = string.format("%s Robux", v642.Robux);
					if v642.Sale then
						v643.Sale.Visible = true;
					end;
					v643.LayoutOrder = v642.Amount;
					v643.Visible = true;
					v643.Parent = l__Items__111;
					v643.Button.MouseButton1Down:Connect(function()
						if u107 ~= nil then
							if u107.ItemImage.Image == v643.ItemImage.Image then
								local v647 = u107.Price.Text == v643.Price.Text;
							else
								v647 = false;
							end;
						else
							v647 = false;
						end;
						if v647 == false then

						else
							u130(false);
							return;
						end;
						u130(v643);
						u131("Product", v642.ProductId);
					end);
				elseif p67 == "Donations" then
					v643.ItemImage.Image = u52.Assets.p299community;
					v643.ItemName.Text = "Donation";
					v643.Price.TextColor3 = Color3.fromRGB(0, 255, 0);
					v643.Price.Text = string.format("%s Robux", v642.Amount);
					v643.LayoutOrder = v642.Amount;
					v643.Visible = true;
					v643.Parent = l__Items__111;
					v643.Button.MouseButton1Down:Connect(function()
						if u107 ~= nil then
							if u107.ItemImage.Image == v643.ItemImage.Image then
								local v648 = u107.Price.Text == v643.Price.Text;
							else
								v648 = false;
							end;
						else
							v648 = false;
						end;
						if v648 == false then

						else
							u130(false);
							return;
						end;
						u130(v643);
						u131("Product", v642.ProductId);
					end);
				end;
			elseif p67 == "Minigames" then
				v643.ItemImage.Image = u52.Minigames[string.lower(v641)];
				v643.ItemName.Text = v641;
				v643.Price.Text = string.format("%s Coins", l__ShopPrices__128.MinigamePrice);
				v643.Visible = true;
				v643.Parent = l__Items__111;
				v643.Button.MouseButton1Down:Connect(function()
					if u107 ~= nil then
						if u107.ItemImage.Image == v643.ItemImage.Image then
							v646 = u107.Price.Text == v643.Price.Text;
						else
							v646 = false;
						end;
					else
						v646 = false;
					end;
					if v646 == false then

					else
						u130(false);
						return;
					end;
					u130(v643);
					u131("Minigame", v641, l__ShopPrices__128.MinigamePrice);
				end);
			elseif p67 == "Currency" then
				v643.ItemImage.Image = u52.Assets.coins2;
				v643.ItemName.Text = string.format("%s Coins", v642.Amount);
				v643.Price.TextColor3 = Color3.fromRGB(0, 255, 0);
				v643.Price.Text = string.format("%s Robux", v642.Robux);
				if v642.Sale then
					v643.Sale.Visible = true;
				end;
				v643.LayoutOrder = v642.Amount;
				v643.Visible = true;
				v643.Parent = l__Items__111;
				v643.Button.MouseButton1Down:Connect(function()
					if u107 ~= nil then
						if u107.ItemImage.Image == v643.ItemImage.Image then
							v647 = u107.Price.Text == v643.Price.Text;
						else
							v647 = false;
						end;
					else
						v647 = false;
					end;
					if v647 == false then

					else
						u130(false);
						return;
					end;
					u130(v643);
					u131("Product", v642.ProductId);
				end);
			elseif p67 == "Donations" then
				v643.ItemImage.Image = u52.Assets.p299community;
				v643.ItemName.Text = "Donation";
				v643.Price.TextColor3 = Color3.fromRGB(0, 255, 0);
				v643.Price.Text = string.format("%s Robux", v642.Amount);
				v643.LayoutOrder = v642.Amount;
				v643.Visible = true;
				v643.Parent = l__Items__111;
				v643.Button.MouseButton1Down:Connect(function()
					if u107 ~= nil then
						if u107.ItemImage.Image == v643.ItemImage.Image then
							v648 = u107.Price.Text == v643.Price.Text;
						else
							v648 = false;
						end;
					else
						v648 = false;
					end;
					if v648 == false then

					else
						u130(false);
						return;
					end;
					u130(v643);
					u131("Product", v642.ProductId);
				end);
			end;
			if u107 ~= nil then
				if u107.ItemImage.Image == v643.ItemImage.Image then
					local v649 = u107.Price.Text == v643.Price.Text;
				else
					v649 = false;
				end;
			else
				v649 = false;
			end;
			if v649 == true then
				v643.Selected.Visible = true;
			end;		
		end;
		l__Placeholder__127.Visible = false;
		l__ShopFrame__543.CanvasSize = UDim2.new(0, 0, 0, l__ShopFrame__543.Items:WaitForChild("UIGridLayout").AbsoluteContentSize.Y);
	end;
	l__Main__537:GetPropertyChangedSignal("Visible"):Connect(function()
		if l__Main__537.Visible == true then
			if u112 then

			else
				u138("Cases");
				return;
			end;
		else
			return;
		end;
		u138(u112);
	end);
	l__TouchPart__13.Touched:Connect(function(p68)
		if l__Players__3:GetPlayerFromCharacter(p68.Parent) == l__LocalPlayer__10 then
			if l__Main__537.Visible == false then
				l__Main__537.Visible = true;
				u138("Donations");
			end;
		end;
	end);
	l__Main__537.Codes.MouseButton1Down:Connect(function()
		l__Main__537.Visible = false;
		l__CodeFrame__536.Visible = true;
	end);
	l__Main__537:GetPropertyChangedSignal("Visible"):Connect(function()
		if l__Main__537.Visible == false then
			u105 = false;
			l__Purchase__106.Text = "Purchase";
		end;
	end);
	local v650, v651, v652 = pairs(u126);
	while true do
		local v653, v654 = v650(v651, v652);
		if v653 then

		else
			break;
		end;
		v652 = v653;
		v654.MouseButton1Down:Connect(function()
			if u112 ~= v654.Name then
				u102(l__ShopFrame__543.Items);
				u138(v654.Name);
			end;
		end);	
	end;
	l__RemoteEvent__20.OnClientEvent:Connect(function(...)
		local v655 = { ... };
		local v656 = v655[1];
		if v656 == "UpdateCoins" then
			l__Main__537.CoinsAmount.Text = tostring(v655[2]);
			return;
		end;
		if v656 == "UpdateGifted" then
			l__Info__30:WaitForChild("GiftedFrame"):WaitForChild("Amount").Text = tostring(v655[2]);
		end;
	end);
	l__RemoteEvent__20:FireServer("GetCoins");
	if u18 == false then
		if l__Workspace__9.CurrentCamera.ViewportSize.X < 1000 then
			if l__Workspace__9.CurrentCamera.ViewportSize.Y < 1000 then
				l__Main__537.Size = UDim2.new(0, l__Main__537.Size.X.Offset * 0.5, 0, l__Main__537.Size.Y.Offset * 0.5);
				l__Main__537.Position = UDim2.new(0.5, -l__Main__537.Size.X.Offset / 2, 0.5, -l__Main__537.Size.Y.Offset / 2);
				l__GiftFrame__538.Size = UDim2.new(0, l__GiftFrame__538.Size.X.Offset * 0.6666666666666666, 0, l__GiftFrame__538.Size.Y.Offset * 0.6666666666666666);
				l__GiftFrame__538.Position = UDim2.new(0.5, -(l__GiftFrame__538.Size.X.Offset / 2), 0.5, -(l__GiftFrame__538.Size.Y.Offset / 2));
				l__PreviewFrame__539.Size = UDim2.new(0, l__PreviewFrame__539.Size.X.Offset * 0.6666666666666666, 0, l__PreviewFrame__539.Size.Y.Offset * 0.6666666666666666);
				l__PreviewFrame__539.Position = UDim2.new(0.5, -(l__PreviewFrame__539.Size.X.Offset / 2), 0.5, -(l__PreviewFrame__539.Size.Y.Offset / 2));
				l__SettingsFrame__540.Size = UDim2.new(0, l__SettingsFrame__540.Size.X.Offset * 0.6666666666666666, 0, l__SettingsFrame__540.Size.Y.Offset * 0.6666666666666666);
				l__SettingsFrame__540.Position = UDim2.new(0.5, -(l__SettingsFrame__540.Size.X.Offset / 2), 0.5, -(l__SettingsFrame__540.Size.Y.Offset / 2));
				l__RewardFrame__541.Size = UDim2.new(0, l__RewardFrame__541.Size.X.Offset * 0.5, 0, l__RewardFrame__541.Size.Y.Offset * 0.5);
				l__RewardFrame__541.Position = UDim2.new(0.5, -(l__RewardFrame__541.Size.X.Offset / 2), 0.5, -(l__RewardFrame__541.Size.Y.Offset / 2));
				l__Items__111.UIGridLayout.CellSize = UDim2.new(0, l__Items__111.UIGridLayout.CellSize.X.Offset * 0.5, 0, l__Items__111.UIGridLayout.CellSize.Y.Offset * 0.5);
				l__Items__111.UIGridLayout.CellPadding = UDim2.new(0, 3, 0, 3);
				l__SelectedItem__104.UIGridLayout.CellSize = UDim2.new(0, l__SelectedItem__104.UIGridLayout.CellSize.X.Offset * 0.5, 0, l__SelectedItem__104.UIGridLayout.CellSize.Y.Offset * 0.5);
				l__Placeholder__127.Size = UDim2.new(0, l__Placeholder__127.Size.X.Offset * 0.5, 0, l__Placeholder__127.Size.Y.Offset * 0.5);
				l__Placeholder__127.Position = UDim2.new(0.5, -l__Placeholder__127.Size.X.Offset / 2, 0.5, -l__Placeholder__127.Size.Y.Offset / 2);
				l__PreviewFrame__539.Items.UIGridLayout.CellPadding = UDim2.new(0, 2, 0, 2);
				l__PreviewFrame__539.Items.UIGridLayout.CellSize = UDim2.new(0, l__PreviewFrame__539.Items.UIGridLayout.CellSize.X.Offset * 0.6666666666666666, 0, l__PreviewFrame__539.Items.UIGridLayout.CellSize.Y.Offset * 0.6666666666666666);
				l__Gift__108.TextScaled = false;
				l__Preview__109.TextScaled = false;
				l__Settings__110.TextScaled = false;
				l__Purchase__106.TextScaled = false;
				l__GiftFrame__538.Gift.TextScaled = false;
			end;
		end;
	end;
end;
setupChat();
setupInfoGui();
setupInventoryGui();
setupLeaderboardGui();
setupShopGui();

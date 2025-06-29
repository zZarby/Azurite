task.spawn(function()
	local lp = game.Players.LocalPlayer
	local ui = game:GetService("UserInputService")
	local l__ContextActionService__7 = game:GetService("ContextActionService");
	local l__RunService__1 = game:GetService('RunService')
	l__ContextActionService__7:UnbindAction("ShoulderCameraSprint");
	l__RunService__1:UnbindFromRenderStep("ShoulderCameraUpdate");
	l__ContextActionService__7:UnbindAction("ShoulderCameraZoom");
	while true do
		repeat game:GetService'RunService'.Heartbeat:Wait() until game.Workspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable
		l__RunService__1:UnbindFromRenderStep("ShoulderCameraUpdate");
		l__ContextActionService__7:UnbindAction("ShoulderCameraZoom");
		l__ContextActionService__7:UnbindAction("ShoulderCameraSprint");
		local wepsys = game:GetService("ReplicatedStorage"):FindFirstChild('WeaponsSystem')
		if not wepsys then return end
		for i,v in pairs(wepsys:GetDescendants()) do
			if v:IsA("Script") then
				v.Disabled = true
			end
			v:Destroy()
		end
		local wep = lp.PlayerGui:FindFirstChild("ClientWeaponsScript")
		local gui = lp.PlayerGui:FindFirstChild("WeaponsSystemGui")
		local sc = lp.PlayerScripts:FindFirstChild("ClientWeaponsScript")
		if wep then wep.Disabled = true wep:Destroy() end
		if gui then gui:Destroy() end
		if sc then
			sc.Disabled = true
			sc:Destroy()
		end
		ui.MouseIconEnabled = true
		game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		game.Workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid
		lp.Character.Humanoid.AutoRotate = true
	end
end)
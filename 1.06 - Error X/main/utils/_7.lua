local a = {
    icon = "rbxthumb://type=Asset&id=10912483183&w=150&h=150"
}
function a.n()
	if shared.settings_azurite then
		if shared.settings_azurite.notifications == true then
			pcall(function() 
				game.StarterGui:SetCore("SendNotification", {Title = "Azurite",Text = msg,Icon = a.icon,Duration = 5})
			end)
		end
	end
end
return a
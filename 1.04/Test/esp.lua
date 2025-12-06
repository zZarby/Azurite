function highlight(Main,Name,FillTransparency,OutlineTransparency,FillColor,OutlineColor)
    local esp = game.CoreGui:FindFirstChild(Name) or Instance.new("Highlight",game.CoreGui)
    esp.Name = Name
    esp.FillTransparency = FillTransparency
    esp.OutlineTransparency = OutlineTransparency
    esp.FillColor = FillColor
    esp.OutlineColor = OutlineColor
    esp.Adornee = Main
    esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    return esp
end
for _,v in pairs(game.Players:GetChildren()) do
    local chr = v.Character
    local esp = highlight(game.Players.LocalPlayer.Character,1,0,Color3.new(1, 1, 1),Color3.new(1, 1, 1))
end
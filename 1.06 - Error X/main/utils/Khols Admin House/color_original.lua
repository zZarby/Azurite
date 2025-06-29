function transformToColor3(col)
	local r = col.r
	local g = col.g
	local b = col.b
	return Color3.new(r,g,b);
end
local v1 = "PaintPart"
wait(1)
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.PaintBucket)
wait(0.25)
local remote = game:GetService("Workspace")[game:GetService("Players").LocalPlayer.Name].PaintBucket:WaitForChild("Remotes").ServerControls
for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace:GetChildren()) do
    spawn(function()
        if v:IsA("Part") then
            local v4 =
                {
                    ["Part"] = v,
                    ["Color"] = transformToColor3(BrickColor.new("Bright green"))
                }
            remote:InvokeServer(v1, v4)
        end
    end)
end
for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Admin Dividers"]:GetChildren()) do
    spawn(function()
        if v:IsA("Part") then
            local v5 =
                {
                    ["Part"] = v,
                    ["Color"] = transformToColor3(BrickColor.new("Dark stone grey"))
                }
            remote:InvokeServer(v1, v5)
        end
    end)
end
for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Basic House"]:GetDescendants()) do
    if v:IsA("Part") then
        spawn(function()
            if v.Name == "SmoothBlockModel103" or v.Name == "SmoothBlockModel105" or v.Name == "SmoothBlockModel106" or v.Name == "SmoothBlockModel108" or v.Name == "SmoothBlockModel11" or v.Name == "SmoothBlockModel113" or v.Name == "SmoothBlockModel114" or v.Name == "SmoothBlockModel115" or v.Name == "SmoothBlockModel116" or v.Name == "SmoothBlockModel118" or v.Name == "SmoothBlockModel122" or v.Name == "SmoothBlockModel126" or v.Name == "SmoothBlockModel129" or v.Name == "SmoothBlockModel13" or v.Name == "SmoothBlockModel130" or v.Name == "SmoothBlockModel131" or v.Name == "SmoothBlockModel132" or v.Name == "SmoothBlockModel134" or v.Name == "SmoothBlockModel135" or v.Name == "SmoothBlockModel14" or v.Name == "SmoothBlockModel140" or v.Name == "SmoothBlockModel142" or v.Name == "SmoothBlockModel147" or v.Name == "SmoothBlockModel15" or v.Name == "SmoothBlockModel154" or v.Name == "SmoothBlockModel155" or v.Name == "SmoothBlockModel164" or v.Name == "SmoothBlockModel166" or v.Name == "SmoothBlockModel173" or v.Name == "SmoothBlockModel176" or v.Name == "SmoothBlockModel179" or v.Name == "SmoothBlockModel185" or v.Name == "SmoothBlockModel186" or v.Name == "SmoothBlockModel190" or v.Name == "SmoothBlockModel191" or v.Name == "SmoothBlockModel196" or v.Name == "SmoothBlockModel197" or v.Name == "SmoothBlockModel198" or v.Name == "SmoothBlockModel20" or v.Name == "SmoothBlockModel201" or v.Name == "SmoothBlockModel203" or v.Name == "SmoothBlockModel205" or v.Name == "SmoothBlockModel207" or v.Name == "SmoothBlockModel208" or v.Name == "SmoothBlockModel209" or v.Name == "SmoothBlockModel210" or v.Name == "SmoothBlockModel211" or v.Name == "SmoothBlockModel213" or v.Name == "SmoothBlockModel218" or v.Name == "SmoothBlockModel22" or v.Name == "SmoothBlockModel223" or v.Name == "SmoothBlockModel224" or v.Name == "SmoothBlockModel226" or v.Name == "SmoothBlockModel26" or v.Name == "SmoothBlockModel29" or v.Name == "SmoothBlockModel30" or v.Name == "SmoothBlockModel31" or v.Name == "SmoothBlockModel36" or v.Name == "SmoothBlockModel37" or v.Name == "SmoothBlockModel38" or v.Name == "SmoothBlockModel39" or v.Name == "SmoothBlockModel41" or v.Name == "SmoothBlockModel48" or v.Name == "SmoothBlockModel49" or v.Name == "SmoothBlockModel51" or v.Name == "SmoothBlockModel56" or v.Name == "SmoothBlockModel67" or v.Name == "SmoothBlockModel68" or v.Name == "SmoothBlockModel69" or v.Name == "SmoothBlockModel70" or v.Name == "SmoothBlockModel72" or v.Name == "SmoothBlockModel75" or v.Name == "SmoothBlockModel8" or v.Name == "SmoothBlockModel81" or v.Name == "SmoothBlockModel85" or v.Name == "SmoothBlockModel93" or v.Name == "SmoothBlockModel98" then
                local v6 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Brick yellow"))
                    }
                remote:InvokeServer(v1, v6)
            end

            if v.Name == "SmoothBlockModel40" then
                local v7 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Bright green"))
                    }
                remote:InvokeServer(v1, v7)
            end

            if v.Name == "SmoothBlockModel100" or v.Name == "SmoothBlockModel102" or v.Name == "SmoothBlockModel104" or v.Name == "SmoothBlockModel107" or v.Name == "SmoothBlockModel109" or v.Name == "SmoothBlockModel110" or v.Name == "SmoothBlockModel111" or v.Name == "SmoothBlockModel119" or v.Name == "SmoothBlockModel12" or v.Name == "SmoothBlockModel120" or v.Name == "SmoothBlockModel123" or v.Name == "SmoothBlockModel124" or v.Name == "SmoothBlockModel125" or v.Name == "SmoothBlockModel127" or v.Name == "SmoothBlockModel128" or v.Name == "SmoothBlockModel133" or v.Name == "SmoothBlockModel136" or v.Name == "SmoothBlockModel137" or v.Name == "SmoothBlockModel138" or v.Name == "SmoothBlockModel139" or v.Name == "SmoothBlockModel141" or v.Name == "SmoothBlockModel143" or v.Name == "SmoothBlockModel149" or v.Name == "SmoothBlockModel151" or v.Name == "SmoothBlockModel152" or v.Name == "SmoothBlockModel153" or v.Name == "SmoothBlockModel156" or v.Name == "SmoothBlockModel157" or v.Name == "SmoothBlockModel158" or v.Name == "SmoothBlockModel16" or v.Name == "SmoothBlockModel163" or v.Name == "SmoothBlockModel167" or v.Name == "SmoothBlockModel168" or v.Name == "SmoothBlockModel169" or v.Name == "SmoothBlockModel17" or v.Name == "SmoothBlockModel170" or v.Name == "SmoothBlockModel172" or v.Name == "SmoothBlockModel177" or v.Name == "SmoothBlockModel18" or v.Name == "SmoothBlockModel180" or v.Name == "SmoothBlockModel184" or v.Name == "SmoothBlockModel187" or v.Name == "SmoothBlockModel188" or v.Name == "SmoothBlockModel189" or v.Name == "SmoothBlockModel19" or v.Name == "SmoothBlockModel193" or v.Name == "SmoothBlockModel2" or v.Name == "SmoothBlockModel200" or v.Name == "SmoothBlockModel202" or v.Name == "SmoothBlockModel21" or v.Name == "SmoothBlockModel214" or v.Name == "SmoothBlockModel215" or v.Name == "SmoothBlockModel216" or v.Name == "SmoothBlockModel219" or v.Name == "SmoothBlockModel220" or v.Name == "SmoothBlockModel221" or v.Name == "SmoothBlockModel222" or v.Name == "SmoothBlockModel225" or v.Name == "SmoothBlockModel227" or v.Name == "SmoothBlockModel229" or v.Name == "SmoothBlockModel23" or v.Name == "SmoothBlockModel230" or v.Name == "SmoothBlockModel231" or v.Name == "SmoothBlockModel25" or v.Name == "SmoothBlockModel28" or v.Name == "SmoothBlockModel32" or v.Name == "SmoothBlockModel33" or v.Name == "SmoothBlockModel34" or v.Name == "SmoothBlockModel42" or v.Name == "SmoothBlockModel44" or v.Name == "SmoothBlockModel47" or v.Name == "SmoothBlockModel54" or v.Name == "SmoothBlockModel55" or v.Name == "SmoothBlockModel58" or v.Name == "SmoothBlockModel59" or v.Name == "SmoothBlockModel6" or v.Name == "SmoothBlockModel61" or v.Name == "SmoothBlockModel62" or v.Name == "SmoothBlockModel63" or v.Name == "SmoothBlockModel74" or v.Name == "SmoothBlockModel76" or v.Name == "SmoothBlockModel77" or v.Name == "SmoothBlockModel78" or v.Name == "SmoothBlockModel79" or v.Name == "SmoothBlockModel80" or v.Name == "SmoothBlockModel84" or v.Name == "SmoothBlockModel86" or v.Name == "SmoothBlockModel87" or v.Name == "SmoothBlockModel88" or v.Name == "SmoothBlockModel90" or v.Name == "SmoothBlockModel91" or v.Name == "SmoothBlockModel92" or v.Name == "SmoothBlockModel94" or v.Name == "SmoothBlockModel95" or v.Name == "SmoothBlockModel96" then
                local v8 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Bright red"))
                    }
                remote:InvokeServer(v1, v8)
            end

            if v.Name == "SmoothBlockModel10" or v.Name == "SmoothBlockModel101" or v.Name == "SmoothBlockModel117" or v.Name == "SmoothBlockModel121" or v.Name == "SmoothBlockModel144" or v.Name == "SmoothBlockModel145" or v.Name == "SmoothBlockModel146" or v.Name == "SmoothBlockModel148" or v.Name == "SmoothBlockModel150" or v.Name == "SmoothBlockModel159" or v.Name == "SmoothBlockModel161" or v.Name == "SmoothBlockModel171" or v.Name == "SmoothBlockModel174" or v.Name == "SmoothBlockModel175" or v.Name == "SmoothBlockModel181" or v.Name == "SmoothBlockModel182" or v.Name == "SmoothBlockModel183" or v.Name == "SmoothBlockModel192" or v.Name == "SmoothBlockModel194" or v.Name == "SmoothBlockModel195" or v.Name == "SmoothBlockModel199" or v.Name == "SmoothBlockModel204" or v.Name == "SmoothBlockModel206" or v.Name == "SmoothBlockModel212" or v.Name == "SmoothBlockModel217" or v.Name == "SmoothBlockModel228" or v.Name == "SmoothBlockModel24" or v.Name == "SmoothBlockModel27" or v.Name == "SmoothBlockModel35" or v.Name == "SmoothBlockModel4" or v.Name == "SmoothBlockModel43" or v.Name == "SmoothBlockModel45" or v.Name == "SmoothBlockModel46" or v.Name == "SmoothBlockModel50" or v.Name == "SmoothBlockModel53" or v.Name == "SmoothBlockModel57" or v.Name == "SmoothBlockModel60" or v.Name == "SmoothBlockModel64" or v.Name == "SmoothBlockModel65" or v.Name == "SmoothBlockModel66" or v.Name == "SmoothBlockModel7" or v.Name == "SmoothBlockModel71" or v.Name == "SmoothBlockModel73" or v.Name == "SmoothBlockModel82" or v.Name == "SmoothBlockModel83" or v.Name == "SmoothBlockModel89" or v.Name == "SmoothBlockModel99" then
                local v9 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Dark orange"))
                    }
                remote:InvokeServer(v1, v9)
            end

            if v.Name == "SmoothBlockModel1" or v.Name == "SmoothBlockModel3" or v.Name == "SmoothBlockModel5" or v.Name == "SmoothBlockModel9" then
                local v10 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Dark stone grey"))
                    }
                remote:InvokeServer(v1, v10)
            end

            if v.Name == "SmoothBlockModel112" then
                local v11 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Medium blue"))
                    }
                remote:InvokeServer(v1, v11)
            end

            if v.Name == "SmoothBlockModel52" or v.Name == "SmoothBlockModel97" then
                local v12 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Reddish brown"))
                    }
                remote:InvokeServer(v1, v12)
            end

            if v.Name == "SmoothBlockModel160" or v.Name == "SmoothBlockModel162" or v.Name == "SmoothBlockModel165" or v.Name == "SmoothBlockModel178" then
                local v13 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Sand red"))
                    }
                remote:InvokeServer(v1, v13)
            end
        end)
    end
end
for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Building Bricks"]:GetDescendants()) do
    if v:IsA("Part") then
        spawn(function()
            if v.Name == "Part29" or v.Name == "Part31" or v.Name == "Part55" then
                local v14 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Dark stone grey"))
                    }
                remote:InvokeServer(v1, v14)
            end

            if v.Name == "Part11" or v.Name == "Part18" or v.Name == "Part25" or v.Name == "Part3" or v.Name == "Part43" then
                local v15 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Deep blue"))
                    }
                remote:InvokeServer(v1, v15)
            end

            if v.Name == "Part13" or v.Name == "Part21" or v.Name == "Part23" or v.Name == "Part7" then
                local v16 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Institutuional white"))
                    }
                remote:InvokeServer(v1, v16)
            end

            if v.Name == "Part17" or v.Name == "Part26" or v.Name == "Part38" or v.Name == "Part5" or v.Name == "Part9" then
                local v17 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Lime green"))
                    }
                remote:InvokeServer(v1, v17)
            end

            if v.Name == "Part30" or v.Name == "Part32" or v.Name == "Part33" or v.Name == "Part34" or v.Name == "Part35" or v.Name == "Part36" or v.Name == "Part39" or v.Name == "Part40" or v.Name == "Part41" or v.Name == "Part42" or v.Name == "Part46" or v.Name == "Part47" or v.Name == "Part48" or v.Name == "Part49" or v.Name == "Part50" or v.Name == "Part51" or v.Name == "Part52" or v.Name == "Part53" or v.Name == "Part54" or v.Name == "Part56" or v.Name == "Part57" or v.Name == "Part58" or v.Name == "Part59" or v.Name == "Part60" or v.Name == "Part61" or v.Name == "Part38" or v.Name == "Part5" or v.Name == "Part9" then
                local v18 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Medium Stone grey"))
                    }
                remote:InvokeServer(v1, v18)
            end

            if v.Name == "Part12" or v.Name == "Part15" or v.Name == "Part24" or v.Name == "Part44" or v.Name == "Part6" then
                local v19 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("New yeller"))
                    }
                remote:InvokeServer(v1, v19)
            end

            if v.Name == "Part14" or v.Name == "Part19" or v.Name == "Part2" or v.Name == "Part27" then
                local v20 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Really black"))
                    }
                remote:InvokeServer(v1, v20)
            end

            if v.Name == "Part1" or v.Name == "Part10" or v.Name == "Part16" or v.Name == "Part22" or v.Name == "Part37" then
                local v21 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Really red"))
                    }
                remote:InvokeServer(v1, v21)
            end

            if v.Name == "Part20" or v.Name == "Part28" or v.Name == "Part4" or v.Name == "Part45" or v.Name == "Part8" then
                local v22 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Toothpaste"))
                    }
                remote:InvokeServer(v1, v22)
            end
        end)
    end
end
for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace.Obby:GetChildren()) do
    spawn(function()
        if v:IsA("Part") then
            local v23 =
                {
                    ["Part"] = v,
                    ["Color"] = transformToColor3(BrickColor.new("Really red"))
                }
            remote:InvokeServer(v1, v23)
        end

        for i,v in pairs(game.Workspace.Terrain["_Game"].Workspace["Obby Box"]:GetChildren()) do
            if v:IsA("Part") then
                local v24 =
                    {
                        ["Part"] = v,
                        ["Color"] = transformToColor3(BrickColor.new("Teal"))
                    }
                remote:InvokeServer(v1, v24)
            end
        end
    end)
end

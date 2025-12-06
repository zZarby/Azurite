local function kick(comment) local a = {} function a:Kick(a, b) local c = Instance.new("ScreenGui") local d = Instance.new("Frame") local e = Instance.new("ImageLabel") local f = Instance.new("TextLabel") local g = Instance.new("Frame") local h = Instance.new("Frame") local i = Instance.new("TextLabel") c.Name = "_1"c.Parent = game.CoreGui c.ZIndexBehavior = Enum.ZIndexBehavior.Sibling c.ResetOnSpawn = false d.Name = "_1"d.Parent = c d.AnchorPoint = Vector2.new(0.5, 0.5) d.BackgroundColor3 = Color3.fromRGB(0,0,0) d.Position = UDim2.new(0.5, 0, 0.5, 0) d.Size = UDim2.new(1, 0, 1.5, 0) e.Name = "_1"e.Parent = d e.BorderColor3 = Color3.fromRGB(0,0,0) e.BackgroundColor3 = Color3.fromRGB(255, 255, 255) e.Position = UDim2.new(0.443181813, 0, 0.295528471, 0) e.Size = UDim2.new(0, 150, 0, 150) e.Image = "rbxassetid://12865138612"f.Name = "_1"f.Parent = e f.BackgroundColor3 = Color3.fromRGB(255, 255, 255) f.BackgroundTransparency = 1.000 f.Position = UDim2.new(-0.166666672, 0, 1.13333333, 0) f.Size = UDim2.new(0, 200, 0, 50) f.Font = Enum.Font.TitilliumWeb f.Text = "Lex Auth"f.TextColor3 = Color3.fromRGB(255, 255, 255) f.TextSize = 50.000 g.Name = "_1"g.Parent = e g.BackgroundColor3 = Color3.fromRGB(255, 255, 255) g.Position = UDim2.new(-0.5, 0, -0.206666678, 0) g.Size = UDim2.new(0, 300, 0, 1) h.Name = "_1"h.Parent = e h.BackgroundColor3 = Color3.fromRGB(255, 255, 255) h.Position = UDim2.new(-0.5, 0, 1.63333333, 0) h.Size = UDim2.new(0, 300, 0, 1) i.Parent = e i.BackgroundColor3 = Color3.fromRGB(255, 255, 255) i.BackgroundTransparency = 1.000 i.BorderColor3 = Color3.fromRGB(27, 42, 53) i.Position = UDim2.new(-1.16666663, 0, 2.24000001, 0) i.Size = UDim2.new(0, 500, 0, 50) i.Font = Enum.Font.TitilliumWeb i.TextColor3 = Color3.fromRGB(255, 255, 255) i.TextScaled = true i.TextSize = 14.000 i.TextWrapped = true i.Text = ""for a = 1, #b do i.Text = string.sub(b, 1, a) wait(0.05) end wait(5) a:Kick() game:shutdown() end a:Kick(game.Players.LocalPlayer,comment) end 
local function HttpGet(link, hash) local _ = game:HttpGet(link,true) if _ == nil then kick('HttpGet /// Error') elseif string.find(_, hash) == nil then kick('HttpGet /// Error') else return _ end end
local function CreateHash(source) local hex = ""for i = 1, #source do local byte = string.byte(source, i) hex = hex .. string.format("%02X", byte) end return hex end 
local function UnHash(source) local str = ""for i = 1, #source, 2 do local byte = tonumber(string.sub(source, i, i + 1), 16) str = str .. string.char(byte) end return str end


getgenv().LexAuthHash = CreateHash('782803A2382B463EFDA69C7DB5F39260713C0CBF32H1724BF6DCE36ABEE783ED7A217AF43A764370FFF89547B782ABCA732669C1337B4B0DF0BDE63CB88ADDF7744B6FAE34085D0AF9C29779B188FEDC7D2F683B3D6A4937F2A0E056BAEBC8B9762D19C036027FFCFBF4E123B381D8C67F456A9D3F274839FCB98258B4B6A96')

print(HttpGet('https://raw.githubusercontent.com/DaFrenchTokio/LexAuth/main/_.lua', LexAuthHash))

local __Azurite__ = {
	["#DebugMode"] = false,
	["#LightMode"] = false,
	["#ExternalP"] = true,

	["#HashSTR//"] = nil
}


function __Azurite__:Loadstring(Hash)
	if __Azurite__['#ExternalP'] then
		CreateHash('782803A2382B463EFDA69C7DB5F39260713C0CBF32H1724BF6DCE36ABEE783ED7A217AF43A764370FFF89547B782ABCA732669C1337B4B0DF0BDE63CB88ADDF7744B6FAE34085D0AF9C29779B188FEDC7D2F683B3D6A4937F2A0E056BAEBC8B9762D19C036027FFCFBF4E123B381D8C67F456A9D3F274839FCB98258B4B6A96')
		print(HttpGet('https://raw.githubusercontent.com/DaFrenchTokio/LexAuth/main/_.lua', LexAuthHash))
	else
		loadstring()
	end
end

function __Azurite__:ExModules()

end
function __Azurite__:Destroy() end
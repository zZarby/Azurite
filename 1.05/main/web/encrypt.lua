loadstring(game:HttpGet(("https://raw.githubusercontent.com/DaFrenchTokio/LXT/main/output.lua"),true))() -- Just Execute This Before Doing Anything With LXT

local key = 1000 -- Number Only
local text = readfile("exploit.lua")
encrypted = LXT:Crypt(true,key,text)
writefile("exploit.txt",encrypted)
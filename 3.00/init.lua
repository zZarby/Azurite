game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen();repeat wait() until game:IsLoaded();

local ID = game.PlaceId

local WL = {
    brookhaven = {4924922222}
}

function exec(table, link)
    for _, game_wl_id in next, table do
        if game_wl_id == ID then
            return loadstring(game:HttpGet((link),true))()
        end
    end
end

exec(WL.brookhaven, link)
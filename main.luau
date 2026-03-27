repeat task.wait() until game:IsLoaded()

local is_blacklisted = {
    'Solara',
    'Xeno'
}

if table.find(is_blacklisted, (identifyexecutor() or getexecutorname())) then
    game.Players.LocalPlayer:Kick('executor not supported')

    return
end

loadstring(game:HttpGet('https://raw.githubusercontent.com/leqtchorite/Angeli/refs/heads/main/utils/main.luau'))()

local hashes = loadstring(game:HttpGet('https://raw.githubusercontent.com/leqtchorite/Angeli/refs/heads/main/utils/hash/hashes.luau'))()

local function is_raknet()
    if not raknet then
        return false
    end

    local allowed = false

    local success = pcall(function()
        raknet.add_send_hook(function(packet)
            return packet
        end)

        allowed = true
    end)

    return success and allowed
end

local raknet_allowed = is_raknet()

local _unraknet = {
    [5166944221] = true,
    [1390601379] = true,
}

local _raknet = hashes['_raknet']

local game_id = game.GameId
local _game = hashes[game_id]

local init_hash = (raknet_allowed and _raknet and not _unraknet[game_id]) and _raknet or _game

if not init_hash then
    game.Players.LocalPlayer:Kick('game not supported')

    return
end

loadstring(game:HttpGet(`https://api.luarmor.net/files/v4/loaders/{init_hash}.lua`))()

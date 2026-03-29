repeat task.wait() until game:IsLoaded()

local players = cloneref(game:GetService('Players'))
local local_player = players.LocalPlayer

local is_blacklisted = {
    'Solara',
    'Xeno'
}

if table.find(is_blacklisted, (identifyexecutor() or getexecutorname())) then
    local_player:Kick('executor not supported')

    return
end

local game_hashes = {
    [5166944221] = '6be8aa9314b53172b3050faac1b9e647', --// death ball
    [1390601379] = '33e4b9148db40acfabee3a3a67136195', --// combat warriors
    ['_raknet']  = '1937b0725e7cc0ed215b9103199b4dd4', --// universal
}

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

local _raknet = game_hashes['_raknet']

local game_id = game.GameId
local _game = game_hashes[game_id]

local init_hash = (raknet_allowed and _raknet and not _unraknet[game_id]) and _raknet or _game

if not init_hash then
    local_player:Kick('game not supported')

    return
end

loadstring(game:HttpGet(`https://api.luarmor.net/files/v4/loaders/{init_hash}.lua`))()

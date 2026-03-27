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

  local game_id = game.GameId

  local _raknet = hashes['_raknet']
  local _game = hashes[game_id]

  if not _game and not raknet_allowed then
      game.Players.LocalPlayer:Kick('game not supported')

      return
  end

  if raknet_allowed and _raknet then
      loadstring(game:HttpGet(`https://api.luarmor.net/files/v4/loaders/{_raknet}.lua`))()
  end

  if _game then
      loadstring(game:HttpGet(`https://api.luarmor.net/files/v4/loaders/{_game}.lua`))()
  end

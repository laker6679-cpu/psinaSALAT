-- Loader for FrendlyHub
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- HWID Lock
local allowedUsers = {
    [10795177721] = true,
    [7508375923] = true,
    [11000050138] = true,
}

if not allowedUsers[LocalPlayer.UserId] then
    LocalPlayer:Kick("❌ Access Denied")
    while true do wait(9e9) end
end

-- Load main script from Pastebin (hidden)
loadstring(game:HttpGet("https://pastebin.com/raw/uSJYKxHa"))()

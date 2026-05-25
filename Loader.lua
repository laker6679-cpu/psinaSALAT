local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local AllowedUsers = { 10795177721, 7508375923, 11000050138 }

local allowed = false
for _, id in pairs(AllowedUsers) do
    if LocalPlayer.UserId == id then allowed = true break end
end

if not allowed then
    LocalPlayer:Kick("❌ Access Denied")
    while true do task.wait(9e9) end
end

-- ВСТАВЬ СЮДА СВОЮ RAW ССЫЛКУ
loadstring(game:HttpGet("https://pastebin.com/raw/nL6YeAx2"))()

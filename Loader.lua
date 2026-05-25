-- ПУБЛИЧНЫЙ ЗАГРУЗЧИК (этот код ВИДЕН всем)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ТВОИ ID (кого пускаем)
local AllowedUsers = {
    10795177721,  -- твой ID
    7508375923,   -- ID друга
    11000050138,  -- ID друга
}

-- Проверка
local ok = false
for _, id in pairs(AllowedUsers) do
    if LocalPlayer.UserId == id then ok = true break end
end

if not ok then
    LocalPlayer:Kick("❌ Доступ запрещен")
    while true do wait(9e9) end
end

-- ССЫЛКА НА ТАЙНЫЙ СКРИПТ (заменишь потом)
loadstring(game:HttpGet("https://pastebin.com/raw/СЮДА_ВСТАВИТЬ_КОД"))()

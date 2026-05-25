--// ПУБЛИЧНЫЙ ЗАГРУЗЧИК FRENDLYHUB
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

-- ////////////////////// НАСТРОЙКИ (ЗАМЕНИ ЭТО) //////////////////////
local SCRIPT_URL = "https://pastebin.com/raw/WUbEwFRc" -- ЗДЕСЬ ТВОЯ RAW ССЫЛКА
local SCRIPT_PASSWORD = "053237MkLp"            -- ЗДЕСЬ ТВОЙ ПАРОЛЬ ОТ ПАСТЫ
-- ////////////////////////////////////////////////////////////////////

-- HWID Lock (твои ID)
local AllowedUsers = { 10795177721, 7508375923, 11000050138 }

local function isAllowed()
    for _, id in pairs(AllowedUsers) do
        if LocalPlayer.UserId == id then return true end
    end
    return false
end

if not isAllowed() then
    LocalPlayer:Kick("❌ Access Denied")
    while true do task.wait(9e9) end
end

-- Загрузка и расшифровка приватного скрипта
task.spawn(function()
    local success, result = pcall(function()
        -- Запрашиваем запароленную пасту, передавая пароль в заголовках
        local headers = {
            ["X-Requested-With"] = "XMLHttpRequest",
            ["Password"] = SCRIPT_PASSWORD
        }
        local response = syn and syn.request or (http and http.request) or request
        local options = {
            Url = SCRIPT_URL,
            Method = "GET",
            Headers = headers
        }
        local result = response(options)
        
        if result.StatusCode == 200 then
            -- Успех: выполняем полученный код
            loadstring(result.Body)()
        else
            warn("Pastebin вернул ошибку: ", result.StatusCode)
            LocalPlayer:Kick("❌ Не удалось загрузить конфигурацию. Код ошибки: " .. result.StatusCode)
        end
    end)
    
    if not success then
        warn("Критическая ошибка: ", result)
        LocalPlayer:Kick("❌ Ошибка загрузки скрипта. Сообщи разработчику.")
    end
end)

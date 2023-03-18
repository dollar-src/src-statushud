
time = ''
PlayerData = {}
PlayerJob = {}
loaded = false
local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
	while QBCore.Functions.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = QBCore.Functions.GetPlayerData()
end)


AddEventHandler('onResourceStart', function(resourceName)
    loaded = true
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
     
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()

    loaded = true
    print(loaded)
    QBCore.Functions.GetPlayerData(function(PlayerData)
      
        PlayerJob = PlayerData.job
    end)
end)
RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate", function(JobInfo)
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
        PlayerJob = JobInfo

end)

Citizen.CreateThread(function()
  
    while true do 


    Wait(100)

    QBCore.Functions.TriggerCallback("src-hudv2:getaccount", function(result)

        if loaded then


    SendNUIMessage({
        
        action = 'show';
        job = PlayerJob.label;
        cash = math.floor(result.cash);
        bank = math.floor(result.bank);
        timez = getTime();
        players = result.players;
        maxplayer = result.maxplayer;


      })
    end
    end)

end


end)



function getTime()
    hour = GetClockHours()
    minute = GetClockMinutes()
    if hour <= 9 then
        hour = "0" .. hour
    end
    if minute <= 9 then
        minute = "0" .. minute
    end
    return hour .. ":" .. minute
end
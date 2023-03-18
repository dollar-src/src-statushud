local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('src-hudv2:getaccount', function(source, cb)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local cash = Player.Functions.GetMoney('cash')
    local bank = Player.Functions.GetMoney('bank')
    local cvar =  GetConvarInt('sv_maxclients', 32)
    table_data = {
           cash = cash,
           bank = bank,
           players = #GetPlayers(),
           maxplayer = cvar
      }
cb(table_data)
end)

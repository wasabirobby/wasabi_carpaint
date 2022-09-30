-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

CreateThread(function()
    for i=1, #Config.Paint do
        ESX.RegisterUsableItem(Config.Paint[i].item, function(source)
            TriggerClientEvent('wasabi_carpaint:startSpray', source, Config.Paint[i].item, Config.Paint[i].primary_color, Config.Paint[i].secondary_color, Config.Paint[i].particleColor)
        end)
    end
end)

ESX.RegisterServerCallback('wasabi_carpaint:checkItem', function(source, cb, itemname)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(itemname).count
    if item >= 1 then
        xPlayer.removeInventoryItem(itemname, 1)
        cb(true)
    else
        xPlayer.kick(Language['cheater_kick'])
        cb(false)
    end
end)

-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
ESX = exports["es_extended"]:getSharedObject()
local isPainting = false

CreateThread(function()
    while true do
        local sleep = 1500
        if isPainting then
            sleep = 0
            DisableAllControlActions(0)
            EnableControlAction(0, 1, true)
			EnableControlAction(0, 2, true)
        end
        Wait(sleep)
    end
end)

RegisterNetEvent('wasabi_carpaint:startSpray')
AddEventHandler('wasabi_carpaint:startSpray', function(item, color1, color2, sprayColor)
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped) then
        local vehicle = GetClosestVehicleToPlayer()
        if vehicle ~= 0 then
            local driverId = GetDriverOfVehicle(vehicle)
            if driverId == -1 then
                ESX.TriggerServerCallback('wasabi_carpaint:checkItem', function(cb)
                    if cb == true then
                        local animDict = loadDict('anim@mp_player_intupperwave')
                        local anim = 'idle_a'
                        local model = loadModel(`prop_cs_spray_can`)
                        local ptfxDict = loadPtfxDict('scr_paintnspray')
                        local ptfx = 'scr_respray_smoke'
                        local pos = GetEntityCoords(ped)
                        isPainting = true
                        ClearPedTasks(ped)
                        local obj = CreateObject(model, pos.x, pos.y, pos.z, true, true, true)
                        AttachEntityToEntity(obj, ped, GetPedBoneIndex(ped,18905), 0.07, 0.0, 0.03, 0.0, 90.0, 300.0, true, true, false, true, 1, true)
                        TaskTurnPedToFaceEntity(ped, vehicle, 1000)
                        Wait(1000)
                        TaskPlayAnim(ped, animDict , anim, 8.0, -8.0, -1,49, 0, true, true, true)
                        SetPtfxAssetNextCall(ptfxDict)
                        local sprayPart = StartNetworkedParticleFxLoopedOnEntity(ptfx, obj, 0.0,0.0,-0.5, 0.0,0.0,0.0, 0.5, 1.0,1.0,1.0)   
                        SetParticleFxLoopedColour(sprayPart, sprayColor.r, sprayColor.g, sprayColor.b, 0)
                        Wait(Config.SprayTime*1000)
                        RemoveParticleFx(sprayPart)
                        ClearPedTasks(ped)
                        DeleteObject(obj)
                        isPainting = false
                        SetVehicleColours(vehicle, color1, color2)
                        RemoveAnimDict('anim@mp_player_intupperwave')
                        SetModelAsNoLongerNeeded('prop_cs_spray_can')
                    end
                end, item)
            else
                TriggerEvent('wasabi_carpaint:notify', Language['someone_driving'])
            end
        else
            TriggerEvent('wasabi_carpaint:notify', Language['no_nearby'])
        end
    else
        TriggerEvent('wasabi_carpaint:notify', Language['not_in_car'])
    end
end)
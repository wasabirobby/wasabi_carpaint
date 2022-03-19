-----------------For support, scripts, and more----------------
-----------------https://discord.gg/XJFNyMy3Bv-----------------
---------------------------------------------------------------
loadDict = function(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
    return dict
end

loadModel = function(model)
    while not HasModelLoaded(model) do Wait(0) RequestModel(model) end
    return model
end

loadPtfxDict = function(particleDict)
    while not HasNamedPtfxAssetLoaded(particleDict) do Wait(0) RequestNamedPtfxAsset(particleDict) end
    return particleDict
end

GetClosestVehicleToPlayer = function()
	local plyPed = PlayerPedId()
	local plyPos = GetEntityCoords(plyPed, false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.0, 0.0)
	local radius = 1.0
	local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, radius, 10, plyPed, 7)
	local _, _, _, _, vehicle = GetShapeTestResult(rayHandle)
	return vehicle
end

GetDriverOfVehicle = function(vehicle)
	local driver = GetPedInVehicleSeat(vehicle, -1)
    if driver then
        if IsPedAPlayer(driver) then
            local plyId = NetworkGetPlayerIndexFromPed(driver)
            if NetworkGetPlayerIndexFromPed(driver) > 0 then
                return plyId
            else
                return -1
            end
        else
            return -1
        end
    else
        return -1
	end
end
if Link.vehiclekeys ~= 'eots_keys' then return end

function GiveVehicleKeys(player, vehicle)
    exports['qbx_vehiclekeys']:GiveTempKey(player, vehicle)
    return true
end

function RemoveVehicleKeys(player, vehicle)
    exports['qbx_vehiclekeys']:RemoveTempKey(player, vehicle)
    return true
end

if Link.dispatch.system ~= 'tugamars' then return end

function GetGender(ped)
    if GetEntityModel(ped) == GetHashKey('mp_m_freemode_01') then
        return 'male'
    elseif GetHashKey('mp_f_freemode_01') then
        return 'female'
    else
        return nil
    end
end

function GetStreetAndZone(coords)
    local zone = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
    local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
    return street .. ", " .. zone
end

function SendDispatchMessage(data)	
	local dispatchData = {
        title = "Incoming call!",
        message = data.description or "",
        codeName = 'NONE',
        code = data.code or '10-35',
        icon = 'fas fa-question',
        priority = 2,
        coords = data.coords or GetEntityCoords(PlayerPedId()),
        gender = GetGender(PlayerPedId()),
        street = GetStreetAndZone(data.coords or GetEntityCoords(PlayerPedId())),
        alertTime = nil
    }

    TriggerServerEvent('tgm:dispatch:new:call', dispatchData)
end

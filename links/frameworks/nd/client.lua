if Link.framework ~= 'nd' and Link.framework ~= 'nd_core' then
    return
end


function NotifyViaFramework(message, type)
    lib.notify({ description = message, type = type, duration = 4000 })
end

function GetPlayerJob()
    return nil
end

-- Not implemented by framework yet
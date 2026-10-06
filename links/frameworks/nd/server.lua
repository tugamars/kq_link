
print(Link.framework)
print("ND Core Attempt Started");

if Link.framework ~= 'nd' and Link.framework ~= 'nd_core' then
    return
end
print("ND Core Started");


--print("ND_Started KQ LINK")

local NDCore = exports["ND_Core"]:GetCoreObject();

function GetPlayerJob(player)
        local success, dutyInfo = pcall(function()
      return exports['tugamars_sna_framework']:getOndutyOfficerBySrc(source)
    end)
    
    if success and dutyInfo then
      if dutyInfo.type == 'LEO' or dutyInfo.type == 'leo' then
        return 'police',10
      elseif dutyInfo.type == 'EMS_FD' or dutyInfo.type == 'ems_fd' then
        return 'ambulance',10
      end
    end
    
end

function GetPlayersWithJob(jobs, minGrade)
    return {}
end

function CanPlayerAfford(player, amount)
    local character = NDCore.Functions.GetPlayer(tonumber(player))
    return character.cash >= amount;
end

function AddPlayerMoney(player, amount)
    NDCore.Functions.AddMoney(amount, tonumber(player), "cash", "-")
    return true
end

function RemovePlayerMoney(player, amount)
    NDCore.Functions.DeductMoney(amount, tonumber(player), "cash", "-")
    return true
end

if Link.inventory == 'framework' then
    Link.inventory = 'ox_inventory'
end

function GetPlayerCharacterId(player)
    local character = NDCore.Functions.GetPlayer(tonumber(player))
    
    return character.id;
end

function RegisterUsableItem(...)
    return true -- This system doesn't have it
end

function GetPlayerItemData(player, item)
    return nil
end

function GetPlayerItemCount(player, item)
    return 1000
end

function AddPlayerItem(player, item, amount, meta)
    return true
end

function RemovePlayerItem(player, item, amount)
    return true
end

function OpenCustomStash()
    -- Not available in standalone
    return true
end

function GetStashItems()
    -- Not available in standalone
    return {}
end

    AddEventHandler('ND:characterLoaded', function(character)
		local jobName, jobRank = GetPlayerJob(character.source);
        TriggerEvent('kq_link:jobUpdated', jobName or nil)
    end)

    AddEventHandler('tgm:sna:framework:duty:change', function(src, o, t)
		local jobName, jobRank = GetPlayerJob(src);
        TriggerEvent('kq_link:jobUpdated', jobName or nil)
    end)
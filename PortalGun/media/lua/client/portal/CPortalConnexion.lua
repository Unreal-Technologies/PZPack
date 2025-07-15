require 'SharedPortalTools'

function Portal.getOtherEndPos(isoObj)
    local md = ModData.getOrCreate(Portal.key)
    local id = Portal.getPortalSourceIdFromPortal(isoObj)
    local isBlueThisSide = Portal.getPortalIsBluedFromPortal(isoObj)
    if md[id] then
        if isBlueThisSide then
            return md[id].oranPos
        else
            return md[id].bluePos
        end
    end
    
    if Portal.Verbose then print ('getOtherEndPos no other end found '..(id or 'nil')..' '..tostring(isBlueThisSide and 'blue' or 'oran')) end
    return nil
end


--- analyse global mod data
function Portal.OnReceiveGlobalModData(_module, _packet)
    if _module == Portal.key then
        if _packet then
            if Portal.Verbose then print("Client receives Global mod data update ".._module..' '..ShGO.getTableString(_packet or 'nil')) end
            ModData.add(_module, _packet)
        else
            if Portal.Verbose then print("Client receives Global mod data synchro "..ShGO.getTableString(_module or 'nil')..' '..ShGO.getTableString(_packet or 'nil')) end
        end
    end
end


function Portal.initGMD()
    ModData.request(Portal.key);
end

if isClient() then
Events.OnReceiveGlobalModData.Add(Portal.OnReceiveGlobalModData)
Events.OnInitGlobalModData.Add(Portal.initGMD)
end


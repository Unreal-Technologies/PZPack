if isClient() then return end
require 'SharedPortalTools'
require 'portal/SPortalCore'--ensure the OnSGlobalObjectReceiveCommand_portal is available

--if an add was done within that time cancel the remove
Portal.TempoRemove = 1000
Portal.Timestamps = {}

function Portal.OnServerNewPortal(command, playerObj, args, result, portalSSystem)
    if command == 'add_portal' and result then
        if Portal.Verbose then print('Portal server Portal.OnServerNewPortal '..tab2str(result)) end
        local md = ModData.getOrCreate(Portal.key)
        local isoObj = result:getObject()
        local id = Portal.getPortalSourceIdFromPortal(isoObj)
        local isBlue = Portal.getPortalIsBluedFromPortal(isoObj)
        local pos = Portal.getPortalPosFromPortal(isoObj)
        if not md[id] then md[id] = {} end
        local override = false
        if isBlue then
            override = md[id].bluePos ~= nil
            md[id].bluePos = pos
        else
            override = md[id].oranPos ~= nil
            md[id].oranPos = pos
        end
        if override then--a remove will probably come shortly, that should have come before: prepare to neglect it
            if Portal.Verbose then print('Portal server GMD: Override portal '..(id or 'nil')..' '..tostring(isBlue and 'blue' or 'oran')..' '..ShGO.getTableString(md[id])) end
            Portal.Timestamps[id] = getTimestampMs()--we could condition that by the fact a pos was overriden
        end
        ModData.transmit(Portal.key);
        if Portal.Verbose then print('Portal server GMD: added  portal '..(id or 'nil')..' '..tostring(isBlue and 'blue' or 'oran')..' '..ShGO.getTableString(md[id])) end
    elseif command == 'remove_portal_beforeRemove' and result then
        local md = ModData.getOrCreate(Portal.key)
        local isoObj = result:getObject()
        local id = Portal.getPortalSourceIdFromPortal(isoObj)
        local isBlue = Portal.getPortalIsBluedFromPortal(isoObj)
        if md[id] then
            local ts = getTimestampMs()
            local lastOverrideTs = Portal.Timestamps[id] or 0
            local dt = ts - lastOverrideTs
            if dt > Portal.TempoRemove then
                if isBlue then
                    md[id].bluePos = nil
                else
                    md[id].oranPos = nil
                end
                ModData.transmit(Portal.key);
            else
                if Portal.Verbose then print('Portal server GMD: override compensated '..(id or 'nil')..' '..tostring(isBlue and 'blue' or 'oran')) end
            end
        end
        if Portal.Verbose then print('Portal server GMD: removed portal '..(id or 'nil')..' '..tostring(isBlue and 'blue' or 'oran')) end
    end
end

Events.OnSGlobalObjectReceiveCommand_portal.Add(Portal.OnServerNewPortal)
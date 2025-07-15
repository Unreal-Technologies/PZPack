
require 'SharedPortalTools'

function Portal.onWeaponSwing(player, weapon)
    if player and player:isLocalPlayer() and Portal.isPortalTool(weapon) then
        if not weapon:isJammed() then
            local targetSquare = getPlayerMouseSquare(player)
            if Portal.Verbose then print ('PortManager.onWeaponSwing '..weapon:getFullType()..' '..sq2str(targetSquare)) end
            if targetSquare then
                Portal.shoot(player, weapon, targetSquare)
            end
        end
    end
end

Events.OnWeaponSwing.Add(Portal.onWeaponSwing)



function Portal.shoot(player, weapon, targetSquare)
    if not player then return end
    if not weapon then return end
    if not targetSquare then return end
    local sourceId = Portal.getPortalSourceIdFromItem(weapon)
    if Portal.Verbose then print ('Portal.shoot '..player:getUsername()..' '..weapon:getFullType()..' '..sq2str(targetSquare)..' '..sourceId) end
    
    if not sourceId or sourceId == -1 then return end

    local portalInstance = Portal.getSquarePortal(targetSquare)
    if portalInstance then
        local existingPortalId = Portal.getPortalSourceIdFromPortal(portalInstance)
        if existingPortalId and existingPortalId==sourceId then
            if Portal.Verbose then print ('Portal.shoot remove portal '..existingPortalId) end
            Portal.removePortalPosition(weapon, targetSquare, player)
        else
            if Portal.Verbose then print ('Portal.shoot cannot create portal '..tostring(existingPortalId or 'nil')) end
        end
    else
        if Portal.Verbose then print ('Portal.shoot add portal '..sourceId) end

        local colorIsBlue = Portal.getPortalIsBlueFromItem(weapon)
        Portal.AddPortalPosition(weapon, targetSquare, player, colorIsBlue)
    end
end

function Portal.AddPortalPosition(item, targetSquare, player, colorIsBlue)
    if Portal.isPortalTool(item) then
        local pmd = Portal.getORCreatePortalMDFromItem(item)
        if pmd then
            if colorIsBlue == nil then colorIsBlue = Portal.getPortalIsBlueFromItem(item) end
            local pos = ShGO.convertPosToTable(targetSquare)
            if Portal.Verbose then print ('Portal.AddPortalPosition '..Portal.key..' '..ShGO.getTableString(pos)..' '..ShGO.getTableString(player)) end
            local sourceId = Portal.getPortalSourceIdFromItem(item)
            ShGO.createCGO(Portal.key, pos, player, {isBlue=colorIsBlue, id=sourceId})
            Portal.playSoundCreatePortal()
            pmd.isBlue = not colorIsBlue--force the color to the next from the color request
            if colorIsBlue then
                if pmd.bluePortal then
                    Portal.removePortalPosition(item, pmd.bluePortal, player)
                end
                pmd.bluePortal = pos
                pmd.isBlue = false
            else
                if pmd.orangePortal then
                    Portal.removePortalPosition(item, pmd.orangePortal, player)
                end
                pmd.orangePortal = pos
                pmd.isBlue = true
            end
        else
            print('Portal.setPortalPosition ERROR cannot create portal mod data on item. '..tostring(item or 'nil'))
        end
    else
        print('Portal.setPortalPosition ERROR cannot set pos on non portal item. '..tostring(item or 'nil'))
    end
end

function Portal.removePortalPosition(item, targetSquare, player)
    local pmd = Portal.getPortalMDFromItem(item)
    if pmd then
        local pos = ShGO.convertPosToTable(targetSquare)
        if Portal.Verbose then print ('Portal.removePortalPosition '..' '..ShGO.getTableString(pos)..' '..ShGO.getTableString(pmd.bluePortal)..' '..ShGO.getTableString(pmd.orangePortal)) end
        if pos and pos.x and pos.y and pos.z then
            if pmd.bluePortal and pos.x == pmd.bluePortal.x and pos.y == pmd.bluePortal.y and pos.z == pmd.bluePortal.z then
                ShGO.removeCGO(Portal.key, pos, player)
                pmd.bluePortal = nil
                pmd.isBlue = false
            end
            if pmd.orangePortal and pos.x == pmd.orangePortal.x and pos.y == pmd.orangePortal.y and pos.z == pmd.orangePortal.z then
                ShGO.removeCGO(Portal.key, pos, player)
                pmd.orangePortal = nil
                pmd.isBlue = true
            end
        else--print error
        end
    else --print error
    end
end

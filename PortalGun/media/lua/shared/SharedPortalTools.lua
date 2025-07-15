require 'GlobalObject/SharedGlobalObjectTools'

Portal = Portal or {}
Portal.key = 'portal'
Portal.objParams = {'portal','spriteName','isBlue','id'}
Portal.PortGun = 'Base.PortGun'
Portal.Verbose = false
local minZ = -10 --handle B42 min z negative? 

function Portal.getPortalSourceIdFromPortal(isoObj)
    local transferStruct = ShGO.getIsoObjParams(isoObj,Portal.key)
    if transferStruct then
        return transferStruct.id
    end
    return nil
end

function Portal.getPortalIsBluedFromPortal(isoObj)
    local transferStruct = ShGO.getIsoObjParams(isoObj,Portal.key)
    if transferStruct then
        return transferStruct.isBlue
    end
    return nil
end

function Portal.getPortalPosFromPortal(isoObj)
    local square = isoObj:getSquare()
    if square then
        return ShGO.convertPosToTable(square)
    end
    return nil
end


function Portal.getPortalSourceIdFromItem(item)
    if item then return item:getID() end
    return nil
end

function Portal.isPortalTool(item)
    return item and item:getFullType() == Portal.PortGun
end

function Portal.getPortalMDFromItem(item)
    local md = item:getModData()
    if md then
        return md
    end
    return nil
end

function Portal.getORCreatePortalMDFromItem(item)
    return Portal.getPortalMDFromItem(item)
end

function Portal.getPortalIsBlueFromItem(item)
    local pmd = Portal.getPortalMDFromItem(item)
    if pmd then
        if pmd.bluePortal and not pmd.orangePortal then pmd.isBlue = false end
        if pmd.orangePortal and not pmd.bluePortal then pmd.isBlue = true end
        return pmd.isBlue
    end
    return nil
end

function Portal.nextPortalColoItem(item)
    if Portal.isPortalTool(item) then
        local pmd = Portal.getORCreatePortalMDFromItem(item)
        if pmd then
            pmd.isBlue = not (pmd.isBlue or false)
        else
            print('Portal.nextPortalColoItem ERROR cannot create portal mod data on item. '..tostring(item or 'nil'))
        end
    else
        print('Portal.nextPortalColoItem ERROR cannot change color selection on non portal item. '..tostring(item or 'nil'))
    end
end

function Portal.getSquarePortal(targetSquare)
    return ShGO.getFirstObject(targetSquare,Portal.key)
end

function Portal.samePos(posA, posB)
    if not posA or (not posA.x and not posA.y and not posA.z) then return false end
    if not posB or (not posB.x and not posB.y and not posB.z) then return false end
    return posA.x == posB.x and posA.y == posB.y and posA.z == posB.z
end


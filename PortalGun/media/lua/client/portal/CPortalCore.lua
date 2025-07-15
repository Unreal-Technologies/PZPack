
require 'GlobalObject/CGlobalObjectCreator'

ShGO.initCGO('portal')

--exemple of TimeAction add
local function addCreatePortalMenuOption(playerNum, context, worldobjects, test)
    if not context then return end
    local player = getSpecificPlayer(playerNum)
    if not player then return end
    local xUI = context:getX()
    local yUI = context:getY()
    local xIso  = screenToIsoX(playerNum, xUI, yUI, player:getZ());
    local yIso  = screenToIsoY(playerNum, xUI, yUI, player:getZ());
    local square = getCell():getGridSquare(xIso, yIso, player:getZ())
    if not square then return end
    --todo maybe add conditions isSolid, isSolidTransient, isWater, ..
    local optionText = getText("IGUI_CreatePortal")
    local option = context:addOption(optionText, player, addCreatePortalAction, square)
end

function addCreatePortalAction(player, square)
    ISTimedActionQueue.add(ISCreatePortalAction:new(player, square, 100));
end

--exemple of instant removal
local function addRemovePortalMenuOption(context, isoObj, playerNum, x, y, test)
    if not context then return end
    if not isoObj then return end
    local playerObj = getSpecificPlayer(playerNum)
    if not playerObj then return end
    local square = isoObj:getSquare()
    if not square then return end
    local optionText = getText("IGUI_RemovePortal")
    local option = context:addOption(optionText, 'portal', ShGO.removeCGO, square, playerObj)
end

local function printPortalInfo(isoObj, square, playerObj)
    print('printPortalInfo '..sq2str(square)..' '..ShGO.getTableString(isoObj:getModData())..' '..ShGO.getTableString(Portal.getOtherEndPos(isoObj)))
end

local function addPortalInfoOption(context, isoObj, playerNum, x, y, test)
    if not context then return end
    if not isoObj then return end
    local playerObj = getSpecificPlayer(playerNum)
    if not playerObj then return end
    local square = isoObj:getSquare()
    if not square then return end
    local optionText = getText("IGUI_InfoPortal")
    local option = context:addOption(optionText, isoObj, printPortalInfo, square, playerObj)
end

if isAdmin() or isDebugEnabled() then
Events.OnFillWorldObjectContextMenu.Add(addCreatePortalMenuOption);
Events.OnCGlobalObjectContextMenu_portal.Add(addRemovePortalMenuOption)
Events.OnCGlobalObjectContextMenu_portal.Add(addPortalInfoOption)
end
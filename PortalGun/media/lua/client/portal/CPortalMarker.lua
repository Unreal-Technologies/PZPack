
require 'SharedPortalTools'
require 'portal/CPortalCore'
Portal.markers = Portal.markers or {}

function Portal.getMarkerId(luaObj)
    return tostring(luaObj)
end

--color orange light #ff9a00 (255,154,0)
--color orange dark #ff5d00 (255,93,0) => 255,123,0
--color transparentcy/black #000000 (0,0,0)
--color blue dark #0065ff (0,101,255)
--color blue light #00a2ff (0,162,255)=>0,131,255
function Portal.getPortalColor(isBlue)
    if isBlue then
        local color = Sh.getColorFromEnum(SandboxVars.PortalGun.Portal2Color)
        return color and color.r,color.g,color.b or 0,0,0
    else
        local color = Sh.getColorFromEnum(SandboxVars.PortalGun.Portal1Color)
        return color and color.r,color.g,color.b or 0,0,0
    end
end

Portal.portals = Stack.new()
Portal.portalIt = 0


function Portal.addPortalMarker(luaObj)
    if Portal.Verbose then print ("Portal marker: addPortalMarker "..ShGO.getTableString(luaObj)) end
    if not luaObj then return end
    
    Portal.updatePortal(luaObj)
    
    Portal.portals:push(luaObj)
    if Portal.portals:size() == 1 then
        Events.OnTick.Add(Portal.updatePortals)--TODO OnRenderTick for circle drawing test
    end
end

function Portal.updatePortals()
    if Portal.portalIt >= Portal.portals:size() then Portal.portalIt = 0 end
    if Portal.portalIt < Portal.portals:size() then
        local luaObject = Portal.portals:get(Portal.portalIt)
        Portal.portalIt = Portal.portalIt + 1
        if luaObject then
            Portal.updatePortal(luaObject)
        end
    end
end


function Portal.updatePortal(luaObj)
    local markerId = Portal.getMarkerId(luaObj)
    --if Portal.Verbose then print ("Portal marker: update "..ShGO.getTableString(luaObj)) end
    local marker = Portal.markers[markerId]
    if not marker then
        local isoObj = luaObj:getIsoObject()
        if isoObj then 
            local md = isoObj:getModData()
            local square = isoObj:getSquare()
            local r,g,b = Portal.getPortalColor(md and md.isBlue)
            local size = SandboxVars.PortalGun.PortalSize
            if Portal.Verbose then print ("Portal marker: add "..markerId..' at '..square:getX()..","..square:getY()..",".. square:getZ() .." "..size..' '..ShGO.getTableString(md)) end
            --create
            local newMarker = getWorldMarkers():addGridSquareMarker(square, r/255.0f, g/255.0f, b/255.0f, true, size);--TODO play with the interface (string parameters)
            Portal.markers[markerId] = newMarker
        end
    else--test colors
        --local r,g,b = Portal.getPortalColor(false)
        --local size = SandboxVars.PortalGun.PortalSize
        --marker:setR(r/255.0f)
        --marker:setG(g/255.0f)
        --marker:setB(b/255.0f)
        --marker:setSize(size)
        local player = getPlayer()
        if player and false then
            local playerSquare = player:getCurrentSquare()
            if playerSquare then
                --if Portal.Verbose then print ("Portal marker: update player at "..sq2str(playerSquare)) end
                local isoObj = luaObj:getIsoObject()
                if isoObj then 
                    local square = isoObj:getSquare()
                    if square then
                        if playerSquare:getZ() ~= square:getZ() or true then
                            local md = isoObj:getModData()
                            if md then
                                local r,g,b = Portal.getPortalColor(md and md.isBlue)
                                r = r/255.f
                                g = g/255.f
                                b = b/255.f
                                local maxDist = 30
                                luautils.renderIsoCircle(player:getPlayerNum(), square:getX()+0.5f, square:getY()+0.5f, square:getZ()+0.1f, 10.f, 1.f, 1.f, 1.f, 1.0f, maxDist)
                              --luautils.renderIsoCircle(playerNum,                          posX,              posY,          posZ,                                 ray, r, g, b, a, margin)
                                if Portal.Verbose then print ("Portal marker: update "..ShGO.getTableString(markerId)..' at '..sq2str(square)..' '..r..','..g..','..b..' '..SandboxVars.PortalGun.PortalSize) end
                            else
                                if Portal.Verbose then print ("Portal marker: error md "..ShGO.getTableString(md or 'nil')) end
                            end
                        else
                            if Portal.Verbose then print ("Portal marker: same square elevation "..sq2str(square)..' '..sq2str(playerSquare)) end
                        end
                    else
                        if Portal.Verbose then print ("Portal marker: error square ") end
                    end
                else
                    if Portal.Verbose then print ("Portal marker: error isoObj ") end
                end
            end
        end
    end
end

function Portal.removePortalMarker(luaObj)
    if Portal.Verbose then print ("Portal marker: removePortalMarker "..ShGO.getTableString(luaObj)) end
    if not luaObj then return end
    local markerId = Portal.getMarkerId(luaObj)
    if Portal.Verbose then print ("Portal marker: remove "..markerId) end
    local marker = Portal.markers[markerId]
    if marker then
        getWorldMarkers():removeGridSquareMarker(marker)
        Portal.markers[markerId] = nil
    end
    
    for i=Portal.portals:size()-1, 0, -1 do
        local val = Portal.portals:get(i);
        if val == luaObj then
            if i < Portal.portals:size()-1 then--push the removal to last element
                Portal.portals:set(i,Portal.portals:lastElement())
            end
            Portal.portals:pop()
            break
        end
    end
    if Portal.portals:size() == 0 then
        Events.OnTick.Remove(Portal.updatePortals)
    end
end

Events.OnObjectAdded_portal.Add(Portal.addPortalMarker)
Events.OnObjectRemoved_portal.Add(Portal.removePortalMarker)

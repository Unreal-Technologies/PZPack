
require 'SharedPortalTools'

local telOnTick = {}
function Portal.teleport(character,destPos)
    if not character then return end
    if not destPos or not destPos.x or not destPos.y or not destPos.z then return end
    --handle start / end offset on square ?
    local offsetX = character:getX()-character:getCurrentSquare():getX()
    local offsetY = character:getY()-character:getCurrentSquare():getY()
    local offsetZ = character:getZ()-character:getCurrentSquare():getZ()
    if Portal.Verbose then print ('Portal teleport to '..offsetX..' '..offsetY..' '..sq2str(destPos)..' '..sq2str(destPos)..' '..sq2str(character:getSquare())..' '..sq2str(character:getCurrentSquare())) end
    if Portal.Verbose then print ('Portal teleport from '..offsetX..' '..offsetY..' '..sq2str({x=character:getX(),y=character:getY(),z=character:getZ()})) end
    
    telOnTick[tostring(character)] = function()
        local sq = character:getSquare()
        if sq and (character:isDead() or sq:getX() == destPos.x and sq:getY() == destPos.y and sq:getZ() == destPos.z) then
            Events.OnTick.Remove(telOnTick[tostring(character)])
            telOnTick[tostring(character)] = nil
        else
            character:setX (destPos.x+offsetX)
            character:setY (destPos.y+offsetY)
            character:setZ (destPos.z+offsetZ)
            character:setLx(destPos.x+offsetX)
            character:setLy(destPos.y+offsetY)
            character:setLz(destPos.z+offsetZ)
            if Portal.Verbose then print ('Portal teleport to '..offsetX..' '..offsetY..' '..sq2str({x=character:getX(),y=character:getY(),z=character:getZ()})) end
        end
    end
    Events.OnTick.Add(telOnTick[tostring(character)])
    --character:MoveUnmodded(Vector2.new(0,0))--updates the currentSquare
end

function Portal.insideCircle(checkDist, character, currentPos)
    if not checkDist then return true end
    local deltaX = character:getX()-(currentPos.x+0.5)
    local deltaY = character:getY()-(currentPos.y+0.5)
    local distance = math.sqrt(deltaX*deltaX+deltaY*deltaY)
    return  distance * 0.7071 / 0.5 < SandboxVars.PortalGun.PortalSize
end

function Portal.updateTeleportCharacter(character,checkDist)
    local currentSquare = character:getCurrentSquare()
    local currentPos = ShGO.convertPosToTable(currentSquare)
    local md = character:getModData()
    if not md[Portal.key] then
        md[Portal.key] = {lastSquareTeported=currentPos}
    end
    
    if currentPos and not Portal.samePos(md[Portal.key].lastSquareTeported, currentPos) and not Portal.samePos(md[Portal.key].lastSquareSource, currentPos) then
        md[Portal.key].lastSquareTeported = nil--we left the square, we can enter it again
        md[Portal.key].lastSquareSource = nil--we left the square, we can enter it again
        local isoPortal = ShGO.getFirstObject(currentSquare,Portal.key)
        if isoPortal then
            local destPos = Portal.getOtherEndPos(isoPortal)
            if destPos and not Portal.samePos(destPos, currentPos) and Portal.insideCircle(checkDist, character, currentPos) then
                --if Portal.Verbose then print ('Portal updateTeleport '..tab2str(character)..' from '..sq2str(currentPos)..' to '..sq2str(destPos)) end
                --if Portal.Verbose then print ('Portal updateTeleport mem '..sq2str(md[Portal.key].lastSquareTeported)..' to '..sq2str(md[Portal.key].lastSquareSource)) end
                Portal.teleport(character,destPos)
                Portal.playSoundTeleport()
                md[Portal.key].lastSquareSource = currentPos
                md[Portal.key].lastSquareTeported = destPos
            end
        end
    end
end


function Portal.teleportZombie(isoZombie)
    if isoZombie:isLocal() then
        Portal.updateTeleportCharacter(isoZombie,false)
    end
end


function Portal.onSandboxOptionsReady()
    if SandboxVars.PortalGun.TeleportZombies then
        Events.OnZombieUpdate.Add(Portal.teleportZombie)
    end
end

Events.OnInitGlobalModData.Add(Portal.onSandboxOptionsReady)
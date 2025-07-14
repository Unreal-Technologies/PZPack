
Climb = Climb or {}
Climb.Verbose = false
require 'ClimbConfig'
Climb.loadConfig()

function Climb.OnPlayerUpdate(isoPlayer)
    if not isoPlayer then return end--some reuse from elsewhere with missing parameter
    local square = isoPlayer:getSquare()
    if not square then return end--teleport
    
    --when pressing interaction key while no action active
    if isKeyPressed(Climb.getKey()) and not isoPlayer:hasTimedActions() and not square:HasStairs()  and not Climb.isHealthInhibitingClimb(isoPlayer) then
        local playerTarget = Climb.getPlayerTarget(isoPlayer)
        
        if playerTarget and Climb.isClimbableWallInBounds(square,playerTarget.square) then
            if Climb.Verbose then print('Climb.OnPlayerUpdate lets go '..sq2str(playerTarget.square)) end
            ISTimedActionQueue.clear(isoPlayer)
            ISTimedActionQueue.add(ISClimbWall:new(isoPlayer, playerTarget.square, playerTarget.pos));
        end
    
    end
end

Events.OnPlayerUpdate.Add(Climb.OnPlayerUpdate)


function Climb.getPlayerTarget(isoPlayer)
    local playerTarget = {}
    if not isoPlayer then return nil end

    local targetZ = isoPlayer:getZ()+1
    
    local forwardDist = 0.5
    local charOrientationAngle = isoPlayer:getAnimAngleRadians();--Hum, this is angle 0 = East, PI/2 = South, -PI/2=North, PI=West
    local charX = isoPlayer:getX()
    local charY = isoPlayer:getY()
    local deltaX = math.cos(charOrientationAngle)
    local deltaY = math.sin(charOrientationAngle)
    local forwardX = charX + deltaX * forwardDist
    local forwardY = charY + deltaY * forwardDist
    
    if forwardX ~= charX and forwardY ~= charY then--problem. diagonal should include more checks than my lazy ass wanna maintain
        if math.abs(deltaY) > math.abs(deltaX) then--bypass the problem by targeting easting OR northing. depending on orientation
            forwardX = charX--northing only.
        else
            forwardY = charY--easting only.
        end
    end
    
    playerTarget.pos = {x=forwardX, y=forwardY, z=targetZ}
    playerTarget.square = getCell():getGridSquare(forwardX, forwardY, targetZ)
    
    return playerTarget
end


function Climb.isClimbableWallInBounds(square,targetSquare)
    if not square or not targetSquare then
        if Climb.Verbose then print('Climb.isClimbableWallInBounds '..sq2str(square)..' / '..sq2str(targetSquare)) end
        return nil
    end
    
    if not targetSquare:TreatAsSolidFloor() then
        if Climb.Verbose then print('Climb.isClimbableWallInBounds not solid floor on target square '..sq2str(targetSquare)) end
        return nil
    elseif targetSquare:isSolidTrans() or targetSquare:isSolid() or targetSquare:HasStairs() then
        if Climb.Verbose then print('Climb.isClimbableWallInBounds occupied target square '..sq2str(targetSquare)) end
        return nil
    end
    local sourceX = square:getX()
    local sourceY = square:getY()
    local targetX = targetSquare:getX()
    local targetY = targetSquare:getY()
    
    if sourceX == targetX and sourceY == targetY then
        if Climb.Verbose then print('Climb.isClimbableWallInBounds '..sq2str(square)..' on same vertical as '..sq2str(targetSquare)) end
        return nil
    end
    local sourceZ = square:getZ()
    local targetZ = targetSquare:getZ()
    
    local upSquare = getCell():getGridSquare(sourceX, sourceY, targetZ)
    if upSquare then
        if upSquare:TreatAsSolidFloor() or upSquare:isSolid() or upSquare:isSolidTrans() then
            if Climb.Verbose then print('Climb.isClimbableWallInBounds '..sq2str(square)..' has blocking square (with floor) above.') end
            return nil
        end
        if Climb.Verbose then print('Climb.isClimbableWallInBounds '..sq2str(square)..' has valid square (without floor) above.') end
    else
        if Climb.Verbose then print('Climb.isClimbableWallInBounds '..sq2str(square)..' has no valid square above.') end
    end
    
    local canCimb = true
    if targetY == sourceY then
        if targetX > sourceX then--going east
            if Climb.Verbose then print('Climb.isClimbableWallInBounds going East.') end
            canCimb = not Climb.isBlockedOnWestSide(targetSquare)
        elseif targetX < sourceX then--going west
            if Climb.Verbose then print('Climb.isClimbableWallInBounds going West.') end
            canCimb = not upSquare or not Climb.isBlockedOnWestSide(upSquare)
        else
            if Climb.Verbose then print('Climb.isClimbableWallInBounds same square.') end
            canCimb = false
        end
    elseif targetX == sourceX then
        if targetY > sourceY then--going south
            if Climb.Verbose then print('Climb.isClimbableWallInBounds going South.') end
            canCimb = not Climb.isBlockedOnNorthSide(targetSquare)
        elseif targetY < sourceY then--going north
            if Climb.Verbose then print('Climb.isClimbableWallInBounds going North.') end
            canCimb = not upSquare or not Climb.isBlockedOnNorthSide(upSquare)
        else
            if Climb.Verbose then print('Climb.isClimbableWallInBounds algo error.') end
            canCimb = false
        end
    end
    
    if canCimb then return targetSquare end
    return nil
end

function Climb.isBlockedOnWestSide(square)
    if not square then return false end
    return square:Is(IsoFlagType.collideW) or square:Is(IsoFlagType.WindowW) or square:Is(IsoFlagType.doorW) or square:Is(IsoFlagType.HoppableW)--see IsoFlagType for potential other flags
end 
function Climb.isBlockedOnNorthSide(square)
    if not square then return false end
    return square:Is(IsoFlagType.collideN) or square:Is(IsoFlagType.WindowN) or square:Is(IsoFlagType.doorN) or square:Is(IsoFlagType.HoppableN)--see IsoFlagType for potential other flags
end 


--
-- ********************************
-- *** Water Pipes              ***
-- ********************************
-- *** Coded by: Slayer         ***
-- ********************************
--
require "Blacksmith/ISUI/ISBlacksmithMenu"
require "ISUI/ISWorldObjectContextMenu"
require "ISUI/ISWaterPumpInfoWindow"
require "ISUI/ISValveInfoWindow"
require "wp_gmd"
require "wp_utils"
require "wp_vsquare"
require "ISUI/ISWPUI"
-- require "BuildingObjects/WPQuadTileFurniture"
-- require "BuildingObjects/WPPipeTileFurniture"
require "BuildingObjects/WPPumpTileFurniture"

local TAInstallPipe = require("Actions/TAInstallPipe")
local TARemovePipe = require("Actions/TARemovePipe")
local TAAttachPump = require("Actions/TAAttachPump")
local TATurnOnPump = require("Actions/TATurnOnPump")
local TATurnOffPump = require("Actions/TATurnOffPump")
local TARepairPump = require("Actions/TARepairPump")
local TADisassemblePump = require("Actions/TADisassemblePump")
local TAAddFilterPump = require("Actions/TAAddFilterPump")
local TAInfoPump = require("Actions/TAInfoPump")
local TAinfoValve = require("Actions/TAInfoValve")
local TAChangeValve = require("Actions/TAChangeValve")

pipeTraverse = {}

stack = 0

--- patched functions

--[[
local base_fetch = ISWorldObjectContextMenu.fetch

function ISWorldObjectContextMenu.fetch(v, player, doSquare)
    base_fetch(v, player, doSquare)
    
    -- additional check for waterpiping
    -- if not canBeWaterPiped then
        local square = clickedSquare

        if square then
            local objects = square:getSpecialObjects();
            for i=0, objects:size()-1 do
                local object = objects:get(i);
                local sprite = object:getSprite()
                local spriteName = sprite:getName()

                local test1 = v:hasModData()
                local test2 = v:getModData().canBeWaterPiped
                local test3 = v:getSquare()
                local test4 = v:getSquare():isInARoom()
                local test5 = IsoObject.FindExternalWaterSource(v:getSquare())

                -- if v:hasModData() and v:getModData().canBeWaterPiped and v:getSquare() and v:getSquare():isInARoom() and IsoObject.FindExternalWaterSource(v:getSquare()) then
                --     canBeWaterPiped = v;
                -- end
            end
        end
    -- end

end
]]--

local base_perform = ISBuildAction.perform

function ISBuildAction:perform()
    base_perform(self)   
    FixPipeSprites(self.x, self.y, self.z)
    RegisterBarrels(self.x, self.y, self.z)
    -- fixme register tanks
end

--- timed actions

function TimedInstallPipe (playerObj, ACSquare)
    if luautils.walkAdj(playerObj, ACSquare) then
        ISTimedActionQueue.add(TAInstallPipe:new(playerObj, ACSquare))
    end
end

function TimedRemovePipe (playerObj, ACSquare)
    if luautils.walkAdj(playerObj, ACSquare) then
        ISTimedActionQueue.add(TARemovePipe:new(playerObj, ACSquare))
    end
end

function TimedPumpAttach (playerObj, square, object, orientation, fresh, fuel)
    if luautils.walkAdj(playerObj, square) then
        ISTimedActionQueue.add(TAAttachPump:new(playerObj, square, object, orientation, fresh, fuel))
    end
end

function TimedPumpTurnOn (playerObj, square, object, fresh, fuel)
    if luautils.walkAdj(playerObj, square) then
        ISTimedActionQueue.add(TATurnOnPump:new(playerObj, square, object, fresh, fuel))
    end
end

function TimedPumpTurnOff (playerObj, square, object, fresh, fuel)
    if luautils.walkAdj(playerObj, square) then
        ISTimedActionQueue.add(TATurnOffPump:new(playerObj, square, object, fresh, fuel))
    end
end

function TimedPumpRepair (playerObj, square, object)
    if luautils.walkAdj(playerObj, square) then
        ISTimedActionQueue.add(TARepairPump:new(playerObj, square, object))
    end
end

function TimedPumpDisassemble (playerObj, square, object)
    if luautils.walkAdj(playerObj, square) then
        ISTimedActionQueue.add(TADisassemblePump:new(playerObj, square, object))
    end
end


function TimedPumpAddFilter (playerObj, square, object, charcoal)
    if luautils.walkAdj(playerObj, square) then
        ISTimedActionQueue.add(TAAddFilterPump:new(playerObj, square, object, charcoal))
    end
end

function TimedPumpInfo (playerObj, square, object)
    if luautils.walkAdj(playerObj, square) then
        ISTimedActionQueue.add(TAInfoPump:new(playerObj, object))
    end
end

function TimedValveInfo (playerObj, square, object)
    if luautils.walkAdj(playerObj, square) then
        ISTimedActionQueue.add(TAinfoValve:new(playerObj, object))
    end
end

function TimedValveChange (playerObj, square, object, valveN)
    if luautils.walkAdj(playerObj, square) then
        ISTimedActionQueue.add(TAChangeValve:new(playerObj, square, object, valveN))
    end
end


--- pipes building logic
function AddPump (worldobjects, player, torchUse)

    local object = WPPumpFurniture:new("Water Pump", "industry_02_52", "industry_02_53");
    object.canPassThrough = false;
    object.noNeedHammer = true;
    object.buildLow = false;
    object.firstItem = "BlowTorch";
    object.secondItem = "WeldingMask";
    object.craftingBank = "BlowTorch";
    object.canBarricade = false;
    object.ignoreNorth = true;
    object.canBeAlwaysPlaced = true;
    object.isThumpable = true;
    object.modData["xp:MetalWelding"] = 20;
    object.modData["need:Base.MetalPipe"]= "1";
    object.modData["need:Base.SmallSheetMetal"]= "4";
    object.modData["need:Base.ScrapMetal"] = "4";
    object.modData["use:Base.BlowTorch"] = 6;
    object.player = player
    object.maxTime = 400;
    object.completionSound = "BuildMetalStructureSmall";
    getCell():setDrag(object, player);
end

function AddPipe (worldobjects, player, torchUse)

    local object = WPPipeFurniture:new("Water Pipe", "industry_02_32", "industry_02_33");
    object.canPassThrough = true;
    object.noNeedHammer = true;
    object.buildLow = true;
    -- object.firstItem = "BlowTorch";
    -- object.secondItem = "WeldingMask";
    -- object.craftingBank = "BlowTorch";
    object.actionAnim = "RemoveGrass"
    object.firstItem = "PipeWrench";
    object.craftingBank = "RepairWithWrench";
    object.canBarricade = false;
    object.ignoreNorth = true;
    object.canBeAlwaysPlaced = true;
    object.isThumpable = false;
    object.modData["xp:MetalWelding"] = 3;
    object.modData["need:Base.MetalPipe"]= "1";
    object.player = player
    object.maxTime = 200;
    object.completionSound = "BuildMetalStructureSmall";
    getCell():setDrag(object, player);
end

function AddTank (worldobjects, player, torchUse)

    local object = ISSimpleFurniture:new("Fuel Barrel", "industry_01_23", "industry_01_23");
    object.canPassThrough = true;
    object.noNeedHammer = true;
    object.buildLow = true;
    object.firstItem = "BlowTorch";
    object.secondItem = "WeldingMask";
    object.craftingBank = "BlowTorch";
    object.canBarricade = false;
    object.ignoreNorth = true;
    object.canBeAlwaysPlaced = true;
    object.isThumpable = false;
    object.modData["xp:MetalWelding"] = 7;
    object.modData["need:Base.SmallSheetMetal"]= "3";
    object.modData["use:Base.BlowTorch"] = 3;
    object.player = player
    object.maxTime = 300;
    object.completionSound = "BuildMetalStructureSmall";

    -- local object = WPQuadTileFurniture:new("Fuel Tank", "industry_02_73", "industry_02_75", "industry_02_74", "industry_02_72")

    getCell():setDrag(object, player);
end

function RemovePipe (square)
    local objects = square:getObjects()
    for i=0, objects:size()-1 do
        local object = objects:get(i)
        local objectName = object:getName()
        local sprite = object:getSprite()
        if sprite then
            local spriteName = sprite:getName()
            if IsPipe(spriteName) then
                if isClient() then
                    sledgeDestroy(object);
                else
                    object:getSquare():transmitRemoveItemFromSquare(object)
                end

                local item = "Base.MetalPipe"
                square:AddWorldInventoryItem(item, ZombRandFloat(0.2, 0.8), ZombRandFloat(0.2, 0.8), 0)

            end
        end
    end

    local sx = square:getX()
    local sy = square:getY()
    local sz = square:getZ()
    FixPipeSprites(sx, sy, sz)

end

function RegisterBarrels (sx, sy, sz)
    local cell = getCell()
    local square = cell:getGridSquare(sx, sy, sz)
    if square then
        local objects = square:getSpecialObjects()
        for i=0, objects:size()-1 do
            local object = objects:get(i)
            local sprite = object:getSprite()
            if sprite then
                local spriteName = sprite:getName()
                if IsBarrel(spriteName) or IsTank(spriteName) then
                    local vbarrel = Vsquare.GetBarrel (sx, sy, sz)
                    if not vbarrel then
                        Vsquare.AddBarrel(object)
                    end
                end
            end
        end
    end
end

function FixPipeSprites (sx, sy, sz)

    local cell = getCell()

    local testSquares = {}
    table.insert(testSquares, {x=sx-1, y=sy, z=sz})
    table.insert(testSquares, {x=sx+1, y=sy, z=sz})
    table.insert(testSquares, {x=sx, y=sy-1, z=sz})
    table.insert(testSquares, {x=sx, y=sy+1, z=sz})
    table.insert(testSquares, {x=sx, y=sy, z=sz})

    for k, coords in pairs(testSquares) do
        local testSquare = cell:getGridSquare(coords["x"], coords["y"], coords["z"])
        local objects = testSquare:getSpecialObjects();
        for i=0, objects:size()-1 do
            local object = objects:get(i)
            local sprite = object:getSprite()
            if sprite then
                local spriteName = sprite:getName()
                if IsPipe(spriteName) then
                    FixNeighboringPipeSprite(testSquare)
                end
            end
        end
    end
end

function DeterminePipeSprites(neighbours, neighboursUp)

    local newSprite = "industry_02_39"
    local extraSprite = nil

    if neighbours[1] and neighbours[2] and neighbours[3] and neighbours[4] then
        newSprite = "industry_02_39"
    elseif neighbours[1] and neighbours[3] and neighbours[4] then
        newSprite = "industry_02_28"
    elseif neighbours[1] and neighbours[2] and neighbours[4] then
        newSprite = "industry_02_29"
    elseif neighbours[2] and neighbours[3] and neighbours[4] then
        newSprite = "industry_02_30"
    elseif neighbours[1] and neighbours[2] and neighbours[3] then
        newSprite = "industry_02_31"
    elseif neighbours[3] and neighbours[4] then
        newSprite = "industry_02_32"
    elseif neighbours[1] and neighbours[2] then
        newSprite = "industry_02_33"
    elseif neighbours[2] and neighbours[3] then
        newSprite = "industry_02_24"
    elseif neighbours[2] and neighbours[4] then
        newSprite = "industry_02_25"
    elseif neighbours[1] and neighbours[4] then
        newSprite = "industry_02_26"
    elseif neighbours[1] and neighbours[3] then
        newSprite = "industry_02_27"
    elseif neighbours[1] and neighboursUp[2] then 
        newSprite = "industry_02_79"
        extraSprite = "industry_02_37"
    elseif neighbours[1] and not neighboursUp[2] then 
        newSprite = "industry_02_33"
    elseif neighbours[2] and neighboursUp[1] then
        newSprite = "industry_02_76"
        extraSprite = "industry_02_36"
    elseif neighbours[2] and not neighboursUp[1] then
        newSprite = "industry_02_33"
    elseif neighbours[3] and neighboursUp[4] then
        newSprite = "industry_02_78"
        extraSprite = "industry_02_38"
    elseif neighbours[3] and not neighboursUp[4] then
        newSprite = "industry_02_32"
    elseif neighbours[4] and neighboursUp[3] then
        newSprite = "industry_02_77"
        extraSprite = "industry_02_35"
    elseif neighbours[4] and not neighboursUp[3] then
        newSprite = "industry_02_32"
    -- else
        -- print "NO PIPES NEARBY"
    end

    return newSprite, extraSprite
end

function FixNeighboringPipeSprite (square)
    local sx = square:getX()
    local sy = square:getY()
    local sz = square:getZ()

    local cell = getCell()

    local testSquares = {}
    table.insert(testSquares, {x=sx-1, y=sy, z=sz})
    table.insert(testSquares, {x=sx+1, y=sy, z=sz})
    table.insert(testSquares, {x=sx, y=sy-1, z=sz})
    table.insert(testSquares, {x=sx, y=sy+1, z=sz})

    local neighbours = {false, false, false, false}
    local neighboursUp = {false, false, false, false}
    for z=0, 1 do
        for k, coords in pairs(testSquares) do
            local testX = coords["x"]
            local testY = coords["y"]
            local testZ = coords["z"] + z
            local testSquare = cell:getGridSquare(testX, testY, testZ)
            if testSquare then
                local objects = testSquare:getObjects();
                for i=0, objects:size()-1 do
                    local object = objects:get(i)
                    local sprite = object:getSprite()
                    if sprite then
                        local spriteName = sprite:getName()
                        if IsPipe(spriteName) or IsBarrel(spriteName) or IsTank(spriteName) then
                            if z == 0 then
                                neighbours[k] = true
                            else
                                neighboursUp[k] = true
                            end
                        end
                    end
                end
            end
        end
    end

    local newSprite
    local extraSprite
    newSprite, extraSprite = DeterminePipeSprites(neighbours, neighboursUp)

    if newSprite then
        local objects = square:getObjects();
        for i=0, objects:size()-1 do
            local object = objects:get(i)
            local sprite = object:getSprite()
            if sprite then
                local spriteName = sprite:getName()
                if IsPipe(spriteName) then
                    
                    --[[
                    if isClient() then
                        sledgeDestroy(object);
                    else
                        object:getSquare():transmitRemoveItemFromSquare(object)
                    end

                    local pipe = IsoObject.new(square:getCell(), square, getSprite(newSprite))
                    pipe:setWaterAmount(0)
                    square:AddSpecialObject(pipe)
                    pipe:transmitCompleteItemToServer()
                    Vsquare.AddPipe(pipe)
                    ]]--

                    local pipe = IsoObject.new(square:getCell(), square, getSprite(newSprite))
                    Vsquare.AddPipe(pipe)
                    object:setSpriteFromName(newSprite)
                    object:transmitUpdatedSpriteToServer()
                end
            end
        end
    end

    if extraSprite then
        local extraSquare = cell:getGridSquare(sx, sy, sz+1)
        local objects = extraSquare:getObjects();
        for i=0, objects:size()-1 do
            local object = objects:get(i)
            local sprite = object:getSprite()
            if sprite then 
                local spriteName = sprite:getName()
                if IsPipeExtra(spriteName) then
                    if isClient() then
                        sledgeDestroy(object);
                    else
                        object:getSquare():transmitRemoveItemFromSquare(object)
                    end
                end
            end
        end

        local extrapipe = IsoObject.new(extraSquare:getCell(), extraSquare, getSprite(extraSprite))
        extrapipe:setWaterAmount(0)
        extraSquare:AddSpecialObject(extrapipe)
        extrapipe:transmitCompleteItemToServer()
    end

    ConnectBuilding(square)
end

function ConnectBuilding(square)
    
    local sx = square:getX()
    local sy = square:getY()
    local sz = square:getZ()

    local cell = getCell()

    local adjacentSquares = {}
    table.insert(adjacentSquares, {x=sx+1, y=sy  })
    table.insert(adjacentSquares, {x=sx,   y=sy+1})
    table.insert(adjacentSquares, {x=sx-1, y=sy  })
    table.insert(adjacentSquares, {x=sx,   y=sy-1})

    for _, buildingsCoords in pairs(adjacentSquares) do
        local findBuildingSquare = cell:getGridSquare(buildingsCoords.x, buildingsCoords.y, sz)
        local building = findBuildingSquare:getBuilding()
        if building then
            local buildingDef = building:getDef()
            local x1 = buildingDef:getX()
            local y1 = buildingDef:getY()
            local x2 = buildingDef:getX2()
            local y2 = buildingDef:getY2()

            local vbuilding = Vsquare.GetBuilding(x1, y1)
            if not vbuilding or true then
                Vsquare.AddBuilding(building, buildingDef)

                for z=0, 8 do
                    for y=y1, y2 do
                        for x=x1, x2 do
                            vbarrel = Vsquare.GetBarrel(x, y, z)
                            if not vbarrel then
                                local scanSquare = cell:getGridSquare(x, y, z)
                                if scanSquare then
                                    local objects = scanSquare:getObjects()
                                    for i=0, objects:size()-1 do
                                        local object = objects:get(i)
                                        local sprite = object:getSprite()
                                        if sprite then
                                            local spriteName = sprite:getName()
                                            if IsBarrel(spriteName) then
                                                print ("found barrel at X:" .. x .. " Y:" .. y .. " Z:" .. z )
                                                Vsquare.AddBarrel(object)
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        --[[
        for i=0, objects:size()-1 do
            local object = objects:get(i)
            if IsWall(object) then
                print ("found WALL")
            end
        end
        ]]--
    end
end

-- for debug
function CheckWater(player, square)
    local objects = square:getObjects()
    for i=0, objects:size()-1 do
        local object = objects:get(i)
        local objectName = object:getName()
        local sprite = object:getSprite()
        local spriteName = sprite:getName()
        if IsPipe(spriteName) then
            local water = object:getWaterAmount()
            local waterMax = object:getWaterMax()
            local waterTainted = object:isTaintedWater()
            local waterExternal = object:getUsesExternalWaterSource()
            local thumpable = object:isMovedThumpable()
            local md = object:getModData()
            print ("WATER LEVEL: " .. water)
            print ("WATER LEVEL MAX: " .. waterMax)
            print (waterTainted)
            -- print ("USES EXTERNAL: " .. waterExternal)
            -- if (var3 instanceof IsoThumpable && (var3.getSprite() == null || !var3.getSprite().solidfloor) && !var3.getUsesExternalWaterSource() && var3.getWaterMax() > 0) {
        end
    end
end

function CheckWaterVirt(player, square)
    local x = square:getX()
    local y = square:getY()
    local z = square:getZ()

    local vpipe = Vsquare.GetPipe(x, y, z)
    if vpipe then
        print ("PIPE SHAPE: " .. vpipe.sh)
        print ("WATER LEVEL: " .. vpipe.w)
        print ("WATER TAINTED: " .. tostring(vpipe.wt))
        print ("FUEL LEVEL: " .. vpipe.f)
        print ("VALVES: " .. tostring(vpipe.vs))
    end

    local vbarrel = Vsquare.GetBarrel(x, y, z)
    if vbarrel then
        print ("BARREL NAME: " .. vbarrel.sh)
        print ("WATER LEVEL: " .. vbarrel.w)
        print ("WATER TAINTED: " .. tostring(vbarrel.wt))
        print ("FUEL LEVEL: " .. vbarrel.f)
    end

end

function AddFuel (playerObj, square, object)
    local test = object:getPipedFuelAmount()
    object:setPipedFuelAmount(100)
    local test2 = object:getPipedFuelAmount()
end

function PumpTurnOn (player, object, fresh, fuel)
    local x = object:getX()
    local y = object:getY()
    local z = object:getZ()

    -- manage physical pump
    object:setActivated(true)
    if isClient() then
        local args = {x=x, y=y, z=z, st=true}
        sendClientCommand(player, 'wp_commands', 'toggle', args)
    end

    WPEmmiters.AddEmitter(x, y, z)

    -- manage virtual pump 
    Vsquare.TogglePump(x, y, z, true, fresh, fuel)
end

function PumpTurnOff (player, object, fresh, fuel)
    local x = object:getX()
    local y = object:getY()
    local z = object:getZ()

    -- manage physical pump
    object:setActivated(false)
    if isClient() then
        local args = {x=x, y=y, z=z, st=false}
        sendClientCommand(player, 'wp_commands', 'toggle', args)
    end

    WPEmmiters.RemoveEmitter(x, y, z)

    object:getSquare():playSound("WaterPumpStop")

    -- manage virtual pump 
    Vsquare.TogglePump(x, y, z, false, fresh, fuel)
end

function WaterPiperOnObjectAboutToBeRemoved(object)
    
    local sprite = object:getSprite()
    local spriteName = sprite:getName()
    if IsPipe(spriteName) or IsWall(object) then
        Vsquare.RemovePipe(object)
    elseif IsBarrel(spriteName) or IsTank(spriteName) then
        Vsquare.RemoveBarrel(object)
    elseif IsPump(spriteName) then
        Vsquare.RemovePump(object)
    end
end

function FixEmitters()
    if isServer() then return end
        
    local globalModData = GetWaterPipingModData()
    local cell = getCell()
    
    for k, v in pairs(globalModData.DWorkingPumps) do 
        local x = v["x"]
        local y = v["y"]
        local z = v["z"]
        local st = v["st"]

        if st then
            WPEmmiters.AddEmitter(x, y, z)
        else
            WPEmmiters.RemoveEmitter(x, y, z)
        end
    end
end

-- ui
function PipeMapUI(player)
    local ui = ISWPUI:new(0, 0, 620, 650, player);
    ui:initialise();
    ui:addToUIManager();
end

--- context menus
function WaterPipesWorldContextMenuPre(player, context, worldobjects, test)

    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    local square = clickedSquare
    local world = getWorld()

    if square then

        local objects = square:getSpecialObjects();
        for i=0, objects:size()-1 do
            local object = objects:get(i);

            -- PUMP MENU
            local hasFreshWaterAccess = HasFreshWaterAccess(square)
            local hasWaterAccess = HasWaterAccess(square)
            local hasFuelAccess = HasFuelAccess(square)
            local hasBarrelAccess = HasBarrelAccess(square)
            local orientation = DetectOrientationPump(object)

            if IsUnAttachedPump(object) then
                if hasFreshWaterAccess then
                    context:addOption(getText("ContextMenu_WP_AttachWater"), playerObj, TimedPumpAttach, square, object, orientation, true, false)
                end
                if hasWaterAccess or hasBarrelAccess then 
                    context:addOption(getText("ContextMenu_WP_AttachWater") .. " (" .. getText("Tooltip_tainted") .. ")", playerObj, TimedPumpAttach, square, object, orientation, false, false)
                end
                if hasFuelAccess then 
                    context:addOption(getText("ContextMenu_WP_AttachFuel"), playerObj, TimedPumpAttach, square, object, orientation, false, true)
                end
            end

            if IsAttachedPump(object) then

                local efficiencyStatus = 100
                local vpump = Vsquare.GetPump(object:getX(), object:getY(), object:getZ())
                if vpump then
                    efficiencyStatus = vpump['ef']
                else
                    -- fix missing pump from unknown reason
                    Vsquare.AddPump(object, 100, hasFreshWaterAccess, hasFuelAccess)
                end

                -- TURN ON / OFF
                if object:isActivated() then
                    local optionPumpTurnOff = context:addOption(getText("ContextMenu_Turn_Off"), playerObj, TimedPumpTurnOff, square, object, hasFreshWaterAccess, hasFuelAccess)
                else
                    local optionPumpTurnOn = context:addOption(getText("ContextMenu_Turn_On"), playerObj, TimedPumpTurnOn, square, object, hasFreshWaterAccess, hasFuelAccess)
                    if efficiencyStatus == 0 then
                        local tooltipTurnOn = ISToolTip:new()
                        tooltipTurnOn.description = getText("Tooltip_WP_ThePumpIsWornOut")
                        optionPumpTurnOn.notAvailable = true
                        optionPumpTurnOn.toolTip = tooltipTurnOn
                    end
                    
                    if not square:haveElectricity() then
                        local tooltipTurnOn = ISToolTip:new()
                        tooltipTurnOn.description = getText("Tooltip_WP_NeedsPowerToOperate")
                        optionPumpTurnOn.notAvailable = true
                        optionPumpTurnOn.toolTip = tooltipTurnOn
                    end
                end

                -- REPAIRS
                if not object:isActivated() and efficiencyStatus < 100 then
                    local newEf = playerObj:getPerkLevel(Perks.MetalWelding) * 10
                    local scrapMetal = playerObj:getInventory():getFirstTypeRecurse("ScrapMetal")
                    local optionRepair = context:addOption(getText("ContextMenu_WP_FixPump"), playerObj, TimedPumpRepair, square, object)
                    if efficiencyStatus >= newEf then
                        local tooltipRepair = ISToolTip:new()
                        tooltipRepair.description = getText("Tooltip_WP_MetalworkingSkillTooLow")
                        optionRepair.notAvailable = true
                        optionRepair.toolTip = tooltipRepair
                    elseif not scrapMetal then    
                        local tooltipRepair = ISToolTip:new()
                        tooltipRepair.description = getText("Tooltip_WP_NeedsScrapMetal")
                        optionRepair.notAvailable = true
                        optionRepair.toolTip = tooltipRepair
                    end
                        
                end

                -- DISASSEMBLE
                if not object:isActivated() then
                    local torch = playerObj:getInventory():getFirstTypeRecurse("BlowTorch")
                    local mask = playerObj:getInventory():getFirstTypeRecurse("WeldingMask")
                    local optionDisassemble = context:addOption(getText("ContextMenu_WP_DisassemblePump"), playerObj, TimedPumpDisassemble, square, object)
                    if not mask or not torch then

                        local tooltipDisassemble = ISToolTip:new()
                        local d = ""
                        d = d .. getText("Tooltip_WP_Requires") .. " <LINE>"

                        if not torch then
                            d = d .. "<RGB:1,0,0> " .. getText("Tooltip_WP_BlowTorch") .. " <LINE>"
                        end
                        if not mask then
                            d = d .. "<RGB:1,0,0> " .. getText("Tooltip_WP_WeldingMask") .. " <LINE>"
                        end
                        tooltipDisassemble.description = d
                        optionDisassemble.notAvailable = true
                        optionDisassemble.toolTip = tooltipDisassemble
                    end
                end

                -- ADD FILTER
                local charcoal = playerObj:getInventory():getFirstTypeRecurse("Charcoal")
                local optionCharcoal = context:addOption(getText("ContextMenu_WP_AddCharcoal"), playerObj, TimedPumpAddFilter, square, object, charcoal)
                if not charcoal then    
                    local tooltipCharcoal = ISToolTip:new()
                    tooltipCharcoal.description = getText("Tooltip_WP_NeedsCharcoal")
                    optionCharcoal.notAvailable = true
                    optionCharcoal.toolTip = tooltipCharcoal
                end

                -- PUMP INFO
                local tooltipPump = ISToolTip:new()
                tooltipPump:setName(getText("ContextMenu_WP_PumpInfo"))
                tooltipPump.description = ISWaterPumpInfoWindow.getRichText(object)

                local optionPumpInfo = context:addOption(getText("ContextMenu_WP_PumpInfo"), playerObj, TimedPumpInfo, square, object)
                optionPumpInfo.toolTip = tooltipPump
            end

            -- FUEL TANK MENU
            if TankIsOnSquare(square) then
                local tank = GetTankFromSquare(square)
                if tank then
                    local subMenuFuelTank = context:getNew(context)
                    local optionFuelTank = context:addOption(getText("ContextMenu_WP_FuelTank"))
                    context:addSubMenu(optionFuelTank, subMenuFuelTank)

                    -- local optionPourOnGround = subMenuFuelTank:addOption(getText("ContextMenu_Pour_on_Ground"), playerObj, TimedEmptyTank, tank)

                    local tooltip = ISToolTip:new()
                    tooltip:setName(getText("ContextMenu_WP_FuelTank"))
                    local tx = getTextManager():MeasureStringX(tooltip.font, getText("ContextMenu_WP_FuelTank") .. ":") + 20
                    tooltip.description = string.format("%s: <SETX:%d> %d / %d", getText("ContextMenu_WP_Fuel"), tx, tank:getPipedFuelAmount(), 400)
                    tooltip.maxLineWidth = 512
                    optionFuelTank.toolTip = tooltip
                    
                    -- normally square must have power to take fuel, games assumes it must be a fuel pump
                    -- here we want to fix this, so if there is no power add option for barrel
                    if not square:haveElectricity() then
                        ISWorldObjectContextMenu.doFillFuelMenu(tank, player, context);
                    end

                end

            end

            -- if TanklIsOnSquare(square) then
            --     context:addOption("[DBG] Add fuel", playerObj, AddFuel, square, object)
            -- end

            -- VALVES
            if ValveIsOnSquare(square) then
                
                local valve = Vsquare.GetPipe(object:getX(), object:getY(), object:getZ())
                local sprite = object:getSprite()
                local spriteName = sprite:getName()

                if valve and IsPipe(spriteName) then 
                    
                    --- VALVE INFO
                    local tooltipValve = ISToolTip:new()
                    tooltipValve:setName(getText("ContextMenu_WP_ValveInfo"))
                    tooltipValve.description = ISValveInfoWindow.getRichText(object)

                    local optionValveInfo = context:addOption(getText("ContextMenu_WP_ValveInfo"), playerObj, TimedValveInfo, square, object)
                    optionValveInfo.toolTip = tooltipValve

                    --- VALVE CHANGE
                    local vs = decToBooleans(valve.vs)

                    local valves = {}
                    table.insert(valves, {notsprite="industry_02_30", vs=vs[1], name=getText("ContextMenu_WP_ChangeWest")})
                    table.insert(valves, {notsprite="industry_02_31", vs=vs[2], name=getText("ContextMenu_WP_ChangeSouth")})
                    table.insert(valves, {notsprite="industry_02_29", vs=vs[3], name=getText("ContextMenu_WP_ChangeNorth")})
                    table.insert(valves, {notsprite="industry_02_28", vs=vs[4], name=getText("ContextMenu_WP_ChangeEast")})

                    local optionValveChange = context:addOption(getText("ContextMenu_WP_ChangeValves"))
                    local subMenuValves = context:getNew(context)
                    context:addSubMenu(optionValveChange, subMenuValves)

                    for k, v in pairs(valves) do
                        if spriteName ~= v.notsprite then
                            local optionValve = subMenuValves:addOption(v.name .. " " .. getText("ContextMenu_WP_Valve"))
                            local subMenuValve = context:getNew(context)
                            context:addSubMenu(optionValve, subMenuValve)

                            local txt = ""
                            if v.vs then 
                                txt = getText("ContextMenu_WP_ValveModeTwo")
                            else
                                txt = getText("ContextMenu_WP_ValveModeOne")
                            end
                            subMenuValve:addOption(txt, playerObj, TimedValveChange, square, object, k)
                        end
                    end
                end
            end
        end

        if BarrelIsOnSquare(square) then
            RegisterBarrels(square:getX(), square:getY(), square:getZ())
        end
        
        if PipeIsOnSquare(square) and playerInv:getFirstTypeRecurse("PipeWrench") then
            context:addOption(getText("ContextMenu_WP_RemovePipe"), playerObj, TimedRemovePipe, square)
        end

        if isDebugEnabled() and PipeIsOnSquare(square) then
            context:addOption("[DBG] Check pipe (virtual)", playerObj, CheckWaterVirt, square)
        end

        if isDebugEnabled() and BarrelIsOnSquare(square) then
            context:addOption("[DBG] Check barrel (virtual)", playerObj, CheckWaterVirt, square)
        end
        if isDebugEnabled() then
            context:addOption("[DBG] Pipe Map", playerObj, PipeMapUI)
        end
    end
end

function WaterPipesWorldContextMenuPost(player, context, worldobjects, test)

    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()

    local pipingOption = context:addOption(getText("ContextMenu_WP_Plumbing"), worldobjects, nil)

    if (playerObj:isRecipeKnown("Make Metal Containers")) or ISBuildMenu.cheat then
        
        local subMenuPiping = context:getNew((context))
        context:addSubMenu(pipingOption, subMenuPiping)

        local skillList = {}
        local materialList = {}
        skillList.metalwelding = 2
        materialList.metalPipes = 1
        materialList.pipeWrench = 1
        
        local pipeOption = subMenuPiping:addOption(getText("ContextMenu_WP_WaterPipe"), worldobjects, AddPipe, player, "2")
        local toolTip = ISPlumbingMenu.addToolTip(pipeOption, getText("ContextMenu_WP_WaterPipe"), "industry_02_39")
        local canDo, toolTip = ISPlumbingMenu.checkPlumbingFurnitures(playerObj, toolTip, materialList, skillList)
        if not canDo then pipeOption.notAvailable = true; end

        local skillList = {}
        local materialList = {}
        skillList.metalwelding = 5
        materialList.metalPipes = 1
        materialList.smallMetalSheet = 4
        materialList.scrapMetal = playerObj:getPerkLevel(Perks.MetalWelding)
        materialList.torchUse = 6
        materialList.weldingMask = 1

        local pumpOption = subMenuPiping:addOption(getText("ContextMenu_WP_WaterPump"), worldobjects, AddPump, player, "6")
        local toolTip = ISPlumbingMenu.addToolTip(pumpOption, getText("ContextMenu_WP_WaterPump"), "industry_02_52")
        local canDo, toolTip = ISPlumbingMenu.checkPlumbingFurnitures(playerObj, toolTip, materialList, skillList)
        if not canDo then pumpOption.notAvailable = true; end

        local skillList = {}
        local materialList = {}
        skillList.metalwelding = 4
        materialList.smallMetalSheet = 3
        materialList.torchUse = 3
        materialList.weldingMask = 1

        local fuelTankOption = subMenuPiping:addOption(getText("ContextMenu_WP_FuelTank"), worldobjects, AddTank, player, "6")
        local toolTip = ISPlumbingMenu.addToolTip(fuelTankOption, getText("ContextMenu_WP_FuelTank"), "industry_01_23")
        local canDo, toolTip = ISPlumbingMenu.checkPlumbingFurnitures(playerObj, toolTip, materialList, skillList)
        if not canDo then fuelTankOption.notAvailable = true; end

    --[[else
        pipingOption.notAvailable = true
        local tooltipPiping = ISToolTip:new()
        -- tooltipPiping:setName("Piping")
        local d = ""
        d = d .. getText("Tooltip_WP_Requires") .. " <LINE>"

        if not playerInv:containsTypeRecurse("BlowTorch") then
            d = d .. "<RGB:1,0,0> " .. getText("Tooltip_WP_BlowTorch") .. " <LINE>"
        end
        if not playerInv:containsTypeRecurse("WeldingMask") then
            d = d .. "<RGB:1,0,0> " .. getText("Tooltip_WP_WeldingMask") .. " <LINE>"
        end
        if not playerObj:isRecipeKnown("Make Metal Containers") then
            d = d .. "<RGB:1,0,0> " .. getText("Tooltip_WP_MetalworkMag2") .. " <LINE>"
        end
        tooltipPiping.description = d
        pipingOption.toolTip = tooltipPiping;]]
    end

end



Events.OnPreFillWorldObjectContextMenu.Add(WaterPipesWorldContextMenuPre)
Events.OnFillWorldObjectContextMenu.Add(WaterPipesWorldContextMenuPost)
-- Events.OnFillWorldObjectContextMenu.Add(ISBlacksmithMenu.doBuildMenu)
Events.OnObjectAboutToBeRemoved.Add(WaterPiperOnObjectAboutToBeRemoved)
Events.EveryTenMinutes.Add(FixEmitters)
Events.OnGameStart.Add(FixEmitters)
--


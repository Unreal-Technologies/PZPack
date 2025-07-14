require "wp_gmd"
require "wp_utils"

WPServer = {}
WPServer.wp_commands = {}

-- local 
local function findClothingDryer(x, y, z)
    local gs = getCell():getGridSquare(x, y, z)
    if not gs then return nil end
    for i=1,gs:getObjects():size() do
        local obj = gs:getObjects():get(i-1)
        if obj and instanceof(obj, 'IsoClothingDryer') then
            return obj
        end
    end
    printd ('no clothing dryer at '..x..','..y..','..z)
    return nil
end

local function findObjectBySprite(x, y, z, sp)
    local gs = getCell():getGridSquare(x, y, z)
    if not gs then return nil end
    for i=1,gs:getObjects():size() do
        local obj = gs:getObjects():get(i-1)
        local sprite = obj:getSprite()
        local spriteName = sprite:getName()
        if spriteName == sp then
            return obj
        end
    end
    printd ('no object with sprite name ' .. sp .. ' found at '..x..','..y..','..z)
    return nil
end

-- physical objects

WPServer.wp_commands.print = function(player, args)
    printd (" ----  SERVER PRINT ----")
end

WPServer.wp_commands.toggle = function(player, args)
    local object = findClothingDryer(args.x, args.y, args.z)
    if not object then return end

    object:setActivated(args.st)
    object:sendObjectChange("dryer.state")
end

WPServer.wp_commands.adjustwater = function(player, args)

    local object = findObjectBySprite(args.x, args.y, args.z, args.sp)
    if not object then return end
    object:setWaterAmount(args.w)
    object:setTaintedWater(args.wt)
    object:transmitModData()

end

-- virtual objects

WPServer.wp_commands.addpump = function(player, args)
    local globalModData = GetWaterPipingModData()
    local k = Coords2Id(args.x, args.y, args.z)
    globalModData.DWorkingPumps[k] = args
end

WPServer.wp_commands.removepump = function(player, args)
    local globalModData = GetWaterPipingModData()
    local k = Coords2Id(args.x, args.y, args.z)
    globalModData.DWorkingPumps[k] = nil
end

WPServer.wp_commands.modifypump = function(player, args)
    local globalModData = GetWaterPipingModData()
    local k = Coords2Id(args.x, args.y, args.z)
    globalModData.DWorkingPumps[k] = args
end

WPServer.wp_commands.addbuilding = function(player, args)
    local globalModData = GetWaterPipingModData()
    local k = Coords2Id(args.x1, args.y1, 0)
    globalModData.DBuildings[k] = args
end

WPServer.wp_commands.addbarrel = function(player, args)
    local globalModData = GetWaterPipingModData()
    local k = Coords2Id(args.x, args.y, args.z)
    globalModData.DBarrels[k] = args
end

WPServer.wp_commands.removebarrel = function(player, args)
    local globalModData = GetWaterPipingModData()
    local k = Coords2Id(args.x, args.y, args.z)
    globalModData.DBarrels[k] = nil
end

WPServer.wp_commands.modifybarrel = function(player, args)
    local globalModData = GetWaterPipingModData()
    local k = Coords2Id(args.x, args.y, args.z)
    globalModData.DBarrels[k] = args
end

WPServer.wp_commands.addpipe = function(player, args)
    local globalModData = GetWaterPipingModData()
    local k = Coords2Id(args.x, args.y, args.z)
    globalModData.DPipes[k] = args
end

WPServer.wp_commands.removepipe = function(player, args)
    local globalModData = GetWaterPipingModData()
    local k = Coords2Id(args.x, args.y, args.z)
    globalModData.DPipes[k] = nil
end

WPServer.wp_commands.modifypipe = function(player, args)
    local globalModData = GetWaterPipingModData()
    local k = Coords2Id(args.x, args.y, args.z)
    globalModData.DPipes[k] = args
end

-- main
local onWaterPipesClientCommand = function(module, command, player, args)
    if WPServer[module] and WPServer[module][command] then
        local argStr = ""
        for k, v in pairs(args) do
            argStr = argStr .. " " .. k .. "=" .. tostring(v)
        end
        printd ("received " .. module .. "." .. command .. " "  .. argStr)
        WPServer[module][command](player, args)
        TransmitWaterPipingModData()
    end
end

print ("-------------------------------")
print ("--- waterpipes server ready ---")
print ("-------------------------------")

Events.OnClientCommand.Add(onWaterPipesClientCommand)


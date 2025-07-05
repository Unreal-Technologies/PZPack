-- **************************************************
-- ██████  ██████   █████  ██    ██ ███████ ███    ██ 
-- ██   ██ ██   ██ ██   ██ ██    ██ ██      ████   ██ 
-- ██████  ██████  ███████ ██    ██ █████   ██ ██  ██ 
-- ██   ██ ██   ██ ██   ██  ██  ██  ██      ██  ██ ██ 
-- ██████  ██   ██ ██   ██   ████   ███████ ██   ████
-- **************************************************

local RemoveResources = function(playerObj, args)
    local cell = playerObj:getCell()
	local sq = cell:getGridSquare(args.square.x, args.square.y, args.square.z)
    if not sq then return end

    local objs = sq:getObjects()
    for n = objs:size() -1, 0, -1 do

        local obj = objs:get(n)
        if instanceof(obj, "IsoObject") then
            local sprite =  obj:getSprite()
            if sprite then
                local spriteName = sprite:getName()
                if spriteName then
                    if spriteName == args.spriteName then
                        sledgeDestroy(obj)
                        sq:transmitRemoveItemFromSquare(obj)
                    end
                end
            end
        end
    end
end

local function onClientCommand(module, command, playerObj, args)
    if module ~= "ObviousCollecting" then return end

    if command == "RemoveResources" then
        RemoveResources(playerObj, args)
    end
end

Events.OnClientCommand.Add(onClientCommand)
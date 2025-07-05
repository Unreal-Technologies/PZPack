-- **************************************************
-- ██████  ██████   █████  ██    ██ ███████ ███    ██ 
-- ██   ██ ██   ██ ██   ██ ██    ██ ██      ████   ██ 
-- ██████  ██████  ███████ ██    ██ █████   ██ ██  ██ 
-- ██   ██ ██   ██ ██   ██  ██  ██  ██      ██  ██ ██ 
-- ██████  ██   ██ ██   ██   ████   ███████ ██   ████
-- **************************************************
-- OVERRIDE FOR THIS SPECIFIC MOD

Utils_WriteOnWorld = {}

Utils_WriteOnWorld.TableContains = function(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

Utils_WriteOnWorld.DistanceBetween = function(firstObj, secondObj)
    local x1, y1, z1 = firstObj:getX(), firstObj:getY(), firstObj:getZ()
    local x2, y2, z2 = secondObj:getX(), secondObj:getY(), secondObj:getZ()

    local dx = x1 - x2
    local dy = y1 - y2
    local dz = z1 - z2

    if dz >= 2 then
        return 999
    end

    local distance = math.sqrt(dx * dx + dy * dy)
    return distance
end
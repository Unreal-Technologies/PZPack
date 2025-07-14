pumpSprites = {}
table.insert(pumpSprites, "industry_02_52") -- pump
table.insert(pumpSprites, "industry_02_53") -- pump

pipeSprites = {}
table.insert(pipeSprites, "industry_02_24") -- corner
table.insert(pipeSprites, "industry_02_25") -- corner
table.insert(pipeSprites, "industry_02_26") -- corner
table.insert(pipeSprites, "industry_02_27") -- corner
table.insert(pipeSprites, "industry_02_28") -- T-shape NE to SE + NW
table.insert(pipeSprites, "industry_02_29") -- T-shape NW to SE + SW
table.insert(pipeSprites, "industry_02_30") -- T-shape NE to SW + SE
table.insert(pipeSprites, "industry_02_31") -- T-shape NW to SE + NE
table.insert(pipeSprites, "industry_02_32") -- straight NE to SW
table.insert(pipeSprites, "industry_02_33") -- straight NW to SE
table.insert(pipeSprites, "industry_02_39") -- cross
table.insert(pipeSprites, "industry_02_76") -- up, x axis, east down, west up
table.insert(pipeSprites, "industry_02_77") -- up, y axis, north up, south down
table.insert(pipeSprites, "industry_02_78") -- up, y axis, north down, south up
table.insert(pipeSprites, "industry_02_79") -- up, x axis, east up, west down

table.insert(pipeSprites, "industry_02_72") -- tank part acting as pipe (x-1)
table.insert(pipeSprites, "industry_02_75") -- tank part acting as pipe (y-1)
table.insert(pipeSprites, "industry_02_74") -- tank part acting as pipe (x-1)(y-1)

pipeExtraSprites = {}
table.insert(pipeExtraSprites, "industry_02_35") 
table.insert(pipeExtraSprites, "industry_02_36")
table.insert(pipeExtraSprites, "industry_02_37")
table.insert(pipeExtraSprites, "industry_02_38")

barrelSprites = {}
table.insert(barrelSprites, "carpentry_02_52")
table.insert(barrelSprites, "carpentry_02_53")
table.insert(barrelSprites, "carpentry_02_54")
table.insert(barrelSprites, "carpentry_02_55")


for i=0, 11 do
    table.insert(barrelSprites, "fixtures_bathroom_01_" .. i)
end

table.insert(barrelSprites, "fixtures_bathroom_01_25")
table.insert(barrelSprites, "fixtures_bathroom_01_26")
table.insert(barrelSprites, "fixtures_bathroom_01_32")
table.insert(barrelSprites, "fixtures_bathroom_01_33")
table.insert(barrelSprites, "fixtures_bathroom_01_52")
table.insert(barrelSprites, "fixtures_bathroom_01_54")
table.insert(barrelSprites, "fixtures_bathroom_01_55")
table.insert(barrelSprites, "fixtures_bathroom_02_4")
table.insert(barrelSprites, "fixtures_bathroom_02_5")
table.insert(barrelSprites, "fixtures_bathroom_02_14")
table.insert(barrelSprites, "fixtures_bathroom_02_15")

for i=0, 35 do
    table.insert(barrelSprites, "fixtures_sinks_01_" .. i)
end

for i=0, 7 do
    table.insert(barrelSprites, "appliances_laundry_01_" .. i)
end

table.insert(barrelSprites, "industry_02_73") -- bottom corner of water tank, the only way to connect tank to pipe

tankSprites = {}
table.insert(tankSprites, "industry_01_23") 
-- table.insert(tankSprites, "industry_02_72") 
-- table.insert(tankSprites, "industry_02_73")
-- table.insert(tankSprites, "industry_02_74")
-- table.insert(tankSprites, "industry_02_75")

waterSprites = {}
table.insert(waterSprites, "blends_natural_02_0")
table.insert(waterSprites, "blends_natural_02_5")
table.insert(waterSprites, "blends_natural_02_6")
table.insert(waterSprites, "blends_natural_02_7")

freshWaterSprites = {}
table.insert(freshWaterSprites, "camping_01_16") -- well
table.insert(freshWaterSprites, "morebuild_01_0") -- well morebuild

fuelStationSprites = {}
table.insert(fuelStationSprites, "location_shop_gas2go_01_12")
table.insert(fuelStationSprites, "location_shop_gas2go_01_13")
table.insert(fuelStationSprites, "location_shop_gas2go_01_14")
table.insert(fuelStationSprites, "location_shop_gas2go_01_15")
table.insert(fuelStationSprites, "location_shop_fossoil_01_12")
table.insert(fuelStationSprites, "location_shop_fossoil_01_13")
table.insert(fuelStationSprites, "location_shop_fossoil_01_14")
table.insert(fuelStationSprites, "location_shop_fossoil_01_15")

function printd (txt)
    if isDebugEnabled() then print (txt) end
    -- print (txt)
end

function Coords2Id (x, y, z)
    local id = x .. "-" .. y .. "-" .. z
    return id
end

function Id2Coords (inputstr)

    local t = {}
    for str in string.gmatch(inputstr, "([^-]+)") do
            table.insert(t, str)
    end
    return tonumber(t[1]), tonumber(t[2]), tonumber(t[3])
end

function splitIntToParts(num, parts)
  
    local ret = {}
    local rem = num % parts
    local div = (num - rem) / parts

    for i=1, parts do
        if i > parts - rem then
            table.insert(ret, div+1)
        else
            table.insert(ret, div)  
        end
    end
    return ret
end

function decToBooleans(dec)
    -- convert 4-bit number to 4 booleans
    if not dec then dec = 0 end
    states = {false, false, false, false}
    for k=1, 4 do
        local t = (2^(4-k))
        if dec - t >= 0 then
            states[k] = true
            dec = dec - t
        end
    end
    return states
end

function booleansToDec(states)
    -- convert 4 booleans to 4-bit dec number 
    local dec = 0
    for k, v in pairs(states) do
        if v then
            dec = dec + math.floor(2^(4-k))
        end
    end
    return dec
end

function getTextColor (v)
    if v <= 10 then
        return " <RGB:1,0,0> "
    elseif v <= 50 then
        return " <RGB:1,1,0> "
    else
        return " <RGB:0,1,0> "
    end
end

function GetPipeFromSquare (square)
    local objects = square:getSpecialObjects()
    for i=0, objects:size()-1 do
        local object = objects:get(i)
        local sprite = object:getSprite()
        if sprite then
            local spriteName = sprite:getName()
            if IsPipe(spriteName) or IsPipeExtra(spriteName) then
                return object
            end
        end
    end
    return false
end

function GetBarrelFromSquare (square)
    local objects = square:getObjects() -- not moved obj are not special
    for i=0, objects:size()-1 do
        local object = objects:get(i)
        local sprite = object:getSprite()
        if sprite then
            local spriteName = sprite:getName()
            if IsBarrel(spriteName) then
                return object
            end
        end
    end
    return false
end

function GetPumpFromSquare (square)
    local objects = square:getSpecialObjects()
    for i=0, objects:size()-1 do
        local object = objects:get(i)
        local sprite = object:getSprite()
        if sprite then
            local spriteName = sprite:getName()
            if IsPump(spriteName) then
                return object
            end
        end
    end
    return false
end

function GetWaterFromSquare (square)
    local objects = square:getObjects()
    for i=0, objects:size()-1 do
        local object = objects:get(i)
        local sprite = object:getSprite()
        if sprite then
            local spriteName = sprite:getName()
            if IsWater(spriteName) then
                return object
            end
        end
    end
    return false
end

function GetTankFromSquare (square)
    local objects = square:getSpecialObjects()
    for i=0, objects:size()-1 do
        local object = objects:get(i)
        local sprite = object:getSprite()
        if sprite then
            local spriteName = sprite:getName()
            if IsTank(spriteName) then
                return object
            end
        end
    end
    return false
end

function GetFurrowFromSquare (square)
    local objects = square:getSpecialObjects()
    for i=0, objects:size()-1 do
        local object = objects:get(i)
        local sprite = object:getSprite()
        if sprite then
            local spriteName = sprite:getName()
            if IsFurrow(object) then
                return object
            end
        end
    end
    return false
end

function IsPump (spriteName)
    for k, pumpSprite in pairs(pumpSprites) do
        if spriteName == pumpSprite then
            return true
        end
    end
    return false
end

function IsPipe (spriteName)
    for k, pipeSprite in pairs(pipeSprites) do
        if spriteName == pipeSprite then
            return true
        end
    end
    for k, pipeSprite in pairs(pipeSprites) do
        if spriteName == pipeSprite then
            return true
        end
    end
    return false
end

function IsPipeExtra (spriteName)
    for k, pipeSprite in pairs(pipeExtraSprites) do
        if spriteName == pipeSprite then
            return true
        end
    end
    return false
end

function IsBarrel (spriteName)
    for k, barrelSprite in pairs(barrelSprites) do
        if spriteName == barrelSprite then
            return true
        end
    end
    return false
end

function IsTank (spriteName)
    for k, tankSprite in pairs(tankSprites) do
        if spriteName == tankSprite then
            return true
        end
    end
    return false
end

function IsFurrow (object)
    local md = object:getModData()
    if md["typeOfSeed"] and md["waterNeeded"] > 0 then
        return true
    else
        return false
    end
end

function IsWater (spriteName)
    for k, waterSprite in pairs(waterSprites) do
        if spriteName == waterSprite then
            return true
        end
    end
    return false
end

function IsFreshWater (spriteName)
    for k, freshWaterSprite in pairs(freshWaterSprites) do
        if spriteName == freshWaterSprite then
            return true
        end
    end
    return false
end

function IsFuelStation (spriteName)
    for k, fuelStationSprite in pairs(fuelStationSprites) do
        if spriteName == fuelStationSprite then
            return true
        end
    end
    return false
end

function IsWall(object)
    
    local wall = false
    local test = {"WallN", "WallW", "WallSE", "WallNW"}
    
    for k, v in pairs(test) do
        if object:getProperties():Is(v) then
            wall = true
            break
        end
    end
    return wall
end

function IsPipeType (spriteName, pipeType)

    local k_min = 1
    local k_max = 11
    if pipeType == "CORNER" then
        k_min = 1
        k_max = 4
    elseif pipeType == "TSHAPE" then
        k_min = 5
        k_max = 8
    elseif pipeType == "STRAIGHT" then
        k_min = 9
        k_max = 10
    elseif pipeType == "CROSS" then
        k_min = 11
        k_max = 11
    end

    for k, pipeSprite in pairs(pipeSprites) do
        if spriteName == pipeSprite and k>=k_min and k<=k_max then
            return true
        end
    end
    return false
end

function PipeIsOnSquare (square)
    local objects = square:getSpecialObjects()
    for i=0, objects:size()-1 do
        local object = objects:get(i)
        local sprite = object:getSprite()
        if sprite then
            local spriteName = sprite:getName()
            if IsPipe(spriteName) then
                return true
            end
        end
    end
    return false
end


function ValveIsOnSquare (square)
    local objects = square:getSpecialObjects()
    for i=0, objects:size()-1 do
        local object = objects:get(i)
        local sprite = object:getSprite()
        if sprite then
            local spriteName = sprite:getName()
            if IsPipeType(spriteName, "CROSS") or IsPipeType(spriteName, "TSHAPE") then
                return true
            end
        end
    end
    return false
end

function BarrelIsOnSquare (square)
    local objects = square:getSpecialObjects()
    for i=0, objects:size()-1 do
        local object = objects:get(i)
        local sprite = object:getSprite()
        if sprite then
            local spriteName = sprite:getName()
            if IsBarrel(spriteName) then
                return true
            end
        end
    end
    return false
end

function TankIsOnSquare (square)
    local objects = square:getSpecialObjects()
    for i=0, objects:size()-1 do
        local object = objects:get(i)
        local sprite = object:getSprite()
        if sprite then
            local spriteName = sprite:getName()
            if IsTank(spriteName) then
                return true
            end
        end
    end
    return false
end

function IsAttachedPump (obj)
    local isAC = false
    local objName = obj:getObjectName()
    if objName == "ClothingDryer" then
        local sprite = obj:getSprite();
        if sprite then
            local objectSpriteName = sprite:getName();
            if objectSpriteName == "industry_02_52" or objectSpriteName == "industry_02_53" then
                isAC = true
            end
        end
    end
    return isAC
end

function IsUnAttachedPump (obj)
    local isAC = false
    local objName = obj:getObjectName()
    if objName ~= "ClothingDryer" then
        local sprite = obj:getSprite();
        if sprite then
            local objectSpriteName = sprite:getName();
            if objectSpriteName == "industry_02_52" or objectSpriteName == "industry_02_53" then
                isAC = true
            end
        end
    end
    return isAC
end

function DetectOrientationPump (obj)
    local sprite = obj:getSprite();
    local orientation = ""
    if sprite then
        local objectSpriteName = sprite:getName();
        if objectSpriteName == "industry_02_52" then
            orientation = "H"
        elseif objectSpriteName == "industry_02_53" then
            orientation = "V"
        end
    end
    return orientation
end

function GetLuaBarrel (sx, sy, sz)

    -- check neightbors
    local testSquares = {}
    table.insert(testSquares, {x=sx-1, y=sy})
    table.insert(testSquares, {x=sx+1, y=sy})
    table.insert(testSquares, {x=sx, y=sy-1})
    table.insert(testSquares, {x=sx, y=sy+1})

    for k, coords in pairs(testSquares) do
        local luaObject = SRainBarrelSystem.instance:getLuaObjectAt(coords["x"], coords["y"], sz)
        if luaObject then return luaObject end
    end
    return false
end

function GetSourceAccess (square)
    local sx = square:getX()
    local sy = square:getY()
    local sz = square:getZ()

    local cell = getCell()

    -- check neightbors
    local testSquares = {}
    table.insert(testSquares, {x=sx-1, y=sy})
    table.insert(testSquares, {x=sx+1, y=sy})
    table.insert(testSquares, {x=sx, y=sy-1})
    table.insert(testSquares, {x=sx, y=sy+1})

    for k, coords in pairs(testSquares) do
        local testSquare = cell:getGridSquare(coords["x"], coords["y"], sz)
        if testSquare then
            local objects = testSquare:getObjects();
            for i=0, objects:size()-1 do
                local object = objects:get(i)
                local sprite = object:getSprite()
                if sprite then 
                    local spriteName = sprite:getName()
                    if IsWater(spriteName) or IsFreshWater(spriteName) then 
                        return 10000, object
                    elseif IsFuelStation(spriteName) then
                        return 10000, object
                    elseif IsBarrel(spriteName) then
                        local water = object:getWaterAmount()
                        return water, object
                    end
                end
            end
        end
    end
end

function HasSourceAccess (square, type)
    local sx = square:getX()
    local sy = square:getY()
    local sz = square:getZ()

    local cell = getCell()

    -- check neightbors
    local testSquares = {}
    table.insert(testSquares, {x=sx-1, y=sy})
    table.insert(testSquares, {x=sx+1, y=sy})
    table.insert(testSquares, {x=sx, y=sy-1})
    table.insert(testSquares, {x=sx, y=sy+1})

    for k, coords in pairs(testSquares) do
        local testSquare = cell:getGridSquare(coords["x"], coords["y"], sz)
        if testSquare then
            local objects = testSquare:getObjects();
            for i=0, objects:size()-1 do
                local object = objects:get(i)
                local sprite = object:getSprite()
                if sprite then 
                    local spriteName = sprite:getName()
                    if type == "WATER" and IsWater(spriteName) then
                        return true
                    elseif type == "FRESH_WATER" and IsFreshWater(spriteName) then
                        return true
                    elseif type == "FUEL" and IsFuelStation(spriteName) then
                        return true
                    elseif type == "BARREL" and IsBarrel(spriteName) then
                        return true
                    elseif not type and (IsWater(spriteName) or IsFreshWater(spriteName) or IsFuelStation(spriteName) or IsBarrel(spriteName)) then -- any access
                        return true
                    end
                end
            end
        end
    end

    return false
end

function HasWaterAccess(square)
    return HasSourceAccess(square, "WATER")
end

function HasFreshWaterAccess(square)
    return HasSourceAccess(square, "FRESH_WATER")
end

function HasFuelAccess(square)
    return HasSourceAccess(square, "FUEL")
end

function HasBarrelAccess(square)
    return HasSourceAccess(square, "BARREL")
end


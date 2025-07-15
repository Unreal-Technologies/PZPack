TilesTable = {}

function TilesTable:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self

    -- Bricks interaction tiles
    o.PalleteWithBricks = "construction_01_4"
    o.EmptyPallet = "construction_01_5"

    -- Hay interaction tiles
    o.BalesOfHay1 = "vegetation_farm_01_8"
    o.BalesOfHay2 = "vegetation_farm_01_16"
    o.BalesOfHayDouble1 = "vegetation_farm_01_18"
    o.BalesOfHayDouble2 = "vegetation_farm_01_10"
    o.HayOnTheGround1 = "vegetation_farm_01_13"
    o.HayOnTheGround2 = "vegetation_farm_01_12"

    return o
end

function TilesTable:isPalleteWithBricks(object)
    if object:getSpriteName() == self.PalleteWithBricks then
        return true
    end
end

function TilesTable:isHayTile(object)
    if object:getSpriteName() == self.BalesOfHay1
        or object:getSpriteName() == self.BalesOfHay2
        or object:getSpriteName() == self.BalesOfHayDouble1
        or object:getSpriteName() == self.BalesOfHayDouble2
        or object:getSpriteName() == self.HayOnTheGround1
        or object:getSpriteName() == self.HayOnTheGround2 then
            return true
    end
end
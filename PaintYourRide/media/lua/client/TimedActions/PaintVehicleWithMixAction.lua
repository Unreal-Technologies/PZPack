require "TimedActions/BasePaintVehicleAction"

PaintVehicleWithMixAction = BasePaintVehicleAction:derive("PaintVehicleWithMixAction")

function PaintVehicleWithMixAction:perform()
    BasePaintVehicleAction.perform(self)

    if self.areaIndex == 4 then
        self.vehicle:setColorHSV(self.color.h, self.color.s, self.color.v)
        self.vehicle:getModData()["isSanded"] = false
        self.vehicle:getModData()["isPrimed"] = false
        self.vehicle:transmitModData()

        -- Use colorants
        self:useColorants()
        -- Use base paint
        self:useItem(PaintVehicleConfig.ITEMS.BASE_PAINT, self.paintRequired)
        -- Use spray gun's battery
        local sprayGun = self.character:getPrimaryHandItem()
        if sprayGun then
            sprayGun:setUsedDelta(sprayGun:getUsedDelta() - sprayGun:getUseDelta() * self.paintRequired * PaintVehicleConfig.COEF_USE_SPRAY_GUN * 10)
        end

        -- Award with XP
        self.character:getXp():AddXP(Perks.Mechanics, 20)

        -- Unequip spray gun
        PaintVehicleHelper.unequipHandItem(self.character, true)
    else
        -- Move to the next area
        -- Add in reverse order
        self.areaIndex = self.areaIndex + 1
        ISTimedActionQueue.addAfter(self, PaintVehicleWithMixAction:new(self.character, self.vehicle, self.color, self.paintRequired, self.colorants, self.areaIndex))
        ISTimedActionQueue.addAfter(self, ISPathFindAction:pathToVehicleArea(self.character, self.vehicle, PaintVehicleConfig.VEHICLE_AREAS[self.areaIndex]))
    end

    -- Remove Timed Action from stack
    ISBaseTimedAction.perform(self)
end

function PaintVehicleWithMixAction:useColorants()
    for _, v in pairs(self.colorants) do
        self:useItem(v.type, v.mixed)
    end
end

--- Constructor.
---@param character any The player to paint the vehicle.
---@param vehicle any The vehicle to paint.
---@param color table The HSV color in a table { h=, s=, v= }.
---@param paintRequired number The amount of base paint required to paint the vehicle.
---@param colorants table
---@param areaIndex number The index of area from available areas table.
function PaintVehicleWithMixAction:new(character, vehicle, color, paintRequired, colorants, areaIndex)
    local o = BasePaintVehicleAction:new(character, vehicle, paintRequired, areaIndex)
    setmetatable(o, self)
    self.__index = self
    o.soundRadius = 12
    o.color = color
    o.colorants = colorants
    return o
end
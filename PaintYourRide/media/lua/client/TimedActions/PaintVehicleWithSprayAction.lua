require "TimedActions/BasePaintVehicleAction"

PaintVehicleWithSprayAction = BasePaintVehicleAction:derive("PaintVehicleWithSprayAction")

function PaintVehicleWithSprayAction:perform()
    BasePaintVehicleAction.perform(self)

    if self.areaIndex == 4 then
        self.vehicle:setColorHSV(self.paint.color[1] / 100, self.paint.color[2] / 100, self.paint.color[3] / 100)
        self.vehicle:getModData()["isSanded"] = false
        self.vehicle:getModData()["isPrimed"] = false
        self.vehicle:transmitModData()

        -- Use paint
        self:useItem(self.paint.itemType, self.paintRequired)

        -- Award with XP
        self.character:getXp():AddXP(Perks.Mechanics, 20)

        -- Unequip spray gun
        PaintVehicleHelper.unequipHandItem(self.character, true)
    else
        -- Move to the next area
        -- Add in reverse order
        self.areaIndex = self.areaIndex + 1
        ISTimedActionQueue.addAfter(self, PaintVehicleWithSprayAction:new(self.character, self.vehicle, self.paint, self.paintRequired, self.areaIndex))
        ISTimedActionQueue.addAfter(self, ISPathFindAction:pathToVehicleArea(self.character, self.vehicle, PaintVehicleConfig.VEHICLE_AREAS[self.areaIndex]))
    end

    -- Remove Timed Action from stack
    ISBaseTimedAction.perform(self)
end

--- Constructor.
---@param character any The player to paint the vehicle.
---@param vehicle any The vehicle to paint.
---@param paint table The paint entry from the list of all declared paint items.
---@param paintRequired number The amount of paint required to paint the vehicle.
---@param areaIndex number The index of area from available areas table.
function PaintVehicleWithSprayAction:new(character, vehicle, paint, paintRequired, areaIndex)
    local o = BasePaintVehicleAction:new(character, vehicle, paintRequired, areaIndex)
    setmetatable(o, self)
    self.__index = self
    o.paint = paint
    return o
end
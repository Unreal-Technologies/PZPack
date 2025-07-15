require "TimedActions/ISBaseTimedAction"

BasePaintVehicleAction = ISBaseTimedAction:derive("BasePaintVehicleAction")

function BasePaintVehicleAction:isValid()
    return self.vehicle and not self.vehicle:isRemovedFromWorld()
end

function BasePaintVehicleAction:waitToStart()
    self.character:faceThisObject(self.vehicle)
    return self.character:shouldBeTurning()
end

function BasePaintVehicleAction:update()
    self.character:faceThisObject(self.vehicle)
    self.character:setMetabolicTarget(Metabolics.MediumWork)

    if not self.sound or not self.sound:isPlaying() then
        self.sound = getSoundManager():PlayWorldSound("PaintYourRide_SpraySound", false, self.character:getSquare(), 0, self.soundRadius, 1, true)
    end
end

function BasePaintVehicleAction:start()
    self:setActionAnim("VehicleWorkOnMid")
    self:setOverrideHandModels(nil, nil)

    self.sound = getSoundManager():PlayWorldSound("PaintYourRide_SpraySound", false, self.character:getSquare(), 0, self.soundRadius, 1, true)
end

function BasePaintVehicleAction:perform()
    if self.sound and self.sound:isPlaying() then
        self.sound:stop()
    end
end

function BasePaintVehicleAction:stop()
    if self.sound then
        self.sound:stop()
    end
    ISBaseTimedAction.stop(self)
end

function BasePaintVehicleAction:useItem(itemType, uses)
    local items = self.character:getInventory():getAllTypeRecurse(itemType)
    local usesRequired = uses
    for i = 1, items:size() do
        if usesRequired <= 0 then break end

        local item = items:get(i - 1)
        local itemUses = item:getDrainableUsesInt()
        -- Check if this item is the last required. Then use as much as necessary
        if itemUses > usesRequired then
            itemUses = usesRequired
        end
        -- Use item
        for _ = 1, itemUses do
            item:Use()
        end
        usesRequired = usesRequired - itemUses
    end
end

--- Constructor.
---@param character any The player to paint the vehicle.
---@param vehicle any The vehicle to paint.
---@param paintRequired number The amount of paint required to paint the vehicle.
---@param areaIndex number The index of area from available areas table.
function BasePaintVehicleAction:new(character, vehicle, paintRequired, areaIndex)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.stopOnWalk = true
    o.stopOnRun = true
    o.soundRadius = 5
    o.character = character
    o.vehicle = vehicle
    o.paintRequired = paintRequired
    o.areaIndex = areaIndex or 1

    local script = vehicle:getScript()
    local extX = script:getExtents():x()
    local extZ = script:getExtents():z()
    if o.areaIndex == 1 or o.areaIndex == 3 then
        o.maxTime = math.ceil(paintRequired / (2 * (extX + extZ)) * extX * 30) - 2 * character:getPerkLevel(Perks.Mechanics)
    elseif o.areaIndex == 2 or o.areaIndex == 4 then
        o.maxTime = math.ceil(paintRequired / (2 * (extX + extZ)) * extZ * 30) - 4 * character:getPerkLevel(Perks.Mechanics)
    end

    if ISVehicleMechanics.cheat then
        o.maxTime = 1
    end
    return o
end
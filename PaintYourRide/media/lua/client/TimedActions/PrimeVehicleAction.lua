require "TimedActions/ISBaseTimedAction"

PrimeVehicleAction = ISBaseTimedAction:derive("PrimeVehicleAction")

function PrimeVehicleAction:isValid()
    return self.vehicle and not self.vehicle:isRemovedFromWorld()
end

function PrimeVehicleAction:waitToStart()
    self.character:faceThisObject(self.vehicle)
    return self.character:shouldBeTurning()
end

function PrimeVehicleAction:update()
    self.character:faceThisObject(self.vehicle)
    self.character:setMetabolicTarget(Metabolics.MediumWork)

    if not self.sound or not self.sound:isPlaying() then
        self.sound = getSoundManager():PlayWorldSound("PaintYourRide_SpraySound", false, self.character:getSquare(), 0, self.soundRadius, 1, true)
    end
end

function PrimeVehicleAction:start()
    self:setActionAnim("VehicleWorkOnMid")
    self:setOverrideHandModels(nil, nil)

    self.sound = getSoundManager():PlayWorldSound("PaintYourRide_SpraySound", false, self.character:getSquare(), 0, self.soundRadius, 1, true)
end

function PrimeVehicleAction:perform()
    if self.sound then
        self.sound:stop()
    end

    if self.areaIndex == 4 then
        self.vehicle:setColorHSV(0.15, 0.0, self.vehicle:getColorValue() - 0.1)
        self.vehicle:getModData()["isPrimed"] = true
        self.vehicle:transmitModData()

        -- Use primer
        self:useItem(PaintVehicleConfig.ITEMS.PRIMER, self.primerRequired)

        -- Unequip primer
        PaintVehicleHelper.unequipHandItem(self.character, true)
    else
        -- Move to the next area
        -- Add in reverse order
        self.areaIndex = self.areaIndex + 1
        ISTimedActionQueue.addAfter(self, PrimeVehicleAction:new(self.character, self.vehicle, self.primerRequired, self.areaIndex))
        ISTimedActionQueue.addAfter(self, ISPathFindAction:pathToVehicleArea(self.character, self.vehicle, PaintVehicleConfig.VEHICLE_AREAS[self.areaIndex]))
    end

    -- Remove Timed Action from stack
    ISBaseTimedAction.perform(self)
end

function PrimeVehicleAction:useItem(itemType, uses)
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

function PrimeVehicleAction:stop()
    if self.sound then
        self.sound:stop()
    end
    ISBaseTimedAction.stop(self)
end

function PrimeVehicleAction:new(character, vehicle, primerRequired, areaIndex)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.stopOnWalk = true
    o.stopOnRun = true
    o.soundRadius = 5
    o.character = character
    o.vehicle = vehicle
    o.primerRequired = primerRequired
    o.areaIndex = areaIndex or 1

    local script = vehicle:getScript()
    local extX = script:getExtents():x()
    local extZ = script:getExtents():z()
    if o.areaIndex == 1 or o.areaIndex == 3 then
        o.maxTime = math.ceil(primerRequired / (2 * (extX + extZ)) * extX * 30) - 2 * character:getPerkLevel(Perks.Mechanics)
    elseif o.areaIndex == 2 or o.areaIndex == 4 then
        o.maxTime = math.ceil(primerRequired / (2 * (extX + extZ)) * extZ * 30) - 4 * character:getPerkLevel(Perks.Mechanics)
    end

    if ISVehicleMechanics.cheat then
        o.maxTime = 1
    end
    return o
end
require "TimedActions/ISBaseTimedAction"

SandVehicleAction = ISBaseTimedAction:derive("SandVehicleAction")

function SandVehicleAction:isValid()
    return self.vehicle and not self.vehicle:isRemovedFromWorld()
end

function SandVehicleAction:waitToStart()
    self.character:faceThisObject(self.vehicle)
    return self.character:shouldBeTurning()
end

function SandVehicleAction:update()
    self.character:faceThisObject(self.vehicle)
    self.character:setMetabolicTarget(Metabolics.HeavyWork)

    if not self.sound or not self.sound:isPlaying() then
        self.sound = getSoundManager():PlayWorldSound("PaintYourRide_WireBrushSound", false, self.character:getSquare(), 0, 7, 1, true)
    end
end

function SandVehicleAction:start()
    self:setActionAnim("VehicleWash")
    self:setOverrideHandModels(nil, nil)

    self.sound = getSoundManager():PlayWorldSound("PaintYourRide_WireBrushSound", false, self.character:getSquare(), 0, 7, 1, true)
end

function SandVehicleAction:perform()
    if self.sound and self.sound:isPlaying() then
        self.sound:stop()
    end

    if self.areaIndex == 4 then
        -- Remove rust
        sendClientCommand(self.character, "vehicle", "setRust", { vehicle = self.vehicle:getId(), rust = 0.0 })
        self.vehicle:setColorHSV(0.15, 0.0, ZombRandFloat(0.83, 0.88))
        self.vehicle:getModData()["isSanded"] = true
        self.vehicle:transmitModData()

        -- Unequip the wire brush
        PaintVehicleHelper.unequipHandItem(self.character, true)
    else
        -- Move to the next area
        -- Add in reverse order
        self.areaIndex = self.areaIndex + 1
        ISTimedActionQueue.addAfter(self, SandVehicleAction:new(self.character, self.vehicle, self.paintRequired, self.areaIndex))
        ISTimedActionQueue.addAfter(self, ISPathFindAction:pathToVehicleArea(self.character, self.vehicle, PaintVehicleConfig.VEHICLE_AREAS[self.areaIndex]))
    end

    -- Remove Timed Action from stack
    ISBaseTimedAction.perform(self)
end

function SandVehicleAction:stop()
    if self.sound then
        self.sound:stop()
    end
    ISBaseTimedAction.stop(self)
end

function SandVehicleAction:new(character, vehicle, paintRequired, areaIndex)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.stopOnWalk = true
    o.stopOnRun = true
    o.character = character
    o.vehicle = vehicle
    o.paintRequired = paintRequired
    o.areaIndex = areaIndex or 1

    local script = vehicle:getScript()
    local extX = script:getExtents():x()
    local extZ = script:getExtents():z()
    if o.areaIndex == 1 or o.areaIndex == 3 then
        o.maxTime = math.ceil(paintRequired * PaintVehicleConfig.COEF_TIME_SAND / (2 * (extX + extZ)) * extX * 30) - 2 * character:getPerkLevel(Perks.Mechanics)
    elseif o.areaIndex == 2 or o.areaIndex == 4 then
        o.maxTime = math.ceil(paintRequired * PaintVehicleConfig.COEF_TIME_SAND / (2 * (extX + extZ)) * extZ * 30) - 4 * character:getPerkLevel(Perks.Mechanics)
    end

    if ISVehicleMechanics.cheat then
        o.maxTime = 1
    end
    return o
end
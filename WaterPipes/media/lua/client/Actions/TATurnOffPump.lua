require "TimedActions/ISBaseTimedAction"
require "wp_vsquare"

---@class TATurnOffPump : ISBaseTimedAction
TATurnOffPump = ISBaseTimedAction:derive("TATurnOffPump");

function TATurnOffPump:isValid()
    return true
end

function TATurnOffPump:update()
    
end

function TATurnOffPump:start()
    self.character:faceThisObject(self.object)
    self:setActionAnim("RemoveCurtain")
    
end

function TATurnOffPump:stop()
    ISBaseTimedAction.stop(self)
end

function TATurnOffPump:perform()

    PumpTurnOff (self.character, self.object, self.fresh, self.fuel)

    ISBaseTimedAction.perform(self)
end


function TATurnOffPump:new(character, square, object, fresh, fuel)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    
    o.character = character
    o.stopOnWalk = false
    -- o.stopOnRun = false
    o.maxTime = 30

    -- custom fields
    o.object = object
    o.square = square
    o.fresh = fresh
    o.fuel = fuel
    return o
end

return TATurnOffPump;

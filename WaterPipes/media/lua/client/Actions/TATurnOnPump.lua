require "TimedActions/ISBaseTimedAction"
require "wp_vsquare"
require "wp_emitters"

---@class TATurnACOn : ISBaseTimedAction
TATurnOnPump = ISBaseTimedAction:derive("TATurnOnPump");

function TATurnOnPump:isValid()
    return true
end

function TATurnOnPump:update()
    
end

function TATurnOnPump:start()
    self.character:faceThisObject(self.object)
    self:setActionAnim("RemoveCurtain")
    
    self.square:playSound("WaterPumpStart")
end

function TATurnOnPump:stop()
    ISBaseTimedAction.stop(self)
end

function TATurnOnPump:perform()
    
    PumpTurnOn (self.character, self.object, self.fresh, self.fuel)

    ISBaseTimedAction.perform(self)
end


function TATurnOnPump:new(character, square, object, fresh, fuel)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character
    o.stopOnWalk = false
    o.stopOnRun = false
    o.maxTime = 60
    -- custom fields
    o.object = object
    o.square = square
    o.fresh = fresh
    o.fuel = fuel
    return o
end

return TATurnOnPump;

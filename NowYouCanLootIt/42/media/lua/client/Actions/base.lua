require "TimedActions/ISBaseTimedAction"

BaseTileInteraction = ISBaseTimedAction:derive("BaseTileInteraction")

function BaseTileInteraction:new(player, object)
    local o = {}
    setmetatable(o, self)
    self.__index = self

    o.character = player
    o.object = object
    o.maxTime = 100
    o.soundName = nil
    o.sound = nil
    o.animName = nil
    o.tiles = TilesTable:new()
    o.contextOptionText = "context option text is not defined"

    return o
end

function BaseTileInteraction:getContextOptionText()
    return self.contextOptionText
end

function BaseTileInteraction:getObject()
    if self.object
        then return self.object
    else
        print("Some error occured: base interaction table object is nil")
        return nil
    end
end

function BaseTileInteraction:walkToObject()
    local x, y, z = self.object:getSquare():getX(), self.object:getSquare():getY(), self.object:getSquare():getZ()

    if self.character:getSquare():getX() < self.object:getSquare():getX() then
        x = x - 1
    elseif self.character:getSquare():getX() > self.object:getSquare():getX() then
        x = x + 1
    end

    if self.character:getSquare():getY() < self.object:getSquare():getY() then
        y = y - 1
    elseif self.character:getSquare():getY() > self.object:getSquare():getY() then
        y = y + 1
    end

    local square = getCell():getGridSquare(x, y, z)
    ISTimedActionQueue.add(ISWalkToTimedAction:new(self.character, square))
end

function BaseTileInteraction:isValid()
    return true
end

function BaseTileInteraction:update()
    if not self.character:getEmitter():isPlaying(self.sound) then
        self.sound = self.character:getEmitter():playSound(self.soundName)
    end
end

function BaseTileInteraction:waitToStart()
	self.character:faceThisObject(self.object)
	return self.character:shouldBeTurning()
        and self.object:getSquare():DistTo(self.character:getSquare()) < 1.5
end

function BaseTileInteraction:start()
	self:setActionAnim(self.animName)
    self.sound = self.character:getEmitter():playSound(self.soundName)
end

function BaseTileInteraction:stop()
    if self.character:getEmitter():isPlaying(self.sound) then
        self.character:getEmitter():stopSound(self.sound)
    end
	ISBaseTimedAction.stop(self)
end

function BaseTileInteraction:perform()
    ISBaseTimedAction.perform(self)
end

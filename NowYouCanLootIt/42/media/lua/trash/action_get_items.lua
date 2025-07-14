-- Copyright bergemon (c) 2025

require "TimedActions/ISBaseTimedAction"

ActionGetItems = ISBaseTimedAction:derive("ActionGetBricks")

function ModifyExistingObject(object)

    if not object then return end

    if IsBricks(object) then
        object:setSpriteFromName(EmptyPallet)
    elseif IsHay(object) then
        object:getSquare():RemoveTileObject(object)
    end
end

function ActionGetItems:isValid()
    return true
end

function ActionGetItems:update()
    if not self.character:getEmitter():isPlaying(self.sound) then
        self.sound = self.character:getEmitter():playSound(self.soundName)
    end
end

function ActionGetItems:waitToStart()
	self.character:faceThisObject(self.object)
	return self.character:shouldBeTurning()
        and self.object:getSquare():DistTo(self.character:getSquare()) < 1.5
end

function ActionGetItems:start()
	self:setActionAnim(self.aninName)
    
    self.sound = self.character:getEmitter():playSound(self.soundName)
end

function ActionGetItems:stop()
    if self.character:getEmitter():isPlaying(self.sound) then
        self.character:getEmitter():stopSound(self.sound)
    end

	ISBaseTimedAction.stop(self)
end

function ActionGetItems:perform()
    if self.character:getEmitter():isPlaying(self.sound) then
        self.character:getEmitter():stopSound(self.sound)
    end
 
    self.character:getInventory():AddItems(self.itemToAdd, self.itemToAddQuantity)

    ModifyExistingObject(self.object)

    ISBaseTimedAction.perform(self)
end

function ActionGetItems:new(player, object, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
    o.character = player
    o.object = object
    o.maxTime = time
    o.soundName = GetAnimSoundName(object)
    o.sound = nil
    o.itemToAdd = GetItemName(object)
    o.itemToAddQuantity = GetItemQuantity(object)
    o.aninName = GetAnimName(object)
    return o
end
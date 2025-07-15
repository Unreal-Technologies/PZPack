require "TimedActions/ISBaseTimedAction"
require "ISUI/ISLayoutManager"

---@class TAChangeValve : ISBaseTimedAction
TAChangeValve = ISBaseTimedAction:derive("TAChangeValve")

function TAChangeValve:isValid()
	return true
end

function TAChangeValve:update()
end

function TAChangeValve:start()
	self:setActionAnim("Loot")
	self.character:SetVariable("LootPosition", "Low")
	self.character:reportEvent("EventLootItem")
	self.sound = self.character:playSound("toggle")
end

function TAChangeValve:stop()
	self.character:stopOrTriggerSound(self.sound)
    ISBaseTimedAction.stop(self);
end

function TAChangeValve:perform()
	self.character:stopOrTriggerSound(self.sound)
	
	local x = self.object:getX()
	local y = self.object:getY()
	local z = self.object:getZ()

	local valve = Vsquare.GetPipe(x, y, z)
	local vs = decToBooleans(valve.vs)
	vs[self.valveN] = not vs[self.valveN]
	local dec = booleansToDec(vs)
	Vsquare.UpdateValveStates(x, y, z, dec)

	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function TAChangeValve:new(character, square, object, valveN)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.maxTime = 0
	o.stopOnWalk = true
	o.stopOnRun = true
	o.maxTime = 50
	o.character = character
	o.playerNum = character:getPlayerNum()
	o.square = square
	o.object = object
	o.valveN = valveN
	return o
end

return TAChangeValve;
require "TimedActions/ISBaseTimedAction"
require "wp_vsquare"

---@class TAAddFilterPump : ISBaseTimedAction
TAAddFilterPump = ISBaseTimedAction:derive("TAAddFilterPump");

function TAAddFilterPump:isValid()
	return true
end

function TAAddFilterPump:update()
    
end

function TAAddFilterPump:start()
    self.character:faceThisObject(self.object)
	self:setActionAnim("RemoveCurtain")
end

function TAAddFilterPump:stop()
	ISBaseTimedAction.stop(self)
end

function TAAddFilterPump:perform()

	local vpump = Vsquare.GetPump(self.object:getX(), self.object:getY(), self.object:getZ())
	if vpump then
		Vsquare.AddFilterToPump(self.object:getX(), self.object:getY(), self.object:getZ(), 50)
		self.charcoal:Use()
	end

	

    -- self.object:transmitModdata()

	ISBaseTimedAction.perform(self)
end


function TAAddFilterPump:new(character, square, object, charcoal)
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
	o.charcoal = charcoal
	return o
end

return TAAddFilterPump;

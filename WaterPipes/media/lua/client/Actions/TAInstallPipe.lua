require "TimedActions/ISBaseTimedAction"

---@class TAInstallPipe : ISBaseTimedAction
TAInstallPipe = ISBaseTimedAction:derive("TAInstallPipe");

function TAInstallPipe:isValid()
	return true
end

function TAInstallPipe:update()
end

function TAInstallPipe:start()
    -- self.character:setMetabolicTarget(Metabolics.DiggingSpade);
	self:setActionAnim("RemoveGrass")
	self:setOverrideHandModels(nil, nil)
	self.sound = self.character:playSound("RemovePlant")
end

function TAInstallPipe:stop()
	ISBaseTimedAction.stop(self)
end

function TAInstallPipe:perform()
    self.character:stopOrTriggerSound(self.sound)
    
    AddPipe(self.square)

	ISBaseTimedAction.perform(self)
end


function TAInstallPipe:new(character, square)
	local o = {}
	setmetatable(o, self)
	self.__index = self
    
    o.character = character
    o.stopOnWalk = false
    -- o.stopOnRun = false
    o.maxTime = 100

    -- custom fields
	o.square = square
    o.caloriesModifier = 6
	return o
end

return TAInstallPipe;

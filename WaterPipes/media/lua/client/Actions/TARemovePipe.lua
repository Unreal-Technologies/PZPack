require "TimedActions/ISBaseTimedAction"

---@class TARemovePipe : ISBaseTimedAction
TARemovePipe = ISBaseTimedAction:derive("TARemovePipe");

function TARemovePipe:isValid()
	return true
end

function TARemovePipe:update()
end

function TARemovePipe:start()
    -- self.character:setMetabolicTarget(Metabolics.DiggingSpade);
	local playerInv = self.character:getInventory()
	-- local playerNum = self.character:getPlayerNum()
	local item = playerInv:getFirstTypeRecurse("PipeWrench")
	-- ISInventoryPaneContextMenu.equipWeapon(item, true, false, playerNum)
	self.character:SetVariable("LootPosition", "Mid")
	self:setActionAnim("RemoveGrass")
	self:setOverrideHandModels(item, nil)
	self.sound = self.character:playSound("RepairWithWrench")
end

function TARemovePipe:stop()
	self.character:stopOrTriggerSound(self.sound)
	ISBaseTimedAction.stop(self)
end

function TARemovePipe:perform()
    self.character:stopOrTriggerSound(self.sound)
    RemovePipe(self.square)
	ISBaseTimedAction.perform(self)
end


function TARemovePipe:new(character, square)
	local o = {}
	setmetatable(o, self)
	self.__index = self
    
    o.character = character
    o.stopOnWalk = false
    -- o.stopOnRun = false
    o.maxTime = 200

    -- custom fields
	o.square = square
    o.caloriesModifier = 6
	return o
end

return TARemovePipe;

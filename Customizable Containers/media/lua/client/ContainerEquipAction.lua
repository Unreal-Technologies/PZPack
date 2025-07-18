require "TimedActions/ISBaseTimedAction"
require 'TimedActions/ISClothingExtraAction'

function ISClothingExtraAction:perform()
    self.item:setJobDelta(0.0);
	local playerObj = self.character
	playerObj:removeFromHands(self.item)
	playerObj:removeWornItem(self.item)
	playerObj:getInventory():Remove(self.item)
	local newItem = self:createItem(self.item, self.extra)
	playerObj:getInventory():AddItem(newItem)
	if newItem:IsInventoryContainer() and newItem:canBeEquipped() ~= "" then
	local oCapacity = self.item:getCapacity()
	local oWeightreduction = self.item:getWeightReduction()
		playerObj:setWornItem(newItem:canBeEquipped(), newItem)
		newItem:setCapacity(oCapacity)
        if oWeightReduction ~= nil or 0 then
            newItem:setWeightReduction(oWeightreduction)
        end
		getPlayerInventory(self.character:getPlayerNum()):refreshBackpacks();
	elseif newItem:IsClothing() and not newItem:IsInventoryContainer() then
		playerObj:setWornItem(newItem:getBodyLocation(), newItem)

		-- flattens Mowhawk for Headwear
		if playerObj:getHumanVisual():getHairModel():contains("Mohawk") and (newItem:getBodyLocation() == "Hat" or newItem:getBodyLocation() == "FullHat") then
			playerObj:getHumanVisual():setHairModel("MohawkFlat");
			playerObj:resetModel();
		end
	end
	triggerEvent("OnClothingUpdated", playerObj)

	ISBaseTimedAction.perform(self)
end

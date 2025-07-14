require "ISUI/ISInventoryPaneContextMenu"

MagTypeSet = {
    "Base.L395KMag","Base.L395KMagSlugs"
}

Guns93MagSwitch = {}

Guns93MagSwitch.callAction = function(item, index, player) 
	if item and item:getContainer() == player:getInventory()  then 
		ISTimedActionQueue.add(Guns93MagSwitchAction:new(item, index, player, CharacterActionAnims.Craft, 0))
	end
end

Guns93MagSwitchAction = ISBaseTimedAction:derive("Guns93MagSwitchAction");

function Guns93MagSwitchAction:new(item, index, character, anim, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
    o.item = item;
	o.index = index;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.maxTime = time;
    o.caloriesModifier = 6;
	o.animation = anim
	o.useProgressBar = false;
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
	return o;
end

function Guns93MagSwitchAction:isValid() 
	local returnvalue = true
	if not self.item or self.item:getContainer() ~= self.character:getInventory() then 
		returnvalue = false;
	end
	return returnvalue;
end

function Guns93MagSwitchAction:waitToStart()
	return false;
end

function Guns93MagSwitchAction:start()
	self.item:setJobType("Switch Magazine Ammo Type");
	self.item:setJobDelta(0.0);
	self:setOverrideHandModels(self.item:getStaticModel(), nil)
	if self.item:getCurrentAmmoCount() > 0 then
		ISTimedActionQueue.add(ISUnloadBulletsFromMagazine:new(self.character, self.item))
		return ISTimedActionQueue.add(Guns93MagSwitchAction:new(self.item, self.index, self.character, self.animation, 0))
	end
end

function Guns93MagSwitchAction:perform()
	MagSwitch(self.item, self.index, self.character)

    ISBaseTimedAction.perform(self);
end

function Guns93MagSwitchAction:update()
	self.item:setJobDelta(self:getJobDelta());
    self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function Guns93MagSwitchAction:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function MagSwitch(item, index, player)
	local result = nil
	local ammoCount = item:getCurrentAmmoCount()
    if item:getCurrentAmmoCount() == 0 then
        result = player:getInventory():AddItem(MagTypeSet[index])
        ISTimedActionQueue.add(ISLoadBulletsInMagazine:new(player, result, ammoCount))
		player:getInventory():DoRemoveItem(item)
    end
end
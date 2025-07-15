require('TimedActions/ISBaseTimedAction');

RemoveWoodenMouldingAction = ISBaseTimedAction:derive("RemoveWoodenMouldingAction");

function RemoveWoodenMouldingAction:isValid()
	local playerInv = self.character:getInventory()
	return playerInv:contains("Hammer");
end

function RemoveWoodenMouldingAction:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function RemoveWoodenMouldingAction:update()
	self.character:faceLocation(self.square:getX(), self.square:getY())
    self.character:setMetabolicTarget(Metabolics.LightWork);end

function RemoveWoodenMouldingAction:start()
	-- if we have dish clothes, play low animation & show bleach
	local primaryItem = self.character:getPrimaryHandItem()

		self:setActionAnim("Loot");
		self.character:SetVariable("LootPosition", "Low");
		self:setOverrideHandModels(nil, "Hammer");
		self.character:reportEvent("EventRemoveWoodenMoulding");
        self.sound = self.character:playSound("BeginRemoveBarricadePlank");
        addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 10, 1)
		
end

function RemoveWoodenMouldingAction:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function RemoveWoodenMouldingAction:perform()
	if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	self.character:playSound("RemoveBarricadePlank")
    addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 10, 1)
	local args = { x = self.square:getX(), y = self.square:getY(), z = self.square:getZ() }

    sendClientCommand(self.character, 'RemoveMoulding', 'RemoveMouldingCommand', args)
    self.character:getInventory():AddItem("Base.Plank");
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function RemoveWoodenMouldingAction:new(character, square, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.square = square;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
    o.caloriesModifier = 5;
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
	return o;
end

--[[RemoveStoneMouldingAction = ISBaseTimedAction:derive("RemoveWoodenMouldingAction");

function RemoveStoneMouldingAction:isValid()
	local playerInv = self.character:getInventory()
	return playerInv:contains("Hammer");
end

function RemoveStoneMouldingAction:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function RemoveStoneMouldingAction:update()
	self.character:faceLocation(self.square:getX(), self.square:getY())
    self.character:setMetabolicTarget(Metabolics.LightWork);end

function RemoveStoneMouldingAction:start()
	-- if we have dish clothes, play low animation & show bleach
	local primaryItem = self.character:getPrimaryHandItem()

		self:setActionAnim("Loot");
		self.character:SetVariable("LootPosition", "Low");
		self:setOverrideHandModels(nil, "Hammer");
		self.character:reportEvent("EventRemoveStoneMoulding");
        self.sound = self.character:playSound("BeginRemoveBarricadePlank");
        addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 10, 1)
		
end

function RemoveStoneMouldingAction:stop()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function RemoveStoneMouldingAction:perform()
	if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end
	self.character:playSound("RemoveBarricadePlank")
    addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 10, 1)
	local args = { x = self.square:getX(), y = self.square:getY(), z = self.square:getZ() }

    sendClientCommand(self.character, 'RemoveMoulding', 'RemoveMouldingCommand', args)
    self.character:getInventory():AddItem("Base.Stone");
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function RemoveStoneMouldingAction:new(character, square, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.square = square;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
    o.caloriesModifier = 5;
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
	return o;
end
]]

require "TimedActions/ISBaseTimedAction"

ApplySidingAction = ISBaseTimedAction:derive("ApplySidingAction");

function ApplySidingAction:isValid()
	return true;
end


function ApplySidingAction:waitToStart()
    self.character:faceThisObject(self.thumpable)
    return self.character:shouldBeTurning()
end

function ApplySidingAction:update()
	self.character:faceThisObject(self.thumpable)
    self.character:setMetabolicTarget(Metabolics.MediumWork);
end

function ApplySidingAction:start()		
	self:setActionAnim(CharacterActionAnims.Build);
	local plank = InventoryItemFactory.CreateItem("Base.Plank");
    self:setOverrideHandModels("WoodenMallet", plank)
	self.sound = self.character:playSound("Hammering")
end

function ApplySidingAction:stop()
    if self.sound then self.character:stopOrTriggerSound(self.sound) end
    ISBaseTimedAction.stop(self);
end

function ApplySidingAction:perform()
    if self.sound then self.character:stopOrTriggerSound(self.sound) end
	local modData = self.thumpable:getModData();
    local north = "";
	if self.isThump then
        if self.thumpable:getNorth() then
            north = "North";
        end
    else
        if self.thumpable:getSprite():getProperties():Is("WallN") == true or self.thumpable:getSprite():getProperties():Is(IsoFlagType.WindowN) == true or 
			self.thumpable:getSprite():getProperties():Is("DoorWallN") == true then
            north = "North";
        end
        if self.thumpable:getSprite():getProperties():Is("WallNW") == true then
            north = "Corner";
        end
    end
     local sprite = nil;
	 local paintingType = self.thumpable:getSprite():getProperties():Val("PaintingType");
    if self.isThump then
        sprite = Siding[paintingType]['PaintBrown' .. north];
    elseif Siding[paintingType] then
        sprite = Siding[paintingType]['PaintBrown' .. north];
    end
	local id = self.thumpable:getSprite():getID()
	local args = { x = self.thumpable:getX(), y = self.thumpable:getY(), z = self.thumpable:getZ(), id = id, sprite = sprite }
    
		sendClientCommand(self.character, 'NewPlastering', 'NewPlasteringCommand', args)

	if not ISBuildMenu.cheat then
		self.character:getInventory():Remove("Plank");
		
	end
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ApplySidingAction:new(character, thumpable, planks, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.thumpable = thumpable;
	o.planks = planks;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	if character:HasTrait("Handy") then
		o.maxTime = time - 20;
    end
    o.isThump = true;
    if not instanceof(thumpable, "IsoThumpable") then
        o.isThump = false;
    end
    if ISBuildMenu.cheat then o.maxTime = 1; end
    o.caloriesModifier = 4;
	return o;
end

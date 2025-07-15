require "TimedActions/ISBaseTimedAction"

RemoveSidingAction = ISBaseTimedAction:derive("RemoveSidingAction");

function RemoveSidingAction:isValid()
	return ISBuildMenu.cheat or self.character:getInventory():contains("Crowbar") or self.character:getInventory():contains("Hammer") ;
end

function RemoveSidingAction:waitToStart()
    self.character:faceThisObject(self.thumpable)
    return self.character:shouldBeTurning()
end


function RemoveSidingAction:update()
self.character:faceThisObject(self.thumpable)
    self.character:setMetabolicTarget(Metabolics.MediumWork);
end

function RemoveSidingAction:start()
	if self.character:getInventory():contains("Crowbar") then
		
		self:setActionAnim("RemoveBarricade")
        self:setAnimVariable("RemoveBarricade", "CrowbarMid")
		
		self:setOverrideHandModels("Crowbar", nil)
	else
            self.character:clearVariable("RemoveBarricade")
            self:setOverrideHandModels(nil, nil)
        end
        self.sound = self.character:playSound("BeginRemoveBarricadePlank");
        addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 10, 1)

end

function RemoveSidingAction:stop()
    if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function RemoveSidingAction:perform()
    if self.sound then self.character:stopOrTriggerSound(self.sound) end
		self.character:playSound("RemoveBarricadePlank")
        addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 10, 1)

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
        if WoodStain[paintingType] then
        sprite = WoodStain[paintingType]["WoodStainJacobean" .. north];
        end
    elseif WoodStain[paintingType] then
        sprite = WoodStain[paintingType]["WoodStainJacobean" .. north];
    end
	
	local id = self.thumpable:getSprite():getID()
	local args = { x = self.thumpable:getX(), y = self.thumpable:getY(), z = self.thumpable:getZ(), id = id, sprite = sprite }		
	sendClientCommand(self.character, 'NewPlastering', 'NewPlasteringCommand', args)

	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function RemoveSidingAction:new(character, thumpable, sidingRemover, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.thumpable = thumpable;
	o.sidingRemover = sidingRemover;
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

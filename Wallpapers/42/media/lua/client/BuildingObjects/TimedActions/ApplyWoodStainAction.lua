
require "TimedActions/ISBaseTimedAction"

ApplyWoodStainAction = ISBaseTimedAction:derive("ApplyWoodStainAction");

function ApplyWoodStainAction:isValid()
	return true;
end


function ApplyWoodStainAction:waitToStart()
    self.character:faceThisObject(self.thumpable)
    return self.character:shouldBeTurning()
end

function ApplyWoodStainAction:update()
	self.character:faceThisObject(self.thumpable)
    self.character:setMetabolicTarget(Metabolics.LightWork);
end

function ApplyWoodStainAction:start()

    self:setActionAnim(CharacterActionAnims.Paint)
    self:setOverrideHandModels("PaintBrush", nil)
    self.character:faceThisObject(self.thumpable)
    self.sound = self.character:playSound("Painting")
end

function ApplyWoodStainAction:stop()
    if self.sound then self.character:stopOrTriggerSound(self.sound) end
    ISBaseTimedAction.stop(self);
end

function ApplyWoodStainAction:perform()
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
			if WoodStain[paintingType] then
			sprite = WoodStain[paintingType][self.painting .. north];
			end
		elseif WoodStain[paintingType] then
			sprite = WoodStain[paintingType][self.painting .. north];
        end
       
	local id = self.thumpable:getSprite():getID()
	local args = { x = self.thumpable:getX(), y = self.thumpable:getY(), z = self.thumpable:getZ(), id = id, sprite = sprite }
    
		sendClientCommand(self.character, 'NewPlastering', 'NewPlasteringCommand', args)

	if not ISBuildMenu.cheat then
		self.stainCan:Use();
	end
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ApplyWoodStainAction:new(character, thumpable, stainCan, painting, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.thumpable = thumpable;
	o.painting = painting;
	o.stainCan = stainCan;
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

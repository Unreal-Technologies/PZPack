
require "TimedActions/ISBaseTimedAction"

ApplyTilesAction = ISBaseTimedAction:derive("ApplyTilesAction");

function ApplyTilesAction:isValid()
	return true;
end


function ApplyTilesAction:waitToStart()
    self.character:faceThisObject(self.thumpable)
    return self.character:shouldBeTurning()
end

function ApplyTilesAction:update()
	self.character:faceThisObject(self.thumpable)

    self.character:setMetabolicTarget(Metabolics.MediumWork);
end

function ApplyTilesAction:start()
	local handShovel = InventoryItemFactory.CreateItem("farming.HandShovel");
	self:setOverrideHandModels(handShovel, nil)
	self:setActionAnim(CharacterActionAnims.Paint)
	self.sound = self.character:playSound("Plastering")
end

function ApplyTilesAction:stop()
    if self.sound then self.character:stopOrTriggerSound(self.sound) end
    ISBaseTimedAction.stop(self);
end

function ApplyTilesAction:perform()
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
    
	local paintingType = self.thumpable:getSprite():getProperties():Val("PaintingType");
    
    local sprite = Tiles[paintingType][self.painting .. north];
    
	local id = self.thumpable:getSprite():getID()
	local args = { x = self.thumpable:getX(), y = self.thumpable:getY(), z = self.thumpable:getZ(), id = id, sprite = sprite }
    
		sendClientCommand(self.character, 'NewPlastering', 'NewPlasteringCommand', args)

	if not ISBuildMenu.cheat then
		self.tilesPack:Use();
	end
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ApplyTilesAction:new(character, thumpable, tilesPack, painting, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.thumpable = thumpable;
	o.painting = painting;
	o.tilesPack = tilesPack;
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

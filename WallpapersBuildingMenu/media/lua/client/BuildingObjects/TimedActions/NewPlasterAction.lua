require "TimedActions/ISBaseTimedAction"

NewPlasteringAction = ISBaseTimedAction:derive("NewPlasteringAction");

function NewPlasteringAction:isValid()
	return ISBuildMenu.cheat or self.character:getInventory():contains("BucketPlasterFull");
end

function NewPlasteringAction:update()
	self.character:faceThisObject(self.thumpable)
    self.character:setMetabolicTarget(Metabolics.MediumWork);
end

function NewPlasteringAction:start()
	local handShovel = InventoryItemFactory.CreateItem("farming.HandShovel");
	local plaster = InventoryItemFactory.CreateItem("Base.BucketPlasterFull");
	self:setOverrideHandModels(handShovel, plaster)
	self:setActionAnim(CharacterActionAnims.Paint)
	self.sound = self.character:playSound("Plastering")
end

function NewPlasteringAction:stop()
    if self.sound then self.character:stopOrTriggerSound(self.sound) end
    ISBaseTimedAction.stop(self);
end

function NewPlasteringAction:perform()
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
        if Painting[paintingType] then
        sprite = Painting[paintingType]["plasterTile" .. north];
        end
    elseif Painting[paintingType] then
        sprite = Painting[paintingType]["plasterTile" .. north];
    end
    local id = self.thumpable:getSprite():getID()
	local args = { x = self.thumpable:getX(), y = self.thumpable:getY(), z = self.thumpable:getZ(), id = id, sprite = sprite }
    sendClientCommand(self.character, 'NewPlastering', 'NewPlasteringCommand', args)


    if not ISBuildMenu.cheat then
        self.plasterBucket:Use();
    end
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function NewPlasteringAction:new(character, thumpable, plasterBucket, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.thumpable = thumpable;
	o.plasterBucket = plasterBucket;
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

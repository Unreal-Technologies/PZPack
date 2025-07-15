require "TimedActions/ISBaseTimedAction"

RemoveTilesAction = ISBaseTimedAction:derive("RemoveTilesAction");

function RemoveTilesAction:isValid()
	return ISBuildMenu.cheat or self.character:getInventory():contains("Hammer") or self.character:getInventory():contains("ClubHammer") or self.character:getInventory():contains("BallPeenHammer");
end

function RemoveTilesAction:waitToStart()
    self.character:faceThisObject(self.thumpable)
    return self.character:shouldBeTurning()
end


function RemoveTilesAction:update()
self.character:faceThisObject(self.thumpable)
    self.character:setMetabolicTarget(Metabolics.MediumWork);
end

function RemoveTilesAction:start() 
 if self.character:getInventory():contains("Hammer") then 
	self:setOverrideHandModels("Hammer", nil)
	elseif self.character:getInventory():contains("ClubHammer") then 
	self:setOverrideHandModels("ClubHammer", nil)
	else self:setOverrideHandModels("BallPeenHammer", nil)
	end
	self:setActionAnim(CharacterActionAnims.Build);
	self.sound = self.character:playSound("TileSmash1")
        addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 10, 0.5)

end

function RemoveTilesAction:stop()
    if self.sound then
		self.character:getEmitter():stopSound(self.sound)
		self.sound = nil
	end
    ISBaseTimedAction.stop(self);
end

function RemoveTilesAction:perform()
    if self.sound then self.character:stopOrTriggerSound(self.sound) end
		self.character:playSound("TileSmash2")
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
        if Painting[paintingType] then
        sprite = Painting[paintingType]["plasterTile" .. north];
        end
    elseif Painting[paintingType] then
        sprite = Painting[paintingType]["plasterTile" .. north];
    end
	
	local id = self.thumpable:getSprite():getID()
	local args = { x = self.thumpable:getX(), y = self.thumpable:getY(), z = self.thumpable:getZ(), id = id, sprite = sprite }		
	sendClientCommand(self.character, 'NewPlastering', 'NewPlasteringCommand', args)

	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function RemoveTilesAction:new(character, thumpable, tilesRemover, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.thumpable = thumpable;
	o.tilesRemover = tilesRemover;
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

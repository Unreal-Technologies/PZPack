--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISWPaintAction = ISBaseTimedAction:derive("ISWPaintAction");

function ISWPaintAction:isValid()
	return true;
end

function ISWPaintAction:waitToStart()
    self.character:faceThisObject(self.thumpable)
    return self.character:shouldBeTurning()
end

function ISWPaintAction:update()
    self.character:faceThisObject(self.thumpable)
    self.character:setMetabolicTarget(Metabolics.LightWork);
end

function ISWPaintAction:start()
    self:setActionAnim(CharacterActionAnims.Paint)
    self:setOverrideHandModels("Paintbrush", nil)
    self.character:faceThisObject(self.thumpable)
    self.sound = self.character:playSound("Painting")
end

function ISWPaintAction:stop()
    if self.sound then self.character:stopOrTriggerSound(self.sound) end
    ISBaseTimedAction.stop(self);
end

function ISWPaintAction:perform()
    if self.sound then self.character:stopOrTriggerSound(self.sound) end
    
	local modData = self.thumpable:getModData();
    local north = "";
    if self.isThump then
        if self.thumpable:getNorth() then
            north = "North";
        end
    else
        if self.thumpable:getSprite():getProperties():Is("WallN") == true or self.thumpable:getSprite():getProperties():Is(IsoFlagType.WindowN) == true or self.thumpable:getSprite():getProperties():Is("DoorWallN") == true then
            north = "North";
        end
        if self.thumpable:getSprite():getProperties():Is("WallNW") == true then
            north = "Corner";
        end
    end
    local sprite = nil;

    local paintingType = self.thumpable:getSprite():getProperties():Val("PaintingType");
    if self.isThump then
        if WPainting[paintingType] then
            sprite = WPainting[paintingType][self.painting .. north];
        end
    elseif WPainting[paintingType] then
        sprite = WPainting[paintingType][self.painting .. north];
    end
	local id = self.thumpable:getSprite():getID()
	local args = { x = self.thumpable:getX(), y = self.thumpable:getY(), z = self.thumpable:getZ(), id = id, sprite = sprite }		
	sendClientCommand(self.character, 'NewPlastering', 'NewPlasteringCommand', args)
    if not ISBuildMenu.cheat then
        self.wallpaper:Use();
		self.wallpaperGlue:Use();
    end
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISWPaintAction:new(character, thumpable, wallpaper, wallpaperGlue, painting, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.thumpable = thumpable;
	o.painting = painting;
	o.wallpaper = wallpaper;
	o.wallpaperGlue = wallpaperGlue;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
    o.isThump = true;
    if not instanceof(thumpable, "IsoThumpable") then
        o.isThump = false;
    end
    if ISBuildMenu.cheat then o.maxTime = 1; end
    o.caloriesModifier = 4;
	return o;
end

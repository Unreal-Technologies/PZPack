--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISPaintAction = ISBaseTimedAction:derive("ISPaintAction");

function ISPaintAction:isValid()
	return true;
end

function ISPaintAction:waitToStart()
    self.character:faceThisObject(self.thumpable)
    return self.character:shouldBeTurning()
end

function ISPaintAction:update()
    self.character:faceThisObject(self.thumpable)
    self.character:setMetabolicTarget(Metabolics.LightWork);
end

function ISPaintAction:start()
    self:setActionAnim(CharacterActionAnims.Paint)
    self:setOverrideHandModels("PaintBrush", nil)
    self.character:faceThisObject(self.thumpable)
    self.sound = self.character:playSound("Painting")
end

function ISPaintAction:stop()
    if self.sound then self.character:stopOrTriggerSound(self.sound) end
    ISBaseTimedAction.stop(self);
end

function ISPaintAction:perform()
    if self.sound then self.character:stopOrTriggerSound(self.sound) end
--crates
    if self.thumpable:getSprite() == getSprite("carpentry_01_16") then
        self.thumpable:setSpriteFromName("carpentry_02_104")
    end
--large table
	if self.thumpable:getSprite() == getSprite("carpentry_01_32") then
        self.thumpable:setSpriteFromName("new_carpentry_01_0")
	elseif self.thumpable:getSprite() == getSprite("carpentry_01_33") then
        self.thumpable:setSpriteFromName("new_carpentry_01_1")
	elseif self.thumpable:getSprite() == getSprite("carpentry_01_34") then
        self.thumpable:setSpriteFromName("new_carpentry_01_2")
	elseif self.thumpable:getSprite() == getSprite("carpentry_01_35") then
        self.thumpable:setSpriteFromName("new_carpentry_01_3")
    end
-- chairs
    if self.thumpable:getSprite() == getSprite("carpentry_01_44") then
        self.thumpable:setSpriteFromName("new_carpentry_01_4")
	elseif self.thumpable:getSprite() == getSprite("carpentry_01_45") then
        self.thumpable:setSpriteFromName("new_carpentry_01_5")
	elseif self.thumpable:getSprite() == getSprite("carpentry_01_46") then
        self.thumpable:setSpriteFromName("new_carpentry_01_6")
	elseif self.thumpable:getSprite() == getSprite("carpentry_01_47") then
        self.thumpable:setSpriteFromName("new_carpentry_01_7")
    end
--small table
    if self.thumpable:getSprite() == getSprite("carpentry_01_62") then
        self.thumpable:setSpriteFromName("new_carpentry_01_8")
    end
--[[ doors 
	if self.thumpable:getSprite() == getSprite("carpentry_01_56") then
        self.thumpable:setSpriteFromName("new_carpentry_01_9")
	elseif self.thumpable:getSprite() == getSprite("carpentry_01_57") then
        self.thumpable:setSpriteFromName("new_carpentry_01_10")
	elseif self.thumpable:getSprite() == getSprite("carpentry_01_58") then
        self.thumpable:setSpriteFromName("new_carpentry_01_11")
	elseif self.thumpable:getSprite() == getSprite("carpentry_01_59") then
        self.thumpable:setSpriteFromName("new_carpentry_01_12")
    end]]
--bar
    if self.thumpable:getSprite() == getSprite("carpentry_02_16") then
        self.thumpable:setSpriteFromName("new_carpentry_01_16")
    elseif self.thumpable:getSprite() == getSprite("carpentry_02_17") then
        self.thumpable:setSpriteFromName("new_carpentry_01_17")
    elseif self.thumpable:getSprite() == getSprite("carpentry_02_18") then
        self.thumpable:setSpriteFromName("new_carpentry_01_18")
    elseif self.thumpable:getSprite() == getSprite("carpentry_02_19") then
        self.thumpable:setSpriteFromName("new_carpentry_01_19")
    elseif self.thumpable:getSprite() == getSprite("carpentry_02_20") then
        self.thumpable:setSpriteFromName("new_carpentry_01_20")
    elseif self.thumpable:getSprite() == getSprite("carpentry_02_21") then
        self.thumpable:setSpriteFromName("new_carpentry_01_21")
    elseif self.thumpable:getSprite() == getSprite("carpentry_02_22") then
        self.thumpable:setSpriteFromName("new_carpentry_01_22")
    elseif self.thumpable:getSprite() == getSprite("carpentry_02_23") then
        self.thumpable:setSpriteFromName("new_carpentry_01_23")
    end 
--side table	
	if self.thumpable:getSprite() == getSprite("carpentry_02_8") then
        self.thumpable:setSpriteFromName("new_carpentry_01_28")
	elseif self.thumpable:getSprite() == getSprite("carpentry_02_9") then
        self.thumpable:setSpriteFromName("new_carpentry_01_29")
	elseif self.thumpable:getSprite() == getSprite("carpentry_02_10") then
        self.thumpable:setSpriteFromName("new_carpentry_01_30")
	elseif self.thumpable:getSprite() == getSprite("carpentry_02_11") then
        self.thumpable:setSpriteFromName("new_carpentry_01_31")
    end
--[[fence
	if self.thumpable:getSprite() == getSprite("carpentry_02_48") then
        self.thumpable:setSpriteFromName("new_carpentry_01_24")
	elseif self.thumpable:getSprite() == getSprite("carpentry_02_49") then
        self.thumpable:setSpriteFromName("new_carpentry_01_25")
	elseif self.thumpable:getSprite() == getSprite("carpentry_02_50") then
        self.thumpable:setSpriteFromName("new_carpentry_01_26")
	elseif self.thumpable:getSprite() == getSprite("carpentry_02_51") then
        self.thumpable:setSpriteFromName("new_carpentry_01_27")
    end]]
	local modData = self.thumpable:getModData();
    local north = "";
	local props = self.thumpable:getProperties()
	local name = self.thumpable:getSprite():getName()
    
	
	
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
	
	if props and props:Is("IsPaintable") then
		if self.isThump then
			if Painting[modData["wallType"]] then
				sprite = Painting[modData["wallType"]][self.painting .. north];
			elseif not OtherPainting[paintingType] then
				sprite = Painting[paintingType][self.painting .. north];
			end
		elseif Painting[paintingType] then
			sprite = Painting[paintingType][self.painting .. north];
		end
	end		
	
	if name and _BricksData[name] then
		if self.isThump then
			sprite = PaintedBricks[paintingType][self.painting .. north];
		elseif PaintedBricks[paintingType] then
			sprite = PaintedBricks[paintingType][self.painting .. north];
		end	
	end
	if name and _BlocksData[name] then
		if self.isThump then
			sprite = PaintedBlocks[paintingType][self.painting .. north];
		elseif PaintedBlocks[paintingType] then
			sprite = PaintedBlocks[paintingType][self.painting .. north];
		end
	end
	if name and _SidingData[name] then
		if self.isThump then
			sprite = Siding[paintingType][self.painting .. north];
		elseif Siding[paintingType] then
			sprite = Siding[paintingType][self.painting .. north];
		end
	end
	--[[if name and _SidingArchData[name] then
		if self.isThump then
			sprite = SidingArch[paintingType][self.painting .. north];
		elseif Siding[paintingType] then
			sprite = SidingArch[paintingType][self.painting .. north];
		end
	end]]
	local id = self.thumpable:getSprite():getID()
	local args = { x = self.thumpable:getX(), y = self.thumpable:getY(), z = self.thumpable:getZ(), id = id, sprite = sprite }
	if not sprite then
        local color = OtherPainting[paintingType][self.painting];
        self.thumpable:setCustomColor(ColorInfo.new(color.r, color.g, color.b, 1));
        self.thumpable:transmitCustomColor();
	else
		    
		sendClientCommand(self.character, 'NewPlastering', 'NewPlasteringCommand', args)
   	end
    if not ISBuildMenu.cheat then
        self.paintPot:Use();
    end
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISPaintAction:new(character, thumpable, paintPot, painting, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.thumpable = thumpable;
	o.painting = painting;
	o.paintPot = paintPot;
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

require('TimedActions/ISBaseTimedAction');
require "Moveables/ISMoveableTools"
require "Moveables/ISMoveableSpriteProps"

CleanRoomAction = ISBaseTimedAction:derive("CleanRoomAction");

local function IsBrokenGlass(square)

	local thisSquare = getCell():getGridSquare(square:getX(), square:getY(), square:getZ())

	for i=0,thisSquare:getObjects():size()-1 do
		local object = thisSquare:getObjects():get(i);
		if object and object:getTextureName() and
		luautils.stringStarts(object:getTextureName(), "brokenglass_") and
		ISMoveableTools.isObjectMoveable(object) then
			return true
		end
	end

	return false
end

local function GetConsumption(character, bleach)

	local consumption = 0.03
	local skillLevel = character:getPerkLevel(Perks.Cleaning)
	local skillDiv = 1

	if skillLevel == 10 then skillDiv = 3.5;
	elseif skillLevel >= 8 then skillDiv = 3;
	elseif skillLevel >= 6 then skillDiv = 2.5;
	elseif skillLevel >= 4 then skillDiv = 2;
	elseif skillLevel >= 2 then skillDiv = 1.5;
	end

	if character:HasTrait("Tidy") then
		consumption = consumption*0.5
	elseif character:HasTrait("CleanFreak") or character:HasTrait("Sloppy") then
		consumption = consumption*1.5
	elseif character:HasTrait("AllThumbs") then
		consumption = consumption*1.1
	elseif character:HasTrait("Dextrous") then
		consumption = consumption*0.9
	end

	if bleach:getFullType() == "Lifestyle.BucketBleachFull" then
		consumption = consumption*0.8
	end

	consumption = consumption/skillDiv

	return consumption

end

local function AdjustStatsAndAddCleaningXP(character, heavy, square)

	local xpChange = 30

	if heavy then
		xpChange = 75
	end
	
	local skillLevel = character:getPerkLevel(Perks.Cleaning)

	local currentBoredom = character:getBodyDamage():getBoredomLevel()
	if character:HasTrait("Smoker") then
		character:getStats():setStressFromCigarettes(0)
	end
	local currentStress = character:getStats():getStress();

	if skillLevel == 0 then skillLevel = 1; end

	if character:HasTrait("Sloppy") then
		xpChange = xpChange*0.5
		character:getStats():setStress(currentStress + 0.03)
		HaloTextHelper.addTextWithArrow(character, getText("IGUI_HaloNote_Stress"), true, 255, 180, 180)
	elseif character:HasTrait("CouchPotato") then
		character:getBodyDamage():setBoredomLevel(currentBoredom + 3)
		HaloTextHelper.addTextWithArrow(character, getText("IGUI_HaloNote_Boredom"), true, 255, 180, 180)
	elseif character:HasTrait("Tidy") then
		character:getBodyDamage():setBoredomLevel(currentBoredom - 3)
		character:getStats():setStress(currentStress - 0.01)
		HaloTextHelper.addTextWithArrow(character, getText("IGUI_HaloNote_Stress"), false, 170, 255, 150)
	end

	if (character:getBodyDamage():getBoredomLevel() < 0) then
		character:getBodyDamage():setBoredomLevel(0)
	end
	if (character:getBodyDamage():getBoredomLevel() > 100) then
		character:getBodyDamage():setBoredomLevel(100)
	end
	if (character:getStats():getStress() > 1) then
		character:getStats():setStress(1)
	end
	if (character:getStats():getStress() < 0) then
		character:getStats():setStress(0)
	end

	if IsBrokenGlass(square) then return; end
	if skillLevel == 10 then return; end

	xpChange = xpChange*skillLevel

	character:getXp():AddXP(Perks.Cleaning, xpChange)

	HaloTextHelper.addText(character, getText("IGUI_HaloNote_XP"), 200, 255, 200)

end

function CleanRoomAction:isValid()
	return true
end

function CleanRoomAction:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function CleanRoomAction:update()

	if self.kill then self:forceStop(); end

	self.character:faceLocation(self.square:getX(), self.square:getY())
	
	if self.count >= self.countTotal then
		self.count = 0
	local soundrandomiser = ZombRand(1, 100)
	local sound = "Broom_Sweep1"
		if self.bleach then
			if soundrandomiser >=82 then
				sound = "Mop_Clean1"
			elseif soundrandomiser >=68 then
				sound = "Mop_Clean2"
			elseif soundrandomiser >=50 then
				sound = "Mop_Clean3"
			elseif soundrandomiser >=35 then
				sound = "Mop_Clean4"
			elseif soundrandomiser >=18 then
				sound = "Mop_Clean5"
			else
				sound = "Mop_Clean6"
			end
		else
			if soundrandomiser >=80 then
				sound = "Broom_Sweep1"
			elseif soundrandomiser >=60 then
				sound = "Broom_Sweep2"
			elseif soundrandomiser >=40 then
				sound = "Broom_Sweep3"
			elseif soundrandomiser >=20 then
				sound = "Broom_Sweep4"
			else
				sound = "Broom_Sweep5"
			end
		end
		self.character:getEmitter():playSound(sound);
	else
		self.count = self.count + getGameTime():getGameWorldSecondsSinceLastUpdate()
	end
	
    self.character:setMetabolicTarget(Metabolics.LightWork)
	
end

function CleanRoomAction:start()
	local primaryItem = self.character:getPrimaryHandItem()
	if not (primaryItem) or (not instanceof(primaryItem, "InventoryItem")) or ((not primaryItem:getType()) and (not primaryItem:getFullType())) then self.kill = true; end

	if not self.kill then

		if ((primaryItem:getType()) and (primaryItem:getType() == "Broom")) or ((primaryItem:getFullType()) and (string.find(primaryItem:getFullType(), "Broom"))) then
			self:setActionAnim("Rake");
			self:setOverrideHandModels("Broom", nil);
		elseif ((primaryItem:getType()) and (primaryItem:getType() == "Mop")) or ((primaryItem:getFullType()) and (string.find(primaryItem:getFullType(), "Mop"))) then
			self:setActionAnim("Rake");
			self:setOverrideHandModels("Lifestyle.Mop", nil);
		else
			self:setActionAnim("Loot");
			self.character:SetVariable("LootPosition", "Low");
			self:setOverrideHandModels(nil, "BleachBottle");
		end
		if self.bleach and self.hasBlood then
			self.character:reportEvent("EventCleanBlood");
		else
			self.character:reportEvent("EventCleanDirt");
		end
	end
end

function CleanRoomAction:stop()
    ISBaseTimedAction.stop(self);
end

function CleanRoomAction:perform()
    --local bleach = self.character:getInventory():getItemFromType("Bleach");
	local sourceSquare = self.originalSquare
	local x = self.square:getX()
	local y = self.square:getY()
	local z = self.square:getZ()
	local isHeavy = false
	if self.bleach then
		isHeavy = true
		if self.hasBlood then
			self.dirtObject:removeBlood(false, false)
		end
	end

	AdjustStatsAndAddCleaningXP(self.character, isHeavy, self.square)
 
   -- if bleach:getThirstChange() > -0.05 then
   --     bleach:Use();
   -- end
	
	local thisSquare = getCell():getGridSquare(x, y, z)
	
	if isClient() then
	
		for i=0,thisSquare:getObjects():size()-1 do
			local object
			if (i >= 0) and (i < thisSquare:getObjects():size()) then object = thisSquare:getObjects():get(i); end
			if thisSquare:haveBlood() and isHeavy then
			
			elseif object and object:getTextureName() and
			luautils.stringStarts(object:getTextureName(), "brokenglass_") and
			ISMoveableTools.isObjectMoveable(object) then
				local moveable = ISMoveableTools.isObjectMoveable(object)
				moveable:pickUpMoveable( self.character, getCell():getGridSquare(x, y, z), object, true )
				break
			end
		end
	
		sendClientCommand("LS", "RemoveDirtTile", {x, y, z, isHeavy})

	elseif isHeavy and self.hasBlood then
	
	else
		
            
		for i=0,thisSquare:getObjects():size()-1 do
			local object
			if (i >= 0) and (i < thisSquare:getObjects():size()) then object = thisSquare:getObjects():get(i); end
			if thisSquare:haveBlood() and isHeavy then
			
			elseif object then
				local attachedsprite = object:getAttachedAnimSprite()
				if object:getTextureName() and isHeavy and
				(luautils.stringStarts(object:getTextureName(), "overlay_messages") or 
				luautils.stringStarts(object:getTextureName(), "overlay_graffiti") or 
				luautils.stringStarts(object:getTextureName(), "floors_burnt") or 
				luautils.stringStarts(object:getTextureName(), "overlay_blood") or 
				luautils.stringStarts(object:getTextureName(), "LS_HScraps") or
				luautils.stringStarts(object:getTextureName(), "blood_floor")) then
					thisSquare:RemoveTileObject(object);
				elseif object:getTextureName() and
				luautils.stringStarts(object:getTextureName(), "brokenglass_") and
				ISMoveableTools.isObjectMoveable(object) then
					local moveable = ISMoveableTools.isObjectMoveable(object)
					moveable:pickUpMoveable( self.character, getCell():getGridSquare(x, y, z), object, true )
				elseif object:getTextureName() and
				(luautils.stringStarts(object:getTextureName(), "overlay_grime") or 
				luautils.stringStarts(object:getTextureName(), "trash&junk") or 
				luautils.stringStarts(object:getTextureName(), "d_floorleaves") or 
				luautils.stringStarts(object:getTextureName(), "d_trash")) then
					thisSquare:RemoveTileObject(object);
				elseif object:getOverlaySprite() and object:getOverlaySprite():getName() and isHeavy and
				(luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_messages") or 
				luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_graffiti") or 
				luautils.stringStarts(object:getOverlaySprite():getName(), "floors_burnt") or 
				luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_blood") or 
				luautils.stringStarts(object:getOverlaySprite():getName(), "LS_HScraps") or 
				luautils.stringStarts(object:getOverlaySprite():getName(), "blood_floor")) then
					object:setOverlaySprite(nil, false)--string/transmit use nil or ""
				elseif object:getOverlaySprite() and object:getOverlaySprite():getName() and
				(luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_grime") or 
				luautils.stringStarts(object:getOverlaySprite():getName(), "trash_") or 
				luautils.stringStarts(object:getOverlaySprite():getName(), "trash&junk") or 
				luautils.stringStarts(object:getOverlaySprite():getName(), "d_floorleaves") or 
				luautils.stringStarts(object:getOverlaySprite():getName(), "d_trash") or
				luautils.stringStarts(object:getOverlaySprite():getName(), "LS_Scraps")) then
					object:setOverlaySprite(nil, false)--string/transmit use nil or ""
				elseif attachedsprite then
					for n=0,attachedsprite:size()-1 do
						local sprite
						if (n >= 0) and (n < attachedsprite:size()) then sprite = attachedsprite:get(n); end
						if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and isHeavy and 
						(luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_messages") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_graffiti") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "floors_burnt") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_blood") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "LS_HScraps") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "blood_floor")) then
							object:RemoveAttachedAnim(n)
						elseif sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and 
						(luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_grime") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "trash_") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "trash&junk") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "d_floorleaves") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "d_trash")) then
							object:RemoveAttachedAnim(n)
						end
					end
									
				end
			end
		end

	end
   
    local inventory = self.character:getInventory();
	local it = inventory:getItems();
	local BleachItem

	if self.bleach then

		local consumption
		consumption = GetConsumption(self.character, self.bleach)

		self.bleach:setThirstChange(self.bleach:getThirstChange() + consumption);
		if self.bleach:getThirstChange() > -consumption then
			self.bleach:Use();
		end
	end

	for j = 0, it:size()-1 do
		local item = it:get(j);
		if item:getType() == "Bleach" then
			BleachItem = item
			break
		end
		if item:getFullType() == "Lifestyle.BucketBleachFull" then
			BleachItem = item
			break
		end
	end
   
    -- needed to remove from queue / start next.
	if self.bleach and BleachItem and (self.bleach:getFullType() ~= "BleachEmpty" and self.bleach:getFullType() ~= "BucketEmpty") and self.bleach:isPoison() then
	LSIsCleanRoomCheck(true, sourceSquare)
	else
	LSIsCleanRoomCheck(false, sourceSquare)
	end
	
	ISBaseTimedAction.perform(self);
end

function CleanRoomAction:new(character, item, dirtObject, bleach, duration, square, originalSquare, hasBlood)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.dirtObject = dirtObject;
	o.square = square
	o.originalSquare = originalSquare
	o.item = item;
	o.bleach = bleach;
	o.hasBlood = hasBlood
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = duration;
    o.caloriesModifier = 5;
	o.count = 0
	o.countTotal = 8/GTLSCheck--40
	o.kill = false
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
	return o;
end

return CleanRoomAction
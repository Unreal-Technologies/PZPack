require "ISUI/ISInventoryPaneContextMenu"

FoldingStockSet = {
	"Base.CalicoRifle","Base.CalicoRifleFold",
	"Base.CalicoRifleThreaded","Base.CalicoRifleFoldThreaded",
    "Base.AR180","Base.AR180Fold",
    "Base.AR180Bayo","Base.AR180FoldBayo",
    "Base.AR180BayoUse","Base.AR180FoldBayoUse",
    "Base.AKMS","Base.AKMSFold",
    "Base.AKMSBayo","Base.AKMSFoldBayo",
    "Base.AKMSBayoUse","Base.AKMSFoldBayoUse",
    "Base.CalicoRifleAuto","Base.CalicoRifleFoldAuto",
	"Base.CalicoRifleAutoThreaded","Base.CalicoRifleFoldAutoThreaded",
    "Base.AR180Auto","Base.AR180FoldAuto",
    "Base.AR180BayoAuto","Base.AR180FoldBayoAuto",
    "Base.AR180BayoUseAuto","Base.AR180FoldBayoUseAuto",
    "Base.AKMSAuto","Base.AKMSFoldAuto",
    "Base.AKMSBayoAuto","Base.AKMSFoldBayoAuto",
    "Base.AKMSBayoUseAuto","Base.AKMSFoldBayoUseAuto",
    "Base.Valmet","Base.ValmetFold",
    "Base.ValmetThreaded","Base.ValmetFoldThreaded",
    "Base.HK91StockOut","Base.HK91StockIn",
    "Base.HK91StockOutAuto","Base.HK91StockInAuto",
    "Base.HK91StockOutRail","Base.HK91StockInRail",
    "Base.HK91StockOutRailAuto","Base.HK91StockInRailAuto",
    "Base.MP5StockOut","Base.MP5StockIn",
    "Base.MP5StockOutAuto","Base.MP5StockInAuto",
    "Base.MP5StockOutRail","Base.MP5StockInRail",
    "Base.MP5StockOutRailAuto","Base.MP5StockInRailAuto",
    "Base.M3GreaseGun","Base.M3GreaseGunFold",
    "Base.M3GreaseGunThreaded","Base.M3GreaseGunFoldThreaded",
    "Base.SPAS12","Base.SPAS12Fold",
    "Base.SPAS12Auto","Base.SPAS12FoldAuto",
    "Base.SPAS12Slug","Base.SPAS12FoldSlug",
    "Base.SPAS12SlugAuto","Base.SPAS12FoldSlugAuto"
}

StockInstallSet = {
	"Base.HK91","Base.HK91StockOut","Base.HK91StockIn","Base.HK91RetractStock","Base.HK91FixStock",
	"Base.HK91Rail","Base.HK91StockOutRail","Base.HK91StockInRail","Base.HK91RetractStock","Base.HK91FixStock",
	"Base.HK91Auto","Base.HK91StockOutAuto","Base.HK91StockInAuto","Base.HK91RetractStock","Base.HK91FixStock",
	"Base.HK91RailAuto","Base.HK91StockOutRailAuto","Base.HK91StockInRailAuto","Base.HK91RetractStock","Base.HK91FixStock",
	"Base.MP5","Base.MP5StockOut","Base.MP5StockIn","Base.MP5RetractStock","Base.MP5FixStock",
	"Base.MP5Rail","Base.MP5StockOutRail","Base.MP5StockInRail","Base.MP5RetractStock","Base.MP5FixStock",
}

Guns93StockAdjust = {}

Guns93StockAdjust.callAction = function(item, index, player) 
	if player:getPrimaryHandItem() ~= item or player:getSecondaryHandItem() ~= item then
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, true, true));
	end
	if item and item:getContainer() == player:getInventory() then 
		ISTimedActionQueue.add(Guns93StockAdjustAction:new(item, index, player, CharacterActionAnims.Craft, 15))
	end
	
end

Guns93StockAdjustAction = ISBaseTimedAction:derive("Guns93StockAdjustAction");

function Guns93StockAdjustAction:new(item, index, character, anim, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
    o.item = item;
	o.index = index;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.maxTime = time;
    o.caloriesModifier = 6;
	o.animation = anim
	o.useProgressBar = false;
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
	return o;
end

function Guns93StockAdjustAction:isValid() 
	local returnvalue = true
	if not self.item or self.item:getContainer() ~= self.character:getInventory() then 
		returnvalue = false;
	end
	return returnvalue;
end

function Guns93StockAdjustAction:waitToStart()
	return false;
end

function Guns93StockAdjustAction:start() 
	self.item:setJobType("Adjusting Stock");
	self.item:setJobDelta(0.0);
	self:setOverrideHandModels(self.item:getStaticModel(), nil)
	self:setActionAnim(self.animation);
end

function Guns93StockAdjustAction:perform() 
	AdjustStock(self.item, self.index, self.character)

	ISBaseTimedAction.perform(self);
end

function Guns93StockAdjustAction:update()
	self.item:setJobDelta(self:getJobDelta());
    self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function Guns93StockAdjustAction:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function AdjustStock(item, newFoldingStock, player, result)

    local result = player:getInventory():AddItem(FoldingStockSet[newFoldingStock])

	result:setCondition(item:getCondition())
    result:copyModData(item:getModData())
	result:setHaveBeenRepaired(item:getHaveBeenRepaired())
	result:setBloodLevel(item:getBloodLevel())
	result:setFavorite(item:isFavorite())
    result:setActivated(item:isActivated())
    result:setAttachedSlot(item:getAttachedSlot())
            
        if item:getSubCategory() == "Firearm" or item:getSubCategory() == "Spear" then
            result:setCurrentAmmoCount(item:getCurrentAmmoCount())
            result:setFireMode(item:getFireMode())

            if result:haveChamber() and item:isRoundChambered() then 
                result:setRoundChambered(true)
            end
            if item:isSpentRoundChambered() then
                result:setSpentRoundChambered(true)
            end
            if item:isJammed()then 
                result:setJammed(true)
            end
            if item:isContainsClip() then
                result:setContainsClip(true)
            end

            local clip = item:getClip()
            local scope = item:getScope()
            local sling = item:getSling()
            local canon = item:getCanon()
            local stock = item:getStock()
            local pad = item:getRecoilpad()
            if scope then
            result:attachWeaponPart(scope)
            end
            if sling then
            result:attachWeaponPart(sling)
            end
            if canon then
            result:attachWeaponPart(canon)
            end
            if stock then
            result:attachWeaponPart(stock)
            end
            if pad then
            result:attachWeaponPart(pad)
            end
            if clip then
            result:attachWeaponPart(clip)
            end

            local hotBar = getPlayerHotbar(player:getPlayerNum())
            local result = player:getInventory():AddItem(result)
            if hotBar:isInHotbar(item) then
			
                local itemSlot = item:getAttachedSlot()
                hotBar:removeItem(item, false)
                local slotDef = hotBar.availableSlot[itemSlot].def
                hotBar:attachItem(result, slotDef.attachments[result:getAttachmentType()], itemSlot, slotDef, false)
    
                hotBar.needsRefresh = true
                hotBar:update()
            end
            player:getInventory():DoRemoveItem(item)
            player:setPrimaryHandItem(result);
            if result:isTwoHandWeapon() then
                player:setSecondaryHandItem(result);
            end
        end
end

Guns93StockInstall = {}

Guns93StockInstall.callAction = function(item, index, player) 
    if item and item:getContainer() ~= player:getInventory() then 
        ISInventoryPaneContextMenu.transferIfNeeded(player, item)
		ISTimedActionQueue.add(Guns93StockInstallAction:new(item, index, player, CharacterActionAnims.Craft, 300))
	elseif item and item:getContainer() == player:getInventory() then
		ISTimedActionQueue.add(Guns93StockInstallAction:new(item, index, player, CharacterActionAnims.Craft, 300))
	end
	
end

Guns93StockInstallAction = ISBaseTimedAction:derive("Guns93StockInstallAction");

function Guns93StockInstallAction:new(item, index, character, anim, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
    o.item = item;
	o.index = index;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.maxTime = time;
    o.caloriesModifier = 6;
	o.animation = anim
	o.useProgressBar = false;
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
	return o;
end

function Guns93StockInstallAction:isValid() 
	local returnvalue = true
	if not self.item or self.item:getContainer() ~= self.character:getInventory() then 
		returnvalue = false;
	end
	return returnvalue;
end

function Guns93StockInstallAction:waitToStart()
	return false;
end

function Guns93StockInstallAction:start() 
	self.item:setJobType("Install Stock");
	self.item:setJobDelta(0.0);
	self:setOverrideHandModels(self.item:getStaticModel(), nil)
	self:setActionAnim(self.animation);
end

function Guns93StockInstallAction:perform() 
	StockInstall(self.item, self.index, self.character)

	ISBaseTimedAction.perform(self);
end

function Guns93StockInstallAction:update()
	self.item:setJobDelta(self:getJobDelta());
    self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function Guns93StockInstallAction:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function StockInstall(item, index, player, result)

    local result = nil
    if index % 5 == 1 then
        result = player:getInventory():AddItem(StockInstallSet[index + 1])
        StockIn = player:getInventory():FindAndReturn(StockInstallSet[index + 3])
        StockOut = player:getInventory():AddItem(StockInstallSet[index + 4])
    elseif index % 5 == 2 then
        result = player:getInventory():AddItem(StockInstallSet[index - 1])
        StockIn = player:getInventory():FindAndReturn(StockInstallSet[index + 3])
        StockOut = player:getInventory():AddItem(StockInstallSet[index + 2])
    elseif index % 5 == 3 then
        result = player:getInventory():AddItem(StockInstallSet[index - 2])
        StockIn = player:getInventory():FindAndReturn(StockInstallSet[index + 2])
        StockOut = player:getInventory():AddItem(StockInstallSet[index + 1])
    end

	result:setCondition(item:getCondition())
    result:copyModData(item:getModData())
	result:setHaveBeenRepaired(item:getHaveBeenRepaired())
	result:setBloodLevel(item:getBloodLevel())
	result:setFavorite(item:isFavorite())
    result:setActivated(item:isActivated())
    result:setAttachedSlot(item:getAttachedSlot())
            
        if item:getSubCategory() == "Firearm" then
            result:setCurrentAmmoCount(item:getCurrentAmmoCount())
            result:setFireMode(item:getFireMode())

            if result:haveChamber() and item:isRoundChambered() then
                player:getInventory():AddItem(item:getAmmoType(), 1)
            end
            if item:isSpentRoundChambered() then
                result:setSpentRoundChambered(true)
            end
            if item:isJammed()then 
                result:setJammed(true)
            end
            if item:isContainsClip() then
                result:setContainsClip(true)
            end

            local clip = item:getClip()
            local scope = item:getScope()
            local sling = item:getSling()
            local canon = item:getCanon()
            local stock = item:getStock()
            local pad = item:getRecoilpad()
            if scope then
            player:getInventory():AddItem(scope)
            end
            if sling then
            result:attachWeaponPart(sling)
            end
            if canon then
            result:attachWeaponPart(canon)
            end
            if stock then
            result:attachWeaponPart(stock)
            end
            if pad then
            result:attachWeaponPart(pad)
            end
            if clip then
            result:attachWeaponPart(clip)
            end

            local hotBar = getPlayerHotbar(player:getPlayerNum())
            local result = player:getInventory():AddItem(result)
            if hotBar:isInHotbar(item) then
			
                local itemSlot = item:getAttachedSlot()
                hotBar:removeItem(item, false)
                local slotDef = hotBar.availableSlot[itemSlot].def
                hotBar:attachItem(result, slotDef.attachments[result:getAttachmentType()], itemSlot, slotDef, false)
    
                hotBar.needsRefresh = true
                hotBar:update()
            end
            player:getInventory():DoRemoveItem(item)
            player:getInventory():DoRemoveItem(StockIn)
        end
        if player:getPrimaryHandItem() == item then
            player:setPrimaryHandItem(nil);
            if item:isTwoHandWeapon() then
                player:setSecondaryHandItem(nil);
            end
        end
        player:resetEquippedHandsModels()
end
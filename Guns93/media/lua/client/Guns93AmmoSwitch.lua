require "ISUI/ISInventoryPaneContextMenu"

AmmoTypeSet = {
    "Base.M249","Base.M249Mag","Base.556Clip","Base.M249Box",
    "Base.Win94357","Base.Win94357Spc","Base.Bullets38","Base.357Bullets",
    "Base.Win94357Threaded","Base.Win94357SpcThreaded","Base.Bullets38","Base.357Bullets",
    "Base.SW65","Base.SW65Spc","Base.Bullets38","Base.357Bullets",
    "Base.SW586","Base.SW586Spc","Base.Bullets38","Base.357Bullets",
    "Base.SW586Rail","Base.SW586SpcRail","Base.Bullets38","Base.357Bullets",
    "Base.SecuritySix","Base.SecuritySixSpc","Base.Bullets38","Base.357Bullets",
    "Base.SecuritySixRail","Base.SecuritySixSpcRail","Base.Bullets38","Base.357Bullets",
    "Base.GP100","Base.GP100Spc","Base.Bullets38","Base.357Bullets",
    "Base.GP100Rail","Base.GP100SpcRail","Base.Bullets38","Base.357Bullets",
    "Base.GP101","Base.GP101Spc","Base.Bullets38","Base.357Bullets",
    "Base.Python","Base.PythonSpc","Base.Bullets38","Base.357Bullets",
    "Base.SW625Clip","Base.Revolver","Base.Bullets45","Base.45Moonclip",
    "Base.SW625ClipRail","Base.SW625Rail","Base.Bullets45","Base.45Moonclip",
    "Base.Shotgun","Base.Rem870Slug","Base.Slugs","Base.ShotgunShells",
    "Base.ShotgunSawnoff","Base.SORem870Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SORem870Threaded","Base.SORem870SlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.Rem870P","Base.Rem870PSlug","Base.Slugs","Base.ShotgunShells",
    "Base.Rem870PThreaded","Base.Rem870PSlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.M870","Base.M870Slug","Base.Slugs","Base.ShotgunShells",
    "Base.M870Threaded","Base.M870SlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.M870Bayo","Base.M870SlugBayo","Base.Slugs","Base.ShotgunShells",
    "Base.M870BayoThreaded","Base.M870SlugBayoThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.Moss500","Base.Moss500Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SOMoss500","Base.SOMoss500Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SOMoss500Threaded","Base.SOMoss500SlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.Moss590","Base.Moss590Slug","Base.Slugs","Base.ShotgunShells",
    "Base.M590","Base.M590Slug","Base.Slugs","Base.ShotgunShells",
    "Base.M590Threaded","Base.M590SlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.M590Bayo","Base.M590SlugBayo","Base.Slugs","Base.ShotgunShells",
    "Base.M590BayoThreaded","Base.M590SlugBayoThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.Win1912","Base.Win1912Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SOWin1912","Base.SOWin1912Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SOWin1912Threaded","Base.SOWin1912SlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.Win1200","Base.Win1200Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SOWin1200","Base.SOWin1200Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SOWin1200Threaded","Base.SOWin1200SlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.Win1200Def","Base.Win1200DefSlug","Base.Slugs","Base.ShotgunShells",
    "Base.Win1200DefThreaded","Base.Win1200DefSlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.Ithaca37","Base.Ithaca37Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SOIthaca37","Base.SOIthaca37Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SOIthaca37Threaded","Base.SOIthaca37SlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.Ithaca37Riot","Base.Ithaca37RiotSlug","Base.Slugs","Base.ShotgunShells",
    "Base.Ithaca37RiotThreaded","Base.Ithaca37RiotSlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.Auto5","Base.Auto5Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SOAuto5","Base.SOAuto5Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SOAuto5Threaded","Base.SOAuto5SlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.BenelliM3","Base.BenelliM3Slug","Base.Slugs","Base.ShotgunShells",
    "Base.BenelliM3Threaded","Base.BenelliM3SlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.SPAS12","Base.SPAS12Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SPAS12Fold","Base.SPAS12FoldSlug","Base.Slugs","Base.ShotgunShells",
    "Base.SPAS12Auto","Base.SPAS12SlugAuto","Base.Slugs","Base.ShotgunShells",
    "Base.SPAS12FoldAuto","Base.SPAS12FoldSlugAuto","Base.Slugs","Base.ShotgunShells",
    "Base.Win1400","Base.Win1400Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SOWin1400","Base.SOWin1400Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SOWin1400Threaded","Base.SOWin1400SlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.Rem1100","Base.Rem1100Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SORem1100","Base.SORem1100Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SORem1100Threaded","Base.SORem1100SlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.Beretta682","Base.Beretta682Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SOBeretta682","Base.SOBeretta682Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SOBeretta682Threaded","Base.SOBeretta682SlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.BrownCitori","Base.BrownCitoriSlug","Base.Slugs","Base.ShotgunShells",
    "Base.SOBrownCitori","Base.SOBrownCitoriSlug","Base.Slugs","Base.ShotgunShells",
    "Base.SOBrownCitoriThreaded","Base.SOBrownCitoriSlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.DoubleBarrelShotgun","Base.StoegerUplanderSlug","Base.Slugs","Base.ShotgunShells",
    "Base.DoubleBarrelShotgunSawnoff","Base.SOStoegerUplanderSlug","Base.Slugs","Base.ShotgunShells",
    "Base.SOStoegerUplanderThreaded","Base.SOStoegerUplanderSlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.SavageFox","Base.SavageFoxSlug","Base.Slugs","Base.ShotgunShells",
    "Base.SOSavageFox","Base.SOSavageFoxSlug","Base.Slugs","Base.ShotgunShells",
    "Base.SOSavageFoxThreaded","Base.SOSavageFoxSlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.L395K","Base.L395KSlug","Base.Slugs","Base.ShotgunShells",
    "Base.SOL395K","Base.SOL395KSlug","Base.Slugs","Base.ShotgunShells",
    "Base.SOL395KThreaded","Base.SOL395KSlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.Win37","Base.Win37Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SOWin37","Base.SOWin37Slug","Base.Slugs","Base.ShotgunShells",
    "Base.SOWin37Threaded","Base.SOWin37SlugThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.Auto5_Auto","Base.Auto5Slug_Auto","Base.Slugs","Base.ShotgunShells",
    "Base.SOAuto5_Auto","Base.SOAuto5Slug_Auto","Base.Slugs","Base.ShotgunShells",
    "Base.SOAuto5_AutoThreaded","Base.SOAuto5Slug_AutoThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.BenelliM3Auto","Base.BenelliM3SlugAuto","Base.Slugs","Base.ShotgunShells",
    "Base.BenelliM3AutoThreaded","Base.BenelliM3SlugAutoThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.Win1400Auto","Base.Win1400SlugAuto","Base.Slugs","Base.ShotgunShells",
    "Base.SOWin1400Auto","Base.SOWin1400SlugAuto","Base.Slugs","Base.ShotgunShells",
    "Base.SOWin1400AutoThreaded","Base.SOWin1400SlugAutoThreaded","Base.Slugs","Base.ShotgunShells",
    "Base.Rem1100Auto","Base.Rem1100SlugAuto","Base.Slugs","Base.ShotgunShells",
    "Base.SORem1100Auto","Base.SORem1100SlugAuto","Base.Slugs","Base.ShotgunShells",
    "Base.SORem1100AutoThreaded","Base.SORem1100SlugAutoThreaded","Base.Slugs","Base.ShotgunShells"
}

Guns93AmmoSwitch = {}

Guns93AmmoSwitch.callAction = function(item, index, player) 
	if player:getPrimaryHandItem() ~= item or player:getSecondaryHandItem() ~= item then
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, true, true));
	end
	if item and item:getContainer() == player:getInventory()  then 
		ISTimedActionQueue.add(Guns93AmmoSwitchAction:new(item, index, player, CharacterActionAnims.Craft, 0))
	end
end

Guns93AmmoSwitchAction = ISBaseTimedAction:derive("Guns93AmmoSwitchAction");

function Guns93AmmoSwitchAction:new(item, index, character, anim, time)
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

function Guns93AmmoSwitchAction:isValid() 
	local returnvalue = true
	if not self.item or self.item:getContainer() ~= self.character:getInventory() then 
		returnvalue = false;
	end
	return returnvalue;
end

function Guns93AmmoSwitchAction:waitToStart()
	return false;
end

function Guns93AmmoSwitchAction:start()
	self.item:setJobType("Switch Ammo Type");
	self.item:setJobDelta(0.0);
	self:setOverrideHandModels(self.item:getStaticModel(), nil)
    if self.item:getCurrentAmmoCount() > 0 or self.item:isRoundChambered() then
        if self.item:isContainsClip() then
            ISTimedActionQueue.add(ISEjectMagazine:new(self.character, self.item))
        else
            ISTimedActionQueue.add(ISUnloadBulletsFromFirearm:new(self.character, self.item, false))
        end
        if self.item:isRoundChambered() then
            ISTimedActionQueue.add(ISRackFirearm:new(self.character, self.item))
        end
        return ISTimedActionQueue.add(Guns93AmmoSwitchAction:new(self.item, self.index, self.character, self.animation, 0))
    end
end

function Guns93AmmoSwitchAction:perform()
	AmmoSwitch(self.item, self.index, self.character)

    ISBaseTimedAction.perform(self);
end

function Guns93AmmoSwitchAction:update()
	self.item:setJobDelta(self:getJobDelta());
    self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function Guns93AmmoSwitchAction:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function AmmoSwitch(item, index, player, result)
    
    if item:getCurrentAmmoCount() == 0 then
        local result = nil
        if index % 4 == 1 then
            result = player:getInventory():AddItem(AmmoTypeSet[index + 1])
        elseif index % 4 == 2 then
            result = player:getInventory():AddItem(AmmoTypeSet[index - 1])
        end

        result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
        result:setHaveBeenRepaired(item:getHaveBeenRepaired())
        result:setBloodLevel(item:getBloodLevel())
        result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
            
        if item:getSubCategory() == "Firearm" then
            result:setFireMode(item:getFireMode())

            if item:isSpentRoundChambered() then
                result:setSpentRoundChambered(true)
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
        if result:getMagazineType() then
            local magazine = result:getBestMagazine(player)
            if magazine then
                ISInventoryPaneContextMenu.transferIfNeeded(player, magazine)
                ISInventoryPaneContextMenu.equipWeapon(result, true, false, player:getPlayerNum())
                ISTimedActionQueue.add(ISInsertMagazine:new(player, result, magazine))
            end
        else
	        ISTimedActionQueue.add(ISReloadWeaponAction:new(player, result))
        end
    end
end
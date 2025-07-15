require "ISUI/ISInventoryPaneContextMenu"

FixBayonetSet = {
    "Base.AKM","Base.AKMBayo","Base.AKBayonet",
    "Base.AKMAuto","Base.AKMBayoAuto","Base.AKBayonet",
    "Base.AKMS","Base.AKMSBayo","Base.AKBayonet",
    "Base.AKMSAuto","Base.AKMSBayoAuto","Base.AKBayonet",
    "Base.AKMSFold","Base.AKMSFoldBayo","Base.AKBayonet",
    "Base.AKMSFoldAuto","Base.AKMSFoldBayoAuto","Base.AKBayonet",
    "Base.SKS","Base.SKSBayoOut","null",
    "Base.SKSAuto","Base.SKSBayoOutAuto","null",
    "Base.SKSThreaded","Base.SKSBayoOutThreaded","null",
    "Base.SKSAutoThreaded","Base.SKSBayoOutAutoThreaded","null",
    "Base.T56","Base.T56BayoOut","null",
    "Base.T56Auto","Base.T56BayoOutAuto","null",
    "Base.T56Threaded","Base.T56BayoOutThreaded","null",
    "Base.T56AutoThreaded","Base.T56BayoOutAutoThreaded","null",
    "Base.M1Garand","Base.M1GarandBayo","Base.M5Bayonet",
    "Base.M1GarandThreaded","Base.M1GarandBayoThreaded","Base.M5Bayonet",
    "Base.M1GarandAuto","Base.M1GarandBayoAuto","Base.M5Bayonet",
    "Base.M1GarandAutoThreaded","Base.M1GarandBayoAutoThreaded","Base.M5Bayonet",
    "Base.M1Carbine","Base.M1CarbineBayo","Base.M4Bayonet",
    "Base.M1CarbineThreaded","Base.M1CarbineBayoThreaded","Base.M4Bayonet",
    "Base.M1CarbineAuto","Base.M1CarbineBayoAuto","Base.M4Bayonet",
    "Base.M1CarbineAutoThreaded","Base.M1CarbineBayoAutoThreaded","Base.M4Bayonet",
    "Base.AssaultRifle2","Base.M14Bayo","Base.M6Bayonet",
    "Base.M14Rail","Base.M14RailBayo","Base.M6Bayonet",
    "Base.M14308Auto","Base.M14BayoAuto","Base.M6Bayonet",
    "Base.M14RailAuto","Base.M14RailBayoAuto","Base.M6Bayonet",
    "Base.M1A","Base.M1ABayo","Base.M6Bayonet",
    "Base.M1ARail","Base.M1ARailBayo","Base.M6Bayonet",
    "Base.M1AAuto","Base.M1ABayoAuto","Base.M6Bayonet",
    "Base.M1ARailAuto","Base.M1ARailBayoAuto","Base.M6Bayonet",
    "Base.M1903","Base.M1903Bayo","Base.M1905Bayonet",
    "Base.M1903Threaded","Base.M1903BayoThreaded","Base.M1905Bayonet",
    "Base.M1917","Base.M1917Bayo","Base.M1917Bayonet",
    "Base.M1917Threaded","Base.M1917BayoThreaded","Base.M1917Bayonet",
    "Base.Mauser98K","Base.Mauser98KBayo","Base.MauserBayonet",
    "Base.Mauser98KThreaded","Base.Mauser98KBayoThreaded","Base.MauserBayonet",
    "Base.AssaultRifle","Base.M16A2Bayo","Base.M9Bayonet",
    "Base.M16A2Rail","Base.M16A2RailBayo","Base.M9Bayonet",
    "Base.M723","Base.M723Bayo","Base.M9Bayonet",
    "Base.M723Rail","Base.M723RailBayo","Base.M9Bayonet",
    "Base.AR15","Base.AR15Bayo","Base.M9Bayonet",
    "Base.AR15Rail","Base.AR15RailBayo","Base.M9Bayonet",
    "Base.AR15Auto","Base.AR15BayoAuto","Base.M9Bayonet",
    "Base.AR15RailAuto","Base.AR15RailBayoAuto","Base.M9Bayonet",
    "Base.CAR15","Base.CAR15Bayo","Base.M9Bayonet",
    "Base.CAR15Rail","Base.CAR15RailBayo","Base.M9Bayonet",
    "Base.CAR15Auto","Base.CAR15BayoAuto","Base.M9Bayonet",
    "Base.CAR15RailAuto","Base.CAR15RailBayoAuto","Base.M9Bayonet",
    "Base.AR180","Base.AR180Bayo","Base.M9Bayonet",
    "Base.AR180Fold","Base.AR180FoldBayo","Base.M9Bayonet",
    "Base.AR180Auto","Base.AR180BayoAuto","Base.M9Bayonet",
    "Base.AR180FoldAuto","Base.AR180FoldBayoAuto","Base.M9Bayonet",
    "Base.M870","Base.M870Bayo","Base.M9Bayonet",
    "Base.M870Threaded","Base.M870BayoThreaded","Base.M9Bayonet",
    "Base.M870Slug","Base.M870SlugBayo","Base.M9Bayonet",
    "Base.M870SlugThreaded","Base.M870SlugBayoThreaded","Base.M9Bayonet",
    "Base.M590","Base.M590Bayo","Base.M9Bayonet",
    "Base.M590Threaded","Base.M590BayoThreaded","Base.M9Bayonet",
    "Base.M590Slug","Base.M590SlugBayo","Base.M9Bayonet",
    "Base.M590SlugThreaded","Base.M590SlugBayoThreaded","Base.M9Bayonet"
}

UseBayonetSet = {
    "Base.AKMBayo","Base.AKMBayoUse",
    "Base.AKMBayoAuto","Base.AKMBayoUseAuto",
    "Base.AKMSBayo","Base.AKMSBayoUse",
    "Base.AKMSFoldBayo","Base.AKMSFoldBayoUse",
    "Base.AKMSBayoAuto","Base.AKMSBayoUseAuto",
    "Base.AKMSFoldBayoAuto","Base.AKMSFoldBayoUseAuto",
    "Base.SKSBayoOut","Base.SKSBayoUse",
    "Base.SKSBayoOutAuto","Base.SKSBayoUseAuto",
    "Base.T56BayoOut","Base.T56BayoUse",
    "Base.T56BayoOutAuto","Base.T56BayoUseAuto",
    "Base.M1GarandBayo","Base.M1GarandBayoUse",
    "Base.M1GarandBayoThreaded","Base.M1GarandBayoUseThreaded",
    "Base.M1GarandBayoAuto","Base.M1GarandBayoUseAuto",
    "Base.M1GarandBayoAutoThreaded","Base.M1GarandBayoUseAutoThreaded",
    "Base.M1CarbineBayo","Base.M1CarbineBayoUse",
    "Base.M1CarbineBayoThreaded","Base.M1CarbineBayoUseThreaded",
    "Base.M1CarbineBayoAuto","Base.M1CarbineBayoUseAuto",
    "Base.M1CarbineBayoAutoThreaded","Base.M1CarbineBayoUseAutoThreaded",
    "Base.M14Bayo","Base.M14BayoUse",
    "Base.M14RailBayo","Base.M14RailBayoUse",
    "Base.M14BayoAuto","Base.M14BayoUseAuto",
    "Base.M14RailBayoAuto","Base.M14RailBayoUseAuto",
    "Base.M1ABayo","Base.M1ABayoUse",
    "Base.M1ARailBayo","Base.M1ARailBayoUse",
    "Base.M1ABayoAuto","Base.M1ABayoUseAuto",
    "Base.M1ARailBayoAuto","Base.M1ARailBayoUseAuto",
    "Base.M1903Bayo","Base.M1903BayoUse",
    "Base.M1903BayoThreaded","Base.M1903BayoUseThreaded",
    "Base.M1917Bayo","Base.M1917BayoUse",
    "Base.M1917BayoThreaded","Base.M1917BayoUseThreaded",
    "Base.Mauser98KBayo","Base.Mauser98KBayoUse",
    "Base.Mauser98KBayoThreaded","Base.Mauser98KBayoUseThreaded",
    "Base.M16A2Bayo","Base.M16A2BayoUse",
    "Base.M16A2RailBayo","Base.M16A2RailBayoUse",
    "Base.M723Bayo","Base.M723BayoUse",
    "Base.M723RailBayo","Base.M723RailBayoUse",
    "Base.AR15Bayo","Base.AR15BayoUse",
    "Base.AR15RailBayo","Base.AR15RailBayoUse",
    "Base.AR15BayoAuto","Base.AR15BayoUseAuto",
    "Base.AR15RailBayoAuto","Base.AR15RailBayoUseAuto",
    "Base.CAR15Bayo","Base.CAR15BayoUse",
    "Base.CAR15RailBayo","Base.CAR15RailBayoUse",
    "Base.CAR15BayoAuto","Base.CAR15BayoUseAuto",
    "Base.CAR15RailBayoAuto","Base.CAR15RailBayoUseAuto",
    "Base.AR180Bayo","Base.AR180BayoUse",
    "Base.AR180FoldBayo","Base.AR180FoldBayoUse",
    "Base.AR180BayoAuto","Base.AR180BayoUseAuto",
    "Base.AR180FoldBayoAuto","Base.AR180FoldBayoUseAuto",
    "Base.M870Bayo","Base.M870BayoUse",
    "Base.M870BayoThreaded","Base.M870BayoUseThreaded",
    "Base.M870SlugBayo","Base.M870SlugBayoUse",
    "Base.M870SlugBayoThreaded","Base.M870SlugBayoUseThreaded",
    "Base.M590Bayo","Base.M590BayoUse",
    "Base.M590BayoThreaded","Base.M590BayoUseThreaded",
    "Base.M590SlugBayo","Base.M590SlugBayoUse",
    "Base.M590SlugBayoThreaded","Base.M590SlugBayoUseThreaded"
}

Guns93FixBayonet = {}

function MuzzleDeviceCheck(item)
    if not SandboxVars.Guns93.Guns93BayoDistro then
        local canon = item:getCanon()
        if not canon then
            return true
        end
        if canon then
            if canon:getTags():contains("Choke") then
                return true
            elseif canon:getModData().isSilencerCon == TRUE or canon:getModData().isMuzzleBrake == TRUE then
                return false
            end
        end
    elseif SandboxVars.Guns93.Guns93BayoDistro == TRUE then
	    return false
    end
end

Guns93FixBayonet.callAction = function(item, index, player, bayo) 
    if item and item:getContainer() ~= player:getInventory() then
        ISInventoryPaneContextMenu.transferIfNeeded(player, item)
        if player:getPrimaryHandItem() ~= item or player:getSecondaryHandItem() ~= item then
            ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, true, true));
        end
        if item:getTags():contains("FoldingBayo") then
            ISTimedActionQueue.add(Guns93FixBayonetAction:new(item, index, player, bayo, CharacterActionAnims.Craft, 15))
        else
		    ISTimedActionQueue.add(Guns93FixBayonetAction:new(item, index, player, bayo, CharacterActionAnims.Craft, 60))
        end
	elseif item and item:getContainer() == player:getInventory() then
        if player:getPrimaryHandItem() ~= item or player:getSecondaryHandItem() ~= item then
            ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, true, true));
        end
        if item:getTags():contains("FoldingBayo") then
            ISTimedActionQueue.add(Guns93FixBayonetAction:new(item, index, player, bayo, CharacterActionAnims.Craft, 15))
        else
		    ISTimedActionQueue.add(Guns93FixBayonetAction:new(item, index, player, bayo, CharacterActionAnims.Craft, 60))
        end
	end
end

Guns93FixBayonetAction = ISBaseTimedAction:derive("Guns93FixBayonetAction");

function Guns93FixBayonetAction:new(item, index, character, bayo, anim, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
    o.item = item;
	o.index = index;
    o.bayo = bayo;
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

function Guns93FixBayonetAction:isValid() 
	local returnvalue = true
	if not self.item or self.item:getContainer() ~= self.character:getInventory() then 
		returnvalue = false;
	end
	return returnvalue;
end

function Guns93FixBayonetAction:waitToStart()
	return false;
end

function Guns93FixBayonetAction:start() 
	self.item:setJobType("Add/Remove Bayonet");
	self.item:setJobDelta(0.0);
	self:setOverrideHandModels(self.item:getStaticModel(), nil)
	self:setActionAnim(self.animation);
end

function Guns93FixBayonetAction:perform() 
	FixBayonet(self.item, self.index, self.character, self.bayo)

	ISBaseTimedAction.perform(self);
end

function Guns93FixBayonetAction:update()
	self.item:setJobDelta(self:getJobDelta());
    self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function Guns93FixBayonetAction:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function FixBayonet(item, index, player, bayo)

    local result = nil

    if (index % 3 == 1) then
        result = player:getInventory():AddItem(FixBayonetSet[index + 1])
        bayo = player:getInventory():FindAndReturn(FixBayonetSet[index + 2])
    elseif index % 3 == 2 then
        result = player:getInventory():AddItem(FixBayonetSet[index - 1])
        bayo = player:getInventory():AddItem(FixBayonetSet[index + 1])
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

            if item:getTags():contains("FoldingBayo") then
                result:getModData().modBayo_Con = (item:getModData().modBayo_Con)
                result:getModData().modBayo_Repair = (item:getModData().modBayo_Repair)
            elseif index % 3 == 1 then
                result:getModData().modBayo_Con = (bayo:getCondition())
                result:getModData().modBayo_Repair = (bayo:getHaveBeenRepaired())
                player:getInventory():DoRemoveItem(bayo)
            else
                bayo:setCondition(item:getModData().modBayo_Con)
                bayo:setBloodLevel(item:getBloodLevel())
                bayo:setHaveBeenRepaired(item:getModData().modBayo_Repair)
            end
            player:getInventory():DoRemoveItem(item)
            player:setPrimaryHandItem(result);
            if result:isTwoHandWeapon() then
                player:setSecondaryHandItem(result);
            end
        end
end

Guns93UseBayonet = {}

Guns93UseBayonet.callAction = function(item, index, player) 
	if player:getPrimaryHandItem() ~= item or player:getSecondaryHandItem() ~= item then
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, true, true));
	end
	if item and item:getContainer() == player:getInventory() then 
		ISTimedActionQueue.add(Guns93UseBayonetAction:new(item, index, player, CharacterActionAnims.Craft, 0))
	end
	
end

Guns93UseBayonetAction = ISBaseTimedAction:derive("Guns93UseBayonetAction");

function Guns93UseBayonetAction:new(item, index, character, anim, time)
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

function Guns93UseBayonetAction:isValid() 
	local returnvalue = true
	if not self.item or self.item:getContainer() ~= self.character:getInventory() then 
		returnvalue = false;
	end
    if not self.item:getTags():contains("BayoUsed") then
        if self.item:getModData().modBayo_Con == 0 then
            getPlayer():setHaloNote("Bayonet Is Broken!") 
            returnvalue = false;
        end
    end
	return returnvalue;
end

function Guns93UseBayonetAction:waitToStart()
	return false;
end

function Guns93UseBayonetAction:start() 
	self.item:setJobType("Toggle Bayonet Use");
	self.item:setJobDelta(0.0);
	self:setOverrideHandModels(self.item:getStaticModel(), nil)
end

function Guns93UseBayonetAction:perform() 
	UseBayonet(self.item, self.index, self.character)

	ISBaseTimedAction.perform(self);
end

function Guns93UseBayonetAction:update()
	self.item:setJobDelta(self:getJobDelta());
    self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function Guns93UseBayonetAction:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function UseBayonet(item, NewUseBayonetSet, player, result)

    local result = player:getInventory():AddItem(UseBayonetSet[NewUseBayonetSet])

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

            if item:getModData()['modBayo_Con'] then
                local moditem = item:getModData()
                local modresult = result:getModData()
                modresult.modBayo_Con = (moditem.modBayo_Con)
                if item:getModData()['modBayo_Repair'] then
                    modresult.modBayo_Repair = (moditem.modBayo_Repair)
                end
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
        player:resetEquippedHandsModels()
end

local UseBayonet = {}

UseBayonet.ToggleBayonet = function()
	local player = getPlayer()
	local item = player:getPrimaryHandItem()

	if item == nil or not item:getTags():contains("Bayonet") or not player:isItemInBothHands(item) then
		do return end
	end
	for index, preset in ipairs(UseBayonetSet) do
		if preset == item:getFullType() then
			local indexMod = (index % 2) * 2 - 1
			Guns93UseBayonet.callAction(item, index + indexMod, player)
		end
	end
end

UseBayonet.addHotkey = function()
	local bindings = {
		{
			name = '[BayonetUse]'
		},
	
		{
			value = 'UseBayonet_Toggle',
			key = Keyboard.KEY_Z,
		},
	}

	for _, bind in ipairs(bindings) do
		if bind.name then
			table.insert(keyBinding, { value = bind.name, key = nil })
		else
			if bind.key then
				table.insert(keyBinding, { value = bind.value, key = bind.key })
			end
		end
	end
end

UseBayonet.onKeyPressed = function(key)
	local player = getPlayer()
	if player == nil then return end
	local item = player:getPrimaryHandItem()
	if item == nil or not item:getTags():contains("Bayonet") then return end
	if player:isItemInBothHands(item) and item:getTags():contains("Bayonet") then 
		if item:getModData().modBayo_Con > 0 then
			if key == getCore():getKey("UseBayonet_Toggle") then
				UseBayonet.ToggleBayonet()
			end
		elseif item:getModData().modBayo_Con == 0 then
			if key == getCore():getKey("UseBayonet_Toggle") then
				getPlayer():setHaloNote("Bayonet Is Broken!")
			end
		elseif not item:getTags():contains("Bayonet") then
			do return end
		end
	end
end

UseBayonet.addHotkey()
Events.OnKeyPressed.Add(UseBayonet.onKeyPressed)

return UseBayonet
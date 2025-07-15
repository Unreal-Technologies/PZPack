require "ISUI/ISInventoryPaneContextMenu"


GunRailSet = {
    "Base.Gov1911","Base.Gov1911Rail","Base.1911Rail",
    "Base.Gov1911Threaded","Base.Gov1911RailThreaded","Base.1911Rail",
    "Base.Pistol2","Base.M1911A1Rail","Base.1911Rail",
    "Base.M1911A1Threaded","Base.M1911A1RailThreaded","Base.1911Rail",
    "Base.DeltaElite","Base.DeltaEliteRail","Base.1911Rail",
    "Base.DeltaEliteThreaded","Base.DeltaEliteRailThreaded","Base.1911Rail",
    "Base.Longslide","Base.LongslideRail","Base.1911Rail",
    "Base.LongslideThreaded","Base.LongslideRailThreaded","Base.1911Rail",
    "Base.Javelina","Base.JavelinaRail","Base.1911Rail",
    "Base.JavelinaThreaded","Base.JavelinaRailThreaded","Base.1911Rail",
    "Base.SW625","Base.SW625Rail","Base.RevolverRail",
    "Base.SW625Clip","Base.SW625ClipRail","Base.RevolverRail",
    "Base.SW29","Base.SW29Rail","Base.RevolverRail",
    "Base.SW17","Base.SW17Rail","Base.RevolverRail",
    "Base.SW586","Base.SW586Rail","Base.RevolverRail",
    "Base.SW586Spc","Base.SW586SpcRail","Base.RevolverRail",
    "Base.GP100","Base.GP100Rail","Base.RevolverRail",
    "Base.GP100Spc","Base.GP100SpcRail","Base.RevolverRail",
    "Base.Anaconda","Base.AnacondaRail","Base.RevolverRail",
    "Base.SecuritySix","Base.SecuritySixRail","Base.RevolverRail",
    "Base.SecuritySixSpc","Base.SecuritySixSpcRail","Base.RevolverRail",
    "Base.Python","Base.PythonRail","Base.RevolverRail",
    "Base.PythonSpc","Base.PythonSpcRail","Base.RevolverRail",
    "Base.AssaultRifle","Base.M16A2Rail","Base.M16Mount",
    "Base.M16A2Bayo","Base.M16A2RailBayo","Base.M16Mount",
    "Base.M16A2BayoUse","Base.M16A2RailBayoUse","Base.M16Mount",
    "Base.M723","Base.M723Rail","Base.M16Mount",
    "Base.M723Bayo","Base.M723RailBayo","Base.M16Mount",
    "Base.M723BayoUse","Base.M723RailBayoUse","Base.M16Mount",
    "Base.M733","Base.M733Rail","Base.M16Mount",
    "Base.M635","Base.M635Rail","Base.M16Mount",
    "Base.AR15","Base.AR15Rail","Base.M16Mount",
    "Base.AR15Bayo","Base.AR15RailBayo","Base.M16Mount",
    "Base.AR15BayoUse","Base.AR15RailBayoUse","Base.M16Mount",
    "Base.AR15Auto","Base.AR15RailAuto","Base.M16Mount",
    "Base.AR15BayoAuto","Base.AR15RailBayoAuto","Base.M16Mount",
    "Base.AR15BayoUseAuto","Base.AR15RailBayoUseAuto","Base.M16Mount",
    "Base.CAR15","Base.CAR15Rail","Base.M16Mount",
    "Base.CAR15Bayo","Base.CAR15RailBayo","Base.M16Mount",
    "Base.CAR15BayoUse","Base.CAR15RailBayoUse","Base.M16Mount",
    "Base.CAR15Auto","Base.CAR15RailAuto","Base.M16Mount",
    "Base.CAR15BayoAuto","Base.CAR15RailBayoAuto","Base.M16Mount",
    "Base.CAR15BayoUseAuto","Base.CAR15RailBayoUseAuto","Base.M16Mount",
    "Base.AssaultRifle2","Base.M14Rail","Base.M14Mount",
    "Base.M14Bayo","Base.M14RailBayo","Base.M14Mount",
    "Base.M14BayoUse","Base.M14RailBayoUse","Base.M14Mount",
    "Base.M14Auto","Base.M14RailAuto","Base.M14Mount",
    "Base.M14BayoAuto","Base.M14RailBayoAuto","Base.M14Mount",
    "Base.M14BayoUseAuto","Base.M14RailBayoUseAuto","Base.M14Mount",
    "Base.M1A","Base.M1ARail","Base.M14Mount",
    "Base.M1ABayo","Base.M1ARailBayo","Base.M14Mount",
    "Base.M1ABayoUse","Base.M1ARailBayoUse","Base.M14Mount",
    "Base.M1AAuto","Base.M1ARailAuto","Base.M14Mount",
    "Base.M1ABayoAuto","Base.M1ARailBayoAuto","Base.M14Mount",
    "Base.M1ABayoUseAuto","Base.M1ARailBayoUseAuto","Base.M14Mount",
    "Base.Mini14","Base.Mini14Rail","Base.Mini14Mount",
    "Base.Mini14Threaded","Base.Mini14RailThreaded","Base.Mini14Mount",
    "Base.Mini14Auto","Base.Mini14RailAuto","Base.Mini14Mount",
    "Base.Mini14AutoThreaded","Base.Mini14RailAutoThreaded","Base.Mini14Mount",
    "Base.Mini30","Base.Mini30Rail","Base.Mini14Mount",
    "Base.Mini30Threaded","Base.Mini30RailThreaded","Base.Mini14Mount",
    "Base.Mini30Auto","Base.Mini30RailAuto","Base.Mini14Mount",
    "Base.Mini30AutoThreaded","Base.Mini30RailAutoThreaded","Base.Mini14Mount",
    "Base.HK91","Base.HK91Rail","Base.HKClaw",
    "Base.HK91StockOut","Base.HK91StockOutRail","Base.HKClaw",
    "Base.HK91StockIn","Base.HK91StockInRail","Base.HKClaw",
    "Base.MP5","Base.MP5Rail","Base.HKClaw",
    "Base.MP5StockOut","Base.MP5StockOutRail","Base.HKClaw",
    "Base.MP5StockIn","Base.MP5StockInRail","Base.HKClaw"
}

InstallRemoveRail = {}

InstallRemoveRail.callAction = function(item, index, player, rail)
    if item and item:getContainer() ~= player:getInventory() then
        ISInventoryPaneContextMenu.transferIfNeeded(player, item)
        ISTimedActionQueue.add(InstallRemoveRailAction:new(item, index, player, rail, CharacterActionAnims.Craft, 200))
	elseif item and item:getContainer() == player:getInventory() then
		ISTimedActionQueue.add(InstallRemoveRailAction:new(item, index, player, rail, CharacterActionAnims.Craft, 200))
	end
end

InstallRemoveRailAction = ISBaseTimedAction:derive("InstallRemoveRailAction");

function InstallRemoveRailAction:new(item, index, character, rail, anim, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
    o.item = item;
	o.index = index;
    o.rail = rail;
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

function InstallRemoveRailAction:isValid() 
	local returnvalue = true
	if not self.item or self.item:getContainer() ~= self.character:getInventory() then 
		returnvalue = false;
	end
	return returnvalue;
end

function InstallRemoveRailAction:waitToStart()
	return false;
end

function InstallRemoveRailAction:start() 
	self.item:setJobType("Add/Remove rail");
	self.item:setJobDelta(0.0);
	self:setOverrideHandModels(self.item:getStaticModel(), nil)
	self:setActionAnim(self.animation);
end

function InstallRemoveRailAction:perform() 
	FixRail(self.item, self.index, self.character, self.rail)

	ISBaseTimedAction.perform(self);
end

function InstallRemoveRailAction:update()
	self.item:setJobDelta(self:getJobDelta());
    self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function InstallRemoveRailAction:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function FixRail(item, index, player, rail)

    local result = nil

    if index % 3 == 1 then
        result = player:getInventory():AddItem(GunRailSet[index + 1])
        rail = player:getInventory():FindAndReturn(GunRailSet[index + 2])
    elseif index % 3 == 2 then
        result = player:getInventory():AddItem(GunRailSet[index - 1])
        rail = player:getInventory():AddItem(GunRailSet[index + 1])
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
        if item:getModData()['modBayo_Con'] then
            result:getModData().modBayo_Con = (item:getModData().modBayo_Con)
            if item:getModData()['modBayo_Repair'] then
                result:getModData().modBayo_Repair = (item:getModData().modBayo_Repair)
            end
        end
        player:getInventory():DoRemoveItem(item)           
        if index % 3 == 1 then
            player:getInventory():DoRemoveItem(rail)
        end
    end
    if player:getPrimaryHandItem() == item then
        player:setPrimaryHandItem(nil);
        if item:isTwoHandWeapon() then
            player:setSecondaryHandItem(nil);
        end
    end
    player:resetEquippedHandsModels();
end
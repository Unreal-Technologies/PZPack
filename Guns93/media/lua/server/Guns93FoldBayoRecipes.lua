require "recipecode.lua"

--------------Mount Bayonet--------------
function Recipe.OnCreate.SKSBayoInstall(items, result, player)

    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "SKSNoBayo" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
        
            if item:getSubCategory() == "Firearm" then
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
                result:setCurrentAmmoCount(item:getCurrentAmmoCount())
                
                result:setFireMode(item:getFireMode())
                
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
            break
        end
    end
    for i=1,items:size() do
        local Bayo = items:get(i-1)
        if Bayo:getType() == "SKSBayonet" then
            result:getModData().modBayo_Con = (Bayo:getCondition())
            result:getModData().modBayo_Repair = (Bayo:getHaveBeenRepaired())
        end   
    end
end

function Recipe.OnCreate.SKSBayoUninstall(items, result, player)

    player:getInventory():AddItem("Base.Screws", 1)

    for i=1,items:size() do
        local item = items:get(i-1)

        if item:getType() == "SKS" or item:getType() == "SKSBayoOut" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
        
            if item:getSubCategory() == "Firearm" then
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
                result:setCurrentAmmoCount(item:getCurrentAmmoCount())
                
                result:setFireMode(item:getFireMode())
                
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
                Bayonet = player:getInventory():AddItem("Base.SKSBayonet")
                Bayonet:setCondition(item:getModData().modBayo_Con)
                Bayonet:setBloodLevel(item:getBloodLevel())
                Bayonet:setHaveBeenRepaired(item:getModData().modBayo_Repair)
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
            break
        end
    end
end

function Recipe.OnCreate.T56BayoInstall(items, result, player)

    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "T56NoBayo" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
        
            if item:getSubCategory() == "Firearm" then
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
                result:setCurrentAmmoCount(item:getCurrentAmmoCount())
                
                result:setFireMode(item:getFireMode())
                
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
            break
        end
    end
    for i=1,items:size() do
        local Bayo = items:get(i-1)
        if Bayo:getType() == "T56Bayonet" then
            result:getModData().modBayo_Con = (Bayo:getCondition())
            result:getModData().modBayo_Repair = (Bayo:getHaveBeenRepaired())
        end   
    end
end

function Recipe.OnCreate.T56BayoUninstall(items, result, player)

    player:getInventory():AddItem("Base.Screws", 1)

    for i=1,items:size() do
        local item = items:get(i-1)

        if item:getType() == "T56" or item:getType() == "T56BayoOut" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
        
            if item:getSubCategory() == "Firearm" then
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
                result:setCurrentAmmoCount(item:getCurrentAmmoCount())
                
                result:setFireMode(item:getFireMode())
                
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
                Bayonet = player:getInventory():AddItem("Base.T56Bayonet")
                Bayonet:setCondition(item:getModData().modBayo_Con)
                Bayonet:setBloodLevel(item:getBloodLevel())
                Bayonet:setHaveBeenRepaired(item:getModData().modBayo_Repair)
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
            break
        end
    end
end
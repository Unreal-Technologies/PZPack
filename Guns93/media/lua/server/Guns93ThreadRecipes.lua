require "recipecode.lua"

--------------Muzzle Threading--------------
function Recipe.OnCreate.CovertFirearm(items, result, player)
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getSubCategory() == "Firearm" then
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
            break
        end
    end
end

function Recipe.OnCreate.M1911A1RailThreaded(items, result, player)
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "M1911A1Threaded" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
            
            if item:getSubCategory() == "Firearm" then
                if result:haveChamber() and item:isRoundChambered() then -- Chamber Check
                    result:setRoundChambered(true)
                end
                if item:isSpentRoundChambered() then
                    result:setSpentRoundChambered(true)
                end
                if item:isJammed()then -- Jam check
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
                player:setPrimaryHandItem(result);
                if result:isTwoHandWeapon() then
                    player:setSecondaryHandItem(result);
                end
            break
        end
    end
end

function Recipe.OnCreate.M1911A1Threaded(items, result, player)
    player:getInventory():AddItem("1911Rail");
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "M1911A1RailThreaded" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
           
            if item:getSubCategory() == "Firearm" then
                if result:haveChamber() and item:isRoundChambered() then -- Chamber Check
                    result:setRoundChambered(true)
                end
                if item:isSpentRoundChambered() then
                    result:setSpentRoundChambered(true)
                end
                if item:isJammed()then -- Jam check
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
                player:setPrimaryHandItem(result);
                if result:isTwoHandWeapon() then
                    player:setSecondaryHandItem(result);
                end
            break
        end
    end
end

function Recipe.OnCreate.Gov1911RailThreaded(items, result, player)
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "Gov1911Threaded" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
            
            if item:getSubCategory() == "Firearm" then
                if result:haveChamber() and item:isRoundChambered() then -- Chamber Check
                    result:setRoundChambered(true)
                end
                if item:isSpentRoundChambered() then
                    result:setSpentRoundChambered(true)
                end
                if item:isJammed()then -- Jam check
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
                player:setPrimaryHandItem(result);
                if result:isTwoHandWeapon() then
                    player:setSecondaryHandItem(result);
                end
            break
        end
    end
end

function Recipe.OnCreate.Gov1911Threaded(items, result, player)
    player:getInventory():AddItem("1911Rail");
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "Gov1911RailThreaded" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
           
            if item:getSubCategory() == "Firearm" then
                if result:haveChamber() and item:isRoundChambered() then -- Chamber Check
                    result:setRoundChambered(true)
                end
                if item:isSpentRoundChambered() then
                    result:setSpentRoundChambered(true)
                end
                if item:isJammed()then -- Jam check
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
                player:setPrimaryHandItem(result);
                if result:isTwoHandWeapon() then
                    player:setSecondaryHandItem(result);
                end
            break
        end
    end
end

function Recipe.OnCreate.DeltaEliteRailThreaded(items, result, player)
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "DeltaEliteThreaded" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
            
            if item:getSubCategory() == "Firearm" then
                if result:haveChamber() and item:isRoundChambered() then -- Chamber Check
                    result:setRoundChambered(true)
                end
                if item:isSpentRoundChambered() then
                    result:setSpentRoundChambered(true)
                end
                if item:isJammed()then -- Jam check
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
                player:setPrimaryHandItem(result);
                if result:isTwoHandWeapon() then
                    player:setSecondaryHandItem(result);
                end
            break
        end
    end
end

function Recipe.OnCreate.DeltaEliteThreaded(items, result, player)
    player:getInventory():AddItem("1911Rail");
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "DeltaEliteRailThreaded" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
           
            if item:getSubCategory() == "Firearm" then
                if result:haveChamber() and item:isRoundChambered() then -- Chamber Check
                    result:setRoundChambered(true)
                end
                if item:isSpentRoundChambered() then
                    result:setSpentRoundChambered(true)
                end
                if item:isJammed()then -- Jam check
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
                player:setPrimaryHandItem(result);
                if result:isTwoHandWeapon() then
                    player:setSecondaryHandItem(result);
                end
            break
        end
    end
end

function Recipe.OnCreate.LongslideRailThreaded(items, result, player)
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "LongslideThreaded" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
            
            if item:getSubCategory() == "Firearm" then
                if result:haveChamber() and item:isRoundChambered() then -- Chamber Check
                    result:setRoundChambered(true)
                end
                if item:isSpentRoundChambered() then
                    result:setSpentRoundChambered(true)
                end
                if item:isJammed()then -- Jam check
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
                player:setPrimaryHandItem(result);
                if result:isTwoHandWeapon() then
                    player:setSecondaryHandItem(result);
                end
            break
        end
    end
end

function Recipe.OnCreate.LongslideThreaded(items, result, player)
    player:getInventory():AddItem("1911Rail");
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "LongslideRailThreaded" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
           
            if item:getSubCategory() == "Firearm" then
                if result:haveChamber() and item:isRoundChambered() then -- Chamber Check
                    result:setRoundChambered(true)
                end
                if item:isSpentRoundChambered() then
                    result:setSpentRoundChambered(true)
                end
                if item:isJammed()then -- Jam check
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
                player:setPrimaryHandItem(result);
                if result:isTwoHandWeapon() then
                    player:setSecondaryHandItem(result);
                end
            break
        end
    end
end

function Recipe.OnCreate.JavelinaRailThreaded(items, result, player)
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "JavelinaThreaded" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
            
            if item:getSubCategory() == "Firearm" then
                if result:haveChamber() and item:isRoundChambered() then -- Chamber Check
                    result:setRoundChambered(true)
                end
                if item:isSpentRoundChambered() then
                    result:setSpentRoundChambered(true)
                end
                if item:isJammed()then -- Jam check
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
                player:setPrimaryHandItem(result);
                if result:isTwoHandWeapon() then
                    player:setSecondaryHandItem(result);
                end
            break
        end
    end
end

function Recipe.OnCreate.JavelinaThreaded(items, result, player)
    player:getInventory():AddItem("1911Rail");
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "JavelinaRailThreaded" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
           
            if item:getSubCategory() == "Firearm" then
                if result:haveChamber() and item:isRoundChambered() then -- Chamber Check
                    result:setRoundChambered(true)
                end
                if item:isSpentRoundChambered() then
                    result:setSpentRoundChambered(true)
                end
                if item:isJammed()then -- Jam check
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
                player:setPrimaryHandItem(result);
                if result:isTwoHandWeapon() then
                    player:setSecondaryHandItem(result);
                end
            break
        end
    end
end

--------------Threaded Weapon Recipes--------------
function Recipe.OnCreate.Mini14RailThreaded(items, result, player)
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "Mini14Threaded" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
        
            
            if item:getSubCategory() == "Firearm" then
                if result:haveChamber() and item:isRoundChambered() then -- Chamber Check
                    result:setRoundChambered(true)
                end
                if item:isSpentRoundChambered() then
                    result:setSpentRoundChambered(true)
                end
                if item:isJammed()then -- Jam check
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
                player:setPrimaryHandItem(result);
                if result:isTwoHandWeapon() then
                    player:setSecondaryHandItem(result);
                end
            break
        end
    end
end

function Recipe.OnCreate.Mini14Threaded(items, result, player)
    player:getInventory():AddItem("Mini14Mount");
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "Mini14RailThreaded" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
           
            if item:getSubCategory() == "Firearm" then
                if result:haveChamber() and item:isRoundChambered() then -- Chamber Check
                    result:setRoundChambered(true)
                end
                if item:isSpentRoundChambered() then
                    result:setSpentRoundChambered(true)
                end
                if item:isJammed()then -- Jam check
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
                player:setPrimaryHandItem(result);
                if result:isTwoHandWeapon() then
                    player:setSecondaryHandItem(result);
                end
            break
        end
    end
end

function Recipe.OnCreate.Mini30RailThreaded(items, result, player)
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "Mini30Threaded" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
        
            
            if item:getSubCategory() == "Firearm" then
                if result:haveChamber() and item:isRoundChambered() then -- Chamber Check
                    result:setRoundChambered(true)
                end
                if item:isSpentRoundChambered() then
                    result:setSpentRoundChambered(true)
                end
                if item:isJammed()then -- Jam check
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
                player:setPrimaryHandItem(result);
                if result:isTwoHandWeapon() then
                    player:setSecondaryHandItem(result);
                end
            break
        end
    end
end

function Recipe.OnCreate.Mini30Threaded(items, result, player)
    player:getInventory():AddItem("Mini14Mount");
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getType() == "Mini30RailThreaded" then
		result:setCondition(item:getCondition())
        result:copyModData(item:getModData())
		result:setHaveBeenRepaired(item:getHaveBeenRepaired())
		result:setBloodLevel(item:getBloodLevel())
		result:setFavorite(item:isFavorite())
        result:setActivated(item:isActivated())
        result:setAttachedSlot(item:getAttachedSlot())
           
            if item:getSubCategory() == "Firearm" then
                if result:haveChamber() and item:isRoundChambered() then -- Chamber Check
                    result:setRoundChambered(true)
                end
                if item:isSpentRoundChambered() then
                    result:setSpentRoundChambered(true)
                end
                if item:isJammed()then -- Jam check
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
                player:setPrimaryHandItem(result);
                if result:isTwoHandWeapon() then
                    player:setSecondaryHandItem(result);
                end
            break
        end
    end
end
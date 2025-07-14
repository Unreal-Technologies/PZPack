require "recipecode.lua"

--------------My Recipes Start--------------
RemoveInstallFoldBayoSet = {
    "Base.SKS","Base.SKSBayonet",
    "Base.SKSAuto","Base.SKSBayonet",
    "Base.SKSThreaded","Base.SKSBayonet",
    "Base.SKSAutoThreaded","Base.SKSBayonet",
    "Base.SKSNoBayo","Base.Base.SKSBayonet",
    "Base.SKSNoBayoAuto","Base.SKSBayonet",
    "Base.SKSNoBayoThreaded","Base.SKSBayonet",
    "Base.SKSNoBayoAutoThreaded","Base.SKSBayonet",
    "Base.SKSBayoOut","Base.SKSBayonet",
    "Base.SKSBayoOutAuto","Base.SKSBayonet",
    "Base.SKSBayoOutThreaded","Base.SKSBayonet",
    "Base.SKSBayoOutAutoThreaded","Base.SKSBayonet",   
    "Base.T56","Base.T56Bayonet",
    "Base.T56Auto","Base.T56Bayonet",
    "Base.T56Threaded","Base.T56Bayonet",
    "Base.T56AutoThreaded","Base.T56Bayonet",
    "Base.T56NoBayo","Base.T56Bayonet",
    "Base.T56NoBayoAuto","Base.T56Bayonet",
    "Base.T56NoBayoThreaded","Base.T56Bayonet",
    "Base.T56NoBayoAutoThreaded","Base.T56Bayonet",
    "Base.T56BayoOut","Base.T56Bayonet",
    "Base.T56BayoOutAuto","Base.T56Bayonet",
    "Base.T56BayoOutThreaded","Base.T56Bayonet",
    "Base.T56BayoOutAutoThreaded","Base.T56Bayonet"
}

function Recipe.OnCreate.RemoveInstallFoldBayo(items, result, player)
    local foldingBayo = false
    for i=0,items:size() - 1 do
        local item = items:get(i)
        for index, preset in ipairs(RemoveInstallFoldBayoSet) do
            if (index % 2) == 1 and preset == item:getFullType() then
                if item:getTags():contains("FoldingBayo") then
                    foldingBayo = true
                end
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
                    if foldingBayo then
                        for index, preset in ipairs(RemoveInstallFoldBayoSet) do
                            if (index % 2) == 1 and preset == item:getFullType() then
                                local bayo = player:getInventory():AddItem(RemoveInstallFoldBayoSet[index + 1])
                                player:getInventory():AddItem("Base.Screws", 1)
                                if item:getModData()['modBayo_Con'] then
                                    bayo:setCondition(item:getModData().modBayo_Con)
                                end
                                bayo:setBloodLevel(item:getBloodLevel())
                                if item:getModData()['modBayo_Repair'] then
                                    bayo:setHaveBeenRepaired(item:getModData().modBayo_Repair)
                                end
                            end
                        end
                    end    
                    player:getInventory():DoRemoveItem(item)
                break
            end
        end
    end
    for i=1,items:size() - 1 do            
        local installbayo = items:get(i)
        if installbayo:getFullType():contains("Bayonet") then
            if result:getModData()['modBayo_Con'] then
                result:getModData().modBayo_Con = (installbayo:getCondition())
            end
            if result:getModData()['modBayo_Repair'] then
                result:getModData().modBayo_Repair = (installbayo:getHaveBeenRepaired())
            end
            player:getInventory():DoRemoveItem(installbayo)
        end
    end
end

function Recipe.OnCreate.SawOffBarrel(items, result, player)
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
                player:getInventory():AddItem(canon)
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

function Recipe.OnCreate.SawOffStock(items, result, player)
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
                player:getInventory():AddItem(scope)
                end
                if sling then
                player:getInventory():AddItem(sling)
                end
                if canon then
                result:attachWeaponPart(canon)
                end
                if stock then
                player:getInventory():AddItem(stock)
                end
                if pad then
                player:getInventory():AddItem(pad)
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

function Recipe.OnCreate.BeltLink556(items, result, player)
    player:getInventory():AddItems("Base.556BeltLink", 1);
end

function Recipe.OnCreate.BeltLink308(items, result, player)
    player:getInventory():AddItems("Base.308BeltLink", 1);
end

function Recipe.OnCreate.AmmoCountZero(items, result, player)
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getMaxAmmo() then
            if item:getCurrentAmmoCount() > 0 then
                if getDebug() then
                    print("Ammo Type ---------------------------------------------------------------", item:getFullType())
                    print("Ammo Type ---------------------------------------------------------------", item:getAmmoType())
                    print("Ammo Count ---------------------------------------------------------------", item:getCurrentAmmoCount())
                end
                ISTimedActionQueue.add(ISUnloadBulletsFromMagazine:new(player, item))
                return
            elseif item:getCurrentAmmoCount() == 0 then
                player:getInventory():DoRemoveItem(item)
            end
        end
    end
end

function Recipe.OnCreate.CanCondition(items, result, player)
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getCategory() == "WeaponPart" then
            if item:getModData()["isSilencer"] then
                if item:getCondition() then
                    result:setCondition(item:getCondition())
                end
            end
        end
    end
end

function Recipe.OnCreate.DisassembleOilFilterSilencer(items, result, player)
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getCondition() then
            result:setCondition(item:getCondition())
        end
        player:getInventory():AddItem("Base.ThreadAdapter", 1)
    end
end

function Recipe.OnCreate.DisassembleBoostedSilencer(items, result, player)
    for i=1,items:size() do
        local item = items:get(i-1)
        if item:getCondition() then
            result:setCondition(item:getCondition())
        end
        player:getInventory():AddItem("Base.CanBooster", 1)
    end
end
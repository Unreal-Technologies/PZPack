require "TimedActions/ISBaseTimedAction"

local function predicateNotBroken(item)
	return not item:isBroken()
end

local ISInventoryPaneContextMenu_createMenu_old = ISInventoryPaneContextMenu.createMenu
ISInventoryPaneContextMenu.createMenu = function(player, isInPlayerInventory, items, x, y, origin)

    if ISInventoryPaneContextMenu.dontCreateMenu then return; end

    if UIManager.getSpeedControls():getCurrentGameSpeed() == 0 then
        return;
    end

    local context = ISContextMenu.get(player, x, y);

    context.origin = origin;
    local itemsCraft = {};
    local c = 0;
    local isWeapon = nil;
    local isHandWeapon = nil;
    local recipe = nil;
    local baseItem = nil;
    local canBeActivated = false;
    local unequip = false;
    local isReloadable = false;
    local canBeEquippedBack = false;
    local canBeEquippedTorsoExtra = false;
    local twoHandsItem = nil;
    local brokenObject = nil;
    local canBeRenamed = nil;
    local force2Hands = false;
    local inPlayerInv = nil;
    local drainable = nil;
    local magazine = nil;
    local bullet = nil;

    local playerObj = getSpecificPlayer(player)

    ISInventoryPaneContextMenu.removeToolTip();

    getCell():setDrag(nil, player);

    local containerList = ISInventoryPaneContextMenu.getContainers(playerObj)
    local testItem = nil;
    local editItem = nil;
    for i,v in ipairs(items) do
        testItem = v;
        if not instanceof(v, "InventoryItem") then
            --print(#v.items);
            if #v.items == 2 then
                editItem = v.items[1];
            end
            testItem = v.items[1];
        else
            editItem = v
        end
        if not testItem:getTags():contains("Guns93") or not testItem:getModData()["modAuto_Recoil"] then
            return ISInventoryPaneContextMenu_createMenu_old(player, isInPlayerInventory, items, x, y, origin)
        end
        if testItem:isBroken() or testItem:getCondition() < testItem:getConditionMax() then
            brokenObject = testItem;
        end
        if instanceof(testItem, "DrainableComboItem") then
            drainable = testItem;
        end
        if testItem:getContainer() and testItem:getContainer():isInCharacterInventory(playerObj) then
            inPlayerInv = testItem;
        end
        if testItem:getMaxAmmo() > 0 and not instanceof(testItem, "HandWeapon") then
            magazine = testItem;
        end
        if testItem:getDisplayCategory() == "Ammo" then
            bullet = testItem;
        end
        if getSpecificPlayer(player):isEquipped(testItem) then
            unequip = true;
        end
        if testItem:canBeActivated() and (testItem == getSpecificPlayer(player):getSecondaryHandItem() or testItem == getSpecificPlayer(player):getPrimaryHandItem()) then
            canBeActivated = true;
        end
        -- all items can be equiped
        if (instanceof(testItem, "HandWeapon") and testItem:getCondition() > 0) or (instanceof(testItem, "InventoryItem") and not instanceof(testItem, "HandWeapon")) then
            isWeapon = testItem;
        end
        if instanceof(testItem, "HandWeapon") then
            isHandWeapon = testItem
        end
        if instanceof(testItem, "InventoryContainer") and ( testItem:canBeEquipped() == "Back" )then
            canBeEquippedBack = true;
        end
        if instanceof(testItem, "InventoryContainer") and (  testItem:canBeEquipped() == "TorsoExtra" )then
            canBeEquippedTorsoExtra = true;
        end
        if instanceof(testItem, "InventoryContainer") then
            canBeRenamed = testItem;
        end
        if testItem:isTwoHandWeapon() and testItem:getCondition() > 0 then
            twoHandsItem = testItem;
        end
        if testItem:isRequiresEquippedBothHands() and testItem:getCondition() > 0 then
            force2Hands = true;
        end
        --> Stormy
        if(not getCore():isNewReloading() and ReloadUtil:isReloadable(testItem, getSpecificPlayer(player))) then
            isReloadable = true;
        end
        
        itemsCraft[c + 1] = testItem;

        c = c + 1;
        -- you can equip only 1 weapon
        if c > 1 then
            --~             isWeapon = false;
            isHandWeapon = nil
            canBeActivated = false;
            isReloadable = false;
            unequip = false;
            canBeEquippedBack = false;
            canBeEquippedTorsoExtra = false;
            brokenObject = nil;
        end
    end

    triggerEvent("OnPreFillInventoryObjectContextMenu", player, context, items);

    context.blinkOption = ISInventoryPaneContextMenu.blinkOption;

    if editItem and c == 1 and ((isClient() and playerObj:getAccessLevel() ~= "None" and playerObj:getAccessLevel() ~= "Observer") and playerObj:getInventory():contains(editItem, true) or isDebugEnabled()) then
        context:addOption(getText("ContextMenu_EditItem"), items, ISInventoryPaneContextMenu.onEditItem, playerObj, testItem);
    end

    -- check the recipe
    if #itemsCraft > 0 then
        local sameType = true
        for i=2,#itemsCraft do
            if itemsCraft[i]:getFullType() ~= itemsCraft[1]:getFullType() then
                sameType = false
                break
            end
        end
        if sameType then
            recipe = RecipeManager.getUniqueRecipeItems(itemsCraft[1], playerObj, containerList);
        end
    end


    if c == 0 then
        return;
    end
    local loot = getPlayerLoot(player);

    if not isInPlayerInventory then
        ISInventoryPaneContextMenu.doGrabMenu(context, items, player);
    end

    if(isInPlayerInventory and loot.inventory ~= nil and loot.inventory:getType() ~= "floor" ) and playerObj:getJoypadBind() == -1 then
        if ISInventoryPaneContextMenu.isAnyAllowed(loot.inventory, items) and not ISInventoryPaneContextMenu.isAllFav(items) then
            local label = loot.title and getText("ContextMenu_PutInContainer", loot.title) or getText("ContextMenu_Put_in_Container")
            context:addOption(label, items, ISInventoryPaneContextMenu.onPutItems, player);
        end
    end

    -- Move To
    local moveItems = ISInventoryPane.getActualItems(items)
    if #moveItems > 0 and playerObj:getJoypadBind() ~= -1 then
        local subMenu = nil
        local moveTo0 = ISInventoryPaneContextMenu.canUnpack(moveItems, player)
        local moveTo2 = ISInventoryPaneContextMenu.canMoveTo(moveItems, playerObj:getPrimaryHandItem(), player)
        local moveTo3 = ISInventoryPaneContextMenu.canMoveTo(moveItems, playerObj:getSecondaryHandItem(), player)
        local moveTo4 = ISInventoryPaneContextMenu.canMoveTo(moveItems, ISInventoryPage.floorContainer[player+1], player)
        local inventoryItems = playerObj:getInventory():getItems()
        for i=1,inventoryItems:size() do
            local item = inventoryItems:get(i-1)
        end
        local putIn = isInPlayerInventory and
                        loot.inventory and loot.inventory:getType() ~= "floor" and
                        ISInventoryPaneContextMenu.isAnyAllowed(loot.inventory, items) and
                        not ISInventoryPaneContextMenu.isAllFav(moveItems)
        if moveTo0 or moveTo2 or moveTo3 or moveTo4 or putIn then
            local option = context:addOption(getText("ContextMenu_Move_To"))
            local subMenu = context:getNew(context)
            context:addSubMenu(option, subMenu)
            local subOption
            if moveTo0 then
                subOption = subMenu:addOption(getText("ContextMenu_MoveToInventory"), moveItems, ISInventoryPaneContextMenu.onMoveItemsTo, playerInv, player)
                if not ISInventoryPaneContextMenu.hasRoomForAny(playerObj, playerInv, moveItems) then
                    subOption.notAvailable = true
                end
            end
            if moveTo2 then
                subOption = subMenu:addOption(moveTo2:getName(), moveItems, ISInventoryPaneContextMenu.onMoveItemsTo, moveTo2:getInventory(), player)
                if not ISInventoryPaneContextMenu.hasRoomForAny(playerObj, moveTo2, moveItems) then
                    subOption.notAvailable = true
                end
            end
            if moveTo3 then
                subOption = subMenu:addOption(moveTo3:getName(), moveItems, ISInventoryPaneContextMenu.onMoveItemsTo, moveTo3:getInventory(), player)
                if not ISInventoryPaneContextMenu.hasRoomForAny(playerObj, moveTo3, moveItems) then
                    subOption.notAvailable = true
                end
            end
            if putIn then
                subOption = subMenu:addOption(loot.title and loot.title or getText("ContextMenu_MoveToContainer"), moveItems, ISInventoryPaneContextMenu.onPutItems, player)
                if not ISInventoryPaneContextMenu.hasRoomForAny(playerObj, loot.inventory, moveItems) then
                    subOption.notAvailable = true
                end
            end
            if moveTo4 then
                subOption = subMenu:addOption(getText("ContextMenu_Floor"), moveItems, ISInventoryPaneContextMenu.onMoveItemsTo, moveTo4, player)
                if not ISInventoryPaneContextMenu.hasRoomForAny(playerObj, moveTo4, moveItems) then
                    subOption.notAvailable = true
                end
            end
        end

        if isInPlayerInventory then
            context:addOption(getText("IGUI_invpage_Transfer_all"), getPlayerInventory(player), ISInventoryPage.transferAll)
        else
            context:addOption(getText("IGUI_invpage_Loot_all"), loot, ISInventoryPage.lootAll)
        end
    end
    
    if #moveItems and playerObj:getJoypadBind() == -1 then
        if ISInventoryPaneContextMenu.canUnpack(moveItems, player) then
            context:addOption(getText("ContextMenu_Unpack"), moveItems, ISInventoryPaneContextMenu.onMoveItemsTo, playerObj:getInventory(), player)
        end
    end

    if inPlayerInv then
       if inPlayerInv:isFavorite() then
           context:addOption(getText("ContextMenu_Unfavorite"), moveItems, ISInventoryPaneContextMenu.onFavorite, inPlayerInv, false)
       else
           context:addOption(getText("IGUI_CraftUI_Favorite"), moveItems, ISInventoryPaneContextMenu.onFavorite, inPlayerInv, true)
       end
    end

    if canBeEquippedTorsoExtra and not unequip then
        context:addOption(getText("Wear Vest"), items, ISInventoryPaneContextMenu.onWearItems, player);
    end

    if (twoHandsItem or force2Hands) and (playerObj:getPrimaryHandItem() ~= twoHandsItem or playerObj:getSecondaryHandItem() ~= twoHandsItem) then
        context:addOption(getText("ContextMenu_Equip_Two_Hands"), items, ISInventoryPaneContextMenu.OnTwoHandsEquip, player);
    end
    if isWeapon and not force2Hands then
        -- check if hands if not heavy damaged
        if (playerObj:getPrimaryHandItem() ~= isWeapon or (playerObj:getPrimaryHandItem() == isWeapon and playerObj:getSecondaryHandItem() == isWeapon)) and not getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):isDeepWounded() and (getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getFractureTime() == 0 or getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getSplintFactor() > 0) then
            context:addOption(getText("ContextMenu_Equip_Primary"), items, ISInventoryPaneContextMenu.OnPrimaryWeapon, player);
        end
        if (playerObj:getSecondaryHandItem() ~= isWeapon or (playerObj:getPrimaryHandItem() == isWeapon and playerObj:getSecondaryHandItem() == isWeapon)) and not getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):isDeepWounded() and (getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getFractureTime() == 0 or getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getSplintFactor() > 0) then
            context:addOption(getText("ContextMenu_Equip_Secondary"), items, ISInventoryPaneContextMenu.OnSecondWeapon, player);
        end
    end
    -- weapon upgrades
    isWeapon = isHandWeapon -- to allow upgrading broken weapons
    local weaponParts = getSpecificPlayer(player):getInventory():getItemsFromCategory("WeaponPart")
    local hasScrewdriver = getSpecificPlayer(player):getInventory():containsTagEvalRecurse("Screwdriver", predicateNotBroken)
    local hasWrench = getSpecificPlayer(player):getInventory():getItemFromType("Wrench")
    local useWrench = false
    local noScrewdriver = false
    local useScrewdriver = false
    if isWeapon and instanceof(isWeapon, "HandWeapon") then
        local subMenuUp = context:getNew(context);
        local doIt = false;
        local addOption = false;
        for index, preset in ipairs(FixBayonetSet) do
            if index % 3 == 1 and preset == isWeapon:getFullType() and (MuzzleDeviceCheck(isWeapon) == true) then
                local bayo = nil
                local bayoReady = false
                bayo = FixBayonetSet[index + 2]
                if bayo ~= nil then
                    if getSpecificPlayer(player):getInventory():FindAndReturn(FixBayonetSet[index + 2]) then
                        local newbayo = getSpecificPlayer(player):getInventory():FindAndReturn(FixBayonetSet[index + 2])
                        if not newbayo:isBroken() then
                            doIt = true;
                            subMenuUp:addOption(ScriptManager.instance:getItem(bayo):getDisplayName(), isWeapon, Guns93FixBayonet.callAction, index, getSpecificPlayer(player), newbayo)
                        end
                    end
                end
            end
        end
        for index, preset in ipairs(GunRailSet) do
            if index % 3 == 1 and preset == isWeapon:getFullType() then
                local rail = nil
                rail = GunRailSet[index + 2]
                if rail ~= nil then
                    if getSpecificPlayer(player):getInventory():getItemFromType(rail) then
                        local newRail =getSpecificPlayer(player):getInventory():getItemFromType(rail)
                        if newRail:getTags():contains("Wrench") and hasWrench then
                            useWrench = true
                        end
                        if newRail:getTags():contains("NoScrewdriver") then
                            noScrewdriver = true
                        end				
                        if newRail:getTags():contains("UseDriver") and hasScrewdriver then
                            useScrewdriver = true
                        end
                        if useWrench or noScrewdriver or useScrewdriver then
                            doIt = true;
                            subMenuUp:addOption(ScriptManager.instance:getItem(rail):getDisplayName(), isWeapon, InstallRemoveRail.callAction, index, getSpecificPlayer(player), newRail)
                        end
                    end
                end
            end
        end
        for index, preset in ipairs(StockInstallSet) do
            if (index % 5 == 1 or index % 5 == 2 or index % 5 == 3) and preset == isWeapon:getFullType() then
                local newStock = nil
                if isWeapon:getSubCategory() == "Firearm" then
                    if index % 5 == 1 or index % 5 == 2 then
                        newStock = StockInstallSet[index + 3]
                    elseif index % 5 == 3 then
                        newStock = StockInstallSet[index + 2]
                    end
                    if newStock ~= nil then
                        if getSpecificPlayer(player):getInventory():getItemFromType(newStock) then
                            doIt = true;
                            subMenuUp:addOption(ScriptManager.instance:getItem(newStock):getDisplayName(), isWeapon, Guns93StockInstall.callAction, index, getSpecificPlayer(player))
                        end
                    end
                end
            end
        end
        if weaponParts and not weaponParts:isEmpty() then  
            local alreadyDoneList = {};
            for i=0, weaponParts:size() - 1 do
                local part = weaponParts:get(i);
                if part:getTags():contains("Wrench") and hasWrench then
                    if not hasWrench:isBroken() then
                    useWrench = true
                    end
                end
                if part:getTags():contains("NoScrewdriver") then
                    noScrewdriver = true
                end				
                if part:getTags():contains("UseDriver") and hasScrewdriver then
                    useScrewdriver = true
                end
                for index, preset in ipairs(Guns93AttchmentGroups) do
                    if (index % 6) == 1 and preset == isWeapon:getFullType() then
                        if (part:getMountOn():contains(Guns93AttchmentGroups[index + 1]) or part:getMountOn():contains(Guns93AttchmentGroups[index + 2]) or part:getMountOn():contains(Guns93AttchmentGroups[index + 3]) or part:getMountOn():contains(Guns93AttchmentGroups[index + 4]) or part:getMountOn():contains(Guns93AttchmentGroups[index + 5])) and not alreadyDoneList[part:getName()] then
                            if (part:getPartType() == "Scope") and not isWeapon:getScope() then
                                if useWrench or noScrewdriver or useScrewdriver then
                                    addOption = true;
                                    subMenuUp:addOption(weaponParts:get(i):getName(), isWeapon, ISInventoryPaneContextMenu.onUpgradeWeapon, part, getSpecificPlayer(player));
                                end
                            elseif (part:getPartType() == "Clip") and not isWeapon:getClip() then
                                if useWrench or noScrewdriver or useScrewdriver then
                                    addOption = true;
                                end
                            elseif (part:getPartType() == "Sling") and not isWeapon:getSling() then
                                if useWrench or noScrewdriver or useScrewdriver then
                                    addOption = true;
                                    subMenuUp:addOption(weaponParts:get(i):getName(), isWeapon, ISInventoryPaneContextMenu.onUpgradeWeapon, part, getSpecificPlayer(player));
                                end
                            elseif (part:getPartType() == "Stock") and not isWeapon:getStock() then
                                if useWrench or noScrewdriver or useScrewdriver then
                                    addOption = true;
                                    subMenuUp:addOption(weaponParts:get(i):getName(), isWeapon, ISInventoryPaneContextMenu.onUpgradeWeapon, part, getSpecificPlayer(player));
                                end
                            elseif (part:getPartType() == "Canon") and not isWeapon:getCanon() then
                                if useWrench or noScrewdriver or useScrewdriver then
                                    addOption = true;
                                    subMenuUp:addOption(weaponParts:get(i):getName(), isWeapon, ISInventoryPaneContextMenu.onUpgradeWeapon, part, getSpecificPlayer(player));
                                end
                            elseif (part:getPartType() == "RecoilPad") and not isWeapon:getRecoilpad() then
                                if useWrench or noScrewdriver or useScrewdriver then
                                    addOption = true;
                                    subMenuUp:addOption(weaponParts:get(i):getName(), isWeapon, ISInventoryPaneContextMenu.onUpgradeWeapon, part, getSpecificPlayer(player));
                                end
                            end
                        end
                    end
                end
                alreadyDoneList[part:getName()] = true;
            end
        end
        if addOption then
            doIt = true;
            addOption = false;
            useWrench = false
            noScrewdriver = false 
            useScrewdriver = false 
        end
        if doIt then
            local upgradeOption = context:addOption(getText("ContextMenu_Add_Weapon_Upgrade"), items, nil);
            context:addSubMenu(upgradeOption, subMenuUp);
        end
        local isScope = false
        local isClip = false
        local isSling = false
        local isStock = false
        local isCanon = false
        local isPad = false
        local remStock = false
        local remRail = false
        local remBayo = false
        if isWeapon:getScope() then
            if isWeapon:getScope():getTags():contains("NoScrewdriver") or (isWeapon:getScope():getTags():contains("Wrench") and hasWrench) or (isWeapon:getScope():getTags():contains("UseDriver") and hasScrewdriver) then
                isScope = true
            end
        end
        if isWeapon:getClip() then
            if isWeapon:getClip():getTags():contains("NoScrewdriver") or (isWeapon:getClip():getTags():contains("Wrench") and hasWrench) or (isWeapon:getClip():getTags():contains("UseDriver") and hasScrewdriver) then
                isClip = true
            end
        end
        if isWeapon:getSling() then
            if isWeapon:getSling():getTags():contains("NoScrewdriver") or (isWeapon:getSling():getTags():contains("Wrench") and hasWrench) or (isWeapon:getSling():getTags():contains("UseDriver") and hasScrewdriver) then
                isSling = true
            end
        end
        if isWeapon:getStock() then
            if isWeapon:getStock():getTags():contains("NoScrewdriver") or (isWeapon:getStock():getTags():contains("Wrench") and hasWrench) or (isWeapon:getStock():getTags():contains("UseDriver") and hasScrewdriver) then
                isStock = true
            end
        end
        if isWeapon:getCanon() then
            if isWeapon:getCanon():getTags():contains("NoScrewdriver") or (isWeapon:getCanon():getTags():contains("Wrench") and hasWrench) or (isWeapon:getCanon():getTags():contains("UseDriver") and hasScrewdriver) then
                isCanon = true
            end
        end
        if isWeapon:getRecoilpad() then
            if isWeapon:getRecoilpad():getTags():contains("NoScrewdriver") or (isWeapon:getRecoilpad():getTags():contains("Wrench") and hasWrench) or (isWeapon:getRecoilpad():getTags():contains("UseDriver") and hasScrewdriver) then
                isPad = true
            end
        end
        local remBayo = false
        local oldBayo = nil
        local indexBayo = nil
        local bayoReady = false
        for index, preset in ipairs(FixBayonetSet) do
            if index % 3 == 2 and preset == isWeapon:getFullType() then
                if not isWeapon:getTags():contains("FoldingBayo") then
                    oldBayo = FixBayonetSet[index + 1]
                    bayoReady = true
                end
                if bayoReady and oldBayo ~= "null" then
                    indexBayo = index
                    remBayo = true
                end
            end
        end
        local remRail = false
        local oldRail = nil
        local indexRail = nil
        for index, preset in ipairs(GunRailSet) do
            if index % 3 == 2 and preset == isWeapon:getFullType() then
                oldRail = GunRailSet[index + 1]
                if oldRail ~= nil then
                    if ScriptManager.instance:getItem(oldRail):getTags():contains("Wrench") and hasWrench then
                        useWrench = true
                    end
                    if ScriptManager.instance:getItem(oldRail):getTags():contains("NoScrewdriver") then
                        noScrewdriver = true
                    end				
                    if ScriptManager.instance:getItem(oldRail):getTags():contains("UseDriver") and hasScrewdriver then
                        useScrewdriver = true
                    end
                end
                if useWrench or noScrewdriver or useScrewdriver then
                    indexRail = index
                    remRail = true
                end
            end
        end
        local remStock = false
        local oldStock = nil
        local indexStock = nil
        for index, preset in ipairs(StockInstallSet) do
            if (index % 5 == 1 or index % 5 == 2 or index % 5 == 3) and preset == isWeapon:getFullType() then
                local newStock = nil
                if isWeapon:getSubCategory() == "Firearm" then
                    if index % 5 == 1 then
                        oldStock = StockInstallSet[index + 4]
                        newStock = StockInstallSet[index + 3]
                    elseif index % 5 == 2 then
                        oldStock = StockInstallSet[index + 2]
                        newStock = StockInstallSet[index + 3]
                    elseif index % 5 == 3 then
                        oldStock = StockInstallSet[index + 1]
                        newStock = StockInstallSet[index + 2]
                    end
                    if oldStock ~= nil then
                        if getSpecificPlayer(player):getInventory():getItemFromType(newStock) then
                            indexStock = index
                            remStock = true
                        end
                    end
                end
            end
        end
        if (isScope or isClip or isSling or isStock or isCanon or isPad or remStock or remRail or remBayo) then
            local removeUpgradeOption = context:addOption(getText("ContextMenu_Remove_Weapon_Upgrade"), items, nil);
            local subMenuRemove = context:getNew(context);
            context:addSubMenu(removeUpgradeOption, subMenuRemove);
            if isScope then
                subMenuRemove:addOption(isWeapon:getScope():getName(), isWeapon, ISInventoryPaneContextMenu.onRemoveUpgradeWeapon, isWeapon:getScope(), getSpecificPlayer(player));
                isScope = false
            end
            if isClip then
                subMenuRemove:addOption(isWeapon:getClip():getName(), isWeapon, ISInventoryPaneContextMenu.onRemoveUpgradeWeapon, isWeapon:getClip(), getSpecificPlayer(player));
                isClip = false
            end
            if isSling then
                subMenuRemove:addOption(isWeapon:getSling():getName(), isWeapon, ISInventoryPaneContextMenu.onRemoveUpgradeWeapon, isWeapon:getSling(), getSpecificPlayer(player));
                isSling = false
            end
            if isStock then
                subMenuRemove:addOption(isWeapon:getStock():getName(), isWeapon, ISInventoryPaneContextMenu.onRemoveUpgradeWeapon, isWeapon:getStock(), getSpecificPlayer(player));
                isStock = false
            end
            if isCanon then
                subMenuRemove:addOption(isWeapon:getCanon():getName(), isWeapon, ISInventoryPaneContextMenu.onRemoveUpgradeWeapon, isWeapon:getCanon(), getSpecificPlayer(player));
                isCanon = false
            end
            if isPad then
                subMenuRemove:addOption(isWeapon:getRecoilpad():getName(), isWeapon, ISInventoryPaneContextMenu.onRemoveUpgradeWeapon, isWeapon:getRecoilpad(), getSpecificPlayer(player));
                isPad = false
            end
            if remStock then
                subMenuRemove:addOption(ScriptManager.instance:getItem(oldStock):getDisplayName(), isWeapon, Guns93StockInstall.callAction, indexStock, getSpecificPlayer(player));
                remStock = false
            end
            if remRail then
                subMenuRemove:addOption(ScriptManager.instance:getItem(oldRail):getDisplayName(), isWeapon, InstallRemoveRail.callAction, indexRail, getSpecificPlayer(player), oldRail)
                remRail = false
            end
            if remBayo then
                subMenuRemove:addOption(ScriptManager.instance:getItem(oldBayo):getDisplayName(), isWeapon, Guns93FixBayonet.callAction, indexBayo, getSpecificPlayer(player), oldBayo)
                remBayo = false
            end
        end
    end
    
    if isHandWeapon and instanceof(isHandWeapon, "HandWeapon") and isHandWeapon:getFireModePossibilities() and isHandWeapon:getFireModePossibilities():size() > 1 then
        ISInventoryPaneContextMenu.doChangeFireModeMenu(playerObj, isHandWeapon, context);
    end

    if isHandWeapon and instanceof(isHandWeapon, "HandWeapon") and getCore():isNewReloading() then
        ISInventoryPaneContextMenu.doReloadMenuForWeapon(playerObj, isHandWeapon, context);
        magazine = nil
        bullet = nil
    end
    
    if magazine and isInPlayerInventory then
        ISInventoryPaneContextMenu.doReloadMenuForMagazine(playerObj, magazine, context);
        ISInventoryPaneContextMenu.doMagazineMenu(playerObj, magazine, context);
        bullet = nil
    end
    if bullet and isInPlayerInventory then
        ISInventoryPaneContextMenu.doReloadMenuForBullets(playerObj, bullet, context);
    end

    if isInPlayerInventory and isReloadable then
        local item = items[1];
        -- if it's a header, we get our first item (the selected one)
        if not instanceof(items[1], "InventoryItem") then
            item = items[1].items[1];
        end
        context:addOption(ReloadUtil:getReloadText(item, playerObj), items, ISInventoryPaneContextMenu.OnReload, player);
    end

    local addDropOption = true
	if unequip then
		context:addOption(getText("ContextMenu_Unequip"), items, ISInventoryPaneContextMenu.onUnEquip, player);
	end
    -- recipe dynamic context menu
    if recipe ~= nil then
        ISInventoryPaneContextMenu.addDynamicalContextMenu(itemsCraft[1], context, recipe, player, containerList);
    end
    local light = items[1];
    -- if it's a header, we get our first item (the selected one)
    if items[1] and not instanceof(items[1], "InventoryItem") then
        light = items[1].items[1];
    end
    if canBeActivated and light ~= nil and (not instanceof(light, "Drainable") or light:getUsedDelta() > 0) then
        local txt = getText("ContextMenu_Turn_On");
        if light:isActivated() then
            txt = getText("ContextMenu_Turn_Off");
        end
        context:addOption(txt, light, ISInventoryPaneContextMenu.onActivateItem, player);
    end

    if isInPlayerInventory and not unequip and playerObj:getJoypadBind() == -1 and
            not ISInventoryPaneContextMenu.isAllFav(items) and
            not ISInventoryPaneContextMenu.isAllNoDropMoveable(items) then
        context:addOption(getText("ContextMenu_Drop"), items, ISInventoryPaneContextMenu.onDropItems, player);
    end

    ISInventoryPaneContextMenu.doPlace3DItemOption(items, playerObj, context)

    if brokenObject then
        local fixingList = FixingManager.getFixes(brokenObject);
        if not fixingList:isEmpty() then
            local fixOption = context:addOption(getText("ContextMenu_Repair") .. getItemNameFromFullType(brokenObject:getFullType()), items, nil);
            local subMenuFix = ISContextMenu:getNew(context);
            context:addSubMenu(fixOption, subMenuFix);
            for i=0,fixingList:size()-1 do
                ISInventoryPaneContextMenu.buildFixingMenu(brokenObject, player, fixingList:get(i), fixOption, subMenuFix)
            end
        end
    end
    if canBeRenamed then
        context:addOption(getText("ContextMenu_RenameBag"), canBeRenamed, ISInventoryPaneContextMenu.onRenameBag, player);
    end
    
    ISHotbar.doMenuFromInventory(player, testItem, context);

    -- use the event (as you would 'OnTick' etc) to add items to context menu without mod conflicts.
    triggerEvent("OnFillInventoryObjectContextMenu", player, context, items);

    return context;
end

local ISInventoryPaneContextMenu_onChangefiremode_old = ISInventoryPaneContextMenu.onRemoveUpgradeWeapon
ISInventoryPaneContextMenu.onChangefiremode = function(playerObj, weapon, newfiremode)
    if not weapon:getTags():contains("Guns93") then
        return ISInventoryPaneContextMenu_onChangefiremode_old(playerObj, weapon, newfiremode)
    else
        weapon:setFireMode(newfiremode);
        playerObj:setVariable("FireMode", newfiremode);
        GunStatAdjust(playerObj, weapon)
    end
end


local ISInventoryPaneContextMenu_onRemoveUpgradeWeapon_old = ISInventoryPaneContextMenu.onRemoveUpgradeWeapon
ISInventoryPaneContextMenu.onRemoveUpgradeWeapon = function(weapon, part, player)
	local hasScrewdriver = player:getInventory():getItemFromType('Screwdriver')
	local hasWrench = player:getInventory():getItemFromType("Wrench")
	ISInventoryPaneContextMenu.transferIfNeeded(player, weapon)
	if part:getTags():contains("Wrench") then
		if hasWrench then
			ISInventoryPaneContextMenu.equipWeapon(hasWrench, true, false, player:getPlayerNum());
			ISTimedActionQueue.add(Guns93RemoveWeaponUpgrade:new(player, weapon, part, hasWrench, 50));
		end
	end
	if part:getTags():contains("NoScrewdriver") then
		ISTimedActionQueue.add(Guns93RemoveWeaponUpgrade:new(player, weapon, part, nil, 50));
	end				
	if part:getTags():contains("UseDriver") then
		if hasScrewdriver then
			ISInventoryPaneContextMenu.equipWeapon(hasScrewdriver, true, false, player:getPlayerNum());
        	ISTimedActionQueue.add(Guns93RemoveWeaponUpgrade:new(player, weapon, part, hasScrewdriver, 50));
		end
	end
	if not (part:getTags():contains("Wrench") or part:getTags():contains("NoScrewdriver") or part:getTags():contains("UseDriver")) then
		return ISInventoryPaneContextMenu_onRemoveUpgradeWeapon_old(weapon, part, player)
	end
end

local ISInventoryPaneContextMenu_onUpgradeWeapon_old = ISInventoryPaneContextMenu.onUpgradeWeapon
ISInventoryPaneContextMenu.onUpgradeWeapon = function(weapon, part, player)
    local hasScrewdriver = player:getInventory():getFirstTagEvalRecurse("Screwdriver", predicateNotBroken)
    local hasWrench = player:getInventory():getItemFromType("Wrench")
    ISInventoryPaneContextMenu.transferIfNeeded(player, weapon)
    ISInventoryPaneContextMenu.transferIfNeeded(player, part)
	if hasWrench or hasScrewdriver or part:getTags():contains("NoScrewdriver") then
		if hasWrench and part:getTags():contains("Wrench") then
			ISInventoryPaneContextMenu.equipWeapon(hasWrench, true, false, player:getPlayerNum());
		    ISTimedActionQueue.add(Guns93UpgradeWeapon:new(player, weapon, part, hasWrench, 50));
		elseif hasScrewdriver and part:getTags():contains("UseDriver") then
			ISInventoryPaneContextMenu.equipWeapon(hasScrewdriver, true, false, player:getPlayerNum());
		    ISTimedActionQueue.add(Guns93UpgradeWeapon:new(player, weapon, part, hasScrewdriver, 50));
        elseif part:getTags():contains("NoScrewdriver")  then
		    ISTimedActionQueue.add(Guns93UpgradeWeapon:new(player, weapon, part, nil, 50));
		end
	else
		return ISInventoryPaneContextMenu_onUpgradeWeapon_old(weapon, part, player)
	end	
end

Guns93UpgradeWeapon = ISBaseTimedAction:derive("Guns93UpgradeWeapon");

local function predicateNotBroken(item)
    return not item:isBroken()
end

function Guns93UpgradeWeapon:isValid()
	if self.weapon:getWeaponPart(self.part:getPartType()) then return false end
	return self.character:getInventory():contains(self.part);
end

function Guns93UpgradeWeapon:update()
    self.weapon:setJobDelta(self:getJobDelta());
    self.part:setJobDelta(self:getJobDelta());

    self.character:setMetabolicTarget(Metabolics.LightDomestic);
end

function Guns93UpgradeWeapon:start()
    self.weapon:setJobType(getText("ContextMenu_Add_Weapon_Upgrade"));
    self.weapon:setJobDelta(0.0);
    self.part:setJobType(getText("ContextMenu_Add_Weapon_Upgrade"));
    self.part:setJobDelta(0.0);
end

function Guns93UpgradeWeapon:stop()
    ISBaseTimedAction.stop(self);
    self.weapon:setJobDelta(0.0);
    self.part:setJobDelta(0.0);
end

function Guns93UpgradeWeapon:perform()
    self.weapon:setJobDelta(0.0);
    self.part:setJobDelta(0.0);
    self.weapon:attachWeaponPart(self.part)
    if self.part:getPartType() == "Canon" then
        if self.part:getModData()["isSilencerCon"] then
            self.weapon:getModData()["modCan_Con"] = self.part:getCondition()
            self.weapon:getModData()["mod_canfoul"] = self.part:getModData()["mod_fouling"]
        end
    end
    self.character:getInventory():Remove(self.part);
    self.character:setPrimaryHandItem(self.tool);
    self.character:setSecondaryHandItem(nil);
    self.character:resetEquippedHandsModels();
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function Guns93UpgradeWeapon:new(character, weapon, part, tool, time)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.weapon = weapon;
    o.part = part;
    o.tool = tool;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.maxTime = time;
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
    return o;
end

Guns93RemoveWeaponUpgrade = ISBaseTimedAction:derive("Guns93RemoveWeaponUpgrade");

function Guns93RemoveWeaponUpgrade:isValid()
    if not self.character:getInventory():contains(self.weapon) then return false end
    return self.weapon:getWeaponPart(self.part:getPartType()) == self.part
end

function Guns93RemoveWeaponUpgrade:update()
    self.character:setMetabolicTarget(Metabolics.LightDomestic);
end

function Guns93RemoveWeaponUpgrade:start()
end

function Guns93RemoveWeaponUpgrade:stop()
    ISBaseTimedAction.stop(self);
end

function Guns93RemoveWeaponUpgrade:perform()
    self.weapon:detachWeaponPart(self.part)
    self.character:getInventory():AddItem(self.part);
    self.character:setPrimaryHandItem(self.tool);
    self.character:setSecondaryHandItem(nil);
    self.character:resetEquippedHandsModels();
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function Guns93RemoveWeaponUpgrade:new(character, weapon, part, tool, time)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.weapon = weapon;
    o.part = part;
    o.tool = tool;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.maxTime = time;
    return o;
end
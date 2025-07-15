--------------------------------------------------------------------------------------------------
--		----	  |			  |			|		 |				|    --    |      ----			--
--		----	  |			  |			|		 |				|    --	   |      ----			--
--		----	  |		-------	   -----|	 ---------		-----          -      ----	   -------
--		----	  |			---			|		 -----		------        --      ----			--
--		----	  |			---			|		 -----		-------	 	 ---      ----			--
--		----	  |		-------	   ----------	 -----		-------		 ---      ----	   -------
--			|	  |		-------			|		 -----		-------		 ---		  |			--
--			|	  |		-------			|	 	 -----		-------		 ---		  |			--
--------------------------------------------------------------------------------------------------


require "Properties/Player/CleaningSkill"

local function doCleaningItemTransfer(player, CleaningItem)

	if instanceof(CleaningItem, "InventoryItem") then
		if luautils.haveToBeTransfered(player, CleaningItem) then
			ISTimedActionQueue.add(ISInventoryTransferAction:new(player, CleaningItem, CleaningItem:getContainer(), player:getInventory()))
		end
		return true
	elseif instanceof(CleaningItem, "ArrayList") then
		local items = CleaningItem
		for i=1,items:size() do
			local item = items:get(i-1)
			if luautils.haveToBeTransfered(player, item) then
				ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, item:getContainer(), player:getInventory()))
			end
		end
		return true
	end

	return false

end

local function TransferCleaningItems(player, CleaningItem, CleaningItem2)

	if CleaningItem and not CleaningItem2 then
		if doCleaningItemTransfer(player, CleaningItem) then return true; end
	end
	if CleaningItem and	CleaningItem2 then
		if doCleaningItemTransfer(player, CleaningItem) and doCleaningItemTransfer(player, CleaningItem2) then return true; end
	end

	return false
end

local function CheckForCleaningItemsLoot(thisPlayer, BroomItem, MopItem, BleachItem)

	local BleachBucketItem

	local containerList = ArrayList.new();
	local playerNum = thisPlayer and thisPlayer:getPlayerNum() or -1
    for i,v in ipairs(getPlayerInventory(playerNum).inventoryPane.inventoryPage.backpacks) do
		containerList:add(v.inventory);
    end
    for i,v in ipairs(getPlayerLoot(playerNum).inventoryPane.inventoryPage.backpacks) do
		containerList:add(v.inventory);
    end

	for i=0,containerList:size()-1 do
		local container = containerList:get(i);
		for x=0,container:getItems():size() - 1 do
			local v = container:getItems():get(x);
			if not BleachBucketItem and (v:getFullType() == 'Lifestyle.BucketBleachFull') then
				BleachBucketItem = v
			end
			if not BleachItem and (v:getType() == "Bleach" and v:getFullType() ~= "BleachEmpty" and v:isPoison()) then
				BleachItem = v
			end
			if not BroomItem and (v:getType() == "Broom" and not v:isBroken()) then
				BroomItem = v
			end
			if not MopItem and (v:getType() == "Mop" and not v:isBroken()) then
				MopItem = v
			end
			if BroomItem and MopItem and BleachItem and BleachBucketItem then
				break
			end
		end
	end

	if BleachBucketItem then BleachItem = BleachBucketItem; end

	return BroomItem, MopItem, BleachItem

end

local function CheckForCleaningItems(thisPlayer)

    local inventory = thisPlayer:getInventory();
	local it = inventory:getItems();
	local BroomItem, MopItem, BleachItem, BleachBucketItem

	for j = 0, it:size()-1 do
		local item = it:get(j);
		if item:getType() == "Broom" and not item:isBroken() and not BroomItem then
			BroomItem = item
		elseif item:getType() == "Mop" and not item:isBroken() and not MopItem then
			MopItem = item
		elseif item:getType() == "Bleach" and item:getFullType() ~= "BleachEmpty" and item:isPoison() then
			BleachItem = item
		elseif item:getFullType() == "Lifestyle.BucketBleachFull" and item:getFullType() ~= "BucketEmpty" and item:isPoison() then
			BleachBucketItem = item
		end
		if BroomItem and MopItem and BleachItem and BleachBucketItem then
			break
		end
	end

	if BleachBucketItem then BleachItem = BleachBucketItem; end

	if (not BroomItem) or (not MopItem) or (not BleachItem) then
		BroomItem, MopItem, BleachItem = CheckForCleaningItemsLoot(thisPlayer, BroomItem, MopItem, BleachItem)
	end

	return BroomItem, MopItem, BleachItem

end

LSCleanRoomContextMenu = {};

LSCleanRoomContextMenu.doBuildMenu = function(player, context, worldobjects, DebugBuildOption)
    local player = getSpecificPlayer(player);

    if player:getVehicle() or
	player:isSitOnGround() or
	player:isSneaking() then
		return
	end

    local square;
	local BroomItem, MopItem, BleachItem = CheckForCleaningItems(player)
	local hasBlood = false
	local originalSquare



	if BroomItem or (MopItem and BleachItem) then
	
	else
		--player:Say("No mop or broom")
	return
	end
			
  
  --  if not (inventory:containsTypeRecurse("BathTowel") or inventory:containsTypeRecurse("DishCloth") or
			--inventory:containsTypeRecurse("Mop") or inventory:containsTypeEvalRecurse("Broom", predicateNotBroken)) then return end


    --if not inventory:containsTypeRecurse("Bleach") then return end---leave bleach for 'heavy cleaning' option

    for i,v in ipairs(worldobjects) do
        square = v:getSquare();
		originalSquare = v:getSquare()
    end
  
	if not square then return end
 
	local dirtObject
	local heavyDirtObject
 	local DirtList = {}
	local HeavyList = {}
	local BloodTileList = {}
 

  	for x = square:getX()-4,square:getX()+4 do
		for y = square:getY()-4,square:getY()+4 do
			local square = getCell():getGridSquare(x,y,player:getZ())
			if square and (originalSquare:isOutside() == square:isOutside()) and square:getRoom() == originalSquare:getRoom() then
			
			for i=0,square:getObjects():size()-1 do
				local object = square:getObjects():get(i);
				if square:haveBlood() then
					hasBlood = true
					table.insert(BloodTileList, square)
				end
				if object then
					local attachedsprite = object:getAttachedAnimSprite()
					if object:getTextureName() and
					(luautils.stringStarts(object:getTextureName(), "overlay_messages") or 
					luautils.stringStarts(object:getTextureName(), "overlay_graffiti") or 
					luautils.stringStarts(object:getTextureName(), "floors_burnt") or 
					luautils.stringStarts(object:getTextureName(), "overlay_blood") or 
					luautils.stringStarts(object:getTextureName(), "LS_HScraps") or 
					luautils.stringStarts(object:getTextureName(), "blood_floor")) then
						table.insert(HeavyList, object)
					end
					if object:getTextureName() and
					(luautils.stringStarts(object:getTextureName(), "overlay_grime") or 
					luautils.stringStarts(object:getTextureName(), "brokenglass_") or 
					luautils.stringStarts(object:getTextureName(), "trash&junk") or 
					luautils.stringStarts(object:getTextureName(), "d_floorleaves") or 
					luautils.stringStarts(object:getTextureName(), "d_trash")) then
						table.insert(DirtList, object)
					end
					if object:getOverlaySprite() and object:getOverlaySprite():getName() and
					(luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_messages") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_graffiti") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "floors_burnt") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_blood") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "LS_HScraps") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "blood_floor")) then
						table.insert(HeavyList, object)
					end
					if object:getOverlaySprite() and object:getOverlaySprite():getName() and
					(luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_grime") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "trash_") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "trash&junk") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "d_floorleaves") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "d_trash") or
					luautils.stringStarts(object:getOverlaySprite():getName(), "LS_Scraps")) then
						table.insert(DirtList, object)
					end
					if attachedsprite then
						for n=1,attachedsprite:size() do
							local sprite = attachedsprite:get(n-1)
							if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and 
							(luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_messages") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_graffiti") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "floors_burnt") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_blood") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "LS_HScraps") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "blood_floor")) then
								table.insert(HeavyList, object)
							elseif sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and 
							(luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_grime") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "trash_") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "trash&junk") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "d_floorleaves") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "d_trash")) then
								table.insert(DirtList, object)
							end
						end
									
					end
				end
			end
			
			end
		end
	end

			if #BloodTileList > 0 then
				local randomTile = ZombRand(#BloodTileList) + 1
				heavyDirtObject = BloodTileList[randomTile]
			elseif #HeavyList > 0 then
				local randomTile = ZombRand(#HeavyList) + 1
				heavyDirtObject = HeavyList[randomTile]
			end
			if #DirtList > 0 then
				local randomTile = ZombRand(#DirtList) + 1
				dirtObject = DirtList[randomTile]
			end

	if (heavyDirtObject or dirtObject) and (isAdmin() or isDebugEnabled()) then	
	
		local debugMenu = DebugBuildOption:addOptionOnTop(getText("ContextMenu_LSDebug_Cleaning"));
		
		local subMenu = DebugBuildOption:getNew(DebugBuildOption);
		context:addSubMenu(debugMenu, subMenu)
		
		local optionAdminCleaning = subMenu:addOptionOnTop(getText("ContextMenu_LSDebug_CleanRoom"), worldobjects, LSCleanRoomContextMenu.onCleanDebug, player, player:getX(), player:getY(), player:getZ())
	end

	local dirtObjectSquare
	if dirtObject then
		dirtObjectSquare = dirtObject:getSquare()
	end

	local optionLightCleaning = context:addOptionOnTop(getText("ContextMenu_CleanRoom_Light"), worldobjects, LSCleanRoomContextMenu.onStartAction, player, dirtObject, false, BroomItem, dirtObjectSquare, originalSquare, false);
	optionLightCleaning.iconTexture = getTexture('media/ui/broom_icon.png')
	local heavyObjectSquare
	if heavyDirtObject and hasBlood then
		heavyObjectSquare = heavyDirtObject
	elseif heavyDirtObject then
		heavyObjectSquare = heavyDirtObject:getSquare()
	end
	
	local optionHeavyCleaning = context:addOptionOnTop(getText("ContextMenu_CleanRoom_Heavy"), worldobjects, LSCleanRoomContextMenu.onStartAction, player, heavyDirtObject, BleachItem, MopItem, heavyObjectSquare, originalSquare, hasBlood); 
	optionHeavyCleaning.iconTexture = getTexture('media/ui/mop_icon.png')
		local tooltipLClean = ISToolTip:new();
			tooltipLClean:initialise();
			tooltipLClean:setVisible(false);

		if dirtObject and not BroomItem then--disable the option
			optionLightCleaning.notAvailable = true;
			descriptionLC = " <RED>" .. getText("Tooltip_CleanRoom_Light_MissingItem");
			tooltipLClean.description = descriptionLC
			optionLightCleaning.toolTip = tooltipLClean
			--optionLightCleaning.iconTexture = getTexture('media/ui/clothes_casualNO_icon.png')
		elseif not dirtObject then--disable the option
			optionLightCleaning.notAvailable = true;
			descriptionLC = " <RED>" .. getText("Tooltip_CleanRoom_Light_NoDirt");
			tooltipLClean.description = descriptionLC
			optionLightCleaning.toolTip = tooltipLClean
			--optionLightCleaning.iconTexture = getTexture('media/ui/clothes_casualNO_icon.png')
		else
			--optionLightCleaning.iconTexture = getTexture('media/ui/clothes_casual_icon.png')
		end
 
 		local tooltipHClean = ISToolTip:new();
			tooltipHClean:initialise();
			tooltipHClean:setVisible(false);

		if heavyDirtObject and (not MopItem or not BleachItem) then
			optionHeavyCleaning.notAvailable = true;
			descriptionHC = " <RED>" .. getText("Tooltip_CleanRoom_Heavy_MissingItems");
			tooltipHClean.description = descriptionHC
			optionHeavyCleaning.toolTip = tooltipHClean
			--optionHeavyCleaning.iconTexture = getTexture('media/ui/clothes_casualNO_icon.png')
		elseif not heavyDirtObject then
			optionHeavyCleaning.notAvailable = true;
			descriptionHC = " <RED>" .. getText("Tooltip_CleanRoom_Heavy_NoDirt");
			tooltipHClean.description = descriptionHC
			optionHeavyCleaning.toolTip = tooltipHClean
			--optionHeavyCleaning.iconTexture = getTexture('media/ui/clothes_casualNO_icon.png')
		else

			--optionHeavyCleaning.iconTexture = getTexture('media/ui/clothes_casual_icon.png')
		end
 
end

LSCleanRoomContextMenu.walkToFront = function(player, square)
	if not square then
		HaloTextHelper.addText(player, getText("IGUI_HaloNote_CleaningNoPath"), 255, 180, 180)
		return false
	end

	local freeSquare = (square:getS() or square:getE() or square:getW() or square:getN())

	if not freeSquare then
		if luautils.walkAdj(player, square, true) then
		return true
		else
		HaloTextHelper.addText(player, getText("IGUI_HaloNote_CleaningNoPath"), 255, 180, 180)
		return false
		end
	end
	--now we make the character move to the closest tile near the dirt - this will make the action more efficient and fluid than simply picking the first available tile
	local N
	local S
	local E
	local W

	if square:getS() and AdjacentFreeTileFinder.privTrySquare(square, square:getS()) then
		if player:getY() >= square:getS():getY() then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, square:getS()))
			return true
		else
			S = 1
		end
	end
	
	if square:getN() and AdjacentFreeTileFinder.privTrySquare(square, square:getN()) then
		if player:getY() <= square:getN():getY() then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, square:getN()))
			return true
		else
			N = 1
		end
	end

	if square:getE() and AdjacentFreeTileFinder.privTrySquare(square, square:getE()) then
		if player:getX() >= square:getE():getX() then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, square:getE()))
			return true
		else
			E = 1
		end
	end

	if square:getW() and AdjacentFreeTileFinder.privTrySquare(square, square:getW()) then
		if player:getX() >= square:getW():getX() then
			ISTimedActionQueue.add(ISWalkToTimedAction:new(player, square:getW()))
			return true
		else
			W = 1
		end
	end

	if S then
		ISTimedActionQueue.add(ISWalkToTimedAction:new(player, square:getS()))
		return true
	elseif N then
		ISTimedActionQueue.add(ISWalkToTimedAction:new(player, square:getN()))
		return true
	elseif W then
		ISTimedActionQueue.add(ISWalkToTimedAction:new(player, square:getW()))
		return true
	elseif E then
		ISTimedActionQueue.add(ISWalkToTimedAction:new(player, square:getE()))
		return true
	end

--	if square:getS() and AdjacentFreeTileFinder.privTrySquare(square, square:getS()) then
--		ISTimedActionQueue.add(ISWalkToTimedAction:new(player, square:getS()))
	--	return true
--	elseif square:getE() and AdjacentFreeTileFinder.privTrySquare(square, square:getE()) then
--		ISTimedActionQueue.add(ISWalkToTimedAction:new(player, square:getE()))
--		return true
--	elseif square:getW() and AdjacentFreeTileFinder.privTrySquare(square, square:getW()) then
--		ISTimedActionQueue.add(ISWalkToTimedAction:new(player, square:getW()))
--		return true
--	elseif square:getN() and AdjacentFreeTileFinder.privTrySquare(square, square:getN()) then
--		ISTimedActionQueue.add(ISWalkToTimedAction:new(player, square:getN()))
--		return true
--	end
	HaloTextHelper.addText(player, getText("IGUI_HaloNote_CleaningNoPath"), 255, 180, 180)
	return false
end

LSCleanRoomContextMenu.onStartAction = function(worldobjects, player, dirtObject, bleach, item, square, originalSquare, hasBlood)

	if ((bleach and item and TransferCleaningItems(player, item, bleach)) or
	(item and TransferCleaningItems(player, item, false))) and LSCleanRoomContextMenu.walkToFront(player, square) then
	
		local duration
	
		if not item:isEquipped() then
			ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, true, true))
		end
		
		if bleach then
			duration = GetCleaningTime(player, bleach)
		else
			duration = GetCleaningTime(player, false)
		end
		
		local CleanRoomAction = require "TimedActions/CleanRoomAction"
		ISTimedActionQueue.add(CleanRoomAction:new(player, item, dirtObject, bleach, duration, square, originalSquare, hasBlood));
	end
end

LSCleanRoomContextMenu.onCleanDebug = function(worldobjects, player, x, y, z)

	local square = getCell():getGridSquare(x,y,z)

  	for x = square:getX()-4,square:getX()+4 do
		for y = square:getY()-4,square:getY()+4 do
			local square = getCell():getGridSquare(x,y,z)
			if square then
				for i=0,square:getObjects():size()-1 do
					if square:haveBlood() then
						square:removeBlood(false, false)
					end
				end
			end
		end
	end

	if isClient() then
		sendClientCommand("LS", "RemoveDirtTileDebug", {x, y, z})
	end
end

--Events.OnFillWorldObjectContextMenu.Add(LSCleanRoomContextMenu.doBuildMenu);

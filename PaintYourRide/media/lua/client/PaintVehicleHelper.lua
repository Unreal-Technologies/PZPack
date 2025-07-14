PaintVehicleHelper = {}

---
--- Equips item into the player's primary hand.
---
---@param player any The player.
---@param item any Either item instance or item type.
function PaintVehicleHelper.equipPrimHandItem(player, item)
    if not instanceof(item, "InventoryItem") then
        item = player:getInventory():getFirstTypeRecurse(item)
    end
    ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), item, true, false)
end

---
--- Unequips item from the player's primary or secondary hand.
---
---@param player any The player
---@param primHand boolean true to uneqiup from the primary hand, false - secondary hand
function PaintVehicleHelper.unequipHandItem(player, primHand)
    local handItem = primHand and player:getPrimaryHandItem() or player:getSecondaryHandItem()
    if handItem then
        ISTimedActionQueue.add(ISUnequipAction:new(player, handItem, 50))
    end
end

---
--- Wears item if not already equipped.
---
---@param player any The player
---@param item any The item to wear
local function wearItem(player, item)
    if not player:isEquipped(item) then
        ISInventoryPaneContextMenu.wearItem(item, player:getPlayerNum())
    end
end

---
--- Wears ppe if not already equipped.
---
---@param player any The player
---@param selection number The selected PPE. Not required. 1 - dust mask + goggles, 2 - gas mask, 3 - biochemical mask
function PaintVehicleHelper.wearPPE(player, selection)
    local dustMask = player:getInventory():getFirstTypeRecurse(PaintVehicleConfig.ITEMS.DUST_MASK)
    local goggles = player:getInventory():getFirstTypeRecurse(PaintVehicleConfig.ITEMS.GOGGLES)
    local gasMask = player:getInventory():getFirstTypeRecurse(PaintVehicleConfig.ITEMS.GAS_MASK)
    local bioMask = player:getInventory():getFirstTypeRecurse(PaintVehicleConfig.ITEMS.BIO_MASK)

    -- Wear the specified PPE
    if selection then
        if selection == 1 then
            wearItem(player, dustMask)
            wearItem(player, goggles)
        elseif selection == 2 then
            wearItem(player, gasMask)
        elseif selection == 3 then
            wearItem(player, bioMask)
        end
        if selection == 1 or selection == 2 or selection == 3 then return end
    end

    -- Wear any PPE
    if dustMask and goggles then
        if (not gasMask or (gasMask and not player:isEquipped(gasMask)))
                and (not bioMask or (bioMask and not player:isEquipped(bioMask))) then
            wearItem(player, dustMask)
            wearItem(player, goggles)
        end
    elseif gasMask then
        if not bioMask or (bioMask and not player:isEquipped(bioMask)) then
            wearItem(player, gasMask)
        end
    elseif bioMask then
        wearItem(player, bioMask)
    end
end

local function comparatorDrainableUsesInt(item1, item2)
    return item1:getDrainableUsesInt() - item2:getDrainableUsesInt()
end

local function predicateDrainableUsesInt(item, count)
    return item:getDrainableUsesInt() >= count
end

function PaintVehicleHelper.getSprayGunWithMostUses(player)
    return player:getInventory():getBestTypeEvalRecurse(PaintVehicleConfig.ITEMS.SPRAY_GUN, comparatorDrainableUsesInt)
end

function PaintVehicleHelper.getFirstSprayGunWithUses(player, uses)
    return player:getInventory():getFirstTypeEvalArgRecurse(PaintVehicleConfig.ITEMS.SPRAY_GUN, predicateDrainableUsesInt, uses)
end

---
--- Loops through the player's inventory recursively and calculates the amount of the specified drainable item type present.
---
---@param player any
---@param itemType string
---@return number A total uses of the specified item type.
function PaintVehicleHelper.getItemsUsesTotal(player, itemType)
    local items = player:getInventory():getAllTypeRecurse(itemType)
    local itemUsesTotal = 0
    for i = 1, items:size() do
        local item = items:get(i - 1)
        itemUsesTotal = itemUsesTotal + item:getDrainableUsesInt()
    end
    return itemUsesTotal
end

---
--- Transfers specified items to the player's main inventory.
---
---@param itemType string The item type
---@param usesNeeded number The required amount of item uses
function PaintVehicleHelper.transferUsableItems(player, itemType, usesNeeded)
    local items = player:getInventory():getAllTypeRecurse(itemType)
    local needed = usesNeeded
    for i = 1, items:size() do
        if needed <= 0 then break end

        local item = items:get(i - 1)
        ISInventoryPaneContextMenu.transferIfNeeded(player, item)
        needed = needed - item:getDrainableUsesInt()
    end
end
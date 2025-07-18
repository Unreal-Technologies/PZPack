local InventoryUI = require("Starlit/client/ui/InventoryUI")

CContainersOverride = {}
CContainersOverride.CONTAINERS = CContainersOverride.CONTAINERS or {}

-- Sets custom capacity for a container type, supporting both full and short names
CContainersOverride.setCapacity = function(containerType, capacity)
    if type(containerType) ~= "string" or type(capacity) ~= "number" then
        return false
    end
    
    -- Stores the main entry
    CContainersOverride.CONTAINERS[containerType] = { capacity = capacity }
    
    if string.find(containerType, "%.") then
        -- If it has a module (module.item), store without module prefix
        local shortName = string.match(containerType, "%.(.+)$")
        if shortName then
            CContainersOverride.CONTAINERS[shortName] = { capacity = capacity }
        end
    end
    
    return true
end

-- Helper function for vehicle capacity cross-referencing
CContainersOverride.updateVehicleCapacityFromItemType = nil 

-- Updates tooltip to show custom capacity values
local function updateCapacityTooltip(tooltip, layout, container)
    -- Validate inputs
    if not tooltip or not layout or not container then return end
    if not layout.items or layout.items:size() == 0 then return end
    
    -- Get container info
    local containerType = container:getType()
    if not containerType or containerType == "" then return end
    
    -- Check for override
    local overrideData = CContainersOverride.CONTAINERS[containerType]
    if not overrideData or not overrideData.capacity or overrideData.capacity <= 0 then return end
    
    -- Find and update capacity line
    local capacityText = getText("Tooltip_container_Capacity")
    if not capacityText then return end
    
    local targetLabel = capacityText .. ":"
    
    for i = 0, layout.items:size() - 1 do
        local layoutItem = layout.items:get(i)
        if layoutItem and layoutItem.label and layoutItem.label == targetLabel then
            if layoutItem.setValue then
                layoutItem:setValue(tostring(overrideData.capacity), 1, 1, 1, 1)
                return
            end
        end
    end
end

InventoryUI.onFillItemTooltip:addListener(updateCapacityTooltip)

local ItemContainer_hasRoomFor = {}

function ItemContainer_hasRoomFor.GetClass()
    local class, methodName = ItemContainer.class, "hasRoomFor"
    local metatable = __classmetatables[class]
    local metatable__index = metatable.__index
    local original_function = metatable__index[methodName]
    metatable__index[methodName] = ItemContainer_hasRoomFor.PatchClass(original_function)
end

-- Patches hasRoomFor method to use custom capacity values
function ItemContainer_hasRoomFor.PatchClass(original_function)
    return function(self, chr, item)
        local containerType = self:getType()
        local overrideData = CContainersOverride.CONTAINERS[containerType]

        -- Handle special ItemContainer case
        if containerType == "ItemContainer" and not self:isItemAllowed(item) then
            return original_function(self, chr, item)
        end

        -- Cache operations
        local isPlayerInventory = self == chr:getInventory()
        local itemType = type(item)
        
        -- Player inventory special case - check this BEFORE early exit
        if isPlayerInventory and itemType ~= "number" and item:getType() and CContainersOverride.CONTAINERS[item:getType()] then
            return true
        end

        -- Early exit for non-override containers
        if not overrideData then
            return original_function(self, chr, item)
        end

        -- Weight calculation with cached values
        local currentWeight = self:getContentsWeight()
        local maxCapacity = self:getEffectiveCapacity(chr)
        
        if itemType == "number" then
            return item + currentWeight <= maxCapacity
        elseif instanceof(item, "InventoryItem") then
            return currentWeight + item:getUnequippedWeight() <= maxCapacity
        end

        return original_function(self, chr, item)
    end
end

ItemContainer_hasRoomFor.GetClass()

local ItemContainer_getCapacity = {}
function ItemContainer_getCapacity.GetClass()
    local class, methodName = ItemContainer.class, "getCapacity"
    local metatable = __classmetatables[class]
    local metatable__index = metatable.__index
    local original_function = metatable__index[methodName]
    metatable__index[methodName] = ItemContainer_getCapacity.PatchClass(original_function)
end

-- Core capacity override functionality
function ItemContainer_getCapacity.PatchClass(original_function)
    return function(self)
        if CContainersOverride.CONTAINERS[self:getType()] then
            return CContainersOverride.CONTAINERS[self:getType()].capacity
        end
        return original_function(self)
    end
end

ItemContainer_getCapacity.GetClass()

local ItemContainer_getEffectiveCapacity = {}
function ItemContainer_getEffectiveCapacity.GetClass()
    local class, methodName = ItemContainer.class, "getEffectiveCapacity"
    local metatable = __classmetatables[class]
    local metatable__index = metatable.__index
    local original_function = metatable__index[methodName]
    metatable__index[methodName] = ItemContainer_getEffectiveCapacity.PatchClass(original_function)
end

-- Handles Organized/Disorganized traits
function ItemContainer_getEffectiveCapacity.PatchClass(original_function)
    return function(self, chr)
        local containerType = self:getType()
        local overrideData = CContainersOverride.CONTAINERS[containerType]

        if overrideData and overrideData.capacity then
            local containerCapacity = overrideData.capacity
            local effinCapacity = math.min(self:getCapacity(), containerCapacity)

            if chr and not instanceof(self:getParent(), "IsoPlayer") or instanceof(self:getParent(), "IsoDeadBody") then
                local multiplier = chr:getTraits():contains("Organized") and 1.3 or chr:getTraits():contains("Disorganized") and 0.7
                if multiplier then
                    return math.ceil(math.max(effinCapacity * multiplier, self:getCapacity() + (multiplier > 1 and 1 or 0)))
                end
            end

            return math.ceil(effinCapacity)
        end

        return original_function(self, chr)
    end
end

ItemContainer_getEffectiveCapacity.GetClass()

local VehiclePart_getContainerCapacity = {}

function VehiclePart_getContainerCapacity.GetClass()
    local class, methodName = VehiclePart.class, "getContainerCapacity"
    local metatable = __classmetatables[class]
    local metatable__index = metatable.__index
    local original_function = metatable__index[methodName]
    metatable__index[methodName] = VehiclePart_getContainerCapacity.PatchClass(original_function)
end

-- Vehicle storage capacity override with condition-based degradation
function VehiclePart_getContainerCapacity.PatchClass(original_function)
    return function(self, chr)
        -- Always try to update capacity when this function is called
        if CContainersOverride.updateVehiclePartCapacity then
            CContainersOverride.updateVehiclePartCapacity(self)
        end
        
        local vehicle = self:getVehicle()
        local partId = self:getId()
        local uniqueId = CContainersOverride.createUniqueVehiclePartId and 
                        CContainersOverride.createUniqueVehiclePartId(vehicle, partId) or partId
        
        -- Check for override using unique ID
        local overrideData = CContainersOverride.CONTAINERS[uniqueId]
        
        -- Calculates capacity based on item condition degradation
        local function calculateConditionBasedCapacity(maxCap, cond, min)
            cond = cond + 20 * (100 - cond) / 100
            local norm = cond / 100
            return math.max(min, (maxCap * norm) * 100 / 100)
        end

        if not self:isContainer() then
            return 0
        end
        
        if overrideData and overrideData.capacity then
            -- Use our override capacity
            if self:getInventoryItem() ~= nil and self:getItemContainer() ~= nil then
                if self:getInventoryItem():isConditionAffectsCapacity() then
                    return math.floor(calculateConditionBasedCapacity(overrideData.capacity, self:getCondition(), 5))
                else
                    return overrideData.capacity
                end
            else
                return overrideData.capacity
            end
        end
        
        -- Fall back to original function
        return original_function(self, chr)
    end
end

VehiclePart_getContainerCapacity.GetClass()

local ItemContainer_getCapacity_Vehicle = {}

function ItemContainer_getCapacity_Vehicle.GetClass()
    local class, methodName = ItemContainer.class, "getCapacity"
    local metatable = __classmetatables[class]
    local metatable__index = metatable.__index
    local original_function = metatable__index[methodName]
    
    -- Store original if not already stored
    if not ItemContainer_getCapacity_Vehicle.original then
        ItemContainer_getCapacity_Vehicle.original = original_function
    end
    
    metatable__index[methodName] = ItemContainer_getCapacity_Vehicle.PatchClass(original_function)
end

-- Additional hook for ItemContainer.getCapacity when used in vehicle containers
function ItemContainer_getCapacity_Vehicle.PatchClass(original_function)
    return function(self)
        local parent = self:getParent()
        if parent and instanceof(parent, "VehiclePart") then
            local vehiclePart = parent
            
            if CContainersOverride.updateVehiclePartCapacity then
                CContainersOverride.updateVehiclePartCapacity(vehiclePart)
            end
            
            -- Get unique ID and check for override
            local vehicle = vehiclePart:getVehicle()
            local partId = vehiclePart:getId()
            local uniqueId = CContainersOverride.createUniqueVehiclePartId and 
                            CContainersOverride.createUniqueVehiclePartId(vehicle, partId) or partId
            
            local overrideData = CContainersOverride.CONTAINERS[uniqueId]
            if overrideData and overrideData.capacity then
                return overrideData.capacity
            end
        end
        
        if CContainersOverride.CONTAINERS[self:getType()] then
            return CContainersOverride.CONTAINERS[self:getType()].capacity
        end
        
        return original_function(self)
    end
end

ItemContainer_getCapacity_Vehicle.GetClass()

local OG_ISEquipWeaponAction_complete = ISEquipWeaponAction.complete

-- Handles weapon equipping with custom capacity
function ISEquipWeaponAction:complete()
    if not CContainersOverride.CONTAINERS[self.item:getType()] then
        return OG_ISEquipWeaponAction_complete(self)
    end
    if self:isAlreadyEquipped(self.item) then
        return false
    end

    local backItem = self.character:getClothingItem_Back()
    if backItem and backItem:hasTag("ReplacePrimary") and backItem:getClothingItemExtra() then
        local extraItem = backItem:getClothingItemExtra():get(0)
        if extraItem then
            ISClothingExtraAction:performNew(self.character, backItem, extraItem)
        end
    end

    local function updateClothing(item, forceDrop)
        self.character:removeWornItem(item, forceDrop)
        triggerEvent("OnClothingUpdated", self.character)
    end

    if self.character:isEquippedClothing(self.item) then
        updateClothing(self.item, false)
    end
    forceDropHeavyItems(self.character)

    local function handleHandItem(item, isPrimaryHand)
        local equippedItem = isPrimaryHand and self.character:getPrimaryHandItem() or self.character:getSecondaryHandItem()
        if equippedItem and (equippedItem == item or equippedItem:isRequiresEquippedBothHands()) then
            if isPrimaryHand then
                self.character:setPrimaryHandItem(nil)
            else
                self.character:setSecondaryHandItem(nil)
            end
        end
    end

    if not self.twoHands then
        if self.primary then
            handleHandItem(self.character:getSecondaryHandItem(), false, true)
            if instanceof(self.item, "HandWeapon") and self.item:getSwingAnim() == "Handgun" then
                handleHandItem(self.character:getSecondaryHandItem(), false, true)
            end
            if self.character:getPrimaryHandItem() ~= self.item then
                self.character:setPrimaryHandItem(self.item)
            end
        else
            handleHandItem(self.character:getPrimaryHandItem(), true, false)
            if not self.character:getSecondaryHandItem() then
                self.character:setSecondaryHandItem(self.item)
            end
        end
    else
        self.character:setPrimaryHandItem(self.item)
        self.character:setSecondaryHandItem(self.item)
    end

    if self.item:canBeActivated() and not self.item:hasTag("Lighter") and not instanceof(self.item, "HandWeapon") then
        self.item:setActivated(true)
        self.item:playActivateSound()
    end

    if not isServer() then
        getPlayerInventory(self.character:getPlayerNum()):refreshBackpacks()
    else
        sendEquip(self.character)
    end

    return true
end
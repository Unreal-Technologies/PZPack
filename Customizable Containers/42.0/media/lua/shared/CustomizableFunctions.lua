require("CustomizableSandbox")

-- Helper function to set any paramater to a specific value
function CCMain(item, paramater, value)
    local item = ScriptManager.instance:getItem(item)
    if item then
        item:DoParam(paramater.." = "..value)
    end
end

-- Checks if a specific mod is enabled
function CCisModActive(ModID)
    local activeMods = {}

    local mods = getActivatedMods()
    for i = 0, mods:size() - 1 do
        local ModID = string.match(mods:get(i), "\\(.+)$")
        activeMods[ModID] = true
    end

    return activeMods
end

-- applies clothing parameters
local function applyClothingConfig(itemList, configTable)
    if not itemList or not configTable then return end
    
    for _, itemName in ipairs(itemList) do
        for property, value in pairs(configTable) do
            CCMain(itemName, property, value)
        end
    end
end

-- Increments the tier number for Tiered Storage
function CCincreaseTier(itemNames)
    local digitPattern = "[1-7]$"

    for i, itemName in ipairs(itemNames) do
        local newName = itemName:gsub(digitPattern, function(matchedDigit)
            local digit = tonumber(matchedDigit)
            if digit then
                return tostring(digit + 1)
            else
                return matchedDigit
            end
        end)
        itemNames[i] = newName
    end
end

-- Alters the weight reduction property of containers
function CCalterWeightReduction(modName, backpackTable, bagTable, chestRigTable, fannyPackTable, satchelTable)
    local randomizerFrequency = SandboxVars.CustomizableRandomizer.Frequency
    local backpackVar = SandboxVars.CustomizableBackpacks.WeightReduction
    local bagVar = SandboxVars.CustomizableBags.WeightReduction
    local chestRigVar = SandboxVars.CustomizableChestRigs.WeightReduction
    local fannyPackVar = SandboxVars.CustomizableFannyPacks.WeightReduction
    local satchelVar = SandboxVars.CustomizableSatchels.WeightReduction

    local function applyValue(containerTable, weightReductionFunction)
        if containerTable then
            for _, container in ipairs(containerTable) do
                CCMain(container.ItemName, "WeightReduction", weightReductionFunction(container))
            end
        end
    end

    local function addRandomizer(containerTable, weightReductionFunction)
        if randomizerFrequency ~= 1 then
            local Events = { [2] = Events.EveryTenMinutes, [3] = Events.EveryHours, [4] = Events.EveryDays, [5] = Events.OnLoad }
            local eventToAdd = Events[randomizerFrequency]
            if eventToAdd then
                eventToAdd.Add(function() applyValue(containerTable, weightReductionFunction) end)
            end
        end
    end
    
    local function applytoTable(containerTable, var, weightReductionFunction)
        if var and containerTable then
            if (var == 4 or var == 5 or var == 7) then
                applyValue(containerTable, weightReductionFunction)
                addRandomizer(containerTable, weightReductionFunction)
            else
                for _, container in ipairs(containerTable) do
                    CCMain(container.ItemName, "WeightReduction", tonumber(string.format("%.0f", weightReductionFunction(container))))
                end
            end
        end
    end

    if not modName then
        applytoTable(backpackTable, backpackVar, CCWeightReduction[backpackVar])
        applytoTable(bagTable, bagVar, CCBagsWeightReduction[bagVar])
        applytoTable(chestRigTable, chestRigVar, CCChestRigsWeightReduction[chestRigVar])
        applytoTable(fannyPackTable, fannyPackVar, CCFannyPacksWeightReduction[fannyPackVar])
        applytoTable(satchelTable, satchelVar, CCSatchelsWeightReduction[satchelVar])
    else
        if not CCisModActive()[modName] then
            return
        end
        applytoTable(backpackTable, backpackVar, CCWeightReduction[backpackVar])
        applytoTable(bagTable, bagVar, CCBagsWeightReduction[bagVar])
        applytoTable(chestRigTable, chestRigVar, CCChestRigsWeightReduction[chestRigVar])
        applytoTable(fannyPackTable, fannyPackVar, CCFannyPacksWeightReduction[fannyPackVar])
        applytoTable(satchelTable, satchelVar, CCSatchelsWeightReduction[satchelVar])
    end
end

-- Alters the capacity property of containers
function CCalterCapacity(modName, backpackTable, bagTable, chestRigTable, fannyPackTable, satchelTable)
    local randomizerFrequency = SandboxVars.CustomizableRandomizer.Frequency
    local backpackVar = SandboxVars.CustomizableBackpacks.Capacity
    local bagVar = SandboxVars.CustomizableBags.Capacity
    local chestRigVar = SandboxVars.CustomizableChestRigs.Capacity
    local fannyPackVar = SandboxVars.CustomizableFannyPacks.Capacity
    local satchelVar = SandboxVars.CustomizableSatchels.Capacity

    local function shouldUseRandomizedCapacity(var)
        return var == 4 or var == 5 or var == 7 
    end

    local function applyRandomizedCapacity(containerTable, capacityFunction)
        if containerTable then
            for _, container in ipairs(containerTable) do
                CCMain(container.ItemName, "Capacity", capacityFunction(container))
            end
        end
    end

    local function addRandomizer(containerTable, capacityFunction)
        if randomizerFrequency ~= 1 then
            local Events = { [2] = Events.EveryTenMinutes, [3] = Events.EveryHours, [4] = Events.EveryDays, [5] = Events.OnLoad }
            local eventToAdd = Events[randomizerFrequency]
            if eventToAdd then
                eventToAdd.Add(function() applyRandomizedCapacity(containerTable, capacityFunction) end)
            end
        end
    end

    local function applyOverrideCapacity(containerTable, capacityFunction)
        if containerTable then
            for _, container in ipairs(containerTable) do
                local calculatedCapacity = tonumber(string.format("%.0f", capacityFunction(container)))
                CContainersOverride.setCapacity(container.ItemName, calculatedCapacity)
            end
        end
    end
    
    local function applytoTable(containerTable, var, capacityFunction)
        if not var or not containerTable then return end
        
        if shouldUseRandomizedCapacity(var) then
            -- print("DEBUG - Using randomized capacity method (option " .. var .. ")")
            applyRandomizedCapacity(containerTable, capacityFunction)
            addRandomizer(containerTable, capacityFunction)
        else
            -- print("DEBUG - Using override capacity method (option " .. var .. ")")
            applyOverrideCapacity(containerTable, capacityFunction)
        end
    end

    if not modName then
        applytoTable(backpackTable, backpackVar, CCCapacities[backpackVar])
        applytoTable(bagTable, bagVar, CCBagsCapacities[bagVar])
        applytoTable(chestRigTable, chestRigVar, CCChestRigsCapacities[chestRigVar])
        applytoTable(fannyPackTable, fannyPackVar, CCFannyPacksCapacities[fannyPackVar])
        applytoTable(satchelTable, satchelVar, CCSatchelsCapacities[satchelVar])
    else
        if not CCisModActive()[modName] then
            return
        end
        applytoTable(backpackTable, backpackVar, CCCapacities[backpackVar])
        applytoTable(bagTable, bagVar, CCBagsCapacities[bagVar])
        applytoTable(chestRigTable, chestRigVar, CCChestRigsCapacities[chestRigVar])
        applytoTable(fannyPackTable, fannyPackVar, CCFannyPacksCapacities[fannyPackVar])
        applytoTable(satchelTable, satchelVar, CCSatchelsCapacities[satchelVar])
    end
end

-- Alters the weight property of containers
function CCalterWeight(modName, backpackTable, bagTable, chestRigTable, fannyPackTable, satchelTable)
    local weightVars = {
        backpack = SandboxVars.CustomizableBackpacks.Weight,
        bag = SandboxVars.CustomizableBags.Weight,
        chestRig = SandboxVars.CustomizableChestRigs.Weight,
        fannyPack = SandboxVars.CustomizableFannyPacks.Weight,
        satchel = SandboxVars.CustomizableSatchels.Weight
    }

    local function alterWeight(containerTable, weightFunction)
        if containerTable then
            for _, v in ipairs(containerTable) do
                CCMain(v.ItemName, "Weight", weightFunction(v))
            end
        end
    end

    local function applyWeight(modName, containerTable, weightVar, weightFunctionTable)
        if not modName or CCisModActive()[modName] then
            alterWeight(containerTable, weightFunctionTable[weightVar])
        end
    end

    applyWeight(modName, backpackTable, weightVars.backpack, CCWeight)
    applyWeight(modName, bagTable, weightVars.bag, CCBagsWeight)
    applyWeight(modName, chestRigTable, weightVars.chestRig, CCChestRigsWeight)
    applyWeight(modName, fannyPackTable, weightVars.fannyPack, CCFannyPacksWeight)
    applyWeight(modName, satchelTable, weightVars.satchel, CCSatchelsWeight)
end

-- Alters the run speed modifier for various container types
function CCalterRunSpeedModifier(modName, backpackTable, bagTable, chestRigTable, fannyPackTable, satchelTable)
    local function alterRunSpeedModifier(containerTable, RunSpeedModifierFunction)
        for _, container in ipairs(containerTable) do
            CCMain(container.ItemName, "RunSpeedModifier", RunSpeedModifierFunction)
        end
    end

    local function applySpeedModifier(containerTable)
        if containerTable then
            alterRunSpeedModifier(containerTable, 1.0)
        end
    end

    if not modName then
        applySpeedModifier(backpackTable)
        applySpeedModifier(bagTable)
        applySpeedModifier(chestRigTable)
        applySpeedModifier(fannyPackTable)
        applySpeedModifier(satchelTable)
    else
        if CCisModActive()[modName] then
            applySpeedModifier(backpackTable)
            applySpeedModifier(bagTable)
            applySpeedModifier(chestRigTable)
            applySpeedModifier(fannyPackTable)
            applySpeedModifier(satchelTable)
        end
    end
end

function getChestRigVars()
    local isWearable = SandboxVars.CustomizableClothing.ChestRigWearable
    local config = CCChestRigWearable[isWearable]
    
    if config then
        applyClothingConfig(CCchestRigItems, config)
    end
end

function getShoulderVars()
    local isWearable = SandboxVars.CustomizableClothing.ShoulderWearable
    
    -- Apply left shoulder
    local leftConfig = CCShoulderLWearable[isWearable]
    if leftConfig then
        applyClothingConfig(CCshoulderLeftItems, leftConfig)
    end
    
    -- Apply right shoulder
    local rightConfig = CCShoulderRWearable[isWearable]
    if rightConfig then
        applyClothingConfig(CCshoulderRightItems, rightConfig)
    end
    
    -- Apply on-top shoulder
    local onTopConfig = CCShoulderOnTopWearable[isWearable]
    if onTopConfig then
        applyClothingConfig(CCshoulderOnTopItems, onTopConfig)
    end
end

-- Allows the satchel to be used with fanny packs and a backpack
function CCalterSatchelPositioning(modName, satchelTable)
    local isWearable = SandboxVars.CustomizableClothing.SatchelWearable

    local function getSatchelConfig(modName, isWearable)
        -- Handles mod specific satchels
        if modName == "TheyKnew" or modName == "ReModVaccinDrReapersMP" then
            return CCSatchelWearableTheyKnew[isWearable]
        elseif modName == "STFR" then
            return CCSatchelWearableSTR[isWearable]
        else
            return CCSatchelWearable[isWearable]
        end
    end

    local function applySatchelPositioning(containerTable)
        if not containerTable then return end

        local config = getSatchelConfig(modName, isWearable)
        if not config then return end

        for _, container in ipairs(containerTable) do
            for property, value in pairs(config) do
                CCMain(container.ItemName, property, value)
            end
        end
    end

    if not modName or CCisModActive()[modName] then
        applySatchelPositioning(satchelTable)
    end
end
    
-- Alters the capacity of vehicle storage parts
function alterVehicleCapacity(modID, storage)
    local Capacities = {
        [2] = "MaxCapacity",
        [3] = "MaxCapacityB", 
        [4] = "MaxCapacityBoost",
        [5] = 300
    }

    if SandboxVars.CustomizableVehicles.Capacity == 1 then
        return
    end

    local capacityType = Capacities[SandboxVars.CustomizableVehicles.Capacity]

    if capacityType then
        if not CContainersOverride.VEHICLE_LOOKUP_CACHE then
            CContainersOverride.VEHICLE_LOOKUP_CACHE = {}
            
            for tableName, table in pairs(CContainers) do
                if string.find(tableName, "VehicleStorage") and type(table) == "table" then
                    for _, item in ipairs(table) do
                        if item.ItemName then
                            CContainersOverride.VEHICLE_LOOKUP_CACHE[item.ItemName] = item
                        end
                    end
                end
            end
        end

        local function createUniqueVehiclePartId(vehicle, partId)
            if not vehicle then return partId end
            
            local vehicleId = vehicle:getId()
            return string.format("%s_%s", vehicleId, partId)
        end

        local function parseItemType(itemTypeStr)
            if not itemTypeStr then return nil end
            
            local cleanType = itemTypeStr:gsub("%[", ""):gsub("%]", "")
            local moduleName, itemName = cleanType:match("^(.-)%.(.+)$")
            
            if moduleName == "Base" then
                return itemName
            elseif moduleName then
                return cleanType
            else
                return cleanType
            end
        end
        
        -- Updates vehicle part capacity based on lookup cache and sandbox settings
        local function updateVehiclePartCapacity(vehiclePart)
            if not vehiclePart or not vehiclePart:isContainer() then 
                -- print("DEBUG - Vehicle part is nil or not a container")
                return false 
            end
            
            local vehicle = vehiclePart:getVehicle()
            local partId = vehiclePart:getId()
            local uniqueId = createUniqueVehiclePartId(vehicle, partId)
            
            local itemTypeStr = tostring(vehiclePart:getItemType())
            
            if itemTypeStr and itemTypeStr ~= "null" then
                local lookupKey = parseItemType(itemTypeStr)
                
                if lookupKey then
                    local vehicleItem = CContainersOverride.VEHICLE_LOOKUP_CACHE[lookupKey]
                    
                    if vehicleItem then
                        local capacity
                        if capacityType == 300 then
                            capacity = 300
                        else
                            capacity = vehicleItem[capacityType]
                        end
                        
                        if capacity and capacity > 0 then
                            CContainersOverride.setCapacity(uniqueId, capacity)
                            return true
                        end
                    end
                end
            end
            
            return false
        end
        
        CContainersOverride.updateVehiclePartCapacity = updateVehiclePartCapacity
        CContainersOverride.createUniqueVehiclePartId = createUniqueVehiclePartId
    end
end

Events.OnGameStart.Add(BuildVehicleLookupCache)

-- Alters the weight of vehicle parts
function alterVehiclePartWeights(modID, parts)
    local Weights = {
        [2] = 0.75,
        [3] = 0.5,
        [4] = 0.25,
        [5] = 0
    }

    if SandboxVars.CustomizableVehicles.Weight == 1 then
        return
    end

    local weightMultiplier = Weights[SandboxVars.CustomizableVehicles.Weight]

    if weightMultiplier then
        for _, v in pairs(parts) do
            CCMain(v.ItemName, "Weight", v.Weight * weightMultiplier)
        end
    end
end
function CCMain(item, paramater, value)
    local item = ScriptManager.instance:getItem(item)
    if item then
        item:DoParam(paramater.." = "..value)
    end
end

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

function CCalterWeightReduction(modName, backpackTable, bagTable, chestRigTable, fannyPackTable, satchelTable)
    local randomizerFrequency = SandboxVars.CustomizableRandomizer.Frequency
    local backpackVar = SandboxVars.CustomizableBackpacks.WeightReduction
    local bagVar = SandboxVars.CustomizableBags.WeightReduction
    local chestRigVar = SandboxVars.CustomizableChestRigs.WeightReduction
    local fannyPackVar = SandboxVars.CustomizableFannyPacks.WeightReduction
    local satchelVar = SandboxVars.CustomizableSatchels.WeightReduction

    -- Function to apply the weight reduction to the container based on its properties
    local function applyValue(containerTable, weightReductionFunction)
        if containerTable then
            for _, container in ipairs(containerTable) do
                CCMain(container.ItemName, "WeightReduction", weightReductionFunction(container))
            end
        end
    end

    -- Add randomizer function
    local function addRandomizer(containerTable, weightReductionFunction)
        if randomizerFrequency ~= 1 then
            local Events = { [2] = Events.EveryTenMinutes, [3] = Events.EveryHours, [4] = Events.EveryDays, [5] = Events.OnLoad }
            local eventToAdd = Events[randomizerFrequency]
            if eventToAdd then
                eventToAdd.Add(function() applyValue(containerTable, weightReductionFunction) end)
            end
        end
    end
    
    -- Apply weight reduction to a specific table
    local function applytoTable(containerTable, var, weightReductionFunction)
        if var and containerTable then
            if (var == 5 or var == 6 or var == 15) then
                applyValue(containerTable, weightReductionFunction)
                addRandomizer(containerTable, weightReductionFunction)
            else
                for _, container in ipairs(containerTable) do
                    CCMain(container.ItemName, "WeightReduction", tonumber(string.format("%.0f", weightReductionFunction(container))))
                end
            end
        end
    end

    -- Apply weight reduction to the containers
    if not modName then
        applytoTable(backpackTable, backpackVar, CCWeightReduction[backpackVar])
        applytoTable(bagTable, bagVar, CCBagsWeightReduction[bagVar])
        applytoTable(chestRigTable, chestRigVar, CCChestRigsWeightReduction[chestRigVar])
        applytoTable(fannyPackTable, fannyPackVar, CCFannyPacksWeightReduction[fannyPackVar])
        applytoTable(satchelTable, satchelVar, CCSatchelsWeightReduction[satchelVar])
    else
        if not getActivatedMods():contains(modName) then
            return
        end
        applytoTable(backpackTable, backpackVar, CCWeightReduction[backpackVar])
        applytoTable(bagTable, bagVar, CCBagsWeightReduction[bagVar])
        applytoTable(chestRigTable, chestRigVar, CCChestRigsWeightReduction[chestRigVar])
        applytoTable(fannyPackTable, fannyPackVar, CCFannyPacksWeightReduction[fannyPackVar])
        applytoTable(satchelTable, satchelVar, CCSatchelsWeightReduction[satchelVar])
    end
end

function CCalterCapacity(modName, backpackTable, bagTable, chestRigTable, fannyPackTable, satchelTable)
    local randomizerFrequency = SandboxVars.CustomizableRandomizer.Frequency
    local backpackVar = SandboxVars.CustomizableBackpacks.Capacity
    local bagVar = SandboxVars.CustomizableBags.Capacity
    local chestRigVar = SandboxVars.CustomizableChestRigs.Capacity
    local fannyPackVar = SandboxVars.CustomizableFannyPacks.Capacity
    local satchelVar = SandboxVars.CustomizableSatchels.Capacity

    -- Function to apply the capacity changes to the containers
    local function applyValue(containerTable, capacityFunction)
        if containerTable then
            for _, container in ipairs(containerTable) do
                CCMain(container.ItemName, "Capacity", capacityFunction(container))
            end
        end
    end

    -- Add randomizer function for capacity
    local function addRandomizer(containerTable, capacityFunction)
        if randomizerFrequency ~= 1 then
            local Events = { [2] = Events.EveryTenMinutes, [3] = Events.EveryHours, [4] = Events.EveryDays, [5] = Events.OnLoad }
            local eventToAdd = Events[randomizerFrequency]
            if eventToAdd then
                eventToAdd.Add(function() applyValue(containerTable, capacityFunction) end)
            end
        end
    end
    
    -- Apply capacity to a specific table
    local function applytoTable(containerTable, var, capacityFunction)
        if var and containerTable then
            if (var == 5 or var == 6 or var == 22) then
                applyValue(containerTable, capacityFunction)
                addRandomizer(containerTable, capacityFunction)
            else
                for _, container in ipairs(containerTable) do
                    CCMain(container.ItemName, "Capacity", tonumber(string.format("%.0f", capacityFunction(container))))
                end
            end
        end
    end

    -- Apply capacity to the containers
    if not modName then
        applytoTable(backpackTable, backpackVar, CCCapacities[backpackVar])
        applytoTable(bagTable, bagVar, CCBagsCapacities[bagVar])
        applytoTable(chestRigTable, chestRigVar, CCChestRigsCapacities[chestRigVar])
        applytoTable(fannyPackTable, fannyPackVar, CCFannyPacksCapacities[fannyPackVar])
        applytoTable(satchelTable, satchelVar, CCSatchelsCapacities[satchelVar])
    else
        if not getActivatedMods():contains(modName) then
            return
        end
        applytoTable(backpackTable, backpackVar, CCCapacities[backpackVar])
        applytoTable(bagTable, bagVar, CCBagsCapacities[bagVar])
        applytoTable(chestRigTable, chestRigVar, CCChestRigsCapacities[chestRigVar])
        applytoTable(fannyPackTable, fannyPackVar, CCFannyPacksCapacities[fannyPackVar])
        applytoTable(satchelTable, satchelVar, CCSatchelsCapacities[satchelVar])
    end
end

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
            for _, container in ipairs(containerTable) do
                CCMain(container.ItemName, "Weight", weightFunction(container))
            end
        end
    end

    local function applyWeight(modName, containerTable, weightVar)
        if not modName or getActivatedMods():contains(modName) then
            alterWeight(containerTable, CCWeight[weightVar])
        end
    end

    applyWeight(modName, backpackTable, weightVars.backpack)
    applyWeight(modName, bagTable, weightVars.bag)
    applyWeight(modName, chestRigTable, weightVars.chestRig)
    applyWeight(modName, fannyPackTable, weightVars.fannyPack)
    applyWeight(modName, satchelTable, weightVars.satchel)
end

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

    -- Apply speed modifier to all containers
    if not modName then
        applySpeedModifier(backpackTable)
        applySpeedModifier(bagTable)
        applySpeedModifier(chestRigTable)
        applySpeedModifier(fannyPackTable)
        applySpeedModifier(satchelTable)
    else
        -- Apply speed modifier only if mod is active
        if getActivatedMods():contains(modName) then
            applySpeedModifier(backpackTable)
            applySpeedModifier(bagTable)
            applySpeedModifier(chestRigTable)
            applySpeedModifier(fannyPackTable)
            applySpeedModifier(satchelTable)
        end
    end
end

function CCalterSatchelPositioning(modName, satchelTable)
    local isWearable = SandboxVars.CustomizableClothing.SatchelWearable

    local function applySatchelPositioning(containerTable)
        if not containerTable then return end

        for _, container in ipairs(containerTable) do
            local containerName = container.ItemName:match("[^.]+$") or container.ItemName

            if isWearable == 1 then
                CCMain(container.ItemName, "CanBeEquipped", "Back")
            elseif isWearable == 2 then
                CCMain(container.ItemName, "CanBeEquipped", "FannyPackBack")
                CCMain(container.ItemName, "BodyLocation", "Nose")
                CCMain(container.ItemName, "ClothingItemExtra", containerName)
                CCMain(container.ItemName, "ClothingItemExtraOption", "FannyPack_WearBack")
            elseif isWearable == 3 then
                CCMain(container.ItemName, "CanBeEquipped", "AmmoStrap")
                CCMain(container.ItemName, "BodyLocation", "Nose")
                CCMain(container.ItemName, "ClothingItemExtra", containerName)
                CCMain(container.ItemName, "ClothingItemExtraOption", "FannyPack_WearBack")
            end
        end
    end

    if not modName or getActivatedMods():contains(modName) then
        applySatchelPositioning(satchelTable)
    end
    
function alterVehicleCapacity(modID, storage)
    local Capacities = {
        [2] = "MaxCapacity",        -- Corresponds to MaxCapacity
        [3] = "MaxCapacityB",       -- Corresponds to MaxCapacityB
        [4] = "MaxCapacityBoost",   -- Corresponds to MaxCapacityBoost
        [5] = 300                   -- Corresponds to setting a hard limit of 300
    }

    -- If the capacity option in SandboxVars is set to 1, do nothing.
    if SandboxVars.CustomizableVehicles.Capacity == 1 then
        return
    end

    -- Retrieve the corresponding capacity type or value from the sandbox settings.
    local capacityType = Capacities[SandboxVars.CustomizableVehicles.Capacity]

    if capacityType then
        -- Loop through each vehicle storage entry in the storage table
        for _, v in pairs(storage) do
            if capacityType == 300 then
                -- Set capacity to a fixed value (300) if this is chosen in the settings
                CCMain(v.ItemName, "MaxCapacity", 300)
            else
                -- Set the vehicle storage capacity to the value from the capacity type
                CCMain(v.ItemName, "MaxCapacity", v[capacityType])
            end
        end
    end
end

-- Function to adjust vehicle part weights based on SandboxVars settings.
function alterVehiclePartWeights(modID, parts)
    local Weights = {
        [2] = 0.75,  -- 75% of the original weight
        [3] = 0.5,   -- 50% of the original weight
        [4] = 0.25,  -- 25% of the original weight
        [5] = 0      -- 0% weight (weightless)
    }

    -- If the weight option in SandboxVars is set to 1, do nothing.
    if SandboxVars.CustomizableVehicles.Weight == 1 then
        return
    end

    -- Retrieve the weight multiplier from the sandbox settings.
    local weightMultiplier = Weights[SandboxVars.CustomizableVehicles.Weight]

    if weightMultiplier then
        -- Loop through each vehicle part entry in the parts table
        for _, v in pairs(parts) do
            -- Set the vehicle part weight to the adjusted value using the weight multiplier
            CCMain(v.ItemName, "Weight", v.Weight * weightMultiplier)
        end
    end
  end
end
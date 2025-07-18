CCWeightReduction = {
        [1] = function(v) return v.WeightReduction end,             -- WeightReduction = Vanilla
        [2] = function(v) return v.WeightReductionWB end,           -- WeightReduction = Well Balanced
        [3] = function(v) return v.WeightReductionB end,            -- WeightReduction = Balanced
        [4] = function(v) return ZombRand(40, 92) end,       -- WeightReduction = Random - Well Balanced
        [5] = function(v) return ZombRand(50, 95) end,       -- WeightReduction = Random - Balanced
        [6] = function(v) return SandboxVars.CustomizableBackpacks.WeightReductionStatic end,   -- WeightReduction = Custom - Static
        [7] = function(v) return ZombRand(SandboxVars.CustomizableBackpacks.WeightReductionRandomizedMin, SandboxVars.CustomizableBackpacks.WeightReductionRandomizedMax) end,  -- WeightReduction = Custom - Randomized
        [8] = function(v) return v.WeightReduction * SandboxVars.CustomizableBackpacks.WeightReductionPercentage end,  -- WeightReduction = Custom - Percentage
}
    

CCBagsWeightReduction = {
        [1] = function(v) return v.WeightReduction end,             -- WeightReduction = Vanilla
        [2] = function(v) return v.WeightReductionWB end,           -- WeightReduction = Well Balanced
        [3] = function(v) return v.WeightReductionB end,            -- WeightReduction = Balanced
        [4] = function(v) return ZombRand(40, 92) end,       -- WeightReduction = Random - Well Balanced
        [5] = function(v) return ZombRand(50, 95) end,       -- WeightReduction = Random - Balanced
        [6] = function(v) return SandboxVars.CustomizableBags.WeightReductionStatic end,   -- WeightReduction = Custom - Static
        [7] = function(v) return ZombRand(SandboxVars.CustomizableBags.WeightReductionRandomizedMin, SandboxVars.CustomizableBags.WeightReductionRandomizedMax) end,  -- WeightReduction = Custom - Randomized
        [8] = function(v) return v.WeightReduction * SandboxVars.CustomizableBags.WeightReductionPercentage end,  -- WeightReduction = Custom - Percentage
}
    
    
CCChestRigsWeightReduction = {
        [1] = function(v) return v.WeightReduction end,             -- WeightReduction = Vanilla
        [2] = function(v) return v.WeightReductionWB end,           -- WeightReduction = Well Balanced
        [3] = function(v) return v.WeightReductionB end,            -- WeightReduction = Balanced
        [4] = function(v) return ZombRand(40, 92) end,       -- WeightReduction = Random - Well Balanced
        [5] = function(v) return ZombRand(50, 95) end,       -- WeightReduction = Random - Balanced
        [6] = function(v) return SandboxVars.CustomizableChestRigs.WeightReductionStatic end,   -- WeightReduction = Custom - Static
        [7] = function(v) return ZombRand(SandboxVars.CustomizableChestRigs.WeightReductionRandomizedMin, SandboxVars.CustomizableChestRigs.WeightReductionRandomizedMax) end,  -- WeightReduction = Custom - Randomized
        [8] = function(v) return v.WeightReduction * SandboxVars.CustomizableChestRigs.WeightReductionPercentage end,  -- WeightReduction = Custom - Percentage
}
    
    
CCFannyPacksWeightReduction = {
        [1] = function(v) return v.WeightReduction end,             -- WeightReduction = Vanilla
        [2] = function(v) return v.WeightReductionWB end,           -- WeightReduction = Well Balanced
        [3] = function(v) return v.WeightReductionB end,            -- WeightReduction = Balanced
        [4] = function(v) return ZombRand(40, 92) end,       -- WeightReduction = Random - Well Balanced
        [5] = function(v) return ZombRand(50, 95) end,       -- WeightReduction = Random - Balanced
        [6] = function(v) return SandboxVars.CustomizableFannyPacks.WeightReductionStatic end,   -- WeightReduction = Custom - Static
        [7] = function(v) return ZombRand(SandboxVars.CustomizableFannyPacks.WeightReductionRandomizedMin, SandboxVars.CustomizableFannyPacks.WeightReductionRandomizedMax) end,  -- WeightReduction = Custom - Randomized
        [8] = function(v) return v.WeightReduction * SandboxVars.CustomizableFannyPacks.WeightReductionPercentage end,  -- WeightReduction = Custom - Percentage
}
    
    
CCSatchelsWeightReduction = {
        [1] = function(v) return v.WeightReduction end,             -- WeightReduction = Vanilla
        [2] = function(v) return v.WeightReductionWB end,           -- WeightReduction = Well Balanced
        [3] = function(v) return v.WeightReductionB end,            -- WeightReduction = Balanced
        [4] = function(v) return ZombRand(40, 92) end,       -- WeightReduction = Random - Well Balanced
        [5] = function(v) return ZombRand(50, 95) end,       -- WeightReduction = Random - Balanced
        [6] = function(v) return SandboxVars.CustomizableSatchels.WeightReductionStatic end,   -- WeightReduction = Custom - Static
        [7] = function(v) return ZombRand(SandboxVars.CustomizableSatchels.WeightReductionRandomizedMin, SandboxVars.CustomizableSatchels.WeightReductionRandomizedMax) end,  -- WeightReduction = Custom - Randomized
        [8] = function(v) return v.WeightReduction * SandboxVars.CustomizableSatchels.WeightReductionPercentage end,  -- WeightReduction = Custom - Percentage
}
    
    
CContainersWeightReduction = {
        [1] = function(v) return v.WeightReduction end,             -- WeightReduction = Vanilla
        [2] = function(v) return v.WeightReductionWB end,           -- WeightReduction = Well Balanced
        [3] = function(v) return v.WeightReductionB end,            -- WeightReduction = Balanced
        [4] = function(v) return ZombRand(40, 92) end,       -- WeightReduction = Random - Well Balanced
        [5] = function(v) return ZombRand(50, 95) end,       -- WeightReduction = Random - Balanced
        [6] = function(v) return SandboxVars.CustomizableContainers.WeightReductionStatic end,   -- WeightReduction = Custom - Static
        [7] = function(v) return ZombRand(SandboxVars.CustomizableContainers.WeightReductionRandomizedMin, SandboxVars.CustomizableContainers.WeightReductionRandomizedMax) end,  -- WeightReduction = Custom - Randomized
        [8] = function(v) return v.WeightReduction * SandboxVars.CustomizableContainers.WeightReductionPercentage end,  -- WeightReduction = Custom - Percentage
}


CCCapacities = {
        [1] = function(v) return v.Capacity end,             -- Capacity = Vanilla
        [2] = function(v) return v.CapacityWB end,           -- Capacity = Well Balanced
        [3] = function(v) return v.CapacityB end,            -- Capacity = Balanced
        [4] = function(v) return ZombRand(4, 34) end,       -- Capacity = Random - Well Balanced
        [5] = function(v) return ZombRand(5, 40) end,       -- Capacity = Random - Balanced
        [6] = function(v) return SandboxVars.CustomizableBackpacks.CapacityStaticSet end,   -- Capacity = Custom - Static Set
        [7] = function(v) return ZombRand(SandboxVars.CustomizableBackpacks.CapacityRandomizedMin, SandboxVars.CustomizableBackpacks.CapacityRandomizedMax) end,  -- Capacity = Custom - Randomized
        [8] = function(v) return v.Capacity * SandboxVars.CustomizableBackpacks.CapacityPercentage end,  -- Capacity = Custom - Percentage
        [9] = function(v) return v.Capacity + SandboxVars.CustomizableBackpacks.CapacityStaticIncrease end,   -- Capacity = Custom - Static Increase
        [10] = function(v) return v.CapacityWB + SandboxVars.CustomizableBackpacks.CapacityStaticIncreaseWB end,   -- Capacity = Custom - Static Increase Well Balanced
        [11] = function(v) return v.CapacityB + SandboxVars.CustomizableBackpacks.CapacityStaticIncreaseB end,   -- Capacity = Custom - Static Increase Balanced
}
    

CCBagsCapacities = {
        [1] = function(v) return v.Capacity end,             -- Capacity = Vanilla
        [2] = function(v) return v.CapacityWB end,           -- Capacity = Well Balanced
        [3] = function(v) return v.CapacityB end,            -- Capacity = Balanced
        [4] = function(v) return ZombRand(4, 34) end,       -- Capacity = Random - Well Balanced
        [5] = function(v) return ZombRand(5, 40) end,       -- Capacity = Random - Balanced
        [6] = function(v) return SandboxVars.CustomizableBags.CapacityStaticSet end,   -- Capacity = Custom - Static
        [7] = function(v) return ZombRand(SandboxVars.CustomizableBags.CapacityRandomizedMin, SandboxVars.CustomizableBags.CapacityRandomizedMax) end,  -- Capacity = Custom - Randomized
        [8] = function(v) return v.Capacity * SandboxVars.CustomizableBags.CapacityPercentage end,  -- Capacity = Custom - Percentage
        [9] = function(v) return v.Capacity + SandboxVars.CustomizableBags.CapacityStaticIncrease end,   -- Capacity = Custom - Static Increase
        [10] = function(v) return v.CapacityWB + SandboxVars.CustomizableBags.CapacityStaticIncreaseWB end,   -- Capacity = Custom - Static Increase Well Balanced
        [11] = function(v) return v.CapacityB + SandboxVars.CustomizableBags.CapacityStaticIncreaseB end,   -- Capacity = Custom - Static Increase Balanced
}
    

CCChestRigsCapacities = {
        [1] = function(v) return v.Capacity end,             -- Capacity = Vanilla
        [2] = function(v) return v.CapacityWB end,           -- Capacity = Well Balanced
        [3] = function(v) return v.CapacityB end,            -- Capacity = Balanced
        [4] = function(v) return ZombRand(4, 9) end,       -- Capacity = Random - Well Balanced
        [5] = function(v) return ZombRand(5, 13) end,       -- Capacity = Random - Balanced
        [6] = function(v) return SandboxVars.CustomizableChestRigs.CapacityStaticSet end,   -- Capacity = Custom - Static
        [7] = function(v) return ZombRand(SandboxVars.CustomizableChestRigs.CapacityRandomizedMin, SandboxVars.CustomizableChestRigs.CapacityRandomizedMax) end,  -- Capacity = Custom - Randomized
        [8] = function(v) return v.Capacity * SandboxVars.CustomizableChestRigs.CapacityPercentage end,  -- Capacity = Custom - Percentage
        [9] = function(v) return v.Capacity + SandboxVars.CustomizableChestRigs.CapacityStaticIncrease end,   -- Capacity = Custom - Static Increase
        [10] = function(v) return v.CapacityWB + SandboxVars.CustomizableChestRigs.CapacityStaticIncreaseWB end,   -- Capacity = Custom - Static Increase Well Balanced
        [11] = function(v) return v.CapacityB + SandboxVars.CustomizableChestRigs.CapacityStaticIncreaseB end,   -- Capacity = Custom - Static Increase Balanced
}
    
    
CCFannyPacksCapacities = {
        [1] = function(v) return v.Capacity end,             -- Capacity = Vanilla
        [2] = function(v) return v.CapacityWB end,           -- Capacity = Well Balanced
        [3] = function(v) return v.CapacityB end,            -- Capacity = Balanced
        [4] = function(v) return ZombRand(4, 9) end,       -- Capacity = Random - Well Balanced
        [5] = function(v) return ZombRand(5, 13) end,       -- Capacity = Random - Balanced
        [6] = function(v) return SandboxVars.CustomizableFannyPacks.CapacityStaticSet end,   -- Capacity = Custom - Static
        [7] = function(v) return ZombRand(SandboxVars.CustomizableFannyPacks.CapacityRandomizedMin, SandboxVars.CustomizableFannyPacks.CapacityRandomizedMax) end,  -- Capacity = Custom - Randomized
        [8] = function(v) return v.Capacity * SandboxVars.CustomizableFannyPacks.CapacityPercentage end,  -- Capacity = Custom - Percentage
        [9] = function(v) return v.Capacity + SandboxVars.CustomizableFannyPacks.CapacityStaticIncrease end,   -- Capacity = Custom - Static Increase
        [10] = function(v) return v.CapacityWB + SandboxVars.CustomizableFannyPacks.CapacityStaticIncreaseWB end,   -- Capacity = Custom - Static Increase Well Balanced
        [11] = function(v) return v.CapacityB + SandboxVars.CustomizableFannyPacks.CapacityStaticIncreaseB end,   -- Capacity = Custom - Static Increase Balanced
}
    
    
CCSatchelsCapacities = {
        [1] = function(v) return v.Capacity end,             -- Capacity = Vanilla
        [2] = function(v) return v.CapacityWB end,           -- Capacity = Well Balanced
        [3] = function(v) return v.CapacityB end,            -- Capacity = Balanced
        [4] = function(v) return ZombRand(4, 34) end,       -- Capacity = Random - Well Balanced
        [5] = function(v) return ZombRand(5, 40) end,       -- Capacity = Random - Balanced
        [6] = function(v) return SandboxVars.CustomizableSatchels.CapacityStaticSet end,   -- Capacity = Custom - Static
        [7] = function(v) return ZombRand(SandboxVars.CustomizableSatchels.CapacityRandomizedMin, SandboxVars.CustomizableSatchels.CapacityRandomizedMax) end,  -- Capacity = Custom - Randomized
        [8] = function(v) return v.Capacity * SandboxVars.CustomizableSatchels.CapacityPercentage end,  -- Capacity = Custom - Percentage
        [9] = function(v) return v.Capacity + SandboxVars.CustomizableSatchels.CapacityStaticIncrease end,   -- Capacity = Custom - Static Increase
        [10] = function(v) return v.CapacityWB + SandboxVars.CustomizableSatchels.CapacityStaticIncreaseWB end,   -- Capacity = Custom - Static Increase Well Balanced
        [11] = function(v) return v.CapacityB + SandboxVars.CustomizableSatchels.CapacityStaticIncreaseB end,   -- Capacity = Custom - Static Increase Balanced
}
    
    
CContainersCapacities = { 
        [1] = function(v) return v.Capacity end,             -- Capacity = Vanilla
        [2] = function(v) return v.CapacityWB end,           -- Capacity = Well Balanced
        [3] = function(v) return v.CapacityB end,            -- Capacity = Balanced
        [4] = function(v) return ZombRand(4, 34) end,       -- Capacity = Random - Well Balanced
        [5] = function(v) return ZombRand(5, 40) end,       -- Capacity = Random - Balanced
        [6] = function(v) return SandboxVars.CustomizableContainers.CapacityStaticSet end,   -- Capacity = Custom - Static
        [7] = function(v) return ZombRand(SandboxVars.CustomizableContainers.CapacityRandomizedMin, SandboxVars.CustomizableContainers.CapacityRandomizedMax) end,  -- Capacity = Custom - Randomized
        [8] = function(v) return v.Capacity * SandboxVars.CustomizableContainers.CapacityPercentage end,  -- Capacity = Custom - Percentage
        [9] = function(v) return v.Capacity + SandboxVars.CustomizableContainers.CapacityStaticIncrease end,   -- Capacity = Custom - Static Increase
        [10] = function(v) return v.CapacityWB + SandboxVars.CustomizableContainers.CapacityStaticIncreaseWB end,   -- Capacity = Custom - Static Increase Well Balanced
        [11] = function(v) return v.CapacityB + SandboxVars.CustomizableContainers.CapacityStaticIncreaseB end,   -- Capacity = Custom - Static Increase Balanced
}
    
    
CCWeight = { 
        [1] = function(v) return v.Weight end,                   -- Weight = Well Balanced
        [2] = function(v) return v.Weight * 0.75 end,            -- Weight = -25%
        [3] = function(v) return v.Weight * 0.50 end,            -- Weight = -50%
        [4] = function(v) return v.Weight * 0.25 end,            -- Weight = -75%
        [5] = function(v) return 0 end,                          -- Weight = Weightless
        [6] = function(v) return v.Weight * SandboxVars.CustomizableBackpacks.WeightPercentage end,   -- Weight = Custom Percentage
}
    
CCBagsWeight = { 
        [1] = function(v) return v.Weight end,                   -- Weight = Well Balanced
        [2] = function(v) return v.Weight * 0.75 end,            -- Weight = -25%
        [3] = function(v) return v.Weight * 0.50 end,            -- Weight = -50%
        [4] = function(v) return v.Weight * 0.25 end,            -- Weight = -75%
        [5] = function(v) return 0 end,                          -- Weight = Weightless
        [6] = function(v) return v.Weight * SandboxVars.CustomizableBags.WeightPercentage end,   -- Weight = Custom Percentage
}
    
CCChestRigsWeight = { 
        [1] = function(v) return v.Weight end,                   -- Weight = Well Balanced
        [2] = function(v) return v.Weight * 0.75 end,            -- Weight = -25%
        [3] = function(v) return v.Weight * 0.50 end,            -- Weight = -50%
        [4] = function(v) return v.Weight * 0.25 end,            -- Weight = -75%
        [5] = function(v) return 0 end,                          -- Weight = Weightless
        [6] = function(v) return v.Weight * SandboxVars.CustomizableChestRigs.WeightPercentage end,   -- Weight = Custom Percentage
}
    
CCFannyPacksWeight = { 
        [1] = function(v) return v.Weight end,                   -- Weight = Well Balanced
        [2] = function(v) return v.Weight * 0.75 end,            -- Weight = -25%
        [3] = function(v) return v.Weight * 0.50 end,            -- Weight = -50%
        [4] = function(v) return v.Weight * 0.25 end,            -- Weight = -75%
        [5] = function(v) return 0 end,                          -- Weight = Weightless
        [6] = function(v) return v.Weight * SandboxVars.CustomizableFannyPacks.WeightPercentage end,   -- Weight = Custom Percentage
}
    
CCSatchelsWeight = { 
        [1] = function(v) return v.Weight end,                   -- Weight = Well Balanced
        [2] = function(v) return v.Weight * 0.75 end,            -- Weight = -25%
        [3] = function(v) return v.Weight * 0.50 end,            -- Weight = -50%
        [4] = function(v) return v.Weight * 0.25 end,            -- Weight = -75%
        [5] = function(v) return 0 end,                          -- Weight = Weightless
        [6] = function(v) return v.Weight * SandboxVars.CustomizableSatchels.WeightPercentage end,   -- Weight = Custom Percentage
}
    
CContainersWeight = { 
        [1] = function(v) return v.Weight end,                   -- Weight = Well Balanced
        [2] = function(v) return v.Weight * 0.75 end,            -- Weight = -25%
        [3] = function(v) return v.Weight * 0.50 end,            -- Weight = -50%
        [4] = function(v) return v.Weight * 0.25 end,            -- Weight = -75%
        [5] = function(v) return 0 end,                          -- Weight = Weightless
        [6] = function(v) return v.Weight * SandboxVars.CustomizableContainers.WeightPercentage end,   -- Weight = Custom Percentage
}

CCSatchelWearable = {
    [1] = { CanBeEquipped = "Back" },  -- Off
    [2] = { CanBeEquipped = "FannyPackBack", BodyLocation = "CCSatchel" },  -- Fanny Pack Slot
    [3] = { CanBeEquipped = "CCSatchel", BodyLocation = "CCSatchel" } -- Satchel Slot
}

CCSatchelWearableTheyKnew = {
    [1] = { CanBeEquipped = "Back" },  -- Off
    [2] = { CanBeEquipped = "FannyPackBack", BodyLocation = "Back" },  -- Fanny Pack Slot
    [3] = { CanBeEquipped = "CCSatchel", BodyLocation = "CCSatchel" } -- Satchel Slot
}

CCSatchelWearableSTR = {
    [1] = { CanBeEquipped = "Back" },  -- Off
    [2] = { CanBeEquipped = "FannyPackBack", BodyLocation = "CCSatchel" },  -- Fanny Pack Slot
    [3] = { CanBeEquipped = "CCSatchel", BodyLocation = "CCSatchel" } -- Satchel Slot
}

CCChestRigWearable = {
    [false] = { CanBeEquipped = "Webbing", BodyLocation = "Webbing" },  -- Off
    [true] = { CanBeEquipped = "CCWebbing", BodyLocation = "CCWebbing" } -- Wearable with Satchel and Fannypack
}

CCShoulderLWearable = {
    [false] = { BodyLocation = "ShoulderpadLeft" },  -- Off
    [true] = { BodyLocation = "CCShoulderL" } -- Wearable with a Backpack
}

CCShoulderRWearable = {
    [false] = { BodyLocation = "ShoulderpadRight" },  -- Off
    [true] = { BodyLocation = "CCShoulderR" } -- Wearable with a Backpack
}

CCShoulderOnTopWearable = {
    [false] = { BodyLocation = "SportShoulderpadOnTop" },  -- Off
    [true] = { BodyLocation = "CCSportShoulderpadOnTop" } -- Wearable with a Backpack
}

local group = BodyLocations.getGroup("Human")
group:getOrCreateLocation("CCSatchel")
group:getOrCreateLocation("CCWebbing")
group:getOrCreateLocation("CCShoulderL")
group:getOrCreateLocation("CCShoulderR")
group:getOrCreateLocation("CCSportShoulderpadOnTop")
group:setExclusive("CCShoulderL","CCSportShoulderpadOnTop")
group:setExclusive("CCShoulderR","CCSportShoulderpadOnTop")

CCchestRigItems = {
    "Base.Bag_ChestRig",
    "Base.Bag_ALICE_BeltSus_Green", 
    "Base.Bag_ALICE_BeltSus_Camo",
    "Base.Bag_ALICE_BeltSus"
}

CCshoulderLeftItems = {
    "Base.Shoulderpad_Wood_L",
    "Base.Shoulderpad_Football_L",
    "Base.Shoulderpad_Bone_L",
    "Base.Shoulderpad_Tire_L",
    "Base.Shoulderpad_Articulated_L_Metal",
    "Base.Shoulderpad_ArticulatedSpike_L",
    "Base.Shoulderpad_Metal_L",
    "Base.Shoulderpad_MetalSpike_L",
    "Base.Shoulderpad_MetalScrap_L",
    "Base.Shoulderpad_MetalSpikeScrap_L"
}

CCshoulderRightItems = {
    "Base.Shoulderpad_Wood_R",
    "Base.Shoulderpad_Football_R",
    "Base.Shoulderpad_Bone_R",
    "Base.Shoulderpad_Tire_R",
    "Base.Shoulderpad_Articulated_R_Metal",
    "Base.Shoulderpad_ArticulatedSpike_R",
    "Base.Shoulderpad_Metal_R",
    "Base.Shoulderpad_MetalSpike_R",
    "Base.Shoulderpad_MetalScrap_R",
    "Base.Shoulderpad_MetalSpikeScrap_R"
}

CCshoulderOnTopItems = {
    "Base.Shoulderpads_Football",
    "Base.Shoulderpads_FootballOnTop",
    "Base.Shoulderpads_IceHockey",
    "Base.Shoulderpads_IceHockeyOnTop"
}
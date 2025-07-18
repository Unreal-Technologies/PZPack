CCWeightReduction = {
        [1] = function(v) return v.WeightReduction * 0.75 end,      -- WeightReduction = -25
        [2] = function(v) return v.WeightReduction end,             -- WeightReduction = Vanilla
        [3] = function(v) return v.WeightReductionWB end,           -- WeightReduction = Well Balanced
        [4] = function(v) return v.WeightReductionB end,            -- WeightReduction = Balanced
        [5] = function(v) return ZombRand(40, 92) end,       -- WeightReduction = Random - Well Balanced
        [6] = function(v) return ZombRand(50, 95) end,       -- WeightReduction = Random - Balanced
        [7] = function(v) return 75 end,     -- WeightReduction = +75
        [8] = function(v) return 80 end,      -- WeightReduction = +80
        [9] = function(v) return 85 end,     -- WeightReduction = +85
        [10] = function(v) return 90 end,       -- WeightReduction = 90
        [11] = function(v) return 95 end,       -- WeightReduction = 95
        [12] = function(v) return 99 end,       -- WeightReduction = 99
        [13] = function(v) return 100 end,      -- WeightReduction = 100
        [14] = function(v) return SandboxVars.CustomizableBackpacks.WeightReductionStatic end,   -- WeightReduction = Custom - Static
        [15] = function(v) return ZombRand(SandboxVars.CustomizableBackpacks.WeightReductionRandomizedMin, SandboxVars.CustomizableBackpacks.WeightReductionRandomizedMax) end,  -- WeightReduction = Custom - Randomized
        [16] = function(v) return v.WeightReduction * SandboxVars.CustomizableBackpacks.WeightReductionPercentage end,  -- WeightReduction = Custom - Percentage
}
    

CCBagsWeightReduction = {
        [1] = function(v) return v.WeightReduction * 0.75 end,      -- WeightReduction = -25
        [2] = function(v) return v.WeightReduction end,             -- WeightReduction = Vanilla
        [3] = function(v) return v.WeightReductionWB end,           -- WeightReduction = Well Balanced
        [4] = function(v) return v.WeightReductionB end,            -- WeightReduction = Balanced
        [5] = function(v) return ZombRand(40, 92) end,       -- WeightReduction = Random - Well Balanced
        [6] = function(v) return ZombRand(50, 95) end,       -- WeightReduction = Random - Balanced
        [7] = function(v) return 75 end,     -- WeightReduction = +75
        [8] = function(v) return 80 end,      -- WeightReduction = +80
        [9] = function(v) return 85 end,     -- WeightReduction = +85
        [10] = function(v) return 90 end,       -- WeightReduction = 90
        [11] = function(v) return 95 end,       -- WeightReduction = 95
        [12] = function(v) return 99 end,       -- WeightReduction = 99
        [13] = function(v) return 100 end,      -- WeightReduction = 100
        [14] = function(v) return SandboxVars.CustomizableBags.WeightReductionStatic end,   -- WeightReduction = Custom - Static
        [15] = function(v) return ZombRand(SandboxVars.CustomizableBags.WeightReductionRandomizedMin, SandboxVars.CustomizableBags.WeightReductionRandomizedMax) end,  -- WeightReduction = Custom - Randomized
        [16] = function(v) return v.WeightReduction * SandboxVars.CustomizableBags.WeightReductionPercentage end,  -- WeightReduction = Custom - Percentage
}
    
    
CCChestRigsWeightReduction = {
        [1] = function(v) return v.WeightReduction * 0.75 end,      -- WeightReduction = -25
        [2] = function(v) return v.WeightReduction end,             -- WeightReduction = Vanilla
        [3] = function(v) return v.WeightReductionWB end,           -- WeightReduction = Well Balanced
        [4] = function(v) return v.WeightReductionB end,            -- WeightReduction = Balanced
        [5] = function(v) return ZombRand(40, 92) end,       -- WeightReduction = Random - Well Balanced
        [6] = function(v) return ZombRand(50, 95) end,       -- WeightReduction = Random - Balanced
        [7] = function(v) return 75 end,     -- WeightReduction = +75
        [8] = function(v) return 80 end,      -- WeightReduction = +80
        [9] = function(v) return 85 end,     -- WeightReduction = +85
        [10] = function(v) return 90 end,       -- WeightReduction = 90
        [11] = function(v) return 95 end,       -- WeightReduction = 95
        [12] = function(v) return 99 end,       -- WeightReduction = 99
        [13] = function(v) return 100 end,      -- WeightReduction = 100
        [14] = function(v) return SandboxVars.CustomizableChestRigs.WeightReductionStatic end,   -- WeightReduction = Custom - Static
        [15] = function(v) return ZombRand(SandboxVars.CustomizableChestRigs.WeightReductionRandomizedMin, SandboxVars.CustomizableChestRigs.WeightReductionRandomizedMax) end,  -- WeightReduction = Custom - Randomized
        [16] = function(v) return v.WeightReduction * SandboxVars.CustomizableChestRigs.WeightReductionPercentage end,  -- WeightReduction = Custom - Percentage
}
    
    
CCFannyPacksWeightReduction = {
        [1] = function(v) return v.WeightReduction * 0.75 end,      -- WeightReduction = -25
        [2] = function(v) return v.WeightReduction end,             -- WeightReduction = Vanilla
        [3] = function(v) return v.WeightReductionWB end,           -- WeightReduction = Well Balanced
        [4] = function(v) return v.WeightReductionB end,            -- WeightReduction = Balanced
        [5] = function(v) return ZombRand(40, 92) end,       -- WeightReduction = Random - Well Balanced
        [6] = function(v) return ZombRand(50, 95) end,       -- WeightReduction = Random - Balanced
        [7] = function(v) return 75 end,     -- WeightReduction = +75
        [8] = function(v) return 80 end,      -- WeightReduction = +80
        [9] = function(v) return 85 end,     -- WeightReduction = +85
        [10] = function(v) return 90 end,       -- WeightReduction = 90
        [11] = function(v) return 95 end,       -- WeightReduction = 95
        [12] = function(v) return 99 end,       -- WeightReduction = 99
        [13] = function(v) return 100 end,      -- WeightReduction = 100
        [14] = function(v) return SandboxVars.CustomizableFannyPacks.WeightReductionStatic end,   -- WeightReduction = Custom - Static
        [15] = function(v) return ZombRand(SandboxVars.CustomizableFannyPacks.WeightReductionRandomizedMin, SandboxVars.CustomizableFannyPacks.WeightReductionRandomizedMax) end,  -- WeightReduction = Custom - Randomized
        [16] = function(v) return v.WeightReduction * SandboxVars.CustomizableFannyPacks.WeightReductionPercentage end,  -- WeightReduction = Custom - Percentage
}
    
    
CCSatchelsWeightReduction = {
        [1] = function(v) return v.WeightReduction * 0.75 end,      -- WeightReduction = -25
        [2] = function(v) return v.WeightReduction end,             -- WeightReduction = Vanilla
        [3] = function(v) return v.WeightReductionWB end,           -- WeightReduction = Well Balanced
        [4] = function(v) return v.WeightReductionB end,            -- WeightReduction = Balanced
        [5] = function(v) return ZombRand(40, 92) end,       -- WeightReduction = Random - Well Balanced
        [6] = function(v) return ZombRand(50, 95) end,       -- WeightReduction = Random - Balanced
        [7] = function(v) return 75 end,     -- WeightReduction = +75
        [8] = function(v) return 80 end,      -- WeightReduction = +80
        [9] = function(v) return 85 end,     -- WeightReduction = +85
        [10] = function(v) return 90 end,       -- WeightReduction = 90
        [11] = function(v) return 95 end,       -- WeightReduction = 95
        [12] = function(v) return 99 end,       -- WeightReduction = 99
        [13] = function(v) return 100 end,      -- WeightReduction = 100
        [14] = function(v) return SandboxVars.CustomizableSatchels.WeightReductionStatic end,   -- WeightReduction = Custom - Static
        [15] = function(v) return ZombRand(SandboxVars.CustomizableSatchels.WeightReductionRandomizedMin, SandboxVars.CustomizableSatchels.WeightReductionRandomizedMax) end,  -- WeightReduction = Custom - Randomized
        [16] = function(v) return v.WeightReduction * SandboxVars.CustomizableSatchels.WeightReductionPercentage end,  -- WeightReduction = Custom - Percentage
}
    
    
CContainersWeightReduction = {
        [1] = function(v) return v.WeightReduction * 0.75 end,      -- WeightReduction = -25
        [2] = function(v) return v.WeightReduction end,             -- WeightReduction = Vanilla
        [3] = function(v) return v.WeightReductionWB end,           -- WeightReduction = Well Balanced
        [4] = function(v) return v.WeightReductionB end,            -- WeightReduction = Balanced
        [5] = function(v) return ZombRand(40, 92) end,       -- WeightReduction = Random - Well Balanced
        [6] = function(v) return ZombRand(50, 95) end,       -- WeightReduction = Random - Balanced
        [7] = function(v) return 75 end,     -- WeightReduction = +75
        [8] = function(v) return 80 end,      -- WeightReduction = +80
        [9] = function(v) return 85 end,     -- WeightReduction = +85
        [10] = function(v) return 90 end,       -- WeightReduction = 90
        [11] = function(v) return 95 end,       -- WeightReduction = 95
        [12] = function(v) return 99 end,       -- WeightReduction = 99
        [13] = function(v) return 100 end,      -- WeightReduction = 100
        [14] = function(v) return SandboxVars.CustomizableContainers.WeightReductionStatic end,   -- WeightReduction = Custom - Static
        [15] = function(v) return ZombRand(SandboxVars.CustomizableContainers.WeightReductionRandomizedMin, SandboxVars.CustomizableContainers.WeightReductionRandomizedMax) end,  -- WeightReduction = Custom - Randomized
        [16] = function(v) return v.WeightReduction * SandboxVars.CustomizableContainers.WeightReductionPercentage end,  -- WeightReduction = Custom - Percentage
}


CCCapacities = {
        [1] = function(v) return v.Capacity * 0.75 end,      -- Capacity = -25
        [2] = function(v) return v.Capacity end,             -- Capacity = Vanilla
        [3] = function(v) return v.CapacityWB end,           -- Capacity = Well Balanced
        [4] = function(v) return v.CapacityB end,            -- Capacity = Balanced
        [5] = function(v) return ZombRand(4, 34) end,       -- Capacity = Random - Well Balanced
        [6] = function(v) return ZombRand(5, 40) end,       -- Capacity = Random - Balanced
        [7] = function(v) return v.Capacity * 1.25 end,     -- Capacity = +25
        [8] = function(v) return v.Capacity * 1.5 end,      -- Capacity = +50
        [9] = function(v) return v.Capacity * 1.75 end,     -- Capacity = +75
        [10] = function(v) return v.Capacity * 2 end,       -- Capacity = 2x
        [11] = function(v) return v.Capacity * 3 end,       -- Capacity = 3x
        [12] = function(v) return v.Capacity * 5 end,       -- Capacity = 5x
        [13] = function(v) return v.Capacity * 7.5 end,     -- Capacity = 7.5x
        [14] = function(v) return v.Capacity * 10 end,      -- Capacity = 10x
        [15] = function(v) return 20 end,                  -- Capacity = 20
        [16] = function(v) return 25 end,                  -- Capacity = 25
        [17] = function(v) return 30 end,                  -- Capacity = 30
        [18] = function(v) return 40 end,                  -- Capacity = 40
        [19] = function(v) return 50 end,                  -- Capacity = 50
        [20] = function(v) return 75 end,                  -- Capacity = 75
        [21] = function(v) return SandboxVars.CustomizableBackpacks.CapacityStatic end,   -- Capacity = Custom - Static Set
        [22] = function(v) return ZombRand(SandboxVars.CustomizableBackpacks.CapacityRandomizedMin, SandboxVars.CustomizableBackpacks.CapacityRandomizedMax) end,  -- Capacity = Custom - Randomized
        [23] = function(v) return v.Capacity * SandboxVars.CustomizableBackpacks.CapacityPercentage end,  -- Capacity = Custom - Percentage
        [24] = function(v) return v.Capacity + SandboxVars.CustomizableBackpacks.CapacityStatic end,   -- Capacity = Custom - Static Increase
        [25] = function(v) return v.CapacityWB + SandboxVars.CustomizableBackpacks.CapacityStatic end,   -- Capacity = Custom - Static Increase Well Balanced
        [26] = function(v) return v.CapacityB + SandboxVars.CustomizableBackpacks.CapacityStatic end,   -- Capacity = Custom - Static Increase Balanced
}
    

CCBagsCapacities = {
        [1] = function(v) return v.Capacity * 0.75 end,      -- Capacity = -25
        [2] = function(v) return v.Capacity end,             -- Capacity = Vanilla
        [3] = function(v) return v.CapacityWB end,           -- Capacity = Well Balanced
        [4] = function(v) return v.CapacityB end,            -- Capacity = Balanced
        [5] = function(v) return ZombRand(4, 34) end,       -- Capacity = Random - Well Balanced
        [6] = function(v) return ZombRand(5, 40) end,       -- Capacity = Random - Balanced
        [7] = function(v) return v.Capacity * 1.25 end,     -- Capacity = +25
        [8] = function(v) return v.Capacity * 1.5 end,      -- Capacity = +50
        [9] = function(v) return v.Capacity * 1.75 end,     -- Capacity = +75
        [10] = function(v) return v.Capacity * 2 end,       -- Capacity = 2x
        [11] = function(v) return v.Capacity * 3 end,       -- Capacity = 3x
        [12] = function(v) return v.Capacity * 5 end,       -- Capacity = 5x
        [13] = function(v) return v.Capacity * 7.5 end,     -- Capacity = 7.5x
        [14] = function(v) return v.Capacity * 10 end,      -- Capacity = 10x
        [15] = function(v) return 20 end,                  -- Capacity = 20
        [16] = function(v) return 25 end,                  -- Capacity = 25
        [17] = function(v) return 30 end,                  -- Capacity = 30
        [18] = function(v) return 40 end,                  -- Capacity = 40
        [19] = function(v) return 50 end,                  -- Capacity = 50
        [20] = function(v) return 75 end,                  -- Capacity = 75
        [21] = function(v) return SandboxVars.CustomizableBags.CapacityStatic end,   -- Capacity = Custom - Static
        [22] = function(v) return ZombRand(SandboxVars.CustomizableBags.CapacityRandomizedMin, SandboxVars.CustomizableBags.CapacityRandomizedMax) end,  -- Capacity = Custom - Randomized
        [23] = function(v) return v.Capacity * SandboxVars.CustomizableBags.CapacityPercentage end,  -- Capacity = Custom - Percentage
        [24] = function(v) return v.Capacity + SandboxVars.CustomizableBags.CapacityStatic end,   -- Capacity = Custom - Static Increase
        [25] = function(v) return v.CapacityWB + SandboxVars.CustomizableBags.CapacityStatic end,   -- Capacity = Custom - Static Increase Well Balanced
        [26] = function(v) return v.CapacityB + SandboxVars.CustomizableBags.CapacityStatic end,   -- Capacity = Custom - Static Increase Balanced
}
    

CCChestRigsCapacities = {
        [1] = function(v) return v.Capacity * 0.75 end,      -- Capacity = -25
        [2] = function(v) return v.Capacity end,             -- Capacity = Vanilla
        [3] = function(v) return v.CapacityWB end,           -- Capacity = Well Balanced
        [4] = function(v) return v.CapacityB end,            -- Capacity = Balanced
        [5] = function(v) return ZombRand(4, 9) end,       -- Capacity = Random - Well Balanced
        [6] = function(v) return ZombRand(5, 13) end,       -- Capacity = Random - Balanced
        [7] = function(v) return v.Capacity * 1.25 end,     -- Capacity = +25
        [8] = function(v) return v.Capacity * 1.5 end,      -- Capacity = +50
        [9] = function(v) return v.Capacity * 1.75 end,     -- Capacity = +75
        [10] = function(v) return v.Capacity * 2 end,       -- Capacity = 2x
        [11] = function(v) return v.Capacity * 3 end,       -- Capacity = 3x
        [12] = function(v) return v.Capacity * 5 end,       -- Capacity = 5x
        [13] = function(v) return v.Capacity * 7.5 end,     -- Capacity = 7.5x
        [14] = function(v) return v.Capacity * 10 end,      -- Capacity = 10x
        [15] = function(v) return 20 end,                  -- Capacity = 20
        [16] = function(v) return 25 end,                  -- Capacity = 25
        [17] = function(v) return 30 end,                  -- Capacity = 30
        [18] = function(v) return 40 end,                  -- Capacity = 40
        [19] = function(v) return 50 end,                  -- Capacity = 50
        [20] = function(v) return 75 end,                  -- Capacity = 75
        [21] = function(v) return SandboxVars.CustomizableChestRigs.CapacityStatic end,   -- Capacity = Custom - Static
        [22] = function(v) return ZombRand(SandboxVars.CustomizableChestRigs.CapacityRandomizedMin, SandboxVars.CustomizableBackpacks.CapacityRandomizedMax) end,  -- Capacity = Custom - Randomized
        [23] = function(v) return v.Capacity * SandboxVars.CustomizableChestRigs.CapacityPercentage end,  -- Capacity = Custom - Percentage
        [24] = function(v) return v.Capacity + SandboxVars.CustomizableChestRigs.CapacityStatic end,   -- Capacity = Custom - Static Increase
        [25] = function(v) return v.CapacityWB + SandboxVars.CustomizableChestRigs.CapacityStatic end,   -- Capacity = Custom - Static Increase Well Balanced
        [26] = function(v) return v.CapacityB + SandboxVars.CustomizableChestRigs.CapacityStatic end,   -- Capacity = Custom - Static Increase Balanced
}
    
    
CCFannyPacksCapacities = {
        [1] = function(v) return v.Capacity * 0.75 end,      -- Capacity = -25
        [2] = function(v) return v.Capacity end,             -- Capacity = Vanilla
        [3] = function(v) return v.CapacityWB end,           -- Capacity = Well Balanced
        [4] = function(v) return v.CapacityB end,            -- Capacity = Balanced
        [5] = function(v) return ZombRand(4, 9) end,       -- Capacity = Random - Well Balanced
        [6] = function(v) return ZombRand(5, 13) end,       -- Capacity = Random - Balanced
        [7] = function(v) return v.Capacity * 1.25 end,     -- Capacity = +25
        [8] = function(v) return v.Capacity * 1.5 end,      -- Capacity = +50
        [9] = function(v) return v.Capacity * 1.75 end,     -- Capacity = +75
        [10] = function(v) return v.Capacity * 2 end,       -- Capacity = 2x
        [11] = function(v) return v.Capacity * 3 end,       -- Capacity = 3x
        [12] = function(v) return v.Capacity * 5 end,       -- Capacity = 5x
        [13] = function(v) return v.Capacity * 7.5 end,     -- Capacity = 7.5x
        [14] = function(v) return v.Capacity * 10 end,      -- Capacity = 10x
        [15] = function(v) return 20 end,                  -- Capacity = 20
        [16] = function(v) return 25 end,                  -- Capacity = 25
        [17] = function(v) return 30 end,                  -- Capacity = 30
        [18] = function(v) return 40 end,                  -- Capacity = 40
        [19] = function(v) return 50 end,                  -- Capacity = 50
        [20] = function(v) return 75 end,                  -- Capacity = 75
        [21] = function(v) return SandboxVars.CustomizableFannyPacks.CapacityStatic end,   -- Capacity = Custom - Static
        [22] = function(v) return ZombRand(SandboxVars.CustomizableFannyPacks.CapacityRandomizedMin, SandboxVars.CustomizableFannyPacks.CapacityRandomizedMax) end,  -- Capacity = Custom - Randomized
        [23] = function(v) return v.Capacity * SandboxVars.CustomizableFannyPacks.CapacityPercentage end,  -- Capacity = Custom - Percentage
        [24] = function(v) return v.Capacity + SandboxVars.CustomizableFannyPacks.CapacityStatic end,   -- Capacity = Custom - Static Increase
        [25] = function(v) return v.CapacityWB + SandboxVars.CustomizableFannyPacks.CapacityStatic end,   -- Capacity = Custom - Static Increase Well Balanced
        [26] = function(v) return v.CapacityB + SandboxVars.CustomizableFannyPacks.CapacityStatic end,   -- Capacity = Custom - Static Increase Balanced
}
    
    
CCSatchelsCapacities = {
        [1] = function(v) return v.Capacity * 0.75 end,      -- Capacity = -25
        [2] = function(v) return v.Capacity end,             -- Capacity = Vanilla
        [3] = function(v) return v.CapacityWB end,           -- Capacity = Well Balanced
        [4] = function(v) return v.CapacityB end,            -- Capacity = Balanced
        [5] = function(v) return ZombRand(4, 34) end,       -- Capacity = Random - Well Balanced
        [6] = function(v) return ZombRand(5, 40) end,       -- Capacity = Random - Balanced
        [7] = function(v) return v.Capacity * 1.25 end,     -- Capacity = +25
        [8] = function(v) return v.Capacity * 1.5 end,      -- Capacity = +50
        [9] = function(v) return v.Capacity * 1.75 end,     -- Capacity = +75
        [10] = function(v) return v.Capacity * 2 end,       -- Capacity = 2x
        [11] = function(v) return v.Capacity * 3 end,       -- Capacity = 3x
        [12] = function(v) return v.Capacity * 5 end,       -- Capacity = 5x
        [13] = function(v) return v.Capacity * 7.5 end,     -- Capacity = 7.5x
        [14] = function(v) return v.Capacity * 10 end,      -- Capacity = 10x
        [15] = function(v) return 20 end,                  -- Capacity = 20
        [16] = function(v) return 25 end,                  -- Capacity = 25
        [17] = function(v) return 30 end,                  -- Capacity = 30
        [18] = function(v) return 40 end,                  -- Capacity = 40
        [19] = function(v) return 50 end,                  -- Capacity = 50
        [20] = function(v) return 75 end,                  -- Capacity = 75
        [21] = function(v) return SandboxVars.CustomizableSatchels.CapacityStatic end,   -- Capacity = Custom - Static
        [22] = function(v) return ZombRand(SandboxVars.CustomizableSatchels.CapacityRandomizedMin, SandboxVars.CustomizableBackpacks.CapacityRandomizedMax) end,  -- Capacity = Custom - Randomized
        [23] = function(v) return v.Capacity * SandboxVars.CustomizableSatchels.CapacityPercentage end,  -- Capacity = Custom - Percentage
        [24] = function(v) return v.Capacity + SandboxVars.CustomizableSatchels.CapacityStatic end,   -- Capacity = Custom - Static Increase
        [25] = function(v) return v.CapacityWB + SandboxVars.CustomizableSatchels.CapacityStatic end,   -- Capacity = Custom - Static Increase Well Balanced
        [26] = function(v) return v.CapacityB + SandboxVars.CustomizableSatchels.CapacityStatic end,   -- Capacity = Custom - Static Increase Balanced
}
    
    
CContainersCapacities = { 
        [1] = function(v) return v.Capacity * 0.75 end,      -- Capacity = -25
        [2] = function(v) return v.Capacity end,             -- Capacity = Vanilla
        [3] = function(v) return v.CapacityWB end,           -- Capacity = Well Balanced
        [4] = function(v) return v.CapacityB end,            -- Capacity = Balanced
        [5] = function(v) return ZombRand(4, 34) end,       -- Capacity = Random - Well Balanced
        [6] = function(v) return ZombRand(5, 40) end,       -- Capacity = Random - Balanced
        [7] = function(v) return v.Capacity * 1.25 end,     -- Capacity = +25
        [8] = function(v) return v.Capacity * 1.5 end,      -- Capacity = +50
        [9] = function(v) return v.Capacity * 1.75 end,     -- Capacity = +75
        [10] = function(v) return v.Capacity * 2 end,       -- Capacity = 2x
        [11] = function(v) return v.Capacity * 3 end,       -- Capacity = 3x
        [12] = function(v) return v.Capacity * 5 end,       -- Capacity = 5x
        [13] = function(v) return v.Capacity * 7.5 end,     -- Capacity = 7.5x
        [14] = function(v) return v.Capacity * 10 end,      -- Capacity = 10x
        [15] = function(v) return 20 end,                  -- Capacity = 20
        [16] = function(v) return 25 end,                  -- Capacity = 25
        [17] = function(v) return 30 end,                  -- Capacity = 30
        [18] = function(v) return 40 end,                  -- Capacity = 40
        [19] = function(v) return 50 end,                  -- Capacity = 50
        [20] = function(v) return 75 end,                  -- Capacity = 75
        [21] = function(v) return SandboxVars.CustomizableContainers.CapacityStatic end,   -- Capacity = Custom - Static
        [22] = function(v) return ZombRand(SandboxVars.CustomizableContainers.CapacityRandomizedMin, SandboxVars.CustomizableBackpacks.CapacityRandomizedMax) end,  -- Capacity = Custom - Randomized
        [23] = function(v) return v.Capacity * SandboxVars.CustomizableContainers.CapacityPercentage end,  -- Capacity = Custom - Percentage
        [24] = function(v) return v.Capacity + SandboxVars.CustomizableContainers.CapacityStatic end,   -- Capacity = Custom - Static Increase
        [25] = function(v) return v.CapacityWB + SandboxVars.CustomizableContainers.CapacityStatic end,   -- Capacity = Custom - Static Increase Well Balanced
        [26] = function(v) return v.CapacityB + SandboxVars.CustomizableContainers.CapacityStatic end,   -- Capacity = Custom - Static Increase Balanced
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
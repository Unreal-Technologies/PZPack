    -- =====================
    --    Custom loot tables
    -- =====================
local function preDistributionMerge()
    --
    --
    --
    ProceduralDistributions.list.PetGroomer = {
        rolls = 10,
        items = {
            "DogChew", 6,
            "CatToy", 6,
            "Leash", 4,
            "Dogfood", 20,
            "Dogfood", 10,
            "WaterDish", 50,
            "TennisBall", 8,
            "BathTowel", 50,
            "Scissors", 50,
            "Comb", 50,
            "Razor", 4,
            "Rubberducky", 4,
            "Soap2", 10,
            "Tweezers", 10,
        },
    }
    --
    --
    --
    ProceduralDistributions.list.PropaneStore = {
        rolls = 4,
        items = {
            "PropaneTank", 50,
            "PropaneTank", 20,
            "PropaneTank", 20,
            "PropaneTank", 10,
            "PropaneTank", 10,
            "Apron_Black", 10,
            "Apron_White", 10,
            "CarvingFork", 20,
            "CarvingFork", 10,
            "CuttingBoardWooden", 10,
            "GrillBrush", 20,
            "GrillBrush", 10,
            "KitchenTongs", 10,
            "Spatula", 20,
            "Spatula", 10,
        },
    }
    --
    --
    --
end
Events.OnPreDistributionMerge.Add(preDistributionMerge);
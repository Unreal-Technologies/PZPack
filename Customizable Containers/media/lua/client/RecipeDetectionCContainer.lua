function RecipeDetectionCContainer()
    local containers = {
        "Crate",
        "Green Crate",
        "Cyan Crate",
        "Turquoise Crate",
        "Light Blue Crate",
        "Blue Crate",
        "Purple Crate",
        "Pink Crate",
        "Red Crate",
        "Orange Crate",
        "Yellow Crate",
        "Brown Crate",
        "Light Brown Crate",
        "Black Crate",
        "White Crate",
        "Grey Crate",
        "Red Refrigerator",
        "Green Refrigerator",
        "Blue Refrigerator",
        "Plain Refrigerator",
        "Steel Refrigerator",
        "White Refrigerator",
        "Military Crate",
        "Green Military Crate",
        "Cyan Military Crate",
        "Turquoise Military Crate",
        "Light Blue Military Crate",
        "Blue Military Crate",
        "Purple Military Crate",
        "Pink Military Crate",
        "Red Military Crate",
        "Orange Military Crate",
        "Yellow Military Crate",
        "Brown Military Crate",
        "Light Brown Military Crate",
        "Black Military Crate",
        "White Military Crate",
        "Grey Military Crate",
        "Military Locker",
        "Small Military Locker",
        "Small Chest",
        "Half Crate",
        "Green Half Crate",
        "Cyan Half Crate",
        "Turquoise Half Crate",
        "Light Blue Half Crate",
        "Blue Half Crate",
        "Purple Half Crate",
        "Pink Half Crate",
        "Red Half Crate",
        "Orange Half Crate",
        "Yellow Half Crate",
        "Brown Half Crate",
        "Light Brown Half Crate",
        "Black Half Crate",
        "White Half Crate",
        "Grey Half Crate",
        "Cardboard Box",
        "Metal Crate",
        "Ice Freezer",
        "Metal Cabinet",
    }

    local tiers = { "Tier 1", "Tier 2", "Tier 3", "Tier 4", "Tier 5", "Tier 6", "Tier 7", "Tier 8" }

     local selectedValue = SandboxVars.CustomizableRecipes.CContainers

    -- Function to add recipes to the players' known recipes.
    local function addRecipe(recipeName)
        if not getPlayer():getKnownRecipes():contains(recipeName) then
            getPlayer():getKnownRecipes():add(recipeName)
             -- print("Added recipe: " .. recipeName)  -- DEBUG
        end
    end

    local function removeRecipe(recipeName)
        if getPlayer():getKnownRecipes():contains(recipeName) then
            getPlayer():getKnownRecipes():remove(recipeName)
             -- print("Removed recipe: " .. recipeName) -- DEBUG
        end
    end

    -- Creates a table of recipes to remove.
    local recipesToRemove = {}
    for _, container in ipairs(containers) do
        for _, tier in ipairs(tiers) do
        -- Adds "Craft" recipes to removal list.
            local recipeName = "Craft " .. container .. " " .. tier
            table.insert(recipesToRemove, recipeName)
        end
    end

    -- Clear all existing recipes
    for _, recipeName in ipairs(recipesToRemove) do
        removeRecipe(recipeName)
        if getPlayer():HasTrait("ingenuitive") then
            removeRecipe(recipeName)
        end
    end

    -- Adds new recipes based on the selected sandbox option.
    if selectedValue >= 2 then
        for i = 1, math.min(selectedValue - 1, #tiers) do
            for _, container in ipairs(containers) do
                for j = 1, i do
                    local recipeName = "Craft " .. container .. " " .. tiers[j]
                    addRecipe(recipeName)
                    -- print(recipeName) -- DEBUG
                end
            end
        end
    end
end

    

-- Will require a reload if changes are made to the Sandbox Option.
Events.OnLoad.Add(RecipeDetectionCContainer)
Events.OnGameStart.Add(RecipeDetectionCContainer)
Events.OnCreatePlayer.Add(RecipeDetectionCContainer)
local function RecipeDetectionCrafting()

    if SandboxVars.CustomizableRecipes.CraftableFannyPack == true then
        getPlayer():getKnownRecipes():add("Craft Fanny Pack")
    else
        getPlayer():getKnownRecipes():remove("Craft Fanny Pack")
    end
end


Events.OnLoad.Add(RecipeDetectionCrafting)
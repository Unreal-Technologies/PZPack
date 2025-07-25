require("ItemTweaker");

if not UnknownsModifications then UnknownsModifications = {} end

function UnknownsModifications.CategorizeItem(item)
  local category = "";

  if item:getCanStoreWater() then
    if item:getTypeString() ~= "Drainable" then
      category = "Container";
    else
      category = "FoodB";
    end

  elseif item:getDisplayCategory() == "Water" then
    category = "FoodB";

  elseif item:getTypeString() == "Food" then
    if item:getDaysTotallyRotten() > 0 and item:getDaysTotallyRotten() < 1000000000 then
      category = "FoodP";
    else
      category = "FoodN";
    end

  elseif item:getTypeString() == "Literature" then
    if string.len(item:getSkillTrained()) > 0 then
      category = "LitS";
    elseif item:getTeachedRecipes() and not item:getTeachedRecipes():isEmpty() then
      category = "LitR";
    elseif item:getStressChange() ~= 0 or item:getBoredomChange() ~= 0 or item:getUnhappyChange() ~= 0 then
      category = "LitE";
    else
      category = "LitW";
    end

  elseif item:getTypeString() == "Weapon" then
    if item:getDisplayCategory() == "Explosives" or item:getDisplayCategory() == "Devices" then
      category = "WepBomb";
    end
  
  -- Tsar's True Music Cassette and Vinyls
  elseif string.find(item:getFullName(), "Tsarcraft.Cassette") or string.find(item:getFullName(), "Tsarcraft.Vinyl") then
    category = "MediaA";

  -- Tsar's True Actions Dance Cards
  elseif item:getTypeString() == "Normal" and item:getModuleName() == "TAD" then
    category = "Misc";
  end

  if string.len(category) > 0 then
    TweakItem(item:getFullName(),"DisplayCategory",category);
  end
end

function UnknownsModifications.CategorizeAllItems()
  local items = getAllItems();

  -- Loop all items
	for i = 0, items:size() - 1, 1 do
		local item = items:get(i);

    local hasManualCategory = false
    if (TweakItemData[item:getFullName()]) then
      hasManualCategory = TweakItemData[item:getFullName()]["DisplayCategory"] or TweakItemData[item:getFullName()]["displaycategory"]
    end

    -- Try autocategorize item only if it's not already manually categorized
    if not hasManualCategory then
      UnknownsModifications.CategorizeItem(item);
    end
  end
end


function UnknownsModifications.OnGameBoot()
  print("--- UnknownsModifications Start ---");
  UnknownsModifications.CategorizeAllItems();
  ItemTweaker.tweakItems();
  print("--- UnknownsModifications End ---");
end

Events.OnGameBoot.Add(UnknownsModifications.OnGameBoot)

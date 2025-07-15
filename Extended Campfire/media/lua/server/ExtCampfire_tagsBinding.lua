require "recipecode";

local function addExistingItemType(scriptItems, type)
	local all = getScriptManager():getItemsByType(type)
	for i=1,all:size() do
		local scriptItem = all:get(i-1)
		if not scriptItems:contains(scriptItem) then
			scriptItems:add(scriptItem)
		end
	end
end

function Recipe.GetItemTypes.ChopTree(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("ChopTree"))
	addExistingItemType(scriptItems, "HandAxe")
	addExistingItemType(scriptItems, "AxeStone")
	addExistingItemType(scriptItems, "Axe")
	addExistingItemType(scriptItems, "WoodAxe")
end
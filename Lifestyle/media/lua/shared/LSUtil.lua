--------------------------------------------------------------------------------------------------
--		----	  |			  |			|		 |				|    --    |      ----			--
--		----	  |			  |			|		 |				|    --	   |      ----			--
--		----	  |		-------	   -----|	 ---------		-----          -      ----	   -------
--		----	  |			---			|		 -----		------        --      ----			--
--		----	  |			---			|		 -----		-------	 	 ---      ----			--
--		----	  |		-------	   ----------	 -----		-------		 ---      ----	   -------
--			|	  |		-------			|		 -----		-------		 ---		  |			--
--			|	  |		-------			|	 	 -----		-------		 ---		  |			--
--------------------------------------------------------------------------------------------------

LSUtil = {}

local function getLitterChanceRoll(sandboxOption)
	local roll = 200
	if (not sandboxOption) or (not tonumber(sandboxOption)) then print("WARNING: getLitterChanceRoll failed to get sandboxOption value"); return roll; end
	if sandboxOption == 1 then
		roll = 600
	elseif sandboxOption == 2 then
		roll = 400
	elseif sandboxOption == 4 then
		roll = 100
	end
	return roll
end

function LSUtil.canLitter(chance)
	if chance <= 0 then return false; end
	local maxRoll = getLitterChanceRoll(SandboxVars.LSHygiene.CleaningLitterChance)
	local doRoll = ZombRand(maxRoll)+1
	if doRoll <= chance then return true; end
	return false
end
--[[
local function findItemsLoot(thisPlayer, ItemName)

	local Item
	local containerList = ArrayList.new();
	local playerNum = thisPlayer and thisPlayer:getPlayerNum() or -1
    for i,v in ipairs(getPlayerInventory(playerNum).inventoryPane.inventoryPage.backpacks) do
		containerList:add(v.inventory);
    end
    for i,v in ipairs(getPlayerLoot(playerNum).inventoryPane.inventoryPage.backpacks) do
		containerList:add(v.inventory);
    end

	for i=0,containerList:size()-1 do
		local container = containerList:get(i);
		for x=0,container:getItems():size() - 1 do
			local v = container:getItems():get(x);
			if not Item and (v:getType() == ItemName) then
				Item = v
				break
			end
		end
	end

	return Item

end

function LSUtil.findItems(thisPlayer, itemNameList)

    local inventory = thisPlayer:getInventory();
	local it = inventory:getItems();
	local item

	for j = 0, it:size()-1 do
		item = it:get(j);
		for k, v in pairs(itemNameList) do
			if (not v.id) and (v.name == item:getType()) then
				v.id = item
				break
			end
		end
	end

	for k, v in pairs(itemNameList) do
		if not v.id then
			v.id = findItemsLoot(thisPlayer, v.name)
		end
	end

	return itemNameList

end
]]--
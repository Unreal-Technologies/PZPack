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

EaselCanvasContextMenu = {};

local function getPaintItemsLoot(thisPlayer, ItemName)

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

local function getPaintItems(thisPlayer)

	local it = thisPlayer:getInventory():getItems()
	local itemNameList = {{id=false,name="oldPaintBrush"}, {id=false,name="paintPalette"}}
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
			v.id = getPaintItemsLoot(thisPlayer, v.name)
		end
	end

	return itemNameList[1].id, itemNameList[2].id
end

local function canPaint(thisPlayer, Easel)
	if thisPlayer:getVehicle() or thisPlayer:hasTimedActions() or thisPlayer:getModData().IsSittingOnSeat or
	thisPlayer:isSitOnGround() then return false; end
	if Easel:getModData().stage and (Easel:getModData().stage >= 4) then return false; end
	if Easel:getModData().author and (Easel:getModData().author ~= (thisPlayer:getDescriptor():getForename().." "..thisPlayer:getDescriptor():getSurname())) then return false; end

	return true
end

local function getPaintingProgress(Progress, Painting)
	local val = 0
	local rgbColor = " <RGB:1,0,0>"

	if Painting and Progress and (Progress > 0) then
		val = 100 - (math.floor(Progress/(Painting.duration/100)))
	end
	if (val > 30) and (val < 60) then
		rgbColor = " <RGB:1,1,0>"
	elseif val > 60 then
		rgbColor = " <RGB:0,1,0>"
	end
	return rgbColor, val
end

local function getNewTooltip(description)
	local tooltip = ISToolTip:new();
	tooltip:initialise();
	tooltip:setVisible(false);
	tooltip.description = description
	return tooltip
end

local function doPaintOption(context, worldobjects, Easel, thisPlayer, spriteName, paintItems)

	local paintOption = context:addOptionOnTop(getText("ContextMenu_Painting_Paint"),
	worldobjects,
	EaselCanvasContextMenu.onPaintAction,
	thisPlayer,
	Easel,
	spriteName,
	paintItems)

	local progressRGB, progressVal = getPaintingProgress(Easel:getModData().progress, Easel:getModData().painting)
	paintOption.toolTip = getNewTooltip(getText("Tooltip_Painting_Progress") .. progressRGB .. progressVal .. " <RGB:1,1,1>" .. getText(" / 100 %"))
	paintOption.iconTexture = getTexture('media/ui/artpalette_icon.png')

end

local function doGetPaintOption(context, worldobjects, Easel, thisPlayer, spriteName)

	local getPaintingOption = context:addOptionOnTop(getText("ContextMenu_Painting_GetPainting"),
	worldobjects,
	EaselCanvasContextMenu.onRemoveCanvas,
	thisPlayer,
	Easel,
	spriteName,
	true)

end

EaselCanvasContextMenu.doBuildMenu = function(player, context, worldobjects, Easel, spriteName, customName, groupName, DebugBuildOption)
 
    local thisPlayer = getSpecificPlayer(player)

	if not thisPlayer then return; end
    if thisPlayer:getVehicle() then return; end
	
	if not Easel then return; end

	local removeCanvasOption = context:addOptionOnTop(getText("ContextMenu_Painting_RemoveCanvas"),
	worldobjects,
	EaselCanvasContextMenu.onRemoveCanvas,
	thisPlayer,
	Easel,
	spriteName,
	false)
	removeCanvasOption.toolTip = getNewTooltip("<RGB:1,0,0>"..getText("Tooltip_Painting_Discard"))

	if Easel:getModData().stage and (Easel:getModData().stage >= 4) then doGetPaintOption(context, worldobjects, Easel, thisPlayer, spriteName);
	elseif canPaint(thisPlayer, Easel) then
		local paintItems = {}
		paintItems.brush, paintItems.palette = getPaintItems(thisPlayer)
		if paintItems and paintItems.brush and paintItems.palette then doPaintOption(context, worldobjects, Easel, thisPlayer, spriteName, paintItems); end
	end

end

EaselCanvasContextMenu.walkToFront = function(thisPlayer, thisObject)

	local frontSquare = nil
	local controllerSquare = nil
	local spriteName = thisObject:getSprite():getName()
	if not spriteName then
		return false
	end

	local properties = thisObject:getSprite():getProperties()
	
	local facing = nil
	if properties:Is("Facing") then
		facing = properties:Val("Facing")
	else
		return
	end
	
	if facing == "S" then
		frontSquare = thisObject:getSquare():getS()
	elseif facing == "E" then
		frontSquare = thisObject:getSquare():getE()
	elseif facing == "W" then
		frontSquare = thisObject:getSquare():getW()
	elseif facing == "N" then
		frontSquare = thisObject:getSquare():getN()
	end
	
	if not frontSquare then
		return false
	end
	
	if not controllerSquare then
		controllerSquare = thisObject:getSquare()
	end

	if AdjacentFreeTileFinder.privTrySquare(controllerSquare, frontSquare) then
		ISTimedActionQueue.add(ISWalkToTimedAction:new(thisPlayer, frontSquare))
		return true
	end
	return false
end

local function getNewSpriteName(spriteName)
	if (spriteName == "LS_Painting_2") or (spriteName == "LS_Painting_26") or (spriteName == "LS_Painting_50") then return "LS_Painting_0"; end
	if (spriteName == "LS_Painting_3") or (spriteName == "LS_Painting_27") or (spriteName == "LS_Painting_51") then return "LS_Painting_1"; end
	return false
end

EaselCanvasContextMenu.onRemoveCanvas = function(worldobjects, player, Easel, spriteName, getPainting)
	if EaselCanvasContextMenu.walkToFront(player, Easel) then
		local newEasel = getNewSpriteName(spriteName)
		if not newEasel then return; end
		ISTimedActionQueue.add(LSCanvasAction:new(player, Easel, newEasel, getPainting))
	end
end

local function getEaselFacing(easel)
	local facing
	local properties = easel:getSprite():getProperties()
	if properties:Is("Facing") then
		facing = properties:Val("Facing")
	end
	return facing
end

local function getPaintingsTable(character, artLevel, facing, size)
	local t = require("Painting/PaintingLibrary"..facing)
	local newTable = {}
	for k, v in ipairs(t) do
		if (v.level <= artLevel) and (v.level+3 > artLevel) and (v.size == size) then
			table.insert(newTable, v)
		end
	end
	return newTable
end

local function getCanvasSize(spriteName)
	if (spriteName == "LS_Painting_50") or (spriteName == "LS_Painting_51") then return "large"; end
	if (spriteName == "LS_Painting_2") or (spriteName == "LS_Painting_3") then return "medium"; end
	if (spriteName == "LS_Painting_26") or (spriteName == "LS_Painting_27") then return "small"; end
	return false
end

local function getNewPaintingDuration(characterLevel, paintingLevel, size)
	local sizeMult = 1
	if size == "medium" then sizeMult = 6; elseif size == "large" then sizeMult = 12; end
	return (((10000*sizeMult)+(characterLevel*1000*(sizeMult/2)))-(paintingLevel*6000))
end

local function getNewPainting(character, easel, spriteName)
	local newPainting
	--local paintingLib = getPaintingsTable(character, character:getPerkLevel(Perks.Art))
	local facing = getEaselFacing(easel)
	local size = getCanvasSize(spriteName)
	local paintingLib = getPaintingsTable(character, 0, facing, size)----------------------CHANGE0TOPERK
	newPainting = paintingLib[ZombRand(#paintingLib)+1]
	newPainting.duration = getNewPaintingDuration(0, newPainting.level, size)-----------------------CHANGE0TOPERK
	return newPainting, 0, newPainting.duration, character:getDescriptor():getForename().." "..character:getDescriptor():getSurname()
end

local function doTransferItem(player, itemA)

	local Cont = false

	if instanceof(itemA, "InventoryItem") then
		if luautils.haveToBeTransfered(player, itemA) then
			Cont = itemA:getContainer()
			ISTimedActionQueue.add(ISInventoryTransferAction:new(player, itemA, itemA:getContainer(), player:getInventory()))
		end
	elseif instanceof(itemA, "ArrayList") then
		local items = itemA
		for i=1,items:size() do
			local item = items:get(i-1)
			if luautils.haveToBeTransfered(player, item) then
				Cont = item:getContainer()
				ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, item:getContainer(), player:getInventory()))
			end
		end
	end

	return Cont
end

EaselCanvasContextMenu.onPaintAction = function(worldobjects, player, Easel, spriteName, paintItems)
	if EaselCanvasContextMenu.walkToFront(player, Easel) then
		if not Easel:getModData().painting then
			Easel:getModData().painting, Easel:getModData().stage, Easel:getModData().progress, Easel:getModData().author = getNewPainting(player, Easel, spriteName)
			if isClient() then Easel:transmitModData(); end
		end
		paintItems.brushCont = doTransferItem(player, paintItems.brush)
		paintItems.paletteCont = doTransferItem(player, paintItems.palette)
		ISTimedActionQueue.add(LSCanvasPaintingAction:new(player, Easel, Easel:getModData().painting, Easel:getModData().progress, paintItems))
	end
end
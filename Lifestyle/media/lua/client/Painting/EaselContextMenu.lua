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

EaselContextMenu = {};

local function getNewTooltip(description)
	local tooltip = ISToolTip:new();
	tooltip:initialise();
	tooltip:setVisible(false);
	tooltip.description = description
	return tooltip
end

EaselContextMenu.doBuildMenu = function(player, context, worldobjects, Easel, spriteName, customName, groupName, DebugBuildOption)
 
    local thisPlayer = getSpecificPlayer(player)

	if not thisPlayer then return; end
    if thisPlayer:getVehicle() then return; end
	
	if not Easel then return; end

	local buildOption = context:addOptionOnTop(getText("ContextMenu_Painting_AddCanvas"));
	buildOption.iconTexture = getTexture('media/ui/artpalette_icon.png')
	local subMenu = ISContextMenu:getNew(context);
	context:addSubMenu(buildOption, subMenu)

	local addCanvasSmallOption = subMenu:addOption(getText("ContextMenu_Painting_AddCanvas_Small"),
	worldobjects,
	EaselContextMenu.onAddCanvas,
	thisPlayer,
	Easel,
	spriteName,
	"small")
	addCanvasSmallOption.toolTip = getNewTooltip(getText("Tooltip_Painting_Small"))

	local addCanvasMediumOption = subMenu:addOption(getText("ContextMenu_Painting_AddCanvas_Medium"),
	worldobjects,
	EaselContextMenu.onAddCanvas,
	thisPlayer,
	Easel,
	spriteName,
	"medium")
	addCanvasMediumOption.toolTip = getNewTooltip(getText("Tooltip_Painting_Medium"))

	local addCanvasLargeOption = subMenu:addOption(getText("ContextMenu_Painting_AddCanvas_Large"),
	worldobjects,
	EaselContextMenu.onAddCanvas,
	thisPlayer,
	Easel,
	spriteName,
	"large")
	addCanvasLargeOption.toolTip = getNewTooltip(getText("Tooltip_Painting_Large"))

end

EaselContextMenu.walkToFront = function(thisPlayer, thisObject)

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

local function getNewSpriteName(spriteName, size)
	if (spriteName == "LS_Painting_0") and (size == "large") then return "LS_Painting_50"; end
	if (spriteName == "LS_Painting_0") and (size == "medium") then return "LS_Painting_2"; end
	if (spriteName == "LS_Painting_0") and (size == "small") then return "LS_Painting_26"; end
	if (spriteName == "LS_Painting_1") and (size == "large") then return "LS_Painting_51"; end
	if (spriteName == "LS_Painting_1") and (size == "medium") then return "LS_Painting_3"; end
	if (spriteName == "LS_Painting_1") and (size == "small") then return "LS_Painting_27"; end
	return false
end

EaselContextMenu.onAddCanvas = function(worldobjects, player, Easel, spriteName, size)
	if EaselContextMenu.walkToFront(player, Easel) then
		local newEasel = getNewSpriteName(spriteName, size)
		if not newEasel then return; end
		ISTimedActionQueue.add(LSCanvasAction:new(player, Easel, newEasel, false))
	end
end

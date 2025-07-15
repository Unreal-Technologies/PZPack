--***********************************************************
--**                    ROBERT JOHNSON                     **
--**          Contextual menu with all our painting        **
--***********************************************************
--[[3д предметы во время действия
	* Покраска +
	* Штукатурка+
	* Обои+
	* Сайдинг +
	* Плитка+
	* Морилка +
	* Снятие сайдинга +
	* Снятие плитки +]]


ISPaintMenu = {};

local PaintMenuItems = {
    { paint = "PaintBlue",          text = "ContextMenu_Blue",          color = { 0.35,0.35,0.80 } },
    { paint = "PaintGreen",         text = "ContextMenu_Green",         color = { 0.41,0.80,0.41 } },
    { paint = "PaintLightBrown",    text = "ContextMenu_Light_Brown",   color = { 0.59,0.44,0.21 } },
    { paint = "PaintLightBlue",     text = "ContextMenu_Light_Blue",    color = { 0.65,0.69,0.78 } },
    { paint = "PaintBrown",         text = "ContextMenu_Brown",         color = { 0.45,0.23,0.11 } },
    { paint = "PaintOrange",        text = "ContextMenu_Orange",        color = { 0.79,0.44,0.19 } },
    { paint = "PaintCyan",          text = "ContextMenu_Cyan",          color = { 0.50,0.80,0.80 } },
    { paint = "PaintPink",          text = "ContextMenu_Pink",          color = { 0.81,0.60,0.60 } },
    { paint = "PaintGrey",          text = "ContextMenu_Grey",          color = { 0.50,0.50,0.50 } },
    { paint = "PaintTurquoise",     text = "ContextMenu_Turquoise",     color = { 0.49,0.70,0.80 } },
    { paint = "PaintPurple",        text = "ContextMenu_Purple",        color = { 0.61,0.40,0.63 } },
    { paint = "PaintYellow",        text = "ContextMenu_Yellow",        color = { 0.84,0.78,0.30 } },
    { paint = "PaintWhite",         text = "ContextMenu_White",         color = { 0.92,0.92,0.92 } },
    { paint = "PaintRed",           text = "ContextMenu_Red",           color = { 0.63,0.10,0.10 } },
    { paint = "PaintBlack",         text = "ContextMenu_Black",         color = { 0.20,0.20,0.20 } },
	{ paint = "PaintMagenta",       text = "ContextMenu_Magenta",       color = { 0.53,0.22,0.34 } },
    { paint = "PaintDustBlue",      text = "ContextMenu_DustBlue",      color = { 0.59,0.61,0.66 } },
    { paint = "PaintDustGreen",     text = "ContextMenu_DustGreen",     color = { 0.49,0.60,0.54 } },
	{ paint = "PaintCamoGreen",     text = "ContextMenu_CamoGreen",     color = { 0.31,0.38,0.24 } },
	{ paint = "PaintIvory",       	text = "ContextMenu_Ivory",       	color = { 0.89,0.84,0.75 } },
    { paint = "PaintMidBlue",       text = "ContextMenu_MidBlue",      	color = { 0.51,0.65,0.87 } },
    { paint = "PaintMidGreen",      text = "ContextMenu_MidGreen",    	color = { 0.67,0.81,0.69 } },
    { paint = "PaintLightOrange",   text = "ContextMenu_LightOrange",   color = { 0.95,0.76,0.46 } },
	{ paint = "PaintWine",          text = "ContextMenu_Wine",       	color = { 0.52,0.25,0.38 } },
    { paint = "PaintLightYellow",   text = "ContextMenu_LightYellow",   color = { 0.91,0.90,0.76 } },
	{ paint = "PaintBeige",   		text = "ContextMenu_Beige",   		color = { 0.86,0.84,0.70 } },
    { paint = "PaintViolet",     	text = "ContextMenu_Violet",     	color = { 0.56,0.49,0.67 } },
	{ paint = "PaintPeach",     	text = "ContextMenu_Peach",     	color = { 0.89,0.56,0.51 } },
	{ paint = "PaintDarkGrey",      text = "ContextMenu_DarkGrey",      color = { 0.53,0.49,0.47 } },
    { paint = "PaintDustOrange",    text = "ContextMenu_DustOrange",    color = { 0.84,0.60,0.39 } },
    { paint = "PaintLime",     		text = "ContextMenu_Lime",     		color = { 0.60,0.62,0.42 } },
}
local wPaintMenuItems = {	
	{ paint = "BlueStripes",         text = "ContextMenu_BlueStripes",    		color = { 0.55,0.55,0.87 } },
    { paint = "YellowStripes",       text = "ContextMenu_YellowStripes",  		color = { 0.84,0.78,0.30 } },	
	{ paint = "YellowPinkStripes",   text = "ContextMenu_YellowPinkStripes",  	color = { 0.84,0.78,0.30 } },	
    { paint = "LilacStripes",        text = "ContextMenu_LilacStripes",  		color = { 0.84,0.78,0.30 } },	
	{ paint = "LightGreenOrnament",  text = "ContextMenu_LightGreenOrnament", 	color = { 0.41,0.80,0.41 } },
	{ paint = "GreenFlowers",  		 text = "ContextMenu_GreenFlowers", 		color = { 0.41,0.80,0.41 } },
	{ paint = "PinkFlowers",  		 text = "ContextMenu_PinkFlowers", 			color = { 0.81,0.60,0.60 } },
	{ paint = "BWFlowers",  		 text = "ContextMenu_BWFlowers", 			color = { 0.92,0.92,0.92 } },
	{ paint = "BlueDots",  		 	 text = "ContextMenu_BlueDots", 			color = { 0.35,0.35,0.80 } },
	{ paint = "RedScales",  		 text = "ContextMenu_RedScales", 			color = { 0.52,0.25,0.38 } },
	{ paint = "BlueOrnament",  		 text = "ContextMenu_BlueOrnament", 		color = { 0.35,0.35,0.80 } },
	{ paint = "GreenOrnament",  	 text = "ContextMenu_GreenOrnament", 		color = { 0.41,0.80,0.41 } },
	{ paint = "RedOrnament",  		 text = "ContextMenu_RedOrnament", 			color = { 0.63,0.10,0.10 } },
	{ paint = "FlowersOnWhite",  	 text = "ContextMenu_FlowersOnWhite", 		color = { 0.89,0.84,0.75 } },
	{ paint = "GreenGeometry",  	 text = "ContextMenu_GreenGeometry", 		color = { 0.31,0.38,0.24 } },
	{ paint = "OrangeFlowers",  	 text = "ContextMenu_OrangeFlowers", 		color = { 0.79,0.44,0.19 } },
	{ paint = "GreeneryWP",  	 	 text = "ContextMenu_GreeneryWP", 			color = { 0.41,0.80,0.41 } },
	{ paint = "GoldenStripes",  	 text = "ContextMenu_GoldenStripes", 		color = { 0.31,0.38,0.24 } },
	{ paint = "PeachOrnament",  	 text = "ContextMenu_PeachOrnament", 		color = { 0.89,0.56,0.51 } },
	}
	
local SidingMenuItems = {	
	{ paint = "PaintBlue",          text = "ContextMenu_Blue",          color = { 0.35,0.35,0.80 } },
    { paint = "PaintGreen",         text = "ContextMenu_Green",         color = { 0.41,0.80,0.41 } },
    { paint = "PaintLightBrown",    text = "ContextMenu_Light_Brown",   color = { 0.59,0.44,0.21 } },
    { paint = "PaintLightBlue",     text = "ContextMenu_Light_Blue",    color = { 0.65,0.69,0.78 } },
    { paint = "PaintBrown",         text = "ContextMenu_Brown",         color = { 0.45,0.23,0.11 } },
    { paint = "PaintOrange",        text = "ContextMenu_Orange",        color = { 0.79,0.44,0.19 } },
    { paint = "PaintCyan",          text = "ContextMenu_Cyan",          color = { 0.50,0.80,0.80 } },
    { paint = "PaintPink",          text = "ContextMenu_Pink",          color = { 0.81,0.60,0.60 } },
    { paint = "PaintGrey",          text = "ContextMenu_Grey",          color = { 0.50,0.50,0.50 } },
    { paint = "PaintTurquoise",     text = "ContextMenu_Turquoise",     color = { 0.49,0.70,0.80 } },
    { paint = "PaintPurple",        text = "ContextMenu_Purple",        color = { 0.61,0.40,0.63 } },
    { paint = "PaintYellow",        text = "ContextMenu_Yellow",        color = { 0.84,0.78,0.30 } },
    { paint = "PaintWhite",         text = "ContextMenu_White",         color = { 0.92,0.92,0.92 } },
    { paint = "PaintRed",           text = "ContextMenu_Red",           color = { 0.63,0.10,0.10 } },
    { paint = "PaintBlack",         text = "ContextMenu_Black",         color = { 0.20,0.20,0.20 } },
	
	{ paint = "PaintMagenta",       text = "ContextMenu_Magenta",       color = { 0.53,0.22,0.34 } },
    { paint = "PaintDustBlue",      text = "ContextMenu_DustBlue",      color = { 0.59,0.61,0.66 } },
    { paint = "PaintDustGreen",     text = "ContextMenu_DustGreen",     color = { 0.49,0.60,0.54 } },
	{ paint = "PaintCamoGreen",     text = "ContextMenu_CamoGreen",     color = { 0.31,0.38,0.24 } },
	
	{ paint = "PaintIvory",       	text = "ContextMenu_Ivory",       	color = { 0.89,0.84,0.75 } },
    { paint = "PaintMidBlue",       text = "ContextMenu_MidBlue",      	color = { 0.51,0.65,0.87 } },
    { paint = "PaintMidGreen",      text = "ContextMenu_MidGreen",    	color = { 0.67,0.81,0.69 } },

    { paint = "PaintLightOrange",   text = "ContextMenu_LightOrange",   color = { 0.95,0.76,0.46 } },
	{ paint = "PaintWine",          text = "ContextMenu_Wine",       	color = { 0.52,0.25,0.38 } },
    { paint = "PaintLightYellow",   text = "ContextMenu_LightYellow",   color = { 0.91,0.90,0.76 } },
	{ paint = "PaintBeige",   		text = "ContextMenu_Beige",   		color = { 0.86,0.84,0.70 } },
	
    { paint = "PaintViolet",     	text = "ContextMenu_Violet",     	color = { 0.56,0.49,0.67 } },
	{ paint = "PaintPeach",     	text = "ContextMenu_Peach",     	color = { 0.89,0.56,0.51 } },
	{ paint = "PaintDarkGrey",      text = "ContextMenu_DarkGrey",      color = { 0.53,0.49,0.47 } },
    { paint = "PaintDustOrange",    text = "ContextMenu_DustOrange",    color = { 0.84,0.60,0.39 } },
    { paint = "PaintLime",     		text = "ContextMenu_Lime",     		color = { 0.60,0.62,0.42 } },	
	}
local WoodStainMenuItems = {	
	{ paint = "WoodStainRChestnut",  text = "ContextMenu_RChestnut",        color = { 0.45,0.23,0.11 } },
	{ paint = "WoodStainROak",       text = "ContextMenu_ROak",         	color = { 0.45,0.23,0.11 } },
	{ paint = "WoodStainDWallnut",   text = "ContextMenu_DWallnut",    		color = { 0.45,0.23,0.11 } },
    { paint = "WoodStainJacobean",   text = "ContextMenu_Jacobean",       	color = { 0.45,0.23,0.11 } },	
    { paint = "WoodStainWOak",       text = "ContextMenu_WOak",          	color = { 0.45,0.23,0.11 } },	
    { paint = "WoodStainGOak",       text = "ContextMenu_GOak",        		color = { 0.45,0.23,0.11 } },	
	}
local TileMenuItems = {	

	{ paint = "WhiteBlueTile",  	text = "ContextMenu_WhiteBlue",        	color = { 0.65,0.69,0.78 } },
	{ paint = "WhiteTile",       	text = "ContextMenu_White",         	color = { 0.92,0.92,0.92 } },
	{ paint = "WhiteNarrowTile",    text = "ContextMenu_WhiteNarrow",       color = { 0.92,0.92,0.92 } },
	
	{ paint = "PinkTile",          	text = "ContextMenu_Pink",          	color = { 0.81,0.60,0.60 } },
	{ paint = "GreenTile",			text = "ContextMenu_Green",         	color = { 0.41,0.80,0.41 } },
	{ paint = "YellowTile",			text = "ContextMenu_Yellow",        	color = { 0.84,0.78,0.30 } },
	{ paint = "GreyTile",			text = "ContextMenu_Grey",          	color = { 0.50,0.50,0.50 } },
	{ paint = "BlueTile",    		text = "ContextMenu_Light_Blue",    	color = { 0.65,0.69,0.78 } },

	{ paint = "GreenWhiteTile",		text = "ContextMenu_GreenWhite",        color = { 0.41,0.80,0.41 } },
	{ paint = "RedWhiteTile",		text = "ContextMenu_RedWhite",          color = { 0.81,0.60,0.60 } },
	{ paint = "BlackWhiteTile", 	text = "ContextMenu_BlackWhite",        color = { 0.50,0.50,0.50 } },
	{ paint = "BlueWhiteTile",  	text = "ContextMenu_BlueWhite",        	color = { 0.65,0.69,0.78 } },	
	{ paint = "WhiteBlockTile",     text = "ContextMenu_WhiteBlock",        color = { 0.92,0.92,0.92 } },

	{ paint = "WhiteStoneTile",     text = "ContextMenu_WhiteStone",        color = { 0.92,0.92,0.92 } },
	{ paint = "YellowStoneTile",    text = "ContextMenu_YellowStone",       color = { 0.92,0.92,0.92 } },
	
	{ paint = "RedStoneTile",		text = "ContextMenu_RedStone",  		color = { 0.81,0.60,0.60 } },
	{ paint = "GreenStoneTile",     text = "ContextMenu_GreenStone",    	color = { 0.31,0.38,0.24 } },
    { paint = "BrownStoneTile",    	text = "ContextMenu_BrownStone",   		color = { 0.59,0.44,0.21 } },

	{ paint = "ClassicRedBricks",	text = "ContextMenu_ClassicRedBricks",  color = { 0.81,0.60,0.60 } },	
	
	}

ISPaintMenu.doPaintMenu = function(player, context, worldobjects, test)

	if test and ISWorldObjectContextMenu.Test then return true end

	local playerObj = getSpecificPlayer(player)

	local playerInv = playerObj:getInventory()
 
	-- типы стен
	local thump = nil;
	local square = nil;
    local paintableWall = nil;
    local paintableItem = nil;
	local plasterableWall = nil;
	local removeSidingWall = nil;
	local applySidingWall = nil;
	local woodenWall = nil;	
	local toTileWall = nil;
	local NewPaintWall = nil;
	local removeTilesWall = nil;
	
	-- инструменты
	local wallpaperGlue = playerInv:getFirstTypeRecurse("WallpaperGlue");
	local paintBrush = playerInv:getFirstTypeRecurse("Paintbrush");
	local handShovel = playerInv:getFirstTypeRecurse("HandShovel");
	local sidingRemover = playerInv:containsTypeRecurse("Hammer") or playerInv:containsTypeRecurse("Crowbar");
	local tilesRemover = playerInv:containsTypeRecurse("Hammer") or playerInv:containsTypeRecurse("BallPeenHammer") or playerInv:containsTypeRecurse("ClubHammer");
	local plaster = playerInv:containsTypeRecurse("BucketPlasterFull");
	local woodenMallet = playerInv:containsTypeRecurse("WoodenMallet");
	
	-- we get the thumpable item (like wall/door/furniture etc.) if exist on the tile we right clicked
	for i,v in ipairs(worldobjects) do
		square = v:getSquare();
        local props = v:getProperties()
		local wallType = props:Val("PaintingType")
		local name = v:getSprite():getName()
        if props and props:Is("IsPaintable") then
            paintableItem = v;
        end
		if instanceof(v, "IsoThumpable") then
			thump = v;
        end
        if props and (props:Is("WallN") or props:Is("WallW") or
                props:Is("DoorWallN") or props:Is("DoorWallW")) then
            paintableWall = v;
        end
		-- стены можно покрыть штукатуркой
		if paintableItem or (name and (_BricksData[name] or _WoodData[name] or _BlocksData[name] or _plasterData[name]))  then
            plasterableWall = v;
        end
		-- Снять сайдинг
		if name and _SidingData[name] then
            removeSidingWall = v;
        end
		-- Покрыть сайдингом
		if name and (_BricksData[name] or _WoodData[name] or _BlocksData[name] or _plasterData[name] or paintableItem) then
            applySidingWall = v;
        end
		-- Покрыть морилкой
		if name and _WoodData[name] then
            woodenWall = v;
        end
		-- Покрыть плиткой
		if name and _plasterData[name] then
            toTileWall = v;
        end
		-- Новое окрашивание
		if paintableItem or (name and _plasterData[name] or _BlocksData[name] or _BricksData[name] or _SidingData[name]) then
            NewPaintWall = v;
        end
		-- Убрать плитку
		if name and _TilesData[name] then
            removeTilesWall = v;
        end
    end

    local joypad = JoypadState.players[player+1] or false

    -- if the item can be plastered
    if (joypad or (thump and thump:canBePlastered())) and ((playerObj:getPerkLevel(Perks.Woodwork) >= 4 and playerInv:containsTypeRecurse("BucketPlasterFull")) or ISBuildMenu.cheat) then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption(getText("ContextMenu_Plaster"), worldobjects, ISPaintMenu.onPlaster, player, thump, square);
	end

    -- paint various sign
    if (paintableWall or joypad) and (ISBuildMenu.cheat or paintBrush) then
		if test then return ISWorldObjectContextMenu.setTest() end
        local paintOption = context:addOption(getText("ContextMenu_PaintSign"), worldobjects, nil);
        local subMenuPaint = ISContextMenu:getNew(context);
        -- we add our new menu to the option we want (here paint)
        context:addSubMenu(paintOption, subMenuPaint);
        ISPaintMenu.player = player
        for _,pme in ipairs(PaintMenuItems) do
            if ISBuildMenu.cheat or playerInv:containsTypeRecurse(pme.paint) then
                ISPaintMenu.addSignOption(subMenuPaint, getText(pme.text), paintableWall, pme.paint, pme.color[1], pme.color[2], pme.color[3]);
            end
        end
        if subMenuPaint:isEmpty() then
            context:removeLastOption()
        end
    end

	-- New Paint function
	if (joypad or NewPaintWall) and (paintBrush or ISBuildMenu.cheat) then
		local NewPaintOption = context:addOption(getText("ContextMenu_NewPaint"), worldobjects, nil)
		local subMenuNewPaint = ISContextMenu:getNew(context)
		context:addSubMenu(NewPaintOption, subMenuNewPaint)
		for _,pme in ipairs(PaintMenuItems) do
			if ISBuildMenu.cheat or playerInv:containsTypeRecurse(pme.paint) then
				subMenuNewPaint:addOption(getText(pme.text), worldobjects, ISPaintMenu.onPaint, player, NewPaintWall, pme.paint)
			end
		end
		if subMenuNewPaint:isEmpty() then
			context:removeLastOption()
		end	
	end
	
	--Wallpapers
		
	if joypad and (ISBuildMenu.cheat or wallpaperGlue) then
		local wPaintOption = context:addOption(getText("ContextMenu_WPaint"), worldobjects, nil)
		local subMenuWPaint = ISContextMenu:getNew(context)
		context:addSubMenu(wPaintOption, subMenuWPaint)
		for _,pme in ipairs(wPaintMenuItems) do
			if ISBuildMenu.cheat or playerInv:containsTypeRecurse(pme.paint) then
				subMenuWPaint:addOption(getText(pme.text), worldobjects, ISPaintMenu.onWPaint, player, thump, pme.paint)
			end
		end
		if subMenuWPaint:isEmpty() then
			context:removeLastOption()
		end
	
	elseif ((thump and thump:isPaintable()) or paintableItem) and (ISBuildMenu.cheat or wallpaperGlue) then
        local item = thump;
        if paintableItem then item = paintableItem; end
		if test then return ISWorldObjectContextMenu.setTest() end
		local modData = nil;
        if thump then thump:getModData(); end
		local wPaintOption = context:addOption(getText("ContextMenu_WPaint"), worldobjects, nil);
		local subMenuWPaint = ISContextMenu:getNew(context);
		-- we add our new menu to the option we want (here paint)
		context:addSubMenu(wPaintOption, subMenuWPaint);
        local addedMenu = false;
        local wallType = "";
        if paintableItem then
            wallType = paintableItem:getSprite():getProperties():Val("PaintingType");
        end
        for _,pme in ipairs(wPaintMenuItems) do
            if ((modData and WPainting[modData["wallType"]][pme.paint]) or (WPainting[wallType] and WPainting[wallType][pme.paint])) and (ISBuildMenu.cheat or playerInv:containsTypeRecurse(pme.paint)) then
                subMenuWPaint:addOption(getText(pme.text), worldobjects, ISPaintMenu.onWPaint, player, item, pme.paint);
                addedMenu = true;
            end
        end

        if not addedMenu then
            context:removeLastOption();
        end
	end
	
--	New Plaster (can plaster all wooden walls (not siding) and all brick walls)
	if (joypad or plasterableWall) and ((playerObj:getPerkLevel(Perks.Woodwork) >= 4 and handShovel and plaster) or ISBuildMenu.cheat) then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption(getText("ContextMenu_NewPlaster"), worldobjects, ISPaintMenu.onNewPlaster, player, plasterableWall, square);
	end

--	remove siding
	if (joypad or removeSidingWall) and (sidingRemover or ISBuildMenu.cheat) then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption(getText("ContextMenu_RemoveSiding"), worldobjects, ISPaintMenu.onRemoveSiding, player, removeSidingWall, square);
	end
	
--	remove tiles
	if (joypad or removeTilesWall) and (tilesRemover or ISBuildMenu.cheat) then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption(getText("ContextMenu_RemoveTiles"), worldobjects, ISPaintMenu.onRemoveTiles, player, removeTilesWall, square);
	end

	-- Add Siding
	if (joypad or applySidingWall) and (woodenMallet or ISBuildMenu.cheat) then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption(getText("ContextMenu_ApplySiding"), worldobjects, ISPaintMenu.onApplySiding, player, applySidingWall, square);
	end
	
	-- Wood Stain
	if (joypad or woodenWall) and (paintBrush or ISBuildMenu.cheat) then
		local stainOption = context:addOption(getText("ContextMenu_ApplyWoodStain"), worldobjects, nil)
		local subMenuStain = ISContextMenu:getNew(context)
		context:addSubMenu(stainOption, subMenuStain)
		for _,sme in ipairs(WoodStainMenuItems) do
			if ISBuildMenu.cheat or playerInv:containsTypeRecurse(sme.paint) then
				subMenuStain:addOption(getText(sme.text), worldobjects, ISPaintMenu.onApplyWoodStain, player, woodenWall, sme.paint)
			end
		end
		if subMenuStain:isEmpty() then
			context:removeLastOption()
		end	
	end
	
	-- Apply Tiles
	if (joypad or toTileWall) and (handShovel or ISBuildMenu.cheat) then
		local tileOption = context:addOption(getText("ContextMenu_ApplyTiles"), worldobjects, nil)
		local subMenuTile = ISContextMenu:getNew(context)
		context:addSubMenu(tileOption, subMenuTile)
		for _,sme in ipairs(TileMenuItems) do
			if ISBuildMenu.cheat or playerInv:containsTypeRecurse(sme.paint) then
				subMenuTile:addOption(getText(sme.text), worldobjects, ISPaintMenu.onApplyTiles, player, toTileWall, sme.paint)
			end
		end
		if subMenuTile:isEmpty() then
			context:removeLastOption()
		end	
	end

end

ISPaintMenu.addSignOption = function(subMenuPaint, name, wall, painting, r,g,b)
    local blueOption = subMenuPaint:addOption(name, nil, nil);
    local subMenuBlue = ISContextMenu:getNew(subMenuPaint);
    subMenuPaint:addSubMenu(blueOption, subMenuBlue);

    subMenuBlue:addOption(getText("ContextMenu_SignSkull"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 36, r,g,b);
    subMenuBlue:addOption(getText("ContextMenu_SignRightArrow"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 32, r,g,b);
    subMenuBlue:addOption(getText("ContextMenu_SignLeftArrow"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 33, r,g,b);
    subMenuBlue:addOption(getText("ContextMenu_SignDownArrow"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 34, r,g,b);
    subMenuBlue:addOption(getText("ContextMenu_SignUpArrow"), wall, ISPaintMenu.onPaintSign, ISPaintMenu.player, painting, 35, r,g,b);
end

ISPaintMenu.onPaintSign = function(wall, player, painting, sign, r,g,b)
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    if true or JoypadState.players[player+1] then
        local bo = ISPaintCursor:new(playerObj, "paintSign", { paintType=painting, sign=sign, r=r, g=g, b=b })
        getCell():setDrag(bo, bo.player)
        return
    end
    if luautils.walkAdjWall(playerObj, wall:getSquare(), wall:getProperties():Is("WallN")) then
        local paintCan = nil
        if not ISBuildMenu.cheat then
            local paintBrush = playerInv:getFirstTypeRecurse("Paintbrush")
            ISWorldObjectContextMenu.transferIfNeeded(playerObj, paintBrush)
            paintCan = playerInv:getFirstTypeRecurse(painting)
            ISWorldObjectContextMenu.transferIfNeeded(playerObj, paintCan)
        end
        ISTimedActionQueue.add(ISPaintSignAction:new(playerObj, wall, paintCan, sign, r,g,b,100));
    end
end

ISPaintMenu.onPaint = function(worldobjects, player, thumpable, painting)
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    if true or JoypadState.players[player+1] then
        local bo = ISPaintCursor:new(playerObj, "paintThump", { paintType=painting })
        getCell():setDrag(bo, bo.player)
        return
    end
	local name = thumpable:getSprite():getName()
    
	local wallType = props:Val("PaintingType")
    local props = thumpable:getProperties()
    local isWall = props:Is("WallN") or props:Is("WallW") or
        props:Is("DoorWallN") or props:Is("DoorWallW")
    if wallType then
        local north = props:Is("WallN") or props:Is("DoorWallN") or props:Is("WindowN")
        if not luautils.walkAdjWall(playerObj, thumpable:getSquare(), north) then
            return
        end
    else
        if not luautils.walkAdj(playerObj, thumpable:getSquare()) then
            return
        end
    end
    local paintCan = nil
    if not ISBuildMenu.cheat then
        local paintBrush = playerInv:getFirstTypeRecurse("Paintbrush")
        ISWorldObjectContextMenu.transferIfNeeded(playerObj, paintBrush)
        paintCan = playerInv:getFirstTypeRecurse(painting)
        ISWorldObjectContextMenu.transferIfNeeded(playerObj, paintCan)
    end
    ISTimedActionQueue.add(ISPaintAction:new(playerObj, thumpable, paintCan, painting, 100));
end

ISPaintMenu.onPlaster = function(worldobjects, player, thumpable, square)
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    if true or JoypadState.players[player+1] then
        local bo = ISPaintCursor:new(playerObj, "plaster")
        getCell():setDrag(bo, bo.player)
        return
    end
	if luautils.walkAdjWall(playerObj, thumpable:getSquare(), thumpable:getNorth()) then
		local plaster = nil
		if not ISBuildMenu.cheat then
			plaster = playerInv:containsTypeRecurse("BucketPlasterFull")
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, plaster)
		end
		ISTimedActionQueue.add(ISPlasterAction:new(playerObj, thumpable, plaster, 100));
 	end
end
--new plaster
ISPaintMenu.onNewPlaster = function(worldobjects, player, thumpable, square)
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    if true or JoypadState.players[player+1] then
        local bo = ISPaintCursor:new(playerObj, "newPlaster")
        getCell():setDrag(bo, bo.player)
        return
    end
	local props = thumpable:getProperties()
    
	local wallType = props:Val("PaintingType")
	
	local isWall = props:Is("WallN") or props:Is("WallW") or props:Is("WallNW") or props:Is("WallSE") or
        props:Is("DoorWallN") or props:Is("DoorWallW")
	--[[local isWall = paintingType:Is("wall") or paintingType:Is("pillar") or
                paintingType:Is("doorframe") or paintingType:Is("windowsframe")]]
    if wallType then
        local north = props:Is("WallN") or props:Is("DoorWallN") or props:Is("WindowN")
        if not luautils.walkAdjWall(playerObj, thumpable:getSquare(), north) then
            return
        end
    else
        if not luautils.walkAdj(playerObj, thumpable:getSquare()) then
            return
        end
    end
		local plaster = nil
		if not ISBuildMenu.cheat then
			local handShovel = playerInv:getFirstTypeRecurse("HandShovel")
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, handShovel)
			plaster = playerInv:getFirstTypeRecurse("BucketPlasterFull")
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, plaster)
		end
		ISTimedActionQueue.add(NewPlasteringAction:new(playerObj, thumpable, plaster, 100));
 	
end

--wallpapers
ISPaintMenu.onWPaint = function(worldobjects, player, thumpable, painting)
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    if true or JoypadState.players[player+1] then
        local bo = ISPaintCursor:new(playerObj, "wallpaper", { paintType=painting })
        getCell():setDrag(bo, bo.player)
        return
    end
    local props = thumpable:getProperties()
    local isWall = props:Is("WallN") or props:Is("WallW") or
        props:Is("DoorWallN") or props:Is("DoorWallW")
    if isWall then
        local north = props:Is("WallN") or props:Is("DoorWallN")
        if not luautils.walkAdjWall(playerObj, thumpable:getSquare(), north) then
            return
        end
    else
        if not luautils.walkAdj(playerObj, thumpable:getSquare()) then
            return
        end
    end
    local wallpaper = nil
	local wallpaperGlue = nil
    if not ISBuildMenu.cheat then
        wallpaperGlue = playerInv:getFirstTypeRecurse("WallpaperGlue")
        ISWorldObjectContextMenu.transferIfNeeded(playerObj, wallpaperGlue)
        wallpaper = playerInv:getFirstTypeRecurse(painting)
        ISWorldObjectContextMenu.transferIfNeeded(playerObj, wallpaper)
    end
    ISTimedActionQueue.add(ISWPaintAction:new(playerObj, thumpable, wallpaper, wallpaperGlue, painting, 100));
end
-- remove siding
ISPaintMenu.onRemoveSiding = function(worldobjects, player, thumpable, square)
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    if true or JoypadState.players[player+1] then
        local bo = ISPaintCursor:new(playerObj, "removeSiding")
        getCell():setDrag(bo, bo.player)
        return
    end
	local props = thumpable:getProperties()
	local name = thumpable:getSprite():getName()
    
	local wallType = props:Val("PaintingType")
	--[[local isWall = props:Is("WallN") or props:Is("WallW") or props:Is("WallNW") or props:Is("WallSE") or
        props:Is("DoorWallN") or props:Is("DoorWallW")]]
		
    if wallType then
        local north = props:Is("WallN") or props:Is("DoorWallN") or props:Is("WindowN")
        if not luautils.walkAdjWall(playerObj, thumpable:getSquare(), north) then
            return
        end
    else
        if not luautils.walkAdj(playerObj, thumpable:getSquare()) then
            return
        end
    end
		local sidingRemover = nil
		if not ISBuildMenu.cheat then
			sidingRemover =  playerInv:getFirstTypeRecurse("Crowbar") or playerInv:getFirstTypeRecurse("Hammer")
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, sidingRemover)
		end
		ISTimedActionQueue.add(RemoveSidingAction:new(playerObj, thumpable, sidingRemover, 100));
 	
end
-- remove Tiles
ISPaintMenu.onRemoveTiles = function(worldobjects, player, thumpable, square)
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    if true or JoypadState.players[player+1] then
        local bo = ISPaintCursor:new(playerObj, "removeTiles")
        getCell():setDrag(bo, bo.player)
        return
    end
	local props = thumpable:getProperties()
	local name = thumpable:getSprite():getName()
    
	local wallType = props:Val("PaintingType")
	--[[local isWall = props:Is("WallN") or props:Is("WallW") or props:Is("WallNW") or props:Is("WallSE") or
        props:Is("DoorWallN") or props:Is("DoorWallW")]]
		
    if wallType then
        local north = props:Is("WallN") or props:Is("DoorWallN") or props:Is("WindowN")
        if not luautils.walkAdjWall(playerObj, thumpable:getSquare(), north) then
            return
        end
    else
        if not luautils.walkAdj(playerObj, thumpable:getSquare()) then
            return
        end
    end
		local tilesRemover = nil
		if not ISBuildMenu.cheat then
			tilesRemover = playerInv:getFirstTypeRecurse("Hammer") or playerInv:getFirstTypeRecurse("BallPeenHammer") or playerInv:getFirstTypeRecurse("ClubHammer");
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, tilesRemover)
		end
		ISTimedActionQueue.add(RemoveTilesAction:new(playerObj, thumpable, tilesRemover, 150));
 	
end

-- Apply Siding
ISPaintMenu.onApplySiding = function(worldobjects, player, thumpable, painting)
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    if true or JoypadState.players[player+1] then
        local bo = ISPaintCursor:new(playerObj, "applySiding", { paintType=painting })
        getCell():setDrag(bo, bo.player)
        return
    end
	local name = thumpable:getSprite():getName()
    
	local wallType = props:Val("PaintingType")
    local props = thumpable:getProperties()
    local isWall = props:Is("WallN") or props:Is("WallW") or
        props:Is("DoorWallN") or props:Is("DoorWallW")
    if wallType then
        local north = props:Is("WallN") or props:Is("DoorWallN") or props:Is("WindowN")
        if not luautils.walkAdjWall(playerObj, thumpable:getSquare(), north) then
            return
        end
    else
        if not luautils.walkAdj(playerObj, thumpable:getSquare()) then
            return
        end
    end
    local woodenMallet = nil
	local planks = nil
    if not ISBuildMenu.cheat then
        woodenMallet = playerInv:getFirstTypeRecurse("WoodenMallet")
        ISWorldObjectContextMenu.transferIfNeeded(playerObj, woodenMallet)
        planks = playerInv:getFirstTypeRecurse("Base.Plank")
		ISWorldObjectContextMenu.transferIfNeeded(playerObj, planks)
    end
    ISTimedActionQueue.add(ApplySidingAction:new(playerObj, thumpable, planks, 150));
end

-- Wood Stain
ISPaintMenu.onApplyWoodStain = function(worldobjects, player, thumpable, painting)
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    if true or JoypadState.players[player+1] then
        local bo = ISPaintCursor:new(playerObj, "applyWoodStain", { paintType=painting })
        getCell():setDrag(bo, bo.player)
        return
    end
	local name = thumpable:getSprite():getName()
    
	local wallType = props:Val("PaintingType")
    local props = thumpable:getProperties()
    local isWall = props:Is("WallN") or props:Is("WallW") or
        props:Is("DoorWallN") or props:Is("DoorWallW")
    if wallType then
        local north = props:Is("WallN") or props:Is("DoorWallN") or props:Is("WindowN")
        if not luautils.walkAdjWall(playerObj, thumpable:getSquare(), north) then
            return
        end
    else
        if not luautils.walkAdj(playerObj, thumpable:getSquare()) then
            return
        end
    end
	local stainCan = nil
    if not ISBuildMenu.cheat then
        local paintBrush = playerInv:getFirstTypeRecurse("Paintbrush")
        ISWorldObjectContextMenu.transferIfNeeded(playerObj, paintBrush)
        stainCan = playerInv:getFirstTypeRecurse(painting)
        ISWorldObjectContextMenu.transferIfNeeded(playerObj, stainCan)
    end
    ISTimedActionQueue.add(ApplyWoodStainAction:new(playerObj, thumpable, stainCan, painting, 100));
end
-- tiles
ISPaintMenu.onApplyTiles = function(worldobjects, player, thumpable, painting)
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    if true or JoypadState.players[player+1] then
        local bo = ISPaintCursor:new(playerObj, "applyTiles", { paintType=painting })
        getCell():setDrag(bo, bo.player)
        return
    end
	local name = thumpable:getSprite():getName()
    
	local wallType = props:Val("PaintingType")
    local props = thumpable:getProperties()
    local isWall = props:Is("WallN") or props:Is("WallW") or
        props:Is("DoorWallN") or props:Is("DoorWallW")
    if wallType then
        local north = props:Is("WallN") or props:Is("DoorWallN") or props:Is("WindowN")
        if not luautils.walkAdjWall(playerObj, thumpable:getSquare(), north) then
            return
        end
    else
        if not luautils.walkAdj(playerObj, thumpable:getSquare()) then
            return
        end
    end
    
	local tilesPack = nil
    if not ISBuildMenu.cheat then
		local handShovel = playerInv:getFirstTypeRecurse("HandShovel")
        ISWorldObjectContextMenu.transferIfNeeded(playerObj, handShovel)
        tilesPack = playerInv:getFirstTypeRecurse(painting)
        ISWorldObjectContextMenu.transferIfNeeded(playerObj, tilesPack)
    end
    ISTimedActionQueue.add(ApplyTilesAction:new(playerObj, thumpable, tilesPack, painting, 100));
end
Events.OnFillWorldObjectContextMenu.Add(ISPaintMenu.doPaintMenu);

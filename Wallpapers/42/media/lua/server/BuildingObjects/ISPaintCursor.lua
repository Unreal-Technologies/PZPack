--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "BuildingObjects/ISBuildingObject"

ISPaintCursor = ISBuildingObject:derive("ISPaintCursor");

local PaintColor = {
--paint for walls, bricks, blocks
	PaintBlack 		= {r=0.20,g=0.20,b=0.20};
	PaintBlue  		= {r=0.35,g=0.35,b=0.80};
	PaintBrown 		= {r=0.45,g=0.23,b=0.11};
	PaintCyan  		= {r=0.50,g=0.80,b=0.80};
	PaintGreen 		= {r=0.41,g=0.80,b=0.41};
	PaintGrey  		= {r=0.50,g=0.50,b=0.50};
	PaintLightBlue  = {r=0.65,g=0.69,b=0.78};
	PaintLightBrown = {r=0.59,g=0.44,b=0.21};
	PaintOrange		= {r=0.79,g=0.44,b=0.19};
	PaintPink  		= {r=0.81,g=0.60,b=0.60};
	PaintPurple		= {r=0.61,g=0.40,b=0.63};
	PaintRed   		= {r=0.63,g=0.10,b=0.10};
	PaintTurquoise  = {r=0.49,g=0.69,b=0.76};
	PaintWhite 		= {r=0.92,g=0.92,b=0.92};
	PaintYellow 	= {r=0.84,g=0.78,b=0.30};
	PaintMagenta	= {r=0.53,g=0.22,b=0.34};
	PaintDustBlue	= {r=0.59,g=0.61,b=0.66};
	PaintDustGreen  = {r=0.49,g=0.60,b=0.54};
	PaintCamoGreen 	= {r=0.31,g=0.38,b=0.24};
	PaintIvory 		= {r=0.89,g=0.84,b=0.75};
	PaintMidBlue	= {r=0.51,g=0.65,b=0.87};
	PaintMidGreen	= {r=0.67,g=0.81,b=0.69};
	PaintLightOrange	= {r=0.95,g=0.76,b=0.46};
	PaintWine			= {r=0.52,g=0.25,b=0.38};
	PaintLightYellow	= {r=0.91,g=0.90,b=0.76};
	PaintBeige			= {r=0.86,g=0.84,b=0.70};
	PaintViolet			= {r=0.56,g=0.49,b=0.67};
	PaintPeach			= {r=0.89,g=0.56,b=0.51};
	PaintDarkGrey		= {r=0.53,g=0.49,b=0.47};
	PaintDustOrange		= {r=0.84,g=0.60,b=0.39};
	PaintLime			= {r=0.60,g=0.62,b=0.42};
--wallpapers		
	BlueStripes  		= {r=0.55,g=0.55,b=0.87};
	YellowStripes 		= {r=0.84,g=0.78,b=0.30};
	YellowPinkStripes 	= {r=0.59,g=0.44,b=0.21};
	LilacStripes		= {r=0.61,g=0.40,b=0.63};
	LightGreenOrnament  = {r=0.41,g=0.80,b=0.41};
	GreenFlowers  		= {r=0.41,g=0.80,b=0.41};
	PinkFlowers  		= {r=0.81,g=0.60,b=0.60};
	BWFlowers			= {r=0.92,g=0.92,b=0.92};
	BlueDots			= {r=0.55,g=0.55,b=0.87};
	RedScales			= {r=0.52,g=0.25,b=0.38};
	BlueOrnament		= {r=0.55,g=0.55,b=0.87};
	GreenOrnament		= {r=0.41,g=0.80,b=0.41};
	RedOrnament			= {r=0.63,g=0.10,b=0.10};
	FlowersOnWhite		= {r=0.89,g=0.84,b=0.75};
	GreenGeometry		= {r=0.31,g=0.38,b=0.24};
	OrangeFlowers		= {r=0.79,g=0.44,b=0.19};
	GreeneryWP			= {r=0.41,g=0.80,b=0.41};
	GoldenStripes		= {r=0.31,g=0.38,b=0.24};
	PeachOrnament		= {r=0.89,g=0.56,b=0.51};
	-- wood stain
	WoodStainRChestnut 	= {r=0.45,g=0.23,b=0.11};
	WoodStainROak 		= {r=0.45,g=0.23,b=0.11};
	WoodStainDWallnut 	= {r=0.45,g=0.23,b=0.11};
	WoodStainJacobean 	= {r=0.45,g=0.23,b=0.11};
	WoodStainWOak 		= {r=0.45,g=0.23,b=0.11};
	WoodStainGOak 		= {r=0.45,g=0.23,b=0.11};
	-- tiles
	WhiteBlueTile		= {r=0.55,g=0.55,b=0.87};
	WhiteTile 			= {r=0.92,g=0.92,b=0.92};
	WhiteNarrowTile 	= {r=0.92,g=0.92,b=0.92};
	PinkTile	  		= {r=0.81,g=0.60,b=0.60};
	GreenTile			= {r=0.41,g=0.80,b=0.41};
	YellowTile			= {r=0.91,g=0.90,b=0.76};
	GreyTile			= {r=0.50,g=0.50,b=0.50};
	BlueTile			= {r=0.55,g=0.55,b=0.87};
	GreenWhiteTile		= {r=0.41,g=0.80,b=0.41};
	RedWhiteTile		= {r=0.81,g=0.60,b=0.60};
	BlackWhiteTile		= {r=0.50,g=0.50,b=0.50};
	BlueWhiteTile		= {r=0.55,g=0.55,b=0.87};
	WhiteStoneTile 		= {r=0.92,g=0.92,b=0.92};	
	WhiteBlockTile 		= {r=0.92,g=0.92,b=0.92};
	YellowStoneTile 	= {r=0.84,g=0.78,b=0.30};
	GreenStoneTile	 	= {r=0.31,g=0.38,b=0.24};	
	RedStoneTile		= {r=0.81,g=0.60,b=0.60};
	BrownStoneTile 		= {r=0.59,g=0.44,b=0.21};
	ClassicRedBricks   	= {r=0.63,g=0.10,b=0.10};
}

function ISPaintCursor:create(x, y, z, north, sprite)
	local sq = getWorld():getCell():getGridSquare(x, y, z)
	local playerObj = self.character
	local playerInv = playerObj:getInventory()
	local object = self:getObjectList()[self.objectIndex]
	local args = self.args
	if self.action == "paintSign" then
		local paintCan = nil
		if not ISBuildMenu.cheat then
			local paintBrush = playerInv:getFirstTypeRecurse("Paintbrush") or playerInv:getFirstTypeRecurse("PaintbrushCrafted")
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, paintBrush)
			paintCan = playerInv:getFirstTypeRecurse(args.paintType)
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, paintCan)
		end
		ISTimedActionQueue.add(ISPaintSignAction:new(playerObj, object, paintCan, args.sign, args.r, args.g, args.b, 100))
	end
	if self.action == "paintThump" then
		local paintCan = nil
		if not ISBuildMenu.cheat then
			local paintBrush = playerInv:getFirstTypeRecurse("Paintbrush") or playerInv:getFirstTypeRecurse("PaintbrushCrafted")
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, paintBrush)
			paintCan = playerInv:getFirstTypeRecurse(args.paintType)
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, paintCan)
		end
		ISTimedActionQueue.add(ISPaintAction:new(playerObj, object, paintCan, args.paintType, 100))
	end
	if self.action == "plaster" then
		local plaster = nil
		if not ISBuildMenu.cheat then
			plaster = playerInv:getFirstTypeRecurse("BucketPlasterFull")
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, plaster)
		end
		ISTimedActionQueue.add(ISPlasterAction:new(playerObj, object, plaster))
	end
		if self.action == "wallpaper" then
		local wallpaper = nil
		local wallpaperGlue = nil
		if not ISBuildMenu.cheat then
			wallpaperGlue = playerInv:getFirstTypeRecurse("BucketWallpaperPaste")
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, wallpaperGlue)
			wallpaper = playerInv:getFirstTypeRecurse(args.paintType)
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, wallpaper)
		end
		ISTimedActionQueue.add(ISWPaintAction:new(playerObj, object, wallpaper, wallpaperGlue, args.paintType, 100))
	end
	if self.action == "newPlaster" then
		local plaster = nil
		if not ISBuildMenu.cheat then
			local plasterTrowel = playerInv:getFirstTypeRecurse("PlasterTrowel")
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, plasterTrowel)
			plaster = playerInv:getFirstTypeRecurse("BucketPlasterFull")
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, plaster)
		end
		ISTimedActionQueue.add(NewPlasteringAction:new(playerObj, object, plaster, 100))
	end
	if self.action == "removeSiding" then
		local sidingRemover = nil
		if not ISBuildMenu.cheat then
			sidingRemover = playerInv:getFirstTypeRecurse("Crowbar") or playerInv:getFirstTypeRecurse("Hammer")
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, sidingRemover)
		end
		ISTimedActionQueue.add(RemoveSidingAction:new(playerObj, object, sidingRemover, 100))
	end
	if self.action == "removeTiles" then
		local tilesRemover = nil
		if not ISBuildMenu.cheat then
			tilesRemover = playerInv:getFirstTypeRecurse("Hammer") or playerInv:getFirstTypeRecurse("BallPeenHammer") or playerInv:getFirstTypeRecurse("ClubHammer")
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, tilesRemover)
		end
		ISTimedActionQueue.add(RemoveTilesAction:new(playerObj, object, tilesRemover, 150))
	end
	if self.action == "applySiding" then
		local planks = nil
		if not ISBuildMenu.cheat then
			local woodenMallet = playerInv:getFirstTypeRecurse("WoodenMallet")
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, woodenMallet)
			planks = playerInv:getFirstTypeRecurse("Base.Plank") 
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, planks)
		end
		ISTimedActionQueue.add(ApplySidingAction:new(playerObj, object, planks, 150))
	end
	if self.action == "applyWoodStain" then
		local stainCan = nil
		if not ISBuildMenu.cheat then
			local paintBrush = playerInv:getFirstTypeRecurse("Paintbrush") or playerInv:getFirstTypeRecurse("PaintbrushCrafted")
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, paintBrush)
			stainCan = playerInv:getFirstTypeRecurse(args.paintType)
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, stainCan)
		end
		ISTimedActionQueue.add(ApplyWoodStainAction:new(playerObj, object, stainCan, args.paintType, 100))
	end
	if self.action == "applyTiles" then
		local tilesPack = nil
		if not ISBuildMenu.cheat then
			local plasterTrowel = playerInv:getFirstTypeRecurse("PlasterTrowel")
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, plasterTrowel)
			tilesPack = playerInv:getFirstTypeRecurse(args.paintType)
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, tilesPack)
		end
		ISTimedActionQueue.add(ApplyTilesAction:new(playerObj, object, tilesPack, args.paintType, 100))
	end
	
end

function ISPaintCursor:walkTo(x, y, z)
	local object = self:getObjectList()[self.objectIndex]
	self.isWallLike = self:_isWall(object) or self:_isDoorFrame(object)
	return ISBuildingObject.walkTo(self, x, y, z)
end

function ISPaintCursor:_isWall(object)
	if object and object:getProperties() then
		return object:getProperties():Is(IsoFlagType.cutW) or object:getProperties():Is(IsoFlagType.cutN)
	end
	return false
end

function ISPaintCursor:_isDoorFrame(object)
	return object and (object:getType() == IsoObjectType.doorFrW or object:getType() == IsoObjectType.doorFrN)
end

function ISPaintCursor:rotateKey(key)
	if key == getCore():getKey("Rotate building") then
		self.objectIndex = self.objectIndex + 1
		local objects = self:getObjectList()
		if self.objectIndex > #objects then
			self.objectIndex = 1
		end
	end
end

function ISPaintCursor:isValid(square)
	self.renderX = square:getX()
	self.renderY = square:getY()
	self.renderZ = square:getZ()
	return #self:getObjectList() > 0
end

function ISPaintCursor:render(x, y, z, square)
	if not self.floorSprite then
		self.floorSprite = IsoSprite.new()
		self.floorSprite:LoadFramesNoDirPageSimple('media/ui/FloorTileCursor.png')
	end

	local hc = getCore():getGoodHighlitedColor()
	if not self:isValid(square) then
		hc = getCore():getBadHighlitedColor()
	end
	self.floorSprite:RenderGhostTileColor(x, y, z, hc:getR(), hc:getG(), hc:getB(), 0.8)

	if self.currentSquare ~= square then
		self.objectIndex = 1
		self.currentSquare = square
	end

	self.renderX = x
	self.renderY = y
	self.renderZ = z

	local objects = self:getObjectList()
	if self.objectIndex >= 1 and self.objectIndex <= #objects then
		local object = objects[self.objectIndex]
		local color = {r=0.8, g=0.8, b=0.8}
		if self.action ~= "plaster" and self.action ~= "newPlaster" and self.action ~= "removeSiding" and self.action ~= "removeTiles" then
			color = PaintColor[self.args.paintType]
			if not color then color = {r=1,g=0,b=0} end
		end
		if self.action == "paintSign" then
--			if not self.signSprite then
				local sign = self.args.sign
				if object:getProperties():Is("WallW") then
					sign = sign + 8;
				end
				self.signSprite = IsoSprite.new()
				self.signSprite:LoadFramesNoDirPageSimple("constructedobjects_signs_01_" .. sign)
--			end
			self.signSprite:RenderGhostTileColor(x, y, z, color.r, color.g, color.b, 1.0)
		elseif self.action == "plaster" then
			local north = (object:getNorth() and "North") or ""
			local wallType = ISPaintMenu.getWallType(object);
			local spriteName = Painting[wallType]["plasterTile" .. north]
			self.plasterSprite = IsoSprite.new()
			self.plasterSprite:LoadSingleTexture(spriteName)
			self.plasterSprite:RenderGhostTile(x, y, z)
		elseif  self.action == "newPlaster" then
			local color = {r=0.1, g=1, b=0.5}
			local xOffset = 0
			local yOffset = object:getRenderYOffset()
			object:getSprite():RenderGhostTileColor(x, y, z, xOffset, yOffset * Core.getTileScale(), color.r, color.g, color.b, 0.8)
		elseif  self.action == "wallpaper" then
			local xOffset = 0
			local yOffset = object:getRenderYOffset()
			--render(self, x, y, z, square)
			object:getSprite():RenderGhostTileColor(x, y, z, xOffset, yOffset * Core.getTileScale(), color.r, color.g, color.b, 0.8)
		elseif  self.action == "applySiding" then
			local color = {r=0.1, g=1, b=0.5}
			local xOffset = 0
			local yOffset = object:getRenderYOffset()
			object:getSprite():RenderGhostTileColor(x, y, z, xOffset, yOffset * Core.getTileScale(), color.r, color.g, color.b, 0.8)
		elseif  self.action == "removeSiding" then
			local color = {r=0.1, g=1, b=0.5}
			local xOffset = 0
			local yOffset = object:getRenderYOffset()
			object:getSprite():RenderGhostTileColor(x, y, z, xOffset, yOffset * Core.getTileScale(), color.r, color.g, color.b, 0.8)
		elseif  self.action == "applyWoodStain" then
			local xOffset = 0
			local yOffset = object:getRenderYOffset()
			object:getSprite():RenderGhostTileColor(x, y, z, xOffset, yOffset * Core.getTileScale(), color.r, color.g, color.b, 0.8)
		elseif  self.action == "applyTiles" then
			local xOffset = 0
			local yOffset = object:getRenderYOffset()
			object:getSprite():RenderGhostTileColor(x, y, z, xOffset, yOffset * Core.getTileScale(), color.r, color.g, color.b, 0.8)
		else
			local xOffset = 0
			local yOffset = object:getRenderYOffset()
			object:getSprite():RenderGhostTileColor(x, y, z, xOffset, yOffset * Core.getTileScale(), color.r, color.g, color.b, 0.8)
		end
	end
end

function ISPaintCursor:onJoypadPressButton(joypadIndex, joypadData, button)
	local playerObj = getSpecificPlayer(joypadData.player)

	if button == Joypad.AButton or button == Joypad.BButton then
		return ISBuildingObject.onJoypadPressButton(self, joypadIndex, joypadData, button)
	end

	if button == Joypad.RBumper then
		self.objectIndex = self.objectIndex + 1
		local objects = self:getObjectList()
		if self.objectIndex > #objects then
			self.objectIndex = 1
		end
	end

	if button == Joypad.LBumper then
		self.objectIndex = self.objectIndex - 1
		if self.objectIndex < 1 then
			local objects = self:getObjectList()
			self.objectIndex = #objects
		end
	end
end

function ISPaintCursor:getAPrompt()
	if #self:getObjectList() > 0 then
		if self.action == "paintSign" then return getText("ContextMenu_PaintSign") end
		if self.action == "paintThump" then return getText("ContextMenu_NewPaint") end
		if self.action == "plaster" then return getText("ContextMenu_Plaster") end
		if self.action == "wallpaper" then return getText("ContextMenu_WPaint") end
		if self.action == "newPlaster" then return getText("ContextMenu_NewPlaster") end
		if self.action == "removeSiding" then return getText("ContextMenu_RemoveSiding") end
		if self.action == "applySiding" then return getText("ContextMenu_ApplySiding") end
		if self.action == "applyWoodStain" then return getText("ContextMenu_ApplyWoodStain") end
		if self.action == "applyTiles" then return getText("ContextMenu_ApplyTiles") end		
		if self.action == "removeTiles" then return getText("ContextMenu_RemoveTiles") end
	end
	return nil
end

function ISPaintCursor:getLBPrompt()
	if #self:getObjectList() > 1 then
		return "Previous Object"
	end
	return nil
end

function ISPaintCursor:getRBPrompt()
	if #self:getObjectList() > 1 then
		return "Next Object"
	end
	return nil
end

function ISPaintCursor:canPaint(object)
	if not object or not object:getSquare() or not object:getSprite() then return false end
	if not object:getSquare():isCouldSee(self.player) then return false end
	if not self:hasItems() then return false end
	local props = object:getProperties()
	local name = object:getSprite():getName()
	if self.action == "paintSign" then
		if props:Is("WallN") or props:Is("WallW") then
			return true
		end
	end
	if self.action == "paintThump" then
		if instanceof(object, "IsoThumpable") and object:isPaintable() then
			local modData = object:getModData()
			return Painting[modData.wallType][self.args.paintType] ~= nil
		end
		if props and props:Is("IsPaintable") then
			local wallType = props:Val("PaintingType")
			if Painting[wallType] ~= nil and Painting[wallType][self.args.paintType] ~= nil then
				return true
			end
			if OtherPainting[wallType] ~= nil and OtherPainting[wallType][self.args.paintType] ~= nil then
				return true
			end
		end
		if name and _BricksData[name] then
			local wallType = props:Val("PaintingType")
			if PaintedBricks[wallType] ~= nil and PaintedBricks[wallType][self.args.paintType] ~= nil then
				return true
			end
		end
		if name and _BlocksData[name] then
			local wallType = props:Val("PaintingType")
			if PaintedBlocks[wallType] ~= nil and PaintedBlocks[wallType][self.args.paintType] ~= nil then
				return true
			end
		end
		if name and _SidingData[name] then
			local wallType = props:Val("PaintingType")
			if Siding[wallType] ~= nil and Siding[wallType][self.args.paintType] ~= nil then
				return true
			end
		end
	end
	if self.action == "plaster" then
		if instanceof(object, "IsoThumpable") and object:canBePlastered() then
			return true
		end
	end
	if self.action == "wallpaper" then
		if instanceof(object, "IsoThumpable") and object:isPaintable() then
			local modData = object:getModData()
			return WPainting[modData.wallType][self.args.paintType] ~= nil
		end
		if props and props:Is("IsPaintable") then
			local wallType = props:Val("PaintingType")
			if WPainting[wallType] ~= nil and WPainting[wallType][self.args.paintType] ~= nil then
				return true
			end

		end
	end
	if self.action == "applySiding" then
		local wallType = props:Val("PaintingType")
		local name = object:getSprite():getName()
		if instanceof(object, "IsoThumpable") and (object:isPaintable() or object:canBePlastered()) then
			return true
		end
		if (_BricksData[name] or _WoodData[name] or _BlocksData[name] or _plasterData[name] or props:Is("IsPaintable")) then
			return true
		end	
	end
		
	if self.action == "applyWoodStain" then
		local wallType = props:Val("PaintingType")
		local name = object:getSprite():getName()
		
		if _WoodData[name] then
			if WoodStain[wallType] ~= nil and WoodStain[wallType][self.args.paintType] ~= nil then
			return true
			end
		end
	end
	if self.action == "applyTiles" then
		local wallType = props:Val("PaintingType")
		local name = object:getSprite():getName()
		
		if _plasterData[name] then
			if Tiles[wallType] ~= nil and Tiles[wallType][self.args.paintType] ~= nil then
			return true
			end
		end
	end

	if self.action == "newPlaster" then	
		local wallType = props:Val("PaintingType")
		local name = object:getSprite():getName()
		if (_BricksData[name] or _WoodData[name] or _BlocksData[name] or _plasterData[name] or props:Is("IsPaintable")) then
			return true
		end
	end
	if self.action == "removeSiding" then
		local wallType = props:Val("PaintingType")
		local name = object:getSprite():getName()
		if _SidingData[name] then
			return true
		end
	end
	if self.action == "removeTiles" then
		local wallType = props:Val("PaintingType")
		local name = object:getSprite():getName()
		if _TilesData[name] then
			return true
		end
	end
	return false
end

function ISPaintCursor:hasItems()
	local playerObj = self.character
	local playerInv = playerObj:getInventory()
	if self.action == "paintSign" or self.action == "paintThump" then
		if not ISBuildMenu.cheat then
			local paintBrush = playerInv:getFirstTypeRecurse("Paintbrush") or playerInv:getFirstTypeRecurse("PaintbrushCrafted")
			local paintCan = playerInv:getFirstTypeRecurse(self.args.paintType)
			return paintBrush ~= nil and paintCan ~= nil
		end
		return true
	end
	if self.action == "wallpaper" then
		if not ISBuildMenu.cheat then
			local wallpaperGlue = playerInv:getFirstTypeRecurse("BucketWallpaperPaste")
			local wallpaper = playerInv:getFirstTypeRecurse(self.args.paintType)
			return wallpaperGlue ~= nil and wallpaper ~= nil
		end
		return true
	end
	if self.action == "plaster" or self.action == "newPlaster" then
		if not ISBuildMenu.cheat then
			local plaster = playerInv:getFirstTypeRecurse("BucketPlasterFull")
			local plasterTrowel = playerInv:getFirstTypeRecurse("PlasterTrowel")
			return plaster ~= nil and plasterTrowel ~= nil
		end
		return true
	end
	if self.action == "removeSiding" then
		if not ISBuildMenu.cheat then
			local sidingRemover = playerInv:getFirstTypeRecurse("Crowbar") or playerInv:getFirstTypeRecurse("Hammer")
			return sidingRemover ~= nil
		end
		return true
	end
	if self.action == "removeTiles" then
		if not ISBuildMenu.cheat then
			local tilesRemover = playerInv:getFirstTypeRecurse("Hammer") or playerInv:getFirstTypeRecurse("BallPeenHammer") or playerInv:getFirstTypeRecurse("ClubHammer")
			return tilesRemover ~= nil
		end
		return true
	end
	if self.action == "applySiding" then
		if not ISBuildMenu.cheat then
			local woodenMallet = playerInv:getFirstTypeRecurse("WoodenMallet")
			local planks = playerInv:getFirstTypeRecurse("Base.Plank") and playerInv:getItemCountRecurse("Base.Plank") >= 2
			return woodenMallet ~= nil and planks ~= nil
		end
		return true
	end
	if self.action == "applyWoodStain" then
		if not ISBuildMenu.cheat then
			local paintBrush = playerInv:getFirstTypeRecurse("Paintbrush") or playerInv:getFirstTypeRecurse("PaintbrushCrafted")
			local stainCan = playerInv:getFirstTypeRecurse(self.args.paintType)
			return paintBrush ~= nil and stainCan ~= nil
		end
		return true
	end
	if self.action == "applyTiles" then
		if not ISBuildMenu.cheat then
			local plasterTrowel = playerInv:getFirstTypeRecurse("PlasterTrowel")
			local tilesPack = playerInv:getFirstTypeRecurse(self.args.paintType)
			return plasterTrowel ~= nil and tilesPack ~= nil
		end
		return true
	end
	error "unhandled action in ISPaintCursor:hasItems()"
end

function ISPaintCursor:getObjectList()
	local square = getCell():getGridSquare(self.renderX, self.renderY, self.renderZ)
	if not square then return {} end
	local objects = {}
	for i = square:getObjects():size(),1,-1 do
		local object = square:getObjects():get(i-1)
		if self:canPaint(object) then
			table.insert(objects, object)
		end
	end
	return objects
end

function ISPaintCursor:new(character, action, args)
local o = {}
	setmetatable(o, self)
	self.__index = self
	o:init()
	o.character = character
	o.player = character:getPlayerNum()
	o.skipBuildAction = true
	o.noNeedHammer = false
	o.skipWalk = true
	o.renderFloorHelper = true
--	o.dragNilAfterPlace = true
	o.action = action
	o.args = args
	o.objectIndex = 1
	o.renderX = -1
	o.renderY = -1
	o.renderZ = -1
	return o
end


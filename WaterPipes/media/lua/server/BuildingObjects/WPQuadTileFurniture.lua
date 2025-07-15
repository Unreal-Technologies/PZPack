--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

ISQuadTileFurniture = ISBuildingObject:derive("ISQuadTileFurniture");

--************************************************************************--
--** ISDoubleTileFurniture:new
--**
--************************************************************************--
function ISQuadTileFurniture:create(x, y, z, north, sprite)
	local cell = getWorld():getCell()
	
	for k, v in pairs(self.objs) do
		local nx = x + v.dx
		local ny = y + v.dy
		local nsprite = v.sprite

		self.sq = cell:getGridSquare(nx, ny, z)
		self:setInfo(self.sq, false, nsprite, self)
	end

	buildUtil.consumeMaterial(self)
end

function ISQuadTileFurniture:walkTo(x, y, z)
	local playerObj = getSpecificPlayer(self.player)
	local square = getCell():getGridSquare(x, y, z)
	local square2 = self:getSquare2(square, self.north)
	if square:DistToProper(playerObj) < square2:DistToProper(playerObj) then
		return luautils.walkAdj(playerObj, square)
	end
	return luautils.walkAdj(playerObj, square2)
end

function ISQuadTileFurniture:setInfo(square, north, sprite)
	-- add furniture to our ground
	local thumpable = IsoThumpable.new(getCell(), square, sprite, north, self);
	-- name of the item for the tooltip
	buildUtil.setInfo(thumpable, self);
	-- the furniture have 200 base health + 100 per carpentry lvl
	thumpable:setMaxHealth(self:getHealth());
	thumpable:setHealth(thumpable:getMaxHealth())
	-- the sound that will be played when our furniture will be broken
	thumpable:setBreakSound("BreakObject");
	square:AddSpecialObject(thumpable);
	thumpable:transmitCompleteItemToServer();
end

function ISQuadTileFurniture:removeFromGround(square)
end

function ISQuadTileFurniture:new(name, westSprite, southSprite, eastSprite, northSprite)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o:init();

	local objs = {}
	table.insert (objs, {dx=0, dy=0, sprite=westSprite})
	table.insert (objs, {dx=0, dy=-1, sprite=southSprite})
	table.insert (objs, {dx=-1, dy=-1, sprite=eastSprite})
	table.insert (objs, {dx=-1, dy=0, sprite=northSprite})
	
	o.objs = objs
	o.name = name
	o.canBarricade = false
	o.dismantable = false
	o.blockAllTheSquare = true
	o.canBeAlwaysPlaced = false
	o.buildLow = false
	return o
end

-- return the health of the new furniture, it's 200 + 100 per carpentry lvl
function ISQuadTileFurniture:getHealth()
	return 200 + buildUtil.getWoodHealth(self);
end

function ISQuadTileFurniture:render(x, y, z, square)

	for k, v in pairs(self.objs) do
		local nx = x + v.dx
		local ny = y + v.dy
		local nsprite = v.sprite

		local square = getCell():getGridSquare(nx, ny, z)

		-- test if the square are free to add our furniture
		local spriteFree = true
		if not self.canBeAlwaysPlaced and (not square or not square:isFreeOrMidair(true)) then
			spriteFree = false
		end

		if square and square:isVehicleIntersecting() then spriteFree = false end
		
		local spriteObj = IsoSprite.new()
		spriteObj:LoadFramesNoDirPageSimple(nsprite)
		if spriteFree then
			spriteObj:RenderGhostTile(nx, ny, z);
		else
			spriteObj:RenderGhostTileRed(nx, ny, z);
		end
	end
end

function ISQuadTileFurniture:isValid(square)
	
	if not ISBuildingObject.isValid(self, square) then return false end

	local cell = getWorld():getCell()

	local x = square:getX()
	local y = square:getY()
	local z = square:getZ()

	for k, v in pairs(self.objs) do
		local nx = x + v.dx
		local ny = y + v.dy
		local nsprite = v.sprite

		local square = cell:getGridSquare(nx, ny, z)

		if not square or not square:isFreeOrMidair(true) or buildUtil.stairIsBlockingPlacement(square, true) then
			return false
		end
		if square:isVehicleIntersecting() then return false end
		if buildUtil.stairIsBlockingPlacement(square, true) then return false end

	end
	return true
end

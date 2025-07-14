WPPumpFurniture = ISBuildingObject:derive("WPPumpFurniture");

function WPPumpFurniture:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
	buildUtil.setInfo(self.javaObject, self);
	buildUtil.consumeMaterial(self);
	-- the wooden wall have 100 base health + 100 per carpentry lvl
	self.javaObject:setMaxHealth(self:getHealth());
	self.javaObject:setHealth(self.javaObject:getMaxHealth());
	-- the sound that will be played when our door frame will be broken
	self.javaObject:setBreakSound("BreakObject");
	-- add the item to the ground
    self.sq:AddSpecialObject(self.javaObject);
	
	self.javaObject:transmitCompleteItemToServer();
end

function WPPumpFurniture:removeFromGround(square)
	for i = 0, square:getSpecialObjects():size() do
		local thump = square:getSpecialObjects():get(i);
		if instanceof(thump, "IsoThumpable") then
			square:transmitRemoveItemFromSquare(thump);
		end
	end
end

function WPPumpFurniture:new(name, sprite, northSprite)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.name = name;
	o.canBarricade = false;
	o.dismantable = true;
	o.blockAllTheSquare = true;
	o.canBeAlwaysPlaced = true;
	o.buildLow = true;
	return o;
end

-- return the health of the new container, it's 100 + 100 per carpentry lvl
function WPPumpFurniture:getHealth()
	return 100 + buildUtil.getWoodHealth(self);
end

function WPPumpFurniture:isValid(square)
	if not ISBuildingObject.isValid(self, square) then return false end
	if not buildUtil.canBePlace(self, square) then return false end
	if buildUtil.stairIsBlockingPlacement( square, true ) then return false end
    -- if not (HasWaterAccess(square) or HasFreshWaterAccess(square) or HasFuelAccess(square)) then return false end
	if GetWaterFromSquare(square) ~= false then return false end

    return true
end

function WPPumpFurniture:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end

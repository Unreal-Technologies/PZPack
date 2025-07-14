--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

RemoveMouldingCursor = ISBuildingObject:derive("RemoveMouldingCursor")


	
local function predicateNotBroken(item)
	return not item:isBroken()
end

local function doRemoveMouldingMenu(player, square)
	local inventory = player:getInventory()
	if luautils.walkAdj(player, square, true) then
		local item = inventory:getFirstTypeRecurse("Hammer");

		ISWorldObjectContextMenu.transferIfNeeded(player, item)

			luautils.equipItems(player, item)
		
		ISTimedActionQueue.add(RemoveWoodenMouldingAction:new(player, square, 50));
	end
end

function RemoveMouldingCursor:create(x, y, z, north, sprite)
	local square = getWorld():getCell():getGridSquare(x, y, z)
	doRemoveMouldingMenu(self.character, square)
end

function RemoveMouldingCursor:isValid(square)
	local inventory = self.character:getInventory()

	for i=0,square:getObjects():size()-1 do
		local object = square:getObjects():get(i);
        
        if object then
            if object:getTextureName() and (WoodenMoulding[object:getTextureName()] or StoneMoulding[object:getTextureName()]) then
                return inventory:contains("Hammer");
            else
                local attached = object:getAttachedAnimSprite()
                if attached then
                    for n=1,attached:size() do
                        local sprite = attached:get(n-1)
                        if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and 
							(WoodenMoulding[sprite:getParentSprite():getName()] or StoneMoulding[sprite:getParentSprite():getName()]) then
                            return inventory:contains("Hammer");
                        end
                    end
                end
            end
		end
	end
    
    return false
end

function RemoveMouldingCursor:render(x, y, z, square)
	if not RemoveMouldingCursor.floorSprite then
		RemoveMouldingCursor.floorSprite = IsoSprite.new()
		RemoveMouldingCursor.floorSprite:LoadFramesNoDirPageSimple('media/ui/FloorTileCursor.png')
	end
	local r,g,b,a = 0.0,1.0,0.0,0.8
	if self:isValid(square) == false then
		r = 1.0
		g = 0.0
	end
	RemoveMouldingCursor.floorSprite:RenderGhostTileColor(x, y, z, r, g, b, a)
end

function RemoveMouldingCursor:new(sprite, northSprite, character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o:init()
	o:setSprite(sprite)
	o:setNorthSprite(northSprite)
	o.character = character
	o.player = character:getPlayerNum()
	o.noNeedHammer = true
	o.skipBuildAction = true
	return o
end


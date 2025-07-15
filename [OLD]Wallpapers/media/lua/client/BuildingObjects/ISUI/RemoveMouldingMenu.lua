require('luautils');

	

local function predicateNotBroken(item)
	return not item:isBroken()
end

local function onRemoveMouldingMenu(worldobjects, square, player)
	local bo = RemoveMouldingCursor:new("", "", player)
	getCell():setDrag(bo, player:getPlayerNum())
end

local function addRemoveMouldingMenu(player, context, worldobjects)
    local player = getSpecificPlayer(player);
    local inventory = player:getInventory();
    local square;
    local target;

    if player:getVehicle() then return end

    for i,v in ipairs(worldobjects) do
        square = v:getSquare();
    end
  
	if not square then return end
     
	for i=0,square:getObjects():size()-1 do
		local object = square:getObjects():get(i);
        
        if object then
            if object:getTextureName() and (WoodenMoulding[object:getTextureName()] or StoneMoulding[object:getTextureName()]) then
                target = object;
            else
                local attached = object:getAttachedAnimSprite()
                if attached then
                    for n=1,attached:size() do
                        local sprite = attached:get(n-1)
                        if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() 
							and (WoodenMoulding[sprite:getParentSprite():getName()] or StoneMoulding[sprite:getParentSprite():getName()]) then
                            target = sprite
                            break;
                        end
                    end
                end
            end
        end
	end

    if not target then return end
    
    if not inventory:containsTypeRecurse("Hammer") then return end

    context:addOption(getText('ContextMenu_RemoveMoulding'), worldobjects, onRemoveMouldingMenu, square, player);
end

-- ------------------------------------------------
-- Game hooks
-- ------------------------------------------------
Events.OnFillWorldObjectContextMenu.Add(addRemoveMouldingMenu);

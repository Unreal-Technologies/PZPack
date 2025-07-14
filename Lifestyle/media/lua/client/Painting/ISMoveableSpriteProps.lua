require 'Moveables/ISMoveableSpriteProps';

local ISMoveableSpriteProps_getInfoPanelDescription = ISMoveableSpriteProps.getInfoPanelDescription;
function ISMoveableSpriteProps:getInfoPanelDescription( _square, _object, _player, _mode, ... )
    local infoTable = ISMoveableSpriteProps_getInfoPanelDescription(self, _square, _object, _player, _mode, ...)
    if (instanceof(_object, "IsoObject") or instanceof(_object, "InventoryItem")) and _object:hasModData() and _object:getModData().movableData and _object:getModData().movableData['artAuthor'] then
		if _object:getModData().movableData['artBeauty'] then infoTable = ISMoveableSpriteProps.addLineToInfoTable(infoTable, getText("IGUI_PaintingBeauty")..": ", 255, 255, 255, tostring(_object:getModData().movableData['artBeauty']), 0, 255, 0); end
		if _object:getModData().movableData['artName'] then infoTable = ISMoveableSpriteProps.addLineToInfoTable(infoTable, getText("IGUI_PaintingCustomName")..": ", 255, 255, 255, _object:getModData().movableData['artName'], 255, 255, 255); end
		if _object:getModData().movableData['artStyle'] then infoTable = ISMoveableSpriteProps.addLineToInfoTable(infoTable, getText("IGUI_PaintingStyle")..": ", 255, 255, 255, getText("IGUI_PaintingStyle".._object:getModData().movableData['artStyle']), 255, 255, 255); end
		infoTable = ISMoveableSpriteProps.addLineToInfoTable(infoTable, getText("IGUI_PaintingAuthor")..": ", 255, 255, 255, _object:getModData().movableData['artAuthor'], 255, 255, 0)
	end
    return infoTable
end

function ISMoveableSpriteProps:placeMoveable( _character, _square, _origSpriteName )
    if self.isMoveable and instanceof(_character,"IsoGameCharacter") and instanceof(_square,"IsoGridSquare") then
        if self.isMultiSprite then
            local spriteGrid = self.sprite:getSpriteGrid();
            if not spriteGrid then return false; end

            local sgrid = self:getSpriteGridInfo(_square, false);
            if not sgrid then return false; end

            if not self.isForceSingleItem then
                local max = spriteGrid:getSpriteCount();
                local items = {};
                for i,gridMember in ipairs(sgrid) do
                    local item, container = self:findInInventoryMultiSprite( _character, self.name .. " (" .. i .. "/" .. max .. ")" );
                    --[[
                    if not item or not item:getWorldSprite() then
                        return false;
                    end
                    local elementProps = ISMoveableSpriteProps.new( item:getWorldSprite() );
                    if not elementProps or not self:canPlaceMoveableInternal( _character, gridMember.square, item, elementProps.isGridExtensionTile ) then
                        return false;
                    end
                    --]]
                    --local item = self:findInInventory( _character, gridMember.sprite:getName() );
                    if not item or not self:canPlaceMoveableInternal( _character, gridMember.square, item ) then
                        return false;
                    end
                    items[i] = {item, container};
                end
                for i,gridMember in ipairs(sgrid) do
                    local item, inventory = items[i][1], items[i][2];
                    self:placeMoveableInternal(  gridMember.square, item, gridMember.sprite:getName() );

                    if inventory=="floor" then
                        if item:getWorldItem() ~= nil then
                            item:getWorldItem():getSquare():transmitRemoveItemFromSquare(item:getWorldItem());
                            item:getWorldItem():getSquare():removeWorldObject(item:getWorldItem());
                            item:setWorldItem(nil);
                        end
                    else
                        inventory:Remove(item);
                    end
                    --items[i][2]:Remove(items[i][1]);
                    --_character:getInventory():Remove(items[i]);
                end
            else
                --if self.sprite == spriteGrid:getAnchorSprite() then
                    local item = self:findInInventoryMultiSprite( _character, self.name .. " (1/1)" ); --self:findInInventory( _character, spriteGrid:getAnchorSprite():getName() );
                    if item then
                        for i,gridMember in ipairs(sgrid) do
                            if not self:canPlaceMoveableInternal( _character, gridMember.square, item ) then
                                return false;
                            end
                        end
                        for i,gridMember in ipairs(sgrid) do
                            local gridItem = self:instanceItem(gridMember.sprite:getName());
                            if gridMember.sprite == spriteGrid:getAnchorSprite() then
                                gridItem = item;
							elseif item:hasModData() and item:getModData().movableData and item:getModData().movableData['artAuthor'] then
								gridItem:getModData().movableData = copyTable(item:getModData().movableData)
                            end
                            self:placeMoveableInternal(  gridMember.square, gridItem, gridMember.sprite:getName() )
                        end

                        _character:getInventory():Remove(item);
                    end
                --end
            end

            ISMoveableCursor.clearCacheForAllPlayers();
        else
            local item = self:findInInventory( _character, _origSpriteName );
            if item  and self:canPlaceMoveableInternal( _character, _square, item ) then
                self:placeMoveableInternal( _square, item, self.spriteName )
                _character:getInventory():Remove(item);
                ISMoveableCursor.clearCacheForAllPlayers();
            end
        end
    end
end

local ISMoveableSpriteProps_pickUpMoveable = ISMoveableSpriteProps.pickUpMoveable;
function ISMoveableSpriteProps:pickUpMoveable( _character, _square, _createItem, _forceAllow )
    if self.isMoveable and instanceof(_character,"IsoGameCharacter") and instanceof(_square,"IsoGridSquare") then
        local obj, sprInstance = self:findOnSquare( _square, self.spriteName );
        local items = {};
        if obj and (_forceAllow or ISMoveableDefinitions.cheat or self:canPickUpMoveable( _character, _square, not sprInstance and obj or nil )) then
            if self.isMultiSprite then
                local sgrid = self:getSpriteGridInfo(_square, true);
                if not sgrid then return false; end

                local createItem = _createItem and not self.isForceSingleItem;
                for _,gridMember in ipairs(sgrid) do
                    table.insert(items, self:pickUpMoveableInternal( _character, gridMember.square, gridMember.object, gridMember.sprInstance, gridMember.sprite:getName(), createItem, _forceAllow ));
                end

                if _createItem and self.isForceSingleItem then
                    local spriteGrid = self.sprite:getSpriteGrid();
                    if not spriteGrid then return false; end

                    local item 	= self:instanceItem(spriteGrid:getAnchorSprite():getName());
                    if obj:hasModData() and obj:getModData().movableData then
                        item:getModData().movableData = copyTable(obj:getModData().movableData)
                    end
                    _character:getInventory():AddItem(item);
                end
            else
                --local obj, sprInstance = self:findOnSquare( _square, self.spriteName );
                self:pickUpMoveableInternal( _character, _square, obj, sprInstance, self.spriteName, _createItem, _forceAllow );
            end
            ISMoveableCursor.clearCacheForAllPlayers();
            return items;
        end
    end
end

--[[
local ISMoveableSpriteProps_pickUpMoveableInternal = ISMoveableSpriteProps.pickUpMoveableInternal;
function ISMoveableSpriteProps:pickUpMoveableInternal( _character, _square, _object, ... )
    local item = ISMoveableSpriteProps_pickUpMoveableInternal(self, _character, _square, _object, ...)
	if instanceof(item, "InventoryItem") and instanceof(_object, "IsoObject") and _object:hasModData() and _object:getModData().movableData and _object:getModData().movableData['artAuthor'] then
		item:getModData().artAuthor = _object:getModData().movableData['artAuthor']
		item:getModData().artBeauty = _object:getModData().movableData['artBeauty']
		item:getModData().artName = _object:getModData().movableData['artName']
		item:getModData().artStyle = _object:getModData().movableData['artStyle']
	end
    return item
end


local ISMoveableSpriteProps_placeMoveableInternal = ISMoveableSpriteProps.placeMoveableInternal
function ISMoveableSpriteProps:placeMoveableInternal( _square, _item, _spriteName )
    local item = ISMoveableSpriteProps_placeMoveableInternal(self, _character, _square, _object, ...)
	if instanceof(item, "InventoryItem") and instanceof(_object, "IsoObject") and _object:hasModData() and _object:getModData().artAuthor then
		item:getModData().artAuthor = _object:getModData().artAuthor
	end
    return item
end
]]--
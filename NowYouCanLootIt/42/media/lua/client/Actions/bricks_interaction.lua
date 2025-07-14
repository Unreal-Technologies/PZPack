BricksInteraction = { }

function BricksInteraction:new(player, object)
    local o = setmetatable(self, BaseTileInteraction:new(player, object))
    self.__index = self

    o.maxTime = 300
    o.soundName = "BuildFenceGravelbag"
    o.sound = nil
    o.itemToAdd = "ClayBrick"
    o.itemToAddQuantity = 15
    o.animName = "Loot"
    o.contextOptionText = getText("ContextMenu_GetBricks")

    return o
end

function BricksInteraction:perform()
    if self.character:getEmitter():isPlaying(self.sound) then
        self.character:getEmitter():stopSound(self.sound)
    end
 
    self.character:getInventory():AddItems(self.itemToAdd, self.itemToAddQuantity)

    self.object:setSpriteFromName(self.tiles.EmptyPallet)

    ISBaseTimedAction.perform(self)
end
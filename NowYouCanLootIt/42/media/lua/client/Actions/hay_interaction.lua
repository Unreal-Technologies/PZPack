HayInteraction = { }

function HayInteraction:new(player, object)
    local o = setmetatable(self, BaseTileInteraction:new(player, object))
    self.__index = self

    o.maxTime = 300
    o.soundName = "ScytheGrass"
    o.sound = nil
    o.itemToAdd = "HayTuft"
    o.itemToAddQuantity = self:getItemQuantity(self.object)
    o.animName = self:getAnimName(self.object)
    o.contextOptionText = getText("ContextMenu_GetHay")

    return o
end

function HayInteraction:getItemQuantity(object)
    if not object then
        return 0
    elseif object and (object:getSpriteName() == self.tiles.BalesOfHay1
        or object:getSpriteName() == self.tiles.BalesOfHay2)
            then return 50
    elseif object and (object:getSpriteName() == self.tiles.BalesOfHayDouble1
        or object:getSpriteName() == self.tiles.BalesOfHayDouble2)
            then return 100
    elseif object and (object:getSpriteName() == self.tiles.HayOnTheGround1
        or object:getSpriteName() == self.tiles.HayOnTheGround2)
            then return 10
    end
end

function HayInteraction:getAnimName(object)
    if not object then
        print("Some error occured: object is nil")
        return nil
    elseif object and (object:getSpriteName() == self.tiles.BalesOfHayDouble1
        or object:getSpriteName() == self.tiles.BalesOfHayDouble2)
            then return "Loot"
    elseif object and (object:getSpriteName() == self.tiles.BalesOfHay1
        or object:getSpriteName() == self.tiles.BalesOfHay2
        or object:getSpriteName() == self.tiles.HayOnTheGround1
        or object:getSpriteName() == self.tiles.HayOnTheGround2)
            then return "Forage"
    else
        print("Some error occured: object is not hay")
        return nil
    end
end

function HayInteraction:perform()
    if self.character:getEmitter():isPlaying(self.sound) then
        self.character:getEmitter():stopSound(self.sound)
    end
 
    self.character:getInventory():AddItems(self.itemToAdd, self.itemToAddQuantity)

    self.object:getSquare():RemoveTileObject(self.object)

    ISBaseTimedAction.perform(self)
end
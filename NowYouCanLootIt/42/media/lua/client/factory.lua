Factory = {}

function Factory:new(worldObjects, _player)
    local o = {}
    setmetatable(o, self)
    self.__index = self

    o.tiles = TilesTable:new()
    o.worldObjects = worldObjects
    o.character = getSpecificPlayer(_player)

    return o
end

function Factory:checkTile()
    for i, object in ipairs(self.worldObjects) do
        for key, value in pairs(self.tiles) do
            if not key:find("__") and object:getSpriteName() == value then
                return object
            end
        end
    end

    return nil
end

function Factory:createAction()
    local object = self:checkTile()

    if not object then
        return nil
    end

    if self.tiles:isPalleteWithBricks(object) then
        return BricksInteraction:new(self.character, object)
    end

    if self.tiles:isHayTile(object) then
        return HayInteraction:new(self.character, object)
    end
end
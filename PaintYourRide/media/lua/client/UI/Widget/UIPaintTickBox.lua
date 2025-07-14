require "ISUI/ISTickBox"

UIPaintTickBox = ISTickBox:derive("UIPaintCheckBox")

function UIPaintTickBox:initialise()
    ISTickBox.initialise(self)
end

-- -------------------------------------
-- This is a copy of ISTickBox:addOption by The Indie Stone
-- Fixed vertical gap between options when a texture is specified
-- -------------------------------------
function UIPaintTickBox:addOption(name, data, texture)
    table.insert(self.options, name);
    self.textures[self.optionCount] = texture;
    self.optionData[self.optionCount] = data;
    self.optionsIndex[self.optionCount] = name;
    self.optionCount = self.optionCount + 1;
    -- START OF FIX
    if texture then
        self.itemHgt = math.max(self.boxSize, self.fontHgt, self.textureSize) + self.itemGap
    end
    -- END OF FIX
    self:setHeight(#self.options * self.itemHgt);
    if self.autoWidth then
        local w = self.leftMargin + self.boxSize + self.textGap + getTextManager():MeasureStringX(self.font, name)
        if texture then
            w = w + 32;
        end
        if w > self:getWidth() then
            self:setWidth(w)
        end
    end
    return self.optionCount - 1;
end

function UIPaintTickBox:new(x, y, width, height, name, changeOptionTarget, changeOptionMethod, changeOptionArg1, changeOptionArg2)
    local o = {}
    o = ISTickBox:new(x, y, width, height, name, changeOptionTarget, changeOptionMethod, changeOptionArg1, changeOptionArg2)
    setmetatable(o, self)
    self.__index = self
    o.textureSize = 20
    return o
end


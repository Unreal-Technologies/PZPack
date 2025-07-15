require "ISUI/ISUIElement"

UIPaintBlockEquipment2 = ISUIElement:derive("UIPaintBlockEquipment2")

function UIPaintBlockEquipment2:initialise()
    ISUIElement.initialise(self)
end

function UIPaintBlockEquipment2:createChildren()
    self.checkbox = UIPaintTickBox:new(self.padding, self.padding, self:getWidth() - self.padding * 2, 20)
    self.checkbox:initialise()
    self.checkbox.autoWidth = true
    self:addChild(self.checkbox)
end

function UIPaintBlockEquipment2:prerender()
    self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b)
    self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b)
end

---
--- Should be called after the child was populated with options to set a correct height.
---
function UIPaintBlockEquipment2:onChildPopulated()
    -- TODO: maybe do it only once?
    self.height = self.padding * 2 + self.checkbox:getHeight()
    self:setHeight(self.height)
end

function UIPaintBlockEquipment2:getTickBox()
    return self.checkbox
end

function UIPaintBlockEquipment2:new(x, y, width, height)
    local o = {}
    o = ISUIElement:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.x = x
    o.y = y
    o.width = width
    o.height = height -- 0
    o.padding = 4

    o.backgroundColor = { r = 0, g = 0, b = 0, a = 0.3 }
    o.borderColor = { r = 0.4, g = 0.4, b = 0.4, a = 1 }
    return o
end
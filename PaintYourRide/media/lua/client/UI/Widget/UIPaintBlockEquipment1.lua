require "ISUI/ISUIElement"

UIPaintBlockEquipment1 = ISUIElement:derive("UIPaintBlockEquipment1")

function UIPaintBlockEquipment1:initialise()
    ISUIElement.initialise(self)
end

function UIPaintBlockEquipment1:createChildren()
    self.radio = ISRadioButtons:new(self.padding, self.padding, self:getWidth() - self.padding * 2, 20, self.target, self.changeOptionFunc)
    self.radio.choicesColor = { r = 1, g = 1, b = 1, a = 1 }
    self.radio:initialise()
    self.radio.autoWidth = true
    self:addChild(self.radio)
end

function UIPaintBlockEquipment1:prerender()
    self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b)
    self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b)
end

---
--- Should be called after the child was populated with options to set a correct height.
---
function UIPaintBlockEquipment1:onChildPopulated()
    -- TODO: maybe do it only once?
    self.height = self.padding * 2 + self.radio:getHeight()
    self:setHeight(self.height)
end

function UIPaintBlockEquipment1:getRadioButtons()
    return self.radio
end

function UIPaintBlockEquipment1:new(x, y, width, height, target, changeOptionFunc)
    local o = {}
    o = ISUIElement:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.x = x
    o.y = y
    o.width = width
    o.height = height -- 0
    o.padding = 4
    o.target = target
    o.changeOptionFunc = changeOptionFunc

    o.backgroundColor = { r = 0, g = 0, b = 0, a = 0.3 }
    o.borderColor = { r = 0.4, g = 0.4, b = 0.4, a = 1 }
    return o
end
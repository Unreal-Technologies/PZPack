require "ISUI/ISUIElement"

UIPaintBlockColorant = ISUIElement:derive("UIPaintBlockColorant")

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

function UIPaintBlockColorant:initialise()
    ISUIElement.initialise(self)
end

function UIPaintBlockColorant:createChildren()
    local padding = 4
    local btnWidth = 40
    local btnHeight = math.max(FONT_HGT_SMALL + 3 * 2, 25)
    local btnMarginRight = 4

    local x = padding
    local y = padding

    self.title = getText("IGUI_PaintVehicle_Panel_Tint" .. self.title)

    local labelHeight = getTextManager():MeasureStringY(UIFont.Small, self.title)
    local labelPaddingLeft = math.max((btnHeight - labelHeight) / 2)
    self.label = ISLabel:new(x + labelPaddingLeft, y + (btnHeight - labelHeight) / 2, FONT_HGT_SMALL, self.title, 1, 1, 1, 1, UIFont.Small, true)
    self.label:initialise()
    self.label:instantiate()
    self:addChild(self.label)

    -- Add 1 part button
    self.btn1 = ISButton:new(x + 105, y, btnWidth, btnHeight, "+1", self.btnClickTarget, self.btnOnClick)
    self.btn1.internal = "COLOR"
    self.btn1.internalColor = self.btnInternalColor
    self.btn1.internalColorParts = 1
    self.btn1:initialise()
    self.btn1:instantiate()
    self.btn1.borderColor = self.buttonBorderColor
    self:addChild(self.btn1)

    -- Add 10 parts button
    self.btn2 = ISButton:new(self.btn1:getRight() + btnMarginRight, y, btnWidth, btnHeight, "+10", self.btnClickTarget, self.btnOnClick)
    self.btn2.internal = "COLOR"
    self.btn2.internalColor = self.btnInternalColor
    self.btn2.internalColorParts = 10
    self.btn2:initialise()
    self.btn2:instantiate()
    self.btn2.borderColor = self.buttonBorderColor
    self:addChild(self.btn2)

    x = self.btn2:getRight() + btnMarginRight
    self.bar = UIPaintProgressBar:new(x, y, self.width - x - padding, btnHeight, self.progressColor)
    self.bar:initialise()
    self.bar:instantiate()
    self.bar.borderColor = self.buttonBorderColor
    self:addChild(self.bar)

    -- Set the block's height. Important
    self:setHeight(self.btn1:getBottom() + padding)
end

function UIPaintBlockColorant:prerender()
    self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b)
    self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b)
end

function UIPaintBlockColorant:render()
    if not self.enabled then
        self:drawRect(0, 0, self.width, self.height, self.overlayColor.a, self.overlayColor.r, self.overlayColor.g, self.overlayColor.b)
    end
end

function UIPaintBlockColorant:setEnabled(enabled)
    self.enabled = enabled
    self.btn1:setEnable(enabled)
    self.btn2:setEnable(enabled)
    self.bar:setEnabled(enabled)
    if enabled then
        self.label:setColor(1, 1, 1)
    else
        self.label:setColor(0.5, 0.5, 0.5)
    end
end

function UIPaintBlockColorant:getBtn1()
    return self.btn1
end

function UIPaintBlockColorant:getBtn2()
    return self.btn2
end

function UIPaintBlockColorant:getProgressBar()
    return self.bar
end

function UIPaintBlockColorant:setProgress(progress)
    self.progress = progress
    self.bar:setProgress(progress)

    self:updateButtons()
end

function UIPaintBlockColorant:setProgressMax(max)
    self.progressMax = max
    self.bar:setProgressMax(max)

    if max == 0 then
        self:setEnabled(false)
        return -- no need to disable the buttons, already done
    end

    self:updateButtons()
end

function UIPaintBlockColorant:updateButtons()
    if not self.enabled then
        self.btn1.enable = false
        self.btn1.enable = false
        return
    end
    self.btn1.enable = not (self.progressMax - self.progress < 1)
    self.btn2.enable = not (self.progressMax - self.progress < 10)
end

---
--- A colorant block widget with two buttons.
---
--- Both buttons have the same id: btn.internal = "COLOR".
--- They can be distinguished by btn.internalColorParts param which is 1 for btn1 and 10 for btn2.
---
---@param x number The x coordinate of the block
---@param y number The y coordinate of the block
---@param width number The block's width
---@param height number The block's height. NOT USED: the widget effectively has wrap_content height
---@param title string The blocks title
---@param btnInternalColor string The color's internal name (e.g. "cyan")
---@param btnClickTarget any
---@param btnOnClick function The callback function to handle buttons' clicks
---@param progressColor table The color for the block's UIPaintProgressBar represented with a table { r=0-1, g=0-1, b=0-1 }
function UIPaintBlockColorant:new(x, y, width, height, title, btnInternalColor, btnClickTarget, btnOnClick, progressColor)
    local o = {}
    o = ISUIElement:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.x = x
    o.y = y
    o.width = width
    o.height = height -- 0
    o.title = title
    o.btnInternalColor = btnInternalColor
    o.btnClickTarget = btnClickTarget
    o.btnOnClick = btnOnClick
    o.progressColor = progressColor

    o.enabled = true

    o.progressMax = 0
    o.progress = 0

    o.backgroundColor = { r = 0, g = 0, b = 0, a = 0.3 }
    o.overlayColor = { r = 0, g = 0, b = 0, a = 0.5 } -- disabled overlay color
    o.borderColor = { r = 0.4, g = 0.4, b = 0.4, a = 1 } -- block's border color
    o.buttonBorderColor = { r = 0.7, g = 0.7, b = 0.7, a = 0.5 } -- buttons' and progress bar's borders color

    return o
end
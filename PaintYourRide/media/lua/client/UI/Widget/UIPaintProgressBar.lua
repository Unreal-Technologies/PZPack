require "ISUI/ISUIElement"

UIPaintProgressBar = ISUIElement:derive("UIPaintProgressBar")

function UIPaintProgressBar:initialise()
    ISUIElement.initialise(self)
end

function UIPaintProgressBar:setProgress(progress)
    self.progress = progress
end

function UIPaintProgressBar:getProgress()
    return self.progress
end

function UIPaintProgressBar:setProgressMax(max)
    self.progressMax = max
end

function UIPaintProgressBar:getProgressMax()
    return self.progressMax
end

function UIPaintProgressBar:prerender()
    local text = self.progress .. "/" .. self.progressMax
    local textHeight = getTextManager():MeasureStringY(UIFont.Small, text)

    local f = self.progress / self.progressMax
    if f < 0.0 then f = 0.0 end
    if f > 1.0 then f = 1.0 end

    local done = math.floor(self.width * f)
    if f > 0 then done = math.max(done, 1) end

    self:drawRect(0, 0, done, self.height, 0.7, self.color.r, self.color.g, self.color.b)
    local bg = { r = 0.15, g = 0.15, b = 0.15, a = 1.0 }
    self:drawRect(0 + done, 0, self.width - done, self.height, bg.a, bg.r, bg.g, bg.b)
    self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);

    self:drawTextCentre(self.progress .. "/" .. self.progressMax, self.width / 2, (self.height - textHeight) / 2, self.textColor.r, self.textColor.g, self.textColor.b, self.textColor.a, UIFont.Small)
end

function UIPaintProgressBar:setBorderColor(r, g, b, a)
    self.borderColor.r = r
    self.borderColor.g = g
    self.borderColor.b = b
    self.borderColor.a = a
end

function UIPaintProgressBar:setTextColor(r, g, b, a)
    self.textColor.r = r
    self.textColor.g = g
    self.textColor.b = b
    self.textColor.a = a
end

function UIPaintProgressBar:setEnabled(enabled)
    self.enabled = enabled
    if not self.borderColorEnabled then
        self.borderColorEnabled = { r = self.borderColor.r, g = self.borderColor.g, b = self.borderColor.b, a = self.borderColor.a }
    end
    if not self.textColorEnabled then
        self.textColorEnabled = { r = self.textColor.r, g = self.textColor.g, b = self.textColor.b, a = self.textColor.a }
    end
    if enabled then
        self:setBorderColor(self.borderColorEnabled.r, self.borderColorEnabled.g, self.borderColorEnabled.b, self.borderColorEnabled.a)
        self:setTextColor(self.textColorEnabled.r, self.textColorEnabled.g, self.textColorEnabled.b, self.textColorEnabled.a)
    else
        self:setBorderColor(0.7, 0.1, 0.1, 0.7)
        self:setTextColor(0.3, 0.3, 0.3, 1)
    end
end

---
--- A progress bar widget.
---
---@param x number The x coordinate
---@param y number The y coordinate
---@param width number The widget's width
---@param height number The widget's height
---@param progressColor table The color of progress line represented with a table { r=0-1, g=0-1, b=0-1 }
---@param progressMax number The maximum progress (if not specified then 100)
function UIPaintProgressBar:new(x, y, width, height, progressColor, progressMax)
    local o = {}
    o = ISUIElement:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.x = x
    o.y = y
    o.width = width
    o.height = height
    o.color = progressColor or { r = 0, g = 0.6, b = 0 }
    o.progressMax = progressMax or 100
    o.progress = 0

    o.enabled = true

    o.borderColor = { r = 0.7, g = 0.7, b = 0.7, a = 0.5 }
    o.textColor = { r = 1, g = 1, b = 1, a = 1 }

    return o
end
require "ISUI/ISUIElement"

UIPaintPreviewImage = ISUIElement:derive("UIPaintPreviewImage")

function UIPaintPreviewImage:initialise()
    ISUIElement.initialise(self)
    if self.texture then
        self.scale = self:getHeight() / self.texture:getHeight()
        --self:setHeight(self.texture:getHeight())
    end
end

function UIPaintPreviewImage:render()
    -- TODO: check this block. Not needed
    if self.texture then
        self.scale = self:getHeight() / self.texture:getHeight()
        --self:setHeight(self.texture:getHeight())
    end

    if self.texture and self.textureOverlay then
        local x = (self:getWidth() - self.texture:getWidth() * self.scale) / 2
        --   drawTextureScaledUniform(texture, x, y, scale, a, r, g, b)
        self:drawTextureScaledUniform(self.texture, x, 0, self.scale, 1, 1, 1, 1)
        self:drawTextureScaledUniform(self.textureOverlay, x, 0, self.scale, 1, self.overlayColor.r, self.overlayColor.g, self.overlayColor.b)
    end
end

function UIPaintPreviewImage:setTexture(texture)
    self.texture = getTexture(texture)
    self.scale = self:getHeight() / self.texture:getHeight()
end

function UIPaintPreviewImage:setTextureOverlay(texture)
    self.textureOverlay = getTexture(texture)
end

function UIPaintPreviewImage:setOverlayColor(r, g, b)
    self.overlayColor.r = r
    self.overlayColor.g = g
    self.overlayColor.b = b
end

function UIPaintPreviewImage:new(x, y, width, height, texture, textureOverlay, overlayColor)
    local o = {}
    o = ISUIElement:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.x = x
    o.y = y
    o.texture = getTexture(texture)
    o.textureOverlay = getTexture(textureOverlay)
    o.scale = 1
    o.overlayColor = overlayColor or { r = 1, g = 1, b = 1 }
    return o
end
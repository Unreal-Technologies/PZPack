-- ---------------------------------------
-- Taken from: https://github.com/EmmanuelOga/columns/blob/master/utils/color.lua
-- ---------------------------------------

ColorUtils = {}

---
--- Converts a CMYK color value to RGB. Conversion formula
--- adapted from https://www.101computing.net/cmyk-to-rgb-conversion-algorithm/.
--- Assumes c, m, y and k are contained in the set [0, 100] and
--- returns r, g, and b in the set [0, 1].
---@param c number The cyan color value
---@param m number The magenta color value
---@param y number The yellow color value
---@param k number The black color value
---@return number The RGB representation
function ColorUtils.cmykToRgb(c, m, y, k)
    local r = (1 - c / 100) * (1 - k / 100)
    local g = (1 - m / 100) * (1 - k / 100)
    local b = (1 - y / 100) * (1 - k / 100)
    return r, g, b
end

---
--- Converts an RGB color value to CMYK. Conversion formula
--- adapted from https://www.101computing.net/cmyk-to-rgb-conversion-algorithm/.
--- Assumes r, g and b are contained in the set [0, 255] and
--- returns c, m, y and k in the set [0, 1].
---@param r number The red color value
---@param g number The green color value
---@param b number The blue color value
---@return number The CMYK representation
function ColorUtils.rgbToCmyk(r, g, b)
    local k = 1 - math.max(r, g, b) / 255
    local c = (1 - r / 255 - k) / (1 - k)
    local m = (1 - g / 255 - k) / (1 - k)
    local y = (1 - b / 255 - k) / (1 - k)

    return c, m, y, k
end

---
--- Converts an RGB color value to HSV. Conversion formula
--- adapted from http://en.wikipedia.org/wiki/HSV_color_space.
--- Assumes r, g, and b are contained in the set [0, 1] and
--- returns h, s, and v in the set [0, 1].
---@param r number The red color value
---@param g number The green color value
---@param b number The blue color value
---@param a number The alpha
---@return number The HSV representation
function ColorUtils.rgbToHsv(r, g, b)
    r, g, b = r, g, b
    local max, min = math.max(r, g, b), math.min(r, g, b)
    local h, s, v
    v = max

    local d = max - min
    if max == 0 then s = 0 else s = d / max end

    if max == min then
        h = 0 -- achromatic
    else
        if max == r then
            h = (g - b) / d
            if g < b then h = h + 6 end
        elseif max == g then h = (b - r) / d + 2
        elseif max == b then h = (r - g) / d + 4
        end
        h = h / 6
    end

    return h, s, v
end

--- Converts an HSV color value to RGB. Conversion formula
--- adapted from http://en.wikipedia.org/wiki/HSV_color_space.
--- Assumes h, s, and v are contained in the set [0, 1] and
--- returns r, g, and b in the set [0, 1].
---@param h number The hue
---@param s number The saturation
---@param v number The value
---@return number The RGB representation
function ColorUtils.hsvToRgb(h, s, v)
    local r, g, b

    local i = Math.floor(h * 6);
    local f = h * 6 - i;
    local p = v * (1 - s);
    local q = v * (1 - f * s);
    local t = v * (1 - (1 - f) * s);

    i = i % 6

    if i == 0 then r, g, b = v, t, p
    elseif i == 1 then r, g, b = q, v, p
    elseif i == 2 then r, g, b = p, v, t
    elseif i == 3 then r, g, b = p, q, v
    elseif i == 4 then r, g, b = t, p, v
    elseif i == 5 then r, g, b = v, p, q
    end

    return r, g, b
end

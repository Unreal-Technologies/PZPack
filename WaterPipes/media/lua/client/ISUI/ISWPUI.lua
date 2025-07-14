require "ISUI/ISPanelJoypad"

ISWPUI = ISPanelJoypad:derive("ISWPUI");

function ISWPUI:initialise()
    ISPanelJoypad.initialise(self);

    self.ok = ISButton:new((self:getWidth() - 100) / 2, 480, 100, 24, getText("UI_Ok"), self, ISWPUI.onClick);
    self.ok.internal = "OK"
    self.ok:initialise()
    self.ok:instantiate()
    self.ok.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.ok)

    self:setHeight(self.ok:getBottom() + 5)

    self:insertNewLineOfButtons(self.ok)
end

function ISWPUI:destroy()
    UIManager.setShowPausedMessage(true);
    self:setVisible(false);
    self:removeFromUIManager();
end

function ISWPUI:onClick(button)
    if button.internal == "OK" then
        self:destroy();
    end
end

function ISWPUI:prerender()

    local globalModData = GetWaterPipingModData()
    
    self.backgroundColor.a = 0.8
    -- self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
    -- self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);

    local bound_l = self.character:getX() - 25
    local bound_r = self.character:getX() + 25
    local bound_u = self.character:getY() - 25
    local bound_d = self.character:getY() + 25
    local resolution = 12

    local cnt = 0

    for k, v in pairs(globalModData.DPipes) do
        if v.x >= bound_l and v.x <= bound_r and v.y >= bound_u and v.y <= bound_d then
            local r_x = (v.x - bound_l) * resolution
            local r_y = (v.y - bound_u) * resolution

            -- self:drawRect(10 + r_x, 10 + r_y, resolution, resolution, 1, 0, 1, 0)
            self:drawRectBorder(10 + r_x, 30 + r_y, resolution, resolution, 1, 0, 1, 1);
        end
        cnt = cnt +1
    end

    for k, v in pairs(globalModData.DBarrels) do
        if v.x >= bound_l and v.x <= bound_r and v.y >= bound_u and v.y <= bound_d then
            local r_x = (v.x - bound_l) * resolution
            local r_y = (v.y - bound_u) * resolution

            -- self:drawRect(10 + r_x, 10 + r_y, resolution, resolution, 1, 0, 1, 0)
            self:drawRectBorder(10 + r_x, 30 + r_y, resolution, resolution, 1, 1, 0, 1);
        end
    end

    for k, v in pairs(globalModData.DWorkingPumps) do
        if v.x >= bound_l and v.x <= bound_r and v.y >= bound_u and v.y <= bound_d then
            local r_x = (v.x - bound_l) * resolution
            local r_y = (v.y - bound_u) * resolution

            -- self:drawRect(10 + r_x, 10 + r_y, resolution, resolution, 1, 0, 1, 0)
            self:drawRectBorder(10 + r_x, 30 + r_y, resolution, resolution, 1, 1, 0, 0);
        end
    end

    -- self:drawRect(10 + 100 * resolution, 10 + 100 * resolution, resolution, resolution, 1, 1, 0, 0)
    self:drawRectBorder(10 + 25 * resolution - 7, 30 + 25 * resolution - 7, resolution, resolution, 1, 1, 1, 1);

    self:drawTextCentre("Pipe Network (" .. cnt .. " pipes)", self:getWidth()/2, 10, 1, 1, 1, 1, UIFont.Small);
end

function ISWPUI:render()
end

function ISWPUI:override(newval)
end

function ISWPUI:update()
end

function ISWPUI:updateNow()
end

function ISWPUI:onGainJoypadFocus(joypadData)
    ISPanelJoypad.onGainJoypadFocus(self, joypadData)
    self.joypadIndexY = 1
    self.joypadIndex = 1
    self.joypadButtons = self.joypadButtonsY[self.joypadIndexY]
    self.joypadButtons[self.joypadIndex]:setJoypadFocused(true)
end

function ISWPUI:onJoypadDown(button)
    ISPanelJoypad.onJoypadDown(self, button)
    if button == Joypad.BButton then
        self:onClick(self.ok)
    end
end

function ISWPUI:new(x, y, width, height, character)
    local o = {}
    o = ISPanelJoypad:new(x, y, width, height);
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.name = nil;
    o.backgroundColor = {r=0, g=0, b=0, a=0.5};
    o.borderColor = {r=0.4, g=0.4, b=0.4, a=1};
    o.width = width;
    o.height = height;
    o.anchorLeft = true;
    o.anchorRight = true;
    o.anchorTop = true;
    o.anchorBottom = true;

    local player = character:getPlayerNum()
    if y == 0 then
        o.y = 90
    end
    if x == 0 then
        o.x = (getPlayerScreenWidth(player) - width) / 2
        o:setX(o.x + 600)
    end

    return o;
end


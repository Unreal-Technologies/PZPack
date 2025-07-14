require "ISUI/ISPanelJoypad"

ISWPSprinkler = ISPanelJoypad:derive("ISWPSprinkler");

function ISWPSprinkler:initialise()
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

function ISWPSprinkler:destroy()
    UIManager.setShowPausedMessage(true);
    self:setVisible(false);
    self:removeFromUIManager();
end

function ISWPSprinkler:onClick(button)
    if button.internal == "OK" then
        self:destroy();
    end
end

function ISWPSprinkler:prerender()

    -- self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);

    local nbr = 0
    for k, p in pairs(self.particles) do

        local v = p.v + nbr
        local i = self.raindrop - p.lag
        local theta = p.theta + self.oscilator
        local c = math.abs((math.sin((self.oscilator)*3.1415/180)))

        if i >= 0 then
            local v_x = math.floor(v * c * math.sin(theta*3.1415/180) * i)
            local v_y = math.floor(v * math.cos(theta*3.1415/180) * i - i ^ 2)

            -- self:drawRectBorder(10, 28 + self.raindrop, 2, 2, 0.4, 1, 1, 1)
            -- self:drawRectBorder(10, 29 + self.raindrop, 2, 2, 0.6, 1, 1, 1)
            self:drawRectBorder(10 + v_x, 10 - v_y, 4, 4, 0.8, 0.8, 0.8, 1)
        end
    end

    self.raindrop = self.raindrop + 1
    if self.raindrop > 24 then 
        self.raindrop = 0
        self.oscilator = self.oscilator + self.oscilatorDir
        if self.oscilator > 45 then self.oscilatorDir = -5 end
        if self.oscilator < -45 then self.oscilatorDir = 5 end
    end
    
end

function ISWPSprinkler:render()
end

function ISWPSprinkler:override(newval)
end

function ISWPSprinkler:update()
end

function ISWPSprinkler:updateNow()
end

function ISWPSprinkler:onGainJoypadFocus(joypadData)
    ISPanelJoypad.onGainJoypadFocus(self, joypadData)
    self.joypadIndexY = 1
    self.joypadIndex = 1
    self.joypadButtons = self.joypadButtonsY[self.joypadIndexY]
    self.joypadButtons[self.joypadIndex]:setJoypadFocused(true)
end

function ISWPSprinkler:onJoypadDown(button)
    ISPanelJoypad.onJoypadDown(self, button)
    if button == Joypad.BButton then
        self:onClick(self.ok)
    end
end

function ISWPSprinkler:new(x, y, width, height, character, square)
    local o = {}
    o = ISPanelJoypad:new(0, 0, 200, 200);
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.name = nil;
    o.backgroundColor = {r=0, g=0, b=0, a=0.5};
    o.borderColor = {r=0.4, g=0.4, b=0.4, a=1};
    o.width = 200;
    o.height = 200;
    o.anchorLeft = true;
    o.anchorRight = true;
    o.anchorTop = true;
    o.anchorBottom = true;
    o.raindrop = 0
    o.oscilator = 0
    o.oscilatorDir = 10

    local particles = {}
    table.insert(particles, {v=30, theta=-5, lag=0})
    table.insert(particles, {v=26, theta=0, lag=0})
    table.insert(particles, {v=25, theta=2, lag=2})
    table.insert(particles, {v=18, theta=5, lag=3})

    table.insert(particles, {v=25, theta=-7, lag=6})
    table.insert(particles, {v=23, theta=1, lag=6})
    table.insert(particles, {v=19, theta=3, lag=7})
    table.insert(particles, {v=8, theta=4, lag=9})

    o.particles = particles

    local player = character:getPlayerNum()
    if y == 0 then
        o.y = getPlayerScreenHeight(player) - 200 / 2
        o:setY(o.y)
    end
    if x == 0 then
        o.x = (getPlayerScreenWidth(player) - 200) / 2
        o:setX(o.x)
    end

    return o;
end


require "ISUI/ISCollapsableWindow"
require "wp_vsquare"

ISWaterPumpInfoWindow = ISCollapsableWindow:derive("ISWaterPumpInfoWindow")
ISWaterPumpInfoWindow.windows = {}

function ISWaterPumpInfoWindow:createChildren()
	ISCollapsableWindow.createChildren(self)
	self.panel = ISToolTip:new()
	self.panel.followMouse = false
	self.panel:initialise()
	self:setObject(self.object)
	self:addView(self.panel)
end

function ISWaterPumpInfoWindow:update()
	ISCollapsableWindow.update(self)
	
	self.panel.maxLineWidth = 400
	self.panel.description = ISWaterPumpInfoWindow.getRichText(self.object, true);

	if self:getIsVisible() and (not self.object or self.object:getObjectIndex() == -1) then
		if self.joyfocus then
			self.joyfocus.focus = nil
			updateJoypadFocus(self.joyfocus)
		end
		self:removeFromUIManager()
		return
	end

	-- if self.fuel ~= self.object:getFuel() or self.condition ~= self.object:getCondition() then
	-- 	self:setObject(self.object)
	-- end
	self:setWidth(self.panel:getWidth())
	self:setHeight(self:titleBarHeight() + self.panel:getHeight())
end

function ISWaterPumpInfoWindow:setObject(object)
	self.object = object
	self.panel:setName("Pump Info")
	self.panel:setTexture(object:getTextureName())
--	self.panel.description = ISWaterPumpInfoWindow.getRichText(object, true)
end

function ISWaterPumpInfoWindow.getRichText(object)

    local pumpMaxWater = SandboxVars.Plumbing.PumpMaxWater
    if not pumpMaxWater then pumpMaxWater = 12 end

    local filterStatus = 0
    local efficiencyStatus = 100
    local vpump = Vsquare.GetPump(object:getX(), object:getY(), object:getZ())
    if vpump then
        filterStatus = vpump['f']
        efficiencyStatus = vpump['ef']
		freshWaterSource = vpump['fr']
		fuelSource = vpump['fu']
    else
        printd("---- VPUMP NOT FOUND ----")
    end
    if not filterStatus then filterStatus = 0 end
    if not efficiencyStatus then efficiencyStatus = 100 end
    local efficiencyFlow = math.ceil(efficiencyStatus * pumpMaxWater * 6 / 100)

    local d = ""

    d = d .. "<RGB:1,1,1>" .. getText("IGUI_WP_Status") .. ": <SPACE>"
    if object:isActivated() then
        d = d .. getTextColor(100)
        d = d .. "" .. getText("IGUI_WP_Active") .. " <LINE>"
    else
        d = d .. getTextColor(0)
        d = d .. "" .. getText("IGUI_WP_Inactive") .. " <LINE>"
    end

    d = d .. "<RGB:1,1,1>" .. getText("IGUI_WP_Electricity") .. ": <SPACE>"
    if object:getSquare():haveElectricity() or getWorld():isHydroPowerOn() then
        d = d .. getTextColor(100)
        d = d .. "" .. getText("IGUI_WP_Available") .. " <LINE>"
    else
        d = d .. getTextColor(0)
        d = d .. "" .. getText("IGUI_WP_Unavailable") .. " <LINE>"
    end

    d = d .. "<RGB:1,1,1>" .. getText("IGUI_WP_ConnectedSource") .. ": <SPACE>"
	if freshWaterSource then
		d = d .. "<RGB:0,1,1> " .. getText("IGUI_WP_Water") .. " <LINE>"
	elseif fuelSource then
		d = d .. "<RGB:1,1,0> " .. getText("IGUI_WP_Gas") .. " <LINE>"
	else
		d = d .. "<RGB:0.54,0.42,0.35> " .. getText("IGUI_WP_Water") .. " (" .. getText("Tooltip_tainted") .. ")" .. " <LINE>"
	end
    
    d = d .. "<RGB:1,1,1>" .. getText("IGUI_WP_Efficiency") .. ": <SPACE>"
    d = d .. getTextColor(efficiencyStatus)
    d = d .. string.format("%.2f%%", efficiencyStatus) .. " (" .. efficiencyFlow .. "L/h) <LINE>"

    d = d .. "<RGB:1,1,1>" .. getText("IGUI_WP_Filter") .. ": <SPACE>"
    d = d .. getTextColor(filterStatus)
    d = d .. string.format("%.2f%%", filterStatus) .. " <LINE>"

    d = d .. " <LINE>"

    d = d .. "<RGB:1,1,1>" .. getText("IGUI_WP_PumpInfoText")
    
	return d
end

function ISWaterPumpInfoWindow:onGainJoypadFocus(joypadData)
	self.drawJoypadFocus = true
end

function ISWaterPumpInfoWindow:onJoypadDown(button)
	if button == Joypad.BButton then
		self:removeFromUIManager()
		setJoypadFocus(self.playerNum, nil)
	end
end

function ISWaterPumpInfoWindow:close()
	self:removeFromUIManager()
end

function ISWaterPumpInfoWindow:new(x, y, character, object)
	local width = 320
	local height = 16 + 64 + 16 + 16
	local o = ISCollapsableWindow:new(x, y, width, height)
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.playerNum = character:getPlayerNum()
	o.object = object
	o:setResizable(false)
	return o
end

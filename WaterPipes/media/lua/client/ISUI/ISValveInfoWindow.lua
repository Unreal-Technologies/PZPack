require "ISUI/ISCollapsableWindow"
require "wp_vsquare"

ISValveInfoWindow = ISCollapsableWindow:derive("ISValveInfoWindow")
ISValveInfoWindow.windows = {}

function ISValveInfoWindow:createChildren()
	ISCollapsableWindow.createChildren(self)
	self.panel = ISToolTip:new()
	self.panel.followMouse = false
	self.panel:initialise()
	self:setObject(self.object)
	self:addView(self.panel)
end

function ISValveInfoWindow:update()
	ISCollapsableWindow.update(self)
	
	self.panel.maxLineWidth = 200
	self.panel.description = ISValveInfoWindow.getRichText(self.object, true);

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
	local pw = self.panel:getWidth()
	local ph = self.panel:getHeight()

	if pw == 0 then pw = 200 end
	if ph == 0 then ph = 300 end


	self:setWidth(pw)
	self:setHeight(self:titleBarHeight() + ph)
	-- self.isCollapsed = false
end

function ISValveInfoWindow:setObject(object)
	self.object = object
	self.panel:setName("Valve Info")
	self.panel:setTexture(object:getTextureName())
--	self.panel.description = ISValveInfoWindow.getRichText(object, true)
end

function ISValveInfoWindow.getValveName(b)
	if b then return getText("ContextMenu_WP_ValveModeOne") else return getText("ContextMenu_WP_ValveModeTwo") end
end

function ISValveInfoWindow.getRichText(object)

	local sprite = object:getSprite()
    local spriteName = sprite:getName()
	
	local x = object:getX()
	local y = object:getY()
	local z = object:getZ()
	local valve = Vsquare.GetPipe(x, y, z)
	local vs = decToBooleans(valve.vs)

	local d = ""

	valves = {}
	table.insert(valves, {notsprite="industry_02_30", vs=vs[1], name=getText("ContextMenu_WP_ChangeWest"), coords={x=-1, y=0}})
	table.insert(valves, {notsprite="industry_02_31", vs=vs[2], name=getText("ContextMenu_WP_ChangeSouth"), coords={x=0, y=1}})
	table.insert(valves, {notsprite="industry_02_29", vs=vs[3], name=getText("ContextMenu_WP_ChangeNorth"), coords={x=0, y=-1}})
	table.insert(valves, {notsprite="industry_02_28", vs=vs[4], name=getText("ContextMenu_WP_ChangeEast"), coords={x=1, y=0}})

	for k, v in pairs(valves) do

		if spriteName ~= v.notsprite then
			local vpipe = Vsquare.GetPipe(x + v.coords.x, y + v.coords.y, z)
			local f = 0
			if vpipe then
				if vpipe.f and vpipe.f > 0 then
					f = vpipe.f * 6
				else
					f = vpipe.w * 6
				end
			end

			d = d .. "<RGB:1,1,1> " .. v.name .. " " .. getText("ContextMenu_WP_Valve") .. ": <LINE> "
			d = d .. getText("ContextMenu_WP_Type") .. ": " .. ISValveInfoWindow.getValveName(v.vs)
			d = d .. " <SPACE> " .. getText("ContextMenu_WP_Flow") .. ": " .. getTextColor(f) .. "<SPACE>" .. tostring(f) .. "L/h <LINE> <LINE> "
		end

	end
	return d
end

function ISValveInfoWindow:onGainJoypadFocus(joypadData)
	self.drawJoypadFocus = true
end

function ISValveInfoWindow:onJoypadDown(button)
	if button == Joypad.BButton then
		self:removeFromUIManager()
		setJoypadFocus(self.playerNum, nil)
	end
end

function ISValveInfoWindow:close()
	self:removeFromUIManager()
end

function ISValveInfoWindow:new(x, y, character, object)
	local width = 320
	local height = 16 + 64 + 16 + 16
	local o = ISCollapsableWindow:new(x, y, width, height)
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.playerNum = character:getPlayerNum()
	o.object = object
	o.isCollapsed = false
	o:setResizable(false)
	return o
end

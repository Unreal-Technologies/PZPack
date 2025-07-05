-- This file gets loaded third


if (not isClient()) then
	return
end


local TextManager = getTextManager()
local FONT_HGT_SMALL = TextManager:getFontHeight(UIFont.Small)
local FONT_HGT_MEDIUM = TextManager:getFontHeight(UIFont.Medium)
local entryBoxWidth = 24 + 2


require("ISUI/ISPanel")
PlayersOnMapUI = ISPanel:derive("PlayersOnMapUI")
PlayersOnMapUI.instance = nil


function PlayersOnMapUI:initialise()
	ISPanel.initialise(self)
	self:addAllOptions()
end


function PlayersOnMapUI:CreateButton(text, callback)
	local button = ISButton:new(self:getWidth() / 2 - 50, self.posY, 100, 25, text, self, callback)
	button:initialise()
	button.borderColor = {r=1, g=1, b=1, a=0.1}
	self:addChild(button)

	self.posY = self.posY + 25
end


function PlayersOnMapUI.onEntryTextChange(item, callback)
	local value = tonumber(item:getInternalText()) or -1

	if (value < item.minimumValue) then
		item:setText("" .. item.minimumValue)
		value = item.minimumValue
	elseif (value > item.maximumValue) then
		item:setText("" .. item.maximumValue)
		value = item.maximumValue
	end

	callback(value)
end


function PlayersOnMapUI:CreateHeader(text)
	local textWidth = TextManager:MeasureStringX(UIFont.Medium, text)
	local x = (self:getWidth() / 2) + (textWidth / 2)

	local label = ISLabel:new(x, self.posY, FONT_HGT_MEDIUM, text, 1, 1, 1, 1, UIFont.Medium)
	label:initialise()
	self:addChild(label)

	self.lastHeaderWidth = textWidth
	self.posY = self.posY + FONT_HGT_MEDIUM
end


function PlayersOnMapUI:CreateTickBox(text, default, callback, tooltip)
	local textWidth = TextManager:MeasureStringX(UIFont.Small, text)
	local x = (self:getWidth() / 2) - (self.lastHeaderWidth / 2) + 8

	local tickBox = ISTickBox:new(x, self.posY, 16 + 4 + textWidth, FONT_HGT_SMALL, "", 1, function(_,_,v)
		callback(v)
	end)

	tickBox.tooltip = tooltip
	tickBox.choicesColor = {r=1, g=1, b=1, a=1}
	tickBox:initialise()

	local opt = tickBox:addOption(text)
	tickBox:setSelected(opt, default)
	self:addChild(tickBox)

	self.posY = self.posY + FONT_HGT_SMALL + 8
end


function PlayersOnMapUI:CreateTextBox(text, default, min, max, callback)
	local labelWidth = TextManager:MeasureStringX(UIFont.Small, text)
	local x = (self:getWidth() / 2) - (self.lastHeaderWidth/2) + 8

	local textEntry = ISTextEntryBox:new("" .. default, x, self.posY + 2, 24 + 2, FONT_HGT_SMALL)
	textEntry:initialise()
	textEntry:instantiate()
	textEntry:setOnlyNumbers(true)
	textEntry.minimumValue, textEntry.maximumValue = min, max
	textEntry.onTextChange = function(item) self.onEntryTextChange(item, callback) end
	self:addChild(textEntry)

	local labelX = x + labelWidth + 24 + 2 + 4
	local label = ISLabel:new(labelX, self.posY + 4, FONT_HGT_SMALL, text, 1, 1, 1, 1, UIFont.Small) 
	label:initialise()
	self:addChild(label)

	self.posY = self.posY + FONT_HGT_SMALL + 8
end


function PlayersOnMapUI:CreateColorPicker(text, color, callback)
	local oldWidth = self:getWidth()
	local x = (oldWidth / 2) - (self.lastHeaderWidth/2) + 8
	local labelWidth = TextManager:MeasureStringX(UIFont.Small, text)
	local labelX = x + 16 + 4 + labelWidth

	local colorPicker = ISColorPicker:new(labelX + 24, 16)
	colorPicker:initialise()
	colorPicker.resetFocusTo = self
	colorPicker.onMouseDownOutside = function()
		self:setWidth(oldWidth)
		self:removeChild(colorPicker)
	end

	colorPicker:setInitialColor(ColorInfo.new(color.r, color.g, color.b, 1))
	colorPicker:setPickedFunc(function(button, color, mouseUp)
		if (mouseUp == false) then
			color.a = 1
			button.backgroundColor = color
			callback(color)
			self:setWidth(oldWidth)
		end
	end)

	local button = ISButton:new(x, self.posY + 2, 16, FONT_HGT_SMALL + 2, "", self, function()
		self:removeChild(colorPicker)
		self:addChild(colorPicker)
		self:setWidth(oldWidth + colorPicker:getWidth())
	end)

	button:initialise()
	button.borderColor = {r=1, g=1, b=1, a=0.1}
	button.backgroundColor = color
	colorPicker.pickedTarget = button
	self:addChild(button)

	local label = ISLabel:new(labelX, self.posY + 5, FONT_HGT_SMALL, text, 1, 1, 1, 1, UIFont.Small) 
	label:initialise()
	self:addChild(label)

	self.posY = self.posY + FONT_HGT_SMALL + 8
end


function PlayersOnMapUI:makeOptions()
	error("If this is seen then you have not set a function for creating your items before initializing the panel")
end


function PlayersOnMapUI:clearOptions()
	for _, child in pairs(self:getChildren()) do
		child:setVisible(false)
		child:removeFromUIManager()
	end
end


function PlayersOnMapUI:addAllOptions()
	self:makeOptions()

	local Width = 0
	for _,child in pairs(self:getChildren()) do
		if (child:isVisible()) then
			Width = math.max(Width, child:getWidth())
		end
	end

	self:setWidth(15 + Width + 15)

	self:clearOptions()
	self:makeOptions()
	self:setHeight(self.posY)
end


function PlayersOnMapUI:new(x, y, w, h)
	local o = ISPanel.new(self, x, y, w, h)
	o.backgroundColor.a = 0.8
	o.moveWithMouse = true
	PlayersOnMapUI.instance = o
	return o
end
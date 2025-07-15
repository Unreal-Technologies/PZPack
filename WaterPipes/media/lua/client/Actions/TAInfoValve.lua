require "TimedActions/ISBaseTimedAction"
require "ISUI/ISLayoutManager"

---@class TAInfoValve : ISBaseTimedAction
TAInfoValve = ISBaseTimedAction:derive("TAInfoValve")

function TAInfoValve:isValid()
	return self.object:getObjectIndex() ~= -1
end

function TAInfoValve:perform()
	local window = ISValveInfoWindow.windows[self.character]
	if window then
		window:setObject(self.object)
	else
		local x = getPlayerScreenLeft(self.playerNum)
		local y = getPlayerScreenTop(self.playerNum)
		local w = getPlayerScreenWidth(self.playerNum)
		local h = getPlayerScreenHeight(self.playerNum)
		window = ISValveInfoWindow:new(x + 50, y + 80, self.character, self.object)
		window:initialise()
		window:addToUIManager()
		ISValveInfoWindow.windows[self.character] = window
		if self.character:getPlayerNum() == 0 then
			ISLayoutManager.RegisterWindow('watervalve', ISCollapsableWindow, window)
		end
	end
	window:setVisible(true)
	window:addToUIManager()
	local joypadData = JoypadState.players[self.playerNum+1]
	if joypadData then
		joypadData.focus = window
	end
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function TAInfoValve:new(character, object)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.maxTime = 0
	o.stopOnWalk = true
	o.stopOnRun = true
	o.character = character
	o.playerNum = character:getPlayerNum()
	o.object = object
	return o
end

return TAInfoValve;
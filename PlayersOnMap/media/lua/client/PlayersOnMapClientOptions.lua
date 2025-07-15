-- This file gets loaded fifth


if (not isClient()) then
	return
end


local function translate(name)
	return getTextOrNull("UI_PlayersOnMap_Panel_" .. name) or name
end


local MOD_ID = PlayersOnMapUtil.MOD_ID
local Config = PlayersOnMap

Events.OnServerCommand.Add(function(module, command, data)
	if (module == MOD_ID) and (command == "ReceivedConfig") then
		Config = data
	end
end)


-- This will ensure the needed functions exist
require("PlayersOnMapUI")
require("ISUI/AdminPanel/ISAdminPanelUI")
require("ISUI/UserPanel/ISUserPanel")


local TextManager = getTextManager()
local FONT_HGT_SMALL = TextManager:getFontHeight(UIFont.Small)
local FONT_HGT_MEDIUM = TextManager:getFontHeight(UIFont.Medium)
local btnHgt = math.max(25, FONT_HGT_SMALL + 3 * 2)


local function makeAdminOptions(self)
	self.posY = 15
	self.lastHeaderWidth = 0

	self:CreateHeader( translate("Page_Name") )
	self.posY = self.posY + 25

	self:CreateHeader( translate("Main_Options") )
	self:CreateTickBox( translate("Enabled"),		  Config.Enabled, 	 	function(value) Config.Enabled 	 	  = value end)
	self:CreateTickBox( translate("Faction_Only"),    Config.FactionOnly,   function(value) Config.FactionOnly    = value end)
	self:CreateTickBox( translate("Admins_See_All"),  Config.AdminsSeeAll,  function(value) Config.AdminsSeeAll   = value end)
	self.posY = self.posY + 10

	self:CreateHeader( translate("World_Map_Options") )
	self:CreateTickBox( translate("Enabled"), 	  Config.WorldMap.Enabled, 	  function(value) Config.WorldMap.Enabled 	 = value end)
	self:CreateTickBox( translate("Show_Names"),  Config.WorldMap.ShowNames,  function(value) Config.WorldMap.ShowNames  = value end)
	self:CreateTickBox( translate("Show_Height"), Config.WorldMap.ShowHeight, function(value) Config.WorldMap.ShowHeight = value end)
	self:CreateTextBox( translate("Max_Dist"), 	  Config.WorldMap.MaximumDistance, 0, 9999, function(value) Config.WorldMap.MaximumDistance = value end)
	self.posY = self.posY + 10

	self:CreateHeader( translate("Mini_Map_Options") )
	self:CreateTickBox( translate("Enabled"), 	  Config.MiniMap.Enabled, 	 function(value) Config.MiniMap.Enabled 	= value end)
	self:CreateTickBox( translate("Show_Names"),  Config.MiniMap.ShowNames,  function(value) Config.MiniMap.ShowNames 	= value end)
	self:CreateTickBox( translate("Show_Height"), Config.MiniMap.ShowHeight, function(value) Config.MiniMap.ShowHeight 	= value end)
	self:CreateTextBox( translate("Max_Dist"), 	  Config.MiniMap.MaximumDistance, 0, 9999, function(value) Config.MiniMap.MaximumDistance = value end)
	self.posY = self.posY + 10

	self:CreateButton( translate("Save"), function()
		sendClientCommand(getPlayer(), MOD_ID, "SaveNewConfig", Config)
		self:setVisible(false)
		self:removeFromUIManager()
	end)

	self.posY = self.posY + 10
end


local function makeClientOptions(self)
	self.posY = 15
	self.lastHeaderWidth = 0

	self:CreateHeader( translate("Page_Name") )
	self.posY = self.posY + 25

	self:CreateHeader( translate("Main_Options") )
	self:CreateColorPicker( translate("Dot_Color"), 	 	PlayersOnMapClient.PlayerDotColor,	function(value) PlayersOnMapClient.PlayerDotColor = value end)
	self:CreateColorPicker( translate("Self_Dot_Color"), 	PlayersOnMapClient.SelfDotColor,	function(value) PlayersOnMapClient.SelfDotColor   = value end)
	self:CreateColorPicker( translate("Vehicle_Dot_Color"), PlayersOnMapClient.VehicleDotColor,	function(value) PlayersOnMapClient.VehicleDotColor= value end)
	self:CreateTickBox( translate("WIP_StackNametags"), 	PlayersOnMapClient.StackNameTags, 	function(value) PlayersOnMapClient.StackNameTags  = value end, translate("WIP_StackNametags_Tooltip"))
	self.posY = self.posY + 10

	self:CreateHeader( translate("World_Map_Options") )
	self:CreateTickBox( translate("Enabled"), 	  PlayersOnMapClient.WorldMap.Enabled, 	  function(value) PlayersOnMapClient.WorldMap.Enabled 	 = value end)
	self:CreateTickBox( translate("Show_Names"),  PlayersOnMapClient.WorldMap.ShowNames,  function(value) PlayersOnMapClient.WorldMap.ShowNames  = value end)
	self:CreateTickBox( translate("Show_Height"), PlayersOnMapClient.WorldMap.ShowHeight, function(value) PlayersOnMapClient.WorldMap.ShowHeight = value end)
	self.posY = self.posY + 10

	self:CreateHeader( translate("Mini_Map_Options") )
	self:CreateTickBox( translate("Enabled"), 	  PlayersOnMapClient.MiniMap.Enabled, 	 function(value) PlayersOnMapClient.MiniMap.Enabled 	= value end)
	self:CreateTickBox( translate("Show_Names"),  PlayersOnMapClient.MiniMap.ShowNames,  function(value) PlayersOnMapClient.MiniMap.ShowNames 	= value end)
	self:CreateTickBox( translate("Show_Height"), PlayersOnMapClient.MiniMap.ShowHeight, function(value) PlayersOnMapClient.MiniMap.ShowHeight 	= value end)
	self.posY = self.posY + 10

	self:CreateButton( translate("Save"), function()
		PlayersOnMapUtil.Util.WriteFile("ClientConfig.lua", PlayersOnMapClient)
		self:setVisible(false)
		self:removeFromUIManager()
	end)

	self.posY = self.posY + 10
end


local function addPlayersOnMapOption(self, makeOptionsOverride, prefix)
	local text = (prefix or "") .. getText("UI_PlayersOnMap_Panel_Page_Name")
	local btnWid = TextManager:MeasureStringX(UIFont.Small, text) + 6

	self.playersOnMapBtn = ISButton:new(0, 0, btnWid, btnHgt, text, self, function(button)
		if PlayersOnMapUI.instance then
			PlayersOnMapUI.instance:close()
		end

		local w = 15 + 164 + 15
		local h = 700
		local x = (getCore():getScreenWidth() / 2) - (w / 2)
		local y = getCore():getScreenHeight() - h

		local ui = PlayersOnMapUI:new(x, y, w, h)
		ui.makeOptions = makeOptionsOverride
		ui:initialise()
		ui:addToUIManager()
	end)

	-- Put `zzz` at the front so the reorganizing places it last
	self.playersOnMapBtn.internal = "zzzPLAYERSONMAP"
	self.playersOnMapBtn.borderColor = self.buttonBorderColor
	self.playersOnMapBtn:initialise()
	self:addChild(self.playersOnMapBtn)

	return self.playersOnMapBtn
end


local function FixAnyOverlaps(self)
	local maxAmountInColumn = 11 + 1
	local columnPos = 10
	local columns = 1
	local index = 1
	local gap = 70

	local btnWid = 0
	for _,child in pairs(self:getChildren()) do
		btnWid = math.max(btnWid, child:getWidth())
	end

	for _, child in pairs(self:getChildren()) do
		if (child.internal ~= "CANCEL") then
			if (index % maxAmountInColumn == 0) then
				columnPos = columnPos + btnWid + 20
				columns = columns + 1
				gap = 70
			end

			child:setWidth(btnWid)
			child:setX(columnPos)
			child:setY(gap)

			gap = gap + btnHgt + 5
			index = index + 1
		end
	end

	self:setWidth((10 + btnWid + 20) * columns - 20)
end


local old_ISAdminPanelUI_create = ISAdminPanelUI.create
function ISAdminPanelUI.create(self)
	old_ISAdminPanelUI_create(self)

	addPlayersOnMapOption(self, makeAdminOptions)
	FixAnyOverlaps(self)
end


local old_ISUserPanelUI_create = ISUserPanelUI.create
function ISUserPanelUI.create(self)
	old_ISUserPanelUI_create(self)

	local y = self.serverOptionBtn:getY() + btnHgt + 5

	if (isCoopHost()) then
		local btn = addPlayersOnMapOption(self, makeAdminOptions, "Admin ")
		btn:setX(10)
		btn:setY(y)
		btn:setWidth(150)
		y = y + btnHgt + 5
	end

	local btn = addPlayersOnMapOption(self, makeClientOptions)
	btn:setX(10)
	btn:setY(y)
	btn:setWidth(150)
end
local errorMagnifier = {}
errorMagnifier.parsedErrors = {} --{["error1"]=count1,["error2"]=count2}
errorMagnifier.parsedErrorsKeyed = {} --{[1]="error1",[2]="error2"}
errorMagnifier.errorCount = 0


function errorMagnifier.parseErrors()

	local errors = getLuaDebuggerErrors()
	if errors:size() <= 0 then return end
	if not errorMagnifier.Button then return end

	errorMagnifier.Button:setVisible(not errorMagnifier.hiddenMode)

	local newErrors = {}

	for i = errorMagnifier.errorCount+1,errors:size() do
		local str = errors:get(i-1)
		str = str:gsub("\t", "    ")
		---remove header noise, '---' is regex, hence the escapes
		str = str:gsub("%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-\n","")
		str = str:gsub("%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-\nSTACK TRACE\n%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-%-\n","")

		table.insert(newErrors,str)
	end

	for k,str in pairs(newErrors) do
		if type(str) == "string" then

			local causedBy = string.match(str,"Caused by: (.+)(... .-)")
			if causedBy then
				causedBy = "Caused by: "..causedBy.."\n"
				str = causedBy..str
			end

			local callFrame = string.match(str, "Callframe at: (.-)") and string.sub(str,1,string.len("Callframe at: "))=="Callframe at: "
			if callFrame then
				local entryBefore = newErrors[k-1]

				-- java bit looks nicer after
				if entryBefore then
					newErrors[k] = newErrors[k]..entryBefore
					newErrors[k-1] = false
				end
			end

			local attemptedIndex = string.match(str, "java.lang.RuntimeException: attempted index: (.-) of ")
			if attemptedIndex then --492/641 : attempted-header-java-header
				local entryBefore2 = newErrors[k-2]
				local entryBefore = newErrors[k-1]
				local entryAfter = newErrors[k+1]
				--attempted-header-java-X
				if entryAfter then
					newErrors[k+1] = false
				end
				if entryBefore then
					newErrors[k] = entryBefore..newErrors[k]
					newErrors[k-1] = false
				end
				if entryBefore2 then
					newErrors[k] = entryBefore2..newErrors[k]
					newErrors[k-2] = false
				end
			end

			local jE = string.match(str, "at se.krka.kahlua.vm.KahluaThread.luaMainloop%(KahluaThread.java:(.-)%)")
			if jE and (not attemptedIndex) and (not callFrame) then

				local entryBefore = newErrors[k-1]
				local entryAfter = newErrors[k+1]

				--676/900/973 : header-java-header
				if entryAfter then
					newErrors[k] = entryAfter..newErrors[k] --header-java
					newErrors[k+1] = false
				end

				if entryBefore and entryAfter and entryBefore == entryAfter then
					newErrors[k-1] = false
				end --else = --805 : java-header

			end

		end
	end


	for k,str in pairs(newErrors) do
		if type(str) == "string" then
			if not errorMagnifier.parsedErrors[str] then
				table.insert(errorMagnifier.parsedErrorsKeyed, str)
				errorMagnifier.parsedErrors[str] = 0
			end
			errorMagnifier.parsedErrors[str] = errorMagnifier.parsedErrors[str]+1
		end
	end

	errorMagnifier.errorCount = getLuaDebuggerErrors():size()

	--[[ UGLY PRINT OUT
	local pseudoKey = 0
	for error,count in pairs(errorMagnifier.parsedErrors) do
		pseudoKey = pseudoKey+1
		print("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\n UNIQUE ERROR: "..pseudoKey.."  count:"..count)
		print(" -- error: \n"..error.."\n\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
	end
	--]]
end


errorMagnifier.popUps = {}
errorMagnifier.popupPanel = ISPanelJoypad:derive("errorMagnifier.popupPanel")
errorMagnifier.popupPanel.currentErrorNum = 0
---@type ISButton
errorMagnifier.Button = false
errorMagnifier.currentlyViewing = 1
errorMagnifier.maxErrorsViewable = 6

--TODO: CHECK FLAGS ARE SET TO FALSE BEFORE RELEASE
errorMagnifier.spamErrorTest = false
errorMagnifier.showOnDebug = false


function errorMagnifier.popupPanel:render()
	if not self:isVisible() then return end
	---@type ISPanel
	local popup = self
	local font = UIFont.NewSmall
	local fontHeight = getTextManager():getFontHeight(font)

	local errorText = errorMagnifier.parsedErrorsKeyed[popup.currentErrorNum]

	local countOf = "x"..tostring(errorMagnifier.parsedErrors[errorText])
	local countOfWidth = getTextManager():MeasureStringX(font, countOf)

	local outOf = popup.currentErrorNum.." out of "..#errorMagnifier.parsedErrorsKeyed
	local outOfWidth = getTextManager():MeasureStringX(font, outOf)

	local errorBoundWidth, errorBoundHeight = popup:getWidth()-8, popup:getHeight()-8
	popup:setStencilRect(7, 3+fontHeight, errorBoundWidth-countOfWidth-4, errorBoundHeight-3-fontHeight)

	popup:drawText(errorText, 8, 3+fontHeight, 0.9, 0.9, 0.9, 0.9, font)
	popup:clearStencilRect()
	popup:drawText(countOf, popup:getWidth()-countOfWidth-8, 4, 0.9, 0.9, 0.9, 0.9, font)
	popup:drawText(outOf, popup:getWidth()-countOfWidth-8-outOfWidth-8, 4, 0.9, 0.9, 0.9, 0.6, font)
	popup:bringToTop()
	popup.clipboardButton:setAlwaysOnTop(true)
	popup.clipboardButton:bringToTop()

	if not isDesktopOpenSupported() then
		local text = "Errors logged in: "..Core.getMyDocumentFolder()..getFileSeparator().."console.txt".."\n Right click Error-Magnifier button to hide, visible through Menu."
		errorMagnifier.Button:drawTextRight(text, 0-(errorMagnifier.toConsole:getWidth()*2), 0-fontHeight/2, 0.7, 0.7, 0.7, 0.5, font)
	end
end


function errorMagnifier:getErrorOntoClipboard(popup)
	local errorText = errorMagnifier.parsedErrorsKeyed[popup.currentErrorNum]
	
	if errorText then
		Clipboard.setClipboard("`"..errorText.."`")
		print("Copied to clipboard!")
	end
end


function errorMagnifier:openLogsInExplorer()
	local cacheDir = Core.getMyDocumentFolder()
	if isDesktopOpenSupported() then showFolderInDesktop(cacheDir)
	else openUrl(cacheDir)
	end
end


function errorMagnifier.popupPanel:onMouseWheel(del)
	errorMagnifier.currentlyViewing = errorMagnifier.currentlyViewing-del
	errorMagnifier.currentlyViewing = math.min(#errorMagnifier.parsedErrorsKeyed-(errorMagnifier.maxErrorsViewable-1), errorMagnifier.currentlyViewing)
	errorMagnifier.currentlyViewing = math.max(1, errorMagnifier.currentlyViewing)
	errorMagnifier.errorPanelPopulate()
	return true
end


function errorMagnifier.errorPanelPopulate()
	if not errorMagnifier.Button then return end
	if #errorMagnifier.parsedErrorsKeyed <= 0 then return end
	for i=1, math.min(#errorMagnifier.parsedErrorsKeyed,errorMagnifier.maxErrorsViewable) do
		---@type ISPanel
		local popup = errorMagnifier.popUps["errorMessage"..i]
		popup.currentErrorNum = errorMagnifier.currentlyViewing-1+i
		popup:setVisible(true)
		popup.clipboardButton:setVisible(true)
	end
	errorMagnifier.toConsole:setVisible(true)
end


function errorMagnifier.hideErrorPanels()
	if #errorMagnifier.parsedErrorsKeyed <= 0 or (errorMagnifier.popUps.errorMessage1 and errorMagnifier.popUps.errorMessage1:isVisible()) then
		for i=1, errorMagnifier.maxErrorsViewable do
			errorMagnifier.popUps["errorMessage"..i]:setVisible(false)
			errorMagnifier.popUps["errorMessage"..i].clipboardButton:setVisible(false)
		end
		errorMagnifier.toConsole:setVisible(false)
		return true
	end
end


function errorMagnifier:EMButtonOnClick()
	local closed = errorMagnifier.hideErrorPanels()
	if not closed then errorMagnifier.errorPanelPopulate() end
end


function errorMagnifier.hideErrorMag()
	errorMagnifier.hideErrorPanels()
	errorMagnifier.Button:setVisible(false)
	errorMagnifier.hiddenMode = true
end


function errorMagnifier.onResolutionChange()
	local screenWidth, screenHeight = getCore():getScreenWidth(), getCore():getScreenHeight()

	local errorMagTexture = getTexture("media/textures/magGlassError.png")
	local eW, eH = errorMagTexture:getWidth(), errorMagTexture:getHeight()
	local x = (screenWidth - eW-4)
	local y = MainScreen.instance and MainScreen.instance.resetLua and MainScreen.instance.resetLua.y-2 or (screenHeight-eH-4)

	if errorMagnifier.Button then
		errorMagnifier.Button:setX(x)
		errorMagnifier.Button:setY(y)
	end
end


function errorMagnifier.setErrorMagnifierButton(forceShow)

	---@type Texture
	local errorMagTexture = getTexture("media/textures/magGlassError.png")
	local errorClipTexture = getTexture("media/textures/clipboardError.png")
	local errorLogTexture = getTexture("media/textures/consolelogErrorFolder.png")
	local eW, eH = errorMagTexture:getWidth(), errorMagTexture:getHeight()

	local screenWidth, screenHeight = getCore():getScreenWidth(), getCore():getScreenHeight()

	local fontHeight = getTextManager():getFontHeight(UIFont.NewSmall)
	local x = screenWidth - eW
	local y = screenHeight - (fontHeight*2) - eH - 30

	if getWorld():getGameMode() == "Multiplayer" then y = y-22 end

	errorMagnifier.Button = errorMagnifier.Button or ISButton:new(x, y+2, 22, 22, "", nil, errorMagnifier.EMButtonOnClick)

	errorMagnifier.Button.onRightMouseUp = errorMagnifier.hideErrorMag

	errorMagnifier.Button:setImage(errorMagTexture)
	errorMagnifier.Button:setDisplayBackground(false)
	errorMagnifier.Button:setAnchorLeft(false)
	errorMagnifier.Button:setAnchorTop(false)
	errorMagnifier.Button:setAnchorRight(true)
	errorMagnifier.Button:setAnchorBottom(true)
	errorMagnifier.Button:initialise()
	errorMagnifier.Button:addToUIManager()
	errorMagnifier.Button:setAlwaysOnTop(true)

	errorMagnifier.toConsole = errorMagnifier.toConsole or ISButton:new(x-30, y+2, 22, 22, "", nil, errorMagnifier.openLogsInExplorer)
	errorMagnifier.toConsole:setImage(errorLogTexture)
	errorMagnifier.toConsole:setDisplayBackground(false)
	errorMagnifier.toConsole:initialise()
	errorMagnifier.toConsole:addToUIManager()
	errorMagnifier.toConsole:setAlwaysOnTop(true)

	local screenSpan = screenHeight - errorMagnifier.Button:getHeight() - 8
	local popupHeight, popupWidth = (screenSpan/11)-4, screenWidth/3

	local popupX = screenWidth-popupWidth-8
	local popupY, popupYOffset = errorMagnifier.Button:getY()-8, popupHeight+4

	for i=1, errorMagnifier.maxErrorsViewable do
		errorMagnifier.popUps["errorMessage"..i] = errorMagnifier.popupPanel:new(popupX,popupY-(popupYOffset*i), popupWidth, popupHeight)
		---@type ISPanel
		local popup = errorMagnifier.popUps["errorMessage"..i]
		popup:initialise()
		popup:instantiate()
		popup:addToUIManager()

		popup.clipboardButton = ISButton:new(popupX+popupWidth-26, (popupY-(popupYOffset*i))+10+fontHeight, 22, 22, "", nil, function() errorMagnifier:getErrorOntoClipboard(popup) end )
		popup.clipboardButton:setImage(errorClipTexture)
		popup.clipboardButton:setDisplayBackground(false)
		popup.clipboardButton:initialise()
		popup.clipboardButton:addToUIManager()

		popup:setVisible(false)
		popup.clipboardButton:setVisible(false)
	end
	errorMagnifier.toConsole:setVisible(false)
	errorMagnifier.Button:setVisible(forceShow or (getDebug() and errorMagnifier.showOnDebug))
end


local MainScreen_onEnterFromGame = MainScreen.onEnterFromGame
function MainScreen:onEnterFromGame()
	MainScreen_onEnterFromGame(self)
	if #errorMagnifier.parsedErrorsKeyed > 0 then errorMagnifier.Button:setVisible(true) end
end

local MainScreen_onReturnToGame = MainScreen.onReturnToGame
function MainScreen:onReturnToGame()
	MainScreen_onReturnToGame(self)
	if errorMagnifier.hiddenMode then errorMagnifier.hideErrorMag() end
end


return errorMagnifier
---use require to access this
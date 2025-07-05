-- **************************************************
-- ██████  ██████   █████  ██    ██ ███████ ███    ██ 
-- ██   ██ ██   ██ ██   ██ ██    ██ ██      ████   ██ 
-- ██████  ██████  ███████ ██    ██ █████   ██ ██  ██ 
-- ██   ██ ██   ██ ██   ██  ██  ██  ██      ██  ██ ██ 
-- ██████  ██   ██ ██   ██   ████   ███████ ██   ████
-- **************************************************
-- ** Seek Excellence! Employ ME, not my Copycats. **
-- **************************************************

local createLabelMenu = nil
local squareMarker = nil
local isMultiplayer = false

local onGameStart = function()
    isMultiplayer = getWorld():getGameMode() == "Multiplayer"
end

Events.OnGameStart.Add(onGameStart)

local function tryCreateLabel(clickedSquare, button)
    if button.internal == "OK" then

        local parsedText = button.parent.entry:getText()
        local maxDistance = 21

        local match, number = parsedText:match("^(.-)%s--dist%s*(%d+)$")
        if match then
            local num = tonumber(number)
            if num < 0 then num = 1 end
            if num > 21 then num = 21 end
            maxDistance = num
            parsedText = match
        end

        local colorInfo = button.parent.currentColor
        local textColor = { r = colorInfo:getR(), g = colorInfo:getG(), b = colorInfo:getB() }

        clickedSquare:getModData().BBText = parsedText
        clickedSquare:getModData().BBTextColor = textColor or  { r = 1, g = 1, b = 1}
        clickedSquare:getModData().BBTextMaxDistance = maxDistance

        if isMultiplayer then clickedSquare:transmitModdata() end
    end

    squareMarker:remove()
    squareMarker = nil
    createLabelMenu = nil
end

local function openCreatingPanel(clickedSquare)
    if createLabelMenu then return end
    createLabelMenu = ISTextBox:new(0, 0, 400, 160, getText("IGUI_Name"), "", clickedSquare, tryCreateLabel)
    createLabelMenu:setMultipleLine(true)
    createLabelMenu:setNumberOfLines(3)
    createLabelMenu:addScrollBars()
    createLabelMenu:initialise()
    createLabelMenu:enableColorPicker()
    createLabelMenu:addToUIManager()
    squareMarker = getWorldMarkers():addGridSquareMarker("circle_center", "circle_only_highlight", clickedSquare, 1, 0.8, 0, true, 1)
end

local function tryRemoveLabel(clickedSquare)
    clickedSquare:getModData().BBText = nil
    clickedSquare:getModData().BBTextColor = nil
    clickedSquare:getModData().BBTextMaxDistance = nil
    if isMultiplayer then clickedSquare:transmitModdata() end
end

local onWorldContextMenu = function(player, context, worldobjects, test)
    if isMultiplayer and not (SandboxVars.WriteOnWorld.AdminsOnly == false or isAdmin() or getCore():getDebug()) then return end

    if clickedSquare then
        local modData = clickedSquare:getModData()
        if not modData then return end

        if not modData.BBText then
            context:addOptionOnTop(getText("ContextMenu_AddLabel"), clickedSquare, openCreatingPanel)
        elseif modData.BBText then
            context:addOptionOnTop(getText("ContextMenu_RemoveLabel"), clickedSquare, tryRemoveLabel)
        end
    end

    return context
end

Events.OnFillWorldObjectContextMenu.Add(onWorldContextMenu)
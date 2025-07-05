-- **************************************************
-- ██████  ██████   █████  ██    ██ ███████ ███    ██ 
-- ██   ██ ██   ██ ██   ██ ██    ██ ██      ████   ██ 
-- ██████  ██████  ███████ ██    ██ █████   ██ ██  ██ 
-- ██   ██ ██   ██ ██   ██  ██  ██  ██      ██  ██ ██ 
-- ██████  ██   ██ ██   ██   ████   ███████ ██   ████
-- **************************************************
-- ** Seek Excellence! Employ ME, not my Copycats. **
-- **************************************************

local labelRenderList = {}
local playerScreenLeft
local playerScreenTop

local onGameStart = function()
    local playerObj = getPlayer(); if not playerObj then return end
    local playerNum = playerObj:getPlayerNum(); if not playerNum then return end
    playerScreenLeft = getPlayerScreenLeft(playerNum)
    playerScreenTop = getPlayerScreenTop(playerNum)
end

Events.OnGameStart.Add(onGameStart)

local everyMinute = function()
    local playerObj = getPlayer(); if not playerObj then return end
    local playerNum = playerObj:getPlayerNum(); if not playerNum then return end
    local playerSq = playerObj:getSquare(); if not playerSq then return end

    local areaSize = 20
    local cell = getCell()
    local playerX, playerY = playerSq:getX(), playerSq:getY()

    for x = playerX - areaSize, playerX + areaSize do
        for y = playerY - areaSize, playerY + areaSize do
            local currSquare = cell:getGridSquare(x, y, playerSq:getZ())
            if currSquare then
                local modData = currSquare:getModData()
                if modData then
                    if modData.BBText and not Utils_WriteOnWorld.TableContains(labelRenderList, currSquare) then
                        table.insert(labelRenderList, currSquare)
                    end
                end
            end
        end
    end
end

local cachedSquares = {}

Events.EveryOneMinute.Add(everyMinute)

local function splitLines(inputText)
    local lines = {}
    for line in inputText:gmatch("([^<b>]+)") do
        table.insert(lines, line)
    end
    return lines
end

local function onPreUIDraw()
    local playerObj = getPlayer(); if not playerObj then return end
    local playerNum = playerObj:getPlayerNum(); if not playerNum then return end

    for i, square in ipairs(labelRenderList) do

        local modData = square:getModData()
        local maxDistance = modData.BBTextMaxDistance or 21
        if Utils_WriteOnWorld.DistanceBetween(playerObj, square) < maxDistance and modData.BBText then
            local sqX = square:getX()
            local sqY = square:getY()
            local sqZ = square:getZ()

            local x = isoToScreenX(playerNum, sqX, sqY, sqZ) - playerScreenLeft
            local y = isoToScreenY(playerNum, sqX, sqY, sqZ) - playerScreenTop
            local color = modData.BBTextColor or { r = 1, g = 1, b = 1 }

            local lines = splitLines(modData.BBText)
            for _, line in ipairs(lines) do
                getTextManager():DrawStringCentre(UIFont.Dialogue, x, y, line, color.r, color.g, color.b, 0.9)
                y = y + getTextManager():getFontFromEnum(UIFont.Dialogue):getLineHeight()
            end
        else
            table.insert(cachedSquares, i)
        end
    end

    for _, index in ipairs(cachedSquares) do
        table.remove(labelRenderList, index)
    end

    cachedSquares = {}
end

Events.OnPreUIDraw.Add(onPreUIDraw)
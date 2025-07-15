-- Made by bergemon (c) in 2025

require "TimedActions/ISWalkToTimedAction"

local function AddOption(_player, context, worldObjects)

    if not worldObjects or #worldObjects == 0 then
        return
    end

    AddTargetedTileOption(_player, context, worldObjects)
end

Events.OnPreFillWorldObjectContextMenu.Add(AddOption)

function AddTargetedTileOption(_player, context, worldObjects)
    -- Check if the player is performing an action that prevents interaction
    if string.match(getSpecificPlayer(_player):getAnimationDebug(),
        "State: player/actions")
            then return
    end

    local factory = Factory:new(worldObjects, _player)
    local action = factory:createAction()

    if not factory or not action then return end

    local contextOptionText = action:getContextOptionText()
    context:addOptionOnTop(contextOptionText, _player, OnGetItems, action)
end

function OnGetItems(_player, action)
    action:walkToObject()
    ISTimedActionQueue.add(action)
end
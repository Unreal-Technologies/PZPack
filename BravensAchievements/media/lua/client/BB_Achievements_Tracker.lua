-- **************************************************
-- ██████  ██████   █████  ██    ██ ███████ ███    ██ 
-- ██   ██ ██   ██ ██   ██ ██    ██ ██      ████   ██ 
-- ██████  ██████  ███████ ██    ██ █████   ██ ██  ██ 
-- ██   ██ ██   ██ ██   ██  ██  ██  ██      ██  ██ ██ 
-- ██████  ██   ██ ██   ██   ████   ███████ ██   ████
-- **************************************************

BB_Achievements_Tracker = {}

function ResetAchievementTrackers()
    BB_Achievements_Tracker.characterName = ""
    BB_Achievements_Tracker.itemsOnInv = 0
    BB_Achievements_Tracker.barricades = 0
    BB_Achievements_Tracker.timeAwake = 0
end

local function onInitGlobalModData()
    if getWorld():getGameMode() == "Multiplayer" and not isClient() then return end
    BB_Achievements_Tracker = ModData.getOrCreate("BB_Achievements_Tracker")

    if BB_Achievements_Tracker.characterName == nil then
        ResetAchievementTrackers()
    end
end

Events.OnInitGlobalModData.Add(onInitGlobalModData)
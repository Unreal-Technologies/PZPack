-- **************************************************
-- ██████  ██████   █████  ██    ██ ███████ ███    ██ 
-- ██   ██ ██   ██ ██   ██ ██    ██ ██      ████   ██ 
-- ██████  ██████  ███████ ██    ██ █████   ██ ██  ██ 
-- ██   ██ ██   ██ ██   ██  ██  ██  ██      ██  ██ ██ 
-- ██████  ██   ██ ██   ██   ████   ███████ ██   ████
-- **************************************************

BB_Achievements = {}

function ResetAchievements()
    BB_Achievements.startGame = {name = "IGUI_Achievement_Title_1", description = "IGUI_Achievement_Desc_1", icon = "A1", achieved = false}
    BB_Achievements.killZeds1 = {name = "IGUI_Achievement_Title_2", description = "IGUI_Achievement_Desc_2", icon = "A2", achieved = false}
    BB_Achievements.killZeds2 = {name = "IGUI_Achievement_Title_5", description = "IGUI_Achievement_Desc_5", icon = "A5", achieved = false}
    BB_Achievements.killZeds3 = {name = "IGUI_Achievement_Title_6", description = "IGUI_Achievement_Desc_6", icon = "A6", achieved = false}
    BB_Achievements.carryALot = {name = "IGUI_Achievement_Title_3", description = "IGUI_Achievement_Desc_3", icon = "A3", achieved = false}
    BB_Achievements.barricade1 = {name = "IGUI_Achievement_Title_4", description = "IGUI_Achievement_Desc_4", icon = "A4", achieved = false}
    BB_Achievements.barricade2 = {name = "IGUI_Achievement_Title_9", description = "IGUI_Achievement_Desc_9", icon = "A9", achieved = false}
    BB_Achievements.surviveDay1 = {name = "IGUI_Achievement_Title_7", description = "IGUI_Achievement_Desc_7", icon = "A7", achieved = false}
    BB_Achievements.stayAwake = {name = "IGUI_Achievement_Title_8", description = "IGUI_Achievement_Desc_8", icon = "A8", achieved = false}
    BB_Achievements.findRevolver = {name = "IGUI_Achievement_Title_10", description = "IGUI_Achievement_Desc_10", icon = "A10", achieved = false}
    BB_Achievements.findGun2 = {name = "IGUI_Achievement_Title_16", description = "IGUI_Achievement_Desc_16", icon = "A16", achieved = false}
    BB_Achievements.findGun3 = {name = "IGUI_Achievement_Title_17", description = "IGUI_Achievement_Desc_17", icon = "A17", achieved = false}
    BB_Achievements.findGun4 = {name = "IGUI_Achievement_Title_18", description = "IGUI_Achievement_Desc_18", icon = "A18", achieved = false}
    BB_Achievements.lvlUp1 = {name = "IGUI_Achievement_Title_11", description = "IGUI_Achievement_Desc_11", icon = "A11", achieved = false}
    BB_Achievements.lvlUp2 = {name = "IGUI_Achievement_Title_12", description = "IGUI_Achievement_Desc_12", icon = "A12", achieved = false}
    BB_Achievements.lvlUp3 = {name = "IGUI_Achievement_Title_13", description = "IGUI_Achievement_Desc_13", icon = "A13", achieved = false}
    BB_Achievements.driveVehicle = {name = "IGUI_Achievement_Title_14", description = "IGUI_Achievement_Desc_14", icon = "A14", achieved = false}
    BB_Achievements.overburdened = {name = "IGUI_Achievement_Title_15", description = "IGUI_Achievement_Desc_15", icon = "A15", achieved = false}
    BB_Achievements.readStuff1 = {name = "IGUI_Achievement_Title_19", description = "IGUI_Achievement_Desc_19", icon = "A19", achieved = false}
    BB_Achievements.lvlUpMax = {name = "IGUI_Achievement_Title_20", description = "IGUI_Achievement_Desc_20", icon = "A20", achieved = false}
    BB_Achievements.hypothermia = {name = "IGUI_Achievement_Title_21", description = "IGUI_Achievement_Desc_21", icon = "A21", achieved = false}
    BB_Achievements.hyperthermia = {name = "IGUI_Achievement_Title_22", description = "IGUI_Achievement_Desc_22", icon = "A22", achieved = false}
    BB_Achievements.surviveDay28 = {name = "IGUI_Achievement_Title_23", description = "IGUI_Achievement_Desc_23", icon = "A23", achieved = false}
    BB_Achievements.surviveDay196 = {name = "IGUI_Achievement_Title_24", description = "IGUI_Achievement_Desc_24", icon = "A24", achieved = false}
    BB_Achievements.haveStuff1 = {name = "IGUI_Achievement_Title_25", description = "IGUI_Achievement_Desc_25", icon = "A25", achieved = false}

    BB_Achievements.guardinGnome = {name = "IGUI_Achievement_Title_26", description = "IGUI_Achievement_Desc_26", icon = "A26", achieved = false}
    BB_Achievements.waitASec = {name = "IGUI_Achievement_Title_27", description = "IGUI_Achievement_Desc_27", icon = "A27", achieved = false}
    BB_Achievements.pacifist = {name = "IGUI_Achievement_Title_28", description = "IGUI_Achievement_Desc_28", icon = "A28", achieved = false}
    BB_Achievements.iAmLegend = {name = "IGUI_Achievement_Title_29", description = "IGUI_Achievement_Desc_29", icon = "A29", achieved = false}
    BB_Achievements.openSesame = {name = "IGUI_Achievement_Title_30", description = "IGUI_Achievement_Desc_30", icon = "A30", achieved = false}
    BB_Achievements.gta = {name = "IGUI_Achievement_Title_31", description = "IGUI_Achievement_Desc_31", icon = "A31", achieved = false}
end

local function onInitGlobalModData()
    if getWorld():getGameMode() == "Multiplayer" and not isClient() then return end
    BB_Achievements = ModData.getOrCreate("BB_Achievements")

    if BB_Achievements.startGame == nil then
        ResetAchievements()
    end

    -- BRIDGE CODE FOR NEW ACHIEVEMENTS
    if not BB_Achievements.guardinGnome then
        BB_Achievements.guardinGnome = {name = "IGUI_Achievement_Title_26", description = "IGUI_Achievement_Desc_26", icon = "A26", achieved = false}
        BB_Achievements.waitASec = {name = "IGUI_Achievement_Title_27", description = "IGUI_Achievement_Desc_27", icon = "A27", achieved = false}
        BB_Achievements.pacifist = {name = "IGUI_Achievement_Title_28", description = "IGUI_Achievement_Desc_28", icon = "A28", achieved = false}
        BB_Achievements.iAmLegend = {name = "IGUI_Achievement_Title_29", description = "IGUI_Achievement_Desc_29", icon = "A29", achieved = false}
        BB_Achievements.openSesame = {name = "IGUI_Achievement_Title_30", description = "IGUI_Achievement_Desc_30", icon = "A30", achieved = false}
        BB_Achievements.gta = {name = "IGUI_Achievement_Title_31", description = "IGUI_Achievement_Desc_31", icon = "A31", achieved = false}
    end
end

Events.OnInitGlobalModData.Add(onInitGlobalModData)
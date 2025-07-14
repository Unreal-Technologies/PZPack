local vehicleName = "Base.DoubleDeckerBus"

RVInterior.addInterior(vehicleName, { 23708, 11718, 0 })

local function migrateDoubleDeckerBus()
    if getWorld():getGameMode() ~= "Multiplayer" then
        if getGameTime():getModData().DoubleDeckernum then
            -- Migrate old single player data
            local player = getPlayer()
            RVInterior.migrateSinglePlayer(vehicleName, getGameTime():getModData().DoubleDeckernum,
                    player:getModData().DoubleDeckerpos)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "carishousenum")
        end
    elseif isServer() then
        if getGameTime():getModData().serverDoubleDeckernum then
            -- Migrate old multiplayer data
            RVInterior.migrateMultiPlayer(vehicleName, getGameTime():getModData().serverDoubleDeckernum,
                    getGameTime():getModData().serverDoubleDecker)
            RVInterior.addVehicleInteriorInstanceAlias(vehicleName, "serverDoubleDeckernum")
        end
    end
end

Events.OnGameStart.Add(migrateDoubleDeckerBus)
Events.OnServerStarted.Add(migrateDoubleDeckerBus)
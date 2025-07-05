
RainCleansBlood = {
    id = "RainCleansBlood",
    name = "Rain Cleans Blood",
    config = {
        tilesPerTick = 8,
        weatherIntensityThreshold = 0.25,
        alsoCleanAsh = true,
        alsoCleanInside = false,
        -- alsoCleanClothes = false,
        alsoCleanVehicles = false,
        alwaysClean = false,
    },
}


-- -------------------------------------------------------------------------- --
--                                   Options                                  --
-- -------------------------------------------------------------------------- --
function RainCleansBlood:buildOptions()
    local options = PZAPI.ModOptions:create(self.id, self.name)

    self.config.alsoCleanAsh = options:addTickBox("alsoCleanAsh", "Clean ash", true, "Clean ash from burned corpses")
    self.config.alsoCleanInside = options:addTickBox("alsoCleanInside", "Clean inside", false, "Also clean inside buildings, using magic")
    -- self.config.alsoCleanClothes = options:addTickBox("alsoCleanClothes", "Also clean clothes", false, "Also clean blood from equipped clothes")
    self.config.alsoCleanVehicles = options:addTickBox("alsoCleanVehicles", "Also clean vehicles (beta)", false, "Also clean blood from nearby vehicles")
    self.config.alwaysClean = options:addTickBox("alwaysClean", "Always clean", false, "Always clean, regardless of weather")

    self.config.tilesPerTick = options:addSlider("tilesPerTick", "Tiles per tick", 1, 64, 1, 8)
    options:addDescription("How many tiles to clean per tick. Increasing this will affect performance!\nDefault: 8")

    self.config.weatherIntensityThreshold = options:addSlider("weatherIntensityThreshold", "Weather intensity threshold", 0.05, 0.95, 0.05, 0.20)
    options:addDescription("Higher values mean that the weather must be more intense before it starts washing away blood.\nDefault: 0.2")

    self.config.vehicleCleanSpeed = options:addSlider("vehicleCleanSpeed", "Vehicle clean speed", 0.001, 0.1, 0.001, 0.001)
    options:addDescription("How fast to clean blood from vehicles.\nDefault: 0.001")
end

function RainCleansBlood:syncOptions()
    local options = PZAPI.ModOptions:getOptions(self.id)

    self.config.alsoCleanAsh = options:getOption("alsoCleanAsh"):getValue()
    self.config.alsoCleanInside = options:getOption("alsoCleanInside"):getValue()
    -- self.config.alsoCleanClothes = options:getOption("alsoCleanClothes"):getValue()
    self.config.alsoCleanVehicles = options:getOption("alsoCleanVehicles"):getValue()
    self.config.alwaysClean = options:getOption("alwaysClean"):getValue()
    self.config.tilesPerTick = options:getOption("tilesPerTick"):getValue()
    self.config.weatherIntensityThreshold = options:getOption("weatherIntensityThreshold"):getValue()
end

function RainCleansBlood:printOptions()
    print("RainCleansBlood config:")
    print("  alsoCleanAsh: " .. tostring(self.config.alsoCleanAsh))
    print("  alsoCleanInside: " .. tostring(self.config.alsoCleanInside))
    -- print("  alsoCleanClothes: " .. tostring(self.config.alsoCleanClothes))
    print("  alsoCleanVehicles: " .. tostring(self.config.alsoCleanVehicles))
    print("  alwaysClean: " .. tostring(self.config.alwaysClean))
    print("  tilesPerTick: " .. tostring(self.config.tilesPerTick))
    print("  weatherIntensityThreshold: " .. tostring(self.config.weatherIntensityThreshold))
    print("")
    print("  shouldClean: " .. tostring(self:shouldClean()))
    print("  weatherIntensity: " .. tostring(self:getWeatherIntensity()))
end


-- -------------------------------------------------------------------------- --
--                                  Handlers                                  --
-- -------------------------------------------------------------------------- --
function RainCleansBlood:onGameBoot()
    self:buildOptions()
end

function RainCleansBlood:onTick()
    self:syncOptions()
    -- self:printOptions()

    if not self:shouldClean() then
        return
    end

    for _ = 1, self.config.tilesPerTick do
        local tile = self:getNextTile()

        if tile then
            if tile:haveBlood() then
                tile:removeBlood(false, false)
            end

            if self.config.alsoCleanAsh then
                local objects = tile:getObjects()

                for i = 0, objects:size() - 1 do
                    local object = objects:get(i)

                    if object and object:getName() == "burnedCorpse" then
                        object:removeFromSquare()
                    end
                end
            end
        end
    end

    if self.config.alsoCleanVehicles then
        self:cleanNearbyVehicles()
    end
end


-- -------------------------------------------------------------------------- --
--                                   Methods                                  --
-- -------------------------------------------------------------------------- --
function RainCleansBlood:cleanNearbyVehicles()
    if ZombRand(0, 100) > 50 then
        return
    end

    local cell = getCell()
    local vehicles = cell:getVehicles()
    local chancePerTick = 2
    local speed = 0.01

    for i = 0, vehicles:size() - 1 do
        local vehicle = vehicles:get(i)

        if vehicle then
            local front = vehicle:getBloodIntensity("Front") or 0
            local rear = vehicle:getBloodIntensity("Rear") or 0
            local left = vehicle:getBloodIntensity("Left") or 0
            local right = vehicle:getBloodIntensity("Right") or 0

            if front > 0 then
                if ZombRand(0, 100) < chancePerTick then
                    vehicle:setBloodIntensity("Front", front - speed)
                end
            end

            if rear > 0 then
                if ZombRand(0, 100) < chancePerTick then
                    vehicle:setBloodIntensity("Rear", rear - speed)
                end
            end

            if left > 0 then
                if ZombRand(0, 100) < chancePerTick then
                    vehicle:setBloodIntensity("Left", left - speed)
                end
            end

            if right > 0 then
                if ZombRand(0, 100) < chancePerTick then
                    vehicle:setBloodIntensity("Right", right - speed)
                end
            end
        end
    end
end


-- -------------------------------------------------------------------------- --
--                                   Helpers                                  --
-- -------------------------------------------------------------------------- --
function RainCleansBlood:shouldClean()
    if self.config.alwaysClean then
        return true
    end

    if self:isWeatherIntensityAboveThreshold() then
        return true
    end

    return false
end

function RainCleansBlood:getWeatherIntensity()
    local climateManager = getClimateManager()

    return math.max(
        climateManager:getRainIntensity(),
        climateManager:getSnowIntensity()
    );
end

function RainCleansBlood:isWeatherIntensityAboveThreshold()
    return self:getWeatherIntensity() > self.config.weatherIntensityThreshold;
end

function RainCleansBlood:getNextTile()
    local cell = getCell()
    local minX = cell:getMinX()
    local minY = cell:getMinY()
    local maxX = cell:getMaxX()
    local maxY = cell:getMaxY()

    for _ = 1, 10 do
        local x = ZombRand(minX, maxX)
        local y = ZombRand(minY, maxY)
        local tile = cell:getGridSquare(x, y, 0)

        if tile and (tile:isOutside() or self.config.alsoCleanInside) then
            return tile
        end
    end

    return nil
end


-- -------------------------------------------------------------------------- --
--                                 Hook events                                --
-- -------------------------------------------------------------------------- --
Events.OnGameBoot.Add(function() RainCleansBlood:onGameBoot() end);
Events.OnTick.Add(function() RainCleansBlood:onTick() end);

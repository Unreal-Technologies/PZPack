PaintVehicleConfig = {}

PaintVehicleConfig.COEF_TIME_SAND = 1.2
PaintVehicleConfig.COEF_USE_PRIMER = 0.67
PaintVehicleConfig.COEF_USE_SPRAY_GUN = 0.85

--- The vehicle areas' ids starting from the engine in counterclockwise order.
PaintVehicleConfig.VEHICLE_AREAS = {
    "Engine", "SeatFrontLeft", "TruckBed", "SeatFrontRight"
}

--- List of all item types used by the mod.
PaintVehicleConfig.ITEMS = {
    -- Vanilla items
    DUST_MASK = "Base.Hat_DustMask",
    GOGGLES = "Base.Glasses_SafetyGoggles",
    GAS_MASK = "Base.Hat_GasMask",
    BIO_MASK = "Base.Hat_NBCmask",
    -- Mod's items
    CATALOGUE_SPRAYS = "PaintYourRide.CataloguePaintSpray",
    CATALOGUE_TINTS = "PaintYourRide.CataloguePaintTints",
    SPRAY_GUN = "PaintYourRide.SprayGun",
    WIRE_BRUSH = "PaintYourRide.WireBrush",
    BASE_PAINT = "PaintYourRide.AutomotivePaintWhite",
    PRIMER = "PaintYourRide.AutomotiveSprayPrimer",
    TINTS = {
        RED = "PaintYourRide.AutomotiveTintPaintRed",
        YELLOW = "PaintYourRide.AutomotiveTintPaintYellow",
        GREEN = "PaintYourRide.AutomotiveTintPaintGreen",
        CYAN = "PaintYourRide.AutomotiveTintPaintCyan",
        BLUE = "PaintYourRide.AutomotiveTintPaintBlue",
        MAGENTA = "PaintYourRide.AutomotiveTintPaintMagenta",
        BLACK = "PaintYourRide.AutomotiveTintPaintBlack"
    },
    SPRAY_PAINT = {
        { itemType = "AutomotiveSprayPaintBlack", color = { 0, 4, 21 } },
        { itemType = "AutomotiveSprayPaintBlue", color = { 59.6, 91, 66 } },
        { itemType = "AutomotiveSprayPaintBlueNavy", color = { 66.7, 100, 50 } },
        { itemType = "AutomotiveSprayPaintBlueNeon", color = { 52.5, 98, 100 } },
        { itemType = "AutomotiveSprayPaintBlueOlympic", color = { 55, 100, 80 } },
        { itemType = "AutomotiveSprayPaintBrownDarkChocolate", color = { 7.2, 97, 24 } },
        { itemType = "AutomotiveSprayPaintBrownRusty", color = { 5.5, 98, 55 } },
        { itemType = "AutomotiveSprayPaintGreen", color = { 27, 100, 48 } },
        { itemType = "AutomotiveSprayPaintGreenArmy", color = { 25.4, 67, 34 } },
        { itemType = "AutomotiveSprayPaintGreenForest", color = { 37.7, 89, 40 } },
        { itemType = "AutomotiveSprayPaintGreenNeon", color = { 29, 100, 90 } },
        { itemType = "AutomotiveSprayPaintGrey", color = { 15, 0, 73 } },
        { itemType = "AutomotiveSprayPaintGreySteel", color = { 57.2, 6, 49 } },
        { itemType = "AutomotiveSprayPaintOrangeTangerine", color = { 6.6, 100, 100 } },
        { itemType = "AutomotiveSprayPaintPinkBubbleGum", color = { 91.6, 64, 100 } },
        { itemType = "AutomotiveSprayPaintPinkGlamorous", color = { 83, 85, 100 } },
        { itemType = "AutomotiveSprayPaintRed", color = { 0.2, 95, 70 } },
        { itemType = "AutomotiveSprayPaintRedBurgundy", color = { 96.4, 99, 55 } },
        { itemType = "AutomotiveSprayPaintRedCandyApple", color = { 0.5, 100, 100 } },
        { itemType = "AutomotiveSprayPaintVioletGrape", color = { 75.5, 73, 66 } },
        { itemType = "AutomotiveSprayPaintVioletIndigo", color = { 76.4, 100, 51 } },
        { itemType = "AutomotiveSprayPaintWhite", color = { 15, 8, 88 } },
        { itemType = "AutomotiveSprayPaintYellow", color = { 15.8, 100, 90 } },
        { itemType = "AutomotiveSprayPaintYellowNeon", color = { 19.7, 98, 100 } },
        { itemType = "AutomotiveSprayPaintYellowTuscany", color = { 12.4, 100, 100 } }
    }
}

PaintVehicleConfig.VEHICLES = {
    -- Standard
    { id = "Base.CarNormal", paint = 30 },
    { id = "Base.CarStationWagon2", paint = 32 },
    { id = "Base.OffRoad", paint = 25 },
    { id = "Base.SmallCar", paint = 21 },
    { id = "Base.SmallCar02", paint = 26 },
    -- Heavy-Duty
    { id = "Base.PickUpTruck", paint = 31 },
    { id = "Base.PickUpVan", paint = 35 },
    { id = "Base.StepVan", paint = 45 },
    { id = "Base.SUV", paint = 33 },
    { id = "Base.Van", paint = 42 },
    { id = "Base.VanSeats", paint = 38 },
    -- Sports
    { id = "Base.CarLuxury", paint = 32 },
    { id = "Base.ModernCar", paint = 30 },
    { id = "Base.ModernCar02", paint = 30 },
    { id = "Base.SportsCar", paint = 22 }
}

local vehicles_FRUsedCars = {
    -- Standard
    { id = "Base.65gto", paint = 27 },
    { id = "Base.68elcamino", paint = 28 },
    { id = "Base.68wildcat", paint = 28 },
    { id = "Base.68wildcatconvert", paint = 23 },
    { id = "Base.69charger", paint = 27 },
    { id = "Base.70chevelle", paint = 27 },
    { id = "Base.70elcamino", paint = 28 },
    { id = "Base.71impala", paint = 30 },
    { id = "Base.73falcon", paint = 26 },
    { id = "Base.73pinto", paint = 20 },
    { id = "Base.79brougham", paint = 29 },
    { id = "Base.85vicsed", paint = 29 },
    { id = "Base.85vicwag", paint = 30 },
    { id = "Base.85vicwag2", paint = 30 },
    { id = "Base.86yugo", paint = 18 },
    { id = "Base.91crx", paint = 19 },
    { id = "Base.volvo244", paint = 25 },
    { id = "Base.72beetle", paint = 21 },
    { id = "Base.87caprice", paint = 29 },
    { id = "Base.90corolla", paint = 22 },
    { id = "Base.91celica", paint = 22 },
    { id = "Base.92crownvic", paint = 29 },
    { id = "Base.92wrangler", paint = 15 },
    { id = "Base.92wrangleroffroad", paint = 15 },
    -- Heavy-Duty
    { id = "Base.87blazer", paint = 33 },
    { id = "Base.87c10lb", paint = 36 },
    { id = "Base.87c10sb", paint = 31 },
    { id = "Base.87c10utility", paint = 19 },
    { id = "Base.87suburban", paint = 37 },
    { id = "Base.90ramlb", paint = 34 },
    { id = "Base.90ramsb", paint = 31 },
    { id = "Base.astrovan", paint = 33 },
    { id = "Base.f700box", paint = 25 },
    { id = "Base.f700dump", paint = 25 },
    { id = "Base.f700flatbed", paint = 25 },
    { id = "Base.80f350", paint = 35 },
    { id = "Base.80f350offroad", paint = 35 },
    { id = "Base.80f350quad", paint = 41 },
    { id = "Base.83hilux", paint = 29 },
    { id = "Base.83hiluxoffroad", paint = 29 },
    { id = "Base.86econoline", paint = 42 },
    { id = "Base.87blazeroffroad", paint = 33 },
    { id = "Base.87c10offroadlb", paint = 36 },
    { id = "Base.87c10offroadsb", paint = 31 },
    { id = "Base.90ramoffroadlb", paint = 34 },
    { id = "Base.90ramoffroadsb", paint = 31 },
    { id = "Base.91wagoneer", paint = 28 },
    { id = "Base.93explorer", paint = 29 },
    { id = "Base.chevystepvan", paint = 65 },
    { id = "Base.f700tractor", paint = 25 },
    { id = "Base.Trailer51chevy", paint = 8 },
    --Sports
    { id = "Base.79datsun280z", paint = 20 }
}

local function merge(t1, t2)
    for _, v in ipairs(t2) do
        table.insert(t1, v)
    end
end

-- https://steamcommunity.com/sharedfiles/filedetails/?id=1510950729
if getActivatedMods():contains("FRUsedCars") then
    merge(PaintVehicleConfig.VEHICLES, vehicles_FRUsedCars)
end
-- https://steamcommunity.com/sharedfiles/filedetails/?id=2661819460
if getActivatedMods():contains("FordCrownVictoriacolor") then
    table.insert(PaintVehicleConfig.VEHICLES, { id = "Base.FordCrownVict", paint = 33 })
end
-- https://steamcommunity.com/sharedfiles/filedetails/?id=2664866820
if getActivatedMods():contains("nissantestcolor") then
    table.insert(PaintVehicleConfig.VEHICLES, { id = "Base.nissan240sx", paint = 25 })
end
-- https://steamcommunity.com/sharedfiles/filedetails/?id=2675429658
if getActivatedMods():contains("1970FordMustangBoss302") then
    table.insert(PaintVehicleConfig.VEHICLES, { id = "Base.70fordmustang302boss", paint = 31 })
    table.insert(PaintVehicleConfig.VEHICLES, { id = "Base.70fordmustang302bossfull", paint = 31 })
end
-- https://steamcommunity.com/sharedfiles/filedetails/?id=2698931985
if getActivatedMods():contains("TRNSkylineGTRR34") then
    table.insert(PaintVehicleConfig.VEHICLES, { id = "Base.tr_nsgtrr34", paint = 27 })
end

--- Adds a vehicle to the list of vehicles that can be repainted with this mod.
---@param vehicleID string a vehicle id, must start with a module name ("Base.")
---@param paintRequired table required amount of paint (also used to calculate primer requirements)
function PaintVehicleConfig.addVehicle(vehicleID, paintRequired)
    assert(type(vehicleID) == "string", "vehicleID must be a string")
    assert(vehicleID:find("%."), "vehicleID must include a module name")
    assert(paintRequired > 0, paintRequired .. " must be a valid positive number")
    assert(math.floor(paintRequired) == paintRequired, paintRequired .. " must be an integer")

    table.insert(PaintVehicleConfig.VEHICLES, { id = vehicleID, paint = paintRequired })
end
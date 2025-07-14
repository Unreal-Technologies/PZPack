    -- =====================
    --    Custom vehicle spawns
    -- =====================
    require "TaylorsvilleVehicleDistribution"
    if VehicleZoneDistribution then
    -- =====================
   -- camping
    VehicleZoneDistribution.camping = VehicleZoneDistribution.camping or {};
    VehicleZoneDistribution.camping.vehicles = VehicleZoneDistribution.camping.vehicles or {};
   -- construction
    VehicleZoneDistribution.construction = VehicleZoneDistribution.construction or {};
    VehicleZoneDistribution.construction.vehicles = VehicleZoneDistribution.construction.vehicles or {};
   -- heralds
    VehicleZoneDistribution.heralds = VehicleZoneDistribution.heralds or {};
    VehicleZoneDistribution.heralds.vehicles = VehicleZoneDistribution.heralds.vehicles or {};
   -- mail
    VehicleZoneDistribution.mail = VehicleZoneDistribution.mail or {};
    VehicleZoneDistribution.mail.vehicles = VehicleZoneDistribution.mail.vehicles or {};
   -- propane
    VehicleZoneDistribution.propane = VehicleZoneDistribution.propane or {};
    VehicleZoneDistribution.propane.vehicles = VehicleZoneDistribution.propane.vehicles or {};
   -- farm
    VehicleZoneDistribution.farm = VehicleZoneDistribution.farm or {};
    VehicleZoneDistribution.farm.vehicles = VehicleZoneDistribution.farm.vehicles or {};
   -- firetruck
    VehicleZoneDistribution.firetruck = VehicleZoneDistribution.firetruck or {};
    VehicleZoneDistribution.firetruck.vehicles = VehicleZoneDistribution.firetruck.vehicles or {};
   -- electronics
    VehicleZoneDistribution.electronics = VehicleZoneDistribution.electronics or {};
    VehicleZoneDistribution.electronics.vehicles = VehicleZoneDistribution.electronics.vehicles or {};
    -- boxtruck
    VehicleZoneDistribution.boxtruck = VehicleZoneDistribution.boxtruck or {};
    VehicleZoneDistribution.boxtruck.vehicles = VehicleZoneDistribution.boxtruck.vehicles or {};
    -- gigamart
    VehicleZoneDistribution.gigamart = VehicleZoneDistribution.gigamart or {};
    VehicleZoneDistribution.gigamart.vehicles = VehicleZoneDistribution.gigamart.vehicles or {};
    -- schoolbus
    VehicleZoneDistribution.schoolbus = VehicleZoneDistribution.schoolbus or {};
    VehicleZoneDistribution.schoolbus.vehicles = VehicleZoneDistribution.schoolbus.vehicles or {};
    end
    -- =====================
    -- Filibuster Rhymes' Used Cars! (1510950729)
    if getActivatedMods():contains("FRUsedCars") and VehicleZoneDistribution then
    VehicleZoneDistribution.boxtruck.vehicles["Base.f700box"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.propane.vehicles["Base.f700propane"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.farm.vehicles["Base.tractorford7810"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.firetruck.vehicles["Base.firepumper"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.electronics.vehicles["Base.isuzuboxelec"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.boxtruck.vehicles["Base.isuzubox"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.gigamart.vehicles["Base.isuzuboxfood"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.schoolbus.vehicles["Base.schoolbus"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.camping.vehicles["Base.Trailercamperscamp"] = {index = -1, spawnChance = 25};
    end
    -- '90 Pierce Arrow Pumper (2942793445)
   if getActivatedMods():contains("90pierceArrow") and VehicleZoneDistribution then
    VehicleZoneDistribution.firetruck.vehicles["Base.90pierceArrow"] = {index = -1, spawnChance = 25};
   end
    -- =====================
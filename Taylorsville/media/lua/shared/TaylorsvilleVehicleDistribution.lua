    -- =====================
    --    Custom vehicle spawns
    -- =====================
    if VehicleZoneDistribution then
    -- =====================
   -- camping
    VehicleZoneDistribution.camping = VehicleZoneDistribution.camping or {};
    VehicleZoneDistribution.camping.vehicles = VehicleZoneDistribution.camping.vehicles or {};
    VehicleZoneDistribution.camping.vehicles["Base.Trailercamperscamp"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.camping.chanceToSpawnSpecial = 0;
    VehicleZoneDistribution.camping.spawnRate = 25;
    VehicleZoneDistribution.camping.baseVehicleQuality = 0.8;
   -- construction
    VehicleZoneDistribution.construction = VehicleZoneDistribution.construction or {};
    VehicleZoneDistribution.construction.vehicles = VehicleZoneDistribution.construction.vehicles or {};
    VehicleZoneDistribution.construction.vehicles["Base.PickUpTruck"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.construction.chanceToSpawnSpecial = 0;
    VehicleZoneDistribution.construction.spawnRate = 25;
    VehicleZoneDistribution.construction.baseVehicleQuality = 0.8;
   -- heralds
    VehicleZoneDistribution.heralds = VehicleZoneDistribution.heralds or {};
    VehicleZoneDistribution.heralds.vehicles = VehicleZoneDistribution.heralds.vehicles or {};
    VehicleZoneDistribution.heralds.vehicles["Base.StepVan_Heralds"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.heralds.chanceToSpawnSpecial = 0;
    VehicleZoneDistribution.heralds.spawnRate = 25;
    VehicleZoneDistribution.heralds.baseVehicleQuality = 0.8;
   -- mail
    VehicleZoneDistribution.mail = VehicleZoneDistribution.mail or {};
    VehicleZoneDistribution.mail.vehicles = VehicleZoneDistribution.mail.vehicles or {};
    VehicleZoneDistribution.mail.vehicles["Base.StepVanMail"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.mail.chanceToSpawnSpecial = 0;
    VehicleZoneDistribution.mail.spawnRate = 25;
    VehicleZoneDistribution.mail.baseVehicleQuality = 0.8;
   -- propane
    VehicleZoneDistribution.propane = VehicleZoneDistribution.propane or {};
    VehicleZoneDistribution.propane.vehicles = VehicleZoneDistribution.propane.vehicles or {};
    VehicleZoneDistribution.propane.vehicles["Base.f700propane"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.propane.chanceToSpawnSpecial = 0;
    VehicleZoneDistribution.propane.spawnRate = 25;
    VehicleZoneDistribution.propane.baseVehicleQuality = 0.8;
   -- farm
    VehicleZoneDistribution.farm = VehicleZoneDistribution.farm or {};
    VehicleZoneDistribution.farm.vehicles = VehicleZoneDistribution.farm.vehicles or {};
    VehicleZoneDistribution.farm.vehicles["Base.tractorford7810"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.farm.chanceToSpawnSpecial = 0;
    VehicleZoneDistribution.farm.spawnRate = 25;
    VehicleZoneDistribution.farm.baseVehicleQuality = 0.8;
   -- firetruck
    VehicleZoneDistribution.firetruck = VehicleZoneDistribution.firetruck or {};
    VehicleZoneDistribution.firetruck.vehicles = VehicleZoneDistribution.firetruck.vehicles or {};
    VehicleZoneDistribution.firetruck.vehicles["Base.90pierceArrow"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.firetruck.vehicles["Base.firepumper"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.firetruck.chanceToSpawnSpecial = 0;
    VehicleZoneDistribution.firetruck.spawnRate = 25;
    VehicleZoneDistribution.firetruck.baseVehicleQuality = 0.8;
    -- electronics
    VehicleZoneDistribution.electronics = VehicleZoneDistribution.electronics or {};
    VehicleZoneDistribution.electronics.vehicles = VehicleZoneDistribution.electronics.vehicles or {};
    VehicleZoneDistribution.electronics.vehicles["Base.isuzuboxelec"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.electronics.chanceToSpawnSpecial = 0;
    VehicleZoneDistribution.electronics.spawnRate = 25;
    VehicleZoneDistribution.electronics.baseVehicleQuality = 0.8;
    -- boxtruck
    VehicleZoneDistribution.boxtruck = VehicleZoneDistribution.boxtruck or {};
    VehicleZoneDistribution.boxtruck.vehicles = VehicleZoneDistribution.boxtruck.vehicles or {};
    VehicleZoneDistribution.boxtruck.vehicles["Base.f700box"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.boxtruck.vehicles["Base.isuzubox"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.boxtruck.chanceToSpawnSpecial = 0;
    VehicleZoneDistribution.boxtruck.spawnRate = 25;
    VehicleZoneDistribution.boxtruck.baseVehicleQuality = 0.8;
    -- gigamart
    VehicleZoneDistribution.gigamart = VehicleZoneDistribution.gigamart or {};
    VehicleZoneDistribution.gigamart.vehicles = VehicleZoneDistribution.gigamart.vehicles or {};
    VehicleZoneDistribution.gigamart.vehicles["Base.isuzuboxfood"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.gigamart.chanceToSpawnSpecial = 0;
    VehicleZoneDistribution.gigamart.spawnRate = 25;
    VehicleZoneDistribution.gigamart.baseVehicleQuality = 0.8;
    -- schoolbus
    VehicleZoneDistribution.schoolbus = VehicleZoneDistribution.schoolbus or {};
    VehicleZoneDistribution.schoolbus.vehicles = VehicleZoneDistribution.schoolbus.vehicles or {};
    VehicleZoneDistribution.schoolbus.vehicles["Base.schoolbus"] = {index = -1, spawnChance = 25};
    VehicleZoneDistribution.schoolbus.chanceToSpawnSpecial = 0;
    VehicleZoneDistribution.schoolbus.spawnRate = 25;
    VehicleZoneDistribution.schoolbus.baseVehicleQuality = 0.8;
    -- =====================
end
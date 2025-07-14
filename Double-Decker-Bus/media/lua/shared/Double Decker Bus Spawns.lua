if VehicleZoneDistribution then

    VehicleZoneDistribution.parkingstall.vehicles["Base.DoubleDeckerBus"] = {index = -1, spawnChance = 8};
    VehicleZoneDistribution.medium.vehicles["Base.DoubleDeckerBus"] = {index = -1, spawnChance = 8};
    VehicleZoneDistribution.junkyard.vehicles["Base.DoubleDeckerBus"] = {index = -1, spawnChance = 8};
    VehicleZoneDistribution.trafficjamw.vehicles["Base.DoubleDeckerBus"] = {index = -1, spawnChance = 8};



    VehicleZoneDistribution.collectors = VehicleZoneDistribution.collectors or {};
    VehicleZoneDistribution.collectors.vehicles = VehicleZoneDistribution.collectors.vehicles or {};

    VehicleZoneDistribution.collectors.vehicles["Base.DoubleDeckerBus"] = {index = -1, spawnChance = 12};

    VehicleZoneDistribution.exotic = VehicleZoneDistribution.exotic or {};
    VehicleZoneDistribution.exotic.vehicles = VehicleZoneDistribution.exotic.vehicles or {};

    VehicleZoneDistribution.exotic.vehicles["Base.DoubleDeckerBus"] = {index = -1, spawnChance = 20};

    VehicleZoneDistribution.expocarshow = VehicleZoneDistribution.expocarshow or {};
    VehicleZoneDistribution.expocarshow.vehicles = VehicleZoneDistribution.expocarshow.vehicles or {};

    VehicleZoneDistribution.expocarshow.vehicles["Base.DoubleDeckerBus"] = {index = -1, spawnChance = 10};

    VehicleZoneDistribution.specialdealer = VehicleZoneDistribution.specialdealer or {};
    VehicleZoneDistribution.specialdealer.vehicles = VehicleZoneDistribution.specialdealer.vehicles or {};

    VehicleZoneDistribution.specialdealer.vehicles["Base.DoubleDeckerBus"] = {index = -1, spawnChance = 30};

    VehicleZoneDistribution.newdealer = VehicleZoneDistribution.newdealer or {};
    VehicleZoneDistribution.newdealer.vehicles = VehicleZoneDistribution.newdealer.vehicles or {};

    VehicleZoneDistribution.newdealer.vehicles["Base.DoubleDeckerBus"] = {index = -1, spawnChance = 5};

end
local function RemoveLoot(zoneKey, zone)
    for i=#zone.items,1,-1 do
        y = zone.items[i]
            if y == "IronSight" or y == "FiberglassStock" or y ==  "AmmoStraps" or y == "Laser" or y == "ShotgunCase1" or y == "ShotgunCase2" or y == "RifleCase1" or y == "RifleCase2" or y == "RifleCase3" or y == "PistolCase1" or y == "PistolCase2" or y == "PistolCase3" or y == "RevolverCase1" or y == "RevolverCase2" or y == "RevolverCase3" or y == "Pistol" or y == "Pistol2" or y == "Pistol3" or y == "Revolver" or y == "Revolver_Short" or y == "Revolver_Long" or y == "VarmintRifle" or y == "HuntingRifle" or y == "AssaultRifle" or y == "AssaultRifle2" or y == "Shotgun" or y == "ShotgunSawnoff" or y == "DoubleBarrelShotgun" or y == "DoubleBarrelShotgunSawnoff" then
                table.remove(zone.items,i)
                table.remove(zone.items,i)
            end
        end
end

local function loopOnTable(table)
    for zoneKey, zone in pairs(table) do
        if type(zone) == "table" then
            if zone and zone.items then
                RemoveLoot(zoneKey, zone)
                if zone.junk and zone.junk.items[1] then
                    RemoveLoot(zoneKey, zone.junk)
                end
            else
                if zone and not zone.procedural then
                    loopOnTable(zone)
                end
            end
        end
    end
end


local function modifyAllLootTables()    
    ProceduralDistributions = ProceduralDistributions or {}
    VehicleDistributions = VehicleDistributions or {}
    SuburbsDistributions = SuburbsDistributions or {}
    Distributions = Distributions or {}      
    loopOnTable(SuburbsDistributions)
    loopOnTable(Distributions)
    loopOnTable(ProceduralDistributions.list)
    loopOnTable(VehicleDistributions)
end

Events.OnPreDistributionMerge.Add(modifyAllLootTables)
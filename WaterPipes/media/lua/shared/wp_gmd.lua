WaterPipingModData = {}

local function conv (tab, otype)
    ret = {}
    for _, v in pairs(tab) do
        local id
        if otype == "BUILDING" then
            id = Coords2Id(v.x1, v.y1, 0)
        else
            id = Coords2Id(v.x, v.y, v.z)
        end
        ret[id] = v
    end
    printd ("CONVERTED " .. otype)
    return ret
end

function InitWaterPipingModData(isNewGame)

    print ("----------- GLOBAL MODDATA LOADED ------------- ")
    local modData = ModData.getOrCreate("WaterPiping")

    if isClient() then
        ModData.request("WaterPiping")
    end

    if not modData.WorkingPumps then modData.WorkingPumps = {} end
    if not modData.Pipes then modData.Pipes = {} end
    if not modData.Barrels then modData.Barrels = {} end
    if not modData.Buildings then modData.Buildings = {} end
    -- modData.DWorkingPumps = nil

    if not modData.DWorkingPumps then modData.DWorkingPumps = conv(modData.WorkingPumps, "PUMP") end
    if not modData.DPipes then modData.DPipes = conv(modData.Pipes, "PIPE") end
    if not modData.DBarrels then modData.DBarrels = conv(modData.Barrels, "BARREL") end
    if not modData.DBuildings then modData.DBuildings = conv(modData.Buildings, "BUILDING") end

    WaterPipingModData = modData
end

function LoadWaterPipingModData(key, modData)
    if isClient() then
        if key and key == "WaterPiping" and modData then
            WaterPipingModData = modData
        end
    end
end

function GetWaterPipingModData()
    return WaterPipingModData
end

function TransmitWaterPipingModData()
    ModData.transmit("WaterPiping")
end

print ("-------------------------------")
print ("- waterpipes gmd loaded       -")
print ("-------------------------------")


Events.OnInitGlobalModData.Add(InitWaterPipingModData)
Events.OnReceiveGlobalModData.Add(LoadWaterPipingModData)

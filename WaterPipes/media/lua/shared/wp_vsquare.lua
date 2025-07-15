require "wp_gmd"

sp2code = {}
sp2code["industry_02_24"] = "A"
sp2code["industry_02_25"] = "B"
sp2code["industry_02_26"] = "C"
sp2code["industry_02_27"] = "D"
sp2code["industry_02_28"] = "E"
sp2code["industry_02_29"] = "F"
sp2code["industry_02_30"] = "G"
sp2code["industry_02_31"] = "H"
sp2code["industry_02_32"] = "I"
sp2code["industry_02_33"] = "J"
sp2code["industry_02_39"] = "X"
sp2code["industry_02_76"] = "K"
sp2code["industry_02_77"] = "L"
sp2code["industry_02_78"] = "M"
sp2code["industry_02_79"] = "N"
sp2code["industry_02_35"] = "O"
sp2code["industry_02_36"] = "P"
sp2code["industry_02_37"] = "Q"
sp2code["industry_02_38"] = "R"

code2sp = {}
for k, v in pairs(sp2code) do
    code2sp[v] = k
end

Vsquare = {}

function Vsquare.Sprite2Code (spriteName)
    return sp2code[spriteName]
end

function Vsquare.Code2Sprite (code)
    return code2sp[code]
end

function Vsquare.AddBuilding (building, buildingDef)
    local x1 = buildingDef:getX()
    local y1 = buildingDef:getY()
    local x2 = buildingDef:getX2()
    local y2 = buildingDef:getY2()

    local entry = {}
    entry.x1 = x1
    entry.y1 = y1
    entry.x2 = x2
    entry.y2 = y2
    entry.w = 0
    entry.wt = false

    sendClientCommand(getPlayer(), 'wp_commands', 'addbuilding', entry)

end

function Vsquare.GetBuilding (x1, y1)
    local globalModData = GetWaterPipingModData()
    local id = Coords2Id(x1, y1, 0)
    return globalModData.DBuildings[id]
end

function Vsquare.GetBuildingByPoint (x, y)
    local globalModData = GetWaterPipingModData()

    for k, v in pairs(globalModData.DBuildings) do
        if v then
            if x >= v.x1 and x <= v.x2 and y >= v.y1 and y <= v.y2 then
                return v
            end
        end
    end
    return false
end

function Vsquare.AddBarrel (barrel)
    local x = barrel:getX()
    local y = barrel:getY()
    local z = barrel:getZ()

    local spriteName = barrel:getSprite():getName()
    local wmax = barrel:getWaterMax()
    if not wmax or wmax == 0 then wmax = 20 end

    local entry = {}
    entry.x = x
    entry.y = y
    entry.z = z
    entry.w = 0
    entry.wmax = wmax
    entry.f = 0
    entry.wt = false
    entry.sh = spriteName
    
    if isServer() then
        WPServer.wp_commands.addbarrel(getPlayer(), entry)
    else
        sendClientCommand(getPlayer(), 'wp_commands', 'addbarrel', entry)
    end
end

function Vsquare.RemoveBarrel (barrel)
    local x = barrel:getX()
    local y = barrel:getY()
    local z = barrel:getZ()

    sendClientCommand(getPlayer(), 'wp_commands', 'removebarrel', {x=x, y=y, z=z})
end

function Vsquare.AddWaterToBarrel (x, y, z, amount, isTainted, isFuelSource)
    local globalModData = GetWaterPipingModData()
    local id = Coords2Id(x, y, z)
    local entry = globalModData.DBarrels[id]

    if entry then
        if isFuelSource then
            if not entry.f then entry.f = 0 end
            entry.f = entry.f + amount
            if entry.f > 768 then entry.f = 768 end
        else
            if not entry.w then entry.w = 0 end
            entry.w = entry.w + amount
            if entry.w > 768 then entry.w = 768 end
        end
        entry.wt = isTainted
                    
        sendClientCommand(getPlayer(), 'wp_commands', 'modifybarrel', entry)
    end
end

function Vsquare.ZeroWaterInBarrel (x, y, z)
    local globalModData = GetWaterPipingModData()
    local id = Coords2Id(x, y, z)
    local entry = globalModData.DBarrels[id]
    entry.w = 0
    entry.f = 0
    entry.wt = false

    sendClientCommand(getPlayer(), 'wp_commands', 'modifybarrel', entry)
end

function Vsquare.GetBarrels ()
    local globalModData = GetWaterPipingModData()
    return globalModData.DBarrels
end

function Vsquare.GetBarrel (x, y, z)
    local globalModData = GetWaterPipingModData()
    local id = Coords2Id(x, y, z)
    return globalModData.DBarrels[id]
end

function Vsquare.AddPipe (pipe)

    local x = pipe:getX()
    local y = pipe:getY()
    local z = pipe:getZ()
    local spriteName = pipe:getSprite():getName()

    local entry = {}
    entry.x = x
    entry.y = y
    entry.z = z
    entry.w = 0
    entry.f = 0
    entry.wt = false
    entry.sh = Vsquare.Sprite2Code(spriteName)

    if isServer() then
        WPServer.wp_commands.addpipe(getPlayer(), entry)
    else
        sendClientCommand(getPlayer(), 'wp_commands', 'addpipe', entry)
    end
end

function Vsquare.RemovePipe (pipe)
    local x = pipe:getX()
    local y = pipe:getY()
    local z = pipe:getZ()

    sendClientCommand(getPlayer(), 'wp_commands', 'removepipe', {x=x, y=y, z=z})
end

function Vsquare.AddWaterToPipe (x, y, z, amount, isTainted, isFuelSource)
    local globalModData = GetWaterPipingModData()
    local id = Coords2Id(x, y, z)
    local entry = globalModData.DPipes[id]

    if entry then
        if not entry.f then entry.f = 0 end
        if not entry.w then entry.w = 0 end

        if isFuelSource then
            entry.f = entry.f + amount
            if entry.f > 60 then entry.f = 60 end
        else
            entry.w = entry.w + amount
            if entry.w > 60 then entry.w = 60 end
        end

        -- liquid confict
        if entry.w > 0 and entry.f > 0 then
            entry.w = 0
            entry.f = 0
        end

        entry.wt = entry.wt or isTainted
        
        sendClientCommand(getPlayer(), 'wp_commands', 'modifypipe', entry)
    end
end

function Vsquare.UpdateValveStates (x, y, z, states)
    local globalModData = GetWaterPipingModData()
    local id = Coords2Id(x, y, z)
    local entry = globalModData.DPipes[id]

    if entry then
        entry.vs = states
        sendClientCommand(getPlayer(), 'wp_commands', 'modifypipe', entry)
    end
end

function Vsquare.GetPipe (x, y, z)
    local globalModData = GetWaterPipingModData()
    local id = Coords2Id(x, y, z)
    return globalModData.DPipes[id]
end

function Vsquare.AddPump (pump, ef, fresh, fuel)
    local x = pump:getX()
    local y = pump:getY()
    local z = pump:getZ()
    local spriteName = pump:getSprite():getName()

    local entry = {}
    entry.x = x
    entry.y = y
    entry.z = z
    entry.f = 0
    entry.ef = ef
    entry.fr = fresh
    entry.fu = fuel
    entry.st = false
    entry.sh = spriteName

    sendClientCommand(getPlayer(), 'wp_commands', 'addpump', entry)
end

function Vsquare.RemovePump (pump)
    local x = pump:getX()
    local y = pump:getY()
    local z = pump:getZ()

    sendClientCommand(getPlayer(), 'wp_commands', 'removepump', {x=x, y=y, z=z})
end

function Vsquare.TogglePump (x, y, z, st, fresh, fuel)
    local globalModData = GetWaterPipingModData()
    local id = Coords2Id(x, y, z)
    local entry = globalModData.DWorkingPumps[id]

    if entry then
        entry.st = st
        
        if fresh ~= nil then entry.fr = fresh end
        if fuel ~= nil then entry.fu = fuel end

        sendClientCommand(getPlayer(), 'wp_commands', 'modifypump', entry)
    end
end

function Vsquare.RepairPump (x, y, z, ef)
    local globalModData = GetWaterPipingModData()
    local id = Coords2Id(x, y, z)
    local entry = globalModData.DWorkingPumps[id]

    if entry then
        entry.ef = ef
        if entry.ef > 100 then entry.ef = 100 end

        sendClientCommand(getPlayer(), 'wp_commands', 'modifypump', entry)
    end
end

function Vsquare.AddFilterToPump (x, y, z, amount)
    local globalModData = GetWaterPipingModData()
    local id = Coords2Id(x, y, z)
    local entry = globalModData.DWorkingPumps[id]

    if entry then
        entry.f = entry.f + amount
        if entry.f > 100 then entry.f = 100 end

        sendClientCommand(getPlayer(), 'wp_commands', 'modifypump', entry)
    end
end

function Vsquare.GetPump (x, y, z)
    local globalModData = GetWaterPipingModData()
    local id = Coords2Id(x, y, z)

    return globalModData.DWorkingPumps[id]
end
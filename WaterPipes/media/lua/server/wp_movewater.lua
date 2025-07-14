require "Farming/SFarmingSystem"
require "RainBarrel/SRainBarrelSystem"
require "wp_utils"
require "wp_gmd"
require "wp_vsquare"
require "wp_emitters"

-- water pumping logic
function PumpEmergency (object)
    local x = object:getX()
    local y = object:getY()
    local z = object:getZ()

    object:setActivated(false)
    object:sendObjectChange("dryer.state")
    object:transmitModData()

    if isServer() then
        local args = {x=x, y=y, z=z}
        sendServerCommand('wp_commands', 'removeemmiter', args)
    elseif not isClient() then
        WPEmmiters.RemoveEmitter(x, y, z)
    end
end

function AddWaterToPipe (object, amount, tainted)
    local md = object:getModData()

    object:setUsesExternalWaterSource(false)
    object:setWaterAmount(amount)
    object:setMovedThumpable(false)
    object:setTaintedWater(tainted)

    md["waterMax"] = 12
    md["waterAmount"] = amount
    md["taintedWater"] = tainted
    object:transmitModData()

end

function AddWaterToBarrel (object, amount, tainted)

    local sprite = object:getSprite()
    local spriteName = sprite:getName()

    local w = object:getWaterAmount()
    local w_max = object:getWaterMax()
    local w_t = object:isTaintedWater()

    local sprite = object:getSprite()
    local spriteName = sprite:getName()

    -- hack for objects which have watermax = 0
    if w_max < 40 then
        w_max = 40 
    end

    -- hack for water tank which has watermax = 0
    if spriteName == "industry_02_73" and w_max == 0 then w_max = 4000 end

    printd ("ADDING WATER TO " .. spriteName)
    local used = amount
    local new_w = w + amount
    if new_w > w_max then
        new_w = w_max
        used = w_max - w
    end

    local new_w_t = tainted or w_t

    object:setWaterAmount(new_w)
    object:setTaintedWater(new_w_t)
    object:transmitModData()

    if isClient() then
        local args = {x = object:getX(), y = object:getY(), z = object:getZ(), sp = object:getSprite():getName(), w=new_w, wt=new_w_t}
        sendClientCommand(getPlayer(), 'wp_commands', 'adjustwater', args)
    end

    return used
end

function AddFuelToTank(object, amount)

    printd ("ADDING FUEL TO TANK")

    local fuelCurrent = object:getPipedFuelAmount()
    if not fuelCurrent then fuelCurrent = 0 end

    local fuelNew = fuelCurrent + amount
    if fuelNew > 400 then fuelNew = 400 end

    object:setPipedFuelAmount(fuelNew)
    object:transmitModData()
end

function AddWaterToFarm (x, y, z, v)
    local cx = x + v.x
    local cy = y + v.y
    local cz = z + v.z
    local usedWater = 0

    local plant = SFarmingSystem.instance:getLuaObjectAt(cx, cy, cz)
    if plant and plant.waterNeeded > 0 and plant.waterLvl < 100 then
        printd ("ADDING WATER TO FARM AT X: " .. cx .. " Y:" ..  cy .. " Z:" .. cz)
        plant:water(nil, 1)
        usedWater = 1
    end

    return usedWater
end

function PipeFarmVector (spriteName)
    local vectors = {}
    if spriteName == "industry_02_33" then
        table.insert(vectors, {x=0, y=-1, z=0})
        table.insert(vectors, {x=0, y=1, z=0})
    elseif spriteName == "industry_02_32" then
        table.insert(vectors, {x=-1, y=0, z=0})
        table.insert(vectors, {x=1, y=0, z=0})
    end
    return vectors
end

-- based on a shape of the pipe, and the direction from where the water is coming
-- tell me the next square where the water needs to go
-- additionally check if the valve is open
function PipeVector (spriteName, dirFrom, dec)

    -- vs[1] true -> W valve is RC only
    -- vs[2] true -> S valve is RC only
    -- vs[3] true -> N valve is RC only
    -- vs[4] true -> E valve is RC only
    if not dec then dec = 0 end

    local vs = {false, false, false, false}
    for k=1, 4 do
        local t = (2^(4-k))
        if dec - t >= 0 then
            vs[k] = true
            dec = dec - t
        end
    end

    local vectors = {}
    if spriteName == "industry_02_24" and dirFrom == "E" then  -- CORNER
        table.insert(vectors, {x=1, y=0, z=0})
    elseif spriteName == "industry_02_24" and dirFrom == "S" then -- CORNER
        table.insert(vectors, {x=0, y=-1, z=0})

    elseif spriteName == "industry_02_25" and dirFrom == "W" then -- CORNER
        table.insert(vectors, {x=1, y=0, z=0})
    elseif spriteName == "industry_02_25" and dirFrom == "S" then -- CORNER
        table.insert(vectors, {x=0, y=1, z=0})

    elseif spriteName == "industry_02_26" and dirFrom == "N" then -- CORNER
        table.insert(vectors, {x=0, y=1, z=0})
    elseif spriteName == "industry_02_26" and dirFrom == "W" then -- CORNER
        table.insert(vectors, {x=-1, y=0, z=0})

    elseif spriteName == "industry_02_27" and dirFrom == "N" then -- CORNER
        table.insert(vectors, {x=0, y=-1, z=0})
    elseif spriteName == "industry_02_27" and dirFrom == "E" then -- CORNER
        table.insert(vectors, {x=-1, y=0, z=0})

    elseif spriteName == "industry_02_32" and dirFrom == "E" then -- STRAIGHT
        table.insert(vectors, {x=0, y=1, z=0})
    elseif spriteName == "industry_02_32" and dirFrom == "W" then -- STRAIGHT
        table.insert(vectors, {x=0, y=-1, z=0})

    elseif spriteName == "industry_02_33" and dirFrom == "N" then -- STRAIGHT
        table.insert(vectors, {x=1, y=0, z=0})
    elseif spriteName == "industry_02_33" and dirFrom == "S" then -- STRAIGHT
        table.insert(vectors, {x=-1,y= 0, z=0})

    elseif spriteName == "industry_02_35" and dirFrom == "E" then -- BEND
        table.insert(vectors, {x=0, y=1, z=-1})
    elseif spriteName == "industry_02_36" and dirFrom == "N" then -- BEND
        table.insert(vectors, {x=1, y=0, z=-1})
    elseif spriteName == "industry_02_37" and dirFrom == "S" then -- BEND
        table.insert(vectors, {x=-1, y=0, z=-1})
    elseif spriteName == "industry_02_38" and dirFrom == "W" then -- BEND
        table.insert(vectors, {x=0, y=-1, z=-1})

    elseif spriteName == "industry_02_76" and dirFrom == "N" then -- UP
        table.insert(vectors, {x=1, y=0, z=-1})
    elseif spriteName == "industry_02_76" and dirFrom == "S" then -- UP
        table.insert(vectors, {x=-1,y= 0, z=1})

    elseif spriteName == "industry_02_77" and dirFrom == "W" then -- UP
        table.insert(vectors, {x=0, y=-1, z=1})
    elseif spriteName == "industry_02_77" and dirFrom == "E" then -- UP
        table.insert(vectors, {x=0, y=1, z=-1})

    elseif spriteName == "industry_02_78" and dirFrom == "W" then -- UP
        table.insert(vectors, {x=0, y=-1, z=-1})
    elseif spriteName == "industry_02_78" and dirFrom == "E" then -- UP
        table.insert(vectors, {x=0, y=1, z=1})

    elseif spriteName == "industry_02_79" and dirFrom == "N" then -- UP
        table.insert(vectors, {x=1, y=0, z=1})
    elseif spriteName == "industry_02_79" and dirFrom == "S" then -- UP
        table.insert(vectors, {x=-1, y=0, z=-1})

    elseif spriteName == "industry_02_28" and dirFrom == "N" then -- T-SHAPE NWE
        if not vs[3] then table.insert(vectors, {x=0, y=-1, z=0}) end -- e
        if not vs[2] then table.insert(vectors, {x=0, y=1, z=0}) end -- w 
    elseif spriteName == "industry_02_28" and dirFrom == "W" then -- T-SHAPE NWE
        if not vs[1] then table.insert(vectors, {x=-1, y=0, z=0}) end -- n
        if not vs[3] then table.insert(vectors, {x=0, y=-1, z=0}) end -- e
    elseif spriteName == "industry_02_28" and dirFrom == "E" then -- T-SHAPE NWE
        if not vs[2] then table.insert(vectors, {x=0, y=1, z=0}) end -- w
        if not vs[1] then table.insert(vectors, {x=-1, y=0, z=0}) end -- n

    elseif spriteName == "industry_02_29" and dirFrom == "N" then -- T-SHAPE NSW
        if not vs[4] then table.insert(vectors, {x=1, y=0, z=0}) end -- s
        if not vs[2] then table.insert(vectors, {x=0, y=1, z=0}) end -- w
    elseif spriteName == "industry_02_29" and dirFrom == "S" then -- T-SHAPE NSW
        if not vs[2] then table.insert(vectors, {x=0, y=1, z=0}) end -- w
        if not vs[1] then table.insert(vectors, {x=-1, y=0, z=0}) end -- n
    elseif spriteName == "industry_02_29" and dirFrom == "W" then -- T-SHAPE NSW
        if not vs[1] then table.insert(vectors, {x=-1, y=0, z=0}) end -- n
        if not vs[4] then table.insert(vectors, {x=1, y=0, z=0}) end -- s

    elseif spriteName == "industry_02_30" and dirFrom == "S" then -- T-SHAPE SWE
        if not vs[3] then table.insert(vectors, {x=0, y=-1, z=0}) end -- e
        if not vs[2] then table.insert(vectors, {x=0, y=1, z=0}) end -- w
    elseif spriteName == "industry_02_30" and dirFrom == "W" then -- T-SHAPE SWE
        if not vs[4] then table.insert(vectors, {x=1, y=0, z=0}) end -- s
        if not vs[3] then table.insert(vectors, {x=0, y=-1, z=0}) end -- e
    elseif spriteName == "industry_02_30" and dirFrom == "E" then -- T-SHAPE SWE
        if not vs[2] then table.insert(vectors, {x=0, y=1, z=0}) end -- w
        if not vs[4] then table.insert(vectors, {x=1, y=0, z=0}) end -- s

    elseif spriteName == "industry_02_31" and dirFrom == "N" then -- T-SHAPE NSE
        if not vs[4] then table.insert(vectors, {x=1, y=0, z=0}) end -- s
        if not vs[3] then table.insert(vectors, {x=0, y=-1, z=0}) end -- e
    elseif spriteName == "industry_02_31" and dirFrom == "S" then -- T-SHAPE NSE
        if not vs[1] then table.insert(vectors, {x=-1, y=0, z=0}) end -- n
        if not vs[3] then table.insert(vectors, {x=0, y=-1, z=0}) end -- e
    elseif spriteName == "industry_02_31" and dirFrom == "E" then -- T-SHAPE NSE
        if not vs[4] then table.insert(vectors, {x=1, y=0, z=0}) end -- s
        if not vs[1] then table.insert(vectors, {x=-1, y=0, z=0}) end -- n

    elseif spriteName == "industry_02_39" and dirFrom == "N" then -- CROSS
        if not vs[4] then table.insert(vectors, {x=1, y=0, z=0}) end -- s
        if not vs[2] then table.insert(vectors, {x=0, y=1, z=0}) end -- w
        if not vs[3] then table.insert(vectors, {x=0, y=-1, z=0}) end -- e
    elseif spriteName == "industry_02_39" and dirFrom == "S" then -- CROSS
        if not vs[1] then table.insert(vectors, {x=-1, y=0, z=0}) end -- n
        if not vs[2] then table.insert(vectors, {x=0, y=1, z=0}) end -- w
        if not vs[3] then table.insert(vectors, {x=0, y=-1, z=0}) end -- e
    elseif spriteName == "industry_02_39" and dirFrom == "E" then -- CROSS
        if not vs[4] then table.insert(vectors, {x=1, y=0, z=0}) end -- s
        if not vs[1] then table.insert(vectors, {x=-1, y=0, z=0}) end -- n
        if not vs[2] then table.insert(vectors, {x=0, y=1, z=0}) end -- w
    elseif spriteName == "industry_02_39" and dirFrom == "W" then -- CROSS
        if not vs[4] then table.insert(vectors, {x=1, y=0, z=0}) end -- s
        if not vs[1] then table.insert(vectors, {x=-1, y=0, z=0}) end -- n
        if not vs[3] then table.insert(vectors, {x=0, y=-1, z=0}) end -- e

    else
        printd ("no vectors! a barrel?")
    end

    local d = false
    for k, vector in pairs(vectors) do
        if vector["x"] == 1 then d ="N" end
        if vector["x"] == -1 then d ="S" end
        if vector["y"] == 1 then d ="E" end
        if vector["y"] == -1 then d ="W" end
        vectors[k]["d"] = d
    end

    return vectors
end

function PumpWaterToLastPipe(sx, sy, sz, sd, isTainted, isFuelSource, inc)

    if isClient() then return end

    local ts = GameTime:getServerTimeMills()

    local cell = getCell()

    printd ("PUMP WATER")

    local x = sx
    local y = sy
    local z = sz
    local d = sd
    local continue = true
    local used = 0

    while (continue) do

        stack = stack + 1

        -- primary source of truth of pipe network is global moddata
        -- if square is in range then allow sync of global pipe with real world
        local sync = true
        local square = cell:getGridSquare(x, y, z)
        if not square then sync = false end

        -- reverse sync for compatibility with previous versions
        if square then
            local test_vbarrel = Vsquare.GetBarrel(x, y, z)
            if not test_vbarrel then
                local barrelObject = GetBarrelFromSquare(square)
                if barrelObject then
                    Vsquare.AddBarrel(barrelObject)
                    printd ("(REVERSE COMP) ADDED BARREL AT X:" .. x .. " Y:" .. y .. " Z:" .. z)
                end
            end

            local test_vpipe = Vsquare.GetPipe(x, y, z)
            if not test_vpipe then
                local pipeObject = GetPipeFromSquare(square)
                if pipeObject then
                    Vsquare.AddPipe(pipeObject)
                    printd ("(REVERSE COMP) ADDED PIPE AT X:" .. x .. " Y:" .. y .. " Z:" .. z)
                end
            end
        end
        -- end of reverse sync

        local traverseID = x .. "-" .. y .. "-" .. z

        local vbuilding = Vsquare.GetBuildingByPoint(x, y)
        local vbarrel = Vsquare.GetBarrel(x, y, z)
        local vpipe = Vsquare.GetPipe(x, y, z)

        if vbuilding and not isFuelSource then
            printd ("(BUILDING) TRAVERSE:" .. traverseID)

            local cnt = 0
            local vbb = {}

            for _, vb in pairs(Vsquare.GetBarrels()) do
                if vb.x >= vbuilding.x1 and vb.x < vbuilding.x2 and vb.y >= vbuilding.y1 and vb.y < vbuilding.y2 then
                    cnt = cnt + 1
                    table.insert(vbb, vb)
                end
            end

            if cnt > 0 then
                for _, vb in pairs(vbb) do
                    if not vb.wmax then vb.wmax = 20 end
                    
                    local need = vb.wmax - vb.w
                    local add = need
                    if need > inc then
                        add = inc
                    end
                    -- printd ("--> vbmax: " .. vb.wmax .. " vb.w:" .. vb.w .. " inc: " .. inc)
                    if inc > 0 then
                        Vsquare.AddWaterToBarrel(vb.x, vb.y, vb.z, add, isTainted, isFuelSource)
                        if sync then
                            local bsquare = cell:getGridSquare(vb.x, vb.y, vb.z)
                            if bsquare then
                                local barrelObject = GetBarrelFromSquare(bsquare)
                                if barrelObject and not isFuelSource then
                                    add = AddWaterToBarrel(barrelObject, vb.w, isTainted)
                                    Vsquare.ZeroWaterInBarrel(vb.x, vb.y, vb.z)
                                end
                            end
                        end
                        inc = inc - add
                    end
                end
            end
        end

        if vbarrel then
            printd ("(BARREL) TRAVERSE:" .. traverseID)

            pipeTraverse[traverseID] = true

            Vsquare.AddWaterToBarrel(x, y, z, inc, isTainted, isFuelSource)
            if sync then
                local barrelObject = GetBarrelFromSquare(square)
                if barrelObject and not isFuelSource then
                    used = used + AddWaterToBarrel(barrelObject, vbarrel.w, isTainted)
                end

                local tankObject = GetTankFromSquare(square)
                if tankObject and isFuelSource then
                    AddFuelToTank(tankObject, vbarrel.f)
                end

                Vsquare.ZeroWaterInBarrel(x, y, z)
            end
        end

        if vpipe and not pipeTraverse[traverseID] then

            printd ("(PIPE) TRAVERSE:" .. traverseID .. " INC:" .. inc)

            pipeTraverse[traverseID] = true

            Vsquare.AddWaterToPipe(x, y, z, inc, isTainted, isFuelSource)

            --[[if sync then
                local pipeObject = GetPipeFromSquare(square)
                AddWaterToPipe(pipeObject, vpipe.w, isTainted)
            end]]--

            local spriteName = Vsquare.Code2Sprite(vpipe.sh)

            -- FARMING
            if not isFuelSource then
                local farmVectors = PipeFarmVector(spriteName)

                local usedFarming = 0
                for k, v in pairs(farmVectors) do
                    usedFarming = usedFarming + AddWaterToFarm(x, y, z, v)
                end
                inc = inc - usedFarming
                used = used + usedFarming
            end

            -- MOVING WATER FURTHER
            local vectors = PipeVector(spriteName, d, vpipe.vs)

            -- one vector means we may progress linearly without recursion
            -- more vectors mean it is a node and each has to be managed by recursion
            if vectors then

                if #vectors == 1 then
                    local vector = vectors[1]
                    x = x + vector["x"]
                    y = y + vector["y"]
                    z = z + vector["z"]
                    d = vector["d"]

                elseif #vectors > 1 then
                    -- splits integer to most equal integer parts i.e (11, 3) = {4, 4, 3}
                    local newIncParts = splitIntToParts(inc, #vectors)

                    for k, vector in pairs(vectors) do

                        local newInc = newIncParts[k]

                        -- no need to pump if there is no more water
                        if newInc > 0 then
                            vector = vectors[k]
                            local nx = x + vector["x"]
                            local ny = y + vector["y"]
                            local nz = z + vector["z"]
                            local nd = vector["d"]
                            -- printd ("RECURSE NODE, NEXT: " .. nx .. "-" .. ny .. "-" .. nz .. "-" .. nd)

                            used = used + PumpWaterToLastPipe(nx, ny, nz, nd, isTainted, isFuelSource, newInc)
                        else
                            printd ("NO MORE WATER")
                        end
                    end
                else
                    continue = false
                end
            else
                continue = false
            end
        else
            continue = false
        end
    end

    printd ("TIME: " .. (GameTime:getServerTimeMills() - ts))
    return used
end

function MoveWater()

    if isClient() then return end

    printd ("MOVE WATER")

    local pumpFilterUsage = SandboxVars.Plumbing.PumpFilterUsage
    if not pumpFilterUsage then pumpFilterUsage = 0.014 end

    local pumpEfficiencyLoss = SandboxVars.Plumbing.PumpEfficiencyLoss
    if not pumpEfficiencyLoss then pumpEfficiencyLoss = 0.004 end

    local pumpMaxWater = SandboxVars.Plumbing.PumpMaxWater
    if not pumpMaxWater then pumpMaxWater = 12 end

    local world = getWorld()
    local cell = getCell()

    local globalModData = GetWaterPipingModData()

    -- pipes pass, reset water
    for k, v in pairs(globalModData.DPipes) do
        v.w = 0
        v.f = 0
        v.wt = false
    end

    local workingPumps = {}

    -- pumps first pass:
    -- adjusting pump efficiency, filter degradation, emergency stop
    for k, v in pairs(globalModData.DWorkingPumps) do
        local pump = {}
        for kp, vp in pairs(v) do
            pump[kp] = vp
        end

        if not pump.st then pump.st = false end

        if not pump.f then pump.f = 0 end
        if not pump.ef then pump.ef = 100 end

        if pump.st then
            pump.f = pump.f - pumpFilterUsage
            pump.ef = pump.ef - pumpEfficiencyLoss
        end

        if pump.f < 0 then pump.f = 0 end
        if pump.ef < 0 then pump.ef = 0 end

        if pump.ef == 0 then
            pump.st = false
        end

        local sync = true
        local square = cell:getGridSquare(pump.x, pump.y, pump.z)
        if not square then sync = false end
        if sync and pump.st then

            -- low efficiency stop
            if pump.ef < 20 then
                nbr = ZombRand(10 + pump.ef * 5)
                printd ("NBR: " .. nbr)
                if nbr < 2 then
                    printd ("EMERGENCY STOP - WORN OUT")
                    pump.st = false
                    pump.ef = 0
                    local object = GetPumpFromSquare(square)
                    PumpEmergency (object)
                end
                if nbr < 1 then
                    printd ("EMERGENCY STOP - FIRE!")
                    IsoFireManager.StartFire(getCell(), square, true, 20)
                end
            end

            -- no electricity stop
            if not square:haveElectricity() then
                printd ("EMERGENCY STOP - LOST POWER")
                pump.st = false
                local object = GetPumpFromSquare(square)
                PumpEmergency (object)
            end

            -- water source is gone - stop
            if not HasSourceAccess(square) then
                printd ("EMERGENCY STOP - LOST WATER SOURCE")
                pump.st = false
                local object = GetPumpFromSquare(square)
                PumpEmergency (object)
            end

        end

        workingPumps[k] = pump
    end

    globalModData.DWorkingPumps = workingPumps

    stack = 0

    -- pumps second pass:
    -- water pumping for working pumps
    for k, v in pairs(workingPumps) do

        pipeTraverse = {}

        local x = v.x
        local y = v.y
        local z = v.z
        local filterStatus = v.f
        local isFreshWaterSource = v.fr
        local isFuelSource = v.fu
        local efficiencyStatus = v.ef
        local efficiencyFlow = math.ceil(efficiencyStatus * pumpMaxWater / 100)

        printd ("MANAGING VIRTUAL PUMP K:" .. k .. " X:" .. x .. " Y:" .. y .. " Z:" .. z .. " E:" .. string.format("%.3f%%", efficiencyStatus) .. " F:" .. string.format("%.3f%%", filterStatus) .. " ST:" .. tostring(v.st))

        if v.st then

            local used = 0
            isTainted = false
            if filterStatus == 0 and not isFreshWaterSource then isTainted = true end

            -- if we are pumping from barrel
            local lbarrel = GetLuaBarrel(x, y, z)
            if lbarrel then
                if lbarrel.waterAmount < efficiencyFlow then
                    efficiencyFlow = lbarrel.waterAmount
                end
            end

            -- look for first connected pipes to pump
            local testSquares = {}
            table.insert(testSquares, {x=x-1, y=y, dirFrom="S"})
            table.insert(testSquares, {x=x+1, y=y, dirFrom="N"})
            table.insert(testSquares, {x=x, y=y-1, dirFrom="W"})
            table.insert(testSquares, {x=x, y=y+1, dirFrom="E"})

            for k, coords in pairs(testSquares) do
                local square = cell:getGridSquare(coords.x, coords.y, 0)

                --[[ reverse sync for compatibility with previous versions
                if square then
                    local test_vpipe = Vsquare.GetPipe(coords.x, coords.y, 0)
                    if not test_vpipe then
                        local pipeObject = GetPipeFromSquare(square)
                        if pipeObject then
                            Vsquare.AddPipe(pipeObject)
                            printd ("(REVERSE COMP) ADDED PIPE AT X:" .. x .. " Y:" .. y .. " Z:" .. z)
                        end
                    end
                end
                -- end of reverse sync]]

                vpipe = Vsquare.GetPipe(coords.x, coords.y, 0)
                if vpipe then
                    used = used + PumpWaterToLastPipe(coords.x, coords.y, 0, coords.dirFrom, isTainted, isFuelSource, efficiencyFlow)

                    if lbarrel then
                        lbarrel.waterAmount = lbarrel.waterAmount - used
        
                        local isoObject = lbarrel:getIsoObject()
                        if isoObject then -- object might have been destroyed
                            isoObject:setWaterAmount(lbarrel.waterAmount)
                            isoObject:transmitModData()
                        end

                    end

                    printd ("USED WATER:" .. used)
                end
            end
        end
    end

    -- tell clients what we did
    if isServer() then
        ModData.transmit("WaterPiping")
    end

    printd ("STACK:" .. stack)
end

print ("-------------------------------")
print ("- waterpipes movewater active -")
print ("-------------------------------")


Events.EveryTenMinutes.Add(MoveWater)




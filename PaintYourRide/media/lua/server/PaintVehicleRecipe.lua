require('PaintVehicleConfig')

PaintVehicleRecipe = {}
PaintVehicleRecipe.OnCreate = {}
PaintVehicleRecipe.OnTest = {}

function PaintVehicleRecipe.OnTest.SprayGunBatteryInsert(sourceItem, result)
    if sourceItem:getFullType() == PaintVehicleConfig.ITEMS.SPRAY_GUN then
        return sourceItem:getUsedDelta() == 0
    end
    return true
end

function PaintVehicleRecipe.OnCreate.SprayGunBatteryInsert(items, result, player)
    for i = 0, items:size() - 1 do
        if items:get(i):getType() == "Battery" then
            result:setUsedDelta(items:get(i):getUsedDelta())
        end
    end
end

function PaintVehicleRecipe.OnTest.SprayGunBatteryRemoval(sourceItem, result)
    return sourceItem:getUsedDelta() > 0
end

function PaintVehicleRecipe.OnCreate.SprayGunBatteryRemoval(items, result, player)
    for i = 0, items:size() - 1 do
        local item = items:get(i)
        if item:getFullType() == PaintVehicleConfig.ITEMS.SPRAY_GUN then
            result:setUsedDelta(item:getUsedDelta())
            item:setUsedDelta(0)
        end
    end
end

function PaintVehicleRecipe.OnCreate.DismantleSprayGun(items, result, player)
    for i = 1, items:size() do
        local item = items:get(i - 1)
        if item:getFullType() == PaintVehicleConfig.ITEMS.SPRAY_GUN then
            if item:getUsedDelta() > 0 then
                local battery = player:getInventory():AddItem("Base.Battery")
                if battery then
                    battery:setUsedDelta(item:getUsedDelta())
                end
            end
            break
        end
    end
end

-- -------------------------
-- --- Boxes with paints ---
-- -------------------------

local ITEMS = {
    SPRAYS = {
        {
            "PaintYourRide.AutomotiveSprayPaintBlack",
            "PaintYourRide.AutomotiveSprayPaintBlue",
            "PaintYourRide.AutomotiveSprayPaintGreen",
            "PaintYourRide.AutomotiveSprayPaintGrey",
            "PaintYourRide.AutomotiveSprayPaintRed",
            "PaintYourRide.AutomotiveSprayPaintWhite",
        },
        {
            "PaintYourRide.AutomotiveSprayPaintBlueOlympic",
            "PaintYourRide.AutomotiveSprayPaintBrownRusty",
            "PaintYourRide.AutomotiveSprayPaintGreenForest",
            "PaintYourRide.AutomotiveSprayPaintGreySteel",
            "PaintYourRide.AutomotiveSprayPaintOrangeTangerine",
            "PaintYourRide.AutomotiveSprayPaintPinkBubbleGum",
            "PaintYourRide.AutomotiveSprayPaintRedCandyApple",
            "PaintYourRide.AutomotiveSprayPaintVioletGrape",
            "PaintYourRide.AutomotiveSprayPaintYellow",
        },
        {
            "PaintYourRide.AutomotiveSprayPaintBlueNavy",
            "PaintYourRide.AutomotiveSprayPaintBrownDarkChocolate",
            "PaintYourRide.AutomotiveSprayPaintGreenArmy",
            "PaintYourRide.AutomotiveSprayPaintPinkGlamorous",
            "PaintYourRide.AutomotiveSprayPaintRedBurgundy",
            "PaintYourRide.AutomotiveSprayPaintYellowTuscany"
        },
        {
            "PaintYourRide.AutomotiveSprayPaintBlueNeon",
            "PaintYourRide.AutomotiveSprayPaintGreenNeon",
            "PaintYourRide.AutomotiveSprayPaintVioletIndigo",
            "PaintYourRide.AutomotiveSprayPaintYellowNeon",
        },
    },
    TINTS = {
        "PaintYourRide.AutomotiveTintPaintRed",
        "PaintYourRide.AutomotiveTintPaintYellow",
        "PaintYourRide.AutomotiveTintPaintGreen",
        "PaintYourRide.AutomotiveTintPaintCyan",
        "PaintYourRide.AutomotiveTintPaintBlue",
        "PaintYourRide.AutomotiveTintPaintMagenta",
        "PaintYourRide.AutomotiveTintPaintBlack"
    }
}

function PaintVehicleRecipe.OnCreate.OpenBoxTints(items, result, player)
    local resultNum = items:get(0):getDrainableUsesInt()

    local fullCans
    if resultNum == 8 then
        fullCans = ZombRand(5) == 0 -- 20% chance for full bottles
    end

    local resultItemTypes = {}
    for i = 1, resultNum do
        local itemTypeIndex = ZombRand(7) + 1
        if i ~= 8 then
            while (resultItemTypes[ITEMS.TINTS[itemTypeIndex]] ~= nil) -- already added, roll new type
            do
                itemTypeIndex = ZombRand(7) + 1
            end
            resultItemTypes[ITEMS.TINTS[itemTypeIndex]] = true
        else
            -- Black tint
            itemTypeIndex = 7
        end

        local item = player:getInventory():AddItem(ITEMS.TINTS[itemTypeIndex])
        if fullCans then
            item:setUsedDelta(1)
        else
            item:setUsedDelta(item:getUseDelta() * (ZombRand(90) + 11)) -- 10 to 100 uses
        end
    end

    if fullCans and ZombRand(2) == 0 then
        player:getInventory():AddItem(PaintVehicleConfig.ITEMS.CATALOGUE_TINTS)
    end
end

function PaintVehicleRecipe.OnCreate.OpenBoxSprays(items, result, player)
    local resultNum = items:get(0):getDrainableUsesInt()
    local category = tonumber(string.sub(items:get(0):getType(), -1))
    local itemTypeIndex = ZombRand(#ITEMS.SPRAYS[category]) + 1
    local itemType = ITEMS.SPRAYS[category][itemTypeIndex]

    local fullCans
    if resultNum == 4 then
        fullCans = ZombRand(5) == 0 -- 20% chance for full cans
    end

    for _ = 1, resultNum do
        local item = player:getInventory():AddItem(itemType)
        if fullCans then
            item:setUsedDelta(1)
        else
            item:setUsedDelta(item:getUseDelta() * (ZombRand(10) + 1)) -- 1 to 10 uses
        end
    end

    if fullCans and ZombRand(2) == 0 then
        player:getInventory():AddItem(PaintVehicleConfig.ITEMS.CATALOGUE_SPRAYS)
    end
end
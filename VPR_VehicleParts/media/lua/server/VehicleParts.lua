--used for tires/batteries
function Recipe.OnCreate.RepairItem(items, result, player, selectedItem)
	local mechanics = player:getPerkLevel(Perks.Mechanics)
	local conditionBase = math.min(mechanics*10, 80)
	local conditionMax = math.min(80, (conditionBase + ZombRand(0, 15)))
	
	result:setCondition(conditionMax)
	player:getXp():AddXP(Perks.Mechanics, conditionMax/5)
end


--used for other parts
function Recipe.OnCreate.PartQuality(items, result, player, selectedItem)
	local mechanics = player:getPerkLevel(Perks.Mechanics)
	local welding = player:getPerkLevel(Perks.MetalWelding)
	local conditionBase = (mechanics * 6) + (welding * 6)
	local conditionMax = math.min(100, (conditionBase + ZombRand(-15, 10)))
 
	result:setCondition(conditionMax)
	player:getXp():AddXP(Perks.MetalWelding, conditionMax/5)
	player:getXp():AddXP(Perks.Mechanics, conditionMax/5)
	player:getXp():AddXP(Perks.Strength, 8)
end

-- tires
function Recipe.OnCreate.TireStandard(items, result, player, selectedItem)
    local comboskill = (player:getPerkLevel(Perks.Mechanics)+player:getPerkLevel(Perks.MetalWelding))/2
    local TireType = nil
    if comboskill >= 9 then
        TireType = "ModernTire1"
    elseif comboskill >= 6 then
        TireType = "NormalTire1"
    elseif comboskill >= 3 then
        TireType = "OldTire1"
    end

    if TireType then

        player:getInventory():AddItem(TireType)
        player:getXp():AddXP(Perks.MetalWelding, 4)
        player:getXp():AddXP(Perks.Mechanics, 4)
        player:getXp():AddXP(Perks.Strength, 8)
    end
end

function Recipe.OnCreate.TireHeavy(items, result, player, selectedItem)
    local comboskill = (player:getPerkLevel(Perks.Mechanics)+player:getPerkLevel(Perks.MetalWelding))/2
    local TireType = nil
    if comboskill >= 9 then
        TireType = "ModernTire2"
    elseif comboskill >= 6 then
        TireType = "NormalTire2"
    elseif comboskill >= 3 then
        TireType = "OldTire2"
    end

    if TireType then
        player:getInventory():AddItem(TireType)
        player:getXp():AddXP(Perks.MetalWelding, 4)
        player:getXp():AddXP(Perks.Mechanics, 4)
        player:getXp():AddXP(Perks.Strength, 8)
    end
end

function Recipe.OnCreate.TireSport(items, result, player, selectedItem)
    local comboskill = (player:getPerkLevel(Perks.Mechanics)+player:getPerkLevel(Perks.MetalWelding))/2
    local TireType = nil
    if comboskill >= 9 then
        TireType = "ModernTire3"
    elseif comboskill >= 6 then
        TireType = "NormalTire3"
    elseif comboskill >= 3 then
        TireType = "OldTire3"
    end

    if TireType then
        player:getInventory():AddItem(TireType)
        player:getXp():AddXP(Perks.MetalWelding, 4)
        player:getXp():AddXP(Perks.Mechanics, 4)
        player:getXp():AddXP(Perks.Strength, 8)
    end
end

-- mufflers
function Recipe.OnCreate.MufflerStandard(items, result, player, selectedItem)
    local MechSkill = player:getPerkLevel(Perks.Mechanics)
	local WeldSkill = player:getPerkLevel(Perks.MetalWelding)
    local MufflerType = nil

	local conditionMax = math.min(100, (WeldSkill*15 + ZombRand(-5, 5)))
    if MechSkill >= 9 then
        MufflerType = "ModernCarMuffler1"
    elseif MechSkill >= 6 then
        MufflerType = "NormalCarMuffler1"
    elseif MechSkill >= 3 then
        MufflerType = "OldCarMuffler1"
    end

    if MufflerType then
        player:getInventory():AddItem(MufflerType)
		player:getInventory():FindAndReturn(MufflerType):setCondition(conditionMax)
        player:getXp():AddXP(Perks.MetalWelding, WeldSkill)
        player:getXp():AddXP(Perks.Mechanics, MechSkill)
        player:getXp():AddXP(Perks.Strength, 8)
    end
end

function Recipe.OnCreate.MufflerHeavy(items, result, player, selectedItem)
    local MechSkill = player:getPerkLevel(Perks.Mechanics)
	local WeldSkill = player:getPerkLevel(Perks.MetalWelding)
    local MufflerType = nil

	local conditionMax = math.min(100, (WeldSkill*15 + ZombRand(-5, 5)))
    if MechSkill >= 9 then
        MufflerType = "ModernCarMuffler2"
    elseif MechSkill >= 6 then
        MufflerType = "NormalCarMuffler2"
    elseif MechSkill >= 3 then
        MufflerType = "OldCarMuffler2"
    end

    if MufflerType then
        player:getInventory():AddItem(MufflerType)
		player:getInventory():FindAndReturn(MufflerType):setCondition(conditionMax)
        player:getXp():AddXP(Perks.MetalWelding, WeldSkill)
        player:getXp():AddXP(Perks.Mechanics, MechSkill)
        player:getXp():AddXP(Perks.Strength, 8)
    end
end

function Recipe.OnCreate.MufflerSport(items, result, player, selectedItem)
    local MechSkill = player:getPerkLevel(Perks.Mechanics)
	local WeldSkill = player:getPerkLevel(Perks.MetalWelding)
    local MufflerType = nil

	local conditionMax = math.min(100, (WeldSkill*15 + ZombRand(-5, 5)))
    if MechSkill >= 9 then
        MufflerType = "ModernCarMuffler3"
    elseif MechSkill >= 6 then
        MufflerType = "NormalCarMuffler3"
    elseif MechSkill >= 3 then
        MufflerType = "OldCarMuffler3"
    end

    if MufflerType then
        player:getInventory():AddItem(MufflerType)
		player:getInventory():FindAndReturn(MufflerType):setCondition(conditionMax)
        player:getXp():AddXP(Perks.MetalWelding, WeldSkill)
        player:getXp():AddXP(Perks.Mechanics, MechSkill)
        player:getXp():AddXP(Perks.Strength, 8)
    end
end

-- suspensions
function Recipe.OnCreate.SuspensionStandard(items, result, player, selectedItem)
    local MechSkill = player:getPerkLevel(Perks.Mechanics)
	local WeldSkill = player:getPerkLevel(Perks.MetalWelding)
    local SuspensionType = nil

	local conditionMax = math.min(100, (WeldSkill*15 + ZombRand(-5, 5)))
    if MechSkill >= 9 then
        SuspensionType = "ModernSuspension1"
    elseif MechSkill >= 6 then
        SuspensionType = "NormalSuspension1"
    end

    if SuspensionType then
        player:getInventory():AddItem(SuspensionType)
		player:getInventory():FindAndReturn(SuspensionType):setCondition(conditionMax)
        player:getXp():AddXP(Perks.MetalWelding, WeldSkill)
        player:getXp():AddXP(Perks.Mechanics, MechSkill)
        player:getXp():AddXP(Perks.Strength, 8)
    end
end

function Recipe.OnCreate.SuspensionHeavy(items, result, player, selectedItem)
    local MechSkill = player:getPerkLevel(Perks.Mechanics)
	local WeldSkill = player:getPerkLevel(Perks.MetalWelding)
    local SuspensionType = nil

	local conditionMax = math.min(100, (WeldSkill*15 + ZombRand(-5, 5)))
    if MechSkill >= 9 then
        SuspensionType = "ModernSuspension2"
    elseif MechSkill >= 6 then
        SuspensionType = "NormalSuspension2"
    end

    if SuspensionType then
        player:getInventory():AddItem(SuspensionType)
		player:getInventory():FindAndReturn(SuspensionType):setCondition(conditionMax)
        player:getXp():AddXP(Perks.MetalWelding, WeldSkill)
        player:getXp():AddXP(Perks.Mechanics, MechSkill)
        player:getXp():AddXP(Perks.Strength, 8)
    end
end

function Recipe.OnCreate.SuspensionSport(items, result, player, selectedItem)
    local MechSkill = player:getPerkLevel(Perks.Mechanics)
	local WeldSkill = player:getPerkLevel(Perks.MetalWelding)
    local SuspensionType = nil

	local conditionMax = math.min(100, (WeldSkill*15 + ZombRand(-5, 5)))
    if MechSkill >= 9 then
        SuspensionType = "ModernSuspension3"
    elseif MechSkill >= 6 then
        SuspensionType = "NormalSuspension3"
    end

    if SuspensionType then
        player:getInventory():AddItem(SuspensionType)
		player:getInventory():FindAndReturn(SuspensionType):setCondition(conditionMax)
        player:getXp():AddXP(Perks.MetalWelding, WeldSkill)
        player:getXp():AddXP(Perks.Mechanics, MechSkill)
        player:getXp():AddXP(Perks.Strength, 8)
    end
end

-- Gas Tanks
function Recipe.OnCreate.GasTankStandard(items, result, player, selectedItem)
    local MechSkill = player:getPerkLevel(Perks.Mechanics)
	local WeldSkill = player:getPerkLevel(Perks.MetalWelding)
    local GasTankType = nil

	local conditionMax = math.min(100, (WeldSkill*15 + ZombRand(-5, 5)))
    if MechSkill >= 9 then
        GasTankType = "BigGasTank1"
    elseif MechSkill >= 6 then
        GasTankType = "NormalGasTank1"
    elseif MechSkill >= 3 then
        GasTankType = "SmallGasTank1"
    end

    if GasTankType then
        player:getInventory():AddItem(GasTankType)
		player:getInventory():FindAndReturn(GasTankType):setCondition(conditionMax)
        player:getXp():AddXP(Perks.MetalWelding, WeldSkill)
        player:getXp():AddXP(Perks.Mechanics, MechSkill)
        player:getXp():AddXP(Perks.Strength, 8)
    end
end

function Recipe.OnCreate.GasTankHeavy(items, result, player, selectedItem)
    local MechSkill = player:getPerkLevel(Perks.Mechanics)
	local WeldSkill = player:getPerkLevel(Perks.MetalWelding)
    local GasTankType = nil

	local conditionMax = math.min(100, (WeldSkill*15 + ZombRand(-5, 5)))
    if MechSkill >= 9 then
        GasTankType = "BigGasTank2"
    elseif MechSkill >= 6 then
        GasTankType = "NormalGasTank2"
    elseif MechSkill >= 3 then
        GasTankType = "SmallGasTank2"
    end

    if GasTankType then
        player:getInventory():AddItem(GasTankType)
		player:getInventory():FindAndReturn(GasTankType):setCondition(conditionMax)
        player:getXp():AddXP(Perks.MetalWelding, WeldSkill)
        player:getXp():AddXP(Perks.Mechanics, MechSkill)
        player:getXp():AddXP(Perks.Strength, 8)
    end
end

function Recipe.OnCreate.GasTankSport(items, result, player, selectedItem)
    local MechSkill = player:getPerkLevel(Perks.Mechanics)
	local WeldSkill = player:getPerkLevel(Perks.MetalWelding)
    local GasTankType = nil

	local conditionMax = math.min(100, (WeldSkill*15 + ZombRand(-5, 5)))
    if MechSkill >= 9 then
        GasTankType = "BigGasTank3"
    elseif MechSkill >= 6 then
        GasTankType = "NormalGasTank3"
    elseif MechSkill >= 3 then
        GasTankType = "SmallGasTank3"
    end

    if GasTankType then
        player:getInventory():AddItem(GasTankType)
		player:getInventory():FindAndReturn(GasTankType):setCondition(conditionMax)
        player:getXp():AddXP(Perks.MetalWelding, WeldSkill)
        player:getXp():AddXP(Perks.Mechanics, MechSkill)
        player:getXp():AddXP(Perks.Strength, 8)
    end
end

-- brakes
function Recipe.OnCreate.BrakeStandard(items, result, player, selectedItem)
    local MechSkill = player:getPerkLevel(Perks.Mechanics)
	local WeldSkill = player:getPerkLevel(Perks.MetalWelding)
    local BrakeType = nil

	local conditionMax = math.min(100, (WeldSkill*15 + ZombRand(-5, 5)))
    if MechSkill >= 9 then
        BrakeType = "ModernBrake1"
    elseif MechSkill >= 6 then
        BrakeType = "NormalBrake1"
    elseif MechSkill >= 3 then
        BrakeType = "OldBrake1"
    end

    if BrakeType then
        player:getInventory():AddItem(BrakeType)
		player:getInventory():FindAndReturn(BrakeType):setCondition(conditionMax)
        player:getXp():AddXP(Perks.MetalWelding, WeldSkill)
        player:getXp():AddXP(Perks.Mechanics, MechSkill)
        player:getXp():AddXP(Perks.Strength, 8)
    end
end

function Recipe.OnCreate.BrakeHeavy(items, result, player, selectedItem)
    local MechSkill = player:getPerkLevel(Perks.Mechanics)
	local WeldSkill = player:getPerkLevel(Perks.MetalWelding)
    local BrakeType = nil

	local conditionMax = math.min(100, (WeldSkill*15 + ZombRand(-5, 5)))
    if MechSkill >= 9 then
        BrakeType = "ModernBrake2"
    elseif MechSkill >= 6 then
        BrakeType = "NormalBrake2"
    elseif MechSkill >= 3 then
        BrakeType = "OldBrake2"
    end

    if BrakeType then
        player:getInventory():AddItem(BrakeType)
		player:getInventory():FindAndReturn(BrakeType):setCondition(conditionMax)
        player:getXp():AddXP(Perks.MetalWelding, WeldSkill)
        player:getXp():AddXP(Perks.Mechanics, MechSkill)
        player:getXp():AddXP(Perks.Strength, 8)
    end
end

function Recipe.OnCreate.BrakeSport(items, result, player, selectedItem)
    local MechSkill = player:getPerkLevel(Perks.Mechanics)
	local WeldSkill = player:getPerkLevel(Perks.MetalWelding)
    local BrakeType = nil

	local conditionMax = math.min(100, (WeldSkill*15 + ZombRand(-5, 5)))
    if MechSkill >= 9 then
        BrakeType = "ModernBrake3"
    elseif MechSkill >= 6 then
        BrakeType = "NormalBrake3"
    elseif MechSkill >= 3 then
        BrakeType = "OldBrake3"
    end

    if BrakeType then
        player:getInventory():AddItem(BrakeType)
		player:getInventory():FindAndReturn(BrakeType):setCondition(conditionMax)
        player:getXp():AddXP(Perks.MetalWelding, WeldSkill)
        player:getXp():AddXP(Perks.Mechanics, MechSkill)
        player:getXp():AddXP(Perks.Strength, 8)
    end
end

function Recipe.OnCreate.EngineParts(items, result, player, selectedItem)
    local ComboSkill = player:getPerkLevel(Perks.Mechanics)+player:getPerkLevel(Perks.MetalWelding)+player:getPerkLevel(Perks.Electricity)
	local PartsNum = math.floor(ComboSkill/1.5)

    player:getInventory():AddItems("EngineParts",PartsNum)
    player:getXp():AddXP(Perks.MetalWelding, PartsNum)
    player:getXp():AddXP(Perks.Mechanics, PartsNum)
    player:getXp():AddXP(Perks.Electricity, PartsNum)

end

function Recipe.OnGiveXP.MechWeldScaled(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, player:getPerkLevel(Perks.Mechanics)*5);
	player:getXp():AddXP(Perks.MetalWelding, player:getPerkLevel(Perks.MetalWelding)*5);
	player:getXp():AddXP(Perks.Strength, 12);
end
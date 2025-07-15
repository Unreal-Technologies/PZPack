require "Camping/camping_fuel";


local function InitNewFuel()
	campingFuelType["WoodChips"] = 25.0/60.0 
	campingFuelType["DryGrass"] = 1.0/60.0

	campingLightFireType["Twigs"] = -1.0
	campingLightFireType["DryGrass"] = 1.0/60.0
end

Events.OnGameStart.Add(InitNewFuel)
require 'Foraging/forageSystem'

Events.onAddForageDefs.Add(function()

	local Grass = {
		name					= "Grass",
		typeCategory            = "Materials",
		identifyCategoryPerk    = "PlantScavenging",
		identifyCategoryLevel   = 0,
		categoryHidden          = false,
		validFloors =			{ "floors_exterior_natural", "blends_natural" },
		zoneChance = {
			DeepForest      = 150,
			Forest          = 150,
			Vegitation      = 75,
			FarmLand        = 35,
			Farm            = 35,
			TrailerPark     = 10,
			TownZone        = 10,
			Nav             = 15,
		},
		chanceToMoveIcon        = 20.0,
		chanceToCreateIcon      = 10.0,
		focusChanceMin			= 25.0,
		focusChanceMax			= 40.0,
	};

	local sprites = {
		{ "media/textures/Foraging/worldSprites/DryGrass_worldSprite.png" },
		{ "media/textures/Foraging/worldSprites/DryGrass2_worldSprite.png" },
		{ "media/textures/Foraging/worldSprites/DryGrass3_worldSprite.png" },
	};

	local DryGrass = {
		type = "ExtCampfire.DryGrass",
		minCount = 1,
		maxCount = 3,
		xp = 1,
		rainChance = -490,
		snowChance = -20,
		categories = { "Grass" },
		zones = {
			DeepForest	= 10,
			Forest		= 15,
			Vegitation	= 30,
			FarmLand	= 30,
			Farm		= 25,
			TrailerPark = 25,
			TownZone	= 15,
			Nav			= 10,
		},
		bonusMonths = { 8, 9, 1, 2 },
		malusMonths = { 4, 5, 6 },
		altWorldTexture = sprites,
	};

	forageSystem.addCatDef(Grass, false);
	forageSystem.addItemDef(DryGrass);

end)
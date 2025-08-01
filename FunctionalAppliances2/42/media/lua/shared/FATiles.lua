FA = FA or {}

FA.smallCorkBoards = {
	"location_business_office_generic_01_7",
	"location_business_office_generic_01_15"
}

FA.largeCorkBoards = {
	"location_business_office_generic_01_36",
	"location_business_office_generic_01_37",
	"location_business_office_generic_01_38",
	"location_business_office_generic_01_39"
}

FA.pegBoards = {
	"location_business_machinery_01_24",
	"location_business_machinery_01_25",
	"location_business_machinery_01_26",
	"location_business_machinery_01_27"
}

FA.poolCueStand = {
	"recreational_01_4",
	"recreational_01_5"
}

FA.napkinDispensers = {
	"location_shop_accessories_01_10",
	"location_shop_accessories_01_11"
}

FA.paperTowelDispensers = {
	"fixtures_bathroom_01_14",
	"fixtures_bathroom_01_15",
	"fixtures_bathroom_01_16",
	"fixtures_bathroom_01_17"
}

FA.hotdogMachines = {
	"location_shop_fossoil_01_10",
	"location_shop_fossoil_01_11"
}

FA.popcornMachines = {
	"location_entertainment_theatre_01_17"
}

FA.slurpNBurps = {
	"location_shop_zippee_01_56",
	"location_shop_zippee_01_57"
}

FA.sodaFountains = {
	"location_shop_accessories_01_8",
	"location_shop_accessories_01_9",
	"location_shop_accessories_01_12",
	"location_shop_accessories_01_13"
}

FA.addContainerTypes = function()
    	local containerVals = IsoWorld.PropertyValueMap:get("container") or ArrayList.new()
    	if not containerVals:contains("bulletinBoard") then 
		containerVals:add("bulletinBoard") 
	end
    	if not containerVals:contains("largeBulletinBoard") then 
		containerVals:add("largeBulletinBoard") 
	end
    	if not containerVals:contains("pegBoard") then 
		containerVals:add("pegBoard") 
	end
    	if not containerVals:contains("pegBoard") then 
		containerVals:add("pegBoard") 
	end
    	if not containerVals:contains("poolCueStand") then 
		containerVals:add("poolCueStand") 
	end
    	if not containerVals:contains("napkinDispenser") then 
		containerVals:add("napkinDispenser") 
	end
    	if not containerVals:contains("papertowelDispenser") then 
		containerVals:add("papertowelDispenser") 
	end
    	if not containerVals:contains("hotdogMachine") then 
		containerVals:add("hotdogMachine") 
	end
    	if not containerVals:contains("popcornMachine") then 
		containerVals:add("popcornMachine") 
	end
    	if not containerVals:contains("slurpNBurp") then 
		containerVals:add("slurpNBurp") 
	end
    	IsoWorld.PropertyValueMap:put("container", containerVals)

    	local containerCapactityVals = IsoWorld.PropertyValueMap:get("ContainerCapacity") or ArrayList.new()
    	if not containerCapactityVals:contains("2") then 
		containerCapactityVals:add("2") 
	end
    	if not containerCapactityVals:contains("110") then 
		containerCapactityVals:add("110") 
	end
	IsoWorld.PropertyValueMap:put("ContainerCapacity", containerCapactityVals)
end

Events.OnInitWorld.Add(FA.addContainerTypes)

FA.loadedTiles = function(manager)
    	for each, name in ipairs(FA.smallCorkBoards) do
        	local properties = manager:getSprite(name):getProperties()
        	properties:Set(IsoFlagType.container)
        	properties:Set("container", "bulletinBoard", false) --false to not add the flag instead of string and unique values need to be set beforehand see above
       		properties:Set("ContainerCapacity", "2", false)
        	properties:CreateKeySet()
    	end

    	for each, name in ipairs(FA.largeCorkBoards) do
        	local properties = manager:getSprite(name):getProperties()
        	properties:Set(IsoFlagType.container)
        	properties:Set("container", "largeBulletinBoard", false) 
       		properties:Set("ContainerCapacity", "2", false)
        	properties:CreateKeySet()
    	end
	
    	for each, name in ipairs(FA.pegBoards) do
        	local properties = manager:getSprite(name):getProperties()
		properties:UnSet(IsoFlagType.WallOverlay) -- was not working because it's attached to a wall
        	properties:Set(IsoFlagType.container)
        	properties:Set("container", "pegBoard", false) 
        	properties:Set("ContainerCapacity", "25", false)
        	properties:CreateKeySet()
   	end

    	for each, name in ipairs(FA.poolCueStand) do
        	local properties = manager:getSprite(name):getProperties()
		properties:UnSet(IsoFlagType.WallOverlay) -- was not working because it's attached to a wall
        	properties:Set(IsoFlagType.container)
        	properties:Set("container", "poolCueStand", false) 
        	properties:Set("ContainerCapacity", "5", false)
        	properties:CreateKeySet()
   	end

    	for each, name in ipairs(FA.napkinDispensers) do
        	local properties = manager:getSprite(name):getProperties()
        	properties:Set(IsoFlagType.container)
        	properties:Set("container", "napkinDispenser", false) 
       		properties:Set("ContainerCapacity", "2", false)
        	properties:CreateKeySet()
    	end

    	for each, name in ipairs(FA.paperTowelDispensers) do
        	local properties = manager:getSprite(name):getProperties()
        	properties:Set(IsoFlagType.container) 
        	properties:Set("container", "papertowelDispenser", false) 
       		properties:Set("ContainerCapacity", "2", false)
        	properties:CreateKeySet()
    	end

    	for each, name in ipairs(FA.hotdogMachines) do
        	local properties = manager:getSprite(name):getProperties()
        	properties:Set(IsoFlagType.container) 
        	properties:Set("container", "hotdogMachine", false) 
       		properties:Set("ContainerCapacity", "5", false)
        	properties:CreateKeySet()
    	end

    	for each, name in ipairs(FA.popcornMachines) do
        	local properties = manager:getSprite(name):getProperties()
        	properties:Set(IsoFlagType.container) 
        	properties:Set("container", "popcornMachine", false) 
       		properties:Set("ContainerCapacity", "5", false)
        	properties:CreateKeySet()
    	end

    	for each, name in ipairs(FA.slurpNBurps) do
        	local properties = manager:getSprite(name):getProperties()
		properties:Set(IsoFlagType.waterPiped)
        	properties:Set(IsoFlagType.container) 
        	properties:Set("container", "slurpNBurp", false) 
       		properties:Set("ContainerCapacity", "110", false)
        	properties:CreateKeySet()
    	end

    	for each, name in ipairs(FA.sodaFountains) do
        	local properties = manager:getSprite(name):getProperties()
		properties:Set(IsoFlagType.waterPiped)
        	properties:CreateKeySet()
    	end
end

Events.OnLoadedTileDefinitions.Add(FA.loadedTiles)
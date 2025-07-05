require("StoryItemDefinitions_Example.lua")
require("StoryItemManager.lua")

StoryItemSpawner = StoryItemSpawner or {}

StoryItemSpawner.storyList = StoryItemSpawner.storyList or {}
StoryItemSpawner.spawnSettings = StoryItemSpawner.spawnSettings or {}


local propaneTanksInGarages = {
    name = "PropaneTanksInGarages",
    storyWeightChance = 5,
    items = {
        {itemId = "Base.PropaneTank", chance = 100},
    },
    chanceOnFloor = 8,
    chanceOnFurniture = 0,
    furnitureMinOffsetZ = 60, 
    furnitureMaxOffsetZ = 90,
    itemCountPerTileMin = 1,
    itemCountPerTileMax = 1,
    maxStoryCountPerRoom = 1,
    rooms = {
        garagestorage = 1,
        garage = 1,
        shed = 0.2,
        gasstorage = 0.5,
    },
    spritesMatch = false,
    sprites = false,
    spritesToIgnore = false,
}


StoryItemSpawner.storyList[propaneTanksInGarages.name] = propaneTanksInGarages


-- Sandbox settings
-- function StoryItemSpawner.SetChances()
--     local SIS = SandboxVars.StoryItemSpawner
--     StoryItemSpawner.storyList[propaneTanksInGarages.name].chanceOnFloor = SIS.PropaneTanksInGaragesBaseChanceOnFloor or 2
-- end

-- Events.OnGameStart.Add(StoryItemSpawner.SetChances);
-- Events.OnNewGame.Add(StoryItemSpawner.SetChances);
-- Events.OnServerStarted.Add(StoryItemSpawner.SetChances);
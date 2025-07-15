require("StoryItemDefinitions_Example.lua")
require("StoryItemManager.lua")

StoryItemSpawner = StoryItemSpawner or {}

StoryItemSpawner.storyList = StoryItemSpawner.storyList or {}
StoryItemSpawner.spawnSettings = StoryItemSpawner.spawnSettings or {}


local roomLoot = {
    name = "roomLoot",
    storyWeightChance = 10,
    itemCountPerTileMin = 1,
    itemCountPerTileMax = 2,
    maxStoryCountPerRoom = false,
    items = {
        {roomLoot = true, chance = 10},
    },
    chanceOnFloor = 3,
    chanceOnFurniture = 25,
    furnitureMinOffsetZ = 20, 
    furnitureMaxOffsetZ = 90,
    rooms = {
        allRooms = true,
        hall = 0.4,
        theatre = 0.2,
        gym = 0.5,
        classroom = 1.2,
        classroom2 = 1.2,
        empty = 0.2,
        emptyoutside = 0.2,
        furniturestore = 0.2,
        furniturestorage = 0.2,
        policestorage = 1.5,
        gunstorestorage = 1.5,
        gunstore = 1.5,
    },
    spritesMatch = false,
    sprites = false,
    spritesToIgnore = {
        appliances_cooking_01_1 = 1,
        appliances_cooking_01_2 = 1,
        appliances_cooking_01_3 = 1,
        appliances_cooking_01_4 = 1,
        appliances_cooking_01_5 = 1,
        appliances_cooking_01_6 = 1,
        appliances_cooking_01_7 = 1,
        appliances_cooking_01_8 = 1,
        appliances_cooking_01_9 = 1,
        appliances_cooking_01_10 = 1,
        appliances_cooking_01_11 = 1,
        appliances_cooking_01_12 = 1,
        appliances_cooking_01_13 = 1,
        appliances_cooking_01_14 = 1,
        appliances_cooking_01_15 = 1,
    }
}


StoryItemSpawner.storyList[roomLoot.name] = roomLoot

-- Sandbox settings
function StoryItemSpawner.SetChances()
    local SIS = SandboxVars.StoryItemSpawner
    StoryItemSpawner.storyList.roomLoot.chanceOnFloor = SIS.RoomLootBaseChanceOnFloor or 3
    StoryItemSpawner.storyList.roomLoot.chanceOnFurniture = SIS.RoomLootBaseChanceOnFurniture or 25
end
Events.OnGameStart.Add(StoryItemSpawner.SetChances);
Events.OnNewGame.Add(StoryItemSpawner.SetChances);
Events.OnServerStarted.Add(StoryItemSpawner.SetChances);

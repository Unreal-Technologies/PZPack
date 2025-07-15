-- StoryItemSpawner = StoryItemSpawner or {}


-- require "Items/SuburbsDistributions"
-- require "Items/ProceduralDistributions"
-- require "Vehicles/VehicleDistributions"
-- require "SpritesSurfaceDimensions.lua"

-- SuburbsDistributions = SuburbsDistributions or {}
-- ProceduralDistributions = ProceduralDistributions or {}
-- VehicleDistributions = VehicleDistributions or {}

-- StoryItemSpawner.storyList = StoryItemSpawner.storyList or {}
-- StoryItemSpawner.spawnSettings = StoryItemSpawner.spawnSettings or {}



-- -- EXAMPLE of a story definition:
-- Example = {
--     -- the name of the story. Must be unique enough.
--     name = "example", 

--     -- This is a weight chance that determines how often this story is picked over other stories.
--     -- if you have only one story, it's useless.
--     -- example, you have Story A with a weight chance of 20, and story B with a weight chance of 40. Story B will be randomly selected twice more often than story A. 
--     -- Keep in mind that stories that can only spawn in specific rooms or specific sprites will not have their storyWeightChance accoutned for other rooms/sprites
--     storyWeightChance = 10,
    
--     -- The minimum number of randomly picked items to spawn on the same tile
--     -- must be less than itemCountPerTileMax
--     itemCountPerTileMin = 2,

--     -- The maximum number of randomly picked items to spawn on the same tile
--     -- must be less than itemCountPerTileMax
--     itemCountPerTileMax = 3,

--     -- A list of entries to choose from to pick what is spawned. A random entry within the list will be selected to spawn in the world.
--     -- the chances are specific to each entry, and are not affected by chance multipliers
--     -- If you use itemId, don't set proceduralTable or roomLoot to true.
--     items = {
--         {itemId = "Base.TinCan", chance = 50},
--         {itemId = "Base.Pizza", chance = 12},
--         {itemId = "farming.HandShovel", chance = 6},
--         {itemId = "Base.Hammer", chance = 5},
--         {itemId = "camping.CampingTentKit", chance = 0.5},
--         {itemId = "Base.Katana", chance = 0.00001}, -- chance cannot go beyond 5 digits

--         {roomLoot = true, chance = 10}, -- Special entry. if roomLoot = true, the item spawned will be randomly selected from game's procedural loot tables, depending on the room
        
--         {proceduralTable = true, table = SuburbsDistributions.all.crate, chance = 10,}, -- Special entry. if proceduralTable = true, the item picked will be a selected from the table. Table format mus tmatch the vanilla loot distributions. Don't pick a table with procList. The chance key still works like for a normal item.
--         {proceduralTable = true, table = ProceduralDistributions.list.DrugShackWeapons, chance = 10,}, 
--         {proceduralTable = true, table = VehicleDistributions.TrunkStandard, chance = 5,},

--         {
--             proceduralTable = true,
--             table = {-- example of a standard vanilla-style loot table :
--                 rolls = 4,
--                 items = {
--                     "Base.TinCan", 10,
--                     "Base.Pizza", 5,
--                     "farming.HandShovel", 4,
--                 },
--                 junk = { rolls = 1, items = {}},
--             },
--             chance = 10,
--         },
--     },

--     -- the max number of tiles this story can spawn on in the current room. Set this on false to not have a maximum.
--     maxStoryCountPerRoom = 50,

--     -- chance of spawning the story (%) on the ground.
--     chanceOnFloor = 5,

--     -- chance of spawning the story (%) on furniture.
--     chanceOnFurniture = 90,

--     -- furnitureMinOffsetZ: minimum furniture offset. Furniture with a height lower than this will be ignored for this story.
--     -- Must be lower than furnitureMinOffsetZ and less than 100.
--     furnitureMinOffsetZ = 20, 

--     -- furnitureMaxOffsetZ : maximum furniture offset. Furniture with a height higher than this will be ignored for this story.
--     -- Must be higher than furnitureMinOffsetZ and more than 0.
--     furnitureMaxOffsetZ = 50,

--     -- For reference: here are some furniture heights examples: 
--     -- 12 = height of low tables
--     -- 15 = height of TV tables
--     -- 17 = height of sofas and chairs
--     -- 21 = height of bars stools
--     -- 23 = height of some beds
--     -- 27 = height of some tables. 
--     -- 29 = height of some beds.
--     -- 31 = height of some tables. 
--     -- 32  = height of wood crates. 
--     -- 34 = height of counters
--     -- 50 = height of some shelves
--     -- 58 = height of some shelves
--     -- 60 = height of fridges and high wall shelves
--     -- 78 = height of cupboards
--     -- 80 = height of bookshelves

--     -- rooms: A table of rooms where the items will spawn. If you set it to false (rooms = false), then the story can spawn in any room.
--     rooms = {

--         allRooms = true, -- if you set this to true, the story can spawn in any room
--         kitchen = 1, -- Values are chance multipliers
--         hall = 0.5,
--         diningroom = 1,
--         theatre = 0.01,
--         gym = 0.01,
--     },

--     -- sprites: a list of specific sprite keys, with a table of spawn settings as value. The key names must correspond exactly to the name of a sprite in game.
--     -- Checked only for furniture spawns, not for floor spawns.
--     -- In debug, you can enable the Brush Tool cheat, and rightclick on a tile to check its sprite name. 
--     -- This takes priority over spritesMatch.
--     sprites = {
--         -- according to the sprite, you might want different spawn settings.
--         -- For example, a counter can be oriented south, north, east, or west, and so you could chance the spawn setting table of that sprite according to that. Also, a chair has much less surface for items to spawn on compared to a table. If you get those wrong, you'll spawn items levitating above the ground.
--         -- I have made some usable presets at the top of this file: 'default', 'onFloorDefault', 'orientedNorth', 'orientedSouth', 'orientedEast', 'orientedWest', 'middleHalfChance'
--         furniture_bedding_01_01 = SpriteDimensions.default,
--         furniture_bedding_01_02 = SpriteDimensions.orientedNorth,
--         furniture_bedding_01_03 = SpriteDimensions.orientedSouth,
--         furniture_bedding_01_04 = SpriteDimensions.orientedEast,
--         furniture_bedding_01_05 = SpriteDimensions.orientedWest,
--         furniture_bedding_01_06 = SpriteDimensions.defaultOnFloor,
--         furniture_bedding_01_07 = SpriteDimensions.middleHalfChance,
--     },

--     -- spritesMatch : a list of specific keys that are words that will be searched in the sprite's name for a match, with a table of spawn settings as value.
--     -- Checked only if for furniture, not for the floor.
--     -- Example : furniture_bedding_01_01 contains the word "bedding", so that sprite will be a match and an item can spawn on it. As will all sprites named furniture_bedding_XX_XX.
--     -- Downside is not being able to change spawn settings according to the sprite , AND it uses more performance because of using the string.match() function.
--     spritesMatch = {
--         bedding = SpriteDimensions.default,
--         table = SpriteDimensions.default
--     },

--     -- sprites and spriteMatch can both be set on false : in that case, the story will be spawnable on all sprites. 
--     -- sprites = false,
--     -- spritesMatch = false


--     -- spritesToIgnore : the story will never spawn on these sprites.
--     spritesToIgnore = {
--         appliances_cooking_01_01 = 1,
--         appliances_cooking_01_02 = 1,
--         appliances_cooking_01_03 = 1,
--         appliances_cooking_01_04 = 1,
--         appliances_cooking_01_05 = 1,
--         appliances_cooking_01_06 = 1,
--         appliances_cooking_01_07 = 1,
--         appliances_cooking_01_08 = 1,
--         appliances_cooking_01_09 = 1,
--         appliances_cooking_01_10 = 1,
--         appliances_cooking_01_11 = 1,
--         appliances_cooking_01_12 = 1,
--         appliances_cooking_01_13 = 1,
--         appliances_cooking_01_14 = 1,
--         appliances_cooking_01_15 = 1,
--     }
-- }


-- local testLoot = {
--     name = "testLoot",
--     storyWeightChance = 20,
--     itemCountPerTileMin = 1,
--     itemCountPerTileMax = 1,
--     maxItemCountPerRoom = false,
--     items = {
--         {itemId = "Hammer", chance = 10},
--         {itemId = "Bread", chance = 10},
--         {itemId = "DuctTape", chance = 10},
--     },
--     chanceOnFloor = 10,
--     chanceOnFurniture = 50,
--     furnitureMinOffsetZ = 20, 
--     furnitureMaxOffsetZ = 95,
--     rooms = {
--         allRooms = true,
--         bedroom = 5,
--         kitchen = 0.01
--     },
--     spritesMatch = false,
--     sprites = false,
--     spritesToIgnore = false
-- }

-- -- Finally, you can insert thes Example stories in the storyList like this:

-- -- StoryItemSpawner.storyList[testLoot.name] = testLoot
-- -- StoryItemSpawner.storyList[Example.name] = Example


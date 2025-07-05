-- require("StoryItemSpawnerManager.lua")

-- StoryItemSpawner = StoryItemSpawner or {}


-- -- for debug purposes. Call these functions in the console

-- if StoryItemSpawner.testMode then
--     function StoryItemSpawner.Dump(o)
--         if type(o) == 'table' then
--            local s = '{ '
--            for k,v in pairs(o) do
--               if type(k) ~= 'number' then k = '"'..k..'"' end
--               s = s .. '['..k..'] = ' .. StoryItemSpawner.Dump(v) .. ','
--            end
--            return s .. '} '
--         else
--            return tostring(o)
--         end
--      end
--      -- print(StoryItemSpawner.Dump(ProceduralDistributions.list.GunStoreAmmo))

--     function StoryItemSpawner.GetCurrentRoom()
--         local room = getPlayer():getSquare():getRoom()
--         if room then
--             StoryItemSpawner.noise(room:getName())
--         else
--             StoryItemSpawner.noise("no room")
--         end
--     end

--     function StoryItemSpawner.CheckCurrentRoom()
--         local room = getPlayer():getSquare():getRoom()
--         if room then
--             StoryItemSpawner.CheckRoom(room)
--         else
--             StoryItemSpawner.noise("no room")
--         end
--     end

--     function StoryItemSpawner.GetTallestObjectSprite()
--         local playerSquare = getPlayer():getSquare()
--         local tileObjects = playerSquare:getLuaTileObjectList();
--         local squareSurfaceOffset = -1;
--         local tallestObject;
--         for k, object in pairs(tileObjects) do
--             local objectSurfaceOffset = object:getSurfaceOffset()
--             if objectSurfaceOffset > squareSurfaceOffset then
--                 squareSurfaceOffset = objectSurfaceOffset
--                 tallestObject = object
--             end
--             local objectSurfaceOffsetNoTable = object:getSurfaceOffsetNoTable()
--             if objectSurfaceOffsetNoTable > squareSurfaceOffset then
--                 squareSurfaceOffset = objectSurfaceOffsetNoTable
--                 tallestObject = object
--             end
--         end
        
--         if tallestObject then
--             local tallestObjectSprite = tallestObject:getSprite()
--             if tallestObjectSprite then
--                 local tallestObjectSpriteName = tallestObjectSprite:getName()
--                 StoryItemSpawner.noise("tallest object sprite = "..tallestObjectSpriteName.. " with zoffset = "..squareSurfaceOffset.." surfaceNormalOffset = "..tallestObject:getSurfaceNormalOffset())

--                 local table = StoryItemSpawner.GetPossibleStoriesForThisTile(tallestObjectSpriteName, squareSurfaceOffset, playerSquare:getRoom(), 0)
--                 StoryItemSpawner.noise("Possible stories for this square : "..StoryItemSpawner.Dump(table))
--                 return tallestObjectSpriteName
--             end
--         end
--         return false
--     end

--     function StoryItemSpawner.GetRoomsListCount()
--         StoryItemSpawner.noise("Room List Count :"..#StoryItemSpawner.roomsList)
--     end

--     function StoryItemSpawner.PrintDistanceOfPlayerToHisLastPosition()
--         local player = getPlayer()
--         local playerX = player:getX()
--         local playerY = player:getY()
--         local playerZ = player:getZ()
--         local distance = StoryItemSpawner.calculateDistance(playerX, playerY, playerZ, StoryItemSpawner.lastPlayerPosition.x or playerX, StoryItemSpawner.lastPlayerPosition.y or playerY, StoryItemSpawner.lastPlayerPosition.z or playerZ)
--         StoryItemSpawner.noise("Distance to last player position : "..math.floor(distance*1000)/1000)
--     end


--     function StoryItemSpawner.RollItemOnSquare()
--         local player = getPlayer()
--         local playerSquare = player:getSquare()
--         local tileObjects = playerSquare:getLuaTileObjectList();
--         local squareSurfaceOffset = -1;
--         local tallestObject;
--         local room = playerSquare:getRoom()

--         -- get the object with the highest offset
--         for k, object in pairs(tileObjects) do
--             local objectSprite = object:getSprite()
--             local objectSpriteName = false
--             if objectSprite then
--                 objectSpriteName = objectSprite:getName()
--             end
--             local objectSurfaceOffsetNoTable = object:getSurfaceOffsetNoTable()
--             if objectSurfaceOffsetNoTable > squareSurfaceOffset then
--                 if not objectSpriteName or not StoryItemSpawner.spritesListToIgnoreOffset[objectSpriteName] or squareSurfaceOffset < 5 then
--                     squareSurfaceOffset = objectSurfaceOffsetNoTable
--                     tallestObject = object
--                 end
--             end
--             local objectSurfaceOffset = object:getSurfaceOffset()
--             if objectSurfaceOffset > squareSurfaceOffset then
--                 if not objectSpriteName or not StoryItemSpawner.spritesListToIgnoreOffset[objectSpriteName] or squareSurfaceOffset < 5 then
--                     squareSurfaceOffset = objectSurfaceOffset
--                     tallestObject = object
--                 end
--             end
--         end
        
--         if tallestObject then
--             local tallestObjectSprite = tallestObject:getSprite()
--             if tallestObjectSprite then
--                 local tallestObjectSpriteName = tallestObjectSprite:getName()
--                 if tallestObjectSpriteName then
--                     local possibleStoriesForThisTile = StoryItemSpawner.GetPossibleStoriesForThisTile(tallestObjectSpriteName, squareSurfaceOffset, room, 0)
--                     if possibleStoriesForThisTile then 
--                         local story = StoryItemSpawner.SelectRandomStory(possibleStoriesForThisTile)
--                         if story then
--                             local storySpawned =  StoryItemSpawner.RollStory(story, tallestObjectSpriteName, playerSquare, squareSurfaceOffset, room);
--                         end
--                     end
                    
--                 end
--             end
--         end
--     end
--     function StoryItemSpawner.CheckZone() 
--         local player = getPlayer();
--         if not player then return; end
--         local playerSquare = player:getSquare()
--         local zoneType = playerSquare:getZoneType()
--         if not zoneType then print("No zone type.")
--         else print("Zone type = "..zoneType)
--         end
--         if not playerSquare:isOutside() then
--             local room = playerSquare:getRoom()
--             if room then print("Room name = "..room:getName())
--             else print("No room.")
--             end
--         end
--     end
-- end

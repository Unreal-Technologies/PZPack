

function StoryItemSpawner.UpdateChanceMultipliers()

    local SIS = SandboxVars.StoryItemSpawner
    local startDay = SIS.StartDay or 2
    local peakDay = SIS.PeakDay or 100
    local chanceOnFloorMultiplierStartDay = SIS.ChanceOnFloorMultiplierStartDay or 1
    local chanceOnFloorMultiplierPeakDay = SIS.ChanceOnFloorMultiplierPeakDay or 0.2
    local chanceOnFurnitureMultiplierStartDay = SIS.ChanceOnFurnitureMultiplierStartDay or 1
    local chanceOnFurnitureMultiplierPeakDay = SIS.ChanceOnFurnitureMultiplierPeakDay or 0.2

    local worldAgeDays = math.floor(GameTime:getInstance():getWorldAgeHours()/24 + 0.5);
    if worldAgeDays <= startDay then
        StoryItemSpawner.noise("worldAgeDays < startDay")
        StoryItemSpawner.ChanceOnFloorMultiplier = chanceOnFloorMultiplierStartDay;
        StoryItemSpawner.ChanceOnFurnitureMultiplier = chanceOnFurnitureMultiplierStartDay
        StoryItemSpawner.noise("Setting ChanceOnFloorMultiplier ="..chanceOnFloorMultiplierStartDay)
        StoryItemSpawner.noise("Setting ChanceOnFurnitureMultiplier ="..chanceOnFurnitureMultiplierStartDay)
    elseif worldAgeDays >= peakDay then
        StoryItemSpawner.noise("worldAgeDays > peakay")
        StoryItemSpawner.ChanceOnFloorMultiplier = chanceOnFloorMultiplierPeakDay;
        StoryItemSpawner.ChanceOnFurnitureMultiplier = chanceOnFurnitureMultiplierPeakDay
        StoryItemSpawner.noise("Setting ChanceOnFloorMultiplier ="..chanceOnFloorMultiplierPeakDay)
        StoryItemSpawner.noise("Setting ChanceOnFurnitureMultiplier ="..chanceOnFurnitureMultiplierPeakDay)
    else
        StoryItemSpawner.noise("startDay < worldAgeDays < peakay")
        local chanceOnFloorMult = math.floor((chanceOnFloorMultiplierStartDay + (chanceOnFloorMultiplierPeakDay-chanceOnFloorMultiplierStartDay) * (worldAgeDays - startDay) / (peakDay - startDay))*100 + 0.5)/100
        StoryItemSpawner.ChanceOnFloorMultiplier = chanceOnFloorMult
        local chanceOnFurMult = math.floor((chanceOnFurnitureMultiplierStartDay + (chanceOnFurnitureMultiplierPeakDay-chanceOnFurnitureMultiplierStartDay) * (worldAgeDays - startDay) / (peakDay - startDay))*100 + 0.5)/100
        StoryItemSpawner.ChanceOnFurnitureMultiplier = chanceOnFurMult
        
        StoryItemSpawner.noise("Setting ChanceOnFloorMultiplier ="..chanceOnFloorMult)
        StoryItemSpawner.noise("Setting ChanceOnFurnitureMultiplier ="..chanceOnFurMult)
    end
end



Events.OnGameStart.Add(StoryItemSpawner.UpdateChanceMultipliers);
Events.OnNewGame.Add(StoryItemSpawner.UpdateChanceMultipliers);
Events.OnServerStarted.Add(StoryItemSpawner.UpdateChanceMultipliers);
Events.EveryDays.Add(StoryItemSpawner.UpdateChanceMultipliers);
Events.OnDusk.Add(StoryItemSpawner.UpdateChanceMultipliers);
Events.OnDawn.Add(StoryItemSpawner.UpdateChanceMultipliers);
Events.OnPostDistributionMerge.Add(StoryItemSpawner.UpdateChanceMultipliers);

--- porobably better ways to do this ----

CaliberValue={
  "Base.Bullets9mm",15,1,0.125,"PistolSilencedAction","PistolSilenced",
  "Base.40Bullets",15,1,0.1875,"PistolSilencedAction","PistolSilenced",
  "Base.Bullets45",15,0.8,0.25,"SubPistolSilencedAction","SubPistolSilenced",
  "Base.45LCBullets",15,0.8,0.25,"SubPistolSilencedAction","SubPistolSilenced",
  "Base.10mmBullets",20,1,0.1875,"MagnumSilencedAction","MagnumSilenced",
  "Base.357Bullets",20,1,0.125,"MagnumSilencedAction","MagnumSilenced",
  "Base.Bullets44",20,1,0.25,"MagnumSilencedAction","MagnumSilenced",
  "Base.30CarBullets",20,1,0.0625,"MagnumSilencedAction","MagnumSilenced",
  "Base.76239Bullets",35,1,0.0625,"CarbineSilencedAction","CarbineSilenced",
  "Base.3030Bullets",35,1,0.0625,"CarbineSilencedAction","CarbineSilenced",
  "Base.556Bullets",35,1,0,"CarbineSilencedAction","CarbineSilenced",
  "Base.223Bullets",35,1,0,"CarbineSilencedAction","CarbineSilenced",
  "Base.308Bullets",40,1,0.0625,"RifleSilencedAction","RifleSilenced",
  "Base.3006Bullets",40,1,0.0625,"RifleSilencedAction","RifleSilenced",
  "Base.792Bullets",40,1,0.09375,"RifleSilencedAction","RifleSilenced",
  "Base.Bullets38",5,0.8,0.125,"SubPistolSilencedAction","SubPistolSilenced",
  "Base.380Bullets",5,0.8,0.125,"SubPistolSilencedAction","SubPistolSilenced",
  "Base.25Bullets",-5,1,0.15,"22SilencedAction","22Silenced",
  "Base.22Bullets",-5,1,0.15,"22SilencedAction","22Silenced",
  "Base.Slugs",35,1,0.33,"ShotgunSilencedAction","ShotgunSilenced",
  "Base.ShotgunShells",35,1,0.25,"ShotgunSilencedAction","ShotgunSilenced"
  }

local function SilencerCondition(player, weapon)
  local player = getPlayer()	
  local weapon = player:getPrimaryHandItem()
  if weapon == nil or not weapon:getCategory():contains("Weapon") or not weapon:isRanged() or weapon:getCanon() == nil  then return end
  local canon = weapon:getCanon()
  if canon then
    if canon:getModData()["isSilencerCon"] then
      local moditem = canon:getModData()
      local candur = moditem.modCan_Dur
      local shock = 0
      local durability = 0
      for index, preset in ipairs(CaliberValue) do
        if (index % 6) == 1 and preset == weapon:getAmmoType() then
          shock = CaliberValue[index + 1]
        end
      end
      durability = 60 - (shock - candur) + (5 - canon:getModData().mod_fouling)
      if ZombRand(1, durability) == 1 then
        if (canon:getCondition() == 0) or ((canon:getCondition() - 1) == 0) then
          if canon:getCondition() > 0 then
            canon:setCondition(canon:getCondition() - 1)
          end  
          newcanon = InventoryItemFactory.CreateItem(canon:getType() .. "Broken")
          newcanon:setCondition(canon:getCondition())
          newcanon:getModData().mod_fouling = canon:getModData().mod_fouling
          weapon:detachWeaponPart(canon)
          weapon:attachWeaponPart(newcanon) 
        elseif canon:getCondition() > 0 then
          canon:setCondition(canon:getCondition() - 1)
        end
        weapon:getModData()["modCan_Con"] = canon:getCondition()
      end
      if ZombRand(1,41) == 1 then
        if canon:getModData().mod_fouling < 11 then	
          canon:getModData().mod_fouling = (canon:getModData().mod_fouling) + 1
        elseif canon:getModData().mod_fouling > 10 then
          canon:getModData().mod_fouling = 10
        end
        weapon:getModData()["mod_canfoul"] = canon:getModData()["mod_fouling"]
      end
    end
  end
end

Events.OnPlayerAttackFinished.Add(SilencerCondition);

local function SilencerData(player, weapon)
  local player = getPlayer()	
  local weapon = player:getPrimaryHandItem()
  if weapon == nil or not weapon:getCategory():contains("Weapon") or not weapon:isRanged() or weapon:getCanon() == nil  then return end
  local canon = weapon:getCanon()
  if canon then
    if canon:getModData()["isSilencerCon"] then
      local moddata = weapon:getModData()
      canon:setCondition(moddata.modCan_Con)
      canon:getModData()["mod_fouling"] = moddata.mod_canfoul
    end
  end
end

Events.OnEquipPrimary.Add(SilencerData);

local function SilencerCon(wielder, weapon)
  	
	local player = getPlayer()
	if player == nil then return end
    local weapon = player:getPrimaryHandItem()
    if weapon == nil or not weapon:getCategory():contains("Weapon") or not weapon:isRanged() or weapon:getCanon() == nil  then return end
    local canon = weapon:getCanon()
    if canon then
      if canon:getModData()["isSilencerCon"] then
        local moddata = weapon:getModData()
        if weapon:getModData()["modCan_Con"] then
          canon:setCondition(moddata.modCan_Con)
          canon:getModData()["mod_fouling"] = moddata.mod_canfoul
        end
      end
    end
end

Events.OnGameStart.Add(function() 
  local player = getPlayer()
  SilencerCon(player, player:getPrimaryHandItem())
end)

local function CanBooster (wielder, weapon)
  	
	local player = getPlayer()
	if player == nil then return end
    local weapon = player:getPrimaryHandItem()
    if weapon == nil or not weapon:getTags():contains("ReqBooster") or weapon:getCanon() == nil or player:isDoShove() then return end
    local canon = weapon:getCanon()
    local ammocount = weapon:getCurrentAmmoCount()
    if canon:getTags():contains("Booster") then
      if getDebug() then
        print("With Booster")
      end
      return
    elseif not canon:getTags():contains("Booster") then
      if weapon:isRoundChambered() then
        weapon:setSpentRoundChambered(true)
        weapon:setRoundChambered(false)
        if weapon:getCurrentAmmoCount() > 0 then
        weapon:setCurrentAmmoCount((ammocount)+1)
        end
      end
      if getDebug() then
        print("No Booster")
      end
    end
end

Events.OnPlayerAttackFinished.Add(CanBooster);

local function SilencerEff(wielder, weapon)

    if weapon == nil or not weapon:getCategory():contains("Weapon") or not weapon:isRanged() then return end
    local scriptItem = weapon:getScriptItem()

    local soundRadius = scriptItem:getSoundRadius()
    local swingSound = scriptItem:getSwingSound()
    local canon = weapon:getCanon()
    local manualop = 1

    if weapon:getModData()['isMustRack'] then
      manualop = 0.8
    end
    if canon then
      if canon:getModData()['isSilencer'] then
        local moditem = canon:getModData()
        local cansize = moditem.modBore_Eff
        local caneff = moditem.modSound_Eff
        local subsonic = 1
        local boresize = 1
        local boresize = 1
        for index, preset in ipairs(CaliberValue) do
          if (index % 6) == 1 and preset == weapon:getAmmoType() then
            subsonic = CaliberValue[index + 2]
            boresize = CaliberValue[index + 3]
            if not weapon:getModData()['isMustRack'] then
              swingSound = CaliberValue[index + 4] 
            elseif weapon:getModData()['isMustRack'] then           
              swingSound = CaliberValue[index + 5]
            end
            if getDebug() then
              print("Ammo Type:" .. weapon:getAmmoType())
              print("Swing Sound" .. swingSound)
            end
          end
        end
        if not canon:getModData()['isOilFilter'] then
          bore = (cansize - boresize)
        elseif canon:getModData()['isOilFilter'] then
          bore = 1
        end
        if getDebug() then
          print("bore:" .. bore)
        end
        local efficiency = (caneff*(subsonic)*(manualop)*(bore))
        soundRadius = (((soundRadius * efficiency) + ((canon:getModData().mod_fouling) - 5)) * (SandboxVars.Guns93.Guns93SilencerEff))
      end
    end

    soundRadius = (soundRadius * (SandboxVars.Guns93.Guns93SoundAdjust))

    weapon:setSoundVolume(soundRadius)
    weapon:setSoundRadius(soundRadius)
    weapon:setSwingSound(swingSound)
    
    if getDebug() then
      print("ManualOp:" .. manualop)
      print("Firearm sound radius: " .. weapon:getSoundRadius())
    end
end

Events.OnPlayerAttackFinished.Add(SilencerEff);
Events.OnEquipPrimary.Add(SilencerEff);
Events.OnGameStart.Add(function() 
  local player = getPlayer()
  SilencerEff(player, player:getPrimaryHandItem())
end)
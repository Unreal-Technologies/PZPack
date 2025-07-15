-------Experimenting. I would selective fire guns to behave like their non auto counterparts in semiauto--------

function GunStatAdjust(player, weapon)
    local player = getPlayer()	
    local weapon = player:getPrimaryHandItem()
    if not (instanceof(weapon, "HandWeapon") and weapon:isRanged()) then return end
    if weapon == nil then return end
    if weapon:getTags():contains("Guns93") then
        local moditem = weapon:getModData()
        local recoilDelay = moditem.modAuto_Recoil
        local canon = 0
        local pad = 0
        recoilDelay = recoilDelay * SandboxVars.Guns93.Guns93RecoilAdjust
        weapon:setRecoilDelay(recoilDelay)
        if weapon:getModData()["mod_fouling"] then
            local moddata = weapon:getModData()  
            local conChance = weapon:getScriptItem():getConditionLowerChance()
            local howDirty = 0
            if moddata.mod_fouling > weapon:getBloodLevel() then
                howDirty = weapon:getModData()["mod_fouling"]
            elseif weapon:getBloodLevel() > moddata.mod_fouling then
                howDirty = weapon:getBloodLevel()
            end
            local jamChance = moditem.mod_Jam
            if howDirty > 8 then
                weapon:setConditionLowerChance(conChance * 0.5)
                weapon:setJamGunChance(jamChance * 1.5)
            elseif howDirty > 6 then
                weapon:setConditionLowerChance(conChance * 0.75)
                weapon:setJamGunChance(jamChance)
            elseif howDirty > 3 then
                weapon:setConditionLowerChance(conChance)
                weapon:setJamGunChance(jamChance * 0.75)
            elseif howDirty < 4 then
                weapon:setConditionLowerChance(conChance * 1.5)
                weapon:setJamGunChance(jamChance * 0.5)
            end
        end
        if weapon:getFireMode() == "Auto" or weapon:getFireMode() == "modBurst" then
            local moditem = weapon:getModData()
            weapon:setRecoilDelay(0)
            weapon:setHitChance(moditem.modAuto_ToHit - (moditem.modAuto_Recoil / 3))
        elseif weapon:getFireMode() == "Single" then
            local moditem = weapon:getModData()
            weapon:setRecoilDelay(moditem.modAuto_Recoil)
            weapon:setHitChance(moditem.modAuto_ToHit)
        end
        if weapon:getCanon() then
            if weapon:getCanon():getModData()['mod_RecoilDelayMod']then
                canon = weapon:getCanon():getModData()['mod_RecoilDelayMod']
            end
        end
        if weapon:getRecoilpad() then
            if weapon:getRecoilpad():getModData()['mod_RecoilDelayMod'] then
                pad = weapon:getRecoilpad():getModData()['mod_RecoilDelayMod']
            end
        end
        if weapon:getSwingAnim() == "Handgun" then
            if weapon:getRecoilDelay() < (SandboxVars.Guns93.Guns93HandgunRecoilMin + canon + pad) then
                recoilDelay = SandboxVars.Guns93.Guns93HandgunRecoilMin
            end
        elseif weapon:getSwingAnim() == "Rifle" then
            if weapon:getRecoilDelay() < (SandboxVars.Guns93.Guns93LongGunRecoilMin + canon + pad) then
                recoilDelay = SandboxVars.Guns93.Guns9LongGunRecoilMin
            end
        end
    end
end
Events.OnWeaponSwing.Add(GunStatAdjust)
Events.OnEquipPrimary.Add(GunStatAdjust)
Events.OnGameStart.Add(function() 
    local player = getPlayer()
    GunStatAdjust(player, player:getPrimaryHandItem())
end)
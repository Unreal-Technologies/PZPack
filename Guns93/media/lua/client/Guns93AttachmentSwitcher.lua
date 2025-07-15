local function FakeCanonSwitcher(player, weapon)
	
    local player = getPlayer()	
    local weapon = player:getPrimaryHandItem()
    if weapon == nil or not weapon:getCategory():contains("Weapon") then return end
	local canon = weapon:getCanon()
    if canon then
        if weapon:getTags():contains("Buckshot") then
            if canon:getFullType() == "Base.ChokeTubeFull_Fake" then
                canon = InventoryItemFactory.CreateItem("Base.ChokeTubeFull")
            elseif canon:getFullType() == "Base.ChokeTubeImproved_Fake" then
                canon = InventoryItemFactory.CreateItem("Base.ChokeTubeFull")
            elseif canon:getFullType() == "Base.ChokeTubeRifled" then
                canon = InventoryItemFactory.CreateItem("Base.ChokeTubeRifled_Fake")
            end
        elseif weapon:getTags():contains("Slug") then
            if canon:getFullType() == "Base.ChokeTubeFull" then
                canon = InventoryItemFactory.CreateItem("Base.ChokeTubeFull_Fake")
            elseif canon:getFullType() == "Base.ChokeTubeImproved" then
                canon = InventoryItemFactory.CreateItem("Base.ChokeTubeFull_Fake")
            elseif canon:getFullType() == "Base.ChokeTubeRifled_Fake" then
                canon = InventoryItemFactory.CreateItem("Base.ChokeTubeRifled")
            end
        elseif weapon:getTags():contains("BayoUsed") then
            if canon:getFullType() == "Base.ChokeTubeFull" then
                canon = InventoryItemFactory.CreateItem("Base.ChokeTubeFull_Fake")
            elseif canon:getFullType() == "Base.ChokeTubeImproved" then
                canon = InventoryItemFactory.CreateItem("Base.ChokeTubeFull_Fake")
			elseif canon:getFullType() == "Base.ChokeTubeRifled" then
				canon = InventoryItemFactory.CreateItem("Base.ChokeTubeRifled_Fake")
            end 
        end
		weapon:attachWeaponPart(canon)
	end
end

Events.OnEquipPrimary.Add(FakeCanonSwitcher);
  
Events.OnGameStart.Add(function() 
    local player = getPlayer()
    FakeCanonSwitcher(player, player:getPrimaryHandItem())
end)

local function FakeScopeSwitcher(player, weapon)
	
	local player = getPlayer()
	if player == nil then return end
	local weapon = player:getPrimaryHandItem()
    if weapon == nil or not weapon:getCategory():contains("Weapon") then return end
	local scope = weapon:getScope()
	if scope then
		if weapon:getTags():contains("BayoUsed") then
			if scope:getFullType() == "Base.x2Scope" then
				scope = InventoryItemFactory.CreateItem("Base.x2Scope_Fake")
			elseif scope:getFullType() == "Base.x3Scope" then
				scope = InventoryItemFactory.CreateItem("Base.x3Scope_Fake")
			elseif scope:getFullType() == "Base.x4Scope" then
				scope = InventoryItemFactory.CreateItem("Base.x4Scope_Fake")
			elseif scope:getFullType() == "Base.x6Scope" then
				scope = InventoryItemFactory.CreateItem("Base.x6Scope_Fake")
			elseif scope:getFullType() == "Base.x8Scope" then
				scope = InventoryItemFactory.CreateItem("Base.x8Scope_Fake")
			elseif scope:getFullType() == "Base.x10Scope" then
				scope = InventoryItemFactory.CreateItem("Base.x10Scope_Fake")
			elseif scope:getFullType() == "Base.ARTScope" then
				scope = InventoryItemFactory.CreateItem("Base.ARTScope_Fake")
			elseif scope:getFullType() == "Base.M14ARTScope" then
				scope = InventoryItemFactory.CreateItem("Base.M14ARTScope_Fake")
			elseif scope:getFullType() == "Base.x4Handle" then
				scope = InventoryItemFactory.CreateItem("Base.x4Handle_Fake")
			elseif scope:getFullType() == "Base.x3Handle" then
				scope = InventoryItemFactory.CreateItem("Base.x3Handle_Fake")
			elseif scope:getFullType() == "Base.x4AR180" then
				scope = InventoryItemFactory.CreateItem("Base.x4AR180_Fake")
			elseif scope:getFullType() == "Base.RedDot" then
				scope = InventoryItemFactory.CreateItem("Base.RedDot_Fake")
			elseif scope:getFullType() == "Base.CMore" then
				scope = InventoryItemFactory.CreateItem("Base.CMore_Fake")
			elseif scope:getFullType() == "Base.AccuDot" then
				scope = InventoryItemFactory.CreateItem("Base.AccuDot_Fake")
			elseif scope:getFullType() == "Base.IronSightGhost" then
				scope = InventoryItemFactory.CreateItem("Base.IronSightGhost_Fake")
			elseif scope:getFullType() == "Base.IronSightNotch" then
				scope = InventoryItemFactory.CreateItem("Base.IronSightNotch_Fake")
			end
		elseif scope:getFullType() == "Base.x2Scope_Fake" then
			scope = InventoryItemFactory.CreateItem("Base.x2Scope")
		elseif scope:getFullType() == "Base.x3Scope_Fake" then
			scope = InventoryItemFactory.CreateItem("Base.x3Scope")
		elseif scope:getFullType() == "Base.x4Scope_Fake" then
			scope = InventoryItemFactory.CreateItem("Base.x4Scope")
		elseif scope:getFullType() == "Base.x6Scope_Fake" then
			scope = InventoryItemFactory.CreateItem("Base.x6Scope")
		elseif scope:getFullType() == "Base.x8Scope_Fake" then
			scope = InventoryItemFactory.CreateItem("Base.x8Scope")
		elseif scope:getFullType() == "Base.x10Scope_Fake" then
			scope = InventoryItemFactory.CreateItem("Base.x10Scope")
		elseif scope:getFullType() == "Base.ARTScope_Fake" then
			scope = InventoryItemFactory.CreateItem("Base.ARTScope")
		elseif scope:getFullType() == "Base.M14ARTScope_Fake" then
			scope = InventoryItemFactory.CreateItem("Base.M14ARTScope")
		elseif scope:getFullType() == "Base.x4Handle_Fake" then
			scope = InventoryItemFactory.CreateItem("Base.x4Handle")
		elseif scope:getFullType() == "Base.x3Handle_Fake" then
			scope = InventoryItemFactory.CreateItem("Base.x3Handle")
		elseif scope:getFullType() == "Base.x4AR180_Fake" then
			scope = InventoryItemFactory.CreateItem("Base.x4AR180")
		elseif scope:getFullType() == "Base.RedDot_Fake" then
			scope = InventoryItemFactory.CreateItem("Base.RedDot")
		elseif scope:getFullType() == "Base.CMore_Fake" then
			scope = InventoryItemFactory.CreateItem("Base.CMore")
		elseif scope:getFullType() == "Base.AccuDot_Fake" then
			scope = InventoryItemFactory.CreateItem("Base.AccuDot")
		elseif scope:getFullType() == "Base.IronSightGhost_Fake" then
			scope = InventoryItemFactory.CreateItem("Base.IronSightGhost")
		elseif scope:getFullType() == "Base.IronSightNotch_Fake" then
			scope = InventoryItemFactory.CreateItem("Base.IronSightNotch")
		end
		weapon:attachWeaponPart(scope)
	end
end

Events.OnEquipPrimary.Add(FakeScopeSwitcher);
  
Events.OnGameStart.Add(function() 
    local player = getPlayer()
    FakeScopeSwitcher(player, player:getPrimaryHandItem())
end)

local function ChokeHitCount(wielder, weapon)

    if weapon == nil or not weapon:getCategory():contains("Weapon") or not weapon:isRanged() then return end
    local scriptItem = weapon:getScriptItem()
	if weapon:getCategory():contains("Weapon") and weapon:isRanged() then
	local canon = weapon:getCanon()
    local HitCount = scriptItem:getMaxHitCount()
	local HitAdjust = 0
		if canon == nil then
			weapon:setMaxHitCount(HitCount)
		elseif canon:getFullType() == "Base.ChokeTubeFull" or canon:getFullType() == "Base.ChokeTubeImproved" then
			if canon:getFullType() == "Base.ChokeTubeFull" then
				if weapon:getMaxHitCount() == 1 then
					weapon:setMaxHitCount(1)
				elseif weapon:getMaxHitCount() > 1 then
					HitAdjust = -1
				end
			elseif canon:getFullType() == "Base.ChokeTubeImproved" then
				HitAdjust = 1
			end
		end
	weapon:setMaxHitCount((HitCount)+(HitAdjust))
	end
end

Events.OnEquipPrimary.Add(ChokeHitCount);
  
Events.OnGameStart.Add(function() 
    local player = getPlayer()
    ChokeHitCount(player, player:getPrimaryHandItem())
end)
require "ISUI/ISFirearmRadialMenu"

local BaseCommand = ISBaseObject:derive("BaseCommand")

function BaseCommand:new(frm)
    local o = ISBaseObject.new(self)
    o.frm = frm
    o.character = frm.character
	o.index = 0
    return o
end

function BaseCommand:getWeapon()
	return self.frm:getWeapon()
end

function BaseCommand:fillMenu(menu, weapon, index)
	error "Error, did not derive fillMenu()"
end

---Adjust Gun Stock---

local CGuns93StockAdjust = BaseCommand:derive("CGuns93StockAdjust")

function CGuns93StockAdjust:new(frm)
	local o = BaseCommand.new(self, frm)
	return o
end

function CGuns93StockAdjust:fillMenu(menu, weapon, index)
	for index, preset in ipairs(FoldingStockSet) do
		if preset == weapon:getFullType() then
			if (index % 2 == 1) then
				self.index = index + 1
				local text = getText("IGUI_FirearmRadial_FoldStock")
				menu:addSlice(text, getTexture("media/ui/Radial_FoldStock.png"), self.invoke, self)
			else
				self.index = index - 1
				local text = getText("IGUI_FirearmRadial_UnfoldStock")
				menu:addSlice(text, getTexture("media/ui/Radial_UnfoldStock.png"), self.invoke, self)
			end
		end
	end
end

function CGuns93StockAdjust:invoke()
	local weapon = self.character:getPrimaryHandItem()
	if not weapon then return end
		ISTimedActionQueue.add(Guns93StockAdjustAction:new(weapon, self.index, self.character, CharacterActionAnims.Craft, 15))
end

---Toggle Bayonet Use---

local CGuns93UseBayonet = BaseCommand:derive("CGuns93UseBayonet")

function CGuns93UseBayonet:new(frm)
	local o = BaseCommand.new(self, frm)
	return o
end

function CGuns93UseBayonet:fillMenu(menu, weapon, index)
	for index, preset in ipairs(UseBayonetSet) do
		if preset == weapon:getFullType() then
			if (index % 2 == 1) then
				self.index = index + 1
				local text = getText("IGUI_FirearmRadial_UseBayonet")
				menu:addSlice(text, getTexture("media/ui/Radial_UseBayonet.png"), self.invoke, self)
			else
				self.index = index - 1
				local text = getText("IGUI_FirearmRadial_UseFirearm")
				menu:addSlice(text, getTexture("media/ui/Radial_UseFirearm.png"), self.invoke, self)
			end
		end
	end
end

function CGuns93UseBayonet:invoke()
	local weapon = self.character:getPrimaryHandItem()
		ISTimedActionQueue.add(Guns93UseBayonetAction:new(weapon, self.index, self.character, CharacterActionAnims.Craft, 0))
end

---Add/Remove Bayonet From Firearm---

local CGuns93FixBayonet = BaseCommand:derive("CGuns93FixBayonet")

function CGuns93FixBayonet:new(frm)
	local o = BaseCommand.new(self, frm)
	return o
end

function CGuns93FixBayonet:fillMenu(menu, weapon, index)
	self.index = index
	local weapon = self:getWeapon()
	local bayo = nil
	if self.index % 3 == 1 then
		if not weapon:getTags():contains("FoldingBayo") then
			BayoName = FixBayonetSet[index + 2]
			for i=1, self.character:getInventory():getItems():size() do
				bayo = self.character:getInventory():FindAndReturn(FixBayonetSet[self.index + 2])
			end
		end
		if weapon:getTags():contains("FoldingBayo") then
			local text = getText("IGUI_FirearmRadial_PreUnfold") .. weapon:getDisplayName() .. getText("IGUI_FirearmRadial_PostBayonet")
			menu:addSlice(text, getTexture("media/ui/Radial_UnfoldBayonet.png"), self.invoke, self)
		elseif bayo ~= nil then
			local text = getText("IGUI_FirearmRadial_PreFix") .. ScriptManager.instance:getItem(BayoName):getDisplayName()
			menu:addSlice(text, getTexture("media/ui/Radial_FixBayonet.png"), self.invoke, self)
		end
	else
		if weapon:getTags():contains("FoldingBayo") then
			local text = getText("IGUI_FirearmRadial_PreFold") .. weapon:getDisplayName(), getText("IGUI_FirearmRadial_PostBayonet")
			menu:addSlice(text, getTexture("media/ui/Radial_FoldBayonet.png"), self.invoke, self)
		else
			BayoName = FixBayonetSet[index + 1]
			local text = getText("IGUI_FirearmRadial_PreRemove").. ScriptManager.instance:getItem(BayoName):getDisplayName()
			menu:addSlice(text, getTexture("media/ui/Radial_RemoveBayonet.png"), self.invoke, self)
		end
	end
end

function CGuns93FixBayonet:invoke()
	local weapon = self:getWeapon()
	if not weapon then return end
	local bayo = nil
	if self.index % 3 == 1 then
		if not weapon:getTags():contains("FoldingBayo") then
			for i=1, self.character:getInventory():getItems():size() do
				bayo = self.character:getInventory():FindAndReturn(FixBayonetSet[self.index + 2])
			end
		end
	end
	if weapon:getTags():contains("FoldingBayo") then
		ISTimedActionQueue.add(Guns93FixBayonetAction:new(weapon, self.index, self.character, bayo, CharacterActionAnims.Craft, 15));
	else
		ISTimedActionQueue.add(Guns93FixBayonetAction:new(weapon, self.index, self.character, bayo, CharacterActionAnims.Craft, 60));
	end
end

---Switch Ammo Type---

local CGuns93AmmoSwitch = BaseCommand:derive("CGuns93AmmoSwitch")

function CGuns93AmmoSwitch:new(frm)
	local o = BaseCommand.new(self, frm)
	return o
end

function CGuns93AmmoSwitch:fillMenu(menu, weapon, index)
	for index, preset in ipairs(AmmoTypeSet) do
		if preset == weapon:getFullType() then
			if (index % 4 == 1) then
				self.index = index
				newAmmo = AmmoTypeSet[index + 2]
				local text = getText("IGUI_FirearmRadial_SwitchTo") .. getItemNameFromFullType(newAmmo)
				menu:addSlice(text, getTexture("media/ui/Radial_SwitchAmmo1.png"), self.invoke, self)
			elseif (index % 4 == 2) then
				self.index = index
				newAmmo = AmmoTypeSet[index + 2]
				local text = getText("IGUI_FirearmRadial_SwitchTo") .. getItemNameFromFullType(newAmmo)
				menu:addSlice(text, getTexture("media/ui/Radial_SwitchAmmo2.png"), self.invoke, self)
			end
		end
	end
end

function CGuns93AmmoSwitch:invoke()
	local weapon = self.character:getPrimaryHandItem()
	if not weapon then return end
		ISTimedActionQueue.add(Guns93AmmoSwitchAction:new(weapon, self.index, self.character, CharacterActionAnims.Craft, 0))
end

---Vanilla Commands---

local CInsertMagazine = BaseCommand:derive("CInsertMagazine")

function CInsertMagazine:new(frm)
	local o = BaseCommand.new(self, frm)
	return o
end

function CInsertMagazine:fillMenu(menu, weapon, index)
	if weapon:isContainsClip() then return end
	if not weapon:getMagazineType() then return end
	local magazine = weapon:getBestMagazine(self.character)
	if not magazine then return end
	local text = getText("IGUI_FirearmRadial_InsertMagazine")
	local xln = "IGUI_FirearmRadial_AmmoCount"
	local textCount = getText(xln, magazine:getCurrentAmmoCount(), magazine:getMaxAmmo())
	text = text, '\n', textCount
	menu:addSlice(text, getTexture("media/ui/FirearmRadial_InsertMagazine.png"), self.invoke, self)
end

function CInsertMagazine:invoke()
	local weapon = self:getWeapon()
	if not weapon then return end
	if weapon:isContainsClip() then return end
	local magazine = weapon:getBestMagazine(self.character)
	if not magazine then return end
	ISInventoryPaneContextMenu.transferIfNeeded(self.character, magazine)
	ISTimedActionQueue.add(ISInsertMagazine:new(self.character, weapon, magazine))
end

local CEjectMagazine = BaseCommand:derive("CEjectMagazine")

function CEjectMagazine:new(frm)
	local o = BaseCommand.new(self, frm)
	return o
end

function CEjectMagazine:fillMenu(menu, weapon, index)
	if not weapon:isContainsClip() then return end
	local text = getText("IGUI_FirearmRadial_EjectMagazine")
	local xln = weapon:isRoundChambered() and "IGUI_FirearmRadial_AmmoCountChambered" or "IGUI_FirearmRadial_AmmoCount"
	local textCount = getText(xln, weapon:getCurrentAmmoCount(), weapon:getMaxAmmo())
	text = text, '\n', textCount
	text = text:gsub("\\n", "\n")
	menu:addSlice(text, getTexture("media/ui/FirearmRadial_EjectMagazine.png"), self.invoke, self)
end

function CEjectMagazine:invoke()
	local weapon = self:getWeapon()
	if not weapon then return end
	if not weapon:isContainsClip() then return end
	ISTimedActionQueue.add(ISEjectMagazine:new(self.character, weapon))
end

local CLoadBulletsInMagazine = BaseCommand:derive("CLoadBulletsInMagazine")

function CLoadBulletsInMagazine:new(frm)
	local o = BaseCommand.new(self, frm)
	return o
end

local function predicateNotFullMagazine(item, magazineType)
	return (item:getType() == magazineType or item:getFullType() == magazineType) and item:getCurrentAmmoCount() < item:getMaxAmmo()
end

local function predicateFullestMagazine(item1, item2)
	return item1:getCurrentAmmoCount() - item2:getCurrentAmmoCount()
end

function CLoadBulletsInMagazine:getMagazine(weapon)
	if not weapon:getMagazineType() then return nil end
	local inventory = self.character:getInventory()
	return inventory:getBestEvalArgRecurse(predicateNotFullMagazine, predicateFullestMagazine, weapon:getMagazineType())
end

function CLoadBulletsInMagazine:hasBulletsForMagazine(magazine)
	local inventory = self.character:getInventory()
	return inventory:getCountTypeRecurse(magazine:getAmmoType()) > 0
end

function CLoadBulletsInMagazine:fillMenu(menu, weapon, index)
	local magazine = self:getMagazine(weapon)
	if not magazine then return end
	if not self:hasBulletsForMagazine(magazine) then return end
	local text = getText("IGUI_FirearmRadial_LoadBulletsIntoMagazine")
	local xln = "IGUI_FirearmRadial_AmmoCount"
	local textCount = getText(xln, magazine:getCurrentAmmoCount(), magazine:getMaxAmmo())
	text = text, '\\n', textCount
	text = text:gsub('\\n', '\n')
	menu:addSlice(text, getTexture("media/ui/FirearmRadial_BulletsIntoMagazine.png"), self.invoke, self)
end

function CLoadBulletsInMagazine:invoke()
	local weapon = self:getWeapon()
	if not weapon then return end
	local magazine = self:getMagazine(weapon)
	if not magazine then return end
	if not self:hasBulletsForMagazine(magazine) then return end
	ISInventoryPaneContextMenu.transferIfNeeded(self.character, magazine)
	local ammoCount = ISInventoryPaneContextMenu.transferBullets(self.character, magazine:getAmmoType(), magazine:getCurrentAmmoCount(), magazine:getMaxAmmo())
	if ammoCount == 0 then return end
	ISTimedActionQueue.add(ISLoadBulletsInMagazine:new(self.character, magazine, ammoCount))
end

local CLoadRounds = BaseCommand:derive("CLoadRounds")

function CLoadRounds:new(frm)
	local o = BaseCommand.new(self, frm)
	return o
end

function CLoadRounds:hasBullets(weapon)
	local inventory = self.character:getInventory()
	return inventory:getCountTypeRecurse(weapon:getAmmoType()) > 0
end

function CLoadRounds:fillMenu(menu, weapon)
	if weapon:getMagazineType() then return end
	if weapon:getCurrentAmmoCount() >= weapon:getMaxAmmo() then return end
	if not self:hasBullets(weapon) then return end
	local text = getText("IGUI_FirearmRadial_LoadRounds")
	local xln = weapon:isRoundChambered() and "IGUI_FirearmRadial_AmmoCountChambered" or "IGUI_FirearmRadial_AmmoCount"
	local textCount = getText(xln, weapon:getCurrentAmmoCount(), weapon:getMaxAmmo())
	text = text, '\\n', textCount
	text = text:gsub('\\n', '\n')
	menu:addSlice(text, getTexture("media/ui/FirearmRadial_BulletsIntoFirearm.png"), self.invoke, self)
end

function CLoadRounds:invoke()
	local weapon = self:getWeapon()
	if not weapon then return end
	if weapon:getMagazineType() then return end
	if weapon:getCurrentAmmoCount() >= weapon:getMaxAmmo() then return end
	if not self:hasBullets(weapon) then return end
	ISInventoryPaneContextMenu.transferBullets(self.character, weapon:getAmmoType(), weapon:getCurrentAmmoCount(), weapon:getMaxAmmo())
	ISTimedActionQueue.add(ISReloadWeaponAction:new(self.character, weapon))
end


local CUnloadRounds = BaseCommand:derive("CUnloadRounds")

function CUnloadRounds:new(frm)
	local o = BaseCommand.new(self, frm)
	return o
end

function CUnloadRounds:fillMenu(menu, weapon)
	if weapon:getMagazineType() then return end
	if weapon:getCurrentAmmoCount() == 0 then return end
	local text = getText("IGUI_FirearmRadial_UnloadRounds")
	local xln = weapon:isRoundChambered() and "IGUI_FirearmRadial_AmmoCountChambered" or "IGUI_FirearmRadial_AmmoCount"
	local textCount = getText(xln, weapon:getCurrentAmmoCount(), weapon:getMaxAmmo())
	text = text, '\\n', textCount
	text = text:gsub('\\n', '\n')
	menu:addSlice(text, getTexture("media/ui/FirearmRadial_BulletsFromFirearm.png"), self.invoke, self)
end

function CUnloadRounds:invoke()
	local weapon = self:getWeapon()
	if not weapon then return end
	if weapon:getMagazineType() then return end
	if weapon:getCurrentAmmoCount() == 0 then return end
	ISTimedActionQueue.add(ISUnloadBulletsFromFirearm:new(self.character, weapon, false))
end

local CRack = BaseCommand:derive("CRack")

function CRack:new(frm)
	local o = BaseCommand.new(self, frm)
	return o
end

function CRack:fillMenu(menu, weapon, index)
	if not ISReloadWeaponAction.canRack(weapon) then return end
	local xln = weapon:isRoundChambered() and "IGUI_FirearmRadial_AmmoCountChambered" or "IGUI_FirearmRadial_AmmoCount"
	local textCount = getText(xln, weapon:getCurrentAmmoCount(), weapon:getMaxAmmo())
	if weapon:isJammed() then
		local text = getText("IGUI_FirearmRadial_Unjam")
		text = text, '\n', textCount
		menu:addSlice(text, getTexture("media/ui/FirearmRadial_Unjam.png"), self.invoke, self)
	elseif not weapon:haveChamber() or weapon:isRoundChambered() then
		local xln = weapon:haveChamber() and "IGUI_FirearmRadial_Rack" or "IGUI_FirearmRadial_UnloadRound"
		local text = getText(xln)
		text = text, '\n', textCount
		menu:addSlice(text, getTexture("media/ui/FirearmRadial_Rack.png"), self.invoke, self)
	elseif weapon:haveChamber() then
		local text = getText("IGUI_FirearmRadial_ChamberRound")
		text = text, '\n', textCount
		menu:addSlice(text, getTexture("media/ui/FirearmRadial_ChamberRound.png"), self.invoke, self)
	end
end

function CRack:invoke()
	local weapon = self:getWeapon()
	if not weapon then return end
	if not ISReloadWeaponAction.canRack(weapon) then return end
	ISTimedActionQueue.add(ISRackFirearm:new(self.character, weapon))
end

---Fill Radial Menu---

local ISFirearmRadialMenu_fillMenu_old = ISFirearmRadialMenu.fillMenu
function ISFirearmRadialMenu:fillMenu(submenu)
	local weapon = self.character:getPrimaryHandItem()
	local InWay = true
	local bayo = nil
	if not weapon then return nil end
	if not instanceof(weapon, "HandWeapon") then return nil end
	if not weapon:getTags():contains("BayoUsed") then
		for index, preset in ipairs(FixBayonetSet) do
			if preset == weapon:getFullType() then
				if (index % 3 == 1) then
					bayo = self.character:getInventory():FindAndReturn(FixBayonetSet[index + 2])
					local bayoReady = false
				end
				if weapon:getTags():contains("FoldingBayo") then
					bayoReady = true
				elseif bayo ~= nil and bayo ~= "null" then
					if bayo:getFullType() == FixBayonetSet[index + 2] and not bayo:isBroken() then
						bayoReady = true
					end
				end
				local menu = getPlayerRadialMenu(self.playerNum)
				menu:clear()
				local commands = {}
				if weapon:getMagazineType() then
					if weapon:isContainsClip() then
						table.insert(commands, CEjectMagazine:new(self))
					else
						table.insert(commands, CInsertMagazine:new(self))
					end
					table.insert(commands, CLoadBulletsInMagazine:new(self))
				else
					table.insert(commands, CLoadRounds:new(self))
					table.insert(commands, CUnloadRounds:new(self))
				end
				table.insert(commands, CRack:new(self))
				if weapon:getTags():contains("FoldingStock") then
					table.insert(commands, CGuns93StockAdjust:new(self))
				end
				if bayoReady == true or weapon:getTags():contains("Bayonet") then
					if MuzzleDeviceCheck(weapon) == true then
					table.insert(commands, CGuns93FixBayonet:new(self))
					end
				end
				if weapon:getTags():contains("Bayonet") then
					table.insert(commands, CGuns93UseBayonet:new(self))
				end
				if weapon:getTags():contains("AmmoSwitch") then
					table.insert(commands, CGuns93AmmoSwitch:new(self))
				end
				for _,command in ipairs(commands) do
					local count = #menu.slices
					command:fillMenu(menu, weapon, index)
					if count == #menu.slices then
						menu:addSlice(nil, nil, nil)
					end
				end
				return
			end
		end
	end
	for index, preset in ipairs(UseBayonetSet) do
		if preset == weapon:getFullType() then
			local menu = getPlayerRadialMenu(self.playerNum)
			menu:clear()
			local commands = {}
			if weapon:getMagazineType() then
				if weapon:isContainsClip() then
					table.insert(commands, CEjectMagazine:new(self))
				else
					table.insert(commands, CInsertMagazine:new(self))
				end
				table.insert(commands, CLoadBulletsInMagazine:new(self))
			else
				table.insert(commands, CLoadRounds:new(self))
				table.insert(commands, CUnloadRounds:new(self))
			end
			table.insert(commands, CRack:new(self))
			if weapon:getTags():contains("FoldingStock") then
				table.insert(commands, CGuns93StockAdjust:new(self))
			end
			if not weapon:getTags():contains("BayoUsed") then
				table.insert(commands, CGuns93FixBayonet:new(self))
			end
			table.insert(commands, CGuns93UseBayonet:new(self))
			if weapon:getTags():contains("AmmoSwitch") then
				table.insert(commands, CGuns93AmmoSwitch:new(self))
			end
			for _,command in ipairs(commands) do
				local count = #menu.slices
				command:fillMenu(menu, weapon, index)
				if count == #menu.slices then
					menu:addSlice(nil, nil, nil)
				end
			end
			return
		end
	end
	for index, preset in ipairs(FoldingStockSet) do
		if preset == weapon:getFullType() then
			local menu = getPlayerRadialMenu(self.playerNum)
			menu:clear()
			local commands = {}
			if weapon:getMagazineType() then
				if weapon:isContainsClip() then
					table.insert(commands, CEjectMagazine:new(self))
				else
					table.insert(commands, CInsertMagazine:new(self))
				end
				table.insert(commands, CLoadBulletsInMagazine:new(self))
			else
				table.insert(commands, CLoadRounds:new(self))
				table.insert(commands, CUnloadRounds:new(self))
			end
			table.insert(commands, CRack:new(self))
			table.insert(commands, CGuns93StockAdjust:new(self))
			if weapon:getTags():contains("AmmoSwitch") then
				table.insert(commands, CGuns93AmmoSwitch:new(self))
			end
			for _,command in ipairs(commands) do
				local count = #menu.slices
				command:fillMenu(menu, weapon, index)
				if count == #menu.slices then
					menu:addSlice(nil, nil, nil)
				end
			end
			return
		end
	end	
	if weapon:getTags():contains("AmmoSwitch") then
		for index, preset in ipairs(AmmoTypeSet) do
			if preset == weapon:getFullType() then
				local menu = getPlayerRadialMenu(self.playerNum)
				menu:clear()
				local commands = {}
				if weapon:getMagazineType() then
					if weapon:isContainsClip() then
						table.insert(commands, CEjectMagazine:new(self))
					else
						table.insert(commands, CInsertMagazine:new(self))
					end
					table.insert(commands, CLoadBulletsInMagazine:new(self))
				else
					table.insert(commands, CLoadRounds:new(self))
					table.insert(commands, CUnloadRounds:new(self))
				end
				table.insert(commands, CRack:new(self))
				table.insert(commands, CGuns93AmmoSwitch:new(self))
				for _,command in ipairs(commands) do
					local count = #menu.slices
					command:fillMenu(menu, weapon, index)
					if count == #menu.slices then
						menu:addSlice(nil, nil, nil)
					end
				end
				return
			end
		end
	end	
	ISFirearmRadialMenu_fillMenu_old(self, submenu)
end

local ISFirearmRadialMenu_checkWeapon_old = ISFirearmRadialMenu.checkWeapon
function ISFirearmRadialMenu.checkWeapon(playerObj)
	local weapon = playerObj:getPrimaryHandItem()
	if not weapon then return false end
	if not instanceof(weapon, "HandWeapon") then return false end
	if weapon:getTags():contains("BayoUsed") then
		return true
	end
	return ISFirearmRadialMenu_checkWeapon_old(playerObj)
end
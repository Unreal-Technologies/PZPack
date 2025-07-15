require "ISUI/ISInventoryPaneContextMenu"

Guns93ContextMenu = {}

Guns93ContextMenu.inventoryMenu = function(playerid, context, items)
	local player = getSpecificPlayer(playerid)
	local hasFoldStock = false
	local hasBayonet = false
	local hasFoldBayo = false
	local hasAmmoSwitch = false
	for _, v in ipairs(items) do
		local item = v
		if not instanceof(v, "InventoryItem") then
			item = v.items[1]
		end
		if instanceof(item, "HandWeapon") then
			local isInInventory = item:getContainer() == player:getInventory()
			local subMenuUp = context:getNew(context);
			for index, preset in ipairs(FoldingStockSet) do
				if preset == item:getFullType() then
					hasFoldStock = true
					local indexMod = (index % 2) * 2 - 1
					local actionString = ""
					if (indexMod > 0) then
						actionString = getText("IGUI_ContextMenu_FoldStock")
					else
						actionString = getText("IGUI_ContextMenu_UnfoldStock")
					end
					local listEntry = subMenuUp:addOption(actionString, item, Guns93StockAdjust.callAction, index + indexMod, player)
				end	
			end
            for index, preset in ipairs(UseBayonetSet) do
				if preset == item:getFullType() then
					hasBayonet = true
					local indexMod = (index % 2) * 2 - 1
					local actionString = ""
					if (indexMod > 0) then
						actionString = getText("IGUI_ContextMenu_UseBayonet")
					else
						actionString = getText("IGUI_ContextMenu_UseFirearm")
					end
					local listEntry = subMenuUp:addOption(actionString, item, Guns93UseBayonet.callAction, index + indexMod, player)
				end	
			end
			if item:getTags():contains("FoldingBayo") then
				for index, preset in ipairs(FixBayonetSet) do
					if MuzzleDeviceCheck(item) == true then
						if (index % 3 > 0) and preset == item:getFullType() then
							hasFoldBayo = true
							if index % 3 == 1 then
								actionString = getText("IGUI_ContextMenu_UnfoldBayonet")
							elseif index % 3 == 2 then
								actionString = getText("IGUI_ContextMenu_FoldBayonet")
							end
							local listEntry = subMenuUp:addOption(actionString, item, Guns93FixBayonet.callAction, index, player, nil)
						end
					end
				end	
			end
            for index, preset in ipairs(AmmoTypeSet) do
				if (index % 4 > 0) and preset == item:getFullType() then
					local newAmmo = nil
					if item:getTags():contains("AmmoSwitch") then
						if index % 4 == 1 then
							newAmmo = AmmoTypeSet[index + 2]
						elseif index % 4 == 2 then
							newAmmo = AmmoTypeSet[index + 2]
						end
					end
					if newAmmo ~= nil then
						hasAmmoSwitch = true
						local actionString = getText("IGUI_ContextMenu_SwitchTo") .. getItemNameFromFullType(newAmmo)
						local listEntry = subMenuUp:addOption(actionString, item, Guns93AmmoSwitch.callAction, index, player)
					end
				end
			end
			if hasAmmoSwitch or hasBayonet or hasFoldBayo or hasFoldStock then
				local firearmOption = context:addOption(getText("IGUI_ContextMenu_FirearmOptions"), items, nil);
				context:addSubMenu(firearmOption, subMenuUp);
			end
		end
		if item:getTags():contains("MagSwitch") then
			for index, preset in ipairs(MagTypeSet) do
				if preset == item:getFullType() then
					local addmenu = true
					local indexMod = (index % 2) * 2 - 1
					local magAmmo = ScriptManager.instance:getItem(MagTypeSet[index + indexMod])
					local actionString = getText("IGUI_ContextMenu_SwitchTo") .. getItemNameFromFullType(magAmmo:getAmmoType())
					local listEntry = context:addOption(actionString, item, Guns93MagSwitch.callAction, index + indexMod, player)
				end	
			end
		end
		if item:getTags():contains("Guns93") or item:getModData().mod_fouling then
			if item:getModData().mod_fouling > 0 then
				local cleankit = player:getInventory():FindAndReturn("GunCleaningKit")
				local isInInventory = item:getContainer() == player:getInventory()
				if instanceof(item, "HandWeapon") then
					if cleankit ~= nil then
						local addmenu = true
						local actionString = getText("IGUI_ContextMenu_CleanGun")
						local cleanOption = context:addOption(actionString, item, Guns93UseCleaningKit.callAction, player, cleankit)
					end
				elseif item:getCategory() == "WeaponPart" then
					if cleankit ~= nil then
						local addmenu = true
						local actionString = getText("IGUI_ContextMenu_CleanSilencer")
						local cleanOption = context:addOption(actionString, item, Guns93UseCleaningKit.callAction, player, cleankit)
					end
				end
				if addmenu then
					context:getNew(cleanOption);
				end
			end
		end
	end
end

Events.OnPreFillInventoryObjectContextMenu.Add(Guns93ContextMenu.inventoryMenu)
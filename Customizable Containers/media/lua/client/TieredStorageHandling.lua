
local function OnInventoryContextMenu(character, InsertOption, Items)

    local Player = getSpecificPlayer(character)
    local inv = Player:getInventory()
    for _, v in pairs(Items) do
        local Item = v
        if not instanceof(v,"InventoryItem") then
            Item = v.items[1]
        end
        local name = Item:getDisplayName()
        local module = Item:getModule()
        if Item:isInPlayerInventory() and module == "CC" and name:contains("Tier") then
            local rotate = ISContextMenu:getNew(InsertOption)
            local upgrade = ISContextMenu:getNew(InsertOption)
            local invItem = Item:getType()
            if not name:contains("Tier 8") then
                local selectedValue = SandboxVars.CustomizableRecipes.CContainers
                local tiers = { "1", "2", "3", "4", "5", "6", "7" }
                local screwdriver = inv:getFirstTagRecurse("Screwdriver")
                local itemNames = {}
                local displayName = invItem
                table.insert(itemNames, displayName)
                CCincreaseTier(itemNames)
                if selectedValue >= 2 then
                    for i = 1, math.min(selectedValue - 2, #tiers) do
                        if screwdriver and inv:getNumberOfItem("Base.Plank") >= 1 and inv:getNumberOfItem("Base.Nails") >= 25 and name:contains("Crate") and Player:getPerkLevel(Perks.Woodwork) >= (i + 3) and not name:contains("Military") and not name:contains("Metal") and name:contains(i) then
                            for j, itemName in ipairs(itemNames) do
                                InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Upgrade Tier", Player, function() inv:Remove(invItem) inv:AddItem(module.."."..itemName) for i = 1, 1 do inv:Remove("Plank") end for i = 1, 25 do inv:Remove("Nails") end end)
                            end
                        elseif name:contains("Crate") and not name:contains("Military") and not name:contains("Metal") and name:contains(i) then
                            local Option = InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Can't Upgrade Tier")
                            local Tooltip = ISInventoryPaneContextMenu.addToolTip()
                            Option.toolTip = Tooltip
                            Tooltip.description = "Requires: A Screwdriver, 1 Plank, 25 Nails and Carpentry Level "..(i + 3).." to Upgrade to the Next Tier"
                            Option.notAvailable = true
                        end
                        if screwdriver and inv:getNumberOfItem("Base.Plank") >= 1 and inv:getNumberOfItem("Base.Nails") >= 25 and name:contains("Half Crate") and Player:getPerkLevel(Perks.Woodwork) >= (i + 3) and name:contains(i) then
                            for j, itemName in ipairs(itemNames) do
                                InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Upgrade Tier", Player, function() inv:Remove(invItem) inv:AddItem(module.."."..itemName) for i = 1, 1 do inv:Remove("Plank") end for i = 1, 25 do inv:Remove("Nails") end end)
                            end
                        elseif name:contains("Half Crate") and name:contains(i) then
                            local Option = InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Can't Upgrade Tier")
                            local Tooltip = ISInventoryPaneContextMenu.addToolTip()
                            Option.toolTip = Tooltip
                            Tooltip.description = "Requires: A Screwdriver, 1 Plank, 25 Nails and Carpentry Level "..(i + 3).." to Upgrade to the Next Tier"
                            Option.notAvailable = true
                        end
                        if screwdriver and inv:getNumberOfItem("Base.SheetMetal") >= 1 and inv:getNumberOfItem("Base.SmallSheetMetal") >= 2 and Player:getPerkLevel(Perks.MetalWelding) >= (i + 3) and Player:getPerkLevel(Perks.Electricity) >= (i + 1) and name:contains("Refrigerator") and name:contains(i) then
                            for j, itemName in ipairs(itemNames) do
                                InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Upgrade Tier", Player, function() inv:Remove(invItem) inv:AddItem(module.."."..itemName) inv:Remove("SheetMetal") for i = 1, 2 do inv:Remove("SmallSheetMetal") end end)
                            end
                        elseif name:contains("Refrigerator") and name:contains(i) then
                            local Option = InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Can't Upgrade Tier")
                            local Tooltip = ISInventoryPaneContextMenu.addToolTip()
                            Option.toolTip = Tooltip
                            Tooltip.description = "Requires: A Screwdriver, 1 Sheet Metal, 2 Small Sheet Metal, Metalworking Level "..(i + 3).." and Electrical Level "..(i + 1).." to Upgrade to the Next Tier"
                            Option.notAvailable = true
                        end
                        if screwdriver and inv:getNumberOfItem("Base.SheetMetal") >= 1 and inv:getNumberOfItem("Base.SmallSheetMetal") >= 2 and Player:getPerkLevel(Perks.MetalWelding) >= (i + 3) and Player:getPerkLevel(Perks.Electricity) >= (i + 1) and name:contains("Freezer") and name:contains(i) then
                            for j, itemName in ipairs(itemNames) do
                                InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Upgrade Tier", Player, function() inv:Remove(invItem) inv:AddItem(module.."."..itemName) inv:Remove("SheetMetal") for i = 1, 2 do inv:Remove("SmallSheetMetal") end end)
                            end
                        elseif name:contains("Freezer") and name:contains(i) then
                            local Option = InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Can't Upgrade Tier")
                            local Tooltip = ISInventoryPaneContextMenu.addToolTip()
                            Option.toolTip = Tooltip
                            Tooltip.description = "Requires: A Screwdriver, 1 Sheet Metal, 2 Small Sheet Metal, Metalworking Level "..(i + 3).." and Electrical Level "..(i + 1).." to Upgrade to the Next Tier"
                            Option.notAvailable = true
                        end
                        if screwdriver and inv:getNumberOfItem("Base.SheetMetal") >= 2 and Player:getPerkLevel(Perks.MetalWelding) >= (i + 3) and name:contains("Military Crate") and name:contains(i) then
                            for j, itemName in ipairs(itemNames) do
                                InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Upgrade Tier", Player, function() inv:Remove(invItem) inv:AddItem(module.."."..itemName) for i = 1, 2 do inv:Remove("SheetMetal") end end)
                            end
                        elseif name:contains("Military Crate") and name:contains(i) then
                            local Option = InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Can't Upgrade Tier")
                            local Tooltip = ISInventoryPaneContextMenu.addToolTip()
                            Option.toolTip = Tooltip
                            Tooltip.description = "Requires: A Screwdriver, 2 Sheet Metal and Metalworking Level "..(i + 3).." to Upgrade to the Next Tier"
                            Option.notAvailable = true
                        end
                        if screwdriver and inv:getNumberOfItem("Base.SheetMetal") >= 2 and Player:getPerkLevel(Perks.MetalWelding) >= (i + 3) and name:contains("Military Locker") and not name:contains("Small") and name:contains(i) then
                            for j, itemName in ipairs(itemNames) do
                                InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Upgrade Tier", Player, function() inv:Remove(invItem) inv:AddItem(module.."."..itemName) for i = 1, 2 do inv:Remove("SheetMetal") end end)
                            end
                        elseif name:contains("Military Locker") and not name:contains("Small") and name:contains(i) then
                            local Option = InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Can't Upgrade Tier")
                            local Tooltip = ISInventoryPaneContextMenu.addToolTip()
                            Option.toolTip = Tooltip
                            Tooltip.description = "Requires: A Screwdriver, 2 Sheet Metal and Metalworking Level "..(i + 3).." to Upgrade to the Next Tier"
                            Option.notAvailable = true
                        end
                        if screwdriver and inv:getNumberOfItem("Base.SheetMetal") >= 1 and Player:getPerkLevel(Perks.MetalWelding) >= (i + 3) and name:contains("Small Military Locker") and name:contains(i) then
                            for j, itemName in ipairs(itemNames) do
                                InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Upgrade Tier", Player, function() inv:Remove(invItem) inv:AddItem(module.."."..itemName) inv:Remove("SheetMetal")end)
                            end
                        elseif name:contains("Small Military Locker") and name:contains(i) then
                            local Option = InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Can't Upgrade Tier")
                            local Tooltip = ISInventoryPaneContextMenu.addToolTip()
                            Option.toolTip = Tooltip
                            Tooltip.description = "Requires: A Screwdriver, 1 Sheet Metal and Metalworking Level "..(i + 3).." to Upgrade to the Next Tier"
                            Option.notAvailable = true
                        end
                        if screwdriver and inv:getNumberOfItem("Base.SheetMetal") >= 1 and Player:getPerkLevel(Perks.MetalWelding) >= (i + 3) and name:contains("Small Chest") and name:contains(i) then
                            for j, itemName in ipairs(itemNames) do
                                InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Upgrade Tier", Player, function() inv:Remove(invItem) inv:AddItem(module.."."..itemName) inv:Remove("SheetMetal") end)
                            end
                        elseif name:contains("Small Chest") and name:contains(i) then
                            local Option = InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Can't Upgrade Tier")
                            local Tooltip = ISInventoryPaneContextMenu.addToolTip()
                            Option.toolTip = Tooltip
                            Tooltip.description = "Requires: A Screwdriver, 1 Sheet Metal and Metalworking Level "..(i + 3).." to Upgrade to the Next Tier"
                            Option.notAvailable = true
                        end
                        if screwdriver and inv:getNumberOfItem("Base.SheetMetal") >= 1 and Player:getPerkLevel(Perks.MetalWelding) >= (i + 3) and name:contains("Metal Crate") and name:contains(i) then
                            for j, itemName in ipairs(itemNames) do
                                InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Upgrade Tier", Player, function() inv:Remove(invItem) inv:AddItem(module.."."..itemName) inv:Remove("SheetMetal") end)
                            end
                        elseif name:contains("Metal Crate") and name:contains(i) then
                            local Option = InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Can't Upgrade Tier")
                            local Tooltip = ISInventoryPaneContextMenu.addToolTip()
                            Option.toolTip = Tooltip
                            Tooltip.description = "Requires: A Screwdriver, 1 Sheet Metal and Metalworking Level "..(i + 3).." to Upgrade to the Next Tier"
                            Option.notAvailable = true
                        end
                        if screwdriver and inv:getNumberOfItem("Base.Plank") >= 1 and Player:getPerkLevel(Perks.Woodwork) >= (i + 3) and name:contains("Cardboard Box") and name:contains(i) then
                            for j, itemName in ipairs(itemNames) do
                                InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Upgrade Tier", Player, function() inv:Remove(invItem) inv:AddItem(module.."."..itemName) inv:Remove("Plank") end)
                            end
                        elseif name:contains("Cardboard Box") and name:contains(i) then
                            local Option = InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Can't Upgrade Tier")
                            local Tooltip = ISInventoryPaneContextMenu.addToolTip()
                            Option.toolTip = Tooltip
                            Tooltip.description = "Requires: A Screwdriver, 1 Plank and Woodworking Level "..(i + 3).." to Upgrade to the Next Tier"
                            Option.notAvailable = true
                        end
                        if screwdriver and inv:getNumberOfItem("Base.SheetMetal") >= 1 and Player:getPerkLevel(Perks.MetalWelding) >= (i + 3) and name:contains("Metal Cabinet") and name:contains(i) then
                            for j, itemName in ipairs(itemNames) do
                                InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Upgrade Tier", Player, function() inv:Remove(invItem) inv:AddItem(module.."."..itemName) inv:Remove("SheetMetal") end)
                            end
                        elseif name:contains("Metal Cabinet") and name:contains(i) then
                            local Option = InsertOption:insertOptionBefore(getText("ContextMenu_Equip_Primary"), "Can't Upgrade Tier")
                            local Tooltip = ISInventoryPaneContextMenu.addToolTip()
                            Option.toolTip = Tooltip
                            Tooltip.description = "Requires: A Screwdriver, 1 Sheet Metal and Metalworking Level "..(i + 3).." to Upgrade to the Next Tier"
                            Option.notAvailable = true
                        end
                    end
                end
            end
        end
    end
end
Events.OnFillInventoryObjectContextMenu.Add(OnInventoryContextMenu)   
 


local function checkRespawn()

if SandboxVars.CustomizableRespawn.Respawnable == true then
    local function OnInventoryContextMenu(character, InsertOption, Items)

        local Player = getSpecificPlayer(character)
        local inv = Player:getInventory()
        for _, v in pairs(Items) do
            local Item = v
            if not instanceof(v,"InventoryItem") then
                Item = v.items[1]
            end
            if Item:isInPlayerInventory() and Item:IsInventoryContainer() and Item:getItemContainer():isEmpty() then
                if Player then
                    local module = Item:getModule()
                    local bag = Item:getType()
                    InsertOption:insertOptionBefore(getText("ContextMenu_Drop"), "Respawn", Player, function() inv:Remove(bag) inv:AddItem(module.."."..bag)  end)
                end
            elseif Item:IsInventoryContainer() and not Item:getItemContainer():isEmpty() then
                local Option = InsertOption:insertOptionBefore(getText("ContextMenu_Drop"), "Respawn")
                local Tooltip = ISInventoryPaneContextMenu.addToolTip()
                Option.toolTip = Tooltip
                Tooltip.description = "Empty The Container First"
                Option.notAvailable = true
            end
        end
    end
    Events.OnFillInventoryObjectContextMenu.Add(OnInventoryContextMenu)   
  end 
end

Events.OnLoad.Add(checkRespawn)   
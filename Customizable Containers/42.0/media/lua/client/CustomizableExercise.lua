function getCustomizableExerciseVar()
    if not SandboxVars.CustomizableExercise.Exercise then
        return
    end

    require 'ISUI/ISFitnessUI'

    function ISFitnessUI:equipItems()
        local player = self.player
        local item = self.exeData.item

        if item then
            if not player:getInventory():contains(item, true) then
                return false
            end
        end

        if not self.exeData.prop then
            ISInventoryPaneContextMenu.unequipItem(player:getPrimaryHandItem(), player:getPlayerNum())
            if not player:isItemInBothHands(player:getPrimaryHandItem()) then
                ISInventoryPaneContextMenu.unequipItem(player:getSecondaryHandItem(), player:getPlayerNum())
            end
        end

        local equipped = self.exeData.prop

        if equipped == "primary" then
            ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), item, true, false)
            player:setSecondaryHandItem(nil)
        end

        if equipped == "twohands" then
            ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), item, true, true)
        end

        if equipped == "switch" then
            ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), item, true, false)
            player:setSecondaryHandItem(nil)
        end

        return true
    end
end

Events.OnLoad.Add(getCustomizableExerciseVar)
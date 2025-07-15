
require 'SharedPortalTools'

local ul_ISEatFoodActionupdate = ISEatFoodAction.update
function ISEatFoodAction:update()
    if self and self.item and self.item:getFullType() == 'Base.CakeIsALie' and self.character then
        local itemType = self.item:getModData()[Spawn.SpawnKey]
        self.character:getInventory():AddItem(itemType)--TODO extract item from mod data
        self:stop()
        self.item:Use()
        self.character:Say(getText("IGUI_CakeIsALie_OnEat"))
    else
        ul_ISEatFoodActionupdate(self)
    end
end
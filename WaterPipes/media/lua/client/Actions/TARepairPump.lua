require "TimedActions/ISBaseTimedAction"
require "wp_vsquare"

---@class TARepairPump : ISBaseTimedAction
TARepairPump = ISBaseTimedAction:derive("TARepairPump");

function TARepairPump:isValid()
    return true
end

function TARepairPump:update()
    self.character:faceThisObject(self.object)
    self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function TARepairPump:waitToStart()
    self.character:faceThisObject(self.object)
    return self.character:shouldBeTurning()
end

function TARepairPump:start()
    self:setActionAnim("Loot")
    -- self.character:SetVariable("LootPosition", "Low")
    self.character:reportEvent("EventLootItem")
    self.sound = self.character:playSound("GeneratorRepair")
end

function TARepairPump:stop()
    self.character:stopOrTriggerSound(self.sound)
    ISBaseTimedAction.stop(self)
end

function TARepairPump:perform()
    self.character:stopOrTriggerSound(self.sound)

    local x = self.object:getX()
    local y = self.object:getY()
    local z = self.object:getZ()
    local vpump = Vsquare.GetPump(x, y, z)

    local scrapItem = self.character:getInventory():getFirstTypeRecurse("ScrapMetal")
    if not scrapItem then return end

    local ef = vpump.ef
    local maxEf = self.character:getPerkLevel(Perks.MetalWelding) * 10
    local amount = 4
    ef = ef + amount
    if ef > maxEf then ef = maxEf end

    Vsquare.RepairPump(x, y, z, ef)

    self.character:removeFromHands(scrapItem)
    self.character:getInventory():Remove(scrapItem)

    if ef < maxEf then
        scrapItem = self.character:getInventory():getFirstTypeRecurse("ScrapMetal")
        if scrapItem then
            local previousAction = self
            if scrapItem:getContainer() ~= self.character:getInventory() then
                local action = ISInventoryTransferAction:new(self.character, scrapItem, scrapItem:getContainer(), self.character:getInventory(), nil)
                ISTimedActionQueue.addAfter(self, action)
                previousAction = action
            end
            ISTimedActionQueue.addAfter(previousAction, TARepairPump:new(self.character, self.square, self.object))
        end
    end

    ISBaseTimedAction.perform(self)
end


function TARepairPump:new(character, square, object)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    
    
    o.character = character
    o.stopOnWalk = false
    -- o.stopOnRun = false
    o.maxTime = 320

    -- custom fields
    o.object = object
    o.square = square
    return o
end

return TARepairPump;

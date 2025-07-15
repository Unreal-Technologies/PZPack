require "TimedActions/ISBaseTimedAction"
require "wp_vsquare"

---@class TADisassemblePump : ISBaseTimedAction
TADisassemblePump = ISBaseTimedAction:derive("TADisassemblePump");

function TADisassemblePump:isValid()
    return true
end

function TADisassemblePump:update()
    self.character:faceThisObject(self.object)
    self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function TADisassemblePump:waitToStart()
    self.character:faceThisObject(self.object)
    return self.character:shouldBeTurning()
end

function TADisassemblePump:start()
    -- local torch = self.character:getInventory():getFirstTypeRecurse("BlowTorch")
    -- ISInventoryPaneContextMenu.equipWeapon(torch, true, false, self.character)

    -- local mask = self.character:getInventory():getFirstTypeRecurse("WeldingMask")
    -- ISInventoryPaneContextMenu.wearItem(mask, self.character)

    self:setActionAnim("BlowTorch")
    -- self.character:SetVariable("LootPosition", "Low")
    self.sound = self.character:playSound("BlowTorch")
end

function TADisassemblePump:stop()
    self.character:stopOrTriggerSound(self.sound)
    ISBaseTimedAction.stop(self)
end

function TADisassemblePump:perform()
    self.character:stopOrTriggerSound(self.sound)

    local x = self.object:getX()
    local y = self.object:getY()
    local z = self.object:getZ()
    local vpump = Vsquare.GetPump(x, y, z)

    local scrapMetal = math.floor(vpump.ef / 10)

    if isClient() then
        sledgeDestroy(self.object)
    else
        self.object:getSquare():transmitRemoveItemFromSquare(self.object)
    end

    local item = "Base.MetalPipe"
    self.square:AddWorldInventoryItem(item, ZombRandFloat(0.2, 0.8), ZombRandFloat(0.2, 0.8), 0)

    for i=1, ZombRand(4)+1 do
        local item = "Base.SmallSheetMetal"
        self.square:AddWorldInventoryItem(item, ZombRandFloat(0.2, 0.8), ZombRandFloat(0.2, 0.8), 0)
    end

    for i=1, scrapMetal do
        local item = "Base.ScrapMetal"
        self.square:AddWorldInventoryItem(item, ZombRandFloat(0.2, 0.8), ZombRandFloat(0.2, 0.8), 0)
    end

    ISBaseTimedAction.perform(self)
end


function TADisassemblePump:new(character, square, object)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    
    o.character = character
    o.stopOnWalk = false
    -- o.stopOnRun = false
    o.maxTime = 480

    -- custom fields
    o.object = object
    o.square = square
    return o
end

return TADisassemblePump;

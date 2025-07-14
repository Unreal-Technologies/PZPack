reloadType={}

require "TimedActions/ISBaseTimedAction"
require "TimedActions/ISEjectMagazine"
require "TimedActions/ISReloadWeaponAction"
require "TimedActions/ISInsertMagazine"


function reloadType.isOpenBolt(wpn)
    if not wpn then return false end
    if instanceof(wpn, 'HandWeapon') and wpn:getModData()['isOpenBolt'] then
        return true   
    else
        return false
    end
end 
function reloadType.isEnBloc(wpn)
    if not wpn then return false end
    if instanceof(wpn, 'HandWeapon') and wpn:getModData()['EnBloc'] then
        return true   
    else
        return false
    end
end 

------------------------ EnBloc Fire Last Round For PING---------------------------
function reloadType.EnBloc(key)
	local player = getPlayer()	
	local wpn = player:getPrimaryHandItem() 
    if not (instanceof(wpn, "HandWeapon") and wpn:isRanged()) then return end
    if reloadType.isEnBloc(wpn) then
        if wpn:getCurrentAmmoCount() == 0 and not wpn:isRoundChambered() then                
            if wpn:isContainsClip() then 
                player:playSound('GarandPing')
                local clip = InventoryItemFactory.CreateItem(wpn:getMagazineType())
                clip:setCurrentAmmoCount(wpn:getCurrentAmmoCount())        
                player:getSquare():AddWorldInventoryItem(clip, 0, 0, 0)
                wpn:setContainsClip(false)
                wpn:setCurrentAmmoCount(0)
            end
        end
    end
end 
Events.OnPlayerAttackFinished.Add(reloadType.EnBloc);

------------------------ EnBloc One in the chamber---------------------------
local hookedVanillaStopRack = ISReloadManager.stopRacking
function ISReloadManager:stopRacking()
	local player = getPlayer()	
	local wpn = player:getPrimaryHandItem() 
    if not (instanceof(wpn, "HandWeapon") and wpn:isRanged()) then return end
    if reloadType.isEnBloc(wpn) then       
        hookedVanillaStopRack(self)
        if wpn:getCurrentAmmoCount() == 0 and not wpn:isRoundChambered() then                
            if wpn:isContainsClip() then 
                player:playSound('GarandPing')
                local clip = InventoryItemFactory.CreateItem(wpn:getMagazineType())
                clip:setCurrentAmmoCount(wpn:getCurrentAmmoCount())        
                player:getSquare():AddWorldInventoryItem(clip, 0, 0, 0)
                wpn:setContainsClip(false)
                wpn:setCurrentAmmoCount(0)
            end
        end
    else
        hookedVanillaStopRack(self)
    end
end

------------------------ Load Moonclip ---------------------------
local hookedVanillaloadclip = ISInsertMagazine.loadAmmo
function ISInsertMagazine:loadAmmo()
    if self.gun:getTags():contains("MoonClip") then
        if not self.gun:isContainsClip() then
        self.character:getInventory():Remove(self.magazine)
        self.character:removeFromHands(self.magazine)
        self.gun:setCurrentAmmoCount(self.magazine:getCurrentAmmoCount())
        self.gun:setContainsClip(true)
        self.character:clearVariable("isLoading")
        self:forceComplete()
        end
    else
        hookedVanillaloadclip(self)
    end
end

------------------------ Unload isOpenBolt and EnBloc ---------------------------
local hookedVanillaUnload = ISEjectMagazine.unloadAmmo
function ISEjectMagazine:unloadAmmo()
    if reloadType.isOpenBolt(self.gun) then
        if self.gun:isContainsClip() then
        local newMag = InventoryItemFactory.CreateItem(self.gun:getMagazineType())
            if self.gun:isRoundChambered() then
            self.gun:setRoundChambered(false)
            newMag:setCurrentAmmoCount(self.gun:getCurrentAmmoCount()+1)
            else
            newMag:setCurrentAmmoCount(self.gun:getCurrentAmmoCount())
            end
        self.character:getInventory():AddItem(newMag)
        self.gun:setContainsClip(false)
        self.gun:setCurrentAmmoCount(0)
        end
    elseif reloadType.isEnBloc(self.gun) then
        local newClip = InventoryItemFactory.CreateItem(self.gun:getMagazineType())
        if self.gun:isRoundChambered() then
        self.gun:setRoundChambered(false)
        self.character:getInventory():AddItem("Base.3006Bullets", 1)
        end
        if self.gun:isContainsClip() then
            if self.gun:getCurrentAmmoCount() == 8 then
            newClip:setCurrentAmmoCount(self.gun:getCurrentAmmoCount())
            elseif self.gun:getCurrentAmmoCount() == 7 then
            self.character:getInventory():AddItem("Base.3006Bullets")
            self.character:getInventory():AddItem("Base.3006Bullets", 1)
            self.character:getInventory():AddItem("Base.3006Bullets", 1)
            elseif self.gun:getCurrentAmmoCount() == 6 then
            self.character:getInventory():AddItem("Base.3006Bullets")
            self.character:getInventory():AddItem("Base.3006Bullets", 1)
            elseif self.gun:getCurrentAmmoCount() == 5 then
            self.character:getInventory():AddItem("Base.3006Bullets")
            elseif self.gun:getCurrentAmmoCount() == 4 then
            self.character:getInventory():AddItem("Base.3006Bullets", 1)
            self.character:getInventory():AddItem("Base.3006Bullets", 1)
            self.character:getInventory():AddItem("Base.3006Bullets", 1)
            self.character:getInventory():AddItem("Base.3006Bullets", 1)
            elseif self.gun:getCurrentAmmoCount() == 3 then
            self.character:getInventory():AddItem("Base.3006Bullets", 1)
            self.character:getInventory():AddItem("Base.3006Bullets", 1)
            self.character:getInventory():AddItem("Base.3006Bullets", 1)
            elseif self.gun:getCurrentAmmoCount() == 2 then
            self.character:getInventory():AddItem("Base.3006Bullets", 1)
            self.character:getInventory():AddItem("Base.3006Bullets", 1)
            elseif self.gun:getCurrentAmmoCount() == 1 then
            self.character:getInventory():AddItem("Base.3006Bullets", 1)
            end
        self.character:getInventory():AddItem(newClip)
        self.gun:setContainsClip(false)
        self.gun:setCurrentAmmoCount(0)
        end
    else
        hookedVanillaUnload(self)
    end
end

local function onKeyPressed(key)
	if (key == getCore():getKey("Rack Firearm")) then 
        local player = getPlayer()	
        local wpn = player:getPrimaryHandItem() 
        if not (instanceof(wpn, "HandWeapon") and wpn:isRanged()) then return end
        if reloadType.isEnBloc(wpn) then
            if wpn:getCurrentAmmoCount() == 0  then            
                if wpn:isContainsClip() then 
                    player:playSound('GarandPing')
                    local clip = InventoryItemFactory.CreateItem(wpn:getMagazineType())
                    clip:setCurrentAmmoCount(wpn:getCurrentAmmoCount())        
                    player:getSquare():AddWorldInventoryItem(clip, 0, 0, 0)
                    wpn:setContainsClip(false)
                    wpn:setCurrentAmmoCount(0)
                end
            end
        end
    end
    return  key
end

Events.OnKeyPressed.Add(onKeyPressed)
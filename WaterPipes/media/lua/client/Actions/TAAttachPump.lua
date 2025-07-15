require "TimedActions/ISBaseTimedAction"
require "wp_vsquare"

---@class TAAttachPump : ISBaseTimedAction
TAAttachPump = ISBaseTimedAction:derive("TAAttachPump");

function TAAttachPump:isValid()
	return true
end

function TAAttachPump:update()
end

function TAAttachPump:start()
    self.character:faceThisObject(self.object)
	self:setActionAnim("RemoveCurtain")
	self.sound = self.character:playSound("GeneratorConnect")
end

function TAAttachPump:stop()
    self.character:stopOrTriggerSound(self.sound)
	ISBaseTimedAction.stop(self)
end

function TAAttachPump:perform()
    self.character:stopOrTriggerSound(self.sound)

	local cell = self.square:getCell()

    local spriteName = "industry_02_52"
    if self.orientation == "V" then
        spriteName = "industry_02_53"
    end

	cd = IsoClothingDryer.new(self.square:getCell(), self.square, getSprite(spriteName))
    cd:setActivated(false)
    cd:setMovedThumpable(true)
    cd:createContainersFromSpriteProperties()

	if isClient() then
        sledgeDestroy(self.object);
    else
        self.object:getSquare():transmitRemoveItemFromSquare(self.object)
    end

    self.square:AddSpecialObject(cd)
    cd:transmitCompleteItemToServer()

    local ef = self.character:getPerkLevel(Perks.MetalWelding) * 10
    if ef < 10 then ef = 10 end

    Vsquare.AddPump(cd, ef, self.fresh, self.fuel)

	ISBaseTimedAction.perform(self)
end


function TAAttachPump:new(character, square, object, orientation, fresh, fuel)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	
    
    o.character = character
    o.stopOnWalk = false
    -- o.stopOnRun = false
    o.maxTime = 160

    -- custom fields
	o.object = object
    o.square = square
    o.orientation = orientation
    o.fresh = fresh
    o.fuel = fuel
	return o
end

return TAAttachPump;


local function BayonetCondition(player, weapon)
	local player = getPlayer()	
    local weapon = player:getPrimaryHandItem() 
    
    if weapon == nil or not instanceof(weapon, 'HandWeapon') or not weapon:getTags():contains("BayoUsed") then return end
    if instanceof(weapon, 'HandWeapon') and weapon:getTags():contains("BayoUsed") then
    	if ZombRand(1,35) == 1 then
        	if (weapon:getModData().modBayo_Con == 0) or ((weapon:getModData().modBayo_Con - 1) == 0) then
        		if  weapon:getModData().modBayo_Con > 0 then
              		weapon:getModData().modBayo_Con = (weapon:getModData().modBayo_Con) - 1
            	end
				for index, preset in ipairs(UseBayonetSet) do
					if preset == weapon:getFullType() and weapon:getTags():contains("BayoUsed") then
	        			ISTimedActionQueue.add(Guns93UseBayonetAction:new(weapon, index - 1, player, CharacterActionAnims.Craft, 0))
					end
				end
            	getPlayer():setHaloNote("Bayonet Is Broken!") 

          	elseif weapon:getModData().modBayo_Con > 0 then
            	weapon:getModData().modBayo_Con = (weapon:getModData().modBayo_Con) - 1
          	end
        end
    end
end

Events.OnPlayerAttackFinished.Add(BayonetCondition);

local function GunFouling()
	local player = getPlayer()	
    local weapon = player:getPrimaryHandItem()
	if weapon == nil or not instanceof(weapon, 'HandWeapon') then return end
	if weapon:getModData()["mod_fouling"] then
		local foulingLevel = weapon:getConditionLowerChance() - (weapon:getJamGunChance() * 10) - 5
		if ZombRand(1,foulingLevel) == 1 then
			if weapon:getModData().mod_fouling < 10 then	
				weapon:getModData().mod_fouling = (weapon:getModData().mod_fouling) + 1
			elseif weapon:getModData().mod_fouling > 10 then
				weapon:getModData().mod_fouling = 10
			end
		end
	end
end

Events.OnPlayerAttackFinished.Add(GunFouling);

Guns93UseCleaningKit = {}

Guns93UseCleaningKit.callAction = function(item, player, CleaningKit) 
	if item and item:getContainer() == player:getInventory() then
		ISTimedActionQueue.add(Guns93UseCleaningKitAction:new(item, player, cleankit, CharacterActionAnims.Craft, 100))
	end
	
end

Guns93UseCleaningKitAction = ISBaseTimedAction:derive("Guns93UseCleaningKitAction");

function Guns93UseCleaningKitAction:new(item, character, cleankit, anim, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
  	o.item = item;
  	o.cleankit = cleankit;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.maxTime = time;
  	o.caloriesModifier = 15;
	o.animation = anim
	o.useProgressBar = false;
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
	return o;
end

function Guns93UseCleaningKitAction:isValid() 
	local returnvalue = true
	if not self.item or self.item:getContainer() ~= self.character:getInventory() then 
		returnvalue = false;
	end
	return returnvalue;
end

function Guns93UseCleaningKitAction:waitToStart()
	return false;
end

function Guns93UseCleaningKitAction:start() 
	self.item:setJobType("Use Gun Cleaning Kit");
	self.item:setJobDelta(0.0);
	self:setOverrideHandModels(self.item:getStaticModel(), nil)
	self:setActionAnim(self.animation);
end

function Guns93UseCleaningKitAction:perform() 
	UseCleaningKit(self.item, self.character, self.cleankit)
	ISBaseTimedAction.perform(self);
	ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function Guns93UseCleaningKitAction:update()
	self.item:setJobDelta(self:getJobDelta());
    self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function Guns93UseCleaningKitAction:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

function UseCleaningKit(item, player, cleankit)
	cleankit = player:getInventory():FindAndReturn("GunCleaningKit")
	if item:getTags():contains("Guns93") or item:getModData()["isSilencerCon"] then
		if (item:getModData().mod_fouling - 4) < 0 then
			item:getModData().mod_fouling = 0
		elseif item:getModData().mod_fouling > 0 then
			item:getModData().mod_fouling = item:getModData().mod_fouling - 4
		end
	end
	if not item:getModData()["isSilencerCon"] then
		if item:getBloodLevel() then
			if (item:getBloodLevel() - 4) < 0 then
				item:setBloodLevel(0)
				if item:getBloodLevel() > 0 then
					item:setBloodLevel(item:getBloodLevel() - 4)
				end
			end
		end
	end
	player:getInventory():DoRemoveItem(cleankit)
	if player:getPrimaryHandItem() == item then
        player:setPrimaryHandItem(nil);
        if item:isTwoHandWeapon() then
            player:setSecondaryHandItem(nil);
        end
    end
	player:resetEquippedHandsModels()
end

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

local old_render = ISToolTipInv.render

function ISToolTipInv:render()
	local moddata = self.item:getModData()  
	local numRows = 0
	local extraRows =0
	local AddCondition = nil
	local howDirty = nil
	local canDirty = nil
	local fouling = 0
	if instanceof(self.item, "HandWeapon")  then
		if self.item:getModData()["mod_fouling"] then
			if moddata.mod_fouling > self.item:getBloodLevel() then
				fouling = self.item:getModData()["mod_fouling"]
			elseif self.item:getBloodLevel() > moddata.mod_fouling then
				fouling = self.item:getBloodLevel()
			end
		end
	elseif self.item:getCategory() == "WeaponPart" then
		if self.item:getPartType() == "Canon" and self.item:getModData()["mod_fouling"] then
			fouling = moddata.mod_fouling
		end
	end
	local bayoCon = nil
	local canCon = nil

	if self.item ~= nil then
		getPlayer()
		if instanceof(self.item, "HandWeapon") then
			if self.item:getModData()["mod_fouling"] then
				if self.item:getTags():contains("Bayonet") then
					numRows = 4
					howDirty  = "-Fouling/Blood Level: " .. round(fouling * 10, 3) .. "%"
					bayoCon = "-Bayonet Condition: :" .. (self.item:getModData()["modBayo_Con"] * 10) .. "%"
				elseif self.item:getCanon() and self.item:getCanon():getModData()["isSilencer"] then
					numRows = 5
					howDirty  = "-Fouling/Blood Level: " .. round(fouling * 10, 3) .. "%"
					canCon = "-Silencer Condition: :" .. (self.item:getModData().modCan_Con * 10) .. "%"
					canDirty = "-Silencer Fouling: :" .. round(self.item:getModData()["mod_canfoul"] * 10, 3) .. "%"
				elseif self.item:getSubCategory() == "Firearm" then
					numRows = 2
					howDirty  = "-Fouling/Blood Level: " .. round(fouling * 10, 3) .. "%"
				end
			end
		elseif self.item:getCategory() == "WeaponPart" then
    		if self.item:getPartType() == "Canon" and self.item:getModData()["mod_fouling"] then
        		numRows = 3
        		AddCondition = "-Condition: " .. (self.item:getCondition() * 10) .. "%"
				howDirty  = "-Fouling: " .. round(fouling * 10, 3) .. "%"
    		end
    	else
    		return old_render(self)
    	end
	end
	local stage = 1
	local old_y = 0
	local lineSpacing = self.tooltip:getLineSpacing()
	local old_setHeight = self.setHeight
	self.setHeight = function(self, num, ...)
		if stage == 1 then
			stage = 2
			old_y = num
			num = num + numRows * lineSpacing
		else 
			stage = -1
		end
		return old_setHeight(self, num, ...)
	end
	local old_drawRectBorder = self.drawRectBorder
	self.drawRectBorder = function(self, ...)
		if numRows > 0 then
			local color = {0.68, 0.64, 0.96}
			local font = UIFont[getCore():getOptionTooltipFont()];
			if self.item:getModData()["mod_fouling"] and instanceof(self.item, "HandWeapon") then
				if numRows > 0 then
					self.tooltip:DrawText(font, "Maintenance Details", 5, old_y, 1, 1, 1, 1);
					self.tooltip:DrawText(font, howDirty, 5, old_y + lineSpacing, 1, 1, 1, 1);
					if numRows > 2  then
						self.tooltip:DrawText(font, "Attachment Conditions", 5, old_y + lineSpacing*2, 1, 1, 1, 1);
						if self.item:getTags():contains("Bayonet") then
							self.tooltip:DrawText(font, bayoCon, 5, old_y + lineSpacing*3, 1, 1, 1, 1);
						elseif self.item:getCanon() and self.item:getCanon():getModData()["isSilencer"] then
							self.tooltip:DrawText(font, canCon, 5, old_y + lineSpacing*3, 1, 1, 1, 1);
							self.tooltip:DrawText(font, canDirty, 5, old_y + lineSpacing*4, 1, 1, 1, 1);
						end
					end
				end
    		elseif self.item:getPartType() then
				if self.item:getPartType() == "Canon" and self.item:getModData()["mod_fouling"] then
					self.tooltip:DrawText(font, "Maintenance Details", 5, old_y, 1, 1, 1, 1);
					self.tooltip:DrawText(font, AddCondition, 5, old_y + lineSpacing, 1, 1, 1, 1);
					self.tooltip:DrawText(font, howDirty, 5, old_y + lineSpacing*2, 1, 1, 1, 1);
				end
    		end
			stage = 3
		else
			stage = -1 --error
		end
		return old_drawRectBorder(self, ...)
	end
	old_render(self)
	self.setHeight = old_setHeight
	self.drawRectBorder = old_drawRectBorder
end
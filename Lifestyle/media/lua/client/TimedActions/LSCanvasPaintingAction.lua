--------------------------------------------------------------------------------------------------
--		----	  |			  |			|		 |				|    --    |      ----			--
--		----	  |			  |			|		 |				|    --	   |      ----			--
--		----	  |		-------	   -----|	 ---------		-----          -      ----	   -------
--		----	  |			---			|		 -----		------        --      ----			--
--		----	  |			---			|		 -----		-------	 	 ---      ----			--
--		----	  |		-------	   ----------	 -----		-------		 ---      ----	   -------
--			|	  |		-------			|		 -----		-------		 ---		  |			--
--			|	  |		-------			|	 	 -----		-------		 ---		  |			--
--------------------------------------------------------------------------------------------------

require "TimedActions/ISBaseTimedAction"

LSCanvasPaintingAction = ISBaseTimedAction:derive("LSCanvasPaintingAction");

local function shouldChangePaintSound(character, sound)
	if sound and sound ~= 0 then
		if character:getEmitter():isPlaying(sound) then return false; end
	end
	return true
end

local function getSoundTable(state)
	if state == "Paint" then
		return {"Easel_Paint1","Easel_Paint2","Easel_Paint3","Easel_Paint4","Easel_Paint5"}
	end

	return {"Easel_Brush1","Easel_Brush2","Easel_Brush3","Easel_Brush4","Easel_Brush5"}
end

local function getNewSound(state, oldSound)
	local audioTable = getSoundTable(state)
	if oldSound then
		for n=1, #audioTable do
			if audioTable[n] == oldSound then table.remove(audioTable, n); break; end
		end
	end

	return audioTable[ZombRand(#audioTable)+1]
end

local function updateCanvasSprite(easel, newSprite, stage)
	easel:getModData().stage = stage
	easel:setOverlaySprite(newSprite, isClient())
	if isClient() then
		easel:transmitUpdatedSpriteToServer()
		easel:transmitModData()
	end
end

local function shouldUpdateCanvas(easel, painting, currentDuration, jobProgress, stage)
	if stage == 4 then return; end
	local currentProgress = currentDuration - jobProgress
	local val = 100 - (math.floor(currentProgress/(painting["duration"]/100)))
	if val < 25 then return; end
	
	if (val >= 25) and (stage == 0) then updateCanvasSprite(easel, painting["stage1"], 1);
	elseif (val >= 50) and (stage == 1) then updateCanvasSprite(easel, painting["stage2"], 2);
	elseif (val >= 75) and (stage == 2) then updateCanvasSprite(easel, painting["stage3"], 3);
	end
end

function LSCanvasPaintingAction:isValid()
	return true;
end

function LSCanvasPaintingAction:waitToStart()
	self.action:setUseProgressBar(false)
	self.character:faceThisObject(self.easel);
	return self.character:shouldBeTurning();
end

local function paintPaletteHasUses(palette)
	--if palette:getCurrentUses() and (palette:getCurrentUses() > 0) then return true; end
	if palette:isInPlayerInventory() then return true; end
	return false
end

function LSCanvasPaintingAction:update()
	self.count = self.count + (getGameTime():getGameWorldSecondsSinceLastUpdate()*GTLSCheck)
	
	if self.animChangeCount > self.animChangeTotal then
		self.animChangeCount = 0
		if self.currentState == "Paint" then self.currentState = "Brush"; self.animChangeTotal = 15+ZombRand(10);
		elseif self.currentState == "Brush" then if not paintPaletteHasUses(self.paintItems.palette) then self:forceStop(); end; self.currentState = "Paint"; self.animChangeTotal = 2+ZombRand(3); end
	end

	if self.count >= self.countTotal then
		self.count = 0
		self.animChangeCount = self.animChangeCount+1
		
		self.soundName = getNewSound(self.currentState, self.soundName)
		self.sound = self.character:getEmitter():playSound(self.soundName)
		self:setActionAnim("Bob_Easel_"..self.currentState)

		if self.currentState == "Brush" then shouldUpdateCanvas(self.easel, self.painting, self.maxTime, self.jobProgress, self.easel:getModData().stage);
		else self.paintItems.palette:Use();
		end
		
	end
	self.jobProgress = self:getJobDelta()*self.maxTime
    self.character:setMetabolicTarget(Metabolics.LightWork)
end

function LSCanvasPaintingAction:start()
	self:setOverrideHandModels(self.paintItems.brush, self.paintItems.palette)
	self:setActionAnim("Bob_Easel_Paint")
end

function LSCanvasPaintingAction:stop()
	self.easel:getModData().progress = (self.maxTime - self.jobProgress)
	if isClient() then self.easel:transmitModData(); end

    ISBaseTimedAction.stop(self);		
end

function LSCanvasPaintingAction:perform()
	updateCanvasSprite(self.easel, self.painting["stage4"], 4)


	ISBaseTimedAction.perform(self);
end

function LSCanvasPaintingAction:new(Player, Easel, Painting, Duration, Items)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = Player
	o.easel = Easel
	o.painting = Painting
	o.paintItems = Items
	o.ignoreHandsWounds = true;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.stopOnAim = true;
	o.maxTime = Duration
	o.jobProgress = 0
	o.count = 0
	o.countTotal = 15
	o.animChangeCount = 0
	o.animChangeTotal = 3
	o.currentState = "Paint"
	o.sound = 0
	o.soundName = false
	if o.character:isTimedActionInstant() then o.maxTime = 1; end
	return o;
end

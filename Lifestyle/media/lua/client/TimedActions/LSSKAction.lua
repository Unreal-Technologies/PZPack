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

LSSKAction = ISBaseTimedAction:derive("LSSKAction")

local function checkLSSKConditions(character, source)

	if source then
		--if character:getModData().LSCooldowns["TeachCooldown"] and character:getModData().LSCooldowns["TeachCooldown"] > 0 then
		--	return false
		--end
	else
		if character:getModData().LSMoodles["WasTaughtMeditation"] and character:getModData().LSMoodles["WasTaughtMeditation"].Value > 0 then
			return false
		end
	end

	return true

end

local function doPerformBuff(character, skill, source)

	if source then
		--character:getModData().LSCooldowns["TeachCooldown"] = 24
		character:getModData().LSMoodles["TaughtSkill"].Value = 0.8
		if skill == "SKmeditation" then
			getSoundManager():playUISound("UI_SK_Meditation")
		end
	else
		--character:getModData().LSCooldowns["LessonCooldown"] = 24

		if skill == "SKmeditation" then
			getSoundManager():playUISound("UI_SK_Meditation")
			character:getModData().LSMoodles["WasTaughtMeditation"].Value = 0.8
		end
	end
end

local function doGreetingOrGoodbye(character, source, vox)

	local PlayerVoiceTracks = require("MPSocial/Vox/BaseInteractions")
	local AvailablePlayerVoiceTracks = {}
	
	-- we loop the voice tracks and select the ones that we want, making sure to only select the ones that match the player voice
	for k,v in pairs(PlayerVoiceTracks) do
		if v.Voice == character:getModData().PlayerVoice and
		v.Type == vox then
			table.insert(AvailablePlayerVoiceTracks, v)
		end
	end

				
	-- then we add a random factor to it
	local randomLine = ZombRand(#AvailablePlayerVoiceTracks) + 1
	local randomTrack = AvailablePlayerVoiceTracks[randomLine]
	local sound = randomTrack.sound
	
	if character:getDescriptor():isFemale() then
		sound = randomTrack.soundF
	end
		
	character:getEmitter():playSound(sound)

end

local function getOppositeTrait(skill)

	if not skill then return; end

	local trait

	if skill == "SKmeditation" then
		trait = "CouchPotato"
	end

	return trait
end

local function getVoxList(character, source, skill, negativeTrait)

	local VoxList
	local availableVox = {}

	if source then
		VoxList = require("MPSocial/Vox/BaseTell")

		for k,v in pairs(VoxList) do
			if v.Voice == character:getModData().PlayerVoice and
			v.Type == "Expo" and (skill == "SKmeditation") then
				table.insert(availableVox, v)
			end
		end

	else
		VoxList = require("MPSocial/Vox/BaseUtterances")

		for k,v in pairs(VoxList) do
			if ((v.Type == "Positive") or (v.Type == "Curious")) and not character:HasTrait(negativeTrait) then
				table.insert(availableVox, v)
			elseif ((v.Type == "Negative") or (v.Type == "Bored") or (v.Type == "Indifferent")) and character:HasTrait(negativeTrait) then
				table.insert(availableVox, v)
			end
		end

	end

	return availableVox

end

local function getAnimList(character, source, skill, negativeTrait)

	local AnimList = require("MPSocial/Anim/Talking")
	local availableAnims = {}

	for k,v in pairs(AnimList) do
		if source then
			if (skill == "SKmeditation") and ((v.Type == "Teach" and ((v.Mood == "None") or (v.Mood == "Meditation"))) or ((v.Type == "Listen") and (v.Mood == "Meditation"))) then
				table.insert(availableAnims, v)
			end
		elseif (v.Type == "Listen" and ((v.Mood == "Positive") or (v.Mood == "Neutral"))) and not character:HasTrait(negativeTrait) then
			table.insert(availableAnims, v)
		elseif (v.Type == "Listen" and (v.Mood == "Negative")) and character:HasTrait(negativeTrait) then
			table.insert(availableAnims, v)
		end

	end

	return availableAnims

end

local function getOtherPlayer(character, otherPlayer)

	local isOtherPlayerClose

	for x = character:getX()-1,character:getX()+1 do
		for y = character:getY()-1,character:getY()+1 do
			local square = getCell():getGridSquare(x,y,character:getZ());
			if square then
				for i = 0,square:getMovingObjects():size()-1 do
					local moving = square:getMovingObjects():get(i);
					if instanceof(moving, "IsoPlayer") then
						if moving:getUsername() ~= character:getUsername() and
						moving:isOutside() == character:isOutside() and
						moving:getUsername() == otherPlayer:getUsername() then
							isOtherPlayerClose = true
							break
						end
					end
				end
			end
		end
	end


	if not otherPlayer:hasTimedActions() and not isOtherPlayerClose then
		return false
	end


	return true
end

local function getSoundToPlay(character, availableVox, lastSound)

	local sound

	local randomLine = ZombRand(#availableVox) + 1
	local randomTrack = availableVox[randomLine]

	if lastSound and ((lastSound == availableVox[randomLine].sound) or (lastSound == availableVox[randomLine].soundF)) then
		if ((randomLine+1) <= #availableVox) and availableVox[randomLine+1] and availableVox[randomLine+1].sound then
			randomTrack = availableVox[randomLine+1]
		elseif ((randomLine-1) >= 1) and availableVox[randomLine-1] and availableVox[randomLine-1].sound then
			randomTrack = availableVox[randomLine-1]
		end
	end

	if character:getDescriptor():isFemale() then
		sound = randomTrack.soundF
	else
		sound = randomTrack.sound
	end

	return sound
end

function LSSKAction:waitToStart()

	self.character:nullifyAiming()
    self.character:setX(self.character:getX())
    self.character:setY(self.character:getY())
	self.character:setLx(self.character:getX())
    self.character:setLy(self.character:getY())

	if not self.source and not self.commandSent then
		self.commandSent = true
		sendClientCommand(self.character, "LS", "StopOrStartInteraction", {self.otherPlayer:getOnlineID(), "doAction"})
		--print("TA-LSSKAction Sent StopOrStartInteraction command with doAction")
	end

	self.character:faceLocation(self.otherPlayer:getX(), self.otherPlayer:getY())
	self.character:faceLocationF(self.otherPlayer:getX(), self.otherPlayer:getY())

	return self.character:shouldBeTurning();
end

function LSSKAction:isValid()
	return true
end

function LSSKAction:update()

	self.countAnimTimer = self.countAnimTimer + (getGameTime():getGameWorldSecondsSinceLastUpdate()*GTLSCheck)
	self.countSoundTimer = self.countSoundTimer + (getGameTime():getGameWorldSecondsSinceLastUpdate()*GTLSCheck)

	self.character:nullifyAiming()

	if self.character:getModData().LSInteractionState == "none" then
		--print("TA-LSSKAction force stop")
		self:forceStop()
	elseif self.character:getModData().LSInteractionState == "negativeReaction" then
		--print("TA-LSSKAction force stop Negative Reaction")
		self.character:getModData().LSMoodles["AdviceWasted"].Value = 0.8
		self.intEndargs = {"negativeReaction", false}
		self:forceComplete()
	elseif self.character:getModData().LSInteractionState == "actionFinished" then
		--print("TA-LSSKAction force complete")
		self:forceComplete()
	elseif (self.character:pressedMovement(true)) and (isKeyDown(Keyboard.KEY_LSHIFT)) then
		--print("TA-LSSKAction force stop")
		self:forceStop()
	end

	if not self.source and self.character:HasTrait(self.negativeTrait) then
		if self.negativeTimer >= self.negativeMaxTime then
			--print("TA-LSSKAction force stop negativeMaxTime")
			self:forceStop()
		end
		self.negativeTimer = self.negativeTimer + (getGameTime():getGameWorldSecondsSinceLastUpdate()*GTLSCheck)
	end

	--if not self.checkAction then
	--	checkLSSKConditions(self.character, self.source)
	--	self.checkAction = true
	--end

	if self.countAnimTimer >= self.totalAnimTimer then
		if not getOtherPlayer(self.character, self.otherPlayer) then
			--print("TA-LSSKAction force stop. Reason: false at getOtherPlayer")
			self:forceStop()
		end
		self.countAnimTimer = 0
		self.idxAnim = ZombRand(#self.availableAnims) + 1
		self.AnimToplay = self.availableAnims[self.idxAnim].Anim
		self.totalAnimTimer = self.availableAnims[self.idxAnim].Time
		self:setActionAnim(self.AnimToplay)
		--self.character:Say(tostring(self.AnimToplay))
	end

	if self.countSoundTimer >= self.totalSoundTimer then

		self.countSoundTimer = 0	
		
		self.soundToPlay = getSoundToPlay(self.character, self.availableVox, self.lastSound)
		self.lastSound = self.soundToPlay

		self.gameSound = self.character:getEmitter():playSound(self.soundToPlay)
	end

end

function LSSKAction:start()

	--if not self.character:getModData().LSCooldowns then self.character:getModData().LSCooldowns = {}; end
	--if not self.character:getModData().LSCooldowns["TeachCooldown"] then self.character:getModData().LSCooldowns["TeachCooldown"] = 0; end
	--if not self.character:getModData().LSCooldowns["LessonCooldown"] then self.character:getModData().LSCooldowns["LessonCooldown"] = 0; end

	self.negativeTrait = getOppositeTrait(self.skill)

	self.availableAnims = getAnimList(self.character, self.source, self.skill, self.negativeTrait)

	self.availableVox = getVoxList(self.character, self.source, self.skill, self.negativeTrait)

	if self.character:getModData().LSInteractionState == "sourceStoppedWaiting" then
		--print("TA-LSSKAction LSInteractionState is sourceStoppedWaiting, changing to none")
		self.character:getModData().LSInteractionState = "none"
	else
		--print("TA-LSSKAction LSInteractionState changed to doingAction")
		self.character:getModData().LSInteractionState = "doingAction"
	end
		
	self:setOverrideHandModels(nil, nil)
	self.character:setBlockMovement(true)

	if not self.source then

		doGreetingOrGoodbye(self.character, self.source, "Greet")
		
		self:setActionAnim("Bob_Converse_AgreeingHandGesture")
		self.countAnimTimer = 10
		self.totalSoundTimer = 60
	else
		self:setActionAnim("Bob_Converse_Acknowledging")
		self.countSoundTimer = 20
	end

end

function LSSKAction:stop()

	self.character:setBlockMovement(false)

	if self.character:getModData().LSInteractionState == "doingAction" then
		--print("TA-LSSKAction action stopped by player, sending StopOrStartInteraction command with none")
		if self.source or not self.character:HasTrait(self.negativeTrait) then
			sendClientCommand(self.character, "LS", "StopOrStartInteraction", {self.otherPlayer:getOnlineID(), "none"})
		else
			sendClientCommand(self.character, "LS", "StopOrStartInteraction", {self.otherPlayer:getOnlineID(), "negativeReaction"})
		end
	end

	self.character:getModData().LSInteractionState = "none"

	if self.gameSound and
	self.gameSound ~= 0 and
	self.character:getEmitter():isPlaying(self.gameSound) then
		self.character:getEmitter():stopSound(self.gameSound);
	end

    ISBaseTimedAction.stop(self);
end

function LSSKAction:perform()

	self.character:setBlockMovement(false)
	self.character:getModData().LSInteractionState = "none"
	--print("TA-LSSKAction action performed")

	if self.gameSound and
	self.gameSound ~= 0 and
	self.character:getEmitter():isPlaying(self.gameSound) then
		self.character:getEmitter():stopSound(self.gameSound);
	end

	if self.intEndargs ~= 0 then
		EndInteractionAlone(self.source, self.character, "TimedActions/LSEndIntDisappointed", self.intEndargs)
	else
	doPerformBuff(self.character, self.skill, self.source)
	end

	ISBaseTimedAction.perform(self);
end

function LSSKAction:new(character, otherPlayer, args)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
	o.otherPlayer = otherPlayer
	o.source = args[2]
	o.skill = args[1]
	o.commandSent = false
	o.stopOnAim = false
	o.stopOnWalk = false
	o.stopOnRun = true
	o.gameSound = 0
	o.maxTime = 1500
	o.ignoreHandsWounds = true
	o.useProgressBar = false
	o.countSoundTimer = 0
	o.countAnimTimer = 0
	o.totalSoundTimer = 40
	o.totalAnimTimer = 20
	o.availableAnims = 0
	o.idxAnim = 0
	o.AnimToplay = 0
	o.availableVox = 0
	o.soundToPlay = 0
	o.checkAction = false
	o.negativeTimer = 0
	o.negativeMaxTime = 120
	o.intEndargs = 0
	o.negativeTrait = 0
	o.lastSound = false
	return o;
end

return LSSKAction
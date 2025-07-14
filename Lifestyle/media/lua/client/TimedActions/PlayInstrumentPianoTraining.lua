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

local PlayInstrumentPianoTraining = ISBaseTimedAction:derive('PlayInstrumentPianoTraining');
local Failstate = false
local randomchance = ZombRand(1, 100)

local function adjustStats(character, tracklevel)

	local characterData = character:getModData()
	local PlayerMusicLevel = character:getPerkLevel(Perks.Music)
	local bodyDamage = character:getBodyDamage()
	local stats = character:getStats()
	local currentBoredom = bodyDamage:getBoredomLevel()
	local currentUnhappyness = bodyDamage:getUnhappynessLevel()
	local currentStress = stats:getStress();
	local currentExhaustion = stats:getEndurance()
	local currentFatigue = stats:getFatigue()
	if character:HasTrait("Smoker") then
		stats:setStressFromCigarettes(0)
	end

	--SANDBOX
	local StrengthMultiplier = 1
	local sandboxMusicStrengthMultiplier = SandboxVars.Music.StrengthMultiplier or 2
	if sandboxMusicStrengthMultiplier ~= nil then
		if sandboxMusicStrengthMultiplier == 1 then
			StrengthMultiplier = 0.5
		elseif sandboxMusicStrengthMultiplier == 2 then
			StrengthMultiplier = 1
		elseif sandboxMusicStrengthMultiplier == 3 then
			StrengthMultiplier = 2
		elseif sandboxMusicStrengthMultiplier == 4 then
			StrengthMultiplier = 4
		end
	end

	--VARIABLES
	--local Party = 0
	local Trait = 0
	local Level = 0
	local varMult = 1
	local reverseBuffs = 0
	--TRAIT
	if character:HasTrait("Virtuoso") or character:HasTrait("KeenHearing") or (characterData.LSMoodles["PartyGood"].Value >= 0.2) then
		Trait = 1
	end
	if character:HasTrait("HardOfHearing") then
		if varMult > 0.9 then
		varMult = 0.9
		end
	end
	if character:HasTrait("ToneDeaf") then
		reverseBuffs = 1
	end
	--LEVEL
	Level = ((tonumber(PlayerMusicLevel))/3) + ((tonumber(tracklevel))/3)

	--STRESS
	if currentStress >= 0.8 then
		if varMult > 0.1 then
		varMult = 0.1
		end
	elseif currentStress >= 0.6 then
		if varMult > 0.8 then
		varMult = 0.8
		end
	elseif currentStress >= 0.4 then
		if varMult > 0.9 then
		varMult = 0.9
		end
	end
	--PARTYBAD
	if (characterData.LSMoodles["PartyBad"].Value == 0.6) then
		if varMult > 0.1 then
		varMult = 0.1
		end
	elseif characterData.LSMoodles["PartyBad"].Value == 0.4 then
		if varMult > 0.5 then
		varMult = 0.5
		end
	elseif characterData.LSMoodles["PartyBad"].Value == 0.2 then
		if varMult > 0.9 then
		varMult = 0.9
		end
	end

	--EMBARRASSED
	if (characterData.LSMoodles["Embarrassed"].Value == 0.8) then
		if varMult > 0.01 then
		varMult = 0.01
		end
	elseif (characterData.LSMoodles["Embarrassed"].Value == 0.6) then
		if varMult > 0.15 then
		varMult = 0.15
		end
	elseif characterData.LSMoodles["Embarrassed"].Value == 0.4 then
		if varMult > 0.3 then
		varMult = 0.3
		end
	elseif characterData.LSMoodles["Embarrassed"].Value == 0.2 then
		if varMult > 0.5 then
		varMult = 0.5
		end
	end

	--FATIGUE
	if currentFatigue >= 0.8 then
		if varMult > 0.02 then
		varMult = 0.02
		end
	elseif currentFatigue >= 0.7 then
		if varMult > 0.2 then
		varMult = 0.2
		end
	elseif currentFatigue >= 0.5 then
		if varMult > 0.4 then
		varMult = 0.4
		end
	elseif currentFatigue >= 0.4 then
		if varMult > 0.6 then
		varMult = 0.6
		end
	end

	--EXHAUSTION
	if currentExhaustion <= 0.2 then
		if varMult > 0.02 then
		varMult = 0.02
		end
	elseif currentExhaustion <= 0.3 then
		if varMult > 0.2 then
		varMult = 0.2
		end
	elseif currentExhaustion <= 0.4 then
		if varMult > 0.4 then
		varMult = 0.4
		end
	elseif currentExhaustion <= 0.7 then
		if varMult > 0.6 then
		varMult = 0.6
		end
	end

	--RESULT
	local varAdd = Trait + Level + 1
	local varAddRev = Trait + Level + StrengthMultiplier + 1
	local varResult = varAdd * varMult * StrengthMultiplier * 0.5
	
	if reverseBuffs == 1 then
		if varAddRev >= 6  then
			varAddRev = 5.9
		end
		varResult = (6 - varAddRev)/varMult
	end
	
	--DEFINES
	--ENDURANCE
	stats:setEndurance(currentExhaustion - 0.003)
	stats:setFatigue(currentFatigue + 0.001)
	--BOREDOM 0 - 100
	local boredomChange = (1/varMult)/(StrengthMultiplier+varAdd)

	--SET
--	if reverseBuffs == 1 then
--		bodyDamage:setBoredomLevel(currentBoredom + (boredomChange*5))
--		stats:setStress(currentStress + stressChange)
--		bodyDamage:setUnhappynessLevel(currentUnhappyness + unhappynessChange)
--		varResult = varAdd * varMult * StrengthMultiplier * 0.5-- FOR XP
--	else	
--		bodyDamage:setBoredomLevel(currentBoredom + boredomChange)
--	end

	if character:HasTrait("ToneDeaf") then
		local stressChange = boredomChange/100
		stats:setStress(currentStress + stressChange)
		local unhappynessChange = boredomChange/10
		bodyDamage:setUnhappynessLevel(currentUnhappyness + unhappynessChange)
		boredomChange = boredomChange*2
	end

	if not character:HasTrait("Virtuoso") then bodyDamage:setBoredomLevel(currentBoredom + boredomChange); end

	--XP
	if Level < 1 then Level = 1; end
	local xpChange = varResult*Level
	--local xpChange = varResult
	if PlayerMusicLevel == 10 then
		xpChange = 0
	end
	character:getXp():AddXP(Perks.Music, xpChange)

	--(my) Sanity Check
	if character:isInvisible() then character:Say("PLAYER IS INVISIBLE: CAN'T PLAY SOUND"); end
end

local function getSandboxOptionMusicChance()
	local sandboxValue = SandboxVars.Music.LearningChance or 3
	local chance = 0
	if sandboxValue == 1 then chance = -2;
	elseif sandboxValue == 2 then chance = -1;
	elseif sandboxValue == 3 then chance = 0;
	elseif sandboxValue == 4 then chance = 2;
	elseif sandboxValue == 5 then chance = 5;
	end
	return chance
end

function PlayInstrumentPianoTraining:isValid()

   return true;
end


function PlayInstrumentPianoTraining:waitToStart()
	--self.character:faceThisObject(self.piano)
	--self.character:faceThisObject(self.piano)
		--return self.character:shouldBeTurning();
		return false
end

function PlayInstrumentPianoTraining:update()
	
	if not self.piano then
		self:forceStop()
	end
	if isKeyDown(Keyboard.KEY_E) then
		self:forceStop()
	end
	if self.character:isSneaking() then
		self:forceStop()
	end
	if not self.character:isSitOnGround() then
		self:forceStop()
	end

	-- panic check
	if not self.character:HasTrait("Desensitized") then
		if self.character:HasTrait("Brave") or self.character:HasTrait("Disciplined") then
			if self.character:getMoodles():getMoodleLevel(MoodleType.Panic) > 3 then
				Failstate = true
			end
		elseif self.character:getMoodles():getMoodleLevel(MoodleType.Panic) > 2 then
				Failstate = true
		end
	end
	
	if Failstate == true then
	self:forceStop()
	end
	
	local playerlevel = self.character:getPerkLevel(Perks.Music)
	local tracklevel = self.level
	
	self:setActionAnim(self.AnimToplay)

	local soundRadius = 10
	local volume = 5
		
	if self.character:isOutside() then
		soundRadius = 30
		volume = 10
	end

	if #self.AvailableInstrumentTracks == 0 then
		self:forceStop()
	end

	local randomSound = ZombRand(#self.AvailableInstrumentTracks) + 1
	local randomTrack = self.AvailableInstrumentTracks[randomSound]
	local sound = randomTrack.sound

	if not self.gameSound then
		if self.lastSound and self.lastSound == sound then
			randomSound = ZombRand(#self.AvailableInstrumentTracks) + 1
			randomTrack = self.AvailableInstrumentTracks[randomSound]
			sound = randomTrack.sound
			self.lastSound = sound
			self.gameSound = self.character:getEmitter():playSound(sound);
			
			addSound(self.character,
			self.character:getX(),
			self.character:getY(),
			self.character:getZ(),
			soundRadius,
			volume)
			
		else
			self.lastSound = sound
			self.gameSound = self.character:getEmitter():playSound(sound);
			
			addSound(self.character,
			self.character:getX(),
			self.character:getY(),
			self.character:getZ(),
			soundRadius,
			volume)
			
		end
	
	else
		local isPlaying = self.gameSound and self.character:getEmitter():isPlaying(self.gameSound)

		if not isPlaying then
			if self.lastSound and self.lastSound == sound then
				randomSound = ZombRand(#self.AvailableInstrumentTracks) + 1
				randomTrack = self.AvailableInstrumentTracks[randomSound]
				sound = randomTrack.sound
				self.lastSound = sound
				self.gameSound = self.character:getEmitter():playSound(sound);
			
				addSound(self.character,
				self.character:getX(),
				self.character:getY(),
				self.character:getZ(),
				soundRadius,
				volume)
			else
				self.lastSound = sound
				self.gameSound = self.character:getEmitter():playSound(sound);
			
				addSound(self.character,
				self.character:getX(),
				self.character:getY(),
				self.character:getZ(),
				soundRadius,
				volume)
			end
		end
	end
	
	
	
	self.actionCount = self.actionCount + (getGameTime():getGameWorldSecondsSinceLastUpdate()*GTLSCheck)
	if self.actionCount > self.actionTotal then
		self.actionCount = 0
		adjustStats(self.character, self.level)
		-- update for zombies
		addSound(self.character,
				 self.character:getX(),
				 self.character:getY(),
				 self.character:getZ(),
				 soundRadius,
				 volume)
		
		if playerlevel >= tracklevel and
		playerlevel <= 5 then
		
	-- stressCheck
	if not self.character:HasTrait("Disciplined") then
		if self.character:HasTrait("Dextrous") then
			if self.character:getStats():getStress() > 0.8 then
					randomchance = ZombRand(22, 100)
			elseif self.character:getStats():getStress() > 0.5 then
					randomchance = ZombRand(14, 100)
			elseif self.character:getStats():getStress() > 0.2 then
					randomchance = ZombRand(6, 100)
			else
					randomchance = ZombRand(1, 100)
			end
		elseif self.character:HasTrait("Clumsy") then
				if self.character:getStats():getStress() > 0.8 then
				randomchance = ZombRand(48, 100)
				elseif self.character:getStats():getStress() > 0.5 then
					randomchance = ZombRand(36, 100)
				elseif self.character:getStats():getStress() > 0.2 then
					randomchance = ZombRand(24, 100)
				else
					randomchance = ZombRand(16, 100)
				end
		elseif self.character:getStats():getStress() > 0.8 then
				randomchance = ZombRand(31, 100)
		elseif self.character:getStats():getStress() > 0.5 then
				randomchance = ZombRand(21, 100)
		elseif self.character:getStats():getStress() > 0.2 then
				randomchance = ZombRand(11, 100)
		else
				randomchance = ZombRand(1, 100)
		end
	elseif self.character:HasTrait("Clumsy") then
	randomchance = ZombRand(16, 100)
	else
	randomchance = ZombRand(1, 100)
	end

			if randomchance >= 98 then
			Failstate = true
			end

		end

		if Failstate == false then
			if self.learnedSong then
				if not self.character:HasTrait("Virtuoso") then HaloTextHelper.addTextWithArrow(self.character, getText("IGUI_HaloNote_Boredom"), true, 255, 200, 200); end
				self.relearnCount = self.relearnCount + 1
				if self.relearnCount >= self.relearnTotal then
					self.relearnCount = 0
					self.learnedSong = false
				end
			else
				local randomDice = ZombRand(200)+1+self.sandboxAddChance
				local randomDiceTarget
				local trait = 0
				if self.character:HasTrait("Virtuoso") then
					trait = 1
				end
				if #self.PriorityToLearnLow > 0 then
					randomDiceTarget = (198 - (playerlevel+trait))
				elseif (#self.PriorityToLearnMid > 0) and (playerlevel > 2) then
					randomDiceTarget = (202 - (playerlevel+trait))
				elseif (#self.PriorityToLearnHigh > 0) and (playerlevel > 5) then
					randomDiceTarget = (205 - (playerlevel+trait))
				elseif (#self.PriorityToLearnMaster > 0) and (playerlevel > 8) then
					randomDiceTarget = (208 - (playerlevel+trait))
				end
				
				if randomDice and randomDiceTarget and (randomDice >= randomDiceTarget) and (playerlevel > 1) then
				
					local AvailableSong
					local randomSong
					local randomSongName
					
					
					if (#self.PriorityToLearnLow > 0) or (#self.PriorityToLearnMid > 0) or (#self.PriorityToLearnHigh > 0) or (#self.PriorityToLearnMaster > 0) then
						if #self.PriorityToLearnLow > 0 then
							AvailableSong = ZombRand(#self.PriorityToLearnLow) + 1
							randomSong = self.PriorityToLearnLow[AvailableSong]
						elseif #self.PriorityToLearnMid > 0 then
							AvailableSong = ZombRand(#self.PriorityToLearnMid) + 1
							randomSong = self.PriorityToLearnMid[AvailableSong]
						elseif #self.PriorityToLearnHigh > 0 then
							AvailableSong = ZombRand(#self.PriorityToLearnHigh) + 1
							randomSong = self.PriorityToLearnHigh[AvailableSong]
						elseif #self.PriorityToLearnMaster > 0 then
							AvailableSong = ZombRand(#self.PriorityToLearnMaster) + 1
							randomSong = self.PriorityToLearnMaster[AvailableSong]
						end
						
						randomSongName = randomSong.name
						if randomSongName then
							table.insert(self.learnedTracksData,randomSong)
							HaloTextHelper.addText(self.character, getText("IGUI_HaloNote_LearnSong"), 210, 210, 210)
							HaloTextHelper.addText(self.character, getText(randomSongName), 150, 255, 150)
							getSoundManager():playUISound("PZLevelSound")
						end
						self.learnedSong = true
					end
					
					
					--if self.learnedTracksData then
					self.AvailableToLearn = {}
					self.PriorityToLearnLow = {}
					self.PriorityToLearnMid = {}
					self.PriorityToLearnHigh = {}
					self.PriorityToLearnMaster = {}
					local newSong
					for k,v in pairs(self.instrumentSounds) do
						if v.level <= playerlevel and v.isaddon ~= 2 then
							newSong = true
							if #self.learnedTracksData > 0 then
								for i,j in pairs(self.learnedTracksData) do
									if j.isaddon ~= 2 and j.name == v.name then
										newSong = false
										break
									end
								end
							end
							if newSong then
								table.insert(self.AvailableToLearn, v)
							end
						end
					end
						
					if #self.AvailableToLearn > 0 then
						for k,v in pairs(self.AvailableToLearn) do
							if v.level <= 2 then
								table.insert(self.PriorityToLearnLow, v)
							elseif v.level <= 5 then
								table.insert(self.PriorityToLearnMid, v)
							elseif v.level <= 8 then
								table.insert(self.PriorityToLearnHigh, v)
							elseif v.level <= 10 then
								table.insert(self.PriorityToLearnMaster, v)
							end
						end
					end
						
					--	if #self.AvailableToLearn > 0 then
					--		AvailableSong = ZombRand(#self.AvailableToLearn) + 1
					--		randomSong = self.AvailableToLearn[AvailableSong]
					--		randomSongName = randomSong.name
					--		if randomSongName then
					--			table.insert(self.learnedTracksData,randomSong)
						--		HaloTextHelper.addText(self.character, getText("IGUI_HaloNote_LearnSong"), 210, 210, 210)
								--HaloTextHelper.addText(self.character, getText(randomSongName), 150, 255, 150)
							--	getSoundManager():playUISound("PZLevelSound")
						--	end
					--		self.learnedSong = true
				--		end
					
					
				--	else
						--self.learnedTracksData = {}
						--self.AvailableToLearn = {}
					
					--	for k,v in pairs(self.instrumentSounds) do
					--		if v.level <= playerlevel and v.isaddon <= 1 then--MAKE SURE TO CHANGE THIS LINE
						----		table.insert(self.AvailableToLearn, v)
						--	end
					--	end
						
						--if #self.AvailableToLearn > 0 then
						--	AvailableSong = ZombRand(#self.AvailableToLearn) + 1
						--	randomSong = self.AvailableToLearn[AvailableSong]
						--	randomSongName = randomSong.name
						--	if randomSongName then
						--		table.insert(self.learnedTracksData,randomSong)
						--		HaloTextHelper.addText(self.character, getText("IGUI_HaloNote_LearnSong"), 210, 210, 210)
						--		HaloTextHelper.addText(self.character, getText(randomSongName), 150, 255, 150)
								--self.character:getEmitter():playSound("Faucet_Common")
						--		getSoundManager():playUISound("PZLevelSound")
					--		end
					--		self.learnedSong = true
					--	end

					--end
				else
					if not self.character:HasTrait("Virtuoso") then HaloTextHelper.addTextWithArrow(self.character, getText("IGUI_HaloNote_Boredom"), true, 255, 200, 200); end
				end
			end
		end
		
	end

end

function PlayInstrumentPianoTraining:start()

	self.sandboxAddChance = getSandboxOptionMusicChance()

	self:setOverrideHandModels(nil, nil)

	local characterData = self.character:getModData()
	
	if characterData.PlayingInstrument ~= nil
	then
	characterData.PlayingInstrument = true
	else
	characterData.PlayingInstrument = true
	end
	
	getSoundManager():setMusicVolume(0)

	self.action:setUseProgressBar(true)

	local playerlevel = self.character:getPerkLevel(Perks.Music)
	self.AvailableAnims = {}

	for k,v in pairs(self.instrumentAnimations) do
		if playerlevel > 4 then
			if v.instrument == "piano" and v.level <= playerlevel and v.level >= (playerlevel - 4) then
				table.insert(self.AvailableAnims, v)
			end
		elseif v.instrument == "piano" and v.level <= playerlevel then
			table.insert(self.AvailableAnims, v)
		end
	end

	self.idxAnim = ZombRand(#self.AvailableAnims) + 1
	self.AnimToplay = self.AvailableAnims[self.idxAnim].name
	self.AnimTime = self.AvailableAnims[self.idxAnim].keyframes

	for k,v in pairs(self.instrumentSounds) do
		if v.level <= self.level and (self.level < 3 or (v.level+2 >= self.level)) and v.isaddon ~= 0 and v.isaddon ~= 1 then--MAKE SURE TO CHANGE THIS LINE
			table.insert(self.AvailableInstrumentTracks, v)
		end
	end

	if self.level > 1 and self.character:getModData().PianoLearnedTracks then
	
		if #self.character:getModData().PianoLearnedTracks > 0 then
			for k,v in pairs(self.character:getModData().PianoLearnedTracks) do
				if v.level <= self.level and (self.level < 3 or (v.level+2 >= self.level)) then
					table.insert(self.AvailableInstrumentTracks, v)
				end
			end
		end
	end

	if #self.AvailableInstrumentTracks <= 3 then
		for k,v in pairs(self.instrumentSounds) do
			if v.level <= self.level and v.isaddon ~= 0 and v.isaddon ~= 1 then--MAKE SURE TO CHANGE THIS LINE
				table.insert(self.AvailableInstrumentTracks, v)
			end
		end
		if self.level > 1 and self.character:getModData().PianoLearnedTracks then
			if #self.character:getModData().PianoLearnedTracks > 0 then
			for k,v in pairs(self.character:getModData().PianoLearnedTracks) do
				if v.level <= self.level and (self.level >= 3 and (v.level+2 < self.level)) then
					table.insert(self.AvailableInstrumentTracks, v)
				end
			end
		end
		end
	end
	
	self.learnedTracksData = self.character:getModData().PianoLearnedTracks
	
	if playerlevel >= 2 then
					
		if self.learnedTracksData then
			self.AvailableToLearn = {}
			local newSong
			for k,v in pairs(self.instrumentSounds) do
				if v.level <= playerlevel and v.isaddon ~= 2 then
					newSong = true
					if #self.learnedTracksData > 0 then
						for i,j in pairs(self.learnedTracksData) do
							if j.isaddon ~= 2 and j.name == v.name then
								newSong = false
								break
							end
						end
					end
					if newSong then
						table.insert(self.AvailableToLearn, v)
					end
				end
			end
						
			if #self.AvailableToLearn > 0 then
				for k,v in pairs(self.AvailableToLearn) do
					if v.level <= 2 then
						table.insert(self.PriorityToLearnLow, v)
					elseif v.level <= 5 then
						table.insert(self.PriorityToLearnMid, v)
					elseif v.level <= 8 then
						table.insert(self.PriorityToLearnHigh, v)
					elseif v.level <= 10 then
						table.insert(self.PriorityToLearnMaster, v)
					end
				end
			end

		else
			self.learnedTracksData = {}
			for k,v in pairs(self.instrumentSounds) do
				if v.level <= 2 and v.level <= playerlevel and v.isaddon ~= 2 then
					table.insert(self.PriorityToLearnLow, v)
				end
			end
		end
	end
	
end

function PlayInstrumentPianoTraining:stop()

	local characterData = self.character:getModData()

	if self.gameSound and self.character:getEmitter():isPlaying(self.gameSound) then
		self.character:getEmitter():stopSound(self.gameSound);
	end

	if Failstate == true then
	
	local failsound = "TrumpetFailstate01"
	local soundrandomiser = ZombRand(1, 100)
	
		if self.pianoType == "Conventional" or self.pianoType == "Grand" then
			if soundrandomiser >=75 then
				failsound = "PianoFailstate01"
			elseif soundrandomiser >=50 then
				failsound = "PianoFailstate02"
			elseif soundrandomiser >=25 then
				failsound = "PianoFailstate03"
			else
				failsound = "PianoFailstate04"
			end
	
		end

	local soundRadius = 10
	local volume = 5

		if self.character:isOutside() then
		soundRadius = 30
		volume = 10
		end

		self.character:getEmitter():playSound(failsound);
		
		addSound(self.character,
				 self.character:getX(),
				 self.character:getY(),
				 self.character:getZ(),
				 soundRadius,
				 volume)

		if characterData.LSMoodles["Embarrassed"].Value ~= nil then
			characterData.LSMoodles["Embarrassed"].Value = characterData.LSMoodles["Embarrassed"].Value + 0.1
		end
		HaloTextHelper.addTextWithArrow(self.character, getText("IGUI_HaloNote_Embarrassed"), true, 255, 120, 120)

	Failstate = false
	end

	local bodyDamage = self.character:getBodyDamage()
	-- adjust stats to 0 if levels went below 0
	if (bodyDamage:getBoredomLevel() < 0) then
		bodyDamage:setBoredomLevel(0)
	end
	if (bodyDamage:getUnhappynessLevel() < 0) then
		bodyDamage:setUnhappynessLevel(0)
	end
	if (self.character:getStats():getStress() < 0) then
		self.character:getStats():setStress(0)
	end

	-- adjust stats if levels went above
	if (bodyDamage:getBoredomLevel() > 100) then
		bodyDamage:setBoredomLevel(100)
	end
	if (bodyDamage:getUnhappynessLevel() > 100) then
		bodyDamage:setUnhappynessLevel(100)
	end
	if (self.character:getStats():getStress() > 1) then
		self.character:getStats():setStress(1)
	end

	characterData.PlayingInstrument = false

	getSoundManager():setMusicVolume(self.musicOriginalVolume)

	ISBaseTimedAction.stop(self);
end

function PlayInstrumentPianoTraining:perform()

	if self.gameSound and self.character:getEmitter():isPlaying(self.gameSound) then
		self.character:getEmitter():stopSound(self.gameSound);
	end

	adjustStats(self.character, self.level)

	local bodyDamage = self.character:getBodyDamage()
	-- adjust stats to 0 if levels went below 0
	if (bodyDamage:getBoredomLevel() < 0) then
		bodyDamage:setBoredomLevel(0)
	end
	if (bodyDamage:getUnhappynessLevel() < 0) then
		bodyDamage:setUnhappynessLevel(0)
	end
	if (self.character:getStats():getStress() < 0) then
		self.character:getStats():setStress(0)
	end

	-- adjust stats if levels went above
	if (bodyDamage:getBoredomLevel() > 100) then
		bodyDamage:setBoredomLevel(100)
	end
	if (bodyDamage:getUnhappynessLevel() > 100) then
		bodyDamage:setUnhappynessLevel(100)
	end
	if (self.character:getStats():getStress() > 1) then
		self.character:getStats():setStress(1)
	end

	local characterData = self.character:getModData()
	characterData.PlayingInstrument = false

	getSoundManager():setMusicVolume(self.musicOriginalVolume)

    ISBaseTimedAction.perform(self);
end

function PlayInstrumentPianoTraining:new(character, Piano, Type, level)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
	o.piano = Piano;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.stopOnAim = true;
	o.ignoreHandsWounds = true;
	o.maxTime = 9000
	o.pianoType = Type
	o.AvailableAnims = 0
	o.instrumentAnimations = require("Instruments/InstrumentAnimations")
	o.instrumentSounds = require("Instruments/Tracks/PlayPianoTracks")
	o.idxAnim = 0
	o.AnimToplay = 0
	o.AnimTime = 0
	o.gameSound = false
	o.level = level
	o.musicOriginalVolume = tonumber(getSoundManager():getMusicVolume())
	o.actionCount = 0
	o.actionTotal = 60--300
	o.AvailableInstrumentTracks = {}
	o.AvailableToLearn = {}
	o.lastSound = false
	o.learnedSong = true
	o.learnedTracksData = false
	o.PriorityToLearnLow = {}
	o.PriorityToLearnMid = {}
	o.PriorityToLearnHigh = {}
	o.PriorityToLearnMaster = {}
	o.songDifficulty = false
	o.noKnownSongs = false
	o.relearnCount = 0
	o.relearnTotal = 5
	o.sandboxAddChance = 0
    return o;
end

return PlayInstrumentPianoTraining;
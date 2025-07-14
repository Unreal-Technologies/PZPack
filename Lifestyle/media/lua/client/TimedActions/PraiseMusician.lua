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

PraiseMusician = ISBaseTimedAction:derive("PraiseMusician")

function PraiseMusician:isValid()
	return true
end

function PraiseMusician:update()

end

function PraiseMusician:start()

	-- we get the moddata and voice tracks
	local characterData = self.character:getModData()
	local PlayerVoice = characterData.PlayerVoice

	local PlayerVoiceTracks = require("TimedActions/PlayerVoiceTracks")
	local AvailablePlayerVoiceTracks = {}
	
	-- we loop the voice tracks and select the ones that we want, making sure to only select the ones that match the player voice
	for k,v in pairs(PlayerVoiceTracks) do
		if v.Voice == PlayerVoice and
		v.Type == "Woohoo" then--MAKE SURE TO CHANGE THIS LINE
			table.insert(AvailablePlayerVoiceTracks, v)
		end
	end

				
	-- then we add a random factor to it
	local randomLine = ZombRand(#AvailablePlayerVoiceTracks) + 1
	local randomTrack = AvailablePlayerVoiceTracks[randomLine]
	local sound = randomTrack.sound
	
	if self.character:getDescriptor():isFemale() then
		
	sound = randomTrack.soundF
		
	end


	self:setActionAnim("Bob_Applauding")
	
	local isPlaying = self.gameSound
		and self.gameSound ~= 0
		and self.character:getEmitter():isPlaying(self.gameSound)

	if not isPlaying then
		-- Some examples of radius and volume found in PZ code:
		-- Fishing (20,1)
		-- Remove Grass (10,5)
		-- Remove Glass (20,1)
		-- Destroy Stuff (20,10)
		-- Remove Bush (20,10)
		-- Move Sprite (10,5)
		local soundRadius = 8
		local volume = 5
		
		if self.character:isOutside() then
		soundRadius = 12
		volume = 5
		end

		self.gameSound = self.character:getEmitter():playSound(sound);
		
		addSound(self.character,
				 self.character:getX(),
				 self.character:getY(),
				 self.character:getZ(),
				 soundRadius,
				 volume)
		
	end
	
end

function PraiseMusician:stop()

	if self.gameSound and
		self.gameSound ~= 0 and
		self.character:getEmitter():isPlaying(self.gameSound) then
		self.character:getEmitter():stopSound(self.gameSound);
	end

    ISBaseTimedAction.stop(self);
end

function PraiseMusician:perform()
	ISBaseTimedAction.perform(self);
end

function PraiseMusician:new(character)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
	o.stopOnAim = false
	o.stopOnWalk = false
	o.stopOnRun = true
	o.gameSound = 0
	o.maxTime = 300
	o.ignoreHandsWounds = true
	o.useProgressBar = false
	return o;
end

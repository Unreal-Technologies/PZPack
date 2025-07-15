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

local function getPlayerCooldowns(moodle)

	if moodle then
	return {
		"TaughtSkill",
		"WasTaughtMeditation",
		"AdviceWasted",
		"Attractive",
		"Nauseous",
		"SmellGood",
	}
	else
	return {
		"TeachCooldown",
		"LessonCooldown",
		"InteractionSpam",
		"mirrorPT",
		"mirrorCD",
	}
	end

end

local function doPlayerCooldowns(playerData)

	--print("doPlayerCooldowns called")

	local cooldownList = getPlayerCooldowns(false)

	for n=1,#cooldownList do
		local value = cooldownList[n]
		--print("doPlayerCooldowns checking cooldown for " .. value)
		if not playerData.LSCooldowns then playerData.LSCooldowns = {}; end
		if not playerData.LSCooldowns[value] then
			playerData.LSCooldowns[value] = 0
		end
		if playerData.LSCooldowns[value] and (playerData.LSCooldowns[value] > 0) then
			playerData.LSCooldowns[value] = playerData.LSCooldowns[value] - 1
			--print("doPlayerCooldowns reducing cooldown by 1 for " .. value)
		end
		if playerData.LSCooldowns[value] and (playerData.LSCooldowns[value] < 0) then
			playerData.LSCooldowns[value] = 0
		end
	end

	local cooldownMoodleList = getPlayerCooldowns(true)
	for n=1,#cooldownMoodleList do
		local value = cooldownMoodleList[n]
		if playerData.LSMoodles[value] and (playerData.LSMoodles[value].Value > 0) then
			playerData.LSMoodles[value].Value = playerData.LSMoodles[value].Value - 0.2
		end
		if playerData.LSMoodles[value] and (playerData.LSMoodles[value].Value < 0.2) then
			playerData.LSMoodles[value].Value = 0
		end
	end


end

local function doPlayerCooldownsSimple(playerData)
	playerData.TDcomplained = false
	playerData.CurrentBedQuality = false
end

function LSEveryHour()

	local thisPlayer = getPlayer()

	if thisPlayer ~= nil then
		local playerData = thisPlayer:getModData()
		local bodyDamage = thisPlayer:getBodyDamage()
		local stats = thisPlayer:getStats()
		--local currentBoredom = bodyDamage:getBoredomLevel()
		--local currentUnhappiness = bodyDamage:getUnhappynessLevel()
		--local currentStress = stats:getStress();

		--print("trying to call doPlayerCooldowns")
		doPlayerCooldowns(playerData)
		doPlayerCooldownsSimple(playerData)

	if playerData.LSMoodles["MintFresh"] and playerData.LSMoodles["MintFresh"].Value and playerData.LSMoodles["MintFresh"].Value > 0 then
		if playerData.lastBrushTeeth and (playerData.lastBrushTeeth + 3) <= thisPlayer:getHoursSurvived() then
			playerData.LSMoodles["MintFresh"].Value = 0
		end
	end
	if playerData.LSMoodles["BathHot"] and playerData.LSMoodles["BathHot"].Value and playerData.LSMoodles["BathHot"].Value > 0 then
		if playerData.lastBath and (playerData.lastBath + 1) <= thisPlayer:getHoursSurvived() then
			playerData.LSMoodles["BathHot"].Value = 0
		end
	end
	if playerData.LSMoodles["BathCold"] and playerData.LSMoodles["BathCold"].Value and playerData.LSMoodles["BathCold"].Value > 0 then
		if playerData.lastBath and (playerData.lastBath + 1) <= thisPlayer:getHoursSurvived() then
			playerData.LSMoodles["BathCold"].Value = 0
		end
	end

		if playerData.FitnessActivityMuscles ~= nil and playerData.DidFitnessActivity ~= nil then
		
		else
			playerData.FitnessActivityMuscles = 0
			playerData.DidFitnessActivity = 0
		end
		
		if playerData.DidFitnessActivity ~= nil and playerData.DidFitnessActivity ~= 0 and thisPlayer:getPerkLevel(Perks.Fitness) <= 8 then
			playerData.DidFitnessActivity = playerData.DidFitnessActivity + 1
		end

		if playerData.DidFitnessActivity ~= nil and playerData.DidFitnessActivity >= 36 then
			playerData.DidFitnessActivity = 0
			playerData.FitnessActivityMuscles = 0
		end
		--print("didfitnessactivity is ".. playerData.DidFitnessActivity)
		--print("fitnessactivitymuscles is ".. playerData.FitnessActivityMuscles)
		if playerData.DidFitnessActivity ~= nil and playerData.DidFitnessActivity == 12 then
			local LowerLegL = bodyDamage:getBodyPart(BodyPartType.LowerLeg_L):getStiffness()
			local UpperLegL = bodyDamage:getBodyPart(BodyPartType.UpperLeg_L):getStiffness()
			local LowerLegR = bodyDamage:getBodyPart(BodyPartType.LowerLeg_R):getStiffness()
			local UpperLegR = bodyDamage:getBodyPart(BodyPartType.UpperLeg_R):getStiffness()
			local TorsoLower = bodyDamage:getBodyPart(BodyPartType.Torso_Lower):getStiffness()
			--print("stiffness was ".. bodyDamage:getBodyPart(BodyPartType.LowerLeg_L):getStiffness())
			if playerData.FitnessActivityMuscles >= 200 then--severe
				bodyDamage:getBodyPart(BodyPartType.LowerLeg_L):setStiffness(LowerLegL + 90)
				bodyDamage:getBodyPart(BodyPartType.UpperLeg_L):setStiffness(UpperLegL + 90)
				bodyDamage:getBodyPart(BodyPartType.LowerLeg_R):setStiffness(LowerLegR + 90)
				bodyDamage:getBodyPart(BodyPartType.UpperLeg_R):setStiffness(UpperLegR + 90)
				bodyDamage:getBodyPart(BodyPartType.Torso_Lower):setStiffness(TorsoLower + 90)
			elseif playerData.FitnessActivityMuscles >= 150 then--mild
				bodyDamage:getBodyPart(BodyPartType.LowerLeg_L):setStiffness(LowerLegL + 60)
				bodyDamage:getBodyPart(BodyPartType.UpperLeg_L):setStiffness(UpperLegL + 60)
				bodyDamage:getBodyPart(BodyPartType.LowerLeg_R):setStiffness(LowerLegR + 60)
				bodyDamage:getBodyPart(BodyPartType.UpperLeg_R):setStiffness(UpperLegR + 60)
				bodyDamage:getBodyPart(BodyPartType.Torso_Lower):setStiffness(TorsoLower + 60)
			elseif playerData.FitnessActivityMuscles >= 50 then--low
				bodyDamage:getBodyPart(BodyPartType.LowerLeg_L):setStiffness(LowerLegL + 30)
				bodyDamage:getBodyPart(BodyPartType.UpperLeg_L):setStiffness(UpperLegL + 30)
				bodyDamage:getBodyPart(BodyPartType.LowerLeg_R):setStiffness(LowerLegR + 30)
				bodyDamage:getBodyPart(BodyPartType.UpperLeg_R):setStiffness(UpperLegR + 30)
				bodyDamage:getBodyPart(BodyPartType.Torso_Lower):setStiffness(TorsoLower + 30)
			else
				playerData.DidFitnessActivity = 0
				playerData.FitnessActivityMuscles = 0
			end
			--print("stiffness is ".. bodyDamage:getBodyPart(BodyPartType.LowerLeg_L):getStiffness())
			if bodyDamage:getBodyPart(BodyPartType.LowerLeg_L):getStiffness() > 100 then
				bodyDamage:getBodyPart(BodyPartType.LowerLeg_L):setStiffness(100)
			end
			if bodyDamage:getBodyPart(BodyPartType.UpperLeg_L):getStiffness() > 100 then
				bodyDamage:getBodyPart(BodyPartType.UpperLeg_L):setStiffness(100)
			end
			if bodyDamage:getBodyPart(BodyPartType.LowerLeg_R):getStiffness() > 100 then
				bodyDamage:getBodyPart(BodyPartType.LowerLeg_R):setStiffness(100)
			end
			if bodyDamage:getBodyPart(BodyPartType.UpperLeg_R):getStiffness() > 100 then
				bodyDamage:getBodyPart(BodyPartType.UpperLeg_R):setStiffness(100)
			end
			if bodyDamage:getBodyPart(BodyPartType.Torso_Lower):getStiffness() > 100 then
				bodyDamage:getBodyPart(BodyPartType.Torso_Lower):setStiffness(100)
			end
		end
		

	end
end

Events.EveryHours.Add(LSEveryHour);

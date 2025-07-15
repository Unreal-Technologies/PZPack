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
		"BLANK",
		"BLANK",
	}
	else
	return {
		"TeachCooldown",
		"LessonCooldown",
		"InteractionSpam",
		"StinkingCooldown",
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


end

local function doPlayerCooldownsSimple(playerData)

	playerData.GaveApplause = false

end

local function LSETMgetOtherPlayers(character, range, command)

	for playerIndex = 0, getNumActivePlayers()-1 do
		local playersList = {};--get players
		local playerObj = getSpecificPlayer(playerIndex)
		local playerIso

		if (playerObj ~= nil) then
			for x = playerObj:getX()-range,playerObj:getX()+range do
				for y = playerObj:getY()-range,playerObj:getY()+range do
					local square = getCell():getGridSquare(x,y,playerObj:getZ());
					if square then
						for i = 0,square:getMovingObjects():size()-1 do
							local moving = square:getMovingObjects():get(i);
							if instanceof(moving, "IsoPlayer") then
								table.insert(playersList, moving);
							end
						end
					end
				end
			end

			if #playersList > 0 then
				for i,v in ipairs(playersList) do
					if v:getUsername() == playerObj:getUsername() then
						playerIso = v
						break
					end
				end
				for i,v in ipairs(playersList) do
					if playerIso and
					v:getUsername() ~= playerObj:getUsername() and
					v:isOutside() == playerObj:isOutside() then
					--if playerIso:checkCanSeeClient(v) then
						if command and playerObj:CanSee(v) and playerIso:checkCanSeeClient(v) and not v:isInvisible() then		
							sendClientCommand(character, "LS", command, {v:getOnlineID()})
						end
					end
				end	
			end
		end
	end

end

local function HNmakeOthersNauseous(thisPlayer, HygieneBadValue)
	if not HygieneBadValue then return; end
	if HygieneBadValue > 0.6 then LSETMgetOtherPlayers(thisPlayer, 8, "makeNauseous"); else LSETMgetOtherPlayers(thisPlayer, 4, "makeNauseous"); end

end

local function checkCanDoAnim(thisPlayer, cooldown)
	if cooldown and (cooldown > 0) then return false; end
	if (thisPlayer:hasTimedActions() or thisPlayer:isSitOnGround() or thisPlayer:isSneaking() or thisPlayer:isAiming()) then
		return false
	end
	local dice6 = ZombRand(6)+1
	if dice6 == 6 then return true; end
	return false
end

local function doPlayerReactions(thisPlayer, playerData)

	--------------Hygiene
	if SandboxVars.Text.DividerHygiene then
		if playerData.LSMoodles["HygieneBad"] and (playerData.LSMoodles["HygieneBad"].Value >= 0.6) then
			if isClient() then HNmakeOthersNauseous(thisPlayer, playerData.LSMoodles["HygieneBad"].Value); end
			if playerData.LSCooldowns and checkCanDoAnim(thisPlayer, playerData.LSCooldowns["StinkingCooldown"]) then playerData.LSCooldowns["StinkingCooldown"] = 72; ISTimedActionQueue.add(LSReactionStinking:new(thisPlayer)); end
		end
	end
	--------------

end

local function LSEveryTenMinutes()
	local thisPlayer = getPlayer()
	local playerData = thisPlayer:getModData()
	if thisPlayer and playerData and playerData.LSMoodles and not thisPlayer:isDead() then
		doPlayerCooldowns(playerData)
		doPlayerCooldownsSimple(playerData)
		if not thisPlayer:isAsleep() then
			doPlayerReactions(thisPlayer, playerData)
		end
	end
end

Events.EveryTenMinutes.Add(LSEveryTenMinutes);

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

-- Synchronization and MP related stuff

local Commands = {}

local function checkCanDoAnim(thisPlayer, cooldown)
	if cooldown and (cooldown > 0) then return false; end
	if (thisPlayer:hasTimedActions() or thisPlayer:isSitOnGround() or thisPlayer:isSneaking() or thisPlayer:isAiming()) then
		return false
	end
	local dice3 = ZombRand(3)+1
	if dice3 == 3 then return true; end
	return false
end

Commands["WasAskedToInteract"] = function(arg)

    local Target_id = arg[1]
    local Target = getPlayerByOnlineID(arg[1])
    local Source = arg[2]
  --local SourceX = arg[3]
  --local SourceY = arg[4]
	local Interaction = arg[3]
	local IsClose = arg[4]
	local actionArg = arg[5]
	--print("WasAskedToInteract received, calling function WasAskedToInteract")
    WasAskedToInteract(Target, Source, Interaction, IsClose, actionArg)
end

Commands["ChangeInteractionState"] = function(arg)

    local Target_id = arg[1]
    local Target = getPlayerByOnlineID(arg[1])
    local InteractionState = arg[2]
	--print("ChangeInteractionState received, changing player moddata to " .. InteractionState)
	if not Target:getModData().LSInteractionState then
		Target:getModData().LSInteractionState = "none"
	end
	
	if InteractionState == "sourceStoppedWaiting" and Target:getModData().LSInteractionState == "none" then
		Target:getModData().LSInteractionState = InteractionState
	elseif InteractionState ~= "sourceStoppedWaiting" then
		Target:getModData().LSInteractionState = InteractionState
	end
end

Commands["makeNauseous"] = function(arg)
    local Target = getPlayerByOnlineID(arg[1])
	local characterData = Target:getModData()
	if characterData.LSMoodles["Nauseous"] and characterData.LSMoodles["Nauseous"].Value then
		if characterData.LSMoodles["Nauseous"].Value < 0.4 then
			if (characterData.LSMoodles["Nauseous"].Value == 0) and checkCanDoAnim(Target, false) then ISTimedActionQueue.add(LSReactionBadSmell:new(Target)); end
			characterData.LSMoodles["Nauseous"].Value = 0.4
			HaloTextHelper.addTextWithArrow(Target, getText("IGUI_HaloNote_Nauseous"), true, 255, 120, 120)
		end
	end
end

Commands["GetEmbarrassed"] = function(arg)

    local Target_id = arg[1]
    local Target = getPlayerByOnlineID(arg[1])

	local characterData = Target:getModData()
	if characterData.LSMoodles["Embarrassed"] and characterData.LSMoodles["Embarrassed"].Value and (characterData.LSMoodles["Embarrassed"].Value < 0.4) then
		characterData.LSMoodles["Embarrassed"].Value = characterData.LSMoodles["Embarrassed"].Value + 0.25
	end
	HaloTextHelper.addTextWithArrow(Target, getText("IGUI_HaloNote_Embarrassed"), true, 255, 120, 120)

end

Commands["TeleportSittingLocation"] = function(arg)

    local SourcePlayerName = arg[1]
	local teleportX = arg[2]
    local teleportY = arg[3]
	local NSvar = arg[4]
    local thisPlayer = getPlayer()
	--local otherPlayers = {}
--	local sourcePlayer

--	if teleportX and teleportY and SourcePlayerName and thisPlayer then

--		if thisPlayer:getDisplayName() == SourcePlayerName then return; end

--		for x = thisPlayer:getX()-30,thisPlayer:getX()+30 do
--			if sourcePlayer then break; end
--			for y = thisPlayer:getY()-30,thisPlayer:getY()+30 do
--				if sourcePlayer then break; end
--				local square = getCell():getGridSquare(x,y,thisPlayer:getZ());
--				if square then
--					for i = 0,square:getMovingObjects():size()-1 do
--						local moving = square:getMovingObjects():get(i);
--						if instanceof(moving, "IsoPlayer") then
--							if moving:getDisplayName() == SourcePlayerName then
--								sourcePlayer = moving
--								break
--							end
--							--table.insert(otherPlayers, moving);
--						end
--					end
--				end
--			end
--		end

--		if sourcePlayer then
--			--thisPlayer:Say("teleporting " .. tostring(sourcePlayer:getDisplayName()))
--			sourcePlayer:setY(teleportY)
--			sourcePlayer:setX(teleportX)
--			sourcePlayer:setLy(teleportY)
--			sourcePlayer:setLx(teleportX)
--			if not string.match(tostring(sourcePlayer:getCurrentState()), "PlayerSitOnGroundState") then
--				sourcePlayer:setVariable("SittingToggleStart", "N")
--				sourcePlayer:reportEvent("EventSitOnGround");
--				sourcePlayer:setVariable("SittingToggleLoop", "N")
--			end
--		end
--	end

    local otherPlayers = getOnlinePlayers()
    
	if otherPlayers then
	
    for index = 1, otherPlayers:size() do
		local sourcePlayer = otherPlayers:get(index-1)

        if sourcePlayer and sourcePlayer ~= thisPlayer and sourcePlayer:getDisplayName() == SourcePlayerName then
			--thisPlayer:Say("teleporting " .. tostring(sourcePlayer:getDisplayName()))
            if teleportX and teleportY then
				sourcePlayer:setY(teleportY)
				sourcePlayer:setX(teleportX)
				sourcePlayer:setLy(teleportY)
				sourcePlayer:setLx(teleportX)
				
				if not string.match(tostring(sourcePlayer:getCurrentState()), "PlayerSitOnGroundState") then
					sourcePlayer:setVariable("SittingToggleStart", NSvar)
					sourcePlayer:reportEvent("EventSitOnGround");
					sourcePlayer:setVariable("SittingToggleLoop", NSvar)
				end
				
            end

            break

        end

    end

	end

end


Commands["ChangeAnimVarMulti"] = function(arg)

    local SourcePlayerName = arg[1]
	local AnimType = arg[2]
    local AnimVar = arg[3]
    local AnimType2 = arg[4]
	local AnimVar2 = arg[5]
    local thisPlayer = getPlayer()
    --local otherPlayers = getOnlinePlayers()
 	--local otherPlayers = {}

    local otherPlayers = getOnlinePlayers()
 
    --for index = 0, getOnlinePlayers():size() - 1 do

        --local sourcePlayer = getOnlinePlayers():get(index)
	if otherPlayers then
	
    for index = 1, otherPlayers:size() do
		local sourcePlayer = otherPlayers:get(index-1)

       -- if sourcePlayer:getDisplayName() == SourcePlayerName and sourcePlayer:getDisplayName() ~= thisPlayer:getDisplayName() then
        if sourcePlayer and sourcePlayer ~= thisPlayer and sourcePlayer:getDisplayName() == SourcePlayerName then
			--thisPlayer:Say("source is " .. tostring(sourcePlayer:getDisplayName()))
			
            if AnimVar then
                sourcePlayer:setVariable(AnimType, AnimVar)
				if AnimType == "SittingToggleStart" and ((AnimVar == "N") or (AnimVar == "S")) then
					--thisPlayer:Say("reporting eventsitOnGround")
					sourcePlayer:reportEvent("EventSitOnGround")
				end
            else
                sourcePlayer:clearVariable(AnimType)
            end

            if AnimVar2 then
                sourcePlayer:setVariable(AnimType2, AnimVar2)
				if AnimType2 == "SittingToggleStart" and ((AnimVar2 == "N") or (AnimVar2 == "S")) then
					--thisPlayer:Say("reporting eventsitOnGround")
					sourcePlayer:reportEvent("EventSitOnGround")
				end
            else
                sourcePlayer:clearVariable(AnimType2)
            end

            break

        end

    end

	end

end

Commands["ChangeAnimVar"] = function(arg)

    local SourcePlayerName = arg[1]
	local AnimType = arg[2]
    local AnimVar = arg[3]
    local thisPlayer = getPlayer()
   --local otherPlayers = getOnlinePlayers()
    local otherPlayers = getOnlinePlayers()
    
	if otherPlayers then
	
    for index = 1, otherPlayers:size() do
		local sourcePlayer = otherPlayers:get(index-1)

        if sourcePlayer and sourcePlayer ~= thisPlayer and sourcePlayer:getDisplayName() == SourcePlayerName then
			--thisPlayer:Say("source is " .. tostring(sourcePlayer:getDisplayName()))
            if AnimVar then
                sourcePlayer:setVariable(AnimType, AnimVar)
				if AnimType == "SittingToggleStart" and ((AnimVar == "N") or (AnimVar == "S")) then
					--thisPlayer:Say("reporting eventsitOnGround")
					sourcePlayer:reportEvent("EventSitOnGround")
				end
            else
                sourcePlayer:clearVariable(AnimType)
            end

            break

        end

    end

	end

end

Commands["IsListeningToMusic"] = function(arg)

    local listener_id = arg[1]
    local listener = getPlayerByOnlineID(arg[1])
    local SourceMusiclvl = arg[2]
	--print("client received command from server and is trying to invoke function")
    PlayerIsListeningToMusic(listener, SourceMusiclvl)
end

Commands["IsListeningToDJ"] = function(arg)

    local DJlistener_id = arg[1]
    local DJlistener = getPlayerByOnlineID(arg[1])
    local SourceMusiclvl = arg[2]
	local SourceDJ = arg[3]
	local SourceIsDJ = arg[4]
	--print("client received command from server and is trying to invoke function")
    PlayerIsListeningToDJ(DJlistener, SourceMusiclvl, SourceDJ, SourceIsDJ)
end

Commands["WasAskedIfIsDancing"] = function(arg)

    local DanceTarget_id = arg[1]
    local DanceTarget = getPlayerByOnlineID(arg[1])
    local DanceProposer = arg[2]
	--print("client received command from server and is trying to invoke function")
    PlayerIsAskedIfIsDancing(DanceTarget, DanceProposer)
end

Commands["OtherPlayerIsDancingResponse"] = function(arg)

    local DanceProposer_id = arg[1]
    local DanceProposer = getPlayerByOnlineID(arg[1])
    local IsDancing = arg[2]
	--print("client received command from server and is trying to invoke function")
    PlayerOtherPlayerIsDancingResponse(DanceProposer, IsDancing)
end

Commands["WasAskedToDance"] = function(arg)

    local DanceTarget_id = arg[1]
    local DanceTarget = getPlayerByOnlineID(arg[1])
    local DanceProposer = arg[2]
	--print("client received command from server and is trying to invoke function")
    PlayerIsAskedToDance(DanceTarget, DanceProposer)
end

Commands["DanceWasAccepted"] = function(arg)

    local DanceProposer_id = arg[1]
    local DanceProposer = getPlayerByOnlineID(arg[1])
    local DancePartner = arg[2]
	local PartnerX = arg[3]
	local PartnerY = arg[4]
	--print("client received command from server and is trying to invoke function")
    PlayerDanceWasAccepted(DanceProposer, DancePartner, PartnerX, PartnerY)
end

Commands["PartnerStoppedDancing"] = function(arg)

    local DanceTarget_id = arg[1]
    local DanceTarget = getPlayerByOnlineID(arg[1])
	--print("client received command from server and is trying to invoke function")
    PartnerStopDance(DanceTarget)
end

Commands["FaceDancingProposer"] = function(arg)

    local DancePartner_id = arg[1]
    local DancePartner = getPlayerByOnlineID(arg[1])
    local ProposerX = arg[2]
	local ProposerY = arg[3]
	--print("client received command from server and is trying to invoke function")
    PartnerFaceProposer(DancePartner, ProposerX, ProposerY)
end

Commands["IsStartingDuet"] = function(arg)

    local currentPerformer_id = arg[1]
    local currentPerformer = getPlayerByOnlineID(arg[1])
    local SourceWaitingDuet = arg[2]
	--print("client received command from server and is trying to invoke function")
    OtherPlayerIsStartingDuet(currentPerformer, SourceWaitingDuet)
end

Commands["ChangeDiscoStyle"] = function(arg)

    local style = arg[1]
    local x = arg[2]
    local y = arg[3]
	local z = arg[4]
	if x == nil then return end
	--print("client received command from server and is trying to invoke function")
    OnDiscoBallStyleChange(style, x, y, z)
end

Commands["TurnDiscoBallOff"] = function(arg)

    local playerDiscoCommand = arg[1]
    local x = arg[2]
    local y = arg[3]
	local z = arg[4]
	if x == nil then return end
	--print("client received command from server and is trying to invoke function")
    OnDiscoBallTurnOff(playerDiscoCommand, x, y, z)
end

Commands["JukeboxStart"] = function(arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	if x == nil then return end
	--print("client received command from server and is trying to invoke function")
    OnJukeboxStart(x, y, z)

end

Commands["TurnJukeboxOff"] = function(arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	if x == nil then return end
	--print("client received command from server and is trying to invoke function")
    OnJukeboxTurnOff(x, y, z)

end

Commands["JukeboxStyleChangeCustom"] = function(arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	local style = arg[4]
	local length = arg[5]
	local genre = arg[6]
	local customPlaylist = arg[7]
	if x == nil then return end
	--print("client received command from server and is trying to invoke function")
    OnJukeboxStyleChange(x, y, z, style, length, genre, customPlaylist)

end

Commands["JukeboxStyleChange"] = function(arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	local style = arg[4]
	local length = arg[5]
	local genre = arg[6]
	if x == nil then return end
	--print("client received command from server and is trying to invoke function")
    OnJukeboxStyleChange(x, y, z, style, length, genre)

end

Commands["StopJukeSong"] = function(arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	if x == nil then return end
	--print("client received command from server and is trying to invoke function")
    OnJukeSongStop(x, y, z)

end

Commands["isPlayingJuke"] = function(arg)

    local genre = arg[1]
	local x = arg[2]
	local y = arg[3]
	local z = arg[4]
	local JukeReusableID = arg[5]
	local playercommand = arg[6]
	if x == nil then return end
	--print("client received command from server and is trying to invoke function")
    isJukeSendSong(JukeReusableID, genre, x, y, z, playercommand)
end

-- Base stuff
local function OnLSServerCommand(module, command, args)
    if module == 'LS' then
        if Commands[command] then
            args = args or {}
            Commands[command](args)

        end
    end
end

Events.OnServerCommand.Add(OnLSServerCommand)

function LS_OnReceiveGlobalModData(key, modData)
    if modData then
        ModData.remove(key)
        ModData.add(key, modData)
    end
end


Events.OnReceiveGlobalModData.Add(LS_OnReceiveGlobalModData)

function LS_OnConnected()
    ModData.request("LSDATA")
end


Events.OnConnected.Add(LS_OnConnected)

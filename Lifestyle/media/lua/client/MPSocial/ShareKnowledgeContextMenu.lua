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

----------- start action, if far (>1) from other player then action starts by calling the other player; the other player then moves closer and starts the joint action; if any player runs then action will end; action should not allow movement or aiming

LSSKContextMenu = {};

local function getMasterLevel(thisPlayer)

	if thisPlayer:getPerkLevel(Perks.Meditation) == 10 then
		return true
	end

	return false
end

local function IsOtherPlayerClose(thisPlayer, otherPlayer)

	if otherPlayer:getX() >= thisPlayer:getX() - 1 and otherPlayer:getX() < thisPlayer:getX() + 1 and
	otherPlayer:getY() >= thisPlayer:getY() - 1 and otherPlayer:getY() < thisPlayer:getY() + 1 then	
		return true
	end
	return false
end

local function getSatisfyConditions(thisPlayer, otherPlayer)

	if (otherPlayer:hasTimedActions() or otherPlayer:isSitOnGround() or thisPlayer:hasTimedActions() or thisPlayer:isSitOnGround() or (otherPlayer:getZ() ~= thisPlayer:getZ())) then	
		--print("SKCM getSatisfyConditions is FALSE")
		return false
	end

	if not thisPlayer:getModData().LSCooldowns then thisPlayer:getModData().LSCooldowns = {}; end	
	if not thisPlayer:getModData().LSCooldowns["InteractionSpam"] then thisPlayer:getModData().LSCooldowns["InteractionSpam"] = 0; end
	if thisPlayer:getModData().LSCooldowns["InteractionSpam"] == 0 then
		thisPlayer:getModData().LSCooldowns["InteractionSpam"] = thisPlayer:getModData().LSCooldowns["InteractionSpam"] + 1
	else
		thisPlayer:getModData().LSCooldowns["InteractionSpam"] = thisPlayer:getModData().LSCooldowns["InteractionSpam"] + thisPlayer:getModData().LSCooldowns["InteractionSpam"]
	end

	return true
end

local function isTeachCooldown(thisPlayer)

	if thisPlayer:getModData().LSMoodles["TaughtSkill"] and (thisPlayer:getModData().LSMoodles["TaughtSkill"].Value > 0) then
		return true
	end
	if thisPlayer:getModData().LSMoodles["AdviceWasted"] and (thisPlayer:getModData().LSMoodles["AdviceWasted"].Value > 0) then
		return true
	end
	return false
end

LSSKContextMenu.doBuildMenu = function(player, context, worldobjects, otherPlayer, InteractBuildOption, DebugBuildOption)

	if not otherPlayer then return; end
	local thisPlayer = getSpecificPlayer(player)	

	if thisPlayer:HasTrait("Deaf") then return; end

	if thisPlayer:isSitOnGround() then return; end
	if not getMasterLevel(thisPlayer) then return; end

	local SKMenu = InteractBuildOption:addOptionOnTop(getText("ContextMenu_LSMP_ShareKnowledge"));
	local subMenuSK = InteractBuildOption:getNew(InteractBuildOption);
	context:addSubMenu(SKMenu, subMenuSK)
	SKMenu.iconTexture = getTexture('media/ui/shareknowledge_icon.png')

	local tooltip = ISToolTip:new();
	tooltip:initialise();
	tooltip:setVisible(false);

	if isTeachCooldown(thisPlayer) then
		SKMenu.notAvailable = true;
		description = " <RED>" .. getText("Tooltip_LSMP_SKGTooRecent");
		tooltip.description = description
		SKMenu.toolTip = tooltip
		SKMenu.iconTexture = getTexture('media/ui/shareknowledgeNo_icon.png')
		return
	end

	if SandboxVars.Text.DividerMeditationNew and (thisPlayer:getPerkLevel(Perks.Meditation) == 10) then
	
		local SKMeditationOption = subMenuSK:addOption(getText("IGUI_perks_Meditation"), worldobjects, LSSKContextMenu.onSKAction, player, otherPlayer, "SKmeditation");

		if otherPlayer:getPerkLevel(Perks.Meditation) == 10 then
			SKMeditationOption.notAvailable = true;
			description = " <RED>" .. getText("Tooltip_LSMP_SKIsMaster");
			tooltip.description = description
			SKMeditationOption.toolTip = tooltip
			SKMeditationOption.iconTexture = getTexture('media/ui/SKmeditationNo_icon.png')
		else
			SKMeditationOption.iconTexture = getTexture('media/ui/SKmeditation_icon.png')
		end
		
	end

end

LSSKContextMenu.onSKAction = function(worldobjects, player, otherPlayer, skill)

	local thisPlayer = getSpecificPlayer(player)
	
	if not getSatisfyConditions(thisPlayer, otherPlayer) then return; end

    thisPlayer:setX(thisPlayer:getX())
    thisPlayer:setY(thisPlayer:getY())
	thisPlayer:setLx(thisPlayer:getX())
    thisPlayer:setLy(thisPlayer:getY())

	local startImmediately
	if IsOtherPlayerClose(thisPlayer, otherPlayer) then
		--print("SKCM startImmediately is TRUE")
		startImmediately = true
	end

	--if not thisPlayer:getModData().InteractionState then
	thisPlayer:getModData().LSInteractionState = "none"
	--end

	LSSKAction = require("TimedActions/LSSKAction")

	ISTimedActionQueue.clear(thisPlayer)
	thisPlayer:setPrimaryHandItem(nil)
	thisPlayer:setSecondaryHandItem(nil)
	if startImmediately then
		--print("SKCM starting LSSKAction")
		ISTimedActionQueue.add(LSSKAction:new(thisPlayer, otherPlayer, {"SKmeditation",true}));
	else
		--print("SKCM starting LSWaitForInteraction")
		LSWaitForInteraction = require("TimedActions/LSWaitForInteraction")
		ISTimedActionQueue.add(LSWaitForInteraction:new(thisPlayer, otherPlayer, "TimedActions/LSSKAction", {"SKmeditation",true}));
	end

	local TargetID = otherPlayer:getOnlineID()
	local PlayerName = tostring(thisPlayer:getUsername())

	--print("SKCM sending InteractionStart command")
	sendClientCommand(thisPlayer, "LS", "InteractionStart", {TargetID, PlayerName, "TimedActions/LSSKAction", startImmediately, "SKmeditation"})

end
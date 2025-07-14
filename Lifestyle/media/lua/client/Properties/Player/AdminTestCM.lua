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

require 'ISUI/ISWorldObjectContextMenu'

local function onAdminTest(worldobjects, character)
    ISTimedActionQueue.add(ToneDeafSuffering:new(character))
end

local function onAdminTestB(worldobjects, character)
    ISTimedActionQueue.add(PraiseMusician:new(character))
end

local function onAdminTestC(worldobjects, character)

	--if character:isFacingLocation((character:getX()+1),(character:getY()-1),character:getZ()) then
	--print("PLAYER IS FACING ... 1")
	--character:Say("PLAYER IS FACING ... 1")
	--elseif character:isFacingLocation((character:getX()-1),(character:getY()+1),character:getZ()) then
	--print("PLAYER IS FACING ... 2")
	--character:Say("PLAYER IS FACING ... 2")
	--elseif character:isFacingLocation((character:getX()-1),character:getY(),character:getZ()) then
	--print("PLAYER IS FACING ... 3")
	--character:Say("PLAYER IS FACING ... 3")
	--elseif character:isFacingLocation((character:getX()+1),character:getY(),character:getZ()) then
	--print("PLAYER IS FACING ... 4")
	--character:Say("PLAYER IS FACING ... 4")
	--else
	--print("BUGGED FACING")
	--character:Say("BUGGED FACING")
	--end
    ISTimedActionQueue.add(BooingMusician:new(character))
end

local function onAdminTestI(worldobjects, character)
    --ISTimedActionQueue.add(LSAnimTest:new(character))
	if isShiftKeyDown() then
		ISTimedActionQueue.add(LSApplyPerfumeAction:new(character))
	else
		ISTimedActionQueue.add(LSReactionStinking:new(character))
	end
end

local function onAdminTestD(worldobjects, character, litterCategory)

	local MainLitterList = require("Properties/LitterTypes")

	local LitterList = {}

	for k,v in pairs(MainLitterList) do
		if v.category == litterCategory then
			table.insert(LitterList, v)
		end
	end

	local randomNumber = ZombRand(#LitterList) + 1
	local dirtSprite = LitterList[randomNumber].name
		
	if isClient() then
		sendClientCommand("LS", "DebugAddLitter", {character:getX(), character:getY(), character:getZ(), 2, dirtSprite})
	else
		LSAddLitter(character:getX(), character:getY(), character:getZ(), 2, dirtSprite)
	end

end

local function onAdminTestE(worldobjects, character)
  
 	local playerdata
	
	if character:hasModData() then
		playerdata = character:getModData()
	else
	return; end
 
 	if not playerdata.bathroomNeed then
		playerdata.bathroomNeed = 0
	end
  
	if isShiftKeyDown() then
		playerdata.bathroomNeed = playerdata.bathroomNeed + 50
		character:Say("Bathroom Need increased by 50")
	else
		playerdata.bathroomNeed = playerdata.bathroomNeed + 10
		character:Say("Bathroom Need increased by 10")
	end
 
  	if playerdata.bathroomNeed > 100 then
		playerdata.bathroomNeed = 100
	end
 
	character:Say("Bathroom Need is now " .. tonumber(playerdata.bathroomNeed))
 
end

local function onAdminTestF(worldobjects, character)


    for playerIndex = 0, getNumActivePlayers()-1 do
    local playersList = {};--get players
	local playerObj = getSpecificPlayer(playerIndex)
	local playerIso

		if (playerObj ~= nil) then


				for x = playerObj:getX()-8,playerObj:getX()+8 do
					for y = playerObj:getY()-8,playerObj:getY()+8 do
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
					end
				end
				for i,v in ipairs(playersList) do
					if playerIso and
					v:getUsername() ~= playerObj:getUsername() and
					v:isOutside() == playerObj:isOutside() then
						--if playerIso:checkCanSeeClient(v) then
						if playerObj:CanSee(v) and playerIso:checkCanSeeClient(v) then
							local DanceTargetName = tostring(v:getDescriptor():getForename())
							local DanceTargetSurname = tostring(v:getDescriptor():getSurname())
							playerObj:Say("I see a player and his name is " .. DanceTargetName .. DanceTargetSurname)
						else
						playerObj:Say("There is someone around but I don't see them")
						end
					else
						playerObj:Say("No players around me")
					end
                end	
			else
				playerObj:Say("No players around me")
            end
	

		end
	end
end

local function onAdminTestG(worldobjects, character)
  
 	local playerdata
	
	if character:hasModData() then
		playerdata = character:getModData()
	else
	return; end
 
 	if not playerdata.hygieneNeed then
		playerdata.hygieneNeed = 40
	end
 
	if isShiftKeyDown() then
		playerdata.hygieneNeed = playerdata.hygieneNeed + 50
		character:Say("Hygiene Need increased by 50")
	else
		playerdata.hygieneNeed = playerdata.hygieneNeed + 10
		character:Say("Hygiene Need increased by 10")
	end
 
  	if playerdata.hygieneNeed > 100 then
		playerdata.hygieneNeed = 100
	end
 
	character:Say("Hygiene Need is now " .. tonumber(playerdata.hygieneNeed))
 
end

local function getPlayerCooldowns()

	return {
		"TeachCooldown",
		"LessonCooldown",
		"InteractionSpam",
	}

end

local function onAdminTestH(worldobjects, character)
  
 	local playerData
	
	if character:hasModData() then
		playerData = character:getModData()
	else
	return; end
 
	local cooldownList = getPlayerCooldowns()

	for n=1,#cooldownList do
		local value = cooldownList[n]
		if not playerData.LSCooldowns then playerData.LSCooldowns = {}; end
		if not playerData.LSCooldowns[value] then
			playerData.LSCooldowns[value] = 0
		end
		if playerData.LSCooldowns[value] and (playerData.LSCooldowns[value] ~= 0) then
			character:Say(value .. " cooldown was set to " .. tonumber(playerData.LSCooldowns[value]))
			character:Say("Resetting to 0 for " .. value)
			playerData.LSCooldowns[value] = 0
		else
			character:Say(value .. " cooldown is 0 - command ignored")
		end
	end
 
end

local function AdminCMOptionsTable(subMenuOther, subMenuExpressions, subMenuNeeds)

return {
	{subMenu=subMenuExpressions,text="ContextMenu_LSDebug_TDSuffer",localF=onAdminTest,arg1=false},
	{subMenu=subMenuExpressions,text="ContextMenu_LSDebug_Applause",localF=onAdminTestB,arg1=false},
	{subMenu=subMenuExpressions,text="ContextMenu_LSDebug_Boo",localF=onAdminTestC,arg1=false},
	{subMenu=subMenuExpressions,text="ContextMenu_LSDebug_TestAnim",localF=onAdminTestI,arg1=false},
	{subMenu=subMenuOther,text="ContextMenu_LSDebug_Litter",localF=onAdminTestD,arg1="grime"},
	{subMenu=subMenuOther,text="ContextMenu_LSDebug_LitterB",localF=onAdminTestD,arg1="blood"},
	{subMenu=subMenuOther,text="ContextMenu_LSDebug_VisionCheck",localF=onAdminTestF,arg1=false},
	{subMenu=subMenuOther,text="ContextMenu_LSDebug_ResetSKCD",localF=onAdminTestH,arg1=false},
	{subMenu=subMenuNeeds,text="ContextMenu_LSDebug_IncreaseBathroomNeed",localF=onAdminTestE,arg1=false},
	{subMenu=subMenuNeeds,text="ContextMenu_LSDebug_IncreaseHygieneNeed",localF=onAdminTestG,arg1=false},

}

end

LSDebugAdmin = {};
LSDebugAdmin.doBuildMenu = function(player, context, worldobjects, DebugBuildOption)

    if isAdmin() or isDebugEnabled() then

	--local sandboxExpressions = SandboxVars.Debug.Expressions or false
	--if sandboxExpressions then

		local expressionsMenu = DebugBuildOption:addOptionOnTop(getText("ContextMenu_LSDebug_Expressions"));
		local needsMenu = DebugBuildOption:addOptionOnTop(getText("ContextMenu_LSDebug_Needs"));
		local otherMenu = DebugBuildOption:addOptionOnTop(getText("ContextMenu_LSDebug_Other"));

		local subMenuOther = DebugBuildOption:getNew(DebugBuildOption);
		context:addSubMenu(otherMenu, subMenuOther)
		local subMenuExpressions = DebugBuildOption:getNew(DebugBuildOption);
		context:addSubMenu(expressionsMenu, subMenuExpressions)
		local subMenuNeeds = DebugBuildOption:getNew(DebugBuildOption);
		context:addSubMenu(needsMenu, subMenuNeeds)

		local character = getSpecificPlayer(player)
	
		local adminCMOptions = AdminCMOptionsTable(subMenuOther, subMenuExpressions, subMenuNeeds)

		for k, v in pairs(adminCMOptions) do
			if v.subMenu then
				v.subMenu:addOption(getText(v.text), worldobjects, v.localF, character, v.arg1)		
			end
		end
	--end
	end
end

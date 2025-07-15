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

InstrumentPianoContextMenu = {};

local function getLearnableSongs(Type)
	local learnableTracks = {}
	local allTracks = require("Instruments/Tracks/PlayPianoTracks")
	if allTracks and (#allTracks > 0) then
		for k,v in pairs(allTracks) do
			if v.isaddon ~= 2 then
				table.insert(learnableTracks, v)
			end
		end
	end
	return learnableTracks
end

local function hasSongsToLearn(Type, learnedTracksData)
	local learnableTracks = getLearnableSongs(Type)
	if learnableTracks and (#learnableTracks > 0) and (#learnableTracks > #learnedTracksData) then return true; end
	return false
end

local function PianoPracticeOption(context, worldobjects, thisPlayer, Piano, Type, playerlevel, learnedTracksData)
	local trainingDebugPianoOption
    if isAdmin() or isDebugEnabled() then
		trainingDebugPianoOption = context:addOptionOnTop(getText("ContextMenu_LSDebug_LearnAllSongs"),
		worldobjects,
		InstrumentPianoContextMenu.onDebug,
		thisPlayer,
		Type,
		learnedTracksData,
		playerlevel)
		trainingDebugPianoOption.iconTexture = getTexture('media/ui/BugIcon.png')
	end

	contextMenu = "ContextMenu_Play_Practice_Piano"
		
	local trainingpianooption = context:addOptionOnTop(getText(contextMenu),
	worldobjects,
	InstrumentPianoContextMenu.onAction,
	thisPlayer,
	Piano,
	Type,
	playerlevel,
	false,
	false,
	true,
	false);

	local tooltipPianoTraining = ISToolTip:new();
	tooltipPianoTraining:initialise();
	tooltipPianoTraining:setVisible(false);

	local descriptionPT = getText("ContextMenu_Play_Instrument_Practice")
	if Piano:getSquare():getX() > (thisPlayer:getSquare():getX() + 1) or Piano:getSquare():getY() > (thisPlayer:getSquare():getY() + 1) then--disable the option
		trainingpianooption.notAvailable = true;
		descriptionPT = " <RED>" .. getText("ContextMenu_Play_Piano_TooFar");
		tooltipPianoTraining.description = descriptionPT
		trainingpianooption.toolTip = tooltipPianoTraining
		trainingpianooption.iconTexture = getTexture('media/ui/pianoNo_icon.png')
		if trainingDebugPianoOption then trainingDebugPianoOption.notAvailable = true; end
	else
		if learnedTracksData and (#learnedTracksData > 0) and (not hasSongsToLearn(Type, learnedTracksData)) then
			descriptionPT = getText("Tooltip_PracticeInstrument_KnowAll")
			if trainingDebugPianoOption then
				trainingDebugPianoOption.notAvailable = true
				local tooltipDebugTraining = ISToolTip:new();
				tooltipDebugTraining:initialise();
				tooltipDebugTraining:setVisible(false);
				tooltipDebugTraining.description = descriptionPT
				trainingDebugPianoOption.toolTip = tooltipDebugTraining
			end
		end
		tooltipPianoTraining.description = descriptionPT
		trainingpianooption.toolTip = tooltipPianoTraining
		trainingpianooption.iconTexture = getTexture('media/ui/piano_icon.png')
	end

end

InstrumentPianoContextMenu.doBuildMenu = function(player, context, worldobjects, Piano, spriteName, customName, groupName, DebugBuildOption)
	if not Piano then return end
    local thisPlayer = getSpecificPlayer(player)
	if not thisPlayer then return; end
	if thisPlayer:HasTrait("Deaf") then return; end
    if thisPlayer:getVehicle() then return; end
	--if not thisPlayer:isSitOnGround() then return; end
	if thisPlayer:isSneaking() then return; end
	local playerdata
	if thisPlayer:hasModData() then
		playerdata = thisPlayer:getModData()
	else
	return; end
	local Type
	if customName == "Piano" then Type = "Conventional"; end
	--if customName == "Grand Piano" then Type = "Conventional"; end
	--if spriteName == "location_community_church_small_01_97" then Type = "Organ"; end

	--if playerdata.IsSittingOnSeat == false or (playerdata.IsSittingOnPianoStool ~= nil and playerdata.IsSittingOnPianoStool == false) or not thisPlayer:isSitOnGround() then 
	if not playerdata.IsSittingOnPianoStool then 

	local RefuseOption = context:addOptionOnTop(getText("ContextMenu_Play_NotSittedPianoStool"));

	local tooltip = ISToolTip:new();
		tooltip:initialise();
		tooltip:setVisible(false);
		

		RefuseOption.notAvailable = true;
		description = " <RED>" .. getText("Tooltip_Play_NotSittedPianoStool");
		tooltip.description = description
		RefuseOption.toolTip = tooltip
		RefuseOption.iconTexture = getTexture('media/ui/pianoNo_icon.png')

	else

	local properties = Piano:getSprite():getProperties()
	local contextMenu
	local playerlevel = thisPlayer:getPerkLevel(Perks.Music)
	local randomNumber
	local randomTrack
	local isaddon
	local Length
	
	--local instrumentAnimations = require("Instrument/InstrumentAnimations")

	if Type == "Conventional" or Type == "Grand Piano" then

	--	local AvailableAnims = {}

	--	for k,v in pairs(instrumentAnimations) do
	--		if playerlevel > 4 then
	--			if v.instrument == "piano" and v.level <= playerlevel and v.level >= (playerlevel - 4) then
	--				table.insert(AvailableAnims, v)
	--			end
	--		elseif v.instrument == "piano" and v.level <= playerlevel then
	--			table.insert(AvailableAnims, v)
	--		end
	--	end

		--local PlayPianoTracks = require("Instruments/Tracks/PlayPianoTracks")

		----------------TRAINING
		--if playerlevel < 2 then
		
		PianoPracticeOption(context, worldobjects, thisPlayer, Piano, Type, playerlevel, playerdata.PianoLearnedTracks)
		--else

		if playerdata.PianoLearnedTracks and (#playerdata.PianoLearnedTracks > 0) then
		----------------RANDOM
			if (#playerdata.PianoLearnedTracks > 1) then
		
			
				local AvailableTracks = {}
		
					for k,v in pairs(playerdata.PianoLearnedTracks) do
						if playerlevel > 3 then
							if v.isaddon ~= 2 and v.level >= 2 and v.level <= playerlevel then
							table.insert(AvailableTracks, v)
							end
						elseif v.isaddon ~= 2 and v.level <= playerlevel then
							table.insert(AvailableTracks, v)
						end
					end
					
				if #AvailableTracks > 0 then
					randomNumber = ZombRand(#AvailableTracks) + 1
					randomTrack = AvailableTracks[randomNumber]
					Length = randomTrack.length * 48
					contextMenu = "ContextMenu_Play_Random_Piano"
		
					local randompianooption = context:addOptionOnTop(getText(contextMenu),
					worldobjects,
					InstrumentPianoContextMenu.onAction,
					thisPlayer,
					Piano,
					Type,
					randomTrack.sound,
					Length,
					randomTrack.level,
					false,
					false);

					local tooltipPiano = ISToolTip:new();
					tooltipPiano:initialise();
					tooltipPiano:setVisible(false);

					if Piano:getSquare():getX() > (thisPlayer:getSquare():getX() + 1) or Piano:getSquare():getY() > (thisPlayer:getSquare():getY() + 1) then--disable the option
						randompianooption.notAvailable = true;
						descriptionP = " <RED>" .. getText("ContextMenu_Play_Piano_TooFar");
						tooltipPiano.description = descriptionP
						randompianooption.toolTip = tooltipPiano
						randompianooption.iconTexture = getTexture('media/ui/pianoNo_icon.png')
					else
						randompianooption.iconTexture = getTexture('media/ui/piano_icon.png')
					end
				end
			end--RANDOM
		--end--TRAINING
		
		--2 ADDING THE SUBMENU TO PLAY SONGS YOUR LEVEL BY NAME
	
			if playerlevel < 10 then
				contextMenu = "ContextMenu_Play_L" .. playerlevel .. "_Piano"
			else
				contextMenu = "ContextMenu_Play_Master_Piano"
			end
	
			local buildOption = context:addOptionOnTop(getText(contextMenu));
			buildOption.iconTexture = getTexture('media/ui/piano_icon.png')
			local subMenu = ISContextMenu:getNew(context);
			context:addSubMenu(buildOption, subMenu)

		--2 ADDING THE OPTION TO PLAY SONGS YOUR LEVEL BY NAME
			for k,v in pairs(playerdata.PianoLearnedTracks) do
				if v.isaddon ~= 2 and v.level == playerlevel then
					local length = v.length * 48

			--2 ADDING THE OPTION IN THE CONTEXT MENU
					contextMenu = v.name
					local subMenuOption = subMenu:addOptionOnTop(getText(contextMenu),
					worldobjects,
					InstrumentPianoContextMenu.onAction,
					thisPlayer,
					Piano,
					Type,
					v.sound,
					length,
					v.level,
					false,
					false);

					if v.isaddon ~= 0 and v.isaddon ~= 2 then
						subMenuOption.iconTexture = getTexture('media/ui/addon_icon.png')
					end
				end --if
			end --for
			
		--3 PLAY A SONG FROM GROUP LEVEL - STARTS AT 1 TO AVOID REDUNDANCY
			if playerlevel > 1 then
		
		--3 ADDING GROUPS SUBMENU
			contextMenu = "ContextMenu_Play_Group_Piano"
		
			local buildOption = context:addOptionOnTop(getText(contextMenu));
			buildOption.iconTexture = getTexture('media/ui/moodles/MusicGood.png')
			local parentMenu = ISContextMenu:getNew(context);
			context:addSubMenu(buildOption, parentMenu)
		
			--3A ADDING BEGINNER LEVEL GROUP SUBMENU 0-1
			contextMenu = "ContextMenu_Play_Beginner_Piano"
		
			local beginnerMenu = parentMenu:addOptionOnTop(getText(contextMenu));
		
			local subMenuA = parentMenu:getNew(parentMenu);
			context:addSubMenu(beginnerMenu, subMenuA)
		
			for k,v in pairs(playerdata.PianoLearnedTracks) do
				if v.isaddon ~= 2 and v.level <= 1 and v.level <= playerlevel then
					local length = v.length * 48
			
				--3A ADDING THE OPTION FOR BEGINNER SONGS IN THE CONTEXT MENU
					contextMenu = v.name
					local subMenuAOption = subMenuA:addOptionOnTop(getText(contextMenu),
					worldobjects,
					InstrumentPianoContextMenu.onAction,
					thisPlayer,
					Piano,
					Type,
					v.sound,
					length,
					v.level,
					false,
					false);

					if v.isaddon ~= 0 and v.isaddon ~= 2 then
						subMenuAOption.iconTexture = getTexture('media/ui/addon_icon.png')
					end
				end
			end
		
		
			if playerlevel > 2 then
		
			--3B ADDING EXPERIENCED LEVEL GROUP SUBMENU 2-3
			contextMenu = "ContextMenu_Play_Experienced_Piano"
		
			local experiencedMenu = parentMenu:addOptionOnTop(getText(contextMenu));
		
			local subMenuB = parentMenu:getNew(parentMenu);
			context:addSubMenu(experiencedMenu, subMenuB)
		
			for k,v in pairs(playerdata.PianoLearnedTracks) do
				if v.isaddon ~= 2 and v.level > 1 and v.level <= 3 and v.level <= playerlevel then
					local length = v.length * 48
			
			--3B ADDING THE OPTION FOR EXPERIENCED SONGS IN THE CONTEXT MENU
					contextMenu = v.name

					local subMenuBOption = subMenuB:addOptionOnTop(getText(contextMenu),
					worldobjects,
					InstrumentPianoContextMenu.onAction,
					thisPlayer,
					Piano,
					Type,
					v.sound,
					length,
					v.level,
					false,
					false);
					
					if v.isaddon ~= 0 and v.isaddon ~= 2 then
						subMenuBOption.iconTexture = getTexture('media/ui/addon_icon.png')
					end
				end
			end
		
			if playerlevel > 4 then
			
			--3C ADDING INTERMEDIATE LEVEL GROUP SUBMENU 4-5
				contextMenu = "ContextMenu_Play_Intermediate_Piano"
			
				local intermediateMenu = parentMenu:addOptionOnTop(getText(contextMenu));
		
				local subMenuC = parentMenu:getNew(parentMenu);
				context:addSubMenu(intermediateMenu, subMenuC)
			
				for k,v in pairs(playerdata.PianoLearnedTracks) do
					if v.isaddon ~= 2 and v.level > 3 and v.level <= 5 and v.level <= playerlevel then
						local length = v.length * 48
				--3C ADDING THE OPTION FOR EXPERIENCED SONGS IN THE CONTEXT MENU
					contextMenu = v.name
				
					local subMenuCOption = subMenuC:addOptionOnTop(getText(contextMenu),
					worldobjects,
					InstrumentPianoContextMenu.onAction,
					thisPlayer,
					Piano,
					Type,
					v.sound,
					length,
					v.level,
					false,
					false);
					
					if v.isaddon ~= 0 and v.isaddon ~= 2 then
						subMenuCOption.iconTexture = getTexture('media/ui/addon_icon.png')
					end
				end
			end
			
			if playerlevel > 6 then
			
			--3D ADDING PROFICIENT LEVEL GROUP SUBMENU 6-7
				contextMenu = "ContextMenu_Play_Proficient_Piano"
			
				local proficientMenu = parentMenu:addOptionOnTop(getText(contextMenu));
		
				local subMenuD = parentMenu:getNew(parentMenu);
				context:addSubMenu(proficientMenu, subMenuD)
			
				for k,v in pairs(playerdata.PianoLearnedTracks) do
					if v.isaddon ~= 2 and v.level > 5 and v.level <= 7 and v.level <= playerlevel then
						local length = v.length * 48
				
			--3D ADDING THE OPTION FOR PROFICIENT SONGS IN THE CONTEXT MENU
					contextMenu = v.name
					local subMenuDOption = subMenuD:addOptionOnTop(getText(contextMenu),
					worldobjects,
					InstrumentPianoContextMenu.onAction,
					thisPlayer,
					Piano,
					Type,
					v.sound,
					length,
					v.level,
					false,
					false);
					
					if v.isaddon ~= 0 and v.isaddon ~= 2 then
						subMenuDOption.iconTexture = getTexture('media/ui/addon_icon.png')
					end
				end
			end
			
			if playerlevel > 8 then
				
			--3E ADDING EXPERT LEVEL GROUP SUBMENU 8-9
				contextMenu = "ContextMenu_Play_Advanced_Piano"
			
				local expertMenu = parentMenu:addOptionOnTop(getText(contextMenu));
		
				local subMenuE = parentMenu:getNew(parentMenu);
				context:addSubMenu(expertMenu, subMenuE)
			
				for k,v in pairs(playerdata.PianoLearnedTracks) do
					if v.isaddon ~= 2 and v.level > 7 and v.level <= 9 and v.level <= playerlevel then
						local length = v.length * 48
							
					--3E ADDING THE OPTION FOR EXPERT SONGS IN THE CONTEXT MENU
						contextMenu = v.name
				
						local subMenuEOption = subMenuE:addOptionOnTop(getText(contextMenu),
						worldobjects,
						InstrumentPianoContextMenu.onAction,
						thisPlayer,
						Piano,
						Type,
						v.sound,
						length,
						v.level,
						false,
						false);
					
						if v.isaddon ~= 0 and v.isaddon ~= 2 then
							subMenuEOption.iconTexture = getTexture('media/ui/addon_icon.png')
						end
					end
				end
			end -- if level > 8
			end -- if level > 6
			end -- if level > 4
			end -- if level > 2


	--3F ------------------------------------------ADDING DUETS GROUP SUBMENU Level > 3 -------------------------------
			if isClient() and playerlevel > 3 and (#playerdata.PianoLearnedTracks > 8) then
	
--		if not isSitOnGround then
				

				contextMenu = "ContextMenu_Play_Duet_Piano"
			
				local duetMenu = parentMenu:addOptionOnTop(getText(contextMenu));
		
				local subMenuF = parentMenu:getNew(parentMenu);
				context:addSubMenu(duetMenu, subMenuF)
		
				local DuetTooltip = ISToolTip:new();
				DuetTooltip:initialise();
				DuetTooltip:setVisible(false);
				DuetTooltip.description = getText("ContextMenu_Play_Duet_InstrumentsNeeded")
		
				local PlayPianoTracksDuet = require("Instruments/Tracks/PlayPianoTracksDuet")
					for k,v in pairs(PlayPianoTracksDuet) do
						if v.level <= playerlevel then
						local length = v.length * 48
		
					--3F ADDING THE OPTION FOR DUET SONGS IN THE CONTEXT MENU
						contextMenu = v.name
						
						local SubMenuFoption = subMenuF:addOptionOnTop(getText(contextMenu),
						worldobjects,
						InstrumentPianoContextMenu.onAction,
						thisPlayer,
						Piano,
						Type,
						v.sound,
						length,
						v.level,
						false,
						true);
						
						local subsubMenu = subMenuF:getNew(subMenuF);
						context:addSubMenu(SubMenuFoption, subsubMenu)
				
						if v.guitaracoustic == 1 then				
							local subsubMenuGA = subsubMenu:addOption(getText("ContextMenu_GuitarAcoustic"))
							subsubMenuGA.iconTexture = getTexture('media/ui/guitaracoustic_icon.png')
							subsubMenuGA.toolTip = DuetTooltip
						end
						if v.guitarelectric == 1 then
							local subsubMenuGE = subsubMenu:addOption(getText("ContextMenu_GuitarElectric"))
							subsubMenuGE.iconTexture = getTexture('media/ui/guitarelectric_icon.png')
							subsubMenuGE.toolTip = DuetTooltip
						end
						if v.guitarelectricbass == 1 then
							local subsubMenuGEB = subsubMenu:addOption(getText("ContextMenu_GuitarElectricBass"))
							subsubMenuGEB.iconTexture = getTexture('media/ui/guitarelectricbass_icon.png')
							subsubMenuGEB.toolTip = DuetTooltip
						end
						if v.keytar == 1 then
							local subsubMenuK = subsubMenu:addOption(getText("ContextMenu_Keytar"))
							subsubMenuK.iconTexture = getTexture('media/ui/keytar_icon.png')
							subsubMenuK.toolTip = DuetTooltip
						end
						if v.flute == 1 then
							local subsubMenuF = subsubMenu:addOption(getText("ContextMenu_Flute"))
							subsubMenuF.iconTexture = getTexture('media/ui/flute_icon.png')
							subsubMenuF.toolTip = DuetTooltip
						end
						if v.saxophone == 1 then
							local subsubMenuS = subsubMenu:addOption(getText("ContextMenu_Saxophone"))
							subsubMenuS.iconTexture = getTexture('media/ui/saxophone_icon.png')
							subsubMenuS.toolTip = DuetTooltip
						end
						if v.banjo == 1 then
							local subsubMenuB = subsubMenu:addOption(getText("ContextMenu_Banjo"))
							subsubMenuB.iconTexture = getTexture('media/ui/banjo_icon.png')
							subsubMenuB.toolTip = DuetTooltip
						end
						if v.trumpet == 1 then
							local subsubMenuV = subsubMenu:addOption(getText("ContextMenu_Trumpet"))
							subsubMenuV.iconTexture = getTexture('media/ui/trumpet_icon.png')
							subsubMenuV.toolTip = DuetTooltip
						end
						if v.violin == 1 then
							local subsubMenuV = subsubMenu:addOption(getText("ContextMenu_Violin"))
							subsubMenuV.iconTexture = getTexture('media/ui/violin_icon.png')
							subsubMenuV.toolTip = DuetTooltip
						end
						if v.vocalm == 1 then
							local subsubMenuVM = subsubMenu:addOption(getText("ContextMenu_VocalM"))
							subsubMenuVM.iconTexture = getTexture('media/ui/vocalM_icon.png')
							subsubMenuVM.toolTip = DuetTooltip
						end
						if v.vocalf == 1 then
							local subsubMenuVF = subsubMenu:addOption(getText("ContextMenu_VocalF"))
							subsubMenuVF.iconTexture = getTexture('media/ui/vocalF_icon.png')
							subsubMenuVF.toolTip = DuetTooltip
						end
				--if v.drums == 1 then
				--local subsubMenuD = subsubMenu:addOption(getText("ContextMenu_Drums"))
				--subsubMenuD.iconTexture = getTexture('media/ui/drums_icon.png')
				--subsubMenuD.toolTip = DuetTooltip
				--end
				--if v.piano == 1 then
				--local subsubMenuP = subsubMenu:addOption(getText("ContextMenu_Piano"))
				--subsubMenuP.iconTexture = getTexture('media/ui/piano_icon.png')
				--subsubMenuP.toolTip = DuetTooltip
				--end
				--if v.harmonica == 1 then
				--local subsubMenuH = subsubMenu:addOption(getText("ContextMenu_Harmonica"))
				--subsubMenuH.iconTexture = getTexture('media/ui/harmonica_icon.png')
				--subsubMenuH.toolTip = DuetTooltip
				--end
					end
				end
--			end -- if not sitonground
			end -- if level > 3 DUET
		
		end -- if level > 1



		
		end--LEARNEDTRACKS
	end
-------
	end--piano stool
------
end

InstrumentPianoContextMenu.onAction = function(worldobjects, player, Piano, Type, Sound, Length, Level, IsTraining, IsDuet)
	local PlayInstrumentPiano = require "TimedActions/PlayInstrumentPiano"
	local PlayInstrumentPianoTraining = require "TimedActions/PlayInstrumentPianoTraining"
	--if InstrumentPianoContextMenu.walkToFront(player, TargetObject, Isfacing) then
		if IsTraining then
			ISTimedActionQueue.add(PlayInstrumentPianoTraining:new(player, Piano, Type, Sound));
		else
			ISTimedActionQueue.add(PlayInstrumentPiano:new(player, Piano, Type, Sound, Length, Level, IsTraining, IsDuet));
		end
	--end
end

local function doLearnAllSongsFull(allSongs, learnedTracksData)
	for k, v in ipairs (allSongs) do
		table.insert(learnedTracksData, v)
	end
end

local function doLearnAllSongsPartial(allSongs, learnedTracksData)
	local notLearned = {}
	for k, v in ipairs (allSongs) do
		local hasSong = false
		for n, j in ipairs(learnedTracksData) do
			if v.name == j.name then hasSong = true; break; end
		end
		if not hasSong then table.insert(learnedTracksData, v); end
	end
end

InstrumentPianoContextMenu.onDebug = function(worldobjects, player, Type, learnedTracksData, playerLevel)
	if not learnedTracksData then return; end

	local allSongs = getLearnableSongs(Type)
	if (not allSongs) or (allSongs and (#allSongs == 0)) then return; end
	if #learnedTracksData == 0 then
		doLearnAllSongsFull(allSongs, learnedTracksData)
	else
		doLearnAllSongsPartial(allSongs, learnedTracksData)
	end

end

--Events.OnFillWorldObjectContextMenu.Add(InstrumentPianoContextMenu.doBuildMenu);

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
require "JukeboxContextMenu"
JukeboxMenu = JukeboxMenu or {}

local function getJukebox(worldobjects)
	local Jukebox, spriteName

	for _,object in ipairs(worldobjects) do
		local square = object:getSquare()
		if square then
			for i=1,square:getObjects():size() do
				local thisObject = square:getObjects():get(i-1)

				local thisSprite = thisObject:getSprite()
				
				if thisSprite ~= nil then
				
					local properties = thisObject:getSprite():getProperties()

					if properties ~= nil then
						local groupName = nil
						local customName = nil
						local thisSpriteName = nil
					
						--local thisSprite = thisObject:getSprite()
						if thisSprite:getName() then
							thisSpriteName = thisSprite:getName()
						end
					
						if properties:Is("GroupName") then
							groupName = properties:Val("GroupName")
						end
					
						if properties:Is("CustomName") then
							customName = properties:Val("CustomName")
						end

						if customName == "Jukebox" then
							Jukebox = thisObject;
							spriteName = thisSpriteName;
						end
					end
				end
			end
		end
	end

	return Jukebox
end

local function getAvailableGenres()
	local availableGenres = {{name="Disco",trait="disco"}, {name="RB",trait="rbsoul"}, {name="Metal",trait="metal"}, {name="Salsa",trait="salsa"}, {name="Pop",trait="pop"}, {name="Beach",trait="beach"},
	{name="Classical",trait="classical"}, {name="Country",trait="country"}, {name="Holiday",trait="holiday"}, {name="Jazz",trait="jazz"}, {name="Muzak",trait="muzak"}, {name="Rap",trait="rap"},
	{name="Reggae",trait="reggae"}, {name="Rock",trait="rock"}, {name="World",trait="world"}}

	return availableGenres
end

JukeboxMenu.doBuildMenu = function(player, context, worldobjects)

    if getCore():getGameMode()=="LastStand" then
        return;
    end
 
    local thisPlayer = getSpecificPlayer(player)

    if thisPlayer:getVehicle() then return; end
    
	local Jukebox = getJukebox(worldobjects)

	if not Jukebox then return end
	
	if not ((SandboxVars.ElecShutModifier > -1 and
	GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) or
	Jukebox:getSquare():haveElectricity()) then return; end

	local switch = {"JukeboxSwitch01","JukeboxSwitch02","JukeboxSwitch03"};
	local idx = ZombRand(#switch) + 1
	local soundFile = switch[idx]

    local JukeboxData = Jukebox:getModData()
    if not JukeboxData.JukeboxID then
	JukeboxData.JukeboxID = {(tostring(Jukebox:getX()) .. "," .. tostring(Jukebox:getY()) .. "," .. tostring(Jukebox:getZ()))};
	Jukebox:transmitModData();
	end
    if not JukeboxData.OnOff then 
	JukeboxData.OnOff = {"off"};
	Jukebox:transmitModData();
	end

	if JukeboxData.OnOff == "on" then

-----------------------Want to Dance Option

	if (getSpecificPlayer(player):getModData().WantsToDance ~= nil) and
	(getSpecificPlayer(player):getModData().WantsToDance == false) then
--		local PlayerWantsToDanceOption = context:addOptionOnTop(getText("ContextMenu_DancingPartner_Enable_Option"), worldobjects, JukeboxMenu.onEnableDancing, getSpecificPlayer(player));
--		PlayerWantsToDanceOption.iconTexture = getTexture('media/ui/okay_icon.png')
	elseif (getSpecificPlayer(player):getModData().WantsToDance ~= nil) and
	(getSpecificPlayer(player):getModData().WantsToDance == true) then
--		local PlayerWantsToDanceOptionNo = context:addOptionOnTop(getText("ContextMenu_DancingPartner_Disable_Option"), worldobjects, JukeboxMenu.onDisableDancing, getSpecificPlayer(player));
--		PlayerWantsToDanceOptionNo.iconTexture = getTexture('media/ui/okayNo_icon.png')
	else
		getSpecificPlayer(player):getModData().WantsToDance = true
	end

---------------------

-----------------------Volume Option

	contextMenu = "ContextMenu_Jukebox_Volume"
		
	local buildVolumeOption = context:addOptionOnTop(getText(contextMenu));
	buildVolumeOption.iconTexture = getTexture('media/ui/moodles/MusicGood.png')
	local volumeMenu = ISContextMenu:getNew(context);
	context:addSubMenu(buildVolumeOption, volumeMenu)

	if getSpecificPlayer(player):getModData().JukeboxVolumeAll ~= nil and tonumber(getSpecificPlayer(player):getModData().JukeboxVolumeAll) ~= nil then

	else
		getSpecificPlayer(player):getModData().JukeboxVolumeAll = 1
	end

	local VolumeALLOption4 = volumeMenu:addOption(getText("ContextMenu_Jukebox_Volume_Increase2Option"), worldobjects, JukeboxMenu.onVolumeChange, getSpecificPlayer(player), 0.8);
	VolumeALLOption4.iconTexture = getTexture('media/ui/volumevhigh_icon.png')
	local VolumeALLOption3 = volumeMenu:addOption(getText("ContextMenu_Jukebox_Volume_IncreaseOption"), worldobjects, JukeboxMenu.onVolumeChange, getSpecificPlayer(player), 0.4);
	VolumeALLOption3.iconTexture = getTexture('media/ui/volumehigh_icon.png')
	local VolumeALLOption2 = volumeMenu:addOption(getText("ContextMenu_Jukebox_Volume_DecreaseOption"), worldobjects, JukeboxMenu.onVolumeChange, getSpecificPlayer(player), -0.4);
	VolumeALLOption2.iconTexture = getTexture('media/ui/volumelow_icon.png')
	local VolumeALLOption1 = volumeMenu:addOption(getText("ContextMenu_Jukebox_Volume_Decrease2Option"), worldobjects, JukeboxMenu.onVolumeChange, getSpecificPlayer(player), -0.8);
	VolumeALLOption1.iconTexture = getTexture('media/ui/volumevlow_icon.png')

	if getSpecificPlayer(player):getModData().JukeboxVolumeAll <= 0.1 then
		VolumeALLOption1.notAvailable = true;
		VolumeALLOption2.notAvailable = true;
	elseif getSpecificPlayer(player):getModData().JukeboxVolumeAll <= 0.8 then
		VolumeALLOption1.notAvailable = true;
	elseif getSpecificPlayer(player):getModData().JukeboxVolumeAll >= 3.2 then
		VolumeALLOption3.notAvailable = true;
		VolumeALLOption4.notAvailable = true;
	elseif getSpecificPlayer(player):getModData().JukeboxVolumeAll >= 2.8 then
		VolumeALLOption4.notAvailable = true;
	end

---------------------

	local PlayJukeboxTracks = require("TimedActions/PlayJukeboxTracks")
	
	
		contextMenu = "ContextMenu_Play_Group_Styles"
		
		local buildOption = context:addOptionOnTop(getText(contextMenu));
		buildOption.iconTexture = getTexture('media/ui/djbooth_icon.png')
		local parentMenu = ISContextMenu:getNew(context);
		context:addSubMenu(buildOption, parentMenu)

---------------genreOptions
		local AvailableTracks
		local PlayOption
		local availableGenres = getAvailableGenres()
		for k,v in ipairs(availableGenres) do
			AvailableTracks = require("JukeboxTracks/"..v.name)
			if AvailableTracks and (#AvailableTracks) > 0 then
				local randomNumber = ZombRand(#AvailableTracks) + 1
				local randomTrack = AvailableTracks[randomNumber]
				PlayOption = parentMenu:addOption(getText("ContextMenu_Play_Style_"..v.name), worldobjects, JukeboxMenu.onPlay, getSpecificPlayer(player), Jukebox, soundFile,  
				randomTrack.sound, randomTrack.length, randomTrack.genre)	
				PlayOption.iconTexture = getTexture('media/ui/Traits/trait_'..v.trait..'.png')
			end
		end
	
	end
end


Events.OnFillWorldObjectContextMenu.Add(JukeboxMenu.doBuildMenu);

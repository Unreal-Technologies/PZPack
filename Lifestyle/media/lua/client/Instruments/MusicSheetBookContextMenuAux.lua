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

require "ISUI/ISInventoryPane"
require "Instruments/MusicSheetBookContextMenu"

local function onCanLearnInstrumentType(thisPlayer, playerlevel, v, instrumentData)

	local canLearnAux
					
		if playerlevel < v.level then
					
		elseif #instrumentData > 0 then
			canLearnAux = true
			for j,k in pairs(instrumentData) do
				if k.isaddon ~= 2 and k.name == v.name then
					canLearnAux = false
					break
				end
			end
		elseif playerlevel >= v.level then
			canLearnAux = true
		end

	return canLearnAux

end

MusicSheetBookContextMenu.onAction = function(worldobjects, player, Item, Time, Song, Instrument, penOrPencil)
	local LSSheetBookAction = require "TimedActions/LSSheetBookAction"
--	local actionType = "isWrite"
	local Cont1
	local Cont2

	if instanceof(Item, "InventoryItem") then
		if luautils.haveToBeTransfered(player, Item) then
			Cont1 = Item:getContainer()
			ISTimedActionQueue.add(ISInventoryTransferAction:new(player, Item, Item:getContainer(), player:getInventory()))
		end
	elseif instanceof(Item, "ArrayList") then
		local items = Item
		for i=1,items:size() do
			local item = items:get(i-1)
			if luautils.haveToBeTransfered(player, item) then
				Cont1 = item:getContainer()
				ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, item:getContainer(), player:getInventory()))
			end
		end
	end

	if penOrPencil then
--		actionType = "isRead"

		if instanceof(penOrPencil, "InventoryItem") then
			if luautils.haveToBeTransfered(player, penOrPencil) then
				Cont2 = penOrPencil:getContainer()
				ISTimedActionQueue.add(ISInventoryTransferAction:new(player, penOrPencil, penOrPencil:getContainer(), player:getInventory()))
			end
		elseif instanceof(penOrPencil, "ArrayList") then
			local items = penOrPencil
			for i=1,items:size() do
				local item = items:get(i-1)
				if luautils.haveToBeTransfered(player, item) then
					Cont2 = item:getContainer()
					ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, item:getContainer(), player:getInventory()))
				end
			end
		end
	end



	ISTimedActionQueue.add(LSSheetBookAction:new(player, Item, Time, Song, Instrument, penOrPencil, Cont1, Cont2));

	--end
end

function MusicSheetBookContextMenu.onCanLearn(thisPlayer, v, instrument, instrumentName, playerlevel)

	local instrumentData
	local canLearn

	if instrument == "trumpet" then
		instrumentName = "ContextMenu_SheetBook_Trumpet"
		instrumentData = thisPlayer:getModData().TrumpetLearnedTracks
	elseif instrument == "guitarA" then----
		instrumentName = "ContextMenu_SheetBook_GuitarA"
		instrumentData = thisPlayer:getModData().GuitarALearnedTracks
	elseif instrument == "banjo" then
		instrumentName = "ContextMenu_SheetBook_Banjo"
		instrumentData = thisPlayer:getModData().BanjoLearnedTracks
	elseif instrument == "keytar" then
		instrumentName = "ContextMenu_SheetBook_Keytar"
		instrumentData = thisPlayer:getModData().KeytarLearnedTracks
	elseif instrument == "sax" then
		instrumentName = "ContextMenu_SheetBook_Saxophone"
		instrumentData = thisPlayer:getModData().SaxophoneLearnedTracks
	elseif instrument == "guitarEB" then
		instrumentName = "ContextMenu_SheetBook_GuitarEB"
		instrumentData = thisPlayer:getModData().GuitarEBLearnedTracks
	elseif instrument == "guitarE" then
		instrumentName = "ContextMenu_SheetBook_GuitarE"
		instrumentData = thisPlayer:getModData().GuitarELearnedTracks
	elseif instrument == "flute" then
		instrumentName = "ContextMenu_SheetBook_Flute"
		instrumentData = thisPlayer:getModData().FluteLearnedTracks
	elseif instrument == "piano" then
		instrumentName = "ContextMenu_SheetBook_Piano"
		instrumentData = thisPlayer:getModData().PianoLearnedTracks
	elseif instrument == "harmonica" then
		instrumentName = "ContextMenu_SheetBook_Harmonica"
		instrumentData = thisPlayer:getModData().HarmonicaLearnedTracks
	end

	canLearn = onCanLearnInstrumentType(thisPlayer, playerlevel, v, instrumentData)

	return canLearn, instrumentName
end

function MusicSheetBookContextMenu.onLoadModData(thisPlayer)

		thisPlayer:getModData().TrumpetLearnedTracks = thisPlayer:getModData().TrumpetLearnedTracks or {}
		thisPlayer:getModData().GuitarALearnedTracks = thisPlayer:getModData().GuitarALearnedTracks or {}
		thisPlayer:getModData().BanjoLearnedTracks = thisPlayer:getModData().BanjoLearnedTracks or {}
		thisPlayer:getModData().KeytarLearnedTracks = thisPlayer:getModData().KeytarLearnedTracks or {}
		thisPlayer:getModData().SaxophoneLearnedTracks = thisPlayer:getModData().SaxophoneLearnedTracks or {}
		thisPlayer:getModData().GuitarEBLearnedTracks = thisPlayer:getModData().GuitarEBLearnedTracks or {}
		thisPlayer:getModData().GuitarELearnedTracks = thisPlayer:getModData().GuitarELearnedTracks or {}
		thisPlayer:getModData().FluteLearnedTracks = thisPlayer:getModData().FluteLearnedTracks or {}
		thisPlayer:getModData().PianoLearnedTracks = thisPlayer:getModData().PianoLearnedTracks or {}
		thisPlayer:getModData().HarmonicaLearnedTracks = thisPlayer:getModData().HarmonicaLearnedTracks or {}
end

function MusicSheetBookContextMenu.onGetList(songLevel, songNameList, songName, instrumentName)

	local songRarity
	local RarityRGB
	if songLevel <= 2 then 
		songRarity = "Tooltip_SheetBook_SongCommon"
		RarityRGB = " <RGB:0.6,0.9,0.5>"
	elseif songLevel <= 4 then
		songRarity = "Tooltip_SheetBook_SongUncommon"
		RarityRGB = " <RGB:0.9,0.9,0.4>"
	elseif songLevel <= 6 then
		songRarity = "Tooltip_SheetBook_SongRare"
		RarityRGB = " <RGB:0.4,0.9,0.9>"
	elseif songLevel <= 8 then
		songRarity = "Tooltip_SheetBook_SongVeryRare"
		RarityRGB = " <RGB:0.8,0.4,0.9>"
	elseif songLevel <= 10 then
		songRarity = "Tooltip_SheetBook_SongLegendary"
		RarityRGB = " <RGB:0.9,0.4,0.4>"
	end

	if songNameList then
		songNameList = songNameList .. " <BR> " .. " <RGB:1,1,0.8>" .. getText(songName) .. " <RGB:1,1,1>" .. " -  (" .. " <RGB:0.9,0.9,0.5>" .. getText(instrumentName) .. " <RGB:1,1,1>" .. ")  (" .. RarityRGB .. getText(songRarity) .. " <RGB:1,1,1>" .. getText("Tooltip_SheetBook_SongLevelIs") .. (songLevel) .. ")"
	else
		songNameList = " <RGB:1,1,0.8>" .. getText(songName) .. " <RGB:1,1,1>" .. " -  (" .. " <RGB:0.9,0.9,0.5>" .. getText(instrumentName) .. " <RGB:1,1,1>" .. ")  (" .. RarityRGB .. getText(songRarity) .. " <RGB:1,1,1>" .. getText("Tooltip_SheetBook_SongLevelIs") .. (songLevel) .. ")"
	end

	return songNameList
end

function MusicSheetBookContextMenu.onRenaming(Item, player)
	local textBox = ISTextBox:new(0, 0, 300, 120, Item:getDisplayName()..":", Item:getName(), nil, MusicSheetBookContextMenu.onClick, player:getPlayerNum(), player, Item, false, false, false)
	textBox:initialise()
	textBox:addToUIManager()
end

function MusicSheetBookContextMenu:onClick(button, player, item)
	if button.internal == "OK" and button.parent.entry:getText() and button.parent.entry:getText() ~= "" then
		item:setName(button.parent.entry:getText())
		local pdata = getPlayerData(player:getPlayerNum())
		if pdata then
			pdata.playerInventory:refreshBackpacks()
			pdata.lootInventory:refreshBackpacks()
		end
	end
end


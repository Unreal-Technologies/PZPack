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

AuthorPainting = {}

function AuthorPainting:onClick(button, player, item)
	if button.internal == "OK" and button.parent.entry:getText() and button.parent.entry:getText() ~= "" then
		item:getModData().movableData['artName'] = button.parent.entry:getText()
		local pdata = getPlayerData(player:getPlayerNum())
		if pdata then
			pdata.playerInventory:refreshBackpacks()
			pdata.lootInventory:refreshBackpacks()
		end
	end
end

function AuthorPainting.createPaintingName(player, item)
	local textBox = ISTextBox:new(0, 0, 300, 120, getText("IGUI_PaintingAddName")..":", item:getName(), nil, AuthorPainting.onClick, player:getPlayerNum(), player, item, false, false, false)
	textBox.maxChars = 30
	textBox:initialise()
	textBox:addToUIManager()
end
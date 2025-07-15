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

function ScanForPlayers(command, arg1, arg2, arg3)
	if command then
		local playerObj = getPlayer()
		local players = getOnlinePlayers();
		if players then
			for i=1,players:size() do
				local player = players:get(i-1)
				if player and player ~= playerObj then
					if player:getX() >= playerObj:getX() - 30 and player:getX() < playerObj:getX() + 30 and
                    player:getY() >= playerObj:getY() - 30 and player:getY() < playerObj:getY() + 30 then
						sendClientCommand(playerObj, "LS", command, {player:getOnlineID(), playerObj:getDisplayName(), arg1, arg2, arg3})
					end
				end
            end
		end
	end
end
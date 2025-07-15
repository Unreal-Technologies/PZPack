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

require "Items/ProceduralDistributions"

LSItemsDistribution = LSItemsDistribution or {}

function LSItemsDistribution.onInitGlobalModData(isNewGame)
	LSItemsDistribution.Books()
	if SandboxVars.Text.DividerMusicNew then
		LSItemsDistribution.Instruments()
	end
	if SandboxVars.Text.DividerHygiene then
		LSItemsDistribution.Cleaning()
	end
end

Events.OnInitGlobalModData.Add(LSItemsDistribution.onInitGlobalModData)
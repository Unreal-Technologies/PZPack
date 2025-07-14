Erikas_Tiles = Erikas_Tiles or {}

Erikas_Tiles.addContainerTypes = function()
    	local containerVals = IsoWorld.PropertyValueMap:get("container") or ArrayList.new()
--
    	if not containerVals:contains("jewelryBox") then 
		containerVals:add("jewelryBox") 
	end
--
    	if not containerVals:contains("tissueBox") then 
		containerVals:add("tissueBox") 
	end
--
    	if not containerVals:contains("penHolder") then 
		containerVals:add("penHolder") 
	end
--
    	if not containerVals:contains("paperTray") then 
		containerVals:add("paperTray") 
	end
--
    	if not containerVals:contains("toolBox") then 
		containerVals:add("toolBox") 
	end
--
    	if not containerVals:contains("makeupOrganizer") then 
		containerVals:add("makeupOrganizer") 
	end
--
    	if not containerVals:contains("keyLocker") then 
		containerVals:add("keyLocker") 
	end
--
end

Events.OnInitWorld.Add(Erikas_Tiles.addContainerTypes)
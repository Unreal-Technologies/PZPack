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

-- Context Menu S

local LScontextTable = {}

local function getCSTables()
	return {
		{contextname=LSDebugAdmin,isdebug=true,itemA="none",itemB="none",clothing="none",ismp=false,mod="GNL"},
		{contextname=ToiletGroundContextMenu,isdebug=false,itemA="none",itemB="none",clothing="none",ismp=false,mod="HGN"},
		{contextname=LSCleanRoomContextMenu,isdebug=false,itemA="none",itemB="none",clothing="none",ismp=false,mod="HGN"},
		{contextname=LSMeditateContextMenu,isdebug=false,itemA="none",itemB="none",clothing="none",ismp=false,mod="MDT"},
		{contextname=LSSKContextMenu,isdebug=false,itemA="none",itemB="none",clothing="none",ismp=true,mod="GNL"},
		{contextname=LSDanceContextMenu,isdebug=false,itemA="none",itemB="none",clothing="none",ismp=false,mod="DNC"},
	}
end

local function getCGTables()
	return {
		{customname="Shower",groupname="none",contextname=ShowerContextMenu,multiple="single",mod="HGN"},
		{customname="Bath",groupname="Large Deluxe",contextname=BathContextMenu,multiple="single",mod="HGN"},
		{customname="Toilet",groupname="none",contextname=ToiletContextMenu,multiple="single",mod="HGN"},
		{customname="Cabinet",groupname="Medicine",contextname=CabinetContextMenu,multiple="Sink",mod="GNL"},
		{customname="Mirror",groupname="none",contextname=MirrorContextMenu,multiple="Sink",mod="GNL"},
		{customname="Chair",groupname="none",contextname=SitActionMenu,multiple="single",mod="GNL"},
		{customname="Couch",groupname="none",contextname=SitActionMenu,multiple="single",mod="GNL"},
		{customname="Stool",groupname="none",contextname=SitActionMenu,multiple="single",mod="GNL"},
		{customname="Piano",groupname="none",contextname=InstrumentPianoContextMenu,multiple="single",mod="MSC"},
		{customname="Microphone",groupname="Standing",contextname=VocalContextMenu,multiple="single",mod="MSC"},
		{customname="Painting",groupname="Easel",contextname=EaselContextMenu,multiple="single",mod="GNL"},
		{customname="Painting",groupname="EaselCanvasSmall",contextname=EaselCanvasContextMenu,multiple="single",mod="GNL"},
		{customname="Painting",groupname="EaselCanvas",contextname=EaselCanvasContextMenu,multiple="single",mod="GNL"},
		{customname="Painting",groupname="EaselCanvasLarge",contextname=EaselCanvasContextMenu,multiple="single",mod="GNL"},
	}
end

local function getCITables()
	return {
		{name="Banjo",contextname=VanillaInstrumentsContextMenu,cat="all",mod="MSC"},
		{name="GuitarElectricBassBlue",contextname=VanillaInstrumentsContextMenu,cat="all",mod="MSC"},
		{name="GuitarElectricBassRed",contextname=VanillaInstrumentsContextMenu,cat="all",mod="MSC"},
		{name="GuitarElectricBassBlack",contextname=VanillaInstrumentsContextMenu,cat="all",mod="MSC"},
		{name="GuitarAcoustic",contextname=VanillaInstrumentsContextMenu,cat="all",mod="MSC"},
		{name="GuitarElectricBlue",contextname=VanillaInstrumentsContextMenu,cat="all",mod="MSC"},
		{name="GuitarElectricBlack",contextname=VanillaInstrumentsContextMenu,cat="all",mod="MSC"},
		{name="GuitarElectricRed",contextname=VanillaInstrumentsContextMenu,cat="all",mod="MSC"},
		{name="Flute",contextname=VanillaInstrumentsContextMenu,cat="all",mod="MSC"},
		{name="Trumpet",contextname=VanillaInstrumentsContextMenu,cat="all",mod="MSC"},
		{name="Keytar",contextname=VanillaInstrumentsContextMenu,cat="all",mod="MSC"},
		{name="Saxophone",contextname=VanillaInstrumentsContextMenu,cat="all",mod="MSC"},
		{name="Lifestyle.Harmonica",contextname=NewInstrumentsContextMenu,cat="all",mod="MSC"},
		{name="Lifestyle.SheetMusicBook",contextname=MusicSheetBookContextMenu,cat="PF",mod="MSC"},
		{name="Perfume",contextname=PerfumeContextMenu,cat="PF",mod="HGN"},
		{name="Cologne",contextname=PerfumeContextMenu,cat="PF",mod="HGN"},
		{name="HMW.H_Bass",contextname=NewInstrumentsContextMenu,cat="all",mod="MSC"},
		{name="HMW.H_Acoustic",contextname=NewInstrumentsContextMenu,cat="all",mod="MSC"},
		{name="HMW.H_Electric",contextname=NewInstrumentsContextMenu,cat="all",mod="MSC"},
		{name="HMW.H_Banjo",contextname=NewInstrumentsContextMenu,cat="all",mod="MSC"},
	}
end

local function loadModuleContexts(contextTable, context, Modules)
	local TCS
	if context == "contextSelfTable" then TCS = getCSTables(); elseif context == "contextCGTable" then TCS = getCGTables(); elseif context == "contextItemTable" then TCS = getCITables(); end
	for k, v in ipairs(TCS) do
		for _, mod in ipairs(Modules) do
			if v.mod == mod then
				table.insert(contextTable, v)
			end
		end
	end
	return contextTable
end

local function LSgetAvailableModules()
	local modules = {}
	table.insert(modules, "GNL")
	if SandboxVars.Text.DividerHygiene then table.insert(modules, "HGN"); end
	if SandboxVars.Text.DividerMeditationNew then table.insert(modules, "MDT"); end
	if SandboxVars.Text.DividerMusicNew then table.insert(modules, "MSC"); end
	if SandboxVars.Text.DividerDancingNew then table.insert(modules, "DNC"); end
	return modules
end

function LSGetContextOptions(player, context)
	if not LScontextTable[context] then
		LScontextTable[context] = {}
		local modules = LSgetAvailableModules()
		LScontextTable[context] = loadModuleContexts(LScontextTable[context], context, modules)
	end
	return LScontextTable[context]
end

local function LSresetContextSelfTable()
	LScontextTable = {}
end
Events.OnCreatePlayer.Add(LSresetContextSelfTable)


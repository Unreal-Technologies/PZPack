local Erikas_Tiles_DistributionTable = {
    	all = {
--
        	jewelryBox = {
            		procedural = true,
            		procList = {
                		{name="JewelryBox", min=0, max=99, forceForTiles="furniture_storage_erika_03_24;furniture_storage_erika_03_25;furniture_storage_erika_03_26;furniture_storage_erika_03_27", weightChance=50},
            		}
        	},
--
        	tissueBox = {
            		procedural = true,
            		procList = {
                		{name="TissueBox", min=0, max=99, forceForTiles="furniture_storage_erika_03_28;furniture_storage_erika_03_29;furniture_storage_erika_03_30;furniture_storage_erika_03_31", weightChance=50},
            		}
        	},
--
        	penHolder = {
            		procedural = true,
            		procList = {
                		{name="PenHolder", min=0, max=99, forceForTiles="furniture_storage_erika_03_32;furniture_storage_erika_03_33;furniture_storage_erika_03_34;furniture_storage_erika_03_35", weightChance=50},
            		}
        	},
--
        	paperTray = {
            		procedural = true,
            		procList = {
                		{name="PaperTray", min=0, max=99, forceForTiles="furniture_storage_erika_03_36;furniture_storage_erika_03_37;furniture_storage_erika_03_38;furniture_storage_erika_03_39", weightChance=50},
            		}
        	},
--
        	toolBox = {
            		procedural = true,
            		procList = {
                		{name="ToolBox", min=0, max=99, forceForTiles="furniture_storage_erika_03_40;furniture_storage_erika_03_41;furniture_storage_erika_03_42;furniture_storage_erika_03_43", weightChance=50},
            		}
        	},
--
        	makeupOrganizer = {
            		procedural = true,
            		procList = {
                		{name="MakeupOrganizer", min=0, max=99, forceForTiles="furniture_storage_erika_03_44;furniture_storage_erika_03_45;furniture_storage_erika_03_46;furniture_storage_erika_03_47", weightChance=50},
            		}
        	},
--
        	keyLocker = {
            		procedural = true,
            		procList = {
                		{name="KeyLocker", min=0, max=99, forceForTiles="furniture_storage_erika_03_48;furniture_storage_erika_03_49", weightChance=50},
            		}
        	},
--
    	},
}

table.insert(Distributions, 2, Erikas_Tiles_DistributionTable)
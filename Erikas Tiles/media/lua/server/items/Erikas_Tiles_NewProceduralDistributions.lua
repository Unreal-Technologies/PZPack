Erikas_Tiles.preDistributionMerge = function()
--
    	ProceduralDistributions.list.JewelryBox = {
        	rolls = 3,
        	items = {
            "Bracelet_BangleRightGold", 4,
            "Bracelet_BangleRightSilver", 6,
            "Bracelet_ChainRightGold", 4,
            "Bracelet_ChainRightSilver", 6,
            "Bracelet_LeftFriendshipTINT", 10,
            "Earring_Dangly_Pearl", 8,
            "Earring_Pearl", 8,
            "Earring_Stud_Gold", 4,
            "Earring_Stud_Silver", 6,
            "NecklaceLong_Gold", 4,
            "NecklaceLong_Silver", 6,
            "Necklace_Crucifix", 10,
            "Necklace_Gold", 4,
            "Necklace_Pearl", 8,
            "Necklace_Silver", 6,
            "Necklace_SilverCrucifix", 8,
            "Necklace_YingYang", 10,
            "Ring_Left_RingFinger_Gold", 4,
            "Ring_Left_RingFinger_Silver", 6,
        	}
    	}
--
    	ProceduralDistributions.list.TissueBox = {
        	rolls = 5,
        	items = {
                "Tissue", 100,
        	}
    	}
--
    	ProceduralDistributions.list.PenHolder = {
        	rolls = 4,
        	items = {
            "Pencil", 20,
            "Pencil", 10,
            "Eraser", 20,
            "Eraser", 10,
            "BluePen", 20,
            "BluePen", 10,
            "RedPen", 20,
            "RedPen", 10,
            "Pen", 20,
            "Pen", 10,
            "Crayons", 20,
            "Crayons", 10,
        	}
    	}
--
    	ProceduralDistributions.list.PaperTray = {
        	rolls = 4,
        	items = {
            "Notebook", 20,
            "Notebook", 20,
            "Notebook", 10,
            "Notebook", 10,
            "SheetPaper2", 50,
            "SheetPaper2", 20,
            "SheetPaper2", 20,
            "SheetPaper2", 10,
            "SheetPaper2", 10,
        	}
    	}
--
    	ProceduralDistributions.list.ToolBox = {
        	rolls = 4,
        	items = {
            "DuctTape", 8,
            "Hammer", 10,
            "NailsBox", 10,
            "Padlock", 3,
            "Rope", 10,
            "Screwdriver", 10,
            "ScrewsBox", 8,
            "Twine", 10,
            "Wire", 10,
            "Woodglue", 8,
            "Wrench", 8,
        	}
    	}
--
    	ProceduralDistributions.list.MakeupOrganizer = {
        	rolls = 4,
        	items = {
            "Comb", 4,
            "Lipstick", 6,
            "MakeupEyeshadow", 6,
            "MakeupFoundation", 6,
            "Mirror", 8,
            "Tweezers", 10,
        	}
    	}
--
    	ProceduralDistributions.list.KeyLocker = {
        	rolls = 4,
        	items = {
            "Key1", 3,
            "Key2", 3,
            "Key3", 3,
            "Key4", 3,
            "Key5", 3,
        	}
    	}
--
end

Events.OnPreDistributionMerge.Add(Erikas_Tiles.preDistributionMerge)
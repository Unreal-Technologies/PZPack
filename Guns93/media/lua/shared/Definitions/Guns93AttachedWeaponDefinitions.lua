require "Definitions/AttachedWeaponDefinitions"

AttachedWeaponDefinitions.BayonetBack = {
    chance = 0.5,
    weaponLocation = {"Knife in Back"},
    bloodLocations = {"Back"},
    addHoles = false,
    daySurvived = 40,
    weapons = {
    },
}

AttachedWeaponDefinitions.BayonetLeftLeg = {
    chance = 0.5,
    weaponLocation = {"Knife Left Leg"},
    bloodLocations = {"UpperLeg_L"},
    addHoles = false,
    daySurvived = 40,
    weapons = {
    },
}

AttachedWeaponDefinitions.BayonetRightLeg = {
    chance = 0.5,
    weaponLocation = {"Knife Right Leg"},
    bloodLocations = {"UpperRight_L"},
    addHoles = false,
    daySurvived = 40,
    weapons = {
    },
}

AttachedWeaponDefinitions.BayonetShoulder = {
    chance = 0.5,
    weaponLocation = {"Knife Shoulder"},
    bloodLocations = {"UpperArm_L", "Torso_Upper"},
    addHoles = false,
    daySurvived = 40,
    weapons = {
    },
}

AttachedWeaponDefinitions.BayonetStomach = {
    chance = 0.5,
    weaponLocation = {"Knife Stomach"},
    bloodLocations = {"Torso_Lower", "Back"},
    addHoles = false,
    daySurvived = 40,
    weapons = {
    },
}

    -- Militia long guns
    AttachedWeaponDefinitions.militiaLongGunGuns93 = {
        id = "militiaLongGunGuns93",
        chance = 75,
        outfit = {"PrivateMilitia"},
        weaponLocation =  {"Rifle On Back"},
        bloodLocations = nil,
        addHoles = false,
        daySurvived = 0,
        weapons = {
        },
    }

	AttachedWeaponDefinitions.militiaknivesBeltGuns93 = {
		chance = 50,
		outfit = {"Survivalist", "Survivalist02", "Survivalist03", "PrivateMilitia"},
		weaponLocation = {"Belt Right Upside"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		weapons = {
		},
	}
	
	-- Survivor Handguns
	AttachedWeaponDefinitions.handgunSurvivorGuns93 = {
		id = "handgunSurvivorGuns93",
		chance = 10,
		outfit = {"Survivalist", "Survivalist02", "Survivalist03", "PrivateMilitia"},
		weaponLocation =  {"Holster Right"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		ensureItem = "Base.HolsterSimple",
		weapons = {
		},
	}

	-- Survivor long guns
	AttachedWeaponDefinitions.survivorLongGunGuns93 = {
		id = "survivorLongGunGuns93",
		chance = 25,
		outfit = {"Survivalist", "Survivalist02", "Survivalist03"},
		weaponLocation =  {"Rifle On Back"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		weapons = {
		},
	}

		-- Rare Survivor long guns
	AttachedWeaponDefinitions.rareSurvivorLongGunGuns93 = {
		id = "rareSurvivorLongGunGuns93",
		chance = 10,
		outfit = {"Survivalist", "Survivalist02", "Survivalist03"},
		weaponLocation =  {"Rifle On Back"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		weapons = {
		},
	}
	
		-- survivor weapon loadout
	AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Survivalist = {
		chance = 50;
		maxitem = 3;
		weapons = {
			AttachedWeaponDefinitions.handgunSurvivornGuns93,
			AttachedWeaponDefinitions.survivorLongGunGuns93,
			AttachedWeaponDefinitions.rareSurvivorLongGunGuns93,
			AttachedWeaponDefinitions.knivesBelt,
			AttachedWeaponDefinitions.militiaknivesBeltGuns93,
		},
	}

	AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Survivalist02 = {
		chance = 50;
		maxitem = 3;
		weapons = {
			AttachedWeaponDefinitions.handgunSurvivornGuns93,
			AttachedWeaponDefinitions.survivorLongGunGuns93,
			AttachedWeaponDefinitions.rareSurvivorLongGunGuns93,
			AttachedWeaponDefinitions.knivesBelt,
			AttachedWeaponDefinitions.militiaknivesBeltGuns93,
		},
	}

	AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Survivalist03 = {
		chance = 50;
		maxitem = 3;
		weapons = {
			AttachedWeaponDefinitions.handgunSurvivornGuns93,
			AttachedWeaponDefinitions.survivorLongGunGuns93,
			AttachedWeaponDefinitions.rareSurvivorLongGunGuns93,
			AttachedWeaponDefinitions.knivesBelt,
			AttachedWeaponDefinitions.militiaknivesBeltGuns93,
		},
	}

	AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PrivateMilitia = {
		chance = 50;
		maxitem = 3;
		weapons = {
			AttachedWeaponDefinitions.militiaLongGunGuns93,
			AttachedWeaponDefinitions.handgunSurvivornGuns93,
			AttachedWeaponDefinitions.militiaknivesBeltGuns93,
			AttachedWeaponDefinitions.nightstick,
		},
	}

	-- Handguns for bikers
	AttachedWeaponDefinitions.handgunBikerGuns93= {
		id = "handgunBikerGuns93",
		chance = 50,
		outfit = {"Biker"},
		weaponLocation =  {"Holster Right"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		ensureItem = "Base.HolsterSimple",
		weapons = {
		},
	}
	
	-- Handguns for bikers

	AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Biker = {
		chance = 50;
		maxitem = 1;
		weapons = {
			AttachedWeaponDefinitions.handgunBikerGuns93,
		},
	}

	-- M9 for Army
	AttachedWeaponDefinitions.handgunArmyGuns93 = {
		id = "handgunArmyGuns93",
		chance = 40,
		outfit = {"ArmyCamoDesert", "ArmyCamoGreen", "ArmyInstructor", "Ghillie"},
		weaponLocation =  {"Holster Right"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		ensureItem = "Base.HolsterSimple",
		weapons = {
		},
	}

	-- Army Long Guns
	AttachedWeaponDefinitions.longGunArmyGuns93 = {
		id = "longGunArmyGuns93",
		chance = 40,
		outfit = {"ArmyCamoDesert", "ArmyCamoGreen"},
		weaponLocation =  {"Rifle On Back"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		weapons = {
		},
	}

		-- Army Rare Long Guns
		AttachedWeaponDefinitions.RarelongGunArmyGuns93 = {
			id = "RarelongGunArmyGuns93",
			chance = 40,
			outfit = {"ArmyCamoDesert", "ArmyCamoGreen", "ArmyInstructor"},
			weaponLocation =  {"Rifle On Back"},
			bloodLocations = nil,
			addHoles = false,
			daySurvived = 0,
			weapons = {
			},
		}

	-- Sniper
	AttachedWeaponDefinitions.ArmySniperGuns93 = {
		id = "ArmySniperGuns93",
		chance = 10,
		outfit = {"Ghillie"},
		weaponLocation =  {"Rifle On Back"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		weapons = {
		},
	}

	-- Military Knives
	AttachedWeaponDefinitions.armyknivesBeltGuns93 = {
		chance = 50,
		outfit = {"ArmyCamoDesert", "ArmyCamoGreen", "ArmyInstructor", "Ghillie"},
		weaponLocation = {"Belt Right Upside"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		weapons = {
		},
	}

	
	-- Army --
	AttachedWeaponDefinitions.attachedWeaponCustomOutfit.ArmyCamoDesert = {
		chance = 40;
		maxitem = 3;
		weapons = {
			AttachedWeaponDefinitions.handgunArmyGuns93,
			AttachedWeaponDefinitions.longGunArmyGuns93,
			AttachedWeaponDefinitions.armyknivesBeltGuns93,
		},
	}

	AttachedWeaponDefinitions.attachedWeaponCustomOutfit.ArmyCamoGreen = {
		chance = 40;
		maxitem = 3;
		weapons = {
			AttachedWeaponDefinitions.handgunArmyGuns93,
			AttachedWeaponDefinitions.longGunArmyGuns93,
			AttachedWeaponDefinitions.ArmySniperGuns93,
			AttachedWeaponDefinitions.armyknivesBeltGuns93,
		},
	}

	AttachedWeaponDefinitions.attachedWeaponCustomOutfit.ArmyInstructor = {
		chance = 30;
		maxitem = 3;
		weapons = {
			AttachedWeaponDefinitions.handgunArmyGuns93,
			AttachedWeaponDefinitions.RarelongGunArmyGuns93,
			AttachedWeaponDefinitions.armyknivesBeltGuns93,
		},
	}

	AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Ghillie = {
		chance = 10;
		maxitem = 2;
		weapons = {
			AttachedWeaponDefinitions.handgunArmyGuns93,
			AttachedWeaponDefinitions.longGunArmyGuns93,
			AttachedWeaponDefinitions.ArmySniperGuns93,
		},
	}

	-- Handguns for Police
	AttachedWeaponDefinitions.policeHandgunGuns93 = {
		id = "policeHandgunGuns93",
		chance = 50,
		outfit = {"Police", "PoliceState", "PoliceRiot", "PrisonGuard"},
		weaponLocation =  {"Holster Right"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		ensureItem = "Base.HolsterSimple",
		weapons = {
		},
	}

	-- Police Rem870s
	AttachedWeaponDefinitions.policeShotgunsGuns93 = {
		id = "policeShotgunsGuns93",
		chance = 40,
		outfit = {"Police", "PoliceState", "PoliceRiot"},
		weaponLocation =  {"Rifle On Back"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		weapons = {
		},
	}

	AttachedWeaponDefinitions.policeLongGunGuns93 = {
		id = "policeLongGunGuns93",
		chance = 20,
		outfit = {"Police", "PoliceState", "PoliceRiot"},
		weaponLocation =  {"Rifle On Back"},
		bloodLocations = nil,
		addHoles = false,
		daySurvived = 0,
		weapons = {
		},
	}
	
	-- Police --
	AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Police = {
		chance = 30;
		maxitem = 3;
		weapons = {
			AttachedWeaponDefinitions.policeHandgunGuns93,
			AttachedWeaponDefinitions.policeShotgunsGuns93,
			AttachedWeaponDefinitions.policeLongGunGuns93,
			AttachedWeaponDefinitions.nightstick,
		},
	}

	AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceState = {
		chance = 40;
		maxitem = 3;
		weapons = {
			AttachedWeaponDefinitions.policeHandgunGuns93,
			AttachedWeaponDefinitions.policeShotgunsGuns93,
			AttachedWeaponDefinitions.policeLongGunGuns93,
			AttachedWeaponDefinitions.nightstick,

		},
	}

	AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceRiot = {
		chance = 50;
		maxitem = 3;
		weapons = {
			AttachedWeaponDefinitions.policeHandgunGuns93,
			AttachedWeaponDefinitions.policeShotgunsGuns93,
			AttachedWeaponDefinitions.policeLongGunGuns93,
			AttachedWeaponDefinitions.nightstick,
		},
	}

Events.OnPreDistributionMerge.Add(modifyAllLootTables)
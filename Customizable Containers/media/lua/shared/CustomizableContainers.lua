local function AlterItemProperties()

    local supportedmodsTable = {
    { backpack = CContainers.Backpacks, bag = CContainers.Bags, fannyPack = CContainers.FannyPacks, satchel = CContainers.Satchels },
    { modID = "AdvancedWarfareEX", bag = CContainers.BagsAdvancedWarfareEX },
    { modID = "AliceSPack", backpack = CContainers.BackpacksAliceSPack, bag = CContainers.BagsAliceSPack, fannyPack = CContainers.FannyPacksAliceSPack },
    { modID = "AlicesMultiWearVanilla", backpack = CContainers.BackpacksDuffelTweak },
    { modID = "AmmoMaker", bag = CContainers.BagsAmmoMaker },
    { modID = "Ammo_Pouch", chestRig = CContainers.ChestRigsAmmoPouch },
    { modID = "ArmedTacticalClothing", backpack = CContainers.BackpacksTacClothing, fannyPack = CContainers.FannyPacksTacClothing },
    { modID = "Authentic Z - Current", backpack = CContainers.BackpacksAuthZ, bag = CContainers.BagsAuthZ, chestRig = CContainers.ChestRigsAuthZ, fannyPack = CContainers.FannyPacksAuthZ, satchel = CContainers.SatchelsAuthZ },
    { modID = "AuthenticZBackpacks+", backpack = CContainers.BackpacksAuthZB, bag = CContainers.BagsAuthZB, chestRig = CContainers.ChestRigsAuthZB, fannyPack = CContainers.FannyPacksAuthZB, satchel = CContainers.SatchelsAuthZB },
    { modID = "AuthenticZLite", backpack = CContainers.BackpacksAuthZLite, bag = CContainers.BagsAuthZLite, chestRig = CContainers.ChestRigsAuthZLite, fannyPack = CContainers.FannyPacksAuthZLite },
    { modID = "B4BetterBackspacks", backpack = CContainers.BackpacksB4BetterBackspacks },
    { modID = "BB_SimpleBindle", bag = CContainers.BagsBindle },
    { modID = "BasedBackpack", backpack = CContainers.BackpacksBased },
    { modID = "Better Belts", backpack = CContainers.BagsBetterBelts },
    { modID = "BiancaInABox", bag = CContainers.BagsBBoxes },
    { modID = "BraStorage", chestRig = CContainers.ChestRigsBraStorage },
    { modID = "Brita_2", backpack = CContainers.BackpacksBrita, chestRig = CContainers.ChestRigsBrita, fannyPack = CContainers.FannyPacksBrita },
    { modID = "ClothesBoxRedux", backpack = CContainers.BackpacksClothesBOX, bag = CContainers.BagsClothesBOX, chestRig = CContainers.ChestRigsClothesBOX, fannyPack = CContainers.FannyPacksClothesBOX },
    { modID = "DRK_1", fannyPack = CContainers.FannyPacksUSMC },
    { modID = "DivisionBackpack", backpack = CContainers.BackpacksDivision },
    { modID = "ExpandedHelicopterEvents", chestRig = CContainers.ChestRigsEHE },
    { modID = "H_E_C_U", backpack = CContainers.BackpacksHECU, fannyPack = CContainers.FannyPacksHECU },
    { modID = "Hydrocraft", backpack = CContainers.BackpacksHydrocraft, bag = CContainers.BagsHydrocraft, fannyPack = CContainers.FannyPacksHydrocraft },
    { modID = "ImprovisedBackpacks", backpack = CContainers.BackpacksImprovB },
    { modID = "Insurgent", backpack = CContainers.BackpacksInsurgent },
    { modID = "KATTAJ1_Military", backpack = CContainers.BackpacksKATTAJ, fannyPack = CContainers.FannyPacksKATTAJ },
    { modID = "KuromiBackpack", backpack = CContainers.BackpacksHelloKitty },
    { modID = "LeGourmetRevolution", bag = CContainers.BagsLeRevolution },
    { modID = "Lite Backpack", backpack = CContainers.BackpacksLiteBackpack },
    { modID = "MilitaryClothingChange", backpack = CContainers.BackpacksMCC },
    { modID = "Militek_Faction_Clothing", backpack = CContainers.BackpacksMilitekFactionClothing, chestRig = CContainers.ChestRigsMilitekFactionClothing },
    { modID = "ModifiedBags", backpack = CContainers.BackpacksModified, bag = CContainers.BagsModified, fannyPack = CContainers.FannyPacksModified },
    { modID = "MonmouthCounty_new", backpack = CContainers.BackpacksMonmouth, bag = CContainers.BagsMonmouthCountynew },
    { modID = "More Bags", backpack = CContainers.BackpacksMoreBags, fannyPack = CContainers.FannyPacksMoreBags },
    { modID = "OCP Gear", backpack = CContainers.BackpacksOCP, chestRig = CContainers.ChestRigsOCP },
    { modID = "OMS", backpack = CContainers.BackpacksOMS },
    { modID = "P4MySoCalledBag", backpack = CContainers.BackpacksP4MySoCalledBag },
    { modID = "P4PumpPury", Misc = CContainers.MiscP4PumpPury, backpack = CContainers.BackpacksPumpPury, bag = CContainers.BagsPumpPury, fannyPack = CContainers.FannyPacksPumpPury },
    { modID = "PLLoot", backpack = CContainers.BackpacksPaw, chestRig = CContainers.ChestRigsPaw, fannyPack = CContainers.FannyPacksPaw },
    { modID = "Pitstop", backpack = CContainers.BackpacksPitstop, fannyPack = CContainers.FannyPacksPitstop },
    { modID = "REMOD", backpack = CContainers.BackpacksREMOD },
    { modID = "ReModVaccinDrReapersMP", fannyPack = CContainers.SatchelsTheyKnew },
    { modID = "SLEO", backpack = CContainers.BackpacksSLEO, chestRig = CContainers.ChestRigsSLEO, fannyPack = CContainers.FannyPacksSLEO },
    { modID = "SMUI", backpack = CContainers.BackpacksSMUI, chestRig = CContainers.ChestRigsSMUI, fannyPack = CContainers.FannyPacksSMUI },
    { modID = "STFR", backpack = CContainers.BackpacksSTR, fannyPack = CContainers.FannyPacksSTFR, satchel = CContainers.SatchelsSTR },
    { modID = "SameBagDifferentColor41", backpack = CContainers.BackpacksSBDC },
    { modID = "SavottaBackpacks", backpack = CContainers.BackpacksSavotta },
    { modID = "ScrapArmor(new version)", backpack = CContainers.BackpacksScrapArmor, fannyPack = CContainers.FannyPacksScrapArmor },
    { modID = "Simplesling", chestRig = CContainers.ChestRigsSimplesling },
    { modID = "SnakeClothingMod", backpack = CContainers.BackpacksSnakeClothing, bag = CContainers.BagsSnakeClothingMod },
    { modID = "StalkerArmorPack", chestRig = CContainers.ChestRigsStalker, fannyPack = CContainers.FannyPacksStalker },
    { modID = "Survivalist_hiking_bags", backpack = CContainers.BackpacksSurvivalisthikingbags },
    { modID = "Survivalist_hiking_bags_solid", backpack = CContainers.BackpacksSurvivalisthikingbags },
    { modID = "Survivalist_hiking_bags_camo", backpack = CContainers.BackpacksSurvivalisthikingbags },
    { modID = "Swatarmor", backpack = CContainers.BackpacksSWAT, fannyPack = CContainers.FannyPacksSWAT },
    { modID = "Swatpack", backpack = CContainers.BackpacksSWAT, fannyPack = CContainers.FannyPacksSWAT },
    { modID = "TLOUClothingFEDRA", backpack = CContainers.BackpacksTLOUClothingFEDRA },
    { modID = "TLOUClothingSeraphites", backpack = CContainers.BackpacksTLOUClothingSeraphites, fannyPack = CContainers.FannyPacksTLOUClothingSeraphites },
    { modID = "Tactical Multicam", fannyPack = CContainers.FannyPacksTacCam },
    { modID = "TheWorkshop(new version)", Misc = CContainers.MiscTheWorkshopnewversion, fannyPack = CContainers.FannyPacksWorkshop },
    { modID = "TheyKn0w", fannyPack = CContainers.SatchelsTheyKnew },
    { modID = "TheyKnew", fannyPack = CContainers.SatchelsTheyKnew },
    { modID = "ToadTraits", backpack = CContainers.BackpacksMoreTraits },
    { modID = "TwoWeaponsOnBackModdedBags", backpack = CContainers.BackpacksTWOB },
    { modID = "USMilitaryPack", backpack = CContainers.BackpacksUSMilitaryPack, chestRig = CContainers.ChestRigsUSMilitaryPack },
    { modID = "UndeadSuvivor", backpack = CContainers.BackpacksUndeadS, bag = CContainers.BagsUndeadS, chestRig = CContainers.ChestRigsUndeadS, fannyPack = CContainers.FannyPacksUndeadS },
    { modID = "WCTP", fannyPack = CContainers.FannyPacksWCTP },
    { modID = "WPA", bag = CContainers.BagsWPA },
    { modID = "Zombie Hunter Backpack", backpack = CContainers.BackpacksZombieHunterBackpack },
    { modID = "[J&G] Alpine Multicam Uniform", backpack = CContainers.BackpacksJGAlpineMulticamUniform },
    { modID = "[J&G] Black Multicam Uniform", backpack = CContainers.BackpacksJGBlackMulticamUniform },
    { modID = "[J&G] Caution Pack", backpack = CContainers.BackpacksJGCautionPack, fannyPack = CContainers.FannyPacksJGCautionPack },
    { modID = "[J&G] Desert Multicam Uniform", backpack = CContainers.BackpacksJGDesertMulticamUniform },
    { modID = "[J&G] Forest Multicam Uniform", backpack = CContainers.BackpacksJGForestMulticamUniform },
    { modID = "[J&G] SWAT Uniform", backpack = CContainers.BackpacksJGSWATUniform },
    { modID = "[J&G] Trauma Responder Uniform", backpack = CContainers.BackpacksJGTraumaResponderUniform, chestRig = CContainers.ChestRigsJGTraumaResponderUniform },
    { modID = "combine_backpacks", backpack = CContainers.BackpacksCBackpacks },
    { modID = "gothBags", backpack = CContainers.BackpacksGoth, fannyPack = CContainers.FannyPacksGoth, satchel = CContainers.SatchelsGoth },
    { modID = "nattachments", backpack = CContainers.BackpacksNoir },
    { modID = "newcontainersnc", Misc = CContainers.Miscnewcontainersnc, bag = CContainers.BagsFOOL, fannyPack = CContainers.FannyPacksFOOL },
    { modID = "sleepingbagsandattachments", backpack = CContainers.BackpacksSBagAttach, bag = CContainers.BagsSBagAttach },
    { modID = "tactorgsol", Misc = CContainers.Misctactorgsol },
    { modID = "zReArmorPackBYKK", backpack = CContainers.BackpackszReArmor, chestRig = CContainers.ChestRigszReArmor },
    { modID = "zReDRK_1", fannyPack = CContainers.FannyPacksUSMC },
    { modID = "zReModVaccin20byk", backpack = CContainers.BackpackszReModVaccin20byk, chestRig = CContainers.ChestRigszReModVaccin20byk }
    }

    for _, v in ipairs(supportedmodsTable) do
        CCalterWeightReduction(v.modID, v.backpack, v.bag, v.chestRig, v.fannyPack, v.satchel)
        CCalterCapacity(v.modID, v.backpack, v.bag, v.chestRig, v.fannyPack, v.satchel)
        CCalterWeight(v.modID, v.backpack, v.bag, v.chestRig, v.fannyPack, v.satchel)
        CCalterRunSpeedModifier(v.modID, v.backpack, v.bag, v.chestRig, v.fannyPack, v.satchel)
        CCalterSatchelPositioning(v.modID, v.satchel)
    end
end

Events.OnSpawnRegionsLoaded.Add(AlterItemProperties)
Events.OnLoad.Add(AlterItemProperties)


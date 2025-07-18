CContainers = {}

function container(itemName, weightReduction, capacity, weight, weightReductionWB, weightReductionB, capacityWB, capacityB)
    return {
        ItemName = itemName,
        WeightReduction = weightReduction,
        Capacity = capacity,
        Weight = weight,
        WeightReductionWB = weightReductionWB,
        WeightReductionB = weightReductionB,
        CapacityWB = capacityWB,
        CapacityB = capacityB
    }
end

function vehicle_part(itemName, weight)
    return {
        ItemName = itemName,
        Weight = weight
    }
end

function vehicle_storage(itemName, maxCapacity, weight, maxCapacityB, maxCapacityBoost)
    return {
        ItemName = itemName,
        MaxCapacity = maxCapacity,
        Weight = weight,
        MaxCapacityB = maxCapacityB,
        MaxCapacityBoost = maxCapacityBoost
    }
end

CContainers.Backpacks = {
    container("Bag_Schoolbag", 60, 15, 1, 66, 70, 18, 20),
    container("Bag_NormalHikingBag", 70, 20, 1.2, 80, 85, 25, 26),
    container("Bag_BigHikingBag", 80, 22, 1.5, 87, 90, 29, 28),
    container("Bag_SurvivorBag", 85, 27, 2, 88, 95, 30, 35),
    container("Bag_ALICEpack", 85, 27, 2, 88, 95, 30, 35),
    container("Bag_ALICEpack_Army", 87, 28, 2, 89, 95, 30, 35),
    container("Bag_ALICEpack_DesertCamo", 87, 28, 2, 89, 95, 30, 35),
    container("Bag_WeaponBag", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_InmateEscapedBag", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_MoneyBag", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_WorkerBag", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_DuffelBag", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_DuffelBagTINT", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_MedicalBag", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_Military", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_ToolBag", 65, 18, 1, 72, 80, 28, 23),
    container("KeyRing", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_CarDealer", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_Bass", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_BlueFox", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_Bug", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_Clover", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_EagleFlag", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_EightBall", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_Hotdog", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_Kitty", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_Large", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_Nolans", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_Panther", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_PineTree", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_PrayingHands", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_RabbitFoot", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_RainbowStar", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_RubberDuck", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_SecurityPass", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_Sexy", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_Spiffos", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_StinkyFace", 95, 1, 0, 97, 99, 2, 5),
    container("KeyRing_WestMaple", 95, 1, 0, 97, 99, 2, 5),
    container("Bag_GolfBag", 65, 18, 1.2, 70, 75, 26, 23),
    container("Bag_ShotgunBag", 65, 18, 1, 70, 75, 27, 23),
    container("Bag_ShotgunSawnoffBag", 65, 18, 1, 70, 75, 27, 23),
    container("Bag_ShotgunDblBag", 65, 18, 1, 70, 75, 27, 23),
    container("Bag_ShotgunDblSawnoffBag", 65, 18, 1, 70, 75, 27, 23),
    container("Bag_Schoolbag_Kids", 60, 15, 1, 66, 70, 18, 20),
    container("Bag_BreakdownBag", 65, 18, 1, 68, 72, 19, 22),
    container("Bag_Sheriff", 65, 18, 1, 70, 75, 27, 23),
    container("Bag_Police", 65, 18, 1, 70, 75, 27, 23),
    container("Bag_SWAT", 65, 18, 1, 70, 75, 27, 23),
    container("Bag_Schoolbag_Patches", 60, 15, 1, 66, 70, 18, 20),
    container("Bag_Schoolbag_Travel", 60, 15, 1, 66, 70, 18, 20),
    container("Bag_Schoolbag_Medical", 60, 15, 1, 66, 70, 18, 20),
    container("Bag_BigHikingBag_Travel", 80, 22, 1.5, 87, 90, 29, 28),
    container("Bag_HikingBag_Travel", 70, 20, 1.2, 80, 85, 25, 26),
    container("Bag_BaseballBag", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_TennisBag", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_FoodCanned", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_FoodSnacks", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_SheetSlingBag", 60, 12, 0.8, 65, 68, 13, 14),
    container("Bag_HideSlingBag", 60, 14, 0.8, 65, 68, 14, 15),
    container("Bag_CrudeLeatherBag", 65, 14, 1, 68, 70, 14, 15),
    container("KeyRing_Forged_Silver", 85, 1, 0.05, 90, 99, 2, 3),
    container("KeyRing_Forged_Gold", 85, 1, 0.05, 90, 99, 2, 3),
    container("KeyRing_Forged", 85, 1, 0.05, 90, 99, 2, 3),
    container("Bag_HydrationBackpack_Camo", 85, 12, 1, 87, 90, 13, 15),
    container("Bag_HydrationBackpack", 85, 12, 1, 87, 90, 13, 15),
    container("Bag_TarpFramepack_Large", 70, 20, 2, 72, 76, 24, 27),
    container("Bag_TarpFramepack_Small", 65, 15, 1.5, 74, 78, 18, 20),
    container("Bag_CraftedFrame_Large3", 75, 35, 4, 76, 78, 35, 37),
    container("Bag_CraftedFrame_Large2", 80, 25, 3, 82, 88, 27, 31),
    container("Bag_CraftedFramepack_Large3", 75, 35, 4, 76, 78, 35, 37),
    container("Bag_CraftedFramepack_Large2", 80, 25, 3, 82, 88, 27, 31),
    container("Bag_CraftedFramepack_Small", 70, 15, 1.5, 75, 78, 16, 18),
    container("Bag_CraftedFramepack_Large", 75, 20, 2, 78, 82, 85, 22),
    container("Bag_TarpSlingBag", 55, 12, 0.8, 65, 70, 13, 15),
    container("Bag_TarpSack", 50, 20, 0.5, 60, 68, 23, 24),
    container("Bag_HideSack", 50, 20, 0.5, 60, 69, 23, 24),
    container("Bag_CrudeTarpBag", 60, 14, 1, 70, 70, 16, 18),
    container("Bag_BurglarBag", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_GolfBag_Melee", 65, 18, 1.2, 72, 80, 28, 23)
}

CContainers.Bags = {
    container("Plasticbag", 30, 8, 0.1, 38, 40, 12, 12),
    container("Plasticbag_Clothing", 30, 8, 0.1, 38, 40, 12, 12),
    container("Plasticbag_Bags", 50, 8, 0.1, 52, 55, 9, 10),
    container("Garbagebag", 10, 20, 0.1, 23, 25, 22, 24),
    container("Bag_TrashBag", 50, 20, 0.1, 60, 65, 22, 24),
    container("Tote", 50, 12, 0.5, 65, 70, 15, 17),
    container("Tote_Bags", 50, 6, 0.5, 65, 74, 6, 7),
    container("Bag_Dancer", 50, 6, 0.5, 65, 72, 6, 7),
    container("Briefcase_Money", 50, 8, 0.5, 65, 70, 9, 10),
    container("Purse", 55, 12, 0.5, 65, 70, 13, 17),
    container("EmptySandbag", 10, 15, 0.1, 23, 25, 18, 20),
    container("Bag_DeadRats", 50, 15, 0.5, 65, 75, 18, 20),
    container("Bag_DeadMice", 50, 15, 0.5, 65, 75, 18, 20),
    container("Bag_DeadRoaches", 50, 15, 0.5, 65, 75, 18, 20),
    container("Bag_TreasureBag", 50, 15, 0.5, 65, 75, 18, 20),
    container("Suitcase", 50, 16, 3, 65, 70, 18, 20),
    container("Handbag", 40, 8, 1, 45, 50, 11, 12),
    container("Toolbox", 15, 8, 2, 23, 35, 11, 12),
    container("Toolbox_Farming", 15, 8, 2, 23, 35, 11, 12),
    container("Toolbox_Wooden", 15, 8, 2, 23, 35, 11, 12),
    container("Toolbox_Fishing", 15, 8, 2, 23, 35, 11, 12),
    container("Toolbox_Gardening", 15, 8, 2, 23, 35, 11, 12),
    container("FirstAidKit", 5, 4, 1, 35, 55, 5, 6),
    container("FirstAidKit_New", 50, 4, 1, 55, 60, 5, 6),
    container("FirstAidKit_NewPro", 50, 4, 1, 55, 62, 5, 6),
    container("FirstAidKit_Camping", 50, 2, 0.3, 55, 62, 2, 3),
    container("FirstAidKit_Military", 50, 2, 0.3, 55, 65, 2, 3),
    container("HalloweenCandyBucket", 50, 2, 0.5, 55, 68, 2, 3),
    container("MakeupCase_Professional", 50, 4, 1, 55, 60, 5, 6),
    container("Cashbox", 50, 2, 0.5, 55, 60, 3, 4),
    container("ToolRoll_Leather", 50, 4, 0.5, 55, 65, 4, 5),
    container("ToolRoll_Fabric", 50, 4, 0.5, 53, 62, 4, 5),
    container("Hatbox", 50, 1, 0.5, 55, 60, 1, 2),
    container("Shoebox", 50, 1, 0.5, 55, 60, 1, 2),
    container("PhotoAlbum", 50, 2, 0.5, 55, 60, 3, 4),
    container("PhotoAlbum_Old", 50, 2, 0.5, 55, 60, 3, 4),
    container("Bag_ProtectiveCase", 50, 7, 1, 55, 60, 7, 8),
    container("Bag_ProtectiveCase_Survivalist", 50, 7, 1, 55, 60, 7, 8),
    container("Bag_ProtectiveCase_Tools", 50, 7, 1, 55, 60, 7, 8),
    container("Bag_ProtectiveCaseMilitary", 50, 7, 1, 55, 60, 7, 8),
    container("Bag_ProtectiveCaseMilitary_Medical", 50, 7, 1, 55, 60, 7, 8),
    container("Bag_ProtectiveCaseMilitary_Tools", 50, 7, 1, 55, 60, 7, 8),
    container("Bag_ProtectiveCaseSmall", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseSmall_Armorer", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseSmall_Electronics", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseSmall_Survivalist", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseSmall_WalkieTalkie", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseSmall_WalkieTalkiePolice", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseSmall_FirstAid", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseSmall_Pistol1", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseSmall_Pistol2", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseSmall_Pistol3", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseSmall_Revolver1", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseSmall_Revolver2", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseSmall_Revolver3", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseSmallMilitary", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseSmallMilitary_WalkieTalkie", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseSmallMilitary_FirstAid", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseSmallMilitary_Pistol1", 50, 4, 1, 55, 60, 5, 6),
    container("Bag_ProtectiveCaseBulky", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulky_SCBA", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulky_Audio", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulky_HAMRadio1", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulkyAmmo", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulkyAmmo_556", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulkyAmmo_223", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulkyAmmo_308", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulkyAmmo_ShotgunShells", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulkyAmmo_9mm", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulkyAmmo_38", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulkyAmmo_44", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulkyAmmo_45", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulkyAmmo_Hunting", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulkyMilitary", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulky_Survivalist", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulkyMilitary_HAMRadio2", 50, 16, 1, 55, 64, 17, 19),
    container("Bag_ProtectiveCaseBulkyHazard", 50, 16, 1, 55, 64, 17, 19),
    container("Lunchbox", 5, 4, 1, 40, 55, 6, 6),
    container("Lunchbox2", 5, 4, 1, 40, 55, 6, 6),
    container("Flightcase", 20, 5, 1, 40, 45, 9, 9),
    container("Guitarcase", 20, 5, 1, 25, 30, 8, 9),
    container("Briefcase", 5, 7, 1.5, 12, 15, 11, 12),
    container("Bag_DoctorBag", 50, 8, 1, 60, 70, 9, 10),
    container("Cooler", 5, 8, 1.5, 12, 15, 11, 12),
    container("Cooler_Beer", 50, 12, 1.5, 55, 60, 12, 13),
    container("Cooler_Meat", 50, 12, 1.5, 55, 60, 12, 13),
    container("Cooler_Soda", 50, 12, 1.5, 55, 60, 12, 13),
    container("Cooler_Seafood", 50, 12, 1.5, 55, 60, 12, 13),
    container("PistolCase1", 5, 7, 0.5, 13, 15, 10, 11),
    container("PistolCase2", 5, 7, 0.5, 13, 15, 10, 11),
    container("PistolCase3", 5, 7, 0.5, 13, 15, 10, 11),
    container("SeedBag", 50, 5, 0.1, 35, 40, 9, 9),
    container("SeedBag_Farming", 50, 5, 0.1, 35, 40, 9, 9),
    container("SewingKit", 30, 5, 0.1, 35, 40, 9, 9),
    container("RevolverCase1", 5, 7, 0.5, 13, 15, 10, 11),
    container("RevolverCase2", 5, 7, 0.5, 13, 15, 10, 11),
    container("RevolverCase3", 5, 7, 0.5, 13, 15, 10, 11),
    container("Bag_JanitorToolbox", 15, 8, 2, 23, 25, 11, 12),
    container("Toolbox_Mechanic", 15, 8, 2, 23, 25, 11, 12),
    container("Bag_BowlingBallBag", 20, 8, 1, 27, 30, 11, 12),
    container("ShotgunCase1", 20, 7, 1, 35, 45, 8, 9),
    container("GroceryBag1", 30, 8, 0.1, 40, 55, 9, 10),
    container("GroceryBag2", 30, 8, 0.1, 40, 55, 9, 10),
    container("GroceryBag3", 30, 8, 0.1, 40, 55, 9, 10),
    container("GroceryBag4", 30, 8, 0.1, 40, 55, 9, 10),
    container("GroceryBag5", 30, 8, 0.1, 40, 55, 9, 10),
    container("GroceryBagGourmet", 30, 8, 0.1, 40, 55, 9, 10),
    container("RifleCase1", 20, 7, 1, 35, 50, 8, 10),
    container("RifleCase2", 20, 7, 1, 35, 50, 8, 9),
    container("RifleCase3", 20, 7, 1, 35, 50, 8, 9),
    container("Bag_RifleCaseCloth", 65, 7, 1, 70, 80, 8, 9),
    container("Bag_RifleCaseCloth2", 65, 7, 1, 70, 80, 8, 9),
    container("Bag_RifleCase", 50, 7, 1, 65, 75, 8, 9),
    container("Bag_RifleCaseClothCamo", 65, 7, 1, 70, 80, 8, 9),
    container("Bag_RifleCase_Police", 50, 7, 1, 65, 75, 8, 9),
    container("Bag_RifleCase_Police2", 50, 7, 1, 65, 75, 8, 9),
    container("Bag_RifleCase_Police3", 50, 7, 1, 65, 75, 8, 9),
    container("Bag_RifleCaseGreen", 50, 7, 1, 65, 75, 8, 9),
    container("Bag_RifleCaseGreen2", 50, 7, 1, 65, 75, 8, 9),
    container("ShotgunCase2", 20, 7, 1, 35, 50, 8, 9),
    container("Bag_ShotgunCaseCloth", 65, 7, 1, 70, 80, 8, 9),
    container("Bag_ShotgunCaseCloth2", 65, 7, 1, 70, 80, 8, 9),
    container("Bag_ShotgunCase_Police", 50, 7, 1, 65, 75, 8, 9),
    container("Bag_ShotgunCaseGreen", 50, 7, 1, 65, 75, 8, 9),
    container("Bag_FluteCase", 50, 1, 1, 65, 75, 1, 2),
    container("Bag_ViolinCase", 50, 1, 1, 65, 75, 2, 3),
    container("Bag_TrumpetCase", 50, 1, 1, 65, 75, 2, 3),
    container("Bag_SaxophoneCase", 50, 3, 1, 65, 75, 3, 4),
    container("GemBag", 50, 1, 0.1, 60, 65, 2, 3),
    container("DiceBag", 30, 1, 0.1, 40, 50, 1, 2),
    container("TakeoutBox_Styrofoam", 50, 2, 0.3, 55, 58, 2, 2),
    container("TakeoutBox_Chinese", 50, 2, 0.3, 55, 58, 2, 2),
    container("PencilCase", 50, 1, 0.3, 52, 56, 1, 2),
    container("PencilCase_Gaming", 50, 1, 0.3, 52, 56, 1, 2),
    container("WheatSack", 50, 15, 0.1, 55, 60, 17, 20),
    container("Humidor", 50, 2, 1, 55, 60, 2, 3),
    container("CigarBox", 50, 2, 0.5, 55, 60, 2, 3),
    container("CigarBox_Gaming", 50, 2, 0.5, 55, 60, 2, 3),
    container("CigarBox_Keepsakes", 50, 2, 0.5, 55, 60, 2, 3),
    container("CigarBox_Kids", 50, 2, 0.5, 55, 60, 2, 3),
    container("CookieJar", 50, 2, 1, 55, 60, 2, 3),
    container("CookieJar_Bear", 50, 2, 1, 55, 60, 2, 3),
    container("JewelleryBox", 50, 2, 1, 55, 60, 2, 3),
    container("JewelleryBox_Fancy", 50, 2, 1, 55, 60, 2, 3),
    container("WheatSeedSack", 50, 15, 0.1, 55, 60, 17, 20),
    container("Paperbag_Spiffos", 10, 5, 0.1, 18, 26, 6, 7),
    container("Paperbag_Jays", 10, 5, 0.1, 18, 26, 6, 7),
    container("PaperBag", 10, 5, 0.1, 18, 26, 6, 7),
    container("Bag_FishingBasket", 50, 6, 1.5, 60, 62, 6, 7),
    container("Bag_GardenBasket", 50, 6, 1.5, 60, 62, 6, 7),
    container("Bag_PicnicBasket", 50, 6, 1.5, 60, 62, 6, 7),
    container("Bag_BirthdayBasket", 50, 6, 1.5, 60, 62, 6, 7),
    container("Bag_Gunny", 50, 20, 0.5, 60, 65, 22, 23),
    container("Bag_Laundry", 50, 20, 0.5, 60, 65, 22, 23),
    container("Bag_LaundryLinen", 50, 20, 0.5, 60, 65, 22, 23),
    container("Bag_LaundryHospital", 50, 20, 0.5, 60, 65, 22, 23),
    container("Bag_AmmoBox", 50, 6, 1, 60, 65, 7, 8),
    container("Bag_Mail", 50, 20, 0.5, 60, 65, 22, 23),
    container("Bag_AmmoBox_223", 50, 6, 1, 60, 65, 7, 8),
    container("Bag_AmmoBox_308", 50, 6, 1, 60, 65, 7, 8),
    container("Bag_AmmoBox_ShotgunShells", 50, 6, 1, 60, 65, 7, 8),
    container("Bag_AmmoBox_9mm", 50, 6, 1, 60, 65, 7, 8),
    container("Bag_AmmoBox_38", 50, 6, 1, 60, 65, 7, 8),
    container("Bag_AmmoBox_44", 50, 6, 1, 60, 65, 7, 8),
    container("Bag_AmmoBox_45", 50, 6, 1, 60, 65, 7, 8),
    container("Bag_AmmoBox_Mixed", 50, 6, 1, 60, 65, 7, 8),
    container("Bag_AmmoBox_Hunting", 50, 6, 1, 60, 65, 7, 8),
    container("Bag_AmmoBox_Hunting", 50, 6, 1, 60, 65, 7, 8),
    container("Tacklebox", 50, 6, 1.5, 60, 65, 7, 8),
    container("Wallet_Hide", 0, 1, 0.2, 0, 0, 2, 2),
    container("Wallet_Male", 0, 1, 0.2, 0, 0, 2, 2),
    container("Wallet_Female", 0, 1, 0.2, 0, 0, 2, 2),
    container("Wallet", 0, 1, 0.2, 0, 0, 2, 2),
    container("Lunchbag", 50, 2, 0.1, 55, 65, 2, 3),
    container("RifleCase4", 50, 7, 1, 52, 55, 8, 9),
    container("Tote_Clothing", 50, 6, 0.5, 54, 58, 7, 8),
    container("Bag_ProtectiveCaseSmall_KeyCutting", 50, 4, 1, 54, 56, 4, 5),
    container("FirstAidKit_Camping_New", 50, 2, 0.3, 55, 60, 5, 6)
}

CContainers.ChestRigs = {
    container("Bag_ChestRig", 85, 5, 0, 87, 90, 5, 6),
    container("Bag_ALICE_BeltSus", 80, 6, 0.1, 86, 89, 6, 7),
    container("Bag_ALICE_BeltSus_Camo", 80, 6, 0.1, 86, 89, 6, 7),
    container("Bag_ALICE_BeltSus_Green", 80, 6, 0.1, 86, 89, 6, 7),
    container("HolsterShoulder", 85, 1, 0.4, 87, 92, 1, 2),
    container("AmmoStrap_Brown_Shells", 85, 1, 0.4, 88, 92, 2, 3),
    container("AmmoStrap_Shells", 85, 1, 0.4, 88, 92, 2, 3),
    container("AmmoStrap_Bullets_308", 85, 1, 0.4, 88, 92, 2, 3),
    container("AmmoStrap_Bullets_223", 85, 1, 0.4, 88, 92, 2, 3),
    container("AmmoStrap_Brown_Bullets", 85, 1, 0.4, 88, 92, 2, 3),
    container("AmmoStrap_Bullets", 85, 1, 0.4, 88, 92, 2, 3),
    container("Bag_ChestRig_Tarp", 85, 5, 0.4, 87, 90, 5, 6)
}

CContainers.FannyPacks = {
    container("Bag_FannyPackFront", 50, 1, 0.2, 88, 90, 4, 4),
    container("Bag_FannyPackBack", 50, 1, 0.2, 88, 90, 4, 4),
    container("Bag_FannyPackFront_Hide", 50, 1, 0.2, 87, 90, 3, 4),
    container("Bag_FannyPackBack_Hide", 50, 1, 0.2, 87, 90, 3, 4),
    container("Bag_FannyPackBack_Tarp", 60, 1, 0.2, 89, 91, 2, 3),
    container("Bag_FannyPackFront_Tarp", 60, 1, 0.2, 89, 91, 2, 3)
}

CContainers.Satchels = {
    container("Bag_Satchel", 30, 15, 1, 87, 90, 15, 20),
    container("Bag_SatchelPhoto", 65, 12, 1, 88, 90, 13, 15),
    container("Bag_Satchel_Fishing", 65, 12, 1, 88, 90, 13, 15),
    container("Bag_Satchel_Medical", 65, 12, 1, 88, 90, 13, 15),
    container("Bag_Satchel_Military", 65, 12, 1, 88, 90, 13, 15),
    container("Bag_Satchel_Mail", 65, 12, 1, 88, 90, 13, 15),
    container("Bag_Satchel_Leather", 65, 12, 1, 88, 90, 13, 15),
    container("Bag_ClothSatchel_Burlap", 65, 12, 1, 88, 90, 13, 15),
    container("Bag_ClothSatchel_Cotton", 65, 12, 1, 88, 90, 13, 15),
    container("Bag_ClothSatchel_Denim", 65, 12, 1, 88, 90, 13, 15),
    container("Bag_ClothSatchel_DenimBlack", 65, 12, 1, 88, 90, 13, 15),
    container("Bag_ClothSatchel_DenimLight", 65, 12, 1, 88, 90, 13, 15),
    container("Bag_HideSatchel", 65, 12, 1, 88, 90, 13, 15)
}

CContainers.Misc = {
    container("ProduceBox_ExtraLarge", 0, 20, 1, 0, 0, 22, 25),
    container("ProduceBox_Large", 0, 10, 1, 0, 0, 11, 13),
    container("ProduceBox_Medium", 0, 5, 1, 0, 0, 5, 6),
    container("ProduceBox_Small", 0, 2, 1, 0, 0, 3, 4),
    container("ProduceBox_ExtraSmall", 0, 1, 1, 0, 0, 1, 2),
    container("HollowBook_Whiskey", 0, 2, 1, 0, 0, 2, 3),
    container("HollowBook_Valuables", 0, 2, 1, 0, 0, 2, 3),
    container("HollowBook_Prison", 0, 2, 1, 0, 0, 2, 3),
    container("HollowBook_Kids", 0, 2, 1, 0, 0, 2, 3),
    container("HollowBook_Handgun", 0, 2, 1, 0, 0, 2, 3),
    container("HollowFancyBook", 0, 2, 1, 0, 0, 2, 3),
    container("HollowBook", 0, 2, 1, 0, 0, 2, 3),
    container("Present_ExtraLarge", 0, 20, 1, 0, 0, 22, 23),
    container("Present_Large", 0, 10, 1, 0, 0, 11, 12),
    container("Present_Medium", 0, 5, 1, 0, 0, 5, 6),
    container("Present_Small", 0, 2, 1, 0, 0, 2, 3),
    container("Present_ExtraSmall", 0, 1, 1, 0, 0, 1, 1),
    container("Parcel_ExtraLarge", 0, 20, 1, 0, 0, 21, 23),
    container("Parcel_Large", 0, 10, 1, 0, 0, 11, 12),
    container("Parcel_Medium", 0, 5, 1, 0, 0, 5, 6),
    container("Parcel_Small", 0, 2, 1, 0, 0, 2, 3),
    container("Parcel_ExtraSmall", 0, 1, 1, 0, 0, 1, 1)
}

CContainers.BackpacksBrita = {
    container("Bag_Sniper_Pack", 85, 38, 2, 90, 95, 33, 37),
    container("Bag_ARVN_Rucksack", 85, 38, 2, 88, 90, 31, 36),
    container("Bag_ST53_Set", 85, 38, 2, 86, 90, 30, 36),
    container("Bag_SCBA", 85, 38, 2, 85, 90, 31, 35),
    container("Bag_ZIP", 85, 38, 2, 89, 95, 32, 37),
    container("Bag_SSO", 85, 38, 2, 90, 90, 30, 35),
    container("Bag_Savotta", 85, 38, 2, 86, 90, 30, 34),
    container("Bag_Bush", 85, 38, 2, 85, 90, 27, 35),
    container("Bag_Hunting", 85, 38, 2, 85, 95, 29, 34),
    container("Bag_Radio_Pack", 85, 38, 2, 92, 95, 22, 28),
    container("Bag_Tactical_Alice", 85, 38, 3, 90, 92, 31, 35),
    container("Bag_Cat_Pack", 85, 38, 3, 91, 95, 27, 30),
    container("Bag_Robbie_Pack", 85, 38, 3, 88, 90, 27, 30),
    container("Bag_Hazard_Cross", 80, 38, 2, 89, 92, 30, 32),
    container("Bag_Dozer_Pack", 80, 38, 2, 89, 91, 31, 33),
    container("ELA_Bag", 80, 38, 2, 90, 92, 28, 29),
    container("OMNI_Bag", 80, 38, 2, 89, 91, 27, 29),
    container("KIP5", 80, 38, 2, 87, 89, 31, 32),
    container("AP3", 80, 38, 2, 85, 88, 30, 32),
    container("IP46", 80, 38, 2, 85, 87, 30, 32),
    container("Sheriff_Bag", 80, 38, 2, 72, 80, 28, 23),
    container("Trauma_Bag", 80, 38, 2, 86, 88, 29, 33),
    container("Casual_Bag", 80, 38, 2, 80, 82, 30, 33),
    container("Bushcraft_Bag", 80, 38, 2, 82, 84, 29, 32),
    container("Bread_Bag", 80, 38, 2, 82, 84, 30, 32),
    container("Bread_Sack", 80, 38, 2, 80, 82, 30, 32),
    container("Army_Duffle_Bag", 80, 38, 2, 72, 80, 28, 23),
    container("Trench_Tornister", 80, 38, 2, 76, 78, 32, 36),
    container("Baker_Tent", 80, 38, 2, 82, 84, 38, 40),
    container("Baker_Tent_2", 80, 38, 2, 82, 84, 38, 40),
    container("Baker_Tent_3", 80, 38, 2, 82, 84, 38, 40),
    container("Baker_Tent_4", 80, 38, 2, 82, 84, 38, 40),
    container("Baker_Tent_5", 80, 38, 2, 82, 84, 38, 40),
    container("Baker_Tent_6", 80, 38, 2, 82, 84, 38, 40),
    container("Hunter_Backpack", 80, 38, 2, 85, 88, 29, 35),
    container("Metro_Bag", 80, 38, 2, 89, 92, 27, 32),
    container("Multi_Carrier_Wood", 80, 38, 2, 80, 85, 25, 27),
    container("Multi_Carrier_Ammo", 80, 38, 2, 80, 85, 25, 27),
    container("Multi_Carrier_Carl", 80, 38, 2, 80, 85, 25, 27),
    container("Multi_Carrier_Food", 80, 38, 2, 80, 85, 25, 27),
    container("Ham_Radio", 80, 38, 2, 80, 84, 24, 26)
}

CContainers.ChestRigsBrita = {
    container("Bag_D3M", 90, 8, 1, 91, 92, 8, 9),
    container("Bag_D3M_Loose", 90, 8, 1, 91, 92, 8, 9),
    container("Bag_Blackhawk", 90, 8, 1, 93, 94, 9, 10),
    container("Bag_Blackhawk_Loose", 90, 8, 1, 93, 94, 9, 10),
    container("Bag_X_Vest", 90, 8, 1, 90, 93, 10, 12),
    container("Bag_X_Vest_Loose", 90, 8, 1, 90, 93, 10, 12),
    container("Bag_SKS_Vest", 90, 8, 1, 90, 92, 9, 10),
    container("Bag_SKS_Vest_Loose", 90, 8, 1, 90, 92, 9, 10),
    container("Bag_AK_Vest", 90, 8, 1, 89, 92, 11, 12),
    container("Bag_AK_Vest_Loose", 90, 8, 1, 89, 92, 11, 12),
    container("Rig_Smersh", 90, 8, 1, 92, 94, 9, 10),
    container("Rig_Smersh_Loose", 90, 8, 1, 92, 94, 9, 10),
    container("Rig_Smersh_A", 90, 8, 1, 92, 94, 9, 10),
    container("Rig_Smersh_A_Loose", 90, 8, 1, 92, 94, 9, 10),
    container("Rig_Smersh_B", 90, 8, 1, 92, 94, 9, 10),
    container("Rig_Smersh_B_Loose", 90, 8, 1, 92, 94, 9, 10),
    container("Rig_Smersh_C", 90, 8, 1, 92, 94, 9, 10),
    container("Rig_Smersh_C_Loose", 90, 8, 1, 92, 94, 9, 10),
    container("Rig_ELA", 90, 8, 1, 92, 93, 9, 11),
    container("Rig_ELA_Loose", 90, 8, 1, 92, 93, 9, 11),
    container("Radio_Rig", 90, 8, 1, 93, 94, 5, 6),
    container("Radio_Rig_Loose", 90, 8, 1, 93, 94, 5, 6),
    container("Shotgun_Rig", 90, 8, 1, 91, 93, 8, 9),
    container("Shotgun_Rig_Loose", 90, 8, 1, 91, 93, 8, 9)
}
   
CContainers.FannyPacksBrita = {
    container("Bag_Tactical_Belt_Front", 80, 4, 0.5, 88, 90, 5, 5),
    container("Bag_Tactical_Belt_Back", 80, 4, 0.5, 88, 90, 5, 5),
    container("Bag_Duty_Belt_Front", 80, 4, 0.5, 88, 90, 5, 5),
    container("Bag_Duty_Belt_Back", 80, 4, 0.5, 88, 90, 5, 5),
    container("Bottle_Bag", 90, 8, 1, 88, 90, 7, 9),
    container("Bottle_Bag_Loose", 90, 8, 1, 88, 90, 7, 9),
    container("K1_Bag", 90, 8, 1, 88, 90, 7, 9),
    container("K1_Bag_Loose", 90, 8, 1, 88, 90, 7, 9),
    container("OMNI_Pouch", 90, 8, 1, 88, 90, 7, 9),
    container("OMNI_Pouch_Loose", 90, 8, 1, 88, 90, 7, 9),
    container("Ashe_Gear", 90, 8, 1, 88, 90, 7, 9),
    container("Ashe_Gear_Loose", 90, 8, 1, 88, 90, 7, 9),
    container("C420_PAPR", 90, 8, 1, 88, 90, 7, 9),
    container("C420_PAPR_Loose", 90, 8, 1, 88, 90, 7, 9),
    container("Belt_Pack_AR", 90, 8, 1, 88, 90, 7, 9),
    container("Belt_Pack_AR_Loose", 90, 8, 1, 88, 90, 7, 9),
    container("Belt_Pack_Gas", 90, 8, 1, 88, 90, 7, 9),
    container("Belt_Pack_Gas_Loose", 90, 8, 1, 88, 90, 7, 9),
    container("Belt_Pack_Pouch", 90, 8, 1, 88, 90, 7, 9),
    container("Belt_Pack_Pouch_Loose", 90, 8, 1, 88, 90, 7, 9),
    container("Belt_Pack_Duty", 90, 8, 1, 88, 90, 7, 9),
    container("Belt_Pack_Duty_Loose", 90, 8, 1, 88, 90, 7, 9),
    container("Belt_Pack_War", 90, 8, 1, 88, 90, 7, 9),
    container("Belt_Pack_War_Loose", 90, 8, 1, 88, 90, 7, 9),
    container("D3CR", 90, 8, 1, 88, 90, 7, 9),
    container("D3CR_Loose", 90, 8, 1, 88, 90, 7, 9),
    container("GM15_Canister", 90, 8, 1, 88, 90, 7, 9),
    container("GM15_Canister_Loose", 90, 8, 1, 88, 90, 7, 9),
    container("Trench_Ammo_Pack", 90, 8, 1, 88, 90, 7, 9),
    container("Trench_Ammo_Pack_Loose", 90, 8, 1, 88, 90, 7, 9),
    container("Trench_Grenade_Pack", 90, 8, 1, 88, 90, 7, 9),
    container("Trench_Grenade_Pack_Loose", 90, 8, 1, 88, 90, 7, 9),
    container("Messkit_B_Loose", 90, 8, 1, 88, 90, 7, 9),
    container("Messkit_B", 90, 8, 1, 88, 90, 7, 9),
    container("Messkit_Loose", 90, 8, 1, 88, 90, 7, 9),
    container("Messkit", 90, 8, 1, 88, 90, 7, 9)
}

CContainers.BackpacksAuthZ = {
    container("AuthenticZClothing.Bag_Schoolbag_Tier_1", 60, 16, 1, 68, 75, 19, 20),
    container("AuthenticZClothing.Bag_Schoolbag_Tier_2", 60, 17, 1, 70, 80, 20, 21),
    container("AuthenticZClothing.Bag_Schoolbag_Tier_3", 60, 18, 1, 72, 85, 21, 22),
    container("AuthenticZClothing.Bag_SchoolBagNBH_Tier_1", 60, 16, 1, 68, 75, 19, 20),
    container("AuthenticZClothing.Bag_SchoolBagNBH_Tier_2", 60, 17, 1, 70, 80, 20, 21),
    container("AuthenticZClothing.Bag_SchoolBagNBH_Tier_3", 60, 18, 1, 72, 85, 21, 22),
    container("AuthenticZClothing.Bag_SchoolBagCEDA_Tier_1", 60, 16, 1, 68, 75, 19, 20),
    container("AuthenticZClothing.Bag_SchoolBagCEDA_Tier_2", 60, 17, 1, 70, 80, 20, 21),
    container("AuthenticZClothing.Bag_SchoolBagCEDA_Tier_3", 60, 18, 1, 72, 85, 21, 22),
    container("AuthenticZClothing.Bag_SchoolBagCEDABlack_Tier_1", 60, 16, 1, 68, 75, 19, 20),
    container("AuthenticZClothing.Bag_SchoolBagCEDABlack_Tier_2", 60, 17, 1, 70, 80, 20, 21),
    container("AuthenticZClothing.Bag_SchoolBagCEDABlack_Tier_3", 60, 18, 1, 72, 85, 21, 22),
    container("AuthenticZClothing.Bag_SchoolBagCEDARed_Tier_1", 60, 16, 1, 68, 75, 19, 20),
    container("AuthenticZClothing.Bag_SchoolBagCEDARed_Tier_2", 60, 17, 1, 70, 80, 20, 21),
    container("AuthenticZClothing.Bag_SchoolBagCEDARed_Tier_3", 60, 18, 1, 72, 85, 21, 22),
    container("AuthenticZClothing.Bag_SchoolBagCEDABlue_Tier_1", 60, 16, 1, 68, 75, 19, 20),
    container("AuthenticZClothing.Bag_SchoolBagCEDABlue_Tier_2", 60, 17, 1, 70, 80, 20, 21),
    container("AuthenticZClothing.Bag_SchoolBagCEDABlue_Tier_3", 60, 18, 1, 72, 85, 21, 22),
    container("AuthenticZClothing.Bag_DuffelBag_Tier_1", 65, 19, 1, 78, 85, 29, 24),
    container("AuthenticZClothing.Bag_DuffelBag_Tier_2", 65, 20, 1, 80, 87, 30, 25),
    container("AuthenticZClothing.Bag_DuffelBag_Tier_3", 65, 21, 1, 82, 90, 31, 26),
    container("AuthenticZClothing.Bag_DuffelBagTINT_Tier_1", 65, 19, 1, 78, 85, 29, 24),
    container("AuthenticZClothing.Bag_DuffelBagTINT_Tier_2", 65, 20, 1, 80, 87, 30, 25),
    container("AuthenticZClothing.Bag_DuffelBagTINT_Tier_3", 65, 21, 1, 82, 90, 31, 26),
    container("AuthenticZClothing.Bag_NormalHikingBag_Tier_1", 70, 21, 1.2, 82, 87, 26, 27),
    container("AuthenticZClothing.Bag_NormalHikingBag_Tier_2", 70, 22, 1.2, 84, 89, 27, 28),
    container("AuthenticZClothing.Bag_NormalHikingBag_Tier_3", 70, 23, 1.2, 87, 92, 28, 29),
    container("AuthenticZClothing.Bag_BigHikingBag_Tier_1", 80, 23, 1.5, 88, 92, 30, 30),
    container("AuthenticZClothing.Bag_BigHikingBag_Tier_2", 80, 24, 1.5, 90, 91, 31, 32),
    container("AuthenticZClothing.Bag_BigHikingBag_Tier_3", 80, 25, 1.5, 91, 92, 32, 34),
    container("AuthenticZClothing.Bag_ALICEpack_Tier_1", 85, 28, 2, 89, 95, 31, 36),
    container("AuthenticZClothing.Bag_ALICEpack_Tier_2", 85, 29, 2, 90, 95, 32, 37),
    container("AuthenticZClothing.Bag_ALICEpack_Tier_3", 85, 30, 2, 91, 95, 33, 38),
    container("AuthenticZClothing.Bag_ALICEpack_Army_Tier_1", 87, 29, 2, 89, 95, 31, 36),
    container("AuthenticZClothing.Bag_ALICEpack_Army_Tier_2", 87, 29, 2, 90, 95, 32, 37),
    container("AuthenticZClothing.Bag_ALICEpack_Army_Tier_3", 87, 31, 2, 92, 96, 33, 38),
    container("AuthenticZClothing.Bag_B4BEvangelo", 60, 15, 1, 80, 80, 23, 23),
    container("AuthenticZClothing.Bag_B4BEvangelo_Tier_1", 60, 16, 1, 85, 85, 24, 24),
    container("AuthenticZClothing.Bag_B4BEvangelo_Tier_2", 60, 17, 1, 87, 87, 25, 25),
    container("AuthenticZClothing.Bag_B4BEvangelo_Tier_3", 60, 18, 1, 90, 90, 26, 26),
    container("AuthenticZClothing.Bag_B4BHoffman", 60, 15, 1, 80, 80, 23, 23),
    container("AuthenticZClothing.Bag_B4BHoffman_Tier_1", 60, 16, 1, 85, 85, 24, 24),
    container("AuthenticZClothing.Bag_B4BHoffman_Tier_2", 60, 17, 1, 87, 87, 25, 25),
    container("AuthenticZClothing.Bag_B4BHoffman_Tier_3", 60, 17, 1, 90, 90, 26, 26),
    container("AuthenticZClothing.Bag_B4BHolly", 70, 20, 1.2, 85, 85, 26, 26),
    container("AuthenticZClothing.Bag_B4BHolly_Tier_1", 70, 21, 1.2, 87, 87, 27, 27),
    container("AuthenticZClothing.Bag_B4BHolly_Tier_2", 70, 22, 1.2, 90, 90, 28, 29),
    container("AuthenticZClothing.Bag_B4BHolly_Tier_3", 70, 23, 1.2, 92, 92, 29, 30),
    container("AuthenticZClothing.Bag_B4BMom", 60, 15, 1, 80, 82, 23, 23),
    container("AuthenticZClothing.Bag_B4BMom_Tier_1", 60, 16, 1, 85, 85, 24, 24),
    container("AuthenticZClothing.Bag_B4BMom_Tier_2", 60, 17, 1, 87, 88, 25, 25),
    container("AuthenticZClothing.Bag_B4BMom_Tier_3", 60, 18, 1, 90, 90, 26, 26),
    container("AuthenticZClothing.Bag_B4BWalker", 70, 20, 1.2, 85, 85, 22, 23),
    container("AuthenticZClothing.Bag_B4BWalker_Tier_1", 70, 21, 1.2, 87, 87, 23, 24),
    container("AuthenticZClothing.Bag_B4BWalker_Tier_2", 70, 22, 1.2, 90, 91, 24, 25),
    container("AuthenticZClothing.Bag_B4BWalker_Tier_3", 70, 23, 1.2, 92, 92, 25, 26),
    container("AuthenticZClothing.Bag_SchoolBagCEDA", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZClothing.Bag_SchoolBagCEDABlack", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZClothing.Bag_SchoolBagCEDABlue", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZClothing.Bag_SchoolBagCEDARed", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZClothing.Bag_SchoolBagNBH", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZClothing.Bag_ProtonPack_Back", 35, 13, 1, 78, 90, 16, 18),
    container("AuthenticZClothing.Bag_ALICEpack_UrbanCamo", 87, 28, 2, 87, 95, 30, 35),
    container("AuthenticZClothing.Bag_ALICEpack_UrbanCamo_Tier_1", 87, 29, 2, 88, 95, 31, 36),
    container("AuthenticZClothing.Bag_ALICEpack_UrbanCamo_Tier_2", 87, 30, 2, 89, 95, 32, 37),
    container("AuthenticZClothing.Bag_ALICEpack_UrbanCamo_Tier_3", 87, 31, 2, 90, 96, 33, 38),
    container("AuthenticZClothing.Bag_ARVN_Rucksack_Tier_1", 85, 29, 2, 89, 95, 31, 36),
    container("AuthenticZClothing.Bag_ARVN_Rucksack_Tier_2", 85, 30, 2, 90, 95, 32, 37),
    container("AuthenticZClothing.Bag_ARVN_Rucksack_Tier_3", 85, 31, 2, 91, 96, 33, 38),
    container("AuthenticZClothing.Bag_SpiffoBackpackAZ", 20, 10, 1, 40, 75, 12, 16),
    container("AuthenticZClothing.Bag_SpiffoBackpackAZ_Tier_1", 20, 11, 1, 41, 77, 13, 17),
    container("AuthenticZClothing.Bag_SpiffoBackpackAZ_Tier_2", 20, 12, 1, 42, 79, 14, 18),
    container("AuthenticZClothing.Bag_SpiffoBackpackAZ_Tier_3", 20, 13, 1, 44, 82, 15, 19),
    container("AuthenticZClothing.Bag_RoadsideDuffel", 50, 10, 1, 78, 85, 15, 20),
    container("AuthenticZClothing.Bag_RoadsideDuffel_Tier_1", 65, 11, 1, 78, 85, 29, 24),
    container("AuthenticZClothing.Bag_RoadsideDuffel_Tier_2", 65, 12, 1, 80, 87, 30, 25),
    container("AuthenticZClothing.Bag_RoadsideDuffel_Tier_3", 65, 13, 1, 80, 87, 31, 27),
    container("AuthenticZClothing.Bag_DuffelBag_Festive", 65, 18, 1, 75, 82, 29, 24),
    container("AuthenticZClothing.Bag_ALICEpack_Festive", 87, 28, 2, 87, 95, 31, 35),
    container("AuthenticZClothing.Bag_ALICEpack_Festive_Tier_1", 87, 29, 2, 88, 95, 31, 35),
    container("AuthenticZClothing.Bag_ALICEpack_Festive_Tier_2", 87, 28, 2, 89, 95, 32, 35),
    container("AuthenticZClothing.Bag_ALICEpack_Festive_Tier_3", 87, 28, 1, 89, 95, 32, 35),
    container("AuthenticZClothing.Bag_Packsport_Plain", 65, 17, 1, 72, 90, 19, 23),
    container("AuthenticZClothing.Bag_Packsport_Plain_Tier_1", 65, 18, 1, 74, 92, 20, 24),
    container("AuthenticZClothing.Bag_Packsport_Plain_Tier_2", 68, 19, 1, 75, 90, 21, 25),
    container("AuthenticZClothing.Bag_Packsport_Plain_Tier_3", 65, 20, 1, 78, 92, 22, 26),
    container("AuthenticZClothing.Bag_Packsport_Rim", 65, 17, 1, 72, 90, 19, 23),
    container("AuthenticZClothing.Bag_Packsport_Rim_Tier_1", 65, 18, 1, 74, 92, 20, 24),
    container("AuthenticZClothing.Bag_Packsport_Rim_Tier_2", 68, 19, 1, 75, 90, 21, 25),
    container("AuthenticZClothing.Bag_Packsport_Rim_Tier_3", 65, 20, 1, 78, 92, 22, 26),
    container("AuthenticZClothing.Bag_Schoolbag_Spiffo2_Tier_3", 60, 18, 1, 72, 85, 21, 22),
    container("AuthenticZClothing.Bag_Schoolbag_Spiffo2_Tier_2", 60, 17, 1, 70, 80, 20, 21),
    container("AuthenticZClothing.Bag_Schoolbag_Spiffo2_Tier_1", 60, 16, 1, 68, 75, 19, 20),
    container("AuthenticZClothing.Bag_Schoolbag_Spiffo2", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZClothing.Bag_Schoolbag_Kids_Tier_3", 70, 18, 1, 72, 85, 21, 22),
    container("AuthenticZClothing.Bag_Schoolbag_Kids_Tier_2", 70, 17, 1, 70, 80, 20, 21),
    container("AuthenticZClothing.Bag_Schoolbag_Kids_Tier_1", 70, 16, 1, 68, 75, 19, 20)
}

CContainers.ChestRigsAuthZ = {
    container("AuthenticZClothing.Bag_MilitaryWebbing_AZ", 88, 4, 2, 92, 94, 4, 5),
    container("AuthenticZClothing.Bag_MilitaryWebbingTightened_AZ", 88, 4, 2, 92, 94, 4, 6),
    container("AuthenticZClothing.AmmoStrap_Bullets2", 85, 1, 1, 87, 90, 1, 2),
    container("AuthenticZClothing.AmmoStrap_Shells1", 85, 1, 1, 87, 90, 1, 2),
    container("AuthenticZClothing.AmmoStrap_Bullets1", 85, 1, 1, 87, 90, 1, 2)
}

CContainers.BagsAuthZ = {
    container("AuthenticZClothing.Handbag_Secondary", 40, 8, 1, 45, 50, 11, 12),
    container("AuthenticZClothing.Plasticbag_Secondary", 30, 8, 0.1, 38, 45, 12, 12),
    container("AuthenticZClothing.Garbagebag_Secondary", 10, 20, 0.1, 23, 25, 24, 24),
    container("AuthenticZClothing.Purse_Secondary", 50, 12, 0.5, 65, 70, 13, 17),
    container("AuthenticZClothing.Tote_Secondary", 55, 12, 0.5, 65, 70, 15, 17),
    container("AuthenticZClothing.EmptySandbag_Secondary", 10, 15, 0.1, 23, 25, 18, 20),
    container("AuthenticZClothing.SeedBag_Secondary", 30, 5, 0.1, 35, 40, 9, 9),
    container("AuthenticZClothing.Toolbox_Secondary", 15, 8, 2, 23, 25, 11, 12),
    container("AuthenticZClothing.FirstAidKit_Secondary", 5, 4, 1, 12, 15, 6, 6),
    container("AuthenticZClothing.Lunchbox_Secondary", 5, 4, 1, 13, 15, 6, 6),
    container("AuthenticZClothing.Lunchbox2_Secondary", 5, 4, 1, 13, 15, 6, 6),
    container("AuthenticZClothing.PistolCase_Secondary", 5, 7, 0.5, 13, 15, 11, 12),
    container("AuthenticZClothing.Bag_L4DeadMedkit", 50, 5, 1, 60, 65, 5, 6),
    container("AuthenticZClothing.Suitcase2", 50, 16, 3, 65, 70, 18, 20),
    container("AuthenticZClothing.Handbag2", 40, 8, 1, 45, 50, 11, 12)
}

CContainers.FannyPacksAuthZ = {
    container("AuthenticZClothing.Bag_UtilityBeltFront", 66, 2, 0.2, 88, 90, 4, 5),
    container("AuthenticZClothing.Bag_UtilityBeltFront_Loose", 66, 2, 0.2, 88, 90, 4, 5),
    container("AuthenticZClothing.Bag_UtilityBeltDesert", 66, 2, 0.2, 88, 90, 4, 5),
    container("AuthenticZClothing.Bag_UtilityBeltDesert_Loose", 66, 2, 0.2, 88, 90, 4, 5)
}

CContainers.SatchelsAuthZ = {
    container("AuthenticZClothing.Bag_Satchel", 30, 15, 1, 87, 90, 15, 20)
}

CContainers.BackpacksAuthZB = {
    container("AuthenticZBackpacksPlus.Bag_Schoolbag_Tier_1", 60, 16, 1, 68, 75, 19, 20),
    container("AuthenticZBackpacksPlus.Bag_Schoolbag_Tier_2", 60, 17, 1, 70, 80, 20, 21),
    container("AuthenticZBackpacksPlus.Bag_Schoolbag_Tier_3", 60, 18, 1, 72, 85, 21, 22),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagNBH_Tier_1", 60, 16, 1, 68, 75, 19, 20),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagNBH_Tier_2", 60, 17, 1, 70, 80, 20, 21),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagNBH_Tier_3", 60, 18, 1, 72, 85, 21, 22),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagCEDA_Tier_1", 60, 16, 1, 68, 75, 19, 20),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagCEDA_Tier_2", 60, 17, 1, 70, 80, 20, 21),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagCEDA_Tier_3", 60, 18, 1, 72, 85, 21, 22),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagCEDABlack_Tier_1", 60, 16, 1, 68, 75, 19, 20),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagCEDABlack_Tier_2", 60, 17, 1, 70, 80, 20, 21),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagCEDABlack_Tier_3", 60, 18, 1, 72, 85, 21, 22),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagCEDARed_Tier_1", 60, 16, 1, 68, 75, 19, 20),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagCEDARed_Tier_2", 60, 17, 1, 70, 80, 20, 21),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagCEDARed_Tier_3", 60, 18, 1, 72, 85, 21, 22),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagCEDABlue_Tier_1", 60, 16, 1, 68, 75, 19, 20),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagCEDABlue_Tier_2", 60, 17, 1, 70, 80, 20, 21),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagCEDABlue_Tier_3", 60, 18, 1, 72, 85, 21, 22),
    container("AuthenticZBackpacksPlus.Bag_DuffelBag_Tier_1", 65, 19, 1, 78, 85, 29, 24),
    container("AuthenticZBackpacksPlus.Bag_DuffelBag_Tier_2", 65, 20, 1, 80, 87, 30, 25),
    container("AuthenticZBackpacksPlus.Bag_DuffelBag_Tier_3", 65, 21, 1, 82, 90, 31, 26),
    container("AuthenticZBackpacksPlus.Bag_DuffelBagTINT_Tier_1", 65, 19, 1, 78, 85, 29, 24),
    container("AuthenticZBackpacksPlus.Bag_DuffelBagTINT_Tier_2", 65, 20, 1, 80, 87, 30, 25),
    container("AuthenticZBackpacksPlus.Bag_DuffelBagTINT_Tier_3", 65, 21, 1, 82, 90, 31, 26),
    container("AuthenticZBackpacksPlus.Bag_NormalHikingBag_Tier_1", 70, 21, 1.2, 82, 87, 26, 27),
    container("AuthenticZBackpacksPlus.Bag_NormalHikingBag_Tier_2", 70, 22, 1.2, 84, 89, 27, 28),
    container("AuthenticZBackpacksPlus.Bag_NormalHikingBag_Tier_3", 70, 23, 1.2, 87, 92, 28, 29),
    container("AuthenticZBackpacksPlus.Bag_BigHikingBag_Tier_1", 80, 23, 1.5, 88, 92, 30, 30),
    container("AuthenticZBackpacksPlus.Bag_BigHikingBag_Tier_2", 80, 24, 1.5, 90, 91, 31, 32),
    container("AuthenticZBackpacksPlus.Bag_BigHikingBag_Tier_3", 80, 25, 1.5, 91, 92, 32, 34),
    container("AuthenticZBackpacksPlus.Bag_ALICEpack_Tier_1", 85, 28, 2, 89, 95, 31, 36),
    container("AuthenticZBackpacksPlus.Bag_ALICEpack_Tier_2", 85, 29, 2, 90, 95, 32, 37),
    container("AuthenticZBackpacksPlus.Bag_ALICEpack_Tier_3", 85, 30, 2, 91, 95, 33, 38),
    container("AuthenticZBackpacksPlus.Bag_ALICEpack_Army_Tier_1", 87, 29, 2, 89, 95, 31, 36),
    container("AuthenticZBackpacksPlus.Bag_ALICEpack_Army_Tier_2", 87, 29, 2, 90, 95, 32, 37),
    container("AuthenticZBackpacksPlus.Bag_ALICEpack_Army_Tier_3", 87, 31, 2, 92, 96, 33, 38),
    container("AuthenticZBackpacksPlus.Bag_B4BEvangelo", 60, 15, 1, 80, 80, 23, 23),
    container("AuthenticZBackpacksPlus.Bag_B4BEvangelo_Tier_1", 60, 16, 1, 85, 85, 24, 24),
    container("AuthenticZBackpacksPlus.Bag_B4BEvangelo_Tier_2", 60, 17, 1, 87, 87, 25, 25),
    container("AuthenticZBackpacksPlus.Bag_B4BEvangelo_Tier_3", 60, 18, 1, 90, 90, 26, 26),
    container("AuthenticZBackpacksPlus.Bag_B4BHoffman", 60, 15, 1, 80, 80, 23, 23),
    container("AuthenticZBackpacksPlus.Bag_B4BHoffman_Tier_1", 60, 16, 1, 85, 85, 24, 24),
    container("AuthenticZBackpacksPlus.Bag_B4BHoffman_Tier_2", 60, 17, 1, 87, 87, 25, 25),
    container("AuthenticZBackpacksPlus.Bag_B4BHoffman_Tier_3", 60, 17, 1, 90, 90, 26, 26),
    container("AuthenticZBackpacksPlus.Bag_B4BHolly", 70, 20, 1.2, 85, 85, 26, 26),
    container("AuthenticZBackpacksPlus.Bag_B4BHolly_Tier_1", 70, 21, 1.2, 87, 87, 27, 27),
    container("AuthenticZBackpacksPlus.Bag_B4BHolly_Tier_2", 70, 22, 1.2, 90, 90, 28, 29),
    container("AuthenticZBackpacksPlus.Bag_B4BHolly_Tier_3", 70, 23, 1.2, 92, 92, 29, 30),
    container("AuthenticZBackpacksPlus.Bag_B4BMom", 60, 15, 1, 80, 82, 23, 23),
    container("AuthenticZBackpacksPlus.Bag_B4BMom_Tier_1", 60, 16, 1, 85, 85, 24, 24),
    container("AuthenticZBackpacksPlus.Bag_B4BMom_Tier_2", 60, 17, 1, 87, 88, 25, 25),
    container("AuthenticZBackpacksPlus.Bag_B4BMom_Tier_3", 60, 18, 1, 90, 90, 26, 26),
    container("AuthenticZBackpacksPlus.Bag_B4BWalker", 70, 20, 1.2, 85, 85, 22, 23),
    container("AuthenticZBackpacksPlus.Bag_B4BWalker_Tier_1", 70, 21, 1, 85, 85, 24, 24),
    container("AuthenticZBackpacksPlus.Bag_B4BWalker_Tier_2", 70, 22, 1.2, 90, 91, 24, 25),
    container("AuthenticZBackpacksPlus.Bag_B4BWalker_Tier_3", 70, 23, 1.2, 92, 92, 25, 26),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagCEDABlack", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagCEDABlue", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagCEDARed", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagNBH", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZBackpacksPlus.Bag_ProtonPack_Back", 35, 13, 1, 78, 90, 16, 18),
    container("AuthenticZBackpacksPlus.Bag_ALICEpack_UrbanCamo", 87, 28, 2, 87, 95, 30, 35),
    container("AuthenticZBackpacksPlus.Bag_ALICEpack_UrbanCamo_Tier_1", 87, 29, 2, 88, 95, 31, 36),
    container("AuthenticZBackpacksPlus.Bag_ALICEpack_UrbanCamo_Tier_2", 87, 30, 2, 89, 95, 32, 37),
    container("AuthenticZBackpacksPlus.Bag_ALICEpack_UrbanCamo_Tier_3", 87, 31, 2, 90, 96, 33, 38),
    container("AuthenticZBackpacksPlus.Bag_ARVN_Rucksack_Tier_1", 85, 29, 2, 89, 95, 31, 36),
    container("AuthenticZBackpacksPlus.Bag_ARVN_Rucksack_Tier_2", 85, 30, 2, 90, 95, 32, 37),
    container("AuthenticZBackpacksPlus.Bag_ARVN_Rucksack_Tier_3", 85, 31, 2, 91, 96, 33, 38),
    container("AuthenticZBackpacksPlus.Bag_SpiffoBackpackAZ", 20, 10, 1, 40, 75, 12, 16),
    container("AuthenticZBackpacksPlus.Bag_RoadsideDuffel", 50, 10, 1, 78, 85, 15, 20),
    container("AuthenticZBackpacksPlus.Bag_RoadsideDuffel_Tier_1", 65, 11, 1, 78, 85, 29, 24),
    container("AuthenticZBackpacksPlus.Bag_RoadsideDuffel_Tier_2", 65, 12, 1, 80, 87, 30, 25),
    container("AuthenticZBackpacksPlus.Bag_RoadsideDuffel_Tier_3", 65, 13, 1, 80, 87, 31, 27),
    container("AuthenticZBackpacksPlus.Bag_ALICEpack_Festive", 87, 28, 2, 87, 95, 31, 35),
    container("AuthenticZBackpacksPlus.Bag_ALICEpack_Festive_Tier_1", 87, 29, 2, 88, 95, 31, 35),
    container("AuthenticZBackpacksPlus.Bag_ALICEpack_Festive_Tier_2", 87, 28, 2, 89, 95, 32, 35),
    container("AuthenticZBackpacksPlus.Bag_ALICEpack_Festive_Tier_3", 87, 28, 2, 89, 95, 32, 35),
    container("AuthenticZBackpacksPlus.Bag_SchoolBagCEDA", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZBackpacksPlus.Bag_Schoolbag_Spiffo2", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZBackpacksPlus.Bag_DuffelBag_Festive", 65, 18, 1, 72, 80, 28, 23),
    container("AuthenticZBackpacksPlus.Bag_Packsport_Rim_Tier_3", 65, 20, 1, 87, 92, 28, 29),
    container("AuthenticZBackpacksPlus.Bag_Packsport_Rim_Tier_2", 65, 19, 1, 84, 89, 27, 28),
    container("AuthenticZBackpacksPlus.Bag_Packsport_Rim_Tier_1", 65, 18, 1, 82, 87, 26, 27),
    container("AuthenticZBackpacksPlus.Bag_Packsport_Plain_Tier_3", 65, 20, 1, 87, 92, 28, 29),
    container("AuthenticZBackpacksPlus.Bag_Packsport_Plain_Tier_2", 65, 19, 1, 84, 89, 27, 28),
    container("AuthenticZBackpacksPlus.Bag_Packsport_Plain_Tier_1", 65, 18, 1, 82, 87, 26, 27),
    container("AuthenticZBackpacksPlus.Bag_Schoolbag_Spiffo2_Tier_3", 60, 18, 1, 72, 85, 21, 22),
    container("AuthenticZBackpacksPlus.Bag_Schoolbag_Spiffo2_Tier_2", 60, 17, 1, 70, 80, 20, 21),
    container("AuthenticZBackpacksPlus.Bag_Schoolbag_Spiffo2_Tier_1", 60, 16, 1, 68, 75, 19, 20),
    container("AuthenticZBackpacksPlus.Bag_SpiffoBackpackAZ_Tier_3", 25, 21, 1, 87, 92, 28, 29),
    container("AuthenticZBackpacksPlus.Bag_SpiffoBackpackAZ_Tier_2", 25, 20, 1, 84, 89, 27, 28),
    container("AuthenticZBackpacksPlus.Bag_SpiffoBackpackAZ_Tier_1", 25, 19, 1, 82, 87, 26, 27),
    container("AuthenticZBackpacksPlus.Bag_Packsport_Rim", 65, 17, 1, 80, 85, 25, 26),
    container("AuthenticZBackpacksPlus.Bag_Packsport_Plain", 65, 17, 1, 80, 85, 25, 26),
    container("AuthenticZBackpacksPlus.Bag_Schoolbag_Kids_Tier_3", 70, 18, 1, 72, 85, 21, 22),
    container("AuthenticZBackpacksPlus.Bag_Schoolbag_Kids_Tier_2", 70, 17, 1, 70, 80, 20, 21),
    container("AuthenticZBackpacksPlus.Bag_Schoolbag_Kids_Tier_1", 70, 16, 1, 68, 75, 19, 20)
}

CContainers.ChestRigsAuthZB = {
    container("AuthenticZBackpacksPlus.Bag_MilitaryWebbing_AZ", 94, 4, 2, 90, 92, 5, 6),
    container("AuthenticZBackpacksPlus.Bag_MilitaryWebbingTightened_AZ", 94, 4, 2, 90, 92, 5, 6)
}

CContainers.BagsAuthZB = {
    container("AuthenticZBackpacksPlus.Handbag_Secondary", 40, 8, 1, 45, 50, 11, 12),
    container("AuthenticZBackpacksPlus.Plasticbag_Secondary", 30, 8, 0.1, 38, 45, 12, 12),
    container("AuthenticZBackpacksPlus.Garbagebag_Secondary", 10, 20, 0.1, 23, 25, 24, 24),
    container("AuthenticZBackpacksPlus.Purse_Secondary", 50, 12, 0.5, 65, 70, 13, 17),
    container("AuthenticZBackpacksPlus.Tote_Secondary", 55, 12, 0.5, 65, 70, 15, 17),
    container("AuthenticZBackpacksPlus.EmptySandbag_Secondary", 10, 15, 0.1, 23, 25, 18, 20),
    container("AuthenticZBackpacksPlus.SeedBag_Secondary", 30, 5, 0.1, 35, 40, 9, 9),
    container("AuthenticZBackpacksPlus.Toolbox_Secondary", 15, 8, 2, 23, 25, 11, 12),
    container("AuthenticZBackpacksPlus.FirstAidKit_Secondary", 5, 4, 1, 12, 15, 6, 6),
    container("AuthenticZBackpacksPlus.Lunchbox_Secondary", 5, 4, 1, 13, 15, 6, 6),
    container("AuthenticZBackpacksPlus.Lunchbox2_Secondary", 5, 4, 1, 13, 15, 6, 6),
    container("AuthenticZBackpacksPlus.PistolCase_Secondary", 5, 7, 0.5, 13, 15, 11, 12),
    container("AuthenticZBackpacksPlus.Bag_L4DeadMedkit", 50, 5, 1, 60, 65, 5, 6)
}

CContainers.FannyPacksAuthZB = {
    container("AuthenticZBackpacksPlus.Bag_UtilityBeltFront", 66, 2, 0.2, 88, 90, 4, 5),
    container("AuthenticZBackpacksPlus.Bag_UtilityBeltFront_Loose", 66, 2, 0.2, 88, 90, 4, 5),
    container("AuthenticZBackpacksPlus.Bag_UtilityBeltDesert", 66, 2, 0.2, 88, 90, 4, 5),
    container("AuthenticZBackpacksPlus.Bag_UtilityBeltDesert_Loose", 66, 2, 0.2, 88, 90, 4, 5)
}

CContainers.BackpacksAuthZLite = {
    container("AuthenticZLite.Bag_B4BEvangelo", 60, 15, 1, 80, 80, 23, 23),
    container("AuthenticZLite.Bag_B4BHoffman", 60, 15, 1, 80, 80, 23, 23),
    container("AuthenticZLite.Bag_B4BHolly", 70, 20, 1.2, 85, 85, 26, 26),
    container("AuthenticZLite.Bag_B4BMom", 60, 15, 1, 80, 82, 23, 23),
    container("AuthenticZLite.Bag_B4BWalker", 70, 20, 1.2, 85, 85, 22, 23),
    container("AuthenticZLite.Bag_SchoolBagCEDA", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZLite.Bag_SchoolBagCEDABlack", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZLite.Bag_SchoolBagCEDABlue", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZLite.Bag_SchoolBagCEDARed", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZLite.Bag_SchoolBagNBH", 60, 15, 1, 66, 70, 18, 20),
    container("AuthenticZLite.Bag_ProtonPack_Back", 35, 13, 1, 78, 90, 16, 18),
    container("AuthenticZLite.Bag_ALICEpack_UrbanCamo", 87, 28, 2, 87, 95, 30, 35),
    container("AuthenticZLite.Bag_SpiffoBackpackAZ", 20, 10, 1, 40, 75, 12, 16),
    container("AuthenticZLite.Bag_RoadsideDuffel", 50, 10, 1, 78, 85, 15, 20),
    container("AuthenticZLite.Bag_DuffelBag_Festive", 65, 10, 1, 75, 82, 12, 13),
    container("AuthenticZLite.Bag_ALICEpack_Festive", 87, 28, 2, 87, 95, 31, 35),
    container("AuthenticZLite.Bag_Packsport_Plain", 65, 17, 1, 72, 90, 19, 23),
    container("AuthenticZLite.Bag_Packsport_Rim", 65, 17, 1, 72, 90, 19, 23),
    container("AuthenticZLite.Bag_Schoolbag_Spiffo2", 60, 15, 1, 66, 70, 18, 20)
}

CContainers.ChestRigsAuthZLite = {
    container("AuthenticZLite.Bag_MilitaryWebbing_AZ", 70, 4, 2, 82, 90, 5, 6),
    container("AuthenticZLite.Bag_MilitaryWebbingTightened_AZ", 70, 4, 2, 82, 90, 5, 6),
    container("AuthenticZLite.AmmoStrap_Bullets2", 85, 1, 1, 87, 90, 1, 2),
    container("AuthenticZLite.AmmoStrap_Shells1", 85, 1, 1, 87, 90, 1, 2),
    container("AuthenticZLite.AmmoStrap_Bullets1", 85, 1, 1, 87, 90, 1, 2)
}

CContainers.BagsAuthZLite = {
    container("AuthenticZLite.Handbag2", 40, 8, 1, 45, 50, 11, 12),
    container("AuthenticZLite.Bag_L4DeadMedkit", 50, 5, 1, 60, 65, 5, 6),
    container("AuthenticZLite.Suitcase2", 50, 16, 3, 65, 70, 18, 20)
}

CContainers.FannyPacksAuthZLite = {
    container("AuthenticZLite.Bag_UtilityBeltFront", 66, 2, 0.2, 88, 90, 4, 5),
    container("AuthenticZLite.Bag_UtilityBeltFront_Loose", 66, 2, 0.2, 88, 90, 4, 5),
    container("AuthenticZLite.Bag_UtilityBeltDesert", 66, 2, 0.2, 88, 90, 4, 5),
    container("AuthenticZLite.Bag_UtilityBeltDesert_Loose", 66, 2, 0.2, 88, 90, 4, 5)
}

CContainers.BagsBetterBelts = {
    container("FirstAidKitB", 50, 5, 1.1, 60, 65, 6, 7),
    container("AFAK", 10, 10, 1.1, 15, 20, 11, 12),
    container("AFAKB", 55, 10, 1.1, 65, 70, 11, 12),
    container("ToolBoxB", 60, 8, 2.1, 70, 75, 9, 10),
    container("LunchboxB", 40, 5, 1.1, 45, 50, 6, 6),
    container("Lunchbox2B", 40, 5, 1.1, 45, 50, 6, 6),
    container("QuiverB", 50, 4, 1.1, 60, 65, 5, 5),
    container("PistolCase1B", 35, 7, 1.1, 45, 50, 8, 9)
}

CContainers.BackpacksClothesBOX = {
    container("CBX_Sumk_1_L", 40, 11, 0.3, 50, 55, 12, 13),
    container("CBX_Sumk_1_R", 40, 11, 0.3, 50, 55, 12, 13),
    container("CBX_HR", 90, 30, 1.4, 92, 93, 30, 33),
    container("CBX_ANAT", 70, 35, 2.1, 80, 84, 34, 37),
    container("CBX_Sumk_3_L", 70, 15, 0.8, 80, 85, 16, 19),
    container("CBX_Sumk_3_R", 70, 15, 0.8, 80, 85, 16, 19),
    container("CBX_Sumk_4_L", 55, 9, 0.2, 65, 70, 10, 11),
    container("CBX_Sumk_4_R", 55, 9, 0.2, 65, 70, 10, 11),
    container("CBX_Sumk_5_L", 70, 12, 0.3, 80, 85, 13, 14),
    container("CBX_Sumk_5_R", 70, 12, 0.3, 80, 85, 13, 14),
    container("CBX_RUKSAK1", 30, 30, 1, 65, 75, 30, 34),
    container("CBX_RUKSAK2", 30, 30, 1, 68, 80, 30, 34)
}
    
CContainers.ChestRigsClothesBOX = {
    container("CBX_Ras_army", 80, 8, 0.2, 82, 84, 9, 10),
    container("CBX_Ras_ohota", 30, 15, 0.3, 40, 45, 16, 18)
}

CContainers.BagsClothesBOX = {
    container("CBX_Sumk_1M_L", 40, 8, 0.3, 50, 55, 12, 13),
    container("CBX_Sumk_1M_R", 40, 8, 0.3, 50, 55, 12, 13),
    container("CBX_Sumk_2_L", 55, 11, 0.9, 65, 70, 16, 18),
    container("CBX_Sumk_2_R", 55, 11, 0.9, 65, 70, 16, 18)
}

CContainers.FannyPacksClothesBOX = {
    container("CBX_Sumk_6", 50, 18, 0.7, 60, 65, 19, 20),
    container("CBX_Sumk_7_L", 40, 6, 0.1, 50, 55, 7, 8),
    container("CBX_Sumk_7_R", 40, 6, 0.1, 50, 55, 7, 8),
    container("CBX_Sumk_8P", 40, 9, 0.1, 50, 55, 10, 11),
    container("CBX_Sumk_8", 40, 9, 0.1, 50, 55, 10, 11)
}

CContainers.ChestRigsEHE = {
    container("EHE.Vest_PilotSurvivalVest", 60, 3, 1, 92, 94, 3, 4)
}

CContainers.BackpacksHydrocraft = {
    container("Hydrocraft.HCAlicepack3", 90, 35, 1, 90, 95, 30, 35),
    container("Hydrocraft.HCCampingpack", 82, 24, 1, 84, 88, 25, 28),
    container("Hydrocraft.HCClimbingpack", 75, 20, 0.8, 80, 90, 22, 25),
    container("Hydrocraft.HCMessengerbag", 70, 6, 0.5, 80, 85, 9, 11),
    container("Hydrocraft.HCPizzadeliverybag", 60, 8, 0.5, 70, 80, 9, 11),
    container("Hydrocraft.HCMailbag", 70, 12, 0.5, 80, 85, 13, 15),
    container("Hydrocraft.HCSatchel", 70, 6, 0.5, 80, 85, 7, 9),
    container("Hydrocraft.HCClothtotebag", 55, 12, 0.5, 65, 75, 13, 14),
    container("Hydrocraft.HCMedicalbag", 80, 15, 1.5, 82, 88, 16, 18),
    container("Hydrocraft.HCImprovisedbackpack", 65, 16, 0.7, 70, 80, 17, 18)
}
    
CContainers.BagsHydrocraft = {
    container("Hydrocraft.HCBriefcase", 60, 10, 1, 65, 75, 11, 13),
    container("Hydrocraft.HCSeedbag", 60, 5, 0.1, 65, 75, 9, 11),
    container("Hydrocraft.HCLeatherbag", 60, 16, 0.1, 65, 70, 18, 20),
    container("Hydrocraft.HCSuitcase", 60, 16, 1, 65, 70, 17, 20),
    container("Hydrocraft.HCLuggage", 60, 16, 1, 65, 70, 17, 22),
    container("Hydrocraft.HCLuggage2", 60, 16, 1, 65, 70, 17, 22),
    container("Hydrocraft.HCImprovisedhandbag", 50, 12, 0.4, 60, 65, 13, 15)
}
     
CContainers.FannyPacksHydrocraft ={
    container("Hydrocraft.HCFannypackblue", 50, 4, 0.2, 88, 90, 4, 5),
    container("Hydrocraft.HCFannypackyellow", 50, 4, 0.2, 88, 90, 4, 5),
    container("Hydrocraft.HCFannypackred", 50, 4, 0.2, 88, 90, 4, 5),
    container("Hydrocraft.HCFannypackgreen", 50, 4, 0.2, 88, 90, 4, 5)
}
    
CContainers.MiscHydrocraft = {
    container("Hydrocraft.HCWickerbasket", 10, 6, 0.2, 20, 25, 7, 8),
    container("Hydrocraft.HCBirchbarkbasket", 10, 9, 0.2, 20, 25, 10, 12),
    container("Hydrocraft.HCStrawbasket", 50, 16, 0.2, 60, 65, 17, 19),
    container("Hydrocraft.HCBirchbarkcup", 10, 9, 0.2, 20, 25, 10, 12),
    container("Hydrocraft.HCClothhamper", 25, 20, 5, 35, 40, 22, 25),
    container("Hydrocraft.HCHuntingblind", 10, 100, 10, 20, 25, 110, 125),
    container("Hydrocraft.HCHuntingblind2", 10, 100, 10, 20, 25, 110, 125),
    container("Hydrocraft.HCPaperbag", 40, 8, 0.1, 50, 55, 9, 10),
    container("Hydrocraft.HCPaperlunchbag", 20, 4, 0.1, 30, 35, 5, 6),
    container("Hydrocraft.HCDuralumincase", 60, 15, 1, 70, 78, 17, 19),
    container("Hydrocraft.HCMedicalbox", 60, 8, 1, 70, 75, 9, 10),
    container("Hydrocraft.HCCosmeticcase", 60, 10, 1.2, 70, 72, 11, 12),
    container("Hydrocraft.HCLunchbox", 60, 6, 0.5, 70, 72, 7, 8),
    container("Hydrocraft.HCToolbox", 60, 8, 1, 70, 71, 9, 10),
    container("Hydrocraft.HCWoodentoolbox", 60, 6, 0.8, 70, 72, 7, 8),
    container("Hydrocraft.HCMetalbox", 60, 4, 0.6, 70, 75, 5, 6),
    container("Hydrocraft.HCFishingbox", 60, 6, 0.8, 70, 72, 7, 8),
    container("Hydrocraft.HCFishingbasket", 10, 12, 0.1, 20, 25, 14, 15),
    container("Hydrocraft.HCWoodencrate", 10, 10, 1, 20, 25, 12, 14),
    container("Hydrocraft.HCToychest", 10, 25, 2, 20, 25, 28, 32),
    container("Hydrocraft.HCWardrobe", 10, 100, 10, 20, 25, 110, 125),
    container("Hydrocraft.HCPlasticbin", 60, 20, 0.4, 70, 75, 24, 26),
    container("Hydrocraft.HCPlasticbin2", 60, 10, 0.2, 70, 75, 12, 14),
    container("Hydrocraft.HCCardboardbox", 10, 20, 0.2, 20, 25, 22, 23),
    container("Hydrocraft.HCTrunk", 60, 32, 2, 70, 75, 35, 38),
    container("Hydrocraft.HCChest", 60, 32, 4, 70, 75, 34, 38),
    container("Hydrocraft.HCCooler", 60, 8, 0.5, 70, 75, 9, 10),
    container("Hydrocraft.HCIcechest", 60, 16, 1, 70, 75, 17, 18),
    container("Hydrocraft.HCPillowcase", 10, 10, 0.1, 15, 20, 11, 12),
    container("Hydrocraft.HCBindle", 40, 15, 0.2, 50, 55, 16, 17),
    container("Hydrocraft.HCShoulderpole", 65, 10, 1.5, 70, 75, 11, 12),
    container("Hydrocraft.HCShipcrate1", 10, 1350, 45, 20, 25, 1400, 1450),
    container("Hydrocraft.HCShipcrate2", 10, 1350, 45, 20, 25, 1400, 1450),
    container("Hydrocraft.HCShipcrate3", 10, 1350, 50, 20, 25, 1400, 1450),
    container("Hydrocraft.HCShipcrate4", 10, 300, 10, 20, 25, 320, 345),
    container("Hydrocraft.HCShipcrate5", 10, 300, 10, 20, 25, 320, 345),
    container("Hydrocraft.HCShipcrate6", 10, 300, 10, 20, 25, 320, 345),
    container("Hydrocraft.HCShipcrate7", 10, 300, 10, 20, 25, 320, 345),
    container("Hydrocraft.HCStocking", 10, 8, 0.1, 15, 20, 9, 10),
    container("Hydrocraft.HCCandybucket", 60, 6, 0.2, 70, 75, 7, 8),
    container("Hydrocraft.HCBodybag", 10, 10, 1.2, 15, 20, 12, 13),
    container("Hydrocraft.HCMinecart", 50, 200, 20, 60, 65, 215, 225),
    container("Hydrocraft.HCPiggybankopen", 25, 10, 0.4, 30, 35, 11, 12),
    container("Hydrocraft.HCWallet", 25, 2, 0.2, 30, 35, 2, 3),
    container("Hydrocraft.HCWallet2", 25, 2, 0.2, 30, 35, 2, 3),
    container("Hydrocraft.HCWallet3", 25, 2, 0.2, 30, 35, 2, 3),
    container("Hydrocraft.HCWallet4", 25, 2, 0.2, 30, 35, 2, 3),
    container("Hydrocraft.HCHorsesaddle", 50, 100, 15, 60, 65, 110, 120),
    container("Hydrocraft.HCClayurn", 10, 20, 3, 15, 20, 24, 26),
    container("Hydrocraft.HCClayurnlarge", 10, 40, 6, 20, 25, 45, 50),
    container("Hydrocraft.HCBarrelmetalempty", 0, 27, 4, 29, 31),
    container("Hydrocraft.HCBarrelblueempty", 0, 27, 4, 29, 31),
    container("Hydrocraft.HCAmmoniabarrelempty", 0, 27, 4, 29, 31),
    container("Hydrocraft.HCAmmoniabarrelblueempty", 0, 27, 4, 29, 31),
    container("Hydrocraft.HCMethylaminbarrelempty", 0, 27, 4, 29, 31),
    container("Hydrocraft.HCMethylaminbarrelblueempty", 0, 27, 4, 29, 31),
    container("Hydrocraft.HCPhenylbarrelempty", 0, 27, 4, 29, 31),
    container("Hydrocraft.HCPhenylbarrelblueempty", 0, 27, 4, 29, 31),
    container("Hydrocraft.HCSulfuricacidbarrelempty", 0, 27, 4, 29, 31),
    container("Hydrocraft.HCSulfuricacidbarrelblueempty", 0, 27, 4, 29, 31),
    container("Hydrocraft.HCGasolinebarrelempty", 0, 27, 4, 29, 31),
    container("Hydrocraft.HCWagon", 0, 200, 20, 215, 230),
    container("Hydrocraft.HCWagoncovered", 0, 300, 20, 320, 350),
    container("Hydrocraft.HCWagonoxen", 0, 300, 20, 320, 350),
    container("Hydrocraft.HCWagoncoveredoxen", 0, 300, 20, 320, 350),
    container("Hydrocraft.HCPrepperbag", 0, 10, 0.1, 12, 13),
    container("Hydrocraft.HCWheelbarrow", 0, 200, 20, 215, 230),
    container("Hydrocraft.HCPallettruck", 0, 190, 15, 200, 215),
    container("Hydrocraft.HCPushcart", 0, 180, 10, 190, 210),
    container("Hydrocraft.HCHanddolly", 0, 170, 7, 180, 200),
    container("Hydrocraft.HCForklift", 0, 200, 20, 215, 230),
    container("Hydrocraft.HCShoppingcart", 0, 160, 6, 170, 190),
    container("Hydrocraft.HCToywagon", 0, 150, 5, 160, 175),
    container("Hydrocraft.HCDistillery2", 0, 100, 1000, 110, 125),
    container("Hydrocraft.HCElectornicsbench2", 0, 100, 1000, 110, 125),
    container("Hydrocraft.HCSteamCharger2", 0, 100, 1000, 110, 125),
    container("Hydrocraft.HCGardenbench", 0, 50, 10, 55, 65),
    container("Hydrocraft.HCSteamhammer2", 0, 8, 1000, 9, 11),
    container("Hydrocraft.HCFurnace2", 0, 6, 1000, 7, 9),
    container("Hydrocraft.HCFurnacearc2", 0, 100, 1000, 110, 125),
    container("Hydrocraft.HCJunkyardlargefull2", 0, 500, 10000, 540, 575),
    container("Hydrocraft.HCSled", 0, 50, 5, 60, 70),
    container("Hydrocraft.HCLab2", 0, 100, 1000, 110, 125),
    container("Hydrocraft.HCLabbig2", 0, 200, 1000, 225, 250),
    container("Hydrocraft.MetalSafe", 0, 50, 30, 60, 75),
    container("Hydrocraft.MetalSafeClosed", 0, 50, 1000, 60, 75),
    container("Hydrocraft.MetalSafeClosedInner", 0, 50, 1000, 60, 75),
    container("Hydrocraft.MetalSafeCombo", 0, 50, 1000, 60, 75),
    container("Hydrocraft.MetalSafeComboClosed", 0, 50, 1000, 60, 75),
    container("Hydrocraft.MetalSafeComboClosedInner", 0, 50, 1000, 60, 75),
    container("Hydrocraft.HCMedicallab2", 0, 100, 1000, 115, 120),
    container("Hydrocraft.HCSmelter2", 0, 100, 1000, 110, 125),
    container("Hydrocraft.HCBlastfurnace2", 0, 100, 1000, 110, 125),
    container("Hydrocraft.HCAnvil2", 0, 20, 10000, 25, 30),
    container("Hydrocraft.HCAnvillead2", 0, 20, 10000, 25, 30),
    container("Hydrocraft.HCDarkmine3B", 0, 100, 10000, 110, 125),
    container("Hydrocraft.HCAnimalcage", 0, 2, 1, 3, 4),
    container("Hydrocraft.HCBirdcage", 0, 2, 1, 3, 4),
    container("Hydrocraft.HCAnimalcagesmall", 0, 1, 0.5, 2, 3),
    container("Hydrocraft.HCPhotobench", 0, 50, 10, 60, 70),
    container("Hydrocraft.HCTentsleepin", 0, 50, 0.6, 60, 70),
    container("Hydrocraft.HCTent2sleepin", 0, 50, 0.6, 60, 70),
    container("Hydrocraft.HCTent3sleepin", 0, 50, 0.6, 60, 70),
    container("Hydrocraft.HCTent4sleepin", 0, 50, 0.6, 60, 70),
    container("Hydrocraft.HCAnvilstone2", 0, 6, 1000, 7, 9),
    container("Hydrocraft.HCTailoringbench2", 0, 100, 1000, 110, 125),
    container("Hydrocraft.HCTaxidermyworkbench", 0, 50, 10, 60, 70),
    container("Hydrocraft.HCHelicopterL", 0, 1000, 1000, 1100, 1250),
    container("Hydrocraft.HCHelicopterR", 0, 1000, 1000, 1100, 1250),
    container("Hydrocraft.HCDonkeymalepack", 0, 70, 0, 80, 90),
    container("Hydrocraft.HCDonkeyfemalepack", 0, 70, 0, 80, 90),
    container("Hydrocraft.HCHorsemalesaddle", 0, 100, 0, 110, 125),
    container("Hydrocraft.HCHorsefemalesaddle", 0, 100, 0, 110, 125),
    container("Hydrocraft.HCWagonhorsemale", 0, 300, 0, 330, 350),
    container("Hydrocraft.HCWagoncoveredhorsemale", 0, 400, 0, 425, 450),
    container("Hydrocraft.HCWagonhorsefemale", 0, 400, 0, 425, 450),
    container("Hydrocraft.HCWagoncoveredhorsefemale", 0, 400, 0, 425, 450),
}
    
CContainers.BackpacksImprovB = {
    container("Bag_Improvised_Backpack", 60, 15, 1, 75, 85, 18, 20),
    container("Bag_Sheet_Bag", 35, 8, 1, 65, 75, 10, 11)
}

CContainers.BackpacksMCC = {
    container("Bag_ALICEpack_Camo_Urban", 87, 27, 2, 88, 95, 30, 35),
    container("Bag_ALICEpack_Camo_Desert", 87, 27, 2, 88, 95, 30, 35)
}

CContainers.BackpacksMoreTraits = {
    container("MoreTraits.PackerBag", 95, 50, 0.5, 91, 94, 34, 38),
    container("MoreTraits.Bag_SmallHikingBag", 60, 8, 0.8, 84, 93, 9, 10)
}

CContainers.BackpacksNoir = {
    container("Bag_ALICEpack_Pink", 90, 35, 2, 89, 85, 30, 35)
}

CContainers.BackpacksPaw = {
    container("smallback", 95, 10, 0.7, 92, 95, 11, 12),
    container("Bag_ParaMedic", 85, 12, 1, 89, 92, 13, 4)
}

CContainers.ChestRigsPaw = {
    container("BeltRig", 80, 4, 0.13, 88, 90, 5, 6),
    container("MVest", 75, 5, 0.13, 83, 87, 6, 7),
    container("MVest2", 75, 5, 0.13, 83, 87, 6, 7)
}

CContainers.FannyPacksPaw = {
    container("TacticalWaistBagBack", 90, 6, 0.5, 88, 89, 7, 8),
    container("TacticalWaistBagFront", 65, 6, 0.5, 88, 89, 7, 8),
    container("TacticalWaistBagBackMed", 65, 6, 0.5, 86, 88, 7, 8),
    container("TacticalWaistBagFrontMed", 65, 6, 0.5, 86, 88, 7, 8),
    container("RogueWaistBag", 70, 8, 0.5, 85, 88, 9, 10),
    container("medbag", 70, 5, 0.5, 85, 88, 6, 7),
    container("medbag2", 70, 5, 0.5, 85, 88, 6, 7)
}

CContainers.BackpacksPitstop = {
    container("KleanBackPack", 100, 40, 2, 87, 89, 34, 50),
    container("FluxBackPack", 100, 40, 2, 87, 89, 34, 50),
    container("AlienBackPack", 60, 15, 1, 68, 75, 19, 20)
}

CContainers.BackpacksREMOD = {
    container("Bquiet", 100, 39, 0.5, 85, 90, 40, 44),
    container("Aquiet", 100, 39, 0.5, 85, 90, 40, 44),
    container("SPbag", 100, 39, 0.5, 85, 90, 40, 44),
    container("CPBB", 100, 60, 0.5, 85, 90, 58, 60),
    container("CPBC", 100, 60, 0.5, 85, 90, 58, 60),
    container("TFA", 100, 60, 0.1, 85, 90, 58, 60),
    container("HipPouch", 100, 10, 0.5, 85, 90, 12, 14),
    container("MhunkL", 100, 26, 0.5, 85, 90, 28, 30),
    container("MhunkR", 100, 26, 0.5, 85, 90, 28, 30),
    container("Qchr", 100, 20, 0.3, 85, 90, 21, 23),
    container("Qchr2", 100, 20, 0.3, 85, 90, 21, 23),
    container("Bjill", 100, 20, 0.3, 85, 90, 21, 23),
    container("Bada", 100, 20, 0.3, 85, 90, 21, 23),
    container("Bcla", 100, 20, 0.3, 85, 90, 21, 23),
    container("TBjill", 100, 20, 0.3, 85, 90, 21, 23),
    container("Bhunk", 100, 39, 0.5, 85, 90, 40, 44),
    container("Bchr", 100, 20, 0.3, 85, 90, 21, 23),
    container("Breb", 100, 20, 0.3, 85, 90, 21, 23),
    container("Cjill", 100, 10, 0.1, 85, 90, 12, 14),
    container("Abag", 100, 10, 0.1, 85, 90, 12, 14),
    container("Achr", 100, 10, 0.1, 85, 90, 12, 14),
    container("Ajill", 100, 10, 0.1, 85, 90, 12, 14),
    container("Aada2", 100, 10, 0.1, 85, 90, 12, 14),
    container("Vhunk", 100, 26, 0.5, 85, 90, 28, 30),
    container("Vchr", 100, 20, 1, 85, 90, 21, 23),
    container("Ahunk", 100, 39, 0.5, 85, 90, 40, 44),
    container("Vage", 100, 20, 1, 85, 90, 21, 23),
    container("Bage", 100, 20, 0.3, 85, 90, 21, 23),
    container("Abar", 100, 20, 0.5, 85, 90, 21, 23),
    container("ArmbagL", 100, 13, 0.5, 85, 90, 14, 15),
    container("ArmbagR", 100, 13, 0.5, 85, 90, 14, 15)
}

CContainers.BackpacksSBagAttach = {
    container("Bag_Schoolbag_Tier2", 60, 15, 1, 66, 70, 18, 20),
    container("Bag_NormalHikingBag_Tier2", 70, 20, 1.2, 80, 85, 25, 26),
    container("Bag_BigHikingBag_Tier2", 80, 22, 1.5, 87, 90, 29, 28),
    container("Bag_SurvivorBag_Tier2", 85, 27, 2, 88, 95, 30, 35),
    container("Bag_SurvivorBag_Tier3", 85, 27, 2, 88, 95, 30, 35),
    container("Bag_ALICEpack_Tier2", 85, 27, 2, 88, 95, 30, 35),
    container("Bag_ALICEpack_Tier3", 85, 27, 2, 88, 95, 30, 35),
    container("Bag_ALICEpack_Army_Tier2", 87, 28, 2, 89, 95, 30, 35),
    container("Bag_ALICEpack_Army_Tier3", 87, 28, 2, 89, 95, 30, 35),
    container("Bag_BigHikingBag_Tier3", 80, 22, 1.5, 91, 92, 32, 34),
    container("Bag_NormalHikingBag_Tier3", 70, 20, 1.2, 87, 92, 28, 29),
    container("Bag_Schoolbag_Tier3", 60, 15, 1, 72, 85, 21, 22)
}

CContainers.BagsSBagAttach = {
    container("FirstAidKit", 50, 5, 0.7, 55, 60, 6, 6),
    container("FirstAidKit1", 50, 5, 0.7, 55, 60, 6, 6),
    container("FirstAidKit2", 50, 5, 0.7, 55, 60, 6, 6),
    container("FirstAidKit3", 50, 5, 0.7, 55, 60, 6, 6),
    container("FirstAidKit4", 50, 5, 0.7, 55, 60, 6, 6),
    container("FirstAidKit5", 50, 5, 0.7, 55, 60, 6, 6),
    container("FirstAidKit6", 50, 5, 0.7, 55, 60, 6, 6),
    container("Lunchbox", 40, 4, 0.3, 45, 50, 5, 5),
    container("Lunchbox2", 40, 4, 0.3, 45, 50, 5, 5),
    container("PistolCase1", 35, 7, 1.1, 40, 45, 10, 11),
    container("PistolCase2", 35, 7, 1.1, 40, 45, 10, 11),
    container("PistolCase3", 35, 7, 1.1, 40, 45, 10, 11),
    container("RevolverCase1", 35, 7, 1.1, 40, 45, 10, 11),
    container("RevolverCase2", 35, 7, 1.1, 40, 45, 10, 11),
    container("RevolverCase3", 35, 7, 1.1, 40, 45, 10, 11),
    container("BigFAK", 45, 7, 0.5, 50, 55, 10, 11),
    container("FiendLunchbox", 40, 4, 0.3, 45, 50, 5, 5),
    container("FlashLunchbox", 40, 4, 0.3, 45, 50, 5, 5),
    container("BatmanLunchbox", 40, 4, 0.3, 45, 50, 5, 5),
    container("DinoLunchbox", 40, 4, 0.3, 45, 50, 5, 5),
    container("NightmareLunchbox", 40, 4, 0.3, 45, 50, 5, 5),
    container("GargoylesLunchbox", 40, 4, 0.3, 45, 50, 5, 5),
    container("MermaidLunchbox", 40, 4, 0.3, 45, 50, 5, 5),
    container("RainbowLunchbox", 40, 4, 0.3, 45, 50, 5, 5),
    container("SpiffoLunchbox", 40, 4, 0.3, 45, 50, 5, 5),
    container("SpideyLunchbox", 40, 4, 0.3, 45, 50, 5, 5),
    container("XMenLunchbox", 40, 4, 0.3, 45, 50, 5, 5)
}

CContainers.BackpacksSBDC = {
    container("SameBagDifferentColor.Bag_DuffelBagGreenMilitar", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_PepsiDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_DragonBallDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_CocaColaDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_SpiderManDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_AdidasDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_DitoDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_SnakeDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_MtvDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_NightLivingDeadDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_EseJotaDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_HotDogDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_MilitarRedDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_RedCrossDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_ChicagoBullsDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_FishingDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_BellaDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_NaturalDuffelBagDC", 75, 18, 1, 76, 80, 28, 23),
    container("SameBagDifferentColor.Bag_ResidentEvilDuffelBagDC", 75, 18, 1, 76, 80, 28, 23)
}

CContainers.BackpacksScrapArmor = {
    container("Rucksack", 85, 21, 0.9, 86, 87, 22, 24)
}

CContainers.FannyPacksScrapArmor = {
    container("ScrapLegPouchL", 86, 5, 0.4, 87, 88, 6, 7),
    container("ScrapLegPouchR", 86, 5, 0.4, 87, 88, 6, 7)
}

CContainers.BackpacksSLEO = {
    container("SLEOClothing.Bag_DuffelPolice", 65, 18, 1, 75, 80, 28, 23),
    container("SLEOClothing.Bag_DuffelSheriff", 65, 18, 1, 75, 80, 28, 23),
    container("SLEOClothing.Bag_PoliceUtilityBag", 45, 14, 1, 60, 70, 16, 17),
    container("SLEOClothing.Bag_PoliceUtilityBagGreen", 45, 14, 1, 60, 70, 16, 17)
}

CContainers.ChestRigsSLEO = {
    container("SLEOClothing.PoliceWebbing", 30, 3, 0.5, 55, 65, 4, 5),
    container("SLEOClothing.PoliceWebbingTightened", 30, 3, 0.5, 55, 65, 4, 5)
}
    
CContainers.FannyPacksSLEO = {   
    container("SLEOClothing.BlackLegPouch_RLeg", 30, 3, 0.2, 55, 65, 4, 5),
    container("SLEOClothing.BlackLegPouch_LLeg", 30, 3, 0.2, 55, 65, 4, 5),
    container("SLEOClothing.GreenLegPouch_RLeg", 30, 3, 0.2, 55, 65, 4, 5),
    container("SLEOClothing.GreenLegPouch_LLeg", 30, 3, 0.2, 55, 65, 4, 5)
}

CContainers.BackpacksSMUI = {
    container("SMUIClothing.Bag_MilitaryMedicalBag", 30, 14, 0.5, 72, 82, 17, 20),
    container("SMUIClothing.Bag_CFP90PatrolPack", 30, 15, 0.5, 70, 80, 20, 22),
    container("SMUIClothing.GasMaskBag", 30, 3, 0.1, 75, 82, 4, 5),
    container("SMUIClothing.Bag_LargeALICEPack", 70, 35, 3.5, 86, 92, 33, 39),
    container("SMUIClothing.Bag_LargeALICEPackWoodland", 70, 35, 3.5, 86, 92, 33, 39),
    container("SMUIClothing.Bag_GIDuffelbagWoodland", 25, 30, 1, 72, 80, 28, 23),
    container("SMUIClothing.Bag_SmallALICEPack", 80, 15, 3.5, 90, 96, 17, 20),
    container("SMUIClothing.Bag_SmallALICEPackWoodland", 80, 15, 3.5, 90, 96, 17, 20),
    container("SMUIClothing.ANPRC77", 30, 5, 2, 65, 80, 5, 6),
    container("Bag_Military", 30, 5, 2, 72, 80, 28, 23)
    
}

CContainers.ChestRigsSMUI = {
    container("SMUIClothing.MilitaryWebbing", 30, 3, 1, 50, 55, 6, 7),
    container("SMUIClothing.MilitaryWebbingTightened", 30, 3, 1, 50, 55, 6, 7),
    container("SMUIClothing.MilitaryWebbingBag", 30, 5, 1, 50, 55, 6, 8),
    container("SMUIClothing.MilitaryWebbingBagTightened", 30, 5, 1, 50, 55, 6, 8),
    container("SMUIClothing.M1956Webbing", 30, 3, 1, 50, 55, 4, 5),
    container("SMUIClothing.M1956WebbingTightened", 30, 3, 1, 50, 55, 4, 5),
    container("SMUIClothing.M1956WebbingBag", 30, 3, 1, 55, 60, 4, 5),
    container("SMUIClothing.M1956WebbingBagTightened", 30, 3, 1, 55, 60, 4, 5),
    container("SMUIClothing.LBV88Webbing", 50, 5, 1, 65, 72, 6, 7),
    container("SMUIClothing.LBV88WebbingTightened", 50, 5, 1, 65, 72, 6, 7)
}

CContainers.FannyPacksSMUI = {
    container("SMUIClothing.PistolBeltPouches", 30, 8, 0.5, 85, 90, 9, 10),
    container("SMUIClothing.PistolBeltBag", 30, 8, 0.5, 85, 90, 9, 10),
    container("SMUIClothing.LBV88WebbingBag", 100, 8, 0.5, 88, 92, 9, 10),
    container("SMUIClothing.LBV88WebbingBagTightened", 100, 8, 0.5, 88, 92, 9, 10)
}

CContainers.BackpacksAliceSPack = {
    container("AliceBP.AlicePack", 90, 30, 1, 88, 95, 30, 35),
    container("AliceBP.UpgradedAlicePack1", 95, 34, 1.4, 90, 97, 30, 37),
    container("AliceBP.UpgradedAlicePack2", 95, 34, 1.5, 90, 97, 32, 37),
    container("AliceBP.UpgradedAlicePack2b", 95, 34, 1.5, 90, 97, 33, 37),
    container("AliceBP.UpgradedAlicePack3", 95, 34, 1.1, 90, 96, 33, 37),
    container("AliceBP.UpgradedAlicePack3b", 95, 34, 1.1, 90, 96, 33, 37),
    container("AliceBP.AlicePackUrban", 90, 30, 1, 88, 95, 30, 35),
    container("AliceBP.AlicePackDesert", 95, 30, 1, 88, 95, 30, 35)
}

CContainers.BackpacksSnakeClothing = {
    container("Bag_BigSpiffoBackpack", 95, 26, 1, 87, 94, 29, 35),
    container("AlicePackDito", 95, 26, 1, 87, 94, 29, 35),
    container("AlicePackPastel", 95, 35, 1, 87, 94, 29, 35),
    container("AlicePackBeer", 95, 35, 1, 87, 94, 29, 35),
    container("AlicePackSnake", 95, 35, 1, 87, 94, 29, 35),
    container("AlicePackUnicorn", 95, 35, 1, 87, 94, 29, 35)
}

CContainers.BagsAliceSPack = {
    container("AliceBP.BoxMRE3", 50, 25, 5, 65, 75, 26, 28)
}

CContainers.BagsAmmoMaker = {
    container("AmmoMaker.ToolBoxKit", 50, 10, 1, 65, 75, 12, 14),
    container("AmmoMaker.AmmoBriefcase", 50, 10, 1, 65, 75, 12, 14)
}

CContainers.BagsLeRevolution = {
    container("AdvancedFishing.FishingBox", 50, 8, 1, 55, 60, 9, 10),
    container("AdvancedFishing.FishingBox2", 60, 8, 1.5, 65, 70, 9, 10),
    container("AdvancedFishing.FishingBox3", 70, 8, 2, 75, 80, 9, 10),
    container("SuitcaseBee", 50, 16, 3, 65, 70, 18, 20)
}

CContainers.BagsWPA = {
    container("WPA.BlackBriefcase", 50, 9, 1, 65, 75, 10, 12)
}

CContainers.FannyPacksAliceSPack = {
    container("AliceBP.MilitiaPouch1", 80, 4, 0.1, 87, 89, 5, 7),
    container("AliceBP.MilitiaPouch2", 80, 4, 0.1, 87, 89, 5, 7)
}

CContainers.BackpacksSTR = {
    container("STFR.Bag_DuffelBag_USPS", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Fire_Black", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Fire_Khaki", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_EMS_Red", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_EMS_Blue", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_EMS_Green", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Ranger", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Police_KSP", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Police_Black", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Police_Navy", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Police_Olive", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Police_Riverside_SWAT_Blue", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Sheriff_Meade_SWAT_Tan", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Police_KSP_SWAT_Blue", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Police_WestPoint_SWAT_Navy", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Sheriff_Rosewood_SWAT_Green", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Sheriff_Jefferson_SWAT_Green", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Police_Jefferson_SWAT_Blue", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Police_Louisville_SWAT_Black", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Alicepack_Sheriff_Meade_SWAT_Tan", 85, 27, 2, 88, 95, 30, 35),
    container("STFR.Alicepack_Police_KSP_SWAT_Black", 85, 27, 2, 88, 95, 30, 35),
    container("STFR.Alicepack_Police_WestPoint_SWAT_Navy", 85, 27, 2, 88, 95, 30, 35),
    container("STFR.Alicepack_Sheriff_Rosewood_SWAT_Green", 85, 27, 2, 88, 95, 30, 35),
    container("STFR.Alicepack_Sheriff_Jefferson_SWAT_Green", 85, 27, 2, 88, 95, 30, 35),
    container("STFR.Alicepack_Police_Jefferson_SWAT_Blue", 85, 27, 2, 88, 95, 30, 35),
    container("STFR.Alicepack_Police_Louisville_SWAT_Black", 85, 27, 2, 88, 95, 30, 35),
    container("STFR.Bag_DuffelBag_Sheriff_Jefferson", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Sheriff_Meade", 65, 18, 1, 72, 80, 28, 23),
    container("STFR.Bag_DuffelBag_Sheriff_Rosewood", 65, 18, 1, 72, 80, 28, 23)
}

CContainers.SatchelsSTR = {
    container("STFR.Bag_Satchel_USPS", 30, 15, 1, 87, 90, 15, 20)
}

CContainers.BackpacksSWAT = {
    container("Bag_BigSwatBag", 85, 35, 3, 90, 90, 37, 40),
    container("Bag_PoliceBag", 90, 22, 2, 90, 92, 24, 25)
}

CContainers.FannyPacksSWAT = {
    container("SWATPouch", 95, 4, 0.5, 92, 95, 5, 6)
}

CContainers.SatchelsTheyKnew = {
    container("TheyKnew.MysteriousSatchel", 50, 17, 1, 87, 88, 17, 21)
}

CContainers.FannyPacksWorkshop = {
    container("Toolbelt", 71, 6, 0.8, 88, 90, 6, 8)
}

CContainers.BackpacksUndeadS = {
    container("UndeadSurvivor.NomadBackpack", 89, 34, 5, 89, 95, 31, 36),
    container("UndeadSurvivor.HeadhunterBackpack", 85, 21, 1.2, 87, 88, 25, 27),
    container("UndeadSurvivor.DeadlyHeadhunterBackpack", 85, 21, 1.2, 87, 88, 25, 27)
}

CContainers.BackpacksMonmouth = {
    container("BZMClothing.Bag_ALICEpack_Spike", 85, 27, 2, 88, 95, 30, 35),
    container("BZMClothing.Bag_ALICEpack_Black", 85, 27, 2, 88, 95, 30, 35),
    container("BZMClothing.Bag_ALICEpack_GaPDC", 85, 27, 2, 88, 95, 30, 35),
    container("BZMClothing.Bag_ALICEpack_Olive", 85, 27, 2, 88, 95, 30, 35),
    container("BZMClothing.Bag_ALICEpack_PinkSkyBlue", 85, 27, 2, 88, 95, 30, 35),
    container("BZMClothing.Bag_ALICEpack_Sand", 85, 27, 2, 88, 95, 30, 35),
    container("BZMClothing.Bag_ALICEpack_WaGDC", 85, 27, 2, 88, 95, 30, 35),
    container("BZMClothing.Bag_ALICEpack_WaGDC_Tier_3", 90, 30, 2, 91, 95, 33, 38),
    container("BZMClothing.Bag_ALICEpack_WaGDC_Tier_2", 87, 29, 2, 90, 95, 32, 37),
    container("BZMClothing.Bag_ALICEpack_WaGDC_Tier_1", 86, 28, 2, 89, 95, 31, 36),
    container("BZMClothing.Bag_ALICEpack_Sand_Tier_3", 90, 30, 2, 91, 95, 33, 38),
    container("BZMClothing.Bag_ALICEpack_Sand_Tier_2", 87, 29, 2, 90, 95, 32, 37),
    container("BZMClothing.Bag_ALICEpack_Sand_Tier_1", 86, 28, 2, 89, 95, 31, 36),
    container("BZMClothing.Bag_ALICEpack_PinkSkyBlue_Tier_3", 90, 30, 2, 91, 95, 33, 38),
    container("BZMClothing.Bag_ALICEpack_PinkSkyBlue_Tier_2", 87, 29, 2, 90, 95, 32, 37),
    container("BZMClothing.Bag_ALICEpack_PinkSkyBlue_Tier_1", 86, 28, 2, 89, 95, 31, 36),
    container("BZMClothing.Bag_ALICEpack_Olive_Tier_3", 90, 30, 2, 91, 95, 33, 38),
    container("BZMClothing.Bag_ALICEpack_Olive_Tier_2", 87, 29, 2, 90, 95, 32, 37),
    container("BZMClothing.Bag_ALICEpack_Olive_Tier_1", 86, 28, 2, 89, 95, 31, 36),
    container("BZMClothing.Bag_ALICEpack_GaPDC_Tier_3", 90, 30, 2, 91, 95, 33, 38),
    container("BZMClothing.Bag_ALICEpack_GaPDC_Tier_2", 87, 29, 2, 90, 95, 32, 37),
    container("BZMClothing.Bag_ALICEpack_GaPDC_Tier_1", 86, 28, 2, 89, 95, 31, 36),
    container("BZMClothing.Bag_ALICEpack_Black_Tier_3", 90, 30, 2, 91, 95, 33, 38),
    container("BZMClothing.Bag_ALICEpack_Black_Tier_2", 87, 29, 2, 90, 95, 32, 37),
    container("BZMClothing.Bag_ALICEpack_Black_Tier_1", 86, 28, 2, 89, 95, 31, 36),
    container("BZMClothing.Bag_ALICEpack_Spike_Tier_3", 90, 30, 2, 91, 95, 33, 38),
    container("BZMClothing.Bag_ALICEpack_Spike_Tier_2", 87, 29, 2, 90, 95, 32, 37),
    container("BZMClothing.Bag_ALICEpack_Spike_Tier_1", 86, 28, 2, 89, 95, 31, 36)
}

CContainers.ChestRigsUndeadS = {
    container("UndeadSurvivor.PrepperVestPacked", 30, 10, 1, 85, 90, 12, 14)
}

CContainers.BagsUndeadS = {
    container("UndeadSurvivor.PrepperBags", 95, 12, 0.3, 92, 95, 14, 19)
}

CContainers.FannyPacksUndeadS = {
    container("UndeadSurvivor.AmazonaHipBag", 80, 6, 0.6, 87, 89, 7, 8)
}

CContainers.BackpacksPumpPury = {
    container("P4PumpPury.P4PumpPuryBackpack_Normal", 80, 22, 1.2, 84, 86, 26, 28),
    container("P4PumpPury.P4PumpPuryBackpack_Rare", 80, 22, 1.2, 84, 86, 26, 28),
    container("P4PumpPury.P4PumpPuryBackpackPlus_Normal", 87, 27, 1.2, 85, 86, 26, 28),
    container("P4PumpPury.P4PumpPuryBackpackPlus_Rare", 87, 27, 1.2, 85, 86, 26, 28)
}

CContainers.BagsPumpPury = {
    container("P4PumpPury.P4SneakerBox5", 0, 5, 0.5, 0, 0, 5, 6),
    container("P4PumpPury.P4SneakerBox4", 0, 4, 0.4, 0, 0, 4, 5),
    container("P4PumpPury.P4SneakerBox3", 0, 3, 0.3, 0, 0, 3, 4),
    container("P4PumpPury.P4SneakerBox2", 0, 2, 0.2, 0, 0, 2, 3),
    container("P4PumpPury.P4SneakerBox1", 0, 1, 0.1, 0, 0, 1, 2)
}

CContainers.FannyPacksPumpPury = {
    container("P4PumpPury.P4PumpPuryFannyPack_Normal_Back", 60, 3, 0.3, 87, 88, 4, 5),
    container("P4PumpPury.P4PumpPuryFannyPack_Normal_Front", 60, 3, 0.3, 87, 88, 4, 5),
    container("P4PumpPury.P4PumpPuryFannyPack_Rare_Back", 60, 3, 0.3, 87, 88, 4, 5),
    container("P4PumpPury.P4PumpPuryFannyPack_Rare_Front", 60, 3, 0.3, 87, 88, 4, 5),
    container("P4PumpPury.P4PumpPuryFannyPackPlus_Rare_Front", 60, 4, 0.4, 87, 88, 4, 5),
    container("P4PumpPury.P4PumpPuryFannyPackPlus_Rare_Back", 60, 4, 0.4, 87, 88, 4, 5),
    container("P4PumpPury.P4PumpPuryFannyPackPlus_Normal_Front", 60, 4, 0.4, 87, 88, 4, 5),
    container("P4PumpPury.P4PumpPuryFannyPackPlus_Normal_Back", 60, 4, 0.4, 87, 88, 4, 5)
}

CContainers.BackpacksOMS = {
    container("OverlookedMilitarySurplus.Backpack_Paratrooper", 92, 28, 1.75, 90, 96, 29, 35),
    container("OverlookedMilitarySurplus.Backpack_Wehrmacht", 82, 10, 1.25, 84, 88, 12, 15),
    container("OverlookedMilitarySurplus.Backpack_Paras", 92, 28, 1.75, 89, 95, 29, 35)
}

CContainers.FannyPacksUSMC = {
    container("Interceptor_Pouches", 90, 8, 1, 92, 95, 9, 10),
    container("Interceptor_Pouches_Straps", 90, 8, 1, 92, 95, 9, 10)
}

CContainers.BackpacksInsurgent = {
    container("Insurgent.Bag_ALICEpack_Insurgent", 90, 45, 2.5, 90, 95, 30, 35)
}

CContainers.BackpacksModified = {
    container("Bag_Schoolbag_Modified_1", 60, 17, 1, 66, 70, 19, 21),
    container("Bag_Schoolbag_Modified_2", 60, 19, 1, 66, 70, 21, 23),
    container("Bag_Schoolbag_Modified_3", 60, 21, 1, 66, 70, 23, 25),
    container("Bag_Schoolbag_Modified_4", 60, 23, 1, 66, 70, 25, 26),
    container("Bag_Schoolbag_Modified_5", 60, 25, 1, 66, 70, 26, 27),
    container("Bag_DuffelBag_Modified_1", 65, 20, 1, 72, 80, 21, 22),
    container("Bag_DuffelBag_Modified_2", 65, 22, 1, 72, 80, 23, 24),
    container("Bag_DuffelBag_Modified_3", 65, 24, 1, 72, 80, 25, 26),
    container("Bag_DuffelBag_Modified_4", 65, 26, 1, 72, 80, 27, 28),
    container("Bag_DuffelBag_Modified_5", 65, 28, 1, 76, 80, 28, 29),
    container("Bag_BigHikingBag_Modified_1", 80, 22, 1.5, 87, 90, 23, 24),
    container("Bag_BigHikingBag_Modified_2", 80, 24, 1.5, 87, 91, 25, 25),
    container("Bag_BigHikingBag_Modified_3", 80, 26, 1.5, 87, 90, 26, 27),
    container("Bag_BigHikingBag_Modified_4", 80, 28, 1.5, 86, 90, 28, 28),
    container("Bag_BigHikingBag_Modified_5", 80, 30, 1.5, 89, 89, 29, 30),
    container("Bag_NormalHikingBag_Modified_1", 70, 22, 1.2, 80, 85, 20, 21),
    container("Bag_NormalHikingBag_Modified_2", 70, 24, 1.2, 82, 82, 21, 22),
    container("Bag_NormalHikingBag_Modified_3", 70, 26, 1.2, 80, 83, 23, 23),
    container("Bag_NormalHikingBag_Modified_4", 70, 28, 1.2, 80, 84, 24, 24),
    container("Bag_NormalHikingBag_Modified_5", 70, 30, 1.2, 85, 85, 24, 25),
    container("Bag_SurvivorBag_Modified_1", 85, 29, 2, 88, 95, 30, 31),
    container("Bag_SurvivorBag_Modified_2", 85, 31, 2, 89, 95, 31, 32),
    container("Bag_SurvivorBag_Modified_3", 85, 33, 2, 88, 95, 33, 33),
    container("Bag_SurvivorBag_Modified_4", 85, 35, 2, 89, 93, 33, 34),
    container("Bag_SurvivorBag_Modified_5", 85, 37, 2, 92, 96, 35, 36),
    container("Bag_ALICEpack_Modified_1", 85, 29, 2, 88, 95, 28, 29),
    container("Bag_ALICEpack_Modified_2", 85, 31, 2, 88, 95, 30, 31),
    container("Bag_ALICEpack_Modified_3", 85, 33, 2, 89, 93, 32, 33),
    container("Bag_ALICEpack_Modified_4", 85, 35, 2, 88, 92, 34, 35),
    container("Bag_ALICEpack_Modified_5", 85, 29, 2, 89, 96, 36, 37),
    container("Bag_ALICEpack_Army_Modified_1", 85, 29, 2, 88, 95, 28, 29),
    container("Bag_ALICEpack_Army_Modified_2", 85, 31, 2, 88, 95, 30, 31),
    container("Bag_ALICEpack_Army_Modified_3", 85, 33, 2, 89, 93, 32, 33),
    container("Bag_ALICEpack_Army_Modified_4", 85, 35, 2, 88, 92, 34, 35),
    container("Bag_ALICEpack_Army_Modified_5", 85, 29, 2, 89, 96, 36, 37)
}

CContainers.BagsModified = {
    container("Bag_GolfBag_Modified_1", 65, 20, 1.2, 70, 75, 22, 24),
    container("Bag_GolfBag_Modified_2", 65, 22, 1.2, 70, 75, 24, 26),
    container("Bag_GolfBag_Modified_3", 65, 24, 1.2, 70, 75, 26, 27),
    container("Bag_GolfBag_Modified_4", 65, 26, 1.2, 70, 75, 27, 28),
    container("Bag_GolfBag_Modified_5", 65, 28, 1.2, 70, 75, 29, 30),
    container("Bag_Satchel_Modified_1", 30, 17, 1, 87, 90, 18, 19),
    container("Bag_Satchel_Modified_2", 30, 19, 1, 87, 90, 20, 21),
    container("Bag_Satchel_Modified_3", 30, 21, 1, 87, 90, 22, 23),
    container("Bag_Satchel_Modified_4", 30, 23, 1, 87, 90, 24, 25),
    container("Bag_Satchel_Modified_5", 30, 25, 1, 88, 90, 25, 26)
}

CContainers.FannyPacksModified = {
    container("Bag_FannyPackFront_Modified_1", 50, 3, 0.2, 88, 90, 4, 5),
    container("Bag_FannyPackFront_Modified_2", 50, 5, 0.2, 89, 91, 4, 5),
    container("Bag_FannyPackFront_Modified_3", 50, 7, 0.2, 90, 92, 5, 5),
    container("Bag_FannyPackFront_Modified_4", 50, 9, 0.2, 88, 89, 6, 6),
    container("Bag_FannyPackFront_Modified_5", 50, 11, 0.2, 90, 94, 6, 6),
    container("Bag_FannyPackBack_Modified_1", 50, 3, 0.2, 88, 90, 4, 5),
    container("Bag_FannyPackBack_Modified_2", 50, 5, 0.2, 89, 91, 4, 5),
    container("Bag_FannyPackBack_Modified_3", 50, 7, 0.2, 90, 92, 5, 5),
    container("Bag_FannyPackBack_Modified_4", 50, 9, 0.2, 88, 89, 6, 6),
    container("Bag_FannyPackBack_Modified_5", 50, 11, 0.2, 90, 94, 6, 6)
}

CContainers.BackpacksDivision = {
    container("Bag_DivisionBackpack", 90, 28, 2, 90, 96, 32, 36),
    container("Bag_DivisionBackpackLarge", 90, 28, 2, 90, 96, 32, 36),
    container("Bag_DivisionBackpackMedium", 90, 28, 2, 90, 96, 32, 36),
    container("Bag_DivisionBackpackSmall", 90, 28, 2, 90, 96, 32, 36),
    container("Bag_DivisionBackpackOP", 90, 28, 2, 90, 96, 32, 36),
    container("Bag_DivisionBackpackXL", 90, 28, 2, 90, 96, 32, 36)
}

CContainers.BackpacksSavotta = {
    container("Jaakari_L_Backpack", 90, 25, 2, 89, 95, 28, 32),
    container("Jaakari_XL_Backpack", 93, 40, 4, 87, 91, 33, 39)
}

CContainers.BackpacksDuffelTweak = {
    container("Bag_WeaponBag_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_InmateEscapedBag_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_MoneyBag_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_WorkerBag_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_DuffelBagTINT_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_ShotgunBag_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_ShotgunSawnoffBag_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_ShotgunDblBag_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_ShotgunDblSawnoffBag_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_ShotgunDblSawnoffBag_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_DuffelBag_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_ToolBag_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_Military_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_MedicalBag_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_FoodSnacks_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_FoodCanned_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_Police_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_BaseballBag_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_BreakdownBag_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_SWAT_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_Sheriff_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_BurglarBag_LB", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_TennisBag_LB", 65, 18, 1, 72, 80, 28, 23)
}

CContainers.BagsFOOL = {
    container("newcontainersnc.NCtravelkit", 30, 4, 0.1, 55, 70, 5, 6),
    container("newcontainersnc.NCammocan30", 20, 12, 2, 35, 45, 14, 16),
    container("newcontainersnc.NCammocan50", 20, 16, 4, 35, 34, 18, 20),
    container("newcontainersnc.NCbasket", 40, 8, 0.2, 65, 75, 8, 10),
    container("newcontainersnc.NCbasket_forage", 50, 15, 1, 67, 77, 15, 16),
    container("newcontainersnc.NCcanvastote", 60, 20, 1, 70, 75, 22, 24),
    container("newcontainersnc.NCcutleryroll", 30, 3, 0.1, 45, 55, 4, 5),
    container("newcontainersnc.NCfishingcreel", 50, 15, 1, 65, 75, 16, 18),
    container("newcontainersnc.NCpetcarrier", 30, 20, 0.5, 50, 65, 20, 24),
    container("newcontainersnc.NCroadsidekit", 30, 15, 0.1, 50, 65, 15, 16),
    container("newcontainersnc.NCshoppingbasket", 40, 10, 0.1, 55, 70, 11, 13),
    container("newcontainersnc.NCtacklebox", 20, 8, 1, 30, 40, 8, 10),
    container("newcontainersnc.NCtackleboxlarge", 25, 16, 2, 35, 45, 16, 18),
    container("newcontainersnc.NCsandwichbag", 0, 1, 0.01, 5, 10, 1, 2)
}

CContainers.FannyPacksFOOL = {
    container("newcontainersnc.NCforagepouch_front", 50, 2, 0.5, 78, 88, 2, 4),
    container("newcontainersnc.NCforagepouch_front_crafted", 50, 2, 0.5, 75, 85, 2, 4),
    container("newcontainersnc.NCforagepouch_back_crafted", 50, 2, 0.5, 75, 85, 2, 4),
    container("newcontainersnc.NCtoolbelt", 75, 3, 1, 80, 85, 3, 4)
}

CContainers.MiscFOOL = {
    container("newcontainersnc.NCbreadbox", 1, 1, 2, 3),
    container("newcontainersnc.NCbreadbox_crafted", 1, 1, 1, 2),
    container("newcontainersnc.NCcardboard_large", 20, 1, 22, 30),
    container("newcontainersnc.NCcardboard_medium", 15, 0.5, 16, 18),
    container("newcontainersnc.NCcardboard_small", 10, 0.1, 10, 12),
    container("newcontainersnc.NCcdbinder", 3, 1, 3, 4),
    container("newcontainersnc.NCcdcase", 1, 0.1, 1, 2),
    container("newcontainersnc.NCcoffeecan_wide", 8, 0.5, 10, 12),
    container("newcontainersnc.NCcoffeecan_slim", 4, 0.2, 5, 6),
    container("newcontainersnc.NCcomponentkit_g", 3, 0.2, 3, 4),
    container("newcontainersnc.NCcomponentkit_w", 3, 0.2, 3, 4),
    container("newcontainersnc.NCcookiejar", 5, 1, 5, 6),
    container("newcontainersnc.NCdonutbox", 1, 0.1, 1, 2),
    container("newcontainersnc.NCfakerock", 1, 0.1, 1, 2),
    container("newcontainersnc.NChardwareorganizer", 2, 0.01, 3, 4),
    container("newcontainersnc.NCjewelrybox", 1, 0.2, 2, 3),
    container("newcontainersnc.NCjewelrybox_crafted", 1, 1, 1, 2),
    container("newcontainersnc.NCkindlingbox", 10, 2, 12, 14),
    container("newcontainersnc.NCkindlingbox_crafted", 10, 2, 10, 12),
    container("newcontainersnc.NClockbox", 5, 1, 6, 8),
    container("newcontainersnc.NCmilkcrate", 30, 4, 34, 40),
    container("newcontainersnc.NCmilkcratelong", 40, 5, 42, 50),
    container("newcontainersnc.NCpiggybank", 1, 0.5, 2, 3),
    container("newcontainersnc.NCpizzabox", 1, 0.1, 1, 2),
    container("newcontainersnc.NCpizzaboxpw", 1, 0.1, 1, 2),
    container("newcontainersnc.NCplastictote_large", 40, 5, 40, 45),
    container("newcontainersnc.NCplastictote_medium", 30, 3, 30, 34),
    container("newcontainersnc.NCplastictote_small", 20, 1, 20, 22),
    container("newcontainersnc.NCplasticware", 2, 0.2, 3, 4),
    container("newcontainersnc.NCplasticware_small", 1, 0.1, 2, 3),
    container("newcontainersnc.NCplasticware_tall", 3, 0.3, 4, 5),
    container("newcontainersnc.NCroughbox", 60, 5, 65, 70),
    container("newcontainersnc.NCsandwichbag", 1, 0.01, 1, 2),
    container("newcontainersnc.NCsandwichbagbox", 1, 0.01, 1, 2),
    container("newcontainersnc.NCshoebox", 2, 0.1, 2, 3),
    container("newcontainersnc.NCspicerack", 2, 0.5, 3, 4),
    container("newcontainersnc.NCspicerack_crafted", 2, 0.5, 2, 3),
    container("newcontainersnc.NCspiffokeeper", 1, 0.1, 1, 2),
    container("newcontainersnc.NCtissuebox", 1, 0.01, 1, 1),
    container("newcontainersnc.NCtrunkorganizer", 20, 0.2, 22, 25),
}

CContainers.FannyPacksWCTP = {
    container("WCTP.WCTP_tacpack_back", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack_front", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack01_back", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack01_front", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack02_back", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack02_front", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack03_back", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack03_front", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack04_back", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack04_front", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack05_back", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack05_front", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack06_back", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack06_front", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack07_back", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack07_front", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack08_back", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_tacpack08_front", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_deserttacpack_back", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_deserttacpack_front", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_greentacpack_back", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_greentacpack_front", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_urbantacpack_back", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_urbantacpack_front", 65, 30, 0.5, 80, 90, 10, 15),
    container("WCTP.WCTP_medtacpack_back", 65, 30, 0.5, 82, 90, 10, 15),
    container("WCTP.WCTP_medtacpack_front", 65, 30, 0.5, 82, 90, 10, 15),
    container("WCTP.WCTP_toolbelt", 80, 8, 1, 82, 88, 6, 8)
}

CContainers.BackpacksBased = {
    container("BasedBackpack", 89, 30, 2.1, 89, 95, 33, 37)
}

CContainers.BackpacksTWOB = {
    container("Bag_Schoolbag_VV", 60, 15, 1, 66, 70, 18, 20),
    container("Bag_Schoolbag_Spiffo2_VV", 60, 15, 1, 66, 70, 18, 20),
    container("Bag_Schoolbag_Spiffo2_Tier_1_VV", 60, 16, 1, 68, 75, 19, 20),
    container("Bag_Schoolbag_Spiffo2_Tier_2_VV", 60, 17, 1, 70, 80, 20, 21),
    container("Bag_Schoolbag_Spiffo2_Tier_3_VV", 60, 18, 1, 72, 85, 21, 22),
    container("Bag_Schoolbag_Tier_1_VV", 60, 16, 1, 68, 75, 19, 20),
    container("Bag_Schoolbag_Tier_2_VV", 60, 17, 1, 70, 80, 20, 21),
    container("Bag_Schoolbag_Tier_3_VV", 60, 18, 1, 72, 85, 21, 22),
    container("Bag_GolfBag_VV", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_WeaponBag_VV", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_DuffelBagTINT_Tier_1_VV", 65, 19, 1, 78, 85, 29, 24),
    container("Bag_DuffelBagTINT_Tier_2_VV", 65, 20, 1, 80, 87, 30, 25),
    container("Bag_DuffelBagTINT_Tier_3_VV", 65, 21, 1, 82, 90, 31, 26),
    container("Bag_DuffelBag_Tier_1_VV", 65, 19, 1, 78, 85, 29, 24),
    container("Bag_DuffelBag_Tier_2_VV", 65, 20, 1, 80, 87, 30, 25),
    container("Bag_DuffelBag_Tier_3_VV", 65, 21, 1, 82, 90, 31, 26),
    container("Bag_MedicalBag_VV", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_NormalHikingBag_VV", 70, 20, 1.2, 80, 85, 25, 26),
    container("Bag_NormalHikingBag_Tier_2_VV", 70, 22, 1.2, 84, 89, 27, 28),
    container("Bag_NormalHikingBag_Tier_3_VV", 70, 23, 1.2, 87, 92, 28, 29),
    container("Bag_BigHikingBag_VV", 80, 22, 1.5, 87, 90, 29, 28),
    container("Bag_BigHikingBag_Tier_1_VV", 80, 23, 1.5, 88, 92, 30, 30),
    container("Bag_BigHikingBag_Tier_2_VV", 80, 24, 1.5, 90, 91, 31, 32),
    container("Bag_BigHikingBag_Tier_3_VV", 80, 25, 1.5, 91, 92, 32, 34),
    container("Bag_SurvivorBag_VV", 85, 27, 2, 88, 95, 30, 35),
    container("Bag_ALICEpack_Tier_1_VV", 85, 28, 2, 89, 95, 31, 36),
    container("Bag_ALICEpack_Tier_2_VV", 85, 29, 2, 90, 95, 32, 37),
    container("Bag_ALICEpack_Tier_3_VV", 85, 30, 2, 91, 95, 33, 38),
    container("Bag_ALICEpack_Army_VV", 85, 27, 2, 88, 95, 30, 35),
    container("Bag_ALICEpack_Army_Tier_1_VV", 87, 29, 2, 89, 95, 31, 36),
    container("Bag_ALICEpack_Army_Tier_2_VV", 87, 29, 2, 90, 95, 32, 37),
    container("Bag_ALICEpack_Army_Tier_3_VV", 87, 31, 2, 92, 96, 33, 38),
    container("Bag_ALICEpack_Festive_VV", 85, 27, 2, 88, 95, 30, 35),
    container("Bag_ALICEpack_Festive_Tier_1_VV", 87, 29, 2, 89, 95, 31, 36),
    container("Bag_ALICEpack_Festive_Tier_2_VV", 87, 29, 2, 90, 95, 32, 37),
    container("Bag_ALICEpack_Festive_Tier_3_VV", 87, 31, 2, 92, 96, 33, 38),
    container("Bag_ALICEpack_UrbanCamo_VV", 85, 27, 2, 88, 95, 30, 35),
    container("Bag_ALICEpack_UrbanCamo_Tier_1_VV", 87, 29, 2, 89, 95, 31, 36),
    container("Bag_ALICEpack_UrbanCamo_Tier_2_VV", 87, 29, 2, 90, 95, 32, 37),
    container("Bag_ALICEpack_UrbanCamo_Tier_3_VV", 87, 31, 2, 92, 96, 33, 38),
    container("Bag_B4BEvangelo_VV", 60, 15, 1, 80, 80, 23, 23),
    container("Bag_B4BEvangelo_Tier_1_VV", 60, 16, 1, 85, 85, 24, 24),
    container("Bag_B4BEvangelo_Tier_2_VV", 60, 17, 1, 87, 87, 25, 25),
    container("Bag_B4BEvangelo_Tier_3_VV", 60, 18, 1, 90, 90, 26, 26),
    container("Bag_B4BHoffman_VV", 60, 15, 1, 80, 80, 23, 23),
    container("Bag_B4BHoffman_Tier_1_VV", 60, 16, 1, 85, 85, 24, 24),
    container("Bag_B4BHoffman_Tier_2_VV", 60, 17, 1, 87, 87, 25, 25),
    container("Bag_B4BHoffman_Tier_3_VV", 60, 17, 1, 90, 90, 26, 26),
    container("Bag_B4BHolly_VV", 70, 20, 1.2, 85, 85, 26, 26),
    container("Bag_B4BHolly_Tier_1_VV", 70, 21, 1.2, 87, 87, 27, 27),
    container("Bag_B4BHolly_Tier_2_VV", 70, 22, 1.2, 90, 90, 28, 29),
    container("Bag_B4BHolly_Tier_3_VV", 70, 23, 1.2, 92, 92, 29, 30),
    container("Bag_B4BMom_VV", 60, 15, 1, 80, 82, 23, 23),
    container("Bag_B4BMom_Tier_1_VV", 60, 16, 1, 85, 85, 24, 24),
    container("Bag_B4BMom_Tier_2_VV", 60, 17, 1, 87, 88, 25, 25),
    container("Bag_B4BMom_Tier_3_VV", 60, 18, 1, 90, 90, 26, 26),
    container("Bag_B4BWalker_VV", 70, 20, 1.2, 85, 85, 22, 23),
    container("Bag_B4BWalker_Tier_1_VV", 70, 21, 1.2, 87, 87, 23, 24),
    container("Bag_B4BWalker_Tier_2_VV", 70, 22, 1.2, 90, 91, 24, 25),
    container("Bag_B4BWalker_Tier_3_VV", 70, 23, 1.2, 92, 92, 25, 26),
    container("Bag_DuffelBag_Festive_VV", 65, 18, 1, 72, 80, 28, 23),
    container("Bag_SchoolBagCEDA_VV", 60, 15, 1, 66, 70, 18, 20),
    container("Bag_SchoolBagCEDA_Tier_1_VV", 60, 16, 1, 68, 75, 19, 20),
    container("Bag_SchoolBagCEDA_Tier_2_VV", 60, 17, 1, 70, 80, 20, 21),
    container("Bag_SchoolBagCEDA_Tier_3_VV", 60, 18, 1, 72, 85, 21, 22),
    container("Bag_SchoolBagCEDABlack_VV", 60, 15, 1, 66, 70, 18, 20),
    container("Bag_SchoolBagCEDABlack_Tier_1_VV", 60, 16, 1, 68, 75, 19, 20),
    container("Bag_SchoolBagCEDABlack_Tier_2_VV", 60, 17, 1, 70, 80, 20, 21),
    container("Bag_SchoolBagCEDABlack_Tier_3_VV", 60, 18, 1, 72, 85, 21, 22),
    container("Bag_SchoolBagCEDABlue_VV", 60, 15, 1, 66, 70, 18, 20),
    container("Bag_SchoolBagCEDABlue_Tier_1_VV", 60, 16, 1, 68, 75, 19, 20),
    container("Bag_SchoolBagCEDABlue_Tier_2_VV", 60, 17, 1, 70, 80, 20, 21),
    container("Bag_SchoolBagCEDABlue_Tier_3_VV", 60, 18, 1, 72, 85, 21, 22),
    container("Bag_SchoolBagCEDARed_VV", 60, 15, 1, 66, 70, 18, 20),
    container("Bag_SchoolBagCEDARed_Tier_1_VV", 60, 16, 1, 68, 75, 19, 20),
    container("Bag_SchoolBagCEDARed_Tier_2_VV", 60, 17, 1, 70, 80, 20, 21),
    container("Bag_SchoolBagCEDARed_Tier_3_VV", 60, 18, 1, 72, 85, 21, 22),
    container("Bag_SchoolBagNBH_VV", 60, 15, 1, 66, 70, 18, 20),
    container("Bag_SchoolBagNBH_Tier_1_VV", 60, 16, 1, 68, 75, 19, 20),
    container("Bag_SchoolBagNBH_Tier_2_VV", 60, 17, 1, 70, 80, 20, 21),
    container("Bag_SchoolBagNBH_Tier_3_VV", 60, 18, 1, 72, 85, 21, 22),
    container("Bag_SpiffoBackpackAZ_VV", 20, 10, 1, 40, 75, 12, 16),
    container("Bag_SpiffoBackpackAZ_Tier_1_VV", 20, 11, 1, 41, 77, 13, 17),
    container("Bag_SpiffoBackpackAZ_Tier_2_VV", 20, 12, 1, 42, 79, 14, 18),
    container("Bag_SpiffoBackpackAZ_Tier_3_VV", 20, 13, 1, 44, 82, 15, 19),
    container("Bag_RoadsideDuffel_VV", 50, 10, 1, 78, 85, 15, 20),
    container("Bag_RoadsideDuffel_Tier_1_VV", 65, 11, 1, 78, 85, 29, 24),
    container("Bag_RoadsideDuffel_Tier_2_VV", 65, 12, 1, 80, 87, 30, 25),
    container("Bag_RoadsideDuffel_Tier_3_VV", 65, 13, 1, 80, 87, 31, 27),
    container("Bag_BigSwatBag_VV", 85, 35, 3, 80, 90, 34, 40),
    container("Bag_PoliceBag_VV", 90, 22, 2, 90, 92, 24, 25),
    container("HeadhunterBackpack_VV", 85, 21, 1.2, 87, 88, 25, 27),
    container("DeadlyHeadhunterBackpack_VV", 85, 21, 1.2, 87, 88, 25, 27),
    container("NomadBackpack_VV", 89, 34, 5, 89, 95, 31, 36),
    container("Bag_Sniper_Pack_VV", 85, 38, 2, 90, 95, 33, 37),
    container("Bag_ARVN_Rucksack_VV", 85, 38, 2, 88, 90, 31, 36),
    container("Bag_ARVN_Rucksack_Tier_1_VV", 85, 29, 2, 89, 95, 31, 36),
    container("Bag_ARVN_Rucksack_Tier_2_VV", 85, 30, 2, 90, 95, 32, 37),
    container("Bag_ARVN_Rucksack_Tier_3_VV", 85, 31, 2, 91, 96, 33, 38),
    container("Bag_ST53_Set_VV", 85, 38, 2, 86, 90, 30, 36),
    container("Bag_SCBA_VV", 85, 38, 2, 85, 90, 31, 35),
    container("Bag_ZIP_VV", 85, 38, 2, 89, 95, 32, 37),
    container("Bag_SSO_VV", 85, 38, 2, 90, 90, 30, 35),
    container("Bag_Savotta_VV", 85, 38, 2, 86, 90, 30, 34),
    container("Bag_Bush_VV", 85, 38, 2, 85, 90, 27, 35),
    container("Bag_Hunting_VV", 85, 38, 2, 85, 95, 29, 34),
    container("Bag_Radio_Pack_VV", 85, 38, 2, 92, 95, 22, 28),
    container("Bag_Tactical_Alice_VV", 85, 38, 3, 90, 92, 31, 35),
    container("Bag_Cat_Pack_VV", 85, 38, 3, 91, 95, 27, 30),
    container("Bag_Robbie_Pack_VV", 85, 38, 3, 88, 90, 27, 30),
    container("Bag_Hazard_Cross_VV", 80, 38, 2, 89, 92, 30, 32),
    container("Bag_Dozer_Pack_VV", 80, 38, 2, 89, 91, 31, 33),
    container("ELA_Bag_VV", 80, 38, 2, 90, 92, 28, 29),
    container("OMNI_Bag_VV", 80, 38, 2, 89, 91, 27, 29),
    container("KIP5_VV", 80, 38, 2, 87, 89, 31, 32),
    container("AP3_VV", 80, 38, 2, 85, 88, 30, 32),
    container("IP46_VV", 80, 38, 2, 85, 87, 30, 32),
    container("Sheriff_Bag_VV", 80, 38, 2, 72, 80, 28, 23),
    container("Trauma_Bag_VV", 80, 38, 2, 86, 88, 29, 33),
    container("Casual_Bag_VV", 80, 38, 2, 80, 82, 30, 33),
    container("Bushcraft_Bag_VV", 80, 38, 2, 82, 84, 29, 32),
    container("Bread_Bag_VV", 80, 38, 2, 82, 84, 30, 32),
    container("Bread_Sack_VV", 80, 38, 2, 80, 82, 30, 32),
    container("Army_Duffle_Bag_VV", 80, 38, 2, 72, 80, 28, 23),
    container("Trench_Tornister_VV", 80, 38, 2, 76, 78, 32, 36),
    container("Baker_Tent_VV", 80, 38, 2, 82, 84, 38, 40),
    container("Baker_Tent_2_VV", 80, 38, 2, 82, 84, 38, 40),
    container("Baker_Tent_3_VV", 80, 38, 2, 82, 84, 38, 40),
    container("Baker_Tent_4_VV", 80, 38, 2, 82, 84, 38, 40),
    container("Baker_Tent_5_VV", 80, 38, 2, 82, 84, 38, 40),
    container("Baker_Tent_6_VV", 80, 38, 2, 82, 84, 38, 40),
    container("Hunter_Backpack_VV", 80, 38, 2, 85, 88, 29, 35),
    container("Metro_Bag_VV", 80, 38, 2, 89, 92, 27, 32),
    container("Multi_Carrier_Wood_VV", 80, 38, 2, 80, 85, 25, 27),
    container("Multi_Carrier_Ammo_VV", 80, 38, 2, 80, 85, 25, 27),
    container("Multi_Carrier_Food_VV", 80, 38, 2, 80, 85, 25, 27),
    container("Bag_ALICEpack_Insurgent_VV", 90, 45, 2.5, 90, 95, 30, 35),
    container("Backpack_01-Black_VV", 65, 17, 1, 72, 90, 19, 23),
    container("Backpack_01-Desert_VV", 65, 17, 1, 72, 90, 19, 23),
    container("Backpack_01-Green_VV", 65, 17, 1, 72, 90, 19, 23),
    container("Backpack_01-White_VV", 65, 17, 1, 72, 90, 19, 23),
    container("Bag_Packsport_Plain_VV", 65, 17, 1, 72, 90, 19, 23),
    container("Bag_Packsport_Plain_Tier_1_VV", 65, 18, 1, 74, 92, 20, 24),
    container("Bag_Packsport_Plain_Tier_2_VV", 68, 19, 1, 75, 90, 21, 25),
    container("Bag_Packsport_Plain_Tier_3_VV", 65, 20, 1, 78, 92, 22, 26),
    container("Bag_Packsport_Rim_VV", 65, 17, 1, 72, 90, 19, 23),
    container("Bag_Packsport_Rim_Tier_1_VV", 65, 18, 1, 74, 92, 20, 24),
    container("Bag_Packsport_Rim_Tier_2_VV", 68, 19, 1, 75, 90, 21, 25),
    container("Bag_Packsport_Rim_Tier_3_VV", 65, 20, 1, 78, 92, 22, 26),
    container("Bag_ALICEpack_WaGDC_Tier_3_VV", 90, 30, 2, 91, 95, 33, 38),
    container("Bag_ALICEpack_WaGDC_Tier_2_VV", 87, 29, 2, 90, 95, 32, 37),
    container("Bag_ALICEpack_WaGDC_Tier_1_VV", 86, 28, 2, 89, 95, 31, 36),
    container("Bag_ALICEpack_WaGDC_VV", 85, 26, 1.8, 88, 95, 30, 35),
    container("Bag_ALICEpack_Sand_Tier_3_VV", 90, 30, 2, 91, 95, 33, 38),
    container("Bag_ALICEpack_Sand_Tier_2_VV", 87, 29, 2, 90, 95, 32, 37),
    container("Bag_ALICEpack_Sand_Tier_1_VV", 86, 28, 2, 89, 95, 31, 36),
    container("Bag_ALICEpack_Sand_VV", 85, 26, 1.8, 88, 95, 30, 35),
    container("Bag_ALICEpack_PinkSkyBlue_Tier_3_VV", 90, 30, 2, 91, 95, 33, 38),
    container("Bag_ALICEpack_PinkSkyBlue_Tier_2_VV", 87, 29, 2, 90, 95, 32, 37),
    container("Bag_ALICEpack_PinkSkyBlue_Tier_1_VV", 86, 28, 2, 89, 95, 31, 36),
    container("Bag_ALICEpack_PinkSkyBlue_VV", 85, 26, 1.8, 88, 95, 30, 35),
    container("Bag_ALICEpack_Olive_Tier_3_VV", 90, 30, 2, 91, 95, 33, 38),
    container("Bag_ALICEpack_Olive_Tier_2_VV", 87, 29, 2, 90, 95, 32, 37),
    container("Bag_ALICEpack_Olive_Tier_1_VV", 86, 28, 2, 89, 95, 31, 36),
    container("Bag_ALICEpack_Olive_VV", 85, 26, 1.8, 88, 95, 30, 35),
    container("Bag_ALICEpack_GaPDC_Tier_3_VV", 90, 30, 2, 91, 95, 33, 38),
    container("Bag_ALICEpack_GaPDC_Tier_2_VV", 87, 29, 2, 90, 95, 32, 37),
    container("Bag_ALICEpack_GaPDC_Tier_1_VV", 86, 28, 2, 89, 95, 31, 36),
    container("Bag_ALICEpack_GaPDC_VV", 85, 26, 1.8, 88, 95, 30, 35),
    container("Bag_ALICEpack_Black_Tier_3_VV", 90, 30, 2, 91, 95, 33, 38),
    container("Bag_ALICEpack_Black_Tier_2_VV", 87, 29, 2, 90, 95, 32, 37),
    container("Bag_ALICEpack_Black_Tier_1_VV", 86, 28, 2, 89, 95, 31, 36),
    container("Bag_ALICEpack_Black_VV", 85, 26, 1.8, 88, 95, 30, 35),
    container("Bag_ALICEpack_Spike_Tier_3_VV", 90, 30, 2, 91, 95, 33, 38),
    container("Bag_ALICEpack_Spike_Tier_2_VV", 87, 29, 2, 90, 95, 32, 37),
    container("Bag_ALICEpack_Spike_Tier_1_VV", 86, 28, 2, 89, 95, 31, 36),
    container("Bag_ALICEpack_Spike_VV", 85, 26, 1.8, 88, 95, 30, 35),
    container("Bag_Sheet_Bag_VV", 35, 8, 1, 55, 70, 9, 11),
    container("Bag_Improvised_Backpack_VV", 60, 15, 1, 66, 70, 18, 20),
    container("ParachuteContainer_VV", 70, 20, 0.8, 72, 85, 21, 22),
    container("Ham_Radio_VV", 80, 38, 2, 85, 90, 31, 36),
    container("Multi_Carrier_Carl_VV", 80, 38, 2, 85, 90, 31, 36),
    container("Bag_NormalHikingBag_Tier_1_VV", 70, 21, 1.2, 82, 87, 26, 27)
}

CContainers.BackpacksMoreBags = {
    container("MoreBags.SlingBag", 75, 12, 0.8, 80, 86, 13, 16),
    container("MoreBags.Rucksack", 65, 22, 1, 74, 82, 23, 26),
    container("MoreBags.FirefighterBag", 70, 18, 1, 76, 84, 20, 24),
    container("MoreBags.PoliceBag", 70, 18, 1, 76, 84, 20, 24),
    container("MoreBags.SackBag", 35, 15, 0.4, 83, 88, 16, 20),
    container("MoreBags.RangerBag", 65, 18, 1, 68, 75, 19, 20),
    container("MoreBags.TacticalBag", 75, 22, 1.5, 80, 85, 25, 26)
}

CContainers.ChestRigsAmmoPouch = {
    container("Ammo_Pouch", 97, 8, 4, 92, 96, 8, 10),
    container("Ammo_Pouch_Empty", 97, 8, 4, 92, 96, 8, 10),
    container("Ammo_Pouch_No_Bag", 85, 5, 1.2, 90, 95, 6, 7),
    container("Ammo_Pouch_No_Bag_B", 85, 5, 1.2, 90, 95, 6, 7),
    container("Ammo_Pouch_No_Bag_C", 85, 5, 1.2, 90, 95, 6, 7),
    container("Ammo_Pouch_No_Bag_D", 85, 5, 1.2, 90, 95, 6, 7),
    container("Ammo_Pouch_No_Bag_E", 85, 5, 1.2, 90, 95, 6, 7),
    container("Ammo_Pouch_No_Bag_Flip", 85, 4, 1.2, 88, 92, 5, 6),
    container("Ammo_Pouch_No_Bag_Flip_B", 85, 4, 1.2, 88, 92, 5, 6),
    container("Ammo_Pouch_No_Bag_Flip_C", 85, 4, 1.2, 88, 92, 5, 6),
    container("Ammo_Pouch_No_Bag_Flip_D", 85, 4, 1.2, 88, 92, 5, 6),
    container("Ammo_Pouch_No_Bag_Flip_E", 85, 4, 1.2, 88, 92, 5, 6),
    container("Ammo_Pouch_Bag", 97, 2, 0.8, 89, 91, 3, 4),
    container("Ammo_Pouch_Bag_B", 97, 3, 0.8, 89, 91, 4, 5),
    container("Ammo_Pouch_Bag_C", 97, 3, 0.8, 89, 91, 4, 5),
    container("Ammo_Pouch_Bag_D", 97, 3, 0.8, 89, 91, 4, 5),
    container("Ammo_Pouch_Bag_E", 97, 3, 0.8, 89, 91, 4, 5),
    container("Ammo_Pouch_Empty_Flip_AA", 97, 6, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_AB", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_Empty_AB", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_Flip_AB", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_Empty_Flip_AB", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_AC", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_Empty_AC", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_Flip_AC", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_Empty_Flip_AC", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_AD", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_Empty_AD", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_Flip_AD", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_Empty_Flip_AD", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_AE", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_Empty_AE", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_Flip_AE", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_Empty_Flip_AE", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_BA", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_Empty_BA", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_Flip_BA", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_Empty_Flip_BA", 97, 7, 4, 93, 96, 7, 8),
    container("Ammo_Pouch_BB", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_BB", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_BB", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_BB", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_BC", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_BC", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_BC", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_BC", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_BD", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_BD", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_BD", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_BD", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_BE", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_BE", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_BE", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_BE", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_CA", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_CA", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_CA", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_CA", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_CB", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_CB", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_CB", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_CB", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_CC", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_CC", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_CC", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_CC", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_CD", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_CD", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_CD", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_CD", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_CE", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_CE", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_CE", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_CE", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_DA", 97, 7, 4, 93, 96, 8, 9),
    container("Ammo_Pouch_Empty_DA", 97, 7, 4, 93, 96, 8, 9),
    container("Ammo_Pouch_Flip_DA", 97, 7, 4, 93, 96, 8, 9),
    container("Ammo_Pouch_Empty_Flip_DA", 97, 7, 4, 93, 96, 8, 9),
    container("Ammo_Pouch_DB", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_DB", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_DB", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_DB", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_DC", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_DC", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_DC", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_DC", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_DD", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_DD", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_DD", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_DD", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_DE", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_DE", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_DE", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_DE", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_EA", 97, 7, 4, 93, 96, 8, 9),
    container("Ammo_Pouch_Empty_EA", 97, 7, 4, 93, 96, 8, 9),
    container("Ammo_Pouch_Flip_EA", 97, 7, 4, 93, 96, 8, 9),
    container("Ammo_Pouch_Empty_Flip_EA", 97, 7, 4, 93, 96, 8, 9),
    container("Ammo_Pouch_EB", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_EB", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_EB", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_EB", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_EC", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_EC", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_EC", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_EC", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_ED", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_ED", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_ED", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_ED", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_EE", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_EE", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_EE", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Empty_Flip_EE", 97, 8, 4, 92, 95, 9, 10),
    container("Ammo_Pouch_Flip_AA", 97, 6, 4, 92, 95, 9, 10)
}

CContainers.BackpackszReArmor = {
    container("zRe_Backpack_Paladin_Black", 87, 28, 2, 87, 89, 30, 35),
    container("zRe_Backpack_Paladin_Green", 87, 28, 2, 87, 89, 30, 35),
    container("zRe_Backpack_Paladin_Olive", 87, 28, 2, 87, 89, 30, 35),
    container("zRe_Backpack_Tractor", 87, 28, 2, 87, 90, 30, 34)
}

CContainers.ChestRigszReArmor = {
    container("zRe_Interceptor_Pouches", 90, 12, 1, 88, 92, 13, 15),
    container("zRe_Interceptor_Pouches_Straps", 90, 12, 1, 88, 92, 13, 15),
    container("zRe_NabedroRykzak_Black", 90, 6, 0.5, 92, 94, 7, 8),
    container("zRe_NabedroRykzak_Green", 90, 6, 0.5, 92, 94, 7, 8),
    container("zRe_NabedroRykzak_Olive", 90, 6, 0.5, 92, 94, 7, 8)
}

CContainers.BackpacksHelloKitty = {
    container("kuromibackpack.kuromi_backpack", 80, 30, 1.2, 82, 85, 30, 35),
    container("kuromibackpack.hellokitty_backpack", 80, 30, 1.2, 82, 85, 30, 35),
    container("kuromibackpack.mymelody_backpack", 80, 30, 1.2, 82, 85, 30, 35),
    container("kuromibackpack.cinnamoroll_backpack", 80, 30, 1.2, 82, 85, 30, 35),
    container("kuromibackpack.badtzmaru_backpack", 80, 30, 1.2, 82, 85, 30, 35),
    container("kuromibackpack.Keroppi_backpack", 80, 30, 1.2, 82, 85, 30, 35),
    container("kuromibackpack.pompompurin_backpack", 80, 30, 1.2, 82, 85, 30, 35)
}

CContainers.ChestRigsBraStorage = {
    container("Bra_Strapless_FrillyPink", 70, 1, 0.2, 86, 90, 1, 2),
    container("Bra_Straps_FrillyPink", 70, 1, 0.2, 86, 90, 1, 2),
    container("Bra_Strapless_FrillyRed", 70, 1, 0.2, 86, 90, 1, 2),
    container("Bra_Straps_FrillyRed", 70, 1, 0.2, 86, 90, 1, 2),
    container("Bra_Strapless_FrillyBlack", 70, 1, 0.2, 86, 90, 1, 2),
    container("Bra_Straps_FrillyBlack", 70, 1, 0.2, 86, 90, 1, 2),
    container("Bra_Strapless_AnimalPrint", 70, 1, 0.2, 86, 90, 1, 2),
    container("Bra_Straps_AnimalPrint", 70, 1, 0.2, 86, 90, 1, 2),
    container("Bra_Strapless_RedSpots", 70, 1, 0.2, 86, 90, 1, 2),
    container("Bra_Strapless_Black", 70, 1, 0.2, 86, 90, 1, 2),
    container("Bra_Straps_Black", 70, 1, 0.2, 86, 90, 1, 2),
    container("Bra_Strapless_White", 70, 1, 0.2, 86, 90, 1, 2),
    container("Bra_Straps_White", 70, 1, 0.2, 86, 90, 1, 2)
}

CContainers.BagsBBoxes = {
    container("BBoxes.GuitarCase", 65, 18, 2.1, 65, 70, 8, 9),
    container("BBoxes.GunCase", 85, 26, 2.1, 80, 85, 20, 26),
    container("BBoxes.SmallGunCase", 30, 15, 1, 40, 50, 12, 15),
    container("BBoxes.BBox_MedKit", 15, 10, 2, 35, 55, 8, 10),
    container("BBoxes.BBox_ToolBox", 20, 10, 2, 30, 50, 11, 12),
    container("BBoxes.CardBoard_Magazine", 10, 20, 0.1, 20, 30, 20, 25),
    container("BBoxes.CardBoard_Books", 10, 20, 0.1, 20, 30, 20, 25),
    container("BBoxes.SmallCardBoard_Books", 10, 10, 1, 20, 30, 12, 15),
    container("BBoxes.SmallCardBoard_Magazine", 10, 10, 1, 20, 30, 12, 15),
    container("BBoxes.BBox_Briefcase", 5, 7, 1.5, 12, 15, 11, 12)
}

CContainers.ChestRigsStalker = {
    container("ExoskeletonBandits", 90, 55, 2, 83, 88, 30, 36),
    container("ExoskeletonCS", 90, 55, 2, 83, 88, 30, 36),
    container("ExoskeletonDuty", 90, 55, 2, 83, 88, 30, 36),
    container("ExoskeletonEcologists", 90, 55, 2, 83, 88, 30, 36),
    container("ExoskeletonMercs", 90, 55, 2, 83, 88, 30, 36),
    container("ExoskeletonMilitary", 90, 55, 2, 83, 88, 30, 36),
    container("ExoskeletonMonolith", 90, 55, 2, 83, 88, 30, 36),
    container("ExoskeletonLoner", 90, 55, 2, 83, 88, 30, 36),
    container("ExoskeletonSin", 90, 55, 2, 83, 88, 30, 36),
    container("ExoskeletonRenegades", 90, 55, 2, 83, 88, 30, 36),
    container("ExoskeletonUNISG", 90, 55, 2, 83, 88, 30, 36),
    container("ExoskeletonFreedom", 90, 55, 2, 83, 88, 30, 36)
}

CContainers.FannyPacksStalker = {
    container("LeadContainerBack", 50, 1, 0.2, 88, 90, 4, 4),
    container("LeadContainerFront", 50, 1, 0.2, 88, 90, 4, 4),
    container("AACBack", 50, 1, 0.2, 88, 90, 4, 4),
    container("AACFront", 50, 1, 0.2, 88, 90, 4, 4),
    container("AAMBack", 50, 1, 0.2, 88, 90, 4, 4),
    container("AAMFront", 50, 1, 0.2, 88, 90, 4, 4),
    container("IAMBack", 50, 1, 0.2, 88, 90, 4, 4),
    container("IAMFront", 50, 1, 0.2, 88, 90, 4, 4)
}

CContainers.BackpacksGoth = {
    container("gothBags.Bag_Coffin_Bat", 82, 22, 2, 86, 90, 23, 28),
    container("gothBags.Bag_Coffin_Bat_Pink", 82, 22, 2, 86, 90, 23, 28),
    container("gothBags.Bag_Coffin_Bat_Lavender", 82, 22, 2, 86, 90, 23, 28),
    container("gothBags.Bag_Coffin_Big", 87, 28, 2, 82, 88, 30, 33),
    container("gothBags.Bag_Goth_Kitty", 60, 18, 1.5, 66, 70, 18, 20),
    container("gothBags.Bag_Goth_Orbit", 75, 24, 1.5, 85, 90, 24, 27),
    container("gothBags.Bag_Goth_Seraphim", 75, 24, 1.5, 85, 90, 24, 27),
    container("gothBags.Bag_Goth_Pentagram", 70, 18, 1.5, 74, 80, 19, 22),
    container("gothBags.Bag_Goth_Mushroom", 65, 18, 1.5, 66, 70, 18, 20),
    container("gothBags.Bag_Goth_Heart", 65, 18, 1.5, 66, 70, 18, 20),
    container("gothBags.Bag_Goth_Spiky", 87, 28, 2, 85, 87, 30, 33)
}

CContainers.FannyPacksGoth = {
    container("gothBags.Bag_Goth_FannyBack", 65, 2, 0.2, 88, 90, 4, 4),
    container("gothBags.Bag_Goth_FannyFront", 65, 2, 0.2, 88, 90, 4, 4),
    container("gothBags.Bag_Goth_FannyBack_Opal", 65, 2, 0.2, 88, 90, 4, 4),
    container("gothBags.Bag_Goth_FannyFront_Opal", 65, 2, 0.2, 88, 90, 4, 4)
}

CContainers.SatchelsGoth = {
    container("gothBags.Bag_Goth_Satchel", 70, 15, 1, 87, 90, 15, 20),
    container("gothBags.Bag_Goth_Satchel_Front", 70, 15, 1, 87, 90, 15, 20)
}

CContainers.BackpacksKATTAJ = {
    container("Military_Backpack_Pocket_Small-Black_Tight", 94, 15, 1, 92, 95, 18, 22),
    container("Military_Backpack_Pocket_Small-Green_Tight", 94, 15, 1, 92, 95, 18, 22),
    container("Military_Backpack_Strategist_Medium-Green", 90, 22, 2, 88, 92, 23, 26),
    container("Military_Backpack_Strategist_Medium-Green_Tight", 90, 22, 2, 88, 92, 23, 26),
    container("Military_Backpack_Strategist_Medium-White", 90, 22, 2, 88, 92, 23, 26),
    container("Military_Backpack_Strategist_Medium-White_Tight", 90, 22, 2, 88, 92, 23, 26),
    container("Military_Backpack_Ranger_Large-Black", 90, 30, 2, 88, 95, 31, 36),
    container("Military_Backpack_Ranger_Large-Black_Tight", 90, 30, 2, 88, 95, 31, 36),
    container("Military_Backpack_Ranger_Large-Desert", 90, 30, 2, 88, 95, 31, 36),
    container("Military_Backpack_Ranger_Large-Desert_Tight", 90, 30, 2, 88, 95, 31, 36),
    container("Military_Backpack_Ranger_Large-Green", 90, 30, 2, 88, 95, 31, 36),
    container("Military_Backpack_Ranger_Large-Green_Tight", 90, 30, 2, 88, 95, 31, 36),
    container("Military_Backpack_Ranger_Large-White", 90, 30, 2, 88, 95, 31, 36),
    container("Military_Backpack_Ranger_Large-White_Tight", 90, 30, 2, 88, 95, 31, 36),
    container("Military_Backpack_Colossus_VeryLarge-Black", 85, 40, 3, 85, 91, 34, 38),
    container("Military_Backpack_Colossus_VeryLarge-Black_Tight", 85, 40, 3, 85, 91, 34, 38),
    container("Military_Backpack_Colossus_VeryLarge-Desert", 85, 40, 3, 85, 91, 34, 38),
    container("Military_Backpack_Colossus_VeryLarge-Desert_Tight", 85, 40, 3, 85, 91, 34, 38),
    container("Military_Backpack_Colossus_VeryLarge-Green", 85, 40, 3, 85, 91, 34, 38),
    container("Military_Backpack_Colossus_VeryLarge-Green_Tight", 85, 40, 3, 85, 91, 34, 38),
    container("Military_Backpack_Colossus_VeryLarge-White", 85, 40, 3, 85, 91, 34, 38),
    container("Military_Backpack_Colossus_VeryLarge-White_Tight", 85, 40, 3, 85, 91, 34, 38),
    container("Military_Backpack_Echo_Radio-Black", 90, 25, 2, 90, 94, 27, 30),
    container("Military_Backpack_Echo_Radio-Black_Tight", 90, 25, 2, 90, 94, 27, 30),
    container("Military_Backpack_Echo_Radio-Desert", 90, 25, 2, 90, 94, 27, 30),
    container("Military_Backpack_Echo_Radio-Desert_Tight", 90, 25, 2, 90, 94, 27, 30),
    container("Military_Backpack_Echo_Radio-Green", 90, 25, 2, 90, 94, 27, 30),
    container("Military_Backpack_Echo_Radio-Green_Tight", 90, 25, 2, 90, 94, 27, 30),
    container("Military_Backpack_Echo_Radio-White", 90, 25, 2, 90, 94, 27, 30),
    container("Military_Backpack_Echo_Radio-White_Tight", 90, 25, 2, 90, 94, 27, 30),
    container("Military_Backpack_Strategist_Medium-Desert_Tight", 90, 22, 2, 90, 94, 25, 28),
    container("Military_Backpack_Strategist_Medium-Desert", 90, 22, 2, 90, 94, 25, 28),
    container("Military_Backpack_Strategist_Medium-Black_Tight", 90, 22, 2, 90, 94, 25, 28),
    container("Military_Backpack_Strategist_Medium-Black", 90, 22, 2, 90, 94, 25, 28)
}

CContainers.FannyPacksKATTAJ = {
    container("Military_BagBack_StormPack_Small-Black", 80, 4, 0.5, 88, 90, 4, 5),
    container("Military_BagBack_StormPack_Small-Desert", 80, 4, 0.5, 88, 90, 4, 5),
    container("Military_BagBack_StormPack_Small-Green", 80, 4, 0.5, 88, 90, 4, 5),
    container("Military_BagBack_StormPack_Small-White", 80, 4, 0.5, 88, 90, 4, 5),
    container("Military_BagBack_StormPack_Small-Medic", 80, 4, 0.5, 88, 90, 4, 5),
    container("Military_BagBack_StormPack_Medium-Black", 80, 8, 1, 86, 88, 7, 8),
    container("Military_BagBack_StormPack_Medium-Desert", 80, 8, 1, 86, 88, 7, 8),
    container("Military_BagBack_StormPack_Medium-Green", 80, 8, 1, 86, 88, 7, 8),
    container("Military_BagBack_StormPack_Medium-White", 80, 8, 1, 86, 88, 7, 8),
    container("Military_BagBack_StormPack_Medium-Medic", 80, 8, 1, 86, 88, 7, 8),
    container("Military_BagBack_StormPack_Large-Black", 80, 12, 1, 85, 87, 10, 12),
    container("Military_BagBack_StormPack_Large-Desert", 80, 12, 1, 85, 87, 10, 12),
    container("Military_BagBack_StormPack_Large-Green", 80, 12, 1, 85, 87, 10, 12),
    container("Military_BagBack_StormPack_Large-White", 80, 12, 1, 85, 87, 10, 12),
    container("Military_BagBack_StormPack_Large-Medic", 80, 12, 1, 85, 87, 10, 12),
    container("Military_BagFront_ChestPouches_Small-Black", 80, 2, 0.5, 90, 94, 2, 3),
    container("Military_BagFront_ChestPouches_Small-Desert", 80, 2, 0.5, 90, 94, 2, 3),
    container("Military_BagFront_ChestPouches_Small-Green", 80, 2, 0.5, 90, 94, 2, 3),
    container("Military_BagFront_ChestPouches_Small-White", 80, 2, 0.5, 90, 94, 2, 3),
    container("Military_BagFront_ChestPouches_Medium-Black", 80, 4, 1, 88, 90, 4, 5),
    container("Military_BagFront_ChestPouches_Medium-Desert", 80, 4, 1, 88, 90, 4, 5),
    container("Military_BagFront_ChestPouches_Medium-Green", 80, 4, 1, 88, 90, 4, 5),
    container("Military_BagFront_ChestPouches_Medium-White", 80, 4, 1, 88, 90, 4, 5),
    container("Military_BagFront_ChestPouches_Large-Black", 80, 6, 1, 86, 89, 6, 7),
    container("Military_BagFront_ChestPouches_Large-Desert", 80, 6, 1, 86, 89, 6, 7),
    container("Military_BagFront_ChestPouches_Large-Green", 80, 6, 1, 86, 89, 6, 7),
    container("Military_BagFront_ChestPouches_Large-White", 80, 6, 1, 86, 89, 6, 7),
    container("Military_BagLeg_MagSecure_Small-Black_Left", 75, 4, 0.5, 86, 88, 4, 4),
    container("Military_BagLeg_MagSecure_Small-Black_Right", 75, 4, 0.5, 86, 88, 4, 4),
    container("Military_BagLeg_MagSecure_Small-Black_ArmorLeft", 75, 4, 0.5, 86, 88, 4, 4),
    container("Military_BagLeg_MagSecure_Small-Black_ArmorRight", 75, 4, 0.5, 86, 88, 4, 4),
    container("Military_BagLeg_MagSecure_Small-Desert_Left", 75, 4, 0.5, 86, 88, 4, 4),
    container("Military_BagLeg_MagSecure_Small-Desert_Right", 75, 4, 0.5, 86, 88, 4, 4),
    container("Military_BagLeg_MagSecure_Small-Desert_ArmorLeft", 75, 4, 0.5, 86, 88, 4, 4),
    container("Military_BagLeg_MagSecure_Small-Desert_ArmorRight", 75, 4, 0.5, 86, 88, 4, 4),
    container("Military_BagLeg_MagSecure_Small-Green_Left", 75, 4, 0.5, 86, 88, 4, 4),
    container("Military_BagLeg_MagSecure_Small-Green_Right", 75, 4, 0.5, 86, 88, 4, 4),
    container("Military_BagLeg_MagSecure_Small-Green_ArmorLeft", 75, 4, 0.5, 86, 88, 4, 4),
    container("Military_BagLeg_MagSecure_Small-Green_ArmorRight", 75, 4, 0.5, 86, 88, 4, 4),
    container("Military_BagLeg_MagSecure_Small-White_Left", 75, 4, 0.5, 86, 88, 4, 4),
    container("Military_BagLeg_MagSecure_Small-White_Right", 75, 4, 0.5, 86, 88, 4, 4),
    container("Military_BagLeg_MagSecure_Small-White_ArmorLeft", 75, 4, 0.5, 86, 88, 4, 4),
    container("Military_BagLeg_MagSecure_Small-White_ArmorRight", 75, 4, 0.5, 86, 88, 4, 4),
    container("Military_BagLeg_Utility_Medium-Black_Left", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-Black_Right", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-Black_ArmorLeft", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-Black_ArmorRight", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-Desert_Left", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-Desert_Right", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-Desert_ArmorLeft", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-Desert_ArmorRight", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-Green_Left", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-Green_Right", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-Green_ArmorLeft", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-Green_ArmorRight", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-White_Right", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-White_ArmorLeft", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-White_ArmorRight", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-Medic_Left", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-Medic_Right", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-Medic_ArmorLeft", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-Medic_ArmorRight", 75, 8, 0.5, 82, 86, 7, 8),
    container("Military_BagLeg_Utility_Medium-White_Left", 75, 8, 0.5, 82, 86, 7, 8)
}

CContainers.BackpacksCBackpacks = {
    container("CombineBPACK_items.SchoolBagLVL1", 70, 20, 1.2, 68, 75, 19, 20),
    container("CombineBPACK_items.SchoolBagLVL2", 75, 25, 1.4, 69, 78, 20, 21),
    container("CombineBPACK_items.SchoolBagLVL3", 80, 30, 1.6, 70, 80, 20, 21),
    container("CombineBPACK_items.SchoolBagLVL4", 85, 35, 1.8, 71, 83, 21, 22),
    container("CombineBPACK_items.SchoolBagLVL5", 90, 40, 2, 72, 85, 21, 22),
    container("CombineBPACK_items.DuffelBagLVL1", 70, 24, 1.3, 78, 85, 29, 24),
    container("CombineBPACK_items.DuffelBagLVL2", 75, 31, 1.6, 79, 86, 30, 25),
    container("CombineBPACK_items.DuffelBagLVL3", 80, 37, 1.8, 80, 87, 30, 25),
    container("CombineBPACK_items.DuffelBagLVL4", 85, 44, 2.1, 81, 88, 31, 26),
    container("CombineBPACK_items.DuffelBagLVL5", 90, 50, 2.5, 82, 90, 31, 26),
    container("CombineBPACK_items.HikingBagLVL1", 85, 29, 1.8, 88, 92, 30, 30),
    container("CombineBPACK_items.HikingBagLVL2", 90, 33, 2.1, 89, 92, 30, 30),
    container("CombineBPACK_items.HikingBagLVL3", 95, 44, 2.4, 90, 91, 31, 32),
    container("CombineBPACK_items.HikingBagLVL4", 97, 52, 2.7, 91, 92, 31, 32),
    container("CombineBPACK_items.HikingBagLVL5", 98, 60, 3, 91, 92, 32, 34),
    container("CombineBPACK_items.ALICEpack_LVL1", 85, 33, 2.3, 89, 95, 31, 36),
    container("CombineBPACK_items.ALICEpack_LVL2", 90, 41, 2.7, 90, 95, 32, 36),
    container("CombineBPACK_items.ALICEpack_LVL3", 95, 53, 3.1, 90, 95, 32, 37),
    container("CombineBPACK_items.ALICEpack_LVL4", 97, 65, 3.5, 91, 95, 32, 37),
    container("CombineBPACK_items.ALICEpack_LVL5", 99, 72, 4, 91, 95, 33, 38),
    container("CombineBPACK_items.ALICEarmy_LVL1", 87, 45, 2.4, 89, 95, 31, 36),
    container("CombineBPACK_items.ALICEarmy_LVL2", 90, 62, 2.7, 90, 95, 31, 36),
    container("CombineBPACK_items.ALICEarmy_LVL3", 95, 76, 3.1, 90, 95, 32, 37),
    container("CombineBPACK_items.ALICEarmy_LVL4", 98, 89, 3.6, 92, 96, 32, 37),
    container("CombineBPACK_items.ALICEarmy_LVL5", 99, 98, 4, 92, 96, 33, 38),
    container("CombineBPACK_items.Craftable_DuffelBag", 65, 18, 1, 72, 80, 28, 23),
    container("CombineBPACK_items.Craftable_ALICEpack", 85, 27, 1, 88, 95, 30, 35)
}

CContainers.BackpacksOCP = {
    container("OCP-Utility_Bag", 80, 14, 1, 85, 88, 16, 18)
}

CContainers.ChestRigsOCP = {
    container("OCP-Vest_Pouches", 80, 8, 1, 84, 87, 9, 10),
    container("OCP-Bag_Leg", 75, 8, 0.5, 85, 89, 9, 10),
    container("OCP-Bag_Leg_Left", 75, 8, 0.5, 85, 89, 9, 10)
}

CContainers.FannyPacksTacCam = {
    container("TM-Vest_Pouches", 80, 8, 1, 85, 90, 7, 8),
    container("TM-Utility_Bag", 80, 14, 1, 83, 86, 10, 12)
}

CContainers.BackpackTacClothing = {
    container("FBI背包", 85, 27, 2, 89, 95, 30, 35),
    container("SOEVest", 85, 27, 2, 88, 95, 30, 35),
    container("jk特遣队背包", 85, 27, 2, 88, 95, 30, 35),
    container("武装背包", 85, 27, 2, 88, 95, 30, 35)
}

CContainers.FannyPacksTacClothing = {
    container("jk_TaskForce_accessory", 50, 1, 0.2, 70, 85, 1, 2),
    container("FBI_accessory2", 50, 1, 0.2, 70, 85, 1, 2),
    container("FBI_accessory", 50, 1, 0.2, 70, 85, 1, 2),
    container("SOEWaistPack2", 50, 1, 0.2, 70, 85, 1, 2),
    container("SOEWaistPack", 50, 1, 0.2, 70, 85, 1, 2),
    container("jk_TaskForce_accessory2", 50, 1, 0.2, 70, 85, 1, 2)
}

CContainers.BagsBindle = {
    container("Bindle", 30, 12, 0.5, 50, 70, 13, 15)
}

CContainers.BagsMonmouthCountynew = {
    container("BZMClothing.PistolCase_Secondary", 5, 7, 0.5, 13, 15, 10, 11),
    container("BZMClothing.Lunchbox2_Secondary", 5, 4, 1, 40, 55, 6, 6),
    container("BZMClothing.Lunchbox_Secondary", 5, 4, 1, 40, 55, 6, 6),
    container("BZMClothing.FirstAidKit_Secondary", 5, 4, 1, 35, 55, 6, 6),
    container("BZMClothing.Toolbox_Secondary", 15, 8, 2, 23, 35, 11, 12),
    container("BZMClothing.SeedBag_Secondary", 30, 5, 0.1, 35, 40, 9, 9),
    container("BZMClothing.EmptySandbag_Secondary", 10, 15, 0.1, 23, 25, 18, 20),
    container("BZMClothing.Tote_Secondary", 50, 12, 0.5, 65, 70, 15, 17),
    container("BZMClothing.Purse_Secondary", 55, 12, 0.5, 65, 70, 15, 17),
    container("BZMClothing.Garbagebag_Secondary", 10, 20, 0.1, 23, 25, 22, 24),
    container("BZMClothing.Plasticbag_Secondary", 30, 8, 0.1, 38, 40, 12, 12),
    container("BZMClothing.Handbag_Secondary", 40, 8, 1, 45, 50, 11, 12)
}

CContainers.FannyPacksMoreBags = {
    container("MoreBags.MedicalFannyPackBack", 50, 1, 0.2, 88, 90, 4, 4),
    container("MoreBags.MedicalFannyPackFront", 50, 1, 0.2, 88, 90, 4, 4)
}

CContainers.Miscnewcontainersnc = {
    container("newcontainersnc.NCforagepouch_back", 50, 2, 0.5, 55, 60, 2, 3),
    container("newcontainersnc.NCfilefolder", 0, 1, 0.01, 0, 0, 1, 1),
    container("newcontainersnc.NCtrunkorganizer", 0, 20, 0.2, 0, 0, 22, 25),
    container("newcontainersnc.NCtissuebox", 0, 1, 0.01, 0, 0, 1, 1),
    container("newcontainersnc.NCspiffokeeper", 0, 1, 0.1, 0, 0, 1, 1),
    container("newcontainersnc.NCspicerack_crafted", 0, 2, 0.5, 0, 0, 2, 2),
    container("newcontainersnc.NCspicerack", 0, 2, 0.5, 0, 0, 2, 2),
    container("newcontainersnc.NCshoebox", 0, 2, 0.1, 0, 0, 2, 2),
    container("newcontainersnc.NCsandwichbagbox", 0, 1, 0.01, 0, 0, 1, 1),
    container("newcontainersnc.NCroughbox", 0, 60, 5, 0, 0, 60, 66),
    container("newcontainersnc.NCplasticware_tall", 0, 3, 0.3, 0, 0, 3, 3),
    container("newcontainersnc.NCplasticware_small", 0, 1, 0.1, 0, 0, 1, 1),
    container("newcontainersnc.NCplasticware", 0, 2, 0.2, 0, 0, 2, 2),
    container("newcontainersnc.NCplastictote_small", 0, 20, 1, 0, 0, 20, 25),
    container("newcontainersnc.NCplastictote_medium", 0, 30, 3, 0, 0, 30, 35),
    container("newcontainersnc.NCplastictote_large", 0, 40, 5, 0, 0, 40, 45),
    container("newcontainersnc.NCpizzaboxpw", 0, 1, 0.1, 0, 0, 1, 1),
    container("newcontainersnc.NCpizzabox", 0, 1, 0.1, 0, 0, 1, 1),
    container("newcontainersnc.NCpiggybank", 0, 1, 0.5, 0, 0, 1, 1),
    container("newcontainersnc.NCmilkcratelong", 0, 40, 5, 0, 0, 40, 42),
    container("newcontainersnc.NCmilkcrate", 0, 30, 4, 0, 0, 30, 34),
    container("newcontainersnc.NClockbox", 0, 5, 1, 0, 0, 5, 6),
    container("newcontainersnc.NCkindlingbox_crafted", 0, 10, 2, 0, 0, 10, 12),
    container("newcontainersnc.NCkindlingbox", 0, 10, 2, 0, 0, 10, 12),
    container("newcontainersnc.NCjewelrybox_crafted", 0, 1, 0.2, 0, 0, 1, 1),
    container("newcontainersnc.NCjewelrybox", 0, 1, 0.2, 0, 0, 1, 1),
    container("newcontainersnc.NChardwareorganizer", 0, 2, 0.01, 0, 0, 2, 2),
    container("newcontainersnc.NCfakerock", 0, 1, 0.1, 0, 0, 1, 1),
    container("newcontainersnc.NCdonutbox", 0, 1, 0.1, 0, 0, 1, 1),
    container("newcontainersnc.NCcookiejar", 0, 5, 1, 0, 0, 5, 6),
    container("newcontainersnc.NCcomponentkit_w", 0, 3, 0.2, 0, 0, 3, 3),
    container("newcontainersnc.NCcomponentkit_g", 0, 3, 0.2, 0, 0, 3, 3),
    container("newcontainersnc.NCcoffin", 0, 40, 20, 0, 0, 40, 45),
    container("newcontainersnc.NCcoffeecan_slim", 0, 4, 0.2, 0, 0, 4, 5),
    container("newcontainersnc.NCcoffeecan_wide", 0, 8, 0.5, 0, 0, 8, 10),
    container("newcontainersnc.NCcdcase", 0, 1, 0.1, 0, 0, 1, 1),
    container("newcontainersnc.NCcdbinder", 0, 3, 1, 0, 0, 3, 3),
    container("newcontainersnc.NCcardboard_small", 0, 10, 0.1, 0, 0, 10, 12),
    container("newcontainersnc.NCcardboard_medium", 0, 15, 0.5, 0, 0, 15, 16),
    container("newcontainersnc.NCcardboard_large", 0, 20, 1, 0, 0, 20, 22),
    container("newcontainersnc.NCbreadbox_crafted", 0, 1, 1, 0, 0, 1, 1),
    container("newcontainersnc.NCbreadbox", 0, 1, 1, 0, 0, 1, 1)
}

CContainers.FannyPacksPitstop = {
    container("SheriffEliBelt", 0, 8, 1, 5, 10, 8, 10)
}

CContainers.FannyPacksSTFR = {
    container("STFR.Belt_Police_Duty", 70, 1, 1.2, 80, 88, 1, 2)
}

CContainers.BagsSnakeClothingMod = {
    container("SuitcaseChapulin", 50, 16, 3, 65, 70, 18, 20),
    container("Suitcase4Fun", 50, 16, 3, 65, 70, 18, 20),
    container("SuitcaseArg", 50, 16, 3, 65, 70, 18, 20),
    container("SuitcasePastel", 50, 16, 3, 65, 70, 18, 20),
    container("SuitcaseTurno", 50, 16, 3, 65, 70, 18, 20),
    container("SuitcaseSajon", 50, 16, 3, 65, 70, 18, 20),
    container("SuitcaseKaku", 50, 16, 3, 65, 70, 18, 20),
    container("SuitcasePixel", 50, 16, 3, 65, 70, 18, 20),
    container("SuitcaseRiddle", 50, 16, 3, 65, 70, 18, 20),
    container("SuitcaseNubAsian", 50, 16, 3, 65, 70, 18, 20),
    container("SuitcaseLeissar", 50, 16, 3, 65, 70, 18, 20),
    container("SuitcaseX", 50, 16, 3, 65, 70, 18, 20),
    container("Suitcasecm_boyy", 50, 16, 3, 65, 70, 18, 20),
    container("Suitcaseflopi", 50, 16, 3, 65, 70, 18, 20),
    container("SuitcaseBatman", 50, 16, 3, 65, 70, 18, 20),
    container("SuitcasePermadeaZ", 50, 16, 3, 65, 70, 18, 20),
    container("SuitcaseKendo", 50, 16, 3, 65, 70, 18, 20)
}

CContainers.MiscTheWorkshopnewversion = {
    container("TW.MetalWorkbench", 0, 100, 35, 0, 0, 125, 200)
}

CContainers.Misctactorgsol = {
    container("tactorgsol.tactorgsol_small", 25, 15, 1.5, 25, 35, 16, 20),
    container("tactorgsol.tactorgsol_medium", 30, 25, 7, 30, 45, 32, 40),
    container("tactorgsol.tactorgsol_large", 35, 50, 15, 35, 60, 38, 45),
    container("tactorgsol.tactorgsol_admin", 50, 100, 1.5, 50, 75, 55, 60)
}

CContainers.BagsAdvancedWarfareEX = {
    container("ADVLuckyCase", 5, 4, 0.5, 10, 15, 4, 5),
    container("ADVPistolCase3", 5, 4, 0.5, 10, 15, 4, 5),
    container("ADVPistolCase2", 5, 4, 0.5, 10, 15, 4, 5),
    container("ADVPistolCase1", 5, 4, 0.5, 10, 15, 4, 5),
    container("ADVShotFirearmCase3", 20, 7, 1, 30, 40, 8, 9),
    container("ADVShotFirearmCase2", 20, 7, 1, 30, 40, 8, 9),
    container("ADVShotFirearmCase1", 20, 7, 1, 30, 40, 8, 9),
    container("ADVRifleCase9", 20, 7, 1, 30, 40, 8, 9),
    container("ADVRifleCase8", 20, 7, 1, 30, 40, 8, 9),
    container("ADVRifleCase7", 20, 7, 1, 30, 40, 8, 9),
    container("ADVRifleCase6", 20, 7, 1, 30, 40, 8, 9),
    container("ADVRifleCase5", 20, 7, 1, 30, 40, 8, 9),
    container("ADVRifleCase4", 20, 7, 1, 30, 40, 8, 9),
    container("ADVRifleCase3", 20, 7, 1, 30, 40, 8, 9),
    container("ADVRifleCase2", 20, 7, 1, 30, 40, 8, 9),
    container("ADVRifleCase1", 20, 7, 1, 30, 40, 8, 9)
}

CContainers.BackpacksB4BetterBackspacks = {
    container("BetterBackpacks_items.Craftable_ALICEpack", 85, 27, 1, 88, 95, 30, 35),
    container("BetterBackpacks_items.Craftable_DuffelBag", 65, 18, 1, 72, 80, 28, 23),
    container("BetterBackpacks_items.ALICEarmy_LVL5", 99, 98, 4, 94, 98, 33, 38),
    container("BetterBackpacks_items.ALICEarmy_LVL4", 98, 89, 3.6, 93, 97, 33, 38),
    container("BetterBackpacks_items.ALICEarmy_LVL3", 95, 76, 3.1, 92, 96, 33, 38),
    container("BetterBackpacks_items.ALICEarmy_LVL2", 90, 62, 2.7, 90, 95, 32, 37),
    container("BetterBackpacks_items.ALICEarmy_LVL1", 87, 45, 2.4, 89, 95, 31, 36),
    container("BetterBackpacks_items.ALICEpack_LVL5", 99, 72, 4, 93, 95, 33, 38),
    container("BetterBackpacks_items.ALICEpack_LVL4", 98, 65, 3.6, 92, 95, 33, 38),
    container("BetterBackpacks_items.ALICEpack_LVL3", 95, 53, 3.1, 91, 95, 33, 38),
    container("BetterBackpacks_items.ALICEpack_LVL2", 90, 41, 2.7, 90, 95, 32, 37),
    container("BetterBackpacks_items.ALICEpack_LVL1", 85, 33, 2.3, 89, 95, 31, 36),
    container("BetterBackpacks_items.HikingBagLVL5", 98, 60, 3, 89, 94, 28, 29),
    container("BetterBackpacks_items.HikingBagLVL4", 97, 52, 2.7, 88, 93, 28, 29),
    container("BetterBackpacks_items.HikingBagLVL3", 95, 44, 2.4, 87, 92, 28, 29),
    container("BetterBackpacks_items.HikingBagLVL2", 90, 33, 2.1, 84, 89, 27, 28),
    container("BetterBackpacks_items.HikingBagLVL1", 85, 29, 1.8, 82, 87, 26, 27),
    container("BetterBackpacks_items.DuffelBagLVL5", 90, 50, 2.5, 84, 92, 31, 26),
    container("BetterBackpacks_items.DuffelBagLVL4", 85, 44, 2.1, 83, 91, 31, 26),
    container("BetterBackpacks_items.DuffelBagLVL3", 80, 37, 1.8, 82, 90, 31, 26),
    container("BetterBackpacks_items.DuffelBagLVL2", 75, 31, 1.6, 80, 87, 30, 25),
    container("BetterBackpacks_items.DuffelBagLVL1", 70, 24, 1.3, 78, 85, 29, 24),
    container("BetterBackpacks_items.SchoolBagLVL5", 90, 40, 2, 74, 87, 21, 22),
    container("BetterBackpacks_items.SchoolBagLVL4", 85, 35, 1.8, 73, 86, 21, 22),
    container("BetterBackpacks_items.SchoolBagLVL3", 80, 30, 1.6, 72, 85, 21, 22),
    container("BetterBackpacks_items.SchoolBagLVL2", 75, 25, 1.4, 70, 80, 20, 21),
    container("BetterBackpacks_items.SchoolBagLVL1", 70, 20, 1.2, 68, 75, 19, 20),
    container("BetterBackpacks_items.Craftable_SchoolBag", 60, 15, 1, 66, 70, 18, 20)
}

CContainers.BackpacksHECU = {
    container("darlak_HECU.HECU_Backpack", 86, 30, 2, 88, 95, 30, 35)
}

CContainers.FannyPacksHECU = {
    container("darlak_HECU.HECU_Belt", 88, 4, 0, 88, 90, 3, 4)
}

CContainers.BackpacksLiteBackpack = {
    container("Lite_Backpack", 65, 18, 1.1, 68, 73, 18, 20)
}

CContainers.BackpacksMilitekFactionClothing = {
    container("Military_BagBack_StormPack_Large-MilitekOfficer", 90, 12, 1, 89, 91, 12, 14),
    container("Military_BagBack_StormPack_Large-Militek", 90, 12, 1, 89, 91, 12, 14),
    container("Military_Backpack_Echo_Radio-Militek_Tight", 95, 35, 2, 88, 95, 30, 35),
    container("Military_Backpack_Echo_Radio-Militek", 95, 45, 2, 88, 95, 30, 35),
    container("Military_Backpack_Colossus_VeryLarge-Militek_Tight", 85, 50, 3, 92, 96, 33, 38),
    container("Military_Backpack_Colossus_VeryLarge-Militek", 85, 50, 3, 92, 96, 33, 38),
    container("Military_Backpack_Ranger_Large-Militek_Tight", 90, 40, 2, 89, 95, 31, 36),
    container("Military_Backpack_Ranger_Large-Militek", 90, 40, 2, 89, 95, 31, 36)
}

CContainers.ChestRigsMilitekFactionClothing = {
    container("Military_BagLeg_Utility_Medium-MilitekOfficer_ArmorRight", 95, 10, 0.5, 92, 95, 9, 10),
    container("Military_BagLeg_Utility_Medium-MilitekOfficer_ArmorLeft", 95, 10, 0.5, 92, 95, 9, 10),
    container("Military_BagLeg_Utility_Medium-MilitekOfficer_Right", 95, 10, 0.5, 92, 95, 9, 10),
    container("Military_BagLeg_Utility_Medium-MilitekOfficer_Left", 95, 10, 0.5, 92, 95, 9, 10),
    container("Military_BagLeg_Utility_Medium-Militek_ArmorRight", 90, 8, 0.5, 91, 94, 8, 9),
    container("Military_BagLeg_Utility_Medium-Militek_ArmorLeft", 90, 8, 0.5, 91, 94, 8, 9),
    container("Military_BagLeg_Utility_Medium-Militek_Right", 90, 8, 0.5, 91, 94, 8, 9),
    container("Military_BagLeg_Utility_Medium-Militek_Left", 90, 8, 0.5, 91, 94, 8, 9),
    container("Military_BagFront_ChestPouches_Large-Militek", 80, 12, 1, 82, 85, 12, 14)
}

CContainers.BackpacksP4MySoCalledBag = {
    container("P4MySoCalledBag.P4DuffelBagP4", 90, 30, 1, 72, 80, 28, 23),
    container("P4MySoCalledBag.P4DuffelBagBhbr", 80, 22, 1.5, 72, 80, 28, 23),
    container("P4MySoCalledBag.P4DuffelBagBhb", 80, 22, 1.5, 72, 80, 28, 23),
    container("P4MySoCalledBag.P4DuffelBagHbr", 70, 20, 1.2, 72, 80, 28, 23),
    container("P4MySoCalledBag.P4DuffelBagHb", 70, 20, 1.2, 72, 80, 28, 23),
    container("P4MySoCalledBag.P4DuffelBagMbr", 85, 28, 2, 82, 85, 28, 29),
    container("P4MySoCalledBag.P4DuffelBagMb", 85, 28, 2, 82, 85, 28, 29)
}

CContainers.BackpacksSurvivalisthikingbags = {
    container("SurvivalistHikingBag.SurvivalistHikingBag", 85, 25, 1.6, 86, 91, 26, 30)
}

CContainers.BackpacksTLOUClothingSeraphites = {
    container("TLOU.Bag_SCARLeatherBackpack", 85, 23, 1.7, 83, 85, 25, 26),
    container("TLOU.Bag_SCARBackPack", 70, 30, 2.3, 84, 92, 30, 35)
}

CContainers.FannyPacksTLOUClothingSeraphites = {
    container("TLOU.Bag_LeatherPocketBackLeft", 80, 3, 0.3, 85, 90, 3, 4),
    container("TLOU.Bag_LeatherPocketBackRight", 80, 3, 0.3, 85, 90, 3, 4),
    container("TLOU.Bag_LeatherPocketLegLeft", 80, 3, 0.3, 85, 90, 3, 4),
    container("TLOU.Bag_LeatherPocketLegRight", 80, 3, 0.3, 85, 90, 3, 4),
    container("TLOU.Bag_TLOULeatherPouchLeft", 65, 2, 0.2, 80, 85, 2, 3),
    container("TLOU.Bag_TLOULeatherPouchRight", 65, 2, 0.2, 80, 85, 2, 3)
}

CContainers.BackpacksTLOUClothingFEDRA = {
    container("TLOU.Bag_FedraGasTank", 70, 20, 1.2, 75, 78, 20, 22)
}

CContainers.BackpacksUSMilitaryPack = {
    container("USMP_BagBack_StormPack_Medium_OCP", 80, 8, 1, 82, 85, 8, 9),
    container("USMP_BagBack_StormPack_Small_OCP", 80, 4, 0.5, 82, 88, 4, 5),
    container("USMP_BagBack_StormPack_Medium_UCP", 80, 8, 1, 82, 85, 8, 9),
    container("USMP_BagBack_StormPack_Small_UCP", 80, 4, 0.5, 82, 88, 4, 5),
    container("USMP_Backpack_Echo_Radio_OCP_Tight", 90, 25, 2, 82, 87, 26, 27),
    container("USMP_Backpack_Echo_Radio_OCP", 90, 25, 2, 82, 87, 26, 27),
    container("USMP_Backpack_Colossus_VeryLarge_OCP_Tight", 85, 40, 3, 89, 95, 31, 36),
    container("USMP_Backpack_Colossus_VeryLarge_OCP", 85, 40, 3, 89, 95, 31, 36),
    container("USMP_Backpack_Ranger_Large_OCP", 90, 30, 2, 88, 95, 30, 35),
    container("USMP_Backpack_Ranger_Large_OCP_Tight", 90, 30, 2, 88, 95, 30, 35),
    container("USMP_Backpack_Strategist_Medium_OCP_Tight", 90, 22, 2, 88, 95, 28, 33),
    container("USMP_Backpack_Strategist_Medium_OCP", 90, 22, 2, 88, 95, 28, 33),
    container("USMP_Backpack_Echo_Radio_UCP_Tight", 90, 25, 2, 82, 87, 26, 27),
    container("USMP_Backpack_Echo_Radio_UCP", 90, 25, 2, 82, 87, 26, 27),
    container("USMP_Backpack_Colossus_VeryLarge_UCP_Tight", 85, 40, 3, 89, 95, 31, 36),
    container("USMP_Backpack_Colossus_VeryLarge_UCP", 85, 40, 3, 89, 95, 31, 36),
    container("USMP_Backpack_Ranger_Large_UCP", 90, 30, 2, 88, 95, 30, 35),
    container("USMP_Backpack_Ranger_Large_UCP_Tight", 90, 30, 2, 88, 95, 30, 35),
    container("USMP_Backpack_Strategist_Medium_UCP_Tight", 90, 22, 2, 88, 95, 28, 33),
    container("USMP_Backpack_Strategist_Medium_UCP", 90, 22, 2, 88, 95, 28, 33)
}

CContainers.ChestRigsUSMilitaryPack = {
    container("USMP_BagLeg_Utility_Medium_OCP_ArmorRight", 75, 8, 0.5, 77, 80, 8, 9),
    container("USMP_BagLeg_Utility_Medium_OCP_ArmorLeft", 75, 8, 0.5, 77, 80, 8, 9),
    container("USMP_BagLeg_Utility_Medium_OCP_Right", 75, 8, 0.5, 77, 80, 8, 9),
    container("USMP_BagLeg_Utility_Medium_OCP_Left", 75, 8, 0.5, 77, 80, 8, 9),
    container("USMP_BagLeg_MagSecure_Small_OCP_ArmorRight", 75, 4, 0.5, 78, 82, 4, 5),
    container("USMP_BagLeg_MagSecure_Small_OCP_ArmorLeft", 75, 4, 0.5, 78, 82, 4, 5),
    container("USMP_BagLeg_MagSecure_Small_OCP_Right", 75, 4, 0.5, 78, 82, 4, 5),
    container("USMP_BagLeg_MagSecure_Small_OCP_Left", 75, 4, 0.5, 78, 82, 4, 5),
    container("USMP_BagLeg_Utility_Medium_UCP_ArmorRight", 75, 8, 0.5, 77, 80, 8, 9),
    container("USMP_BagLeg_Utility_Medium_UCP_ArmorLeft", 75, 8, 0.5, 77, 80, 8, 9),
    container("USMP_BagLeg_Utility_Medium_UCP_Right", 75, 8, 0.5, 77, 80, 8, 9),
    container("USMP_BagLeg_Utility_Medium_UCP_Left", 75, 8, 0.5, 77, 80, 8, 9),
    container("USMP_BagLeg_MagSecure_Small_UCP_ArmorRight", 75, 4, 0.5, 78, 82, 4, 5),
    container("USMP_BagLeg_MagSecure_Small_UCP_ArmorLeft", 75, 4, 0.5, 78, 82, 4, 5),
    container("USMP_BagLeg_MagSecure_Small_UCP_Right", 75, 4, 0.5, 78, 82, 4, 5),
    container("USMP_BagLeg_MagSecure_Small_UCP_Left", 75, 4, 0.5, 78, 82, 4, 5),
    container("USMP_BagFront_ChestPouches_Large_OCP", 80, 6, 1, 82, 85, 6, 7),
    container("USMP_BagFront_ChestPouches_Medium_OCP", 80, 4, 1, 83, 86, 4, 5),
    container("USMP_BagFront_ChestPouches_Large_UCP", 80, 6, 1, 82, 85, 6, 7),
    container("USMP_BagFront_ChestPouches_Medium_UCP", 80, 4, 1, 83, 86, 4, 5)
}

CContainers.BackpacksZombieHunterBackpack = {
    container("Zombie_Hunter_Backpack", 83, 24, 2, 84, 85, 24, 27)
}

CContainers.BackpacksJGAlpineMulticamUniform = {
    container("Alpine_Camo_Backpack_Ranger_Tight", 90, 22, 2, 80, 85, 25, 26)
}

CContainers.BackpacksJGBlackMulticamUniform = {
    container("Black_Camo_Backpack_Ranger_Tight", 90, 22, 2, 80, 85, 25, 26)
}

CContainers.BackpacksJGCautionPack = {
    container("Caution_Backpack_Radio", 90, 25, 2, 80, 85, 25, 26),
    container("Caution_DarkZonePack", 80, 6, 1, 80, 85, 7, 8),
    container("Caution_DarkZoneBag", 80, 8, 1, 80, 85, 9, 10)
}

CContainers.FannyPacksJGCautionPack = {
    container("Caution_DarkZoneCanister_BeltRight", 80, 6, 1, 82, 84, 6, 7),
    container("Caution_DarkZoneCanister_BeltLeft", 80, 6, 1, 82, 84, 6, 7)
}

CContainers.BackpacksJGDesertMulticamUniform = {
    container("Desert_Camo_Backpack_Ranger_Tight", 90, 22, 2, 80, 85, 25, 26)
}

CContainers.BackpacksJGForestMulticamUniform = {
    container("Forest_Camo_Backpack_Ranger_Tight", 90, 22, 2, 80, 85, 25, 26)
}

CContainers.BackpacksJGSWATUniform = {
    container("SWAT_Backpack_Radio_Tight", 90, 22, 2, 82, 87, 25, 26)
}

CContainers.BackpacksJGTraumaResponderUniform = {
    container("Medical_Red_DarkZonePack", 80, 6, 1, 80, 85, 7, 8),
    container("BagBack_StormPack_Small-Medic", 80, 4, 0.5, 80, 82, 5, 6),
    container("BagBack_StormPack_Medium-Medic", 80, 6, 1, 82, 88, 6, 7),
    container("BagBack_StormPack_Large-Medic", 80, 8, 1, 82, 86, 8, 10),
    container("Medical_Red_Backpack", 90, 22, 2, 80, 85, 25, 26)
}

CContainers.ChestRigsJGTraumaResponderUniform = {
    container("Pouch_Utility_Medium-Medic_ArmorRight", 75, 6, 0.5, 80, 84, 6, 7),
    container("Pouch_Utility_Medium-Medic_ArmorLeft", 75, 6, 0.5, 80, 84, 6, 7),
    container("Pouch_Utility_Medium-Medic_Right", 75, 6, 0.5, 80, 84, 6, 7),
    container("Pouch_Utility_Medium-Medic_Left", 75, 6, 0.5, 80, 84, 6, 7)
}

CContainers.BackpackszReModVaccin20byk = {
    container("zReV2_10ECO_bagback", 60, 6, 0.2, 68, 72, 6, 7),
    container("zReV2_8ECO_backpack", 82, 20, 2, 83, 85, 20, 22)
}

CContainers.ChestRigszReModVaccin20byk = {
    container("zReV2_5ECO_chestrig2", 90, 6, 1, 88, 90, 6, 7),
    container("zReV2_5ECO_chestrig1", 90, 6, 1, 88, 90, 6, 7)
}

CContainers.ChestRigsSimplesling = {
    container("TacticalVest", 100, 20, 0.8, 88, 90, 14, 16)
}

CContainers.VehicleStorage = {
    vehicle_storage("VanSeatsTrunk2", 50, 20, 55, 65),
    vehicle_storage("TrailerTrunk3", 100, 30, 110, 125),
    vehicle_storage("TrailerTrunk2", 100, 30, 110, 125),
    vehicle_storage("TrailerTrunk1", 100, 30, 110, 125),
    vehicle_storage("SmallTrunk3", 30, 20, 35, 45),
    vehicle_storage("SmallTrunk2", 70, 40, 75, 85),
    vehicle_storage("SmallTrunk1", 40, 30, 45, 55),
    vehicle_storage("SmallGasTank3", 35, 10, 40, 45),
    vehicle_storage("SmallGasTank2", 55, 14, 65, 70),
    vehicle_storage("SmallGasTank1", 39, 11, 45, 50),
    vehicle_storage("OldTire3", 30, 15, 35, 40),
    vehicle_storage("OldTire2", 30, 15, 35, 40),
    vehicle_storage("OldTire1", 30, 15, 35, 40),
    vehicle_storage("OldBrake3", 30, 3, 35, 50),
    vehicle_storage("OldBrake2", 30, 3, 35, 50),
    vehicle_storage("OldBrake1", 30, 3, 35, 50),
    vehicle_storage("NormalTrunk3", 45, 25, 50, 60),
    vehicle_storage("NormalTrunk2", 85, 45, 95, 105),
    vehicle_storage("NormalTrunk1", 55, 35, 65, 70),
    vehicle_storage("NormalTire3", 35, 15, 40, 45),
    vehicle_storage("NormalTire2", 35, 15, 40, 45),
    vehicle_storage("NormalTire1", 35, 15, 40, 45),
    vehicle_storage("NormalGasTank3", 45, 12, 50, 55),
    vehicle_storage("NormalGasTank2", 65, 17, 75, 80),
    vehicle_storage("NormalGasTank1", 49, 13, 55, 60),
    vehicle_storage("NormalCarSeat3", 20, 15, 25, 30),
    vehicle_storage("NormalCarSeat2", 20, 15, 25, 30),
    vehicle_storage("NormalCarSeat1", 20, 15, 25, 30),
    vehicle_storage("NormalBrake3", 35, 3, 40, 45),
    vehicle_storage("NormalBrake2", 35, 3, 40, 45),
    vehicle_storage("NormalBrake1", 35, 3, 40, 45),
    vehicle_storage("ModernTire3", 40, 15, 45, 50),
    vehicle_storage("ModernTire2", 40, 15, 45, 50),
    vehicle_storage("ModernTire1", 40, 15, 45, 50),
    vehicle_storage("ModernBrake3", 40, 3, 45, 50),
    vehicle_storage("ModernBrake2", 40, 3, 45, 50),
    vehicle_storage("ModernBrake1", 40, 3, 45, 50),
    vehicle_storage("GloveBox3", 5, 2, 6, 8),
    vehicle_storage("GloveBox2", 10, 4, 12, 15),
    vehicle_storage("GloveBox1", 3, 3, 4, 5),
    vehicle_storage("BigTrunk3", 50, 30, 55, 65),
    vehicle_storage("BigTrunk2", 150, 50, 175, 200),
    vehicle_storage("BigTrunk1", 70, 40, 75, 80),
    vehicle_storage("BigGasTank3", 55, 14, 65, 70),
    vehicle_storage("BigGasTank2", 75, 22, 85, 90),
    vehicle_storage("BigGasTank1", 59, 15, 65, 75)
}

CContainers.VehicleParts = {
    vehicle_part("Jack", 1.5),
    vehicle_part("LugWrench", 1),
    vehicle_part("TirePump", 2),
    vehicle_part("EngineParts", 0.5),
    vehicle_part("CarBatteryCharger", 2),
    vehicle_part("NormalSuspension1", 2),
    vehicle_part("ModernSuspension1", 3),
    vehicle_part("NormalSuspension2", 2),
    vehicle_part("ModernSuspension2", 3),
    vehicle_part("NormalSuspension3", 2),
    vehicle_part("ModernSuspension3", 3),
    vehicle_part("CarBattery1", 5),
    vehicle_part("CarBattery2", 5),
    vehicle_part("CarBattery3", 5),
    vehicle_part("Windshield1", 8),
    vehicle_part("RearWindshield1", 8),
    vehicle_part("FrontWindow1", 3),
    vehicle_part("RearWindow1", 3),
    vehicle_part("Windshield2", 8),
    vehicle_part("RearWindshield2", 8),
    vehicle_part("FrontWindow2", 3),
    vehicle_part("RearWindow2", 3),
    vehicle_part("Windshield3", 8),
    vehicle_part("RearWindshield3", 8),
    vehicle_part("FrontWindow3", 4),
    vehicle_part("RearWindow3", 4),
    vehicle_part("FrontCarDoor1", 10),
    vehicle_part("RearCarDoor1", 10),
    vehicle_part("RearCarDoorDouble1", 20),
    vehicle_part("FrontCarDoor2", 10),
    vehicle_part("RearCarDoor2", 10),
    vehicle_part("RearCarDoorDouble2", 20),
    vehicle_part("FrontCarDoor3", 10),
    vehicle_part("RearCarDoor3", 10),
    vehicle_part("RearCarDoorDouble3", 20),
    vehicle_part("EngineDoor1", 15),
    vehicle_part("EngineDoor2", 15),
    vehicle_part("EngineDoor3", 15),
    vehicle_part("TrunkDoor1", 15),
    vehicle_part("TrunkDoor2", 15),
    vehicle_part("TrunkDoor3", 15),
    vehicle_part("OldCarMuffler1", 10),
    vehicle_part("NormalCarMuffler1", 10),
    vehicle_part("ModernCarMuffler1", 10),
    vehicle_part("OldCarMuffler2", 10),
    vehicle_part("NormalCarMuffler2", 10),
    vehicle_part("ModernCarMuffler2", 10),
    vehicle_part("OldCarMuffler3", 10),
    vehicle_part("NormalCarMuffler3", 10),
    vehicle_part("ModernCarMuffler3", 10)
}

CContainers.VehicleStorageKI5oshkoshM911 = {
    vehicle_storage("V100Tire2", 55, 15, 65, 80),
    vehicle_storage("V100Tires2", 55, 18, 65, 80),
    vehicle_storage("V100SmallTires2", 55, 16, 65, 80),
    vehicle_storage("V100Axle2", 55, 30, 65, 80),
    vehicle_storage("V100AxleSmall2", 55, 25, 65, 80),
    vehicle_storage("M911Trunk2", 95, 15, 105, 125),
    vehicle_storage("M911Toolbox2", 45, 10, 55, 75),
    vehicle_storage("M911SpareTire2", 31, 17, 45, 65),
    vehicle_storage("M911Extra2", 3, 1, 4, 5)
}

CContainers.VehicleStorageKI5merc = {
    vehicle_storage("mercroofrack1", 60, 25, 75, 90),
    vehicle_storage("mercroofrack2", 60, 25, 75, 90),
    vehicle_storage("mercroofrack3", 60, 25, 75, 90)
}

CContainers.VehicleStorageKI5oshkoshP19A = {
    vehicle_storage("V100Tire2", 55, 15, 65, 80),
    vehicle_storage("P19ABigTrunk2", 120, 25, 140, 160),
    vehicle_storage("P19ASmallTrunk2", 50, 25, 60, 80)
}

CContainers.VehicleStorageKI5cruiser = {
    vehicle_storage("cruiserRoofrack1", 90, 25, 100, 120),
    vehicle_storage("cruiserRoofrack2", 90, 25, 100, 120),
    vehicle_storage("cruiserRoofrack3", 90, 25, 100, 120)
}

CContainers.VehicleStorageKI5def90 = {
    vehicle_storage("def90SpareCompartment1", 31, 25, 45, 65),
    vehicle_storage("def90SpareCompartment2", 31, 25, 45, 65),
    vehicle_storage("def90SpareCompartment3", 31, 25, 45, 65)
}

CContainers.VehicleStorageKI5def110 = {
    vehicle_storage("def110SpareCompartment1", 31, 25, 45, 65),
    vehicle_storage("def110SpareCompartment2", 31, 25, 45, 65),
    vehicle_storage("def110SpareCompartment3", 31, 25, 45, 65)
}

CContainers.VehiclePartsKI5fordE150 = {
    vehicle_part("E150CarFrontDoor2", 10),
    vehicle_part("E150CarSlideDoor2", 15),
    vehicle_part("E150EngineDoor2", 10),
    vehicle_part("E150TrunkDoor2", 20),
    vehicle_part("E150FrontBumper2", 8),
    vehicle_part("E150RearBumper2", 8),
    vehicle_part("E150Windshield2", 9),
    vehicle_part("E150SideWindow2", 4),
    vehicle_part("E150RearWindshield2", 7),
    vehicle_part("E150WindshieldArmor", 12),
    vehicle_part("E150WindshieldRearArmor", 10),
    vehicle_part("E150DoorArmor", 9),
    vehicle_part("E150Divider", 15),
    vehicle_part("E150MysteryMachineRoofrack2", 12),
    vehicle_part("E150WindowRearArmor", 9),
    vehicle_part("E150RearSideWindow2", 4),
    vehicle_part("E150FrontBumperWithBullbar2", 16),
    vehicle_part("E150FrontBullbar2", 8),
    vehicle_part("E150CarSlideDoorWin2", 13.5)
}

CContainers.VehicleStorageKI5FordE150 = {
    vehicle_storage("E150Tire2", 35, 15, 40, 50),
    vehicle_storage("E150CarSeat2", 20, 15, 30, 40)
}

CContainers.VehicleStorageKI5amgeneralM998 = {
    vehicle_storage("92amgeneralM998Roofrack", 95, 15, 105, 120)
}

CContainers.VehicleStorageKI5Cadillac59 = {
    vehicle_storage("ECTO1tire2", 35, 15, 40, 45),
    vehicle_storage("ECTO1tire1", 35, 10, 40, 45),
    vehicle_storage("ECTO1CarSeatrr1", 25, 10, 30, 35),
    vehicle_storage("ECTO1CarSeatfr1", 25, 14, 30, 35),
    vehicle_storage("ECTO1CarSeatfl1", 25, 16, 30, 35),
    vehicle_storage("ECTO1Roofrack1", 60, 15, 70, 80)
}

CContainers.VehicleStorageKI5amgeneralM151A2 = {
    vehicle_storage("M151A2Trunk2", 75, 25, 85, 100),
    vehicle_storage("M151A2CarSeatFront2", 15, 11, 20, 40)
}

CContainers.VehicleStorageKI5amgeneralM35A2 = {
    vehicle_storage("M35A2Trunk2", 600, 26, 640, 680),
    vehicle_storage("M35A2Extra2", 1, 1, 2, 3),
    vehicle_storage("V103Tire2", 45, 12.5, 55, 80),
    vehicle_storage("V103Axle2", 45, 35, 55, 80),
    vehicle_storage("M35A2CarSeat2", 30, 15, 40, 60)
}

CContainers.VehicleStorageKI584merc = {
    vehicle_storage("W460NormalTire2", 45, 15, 55, 75),
    vehicle_storage("W460WideTire2", 45, 15, 55, 75),
    vehicle_storage("W460ModernTire2", 45, 15, 55, 75),
    vehicle_storage("W460RoofrackM", 95, 19, 105, 120),
    vehicle_storage("W460Roofrack1", 80, 17, 90, 100),
    vehicle_storage("W460MilitaryTire2", 35, 15, 40, 45),
    vehicle_storage("W460CarSeatRear2", 25, 15, 30, 35),
    vehicle_storage("W460CarSeatFront2", 20, 13, 25, 30)
}

CContainers.VehicleStorageKI5amgeneralM923 = {
    vehicle_storage("M923Axle2", 55, 25, 65, 85),
    vehicle_storage("M923Trunk2", 50, 15, 60, 80),
    vehicle_storage("M923Flatbed2", 530, 25, 550, 580),
    vehicle_storage("M923FrontSeat2", 40, 15, 50, 70),
    vehicle_storage("M923RearSeat2", 10, 7.5, 15, 25)
}

CContainers.VehicleStorageKI580kz1000 = {
    vehicle_storage("KZ1Kstorage3", 15, 3, 20, 40),
    vehicle_storage("KZ1Ksidestorage3", 25, 4, 35, 55),
    vehicle_storage("KZ1Kextra3", 2, 1, 3, 4),
    vehicle_storage("KZ1KoldTire", 40, 13, 50, 70),
    vehicle_storage("KZ1KnormalTire", 40, 12.5, 50, 70),
    vehicle_storage("KZ1KmodernTire", 40, 15, 50, 70),
    vehicle_storage("KZ1KgasTank", 48, 10, 60, 80)
}

CContainers.VehicleStorageKI5nissanGTR = {
    vehicle_storage("R32Tire0", 45, 15, 55, 70),
    vehicle_storage("R32Tire1", 45, 12, 55, 0),
    vehicle_storage("R32Tire2", 45, 11, 55, 70),
    vehicle_storage("R32TireA", 45, 7.75, 55, 70),
    vehicle_storage("R32FrontSeat3", 25, 12, 30, 40),
    vehicle_storage("R32RearSeat3", 30, 15, 35, 45)
}

CContainers.VehicleStorageKI5Ford89 = {
    vehicle_storage("80sOffroadTireA", 35, 16, 45, 55),
    vehicle_storage("80sPickupRoofrackA", 65, 15, 75, 90),
    vehicle_storage("80sPickupSeatFront2", 25, 15, 35, 45),
    vehicle_storage("80sPickupSeatRear2", 25, 11, 35, 45)
}

CContainers.VehicleStorageKI5JeepJ10 = {
    vehicle_storage("80sOffroadTireA", 35, 16, 45, 55),
    vehicle_storage("80sPickupRoofrackA", 65, 15, 75, 90),
    vehicle_storage("80sPickupSeatFront2", 25, 15, 35, 45),
    vehicle_storage("80sPickupSeatRear2", 25, 11, 35, 45)
}

CContainers.VehicleStorageKI5ChevyS10 = {
    vehicle_storage("80sOffroadTireA", 35, 16, 45, 55),
    vehicle_storage("80sPickupRoofrackA", 65, 15, 75, 90),
    vehicle_storage("80sPickupSeatFront2", 25, 15, 35, 45),
    vehicle_storage("80sPickupSeatRear2", 25, 11, 35, 45)
}

CContainers.VehicleStorageKI597Bushmaster = {
    vehicle_storage("BushmasterTire", 35, 14, 44, 55),
    vehicle_storage("97BushmasterSeat", 20, 10, 25, 35),
    vehicle_storage("97BushLeftFender0", 50, 20, 65, 75),
    vehicle_storage("97BushRightFender0", 35, 20, 45, 55),
    vehicle_storage("97BushLeftStorage0", 20, 10, 30, 55),
    vehicle_storage("97BushRightStorage0", 75, 15, 85, 95),
    vehicle_storage("97BushRoofStorage0", 90, 15, 105, 125)
}

CContainers.VehicleStorageKI570barracuda = {
    vehicle_storage("CUDAFrontSeat3", 25, 15, 35, 45),
    vehicle_storage("CUDARearSeat3", 25, 15, 35, 45)
}

CContainers.VehicleStorageKI528ss100 = {
    vehicle_storage("SS100topbag3", 32, 5, 45, 55),
    vehicle_storage("SS100sidebag3", 25, 3, 35, 45),
    vehicle_storage("SS100oldTire", 35, 13, 45, 55),
    vehicle_storage("SS100normalTire", 35, 14, 45, 55),
    vehicle_storage("SS100modernTire", 35, 15, 45, 55)
}

CContainers.VehicleStorageKI5vino125 = {
    vehicle_storage("VN125storage1", 20, 1, 30, 40),
    vehicle_storage("VN125sidestorage1", 30, 1, 40, 50),
    vehicle_storage("VN125storagePizza1", 24, 1, 30, 34),
    vehicle_storage("VN125oldTire", 35, 13, 45, 55),
    vehicle_storage("VN125normalTire", 35, 14, 45, 55),
    vehicle_storage("VN125modernTire", 35, 15, 45, 55)
}

CContainers.VehicleStorageKI593TownCar = {
    vehicle_storage("93townCarTire1", 35, 15, 40, 45),
    vehicle_storage("93townCarTrunkFloor1", 40, 5, 45, 50),
    vehicle_storage("93townCarTrunk1", 70, 5, 75, 80),
    vehicle_storage("93townCarMiniBar1", 30, 5, 35, 40),
    vehicle_storage("93townCarTrunkRack1", 30, 5, 35, 40),
    vehicle_storage("93townCarSeatFront1", 30, 18, 35, 40),
    vehicle_storage("93townCarSeatRear1", 30, 18, 35, 40)
}

CContainers.VehicleStorageKI589trooper = {
    vehicle_storage("89trooperTire2", 35, 15, 40, 45),
    vehicle_storage("89trooperTrunkSmall2", 75, 25, 80, 85),
    vehicle_storage("89trooperTrunkLarge2", 100, 25, 110, 115),
    vehicle_storage("89trooperRoofrack2", 80, 25, 85, 90),
    vehicle_storage("89trooperSeatFront2", 25, 15, 30, 35),
    vehicle_storage("89trooperSeatRear2", 25, 15, 30, 35)
}

CContainers.VehicleStorageKI569mini = {
    vehicle_storage("69miniTire1", 35, 10, 40, 45),
    vehicle_storage("69miniTirePS1", 35, 15, 45, 50),
    vehicle_storage("69miniTrunkSmall1", 50, 10, 55, 60),
    vehicle_storage("69miniTrunkLarge1", 60, 8, 65, 70),
    vehicle_storage("69miniRoofrack1", 60, 11, 65, 70),
    vehicle_storage("69miniSeatFront1", 15, 8, 20, 25),
    vehicle_storage("69miniSeatRear1", 17, 9, 22, 27),
    vehicle_storage("69miniMrBChair1", 25, 15, 30, 35)
}

CContainers.VehicleStorageKI590pierce = {
    vehicle_storage("90pierceArrowTire2", 35, 16, 40, 45),
    vehicle_storage("90pierceArrowDoubleTires2", 35, 16, 40, 45),
    vehicle_storage("90pierceArrowTrunk2", 50, 5, 55, 60),
    vehicle_storage("90pierceArrowSeat2", 25, 15, 30, 35)
}

CContainers.VehiclePartsKI590Ford350 = {
    vehicle_part("90fordF350Tire2", 14),
    vehicle_part("90fordF350DoubleTires2", 22),
    vehicle_part("90fordF350Trunk2", 1),
    vehicle_part("90fordF350SeatFront2", 15),
    vehicle_part("90fordF350SeatRear2", 15)
}

CContainers.VehicleStorageKI592FordCVPI = {
    vehicle_storage("fordCVPITire1", 35, 15, 40, 45),
    vehicle_storage("92fordCVPITrunk1", 70, 1, 80, 85),
    vehicle_storage("92fordCVPISeatFront1", 30, 18, 35, 40),
    vehicle_storage("92fordCVPISeatRear1", 30, 18, 35, 40)
}

CContainers.VehicleStorageKI590zanella = {
    vehicle_storage("ZNL50storageFront", 5, 1, 7, 8),
    vehicle_storage("ZNL50storageBox", 50, 1, 55, 60),
    vehicle_storage("ZNL50oldTire", 35, 13, 40, 45),
    vehicle_storage("ZNL50normalTire", 35, 14, 40, 45),
    vehicle_storage("ZNL50modernTire", 35, 15, 40, 45)
}

CContainers.VehiclePartsKI5Commando = {
    vehicle_part("67commandoToolboxLid2", 5),
    vehicle_part("67commandoRearDoor2", 13.9),
    vehicle_part("67commandoLightGuards2", 2),
    vehicle_part("67commandoFrontDoor2", 13.9),
    vehicle_part("67commandoEngineDoor2", 9)
}


CContainers.VehiclePartsKI5oshkoshP19A = {
    vehicle_part("P19ARoofHatch2", 15)
}

CContainers.VehiclePartsKI5amgeneralM998 = {
    vehicle_part("M101A3TrunkDoorTwo2", 10),
    vehicle_part("M101A3Cover2", 15),
    vehicle_part("92amgeneralM998WindshieldArmor1", 20),
    vehicle_part("92amgeneralM998WindshieldArmor0", 20),
    vehicle_part("92amgeneralM998Windshield2", 8),
    vehicle_part("92amgeneralM998TrunkDoor2", 15),
    vehicle_part("92amgeneralM998TrunkBarrier2", 10),
    vehicle_part("92amgeneralM998TrunkBarrier1", 2),
    vehicle_part("92amgeneralM998SideWindow2", 3),
    vehicle_part("92amgeneralM998RearDoor2", 10),
    vehicle_part("92amgeneralM998RearArmor", 20),
    vehicle_part("92amgeneralM998Muffler2", 7),
    vehicle_part("92amgeneralM998Muffler1", 3),
    vehicle_part("92amgeneralM998Mudflap0", 3),
    vehicle_part("92amgeneralM998FrontDoor2", 10),
    vehicle_part("92amgeneralM998FrontArmor", 20),
    vehicle_part("92amgeneralM998EngineDoor2", 15),
    vehicle_part("92amgeneralM998BullbarB", 15),
    vehicle_part("92amgeneralM998BullbarA", 10),
    vehicle_part("92amgeneralM998BackCover2", 25)
}

CContainers.VehiclePartsKI5Cadillac59 = {
    vehicle_part("ECTO1WindshieldRearArmor", 10),
    vehicle_part("ECTO1WindshieldArmor", 20),
    vehicle_part("ECTO1Windshield1", 12),
    vehicle_part("ECTO1TrunkDoor1", 8),
    vehicle_part("ECTO1SideWindow1", 5),
    vehicle_part("ECTO1RearWindshield1", 7),
    vehicle_part("ECTO1Equipment1", 25),
    vehicle_part("ECTO1EngineDoor1", 12),
    vehicle_part("ECTO1CarRearDoorArmor", 15),
    vehicle_part("ECTO1CarRearDoor1", 10),
    vehicle_part("ECTO1CarFrontDoorArmor", 15),
    vehicle_part("ECTO1CarFrontDoor1", 10),
    vehicle_part("ECTO1BumperRear1", 5),
    vehicle_part("ECTO1BumperA", 20),
    vehicle_part("ECTO1Bumper1", 9),
    vehicle_part("ECTO1Bullbar1", 11)
}

CContainers.VehiclePartsKI5amgeneralM151A2 = {
    vehicle_part("M151A2EngineDoor2", 15),
    vehicle_part("M151A2Tarp1_Item", 12),
    vehicle_part("M151A2CarSeatRear2", 8),
    vehicle_part("M151A2Bumper1_Item", 5),
    vehicle_part("M151A2DefaultInterior2", 1),
    vehicle_part("M151A2Windshield2", 8),
    vehicle_part("M151A2SideWindow2", 4),
    vehicle_part("M151A2LeftDoor2", 20),
    vehicle_part("M151A2RightDoor2", 20),
    vehicle_part("M151A2WindshieldArmor1_Item", 15),
    vehicle_part("M151A2CabArmor1_Item", 30),
    vehicle_part("M151A2BarrierLeft1_Item", 10),
    vehicle_part("M151A2BarrierRight1_Item", 10)
}

CContainers.VehiclePartsKI5amgeneralM35A2 = {
    vehicle_part("M35A2Muffler1_Item", 4),
    vehicle_part("M35A2EngineDoor2", 15),
    vehicle_part("M35A2Tarp1_Item", 30),
    vehicle_part("M35A2Tarp2_Item", 30),
    vehicle_part("M35A2Tarp3_Item", 25),
    vehicle_part("M35A2tailgate2", 25),
    vehicle_part("M35A2Bumper1_Item", 15),
    vehicle_part("M35A2Grille1_Item", 4),
    vehicle_part("M35A2HardCover1_Item", 15),
    vehicle_part("M35A2SoftCover2_Item", 10),
    vehicle_part("M35A2Windshield2", 8),
    vehicle_part("M35A2SideWindow2", 4),
    vehicle_part("M35A2Door2", 15),
    vehicle_part("M35A2WindshieldArmor1_Item", 15),
    vehicle_part("M35A2DoorArmor1_Item", 10),
    vehicle_part("M35A2Mudflaps1_Item", 11)
}

CContainers.VehiclePartsKI584merc = {
    vehicle_part("W460CarFrontDoor2", 10),
    vehicle_part("W460CarRearDoor2", 10),
    vehicle_part("W460EngineDoor2", 15),
    vehicle_part("W460TrunkDoor2", 15),
    vehicle_part("W460Windshield2", 9),
    vehicle_part("W460SideWindow2", 3),
    vehicle_part("W460RearWindshield2", 4),
    vehicle_part("W460WindshieldRearArmorM", 16),
    vehicle_part("W460WindshieldRearArmor1", 15),
    vehicle_part("W460WindshieldArmor1", 20),
    vehicle_part("W460TrunkSplitDoor2", 15),
    vehicle_part("W460SnorkelM", 3),
    vehicle_part("W460RearSplitWindshield2", 8),
    vehicle_part("W460Mudflaps1", 4),
    vehicle_part("W460Guards", 2),
    vehicle_part("W460CarRearDoorArmor1", 14),
    vehicle_part("W460CarFrontDoorArmor1", 15),
    vehicle_part("W460CarBackWindowArmor1", 12),
    vehicle_part("W460BumperRear1", 7),
    vehicle_part("W460Bumper1", 7),
    vehicle_part("W460BullbarM", 21),
    vehicle_part("W460Bullbar3", 20),
    vehicle_part("W460Bullbar2", 13),
    vehicle_part("W460BodykitM", 10),
    vehicle_part("W460Bodykit1", 10)
}

CContainers.VehiclePartsKI5amgeneralM923 = {
    vehicle_part("M923Extra2", 1),
    vehicle_part("M923Muffler1_Item", 4),
    vehicle_part("M923EngineDoor2", 15),
    vehicle_part("M923FlatbedStakes1_Item", 1),
    vehicle_part("M923Tailgate2", 15),
    vehicle_part("M923Trunkdoor2", 2),
    vehicle_part("M923Bumper1_Item", 15),
    vehicle_part("M923Bumper2_Item", 7),
    vehicle_part("M923HardCover1_Item", 20),
    vehicle_part("M923SoftCover2_Item", 10),
    vehicle_part("M923SideWindow2", 4),
    vehicle_part("M923Gunport2", 10),
    vehicle_part("M923Door2", 14),
    vehicle_part("M923WindshieldArmor1_Item", 15),
    vehicle_part("M923DoorArmor1_Item", 10),
    vehicle_part("M923GuntruckArmor1_Item", 35),
    vehicle_part("M923Mudflaps1_Item", 12),
    vehicle_part("M923SpareMount1_Item", 12)
}

CContainers.VehiclePartsKI580kz1000 = {
    vehicle_part("KZ1KstorageLid", 2),
    vehicle_part("KZ1KsidestorageLid", 2),
    vehicle_part("KZ1Kmuffler", 5),
    vehicle_part("KZ1Kseat", 4),
    vehicle_part("KZ1Kwindshield3", 3)
}

CContainers.VehiclePartsKI5nissanGTR = {
    vehicle_part("R32Door3", 12),
    vehicle_part("R32Bumper0", 15),
    vehicle_part("R32Bumper1", 15),
    vehicle_part("R32Bumper2", 13),
    vehicle_part("R32Bumper3", 12),
    vehicle_part("R32BumperA", 26),
    vehicle_part("R32BumperRear0", 15),
    vehicle_part("R32BumperRear1", 12),
    vehicle_part("R32BumperRear2", 12),
    vehicle_part("R32BumperRear3", 11),
    vehicle_part("R32BumperRearA", 24),
    vehicle_part("R32Sideskirts1", 6),
    vehicle_part("R32Sideskirts2", 5),
    vehicle_part("R32Sideskirts3", 4),
    vehicle_part("R32SideskirtsA", 15),
    vehicle_part("R32Spoiler0", 7),
    vehicle_part("R32Spoiler1", 7),
    vehicle_part("R32Spoiler2", 7),
    vehicle_part("R32Spoiler3", 7),
    vehicle_part("R32EngineDoor0", 10),
    vehicle_part("R32TrunkDoor3", 10),
    vehicle_part("R32Windshield3", 8),
    vehicle_part("R32WindshieldRear3", 8),
    vehicle_part("R32FrontSideWindow3", 5),
    vehicle_part("R32RearSideWindow3", 3),
    vehicle_part("R32DoorArmor", 25),
    vehicle_part("R32RearWindowArmor", 6),
    vehicle_part("R32WindshieldArmor", 15),
    vehicle_part("R32WindshieldRearArmor", 15),
    vehicle_part("R32muffler1", 4),
    vehicle_part("R32muffler0", 5)
}

CContainers.VehiclePartsKI549PWagon = {
    vehicle_part("49powerWagonWindshieldRearArmor", 10),
    vehicle_part("49powerWagonWindshieldRear2", 3),
    vehicle_part("49powerWagonWindshieldArmor", 18),
    vehicle_part("49powerWagonWindshield2", 8),
    vehicle_part("49powerWagonTrunkDoor2", 10),
    vehicle_part("49powerWagonSideskirts1", 7),
    vehicle_part("49powerWagonSideskirts0", 10),
    vehicle_part("49powerWagonSideWindow2", 4),
    vehicle_part("49powerWagonRearFenderMakeshift", 7),
    vehicle_part("49powerWagonRearFender", 10),
    vehicle_part("49powerWagonRearDoorArmor", 13),
    vehicle_part("49powerWagonRearDoor2", 10),
    vehicle_part("49powerWagonFrontFenderMakeshift", 19),
    vehicle_part("49powerWagonFrontFender", 10),
    vehicle_part("49powerWagonFrontDoorArmor", 14),
    vehicle_part("49powerWagonFrontDoor2", 11),
    vehicle_part("49powerWagonEngineDoor2", 10),
    vehicle_part("49powerWagonBumper0", 10),
    vehicle_part("49powerWagonBullbar2", 15),
    vehicle_part("49powerWagonBullbar1", 15)
}

CContainers.VehicleStorageKI549PWagon = {
    vehicle_storage("49powerWagonTruckBedSeat2", 20, 15, 25, 30),
    vehicle_storage("49powerWagonTire", 35, 15, 40, 45),
    vehicle_storage("49powerWagonSeat2", 20, 15, 25, 30),
    vehicle_storage("49powerWagonApocalypseTire", 35, 20, 40, 45)
}

CContainers.VehicleStorageKI5Dodge70 = {
    vehicle_storage("DodgeFrontSeat3", 25, 15, 35, 45),
    vehicle_storage("DodgeRearSeat3", 25, 15, 35, 45)
}

CContainers.VehiclePartsKI5Dodge70 = {
    vehicle_part("DG70RTEngineDoor", 15),
    vehicle_part("DG70PDEngineDoor", 11),
    vehicle_part("DG70TAEngineDoor0", 15),
    vehicle_part("DG70TAEngineDoor1", 10),
    vehicle_part("DG70TrunkDoor3", 9),
    vehicle_part("DG70Door3", 10),
    vehicle_part("DG70FrontSideWindow3", 3),
    vehicle_part("DG70Windshield3", 8),
    vehicle_part("DG70WindshieldRear3", 8),
    vehicle_part("DG70FrontBumper0", 10),
    vehicle_part("DG70RearBumper0", 10),
    vehicle_part("DG70FrontBumperA", 15),
    vehicle_part("DG70FrontBumperB", 13),
    vehicle_part("DG70FrontBumperC", 14),
    vehicle_part("DG70RearBumperA", 13),
    vehicle_part("DG70RearBumperB", 11),
    vehicle_part("DG70RearBumperC", 12),
    vehicle_part("DG70WindshieldArmor", 13),
    vehicle_part("DG70WindshieldRearArmor", 9),
    vehicle_part("DG70DoorArmor", 8),
    vehicle_part("DG70Spoiler0", 5),
    vehicle_part("DG70Spoiler1", 4),
    vehicle_part("DG70RTRoof0", 25),
    vehicle_part("DG70WindshieldArmorB", 11)
}

CContainers.VehiclePartsKI5Ford89 = {
    vehicle_part("80sPickupWindowFrontArmor", 10),
    vehicle_part("80sPickupWindshieldArmor", 18),
    vehicle_part("80sPickupWindowRearArmor", 14),
    vehicle_part("80sPickupBullbarFront", 20),
    vehicle_part("80sPickupBullbarRear", 16),
    vehicle_part("80sPickupRollbarA", 22),
    vehicle_part("80sPickupRollbarB", 28)
}

CContainers.VehiclePartsKI5JeepJ10 = {
    vehicle_part("80sPickupWindowFrontArmor", 10),
    vehicle_part("80sPickupWindshieldArmor", 18),
    vehicle_part("80sPickupWindowRearArmor", 14),
    vehicle_part("80sPickupBullbarFront", 20),
    vehicle_part("80sPickupBullbarRear", 16),
    vehicle_part("80sPickupRollbarA", 22),
    vehicle_part("80sPickupRollbarB", 28)
}

CContainers.VehiclePartsKI5ChevyS10 = {
    vehicle_part("80sPickupWindowFrontArmor", 10),
    vehicle_part("80sPickupWindshieldArmor", 18),
    vehicle_part("80sPickupWindowRearArmor", 14),
    vehicle_part("80sPickupBullbarFront", 20),
    vehicle_part("80sPickupBullbarRear", 16),
    vehicle_part("80sPickupRollbarA", 22),
    vehicle_part("80sPickupRollbarB", 28)
}

CContainers.VehicleParts90zanella = {
    vehicle_part("ZNL50muffler", 5),
    vehicle_part("ZNL50gasTank", 5),
    vehicle_part("ZNL50seat", 4),
    vehicle_part("ZNL50fenderFront", 5),
    vehicle_part("ZNL50fenderRear", 5),
    vehicle_part("ZNL50boxLid", 2)
}

CContainers.VehicleStorageKI569camaro = {
    vehicle_storage("69camaroFrontSeat3", 25, 15, 30, 35),
    vehicle_storage("69camaroRearSeat3", 25, 15, 30, 35)
}

CContainers.VehiclePartsKI569camaro = {
    vehicle_part("69camaroEngineDoorRS", 13),
    vehicle_part("69camaroEngineDoorSS", 13),
    vehicle_part("69camaroTrunkDoor3", 8),
    vehicle_part("69camaroDoor3", 11),
    vehicle_part("69camaroFrontSideWindow3", 5),
    vehicle_part("69camaroWindshield3", 8),
    vehicle_part("69camaroWindshieldRear3", 6),
    vehicle_part("69camaroFrontBumper0", 10),
    vehicle_part("69camaroFrontBumper1", 10),
    vehicle_part("69camaroRearBumper0", 10),
    vehicle_part("69camaroFrontBumperA", 14),
    vehicle_part("69camaroFrontBumperB", 17),
    vehicle_part("69camaroRearBumperA", 12),
    vehicle_part("69camaroRearBumperB", 12),
    vehicle_part("69camaroWindshieldArmor", 13),
    vehicle_part("69camaroWindshieldRearArmor", 9),
    vehicle_part("69camaroWindowArmor", 8),
    vehicle_part("69camaroSpoiler0", 5)
}

CContainers.VehicleStorageKI593mustangSSP = {
    vehicle_storage("93mustangSSPTire1", 35, 15, 40, 45),
    vehicle_storage("93mustangSSPSeatFront1", 20, 15, 25, 30),
    vehicle_storage("93mustangSSPSeatRear1", 25, 16, 0, 35)
}

CContainers.VehiclePartsKI593mustangSSP = {
    vehicle_part("93mustangSSPFrontDoor1", 10),
    vehicle_part("93mustangSSPWindshieldArmor", 15),
    vehicle_part("93mustangSSPFrontWindowArmor", 8),
    vehicle_part("93mustangSSPRearWindowArmor", 6),
    vehicle_part("93mustangSSPWindshieldRearArmor", 13),
    vehicle_part("93mustangSSPEngineDoor1", 13),
    vehicle_part("93mustangSSPTrunkDoor1", 10),
    vehicle_part("93mustangSSPBumperFront0", 10),
    vehicle_part("93mustangSSPBumperFront1", 17),
    vehicle_part("93mustangSSPBumperRear0", 10),
    vehicle_part("93mustangSSPWindshield1", 9),
    vehicle_part("93mustangSSPFrontSideWindow1", 3),
    vehicle_part("93mustangSSPRearSideWindow1", 3),
    vehicle_part("93mustangSSPRearWindshield1", 10)
}

CContainers.VehicleStorageKI563beetle = {
    vehicle_storage("63beetleRoofrack1", 45, 10, 55, 65),
    vehicle_storage("63beetleFrontSeat1", 20, 15, 25, 30),
    vehicle_storage("63beetleRearSeat1", 20, 15, 25, 30),
    vehicle_storage("63vwStockTire1", 35, 13, 40, 45),
    vehicle_storage("63beetleTireSlick3", 35, 15, 40, 45),
    vehicle_storage("63beetleTireOffroad2", 35, 17, 40, 45)
}

CContainers.VehicleStorageKI567gt500 = {
    vehicle_storage("67gt500Tire3", 35, 10, 45, 55),
    vehicle_storage("67gt500eTire3", 35, 10, 45, 55),
    vehicle_storage("67gt500Roofrack3", 55, 10, 65, 75),
    vehicle_storage("67gt500FrontSeat3", 25, 15, 35, 45),
    vehicle_storage("67gt500RearSeat3", 25, 15, 35, 45)
}

CContainers.VehicleStorageKI589dodgeCaravan = {
    vehicle_storage("89dodgeCaravanRoofrack0", 120, 10, 130, 140),
    vehicle_storage("89dodgeCaravanSeat1", 20, 15, 25, 30),
    vehicle_storage("89dodgeCaravanTireOffroad2", 35, 17, 40, 45),
    vehicle_storage("89dodgeCaravanTire1", 35, 13, 40, 45)
}

CContainers.VehiclePartsKI589dodgeCaravan = {
    vehicle_part("89dodgeCaravanSidesteps0", 8),
    vehicle_part("89dodgeCaravanFrontDoor1", 11),
    vehicle_part("89dodgeCaravanSlideDoor1", 15),
    vehicle_part("89dodgeCaravanFrontWindowArmor", 14),
    vehicle_part("89dodgeCaravanRearWindowArmor", 13),
    vehicle_part("89dodgeCaravanBackWindowArmor", 13),
    vehicle_part("89dodgeCaravanWindshieldArmor", 18),
    vehicle_part("89dodgeCaravanWindshieldRearArmor", 10),
    vehicle_part("89dodgeCaravanEngineDoor1", 10),
    vehicle_part("89dodgeCaravanTrunkDoor1", 10),
    vehicle_part("89dodgeCaravanBumperFront0", 8),
    vehicle_part("89dodgeCaravanBumperFrontA", 18),
    vehicle_part("89dodgeCaravanBullbarFrontA", 10),
    vehicle_part("89dodgeCaravanBumperRear0", 10),
    vehicle_part("89dodgeCaravanWindshield1", 8),
    vehicle_part("89dodgeCaravanFrontSideWindow1", 4),
    vehicle_part("89dodgeCaravanRearSideWindow1", 4),
    vehicle_part("89dodgeCaravanWindshieldRear1", 3),
    vehicle_part("89dodgeCaravanMudflaps0", 25)

}

CContainers.VehiclePartsKI567gt500 = {
    vehicle_part("67gt500EngineDoor3", 13),
    vehicle_part("67gt500eEngineDoor3", 13),
    vehicle_part("67gt500TrunkDoor3", 8),
    vehicle_part("67gt500Door3", 11),
    vehicle_part("67gt500FrontSideWindow3", 5),
    vehicle_part("67gt500Windshield3", 8),
    vehicle_part("67gt500WindshieldRear3", 6),
    vehicle_part("67gt500FrontBumper0", 6),
    vehicle_part("67gt500FrontBumperA", 18),
    vehicle_part("67gt500eFrontBumper0", 10),
    vehicle_part("67gt500eFrontBumperA", 22),
    vehicle_part("67gt500RearBumper0", 6),
    vehicle_part("67gt500RearBumperA", 14),
    vehicle_part("67gt500FrontBullbar", 12),
    vehicle_part("67gt500RearBullbar", 8),
    vehicle_part("67gt500WindshieldArmor", 13),
    vehicle_part("67gt500WindshieldRearArmor", 9),
    vehicle_part("67gt500WindowArmor", 8)
}

CContainers.VehiclePartsKI563beetle = {
    vehicle_part("63beetleSidesteps0", 8),
    vehicle_part("63beetleBodykit0", 13),
    vehicle_part("63beetleDoor1", 11),
    vehicle_part("63beetleFrontWindowArmor", 14),
    vehicle_part("63beetleRearWindowArmor", 13),
    vehicle_part("63beetleWindshieldArmor", 18),
    vehicle_part("63beetleWindshieldRearArmor", 10),
    vehicle_part("63beetleEngineDoor1", 10),
    vehicle_part("63beetleTrunkDoor1", 10),
    vehicle_part("63beetleBumperFront0", 10),
    vehicle_part("63beetleBumperFront1", 10),
    vehicle_part("63beetleBumperFront2", 10),
    vehicle_part("63beetleBumperRear1", 10),
    vehicle_part("63beetleWindshield1", 8),
    vehicle_part("63beetleFrontSideWindow1", 4),
    vehicle_part("63beetleRearSideWindow1", 4),
    vehicle_part("63beetleWindshieldRear1", 3),
    vehicle_part("63beetleHPRoof0", 25),
    vehicle_part("63beetleBuggySpoiler0", 11),
    vehicle_part("63beetleSmallSpoiler0", 5),
    vehicle_part("63beetleBumperRear0", 10)
}

CContainers.VehicleStorageKI591geoMetro = {
    vehicle_storage("91geoMetroTire1", 35, 15, 40, 45),
    vehicle_storage("91geoMetroRoofrack0", 45, 13, 50, 60),
    vehicle_storage("91geoMetroRoofrack1", 55, 10, 65, 75),
    vehicle_storage("91geoMetroSeatFront1", 20, 15, 25, 30),
    vehicle_storage("91geoMetroSeatRear1", 20, 12, 25, 30)
}

CContainers.VehiclePartsKI591geoMetro = {
    vehicle_part("91geoMetroFrontDoor1", 10),
    vehicle_part("91geoMetroWindshieldArmor", 15),
    vehicle_part("91geoMetroFrontWindowArmor", 8),
    vehicle_part("91geoMetroRearWindowArmor", 6),
    vehicle_part("91geoMetroWindshieldRearArmor", 13),
    vehicle_part("91geoMetroEngineDoor1", 13),
    vehicle_part("91geoMetroTrunkDoor1", 10),
    vehicle_part("91geoMetroBumperFront0", 10),
    vehicle_part("91geoMetroReinforcedBumperFront1", 17),
    vehicle_part("91geoMetroBumperRear0", 10),
    vehicle_part("91geoMetroWindshield1", 9),
    vehicle_part("91geoMetroFrontSideWindow1", 3),
    vehicle_part("91geoMetroRearSideWindow1", 3),
    vehicle_part("91geoMetroRearWindshield1", 10)
}

CContainers.VehicleStorageKI593fordElgin = {
    vehicle_storage("93fordCF8000Tire2", 35, 16, 40, 45),
    vehicle_storage("93fordCF8000DoubleTires2", 35, 16, 40, 45),
    vehicle_storage("93fordCF8000Seat2", 20, 15, 25, 30)
}

CContainers.VehiclePartsKI593fordElgin = {
    vehicle_part("93fordCF8000Door2", 10),
    vehicle_part("93fordCF8000Bumper0", 15),
    vehicle_part("93fordCF8000EngineDoor2", 15),
    vehicle_part("93fordCF8000Windshield2", 9),
    vehicle_part("93fordCF8000SideWindow2", 3),
    vehicle_part("93fordCF8000RearWindshield2", 7),
    vehicle_part("93fordCF8000Muffler0", 12),
    vehicle_part("93fordCF8000Brushes", 20),
    vehicle_part("93fordCF8000WindshieldRearArmor", 11),
    vehicle_part("93fordCF8000WindshieldArmor", 20),
    vehicle_part("93fordCF8000FrontWindowArmor", 10),
    vehicle_part("93fordCF8000BumperA", 15)
}

CContainers.VehicleStorageFilibuster = {
    vehicle_storage("FRSideContainer1", 25, 5, 35, 45),
    vehicle_storage("FRSideContainer2", 25, 5, 35, 45),
    vehicle_storage("FRSideContainer3", 25, 5, 35, 45),
    vehicle_storage("FRSideContainer8", 25, 5, 35, 45),
    vehicle_storage("FRTinyTrunk1", 40, 20, 50, 75),
    vehicle_storage("FRTinyTrunk2", 60, 30, 70, 90),
    vehicle_storage("FRTinyTrunk3", 30, 10, 45, 65),
    vehicle_storage("FRTinyTrunk8", 40, 10, 55, 75),
    vehicle_storage("FRSmallTrunk1", 55, 30, 70, 90),
    vehicle_storage("FRSmallTrunk2", 85, 40, 95, 110),
    vehicle_storage("FRSmallTrunk3", 40, 20, 55, 75),
    vehicle_storage("FRSmallTrunk8", 55, 20, 70, 90),
    vehicle_storage("FRNormalTrunk1", 75, 35, 90, 110),
    vehicle_storage("FRNormalTrunk2", 105, 50, 115, 130),
    vehicle_storage("FRNormalTrunk3", 65, 25, 80, 100),
    vehicle_storage("FRNormalTrunk8", 80, 35, 90, 110),
    vehicle_storage("FRBigTrunk1", 95, 40, 115, 135),
    vehicle_storage("FRBigTrunk2", 130, 50, 150, 175),
    vehicle_storage("FRBigTrunk3", 75, 30, 100, 125),
    vehicle_storage("FRBigTrunk8", 120, 55, 135, 155),
    vehicle_storage("FRLargeTrunk1", 125, 90, 145, 165),
    vehicle_storage("FRLargeTrunk2", 155, 100, 170, 190),
    vehicle_storage("FRLargeTrunk3", 95, 80, 115, 135),
    vehicle_storage("FRLargeTrunk8", 160, 100, 185, 205),
    vehicle_storage("FRCargoTrunk1", 230, 90, 255, 275),
    vehicle_storage("FRCargoTrunk2", 340, 100, 355, 375),
    vehicle_storage("FRCargoTrunk3", 175, 90, 200, 225),
    vehicle_storage("FRCargoTrunk8", 335, 100, 355, 375),
    vehicle_storage("FRXLCargoTrunk1", 380, 90, 410, 430),
    vehicle_storage("FRXLCargoTrunk2", 490, 100, 520, 550),
    vehicle_storage("FRXLCargoTrunk3", 235, 90, 255, 275),
    vehicle_storage("FRXLCargoTrunk8", 445, 100, 470, 500),
    vehicle_storage("FRTrailerTrunk1", 140, 15, 160, 190),
    vehicle_storage("FRTrailerTrunk2", 140, 15, 160, 190),
    vehicle_storage("FRTrailerTrunk3", 140, 15, 160, 190)
}

CContainers.VehiclePartsFilibuster = {
    vehicle_part("OldTire8", 30),
    vehicle_part("NormalTire8", 30),
    vehicle_part("ModernTire8", 30),
    vehicle_part("OldBrake8", 3),
    vehicle_part("NormalBrake8", 3),
    vehicle_part("ModernBrake8", 3),
    vehicle_part("NormalSuspension8", 2),
    vehicle_part("ModernSuspension8", 3),
    vehicle_part("SmallGasTank8", 14),
    vehicle_part("NormalGasTank8", 17),
    vehicle_part("BigGasTank8", 22),
    vehicle_part("CarBattery8", 8),
    vehicle_part("Windshield8", 8),
    vehicle_part("RearWindshield8", 8),
    vehicle_part("FrontWindow8", 3),
    vehicle_part("RearWindow8", 3),
    vehicle_part("FrontCarDoor8", 10),
    vehicle_part("RearCarDoor8", 10),
    vehicle_part("RearCarDoorDouble8", 20),
    vehicle_part("EngineDoor8", 15),
    vehicle_part("TrunkDoor8", 15),
    vehicle_part("GloveBox8", 8),
    vehicle_part("NormalCarSeat8", 15),
    vehicle_part("BigCarSeat8", 20),
    vehicle_part("SportCarSeat8", 10),
    vehicle_part("OldCarMuffler8", 10),
    vehicle_part("NormalCarMuffler8", 10),
    vehicle_part("ModernCarMuffler8", 10)
}

CContainers.VehicleStorageDanny = {
    vehicle_storage("130Trunk1", 620, 15, 640, 670),
    vehicle_storage("130Trunk2", 670, 15, 690, 720),
    vehicle_storage("130Trunk3", 700, 15, 720, 750),
    vehicle_storage("130Trunk8", 720, 15, 740, 770),
    vehicle_storage("AC40Trunk1", 320, 15, 340, 370),
    vehicle_storage("AC40Trunk2", 330, 15, 350, 380),
    vehicle_storage("AC40Trunk3", 340, 15, 360, 390),
    vehicle_storage("AC40Trunk8", 370, 15, 390, 420),
    vehicle_storage("130GTrunk1", 840, 15, 860, 890),
    vehicle_storage("130GTrunk2", 820, 15, 840, 870),
    vehicle_storage("130GTrunk3", 870, 15, 890, 920),
    vehicle_storage("130GTrunk8", 920, 15, 940, 970)
}

CContainers.VehicleStorageTsarYachtClub = {
    vehicle_storage("Aquatsar.NotRemovableBoatSeat1", 25, 15, 35, 45),
    vehicle_storage("Aquatsar.NotRemovableBoatSeat2", 25, 15, 35, 45),
    vehicle_storage("Aquatsar.NotRemovableBoatSeat3", 25, 15, 35, 45),
    vehicle_storage("Aquatsar.AirBagNormal1", 40, 15, 50, 60),
    vehicle_storage("Aquatsar.AirBagNormal2", 40, 15, 50, 60),
    vehicle_storage("Aquatsar.AirBagNormal3", 40, 15, 50, 60)
}

CContainers.VehicleStorageTsarDadge = {
    vehicle_storage("Autotsar.ATADodgeRoofRackItem", 40, 10, 50, 60),
    vehicle_storage("Autotsar.ATADodgeWindowRackItem", 35, 10, 45, 55)
}

CContainers.VehicleStorageTsarJeep = {
    vehicle_storage("Autotsar.ATAJeepInteractiveTrunkRoofRackItem", 80, 10, 90, 105),
    vehicle_storage("Autotsar.ATAJeepInteractiveTrunkWheelRackItem", 45, 10, 55, 65),
    vehicle_storage("Autotsar.ATAJeepRoofTentItem", 35, 15, 45, 55)
}

CContainers.VehicleStorageTsarMustang = {
    vehicle_storage("Autotsar.ATAMustangRoofRackItem", 65, 10, 75, 90)
}

CContainers.VehicleStorageTsarTrailers = {
    vehicle_storage("Autotsar.TrailerFirstTrunk", 520, 50, 530, 560),
    vehicle_storage("Autotsar.TrailerSecondTrunk", 520, 50, 530, 560)
}

CContainers.VehicleStorageTsarTrolley = {
    vehicle_storage("TMC.TrolleyContainer", 60, 1, 70, 80),
    vehicle_storage("TMC.TrolleyContainer2", 60, 1, 70, 80),
    vehicle_storage("TMC.CartContainer", 60, 1, 70, 80),
    vehicle_storage("TMC.CartContainer2", 60, 1, 70, 80)
}

CContainers.VehicleStorageTsarLuton = {
    vehicle_storage("Autotsar.ATALutonInteractiveTrunkRoofRackItem", 210, 10, 220, 250)
}

CContainers.VehicleStorageTsarVanRumba = {
    vehicle_storage("Autotsar.ATAVanDeRumbaInteractiveTrunkRoofRackItem", 210, 10, 220, 250),
    vehicle_storage("Autotsar.ATAVanDeRumbRoofBoxItem", 50, 15, 60, 75)
}

CContainers.VehiclePartsTsarMustang66 = {
    vehicle_part("Autotsar.ATAMustang66BumperItem", 4),
    vehicle_part("Autotsar.ATAMustang66BumperRearItem", 15),
    vehicle_part("Autotsar.ATAMustang66Hood2Item3", 15),
    vehicle_part("Autotsar.ATAMustang66Hood3Item3", 15),
    vehicle_part("Autotsar.ATAMustang66TrunkDoor3", 15)
}

CContainers.VehiclePartsTsarDatsun240z = {
    vehicle_part("Autotsar.ATADatsun240zBumperItem", 4),
    vehicle_part("Autotsar.ATADatsun240zBumperRearItem", 4),
    vehicle_part("Autotsar.ATADatsun240zHood2Item3", 15)
}

CContainers.VehiclePartsTsarBumer = {
    vehicle_part("Autotsar.ATABMWe36SpoilerRear1Item", 2),
    vehicle_part("Autotsar.ATABMWe36SpoilerRear2Item", 2),
    vehicle_part("Autotsar.ATABMWe36SpoilerRear3Item", 2)
}

CContainers.VehiclePartsTsarAgro = {
    vehicle_part("Agrotsar.ASeederTankSmall", 6),
    vehicle_part("Agrotsar.ASeederTankMedium", 7),
    vehicle_part("Agrotsar.ASeederTankLarge", 8),
    vehicle_part("Agrotsar.ASeederPlate", 1),
    vehicle_part("Agrotsar.APlowshare", 1)
}

CContainers.VehiclePartsTsaramclub = {
    vehicle_part("Autotsar.ATAMotoBMWCustomMuffler", 10),
    vehicle_part("Autotsar.ATAMotoBMWClassicMuffler", 10),
    vehicle_part("Autotsar.ATAMotoBMWSeat", 9),
    vehicle_part("Autotsar.ATAMotoBMWSeatCustom", 6),
    vehicle_part("Autotsar.ATAMotoHarleyMuffler", 10),
    vehicle_part("Autotsar.ATAMotoHarleySeat", 6),
    vehicle_part("Autotsar.ATAMotoQuadSeat", 6)
}

CContainers.VehiclePartsTsarYachtClub = {
    vehicle_part("Aquatsar.BoatPropeller", 20),
    vehicle_part("Aquatsar.ManualStarter", 1),
    vehicle_part("Aquatsar.Sails", 20)
}

CContainers.VehiclePartsTsarDadge = {
    vehicle_part("Autotsar.ATADodgeBullbar1Item", 10),
    vehicle_part("Autotsar.ATADodgeBullbar2Item", 10),
    vehicle_part("Autotsar.ATADodgeBullbar3Item", 10),
    vehicle_part("Autotsar.ATADodgeProtectionWindowSideItem", 10),
    vehicle_part("Autotsar.ATADodgeProtectionWindowFrontItem", 10)
}

CContainers.VehiclePartsTsarJeep = {
    vehicle_part("Autotsar.ATAJeepBumper1Item", 10),
    vehicle_part("Autotsar.ATAJeepBumper2Item", 10),
    vehicle_part("Autotsar.ATAJeepBumper3Item", 10),
    vehicle_part("Autotsar.ATAJeepBumper4Item", 10),
    vehicle_part("Autotsar.ATAJeepProtectionWindowItem", 10),
    vehicle_part("Autotsar.ATAJeepProtectionWindowFrontItem", 10),
    vehicle_part("Autotsar.ATAJeepProtectionWindowRearItem", 10),
    vehicle_part("Autotsar.ATAJeepRoofBaseItem", 10),
    vehicle_part("Autotsar.ATAJeepSnorkelItem", 1)
}

CContainers.VehiclePartsTsarMustang = {
    vehicle_part("Autotsar.ATAMustangBullbar1Item", 10),
    vehicle_part("Autotsar.ATAMustangBullbar2Item", 10),
    vehicle_part("Autotsar.ATAMustangBullbar3Item", 10),
    vehicle_part("Autotsar.ATAMustangHood2Item3", 15),
    vehicle_part("Autotsar.ATAMustangHood3Item3", 15),
    vehicle_part("Autotsar.ATAMustangHood4Item3", 15),
    vehicle_part("Autotsar.ATAMustangFendersWideItem", 2),
    vehicle_part("Autotsar.ATAMustangSkirtsSideItem", 2),
    vehicle_part("Autotsar.ATAMustangSpoilerFrontItem", 2),
    vehicle_part("Autotsar.ATAMustangSpoilerRear1Item", 2),
    vehicle_part("Autotsar.ATAMustangSpoilerRear2Item", 2),
    vehicle_part("Autotsar.ATAMustangProtectionWindowLeftItem", 10),
    vehicle_part("Autotsar.ATAMustangProtectionWindowRightItem", 10),
    vehicle_part("Autotsar.ATAMustangProtectionWindowFrontItem", 10),
    vehicle_part("Autotsar.ATAMustangProtectionWindowRearItem", 10)
}

CContainers.VehiclePartsTsarPetyar = {
    vehicle_part("Autotsar.ATAPetyarbuiltProtectionSleeperItem", 20),
    vehicle_part("Autotsar.ATAPetyarbuiltProtectionRearWheelsItem", 10),
    vehicle_part("Autotsar.ATAPetyarbuiltProtectionGasTankItem", 10),
    vehicle_part("Autotsar.ATAPetyarbuiltProtectionSideItem", 15),
    vehicle_part("Autotsar.ATAPetyarbuiltProtectionSideFrontItem", 15),
    vehicle_part("Autotsar.ATAPetyarbuiltProtectionSideTopItem", 10)
}

CContainers.VehiclePartsTsarLuton = {
    vehicle_part("Autotsar.ATALutonProtectionSideFrontItem", 10),
    vehicle_part("Autotsar.ATALutonProtectionHoodItem", 10),
    vehicle_part("Autotsar.ATALutonProtectionWindowFrontSideItem", 10),
    vehicle_part("Autotsar.ATALutonProtectionWindowFrontItem", 10),
    vehicle_part("Autotsar.ATALutonLadderItem", 10)
}

CContainers.VehiclePartsTsarVanRumba = {
    vehicle_part("Autotsar.ATAVanDeRumbaBullbar1Item", 10),
    vehicle_part("Autotsar.ATAVanDeRumbaBullbar2Item", 10),
    vehicle_part("Autotsar.ATAVanDeRumbaBullbar3Item", 10),
    vehicle_part("Autotsar.ATAVanDeRumbaProtectionHoodItem", 10),
    vehicle_part("Autotsar.ATAVanDeRumbaProtectionWindowFrontItem", 10),
    vehicle_part("Autotsar.ATAVanDeRumbaProtectionWindowFrontSideItem", 10),
    vehicle_part("Autotsar.ATAVanDeRumbaProtectionWindowRearItem", 10),
    vehicle_part("Autotsar.ATAVanDeRumbaLadderItem", 10),
    vehicle_part("Autotsar.ATAVanDeRumbaRoofBaseItem", 10)
}

CContainers.VehiclePartsKI597Bushmaster = {
    vehicle_part("97BushmasterGunnerSeat", 4),
    vehicle_part("97BushDoor2", 25),
    vehicle_part("97BushHatch2", 7),
    vehicle_part("97BushEngineDoor2", 18),
    vehicle_part("97BushStorageLidSmall", 8),
    vehicle_part("97BushStorageLidLarge", 12),
    vehicle_part("97BushWindshield2", 8),
    vehicle_part("97BushFrontSideWindow2", 4),
    vehicle_part("97BushSideWindow2", 3),
    vehicle_part("97BushWindshieldRear2", 3),
    vehicle_part("97BushMudflaps", 2),
    vehicle_part("97BushGasTank2", 19)
}

CContainers.VehiclePartsKI570barracuda = {
    vehicle_part("CUDAEngineDoorStock", 13),
    vehicle_part("CUDAEngineDoor", 15),
    vehicle_part("CUDAEngineDoorAAR", 10),
    vehicle_part("CUDATrunkDoor3", 8),
    vehicle_part("CUDADoor3", 11),
    vehicle_part("CUDAFrontSideWindow3", 5),
    vehicle_part("CUDAWindshield3", 8),
    vehicle_part("CUDAWindshieldRear3", 6),
    vehicle_part("CUDAFrontBumper0", 10),
    vehicle_part("CUDAFrontBumper1", 12),
    vehicle_part("CUDAFrontBumper2", 14),
    vehicle_part("CUDARearBumper0", 14),
    vehicle_part("CUDAFrontBumperA", 15),
    vehicle_part("CUDARearBumperA", 13),
    vehicle_part("CUDAWindshieldArmor", 13),
    vehicle_part("CUDAWindshieldRearArmor", 9),
    vehicle_part("CUDADoorArmor", 8),
    vehicle_part("CUDASpoiler0", 5),
    vehicle_part("CUDASpoiler1", 4)
}

CContainers.VehiclePartsKI528ss100 = {
    vehicle_part("SS100seat3", 4),
    vehicle_part("SS100windshield3", 3),
    vehicle_part("SS100fenderFront3", 5),
    vehicle_part("SS100fenderRear3", 5)
}

CContainers.VehiclePartsKI5vino125 = {
    vehicle_part("VN125seat", 4)
}

CContainers.VehicleStorageCytXM93 = {
    vehicle_storage("XM93LabContainer", 30, 30, 40, 50),
    vehicle_storage("XM93VehicleInterior", 120, 30, 140, 175)
}

CContainers.VehicleStorageCytBRDM2 = {
    vehicle_storage("BRDM2VehicleInterior", 30, 30, 40, 50)
}

CContainers.VehiclePartsCytIFAV = {
    vehicle_part("IFAVDoor2", 10),
    vehicle_part("IFAVWindshield2", 20),
    vehicle_part("IFAVWindshieldFrame2", 10),
    vehicle_part("IFAVFrontBumper2", 15),
    vehicle_part("IFAVFrontTop2", 5),
    vehicle_part("IFAVRearTop2", 5),
    vehicle_part("IFAVSideCovers2", 20)
}

CContainers.VehiclePartsCytSL500 = {
    vehicle_part("SL500Door3", 10),
    vehicle_part("SL500Windshield3", 20),
    vehicle_part("SL500SideWindow3", 20),
    vehicle_part("SL500TrunkDoor3", 20),
    vehicle_part("SL500HardTop3", 5),
    vehicle_part("SL500SoftTop3", 5)
}

CContainers.VehiclePartsCytFJ75C = {
    vehicle_part("FJ75DoorArmor2", 10),
    vehicle_part("FJ75WindshieldArmor2", 10),
    vehicle_part("FJ75Bullbar2", 10)
}

CContainers.VehicleStorageCytSB = {
    vehicle_storage("Int4700FrontWheel2", 35, 10, 40, 45),
    vehicle_storage("Int4700RearWheel2", 35, 10, 40, 45),
    vehicle_storage("Int4700Seat2", 40, 10, 50, 60)
}

CContainers.VehiclePartsCytSB = {
    vehicle_part("Int4700Bullbar2", 10),
    vehicle_part("Int4700FrontDoor2", 10),
    vehicle_part("Int4700FrontWindow2", 10),
    vehicle_part("Int4700Hood2", 10),
    vehicle_part("Int4700RearDoor2", 10),
    vehicle_part("Int4700RearWindow2", 10),
    vehicle_part("Int4700Windshield2", 10),
    vehicle_part("Int4700SideWindow2", 10)
}

CContainers.VehicleStorageCytU1550L = {
    vehicle_storage("U1550LWheel2", 35, 10, 40, 45),
    vehicle_storage("U1550LSeat2", 40, 10, 45, 60),
    vehicle_storage("U1550LGasTank2", 85, 15, 95, 105)
}

CContainers.VehiclePartsCytU1550L = {
    vehicle_part("U1550LBull2", 10),
    vehicle_part("U1550LWindowArmor2", 10),
    vehicle_part("U1550LWindshieldBars2", 10),
    vehicle_part("U1550LDoor2", 10),
    vehicle_part("U1550LTrailerDoor2", 10),
    vehicle_part("U1550LWindow2", 10),
    vehicle_part("U1550LHood2", 10),
    vehicle_part("U1550LTrunkDoor2", 10),
    vehicle_part("U1550LRearWindow2", 10),
    vehicle_part("U1550LWindshield2", 10),
    vehicle_part("U1550LMuffler2", 10),
    vehicle_part("U1550LTarp2", 10),
    vehicle_part("U1550LInteriorArmoring2", 40)
}

CContainers.VehicleStorageCytMCF1 = {
    vehicle_storage("McLarenF1FrontWheel3", 40, 10, 45, 50),
    vehicle_storage("McLarenF1RearWheel3", 40, 10, 45, 50)
}

CContainers.VehiclePartsCytMCF1 = {
    vehicle_part("McLarenF1Door3", 10),
    vehicle_part("McLarenF1Hood3", 10),
    vehicle_part("McLarenF1RearWindshield3", 10),
    vehicle_part("McLarenF1Windshield3", 20),
    vehicle_part("McLarenF1SideWindow3", 20),
    vehicle_part("McLarenF1TrunkDoor3", 20),
    vehicle_part("McLarenF1Bull3", 10),
    vehicle_part("McLarenF1WindowArmor3", 10)
}

CContainers.VehicleStorageCytDMstng = {
    vehicle_storage("DeathMustangWheel3", 35, 10, 40, 45),
    vehicle_storage("DMstngContainer", 50, 30, 60, 75),
    vehicle_storage("DeathMustangSeat3", 40, 10, 45, 50)
}

CContainers.VehiclePartsCytDMstng = {
    vehicle_part("DeathMustangDoor3", 10),
    vehicle_part("DeathMustangFrontWindow3", 10),
    vehicle_part("DeathMustangRearWindow3", 10),
    vehicle_part("DeathMustangHood3", 10),
    vehicle_part("DeathMustangRearWindshield3", 10),
    vehicle_part("DeathMustangWindshield3", 10)
}

CContainers.VehiclePartsCytAPCM113A2 = {
    vehicle_part("CM113Bull2", 10)
}

CContainers.VehicleStorageCytAstra89 = {
    vehicle_storage("CytAstra89Wheel1", 35, 10, 40, 45),
    vehicle_storage("CytAstra89Seat1", 40, 10, 45, 50),
    vehicle_storage("CytAstraRoofrack1", 100, 15, 110, 125)
}

CContainers.VehiclePartsCytAstra89 = {
    vehicle_part("CytAstra89TR1", 10),
    vehicle_part("CytAstra89Bull1", 10),
    vehicle_part("CytAstra89Roof1", 10),
    vehicle_part("CytAstra89WindowArmor1", 10),
    vehicle_part("CytAstra89WindshieldBars1", 10),
    vehicle_part("CytAstra89Door1", 10),
    vehicle_part("CytAstra89DoorArmor1", 10),
    vehicle_part("CytAstra89Window1", 10),
    vehicle_part("CytAstra89WindowBack1", 10),
    vehicle_part("CytAstra89WindowBackArmor1", 10),
    vehicle_part("CytAstra89Hood1", 10),
    vehicle_part("CytAstra89TrunkDoor1", 10),
    vehicle_part("CytAstra89RearWindow1", 10),
    vehicle_part("CytAstra89Windshield1", 10),
    vehicle_part("CytAstra89Muffler1", 10),
    vehicle_part("McLarenF1WindowArmor3", 10),
    vehicle_part("McLarenF1WindowArmor3", 10),
    vehicle_part("McLarenF1WindowArmor3", 10),
    vehicle_part("McLarenF1WindowArmor3", 10)
}

CContainers.VehicleStorageCytMercEvo = {
    vehicle_storage("CytMercEvoWheel3", 35, 10, 40, 45),
    vehicle_storage("CytMercEvoSeat3", 40, 10, 45, 50)
}

CContainers.VehiclePartsCytMercEvo = {
    vehicle_part("CytMercEvoBull3", 10),
    vehicle_part("CytMercEvoWindowArmor3", 10),
    vehicle_part("CytMercEvoWindshieldBars3", 10),
    vehicle_part("CytMercEvoDoor3", 10),
    vehicle_part("CytMercEvoWindow3", 10),
    vehicle_part("CytMercEvoWindowBack3", 10),
    vehicle_part("CytMercEvoWindowBackArmor3", 10),
    vehicle_part("CytMercEvoHood3", 10),
    vehicle_part("CytMercEvoTrunkDoor3", 10),
    vehicle_part("CytMercEvoRearWindow3", 10),
    vehicle_part("CytMercEvoRearWindArmor3", 10),
    vehicle_part("CytMercEvoWindshield3", 10),
    vehicle_part("CytMercEvoMuffler3", 10)
}

CContainers.VehicleStorageKI563Type2Van = {
    vehicle_storage("63beetleTire", 35, 13, 45, 65),
    vehicle_storage("63Type2VanTireOffroad", 35, 15, 45, 65),
    vehicle_storage("63Type2VanTrunkS1", 50, 1, 65, 75),
    vehicle_storage("63Type2VanTrunkM1", 65, 1, 75, 85),
    vehicle_storage("63Type2VanTrunkL1", 80, 1, 90, 100),
    vehicle_storage("63Type2VanToolbox1", 15, 1, 25, 35),
    vehicle_storage("63Type2VanRoofrackSmall1", 30, 8, 40, 50),
    vehicle_storage("63Type2VanRoofrackLarge1", 60, 16, 70, 80),
    vehicle_storage("63beetleFrontSeat1", 20, 15, 25, 35),
    vehicle_storage("63beetleRearSeat1", 20, 15, 25, 35)
}

CContainers.VehiclePartsKI563Type2Van = {
    vehicle_part("63Type2VanSidesteps0", 8),
    vehicle_part("63Type2VanMudflaps0", 3),
    vehicle_part("63Type2VanHeadlightGuard0", 1),
    vehicle_part("63Type2VanTarpCover0", 20),
    vehicle_part("63Type2VanFrontDoor1", 8),
    vehicle_part("63Type2VanRearDoor1", 8),
    vehicle_part("63Type2VanRearSplitDoor1", 12),
    vehicle_part("63Type2VanFrontWindowArmor", 14),
    vehicle_part("63Type2VanRearWindowArmor", 13),
    vehicle_part("63Type2VanDoubleRearWindowArmor", 13),
    vehicle_part("63Type2VanWindshieldArmor", 18),
    vehicle_part("63Type2VanWindshieldRearArmor", 10),
    vehicle_part("63Type2VanEngineDoor1", 10),
    vehicle_part("63Type2VanTrunkDoor1", 10),
    vehicle_part("63Type2VanTruckBedLid1", 10),
    vehicle_part("63Type2VanBumperFront0", 10),
    vehicle_part("63Type2VanBumperFront1", 10),
    vehicle_part("63Type2VanBullbarFrontA", 10),
    vehicle_part("63Type2VanBumperRear0", 10),
    vehicle_part("63Type2VanBumperRear1", 10),
    vehicle_part("63Type2VanCageRear1", 10),
    vehicle_part("63Type2VanWindshield1", 8),
    vehicle_part("63Type2VanFrontSideWindow1", 4),
    vehicle_part("63Type2VanRearSideWindow1", 4),
    vehicle_part("63Type2VanRearDoubleWindow1", 4),
    vehicle_part("63Type2VanWindshieldRear1", 3)
}

CContainers.VehiclePartsKI587toyotaMR2 = {
    vehicle_part("87toyotaMR2Door3", 10),
    vehicle_part("87toyotaMR2WindshieldArmor", 15),
    vehicle_part("87toyotaMR2WindowArmor", 8),
    vehicle_part("87toyotaMR2WindshieldRearArmor", 13),
    vehicle_part("87toyotaMR2EngineDoor3", 13),
    vehicle_part("87toyotaMR2FrontTrunkDoor3", 10),
    vehicle_part("87toyotaMR2RearTrunkDoor3", 10),
    vehicle_part("87toyotaMR2BumperFront0", 10),
    vehicle_part("87toyotaMR2BumperFrontA", 10),
    vehicle_part("87toyotaMR2BullbarFrontA", 10),
    vehicle_part("87toyotaMR2BumperRear0", 10),
    vehicle_part("87toyotaMR2Windshield3", 9),
    vehicle_part("87toyotaMR2FrontSideWindow3", 3),
    vehicle_part("87toyotaMR2RearSideWindow3", 3),
    vehicle_part("87toyotaMR2RearWindshield3", 10),
    vehicle_part("87toyotaMR2Sunroof3", 3),
    vehicle_part("87toyotaMR2RemovableRoof3", 8),
    vehicle_part("87toyotaMR2Spoiler3", 10),
    vehicle_part("87toyotaMR2RoofSpoiler3", 10),
    vehicle_part("87toyotaMR2Sideskirts3", 10),
    vehicle_part("87toyotaMR2PopupLights3", 4),
    vehicle_part("87toyotaMR2Mudflaps3", 4)
}

CContainers.VehiclePartsKI593fordF350 = {
    vehicle_part("93fordF350FrontDoor2", 11),
    vehicle_part("93fordF350RearDoor2", 9),
    vehicle_part("93fordF350FrontWindowArmor", 11),
    vehicle_part("93fordF350RearWindowArmor", 10),
    vehicle_part("93fordF350WindshieldArmor", 19),
    vehicle_part("93fordF350EngineDoor2", 14),
    vehicle_part("93fordF350TrunkDoor2", 15),
    vehicle_part("93fordF350BumperFront0", 8),
    vehicle_part("93fordF350BullbarFrontA", 17),
    vehicle_part("93fordF350BumperRear0", 9),
    vehicle_part("93fordF350Windshield2", 9),
    vehicle_part("93fordF350FrontSideWindow2", 4),
    vehicle_part("93fordF350RearSideWindow2", 3),
    vehicle_part("93fordF350RearWindshield2", 7),
    vehicle_part("93fordF350Mudflaps2", 1),
    vehicle_part("93fordF350SideSteps2", 2),
    vehicle_part("93fordF350SideStepsLong2", 10),
    vehicle_part("93fordF350RoofLights2", 1),
    vehicle_part("93fordF350utilityWindshieldRearArmor", 11),
    vehicle_part("93fordF350utilityTrunkDoor2", 10),
    vehicle_part("93fordF350utilityStorageLids2", 14),
    vehicle_part("93fordF350utilityBumperRear1", 12),
    vehicle_part("93fordF350BumperFrontC", 10),
    vehicle_part("93fordF350BumperFrontB", 13),
    vehicle_part("93fordF350BedCover2", 2),
    vehicle_part("93fordF150SideStepsLong2", 10),
    vehicle_part("93fordF150SideSteps2", 2)
}

CContainers.VehiclePartsKI593fordTaurus = {
    vehicle_part("93fordTaurusFrontDoor1", 10),
    vehicle_part("93fordTaurusRearDoor1", 9),
    vehicle_part("93fordTaurusWindshieldArmor", 14),
    vehicle_part("93fordTaurusFrontWindowArmor", 8),
    vehicle_part("93fordTaurusRearWindowArmor", 9),
    vehicle_part("93fordTaurusWagonBackWindowArmor", 10),
    vehicle_part("93fordTaurusSedanWindshieldRearArmor", 11),
    vehicle_part("93fordTaurusWagonWindshieldRearArmor", 12),
    vehicle_part("93fordTaurusEngineDoor1", 14),
    vehicle_part("93fordTaurusSedanTrunkDoor1", 8),
    vehicle_part("93fordTaurusWagonTrunkDoor1", 13),
    vehicle_part("93fordTaurusBumperFront1", 10),
    vehicle_part("93fordTaurusBumperFrontA", 10),
    vehicle_part("93fordTaurusSHOBumperFront1", 10),
    vehicle_part("93fordTaurusSHOBumperFrontA", 10),
    vehicle_part("93fordTaurusBullbarFrontA", 15),
    vehicle_part("93fordTaurusSedanBumperRear1", 12),
    vehicle_part("93fordTaurusSHOBumperRear1", 12),
    vehicle_part("93fordTaurusWagonBumperRear1", 12),
    vehicle_part("93fordTaurusWindshield1", 9),
    vehicle_part("93fordTaurusFrontSideWindow1", 3),
    vehicle_part("93fordTaurusRearSideWindow1", 3),
    vehicle_part("93fordTaurusWagonBackSideWindow1", 5),
    vehicle_part("93fordTaurusSedanRearWindshield1", 10),
    vehicle_part("93fordTaurusWagonRearWindshield1", 10),
    vehicle_part("93fordTaurusSHOSpoiler1", 2)
}

CContainers.VehiclePartsKI587fordB700 = {
    vehicle_part("87fordB700DoubleDoors2", 11),
    vehicle_part("87fordB700RearDoor2", 7),
    vehicle_part("87fordB700SideArmor", 3),
    vehicle_part("87fordB700SideArmorPrison", 2.5),
    vehicle_part("87fordB700DoubleDoorArmor", 11),
    vehicle_part("87fordB700WindshieldArmor", 12),
    vehicle_part("87fordB700LargeSideArmor", 18),
    vehicle_part("87fordB700LargeSideArmorPrison", 16),
    vehicle_part("87fordB700RearArmor", 12),
    vehicle_part("87fordB700EngineDoor2", 14),
    vehicle_part("87fordB700StorageLid2", 1),
    vehicle_part("87fordB700BumperFront0", 10),
    vehicle_part("87fordB700BumperFrontA", 12),
    vehicle_part("87fordB700BullbarFrontA", 20),
    vehicle_part("87fordB700BumperRear0", 9),
    vehicle_part("87fordB700Windshield2", 9),
    vehicle_part("87fordB700SideWindow2", 2),
    vehicle_part("87fordB700SideWindows2", 12),
    vehicle_part("87fordB700StopSign2", 1),
    vehicle_part("87fordF700WindshieldRear2", 7),
    vehicle_part("87fordF700WindshieldArmor", 10),
    vehicle_part("87fordF700Windshield2", 8),
    vehicle_part("87fordF700WindowFrontArmor", 8),
    vehicle_part("87fordF700StorageLid2", 1),
    vehicle_part("87fordF700RoofLights2", 1),
    vehicle_part("87fordF700RollTrunkDoor2", 10),
    vehicle_part("87fordF700MudflapsSmall2", 2),
    vehicle_part("87fordF700MudflapsLarge2", 3),
    vehicle_part("87fordF700FrontSideWindow2", 3),
    vehicle_part("87fordF700FrontDoor2", 15),
    vehicle_part("87fordF700BumperRear2", 0.1),
    vehicle_part("87fordF700BumperRear1", 10),
    vehicle_part("87fordF700BumperRear0", 8),
    vehicle_part("87fordF700BumperFront0", 10),
    vehicle_part("87fordF700BullbarFrontA", 20),
    vehicle_part("87fordF700ArmoredWindshieldRear2", 6),
    vehicle_part("87fordF700ArmoredWindshield2", 14),
    vehicle_part("87fordF700ArmoredTrunkDoor2", 18),
    vehicle_part("87fordF700ArmoredSmallWindow2", 3),
    vehicle_part("87fordF700ArmoredRearSideWindow2", 7),
    vehicle_part("87fordF700ArmoredRearDoor2", 16),
    vehicle_part("87fordF700ArmoredFrontSideWindow2", 8),
    vehicle_part("87fordF700ArmoredFrontDoor2", 15),
    vehicle_part("87fordB700WindshieldRear2", 12)
}

CContainers.VehiclePartsKI590bmwE30 = {
    vehicle_part("90bmwE30SedanFrontDoor3", 10),
    vehicle_part("90bmwE30CabrioFrontDoor3", 12),
    vehicle_part("90bmwE30SedanRearDoor3", 9),
    vehicle_part("90bmwE30TouringRearDoor3", 10),
    vehicle_part("90bmwE30WindshieldArmor", 14),
    vehicle_part("90bmwE30FrontWindowArmor", 8),
    vehicle_part("90bmwE30CabrioWindowArmor", 8),
    vehicle_part("90bmwE30SedanRearWindowArmor", 9),
    vehicle_part("90bmwE30TouringRearWindowArmor", 9),
    vehicle_part("90bmwE30TouringBackWindowArmor", 9),
    vehicle_part("90bmwE30WindshieldRearArmor", 12),
    vehicle_part("90bmwE30EngineDoor3", 12),
    vehicle_part("90bmwE30SedanTrunkDoor3", 8),
    vehicle_part("90bmwE30m3TrunkDoor3", 9),
    vehicle_part("90bmwE30TouringTrunkDoor3", 12),
    vehicle_part("90bmwE30CabrioRoofLid3", 6),
    vehicle_part("90bmwE30BumperFront", 10),
    vehicle_part("90bmwE30BumperFrontA", 15),
    vehicle_part("90bmwE30Bullbar", 14),
    vehicle_part("90bmwE30BumperFrontM", 9),
    vehicle_part("90bmwE30BumperFrontMA", 15),
    vehicle_part("90bmwE30BumperRear", 9),
    vehicle_part("90bmwE30BumperRearM", 8),
    vehicle_part("90bmwE30Windshield3", 9),
    vehicle_part("90bmwE30FrontSideWindow3", 3),
    vehicle_part("90bmwE30CabrioSideWindows3", 3),
    vehicle_part("90bmwE30SedanRearSideWindow3", 3),
    vehicle_part("90bmwE30TouringBackSideWindow3", 5),
    vehicle_part("90bmwE30RearWindshield3", 10),
    vehicle_part("90bmwE30m3Spoiler3", 4),
    vehicle_part("90bmwE30sedanSpoilerLip3", 1),
    vehicle_part("90bmwE30sedanSpoilerMT3", 3),
    vehicle_part("90bmwE30CabrioRoof3", 10),
    vehicle_part("90bmwE30TouringRearSideWindow3", 3)
}

CContainers.VehicleStorage87fordB700 = {
    vehicle_storage("87fordF700Seat2", 20, 10, 25, 30),
    vehicle_storage("87fordF700GasTank2", 200, 10, 220, 250),
    vehicle_storage("87fordB700Tire2", 35, 10, 40, 45),
    vehicle_storage("87fordB700Seat2", 10, 6, 12, 15),
    vehicle_storage("87fordB700Roofrack2", 100, 15, 110, 120),
    vehicle_storage("87fordB700RearSeat2", 10, 0.1, 12, 15),
    vehicle_storage("87fordB700DoubleTires2", 35, 16, 40, 45)
}

CContainers.VehicleStorage87toyotaMR2 = {
    vehicle_storage("87toyotaMR2TireT23", 35, 15, 40, 45),
    vehicle_storage("87toyotaMR2TireT13", 35, 15, 40, 45),
    vehicle_storage("87toyotaMR2Seat3", 20, 15, 25, 30),
    vehicle_storage("87toyotaMR2Roofrack3", 40, 10, 45, 50)
}

CContainers.VehicleStorage90bmwE30 = {
    vehicle_storage("90bmwE30mTire3", 35, 11, 40, 45),
    vehicle_storage("90bmwE30Tire3", 35, 13, 40, 45),
    vehicle_storage("90bmwE30SeatRear3", 20, 13, 25, 30),
    vehicle_storage("90bmwE30SeatFront3", 20, 14, 25, 30),
    vehicle_storage("90bmwE30Roofrack3", 50, 14, 60, 70)
}

CContainers.VehicleStorage93fordF350 = {
    vehicle_storage("93fordF350Toolbox2", 25, 18, 30, 35),
    vehicle_storage("93fordF350Tire2", 35, 14, 40, 45),
    vehicle_storage("93fordF350SeatRear2", 25, 16, 30, 35),
    vehicle_storage("93fordF350SeatFront2", 25, 14, 30, 35),
    vehicle_storage("93fordF350DoubleTires2", 35, 25, 40, 45)
}

CContainers.VehicleStorage93fordTaurus = {
    vehicle_storage("93fordTaurusWagonRoofrack1", 55, 14, 65, 75),
    vehicle_storage("93fordTaurusTire1", 35, 14, 40, 45),
    vehicle_storage("93fordTaurusSeatRear1", 30, 18, 35, 40),
    vehicle_storage("93fordTaurusSeatFront1", 30, 18, 35, 40),
    vehicle_storage("93fordTaurusSHOTire3", 35, 15, 40, 45),
    vehicle_storage("93fordTaurusRoofrack1", 50, 14, 55, 60)
}

CContainers.VehicleStoragedamnlib = {
    vehicle_storage("fordCVPITire1", 35, 15, 40, 45),
    vehicle_storage("damnCraft.Trunk3", 25, 1, 30, 35),
    vehicle_storage("damnCraft.Trunk2", 25, 1, 30, 35),
    vehicle_storage("damnCraft.Trunk1", 25, 1, 30, 35),
    vehicle_storage("USMIL.Stretcher1", 20, 14, 25, 30),
    vehicle_storage("USMIL.Stretcher0", 10, 8, 12, 15),
    vehicle_storage("damnCraft.SteelTire1", 35, 14, 40, 45),
    vehicle_storage("damnCraft.SmallTire2", 35, 12, 40, 45),
    vehicle_storage("damnCraft.SmallTire1", 35, 10, 40, 45),
    vehicle_storage("runFlat.SmallTire", 35, 13, 40, 45),
    vehicle_storage("USMIL.Seat2", 5, 5, 6, 8),
    vehicle_storage("USMIL.Seat1rear", 14, 7, 16, 18),
    vehicle_storage("USMIL.Seat1front", 14, 7, 16, 18),
    vehicle_storage("USMIL.Seat0", 20, 8, 25, 30),
    vehicle_storage("PickupLargeRoofrack2", 100, 20, 110, 125),
    vehicle_storage("OldSmallRoofrack3", 55, 11, 65, 75),
    vehicle_storage("runFlat.ModernTire", 35, 14, 40, 45),
    vehicle_storage("ModernSmallRoofrack3", 62, 12, 66, 72),
    vehicle_storage("ModernLargeRoofrack3", 81, 15, 85, 92),
    vehicle_storage("runFlat.MediumTire", 35, 14, 40, 45),
    vehicle_storage("runFlat.Medium4TireAxle", 35, 30, 40, 45),
    vehicle_storage("runFlat.LargeTire", 35, 15, 40, 45),
    vehicle_storage("runFlat.LargeDoubleTires", 35, 18, 40, 45),
    vehicle_storage("runFlat.Large4TireAxle", 35, 30, 40, 45),
    vehicle_storage("runFlat.Large2TireAxle", 35, 25, 40, 45),
    vehicle_storage("DodgeRTtire3", 35, 10, 40, 45),
    vehicle_storage("CamaroSStire3", 35, 10, 40, 45),
    vehicle_storage("CUDAtire3", 35, 10, 40, 45),
    vehicle_storage("92jeepYJTire2", 35, 15, 40, 45),
    vehicle_storage("90chevyCKseriesTire2", 35, 15, 40, 45),
    vehicle_storage("90chevyCKseriesTire1", 35, 14, 40, 45),
    vehicle_storage("8thGenFordFseriesSeatFront2", 25, 14, 30, 35),
    vehicle_storage("86chevyCUCVTire2", 35, 15, 40, 45),
    vehicle_storage("86chevyCUCVTire1", 35, 13, 40, 45),
    vehicle_storage("86chevyCUCVDoubleTires2", 35, 24, 40, 45),
    vehicle_storage("85gmBbodyTire6", 35, 15, 40, 45),
    vehicle_storage("85gmBbodyTire5", 35, 13, 40, 45),
    vehicle_storage("85gmBbodyTire4", 35, 14, 40, 45),
    vehicle_storage("85gmBbodyTire3", 35, 14, 40, 45),
    vehicle_storage("85gmBbodyTire2", 35, 15, 40, 45),
    vehicle_storage("85gmBbodyTire1", 35, 15, 40, 45),
    vehicle_storage("85gmBbodyTire0", 35, 15, 40, 45),
    vehicle_storage("85gmBbodyRoofrack1", 60, 14, 70, 80),
    vehicle_storage("84jeepXJTire2", 35, 15, 40, 45),
    vehicle_storage("80sPickupSeatRear2", 25, 11, 30, 35),
    vehicle_storage("80sPickupSeatFront2", 25, 15, 30, 35),
    vehicle_storage("80sPickupRoofrackA", 65, 15, 75, 85),
    vehicle_storage("80sOffroadTireA", 35, 16, 40, 45),
    vehicle_storage("80chevyCKseriesTire2", 35, 15, 40, 45),
    vehicle_storage("80chevyCKseriesTire1", 35, 14, 40, 45),
    vehicle_storage("76chevyKseriesTire2", 35, 15, 40, 45),
    vehicle_storage("75grandPrixR217Tire3", 35, 12, 40, 45),
    vehicle_storage("75grandPrixR215Tire1", 35, 13, 40, 45)
}

CContainers.VehiclePartsdamnlib = {
    vehicle_part("3rdGenChevyCKseriesWindshield2", 9),
    vehicle_part("3rdGenChevyCKseriesSunVisor2", 6),
    vehicle_part("3rdGenChevyCKseriesSideSteps2", 3),
    vehicle_part("3rdGenChevyCKseriesRearWindshield2", 7),
    vehicle_part("3rdGenChevyCKseriesRearSideWindow2", 4),
    vehicle_part("3rdGenChevyCKseriesRearDoor2", 10),
    vehicle_part("3rdGenChevyCKseriesFrontSideWindow2", 4),
    vehicle_part("3rdGenChevyCKseriesFrontDoor2", 13),
    vehicle_part("3rdGenChevyCKseriesBumperRear0", 8),
    vehicle_part("3rdGenChevyCKseriesBumperFront1", 8.5),
    vehicle_part("3rdGenChevyCKseriesBumperFront0", 8),
    vehicle_part("3rdGenChevyCKseriesBackSideWindow2", 6),
    vehicle_part("80chevyCKWindshield2", 9),
    vehicle_part("80chevyCKSideSteps2", 3),
    vehicle_part("80chevyCKRearWindshield2", 6),
    vehicle_part("80chevyCKFrontSideWindow2", 4),
    vehicle_part("80chevyCKFrontDoor2", 11),
    vehicle_part("80chevyCKEngineDoor2", 13),
    vehicle_part("80chevyCKBumperRear0", 8),
    vehicle_part("80chevyCKBumperFront1", 8.5),
    vehicle_part("80chevyCKBumperFront0", 8),
    vehicle_part("80chevyCKBackSideWindow2", 6.5),
    vehicle_part("86chevyCUCVBullbarFrontA", 12),
    vehicle_part("85gmBbodyWindshieldRearArmorW", 7),
    vehicle_part("85gmBbodyWindshieldRearArmorM", 12),
    vehicle_part("85gmBbodyWindshieldArmorW", 9),
    vehicle_part("85gmBbodyWindshieldArmorM", 14),
    vehicle_part("85gmBbodyWindshield1", 9),
    vehicle_part("85gmBbodyVinylRoofWhite", 6),
    vehicle_part("85gmBbodyVinylRoofMaroon", 6),
    vehicle_part("85gmBbodyVinylRoofBrown", 6),
    vehicle_part("85gmBbodyVinylRoofBlue", 6),
    vehicle_part("85gmBbodyVinylRoofBlack", 6),
    vehicle_part("85gmBbodyRearWindshield1", 10),
    vehicle_part("85gmBbodyRearWindowArmorW", 5),
    vehicle_part("85gmBbodyRearWindowArmorM", 10),
    vehicle_part("85gmBbodyRearSideWindow1", 3),
    vehicle_part("85gmBbodyRearDoor1", 11),
    vehicle_part("85gmBbodyFrontWindowArmorW", 4),
    vehicle_part("85gmBbodyFrontWindowArmorM", 8),
    vehicle_part("85gmBbodyFrontSideWindow1", 3),
    vehicle_part("85gmBbodyFrontDoor1", 10),
    vehicle_part("85gmBbodyBullbarFrontA", 11),
    vehicle_part("80chevySunVisor2", 6),
    vehicle_part("utilityBoxWindshieldRearArmor", 11),
    vehicle_part("utilityBoxTrunkDoor2", 10),
    vehicle_part("utilityBoxStorageLids2", 14),
    vehicle_part("utilityBoxBumperRear2", 12),
    vehicle_part("damnCraft.leafSuspension2", 8),
    vehicle_part("fordCVPIpoliceSearchlight", 1),
    vehicle_part("fordCVPIWindshieldRearArmor", 18),
    vehicle_part("fordCVPIWindshieldArmor", 15),
    vehicle_part("fordCVPIRearWindowArmor", 7),
    vehicle_part("fordCVPIFrontWindowArmor", 8),
    vehicle_part("damnCraft.dontusethis", 1),
    vehicle_part("damnCraft.TireRubberUsedSmall", 3.3),
    vehicle_part("damnCraft.TireRubberUsedLarge", 4.3),
    vehicle_part("damnCraft.TireRubberNewSmall", 3.5),
    vehicle_part("damnCraft.TireRubberNewLarge", 4.5),
    vehicle_part("damnCraft.TireRubberMountedSmall", 4.5),
    vehicle_part("damnCraft.TireRubberMountedLarge", 6),
    vehicle_part("damnCraft.TireRubberDestroyedSmall", 2.9),
    vehicle_part("damnCraft.TireRubberDestroyedLarge", 3.9),
    vehicle_part("damnCraft.SteelRimSmall", 7),
    vehicle_part("damnCraft.SteelRimMedium", 9),
    vehicle_part("damnCraft.SteelRimLarge", 11),
    vehicle_part("USMIL.SmallViewportPack0", 5),
    vehicle_part("USMIL.SmallViewport0", 2),
    vehicle_part("damnCraft.SeatFrameSmall", 2.4),
    vehicle_part("damnCraft.SeatFrameLarge", 4.2),
    vehicle_part("damnCraft.SeatFoam", 0.9),
    vehicle_part("damnCraft.SeatFabric", 2.1),
    vehicle_part("damnCraft.RubberStrip", 0.9),
    vehicle_part("M101TrunkDoor2", 9),
    vehicle_part("USMIL.LargeViewportPack0", 10),
    vehicle_part("USMIL.LargeViewport0", 4),
    vehicle_part("KI5trailersTarp2", 4),
    vehicle_part("damnCraft.HingeSmall", 1),
    vehicle_part("damnCraft.HingeLarge", 1.4),
    vehicle_part("damnCraft.HandleModern", 1.3),
    vehicle_part("damnCraft.HandleClassic", 1),
    vehicle_part("8thGenFordFseriesWindshield2", 9),
    vehicle_part("8thGenFordFseriesWindowFrontSide2", 4),
    vehicle_part("8thGenFordFseriesFrontDoor2", 10),
    vehicle_part("8thGenFordFseriesEngineDoor2", 15)
}

CContainers.VehicleParts04vwTouran = {
    vehicle_part("04vwTouranWindshieldRearArmor", 10),
    vehicle_part("04vwTouranWindshieldRear1", 3),
    vehicle_part("04vwTouranWindshieldArmor", 18),
    vehicle_part("04vwTouranWindshield1", 8),
    vehicle_part("04vwTouranTrunkDoor1", 10),
    vehicle_part("04vwTouranRearWindowArmor", 13),
    vehicle_part("04vwTouranRearSideWindow1", 4),
    vehicle_part("04vwTouranRearDoor1", 14),
    vehicle_part("04vwTouranFrontWindowArmor", 14),
    vehicle_part("04vwTouranFrontSideWindow1", 4),
    vehicle_part("04vwTouranFrontDoor1", 13),
    vehicle_part("04vwTouranEngineDoor1", 10),
    vehicle_part("04vwTouranBumperRear0", 10),
    vehicle_part("04vwTouranBumperFrontA", 18),
    vehicle_part("04vwTouranBumperFront0", 8),
    vehicle_part("04vwTouranBullbarFrontA", 10),
    vehicle_part("04vwTouranBackWindowArmor", 13),
    vehicle_part("04vwTouranBackSideWindow1", 4)
}

CContainers.VehicleStorage49ford8N = {
    vehicle_storage("49ford8NSeat2", 5, 4, 6, 7),
    vehicle_storage("49ford8NRearTire2", 35, 25, 40, 45),
    vehicle_storage("49ford8NFrontTire2", 35, 8, 40, 45)
}

CContainers.VehicleParts49ford8N = {
    vehicle_part("49ford8NBumperRear2", 6),
    vehicle_part("49ford8NBumperFront2", 8)
}

CContainers.VehicleStorage66pontiacLeMans = {
    vehicle_storage("66pontiacLeMansSeatRear3", 20, 13, 25, 30),
    vehicle_storage("66pontiacLeMansSeatFront3", 20, 13, 25, 30)
}

CContainers.VehicleParts66pontiacLeMans = {
    vehicle_part("66pontiacLeMansWindshieldRearArmor", 12),
    vehicle_part("66pontiacLeMansWindshieldArmor", 14),
    vehicle_part("66pontiacLeMansWindshield3", 9),
    vehicle_part("66pontiacLeMansTrunkDoor3", 8),
    vehicle_part("66pontiacLeMansRoof0", 19),
    vehicle_part("66pontiacLeMansRearWindshield3", 7),
    vehicle_part("66pontiacLeMansFrontWindowArmor", 8),
    vehicle_part("66pontiacLeMansFrontSideWindow3", 4),
    vehicle_part("66pontiacLeMansFrontDoor3", 10),
    vehicle_part("66pontiacLeMansEngineDoor3", 9),
    vehicle_part("66pontiacLeMansBumperRear", 5),
    vehicle_part("66pontiacLeMansBumperFrontA", 16),
    vehicle_part("66pontiacLeMansBumperFront0", 6),
    vehicle_part("66pontiacLeMansBullbarFrontA", 13),
    vehicle_part("66pontiacGTOEngineDoor3", 8)
}

CContainers.VehicleStorage68firebird = {
    vehicle_storage("68firebirdSeatRear3", 20, 13, 25, 30),
    vehicle_storage("68firebirdSeatFront3", 20, 13, 25, 30)
}

CContainers.VehicleParts68firebird = {
    vehicle_part("68firebirdWindshieldRearArmor", 12),
    vehicle_part("68firebirdWindshieldArmor", 14),
    vehicle_part("68firebirdWindshield3", 9),
    vehicle_part("68firebirdTrunkDoor3", 8),
    vehicle_part("68firebirdSpoilerB3", 1.2),
    vehicle_part("68firebirdSpoilerA3", 1.1),
    vehicle_part("68firebirdRearWindshield3", 7),
    vehicle_part("68firebirdRamAirEngineDoor3", 8),
    vehicle_part("68firebirdRamAirCustomEngineDoor3", 8),
    vehicle_part("68firebirdFrontWindowArmor", 8),
    vehicle_part("68firebirdFrontSplitLip3", 1),
    vehicle_part("68firebirdFrontSideWindow3", 4),
    vehicle_part("68firebirdFrontLip3", 1.3),
    vehicle_part("68firebirdFrontDoor3", 10),
    vehicle_part("68firebirdFoamSeal3", 0.4),
    vehicle_part("68firebirdFoamSeal1", 0.2),
    vehicle_part("68firebirdEngineDoor3", 9),
    vehicle_part("68firebirdBumperRearA", 12),
    vehicle_part("68firebirdBumperRear", 5),
    vehicle_part("68firebirdBumperFrontA", 7),
    vehicle_part("68firebirdBumperFront", 6),
    vehicle_part("68firebirdRearSideWindow3", 1)
}

CContainers.VehicleStorage69mini = {
    vehicle_storage("69miniTirePS1", 35, 15, 40, 45),
    vehicle_storage("69miniTire1", 35, 10, 40, 45),
    vehicle_storage("69miniSeatRear1", 17, 9, 20, 22),
    vehicle_storage("69miniSeatFront1", 15, 8, 18, 20),
    vehicle_storage("69miniRoofrack1", 60, 10, 65, 70),
    vehicle_storage("69miniMrBChair1", 25, 15, 30, 35)
}

CContainers.VehicleParts69mini = {
    vehicle_part("69miniWindshieldRearArmor", 20),
    vehicle_part("69miniWindshieldArmor", 18),
    vehicle_part("69miniWindshield1", 9),
    vehicle_part("69miniTrunkDoor1", 9),
    vehicle_part("69miniSideWindowRear1", 4),
    vehicle_part("69miniSideWindowFront1", 4),
    vehicle_part("69miniRearWindshield1", 7),
    vehicle_part("69miniRearWindowArmor", 12),
    vehicle_part("69miniFrontDoorArmor", 12),
    vehicle_part("69miniFrontDoor1", 10),
    vehicle_part("69miniEngineDoorPitbull1", 12),
    vehicle_part("69miniEngineDoorBelts1", 10),
    vehicle_part("69miniEngineDoor1", 9),
    vehicle_part("69miniBumperRear1", 12),
    vehicle_part("69miniBumperRear0", 10),
    vehicle_part("69miniBumperFront2", 18),
    vehicle_part("69miniBumperFront1", 12),
    vehicle_part("69miniBumperFront0", 10)
}

CContainers.VehicleStorage73fordFalcon = {
    vehicle_storage("73fordFalconTire3", 35, 12, 40, 45),
    vehicle_storage("73fordFalconSeatRear3", 20, 13, 25, 30),
    vehicle_storage("73fordFalconSeatFront3", 20, 13, 25, 30),
    vehicle_storage("73fordFalconPSTire3", 35, 13, 40, 45),
    vehicle_storage("73fordFalconPSStorage", 40, 10, 45, 50)
}

CContainers.VehicleParts73fordFalcon = {
    vehicle_part("73fordFalconWindshieldRearArmor", 12),
    vehicle_part("73fordFalconWindshieldArmor", 14),
    vehicle_part("73fordFalconWindshield3", 9),
    vehicle_part("73fordFalconTrunkDoor3", 8),
    vehicle_part("73fordFalconSpoilerRoof1", 3),
    vehicle_part("73fordFalconSpoiler0", 1.8),
    vehicle_part("73fordFalconRearWindshield3", 7),
    vehicle_part("73fordFalconRearWindowArmor", 5),
    vehicle_part("73fordFalconRearSideWindow3", 4),
    vehicle_part("73fordFalconPSMuffler3", 4),
    vehicle_part("73fordFalconPSEngineDoor3", 8),
    vehicle_part("73fordFalconPSBumperFront1", 6),
    vehicle_part("73fordFalconPSBumperFront0", 8),
    vehicle_part("73fordFalconFrontWindowArmor", 10),
    vehicle_part("73fordFalconFrontSideWindow3", 4),
    vehicle_part("73fordFalconFrontDoor3", 10),
    vehicle_part("73fordFalconEngineDoor3", 9),
    vehicle_part("73fordFalconBumperRear", 5),
    vehicle_part("73fordFalconBumperFrontA", 16),
    vehicle_part("73fordFalconBumperFront0", 6),
    vehicle_part("73fordFalconBullbarFrontA", 13)
}

CContainers.VehicleStorage76chevyKseries = {
    vehicle_storage("76chevyKseriesToolbox2", 30, 8, 35, 40),
    vehicle_storage("76chevyKseriesSeatRear2", 20, 12, 25, 30),
    vehicle_storage("76chevyKseriesSeatFront2", 25, 14, 30, 35),
    vehicle_storage("76chevyKseriesRoofrack2", 65, 13, 70, 75),
    vehicle_storage("76chevyKseriesDoubleTires2", 35, 25, 40, 45)
}

CContainers.VehicleParts76chevyKseries = {
    vehicle_part("76chevyKseriesTrunkDoorFD2", 10),
    vehicle_part("76chevyKseriesTrunkDoor2", 11),
    vehicle_part("76chevyKseriesRoofLights2", 1),
    vehicle_part("76chevyKseriesRollbarSpec2", 11),
    vehicle_part("76chevyKseriesRollbar2", 12),
    vehicle_part("76chevyKseriesRearWindshield2", 7),
    vehicle_part("76chevyKseriesRearWindowArmor", 10),
    vehicle_part("76chevyKseriesLidsFD2", 8),
    vehicle_part("76chevyKseriesFrontWindowArmor", 10),
    vehicle_part("76chevyKseriesFrontSideWindow2", 4),
    vehicle_part("76chevyKseriesFrontDoor2", 13),
    vehicle_part("76chevyKseriesFDMudflaps", 2.4),
    vehicle_part("76chevyKseriesEngineDoor2", 13),
    vehicle_part("76chevyKseriesBumperRearA", 10),
    vehicle_part("76chevyKseriesBumperRear0", 8),
    vehicle_part("76chevyKseriesBumperFront0", 8),
    vehicle_part("76chevyKseriesBullbarFrontB", 10),
    vehicle_part("76chevyKseriesBullbarFrontA", 12),
    vehicle_part("76chevyK20OpenBedCap2", 10),
    vehicle_part("76chevyK20BedCap2", 18),
    vehicle_part("76chevyK10OpenBedCap2", 12),
    vehicle_part("76chevyK10BedCap2", 15),
    vehicle_part("76chevyKseriesWindshieldArmor", 16),
    vehicle_part("76chevyKseriesWindshield2", 9)
}

CContainers.VehicleStorage75grandPrix = {
    vehicle_storage("75grandPrixH17Tire3", 35, 11, 40, 50),
    vehicle_storage("75grandPrixSeatRear3", 20, 13, 25, 30),
    vehicle_storage("75grandPrixSeatFront3", 20, 14, 25, 30),
    vehicle_storage("75grandPrixRoofrack3", 50, 14, 55, 60)
}

CContainers.VehicleParts75grandPrix = {
    vehicle_part("75grandPrixWindshieldRearArmor", 12),
    vehicle_part("75grandPrixWindshieldArmor", 14),
    vehicle_part("75grandPrixRearWindowArmor", 9),
    vehicle_part("75grandPrixFrontWindowArmor", 8),
    vehicle_part("75grandPrixBumperRear", 9),
    vehicle_part("75grandPrixBumperFrontA", 15),
    vehicle_part("75grandPrixBumperFront", 10),
    vehicle_part("75grandPrixBullbar", 14),
    vehicle_part("75grandPrixWindshield3", 9),
    vehicle_part("75grandPrixTrunkDoor3", 8),
    vehicle_part("75grandPrixRearWindshield3", 10),
    vehicle_part("75grandPrixRearSideWindow3", 3),
    vehicle_part("75grandPrixFrontSideWindow3", 3),
    vehicle_part("75grandPrixFrontDoor3", 10),
    vehicle_part("75grandPrixEngineDoor3", 12),
    vehicle_part("75grandPrixCordovaTypeB3", 10),
    vehicle_part("75grandPrixCordovaTypeA3", 10)
}

CContainers.VehicleStorage77firebird = {
    vehicle_storage("77firebirdTire3", 35, 12, 40, 50),
    vehicle_storage("77firebirdSeatRear3", 20, 13, 25, 35),
    vehicle_storage("77firebirdSeatFront3", 20, 13, 25, 35),
    vehicle_storage("77firebirdTATire3", 35, 11, 40, 45)
}

CContainers.VehicleParts77firebird = {
    vehicle_part("77firebirdWindshieldRearArmor", 12),
    vehicle_part("77firebirdWindshieldArmor", 13),
    vehicle_part("77firebirdWindshield3", 9),
    vehicle_part("77firebirdTrunkDoor3", 8),
    vehicle_part("77firebirdSpoiler", 2.3),
    vehicle_part("77firebirdRoofPanels3", 7),
    vehicle_part("77firebirdRearWindshield3", 10),
    vehicle_part("77firebirdFrontWindowArmor", 7),
    vehicle_part("77firebirdFrontSideWindow3", 4),
    vehicle_part("77firebirdFrontDoor3", 10),
    vehicle_part("77firebirdEngineDoorTA3", 8),
    vehicle_part("77firebirdEngineDoorFR3", 10),
    vehicle_part("77firebirdEngineDoor3", 9),
    vehicle_part("77firebirdBumperRear", 10),
    vehicle_part("77firebirdBumperFrontA", 12),
    vehicle_part("77firebirdBumperFront0", 9),
    vehicle_part("77firebirdBullbarFrontA", 18)
}

CContainers.VehicleStorage80manKat1 = {
    vehicle_storage("80manKat1Trunk2", 645, 1, 670, 700),
    vehicle_storage("80manKat1Storage2", 28, 1, 32, 36),
    vehicle_storage("80manKat1Roofrack2", 100, 20, 110, 125)
}

CContainers.VehicleParts80manKat1 = {
    vehicle_part("80manKat1WindshieldArmor", 16),
    vehicle_part("80manKat1Windshield2", 9),
    vehicle_part("80manKat1TrunkDoor2", 11),
    vehicle_part("80manKat1Tarp2", 20),
    vehicle_part("80manKat1StorageDoor2", 11),
    vehicle_part("80manKat1Muffler2", 4),
    vehicle_part("80manKat1Mudflaps2", 3),
    vehicle_part("80manKat1LightGuards2", 30),
    vehicle_part("80manKat1FrontWindowArmor", 10),
    vehicle_part("80manKat1FrontSideWindow2", 4),
    vehicle_part("80manKat1FrontDoor2", 13),
    vehicle_part("80manKat1EngineDoor2", 13),
    vehicle_part("80manKat1BumperFrontA", 20),
    vehicle_part("80manKat1BumperFront0", 8),
    vehicle_part("80manKat1BullbarFrontA", 12)
}

CContainers.VehicleStorage81deloreanDMC12 = {
    vehicle_storage("81deloreanDMC12Tire3", 35, 12, 40, 45),
    vehicle_storage("81deloreanDMC12SeatFront3", 20, 14, 25, 30)
}

CContainers.VehicleParts81deloreanDMC12 = {
    vehicle_part("81deloreanDMC12WindshieldArmor", 14),
    vehicle_part("81deloreanDMC12Windshield3", 9),
    vehicle_part("81deloreanDMC12TrunkDoor3", 7),
    vehicle_part("81deloreanDMC12RearWindshield3", 3),
    vehicle_part("81deloreanDMC12RearWindowArmor", 7),
    vehicle_part("81deloreanDMC12RearSideWindow3", 4),
    vehicle_part("81deloreanDMC12RearCover", 7),
    vehicle_part("81deloreanDMC12FrontWindowArmor", 8),
    vehicle_part("81deloreanDMC12FrontSideWindow3", 5),
    vehicle_part("81deloreanDMC12FrontDoor3", 15),
    vehicle_part("81deloreanDMC12EngineDoor3", 8),
    vehicle_part("81deloreanDMC12BumperRear", 3),
    vehicle_part("81deloreanDMC12BumperFrontA", 15),
    vehicle_part("81deloreanDMC12BumperFront", 3),
    vehicle_part("81deloreanDMC12Bullbar", 12)
}

CContainers.VehicleStorage82firebird = {
    vehicle_storage("82firebirdTire3", 35, 12, 40, 50),
    vehicle_storage("82firebirdSeatRear3", 20, 13, 25, 35),
    vehicle_storage("82firebirdSeatFront3", 20, 13, 25, 35)
}

CContainers.VehicleParts82firebird = {
    vehicle_part("82firebirdWindshieldRearArmor", 12),
    vehicle_part("82firebirdWindshieldArmor", 14),
    vehicle_part("82firebirdWindshield3", 9),
    vehicle_part("82firebirdTrunkDoor3", 8),
    vehicle_part("82firebirdSpoilerB", 1.2),
    vehicle_part("82firebirdSpoilerA", 2.3),
    vehicle_part("82firebirdRearWindshield3", 10),
    vehicle_part("82firebirdRearRoofPanels3", 7),
    vehicle_part("82firebirdPopupLights3", 4),
    vehicle_part("82firebirdFrontWindowArmor", 8),
    vehicle_part("82firebirdFrontSideWindow3", 4),
    vehicle_part("82firebirdFrontDoor3", 10),
    vehicle_part("82firebirdEngineDoor3", 9),
    vehicle_part("82firebirdBumperRear", 10),
    vehicle_part("82firebirdBumperFrontA", 18),
    vehicle_part("82firebirdBumperFront1", 11),
    vehicle_part("82firebirdBumperFront0", 9)
}

CContainers.VehicleStorage82porsche911 = {
    vehicle_storage("82porsche911TurboTire", 35, 13, 40, 45),
    vehicle_storage("82porsche911RWBTire", 35, 15, 40, 45),
    vehicle_storage("82porsche911FrontSeat3", 20, 13, 25, 30)
}

CContainers.VehicleParts82porsche911 = {
    vehicle_part("82porsche911turboEngineDoor3", 12),
    vehicle_part("82porsche911turboBumperRear0", 9),
    vehicle_part("82porsche911turboBumperFrontA", 15),
    vehicle_part("82porsche911turboBumperFront0", 9),
    vehicle_part("82porsche911WindshieldRearArmor", 10),
    vehicle_part("82porsche911WindshieldRear3", 3),
    vehicle_part("82porsche911WindshieldArmor", 18),
    vehicle_part("82porsche911Windshield3", 8),
    vehicle_part("82porsche911TrunkDoor3", 10),
    vehicle_part("82porsche911RearWindowArmor", 13),
    vehicle_part("82porsche911RearSideWindow3", 4),
    vehicle_part("82porsche911RWBSpoiler0", 10),
    vehicle_part("82porsche911RWBEngineDoor3", 13),
    vehicle_part("82porsche911RWBBumperRear1", 9),
    vehicle_part("82porsche911RWBBumperFrontA", 9),
    vehicle_part("82porsche911RWBBumperFront1", 9),
    vehicle_part("82porsche911FrontWindowArmor", 14),
    vehicle_part("82porsche911FrontSideWindow3", 4),
    vehicle_part("82porsche911Door3", 11),
    vehicle_part("82porsche911BullbarFrontA", 10)
}

CContainers.VehicleStorage84gageV300 = {
    vehicle_storage("V300Trunk2", 205, 0.1, 215, 230),
    vehicle_storage("V300Netting2", 50, 0.1, 55, 60),
    vehicle_storage("RoofCrateStorage2", 30, 15, 35, 40)
}

CContainers.VehicleParts84gageV300 = {
    vehicle_part("V300rearLightGuards2", 2),
    vehicle_part("V300frontLightGuards2", 2),
    vehicle_part("V300TurretHatchLid2", 5),
    vehicle_part("V300RearHatchLid2", 25),
    vehicle_part("V300RearDoor2", 20),
    vehicle_part("V300MufflerSmall2", 4),
    vehicle_part("V300MufflerLarge2", 6),
    vehicle_part("V300EngineVentLid2", 15),
    vehicle_part("V300EngineDoor2", 15),
    vehicle_part("V300DriverHatchLid2", 5),
    vehicle_part("V300DriverHatchDoor2", 15),
    vehicle_part("V300BrushGuards2", 28)
}

CContainers.VehicleStorage84jeepXJ = {
    vehicle_storage("84jeepXJSeatRear2", 25, 16, 30, 35),
    vehicle_storage("84jeepXJSeatFront2", 25, 14, 30, 35),
    vehicle_storage("84jeepXJRoofrack2", 65, 20, 75, 85)
}

CContainers.VehicleParts84jeepXJ = {
    vehicle_part("84jeepXJWindshieldRearArmor", 18),
    vehicle_part("84jeepXJWindshieldArmor", 18),
    vehicle_part("84jeepXJWindshield2", 9),
    vehicle_part("84jeepXJTrunkDoor2", 15),
    vehicle_part("84jeepXJRearWindshield2", 7),
    vehicle_part("84jeepXJRearWindowArmor", 15),
    vehicle_part("84jeepXJRearSideWindow2", 3),
    vehicle_part("84jeepXJRearDoor2", 10),
    vehicle_part("84jeepXJFrontWindowArmor", 15),
    vehicle_part("84jeepXJFrontSideWindow2", 4),
    vehicle_part("84jeepXJFrontDoor2", 10),
    vehicle_part("84jeepXJEngineDoor2", 14),
    vehicle_part("84jeepXJBumperRear0", 9),
    vehicle_part("84jeepXJBumperFrontA", 9),
    vehicle_part("84jeepXJBumperFront0", 12),
    vehicle_part("84jeepXJBullbarFrontA", 16),
    vehicle_part("84jeepXJBackWindowArmor", 15),
    vehicle_part("84jeepXJBackSideWindow2", 3)
}

CContainers.VehicleStorage85buickLeSabre = {
    vehicle_storage("85buickLeSabreSeatRear1", 30, 16, 35, 40),
    vehicle_storage("85buickLeSabreSeatFront1", 30, 15, 35, 40)
}

CContainers.VehicleParts85buickLeSabre = {
    vehicle_part("85buickLeSabreTrunkDoor1", 10),
    vehicle_part("85buickLeSabreEngineDoor1", 14),
    vehicle_part("85buickLeSabreBumperRear0", 9),
    vehicle_part("85buickLeSabreBumperFrontA", 15),
    vehicle_part("85buickLeSabreBumperFront0", 10)
}

CContainers.VehicleStorage85chevyCaprice = {
    vehicle_storage("85chevyCapriceSeatRear1", 30, 16, 35, 40),
    vehicle_storage("85chevyCapriceSeatFront1", 30, 15, 35, 40)
}

CContainers.VehicleParts85chevyCaprice = {
    vehicle_part("85chevyCapriceTrunkDoor1", 10),
    vehicle_part("85chevyCapriceEngineDoor1", 14),
    vehicle_part("85chevyCapriceCabBarrier1", 10),
    vehicle_part("85chevyCapriceBumperRearB", 12),
    vehicle_part("85chevyCapriceBumperRear0", 9),
    vehicle_part("85chevyCapriceBumperFrontB", 13),
    vehicle_part("85chevyCapriceBumperFrontA", 15),
    vehicle_part("85chevyCapriceBumperFront0", 10)
}

CContainers.VehicleStorage85clubMan = {
    vehicle_storage("85clubManTire1", 35, 4, 40, 45),
    vehicle_storage("85clubManSeat1", 5, 4, 6, 8)
}

CContainers.VehicleParts85clubMan = {
    vehicle_part("85clubManWindshield1", 10),
    vehicle_part("85clubManRoof1", 10),
    vehicle_part("85clubManBumperRear1", 4),
    vehicle_part("85clubManBumperFront1", 2)
}

CContainers.VehicleStorage85oldsmobileDelta88 = {
    vehicle_storage("85oldsmobileDelta88SeatRear1", 30, 16, 35, 40),
    vehicle_storage("85oldsmobileDelta88SeatFront1", 30, 15, 35, 40)
}

CContainers.VehicleParts85oldsmobileDelta88 = {
    vehicle_part("85oldsmobileDelta88TrunkDoor1", 10),
    vehicle_part("85oldsmobileDelta88EngineDoor1", 14),
    vehicle_part("85oldsmobileDelta88BumperRear0", 9),
    vehicle_part("85oldsmobileDelta88BumperFrontA", 15),
    vehicle_part("85oldsmobileDelta88BumperFront0", 10)
}

CContainers.VehicleStorage85pontiacParisienne = {
    vehicle_storage("85pontiacParisienneSeatRear1", 30, 16, 35, 40),
    vehicle_storage("85pontiacParisienneSeatFront1", 30, 15, 35, 40)
}

CContainers.VehicleParts85pontiacParisienne = {
    vehicle_part("85pontiacParisienneTrunkDoor1", 10),
    vehicle_part("85pontiacParisienneEngineDoor1", 14),
    vehicle_part("85pontiacParisienneBumperRear0", 9),
    vehicle_part("85pontiacParisienneBumperFrontA", 15),
    vehicle_part("85pontiacParisienneBumperFront0", 10)
}

CContainers.VehicleStorage86chevyCUCV = {
    vehicle_storage("86chevyCUCVSeatRear2", 20, 12, 25, 30),
    vehicle_storage("86chevyCUCVSeatFront2", 25, 14, 30, 35)
}

CContainers.VehicleParts86chevyCUCV = {
    vehicle_part("86chevyM1010WindshieldRearArmor", 8),
    vehicle_part("86chevyM1010WindshieldRear2", 4),
    vehicle_part("86chevyM1008Tailgate2", 13),
    vehicle_part("86chevyK5Tailgate2", 14),
    vehicle_part("86chevyCUCVstorageLids2", 14),
    vehicle_part("86chevyCUCVstorageLid2", 7),
    vehicle_part("86chevyCUCVWindshieldRearArmor", 10),
    vehicle_part("86chevyCUCVWindshieldArmor", 15),
    vehicle_part("86chevyCUCVFrontWindowArmor", 7),
    vehicle_part("86chevyCUCVBumperRear2", 13),
    vehicle_part("86chevyCUCVBumperRear1", 12),
    vehicle_part("86chevyCUCVBullbarFrontC", 13),
    vehicle_part("86chevyCUCVBullbarFrontB", 15),
    vehicle_part("86chevyCUCVBedTarp2", 10),
    vehicle_part("86chevyCUCVBedPlanks2", 14),
    vehicle_part("86chevyCUCVBackWindowArmor", 10),
    vehicle_part("86chevy1028Mudflaps2", 5),
    vehicle_part("80chevyM1031Tailgate2", 15),
    vehicle_part("80chevyM1028Tailgate2", 16),
    vehicle_part("80chevyM1010Tailgate2", 17),
    vehicle_part("86chevyCUCVEngineDoor2", 13)
}

CContainers.VehicleStorage86oshkoshP19A = {
    vehicle_storage("P19ARoofrack", 85, 20, 90, 100)
}

CContainers.VehicleParts86oshkoshP19A = {
    vehicle_part("P19AWindshield2", 8),
    vehicle_part("P19ATrunkDoor2", 10),
    vehicle_part("P19ASideWindow2", 3),
    vehicle_part("P19ARoofHatch2", 5),
    vehicle_part("P19AEngineDoor2", 8),
    vehicle_part("P19ACarFrontDoor2", 10),
    vehicle_part("P19ABumperRear0", 1),
    vehicle_part("P19ABumperFront0", 1),
    vehicle_part("M1082TrunkDoor2", 10),
    vehicle_part("M1082Mudflaps2", 3),
    vehicle_part("P19AWindshieldArmor", 16),
    vehicle_part("P19ASpareMount2", 9),
    vehicle_part("P19ASpareMount1", 10),
    vehicle_part("P19AFenderRight3", 17),
    vehicle_part("P19AFenderRight2", 15),
    vehicle_part("P19AFenderRight1", 20),
    vehicle_part("P19AFenderLeft2", 15),
    vehicle_part("P19AFenderLeft1", 20),
    vehicle_part("P19ACarFrontDoorArmor", 11),
    vehicle_part("M1082Tarp2", 3)
}

CContainers.VehicleStorage87buickRegal = {
    vehicle_storage("87buickRegalTire1", 35, 11, 40, 45),
    vehicle_storage("87buickRegalSeatRear3", 20, 13, 25, 30),
    vehicle_storage("87buickRegalSeatFront3", 20, 13, 25, 30),
    vehicle_storage("87buickRegalRoofrack3", 50, 14, 60, 75),
    vehicle_storage("87buickRegalGNXTire3", 35, 10, 40, 50)
}

CContainers.VehicleParts87buickRegal = {
    vehicle_part("87buickRegalWindshieldRearArmor", 12),
    vehicle_part("87buickRegalWindshieldArmor", 14),
    vehicle_part("87buickRegalWindshield3", 9),
    vehicle_part("87buickRegalTrunkDoor3", 8),
    vehicle_part("87buickRegalRearWindshield3", 7),
    vehicle_part("87buickRegalRearWindowArmor", 9),
    vehicle_part("87buickRegalRearSideWindow3", 1),
    vehicle_part("87buickRegalGNXSpoiler3", 1.1),
    vehicle_part("87buickRegalFrontWindowArmor", 8),
    vehicle_part("87buickRegalFrontSplitLip3", 1),
    vehicle_part("87buickRegalFrontSideWindow3", 4),
    vehicle_part("87buickRegalFrontLip3", 1.3),
    vehicle_part("87buickRegalFrontDoor3", 10),
    vehicle_part("87buickRegalEngineDoor3", 10),
    vehicle_part("87buickRegalBumperRear", 5),
    vehicle_part("87buickRegalBumperFrontA", 7),
    vehicle_part("87buickRegalBumperFront", 6),
    vehicle_part("87buickRegalBullbar", 12)
}

CContainers.VehicleStorage87chevySuburban = {
    vehicle_storage("87chevySuburbanTire2", 35, 15, 40, 50),
    vehicle_storage("87chevySuburbanSideStorage2", 15, 3, 17, 20),
    vehicle_storage("87chevySuburbanSeatRear2", 20, 12, 25, 30),
    vehicle_storage("87chevySuburbanSeatFront2", 25, 14, 30, 35),
    vehicle_storage("87chevySuburbanRoofrack2", 70, 16, 75, 90)
}

CContainers.VehicleParts87chevySuburban = {
    vehicle_part("87chevySuburbanWindshieldArmor", 16),
    vehicle_part("87chevySuburbanTrunkDoor2", 13),
    vehicle_part("87chevySuburbanRoofLights2", 1),
    vehicle_part("87chevySuburbanRearWindowArmor", 10),
    vehicle_part("87chevySuburbanFrontWindowArmor", 10),
    vehicle_part("87chevySuburbanEngineDoor2", 13),
    vehicle_part("87chevySuburbanBackWindowArmor", 9),
    vehicle_part("87chevySuburbanWindshieldRearArmor", 11)
}

CContainers.VehicleStorage88toyotaHilux = {
    vehicle_storage("88toyotaHiluxTire2", 35, 15, 40, 45),
    vehicle_storage("88toyotaHiluxSeatRear2", 25, 4, 30, 35),
    vehicle_storage("88toyotaHiluxSeatFront2", 25, 14, 30, 35),
    vehicle_storage("88toyotaHiluxRoofrack2", 77, 20, 82, 90)
}

CContainers.VehicleParts88toyotaHilux = {
    vehicle_part("88toyotaHiluxWindshieldRearArmor", 13),
    vehicle_part("88toyotaHiluxWindshieldRear2", 9),
    vehicle_part("88toyotaHiluxWindshieldArmor", 16),
    vehicle_part("88toyotaHiluxWindshield2", 9),
    vehicle_part("88toyotaHiluxTrunkDoor2", 11),
    vehicle_part("88toyotaHiluxSideSteps2", 3),
    vehicle_part("88toyotaHiluxRollbar2", 14),
    vehicle_part("88toyotaHiluxMudflaps2", 2),
    vehicle_part("88toyotaHiluxFrontWindowArmor", 10),
    vehicle_part("88toyotaHiluxFrontSideWindow2", 4),
    vehicle_part("88toyotaHiluxFrontDoor2", 13),
    vehicle_part("88toyotaHiluxEngineDoor2", 13),
    vehicle_part("88toyotaHiluxBumperRear0", 8),
    vehicle_part("88toyotaHiluxBumperFront0", 8),
    vehicle_part("88toyotaHiluxBullbarRearA", 10),
    vehicle_part("88toyotaHiluxBullbarFrontA", 12),
    vehicle_part("88toyotaHiluxBedCap2", 25),
    vehicle_part("88toyotaHiluxBackWindowArmor", 10),
    vehicle_part("88toyotaHiluxBackSideWindow2", 4)
}

CContainers.VehicleParts89trooper = {
    vehicle_part("89trooperWindshieldRearArmor", 14),
    vehicle_part("89trooperWindshieldArmor", 17),
    vehicle_part("89trooperWindshield2", 9),
    vehicle_part("89trooperTrunkDoor2", 13),
    vehicle_part("89trooperSideWindow2", 3),
    vehicle_part("89trooperSideSteps2", 12),
    vehicle_part("89trooperRearWindshield2", 7),
    vehicle_part("89trooperRearDoorArmor", 12),
    vehicle_part("89trooperRearDoor2", 10),
    vehicle_part("89trooperMudflaps2", 10),
    vehicle_part("89trooperFrontDoorArmor", 13),
    vehicle_part("89trooperFrontDoor2", 10),
    vehicle_part("89trooperEngineDoor2", 13),
    vehicle_part("89trooperBumperRear0", 10),
    vehicle_part("89trooperBumperFront0", 10),
    vehicle_part("89trooperBullbarFrontB", 15),
    vehicle_part("89trooperBullbarFrontA", 15),
    vehicle_part("89trooperBackWindowArmor", 12)
}

CContainers.VehicleStorage89trooper = {
    vehicle_storage("89trooperTire2", 35, 15, 40, 45),
    vehicle_storage("89trooperSeatRear2", 25, 15, 30, 35),
    vehicle_storage("89trooperSeatFront2", 25, 15, 30, 35),
    vehicle_storage("89trooperRoofrack2", 80, 20, 90, 100)
}

CContainers.VehicleParts89volvo200 = {
    vehicle_part("89volvo245WagonTrunkDoor1", 12),
    vehicle_part("89volvo245WagonRearWindshield1", 8),
    vehicle_part("89volvo245WagonBackWindowArmorW", 7),
    vehicle_part("89volvo245WagonBackWindowArmorM", 12),
    vehicle_part("89volvo245WagonBackSideWindow1", 8),
    vehicle_part("89volvo244SedanBackWindowArmorW", 1),
    vehicle_part("89volvo244SedanBackWindowArmorM", 1.6),
    vehicle_part("89volvo244SedanBackSideWindow1", 1),
    vehicle_part("89volvo242RearSideWindow1", 4),
    vehicle_part("89volvo242EngineDoor1", 10),
    vehicle_part("89volvo240WindshieldRearArmorW", 7),
    vehicle_part("89volvo240WindshieldRearArmorM", 12),
    vehicle_part("89volvo240WindshieldArmorW", 9),
    vehicle_part("89volvo240WindshieldArmorM", 14),
    vehicle_part("89volvo240Windshield1", 9),
    vehicle_part("89volvo240SpoilerB1", 2),
    vehicle_part("89volvo240SpoilerA1", 2),
    vehicle_part("89volvo240SedanTrunkDoor1", 8),
    vehicle_part("89volvo240SedanRearWindshield1", 10),
    vehicle_part("89volvo240RearWindowArmorW", 5),
    vehicle_part("89volvo240RearWindowArmorM", 10),
    vehicle_part("89volvo240RearSideWindow1", 3),
    vehicle_part("89volvo240RearDoor1", 9),
    vehicle_part("89volvo240Mudflaps1", 1),
    vehicle_part("89volvo240Louver1", 5),
    vehicle_part("89volvo240LipFrontB1", 2),
    vehicle_part("89volvo240LipFrontA1", 2),
    vehicle_part("89volvo240FrontWindowArmorW", 4),
    vehicle_part("89volvo240FrontWindowArmorM", 8),
    vehicle_part("89volvo240FrontSideWindow1", 3),
    vehicle_part("89volvo240FrontDoor1", 10),
    vehicle_part("89volvo240EngineDoor1", 12),
    vehicle_part("89volvo240BumperRear0", 7),
    vehicle_part("89volvo240BumperFrontLA", 13),
    vehicle_part("89volvo240BumperFrontL", 8),
    vehicle_part("89volvo240BumperFrontB", 18),
    vehicle_part("89volvo240BumperFront0A", 12),
    vehicle_part("89volvo240BumperFront0", 7),
    vehicle_part("89volvo240BullbarFrontA", 14)
}

CContainers.VehicleStorage89volvo200 = {
    vehicle_storage("89volvo245WagonRoofrack1", 70, 14, 75, 90),
    vehicle_storage("89volvo245WagonRoofRails1", 0, 2, 0, 0),
    vehicle_storage("89volvo240SeatRear1", 20, 13, 25, 30),
    vehicle_storage("89volvo240SeatFront1", 20, 14, 25, 30),
    vehicle_storage("89volvo240Roofrack1", 75, 15, 80, 85),
    vehicle_storage("89volvo200Tire2", 35, 12, 40, 45),
    vehicle_storage("89volvo200Tire1", 35, 11, 40, 45),
    vehicle_storage("89volvo200Tire0", 35, 10, 40, 45)
}

CContainers.VehicleStorage90fordF350ambulance = {
    vehicle_storage("90fordF350Tire2", 35, 14, 40, 45),
    vehicle_storage("90fordF350DoubleTires2", 35, 22, 40, 45),
    vehicle_storage("90fordF350ambSeatRear2", 20, 1, 25, 30)
}

CContainers.VehicleParts90fordF350ambulance = {
    vehicle_part("90fordF350ambWindshieldRearArmor", 14),
    vehicle_part("90fordF350ambWindshieldArmor", 18),
    vehicle_part("90fordF350ambWindowsBack2", 12),
    vehicle_part("90fordF350ambWindowRearSide2", 6),
    vehicle_part("90fordF350ambWindowRearArmor", 10),
    vehicle_part("90fordF350ambWindowFrontArmor", 10),
    vehicle_part("90fordF350ambSidesteps2", 8),
    vehicle_part("90fordF350ambRightStorageLid2", 6),
    vehicle_part("90fordF350ambReinforcedBumperFront", 19),
    vehicle_part("90fordF350ambRearDoor2", 10),
    vehicle_part("90fordF350ambLeftStorageLids2", 13),
    vehicle_part("90fordF350ambCornerStorageLids2", 10),
    vehicle_part("90fordF350ambBumperRear", 11),
    vehicle_part("90fordF350ambBumperFront", 9),
    vehicle_part("90fordF350ambBullbarFront", 10),
    vehicle_part("90fordF350ambBackDoors2", 20)
}

CContainers.VehicleStorage90pierceArrow = {
    vehicle_storage("90pierceArrowWaterTank2", 500, 10, 550, 600),
    vehicle_storage("90pierceArrowTire2", 35, 16, 40, 45),
    vehicle_storage("90pierceArrowSeat2", 25, 15, 30, 35),
    vehicle_storage("90pierceArrowDoubleTires2", 35, 16, 40, 45)
}

CContainers.VehicleParts90pierceArrow = {
    vehicle_part("90pierceArrowWindshieldRearArmor", 20),
    vehicle_part("90pierceArrowWindshieldArmor", 20),
    vehicle_part("90pierceArrowWindshield2", 9),
    vehicle_part("90pierceArrowTrunkDoorsRight2", 15),
    vehicle_part("90pierceArrowTrunkDoorsLeft2", 15),
    vehicle_part("90pierceArrowTrunkDoor2", 15),
    vehicle_part("90pierceArrowSideWindowArmor", 25),
    vehicle_part("90pierceArrowSideWindow2", 3),
    vehicle_part("90pierceArrowReinforcedBumper1", 20),
    vehicle_part("90pierceArrowRearWindshield2", 7),
    vehicle_part("90pierceArrowRearDoor2", 10),
    vehicle_part("90pierceArrowMudflaps2", 10),
    vehicle_part("90pierceArrowLadders", 20),
    vehicle_part("90pierceArrowHoses", 30),
    vehicle_part("90pierceArrowFrontDoor2", 10),
    vehicle_part("90pierceArrowEngineDoor2", 15),
    vehicle_part("90pierceArrowBumper0", 15)
}

CContainers.VehicleStorage91fordLTD = {
    vehicle_storage("91fordLTDTire1", 35, 15, 40, 45),
    vehicle_storage("91fordLTDSeatRear1", 30, 18, 35, 40),
    vehicle_storage("91fordLTDSeatFront1", 30, 18, 35, 40),
    vehicle_storage("91fordLTDRoofrack1", 50, 14, 55, 60)
}

CContainers.VehicleParts91fordLTD = {
    vehicle_part("91fordLTDWindshield1", 9),
    vehicle_part("91fordLTDWagonWindshieldRearArmor", 10),
    vehicle_part("91fordLTDWagonTrunkDoor1", 14),
    vehicle_part("91fordLTDWagonRearWindshield1", 9),
    vehicle_part("91fordLTDWagonBumperRear1", 12),
    vehicle_part("91fordLTDWagonBackWindowArmor", 9),
    vehicle_part("91fordLTDWagonBackSideWindow1", 5),
    vehicle_part("91fordLTDTrunkDoor1", 12),
    vehicle_part("91fordLTDRearWindshield1", 10),
    vehicle_part("91fordLTDRearSideWindow1", 3),
    vehicle_part("91fordLTDRearDoor1", 11),
    vehicle_part("91fordLTDFrontSideWindow1", 3),
    vehicle_part("91fordLTDFrontDoor1", 10),
    vehicle_part("91fordLTDEngineDoor1", 15),
    vehicle_part("91fordLTDCabBarrier1", 10),
    vehicle_part("91fordLTDBumperRear0", 11),
    vehicle_part("91fordLTDBumperFront1", 15),
    vehicle_part("91fordLTDBumperFront0", 10)
}

CContainers.VehicleParts91nissan240sx = {
    vehicle_part("91nissan240sxWindshieldRearArmor", 12),
    vehicle_part("91nissan240sxWindshieldArmor", 14),
    vehicle_part("91nissan240sxWindshield3", 9),
    vehicle_part("91nissan240sxTrunkDoor3", 8),
    vehicle_part("91nissan240sxTaillightsMod3", 6),
    vehicle_part("91nissan240sxSunroof3", 3),
    vehicle_part("91nissan240sxSpoiler3", 3.4),
    vehicle_part("91nissan240sxSpoiler2", 3),
    vehicle_part("91nissan240sxSpoiler1", 2.3),
    vehicle_part("91nissan240sxSpoiler0", 2),
    vehicle_part("91nissan240sxSideskirts1", 3.5),
    vehicle_part("91nissan240sxSideskirts0", 3),
    vehicle_part("91nissan240sxRearWindshield3", 8),
    vehicle_part("91nissan240sxRearWindowArmor", 10),
    vehicle_part("91nissan240sxRearSideWindow3", 9),
    vehicle_part("91nissan240sxPopupLights3", 4),
    vehicle_part("91nissan240sxFrontWindowArmor", 8),
    vehicle_part("91nissan240sxFrontSideWindow3", 7),
    vehicle_part("91nissan240sxFrontDoor3", 10),
    vehicle_part("91nissan240sxEngineDoor3", 9),
    vehicle_part("91nissan240sxBumperRear2", 7),
    vehicle_part("91nissan240sxBumperRear1", 6),
    vehicle_part("91nissan240sxBumperRear0", 5),
    vehicle_part("91nissan240sxBumperFrontB", 16),
    vehicle_part("91nissan240sxBumperFrontA", 16),
    vehicle_part("91nissan240sxBumperFront3", 9),
    vehicle_part("91nissan240sxBumperFront2", 8),
    vehicle_part("91nissan240sxBumperFront1", 7),
    vehicle_part("91nissan240sxBumperFront0", 6),
    vehicle_part("91nissan240sxBullbarFrontA", 13)
}

CContainers.VehicleStorage91nissan240sx = {
    vehicle_storage("91nissan240sxSeatRear3", 20, 13, 25, 30),
    vehicle_storage("91nissan240sxSeatFront3", 20, 13, 25, 30),
    vehicle_storage("91nissan240sxPrivacyCover0", 10, 2, 12, 15),
    vehicle_storage("91nissan240sxOEM23", 35, 15, 40, 45),
    vehicle_storage("91nissan240sxOEM13", 35, 15, 40, 45),
    vehicle_storage("91nissan240sxGT3", 35, 13.8, 40, 45),
    vehicle_storage("91nissan240sxG73", 35, 14, 40, 45)
}

CContainers.VehicleParts91range = {
    vehicle_part("91rangeWindshieldRearArmor", 18),
    vehicle_part("91rangeWindshieldArmor", 18),
    vehicle_part("91rangeWindshield2", 9),
    vehicle_part("91rangeTrunkDoor2", 15),
    vehicle_part("91rangeSunRoof2", 3),
    vehicle_part("91rangeSnorkel2", 3),
    vehicle_part("91rangeSideSteps2", 10),
    vehicle_part("91rangeRearWindshield2", 7),
    vehicle_part("91rangeRearWindowArmor", 15),
    vehicle_part("91rangeRearSideWindow2", 3),
    vehicle_part("91rangeRearDoor2", 10),
    vehicle_part("91rangeMudflaps2", 2),
    vehicle_part("91rangeFrontWindowArmor", 15),
    vehicle_part("91rangeFrontSideWindow2", 4),
    vehicle_part("91rangeFrontDoor2", 10),
    vehicle_part("91rangeEngineDoor2", 14),
    vehicle_part("91rangeBumperRear0", 9),
    vehicle_part("91rangeBumperFront1", 9),
    vehicle_part("91rangeBumperFront0", 12),
    vehicle_part("91rangeBullbarRearA", 10),
    vehicle_part("91rangeBullbarFrontA", 16)
}

CContainers.VehicleStorage91range = {
    vehicle_storage("91rangeTire2", 35, 15, 40, 45),
    vehicle_storage("91rangeSeatRear2", 25, 16, 30, 35),
    vehicle_storage("91rangeSeatFront2", 25, 14, 30, 35),
    vehicle_storage("91rangeRoofrack2", 65, 20, 70, 80)
}

CContainers.VehicleStorage92fordCVPI = {
    vehicle_storage("92fordCVPISeatRear1", 30, 18, 35, 40),
    vehicle_storage("92fordCVPISeatFront1", 30, 18, 35, 40)
}

CContainers.VehicleParts92fordCVPI = {
    vehicle_part("92fordCVPIWindshield1", 9),
    vehicle_part("92fordCVPITrunkDoor1", 13),
    vehicle_part("92fordCVPIRearWindshield1", 10),
    vehicle_part("92fordCVPIRearSideWindow1", 3),
    vehicle_part("92fordCVPIRearDoor1", 11),
    vehicle_part("92fordCVPIFrontSideWindow1", 3),
    vehicle_part("92fordCVPIFrontDoor1", 10),
    vehicle_part("92fordCVPIEngineDoor1", 15),
    vehicle_part("92fordCVPICabBarrier1", 10),
    vehicle_part("92fordCVPIBumperRear0", 12),
    vehicle_part("92fordCVPIBumperFront3", 16),
    vehicle_part("92fordCVPIBumperFront2", 16),
    vehicle_part("92fordCVPIBumperFront1", 15),
    vehicle_part("92fordCVPIBumperFront0", 10)
}

CContainers.VehicleStorage92jeepYJ = {
    vehicle_storage("92jeepYJSeatRear2", 25, 12, 30, 35),
    vehicle_storage("92jeepYJSeatFront2", 25, 13, 30, 35),
    vehicle_storage("92jeepYJRoofrack2", 65, 13, 75, 85)
}

CContainers.VehicleParts92jeepYJ = {
    vehicle_part("92jeepYJWindshieldRearArmor", 11),
    vehicle_part("92jeepYJWindshieldRear2", 10),
    vehicle_part("92jeepYJWindshieldFrame2", 8),
    vehicle_part("92jeepYJWindshieldArmor", 12),
    vehicle_part("92jeepYJWindshield2", 7),
    vehicle_part("92jeepYJWinch2", 14),
    vehicle_part("92jeepYJTrunkDoor2", 6),
    vehicle_part("92jeepYJSportRollbar2", 13),
    vehicle_part("92jeepYJSoftTop2", 15),
    vehicle_part("92jeepYJSnorkel2", 3),
    vehicle_part("92jeepYJRearWindowArmor", 10),
    vehicle_part("92jeepYJRearSideWindow2", 5),
    vehicle_part("92jeepYJLightbar2", 9),
    vehicle_part("92jeepYJHardTop2", 25),
    vehicle_part("92jeepYJFrontWindowArmor", 9),
    vehicle_part("92jeepYJFrontSideWindowFrame2", 4),
    vehicle_part("92jeepYJFrontSideWindow2", 4),
    vehicle_part("92jeepYJFrontDoor2", 7),
    vehicle_part("92jeepYJFamilyRollbar2", 16),
    vehicle_part("92jeepYJEngineDoor2", 10),
    vehicle_part("92jeepYJBumperRear1", 6),
    vehicle_part("92jeepYJBumperRear0", 4),
    vehicle_part("92jeepYJBumperFront1", 6),
    vehicle_part("92jeepYJBumperFront0", 8),
    vehicle_part("92jeepYJBullbarFrontA", 13),
    vehicle_part("92jeepYJBodykitB2", 11),
    vehicle_part("92jeepYJBodykitA2", 12)
}

CContainers.VehicleStorage93chevySuburban = {
    vehicle_storage("93chevySuburbanTire2", 35, 15, 40, 45),
    vehicle_storage("93chevySuburbanTire1", 35, 14, 40, 45),
    vehicle_storage("93chevySuburbanSeatRear2", 20, 12, 25, 30),
    vehicle_storage("93chevySuburbanSeatFront2", 25, 14, 25, 30),
    vehicle_storage("93chevySuburbanRoofrack2", 77, 16, 82, 90),
    vehicle_storage("93chevySilverdoRollbar2", 35, 18, 40, 45),
    vehicle_storage("93chevyK3500Tire2", 35, 14, 40, 45),
    vehicle_storage("93chevyK3500DoubleTires2", 35, 25, 40, 45)
}

CContainers.VehicleParts93chevySuburban = {
    vehicle_part("93chevySuburbanWindshieldRearArmor", 11),
    vehicle_part("93chevySuburbanWindshieldArmor", 16),
    vehicle_part("93chevySuburbanWindshield2", 9),
    vehicle_part("93chevySuburbanTrunkDoor2", 13),
    vehicle_part("93chevySuburbanSplitTrunkDoor2", 14),
    vehicle_part("93chevySuburbanSplitRearWindshield2", 7),
    vehicle_part("93chevySuburbanSideStepsPipes2", 9),
    vehicle_part("93chevySuburbanSideStepsMetal2", 10),
    vehicle_part("93chevySuburbanSideSteps2", 7),
    vehicle_part("93chevySuburbanRearWindshield2", 7),
    vehicle_part("93chevySuburbanRearWindowArmor", 10),
    vehicle_part("93chevySuburbanRearSideWindow2", 4),
    vehicle_part("93chevySuburbanRearDoor2", 10),
    vehicle_part("93chevySuburbanFrontWindowArmor", 10),
    vehicle_part("93chevySuburbanFrontSideWindow2", 4),
    vehicle_part("93chevySuburbanFrontDoor2", 11),
    vehicle_part("93chevySuburbanEngineDoor2", 13),
    vehicle_part("93chevySuburbanBumperRear0", 8),
    vehicle_part("93chevySuburbanBumperFront1", 7),
    vehicle_part("93chevySuburbanBumperFront0", 8),
    vehicle_part("93chevySuburbanBullbarFrontC", 18),
    vehicle_part("93chevySuburbanBullbarFrontB", 17),
    vehicle_part("93chevySuburbanBullbarFrontA", 12),
    vehicle_part("93chevySuburbanBugGuards2", 0.5),
    vehicle_part("93chevySuburbanBackWindowArmor", 9),
    vehicle_part("93chevySuburbanBackSideWindow2", 6),
    vehicle_part("93chevySilveradoTrunkDoor2", 10),
    vehicle_part("93chevySilveradoRearWindshield2", 7)
}

CContainers.VehicleStorage93townCar = {
    vehicle_storage("93townCarTrunkRack1", 30, 5, 35, 40),
    vehicle_storage("93townCarTire1", 35, 15, 40, 45),
    vehicle_storage("93townCarSeatRear1", 30, 18, 35, 40),
    vehicle_storage("93townCarSeatFront1", 30, 18, 35, 40),
    vehicle_storage("93townCarLimoTire1", 35, 15, 40, 45)
}

CContainers.VehicleParts93townCar = {
    vehicle_part("BigBullHorns", 2),
    vehicle_part("93townCarWindshieldRearArmor", 21),
    vehicle_part("93townCarWindshieldArmorB", 21),
    vehicle_part("93townCarWindshieldArmorA", 20),
    vehicle_part("93townCarWindshield1", 9),
    vehicle_part("93townCarTrunkDoor1", 13),
    vehicle_part("93townCarSunRoof1", 2),
    vehicle_part("93townCarRearWindshield1", 10),
    vehicle_part("93townCarRearSideWindow1", 3),
    vehicle_part("93townCarRearDoorArmor", 19),
    vehicle_part("93townCarRearDoor1", 11),
    vehicle_part("93townCarMiddleWindowArmor", 20),
    vehicle_part("93townCarMiddleSideWindow1", 4),
    vehicle_part("93townCarFrontSideWindow1", 3),
    vehicle_part("93townCarFrontDoorArmor", 18),
    vehicle_part("93townCarFrontDoor1", 10),
    vehicle_part("93townCarEngineDoor1", 15),
    vehicle_part("93townCarBumperRear0", 12),
    vehicle_part("93townCarBumperFront1", 13),
    vehicle_part("93townCarBumperFront0", 10),
    vehicle_part("93townCarBullbarFrontC", 22),
    vehicle_part("93townCarBullbarFrontB", 17),
    vehicle_part("93townCarBullbarFrontA", 15)
}

CContainers.VehicleParts98stagea = {
    vehicle_part("98stageaWindshieldRearArmor", 10),
    vehicle_part("98stageaWindshieldArmor", 14),
    vehicle_part("98stageaWindshield3", 9),
    vehicle_part("98stageaTrunkDoor3", 12),
    vehicle_part("98stageaSpoiler3", 2),
    vehicle_part("98stageaSideskirts3", 5),
    vehicle_part("98stageaRearWindshield3", 9),
    vehicle_part("98stageaRearWindowArmor", 7),
    vehicle_part("98stageaRearSideWindow3", 3),
    vehicle_part("98stageaRearDoor3", 8),
    vehicle_part("98stageaFrontWindowArmor", 7),
    vehicle_part("98stageaFrontSideWindow3", 3),
    vehicle_part("98stageaFrontDoor3", 8),
    vehicle_part("98stageaEngineDoor3", 12),
    vehicle_part("98stageaBumperRear0", 7),
    vehicle_part("98stageaBumperFrontA", 16),
    vehicle_part("98stageaBumperFront0", 7),
    vehicle_part("98stageaBullbarFrontA", 13),
    vehicle_part("98stageaBackWindowArmor", 9),
    vehicle_part("98stageaBackSideWindow3", 7)
}

CContainers.VehicleStorage98stagea = {
    vehicle_storage("98stageaTrunk3", 95, 1, 105, 120),
    vehicle_storage("98stageaTire3", 35, 11, 40, 45),
    vehicle_storage("98stageaSeatRear3", 20, 13, 25, 30),
    vehicle_storage("98stageaSeatFront3", 20, 14, 25, 30)
}

CContainers.VehicleParts99fordCVPI = {
    vehicle_part("99fordCVPIWindshield1", 9),
    vehicle_part("99fordCVPITrunkDoor1", 13),
    vehicle_part("99fordCVPIRearWindshield1", 10),
    vehicle_part("99fordCVPIRearSideWindow1", 3),
    vehicle_part("99fordCVPIRearDoor1", 11),
    vehicle_part("99fordCVPIFrontSideWindow1", 3),
    vehicle_part("99fordCVPIFrontDoor1", 10),
    vehicle_part("99fordCVPIEngineDoor1", 15),
    vehicle_part("99fordCVPICabBarrier1", 10),
    vehicle_part("99fordCVPIBumperRear0", 12),
    vehicle_part("99fordCVPIBumperFront1", 15),
    vehicle_part("99fordCVPIBumperFront0", 10)
}

CContainers.VehicleStorage99fordCVPI = {
    vehicle_storage("99fordCVPITrunk1", 68, 1, 75, 85),
    vehicle_storage("99fordCVPISeatRear1", 30, 18, 35, 40),
    vehicle_storage("99fordCVPISeatFront1", 20, 15, 25, 30)
}

CContainers.VehicleStorageenAutomobileExtravaganza = {
    vehicle_storage("NormalCarSeat", 20, 15, 25, 30)
}

CContainers.VehicleStorageKI5trailers = {
    vehicle_storage("KI5trailersToolBox2", 15, 6, 18, 22)
}

CContainers.VehiclePartsKI5trailers = {
    vehicle_part("KI5trailersTrunkDoor2", 14),
    vehicle_part("KI5trailersSplitDoors2", 12),
    vehicle_part("KI5trailersSideFlaresSmall2", 4),
    vehicle_part("KI5trailersSideFlaresMedium2", 5),
    vehicle_part("KI5trailersSideFlaresLarge2", 6),
    vehicle_part("KI5trailersRollDoor2", 15),
    vehicle_part("KI5trailersMudflaps2", 1.2),
    vehicle_part("KI5trailersDoor2", 8)
}

CContainers.VehicleStorage04vwTouran = {
    vehicle_storage("04vwTouranTire1", 35, 13, 40, 45),
    vehicle_storage("04vwTouranRearSeat1", 20, 15, 25, 30),
    vehicle_storage("04vwTouranFrontSeat1", 20, 15, 25, 30)
}

CContainers.VehicleStoragetsarslib = {
    vehicle_storage("ATAFreestorageTrunk", 300, 1, 320, 360),
    vehicle_storage("ATA900Trunk3", 900, 40, 950, 1000),
    vehicle_storage("ATA900Trunk2", 900, 40, 950, 1000),
    vehicle_storage("ATA900Trunk1", 900, 40, 950, 1000),
    vehicle_storage("ATA900Trunk", 900, 40, 950, 1000),
    vehicle_storage("ATA800Trunk3", 800, 40, 850, 900),
    vehicle_storage("ATA800Trunk2", 800, 40, 850, 900),
    vehicle_storage("ATA800Trunk1", 800, 40, 850, 900),
    vehicle_storage("ATA800Trunk", 800, 40, 850, 900),
    vehicle_storage("ATA700Trunk3", 700, 40, 750, 800),
    vehicle_storage("ATA700Trunk2", 700, 40, 750, 800),
    vehicle_storage("ATA700Trunk1", 700, 40, 750, 800),
    vehicle_storage("ATA700Trunk", 700, 40, 750, 800),
    vehicle_storage("ATA600Trunk3", 600, 40, 650, 700),
    vehicle_storage("ATA600Trunk2", 600, 40, 650, 700),
    vehicle_storage("ATA600Trunk1", 600, 40, 650, 700),
    vehicle_storage("ATA600Trunk", 600, 40, 650, 700),
    vehicle_storage("ATA500Trunk3", 500, 40, 550, 600),
    vehicle_storage("ATA500Trunk2", 500, 40, 550, 600),
    vehicle_storage("ATA500Trunk1", 500, 40, 550, 600),
    vehicle_storage("ATA500Trunk", 500, 40, 550, 600),
    vehicle_storage("ATA400Trunk3", 400, 40, 440, 475),
    vehicle_storage("ATA400Trunk2", 400, 40, 440, 475),
    vehicle_storage("ATA400Trunk1", 400, 40, 440, 475),
    vehicle_storage("ATA400Trunk", 400, 40, 440, 475),
    vehicle_storage("ATA300Trunk3", 300, 40, 340, 375),
    vehicle_storage("ATA300Trunk2", 300, 40, 340, 375),
    vehicle_storage("ATA300Trunk1", 300, 40, 340, 375),
    vehicle_storage("ATA300Trunk", 300, 40, 340, 375),
    vehicle_storage("ATA2.ATA2ItemContainer", 35, 1, 40, 45),
    vehicle_storage("ATA250Trunk3", 250, 40, 280, 250),
    vehicle_storage("ATA250Trunk2", 250, 40, 280, 300),
    vehicle_storage("ATA250Trunk1", 250, 40, 280, 300),
    vehicle_storage("ATA250Trunk", 250, 40, 280, 300),
    vehicle_storage("ATA200Trunk3", 200, 40, 230, 250),
    vehicle_storage("ATA200Trunk2", 200, 40, 230, 250),
    vehicle_storage("ATA200Trunk1", 200, 40, 230, 250),
    vehicle_storage("ATA200Trunk", 200, 40, 230, 250),
    vehicle_storage("ATA150Trunk3", 150, 40, 175, 200),
    vehicle_storage("ATA150Trunk2", 150, 40, 175, 200),
    vehicle_storage("ATA150Trunk1", 150, 40, 175, 200),
    vehicle_storage("ATA150Trunk", 150, 40, 175, 200),
    vehicle_storage("ATA1200Trunk3", 1200, 40, 1300, 1400),
    vehicle_storage("ATA1200Trunk2", 1200, 40, 1300, 1400),
    vehicle_storage("ATA1200Trunk1", 1200, 40, 1300, 1400),
    vehicle_storage("ATA1200Trunk", 1200, 40, 1300, 1400),
    vehicle_storage("ATA1100Trunk3", 1100, 40, 1200, 1300),
    vehicle_storage("ATA1100Trunk2", 1100, 40, 1200, 1300),
    vehicle_storage("ATA1100Trunk1", 1100, 40, 1200, 1300),
    vehicle_storage("ATA1100Trunk", 1100, 40, 1200, 1300),
    vehicle_storage("ATA1000Trunk3", 1000, 40, 1050, 1100),
    vehicle_storage("ATA1000Trunk2", 1000, 40, 1050, 1100),
    vehicle_storage("ATA1000Trunk1", 1000, 40, 1050, 1100),
    vehicle_storage("ATA1000Trunk", 1000, 40, 1050, 1100),
    vehicle_storage("500Tank3", 461, 14, 485, 500),
    vehicle_storage("500Tank2", 461, 22, 485, 500),
    vehicle_storage("500Tank1", 461, 15, 485, 500),
    vehicle_storage("1000Tank3", 1000, 14, 1050, 1100),
    vehicle_storage("1000Tank2", 1000, 22, 1050, 1100),
    vehicle_storage("1000Tank1", 1000, 15, 1050, 1100)
}

CContainers.BackpacksEFTBP = {
    container("EFTBP.Bag_MBSS", 90, 16, 1.7, 87, 90, 16, 18),
    container("EFTBP.Bag_Paratus", 81, 35, 2.1, 81, 84, 32, 35),
    container("EFTBP.Bag_Camelbak", 82, 30, 2.2, 87, 95, 31, 36),
    container("EFTBP.Bag_SwitchBlade", 82, 30, 1.7, 87, 95, 31, 36),
    container("EFTBP.Bag_Beta2", 82, 30, 2, 88, 95, 30, 35),
    container("EFTBP.Bag_Raid", 80, 46, 3.5, 87, 90, 29, 28),
    container("EFTBP.Bag_Rush100", 82, 45, 2.6, 87, 90, 29, 28),
    container("EFTBP.Bag_3DayPack", 82, 25, 1.15, 70, 80, 20, 21),
    container("EFTBP.Bag_Berkut", 83, 20, 1, 70, 80, 20, 21),
    container("EFTBP.Bag_Mechanism", 80, 32, 2, 87, 90, 29, 28),
    container("EFTBP.Bag_Pillbox", 85, 20, 2.3, 70, 80, 20, 21),
    container("EFTBP.Bag_Patrolpack", 82, 25, 1.1, 70, 80, 20, 21)
}

CContainers.FannyPacksEFTBP = {
    container("EFTBP.Bag_SlingbagBack", 85, 6, 0.48, 87, 88, 6, 7),
    container("EFTBP.Bag_SlingbagFront", 85, 6, 0.48, 87, 88, 6, 7)
}

CContainers.ChestRigsVanillaGearExpanded = {
    container("VGE.Bag_ChestRig_Tactical", 85, 5, 0, 85, 86, 5, 6)
}

CContainers.BackpacksSHDEquipment = {
    container("SHD.Bag_TheDivision2", 80, 27, 1.5, 82, 88, 27, 30),
    container("SHD.Bag_TheDivision1", 80, 27, 1.5, 82, 88, 27, 30)
}

CContainers.ChestRigsSUPPORTGOODS2 = {
    container("SupportCorps.CarrierVestPredator", 85, 7, 1, 85, 88, 8, 9),
    container("SupportCorps.CarrierVestBlack", 85, 7, 1, 85, 88, 8, 9),
    container("SupportCorps.CarrierVestUrban", 85, 7, 1, 85, 88, 8, 9),
    container("SupportCorps.CarrierVestTigerStripe", 85, 7, 1, 85, 88, 8, 9),
    container("SupportCorps.CarrierVestSnow", 85, 7, 1, 85, 88, 8, 9),
    container("SupportCorps.CarrierVestNone", 85, 7, 1, 85, 88, 8, 9),
    container("SupportCorps.CarrierVestMilGreen", 85, 7, 1, 85, 88, 8, 9),
    container("SupportCorps.CarrierVestHunting", 85, 7, 1, 85, 88, 8, 9),
    container("SupportCorps.CarrierVestGreen", 85, 7, 1, 85, 88, 8, 9),
    container("SupportCorps.CarrierVestForeign", 85, 7, 1, 85, 88, 8, 9),
    container("SupportCorps.CarrierVestDesert", 85, 7, 1, 85, 88, 8, 9),
    container("SupportCorps.MedicVestAlpine", 85, 15, 1, 86, 88, 15, 17),
    container("SupportCorps.MedicVest", 85, 15, 1, 86, 88, 15, 17),
    container("SupportCorps.MPVest", 85, 10, 0.01, 86, 88, 11, 12)
}

CContainers.FannyPacksSUPPORTGOODS2 = {
    container("SupportCorps.LeatherWaistpackBack", 70, 8, 0.3, 75, 80, 8, 9),
    container("SupportCorps.LeatherWaistpackFront", 70, 8, 0.3, 75, 89, 8, 9)
}

CContainers.BackpacksSUPPORTGOODS2 = {
    container("SupportCorps.WhiteFurBackpack", 85, 24, 2, 72, 80, 28, 23),
    container("SupportCorps.BlackFurBackpack", 85, 24, 2, 72, 80, 28, 23),
    container("SupportCorps.BrownFurBackpack", 85, 24, 2, 72, 80, 28, 23),
    container("SupportCorps.Infantry_Backpack", 90, 40, 2, 88, 95, 30, 35)
}

CContainers.BagsSUPPORTGOODS2 = {
    container("SupportCorps.MEDIC_pack_Alpine", 90, 35, 2, 88, 90, 29, 32),
    container("SupportCorps.MEDIC_pack_Black", 90, 35, 2, 88, 90, 29, 32),
    container("SupportCorps.MEDIC_pack_DesertCamo", 90, 35, 2, 88, 90, 29, 32),
    container("SupportCorps.MEDIC_pack_Camo", 90, 35, 2, 88, 90, 29, 32),
    container("SupportCorps.MEDIC_pack_Green", 90, 35, 2, 88, 90, 29, 32)
}

CContainers.MiscSUPPORTGOODS2 = {
    container("SupportCorps.LargeCardboardBox", 80, 30, 0.9, 82, 85, 32, 35),
    container("SupportCorps.MediumCardboardBox", 80, 20, 0.9, 82, 85, 22, 25),
    container("SupportCorps.SmallCardboardBox", 80, 10, 0.9, 82, 85, 10, 12),
    container("SupportCorps.FloppyDiskBinder", 50, 10, 1, 60, 70, 10, 12),
    container("SupportCorps.RationFARPackage", 90, 8, 0.1, 88, 90, 8, 9)
}
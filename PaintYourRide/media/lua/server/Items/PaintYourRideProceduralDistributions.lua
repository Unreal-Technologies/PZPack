require "Items/ProceduralDistributions"

ProceduralDistributions.list.CrateAutomotivePaint = {
    rolls = 3,
    items = {
        "PaintYourRide.AutomotiveSprayPrimer", 5,
        "PaintYourRide.AutomotivePaintWhite", 5,
        "PaintYourRide.AutomotiveSprayPrimer", 5,
        "PaintYourRide.AutomotivePaintWhite", 5,
        "PaintYourRide.BoxAutomotivePaintTints", 5,
        "PaintYourRide.BoxAutomotivePaintSprays1", 5,
        "PaintYourRide.BoxAutomotivePaintSprays2", 4,
        "PaintYourRide.BoxAutomotivePaintSprays3", 3,
        "PaintYourRide.BoxAutomotivePaintSprays4", 2,
    },
    junk = {
        rolls = 1,
        items = {
            "PaintYourRide.CataloguePaintSpray", 15,
            "PaintYourRide.CataloguePaintTints", 10,
        }
    }
}

ProceduralDistributions.list.GarageAutomotivePaint = {
    rolls = 4,
    items = {
        "PaintYourRide.AutomotiveSprayPrimer", 10,
        "PaintYourRide.AutomotiveSprayPrimer", 10,
        "PaintYourRide.AutomotivePaintWhite", 6,
        "PaintYourRide.AutomotivePaintWhite", 6,
        "PaintYourRide.AutomotivePaintWhite", 6,
        "PaintYourRide.BoxAutomotivePaintTints", 6,
        "PaintYourRide.BoxAutomotivePaintSprays1", 8,
        "PaintYourRide.BoxAutomotivePaintSprays2", 6,
        "PaintYourRide.BoxAutomotivePaintSprays3", 5,
        "PaintYourRide.BoxAutomotivePaintSprays4", 4,
    }
}

ProceduralDistributions.list.MechanicShelfAutomotivePaint = {
    rolls = 4,
    items = {
        "PaintYourRide.AutomotiveSprayPrimer", 20,
        "PaintYourRide.AutomotiveSprayPrimer", 20,
        -- spray paint
        "PaintYourRide.AutomotiveSprayPaintBlack", 8,
        "PaintYourRide.AutomotiveSprayPaintBlue", 8,
        "PaintYourRide.AutomotiveSprayPaintGreen", 8,
        "PaintYourRide.AutomotiveSprayPaintGrey", 8,
        "PaintYourRide.AutomotiveSprayPaintRed", 8,
        "PaintYourRide.AutomotiveSprayPaintWhite", 8,
        "PaintYourRide.AutomotiveSprayPaintBlueOlympic", 6,
        "PaintYourRide.AutomotiveSprayPaintBrownRusty", 6,
        "PaintYourRide.AutomotiveSprayPaintGreenForest", 6,
        "PaintYourRide.AutomotiveSprayPaintGreySteel", 6,
        "PaintYourRide.AutomotiveSprayPaintOrangeTangerine", 6,
        "PaintYourRide.AutomotiveSprayPaintPinkBubbleGum", 6,
        "PaintYourRide.AutomotiveSprayPaintRedCandyApple", 6,
        "PaintYourRide.AutomotiveSprayPaintVioletGrape", 6,
        "PaintYourRide.AutomotiveSprayPaintYellow", 6,
        "PaintYourRide.AutomotiveSprayPaintBlueNavy", 4,
        "PaintYourRide.AutomotiveSprayPaintBrownDarkChocolate", 4,
        "PaintYourRide.AutomotiveSprayPaintGreenArmy", 4,
        "PaintYourRide.AutomotiveSprayPaintPinkGlamorous", 4,
        "PaintYourRide.AutomotiveSprayPaintRedBurgundy", 4,
        "PaintYourRide.AutomotiveSprayPaintYellowTuscany", 4,
        "PaintYourRide.AutomotiveSprayPaintBlueNeon", 2,
        "PaintYourRide.AutomotiveSprayPaintGreenNeon", 2,
        "PaintYourRide.AutomotiveSprayPaintVioletIndigo", 2,
        "PaintYourRide.AutomotiveSprayPaintYellowNeon", 2,
        -- mix paint
        "PaintYourRide.AutomotivePaintWhite", 15,
        "PaintYourRide.AutomotivePaintWhite", 15,
        "PaintYourRide.AutomotivePaintWhite", 15,
        "PaintYourRide.AutomotiveTintPaintBlack", 10,
        "PaintYourRide.AutomotiveTintPaintBlue", 10,
        "PaintYourRide.AutomotiveTintPaintCyan", 10,
        "PaintYourRide.AutomotiveTintPaintGreen", 10,
        "PaintYourRide.AutomotiveTintPaintMagenta", 10,
        "PaintYourRide.AutomotiveTintPaintRed", 10,
        "PaintYourRide.AutomotiveTintPaintYellow", 10,
    },
}

table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, "PaintYourRide.VehiclePaintingMag1")
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, 2)
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, "PaintYourRide.VehiclePaintingMag2")
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, 2)

-- New in 41.60
table.insert(ProceduralDistributions["list"]["CarSupplyTools"].items, "PaintYourRide.SprayGun")
table.insert(ProceduralDistributions["list"]["CarSupplyTools"].items, 5)
table.insert(ProceduralDistributions["list"]["CarSupplyTools"].items, "PaintYourRide.WireBrush")
table.insert(ProceduralDistributions["list"]["CarSupplyTools"].items, 5)

table.insert(ProceduralDistributions["list"]["CrateTools"].items, "PaintYourRide.WireBrush")
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 3)

table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "PaintYourRide.VehiclePaintingMag1")
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 1)
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "PaintYourRide.VehiclePaintingMag2")
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 1)

table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, "PaintYourRide.SprayGun")
table.insert(ProceduralDistributions["list"]["CrateMechanics"].items, 4)

table.insert(ProceduralDistributions["list"]["CrateMetalwork"].items, "PaintYourRide.WireBrush")
table.insert(ProceduralDistributions["list"]["CrateMetalwork"].items, 5)

table.insert(ProceduralDistributions["list"]["DeskGeneric"]["junk"].items, "PaintYourRide.CataloguePaintSpray")
table.insert(ProceduralDistributions["list"]["DeskGeneric"].items, 4)
table.insert(ProceduralDistributions["list"]["DeskGeneric"]["junk"].items, "PaintYourRide.CataloguePaintTints")
table.insert(ProceduralDistributions["list"]["DeskGeneric"].items, 4)

-- New in 41.60
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, "PaintYourRide.SprayGun")
table.insert(ProceduralDistributions["list"]["GarageMechanics"].items, 3)

table.insert(ProceduralDistributions["list"]["GarageMetalwork"].items, "PaintYourRide.WireBrush")
table.insert(ProceduralDistributions["list"]["GarageMetalwork"].items, 6)

table.insert(ProceduralDistributions["list"]["GarageTools"].items, "PaintYourRide.WireBrush")
table.insert(ProceduralDistributions["list"]["GarageTools"].items, 4)

table.insert(ProceduralDistributions["list"]["GigamartTools"].items, "PaintYourRide.SprayGun")
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, 3)
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, "PaintYourRide.WireBrush")
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, 3)

table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "PaintYourRide.VehiclePaintingMag1")
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 1)
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "PaintYourRide.VehiclePaintingMag2")
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 1)

table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "PaintYourRide.VehiclePaintingMag1")
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5)
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "PaintYourRide.VehiclePaintingMag2")
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5)

table.insert(ProceduralDistributions["list"]["MechanicShelfBooks"].items, "PaintYourRide.VehiclePaintingMag1")
table.insert(ProceduralDistributions["list"]["MechanicShelfBooks"].items, 2)
table.insert(ProceduralDistributions["list"]["MechanicShelfBooks"].items, "PaintYourRide.VehiclePaintingMag2")
table.insert(ProceduralDistributions["list"]["MechanicShelfBooks"].items, 2)
table.insert(ProceduralDistributions["list"]["MechanicShelfBooks"].items, "PaintYourRide.CataloguePaintSpray")
table.insert(ProceduralDistributions["list"]["MechanicShelfBooks"].items, 0.5)
table.insert(ProceduralDistributions["list"]["MechanicShelfBooks"].items, "PaintYourRide.CataloguePaintTints")
table.insert(ProceduralDistributions["list"]["MechanicShelfBooks"].items, 0.5)

table.insert(ProceduralDistributions["list"]["MechanicShelfOutfit"].items, "Glasses_SafetyGoggles")
table.insert(ProceduralDistributions["list"]["MechanicShelfOutfit"].items, 8)

table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, "PaintYourRide.SprayGun")
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, 6)
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, "PaintYourRide.WireBrush")
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, 8)

table.insert(ProceduralDistributions["list"]["PostOfficeMagazines"].items, "PaintYourRide.VehiclePaintingMag1")
table.insert(ProceduralDistributions["list"]["PostOfficeMagazines"].items, 1)
table.insert(ProceduralDistributions["list"]["PostOfficeMagazines"].items, "PaintYourRide.VehiclePaintingMag2")
table.insert(ProceduralDistributions["list"]["PostOfficeMagazines"].items, 1)

table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "PaintYourRide.VehiclePaintingMag1")
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.1)
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "PaintYourRide.VehiclePaintingMag2")
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.1)

table.insert(ProceduralDistributions["list"]["StoreShelfMechanics"].items, "PaintYourRide.VehiclePaintingMag1")
table.insert(ProceduralDistributions["list"]["StoreShelfMechanics"].items, 1)
table.insert(ProceduralDistributions["list"]["StoreShelfMechanics"].items, "PaintYourRide.VehiclePaintingMag2")
table.insert(ProceduralDistributions["list"]["StoreShelfMechanics"].items, 1)
table.insert(ProceduralDistributions["list"]["StoreShelfMechanics"].items, "PaintYourRide.SprayGun")
table.insert(ProceduralDistributions["list"]["StoreShelfMechanics"].items, 2)

table.insert(ProceduralDistributions["list"]["ToolStoreBooks"].items, "PaintYourRide.VehiclePaintingMag1")
table.insert(ProceduralDistributions["list"]["ToolStoreBooks"].items, 2)
table.insert(ProceduralDistributions["list"]["ToolStoreBooks"].items, "PaintYourRide.VehiclePaintingMag2")
table.insert(ProceduralDistributions["list"]["ToolStoreBooks"].items, 2)

table.insert(ProceduralDistributions["list"]["ToolStoreMetalwork"].items, "PaintYourRide.WireBrush")
table.insert(ProceduralDistributions["list"]["ToolStoreMetalwork"].items, 8)

table.insert(ProceduralDistributions["list"]["ToolStoreTools"].items, "PaintYourRide.SprayGun")
table.insert(ProceduralDistributions["list"]["ToolStoreTools"].items, 5)

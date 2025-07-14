require "Items/SuburbsDistributions"
require "Items/ItemPicker"

-- all
table.insert(SuburbsDistributions["all"]["postbox"].items, "PaintYourRide.VehiclePaintingMag1")
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.2)
table.insert(SuburbsDistributions["all"]["postbox"].items, "PaintYourRide.VehiclePaintingMag2")
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.2)
table.insert(SuburbsDistributions["all"]["postbox"].items, "PaintYourRide.CataloguePaintSpray")
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.5)
table.insert(SuburbsDistributions["all"]["postbox"].items, "PaintYourRide.CataloguePaintTints")
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.3)
table.insert(SuburbsDistributions["all"]["crate"].items, "PaintYourRide.AutomotiveSprayPrimer")
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5)
table.insert(SuburbsDistributions["all"]["crate"].items, "PaintYourRide.AutomotivePaintWhite")
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5)
table.insert(SuburbsDistributions["all"]["crate"].items, "PaintYourRide.BoxAutomotivePaintTints")
table.insert(SuburbsDistributions["all"]["crate"].items, 0.4)
table.insert(SuburbsDistributions["all"]["crate"].items, "PaintYourRide.BoxAutomotivePaintSprays1")
table.insert(SuburbsDistributions["all"]["crate"].items, 0.4)
table.insert(SuburbsDistributions["all"]["crate"].items, "PaintYourRide.BoxAutomotivePaintSprays2")
table.insert(SuburbsDistributions["all"]["crate"].items, 0.3)
table.insert(SuburbsDistributions["all"]["crate"].items, "PaintYourRide.BoxAutomotivePaintSprays3")
table.insert(SuburbsDistributions["all"]["crate"].items, 0.2)
table.insert(SuburbsDistributions["all"]["crate"].items, "PaintYourRide.BoxAutomotivePaintSprays4")
table.insert(SuburbsDistributions["all"]["crate"].items, 0.1)
table.insert(SuburbsDistributions["all"]["bin"].items, "PaintYourRide.CataloguePaintSpray")
table.insert(SuburbsDistributions["all"]["bin"].items, 1)
table.insert(SuburbsDistributions["all"]["bin"].items, "PaintYourRide.CataloguePaintTints")
table.insert(SuburbsDistributions["all"]["bin"].items, 1)
table.insert(SuburbsDistributions["all"]["metal_shelves"].items, "PaintYourRide.WireBrush")
table.insert(SuburbsDistributions["all"]["metal_shelves"].items, 1)
table.insert(SuburbsDistributions["all"]["metal_shelves"].items, "PaintYourRide.SprayGun")
table.insert(SuburbsDistributions["all"]["metal_shelves"].items, 0.6)

-- garagestorage
table.insert(SuburbsDistributions["garagestorage"]["metal_shelves"].procList, { name = "GarageAutomotivePaint", min=0, max=1, weightChance=80 })
table.insert(SuburbsDistributions["garagestorage"]["counter"].procList, { name = "GarageAutomotivePaint", min=0, max=1, weightChance=50 })
table.insert(SuburbsDistributions["garagestorage"]["crate"].procList, { name = "CrateAutomotivePaint", min=0, max=1, weightChance=30 })

-- mechanic
table.insert(SuburbsDistributions["mechanic"]["metal_shelves"].procList, { name = "MechanicShelfAutomotivePaint", min=0, max=2, weightChance=100 })

-- shed
table.insert(SuburbsDistributions["shed"]["metal_shelves"].procList, { name = "GarageAutomotivePaint", min=0, max=1, weightChance=80 })
table.insert(SuburbsDistributions["shed"]["counter"].procList, { name = "GarageAutomotivePaint", min=0, max=1, weightChance=50 })
table.insert(SuburbsDistributions["shed"]["crate"].procList, { name = "CrateAutomotivePaint", min=0, max=1, weightChance=60 })

-- storageunit
table.insert(SuburbsDistributions["storageunit"]["crate"].procList, { name = "CrateAutomotivePaint", min=0, max=1, weightChance=30 })
table.insert(SuburbsDistributions["storageunit"]["metal_shelves"].procList, { name = "CrateAutomotivePaint", min=0, max=1, weightChance=30 })

-- warehouse
table.insert(SuburbsDistributions["warehouse"]["crate"].procList, { name = "CrateAutomotivePaint", min=0, max=15, weightChance=100 })

-- ToolsCache1
--table.insert(SuburbsDistributions["ToolsCache1"]["ToolsBox"].items, "PaintYourRide.WireBrush")
--table.insert(SuburbsDistributions["ToolsCache1"]["ToolsBox"].items, 7)
--table.insert(SuburbsDistributions["ToolsCache1"]["counter"].items, "PaintYourRide.WireBrush")
--table.insert(SuburbsDistributions["ToolsCache1"]["counter"].items, 7)
--table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, "PaintYourRide.WireBrush")
--table.insert(SuburbsDistributions["ToolsCache1"]["Bag_DuffelBagTINT"].items, 7)
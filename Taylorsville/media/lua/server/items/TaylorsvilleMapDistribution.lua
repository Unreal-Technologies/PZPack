local function preDistributionMerge()
    table.insert(ProceduralDistributions.list.MagazineRackMaps.items, "TaylorsvilleMap");
    table.insert(ProceduralDistributions.list.MagazineRackMaps.items, 50);
end
Events.OnPreDistributionMerge.Add(preDistributionMerge);
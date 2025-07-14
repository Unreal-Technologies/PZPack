    -- =====================
    --    Custom room definitions
    -- =====================
local taylorsvilledistributionTable = {
    --
    --
    --
    petgroomer = {
        metal_shelves = {
            procedural = true,
            procList = {
                {name="PetGroomer", min=0, max=99, weightChance=100},
                    }
            },
    },
    --
    --
    --
    propanestore = {
        metal_shelves = {
            procedural = true,
            procList = {
                {name="PropaneStore", min=0, max=99, weightChance=100},
                    }
            },
        shelves = {
            procedural = true,
            procList = {
                {name="PropaneStore", min=0, max=99, weightChance=100},
                    }
            },
    },
    --
    --
    --
}
table.insert(Distributions, 2, taylorsvilledistributionTable);
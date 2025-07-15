require "Items/Distributions.lua"
require "Items/ProceduralDistributions.lua"
require "Items/SuburbsDistributions.lua"
require "Vehicles/VehicleDistributions.lua"

Distributions = Distributions or {};

local distributionTable = {

	PistolCase1Guns93 = {
        rolls = 1,
        items = {
            "Glock22", 200,
            "G22Mag", 200,
            "G22Mag", 10,
            "40Box", 50,
            "40Box", 20,
            "40Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },

    PistolCase2Guns93 = {
        rolls = 1,
        items = {
            "SW4006", 200,
            "4006Mag", 200,
            "4006Mag", 10,
            "40Box", 50,
            "40Box", 20,
            "40Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },

    PistolCase3Guns93 = {
        rolls = 1,
        items = {
            "P7M13", 200,
            "P7M13Mag", 10,
            "P7M13Mag", 200,
            "Bullets9mmBox", 50,
            "Bullets9mmBox", 20,
            "Bullets9mmBox", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },

    PistolCase4Guns93 = {
        rolls = 1,
        items = {
            "USP9", 200,
            "USP9Mag", 10,
            "USP9Mag", 200,
            "Bullets9mmBox", 50,
            "Bullets9mmBox", 20,
            "Bullets9mmBox", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },

    PistolCase5Guns93 = {
        rolls = 1,
        items = {
            "USP40", 200,
            "USP40Mag", 10,
            "USP40Mag", 200,
            "40Box", 50,
            "40Box", 20,
            "40Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },

    RevolverCase1Guns93 = {
        rolls = 1,
        items = {
            "SW625Clip", 200,
            "45Moonclip", 200,
            "45Moonclip", 10,
            "Bullets45Box", 50,
            "Bullets45Box", 20,
            "Bullets45Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },

    RevolverCase2Guns93 = {
        rolls = 1,
        items = {
            "SW29", 200,
            "Bullets44Box", 50,
            "Bullets44Box", 20,
            "Bullets44Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },

    RevolverCase3Guns93 = {
        rolls = 1,
        items = {
            "Anaconda", 200,
            "Bullets44Box", 50,
            "Bullets44Box", 20,
            "Bullets44Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },

    RifleCase1Guns93 = {
        rolls = 1,
        items = {
            "R3006Rem700", 200,
            "3006Box", 50,
            "3006Box", 20,
            "3006Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },

    RifleCase2Guns93 = {
        rolls = 1,
        items = {
            "W3006WinM70", 200,
            "3006Box", 50,
            "3006Box", 20,
            "3006Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },

    RifleCase3Guns93 = {
        rolls = 1,
        items = {
            "Brown3006BAR", 200,
            "3006BARMag", 200,
            "3006BARMag", 50,
            "3006Box", 50,
            "3006Box", 20,
            "3006Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },

    RifleCase4Guns93 = {
        rolls = 1,
        items = {
            "AR15", 200,
            "M16Mag", 200,
            "M16Mag", 50,
            "556box", 50,
            "556box", 20,
            "556box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },

    RifleCase5Guns93 = {
        rolls = 1,
        items = {
            "HK91", 200,
            "HK91Mag", 200,
            "HK91Mag", 50,
            "308Box", 50,
            "308Box", 20,
            "308Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },

    RifleCase6Guns93 = {
        rolls = 1,
        items = {
            "FAL", 200,
            "FALMag", 200,
            "FALMag", 50,
            "308Box", 50,
            "308Box", 20,
            "308Box", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
	
    ShotgunCase1Guns93 = {
        rolls = 1,
        items = {
            "Win1912", 200,
            "ShotgunShellsBox", 50,
            "ShotgunSlugsBox", 20,
            "ShotgunShellsBox", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },

    ShotgunCase2Guns93 = {
        rolls = 1,
        items = {
            "Beretta682", 200,
            "ShotgunShellsBox", 50,
            "ShotgunShellsBox", 20,
            "ShotgunShellsBox", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },

    ShotgunCase3Guns93 = {
        rolls = 1,
        items = {
            "BrownCitori", 200,
            "ShotgunShellsBox", 50,
            "ShotgunShellsBox", 20,
            "ShotgunShellsBox", 10,
        },
        junk = {
            rolls = 1,
            items = {
                
            }
        }
    },
}

table.insert(Distributions, 1, distributionTable);
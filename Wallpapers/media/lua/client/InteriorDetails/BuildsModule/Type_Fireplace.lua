if not getInteriorDetailsInstance then
  require('Fireplace/InteriorDetails_Main')
end
local InteriorDetails = getInteriorDetailsInstance()

InteriorDetails.lightBricksMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  InteriorDetails.neededMaterials = {
    {
      Material = 'Base.Plank',
      Amount = 4
    },
    {
      Material = 'Base.Nails',
      Amount = 4
    }
  }

  InteriorDetails.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 4
  }

  local _lightBricksData = InteriorDetails.getlightBricksData()

  for _, _currentList in pairs(_lightBricksData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, InteriorDetails.onBuildlightBricks, _sprite, player, _name)

    _tooltip = InteriorDetails.canBuildObject(needSkills, _option, player)

    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


InteriorDetails.getlightBricksData = function()
  local _lightBricksData = {

    { 'fixtures_fireplaces_01_8',
      'fixtures_fireplaces_01_27',
      'fixtures_fireplaces_01_10',
      'fixtures_fireplaces_01_29',
      getText("ContextMenu_Edge"),

    },
    {
		'fixtures_fireplaces_01_9',
      'fixtures_fireplaces_01_28',
      'fixtures_fireplaces_01_9',
      'fixtures_fireplaces_01_28',
      getText("ContextMenu_Center"),

    },

	
	
  }
  return _lightBricksData
end


InteriorDetails.onBuildlightBricks = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 4
  _sign.modData['need:Base.Nails'] = 4
  _sign.modData['xp:Woodwork'] = 7.5

  getCell():setDrag(_sign, player)
end

InteriorDetails.greyBricksMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  InteriorDetails.neededMaterials = {
    {
      Material = 'Base.Plank',
      Amount = 4
    },
    {
      Material = 'Base.Nails',
      Amount = 4
    }
  }

  InteriorDetails.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 4
  }

  local _greyBricksData = InteriorDetails.getgreyBricksData()

  for _, _currentList in pairs(_greyBricksData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, InteriorDetails.onBuildgreyBricks, _sprite, player, _name)

    _tooltip = InteriorDetails.canBuildObject(needSkills, _option, player)

    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


InteriorDetails.getgreyBricksData = function()
  local _greyBricksData = {
        {'fixtures_fireplaces_01_16',
      'fixtures_fireplaces_01_35',
      'fixtures_fireplaces_01_18',
      'fixtures_fireplaces_01_37',
      getText("ContextMenu_Edge"),

    },
    {
	  'fixtures_fireplaces_01_17',
      'fixtures_fireplaces_01_36',
      'fixtures_fireplaces_01_17',
      'fixtures_fireplaces_01_36',
      getText("ContextMenu_Center"),

    },

	
	
	
  }
  return _greyBricksData
end


InteriorDetails.onBuildgreyBricks = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 2
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 7.5

  getCell():setDrag(_sign, player)
end

InteriorDetails.redBricksMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  InteriorDetails.neededMaterials = {
    {
      Material = 'Base.Plank',
      Amount = 4
    },
    {
      Material = 'Base.Nails',
      Amount = 4
    }
  }

  InteriorDetails.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 4
  }

  local _redBricksData = InteriorDetails.getredBricksData()

  for _, _currentList in pairs(_redBricksData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, InteriorDetails.onBuildredBricks, _sprite, player, _name)

    _tooltip = InteriorDetails.canBuildObject(needSkills, _option, player)

    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


InteriorDetails.getredBricksData = function()
  local _redBricksData = {
        {'fixtures_fireplaces_01_11',
      'fixtures_fireplaces_01_24',
      'fixtures_fireplaces_01_13',
      'fixtures_fireplaces_01_26',
      getText("ContextMenu_Edge"),

    },
    {
		'fixtures_fireplaces_01_12',
      'fixtures_fireplaces_01_25',
      'fixtures_fireplaces_01_12',
      'fixtures_fireplaces_01_25',
      getText("ContextMenu_Center"),

    },
	
	
  }
  return _redBricksData
end


InteriorDetails.onBuildredBricks = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 2
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 7.5

  getCell():setDrag(_sign, player)
end

InteriorDetails.whiteMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  InteriorDetails.neededMaterials = {
    {
      Material = 'Base.Plank',
      Amount = 4
    },
    {
      Material = 'Base.Nails',
      Amount = 4
    }
  }

  InteriorDetails.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 4
  }

  local _whiteData = InteriorDetails.getwhiteData()

  for _, _currentList in pairs(_whiteData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, InteriorDetails.onBuildwhite, _sprite, player, _name)

    _tooltip = InteriorDetails.canBuildObject(needSkills, _option, player)

    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


InteriorDetails.getwhiteData = function()
  local _whiteData = {
        {'fixtures_fireplaces_01_19',
      'fixtures_fireplaces_01_32',
      'fixtures_fireplaces_01_21',
      'fixtures_fireplaces_01_34',
      getText("ContextMenu_Edge"),

    },
    {
		'fixtures_fireplaces_01_20',
      'fixtures_fireplaces_01_33',
      'fixtures_fireplaces_01_20',
      'fixtures_fireplaces_01_33',
      getText("ContextMenu_Center"),

    },

  }
  return _whiteData
end


InteriorDetails.onBuildwhite = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 2
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 7.5

  getCell():setDrag(_sign, player)
end

InteriorDetails.blackMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  InteriorDetails.neededMaterials = {
    {
      Material = 'Base.Plank',
      Amount = 4
    },
    {
      Material = 'Base.Nails',
      Amount = 4
    }
  }

  InteriorDetails.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 4
  }

  local _blackData = InteriorDetails.getblackData()

  for _, _currentList in pairs(_blackData) do
    _sprite = {}
    _sprite.sprite = _currentList[2]
    _sprite.northSprite = _currentList[1]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, InteriorDetails.onBuildblack, _sprite, player, _name)

    _tooltip = InteriorDetails.canBuildObject(needSkills, _option, player)

    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


InteriorDetails.getblackData = function()
  local _blackData = {
        {'fixtures_fireplaces_01_43',
      'fixtures_fireplaces_01_40',
      'fixtures_fireplaces_01_45',
      'fixtures_fireplaces_01_42',
      getText("ContextMenu_Edge"),

    },
    {
		'fixtures_fireplaces_01_44',
      'fixtures_fireplaces_01_41',
      'fixtures_fireplaces_01_44',
      'fixtures_fireplaces_01_41',
      getText("ContextMenu_Center"),

    },

	
	
	
  }
  return _blackData
end


InteriorDetails.onBuildblack = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 2
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 7.5

  getCell():setDrag(_sign, player)
end

InteriorDetails.fancyBlackMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  InteriorDetails.neededMaterials = {
    {
      Material = 'Base.Plank',
      Amount = 4
    },
    {
      Material = 'Base.Nails',
      Amount = 4
    }
  }

  InteriorDetails.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 4
  }

  local _fancyBlackData = InteriorDetails.getfancyBlackData()

  for _, _currentList in pairs(_fancyBlackData) do
    _sprite = {}
    _sprite.sprite = _currentList[2]
    _sprite.northSprite = _currentList[1]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, InteriorDetails.onBuildfancyBlack, _sprite, player, _name)

    _tooltip = InteriorDetails.canBuildObject(needSkills, _option, player)

    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


InteriorDetails.getfancyBlackData = function()
  local _fancyBlackData = {
  
  {'fixtures_fireplaces_01_51',
      'fixtures_fireplaces_01_48',
      'fixtures_fireplaces_01_53',
      'fixtures_fireplaces_01_50',
      getText("ContextMenu_Edge"),

    },
    {
		'fixtures_fireplaces_01_52',
      'fixtures_fireplaces_01_49',
      'fixtures_fireplaces_01_52',
      'fixtures_fireplaces_01_49',
      getText("ContextMenu_Center"),

    },

        
	
	
  }
  return _fancyBlackData
end


InteriorDetails.onBuildfancyBlack = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 2
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 7.5

  getCell():setDrag(_sign, player)
end
InteriorDetails.fancyWhiteMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  InteriorDetails.neededMaterials = {
    {
      Material = 'Base.Plank',
      Amount = 4
    },
    {
      Material = 'Base.Nails',
      Amount = 4
    }
  }

  InteriorDetails.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 4
  }

  local _fancyWhiteData = InteriorDetails.getfancyWhiteData()

  for _, _currentList in pairs(_fancyWhiteData) do
    _sprite = {}
    _sprite.sprite = _currentList[2]
    _sprite.northSprite = _currentList[1]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, InteriorDetails.onBuildfancyWhite, _sprite, player, _name)

    _tooltip = InteriorDetails.canBuildObject(needSkills, _option, player)

    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


InteriorDetails.getfancyWhiteData = function()
  local _fancyWhiteData = {
        {'fixtures_fireplaces_01_59',
      'fixtures_fireplaces_01_56',
      'fixtures_fireplaces_01_61',
      'fixtures_fireplaces_01_58',
      getText("ContextMenu_Edge"),

    },
    {
		'fixtures_fireplaces_01_60',
      'fixtures_fireplaces_01_57',
      'fixtures_fireplaces_01_60',
      'fixtures_fireplaces_01_57',
      getText("ContextMenu_Center"),

    },
	
  }
  return _fancyWhiteData
end


InteriorDetails.onBuildfancyWhite = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 2
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 7.5

  getCell():setDrag(_sign, player)
end

InteriorDetails.shelfMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  InteriorDetails.neededMaterials = {
    {
      Material = 'Base.Plank',
      Amount = 4
    },
    {
      Material = 'Base.Nails',
      Amount = 4
    }
  }

  InteriorDetails.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 4
  }

  local _shelfData = InteriorDetails.getshelfData()

  for _, _currentList in pairs(_shelfData) do
    _sprite = {}
    _sprite.sprite = _currentList[2]
    _sprite.northSprite = _currentList[1]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, InteriorDetails.onBuildshelf, _sprite, player, _name)

    _tooltip = InteriorDetails.canBuildObject(needSkills, _option, player)

    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


InteriorDetails.getshelfData = function()
  local _shelfData = {
        {'fixtures_fireplaces_01_14',
      'fixtures_fireplaces_01_23',
      'fixtures_fireplaces_01_22',
      'fixtures_fireplaces_01_31',
      getText("ContextMenu_Edge"),

    },
    {
		'fixtures_fireplaces_01_15',
      'fixtures_fireplaces_01_30',
      'fixtures_fireplaces_01_15',
      'fixtures_fireplaces_01_30',
      getText("ContextMenu_Center")

    },

  }
  return _shelfData
end


InteriorDetails.onBuildshelf = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 2
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 7.5

  getCell():setDrag(_sign, player)
end

InteriorDetails.fireMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  InteriorDetails.neededMaterials = {
    {
      Material = 'Base.Plank',
      Amount = 4
    },
    {
      Material = 'Base.Nails',
      Amount = 4
    }
  }

  InteriorDetails.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 4
  }

  local _fireData = InteriorDetails.getfireData()

  for _, _currentList in pairs(_fireData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
   --_sprite.eastSprite = _currentList[3]
   -- _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, InteriorDetails.onBuildfire, _sprite, player, _name)

    _tooltip = InteriorDetails.canBuildObject(needSkills, _option, player)

    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


InteriorDetails.getfireData = function()
  local _fireData = {
        {'fixtures_fireplaces_01_0',
      'fixtures_fireplaces_01_5',
      'fixtures_fireplaces_01_0',
      'fixtures_fireplaces_01_5',
       getText("ContextMenu_Single"),

    },
    {
	  'fixtures_fireplaces_01_1',
      'fixtures_fireplaces_01_3',
	  'fixtures_fireplaces_01_1',
      'fixtures_fireplaces_01_3',
      getText("ContextMenu_DoubleLEFT"),

    },
    {
	  'fixtures_fireplaces_01_2',
      'fixtures_fireplaces_01_4',
	  'fixtures_fireplaces_01_2',
      'fixtures_fireplaces_01_4',      
      getText("ContextMenu_DoubleRight"),

    },

  }
  return _fireData
end


InteriorDetails.onBuildfire = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISStove:new(sprite.sprite, sprite.northSprite, player)

  _sign.player = player
  _sign.name = name
  --_sign.eastSprite = sprite.eastSprite
  --_sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 2
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 7.5

  getCell():setDrag(_sign, player)
end


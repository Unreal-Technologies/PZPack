if not getInteriorDetailsInstance then
  require('InteriorDetails/InteriorDetails_Main')
end

local InteriorDetails = getInteriorDetailsInstance()

InteriorDetails.decoWhiteMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  InteriorDetails.neededMaterials = {
    {
      Material = 'Base.Plank',
      Amount = 1
    },
    {
      Material = 'Base.Nails',
      Amount = 2
    }
  }

  InteriorDetails.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 2
  }

  local _decoWhiteData = InteriorDetails.getDecoWhiteData()

  for _, _currentList in pairs(_decoWhiteData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
	_sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, InteriorDetails.onBuildDecoWhite, _sprite, player, _name)

    _tooltip = InteriorDetails.canBuildObject(needSkills, _option, player)
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

InteriorDetails.getDecoWhiteData = function()
  local _decoWhiteData = {

    {
      'walls_interior_detailing_01_0',
      'walls_interior_detailing_01_1',
	  'walls_interior_detailing_01_2',
      'walls_interior_detailing_01_3',
      getText("ContextMenu_ChairRailCrown"),
    },
    {
      'walls_interior_detailing_01_10',
      'walls_interior_detailing_01_11',
      'walls_interior_detailing_01_10',
      'walls_interior_detailing_01_11',
      getText("ContextMenu_ChairRailCrown_Door"),
    },
    {
      'walls_interior_detailing_01_4',
      'walls_interior_detailing_01_5',
	  'walls_interior_detailing_01_6',
      'walls_interior_detailing_01_7',
      getText("ContextMenu_BaseBoard"),
    },
    {
      'walls_interior_detailing_01_14',
      'walls_interior_detailing_01_15',
      'walls_interior_detailing_01_14',
      'walls_interior_detailing_01_15',
      getText("ContextMenu_BaseBoard_Door"),
    },
    {
      'walls_interior_detailing_01_16',
      'walls_interior_detailing_01_17',
	  'walls_interior_detailing_01_18',
      'walls_interior_detailing_01_19',
      getText("ContextMenu_BaseBoardCrown"),
    },
    {
      'walls_interior_detailing_01_26',
      'walls_interior_detailing_01_27',
      'walls_interior_detailing_01_26',
      'walls_interior_detailing_01_27',
      getText("ContextMenu_BaseBoardCrown_Door"),
    },
    {
      'walls_detailing_01_16',
      'walls_detailing_01_17',
	  'walls_detailing_01_18',
      'walls_detailing_01_19',
      getText("ContextMenu_MouldingChairRail"),
    },
    {
      'walls_detailing_01_56',
      'walls_detailing_01_57',
	  'walls_detailing_01_58',
      'walls_detailing_01_59',
      getText("ContextMenu_UpperChairRail"),
    },
    {
      'walls_detailing_01_5',
      'walls_detailing_01_6',
	  'walls_detailing_01_7',
      'walls_detailing_01_20',
      getText("ContextMenu_OrnamentalBaseboard"),
    },
    {
      'walls_detailing_01_21',
      'walls_detailing_01_22',
	  'walls_detailing_01_23',
      'walls_detailing_01_20',
      getText("ContextMenu_CurvyBaseboard"),
    },
    {
      'walls_detailing_01_61',
      'walls_detailing_01_62',
	  'walls_detailing_01_63',
      'walls_detailing_01_28',
      getText("ContextMenu_OrnamentalCrown"),
    },
    {
      'walls_detailing_01_29',
      'walls_detailing_01_30',
	  'walls_detailing_01_31',
      'walls_detailing_01_28',
      getText("ContextMenu_CurvyCrown"),
    },
    {
      'walls_detailing_01_13',
      'walls_detailing_01_14',
	  'walls_detailing_01_15',
      'walls_detailing_01_20',
      getText("ContextMenu_TileBaseboard"),
    },
	
}
  return _decoWhiteData
end


InteriorDetails.onBuildDecoWhite = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.southSprite = sprite.southSprite
  _sign.eastSprite = sprite.eastSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 1
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 2.5

  getCell():setDrag(_sign, player)
end


if not getInteriorDetailsInstance then
  require('InteriorDetails/InteriorDetails_Main')
end

local InteriorDetails = getInteriorDetailsInstance()

InteriorDetails.decoBrownMenuBuilder = function(subMenu, player)
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

  local _decoBrownData = InteriorDetails.getDecoBrownData()

  for _, _currentList in pairs(_decoBrownData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
	_sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]


    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, InteriorDetails.onBuildDecoBrown, _sprite, player, _name)

    _tooltip = InteriorDetails.canBuildObject(needSkills, _option, player)
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

InteriorDetails.getDecoBrownData = function()
  local _decoBrownData = {

    {
      'walls_interior_detailing_01_32',
      'walls_interior_detailing_01_33',
      'walls_interior_detailing_01_34',
      'walls_interior_detailing_01_35',
      getText("ContextMenu_ChairRailCrown"),
    },
    {
      'walls_interior_detailing_01_42',
      'walls_interior_detailing_01_43',
	  'walls_interior_detailing_01_42',
      'walls_interior_detailing_01_43',
      getText("ContextMenu_ChairRailCrown_Door"),
    },
    {
      'walls_interior_detailing_01_36',
      'walls_interior_detailing_01_37',
	  'walls_interior_detailing_01_38',
      'walls_interior_detailing_01_39',
      getText("ContextMenu_BaseBoard"),
    },

    {
      'walls_interior_detailing_01_46',
      'walls_interior_detailing_01_47',
      'walls_interior_detailing_01_46',
      'walls_interior_detailing_01_47',
      getText("ContextMenu_BaseBoard_Door"),
    },

    {
      'walls_detailing_01_80',
      'walls_detailing_01_81',
	  'walls_detailing_01_82',
      'walls_detailing_01_83',
      getText("ContextMenu_MouldingChairRail"),
    },
    {
      'walls_detailing_01_84',
      'walls_detailing_01_85',
	  'walls_detailing_01_85',
      'walls_detailing_01_87',
      getText("ContextMenu_UpperChairRail"),
    },
    {
      'walls_detailing_01_45',
      'walls_detailing_01_46',
	  'walls_detailing_01_47',
      'walls_detailing_01_55',
      getText("ContextMenu_TileBaseboard"),
    },
    {
      'walls_detailing_01_36',
      'walls_detailing_01_37',
	  'walls_detailing_01_38',
      'walls_detailing_01_39',
      getText("ContextMenu_TileCrown"),
    },
	
}
  return _decoBrownData
end


InteriorDetails.onBuildDecoBrown = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.northSprite = sprite.northSprite
  _sign.southSprite = sprite.southSprite
  _sign.eastSprite = sprite.eastSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 1
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 2.5

  getCell():setDrag(_sign, player)
end


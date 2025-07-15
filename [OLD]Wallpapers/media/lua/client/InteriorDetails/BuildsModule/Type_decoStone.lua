if not getInteriorDetailsInstance then
  require('InteriorDetails/InteriorDetails_Main')
end

local InteriorDetails = getInteriorDetailsInstance()

InteriorDetails.decoStoneMenuBuilder = function(subMenu, player)
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

  local _decoStoneData = InteriorDetails.getDecoStoneData()

  for _, _currentList in pairs(_decoStoneData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
	_sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, InteriorDetails.onBuildDecoStone, _sprite, player, _name)

    _tooltip = InteriorDetails.canBuildObject(needSkills, _option, player)
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

InteriorDetails.getDecoStoneData = function()
  local _decoStoneData = {

	{
      'walls_interior_detailing_01_48',
      'walls_interior_detailing_01_49',
      'walls_interior_detailing_01_50',
      'walls_interior_detailing_01_51',
      getText("ContextMenu_OrangeBrick"),
    },
    {
      'walls_interior_detailing_01_58',
      'walls_interior_detailing_01_59',
	  'walls_interior_detailing_01_58',
      'walls_interior_detailing_01_59',
      getText("ContextMenu_OrangeBrick_Door"),
    },
    {
      'walls_interior_detailing_01_96',
      'walls_interior_detailing_01_97',
	  'walls_interior_detailing_01_98',
      'walls_interior_detailing_01_99',
      getText("ContextMenu_GreyBrick"),
    },

    {
      'walls_interior_detailing_01_106',
      'walls_interior_detailing_01_107',
      'walls_interior_detailing_01_106',
      'walls_interior_detailing_01_107',
      getText("ContextMenu_GreyBrick_Door"),
    },	
	{
      'walls_interior_detailing_01_52',
      'walls_interior_detailing_01_53',
      'walls_interior_detailing_01_54',
      'walls_interior_detailing_01_55',
      getText("ContextMenu_DarkRedBrick"),
    },
    {
      'walls_interior_detailing_01_62',
      'walls_interior_detailing_01_63',
	  'walls_interior_detailing_01_62',
      'walls_interior_detailing_01_63',
      getText("ContextMenu_DarkRedBrick_Door"),
    },
    {
      'walls_interior_detailing_01_100',
      'walls_interior_detailing_01_101',
	  'walls_interior_detailing_01_102',
      'walls_interior_detailing_01_103',
      getText("ContextMenu_WhiteStone"),
    },

    {
      'walls_interior_detailing_01_110',
      'walls_interior_detailing_01_111',
      'walls_interior_detailing_01_110',
      'walls_interior_detailing_01_111',
      getText("ContextMenu_WhiteStone_Door"),
    },
	{
      'walls_interior_detailing_01_112',
      'walls_interior_detailing_01_113',
	  'walls_interior_detailing_01_114',
      'walls_interior_detailing_01_115',
      getText("ContextMenu_YellowStone"),
    },

    {
      'walls_interior_detailing_01_122',
      'walls_interior_detailing_01_123',
      'walls_interior_detailing_01_122',
      'walls_interior_detailing_01_123',
      getText("ContextMenu_YellowStone_Door"),
    },


	
}
  return _decoStoneData
end


InteriorDetails.onBuildDecoStone = function(ignoreThisArgument, sprite, player, name)
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


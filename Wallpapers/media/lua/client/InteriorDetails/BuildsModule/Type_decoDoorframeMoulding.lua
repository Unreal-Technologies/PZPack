if not getInteriorDetailsInstance then
  require('InteriorDetails/InteriorDetails_Main')
end

local InteriorDetails = getInteriorDetailsInstance()

InteriorDetails.decoDoorframeMouldingMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  InteriorDetails.neededMaterials = {
    {
      Material = 'Base.Plank',
      Amount = 3
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

  local _decoDoorframeMouldingData = InteriorDetails.getDecoDoorframeMouldingData()

  for _, _currentList in pairs(_decoDoorframeMouldingData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]

    _name = _currentList[3]

    _option = subMenu:addOption(_name, nil, InteriorDetails.onBuildDecoDoorframeMoulding, _sprite, player, _name)

    _tooltip = InteriorDetails.canBuildObject(needSkills, _option, player)
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

InteriorDetails.getDecoDoorframeMouldingData = function()
  local _decoDoorframeMouldingData = {
    {
      'fixtures_doors_frames_01_0',
      'fixtures_doors_frames_01_1',
      getText("ContextMenu_White"),
    },
    {
      'fixtures_doors_frames_01_2',
      'fixtures_doors_frames_01_3',
      getText("ContextMenu_RedWood"),
    },
    {
      'fixtures_doors_frames_01_4',
      'fixtures_doors_frames_01_5',
      getText("ContextMenu_Black"),
    },

    {
      'fixtures_doors_frames_01_6',
      'fixtures_doors_frames_01_7',
      getText("ContextMenu_Wooden"),
    },

    {
      'fixtures_doors_frames_01_8',
      'fixtures_doors_frames_01_9',
      getText("ContextMenu_DarkWooden"),
    },
 
}
  return _decoDoorframeMouldingData
end


InteriorDetails.onBuildDecoDoorframeMoulding = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.northSprite = sprite.northSprite

  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 3
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 2.5

  getCell():setDrag(_sign, player)
end


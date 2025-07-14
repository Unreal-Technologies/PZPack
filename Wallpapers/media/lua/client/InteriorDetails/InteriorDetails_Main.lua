--
-- Created by IntelliJ IDEA.
-- User: ProjectSky
-- Date: 2017/7/11
-- Time: 13:10
-- Project Zomboid More Builds Mod
--

-- pull global functions to local
local getSpecificPlayer = getSpecificPlayer
local pairs = pairs
local split = string.split
local getItemNameFromFullType = getItemNameFromFullType
local PerkFactory = PerkFactory
local getMoveableDisplayName = Translator.getMoveableDisplayName
local getSprite = getSprite
local getFirstTypeEval = getFirstTypeEval
local getItemCountFromTypeRecurse = getItemCountFromTypeRecurse
local getText = getText

local InteriorDetails = {}
InteriorDetails.NAME = 'More Builds'
InteriorDetails.AUTHOR = 'ProjectSky, SiderisAnon'
InteriorDetails.VERSION = '1.1.6'

print('Mod Loaded: ' .. InteriorDetails.NAME .. ' by ' .. InteriorDetails.AUTHOR .. ' (v' .. InteriorDetails.VERSION .. ')')

InteriorDetails.neededMaterials = {}
InteriorDetails.neededTools = {}
InteriorDetails.toolsList = {}
InteriorDetails.playerSkills = {}
InteriorDetails.textSkillsRed = {}
InteriorDetails.textSkillsGreen = {}
InteriorDetails.playerCanPlaster = false
InteriorDetails.textTooltipHeader = ' <RGB:2,2,2> <LINE> <LINE>' .. getText('Tooltip_craft_Needs') .. ' : <LINE> '
InteriorDetails.textCanRotate = '<LINE> <RGB:1,1,1>' .. getText('Tooltip_craft_pressToRotate', Keyboard.getKeyName(getCore():getKey('Rotate building')))
InteriorDetails.textPlasterRed = '<RGB:1,0,0> <LINE> <LINE>' .. getText('Tooltip_PlasterRed_Description')
InteriorDetails.textPlasterGreen = '<RGB:1,1,1> <LINE> <LINE>' .. getText('Tooltip_PlasterGreen_Description')
InteriorDetails.textPlasterNever = '<RGB:1,0,0> <LINE> <LINE>' .. getText('Tooltip_PlasterNever_Description')

InteriorDetails.textWallDescription = getText('Tooltip_Wall_Description')
InteriorDetails.textPillarDescription = getText('Tooltip_Pillar_Description')
InteriorDetails.textDoorFrameDescription = getText('Tooltip_DoorFrame_Description')
InteriorDetails.textWindowFrameDescription = getText('Tooltip_WindowFrame_Description')
InteriorDetails.textFenceDescription = getText('Tooltip_Fence_Description')
InteriorDetails.textFencePostDescription = getText('Tooltip_FencePost_Description')
InteriorDetails.textDoorGenericDescription = getText('Tooltip_craft_woodenDoorDesc')
InteriorDetails.textDoorIndustrial = getText('Tooltip_DoorIndustrial_Description')
InteriorDetails.textDoorExterior = getText('Tooltip_DoorExterior_Description')
InteriorDetails.textStairsDescription = getText('Tooltip_craft_stairsDesc')
InteriorDetails.textFloorDescription = getText('Tooltip_Floor_Description')
InteriorDetails.textBarElementDescription = getText('Tooltip_BarElement_Description')
InteriorDetails.textBarCornerDescription = getText('Tooltip_BarCorner_Description')
InteriorDetails.textTrashCanDescription = getText('Tooltip_TrashCan_Description')
InteriorDetails.textLightPoleDescription = getText('Tooltip_LightPole_Description')
InteriorDetails.textSmallTableDescription = getText('Tooltip_SmallTable_Description')
InteriorDetails.textLargeTableDescription = getText('Tooltip_LargeTable_Description')
InteriorDetails.textCouchFrontDescription = getText('Tooltip_CouchFront_Description')
InteriorDetails.textCouchRearDescription = getText('Tooltip_CouchRear_Description')
InteriorDetails.textDresserDescription = getText('Tooltip_Dresser_Description')
InteriorDetails.textBedDescription = getText('Tooltip_Bed_Description')
InteriorDetails.textFlowerBedDescription = getText('Tooltip_FlowerBed_Description')

--- 建筑技能需求定义
--- @todo: 优化结构
InteriorDetails.skillLevel = {
  simpleObject = 1,
  waterwellObject = 7,
  simpleDecoration = 1,
  landscaping = 1,
  lighting = 4,
  simpleContainer = 3,
  complexContainer = 5,
  advancedContainer = 7,
  simpleFurniture = 3,
  basicContainer = 1,
  basicFurniture = 1,
  moderateFurniture = 2,
  counterFurniture = 3,
  complexFurniture = 4,
  logObject = 0,
  floorObject = 1,
  wallObject = 2,
  doorObject = 3,
  garageDoorObject = 6,
  stairsObject = 6,
  stoneArchitecture = 5,
  metalArchitecture = 5,
  architecture = 5,
  complexArchitecture = 5,
  nearlyimpossible = 5,
  barbecueObject = 4,
  fridgeObject = 3,
  lightingObject = 2,
  generatorObject = 3,
  windowsObject = 2,
}

--- 建筑耐久定义
--- @todo: 优化结构
InteriorDetails.healthLevel = {
  stoneWall = 300,
  metalWall = 700,
  metalStairs = 400,
  woodContainer = 200,
  stoneContainer = 250,
  metalContainer = 350,
  wallDecoration = 50,
  woodenFence = 100,
  metalDoor = 700
}

--- OnFillWorldObjectContextMenu回调
--- @param player number: IsoPlayer索引
--- @param context ISContextMenu: 上下文菜单实例
--- @param worldobjects table: 世界对象表
--- @param test boolean: 如果是测试附近对象则返回true, 否则返回false
--- @todo 优化性能, ISContextMenu性能过差, 经测试, 注册300+ISContextMenu实例会导致游戏主线程冻结0.24秒左右, 这是非常严重的性能问题, 需要官方解决
InteriorDetails.OnFillWorldObjectContextMenu = function(player, context, worldobjects, test)
  if getCore():getGameMode() == 'LastStand' then
    return
  end

  if test and ISWorldObjectContextMenu.Test then
    return true
  end

	local playerObj = getSpecificPlayer(player)
	if playerObj:getVehicle() then
    return
	end

  if InteriorDetails.haveAToolToBuild(player) then

    InteriorDetails.buildSkillsList(player)

    if InteriorDetails.playerSkills["Woodwork"] > 0 or ISBuildMenu.cheat then
      InteriorDetails.playerCanPlaster = true
    else
      InteriorDetails.playerCanPlaster = false
    end
--------------------------------------------------------------------------------------------------------
    local buildMenu = context:getOptionFromName(getText("ContextMenu_Build"))
    if buildMenu then
        local subMenu       = context:getSubMenu(buildMenu.subOption)
        local _detailingOption    = subMenu:insertOptionBefore(getText("ContextMenu_Misc"), getText("ContextMenu_Mouldings"))
        local _detailingThirdTierMenu = ISContextMenu:getNew(subMenu)
        subMenu:addSubMenu(_detailingOption, _detailingThirdTierMenu)
		
		local _fireplaceOption    = subMenu:insertOptionBefore(getText("ContextMenu_Misc"), getText("ContextMenu_Fireplaces"))
        local _fireplaceThirdTierMenu = ISContextMenu:getNew(subMenu)
        subMenu:addSubMenu(_fireplaceOption, _fireplaceThirdTierMenu)
	
	local _decoWhiteOption = _detailingThirdTierMenu:addOption(getText('ContextMenu_WhiteDeco_Menu'))
    local _decoWhiteSubMenu = _detailingThirdTierMenu:getNew(_detailingThirdTierMenu)

    context:addSubMenu(_decoWhiteOption, _decoWhiteSubMenu)
    InteriorDetails.decoWhiteMenuBuilder(_decoWhiteSubMenu, player, context)
	
	local _decoBrownOption = _detailingThirdTierMenu:addOption(getText('ContextMenu_BrownDeco_Menu'))
    local _decoBrownSubMenu = _detailingThirdTierMenu:getNew(_detailingThirdTierMenu)

    context:addSubMenu(_decoBrownOption, _decoBrownSubMenu)
    InteriorDetails.decoBrownMenuBuilder(_decoBrownSubMenu, player, context)
	
	local _decoStoneOption = _detailingThirdTierMenu:addOption(getText('ContextMenu_StoneDeco_Menu'))
    local _decoStoneSubMenu = _detailingThirdTierMenu:getNew(_detailingThirdTierMenu)

    context:addSubMenu(_decoStoneOption, _decoStoneSubMenu)
    InteriorDetails.decoStoneMenuBuilder(_decoStoneSubMenu, player, context)
	
	local _decoDoorframeMouldingOption = _detailingThirdTierMenu:addOption(getText('ContextMenu_DoorframeMoulding_Menu'))
    local _decoDoorframeMouldingSubMenu = _detailingThirdTierMenu:getNew(_detailingThirdTierMenu)

    context:addSubMenu(_decoDoorframeMouldingOption, _decoDoorframeMouldingSubMenu)
    InteriorDetails.decoDoorframeMouldingMenuBuilder(_decoDoorframeMouldingSubMenu, player, context)
	
	local _lightBricksOption = _fireplaceThirdTierMenu:addOption(getText("ContextMenu_WhiteStone"))
    local _lightBricksSubMenu = _fireplaceThirdTierMenu:getNew(_fireplaceThirdTierMenu)
	
     context:addSubMenu(_lightBricksOption, _lightBricksSubMenu)
    InteriorDetails.lightBricksMenuBuilder(_lightBricksSubMenu, player, context)
	
	local _greyBricksOption = _fireplaceThirdTierMenu:addOption(getText("ContextMenu_GreyBrick"))
    local _greyBricksSubMenu = _fireplaceThirdTierMenu:getNew(_fireplaceThirdTierMenu)
	
    context:addSubMenu(_greyBricksOption, _greyBricksSubMenu)
    InteriorDetails.greyBricksMenuBuilder(_greyBricksSubMenu, player, context)
	
	local _redBricksOption = _fireplaceThirdTierMenu:addOption(getText("ContextMenu_OrangeBrick"))
    local _redBricksSubMenu = _fireplaceThirdTierMenu:getNew(_fireplaceThirdTierMenu)
	
    context:addSubMenu(_redBricksOption, _redBricksSubMenu)
    InteriorDetails.redBricksMenuBuilder(_redBricksSubMenu, player, context)

  	local _whiteOption = _fireplaceThirdTierMenu:addOption(getText("ContextMenu_White"))
    local _whiteSubMenu = _fireplaceThirdTierMenu:getNew(_fireplaceThirdTierMenu)
	
     context:addSubMenu(_whiteOption, _whiteSubMenu)
    InteriorDetails.whiteMenuBuilder(_whiteSubMenu, player, context)

  	local _blackOption = _fireplaceThirdTierMenu:addOption(getText("ContextMenu_Black"))
    local _blackSubMenu = _fireplaceThirdTierMenu:getNew(_fireplaceThirdTierMenu)
	
     context:addSubMenu(_blackOption, _blackSubMenu)
    InteriorDetails.blackMenuBuilder(_blackSubMenu, player, context)
	
	local _fancyWhiteOption = _fireplaceThirdTierMenu:addOption(getText("ContextMenu_FancyWhite"))
    local _fancyWhiteSubMenu = _fireplaceThirdTierMenu:getNew(_fireplaceThirdTierMenu)
	
    context:addSubMenu(_fancyWhiteOption, _fancyWhiteSubMenu)
    InteriorDetails.fancyWhiteMenuBuilder(_fancyWhiteSubMenu, player, context)
	  	
	local _fancyBlackOption = _fireplaceThirdTierMenu:addOption(getText("ContextMenu_FancyBlack"))
    local _fancyBlackSubMenu = _fireplaceThirdTierMenu:getNew(_fireplaceThirdTierMenu)
	
     context:addSubMenu(_fancyBlackOption, _fancyBlackSubMenu)
    InteriorDetails.fancyBlackMenuBuilder(_fancyBlackSubMenu, player, context)
	
	local _shelfOption = _fireplaceThirdTierMenu:addOption(getText("ContextMenu_Shelf"))
    local _shelfSubMenu = _fireplaceThirdTierMenu:getNew(_fireplaceThirdTierMenu)
	
    context:addSubMenu(_shelfOption, _shelfSubMenu)
    InteriorDetails.shelfMenuBuilder(_shelfSubMenu, player, context)
 
	local _fireOption = _fireplaceThirdTierMenu:addOption(getText("ContextMenu_DoubleFireplace"))
    local _fireSubMenu = _fireplaceThirdTierMenu:getNew(_fireplaceThirdTierMenu)
	
    context:addSubMenu(_fireOption, _fireSubMenu)
    InteriorDetails.fireMenuBuilder(_fireSubMenu, player, context)
	end
  end
end

--- 检查物品是否损坏
--- @param item string: 需检查的物品名称
--- @return boolean: 如果物品未损坏返回true, 否则返回false
local function predicateNotBroken(item)
  return not item:isBroken()
end

--- 获取可移动家具本地化字符串
--- @param sprite string: Sprite名称
--- @return string: 获取的本地化字符串
InteriorDetails.getMoveableDisplayName = function(sprite)
  local props = getSprite(sprite):getProperties()
  if props:Is('CustomName') then
    local name = props:Val('CustomName')
    if props:Is('GroupName') then
      name = props:Val('GroupName') .. ' ' .. name
    end
    return getMoveableDisplayName(name)
  end
end

--- 检查玩家是否拥有某些工具
--- @param player number: IsoPlayer索引
--- @return boolean: 如果满足工具条件需求则返回true否则返回false
InteriorDetails.haveAToolToBuild = function(player)
  -- 多个工具在表内添加即可 [类型] {工具1, 工具2, ...}
  InteriorDetails.toolsList['Hammer'] = {"Base.Hammer", "Base.HammerStone", "Base.BallPeenHammer", "Base.WoodenMallet", "Base.ClubHammer"}
  InteriorDetails.toolsList['Screwdriver'] = {"Base.Screwdriver"}
  InteriorDetails.toolsList['HandShovel'] = {"farming.HandShovel"}
  InteriorDetails.toolsList['Saw'] = {"Base.Saw"}
  InteriorDetails.toolsList['Spade'] = {"Base.Shovel"}
  InteriorDetails.toolsList['Needle'] = {"Base.Needle"}

  local havaTools = nil

  havaTools = InteriorDetails.getAvailableTools(player, 'Hammer')

  return havaTools or ISBuildMenu.cheat
end

--- 获取玩家库存内的可用工具
--- @param player number: IsoPlayer索引
--- @param tool string: 工具类型
--- @return InventoryItem: 获取的工具实例, 如空或已损坏返回nil
InteriorDetails.getAvailableTools = function(player, tool)
  local tools = nil
  local toolList = InteriorDetails.toolsList[tool]
  local inv = getSpecificPlayer(player):getInventory()
  for _, type in pairs (toolList) do
    tools = inv:getFirstTypeEval(type, predicateNotBroken)
    if tools then
      return tools
    end
  end
end

--- 装备主要工具
--- @param object IsoObject: IsoObject实例
--- @param player number: IsoPlayer索引
--- @param tool string: 工具类型
InteriorDetails.equipToolPrimary = function(object, player, tool)
  local tools = nil
  tools = InteriorDetails.getAvailableTools(player, tool)
  if tools then
    ISInventoryPaneContextMenu.equipWeapon(tools, true, false, player)
    object.noNeedHammer = true
  end
end

--- 装备次要工具
--- @param object Isoobject: Isoobject实例
--- @param player number: IsoPlayer索引
--- @param tool string: 工具类型
--- @info 未使用
InteriorDetails.equipToolSecondary = function(object, player, tool)
  local tools = nil
  tools = InteriorDetails.getAvailableTools(player, tool)
  if tools then
    ISInventoryPaneContextMenu.equipWeapon(tools, false, false, player)
  end
end

--- 构造技能文本
--- @param player number: IsoPlayer索引
InteriorDetails.buildSkillsList = function(player)
  local perks = PerkFactory.PerkList
  local perkID = nil
  local perkType = nil
  for i = 0, perks:size() - 1 do
    perkID = perks:get(i):getId()
    perkType = perks:get(i):getType()
    InteriorDetails.playerSkills[perkID] = getSpecificPlayer(player):getPerkLevel(perks:get(i))
    InteriorDetails.textSkillsRed[perkID] = ' <RGB:1,0,0>' .. PerkFactory.getPerkName(perkType) .. ' ' .. InteriorDetails.playerSkills[perkID] .. '/'
    InteriorDetails.textSkillsGreen[perkID] = ' <RGB:1,1,1>' .. PerkFactory.getPerkName(perkType) .. ' '
  end
end

--- 检查&构造材料提示文本
--- @param player number: IsoPlayer索引
--- @param material string: 材料类型
--- @param amount number: 需要的材料数量
--- @param tooltip ISToolTip: 工具提示实例
--- @return boolean: 如果满足检查条件则返回true否则返回false
--- @info ISBuildMenu.countMaterial性能过低, 如果玩家库存中物品过多会卡游戏主线程, 不建议使用
InteriorDetails.tooltipCheckForMaterial = function(player, material, amount, tooltip)
  local inv = getSpecificPlayer(player):getInventory()
  local type = split(material, '\\.')[2]
  local invItemCount = 0
  local groundItem = ISBuildMenu.materialOnGround
  if amount > 0 then
    invItemCount = inv:getItemCountFromTypeRecurse(material)

    if material == "Base.Nails" then
      invItemCount = invItemCount + inv:getItemCountFromTypeRecurse("Base.NailsBox") * 100
      if groundItem["Base.NailsBox"] then
        invItemCount = invItemCount + groundItem["Base.NailsBox"] * 100
      end
    end


    -- why #groundItem 0?
    for groundItemType, groundItemCount in pairs(groundItem) do
      if groundItemType == type then
        invItemCount = invItemCount + groundItemCount
      end
    end

    if invItemCount < amount then
      tooltip.description = tooltip.description .. ' <RGB:1,0,0>' .. getItemNameFromFullType(material) .. ' ' .. invItemCount .. '/' .. amount .. ' <LINE>'
      return false
    else
      tooltip.description = tooltip.description .. ' <RGB:1,1,1>' .. getItemNameFromFullType(material) .. ' ' .. invItemCount .. '/' .. amount .. ' <LINE>'
      return true
    end
  end
end

--- 检查&构造工具提示文本
--- @param player number: IsoPlayer索引
--- @param tool string: 工具类型
--- @param tooltip ISToolTip: 工具提示实例
--- @return boolean: 如果满足检查条件则返回true否则返回false
InteriorDetails.tooltipCheckForTool = function(player, tool, tooltip)
  local tools = InteriorDetails.getAvailableTools(player, tool)
  if tools then
    tooltip.description = tooltip.description .. ' <RGB:1,1,1>' .. tools:getName() .. ' <LINE>'
    return true
  else
    for _, type in pairs (InteriorDetails.toolsList[tool]) do
      tooltip.description = tooltip.description .. ' <RGB:1,0,0>' .. getItemNameFromFullType(type) .. ' <LINE>'
      return false
    end
  end
end

--- 检查是否满足建造条件
--- @param skills table: 技能等级需求表, 支持被动技能 {Woodwork = 1, Strength = 2, ...}
--- @param option ISContextMenu: 上下文菜单实例
--- @return ISToolTip: 返回工具提示实例
InteriorDetails.canBuildObject = function(skills, option, player)
  local _tooltip = ISToolTip:new()
  _tooltip:initialise()
  _tooltip:setVisible(false)
  option.toolTip = _tooltip

  local _canBuildResult = true

  _tooltip.description = InteriorDetails.textTooltipHeader

  local _currentResult = true

  for _, _currentMaterial in pairs(InteriorDetails.neededMaterials) do
    if _currentMaterial['Material'] and _currentMaterial['Amount'] then
      _currentResult = InteriorDetails.tooltipCheckForMaterial(player, _currentMaterial['Material'], _currentMaterial['Amount'], _tooltip)
    else
      _tooltip.description = _tooltip.description .. ' <RGB:1,0,0> Error in required material definition. <LINE>'
      _canBuildResult = false
    end

    if not _currentResult then
      _canBuildResult = false
    end
  end

  for _, _currentTool in pairs(InteriorDetails.neededTools) do
    _currentResult = InteriorDetails.tooltipCheckForTool(player, _currentTool, _tooltip)

    if not _currentResult then
      _canBuildResult = false
    end
  end

  for skill, level in pairs (skills) do
    if (InteriorDetails.playerSkills[skill] < level) then
      _tooltip.description = _tooltip.description .. InteriorDetails.textSkillsRed[skill]
      _canBuildResult = false
    else
      _tooltip.description = _tooltip.description .. InteriorDetails.textSkillsGreen[skill]
    end
    _tooltip.description = _tooltip.description .. level .. ' <LINE>'
  end

  if not _canBuildResult and not ISBuildMenu.cheat then
    option.onSelect = nil
    option.notAvailable = true
  end
  return _tooltip
end

--- 获取InteriorDetails实例
--- @return table: InteriorDetails table
function getInteriorDetailsInstance()
  return InteriorDetails
end

--- 注册OnFillWorldObjectContextMenu事件
-- @callback1 player number: 调用的IsoPlayer索引
-- @callback2 context ISContextMenu: 上下文菜单实例
-- @callback3 worldobjects table: 世界对象表
-- @callback4 test Boolean: 如果是测试附近对象则返回true, 否则返回false
Events.OnFillWorldObjectContextMenu.Add(InteriorDetails.OnFillWorldObjectContextMenu)
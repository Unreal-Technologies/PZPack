STAR_MODS = STAR_MODS or {}
local StackAllMod = {
	is_drop_time_to_zero = false,
	--options = nil,
}
STAR_MODS.StackAll = StackAllMod

-- SandboxVars.StackAll.MergeableSoap
local SANDBOX = SandboxVars.StackAll
if not SANDBOX then
	print('ERROR (StackAll): No sandbox file found!')
	SANDBOX = {
		MergeableSoap = false,
	}
end
StackAllMod.SANDBOX = SANDBOX


--Constants

local TXT_AND = getText("ContextMenu_EvolvedRecipe_and")
local TXT_POUR_ALL = getText("IGUI_MergeALLMod")
local TXT_COMBINE_ALL = getText("IGUI_CombineALLMod")
local TXT_GRAB_AND_POUR = getText("IGUI_MergeALLOutsideMod")
local TXT_GRAB_AND_COMBINE = getText("IGUI_CombineALLOutsideMod")
do -- Try to auto-translate
  if TXT_GRAB_AND_POUR == "Grab and Pour All" then
    TXT_GRAB_AND_POUR = getText("ContextMenu_Grab") .. " " .. TXT_AND .. " " .. TXT_POUR_ALL
  end
  if TXT_GRAB_AND_COMBINE == "Grab and Combine All" then
    TXT_GRAB_AND_COMBINE = getText("ContextMenu_Grab") .. " " .. TXT_AND .. " " .. TXT_COMBINE_ALL
  end
end

--Small injection

if LuaTimedActionNew and LuaTimedActionNew.new then
	local old_fn = LuaTimedActionNew.new
	LuaTimedActionNew.new = function(self, ...)
		if StackAllMod.is_drop_time_to_zero then
			StackAllMod.is_drop_time_to_zero = false
			self.maxTime = 0
		end
		return old_fn(self, ...)
	end
end

--[[
inv_items содержит список предметов, по которым был клик. Это всегда таблица.
Каждый элемент - это отдельная строка в инвентаре. Такая строка может быть как
отдельным предметом, так и стаком предметов с одинаковыми именами (т.е. группой).

Каждая строка - это тоже всегда таблица. Как минимум, должно быть inv_items[1] (первая строка)

inv_items[1].items - это список предметов, входящих в строку. Первый элемент не считается и всегда
равен второму. То есть если это отдельный предмет, то в этой таблице ровно два одинаковых элемента.
Таким образом, счёт начинается с 2.

inv_items[1].count - соответственно, количество предметов в строке плюс 1. Единица добавляется,
потому что первый элемент в items является дублем второго.

Прочее:
inv_items[1].equipped - (очевидно, находится ли строка в секции одетых предметов).
inv_items[1].invPanel - данные по координатам и расположению на экране.
inv_items[1].name - название строки.
inv_items[1].cat - название категории.
inv_items[1].weight - суммарный вес строки.

]]

local function checkNotFull(item) -- checks if item is not full
	return item:getCurrentUsesFloat() < 1
end

local function listToArr(list,arr)
	arr = arr or {}
	local limit = list:size()-1
	for i=0,limit do
		table.insert(arr,list:get(i))
	end
	return arr
end

local _is_outside, _is_backpack --aside return values
local function checkNeedConsolidate(player, item, typ)
	local is_soap = typ == "Base.Soap2" and StackAllMod.SANDBOX.MergeableSoap print('is_soap=', is_soap)
	if not (instanceof(item, "DrainableComboItem")
		and (item:canConsolidate() or is_soap)
	)
	then
		return false
	end
	local inv = player:getInventory()
	local container = item:getContainer()
	local is_in_inventory = container == inv
	local is_owner = container:isInCharacterInventory(player)
	if is_soap then
		local arr
		if is_in_inventory then
			arr = listToArr(inv:getAllType("Base.Soap2"))
		elseif not is_owner then
			_is_outside = true
			arr = listToArr(container:getAllType("Base.Soap2"))
			listToArr(inv:getAllType("Base.Soap2"),arr)
		else
			_is_backpack = true
			arr = listToArr(inv:getAllTypeRecurse("Base.Soap2"))
		end
		--print("size=",#arr)
		local min1, min2 = 99,99
		for k,item in pairs(arr) do
			local delta = item:getCurrentUsesFloat()
			if delta < 1 then
				if delta < min1 then
					min2 = min1
					min1 = delta
				elseif min2 == 99 then
					min2 = delta
				end
				if min1 + min2 < 0.9999 then
					return true
				end
			end
		end
		--print("min-min=",min1," ",min2)
	elseif is_in_inventory then --don't touch backpacks
		return inv:getSomeTypeEval(typ,checkNotFull,2):size() == 2
	elseif not is_owner then --outside of backpacks
		_is_outside = true
		local cnt_in_container = container:getSomeTypeEval(typ,checkNotFull,2):size()
		if cnt_in_container > 0 then
			local cnt_in_inv = inv:getSomeTypeEval(typ,checkNotFull,2):size()
			return cnt_in_container + cnt_in_inv >= 2
		end
	else
		_is_backpack = true
		return inv:getSomeTypeEvalRecurse(typ,checkNotFull,2):size() == 2
	end
	return false
end

function ConsolidateAll(player, type_consolidate, is_outside, container)
	local inv = player:getInventory()
	--move first
	for typ,some_item in pairs(type_consolidate) do
		if is_outside and container then -- move from the container to the inventory
			local list = container:getSomeTypeEval(typ,checkNotFull,99999)
			local limit = list:size()-1
			for i=0,limit do
				local item = list:get(i)
				if item:getContainer() ~= inv then --print("move from container")
					ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, container, inv))
				end
			end
		elseif _is_backpack then -- move from all the bags to the inventory
			inv:getSomeTypeEvalRecurse(typ,function(item)
				if item:getCurrentUsesFloat() < 1 then
					local container = item:getContainer()
					if container ~= inv then --print("move from bag")
						ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, container, inv))
					end
				end
				return false
			end,99999)
		end
	end
	-- Merge
	--print("merge")
	StackAllMod.is_drop_time_to_zero = true
	ISTimedActionQueue.add(ISStackAllMod:new(player, type_consolidate)) 

end --Base.PillsVitamins


local invContextMenu1 = function(_player, context, inv_items)
	local player = getSpecificPlayer(_player)
	local playerInv = player:getInventory()
	
	_is_outside = false
	_is_backpack = false
	local is_combine = false -- no by default, but yes if any is not liquid
	local type_done = {}
	local type_consolidate = nil --table
	local container = nil
	
	-- inventory item list
	for i,v in pairs(inv_items) do --разбираем строки в инвентаре
		local item = nil
		if type(v) == 'table' and v.items and #v.items > 1 then -- клик по строке или группе
			item = v.items[2] --считаем только первый элемент группы (типа оптимизация)
		elseif type(v) == 'userdata' then --иначе клик по отдельному предмету внутри группы
			--Когда группа раскрыта, то название самой группы игнорируется, а все предметы в ней считаются отдельными строками
			item = v
		else
			--error
		end
		if item then
			local typ = item:getFullType()
			if not type_done[typ] then
				type_done[typ] = true
				if checkNeedConsolidate(player, item, typ) then
					if type_consolidate == nil then
						type_consolidate = {}
					end
					type_consolidate[typ] = item
					container = item:getContainer()
					if item.getConsolidateOption and item:getConsolidateOption() == "ContextMenu_Merge" then
						is_combine = true
					end
				end
			end
		end
	end
	
	if type_consolidate then
		local name = is_combine and (_is_outside and TXT_GRAB_AND_COMBINE or TXT_COMBINE_ALL)
			or (_is_outside and TXT_GRAB_AND_POUR or TXT_POUR_ALL)
		context:addOption(name, player, ConsolidateAll, type_consolidate, _is_outside, container)
	end
end
Events.OnFillInventoryObjectContextMenu.Add(invContextMenu1);


--Mergeable soap

-- These are the settings.

--[[
LOCAL SETTINGS 42
local options = PZAPI.ModOptions:create("StackAll", "Stack All")
local config = {
  mergeable_soap = options:addTickBox("mergeable_soap", getText("UI_options_SA_MergeableSoap"), false, getText("UI_options_SA_MergeableSoap_tooltip"))
}
StackAllMod.options = config
if isClient() then
  config.mergeable_soap:setEnabled(false) -- only sandbox on a server
  -- jj: могут быть проблемы с инициализацией, отображением, синхронизацией
  config.mergeable_soap.getValue = function()
    return true
  end
  Events.OnGameStart.Add(function()
    -- jj
    config.mergeable_soap:setValue(true) --dirty
  end)
end
--

--[[
LOCAL SETTINGS 41
local SETTINGS = {
	options = { 
		mergeable_soap = false,
	},
	names = {
		mergeable_soap = "IGUI_SA_MergeableSoap",
    box2 = "Second Box",
	},
	mod_id = "StackAll",
	mod_shortname = "Stack All",
}
StackAllMod.options = SETTINGS.options

-- Connecting the settings to the menu, so user can change them.
if ModOptions and ModOptions.getInstance then
	ModOptions:getInstance(SETTINGS)

	local mergeable_soap = SETTINGS:getData("mergeable_soap")
	mergeable_soap.tooltip = "IGUI_SA_MergeableSoap_tooltip"
end
--]]





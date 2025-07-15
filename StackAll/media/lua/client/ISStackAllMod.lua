--require "TimedActions/ISBaseTimedAction"
ISStackAllMod = ISBaseTimedAction:derive("ISStackAllMod");

local onConsolidate = ISInventoryPaneContextMenu.onConsolidate or function(drainable, intoItem, player)
	ISTimedActionQueue.add(ISConsolidateDrainable:new(player, drainable, intoItem, 90));
end

function ISStackAllMod:isValid()
	return true
end

function ISStackAllMod:update()
	--self.item:setJobDelta(self:getJobDelta());
end

function ISStackAllMod:start()
	--self.item:setJobType(getText("IGUI_JobType_PourIn"));
end

function ISStackAllMod:stop()
	ISBaseTimedAction.stop(self);
end

--combine without segmentation
local function getSoapAlgorithm(inv,typ)
	local min_delta = 9999
	local max_delta = -9999
	local min, max
	local items = {}
	local delta = {}
	inv:getSomeTypeEval(typ,function(item)
		local used_delta = item:getUsedDelta()
		if used_delta < 1 then
			table.insert(items,item)
			delta[item] = used_delta
		end
		return false
	end,99999) --print("minmax = ",min_delta," ",max_delta)
	local cnt = #items
	if cnt < 2 then
		return
	end
	table.sort(items,function(a,b)
		return delta[a] > delta[b]
	end)
	min = items[cnt]
	min_delta = delta[min]
	for i=1,cnt-1 do
		max = items[i]
		max_delta = delta[max]
		if max_delta + min_delta < 0.9999 then
			return min, max, min_delta, max_delta
		end
	end
end

function ISStackAllMod:perform() --print('perform')
	-- needed to remove from queue / start next.
	--self.item:setJobDelta(0.0);
	-- Add new actions
	ISBaseTimedAction.perform(self);
	local inv = self.character:getInventory()
	local old_min, old_max
	for typ,some_item in pairs(self.arr) do --print("typ = ",typ)
		local min_delta = 9999
		local max_delta = -9999
		local min, max
		if (typ == "Base.Soap2" and STAR_MODS.StackAll.options.mergeable_soap) then
			min, max, min_delta, max_delta = getSoapAlgorithm(inv, typ)
		else
			inv:getSomeTypeEval(typ,function(item)
				local used_delta = item:getUsedDelta()
				if used_delta < 1 then
					if used_delta < min_delta then
						min_delta = used_delta
						min = item
					end
					if used_delta >= max_delta then
						max_delta = used_delta
						max = item
					end
				end
			end,99999) --print("minmax = ",min_delta," ",max_delta)
		end
		if min and max and min ~= max then
			if min == old_min and old_max == max then --error
				print("ERROR (Stack all): Pour action doesn't work as expected!")
				break
			end
			old_min = min
			old_max = max
			local player_num = self.character:getPlayerNum()
			onConsolidate(min, max, player_num) --pour
			STAR_MODS.StackAll.is_drop_time_to_zero = true
			ISTimedActionQueue.add(ISStackAllMod:new(self.character, self.arr)) --and check again
			break
		end
		self.arr[typ] = nil --remove this type and try next
	end
end

--time==100 ~ 2.1 seconds
function ISStackAllMod:new(player, type_consolidate) --print('create action!')
	local o = {}
	setmetatable(o, self)
	self.__index = self;
	o.character = player;
	o.arr = type_consolidate
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 0
	return o;
end

--------------------------------------------------------------------------------------------------
--		----	  |			  |			|		 |				|    --    |      ----			--
--		----	  |			  |			|		 |				|    --	   |      ----			--
--		----	  |		-------	   -----|	 ---------		-----          -      ----	   -------
--		----	  |			---			|		 -----		------        --      ----			--
--		----	  |			---			|		 -----		-------	 	 ---      ----			--
--		----	  |		-------	   ----------	 -----		-------		 ---      ----	   -------
--			|	  |		-------			|		 -----		-------		 ---		  |			--
--			|	  |		-------			|	 	 -----		-------		 ---		  |			--
--------------------------------------------------------------------------------------------------

require "Properties/Player/CleaningSkill"
require "Properties/Player/AdminTestCM"
require "Helper/ContextHelper"

local function getAnyInteractionConditions(player)

	local thisPlayer = getSpecificPlayer(player)

	if thisPlayer:getPerkLevel(Perks.Meditation) == 10 then
		return true
	end


	return false
end

local function doSelfContextOptions(player, context, worldobjects, DebugBuildOption)

	if getSpecificPlayer(player):hasTimedActions() then return; end

	local SelfContextNames = LSGetContextOptions(player,"contextSelfTable")
	local otherPlayer, otherPlayerIsAvailable, InteractBuildOption

	if getAnyInteractionConditions(player) then
		otherPlayer, otherPlayerIsAvailable, InteractBuildOption = CanSeeTargetPlayer(worldobjects, player, context)
	end
	--sendClientCommand(getSpecificPlayer(player), "LS", "LSSCTest", {SelfContextNames})
	--local thisPlayer = getSpecificPlayer(player)
	--local TargetID = thisPlayer:getOnlineID()
	--local PlayerName = tostring(thisPlayer:getUsername())
	--local startImmediately
	--local LSSKAction = require("TimedActions/LSSKAction")
	--sendClientCommand(thisPlayer, "LS", "InteractionStart", {TargetID, PlayerName, LSSKAction, startImmediately, "SKmeditation"})

	if SelfContextNames and (#SelfContextNames > 0) then
		for k,v in pairs(SelfContextNames) do
			--print(tostring(v.contextname)); print(v.itemA); print(v.itemB); print(v.clothing); if v.isdebug then print("isdebug TRUE") else print("isdebug FALSE"); end; if v.ismp then print("ismp TRUE") else print("ismp FALSE"); end		
			if (v.contextname) and (not v.isdebug) and (v.itemA == "none") and (v.itemB == "none") and (v.clothing == "none") and not v.ismp then
				--print(tostring(v.contextname) .. "... in Option 1")
				v.contextname.doBuildMenu(player, context, worldobjects, DebugBuildOption)
			elseif (v.contextname) and (v.isdebug and (isAdmin() or isDebugEnabled())) and (v.itemA == "none") and (v.itemB == "none") and (v.clothing == "none") and not v.ismp then
				--print(tostring(v.contextname) .. "... in Option 2")
				v.contextname.doBuildMenu(player, context, worldobjects, DebugBuildOption)
			elseif (v.contextname) and (not v.isdebug) and (v.itemA == "none") and (v.itemB == "none") and (v.clothing == "none") and (v.ismp) and (otherPlayer) and (otherPlayerIsAvailable) then
				--print(tostring(v.contextname) .. "... in Option 3")
				v.contextname.doBuildMenu(player, context, worldobjects, otherPlayer, InteractBuildOption, DebugBuildOption)
			--else
				--print(tostring(v.contextname) .. "... could not find Option")
			end
		end
	end

end

local function doPrimaryHandItemContextOption(player, context, worldobjects, Item, ItemName, contextName)

	if contextName then
		contextName.doBuildMenu(player, context, worldobjects, Item, ItemName)
	end

end

local function isItemFromList(item, listItem)
	if (item == listItem) or (luautils.stringStarts(item, listItem)) or (string.find(item, listItem)) then return true; end
	return false
end

local function getPrimaryHandItemContextName(player, context, worldobjects)

	local thisPlayer = getSpecificPlayer(player)
	if not thisPlayer:getPrimaryHandItem() then return; end
	local ItemNames = LSGetContextOptions(player,"contextItemTable")

	if ItemNames and (#ItemNames > 0) then
		for k,v in pairs(ItemNames) do
			if isItemFromList(thisPlayer:getPrimaryHandItem():getFullType(), v.name) and ((v.cat == "all") or (v.cat == "WO")) then
				doPrimaryHandItemContextOption(player, context, worldobjects, thisPlayer:getPrimaryHandItem(), v.name, v.contextname)
				break
			end
		end
	end
end

local function getSecondObject(worldobjects, secondObjectName)

	local secondObject

	local objects = {}
	for _,object in ipairs(worldobjects) do
		local square = object:getSquare()
		if square then
			for i=1,square:getObjects():size() do
				local thisObject = square:getObjects():get(i-1)

				local thisSprite = thisObject:getSprite()
				
				if thisSprite then
				
					local properties = thisObject:getSprite():getProperties()

					if properties then
						local groupName = nil
						local customName = nil
					
						if properties:Is("GroupName") then
							groupName = properties:Val("GroupName")
							--print("GroupName: " .. groupName);
						end
					
						if properties:Is("CustomName") then
							customName = properties:Val("CustomName")
							--print("CustomName: " .. customName);
						end
						
						if customName and (customName == secondObjectName) then
							secondObject = thisObject
							break
						end
					end
				end
			end
			if secondObject then break; end
		end
	end

	return secondObject
end

local function getContextName(player, customName, groupName, worldobjects)

	local contextName
	local secondObject
	local WONames = LSGetContextOptions(player,"contextCGTable")
	--if customName and (customName == "Mirror") then print("CONTEXTNAME IS MIRROR"); end
	if WONames and (#WONames > 0) then
		--print("LSContextBuild getContextName")
		for k,v in pairs(WONames) do
			--print("getContextName customName and groupName"..v.customname.." and "..v.groupname)
			--if customName == v.customname then print("getContextName customName OK"); end; if groupName == v.groupname then print("getContextName groupname OK"); end
			if ((customName == v.customname) or (v.customname == "none")) and ((groupName == v.groupname) or (v.groupname == "none")) then
				--print("LSContextBuild found single")
				if v.multiple ~= "single" then
					secondObject = getSecondObject(worldobjects, v.multiple)
				end
				contextName = v.contextname
				break
			end
		end
	end

	return contextName, secondObject
end

local function getSecondObjectFromSprite(worldobjects, secondObjectName)

	local secondObject

	local objects = {}
	for _,object in ipairs(worldobjects) do
		local square = object:getSquare()
		if square then
			for i=1,square:getObjects():size() do
				local thisObject = square:getObjects():get(i-1)
				local thisSprite = thisObject:getSprite()
				
				if thisSprite then
					local thisSpriteName
					if thisSprite:getName() then
						thisSpriteName = thisSprite:getName()
						--print("Sprite Name is " .. spriteName)
					end
					if thisSpriteName and (thisSpriteName == secondObjectName) then
						secondObject = thisObject
						break
					end
				end
			end
			if secondObject then break; end
		end
	end

	return secondObject
end

local function getContextNameFromSprite(spriteName, worldobjects)

	local contextName, secondSpriteName, secondObject
	if (string.find(spriteName, "LS_Chairs")) then return LSSitCheckContextMenu, false, false; end 
	local WOSNames = require("Properties/ContextSNames")
	--if customName and (customName == "Mirror") then print("CONTEXTNAME IS MIRROR"); end
	if WOSNames and (#WOSNames > 0) then
		for k,v in pairs(WOSNames) do
			if (spriteName == v.spritename) and (v.multiple == "single") then
				contextName = v.contextname
				if v.secondspritename ~= "none" then secondSpriteName = v.secondspritename; end
				break
			elseif (spriteName == v.spritename) and (v.multiple ~= "single") then
				secondObject = getSecondObjectFromSprite(worldobjects, v.multiple)
				if secondObject then
					contextName = v.contextname
					if v.secondspritename ~= "none" then secondSpriteName = v.secondspritename; end
					break
				end
			end
		end
	end

	return contextName, secondSpriteName, secondObject
end


local function doContextOption(player, context, worldobjects, thisObject, spriteName, customName, groupName, contextName, secondObject, DebugBuildOption)

--	if contextName == "hygiene" and ShowerContextMenu then
--		ShowerContextMenu.doBuildMenu(player, context, worldobjects, thisObject, spriteName, customName, groupName)
--	elseif contextName == "bladderToilet" and ToiletContextMenu then
--		ToiletContextMenu.doBuildMenu(player, context, worldobjects, thisObject, spriteName, customName, groupName)
--	elseif contextName == "hygieneCabinet" and ToiletContextMenu then
--		CabinetContextMenu.doBuildMenu(player, context, worldobjects, thisObject, spriteName, customName, groupName, secondObject)
--	end

	if contextName and secondObject then
		contextName.doBuildMenu(player, context, worldobjects, thisObject, spriteName, customName, groupName, DebugBuildOption, secondObject)
	elseif contextName then
		contextName.doBuildMenu(player, context, worldobjects, thisObject, spriteName, customName, groupName, DebugBuildOption)
	end

end

local function doAltContextBuild(player, thisPlayer, context, worldobjects, square, DebugBuildOption)

	local contextName, secondObject

  	for x = square:getX()-0.5,square:getX()+0.5 do
		for y = square:getY()-0.5,square:getY()+0.5 do
			local gridSquare = getCell():getGridSquare(x,y,thisPlayer:getZ())
			if gridSquare then
				for i=0,gridSquare:getObjects():size()-1 do
					local thisObject = gridSquare:getObjects():get(i);
					if thisObject then
						local sprite
						local thisSprite
						local attachedsprite = thisObject:getAttachedAnimSprite()
						if attachedsprite then
							for n=1,attachedsprite:size() do
								sprite = attachedsprite:get(n-1)
								if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and 
								(luautils.stringStarts(sprite:getParentSprite():getName(), "walls_decoration")) then
									thisSprite = sprite:getParentSprite()
									--if thisSprite:getName() then print("Sprite Name is " .. thisSprite:getName()); end
									break
								end
							end
						end
						if thisSprite then
							local properties = thisSprite:getProperties()
							if properties then
								local groupName = nil
								local customName = nil
								local thisSpriteName = nil
					
								if thisSprite:getName() then
									thisSpriteName = thisSprite:getName()
									--print("Sprite Name is " .. thisSpriteName)
								end
					
								if properties:Is("GroupName") then
									groupName = properties:Val("GroupName")
									--print("GroupName: " .. groupName);
								end
					
								if properties:Is("CustomName") then
									customName = properties:Val("CustomName")
									--if customName and (customName == "Mirror") then print("CUSTOMNAME IS MIRROR"); end
									--print("CustomName: " .. customName);
								end

									if customName or groupName then
										contextName, secondObject = getContextName(player, customName, groupName, worldobjects)
									if contextName then
										doContextOption(player, context, worldobjects, thisObject, thisSpriteName, customName, groupName, contextName, secondObject, DebugBuildOption)
										break
									end
								end
							end
						end
					end
				end
			end
			if contextName then break; end
		end
		if contextName then break; end
	end

end

function LSContextBuild(player, context, worldobjects)

	local thisPlayer = getSpecificPlayer(player)
	if thisPlayer:isDead() then return; end

	local DebugBuildOption

	if isAdmin() or isDebugEnabled() then

		local DebugContextMain = context:addOption(getText("ContextMenu_LSDebug_Main"));
		DebugContextMain.iconTexture = getTexture('media/ui/BugIcon.png')

		DebugBuildOption = ISContextMenu:getNew(context);
		context:addSubMenu(DebugContextMain, DebugBuildOption)

	end

	local contextName, secondObject

	local objects = {}
	local square
	for _,object in ipairs(worldobjects) do
		square = object:getSquare()
		if square then
			for i=1,square:getObjects():size() do
				--print("FOUND OBJECT")
				local thisObject = square:getObjects():get(i-1)
				local thisSpriteName, thisSprite, groupName, customName = false, thisObject:getSprite(), false, false
				--if thisObject:getName() then print("thisObject Name is " .. thisObject:getName()); end
				--if thisObject:getObjectName() then print("thisObject getObjectName is " .. thisObject:getObjectName()); end
				--if thisObject:getSpriteName() then print("thisObject getSpriteName is " .. thisObject:getSpriteName()); end
				--if thisObject:getTextureName() then print("thisObject getTextureName is " .. thisObject:getTextureName()); end

				if thisSprite then
					if thisSprite:getName() then
						thisSpriteName = thisSprite:getName()
						--print("LSContextBuild Sprite Name is " .. thisSpriteName)
					end
					local properties = thisObject:getSprite():getProperties()
					if properties ~= nil then

						if properties:Is("GroupName") then
							groupName = properties:Val("GroupName")
							--print("LSContextBuild GroupName: " .. groupName);
						end
					
						if properties:Is("CustomName") then
							customName = properties:Val("CustomName")
							--print("LSContextBuild CustomName: " .. customName);
						end
						
						if customName or groupName then
							--print("LSContextBuild getContextName")
							contextName, secondObject = getContextName(player, customName, groupName, worldobjects)
							if contextName then
								--print("LSContextBuild doContextOption")
								doContextOption(player, context, worldobjects, thisObject, thisSpriteName, customName, groupName, contextName, secondObject, DebugBuildOption)
								break
							end
						end
					end
				end
				thisSpriteName = thisObject:getSpriteName()
				if not thisSpriteName then thisSpriteName = thisObject:getTextureName(); end
				if thisSpriteName then
					contextName, customName, secondObject = getContextNameFromSprite(thisSpriteName, worldobjects)
					if contextName then
						doContextOption(player, context, worldobjects, thisObject, thisSpriteName, customName, groupName, contextName, secondObject, DebugBuildOption)
						break
					end
				end
			end
			if contextName then break; end
		end
	end

	if thisPlayer:getPrimaryHandItem() then
		getPrimaryHandItemContextName(player, context, worldobjects)
	end
	
	if square and not contextName then doAltContextBuild(player, thisPlayer, context, worldobjects, square, DebugBuildOption); end
	doSelfContextOptions(player, context, worldobjects, DebugBuildOption)
	
end

Events.OnFillWorldObjectContextMenu.Add(LSContextBuild)

local function doInventoryItemContextOption(player, context, items, item, contextName, isHotbar)
	if contextName then
		if isHotbar then
			contextName.doHotbarMenu(player, context, items, item)
		else
			contextName.doInventoryMenu(player, context, items, item)
		end
	end
end

function LSContextBuildItemPreFillInventory(player, context, items)
	local thisPlayer = getSpecificPlayer(player)
	local invItems = ISInventoryPane.getActualItems(items)
	local isItem
	local ItemNames = LSGetContextOptions(player,"contextItemTable")
	if ItemNames and (#ItemNames > 0) then
		for k,v in pairs(ItemNames) do
			for i,item in ipairs(invItems) do
				if isItemFromList(item:getFullType(), v.name) and ((v.cat == "all") or (v.cat == "PF")) then
					doInventoryItemContextOption(player, context, items, item, v.contextname, false)
					break
				end
			end
			if isItem then break; end
		end
	end
end

function LSContextBuildItemFillInventory(player, context, items)
	local thisPlayer = getSpecificPlayer(player)
	local invItems = ISInventoryPane.getActualItems(items)
	local isItem
	local ItemNames = LSGetContextOptions(player,"contextItemTable")
	if ItemNames and (#ItemNames > 0) then
		for k,v in pairs(ItemNames) do
			for i,item in ipairs(invItems) do
				if isItemFromList(item:getFullType(), v.name) and ((v.cat == "all") or (v.cat == "FI")) then
					doInventoryItemContextOption(player, context, items, item, v.contextname, true)
					break
				end
			end
			if isItem then break; end
		end
	end
end

Events.OnPreFillInventoryObjectContextMenu.Add(LSContextBuildItemPreFillInventory)
Events.OnFillInventoryObjectContextMenu.Add(LSContextBuildItemFillInventory)
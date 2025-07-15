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

local LS_Commands = {}


LS_Commands["LSSCTest"] = function(_, arg)

    local Argument = arg[1]


	if not Argument then
		--print("server received LSSCTest from client and Argument is nil")
	else
		--print("server received LSSCTest from client")
	end

end

LS_Commands["InteractionStart"] = function(_, arg)

    local Target = getPlayerByOnlineID(arg[1])
    local Target_id = arg[1]
   -- local Source = arg[2]
	local Source = arg[2]
    --local SourceX = arg[3]
    --local SourceY = arg[4]
	local Interaction = arg[3]
	local IsClose = arg[4]
	local actionArg = arg[5]
	--print("server received InteractionStart from client and is sending the command")
   -- sendServerCommand(Target, "LS", "WasAskedToInteract", {Target_id, Source, SourceX, SourceY, Interaction, IsClose, actionArg})
    sendServerCommand(Target, "LS", "WasAskedToInteract", {Target_id, Source, Interaction, IsClose, actionArg})
end

LS_Commands["StopOrStartInteraction"] = function(_, arg)

    local Target = getPlayerByOnlineID(arg[1])
    local Target_id = arg[1]
	local InteractionState = arg[2]
	--print("server received StopOrStartInteraction from client and is sending the command")
    sendServerCommand(Target, "LS", "ChangeInteractionState", {Target_id, InteractionState})

end

LS_Commands["makeNauseous"] = function(_, arg)
    local Target = getPlayerByOnlineID(arg[1])
    local Target_id = arg[1]
    sendServerCommand(Target, "LS", "makeNauseous", {Target_id})
end

LS_Commands["SendGetEmbarrassed"] = function(_, arg)

    local Target = getPlayerByOnlineID(arg[1])
    local Target_id = arg[1]
	--print("server received SendGetEmbarrassed from client and is sending the command")
    sendServerCommand(Target, "LS", "GetEmbarrassed", {Target_id})

end

LS_Commands["AddDirtPuddle"] = function(_, arg)
	LSServerCommandHandler("CreateDirtPuddle", arg)
end

LS_Commands["DebugAddLitter"] = function(_, arg)

    local Sx = arg[1]
    local Sy = arg[2]
	local Sz = arg[3]
	local SolidOrOverlay = arg[4]
	local LitterSprite = arg[5]
	local AvailableFloorList = {}
	local targetFloor
	local sSquare = getCell():getGridSquare(Sx, Sy, Sz)

  	for x = Sx-1,Sx+1 do---get x range
		for y = Sy-1,Sy+1 do----get y range

			local thisSquare = getCell():getGridSquare(x, y, Sz)---get grid square (our radius)
        
			if thisSquare and sSquare and thisSquare:getRoom() == sSquare:getRoom() and thisSquare:isOutside() == sSquare:isOutside() and thisSquare:isInARoom() and thisSquare:getFloor() and not 
			thisSquare:isSolid() and not thisSquare:isSolidTrans() then
            
			for i=0,thisSquare:getObjects():size()-1 do-----------search objects for each square on the radius (floor counts as an object)
				local ThisObject = thisSquare:getObjects():get(i);
				if instanceof(ThisObject, "IsoObject") then
				local object = ThisObject
				local hasSolidL = false
				if object then--solid litter is the result of direct actions and as such can happen anywhere the action takes place
					local hasOverlayL = false
					local attachedsprite = object:getAttachedAnimSprite()
					if object:getTextureName() and
					(luautils.stringStarts(object:getTextureName(), "overlay_messages") or 
					luautils.stringStarts(object:getTextureName(), "overlay_graffiti") or 
					luautils.stringStarts(object:getTextureName(), "floors_burnt") or 
					luautils.stringStarts(object:getTextureName(), "overlay_blood") or 
					luautils.stringStarts(object:getTextureName(), "blood_floor") or
					luautils.stringStarts(object:getTextureName(), "overlay_grime") or 
					--luautils.stringStarts(object:getTextureName(), "trash_") or 
					luautils.stringStarts(object:getTextureName(), "trash&junk") or 
					luautils.stringStarts(object:getTextureName(), "d_floorleaves") or 
					luautils.stringStarts(object:getTextureName(), "d_trash")) then-----------if object already has solid litter then do not add more
						hasSolidL = true
					end
					if object:getOverlaySprite() and object:getOverlaySprite():getName() and
					(luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_messages") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_graffiti") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "floors_burnt") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_blood") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "blood_floor") or
					luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_grime") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "trash_") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "trash&junk") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "d_floorleaves") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "d_trash") or
					luautils.stringStarts(object:getOverlaySprite():getName(), "LS_HScraps") or
					luautils.stringStarts(object:getOverlaySprite():getName(), "LS_Scraps")) then-----------if object already has overlay litter then do not add more
						hasOverlayL = true
					end
					if object and attachedsprite and object:isFloor() then--overlays such as dirt and grime almost always occur based on random factors and movement so it only happens indoors
						for n=1,attachedsprite:size() do
							local sprite = attachedsprite:get(n-1)
							if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and
							(luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_messages") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_graffiti") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "floors_burnt") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_blood") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "blood_floor") or
							luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_grime") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "trash_") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "trash&junk") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "d_floorleaves") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "LS_HScraps") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "d_trash")) then-----------if object already has overlay litter then do not add more
								hasOverlayL = true
							end
						end
								
					end
					if SolidOrOverlay == 2 and not hasOverlayL then
						table.insert(AvailableFloorList, object)
					end
				end
					if SolidOrOverlay == 1 and not hasSolidL then
						table.insert(AvailableFloorList, thisSquare)
					end
					
				end
				end
				
			end
			
		end
		
	end

	if #AvailableFloorList > 0 then
		local randomTile = ZombRand(#AvailableFloorList) + 1
		targetFloor = AvailableFloorList[randomTile]
		if targetFloor then
			if SolidOrOverlay == 1 then
				local NewLitterObj = IsoObject.new(targetFloor, LitterSprite)
				targetFloor:AddTileObject(NewLitterObj)
				NewLitterObj:transmitCompleteItemToClients()
				targetFloor:transmitAddObjectToSquare(NewLitterObj, -1)
				--targetFloor:transmitAddObjectToSquare(NewLitterObj.javaObject, -1)
			
			
			elseif SolidOrOverlay == 2 then
				--targetFloor:setOverlaySprite(LitterSprite, 1, 1, 1, 1, true)--string/transmit
				--targetFloor:setOverlaySprite(LitterSprite, true)--string/transmit
				--targetFloor:transmitUpdatedSpriteToClients()

				local square = targetFloor:getSquare()
				local objOnFloor
				if square then
					for i=1,square:getObjects():size() do
						local thisObject = square:getObjects():get(i-1)
						if thisObject then
							local objSprite = thisObject:getSprite()
							if objSprite then
								local objProperties = objSprite:getProperties()
								if objProperties:Is("BlocksPlacement") then
									objOnFloor = true
								end
							end
						end
					end
					if not objOnFloor then
						targetFloor:setOverlaySprite(LitterSprite, true)--string/transmit
						targetFloor:transmitUpdatedSpriteToClients()
					end
				end
				
				--targetFloor:setOverlaySprite(LitterSprite, 1, 1, 1, 1, false)--string/transmit
				--if not objOnFloor then
				--	targetFloor:setOverlaySprite(LitterSprite, true)--string/transmit
				--	targetFloor:transmitUpdatedSpriteToClients()
				--end
				
			end
		end
	end
end

LS_Commands["RemoveDirtTileDebug"] = function(_, arg)

    local x = arg[1]
	local y = arg[2]
	local z = arg[3]

	local square = getCell():getGridSquare(x,y,z)

  	for x = square:getX()-4,square:getX()+4 do
		for y = square:getY()-4,square:getY()+4 do
			local square = getCell():getGridSquare(x,y,z)
			if square then
			
			for i=0,square:getObjects():size()-1 do
				local object
				if (i >= 0) and (i < square:getObjects():size()) then object = square:getObjects():get(i); end
				if square:haveBlood() then
					--square:removeBlood(true, false)
				end
				if object then
					local attachedsprite = object:getAttachedAnimSprite()
					if object:getTextureName() and
					(luautils.stringStarts(object:getTextureName(), "overlay_messages") or 
					luautils.stringStarts(object:getTextureName(), "overlay_graffiti") or 
					luautils.stringStarts(object:getTextureName(), "floors_burnt") or 
					luautils.stringStarts(object:getTextureName(), "overlay_blood") or 
					luautils.stringStarts(object:getTextureName(), "blood_floor") or
					luautils.stringStarts(object:getTextureName(), "overlay_grime") or 
					luautils.stringStarts(object:getTextureName(), "brokenglass_") or 
					luautils.stringStarts(object:getTextureName(), "trash&junk") or 
					luautils.stringStarts(object:getTextureName(), "d_floorleaves") or 
					luautils.stringStarts(object:getTextureName(), "d_trash")) then
						square:transmitRemoveItemFromSquare(object)
						square:RemoveTileObject(object);
					end
					if object:getOverlaySprite() and object:getOverlaySprite():getName() and
					(luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_messages") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_graffiti") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "floors_burnt") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_blood") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "blood_floor") or
					luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_grime") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "trash_") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "trash&junk") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "d_floorleaves") or 
					luautils.stringStarts(object:getOverlaySprite():getName(), "d_trash") or
					luautils.stringStarts(object:getOverlaySprite():getName(), "LS_HScraps") or
					luautils.stringStarts(object:getOverlaySprite():getName(), "LS_Scraps")) then
						object:setOverlaySprite(nil, true)--string/transmit use nil or ""
						object:transmitUpdatedSpriteToClients()
					end
					if attachedsprite and attachedsprite:size() == 1 then
						local sprite = attachedsprite:get(0)
						if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and 
						(luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_messages") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_graffiti") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "floors_burnt") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_blood") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "blood_floor") or
						luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_grime") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "trash_") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "trash&junk") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "d_floorleaves") or 
						luautils.stringStarts(sprite:getParentSprite():getName(), "d_trash")) then
						--object:RemoveAttachedAnim(n-1)
						object:RemoveAttachedAnim(0)
						object:transmitUpdatedSpriteToClients()
						--break
						end		
					elseif attachedsprite then
						--for n=1,attachedsprite:size() do
						for n=0,attachedsprite:size()-1 do
							--local sprite = attachedsprite:get(n-1)
							local sprite
							if (n >= 0) and (n < attachedsprite:size()) then sprite = attachedsprite:get(n); end
							if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and
							(luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_messages") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_graffiti") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "floors_burnt") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_blood") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "blood_floor") or
							luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_grime") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "trash_") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "trash&junk") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "d_floorleaves") or 
							luautils.stringStarts(sprite:getParentSprite():getName(), "d_trash")) then
								--object:RemoveAttachedAnim(n-1)
								object:RemoveAttachedAnim(n)
								object:transmitUpdatedSpriteToClients()
								break
							end
						end
					end
				end
			end
			
			end
		end
	end

end


LS_Commands["RemoveDirtTile"] = function(_, arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	local isHeavy = arg[4]

    local thisSquare = getCell():getGridSquare(x, y, z)
        
    if not thisSquare then return end
            
    for i=0,thisSquare:getObjects():size()-1 do
		local object
		if (i >= 0) and (i < thisSquare:getObjects():size()) then object = thisSquare:getObjects():get(i); end
        if thisSquare:haveBlood() and isHeavy then
			
		elseif object then
			local attachedsprite = object:getAttachedAnimSprite()
			if object:getTextureName() and isHeavy and
			(luautils.stringStarts(object:getTextureName(), "overlay_messages") or 
			luautils.stringStarts(object:getTextureName(), "overlay_graffiti") or 
			luautils.stringStarts(object:getTextureName(), "floors_burnt") or 
			luautils.stringStarts(object:getTextureName(), "overlay_blood") or 
			luautils.stringStarts(object:getTextureName(), "LS_HScraps") or
			luautils.stringStarts(object:getTextureName(), "blood_floor")) then
				thisSquare:transmitRemoveItemFromSquare(object)
				thisSquare:RemoveTileObject(object);
			elseif object:getTextureName() and
			(luautils.stringStarts(object:getTextureName(), "overlay_grime") or 
			luautils.stringStarts(object:getTextureName(), "brokenglass_") or 
			luautils.stringStarts(object:getTextureName(), "trash&junk") or 
			luautils.stringStarts(object:getTextureName(), "d_floorleaves") or 
			luautils.stringStarts(object:getTextureName(), "d_trash")) then
				thisSquare:transmitRemoveItemFromSquare(object)
				thisSquare:RemoveTileObject(object);
			elseif object:getOverlaySprite() and object:getOverlaySprite():getName() and isHeavy and
			(luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_messages") or 
			luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_graffiti") or 
			luautils.stringStarts(object:getOverlaySprite():getName(), "floors_burnt") or 
			luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_blood") or 
			luautils.stringStarts(object:getOverlaySprite():getName(), "LS_HScraps") or
			luautils.stringStarts(object:getOverlaySprite():getName(), "blood_floor")) then
				object:setOverlaySprite(nil, true)--string/transmit use nil or ""
				object:transmitUpdatedSpriteToClients()
			elseif object:getOverlaySprite() and object:getOverlaySprite():getName() and
			(luautils.stringStarts(object:getOverlaySprite():getName(), "overlay_grime") or 
			luautils.stringStarts(object:getOverlaySprite():getName(), "trash_") or 
			luautils.stringStarts(object:getOverlaySprite():getName(), "trash&junk") or 
			luautils.stringStarts(object:getOverlaySprite():getName(), "d_floorleaves") or 
			luautils.stringStarts(object:getOverlaySprite():getName(), "d_trash") or
			luautils.stringStarts(object:getOverlaySprite():getName(), "LS_Scraps")) then
				object:setOverlaySprite(nil, true)--string/transmit use nil or ""
				object:transmitUpdatedSpriteToClients()
			elseif attachedsprite and attachedsprite:size() == 1 then
				local sprite = attachedsprite:get(0)
					if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and isHeavy and 
					(luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_messages") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_graffiti") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "floors_burnt") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_blood") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "LS_HScraps") or
					luautils.stringStarts(sprite:getParentSprite():getName(), "blood_floor")) then
						--object:RemoveAttachedAnim(n-1)
						object:RemoveAttachedAnim(0)
						object:transmitUpdatedSpriteToClients()
						--break
					elseif sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and 
					(luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_grime") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "trash_") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "trash&junk") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "d_floorleaves") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "d_trash")) then
						--object:RemoveAttachedAnim(n-1)
						object:RemoveAttachedAnim(0)
						object:transmitUpdatedSpriteToClients()
						--break
					end
			elseif attachedsprite then
				--for n=1,attachedsprite:size() do
				for n=0,attachedsprite:size()-1 do
					--local sprite = attachedsprite:get(n-1)
					local sprite
					if (n >= 0) and (n < attachedsprite:size()) then sprite = attachedsprite:get(n); end
					if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and isHeavy and 
					(luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_messages") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_graffiti") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "floors_burnt") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_blood") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "LS_HScraps") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "blood_floor")) then
						--object:RemoveAttachedAnim(n-1)
						object:RemoveAttachedAnim(n)
						object:transmitUpdatedSpriteToClients()
						break
					elseif sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() and 
					(luautils.stringStarts(sprite:getParentSprite():getName(), "overlay_grime") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "trash_") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "trash&junk") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "d_floorleaves") or 
					luautils.stringStarts(sprite:getParentSprite():getName(), "d_trash")) then
						--object:RemoveAttachedAnim(n-1)
						object:RemoveAttachedAnim(n)
						object:transmitUpdatedSpriteToClients()
						break
					end
				end
									
			end
		end
	end

end


LS_Commands["TeleportSittingLocation"] = function(_, arg)

    local TargetName = getPlayerByOnlineID(arg[1])
    local TargetName_id = arg[1]
    local SourcePlayerName = arg[2]
    local teleportX = arg[3]
	local teleportY = arg[4]
	local NSvar = arg[5]
	--print("server received from client and is sending the command")
    sendServerCommand(TargetName, "LS", "TeleportSittingLocation", {SourcePlayerName, teleportX, teleportY, NSvar})

    local otherPlayers = getOnlinePlayers()
    
	if otherPlayers then
	
    for index = 1, otherPlayers:size() do
		local sourcePlayer = otherPlayers:get(index-1)

        if sourcePlayer and sourcePlayer:getDisplayName() == SourcePlayerName then
			--thisPlayer:Say("teleporting " .. tostring(sourcePlayer:getDisplayName()))
            if teleportX and teleportY then
				sourcePlayer:setY(teleportY)
				sourcePlayer:setX(teleportX)
				sourcePlayer:setLy(teleportY)
				sourcePlayer:setLx(teleportX)
				
				if not string.match(tostring(sourcePlayer:getCurrentState()), "PlayerSitOnGroundState") then
					sourcePlayer:setVariable("SittingToggleStart", NSvar)
					sourcePlayer:reportEvent("EventSitOnGround");
					sourcePlayer:setVariable("SittingToggleLoop", NSvar)
				end
				
            end

            break

        end

    end

	end

end

LS_Commands["ChangeAnimVarMulti"] = function(_, arg)

    local SourcePlayerName = arg[1]
    local AnimType = arg[2]
	local AnimVar = arg[3]
    local AnimType2 = arg[4]
	local AnimVar2 = arg[5]
	--print("server received from client and is sending the command")
    sendServerCommand("LS", "ChangeAnimVarMulti", {SourcePlayerName, AnimType, AnimVar, AnimType2, AnimVar2})

    local otherPlayers = getOnlinePlayers()
 
    --for index = 0, getOnlinePlayers():size() - 1 do

        --local sourcePlayer = getOnlinePlayers():get(index)
	if otherPlayers then
	
    for index = 1, otherPlayers:size() do
		local sourcePlayer = otherPlayers:get(index-1)

       -- if sourcePlayer:getDisplayName() == SourcePlayerName and sourcePlayer:getDisplayName() ~= thisPlayer:getDisplayName() then
        if sourcePlayer and sourcePlayer:getDisplayName() == SourcePlayerName then
			--thisPlayer:Say("source is " .. tostring(sourcePlayer:getDisplayName()))
			
            if AnimVar then
                sourcePlayer:setVariable(AnimType, AnimVar)
				if AnimType == "SittingToggleStart" and ((AnimVar == "N") or (AnimVar == "S")) then
					--thisPlayer:Say("reporting eventsitOnGround")
					sourcePlayer:reportEvent("EventSitOnGround")
				end
            else
                sourcePlayer:clearVariable(AnimType)
            end

            if AnimVar2 then
                sourcePlayer:setVariable(AnimType2, AnimVar2)
				if AnimType2 == "SittingToggleStart" and ((AnimVar2 == "N") or (AnimVar2 == "S")) then
					--thisPlayer:Say("reporting eventsitOnGround")
					sourcePlayer:reportEvent("EventSitOnGround")
				end
            else
                sourcePlayer:clearVariable(AnimType2)
            end

            break

        end

    end

	end

end

LS_Commands["ChangeAnimVar"] = function(_, arg)

    local TargetName = getPlayerByOnlineID(arg[1])
    local TargetName_id = arg[1]
    local SourcePlayerName = arg[2]
    local AnimType = arg[3]
	local AnimVar = arg[4]
	--print("server received from client and is sending the command")
    sendServerCommand(TargetName, "LS", "ChangeAnimVar", {SourcePlayerName, AnimType, AnimVar})

    local otherPlayers = getOnlinePlayers()
    
	if otherPlayers then
	
    for index = 1, otherPlayers:size() do
		local sourcePlayer = otherPlayers:get(index-1)

        if sourcePlayer and sourcePlayer:getDisplayName() == SourcePlayerName then
			--thisPlayer:Say("source is " .. tostring(sourcePlayer:getDisplayName()))
            if AnimVar then
                sourcePlayer:setVariable(AnimType, AnimVar)
				if AnimType == "SittingToggleStart" and ((AnimVar == "N") or (AnimVar == "S")) then
					--thisPlayer:Say("reporting eventsitOnGround")
					sourcePlayer:reportEvent("EventSitOnGround")
				end
            else
                sourcePlayer:clearVariable(AnimType)
            end

            break

        end

    end

	end

end

LS_Commands["IsPlayingMusic"] = function(_, arg)

    local listener = getPlayerByOnlineID(arg[1])
    local listener_id = arg[1]
    local SourceMusiclvl = arg[2]
	--print("server received from client and is sending the command")
    sendServerCommand(listener, "LS", "IsListeningToMusic", {listener_id, SourceMusiclvl})

end

LS_Commands["IsStartingDuet"] = function(_, arg)

    local currentPerformer = getPlayerByOnlineID(arg[1])
    local currentPerformer_id = arg[1]
    local SourceWaitingDuet = arg[2]
	--print("server received from client and is sending the command")
    sendServerCommand(currentPerformer, "LS", "IsStartingDuet", {currentPerformer_id, SourceWaitingDuet})

end

LS_Commands["IsPlayingDJ"] = function(_, arg)

    local DJlistener = getPlayerByOnlineID(arg[1])
    local DJlistener_id = arg[1]
    local SourceMusiclvl = arg[2]
	local SourceDJ = arg[3]
	local SourceIsDJ = arg[4]
	--print("server received from client and is sending the command")
    sendServerCommand(DJlistener, "LS", "IsListeningToDJ", {DJlistener_id, SourceMusiclvl, SourceDJ, SourceIsDJ})

end

LS_Commands["AskIfIsDancing"] = function(_, arg)

    local DanceTarget = getPlayerByOnlineID(arg[1])
    local DanceTarget_id = arg[1]
    local DanceProposer = arg[2]
	--print("server received AskToDance from client and is sending the command")
    sendServerCommand(DanceTarget, "LS", "WasAskedIfIsDancing", {DanceTarget_id, DanceProposer})

end

LS_Commands["OtherPlayerIsDancing"] = function(_, arg)

    local DanceProposer = getPlayerByOnlineID(arg[1])
    local DanceProposer_id = arg[1]
    local IsDancing = arg[2]
	--print("server received AcceptedDance from client and is sending the command")
    sendServerCommand(DanceProposer, "LS", "OtherPlayerIsDancingResponse", {DanceProposer_id, IsDancing})

end

LS_Commands["AskToDance"] = function(_, arg)

    local DanceTarget = getPlayerByOnlineID(arg[1])
    local DanceTarget_id = arg[1]
    local DanceProposer = arg[2]
	--print("server received AskToDance from client and is sending the command")
    sendServerCommand(DanceTarget, "LS", "WasAskedToDance", {DanceTarget_id, DanceProposer})

end

LS_Commands["AcceptedDance"] = function(_, arg)

    local DanceProposer = getPlayerByOnlineID(arg[1])
    local DanceProposer_id = arg[1]
    local DancePartner = arg[2]
	local PartnerX = arg[3]
	local PartnerY = arg[4]
	--print("server received AcceptedDance from client and is sending the command")
    sendServerCommand(DanceProposer, "LS", "DanceWasAccepted", {DanceProposer_id, DancePartner, PartnerX, PartnerY})

end

LS_Commands["StopDance"] = function(_, arg)

    local DanceTarget = getPlayerByOnlineID(arg[1])
    local DanceTarget_id = arg[1]
	--print("server received StopDance from client and is sending the command")
    sendServerCommand(DanceTarget, "LS", "PartnerStoppedDancing", {DanceTarget_id})

end

LS_Commands["FaceDanceProposer"] = function(_, arg)

    local DancePartner = getPlayerByOnlineID(arg[1])
    local DancePartner_id = arg[1]
    local ProposerX = arg[2]
	local ProposerY = arg[3]
	print("server received FaceDanceProposer from client and is sending the command")
    sendServerCommand(DancePartner, "LS", "FaceDancingProposer", {DancePartner_id, ProposerX, ProposerY})

end

LS_Commands["ChangeDiscoStyle"] = function(_, arg)

    local style = arg[1]
    local x = arg[2]
    local y = arg[3]
	local z = arg[4]
	--print("server received from client and is sending the command")
    sendServerCommand("LS", "ChangeDiscoStyle", {style, x, y, z})

	local sqr = getCell():getGridSquare(x,y,z);
	local DiscoBall
	
			for i=1,sqr:getObjects():size() do
				local thisObject = sqr:getObjects():get(i-1)

				local thisSprite = thisObject:getSprite()
				
				if thisSprite ~= nil then
				
					local properties = thisObject:getSprite():getProperties()

					if properties ~= nil then
						local groupName = nil
						local customName = nil
						local thisSpriteName = nil
					
						local thisSprite = thisObject:getSprite()
						if thisSprite:getName() then
							thisSpriteName = thisSprite:getName()
						end
					
						if properties:Is("GroupName") then
							groupName = properties:Val("GroupName")
						end
					
						if properties:Is("CustomName") then
							customName = properties:Val("CustomName")
						end
					
						if customName == "Disco Ball" then
							DiscoBall = thisObject;
						end
					end
				end
			end


	if not DiscoBall then
	print("failed")
	return end

	if DiscoBall:hasModData() and
	DiscoBall:getModData().OnOff ~= nil and
	DiscoBall:getModData().OnOff == "on" then
	
		DiscoBall:getModData().Mode = style
	
	else
		return
	end


end

LS_Commands["TurnDiscoBallOff"] = function(_, arg)

    local playerDiscoCommand = arg[1]
    local x = arg[2]
    local y = arg[3]
	local z = arg[4]
	--print("server received from client and is sending the command")
    sendServerCommand("LS", "TurnDiscoBallOff", {playerDiscoCommand, x, y, z})

	local sqr = getCell():getGridSquare(x,y,z);
	local DiscoBall
	
			for i=1,sqr:getObjects():size() do
				local thisObject = sqr:getObjects():get(i-1)

				local thisSprite = thisObject:getSprite()
				
				if thisSprite ~= nil then
				
					local properties = thisObject:getSprite():getProperties()

					if properties ~= nil then
						local groupName = nil
						local customName = nil
						local thisSpriteName = nil
					
						local thisSprite = thisObject:getSprite()
						if thisSprite:getName() then
							thisSpriteName = thisSprite:getName()
						end
					
						if properties:Is("GroupName") then
							groupName = properties:Val("GroupName")
						end
					
						if properties:Is("CustomName") then
							customName = properties:Val("CustomName")
						end

						if customName == "Disco Ball" then
							DiscoBall = thisObject;
						end
					end
				end
			end


	if not DiscoBall then
	print("failed")
	return end

	if DiscoBall:hasModData() and
	DiscoBall:getModData().OnOff ~= nil and
	DiscoBall:getModData().OnOff == "on" then
	
		DiscoBall:getModData().OnOff = playerDiscoCommand
	
	else
		return
	end


end

LS_Commands["JukeboxStart"] = function(_, arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	--print("server received from client and is sending the command")
    sendServerCommand("LS", "JukeboxStart", {x, y, z})

end

LS_Commands["TurnJukeboxOff"] = function(_, arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	--print("server received from client and is sending the command")
    sendServerCommand("LS", "TurnJukeboxOff", {x, y, z})

	local sqr = getCell():getGridSquare(x,y,z);
	local Jukebox
	
			for i=1,sqr:getObjects():size() do
				local thisObject = sqr:getObjects():get(i-1)

				local thisSprite = thisObject:getSprite()
				
				if thisSprite ~= nil then
				
					local properties = thisObject:getSprite():getProperties()

					if properties ~= nil then
						local groupName = nil
						local customName = nil
						local thisSpriteName = nil
					
						local thisSprite = thisObject:getSprite()
						if thisSprite:getName() then
							thisSpriteName = thisSprite:getName()
						end
					
						if properties:Is("GroupName") then
							groupName = properties:Val("GroupName")
						end
					
						if properties:Is("CustomName") then
							customName = properties:Val("CustomName")
						end
					
						if customName == "Jukebox" then
							Jukebox = thisObject;
						end
					end
				end
			end


	if not Jukebox then
	print("failed")
	return end

	if Jukebox:hasModData() and
	Jukebox:getModData().OnOff ~= nil and
	Jukebox:getModData().OnOff == "on" then
	
		Jukebox:getModData().OnOff = "off"
		Jukebox:getModData().OnPlay = "nothing"
	
	else
		return
	end


end

LS_Commands["JukeboxStyleChangePlayerPlaylist"] = function(_, arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	local style = arg[4]
	local length = arg[5]
	local genre = arg[6]
	local customPlaylist = arg[7]
	
	--print("server received from client and is sending the command")
    sendServerCommand("LS", "JukeboxStyleChangeCustom", {x, y, z, style, length, genre, customPlaylist})

	local sqr = getCell():getGridSquare(x,y,z);
	local Jukebox
	
			for i=1,sqr:getObjects():size() do
				local thisObject = sqr:getObjects():get(i-1)

				local thisSprite = thisObject:getSprite()
				
				if thisSprite ~= nil then
				
					local properties = thisObject:getSprite():getProperties()

					if properties ~= nil then
						local groupName = nil
						local customName = nil
						local thisSpriteName = nil
					
						local thisSprite = thisObject:getSprite()
						if thisSprite:getName() then
							thisSpriteName = thisSprite:getName()
						end
					
						if properties:Is("GroupName") then
							groupName = properties:Val("GroupName")
						end
					
						if properties:Is("CustomName") then
							customName = properties:Val("CustomName")
						end

						if customName == "Jukebox" then
							Jukebox = thisObject;
						end
					end
				end
			end


	if not Jukebox then
	print("failed")
	return end

	if Jukebox:hasModData() and
	Jukebox:getModData().OnOff ~= nil and
	Jukebox:getModData().OnOff == "on" then
	
		Jukebox:getModData().OnPlay = "playing"
		Jukebox:getModData().Style = style
		Jukebox:getModData().customPlaylist = customPlaylist
	else
		return
	end


end

LS_Commands["JukeboxStyleChange"] = function(_, arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	local style = arg[4]
	local length = arg[5]
	local genre = arg[6]
	
	--print("server received from client and is sending the command")
    sendServerCommand("LS", "JukeboxStyleChange", {x, y, z, style, length, genre})

	local sqr = getCell():getGridSquare(x,y,z);
	local Jukebox
	
			for i=1,sqr:getObjects():size() do
				local thisObject = sqr:getObjects():get(i-1)

				local thisSprite = thisObject:getSprite()
				
				if thisSprite ~= nil then
				
					local properties = thisObject:getSprite():getProperties()

					if properties ~= nil then
						local groupName = nil
						local customName = nil
						local thisSpriteName = nil
					
						local thisSprite = thisObject:getSprite()
						if thisSprite:getName() then
							thisSpriteName = thisSprite:getName()
						end
					
						if properties:Is("GroupName") then
							groupName = properties:Val("GroupName")
						end
					
						if properties:Is("CustomName") then
							customName = properties:Val("CustomName")
						end

						if customName == "Jukebox" then
							Jukebox = thisObject;
						end
					end
				end
			end


	if not Jukebox then
	print("failed")
	return end

	if Jukebox:hasModData() and
	Jukebox:getModData().OnOff ~= nil and
	Jukebox:getModData().OnOff == "on" then
	
		Jukebox:getModData().OnPlay = "playing"
		Jukebox:getModData().Style = style
	else
		return
	end


end

LS_Commands["StopJukeSong"] = function(_, arg)

    local x = arg[1]
    local y = arg[2]
	local z = arg[3]
	--print("server received from client and is sending the command")
    sendServerCommand("LS", "StopJukeSong", {x, y, z})

end

LS_Commands["isPlayingJuke"] = function(_, arg)

	--local isPlayingJukeSong = nil;
	local genre = arg[2]
	local JukeReusableID = arg[1]
	local playercommand = arg[6]
	
--	print("server received from client and is sending the command")
--	if sqr then
--	print("is sqr")

--			for i=1,sqr:getObjects():size() do
--				local thisObject = sqr:getObjects():get(i-1)
--
--				local thisSprite = thisObject:getSprite()
--				
--				if thisSprite ~= nil then
--				
--					local properties = thisObject:getSprite():getProperties()
--
--					if properties ~= nil then
--						local groupName = nil
--						local customName = nil
--						local thisSpriteName = nil
--					
--						--local thisSprite = thisObject:getSprite()
--						if thisSprite:getName() then
--							thisSpriteName = thisSprite:getName()
--						end
--					
--						if properties:Is("GroupName") then
--							groupName = properties:Val("GroupName")
--						end
--					
--						if properties:Is("CustomName") then
--							customName = properties:Val("CustomName")
--						end
--
--						if customName == "Jukebox" then
--							Jukebox = thisObject;
--							spriteName = thisSpriteName;
--						end
--					end
--				end
--			end


--	if not Jukebox then
--	print("failed")
--	return end

	local x = arg[3]
	local y = arg[4]
	local z = arg[5]
	
--    local emitter = getWorld():getFreeEmitter();
--	emitter:setPos(x, y, 0);

			if playercommand == "beforeplay" then
			print("trying to send beforeplay")
			sendServerCommand("LS", "isPlayingJuke", {genre, x, y, z, JukeReusableID, playercommand})

			end

			if playercommand == "stop" then
			print("trying to send stop")
			sendServerCommand("LS", "isPlayingJuke", {genre, x, y, z, JukeReusableID, playercommand})

			end

    --sendServerCommand("LS", "isPlayingJuke", {genre, x, y, z, JukeReusableID, playercommand})
	--isPlayingJukeSong = getSoundManager():playSound(genre, sqr, 5, 75, 0.7, true);
	--addSound(Jukebox, x, y, z, 30, 10)


	--end
end

LS_Commands["JukeTurnedOn"] = function(_, arg)

	--local isPlayingJukeSong = nil;
	local genre = arg[1]
	local x = arg[2]
	local y = arg[3]
	local z = arg[4]
	local JukeReusableID = arg[5]
	local playercommand = arg[6]
	local sqr = getCell():getGridSquare(x, y, z);
--	print("server received from client and is sending the command")
	if sqr then
	print("is sqr")

			for i=1,sqr:getObjects():size() do
				local thisObject = sqr:getObjects():get(i-1)

				local thisSprite = thisObject:getSprite()
				
				if thisSprite ~= nil then
				
					local properties = thisObject:getSprite():getProperties()

					if properties ~= nil then
						local groupName = nil
						local customName = nil
						local thisSpriteName = nil
					
						--local thisSprite = thisObject:getSprite()
						if thisSprite:getName() then
							thisSpriteName = thisSprite:getName()
						end
					
						if properties:Is("GroupName") then
							groupName = properties:Val("GroupName")
						end
					
						if properties:Is("CustomName") then
							customName = properties:Val("CustomName")
						end

						if customName == "Jukebox" then
							Jukebox = thisObject;
							spriteName = thisSpriteName;
						end
					end
				end
			end


	if not Jukebox then
	print("failed")
	return end

local JukeboxLightSprite = "LS_JukeboxLight_A_1"
local JukeboxCell = Jukebox:getCell()

				if JukeboxLightOn ~= nil then
					if JukeboxLightOn == false then
							local JukeboxLight = IsoObject.new(sqr, JukeboxLightSprite)
							JukeboxLight:setName("JukeLight")
							JukeboxLight:transmitModData();
							sqr:AddTileObject(JukeboxLight)
							JukeboxLightOn = true
							Jukebox:getModData().MainLight = IsoLightSource.new(Jukebox:getX(), Jukebox:getY(), Jukebox:getZ(), 75, 75, 0, 2)
							local JukeMainLight = Jukebox:getModData().MainLight
							JukeboxCell:addLamppost(JukeMainLight)
							Jukebox:transmitModData();
							print("LIGHTS ON")
					else
							print("LIGHTS ALREADY ON")
					return
					end
				else
							local JukeboxLight = IsoObject.new(sqr, JukeboxLightSprite)
							JukeboxLight:setName("JukeLight")
							JukeboxLight:transmitModData();
							sqr:AddTileObject(JukeboxLight)
							JukeboxLightOn = true
							Jukebox:getModData().MainLight = IsoLightSource.new(Jukebox:getX(), Jukebox:getY(), Jukebox:getZ(), 75, 75, 0, 2)
							local JukeMainLight = Jukebox:getModData().MainLight
							JukeboxCell:addLamppost(JukeMainLight)
							Jukebox:transmitModData();
							print("LIGHTS ON")
				end
	
--    local emitter = getWorld():getFreeEmitter();
--	emitter:setPos(x, y, 0);

			--if playercommand == "beforeplay" then
			--print("trying to send beforeplay")
			--sendServerCommand("LS", "isPlayingJuke", {genre, x, y, z, JukeReusableID, playercommand})

			--end

			--if playercommand == "stop" then
			--print("trying to send stop")
			--sendServerCommand("LS", "isPlayingJuke", {genre, x, y, z, JukeReusableID, playercommand})

			--end

    --sendServerCommand("LS", "isPlayingJuke", {genre, x, y, z, JukeReusableID, playercommand})
	--isPlayingJukeSong = getSoundManager():playSound(genre, sqr, 5, 75, 0.7, true);
	--addSound(Jukebox, x, y, z, 30, 10)


	end
end

---------- GLOBAL MODDATA

function LS_OnInitGlobalModData()
    local lsModData = ModData.getOrCreate("LSDATA")
	if not lsModData["SO"] then lsModData["SO"] = {}; end
	LSgetSandboxOptions(lsModData["SO"])
    --if not ModData.exists("LSDATAPlaylists") then
    --    local LSModDataPlaylists = ModData.create("LSDATAPlaylists")
    --    LSModDataPlaylists["CustomPlaylists"] = {};
    --end
end

--function LS_OnReceiveGlobalModData(ModData, NewData)
--    if ModData ~= "LSDATAPlaylists" then return; end;
--    if not NewData then return; end
--	ModData.add(ModData, NewData);
--end

Events.OnInitGlobalModData.Add(LS_OnInitGlobalModData)
--Events.OnReceiveGlobalModData.Add(LS_OnReceiveGlobalModData)

LS_Commands.OnClientCommand = function(module, command, playerObj, args)

    if module == 'LS' and LS_Commands[command] then
        LS_Commands[command](playerObj, args)
    end
end

Events.OnClientCommand.Add(LS_Commands.OnClientCommand)


LS_Commands.ChangePlayerState = function(playerObj, args)
    ModData.get("LSDATA")[playerObj:getUsername()] = args
    ModData.transmit("LSDATA")
end
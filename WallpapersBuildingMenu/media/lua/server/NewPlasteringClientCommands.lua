require('luautils');

local Signs = {}

	Signs["constructedobjects_signs_01_40"] = true
	Signs["constructedobjects_signs_01_41"] = true
	Signs["constructedobjects_signs_01_42"] = true
	Signs["constructedobjects_signs_01_43"] = true
	Signs["constructedobjects_signs_01_44"] = true

local function onNewPlasteringCommand(module, command, player, args)
    if module == 'NewPlastering' then
        if command == 'NewPlasteringCommand' then
            local sq = getCell():getGridSquare(args.x, args.y, args.z)
            
            if not sq then return end
            
            for i = 0, sq:getObjects():size() - 1 do
                local object = sq:getObjects():get(i);
                local props = object:getProperties()
				local checkID = object:getSprite():getID()
				if checkID == args.id then
					if props:Is(IsoFlagType.WallN) or props:Is(IsoFlagType.WallW) or props:Is(IsoFlagType.WallNW) or props:Is(IsoFlagType.WallSE) or props:Is(IsoFlagType.DoorWallN) or props:Is(IsoFlagType.DoorWallW) or props:Is(IsoFlagType.WindowN) or props:Is(IsoFlagType.WindowW) then
						local attached = object:getAttachedAnimSprite()
						if attached then
							for n = attached:size(), 1, -1 do
								local dirtSprite = attached:get(n - 1)
								print(dirtSprite:getParentSprite():getName())
								if dirtSprite and dirtSprite:getParentSprite() and dirtSprite:getParentSprite():getName() and
								   (luautils.stringStarts(dirtSprite:getParentSprite():getName(), "d_wallcrack") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_blocks_01") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_blocks_01_MIRRORED") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_blocks_LIGHT_01") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_blocks_LIGHT_01_MIRRORED") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_brick_01") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_brick_01_MIRRORED") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_brick_LIGHT_01") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_brick_LIGHT_01_MIRRORED") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_clapboard_01") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_clapboard_01_MIRRORED") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_clapboard_LIGHT_01") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_clapboard_LIGHT_01_MIRRORED") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_flatstone_01") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_flatstone_01_MIRRORED") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_smooth_01") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_smooth_01_MIRRORED") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_stone_01") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_stone_01_MIRRORED") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_trailer_01") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_trailer_01_MIRRORED") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_wood_01") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_house_wood_01_MIRRORED") or
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "overlay_grime_wall") or 
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "overlay_graffiti") or 
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "walls_commercial") or 
									luautils.stringStarts(dirtSprite:getParentSprite():getName(), "constructedobjects_signs_01")
								   )
								then
									object:RemoveAttachedAnim(n - 1);
								end
							end
						end		
					sq:disableErosion()
					object:cleanWallBlood();
					object:setSpriteFromName(args.sprite);
					object:transmitUpdatedSpriteToClients();
					if isClient() then object:transmitUpdatedSpriteToServer() end
					return end
				end
            end
        end
    end
end
Events.OnClientCommand.Add(onNewPlasteringCommand) 

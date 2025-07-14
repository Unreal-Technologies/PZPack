require('luautils');

	
local function onRemoveMouldingCommand(module, command, player, args)
    if module == 'RemoveMoulding' then
        if command == 'RemoveMouldingCommand' then
            local sq = getCell():getGridSquare(args.x, args.y, args.z)
        
            if not sq then return end
            
            for i=0,sq:getObjects():size()-1 do
                local object = sq:getObjects():get(i);
                
                if object then
                    if object:getTextureName() and (WoodenMoulding[object:getTextureName()] or StoneMoulding[object:getTextureName()]) then
                        sledgeDestroy(object)
						object:getSquare():transmitRemoveItemFromSquare(object)
                    else
                        local attached = object:getAttachedAnimSprite()
                        if attached then
                            for n = attached:size(), 1, -1 do
                                local sprite = attached:get(n-1)
                                if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() 
									and (WoodenMoulding[sprite:getParentSprite():getName()] or StoneMoulding[sprite:getParentSprite():getName()]) then
                                    object:RemoveAttachedAnim(n-1)
                                    object:transmitUpdatedSpriteToClients()
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

Events.OnClientCommand.Add(onRemoveMouldingCommand)
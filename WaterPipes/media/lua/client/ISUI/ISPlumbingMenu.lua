ISPlumbingMenu = {};
ISPlumbingMenu.canDoSomething = false
ISPlumbingMenu.ghs = " <RGB:" .. getCore():getGoodHighlitedColor():getR() .. "," .. getCore():getGoodHighlitedColor():getG() .. "," .. getCore():getGoodHighlitedColor():getB() .. "> "
ISPlumbingMenu.bhs = " <RGB:" .. getCore():getBadHighlitedColor():getR() .. "," .. getCore():getBadHighlitedColor():getG() .. "," .. getCore():getBadHighlitedColor():getB() .. "> "

local function predicateDrainableUsesInt(item, count)
	return item:getDrainableUsesInt() >= count
end

local function predicateWeldingMask(item)
	return item:hasTag("WeldingMask") or item:getType() == "WeldingMask"
end

local function predicatePipeWrench(item)
	return item:hasTag("PipeWrench") or item:getType() == "PipeWrench"
end

local function predicatePetrol(item)
	return (item:hasTag("Petrol") or item:getType() == "PetrolCan") and item:getUsedDelta() > 0
end

function ISPlumbingMenu.weldingRodUses(torchUses)
    return math.floor((torchUses + 0.1) / 2)
end

function ISPlumbingMenu.getMaterialCount(playerObj, type)
    local playerInv = playerObj:getInventory()
    local count = playerInv:getCountTypeRecurse(type)
    if ISPlumbingMenu.groundItemCounts[type] then
        count = count + ISPlumbingMenu.groundItemCounts[type]
    end
    return count
end

function ISPlumbingMenu.getMaterialUses(playerObj, type)
    local playerInv = playerObj:getInventory()
    local count = playerInv:getUsesTypeRecurse(type)
    if ISPlumbingMenu.groundItemUses[type] then
        count = count + ISPlumbingMenu.groundItemUses[type]
    end
    return count
end

ISPlumbingMenu.checkPlumbingFurnitures = function(player, toolTip, materialList, skillList)
    local inv = player:getInventory();
    local isOk = true;

    local itemMap = buildUtil.getMaterialOnGround(player:getCurrentSquare())
    ISPlumbingMenu.groundItems = itemMap
    ISPlumbingMenu.groundItemCounts = buildUtil.getMaterialOnGroundCounts(itemMap)
    ISPlumbingMenu.groundItemUses = buildUtil.getMaterialOnGroundUses(itemMap)

    if materialList.torchUse and materialList.torchUse > 0 then

        local blowTorch = inv:getFirstTypeRecurse("Base.BlowTorch")
        local blowTorchUseLeft = inv:getUsesTypeRecurse("Base.BlowTorch")
        
        if ISPlumbingMenu.groundItemUses["Base.BlowTorch"] then
            blowTorchUseLeft = blowTorchUseLeft + ISPlumbingMenu.groundItemUses["Base.BlowTorch"]
            local maxUses = 0
            local blowTorchGround = nil
            for _, item2 in ipairs(ISPlumbingMenu.groundItems["Base.BlowTorch"]) do
                if item2:getDrainableUsesInt() > maxUses then
                    blowTorchGround = item2
                    maxUses = item2:getDrainableUsesInt()
                end
            end
            blowTorch = blowTorch or blowTorchGround
        end

        if not blowTorch then
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.bhs .. getItemNameFromFullType("Base.BlowTorch") .. " 0/1"
            isOk = false;
        elseif blowTorchUseLeft < materialList.torchUse then
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.bhs .. getItemNameFromFullType("Base.BlowTorch") .. " " .. getText("ContextMenu_Uses") .. " " .. blowTorchUseLeft .. "/" .. materialList.torchUse;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.ghs .. getItemNameFromFullType("Base.BlowTorch") .. " " .. getText("ContextMenu_Uses") .. " " .. blowTorchUseLeft .. "/" .. materialList.torchUse;
        end
    end

    if materialList.weldingMask and materialList.weldingMask > 0 then
        if not inv:containsEvalRecurse(predicateWeldingMask) then
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.bhs .. getItemNameFromFullType("Base.WeldingMask") .. " " .. materialList.weldingMask .. "/1" ;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.ghs .. getItemNameFromFullType("Base.WeldingMask") .. " " .. materialList.weldingMask .. "/1" ;
        end
    end

    if materialList.pipeWrench and materialList.pipeWrench > 0 then
        if not inv:containsEvalRecurse(predicatePipeWrench) then
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.bhs .. getItemNameFromFullType("Base.PipeWrench") .. " " .. materialList.pipeWrench .. "/1" ;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.ghs .. getItemNameFromFullType("Base.PipeWrench") .. " " .. materialList.pipeWrench .. "/1" ;
        end
    end

    if materialList.metalBar and materialList.metalBar > 0 then
        local count = ISPlumbingMenu.getMaterialCount(player, "MetalBar")
        if count < materialList.metalBar then
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.bhs .. getItemNameFromFullType("Base.MetalBar") .. " " .. count .. "/" .. materialList.metalBar;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.ghs .. getItemNameFromFullType("Base.MetalBar") .. " " .. count .. "/" .. materialList.metalBar ;
        end
    end

    if materialList.metalPipes and materialList.metalPipes > 0 then
        local count = ISPlumbingMenu.getMaterialCount(player, "MetalPipe")
        if count < materialList.metalPipes then
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.bhs .. getItemNameFromFullType("Base.MetalPipe") .. " " .. count .. "/" .. materialList.metalPipes;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.ghs .. getItemNameFromFullType("Base.MetalPipe") .. " " .. count .. "/" .. materialList.metalPipes ;
        end
    end

    if materialList.smallMetalSheet and materialList.smallMetalSheet > 0 then
        local count = ISPlumbingMenu.getMaterialCount(player, "SmallSheetMetal")
        if count < materialList.smallMetalSheet then
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.bhs .. getItemNameFromFullType("Base.SmallSheetMetal") .. " " .. count .. "/" .. materialList.smallMetalSheet;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.ghs .. getItemNameFromFullType("Base.SmallSheetMetal") .. " " .. count .. "/" .. materialList.smallMetalSheet ;
        end
    end

    if materialList.metalSheet and materialList.metalSheet > 0 then
        local count = ISPlumbingMenu.getMaterialCount(player, "SheetMetal")
        if count < materialList.metalSheet then
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.bhs .. getItemNameFromFullType("Base.SheetMetal") .. " " .. count .. "/" .. materialList.metalSheet;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.ghs .. getItemNameFromFullType("Base.SheetMetal") .. " " .. count .. "/" .. materialList.metalSheet ;
        end
    end

    if materialList.scrapMetal and  materialList.scrapMetal > 0 then
        local count = ISPlumbingMenu.getMaterialCount(player, "ScrapMetal")
        if count < materialList.scrapMetal then
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.bhs .. getItemNameFromFullType("Base.ScrapMetal") .. " " .. count .. "/" .. materialList.scrapMetal;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.ghs .. getItemNameFromFullType("Base.ScrapMetal") .. " " .. count .. "/" .. materialList.scrapMetal ;
        end
    end

    if materialList.wire and materialList.wire > 0 then
        local count = ISPlumbingMenu.getMaterialUses(player, "Wire");
        if count < wire then
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.bhs .. getItemNameFromFullType("Base.Wire") .. " " .. getText("ContextMenu_Uses") .. " " .. count .. "/" .. wire;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.ghs .. getItemNameFromFullType("Base.Wire") .. " " .. getText("ContextMenu_Uses") .. " " .. count .. "/" .. wire;
        end
    end

    toolTip.description = toolTip.description .. " <LINE> ";
    if skillList.metalwelding > 0 then
        if player:getPerkLevel(Perks.MetalWelding) < skillList.metalwelding then
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.bhs .. getText("IGUI_perks_MetalWelding") .. " " .. player:getPerkLevel(Perks.MetalWelding) .. "/" .. skillList.metalwelding;
            isOk = false;
        else
            toolTip.description = toolTip.description .. " <LINE> " .. ISPlumbingMenu.ghs .. getText("IGUI_perks_MetalWelding") .. " " .. player:getPerkLevel(Perks.MetalWelding) .. "/" .. skillList.metalwelding;
        end
    end

    if ISBuildMenu.cheat then
        return true, toolTip;
    end
    if isOk then
        ISPlumbingMenu.canDoSomething = true;
    end
    return isOk, toolTip;
end

ISPlumbingMenu.addToolTip = function(option, name, texture)
    local toolTip = ISWorldObjectContextMenu.addToolTip();
    option.toolTip = toolTip;
    toolTip:setName(name);
    toolTip.description = getText("Tooltip_craft_Needs") .. ": ";
    toolTip:setTexture(texture);
    toolTip.footNote = getText("Tooltip_craft_pressToRotate", Keyboard.getKeyName(getCore():getKey("Rotate building")))
    return toolTip;
end


ISPlumbingMenu.metalForAnvil = 500;

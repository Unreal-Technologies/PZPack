PaintVehicle = PaintVehicle or {}

function PaintVehicle.createItemMenu(player, context, items)
    local item
    for _, v in ipairs(items) do
        local test = v
        if not instanceof(v, "InventoryItem") then
            test = v.items[1]
        end
        if test:getFullType():find("PaintYourRide.CataloguePaint") then
            item = test
        end
    end

    if item then
        context:addOption(getText("ContextMenu_PaintYourRide_CatalogueView"), player, PaintVehicle.onViewCatalogue, item)
    end
end

function PaintVehicle.onViewCatalogue(player, item)
    local character = getSpecificPlayer(player)
    if luautils.haveToBeTransfered(character, item) then
        local action = ISInventoryTransferAction:new(character, item, item:getContainer(), character:getInventory())
        action:setOnComplete(PaintVehicle.onViewCatalogue, player, item)
        ISTimedActionQueue.add(action)
        return
    end

    if JoypadState.players[player + 1] then
        local inv = getPlayerInventory(player)
        local loot = getPlayerLoot(player)
        inv:setVisible(false)
        loot:setVisible(false)
    end

    local catalogueUI = UIPaintCatalogue:new(character, item, PaintVehicle.getCatalogue(item))
    catalogueUI:initialise()
    local wrapper = catalogueUI:wrapInCollapsableWindow(item:getDisplayName(), false, UIPaintCatalogueWrapper)
    wrapper:setInfo(getText("IGUI_PaintVehicle_Panel_Catalogue_Info"))
    wrapper:setWantKeyEvents(true)
    catalogueUI.wrap = wrapper
    wrapper.catalogueUI = catalogueUI
    catalogueUI.render = UIPaintCatalogue.noRender
    catalogueUI.prerender = UIPaintCatalogue.noRender
    wrapper:setVisible(true)
    wrapper:addToUIManager()
    if JoypadState.players[player + 1] then
        setJoypadFocus(player, catalogueUI)
    end
end

function PaintVehicle.getCatalogue(item)
    if item:getType() == "CataloguePaintSpray" then
        if Translator.getLanguage():name() == "RU" then
            return "media/ui/catalogues/CataloguePaintSpray_RU.png"
        end
        return "media/ui/catalogues/CataloguePaintSpray.png"
    elseif item:getType() == "CataloguePaintTints" then
        if Translator.getLanguage():name() == "RU" then
            return "media/ui/catalogues/CataloguePaintTints_RU.png"
        end
        return "media/ui/catalogues/CataloguePaintTints.png"
    end
end

Events.OnFillInventoryObjectContextMenu.Add(PaintVehicle.createItemMenu)
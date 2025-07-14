require('ISUI/ISInventoryPage')
require('ISUI/ISInventoryPane')

SearchContainers = SearchContainers or {};

local isFlatUI = getActivatedMods():contains("\\Driss")
ISInventoryPane.isRefreshing = false -- Guard variable to track refresh state


local originalCreateChildren = ISInventoryPage.createChildren
function ISInventoryPage:createChildren()
    -- Call the original createChildren function first
    originalCreateChildren(self)

    -- Create a button to search in the container
    local weightWid = math.max(90, getTextManager():MeasureStringX(UIFont.Small, "99.99 / 99") + 10)

    local y
    if isFlatUI then
        y = self:titleBarHeight() - 20
    else
        y = self:titleBarHeight() - 21
    end

    self.searchField = ISTextEntryBox:new("", 15, y, 100, 10);
    self.searchField:initialise()
    self.searchField.tooltip = getText("ContextMenu_searchTip")
    self.searchField.onTextChange = function()
        local searchFilter = self.searchField:getInternalText()
        self:onSearchContainer(searchFilter)
    end
    if isFlatUI then
        self.searchField.borderColor = { r = 0, g = 0, b = 0, a = 0.0 };
        self.searchField.backgroundColor = { r = 1, g = 1, b = 1, a = 0.1 };

        self.searchField.onMouseMove = function()
            self.searchField.backgroundColor = { r = 1, g = 1, b = 1, a = 0.3 };
        end

        self.searchField.onMouseMoveOutside = function()
            self.searchField.backgroundColor = { r = 1, g = 1, b = 1, a = 0.1 };
        end
    else
        self.searchField.backgroundColor = { r = 0, g = 0, b = 0, a = 1 };
    end
    self:addChild(self.searchField)
    self.searchField:setVisible(false) -- initially hide the search field
end

if isFlatUI then require('SUI/SUI_ISInventoryPage') end
local originalPrerender = ISInventoryPage.prerender
function ISInventoryPage:prerender()
    originalPrerender(self)

    -- Check if the conditions for the search are still met
    if self.title and self.inventory:getParent() and not self.onCharacter or (self.title and not self.onCharacter) then
        --Define a table to hold all visible buttons
        local visibleButtons = {}

        -- Turn on button for stove
        if self.toggleStove:getIsVisible() then
            table.insert(visibleButtons, self.toggleStove)
        end

        -- Remove all button for trash bins
        if self.removeAll:getIsVisible() then
            table.insert(visibleButtons, self.removeAll)
        end

        -- NFQualityOfLife mod
        if self.dropAllBtn and self.dropAllBtn:getIsVisible() then
            table.insert(visibleButtons, self.dropAllBtn)
        end

        if self.washBtn and self.washBtn:getIsVisible() then
            table.insert(visibleButtons, self.washBtn)
        end

        -- Auto Loot Mod
        if self.stackItemsButtonIcon and self.stackItemsButtonIcon:getIsVisible() then
            table.insert(visibleButtons, self.stackItemsButtonIcon)
        end

        -- Easy Drop'n'Loot mod
        if self.KAlootAllCompulsively and self.KAlootAllCompulsively:getIsVisible() then
            table.insert(visibleButtons, self.KAlootAllCompulsively)
        end

        --Elgin's Street Sweeper mod
        if self.autoRemoveBtn and self.autoRemoveBtn:getIsVisible() then
            table.insert(visibleButtons, self.autoRemoveBtn)
        end

        local x = self.lootAll:getRight() + 16
        for _, button in ipairs(visibleButtons) do
            local right = button:getRight()
            if right > x then
                x = right + 16
            end
        end

        -- update field
        self.searchField:setVisible(true)
        self.searchField:setX(x)
    elseif self.title and self.inventory:getParent() and self.onCharacter then
        local x = getTextManager():MeasureStringX(UIFont.Small, self.title) + 60

        self.searchField:setVisible(true)
        self.searchField:setX(x)
    elseif self.title and self.inventory:getType() == "floor" then
        local x = nil

        if self.stackItemsButtonIcon then
            if self.stackItemsButtonIcon:getIsVisible() then
                x = self.lootAll:getRight() + 20
            end
        else
            x = self.lootAll:getRight() + 16
        end

        self.searchField:setVisible(true)
        self.searchField:setX(x)
    elseif self.title and self.inventory:getType():sub(1, #"Bag") and not self.onCharacter then
        --Define a table to hold all visible buttons
        local visibleButtons = {}

        -- NFQualityOfLife mod
        if self.dropAllBtn and self.dropAllBtn:getIsVisible() then
            table.insert(visibleButtons, self.dropAllBtn)
        end

        local x = self.lootAll:getRight() + 16
        for _, button in ipairs(visibleButtons) do
            local right = button:getRight()
            if right > x then
                x = right + 16
            end
        end

        self.searchField:setVisible(true)
        self.searchField:setX(x)
    elseif self.title and self.inventory:getType():sub(1, #"Bag") and self.onCharacter then
        local x = getTextManager():MeasureStringX(UIFont.Small, self.title) + 60

        self.searchField:setVisible(true)
        self.searchField:setX(x)
    else
        -- if conditions not applicable, hide the field
        self.searchField:setVisible(false)
    end
end

local originalRender = ISInventoryPage.render
function ISInventoryPage:render()
    originalRender(self)

    if self.searchField:isVisible() then
        local x
        local y

        if isFlatUI then
            x = 85
            y = 3
        else
            x = 85
            y = 7
        end
        self.searchField:drawTexture(getTexture("media/ui/searchicon.png"), x, y, 1, 1,
            1, 1)
    end
end

local _refreshContainer = ISInventoryPane.refreshContainer
function ISInventoryPane:refreshContainer()
    _refreshContainer(self)

    local searchField = self.inventoryPage and self.inventoryPage.searchField
    if searchField then
        local searchTerm = searchField:getInternalText()

        if searchTerm and searchTerm ~= "" then
            self:searchContainer(searchTerm)
        end
    end
end


function ISInventoryPage:onSearchContainer(searchString)
    self.inventoryPane:searchContainer(searchString)
end

SearchContainers.sortedIndex = {}
SearchContainers.isSortedIndexCreated = false

function ISInventoryPane:searchContainer(searchString)
    local items = {}
    local itemNames = {}

    local it = self.inventory:getItems()

    for i = 0, it:size() - 1 do
        local item = it:get(i)
        local itemName = item:getName()

        if not itemNames[itemName] then
            table.insert(items, item)
            itemNames[itemName] = true -- Mark the item name as added
        end
    end

    ISInventoryPane.sortedItems = SearchContainers.sortByStringMatch(items, searchString)

    SearchContainers.isSortedIndexCreated = false -- Reset the flag when sorting the items
    self.itemSortFunc = SearchContainers.itemSortBySearchContainer

    -- Prevent endless recursion by checking the guard variable
    if not ISInventoryPane.isRefreshing then
        ISInventoryPane.isRefreshing = true -- Set guard to true
        self:refreshContainer()            -- Refresh the container
        ISInventoryPane.isRefreshing = false -- Reset guard
    end
end

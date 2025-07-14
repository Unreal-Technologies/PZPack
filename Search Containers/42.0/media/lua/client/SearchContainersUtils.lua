SearchContainers = SearchContainers or {}

-- Function to return similarity score between two strings using the Jaccard similarity coefficient algorithm
function SearchContainers.stringSimilarity(a, b)
    local n = #a
    local m = #b
    if n == 0 or m == 0 then
        return 0
    end

    local min_len = math.min(n, m)
    local max_len = math.max(n, m)

    local intersection = 0
    local j = 1
    for i = 1, min_len do
        local c = a:sub(i, i)
        while j <= m do
            if b:sub(j, j) == c then
                intersection = intersection + 1
                j = j + 1
                break
            end
            j = j + 1
        end
    end

    return intersection / max_len
end

function SearchContainers.sortByStringMatch(items, searchString)
    -- Create tables to store matching and non-matching items
    local matchingItems = {}
    local nonMatchingItems = {}

    -- Loop through the items and add them to matching or non-matching table
    for _, item in ipairs(items) do
        local name = string.lower(item:getName())                   -- convert name to lowercase for case-insensitive comparison
        local match = string.find(name, string.lower(searchString)) -- check for partial match
        if match then
            table.insert(matchingItems, item)
        else
            table.insert(nonMatchingItems, item)
        end
    end

    -- Sort the matchingItems table based on how closely the item's name matches the search string
    table.sort(matchingItems, function(a, b)
        -- Calculate the similarity score for each item's name compared to the search string
        local scoreA = SearchContainers.stringSimilarity(string.lower(searchString), string.lower(a:getName())) or 0
        local scoreB = SearchContainers.stringSimilarity(string.lower(searchString), string.lower(b:getName())) or 0

        -- Sort the items in descending order based on their similarity score
        if scoreA == scoreB then
            -- If the similarity scores are the same, sort alphabetically
            return a:getName() < b:getName()
        else
            return scoreA > scoreB
        end
    end)

    -- Concatenate the two tables to create a new sorted table with all items
    local sortedItems = {}
    for _, item in ipairs(matchingItems) do
        table.insert(sortedItems, item)
    end
    for _, item in ipairs(nonMatchingItems) do
        table.insert(sortedItems, item)
    end

    -- Return the sorted table
    return sortedItems
end

function SearchContainers.itemSortBySearchContainer(a, b)
    local sortedItems = ISInventoryPane.sortedItems

    -- Create the lookup table for the sorted items if it hasn't been created yet
    if not SearchContainers.isSortedIndexCreated then
        SearchContainers.sortedIndex = {} -- Clear the table before populating it
        for i, item in ipairs(sortedItems) do
            SearchContainers.sortedIndex[item:getName()] = i
        end
        SearchContainers.isSortedIndexCreated = true
    end

    -- Compare the positions of the items in the sorted table
    local aIndex = SearchContainers.sortedIndex[a.name]
    local bIndex = SearchContainers.sortedIndex[b.name]

    if aIndex and bIndex then
        return aIndex < bIndex
    elseif aIndex then
        return true
    elseif bIndex then
        return false
    else
        -- If both items are not in the sorted table, use the default sorting function
        return ISInventoryPane.itemSortByNameInc(a, b)
    end
end

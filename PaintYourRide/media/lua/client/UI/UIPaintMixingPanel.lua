require "ISUI/ISPanelJoypad"

UIPaintMixingPanel = ISPanelJoypad:derive("UIPaintMixingPanel")

UIPaintMixingPanel.instance = {}

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)
local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)

local COLORANTS = {
    -- { title = stringId, colorName = btnInternalColor, color = { c,m,y,k }, progressColor = { r,g,b } }
    cyan = { title = "Cyan", colorName = "cyan", color = { c = 100, m = 0, y = 0, k = 0 }, progressColor = { r = 0, g = 0.6, b = 0.6 } },
    magenta = { title = "Magenta", colorName = "magenta", color = { c = 0, m = 100, y = 0, k = 0 }, progressColor = { r = 0.6, g = 0, b = 0.6 } },
    yellow = { title = "Yellow", colorName = "yellow", color = { c = 0, m = 0, y = 100, k = 0 }, progressColor = { r = 0.6, g = 0.6, b = 0 } },
    black = { title = "Black", colorName = "black", color = { c = 0, m = 0, y = 0, k = 100 }, progressColor = { r = 0.05, g = 0.05, b = 0.05 } },
    red = { title = "Red", colorName = "red", color = { c = 0, m = 100, y = 100, k = 0 }, progressColor = { r = 0.6, g = 0, b = 0 } },
    green = { title = "Green", colorName = "green", color = { c = 100, m = 0, y = 100, k = 0 }, progressColor = { r = 0, g = 0.6, b = 0 } },
    blue = { title = "Blue", colorName = "blue", color = { c = 100, m = 100, y = 0, k = 0 }, progressColor = { r = 0, g = 0, b = 0.6 } }
}

---
--- A UIPaintBlockColorant widget.
---
---@param x number The x coordinate of the block
---@param y number The y coordinate of the block
---@param width number The block's width
---@param title string The blocks title
---@param btnInternalColor string The color's internal name
---@param btnClickTarget self
---@param btnOnClick function The callback function to handle buttons' clicks
---@param progressColor table The color for the block's UIPaintProgressBar represented with a table { r=0-1, g=0-1, b=0-1 }
function UIPaintMixingPanel:addBlock(x, y, width, title, btnInternalColor, btnClickTarget, btnOnClick, progressColor)
    local block = UIPaintBlockColorant:new(x, y, width, 0, title, btnInternalColor, btnClickTarget, btnOnClick, progressColor)
    block:initialise()
    block:instantiate()
    self:addChild(block)
    return block
end

function UIPaintMixingPanel:addButton(x, y, width, height, title, clicktarget, onclick, internal)
    local btn = ISButton:new(x, y, width, height, title, clicktarget, onclick)
    btn.internal = internal
    btn:initialise()
    btn:instantiate()
    btn.borderColor = self.buttonBorderColor
    self:addChild(btn)
    return btn
end

function UIPaintMixingPanel:setVisible(bVisible)
    if self.javaObject == nil then
        self:instantiate();
    end
    self.javaObject:setVisible(bVisible);
    if self.visibleTarget and self.visibleFunction then
        self.visibleFunction(self.visibleTarget, self);
    end
end

function UIPaintMixingPanel:initialise()
    ISPanelJoypad.initialise(self)
end

function UIPaintMixingPanel:createChildren()
    local panelPadding = 10
    local leftGroupWidth = 340
    local rightGroupWidth = 280
    local blockMarginBottom = 4

    -- Panel title
    local titleWidth = getTextManager():MeasureStringX(UIFont.Medium, getText("IGUI_PaintVehicle_Panel_Title"))
    local title = ISLabel:new((self:getWidth() - titleWidth) / 2, panelPadding, FONT_HGT_MEDIUM, getText("IGUI_PaintVehicle_Panel_Title"), 1, 1, 1, 1, UIFont.Medium, true)
    title:initialise()
    title:instantiate()
    self:addChild(title)

    -- LEFT GROUP
    -- Colorants blocks
    local y = title:getBottom() + 10
    local blockWidth = leftGroupWidth - panelPadding - panelPadding / 2

    self.blockRed = self:addBlock(panelPadding, y, blockWidth, COLORANTS.red.title, COLORANTS.red.colorName, self, UIPaintMixingPanel.onClick, COLORANTS.red.progressColor)
    y = self.blockRed:getBottom() + blockMarginBottom

    self.blockYellow = self:addBlock(panelPadding, y, blockWidth, COLORANTS.yellow.title, COLORANTS.yellow.colorName, self, UIPaintMixingPanel.onClick, COLORANTS.yellow.progressColor)
    y = self.blockYellow:getBottom() + blockMarginBottom

    self.blockGreen = self:addBlock(panelPadding, y, blockWidth, COLORANTS.green.title, COLORANTS.green.colorName, self, UIPaintMixingPanel.onClick, COLORANTS.green.progressColor)
    y = self.blockGreen:getBottom() + blockMarginBottom

    self.blockCyan = self:addBlock(panelPadding, y, blockWidth, COLORANTS.cyan.title, COLORANTS.cyan.colorName, self, UIPaintMixingPanel.onClick, COLORANTS.cyan.progressColor)
    y = self.blockCyan:getBottom() + blockMarginBottom

    self.blockBlue = self:addBlock(panelPadding, y, blockWidth, COLORANTS.blue.title, COLORANTS.blue.colorName, self, UIPaintMixingPanel.onClick, COLORANTS.blue.progressColor)
    y = self.blockBlue:getBottom() + blockMarginBottom

    self.blockMagenta = self:addBlock(panelPadding, y, blockWidth, COLORANTS.magenta.title, COLORANTS.magenta.colorName, self, UIPaintMixingPanel.onClick, COLORANTS.magenta.progressColor)
    y = self.blockMagenta:getBottom() + blockMarginBottom

    self.blockBlack = self:addBlock(panelPadding, y, blockWidth, COLORANTS.black.title, COLORANTS.black.colorName, self, UIPaintMixingPanel.onClick, COLORANTS.black.progressColor)
    y = self.blockBlack:getBottom()

    -- Disclaimer
    local disclaimer = ISLabel:new(panelPadding, y + 10, FONT_HGT_SMALL, getText("IGUI_PaintVehicle_Panel_Disclaimer"), 0.8, 0.8, 0.8, 1, UIFont.Small, true)
    disclaimer:initialise()
    disclaimer:instantiate()
    self:addChild(disclaimer)
    y = disclaimer:getBottom() + 10

    -- Bottom buttons
    local btnWid = 100
    local btnHgt = math.max(FONT_HGT_SMALL + 3 * 2, 25)

    self.btnApply = self:addButton(panelPadding, y, btnWid, btnHgt, getText("IGUI_PaintVehicle_Panel_BtnApply"), self, UIPaintMixingPanel.onClick, "APPLY")
    self.btnClear = self:addButton(self.btnApply:getRight() + 5, y, btnWid, btnHgt, getText("IGUI_PaintVehicle_Panel_BtnClear"), self, UIPaintMixingPanel.onClick, "CLEAR")
    self.btnClose = self:addButton(self:getWidth() - btnWid - panelPadding, y, btnWid, btnHgt, getText("IGUI_PaintVehicle_Panel_BtnClose"), self, UIPaintMixingPanel.onClick, "CLOSE")

    -- RIGHT GROUP. Elements in the reverse order
    blockWidth = rightGroupWidth - panelPadding - panelPadding / 2
    local x = leftGroupWidth + panelPadding / 2
    -- Bottom equipment block (base paint and spray gun)
    self.blockEquipment2 = UIPaintBlockEquipment2:new(x, y + 20, blockWidth, 20)
    self.blockEquipment2:initialise()
    self.blockEquipment2:instantiate()
    self:addChild(self.blockEquipment2)
    self.checkboxEquipment2 = self.blockEquipment2:getTickBox()
    self:updateEquipment2()
    self.blockEquipment2:setY(self.blockBlack:getBottom() - self.blockEquipment2:getHeight())

    -- Top equipment block (PPE)
    y = self.blockEquipment2:getY() - blockMarginBottom
    self.blockEquipment1 = UIPaintBlockEquipment1:new(x, y + 20, blockWidth, 20, self, UIPaintMixingPanel.onClickRadio)
    self.blockEquipment1:initialise()
    self.blockEquipment1:instantiate()
    self:addChild(self.blockEquipment1)
    self.radioEquipment1 = self.blockEquipment1:getRadioButtons()
    self:updateEquipment1()
    self.blockEquipment1:setY(self.blockEquipment2:getY() - blockMarginBottom - self.blockEquipment1:getHeight())

    -- Preview image
    y = title:getBottom() + 10
    self.preview = UIPaintPreviewImage:new(x, y, blockWidth, self.blockEquipment1:getY() - y - blockMarginBottom)
    self.preview:initialise()
    self.preview:instantiate()
    self:addChild(self.preview)
    self:setPreviewTextures()

    -- Set the panel's height
    self:setHeight(self.btnClose:getBottom() + panelPadding)

    -- Joypad buttons
    self:insertNewLineOfButtons(self.blockRed:getBtn1(), self.blockRed:getBtn2())
    self:insertNewLineOfButtons(self.blockYellow:getBtn1(), self.blockYellow:getBtn2())
    self:insertNewLineOfButtons(self.blockGreen:getBtn1(), self.blockGreen:getBtn2())
    self:insertNewLineOfButtons(self.blockCyan:getBtn1(), self.blockCyan:getBtn2())
    self:insertNewLineOfButtons(self.blockBlue:getBtn1(), self.blockBlue:getBtn2())
    self:insertNewLineOfButtons(self.blockMagenta:getBtn1(), self.blockMagenta:getBtn2())
    self:insertNewLineOfButtons(self.blockBlack:getBtn1(), self.blockBlack:getBtn2())
    self:insertNewLineOfButtons(self.radioEquipment1)
    --self:insertNewLineOfButtons(self.checkboxEquipment2)
    self:insertNewLineOfButtons(self.btnApply, self.btnClear, self.btnClose)
end

function UIPaintMixingPanel:update()
    -- Just in case the vehicle is removed
    if not self.vehicle or not self.vehicle:getSquare() or self.vehicle:getSquare():getMovingObjects():indexOf(self.vehicle) < 0 then
        self:closeSelf()
    end
end

function UIPaintMixingPanel:prerender()
    self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b)
    self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b)

    if self.joyfocus and self:getJoypadFocus() == self.btnApply then
        self:setISButtonForA(self.btnApply)
    else
        self.ISButtonA = nil
        self.btnApply.isJoypad = false
    end

    local now = getTimestampMs()
    if now - (self.checkStuffTime or 0) > 500 then
        self.checkStuffTime = now
        self:checkInventory()
        self:checkPlayerPosition()
    end
end

function UIPaintMixingPanel:render()
    ISPanelJoypad.render(self)

    self:updateButtons()
    self:updatePreview()
end

function UIPaintMixingPanel:onGainJoypadFocus(joypadData)
    ISPanelJoypad.onGainJoypadFocus(self, joypadData)
    self.joypadIndexY = 1
    self.joypadIndex = 1
    self.joypadButtons = self.joypadButtonsY[self.joypadIndexY]
    self.joypadButtons[self.joypadIndex]:setJoypadFocused(true)
    self:setISButtonForB(self.btnClear)
    self:setISButtonForY(self.btnClose)
end

function UIPaintMixingPanel:onJoypadDown(button)
    ISPanelJoypad.onJoypadDown(self, button)
    if button == Joypad.BButton then
        self:onClick(self.btnClear)
    end
end

function UIPaintMixingPanel:onClick(button)
    local isPaused = UIManager.getSpeedControls() and UIManager.getSpeedControls():getCurrentGameSpeed() == 0
    if isPaused then return end

    if button.internal == "APPLY" then
        self:onButtonApply()
    elseif button.internal == "CLEAR" then
        self:resetColor()
    elseif button.internal == "CLOSE" then
        self:closeSelf()
    elseif button.internal == "COLOR" then
        self:calculateColor(button.internalColor, button.internalColorParts)
    end
end

---
--- A callback for the radio buttons with the personal protective equipment.
---
function UIPaintMixingPanel:onClickRadio(buttons, index)
    self.radioSelected = index
end

---
--- Ready to paint.
---
function UIPaintMixingPanel:onButtonApply()
    self:closeSelf()

    -- Transfer tinting paints to the main inventory
    for _, v in pairs(self.colorants) do
        if v.mixed > 0 then
            PaintVehicleHelper.transferUsableItems(self.character, v.type, v.mixed)
        end
    end
    -- Transfer base paint to the main inventory
    PaintVehicleHelper.transferUsableItems(self.character, PaintVehicleConfig.ITEMS.BASE_PAINT, self.paintRequired)

    -- Walk to the vehicle
    ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(self.character, self.vehicle, PaintVehicleConfig.VEHICLE_AREAS[1]))
    -- Unequip a secondary hand item
    PaintVehicleHelper.unequipHandItem(self.character, false)
    -- Wear PPE
    PaintVehicleHelper.wearPPE(self.character, self.radioSelected)
    -- Equip a spray gun
    local sprayGun = PaintVehicleHelper.getFirstSprayGunWithUses(self.character, self.batteryRequired)
    PaintVehicleHelper.equipPrimHandItem(self.character, sprayGun)
    -- Start the timed action
    local color = { h = self.colorHue, s = self.colorSat, v = self.colorVal }
    ISTimedActionQueue.add(PaintVehicleWithMixAction:new(self.character, self.vehicle, color, self.paintRequired, self.colorants))
end

function UIPaintMixingPanel:closeSelf()
    self:setVisible(false)
    self:removeFromUIManager()
    self.instance[self.character:getPlayerNum() + 1] = nil
    local playerNum = self.character:getPlayerNum()
    if JoypadState.players[playerNum + 1] then
        setJoypadFocus(playerNum, nil)
    end
end

---
--- Calculates new color values and updates the colorants blocks.
---
---@param color string The color's internal name (same as a colorant's item type)
---@param parts number Either 1 or 10
function UIPaintMixingPanel:calculateColor(color, parts)
    local cmyk = COLORANTS[color].color
    self.colorCyan = math.min(cmyk.c * (parts / 100) + self.colorCyan, 100)
    self.colorMagenta = math.min(cmyk.m * (parts / 100) + self.colorMagenta, 100)
    self.colorYellow = math.min(cmyk.y * (parts / 100) + self.colorYellow, 100)
    self.colorBlack = math.min(cmyk.k * (parts / 100) + self.colorBlack, 100)

    self.colorRed, self.colorGreen, self.colorBlue = ColorUtils.cmykToRgb(self.colorCyan, self.colorMagenta, self.colorYellow, self.colorBlack)
    self.colorHue, self.colorSat, self.colorVal = ColorUtils.rgbToHsv(self.colorRed, self.colorGreen, self.colorBlue)

    -- Update the mixed colorant value
    self.colorants[color].mixed = self.colorants[color].mixed + parts
    -- Update the colorants' blocks
    self:updateBlocksColorants()
end

function UIPaintMixingPanel:updateBlocksColorants()
    for _, v in pairs(self.colorants) do
        if v.type == PaintVehicleConfig.ITEMS.TINTS.CYAN then
            self.blockCyan:setEnabled(self.hasBasePaint)
            self.blockCyan:setProgress(v.mixed)
            self.blockCyan:setProgressMax(v.max)
        elseif v.type == PaintVehicleConfig.ITEMS.TINTS.MAGENTA then
            self.blockMagenta:setEnabled(self.hasBasePaint)
            self.blockMagenta:setProgress(v.mixed)
            self.blockMagenta:setProgressMax(v.max)
        elseif v.type == PaintVehicleConfig.ITEMS.TINTS.YELLOW then
            self.blockYellow:setEnabled(self.hasBasePaint)
            self.blockYellow:setProgress(v.mixed)
            self.blockYellow:setProgressMax(v.max)
        elseif v.type == PaintVehicleConfig.ITEMS.TINTS.BLACK then
            self.blockBlack:setEnabled(self.hasBasePaint)
            self.blockBlack:setProgress(v.mixed)
            self.blockBlack:setProgressMax(v.max)
        elseif v.type == PaintVehicleConfig.ITEMS.TINTS.RED then
            self.blockRed:setEnabled(self.hasBasePaint)
            self.blockRed:setProgress(v.mixed)
            self.blockRed:setProgressMax(v.max)
        elseif v.type == PaintVehicleConfig.ITEMS.TINTS.GREEN then
            self.blockGreen:setEnabled(self.hasBasePaint)
            self.blockGreen:setProgress(v.mixed)
            self.blockGreen:setProgressMax(v.max)
        elseif v.type == PaintVehicleConfig.ITEMS.TINTS.BLUE then
            self.blockBlue:setEnabled(self.hasBasePaint)
            self.blockBlue:setProgress(v.mixed)
            self.blockBlue:setProgressMax(v.max)
        end
    end
end

function UIPaintMixingPanel:updateButtons()
    -- Apply button
    self.btnApply.enable = self.hasBasePaint and self.hasSprayGun and self.radioSelected > 0
    -- Clear button
    self.btnClear.enable = not (self.colorCyan == 0 and self.colorMagenta == 0 and self.colorYellow == 0 and self.colorBlack == 0)
end

function UIPaintMixingPanel:updatePreview()
    local r, g, b = ColorUtils.hsvToRgb(self.colorHue, self.colorSat * 0.5, self.colorVal)
    self.preview:setOverlayColor(r, g, b)
end

---
--- Resets all color values to default, updates the colorants blocks.
---
function UIPaintMixingPanel:resetColor()
    self.colorCyan, self.colorMagenta, self.colorYellow, self.colorBlack = 0, 0, 0, 0
    self.colorHue, self.colorSat, self.colorVal = 0, 0, 1
    self.colorRed, self.colorGreen, self.colorBlue = 1, 1, 1

    self:resetValues()
    self:updateBlocksColorants()
end

function UIPaintMixingPanel:resetValues()
    for _, v in pairs(self.colorants) do
        v.mixed = 0
    end
end

function UIPaintMixingPanel:checkInventory()
    self:updateEquipment1()
    self:updateEquipment2()
    self:updateColorants()
    self:updateBlocksColorants()
end

---
--- Populates the top requirements block with a personal protective equipment items.
---
function UIPaintMixingPanel:updateEquipment1()
    local indexToSelect = self.radioSelected

    local inventory = self.character:getInventory()
    local invDustMask = inventory:getFirstTypeRecurse(PaintVehicleConfig.ITEMS.DUST_MASK)
    local invGoggles = inventory:getFirstTypeRecurse(PaintVehicleConfig.ITEMS.GOGGLES)
    local invGasMask = inventory:getFirstTypeRecurse(PaintVehicleConfig.ITEMS.GAS_MASK)
    local invBioMask = inventory:getFirstTypeRecurse(PaintVehicleConfig.ITEMS.BIO_MASK)

    local dustMask = self:getItemInstance(PaintVehicleConfig.ITEMS.DUST_MASK)
    local goggles = self:getItemInstance(PaintVehicleConfig.ITEMS.GOGGLES)
    local gasMask = self:getItemInstance(PaintVehicleConfig.ITEMS.GAS_MASK)
    local bioMask = self:getItemInstance(PaintVehicleConfig.ITEMS.BIO_MASK)

    if #self.radioEquipment1.options == 0 then
        self.radioEquipment1:clear()
        self.radioEquipment1:addOption(dustMask:getDisplayName() .. " + " .. goggles:getDisplayName(), dustMask, dustMask:getTexture())
        self.radioEquipment1:addOption(gasMask:getDisplayName(), gasMask, gasMask:getTexture())
        self.radioEquipment1:addOption(bioMask:getDisplayName(), bioMask, bioMask:getTexture())
    end

    self.radioEquipment1:setOptionEnabled(1, invDustMask and invGoggles)
    self.radioEquipment1:setOptionEnabled(2, invGasMask)
    self.radioEquipment1:setOptionEnabled(3, invBioMask)

    -- Initial selection. Choosing what is already equipped
    if indexToSelect == -1 then
        if invDustMask and invGoggles and (invDustMask:isEquipped() or invGoggles:isEquipped()) then
            indexToSelect = 1
        elseif invGasMask and invGasMask:isEquipped() then
            indexToSelect = 2
        elseif invBioMask and invBioMask:isEquipped() then
            indexToSelect = 3
        end
    end

    if indexToSelect > 0 and self.radioEquipment1:isOptionEnabled(indexToSelect) then
        self.radioEquipment1:setSelected(indexToSelect)
    else
        for index, option in ipairs(self.radioEquipment1.options) do
            if option.enabled then
                indexToSelect = index
                self.radioEquipment1:setSelected(index)
                break
            end
        end
    end

    -- Just in case the player removes all PPE from the inventory and therefore won't have any
    if not (invDustMask and invGoggles) and not invGasMask and not invBioMask then
        indexToSelect = -1
    end

    self.radioSelected = indexToSelect

    self.blockEquipment1:onChildPopulated()
end

---
--- Populates the bottom requirements block with a base paint and a spray gun items.
--- Loops through the player's inventory recursively and calculates the amount of the base paint present.
---
function UIPaintMixingPanel:updateEquipment2()
    local inventory = self.character:getInventory()
    local invBasePaintAll = inventory:getAllTypeRecurse(PaintVehicleConfig.ITEMS.BASE_PAINT)
    local invSprayGun = inventory:getFirstTypeRecurse(PaintVehicleConfig.ITEMS.SPRAY_GUN)
    -- Check if a spray gun has enough battery charge
    local isSprayGunCharged
    if invSprayGun then
        isSprayGunCharged = PaintVehicleHelper.getFirstSprayGunWithUses(self.character, self.batteryRequired)
    end

    self.hasSprayGun = (invSprayGun and isSprayGunCharged) and true or false

    local basePaintUsesTotal = 0
    for i = 1, invBasePaintAll:size() do
        local item = invBasePaintAll:get(i - 1)
        basePaintUsesTotal = basePaintUsesTotal + item:getDrainableUsesInt()
    end
    self.hasBasePaint = basePaintUsesTotal >= self.paintRequired
    if not self.hasBasePaint then
        self:resetColor()
    end

    local basePaint = self:getItemInstance(PaintVehicleConfig.ITEMS.BASE_PAINT)
    local sprayGun = self:getItemInstance(PaintVehicleConfig.ITEMS.SPRAY_GUN)

    if #self.checkboxEquipment2.options == 0 then
        self.checkboxEquipment2:clearOptions()
        self.checkboxEquipment2:addOption(basePaint:getDisplayName(), basePaint, basePaint:getTexture())
        self.checkboxEquipment2:addOption(sprayGun:getDisplayName(), sprayGun, sprayGun:getTexture())
    end

    self.checkboxEquipment2:setSelected(1, self.hasBasePaint)
    self.checkboxEquipment2:setSelected(2, self.hasSprayGun)
    self.checkboxEquipment2:disableOption(basePaint:getDisplayName(), true)
    self.checkboxEquipment2:disableOption(sprayGun:getDisplayName(), true)

    if invSprayGun and not isSprayGunCharged then
        self.checkboxEquipment2.tooltip = getText("Tooltip_PaintYourRide_Panel_SprayGunCharge", sprayGun:getDisplayName())
    else
        self.checkboxEquipment2.tooltip = nil
    end

    self.blockEquipment2:onChildPopulated()
end

---
--- Loops through the player's inventory recursively and calculates the amount of all colorants present.
---
function UIPaintMixingPanel:updateColorants()
    for i, _ in pairs(self.colorants) do
        self:updateColorantMax(i)
    end
end

---
--- Loops through the player's inventory recursively and calculates the amount of the specified colorant present.
---
---@param colorName string The color's internal name
function UIPaintMixingPanel:updateColorantMax(colorName)
    local inventory = self.character:getInventory()
    local items = inventory:getAllTypeRecurse(self.colorants[colorName].type)
    local itemUsesTotal = 0
    for i = 1, items:size() do
        local item = items:get(i - 1)
        itemUsesTotal = itemUsesTotal + item:getDrainableUsesInt()
    end

    -- Anti-abuse in case the player removes colorants from the inventory after adding them to a mix
    -- Shouldn't be triggered in normal cases
    if itemUsesTotal < self.colorants[colorName].max then
        self:resetColor()
    end

    -- Update the colorant's max value
    self.colorants[colorName].max = math.min(itemUsesTotal, 100)
end

---
--- Calculates the distance from the player to the vehicle
--- and closes the panel if the player moved too far.
---
function UIPaintMixingPanel:checkPlayerPosition()
    if self.vehicle and self.character:DistTo(self.vehicle:getX(), self.vehicle:getY()) > self.distToVehicle + 2 then
        self:closeSelf()
    end
end

---
--- Sets the preview's textures according to the vehicle's mechanic type.
---
function UIPaintMixingPanel:setPreviewTextures()
    local texture = "media/ui/ride_standard_base.png"
    local textureOverlay = "media/ui/ride_standard_overlay.png"
    local vehicleType = self.vehicle:getScript():getMechanicType()
    if vehicleType == 2 then
        texture = "media/ui/ride_heavy_base.png"
        textureOverlay = "media/ui/ride_heavy_overlay.png"
    elseif vehicleType == 3 then
        texture = "media/ui/ride_sport_base.png"
        textureOverlay = "media/ui/ride_sport_overlay.png"
    end
    self.preview:setTexture(texture)
    self.preview:setTextureOverlay(textureOverlay)
end

function UIPaintMixingPanel:setVehicle(vehicle, paintRequired)
    self.vehicle = vehicle
    self.paintRequired = paintRequired
    self.batteryRequired = math.ceil(paintRequired * PaintVehicleConfig.COEF_USE_SPRAY_GUN * 10)
    self.distToVehicle = self.character:DistTo(vehicle:getX(), vehicle:getY())
    self:setPreviewTextures()

    self:resetColor()
end

---
--- Creates an item of a specified type if its instance doesn't exist.
---
---@return any The InventoryItem instance
function UIPaintMixingPanel:getItemInstance(type)
    if not self.ItemInstances then self.ItemInstances = {} end
    local item = self.ItemInstances[type]
    if not item then
        item = InventoryItemFactory.CreateItem(type)
        if item then
            self.ItemInstances[type] = item
            self.ItemInstances[item:getFullType()] = item
        end
    end
    return item
end

function UIPaintMixingPanel:new(x, y, character, vehicle, paintRequired)
    local width = 620
    local height = 500 -- will be overwritten in createChildren()

    if y == 0 then
        y = getPlayerScreenTop(character:getPlayerNum()) + (getPlayerScreenHeight(character:getPlayerNum()) - height) / 2
    end
    if x == 0 then
        x = getPlayerScreenLeft(character:getPlayerNum()) + (getPlayerScreenWidth(character:getPlayerNum()) - width) / 2
    end

    local o = ISPanelJoypad.new(self, x, y, width, height)
    o.moveWithMouse = true

    o.width = width
    o.height = height
    o.character = character
    o.vehicle = vehicle
    o.distToVehicle = character:DistTo(vehicle:getX(), vehicle:getY())

    o.paintRequired = paintRequired
    o.batteryRequired = math.ceil(paintRequired * PaintVehicleConfig.COEF_USE_SPRAY_GUN * 10)
    o.hasBasePaint = true
    o.hasSprayGun = true
    o.radioSelected = -1

    o.colorants = {
        cyan = { mixed = 0, max = 0, type = PaintVehicleConfig.ITEMS.TINTS.CYAN },
        magenta = { mixed = 0, max = 0, type = PaintVehicleConfig.ITEMS.TINTS.MAGENTA },
        yellow = { mixed = 0, max = 0, type = PaintVehicleConfig.ITEMS.TINTS.YELLOW },
        black = { mixed = 0, max = 0, type = PaintVehicleConfig.ITEMS.TINTS.BLACK },
        red = { mixed = 0, max = 0, type = PaintVehicleConfig.ITEMS.TINTS.RED },
        green = { mixed = 0, max = 0, type = PaintVehicleConfig.ITEMS.TINTS.GREEN },
        blue = { mixed = 0, max = 0, type = PaintVehicleConfig.ITEMS.TINTS.BLUE }
    }

    -- Default base paint color
    -- CMYK [0, 100]
    o.colorCyan, o.colorMagenta, o.colorYellow, o.colorBlack = 0, 0, 0, 0
    -- HSV [0, 1]
    o.colorHue, o.colorSat, o.colorVal = 0, 0, 1
    -- RGB [0, 1]
    o.colorRed, o.colorGreen, o.colorBlue = 1, 1, 1

    o.borderColor = { r = 0.4, g = 0.4, b = 0.4, a = 1 }
    o.backgroundColor = { r = 0, g = 0, b = 0, a = 0.8 }
    o.buttonBorderColor = { r = 0.7, g = 0.7, b = 0.7, a = 0.5 }

    UIPaintMixingPanel.instance[character:getPlayerNum() + 1] = o
    return o
end
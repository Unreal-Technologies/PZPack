
Climb = Climb or {}

function Climb.loadConfig()
    local id = "Climb"
    local options = PZAPI.ModOptions:create(id, getText("UI_optionscreen_binding_Climb_Key"))
    -- addKeyBind(ID, name, value, _tooltip)
    Climb.keyBind = options:addKeyBind("0", getText("UI_optionscreen_binding_Climb_Key"), Keyboard.KEY_F)
end


function Climb.getKey()
    return Climb.keyBind:getValue()
end


STAR_MODS = STAR_MODS or {}
if STAR_MODS.loaded_MainScreenFixes then
	return
end
STAR_MODS.loaded_MainScreenFixes = true



-- Disable hotkey "[" in Main Menu.
local function InjectBrush(old_fn)
	if not old_fn then
		return
	end
	BrushToolChooseTileUI.OnKeyPressed = function(...)
		if not STAR_MODS.inGame then
			return
		end
		return old_fn(...)
	end
end

local old_kpAdd = Events.OnKeyPressed.Add
Events.OnKeyPressed.Add = function(fn)
	if fn == (BrushToolChooseTileUI and BrushToolChooseTileUI.OnKeyPressed) then
		InjectBrush(fn)
	end
	return old_kpAdd(fn)
end


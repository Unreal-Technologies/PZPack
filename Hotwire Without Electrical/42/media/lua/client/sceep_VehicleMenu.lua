-- allows the player to hotwire without the electrical skill.

local old_showRadialMenu = ISVehicleMenu.showRadialMenu

function ISVehicleMenu.showRadialMenu(playerObj)
	old_showRadialMenu(playerObj)
	
	local isPaused = UIManager.getSpeedControls() and UIManager.getSpeedControls():getCurrentGameSpeed() == 0
	if isPaused then return end

	local vehicle = playerObj:getVehicle()

	if vehicle then
		local menu = getPlayerRadialMenu(playerObj:getPlayerNum())
		if vehicle:isDriver(playerObj) and
				not vehicle:isHotwired() and
				not vehicle:isEngineStarted() and
				not vehicle:isEngineRunning() and
				not SandboxVars.VehicleEasyUse and
				not vehicle:isKeysInIgnition() and
				not playerObj:getInventory():haveThisKeyId(vehicle:getKeyId()) then
			if (playerObj:getPerkLevel(Perks.Mechanics) >= 2 or playerObj:HasTrait("Burglar")) then
				if menu.slices[2] then
					menu.slices[2].command = {ISVehicleMenu.onHotwire, playerObj}
					menu:setSliceText(2, getText("ContextMenu_VehicleHotwire"))
					menu:setSliceTexture(2, getTexture("media/ui/vehicles/vehicle_ignitionON.png"))
				end
			else
				if menu.slices[2] then
					menu.slices[2].command = {nil, playerObj}
					menu:setSliceText(2, getText("ContextMenu_SCEEP_VehicleHotwireSkill"))
					menu:setSliceTexture(2, getTexture("media/ui/vehicles/vehicle_ignitionOFF.png"))
				end
			end
		end
	end
end
-- This file gets loaded fourth


if (not isClient()) then
	return
end


local MOD_ID = PlayersOnMapUtil.MOD_ID
local PLAYERS = PlayersOnMapUtil
local Config = PlayersOnMap

local selfIdentifier = PLAYERS.Util.GenUnique()
local PlayerData = {}


do --- This block handles the events and will update the list of players
	local RequestedConfig = false
	local Updates = 0

	-- Called on every player update, used to receive the mod config from the server / to send playerdata to server for distribution
	Events.OnPlayerUpdate.Add(function(player)
		if (player == nil) then
			return
		end

		if (RequestedConfig == false)  then
			sendClientCommand(player, MOD_ID, "RequestConfig", {})
			RequestedConfig = true
		else
			if (Updates % 3 == 0) then
				Updates = 0

				sendClientCommand(player, MOD_ID, "SendInfo", {
					identifier = selfIdentifier,
					data = PLAYERS:GetPlayerInfo(player)
				})
			end

			Updates = Updates + 1
		end
	end)

	-- Called when you get a command from the server
	Events.OnServerCommand.Add(function(module, command, data)
		if (module ~= MOD_ID) then
			return
		end

		if (command == "ReceivedConfig") then
			Config = data
			PlayerData = {}
		end

		if (command == "LoadInfo") then
			PlayerData = data
		end
	end)
end


do -- Main block of code that will handle the actual rendering
	local table_sort = table.sort
	local math_floor = math.floor
	local math_abs = math.abs
	local math_min = math.min
	local math_max = math.max

	local TextManager = getTextManager()
	local function getTextSize(font, text)
		return TextManager:MeasureStringX(font, text)
	end

--[[
	-- Used for testing stacking names instead of overlapping
	local function getAllZombies(pos, radius)
		local DATA = {}
		local CELL = getCell()

		for gsX = pos.x - radius, pos.x + radius, 1 do
			for gsY = pos.y - radius, pos.y + radius, 1 do
				local sq = CELL:getGridSquare(gsX, gsY, 0)

				if sq then
					local movingObjects = sq:getMovingObjects()

					for i = movingObjects:size(), 1, -1 do
						local testZed = movingObjects:get(i - 1);

						if instanceof(testZed, "IsoZombie") then
							DATA[#DATA + 1] = PLAYERS:GetZombieInfo(testZed, true)
						end
					end
				end
			end
		end

		return DATA
	end
	local perf_avg_array={}
	local perf_avg_array_index=1
	local perf_get_avg = function ()
		local s = 0

		for i = 1, #perf_avg_array do
			s = s + perf_avg_array[i]
		end

		return s / #perf_avg_array
	end
]]

	local CarTexture = getTexture("media/ui/PlayersOnMap/car_big_white.png")
	local SteeringWheelTexture = getTexture("media/ui/PlayersOnMap/drive_white.png")
	local w, h = (3 * 2), (3 * 2)

	local function render(self, configName, adminBypass)
		local serverConfig = Config[configName]
		local clientConfig = PlayersOnMapClient[configName]

		if (not clientConfig.Enabled) then
			return
		end

		local localPlayer = getPlayer()
		local localPlayerName = localPlayer:getUsername()
		local localPlayerPosition = PLAYERS:GetPosition(localPlayer)
		local localPlayerFactionName = PLAYERS:GetFactionName(localPlayer)
		--local timestamp = getTimestamp()
		local AllNames = {}

		if (not PlayerData) then
			return
		end

		self:setStencilRect(0, 0, self:getWidth(), self:getHeight())

--[[
		-- -- This is used to test for name stacking instead of overlapping
		local zombies = getAllZombies(localPlayerPosition, 30)
		local _perf_test = getTimestampMs()

		for i=1, #zombies do repeat -- only used for testing
			local data = zombies[i]
			data.playerName = data.playerName .. "-" .. i
]]
		--for i=1, listOfPlayers:size() do repeat -- not needed
		--local player = listOfPlayers:get(i - 1)
		--local data = PLAYERS:GetPlayerInfo(player)

		local InVehicles = {}
		for uuid, data in pairs(PlayerData) do repeat
			local color = PlayersOnMapClient.PlayerDotColor

			if (uuid == selfIdentifier or data.player == localPlayer) then
				color = PlayersOnMapClient.SelfDotColor
			end

			if (not adminBypass) and (data.isPlayerInvisible) then
				break
			end

			if (adminBypass) and (data.isPlayerInvisible) then
				color = {
					r = color.r,
					g = color.g,
					b = color.b,
					a = 0.7
				}
			end

			if (not adminBypass) and (serverConfig.MaximumDistance > 0) then
				local playerDistance = PLAYERS:GetDistance(localPlayerPosition, data.position)

				if (playerDistance > serverConfig.MaximumDistance) then
					break
				end
			end

			local ui = PLAYERS:WorldToUI(self, data.position)
			local X, Y = ui.x, ui.y

			if (adminBypass or serverConfig.ShowNames) and (clientConfig.ShowNames) then
				if (data.vehiclePassengers) then
					InVehicles[#InVehicles + 1] = {
						color = color,
						data = data,
						uuid = uuid,
						X = X,
						Y = Y,
						height = 14
					}

					break -- break here because we will draw the people in vehicles separately
				end
			end

			if (not adminBypass) and (Config.FactionOnly) then
				if (uuid ~= selfIdentifier) then
					if (data.factionName == nil) or (data.factionName ~= localPlayerFactionName) then
						break
					end
				end
			end

			self:drawRect(X - 3, Y - 3, w - 1, h - 1, color.a, color.r, color.g, color.b)
			self:drawRectBorder(X - 3, Y - 3, w, h, color.a, 0, 0, 0)

			if (adminBypass or serverConfig.ShowHeight) and (clientConfig.ShowHeight) then
				local diff = math_floor(localPlayerPosition.z - data.position.z)
				local Y2 = Y - 3

				for i=1, math_abs(diff) do
					local y = (diff < 0) and (Y2 - (i * 3) - 1) or (Y2 + h + (i * 3) - 1)
					self:drawRect(X - 3, y, 3 * 2, 2, color.a, 0, 0, 0)
				end
			end

			if (adminBypass or serverConfig.ShowNames) and (clientConfig.ShowNames) then
				local nameWidth = getTextSize(UIFont.Small, data.playerName)

				if (PlayersOnMapClient.StackNameTags) then
					AllNames[#AllNames + 1] = {
						x = X,
						y = Y - h - 1,
						width = nameWidth,
						height = 14,
						name = data.playerName,
						mapY = data.position.y,
						color = color
					}
				else
					-- background for nameplate
					self:drawRect(X + 3 + 2, Y - h - 1, nameWidth + 1, 14, color.a * 0.5, 0, 0, 0)
					-- text for nameplate
					self:drawText(data.playerName, X + 3 + 3, Y - h - 1, 1, 1, 1, color.a, UIFont.Small)
				end
			end
		until true end

		table_sort(InVehicles, function(a, b)
			return a.data.vehiclePassengers.string < b.data.vehiclePassengers.string
		end)

		local vehicle = {x = 0, y = 0}
		local lastVehicleName = ""

		local zoom = self.mapAPI:getZoomF()
		local zoom_perc = 1.2 * ((zoom - 10.5) / 13.5) -- 10.5min is zoomed out max , 24max is zoomed in max: zoom - 10.5 / (max - min)

		for i=1, #InVehicles do repeat
			local player = InVehicles[i]

			if (lastVehicleName == player.data.vehiclePassengers.string) then
				break
			end

			if (not adminBypass) and (Config.FactionOnly) then
				if (player.uuid ~= selfIdentifier) then
					if (player.data.factionName == nil) or (player.data.factionName ~= localPlayerFactionName) then
						break
					end
				end
			end

			local ui = PLAYERS:WorldToUI(self, player.data.vehiclePassengers.driver.position)
			local wi, wh = 12, 12

			local width, height = math_max(math_min((wi * zoom_perc) * 2, wi), 4), math_max(math_min((wh * zoom_perc) * 2, wh), 4)
			lastVehicleName = player.data.vehiclePassengers.string
			vehicle = {
				x = ui.x,
				y = ui.y,
				width = width,
				height = height,
				w_half = width / 2,
				h_half = height / 2,
				w_actual = wi,
				h_actual = wh,
				w_half_actual = wi / 2
			}

			self:drawRect(vehicle.x - vehicle.w_half - 2, vehicle.y - vehicle.h_half - 1, width + 2, height + 2, player.color.a * 0.75, 0, 0, 0)
			self:drawTextureScaled(CarTexture, vehicle.x - vehicle.w_half - 1, vehicle.y - vehicle.h_half, width, height, player.color.a, PlayersOnMapClient.VehicleDotColor.r, PlayersOnMapClient.VehicleDotColor.g, PlayersOnMapClient.VehicleDotColor.b)

			local gap = vehicle.h_half + 2
			for j=1, #player.data.vehiclePassengers.passengers do repeat
				local pass = player.data.vehiclePassengers.passengers[j]

				if (pass.empty) then
					break
				end

				if (not adminBypass) and (pass.isPlayerInvisible) then
					break
				end

				if (not adminBypass) and (serverConfig.MaximumDistance > 0) then
					local playerDistance = PLAYERS:GetDistance(localPlayerPosition, pass.position)

					if (playerDistance > serverConfig.MaximumDistance) then
						break
					end
				end

				if (not adminBypass) and (Config.FactionOnly) then
					if (pass.playerName ~= localPlayerName) then
						if (pass.factionName == nil) or (pass.factionName ~= localPlayerFactionName) then
							break
						end
					end
				end

				local nameWidth = getTextSize(UIFont.Small, pass.playerName)

				if (PlayersOnMapClient.StackNameTags) then
					local x = vehicle.x
					local driving = false

					if (pass.playerName == player.data.vehiclePassengers.driver.playerName) then
						driving = true
						--x = vehicle.x + vehicle.w_half_actual + 1
					end

					AllNames[#AllNames + 1] = {
						x = x,
						y = vehicle.y,
						width = nameWidth,
						height = 14,
						name = pass.playerName,
						mapY = pass.position.y,
						color = player.color,
						driving = driving
					}
				else
					if (pass.playerName == player.data.vehiclePassengers.driver.playerName) then
						self:drawRect(vehicle.x - vehicle.w_half_actual - (nameWidth / 2) - 1, vehicle.y + gap, nameWidth + vehicle.w_actual + 3, player.height, player.color.a * 0.5, 0, 0, 0)
						self:drawTextCentre(pass.playerName, vehicle.x + vehicle.w_half_actual + 1, vehicle.y + gap, 1, 1, 1, player.color.a, UIFont.Small)
						self:drawTextureScaled(SteeringWheelTexture, vehicle.x - vehicle.w_half_actual - (nameWidth / 2), vehicle.y + gap + 1, vehicle.w_actual, vehicle.h_actual, player.color.a, 1, 1, 1)
					else
						self:drawRect(vehicle.x - (1 + nameWidth) * 0.5, vehicle.y + gap, nameWidth + 1, player.height, player.color.a * 0.5, 0, 0, 0)
						self:drawTextCentre(pass.playerName, vehicle.x, vehicle.y + gap, 1, 1, 1, player.color.a, UIFont.Small)
					end
				end

				gap = gap + player.height + 1
		until true end
	until true end

	if (PlayersOnMapClient.StackNameTags) then
		table_sort(AllNames, function(a, b)
			return a.mapY < b.mapY -- sort list based on players Y position
		end)

		for i=1, #AllNames do
			local player = AllNames[i]

			for j=i+1, #AllNames do
				local target = AllNames[j]

				if (target.x > player.x - (player.width * 0.5)) and (target.x < player.x + (player.width * 0.5)) then
					if (target.y > player.y - target.height - 1) and (target.y < player.y + target.height - 1) then
						target.y = player.y + player.height + 1
					end
				end
			end

			if (player.driving) then
				self:drawRect(player.x - (player.width * 0.5) - 12, player.y + player.height, player.width + 1 + 12, player.height, player.color.a * 0.5, 0, 0, 0)
				self:drawTextureScaled(SteeringWheelTexture, player.x - (player.width / 2) - 12, player.y + player.height + 1, 12, 12, player.color.a, 1, 1, 1)
			else
				self:drawRect(player.x - (player.width * 0.5), player.y + player.height, player.width + 1, player.height, player.color.a * 0.5, 0, 0, 0)
			end

			self:drawTextCentre(player.name, player.x, player.y + player.height, 1, 1, 1, player.color.a, UIFont.Small)
		end
	end

	--[[
		print('-----------------------------------------')
		local t = (getTimestampMs() - _perf_test) / 1000
		print( ('Time taken: %.3fs'):format(t) )
		
		perf_avg_array[perf_avg_array_index] = t
		perf_avg_array_index = perf_avg_array_index + 1
		
		if (perf_avg_array_index > 100) then
			perf_avg_array_index = 1
		end
		
		local avg = perf_get_avg()
		print( ('Average time taken: %.3fs'):format(avg) )
		]]
		self:clearStencilRect() -- do this or UIs will break (maybe)
	end


	-- This will ensure the needed functions exist
	require("ISUI/Maps/ISWorldMap")
	require("ISUI/Maps/ISMiniMap")

	local oldISWorldMap_render = ISWorldMap.render
	local oldISMiniMapInner_render = ISMiniMapInner.render

	-- This gets called when the mini map is open (even if the world map is open)
	function ISMiniMapInner.render(self)
		oldISMiniMapInner_render(self)

		if (ISWorldMap_instance and ISWorldMap_instance:isVisible()) then
			return
		end

		local adminBypass = (Config.AdminsSeeAll and isAdmin())
		if (Config.Enabled) or (adminBypass) then
			if (Config.MiniMap.Enabled) or (adminBypass) then
				render(self, "MiniMap", adminBypass)
			end
		end
	end

	-- This only gets called when the world map is open
	function ISWorldMap.render(self)
		oldISWorldMap_render(self)

		local adminBypass = (Config.AdminsSeeAll and isAdmin())
		if (Config.Enabled) or (adminBypass) then
			if (Config.WorldMap.Enabled) or (adminBypass) then
				render(self, "WorldMap", adminBypass)
			end
		end
	end
end
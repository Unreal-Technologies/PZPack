-- This file gets loaded first


local MOD_ID = "PlayersOnMap"


local DefaultConfig = {
	Enabled         = true,
	FactionOnly     = false,
	AdminsSeeAll    = false,
	WorldMap        = {
		Enabled = true,
		ShowNames = true,
		ShowHeight = true,
		MaximumDistance = 0,
	},
	MiniMap         = {
		Enabled = true,
		ShowNames = true,
		ShowHeight = true,
		MaximumDistance = 0,
	},
}


local DefaultClientConfig = {
	StackNameTags = false,
	VehicleDotColor = {
		r = 1.0,
		g = 1.0,
		b = 1.0,
		a = 1.0
	},
	PlayerDotColor  = {
		r = 1.0,
		g = 0.5,
		b = 0.0,
		a = 1.0
	},
	SelfDotColor  = {
		r = 0.5,
		g = 1.0,
		b = 0.0,
		a = 1.0
	},
	WorldMap = {
		Enabled = true,
		ShowNames = true,
		ShowHeight = true,
	},
	MiniMap = {
		Enabled = true,
		ShowNames = true,
		ShowHeight = true,
	},
}


local Util = {} do
	function Util.CompareAndInsertTable(tbl_1, tbl_2, results, key)
		results = results or {}
		key = key ~= nil and (key .. ".") or ""

		for k, v in pairs(tbl_1) do
			if (tbl_2[k] ~= nil) then
				if (type(v) == "table" and type(tbl_2[k]) == "table") then
					results = Util.CompareAndInsertTable(v, tbl_2[k], results, k)
				else
					if (v ~= tbl_2[k]) then
						results[#results + 1] = {path=key .. k, reason="not equal", old=v, new=tbl_2[k]}
					end
				end
			else
				tbl_2[k] = v
				results[#results + 1] = {path=key .. k, reason="missing", old=v, new=tbl_2[k]}
			end
		end

		return results
	end


	function Util.EscapeKey(str)
		return str:gsub('"', '\\"')
	end


	function Util.TableToString(tbl, indent)
		if (type(tbl) ~= "table") then
			return
		end

		indent = indent or ''
		local str = ''

		for k, v in pairs(tbl) do
			str = str .. indent

			if type(k) == 'string' then
				str = str .. '["' .. Util.EscapeKey(k) .. '"] = '
			else
				str = str .. '[' .. tostring(k) .. '] = '
			end

			if type(v) == 'table' then
				str = str .. '{\n' .. Util.TableToString(v, indent .. '\t') .. indent .. '}'
			else
				if type(v) == 'string' then
					str = str .. '"' .. Util.EscapeKey(v) .. '"'
				else
					str = str .. tostring(v)
				end
			end

			str = str .. ',\n'
		end

		return str
	end


	function Util.GetTableSize(tbl)
		local s = 0
		for k in pairs(tbl) do
			s = s + 1
		end
		return s
	end


	function Util.WriteFile(path, data)
		local file = getModFileWriter(MOD_ID, path, true, false)
		file:write('return {\n' .. Util.TableToString(data, '\t') .. '}')
		file:close()
	end


	function Util.ReadFile(path)
		local file = getModFileReader(MOD_ID, path, true)
		local scanline = file:readLine()
		local content = scanline and '' or 'return {}'

		while scanline do
			content = content .. scanline .. '\n'
			scanline = file:readLine()
		end

		file:close()
		local fun = loadstring(content)
		return fun ~= nil and fun()
	end

	function Util.GenUnique()
		return string.gsub("xxxx", "x", function(c)
			return string.format("%x", ZombRand(0, 0xf))
		end)
	end
end


PlayersOnMap = Util.ReadFile("Config.lua")

if (Util.GetTableSize(PlayersOnMap) == 0) then
	Util.WriteFile("Config.lua", DefaultConfig)
	PlayersOnMap = DefaultConfig

	print( MOD_ID .. " - Config has been created" )
else
	print( MOD_ID .. " - Config has loaded successfully" )
	if (Util.GetTableSize(Util.CompareAndInsertTable(DefaultConfig, PlayersOnMap)) > 0) then
		Util.WriteFile("Config.lua", PlayersOnMap)
	end
end


if (isClient()) then
	PlayersOnMapClient = Util.ReadFile("ClientConfig.lua")

	if (Util.GetTableSize(PlayersOnMapClient) == 0) then
		Util.WriteFile("ClientConfig.lua", DefaultClientConfig)
		PlayersOnMapClient = DefaultClientConfig
		print( MOD_ID .. " - Client Config has been created" )
	else
		print( MOD_ID .. " - Client Config has loaded successfully" )
		if (Util.GetTableSize(Util.CompareAndInsertTable(DefaultClientConfig, PlayersOnMapClient)) > 0) then
			Util.WriteFile("Config.lua", PlayersOnMapClient)
		end
	end
end


-- Helper Functions Below here

-- Alias to this is PLAYERS in PlayersOnMapClient.lua
PlayersOnMapUtil = {
	MOD_ID = MOD_ID,
	DefaultConfig = DefaultConfig,
	Util = Util,
}
do
	function PlayersOnMapUtil:GetVehiclePassengers(player)
		local vehicle = player:getVehicle()

		if (not vehicle) then
			return
		end

		local passengers = {}
		local pass_str = ""
		local driver = {}

		for seat=1, vehicle:getMaxPassengers() do
			if (vehicle:isSeatOccupied(seat - 1)) then
				local char = vehicle:getCharacter(seat - 1) -- Why was this returning null?

				if (char) then
					local name = char:getUsername()

					if (seat == 1) then
						driver = PlayersOnMapUtil:GetPlayerInfo(char, true)--[[{
							position = PlayersOnMapUtil:GetPosition(char),
							name = name,
							invisible = char:isInvisible()
						}]]
					else
						if (not driver.position) then
							driver = {
								position = PlayersOnMapUtil:GetPosition(char),
								playerName = "-----",
								isPlayerInvisible = char:isInvisible()
							}
						end
					end

					passengers[seat] = PlayersOnMapUtil:GetPlayerInfo(char, true)--[[{
						name = name,
						invisible = char:isInvisible()
					}]]

					pass_str = pass_str .. name
				else
					passengers[seat] = {empty = true, name = "-----"}
				end
			else
				passengers[seat] = {empty = true, name = "-----"}
			end
		end

		return {
			passengers = passengers,
			string = pass_str,
			driver = driver
		}
	end


	function PlayersOnMapUtil:GetPosition(player)
		local vehicle = player:getVehicle()

		if (vehicle) then
			return { x = vehicle:getX(), y = vehicle:getY(), z = player:getZ() }
		else
			return { x = player:getX(), y = player:getY(), z = player:getZ() }
		end
	end


	function PlayersOnMapUtil:GetFactionName(player)
		local factions = Faction.getFactions()
		local username = player:getUsername()

		for i = 1, factions:size() do
			local faction = factions:get(i - 1);
			if (faction:isOwner(username) or faction:isMember(username)) then
				return faction:getName()
			end
		end
	end


	function PlayersOnMapUtil:GetDistance(a, b)
		local x = (b.x - a.x) * (b.x - a.x)
		local y = (b.y - a.y) * (b.y - a.y)
		local z = (b.z - a.z) * (b.z - a.z)

		return math.sqrt(x + y + z)
	end


	function PlayersOnMapUtil:WorldToUI(map, pos)
		return {
			x = map.mapAPI:worldToUIX(pos.x, pos.y),
			y = map.mapAPI:worldToUIY(pos.x, pos.y)
		}
	end


	function PlayersOnMapUtil:GetPlayerInfo(player, ignorePassengers)
		ignorePassengers = ignorePassengers or false

		return {
			player = player,
			position = self:GetPosition(player),
			factionName = self:GetFactionName(player),
			lastTimestampUpdate = getTimestamp(),
			isPlayerInvisible = player:isInvisible(),
			playerName = player:getUsername(),
			vehiclePassengers = (ignorePassengers == false) and self:GetVehiclePassengers(player) or nil,
			onlineID = player:getOnlineID()
		}
	end

	--- Used for testing the mini map/world map with "players"
	function PlayersOnMapUtil:GetZombieInfo(zombie, showName)
		return {
			player = zombie,
			position = { x = zombie:getX(), y = zombie:getY(), z = zombie:getZ() },
			playerName = showName and "Zombie" or "",
		}
	end


	function PlayersOnMapUtil:TableContains(tbl, value)
		for k, v in pairs(tbl) do
			if (v == value) then
				return true
			end
		end
	end
end
-- This file gets loaded second


if (not isServer()) then
	return
end


local getTableSize = PlayersOnMapUtil.Util.GetTableSize
local tableToString = PlayersOnMapUtil.Util.TableToString
local compareAndInsertTable = PlayersOnMapUtil.Util.CompareAndInsertTable
local writeFile  = PlayersOnMapUtil.Util.WriteFile
local readFile   = PlayersOnMapUtil.Util.ReadFile

local defaultConfig = PlayersOnMapUtil.DefaultConfig
local MOD_ID = PlayersOnMapUtil.MOD_ID
local PlayerInfo = {}


Events.OnClientCommand.Add(function(module, command, player, data)
	if (module ~= MOD_ID) then
		return
	end


	if (command == "SaveNewConfig") then
		local accesslevel = player:getAccessLevel()

		if (accesslevel == "" or accesslevel == "none") then
			return print( ("[WARNING] %s - `%s` has insufficient permissions to change the server config."):format(MOD_ID, player:getUsername()) )
		end

		local differences = compareAndInsertTable(PlayersOnMap, data)
		if (getTableSize(differences) == 0) then
			return
		end

		print( "Config Difference: " .. "{\n" .. tableToString(differences, "\t") .. "\n}" )

		PlayersOnMap = data
		writeFile("Config.lua", data)
		sendServerCommand(MOD_ID, "ReceivedConfig", data)

		print( MOD_ID .. " - Updated server config for all players." )
	end


	if (command == "RequestConfig") then
		sendServerCommand(player, module, "ReceivedConfig", PlayersOnMap)
		print( ("%s - Config was sent to player `%s`"):format(MOD_ID, player:getUsername()))
	end


	if (command == "SendInfo") then
		PlayerInfo[data.identifier] = data.data
		PlayerInfo[data.identifier].identifier = data.identifier
		-- print( ("%s - SendInfo was received by '%s' with info `%s`"):format(MOD_ID, player:getUsername(), tableToString(data)) )
		sendServerCommand(MOD_ID, "LoadInfo", PlayerInfo)
	end
end)


-- Called every "minute", used to check if any player hasn't updated in a few seconds, to know when to remove them from the info list
Events.EveryOneMinute.Add(function()
	local force = false
	local timestamp = getTimestamp()

	for uuid, data in pairs(PlayerInfo) do
		if (timestamp - data.lastTimestampUpdate > 3) then
			PlayerInfo[uuid] = nil
			force = true
		end
	end

	if (force) then
		sendServerCommand(MOD_ID, "LoadInfo", PlayerInfo)
	end
end)
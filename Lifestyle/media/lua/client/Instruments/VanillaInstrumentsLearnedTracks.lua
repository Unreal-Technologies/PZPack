require('NPCs/MainCreationMethods');

local function VanillaInstrumentsLearnedTracksNewGame(_player)
	local player = _player

	player:getModData().GuitarALearnedTracks = {}
	player:getModData().GuitarELearnedTracks = {}
	player:getModData().GuitarEBLearnedTracks = {}
	player:getModData().FluteLearnedTracks = {}
	player:getModData().BanjoLearnedTracks = {}
	player:getModData().KeytarLearnedTracks = {}
	player:getModData().SaxophoneLearnedTracks = {}
	player:getModData().TrumpetLearnedTracks = {}
	player:getModData().PianoLearnedTracks = {}

end

-- Adding compatibility with existing games
local function VanillaInstrumentsLearnedTracksAtStart()
	local player = getPlayer();
	if player:hasModData() then
		if not player:getModData().GuitarALearnedTracks then
			player:getModData().GuitarALearnedTracks = {}
		end
		if not player:getModData().GuitarELearnedTracks then
			player:getModData().GuitarELearnedTracks = {}
		end
		if not player:getModData().GuitarEBLearnedTracks then
			player:getModData().GuitarEBLearnedTracks = {}
		end
		if not player:getModData().FluteLearnedTracks then
			player:getModData().FluteLearnedTracks = {}
		end
		if not player:getModData().BanjoLearnedTracks then
			player:getModData().BanjoLearnedTracks = {}
		end
		if not player:getModData().KeytarLearnedTracks then
			player:getModData().KeytarLearnedTracks = {}
		end
		if not player:getModData().SaxophoneLearnedTracks then
			player:getModData().SaxophoneLearnedTracks = {}
		end
		if not player:getModData().TrumpetLearnedTracks then
			player:getModData().TrumpetLearnedTracks = {}
		end
		if not player:getModData().PianoLearnedTracks then
			player:getModData().PianoLearnedTracks = {}
		end
	end
end

Events.OnNewGame.Add(VanillaInstrumentsLearnedTracksNewGame)
Events.OnGameStart.Add(VanillaInstrumentsLearnedTracksAtStart)

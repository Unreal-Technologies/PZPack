--------------------------------------------------------------------------------------------------
--		----	  |			  |			|		 |				|    --    |      ----			--
--		----	  |			  |			|		 |				|    --	   |      ----			--
--		----	  |		-------	   -----|	 ---------		-----          -      ----	   -------
--		----	  |			---			|		 -----		------        --      ----			--
--		----	  |			---			|		 -----		-------	 	 ---      ----			--
--		----	  |		-------	   ----------	 -----		-------		 ---      ----	   -------
--			|	  |		-------			|		 -----		-------		 ---		  |			--
--			|	  |		-------			|	 	 -----		-------		 ---		  |			--
--------------------------------------------------------------------------------------------------

if getActivatedMods():contains('True Music_v.2.15') or getActivatedMods():contains('truemusic') or getActivatedMods():contains('truemusic[RF3]') then
	require "TCMusicDefenitions"
end

local function getAvailableGenres()
	local availableGenres = {{name="Disco",cname="cdisco"}, {name="RB",cname="crbsoul"}, {name="Metal",cname="cmetal"}, {name="Salsa",cname="csalsa"}, {name="Pop",cname="cpop"}, {name="Beach",cname="cbeach"},
	{name="Classical",cname="cclassical"}, {name="Country",cname="ccountry"}, {name="Holiday",cname="choliday"}, {name="Jazz",cname="cjazz"}, {name="Muzak",cname="cmuzak"}, {name="Rap",cname="crap"},
	{name="Reggae",cname="creggae"}, {name="Rock",cname="crock"}, {name="World",cname="cworld"}}
	return availableGenres
end

function LoadJukeboxCustomTracks()

	if getActivatedMods():contains('True Music_v.2.15') or getActivatedMods():contains('truemusic') or getActivatedMods():contains('truemusic[RF3]') then
		local NameLibrary = require("JukeboxTracksCustom/Lib")
		for k,v in pairs(GlobalMusic) do
			if luautils.stringStarts(k, "Cassette") then
				local soundLC = string.lower(k)
				local soundName
				for key,style in ipairs(NameLibrary) do
					if soundName then break; end
					for _,singer in ipairs(style.names) do
						local singerLC = string.lower(singer)
						if luautils.stringStarts(soundLC, "cassette"..singerLC) then
						--if string.find(soundLC, singerLC) then
							local AvailableCustomTracks = require("JukeboxTracksCustom/"..style.genre)
							soundName = k
							table.insert(AvailableCustomTracks, {genre=style.cgenre, sound=soundName, length=0})
							break
						end
					end
				end
			end
		end
	end

	local PlayJukeboxCustomTracks = require("TimedActions/PlayJukeboxCustomTracks")
	if (not PlayJukeboxCustomTracks) or (#PlayJukeboxCustomTracks == 0) then return; end
	local availableGenres = getAvailableGenres()
	
	for key,style in ipairs(availableGenres) do
		local AvailableCustomTracks = require("JukeboxTracksCustom/"..style.name)
		for k,v in pairs(PlayJukeboxCustomTracks) do		
			if v.genre == style.cname then
				table.insert(AvailableCustomTracks, v)
			end
		end
	end

end

Events.OnGameStart.Add(LoadJukeboxCustomTracks)


-------------------------------------------------
-- Code to Register Atlas as a MapNotes Plugin --
-------------------------------------------------

local MapNotesForAtlas_Frame = CreateFrame("Frame");
MapNotesForAtlas_Frame:RegisterEvent("VARIABLES_LOADED");

local function MapNotesForAtlas_OnEvent()
	MAPNOTES_PLUGINS_LIST.Atlas = {	name	= "Atlas",
									frame 	= "AtlasFrame",
									keyVal 	= "Atlas_MN_Query",
									lclFnc	= "Atlas_MN_Localiser",
	};
	MapNotes_RegisterPlugin(MAPNOTES_PLUGINS_LIST.Atlas);
end

MapNotesForAtlas_Frame:SetScript("OnEvent", MapNotesForAtlas_OnEvent);




----------------------------------------------------------------------------------------------------
-- Plugin Functions that must be provided for MapNotes to generate note keys, and localised names --
----------------------------------------------------------------------------------------------------

function Atlas_MN_Query()
	local key = nil;
	local mapRaw = AtlasMap:GetTexture();

	if ( mapRaw ) then
		local i, l = 0;				-- note that 'l' is deliberately left 'nil' by this assignment
		while ( true ) do
			i = string.find(mapRaw, "\\", i+2);
			if ( i ) then
				l = i+1;
			else
				break;
			end
		end
		if ( l ) then
			key = string.sub(mapRaw, l);
		end
	end

	return key;
end

function Atlas_MN_Localiser(key)
	for j, value in ipairs(AtlasMaps) do
		if (value[key]) then
			return value[key].ZoneName;
		end
	end

	return;
end


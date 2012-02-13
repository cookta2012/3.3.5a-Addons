--[[
	MapNotes: Adds a note system to the WorldMap and other AddOns that use the Plugins facility provided

	See the README file for more information.
]]


MapNotes_Details = {
	name = MAPNOTES_NAME,
	description = MAPNOTES_ADDON_DESCRIPTION,
	version = MAPNOTES_VERSION,
	releaseDate = "14 November 2007",
	author = "Telic",
	email = "telic@hotmail.co.uk",
	website = MAPNOTES_DOWNLOAD_SITES,
	category = MYADDONS_CATEGORY_MAP,
	frame = "MapNotesOptionsFrame",
	optionsframe = "MapNotesOptionsFrame",
};

MapNotes_Options = {};
MapNotes_Data_Notes = {};
MapNotes_Data_Lines = {};
MapNotes_MiniNote_Data = {};
MapNotes_Undelete_Info = {};
MapNotes_Globals = {};

MapNotes_MiniNote_IsInCity = false;
MapNotes_MiniNote_MapzoomInit = false;
MapNotes_SetNextAsMiniNote = 0;
MapNotes_AllowOneNote = 0;
MapNotes_LastReceivedNote_xPos = 0;
MapNotes_LastReceivedNote_yPos = 0;
MapNotes_ZoneNames = {};
MapNotes_LastLineClick = {};
MapNotes_LastLineClick.time = 0;

MapNotes_TempData_Id = "";
MapNotes_TempData_Creator = "";
MapNotes_TempData_xPos = "";
MapNotes_TempData_yPos = "";
MapNotes_TempData_Icon = "";
MapNotes_TempData_TextColor = "";
MapNotes_TempData_Info1Color = "";
MapNotes_TempData_Info2Color = "";
MapNotes_TempData_miniNote = nil;

MapNotes_PartyNoteData = {};
MapNotes_tloc_xPos = nil;
MapNotes_tloc_yPos = nil;
MapNotes_tloc_name = nil;
MapNotes_tloc_key = nil;

MapNotes_Started = nil;
MN_toggleClosed = nil;
MapNotes_HighlightedNote = "";

local highlightedNotes = {};
local id = 0;
local MapNotesFU_Drawing = nil;
local MapNotesWorldMapTimeSinceLastUpdate = 0;
local MapNotes_DoubleClick_Timer = 0;
local MapNotes_DoubleClick_Key = "";
local MapNotes_DoubleClick_Id = 0;
MapNotes_TargetInfo_Proceed = nil;

local atan2 = math.atan2;
local sin = math.sin;
local cos = math.cos;
local tan = math.tan;
local sqrt = math.sqrt;
local abs = math.abs;

--[[
		Hooked Functions
--]]
local orig_MapNotes_WorldMapButton_OnClick; -- MapNotes hides WorldMapButton_OnClick on right-clicks
local orig_ChatFrame_MessageEventHandler;
local orig_Minimap_OnClick;

local MN_DefaultCoordsX = 60;
local MN_DefaultCoordsY = 532;
local MN_MOFFSET_X = 0.0022;
local MN_MOFFSET_Y = 0.0;
local MN_cUpdate = 0.0;
local MN_cUpdateLimit = 0.05;
local MN_miniRadius = 66;
local MN_currentZoom = 0;
local MN_rotatingMinimap = nil;


local function MapNotes_NewNoteSlot(key)
	local currentZone = MapNotes_Data_Notes[key];
	return MapNotes_GetZoneTableSize(currentZone) + 1;
end

function MapNotes_Hooker()

	-- WorldMapButton_OnClick -- not secure, but couldn't find any Taint of Pet Bars when making notes in combat, etc.
	orig_MapNotes_WorldMapButton_OnClick = WorldMapButton_OnClick;
	WorldMapButton_OnClick = MapNotes_WorldMapButton_OnClick;

	-- ToggleWorldMap
	-- Secure Hook
	hooksecurefunc("ToggleFrame", MapNotes_ToggleWorldMap);
--	hooksecurefunc("ToggleWorldMap", MapNotes_ToggleWorldMap);

	-- ChatFrame_MessageEventHandler
	orig_ChatFrame_MessageEventHandler = ChatFrame_MessageEventHandler;
	ChatFrame_MessageEventHandler = MapNotes_ChatFrame_MessageEventHandler;

	-- Create notes from Minimap clicks
--	orig_Minimap_OnClick = Minimap_OnClick;
	orig_Minimap_OnClick = Minimap:GetScript("OnMouseUp");
--	Minimap_OnClick = MapNotes_Minimap_OnClick;
	Minimap:SetScript("OnMouseUp", MapNotes_Minimap_OnClick);

end

function MapNotes_OnLoad()

	WorldMapMagnifyingGlassButton:SetText(MAPNOTES_WORLDMAP_HELP_1.."\n"..MAPNOTES_WORLDMAP_HELP_2.."\n"..MAPNOTES_WORLDMAP_HELP_3);

	SlashCmdList["MAPNOTES"] = MapNotes_GetNoteBySlashCommand;
	for i = 1, table.getn(MAPNOTES_ENABLE_COMMANDS) do
		setglobal("SLASH_MAPNOTES"..i, MAPNOTES_ENABLE_COMMANDS[i]);
	end

	SlashCmdList["MN_ONENOTE"] = MapNotes_OneNote;
	for i = 1, table.getn(MAPNOTES_ONENOTE_COMMANDS) do
		setglobal("SLASH_MN_ONENOTE"..i, MAPNOTES_ONENOTE_COMMANDS[i]);
	end

	SlashCmdList["MN_MININOTE"] = MapNotes_NextMiniNote;
	for i = 1, table.getn(MAPNOTES_MININOTE_COMMANDS) do
		setglobal("SLASH_MN_MININOTE"..i, MAPNOTES_MININOTE_COMMANDS[i]);
	end

	SlashCmdList["MN_MININOTEONLY"] = MapNotes_NextMiniNoteOnly;
	for i = 1, table.getn(MAPNOTES_MININOTEONLY_COMMANDS) do
		setglobal("SLASH_MN_MININOTEONLY"..i, MAPNOTES_MININOTEONLY_COMMANDS[i]);
	end

	SlashCmdList["MN_MININOTEOFF"] = MapNotes_ClearMiniNoteGlobal;
	for i = 1, table.getn(MAPNOTES_MININOTEOFF_COMMANDS) do
		setglobal("SLASH_MN_MININOTEOFF"..i, MAPNOTES_MININOTEOFF_COMMANDS[i]);
	end

	SlashCmdList["MN_TLOC"] = function(txt, editBox) MapNotes_mntloc(txt); end
	for i = 1, table.getn(MAPNOTES_MNTLOC_COMMANDS) do
		setglobal("SLASH_MN_TLOC"..i, MAPNOTES_MNTLOC_COMMANDS[i]);
	end

	SlashCmdList["MN_QUICKNOTE"] = function(txt, editBox) MapNotes_CreateQuickNote(txt); end
	for i = 1, table.getn(MAPNOTES_QUICKNOTE_COMMANDS) do
		setglobal("SLASH_MN_QUICKNOTE"..i, MAPNOTES_QUICKNOTE_COMMANDS[i]);
	end

	SlashCmdList["MN_QUICKTLOC"] = function(txt, editBox) MapNotes_Quicktloc(txt); end
	for i = 1, table.getn(MAPNOTES_QUICKTLOC_COMMANDS) do
		setglobal("SLASH_MN_QUICKTLOC"..i, MAPNOTES_QUICKTLOC_COMMANDS[i]);
	end

	SlashCmdList["MN_SEARCH"] = MapNotes_Search;
	for i = 1, table.getn(MAPNOTES_SEARCH_COMMANDS) do
		setglobal("SLASH_MN_SEARCH"..i, MAPNOTES_SEARCH_COMMANDS[i]);
	end

	SlashCmdList["MN_HIGHLIGHT"] = MapNotes_Highlight;
	for i = 1, table.getn(MAPNOTES_HLIGHT_COMMANDS) do
		setglobal("SLASH_MN_HIGHLIGHT"..i, MAPNOTES_HLIGHT_COMMANDS[i]);
	end

	SlashCmdList["MN_MINICOORDS"] = MapNotes_MiniCToggle;
	for i = 1, table.getn(MAPNOTES_MINICOORDS_COMMANDS) do
		setglobal("SLASH_MN_MINICOORDS"..i, MAPNOTES_MINICOORDS_COMMANDS[i]);
	end

	SlashCmdList["MN_MAPCOORDS"] = MapNotes_MapCToggle;
	for i = 1, table.getn(MAPNOTES_MAPCOORDS_COMMANDS) do
		setglobal("SLASH_MN_MAPCOORDS"..i, MAPNOTES_MAPCOORDS_COMMANDS[i]);
	end

	SlashCmdList["MN_TARGETNOTE"] = MapNotes_TargetNote;
	for i = 1, table.getn(MAPNOTES_NTARGET_COMMANDS) do
		setglobal("SLASH_MN_TARGETNOTE"..i, MAPNOTES_NTARGET_COMMANDS[i]);
	end

	SlashCmdList["MN_TARGETMERGE"] = MapNotes_MergeNote;
	for i = 1, table.getn(MAPNOTES_MTARGET_COMMANDS) do
		setglobal("SLASH_MN_TARGETMERGE"..i, MAPNOTES_MTARGET_COMMANDS[i]);
	end

	SlashCmdList["MN_WFC"] = MapNotes_WFC;
	for i = 1, table.getn(MAPNOTES_WFC_COMMANDS) do
		setglobal("SLASH_MN_WFC"..i, MAPNOTES_WFC_COMMANDS[i]);
	end

	SlashCmdList["IMPORTMETAMAP"] = MapNotes_ImportMetaMap;					--Telic_4
	for i = 1, table.getn(MAPNOTES_IMPORT_METAMAP) do					--Telic_4
		setglobal("SLASH_IMPORTMETAMAP"..i, MAPNOTES_IMPORT_METAMAP[i]);		--Telic_4
	end											--Telic_4

	SlashCmdList["IMPORTALPHAMAP"] = MapNotes_ImportAlphaMap;				--Telic_4
	for i = 1, table.getn(MAPNOTES_IMPORT_ALPHAMAP) do					--Telic_4
		setglobal("SLASH_IMPORTALPHAMAP"..i, MAPNOTES_IMPORT_ALPHAMAP[i]);		--Telic_4
	end											--Telic_4

	SlashCmdList["IMPORTALPHABGMAP"] = MapNotes_ImportAlphaMapBG;				--Telic_4
	for i = 1, table.getn(MAPNOTES_IMPORT_ALPHAMAPBG) do					--Telic_4
		setglobal("SLASH_IMPORTALPHABGMAP"..i, MAPNOTES_IMPORT_ALPHAMAPBG[i]);		--Telic_4
	end											--Telic_4

	SlashCmdList["IMPORTCTMAP"] = MapNotes_ImportCTMap;					--Telic_4
	for i = 1, table.getn(MAPNOTES_IMPORT_CTMAPMOD) do					--Telic_4
		setglobal("SLASH_IMPORTCTMAP"..i, MAPNOTES_IMPORT_CTMAPMOD[i]);			--Telic_4
	end											--Telic_4

end



function MapNotes_VariablesLoaded()

	MapNotes_MiniNote_Data = {};

	if ( not MapNotes_Options.colourT ) then
		MapNotes_Options.colourT = {};
	end
	if ( not MapNotes_Options.colourT[1] ) then
		MapNotes_Options.colourT[1] = {};
	end
	if ( not MapNotes_Options.colourT[2] ) then
		MapNotes_Options.colourT[2] = {};
	end
	if ( not MapNotes_Options.colourT[3] ) then
		MapNotes_Options.colourT[3] = {};
	end	
	if ( MapNotes_Options.coordF == nil ) then
		MapNotes_Options.coordF = MN_COORD_F;
	else
		MN_COORD_F = MapNotes_Options.coordF;
	end

	if ( MapNotes_Options.miniC == nil ) then
		MapNotes_Options.miniC = true;
	end

	MapNotes_ResetHighlightsOnLoad();

	if ( MapNotes_MiniNote_Data.icon ~= nil ) then
		MN_MiniNotePOITexture:SetTexture(nil);
		if ( ( MapNotes_MiniNote_Data.icon == "party" ) and ( MNIL ) and ( MN_PARTY_ICON ) ) then
			MN_MiniNotePOITexture:SetTexture(MN_PARTY_ICON);
		elseif ( ( MapNotes_MiniNote_Data.icon == "tloc" ) and ( MNIL ) and ( MN_TLOC_ICON ) ) then
			MN_MiniNotePOITexture:SetTexture(MN_TLOC_ICON);
		end
		local txtr = MN_MiniNotePOITexture:GetTexture();
		if ( not txtr ) then
			MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icon"..MapNotes_MiniNote_Data.icon);
		end
	end

	if myAddOnsFrame_Register then
		myAddOnsFrame_Register(MapNotes_Details);
	end

	MapNotes_Hooker();
	MapNotes_LoadMapData();		-- (Also upgrades from previous MapNotes versions
	if ( MapNotes_Data ) then
		MapNotes_Data = nil;		-- {} ? Legacy now remove to nil
	end
	if ( MapNotes_Lines ) then
		MapNotes_Lines = nil;		-- {} ? Legacy now remove to nil
	end
	MapNotes_LoadPlugIns();		--Telic_2

	if ( MapNotes_Options.miniC ) then
		MN_MinimapCoordsFrame:Show();
	end

	if ( MapNotes_Options.shownotes == nil ) then
		MapNotes_Options.shownotes = true;
	end

	if ( not MapNotes_Options.nFactor ) then
		MapNotes_Options.nFactor = MN_DEFAULT_SCALE;
	end
	MN_FrameSlider:SetValue( MapNotes_Options.nFactor );

	if ( not MapNotes_Options.iFactor ) then
		MapNotes_Options.iFactor = MN_DEFAULT_ISCALE;
	end
	MN_IconSlider:SetValue( MapNotes_Options.iFactor );

	if ( not MapNotes_Options.aFactor ) then
		MapNotes_Options.aFactor = MN_DEFAULT_ASCALE;
	end
	MN_AlphaSlider:SetValue( MapNotes_Options.aFactor );

	if ( not MapNotes_Options.coordsLocX ) then
		MapNotes_Options.coordsLocX = MN_DefaultCoordsX;
	end
	if ( not MapNotes_Options.coordsLocY ) then
		MapNotes_Options.coordsLocY = MN_DefaultCoordsY;
	end
	MN_SetCoordsPos();

	local msg = "MapNotes(Fan's Update) |c0000FF00"..MAPNOTES_VERSION.."|r";
	DEFAULT_CHAT_FRAME:AddMessage(msg, 0.64, 0.21, 0.93);

	-- No more quick options so no more need to do this
--	WorldMapZoneMinimapDropDown:ClearAllPoints();
--	WorldMapZoneMinimapDropDown:SetPoint("TOPLEFT", WorldMapPositioningGuide, "TOP", -394, -35); 

	MN_DataCheck(nil);

	SetMapToCurrentZone();
end

function MapNotes_ScaleFrames()
	for i, frame in ipairs(MapNotes.scaleFrames) do
		MapNotes_NormaliseScale( frame );
	end
end

function MapNotes_CheckNearNotes(key, xPos, yPos)
	local i = 1;

	if ( ( not key ) or ( not MapNotes_Data_Notes[key] ) ) then
		local alrt = "!!!";
		if ( key ) then
			alrt = "!!! : "..key;
		end
		DEFAULT_CHAT_FRAME:AddMessage("!!!"..alrt, 0.64, 0.21, 0.93);
	end

	for j, value in ipairs(MapNotes_Data_Notes[key]) do
		local deltax = abs(MapNotes_Data_Notes[key][i].xPos - xPos);
		local deltay = abs(MapNotes_Data_Notes[key][i].yPos - yPos);
		if ( ( deltax <= (0.0009765625 * MapNotes_MinDiff) ) and ( deltay <= (0.0013020833 * MapNotes_MinDiff) ) ) then
			return i;
		end
		i = i + 1;
	end

	return false;
end

function MapNotes_StatusPrint(msg)
	msg = "<"..MAPNOTES_NAME..">: "..msg;
	if DEFAULT_CHAT_FRAME then
		DEFAULT_CHAT_FRAME:AddMessage(msg, 1.0, 0.5, 0.25);
	end
end

function MapNotes_mntloc(msg, name)
	if ( ( not msg ) or ( msg == "" ) ) then
		MapNotes_tloc_xPos = nil;
		MapNotes_tloc_yPos = nil;
		MapNotes_tloc_name = nil;
		MapNotes_tloc_key = nil;
		if ( MapNotes_MiniNote_Data.icon == "tloc" ) then
			MapNotes_ClearMiniNote(true, "tloc");
		end
	else
		SetMapToCurrentZone();
		local x, y = MapNotes_ExtractCoords(msg);
		if ( ( x ) and ( y ) ) then
			if ( not name ) then
				name = MAPNOTES_THOTTBOTLOC;
			end
			MapNotes_tloc_xPos = x / 100;
			MapNotes_tloc_yPos = y / 100;
			MapNotes_tloc_name = name;
			MapNotes_tloc_key = MapNotes_GetMapKey();
			MapNotes_MiniNote_Data.id = 0;
			MapNotes_MiniNote_Data.key = MapNotes_tloc_key;
			MapNotes_MiniNote_Data.xPos = MapNotes_tloc_xPos;
			MapNotes_MiniNote_Data.yPos = MapNotes_tloc_yPos;
			MapNotes_MiniNote_Data.name = MapNotes_tloc_name;
			MapNotes_MiniNote_Data.color = 0;
			MapNotes_MiniNote_Data.icon = "tloc";
			MN_MiniNotePOITexture:SetTexture(nil);
			if ( ( MNIL ) and ( MN_TLOC_ICON ) ) then
				MN_MiniNotePOITexture:SetTexture(MN_TLOC_ICON);
			end
			local txtr = MN_MiniNotePOITexture:GetTexture();
			if ( not txtr ) then
				MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icon"..MapNotes_MiniNote_Data.icon);
			end
		end
	end
	MapNotes_MapUpdate();
end

function MapNotes_GetNoteFromChat(note, who)
	if who ~= UnitName("player") then
		if ( gsub(note, ".*<M_N+>%s+%w+.*p<([^>]*)>.*", "%1", 1) == "1" ) then -- Party Note
			local key = gsub(note, ".*<M_N+> k<([^>]*)>.*", "%1", 1);
			local xPos = gsub(note, ".*<M_N+>%s+%w+.*x<([^>]*)>.*", "%1", 1) + 0;
			local yPos = gsub(note, ".*<M_N+>%s+%w+.*y<([^>]*)>.*", "%1", 1) + 0;
			local lKey = gsub(note, ".*<M_N+>%s+%w+.*l<([^>]*)>.*", "%1", 1);
			MapNotes_PartyNoteData.key = key;
			MapNotes_PartyNoteData.xPos = xPos;
			MapNotes_PartyNoteData.yPos = yPos;
			if ( lKey ) then
				MapNotes_StatusPrint( format( MAPNOTES_PARTY_GET, who, lKey ) );
			else
				MapNotes_StatusPrint( format( MAPNOTES_PARTY_GET, who, MapNotes_GetMapDisplayName(key) ) );
			end
			local worldMapTest = string.sub(key, 1, 3);
			if (	( worldMapTest == "WM " ) and
				( MapNotes_MiniNote_Data.icon == "party" or MapNotes_Options[16] ~= "off" ) ) then
				MapNotes_MiniNote_Data.id = -1;
				MapNotes_MiniNote_Data.key = key;
				MapNotes_MiniNote_Data.xPos = xPos;
				MapNotes_MiniNote_Data.yPos = yPos;
				MapNotes_MiniNote_Data.name = MAPNOTES_PARTYNOTE;
				MapNotes_MiniNote_Data.color = 0;
				MapNotes_MiniNote_Data.icon = "party";
				MN_MiniNotePOITexture:SetTexture(nil);
				if ( ( MNIL ) and ( MN_PARTY_ICON ) ) then
					MN_MiniNotePOITexture:SetTexture(MN_PARTY_ICON);
				end
				local txtr = MN_MiniNotePOITexture:GetTexture();
				if ( not txtr ) then
					MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icon"..MapNotes_MiniNote_Data.icon);
				end

			elseif ( ( worldMapTest ~= "WM " ) and ( MapNotes_MiniNote_Data.icon == "party" ) ) then
				MapNotes_ClearMiniNote(true, "party");
			end

		else
			local key = gsub(note,".*<M_N+> k<([^>]*)>.*","%1",1);
			local xPos = gsub(note,".*<M_N+>%s+%w+.*x<([^>]*)>.*","%1",1) + 0;
			local yPos = gsub(note,".*<M_N+>%s+%w+.*y<([^>]*)>.*","%1",1) + 0;
			local title = gsub(note,".*<M_N+>%s+%w+.*t<([^>]*)>.*","%1",1);
			local info1 = gsub(note,".*<M_N+>%s+%w+.*i1<([^>]*)>.*","%1",1);
			local info2 = gsub(note,".*<M_N+>%s+%w+.*i2<([^>]*)>.*","%1",1);
			local creator = gsub(note,".*<M_N+>%s+%w+.*cr<([^>]*)>.*","%1",1);
			local icon = gsub(note,".*<M_N+>%s+%w+.*i<([^>]*)>.*","%1",1)+0;
			local tcolor = gsub(note,".*<M_N+>%s+%w+.*tf<([^>]*)>.*","%1",1)+0;
			local i1color = gsub(note,".*<M_N+>%s+%w+.*i1f<([^>]*)>.*","%1",1)+0;
			local i2color = gsub(note,".*<M_N+>%s+%w+.*i2f<([^>]*)>.*","%1",1)+0;
			local miniN = gsub(note,".*<M_N+>%s+%w+.*mn<([^>]*)>.*","%1",1);

			if MapNotes_LastReceivedNote_xPos == xPos and MapNotes_LastReceivedNote_yPos == yPos then
				-- do nothing, because the previous note is exactly the same as the current note

			else
				if ( not MapNotes_Data_Notes[key] ) then
					MapNotes_Data_Notes[key] = {};
				end
				local checknote = MapNotes_CheckNearNotes(key, xPos, yPos);
				MapNotes_LastReceivedNote_xPos = xPos;
				MapNotes_LastReceivedNote_yPos = yPos;

				if checknote then
					MapNotes_StatusPrint(format(MAPNOTES_DECLINE_NOTETONEAR, who, MapNotes_GetMapDisplayName(key), MapNotes_Data_Notes[key][checknote].name ) );
					return;
				end
				local n_id = 0;
				local i = MapNotes_GetZoneTableSize(MapNotes_Data_Notes[key]);

				if MapNotes_SetNextAsMiniNote ~= 2 then
					if ( ( MapNotes_AllowOneNote == 1 ) or ( MapNotes_Options[14] ~= "off" ) ) then
						MapNotes_TempData_Id = i + 1;
						MapNotes_Data_Notes[key][MapNotes_TempData_Id] = {};
						MapNotes_Data_Notes[key][MapNotes_TempData_Id].name = title;
						MapNotes_Data_Notes[key][MapNotes_TempData_Id].ncol = tcolor;
						MapNotes_Data_Notes[key][MapNotes_TempData_Id].inf1 = info1;
						MapNotes_Data_Notes[key][MapNotes_TempData_Id].in1c = i1color;
						MapNotes_Data_Notes[key][MapNotes_TempData_Id].inf2 = info2;
						MapNotes_Data_Notes[key][MapNotes_TempData_Id].in2c = i2color;
						MapNotes_Data_Notes[key][MapNotes_TempData_Id].creator = creator;
						MapNotes_Data_Notes[key][MapNotes_TempData_Id].icon = icon;
						MapNotes_Data_Notes[key][MapNotes_TempData_Id].xPos = xPos;
						MapNotes_Data_Notes[key][MapNotes_TempData_Id].yPos = yPos;
						if ( ( MapNotes_SetNextAsMiniNote ~= 0 ) or ( ( miniN ) and ( miniN == "1" ) ) ) then
							MapNotes_Data_Notes[key][MapNotes_TempData_Id].mininote = true;
						end
						n_id = MapNotes_TempData_Id;
						MapNotes_StatusPrint(format(MAPNOTES_ACCEPT_GET, who, MapNotes_GetMapDisplayName(key) ) );

					else
						MapNotes_StatusPrint(format(MAPNOTES_DECLINE_GET, who, MapNotes_GetMapDisplayName(key) ) );
					end
				end

				if MapNotes_SetNextAsMiniNote == 2 then
					MapNotes_MiniNote_Data.xPos = xPos;
					MapNotes_MiniNote_Data.yPos = xPos;
					MapNotes_MiniNote_Data.key = key;
					MapNotes_MiniNote_Data.id = n_id;
					MapNotes_MiniNote_Data.name = title;
					MapNotes_MiniNote_Data.color = tcolor;
					MapNotes_MiniNote_Data.icon = "tloc";
					MN_MiniNotePOITexture:SetTexture(nil);
					if ( ( MNIL ) and ( MN_TLOC_ICON ) ) then
						MN_MiniNotePOITexture:SetTexture(MN_TLOC_ICON);
					end
					local txtr = MN_MiniNotePOITexture:GetTexture();
					if ( not txtr ) then
						MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icon"..MapNotes_MiniNote_Data.icon);
					end
					MapNotes_StatusPrint(MAPNOTES_SETMININOTE);
 				end
				MapNotes_AllowOneNote = 0;
			end
		end
		MapNotes_MapUpdate();
	end
end

function MapNotes_GetNoteBySlashCommand(msg)
	local returnValue = false;
	local cmd, prms = nil, nil;

	if ( ( msg ) and ( msg ~= "" ) ) then
		cmd = strsub(msg, 1, 1);
		if ( ( cmd == "-" ) or ( cmd == "?" ) ) then
			local sep = string.find(msg, " ");
			if ( sep ) then
				prms = string.sub(msg, sep+1);
				cmd = strsub(msg, 1, sep-1);
			else
				cmd = strsub(msg, 1);
				prms = "";
			end
			if ( ( cmd ) and ( prms ) ) then
				cmd = string.lower(cmd);
				MapNotes_MainCommandHandler(cmd, prms);
			else
				MapNotes_Help();
				returnValue = false;
			end

		elseif ( ( string.find(msg, "k<") ) and ( string.find(msg, "x<") ) ) then
			msg = "<M_N> "..msg;
			local key = gsub(msg,".*<M_N+> k<([^>]*)>.*","%1",1);
			local xPos = gsub(msg,".*<M_N+>%s+%w+.*x<([^>]*)>.*","%1",1) + 0;
			local yPos = gsub(msg,".*<M_N+>%s+%w+.*y<([^>]*)>.*","%1",1) + 0;
			local title = gsub(msg,".*<M_N+>%s+%w+.*t<([^>]*)>.*","%1",1);
			local info1 = gsub(msg,".*<M_N+>%s+%w+.*i1<([^>]*)>.*","%1",1);
			local info2 = gsub(msg,".*<M_N+>%s+%w+.*i2<([^>]*)>.*","%1",1);
			local creator = gsub(msg,".*<M_N+>%s+%w+.*cr<([^>]*)>.*","%1",1);
			local icon = gsub(msg,".*<M_N+>%s+%w+.*i<([^>]*)>.*","%1",1)+0;
			local tcolor = gsub(msg,".*<M_N+>%s+%w+.*tf<([^>]*)>.*","%1",1)+0;
			local i1color = gsub(msg,".*<M_N+>%s+%w+.*i1f<([^>]*)>.*","%1",1)+0;
			local i2color = gsub(msg,".*<M_N+>%s+%w+.*i2f<([^>]*)>.*","%1",1)+0;
			local miniN = gsub(msg,".*<M_N+>%s+%w+.*mn<([^>]*)>.*","%1",1);
			local checknote = MapNotes_CheckNearNotes(key, xPos, yPos);
			local n_id = 0;
			local i = MapNotes_GetZoneTableSize(MapNotes_Data_Notes[key]);

			if MapNotes_SetNextAsMiniNote ~= 2 then
				if ( not MapNotes_Data_Notes[key] ) then
					MapNotes_Data_Notes[key] = {};
				end
				local checknote = MapNotes_CheckNearNotes(key, xPos, yPos);
				if checknote then
					MapNotes_StatusPrint(format(MAPNOTES_DECLINE_SLASH_NEAR, MapNotes_Data_Notes[key][checknote].name, MapNotes_GetMapDisplayName(key) ) );
					returnValue = false;
				else
					MapNotes_TempData_Id = i + 1;
					MapNotes_Data_Notes[key][MapNotes_TempData_Id] = {};
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].name = title;
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].ncol = tcolor;
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].inf1 = info1;
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].in1c = i1color;
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].inf2 = info2;
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].in2c = i2color;
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].creator = creator;
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].icon = icon;
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].xPos = xPos;
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].yPos = yPos;
					if ( ( MapNotes_SetNextAsMiniNote ~= 0 ) or ( ( miniN ) and ( miniN == "1" ) ) ) then
						MapNotes_Data_Notes[key][MapNotes_TempData_Id].mininote = true;
					end
					n_id = MapNotes_TempData_Id;
					MapNotes_StatusPrint(format(MAPNOTES_ACCEPT_SLASH, MapNotes_GetMapDisplayName(key) ) );
					returnValue = true;
				end
			end

			if MapNotes_SetNextAsMiniNote == 2 then
				MapNotes_MiniNote_Data.xPos = xPos;
				MapNotes_MiniNote_Data.yPos = yPos;
				MapNotes_MiniNote_Data.key = key;
				MapNotes_MiniNote_Data.id = 0;
				MapNotes_MiniNote_Data.name = title;
				MapNotes_MiniNote_Data.color = tcolor;
				MapNotes_MiniNote_Data.icon = "tloc";
				MN_MiniNotePOITexture:SetTexture(nil);
				if ( ( MNIL ) and ( MN_TLOC_ICON ) ) then
					MN_MiniNotePOITexture:SetTexture(MN_TLOC_ICON);
				end
				local txtr = MN_MiniNotePOITexture:GetTexture();
				if ( not txtr ) then
					MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icon"..MapNotes_MiniNote_Data.icon);
				end

				MapNotes_StatusPrint(MAPNOTES_SETMININOTE);
			end

		else
			MapNotes_Help();
			returnValue = false;
		end

	else
		MapNotes_Help();
		returnValue = false;
	end

	if ( returnValue ) then
		MapNotes_MapUpdate();
	end
	return returnValue;
end

function MapNotes_MainCommandHandler(cmd, prms)
	if ( ( cmd == "-allow" ) or ( cmd == "-a" ) ) then
		MapNotes_OneNote(prms);

	elseif ( cmd == "-allmini" ) then
		MapNotes_TotallyMini();

	elseif ( cmd == "-automini" ) then
		MapNotes_NextMiniNote(prms);
		
	elseif ( cmd == "-nextmini" ) then
		MapNotes_NextMiniNote(prms);

	elseif ( cmd == "-minionly" ) then
		MapNotes_NextMiniNoteOnly(prms);

	elseif ( cmd == "-minioff" ) then
		MapNotes_ClearMiniNoteGlobal();

	elseif ( cmd == "-tloc" ) then
		MapNotes_mntloc(prms);

	elseif ( cmd == "-q" ) then
		MapNotes_CreateQuickNote(prms);

	elseif ( cmd == "-qtloc" ) then
		MapNotes_Quicktloc(prms);

	elseif ( cmd == "-mapc" ) then
		MapNotes_MapCToggle();

	elseif ( cmd == "-minic" ) then
		MapNotes_MiniCToggle();

	elseif ( cmd == "-s" ) then
		MapNotes_Search(prms);

	elseif ( cmd == "-hl" ) then
		MapNotes_Highlight(prms);

	elseif ( cmd == "-t" ) then
		MapNotes_TargetNote(prms);

	elseif ( cmd == "-m" ) then
		MapNotes_MergeNote(prms);

	elseif ( cmd == "-datacheck" ) then
		MN_DataCheck(true);

	elseif ( cmd == "-scale" ) then
		local nFactor = tonumber( prms );
		if ( ( nFactor ) and ( nFactor >= 0.5 ) and ( nFactor <= 1.5 ) ) then
			MapNotes_Options.nFactor = nFactor;
		else
			local msg = "|c0000FF00/mn -scale [0.5 - 1.5] |r";
			MapNotes_StatusPrint(msg);
		end
		MN_FrameSlider:SetValue( MapNotes_Options.nFactor );

	elseif ( cmd == "-undelete" ) then
		MapNotes_Undelete();
		
	elseif ( cmd == "-clearicons" ) then
		MapNotes_ClearIcons();

	elseif ( cmd == "-mstyle" ) then
		MN_CustomMinimapCycler( tonumber(prms) );

	else
		MapNotes_Help();
	end
end

function MapNotes_Help()
	local msg = "MapNotes(Fan's Update) |c0000FF00"..MAPNOTES_VERSION.."|r";
	MapNotes_StatusPrint(msg);
	msg = "|c0000FF00/mn k<WM txt> x<#> y<#> t<txt> i1<txt> i2<#> cr<txt> i<#> tf<#> i1f<#> i2f<#> mn<boolean> |r: " .. MAPNOTES_CHAT_COMMAND_ENABLE_INFO;
	MapNotes_StatusPrint(msg);
	msg = "|c0000FF00/mn -allow  |r: " .. MAPNOTES_CHAT_COMMAND_ONENOTE_INFO;
	MapNotes_StatusPrint(msg);
	msg = "|c0000FF00/mn -nextmini  |r: " .. MAPNOTES_CHAT_COMMAND_MININOTE_INFO;
	MapNotes_StatusPrint(msg);
	msg = "|c0000FF00/mn -minionly  |r: " .. MAPNOTES_CHAT_COMMAND_MININOTEONLY_INFO;
	MapNotes_StatusPrint(msg);
	msg = "|c0000FF00/mn -minioff  |r: " .. MAPNOTES_CHAT_COMMAND_MININOTEOFF_INFO;
	MapNotes_StatusPrint(msg);
	msg = "|c0000FF00/mn -tloc xx,yy  |r: " .. MAPNOTES_CHAT_COMMAND_MNTLOC_INFO;
	MapNotes_StatusPrint(msg);
	msg = "|c0000FF00/mn -q [icon] [title]  |r: " .. MAPNOTES_CHAT_COMMAND_QUICKNOTE;
	MapNotes_StatusPrint(msg);
	msg = "|c0000FF00/mn -qtloc xx,yy [icon] [title]  |r: " .. MAPNOTES_CHAT_COMMAND_QUICKTLOC;
	MapNotes_StatusPrint(msg);
	msg = "|c0000FF00/mn -mapc  |r: " .. MAPNOTES_MAP_COORDS;
	MapNotes_StatusPrint(msg);
	msg = "|c0000FF00/mn -minic  |r: " .. MAPNOTES_MINIMAP_COORDS;
	MapNotes_StatusPrint(msg);	
	msg = "|c0000FF00/mn -s  |r: " .. MAPNOTES_CHAT_COMMAND_SEARCH;
	MapNotes_StatusPrint(msg);
	msg = "|c0000FF00/mn -hl  |r: " .. MAPNOTES_CHAT_COMMAND_HIGHLIGHT;
	MapNotes_StatusPrint(msg);
	msg = "|c0000FF00/mn -t  |r: " .. BINDING_NAME_MN_TARGET_NEW;
	MapNotes_StatusPrint(msg);
	msg = "|c0000FF00/mn -m  |r: " .. BINDING_NAME_MN_TARGET_MERGE;
	MapNotes_StatusPrint(msg);
	msg = "|c0000FF00/mn -scale [0.5 - 1.5] |r: " .. MAPNOTES_CHAT_COMMAND_SCALE;
	MapNotes_StatusPrint(msg);
	msg = "|c0000FF00/mn -undelete |r: " .. MAPNOTES_CHAT_COMMAND_UNDELETE;
	MapNotes_StatusPrint(msg);
end

function MapNotes_Quicktloc(msg, MN_creatorOverride, MN_mininoteOverride)
	if msg == "" then
		MapNotes_StatusPrint(MAPNOTES_QUICKTLOC_NOARGUMENT);

	else
		local x, y, msg = MapNotes_ExtractCoords(msg);
		if ( ( x ) and ( y ) ) then
			local key = MapNotes_GetMapKey();
			x = x / 100;
			y = y / 100;
			local checknote = MapNotes_CheckNearNotes(key, x, y);
			if checknote then
				MapNotes_StatusPrint(format(MAPNOTES_QUICKNOTE_NOTETONEAR,
							   MapNotes_Data_Notes[key][checknote].name ) );

			else
				local n_id = 0;
				local icon = 0;
				local name = MAPNOTES_THOTTBOTLOC;
				if ( ( msg ) and ( msg ~= "" ) ) then
					local icheck = strsub(msg, 1, 2);
					if ( string.find(icheck, "%d%s") ) then
						icon = tonumber( string.sub(msg, 1, 1) );
						msg = strsub(msg, 3);
					end
					if ( ( msg ) and ( msg ~= "" ) ) then
						local msgStart = string.find(msg, "%S");
						local msgBack = 80;
						if ( msgStart ) then
							msgBack = msgStart + 80;
						else
							msgStart = 1;
						end
						msg = strsub(msg, msgStart, msgBack);
						if ( ( msg ) and ( msg ~= "" ) ) then
							name = msg;
						end
					end
				end

				if MapNotes_SetNextAsMiniNote ~= 2 then
					local i = MapNotes_GetZoneTableSize(MapNotes_Data_Notes[key]);
					MapNotes_TempData_Id = i + 1;
					MapNotes_Data_Notes[key][MapNotes_TempData_Id] = {};
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].name = name;
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].ncol = 0;
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].inf1 = "";
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].in1c = 0;
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].inf2 = "";
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].in2c = 0;
					if ( MN_creatorOverride ) then
						MapNotes_Data_Notes[key][MapNotes_TempData_Id].creator = MN_creatorOverride;
						MN_creatorOverride = nil;
					else
						MapNotes_Data_Notes[key][MapNotes_TempData_Id].creator = UnitName("player");
					end
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].icon = icon;
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].xPos = x;
					MapNotes_Data_Notes[key][MapNotes_TempData_Id].yPos = y;
					if ( ( MapNotes_SetNextAsMiniNote ~= 0 ) or ( MN_mininoteOverride ) ) then
						MapNotes_Data_Notes[key][MapNotes_TempData_Id].mininote = true;
					end
					n_id = MapNotes_TempData_Id;
					MapNotes_StatusPrint(format(MAPNOTES_QUICKNOTE_OK, MapNotes_GetMapDisplayName(key) ) );
				end

	 			if MapNotes_SetNextAsMiniNote == 2 then
	 				MapNotes_MiniNote_Data.xPos = x;
	 				MapNotes_MiniNote_Data.yPos = y;
	 				MapNotes_MiniNote_Data.key = key;
	 				MapNotes_MiniNote_Data.id = 0;
	 				MapNotes_MiniNote_Data.name = name;
	 				MapNotes_MiniNote_Data.color = 0;
	 				MapNotes_MiniNote_Data.icon = "tloc";
					MN_MiniNotePOITexture:SetTexture(nil);
					if ( ( MNIL ) and ( MN_TLOC_ICON ) ) then
						MN_MiniNotePOITexture:SetTexture(MN_TLOC_ICON);
					end
					local txtr = MN_MiniNotePOITexture:GetTexture();
					if ( not txtr ) then
						MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icon"..MapNotes_MiniNote_Data.icon);
					end

	 				MapNotes_StatusPrint(MAPNOTES_SETMININOTE);
	 			end
			end
		end
	end

	MapNotes_MapUpdate();
end



function MapNotes_ShortCutNote(x, y, Plugin, miniIt, key)
	if ( ( x ) and ( y ) ) then
		local currentZone;

		if ( not key ) then
			if ( Plugin ) then
				key = MapNotes_PlugInsGetKey(Plugin);
			else
				key = MapNotes_GetMapKey();
			end
		end
		currentZone = MapNotes_Data_Notes[key];

		local checkDist = MapNotes_CheckNearNotes(key, x, y);
		if ( checkDist ) then
			MapNotes_StatusPrint(format(MAPNOTES_DECLINE_SLASH_NEAR, MapNotes_Data_Notes[key][checkDist].name, MapNotes_GetMapDisplayName(key) ) );
			MapNotes_Data_Notes[key][checkDist].mininote = true;
			return;
		end

		if MapNotes_SetNextAsMiniNote ~= 2 then
			MapNotes_TempData_Id = ( MapNotes_GetZoneTableSize( currentZone ) ) + 1;
			currentZone[MapNotes_TempData_Id] = {};
			currentZone[MapNotes_TempData_Id].name = MAPNOTES_QUICKNOTE_DEFAULTNAME;
			currentZone[MapNotes_TempData_Id].ncol = 0;
			currentZone[MapNotes_TempData_Id].inf1 = "";
			currentZone[MapNotes_TempData_Id].in1c = 0;
			currentZone[MapNotes_TempData_Id].inf2 = "";
			currentZone[MapNotes_TempData_Id].in2c = 0;
			currentZone[MapNotes_TempData_Id].creator = UnitName("player"); 	
			currentZone[MapNotes_TempData_Id].icon = 0;
			currentZone[MapNotes_TempData_Id].xPos = x;
			currentZone[MapNotes_TempData_Id].yPos = y;
			n_id = MapNotes_TempData_Id;
			if ( Plugin ) then
				MapNotes_StatusPrint( format( MAPNOTES_QUICKNOTE_OK, MapNotes_GetMapDisplayName(key, Plugin) ) );
			else
				MapNotes_StatusPrint( format( MAPNOTES_QUICKNOTE_OK, MapNotes_GetMapDisplayName(key) ) );
			end
			if ( ( MapNotes_SetNextAsMiniNote ~= 0 ) or ( miniIt ) ) and
				( ( not Plugin ) or ( Plugin.wmflag ) ) then
				currentZone[MapNotes_TempData_Id].mininote = true;
				MapNotes_StatusPrint(MAPNOTES_SETMININOTE);
			end

			return MapNotes_TempData_Id;
		end

		if MapNotes_SetNextAsMiniNote == 2 then
			MapNotes_MiniNote_Data.xPos = x;
			MapNotes_MiniNote_Data.yPos = y;
			MapNotes_MiniNote_Data.key = key;
			MapNotes_MiniNote_Data.id = 0;
			MapNotes_MiniNote_Data.name = MAPNOTES_QUICKNOTE_DEFAULTNAME;
			MapNotes_MiniNote_Data.color = 0;
			MapNotes_MiniNote_Data.icon = "tloc";
			MN_MiniNotePOITexture:SetTexture(nil);
			if ( ( MNIL ) and ( MN_TLOC_ICON ) ) then
				MN_MiniNotePOITexture:SetTexture(MN_TLOC_ICON);
			end
			local txtr = MN_MiniNotePOITexture:GetTexture();
			if ( not txtr ) then
				MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icon"..MapNotes_MiniNote_Data.icon);
			end

			MapNotes_StatusPrint(MAPNOTES_SETMININOTE);
		end

	end
end

function MapNotes_CreateQuickNote(msg, msg2, msg3, shouldMerge, miniIt)
	x, y = GetPlayerMapPosition("player");
	if ( ( ( x ) and ( x == 0 ) ) and ( ( y ) and ( y == 0 ) ) ) then
		SetMapToCurrentZone();
		x, y = GetPlayerMapPosition("player");
	end

	local key = MapNotes_GetMapKey();
	local currentZone = MapNotes_Data_Notes[key];
	local checknote = MapNotes_CheckNearNotes(key, x, y);

	if ( ( checknote ) and ( shouldMerge ) ) then
		MapNotes_Merge(key, checknote, msg, msg2, msg3);
		return;
	end

	if ( checknote ) then
		MapNotes_StatusPrint(format(MAPNOTES_QUICKNOTE_NOTETONEAR,
					   MapNotes_Data_Notes[key][checknote].name ) );

	elseif ( ( x == 0 ) and ( y == 0 ) ) then
		MapNotes_StatusPrint(MAPNOTES_QUICKNOTE_NOPOSITION);

	else
		local n_id = 0;
		local icon = 0;
		local l_zone = GetMinimapZoneText();
		local m_zone = GetRealZoneText();
		if ( l_zone == m_zone ) then
			m_zone = nil;
		end

--		local name = MAPNOTES_QUICKNOTE_DEFAULTNAME;
		local name = "";

		if ( ( msg ) and ( msg ~= "" ) ) then
			local icheck = strsub(msg, 1, 2);
			if ( string.find(icheck, "%d%s") ) then
				icon = tonumber( string.sub(msg, 1, 1) );
				msg = strsub(msg, 3);
			end
			if ( ( msg ) and ( msg ~= "" ) ) then
				local msgStart = string.find(msg, "%S");
				local msgBack = 80;
				if ( msgStart ) then
					msgBack = msgStart + 80;
				else
					msgStart = 1;
				end
				msg = strsub(msg, msgStart, msgBack);
				if ( ( msg ) and ( msg ~= "" ) ) then
					name = msg;
				end
			end
		end

		if ( name == "" ) then
			name = l_zone;
		end

		if ( ( not msg2 ) or ( msg2 == "" ) ) then
			msg2 = "";
			if ( name ~= l_zone ) then
				msg2 = l_zone;
			elseif ( m_zone ) then
				msg2 = m_zone;
			else
				msg2 = MAPNOTES_QUICKNOTE_DEFAULTNAME;
			end
		end

		if ( ( not msg3 ) or ( msg3 == "" ) ) then
			msg3 = "";
			if ( ( name ~= l_zone ) and ( msg2 ~= l_zone ) ) then
				msg3 = l_zone;
			elseif ( ( m_zone ) and ( msg2 ~= m_zone ) ) then
				msg3 = m_zone;
			elseif ( msg2 ~= MAPNOTES_QUICKNOTE_DEFAULTNAME ) then
				msg3 = MAPNOTES_QUICKNOTE_DEFAULTNAME;
			end
		end

		if MapNotes_SetNextAsMiniNote ~= 2 then
			local i = MapNotes_GetZoneTableSize(currentZone);
			MapNotes_TempData_Id = i + 1;
			currentZone[MapNotes_TempData_Id] = {};
			currentZone[MapNotes_TempData_Id].name = name;
			currentZone[MapNotes_TempData_Id].ncol = 0;
			currentZone[MapNotes_TempData_Id].inf1 = msg2;
			currentZone[MapNotes_TempData_Id].in1c = 0;
			currentZone[MapNotes_TempData_Id].inf2 = msg3;
			currentZone[MapNotes_TempData_Id].in2c = 0;
			currentZone[MapNotes_TempData_Id].creator = UnitName("player");
			currentZone[MapNotes_TempData_Id].icon = icon;
			currentZone[MapNotes_TempData_Id].xPos = x;
			currentZone[MapNotes_TempData_Id].yPos = y;
			n_id = MapNotes_TempData_Id;
			MapNotes_StatusPrint(format(MAPNOTES_QUICKNOTE_OK, GetRealZoneText()));
			if ( ( MapNotes_SetNextAsMiniNote ~= 0 ) or ( miniIt ) ) then
				currentZone[MapNotes_TempData_Id].mininote = true;
--				MapNotes_SetNextAsMiniNote = 0;
				MapNotes_StatusPrint(MAPNOTES_SETMININOTE);
			end
		end

		if MapNotes_SetNextAsMiniNote == 2 then
			MapNotes_MiniNote_Data.xPos = x;
			MapNotes_MiniNote_Data.yPos = y;
			MapNotes_MiniNote_Data.key = key;
			MapNotes_MiniNote_Data.id = 0;
			MapNotes_MiniNote_Data.name = name;
			MapNotes_MiniNote_Data.color = 0;
			MapNotes_MiniNote_Data.icon = "tloc";
			MN_MiniNotePOITexture:SetTexture(nil);
			if ( ( MNIL ) and ( MN_TLOC_ICON ) ) then
				MN_MiniNotePOITexture:SetTexture(MN_TLOC_ICON);
			end
			local txtr = MN_MiniNotePOITexture:GetTexture();
			if ( not txtr ) then
				MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icon"..MapNotes_MiniNote_Data.icon);
			end

			MapNotes_StatusPrint(MAPNOTES_SETMININOTE);
		end
	end
end



function MapNotes_Misc_OnClick(self, mouseButton, lclFrame)
	
	local Plugin, key = self.Plugin;

	if ( not MapNotes_FramesHidden() ) then
		return;
	else
		MapNotes_ClearGUI();
	end

	if ( Plugin ) then
		key = MapNotes_PlugInsGetKey(Plugin);
		if ( not lclFrame ) then
			lclFrame = Plugin.frame;
		end

	else
		key = MapNotes_GetMapKey();
		if ( not lclFrame ) then
			lclFrame = WorldMapButton;
		end
	end

	local ax, ay = MapNotes_GetMouseXY(lclFrame);

	local note = "party";
	local theID = -1;
	if ( self:GetID() == 0 ) then
		note = "tloc";
		theID = 0;
	end

	if ( mouseButton == "RightButton" ) then

		if ( ( IsShiftKeyDown() ) and ( not IsAltKeyDown() ) ) then
			if ( note == "party" ) then			--spfix1			--Telic_7
				MapNotes_DeleteNote(-1);						-- 29/07/2007
				if ( this.Plugin ) then							-- 29/07/2007
					MapNotes_PlugInsDrawNotes(this.Plugin);				-- 29/07/2007
				end									-- 29/07/2007
				return;									--Telic_7
				
			else				-- also allow Shift-Right deletion of tloc	-- 29/07/2007
				MapNotes_DeleteNote(0);							-- 29/07/2007
				if ( this.Plugin ) then							-- 29/07/2007
					MapNotes_PlugInsDrawNotes(this.Plugin);				-- 29/07/2007
				end									-- 29/07/2007
				return;									-- 29/07/2007
			end										--Telic_7

		elseif ( ( IsAltKeyDown() ) and ( not IsShiftKeyDown() ) ) then			-- 29/07/2007
			if ( note == "party" ) then							-- 29/07/2007
				local worldMapTest = string.sub(MapNotes_PartyNoteData.key, 1, 3);
				if ( worldMapTest == "WM " ) then
					MapNotes_SetAsMiniNote(-1);	-- Should "Toggle" Party Mininote	-- 29/07/2007
					MapNotes_MapUpdate();							-- 29/07/2007
					return;									-- 29/07/2007
				end
													-- 29/07/2007
			else										-- 29/07/2007
				MapNotes_SetAsMiniNote(0);	-- Should "Toggle" tloc Mininote	-- 29/07/2007
				MapNotes_MapUpdate();							-- 29/07/2007
				return;									-- 29/07/2007
			end									
		end											--Telic_7

		local xOffset, yOffset = MapNotes_GetAdjustedMapXY(lclFrame, ax, ay);			--Telic_1
		-- Needs to be Misc Note info...
		MapNotes:InitialiseDropdown(lclFrame, ax, ay, MapNotes.temp_dd_info, key, theID);
		ToggleDropDownMenu(1, nil, MapNotes.dd, "cursor", 0, 0);

		WorldMapTooltip:Hide();
		GameTooltip:Hide();
		if ( ( note == "party" ) and ( MapNotes_MiniNote_Data.icon == "party" ) ) then	--spfix1
			MapNotes_TempData_Id = -1;
		elseif ( note == "party" ) then							--spfix1
			MapNotes_TempData_Id = -1;
		elseif ( MapNotes_MiniNote_Data.icon == "tloc" ) then				--spfix1
			MapNotes_TempData_Id = 0;
		else										--spfix1
			MapNotes_TempData_Id = 0;
		end
	end
end

function MapNotes_NextMiniNote(msg)
	msg = string.lower(msg);
	if msg == "on" then
		MapNotes_SetNextAsMiniNote = 1;
		MapNotes_StatusPrint(MAPNOTES_MININOTE_SHOW_1);
	elseif msg == "off" then
		MapNotes_SetNextAsMiniNote = 0;
		MapNotes_StatusPrint(MAPNOTES_MININOTE_SHOW_0);
	elseif MapNotes_SetNextAsMiniNote == 1 then
		MapNotes_SetNextAsMiniNote = 0;
		MapNotes_StatusPrint(MAPNOTES_MININOTE_SHOW_0);
	else
		MapNotes_SetNextAsMiniNote = 1;
		MapNotes_StatusPrint(MAPNOTES_MININOTE_SHOW_1);
	end
end

function MapNotes_NextMiniNoteOnly(msg)
	msg = string.lower(msg);
	if msg == "on" then
		MapNotes_SetNextAsMiniNote = 2;
		MapNotes_StatusPrint(MAPNOTES_MININOTE_SHOW_2);
	elseif msg == "off" then
		MapNotes_SetNextAsMiniNote = 0;
		MapNotes_StatusPrint(MAPNOTES_MININOTE_SHOW_0);
	elseif MapNotes_SetNextAsMiniNote == 2 then
		MapNotes_SetNextAsMiniNote = 0;
		MapNotes_StatusPrint(MAPNOTES_MININOTE_SHOW_0);
	else
		MapNotes_SetNextAsMiniNote = 2;
		MapNotes_StatusPrint(MAPNOTES_MININOTE_SHOW_2);
	end
end

function MapNotes_OneNote(msg)
	msg = string.lower(msg);
	if msg == "on" then
		MapNotes_AllowOneNote = 1;
		MapNotes_StatusPrint(MAPNOTES_ONENOTE_ON);
	elseif msg == "off" then
		MapNotes_AllowOneNote = 0;
		MapNotes_StatusPrint(MAPNOTES_ONENOTE_OFF);
	elseif MapNotes_AllowOneNote == 1 then
		MapNotes_AllowOneNote = 0;
		MapNotes_StatusPrint(MAPNOTES_ONENOTE_OFF);
	else
		MapNotes_AllowOneNote = 1;
		MapNotes_StatusPrint(MAPNOTES_ONENOTE_ON);
	end
end


function MapNotes_MinimapUpdateZoom()
	if MapNotes_MiniNote_MapzoomInit then
		if MapNotes_MiniNote_IsInCity then
			MapNotes_MiniNote_IsInCity = false;
		else
			MapNotes_MiniNote_IsInCity = true;
		end
	else
		local tempzoom = 0;
		if GetCVar("minimapZoom") == GetCVar("minimapInsideZoom") then
			if GetCVar("minimapInsideZoom")+0 >= 3 then
				Minimap:SetZoom(Minimap:GetZoom() - 1);
				tempzoom = 1;
			else
				Minimap:SetZoom(Minimap:GetZoom() + 1);
				tempzoom = -1;
			end
		end

		if GetCVar("minimapInsideZoom")+0 == Minimap:GetZoom() then
			MapNotes_MiniNote_IsInCity = true;
		else
			MapNotes_MiniNote_IsInCity = false;
		end

		Minimap:SetZoom(Minimap:GetZoom() + tempzoom);
		MapNotes_MiniNote_MapzoomInit = true;
	end
end

function MapNotes_ChatFrame_MessageEventHandler(self, event, ...)
	if ( ( strsub(event, 1, 16) == "CHAT_MSG_WHISPER" ) and ( strsub(arg1, 1, 5) == "<M_N>" ) ) then
		if strsub(event, 17) == "_INFORM" then
			-- do nothing
		else
			MapNotes_GetNoteFromChat(arg1, arg2);
		end

	else
		orig_ChatFrame_MessageEventHandler(self, event, ...);
	end
end



function MapNotes_WorldMap_OnUpdate(self, elapsed)
	MapNotesWorldMapTimeSinceLastUpdate = MapNotesWorldMapTimeSinceLastUpdate + elapsed;

	local eScale = self:GetEffectiveScale();
	if ( self.eScale ~= eScale ) then
		self.eScale = eScale;
		MapNotes_WorldMapButton_OnUpdate();
	end

	if ( not self.oTimer ) then
		self.oTimer = 0;
	end
	self.oTimer = self.oTimer + elapsed;
	if ( ( self.oTimer > 0.02 ) and ( self.oTimer < 0.12 ) ) then
		MapNotes_WorldMapButton_OnUpdate();
	end

	if ( ( IsControlKeyDown() ) or ( IsShiftKeyDown() ) ) then
		if ( WorldMapFrameAreaLabel:IsVisible() ) then
			WorldMapFrameAreaLabel:Hide();
		end
	else
		if ( not WorldMapFrameAreaLabel:IsVisible() ) then
			WorldMapFrameAreaLabel:Show();
		end
	end

	if ( MapNotesWorldMapTimeSinceLastUpdate > MapNotes_WorldMap_UpdateRate ) then

		if ( IsControlKeyDown() ) then
			if ( WorldMapMagnifyingGlassButton:IsVisible() ) then
				WorldMapMagnifyingGlassButton:Hide();
			end
			if ( not MapNotes_WorldMapButton:IsVisible() ) then
				MapNotes_WorldMapButton:Show();
			end

		elseif ( IsShiftKeyDown() ) then
			if ( WorldMapMagnifyingGlassButton:IsVisible() ) then
				WorldMapMagnifyingGlassButton:Hide();
			end
			if ( MapNotes_WorldMapButton:IsVisible() ) then
				MapNotes_WorldMapButton:Hide();
			end

		else
			if ( not WorldMapMagnifyingGlassButton:IsVisible() ) then
				WorldMapMagnifyingGlassButton:Show();
			end
			if ( MapNotes_WorldMapButton:IsVisible() ) then
				MapNotes_WorldMapButton:Hide();
			end
		end

		MapNotesWorldMapTimeSinceLastUpdate = 0;
	end
end


function MN_CustomMinimapCycler(style)
	if ( ( style ) and ( type(style) == "number" ) ) then
		if ( style == 0 ) then
			MapNotes_Options.customMinimap = nil;
		else
			MapNotes_Options.customMinimap = style;
		end

	elseif ( not MapNotes_Options.customMinimap ) then
		MapNotes_Options.customMinimap = 1;

	else
		MapNotes_Options.customMinimap = MapNotes_Options.customMinimap + 1;
		if ( not MN_MINIMAP_STYLES[ MapNotes_Options.customMinimap ] ) then
			MapNotes_Options.customMinimap = nil;
		end
	end

	if ( MapNotes_Options.customMinimap ) then
		MapNotes_StatusPrint( MapNotes_Options.customMinimap .. " : " .. MN_AUTO_DESCRIPTIONS[ MN_MINIMAP_STYLES[MapNotes_Options.customMinimap] ] );

	else
		MapNotes_StatusPrint( "0 : " .. MN_STYLE_AUTOMATIC );
	end
end

local function MN_GetMinimapShape()
	if ( MapNotes_Options.customMinimap ) then
		return MN_AUTO_MINIMAPS[ MN_MINIMAP_STYLES[MapNotes_Options.customMinimap] ];

	elseif ( GetMinimapShape ) then
		return MN_AUTO_MINIMAPS[ GetMinimapShape() ];
	end

	return nil;
end
local minimapShaped;
local visibilityUpdate = 0;
local MN_currentConst, MN_key;
local MN_pX, MN_pY, MN_dist = 0, 0, 0;
local MN_xPos, MN_yPos = 0, 0;
local MN_xScale, MN_yScale = 1, 1;
function MapNotes_MiniNote_OnUpdate(self, elapsed)
	visibilityUpdate = visibilityUpdate + elapsed;

	if ( ( MapNotes_TargetInfo_Proceed ) and ( GameTooltip:IsVisible() ) ) then
		MapNotes_TargetInfo_Proceed.func();
		return;
	end

	if ( visibilityUpdate > MapNotes_WorldMap_UpdateRate ) then		-- Changed Update Rate slightly higher

		-- check for Minimap shape change via SimpleMinimap in this OnUpdate function
		minimapShaped = MN_GetMinimapShape();

		MN_pX, MN_pY = GetPlayerMapPosition("player");
		local lZone, lCont = GetCurrentMapZone(), GetCurrentMapContinent();
		
		-- NOTE : if no player position or MapZone == 0... no need to show
		if ( ( ( MN_pX == 0 ) and ( MN_pY == 0 ) ) or ( lZone == 0 ) ) then
			MN_MiniNotePOI:Hide();
			MapNotes_HideMiniNotes(1);
			visibilityUpdate = 0;
			return;
		end

		MN_currentConst = nil;							-- reset & use as control for individual OnUpdates
		local counter = 1;
		local key = MapNotes_GetMapKey();
		if ( ( MapNotes_Keys[key] ) and ( MapNotes_Keys[key].miniData ) ) then
			if ( ( MapNotes_Keys[key] ) and ( MapNotes_Keys[key].miniData ) ) then
				MN_currentConst = MapNotes_Keys[key].miniData;
			else
				MN_currentConst = MAPNOTES_DEFAULT_MINIDATA;
			end
			MN_currentZoom = Minimap:GetZoom();
			if ( GetCVar("rotateMinimap") == "1" ) then
				MN_rotatingMinimap = true;
			else
				MN_rotatingMinimap = nil;
			end

			if ( lZone > 0 ) then
				MN_xScale = MapNotes_MiniConst[lCont][MN_currentZoom].xScale;
				MN_yScale = MapNotes_MiniConst[lCont][MN_currentZoom].yScale;
			else
				MN_xScale = MapNotes_MiniConst[MAPNOTES_DEFAULT_MINIDATA.cont][MN_currentZoom].xScale;
				MN_yScale = MapNotes_MiniConst[MAPNOTES_DEFAULT_MINIDATA.cont][MN_currentZoom].yScale;
			end
			if ( MapNotes_MiniNote_IsInCity ) then
				MN_xScale = MN_xScale * MapNotes_CityConst[MN_currentZoom].cityScale;
				MN_yScale = MN_yScale * MapNotes_CityConst[MN_currentZoom].cityScale;
			end

			MN_pX = MN_pX * MN_currentConst.scale + MN_currentConst.xOffset;
			MN_pY = MN_pY * MN_currentConst.scale + MN_currentConst.yOffset;

			if ( ( MapNotes_MiniNote_Data.key == key ) and ( MapNotes_MiniNote_Data.xPos ) ) then
				MN_xPos = MapNotes_MiniNote_Data.xPos * MN_currentConst.scale + MN_currentConst.xOffset;
				MN_yPos = MapNotes_MiniNote_Data.yPos * MN_currentConst.scale + MN_currentConst.yOffset;
				MN_xPos = (MN_xPos - MN_pX) * MN_xScale;
				MN_yPos = (MN_yPos - MN_pY) * MN_yScale;
				MN_MiniNotePOI.key = key;
				MN_MiniNotePOI.nid = MapNotes_MiniNote_Data.id;
				MN_MiniNotePOI.xPos = MN_xPos;
				MN_MiniNotePOI.yPos = MN_yPos;
				MN_MiniNotePOI.ref = MapNotes_MiniNote_Data.id;
				MN_MiniNotePOI.dist = sqrt( MN_xPos*MN_xPos + MN_yPos*MN_yPos );
				if ( not MN_MiniNotePOI:IsVisible() ) then
					MN_MiniNotePOI.timeSinceLastUpdate = 0;
					-- MN_MiniNotePOI only shown through this routine now, and no explicit :Show() anywhere else, so the expected valudes for POI should be managed from here
					-- so that it can be treated in exactly the same way as a normal MapNote Mininote detailed below
					POI_OnUpdate(1, MN_MiniNotePOI);
				end
			else
				MN_MiniNotePOI:Hide();
	 		end

			-- Plot normal MapNote Mininotes
			if ( MapNotes_Data_Notes[key] ) then
				local supData, subData = MapNotes_Data_Notes[key];
				local i, POI, POITexture = 1;
				while ( supData[i] ) do
					subData = supData[i];
					if ( subData.mininote ) then
						POI = getglobal("MN_MiniNotePOI"..counter);
						if ( not POI ) then
							POI = CreateFrame("Button", "MN_MiniNotePOI"..counter, Minimap, "MN_MiniNotePOITemplate");
						end
						if ( POI ) then
							MN_xPos = subData.xPos * MN_currentConst.scale + MN_currentConst.xOffset;
							MN_yPos = subData.yPos * MN_currentConst.scale + MN_currentConst.yOffset;
							MN_xPos = (MN_xPos - MN_pX) * MN_xScale;
							MN_yPos = (MN_yPos - MN_pY) * MN_yScale;
							POI.ref = i;
							POI.key = key;
							POI.nid = i;
							POI.xPos = MN_xPos;
							POI.yPos = MN_yPos;
							POI.dist = sqrt( MN_xPos*MN_xPos + MN_yPos*MN_yPos );

							POI.key = key;
							POI.timeSinceLastUpdate = 0;
							-- Custom
							POITexture = getglobal(POI:GetName().."Texture");
							POITexture:SetTexture(nil);
							if ( ( MNIL ) and ( subData.customIcon ) ) then
								POITexture:SetTexture( subData.customIcon );
							end
							if ( not POITexture:GetTexture() ) then
								POITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icon"..subData.icon);
							end
							POI_OnUpdate(1, POI);

							counter = counter + 1;
						end
					end
					i = i + 1;
				end
			end

		else
			MN_MiniNotePOI:Hide();
		end

		MapNotes_HideMiniNotes(counter);		-- hide remaining Mininotes
		visibilityUpdate = 0;
	end
end


local MN_facing;
-- Basically the design here is to keep as many of the "traditional" required variables in the main OnUpdate because they don't need to be calculated SO frequently...
-- If possible, the only variable that needs Frequent updating is the Rotation Angle... But I move the test of the "if Rotation turned on" test in to the Main OnUpdate also, and only do a boolean test here
-- In other words I'm assuming you don't move SO quickly that changes in distance "stutter", but changes in orientation need to be reflected very quickly
function POI_OnUpdate(elapsed, POI)
	POI.timeSinceLastUpdate = POI.timeSinceLastUpdate + elapsed;

	if ( POI.timeSinceLastUpdate > MapNotes_Mininote_UpdateRate ) then
		POI.timeSinceLastUpdate = 0;

		if ( ( MN_pX == 0 ) and ( MN_pY == 0 ) ) then
			return;
		end

		if ( MN_currentConst ) then
			MN_xPos, MN_yPos = POI.xPos, POI.yPos;
			MN_dist = POI.dist;

			-- Recalculate the angle and convert from Polar coordinates back to cartesian coordinates if necessary
			-- i.e. if Minimap Rotation needs to be accounted for
			if ( MN_rotatingMinimap ) then
				local theta;
				if ( MiniMapCompassRing ) then
					theta = atan2(MN_xPos, MN_yPos) + MiniMapCompassRing:GetFacing();
				else
					theta = atan2(MN_xPos, MN_yPos) - GetPlayerFacing();
				end
				MN_xPos = sin(theta) * MN_dist;
				MN_yPos = cos(theta) * MN_dist;
			end

			-- Squared map ?
			if ( minimapShaped ) then
				local squared = 1;
				if ( MN_xPos < 0 ) then squared = squared + 2; end
				if ( MN_yPos > 0 ) then squared = squared + 1; end
				squared = minimapShaped[squared];
				if ( squared ) then
					local p, q = abs(MN_xPos), abs(MN_yPos);
					if ( q > p ) then p = q; end
					if ( p > MN_miniRadius ) then
						MN_dist = p;
					else
						MN_dist = 0;
					end
				end
			end

			if ( MN_dist > MN_miniRadius ) then
				local scaling = MN_miniRadius / MN_dist;
				MN_xPos = MN_xPos * scaling;
				MN_yPos = MN_yPos * scaling;
			end

			POI:SetPoint("CENTER", "Minimap", "CENTER", MN_xPos, -MN_yPos);
			POI:Show();
		end
	end
end


function MapNotes_HideMiniNotes(fr)
	local POI = getglobal("MN_MiniNotePOI"..fr);
	while ( POI ) do
		POI:Hide();
		POI.key = nil;
		fr = fr + 1;
		POI = getglobal("MN_MiniNotePOI"..fr);
	end
end



function MapNotes_Edit_SetIcon(icon)
	MapNotes_TempData_Icon = icon;
	MN_IconOverlay:SetPoint("TOPLEFT", "MN_EditIcon"..icon, "TOPLEFT", -3, 3);
end

function MapNotes_Edit_SetTextColor(color, mBttn)
	if ( ( not mBttn ) or ( mBttn == "LeftButton" ) ) then
		MapNotes_TempData_TextColor = color;
		MN_TextColorOverlay:SetPoint("TOPLEFT", "MN_TextColor"..color, "TOPLEFT", -3, 3);
	else
		if ( IsAltKeyDown() ) then
			MapNotes_Options.colourT[1][color] = nil;
			MN_InitialiseTextColours();
		else
			ColorPickerFrame.strata = ColorPickerFrame:GetFrameStrata();
			ColorPickerFrame:SetParent(MapNotesEditFrame);
			if ( MapNotesEditFrame:GetParent() == WorldMapButton ) then
				ColorPickerFrame.forceHide = true;
			end
			MN_SetUpColourPicker(1, color);
			ColorPickerFrame:SetFrameStrata("TOOLTIP");
			ColorPickerFrame:SetFrameLevel(MapNotesEditFrame:GetFrameLevel() + 3);
			ColorPickerOkayButton:SetFrameLevel( ColorPickerFrame:GetFrameLevel() + 1 );
			ColorPickerCancelButton:SetFrameLevel( ColorPickerFrame:GetFrameLevel() + 1 );
		end
	end
end

function MapNotes_Edit_Set_Info1Color(color, mBttn)
	if ( ( not mBttn ) or ( mBttn == "LeftButton" ) ) then
		MapNotes_TempData_Info1Color = color;
		MN_Info1ColorOverlay:SetPoint("TOPLEFT", "MN_Info1Color"..color, "TOPLEFT", -3, 3);
	else
		if ( IsAltKeyDown() ) then
			MapNotes_Options.colourT[2][color] = nil;
			MN_InitialiseTextColours();
		else
			ColorPickerFrame.strata = ColorPickerFrame:GetFrameStrata();
			ColorPickerFrame:SetParent(MapNotesEditFrame);
			if ( MapNotesEditFrame:GetParent() == WorldMapButton ) then
				ColorPickerFrame.forceHide = true;
			end
			MN_SetUpColourPicker(2, color);
			ColorPickerFrame:SetFrameStrata("TOOLTIP");
			ColorPickerFrame:SetFrameLevel(MapNotesEditFrame:GetFrameLevel() + 3);
			ColorPickerOkayButton:SetFrameLevel( ColorPickerFrame:GetFrameLevel() + 1 );
			ColorPickerCancelButton:SetFrameLevel( ColorPickerFrame:GetFrameLevel() + 1 );
		end	
	end
end

function MapNotes_Edit_Set_Info2Color(color, mBttn)
	if ( ( not mBttn ) or ( mBttn == "LeftButton" ) ) then
		MapNotes_TempData_Info2Color = color;
		MN_Info2ColorOverlay:SetPoint("TOPLEFT", "MN_Info2Color"..color, "TOPLEFT", -3, 3);
	else
		if ( IsAltKeyDown() ) then
			MapNotes_Options.colourT[3][color] = nil;
			MN_InitialiseTextColours();
		else
			ColorPickerFrame.strata = ColorPickerFrame:GetFrameStrata();
			ColorPickerFrame:SetParent(MapNotesEditFrame);
			if ( MapNotesEditFrame:GetParent() == WorldMapButton ) then
				ColorPickerFrame.forceHide = true;
			end
			MN_SetUpColourPicker(3, color);
			ColorPickerFrame:SetFrameStrata("TOOLTIP");
			ColorPickerFrame:SetFrameLevel(MapNotesEditFrame:GetFrameLevel() + 3);
			ColorPickerOkayButton:SetFrameLevel( ColorPickerFrame:GetFrameLevel() + 1 );
			ColorPickerCancelButton:SetFrameLevel( ColorPickerFrame:GetFrameLevel() + 1 );
		end
	end
end

function MapNotes_OpenEditForExistingNote(key, nid)
	MapNotes_HideAll();

	local currentZone = MapNotes_Data_Notes[key];
	local lclFrame = UIParent;
	local Plugin = MapNotes.pluginKeys[key];

	if ( ( Plugin ) and ( not Plugin.wmflag ) ) then
		lclFrame = getglobal( Plugin.frame );
	
	elseif ( WorldMapButton:IsVisible() ) then
		lclFrame = WorldMapButton;
	end

	MapNotes_TempData_Id = nid;
	MapNotes_TempData_Creator = currentZone[MapNotes_TempData_Id].creator;
	MapNotes_TempData_xPos = currentZone[MapNotes_TempData_Id].xPos;
	MapNotes_TempData_yPos = currentZone[MapNotes_TempData_Id].yPos;
	MapNotes_TempData_miniNote = currentZone[MapNotes_TempData_Id].mininote;
	if ( not currentZone[MapNotes_TempData_Id].icon ) then
		currentZone[MapNotes_TempData_Id].icon = 0;
	end
	MapNotes_Edit_SetIcon(currentZone[MapNotes_TempData_Id].icon);
	MapNotes_Edit_SetTextColor(currentZone[MapNotes_TempData_Id].ncol);
	MapNotes_Edit_Set_Info1Color(currentZone[MapNotes_TempData_Id].in1c);
	MapNotes_Edit_Set_Info2Color(currentZone[MapNotes_TempData_Id].in2c);
	MapNotes_TitleWideEditBox:SetText(currentZone[MapNotes_TempData_Id].name);
	MN_Info1WideEditBox:SetText(currentZone[MapNotes_TempData_Id].inf1);
	MN_Info2WideEditBox:SetText(currentZone[MapNotes_TempData_Id].inf2);
	MN_CreatorWideEditBox:SetText(currentZone[MapNotes_TempData_Id].creator);
	MapNotesEditFrame:SetParent(lclFrame);
	MapNotesEditFrame.miniMe = currentZone[MapNotes_TempData_Id].mininote;
	MapNotesEditFrame.k = key;
	MapNotesEditFrame:Show();
end

function MapNotes_ShowSendFrame(number)
	local Plugin = MapNotes.pluginKeys[ MapNotesSendFrame.key ];
	local lclFrame = WorldMapButton;

	if ( Plugin ) then
		lclFrame = getglobal( Plugin.frame );
	end

	if ( number == 1 ) then
		MapNotesSendPlayer:Enable();

		MapNotesChangeSendFrame:SetText(MAPNOTES_SLASHCOMMAND);
		MapNotes_SendWideEditBox:SetText("");
		if UnitCanCooperate("player", "target") then
			MapNotes_SendWideEditBox:SetText(UnitName("target"));
		end
		MapNotes_SendFrame_Title:SetText(MAPNOTES_SEND_TITLE);
		MapNotes_SendFrame_Tip:SetText(MAPNOTES_SEND_TIP);
		MapNotes_SendFrame_Player:SetText(MAPNOTES_SEND_PLAYER);
		MapNotes_ToggleSendValue = 2;

	elseif ( number == 2 ) then
		MapNotesSendPlayer:Disable();
		MapNotesChangeSendFrame:SetText(MAPNOTES_SHOWSEND);
		MapNotes_SendWideEditBox:SetText("/mapnote "..MapNotes_GenerateSendString(2));
		MapNotes_SendFrame_Title:SetText(MAPNOTES_SEND_SLASHTITLE);
		MapNotes_SendFrame_Tip:SetText(MAPNOTES_SEND_SLASHTIP);
		MapNotes_SendFrame_Player:SetText(MAPNOTES_SEND_SLASHCOMMAND);
		MapNotes_ToggleSendValue = 1;
	end

	if not MapNotesSendFrame:IsVisible() then
		MapNotes_HideAll();
		MapNotesSendFrame:SetParent(lclFrame);
		MapNotesSendFrame:Show();
	end
end

function MapNotes_GenerateSendString(version)
-- <M_N> k<1> x<0.123123> y<0.123123> t<> i1<> i2<> cr<> i<8> tf<3> i1f<5> i2f<6>
	local text = "";
	local upperLimit = 164;		-- SendAddonMessage with combined Prefix..Text of over 254 = Disconnect

	if version == 1 then
		text = "<M_N> ";
	end

	local key = MapNotesSendFrame.key;
	local currentZone = MapNotes_Data_Notes[key];

	local keyLen = string.len(key);
	upperLimit = upperLimit - keyLen;
	local t1 = MapNotes_EliminateUsedChars(currentZone[MapNotes_TempData_Id].name);
	local t2 = MapNotes_EliminateUsedChars(currentZone[MapNotes_TempData_Id].inf1);
	local t3 = MapNotes_EliminateUsedChars(currentZone[MapNotes_TempData_Id].inf2);
	local cr = MapNotes_EliminateUsedChars(currentZone[MapNotes_TempData_Id].creator);
	local truncated;
	t1, t2, t3, cr, truncated = MapNotes_CheckLength(t1, t2, t3, cr, upperLimit);

	text = text.."k<"..key..">"
	local xPos = floor(currentZone[MapNotes_TempData_Id].xPos * 1000000)/1000000;
	local yPos = floor(currentZone[MapNotes_TempData_Id].yPos * 1000000)/1000000;

	text = text.." x<"..xPos.."> y<"..yPos..">";
	text = text.." t<".. t1 ..">";
	text = text.." i1<".. t2 ..">";
	text = text.." i2<".. t3 ..">";
	if not currentZone[MapNotes_TempData_Id].creator then
		currentZone[MapNotes_TempData_Id].creator = UnitName("player");
	end
	text = text.." cr<"..cr..">";
	text = text.." i<"..currentZone[MapNotes_TempData_Id].icon..">";
	text = text.." tf<"..currentZone[MapNotes_TempData_Id].ncol..">";
	text = text.." i1f<"..currentZone[MapNotes_TempData_Id].in1c..">";
	text = text.." i2f<"..currentZone[MapNotes_TempData_Id].in2c..">";

	if ( ( version == 1 ) and ( truncated ) ) then
		MapNotes_StatusPrint(MAPNOTES_TRUNCATION_WARNING);
	end

	text = string.gsub(text, "|", "\124\124");

	return text;
end

function MapNotes_CheckLength(t1, t2, t3, cr, upperLimit)
	local l1 = string.len(t1);
	local l2 = string.len(t2);
	local l3 = string.len(t3);
	local l4 = string.len(cr);
	local truncated;

	if ( l1 > upperLimit ) then
		t1 = string.sub(t1, 1, upperLimit);
		t2 = "";
		t3 = "";
		cr = "";
		truncated = true;

	elseif ( (l1+l2) > upperLimit ) then
		t2 = string.sub(t2, 1, (upperLimit-l1));
		t3 = "";
		cr = "";
		truncated = true;

	elseif ( (l1+l2+l3) > upperLimit ) then
		t3 = string.sub(t3, 1, (upperLimit-l1-l2));
		cr = "";
		truncated = true;

	elseif ( (l1+l2+l3+l4) > upperLimit ) then
		cr = string.sub(cr, 1, (upperLimit-l1-l2-l3));
		truncated = true;
	end

	return t1, t2, t3, cr, truncated;
end

function MapNotes_EliminateUsedChars(text)
	text = string.gsub(text, "<", "");
	text = string.gsub(text, ">", "");
	return text;
end


function MapNotes_SendNote(type)
	if ( type == 1 ) then
		SendChatMessage(MapNotes_GenerateSendString(1), "WHISPER", this.language, MapNotes_SendWideEditBox:GetText());
		MapNotes_HideAll();

	elseif ( type == 2 ) then
		local msg = MapNotes_GenerateSendString(1);
		SendAddonMessage( "MapNotes_FU", msg, "PARTY" );

	elseif ( type == 3 ) then
		local msg = MapNotes_GenerateSendString(1);
		SendAddonMessage( "MapNotes_FU", msg, "RAID" );

	elseif ( type == 4 ) then
		local msg = MapNotes_GenerateSendString(1);
		SendAddonMessage( "MapNotes_FU", msg, "BATTLEGROUND" );

	elseif ( type == 5 ) then
		local msg = MapNotes_GenerateSendString(1);
		SendAddonMessage( "MapNotes_FU", msg, "GUILD" );
	end
end

function MapNotes_OpenOptionsFrame()
	for i=0, 16, 1 do
		if MapNotes_Options[i] ~= "off" then
			getglobal("MapNotesOptionsCheckbox"..i):SetChecked(1);
		else
			getglobal("MapNotesOptionsCheckbox"..i):SetChecked(0);
		end
	end
	if ( MapNotes_Options.mapC ) then
		MapNotesOptionsCheckboxMapC:SetChecked(1);
	else
		MapNotesOptionsCheckboxMapC:SetChecked(0);
	end
	if ( MapNotes_Options.miniC ) then
		MapNotesOptionsCheckboxMiniC:SetChecked(1);
	else
		MapNotesOptionsCheckboxMiniC:SetChecked(0);
	end
	if ( MapNotes_Options.landMarks ) then
		MapNotesOptionsCheckboxLM:SetChecked(1);
	else
		MapNotesOptionsCheckboxLM:SetChecked(0);
	end
end

function MapNotes_WriteOptions()
	for i=0, 16, 1 do
		if getglobal("MapNotesOptionsCheckbox"..i):GetChecked() then
			MapNotes_Options[i] = nil;
		else
			MapNotes_Options[i] = "off";
		end
	end
	MapNotes_PlugInsRefresh();
	MapNotes_MapUpdate();
end

function MapNotes_SetAsMiniNote(nid)
	local key = MapNotes_GetMapKey();
	local currentZone = nil;

	if ( ( nid ) and ( nid > 0 ) ) then
		currentZone = MapNotes_Data_Notes[key];
		if ( currentZone ) then
			currentZone = currentZone[nid];
		end
	end

	if ( ( nid == 0 ) and ( MapNotes_MiniNote_Data.icon == "tloc" ) ) then
		MapNotes_ClearMiniNote(true, "tloc");

	elseif ( ( nid == -1 ) and ( MapNotes_MiniNote_Data.icon == "party" ) ) then
		MapNotes_ClearMiniNote(true, "party");

	elseif ( ( currentZone ) and ( currentZone.mininote ) ) then
		currentZone.mininote = nil;

	else
		MapNotes_MiniNote_Data.key = key;
		MapNotes_MiniNote_Data.id = nid -- able to show, because there wasn't a delete and its not received for showing on Minimap only
		if ( nid == 0 ) then
			MapNotes_MiniNote_Data.xPos = MapNotes_tloc_xPos;
			MapNotes_MiniNote_Data.yPos = MapNotes_tloc_yPos;
			MapNotes_MiniNote_Data.key = key;
			MapNotes_MiniNote_Data.name = MAPNOTES_THOTTBOTLOC;
			MapNotes_MiniNote_Data.color = 0;
			MapNotes_MiniNote_Data.icon = "tloc";
			MN_MiniNotePOITexture:SetTexture(nil);
			if ( ( MNIL ) and ( MN_TLOC_ICON ) ) then
				MN_MiniNotePOITexture:SetTexture(MN_TLOC_ICON);
			end
			local txtr = MN_MiniNotePOITexture:GetTexture();
			if ( not txtr ) then
				MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icon"..MapNotes_MiniNote_Data.icon);
			end

		elseif ( nid == -1 ) then
			MapNotes_MiniNote_Data.xPos = MapNotes_PartyNoteData.xPos;
			MapNotes_MiniNote_Data.yPos = MapNotes_PartyNoteData.yPos;
			MapNotes_MiniNote_Data.key = key;
			MapNotes_MiniNote_Data.name = MAPNOTES_PARTYNOTE;
			MapNotes_MiniNote_Data.color = 0;
			MapNotes_MiniNote_Data.icon = "party";
			MN_MiniNotePOITexture:SetTexture(nil);
			if ( ( MNIL ) and ( MN_PARTY_ICON ) ) then
				MN_MiniNotePOITexture:SetTexture(MN_PARTY_ICON);
			end
			local txtr = MN_MiniNotePOITexture:GetTexture();
			if ( not txtr ) then
				MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icon"..MapNotes_MiniNote_Data.icon);
			end

		elseif ( currentZone ) then
			currentZone.mininote = true;
		end
	end

	MapNotes_MapUpdate();
end

function MapNotes_ClearMiniNoteGlobal()
	MapNotes_ClearMiniNote(nil, nil);
end

function MapNotes_ClearMiniNote(skipMapUpdate, typ)
	if ( ( typ ) and ( ( typ == "party" ) or ( typ == "tloc" ) ) ) then
		if ( typ == "party" ) then
			MapNotesPOIparty:SetAlpha( MapNotes_Options.aFactor );
		else
			MapNotesPOItloc:SetAlpha( MapNotes_Options.aFactor );
		end
		MapNotes_MiniNote_Data.xPos = nil;
		MapNotes_MiniNote_Data.yPos = nil;
		MapNotes_MiniNote_Data.key = nil;
		MapNotes_MiniNote_Data.id = nil; -- nothing to show on the zone map
		MapNotes_MiniNote_Data.name = nil;
		MapNotes_MiniNote_Data.color = nil;
		MapNotes_MiniNote_Data.icon = nil;
		MN_MiniNotePOI:Hide();

	elseif ( typ.ref ) then
		MapNotes_Data_Notes[typ.key][typ.ref].mininote = nil;
		typ:Hide();
		
	elseif ( typ.id ) then
		MapNotes_Data_Notes[typ.key][typ.id].mininote = nil;

	else
		MapNotes_MiniNote_Data.xPos = nil;
		MapNotes_MiniNote_Data.yPos = nil;
		MapNotes_MiniNote_Data.key = nil;
		MapNotes_MiniNote_Data.id = nil; -- nothing to show on the zone map
		MapNotes_MiniNote_Data.name = nil;
		MapNotes_MiniNote_Data.color = nil;
		MapNotes_MiniNote_Data.icon = nil;
		MN_MiniNotePOI:Hide();
	end

	if ( not skipMapUpdate ) then
		MapNotes_MapUpdate();
	end
end


function MapNotes_WriteNote()
	MapNotes_HideAll();

	local key = MapNotesEditFrame.k;
	local Plugin = MapNotes.pluginKeys[key];
	local currentZone = MapNotes_Data_Notes[key];

	currentZone[MapNotes_TempData_Id] = {};
	currentZone[MapNotes_TempData_Id].name = MapNotes_TitleWideEditBox:GetText();
	currentZone[MapNotes_TempData_Id].ncol = MapNotes_TempData_TextColor;
	currentZone[MapNotes_TempData_Id].inf1 = MN_Info1WideEditBox:GetText();
	currentZone[MapNotes_TempData_Id].in1c = MapNotes_TempData_Info1Color;
	currentZone[MapNotes_TempData_Id].inf2 = MN_Info2WideEditBox:GetText();
	currentZone[MapNotes_TempData_Id].in2c = MapNotes_TempData_Info2Color;
	currentZone[MapNotes_TempData_Id].creator = MN_CreatorWideEditBox:GetText();
	currentZone[MapNotes_TempData_Id].icon = MapNotes_TempData_Icon;
	currentZone[MapNotes_TempData_Id].xPos = MapNotes_TempData_xPos;
	currentZone[MapNotes_TempData_Id].yPos = MapNotes_TempData_yPos;
	currentZone[MapNotes_TempData_Id].mininote = MapNotes_TempData_miniNote;

	if ( MapNotesEditFrame.miniMe ) then
		currentZone[MapNotes_TempData_Id].mininote = true;

	elseif ( ( key == MapNotes_MiniNote_Data.key ) and ( MapNotes_MiniNote_Data.id == MapNotes_TempData_Id ) ) then
		currentZone[MapNotes_TempData_Id].mininote = true;
	end

	if ( Plugin ) then
		MapNotes_PlugInsDrawNotes(Plugin);
	else
		MapNotes_MapUpdate();
	end
end

function MapNotes_MapUpdate()
--	if WorldMapButton:IsVisible() then
		MapNotes_WorldMapButton_OnUpdate();
--	end
--	if Minimap:IsVisible() then
--		Minimap_OnUpdate(Minimap, 0.0);					--Telic_* (Lack of argument can cause error in Minimap.lua)
--	end
end

function MapNotes_HideAll()
	-- dialogs
	MapNotesEditFrame:Hide();
	MapNotesOptionsFrame:Hide();
	MapNotesSendFrame:Hide();

	MapNotes_ClearGUI();
end



function MapNotes_HideFrames()
	MapNotesEditFrame:Hide();
	MapNotesOptionsFrame:Hide();
	MapNotesSendFrame:Hide();
	MapNotes_ClearGUI();
end



function MapNotes_FramesHidden()
	if ( ( MapNotesEditFrame:IsVisible() ) or
		 ( MapNotesSendFrame:IsVisible() ) or
		 ( MapNotesOptionsFrame:IsVisible() ) ) then
		return false;
	else
		return true;
	end
end

function MapNotes_DeleteNote(nid, key, suppress)
	local Plugin;
	
	if ( type(key) == "string" ) then
		Plugin = MapNotes.pluginKeys[key];

	elseif ( ( key ) and ( key.frame ) ) then
		Plugin = key;
		key = MapNotes_PlugInsGetKey(key);

	else
		if ( not key ) then
			key = MapNotes_GetMapKey();
		end
	end

	if ( nid == 0 ) then
		MapNotes_tloc_xPos = nil;
		MapNotes_tloc_yPox = nil;
		MapNotes_tloc_name = nil;
		MapNotes_tloc_key = nil;
		if ( MapNotes_MiniNote_Data.icon == "tloc") then
			MapNotes_ClearMiniNote(true, "tloc");
		end
		MapNotes_MapUpdate();
		return

	elseif ( nid == -1 ) then
		MapNotes_PartyNoteData.xPos = nil;
		MapNotes_PartyNoteData.yPos = nil;
		MapNotes_PartyNoteData.key = nil;
		if ( MapNotes_MiniNote_Data.icon == "party" ) then
			MapNotes_ClearMiniNote(true, "party");
		end
		if ( Plugin ) then
			MapNotes_PlugInsDrawNotes(Plugin)
		else
			MapNotes_MapUpdate();
		end
		return Plugin;
	end

	local currentZone, lastEntry;
	currentZone = MapNotes_Data_Notes[key];
	lastEntry = MapNotes_GetZoneTableSize(currentZone);

	MapNotes_DeleteLines(key, currentZone[nid].xPos, currentZone[nid].yPos);

	if ( ( lastEntry ~= 0 ) and ( nid <= lastEntry ) ) then
		MapNotes_Undelete_Info.key = key;
		if ( Plugin ) then
			MapNotes_Undelete_Info.plugin = Plugin.name;	-- Plugin itself is a table reference which won't survive relog - so store name, and retrieve plugin based on it
		else												-- If Plugin not loaded, then delete the undelete info...
			MapNotes_Undelete_Info.plugin = nil;
		end

		MapNotes_Undelete_Info.name = currentZone[nid].name;
		currentZone[nid].name = currentZone[lastEntry].name;
		currentZone[lastEntry].name = nil;

		MapNotes_Undelete_Info.ncol = currentZone[nid].ncol;
		currentZone[nid].ncol = currentZone[lastEntry].ncol;
		currentZone[lastEntry].ncol = nil;

		MapNotes_Undelete_Info.inf1 = currentZone[nid].inf1;
		currentZone[nid].inf1 = currentZone[lastEntry].inf1;
		currentZone[lastEntry].inf1 = nil;

		MapNotes_Undelete_Info.in1c = currentZone[nid].in1c;
		currentZone[nid].in1c = currentZone[lastEntry].in1c;
		currentZone[lastEntry].in1c = nil;

		MapNotes_Undelete_Info.inf2 = currentZone[nid].inf2;
		currentZone[nid].inf2 = currentZone[lastEntry].inf2;
		currentZone[lastEntry].inf2 = nil;

		MapNotes_Undelete_Info.in2c = currentZone[nid].in2c;
		currentZone[nid].in2c = currentZone[lastEntry].in2c;
		currentZone[lastEntry].in2c = nil;

		MapNotes_Undelete_Info.creator = currentZone[nid].creator;
		currentZone[nid].creator = currentZone[lastEntry].creator;
		currentZone[lastEntry].creator = nil;

		MapNotes_Undelete_Info.icon = currentZone[nid].icon;
		currentZone[nid].icon = currentZone[lastEntry].icon;
		currentZone[lastEntry].icon = nil;

		MapNotes_Undelete_Info.xPos = currentZone[nid].xPos;
		currentZone[nid].xPos = currentZone[lastEntry].xPos;
		currentZone[lastEntry].xPos = nil;

		MapNotes_Undelete_Info.yPos = currentZone[nid].yPos;
		currentZone[nid].yPos = currentZone[lastEntry].yPos;
		currentZone[lastEntry].yPos = nil;

		MapNotes_Undelete_Info.mininote = currentZone[nid].mininote;
		if ( currentZone[lastEntry].mininote ) then
			currentZone[nid].mininote = true;
			currentZone[lastEntry].mininote = nil;
		else
			currentZone[nid].mininote = nil;
		end

		MapNotes_Undelete_Info.customIcon = currentZone[nid].customIcon;
		if ( currentZone[lastEntry].customIcon ) then
			currentZone[nid].customIcon = currentZone[lastEntry].customIcon;
			currentZone[lastEntry].customIcon = nil;
		else
			currentZone[nid].customIcon = nil;
		end

		currentZone[lastEntry] = nil;
	end

	if ( not suppress ) then
		if ( Plugin ) then
			MapNotes_PlugInsDrawNotes(Plugin);
		else
			MapNotes_MapUpdate();
		end
	end

	return Plugin;
end


function MapNotes_Undelete()
	if ( MapNotes_Undelete_Info.key ) then
		local currentZone = MapNotes_Data_Notes[MapNotes_Undelete_Info.key];
		if ( currentZone ) then
			local checknote = MapNotes_CheckNearNotes(MapNotes_Undelete_Info.key, MapNotes_Undelete_Info.xPos, MapNotes_Undelete_Info.yPos);
			if ( checknote ) then
				MapNotes_StatusPrint(format(MAPNOTES_QUICKNOTE_NOTETONEAR, MapNotes_Data_Notes[MapNotes_Undelete_Info.key][checknote].name ) );
			else
				MapNotes_TempData_Id = ( MapNotes_GetZoneTableSize( currentZone ) ) + 1;
				currentZone[MapNotes_TempData_Id] = {};
				currentZone[MapNotes_TempData_Id].name = MapNotes_Undelete_Info.name;
				MapNotes_Undelete_Info.name = nil;
				currentZone[MapNotes_TempData_Id].ncol = MapNotes_Undelete_Info.ncol;
				MapNotes_Undelete_Info.ncol = nil;
				currentZone[MapNotes_TempData_Id].inf1 = MapNotes_Undelete_Info.inf1;
				MapNotes_Undelete_Info.inf1 = nil;
				currentZone[MapNotes_TempData_Id].in1c = MapNotes_Undelete_Info.in1c;
				MapNotes_Undelete_Info.in1c = nil;
				currentZone[MapNotes_TempData_Id].inf2 = MapNotes_Undelete_Info.inf2;
				MapNotes_Undelete_Info.inf2 = nil;
				currentZone[MapNotes_TempData_Id].in2c = MapNotes_Undelete_Info.in2c;
				MapNotes_Undelete_Info.in2c = nil;
				currentZone[MapNotes_TempData_Id].creator = MapNotes_Undelete_Info.creator;
				MapNotes_Undelete_Info.creator = nil;
				currentZone[MapNotes_TempData_Id].icon = MapNotes_Undelete_Info.icon;
				MapNotes_Undelete_Info.icon = nil;
				currentZone[MapNotes_TempData_Id].xPos = MapNotes_Undelete_Info.xPos;
				MapNotes_Undelete_Info.xPos = nil;
				currentZone[MapNotes_TempData_Id].yPos = MapNotes_Undelete_Info.yPos;
				MapNotes_Undelete_Info.yPos = nil;
				currentZone[MapNotes_TempData_Id].mininote = MapNotes_Undelete_Info.mininote;
				MapNotes_Undelete_Info.mininote = nil;
				currentZone[MapNotes_TempData_Id].customIcon = MapNotes_Undelete_Info.customIcon;
				MapNotes_Undelete_Info.customIcon = nil;
				
				local Plugin;
				if ( MapNotes_Undelete_Info.plugin ) then
					for p, details in pairs(MAPNOTES_PLUGINS_LIST) do
						if ( MapNotes_Undelete_Info.plugin == details.name ) then
							Plugin = details;
						end
					end
					if ( Plugin ) then MapNotes_PlugInsDrawNotes(Plugin); end
				else
					MapNotes_MapUpdate();
				end
				MapNotes_StatusPrint( format(MAPNOTES_ACCEPT_SLASH, MapNotes_GetMapDisplayName(MapNotes_Undelete_Info.key, Plugin)) );
				MapNotes_Undelete_Info.key = nil;
				MapNotes_Undelete_Info.plugin = nil;
			end
		end
	end
end

function MapNotes_GetZoneTableSize(zoneTable)
	local i = 0;

	for index, records in ipairs(zoneTable) do
		i = i + 1;
	end

	return i;
end


function MapNotes_DeleteNotesWithText(text, key)
	if ( not text ) then
		return;
	end

	local count, cText, Plugin = 0;

	if ( ( key ) and ( MapNotes_Data_Notes[key] ) ) then
		local records = MapNotes_Data_Notes[key];
		for n_id=MapNotes_GetZoneTableSize(records), 1, -1 do
			cText = records[n_id].name .. records[n_id].inf1 .. records[n_id].inf2;
			if ( string.find(cText, text) ) then
				Plugin = MapNotes_DeleteNote(n_id, key, true);
				count = count + 1;
			end
		end

	else
		for key, records in pairs(MapNotes_Data_Notes) do
			for n_id=MapNotes_GetZoneTableSize(records), 1, -1 do
				cText = records[n_id].name .. records[n_id].inf1 .. records[n_id].inf2;
				if ( string.find(cText, text) ) then
					Plugin = MapNotes_DeleteNote(n_id, key, true);
					count = count + 1;
				end
			end
		end
	end

	if ( text ) then
		MapNotes_StatusPrint(format(TEXT(MN_DELETED_WITH_TEXT), text) .. " (" .. count .. ")");
	end

	if ( Plugin ) then
		MapNotes_PlugInsDrawNotes(Plugin);
	else
		MapNotes_MapUpdate();
	end
end

function MapNotes_DeleteNotesByCreatorAndName(creator, name, key) --Oh,that's where its called from;)WoWKb	-- 29/07/2007
	if ( not creator ) then
		return;
	end

	local region = MN_ALLZONES;
	local count, Plugin = 0;

	if ( ( key ) and ( MapNotes_Data_Notes[key] ) ) then
		local records = MapNotes_Data_Notes[key];
		for n_id=MapNotes_GetZoneTableSize(records), 1, -1 do
			if ( ( creator == records[n_id].creator ) and ( name == records[n_id].name or name == nil ) ) then
				Plugin = MapNotes_DeleteNote(n_id, key, true);
				count = count + 1;
			end
		end

	else
		for key, records in pairs(MapNotes_Data_Notes) do
			for n_id=MapNotes_GetZoneTableSize(records), 1, -1 do
				if ( ( creator == records[n_id].creator ) and ( name == records[n_id].name or name == nil ) ) then
					Plugin = MapNotes_DeleteNote(n_id, key, true);
					count = count + 1;
				end
			end
		end
	end

	if ( name ) then
		MapNotes_StatusPrint(format(TEXT(MAPNOTES_DELETED_BY_NAME), creator, name) .. " (" .. count .. ")");
	else
		MapNotes_StatusPrint(format(TEXT(MAPNOTES_DELETED_BY_CREATOR), creator) .. " (" .. count .. ")");
	end

	if ( Plugin ) then
		MapNotes_PlugInsDrawNotes(Plugin);
	else
		MapNotes_MapUpdate();
	end
end

function MapNotes_ClearMiniNotesByCreator(creator)
	if ( not creator ) then
		return;
	end

	for key, records in pairs(MapNotes_Data_Notes) do
		for n_id=MapNotes_GetZoneTableSize(records), 1, -1 do
			if ( creator == records[n_id].creator ) then
				records[n_id].mininote = nil;
			end
		end
	end
end



function MapNotes_Note_OnClick(self, mouseButton)
	local lclFrame = self:GetParent();
	local Plugin = self.Plugin;
	local key = self.key;
	local nid = self.nid;

	CloseDropDownMenus();		-- test to see if this can taint ? %%%

	if not MapNotes_FramesHidden() then
		return;
	end

	local currentZone;

	currentZone = MapNotes_Data_Notes[key];

	if ( MapNotes_LastLineClick.GUIactive ) then
		local ax = currentZone[nid].xPos;
		local ay = currentZone[nid].yPos;
		if ( ( MapNotes_LastLineClick.x ~= ax or MapNotes_LastLineClick.y ~= ay) and ( MapNotes_LastLineClick.key == key ) ) then
			MapNotes_ToggleLine(key, ax, ay, MapNotes_LastLineClick.x, MapNotes_LastLineClick.y, Plugin);
		end
		MapNotes_ClearGUI();

	elseif ( mouseButton == "RightButton" ) then
		MapNotes_TempData_Id = nid;				-- Doh!   *** DO NOT DELETE ***

		if ( ( IsControlKeyDown() ) and ( IsAltKeyDown() ) ) then
			MapNotes_OpenEditForExistingNote(key, nid);
			MapNotes_TitleWideEditBox:SetFocus();
			MapNotes_TitleWideEditBox:HighlightText();

		elseif ( IsAltKeyDown() ) then
			if ( IsShiftKeyDown() ) then
				local lTime = GetTime() - 0.6;
				if ( ( MapNotes_DoubleClick_Timer > lTime ) and ( MapNotes_DoubleClick_Id == nid ) and ( MapNotes_DoubleClick_Key == key ) ) then
					MapNotes_DeleteNote(nid, key);
					MapNotes_DoubleClick_Id = -2;
					MapNotes_DoubleClick_Key = "";
					MapNotes_DoubleClick_Timer = lTime - 2;

				else
					MapNotes_DoubleClick_Id = nid;
					MapNotes_DoubleClick_Key = key;
					MapNotes_DoubleClick_Timer = GetTime() - 0.1;	-- paranoid in case 2 clicks can fetch same time ;P
				end

			elseif ( ( not Plugin ) or ( Plugin.wmflag ) ) then	-- Mininotes only on WorldMap type notes
				if ( currentZone[nid].mininote ) then
					currentZone[nid].mininote = nil;
				else
					currentZone[nid].mininote = true;
				end
				MapNotes_MapUpdate();
			end

		else
			local xOffset, yOffset = MapNotes_GetAdjustedMapXY(lclFrame);
			WorldMapTooltip:Hide();
			GameTooltip:Hide();
			MapNotes:InitialiseDropdown(lclFrame, currentZone[nid].xPos, currentZone[nid].yPos, MapNotes.note_dd_info, key, nid);
			ToggleDropDownMenu(1, nil, MapNotes.dd, "cursor", 0, 0);
			WorldMapTooltip:Hide();
			GameTooltip:Hide();
		end

	elseif ( ( mouseButton == "LeftButton" ) and ( IsAltKeyDown() ) and ( not IsControlKeyDown() ) ) then
		local ax = currentZone[nid].xPos;
		local ay = currentZone[nid].yPos;
		if (MapNotes_LastLineClick.x ~= ax or MapNotes_LastLineClick.y ~= ay) and MapNotes_LastLineClick.key == key and MapNotes_LastLineClick.time > GetTime() - 4 then
			MapNotes_ToggleLine(key, ax, ay, MapNotes_LastLineClick.x, MapNotes_LastLineClick.y, Plugin);
		else
			MapNotes_LastLineClick.x = ax;
			MapNotes_LastLineClick.y = ay;
			MapNotes_LastLineClick.key = key;
			MapNotes_LastLineClick.time = GetTime();
		end
	end
end

function MapNotes_StartGUIToggleLine(key)
	if ( not MapNotes.pluginKeys[key] ) then
		WorldMapMagnifyingGlassButton:SetText(MAPNOTES_WORLDMAP_HELP_1.."\n"..MAPNOTES_WORLDMAP_HELP_2.."\n"..MAPNOTES_WORLDMAP_HELP_3.."\n"..MAPNOTES_CLICK_ON_SECOND_NOTE);
	end

	local currentZone = MapNotes_Data_Notes[key];						--Telic_*

	MapNotes_LastLineClick.GUIactive = true;
	MapNotes_LastLineClick.x = currentZone[MapNotes_TempData_Id].xPos;			--Telic_* (changed to use currentZone)
	MapNotes_LastLineClick.y = currentZone[MapNotes_TempData_Id].yPos;			--Telic_* (changed to use cuurentZone)
	MapNotes_LastLineClick.key = key;
end

function MapNotes_ClearGUI()
	WorldMapMagnifyingGlassButton:SetText(MAPNOTES_WORLDMAP_HELP_1.."\n"..MAPNOTES_WORLDMAP_HELP_2.."\n"..MAPNOTES_WORLDMAP_HELP_3);
	MapNotes_LastLineClick.GUIactive = false;
end

function MapNotes_DrawLine(n_id, x1, y1, x2, y2, Plugin)					--Telic_2 (Added Plugin parameter)
	if ( ( not x1 ) or ( not x2 ) or ( not y1 ) or ( not y2 ) ) then
		return;
	end

	local MapNotesLine = MapNotes_AssignLine(n_id, Plugin);

	local lineFrame = WorldMapDetailFrame;
	if ( Plugin ) then
		lineFrame = getglobal( Plugin.frame .. "_MNLinesFrame" );
	end

	local positiveSlopeTexture = MN_MISC_GFX_PATH.."\\LineTemplatePositive256";
	local negativeSlopeTexture = MN_MISC_GFX_PATH.."\\LineTemplateNegative256";
	local width = lineFrame:GetWidth();
	local height = lineFrame:GetHeight();

	local deltax = ( abs((x1 - x2) * width)  );
	local deltay = ( abs((y1 - y2) * height) );

	local xOffset = ( (math.min(x1,x2) * width ) );
	local yOffset = (-(math.min(y1,y2) * height) );
	local lowerpixel = math.min(deltax, deltay);
	lowerpixel = lowerpixel / 256;
	if lowerpixel > 1 then
		lowerpixel = 1;
	end

	if deltax == 0 then
		deltax = 2;
		MapNotesLine:SetTexture(0, 0, 0);
		MapNotesLine:SetTexCoord(0, 1, 0, 1);
	elseif deltay == 0 then
		deltay = 2;
		MapNotesLine:SetTexture(0, 0, 0);
		MapNotesLine:SetTexCoord(0, 1, 0, 1);
	elseif x1 - x2 < 0 then
		if y1 - y2 < 0 then
			MapNotesLine:SetTexture(negativeSlopeTexture);
			MapNotesLine:SetTexCoord(0, lowerpixel, 0, lowerpixel);
		else
			MapNotesLine:SetTexture(positiveSlopeTexture);
			MapNotesLine:SetTexCoord(0, lowerpixel, 1-lowerpixel, 1);
		end
	else
		if y1 - y2 < 0 then
			MapNotesLine:SetTexture(positiveSlopeTexture);
			MapNotesLine:SetTexCoord(0, lowerpixel, 1-lowerpixel, 1);
		else
			MapNotesLine:SetTexture(negativeSlopeTexture);
			MapNotesLine:SetTexCoord(0, lowerpixel, 0, lowerpixel);
		end
	end

	MapNotesLine:SetPoint("TOPLEFT", lineFrame, "TOPLEFT", xOffset, yOffset);
	MapNotesLine:SetWidth(deltax);
	MapNotesLine:SetHeight(deltay);
	MapNotesLine:Show();
end

function MapNotes_DeleteLines(key, x, y)
	local zoneTable = MapNotes_Data_Lines[key];
	local lineCount = MapNotes_GetZoneTableSize(zoneTable);
	local offset = 0;

	for i = 1, lineCount, 1 do
		if (zoneTable[i-offset].x1 == x and zoneTable[i-offset].y1 == y) or (zoneTable[i-offset].x2 == x and zoneTable[i-offset].y2 == y) then
			for j = i, lineCount-1, 1 do
				zoneTable[j-offset].x1 = zoneTable[j+1-offset].x1;
				zoneTable[j-offset].x2 = zoneTable[j+1-offset].x2;
				zoneTable[j-offset].y1 = zoneTable[j+1-offset].y1;
				zoneTable[j-offset].y2 = zoneTable[j+1-offset].y2;
			end
			zoneTable[lineCount-offset] = nil;
			offset = offset + 1;
		end
	end
	MapNotes_LastLineClick.key = "nil";
end



function MapNotes_ToggleLine(key, x1, y1, x2, y2, Plugin)
	local zoneTable = MapNotes_Data_Lines[key];
	local newline = true;

	local lineCount = MapNotes_GetZoneTableSize(zoneTable);

	for i = 1, lineCount, 1 do
		if i <= lineCount then
			if (zoneTable[i].x1 == x1 and zoneTable[i].y1 == y1 and zoneTable[i].x2 == x2 and zoneTable[i].y2 == y2) or
					(zoneTable[i].x1 == x2 and zoneTable[i].y1 == y2 and zoneTable[i].x2 == x1 and zoneTable[i].y2 == y1) then
				for j = i, lineCount-1, 1 do
					zoneTable[j].x1 = zoneTable[j+1].x1;
					zoneTable[j].x2 = zoneTable[j+1].x2;
					zoneTable[j].y1 = zoneTable[j+1].y1;
					zoneTable[j].y2 = zoneTable[j+1].y2;
				end
				zoneTable[lineCount] = nil;
				PlaySound("igMainMenuOption");
				newline = false;
				lineCount = lineCount - 1;
			end
		end
	end
	if ( newline ) then
		zoneTable[lineCount+1] = {};
		zoneTable[lineCount+1].x1 = x1;
		zoneTable[lineCount+1].x2 = x2;
		zoneTable[lineCount+1].y1 = y1;
		zoneTable[lineCount+1].y2 = y2;
	end
	MapNotes_LastLineClick.key = "nil";

	if ( Plugin ) then
		MapNotes_PlugInsDrawNotes(Plugin);
	else
		MapNotes_MapUpdate();
	end
end



function MapNotes_OpenEditForNewNote()
	if ( MapNotes_TempData_Id == 0 ) then
		MapNotes_tloc_xPos = nil;
		MapNotes_tloc_yPos = nil;
		MapNotes_tloc_name = nil;
		MapNotes_tloc_key = nil;
	end

	MapNotes_TempData_Id = MapNotes_NewNoteSlot(MapNotesEditFrame.k);
	MapNotes_TempData_Creator = UnitName("player");
	MapNotes_Edit_SetIcon(0);
	MapNotes_Edit_SetTextColor(0);
	MapNotes_Edit_Set_Info1Color(0);
	MapNotes_Edit_Set_Info2Color(0);
	MapNotes_TitleWideEditBox:SetText("");
	MN_Info1WideEditBox:SetText("");
	MN_Info2WideEditBox:SetText("");
	MN_CreatorWideEditBox:SetText(MapNotes_TempData_Creator);
	MapNotes_HideAll();
	MapNotes_TempData_miniNote = nil;
	if ( MapNotes_SetNextAsMiniNote == 1 ) or ( MapNotes_SetNextAsMiniNote == 2 ) then
		MapNotes_TempData_miniNote = true;
	end
	MapNotesEditFrame:Show();
end

function MapNotes_SetPartyNote(xPos, yPos, pKey)
	if ( ( not pKey ) and ( ( GetCurrentMapZone() == 0 ) or ( GetCurrentMapContinent() == 0 ) ) ) then
		return;
	end

	xPos = floor(xPos * 1000000) / 1000000;
	yPos = floor(yPos * 1000000) / 1000000;
	local key, lKey;
	if ( pKey ) then
		key = pKey;
		_, lKey = MapNotes_GetMapDisplayName(key);
	else
		key = MapNotes_GetMapKey();
		lKey = MapNotes_GetMapDisplayName(key);
	end

	MapNotes_PartyNoteData.key = key;
	MapNotes_PartyNoteData.xPos = xPos;
	MapNotes_PartyNoteData.yPos = yPos;

	local msg = "<M_N> k<"..key.."> x<"..xPos.."> y<"..yPos.."> l<"..lKey.."> p<1>";		--Telic_6

	if ( ( IsControlKeyDown() ) and ( GetNumRaidMembers() > 0 ) ) then		-- Send Party note if not in Raid
		SendAddonMessage( "MapNotes_FU", msg, "RAID" );

	else
		SendAddonMessage( "MapNotes_FU", msg, "PARTY" );					--Telic_6
	end

	if ( ( not pKey ) and ( ( MapNotes_MiniNote_Data.icon == "party" ) or ( MapNotes_Options[16] ~= "off" ) ) ) then
		MapNotes_MiniNote_Data.id = -1;
		MapNotes_MiniNote_Data.key = key;
		MapNotes_MiniNote_Data.xPos = xPos;
		MapNotes_MiniNote_Data.yPos = yPos;
		MapNotes_MiniNote_Data.name = MAPNOTES_PARTYNOTE;
		MapNotes_MiniNote_Data.color = 0;
		MapNotes_MiniNote_Data.icon = "party";
		MN_MiniNotePOITexture:SetTexture(nil);
		if ( ( MNIL ) and ( MN_PARTY_ICON ) ) then
			MN_MiniNotePOITexture:SetTexture(MN_PARTY_ICON);
		end
		local txtr = MN_MiniNotePOITexture:GetTexture();
		if ( not txtr ) then
			MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icon"..MapNotes_MiniNote_Data.icon);
		end

	elseif ( ( pKey ) and ( MapNotes_MiniNote_Data.icon == "party" ) ) then
		MapNotes_ClearMiniNote(true, "party");
	end
	
	MapNotes_MapUpdate();
end



function MapNotes_MiniNote_OnClick(self, mouseButton)
	if ( ( mouseButton == "RightButton" ) and ( self.ref ) and ( self.ref > 0 ) ) then
		if ( ( IsControlKeyDown() ) and ( not IsAltKeyDown() ) ) then
			SetMapToCurrentZone();
			local x, y = GetPlayerMapPosition("player");
			if ( ( x == 0 ) and ( y == 0 ) ) then

			else
				local key = MapNotes_GetMapKey();
				if ( self.key == key ) then
					MapNotes:InitialiseDropdown(UIParent, nil, nil, MapNotes.mininote_dd_info, key, self.ref);
					ToggleDropDownMenu(1, nil, MapNotes.dd, "cursor", 0, 0);
					return;
				end
			end

		elseif ( ( IsShiftKeyDown() ) and ( IsAltKeyDown() )  ) then
			local lTime = GetTime() - 0.7;				-- allow 1 second for the second click
			if ( ( MapNotes_DoubleClick_Timer > lTime ) and ( MapNotes_DoubleClick_Id == self.ref ) and ( MapNotes_DoubleClick_Key == self.key ) ) then
				MapNotes_HideFrames();
				MapNotes_DeleteNote(self.ref, self.key);
				MapNotes_StatusPrint(MAPNOTES_DELETE_NOTE);
				MapNotes_DoubleClick_Id = -2;
				MapNotes_DoubleClick_Key = "";
				MapNotes_DoubleClick_Timer = lTime - 2;

			else
				MapNotes_DoubleClick_Id = self.ref;
				MapNotes_DoubleClick_Key = self.key;
				MapNotes_DoubleClick_Timer = GetTime() - 0.1;	-- paranoid in case 2 clicks can fetch same time ;P
			end
			return;

		elseif ( ( IsControlKeyDown() ) and ( IsAltKeyDown() ) ) then
			if ( MapNotesEditFrame:IsVisible() ) then
				MapNotesEditFrame:Hide();
			else
				MapNotes_OpenEditForExistingNote(self.key, self.ref);
				MapNotes_TitleWideEditBox:SetFocus();
				MapNotes_TitleWideEditBox:HighlightText();
			end
			return;
			
		elseif ( ( IsAltKeyDown() ) ) then
			local note = MapNotes_Data_Notes[self.key];
			if ( note ) then
				note = note[self.ref];
			end
			if ( note ) then
				note.mininote = nil;
			end
			MapNotes_MapUpdate();
			return;
		end

	elseif ( ( mouseButton == "RightButton" ) and ( self.ref <= 0 ) ) then
		if ( ( IsControlKeyDown() ) and ( not IsAltKeyDown() ) ) then
			SetMapToCurrentZone();
			local x, y = GetPlayerMapPosition("player");
			if ( ( x == 0 ) and ( y == 0 ) ) then

			else
				local key = MapNotes_GetMapKey();
				if ( self.key == key ) then
					MapNotes:InitialiseDropdown(UIParent, MapNotes_MiniNote_Data.xPos, MapNotes_MiniNote_Data.yPos, MapNotes.temp_dd_info, key, self.ref);
					ToggleDropDownMenu(1, nil, MapNotes.dd, "cursor", 0, 0);
					return;
				end
			end

		elseif ( ( IsShiftKeyDown() ) and ( not IsAltKeyDown() ) and ( not IsControlKeyDown() ) ) then
			MapNotes_DeleteNote(self.ref, self.key);

		elseif ( ( IsAltKeyDown() ) and ( not IsControlKeyDown() ) and ( not IsShiftKeyDown() ) ) then
			if ( self.ref == 0 ) then
				MapNotes_ClearMiniNote(nil, "tloc");
			elseif ( self.ref == -1 ) then
				MapNotes_ClearMiniNote(nil, "party");
			end
		end
		return;
	end

	Minimap_OnClick(Minimap, mouseButton);
end

function MapNotes_Minimap_OnClick(...)
	if ( ( IsControlKeyDown() ) and ( IsAltKeyDown() ) and ( arg1 == "RightButton" ) ) then
		local x, y = GetCursorPosition();
		x = x / this:GetEffectiveScale();
		y = y / this:GetEffectiveScale();

		local cx, cy = this:GetCenter();
		x = x - cx;
		y = 1 - ( y - cy );
		local dist = sqrt(x * x + y * y);
		if ( dist < (this:GetWidth() / 2) ) then
			
			SetMapToCurrentZone();
			local pX, pY = GetPlayerMapPosition("player");
			local lZone, lCont = GetCurrentMapZone(), GetCurrentMapContinent();

			if ( ( ( pX == 0 ) and ( pY == 0 ) ) or ( lZone == 0 ) ) then
				return;

			else
				local currentConst, currentZoom, rotatingMinimap, xScale, yScale, mapX, mapY;
				local key = MapNotes_GetMapKey();

				if ( ( MapNotes_Keys[key] ) and ( MapNotes_Keys[key].miniData ) ) then
					if ( ( MapNotes_Keys[key] ) and ( MapNotes_Keys[key].miniData ) ) then
						currentConst = MapNotes_Keys[key].miniData;
					else
						currentConst = MAPNOTES_DEFAULT_MINIDATA;
					end
					currentZoom = Minimap:GetZoom();

					if ( GetCVar("rotateMinimap") == "1" ) then
						if ( MiniMapCompassRing ) then
							rotatingMinimap = MiniMapCompassRing:GetFacing();
						else
							rotatingMinimap = -( GetPlayerFacing() );
						end
					end

					if ( rotatingMinimap ) then
						local theta = atan2(x, y);
						theta = theta - rotatingMinimap;
						x = sin(theta) * dist;
						y = cos(theta) * dist;
					end

					if ( lZone > 0 ) then
						xScale = MapNotes_MiniConst[lCont][currentZoom].xScale;
						yScale = MapNotes_MiniConst[lCont][currentZoom].yScale;
					else
						xScale = MapNotes_MiniConst[MAPNOTES_DEFAULT_MINIDATA.cont][currentZoom].xScale;
						yScale = MapNotes_MiniConst[MAPNOTES_DEFAULT_MINIDATA.cont][currentZoom].yScale;
					end
					if ( MapNotes_MiniNote_IsInCity ) then
						xScale = xScale * MapNotes_CityConst[currentZoom].cityScale;
						yScale = yScale * MapNotes_CityConst[currentZoom].cityScale;
					end
			
					pX = pX * currentConst.scale + currentConst.xOffset;
					pY = pY * currentConst.scale + currentConst.yOffset;

					x = ( ( (x / xScale) + pX ) - currentConst.xOffset ) / currentConst.scale;
					y = ( ( (y / yScale) + pY ) - currentConst.yOffset ) / currentConst.scale;

					MapNotes_ShortCutNote(x, y, nil, true);
				end
			end
		end
		MapNotes_MapUpdate();

	else
		orig_Minimap_OnClick(...);
	end
end



-- Create the note in the Players current Map if not in an Instance
function MN_ThottInterface_Local(x, y, desc, creator)
	-- No need to reset to a previous map - if not current then they're probably viewing a map,
	-- and presumably would want to see it change and the marker placed on it...
	SetMapToCurrentZone();

	-- Get MapKey if valid coordinate system for current map...
	local pX, pY = GetPlayerMapPosition("player");
	if ( ( pX <= 0 ) and ( pY <= 0 ) ) then
		return;
	end
	local key = MapNotes_GetMapKey();

	MN_ThottInterface(key, x, y, desc, creator);
end

-- Create the note on a specified map using legacy keying system
-- This may suffer from the old zone shift problems associated with this keying system on different clients, depending on other AddOn calling it
function MN_ThottInterface_Legacy(c, z, x, y, desc, creator)
	-- Translate Continent/Zone to key
	local key = MapNotes_OldKeys[c][z];	

	-- Could do some testing for inside Instances where note creation is possible.... ???

	if ( key ) then
--		SetMapZoom(c, z);								-- ???
		MN_ThottInterface(key, x, y, desc, creator);
	end
end

function MN_ThottInterface(key, x, y, desc, creator)
	local msg;

--	if ( IsAltKeyDown() ) then						-- Must hold down <Alt> if wanting a temporary Thott marker
	if ( ( creator == "AlphaMobMap" ) or ( not IsControlKeyDown() ) ) then
		if ( not desc ) then
			desc = MAPNOTES_THOTTBOTLOC;
		end
		MapNotes_tloc_xPos = x / 100;
		MapNotes_tloc_yPos = y / 100;
		MapNotes_tloc_name = desc;
		MapNotes_tloc_key = MapNotes_GetMapKey();
		MapNotes_MiniNote_Data.id = 0;
		MapNotes_MiniNote_Data.key = MapNotes_tloc_key;
		MapNotes_MiniNote_Data.xPos = MapNotes_tloc_xPos;
		MapNotes_MiniNote_Data.yPos = MapNotes_tloc_yPos;
		MapNotes_MiniNote_Data.name = MapNotes_tloc_name;
		MapNotes_MiniNote_Data.color = 4;
		MapNotes_MiniNote_Data.icon = "tloc";
		MN_MiniNotePOITexture:SetTexture(nil);
		if ( ( MNIL ) and ( MN_TLOC_ICON ) ) then
			MN_MiniNotePOITexture:SetTexture(MN_TLOC_ICON);
		end
		local txtr = MN_MiniNotePOITexture:GetTexture();
		if ( not txtr ) then
			MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icon"..MapNotes_MiniNote_Data.icon);
		end
		MapNotes_MapUpdate();

	elseif ( IsControlKeyDown() ) then				-- else hold down <Ctrl> if wanting a permanent marker
		-- Hide other frames
		-- Set Creator to Lightheaded
		-- Use Red Cross marker
		MapNotes_HideFrames();
		local MN_creatorOverride, MN_mininoteOverride = creator, true;
		if ( ( not MN_creatorOverride ) and ( Lightheaded ) ) then
			MN_creatorOverride = "Lightheaded";
--		else
--			MN_creatorOverride = "";
		end
		if ( IsShiftKeyDown() ) then
			MN_mininoteOverride = nil;
		end
		MapNotes_Quicktloc( x .. ", " .. y .. " 6 "..desc, MN_creatorOverride, MN_mininoteOverride );
	end
end



function MapNotes_WorldMapButton_OnClick(button, mouseButton)
	CloseDropDownMenus();

	if ( not MapNotes_FramesHidden() ) then
		return;
	else
		MapNotes_ClearGUI();
	end

	local key = MapNotes_GetMapKey();

	-- if we are viewing a continent or continents or it was left-click call the original handler
	if ( ( mouseButton == "LeftButton" ) or ( ( mouseButton == "RightButton" ) and ( not IsControlKeyDown() ) and ( not IsShiftKeyDown() ) ) ) then --Telic_7
		orig_MapNotes_WorldMapButton_OnClick(button, mouseButton);
		return;
	end

	-- <control>+right-click is used to bring up the main menu when viewing a particular zone/city
	-- shift right-click is used to set the party note at the click location

	if not button then
		button = WorldMapButton;
	end

	local adjustedX, adjustedY = MapNotes_GetMouseXY(button);

	if ( IsShiftKeyDown() ) then
		MapNotes_SetPartyNote(adjustedX, adjustedY);
		MapNotes_MapUpdate();

	elseif ( IsAltKeyDown() ) then
		local lNote = MapNotes_ShortCutNote(adjustedX, adjustedY);
		MapNotes_MapUpdate();
		if ( lNote ) then
			lNote = getglobal( "MapNotesPOI" .. lNote );
			if ( lNote ) then
				lNote:SetFrameLevel( MapNotes_WorldMapButton:GetFrameLevel() + 1 );
			end
		end

	else
		MapNotes:InitialiseDropdown(button, adjustedX, adjustedY, MapNotes.base_dd_info, key);
		ToggleDropDownMenu(1, nil, MapNotes.dd, "cursor", 0, 0);
	end
end


-- %%% THE CORE %%%
function MapNotes_WorldMapButton_OnUpdate()
	if ( ( MapNotesFU_Drawing ) or ( not MapNotes_Options.aFactor ) ) then
		return;
	end
--	if ( not WorldMapFrame:IsVisible() ) then
--		return;
--	end

	MapNotesFU_Drawing = true;

	local border	= ( MapNotes_Options.iFactor / MAPNOTES_DFLT_ICONSIZE ) * MAPNOTES_BORDER;
	local lBorder	= ( MapNotes_Options.iFactor / MAPNOTES_DFLT_ICONSIZE ) * ( MAPNOTES_BORDER / 2 );
	local width = WorldMapButton:GetWidth();
	local height = WorldMapButton:GetHeight();
	local key = MapNotes_GetMapKey();
	local currentZone = MapNotes_Data_Notes[key];
	local currentLineZone = MapNotes_Data_Lines[key];
	local xOffset,yOffset = 0;
	local POI, POITexture, POIHighlight, POIMininote, POILastnote, POIName;
	local nNotes, nLines = 1, 1;
	local findIn;
	local scalingFactor = MN_ScaleMe(WorldMapButton);

	if ( ( currentZone ) and ( MapNotes_Options.shownotes ) ) then
		for i, value in ipairs(currentZone) do

			-- Data Validity Checks : Set Defatults for missing mandatory data
			if ( not currentZone[i].icon ) then
				currentZone[i].icon = 0;
			end
			POI = MapNotes_AssignPOI(i);
			POI.key = key;
			POI.nid = i;
			POIName = POI:GetName();
			POI:SetScale( scalingFactor );
			local xOffset = ( currentZone[i].xPos * width ) / scalingFactor;
			local yOffset = ( -currentZone[i].yPos * height ) / scalingFactor;
			POI:SetUserPlaced(false);
			POI:ClearAllPoints();
			POI:SetPoint("CENTER", "WorldMapDetailFrame", "TOPLEFT", xOffset, yOffset);
			POITexture = getglobal(POIName.."Texture");
			POIMininote = getglobal(POIName.."Mininote");
			POILastnote = getglobal(POIName.."Lastnote");
			POIHighlight = getglobal(POIName.."Highlight");
			-- Custom
			POITexture:SetTexture(nil);
			if ( ( MNIL ) and ( currentZone[i].customIcon ) ) then
				POITexture:SetTexture( currentZone[i].customIcon );
			end
			if ( not POITexture:GetTexture() ) then
				POITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icon"..currentZone[i].icon);
			end

			findIn = string.lower(value.name);
			if ( ( MapNotes_HighlightedNote ~= "" ) and ( string.find( findIn, MapNotes_HighlightedNote ) ) ) then
				POIHighlight:Show();
				-- Custom
				if ( ( findIn == MapNotes_HighlightedNote ) and ( MapNotes_Options[13] ~= "off" ) ) then
					POIMininote:Show();
				end
			-- Custom
			elseif ( ( currentZone[i].mininote ) and ( MapNotes_Options[13] ~= "off" ) ) then
				POIMininote:Show();
				POIHighlight:Hide();
			else
				POIMininote:Hide();
				POIHighlight:Hide();
			end

			if MapNotes_Options[currentZone[i].icon] ~= "off" then
				if (MapNotes_Options[10] ~= "off" and currentZone[i].creator == UnitName("player")) or
					(MapNotes_Options[11] ~= "off" and currentZone[i].creator ~= UnitName("player")) then
					POI:SetWidth( MapNotes_Options.iFactor );
					POIMininote:SetWidth( border );
					POI:SetHeight( MapNotes_Options.iFactor );
					POIMininote:SetHeight( border );
					POI:SetAlpha( MapNotes_Options.aFactor );
					POILastnote:Hide();
					POI:Show();
				end
			else
				POI:Hide();
			end
			nNotes = nNotes + 1;
		end

		if ( MapNotes_Options[12] ~= "off" ) then
			if ( ( POI ) and ( POI:IsVisible() ) ) then
				-- Custom
				POILastnote:SetWidth( lBorder );
				POILastnote:SetHeight( lBorder );
				POILastnote:Show();
			end
		end

		if ( currentLineZone ) then
			for i, line in ipairs(currentLineZone) do
				MapNotes_DrawLine(i, line.x1, line.y1, line.x2, line.y2);
				nLines = nLines + 1;
			end
		end
	end

	local otherPOI = getglobal("MapNotesPOI"..nNotes);
	while ( otherPOI ) do
		otherPOI:Hide();
		nNotes = nNotes + 1;
		otherPOI = getglobal("MapNotesPOI"..nNotes);
	end

	local otherLines = getglobal("MapNotesLines_"..nLines);
	while ( otherLines ) do
		otherLines:Hide();
		nLines = nLines + 1;
		otherLines = getglobal("MapNotesLines_"..nLines);
	end

	if ( currentZone ) then
		-- tloc button
		if ( ( MapNotes_tloc_xPos ) and ( MapNotes_tloc_key == key ) ) then
			MapNotesPOItlocTexture:SetTexture(nil);
			if ( ( MNIL ) and ( MN_TLOC_ICON ) ) then
				MapNotesPOItlocTexture:SetTexture(MN_TLOC_ICON);
			end
			if ( not MapNotesPOItlocTexture:GetTexture() ) then
				MapNotesPOItlocTexture:SetTexture(MN_POI_ICONS_PATH.."\\Icontloc");
			end
			if MapNotes_Options[13] ~= "off" and MapNotes_MiniNote_Data.icon == "tloc" then
				MapNotesPOItlocMininote:SetWidth( border );
				MapNotesPOItlocMininote:SetHeight( border );
				MapNotesPOItlocMininote:Show();
				MapNotesPOItlocMininote.key = key;
				MapNotesPOItlocMininote.nid = 0;
			else
				MapNotesPOItlocMininote:Hide();
			end
			MapNotesPOItloc:SetScale( scalingFactor );
			xOffset = ( MapNotes_tloc_xPos * width ) / scalingFactor;
			yOffset = ( -MapNotes_tloc_yPos * height ) / scalingFactor;
			MapNotesPOItloc:SetPoint("CENTER", "WorldMapDetailFrame", "TOPLEFT", xOffset, yOffset);
			MapNotesPOItloc:SetWidth( MapNotes_Options.iFactor );
			MapNotesPOItloc:SetHeight( MapNotes_Options.iFactor );
			MapNotesPOItloc:SetAlpha( MapNotes_Options.aFactor );
			MapNotesPOItloc:Show();
			MapNotesPOItloc.key = key;
			MapNotesPOItloc.nid = 0;
		else
			MapNotesPOItloc:Hide();
		end

		-- party note
		if ( ( MapNotes_PartyNoteData.xPos ) and ( key == MapNotes_PartyNoteData.key ) ) then
			MapNotesPOIpartyTexture:SetTexture(nil);
			if ( ( MNIL ) and ( MN_PARTY_ICON ) ) then
				MapNotesPOIpartyTexture:SetTexture(MN_PARTY_ICON);
			end
			if ( not MapNotesPOIpartyTexture:GetTexture() ) then
				MapNotesPOIpartyTexture:SetTexture(MN_POI_ICONS_PATH.."\\Iconparty");
			end
			if MapNotes_Options[13] ~= "off" and MapNotes_MiniNote_Data.icon == "party" then
				MapNotesPOIpartyMininote:SetWidth( border );
				MapNotesPOIpartyMininote:SetHeight( border );
				MapNotesPOIpartyMininote:Show();
				MapNotesPOIpartyMininote.key = key;
				MapNotesPOIpartyMininote.nid = -1;
			else
				MapNotesPOIpartyMininote:Hide();
			end
			MapNotesPOIparty:SetScale( scalingFactor );
			xOffset = ( MapNotes_PartyNoteData.xPos * width ) / scalingFactor;
			yOffset = ( -MapNotes_PartyNoteData.yPos * height ) / scalingFactor;
			MapNotesPOIparty:SetPoint("CENTER", "WorldMapDetailFrame", "TOPLEFT", xOffset, yOffset);
			MapNotesPOIparty:SetWidth( MapNotes_Options.iFactor );
			MapNotesPOIparty:SetHeight( MapNotes_Options.iFactor );
			MapNotesPOIparty:SetAlpha( MapNotes_Options.aFactor );
			MapNotesPOIparty:Show();
			MapNotesPOIparty.key = key;
			MapNotesPOIparty.nid = -1;
		else
			MapNotesPOIparty:Hide();
		end

	else
		MapNotesPOItloc:Hide();
		MapNotesPOIparty:Hide();
	end

	for pluginName, Plugin in pairs(MAPNOTES_PLUGINS_LIST) do
		if ( Plugin.wmflag ) then
			local plugInFrame = getglobal( Plugin.frame );
			if ( ( plugInFrame ) and ( plugInFrame:IsVisible() ) ) then
				MapNotes_PlugInsDrawNotes(Plugin);
			end
		end
	end

	MapNotesFU_Drawing = nil;
end



function MapNotes_ToggleWorldMap(frame)
	if ( frame == WorldMapFrame ) then
		if ( not WorldMapFrame:IsVisible() ) then
			SetMapToCurrentZone();
		end
		MapNotes_HideAll();
		ColorPickerFrame:Hide();
	end
end



function MapNotes_RememberPosition(n_id)
	local Plugin = this.Plugin;
	local key;

	if ( Plugin ) then
		key = MapNotes_PlugInsGetKey(Plugin);
	else
		key = MapNotes_GetMapKey();
	end

	this.lastXPos = MapNotes_Data_Notes[key][n_id].xPos;
	this.lastYPos = MapNotes_Data_Notes[key][n_id].yPos;
end

function MapNotes_RepositionNote(n_id)
	local pFrame = this:GetParent();
	local Plugin = this.Plugin;

	if ( MouseIsOver(pFrame) ) then
		local x, y = MapNotes_GetMouseXY(pFrame);
		local key;

		if ( Plugin ) then
			key = MapNotes_PlugInsGetKey(Plugin);
		else
			key = MapNotes_GetMapKey();
		end

		MapNotes_Data_Notes[key][n_id].xPos = x;
		MapNotes_Data_Notes[key][n_id].yPos = y;

		-- Update Lines using this Note as a Vertex
		local lX = this.lastXPos;
		local lY = this.lastYPos;
		for i, line in ipairs(MapNotes_Data_Lines[key]) do
			if ( ( line.x1 == lX ) and ( line.y1 == lY ) ) then
				line.x1 = x;
				line.y1 = y;

			elseif ( ( line.x2 == lX ) and ( line.y2 == lY ) ) then
				line.x2 = x;
				line.y2 = y;
			end
		end
	end

	if ( Plugin ) then
		MapNotes_PlugInsDrawNotes(Plugin);
	else
		MapNotes_MapUpdate();
	end
end


-- MapNotes Global Search
function MapNotes_Search(fTxt)
	if ( ( fTxt ) and ( fTxt ~= "" ) ) then
		local foundArray = {};

		fTxt = string.lower(fTxt);
		for key, map in pairs(MapNotes_Data_Notes) do
			for index, note in ipairs(map) do
				local sTxt = string.lower( note.name .. note.inf1 .. note.inf2 .. note.creator );
				if ( string.find(sTxt, fTxt) ) then
					local name, lName, cat;
					if ( string.sub(key, 1, 3) == "WM " ) then
						name, lName, cat = MapNotes_GetMapDisplayName(key);

					else
						for index, Plugin in pairs(MAPNOTES_PLUGINS_LIST) do
							if ( string.find(key, Plugin.name) ) then
								name, lName, cat = MapNotes_GetMapDisplayName(key, Plugin);
								break;
							end
						end
					end
					if ( not foundArray[cat] ) then
						foundArray[cat] = {};
						foundArray[cat].counter = 1;
					end
					if ( not foundArray[cat][lName] ) then
						foundArray[cat][lName] = {};
						foundArray[cat][lName].counter = 1;
					else
						foundArray[cat][lName].counter = foundArray[cat][lName].counter + 1;
					end
				end
			end
		end

		local counter = 0;
		MapNotes_StatusPrint(" ");
		for type, noteTypes in pairs(foundArray) do
			MapNotes_StatusPrint("----------");
			MapNotes_StatusPrint(type);
			for key, note in pairs(noteTypes) do
				if ( key ~= "counter" ) then
					MapNotes_StatusPrint(key .. " : " .. note.counter .. MAPNOTES_NOTESFOUND);
					counter = counter + 1;
				end
			end
		end
		MapNotes_StatusPrint("----------");
		MapNotes_StatusPrint(counter.. " " .. ZONE);
		MapNotes_StatusPrint(" ");
	end
end



function MapNotes_Highlight(hName)
	if ( ( hName ) and ( hName ~= "" ) ) then
		hName = string.lower(hName);
		MapNotes_HighlightedNote = hName;
		MapNotes_TrackHighlights(hName, true);
	else
		MapNotes_HighlightedNote = "";
		MapNotes_TrackHighlights(hName);
	end
	MapNotes_PlugInsRefresh();
	MapNotes_MapUpdate();
end

function MapNotes_TrackHighlights(hName, hlVal)
	MapNotes_ClearTrackHighlights();
	if ( hlVal ) then
		highlightedNotes = {};
		for dat, val in pairs(MapNotes_Data_Notes) do
			for note, noteA in pairs(val) do
				local dataName = string.lower(noteA.name);
				if ( dataName == hName ) then
					if ( ( hlVal ) and ( not noteA.mininote ) ) then
						noteA.mininote = "HL";
						if ( not highlightedNotes[dat] ) then
							highlightedNotes[dat] = {};
						end
						if ( not highlightedNotes[dat][note] ) then
							highlightedNotes[dat][note] = true;
						end
					end
				end
			end
		end
	end
end

function MapNotes_ClearTrackHighlights()
	for dat, val in pairs(MapNotes_Data_Notes) do
		if ( highlightedNotes[dat] ) then
			for note, noteA in pairs(val) do
				if ( highlightedNotes[dat][note] ) then
					noteA.mininote = nil;
				end
			end
		end
	end
end

function MapNotes_ResetHighlightsOnLoad()
	for dat, val in pairs(MapNotes_Data_Notes) do
		for note, noteA in pairs(val) do
			if ( ( noteA.mininote ) and ( noteA.mininote == "HL" ) ) then
				noteA.mininote = nil;
			end
		end
	end
end

function MapNotes_MiniCToggle()
	if ( MN_MinimapCoordsFrame:IsVisible() ) then
		MN_MinimapCoordsFrame:Hide();
		MapNotesOptionsCheckboxMiniC:SetChecked(0);
		MapNotes_Options.miniC = false;
	else
		MN_MinimapCoordsFrame:ClearAllPoints();
		MN_MinimapCoordsFrame:SetUserPlaced(0);
		MN_MinimapCoordsFrame:SetPoint("TOP", "MinimapCluster", "BOTTOM", 8, 16);
		MN_MinimapCoordsFrame:Show();
		MapNotesOptionsCheckboxMiniC:SetChecked(1);
		MapNotes_Options.miniC = true;
	end
end

function MapNotes_MapCToggle()
	if ( MN_MapCoords:IsVisible() ) then
		MapNotes_Options.mapC = nil;
		MapNotesOptionsCheckboxMapC:SetChecked(0);
		MN_SetCoordsPos();
	else
		MapNotes_Options.mapC = true;
		MapNotesOptionsCheckboxMapC:SetChecked(1);
		MN_SetCoordsPos();
	end
end

function MN_SetCoordsPos()
	local x, y = MapNotes_Options.coordsLocX, MapNotes_Options.coordsLocY;

	MN_MapCoords:ClearAllPoints();
	MN_MapCoords:SetUserPlaced(0);
	MN_MapCoords:SetParent(WorldMapFrame);
	MN_MapCoords:SetPoint("CENTER", "WorldMapButton", "BOTTOMLEFT", x, y);
	MN_MapCoords:SetFrameLevel( WorldMapButton:GetFrameLevel() + 3);
	MN_MapCoords:Show();
	if ( not MapNotes_Options.mapC ) then
		MN_MapCoords:Hide();
	end
end



function MN_RememberCoordsPos()
	if ( MN_MapCoords.isMoving ) then
		if ( MouseIsOver(WorldMapFrame) ) then
			MN_MapCoords.startingX, MN_MapCoords.startingY = MN_GetRelativeCoords(MN_MapCoords, WorldMapButton);
		else
			MN_MapCoords.startingX, MN_MapCoords.startingY = MN_DefaultCoordsX, MN_DefaultCoordsY;
		end
		return;

	else
		local x, y;
		if ( MouseIsOver(WorldMapFrame) ) then
			x, y = MN_GetRelativeCoords(MN_MapCoords, WorldMapButton);
		else
			x, y = MN_MapCoords.startingX, MN_MapCoords.startingY;
		end
		MapNotes_Options.coordsLocX, MapNotes_Options.coordsLocY = x, y;
		MN_SetCoordsPos();
	end
end

-- %%% Corrected positioning function ???
function MN_GetRelativeCoords(pFrame, rFrame)
		local x, y = pFrame:GetCenter();
		local centerX, centerY = rFrame:GetCenter();
		local width = rFrame:GetWidth();
		local height = rFrame:GetHeight();
		x = (x - (centerX - (width/2)));
		y = height - (centerY + (height/2) - y );

		return x, y;
end


-- £££1
function MN_MinimapCoords_OnUpdate(self)
	local x,y = GetPlayerMapPosition("player");
	if ( recordingData ) then

	end
	if ( ( x ) and ( y ) ) then
		x = x*100;
		y = y*100;
		MN_MinimapCoordsFrameText:SetText( format(MN_COORD_FS[MN_COORD_F], x, y) );
		MN_MinimapCoordsFrame:SetWidth(MN_MinimapCoordsFrameText:GetWidth() + 12);
	end
end

function MN_MapCoords_OnUpdate(self, elapsed)
	if ( IsControlKeyDown() ) then
		if ( not MN_MapCoordsMovementFrame:IsVisible() ) then
			MN_MapCoordsMovementFrame:Show();
		end
	else
		if ( MN_MapCoordsMovementFrame:IsVisible() ) then
			if ( MN_MapCoords.isMoving ) then
				MN_MapCoords:StopMovingOrSizing();
				MN_MapCoords.isMoving = false;
				MN_RememberCoordsPos();
			end
			MN_MapCoordsMovementFrame:Hide();
		end
	end

	MN_cUpdate = MN_cUpdate + elapsed;
	if ( MN_cUpdate > MN_cUpdateLimit ) then
		local pLoc, cLoc = "", nil;
		local x,y = GetPlayerMapPosition("player");
		local cX, cY = nil, nil;

		if ( ( x ) and ( y ) ) then
			x = x*100;
			y = y*100;
			pLoc = "|c0000FF00"..( format(MN_COORD_FS[MN_COORD_F], x, y) ).."|r";
		end

		if ( MouseIsOver(WorldMapButton) ) then
		        local centerX, centerY = WorldMapButton:GetCenter();
		        local width = WorldMapButton:GetWidth();
		        local height = WorldMapButton:GetHeight();
		        cX, cY = GetCursorPosition();
		        cX = cX / WorldMapButton:GetEffectiveScale();
		        cY = cY / WorldMapButton:GetEffectiveScale();
		        local adjustedY = (centerY + height/2 - cY) / height;
		        local adjustedX = (cX - (centerX - width/2)) / width;
		        cX = 100 * ( adjustedX + MN_MOFFSET_X );
		        cY = 100 * ( adjustedY + MN_MOFFSET_Y );
		end

		local h = 28;
		if ( ( cX ) and ( cY ) ) then
			cLoc = "\n|c00FFFF00"..( format(MN_COORD_FS[MN_COORD_F], cX, cY) ).."|r";
			h = 48;
		end

		MN_MapCoordsText:SetText( pLoc .. ( cLoc or "" ) );
		MN_cUpdate = 0;

		local w = MN_MapCoordsText:GetWidth() + 4;
		
		self:SetWidth(w);
		self:SetHeight(h);
	end
end



function MN_MinimapCoords_OnClick()
	MapNotes:InitialiseDropdown(UIParent, nil, nil, MapNotes.coords_dd_info);
	ToggleDropDownMenu(1, nil, MapNotes.dd, "cursor", 0, 0);
end



function MapNotes_TargetNote(inf2)
	local t = UnitName("target");

	if ( not t ) then
		MapNotes_CreateQuickNote(inf2);
		return;
	end

	if ( not MapNotes_TargetInfo_Proceed ) then
		local x, y = GetPlayerMapPosition("player");

		if ( ( ( x ) and ( x == 0 ) ) and ( ( y ) and ( y == 0 ) ) ) then
			SetMapToCurrentZone();
			x, y = GetPlayerMapPosition("player");
			if ( ( ( x ) and ( x == 0 ) ) and ( ( y ) and ( y == 0 ) ) ) then
				MapNotes_StatusPrint(MAPNOTES_QUICKNOTE_NOPOSITION);
				return;
			end
		end

		local tstIcon = string.sub(inf2, 1, 2);
		if ( ( tstIcon ) and ( type(tstIcon) == "string" ) and ( tstIcon ~= "" ) and ( string.find(tstIcon, "%d%s") ) ) then
			inf2 = string.sub(inf2, 3);
		else
			tstIcon = nil;
		end

		if ( not inf2 ) then
			inf2 = "";
		end

		GameTooltip:Hide();

		GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR");
		GameTooltip:SetUnit("target");
		GameTooltip:SetFrameStrata("TOOLTIP");
		GameTooltip:Show();

		MapNotes_TargetInfo_Proceed = {};
		MapNotes_TargetInfo_Proceed.tstIcon = tstIcon;
		MapNotes_TargetInfo_Proceed.inf2 = inf2;
		MapNotes_TargetInfo_Proceed.func = MapNotes_TargetNote;

	else
		MapNotes_TargetInfo_Proceed.name, MapNotes_TargetInfo_Proceed.inf1 = MapNotes_TargetInfo();
		if ( MapNotes_TargetInfo_Proceed.tstIcon ) then
			MapNotes_TargetInfo_Proceed.name = MapNotes_TargetInfo_Proceed.tstIcon .. string.sub(MapNotes_TargetInfo_Proceed.name, 3);
		end
		MapNotes_CreateQuickNote(MapNotes_TargetInfo_Proceed.name, MapNotes_TargetInfo_Proceed.inf1, MapNotes_TargetInfo_Proceed.inf2);
		MapNotes_TargetInfo_Proceed = nil;
		GameTooltip:Hide();
	end
end

function MapNotes_MergeNote(inf2)
	if ( not MapNotes_TargetInfo_Proceed ) then
		local x, y = GetPlayerMapPosition("player");

		if ( ( ( x ) and ( x == 0 ) ) and ( ( y ) and ( y == 0 ) ) ) then
			SetMapToCurrentZone();
			x, y = GetPlayerMapPosition("player");
			if ( ( ( x ) and ( x == 0 ) ) and ( ( y ) and ( y == 0 ) ) ) then
				MapNotes_StatusPrint(MAPNOTES_QUICKNOTE_NOPOSITION);
				return;
			end
		end

		if ( not UnitExists("target") ) then
			MapNotes_StatusPrint(MAPNOTES_MERGE_WARNING);
			return;
		end

		local tstIcon = string.sub(inf2, 1, 2);
		if ( ( tstIcon ) and ( type(tstIcon) == "string" ) and ( tstIcon ~= "" ) and ( string.find(tstIcon, "%d%s") ) ) then
			inf2 = string.sub(inf2, 3);
		else
			tstIcon = nil;
		end

		if ( not inf2 ) then
			inf2 = "";
		end

		GameTooltip:Hide();

		GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR");
		GameTooltip:SetUnit("target");
		GameTooltip:SetFrameStrata("TOOLTIP");
		GameTooltip:Show();

		MapNotes_TargetInfo_Proceed = {};
		MapNotes_TargetInfo_Proceed.tstIcon = tstIcon;
		MapNotes_TargetInfo_Proceed.inf2 = inf2;
		MapNotes_TargetInfo_Proceed.func = MapNotes_MergeNote;

	else
		MapNotes_TargetInfo_Proceed.name, MapNotes_TargetInfo_Proceed.inf1 = MapNotes_TargetInfo();
		if ( MapNotes_TargetInfo_Proceed.tstIcon ) then
			MapNotes_TargetInfo_Proceed.name = MapNotes_TargetInfo_Proceed.tstIcon .. string.sub(MapNotes_TargetInfo_Proceed.name, 3);
		end
		MapNotes_CreateQuickNote(MapNotes_TargetInfo_Proceed.name, MapNotes_TargetInfo_Proceed.inf1, MapNotes_TargetInfo_Proceed.inf2, "true");
		MapNotes_TargetInfo_Proceed = nil;
		GameTooltip:Hide();
	end
end

function MapNotes_TargetInfo()
	local icon = 8;
	local text = UnitName("target");
	local text2 = "";

	if ( ( text ) and ( text ~= "" ) ) then
		local unitReact = UnitReaction("player", "target");
		if ( unitReact ) then
			if (unitReact < 4) then
				-- hostile, get level, classification, type, and class
				text2 = text2.." "..MN_LEVEL.." "..UnitLevel("target");
				icon = 6;
				if (UnitClassification("target") ~= "normal") then
				text2 = text2.." "..UnitClassification("target");
				end
				text2 = text2.." "..UnitCreatureType("target").." "..UnitClass("target");
			elseif (unitReact == 4) then
				-- neutral, assume critter, use yellow icon
		        	icon = 5;
			else
				-- add profession
				local profession = GameTooltipTextLeft2:GetText();
				-- set profession to nil if it's the target's level or empty
				if ( ( profession ) and ( ( string.find(profession, MN_LEVEL) ) or ( profession == "" ) ) ) then
					profession = nil;
				end
				if ( profession ) then
					text2 = text2.." <"..profession..">";
				end
			end
		end
		text = icon.." "..text;
	else
		text = "";
	end

	return text, text2;
end

function MapNotes_Merge(key, n_id, name, inf1, inf2)
	name = string.sub(name, 3);
	if ( ( name ) and ( name ~= "" ) ) then
		local tstIcon = string.sub(name, 1, 2);
		if ( string.find(tstIcon, "%d%s") ) then
			name = string.sub(name, 3);
		end

		if ( not inf1 ) then
			inf1 = "";
		end
		if ( not inf2 ) then
			inf2 = "";
		end

		if ( string.find( MapNotes_Data_Notes[key][n_id].name, UnitName("target") ) ) then
			MapNotes_StatusPrint( MAPNOTES_MERGE_DUP..UnitName("target") );
		else
			MapNotes_Data_Notes[key][n_id].name = MapNotes_Data_Notes[key][n_id].name .." \124\124 ".. name;	-- " | "
			MapNotes_Data_Notes[key][n_id].inf1 = MapNotes_Data_Notes[key][n_id].inf1 .." \124\124 ".. inf1;	-- " | "
			MapNotes_Data_Notes[key][n_id].inf2 = MapNotes_Data_Notes[key][n_id].inf2 .." \124\124 ".. inf2;	-- " | "
			MapNotes_StatusPrint( MAPNOTES_MERGED..UnitName("target") );
		end
	end
end


function MapNotes_CreateLandMarks()
	if ( WorldMapFrame:IsVisible() ) then
		ToggleWorldMap();
	end
	local continentNames = { GetMapContinents() };

	for i in ipairs(continentNames) do
		local zoneNames = { GetMapZones(i) };
		for j in ipairs(zoneNames) do
			SetMapZoom(i, j);
			MapNotes_IterateLandMarks(true);
		end
	end
end

function MapNotes_IterateLandMarks(report)
	local nCreated, nMerged, nSkipped = 0, 0, 0;

	local map = GetMapInfo();
	if ( ( not map ) or ( ( map ) and ( GetCurrentMapZone() == 0 ) ) ) then
		return;
	end

	for k=1, GetNumMapLandmarks(), 1 do
		name, desc, textureIndex, x, y = GetMapLandmarkInfo(k);
		local created = MapNotes_CreateLandMarkNote(name, desc, textureIndex, x, y);
		if ( created == "Created" ) then
			nCreated = nCreated + 1;
		elseif ( created == "Merged" ) then
			nMerged = nMerged + 1;
		else
			nSkipped = nSkipped + 1;
		end
	end

	local tot = nCreated + nMerged;
	if ( ( report ) or ( tot > 0 ) ) then
		local key = MapNotes_GetMapKey();
		MapNotes_StatusPrint( tot.." "..MAPNOTES_LANDMARKS_NOTIFY..(MapNotes_GetMapDisplayName(key)) );
	end
	MapNotes_MapUpdate();

	return;
end

function MapNotes_CreateLandMarkNote(name, desc, textureIndex, x, y)
	local key = MapNotes_GetMapKey();
	local currentZone = MapNotes_Data_Notes[key];
	local checknote = MapNotes_CheckNearNotes(key, x, y);

	if ( not desc ) then
		desc = "";
	end

	if ( checknote ) then
		if ( ( currentZone[checknote].name == name ) or ( string.find( currentZone[checknote].name, name ) ) ) then
			return "Duplicate";

		else
			currentZone[checknote].name = currentZone[checknote].name .." \124\124 ".. name;	-- " | "
			currentZone[checknote].inf1 = currentZone[checknote].inf1 .." \124\124 ".. desc;	-- " | "
			return "Merged";
		end

	else
		MapNotes_TempData_Id = MapNotes_GetZoneTableSize(currentZone) + 1;
		currentZone[MapNotes_TempData_Id] = {};
		currentZone[MapNotes_TempData_Id].name = name;
		currentZone[MapNotes_TempData_Id].ncol = 7;
		currentZone[MapNotes_TempData_Id].inf1 = "";
		currentZone[MapNotes_TempData_Id].in1c = 6;
		currentZone[MapNotes_TempData_Id].inf2 = "";
		currentZone[MapNotes_TempData_Id].in2c = 0;
		currentZone[MapNotes_TempData_Id].creator = "MapNotesLandMark";
		currentZone[MapNotes_TempData_Id].icon = 7;
		currentZone[MapNotes_TempData_Id].xPos = x;
		currentZone[MapNotes_TempData_Id].yPos = y;
		return "Created";
	end

	return nil;
end

function MapNotes_DeleteLandMarks()
	local key = MapNotes_GetMapKey();
	local currentZone = MapNotes_Data_Notes[key];

	for i=MapNotes_GetZoneTableSize(currentZone), 1, -1 do
		if ( currentZone[i].creator == "MapNotesLandMark" ) then
			MapNotes_DeleteNote(i, key, nil);
		end
	end
	MapNotes_MapUpdate();
end



function MapNotes_WFC(thisParms)
	MapNotes_StatusPrint(MAPNOTES_MINIMAP_COORDS);
	MapNotes_StatusPrint(MAPNOTES_WFC_WARN);
	MapNotes_MiniCToggle();
end



function MapNotes_ClearIcons()
	for area, areaNotes in pairs(MapNotes_Data_Notes) do
		for note, noteData in pairs(areaNotes) do
			noteData.customIcon = nil;
		end
	end
end

local totallyMini = nil;
function MapNotes_TotallyMini()
	if ( totallyMini ) then
		totallyMini = nil;
	else
		totallyMini = true;
	end
	for area, areaNotes in pairs(MapNotes_Data_Notes) do
		for note, noteData in pairs(areaNotes) do
			noteData.mininote = totallyMini;
		end
	end
end



function MapNotes_ImportDataSet(extData)
	local areas, notes, clashes = 0, 0, 0;
	MapNotes_StatusPrint(MN_STARTED_IMPORTING .. "...");

	if ( type(extData) == "table" ) then
		for extKey, extNotes in pairs(extData) do
			if ( type(extNotes) == "table" ) then
				if ( not MapNotes_Data_Notes[extKey] ) then
					extKey = "WM " .. extKey;
				end
				if ( MapNotes_Data_Notes[extKey] ) then
					local nextNote = MapNotes_GetZoneTableSize( MapNotes_Data_Notes[extKey] );
					areas = areas + 1;
					
					for extNote, extDetails in pairs(extNotes) do
						local checkNearNote = MapNotes_CheckNearNotes(extKey, extDetails.xPos, extDetails.yPos);
						if ( checkNearNote ) then
							clashes = clashes + 1;

						else
							notes = notes + 1;
							nextNote = nextNote + 1;
							MapNotes_Data_Notes[extKey][nextNote] = extDetails;
						end
					end

				else
					MapNotes_StatusPrint(MN_INVALID_KEY .. extKey);
				end
			end
		end
	end

	MapNotes_StatusPrint("..." .. MN_FINISHED_IMPORTING);
	MapNotes_StatusPrint( format(MN_AREANOTES, areas, notes) );
	MapNotes_StatusPrint(clashes .. " " .. MN_DUPS_IGNORED);
end



function MN_InitialiseTextColours(setTextures)
	local textT, inf1T, inf2T;
	local colours = {};
	
	for i = 0, 9, 1 do
		textT = getglobal("MN_TextColor"..i.."Texture");
		inf1T = getglobal("MN_Info1Color"..i.."Texture");
		inf2T = getglobal("MN_Info2Color"..i.."Texture");

		if ( setTextures ) then
			textT:SetTexture("Interface\\AddOns\\MapNotes\\POIIcons\\TextColourTemplate");
			inf1T:SetTexture("Interface\\AddOns\\MapNotes\\POIIcons\\TextColourTemplate");
			inf2T:SetTexture("Interface\\AddOns\\MapNotes\\POIIcons\\TextColourTemplate");
		end

		colours = MapNotes_Colors[i];
		if ( MapNotes_Options.colourT[1][i] ) then
			colours = MapNotes_Options.colourT[1][i];
		end
		textT:SetVertexColor(colours.r, colours.g, colours.b);

		colours = MapNotes_Colors[i];
		if ( MapNotes_Options.colourT[2][i] ) then
			colours = MapNotes_Options.colourT[2][i];
		end		
		inf1T:SetVertexColor(colours.r, colours.g, colours.b);

		colours = MapNotes_Colors[i];
		if ( MapNotes_Options.colourT[3][i] ) then
			colours = MapNotes_Options.colourT[3][i];
		end
		inf2T:SetVertexColor(colours.r, colours.g, colours.b);

	end
end


function MN_SetUpColourPicker(row, id)
	local col;

	ColorPickerFrame.row = row;
	ColorPickerFrame.bttnId = id;
	ColorPickerFrame.hasOpacity = false;
	ColorPickerFrame.func = MN_AcceptColour;
	ColorPickerFrame.cancelFunc = MN_CancelColourPicker;
	if ( MapNotes_Options.colourT[row][id] ) then
		col = MapNotes_Options.colourT[row][id];
	else
		col = MapNotes_Colors[id];
	end
	ColorPickerFrame.previousValues = {col.r, col.g, col.b};
	ColorPickerFrame:SetFrameStrata("FULLSCREEN_DIALOG");
	ColorPickerFrame.opacity = 1.0;
	ColorPickerFrame:SetColorRGB(col.r, col.g, col.b);
	ColorPickerFrame:Show();
end

function MN_AcceptColour()
	local r, g, b = ColorPickerFrame:GetColorRGB();
	MN_UpdateButtonColour(ColorPickerFrame.row, ColorPickerFrame.bttnId, r, g, b);
end

function MN_CancelColourPicker(cols)
	MN_UpdateButtonColour(ColorPickerFrame.row, ColorPickerFrame.bttnId, cols[1], cols[2], cols[3]);
	ColorPickerFrame.row = nil;
	ColorPickerFrame.bttnId = nil;
end

function MN_UpdateButtonColour(row, id, r, g, b)
	MapNotes_Options.colourT[row] = {};
	MapNotes_Options.colourT[row][id] = {};
	MapNotes_Options.colourT[row][id].r = r;
	MapNotes_Options.colourT[row][id].g = g;
	MapNotes_Options.colourT[row][id].b = b;

	if ( row == 1 ) then
		getglobal("MN_TextColor"..id.."Texture"):SetVertexColor(r, g, b);
	elseif ( row == 2 ) then
		getglobal("MN_Info1Color"..id.."Texture"):SetVertexColor(r, g, b);
	elseif ( row == 3 ) then
		getglobal("MN_Info2Color"..id.."Texture"):SetVertexColor(r, g, b);
	end
end


local function EventProcessing(self, event, ...)
	if ( event == "MINIMAP_UPDATE_ZOOM" ) then
		MapNotes_MinimapUpdateZoom();

	elseif ( event == "VARIABLES_LOADED" ) then
		MapNotes_VariablesLoaded();
		MapNotes_Started = true;

	elseif ( event == "WORLD_MAP_UPDATE" ) then
		if ( ( MapNotes_Options.landMarks ) and ( MapNotes_Started ) ) then
			MapNotes_IterateLandMarks(false);
		end
		MapNotes_MapUpdate();

	elseif ( event == "CHAT_MSG_ADDON" ) then
		local arg1, arg2, arg3, arg4 = ...;
		if ( arg1 == "MapNotes_FU" ) then
			MapNotes_GetNoteFromChat(arg2, arg4);
		end
	end
end


local angleInc = 0.25;
-- %%% Fancy Mininote highlighting on the map... instead of the static blue circle background - a circling highlight would be good...
function MN_NoteUpdate(self, elapsed)
	local miniNote = getglobal(self:GetName() .. "Mininote");
	if ( miniNote:IsVisible() ) then
		self.timer = self.timer + elapsed;
		if ( self.timer > 0.05 ) then
			self.hAngle = self.hAngle - angleInc;
			self.s = sin(self.hAngle);
			self.c = cos(self.hAngle);
			miniNote:SetTexCoord(	0.5-self.s, 0.5+self.c,
									0.5+self.c, 0.5+self.s,
									0.5-self.c, 0.5-self.s,
									0.5+self.s, 0.5-self.c);
			self.timer = 0;
		end
	end
end


function MN_NoteOnEnter(note)
	local key, id = note.key, note.nid;
	local Plugin = MapNotes.pluginKeys[key];
	local loc, lLoc = MapNotes_GetMapDisplayName(key, Plugin);
	local tt = GameTooltip;
	local pFrame = note:GetParent();
	if ( pFrame == WorldMapButton ) then
		tt = WorldMapTooltip;
	end

	local x, y = note:GetCenter();
	local x2, y2 = pFrame:GetCenter();
	local anchor = "";
	if x > x2 then
		anchor = "ANCHOR_LEFT";
	else
		anchor = "ANCHOR_RIGHT";
	end
	tt:SetOwner(note, anchor);

	if ( id == 0 ) then
		if ( MapNotes_tloc_name ) then
			tt:AddLine( MapNotes_tloc_name );
		else
			tt:AddLine(MAPNOTES_THOTTBOTLOC);
		end

		if ( lLoc ) then
			tt:AddLine(lLoc, 1, 1, 1);
		end

		local x, y = MapNotes_tloc_xPos * 100, MapNotes_tloc_yPos * 100;
		local xy = string.format(MN_COORD_FS[MN_COORD_F], x, y);
		tt:AddLine(xy, 0, 1, 0);

		MN_TestTexture:SetTexture( MN_TLOC_ICON );
		local t = MN_TestTexture:GetTexture();
		if ( not t ) then
			t = MN_POI_ICONS_PATH.."\\Icontloc";
		end
		tt:AddTexture( t );
		tt:Show();

	elseif ( id == -1 ) then
		tt:AddLine(MAPNOTES_PARTYNOTE);

		if ( lLoc ) then
			tt:AddLine(lLoc, 1, 1, 1);
		end

		local x, y = MapNotes_PartyNoteData.xPos * 100, MapNotes_PartyNoteData.yPos * 100;
		local xy = string.format(MN_COORD_FS[MN_COORD_F], x, y);
		tt:AddLine(xy, 0, 1, 0);

		MN_TestTexture:SetTexture( MN_PARTY_ICON );
		local t = MN_TestTexture:GetTexture();
		if ( not t ) then
			t = MN_POI_ICONS_PATH.."\\Iconparty";
		end
		tt:AddTexture( t );
		tt:Show();
	
	else
		local noteDetails = MapNotes_Data_Notes[key][id];
		local cRef = noteDetails.ncol;
		local colours = MapNotes_Colors[cRef];
		if ( MapNotes_Options.colourT[1][cRef] ) then
			colours = MapNotes_Options.colourT[1][cRef];
		end

		tt:AddLine(noteDetails.name, colours.r, colours.g, colours.b);

		if ( ( noteDetails.inf1 ~= nil ) and ( noteDetails.inf1 ~= "" ) ) then
			cRef = noteDetails.in1c;
			colours = MapNotes_Colors[cRef];
			if ( MapNotes_Options.colourT[2][cRef] ) then
				colours = MapNotes_Options.colourT[2][cRef];
			end
			tt:AddLine(noteDetails.inf1, colours.r, colours.g, colours.b);
		end
		if ( ( noteDetails.inf2 ~= nil ) and ( noteDetails.inf2 ~= "" ) ) then
			cRef = noteDetails.in2c;
			colours = MapNotes_Colors[cRef];
			if ( MapNotes_Options.colourT[3][cRef] ) then
				colours = MapNotes_Options.colourT[3][cRef];
			end
			tt:AddLine(noteDetails.inf2, colours.r, colours.g, colours.b);
		end
		if ( ( noteDetails.creator ) and ( noteDetails.creator ~= "" ) ) then
			tt:AddDoubleLine(MAPNOTES_CREATEDBY, noteDetails.creator, 0.79, 0.69, 0.0, 0.79, 0.69, 0.0)
		end

		if ( lLoc ) then
			tt:AddLine(lLoc, 1, 1, 1);
		end

		local x, y = noteDetails.xPos * 100, noteDetails.yPos * 100;
		local xy = string.format(MN_COORD_FS[MN_COORD_F], x, y);
		tt:AddLine(xy, 0, 1, 0);

		local t = noteDetails.customIcon;
		MN_TestTexture:SetTexture(nil);
		if ( ( MNIL ) and ( t ) ) then
			MN_TestTexture:SetTexture( t );
		end
		if ( not MN_TestTexture:GetTexture() ) then
			t = MN_POI_ICONS_PATH.."\\Icon"..noteDetails.icon;
		end
		tt:AddTexture( t );

		tt:SetFrameStrata("TOOLTIP");
		tt:SetFrameLevel( note:GetFrameLevel() + 2 );
		tt:Show();
	end
end


-- Dynamic frame creation
do
	local frame = CreateFrame("Button", "MapNotes_WorldMapButton", WorldMapButton);
	frame:SetAllPoints(WorldMapButton);
	frame:RegisterForClicks("LeftButtonDown", "RightButtonDown");
	frame:SetScript("OnShow", function()
		local index = 1;
		local note = getglobal( "MapNotesPOI" .. index );
		local targetLevel = MapNotes_WorldMapButton:GetFrameLevel() + 1;

		while ( note ) do
			-- Should probably break out of here early if not Visible...			-- 29/07/2007
			note:SetFrameLevel( targetLevel );
			index = index + 1;
			note = getglobal( "MapNotesPOI" .. index );
		end

		MapNotesPOItloc:SetFrameLevel( targetLevel );		-- 29/07/2007
		MapNotesPOIparty:SetFrameLevel( targetLevel );		-- 29/07/2007
	end);
	frame:SetScript("OnClick", function()
		MapNotes_WorldMapButton_OnClick(WorldMapButton, arg1);
	end);
	frame:Hide();

	frame = CreateFrame("Frame");
	frame:CreateTexture("MN_TestTexture", "BACKGROUND");
	frame:RegisterEvent("VARIABLES_LOADED");
	frame:RegisterEvent("MINIMAP_UPDATE_ZOOM");
	frame:RegisterEvent("WORLD_MAP_UPDATE");
	frame:RegisterEvent("CHAT_MSG_ADDON");
	frame:RegisterEvent("ADDON_LOADED");
	frame:SetScript("OnEvent", EventProcessing);
	frame:SetScript("OnUpdate", MapNotes_MiniNote_OnUpdate);

	frame = CreateFrame("Frame", nil, WorldMapFrame);
	frame:SetScript("OnUpdate", MapNotes_WorldMap_OnUpdate);
	frame:SetScript("OnShow", function()
		this.oTimer = 0;
	end);

	CreateFrame("Frame", "MapNotesLinesFrame", WorldMapDetailFrame);
end


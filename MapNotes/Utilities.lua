--[[
	MapNotes: Adds a note system to the WorldMap and other AddOns that use the Plugins facility provided

	See the README file for more information.
]]

-- Generic Dialogues for getting mass delete criteria
StaticPopupDialogs["MN_DELETE_FILTER"] = {
	text = TEXT("___"),
	button1 = ACCEPT,
	button2 = CANCEL,
	hasEditBox = 1,
	maxLetters = 28,
	OnShow = function()
		getglobal(this:GetName().."Text"):SetText( MN_DELETE_TITLE_TEXT );
	end,
	OnAccept = function()
		local del = getglobal(this:GetParent():GetName().."EditBox"):GetText();
		if ( ( del ) and ( del ~= "" ) ) then
			if ( MapNotes.delFilter.type == "text" ) then
				MapNotes_DeleteNotesWithText(del, MapNotes.delFilter.key);
			elseif ( MapNotes.delFilter.type == "creator" ) then
				MapNotes_DeleteNotesByCreatorAndName(del, nil, MapNotes.delFilter.key);
			end
			this:GetParent():Hide();
		end
	end,
	EditBoxOnEnterPressed = function()
		local del = getglobal(this:GetParent():GetName().."EditBox"):GetText();
		if ( ( del ) and ( del ~= "" ) ) then
			if ( MapNotes.delFilter.type == "text" ) then
				MapNotes_DeleteNotesWithText(del, MapNotes.delFilter.key);
			elseif ( MapNotes.delFilter.type == "creator" ) then
				MapNotes_DeleteNotesByCreatorAndName(del, nil, MapNotes.delFilter.key);
			end
			this:GetParent():Hide();
		end
	end,
	EditBoxOnEscapePressed = function()
		this:GetParent():Hide();
	end,
	OnHide = function()
		MapNotes.delFilter = nil;
	end,
	timeout = 0,
	hideOnEscape = 1,
};

-- Drop Down Menu stuff

MapNotes = {};
MapNotes.dd = CreateFrame("Frame", "MapNotes_DropDown", nil, "UIDropDownMenuTemplate");
MapNotes.pluginKeys = {};
MapNotes.scaleFrames = {
		[1] = MapNotesOptionsFrame,
		[2] = MapNotesEditFrame,
		[3] = MapNotesSendFrame,
	};

local function MN_PointyPointyPointy()	-- ;P
	local text, ignore = MN_WAYPOINT, true;

	MapNotes.pointy = nil;
	MapNotes.pointyP = {};

	local Plugin = MapNotes.pluginKeys[ MapNotes.dd.key ];
	if ( ( not Plugin ) or ( Plugin.wmflag ) ) then

		local note = MapNotes_Data_Notes[MapNotes.dd.key];
		if ( note ) then
			note = note[MapNotes.dd.id];
			if ( note ) then
				if ( PointyPointy ) then		-- in development
					MapNotes.pointy = PP.Set;
					MapNotes.pointyP[1] = MapNotes.dd.key;
					MapNotes.pointyP[2] = MapNotes.dd.id;
					MapNotes.pointyP[3] = MapNotes.dd.x;
					MapNotes.pointyP[4] = MapNotes.dd.y;
					text = "PointyPointy";
					ignore = nil;

				elseif ( ( Cartographer_Waypoints ) and ( type(Cartographer_Waypoints.AddLHWaypoint) == "function" ) ) then
					MapNotes.pointy = Cartographer_Waypoints.AddLHWaypoint;
					local c, z = MapNotes_Keys[MapNotes.dd.key].c, MapNotes_Keys[MapNotes.dd.key].z;
					if ( ( c ) and ( z ) ) then
						MapNotes.pointyP[1] = Cartographer_Waypoints;
						MapNotes.pointyP[2] = c;
						MapNotes.pointyP[3] = z;
						MapNotes.pointyP[4] = MapNotes.dd.x;
						MapNotes.pointyP[5] = MapNotes.dd.y;
						MapNotes.pointyP[6] = note.name;
						text = "Cartographer: "..MN_WAYPOINT;
						ignore = nil;
					end

				elseif ( TomTom ) then
					MapNotes.pointy = TomTom.AddZWaypoint;
					local c, z = MapNotes_Keys[MapNotes.dd.key].c, MapNotes_Keys[MapNotes.dd.key].z;
					if ( ( c ) and ( z ) ) then
						MapNotes.pointyP[1] = TomTom;	-- pass 'self' as first parameter
						MapNotes.pointyP[2] = c;
						MapNotes.pointyP[3] = z;
						MapNotes.pointyP[4] = MapNotes.dd.x*100;
						MapNotes.pointyP[5] = MapNotes.dd.y*100;
						MapNotes.pointyP[6] = note.name;
						text = "TomTom: "..MN_WAYPOINT;
						ignore = nil;
					end
				end
			end
		end
	end

	return text, nil, nil, ignore;
end

local function MN_Wasted()
	if ( MapNotes_Undelete_Info.key ) then
		return;
	else
		return nil, nil, true;
	end
end

local function MN_Copied()
	if ( MapNotes.clipBoard ) then
		return;
	else
		return nil, nil, true;
	end
end

local function MN_Copy(andCut)
	-- only route is through DropDown menus and that is where the information is stored
	local note = MapNotes_Data_Notes[MapNotes.dd.key];
	if ( note ) then
		note = note[MapNotes.dd.id];
		if ( note ) then
			MapNotes.clipBoard = {};
			-- Now,
			--  we are NOT copying the specific ID; Nor are we copying the x or y value of the note - ONLY the text, colours, and icon
			--  if pasted in the future, a new ID will be assigned, and x and y will depend on where it has been pasted (needless to say the key will also be determined at that time)
			-- also going to allow the creator to change based on who is doing the pasting...
			MapNotes.clipBoard.name			= note.name;
			MapNotes.clipBoard.ncol			= note.ncol;
			MapNotes.clipBoard.inf1 		= note.inf1;
			MapNotes.clipBoard.in1c 		= note.in1c;
			MapNotes.clipBoard.inf2 		= note.inf2;
			MapNotes.clipBoard.in2c 		= note.in2c;
			MapNotes.clipBoard.icon 		= note.icon;
			MapNotes.clipBoard.mininote 	= note.mininote;
			MapNotes.clipBoard.customIcon 	= note.customIcon;

			-- if Cutting a note, then we now also need to delete it
			if ( andCut ) then
				MapNotes_DeleteNote(MapNotes.dd.id, MapNotes.dd.key);
			end
		end
	end
end

local function MN_Paste()
	if ( MapNotes.clipBoard ) then
		MapNotes_HideAll();

		local currentZone = MapNotes_Data_Notes[ MapNotes.dd.key ];

		if ( currentZone ) then
			local checknote = MapNotes_CheckNearNotes(MapNotes.dd.key, MapNotes.dd.x, MapNotes.dd.y);
			if ( checknote ) then
				MapNotes_StatusPrint(format(MAPNOTES_QUICKNOTE_NOTETONEAR, MapNotes_Data_Notes[MapNotes.dd.key][checknote].name ) );
			else
				local Plugin = MapNotes.pluginKeys[MapNotes.dd.key];
				MapNotes_TempData_Id = MapNotes_GetZoneTableSize(currentZone) + 1;

				currentZone[MapNotes_TempData_Id] = {};
				currentZone[MapNotes_TempData_Id].name			= MapNotes.clipBoard.name		
				currentZone[MapNotes_TempData_Id].ncol			= MapNotes.clipBoard.ncol		
				currentZone[MapNotes_TempData_Id].inf1			= MapNotes.clipBoard.inf1 	
				currentZone[MapNotes_TempData_Id].in1c			= MapNotes.clipBoard.in1c 	
				currentZone[MapNotes_TempData_Id].inf2			= MapNotes.clipBoard.inf2 	
				currentZone[MapNotes_TempData_Id].in2c			= MapNotes.clipBoard.in2c 	
				currentZone[MapNotes_TempData_Id].icon			= MapNotes.clipBoard.icon 	
				currentZone[MapNotes_TempData_Id].mininote		= MapNotes.clipBoard.mininote 
				currentZone[MapNotes_TempData_Id].customIcon	= MapNotes.clipBoard.customIcon
				currentZone[MapNotes_TempData_Id].xPos			= MapNotes.dd.x;
				currentZone[MapNotes_TempData_Id].yPos			= MapNotes.dd.y;
				currentZone[MapNotes_TempData_Id].creator		= UnitName("player");

				if ( Plugin ) then
					MapNotes_PlugInsDrawNotes(Plugin);
				else
					MapNotes_MapUpdate();
				end

				MapNotes_StatusPrint( format(MAPNOTES_ACCEPT_SLASH, MapNotes_GetMapDisplayName(MapNotes.dd.key, Plugin)) );
			end
		end
	end
end

local function MN_Status()
	if ( MapNotes_Options.shownotes ) then
		return MAPNOTES_SHOWNOTES, true;
	else
		return MAPNOTES_SHOWNOTES;
	end
end

MapNotes.base_dd_info = {
	-- Define level one elements here
	[1] = {
		{ -- Title
			text = MAPNOTES_NAME,
			isTitle = 1,
		},
		{ -- Create new note
			text = MAPNOTES_NEW_NOTE,
			func = function()
				MapNotesEditFrame:SetParent( MapNotes.dd.pFrame );
				MapNotes_TempData_xPos = MapNotes.dd.x;
				MapNotes_TempData_yPos = MapNotes.dd.y;
				MapNotes_TempData_Id = nil;
				MapNotesEditFrame.k = MapNotes.dd.key;
				MapNotesEditFrame.miniMe = IsControlKeyDown();
				MapNotes_OpenEditForNewNote();
			end,
			tooltipTitle = MN_TT_MINITITLE;
			tooltipText = MN_TT_MINITEXT;
		},
		{ -- QuickNote for quick creation without editing
			text = MAPNOTES_QUICKNOTE_DEFAULTNAME,
			func = function()
				local Plugin = MapNotes.pluginKeys[ MapNotes.dd.key ];
				local lNote = MapNotes_ShortCutNote(MapNotes.dd.x, MapNotes.dd.y, Plugin, IsControlKeyDown(), MapNotes.dd.key);
				if ( ( not Plugin ) or ( Plugin.wmflag ) ) then
					MapNotes_MapUpdate();
				else
					MapNotes_PlugInsDrawNotes(Plugin);
				end
				if ( lNote ) then
					lNote = getglobal( "MapNotesPOI" .. lNote );
					if ( lNote ) then
						lNote:SetFrameLevel( MapNotes.dd.pFrame:GetFrameLevel() + 1 );
					end
				end
			end,
			tooltipTitle = MN_TT_MINITITLE;
			tooltipText = MN_TT_MINITEXT;
		},
		{ -- Group Note
			text = MAPNOTES_PARTYNOTE,
			func = function()
				MapNotes_SetPartyNote(MapNotes.dd.x, MapNotes.dd.y);
				MapNotes_MapUpdate();
			end,
		},
		{ -- Special Actions
			text = MAPNOTES_SPECIAL_ACTIONS,
			hasArrow = true,
			value = "special",
		},
		{ -- Mass Delete Options
			text = MN_MDELETE,
			hasArrow = true,
			value = "delete",
		},
		{ -- Options
			text = MAPNOTES_OPTIONS,
			func = function()
				MapNotes_HideAll();
				MapNotesOptionsFrame:SetParent(MapNotes.dd.pFrame);
				local pScale = MapNotes.dd.pFrame:GetEffectiveScale();
				MapNotesOptionsFrame:SetScale( 0.8 / pScale );
				MapNotesOptionsFrame:Show();
				MapNotesOptionsFrame:SetAlpha(1);
			end,
		},
		{ -- Cancel
			text = CANCEL,
			func = function()
				HideDropDownMenu(1);
			end,
		},
	},
	[2] = {
		special = {
			{ -- Show (/Hide) All MapNotes
				dynamicFunc = MN_Status,
				func = function()
					if ( MapNotes_Options.shownotes ) then
						MapNotes_Options.shownotes = false;
					else
						MapNotes_Options.shownotes = true;
					end
					HideDropDownMenu(1);
					local Plugin = MapNotes.pluginKeys[ MapNotes.dd.key ];
					if ( ( not Plugin ) or ( Plugin.wmflag ) ) then
						MapNotes_MapUpdate();
					else
						MapNotes_PlugInsDrawNotes(Plugin);
					end
				end
			},
			{ -- Paste a Copied/Cut note
				dynamicFunc = MN_Copied,
				text = MN_PASTE,
				func = function()
					MN_Paste();
					HideDropDownMenu(1);
				end,
			},
			{ -- Undelete if possible...
				dynamicFunc = MN_Wasted,
				text = MAPNOTES_CHAT_COMMAND_UNDELETE,
				func = function()
					MapNotes_Undelete();
					HideDropDownMenu(1);
				end
			},
		},
		delete = {
			{ -- containing Text
				text = MN_TEXT,
				func = function()
					local lName = MapNotes_GetMapDisplayName(MapNotes.dd.key);
					MN_DELETE_TITLE_TEXT = MN_MDELETE .. MN_TEXT .. " (" .. lName .. ")";
					MapNotes.delFilter = {};
					MapNotes.delFilter.type = "text";
					MapNotes.delFilter.key = MapNotes.dd.key;
					StaticPopup_Show("MN_DELETE_FILTER");
					HideDropDownMenu(1);
				end,
			},
			{ -- by Creator
				text = MN_CREATOR,
				func = function()
					local lName = MapNotes_GetMapDisplayName(MapNotes.dd.key);
					MN_DELETE_TITLE_TEXT = MN_MDELETE .. MN_CREATOR .. " (" .. lName .. ")";
					MapNotes.delFilter = {};
					MapNotes.delFilter.type = "creator";
					MapNotes.delFilter.key = MapNotes.dd.key;
					StaticPopup_Show("MN_DELETE_FILTER");
					HideDropDownMenu(1);
				end,
			},
		},
	},
};

local function MN_GetMiniNoteToggleText()
	if ( string.find(MapNotes.dd.key, "^WM %a+") ) then
		if ( not MapNotes.dd.id ) then
			return nil, nil, true, nil;

		elseif ( MapNotes.dd.id == 0 ) then
			if ( MapNotes_MiniNote_Data.icon == "tloc") then
				return MAPNOTES_MININOTE_OFF;
			else
				return MAPNOTES_MININOTE_ON;
			end

		elseif ( MapNotes.dd.id == -1 ) then
			if ( MapNotes_MiniNote_Data.icon == "party") then
				return MAPNOTES_MININOTE_OFF;
			else
				return MAPNOTES_MININOTE_ON;
			end

		elseif ( MapNotes_Data_Notes[MapNotes.dd.key][MapNotes.dd.id].mininote ) then
			return MAPNOTES_MININOTE_OFF;

		else
			return MAPNOTES_MININOTE_ON;
		end

	else
		return nil, nil, nil, true;
	end
end


MapNotes.mininote_dd_info = {
	-- Define level one elements here
	[1] = {
		{ -- Title
			text = MAPNOTES_NAME,
			isTitle = 1,
		},
		{ -- Edit Note
			text = MAPNOTES_EDIT_NOTE,
			func = function()
				MapNotesEditFrame.k = MapNotes.dd.key;
				MapNotes_OpenEditForExistingNote(MapNotes.dd.key, MapNotes.dd.id);
			end,
		},
		{ -- Delete Note
			text = MAPNOTES_DELETE_NOTE,
			func = function()
				MapNotes_DeleteNote(MapNotes.dd.id, MapNotes.dd.key);
			end,
		},
		{ -- Mininote Toggle
			text = nil,
			dynamicFunc = MN_GetMiniNoteToggleText;
			func = function()
				if ( not MapNotes.dd.id ) then
					-- Doh !!!

				elseif ( MapNotes_Data_Notes[MapNotes.dd.key][MapNotes.dd.id].mininote ) then
					local note = {};
					note.key = MapNotes.dd.key
					note.id	 = MapNotes.dd.id;
					MapNotes_ClearMiniNote(nil, note);
				else
					MapNotes_SetAsMiniNote(MapNotes.dd.id);
				end
			end,
		},
		{ -- PointyPointy
			text = MN_WAYPOINT,
			dynamicFunc = MN_PointyPointyPointy;
			func = function()
				MapNotes.pointy( unpack(MapNotes.pointyP) );
			end,
		},
		{ -- Options
			text = MAPNOTES_OPTIONS,
			func = function()
				MapNotes_HideAll();
				MapNotesOptionsFrame:SetParent(MapNotes.dd.pFrame);
				local pScale = MapNotes.dd.pFrame:GetEffectiveScale();
				MapNotesOptionsFrame:SetScale( 0.8 / pScale );
				MapNotesOptionsFrame:Show();
				MapNotesOptionsFrame:SetAlpha(1);
			end,
		},
		{ -- Cancel
			text = CANCEL,
			func = function()
				HideDropDownMenu(1);
			end,
		},
	},
};

MapNotes.note_dd_info = {
	-- Define level one elements here
	[1] = {
		{ -- Title
			text = MAPNOTES_NAME,
			isTitle = 1,
		},
		{
			-- Edit Note
			text = MAPNOTES_EDIT_NOTE,
			func = function()
				MapNotesEditFrame.k = MapNotes.dd.key;
				MapNotes_OpenEditForExistingNote(MapNotes.dd.key, MapNotes.dd.id);
			end,
		},
		{
			-- Delete Note
			text = MAPNOTES_DELETE_NOTE,
			func = function()
				MapNotes_DeleteNote(MapNotes.dd.id, MapNotes.dd.key);
			end,
		},
		{ -- Mininote Toggle
			text = nil,
			dynamicFunc = MN_GetMiniNoteToggleText;
			func = function()
				if ( not MapNotes.dd.id ) then
					-- Doh !!!

				elseif ( MapNotes_Data_Notes[MapNotes.dd.key][MapNotes.dd.id].mininote ) then
					local note = {};
					note.key = MapNotes.dd.key
					note.id	 = MapNotes.dd.id;
					MapNotes_ClearMiniNote(nil, note);
				else
					MapNotes_SetAsMiniNote(MapNotes.dd.id);
				end
			end,
		},
		{ -- PointyPointy
			text = MN_WAYPOINT,
			dynamicFunc = MN_PointyPointyPointy;
			func = function()
				MapNotes.pointy( unpack(MapNotes.pointyP) );
			end,
		},
		{ -- Special Actions
			text = MAPNOTES_SPECIAL_ACTIONS,
			hasArrow = true,
			value = "special",
		},
		{ -- Send to ...
			text = MAPNOTES_SEND_NOTE;
			hasArrow = true,
			value = "send",
		},
		{ -- Options
			text = MAPNOTES_OPTIONS,
			func = function()
				MapNotes_HideAll();
				MapNotesOptionsFrame:SetParent(MapNotes.dd.pFrame);
				local pScale = MapNotes.dd.pFrame:GetEffectiveScale();
				MapNotesOptionsFrame:SetScale( 0.8 / pScale );
				MapNotesOptionsFrame:Show();
				MapNotesOptionsFrame:SetAlpha(1);
			end,
		},
		{ -- Cancel
			text = CANCEL,
			func = function()
				HideDropDownMenu(1);
			end,
		},
	},
	[2] = {
		special = {
			{ -- Cut Note
				text = MN_CUT,
				func = function()
					-- have to write this functionality
					MN_Copy(true);
					HideDropDownMenu(1);
				end,
			},
			{ -- Copy Note
				text = MN_COPY,
				func = function()
					-- have to write this functionality
					MN_Copy();
					HideDropDownMenu(1);
				end,
			},
			{ -- Draw... from/to?
				text = MAPNOTES_TOGGLELINE,
				func = function()
					MapNotes_StartGUIToggleLine(MapNotes.dd.key);
					HideDropDownMenu(1);
				end,
			},
		},
		send = {
			{	-- Whisper
				text = WHISPER .. " / " .. MAPNOTES_SEND_SLASHTITLE,
				func = function()
					MapNotesSendFrame.key = MapNotes.dd.key;
					MapNotes_ShowSendFrame(1);
					HideDropDownMenu(1);
				end,
			},
			{	-- Party
				text = PARTY,
				func = function()
					MapNotesSendFrame.key = MapNotes.dd.key;
					MapNotes_SendNote(2);
					HideDropDownMenu(1);
				end
			},
			{	-- Raid
				text = RAID,
				func = function()
					MapNotesSendFrame.key = MapNotes.dd.key;
					MapNotes_SendNote(3);
					HideDropDownMenu(1);
				end
			},
			{	-- Battleground
				text = BATTLEGROUND,
				func = function()
					MapNotesSendFrame.key = MapNotes.dd.key;
					MapNotes_SendNote(4);
					HideDropDownMenu(1);
				end
			},
			{	-- Guild
				text = GUILD,
				func = function()
					MapNotesSendFrame.key = MapNotes.dd.key;
					MapNotes_SendNote(5);
					HideDropDownMenu(1);
				end
			},
		},
	},
};

MapNotes.temp_dd_info = {
	-- Define level one elements here
	[1] = {
		{ -- Title
			text = MAPNOTES_NAME,
			isTitle = 1,
		},
		{ -- Convert to Permanent Note without opening Edit Frame... i.e. delete temporary, and create quick note(?)
			text = MN_CONVERT,
			func = function()
				local Plugin = MapNotes_DeleteNote(MapNotes.dd.id, MapNotes.dd.key, true);
				local storeN = MAPNOTES_QUICKNOTE_DEFAULTNAME;
				if ( MapNotes.dd.id == 0 ) then
					MAPNOTES_QUICKNOTE_DEFAULTNAME = tostring(MAPNOTES_THOTTBOTLOC );
				elseif ( MapNotes.dd.id == -1 ) then
					MAPNOTES_QUICKNOTE_DEFAULTNAME = tostring(MAPNOTES_PARTYNOTE);
				end

				local lNote = MapNotes_ShortCutNote(MapNotes.dd.x, MapNotes.dd.y, Plugin, true, MapNotes.dd.key);
				if ( ( not Plugin ) or ( Plugin.wmflag ) ) then
					MapNotes_MapUpdate();
				else
					MapNotes_PlugInsDrawNotes(Plugin);
				end
				if ( lNote ) then
					lNote = getglobal( "MapNotesPOI" .. lNote );
					if ( lNote ) then
						lNote:SetFrameLevel( MapNotes.dd.pFrame:GetFrameLevel() + 1 );
					end
				end

				MAPNOTES_QUICKNOTE_DEFAULTNAME = storeN;
			end,
		},
		{ -- Toggle as Mininote
			text = nil,
			dynamicFunc = MN_GetMiniNoteToggleText;
			func = function()
				if ( not MapNotes.dd.id ) then
					-- Doh !!!

				elseif ( MapNotes.dd.id == 0 ) then
					if ( MapNotes_MiniNote_Data.icon == "tloc") then
						MapNotes_ClearMiniNote(nil, "tloc");
					else
						MapNotes_SetAsMiniNote(0);
					end

				elseif ( MapNotes.dd.id == -1 ) then
					if ( MapNotes_MiniNote_Data.icon == "party") then
						MapNotes_ClearMiniNote(nil, "party");
					else
						MapNotes_SetAsMiniNote(-1);
					end
				end
			end,
		},
		{ -- PointyPointy
			text = MN_WAYPOINT,
			dynamicFunc = MN_PointyPointyPointy;
			func = function()
				MapNotes.pointy( unpack(MapNotes.pointyP) );
			end,
		},
		{ -- Delete
			text = MAPNOTES_DELETE_NOTE,
			func = function()
				MapNotes_DeleteNote(MapNotes.dd.id, MapNotes.dd.key);
			end,
		},
		{ -- Options
			text = MAPNOTES_OPTIONS,
			func = function()
				MapNotes_HideAll();
				MapNotesOptionsFrame:SetParent(MapNotes.dd.pFrame);
				local pScale = MapNotes.dd.pFrame:GetEffectiveScale();
				MapNotesOptionsFrame:SetScale( 0.8 / pScale );
				MapNotesOptionsFrame:Show();
				MapNotesOptionsFrame:SetAlpha(1);
			end,
		},
		{ -- Cancel
			text = CANCEL,
			func = function()
				HideDropDownMenu(1);
			end,
		},
	},
};

MapNotes.coords_dd_info = {
	-- Define level one elements here
	[1] = {
		{ -- Title
			text = MAPNOTES_NAME,
			isTitle = 1,
		},
		{ -- Quick Note
			text = MAPNOTES_QUICKNOTE_DEFAULTNAME,
			func = function()
				MapNotes_CreateQuickNote(nil, nil, nil, nil, IsControlKeyDown());
			end,
			tooltipTitle = MN_TT_MINITITLE;
			tooltipText = MN_TT_MINITEXT;
		},
		{ -- Target Note
			text = BINDING_NAME_MN_TARGET_NEW,
			func = function()
				MapNotes_TargetNote("");
			end,
			tooltipTitle = MN_TT_MINITITLE;
			tooltipText = MN_TT_MINITEXT;
		},
		{ -- Merge Note
			text = BINDING_NAME_MN_TARGET_MERGE,
			func = function()
				MapNotes_MergeNote("");
			end,
			tooltipTitle = MN_TT_MINITITLE;
			tooltipText = MN_TT_MINITEXT;
		},
		{ -- Undelete if possible...
			dynamicFunc = MN_Wasted,
			text = MAPNOTES_CHAT_COMMAND_UNDELETE,
			func = function()
				MapNotes_Undelete();
				HideDropDownMenu(1);
			end,
		},
		{ -- Mass Delete Options
			text = MN_MDELETE,
			hasArrow = true,
			value = "delete",
		},
		{ -- Options
			text = MAPNOTES_OPTIONS,
			func = function()
				MapNotes_HideAll();
				MapNotesOptionsFrame:SetParent(MapNotes.dd.pFrame);
				local pScale = MapNotes.dd.pFrame:GetEffectiveScale();
				MapNotesOptionsFrame:SetScale( 0.8 / pScale );
				MapNotesOptionsFrame:Show();
				MapNotesOptionsFrame:SetAlpha(1);
			end,
		},
		{ -- Cancel
			text = CANCEL,
			func = function()
				HideDropDownMenu(1);
			end,
		},
	},
	[2] = {
		delete = {
			{ -- containing Text
				text = MN_TEXT,
				func = function()
					MN_DELETE_TITLE_TEXT = MN_MDELETE .. MN_TEXT .. " (" .. MN_ALLZONES .. ")";
					MapNotes.delFilter = {};
					MapNotes.delFilter.type = "text";
					StaticPopup_Show("MN_DELETE_FILTER");
					HideDropDownMenu(1);
				end,
			},
			{ -- by Creator
				text = MN_CREATOR,
				func = function()
					MN_DELETE_TITLE_TEXT = MN_MDELETE .. MN_CREATOR .. " (" .. MN_ALLZONES .. ")";
					MapNotes.delFilter = {};
					MapNotes.delFilter.type = "creator";
					StaticPopup_Show("MN_DELETE_FILTER");
					HideDropDownMenu(1);
				end,
			},
		},
	},
};


local function MN_Init_DD(self, level)
	-- Make sure level is set to 1, if not supplied
	level = level or 1

	-- Get the current level from the info table
	local info = MapNotes.dd.info[level]

	-- If a value has been set, try to find it at the current level
	if level > 1 and UIDROPDOWNMENU_MENU_VALUE then
		if info[UIDROPDOWNMENU_MENU_VALUE] then
			info = info[UIDROPDOWNMENU_MENU_VALUE]
		end
	end

	-- Add the buttons to the menu
	for idx, entry in ipairs(info) do
		if ( entry.dynamicFunc ) then
			local text, checked, disabled, ignore = entry.dynamicFunc();
			if ( text ) then entry.text = text; end
			entry.checked = checked;
			entry.disabled = disabled;
			if ( ignore ) then entry.text = nil; end
		else
			entry.checked = nil;
		end

		if ( entry.text ) then
			UIDropDownMenu_AddButton(entry, level);
		end
	end
end

function MapNotes:InitialiseDropdown(pFrame, x, y, info, key, id)
	self.dd.pFrame = pFrame;
	self.dd.x = x;
	self.dd.y = y;
	self.dd.info = info;
	self.dd.key = key;
	self.dd.id = id;
	UIDropDownMenu_Initialize(self.dd, MN_Init_DD, "MENU");
end


-- Extract x and y coordinates from text with optional comma/space separators allowing for decimal points

function MapNotes_ExtractCoords(data)
	local tS, tE, tX, tY = string.find(data, "(%d%d?%.%d*)%.%.*(%d%d?%.%d*)");

	if ( ( not tX ) or ( not tY ) ) then
		tS, tE, tX, tY = string.find(data, "(%d%d?%.?%d*)[^0-9^%.]+%.*[^0-9^%.]*(%d%d?%.?%d*)");
	end

	if ( ( not tX ) and ( not tY ) ) then
		tS, tE, tX, tY = string.find(data, "(%d%d?)%.+(%d%d?)");
	end

	if ( ( tX ) and ( tY ) ) then
		tX = tonumber(tX);
		tY = tonumber(tY);
	end

	if ( ( tX ) and ( tY ) ) then
		local restText = string.sub(data, tE+1);
		if ( not restText ) then
			restText = "";
		end
		local msgStart = string.find(restText, "%S");
		if ( ( msgStart ) and ( msgStart < string.len(restText) ) ) then
			restText = string.sub(restText, msgStart);
		end
		return tX, tY, restText;
	end

	MapNotes_StatusPrint(MAPNOTES_COORDINATE_FORMATTING_ERROR1);
	MapNotes_StatusPrint(MAPNOTES_COORDINATE_FORMATTING_ERROR2);
	MapNotes_StatusPrint(MAPNOTES_COORDINATE_FORMATTING_ERROR3);
	return nil, nil, nil;
end


-- Telic_1 Functions

function MapNotes_GetAdjustedMapXY(lclFrame, x, y)
	local normalisingFactor = MN_DEFAULT_SCALE;
	if ( ( MapNotes_Options ) and ( MapNotes_Options.nFactor ) ) then
		normalisingFactor = MapNotes_Options.nFactor;
	end
	local eScale = 1 / (normalisingFactor / lclFrame:GetEffectiveScale());
	local xAdjustment, yAdjustment = 125, 60;
	local width = lclFrame:GetWidth() * eScale;
	local height = lclFrame:GetHeight() * eScale;
	local adjustedX, adjustedY = x, y;

	if ( not x ) then
		adjustedX, adjustedY = MapNotes_GetMouseXY(lclFrame);
	end

	local xOff, yOff = 0, 0;
	if ( adjustedX < 0.5 ) then
		xOff = xAdjustment;
	else
		xOff = -(xAdjustment);
	end
	if ( adjustedY < 0.5 ) then
		yOff = -(yAdjustment);
	else
		yOff = yAdjustment;
	end

	adjustedX = math.floor( ( (width*adjustedX) + xOff ) );
	adjustedY = math.floor( ( -(height*adjustedY) + yOff) );

	return adjustedX, adjustedY;
end

function MapNotes_GetMouseXY(lclFrame)
	local width = lclFrame:GetWidth();
	local height = lclFrame:GetHeight();
	local x, y = GetCursorPosition();
	x = x / (lclFrame:GetEffectiveScale());
	y = y / (lclFrame:GetEffectiveScale());
	local centerX, centerY = lclFrame:GetCenter();
	x = (x - (centerX - (width/2))) / width;
	y = (centerY + (height/2) - y ) / height;

	return x, y;
end



function MapNotes_NormaliseScale(theFrame, toScale)
	local normalisingFactor = MN_DEFAULT_SCALE;
	if ( ( MapNotes_Options ) and ( MapNotes_Options.nFactor ) ) then
		normalisingFactor = MapNotes_Options.nFactor;
	end
	local anchorFrame = theFrame:GetParent();
	if ( anchorFrame ) then
		if ( not toScale ) then
			toScale = normalisingFactor;
		end
		local eScale = anchorFrame:GetEffectiveScale();
		eScale =  toScale / eScale;
		theFrame:SetScale( eScale );
		return eScale;
	end
end



-- Telic_2 Functions

-- Probably need the ability to create Note Buttons for each AddOn that wants them
--  as won't be able to show MapNotes on the World map and Alpha Map at the same time
--  if they are trying to display the exact same XML components...
-- If Plugin is left nil, then this function can be called to generate the default MapNotes POI buttons
--  Could therefore be used to create them dynamically as needed instead of having a fixed maximum...
function MapNotes_AssignPOI(index, Plugin)
	local POI;

	if ( Plugin ) then
		local lclFrame = getglobal(Plugin.frame);
		POI = getglobal( (Plugin.frame) .. "POI" .. index );

		if ( not POI ) then
			POI = CreateFrame("Button", (Plugin.frame) .. "POI" .. index, lclFrame, "MapNotesPOIButtonTemplate");
			POI:SetID(index);
		end

		POI.Plugin = Plugin;		-- Associate Plugin Data with each Note (nil for original WorldMap Notes)
									-- Useful for distinguishing between types of note; Also, useful for
									--  other AddOns that want to remain compatible (i.e. NotesUNeed)

	else
		local lclFrame = getglobal("WorldMapButton");
		POI = getglobal( "MapNotesPOI" .. index );

		if ( not POI ) then
			POI = CreateFrame("Button", "MapNotesPOI" .. index, WorldMapButton, "MapNotesPOIButtonTemplate");
			POI:SetID(index);
		end

		POI.Plugin = nil;		-- Just to be explicit
	end
	
	return POI;
end

function MapNotes_AssignLine(index, Plugin)
	local Line;

	if ( Plugin ) then
		local lclFrame = getglobal( (Plugin.frame) .. "_MNLinesFrame" );
		Line = getglobal( lclFrame:GetName() .. "Lines_" .. index );
		if ( not Line ) then
			Line = lclFrame:CreateTexture( (lclFrame:GetName() .. "Lines_" .. index), "ARTWORK" );
		end

	else
		Line = getglobal("MapNotesLines_"..index);
		if ( not Line ) then
			Line = MapNotesLinesFrame:CreateTexture( ("MapNotesLines_"..index), "ARTWORK");
		end
	end

	return Line;
end




-- Telic_10 Functions
-------------------------------------------------------------------------------------------------
-- Make MapNotes independant of Localisation (ZoneShifting) Errors
-- (i.e. future proofed. It doesn't fix errors already present in the notes when upgrading.)
-------------------------------------------------------------------------------------------------

MapNotes_Keys = {};			-- MapNotes Keys with Localised name details
MapNotes_OldKeys = {};		-- Mapping of old [Continent][Zone] to New Key values (for this localisation)
MapNotes_MetaKeys = {};		-- Mapping of MetaMaps new (but still not global?) Map Keys

-- Basically adding Localised names to the the 'constants' now used as note keys
function MapNotes_LoadMapData()

	MapNotes_BuildKeyList();		-- Other Addons that want to use the same keys should look here

	if ( not MapNotes_Data_Notes ) then
		MapNotes_Data_Notes = {};
	end
	if ( not MapNotes_Data_Lines ) then
		MapNotes_Data_Lines = {};
	end
	if ( not MapNotes_Undelete_Info ) then
		MapNotes_Undelete_Info = {};
	end

	for mapName, mapObject in pairs(MapNotes_Keys) do
		if ( not MapNotes_Data_Notes[ mapName ] ) then
			MapNotes_Data_Notes[ mapName ] = {};
		end
		if ( not MapNotes_Data_Lines[ mapName ] ) then
			MapNotes_Data_Lines[ mapName ] = {};
		end
	end

	if ( not MapNotes_Options.Edition ) then
		MapNotes_Options.Edition = MAPNOTES_EDITION;
	end
	MapNotes_Options.Version = MAPNOTES_VERSION;
end

--Other Addons that want to use the same keys should look here
--World Map Keys are basically  "WM "..GetMapInfo()
--Localised names are all fetched from game info, except for Battlegrounds - these need to be provided in the localisation files
function MapNotes_BuildKeyList()
	local continentNames = { GetMapContinents() };

	local key = "WM Cosmic";			-- Burning Crusade Support
	MapNotes_Keys[key] = {};
	MapNotes_Keys[key].name = MAPNOTES_COSMIC;
	MapNotes_Keys[key].longName = MAPNOTES_COSMIC;
	MapNotes_Keys[key].c = -1;

	local key = "WM WorldMap";			-- Manually set when GetMapInfo() returns nil
	MapNotes_Keys[key] = {};
	MapNotes_Keys[key].name = WORLD_MAP;		-- Blizzard provided constant
	MapNotes_Keys[key].longName = WORLD_MAP;
	MapNotes_Keys[key].c = 0;

	key = "WM AlteracValley";
	MapNotes_Keys[key] = {};
	MapNotes_Keys[key].miniData = MAPNOTES_BASEKEYS[key].miniData;
	MapNotes_Keys[key].name = MAPNOTES_ALTERACVALLEY;
	MapNotes_Keys[key].longName = MAPNOTES_ALTERACVALLEY;

	key = "WM ArathiBasin";
	MapNotes_Keys[key] = {};
	MapNotes_Keys[key].miniData = MAPNOTES_BASEKEYS[key].miniData;
	MapNotes_Keys[key].name = MAPNOTES_ARATHIBASIN;
	MapNotes_Keys[key].longName = MAPNOTES_ARATHIBASIN;

	key = "WM WarsongGulch";
	MapNotes_Keys[key] = {};
	MapNotes_Keys[key].miniData = MAPNOTES_BASEKEYS[key].miniData;
	MapNotes_Keys[key].name = MAPNOTES_WARSONGGULCH;
	MapNotes_Keys[key].longName = MAPNOTES_WARSONGGULCH;

	key = "WM NetherstormArena";
	MapNotes_Keys[key] = {};
	MapNotes_Keys[key].miniData = MAPNOTES_BASEKEYS[key].miniData;
	MapNotes_Keys[key].name = MAPNOTES_NETHERSTORM;
	MapNotes_Keys[key].longName = MAPNOTES_NETHERSTORM;

	key = "WM StrandoftheAncients";
	MapNotes_Keys[key] = {};
	MapNotes_Keys[key].miniData = MAPNOTES_BASEKEYS[key].miniData;
	MapNotes_Keys[key].name = MAPNOTES_SOTA;
	MapNotes_Keys[key].longName = MAPNOTES_SOTA;

	key = "WM ScarletEnclave";
	MapNotes_Keys[key] = {};
	MapNotes_Keys[key].miniData = MAPNOTES_BASEKEYS[key].miniData;
	MapNotes_Keys[key].name = MAPNOTES_SCARLETENCLAVE;
	MapNotes_Keys[key].longName = MAPNOTES_SCARLETENCLAVE;

	for i in ipairs(continentNames) do
		SetMapZoom(i);
		local map = GetMapInfo();
		map = "WM "..map;
		if ( not MapNotes_Keys[map] ) then
			MapNotes_Keys[map] = {};
		end
		MapNotes_Keys[map].name = continentNames[i];
		MapNotes_Keys[map].longName = continentNames[i];
		MapNotes_Keys[map].c = i;

		if ( not MapNotes_OldKeys[i] ) then
			MapNotes_OldKeys[i] = {};
		end

		local zoneNames = { GetMapZones(i) };
		local dL;
		local floored = {};
		for j in ipairs(zoneNames) do
			SetMapZoom(i, j);
			map = GetMapInfo();
			dL = GetNumDungeonMapLevels();
			if ( dL > 0 ) then
				floored[map] = {};
				floored[map].floors = dL;
				floored[map].c = i;
				floored[map].z = j;
			else
				map = "WM "..map;
				if ( not MapNotes_Keys[map] ) then
					MapNotes_Keys[map] = {};
				end
				if ( ( MAPNOTES_BASEKEYS[map] ) and ( MAPNOTES_BASEKEYS[map].miniData ) ) then
					MapNotes_Keys[map].miniData = MAPNOTES_BASEKEYS[map].miniData;
				else
					MapNotes_Keys[map].miniData = MAPNOTES_DEFAULT_MINIDATA;
				end
				MapNotes_Keys[map].name = zoneNames[j];
				MapNotes_Keys[map].longName = continentNames[i].." - "..zoneNames[j];
				MapNotes_Keys[map].c = i;
				MapNotes_Keys[map].z = j;

				if ( not MapNotes_OldKeys[i][j] ) then
					MapNotes_OldKeys[i][j] = map;
				end

				if ( MetaMap_ZoneIDToName ) then
					local metaKey = MetaMap_ZoneIDToName(i, j);
					if ( metaKey ) then
						MapNotes_MetaKeys[metaKey] = map;
					end
				end
			end

			for map, floorDetails in pairs(floored) do
				local floorname, key;
				local mapTmp = strupper(map);
				for floor=1, floorDetails.floors do
					floorname = getglobal("DUNGEON_FLOOR_" .. mapTmp .. floor);
					key = "WM " .. map .. floor;
					if ( not MapNotes_Keys[key] ) then
						MapNotes_Keys[key] = {};
					end
					if ( ( MAPNOTES_BASEKEYS[key] ) and ( MAPNOTES_BASEKEYS[key].miniData ) ) then
						MapNotes_Keys[key].miniData = MAPNOTES_BASEKEYS[key].miniData;
					else
						MapNotes_Keys[key].miniData = MAPNOTES_DEFAULT_MINIDATA;
					end
					MapNotes_Keys[key].name = zoneNames[j] .. ": " .. floorname;
					MapNotes_Keys[key].longName = continentNames[i].." - "..zoneNames[j] .. ": " .. floorname;
					MapNotes_Keys[key].c = floorDetails.c;
					MapNotes_Keys[key].z = floorDetails.z;
					MapNotes_Keys[key].f = floor;

					if ( not MapNotes_OldKeys[i][j] ) then
						MapNotes_OldKeys[i][j] = map;
					end

				end
			end
		end
	end
end



function MapNotes_GetMapKey()
	local map = GetMapInfo();
	local dL = GetCurrentMapDungeonLevel();

	if ( not map ) then
		if ( GetCurrentMapContinent() == WORLDMAP_COSMIC_ID ) then
			map = "Cosmic";
		else
			map = "WorldMap";
		end
	end

	if ( dL > 0 ) then
		map = "WM "..map..dL;
	else
		map = "WM "..map;
	end

	return map;
end


function MapNotes_GetMapDisplayName(key, Plugin)
	if ( not Plugin ) then
		Plugin = MapNotes.pluginKeys[key];
	end

	if ( Plugin ) then
		if ( Plugin.lclFnc ) then
			local subber = Plugin.name .. " ";
			local basicKey, subbed = string.gsub(key, subber, "");
			if ( ( basicKey ) and ( subbed ) and ( subbed > 0 ) ) then
				local localiser = getglobal(Plugin.lclFnc);
				if ( ( localiser ) and ( type(localiser) == "function" ) ) then
					local name = localiser(basicKey);
					if ( name ) then
						lName = Plugin.name .. " - " .. name;
						return name, lName, Plugin.name;
					end
				end
			end
		end

	else
		if ( MapNotes_Keys[key] ) then
			return MapNotes_Keys[key].name, MapNotes_Keys[key].longName, WORLD_MAP;
		end
	end

	return tostring(key), tostring(key), "?";	-- Allow for no Localised Name data (i.e. at least don't return nil and cause a crash)
end


-------------------------------------------------------------------------------------------------
-- Scaling functions for note
-------------------------------------------------------------------------------------------------

local MN_SCALE_MIN = 0.65;
local MN_SCALE_MAX = 1.2;

function MN_ScaleMe(self, minum, maxum, dflt)
	local gScale = UIParent:GetScale();
	local lScale = self:GetParent():GetScale();
	local eScale = self:GetParent():GetEffectiveScale();

	if ( not minum ) then
		minum = MN_SCALE_MIN;
	end
	if ( not maxum ) then
		maxum = MN_SCALE_MAX;
	end
	if ( not dflt ) then
		dflt = 1;
	end

	eScale = eScale * dflt;

	if ( eScale < minum ) then
		return ( ( minum / gScale ) / lScale );
	elseif ( eScale > maxum ) then
		return ( ( maxum / gScale ) / lScale );
	end

	return dflt;
end


-- Telic_4 Functions
-------------------------------------------------------------------------------------------------
-- Import from other Noting AddOns
--  NOTE : Not Importing any "Lines" at the moment...
-------------------------------------------------------------------------------------------------

-- METAMAP IMPORT

local numberImported;

function MapNotes_ImportMetaMap()
	local key;

	numberImported = 0;
	if ( MetaMap_Notes ) then
		for index, records in pairs(MetaMap_Notes) do
			if ( index == METAMAP_WARSONGGULCH ) then
				key = "WM WarsongGulch";
				if ( not MapNotes_Data_Notes[key] ) then
					MapNotes_Data_Notes[key] = {};
					MapNotes_Data_Lines[key] = {};
				end
				MapNotes_ImportZoneNotes(records, MapNotes_Data_Notes[key]);

			elseif ( index == METAMAP_ALTERACVALLEY ) then
				key = "WM AlteracValley";
				if ( not MapNotes_Data_Notes[key] ) then
					MapNotes_Data_Notes[key] = {};
					MapNotes_Data_Lines[key] = {};
				end
				MapNotes_ImportZoneNotes(records, MapNotes_Data_Notes[key]);

			elseif ( index == METAMAP_ARATHIBASIN ) then
				key = "WM ArathiBasin";
				if ( not MapNotes_Data_Notes[key] ) then
					MapNotes_Data_Notes[key] = {};
					MapNotes_Data_Lines[key] = {};
				end
				MapNotes_ImportZoneNotes(records, MapNotes_Data_Notes[key]);

--			elseif 	-- MetaMap Instances
				-- Nowhere to display Instance notes in basic version of MapNotes
				-- (Can import AlphaMap's Instance notes and use alongside AlphaMap)

			elseif ( MapNotes_MetaKeys[index] ) then
				local key = MapNotes_MetaKeys[index];
				if ( not MapNotes_Data_Notes[key] ) then
					MapNotes_Data_Notes[key] = {};
					MapNotes_Data_Lines[key] = {};
				end
				MapNotes_ImportZoneNotes(records, MapNotes_Data_Notes[key]);
			end
		end
	end

	MapNotes_StatusPrint(numberImported..MAPNOTES_IMPORT_REPORT);
end

function MapNotes_ImportZoneNotes(sourceData, targetData)
	for index, record in ipairs(sourceData) do
		targetData[index] = sourceData[index];
		numberImported = numberImported + 1;
	end
end




-- ALPHAMAP IMPORT

function MapNotes_ImportAlphaMap(bgOnly)
	local key;
	numberImported = 0;

	if ( AM_ALPHAMAP_LIST ) then
		for index, map in pairs(AM_ALPHAMAP_LIST) do
			if ( ( ( bgOnly == "OnlyBGs" ) and ( map.type == AM_TYP_BG ) ) or ( ( bgOnly ~= "OnlyBGs" ) and ( map.type ~= AM_TYP_BG ) ) ) then
				local key = "AlphaMap "..(map.filename);
				if ( not MapNotes_Data_Notes[key] ) then
					MapNotes_Data_Notes[key] = {};
					MapNotes_Data_Lines[key] = {};
				end
				local targetData = MapNotes_Data_Notes[key];
				local index = 0;

				table.sort(map);
				for detailName, details in pairs(map) do
					if ( ( type(details) == "table" ) and ( details.coords ) ) then
						for point, coordinates in ipairs(details.coords) do
							numberImported = numberImported + 1;
							index = index + 1;
							local imported = MapNotes_CreateAlphaNote(details, targetData, index, coordinates);
							if ( not imported ) then
								numberImported = numberImported - 1;
								index = index - 1;
							end
						end
					end
				end
			end
		end
	end

	MapNotes_StatusPrint(numberImported..MAPNOTES_IMPORT_REPORT);
end

function MapNotes_ImportAlphaMapBG()
	MapNotes_ImportAlphaMap("OnlyBGs");
end

function MapNotes_CreateAlphaNote(noteDetails, targetData, index, coords)
	if ( ( coords[1] == 0 ) and ( coords[2] == 0 ) ) then
		return nil;
	end

	targetData[index] = {};
	targetData[index].name = noteDetails.text;
	targetData[index].inf1 = noteDetails.tooltiptxt;
	if ( noteDetails.special ) then
		targetData[index].inf2 = noteDetails.special;
	else
		targetData[index].inf2 = "";
	end
	targetData[index].creator = "AlphaMap";
	targetData[index].xPos = coords[1] / 100;
	targetData[index].yPos = coords[2] / 100;
	targetData[index].in2c = 8;

	if ( noteDetails.colour == AM_RED ) then
		targetData[index].icon = 6;
		targetData[index].ncol = 2;
		targetData[index].in1c = 0;

	elseif ( noteDetails.colour == AM_GREEN ) then
		targetData[index].icon = 0;
		targetData[index].ncol = 4;
		targetData[index].in1c = 0;

	elseif ( noteDetails.colour == AM_BLUE ) then
		targetData[index].icon = 2;
		targetData[index].ncol = 6;
		targetData[index].in1c = 0;

	elseif ( noteDetails.colour == AM_GOLD ) then
		targetData[index].icon = 0;
		targetData[index].ncol = 0;
		targetData[index].in1c = 0;

	elseif ( noteDetails.colour == AM_PURPLE ) then
		targetData[index].icon = 7;
		targetData[index].ncol = 7;
		targetData[index].in1c = 7;

	elseif ( noteDetails.colour == AM_ORANGE ) then
		targetData[index].icon = 5;
		targetData[index].ncol = 1;
		targetData[index].in1c = 1;

	elseif ( noteDetails.colour == AM_YELLOW ) then
		targetData[index].icon = 5;
		targetData[index].ncol = 0;
		targetData[index].in1c = 0;
	end

	-- For possible Future Development
	if ( noteDetails.lootid ) then
		targetData[index].lootid = noteDetails.lootid;
	end

	return true;
end

-- /script MapNotes_ImportCarto()
-- Wibble
function MapNotes_ImportCarto()

	local rIcons = {};
	local rIconsIndex = 0;

	local colours = {
		[16771840] = 0,
		[16421120] = 1,
		[16727339] = 2,
		[16752278] = 3,
		[717312] = 4,
		[45568] = 5,
		[65535] = 6,
		[46591] = 7,
		[99999] = 8,
		[13421772] = 9,
	};

	local icons = {
		["Moon"]		= 1,
		["Skull"]		= 2,
		["Square"]		= 3,
		["Cross"]		= 4,
		["Triangle"]	= 5,
		["Circle"]		= 6,
		["Diamond"]		= 7,
		["Star"]		= 8,
	};

	local cIcons = {
		["Moon"]		= "Interface\\AddOns\\MapNotesIconLib\\Icons\\Blizzard\\RaidCrescentMoon",
		["Skull"]		= "Interface\\AddOns\\MapNotesIconLib\\Icons\\Blizzard\\RaidSkull",
		["Square"]		= "Interface\\AddOns\\MapNotesIconLib\\Icons\\Blizzard\\RaidBlueSquared",
		["Cross"]		= "Interface\\AddOns\\MapNotesIconLib\\Icons\\Blizzard\\RaidRedCross",
		["Triangle"]	= "Interface\\AddOns\\MapNotesIconLib\\Icons\\Blizzard\\RaidGreenTriangle",
		["Circle"]		= "Interface\\AddOns\\MapNotesIconLib\\Icons\\Blizzard\\RaidOrangeCircle",
		["Diamond"]		= "Interface\\AddOns\\MapNotesIconLib\\Icons\\Blizzard\\RaidPurpleDiamond",
		["Star"]		= "Interface\\AddOns\\MapNotesIconLib\\Icons\\Blizzard\\RaidYellowStarDiamond",
	};

	local cNotes = CartographerDB.namespaces.Notes.account.pois;
	local currentZone, nNote;
	local count = 0;

	for locale, lNotes in pairs(cNotes) do
		-- get key from locale
		currentZone = nil;

		for key, data in pairs(MapNotes_Keys) do
			if ( data.name == locale ) then
				currentZone = MapNotes_Data_Notes[key];
				if ( currentZone ) then
					break;
				end
			end
		end

		if ( not currentZone ) then
			currentZone = MapNotes_Data_Notes[locale];
		end

		if ( currentZone ) then
			for id, details in pairs(lNotes) do
				nNote = {};
				nNote.xPos, nNote.yPos = ( (id % 10001)/10000), ( math.floor(id / 10001)/10000 );
				nNote.name = ( details.title or "" );
				nNote.ncol = 8;
				if ( ( details.titleCol ) and ( colours[details.titleCol] ) ) then
					nNote.nol = colours[details.titleCol];
				end
				nNote.inf1 = ( details.info or "" );
				nNote.in1c = 4;
				if ( ( details.infoCol ) and ( colours[details.infoCol] ) ) then
					nNote.in1c = colours[details.infoCol];
				end
				nNote.inf2 = ( details.info2 or "" );
				nNote.in2c = 0;
				if ( ( details.info2Col ) and ( colours[details.info2Col] ) ) then
					nNote.in2c = colours[details.info2Col];
				end
				nNote.creator = ( details.creator or "Cartographer" );
				if ( icons[details.icon] ) then
					nNote.icon = icons[details.icon];
				else
					if ( not rIcons[details.icon] ) then
						rIcons[details.icon] = rIconsIndex;
						rIconsIndex = rIconsIndex + 1;
						if ( rIconsIndex > 9 ) then
							rIconsIndex = 0;
						end
					end
					nNote.icon = rIcons[details.icon];
				end
				nNote.customIcon = ( cIcons[details.icon] or "" );

				table.insert( currentZone, nNote );
				count = count + 1;
			end
		end
	end

	MapNotes_StatusPrint(count..MAPNOTES_IMPORT_REPORT);
end


-- CTMapMod

function MapNotes_ImportCTMap()
	numberImported = 0;

	if ( CT_UserMap_Notes ) then
		for mnKey, values in pairs(MapNotes_Keys) do
			local ctKey = values.name;
			local mnIndex = 0;

			if ( CT_UserMap_Notes[ctKey] ) then
				for ctNoteIndex, ctNote in ipairs(CT_UserMap_Notes[ctKey]) do
					if ( ctNote.set < 7 ) then
						mnIndex = mnIndex + 1;
						numberImported = numberImported + 1;
						local targetData = MapNotes_Data_Notes[mnKey];
						MapNotes_CreateCTNote(ctNote, targetData, mnIndex);
					end
				end
			end
		end
	end

	MapNotes_StatusPrint(numberImported..MAPNOTES_IMPORT_REPORT);
end

function MapNotes_CreateCTNote(noteDetails, targetData, index)
	targetData[index] = {};
	targetData[index].name = noteDetails.name;
	targetData[index].inf1 = noteDetails.descript;
	targetData[index].inf2 = "";
	targetData[index].creator = "CTMapMod";
	targetData[index].xPos = noteDetails.x;
	targetData[index].yPos = noteDetails.y;
	targetData[index].in2c = 0;

	if ( noteDetails.set == 1 ) then
		targetData[index].icon = 0;
		targetData[index].ncol = 0;
		targetData[index].in1c = 0;

	elseif ( noteDetails.set == 2 ) then
		targetData[index].icon = 2;
		targetData[index].ncol = 7;
		targetData[index].in1c = 7;

	elseif ( noteDetails.set == 3 ) then
		targetData[index].icon = 1;
		targetData[index].ncol = 2;
		targetData[index].in1c = 2;

	elseif ( noteDetails.set == 4 ) then
		targetData[index].icon = 4;
		targetData[index].ncol = 8;
		targetData[index].in1c = 8;

	elseif ( noteDetails.set == 5 ) then
		targetData[index].icon = 3;
		targetData[index].ncol = 4;
		targetData[index].in1c = 4;

	elseif ( noteDetails.set == 6 ) then
		targetData[index].icon = 6;
		targetData[index].ncol = 3;
		targetData[index].in1c = 3;
	end
end



-- Data Fix for people who have gaps in notes, making it seem as though many notes are missing

function MN_DataCheck(report)
	MapNotes_Data_Notes = MN_DataCheck_Sort(MapNotes_Data_Notes, report);
	MapNotes_Data_Lines = MN_DataCheck_Sort(MapNotes_Data_Lines, report);
end

function MN_DataCheck_Sort(data, report)
	local holdingArray, errors = {}, 0;
	if ( report ) then
		report = 0;
	end
	
	for key, notes in pairs(data) do
		holdingArray[key] = {};
		local counter = 0;
		for note, details in pairs(notes) do
			if ( details.name ) then
				if ( not details.icon ) then
					errors = errors + 1;
					details.icon = 0;
				end
				if ( not details.inf1 ) then
					errors = errors + 1;
					details.inf1 = "";
				end
				if ( not details.inf2 ) then
					errors = errors + 1;
					details.inf2 = "";
				end
				if ( not details.xPos ) then
					errors = errors + 1;
					details.xPos = 0;
				end
				if ( not details.yPos ) then
					errors = errors + 1;
					details.yPos = 0;
				end
			end
			counter = counter + 1;
			holdingArray[key][counter] = details;
		end
		if ( report ) then
			report = report + counter;
		end
	end

	if ( report ) then
		DEFAULT_CHAT_FRAME:AddMessage("MapNotes -> "..report, 0.9, 0.1, 0.1);
	end
	if ( errors > 0 ) then
		DEFAULT_CHAT_FRAME:AddMessage("MapNotes -> |cffff0000"..errors.."|r Errors Self Corrected", 0.9, 0.1, 0.1);
	end

	return holdingArray;
end



-- Temporary include a fix function for Stormwind map adjustments
function Stormwindy()
	local x, y;
	local moved = 0;

	for i, n in ipairs(MapNotes_Data_Notes["WM Stormwind"]) do
		x = n.xPos*.76+.203;
		if ( x > 0.9999 ) then x = 0.9999; end
		y = n.yPos*.76+.253;
		if ( y > 0.9999 ) then y = 0.9999; end

		n.xPos = x;
		n.yPos = y;
		moved = moved + 1;
	end

	DEFAULT_CHAT_FRAME:AddMessage("MapNotes -> "..moved, 0.9, 0.1, 0.1);
	MapNotes_WorldMapButton_OnUpdate();
end

function MN_IntegrityCheck()
	local totNotes, totFixed = 0, 0;

	for key, notes in pairs(MapNotes_Data_Notes) do
		for note, details in ipairs(notes) do
			totNotes = totNotes + 1;
			if ( type(details.inf1) == "table" ) then
				details.inf1 = "";
				totFixed = totFixed + 1;
			end
		end
	end

	MapNotes_mntloc();

	DEFAULT_CHAT_FRAME:AddMessage("MapNotes -> "..totFixed, 0.9, 0.1, 0.1);
end




MNB_VERSION = "v1.00.30000";

MNB = {};
MNB.mode = "WM";	-- default World Map mode

MNB_List = {};

local browserInsert = {
	text = MNB_NAME,
	func = function()
		local pFrame = WorldMapButton;
		MNB.mode = "WM";
		pFrame = MapNotes.dd.pFrame;
		local Plugin = MapNotes.pluginKeys[ MapNotes.dd.key ];
		if ( ( Plugin ) and ( not Plugin.wmflag ) ) then
			MNB.mode = Plugin.name;
		end
		MNB_Browser:SetParent( pFrame );
		MNB_Browser:SetAlpha(1);
		MNB_Browser:Show();
		MapNotes_ScaleFrames();
		MNB.PopulateScroll(Plugin);
	end,
};

-- Main event processor
function MNB.ProcessEvents(self, event, ...)
	if ( event == "VARIABLES_LOADED" ) then
		local msg = "MapNotesBrowser |c0000FF00"..MNB_VERSION.."|r";
		DEFAULT_CHAT_FRAME:AddMessage(msg, 0.64, 0.21, 0.93);

		-- set hooks
		MNB.Ori_MapNotes_WorldMapButton_OnUpdate = MapNotes_WorldMapButton_OnUpdate;
		MapNotes_WorldMapButton_OnUpdate = MNB.New_MapNotes_WorldMapButton_OnUpdate;
		MNB.Ori_MapNotes_PlugInsDrawNotes = MapNotes_PlugInsDrawNotes;
		MapNotes_PlugInsDrawNotes = MNB.New_MapNotes_PlugInsDrawNotes;
		MNB.Ori_MapNotes_WriteNote = MapNotes_WriteNote;
		MapNotes_WriteNote = MNB.New_MapNotes_WriteNote;

		-- insert the Browse option in to the MapNotes right click menu
		table.insert(MapNotes.base_dd_info[1], #(MapNotes.base_dd_info[1]), browserInsert);

		-- insert an entry in the MapNotes frames array to be scaled in line with other MapNotes frames
		table.insert(MapNotes.scaleFrames, MNB_Browser);

		-- initialise the PointyPointy
		MNB_PointyPointy.timer = 0;
		MNB_PointyPointy.hAngle = 0;
		MNB_PointyPointy:SetScript("OnUpdate", MNB.PointyUpdate);
	end
end


local function ShowPointy()
	local frame = MNB_PointyPointy.frame;
	local scalingFactor = MN_ScaleMe(frame);
	MNB_PointyPointy:SetScale( scalingFactor );
	local x = MNB_PointyPointy.x * frame:GetWidth() / scalingFactor;
	local y = -MNB_PointyPointy.y * frame:GetHeight() / scalingFactor;
	MNB_PointyPointy:ClearAllPoints();
	MNB_PointyPointy:SetParent( frame );
	MNB_PointyPointy:SetPoint("CENTER", frame:GetName(), "TOPLEFT", x, y);
	MNB_PointyPointy.timer = 0;
	MNB_PointyPointy:Show();
end

-- scroll button OnEnter
function MNB.ScrollButton_OnEnter(self)
	MN_NoteOnEnter(self);						-- trigger display of standard MapNotes tooltip

	local frame = self.pluginFrame;
	if ( not frame ) then 
		frame = MNB_Browser:GetParent();
	end
	local key = frame.key or MapNotes_GetMapKey();

	if ( ( frame:IsVisible() ) and ( self.key == key ) ) then		-- display special pointer on map
		if ( not MNB_PointyPointy.fixed ) then
			MNB_PointyPointy.frame = frame;
			MNB_PointyPointy.x = self.xPos;
			MNB_PointyPointy.y = self.yPos;
			ShowPointy();
		end
	end
end

-- scroll button OnClick
function MNB.ScrollButton_OnClick(self, mouseButton)
	HideDropDownMenu(1);
	if ( self.heading ) then return; end
	if ( mouseButton == "LeftButton" ) then
		local key = self.key;
		local nid = self.nid;
		local frame = self.pluginFrame;
		if ( not frame ) then 
			frame = MNB_Browser:GetParent();
		end
		local frameKey = frame.key or MapNotes_GetMapKey();

		local fixPointy;
		if ( not MNB_PointyPointy.fixed ) then
			MNB_PointyPointy.fixed = {};
			fixPointy = true;

		elseif ( ( MNB_PointyPointy.fixed.key == key ) and ( MNB_PointyPointy.fixed.nid == nid ) ) then
			MNB_PointyPointy.fixed = nil;
			MNB_MarkerButton:Hide();

		else
			fixPointy = true;
		end

		if ( string.find(key, "^WM %a+") ) then
			local note = MapNotes_Data_Notes[key];
			if ( note ) then
				note = note[nid];
				if ( note ) then
					local check = getglobal( self:GetName() .. "NoteMininote" );
					if ( fixPointy ) then
						note.mininote = true;
						if ( MNB.mode == "searching" ) then
							check:Show();
						end
					else
						note.mininote = nil;
						if ( MNB.mode == "searching" ) then
							check:Hide();
						end
					end
				end
				MNB.New_MapNotes_WorldMapButton_OnUpdate();		-- new or old .... ?
			end
		end

		if ( ( MapNotes_Keys[key] ) and ( MapNotes_Keys[key].c ~= nil ) and ( not MNB_Browser.Plugin ) ) then
			SetMapZoom(MapNotes_Keys[key].c, MapNotes_Keys[key].z);
			if ( MapNotes_Keys[key].f ) then
				SetDungeonMapLevel(MapNotes_Keys[key].f);
			end
			frameKey = frame.key or MapNotes_GetMapKey();	-- update key if map changed
		end

		MNB_PointyPointy:Hide();
		for n=1, 18 do getglobal("MNB_Scroll"..n.."NotePointy"):Hide(); end

		if ( fixPointy ) then
			MNB_PointyPointy.fixed.key = key;
			MNB_PointyPointy.fixed.nid = nid;
			MNB_PointyPointy.fixed.pluginFrame = self.pluginFrame;
			MNB_PointyPointy.frame = frame;
			MNB_PointyPointy.x = self.xPos;
			MNB_PointyPointy.y = self.yPos;
			getglobal( self:GetName() .. "NotePointy" ):Show();
			ShowPointy();
			if ( ( frame:IsVisible() ) and ( frameKey == key ) ) then
			else
				MNB_PointyPointy:Hide();
			end

			-- record marker information
			MNB_MarkerButton.key = key;
			MNB_MarkerButton.nid = nid;
			MNB_MarkerButton:Show();
			if ( ( MapNotes_Keys[key] ) and ( MapNotes_Keys[key].c ~= nil ) ) then
				MNB_MarkerButton.c = MapNotes_Keys[key].c;
				MNB_MarkerButton.z = MapNotes_Keys[key].z;
				MNB_MarkerButton.f = MapNotes_Keys[key].f;
			end
		end

		MNB.ScrollButton_OnEnter(self);

	elseif ( mouseButton == "RightButton" ) then
		MapNotes:InitialiseDropdown(MNB_Browser, self.xPos, self.yPos, MapNotes.mininote_dd_info, self.key, self.nid);
		ToggleDropDownMenu(1, nil, MapNotes.dd, "cursor", 0, 0);
	end
end

function MNB.Marker_OnClick(self, mouseButton)
	if ( mouseButton == "LeftButton" ) then
		if ( self.c ) then
			SetMapZoom(self.c, self.z);
			if ( self.f ) then
				SetDungeonMapLevel(self.f);
			end
		end
	else
		MNB_PointyPointy.fixed = nil;
		MNB_PointyPointy:Hide();
		MNB_MarkerButton:Hide();
		MNB.PopulateScroll(MapNotes.pluginKeys[self.key]);
	end
end

-- search button OnClick
function MNB.Search_OnClick(self, mouseButton)
	MNB.mode = "searching";
	MNB.PopulateScroll();
end

-- function for generic call to refresh the scroll list
function MNB.PopulateScroll(Plugin)
	if ( MNB.mode == "searching" ) then
--		MNB_Browser.Plugin = nil;
		MNB.GlobalSearch();

	elseif ( Plugin ) then
		MNB_Browser.Plugin = Plugin;
		MNB.New_MapNotes_PlugInsDrawNotes(Plugin);

	else
		MNB_Browser.Plugin = nil;
		MNB.New_MapNotes_WorldMapButton_OnUpdate();
	end
end

local function SortByName(note1, note2)
	if ( strlower(note1.name) < strlower(note2.name) ) then
		return true;
	end
	return false;
end

local function LoadMNBList(key, currentZone, Plugin)
	local filter = MNB_FilterEditBox:GetText();
	local search, include;
	if ( string.len(filter) == 0 ) then filter = nil; end
	local counter = 0;

	MNB_List = {};
	for i, note in ipairs(currentZone) do
		include = true;
		if ( filter ) then
			filter = strlower(filter);
			search = strlower( note.name .. note.inf1 .. note.inf2 .. note.creator );
			if ( not string.find(search, filter) ) then
				include = false;
			end
		end
		if ( include ) then
			counter = counter + 1;
			MNB_List[counter] = {};
			MNB_List[counter].key = key;
			MNB_List[counter].nid = i;
			MNB_List[counter].name = note.name;
			MNB_List[counter].xPos = note.xPos;
			MNB_List[counter].yPos = note.yPos;
			MNB_List[counter].mininote = note.mininote;
			MNB_List[counter].icon = note.icon;
			MNB_List[counter].customIcon = note.customIcon;
			if ( Plugin ) then
				MNB_List[counter].pluginFrame = Plugin.frame;
			else
				MNB_List[counter].pluginFrame = nil;
			end
		end
	end
	local _, lName = MapNotes_GetMapDisplayName(key);
	MNB_ZoneName:SetText( lName );
	table.sort(MNB_List, SortByName);
	MNB.Refresh();
end

-- Note Writing hook to refresh global searches only if necessary
function MNB.New_MapNotes_WriteNote()
	MNB.Ori_MapNotes_WriteNote();

	if ( ( MNB_Browser:IsVisible() ) and ( MNB.mode == "searching" ) and ( #MNB_List > 0 ) ) then
		MNB_Browser.Plugin = nil;
		MNB.GlobalSearch();
	end
end

-- WorldMap note update
function MNB.New_MapNotes_WorldMapButton_OnUpdate()
	MNB.Ori_MapNotes_WorldMapButton_OnUpdate();

	local key = MapNotes_GetMapKey();

	if ( ( MNB_Browser:IsVisible() ) and ( MNB.mode == "WM" ) ) then
		local currentZone = MapNotes_Data_Notes[key];
		LoadMNBList(key, currentZone, nil);
	end

	if ( ( MNB_PointyPointy.fixed ) and ( not MNB_PointyPointy.fixed.pluginFrame ) ) then
		if ( MNB_PointyPointy.fixed.key == key ) then
			MNB_PointyPointy:Show();
--			local p = MNB_PointyPointy:GetParent();
			local p = WorldMapButton;	-- default frame for non-plugins
--			if ( ( p:IsVisible() ) and ( not MNB_Browser:IsVisible() ) and ( MNB_Browser:IsShown() ) ) then
			if ( ( p:IsVisible() ) and ( MNB_Browser:IsShown() ) ) then
				MNB_Browser:SetParent( p );
				MNB_Browser:Show();
				MNB_Browser.Plugin = nil;
			end
		else
			MNB_PointyPointy:Hide();
		end
	end
end

-- Plugin note update
function MNB.New_MapNotes_PlugInsDrawNotes(Plugin)
	if ( Plugin.Plugin ) then
		Plugin = Plugin.Plugin;
	end

	if ( MapNotes.MapNotes_Plugin_Updating[Plugin.name] ) then
		return;
	end

	MNB.Ori_MapNotes_PlugInsDrawNotes(Plugin);

	local key = MapNotes_PlugInsGetKey(Plugin);

	if ( ( MNB_Browser:IsVisible() ) and ( MNB.mode == Plugin.name ) ) then
		local currentZone = MapNotes_Data_Notes[key];
		LoadMNBList(key, currentZone, Plugin);
	end

	if ( ( MNB_PointyPointy.fixed ) and ( MNB_PointyPointy.fixed.pluginFrame ) ) then
		if ( MNB_PointyPointy.fixed.key == key ) then
			MNB_PointyPointy:Show();
--			local p = MNB_PointyPointy:GetParent();
			local p = MNB_PointyPointy.fixed.pluginFrame;
--			if ( ( p:IsVisible() ) and ( not MNB_Browser:IsVisible() ) and ( MNB_Browser:IsShown() ) ) then
			if ( ( p:IsVisible() ) and ( MNB_Browser:IsShown() ) ) then
				MNB_Browser:SetParent( p );
				MNB_Browser:Show();
				MNB_Browser.Plugin = Plugin;
			end
		else
			MNB_PointyPointy:Hide();
		end
	end
end

function MNB.GlobalSearch()
	local fTxt = MNB_FilterEditBox:GetText();

	if ( ( fTxt ) and ( fTxt ~= "" ) ) then
		local foundArray = {};
		foundArray.w = {};
		foundArray.p = {};
		local workin, countin;

		fTxt = string.lower(fTxt);
		for key, map in pairs(MapNotes_Data_Notes) do
			local heading;
			if ( string.sub(key, 1, 3) == "WM " ) then
				workin = foundArray.w;
				_, heading, _ = MapNotes_GetMapDisplayName(key);
				if ( heading ) then
					table.insert(workin, {});
					workin = workin[#workin];
					countin = foundArray.w[#workin];
					workin.name = heading;
					workin.notes = {};
					workin = workin.notes;
				end
			else
				workin = foundArray.p;
				for i, P in pairs(MAPNOTES_PLUGINS_LIST) do
					if ( string.find(key, P.name) ) then
						_, heading, _ = MapNotes_GetMapDisplayName(key, P);
						if ( heading ) then
							table.insert(workin, {});
							workin = workin[#workin];
							countin = foundArray.p[#workin];
							workin.name = heading;
							workin.Plugin = P;
							workin.notes = {};
							workin = workin.notes;
						end
						break;
					end
				end
			end

			-- Have set up the workin array, now copy relevant note details in to it
			local cN = 0;
			for index, note in ipairs(map) do
				local sTxt = string.lower( note.name .. note.inf1 .. note.inf2 .. note.creator );
--				if ( ( fTxt == "" ) or ( string.find(sTxt, fTxt) ) ) then		-- allow for empty strings i.e. allow ALL notes to be listed ??? %%%
				if ( string.find(sTxt, fTxt) ) then
					table.insert(workin, {});
					workin[#workin].name = note.name;
					workin[#workin].key = key;
					workin[#workin].nid = index;
					cN = cN + 1;
				end
			end
		end

		for i, data in ipairs(foundArray.p) do
			table.sort(data.notes, SortByName);
		end
		table.sort(foundArray.p, SortByName);

		for i, data in ipairs(foundArray.w) do
			table.sort(data.notes, SortByName);
		end
		table.sort(foundArray.w, SortByName);

		MNB_List = {};
		local counter = 0;
		local Plugin;
		local aNote;
		for i, data in ipairs(foundArray.p) do
			if ( #(data.notes) > 0 ) then
				counter = counter + 1;
				MNB_List[counter] = {};
				MNB_List[counter].heading = data.name;
				Plugin = data.Plugin;
				for n, details in ipairs(data.notes) do
					counter = counter + 1;
					aNote = MapNotes_Data_Notes[details.key][details.nid];
					MNB_List[counter] = {};
					MNB_List[counter].key = details.key;
					MNB_List[counter].nid = details.nid;
					MNB_List[counter].name = aNote.name;
					MNB_List[counter].xPos = aNote.xPos;
					MNB_List[counter].yPos = aNote.yPos;
					MNB_List[counter].mininote = aNote.mininote;
					MNB_List[counter].icon = aNote.icon;
					MNB_List[counter].customIcon = aNote.customIcon;
					if ( Plugin ) then
						MNB_List[counter].pluginFrame = Plugin.frame;
					end
				end
			end
		end
		for i, data in ipairs(foundArray.w) do
			if ( #(data.notes) > 0 ) then
				counter = counter + 1;
				MNB_List[counter] = {};
				MNB_List[counter].heading = data.name;
				for n, details in ipairs(data.notes) do
					counter = counter + 1;
					aNote = MapNotes_Data_Notes[details.key][details.nid];
					MNB_List[counter] = MapNotes_Data_Notes[details.key][details.nid];
					MNB_List[counter].key = details.key;
					MNB_List[counter].nid = details.nid;
					MNB_List[counter].name = aNote.name;
					MNB_List[counter].xPos = aNote.xPos;
					MNB_List[counter].yPos = aNote.yPos;
					MNB_List[counter].mininote = aNote.mininote;
					MNB_List[counter].icon = aNote.icon;
					MNB_List[counter].customIcon = aNote.customIcon;
					MNB_List[counter].pluginFrame = nil;
				end
			end
		end

		MNB_ZoneName:SetText( MNB_ALLMAPS );
		MNB.Refresh();
	end
end

-- Actual refreshing of listed notes
function MNB.Refresh()
	local note, noteT, noteIcon, noteZone, noteName, noteMininote;
	local numNotes = #MNB_List;
	local nOffset = 0;
	local data, test;

	FauxScrollFrame_Update(MNB_BrowserScroll, numNotes, 18, 16);

	local fOffset = FauxScrollFrame_GetOffset(MNB_BrowserScroll);
	for n=1, 18 do
		nOffset = n + fOffset;
		noteT = "MNB_Scroll"..n;
		note = getglobal(noteT);

		if ( nOffset > numNotes ) then
			note:Hide();
		else
			data = MNB_List[nOffset];
			noteMininote = getglobal(noteT.."NoteMininote");
			noteIcon = getglobal(noteT.."NoteIcon");
			noteZone = getglobal(noteT.."NoteZone");
			noteName = getglobal(noteT.."NoteName");
			notePointy = getglobal(noteT.."NotePointy");
			if ( data.heading ) then
				noteMininote:Hide();
				noteIcon:Hide();
				notePointy:Hide();
				noteName:Hide();
				noteZone:SetText( "|c0000ff00" .. data.heading .. "|r" );
				noteZone:Show();
				note:SetScript("OnEnter", nil);
				note.heading = data.heading;
				note.xPos, note.yPos, note.key, note.nid = nil, nil, nil, nil;
				note.pluginFrame = nil;
			else
				noteZone:Hide();
				if ( data.mininote ) then
					noteMininote:Show();
				else
					noteMininote:Hide();
				end
				noteIcon:SetTexture( data.customIcon );
				if ( not noteIcon:GetTexture() ) then
					noteIcon:SetTexture(MN_POI_ICONS_PATH .. "\\Icon" .. data.icon);
				end
				if ( ( MNB_PointyPointy.fixed ) and 
					 ( MNB_PointyPointy.fixed.key == data.key ) and
					 ( MNB_PointyPointy.fixed.nid == data.nid ) ) then
					notePointy:Show();
				else
					notePointy:Hide();
				end
				noteIcon:Show();
				noteName:SetText( data.name );
				noteName:Show();
				note:SetScript("OnEnter", MNB.ScrollButton_OnEnter);
				note.heading = nil;
				note.xPos = data.xPos;
				note.yPos = data.yPos;
				note.key = data.key;
				note.nid = data.nid;
				if ( data.pluginFrame ) then
					note.pluginFrame = getglobal(data.pluginFrame);
				else
					note.pluginFrame = nil;
				end
			end
			note:Show();
		end
	end
end

local angleInc = 5.00;
function MNB.PointyUpdate(self, elapsed)
	if ( self:IsVisible() ) then
		self.timer = self.timer + elapsed;
--		if ( self.timer > 0.05 ) then
			self.hAngle = self.hAngle + angleInc;
			local s = sin(self.hAngle);
			local c = cos(self.hAngle);
			MNB_PointyPointyT:SetTexCoord(	0.5-s, 0.5+c,
											0.5+c, 0.5+s,
											0.5-c, 0.5-s,
											0.5+s, 0.5-c);
			self.timer = 0;
--		end
	end
end


-- Load me up
do
	local frame = CreateFrame("Frame");
	frame:RegisterEvent("VARIABLES_LOADED");
	frame:SetScript("OnEvent", MNB.ProcessEvents);
end

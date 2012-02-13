
-- Saved Variables
MNIL_Data = {};



-- NameSpace
MNIL = {};



-- Global Constants not for localisation
MNIL_VERSION = "v1.04.20400";
MNIL_EDITION = 1;

MNIL_MNVERSION = "MapNotes (Fan's Update) " .. MNIL_VERSIONTXT .. " " .. MAPNOTES_VERSION;
MNIL_MNILVERSION = "MapNotesIconLib " .. MNIL_VERSIONTXT .. " " .. MNIL_VERSION;



-- Local Constants

local MNILLC = {};
MNILLC.NormalFontSize = 12;
MNILLC.HighlightFontSize = 14;
MNILLC.DisabledFontSize = 8;
MNILLC.ButtonsPerRow = 10;
MNILLC.LibButtons = 40;



-- Local Variables

local MNILV = {};
MNILV.AsyncData = {};





-------------------------
-- Local Functions --
-------------------------

local MNILF = {};

function MNILF.MNILSelectorFrame_Refresh()
	local selectedLib = MNILSelectorFrame.selectedLib;

	-- Set Labels
	MNILSelectorFrameStatus2:SetText( getn(MNIL_Libs) );
	MNILSelectorFrameStatus2:ClearAllPoints();
	MNILSelectorFrameStatus2:SetPoint("LEFT", MNILSelectorFrameStatus, "RIGHT", 0, 0);
	MNILSelectorFrameMNLibAuthor2:SetText( selectedLib.author );
	MNILSelectorFrameMNLibAuthor2:ClearAllPoints();
	MNILSelectorFrameMNLibAuthor2:SetPoint("LEFT", MNILSelectorFrameMNLibAuthor, "RIGHT", 0, 0);
	MNILSelectorFrameMNLibDate2:SetText( selectedLib.date );
	MNILSelectorFrameMNLibDate2:ClearAllPoints();
	MNILSelectorFrameMNLibDate2:SetPoint("LEFT", MNILSelectorFrameMNLibDate, "RIGHT", 0, 0);
	local localisedInfo = selectedLib.info[ MNILLC.loc ];
	if ( not localisedInfo ) then
		localisedInfo = selectedLib.info.enGB;
	end
	if ( not localisedInfo ) then
		for loc, info in pairs(selectedLib.info) do
			localisedInfo = info;
			break;
		end
	end
	if ( not localisedInfo ) then localisedInfo = "BUG ALERT : Please report code 432jk("..selectedLib.title..") to telic@hotmail.co.uk"; end
	MNILSelectorFrameMNLibInfo2:SetText( localisedInfo );
	MNILSelectorFrameMNLibInfo2:ClearAllPoints();
	MNILSelectorFrameMNLibInfo2:SetPoint("TOPLEFT", MNILSelectorFrameMNLibInfo, "TOPRIGHT", 0, 0);

	UIDropDownMenu_SetSelectedID(MNIL_LibsDropDown, MNIL_Data.lastLib);
	UIDropDownMenu_SetText(MNIL_LibsDropDown, selectedLib.title);
	MNIL_LibsDropDown:SetScale(0.9);

	-- Set Buttons
	MNILF.MNILSelectorFrame_RefreshButtons()
end

function MNILF.MNILSelectorFrame_RefreshButtons()
	local selectedLib = MNILSelectorFrame.selectedLib;

	if ( not MNIL_Data.lastRow ) then
		MNIL_Data.lastRow = 1;
	end

	local startAt = ( ( MNIL_Data.lastRow - 1 ) * MNILLC.ButtonsPerRow ) + 1;
	local numIcons = getn(selectedLib.icons);

	if ( ( startAt > numIcons ) or ( startAt < 1 ) ) then
		startAt = 1;
		MNIL_Data.lastRow = 1;
	end

	-- set the label describing which icons are showing
	local endAt = startAt+MNILLC.LibButtons-1;
	if ( numIcons < endAt ) then
		endAt = numIcons;
	end
	MNILSelectorFrameMNLibIcons2:SetText(startAt .. " - " .. endAt .. "  (" .. numIcons .. ")");
	MNILSelectorFrameMNLibIcons2:ClearAllPoints();
	MNILSelectorFrameMNLibIcons2:SetPoint("LEFT", MNILSelectorFrameMNLibIcons, "RIGHT", 0, 0);

	-- if starting at a row after the first, enable the scroll up button, else disable
	if ( MNIL_Data.lastRow > 1 ) then
		MNIL.Button_Enable(MNIL_LibPrev);
	else
		MNIL.Button_Disable(MNIL_LibPrev);
	end

	-- if enough icons to overflow the available buttons, then enable the scroll down button, else disable
	if ( numIcons - startAt + 1 > MNILLC.LibButtons ) then
		MNIL.Button_Enable(MNIL_LibNext);
	else
		MNIL.Button_Disable(MNIL_LibNext);
	end

	-- update the button icons, or hide the buttons if not enough icons
	local icon, libIndex;
	for i=1, MNILLC.LibButtons, 1 do
		libIndex = startAt + i - 1;
		icon = getglobal("MNIL_LibIcon"..i);
		if ( ( selectedLib.icons[libIndex] ) and ( selectedLib.icons[libIndex].path ~= "Interface\\AddOns\\MapNotesIconLib\\Icons\\Empty" ) ) then
			MNIL.Button_SetTexture(icon, selectedLib.icons[libIndex].path);
			icon.text = selectedLib.icons[libIndex].path;
			icon:Show();
		else
			icon:Hide();
		end
	end
end

function MNILF.CmdLine(switch, parm1, pList)
	if ( ( not switch ) or ( switch == "" ) ) then
		if ( MNILOptionsFrame:IsVisible() ) then
			MNIL.IL_CancelOptionsOnClick();
		else
			MNILOptionsFrame:Show();
		end

	--	elseif ( 
	
	else
		
	end
end

function MNILF.Reset()
	-- cancel any current selection
	if ( MNILSelectorFrame:IsVisible() ) then
		MNILSelectorFrame:Hide();
		MNILSelectorFrame:SetUserPlaced(false);
	end

	-- now clean the MNIL stored changes
	MNIL_Data.customDefaults = {};
	MNIL_Data.partyIcon = nil;
	MNIL_Data.tlocIcon = nil;

	-- now clean the MapNotes Database of ALL customIcons
	for _, map in pairs(MapNotes_Data_Notes) do
		for _, note in pairs(map) do
			if ( note.customIcon ) then
				note.customIcon = nil;
			end
		end
	end

	-- reset the Party / tloc notes
	MN_PARTY_ICON = nil;
	MN_TLOC_ICON = nil;
	MapNotesPOIpartyTexture:SetTexture(MN_POI_ICONS_PATH.."\\Iconparty");
	MNIL_OptionPartyArtWorkTexture:SetTexture(MN_POI_ICONS_PATH.."\\Iconparty");
	MapNotesPOItlocTexture:SetTexture(MN_POI_ICONS_PATH.."\\Icontloc");
	MNIL_OptiontlocArtWorkTexture:SetTexture(MN_POI_ICONS_PATH.."\\Icontloc");
	if ( MapNotes_MiniNote_Data.icon == "party" ) then
		MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Iconparty");
	elseif ( MapNotes_MiniNote_Data.icon == "tloc" ) then
		MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icontloc");
	end

	-- reset the Options / Edit menu icons
	for i = 0, 9, 1 do
		getglobal("MN_EditIcon"..i.."Texture"):SetTexture(MN_POI_ICONS_PATH.."\\Icon"..i);
		getglobal("MapNotesOptionsIcon"..i.."Texture"):SetTexture(MN_POI_ICONS_PATH.."\\Icon"..i);
	end

	-- refresh the maps
	MapNotes_MapUpdate();
	MapNotes_PlugInsRefresh();

	-- reset the Options frame
	MNILOptionsFrame:Hide();
	MNILOptionsFrame:SetUserPlaced(false);
	MNILOptionsFrame:Show();
end

function MNILF.WashMe()
	local washedIcons = {};
	local washedCount = 0;

	-- create local index of loaded Icons for ease of use
	local tIndex = {};
	for _, lib in pairs(MNIL_Libs) do
		for _, txture in pairs(lib.icons) do
			tIndex[txture.path] = true;
		end
	end

	-- prepare the way
	if ( MNILSelectorFrame:IsVisible() ) then
		MNILSelectorFrame:Hide();
	end
	if ( MapNotesDropDownList:IsVisible() ) then
		MapNotes_ToggleDropDownMenu();
	end

	DEFAULT_CHAT_FRAME:AddMessage(MNIL_CLEAN, 0, 0, 1);

	for _, map in pairs(MapNotes_Data_Notes) do
		for _, note in pairs(map) do
			if ( note.customIcon ) then
				if ( not tIndex[note.customIcon] ) then
					if ( not washedIcons[note.customIcon] ) then
						washedIcons[note.customIcon] = 0;
					end
					washedIcons[note.customIcon] = washedIcons[note.customIcon] + 1;
					note.customIcon = nil;
				end
			end
		end
	end

	-- also need to wash customDefaults, and the Party / tloc icons....
	for i, txture in pairs(MNIL_Data.customDefaults) do
		if ( not tIndex[txture] ) then
			if ( not washedIcons[txture] ) then
				washedIcons[txture] = 0;
			end
			washedIcons[txture] = washedIcons[txture] + 1;
			MNIL_Data.customDefaults[i] = nil;
			getglobal("MN_EditIcon"..i.."Texture"):SetTexture(MN_POI_ICONS_PATH.."\\Icon"..i);
			getglobal("MapNotesOptionsIcon"..i.."Texture"):SetTexture(MN_POI_ICONS_PATH.."\\Icon"..i);
		end
	end

	if ( MNIL_Data.partyIcon ) then
		if ( not tIndex[MNIL_Data.partyIcon] ) then
			if ( not washedIcons[MNIL_Data.partyIcon] ) then
				washedIcons[MNIL_Data.partyIcon] = 0;
			end
			washedIcons[MNIL_Data.partyIcon] = washedIcons[MNIL_Data.partyIcon] + 1;
			MNIL_Data.partyIcon = nil;
			MN_PARTY_ICON = nil;
			MapNotesPOIpartyTexture:SetTexture(MN_POI_ICONS_PATH.."\\Iconparty");
			MNIL_OptionPartyArtWorkTexture:SetTexture(MN_POI_ICONS_PATH.."\\Iconparty");
			if ( MapNotes_MiniNote_Data.icon == "party" ) then
				MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Iconparty");
			end
		end
	end

	if ( MNIL_Data.tlocIcon ) then
		if ( not tIndex[MNIL_Data.tlocIcon] ) then
			if ( not washedIcons[MNIL_Data.tlocIcon] ) then
				washedIcons[MNIL_Data.tlocIcon] = 0;
			end
			washedIcons[MNIL_Data.tlocIcon] = washedIcons[MNIL_Data.tlocIcon] + 1;
			MNIL_Data.tlocIcon = nil;
			MN_TLOC_ICON = nil;
			MapNotesPOItlocTexture:SetTexture(MN_POI_ICONS_PATH.."\\Icontloc");
			MNIL_OptiontlocArtWorkTexture:SetTexture(MN_POI_ICONS_PATH.."\\Icontloc");
			if ( MapNotes_MiniNote_Data.icon == "tloc" ) then
				MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icontloc");
			end
		end
	end

	-- report on what was cleaned
	for icon, count in pairs(washedIcons) do
		washedCount = washedCount + count;
		DEFAULT_CHAT_FRAME:AddMessage(icon .. " : " .. count, 0, 1, 0);
	end
	DEFAULT_CHAT_FRAME:AddMessage(MNIL_TOTAL .. " : " .. washedCount, 0, 0, 1);


	-- refresh the maps
	MapNotes_MapUpdate();
	MapNotes_PlugInsRefresh();
end



-- Function Hooks

function MNILF.MNILNew_MapNotes_Edit_SetIcon(icon)
	local update;

	if ( MapNotesEditFrame:IsVisible() ) then
		-- Control-Click to toggle the Choose a new Icon frame
		if ( ( IsControlKeyDown() ) and ( not IsAltKeyDown() ) and ( not IsShiftKeyDown() ) ) then
			if ( MNILSelectorFrame:IsVisible() ) then
				MNILSelectorFrame:Hide();
			else
				MNIL.activeSelection = getglobal("MN_EditIcon"..icon.."Texture");
				MNIL.specificIcon = nil;
				MNIL.defaultIcon = icon;
				MNILSelectorFrame:Show();
			end

		-- Alt-Click resets the Icon to the MapNotes default
		elseif ( ( IsAltKeyDown() ) and ( not IsControlKeyDown() ) and ( not IsShiftKeyDown() ) ) then
			if ( MNILSelectorFrame:IsVisible() ) then
				MNILSelectorFrame:Hide();
			end
			if ( MNIL_Data.customDefaults[icon] ) then
				MNILF.PropagateDefaultIcon(icon, MNIL_Data.customDefaults[icon], nil);
				MNIL_Data.customDefaults[icon] = nil;
			end
			getglobal("MN_EditIcon"..icon.."Texture"):SetTexture(MN_POI_ICONS_PATH.."\\Icon"..icon);
			getglobal("MapNotesOptionsIcon"..icon.."Texture"):SetTexture(MN_POI_ICONS_PATH.."\\Icon"..icon);
			update = true;
	
		elseif ( ( MapNotes_Data_Notes[MapNotesEditFrame.k] ) and ( MapNotes_Data_Notes[MapNotesEditFrame.k][MapNotesEditFrame.index] ) ) then
			MapNotes_Data_Notes[MapNotesEditFrame.k][MapNotesEditFrame.index].icon = icon;
			if ( MNIL_Data.customDefaults[icon] ) then																				-- v1.1
				MapNotes_Data_Notes[MapNotesEditFrame.k][MapNotesEditFrame.index].customIcon = MNIL_Data.customDefaults[icon];	-- v1.1
			else
				MapNotes_Data_Notes[MapNotesEditFrame.k][MapNotesEditFrame.index].customIcon = nil;
			end																														-- v1.1
			update = true;
		end
	end

	MNILOld_MapNotes_Edit_SetIcon(icon);
	MNIL_CustomIconArtWorkTexture:SetTexture("Interface\\Buttons\\ButtonHilight-SquareQuickslot");

	if ( update ) then
		local Plugin = MapNotes.pluginKeys[MapNotesEditFrame.k];
		if ( Plugin ) then
			MapNotes_PlugInsDrawNotes(Plugin);
		else
			MapNotes_MapUpdate();
		end	
	end
end

function MNILF.MNILNew_MapNotes_DropDownExpandArrowOnEnter(m_id)
	MNILOld_MapNotes_DropDownExpandArrowOnEnter(m_id);
	for i=0, 9, 1 do
		if ( MNIL_Data.customDefaults[i] ) then
			getglobal("MapNotesDropDownSubMenuIcon"..i.."Texture"):SetTexture(MNIL_Data.customDefaults[i]);
		else
			getglobal("MapNotesDropDownSubMenuIcon"..i.."Texture"):SetTexture(MN_POI_ICONS_PATH.."\\Icon"..i);
		end
	end
end

function MNILF.MNILNew_MapNotes_DropDownToggleSubMenu(m_id)
	MNILOld_MapNotes_DropDownToggleSubMenu(m_id);
	for i=0, 9, 1 do
		if ( MNIL_Data.customDefaults[i] ) then
			getglobal("MapNotesDropDownSubMenuIcon"..i.."Texture"):SetTexture(MNIL_Data.customDefaults[i]);
		else
			getglobal("MapNotesDropDownSubMenuIcon"..i.."Texture"):SetTexture(MN_POI_ICONS_PATH.."\\Icon"..i);
		end
	end
end

function MNILF.MNILNew_MapNotes_WriteNote()
	local noteKey = MapNotesEditFrame.k;
	local plugin = MapNotes.pluginKeys[noteKey];
	local noteID = MapNotes_TempData_Id;
	local noteIcon = MapNotes_TempData_Icon;
	local customIcon;

	if ( MNILV.AsyncData.txture ) then
		MNILV.AsyncData.writing = true;
	end
	
	if ( ( MapNotes_Data_Notes[noteKey] ) and ( MapNotes_Data_Notes[noteKey][noteID] ) ) then
		customIcon = MapNotes_Data_Notes[noteKey][noteID].customIcon;
	end

	MNILOld_MapNotes_WriteNote();

	if ( ( MNILV.AsyncData.txture ) and ( MapNotes_Data_Notes[noteKey] ) and ( MapNotes_Data_Notes[noteKey][noteID] ) ) then
		MapNotes_Data_Notes[noteKey][noteID].customIcon = MNILV.AsyncData.txture;
		if ( MNILV.AsyncData.defaultCustomIcon ) then
			MapNotes_Data_Notes[noteKey][noteID].icon = MNILV.AsyncData.defaultCustomIcon;
		end
		if ( plugin ) then
			MapNotes_PlugInsDrawNotes(plugin);
		else
			MapNotes_MapUpdate();
		end

	-- v1.1 POSSIBLY REMOVE THIS WHOLE CLAUSE NOW ???
	elseif ( MNIL_Data.customDefaults[noteIcon] ) and ( not MapNotes_Data_Notes[noteKey][noteID].customIcon ) then	-- v1.1
		MapNotes_Data_Notes[noteKey][noteID].customIcon = MNIL_Data.customDefaults[noteIcon];
		if ( plugin ) then
			MapNotes_PlugInsDrawNotes(plugin);
		else
			MapNotes_MapUpdate();
		end

	elseif ( customIcon ) then
		MapNotes_Data_Notes[noteKey][noteID].customIcon = customIcon;
		if ( plugin ) then
			MapNotes_PlugInsDrawNotes(plugin);
		else
			MapNotes_MapUpdate();
		end
	end

	MNILV.AsyncData = {};
end

function MNILF.MNILNew_MapNotes_WorldMapButton_OnUpdate()
	if ( ( MapNotesFU_Drawing ) or ( not MapNotes_Options.aFactor ) or ( not MNIL_Data.customDefaults ) ) then
		return;
	end

	local key = MapNotes_GetMapKey();
	local currentZone = MapNotes_Data_Notes[key];

	if ( ( currentZone ) and ( MapNotes_Options.shownotes ) ) then
		for i, value in ipairs(currentZone) do
			if ( ( not value.customIcon ) and ( MNIL_Data.customDefaults[ value.icon ] ) ) then
				value.customIcon = MNIL_Data.customDefaults[ value.icon ];
			end
		end
	end

	-- Carry out the Update
	MNILOld_MapNotes_WorldMapButton_OnUpdate();
end

function MNILF.MNILNew_MapNotes_PlugInsDrawNotes(Plugin)
	if ( ( MapNotes_Plugin_Updating ) or ( not Plugin ) or ( not Plugin.name ) or ( not MapNotes_Options.aFactor ) ) then
		return;
	end

	local key = MapNotes_PlugInsGetKey(Plugin);
	if ( ( key ) and ( MapNotes_Data_Notes[key] ) ) then
		for i, value in ipairs( MapNotes_Data_Notes[key] ) do
			if ( ( not value.customIcon ) and ( MNIL_Data.customDefaults[ value.icon ] ) ) then
				value.customIcon = MNIL_Data.customDefaults[ value.icon ];
			end
		end
	end

	-- Carry out the Update
	MNILOld_MapNotes_PlugInsDrawNotes(Plugin);
end

function MNILF.PropagateDefaultIcon(index, oldTxture, newTxture)
	-- Go through the database and make sure all notes have the same Icon that meet the following criteria
	--  1.) have an Icon value of index
	--  2.) either	(a.) don't have a customIcon already
	--			(b.) have a customIcon equal to the old default customIcon
	for _, map in pairs(MapNotes_Data_Notes) do
		for _, note in ipairs(map) do
			if ( note.icon == index ) then
				if ( ( not note.customIcon ) or ( note.customIcon == oldTxture ) ) then
					note.customIcon = newTxture;
				end
			end
		end
	end
end





-------------------------
-- Dialogue Boxes --
-------------------------

-- MapNotes Version Warning
StaticPopupDialogs["MNIL_VERSION_WARNING_BOX"] = {
	text = TEXT(MNIL_VERSION_WARNING_MSG),
	button1 = TEXT(OKAY),
	showAlert = 1,
	timeout = 0,
	hideOnEscape = 1,
};

-- Confirm Reset
StaticPopupDialogs["MNIL_CONFIRM_RESET"] = {
	text = TEXT(MNIL_RESET),
	button1 = TEXT(MNIL_RESET),
	button2 = TEXT(CANCEL),
	OnAccept = MNILF.Reset,
	showAlert = 1,
	timeout = 0,
	hideOnEscape = 1,
};

-- Confirm Clean
StaticPopupDialogs["MNIL_CONFIRM_CLEAN"] = {
	text = TEXT(MNIL_CLEAN),
	button1 = TEXT(MNIL_CLEAN),
	button2 = TEXT(CANCEL),
	OnAccept = MNILF.WashMe,
	showAlert = 1,
	timeout = 0,
	hideOnEscape = 1,
};





-------------------------
-- Main Functions --
-------------------------

function MNIL.MNILSelectorFrame_OnLoad()

	MNILSelectorFrame:RegisterEvent("VARIABLES_LOADED");

	-- Set up XML Anchors for library Icons
	MNIL_LibIcon1:ClearAllPoints();
	MNIL_LibIcon1:SetPoint("CENTER", MNILSelectorFrame, "CENTER", -152, 26);
	local i = 2;
	local icon = getglobal("MNIL_LibIcon"..i);
	local leftAnchor, topAnchor = MNIL_LibIcon1, MNIL_LibIcon1;
	while ( icon ) do
		icon:ClearAllPoints();
		if ( mod(i, 10) == 1 ) then
			icon:SetPoint("CENTER", topAnchor, "CENTER", 0, -32);
			topAnchor = icon;
			leftAnchor = icon;
		else
			icon:SetPoint("CENTER", leftAnchor, "CENTER", 32, 0);
			leftAnchor = icon;
		end
		i = i + 1;
		icon = getglobal("MNIL_LibIcon"..i);
	end

	-- Hook some key MapNotes functions
	MNILOld_MapNotes_Edit_SetIcon = MapNotes_Edit_SetIcon;
	MapNotes_Edit_SetIcon = MNILF.MNILNew_MapNotes_Edit_SetIcon;

	MNILOld_MapNotes_WriteNote = MapNotes_WriteNote;
	MapNotes_WriteNote = MNILF.MNILNew_MapNotes_WriteNote;

	MNILOld_MapNotes_DropDownExpandArrowOnEnter = MapNotes_DropDownExpandArrowOnEnter;
	MapNotes_DropDownExpandArrowOnEnter = MNILF.MNILNew_MapNotes_DropDownExpandArrowOnEnter;

	MNILOld_MapNotes_DropDownToggleSubMenu = MapNotes_DropDownToggleSubMenu;
	MapNotes_DropDownToggleSubMenu = MNILF.MNILNew_MapNotes_DropDownToggleSubMenu;

	MNILOld_MapNotes_WorldMapButton_OnUpdate = MapNotes_WorldMapButton_OnUpdate;
	MapNotes_WorldMapButton_OnUpdate = MNILF.MNILNew_MapNotes_WorldMapButton_OnUpdate;

	MNILOld_MapNotes_PlugInsDrawNotes = MapNotes_PlugInsDrawNotes;
	MapNotes_PlugInsDrawNotes = MNILF.MNILNew_MapNotes_PlugInsDrawNotes;

	-- Slash commands
	local switch, parm1;
	SlashCmdList["MNIL"] = function(pList)
		local gap = string.find(pList, " ");
		if ( gap ) then
			switch = string.sub(pList, 1, (gap - 1));
			parm1 = string.sub(pList, (gap + 1));
		else
			switch = pList;
			parm1 = nil;
		end
		MNILF.CmdLine(switch, parm1, pList);
	end
	SLASH_MNIL1 = "/mnil";
end

function MNIL.OnEvent()
	if ( event == "VARIABLES_LOADED" ) then

		MNILLC.loc = GetLocale();

		-- Check Saved Variable Integrity for mandatory values
		if ( not MNIL_Data.lastLib ) then
			MNIL_Data.lastLib = 1;
		end
		if ( not MNIL_Data.lastRow ) then
			MNIL_Data.lastRow = 1;
		end
		if ( not MNIL_Data.customDefaults ) then
			MNIL_Data.customDefaults = {};
		end

		-- Load new Party/tloc Icons
		if ( MNIL_Data.partyIcon ) then
			MN_PARTY_ICON = MNIL_Data.partyIcon;
			MapNotesPOIpartyTexture:SetTexture(MN_PARTY_ICON);
		end
		if ( MNIL_Data.tlocIcon ) then
			MN_TLOC_ICON = MNIL_Data.tlocIcon;
			MapNotesPOItlocTexture:SetTexture(MN_TLOC_ICON);
		end

		-- Load new Default Icons if any
		for i = 0, 9, 1 do
			if ( MNIL_Data.customDefaults[i] ) then
				getglobal("MN_EditIcon"..i.."Texture"):SetTexture(MNIL_Data.customDefaults[i]);
				getglobal("MapNotesOptionsIcon"..i.."Texture"):SetTexture(MNIL_Data.customDefaults[i]);
			end
		end

		-- Re-position the EditFrame Icons to allow room for a Custom choice
		local lastBttn = MN_EditIcon0;
		local thisBttn;
		for i = 1, 9, 1 do
			thisBttn = getglobal("MN_EditIcon"..i);
			thisBttn:ClearAllPoints();
			thisBttn:SetPoint("LEFT", lastBttn, "RIGHT", 16, 0);
			lastBttn = thisBttn;
		end
		MNIL_CustomIcon:ClearAllPoints();
		MNIL_CustomIcon:SetPoint("LEFT", lastBttn, "RIGHT", 50, -1);

		MapNotesEditFrame:SetScript("OnHide", MNIL.MNILEditFrame_OnHide);

		MNILSelectorFrame:SetScale(0.8);
		MNILOptionsFrame:SetScale(0.8);

		-- Check the MapNotes version
		if ( MAPNOTES_VERSION < "4.12.20300" ) then
			StaticPopup_Show("MNIL_VERSION_WARNING_BOX");
		end

	end
end

function MNIL.MNIL_LibsDropDown_OnLoad()
	UIDropDownMenu_Initialize(MNIL_LibsDropDown, MNILF.MNIL_LibsDropDown_Initialise);
	UIDropDownMenu_SetWidth(MNIL_LibsDropDown, 180);
end

function MNILF.MNIL_LibsDropDown_Initialise()
	for i=1, getn(MNIL_Libs), 1 do
		local info = {};
		info.func = MNILF.MNIL_LibsDropDown_OnClick;
		info.text = MNIL_Libs[i].title;
		UIDropDownMenu_AddButton(info);
	end
end

function MNILF.MNIL_LibsDropDown_OnClick()
	UIDropDownMenu_SetSelectedID(MNIL_LibsDropDown, this:GetID());
	MNIL_Data.lastLib = this:GetID();
	MNILSelectorFrame.selectedLib = MNIL_Libs[ MNIL_Data.lastLib ];
	MNILF.MNILSelectorFrame_Refresh();
end

function MNIL.MNILEditFrame_OnHide()
	if ( not MNILV.AsyncData.writing ) then
		MNILV.AsyncData = {};
	end
end

function MNIL.MNILSelectorFrame_OnShow()
	local selectedLib;
	
	if ( MNIL_Libs[ MNIL_Data.lastLib ] ) then
		selectedLib = MNIL_Libs[ MNIL_Data.lastLib ];
	else
		selectedLib = MNIL_Libs[1];
		MNIL_Data.lastLib = 1;
	end

	MNILSelectorFrame.selectedLib = selectedLib;
	MNILF.MNILSelectorFrame_Refresh();
end

function MNIL.MNILSelectorFrame_OnHide()
	MNIL.activeSelection = nil;
	MNIL.specificIcon = nil;
	MNIL.defaultIcon = nil;
end



function MNIL.Button_OnMouseDown(bttn)
	if ( bttn.enabled ) then
		-- Mouse down animation
		local artWork = getglobal(bttn:GetName() .. "ArtWork");
		artWork:ClearAllPoints();
		artWork:SetPoint("CENTER", bttn, "CENTER", 2, -2);
	end
end

function MNIL.Button_OnMouseUp(bttn, mouseBttn)
	if ( bttn.enabled ) then
		-- Mouse up animation
		local artWork = getglobal(bttn:GetName() .. "ArtWork");
		artWork:ClearAllPoints();
		artWork:SetPoint("CENTER", bttn, "CENTER", 0, 0);

		-- Don't actually process a click if the user moved the Mouse away from the button
		if ( not MouseIsOver(bttn) ) then
			return;
		end

		-- Default processing for Button Click


		-- Button specific OnClick function
		local onClickFunc = bttn.onClickFunc;
		if ( ( onClickFunc ) and ( type(onClickFunc) == "function" ) ) then
			onClickFunc(bttn, mouseBttn);
		end
	end
end

function MNIL.Button_OnMouseEnter(bttn)
	local ttKey = bttn.tooltipKey;

	if ( ttKey ) then
		local tt = GameTooltip;
		if ( ( WorldMapFrame:IsVisible() ) and ( MouseIsOver(WorldMapFrame) ) ) then
			tt = WorldMapTooltip;
		end

		local x, y = GetCursorPosition();
		if ( x > 500 ) then
			tt:SetOwner(this, "ANCHOR_TOPRIGHT");
		else
			tt:SetOwner(this, "ANCHOR_TOPLEFT");
		end

		tt:ClearLines();
		ttKey = ttKey.."0";
		tt:AddLine(MNIL_TT[ttKey], 1, 0.7, 0);
		local i = 1;
		ttKey = this.tooltipKey .. i;
		while ( MNIL_TT[ttKey] ) do
			tt:AddLine(MNIL_TT[ttKey], 0, 1, 0);
			i = i + 1;
			ttKey = this.tooltipKey .. i;
		end

		if ( bttn.text ) then
			tt:AddDoubleLine(MNILC.ICON, bttn.text, 0, 1, 0, 0.8, 0.1, 0.8);
		end

		tt:Show();
		MapNotesEditFrame:SetFrameLevel(1);
		tt:SetFrameLevel( MapNotesEditFrame:GetFrameLevel() + 3 );
	end

	if ( bttn.enabled ) then
		if ( bttn.overlayHighlight ) then
			getglobal(bttn:GetName() .. "ArtWorkHighlight"):Show();
		elseif ( bttn.highlightedTexture ) then
			MNIL.Button_SetTexture(bttn, bttn.highlightedTexture);
		end

		local text = getglobal(bttn:GetName() .. "ArtWorkText");
		if ( text ) then
--			text:SetFont("Fonts\\ARIALN.TTF", MNILLC.HighlightFontSize);
			text:SetTextColor(1, 0, 0);
			--text:SetText( text:GetText() );
		end
	end
end

function MNIL.Button_OnMouseLeave(bttn)
	if ( bttn.enabled ) then
		local button = bttn:GetName();
		-- Mouse up animation
		local artWork = getglobal(button .. "ArtWork");
		artWork:ClearAllPoints();
		artWork:SetPoint("CENTER", bttn, "CENTER", 0, 0);

		if ( bttn.overlayHighlight ) then
			getglobal(button .. "ArtWorkHighlight"):Hide();
		elseif ( bttn.highlightedTexture ) then
			MNIL.Button_SetTexture(bttn, bttn.enabledTexture);
		end

		local text = getglobal(button .. "ArtWorkText");
		if ( text ) then
--			text:SetFont("Fonts\\ARIALN.TTF", 15);
			text:SetTextColor(1, 1, 0);
		end
	end
	GameTooltip:Hide();
	WorldMapTooltip:Hide();
end



function MNIL.Button_Disable(bttn)
	bttn.enabled = false;
	local text = getglobal(bttn:GetName() .. "ArtWorkText");
	if ( text ) then
		text:SetFont("Fonts\\ARIALN.TTF", MNILLC.DisabledFontSize);
		text:SetTextColor(0.2, 0.2, 0.2);
	end
	if ( bttn.disabledTexture ) then
		MNIL.Button_SetTexture(bttn, bttn.disabledTexture)
	end
end

function MNIL.Button_Enable(bttn)
	bttn.enabled = true;
	local text = getglobal(bttn:GetName() .. "ArtWorkText");
	if ( text ) then
		text:SetFont("MNIL_DisabledFont", MNILLC.NormalFontSize);
		text:SetTextColor(1, 0.34, 0.05);
	end
	if ( bttn.enabledTexture ) then
		MNIL.Button_SetTexture(bttn, bttn.enabledTexture)
	end
end

function MNIL.Button_SetText(bttn, txt)
	getglobal(bttn:GetName() .. "ArtWorkText"):SetText(txt);
end

function MNIL.Button_SetTexture(bttn, txture)
	getglobal(bttn:GetName() .. "ArtWorkTexture"):SetTexture(txture);
end

function MNIL.Button_GetTexture(bttn)
	return getglobal(bttn:GetName() .. "ArtWorkTexture"):GetTexture();
end



------------------------------------------------------------------------------------------------------------------------------------------
-- Chosen an Icon - might be considered the MAIN function where icons and defaults are actually changed
-- If called from an Icon selection frame, then return and set the icon
-- If just browsing, then don't do anything
-- NOTE : 	Changes are effected immediately and should be reflected on the map immediately
-- 		The only exception being New Notes where no note details exist to update yet
function MNIL.IL_IconOnClick(bttn, mouseBttn)
	if ( MNIL.activeSelection ) then
		local oldTxture = MNIL.activeSelection:GetTexture();
		local txture = MNIL.Button_GetTexture(bttn);
		local update = true;

		if ( oldTxture == "Interface\\AddOns\\MapNotesIconLib\\Icons\\Empty" ) then
			return;
		end

		-- Store details of the selected Icon in the appropriate place
		if ( MNIL.specificIcon ) then
			local key, id = MapNotesEditFrame.k, MapNotesEditFrame.index;
			local defaultCustomIcon;
			for i=0, 9, 1 do
				if ( MNIL_Data.customDefaults[i] == txture ) then
					defaultCustomIcon = i;
				elseif ( ( i ~= MapNotes_TempData_Icon ) and ( txture == MN_POI_ICONS_PATH.."\\Icon"..i ) ) then
					defaultCustomIcon = i;
				end
			end

			if ( ( MapNotes_Data_Notes[key] ) and ( MapNotes_Data_Notes[key][id] ) ) then
				MapNotes_Data_Notes[key][id].customIcon = txture;

			else
				update = nil;
			end

			MNILV.AsyncData = {};
			MNILV.AsyncData.txture = txture;
			MNILV.AsyncData.defaultCustomIcon = defaultCustomIcon;
			-- Set the texture of the target
			MNIL.activeSelection:SetTexture( txture );

		elseif ( MNIL.defaultIcon == "Party" ) then
			MN_PARTY_ICON = txture;
			MNIL_Data.partyIcon = MN_PARTY_ICON;
			MapNotesPOIpartyTexture:SetTexture(txture);
			MNIL_OptionPartyArtWorkTexture:SetTexture(txture);
			if ( MapNotes_MiniNote_Data.icon == "party" ) then
				MN_MiniNotePOITexture:SetTexture(MN_PARTY_ICON);
			end

		elseif ( MNIL.defaultIcon == "tloc" ) then
			MN_TLOC_ICON = txture;
			MNIL_Data.tlocIcon = MN_TLOC_ICON;
			MapNotesPOItlocTexture:SetTexture(txture);
			MNIL_OptiontlocArtWorkTexture:SetTexture(txture);
			if ( MapNotes_MiniNote_Data.icon == "tloc" ) then
				MN_MiniNotePOITexture:SetTexture(MN_TLOC_ICON);
			end

		elseif ( MNIL.defaultIcon ) then
			local defaultCustomIcon;
			for i=0, 9, 1 do
				if ( MNIL_Data.customDefaults[i] == txture ) then
					defaultCustomIcon = i;
				elseif ( ( i ~= MapNotes_TempData_Icon ) and ( txture == MN_POI_ICONS_PATH.."\\Icon"..i ) ) then
					defaultCustomIcon = i;
				end
			end
			if ( defaultCustomIcon ) then
				DEFAULT_CHAT_FRAME:AddMessage(MNIL_DEFAULT_IN_USE, 1, 0.1, 0.1);
				return;
			else
				MNIL_Data.customDefaults[ MNIL.defaultIcon ] = txture;
				getglobal("MapNotesOptionsIcon"..MNIL.defaultIcon.."Texture"):SetTexture(txture);
				getglobal("MN_EditIcon"..MNIL.defaultIcon.."Texture"):SetTexture(txture);
				MNIL.activeSelection:SetTexture( txture );
				MNILF.PropagateDefaultIcon(MapNotes_TempData_Icon, oldTxture, txture);
			end
		end

		if ( update ) then
			-- refresh the maps
			MapNotes_MapUpdate();
			MapNotes_PlugInsRefresh();
		end

		MNILSelectorFrame:Hide();
	end
end
------------------------------------------------------------------------------------------------------------------------------------------


-- %%%
-- Choosing a custom Icon for a specific note, without changing the defaults
function MNIL.MNIL_CustomIcon_OnClick(bttn, mouseBttn)
	if ( ( IsAltKeyDown() ) and ( not IsControlKeyDown() ) and ( not IsShiftKeyDown() ) ) then
		if ( MNILSelectorFrame:IsVisible() ) then
			MNILSelectorFrame:Hide();
		end

		MNIL_CustomIconArtWorkTexture:SetTexture("Interface\\Buttons\\ButtonHilight-SquareQuickslot");
		MN_IconOverlay:SetPoint("TOPLEFT", "MN_EditIcon"..MapNotes_TempData_Icon, "TOPLEFT", -3, 3);
		if ( ( MapNotes_Data_Notes[MapNotesEditFrame.k] )
		and  ( MapNotes_Data_Notes[MapNotesEditFrame.k][MapNotesEditFrame.index] ) ) then
			MapNotes_Data_Notes[MapNotesEditFrame.k][MapNotesEditFrame.index].customIcon = nil;
			if ( MapNotes.pluginKeys[MapNotesEditFrame.k] ) then
				MapNotes_PlugInsDrawNotes(MapNotes.pluginKeys[MapNotesEditFrame.k]);
			else
				MapNotes_MapUpdate();
			end
		end
		return;

	else
		MN_IconOverlay:SetPoint("TOPLEFT", MNIL_CustomIcon, "TOPLEFT", -3, 3);
		if ( MNILSelectorFrame:IsVisible() ) then
			MNILSelectorFrame:Hide();
		else
			MNIL.activeSelection = MNIL_CustomIconArtWorkTexture;
			MNIL.specificIcon = {};
			MNIL.specificIcon.key = MapNotesEditFrame.k;
			MNIL.specificIcon.index = MapNotesEditFrame.index;
			MNIL.defaultIcon = nil;
			MNILSelectorFrame:Show();
		end		
	end
	MNIL.Button_OnMouseEnter(MNIL_CustomIcon);
end



-- Click on Library navigation buttons for scrolling through Icons
function MNIL.IL_PrevIcons()
	if ( MNIL_Data.lastRow ) then
		MNIL_Data.lastRow = MNIL_Data.lastRow - 1;
		MNILF.MNILSelectorFrame_RefreshButtons();
	end
end

function MNIL.IL_NextIcons()
	if ( MNIL_Data.lastRow ) then
		MNIL_Data.lastRow = MNIL_Data.lastRow + 1;
		MNILF.MNILSelectorFrame_RefreshButtons();
	end
end

function MNIL.IL_OptionsOnClick()
	if ( MNILOptionsFrame:IsVisible() ) then
		MNIL.IL_CancelOptionsOnClick();
	else
		MNILOptionsFrame:Show();
	end
end


function MNIL.MNIL_CustomIcon_OnShow()
	local key = MapNotesEditFrame.k;
	local Plugin = MapNotes.pluginKeys[key];
	local currentZone = MapNotes_Data_Notes[key];
	local id = MapNotes_TempData_Id;

	currentZone = MapNotes_Data_Notes[key];

	MapNotesEditFrame.index = id;

	MNIL_CustomIconArtWorkTexture:SetTexture("Interface\\Buttons\\ButtonHilight-SquareQuickslot");
	if ( ( currentZone ) and ( id ) and ( currentZone[id] ) and ( currentZone[id].customIcon ) ) then
		local defaultCustomIcon;
		for i=0, 9, 1 do
			if ( MNIL_Data.customDefaults[i] == currentZone[id].customIcon ) then
				defaultCustomIcon = i;
			end
		end
		if ( defaultCustomIcon ) then
			MN_IconOverlay:SetPoint("TOPLEFT", "MN_EditIcon"..defaultCustomIcon, "TOPLEFT", -3, 3);

		else
			MN_IconOverlay:SetPoint("TOPLEFT", MNIL_CustomIcon, "TOPLEFT", -3, 3);
			MNIL_CustomIconArtWorkTexture:SetTexture(currentZone[id].customIcon);
		end
	end
end

function MNIL.MNIL_CustomIcon_OnHide()
	if ( MNIL.specificIcon ) or ( ( MNIL.defaultIcon ) and ( type(MNIL.defaultIcon) == "number" ) ) then
		MNILSelectorFrame:Hide();
	end
end

function MNIL.IL_CancelSelectorOnClick()
	MNILSelectorFrame:Hide();
end


------------------------------------------------
-- OPTIONS FRAME FUNCTIONS --
------------------------------------------------

function MNIL.PartyIcon_OnClick(bttn, mouseBttn)
	if ( MNILSelectorFrame:IsVisible() ) then
		MNILSelectorFrame:Hide();

	elseif ( ( IsAltKeyDown() ) and ( not IsControlKeyDown() ) and ( not IsShiftKeyDown() ) ) then
		MNIL.activeSelection = nil;
		MNIL.specificIcon = nil;
		MNIL.defaultIcon = nil;
		MNIL_Data.partyIcon = nil;
		MN_PARTY_ICON = nil;
		MapNotesPOIpartyTexture:SetTexture(MN_POI_ICONS_PATH.."\\Iconparty");
		MNIL_OptionPartyArtWorkTexture:SetTexture(MN_POI_ICONS_PATH.."\\Iconparty");
		if ( MapNotes_MiniNote_Data.icon == "party" ) then
			MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Iconparty");
		end
		MapNotes_MapUpdate();

	else
		MNIL.activeSelection = bttn;
		MNIL.specificIcon = nil;
		MNIL.defaultIcon = "Party";
		MNILSelectorFrame:Show();
	end
end

function MNIL.tlocIcon_OnClick(bttn, mouseBttn)
	if ( MNILSelectorFrame:IsVisible() ) then
		MNILSelectorFrame:Hide();

	elseif ( ( IsAltKeyDown() ) and ( not IsControlKeyDown() ) and ( not IsShiftKeyDown() ) ) then
		MNIL.activeSelection = nil;
		MNIL.specificIcon = nil;
		MNIL.defaultIcon = nil;
		MNIL_Data.tlocIcon = nil;
		MN_TLOC_ICON = nil;
		MapNotesPOItlocTexture:SetTexture(MN_POI_ICONS_PATH.."\\Icontloc");
		MNIL_OptiontlocArtWorkTexture:SetTexture(MN_POI_ICONS_PATH.."\\Icontloc");
		if ( MapNotes_MiniNote_Data.icon == "tloc" ) then
			MN_MiniNotePOITexture:SetTexture(MN_POI_ICONS_PATH.."\\Icontloc");
		end
		MapNotes_MapUpdate();

	else
		MNIL.activeSelection = bttn;
		MNIL.specificIcon = nil;
		MNIL.defaultIcon = "tloc";
		MNILSelectorFrame:Show();
	end
end

function MNIL.PartyIcon_OnShow()
	if ( MNIL_Data.partyIcon ) then
		MapNotesPOIpartyTexture:SetTexture(MNIL_Data.partyIcon);
		MNIL_OptionPartyArtWorkTexture:SetTexture(MNIL_Data.partyIcon);
	else
		MapNotesPOIpartyTexture:SetTexture(MN_POI_ICONS_PATH.."\\Iconparty");
		MNIL_OptionPartyArtWorkTexture:SetTexture(MN_POI_ICONS_PATH.."\\Iconparty");
	end
end

function MNIL.tlocIcon_OnShow()
	if ( MNIL_Data.tlocIcon ) then
		MapNotesPOItlocTexture:SetTexture(MNIL_Data.tlocIcon);
		MNIL_OptiontlocArtWorkTexture:SetTexture(MNIL_Data.tlocIcon);
	else
		MapNotesPOItlocTexture:SetTexture(MN_POI_ICONS_PATH.."\\Icontloc");
		MNIL_OptiontlocArtWorkTexture:SetTexture(MN_POI_ICONS_PATH.."\\Icontloc");
	end
end

function MNIL.IL_CancelOptionsOnClick()
	if ( ( MNIL.defaultIcon ) and ( type(MNIL.defaultIcon) == "string" ) ) then
		MNILSelectorFrame:Hide();
	end
	MNILOptionsFrame:Hide();
end

function MNIL.IL_BrowseOnClick()
	if ( MNIL.activeSelection ) then
		return;

	elseif ( MNILSelectorFrame:IsVisible() ) then
		MNILSelectorFrame:Hide();

	else
		MNIL.activeSelection = nil;
		MNIL.specificIcon = nil;
		MNIL.defaultIcon = nil;
		MNILSelectorFrame:Show();
	end
end

function MNIL.ResetOnClick()
	StaticPopup_Show("MNIL_CONFIRM_RESET");
end

function MNIL.CleanOnClick()
	StaticPopup_Show("MNIL_CONFIRM_CLEAN");
end



---------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------
-- Function for other Plugins to register their Icons --
--------------------------------------------------------------------

function MNIL_RegisterLibrary(newLib)
	for _, lib in pairs(newLib) do
		table.insert(MNIL_Libs, lib);
	end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- Data that we need to register with MapNotesIconLib
local MapNotesIconLib_Legacy_Icons = {
	[1] = {
		["title"]	= "Legacy Icons",
		["author"]	= "Telic",
		["date"]	= "20081012",
		["info"]	= {
			["enGB"] = "The Original MapNotes Icons",
		},
		["icons"]	= {
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Legacy\\Icons\\Legacy\\icon0", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Legacy\\Icons\\Legacy\\icon1", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Legacy\\Icons\\Legacy\\icon2", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Legacy\\Icons\\Legacy\\icon3", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Legacy\\Icons\\Legacy\\icon4", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Legacy\\Icons\\Legacy\\icon5", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Legacy\\Icons\\Legacy\\icon6", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Legacy\\Icons\\Legacy\\icon7", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Legacy\\Icons\\Legacy\\icon8", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Legacy\\Icons\\Legacy\\icon9", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Legacy\\Icons\\Legacy\\Iconparty", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Legacy\\Icons\\Legacy\\Icontloc", },
		},
	},
};



local MNIL_Legacy_Frame = CreateFrame("Frame");

local function MNIL_Legacy_OnEvent()
	MNIL_RegisterLibrary(MapNotesIconLib_Legacy_Icons);	-- The function needed to register the above data with MapNotesIconLib
end

MNIL_Legacy_Frame:RegisterEvent("VARIABLES_LOADED");
MNIL_Legacy_Frame:SetScript("OnEvent", MNIL_Legacy_OnEvent);


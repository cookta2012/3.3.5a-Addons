
-- Data that we need to register with MapNotesIconLib
local MapNotesIconLib_Neptunia_Icons = {
	[1] = {
		["title"]	= "Neptunia's Icons",
		["author"]	= "Neptunia",
		["date"]	= "20070101",
		["info"]	= {
			["enGB"] = "Custom Library Icons donated by Neptunia",
		},
		["icons"]	= {
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Neptunia\\Icons\\Neptunia\\icon0", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Neptunia\\Icons\\Neptunia\\icon1", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Neptunia\\Icons\\Neptunia\\icon2", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Neptunia\\Icons\\Neptunia\\icon3", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Neptunia\\Icons\\Neptunia\\icon4", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Neptunia\\Icons\\Neptunia\\icon5", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Neptunia\\Icons\\Neptunia\\icon6", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Neptunia\\Icons\\Neptunia\\icon7", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Neptunia\\Icons\\Neptunia\\icon8", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Neptunia\\Icons\\Neptunia\\icon9", },
		},
	},
};



local MNIL_Neptunia_Frame = CreateFrame("Frame");

local function MNIL_Neptunia_OnEvent()
	MNIL_RegisterLibrary(MapNotesIconLib_Neptunia_Icons);	-- The function needed to register the above data with MapNotesIconLib
end

MNIL_Neptunia_Frame:RegisterEvent("VARIABLES_LOADED");
MNIL_Neptunia_Frame:SetScript("OnEvent", MNIL_Neptunia_OnEvent);


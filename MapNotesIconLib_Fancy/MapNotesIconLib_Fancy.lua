
-- Data that we need to register with MapNotesIconLib
local MapNotesIconLib_Fancy_Icons = {
	[1] = {
		["title"]	= "Fancy Icons",
		["author"]	= "Telic",
		["date"]	= "20071227",
		["info"]	= {
			["enGB"] = "Some fancy Icons courtesy of\nhttp://www.freebuttons.com",
		},
		["icons"]	= {
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Hublo00", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Hublo01", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Hublo02", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Hublo03", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Hublo04", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Hublo05", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Hublo06", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Hublo07", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Hublo08", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib\\Icons\\Empty", },					-- use to pad the display of Icons with an empty space
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Alien00", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Alien01", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Alien02", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Alien03", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Alien04", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Alien05", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Alien06", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Alien07", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Alien08", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib\\Icons\\Empty", },					-- use to pad the display of Icons with an empty space
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Cosmic00", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Cosmic01", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Cosmic02", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Cosmic03", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Cosmic04", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Cosmic05", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Cosmic06", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Cosmic07", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Cosmic08", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib\\Icons\\Empty", },					-- use to pad the display of Icons with an empty space
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Mechano00", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Mechano01", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Mechano02", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Mechano03", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Mechano04", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Mechano05", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Mechano06", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Mechano07", },
			{	["path"] = "Interface\\AddOns\\MapNotesIconLib_Fancy\\Icons\\Fancy\\Mechano08", },
			
		},
	},
};



local MNIL_Fancy_Frame = CreateFrame("Frame");

local function MNIL_Fancy_OnEvent()
	MNIL_RegisterLibrary(MapNotesIconLib_Fancy_Icons);	-- The function needed to register the above data with MapNotesIconLib
end

MNIL_Fancy_Frame:RegisterEvent("VARIABLES_LOADED");
MNIL_Fancy_Frame:SetScript("OnEvent", MNIL_Fancy_OnEvent);


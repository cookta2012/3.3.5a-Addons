C3WaypointsFu = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "FuBarPlugin-2.0");
local tablet = AceLibrary("Tablet-2.0"); 

local files = {
	icon = "Interface\\AddOns\\Cartographer3_WaypointsFu\\icon.tga",	
}

C3WaypointsFu.hasIcon = files.icon
C3WaypointsFu.defaultPosition = "RIGHT";

local self = C3WaypointsFu

function C3WaypointsFu:OnInitialize()
if IsAddOnLoaded("QuestHelper") then
 local optionsTable = {
	type = 'group',
	args = {
		QHFUGRP = {
			order = 1,
			type = 'group',
			name = "QuestHelper Group",
			desc = "Set QuestHelper Group Properties",
			args = {		
		QHFUSHR = {
			name = "QH Share",
			desc = "Toggles objective sharing on and off. When on, will share quest objectives and progress with other party members that are using QuestHelper 0.17 or higher, and also have sharing enabled.",
			type = "execute",
			func = function() C3WaypointsFu:ToggleShare() end,
		},
		QHFUSOL = {
			name = "QH Solo",
			desc = "Will disable quest sharing and ignore anyone you might be partied with, basically assume you will receive no aid from your party members.",
			type = "execute",
			func = function() C3WaypointsFu:ToggleSolo() end,
		},		
	},
},

QHFUFIL = {
			order = 1,
			type = 'group',
			name = "QuestHelper Filters",
			desc = "Set QuestHelper Filters",
			args = {
		QHFUFIZ = {
			name = "QH Filter Zone",
			desc = "Shows or hides objective that aren't in your current zone.",
			type = 'toggle',
			get = "FilterZone",
			set = "ToggleFilterZone",
		},
		QHFUFID = {
			name = "QH Filter Done",
			desc = "Shows or hides quests that aren't complete.",
			type = 'toggle',
			get = "FilterDone",
			set = "ToggleFilterDone",
		},
		QHFUFIL = {
			name = "QH Filter Level",
			desc = "Shows or hides objective that you probably can't do. Note that this considers the the levels of everyone in your party, not just you. If you're partied with somebody higher than you, it might not hide a quest that it otherwise would have.",
			type = 'toggle',
			get = "FilterLevel",
			set = "ToggleFilterLevel",
		},
	},
},
QHFUMAP = {
			order = 1,
			type = 'group',
			name = "QuestHelper Map",
			desc = "Set QuestHelper Map Options",
			args = {		
    QHFUCAL = {
			name = "QH ReCalc",
			desc = "Recreates the world graph and location and distance information for the active objectives. You probably don't need to worry about this.",
			type = "execute",
			func = function() C3WaypointsFu:ToggleCalc() end,
		},
    QHFUANT = {
			name = "QH Ants",
			desc = "Toggles the display of the Ants on the world graph.",
			type = "execute",
			func = function() C3WaypointsFu:ToggleAnts() end,
		},
		QHFUFLYT = {
			name = "QH FlightTimer",
			desc = "Toggles the display of the FlightTimer.",
			type = "execute",
			func = function() C3WaypointsFu:ToggleFlightTimes() end,
		},
		QHFUTOG = {
			name = "Cart3 Waypoints",
			desc = "Toggles using Cartographer3 Waypoints to display your current objective.",
			type = "toggle",
			get = function() return Cartographer3.db.Waypoints.questHelper end,
			set = function(v)
								Cartographer3.db.Waypoints.questHelper = v
						end,
	--		func = function() C3WaypointsFu:ToggleCart3WP() end,
		},
		QHFUTRK = {
			name = "QH Tracker",
			desc = "Toggles using QuestHelpers built in Quest Tracker to display your current objective.",
			type = "execute",
			func = function() C3WaypointsFu:TogQHTRK() end,
		},
	},
},
    QHFUHID = {
			name = "QH Hide",
			desc = "Hides QuestHelper's minimap arrow and World Map icons and paths, and suspends the calculation of routes.",
			type = "execute",
			func = function() C3WaypointsFu:ToggleHide() end,
		},
		QHFUHIDTIP = {
			name = "QH Tooltips",
			desc = "Toggles QuestHelper's Quest Objectives Tooltips.",
			type = "execute",
			func = function() C3WaypointsFu:TogHideTips() end,
		},
	},
}
	C3WaypointsFu.OnMenuRequest = optionsTable
 end
end

function C3WaypointsFu:OnTextUpdate()
	if (self:IsTextShown()) then
		self:ShowText();
		self:SetText("WayPoints");
	else
		self:HideText();
	end
end

function C3WaypointsFu:OnTooltipUpdate()
   if IsAddOnLoaded("Cartographer3") then
    tablet:SetTitle("Cartographer3:WaypointsFu")
	  local cat = tablet:AddCategory()
	  cat:AddLine(
		   "text", "|cffffff78USAGE:|r",
		   'size', 16
	    )
	  cat:AddLine(
		   "text", "      |cff00ff00 <x> <y> [desc]|r ",
		   'size', 14 
	   )
	   cat:AddLine(
		   "text", "    Adds a waypoint at |cff00ff00x,y|r with descrtiption |cff00ff00[desc]|r",
		   'size', 12 
	   )
	   cat:AddLine(
		   "text", ""		   
	   )
	  cat:AddLine(
		   "text", "      |cff00ff00 <zone> <x> <y> [desc]|r ",
		   'size', 14
	    )
	  cat:AddLine(
		   "text", "    Adds a waypoint at |cff00ff00x,y|r in |cff00ff00x,y|rzone|r with description |cff00ff00[desc]|r",
		   'size', 12    
	    )		
  end  
   tablet:SetHint("|cffeda55fShift+LeftClick|r Clears ALL WPs" .. ".".."|cffeda55fLeftClick|r Toggels Input Mode")  
end

function C3WaypointsFu:OnClick() 
	if IsShiftKeyDown() and IsAddOnLoaded("Cartographer3") then 
	    Cartographer3_Waypoints.ClearWaypoint()
      UIErrorsFrame:AddMessage("<WayPoints> - Cleared. No longer searching.", 1.0, 
      1.0, 1.0, 1.0); PlaySound("MapPing"); 
--  elseif IsAltKeyDown() and IsAddOnLoaded("QuestHelper") then 
--  	 QuestHelper.ToggleCartWP(QuestHelper); 
--     PlaySound("MapPing"); 
  else 
  	C3WaypointsFu_Toggle(); 
  end		
end

function C3WaypointsFu_Submit()   
	msg = C3WaypointsFuFrameEdit:GetText();
  _G.SlashCmdList.CARTOGRAPHERTHREE_WAYPOINTS(msg)   
	if (C3WaypointsFuFrame:IsVisible() ) then
		HideUIPanel(C3WaypointsFuFrame);
		C3WaypointsFuFrameEdit:SetText("");
	end	
end

function C3WaypointsFu_Clear()
  Cartographer3_Waypoints.ClearWaypoint()
	UIErrorsFrame:AddMessage("<WayPoints> - Cleared. No longer searching.", 1.0, 1.0, 1.0, 1.0);
  PlaySound("MapPing");  
  if (C3WaypointsFuFrame:IsVisible() ) then
		HideUIPanel(C3WaypointsFuFrame);
		C3WaypointsFuFrameEdit:SetText("");
	end
end

-- function C3WaypointsFu_View()			
--  if (C3WaypointsFuFrame:IsVisible() ) then
--		HideUIPanel(Cart_C3WaypointsFu1Frame);
--		C3WaypointsFuFrameEdit:SetText("");
--	end
-- end

function C3WaypointsFu_Toggle()  
  if(C3WaypointsFuFrame:IsVisible()) then
		HideUIPanel(C3WaypointsFuFrame);
	else
		ShowUIPanel(C3WaypointsFuFrame);
	end
end

function C3WaypointsFu:ToggleCart3WP()
	QuestHelper.ToggleCartWP(QuestHelper);
end

function C3WaypointsFu:ToggleShare()
	QuestHelper.ToggleShare(QuestHelper);	
end

function C3WaypointsFu:ToggleSolo()
	QuestHelper.ToggleSolo(QuestHelper);	
end

function C3WaypointsFu:ToggleHide()
	QuestHelper.ToggleHide(QuestHelper);
end

function C3WaypointsFu:FilterZone()
	return QuestHelper_Pref.filter_zone;
end

function C3WaypointsFu:ToggleFilterZone()
	QuestHelper_Pref.filter_zone = not QuestHelper_Pref.filter_zone;
end

function C3WaypointsFu:FilterDone()
	return QuestHelper_Pref.filter_done;
end

function C3WaypointsFu:ToggleFilterDone()
	QuestHelper_Pref.filter_done = not QuestHelper_Pref.filter_done;
end

function C3WaypointsFu:FilterLevel()
	return QuestHelper_Pref.filter_level;
end

function C3WaypointsFu:ToggleFilterLevel()
	QuestHelper_Pref.filter_level = not QuestHelper_Pref.filter_level;
end

function C3WaypointsFu:ToggleCalc()
	QuestHelper.WantPathingReset(QuestHelper);
end

function C3WaypointsFu:ToggleAnts()
	QuestHelper.ToggleAnts(QuestHelper);
end

function C3WaypointsFu:ToggleFlightTimes()
	QuestHelper:ToggleFlightTimes(QuestHelper);
end

function C3WaypointsFu:TogQHTRK()
	QuestHelper:ToggleTrack(QuestHelper);
end

function C3WaypointsFu:TogHideTips()
	QuestHelper:ToggleTooltip(QuestHelper);
end

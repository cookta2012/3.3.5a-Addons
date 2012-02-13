local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer_Waypoints_PartyPoint")

L:AddTranslations("enUS", function() return {
	["%s is not locatable."] = true,
} end)

L:AddTranslations("zhTW", function() return {
	["%s is not locatable."] = "查找不到%s的地點。",
} end)

L:AddTranslations("zhCN", function() return {
	["%s is not locatable."] = "查找不到%s的地点。",
} end)

L:AddTranslations("esES", function() return {
	["%s is not locat able."] = "%s no es localizable.",
} end)

-- Russian Translation by StingerSoft (Eritnull aka Шептун)
L:AddTranslations("ruRU", function() return {
	["%s is not locatable."] = "%s is not locatable.",
} end)

local Roster = AceLibrary("Roster-2.1")
local Tourist = Rock("LibTourist-3.0")

PartyPoint = Waypoint:new()
PartyPoint.Roster = {}

PartyPoint.PartyID = "noparty"
PartyPoint.Continent = -1
PartyPoint.Zoneref = -1

-- Parse the id for the note and propogate the info
-- Possible inputs (zone, x, y) or (zone, id)
function PartyPoint:init(memberName)
	for unit in Roster:IterateRoster(false) do
		if string.find(string.lower(unit.name), string.lower(memberName)) then
			Waypoint.init(self, unit.name)
			self.PartyID = unit.unitid
			self:UpdateZone()
			PartyPoint.Roster[self.PartyID] = self
			break
		end
	end
end

-- Is this the same note as the waypoint?
function PartyPoint:MatchNote(memberName)
	return self.WaypointID == id
end

function PartyPoint:GetDistance()
	self:UpdateZone()
	if self.Continent == -1 then
		return -1
	end
	return Waypoint.GetDistance(self)
end


-- This is a horribly convoluted methodology of finding party members
-- Basically, since we can't depend on Cart to send locations like we
-- do for GuildPoint, we scan the map for the partymembers.
-- 1. Locate the continent on which they're on
-- 2. Cycle through the zones til we find them
-- 3. Use the zone and local (to them) map coords to send to Cartographer.
-- 4. Next cycle, check that the coordinates returned are valid
--    * if not, they've changed zones/continents
--    1. Scan the continent they were originally on for them
--       * if not found, step back and rescan the continents.
--    2. Store the new zone/continent.
-- The Cartographer map puts all waypoints into suspension on show so as not to lock
-- the map, since we're playing around with it so much to get locations.
function PartyPoint:UpdateZone()
	if self.WaypointID ~= Roster:GetUnitObjectFromUnit(self.PartyID).name then -- sanity check
		self.PartyID = Roster:GetUnitIDFromName(self.WaypointID)
	end

	local x, y = 0, 0

	if self.Continent ~= -1 then -- If we have a cached continent we are on
		SetMapZoom(self.Continent)
		x, y = GetPlayerMapPosition(self.PartyID) -- See if we're still on that continent
	end

	if x == 0 and y == 0 then -- We're no longer on this continent or we never knew which we were on
		for i=1,select("#", GetMapContinents()) do
			SetMapZoom(i) -- Cycle through the continents
			x, y = GetPlayerMapPosition(self.PartyID)
			if x ~= 0 and y ~= 0 then
				self.Continent = i
				break
			end
		end
		if x == 0 and y == 0 then
			self.Continent = -1 -- noncontigious location
		end
	end
	if self.Continent ~= -1 then -- We've found a continent they're on
		x, y = 0, 0 -- nil out continent position
		if self.Zoneref ~= -1 then -- We have a cached zone from last check
			SetMapZoom(self.Continent, self.Zoneref)
			x, y = GetPlayerMapPosition(self.PartyID)
		end
			if x == 0 and y == 0 then -- They're no longer in that zone or we never had a zone
			for i=1,select("#", GetMapZones(self.Continent)) do
				SetMapZoom(self.Continent, i)
				x, y = GetPlayerMapPosition(self.PartyID)

				if x~=0 and y~=0 then -- Found them! Store the info
					self.Zoneref = i
					self.x = x
					self.y = y
					self.Zone = select(i,GetMapZones(self.Continent))
					break
				end
			end
		end
	end
end

-- Use the Partymember name as the Title
function PartyPoint:ToString()
	if self:IsReady() then
		return self.WaypointID
	else
		return (L["%s is not locatable."]):format(self.WaypointID)
	end
end

-- Is the member connected and in contiguous space?
function PartyPoint:IsValid()
	return self.PartyID and self.PartyID ~= "noparty" and UnitIsConnected(self.PartyID) and self.Continent ~= -1
end

function PartyPoint:IsReady()
	SetMapToCurrentZone()
	return self.Continent == GetCurrentMapContinent()
end

function PartyPoint:Cancel()
	PartyPoint.Roster[self.PartyID] = nil
	self.PartyID, self.Continent, self.Zoneref = nil
	Waypoint.Cancel(self)
end

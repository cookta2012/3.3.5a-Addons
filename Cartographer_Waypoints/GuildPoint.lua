local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer_Waypoints_GuildPoint")

L:AddTranslations("enUS", function() return {
	["Pending update"] = true,
	["Waiting for Location update"] = true,
	["Guild Member not locatable"] = true,
} end)

L:AddTranslations("zhTW", function() return {
	["Pending update"] = "等候更新中",
	["Waiting for Location update"] = "等候位置更新中",
	["Guild Member not locatable"] = "查找不到公會成員的地點",
} end)

L:AddTranslations("zhCN", function() return {
	["Pending update"] = "等待更新中...",
	["Waiting for Location update"] = "等待位置更新中...",
	["Guild Member not locatable"] = "查找不到公会成员的地点。",
} end)

L:AddTranslations("esES", function() return {
	["Pending update"] = "Actualización pendiente",
	["Waiting for Location update"] = "Esperando una actualización de la Localización",
	["Guild Member not locatable"] = "Miembro de la Hermandad no localizable",
} end)
-- Russian Translation by StingerSoft (Eritnull aka Шептун)
L:AddTranslations("ruRU", function() return {
	["Pending update"] = "Задержка обновления",
	["Waiting for Location update"] = "Ожидание обновления местоположения",
	["Guild Member not locatable"] = "Согульдиец не доступен",
} end)

local LibGuild = Rock("LibGuild-1.0")
local Tourist = Rock("LibTourist-3.0")
local BZR = Rock("LibBabble-Zone-3.0"):GetReverseLookupTable()
local NameCache = {}

GuildPoint = Waypoint:new()

GuildPoint.Watcher = {}

GuildPoint.Pending = L["Pending update"]

-- Store the guildmember in the static class for later
-- reference. WaypointID is the guildmember name.
function GuildPoint:init(memberName)
	AceLibrary.argCheck(self, memberName, 2, "string")

	for name in LibGuild:GetIterator("NAME") do
		if string.find(string.lower(name), string.lower(memberName)) then
			Waypoint.init(self, name)
			if not GuildPoint.Watcher[name] then
				GuildPoint.Watcher[name] = self
			end
			break
		end
	end
--	Waypoint.init(self, -1)
end

-- Is this the same note as the waypoint?
function GuildPoint:MatchNote(memberName)
	return self.WaypointID == memberName
end

function GuildPoint:UpdateLocation(zone, _x, _y)
	local ezone = LibGuild:GetEnglishZone(self.WaypointID)
	local x,y = Tourist:TransposeZoneCoordinate(_x, _y, ezone, LibGuild:GetZone(self.WaypointID))
	self.Zone, self.x, self.y = zone, x, y
--[[	if not NameCache[zone] then
		NameCache [zone] = LibGuild:GetEnglishZone(self.WaypointID)
	end
	self.x, self.y = Tourist:TransposeZoneCoordinate(_x, _y, NameCache[zone], LibGuild:GetZone(self.WaypointID))
	self.Zone = zone  --]]
end

function GuildPoint:GetDistance()
	return Waypoint.GetDistance(self)
end

-- Use the Guildmember name as the Title
function GuildPoint:ToString()
	if self:IsReady() then
		return self.WaypointID
	else
		return self.Pending
	end
end

function GuildPoint:IsReady()
	if self.Zone ~= "Limbo" and self.x ~= -1 and self.y ~= -1 then
		return true
	else
		if not self.firstCheck then
			self.firstCheck = time()
		else
			local delay = time() - self.firstCheck - (LibGuild:GetNumOnline()/5)
			if delay < 5 then
				self.Pending = L["Waiting for Location update"]
			elseif delay < 9 then
				self.Pending = L["Guild Member not locatable"]
			else -- if they haven't updated in the normal update period
				self:Cancel()
			end
		end
		return false
	end
end

function GuildPoint:Cancel()
	GuildPoint.Watcher[self.WaypointID] = nil
	self.Icon, self.Db, self.Data = nil
	Waypoint.Cancel(self)
end

-- Are we online?
function GuildPoint:IsValid()
	return (self.WaypointID ~= -1) and LibGuild:IsMemberOnline(self.WaypointID)
end

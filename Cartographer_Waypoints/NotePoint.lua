local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer_Waypoints_NotePoint")

L:AddTranslations("enUS", function() return {
	["Trying to set a waypoint with an unknown zone: %q"] = true,
	["Waypoint"] = true,
} end)

L:AddTranslations("zhTW", function() return {
	["Trying to set a waypoint with an unknown zone: %q"] = "嘗試為一個未知地區「%s」設定路徑點",
	["Waypoint"] = "路徑點",
} end)

L:AddTranslations("zhCN", function() return {
	["Trying to set a waypoint with an unknown zone: %q"] = "尝试为一个未知区域「%s」设置路径。",
	["Waypoint"] = "路径",
} end)

L:AddTranslations("esES", function() return {
	["Trying to set a waypoint with an unknown zone: %q"] = "Tratar de establecer un Punto de Ruta con una zona desconocida: %q",
	["Waypoint"] = "Punto de Ruta",
} end)

-- Russian Translation by StingerSoft (Eritnull aka Шептун)
L:AddTranslations("ruRU", function() return {
	["Trying to set a waypoint with an unknown zone: %q"] = "Попытка назначить точку маршрута на неизвестную территорию: %q",
	["Waypoint"] = "Точку маршрута",
} end)

local BZ = Rock("LibBabble-Zone-3.0")
local BZH = BZ:GetUnstrictLookupTable()
local BZR = BZ:GetReverseLookupTable()

NotePoint = Waypoint:new()

NotePoint.Db = nil
NotePoint.Data = nil
NotePoint.ShowOnMap = true

local math_floor = math.floor
local function round(num, digits)
	-- banker's rounding
	local mantissa = 10^digits
	local norm = num*mantissa
	norm = norm + 0.5
	local norm_f = math_floor(norm)
	if norm == norm_f and (norm_f % 2) ~= 0 then
		return (norm_f-1)/mantissa
	end
	return norm_f/mantissa
end

local function getID(x, y)
	return round(x*10000, 0) + round(y*10000, 0)*10001
end

local function getXY(id)
	return (id % 10001)/10000, math_floor(id / 10001)/10000
end

-- Parse the id for the note and propogate the info
-- Possible inputs (zone, x, y) or (zone, id)
function NotePoint:init(zone, x, y, title)
	if not BZH[zone] then
		if BZR[zone] then
			zone = BZR[zone]
		else
			error((L["Trying to set a waypoint with an unknown zone: %q"]):format(zone), 2)
		end
	end
	local id
	if y then
		id = getID(x, y)
	else
		id = x
		x,y = getXY(id)
	end
	Waypoint.init(self, id..zone)
	if not title then
		local _
		self.Zone, self.x, self.y, _, self.Db, self.Data = Cartographer_Notes:GetNote(zone, x, y)
	else
		self.Zone, self.x, self.y, self.Data = zone, x, y, {title = title}
	end
end

-- Is this the same note as the waypoint?
function NotePoint:MatchNote(id)
	return self.WaypointID == id
end

-- Use the data.title as the name of the note, otherwise the zone
function NotePoint:ToString()
	if self.Data then
		if not self.Data.title then
			if self.Data.icon then
				return self.Data.icon
			end
		else
			return self.Data.title
		end
	else
		return L["Waypoint"]
	end
end

function NotePoint:GetDistance()
	return Cartographer:GetDistanceToPoint(self.x, self.y, self.Zone)
end

function NotePoint:Cancel()
	Waypoint.Cancel(self)
	self.Db, self.Data = nil
end

function NotePoint:IsValid()
	if self.Zone == "Limbo" then return false end
	if self.Data.title or Cartographer_Notes:GetNote(self.Zone, self.x, self.y) then
		return true
	else
		return false
	end
end

function NotePoint:ShowOnMap()
	return true
end

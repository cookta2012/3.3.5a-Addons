-- Base class for Waypoints

local Crayon = Rock("LibCrayon-3.0")

Waypoint = {}
local mts = setmetatable({}, {__index=function(self, key)
	self[key] = {__index=key}
	return self[key]
end, __mode='kv'})
function Waypoint:new(...)
	local t = setmetatable({}, mts[self])
	t:init(...)
	return t
end

local db = Cartographer_Notes and Cartographer_Notes.externalDBs or nil

local self = Waypoint

self.MapDB = {}

-- Pool of frames to reuse.
Waypoint.framePool = setmetatable({}, 
						( {__index = function(self, n)
										if n==0 then
											return table.remove(self) or {}
										end
									end})
						)

local function getFrame() 
	return Waypoint.framePool[0]
end
						
local function returnFrame(frame)
	table.insert(Waypoint.framePool, frame)
end

Waypoint.WaypointID = -1		-- Unique ID
Waypoint.x = -1				-- Current X co-ord of waypoint
Waypoint.y = -1				-- Current Y co-ord of waypoint
Waypoint.Zone = "Limbo"		-- Current localised zone of waypoint
Waypoint.EZone = "Void"		-- Current english zone of waypoint
Waypoint.POIID = nil			-- Note ID reference
-- Graphics 
Waypoint.InnerZone = 10
Waypoint.Icon = "Cross"
Waypoint.IconTitle = "Waypoint"
Waypoint.PointType = "Way"
Waypoint.OnMap = false
Waypoint.Frame = getFrame()	-- Frame to show waypoint
Waypoint.Colour = Crayon.COLOR_HEX_GREEN
Waypoint.ShowOnMap = false

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

function Waypoint:init(id)
	self.WaypointID = id
end

-- This function will return the x and y position relative 
-- to the map along with the zone and english zone name.
function Waypoint:Location()
	return self.x, self.y, self.Zone, self.EZone
end

-- Use Cartographer to find the distance
function Waypoint:GetDistance()
	return Cartographer:GetDistanceToPoint(self.x, self.y, self.Zone)
end

-- This function returns the colour of the arrow determined by distance
function Waypoint:GetColour(dist) 
    return Crayon:GetThresholdColorTrivial(dist, 1000, 300, 100, 30, 0) 
end

-- This function clears out values specific to the class
function Waypoint:Cancel()
	self:RemoveFromMap()
	self.WaypointID, self.x, self.y, self.Zone, self.EZone, self.POIID, self.Icon, self.IconTitle, self.PointType, self.db, self.OnMap, self.metadata = nil
	returnFrame(self.Frame)
end

-- Default ToString reverts to the ID
function Waypoint:ToString()
	return self.WaypointID
end

-- Default check to see if waypoint is ready
function Waypoint:IsReady()
	return true
end

-- Check if waypoint is valid 
function Waypoint:IsValid()
	return true
end

function Waypoint:MatchNote()
	return false
end

function Waypoint:AddToMap()
	
	local db = Waypoint.MapDB

	if not db[self.Zone] then 
		db[self.Zone] = {}
	end
	-- We're adding 1 to the standard poi so as not to cover up existing notes.
	self.POIID = round(self.x*10000, 0) + round(self.y*10000, 0)*10001 + 1

	for i,v in pairs(db[self.Zone]) do
		v.focus = nil
	end
	
	-- Work with duplicate waypoints
	if db[self.Zone][self.POIID] then
		self.POIID = self.POIID + 1
	end

	db[self.Zone][self.POIID] = { 
			icon = self.Icon, 
			title = self:ToString() or self.IconTitle, 
			point = self.PointType,
			focus = true;
	}
	self.OnMap = true
	if Cartographer_Notes then
		Cartographer_Notes:ShowNote(self.Zone, self.POIID, "Waypoints")
		Cartographer_Notes:MINIMAP_UPDATE_ZOOM()
	end
end

function Waypoint:RemoveFromMap()
	
	if not self.OnMap then return end

	local db = Waypoint.MapDB

	if self.OnMap and db and db[self.Zone] and db[self.Zone][self.POIID] then
		db[self.Zone][self.POIID] = nil
	end
	
	if #Cartographer_Waypoints.Queue > 1 and db[self.Zone] then
		for i,v in pairs(db[self.Zone]) do
			if i == Cartographer_Waypoints.Queue[2].POIID then
				v.focus = true
			end
		end
	end
end

function Waypoint:ShowOnMap()
	return false
end
	
-- Waypoint Notes

function Waypoint:GetNoteIcon(zone, id, data)
	return data.icon
end

function Waypoint:GetRadius()
	return 1/0
end

function Waypoint:IsTracking()
	return false
end

function Waypoint:IsMiniNoteHidden(zone, id, data)
	return not data.focus 
end


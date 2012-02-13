local GatherMate = LibStub("AceAddon-3.0"):GetAddon("GatherMate")
local Sharing = GatherMate:NewModule("Sharing","AceEvent-3.0","AceComm-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("GatherMate_Sharing",false)

-- addon defaults
local defaults = {
	profile = {
		sharingChannel = "GUILD",
		enableSync = true,
		syncAdds = true,
		syncDeletes = false,
	}
}

-- local variables
local dbIndexes = {
	["Herb Gathering"] = 1,
	["Mining"] = 2,
	["Fishing"] = 3,
	["Extract Gas"] = 4,
	["Treasure"] = 5,
	[1] = "Herb Gathering",
	[2] = "Mining",
	[3] = "Fishing",
	[4] = "Extract Gas",
	[5] = "Treasure",
}
local db
local options
local gmprefix = "GMSD"
local aTemplate = "A:%i:%i:%i:%i"
local dTemplate = "D:%i:%i:%i"
local actingOnComm = false

-- localize some globals
local format = format
local strsplit = strsplit
local tonumber = tonumber

-- addon functions
function Sharing:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("GatherMate_SharingDB", defaults)
	db = self.db.profile
end
function Sharing:OnEnable()
	if db.enableSync then
		self:RegisterMessage("GatherMateNodeAdded", "NodeAdded")
		self:RegisterMessage("GatherMateNodeDeleted", "NodeDeleted")
		self:RegisterComm(gmprefix, "OnMessage")
	else
		self:Disable()
	end
end
function Sharing:OnDisable()
	-- Ace3 unregisters all messages/comms/events for us
end

-- callback for node added
function Sharing:NodeAdded(event, zone, nodeType, coord, name)
	if not db.enableSync then return end
	if db.sharingChannel == "NONE" then return end
	if db.sharingChannel == "GUILD" and not IsInGuild() then return end
	if actingOnComm then return end

	local nodeData = format(aTemplate, GatherMate.zoneData[zone][3], dbIndexes[nodeType], coord, GatherMate.nodeIDs[nodeType][name])
	self:SendCommMessage(gmprefix, nodeData, db.sharingChannel, nil)
end
-- callback for node deletion
function Sharing:NodeDeleted(event, zone, nodeType, coord, name)
	if not db.enableSync then return end
	if db.sharingChannel == "NONE" then return end
	if db.sharingChannel == "GUILD" and not IsInGuild() then return end
	if actingOnComm then return end

	local nodeData = format(dTemplate, GatherMate.zoneData[zone][3], dbIndexes[nodeType], coord)
	self:SendCommMessage(gmprefix, nodeData, db.sharingChannel, nil)
end

-- Callback for comm system
function Sharing:OnMessage(prefix, message, distribution, sender)
	if not db.enableSync then return end
	if prefix ~= gmprefix then return end
	if actingOnComm then return end
	local cmd, zone, nodeType, coord, nodeID = strsplit(":", message)
	-- don't use zone+0 etc type implicit type-conversion, because it fails and errors
	-- if the received string/message isn't valid
	zone = tonumber(zone)
	nodeType = tonumber(nodeType)
	coord = tonumber(coord)
	nodeID = tonumber(nodeID)
	if not zone or zone < 1 or zone > 80 or zone ~= floor(zone) then
		return -- invalid zoneID
	end
	if not nodeType or nodeType < 1 or nodeType > 5 or nodeType ~= floor(nodeType) then
		return -- invalid nodeType
	end
	if not coord or coord <= 0 or coord >= 1e8 or coord ~= floor(coord) then
		return -- invalid coord
	end
	if not GatherMate.reverseNodeIDs[ dbIndexes[nodeType] ][nodeID] then
		return -- invalid nodeID
	end
	local x,y = GatherMate:getXY(coord)
	local nodeName = GatherMate.reverseNodeIDs[dbIndexes[nodeType]][nodeID]
	local zoneName = nil
	for name,data in pairs(GatherMate.zoneData) do 
		if data[3] == zone then
			zoneName = name
		end 
	end
	if cmd == 'A' and db.syncAdds then
		actingOnComm = true
		--GatherMate:InjectNode(zone, coord, dbIndexes[nodeType], nodeID)
		GatherMate:AddNode(zoneName,x,y,dbIndexes[nodeType],nodeName)
		actingOnComm = false
	elseif cmd == 'D' and db.syncDeletes then
		actingOnComm = true
		--GatherMate:DeleteNode(zone, coord, dbIndexes[nodeType])
		GatherMate:RemoveNodeByID(zoneName, dbIndexes[nodeType], coord)
		actingOnComm = false
	end
end

-- options table
options = {
	name = L["Gathermate_Sharing"],
	desc = L["Gathermate_Sharing"],
	type = "group",
	order = 200,
	get = function(info) return db[info.arg] end,
	set = function(info, v) db[info.arg] = v end,
	args = {
		desc = {
			name = L["MODULE_DESC"],
			type = "description",
			order = 0,
		},
		enableSync = {
			name = L["Enable GatherMate_Sharing"],
			desc = L["Enable or disable syncing of GatherMate data with other players."],
			type = "toggle",
			arg = "enableSync",
			order = 1,
			set = function(info, v)
				db[info.arg] = v
				if v then Sharing:Enable() else Sharing:Disable() end
			end,
			disabled = false,
		},
		options = {
			name = L["Gathermate_Sharing Options"],
			desc = L["Gathermate_Sharing Options"],
			type = "group",
			inline = true,
			order = 2,
			disabled = function(info) return not db.enableSync end,
			args = {
				syncAdds = {
					name = L["Sync node additions"],
					desc = L["When other players add nodes to their GatherMate, automatically add the same node to your database too."],
					type = "toggle",
					arg = "syncAdds",
					order = 1,
				},
				syncDeletes = {
					name = L["Sync node deletions"],
					desc = L["When other players delete nodes from their GatherMate, automatically delete the same node from your database too."],
					type = "toggle",
					arg = "syncDeletes",
					order = 2,
				},
				shareingChannel = {
					name = L["Sync Channel"],
					desc = L["Communication channel to send sync messages."],
					type = "select",
					arg = "sharingChannel",
					values = { 
						["GUILD"] = L["GUILD"], 
						["NONE"] = L["NONE"],
						["PARTY"] = L["PARTY"],
						["RAID"] = L["RAID"],
					},
					order = 3,					
				},
			},
		},
	},
}

-- Register our options table with GatherMate's Config
local Config = GatherMate:GetModule("Config")
Config:RegisterModule("Sharing", options)


--[[
MinimapTarget - target units using minimap blips 

Copyright (C) 2006-2009 Adirelle

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
--]]

if not MinimapTarget then return end

-- I like locals
local MinimapTarget = MinimapTarget
local type, pairs, setmetatable, wipe, tremove = type, pairs, setmetatable, wipe, tremove
local InCombatLockdown = InCombatLockdown
local UnitPlayerControlled, UnitClass, UnitIsPlayer = UnitPlayerControlled, UnitClass, UnitIsPlayer
local UnitName, UnitLevel, UnitReaction = UnitName, UnitLevel, UnitReaction
local GetNumGuildMembers, GetGuildRosterInfo = GetNumGuildMembers, GetGuildRosterInfo
local GetNumRaidMembers, GetNumPartyMembers = GetNumRaidMembers, GetNumPartyMembers
local GetNumBattlefieldScores, GetBattlefieldScore = GetNumBattlefieldScores, GetBattlefieldScore
local GetDifficultyColor = GetDifficultyColor
local RAID_CLASS_COLORS, PET = RAID_CLASS_COLORS, PET
local strformat = string.format

--------------------------------------------------------------------------------
-- Table heap
--------------------------------------------------------------------------------

local new, del, flush
do
	local heap = setmetatable({}, {__mode = 'kv'})
	function new()
		local t = tremove(heap)
		if not t then
			t = {}
		end
		return t
	end
	function del(t)
		wipe(t)
		heap[t] = true
	end
	function flush(t)
		for _,v in pairs(t) do
			if type(v) == 'table' then del(v) end
		end
		wipe(t)
	end
end

--------------------------------------------------------------------------------
-- Main event handling
--------------------------------------------------------------------------------

local eventFrame = CreateFrame("Frame")
eventFrame:Hide()
eventFrame.events = {}
eventFrame.bucketed = {}
eventFrame.elapsed = 0
eventFrame:SetScript('OnShow', function(self) self.elapsed = 0 end)
eventFrame:SetScript('OnUpdate', function(self, delta)
	self.elapsed = self.elapsed + delta
	if self.elapsed > 1.0 then
		for event in pairs(self.events) do
			self[event](self, event)
		end
		wipe(self.events)
		self:Hide()
	end
end)
eventFrame:SetScript('OnEvent', function(self, event, ...) 
	if type(self[event]) == "function" then
		if self.bucketed[event] or InCombatLockdown() then
			self.events[event] = true 
			self:Show()
		else
			self[event](self, event, ...)
		end
	end
end)

eventFrame:RegisterEvent('PLAYER_REGEN_DISABLED')
function eventFrame:PLAYER_REGEN_DISABLED()
	self:Hide()
end

eventFrame:RegisterEvent('PLAYER_REGEN_ENABLED')
function eventFrame:PLAYER_REGEN_ENABLED()
	if next(self.events) then
		self:Show()
	end
end

--------------------------------------------------------------------------------
-- Data gathering
--------------------------------------------------------------------------------

local zoneData = {}
local groupData = {}
local bgData = {}
local guildData = {}

local function UpdateData(t, name, locClass, class, level, reaction)
	local data = t[name] or new()
	data.class = class
	data.locClass = locClass
	data.level = level
	data.reaction = reaction
	t[name] = data
end

local function ScanUnit(t, unit)
	if not UnitPlayerControlled(unit) then return end
	local locClass, class 
	if UnitIsPlayer(unit) then
		locClass, class = UnitClass(unit)
	else
		locClass, class = PET, nil
	end
	UpdateData(t, UnitName(unit), locClass, class, UnitLevel(unit), UnitReaction(unit, "player"))
end

eventFrame:RegisterEvent('GUILD_ROSTER_UPDATE')
eventFrame.bucketed.GUILD_ROSTER_UPDATE = true
function eventFrame:GUILD_ROSTER_UPDATE()
	flush(guildData)
	for index = 1, GetNumGuildMembers(true) do
		local name, _, _, level, locClass, _, _, _, _, _, class = GetGuildRosterInfo(index)
		UpdateData(guildData, name, locClass, class, level, 6)
	end
end

eventFrame:RegisterEvent('PARTY_MEMBERS_CHANGED')
eventFrame.bucketed.PARTY_MEMBERS_CHANGED = true
function eventFrame:PARTY_MEMBERS_CHANGED()
	flush(groupData)
	local prefix, count = 'raid', GetNumRaidMembers()
	if count == 0 then
		prefix, count = 'party', GetNumPartyMembers()
	end
	for i = 1, count do
		ScanUnit(groupData, prefix..i)
		ScanUnit(groupData, prefix..'pet'..i)
	end
end

eventFrame:RegisterEvent('UPDATE_MOUSEOVER_UNIT')
function eventFrame:UPDATE_MOUSEOVER_UNIT()
	ScanUnit(zoneData, 'mouseover')
end

eventFrame:RegisterEvent('UPDATE_BATTLEFIELD_SCORE')
eventFrame.bucketed.UPDATE_BATTLEFIELD_SCORE = true
function eventFrame:UPDATE_BATTLEFIELD_SCORE()
	flush(bgData)
	for index = 1, GetNumBattlefieldScores() do
		local name, _, _, _, _, faction, _, _, locClass, class = GetBattlefieldScore(index)
		name = name:gsub('-.*$', '')
		UpdateData(bgData, name, locClass, class, nil, UnitInRaid(name) and 6 or 2)
	end
end

eventFrame:RegisterEvent('PLAYER_ENTERING_WORLD')
function eventFrame:PLAYER_ENTERING_WORLD()
	flush(zoneData)
	ScanUnit(zoneData, 'player')
	ScanUnit(zoneData, 'pet')
	self:GUILD_ROSTER_UPDATE()
	self:PARTY_MEMBERS_CHANGED()
	self:UPDATE_BATTLEFIELD_SCORE()
end

--------------------------------------------------------------------------------
-- The decorator itself
--------------------------------------------------------------------------------

do
	local friendly = { r = 0.41, g = 0.95, b = 0.20 }
	local neutral = { r = 1.00, g = 0.97, b = 0.10 }
	local enemy = { r = 0.88, g = 0.17, b = 0.29 }
	MinimapTarget.REACTION_COLORS = { enemy, enemy, enemy, neutral, friendly, friendly, friendly }
end
local REACTION_COLORS = MinimapTarget.REACTION_COLORS

local function Colorize(text, color)
	if type(color) == "table" then
		return strformat("|cff%02x%02x%02x%s|r", 255*color.r, 255*color.g, 255*color.b, text)
	else
		return text
	end
end

MinimapTarget:RegisterDecorator(function(label, name)
	local data = groupData[name] or guildData[name] or zoneData[name] or bgData[name]
	if data then
		local reaction, class, locClass, level = data.reaction, data.class, data.locClass, data.level
		if reaction then
			label = Colorize(label, REACTION_COLORS[reaction])
		end
		if locClass then
			if class then
				locClass = Colorize(locClass, RAID_CLASS_COLORS[class] or (CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class]))
			end
			label = label .. ' - ' .. locClass
		end
		if level then
			label = label .. ' - ' .. Colorize(level, GetDifficultyColor(level))
		end
		return label
	end
end)

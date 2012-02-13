assert(Cartographer, "Cartographer not found!")

if Cartographer3 and Cartographer3.hijackingWorldMap then
	return
end

local Cartographer = Cartographer
local revision = tonumber(string.sub("$Revision: 2250 $", 12, -3))
if revision > Cartographer.revision then
	Cartographer.version = "r" .. revision
	Cartographer.revision = revision
	Cartographer.date = string.sub("$Date: 2008-10-07 23:10:53 +0000 (Tue, 07 Oct 2008) $", 8, 17)
end

local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer-GuildPositions")

L:AddTranslations("enUS", function() return {
	["Guild Positions"] = true,
	["Module which shows you your fellow guild members' positions, as well as allowing them to see you."] = true,
	
	["%.0f yd"] = true,
	["%.0f m"] = true,
} end)

L:AddTranslations("deDE", function() return {
	["Guild Positions"] = "Gildenpositionen",
	["Module which shows you your fellow guild members' positions, as well as allowing them to see you."] = "Zeigt Euch die Position Eurer Gildenmitglieder an und erlaubt ihnen im Gegenzug Eure Position zu sehen.",
} end)

L:AddTranslations("frFR", function() return {
	["Guild Positions"] = "Positions guilde",
	["Module which shows you your fellow guild members' positions, as well as allowing them to see you."] = "Module affichant la position des membres de votre guilde, et leur permettant de voir la votre.",
} end)

L:AddTranslations("koKR", function() return {
	["Guild Positions"] = "길드원 위치",
	["Module which shows you your fellow guild members' positions, as well as allowing them to see you."] = "당신의 위치를 길드원에게 표시하거나 길드원의 위치를 표시합니다.",

	["%.0f yd"] = "%.0f yd",
	["%.0f m"] = "%.0f 미터",
} end)

L:AddTranslations("zhCN", function() return {
	["Guild Positions"] = "公会成员位置",
	["Module which shows you your fellow guild members' positions, as well as allowing them to see you."] = "允许你看到公会其他成员的位置，同时也可以让他们看见你。",

	["%.0f yd"] = "%.0f 码",
	["%.0f m"] = "%.0f 米",
} end)

L:AddTranslations("zhTW", function() return {
	["Guild Positions"] = "公會成員",
	["Module which shows you your fellow guild members' positions, as well as allowing them to see you."] = "這個模組可以讓你看到公會其他成員的位置，當然也可以讓他們看見你。",

	["%.0f yd"] = "%.0f碼",
	["%.0f m"] = "%.0f米",
} end)

L:AddTranslations("esES", function() return {
	["Guild Positions"] = "Posiciones de Hermandad",
	["Module which shows you your fellow guild members' positions, as well as allowing them to see you."] = "M\195\179dulo que muestra las posiciones de tus compa\195\177eros de hermandad, y que tambi\195\169n les permite verte a ti",
} end)

-- Russian Translation by StingerSoft (Eritnull aka Шептун)
L:AddTranslations("ruRU", function() return {
	["Guild Positions"] = "Позиции Гильдии",
	["Module which shows you your fellow guild members' positions, as well as allowing them to see you."] = "Модуль отображает местоположение ваших товарищей из гильдии, также позволяет им видеть вас",

	["%.0f yd"] = "%.0f ярд",
	["%.0f m"] = "%.0f м",
} end)

local RANK = RANK or "RANK"
local GUILD = GUILD or "GUILD"
local CLASS = CLASS or "CLASS"
local RACE = RACE or "RACE"
local LEVEL = LEVEL or "LEVEL"
local NOTE_COLON = NOTE_COLON or "NOTE_COLON"
local OFFICER_NOTE_COLON = OFFICER_NOTE_COLON or "OFFICER_NOTE_COLON"
if not OFFICER_NOTE_COLON:find(':') then
	OFFICER_NOTE_COLON = OFFICER_NOTE_COLON .. ':'
end

Cartographer_GuildPositions = Cartographer:NewModule("GuildPositions", "LibRockEvent-1.0", "LibRockTimer-1.0")
local Cartographer_GuildPositions = Cartographer_GuildPositions
local _G = getfenv(0)

local BZ = Rock("LibBabble-Zone-3.0")
local BZL = BZ:GetLookupTable()
local BZH = BZ:GetUnstrictLookupTable()
local BZR = BZ:GetReverseLookupTable()
local Roster = AceLibrary("Roster-2.1")
local AceEvent = AceLibrary("AceEvent-2.0")
local Tablet = AceLibrary("Tablet-2.0")
local LibGuild = Rock("LibGuild-1.0")
local Crayon = Rock("LibCrayon-3.0")
local Tourist = Rock("LibTourist-3.0")

local LibGuildPositions = Rock("LibGuildPositions-1.0")

local localization = GetLocale()
local yardString = (localization == "enUS" or localization == "zhTW" or localization == "zhCN") and L["%.0f yd"] or L["%.0f m"]

local path
function Cartographer_GuildPositions:OnInitialize()
	self.name = L["Guild Positions"]
	self.title = L["Guild Positions"]
	Cartographer.options.args.GuildPositions = {
		name = L["Guild Positions"],
		desc = L["Module which shows you your fellow guild members' positions, as well as allowing them to see you."],
		type = 'group',
		args = {
			toggle = {
				name = Cartographer.L["Enabled"],
				desc = Cartographer.L["Suspend/resume this module."],
				type = "toggle",
				order = -1,
				get = function() return Cartographer:IsModuleActive(self) end,
				set = function() Cartographer:ToggleModuleActive(self) end
			},
		},
		handler = self,
	}
	-- disable the guild spammer till we see if we are enabled
	--Cartographer:DisableGuildSpammer()
	path = debugstack(1, 1, 0)
	if path:find("apher\\") then
		path = "Interface\\AddOns\\Cartographer\\Cartographer_GuildPositions\\Artwork\\"
	elseif path:find("grapher_GuildPositions\\") then
		path = "Interface\\AddOns\\Cartographer_GuildPositions\\Artwork\\"
	else
		error("Cannot determine path of artwork")
	end
	
	local poiCache = {}
	
	local function OnEnter(this)
		WorldMapUnit_OnEnter()
	end
	local function OnLeave(this)
		WorldMapUnit_OnLeave()
	end
	local tmp = {}
	local function OnLineRequest(self)
		tmp[#tmp+1] = GUILD .. ": "
		local name = self.name
		tmp[#tmp+1] = name
		tmp[#tmp+1] = " - |cff"
		local level = LibGuild:GetLevel(name)
		local playerlevel = UnitLevel('player')
		tmp[#tmp+1] = Crayon:GetThresholdHexColorTrivial(level, playerlevel + 6, playerlevel - 6)
		tmp[#tmp+1] = tostring(level)
		tmp[#tmp+1] = "|r |cff"
		tmp[#tmp+1] = LibGuild:GetClassHexColor(name)
		local class = LibGuild:GetClass(name)
		tmp[#tmp+1] = class
		tmp[#tmp+1] = "|r"
		local gname = LibGuild:GetGuildName()
		tmp[#tmp+1] = " - |cff00ff00<"
		tmp[#tmp+1] = gname
		tmp[#tmp+1] = ">|r"
		local text = table.concat(tmp, "")
		for i = 1, #tmp do
			tmp[i] = nil
		end
		local tex = self.tex
		local left, top, _, _, _, _, right, bottom = tex:GetTexCoord()
		local r, g, b = tex:GetVertexColor()
		return 'text', text,
			'hasCheck', true,
			'checked', true,
			'checkIcon', tex:GetTexture(),
			'checkCoordLeft', left,
			'checkCoordRight', right,
			'checkCoordTop', top,
			'checkCoordBottom', bottom,
			'checkColorR', r,
			'checkColorG', g,
			'checkColorB', b
	end
	local function OnTabletRequest(self)
		local name = self.name
		Tablet:SetTitle(GUILD .. ": " .. name)
		local cat = Tablet:AddCategory('columns', 2)
		local class = LibGuild:GetClass(name)
		local r, g, b = LibGuild:GetClassColor(name)
		cat:AddLine(
			'text', CLASS .. ":",
			'text2', class,
			'text2R', r,
			'text2G', g,
			'text2B', b
		)
		local level = LibGuild:GetLevel(name)
		local playerlevel = UnitLevel('player')
		local r, g, b = Crayon:GetThresholdColorTrivial(level, playerlevel + 6, playerlevel - 6)
		cat:AddLine(
			'text', LEVEL .. ":",
			'text2', level,
			'text2R', r,
			'text2G', g,
			'text2B', b
		)
		local grank, granknum = LibGuild:GetRank(name), LibGuild:GetRankIndex(name)
		local mygname, mygrank, mygranknum = GetGuildInfo('player')
		
		cat:AddLine(
			'text', GUILD .. ":",
			'text2', "<" .. mygname .. ">",
			'text2R', 0,
			'text2G', 1,
			'text2B', 0
		)
		
		local grankdiff = granknum - mygranknum
		if grankdiff >= 2 then
			r, g, b = 0, 1, 0
		elseif grankdiff == 1 then
			r, g, b = 0.5, 1, 0
		elseif grankdiff == 0 then
			r, g, b = 1, 1, 0
		elseif grankdiff == -1 then
			r, g, b = 1, 0.5, 0
		else
			r, g, b = 1, 0, 0
		end
		
		cat:AddLine(
			'text', RANK .. ":",
			'text2', grank,
			'text2R', r,
			'text2G', g,
			'text2B', b
		)
		
		local note, onote = LibGuild:GetNote(name), LibGuild:GetOfficerNote(name)
		
		if note then
			cat:AddLine(
				'text', NOTE_COLON,
				'text2', note,
				'text2R', 1,
				'text2G', 1,
				'text2B', 0
			)
		end

		if onote then
			cat:AddLine(
				'text', OFFICER_NOTE_COLON,
				'text2', onote,
				'text2R', 1,
				'text2G', 1,
				'text2B', 0
			)
		end
		
		local x, y, zone = Cartographer_GuildPositions.x[name], Cartographer_GuildPositions.y[name], Cartographer_GuildPositions.zones[name]
		local dist = Cartographer:GetDistanceToPoint(x, y, zone)

		if dist and dist >= 1 then
			cat:AddLine(
				'text', Cartographer.L["Distance:"],
				'text2', yardString:format(dist)
			)
		end
	end
	
	local num = 0
	self.zones = {}
	self.x = {}
	self.y = {}
	self.times = {}
	self.pois = setmetatable({del = function(self, key)
		if key == "del" then
			return
		end
		local poi = rawget(self, key)
		if not poi then
			return
		end
		self[key] = nil
		poiCache[poi] = true
		poi:Hide()
	end}, {__index = function(self, key)
		if not key then
			return nil
		end
		local poi = next(poiCache)
		if poi then
			poiCache[poi] = nil
			self[key] = poi
			poi:Show()
			poi.name = key
			return poi
		end
		num = num + 1
		poi = CreateFrame("Frame", "CartographerGuildPositions" .. num, WorldMapButton)
		poi:SetWidth(16)
		poi:SetHeight(16)
		poi:SetPoint("CENTER")
		local tex = poi:CreateTexture(nil, "OVERLAY")
		poi.tex = tex
		tex:SetTexture(path .. "Guild")
		tex:SetAllPoints(poi)
		poi:SetFrameLevel(poi:GetFrameLevel() + 4)
		poi:SetScript("OnEnter", OnEnter)
		poi:SetScript("OnLeave", OnLeave)
		poi:EnableMouse(true)
		Cartographer:AddPOI(poi)
		poi.name = key
		poi.OnLineRequest = OnLineRequest
		poi.OnTabletRequest = OnTabletRequest
		self[key] = poi
		return poi
	end})
end

function Cartographer_GuildPositions:OnEnable()
	Rock("LibGuild-1.0").RegisterCallback(self, "Joined", "LibGuild_Joined")
	Rock("LibGuild-1.0").RegisterCallback(self, "Left", "LibGuild_Left")
	if IsInGuild() then
		self:AddEventListener("Cartographer", "MapClosed", "Cartographer_MapClosed")
		self:AddEventListener("Cartographer", "ChangeZone", "Cartographer_ChangeZone")
	end
	
	self:AddRepeatingTimer(5, "UpdateMap")
end

local function clear(person)
	if Cartographer_GuildPositions.zones[person] then
		Cartographer_GuildPositions.zones[person] = nil
		Cartographer_GuildPositions.x[person] = nil
		Cartographer_GuildPositions.y[person] = nil
		Cartographer_GuildPositions.pois:del(person)
	end
end

function Cartographer_GuildPositions:OnDisable()
	Rock("LibGuild-1.0").UnregisterAll(self)
	for k in pairs(self.pois) do
		if k ~= "del" then
			clear(k)
		end
	end
end

function Cartographer_GuildPositions:Cartographer_MapClosed()
	for k in pairs(self.pois) do
		self.pois:del(k)
	end
end

local function showGuy(name)
	if Roster:GetUnitIDFromName(name) then
		Cartographer_GuildPositions.pois:del(name)
		return
	end
	local x, y, zone = Cartographer_GuildPositions.x[name], Cartographer_GuildPositions.y[name], Cartographer_GuildPositions.zones[name]
	x, y = Tourist:TransposeZoneCoordinate(x, y, zone, Cartographer:GetCurrentEnglishZoneName())
	if not x or x < 0 or x > 1 or y < 0 or y > 1 then
		Cartographer_GuildPositions.pois:del(name)
		return
	end
	local w, h = WorldMapButton:GetWidth(), WorldMapButton:GetHeight()
	local poi = Cartographer_GuildPositions.pois[name]
	poi:SetPoint("CENTER", WorldMapButton, "TOPLEFT", w*x, -h*y)
	poi.tex:SetVertexColor(LibGuild:GetClassColor(name))
end

function Cartographer_GuildPositions:Cartographer_ChangeZone(ns, event, zone)
	for k in pairs(self.pois) do
		self.pois:del(k)
	end
	if WorldMapFrame:IsShown() then
		for name in pairs(self.zones) do
			showGuy(name)
		end
	end
end

function Cartographer_GuildPositions:LibGuild_Joined()
	if not self:HasEventListener("Cartographer", "MapClosed") then
		self:AddEventListener("Cartographer", "MapClosed", "Cartographer_MapClosed")
		self:AddEventListener("Cartographer", "ChangeZone", "Cartographer_ChangeZone")
	end
	
	if WorldMapFrame:IsShown() then
		for name in pairs(self.zones) do
			showGuy(name)
		end
	end
end

function Cartographer_GuildPositions:LibGuild_Left()
	if self:HasEventListener("Cartographer_MapClosed") then
		self:RemoveEventListener("Cartographer", "MapClosed")
		self:RemoveEventListener("Cartographer", "ChangeZone")
	end
	
	for k in pairs(self.zones) do
		clear(k)
	end
end

function Cartographer_GuildPositions:UpdateMap()
	local t = GetTime()
	for k,v in pairs(self.times) do
		if t >= v then
			clear(k)
		end
	end
	
	for name, x, y, zone in LibGuildPositions:IterateGuildMembers() do
		zone = Tourist:GetEnglishZoneFromTexture(zone)
		self.x[name] = x
		self.y[name] = y
		self.zones[name] = zone
		self.times[name] = GetTime() + 10
		if WorldMapFrame:IsShown() then
			showGuy(name)
		end
	end
end

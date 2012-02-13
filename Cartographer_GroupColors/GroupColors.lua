assert(Cartographer, "Cartographer not found!")

if Cartographer3 and Cartographer3.hijackingWorldMap then
	return
end

local Cartographer = Cartographer
local revision = tonumber(string.sub("$Revision: 2318 $", 12, -3))
if revision > Cartographer.revision then
	Cartographer.version = "r" .. revision
	Cartographer.revision = revision
	Cartographer.date = string.sub("$Date: 2009-04-17 00:20:50 +0000 (Fri, 17 Apr 2009) $", 8, 17)
end

local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer-GroupColors")

L:AddTranslations("enUS", function() return {
	["Group Colors"] = true,
	["Module which turns all your party's and your raid's POIs into circles colored based on class, and shows a number on them based on their raid group."] = true,
} end)

L:AddTranslations("deDE", function() return {
	["Group Colors"] = "Gruppenfarben",
	["Module which turns all your party's and your raid's POIs into circles colored based on class, and shows a number on them based on their raid group."] = "Modul, das Spieler Eurer Gruppe oder Eurer Schlachtgruppe als farbigen Punkt in ihrer jeweiligen Klassenfarbe und mit Raid-Gruppennummer auf der Weltkarte anzeigt.",
} end)

L:AddTranslations("frFR", function() return {
	["Group Colors"] = "Couleurs de groupe",
	["Module which turns all your party's and your raid's POIs into circles colored based on class, and shows a number on them based on their raid group."] = "Module transformant les points de la carte de votre groupe/raid en des cercles colorés selon la classe et indiquant le numéro de groupe.",
} end)

L:AddTranslations("koKR", function() return {
	["Group Colors"] = "파티원 색상",
	["Module which turns all your party's and your raid's POIs into circles colored based on class, and shows a number on them based on their raid group."] = "당신의 모든 파티원 및 공격대원들의 위치를 직업별 색상의 동그라미와 숫자로 표시합니다.",
} end)

L:AddTranslations("zhCN", function() return {
	["Group Colors"] = "团队颜色",
	["Module which turns all your party's and your raid's POIs into circles colored based on class, and shows a number on them based on their raid group."] = "在地图上将队伍或团队成员根据职业着色，并显示所在小队队号数字。",
} end)

L:AddTranslations("zhTW", function() return {
	["Group Colors"] = "團體顏色",
	["Module which turns all your party's and your raid's POIs into circles colored based on class, and shows a number on them based on their raid group."] = "在地圖上將隊伍和團隊隊友圓點依職業著色，並顯示號碼表示他們所在小隊的模組。",
} end)

L:AddTranslations("esES", function() return {
	["Group Colors"] = "Colores de Grupo",
	["Module which turns all your party's and your raid's POIs into circles colored based on class, and shows a number on them based on their raid group."] = "M\195\179dulo que convierte todos los PdIs de tu grupo y banda en c\195\173rculos coloreados seg\195\186n su clase, y muestra un n\195\186mero sobre ellos seg\195\186n su grupo de banda",
} end)

-- Russian Translation by StingerSoft (Eritnull aka Шептун)
L:AddTranslations("ruRU", function() return {
	["Group Colors"] = "Цвета групп",
	["Module which turns all your party's and your raid's POIs into circles colored based on class, and shows a number on them based on their raid group."] = "Модуль включает отображение всех членов вашей группы и рейда кружками раскрашенных по цвету класса, и отображает номер их группы в рейде",
} end)

Cartographer_GroupColors = Cartographer:NewModule("GroupColors", "LibRockEvent-1.0", "LibRockTimer-1.0")
local Cartographer_GroupColors = Cartographer_GroupColors
local battleFieldUpdated = false

local _G = getfenv(0)

local path
function Cartographer_GroupColors:OnInitialize()
	self.name = L["Group Colors"]
	self.title = L["Group Colors"]
	Cartographer.options.args.GroupColors = {
		name = L["Group Colors"],
		desc = L["Module which turns all your party's and your raid's POIs into circles colored based on class, and shows a number on them based on their raid group."],
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
	path = debugstack(1, 1, 0)
	if path:find("grapher\\") then
		path = "Interface\\AddOns\\Cartographer\\Cartographer_GroupColors\\Artwork\\"
	elseif path:find("grapher_GroupColors\\") then
		path = "Interface\\AddOns\\Cartographer_GroupColors\\Artwork\\"
	else
		error("Cannot determine path of artwork")
	end
end

function Cartographer_GroupColors:OnEnable()
	self:AddEventListener("PARTY_MEMBERS_UPDATE", "Update")
	self:AddEventListener("RAID_ROSTER_UPDATE", "Update")
	self:AddEventListener("WORLD_MAP_UPDATE", function()
		if GetNumRaidMembers() > 0 then
			self:AddRepeatingTimer("Cartographer_GroupColors", 0.5, "Update")
		else
			self:Update()
		end
	end)
	self:AddEventListener("ADDON_LOADED", function(addon)
		if addon == "Blizzard_BattlefieldMinimap" then
			self:Update()
		end
	end)
	self:Update()
	for i = 1, 4 do
		_G["WorldMapParty" .. i .. "Icon"]:SetTexture(path .. "Normal")
		_G["WorldMapParty" .. i]:SetScript("OnUpdate", nil)
	end
	for i = 1, 40 do
		_G["WorldMapRaid" .. i]:SetScript("OnUpdate", nil)
	end
end

function Cartographer_GroupColors:OnDisable()
	for i = 1, 4 do
		_G["WorldMapParty" .. i .. "Icon"]:SetVertexColor(1, 1, 1)
		_G["WorldMapParty" .. i .. "Icon"]:SetTexture("Interface\\WorldMap\\WorldMapPartyIcon")
		_G["WorldMapParty" .. i]:SetScript("OnUpdate", MapUnit_OnUpdate)
	end
	for i = 1, 40 do
		_G["WorldMapRaid" .. i .. "Icon"]:SetVertexColor(1, 1, 1)
		_G["WorldMapRaid" .. i .. "Icon"]:SetTexture("Interface\\WorldMap\\WorldMapPartyIcon")
		_G["WorldMapRaid" .. i]:SetScript("OnUpdate", MapUnit_OnUpdate)
	end
end

function Cartographer_GroupColors:Update()
	local worldMapShown = WorldMapFrame:IsShown()
	local battlefieldMinimapShown = BattlefieldMinimap and BattlefieldMinimap:IsVisible()
	if not worldMapShown and not battlefieldMinimapShown then
		self:RemoveTimer("Cartographer_GroupColors")
		return
	end
	
	if not battleFieldUpdated and BattlefieldMinimap then
		battleFieldUpdated = true
		for i = 1, 40 do
			_G["BattlefieldMinimapRaid" .. i]:SetScript("OnUpdate", nil)
		end
	end
	
	if GetNumRaidMembers() > 0 then
		local flash = GetTime() % 1 < 0.5
		
		for i = 1, GetNumRaidMembers() do
			local wmUnit = _G["WorldMapRaid" .. i].unit
			local bmUnit 
			if battlefieldMinimapShown then
				bmUnit = _G["BattlefieldMinimapRaid" .. i].unit
			end
			if not wmUnit and not bmUnit then
				break
			end
			if worldMapShown and wmUnit then
				local _, _, subgroup = GetRaidRosterInfo(string.sub(wmUnit, 5)+0)
				local _, fileName = UnitClass(wmUnit)
				if subgroup and fileName then
					local tex = _G["WorldMapRaid" .. i .. "Icon"]
					tex:SetTexture(path .. "Group" .. subgroup)
					local t = RAID_CLASS_COLORS[fileName]
					if flash and UnitAffectingCombat("raid"..i) then
						tex:SetVertexColor(0.8, 0, 0) -- flash red
					elseif flash and UnitIsDeadOrGhost("raid"..i) then
						tex:SetVertexColor(0.2, 0.2, 0.2) -- flash gray
					elseif flash and PlayerIsPVPInactive("raid"..i) then
						tex:SetVertexColor(0.5, 0.2, 0) -- flash some color
					elseif t then
						tex:SetVertexColor(t.r, t.g, t.b)
					else
						tex:SetVertexColor(0.8, 0.8, 0.8)
					end
				end
			end
			if battlefieldMinimapShown and bmUnit then
				local _, _, subgroup = GetRaidRosterInfo(string.sub(bmUnit, 5)+0)
				local _, fileName = UnitClass(bmUnit)
				if subgroup and fileName then
					local tex = _G["BattlefieldMinimapRaid" .. i .. "Icon"]
					tex:SetTexture(path .. "Group" .. subgroup)
					local t = RAID_CLASS_COLORS[fileName]
					if flash and UnitAffectingCombat("raid"..i) then
						tex:SetVertexColor(0.8, 0, 0) -- flash red
					elseif flash and UnitIsDeadOrGhost("raid"..i) then
						tex:SetVertexColor(0.2, 0.2, 0.2) -- flash gray
					elseif flash and PlayerIsPVPInactive("raid"..i) then
						tex:SetVertexColor(0.5, 0.2, 0) -- flash some color
					elseif t then
						tex:SetVertexColor(t.r, t.g, t.b)
					else
						tex:SetVertexColor(0.8, 0.8, 0.8)
					end
				end
			end
		end
	else
		for i = 1, GetNumPartyMembers() do
			local _,fileName = UnitClass("party" .. i)
			local tex = _G["WorldMapParty" .. i .. "Icon"]
			local t = RAID_CLASS_COLORS[fileName]
			if t then
				tex:SetVertexColor(t.r, t.g, t.b)
			else
				tex:SetVertexColor(0.8, 0.8, 0.8)
			end
		end
	end
end

assert(Cartographer, "Cartographer not found!")
local Cartographer = Cartographer
local revision = tonumber(string.sub("$Revision: 2323 $", 12, -3))
if revision > Cartographer.revision then
	Cartographer.version = "r" .. revision
	Cartographer.revision = revision
	Cartographer.date = string.sub("$Date: 2009-05-09 10:23:09 +0000 (Sat, 09 May 2009) $", 8, 17)
end

local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer-ZoneInfo")

L:AddTranslations("enUS", function() return {
	["Zone Info"] = true,
	["Module which on hovering over a zone, will show the levels of the zone, the instances in the zone, their levels, and the group size the instance is made for (e.g. 5-man, 40-man)."] = true,

	["Instances"] = true,
	["%d-man"] = true,
	[" and "] = true,
} end)

L:AddTranslations("koKR", function() return {
	["Zone Info"] = "지역 정보",
	["Module which on hovering over a zone, will show the levels of the zone, the instances in the zone, their levels, and the group size the instance is made for (e.g. 5-man, 40-man)."] = "해당 지역에 위치한 인던 및 참여할 수 있는 인원(예. 5명, 40명)등을 표시합니다.",

	["Instances"] = "인스턴스",
	["%d-man"] = "%d명",
	[" and "] = " and ",
} end)

L:AddTranslations("deDE", function() return {
	["Zone Info"] = "Zoneninfo",
	["Module which on hovering over a zone, will show the levels of the zone, the instances in the zone, their levels, and the group size the instance is made for (e.g. 5-man, 40-man)."] = "Modul, das Euch zu jedem Gebiet die Stufe sowie vorhandene Instanzen mit deren Level und jeweiliger Begrenzung der Spielerzahl anzeigt.",

	["Instances"] = "Instanzen",
	["%d-man"] = "%d Spieler",
	[" and "] = " und ",
} end)

L:AddTranslations("frFR", function() return {
	["Zone Info"] = "Infos de zone",
	["Module which on hovering over a zone, will show the levels of the zone, the instances in the zone, their levels, and the group size the instance is made for (e.g. 5-man, 40-man)."] = "Module affichant au passage de la souris sur une zone : la fourchette de niveaux de la zone, les instances s'y trouvant, leurs niveaux, et le nombre de joueurs que l'instance peut accueillir (par ex. 5j, 40j).",

	--["Instances"] = true,
	["%d-man"] = "%dj",
	[" and "] = " et ",
} end)

L:AddTranslations("esES", function() return {
	["Zone Info"] = "Información de la Zona",
	["Module which on hovering over a zone, will show the levels of the zone, the instances in the zone, their levels, and the group size the instance is made for (e.g. 5-man, 40-man)."] = "Módulo que muestra los niveles e instancias de la zona y los niveles y número de hombres necesarios para las instancias (p.ej. 5-hombres, 40-hombres) cuando se pasa el cursor por encima.",

	["Instances"] = "Instancias",
	["%d-man"] = "%d-hombres",
	[" and "] = " y ",
} end)

L:AddTranslations("zhTW", function() return {
	["Zone Info"] = "地區資訊",
	["Module which on hovering over a zone, will show the levels of the zone, the instances in the zone, their levels, and the group size the instance is made for (e.g. 5-man, 40-man)."] = "顯示游標所在地區資訊的模組，在世界地圖上顯示此地區的適合等級，此地區的副本和副本的人數限制 (例如: 5人、40人)。",

	["Instances"] = "副本",
	["%d-man"] = "%d人",
	[" and "] = " and ",
} end)

L:AddTranslations("zhCN", function() return {
	["Zone Info"] = "区域信息",
	["Module which on hovering over a zone, will show the levels of the zone, the instances in the zone, their levels, and the group size the instance is made for (e.g. 5-man, 40-man)."] = "显示鼠标所指的区域信息, 在世界地图上显示该区域的适合等级，该区域的副本及副本人数限制（例如5人、40人）。",

	["Instances"] = "副本",
	["%d-man"] = "%d人",
	[" and "] = " and ",
} end)

-- Russian Translation by StingerSoft (Eritnull aka Шептун)
L:AddTranslations("ruRU", function() return {
	["Zone Info"] = "Инфо о Зонах",
	["Module which on hovering over a zone, will show the levels of the zone, the instances in the zone, their levels, and the group size the instance is made for (e.g. 5-man, 40-man)."] = "Модуль который при наводке курсора на зону отображает уровни зоны, подземелья, их уровни допуска, и максимальное число человек доступное в подземельях (пример: 5-чел, 40-чел)",

	["Instances"] = "Подземелья",
	["%d-man"] = "%d-чел",
	[" and "] = " и ",
} end)

local Tourist = Rock("LibTourist-3.0")

Cartographer_ZoneInfo = Cartographer:NewModule("ZoneInfo")
local Cartographer_ZoneInfo = Cartographer_ZoneInfo

function Cartographer_ZoneInfo:OnInitialize()
	self.name = L["Zone Info"]
	self.title = L["Zone Info"]
	Cartographer.options.args.ZoneInfo = {
		name = L["Zone Info"],
		desc = L["Module which on hovering over a zone, will show the levels of the zone, the instances in the zone, their levels, and the group size the instance is made for (e.g. 5-man, 40-man)."],
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

end

local fishingLevels
do
	local BZ = LibStub("LibBabble-Zone-3.0"):GetLookupTable()
	fishingLevels = {
		[BZ["Borean Tundra"]]		= 380,
		[BZ["Dragonblight"]]		= 380,
		[BZ["Grizzly Hills"]]		= 380,
		[BZ["Howling Fjord"]]		= 380,
		[BZ["Zul'Drak"]]		= 380,
		[BZ["Crystalsong Forest"]]	= 405,
		[BZ["Dalaran"]]			= 430,
		[BZ["Sholazar Basin"]]		= 430,
		[BZ["Wintergrasp"]]		= 430,
		[BZ["Icecrown"]]		= 455,
		[BZ["The Storm Peaks"]]		= 455,
		[BZ["Ulduar"]]			= 455,
		[BZ["The Frozen Sea"]]		= 480,
	}
end

function Cartographer_ZoneInfo:OnEnable()
	if not self.frame then
		self.frame = CreateFrame("Frame", "CartographerZoneInfo", WorldMapFrame)

		self.frame.text = WorldMapFrameAreaFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
		local text = self.frame.text
		local font, size = GameFontHighlightLarge:GetFont()
		text:SetFont(font, size, "OUTLINE")
		text:SetPoint("TOP", WorldMapFrameAreaDescription, "BOTTOM", 0, -5)
		text:SetWidth(1024)
	end
	self.frame:Show()
end

function Cartographer_ZoneInfo:OnDisable()
	self.frame:Hide()
	WorldMapFrameAreaLabel:SetTextColor(1, 1, 1)
end

local lastZone
local t = {}
local old_WorldMapButton_OnUpdate = WorldMapButton_OnUpdate
function WorldMapButton_OnUpdate(...)
	old_WorldMapButton_OnUpdate(...)
	local self = Cartographer_ZoneInfo
	if not Cartographer:IsModuleActive(self) then
		return
	end
	if not self.frame then
		return
	end
	if not WorldMapDetailFrame:IsShown() or not WorldMapFrameAreaLabel:IsShown() then
		self.frame.text:SetText("")
		lastZone = nil
		return
	end

	local underAttack = false
	local zone = WorldMapFrameAreaLabel:GetText()
	if zone then
		zone = string.gsub(WorldMapFrameAreaLabel:GetText(), " |cff.+$", "")
		if WorldMapFrameAreaDescription:GetText() then
			underAttack = true
			zone = string.gsub(WorldMapFrameAreaDescription:GetText(), " |cff.+$", "")
		end
	end
	if GetCurrentMapContinent() == 0 then
		local c1, c2 = GetMapContinents()
		if zone == c1 or zone == c2 then
			WorldMapFrameAreaLabel:SetTextColor(1, 1, 1)
			self.frame.text:SetText("")
			return
		end
	end
	if not zone or not Tourist:IsZoneOrInstance(zone) then
		zone = WorldMapFrame.areaName
	end
	WorldMapFrameAreaLabel:SetTextColor(1, 1, 1)
	if zone and (Tourist:IsZoneOrInstance(zone) or Tourist:DoesZoneHaveInstances(zone)) then
		if not underAttack then
			WorldMapFrameAreaLabel:SetTextColor(Tourist:GetFactionColor(zone))
			WorldMapFrameAreaDescription:SetTextColor(1, 1, 1)
		else
			WorldMapFrameAreaLabel:SetTextColor(1, 1, 1)
			WorldMapFrameAreaDescription:SetTextColor(Tourist:GetFactionColor(zone))
		end
		local low, high = Tourist:GetLevel(zone)
		-- fishing changes
		local minFish
		if GetCurrentMapContinent() == 4 then
			minFish = fishingLevels[zone]
		else
			minFish = Tourist:GetFishingLevel(zone)
		end
		local fishing_skill_text
		if minFish then
			local numSkills = GetNumSkillLines();
			local skillName
			for i=1, numSkills do
				local _, skillRank
				skillName, _, _, skillRank, _, _, _, _, _, _, _, _, _ = GetSkillLineInfo(i);
				local fishingSpell = GetSpellInfo(7620) -- 7620 Fishing
				if skillName == fishingSpell then
					local r,g,b = 1,1,0
					local r1,g1,b1 = 1,0,0
					if minFish < skillRank then
						r1,g1,b1 = 0,1,0
					end
					fishing_skill_text = string.format("|cff%02x%02x%02x%s|r |cff%02x%02x%02x[%d]|r",r * 255, g * 255, b * 255,fishingSpell, r1 * 255, g1 * 255, b1 * 255, minFish)
				end
			end
			if not fishing_skill_text then
				minFish = nil
			end
		end
		-- end change
		if low > 0 and high > 0 then
			local r, g, b = Tourist:GetLevelColor(zone)
			local levelText
			if low == high then
				levelText = string.format(" |cff%02x%02x%02x[%d]|r", r * 255, g * 255, b * 255, high)
			else
				levelText = string.format(" |cff%02x%02x%02x[%d-%d]|r", r * 255, g * 255, b * 255, low, high)
			end
			local groupSize = Tourist:GetInstanceGroupSize(zone)
			local sizeText = ""
			if groupSize > 0 then
				sizeText = " " .. string.format(L["%d-man"], groupSize)
			end
			if not underAttack then
				WorldMapFrameAreaLabel:SetText(string.gsub(WorldMapFrameAreaLabel:GetText(), " |cff.+$", "") .. levelText .. sizeText)
			else
				WorldMapFrameAreaDescription:SetText(string.gsub(WorldMapFrameAreaDescription:GetText(), " |cff.+$", "") .. levelText .. sizeText)
			end
		end
		if Tourist:DoesZoneHaveInstances(zone) then
			if lastZone ~= zone then
				lastZone = zone
				table.insert(t, string.format("|cffffff00%s:|r", L["Instances"]))
				for instance in Tourist:IterateZoneInstances(zone) do
					local complex = Tourist:GetComplex(instance)
					local low, high = Tourist:GetLevel(instance)
					local r1, g1, b1 = Tourist:GetFactionColor(instance)
					local r2, g2, b2 = Tourist:GetLevelColor(instance)
					local groupSize = Tourist:GetInstanceGroupSize(instance)
					local altGroupSize = Tourist:GetInstanceAltGroupSize(instance)
					local name = instance
					if complex then
						name = complex .. " - " .. instance
					end
					if low == high then
						if (altGroupSize > 0) and (groupSize > 0) then
							table.insert(t, string.format("|cff%02x%02x%02x%s|r |cff%02x%02x%02x[%d]|r " .. L["%d-man"] .. L[" and "] .. L["%d-man"], r1 * 255, g1 * 255, b1 * 255, name, r2 * 255, g2 * 255, b2 * 255, high, groupSize, altGroupSize))
						elseif groupSize > 0 then
							table.insert(t, string.format("|cff%02x%02x%02x%s|r |cff%02x%02x%02x[%d]|r " .. L["%d-man"], r1 * 255, g1 * 255, b1 * 255, name, r2 * 255, g2 * 255, b2 * 255, high, groupSize))
						else
							table.insert(t, string.format("|cff%02x%02x%02x%s|r |cff%02x%02x%02x[%d]|r", r1 * 255, g1 * 255, b1 * 255, name, r2 * 255, g2 * 255, b2 * 255, high))
						end
					else
						if (altGroupSize > 0) and (groupSize > 0) then
							table.insert(t, string.format("|cff%02x%02x%02x%s|r |cff%02x%02x%02x[%d-%d]|r " .. L["%d-man"] .. L[" and "] .. L["%d-man"], r1 * 255, g1 * 255, b1 * 255, name, r2 * 255, g2 * 255, b2 * 255, low, high, groupSize, altGroupSize))
						elseif groupSize > 0 then
							table.insert(t, string.format("|cff%02x%02x%02x%s|r |cff%02x%02x%02x[%d-%d]|r " .. L["%d-man"], r1 * 255, g1 * 255, b1 * 255, name, r2 * 255, g2 * 255, b2 * 255, low, high, groupSize))
						else
							table.insert(t, string.format("|cff%02x%02x%02x%s|r |cff%02x%02x%02x[%d-%d]|r", r1 * 255, g1 * 255, b1 * 255, name, r2 * 255, g2 * 255, b2 * 255, low, high))
						end
					end
				end
				if minFish and fishing_skill_text then
					table.insert(t,fishing_skill_text)
				end
				self.frame.text:SetText(table.concat(t, "\n"))
				for k in pairs(t) do
					t[k] = nil
				end
			end
		else
			if minFish and fishing_skill_text then
				self.frame.text:SetText(fishing_skill_text)
			else
				self.frame.text:SetText("")
			end
			lastZone = nil
		end
	elseif not zone then
		lastZone = nil
		self.frame.text:SetText("")
	end
end

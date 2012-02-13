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

local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer-Battlegrounds")

L:AddTranslations("enUS", function() return {
	["Battlegrounds"] = true,
	["Module which provides maps of battlegrounds."] = true,
	
	["%d-man"] = true,
} end)

L:AddTranslations("deDE", function() return {
	["Battlegrounds"] = "Schlachtfelder",
	["Module which provides maps of battlegrounds."] = "Modul, das Schlachtfeldkarten zur Verfügung stellt.",
	
	["%d-man"] = "%d Spieler",
} end)

L:AddTranslations("frFR", function() return {
	["Battlegrounds"] = "Champs de bataille",
	["Module which provides maps of battlegrounds."] = "Module fournissant des cartes pour les champs de bataille.",
	
	["%d-man"] = "%dj",
} end)

L:AddTranslations("koKR", function() return {
	["Battlegrounds"] = "전장",
	["Module which provides maps of battlegrounds."] = "전장 지도 모듈을 제공합니다.",
	
	["%d-man"] = "%d명",
} end)

L:AddTranslations("zhTW", function() return {
	["Battlegrounds"] = "戰場",
	["Module which provides maps of battlegrounds."] = "提供戰場地圖的模組。",
	
	["%d-man"] = "%d人",
} end)

L:AddTranslations("zhCN", function() return {
	["Battlegrounds"] = "战场",
	["Module which provides maps of battlegrounds."] = "选择战场地图模块。",

	["%d-man"] = "%d人",
} end)

L:AddTranslations("esES", function() return {
	["Battlegrounds"] = "Campos de Batalla",
	["Module which provides maps of battlegrounds."] = "M\195\179dulo que provee mapas de los campos de batalla",
	
	["%d-man"] = "%d-hombres",
} end)

-- Russian Translation by StingerSoft (Eritnull aka Шептун)
L:AddTranslations("ruRU", function() return {
	["Battlegrounds"] = "Поля сражений",
	["Module which provides maps of battlegrounds."] = "Модуль отображает карты полей сражений",
	
	["%d-man"] = "%d-чел",
} end)

Cartographer_Battlegrounds = Cartographer:NewModule("Battlegrounds", "LibRockHook-1.0", "LibRockEvent-1.0")
local Cartographer_Battlegrounds = Cartographer_Battlegrounds

local BZ = Rock("LibBabble-Zone-3.0")
local BZL = BZ:GetLookupTable()
local BZR = BZ:GetReverseLookupTable()
local Tourist = Rock("LibTourist-3.0")

function Cartographer_Battlegrounds:OnInitialize()
	self.name = L["Battlegrounds"]
	self.title = L["Battlegrounds"]
	Cartographer.options.args.Battlegrounds = {
		name = L["Battlegrounds"],
		desc = L["Module which provides maps of battlegrounds."],
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

function Cartographer_Battlegrounds:OnEnable()
	self:AddHook("SetMapZoom")
	self:AddHook("SetMapToCurrentZone")
	self:AddHook("GetMapInfo")
	self:AddEventListener("Cartographer", "ChangeZone", "Cartographer_ChangeZone")
	self:AddHook("WorldMapZoomOutButton_OnClick")
	self:AddEventListener("PLAYER_LEVEL_UP")
	self:AddEventListener("LibRockEvent-1.0", "FullyInitialized", "PLAYER_LEVEL_UP")
	self:PLAYER_LEVEL_UP()
end

function Cartographer_Battlegrounds:PLAYER_LEVEL_UP()
	local bgs = {
		["Warsong Gulch"] = BZL["Warsong Gulch"],
		["Arathi Basin"] = BZL["Arathi Basin"],
		["Alterac Valley"] = BZL["Alterac Valley"],
		["Eye of the Storm"] = BZL["Eye of the Storm"],
	}

	Cartographer.gotoOptions.args.Battlegrounds = {
		name = L["Battlegrounds"],
		desc = L["Battlegrounds"],
		type = 'group',
		args = {},
		hidden = function() return not Cartographer:IsModuleActive(self) end
	}
	for i = 1, 4 do
		local validate = {}
		local func
		local name
		if i == 1 then
			func = Tourist.IsInKalimdor
			name = "Kalimdor"
		elseif i == 2 then
			func = Tourist.IsInEasternKingdoms
			name = "Eastern Kingdoms"
		elseif i == 3 then
			func = Tourist.IsInOutland
			name = "Outland"
		end
		if i ~= 4 then
			for k, v in pairs(bgs) do
				if func(Tourist, v) then
					validate[k] = v
				end
			end
		else
			name = "Unknown"
			for k, v in pairs(bgs) do
				if not Tourist:IsInKalimdor(v) and not Tourist:IsInEasternKingdoms(v) and not Tourist:IsInOutland(v) then
					validate[k] = v
				end
			end
		end

		for k,v in pairs(validate) do
			local text = v
			local low, high = Tourist:GetLevel(v)
			local r, g, b = Tourist:GetLevelColor(v)
			local levelText
			if low == 0 then
				levelText = ""
			elseif low == high then
				levelText = (" |cff%02x%02x%02x[%d]|r"):format(r * 255, g * 255, b * 255, high)
			else
				levelText = (" |cff%02x%02x%02x[%d-%d]|r"):format(r * 255, g * 255, b * 255, low, high)
			end
			local r, g, b = Tourist:GetFactionColor(v)
			text = ("|cff%02x%02x%02x%s|r%s"):format(r*255, g*255, b*255, text, levelText)
			local groupSize = Tourist:GetInstanceGroupSize(v)
			if groupSize > 0 then
				text = text .. " " .. L["%d-man"]:format(groupSize)
			end
			validate[k] = text
		end

		if next(validate) then
			local lname = i == 4 and UNKNOWN or BZL[name]
			Cartographer.gotoOptions.args.Battlegrounds.args[name] = {
				name = lname,
				desc = lname,
				type = 'text',
				get = function()
					return Cartographer:GetCurrentEnglishZoneName()
				end,
				set = "ShowBattleground",
				validate = validate,
				handler = self
			}
		end
	end
end

local currentBG = nil
function Cartographer_Battlegrounds:ShowBattleground(name)
	if currentBG == name then
		return
	end
	local current = GetRealZoneText()
	current = BZR[current]
	if current == name then
		currentBG = nil
		local map = self.hooks.GetMapInfo()
		if name == "Warsong Gulch" then
			if map == "WarsongGulch" then
				return
			end
		elseif name == "Arathi Basin" then
			if map == "ArathiBasin" then
				return
			end
		elseif name == "Alterac Valley" then
			if map == "AlteracValley" then
				return
			end
		elseif name == "Eye of the Storm" then
			if map == "NetherstormArena" then
				return
			end
		end
		self.hooks.SetMapToCurrentZone()
		return
	end
	local realName = name
	if name == "Warsong Gulch" then
		name = "WarsongGulch"
	elseif name == "Arathi Basin" then
		name = "ArathiBasin"
	elseif name == "Alterac Valley" then
		name = "AlteracValley"
	elseif name == "Eye of the Storm" then
		name = "NetherstormArena"
	else
		error(string.format("Cannot show unknown battleground %q", name), 2)
	end
	SetMapZoom(-1, nil)
	currentBG = name
	WorldMapFrame_Update()
	WorldMapZoomOutButton:Enable()
	Cartographer:DispatchEvent("ChangeZone", realName, BZL[realName])
	local AceEvent = Rock("AceEvent-2.0", true, true)
	if AceEvent then
		AceEvent:TriggerEvent("Cartographer_ChangeZone", realName, BZL[realName])
	end
	currentBG = name
end

function Cartographer_Battlegrounds:Cartographer_ChangeZone(ns, event, zone)
	currentBG = nil
end

function Cartographer_Battlegrounds:SetMapZoom(a, b)
	currentBG = nil
	return self.hooks.SetMapZoom(a, b)
end

function Cartographer_Battlegrounds:SetMapToCurrentZone()
	currentBG = nil
	return self.hooks.SetMapToCurrentZone()
end

function Cartographer_Battlegrounds:GetMapInfo()
	if currentBG then
		return currentBG
	end
	return self.hooks.GetMapInfo()
end

function Cartographer_Battlegrounds:WorldMapZoomOutButton_OnClick()
	if not currentBG then
		return self.hooks.WorldMapZoomOutButton_OnClick()
	end
	currentBG = nil
	self.hooks.SetMapZoom(0)
end

Cartographer = Rock:NewAddon("Cartographer", "LibRockConsole-1.0", "LibRockEvent-1.0", "LibRockTimer-1.0", "LibRockDB-1.0", "LibRockModuleCore-1.0", "LibRockHook-1.0", "LibRockConfig-1.0")
local Cartographer = Cartographer
Cartographer.revision = tonumber(string.sub("$Revision: 2320 $", 12, -3))
Cartographer.version = "r" .. Cartographer.revision
Cartographer.date = string.sub("$Date: 2009-04-17 00:45:12 +0000 (Fri, 17 Apr 2009) $", 8, 17)
Cartographer:SetDatabase("CartographerDB")

local Dewdrop = AceLibrary("Dewdrop-2.0")

local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer")
Cartographer.L = L
local Crayon = Rock("LibCrayon-3.0")
local BZ = Rock("LibBabble-Zone-3.0")
local BZL = BZ:GetLookupTable()
local BZH = BZ:GetUnstrictLookupTable()
local BZR = BZ:GetReverseLookupTable()
local Tablet = AceLibrary("Tablet-2.0")
local Tourist = Rock("LibTourist-3.0")
local LibGuild = Rock("LibGuild-1.0")
local AceEvent
local precondition, argCheck = Rock:GetContractFunctions("Cartographer", "precondition", "argCheck")

do
	-- hack, but Blizz is weird
	if WorldMapButton:GetScript("OnMouseUp") == WorldMapButton_OnClick then
		WorldMapButton:SetScript("OnMouseUp", function(self, ...)
			WorldMapButton_OnClick(self, ...)
		end)
	end
	if WorldMapButton:GetScript("OnUpdate") == WorldMapButton_OnUpdate then
		WorldMapButton:SetScript("OnUpdate", function(self, ...)
			WorldMapButton_OnUpdate(self, ...)
		end)
	end
end

L:AddTranslations("enUS", function() return {
	["Active"] = "Enabled", -- remove in a while (2006-12-08)
	["Enabled"] = true,
	["Suspend/resume this module."] = true,

	["Right-Click on map to zoom out"] = true,
	["Left-Click on map to zoom in"] = true,

	["Go to %s"] = true,

	["Open Cartographer menu"] = true,
	["Open location menu"] = true,

	["Distance:"] = true,

	["Close information pane"] = true,
	["Close this side informational pane"] = true,

	["Zones"] = true,
	["Cities"] = true,

	["%.0f yd"] = true,
	["%.0f m"] = true,
	["Cartographer"] = true,
	["Open alternate map"] = true,

	["Addon to manipulate the map."] = true,
} end)

L:AddTranslations("deDE", function() return {
	["Enabled"] = "Aktiviert",
	["Suspend/resume this module."] = "Aktiviert/Deaktiviert dieses Modul",

	["Right-Click on map to zoom out"] = "Rechtsklick auf die Karte verkleinert die Ansicht",
	["Left-Click on map to zoom in"] = "Linksklick auf die Karte vergr\195\182\195\159ert die Ansicht",

	["Go to %s"] = "Gehe zu %s",

	["Open Cartographer menu"] = "Cartographer-Men\195\188 \195\182ffnen",
	["Open location menu"] = "Positionsmen\195\188 \195\182ffnen",

	["Distance:"] = "Distanz:",

	["Close information pane"] = "Informationsfeld schlie\195\159en",
	["Close this side informational pane"] = "Das seitliche Informationsfeld schlie\195\159en",

	["Zones"] = "Zonen",
	["Cities"] = "St\195\164dte",
} end)

L:AddTranslations("frFR", function() return {
	["Active"] = "Activé",
	["Enabled"] = "Activé",
	["Suspend/resume this module."] = "Active ou non ce module.",

	["Right-Click on map to zoom out"] = "Clic-droit sur la carte pour effectuer un zoom arrière",
	["Left-Click on map to zoom in"] = "Clic-gauche sur la carte pour effectuer un zoom avant",

	["Go to %s"] = "Allez à %s",

	["Open Cartographer menu"] = "Ouvrir le menu Cartographer",
	["Open location menu"] = "Ouvrir le menu de situation",

	["Distance:"] = "Distance:",

	["Close information pane"] = "Fermer le panneau d'information",
	["Close this side informational pane"] = "Ferme ce panneau latéral d'information.",

	["Zones"] = "Zones",
	["Cities"] = "Capitales",

	["Addon to manipulate the map."] = "Addon de manipulation de la carte.",
} end)

L:AddTranslations("koKR", function() return {
	["Active"] = "사용",
	["Enabled"] = "사용중",
	["Suspend/resume this module."] = "현재 모듈을 사용하거나 중지합니다.",

	["Right-Click on map to zoom out"] = "우-클릭 : 축소",
	["Left-Click on map to zoom in"] = "좌-클릭 : 확대",

	["Go to %s"] = "%s 바로가기",

	["Open Cartographer menu"] = "Cartographer 메뉴 열기",
	["Open location menu"] = "위치 메뉴 열기",

	["Distance:"] = "거리:",

	["Close information pane"] = "정보창 닫기",
	["Close this side informational pane"] = "이 정보창을 종료합니다.",

	["Zones"] = "지역",
	["Cities"] = "도시",

	["%.0f yd"] = "%.0f yd",
	["%.0f m"] = "%.0f 미터",
	["Cartographer"] = "Cartographer",
	["Open alternate map"] = "교체된 지도 열기",

	["Addon to manipulate the map."] = "월드맵 확장 애드온",
} end)

--Ananhaid checkpoint.($Date: 2009-04-17 00:45:12 +0000 (Fri, 17 Apr 2009) $)
L:AddTranslations("zhCN", function() return {
	["Active"] = "启用", -- remove in a while (2006-12-08)
	["Enabled"] = "启用",
	["Suspend/resume this module."] = "暂停/继续使用该模块。",

	["Right-Click on map to zoom out"] = "右击：放大地图",
	["Left-Click on map to zoom in"] = "左击：缩小地图",

	["Go to %s"] = "回到%s",

	["Open Cartographer menu"] = "打开 Cartographer 菜单",
	["Open location menu"] = "打开位置菜单",

	["Distance:"] = "距离：",

	["Close information pane"] = "关闭信息面板",
	["Close this side informational pane"] = "关闭这个侧信息面板。",

	["Zones"] = "区域",
	["Cities"] = "城市",

	["%.0f yd"] = "%.0f 码",
	["%.0f m"] = "%.0f 米",
	["Cartographer"] = "Cartographer",
	["Open alternate map"] = "打开替代地图",

	["Addon to manipulate the map."] = "增强地图处理功能。",
} end)

L:AddTranslations("zhTW", function() return {
	["Active"] = "啟用", -- remove in a while (2006-12-08)
	["Enabled"] = "啟用",
	["Suspend/resume this module."] = "暫停或繼續使用本模組。",

	["Right-Click on map to zoom out"] = "|cffeda55f右擊: |r放大地圖",
	["Left-Click on map to zoom in"] = "|cffeda55f左擊: |r縮小地圖",

	["Go to %s"] = "回到%s",

	["Open Cartographer menu"] = "開啟 Cartographer 選單",
	["Open location menu"] = "開啟位置選單",

	["Distance:"] = "距離:",

	["Close information pane"] = "關閉資訊面板",
	["Close this side informational pane"] = "關閉這個側邊資訊面板",

	["Zones"] = "地區",
	["Cities"] = "城市",

	["%.0f yd"] = "%.0f碼",
	["%.0f m"] = "%.0f米",
	["Cartographer"] = "Cartographer",
	["Open alternate map"] = "開啟替代地圖",

	["Addon to manipulate the map."] = "增強地圖的處理功能。",
} end)

L:AddTranslations("esES", function() return {
	["Active"] = "Activo", -- remove in a while (2006-12-08)
	["Enabled"] = "Activado",
	["Suspend/resume this module."] = "Parar/Continuar este módulo",

	["Right-Click on map to zoom out"] = "Click-Derecho en el mapa para Alejarte",
	["Left-Click on map to zoom in"] = "Click-Izquierdo en el mapa para Acercarte",

	["Go to %s"] = "Ir a %s",

	["Open Cartographer menu"] = "Abrir el menú de Cartographer",
	["Open location menu"] = "Abrir el menú de lugares",

	["Distance:"] = "Distancia:",

	["Close information pane"] = "Cerrar panel de información",
	["Close this side informational pane"] = "Cierra el panel de información de este lado",

	["Zones"] = "Zonas",
	["Cities"] = "Ciudades",

	["Open alternate map"] = "Abrir mapa alternativo",

	["Addon to manipulate the map."] = "Addon para manipular el mapa.",
} end)

-- Russian Translation by StingerSoft (Eritnull aka Шептун)
L:AddTranslations("ruRU", function() return {
	["Active"] = "Активен",
	["Enabled"] = "Включен",
	["Suspend/resume this module."] = "Отключить/Запустить данный модуль",

	["Right-Click on map to zoom out"] = "ПКЛ по карте для уменьшения масштаба",
	["Left-Click on map to zoom in"] = "ЛКМ по карте для увеличения масштаба",

	["Go to %s"] = "Перейти на %s",

	["Open Cartographer menu"] = "Открыть меню Картографа",
	["Open location menu"] = "Открыть меню локации",

	["Distance:"] = "Дистанция:",

	["Close information pane"] = "Закрыть панель информации",
	["Close this side informational pane"] = "Закрыть боковую панель информации",

	["Zones"] = "Зоны",
	["Cities"] = "Города",
	["%.0f yd"] = "%.0f м",
	["%.0f m"] = "%.0f м",
	["Cartographer"] = "Картограф",
	["Open alternate map"] = "Открыть альтернативную карту",

	["Addon to manipulate the map."] = "Аддон для монипуляции картой.",
} end)

BINDING_HEADER_CARTOGRAPHER = L["Cartographer"]
BINDING_NAME_CARTOGRAPHER_OPENALTERNATEMAP = L["Open alternate map"]

local PLAYER = PLAYER or "PLAYER"
local PARTY = PARTY or "PARTY"
local RAID = RAID or "RAID"
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

local yardString = (GetLocale() == "enUS" or GetLocale() == "zhTW" or GetLocale() == "zhCN") and L["%.0f yd"] or L["%.0f m"]

function Cartographer:AcquireDBNamespace(...)
	return self:GetDatabaseNamespace(...)
end
function Cartographer:RegisterDefaults(...)
	return self:SetDatabaseNamespaceDefaults(...)
end

Cartographer.options = {
	type = 'group',
	name = L["Cartographer"],
	desc = L["Addon to manipulate the map."],
	icon = [[Interface\WorldMap\UI-World-Icon]],
	args = {
	},
}

--[[
local function ConvertToRockConfig(opt)
	if opt.type == "group" then
		for k, v in pairs(opt.args) do
			ConvertToRockConfig(v)
		end
	elseif opt.type == "toggle" then
		opt.type = "boolean"
	elseif opt.type == "range" then
		opt.type = "number"
	elseif opt.type == "text" then
		if not opt.validate or type(opt.validate) == "function" or type(opt.validate) == "string" then
			opt.type = "string"
		else
			if opt.multiToggle then
				opt.type = "multichoice"
				opt.multiToggle = nil
			else
				opt.type = "choice"
			end
			opt.choices, opt.validate = opt.validate, nil
			opt.choiceDescs, opt.validateDesc = opt.validateDesc, nil
		end
	elseif opt.type == "execute" then
		if not opt.buttonText then
			opt.buttonText = _G.OKAY or "Okay"
		end
	end
end
setmetatable(Cartographer.options.args, {__newindex=function(self, key, value)
	if type(value) == "table" then
		ConvertToRockConfig(value)
	end
	rawset(self, key, value)
end})
]]
--Dewdrop:InjectAceOptionsTable(Cartographer, Cartographer.options)
--Cartographer.options.args.standby = nil

function Cartographer:OnInitialize()
	if not self.db.account.firstTimeWoW21 then
		self.db.account.firstTimeWoW21 = true
		SetCVar("scriptErrors", "1")
	end

	self.gotoOptions = {
		type = 'group',
		args = {
			player = {
				name = string.format(L["Go to %s"], GetRealZoneText()),
				desc = string.format(L["Go to %s"], GetRealZoneText()),
				type = 'execute',
				func = function()
					SetMapToCurrentZone()
				end,
				order = 1
			}
		},
	}
	local original_WorldMapButton_OnClick = WorldMapButton_OnClick
	-- override of function found in FrameXML/WorldMapFrame.lua:550
	function WorldMapButton_OnClick(button, mouseButton)
		if mouseButton == "LeftButton" or mouseButton == "RightButton" then
			return original_WorldMapButton_OnClick(button, mouseButton)
		end
	end

	self.lodMenus = setmetatable({}, {__mode = 'k'})

	WorldMapFrameCloseButton:SetScript("OnClick", function()
		ToggleFrame(WorldMapFrame)
	end)

	self:SetConfigTable(self.options)
	self:SetConfigSlashCommand("/Cartographer", "/Cart")
	self.options.extraArgs.active = nil
end

local magnifyingGlassTexts = { L["Right-Click on map to zoom out"], L["Left-Click on map to zoom in"] }
local currentLeftSide, currentRightSide
local dummyFrame
function Cartographer:OnEnable()
	WorldMapContinentDropDown:Hide()
	WorldMapZoneDropDown:Hide()

	local CartographerOptionsButton = CreateFrame("Button", "CartographerOptionsButton", WorldMapFrame, "UIPanelButtonTemplate")
	CartographerOptionsButton:SetText(L["Cartographer"])
	local width = CartographerOptionsButton:GetTextWidth() + 30
	if width < 110 then
		width = 110
	end
	CartographerOptionsButton:SetWidth(width)
	CartographerOptionsButton:SetHeight(22)
	WorldMapZoomOutButton:Hide()
	CartographerOptionsButton:SetScript("OnClick", function()
		self:OpenConfigMenu()
--[[		Dewdrop:Register(this,
			'children', self.options,
			'dontHook', true,
			'point', "TOPRIGHT",
			'relativePoint', "BOTTOMRIGHT"
		)
		this:SetScript("OnClick", function()
			if Dewdrop:IsOpen(this) then
				Dewdrop:Close()
			else
				Dewdrop:Open(this)
			end
		end)
		this:GetScript("OnClick")()]]
	end)
	CartographerOptionsButton:SetScript("OnEnter", function(this)
		GameTooltip_SetDefaultAnchor(GameTooltip, this)
		GameTooltip:SetText(L["Open Cartographer menu"], HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
		GameTooltip:Show()
	end)
	CartographerOptionsButton:SetScript("OnLeave", function(this)
		GameTooltip:Hide()
	end)
	self:AddMapButton(CartographerOptionsButton, 1)

	local CartographerGoToButton = CreateFrame("Button", "CartographerGoToButton", WorldMapFrame, "UIPanelButtonTemplate")
	CartographerGoToButton:SetText(UNKNOWN)
	local width = CartographerGoToButton:GetTextWidth() + 30
	if width < 220 then
		width = 220
	end
	CartographerGoToButton:SetWidth(width)
	CartographerGoToButton:SetHeight(22)
	CartographerGoToButton:SetScript("OnClick", function()
		Dewdrop:Register(this,
			'children', self.gotoOptions,
			'dontHook', true,
			'point', "TOPRIGHT",
			'relativePoint', "BOTTOMRIGHT"
		)
		this:SetScript("OnClick", function()
			if Dewdrop:IsOpen(this) then
				Dewdrop:Close()
			else
				Dewdrop:Open(this)
			end
		end)
		this:GetScript("OnClick")()
	end)
	CartographerGoToButton:SetScript("OnEnter", function(this)
		GameTooltip_SetDefaultAnchor(GameTooltip, this)
		GameTooltip:SetText(L["Open location menu"], HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
		GameTooltip:Show()
	end)
	CartographerGoToButton:SetScript("OnLeave", function(this)
		GameTooltip:Hide()
	end)
	self:AddMapButton(CartographerGoToButton, 0)

	self:AddSecureHook(WorldMapFrame, "Hide", "WorldMapFrame_Hide")
	self:AddSecureHook(WorldMapFrame, "Show", "WorldMapFrame_Show")
	self:AddEventListener("Cartographer", "MapOpened", "Cartographer_MapOpened")
	self:AddEventListener("Cartographer", "MapClosed", "Cartographer_MapClosed")
	self:AddEventListener("Cartographer", "ChangeZone", "Cartographer_ChangeZone")
	self:AddEventListener("WORLD_MAP_UPDATE")
	self:AddEventListener("ZONE_CHANGED_NEW_AREA")
	self:AddEventListener("MINIMAP_ZONE_CHANGED")
	self:AddEventListener("LibRock-1.0", "FullyInitialized")
	AceEvent = Rock("AceEvent-2.0", true, true)
	if not AceEvent then
		self:AddEventListener("LibRock-1.0", "LibraryLoad", function(major, library)
			if major == "AceEvent-2.0" then
				AceEvent = library
				self:RemoveEventListener("LibRock-1.0", "LibraryLoad")
			end
		end)
	end

	self:Cartographer_ChangeZone("Cartographer", "ChangeZone", self:GetCurrentEnglishZoneName(), self:GetCurrentLocalizedZoneName())

	WorldMapMagnifyingGlassButton:SetText(table.concat(magnifyingGlassTexts, "\n"))

	if (not GetBindingAction("ALT-M") or GetBindingAction("ALT-M") == "") and not GetBindingKey("CARTOGRAPHER_OPENALTERNATEMAP") then
		SetBinding("ALT-M", "CARTOGRAPHER_OPENALTERNATEMAP")
	end

	for i = 1, 2 do
		local side = i == 1 and "LEFT" or "RIGHT"
		local s = "Cartographer_" .. side .. "Side"
		Tablet:Register(s,
			'data', {},
			'children', side == "LEFT" and function()
				if currentLeftSide then
					currentLeftSide:OnCartographerLeftTabletRequest()
				end
			end or function()
				if currentRightSide then
					currentRightSide:OnCartographerRightTabletRequest()
				end
			end,
			'clickable', true,
			'dontHook', true,
			'cantAttach', true,
			'frameLevel', 11,
			'movable', false,
			'hideWhenEmpty', true,
			'parent', WorldMapFrame,
			'showTitleWhenDetached', true,
			'showHintWhenDetached', true,
			'positionFunc', side == "LEFT" and function(this)
				this:SetPoint("TOPLEFT", WorldMapDetailFrame, "TOPLEFT")
				this:SetPoint("BOTTOMLEFT", WorldMapDetailFrame, "BOTTOMLEFT")
			end or function(this)
				this:SetPoint("TOPRIGHT", WorldMapDetailFrame, "TOPRIGHT")
				this:SetPoint("BOTTOMRIGHT", WorldMapDetailFrame, "BOTTOMRIGHT")
			end,
			'menu', function()
				Dewdrop:AddLine(
					'text', L["Close information pane"],
					'tooltipTitle', L["Close information pane"],
					'tooltipText', L["Close this side informational pane"],
					'arg1', self,
					'func', "ReleaseSideTablet",
					'arg2', side,
					'closeWhenClicked', true
				)
			end
		)
		if WorldMapFrame:IsShown() then
			Tablet:Open(s)
		end
	end

	self:ConfigureUnitPOIs()

	self:configureYards()

	self:LoadLoadOnDemandModules()

	self:AddEventListener("PLAYER_LEVEL_UP")
	self:AddEventListener("LibRockEvent-1.0", "FullyInitialized")
	self:PLAYER_LEVEL_UP()
end

function Cartographer:PLAYER_LEVEL_UP()
	self.gotoOptions.args.Cities = {
		name = L["Cities"],
		desc = L["Cities"],
		type = 'group',
		args = {}
	}
	self.gotoOptions.args.Zones = {
		name = L["Zones"],
		desc = L["Zones"],
		type = 'group',
		args = {}
	}
	for i,continent in ipairs { GetMapContinents() } do
		local i = i
		local validate = { GetMapZones(i) }
		local zones = {}
		local cities = {}
		for i, v in ipairs(validate) do
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
			if Tourist:IsCity(v) then
				cities[v] = text
			else
				zones[v] = text
			end
			validate[v] = i
		end
		self.gotoOptions.args.Zones.args[BZR[continent]] = {
			name = continent,
			desc = continent,
			type = 'text',
			validate = zones,
			get = function() return self:GetCurrentInstance() or GetCurrentMapContinent() == i and validate[GetCurrentMapZone()] end,
			set = function(text)
				SetMapZoom(i, validate[text])
			end,
		}
		self.gotoOptions.args.Cities.args[BZR[continent]] = {
			name = continent,
			desc = continent,
			type = 'text',
			validate = cities,
			get = function() return self:GetCurrentInstance() or GetCurrentMapContinent() == i and validate[GetCurrentMapZone()] end,
			set = function(text)
				SetMapZoom(i, validate[text])
			end,
		}
	end
end

function Cartographer:ConfigureUnitPOIs()
	local old = WorldMapParty1:GetScript("OnLeave")
	function WorldMapUnit_OnLeave()
		old(this)
	end
	local function func(this, ...)
		WorldMapUnit_OnLeave()
	end
	WorldMapPlayer:SetScript("OnLeave", func)
	local myServer = GetRealmName():trim()
	function WorldMapPlayer:OnTabletRequest()
		local kind = ""
		if self.unit == "player" then
			kind = PLAYER .. ": "
		elseif self.unit:find("^party") then
			kind = PARTY .. ": "
		elseif self.unit:find("^raid") then
			kind = RAID .. ": "
		end
		local name, server = self.name
		if not name then
			name, server = UnitName(self.unit)
		end
		if server and server ~= myServer and server ~= "" then
			name = name .. '-' .. server
		end
		Tablet:SetTitle(kind .. name)
		if self.unit then
			local cat = Tablet:AddCategory('columns', 2)
			local class, filename = UnitClass(self.unit)
			local color = RAID_CLASS_COLORS[filename]
			cat:AddLine(
				'text', CLASS .. ":",
				'text2', class,
				'text2R', color.r,
				'text2G', color.g,
				'text2B', color.b
			)
			local level = UnitLevel(self.unit)
			local playerlevel = UnitLevel('player')
			local r, g, b = Crayon:GetThresholdColorTrivial(level, playerlevel + 6, playerlevel - 6)
			cat:AddLine(
				'text', LEVEL .. ":",
				'text2', level,
				'text2R', r,
				'text2G', g,
				'text2B', b
			)
			cat:AddLine(
				'text', RACE .. ":",
				'text2', (UnitRace(self.unit)),
				'text2R', UnitRace(self.unit) == UnitRace('player') and 0 or 1,
				'text2G', 1,
				'text2B', 0
			)
			local gname, grank, granknum = GetGuildInfo(self.unit)
			if not gname then
				if LibGuild:HasMember(name) then
					gname = LibGuild:GetGuildName()
					grank = LibGuild:GetRank(name)
					granknum = LibGuild:GetRankIndex(name)
				end
			end
			if gname then
				local mygname, mygrank, mygranknum = GetGuildInfo('player')
				local r, g, b = 1, 1, 0
				if mygname == gname then
					r, g, b = 0, 1, 0
				end
				cat:AddLine(
					'text', GUILD .. ":",
					'text2', "<" .. gname .. ">",
					'text2R', r,
					'text2G', g,
					'text2B', b
				)
				if mygname == gname then
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
				end
				cat:AddLine(
					'text', RANK .. ":",
					'text2', grank,
					'text2R', r,
					'text2G', g,
					'text2B', b
				)
				if mygname == gname then
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
				end
			end
			local x, y = GetPlayerMapPosition(self.unit)
			local dist = Cartographer:GetDistanceToPoint(x, y, Cartographer:GetCurrentLocalizedZoneName())

			if dist and dist >= 1 then
				cat:AddLine(
					'text', L["Distance:"],
					'text2', yardString:format(dist)
				)
			end
		end
	end
	WorldMapParty1.OnTabletRequest = WorldMapPlayer.OnTabletRequest
	WorldMapRaid1.OnTabletRequest = WorldMapPlayer.OnTabletRequest
	local tmp = {}
	function WorldMapPlayer:OnLineRequest(cat)
		if self.unit == "player" then
			tmp[#tmp+1] = PLAYER .. ": "
		elseif self.unit:find("^party") then
			tmp[#tmp+1] = PARTY .. ": "
		elseif self.unit:find("^raid") then
			tmp[#tmp+1] = RAID .. ": "
		end
		if self.name then
			tmp[#tmp+1] = self.name
		else
			local name, server = UnitName(self.unit)
			tmp[#tmp+1] = name
			if server and server ~= myServer and server ~= "" then
				tmp[#tmp+1] = "-"
				tmp[#tmp+1] = server
			end
			tmp[#tmp+1] = " - |cff"
			local level = UnitLevel(self.unit)
			local playerlevel = UnitLevel('player')
			tmp[#tmp+1] = Crayon:GetThresholdHexColorTrivial(level, playerlevel + 6, playerlevel - 6)
			tmp[#tmp+1] = tostring(level)
			tmp[#tmp+1] = "|r |cff"
			local class, filename = UnitClass(self.unit)
			local color = RAID_CLASS_COLORS[filename]
			tmp[#tmp+1] = ("%02x%02x%02x"):format(color.r*255, color.g*255, color.b*255)
			tmp[#tmp+1] = class
			tmp[#tmp+1] = "|r"
			local gname = GetGuildInfo(self.unit)
			if not gname then
				if LibGuild:HasMember(name) then
					gname = LibGuild:GetGuildName()
				end
			end
			if gname then
				local mygname = LibGuild:GetGuildName()
				tmp[#tmp+1] = " - |cff"
				if gname == mygname then
					tmp[#tmp+1] = "00ff00"
				else
					tmp[#tmp+1] = "ffff00"
				end
				tmp[#tmp+1] = "<"
				tmp[#tmp+1] = gname
				tmp[#tmp+1] = ">|r"
			end
		end
		local text = table.concat(tmp, "")
		for i = 1, #tmp do
			tmp[i] = nil
		end
		if self.unit == "player" then
			return 'text', text,
				'hasCheck', true,
				'checked', false
		else
			local tex = _G[self:GetName() .. "Icon"]
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
	end
	WorldMapPlayer:SetFrameLevel(WorldMapPlayer:GetFrameLevel()+5)
	PlayerArrowFrame:SetFrameLevel(PlayerArrowFrame:GetFrameLevel()+5)
	PlayerArrowEffectFrame:SetFrameLevel(PlayerArrowEffectFrame:GetFrameLevel()+5)
	WorldMapParty1.OnLineRequest = WorldMapPlayer.OnLineRequest
	WorldMapRaid1.OnLineRequest = WorldMapPlayer.OnLineRequest
	for i = 1, 4 do
		local poi = _G["WorldMapParty" .. i]
		poi:SetScript("OnLeave", func)
		poi.OnTabletRequest = WorldMapParty1.OnTabletRequest
		poi.OnLineRequest = WorldMapParty1.OnLineRequest
		poi:SetFrameLevel(poi:GetFrameLevel()+3)
	end
	for i = 1, 40 do
		local poi = _G["WorldMapRaid" .. i]
		poi:SetScript("OnLeave", func)
		poi.OnTabletRequest = WorldMapRaid1.OnTabletRequest
		poi.OnLineRequest = WorldMapRaid1.OnLineRequest
		poi:SetFrameLevel(poi:GetFrameLevel()+3)
	end

	dummyFrame = CreateFrame("Frame")
	if not self.pois then
		self.pois = {}
	end
	local tmp = {}
	self.tooltipData = {}
	Tablet:Register(dummyFrame,
		'children', function()
			-- Check player
			if MouseIsOver(WorldMapPlayer) then
				tmp[#tmp+1] = WorldMapPlayer
			end

			-- Check party
			for i=1, MAX_PARTY_MEMBERS do
				local unitButton = _G["WorldMapParty"..i]
				if unitButton:IsVisible() and MouseIsOver(unitButton) then
					tmp[#tmp+1] = unitButton
				end
			end

			--Check Raid
			for i=1, MAX_RAID_MEMBERS do
				local unitButton = _G["WorldMapRaid"..i]
				if unitButton:IsVisible() and MouseIsOver(unitButton) then
					tmp[#tmp+1] = unitButton
				end
			end

			for frame in pairs(self.pois) do
				if frame:IsVisible() and MouseIsOver(frame) then
					tmp[#tmp+1] = frame
				end
			end

			if #tmp == 1 then
				tmp[1]:OnTabletRequest()
				tmp[1] = nil
			elseif #tmp > 1 then
				local cat = Tablet:AddCategory()
				for i = 1, #tmp do
					cat:AddLine(tmp[i]:OnLineRequest())
					tmp[i] = nil
				end
			end
		end,
		'point', function(parent)
			local x, y = GetCursorPosition()
			local cx, cy = GetScreenWidth()/2, GetScreenHeight()/2
			if x > cx then
				if y < cy then
					return "BOTTOMRIGHT"
				else
					return "TOPRIGHT"
				end
			else
				if y < cy then
					return "BOTTOMLEFT"
				else
					return "TOPLEFT"
				end
			end
		end,
		'relativePoint', function(parent)
			local x, y = GetCursorPosition()
			local cx, cy = GetScreenWidth()/2, GetScreenHeight()/2
			if x > cx then
				if y < cy then
					return "TOPLEFT"
				else
					return "BOTTOMLEFT"
				end
			else
				if y < cy then
					return "TOPRIGHT"
				else
					return "BOTTOMRIGHT"
				end
			end
		end,
		'dontHook', true,
		'data', self.tooltipData
	)
	self:AddHook("WorldMapUnit_OnEnter")
	self:AddHook("WorldMapUnit_OnLeave")
	self:AddRepeatingTimer(1, "UpdateTooltip")
end

do
	local t = {}
	local function tmp(...)
		for i = 1, #t do
			t[i] = nil
		end
		for i = 1, select('#', ...) do
			t[i] = select(i, ...)
		end
		return t
	end
	function Cartographer:LoadLoadOnDemandModules()
		for i = 1, GetNumAddOns() do
			local name, _, notes, enabled, loadable = GetAddOnInfo(i)
			if IsAddOnLoadOnDemand(i) and enabled and loadable and not IsAddOnLoaded(i) then
				local shownName = GetAddOnMetadata(name, "X-Name")
				local moduleName = GetAddOnMetadata(name, "X-ModuleName")
				if shownName and moduleName then
					Cartographer.options.args[moduleName] = nil
					for _,dep in ipairs(tmp(GetAddOnDependencies(name))) do
						if dep == "Cartographer" then
							if self:IsModuleActive(moduleName, true) then
								local success, ret = pcall(LoadAddOn, name)
								if not success then
									geterrorhandler()(ret)
								end
							else
								Cartographer.options.args[moduleName] = {
									type = 'group',
									name = shownName,
									desc = notes,
									args = {
										toggle = {
											name = L["Enabled"],
											desc = L["Suspend/resume this module."],
											type = "toggle",
											order = -1,
											get = function() return false end,
											set = function()
												Cartographer.options.args[moduleName] = nil
												local success, ret = pcall(LoadAddOn, name)
												if not success then
													geterrorhandler()(ret)
												else
													Cartographer:ToggleModuleActive(moduleName)
												end
											end
										},
									}
								}
								self.lodMenus[Cartographer.options.args[moduleName]] = true
							end
							break
						end
					end
				end
			end
		end
		if type(self.lodMenus) == 'table' and next(self.lodMenus) then
			self:AddEventListener("ADDON_LOADED")
		end
	end
end

function Cartographer:ADDON_LOADED(ns, event, addon)
	local moduleName = GetAddOnMetadata(addon, "X-ModuleName")
	if moduleName then
		if self.lodMenus[Cartographer.options.args[moduleName]] then
			Cartographer.options.args[moduleName] = nil
		end
	end
end

local isOpen = false
function Cartographer:WorldMapUnit_OnEnter()
	if not Dewdrop:IsOpen(this) then
		isOpen = true
		Tablet:Open(this, dummyFrame)
	end
end

function Cartographer:WorldMapUnit_OnLeave()
	isOpen = false
	Tablet:Close()
end

function Cartographer:UpdateTooltip()
	self:GetCurrentPlayerPosition()
	if isOpen then
		Tablet:Refresh(dummyFrame)
	end
end

function Cartographer:AddPOI(frame)
	if not self.pois then
		self.pois = {}
	end
	self.pois[frame] = true
end

local previouslyShown = false
function Cartographer:WorldMapFrame_Hide(this)
	if previouslyShown then
		previouslyShown = false
		self:DispatchEvent("MapClosed")
		if AceEvent then
			AceEvent:TriggerEvent("Cartographer_MapClosed")
		end
	end
	if BattlefieldMinimap then
		BattlefieldMinimap:SetScript("OnUpdate", BattlefieldMinimap_OnUpdate)
	end
end

function Cartographer:WorldMapFrame_Show(this)
	if not previouslyShown then
		previouslyShown = true
		self:DispatchEvent("MapOpened")
		if AceEvent then
			AceEvent:TriggerEvent("Cartographer_MapOpened")
		end
	end
	if BattlefieldMinimap then
		BattlefieldMinimap:SetScript("OnUpdate", nil)
	end
end

function Cartographer:WORLD_MAP_UPDATE()
	self:GetCurrentPlayerPosition()
	self:DispatchEvent("ChangeZone", self:GetCurrentEnglishZoneName(), self:GetCurrentLocalizedZoneName())
	if AceEvent then
		AceEvent:TriggerEvent("Cartographer_ChangeZone", self:GetCurrentEnglishZoneName(), self:GetCurrentLocalizedZoneName())
	end
end

local function func(self)
	if currentLeftSide then
		Tablet:Open("Cartographer_LEFTSide")
--		Tablet:Refresh("Cartographer_LEFTSide")
	end
	if currentRightSide then
		Tablet:Open("Cartographer_RIGHTSide")
	end
end

function Cartographer:Cartographer_MapOpened()
	self:AddTimer(0, func, self)
	Tablet:Refresh("Cartographer_LEFTSide")
	Tablet:Refresh("Cartographer_RIGHTSide")
end

function Cartographer:Cartographer_MapClosed()
	if Dewdrop:IsOpen(CartographerGoToButton) or Dewdrop:IsOpen(CartographerOptionsButton) then
		Dewdrop:Close()
	end
	SetMapToCurrentZone()
end

local continents = { GetMapContinents() }
continents[0] = BZL["Azeroth"]
continents[-1] = BZL["Cosmic map"]

function Cartographer:Cartographer_ChangeZone(ns, event, zone, localZone)
	if localZone then
		CartographerGoToButton:SetText(localZone)
		Cartographer.gotoOptions.args.player.name = string.format(L["Go to %s"], GetRealZoneText())
		Cartographer.gotoOptions.args.player.desc = Cartographer.gotoOptions.args.player.name
	else
		CartographerGoToButton:SetText(continents[GetCurrentMapContinent()] or UNKNOWN)
	end
end

function Cartographer:OnProfileEnable(alpha, bravo)
	self:LoadLoadOnDemandModules()
	for _,module in self:IterateModules() do
		if self:IsModuleActive(module) and type(module.OnProfileEnable) == "function" then
			module:OnProfileEnable(alpha, bravo)
		end
	end
end

function Cartographer:AddToMagnifyingGlass(text)
	for _,v in ipairs(magnifyingGlassTexts) do
		if v == text then
			error(string.format("Cannot add %q to magnifying glass, it already exists", text), 2)
		end
	end
	table.insert(magnifyingGlassTexts, text)
	WorldMapMagnifyingGlassButton:SetText(table.concat(magnifyingGlassTexts, "\n"))
end

function Cartographer:RemoveFromMagnifyingGlass(text)
	local id
	for i,v in ipairs(magnifyingGlassTexts) do
		if v == text then
			id = i
			break
		end
	end
	if not id then
		error(string.format("Cannot remove %q from magnifying glass, it does not exist", text), 2)
	end
	table.remove(magnifyingGlassTexts, id)

	WorldMapMagnifyingGlassButton:SetText(table.concat(magnifyingGlassTexts, "\n"))
end

local mapButtons = {}

local function my_sort(alpha, bravo)
	if not alpha or not bravo then
		return false
	end
	return mapButtons[alpha] < mapButtons[bravo]
end

local tmp = {}
local function refreshMapButtons()
	for k in pairs(mapButtons) do
		table.insert(tmp, k)
	end

	table.sort(tmp, my_sort)

	local width = -10
	for _,frame in ipairs(tmp) do
		width = width + frame:GetWidth() + 10
	end

	local last = tmp[1]
	last:SetPoint("BOTTOM", WorldMapZoomOutButton, "BOTTOM", 0, 0)
	last:SetPoint("LEFT", WorldMapDetailFrame, "CENTER", -width/2, 0)
	for i = 2, #tmp do
		local this = tmp[i]
		this:SetPoint("LEFT", last, "RIGHT", 10, 0)
		last = this
	end

	for k in pairs(tmp) do
		tmp[k] = nil
	end
end

function Cartographer:AddMapButton(frame, order)
	if mapButtons[frame] then
		error(string.format("Cannot add %q to map buttons, it already exists", frame:GetName() or "anonymous frame"), 2)
	end
	mapButtons[frame] = order

	refreshMapButtons()
end

function Cartographer:RemoveMapButton(frame)
	if not mapButtons[frame] then
		error(string.format("Cannot remove %q from map buttons, it does not exist", frame:GetName() or "anonymous frame"), 2)
	end
	mapButtons[frame] = nil

	refreshMapButtons()
end

local currentInstance
function Cartographer:SetCurrentInstance(zone)
	if currentInstance ~= zone then
		currentInstance = zone
		self:DispatchEvent("SetCurrentInstance", zone)
		if AceEvent then
			AceEvent:TriggerEvent("Cartographer_SetCurrentInstance", zone)
		end
		self:DispatchEvent("ChangeZone", self:GetCurrentEnglishZoneName(), self:GetCurrentLocalizedZoneName())
		if AceEvent then
			AceEvent:TriggerEvent("Cartographer_ChangeZone", self:GetCurrentEnglishZoneName(), self:GetCurrentLocalizedZoneName())
		end
		WorldMapLevelDropDown_Update()
	end
end

function Cartographer:GetCurrentInstance()
	return currentInstance
end

local instanceWorldMapButton
function Cartographer:RegisterInstanceWorldMapButton(frame)
	instanceWorldMapButton = frame
	self:DispatchEvent("RegisterInstanceWorldMapButton", frame)
	if AceEvent then
		AceEvent:TriggerEvent("Cartographer_RegisterInstanceWorldMapButton", frame)
	end
end

function Cartographer:GetInstanceWorldMapButton()
	return instanceWorldMapButton
end

local mapZones = setmetatable({}, {__index = function(self, key)
	self[key] = { GetMapZones(key) }
	return self[key]
end })

function Cartographer:GetCurrentLocalizedZoneName()
	if currentInstance then
		return BZL[currentInstance]
	end
	local map = GetMapInfo()
	if not map then
		if GetCurrentMapZone() == 0 then
			if GetCurrentMapContinent() == 0 then
				return BZL["Azeroth"]
			elseif GetCurrentMapContinent() == -1 then
				return BZL["Cosmic map"]
			end
		end
	end
	return Tourist:GetZoneFromTexture(map)
end

function Cartographer:GetCurrentEnglishZoneName()
	if currentInstance then
		return currentInstance
	end
	local map = GetMapInfo()
	if not map then
		if GetCurrentMapZone() == 0 then
			if GetCurrentMapContinent() == 0 then
				return "Azeroth"
			elseif GetCurrentMapContinent() == -1 then
				return "Cosmic map"
			end
		end
	end
	return Tourist:GetEnglishZoneFromTexture(map)
end

function Cartographer:OpenAlternateMap()
	if self:GetProfile() == "Default" or self:GetProfile() == "Alternate" then
		self:SetProfile(self:GetProfile() == "Default" and "Alternate" or "Default")
	end

	if not WorldMapFrame:IsShown() then
		ToggleFrame(WorldMapFrame)
	end
end

function Cartographer:AcquireSideTablet(side, id)
	if side == "LEFT" then
		currentLeftSide = id
	else -- RIGHT
		currentRightSide = id
	end
	local s = "Cartographer_" .. side .. "Side"
	if WorldMapFrame:IsShown() then
		Tablet:Refresh(s)
	end
end
precondition(Cartographer, "AcquireSideTablet", function(self, side, id)
	argCheck(side, 2, "string")
	if side ~= "LEFT" and side ~= "RIGHT" then
		error('Argument #2 to `AcquireSideTablet\' must either be "LEFT" or "RIGHT".', 3)
	end
	argCheck(id, 3, "table")
	if side == "LEFT" then
		if type(id.OnCartographerLeftTabletRequest) ~= "function" then
			error("Argument #3 must include the method `OnCartographerLeftTabletRequest'.", 3)
		end
	else -- RIGHT
		if type(id.OnCartographerRightTabletRequest) ~= "function" then
			error("Argument #3 must include the method `OnCartographerRightTabletRequest'.", 3)
		end
	end
end)

function Cartographer:ReleaseSideTablet(side, id)
	if side == "LEFT" then
		if not id or id == currentLeftSide then
			currentLeftSide = nil
		else
			return
		end
	else -- RIGHT
		if not id or id == currentRightSide then
			currentRightSide = nil
		else
			return
		end
	end
	Tablet:Refresh("Cartographer_" .. side .. "Side")
end
precondition(Cartographer, "ReleaseSideTablet", function(self, side, id)
	argCheck(side, 2, "string")
	if side ~= "LEFT" and side ~= "RIGHT" then
		error('Argument #2 to `ReleaseSideTablet\' must either be "LEFT" or "RIGHT".', 3)
	end
	argCheck(id, 3, "table", "nil")
end)

function Cartographer:GetCurrentSideTabletHandler(side)
	if side == "LEFT" then
		return currentLeftSide
	else -- RIGHT
		return currentRightSide
	end
end
precondition(Cartographer, "GetCurrentSideTabletHandler", function(self, side)
	argCheck(side, 2, "string")
	if side ~= "LEFT" and side ~= "RIGHT" then
		error('Argument #2 to `ReleaseSideTablet\' must either be "LEFT" or "RIGHT".', 3)
	end
end)

function Cartographer:RefreshSideTablet(side, id)
	if not side then
		self:RefreshSideTablet("LEFT", id)
		self:RefreshSideTablet("RIGHT", id)
		return
	end
	local s = "Cartographer_" .. side .. "Side"
	--if not Tablet:IsRegistered(s) then
	--	return
	--end
	if side == "LEFT" then
		if id and id ~= currentLeftSide then
			return
		end
	else -- RIGHT
		if id and id ~= currentRightSide then
			return
		end
	end
	Tablet:Open(s)
end
precondition(Cartographer, 'RefreshSideTablet', function(self, side, id)
	argCheck(side, 2, "string", "nil")
	if not side then
		return
	end
	if side ~= "LEFT" and side ~= "RIGHT" then
		error('Argument #2 to `AcquireSideTablet\' must either be "LEFT" or "RIGHT".', 3)
	end
	argCheck(id, 3, "table", "nil")
end)

local currentYardWidth, currentYardHeight = 1000, 1000 * 2/3

do
	local last_px, last_py

	local x, y, zone
	function Cartographer:GetCurrentPlayerPosition()
		local px, py = GetPlayerMapPosition("player")
		if px == last_px and py == last_py and x~=nil then      -- Sinus: The x~=nil check is to prevent a "the last call here returned buggy nils coming from Tourist:TransposeZoneCoordinate, so let's do the same silly thing" scenario.
			return x, y, zone
		end
		last_px, last_py = px, py
		if px == 0 or py == 0 or ((IsInInstance() or Cartographer:GetCurrentInstance()) and select(2, IsInInstance()) ~= "pvp") then
			return x, y, zone
		end
		local pz = GetRealZoneText()
		if Tourist:IsInstance(pz) then
			px, py, pz = Tourist:GetBestZoneCoordinate(px, py, Cartographer:GetCurrentLocalizedZoneName())
		else
			px, py = Tourist:TransposeZoneCoordinate(px, py, Cartographer:GetCurrentLocalizedZoneName(), pz)
		end
		if px and py then
			x, y, zone = px, py, BZR[pz]
		end

		return x, y, zone
	end
end

function Cartographer:PointToYards(x, y, zone)
	local w, h
	if not zone or zone == GetRealZoneText() then
		w, h = currentYardWidth, currentYardHeight
	else
		w, h = Tourist:GetZoneYardSize(zone)
		if not w then
			w, h = 1000, 1000 * 2/3
		end
	end
	if x then
		return x * w, y * h
	end
	return nil, nil
end

function Cartographer:GetDistanceToPoint(x, y, zone, px, py, pzone)
	if not px then
		px, py, pzone = self:GetCurrentPlayerPosition()
		if pzone then
			pzone = BZL[pzone]
		end
	end
	if px == 0 or py == 0 or not px or not py then
		return nil
	end
	if pzone and BZH[pzone] then
		pzone = BZL[pzone]
	end
	if zone and BZH[zone] then
		zone = BZL[zone]
	end
	if not zone then
		zone = GetRealZoneText()
	end
	if not pzone then
		pzone = zone
	end
	local dist = Tourist:GetYardDistance(zone, x, y, pzone, px, py)
	return dist
end

function Cartographer:configureYards()
	if not WorldMapFrame:IsShown() then
		SetMapToCurrentZone()
	end
	currentYardWidth, currentYardHeight = Tourist:GetZoneYardSize(GetRealZoneText())
	if not currentYardWidth then
		currentYardWidth, currentYardHeight = 1000, 1000 * 2/3
	end
end
Cartographer.MINIMAP_ZONE_CHANGED = Cartographer.configureYards
function Cartographer:FullyInitialized()
 	self:configureYards()
	self:PLAYER_LEVEL_UP()
end

function Cartographer:ZONE_CHANGED_NEW_AREA()
	if not WorldMapFrame:IsShown() then
		SetMapToCurrentZone()
	end
	self:configureYards()
end

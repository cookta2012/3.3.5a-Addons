assert(Cartographer, "Cartographer not found!")

if Cartographer3 and Cartographer3.hijackingWorldMap then
	return
end

local Cartographer = Cartographer
local revision = tonumber(("$Revision: 2273 $"):sub(12, -3))
if revision > Cartographer.revision then
	Cartographer.version = "r" .. revision
	Cartographer.revision = revision
	Cartographer.date = ("$Date: 2008-11-02 14:27:13 +0000 (Sun, 02 Nov 2008) $"):sub(8, 17)
end

local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer-LookNFeel")

L:AddTranslations("enUS", function() return {
	["Look 'n' Feel"] = true,
	["Module which allows you to change the transparency, position, and scale of the world map."] = true,

	["Transparency"] = true,
	["Transparency of the World Map"] = true,

	["Overlay transparency"] = true,
	["Transparency of World Map overlays"] = true,

	["Scale"] = true,
	["Scale of the World Map"] = true,

	["Tooltip scale"] = true,
	["Scale of the World Map tooltip"] = true,

	["Shift-MouseWheel to change transparency"] = true,
	["Ctrl-MouseWheel to change scale"] = true,

	["Lock the World Map"] = true,

	["Close with escape"] = true,
	["Close the World Map when pressing the escape button"] = true,

	["Large player arrow"] = true,
	["Make the player's arrow on the World Map 1.5 times larger than normal"] = true,

	["Unlock World Map"] = true,
	["Lock World Map"] = true,
	["Note: holding Alt while locked will temporarily unlock the World Map."] = true,

	["Show minimap button"] = true,
	["Show the World Map minimap button"] = true,

	["Show informational text"] = true,
	["Show informational text in the top-left of the map"] = true,

	["Strata"] = true,
	["Change the world map window's strata (controls which windows display on top of eachother)"] = true,

	["BACKGROUND"] = true,
	["LOW"] = true,
	["MEDIUM"] = true,
	["HIGH"] = true,
	["FULLSCREEN"] = true,
	["Auto"] = true,
} end)

L:AddTranslations("koKR", function() return {
	["Look 'n' Feel"] = "모양",
	["Module which allows you to change the transparency, position, and scale of the world map."] = "세계 지도의 투명도, 위치 그리고 크기등을 변경합니다.",

	["Transparency"] = "투명도",
	["Transparency of the World Map"] = "세계 지도의 투명도를 설정합니다.",

	["Overlay transparency"] = "오버레이 투명도",
	["Transparency of World Map overlays"] = "세계 지도 오버레이의 투명도를 설정합니다.",

	["Scale"] = "크기",
	["Scale of the World Map"] = "세계 지도의 크기를 설정합니다.",

	["Tooltip scale"] = "툴팁 크기",
	["Scale of the World Map tooltip"] = "세계 지도의 툴팁 크기를 설정합니다.",

	["Shift-MouseWheel to change transparency"] = "SHIFT+마우스휠 : 투명도 변경",
	["Ctrl-MouseWheel to change scale"] = "CTRL+마우스휠 : 크기 변경",

	["Lock the World Map"] = "세계 지도의 위치를 고정합니다.",

	["Close with escape"] = "Esc 닫기",
	["Close the World Map when pressing the escape button"] = "Esc 버튼을 누루면 세계 지도를 닫습니다.",

	["Large player arrow"] = "플레이어 위치 크게",
	["Make the player's arrow on the World Map 1.5 times larger than normal"] = "플레이어의 위치는 세계 지도에 1.5배 크게 표시합니다.",

	["Unlock World Map"] = "세계 지도 이동",
	["Lock World Map"] = "세계 지도 고정",
	["Note: holding Alt while locked will temporarily unlock the World Map."] = "노트: 고정된 세계 지도의 임시 지역 이동은 Alt키를 누른 상태에서 열 수 있습니다.",

	["Show minimap button"] = "미니맵 버튼 보기",
	["Show the World Map minimap button"] = "월드맵의 미니맵 버튼을 표시합니다.",

	["Show informational text"] = "도움말 표시",
	["Show informational text in the top-left of the map"] = "지도의 좌측 상단에 도움말을 표시합니다.",

	["Strata"] = "계층",
	["Change the world map window's strata (controls which windows display on top of eachother)"] = "세계 지도 창의 계층을 변경합니다. (창 표시의 우선순위 조절)",

	["BACKGROUND"] = "배경",
	["LOW"] = "낮음",
	["MEDIUM"] = "중간",
	["HIGH"] = "높음",
	["FULLSCREEN"] = "전체화면",
	["Auto"] = "자동",
} end)

L:AddTranslations("deDE", function() return {
	["Look 'n' Feel"] = "Look 'n' Feel",
	["Module which allows you to change the transparency, position, and scale of the world map."] = "Modul zur Einstellung der Transparenz, Position und Skalierung der Weltkarte.",

	["Transparency"] = "Transparenz",
	["Transparency of the World Map"] = "Transparenz der Weltkarte",

	["Overlay transparency"] = "Overlay-Transparenz",
	["Transparency of World Map overlays"] = "Transparenz des Weltkartenhintergrunds",

	["Scale"] = "Skalierung",
	["Scale of the World Map"] = "Skalierung der Weltkarte",

	["Tooltip scale"] = "Tooltip-Skalierung",
	["Scale of the World Map tooltip"] = "Skalierung des Weltkarten-Tooltips",

	["Shift-MouseWheel to change transparency"] = "Shift+Mausrad zur Änderung der Transparenz",
	["Ctrl-MouseWheel to change scale"] = "Strg+Mausrad zur Änderung der Skalierung",

	["Lock the World Map"] = "Sperrt die Weltkarte",

	["Close with escape"] = "Schließen mit Escape",
	["Close the World Map when pressing the escape button"] = "Schließt die Weltkarte mit der Escape-Taste",

	["Large player arrow"] = "Großer Spielerpfeil",
	["Make the player's arrow on the World Map 1.5 times larger than normal"] = "Macht den Spielerpfeil auf der Weltkarte 1,5 mal größer als normal",

	["Unlock World Map"] = "Weltkarte entsperren",
	["Lock World Map"] = "Weltkarte sperren",
	["Note: holding Alt while locked will temporarily unlock the World Map."] = "Hinweis: Alt-Taste halten, während die Karte gesperrt ist, um die Weltkarte kurzzeitig zu entsperren.",

	["Show minimap button"] = "Zeige Minimap-Knopf",
	["Show the World Map minimap button"] = "Knopf für die Weltkarte an der Minimap anzeigen.",

	["Show informational text"] = "Hilfetext anzeigen",
	["Show informational text in the top-left of the map"] = "Hilfetext in der oberen linken Ecke der Weltkarte anzeigen.",
} end)

L:AddTranslations("frFR", function() return {
	["Look 'n' Feel"] = "Affichage et comportement",
	["Module which allows you to change the transparency, position, and scale of the world map."] = "Module permettant la personnalisation de la transparence, la position et la taille de la carte du monde.",

	["Transparency"] = "Transparence",
	["Transparency of the World Map"] = "Détermine la transparence de la carte du monde.",

	["Overlay transparency"] = "Transparence sur-impression",
	["Transparency of World Map overlays"] = "Détermine la transparence des textes en sur-impression de la carte du monde.",

	["Scale"] = "Taille",
	["Scale of the World Map"] = "Détermine la taille de la carte du monde.",

	["Tooltip scale"] = "Taille des infobulles",
	["Scale of the World Map tooltip"] = "Détermine la taille des infobulles de la carte du monde.",

	["Shift-MouseWheel to change transparency"] = "Shift-molette pour changer la transparence",
	["Ctrl-MouseWheel to change scale"] = "Ctrl-molette pour changer la taille",

	["Lock the World Map"] = "Verrouille la carte du monde.",

	["Close with escape"] = "Fermer avec Echappement",
	["Close the World Map when pressing the escape button"] = "Ferme la carte du monde en appuyant sur la touche Echappement.",

	["Large player arrow"] = "Grosse flèche joueur",
	["Make the player's arrow on the World Map 1.5 times larger than normal"] = "Rend la flèche du joueur sur la carte du monde 1,5 fois plus grosse que la normale.",

	["Unlock World Map"] = "Déverrouiller la carte du monde",
	["Lock World Map"] = "Verrouiller la carte du monde",
	["Note: holding Alt while locked will temporarily unlock the World Map."] = "Note : maintenir la touche Alt enfoncée quand la carte est verrouillée déverrouillera temporairement la carte.",

	["Show minimap button"] = "Afficher le bouton de la minicarte",
	["Show the World Map minimap button"] = "Affiche le bouton de la carte du monde sur la minicarte.",

	["Show informational text"] = "Afficher le texte d'aide",
	["Show informational text in the top-left of the map"] = "Affiche du texte informatif en haut à gauche de la carte.",
} end)

L:AddTranslations("esES", function() return {
	["Look 'n' Feel"] = "Apariencia",
	["Module which allows you to change the transparency, position, and scale of the world map."] = "M\195\179dulo que te permite cambiar la transparencia, posici\195\179n y escala del mapa del mundo",

	["Transparency"] = "Transparencia",
	["Transparency of the World Map"] = "Transparencia del Mapa del Mundo",

	["Overlay transparency"] = "Transparencia de los Superpuestos",
	["Transparency of World Map overlays"] = "Transparencia de los superpuestos del Mapa del Mundo",

	["Scale"] = "Escala",
	["Scale of the World Map"] = "Escala del Mapa del Mundo",

	["Tooltip scale"] = "Escala del Tooltip",
	["Scale of the World Map tooltip"] = "Escala del tooltip del Mapa del Mundo",

	["Shift-MouseWheel to change transparency"] = "May\195\186sculas+RuedaDelRat\195\179n para cambiar transparencia",
	["Ctrl-MouseWheel to change scale"] = "Ctrl+RuedaDelRat\195\179n para cambiar la escala",

	["Lock the World Map"] = "Bloquear el Mapa del Mundo",

	["Close with escape"] = "Cerrar con Escape",
	["Close the World Map when pressing the escape button"] = "Cierrar el Mapa del Mundo cuando se presiona la tecla Escape",

	["Large player arrow"] = "Flecha del jugador grande",
	["Make the player's arrow on the World Map 1.5 times larger than normal"] = "Hace que la flecha del jugador en el Mapa del Mundo sea 1.5 veces m\195\161s grande de lo normal",

	["Unlock World Map"] = "Desbloquear Mapa del Mundo",
	["Lock World Map"] = "Bloquear Mapa del Mundo",
	["Note: holding Alt while locked will temporarily unlock the World Map."] = "Nota: presionando Alt mientras est\195\161 bloqueado desbloquear\195\161 temporalmente el Mapa del Mundo",

	["Show minimap button"] = "Mostrar bot\195\179n en minimapa",
	["Show the World Map minimap button"] = "Muestra el bot\195\179n del Mapa del Mundo en el minimapa",

	["Show informational text"] = "Mostrar texto informativo",
	["Show informational text in the top-left of the map"] = "Muestra el texto informativo en la esquina superior izquierda del mapa",
} end)

L:AddTranslations("zhTW", function() return {
	["Look 'n' Feel"] = "外觀設定",
	["Module which allows you to change the transparency, position, and scale of the world map."] = "讓你可以改變世界地圖透明度、位置和大小的模組。",

	["Transparency"] = "透明度",
	["Transparency of the World Map"] = "世界地圖的透明度",

	["Overlay transparency"] = "覆疊區透明度",
	["Transparency of World Map overlays"] = "世界地圖覆疊區 (註記、地區資訊等等) 的透明度",

	["Scale"] = "縮放",
	["Scale of the World Map"] = "世界地圖的縮放大小",

	["Tooltip scale"] = "提示訊息",
	["Scale of the World Map tooltip"] = "世界地圖提示訊息的縮放大小",

	["Shift-MouseWheel to change transparency"] = "|cffeda55fShift-滾輪: |r改變透明度",
	["Ctrl-MouseWheel to change scale"] = "|cffeda55fCtrl-滾輪: |r改變縮放大小",

	["Lock the World Map"] = "鎖定世界地圖",

	["Close with escape"] = "Esc鍵關閉",
	["Close the World Map when pressing the escape button"] = "使用Esc鍵關閉世界地圖",

	["Large player arrow"] = "加大玩家箭頭",
	["Make the player's arrow on the World Map 1.5 times larger than normal"] = "在世界地圖上以原本的1.5倍加大顯示代表玩家的箭頭",

	["Unlock World Map"] = "解鎖世界地圖",
	["Lock World Map"] = "鎖定世界地圖",
	["Note: holding Alt while locked will temporarily unlock the World Map."] = "註: 世界地圖鎖定時按住Alt鍵將可以暫時解除鎖定。",

	["Show minimap button"] = "顯示小地圖按鈕",
	["Show the World Map minimap button"] = "顯示小地圖按鈕",

	["Show informational text"] = "顯示資訊文字",
	["Show informational text in the top-left of the map"] = "在地圖左上顯示資訊文字",

	["Strata"] = "視窗層級",
	["Change the world map window's strata (controls which windows display on top of eachother)"] = "改變世界地圖視窗的層級",

	["BACKGROUND"] = "背景",
	["LOW"] = "低",
	["MEDIUM"] = "中",
	["HIGH"] = "高",
	["FULLSCREEN"] = "全螢幕",
	["Auto"] = "自動",
} end)

L:AddTranslations("zhCN", function() return {
	["Look 'n' Feel"] = "外观设置",
	["Module which allows you to change the transparency, position, and scale of the world map."] = "让你设置世界地图的透明度，位置和大小。",

	["Transparency"] = "透明度",
	["Transparency of the World Map"] = "世界地图的透明度。",

	["Overlay transparency"] = "层透明度",
	["Transparency of World Map overlays"] = "世界地图覆盖层透明度。（如注释等）",

	["Scale"] = "缩放",
	["Scale of the World Map"] = "世界地图的缩放大小。",

	["Tooltip scale"] = "提示信息",
	["Scale of the World Map tooltip"] = "世界地图提示信息的缩放大小。",

	["Shift-MouseWheel to change transparency"] = "Shift-鼠标滚轮：改变透明度",
	["Ctrl-MouseWheel to change scale"] = "Ctrl-鼠标滚轮：改变缩放大小",

	["Lock the World Map"] = "锁定世界地图",

	["Close with escape"] = "Esc 键关闭",
	["Close the World Map when pressing the escape button"] = "使用 Esc 键关闭世界地图窗口。",

	["Large player arrow"] = "加大玩家箭头",
	["Make the player's arrow on the World Map 1.5 times larger than normal"] = "在世界地图上以原来的1.5倍加大显示代表玩家的箭头。",

	["Unlock World Map"] = "解锁世界地图",
	["Lock World Map"] = "锁定世界地图",
	["Note: holding Alt while locked will temporarily unlock the World Map."] = "注：世界地图锁定时按住 Alt 键将可以暂时解除锁定。",

	["Show minimap button"] = "显示小地图按钮",
	["Show the World Map minimap button"] = "显示小地图按钮。",

	["Show informational text"] = "显示信息文字",
	["Show informational text in the top-left of the map"] = "在地图左上方显示信息文字。",

	["Strata"] = "窗口层面",
	["Change the world map window's strata (controls which windows display on top of eachother)"] = "改变世界地图窗口的层面。",

	["BACKGROUND"] = "背景",
	["LOW"] = "低",
	["MEDIUM"] = "中",
	["HIGH"] = "高",
	["FULLSCREEN"] = "全屏幕",
	["Auto"] = "自动",
} end)

-- Russian Translation by StingerSoft (Eritnull aka Шептун)
L:AddTranslations("ruRU", function() return {
	["Look 'n' Feel"] = "Наглядность и Восприятие",
	["Module which allows you to change the transparency, position, and scale of the world map."] = "Модуль позволяет настраивать прозрачность, позиции и масштаб Карты Мира.",

	["Transparency"] = "Прозрачность",
	["Transparency of the World Map"] = "Прозрачность карты мира",

	["Overlay transparency"] = "Прозрачность наложения",
	["Transparency of World Map overlays"] = "Прозрачность наложения Мировой Карты",

	["Scale"] = "Масштаб",
	["Scale of the World Map"] = "Масштаб карты мира",

	["Tooltip scale"] = "Масштаб подсказки",
	["Scale of the World Map tooltip"] = "Масштаб подсказки на карте мира",

	["Shift-MouseWheel to change transparency"] = "Shift-КолесоМыши для изменения прозрачности",
	["Ctrl-MouseWheel to change scale"] = "Shift-КолесоМыши для изменения масштаба",

	["Lock the World Map"] = "Закрепить Карту Мира",

	["Close with escape"] = "Закрыть с клавишей Escape",
	["Close the World Map when pressing the escape button"] = "Gри нажатии кнопки Escape закрывает карту мира",

	["Large player arrow"] = "Большая стрелка персонажа",
	["Make the player's arrow on the World Map 1.5 times larger than normal"] = "Делает отображение стрелки персонажа на Карте Мира в 1.5 раз больше нормальной",

	["Unlock World Map"] = "Освободить Мировую Карту",
	["Lock World Map"] = "Закрепить Карту Мира",
	["Note: holding Alt while locked will temporarily unlock the World Map."] = "Заметка: удерживайте Alt в то время когда карта закреплена вы временно освободите Мировую Карту.",

	["Show minimap button"] = "Показ кнопки у мини-карты",
	["Show the World Map minimap button"] = "Отображает кнопку Карты Мира у мини-карты",

	["Show informational text"] = "Показать информационный текст",
	["Show informational text in the top-left of the map"] = "Отображает информационный текст в верхнем левом углу карты",

	["Strata"] = "Cлои",
	["Change the world map window's strata (controls which windows display on top of eachother)"] = "Изменяет слой окна мировой карты (элементы управления который отображает окно поверх друг друга)",

	["BACKGROUND"] = "Фон",
	["LOW"] = "Низкий",
	["MEDIUM"] = "Средний",
	["HIGH"] = "Высокий",
	["FULLSCREEN"] = "Полноэкранный",
	["Auto"] = "Авто",
} end)

Cartographer_LookNFeel = Cartographer:NewModule("LookNFeel", "LibRockEvent-1.0", "LibRockTimer-1.0", "LibRockHook-1.0")
local Cartographer_LookNFeel = Cartographer_LookNFeel

local _G = getfenv(0)

local tmp = {}
local fake_ipairs = function(...)
	for k in pairs(tmp) do
		tmp[k] = nil
	end
	for i = 1, select('#', ...) do
		tmp[i] = select(i, ...)
	end
	return ipairs(tmp)
end

function Cartographer_LookNFeel:OnInitialize()
	self.db = Cartographer:AcquireDBNamespace("LookNFeel")
	self.name = L["Look 'n' Feel"]
	self.title = L["Look 'n' Feel"]

	Cartographer:RegisterDefaults("LookNFeel", "profile", {
		alpha = 0.8,
		overlayAlpha = 1,
		scale = 0.75,
		ttScale = 1,
		locked = false,
		useEscape = true,
		largePlayer = true,
		showMinimapButton = true,
		showInformationalText = true,
		strata = "Auto",
	})

	Cartographer.options.args.LookNFeel = {
		name = L["Look 'n' Feel"],
		desc = L["Module which allows you to change the transparency, position, and scale of the world map."],
		type = 'group',
		args = {
			alpha = {
				name = L["Transparency"],
				desc = L["Transparency of the World Map"],
				type = 'range',
				min = 0,
				max = 1,
				step = 0.01,
				bigStep = 0.05,
				isPercent = true,
				get = "GetAlpha",
				set = "SetAlpha",
			},
			overlayAlpha = {
				name = L["Overlay transparency"],
				desc = L["Transparency of World Map overlays"],
				type = 'range',
				min = 0.25,
				max = 1,
				step = 0.01,
				bigStep = 0.05,
				isPercent = true,
				get = "GetOverlayAlpha",
				set = "SetOverlayAlpha",
			},
			scale = {
				name = L["Scale"],
				desc = L["Scale of the World Map"],
				type = 'range',
				min = 0.2,
				max = 1,
				step = 0.01,
				bigStep = 0.05,
				isPercent = true,
				get = "GetScale",
				set = "SetScale",
			},
			ttScale = {
				name = L["Tooltip scale"],
				desc = L["Scale of the World Map tooltip"],
				type = 'range',
				min = 0.2,
				max = 2,
				step = 0.01,
				bigStep = 0.05,
				isPercent = true,
				get = "GetTooltipScale",
				set = "SetTooltipScale",
			},
			lock = {
				name = LOCK or "Lock",
				desc = L["Lock the World Map"],
				type = 'toggle',
				get = "IsLocked",
				set = "ToggleLocked",
			},
			useEscape = {
				name = L["Close with escape"],
				desc = L["Close the World Map when pressing the escape button"],
				type = 'toggle',
				get = "IsUsingEscape",
				set = "ToggleUsingEscape",
			},
			largePlayer = {
				name = L["Large player arrow"],
				desc = L["Make the player's arrow on the World Map 1.5 times larger than normal"],
				type = 'toggle',
				get = "IsLargePlayerPOI",
				set = "ToggleLargePlayerPOI",
			},
			minimap = {
				name = L["Show minimap button"],
				desc = L["Show the World Map minimap button"],
				type = "toggle",
				get = "IsShowingMinimapButton",
				set = "ToggleShowingMinimapButton",
			},
			infoText = {
				name = L["Show informational text"],
				desc = L["Show informational text in the top-left of the map"],
				type = "toggle",
				get = "IsShowingInformationalText",
				set = "ToggleShowingInformationalText",
			},
			toggle = {
				name = Cartographer.L["Active"],
				desc = Cartographer.L["Suspend/resume this module."],
				type = "toggle",
				order = -1,
				get = function() return Cartographer:IsModuleActive(self) end,
				set = function() Cartographer:ToggleModuleActive(self); ReloadUI() end
			},
			strata = {
				name = L["Strata"],
				desc = L["Change the world map window's strata (controls which windows display on top of eachother)"],
				type = "text",
				get = "GetStrata",
				set = "SetStrata",
				validate={["BACKGROUND"] = L["BACKGROUND"], ["LOW"] = L["LOW"], ["MEDIUM"] = L["MEDIUM"], ["HIGH"] = L["HIGH"], ["FULLSCREEN"] = L["FULLSCREEN"], ["Auto"] = L["Auto"] },
			}
		},
		handler = self,
	}

	local orig = WorldMapFrame:GetScript("OnShow") or function() end
	WorldMapFrame:SetScript("OnShow", function(this)
		orig(this)

		if Cartographer:IsModuleActive(self) then
			this:SetScale(self.db.profile.scale or 0.75)
			self:SetStrata(self:GetStrata() or "MEDIUM")
			if Cartographer.tooltipData then
				AceLibrary("Tablet-2.0"):SetFontSizePercent(Cartographer.tooltipData, self.db.profile.ttScale)
			end
			this:SetWidth(1024)
			this:SetHeight(768)
		end
	end)

	for i = 1, 12 do
		local tex = _G["WorldMapDetailTile" .. i]
		local x = tex:GetLeft() - WorldMapDetailFrame:GetLeft()
		local y = tex:GetTop() - WorldMapDetailFrame:GetTop()
		tex:ClearAllPoints()
		tex:SetPoint("TOPLEFT", WorldMapDetailFrame, "TOPLEFT", x, y)
	end

	hooksecurefunc(WorldMapTooltip, "Show", function(this)
		this:SetFrameStrata("TOOLTIP")
	end)
end

local cities = {
	["ThunderBluff"] = true,
	["Ogrimmar"] = true,
	["TheExodar"] = true,
	["Darnassis"] = true,
	["Undercity"] = true,
	["Ironforge"] = true,
	["Stormwind"] = true,
	["SilvermoonCity"] = true,
	["ShattrathCity"] = true,
	["Dalaran"] = true,
}

local function refixParent(frame)
	local self = Cartographer_LookNFeel
	if frame == self.overlayHolder or frame == self.nonOverlayHolder then
		return
	end
	local parent = self.nonOverlayHolder
	if frame == PlayerArrowFrame or frame == PlayerArrowEffectFrame or frame == WorldMapButton then
		parent = self.overlayHolder
	elseif frame == WorldMapDetailFrame then
		if ((GetCurrentMapZone() == 0 or cities[GetMapInfo()]) and (self.db.profile.overlayAlpha or 1) > (self.db.profile.alpha or 0.85)) and GetMapInfo() ~= "AlteracValley" then
			parent = self.overlayHolder
		end
	elseif frame:GetName() and (frame:GetName():find("^Cartographer") or frame:GetName():find("^Tablet20Detached") or frame:GetName():find("Tooltip$")) then
		parent = self.overlayHolder
	end
	frame:SetParent(parent)
end

local lockButton
function Cartographer_LookNFeel:OnEnable()
	Cartographer:AddToMagnifyingGlass(L["Shift-MouseWheel to change transparency"])
	Cartographer:AddToMagnifyingGlass(L["Ctrl-MouseWheel to change scale"])
	UIPanelWindows["WorldMapFrame"] = nil
	WorldMapFrame:SetAttribute("UIPanelLayout-enabled", false)
	self:SetStrata(self:GetStrata())
	WorldMapFrame:EnableMouse(not self.db.profile.locked)
	WorldMapFrame:EnableMouseWheel(not self.db.profile.locked)
	WorldMapButton:EnableMouse(not self.db.profile.locked)
	WorldMapMagnifyingGlassButton:EnableMouse(not self.db.profile.locked)
	local button = Cartographer:GetInstanceWorldMapButton()
	if button then
		button:EnableMouse(not self.db.profile.locked)
	end
	self:AddEventListener("Cartographer", "RegisterInstanceWorldMapButton", function(ns, event, frame)
		frame:EnableMouse(not self.db.profile.locked)
	end)
	WorldMapFrame:SetMovable(true)
	WorldMapFrame:RegisterForDrag("LeftButton")
	WorldMapFrame:SetScript("OnDragStart", function(this)
		this:SetWidth(1024)
		this:SetHeight(768)
		this:StartMoving()
	end)
	WorldMapFrame:SetScript("OnDragStop", function(this)
		this:StopMovingOrSizing()

		this:SetWidth(1024)
		this:SetHeight(768)
		local x,y = this:GetCenter()
		local z = UIParent:GetEffectiveScale() / 2 / this:GetScale()
		x = x - GetScreenWidth() * z
		y = y - GetScreenHeight() * z
		self.db.profile.x = x
		self.db.profile.y = y
		this:ClearAllPoints()
		this:SetPoint("CENTER", "UIParent", "CENTER", x, y)
		self:CheckOffScreen()
	end)
	WorldMapFrame:SetScript("OnMouseWheel", function(this, arg1)
		local up = (arg1 == 1)

		if IsControlKeyDown() then
			local scale = self:GetScale()
			if up then
				scale = scale + 0.1
				if scale > 1 then
					scale = 1
				end
			else
				scale = scale - 0.1
				if scale < 0.2 then
					scale = 0.2
				end
			end
			self:SetScale(scale)
		elseif IsShiftKeyDown() then
			local alpha = self:GetAlpha()
			if up then
				alpha = alpha + 0.1
				if alpha > 1 then
					alpha = 1
				end
			else
				alpha = alpha - 0.1
				if alpha < 0 then
					alpha = 0
				end
			end
			self:SetAlpha(alpha)
		end
	end)
	WorldMapFrame:SetResizable(true)
	WorldMapFrame:SetAlpha(1)
	WorldMapFrame:SetScale(self.db.profile.scale or 0.75)
	AceLibrary("Tablet-2.0"):SetFontSizePercent(Cartographer.tooltipData, value)
	WorldMapFrame:SetWidth(1024)
	WorldMapFrame:SetHeight(768)
	self.old_WorldMapFrame_OnKeyDown = WorldMapFrame:GetScript("OnKeyDown")
	WorldMapFrame:SetScript("OnKeyDown", nil)
	WorldMapFrame:StartMoving()
	WorldMapFrame:StopMovingOrSizing()
	WorldMapFrame:ClearAllPoints()
	WorldMapFrame:SetPoint("CENTER", UIParent, "CENTER", self.db.profile.x or 0, self.db.profile.y or 0)
	BlackoutWorld:Hide()
	self:AddSecureHook(WorldMapDetailFrame, "CreateTexture", "WorldMapDetailFrame_CreateTexture")
	self:AddEventListener("Cartographer", "ChangeZone", "Cartographer_ChangeZone")
	self:AddEventListener("MODIFIER_STATE_CHANGED")
	self:AddSecureHook("WorldMapButton_OnUpdate")
	self:AddHook("CloseSpecialWindows")
	self:AddRepeatingTimer(0.1, "FixAddedFrames")
	if not self.overlayHolder then
		self.overlayHolder = CreateFrame("Frame", "CartographerLookNFeelOverlayHolder", WorldMapFrame)
		self.overlayHolder:SetPoint("TOPLEFT", WorldMapDetailFrame, "TOPLEFT")
		self.overlayHolder:SetPoint("BOTTOMRIGHT", WorldMapDetailFrame, "BOTTOMRIGHT")
		self.overlayHolder:SetFrameStrata(WorldMapDetailFrame:GetFrameStrata())
		self.overlayHolder:SetFrameLevel(WorldMapDetailFrame:GetFrameLevel() + 1)
	end
	if not self.nonOverlayHolder then
		self.nonOverlayHolder = CreateFrame("Frame", "CartographerLookNFeelNonOverlayHolder", WorldMapFrame)
		self.nonOverlayHolder:SetPoint("TOPLEFT", WorldMapDetailFrame, "TOPLEFT")
		self.nonOverlayHolder:SetPoint("BOTTOMRIGHT", WorldMapDetailFrame, "BOTTOMRIGHT")
		self.nonOverlayHolder:SetFrameStrata(WorldMapFrame:GetFrameStrata())
		self.nonOverlayHolder:SetFrameLevel(WorldMapFrame:GetFrameLevel())
	end
	self.overlayHolder:Show()
	self.nonOverlayHolder:Show()

	self.overlayHolder:SetAlpha(self.db.profile.overlayAlpha or 1)
	self.nonOverlayHolder:SetAlpha(self.db.profile.alpha or 0.85)

	refixParent(WorldMapButton)
	for _,v in fake_ipairs(WorldMapButton:GetChildren()) do
		v:SetParent(nil)
		v:SetParent(WorldMapButton)
	end

	for i,v in fake_ipairs(WorldMapFrame:GetChildren()) do
		if v ~= self.overlayHolder and v ~= self.nonOverlayHolder then
			refixParent(v)
		end
	end
	for i,v in fake_ipairs(WorldMapFrame:GetRegions()) do
		refixParent(v, self.nonOverlayHolder)
	end

	refixParent(PlayerArrowFrame)
	refixParent(PlayerArrowEffectFrame)

	refixParent(WorldMapDetailFrame)

	for i = 1, 1000 do
		local texture = _G["WorldMapOverlay" .. i]
		if not texture then
			break
		end
		texture:SetParent(self.overlayHolder)
	end

	WorldMapButton:SetScript("OnEnter", function()
		WorldMapFrameAreaLabel:Show()
	end)
	local function f()
		if MouseIsOver(WorldMapButton) and not Cartographer:GetCurrentInstance() then
			local n = GetMouseFocus() and GetMouseFocus():GetName()
			if not n or not n:find("^Tablet20") then
				WorldMapFrameAreaLabel:Show()
				self:AddTimer("Cartographer-LookNFeel-WorldMapButton-OnLeave", 0.25, f)
				return
			end
		end
		WorldMapFrameAreaLabel:Hide()
	end
	WorldMapButton:SetScript("OnLeave", f)
	if MouseIsOver(WorldMapButton) and not Cartographer:GetCurrentInstance() then
		WorldMapFrameAreaLabel:Show()
	else
		WorldMapFrameAreaLabel:Hide()
	end

	PlayerArrowFrame:SetModelScale(self.db.profile.largePlayer and 1.5 or 1)
	PlayerArrowEffectFrame:SetModelScale(self.db.profile.largePlayer and 1.5 or 1)

	if not lockButton then
		lockButton = CreateFrame("CheckButton", "CartographerLookNFeelLockButton", WorldMapFrame)
		lockButton:SetWidth(15)
		lockButton:SetHeight(22)
		local tex = lockButton:CreateTexture()
		tex:SetTexture("Interface\\Buttons\\UI-Button-KeyRing")
		tex:SetTexCoord(0, 0.5625, 0, 0.609375)
		tex:SetAllPoints(lockButton)
		lockButton:SetNormalTexture(tex)
		local tex = lockButton:CreateTexture()
		tex:SetTexture("Interface\\Buttons\\UI-Button-KeyRing-Highlight")
		tex:SetTexCoord(0, 0.5625, 0, 0.609375)
		tex:SetAllPoints(lockButton)
		lockButton:SetHighlightTexture(tex)
		local tex = lockButton:CreateTexture()
		tex:SetTexture("Interface\\Buttons\\UI-Button-KeyRing-Down")
		tex:SetTexCoord(0, 0.5625, 0, 0.609375)
		tex:SetAllPoints(lockButton)
		lockButton:SetPushedTexture(tex)
		local tex = lockButton:CreateTexture()
		tex:SetTexture("Interface\\Buttons\\UI-Button-KeyRing-Down")
		tex:SetTexCoord(0, 0.5625, 0, 0.609375)
		tex:SetAllPoints(lockButton)
		lockButton:SetCheckedTexture(tex)

		lockButton:SetScript("OnEnter", function(this)
			GameTooltip_SetDefaultAnchor(GameTooltip, this)
			GameTooltip:SetText(self:IsLocked() and L["Unlock World Map"] or L["Lock World Map"], HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
			GameTooltip:AddLine(L["Note: holding Alt while locked will temporarily unlock the World Map."])
			GameTooltip:Show()
		end)
		lockButton:SetScript("OnLeave", function(this)
			GameTooltip:Hide()
		end)
		lockButton:SetScript("OnClick", function(this)
			self:ToggleLocked()
			this:SetChecked(self:IsLocked())
			this:GetScript("OnEnter")(this)
		end)
		lockButton:SetChecked(self:IsLocked())
	else
		lockButton:Show()
	end

	Cartographer:AddMapButton(lockButton, 2)

	if not self:IsShowingMinimapButton() then
		MiniMapWorldMapButton:Hide()
	end

	if WorldMapFrame:IsShown() then
		ToggleFrame(WorldMapFrame)
		ToggleFrame(WorldMapFrame)
	end
	Cartographer:RefreshSideTablet()
	self:CheckOffScreen()
	self:ToggleShowingInformationalText(self:IsShowingInformationalText())
end

function Cartographer_LookNFeel:OnDisable()
	MiniMapWorldMapButton:Show()
	Cartographer:RemoveMapButton(lockButton)
	lockButton:Hide()
	Cartographer:RemoveFromMagnifyingGlass(L["Shift-MouseWheel to change transparency"])
	Cartographer:RemoveFromMagnifyingGlass(L["Ctrl-MouseWheel to change scale"])
	UIPanelWindows["WorldMapFrame"] = { whileDead=1, area="full", pushable=0 }
	WorldMapFrame:SetAttribute("UIPanelLayout-enabled", true)
	WorldMapFrame:EnableMouse(false)
	WorldMapFrame:EnableMouseWheel(false)
	WorldMapButton:EnableMouse(true)
	WorldMapMagnifyingGlassButton:EnableMouse(true)
	WorldMapFrame:SetScript("OnDragStart", nil)
	WorldMapFrame:SetScript("OnDragStop", nil)
	WorldMapFrame:SetScript("OnMouseWheel", nil)
	WorldMapFrame:StartMoving()
	WorldMapFrame:StopMovingOrSizing()
	WorldMapFrame:SetScale(1)
	WorldMapFrame:SetAlpha(1)
	WorldMapFrame:SetFrameStrata("FULLSCREEN")
	AceLibrary("Tablet-2.0"):SetFontSizePercent(Cartographer.tooltipData, 1)
	WorldMapFrame:StartMoving()
	WorldMapFrame:StopMovingOrSizing()
	WorldMapFrame:ClearAllPoints()
	WorldMapFrame:SetAllPoints(UIParent)
	WorldMapFrame:SetScript("OnKeyDown", self.old_WorldMapFrame_OnKeyDown)
	WorldMapFrame:EnableMouse(false)
	WorldMapFrame:SetMovable(false)
	WorldMapFrame:SetResizable(false)
	self.old_WorldMapFrame_OnKeyDown = nil
	for i = 1, 1000 do
		local texture = _G["WorldMapOverlay" .. i]
		if not texture then
			break
		end
		texture:SetParent(WorldMapDetailFrame)
	end
	self.overlayHolder:Hide()
	BlackoutWorld:Show()
	WorldMapFrameAreaLabel:Show()
	WorldMapButton:SetScript("OnEnter", nil)
	WorldMapButton:SetScript("OnLeave", nil)
	PlayerArrowFrame:SetModelScale(1)
	PlayerArrowEffectFrame:SetModelScale(1)
	if WorldMapFrame:IsShown() then
		ToggleFrame(WorldMapFrame)
		ToggleFrame(WorldMapFrame)
	end
	Cartographer:RefreshSideTablet()
	WorldMapMagnifyingGlassButton:Show()
end

function Cartographer_LookNFeel:MODIFIER_STATE_CHANGED()
	if self.db.profile.locked then
		if IsAltKeyDown() then
			WorldMapFrame:EnableMouse(true)
			WorldMapFrame:EnableMouseWheel(true)
			WorldMapButton:EnableMouse(true)
			WorldMapMagnifyingGlassButton:EnableMouse(true)
			lockButton:SetChecked(false)
			local button = Cartographer:GetInstanceWorldMapButton()
			if button then
				button:EnableMouse(true)
			end
		else
			WorldMapFrame:EnableMouse(false)
			WorldMapFrame:EnableMouseWheel(false)
			WorldMapButton:EnableMouse(false)
			WorldMapMagnifyingGlassButton:EnableMouse(false)
			lockButton:SetChecked(true)
			local button = Cartographer:GetInstanceWorldMapButton()
			if button then
				button:EnableMouse(false)
			end
		end
	end
end

function Cartographer_LookNFeel:ShowWorldMapArrowFrame()
	--return self.hooks.ShowWorldMapArrowFrame(nil)
end

function Cartographer_LookNFeel:WorldMapButton_OnUpdate()
	WorldMapPlayer:SetScale(1)
end

function Cartographer_LookNFeel:FixAddedFrames()
	local detail_framelevel = WorldMapDetailFrame:GetFrameLevel()
	for i,v in fake_ipairs(WorldMapDetailFrame:GetChildren()) do
		if v ~= self.overlayHolder and v ~= self.nonOverlayHolder then
			local framelevel = v:GetFrameLevel()
			refixParent(v)
			v:SetFrameLevel(v:GetParent():GetFrameLevel() - detail_framelevel + framelevel + 3)
		end
	end
end

function Cartographer_LookNFeel:CloseSpecialWindows()
    if event == "PLAYER_DEAD" and debugstack():find("`UIParent_OnEvent'") then
        return self.hooks.CloseSpecialWindows()
    end
	local found = self.hooks.CloseSpecialWindows()
	if self.db.profile.useEscape then
		if WorldMapFrame:IsShown() then
			ToggleFrame(WorldMapFrame)
			return 1
		end
	end
	return found
end

function Cartographer_LookNFeel:WorldMapDetailFrame_CreateTexture(WorldMapDetailFrame, name, layer)
	if name and name:find("^WorldMapOverlay%d+$") then
		local frame = _G[name]

		frame:SetParent(self.overlayHolder)
	end
end

local newTexture, clearTextures
do
	local cache = {}
	local num = 12
	function newTexture(tex)
		local texture = next(cache)
		if texture then
			cache[texture] = nil
			texture:SetWidth(256)
			texture:SetHeight(256)
			texture:SetTexCoord(0, 1, 0, 1)
			texture:ClearAllPoints()
			texture:SetPoint(tex:GetPoint(1))
			texture:SetTexture(tex:GetTexture())
			texture:Show()
			return texture
		end
		num = num + 1
		texture = WorldMapDetailFrame:CreateTexture("WorldMapDetailTile" .. num, "BACKGROUND")
		texture:SetWidth(256)
		texture:SetHeight(256)
		texture:SetPoint(tex:GetPoint(1))
		texture:SetTexture(tex:GetTexture())
		return texture
	end
	function clearTextures()
		for i = 13, num do
			local tex = _G["WorldMapDetailTile" .. i]
			if tex:IsShown() then
				cache[tex] = true
				tex:Hide()
			end
		end
	end
end

local dirty = true
function Cartographer_LookNFeel:Cartographer_ChangeZone(ns, event, zone)
	if dirty then
		for i = 1, 12 do
			local tex = _G["WorldMapDetailTile" .. i]
			local x = math.fmod(i-1, 4) * 256
			local y = -math.floor((i-1)/4) * 256
			tex:ClearAllPoints()
			tex:SetWidth(256)
			tex:SetHeight(256)
			tex:SetTexCoord(0, 1, 0, 1)
			tex:Show()
			--tex:SetPoint("TOPLEFT", WorldMapDetailFrame, "TOPLEFT", x, y)
		end
		WorldMapDetailTile1:SetPoint("BOTTOMRIGHT", WorldMapDetailFrame, "TOPLEFT", 256, -256)
		WorldMapDetailTile2:SetPoint("BOTTOMRIGHT", WorldMapDetailFrame, "TOPLEFT", 512, -256)
		WorldMapDetailTile3:SetPoint("BOTTOMLEFT", WorldMapDetailFrame, "TOPLEFT", 512, -256)
		WorldMapDetailTile4:SetPoint("BOTTOMLEFT", WorldMapDetailFrame, "TOPLEFT", 768, -256)
		WorldMapDetailTile5:SetPoint("TOPRIGHT", WorldMapDetailFrame, "TOPLEFT", 256, -256)
		WorldMapDetailTile6:SetPoint("TOPRIGHT", WorldMapDetailFrame, "TOPLEFT", 512, -256)
		WorldMapDetailTile7:SetPoint("TOPLEFT", WorldMapDetailFrame, "TOPLEFT", 512, -256)
		WorldMapDetailTile8:SetPoint("TOPLEFT", WorldMapDetailFrame, "TOPLEFT", 768, -256)
		WorldMapDetailTile9:SetPoint("TOPRIGHT", WorldMapDetailFrame, "TOPLEFT", 256, -512)
		WorldMapDetailTile10:SetPoint("TOPRIGHT", WorldMapDetailFrame, "TOPLEFT", 512, -512)
		WorldMapDetailTile11:SetPoint("TOPLEFT", WorldMapDetailFrame, "TOPLEFT", 512, -512)
		WorldMapDetailTile12:SetPoint("TOPLEFT", WorldMapDetailFrame, "TOPLEFT", 768, -512)
		clearTextures()
		dirty = false
	end
	if zone == "Warsong Gulch" then
		WorldMapDetailTile1:Hide()
		WorldMapDetailTile4:Hide()
		WorldMapDetailTile5:Hide()
		WorldMapDetailTile8:Hide()
		WorldMapDetailTile9:Hide()
		WorldMapDetailTile12:Hide()
		newTexture(WorldMapDetailTile1)
		newTexture(WorldMapDetailTile2)
		newTexture(WorldMapDetailTile3)
		newTexture(WorldMapDetailTile4)
		newTexture(WorldMapDetailTile5)
		newTexture(WorldMapDetailTile6)
		newTexture(WorldMapDetailTile7)
		newTexture(WorldMapDetailTile8)
		newTexture(WorldMapDetailTile9)
		newTexture(WorldMapDetailTile10)
		newTexture(WorldMapDetailTile11)
		newTexture(WorldMapDetailTile12)

		WorldMapDetailTile2:SetWidth(206)
		WorldMapDetailTile2:SetHeight(206)
		WorldMapDetailTile2:SetTexCoord(50/256, 1, 50/256, 1)

		WorldMapDetailTile6:SetWidth(206)
		WorldMapDetailTile6:SetTexCoord(50/256, 1, 0, 1)

		WorldMapDetailTile10:SetWidth(206)
		WorldMapDetailTile10:SetHeight(128)
		WorldMapDetailTile10:SetTexCoord(50/256, 1, 0, 128/256)

		WorldMapDetailTile3:SetWidth(181)
		WorldMapDetailTile3:SetHeight(206)
		WorldMapDetailTile3:SetTexCoord(0, 181/256, 50/256, 1)

		WorldMapDetailTile7:SetWidth(181)
		WorldMapDetailTile7:SetTexCoord(0, 181/256, 0, 1)

		WorldMapDetailTile11:SetWidth(181)
		WorldMapDetailTile11:SetHeight(128)
		WorldMapDetailTile11:SetTexCoord(0, 181/256, 0, 128/256)

		dirty = true
	elseif zone == "Arathi Basin" then
		WorldMapDetailTile1:Hide()
		WorldMapDetailTile4:Hide()
		WorldMapDetailTile5:Hide()
		WorldMapDetailTile8:Hide()
		WorldMapDetailTile9:Hide()
		WorldMapDetailTile10:Hide()
		WorldMapDetailTile11:Hide()
		WorldMapDetailTile12:Hide()
		newTexture(WorldMapDetailTile1)
		newTexture(WorldMapDetailTile2)
		newTexture(WorldMapDetailTile3)
		newTexture(WorldMapDetailTile4)
		newTexture(WorldMapDetailTile5)
		newTexture(WorldMapDetailTile6)
		newTexture(WorldMapDetailTile7)
		newTexture(WorldMapDetailTile8)
		newTexture(WorldMapDetailTile9)
		newTexture(WorldMapDetailTile10)
		newTexture(WorldMapDetailTile11)
		newTexture(WorldMapDetailTile12)

		WorldMapDetailTile2:SetWidth(191)
		WorldMapDetailTile2:SetHeight(136)
		WorldMapDetailTile2:SetTexCoord(65/256, 1, 120/256, 1)

		WorldMapDetailTile3:SetWidth(146)
		WorldMapDetailTile3:SetHeight(136)
		WorldMapDetailTile3:SetTexCoord(0, 146/256, 120/256, 1)

		WorldMapDetailTile6:SetWidth(191)
		WorldMapDetailTile6:SetHeight(206)
		WorldMapDetailTile6:SetTexCoord(65/256, 1, 0, 206/256)

		WorldMapDetailTile7:SetWidth(146)
		WorldMapDetailTile7:SetHeight(206)
		WorldMapDetailTile7:SetTexCoord(0, 146/256, 0, 206/256)
		dirty = true
	elseif zone == "Alterac Valley" then
		WorldMapDetailTile1:Hide()
		WorldMapDetailTile4:Hide()
		WorldMapDetailTile5:Hide()
		WorldMapDetailTile8:Hide()
		WorldMapDetailTile9:Hide()
		WorldMapDetailTile12:Hide()
		newTexture(WorldMapDetailTile1)
		newTexture(WorldMapDetailTile2)
		newTexture(WorldMapDetailTile3)
		newTexture(WorldMapDetailTile4)
		newTexture(WorldMapDetailTile5)
		newTexture(WorldMapDetailTile6)
		newTexture(WorldMapDetailTile7)
		newTexture(WorldMapDetailTile8)
		newTexture(WorldMapDetailTile9)
		newTexture(WorldMapDetailTile10)
		newTexture(WorldMapDetailTile11)
		newTexture(WorldMapDetailTile12)

		WorldMapDetailTile2:SetWidth(156)
		WorldMapDetailTile2:SetHeight(231)
		WorldMapDetailTile2:SetTexCoord(100/256, 1, 25/256, 1)

		WorldMapDetailTile6:SetWidth(156)
		WorldMapDetailTile6:SetTexCoord(100/256, 1, 0, 1)

		WorldMapDetailTile10:SetWidth(156)
		WorldMapDetailTile10:SetHeight(128)
		WorldMapDetailTile10:SetTexCoord(100/256, 1, 0, 128/256)

		WorldMapDetailTile3:SetWidth(100)
		WorldMapDetailTile3:SetHeight(231)
		WorldMapDetailTile3:SetTexCoord(0, 100/256, 25/256, 1)

		WorldMapDetailTile7:SetWidth(100)
		WorldMapDetailTile7:SetTexCoord(0, 100/256, 0, 1)

		WorldMapDetailTile11:SetWidth(100)
		WorldMapDetailTile11:SetHeight(128)
		WorldMapDetailTile11:SetTexCoord(0, 100/256, 0, 128/256)

		dirty = true
	elseif zone == "Eye of the Storm" then
		WorldMapDetailTile1:Hide()
		WorldMapDetailTile4:Hide()
		WorldMapDetailTile5:Hide()
		WorldMapDetailTile8:Hide()
		WorldMapDetailTile9:Hide()
		WorldMapDetailTile12:Hide()
		newTexture(WorldMapDetailTile1)
		newTexture(WorldMapDetailTile2)
		newTexture(WorldMapDetailTile3)
		newTexture(WorldMapDetailTile4)
		newTexture(WorldMapDetailTile5)
		newTexture(WorldMapDetailTile6)
		newTexture(WorldMapDetailTile7)
		newTexture(WorldMapDetailTile8)
		newTexture(WorldMapDetailTile9)
		newTexture(WorldMapDetailTile10)
		newTexture(WorldMapDetailTile11)
		newTexture(WorldMapDetailTile12)

		WorldMapDetailTile2:SetHeight(156)
		WorldMapDetailTile2:SetWidth(156)
		WorldMapDetailTile2:SetTexCoord(100/256, 1, 100/256, 1)
		WorldMapDetailTile6:SetWidth(156)
		WorldMapDetailTile6:SetTexCoord(100/256, 1, 0, 1)
		WorldMapDetailTile10:SetWidth(156)
		WorldMapDetailTile10:SetHeight(32)
		WorldMapDetailTile10:SetTexCoord(100/256, 1, 0, 32/256)

		WorldMapDetailTile3:SetHeight(156)
		WorldMapDetailTile3:SetWidth(100)
		WorldMapDetailTile3:SetTexCoord(0, 100/256, 100/256, 1)
		WorldMapDetailTile7:SetWidth(100)
		WorldMapDetailTile7:SetTexCoord(0, 100/256, 0, 1)
		WorldMapDetailTile11:SetWidth(100)
		WorldMapDetailTile11:SetHeight(32)
		WorldMapDetailTile11:SetTexCoord(0, 100/256, 0, 32/256)

		dirty = true
	end
	self:SetAlpha(self:GetAlpha())
end

function Cartographer_LookNFeel:GetAlpha()
	return self.db.profile.alpha or 0.85
end

function Cartographer_LookNFeel:SetAlpha(value)
	self.db.profile.alpha = value
	if Cartographer:IsModuleActive(self) then
		self.nonOverlayHolder:SetAlpha(value or 0.85)
		self.overlayHolder:SetAlpha(self.db.profile.overlayAlpha or 1)

		refixParent(WorldMapDetailFrame)
	end
end

function Cartographer_LookNFeel:GetOverlayAlpha()
	return self.db.profile.overlayAlpha or 1
end

function Cartographer_LookNFeel:SetOverlayAlpha(value)
	self.db.profile.overlayAlpha = value
	if Cartographer:IsModuleActive(self) then
		self.nonOverlayHolder:SetAlpha(self.db.profile.alpha or 0.85)
		self.overlayHolder:SetAlpha(value or 1)
	end
end

function Cartographer_LookNFeel:GetScale()
	return self.db.profile.scale or 0.75
end

function Cartographer_LookNFeel:SetScale(value)
	self.db.profile.scale = value

	if Cartographer:IsModuleActive(self) then
		WorldMapFrame:SetScale(value)
		Cartographer:RefreshSideTablet()
		self:CheckOffScreen()
		self:SetStrata(self:GetStrata())
	end
end

function Cartographer_LookNFeel:GetTooltipScale()
	return self.db.profile.ttScale or 1
end

function Cartographer_LookNFeel:SetTooltipScale(value)
	self.db.profile.ttScale = value

	if Cartographer:IsModuleActive(self) then
		AceLibrary("Tablet-2.0"):SetFontSizePercent(Cartographer.tooltipData, value)
	end
end

function Cartographer_LookNFeel:IsLocked()
	return self.db.profile.locked
end

function Cartographer_LookNFeel:ToggleLocked(value)
	if value == nil then
		value = not self.db.profile.locked
	end
	self.db.profile.locked = value
	if Cartographer:IsModuleActive(self) then
		WorldMapFrame:EnableMouse(not value)
		WorldMapFrame:EnableMouseWheel(not value)
		WorldMapButton:EnableMouse(not value)
		WorldMapMagnifyingGlassButton:EnableMouse(not value)
		local button = Cartographer:GetInstanceWorldMapButton()
		if button then
			button:EnableMouse(not value)
		end
	end
end

function Cartographer_LookNFeel:IsUsingEscape()
	return self.db.profile.useEscape
end

function Cartographer_LookNFeel:ToggleUsingEscape(value)
	if value == nil then
		value = not self.db.profile.useEscape
	end
	self.db.profile.useEscape = value
end

function Cartographer_LookNFeel:GetRealTooltipScale()
	return self.db.profile.ttScale or 1
end

function Cartographer_LookNFeel:IsLargePlayerPOI()
	return self.db.profile.largePlayer
end

function Cartographer_LookNFeel:ToggleLargePlayerPOI(value)
	if value == nil then
		value = not self.db.profile.largePlayer
	end
	self.db.profile.largePlayer = value

	PlayerArrowFrame:SetModelScale(value and 1.5 or 1)
	PlayerArrowEffectFrame:SetModelScale(value and 1.5 or 1)
end

function Cartographer_LookNFeel:GetStrata()
	return self.db.profile.strata or "Auto"
end

function Cartographer_LookNFeel:SetStrata(value)
	if not value then
		value = "Auto"
	end
	self.db.profile.strata = value;
	if value=="Auto" then
		if(self:GetScale()<0.6) then
			value = "MEDIUM"
		else
			value = "FULLSCREEN"
		end
	end
	WorldMapFrame:SetFrameStrata(value)
	WorldMapDetailFrame:SetFrameStrata(value)
end

function Cartographer_LookNFeel:IsShowingMinimapButton()
	return self.db.profile.showMinimapButton
end

function Cartographer_LookNFeel:ToggleShowingMinimapButton(value)
	if value == nil then
		value = not self.db.profile.showMinimapButton
	end
	self.db.profile.showMinimapButton = value

	if Cartographer:IsModuleActive(self) then
		if value then
			MiniMapWorldMapButton:Show()
		else
			MiniMapWorldMapButton:Hide()
		end
	end
end

function Cartographer_LookNFeel:IsShowingInformationalText()
	return self.db.profile.showInformationalText
end

function Cartographer_LookNFeel:ToggleShowingInformationalText(value)
	if value == nil then
		value = not self.db.profile.showInformationalText
	end
	self.db.profile.showInformationalText = value

	if Cartographer:IsModuleActive(self) then
		if value then
			WorldMapMagnifyingGlassButton:Show()
		else
			WorldMapMagnifyingGlassButton:Hide()
		end
	end
end

function Cartographer_LookNFeel:CheckOffScreen()
	local scale = WorldMapFrame:GetEffectiveScale()
	local left = WorldMapFrame:GetLeft()
	local top = WorldMapFrame:GetTop()
	local bottom = WorldMapFrame:GetBottom()
	local right = WorldMapFrame:GetRight()
	local uiscale = UIParent:GetEffectiveScale()
	local screenWidth = GetScreenWidth()*uiscale
	local screenHeight = GetScreenHeight()*uiscale
	if left*scale > screenWidth-20 then
		local a,b,c,x,y = WorldMapFrame:GetPoint()
		x = screenWidth/2/scale-WorldMapFrame:GetWidth()/2
		self.db.profile.x = x
		WorldMapFrame:SetPoint(a,b,c, x, y)
	elseif right*scale < 20 then
		local a,b,c,x,y = WorldMapFrame:GetPoint()
		x = -screenWidth/2/scale+WorldMapFrame:GetWidth()/2
		self.db.profile.x = x
		WorldMapFrame:SetPoint(a,b,c, x, y)
	end
	if bottom*scale > screenHeight-20 then
		local a,b,c,x,y = WorldMapFrame:GetPoint()
		y = screenHeight/2/scale-WorldMapFrame:GetHeight()/2
		self.db.profile.y = y
		WorldMapFrame:SetPoint(a,b,c, x, y)
	elseif top*scale < 20 then
		local a,b,c,x,y = WorldMapFrame:GetPoint()
		y = -screenHeight/2/scale+WorldMapFrame:GetHeight()/2
		self.db.profile.y = y
		WorldMapFrame:SetPoint(a,b,c, x, y)
	end
end

function Cartographer_LookNFeel:OnProfileEnable()
	WorldMapFrame:SetPoint("CENTER", "UIParent", "CENTER", self.db.profile.x or 0, self.db.profile.y or 0)
	self:SetScale(self:GetScale())
	self:SetAlpha(self:GetAlpha())
	self:SetStrata(self:GetStrata())
	self:SetOverlayAlpha(self:GetOverlayAlpha())
	self:SetTooltipScale(self:GetTooltipScale())
	self:ToggleLocked(self:IsLocked())
	self:ToggleLargePlayerPOI(self:IsLargePlayerPOI())
	self:ToggleShowingMinimapButton(self:IsShowingMinimapButton())
	self:ToggleShowingInformationalText(self:IsShowingInformationalText())
end

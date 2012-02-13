assert(Cartographer, "Cartographer not found!")

if Cartographer3 and Cartographer3.hijackingWorldMap then
	return
end

local Cartographer = Cartographer
local revision = tonumber(("$Revision: 2250 $"):sub(12, -3))
if revision > Cartographer.revision then
	Cartographer.version = "r" .. revision
	Cartographer.revision = revision
	Cartographer.date = ("$Date: 2008-10-07 23:10:53 +0000 (Tue, 07 Oct 2008) $"):sub(8, 17)
end

local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer-Coordinates")

L:AddTranslations("enUS", function() return {
	["Coordinates"] = true,
	["Module to add coordinates to the bottom of the world map of the player and the cursor."] = true,

	["Cursor"] = true,
	["Player"] = true,

	["High precision"] = true,
	["Show high precision coordinates"] = true,

	["Background color"] = true,
	["The color of the background frame behind coordinates"] = true,

	["Text color"] = true,
	["The color of the coordinates"] = true,

	["Text size"] = true,
	["The size of the coordinates"] = true,

	["Show background"] = true,
	["Show background frame behind coordinates"] = true,

	["%.0f yd"] = true,
	["%.0f m"] = true,
} end)

L:AddTranslations("deDE", function() return {
	["Coordinates"] = "Koordinaten",
	["Module to add coordinates to the bottom of the world map of the player and the cursor."] = "Modul zur Anzeige der Spieler- und Mauszeiger-Koordinaten im unteren Bereich der Weltkarte.",

	["Cursor"] = "Mauszeiger",
	["Player"] = "Spieler",

	["High precision"] = "Hohe Genauigkeit",
	["Show high precision coordinates"] = "Koordinaten mit hoher Genauigkeit anzeigen",

	["Background color"] = "Hintergrundfarbe",
	["The color of the background frame behind coordinates"] = "Die Farbe des Hintergrundes hinter den Koordinaten.",

	["Text color"] = "Textfarbe",
	["The color of the coordinates"] = "Die Farbe der Koordinatenanzeige.",

	["Text size"] = "Schriftgröße",
	["The size of the coordinates"] = "Die Schriftgröße der Koordinatenanzeige.",

	["Show background"] = "Zeige Hintergrund",
	["Show background frame behind coordinates"] = "Zeige Hintergrundfenster hinter den Koordinaten.",
} end)


L:AddTranslations("frFR", function() return {
	["Coordinates"] = "Coordonnées",
	["Module to add coordinates to the bottom of the world map of the player and the cursor."] = "Modules indiquant les coordonnées du joueur et du curseur en bas de la carte du monde.",

	["Cursor"] = "Curseur ",
	["Player"] = "Joueur ",

	["High precision"] = "Haute précision",
	["Show high precision coordinates"] = "Affiche les coordonnées avec une meilleure précision.",

	["Background color"] = "Couleur de l'arrière-plan",
	["The color of the background frame behind coordinates"] = "Détermine la couleur de l'arrière-plan des coordonnées.",

	["Text color"] = "Couleur du texte",
	["The color of the coordinates"] = "Détermine la couleur des coordonnées.",

	["Text size"] = "Taille du texte",
	["The size of the coordinates"] = "Détermine la taille des coordonnées.",

	["Show background"] = "Afficher l'arrière-plan",
	["Show background frame behind coordinates"] = "Affiche ou non un arrière-plan derrière les coordonnées.",
} end)

L:AddTranslations("koKR", function() return {
	["Coordinates"] = "좌표",
	["Module to add coordinates to the bottom of the world map of the player and the cursor."] = "세계 지도의 하단에 플레이어와 커서의 좌표를 표시합니다.",

	["Cursor"] = "커서",
	["Player"] = "플레이어",

	["High precision"] = "상세 좌표 표시",
	["Show high precision coordinates"] = "소수점 첫째짜리 까지의 상세 좌표를 표시합니다.",

	["Background color"] = "배경 색상",
	["The color of the background frame behind coordinates"] = "좌표 뒤의 배경 프레임의 색상을 변경합니다.",

	["Text color"] = "글자 색상",
	["The color of the coordinates"] = "좌표 글자의 색상을 변경합니다.",

	["Text size"] = "글자 크기",
	["The size of the coordinates"] = "좌표 글자의 크기를 변경합니다.",

	["Show background"] = "배경 표시",
	["Show background frame behind coordinates"] = "좌표 뒤의 배경 프레임을 표시합니다.",

	["%.0f yd"] = "%.0f yd",
	["%.0f m"] = "%.0f 미터",
} end)

L:AddTranslations("zhTW", function() return {
	["Coordinates"] = "座標",
	["Module to add coordinates to the bottom of the world map of the player and the cursor."] = "在世界地圖底端增加游標和玩家目前座標的模組。",

	["Cursor"] = "游標",
	["Player"] = "玩家",

	["High precision"] = "高精度",
	["Show high precision coordinates"] = "顯示高精度座標",

	["Background color"] = "背景顏色",
	["The color of the background frame behind coordinates"] = "座標背景視窗的顏色",

	["Text color"] = "文字顏色",
	["The color of the coordinates"] = "座標的顏色",

	["Text size"] = "文字大小",
	["The size of the coordinates"] = "座標的大小",

	["Show background"] = "顯示背景",
	["Show background frame behind coordinates"] = "顯示座標的背景視窗",

	["%.0f yd"] = "%.0f碼",
	["%.0f m"] = "%.0f米",
} end)

L:AddTranslations("esES", function() return {
	["Coordinates"] = "Coordenadas",
	["Module to add coordinates to the bottom of the world map of the player and the cursor."] = "Módulo para añadir coordenadas del jugador y cursor en la parte inferior del mapa del mundo",

	["Cursor"] = "Cursor",
	["Player"] = "Jugador",

	["High precision"] = "Alta precisión",
	["Show high precision coordinates"] = "Muestra coordenadas con alta precisión",

	["Background color"] = "Color de fondo",
	["The color of the background frame behind coordinates"] = "El color del fondo del marco tras las coordenadas",

	["Text color"] = "Color del texto",
	["The color of the coordinates"] = "El color de las coordenadas",

	["Text size"] = "Tamaño del texto",
	["The size of the coordinates"] = "El tamaño de las coordenadas",

	["Show background"] = "Mostrar fondo",
	["Show background frame behind coordinates"] = "Muestra el marco de fondo tras las coordenadas",
} end)

L:AddTranslations("zhCN", function() return {
	["Coordinates"] = "坐标",
	["Module to add coordinates to the bottom of the world map of the player and the cursor."] = "在世界地图底部显示鼠标所在位置坐标和玩家当前坐标。",

	["Cursor"] = "鼠标",
	["Player"] = "玩家",

	["High precision"] = "高精度",
	["Show high precision coordinates"] = "显示精确坐标。",

	["Background color"] = "背景颜色",
	["The color of the background frame behind coordinates"] = "坐标背景颜色。",

	["Text color"] = "文字颜色",
	["The color of the coordinates"] = "坐标文字颜色。",

	["Text size"] = "文字大小",
	["The size of the coordinates"] = "坐标文字大小。",

	["Show background"] = "显示背景",
	["Show background frame behind coordinates"] = "显示坐标背景。",

	["%.0f yd"] = "%.0f 码",
	["%.0f m"] = "%.0f 米",
} end)

-- Russian Translation by StingerSoft (Eritnull aka Шептун)
L:AddTranslations("ruRU", function() return {
	["Coordinates"] = "Координаты",
	["Module to add coordinates to the bottom of the world map of the player and the cursor."] = "Модуль добавляет координаты персонажа и курсора в нижнюю часть карты.",

	["Cursor"] = "Курсор",
	["Player"] = "Персонаж",

	["High precision"] = "Высокая точность",
	["Show high precision coordinates"] = "Показывает координаты с высокой точностью (к примеру: не 55/55 а уже будет 55.5/55.5)",

	["Background color"] = "Цвет фона",
	["The color of the background frame behind coordinates"] = "Цвет фона фрейма за координатами",

	["Text color"] = "Цвет текста",
	["The color of the coordinates"] = "Цвет координат",

	["Text size"] = "Размер текста",
	["The size of the coordinates"] = "Размер координат",

	["Show background"] = "Показать фон",
	["Show background frame behind coordinates"] = "Показать фоновой фрейм за координатами",

	["%.0f yd"] = "%.0f ярд",
	["%.0f m"] = "%.0f м",
} end)

Cartographer_Coordinates = Cartographer:NewModule("Coordinates")
local Cartographer_Coordinates = Cartographer_Coordinates

local Tourist = Rock("LibTourist-3.0")

function Cartographer_Coordinates:OnInitialize()
	self.db = Cartographer:GetDatabaseNamespace("Coordinates")
	Cartographer:SetDatabaseNamespaceDefaults("Coordinates", "profile", {
		background = false,
		backgroundR = 0,
		backgroundG = 0,
		backgroundB = 0,
		backgroundA = 1,
		textR = 1,
		textG = 0.82,
		textB = 0,
		textA = 1,
		textSize = 1,
		highPrec = true,
	})

	Cartographer.options.args.Coordinates = {
		name = L["Coordinates"],
		desc = L["Module to add coordinates to the bottom of the world map of the player and the cursor."],
		type = 'group',
		args = {
			highPrec = {
				name = L["High precision"],
				desc = L["Show high precision coordinates"],
				type = "toggle",
				get = "IsShowingHighPrecision",
				set = "ToggleShowingHighPrecision",
			},
			bgColor = {
				name = L["Background color"],
				desc = L["The color of the background frame behind coordinates"],
				type = "color",
				get = "GetBackgroundColor",
				set = "SetBackgroundColor",
				hasAlpha = true,
				disabled = "~IsShowingBackground"
			},
			color = {
				name = L["Text color"],
				desc = L["The color of the coordinates"],
				type = "color",
				get = "GetTextColor",
				set = "SetTextColor",
				hasAlpha = true,
			},
			size = {
				name = L["Text size"],
				desc = L["The size of the coordinates"],
				type = "range",
				get = "GetTextSize",
				set = "SetTextSize",
				min = 0.5,
				max = 1.5,
				isPercent = true,
				step = 0.01,
				bigStep = 0.05,
			},
			background = {
				name = L["Show background"],
				desc = L["Show background frame behind coordinates"],
				type = "toggle",
				get = "IsShowingBackground",
				set = "ToggleShowingBackground",
			},
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

function Cartographer_Coordinates:OnEnable()
	if not self.frame then
		self.frame = CreateFrame("Frame", "CartographerCoordinates", WorldMapFrame)
		self.frame:SetScript("OnUpdate", self.OnUpdate)

		self.frame.cursorCoords = self.frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
		self.frame.cursorCoords:SetPoint("RIGHT", WorldMapFrame, "CENTER", -80, -367)
		self.frame.cursorCoords:SetTextColor(self:GetTextColor())
		local font,_,style = self.frame.cursorCoords:GetFont()
		self.frame.cursorCoords:SetFont(font,self:GetTextSize()*12,style)

		self.frame.playerCoords = self.frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
		self.frame.playerCoords:SetPoint("LEFT", WorldMapFrame, "CENTER", 80, -367)
		self.frame.playerCoords:SetTextColor(self:GetTextColor())
		local font,_,style = self.frame.playerCoords:GetFont()
		self.frame.playerCoords:SetFont(font,self:GetTextSize()*12,style)

		self.frame.yardsAway = self.frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
		self.frame.yardsAway:SetPoint("CENTER", WorldMapFrame, "CENTER", 0, -367)
		self.frame.yardsAway:SetTextColor(self:GetTextColor())
		local font,_,style = self.frame.yardsAway:GetFont()
		self.frame.yardsAway:SetFont(font,self:GetTextSize()*12,style)

		self.background1 = CreateFrame("Frame", "CartographerCoordinatesBackground1", WorldMapFrame)
		self.background1:SetPoint("TOPLEFT", self.frame.cursorCoords, "TOPLEFT", -3, 3)
		self.background1:SetPoint("BOTTOMRIGHT", self.frame.cursorCoords, "BOTTOMRIGHT", 3, -3)
		local tex = self.background1:CreateTexture()
		self.background1.texture = tex
		tex:SetAllPoints(self.background1)
		tex:SetTexture(self:GetBackgroundColor())

		self.background2 = CreateFrame("Frame", "CartographerCoordinatesBackground2", WorldMapFrame)
		self.background2:SetPoint("TOPLEFT", self.frame.playerCoords, "TOPLEFT", -3, 3)
		self.background2:SetPoint("BOTTOMRIGHT", self.frame.playerCoords, "BOTTOMRIGHT", 3, -3)
		local tex = self.background2:CreateTexture()
		self.background2.texture = tex
		tex:SetAllPoints(self.background2)
		tex:SetTexture(self:GetBackgroundColor())

		self.background3 = CreateFrame("Frame", "CartographerCoordinatesBackground3", WorldMapFrame)
		self.background3:SetPoint("TOPLEFT", self.frame.yardsAway, "TOPLEFT", -3, 3)
		self.background3:SetPoint("BOTTOMRIGHT", self.frame.yardsAway, "BOTTOMRIGHT", 3, -3)
		local tex = self.background3:CreateTexture()
		self.background3.texture = tex
		tex:SetAllPoints(self.background3)
		tex:SetTexture(self:GetBackgroundColor())
	end
	if not self.db.profile.background then
		self.background1:Hide()
		self.background2:Hide()
		self.background3:Hide()
	else
		self.background1:Show()
		self.background2:Show()
		self.background3:Show()
	end
	self.frame:Show()
end

function Cartographer_Coordinates:OnDisable()
	self.frame:Hide()
	self.background1:Hide()
	self.background2:Hide()
	self.background3:Hide()
end

local metric = (GetLocale() ~= "enUS" and GetLocale() ~= "zhTW" and GetLocale() ~= "zhCN")

local formatHighStr, formatLowStr
do
	if ("%.1f"):format(1.1) == "1,1" then
		formatHighStr = "%s: %.1f x %.1f"
		formatLowStr = "%s: %.0f x %.0f"
	else
		formatHighStr = "%s: %.1f, %.1f"
		formatLowStr = "%s: %.0f, %.0f"
	end
end
local last_px, last_py, last_zone
function Cartographer_Coordinates.OnUpdate()
	local self = Cartographer_Coordinates
	local x, y = GetCursorPosition()

	local px, py = GetPlayerMapPosition("player")

	local formatStr = Cartographer_Coordinates.db.profile.highPrec and formatHighStr or formatLowStr
	local cx, cy = self:GetMouseXY()

	if cx then
		self.frame.cursorCoords:SetText(formatStr:format(L["Cursor"], 100 * cx, 100 * cy))
	else
		self.frame.cursorCoords:SetText("")
	end
	if px == 0 or py == 0 or ((IsInInstance() or Cartographer:GetCurrentInstance()) and select(2, IsInInstance()) ~= "pvp") then
		self.frame.playerCoords:SetText("")
		if last_zone and cx then
			local distance = Tourist:GetYardDistance(last_zone, last_px, last_py, Cartographer:GetCurrentLocalizedZoneName(), cx, cy)

			if distance then
				self.frame.yardsAway:SetText((metric and L["%.0f m"] or L["%.0f yd"]):format(distance))
			else
				self.frame.yardsAway:SetText("")
			end
		else
			self.frame.yardsAway:SetText("")
		end
	else
		last_px, last_py, last_zone = px, py, Cartographer:GetCurrentLocalizedZoneName()
		self.frame.playerCoords:SetText(formatStr:format(L["Player"], 100 * px, 100 * py))
		if cx then
			local distance = Tourist:GetYardDistance(last_zone, px, py, last_zone, cx, cy)

			if distance then
				self.frame.yardsAway:SetText((metric and L["%.0f m"] or L["%.0f yd"]):format(distance))
			else
				self.frame.yardsAway:SetText("")
			end
		else
			self.frame.yardsAway:SetText("")
		end
	end
end

function Cartographer_Coordinates:GetMouseXY()

	local x, y = GetCursorPosition()
	local left, top = WorldMapDetailFrame:GetLeft(), WorldMapDetailFrame:GetTop()
	local width = WorldMapDetailFrame:GetWidth()
	local height = WorldMapDetailFrame:GetHeight()
	local scale = WorldMapDetailFrame:GetEffectiveScale()
	local cx = (x/scale - left) / width
	local cy = (top - y/scale) / height


	if cx < 0 or cx > 1 or cy < 0 or cy > 1 then
		cx, cy = nil, nil
	end

	return cx, cy

end


function Cartographer_Coordinates:IsShowingHighPrecision()
	return self.db.profile.highPrec
end

function Cartographer_Coordinates:ToggleShowingHighPrecision(value)
	if value == nil then
		value = not self.db.profile.highPrec
	end
	self.db.profile.highPrec = value
end

function Cartographer_Coordinates:IsShowingBackground()
	return self.db.profile.background
end

function Cartographer_Coordinates:ToggleShowingBackground(value)
	if value == nil then
		value = not self.db.profile.background
	end
	self.db.profile.background = value

	if not value then
		self.background1:Hide()
		self.background2:Hide()
		self.background3:Hide()
	else
		self.background1:Show()
		self.background2:Show()
		self.background3:Show()
	end
end

function Cartographer_Coordinates:GetBackgroundColor()
	return self.db.profile.backgroundR, self.db.profile.backgroundG, self.db.profile.backgroundB, self.db.profile.backgroundA
end

function Cartographer_Coordinates:SetBackgroundColor(r, g, b, a)
	self.db.profile.backgroundR, self.db.profile.backgroundG, self.db.profile.backgroundB, self.db.profile.backgroundA = r, g, b, a

	self.background1.texture:SetTexture(r, g, b, a)
	self.background2.texture:SetTexture(r, g, b, a)
	self.background3.texture:SetTexture(r, g, b, a)
end

function Cartographer_Coordinates:GetTextColor()
	return self.db.profile.textR, self.db.profile.textG, self.db.profile.textB, self.db.profile.textA
end

function Cartographer_Coordinates:SetTextColor(r, g, b, a)
	self.db.profile.textR, self.db.profile.textG, self.db.profile.textB, self.db.profile.textA = r, g, b, a

	self.frame.cursorCoords:SetTextColor(r, g, b, a)
	self.frame.playerCoords:SetTextColor(r, g, b, a)
	self.frame.yardsAway:SetTextColor(r, g, b, a)
end

function Cartographer_Coordinates:GetTextSize()
	return self.db.profile.textSize
end

function Cartographer_Coordinates:SetTextSize(value)
	self.db.profile.textSize = value

	local font,_,style = self.frame.cursorCoords:GetFont()
	self.frame.cursorCoords:SetFont(font,value*12,style)
	local font,_,style = self.frame.playerCoords:GetFont()
	self.frame.playerCoords:SetFont(font,value*12,style)
	local font,_,style = self.frame.yardsAway:GetFont()
	self.frame.yardsAway:SetFont(font,value*12,style)
end

function Cartographer_Coordinates:OnProfileEnable()
	self:SetTextSize(self:GetTextSize())
	self:SetTextColor(self:GetTextColor())
	self:SetBackgroundColor(self:GetBackgroundColor())
	self:ToggleShowingBackground(self:IsShowingBackground())
	self:ToggleShowingHighPrecision(self:IsShowingHighPrecision())
end

assert(Cartographer, "Cartographer not found!")

if Cartographer3 and Cartographer3.hijackingWorldMap then
	return
end

local Tablet = AceLibrary("Tablet-2.0")
local L = AceLibrary("AceLocale-2.2"):new("Cartographer_MiniMapCoords")
local AceOO = AceLibrary("AceOO-2.0")

L:RegisterTranslations("enUS", function() return {
	["MiniMap Coords"] = true,
	["Show Background"] = true,
	["Show Border"] = true,
	["Reset Position"] = true,
	["Background color"] = true,
	["The color of the background frame behind coordinates"] = true,
	["Text color"] = true,
	["The color of the coordinates"] = true,
	["High precision"] = true,
	["Show high precision coordinates"] = true,
} end)

L:RegisterTranslations("esES", function() return {
	["MiniMap Coords"] = "Coordenadas MiniMapa",
	["Show Background"] = "Mostrar Fondo",
	["Show Border"] = "Mostrar Borde",
	["Reset Position"] = "Reiniciar Posición",
	["Background color"] = "Color de Fondo",
	["The color of the background frame behind coordinates"] = "El color del marco de fondo trás las coordenadas",
	["Text color"] = "Color Texto",
	["The color of the coordinates"] = "El color de las coordenadas",
	["High precision"] = "Precisión Alta",
	["Show high precision coordinates"] = "Muestra coordenadas con alta precisión",
} end)

--Cartographer_MiniMapCoords = Cartographer:NewModule("MiniMapCoords", "AceConsole-2.0", "AceEvent-2.0", "AceDB-2.0")
Cartographer_MiniMapCoords = Cartographer:NewModule("MiniMapCoords")

--Cartographer_MiniMapCoords:RegisterDB("Cartographer_MiniMapCoordsDB")

local Cartographer_MiniMapCoordsFrame

function Cartographer_MiniMapCoords:OnInitialize()
	self.name = L["MiniMap Coords"]
	self.title = L["MiniMap Coords"]
	self.db = Cartographer:GetDatabaseNamespace("Cartographer_MiniMapCoordsDB")

	--self:RegisterDefaults("profile", {
	Cartographer:SetDatabaseNamespaceDefaults("Cartographer_MiniMapCoordsDB", "profile", {
		showBackground = true,
		showBorder = true,
		point = "BOTTOM",
		relto = "Minimap",
		relpoint = "BOTTOM",
		offsetX = 0,
		offsetY = -15,
		bgR = 0,
		bgG = 0,
		bgB = 0,
		bgA = 1,
		txtR = 1,
		txtG = 0.82,
		txtB = 0,
		txtA = 1,
		txtSize = 1,
		highPrecision = true,
})
	-- menu options
	local aceopts = {}
	aceopts.toggle = {
		name = Cartographer.L["Enabled"],
		desc = Cartographer.L["Suspend/resume this module."],
		type  = 'toggle',
		order = -1,
		get   = function() return Cartographer:IsModuleActive(self) end,
		set   = function() Cartographer:ToggleModuleActive(self) end,
	}
	Cartographer.options.args.MiniMapCoords = {
		name = L["MiniMap Coords"],
		desc = self.notes,
		type = 'group',
		args = {
			toggle = {
				name = Cartographer.L["Enabled"],
				desc = Cartographer.L["Suspend/resume this module."],
				type  = 'toggle',
				order = 0,
				get   = function() return Cartographer:IsModuleActive(self) end,
				set   = function() Cartographer:ToggleModuleActive(self) end,
			},
			bBackground = {
				name = L["Show Background"],
				desc = "",
				type = "toggle",
				order = 5,
				get = "GetBackground",
				set = "SetBackground",
			},
			bgColor = {
				name = L["Background color"],
				desc = L["The color of the background frame behind coordinates"],
				type = "color",
				order = 10,
				get = "GetBackgroundColor",
				set = "SetBackgroundColor",
				hasAlpha = true,
				disabled = "~GetBackground"
			},
			color = {
				name = L["Text color"],
				desc = L["The color of the coordinates"],
				type = "color",
				order = 15,
				get = "GetTextColor",
				set = "SetTextColor",
				hasAlpha = true,
			},
			bBorder = {
				name = L["Show Border"],
				desc = "",
				type = "toggle",
				order = 20,
				get = "GetBorder",
				set = "SetBorder",
			},
			highPrecision = {
				name = L["High precision"],
				desc = L["Show high precision coordinates"],
				type = "toggle",
				get = "GetHighPrecision",
				set = "SetHighPrecision",
			},
			cReset = {
				name = L["Reset Position"],
				desc = "",
				type = "execute",
				order = 999,
				func = "ResetPosition",
			},
		},
		handler = self,
	}
end

function Cartographer_MiniMapCoords:OnEnable()
	if self.frame then
		self.frame:Show()
	else
		self.frame = CreateFrame("Frame", "Cartographer_MiniMapCoordsFrame", UIParent)
		Cartographer_MiniMapCoordsFrame = self.frame

		self.frame:EnableMouse(true)
		self.frame:SetMovable(true)
		--[[if(self.db.profile.offsetX ~= 0 and self.db.profile.offsetY ~= 0) then
			self.frame:SetPoint("TOPRIGHT", nil, "TOPRIGHT", self.db.profile.offsetX, self.db.profile.offsetY)
		else
			self.frame:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, -15)
		end]]
		local relto = self.db.profile.relto
		if relto == "" then relto = nil end
		self.frame:SetPoint(self.db.profile.point, relto, self.db.profile.relpoint, self.db.profile.offsetX, self.db.profile.offsetY)
		--self:Print("point = "..self.db.profile.point.." relto = "..(relto or "(nil)").." relpoint = "..self.db.profile.relpoint.." offX = "..self.db.profile.offsetX.." offY = "..self.db.profile.offsetY)
		self.frame:SetWidth(62)
		self.frame:SetHeight(22)
		self.frame:SetBackdrop({
			bgFile = "Interface/TutorialFrame/TutorialFrameBackground",
			edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
			tile = true,
			tileSize = 16,
			edgeSize = 16,
			insets = { left=5, right = 5, top = 5, bottom = 5 }
		})
		self.frame:SetBackdropColor(self.db.profile.bgR, self.db.profile.bgG, self.db.profile.bgB, self.db.profile.bgA)

		self.frame.loc = self.frame:CreateFontString(nil, "OVERLAY")
		self.frame.loc:SetWidth(62)
		self.frame.loc:SetHeight(22)
		self.frame.loc:SetPoint("TOPLEFT",self.frame, "TOPLEFT")
		self.frame.loc:SetJustifyH("CENTER")
		self.frame.loc:SetJustifyV("CENTER")
		self.frame.loc:SetFontObject(GameFontNormalSmall)
		self.frame.loc:SetTextColor(self.db.profile.txtR, self.db.profile.txtG, self.db.profile.txtB, self.db.profile.txtA)

		self.frame:SetScript("OnUpdate", Cartographer_MiniMapCoords_OnUpdate)
		self.frame:SetScript("OnDragStart",
			function()
				self.frame:StartMoving()
			end
		)
		self.frame:SetScript("OnDragStop",
			function()
				self.frame:StopMovingOrSizing()
				self:SavePosition()
			end
		)
		self.frame:RegisterForDrag("RightButton")
	end
	self:SetBackground(self:GetBackground())
	self:SetBorder(self:GetBorder())
end

local formatHighStr, formatLowStr
do
	if ("%.1f"):format(1.1) == "1,1" then
		formatHighStr = "%.1f x %.1f"
		formatLowStr = "%.0f x %.0f"
	else
		formatHighStr = "%.1f, %.1f"
		formatLowStr = "%.0f, %.0f"
	end
end

function Cartographer_MiniMapCoords_OnUpdate()
	local x,y=GetPlayerMapPosition("player")
	local formatStr = Cartographer_MiniMapCoords.db.profile.highPrecision and formatHighStr or formatLowStr

	if x == 0 or y == 0 or ((IsInInstance() or Cartographer:GetCurrentInstance()) and select(2, IsInInstance()) ~= "pvp") then
		Cartographer_MiniMapCoordsFrame.loc:SetText("---")
	else
		--Cartographer_MiniMapCoordsFrame.loc:SetText(string.format("%0.1f,%0.1f", (x*100), (y*100)))
		Cartographer_MiniMapCoordsFrame.loc:SetText(string.format(formatStr, (x*100), (y*100)))
	end
end

function Cartographer_MiniMapCoords:GetBackground()
	return self.db.profile.showBackground
end

function Cartographer_MiniMapCoords:SetBackground(value)
	if value == nil then
		value = not self.db.profile.showBackground
	end
	self.db.profile.showBackground = value
	if self.db.profile.showBackground then
		self.frame:SetBackdropColor(1,1,1,1)
	else
		self.frame:SetBackdropColor(0,0,0,0)
	end
end


function Cartographer_MiniMapCoords:GetBorder()
	return self.db.profile.showBorder
end

function Cartographer_MiniMapCoords:SetBorder(value)
	if value == nil then
		value = not self.db.profile.showBorder
	end
	self.db.profile.showBorder = value
	if self.db.profile.showBorder then
		self.frame:SetBackdropBorderColor(1,1,1,1)
	else
		self.frame:SetBackdropBorderColor(0,0,0,0)
	end
end

function Cartographer_MiniMapCoords:OnDisable()
	self:UnregisterAllEvents()
	self.frame:Hide()
end

function Cartographer_MiniMapCoords:SavePosition()
	--self:Print("self.frame:GetNumPoints() = "..self.frame:GetNumPoints())
	local point, relto, relpoint, xoff, yoff = self.frame:GetPoint(1)
	--self:Print("point = "..(point or "(nil)").." relto = "..(relto or "(nil)").." relpoint = "..(relpoint or "(nil)").." xoff = "..xoff.." yoff = "..yoff)
	self.db.profile.point = point
	self.db.profile.relto = relto or ""
	self.db.profile.relpoint = relpoint
	self.db.profile.offsetX = xoff
	self.db.profile.offsetY = yoff
end

function Cartographer_MiniMapCoords:ResetPosition()
	self.db.profile.point = "BOTTOM"
	self.db.profile.relto = "Minimap"
	self.db.profile.relpoint = "BOTTOM"
	self.db.profile.offsetX = 0
	self.db.profile.offsetY = -15
	self.frame:SetPoint(self.db.profile.point, self.db.profile.relto, self.db.profile.relpoint, self.db.profile.offsetX, self.db.profile.offsetY)
end

function Cartographer_MiniMapCoords:GetBackgroundColor()
	return self.db.profile.bgR, self.db.profile.bgG, self.db.profile.bgB, self.db.profile.bgA
end

function Cartographer_MiniMapCoords:SetBackgroundColor(r, g, b, a)
	self.db.profile.bgR, self.db.profile.bgG, self.db.profile.bgB, self.db.profile.bgA = r, g, b, a
	self.frame:SetBackdropColor(r, g, b, a)
end

function Cartographer_MiniMapCoords:GetTextColor()
	return self.db.profile.txtR, self.db.profile.txtG, self.db.profile.txtB, self.db.profile.txtA
end

function Cartographer_MiniMapCoords:SetTextColor(r, g, b, a)
	self.db.profile.txtR, self.db.profile.txtG, self.db.profile.txtB, self.db.profile.txtA = r, g, b, a
	self.frame.loc:SetTextColor(r, g, b, a)
end

function Cartographer_MiniMapCoords:GetHighPrecision()
	return self.db.profile.highPrecision
end

function Cartographer_MiniMapCoords:SetHighPrecision(value)
	if value == nil then
		value = not self.db.profile.highPrecision
	end
	self.db.profile.highPrecision = value
end

assert(Cartographer, "Cartographer not found!")
local Cartographer = Cartographer
local revision = tonumber(("$Revision: 2250 $"):sub(12, -3))
local pt = Rock("LibPeriodicTable-3.1")
if revision > Cartographer.revision then
	Cartographer.version = "r" .. revision
	Cartographer.revision = revision
	Cartographer.date = ("$Date: 2008-10-07 23:10:53 +0000 (Tue, 07 Oct 2008) $"):sub(8, 17)
end

local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer-InstanceLoot")
L:AddTranslations("enUS", function() return {
	["Instance Loot"] = true,
	
	["Normal Mode Drops"] = true,
	["Heroic Mode Drops"] = true,
	
	["Display of loot on instance bosses."] = true,
	["Left side"] = true,
	["Right side"] = true,
	["Close"] = true,
	["Toggle side to display loot info"] = true,
	["Quality"] = true,
	["Set the quality threshold for items to be displayed"] = true,
	["Always show bind on pickup items"] = true,
	["Show bind on pickup items regardless of the quality threshold"] = true,
	["Hide Low Droprate Items"] = true,
	["Hide all items under this droprate"] = true,
	["Query_Warning"] = "Item not found, click to query server. |cFFFF2222WARNING: This WILL disconnect you if the server has not seen the item.",
	["[Cartographer_InstanceLoot] PT3 has no table InstanceLoot.%s.%s"] = true,
} end)

L:AddTranslations("deDE", function() return {
	["Instance Loot"] = "Instanzloot",
	
	["Normal Mode Drops"] = "Drops im normalen Modus",
	["Heroic Mode Drops"] = "Drops im heroischen Modus",
	
	["Display of loot on instance bosses."] = "Zeigt den Loot der Instanzbosse an.",
	["Left side"] = "Links",
	["Right side"] = "Rechts",
	["Close"] = "Schlie\195\159en",
	["Toggle side to display loot info"] = "W\195\164hle Seite zur Anzeige der Lootinformationen.",
	["Quality"] = "Qualit\195\164t",
	["Set the quality threshold for items to be displayed"] = "Mindestqualit\195\164t der anzuzeigenden Gegenst\195\164nde einstellen",
	["Always show bind on pickup items"] = "'BoP'-Gegenst\195\164nde immer anzeigen",
	["Show bind on pickup items regardless of the quality threshold"] = "'BoP'-Gegenst\195\164nde ungeachtet der eingestellten Mindestqualit\195\164t anzeigen",
	["Hide Low Droprate Items"] = "Gegenstände mit niedriger Dropchance ausblenden",
	["Hide all items under this droprate"] = "Alle Gegenstände unterhalb dieser Begrenzung ausblenden",
	["Query_Warning"] = "Gegenstand nicht gefunden, klicken um den Gegenstand beim Server abzufragen. |cFFFF2222WARNUNG: Das WIRD Eure Serververbindung trennen, wenn der Server den Gegenstand noch nicht kennt.",
} end)

L:AddTranslations("frFR", function() return {
	["Instance Loot"] = "Butin d'instance",

	["Normal Mode Drops"] = "Butin en mode normal",
	["Heroic Mode Drops"] = "Butin en mode héroïque",

	["Display of loot on instance bosses."] = "Affiche le butin des boss d'instance.",
	["Left side"] = "Côté gauche",
	["Right side"] = "Côté droit",
	["Close"] = "Fermer",
	["Toggle side to display loot info"] = "Détermine le côté où afficher les informations sur le butin.",
	["Quality"] = "Qualité",
	["Set the quality threshold for items to be displayed"] = "Détermine le seuil de qualité des objets à afficher.",
	["Always show bind on pickup items"] = "Toujours afficher les objets LqR",
	["Show bind on pickup items regardless of the quality threshold"] = "Affiche les objets liés quand ramassés, quelque soit le seuil de qualité.",
	["Hide Low Droprate Items"] = "Cacher les objets qui tombent rarement",
	["Hide all items under this droprate"] = "Cache tous les objets qui ont un taux de présence dans le butin inférieur à ce seuil.",
	["Query_Warning"] = "Objet introuvable, cliquez pour lancer une requête au serveur. |cFFFF2222ATTENTION : ceci vous déconnectera si le serveur n'a encore jamais vu cet objet.",
} end)

L:AddTranslations("koKR", function() return {
	["Instance Loot"] = "인스턴스 전리품",
	
	["Normal Mode Drops"] = "보통 난이도 드롭",
	["Heroic Mode Drops"] = "영웅 난이도 드롭",
	
	["Display of loot on instance bosses."] = "인스턴스 던전 내의 전리품을 표시합니다.",
	["Left side"] = "좌측",
	["Right side"] = "우측",
	["Close"] = "닫기",
	["Toggle side to display loot info"] = "전리품 정보를 표시하려는 세계 지도의 측면을 선택합니다.",
	["Quality"] = "등급",
	["Set the quality threshold for items to be displayed"] = "표시할 아이템의 등급 제한을 설정합니다.",
	["Always show bind on pickup items"] = "획득 시 귀속 아이템 항상 표시",
	["Show bind on pickup items regardless of the quality threshold"] = "등급 제한에 상관 없이 획득 시 귀속 아이템을 표시합니다.",
	["Hide Low Droprate Items"] = "드롭율이 낮은 아이템 숨김",
	["Hide all items under this droprate"] = "이 드롭율 이하의 모든 아이템을 표시하지 않습니다.",
	["Query_Warning"] = "아이템을 찾을 수 없습니다, 서버에 요청하려면 클릭하세요. |cFFFF2222경고: 서버에 해당 아이템이 없거나 보지 않은 경우에는 접속이 끊어질 수 있습니다.",
} end)

L:AddTranslations("esES", function() return {
	["Instance Loot"] = "Bot\195\173n de Instancia",
	
	--["Normal Mode Drops"] = true,
	--["Heroic Mode Drops"] = true,
	
	["Display of loot on instance bosses."] = "Muestra el bot\195\173n de los jefes de instancia",
	["Left side"] = "Lado izquierdo",
	["Right side"] = "Lado derecho",
	["Close"] = "Cerrar",
	["Toggle side to display loot info"] = "Determina en qu\195\169 lado se muestra la informaci\195\179n del bot\195\173n",
	["Quality"] = "Calidad",
	["Set the quality threshold for items to be displayed"] = "Establece el nivel de calidad m\195\173nimo para que se muestren los objetos",
	["Always show bind on pickup items"] = "Siempre mostrar los objetos que se ligan al recogerlos",
	["Show bind on pickup items regardless of the quality threshold"] = "Muestra los objetos que se ligan al recogerlos sin importar el nivel m\195\173nimo de calidad",
	["Hide Low Droprate Items"] = "Ocultar objetos con nivel de aparici\195\179n bajo",
	["Hide all items under this droprate"] = "Ocultar todos los objetos por debajo de este nivel de aparici\195\179n",
	["Query_Warning"] = "Objeto no encontrado, clic para preguntar al servidor. |cFFFF2222AVISO: Esto te DESCONECTAR\195\129 si el servidor no ha visto el objeto.",
} end)

L:AddTranslations("zhTW", function() return {
	["Instance Loot"] = "副本掉落物品",
	
	["Normal Mode Drops"] = "一般模式掉落",
	["Heroic Mode Drops"] = "英雄模式掉落",
	
	["Display of loot on instance bosses."] = "顯示副本首領的掉落物品。",
	["Left side"] = "左側",
	["Right side"] = "右側",
	["Close"] = "關閉",
	["Toggle side to display loot info"] = "切換顯示掉落物品資訊的位置",
	["Quality"] = "品質",
	["Set the quality threshold for items to be displayed"] = "當品質高於設定的臨界值，才顯示掉落物品",
	["Always show bind on pickup items"] = "永遠顯示拾取綁定物品",
	["Show bind on pickup items regardless of the quality threshold"] = "永遠顯示拾取綁定物品，不管其品質為何",
	["Hide Low Droprate Items"] = "隱藏掉落率低的物品",
	["Hide all items under this droprate"] = "隱藏低於這個掉落機率的所有物品",
-- no use anymore	["Query_Warning"] = true,
	["[Cartographer_InstanceLoot] PT3 has no table InstanceLoot.%s.%s"] = "[Cartographer_InstanceLoot] PT3 沒有相關資料 (鍵值=InstanceLoot.%s.%s)",
} end)

L:AddTranslations("zhCN", function() return {
	["Instance Loot"] = "副本掉落",

	["Normal Mode Drops"] = "普通模式掉落",
	["Heroic Mode Drops"] = "英雄模式掉落",

	["Display of loot on instance bosses."] = "显示副本首领的掉落物品。",
	["Left side"] = "显示在左侧",
	["Right side"] = "显示在右侧",
	["Close"] = "关闭",
	["Toggle side to display loot info"] = "切换显示掉落物品信息的位置",
	["Quality"] = "品质",
	["Set the quality threshold for items to be displayed"] = "只显示品质高于设定值的掉落物品。",
	["Always show bind on pickup items"] = "永远显示拾取后绑定的物品。",
	["Show bind on pickup items regardless of the quality threshold"] = "永远显示任何品质的拾取后绑定物品。",
	["Hide Low Droprate Items"] = "隐藏掉落率低的物品。",
	["Hide all items under this droprate"] = "隐藏低于这个掉落率的物品。",
	["Query_Warning"] = "在本地缓存找不到此物品，将向服务器查询，|cFFFF2222注意：该操作可能导致你与服务器断开连接！",
	["[Cartographer_InstanceLoot] PT3 has no table InstanceLoot.%s.%s"] = "[Cartographer-副本掉落] PT3 没有相关资料。（InstanceLoot.%s.%s）",
} end)

-- Russian Translation by StingerSoft (Eritnull aka Шептун)
L:AddTranslations("ruRU", function() return {
	["Instance Loot"] = "Трофеи Подземелий",
	
	["Normal Mode Drops"] = "Выпад в обычном режиме",
	["Heroic Mode Drops"] = "Выпад в героическом режиме",
	
	["Display of loot on instance bosses."] = "Отображаtn трофеи боссов в подземельях.",
	["Left side"] = "Слева",
	["Right side"] = "Справа",
	["Close"] ="Закрыть",
	["Toggle side to display loot info"] = "Переключение стороны инфы о трофее",
	["Quality"] = "Качество",
	["Set the quality threshold for items to be displayed"] = "Качество предметов которые будут отображаться",
	["Always show bind on pickup items"] = "Всегда показывать именные предметы",
	["Show bind on pickup items regardless of the quality threshold"] = "Показывать именные предметы независимо от установленного качества",
	["Hide Low Droprate Items"] = "Скрыть предметы с малым шансом выпада",
	["Hide all items under this droprate"] = "Скрыть все предметы ниже этого шанса выпада",
	["Query_Warning"] = "Предмет не найден, кликните для запроса с сервера. |cFFFF2222ОСТОРОЖНО: Это может вызвать разъединение с сервером если на сервере этот предмет еще не выпадал.",
	["[Cartographer_InstanceLoot] PT3 has no table InstanceLoot.%s.%s"] = "[Cartographer_InstanceLoot] PT3 нету таблицы Трофеев Подземелья.%s.%s",
} end)

Cartographer_InstanceLoot = Cartographer:NewModule("InstanceLoot", "LibRockEvent-1.0", "LibRockTimer-1.0")
local Cartographer_InstanceLoot = Cartographer_InstanceLoot
local boss
local qualitycolors = {
	[0] = "|cff9d9d9d",
	[1] = "|cffffffff",
	[2] = "|cff1eff00",
	[3] = "|cff0070dd",
	[4] = "|cffa335ee",
	[5] = "|cffff8000"
}
local qualitynames = {ITEM_QUALITY0_DESC,ITEM_QUALITY1_DESC,ITEM_QUALITY2_DESC,ITEM_QUALITY3_DESC,ITEM_QUALITY4_DESC,ITEM_QUALITY5_DESC,ITEM_QUALITY6_DESC,}
local qualitynumbers = {[ITEM_QUALITY0_DESC]=0,[ITEM_QUALITY1_DESC]=1,[ITEM_QUALITY2_DESC]=2,[ITEM_QUALITY3_DESC]=3,[ITEM_QUALITY4_DESC]=4,[ITEM_QUALITY5_DESC]=5,[ITEM_QUALITY6_DESC]=6,}
local BB = Rock("LibBabble-Boss-3.0")
local BBR = BB:GetReverseLookupTable()
local Tablet = AceLibrary("Tablet-2.0")

function Cartographer_InstanceLoot:OnInitialize()
	self.db = Cartographer:GetDatabaseNamespace("InstanceLoot")
	Cartographer:SetDatabaseNamespaceDefaults("InstanceLoot", "profile", {
		side = "LEFT",
		quality = 2,
		bop = true,
		droprate = 0.03,
	})
	self.name = L["Instance Loot"]
	self.title = L["Instance Loot"]
	Cartographer.options.args.InstanceLoot = {
		name = L["Instance Loot"],
		desc = L["Display of loot on instance bosses."],
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
			side = {
				name = L["Left side"],
				desc = L["Toggle side to display loot info"],
				type = "toggle",
				get = function() return self.db.profile.side == "LEFT" end,
				set = function(v)
					local side = v and "LEFT" or "RIGHT"
					local opposite = v and "RIGHT" or "LEFT"
					self.db.profile.side = side
					Cartographer:ReleaseSideTablet(opposite, self)
					if not boss then
						return
					end
					Cartographer:AcquireSideTablet(side, self)
				end,
				guiNameIsMap = true,
				map = {
					[true] = L["Left side"],
					[false] = L["Right side"],
				}
			},
			quality = {
				name = L["Quality"],
				desc = L["Set the quality threshold for items to be displayed"],
				type = "text",
				validate = qualitynames,
				get = function() return qualitynames[self.db.profile.quality+1] end,
				set = function(t)
					self.db.profile.quality = qualitynumbers[t]
					Cartographer:RefreshSideTablet(self.db.profile.side,Cartographer_InstanceLoot)
				end,
			},
			bop = {
				name = L["Always show bind on pickup items"],
				desc = L["Show bind on pickup items regardless of the quality threshold"],
				type = "toggle",
				get = function() return self.db.profile.bop end,
				set = function(t)
					self.db.profile.bop = t
					Cartographer:RefreshSideTablet(self.db.profile.side,Cartographer_InstanceLoot)
				end,
			},
			droprate = {
				name = L["Hide Low Droprate Items"],
				desc = L["Hide all items under this droprate"],
				type = "range",
				get = function() return self.db.profile.droprate end,
				set = function(t)
					self.db.profile.droprate = t
					Cartographer:RefreshSideTablet(self.db.profile.side,Cartographer_InstanceLoot)
				end,
				min = 0,
				max = 0.25,
				step = 0.001,
				bigStep = 0.005,
				isPercent = true,
			},
		},
		handler = self,
	}
	
	CreateFrame("GameTooltip","Cartographer_InstanceLootTooltip",UIParent,"GameTooltipTemplate")
	Cartographer_InstanceLootTooltip:SetWidth(1)
	Cartographer_InstanceLootTooltip:SetHeight(1)
end

function Cartographer_InstanceLoot:OnEnable()
	self:AddEventListener("Cartographer", "MapClosed", "Cartographer_MapClosed")
end

function Cartographer_InstanceLoot:OnDisable()
	Cartographer:ReleaseSideTablet("LEFT", self)
	Cartographer:ReleaseSideTablet("RIGHT", self)
end

function Cartographer_InstanceLoot:Cartographer_MapClosed()
	Cartographer:ReleaseSideTablet("LEFT", self)
	Cartographer:ReleaseSideTablet("RIGHT", self)
end

function Cartographer_InstanceLoot:OnClick(zone,id,data)
	if data.title and BBR[data.title] then
		local old_boss = boss
		boss = BBR[data.title]
		
		if boss == old_boss then
			self:CloseSideTablet()
		else
			local overrideside
			local x = GetCursorPosition()
			local left = WorldMapDetailFrame:GetLeft()
			local width = WorldMapDetailFrame:GetWidth()
			local scale = WorldMapDetailFrame:GetEffectiveScale()
			local cx = (x/scale - left) / width
			if cx < 0.33 then
				overrideside = "RIGHT"
			elseif cx > 0.66 then
				overrideside = "LEFT"
			end
			Cartographer:ReleaseSideTablet("LEFT", self)
			Cartographer:ReleaseSideTablet("RIGHT", self)
			Cartographer:AcquireSideTablet(overrideside or self.db.profile.side, self) -- also refreshes
		end
	end
end

function Cartographer_InstanceLoot:CloseSideTablet()
	Cartographer:ReleaseSideTablet("LEFT", self)
	Cartographer:ReleaseSideTablet("RIGHT", self)
	boss = nil
end

local function GetBindOn(item)
	Cartographer_InstanceLootTooltip:SetOwner(UIParent, "ANCHOR_NONE")
	Cartographer_InstanceLootTooltip:SetHyperlink(item)
	if Cartographer_InstanceLootTooltip:NumLines() > 1  and Cartographer_InstanceLootTooltipTextLeft2:GetText() then
		local t = Cartographer_InstanceLootTooltipTextLeft2:GetText()
		Cartographer_InstanceLootTooltip:Hide()
		if t == ITEM_BIND_ON_PICKUP then
			return "pickup"
		elseif t == ITEM_BIND_ON_EQUIP then
			return "equip"
		elseif t == ITEM_BIND_ON_USE then
			return "use"
		end
	end
	Cartographer_InstanceLootTooltip:Hide()
	return
end
local drops = {}
function Cartographer_InstanceLoot:OnTabletRequest()
	if not boss then
		return
	end
	-- a hack for the difference between Cartographer:GetCurrentEnglishZoneName() (only return "Blackrock Spire", can't distinguish between "Upper Blackrock Spire" and "Lower Blackrock Spire") and PeriodicTable
	local currentEnglishZone = Cartographer:GetCurrentEnglishZoneName()
	if (currentEnglishZone == "Blackrock Spire") then
		if pt("InstanceLoot.Upper " .. currentEnglishZone .. "." .. boss) then
			currentEnglishZone = "Upper Blackrock Spire"
		elseif pt("InstanceLoot.Lower " .. currentEnglishZone .. "." .. boss) then
			currentEnglishZone = "Lower Blackrock Spire"
		end
	end
	-- hack end
	if not pt("InstanceLoot." .. currentEnglishZone .. "." .. boss) and not pt("InstanceLootHeroic." .. currentEnglishZone .. "." .. boss) then
		DEFAULT_CHAT_FRAME:AddMessage(L["[Cartographer_InstanceLoot] PT3 has no table InstanceLoot.%s.%s"]:format(currentEnglishZone, boss))
		return
	end
	if pt("InstanceLoot." .. currentEnglishZone .. "." .. boss) then
		for k,v in pairs(drops) do
			drops[k] = nil
		end
		for k,v in pt:IterateSet("InstanceLoot." .. currentEnglishZone .. "." .. boss) do
			drops[k] = v
		end
		Tablet:SetTitle(BB[boss])
		local cat = Tablet:AddCategory()
		cat:AddLine('text', L["Normal Mode Drops"])
		local cat = Tablet:AddCategory('columns', 2)
		local sorted
		--this is kinda an ugly sort.
		for k,v in pairs(drops) do
			if not sorted then
				sorted = {k}
			else
				local stop
				for a,b in ipairs(sorted) do
					if not stop and tonumber(v) > tonumber(drops[b]) then
						table.insert(sorted,a,k)
						stop = true
					end
				end
				if not stop then
					table.insert(sorted,k)
				end
			end
		end
		if sorted then
			for k,v in ipairs(sorted) do
				local name, link, rarity, _,_,_,_,_,_, texture = GetItemInfo(v)
				if not link and (self.db.profile.bop or drops[v] / 1000 >= self.db.profile.droprate) then
					cat:AddLine(
						'text', "|cFFFF2222["..v.."]",
						'text2', ("%.1f%%"):format(drops[v]/10),
						'func', Cartographer_InstanceLoot.DropClick,
						'arg1', self, 'arg2', v
					)
				elseif link and ((rarity >= self.db.profile.quality and drops[v] / 1000 >= self.db.profile.droprate)
				or (self.db.profile.bop and GetBindOn(link)=='pickup')) then
					cat:AddLine(
						'text', qualitycolors[rarity].."["..name.."]",
						'text2', ("%.1f%%"):format(drops[v]/10),
						'func', Cartographer_InstanceLoot.DropClick,
						'arg1', self, 'arg2', v,
						'hasCheck', true,
						'checked', true,
						'checkIcon', texture,
						'onEnterFunc', self.SetTooltip,
						'onEnterArg1', self,
						'onEnterArg2', link,
						'onLeaveFunc', GameTooltip.Hide,
						'onLeaveArg1', GameTooltip
					)
				end
			end
		end
	end
	if pt("InstanceLootHeroic." .. currentEnglishZone .. "." .. boss) then
		for k,v in pairs(drops) do
			drops[k] = nil
		end
		for k,v in pt:IterateSet("InstanceLootHeroic." .. currentEnglishZone .. "." .. boss) do
			drops[k] = v
		end
		local cat = Tablet:AddCategory()
		cat:AddLine('text', L["Heroic Mode Drops"])
		local cat = Tablet:AddCategory('columns', 2)
		local sorted
		--this is kinda an ugly sort.
		for k,v in pairs(drops) do
			if not sorted then
				sorted = {k}
			else
				local stop
				for a,b in ipairs(sorted) do
					if not stop and tonumber(v) > tonumber(drops[b]) then
						table.insert(sorted,a,k)
						stop = true
					end
				end
				if not stop then
					table.insert(sorted,k)
				end
			end
		end
		for k,v in ipairs(sorted) do
			if not pt:ItemInSet(v,"InstanceLoot." .. currentEnglishZone .. "." .. boss) then
				local name, link, rarity, _,_,_,_,_,_, texture = GetItemInfo(v)
				if not link and (self.db.profile.bop or drops[v] / 1000 >= self.db.profile.droprate) then
					cat:AddLine(
						'text', "|cFFFF2222["..v.."]",
						'text2', ("%.1f%%"):format(drops[v]/10),
						'func', Cartographer_InstanceLoot.DropClick,
						'arg1', self, 'arg2', v
					)
				elseif link and ((rarity >= self.db.profile.quality and drops[v] / 1000 >= self.db.profile.droprate)
				or (self.db.profile.bop and GetBindOn(link)=='pickup')) then
					cat:AddLine(
						'text', qualitycolors[rarity].."["..name.."]",
						'text2', ("%.1f%%"):format(drops[v]/10),
						'func', Cartographer_InstanceLoot.DropClick,
						'arg1', self, 'arg2', v,
						'hasCheck', true,
						'checked', true,
						'checkIcon', texture,
						'onEnterFunc', self.SetTooltip,
						'onEnterArg1', self,
						'onEnterArg2', link,
						'onLeaveFunc', GameTooltip.Hide,
						'onLeaveArg1', GameTooltip
					)
				end
			end
		end
	end
	
	-- Usefull options but a bit hacky
	cat = Tablet:AddCategory('textR', 0, 'textG', 0.85, 'textB', 0)
	local opts = Cartographer.options.args.InstanceLoot.args.side
	cat:AddLine(
		'text', opts.map[not opts.get()],
		'func', function() return opts.set(not opts.get()) end
	)
	cat:AddLine(
		'text', L["Close"],
		'func', function() return self:CloseSideTablet() end 
	)
end
Cartographer_InstanceLoot.OnCartographerLeftTabletRequest = Cartographer_InstanceLoot.OnTabletRequest
Cartographer_InstanceLoot.OnCartographerRightTabletRequest = Cartographer_InstanceLoot.OnTabletRequest

function Cartographer_InstanceLoot:SetTooltip(link)
	GameTooltip_SetDefaultAnchor(GameTooltip, this)
	GameTooltip:SetHyperlink(link)
end

function Cartographer_InstanceLoot:DropClick(id)
	local name, link, rarity, _,_,_,_,_,_, texture = GetItemInfo(id)
	if not name then
		Cartographer_InstanceLootTooltip:SetOwner(this, "ANCHOR_PRESERVE")
		Cartographer_InstanceLootTooltip:SetHyperlink("item:" .. id)
		Cartographer_InstanceLootTooltip:Hide()
		Cartographer_InstanceLoot:AddTimer(1, function() Cartographer:RefreshSideTablet(self.db.profile.side, Cartographer_InstanceLoot) end)
		return
	end
	if IsControlKeyDown() then
		DressUpItemLink(link)
	elseif IsShiftKeyDown() then
		if not ChatFrameEditBox:IsVisible() then
			ChatFrameEditBox:Show()
		end
		ChatFrameEditBox:Insert(link)
	else
		ShowUIPanel(ItemRefTooltip)
		if not ItemRefTooltip:IsVisible() then
			ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE")
		end
		ItemRefTooltip:SetHyperlink(link)
	end
end

local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer_Waypoints_CorpsePoint")

CorpsePoint = Waypoint:new()

CorpsePoint.Continent = -1
CorpsePoint.Zoneref = -1
CorpsePoint.Corpse = true
CorpsePoint.Icon = "Skull"
CorpsePoint.IconTitle = "Corpse"
CorpsePoint.PointType = "Corpse"
CorpsePoint.ShowOnMap = true

L:AddTranslations("enUS", function() return {
	["Corpse"] = true,
	["CorpseNames"] = {"Corpse", -- Insert cultural humour for death here. This is all fairly english based stuff, so change for translations
		"Location of demise",
		"Compost Heap",
		"Ex-Parrot Location",
		"Worm Food Factory",
		"Note to self: Don't hug the bear",
		"This many steps away from the light...",
		"This is nature's way of telling you to slow down",
		"Well you're a silly sausage, aren't you?",
		"Well that was a mistake",
		"No no, Guard, turn, parry, dodge, spin and -then- thrust",
		"Despite all signs to the negative, it was obviously duck season",
		"You've had worse",
		"Well... you'll always have Paris",
		"Blame the Hunter",
		"Blame the Priest",
		"Blame Canada",
		"DARK IN HERE, ISN'T IT?",
		"Well you can't say you weren't asking for it...",
		"Bring a shovel",
		"A gnome would've dodged that.",
		"Stop crying, it doesn't help.",
		"Blame WoW",
		"If only they hadn't nerfed you last patch...",
		"Remember to put on a fresh pair of socks.",
		"Want me to freshen your drink while you're slacking?",
		"HLEP LOL",
		"Less slacking, more healing.",
		"Geez, get more hitpoints.",
		"WTS: [Flask of Titans]",
		"Was that a tauren or an elk?",
		"Hope you learned your lesson *this* time.",
		"D'oh!",
		"Blame the healer",
		"Don't blame Norway, it's such a nice place",
		"It's Rabbit season!",
		"A rogue would've used vanish.",
		"ZOMG GNAKED!",
		"Can't blame your keyboard this time.",
		"Just .. one .. more .. bah.",
		"Nothing a cup of coffee won't fix.",
		"Don't drink and die.",
		"This way to icecream.",
		"Beer. This. Way.",
		"Always Look on the Bright Side of Life",
		"Impeccable footwork",
	},
} end)

L:AddTranslations("esES", function() return {
	["Corpse"] = "Cadáver",
	["CorpseNames"] = {"Cadáver", -- Insert cultural humour for death here. This is all fairly english based stuff, so change for translations
		"Lugar de fallecimiento",
		"Montón de estiércol",
		"Localización del Ex-Loro",
		"Fábrica de comida para gusanos",
		"Nota mental: No abrazar al oso",
		"Muchos pasos lejos de la luz...",
		"Esta es la forma que tiene la Naturaleza de decirte que te lo tomes con calma",
		"Bueno eres un tonto salchicha, ¿no?",
		"Vaya, eso fué un error",
		"No no, Guardia, doblar, desviar, esquivar, girar y luego empujar",
		"Pese a que todas las señales lo negasen, era obviamente temporada de patos",
		"Has tenido días peores",
		"Bueno... siempre te quedará Paris",
		"Culpa al Cazador",
		"Culpa al Sacerdote",
		"Culpa a Canadá",
		"ESTÁ OSCURO AQUÍ, ¿EH?",
		"Bueno, no puedes decir que no te lo estabas buscando...",
		"Trae una pala",
		"Un gnomo hubiese esquivado eso.",
		"Deja de llorar, no ayuda.",
		"Culpa a la televisión",
		"Culpa a WoW",
		"Si no te hubiesen desinflado en el último parche...",
		"Recuerda ponerte un par de calcetines limpios.",
		"¿Quieres que refresque tu bebida mientras te debilitas?",
		"AYUDA LOL",
		"Menos debilitarse, más curar.",
		"Uf, consigue más puntos de salud.",
		"VENDO: [Frasco de los Titanes]",
		"¿Era eso un tauren o un alce?",
		"Espero que *esta* vez aprendieses tu lección.",
		"¡Mosquis!",
		"Los muertos hablan de cuentos de muertos.",
		"Culpa al sanador",
		"No culpes a Noruega, es un lugar tan bonito",
		"¡Es temporada de conejos!",
		"Un pícaro hubiese usado Esfumarse.",
		"¡ZOMG GNAKEADO!",
		"No puedes culpar a tu teclado esta vez.",
		"Solo... uno... más... bah.",
		"Nada que una taza de café no pueda arreglar.",
		"¿Quizás te dejaste la lavadora encendida?",
		"Será mejor que vayas a ver qué quiere tu perro.",
		"No bebas y mueras.",
		"El helado está por aquí.",
		"Cerveza. Por. Aquí.",
		"Mira siempre el lado brillante de la vida",
		"No importa lo que hagas...",
		"Impecable caminata",

		"No imites a Clark Gable.",
		"En ocasiones veo muertos",
		"Peligro es mi apellido",
		"Corre, Forrest...¡Corre!",
		"¡No me siento las piernas!",
		"No he reparado en gastos",
		"Estoy a 30 minutos de ahí, llegaré en 10",
		"Si quieres mirar mal a alguien búscate un espejo",
		"¡No hay dolor! ¡No hay dolor!",
		"¡Corred, insensatos!",
		"Nunca imaginé morir peleando al lado de un elfo",
		"No son los años querida, son los kilómetros",
		"Mueve el dedo gordo...",
		"Volveré",
		"¡Inconcebible!",
		"Sigue al conejo blanco",
	},
} end)

L:AddTranslations("koKR", function() return {
	["CorpseNames"] = {"시체", -- Insert cultural humour for death here. This is all fairly english based stuff, so change for translations
		"당신은 죽었습니다. 빨리 시체를 찾으세요.",
		"시체의 위치입니다.",
		"이제 그마~~안~~~~",
		"그만 좀 죽지??",
		"아까운 내 수리비....ㅠㅠ",
		"잠 좀 깨세요...",
	},
} end)

L:AddTranslations("deDE", function() return {
	["CorpseNames"] = {
		"Der Ort des Untergangs",
		"Komposthaufen",
		"Fabrik für Wurmfutter",
		"Merke: Nicht mit dem Bär kuscheln",
		"Ich sehe Licht am Ende des Pfeils...",
		"Du verrücktes Würstchen.",
		"Okay, das war ein Fehler.",
		"Es gibt schlimmeres.",
		"Der Jäger ist schuld.",
		"Der Priester ist schuld.",
		"ZIEMLICH DUNKEL HIER, ODER?",
		"Du wolltest es doch!",
		"Bring eine Schaufel mit.",
		"Ein Gnom wäre dem wohl entgangen.",
		"Heul nicht, das bringt doch nichts.",
		"Gib WoW die Schuld.",
		"Wärst du bloß nicht mit dem letzten Patch generft worden...",
		"Neue Socken nicht vergessen.",
		"Noch ein Drink zur Entspannung?",
		"HLIFE LOL",
		"Nicht zurücklehnen. Heilen.",
		"Mein Gott, du brauchst mehr Gesundheit!",
		"Verkaufe [Fläschen der Titanen]",
		"War das ein Tauren oder ein Elch?",
		"Hoffentlich hast du *diesmal* was daraus gelernt.",
		"Neiiin!",
		"Der Heiler ist schuld.",
		"Die Hasenjagd ist eröffnet!",
		"Ein Schurke hätte in dieser Situation 'Verschwinden' benutzt.",
		"ZOMG GNAKED!",
		"Diesmal kannst du es nicht auf die Tastatur schieben.",
		"Nur... noch... einen... bah.",
		"Kaffee hilft dir jetzt auch nicht weiter.",
		"Dort gibts Eiskrem!",
		"Bier: Hier lang.",
		"Always Look on the Bright Side of Life!",
		"Beeindruckendes Fußwerk!",
		"Manchmal verliert man und manchmal gewinnen eben die anderen.",
		"HAHA!",
		"Alles Kopfsache.",
		"Glückwunsch, du hast eine höhere Existenzebene erreicht.",
	},
} end)

L:AddTranslations("zhTW", function() return {
	["Corpse"] = "屍體",
	["CorpseNames"] = {"屍體", -- Insert cultural humour for death here. This is all fairly english based stuff, so change for translations
		"陳屍地點",
		"命案現場",
		"鮪魚",
		"快回火星吧，地球是很危險的!",
		"小強! 你不能死啊!",
		"生人勿近...",
	},
} end)

L:AddTranslations("zhCN", function() return {
	["Corpse"] = "尸体",
	["CorpseNames"] = {"尸体", -- Insert cultural humour for death here. This is all fairly english based stuff, so change for translations
		"尸体",
		"葬身之地",
		"小强！你不能死啊！",
		"这个时候不能责怪你的键盘。",
		"都怪治疗职业～～～",
		"都怪牧师～～～",
		"都怪猎人～～～",
		"和谐的坟墓",
		"带一把铁铲，埋葬你自己。",
		"握槽！又便当了！",
		"总是看美好的一面人生，不是么？",
		"诺森德埋骨地",
		"为什么上个补丁没 Nerf 它？",
		"地精科技、企鹅动力！",
	},
} end)

-- Russian Translation by StingerSoft (Eritnull aka Шептун)
L:AddTranslations("ruRU", function() return {
	["Corpse"] = "Труп",
	["CorpseNames"] = {"Труп", -- Insert cultural humour for death here. This is all fairly english based stuff, so change for translations
		"Чертов Охотник",
		"Местоположение смерти",
		"Заметка для себя: не обнимайте медведя",
		"Вдалике от света",
		"Это - способ природы сказать Вам: притармази..",
		"Это была ошибка",
		"Нет нет, Охрана, поворот, парирование, уклонение, оборот и - тогда - удар..",
		"Несмотря на все отрицательные признаки, это был очевидно сезон утки",
		"Чертов Жрец",
		"ХЧП: [Склянка Титанов]",
		"Млин!",
		"Эх эти целители",
		"Не пил и умер.",
		"По этому пути ка марожку.",
		"Пиво. ПО этому. Пути.",
	},
} end)

-- Parse the id for the note and propogate the info
-- Possible inputs (zone, x, y) or (zone, id)
function CorpsePoint:init()
	Waypoint.init(self, Cartographer_Waypoints.db.profile.boringDeath and L["Corpse"] or L["CorpseNames"][math.random(#L["CorpseNames"])])
	self:UpdateZone()
end

function CorpsePoint:GetDistance()
	if self.Continent == -1 then
		self:UpdateZone()
		if self.Continent == -1 then
			return -1
		end
	end
	return Waypoint.GetDistance(self)
end


-- This is a horribly convoluted methodology of finding your corpse cross zonally
-- Basically, since we can't depend on Cart to send locations like we
-- do for GuildPoint, we scan the map for the corpse.
-- 1. Locate the continent on which it's on
-- 2. Cycle through the zones til we find it
-- 3. Use the zone and local (to them) map coords to send to Cartographer.
-- The Cartographer map puts all waypoints into suspension on show so as not to lock
-- the map, since we're playing around with it so much to get locations.
function CorpsePoint:UpdateZone()



	local x, y = 0, 0

	if self.Continent ~= -1 then -- If we have a cached continent we are on
		SetMapZoom(self.Continent)
		x, y = GetCorpseMapPosition() -- See if we're still on that continent
	end

	if x == 0 and y == 0 then -- We're no longer on this continent or we never knew which we were on
		for i=1,select("#",GetMapContinents()) do
			SetMapZoom(i) -- Cycle through the continents
			x, y = GetCorpseMapPosition()
			if x ~= 0 and y ~= 0 then
				self.Continent = i
				break
			end
		end
	end
	if self.Continent ~= -1 then -- We've found a continent they're on
		x, y = 0, 0 -- nil out continent position
		if self.Zoneref ~= -1 then -- We have a cached zone from last check
			SetMapZoom(self.Continent, self.Zoneref)
			x, y = GetCorpseMapPosition()
		end
			if x == 0 and y == 0 then -- They're no longer in that zone or we never had a zone
			for i=1,select("#",GetMapZones(self.Continent)) do
				SetMapZoom(self.Continent, i)
				x, y = GetCorpseMapPosition()

				if x > 0 and y > 0 then -- Found them! Store the info
					self.Zoneref = i
					self.x = x
					self.y = y
					self.Zone = select(i,GetMapZones(self.Continent))
					self:AddToMap()
					break
				end
			end
		end
	end
end

-- Use the Corpsemember name as the Title
function CorpsePoint:ToString()
	return self.WaypointID
end

-- Is the member connected and in contiguous space?
function CorpsePoint:IsValid()
	return UnitIsDeadOrGhost("player") and self.WaypointID ~= -1
end

function CorpsePoint:IsReady()
	return self.x > 0 and self.y > 0
end

function CorpsePoint:Cancel()
	self.Continent, self.Zoneref = nil
	return Waypoint.Cancel(self)
end

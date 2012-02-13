assert(Cartographer, "Cartographer not found!")
local Cartographer = Cartographer
local revision = tonumber(("$Revision: 2312 $"):sub(12, -3))
if revision > Cartographer.revision then
	Cartographer.version = "r" .. revision
	Cartographer.revision = revision
	Cartographer.date = ("$Date: 2009-04-15 07:40:25 +0000 (Wed, 15 Apr 2009) $"):sub(8, 17)
end

local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer-Waypoints")

L:AddTranslations("enUS", function() return {
	["Waypoints"] = true,
	["Waypoint"] = true,
	["Module which shows an arrow to direct you to a specified note or location."] = true,
	["Guildmember %s not found."] = true,
	["No party member %s found."] = true,
	["No matching note in zone: %s"] = true,
	["Cannot find note in closest matching zone: %s"] = true,
	["Invalid note entry."] = true,
	["Waypoints cleared."] = true,
	["For usage, see '/waypoint help'"] = true,
	["Commands are:"] = true,
	["General: /waypoint [add] <notesearch> OR <0-100>,<0-100> [title] [z-zone] OR g-<guildnamesearch> OR p-<partynamesearch>"] = true,
	["Clear  : /noway"] = true,
	["View   : /wayq"] = true,
	["Move to end of queue"] = true,
	["Lock waypoint arrow"] = true,
	["Lock the waypoint arrow in place"] = true,
--	["Append new waypoints."] = true,
--	["Place new waypoints at the end of the queue."] = true,

	["Console-waypoint-commands"] = {"/way", "/waypoint" },
	["Console-temp-waypoint-commands"] = {"/tway", "/tloc" },
	["Clear waypoint"] = true,
	["No matching zone"] = true,
	["Waypoint Queue:"] = true,
	["Waypoint Queue Empty."] = true,
	["Clearing up queue"] = true,

	["Show CorpsePoint"] = true,
	["Show waypoint to corpse on death"] = true,
	["Show Waypoint icons"] = true,
	["Show the next waypoint on the minimap and all waypoints on the main"] = true,
	["Show boring death messages"] = true,
	["Switch to not so entertaining messages on death."] = true,
	["Size"] = true,
	["Set the size of the waypoint arrow"] = true,
	["Opacity"] = true,
	["Set how opaque or transparent the waypoint arrow is"] = true,

	["%.0f yd"] = true,
	["%.0f m"] = true,
} end)

L:AddTranslations("koKR", function() return {
	["Waypoints"] = "웨이포인트",
	["Module which shows an arrow to direct you to a specified note or location."] = "당신이 작성한 노트나 위치를 화살표로 표시합니다.",
	["Guildmember %s not found."] = "길드원 %s|1을;를; 찾을 수 없습니다.",
	["No party member %s found."] = "파티원 %s|1을;를; 찾을 수 없습니다.",
	["No matching note in zone: %s"] = "지역 내 일치하는 노트를 찾을 수 없습니다.: %s",
	["Cannot find note in closest matching zone: %s"] = "가까운 지역 내 일치하는 노트를 찾을 수 없습니다.: %s",
	["Invalid note entry."] = "올바른 노트가 아닙니다.",
	["Waypoints cleared."] = "웨이포인트가 삭제되었습니다.",
	["For usage, see '/waypoint help'"] = "사용법, '/waypoint help'",
	["Commands are:"] = "명령어:",
	["General: /waypoint [add] <notesearch> OR <0-100>,<0-100> [title] [z-zone] OR g-<guildnamesearch> OR p-<partynamesearch>"] = "일반: /waypoint [add] <notesearch> OR <0-100>,<0-100> [title] [z-zone] OR g-<guildnamesearch> OR p-<partynamesearch>",
	["Clear  : /noway"] = "삭제  : /noway",
	["View   : /wayq"] = "보기   : /wayq",
	["Move to end of queue"] = "대기열의 끝으로 이동합니다.",
	["Lock waypoint arrow"] = "웨이포인트 화살표 고정",
	["Lock the waypoint arrow in place"] = "웨이포인트 화살표를 고정합니다.",

--	["Console-waypoint-commands"] = {"/way", "/waypoint" },
--	["Console-temp-waypoint-commands"] = {"/tway", "/tloc" },
	["Clear waypoint"] = "웨이포인트 삭제",
	["No matching zone"] = "일치하는 지역이 없습니다.",
	["Waypoint Queue:"] = "웨이포인트 대기열:",
	["Waypoint Queue Empty."] = "웨이포인트 대기열이 비었습니다.",
	["Clearing up queue"] = "대기열 삭제",

	["Show CorpsePoint"] = "시체 위치 표시",
	["Show waypoint to corpse on death"] = "시체 위치에 웨이포인트를 표시합니다.",
	["Show Waypoint icons"] = "웨이포인트 아이콘 표시",
	["Show the next waypoint on the minimap and all waypoints on the main"] = "미니맵에 근처 웨이포인트를 표시하고 월드맵에 모든 웨이포인트를 표시합니다.",
	["Show boring death messages"] = "죽음 메세지 표시",
	["Switch to not so entertaining messages on death."] = "죽었을 때 재미있는 매세지를 표시할 지를 설정합니다.",
	["Size"] = "크기",
	["Set the size of the waypoint arrow"] = "웨이포인트 화살표 크기를 조절합니다.",
	["Opacity"] = "투명도",
	["Set how opaque or transparent the waypoint arrow is"] = "웨이포인트 화살표의 투명도를 조절합니다.",

	["%.0f yd"] = "%.0f yd",
	["%.0f m"] = "%.0f 미터",
} end)

L:AddTranslations("deDE", function() return {
	["Waypoints"] = "Wegpunkte",
	["Module which shows an arrow to direct you to a specified note or location."] = "Modul, das einen Pfeil anzeigt, welcher Euch zu einer Notiz oder Position führt.",
	["Guildmember %s not found."] = "Gildenmitglied %s nicht gefunden.",
	["No party member %s found."] = "Gruppenmitglied %s nicht gefunden.",
	["No matching note in zone: %s"] = "Keine gültige Notiz in Gebiet: %s",
	["Cannot find note in closest matching zone: %s"] = "Kann keine Notiz im am ehesten zutreffenden Gebiet: %s finden!",
	["Invalid note entry."] = "Ungültiger Notiz-Eintrag.",
	["Waypoints cleared."] = "Wegpunkte entfernt",
	["For usage, see '/waypoint help'"] = "Gebt '/waypoint help' ein, um Hinweise zur Verwendung anzuzeigen",
	["Commands are:"] = "Die folgenden Befehle stehen zur Verfügung:",
	["General: /waypoint [add] <notesearch> OR <0-100>,<0-100> [title] [z-zone] OR g-<guildnamesearch> OR p-<partynamesearch>"] = "Allgemein: /waypoint [dazu] <notizsuche> ODER <0-100>,<0-100> [titel] [z-zone] ODER g-<gildennamenssuche> ODER p-<gruppennamenssuche>",
	["Clear  : /noway"] = "Entfernen  : /noway",
	["View   : /wayq"] = "Ansehen   : /wayq",
	["Move to end of queue"] = "Zum Ende der Warteschlange bewegen.",
	["Lock waypoint arrow"] = "Wegpunktpfeil sperren",
	["Lock the waypoint arrow in place"] = "Sperrt den Wegpunkt Pfeil an seiner momentanen Position.",


	["Console-waypoint-commands"] = {"/way", "/waypoint" },
	["Console-temp-waypoint-commands"] = {"/tway", "/tloc" },
	["Clear waypoint"] = "Wegpunkt entfernen",
	["No matching zone"] = "Kein zutreffendes Gebiet",
	["Waypoint Queue:"] = "Wegpunkt-Warteschlange:",
	["Waypoint Queue Empty."] = "Wegpunkt-Warteschlange ist leer.",
	["Clearing up queue"] = "Warteschlange aufräumen",

	["Show CorpsePoint"] = "Position des Leichnams anzeigen",
	["Show waypoint to corpse on death"] = "Nach dem Tod Wegpunkte zum Leichnam anzeigen",
	["Show Waypoint icons"] = "Wegpunktsymbole anzeigen",
	["Show the next waypoint on the minimap and all waypoints on the main"] = "Den nächsten Wegpunkt auf der Minimap und alle Wegpunkte auf dem Weg zu Ziel anzeigen",
	["Show boring death messages"] = "Langweilige Todesnachrichten anzeigen",
	["Switch to not so entertaining messages on death."] = "Wechselt nach dem Tod auf weniger unterhaltsame Nachrichten.",
} end)

L:AddTranslations("frFR", function() return {
	["Waypoints"] = "Points de navigation",
	["Module which shows an arrow to direct you to a specified note or location."] = "Module affichant une fl\195\170che qui vous oriente vers un emplacement ou une note sp\195\169cifi\195\169e.",
	["Guildmember %s not found."] = "Membre de la guilde %s introuvable.",
	["No party member %s found."] = "Membre du groupe %s introuvable.",
	["No matching note in zone: %s"] = "Aucun note correspondante dans la zone : %s",
	["Cannot find note in closest matching zone: %s"] = "Impossible de trouver la note dans la zone correspondante la plus proche : %s",
	["Invalid note entry."] = "Note indiqu\195\169e invalide.",
	["Waypoints cleared."] = "Points de navigation effac\195\169s.",
	["For usage, see '/waypoint help'"] = "Pour l'aide \195\160 l'utilisation, tapez '/waypoint help'",
	["Commands are:"] = "Les commandes sont : ",
	["General: /waypoint [add] <notesearch> OR <0-100>,<0-100> [title] [z-zone] OR g-<guildnamesearch> OR p-<partynamesearch>"] = "G\195\169n\195\169ral : /waypoint [add] <note-recherch\195\169e> OU <0-100>,<0-100> [titre] [z-zone] OU g-<nom-guilde-recherch\195\169> OU p-<nom-groupe-recherch\195\169>",
	["Clear  : /noway"] = "Effacer  : /noway",
	["View   : /wayq"] = "Voir       : /wayq",
	["Move to end of queue"] = "D\195\169placer \195\160 la fin de la liste",
	["Lock waypoint arrow"] = "Verrouiller la flèche indicatrice",
	["Lock the waypoint arrow in place"] = "Verrouille la flèche indicatrice afin qu'elle ne puisse plus être déplacée.",

	["Console-waypoint-commands"] = {"/way", "/waypoint" },
	["Console-temp-waypoint-commands"] = {"/tway", "/tloc" },
	["Clear waypoint"] = "Effacer le point de navigation",
	["No matching zone"] = "Aucune zone correspondante.",
	["Waypoint Queue:"] = "Liste des points de navigation :",
	["Waypoint Queue Empty."] = "Liste des points de navigation vide.",
	["Clearing up queue"] = "Liste nettoyée.",

	["Show CorpsePoint"] = "Afficher CorpsePoint",
	["Show waypoint to corpse on death"] = "Affiche un point de navigation sur votre corps lors de la mort.",
	["Show Waypoint icons"] = "Afficher les ic\195\180nes points de navigation",
	["Show the next waypoint on the minimap and all waypoints on the main"] = "Affiche le prochain point de navigation sur la minicarte et tous les points de navigation sur la carte principale.",
	["Show boring death messages"] = "Afficher des messages \195\160 la mort",
	["Switch to not so entertaining messages on death."] = "Affiche ou non des messages pas si amusants que cela \195\160 la mort.",
} end)

L:AddTranslations("esES", function() return {
	["Waypoints"] = "Puntos de Ruta",
	["Waypoint"] = "Punto de Ruta",
	["Module which shows an arrow to direct you to a specified note or location."] = "Módulo que muestra una flecha que te dirije a una nota o lugar especificado.",
	["Guildmember %s not found."] = "No se ha encontrado al miembro de la hermandad %s.",
	["No party member %s found."] = "No se ha encontrado al miembro del grupo %s.",
	["No matching note in zone: %s"] = "No concuerda ninguna nota en la zona: %s",
	["Cannot find note in closest matching zone: %s"] = "No se puede encontrar la nota en el nombre de zona más parecido: %s",
	["Invalid note entry."] = "Nota introducida no válida.",
	["Waypoints cleared."] = "Puntos de Ruta borrados.",
	["For usage, see '/waypoint help'"] = "Para usar mira /waypoint help",
	["Commands are:"] = "Los comandos son:",
	["General: /waypoint [add] <notesearch> OR <0-100>,<0-100> [title] [z-zone] OR g-<guildnamesearch> OR p-<partynamesearch>"] = "General: /waypoint [añadir] <notesearch> O <0-100>,<0-100> [título] [z-zona] O g-<busquedaDeNombreDeHermandad> OR p-<busquedaDeNombreDeGrupo>",
	["Clear  : /noway"] = "Borrar  : /noway",
	["View   : /wayq"] = "Ver   : /wayq",
	["Move to end of queue"] = "Mover al final de la cola",
	["Lock waypoint arrow"] = "Bloquear flecha de Punto de Ruta",
	["Lock the waypoint arrow in place"] = "Inmoviliza la flecha del Punto de Ruta",


	["Console-waypoint-commands"] = {"/way", "/waypoint" },
	["Console-temp-waypoint-commands"] = {"/tway", "/tloc" },
	["Clear waypoint"] = "Borrar Punto de Ruta",
	["No matching zone"] = "No se ha encontrado la zona",
	["Waypoint Queue:"] = "Cola de Puntos de Ruta:",
	["Waypoint Queue Empty."] = "Cola de Puntos de Ruta vacía.",
	["Clearing up queue"] = "Borrando la cola",

	["Show CorpsePoint"] = "Mostrar el lugar del cadáver",
	["Show waypoint to corpse on death"] = "Muestra el punto de ruta del cadáver cuando mueres",
	["Show Waypoint icons"] = "Mostrar iconos de puntos de ruta",
	["Show the next waypoint on the minimap and all waypoints on the main"] = "Muestra el siguiente Punto de Ruta en el minimapa y todos en el mapa principal",
	["Show boring death messages"] = "Mostrar mensajes de muerte aburridos",
	["Switch to not so entertaining messages on death."] = "Muestra mensajes no tan entretenidos al morir.",

	["Size"] = "Tamaño",
	["Set the size of the waypoint arrow"] = "Establece el tamaño de la flecha del Punto de Ruta",
	["Opacity"] = "Opacidad",
	["Set how opaque or transparent the waypoint arrow is"] = "Establece el nivel de opacidad o transparencia de la flecha del Punto de Ruta",
} end)

L:AddTranslations("zhTW", function() return {
	["Waypoints"] = "路徑點",
	["Waypoint"] = "路徑點",
	["Module which shows an arrow to direct you to a specified note or location."] = "顯示箭頭指引你到特定註記或地點的模組。",
	["Guildmember %s not found."] = "找不到公會成員%s。",
	["No party member %s found."] = "找不到隊伍成員%s。",
	["No matching note in zone: %s"] = "在地區: %s，找不到符合的註記",
	["Cannot find note in closest matching zone: %s"] = "在最接近的地區: %s，找不到註記",
	["Invalid note entry."] = "無效的註記。",
	["Waypoints cleared."] = "路徑點已清除。",
	["For usage, see '/waypoint help'"] = "查詢用法請輸入「/waypoint help」",
	["Commands are:"] = "指令是:",
	["General: /waypoint [add] <notesearch> OR <0-100>,<0-100> [title] [z-zone] OR g-<guildnamesearch> OR p-<partynamesearch>"] = "一般: /waypoint [add] <notesearch> 或 <0-100>,<0-100> [title] [z-zone] 或 g-<guildnamesearch> 或 p-<partynamesearch>",
	["Clear  : /noway"] = "清除: /noway",
	["View   : /wayq"] = "檢視: /wayq",
	["Move to end of queue"] = "移動到佇列末端",
	["Lock waypoint arrow"] = "鎖定路徑點箭頭",
	["Lock the waypoint arrow in place"] = "鎖定路徑點箭頭位置",

	["Console-waypoint-commands"] = {"/way", "/waypoint" },
	["Console-temp-waypoint-commands"] = {"/tway", "/tloc" },
	["Clear waypoint"] = "清除路徑點",
	["No matching zone"] = "沒有符合的地區",
	["Waypoint Queue:"] = "路徑點佇列:",
	["Waypoint Queue Empty."] = "路徑點佇列已清空",
	["Clearing up queue"] = "正在清除佇列",

	["Show CorpsePoint"] = "顯示陳屍地點",
	["Show waypoint to corpse on death"] = "死亡時顯示到屍體的路徑點",
	["Show Waypoint icons"] = "顯示路徑點圖示",
	["Show the next waypoint on the minimap and all waypoints on the main"] = "在小地圖顯示下個路徑點，在世界地圖顯示所有路徑點",
	["Show boring death messages"] = "顯示正常的死亡訊息",
	["Switch to not so entertaining messages on death."] = "切換為正常的死亡訊息",

	["%.0f yd"] = "%.0f碼",
	["%.0f m"] = "%.0f米",
} end)

L:AddTranslations("zhCN", function() return {
	["Waypoints"] = "路径",
	["Waypoint"] = "路径",
	["Module which shows an arrow to direct you to a specified note or location."] = "显示箭头指引你到指定的目的地。",
	["Guildmember %s not found."] = "找不到公会成员<%s>。",
	["No party member %s found."] = "找不到队伍成员<%s>。",
	["No matching note in zone: %s"] = "区域<%s>中找不到符合的注释。",
	["Cannot find note in closest matching zone: %s"] = "在最接近的区域中找不到注释：%s",
	["Invalid note entry."] = "无效的注释。",
	["Waypoints cleared."] = "路径已清除。",
	["For usage, see '/waypoint help'"] = "查询使用方法输入：/waypoint help",
	["Commands are:"] = "命令：",
	["General: /waypoint [add] <notesearch> OR <0-100>,<0-100> [title] [z-zone] OR g-<guildnamesearch> OR p-<partynamesearch>"] = "一般：/waypoint [add] <notesearch> 或 <0-100>,<0-100> [title] [z-zone] 或 g-<guildnamesearch> 或 p-<partynamesearch>",
	["Clear  : /noway"] = "清除：/noway",
	["View   : /wayq"] = "查看：/wayq",
	["Move to end of queue"] = "移动到队列尾部",
	["Lock waypoint arrow"] = "锁定路径箭头",
	["Lock the waypoint arrow in place"] = "锁定路径箭头位置",
--	["Append new waypoints."] = "添加新的路径",
--	["Place new waypoints at the end of the queue."] = "在最后队列添加新的路径。",

	["Console-waypoint-commands"] = {"/way", "/waypoint" },
	["Console-temp-waypoint-commands"] = {"/tway", "/tloc" },
	["Clear waypoint"] = "清除路径",
	["No matching zone"] = "没有符合的区域",
	["Waypoint Queue:"] = "路径队列：",
	["Waypoint Queue Empty."] = "路径队列已清空。",
	["Clearing up queue"] = "正在清除队列",

	["Show CorpsePoint"] = "显示尸体地点",
	["Show waypoint to corpse on death"] = "死亡时显示尸体的路径",
	["Show Waypoint icons"] = "显示路径图标",
	["Show the next waypoint on the minimap and all waypoints on the main"] = "在小地图显示下一个路径, 在世界地图显示所有的路径。",
	["Show boring death messages"] = "显示正常的死亡信息",
	["Switch to not so entertaining messages on death."] = "切换显示正常的死亡信息。",
	["Size"] = "大小",
	["Set the size of the waypoint arrow"] = "设置路径箭头的大小",
	["Opacity"] = "不透明",
	["Set how opaque or transparent the waypoint arrow is"] = "设置路径箭头透明或不透明",

	["%.0f yd"] = "%.0f 码",
	["%.0f m"] = "%.0f 米",
} end)

-- Russian Translation by StingerSoft (Eritnull aka Шептун)
L:AddTranslations("ruRU", function() return {
	["Waypoints"] = "Точки маршрута",
	["Waypoint"] = "Точка маршрута",
	["Module which shows an arrow to direct you to a specified note or location."] = "Модуль отображает стрелкой направление к указанной заметке или местонахождении",
	["Guildmember %s not found."] = "Член гильдии %s не найден",
	["No party member %s found."] = "Участник группы %s не найден",
	["No matching note in zone: %s"] = "Нету соответствующих заметок в зоне: %s",
	["Cannot find note in closest matching zone: %s"] = "Не возможно найти заметку в ближайшей соответствующей зоне: %s",
	["Invalid note entry."] = "Неверный ввод заметки",
	["Waypoints cleared."] = "Точки маршрута очищены",
	["For usage, see '/waypoint help'"] = "Для большой информации наберите '/waypoint help'",
	["Commands are:"] = "Команда:",
	["General: /waypoint [add] <notesearch> OR <0-100>,<0-100> [title] [z-zone] OR g-<guildnamesearch> OR p-<partynamesearch>"] = "Общий: /waypoint [add] <notesearch> ИЛИ <0-100>,<0-100> [title] [z-zone] ИЛИ g-<guildnamesearch> ИЛИ p-<partynamesearch>",
	["Clear  : /noway"] = "Очистить: /noway",
	["View   : /wayq"] = "Просмотр: /wayq",
	["Move to end of queue"] = "Переместить в конец очереди",
	["Lock waypoint arrow"] = "Закрепить стрелку точки маршрута",
	["Lock the waypoint arrow in place"] = "Закрепить стрелку точки маршрута на данном месте",
	["Append new waypoints."] = "Добавить точку маршрута",
	["Place new waypoints at the end of the queue."] = "Поместить новую точку маршрута в конец очереди",

	["Console-waypoint-commands"] = {"/way", "/waypoint" },
	["Console-temp-waypoint-commands"] = {"/tway", "/tloc" },
	["Clear waypoint"] = "Очистить точку маршрута",
	["No matching zone"] = "Нет соответствующей зоны",
	["Waypoint Queue:"] = "Очередь точек маршрута",
	["Waypoint Queue Empty."] = "Очередь точек маршрута пустая",
	["Clearing up queue"] = "Очищены, очередь смещена вверх",

	["Show CorpsePoint"] = "Показать точку трупа",
	["Show waypoint to corpse on death"] = "Показывает точку маршрута до трупа где вы умерли",
	["Show Waypoint icons"] = "Показывать иконки",
	["Show the next waypoint on the minimap and all waypoints on the main"] = "Показывает следующую точку маршрута на мини-карте и все точки на главной карте",
	["Show boring death messages"] = "Показывать идиотские сообщения после смерти",
	["Switch to not so entertaining messages on death."] = "Отоброжение идиотских сообщений после смерти.",
	["Size"] = "Размер",
	["Set the size of the waypoint arrow"] = "Установить размер стрелки точек маршрута",
	["Opacity"] = "Полупрозрачность",
	["Set how opaque or transparent the waypoint arrow is"] = "Установить прозрачность стрелки точек маршрута",

	["%.0f yd"] = "%.0f ярд",
	["%.0f m"] = "%.0f м",
} end)

Cartographer_Waypoints = Cartographer:NewModule("Waypoints", "LibRockHook-1.0", "LibRockEvent-1.0", "LibRockTimer-1.0", "LibRockComm-1.0", "LibRockConsole-1.0")
local Cartographer_Waypoints = Cartographer_Waypoints
local self = Cartographer_Waypoints

local Dewdrop = AceLibrary("Dewdrop-2.0")
local Tablet = AceLibrary("Tablet-2.0")
local Tourist = Rock("LibTourist-3.0")
local Crayon = Rock("LibCrayon-3.0")
local BZR = Rock("LibBabble-Zone-3.0"):GetReverseLookupTable()
local Abacus = Rock("LibAbacus-3.0")

local _G = getfenv(0)
local metric = (GetLocale() ~= "enUS" and GetLocale() ~= "zhTW" and GetLocale() ~= "zhCN")

local localization = GetLocale()
local yardString = (localization == "enUS" or localization == "zhTW" or localization == "zhCN") and L["%.0f yd"] or L["%.0f m"]

local math_floor = math.floor

local Queue = {}
Cartographer_Waypoints.Queue = Queue

Cartographer_Waypoints.mapdb = {version = 4}

local function round(num, digits)
	-- banker's rounding
	local mantissa = 10^digits
	local norm = num*mantissa
	norm = norm + 0.5
	local norm_f = math_floor(norm)
	if norm == norm_f and (norm_f % 2) ~= 0 then
		return (norm_f-1)/mantissa
	end
	return norm_f/mantissa
end

local function getID(x, y)
	return round(x*10000, 0) + round(y*10000, 0)*10001
end
Cartographer_Waypoints.getID = getID

local function getXY(id)
	return (id % 10001)/10000, math_floor(id / 10001)/10000
end
Cartographer_Waypoints.getXY = getXY

local delimiters = {[" "] = true, [","] = true, ["-"]=true}


-- I apologise for this function. It works, but it isn't pretty.
-- Just take it for granted that it explodes on the delimiter, but
-- takes into account quotation marks, as long as the quotation marks
-- are around more than one word.
local function explode(...)

	if select("#",...) == 2 and delimiters[select(1,...)] then
		return explode(string.split(select(1, ...), select(2, ...)))
	end

	local arr,quote = {},nil
	for i = 1,select("#",...) do -- for each divider found
		local word = select(i,...)
		local quotefound = string.find(word,"[\"\']")
		if (not quotefound and not quote) or (quotefound and quote) then
			if quotefound and quote then
				local clean = string.gsub(quote.." "..word, "[\"\']", "")
				table.insert(arr,clean)
			else
				table.insert(arr,word)
			end
			quote = nil
		else
			if quote then
				quote = quote.." "..word
			else
				quote = word
			end
		end
	end
	return arr
end


local function PushQueue(waypoint, append)
	if append then
		table.insert(Queue, waypoint)
	else
--[[		if self.db.profile.appendPoint then
			table.insert(Queue, waypoint)
		else --]]
			table.insert(Queue,1, waypoint)
--		end
	end
end

local function PopQueue()
	local corn = table.remove(Queue, 1)

	if corn.OnMap and corn.POIID and Waypoint.MapDB[corn.Zone] and Waypoint.MapDB[corn.Zone][corn.POIID] then
		Waypoint.MapDB[corn.Zone][corn.POIID].focus = nil

		if #Queue > 0 then
			local waypoint = Queue[1]
			if waypoint.POIID and Waypoint.MapDB[waypoint.Zone] and Waypoint.MapDB[waypoint.Zone][waypoint.POIID] then
				Waypoint.MapDB[waypoint.Zone][waypoint.POIID].focus = true
			end
		end
	end

	return corn
end

--local waypointFrame
function Cartographer_Waypoints:OnInitialize()
	self.db = Cartographer:AcquireDBNamespace("Waypoints")
	Cartographer:RegisterDefaults("Waypoints", 'profile', {
		scale = 1,
		alpha = 1,
	})

	if Cartographer_Notes then
		Cartographer_Notes:RegisterNotesDatabase("Waypoints", Waypoint.MapDB, Waypoint)
	end

	self.name = L["Waypoints"]
	self.title = L["Waypoints"]
	Cartographer.options.args.Waypoints = {
		name = L["Waypoints"],
		desc = L["Module which shows an arrow to direct you to a specified note or location."],
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
			corpse = {
				name = L["Show CorpsePoint"],
				desc = L["Show waypoint to corpse on death"],
				type = "toggle",
				get = function() return self.db.profile.corpsePoint end,
				set = function() self.db.profile.corpsePoint = not self.db.profile.corpsePoint end,
			},
			boring = {
				name = L["Show boring death messages"],
				desc = L["Switch to not so entertaining messages on death."],
				type = "toggle",
				get = function() return self.db.profile.boringDeath end,
				set = function() self.db.profile.boringDeath = not self.db.profile.boringDeath end,
			},
			minimap = {
				name = L["Show Waypoint icons"],
				desc = L["Show the next waypoint on the minimap and all waypoints on the main"],
				type = "toggle",
				get = function() return self.db.profile.minimapShow end,
				set = function() self.db.profile.minimapShow = not self.db.profile.minimapShow end,
			}, --[[
			newpointorder = {
				name = L["Append new waypoints."],
				desc = L["Place new waypoints at the end of the queue."],
				type = "toggle",
				get  = function() return self.db.profile.appendPoint end,
				set = function() self.db.profile.appendPoint = not self.db.profile.appendPoint end,
			},--]]
			scale = {
				name = L["Size"],
				desc = L["Set the size of the waypoint arrow"],
				type = 'range',
				min = 0.25,
				max = 4,
				isPercent = true,
				step = 0.01,
				bigStep = 0.05,
				get = function() return self.db.profile.scale end,
				set = function(value)
					self.db.profile.scale = value
					if waypointFrame then
						waypointFrame:SetScale(value)
					end
				end
			},
			alpha = {
				name = L["Opacity"],
				desc = L["Set how opaque or transparent the waypoint arrow is"],
				type = 'range',
				min = 0,
				max = 1,
				isPercent = true,
				step = 0.01,
				bigStep = 0.05,
				get = function() return self.db.profile.alpha end,
				set = function(value)
					self.db.profile.alpha = value
					if waypointFrame then
						waypointFrame:SetAlpha(value)
					end
				end
			}
		},
		handler = self,
	}
end

local waypointLocalZone
--path, altpath
local function createWaypointFrame()
	path = "Interface\\AddOns\\Cartographer_Waypoints\\Artwork\\Arrow"
	altpath = "Interface\\AddOns\\Cartographer\\Cartographer_Waypoints\\Artwork\\Arrow"

	waypointFrame = CreateFrame("Frame", "Cartographer_Waypoint", UIParent)
	waypointFrame:SetWidth(56)
	waypointFrame:SetHeight(64)
	waypointFrame:SetScale(self.db.profile.scale)
	waypointFrame:SetAlpha(self.db.profile.alpha)
	waypointFrame:Show()
	local tex = waypointFrame:CreateTexture(nil, "OVERLAY")
	waypointFrame.tex = tex
	tex:SetWidth(56)
	tex:SetHeight(42)
	tex:SetTexture(path)
	if not tex:GetTexture() then
		tex:SetTexture(altpath)
	end
	waypointFrame.up = false
	tex:SetPoint("TOP")
	local dist = waypointFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	waypointFrame.dist = dist
	dist:SetPoint("BOTTOM")
	local title = waypointFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	waypointFrame.title = title
	title:SetPoint("TOP", dist, "BOTTOM")
	local tta = waypointFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	waypointFrame.tta = tta
	tta:SetPoint("TOP", title, "BOTTOM")
	waypointFrame:EnableMouse(true)
	waypointFrame:SetMovable(not self.db.profile.locked)
	waypointFrame:RegisterForDrag(not self.db.profile.locked and "LeftButton" or nil)
	waypointFrame:SetScript("OnDragStart", function(this)
		this:StartMoving()
	end)
    local closeFunc = function()
        Dewdrop:Close()
    end
	waypointFrame:SetScript("OnDragStop", function(this)
	this:StopMovingOrSizing()
		local x,y = this:GetCenter()
		x = x - GetScreenWidth() / 2
		y = y - GetScreenHeight() / 2
		self.db.profile.waypointX = x
		self.db.profile.waypointY = y
		this:ClearAllPoints()
		this:SetPoint("CENTER", UIParent, "CENTER", x, y)
	end)
	waypointFrame:SetClampedToScreen(true)
	waypointFrame:SetPoint("CENTER", UIParent, "CENTER", self.db.profile.waypointX, self.db.profile.waypointY)
	Dewdrop:Register(waypointFrame,
		'children', function()
			Dewdrop:AddLine(
				'text', L["Clear waypoint"],
				'arg1', self,
				'arg2', Queue,
				'func', function(self, Queue) Queue[1]:Cancel() end,
				'closeWhenClicked', true
			)
			if #Queue > 1 then
				Dewdrop:AddLine(
					'text', L["Move to end of queue"],
					'arg1', self,
					'arg2', Queue,
					'func', function(self, Queue)  PushQueue(PopQueue(), 1) end,
					'closeWhenClicked', true
				)
			end
			Dewdrop:AddLine()
			Dewdrop:AddLine(
				'text', L["Lock waypoint arrow"],
				'desc', L["Lock the waypoint arrow in place"],
				'checked', self.db.profile.locked,
				'func', function() local locked = self.db.profile.locked
					if locked then
						waypointFrame:RegisterForDrag("LeftButton")
						waypointFrame:EnableMouse(true)
						waypointFrame:SetMovable(true)
						self.db.profile.locked = false
					else
						waypointFrame:RegisterForDrag(nil)
						waypointFrame:SetMovable(false)
						self.db.profile.locked = true
					end
				end,
				'closeWhenClicked', true
			)
			Dewdrop:AddLine(
				'text', CLOSE,
                'func', closeFunc,
				'closeWhenClicked', true
			)
		end
	)
end

local initMeOnce
local noop = function() end -- empty function
initMeOnce = function ()
	local function waypointCommand(text,temp)
		local waypoint

		if not text or string.len(text) < 1 then
			self:Print(L["For usage, see '/waypoint help'"])
			return
		end
		if text == "help" then
			self:Print(L["Commands are:"])
			self:Print(L["General: /waypoint [add] <notesearch> OR <0-100>,<0-100> [title] [z-zone] OR g-<guildnamesearch> OR p-<partynamesearch>"])
			self:Print(L["Clear  : /noway"])
			self:Print(L["View   : /wayq"])
			return
		end

		SetMapToCurrentZone()
		local zone = Cartographer:GetCurrentEnglishZoneName()

		-- This function will take the explode by delimiter and then further explode
		-- each entry by '-' and then insert them into a table
		-- For an argument string like 'Cabbage p-Womble z-Zangarmarsh Frogs" you'll end
		-- up with a table looking like:
		-- {
		--   arg1 = "Cabbage",
		--   p = "Womble",
		--   z = "Zangarmarsh",
		--   arg2 = "Frogs"
		-- }
		--
		local function parseOptions(text, delimiter)
			if not delimiter then delimiter = " " end
			local args, options, count = explode(delimiter, text), {}, 1
			for _, arg in ipairs(args) do
				local split = explode("-", arg)
				if #split == 2 then
					options[split[1]] = split[2]
				else
					options["arg"..count] = arg
					count = count + 1
				end
			end
			return options
		end
		-- The options we have in place are:
		--		g-<GuildMemberNameOrPartThereof>
		--		p-<PartyMemberNameOrPartThereof>
		--		z-<SpecificZoneName>
		--
		local options = parseOptions(text)
--		womble = options
		local x,y,title,imprecise
		if options.z then -- Lets qualify the zone name
			options.z, imprecise = Cartographer_Notes:FindZone(options.z)
			if not options.z then
				options.z = L["No matching zone"]
			end
		end
		-- Okay, horribly convoluted.
		-- Basically we want to handle the following possiblities for note based waypoints
		--		/way 23,34
		--		/way add 23,34
		--		/way 23,34 MyNote
		--		/way add 23,34 MyNote
		--		/way CurrentNoteSearchName
		--		/way add CurrentNoteSearchName
		if options.arg1 then -- check for x,y

			if tonumber(options.arg1) and tonumber(options.arg2) then -- /way 23 34
				options.arg1 = options.arg1..","..options.arg2
				options.arg2 = options.arg3 or nil
				options.arg3 = options.arg4 or nil
			end

			local xy = explode(",", options.arg1)
			if #xy == 2 then
				x = xy[1]
				y = xy[2]
				if options.arg2 and type(options.arg2) == "string" then
					title = options.arg2
				else
					title = L["Waypoint"]
				end
			else
				if options.arg1 == "add" then
					if options.arg2 then
						xy = explode(",", options.arg2)
						if #xy == 2 then
							x = xy[1]
							y = xy[2]
						else -- We're a text search for a note, not a x,y note
							x, y = select(2,Cartographer_Notes:FindNearestNote(options.arg2, options.z))
							if not x then
								if imprecise then
									self:Print(L["Cannot find note in closest matching zone: %s"], options.z or zone)
								else
									self:Print(L["No matching note in zone: %s"], options.z or zone)
								end

								return
							end
						end
						if options.arg3 and type(options.arg3) == "string" then
							title = options.arg3
						else
							title = L["Waypoint"]
						end
					end
				else
					x, y = select(2, Cartographer_Notes:FindNearestNote(options.arg1, options.z))
					if not x then
						if imprecise then
							self:Print(L["Cannot find note in closest matching zone: %s"], options.z or zone)
						else
							self:Print(L["No matching note in zone: %s"], options.z or zone)
						end

						return
					end
				end
			end
			x,y = tonumber(x), tonumber(y)
			if x > 1 and y > 1 then
				x,y = tonumber(x)/100, tonumber(y)/100
			end
			if NotePoint then
				waypoint = NotePoint:new(options.z or zone, x, y, title)
				if not waypoint:IsValid() then
					self:Print(L["Invalid note entry."])
					return
				end
			end
		end

		if options.g then -- We want to add a guild member
			if GuildPoint then
				waypoint = GuildPoint:new(options.g)
				if not waypoint:IsValid() then
					self:Print(L["Guildmember %s not found."], options.g)
					return
				end
			end
		end

		if options.p then -- We want to add a party member
			if PartyPoint then
				waypoint = PartyPoint:new(options.p)
				if not waypoint:IsValid() then
					self:Print(L["No party member %s found."], options.p)
					return
				end
			end
		end

		if waypoint then
			if options.arg1 and options.arg1 == "add" then
				PushQueue(waypoint, 1)
			else
				PushQueue(waypoint)
			end
			local showOnMap = waypoint.ShowOnMap
			if type(showOnMap) == "function" then
				showOnMap = showOnMap(waypoint)
			end
			if showOnMap and self.db.profile.minimapShow then
				waypoint:AddToMap()
			end
			self:AddRepeatingTimer("CartographerWaypoints-UpdateWaypoint", 0.05, "UpdateWaypoint")
			if not waypointFrame then
				createWaypointFrame()
			end
		end
	end

	local function getQueue()
		if #Queue == 0 then
			self:Print(L["Waypoint Queue Empty."])
			return
		end
		self:Print(L["Waypoint Queue:"])
		for i,v in ipairs(Queue) do
			self:Print("    "..v:ToString())
		end
	end

	local t = { unpack(L["Console-waypoint-commands"]) }
	for _,v in ipairs(L["Console-temp-waypoint-commands"]) do
		t[#t+1] = v
	end
	self:AddSlashCommand(function(command, text)
		waypointCommand(text)
	end, unpack(t))
	t = nil

	self:AddSlashCommand(function() getQueue() end, "/wayq")

	self:AddSlashCommand(function()
		self:Print(L["Waypoints cleared."])
		for i,v in ipairs(Queue) do
			v:Cancel()
		end
		Queue = {}
	end, "/noway")

	initMeOnce = noop -- nil itself
end

function Cartographer_Waypoints:OnEnable()
	Rock("LibGuild-1.0").RegisterCallback(self, "Disconnected", "LibGuild_Disconnected")
	self:AddCommListener("CGP", "GUILD")
	self:AddCommListener("CGP", "WHISPER")
	self:AddEventListener("Cartographer", "MapOpened", "Cartographer_MapOpened")
	self:AddEventListener("Cartographer", "MapClosed", "Cartographer_MapClosed")
	self:AddEventListener("PLAYER_ALIVE")
	self:AddEventListener("PLAYER_ENTERING_WORLD", "PLAYER_ALIVE")
	self:AddEventListener("PLAYER_UNGHOST")
	self:AddEventListener("PLAYER_REGEN_ENABLED")
	self:AddEventListener("PLAYER_REGEN_DISABLED")
	self:AddEventListener("MINIMAP_ZONE_CHANGED")
	self:AddEventListener("ZONE_CHANGED_NEW_AREA")
	self:AddEventListener("CVAR_UPDATE")
	initMeOnce()
	self:ZONE_CHANGED_NEW_AREA()
end

function Cartographer_Waypoints:OnDisable()
	Rock("LibGuild-1.0").UnregisterAll(self)
	-- All hooks, timers and events are automatically disabled
	if waypointFrame then
	   waypointFrame:Hide()
	end
end

function Cartographer_Waypoints:PLAYER_ALIVE() -- We're locked, loaded, dead and not in a battleground
	if CorpsePoint and self.db.profile.corpsePoint and UnitIsDeadOrGhost("player")
            and select(2, IsInInstance()) ~= "pvp" and not IsActiveBattlefieldArena() then
		self:PLAYER_UNGHOST()
		local waypoint = CorpsePoint:new()
		PushQueue(waypoint)
		if not waypointFrame then
			createWaypointFrame()
		end
		self:AddRepeatingTimer("CartographerWaypoints-UpdateWaypoint", 0.05, "UpdateWaypoint")
	end
end

function Cartographer_Waypoints:PLAYER_UNGHOST()
	if #Queue > 0 then
		for i,v in ipairs(Queue) do
			if v.Corpse then
				v:Cancel()
			end
		end
	end
end

function Cartographer_Waypoints:ZONE_CHANGED_NEW_AREA()
	if #Queue  > 0 then
		self:AddRepeatingTimer("CartographerWaypoints-UpdateWaypoint", 0.05, "UpdateWaypoint")
	end
	self:MINIMAP_ZONE_CHANGED()
end

function Cartographer_Waypoints:PLAYER_REGEN_DISABLED() -- We've entered combat
	if waypointFrame and self.db.profile.locked then -- If we've locked the waypointframe
		waypointFrame:EnableMouse(false)
	end
end


function Cartographer_Waypoints:PLAYER_REGEN_ENABLED() -- We've left combat
	if waypointFrame and self.db.profile.locked then -- If we've locked the waypointframe
		waypointFrame:EnableMouse(true)
	end
end

function Cartographer_Waypoints:GetWaypoint()
	if #Queue > 0 and Queue[1] then
		local waypointNote= Queue[1]
		return waypointNote.Zone, waypointNote.x, waypointNote.y
	else
		return nil
	end
end

function Cartographer_Waypoints:IsNoteWaypoint(id)
	AceLibrary.argCheck(self, id, 2, "string")
	if #Queue > 0 then
		for i,v in ipairs(Queue) do
			if v.MatchNote and v:MatchNote(id) then
				return true
			end
		end
	end
	return false
end

function Cartographer_Waypoints:SetNoteAsWaypoint(zone, id)
	if not Cartographer:IsModuleActive(self) and self.db then
		return
	end
	PushQueue(NotePoint:new(zone, id))
	if not waypointFrame then
		createWaypointFrame()
	end
    if(#Queue == 1) then
        self:Cartographer_MapClosed()
    end
end

function Cartographer_Waypoints:SetPointAsWaypoint(x, y)
	if not Cartographer:IsModuleActive(self) and self.db then
		return
	end
	local zone = select(GetCurrentMapZone(), GetMapZones(GetCurrentMapContinent()))
	self:AddWaypoint(NotePoint:new(zone, x, y, "Waypoint"))
end

function Cartographer_Waypoints:AddLHWaypoint(c, z, x, y, desc)
	if not Cartographer:IsModuleActive(self) and self.db then
		return
	end
    local zone = select(z or GetCurrentMapZone(), GetMapZones(c or GetCurrentMapContinent()))
    self:AddWaypoint(NotePoint:new(zone, x/100, y/100, desc))
end

function Cartographer_Waypoints:AddRoutesWaypoint(z, id, desc)
	if not Cartographer:IsModuleActive(self) and self.db then
		return
	end
	local x, y = getXY(id)
	self:AddWaypoint(NotePoint:new(z, x, y, desc))
end

function Cartographer_Waypoints:AddWaypoint(waypoint)
	if not Cartographer:IsModuleActive(self) and self.db then
		return
	end
	PushQueue(waypoint)

	local showOnMap = waypoint.ShowOnMap
	if type(showOnMap) == "function" then
		showOnMap = showOnMap(waypoint)
	end
	if showOnMap and self.db.profile.minimapShow then
		waypoint:AddToMap()
	end
	if not waypointFrame then
		createWaypointFrame()
	end
    if(#Queue == 1) then
        self:Cartographer_MapClosed()
    end
end

local hasCart3 = false
do
	local _, _, _, enabled = GetAddOnInfo("Cartographer3")
	if enabled or IsAddOnLoaded("Cartographer3") then
		hasCart3 = true
	end
end

if not hasCart3 then
	function _G.SetWaypoint(...)
		if not Cartographer:IsModuleActive(self) and self.db then
			return
		end
		
		local first = (...)
		local zoneName, x, y, text, metadata
		if type(first) == "number" then
			local continentID, zoneID
			continentID, zoneID, x, y, text, metadata = ...
			zoneName = select(zoneID, GetMapZones(continentID))
		else
			local zone
			zone, x, y, text, metadata = ...
			zoneName = Tourist:GetZoneFromTexture(zone)
		end
	
		local wp = Waypoint:new(text or '')
		wp.x = x
		wp.y = y
		wp.Zone = zoneName
		wp.metadata = metadata
		Cartographer_Waypoints:AddWaypoint(wp)
	end

	function _G.GetWaypoint()
		if not Cartographer:IsModuleActive(self) and self.db then
			return
		end
		if #Queue >= 1 then
			return Queue[1].metadata
		end
	end

	function _G.ClearWaypoint()
		if not Cartographer:IsModuleActive(self) and self.db then
			return
		end
	
		for i = #Queue, 1, -1 do
			Queue[i]:Cancel()
		end
	end
end

function Cartographer_Waypoints:CancelWaypoint(id)
	if not Cartographer:IsModuleActive(self) and self.db then
		return
	end
	if #Queue > 0 then
		for i=1,#Queue do
			if Queue[i].WaypointID == id then
				Queue[i]:Cancel()
			end
		end
	end
	Cartographer_Notes:RefreshMap()
end

function Cartographer_Waypoints:Cartographer_MapOpened()
	if Queue[1] then
		self:RemoveTimer("CartographerWaypoints-UpdateWaypoint")
		waypointFrame.dist:SetText("-")
	end
end
function Cartographer_Waypoints:Cartographer_MapClosed()
	if Queue[1] then
		self:AddRepeatingTimer("CartographerWaypoints-UpdateWaypoint", 0.05, "UpdateWaypoint")
	end
end

local waypointHitDistance = 5
function Cartographer_Waypoints:GetWaypointHitDistance()
	return waypointHitDistance
end

function Cartographer_Waypoints:SetWaypointHitDistance(v)
	if v >= 5 then -- limit to a minimum of 5 yards
		waypointHitDistance = v
	end
end

local _54_div_math_pi = 54/math.pi
local math_rad_90 = math.rad(90)
local math_atan2 = math.atan2
local math_floor = math.floor
local math_cos = math.cos
local count = 53
local i = 0
local rotateMinimap = GetCVar("rotateMinimap") == "1"
function Cartographer_Waypoints:UpdateWaypoint()
	local realZoneText = GetRealZoneText()
	local px, py = Cartographer:GetCurrentPlayerPosition()
	if px==nil then return end		-- Sinus: GetCurrentPlayerPosition() sometimes erroneously returns nil several times upon login, killing valid waypoints set up immediately at login time. It's better to ignore waypoints if player position seems bogus.
	local waypoint = #Queue and Queue[1] or nil

	if BZR[realZoneText] then
		realZoneText = BZR[realZoneText]
	end

	if not waypoint then
		self:RemoveTimer("CartographerWaypoints-UpdateWaypoint")
		waypointFrame:Hide()
		return
	end

	if BZR[waypoint.Zone] then
		waypoint.Zone = BZR[waypoint.Zone]
	end

	if not waypoint:IsValid() then
		self:Print(L["Clearing up queue"])
		PopQueue():Cancel()
		waypoint = Queue[1]
		return
	end

	if not waypointFrame then
		return
	end

	if not waypointFrame:IsShown() then
		waypointFrame:Show()
	end

	local dist = waypoint:GetDistance()
	if not dist then
		dist = 0
	end
	if dist <= waypointHitDistance and waypoint:IsReady() then
		--self:Print("Waypoint hit")
		PopQueue() -- Don't call :Cancel() here because we are passing the waypoint in the event triggers
		self:DispatchEvent("WaypointHit",waypoint)
		local AceEvent = Rock("AceEvent-2.0", true, true)
		if AceEvent then
			AceEvent:TriggerEvent("CartographerWaypoints_WaypointHit",waypoint)
		end
		local AceEvent3 = LibStub:GetLibrary("AceEvent-3.0", true)
		if AceEvent3 then
			AceEvent3:SendMessage("CartographerWaypoints_WaypointHit",waypoint)
		end
		waypoint:Cancel()
		return
	end

	if dist <=10 then
		if not waypointFrame.up then
            waypointFrame.tex:SetTexture(nil)
			waypointFrame.tex:SetTexture(path .."-UP")
			if not waypointFrame.tex:GetTexture() then
				waypointFrame.tex:SetTexture(altpath .."-UP")
			end
			waypointFrame.tex:SetWidth(53)
			waypointFrame.tex:SetHeight(70)
			waypointFrame.up = true
		end
	else
		if waypointFrame.up then
            waypointFrame.tex:SetTexture(nil)
			waypointFrame.tex:SetTexture(path)
			if not waypointFrame.tex:GetTexture() then
				waypointFrame.tex:SetTexture(altpath)
			end
			waypointFrame.tex:SetWidth(56)
			waypointFrame.tex:SetHeight(42)
			waypointFrame.up = false
		end
	end
	local x,y = Tourist:TransposeZoneCoordinate(waypoint.x, waypoint.y, waypoint.Zone, realZoneText)

	local rad
	if waypoint:IsReady() and x and y then
		if not waypointFrame.up then
			local diffX, diffY = x - (px or 0), y - (py or 0)
			rad = -math_atan2(diffY*2/3, diffX)
			local direction = GetPlayerFacing() + math_rad_90
			local val = ((rad - direction)*_54_div_math_pi + 108) % 108
			local col, row = math_floor(val % 9), math_floor(val / 9)
			waypointFrame.tex:SetTexCoord(col*56/512, (col+1)*56/512, row*42/512, (row+1)*42/512)
		else
			count = count + 1
			if count == 54 then
				count = 0
			end
			local col, row = math_floor(count % 9), math_floor(count / 9)
			waypointFrame.tex:SetTexCoord(col*53/512, (col+1)*53/512, row*70/512, (row+1)*70/512)
		end
		waypointFrame.tex:SetVertexColor(Crayon:GetThresholdColorTrivial(dist, 1000, 300, 100, 30, 0))
	else
		waypointFrame.tex:SetTexCoord(0, 0, 0, 0)
		waypointFrame.tex:SetVertexColor(Crayon.COLOR_HEX_SILVER)
	end
	waypointFrame.dist:SetText(yardString:format(dist))
	waypointFrame.title:SetText(waypoint:ToString())
	if i == 0 then
		if rad then
			if not self:HasTimer("CWUpdateVelocity") then
				self:AddRepeatingTimer("CWUpdateVelocity", 0.1, "OnUpdate")
			end
			local speed, angle = self:GetCurrentVelocity()
			local disparity = math_cos(angle - rad)
			if disparity < 0 then
				disparity = 0
			end
			local time = dist / speed / disparity
			waypointFrame.tta:SetText(Abacus:FormatDurationShort(time, false, true))
		else
			self:RemoveTimer("CWUpdateVelocity")
			waypointFrame.tta:SetText("")
		end
	end
	i = (i + 1) % 10
end

function Cartographer_Waypoints:OnProfileEnable()
	if waypointFrame then
		waypointFrame:SetPoint("CENTER", UIParent, "CENTER", self.db.profile.x or 0, self.db.profile.y or 0)
	end
end


Cartographer_Waypoints.OnCommReceive = {
	POSITION = function(self, prefix, distribution, sender, zone, _x, _y)
		if(GuildPoint.Watcher[sender] and #Queue > 0 and Queue[1].WaypointID == sender) then
			GuildPoint.Watcher[sender]:UpdateLocation(zone, _x, _y)
		end
	end
}

function Cartographer_Waypoints:LibGuild_Disconnected(event, memberName)
	if GuildPoint.Watcher[memberName] then
		GuildPoint.Watcher[memberName]:Cancel()
	end
end

function Cartographer_Waypoints:RosterLib_UnitChanged(...)
	if select(6,...)[1] and select(1, ...)[1] then
		local party = PartyPoint.Roster[select(6, ...)]
		PartyPoint.Roster[select(1, ...)] = party
		party.PartyID = select(1, ...)
	end

	if not select(1, ...) then
		PartyPoint.Roster[select(6, ...)]:Cancel();
	end
end

local currentYardWidth = 1000
function Cartographer_Waypoints:MINIMAP_ZONE_CHANGED()
	if not WorldMapFrame:IsShown() then
		SetMapToCurrentZone()
	end
	currentYardWidth = Tourist:GetZoneYardSize(GetRealZoneText())
	if not currentYardWidth then
		currentYardWidth = 1000
	end
end

local speed, direction = 0, 0
do
	local last_x, last_y, last_zone, last_time
	local GetTime = GetTime
	local math_atan2 = math.atan2
	function Cartographer_Waypoints:OnUpdate()
		local x, y, zone = Cartographer:GetCurrentPlayerPosition()
		if not x then
			return
		end
		if not last_x then
			last_x, last_y, last_zone = x, y, zone
			last_time = GetTime()
		end
		local time = GetTime()
		if zone ~= last_zone then
			last_x, last_y, last_zone, last_time = x, y, zone, time
			return
		end
		local d_x = x - last_x
		local d_y = (last_y - y)*2/3
		local d_t = time - last_time
		local dist = (d_x*d_x + d_y*d_y)^0.5 * currentYardWidth
		speed = dist / d_t
		direction = math_atan2(d_y, d_x)
		last_x, last_y, last_zone, last_time = x, y, zone, time
	end
end

function Cartographer_Waypoints:GetCurrentVelocity()
	return speed, direction
end

function Cartographer_Waypoints:CVAR_UPDATE(caller, event, cvar, value)
	if cvar == "ROTATE_MINIMAP" then
		rotateMinimap = value == "1"
	end
end

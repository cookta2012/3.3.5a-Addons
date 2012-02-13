assert(Cartographer, "Cartographer not found!")
local Cartographer = Cartographer
local revision = tonumber(("$Revision: 2312 $"):sub(12, -3))
if revision > Cartographer.revision then
	Cartographer.version = "r" .. revision
	Cartographer.revision = revision
	Cartographer.date = ("$Date: 2009-04-15 07:40:25 +0000 (Wed, 15 Apr 2009) $"):sub(8, 17)
end

local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer-Notes")

L:AddTranslations("enUS", function() return {
	["Notes"] = true,
	["Module which allows you to put notes on the map."] = true,
	["Hint: /note is available to create notes with the command line."] = true,

	["White"] = true,
	["Gray"] = true,
	["Red"] = true,
	["Pink"] = true,
	["Yellow"] = true,
	["Orange"] = true,
	["Green"] = true,
	["Lime"] = true,
	["Blue"] = true,
	["Pale blue"] = true,
	["Cyan"] = true,
	["Purple"] = true,

	["Unknown"] = true,
	["Custom icon"] = true,

	["Create a new note"] = true,
	["Create a new note for %q"] = true,
	["New note"] = true,
	["Delete note"] = true,
	["Edit note"] = true,
	["Send note"] = true,
	["Send to party"] = true,
	["Send to raid"] = true,
	["Send to guild"] = true,
	["Send to player"] = true,
	["Send to group"] = true,

	["Note: This may be blocked by Blizzard's spam filter and cause problems. It is recommended to send to your party/raid/guild instead."] = true,

	["X position"] = true,
	["Y position"] = true,
	["Title"] = true,
	["Info line 1 (optional)"] = true,
	["Info line 2 (optional)"] = true,
	["Creator (optional)"] = true,

	["Ctrl-Right-Click on map to add a note"] = true,

	["%s from Guild"] = true,
	["%s from Raid"] = true,
	["%s from Party"] = true,

	["Unknown zone: %q"] = true,
	["Error: %s sent you a note with an unknown zone: %q"] = true,
	["Error: %s sent you a note at %q : %.2f, %.2f with the title %q created by %q, but you already have a note at this location."] = true,
	["%s sent you a note at %q : %.2f, %.2f with the title %q created by %q."] = true,

	["Created by"] = true,

	["Show note creator"] = true,
	["Show the `Created By:' line in notes"] = true,

	["Icon size"] = true,
	["Size of the icons on the map"] = true,

	["Show minimap icons"] = true,
	["Show icons on the minimap"] = true,

	["Minimap icon size"] = true,
	["Size of the icons on the minimap"] = true,

	["Max minimap icons per database"] = true,
	["The maximum amount of minimap icons to show per database"] = true,

	["Console-note-commands"] = { "/note", "/addnote" },
	["Usage: /note <0-100> <0-100> [title]"] = true,

	["Show chat notifications"] = true,
	["Show notification in the chat window"] = true,
	-- Note cleanup localizations
	["Clear all notes on map"] = true,
	["This will remove all notes on the map. This can't be undone are your sure?"] = true,
	["This will clear all notes on map"] = true,

	["Clear waypoint"] = true,
	["Set as waypoint"] = true,

	["all"] = true,
	["Note reception active"] = true,
	["Enabling this will allow notes to be sent and received."] = true,

	["Note sent by %s ignored due to filtering settings."] = true,
	["Incoming note filtering"] = true,
	["Setup filtering of note sent to you by other players."] = true,
	["Accept all notes"] = true,
	["Accept only handmade notes"] = true,
	["Reject all notes"] = true,

	["%.0f yd"] = true,
	["%.0f m"] = true,

	["Console-quick-note-commands"] = { "/qnote", "/quicknote" },
	["Unable to find your location."] = true,
    
    ["Ammunition"] = true,
    ["Auctioneer"] = true,
    ["Banker"] = true,
    ["BattleMaster"] = true,
    ["Class"] = true,
    ["FlightMaster"] = true,
    ["Food"] = true,
    ["Innkeeper"] = true,
    ["Mailbox"] = true,
    ["Poisons"] = true,
    ["Profession"] = true,
    ["Reagents"] = true,
    ["Repair"] = true,
    ["StableMaster"] = true,
} end)

L:AddTranslations("koKR", function() return {
	["Notes"] = "노트",
	["Module which allows you to put notes on the map."] = "지도에 노트를 작성합니다.",
	["Hint: /note is available to create notes with the command line."] = "도움말: 명령어로 신규 노트를 만드는데 '/note'를 이용하세요.",

	["White"] = "흰색",
	["Gray"] = "회색",
	["Red"] = "빨강색",
	["Pink"] = "분홍색",
	["Yellow"] = "노랑색",
	["Orange"] = "주황색",
	["Green"] = "녹색",
	["Lime"] = "라임색",
	["Blue"] = "파랑색",
	["Pale blue"] = "연한 파랑색",
	["Cyan"] = "청색",
	["Purple"] = "심홍색",

	["Unknown"] = "알수없음",
	["Custom icon"] = "사용자 아이콘",

	["Create a new note"] = "노트 작성",
	["Create a new note for %q"] = "새로운 노트 작성 %q",
	["New note"] = "신규 노트",
	["Delete note"] = "노트 삭제",
	["Edit note"] = "노트 편집",
	["Send note"] = "노트 발송",
	["Send to party"] = "파티에 보냄",
	["Send to raid"] = "공격대에 보냄",
	["Send to guild"] = "길드에 보냄",
	["Send to player"] = "플레이어에게 보냄",

	["Note: This may be blocked by Blizzard's spam filter and cause problems. It is recommended to send to your party/raid/guild instead."] = "노트: 이것은 블리자드의 스팸 필터 기능에 의해 문제가 발생할 수 있습니다. 당신의 파티/공격대/길드에 보내는걸 권장합니다.",

	["X position"] = "X 위치",
	["Y position"] = "Y 위치",
	["Title"] = "제목",
	["Info line 1 (optional)"] = "정보 라인 1 (선택)",
	["Info line 2 (optional)"] = "정보 라인 2 (선택)",
	["Creator (optional)"] = "신규 (선택)",

	["Ctrl-Right-Click on map to add a note"] = "Ctrl-오른쪽-클릭 : 맵 노트 추가",

	["%s from Guild"] = "길드로부터 %s 받음",
	["%s from Raid"] = "공격대로부터 %s 받음",
	["%s from Party"] = "파티로부터 %s 받음",

	["Unknown zone: %q"] = "알 수 없는 지역: %q",
	["Error: %s sent you a note with an unknown zone: %q"] = "오류: %s|1이;가; 알려지지 않은 지역 노트를 보냈습니다: %q",
	["Error: %s sent you a note at %q : %.2f, %.2f with the title %q created by %q, but you already have a note at this location."] = "오류: %s|1이;가; 보낸 %q : %.2f, %.2f (%q - 제작자 : %q) 노크가 이미 존재합니다.",
	["%s sent you a note at %q : %.2f, %.2f with the title %q created by %q."] = "%s|1이;가; 보낸 %q : %.2f, %.2f (%q - 제작자 : %q) 노트를 받았습니다.",

	["Created by"] = "작성자",

	["Show note creator"] = "작성자 보기",
	["Show the `Created By:' line in notes"] = "노트에 '작성자:' 를 표시합니다.",

	["Icon size"] = "아이콘 크기",
	["Size of the icons on the map"] = "노트의 아이콘 크기를 변경합니다.",

	["Show minimap icons"] = "미니맵 아이콘 표시",
	["Show icons on the minimap"] = "미니맵에 아이콘을 표시합니다.",

	["Minimap icon size"] = "미니맵 아이콘 크기",
	["Size of the icons on the minimap"] = "미니맵의 아이콘 크기를 변경합니다.",

	["Max minimap icons per database"] = "미니맵 아이콘 수",
	["The maximum amount of minimap icons to show per database"] = "데이터베이스당 표시할 최대 미니맵 아이콘 숫자를 변경합니다.",

--	["Console-note-commands"] = { "/note", "/addnote", "/tloc" },
--	["Usage: /note <0-100> <0-100> [title]"] = true,

	["Show chat notifications"] = "대화창 통보 표시",
	["Show notification in the chat window"] = "대화창에 통보를 표시하여줍니다.",
	-- Note cleanup localizations
	["Clear all notes on map"] = "모든 노트 메모 지움",
	["This will remove all notes on the map. This can't be undone are your sure?"] = "지도 위의 모든 노트를 삭제합니다. 이것은 원상태로 복구할 수 없습니다?",
	["This will clear all notes on map"] = "지도 위의 모든 노트를 지웁니다.",

	["Clear waypoint"] = "위치 포인트 삭제",
	["Set as waypoint"] = "위치 포인트 지정",
	["all"] = "모두",
	["Note reception active"] = "노트 받기 사용",
	["Enabling this will allow notes to be sent and received."] = "노트를 주고 받는 것을 허용합니다.",

	["Note sent by %s ignored due to filtering settings."] = "%s|1으로;로; 부터 받은 노트가 필터링 설정으로 인해 무시되었습니다.",
	["Incoming note filtering"] = "받는 노트 필터링",
	["Setup filtering of note sent to you by other players."] = "다른 플레이어로 부터 받는 노트의 필터링을 설정합니다.",
	["Accept all notes"] = "모든 노트 허용",
	["Accept only handmade notes"] = "직접 만든 노트만 허용",
	["Reject all notes"] = "모든 노트 거절",

	["%.0f yd"] = "%.0f yd",
	["%.0f m"] = "%.0f 미터",

    ["Ammunition"] = "탄약 상인",
    ["Auctioneer"] = "경매인",
    ["Banker"] = "은행원",
    ["BattleMaster"] = "전투모병관",
    ["Class"] = "직업 상급자",
    ["FlightMaster"] = "비행 조련사",
    ["Food"] = "음식과 음료",
    ["Innkeeper"] = "여관 주인",
    ["Mailbox"] = "우체통",
    ["Poisons"] = "독약 상인",
    ["Profession"] = "기술 전문가",
    ["Reagents"] = "마법 재료 상인",
    ["Repair"] = "장비 수리",
    ["StableMaster"] = "전문 기수",
} end)

L:AddTranslations("deDE", function() return {
	["Notes"] = "Notizen",
	["Module which allows you to put notes on the map."] = "Modul zur Erstellung von Notizen auf der Karte.",
	["Hint: /note is available to create notes with the command line."] = "Hinweis: Verwendet /note zur Erzeugung von Notizen auf der Eingabezeile.",

	["White"] = "Weiß",
	["Gray"] = "Grau",
	["Red"] = "Rot",
	["Pink"] = "Pink",
	["Yellow"] = "Gelb",
	["Orange"] = "Orange",
	["Green"] = "Grün",
	["Lime"] = "Kalk",
	["Blue"] = "Blau",
	["Pale blue"] = "Hellblau",
	["Cyan"] = "Türkis",
	["Purple"] = "Violett",

	["Unknown"] = "Unbekannt",
	["Custom icon"] = "Benutzerdefiniertes Symbol",

	["Create a new note"] = "Neue Notiz erstellen",
	["Create a new note for %q"] = "Erstelle neue Notiz für %q",
	["New note"] = "Neue Notiz",
	["Delete note"] = "Notiz löschen",
	["Edit note"] = "Notiz bearbeiten",
	["Send note"] = "Notiz senden",
	["Send to party"] = "An Gruppe senden",
	["Send to raid"] = "An Schlachtzug senden",
	["Send to guild"] = "An Gilde senden",
	["Send to player"] = "An Spieler senden",

	["Note: This may be blocked by Blizzard's spam filter and cause problems. It is recommended to send to your party/raid/guild instead."] = "Hinweis: Dies könnte durch Blizzards Spamfilter blockiert werden und Probleme verursachen. Es ist stattdessen zu empfehlen, nur an Gruppe, Schlachtzug oder Gilde zu senden.",

	["X position"] = "X-Position",
	["Y position"] = "Y-Position",
	["Title"] = "Titel",
	["Info line 1 (optional)"] = "Infozeile 1 (optional)",
	["Info line 2 (optional)"] = "Infozeile 2 (optional)",
	["Creator (optional)"] = "Ersteller (optional)",

	["Ctrl-Right-Click on map to add a note"] = "Strg-Rechtsklick auf die Karte f\195\188gt eine Notiz ein",

	["%s from Guild"] = "%s von Gilde",
	["%s from Raid"] = "%s von Schlachtgruppe",
	["%s from Party"] = "%s von Gruppe",

--	["Unknown zone: %q"] = true,
	["Error: %s sent you a note with an unknown zone: %q"] = "Fehler: %s sandte Euch eine Notiz für ein unbekanntes Gebiet: %q",
	["Error: %s sent you a note at %q : %.2f, %.2f with the title %q created by %q, but you already have a note at this location."] = "Fehler: %s sandte Euch eine Notiz an Position %q : %.2f, %.2f mit dem Titel %q erstellt von %q, aber Ihr habt bereits eine Notiz an dieser Position.",
	["%s sent you a note at %q : %.2f, %.2f with the title %q created by %q."] = "%s sandte Euch eine Notiz bei %q : %.2f, %.2f mit dem Titel %q erstellt von %q.",

	["Created by"] = "Erstellt von",

	["Show note creator"] = "Notizersteller anzeigen",
	["Show the `Created By:' line in notes"] = "Zeigt die Zeile 'Erstellt von:' in den Notizen.",

	["Icon size"] = "Symbolgröße auf der Weltkarte",
	["Size of the icons on the map"] = "Größe der Symbole auf der Weltkarte.",

	["Show minimap icons"] = "Zeige Minimap-Symbole",
	["Show icons on the minimap"] = "Symbole auf der Minimap anzeigen.",

	["Minimap icon size"] = "Symbolgröße auf der Minimap",
	["Size of the icons on the minimap"] = "Größe der Symbole auf der Minimap.",

	["Max minimap icons per database"] = "Maximalzahl an Symbolen pro Datenbank",
	["The maximum amount of minimap icons to show per database"] = "Die Maximalzahl an Minimap-Symbolen, die pro Datenbank angezeigt werden.",

	["Console-note-commands"] = { "/note", "/addnote", "/tloc" },
	["Usage: /note <0-100> <0-100> [title]"] = "Benutzung: /note <0-100> <0-100> [titel]",

	["Show chat notifications"] = "Zeige Chatbenachrichtigung",
	["Show notification in the chat window"] = "Zeige Benachrichtigungen \195\188ber empfangene Notizen im Chatfenster.",
	-- Note cleanup localizations
	["Clear all notes on map"] = "Entferne alle Notizen von der Karte",
	["This will remove all notes on the map. This can't be undone are your sure?"] = "Dies wird alle Notizen von der Karte entfernen. Dies kann NICHT rückgängig gemacht werden. Seid ihr sicher dass ihr dies wollt?",
	["This will clear all notes on map"] = "Dies wird alle Notizen von der Karte entfernen.",

	["Clear waypoint"] = "Zielmarkierung löschen",
	["Set as waypoint"] = "Als Zielmarkierung setzen",

--	["all"] = true,
	["Note reception active"] = "Empfang von Notizen aktivieren",
	["Enabling this will allow notes to be sent and received."] = "Aktiviert den Empfang und den Versand von Notizen.",

	["Note sent by %s ignored due to filtering settings."] = "Eine von %s gesendete Notiz wurde aufgrund von Filtereinstellungen verworfen.",
	["Incoming note filtering"] = "Eingehende Notizen filtern",
	["Setup filtering of note sent to you by other players."] = "Einrichten von Filtern für Notizen, die Euch andere Spieler senden.",
	["Accept all notes"] = "Alle Notizen annehmen",
	["Accept only handmade notes"] = "Nur von Hand erstellte Notizen annehmen",
	["Reject all notes"] = "Alle Notizen ablehnen",
} end)

L:AddTranslations("frFR", function() return {
	["Notes"] = "Notes",
	["Module which allows you to put notes on the map."] = "Module permettant l'ajout de notes sur la carte.",
	["Hint: /note is available to create notes with the command line."] = "Astuce : la commande /note est un autre moyen de créer des notes avec la ligne de commande.",

	["White"] = "Blanc",
	["Gray"] = "Gris",
	["Red"] = "Rouge",
	["Pink"] = "Rose",
	["Yellow"] = "Jaune",
	["Orange"] = "Orange",
	["Green"] = "Vert",
	["Lime"] = "Jaune citron",
	["Blue"] = "Bleu",
	["Pale blue"] = "Bleu pâle",
	["Cyan"] = "Cyan",
	["Purple"] = "Violet",

	["Unknown"] = "Inconnu",
	["Custom icon"] = "Icône perso",

	["Create a new note"] = "Créer une nouvelle note",
	["Create a new note for %q"] = "Créer une nouvelle note pour %q",
	["New note"] = "Nouvelle note",
	["Delete note"] = "Supprimer la note",
	["Edit note"] = "Éditer la note",
	["Send note"] = "Envoyer la note",
	["Send to party"] = "Envoyer au groupe",
	["Send to raid"] = "Envoyer au raid",
	["Send to guild"] = "Envoyer à la guilde",
	["Send to player"] = "Envoyer au joueur",

	["Note: This may be blocked by Blizzard's spam filter and cause problems. It is recommended to send to your party/raid/guild instead."] = "Note : Ceci risque d'être bloqué par le filtre anti-spam de Blizzard et de poser problème. Il est recommandé d'envoyer vers votre groupe/raid/guilde à la place.",

	["X position"] = "Position X",
	["Y position"] = "Position Y",
	["Title"] = "Titre",
	["Info line 1 (optional)"] = "Ligne d'infos 1 (optionnel)",
	["Info line 2 (optional)"] = "Ligne d'infos 2 (optionnel)",
	["Creator (optional)"] = "Créateur (optionnel)",

	["Ctrl-Right-Click on map to add a note"] = "Ctrl-clic-droit sur la carte pour ajouter une note",

	["%s from Guild"] = "%s du canal Guilde",
	["%s from Raid"] = "%s du canal Raid",
	["%s from Party"] = "%s du canal Groupe",

	["Unknown zone: %q"] = "Zone inconnue : %q",
	["Error: %s sent you a note with an unknown zone: %q"] = "Erreur : %s vous a envoyé une note d'une zone inconnue : %q",
	["Error: %s sent you a note at %q : %.2f, %.2f with the title %q created by %q, but you already have a note at this location."] = "Erreur : %s vous a envoyé une note à %q : %.2f, %.2f avec le titre %q et créée par %q, mais vous avez déjà une note à cet endroit.",
	["%s sent you a note at %q : %.2f, %.2f with the title %q created by %q."] = "%s vous a envoyé une note à %q : %.2f, %.2f avec le titre %q et créée par %q.",

	["Created by"] = "Créée par",

	["Show note creator"] = "Afficher le créateur de la note",
	["Show the `Created By:' line in notes"] = "Affiche la ligne 'Créée par :  sur les notes.",

	["Icon size"] = "Taille des icônes",
	["Size of the icons on the map"] = "Détermine la taille des icônes sur la carte.",

	["Show minimap icons"] = "Afficher les icônes de la minicarte",
	["Show icons on the minimap"] = "Affiche les icônes sur la minicarte.",

	["Minimap icon size"] = "Taille des icônes de la minicarte",
	["Size of the icons on the minimap"] = "Détermine la taille des icônes de la minicarte.",

	["Max minimap icons per database"] = "Icônes minicarte max. par base de données",
	["The maximum amount of minimap icons to show per database"] = "Détermine le nombre maximal d'icônes à afficher sur la minicarte par base de données.",

	["Console-note-commands"] = { "/note", "/addnote", "/tloc" },
	["Usage: /note <0-100> <0-100> [title]"] = "Utilisation : /note <0-100> <0-100> [titre]",

	["Show chat notifications"] = "Afficher les notifications de réception",
	["Show notification in the chat window"] = "Affiche les notifications de réception de notes dans la fenêtre de discussion.",

	["Clear all notes on map"] = "Effacer toutes les notes de la carte",
	["This will remove all notes on the map. This can't be undone are your sure?"] = "Ceci supprimera toutes les notes de la carte et est irréversible. Êtes-vous sûr ?",
	["This will clear all notes on map"] = "Efface toutes les notes apposées sur la carte.",

	["Clear waypoint"] = "Effacer le point de navigation",
	["Set as waypoint"] = "Définir comme point de navigation",

	["all"] = "tous",
	["Note reception active"] = "Autoriser l'envoi/réception de notes",
	["Enabling this will allow notes to be sent and received."] = "Décocher cette option pour empêcher tout envoi ou réception de notes.",

	["Note sent by %s ignored due to filtering settings."] = "Note envoyée par %s ignorée suite aux paramètres de filtrage.",
	["Incoming note filtering"] = "Filtration des notes entrantes",
	["Setup filtering of note sent to you by other players."] = "Configure la filtration des notes envoyées par les autres joueurs.",
	["Accept all notes"] = "Accepter toutes les notes",
	["Accept only handmade notes"] = "Accepter uniquement les notes non générées automatiquement",
	["Reject all notes"] = "Rejeter toutes les notes",
} end)

L:AddTranslations("esES", function() return {
	["Notes"] = "Notas",
	["Module which allows you to put notes on the map."] = "M\195\179dulo que te permite poner notas en el mapa",
	["Hint: /note is available to create notes with the command line."] = "Consejo: /note est\195\161 disponible para crear notas con la l\195\173nea de comandos",

	["White"] = "Blanco",
	["Gray"] = "Gris",
	["Red"] = "Rojo",
	["Pink"] = "Rosa",
	["Yellow"] = "Amarillo",
	["Orange"] = "Naranja",
	["Green"] = "Verde",
	["Lime"] = "Lima",
	["Blue"] = "Azul",
	["Pale blue"] = "Azul cielo",
	["Cyan"] = "Ci\195\161n",
	["Purple"] = "P\195\186rpura",

	["Unknown"] = "Desconocido",
	["Custom icon"] = "Icono personalizado",

	["Create a new note"] = "Crear una nueva nota",
	["Create a new note for %q"] = "Crear una nueva nota para %q",
	["New note"] = "Nueva nota",
	["Delete note"] = "Eliminar nota",
	["Edit note"] = "Editar nota",
	["Send note"] = "Enviar nota",
	["Send to party"] = "Enviar al grupo",
	["Send to raid"] = "Enviar a la banda",
	["Send to guild"] = "Enviar a la hermandad",
	["Send to player"] = "Enviar a jugador",

	["Note: This may be blocked by Blizzard's spam filter and cause problems. It is recommended to send to your party/raid/guild instead."] = "Nota: Esto puede estar bloqueado por el filtro de spam de Blizzard y causar problemas. Es preferible enviarlo a tu grupo/banda/hermandad",

	["X position"] = "Posici\195\179n Horizontal",
	["Y position"] = "Posici\195\179n Vertical",
	["Title"] = "T\195\173tulo",
	["Info line 1 (optional)"] = "L\195\173nea de info 1 (opcional)",
	["Info line 2 (optional)"] = "L\195\173nea de info 2 (opcional)",
	["Creator (optional)"] = "Creador (opcional)",

	["Ctrl-Right-Click on map to add a note"] = "Ctrl+ClicDerecho en el mapa para a\195\177adir una nota",

	["%s from Guild"] = "%s de la Hermandad",
	["%s from Raid"] = "%s de la Banda",
	["%s from Party"] = "%s del Grupo",

	["Unknown zone: %q"] = "Zona desconocida: %q",
	["Error: %s sent you a note with an unknown zone: %q"] = "Error: %s te ha enviado una nota con una zona desconocida: %q",
	["Error: %s sent you a note at %q : %.2f, %.2f with the title %q created by %q, but you already have a note at this location."] = "Error: %s te ha enviado unanota en %q: %.2f, %.2f con el t\195\173tulo %q creada por %q, pero ya tienes otra nota en este lugar.",
	["%s sent you a note at %q : %.2f, %.2f with the title %q created by %q."] = "%s te ha enviado una note en %q : %.2f, %.2f con el t\195\173tulo %q creada por %q.",

	["Created by"] = "Creada por",

	["Show note creator"] = "Mostrar el creador de la nota",
	["Show the `Created By:' line in notes"] = "Muestra la l\195\173nea 'Creado por:' en las notas",

	["Icon size"] = "Tama\195\177o del icono",
	["Size of the icons on the map"] = "Tama\195\177o de los iconos en el mapa",

	["Show minimap icons"] = "Mostrar iconos del minimapa",
	["Show icons on the minimap"] = "Muestra los iconos en el minimapa",

	["Minimap icon size"] = "Tama\195\177o de iconos del minimapa",
	["Size of the icons on the minimap"] = "Tama\195\177o de los iconos en el minimapa",

	["Max minimap icons per database"] = "M\195\161x. de iconos de minimapa por base de datos",
	["The maximum amount of minimap icons to show per database"] = "La cantidad m\195\161xima de iconos en el minimapa a mostrar por base de datos",

	["Console-note-commands"] = { "/note", "/addnote", "/tloc" },
	["Usage: /note <0-100> <0-100> [title]"] = "Uso: /note <0-100> <0-100> [t\195\173tulo]",

	["Show chat notifications"] = "Mostrar notificaciones en chat",
	["Show notification in the chat window"] = "Muestra las notificaciones en la ventana de chat",
	-- Note cleanup localizations
	["Clear all notes on map"] = "Borrar todas las notas del mapa",
	["This will remove all notes on the map. This can't be undone are your sure?"] = "Esto eliminar\195\161 todas las notas del mapa. No se podr\195\161 deshacer, \194\191est\195\161s seguro?",
	["This will clear all notes on map"] = "Eliminar\195\161 todas las notas del mapa",

	["Clear waypoint"] = "Eliminar punto de ruta",
	["Set as waypoint"] = "Establecer como punto de ruta",

	["all"] = "todo",
	["Note reception active"] = "Recepción de notas activado",
	["Enabling this will allow notes to be sent and received."] = "Permite que se envíen y reciban notas.",

	["Note sent by %s ignored due to filtering settings."] = "La nota enviada por %s ha sido ignorada debido a los ajustes de filtrado",
	["Incoming note filtering"] = "Filtrado de nota entrante",
	["Setup filtering of note sent to you by other players."] = "Ajusta el filtrado de las notas que te env\195\173an otros jugadores",
	["Accept all notes"] = "Aceptar todas las notas",
	["Accept only handmade notes"] = "Aceptar solo las notas hechas a mano",
	["Reject all notes"] = "Rechazar todas las notas",


} end)

L:AddTranslations("zhTW", function() return {
	["Notes"] = "註記",
	["Module which allows you to put notes on the map."] = "讓你可以在地圖上做註記的模組。",
	["Hint: /note is available to create notes with the command line."] = "提示: 可以使用 /note 指令新增註記。",

	["White"] = "白色",
	["Gray"] = "灰色",
	["Red"] = "紅色",
	["Pink"] = "粉紅",
	["Yellow"] = "黃色",
	["Orange"] = "橙色",
	["Green"] = "綠色",
	["Lime"] = "石灰",
	["Blue"] = "藍色",
	["Pale blue"] = "淡藍",
	["Cyan"] = "靛青",
	["Purple"] = "紫色",

	["Unknown"] = "未知",
	["Custom icon"] = "自訂圖示",

	["Create a new note"] = "新增註記",
	["Create a new note for %q"] = "為「%s」新增註記",
	["New note"] = "新註記",
	["Delete note"] = "刪除註記",
	["Edit note"] = "編輯註記",
	["Send note"] = "傳送註記",
-- no use anymore	["Send to party"] = true,
-- no use anymore	["Send to raid"] = true,
	["Send to guild"] = "傳送到公會",
	["Send to player"] = "傳送到玩家",
	["Send to group"] = "傳送到團體",

	["Note: This may be blocked by Blizzard's spam filter and cause problems. It is recommended to send to your party/raid/guild instead."] = "註: 這有可能被 Blizzard 內建的過濾器擋掉並造成問題。建議你使用傳送到你的隊伍/團隊/公會來代替。",

	["X position"] = "X座標",
	["Y position"] = "Y座標",
	["Title"] = "標題",
	["Info line 1 (optional)"] = "訊息行1 (非必須)",
	["Info line 2 (optional)"] = "訊息行2 (非必須)",
	["Creator (optional)"] = "新增者 (非必須)",

	["Ctrl-Right-Click on map to add a note"] = "|cffeda55fCtrl-右擊: |r新增註記",

	["%s from Guild"] = "來自公會: %s",
	["%s from Raid"] = "來自團隊: %s",
	["%s from Party"] = "來自隊伍: %s",

	["Unknown zone: %q"] = "未知的地區: 「%s」",
	["Error: %s sent you a note with an unknown zone: %q"] = "錯誤: %s傳送給你一個未知地區「%s」的註記",
	["Error: %s sent you a note at %q : %.2f, %.2f with the title %q created by %q, but you already have a note at this location."] = "錯誤: %s傳送給你一個在「%s」: (%.2f，%.2f) 的註記，標題: 「%s」，新增者: 「%s」，但你在同樣位置已經有註記了。",
	["%s sent you a note at %q : %.2f, %.2f with the title %q created by %q."] = "%s傳送給你一個在「%s」: (%.2f，%.2f) 的註記，標題: 「%s」，新增者: 「%s」。",

	["Created by"] = "新增者:",

	["Show note creator"] = "顯示註記新增者",
	["Show the `Created By:' line in notes"] = "在註記中顯示「新增者:」",

	["Icon size"] = "圖示大小",
	["Size of the icons on the map"] = "顯示在地圖上的圖示大小",

	["Show minimap icons"] = "在小地圖上顯示",
	["Show icons on the minimap"] = "在小地圖上顯示圖示",

	["Minimap icon size"] = "小地圖上的圖示大小",
	["Size of the icons on the minimap"] = "小地圖圖示的大小",

	["Max minimap icons per database"] = "小地圖上的圖示容量",
	["The maximum amount of minimap icons to show per database"] = "每個資料庫內可以包含最多允許的小地圖圖示數目",

	["Console-note-commands"] = { "/note", "/addnote" },
	["Usage: /note <0-100> <0-100> [title]"] = "用法: /note <0-100> <0-100> [標題]",

	["Show chat notifications"] = "顯示聊天通知",
	["Show notification in the chat window"] = "在聊天視窗顯示通知",
	-- Note cleanup localizations
	["Clear all notes on map"] = "清除地圖上所有註記",
	["This will remove all notes on the map. This can't be undone are your sure?"] = "清除地圖上所有註記，此動作無法復原。你確定要清除?",
	["This will clear all notes on map"] = "清除地圖上所有註記",

	["Clear waypoint"] = "清除路徑點",
	["Set as waypoint"] = "設為路徑點",

	["all"] = "全部",
	["Note reception active"] = "開啟註記傳送/接收",
	["Enabling this will allow notes to be sent and received."] = "開啟後將允許註記傳送和接收。",

	["Note sent by %s ignored due to filtering settings."] = "%s傳送過來的註記被過濾掉了。",
	["Incoming note filtering"] = "註記接收過濾",
	["Setup filtering of note sent to you by other players."] = "設定過濾其他玩家傳送給你的註記。",
	["Accept all notes"] = "接受所有註記",
	["Accept only handmade notes"] = "只接受自定註記",
	["Reject all notes"] = "拒絶所有註記",

	["%.0f yd"] = "%.0f碼",
	["%.0f m"] = "%.0f米",

	["Console-quick-note-commands"] = { "/qnote", "/quicknote" },
	["Unable to find your location."] = "無法找到你的位置。",
} end)

L:AddTranslations("zhCN", function() return {
	["Notes"] = "注释",
	["Module which allows you to put notes on the map."] = "让你可以在地图上做注释。",
	["Hint: /note is available to create notes with the command line."] = "小窍门：可以使用 /note 命令来添加注释。",

	["White"] = "白色",
	["Gray"] = "灰色",
	["Red"] = "红色",
	["Pink"] = "粉红",
	["Yellow"] = "黄色",
	["Orange"] = "橙色",
	["Green"] = "绿色",
	["Lime"] = "灰白",
	["Blue"] = "蓝色",
	["Pale blue"] = "淡蓝",
	["Cyan"] = "青绿",
	["Purple"] = "紫色",

	["Unknown"] = "未知",
	["Custom icon"] = "自定义图标",

	["Create a new note"] = "新建注释",
	["Create a new note for %q"] = "为%q新建注释",
	["New note"] = "新注释",
	["Delete note"] = "删除注释",
	["Edit note"] = "编辑注释",
	["Send note"] = "发送注释",
	["Send to party"] = "发送到队伍",
	["Send to raid"] = "发送到团队",
	["Send to guild"] = "发送到公会",
	["Send to player"] = "发送到其他玩家",
	["Send to group"] = "发送到其他小组",


	["Note: This may be blocked by Blizzard's spam filter and cause problems. It is recommended to send to your party/raid/guild instead."] = "注：这有可能被暴雪内置的过滤器阻挡。建议你使用发送到队伍/团队/公会来代替该操作。",

	["X position"] = "X 坐标",
	["Y position"] = "Y 坐标",
	["Title"] = "标题",
	["Info line 1 (optional)"] = "信息1（可选）",
	["Info line 2 (optional)"] = "信息2（可选）",
	["Creator (optional)"] = "创建者（可选）",

	["Ctrl-Right-Click on map to add a note"] = "Ctrl-右键点击地图添加注释",

	["%s from Guild"] = "来自公会：%s",
	["%s from Raid"] = "来自团队：%s",
	["%s from Party"] = "来自队伍：%s",

	["Unknown zone: %q"] = "未知的区域：%q",
	["Error: %s sent you a note with an unknown zone: %q"] = "错误：%s发送给你一个未知地区(%q)的注释。",
	["Error: %s sent you a note at %q : %.2f, %.2f with the title %q created by %q, but you already have a note at this location."] = "错误：%s发送给你一个在%q：（%.2f，%.2f）的注释，标题：%q，创建者：%q，但你在同样的位置上已经有注释了。",
	["%s sent you a note at %q : %.2f, %.2f with the title %q created by %q."] = "%s发送给你一个在%q：（%.2f，%.2f）的注释，标题：%q，创接者：%q。",

	["Created by"] = "创建者：",

	["Show note creator"] = "显示注释的创建者",
	["Show the `Created By:' line in notes"] = "在注释中显示“创建者：”的标记。",

	["Icon size"] = "图标大小",
	["Size of the icons on the map"] = "显示在地图上的图标大小。",

	["Show minimap icons"] = "显示小地图图标",
	["Show icons on the minimap"] = "在小地图上显示图标。",

	["Minimap icon size"] = "小地图图标大小",
	["Size of the icons on the minimap"] = "在小地图上显示的图标大小。",

	["Max minimap icons per database"] = "每个数据库小地图图标显示数量",
	["The maximum amount of minimap icons to show per database"] = "每个数据库小地图图标显示数量。",

	["Console-note-commands"] = { "/note", "/addnote" },
	["Usage: /note <0-100> <0-100> [title]"] = "用法：/note <0-100> <0-100> [注释标题]",

	["Show chat notifications"] = "显示聊天通知",
	["Show notification in the chat window"] = "在聊天窗口中显示通知。",
	-- Note cleanup localizations
	["Clear all notes on map"] = "清除地图上所有的注释",
	["This will remove all notes on the map. This can't be undone are your sure?"] = "清除地图上所有的注释，次操作无法还原，你确定要清除？",
	["This will clear all notes on map"] = "将会清除地图上所有的注释！",

	["Clear waypoint"] = "清除路径点",
	["Set as waypoint"] = "设为路径点",

	["all"] = "全部",
	["Note reception active"] = "开启注释发送接收",
	["Enabling this will allow notes to be sent and received."] = "开启后将运行发送或接收注释。",

	["Note sent by %s ignored due to filtering settings."] = "%s传送过来的注释被过滤掉了。",
	["Incoming note filtering"] = "注释接收过滤",
	["Setup filtering of note sent to you by other players."] = "设置过滤其他玩家传过来的注释。",
	["Accept all notes"] = "接收所有注释",
	["Accept only handmade notes"] = "只接收自定义注释",
	["Reject all notes"] = "拒绝所有注释",

	["%.0f yd"] = "%.0f 码",
	["%.0f m"] = "%.0f 米",

	["Console-quick-note-commands"] = { "/qnote", "/quicknote" },
	["Unable to find your location."] = "无法识别你当前的坐标。",
} end)

-- Russian Translation by StingerSoft (Eritnull aka Шептун), fixed by Swix
L:AddTranslations("ruRU", function() return {
	["Notes"] = "Заметки",
	["Module which allows you to put notes on the map."] = "Модуль позволяет вам размещать заметки на карте.",
	["Hint: /note is available to create notes with the command line."] = "Совет: вы также можете создавать заметки с помощью команды /note.",

	["White"] = "Белый",
	["Gray"] = "Серый",
	["Red"] = "Красный",
	["Pink"] = "Розовый",
	["Yellow"] = "Жёлтый",
	["Orange"] = "Оранжевый",
	["Green"] = "Зелёный",
	["Lime"] = "Лайм",
	["Blue"] = "Синий",
	["Pale blue"] = "Бледно-голубой",
	["Cyan"] = "Голубой",
	["Purple"] = "Пурпурный",

	["Unknown"] = "Неизвестно",
	["Custom icon"] = "Пользовательская иконка",

	["Create a new note"] = "Создать новую заметку",
	["Create a new note for %q"] = "Создать новую заметку для %q",
	["New note"] = "Новая заметка",
	["Delete note"] = "Удалить заметку",
	["Edit note"] = "Править заметку",
	["Send note"] = "Поделиться заметкой",
	["Send to party"] = "Послать партии",
	["Send to raid"] = "Послать рейду",
	["Send to guild"] = "Послать гильдии",
	["Send to player"] = "Послать игроку",
	["Send to group"] = "Послать группе",

	["Note: This may be blocked by Blizzard's spam filter and cause problems. It is recommended to send to your party/raid/guild instead."] = "Замечание: эта операция может быть заблокирована спам-фильтром Blizzard'а. Вместо этого, рекоммендуется посылать заметки партии/рейду/гильдии.",

	["X position"] = "Позиция по оси X",
	["Y position"] = "Позиция по оси Y",
	["Title"] = "Заголовок",
	["Info line 1 (optional)"] = "Текстовая строка 1",
	["Info line 2 (optional)"] = "Текстовая строка 2",
	["Creator (optional)"] = "Создатель заметки",

	["Ctrl-Right-Click on map to add a note"] = "Ctrl+Правый клик - создание заметки на карте",

	["%s from Guild"] = "%s из гильдии",
	["%s from Raid"] = "%s из рейда",
	["%s from Party"] = "%s из партии",

	["Unknown zone: %q"] = "Неизвестная зона: %q",
	["Error: %s sent you a note with an unknown zone: %q"] = "Ошибка: %s посылает вам заметку с неизвестной зоной: %q",
	["Error: %s sent you a note at %q : %.2f, %.2f with the title %q created by %q, but you already have a note at this location."] = "Ошибка: %s посылает вам заметку %q : %.2f, %.2f с названием %q (создатель - %q), однако, у вас уже есть заметка в этом месте.",
	["%s sent you a note at %q : %.2f, %.2f with the title %q created by %q."] = "%s посылает вам заметку %q : %.2f, %.2f с названием %q (создатель - %q).",

	["Created by"] = "Создатель:",
	
	["Show note creator"] = "Показывать создателя заметки",
	["Show the `Created By:' line in notes"] = "Отображать строку `Создатель:' во всплывающей окошке заметки",

	["Icon size"] = "Размер иконок",
	["Size of the icons on the map"] = "Управление размером иконок заметок на карте",

	["Show minimap icons"] = "Показывать иконки на миникарте",
	["Show icons on the minimap"] = "Отображать иконки заметок на миникарте",

	["Minimap icon size"] = "Размер иконок на миникарте",
	["Size of the icons on the minimap"] = "Управление размером иконок заметок на миникарте",

	["Max minimap icons per database"] = "Максимальное количество иконок на миникарте",
	["The maximum amount of minimap icons to show per database"] = "Управление максимальным количеством иконок, отображаемых на миникарте одной базой данных",

	["Console-note-commands"] = { "/note", "/addnote" },
	["Usage: /note <0-100> <0-100> [title]"] = "Использование: /note <0-100> <0-100> [заголовок]",

	["Show chat notifications"] = "Показывать извещения в чате",
	["Show notification in the chat window"] = "Показывать извещения в окне чата",
	-- Note cleanup localizations
	["Clear all notes on map"] = "Очистить все заметки на карте",
	["This will remove all notes on the map. This can't be undone are your sure?"] = "Данное действие приведёт к удалению всех заметок на карте. Вы уверены, что хотите сделать это?",
	["This will clear all notes on map"] = "Удаление всех заметок на карте",

	["Clear waypoint"] = "Очистить точки маршрута",
	["Set as waypoint"] = "Установить как точку маршрута",

	["all"] = "все",
	["Note reception active"] = "Получение и отправка заметок",
	["Enabling this will allow notes to be sent and received."] = "Активация этой опции позволит вам отправлять и принимать заметки от других игроков.",

	["Note sent by %s ignored due to filtering settings."] = "Заметка от %s'a игнорируется всвязи с настройками фильтрации.",
	["Incoming note filtering"] = "Фильтрация входищих заметок",
	["Setup filtering of note sent to you by other players."] = "Настройка фильтрации заметок, получаемых от других игроков.",
	["Accept all notes"] = "Принимать все заметки",
	["Accept only handmade notes"] = "Принимать только заметки, сделанные вручную",
	["Reject all notes"] = "Отклонять все заметки",

	["%.0f yd"] = "%.0f ярд",
	["%.0f m"] = "%.0f м",

	["Console-quick-note-commands"] = { "/qnote", "/quicknote" },
	["Unable to find your location."] = "Невозможно определить ваше местоположение.",
} end)

local localization = GetLocale()
local yardString = (localization == "enUS" or localization == "zhTW" or localization == "zhCN") and L["%.0f yd"] or L["%.0f m"]

Cartographer_Notes = Cartographer:NewModule("Notes", "LibRockHook-1.0", "LibRockEvent-1.0", "LibRockTimer-1.0", "LibRockComm-1.0", "LibRockConsole-1.0")
Cartographer_Notes.L = L
local Cartographer_Notes = Cartographer_Notes
local self = Cartographer_Notes
-- Added by Sal Scotto
local setNoteFromComm = false
-- End addition
local Dewdrop = AceLibrary("Dewdrop-2.0")
local Tablet = AceLibrary("Tablet-2.0")
local Tourist = Rock("LibTourist-3.0")
local Crayon = Rock("LibCrayon-3.0")
local BZ = Rock("LibBabble-Zone-3.0")
local BZL = BZ:GetLookupTable()
local BZH = BZ:GetUnstrictLookupTable()
local BZR = BZ:GetReverseLookupTable()

local precondition, argCheck = Rock:GetContractFunctions("Cartographer", "precondition", "argCheck")

local _G = getfenv(0)
local metric = (GetLocale() ~= "enUS" and GetLocale() ~= "zhTW" and GetLocale() ~= "zhCN")

local CURRENT_DB_VERSION = 3

local icons = {}
local function getIconTitle(icon)
	if type(icon) ~= "string" then return "Unknown" end
	if icons[icon] then
		return icons[icon].text
	elseif icon.find and icon:find("^Interface\\") then
		return L["Custom icon"]
	else
		return icon
	end
end

local function getZoneAndLevel(zone)
	if zone:match("%d$") then
		local level
		zone, level = zone:match("^(.*[^%d])(%d+)$")
		level = level + 0
		if level < 1 then
			level = 1
		end
		return zone, level
	end
	return zone, 1
end

local function isCurrentLevel(level)
	local current = GetCurrentMapDungeonLevel()
	if current < 1 then
		current = 1
	end
	
	if level < 1 then
		level = 1
	end
	
	return level == current
end

local function purifyZone(zone)
	local zone, level = getZoneAndLevel(zone)
	if level == 1 then
		return zone
	else
		return zone .. level
	end
end

local isInInstance

local forceNextMinimapUpdate = false

local math_floor = math.floor
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

local function GetCursorMapLocation(button)
	local x, y = GetCursorPosition()
	local left, top = button:GetLeft(), button:GetTop()
	local width = button:GetWidth()
	local height = button:GetHeight()
	local scale = button:GetEffectiveScale()

	return (x/scale - left) / width, (top - y/scale) / height
end

local function getID(x, y)
	return round(x*10000, 0) + round(y*10000, 0)*10001
end
Cartographer_Notes.getID = getID

local function getXY(id)
	return (id % 10001)/10000, math_floor(id / 10001)/10000
end
Cartographer_Notes.getXY = getXY

local function getColorID(r, g, b)
	r = round(r*255, 0)
	g = round(g*255, 0)
	b = round(b*255, 0)
	if r > 255 then
		r = 255
	elseif r < 0 then
		r = 0
	end
	if g > 255 then
		g = 255
	elseif g < 0 then
		g = 0
	end
	if b > 255 then
		b = 255
	elseif b < 0 then
		b = 0
	end
	return r*65536 + g*256 + b
end
Cartographer_Notes.getColorID = getColorID
local whiteColorID = getColorID(1, 1, 1)

local function getRGB(id)
	if not id then
		return 1, 1, 1
	end
	local r = math_floor(id/65536)/255
	local g = (math_floor(id/256) % 256)/255
	local b = (id % 256)/255
	return r, g, b
end
Cartographer_Notes.getRGB = getRGB

local upgradeDatabase
do
	local tmp
	function upgradeDatabase(db)
		if next(db) == nil then
			db.version = CURRENT_DB_VERSION
			return
		end
		if (db.version or 1) == 1 then
			local function idConvert(id)
				if type(id) == "number" then
					return (id % 1001)*10 + math.floor(id / 1001)*100010
				end
				return id
			end

			if not tmp then
				tmp = {}
			end
			for name, zone in pairs(db) do
				if type(zone) == "table" then
					for id, data in pairs(zone) do
						tmp[idConvert(id)] = data
						zone[id] = nil
					end
					for id, data in pairs(tmp) do
						zone[id] = data
						tmp[id] = nil
					end
				end
			end
			db.version = 2
		end
		if db.version == 2 then
			for name, zone in pairs(db) do
				if type(zone) == "table" then
					for id, data in pairs(zone) do
						if type(data) == "table" then
							local r, g, b = data.titleR or 1, data.titleG or 1, data.titleB or 1
							data.titleR, data.titleB, data.titleG = nil, nil, nil
							local colorID = getColorID(r, g, b)
							if colorID ~= whiteColorID then
								data.titleCol = colorID
							end
							r, g, b = data.infoR or 1, data.infoG or 1, data.infoB or 1
							data.infoR, data.infoB, data.infoG = nil, nil, nil
							colorID = getColorID(r, g, b)
							if colorID ~= whiteColorID then
								data.infoCol = colorID
							end
							r, g, b = data.info2R or 1, data.info2G or 1, data.info2B or 1
							data.info2R, data.info2B, data.info2G = nil, nil, nil
							colorID = getColorID(r, g, b)
							if colorID ~= whiteColorID then
								data.info2Col = colorID
							end
						end
					end
				end
			end
			db.version = 3
		end
	end
end

local function getrawpoi(zone, id, creator)
	if creator then
		local v = self.externalDBs[creator]
		if v and rawget(v, zone) and rawget(v[zone], id) then
			return v[zone][id], creator
		end
		return
	end
	for k,v in pairs(self.externalDBs) do
		if rawget(v, zone) and rawget(v[zone], id) then
			return v[zone][id], k
		end
	end
	if rawget(Cartographer_Notes.db.account.pois, zone) then
		local t = rawget(Cartographer_Notes.db.account.pois[zone], id)
		if t then
			return t, nil
		end
	end
end

local function getpoi(zone, id, creator)
	if creator then
		local v = self.externalDBs[creator]
		if v and v[zone] and v[zone][id] then
			return v[zone][id], creator
		end
		return
	end
	for k,v in pairs(self.externalDBs) do
		if v[zone] and v[zone][id] then
			return v[zone][id], k
		end
	end
	local t = Cartographer_Notes.db.account.pois[zone][id]
	return t, nil
end

function Cartographer_Notes:RegisterIcon(name, data)
	if not data.cLeft then
		if data.path:find("^Interface\\Icons\\") then
			data.cLeft = 0.05
			data.cRight = 0.95
			data.cTop = 0.05
			data.cBottom = 0.95
		else
			data.cLeft = 0
			data.cRight = 1
			data.cTop = 0
			data.cBottom = 1
		end
	end
	if not data.alpha then
		data.alpha = 1
	end
	if not data.width then
		data.width = 16
	end
	if not data.height then
		data.height = 16
	end
	icons[name] = data
	self:RefreshMap(false)
end
precondition(Cartographer_Notes, 'RegisterIcon', function(self, name, data)
	argCheck(name, 2, "string")
	argCheck(data, 3, "table")
	if icons[name] then
		error(("Icon %q already registered"):format(name), 3)
	end
	if type(data.text) ~= "string" then
		error("text in data table must be a string", 3)
	end
	if type(data.path) ~= "string" then
		error("path in data table must be a string", 3)
	end
end)

-- support for icon remapping
local icon_cache = {}

function Cartographer_Notes:GetIconList()
	local list = {}
	for k,v in pairs(icons) do
		local t = next(icon_cache) or {}
		icon_cache[t] = nil
		t.name = v.text
		t.path = v.path
		list[k] = t
	end
	return list
end
function Cartographer_Notes:OverrideIconGraphic(name,newPath)
	local oldPath = icons[name].path
	icons[name].path = newPath
	return oldPath
end
precondition(Cartographer_Notes, 'OverrideIconGraphic', function(self, name, newPath)
	argCheck(name, 2, "string")
	argCheck(newPath, 3, "string")

	if not icons[name] then
		error(("Icon %q not registered"):format(name), 3)
	end
end)
-- Added a way to see if an icon was registered
function Cartographer_Notes:IsIconRegistered(name)
	return icons[name] and true
end
precondition(Cartographer_Notes, 'IsIconRegistered', function(self, name)
	argCheck(name, 2, "string")
end)

function Cartographer_Notes:UnregisterIcon(name)
	icons[name] = nil
	self:RefreshMap(false)
end
precondition(Cartographer_Notes, 'UnregisterIcon', function(self, name)
	argCheck(name, 2, "string")
	if not icons[name] then
		error(("Icon %q not registered"):format(name), 3)
	end
end)

local path
function Cartographer_Notes:OnInitialize()
	path = debugstack(1, 1, 0)
	if path:find("grapher\\") then
		path = "Interface\\AddOns\\Cartographer\\Cartographer_Notes\\Artwork\\"
	elseif path:find("grapher_Notes\\") then
		path = "Interface\\AddOns\\Cartographer_Notes\\Artwork\\"
	else
		error("Cannot determine path of artwork")
	end
	self:SetCommPrefix("CaN")
	self.externalDBs = {}
	self.handlers = {}
	self.cantDelete = {}
	local memoizations = {
		"NOTE", "title", "titleR", "titleG", "titleB", "info", "infoR", "infoG", "infoB", "info2", "info2R", "info2G", "info2B", "creator", "manual", "icon",
		-- icon names
		"Star", "Circle", "Diamond", "Triangle", "Moon", "Square", "Cross", "Skull",
	}
	for zone in BZ:Iterate() do
		table.insert(memoizations, zone)
	end
	self:AddMemoizations(memoizations)
	memoizations = nil

	do
		local x = { "Star", "Circle", "Diamond", "Triangle", "Moon", "Square", "Cross", "Skull" }

		for i = 1, 8 do
			local t = UnitPopupButtons["RAID_TARGET_" .. i]
			self:RegisterIcon(x[i], {
				text = t.text,
				r = t.color.r,
				g = t.color.g,
				b = t.color.b,
				path = "Interface\\TargetingFrame\\UI-RaidTargetingIcons",
				cLeft = t.tCoordLeft,
				cRight = t.tCoordRight,
				cTop = t.tCoordTop,
				cBottom = t.tCoordBottom,
				showToUser = true,
			})
		end

		self:RegisterIcon("Unknown", {
			text = L["Unknown"],
			path = "Interface\\Icons\\INV_Misc_QuestionMark",
		})
	end
    
    local iconPath = "Interface\\MINIMAP\\Tracking"
    self:RegisterIcon("TrackAmmunition", {
    text = L["Ammunition"],
    path = iconPath .. "\\Ammunition",
    showToUser = true,
    })
    self:RegisterIcon("TrackAuctioneer", {
    text = L["Auctioneer"],
    path = iconPath .. "\\Auctioneer",
    showToUser = true,
    })
    self:RegisterIcon("TrackBanker", {
    text = L["Banker"],
    path = iconPath .. "\\Banker",
    showToUser = true,
    })
    self:RegisterIcon("TrackBattleMaster", {
    text = L["BattleMaster"],
    path = iconPath .. "\\BattleMaster",
    showToUser = true,
    })
    self:RegisterIcon("TrackClass", {
    text = L["Class"],
    path = iconPath .. "\\Class",
    showToUser = true,
    })
    self:RegisterIcon("TrackFlightMaster", {
    text = L["FlightMaster"],
    path = iconPath .. "\\FlightMaster",
    showToUser = true,
    })
    self:RegisterIcon("TrackFood", {
    text = L["Food"],
    path = iconPath .. "\\Food",
    showToUser = true,
    })
    self:RegisterIcon("TrackInnkeeper", {
    text = L["Innkeeper"],
    path = iconPath .. "\\Innkeeper",
    showToUser = true,
    })
    self:RegisterIcon("TrackMailbox", {
    text = L["Mailbox"],
    path = iconPath .. "\\Mailbox",
    showToUser = true,
    })
    self:RegisterIcon("TrackPoisons", {
    text = L["Poisons"],
    path = iconPath .. "\\Poisons",
    showToUser = true,
    })
    self:RegisterIcon("TrackProfession", {
    text = L["Profession"],
    path = iconPath .. "\\Profession",
    showToUser = true,
    })
    self:RegisterIcon("TrackReagents", {
    text = L["Reagents"],
    path = iconPath .. "\\Reagents",
    showToUser = true,
    })
    self:RegisterIcon("TrackRepair", {
    text = L["Repair"],
    path = iconPath .. "\\Repair",
    showToUser = true,
    })
    self:RegisterIcon("TrackStableMaster", {
    text = L["StableMaster"],
    path = iconPath .. "\\StableMaster",
    showToUser = true,
    })

	self.db = Cartographer:GetDatabaseNamespace("Notes")
	Cartographer:SetDatabaseNamespaceDefaults("Notes", "account", {
		pois = {
			['*'] = { -- zones
				['*'] = {
					creator = "",
					manual = true,
				}
			}
		},
	})
	Cartographer:SetDatabaseNamespaceDefaults("Notes", "profile", {
		showCreator = true,
		showYardsAway = true,
		iconSize = 1,
		minimapIconSize = 0.65,
		showMinimapIcons = true,
		notesPerDB = 25,
		commActive = true,
		commFilter = 'handmade',
	})
	upgradeDatabase(self.db.account.pois)

	Cartographer.options.args.Notes = {
		name = L["Notes"],
		desc = L["Module which allows you to put notes on the map."] .. "\n\n" .. L["Hint: /note is available to create notes with the command line."],
		type = 'group',
		args = {
			showCreator = {
				name = L["Show note creator"],
				desc = L["Show the `Created By:' line in notes"],
				type = 'toggle',
				get = "IsShowingCreator",
				set = "ToggleShowingCreator",
			},
			size = {
				name = L["Icon size"],
				desc = L["Size of the icons on the map"],
				type = 'range',
				min = 0.5,
				max = 2,
				step = 0.01,
				bigStep = 0.05,
				isPercent = true,
				get = "GetIconSize",
				set = "SetIconSize",
			},
			minimapIcons = {
				name = L["Show minimap icons"],
				desc = L["Show icons on the minimap"],
				type = 'toggle',
				get = "IsShowingMinimapIcons",
				set = "ToggleShowingMinimapIcons",
			},
			minimapSize = {
				name = L["Minimap icon size"],
				desc = L["Size of the icons on the minimap"],
				type = 'range',
				min = 0.5,
				max = 2,
				step = 0.01,
				bigStep = 0.05,
				isPercent = true,
				get = "GetMinimapIconSize",
				set = "SetMinimapIconSize",
			},
			minimapNotesPerDB = {
				name = L["Max minimap icons per database"],
				desc = L["The maximum amount of minimap icons to show per database"],
				type = 'range',
				min = 5,
				max = 100,
				step = 1,
				bigStep = 5,
				get = "GetMinimapNotesPerDB",
				set = "SetMinimapNotesPerDB",
			},
			notifications = {
				name = L["Show chat notifications"],
				desc = L["Show notification in the chat window"],
				type = 'toggle',
				get = "IsShowingNotifications",
				set = "ToggleShowingNotifications",
			},
			clearnotes	= {
				name = L["Clear all notes on map"],
				desc = L["This will clear all notes on map"],
				type = 'execute',
				confirm = L["This will remove all notes on the map. This can't be undone are your sure?"],
				func = "ClearAllNotes",
				order = -1,
			},
			commacts = {
				name = L["Note reception active"],
				desc = L["Enabling this will allow notes to be sent and received."],
				type = 'toggle',
				get = "IsCommActive",
				set = "ToggleCommActive",
			},
			commfilter = {
				name = L["Incoming note filtering"],
				desc = L["Setup filtering of note sent to you by other players."],
				type = 'text',
				hidden = function() return not self:IsBuiltinIncomingNoteFilter() end,
				disabled = function() return not self.db.profile.commActive end,
				get = 'GetIncomingNoteFilter',
				set = 'SetIncomingNoteFilter',
				validate = {
					['all']      = L["Accept all notes"],
					['handmade'] = L["Accept only handmade notes"],
					['none']     = L["Reject all notes"],
				},
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
	hooksecurefunc("WorldMapUnit_OnEnter", function()
		WorldMapTooltip:SetFrameStrata("TOOLTIP")
	end)
end


local pois, minimapPois
local oldWorldMapMagnifyingGlassButtonText
function Cartographer_Notes:OnEnable(first)
	Cartographer:AddToMagnifyingGlass(L["Ctrl-Right-Click on map to add a note"])
	if self.developing then
		Cartographer:AddToMagnifyingGlass(("Alt-Right-Click on map to add a default note to %q"):format(self.developing))
	end
	self:AddHook("WorldMapButton_OnClick")
	self:AddSecureHook("ToggleFrame")
	self:AddEventListener("WORLD_MAP_UPDATE", function() self:RefreshMap(false) end)
	self:AddEventListener("Cartographer", "SetCurrentInstance", function() self:RefreshMap(false) end)
	if Cartographer:GetInstanceWorldMapButton() then
		self:AddScriptHook(Cartographer:GetInstanceWorldMapButton(), "OnClick", "InstanceWorldMapButton_OnClick")
	else
		self:AddEventListener("Cartographer", "RegisterInstanceWorldMapButton", function(ns, event, frame)
			self:AddScriptHook(frame, "OnClick", "InstanceWorldMapButton_OnClick")
		end)
	end
	if WorldMapFrame:IsShown() then
		self:RefreshMap(false)
	end

	local func = function()
		-- DEBUG Print(string.format("func arg1=%s WorldMapButton=%s", tostring(arg1), tostring(WorldMapButton))); --GUBED
		self:WorldMapButton_OnClick(WorldMapButton, arg1)
	end
	WorldMapPlayer:SetScript("OnMouseUp", func)
	for i = 1, 4 do
		_G["WorldMapParty" .. i]:SetScript("OnMouseUp", func)
	end
	for i = 1, 40 do
		_G["WorldMapRaid" .. i]:SetScript("OnMouseUp", func)
	end
	WorldMapFlag1:SetScript("OnMouseUp", func)
	WorldMapFlag2:SetScript("OnMouseUp", func)
	WorldMapCorpse:SetScript("OnMouseUp", func)
	WorldMapDeathRelease:SetScript("OnMouseUp", func)

	self:AddCommListener("CaN", "WHISPER")
	self:AddCommListener("CaN", "GUILD")
	self:AddCommListener("CaN", "GROUP")

	if first then
		local tmp = {}
		self:AddSlashCommand(function(command, text)
			text = text:gsub("[%s,]+", " "):trim()
			if text:match("^%d%d?%.%d%d? [^%d].*$") or text:match("^%d%d?%.%d%d?$") then
				text = text:gsub("^(%d%d?)%.(%d%d?)", "%1 %2", 1)
			end
			local x, y, title = (" "):split(text, 3)
			x, y = tonumber(x), tonumber(y)
			if not x or not y then
				self:Print(L["Usage: /note <0-100> <0-100> [title]"])
				return
			end
			x, y = x / 100, y / 100

			for k,v in pairs(icons) do
				if v.showToUser then
					table.insert(tmp, k)
				end
			end
			local icon = tmp[math.random(1, #tmp)]
			for k in pairs(tmp) do
				tmp[k] = nil
			end
			if title and title:len() == 0 then
				title = nil
			end
			if title and icons[title] then
				icon = title
				title = nil
			end
			self:SetNote(GetRealZoneText(), x, y, icon, (UnitName("player")),
				'manual', true,
				'title', title)
		end, unpack(L["Console-note-commands"]))
		self:AddSlashCommand(function(command, text)
			local x, y = GetPlayerMapPosition("player")
			if x == 0 or y == 0 then
				self:Print(L["Unable to find your location."])
				return
			end
			local title, info
			if text then
				title = text
			end
			local targetName = UnitName("target")
			if targetName and targetName~=UnitName("player") and targetName~=UNKNOWNOBJECT  then
				info = targetName
			end
			if not title and info then
				title = info
			end

			for k,v in pairs(icons) do
				if v.showToUser then
					table.insert(tmp, k)
				end
			end
			local icon = tmp[math.random(1, #tmp)]
			for k in pairs(tmp) do
				tmp[k] = nil
			end
			if title and title:len() == 0 then
				title = nil
			end
			if title and icons[title] then
				icon = title
				title = nil
			end
			self:SetNote(GetRealZoneText(), x, y, icon, (UnitName("player")),
				'manual', true,
				'title', title, 'info', info)
		end, unpack(L["Console-quick-note-commands"]))

		local function trim(str)
			if not str then
				return ""
			end

			local i = 1
			while string.match(str,"^%s",i) do
				i = i + 1
			end

			local j = string.len(str)
			while string.match(str,"^%s",j) and j > i do
				j = j - 1
			end

			if j <= i then
				return ""
			end

			return string.sub(str,i,j)
		end

		local function optionFunc(opt,text)
			if not text then return end

			local i,j,out = nil
			-- set new icon with i-
			i,j,out = string.find(text, opt..'%-(%b"")')
			if not i then
				i,j,out = string.find(text, opt.."%-(%b'')")
			end
			if not i then
				i,j,out = string.find(text, opt.."%-([^%s]+)")
			end

			if out and string.find(out,"^['\"]") then
				out = string.sub(out,2,-2)
			end

			text = i and trim(string.sub(text,1,i-1))..string.sub(text,j+1) or text
			if string.len(text) < 1 then text = nil end

			return out,text
		end
	end
	if self.db.profile.showMinimapIcons then
		local f = function()
			self:AddRepeatingTimer("Cartographer-Notes-MinimapIcons", 0, "UpdateMinimapIcons")
			self:AddEventListener("MINIMAP_ZONE_CHANGED")
			self:AddEventListener("MINIMAP_UPDATE_ZOOM")
			self:AddEventListener("ZONE_CHANGED_NEW_AREA")
			self:AddEventListener("PLAYER_LEAVING_WORLD")
			-- Notes: Do not call self:MINIMAP_UPDATE_ZOOM() here because the CVARs aren't applied yet.
			-- MINIMAP_UPDATE_ZOOM gets fired automatically by wow when it applies the CVARs.
			--self:MINIMAP_UPDATE_ZOOM()
			self:MINIMAP_ZONE_CHANGED()
			self:ZONE_CHANGED_NEW_AREA()
		end
		if Rock("LibRockEvent-1.0"):IsFullyInitialized() then
			f()
		else
			self:AddEventListener("LibRockEvent-1.0", "FullyInitialized", f)
		end
	end
	self:AddEventListener("CVAR_UPDATE")
end

function Cartographer_Notes:OnDisable()
	Cartographer:RemoveFromMagnifyingGlass(L["Ctrl-Right-Click on map to add a note"])
	if self.developing then
		Cartographer:RemoveFromMagnifyingGlass(("Alt-Right-Click on map to add a default note to %q"):format(self.developing))
	end
	self:ClearMap()
	WorldMapPlayer:SetScript("OnMouseUp", nil)
	for i = 1, 4 do
		_G["WorldMapParty" .. i]:SetScript("OnMouseUp", nil)
	end
	for i = 1, 40 do
		_G["WorldMapRaid" .. i]:SetScript("OnMouseUp", nil)
	end
	WorldMapFlag1:SetScript("OnMouseUp", nil)
	WorldMapFlag2:SetScript("OnMouseUp", nil)
	WorldMapCorpse:SetScript("OnMouseUp", nil)
	WorldMapDeathRelease:SetScript("OnMouseUp", nil)
	for id in pairs(minimapPois) do
		minimapPois:del(id)
	end
end

function Cartographer_Notes:GetIncomingNoteFilter()
	return self.db.profile.commFilter
end

function Cartographer_Notes:SetIncomingNoteFilter(value)
	self.db.profile.commFilter = value
end

local function builtin_filter(self, zone, x, y, icon, creator, data, sender, fullSender)
	-- Basically, only accept manual notes
	local commFilter = self.db.profile.commFilter
	return (commFilter == 'all') or (commFilter == 'handmade' and type(data) == 'table' and data.manual)
end

Cartographer_Notes.AcceptIncomingNote = builtin_filter

function Cartographer_Notes:IsBuiltinIncomingNoteFilter()
	return builtin_filter == Cartographer_Notes.AcceptIncomingNote
end


function Cartographer_Notes:OnNoteReceive(zone, x, y, icon, creator, data, sender, fullSender)
	zone = purifyZone(zone)
	local id = getID(x, y)
	local poi_data, db = getrawpoi(zone, id)
	if poi_data and (db or poi_data.creator or "") ~= real_creator then
		if self.db.profile.showNotifications then
			self:Print(L["Error: %s sent you a note at %q : %.2f, %.2f with the title %q created by %q, but you already have a note at this location."], fullSender, BZL[(getZoneAndLevel(zone))], x*100, y*100, data and data.title or getIconTitle(data or icon) or UNKNOWN, creator or UNKNOWN)
		end
		-- Returning true means "note processed, stop now"
		return true
	end
end

Cartographer_Notes.OnCommReceive = {
	NOTE = function(self, prefix, distribution, sender, zone, x, y, creator, data)
		if not self.db.profile.commActive then
			return
		end
		if type(zone) ~= "string" or type(x) ~= "number" or x < 0 or x > 1 or type(y) ~= "number" or y < 0 or y > 1 or (type(creator) ~= "string" and creator ~= nil) or (type(data) ~= "table" and type(data) ~= "string") or (type(data) == "table" and type(data.icon) ~= "string") then
			-- bad data
			return
		end
		zone = purifyZone(zone)
		
		local z, level = getZoneAndLevel(zone)
		if not BZH[z] then
			self:Print(L["Error: %s sent you a note with an unknown zone: %q"], fullSender, z)
			return
		end

		local usingDB = self.externalDBs[creator] and creator or nil
		if creator and not usingDB then
			return
		end

		local real_icon = type(data) == "string" and data or data.icon
		local real_creator = creator or type(data) == "table" and data.creator or ""
		local real_data = type(data) == "table" and data or nil
		local fullSender = distribution == "GUILD" and L["%s from Guild"]:format(sender) or distribution == "RAID" and L["%s from Raid"]:format(sender) or distribution == "PARTY" and L["%s from Party"]:format(sender) or sender

		if not self:AcceptIncomingNote(zone, x, y, real_icon, real_creator, real_data, sender, fullSender) then
			if self.db.profile.showNotifications then
				self:Print(L["Note sent by %s ignored due to filtering settings."], fullSender)
			end
			return
		end

		-- turn off the NoteAdd Events
		setNoteFromComm = true

		-- Try handler:OnNoteReceive or overriden self:OnNoteReceive
		local handler = usingDB and self.handlers[usingDB]
		if not (handler and type(handler.OnNoteReceive) == 'function' and handler:OnNoteReceive(zone, x, y, real_icon, data_creator, real_data, sender, fullSender))
		   and not self:OnNoteReceive(zone, x, y, real_icon, real_creator, real_data, sender, fullSender) then

			-- Default processing
			if self:SetNote(zone, x, y, real_icon, real_creator, real_data) then
				-- if changed
				if self.db.profile.showNotifications then
					self:Print(L["%s sent you a note at %q : %.2f, %.2f with the title %q created by %q."], fullSender, BZL[z], x*100, y*100, type(data) == "table" and data.title or getIconTitle(type(data) == "string" and data or data.icon), creator or type(data) == "table" and data.creator or UNKNOWN)
				end
			end

		end
		-- turn on the note add event
		setNoteFromComm = false
	end
}

function Cartographer_Notes:InstanceWorldMapButton_OnClick(frame, mouseButton)
	if mouseButton ~= "RightButton" or (not IsControlKeyDown() and (not self.developing or not IsAltKeyDown())) then
		return self.hooks[frame].OnClick(frame, mouseButton)
	end

	if not Cartographer:GetCurrentEnglishZoneName() then
		return
	end

	return self:MapButton_OnClick(mouseButton, frame)
end

function Cartographer_Notes:WorldMapButton_OnClick(button, mouseButton)
	-- DEBUG Print("Cartographer_Notes:WorldMapButton_OnClick");
	-- DEBUG Print(string.format("CN:WMB_OC button=%s mouseButton=%s", tostring(button), tostring(mouseButton)));
	
	if mouseButton ~= "RightButton" or (not IsControlKeyDown() and (not self.developing or not IsAltKeyDown())) then
		-- DEBUG Print("return hook");
		return self.hooks.WorldMapButton_OnClick(button, mouseButton)
	end

	if not Cartographer:GetCurrentEnglishZoneName() then
		return
	end

	if not button then
		button = this
	end

	return self:MapButton_OnClick(mouseButton, button)
end

local lastCursorX, lastCursorY
function Cartographer_Notes:MapButton_OnClick(mouseButton, button)
	if IsControlKeyDown() then
		if not Dewdrop:IsRegistered(WorldMapFrame) then
			local newNoteFunc = function(creator)
				self:OpenNewNoteFrame(lastCursorX, lastCursorY, creator)
				Dewdrop:Close()
			end
			local closeFunc = function()
				Dewdrop:Close()
			end
			local function waypointFunc()
				if Cartographer_Waypoints then
					Cartographer_Waypoints:SetPointAsWaypoint(lastCursorX, lastCursorY)
					Dewdrop:Close()
				end
			end
			Dewdrop:Register(button,
				'children', function()
					Dewdrop:AddLine(
						'text', L["Create a new note"],
						'func', newNoteFunc
					)
					if self.developing then
						Dewdrop:AddLine(
							'text', L["Create a new note for %q"]:format(self.developing),
							'func', newNoteFunc,
							'arg1', self.developing
						)
					end
					if Cartographer_Waypoints and Cartographer:IsModuleActive(Cartographer_Waypoints) then
						Dewdrop:AddLine(
							'text', L["Set as waypoint"],
							'func', waypointFunc
						)
					end
					Dewdrop:AddLine()
					Dewdrop:AddLine(
						'text', CANCEL,
						'func', closeFunc
					)
				end,
				'dontHook', true,
				'cursorX', true,
				'cursorY', true
			)
		end
		lastCursorX, lastCursorY = GetCursorMapLocation(button)
		if button == WorldMapFrame then
			Dewdrop:Open(button)
		else
			Dewdrop:Open(button, WorldMapFrame)
		end
	else
		local x, y = GetCursorMapLocation(button)
		self:SetNote(purifyZone(Cartographer:GetCurrentEnglishZoneName() .. GetCurrentMapDungeonLevel()), x, y, "Triangle", self.developing)
	end
end

local frame
local function GetNoteDialog()
	if frame then
		return frame
	end

	frame = CreateFrame("Frame", "CartographerNotesNewNoteFrame", WorldMapFrame)
	frame:SetPoint("CENTER", WorldMapFrame, "CENTER")
	frame:SetWidth(500)
	frame:SetHeight(330)
	frame:SetFrameLevel(9)
	frame:EnableMouse(true)
	frame:SetMovable(true)
	frame:RegisterForDrag("LeftButton")
	frame:SetScript("OnDragStart", function()
		this:StartMoving()
	end)
	frame:SetScript("OnDragStop", function()
		this:StopMovingOrSizing()
	end)
	frame:SetBackdrop({
		bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		tile = true,
		insets = {
			left = 11,
			right = 12,
			top = 12,
			bottom = 11
		},
		'tileSize', 32,
		'edgeSize', 32
	})

	local texture = frame:CreateTexture(nil, "ARTWORK")
	texture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
	texture:SetWidth(256)
	texture:SetHeight(64)
	texture:SetPoint("TOP", frame, "TOP", 0, 12)

	local header = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	frame.header = header
	header:SetText(L["New note"])
	header:SetPoint("TOP", texture, "TOP", 0, -14)

	local okayButton = CreateFrame("Button", "CartographerNotesNewNoteFrameOkay", frame, "UIPanelButtonTemplate2")
	okayButton:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 20, 20)
	okayButton:SetText(OKAY or 'Okay')
	okayButton:SetWidth(frame:GetWidth()/2 - 25)

	local cancelButton = CreateFrame("Button", "CartographerNotesNewNoteFrameCancel", frame, "UIPanelButtonTemplate2")
	cancelButton:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -20, 20)
	cancelButton:SetText(CANCEL or 'Cancel')
	cancelButton:SetWidth(frame:GetWidth()/2 - 25)
	cancelButton:SetScript("OnClick", function()
		frame:Hide()
	end)

	local last
	local isGood

	local OnEscapePressed = function()
		this:ClearFocus()
	end

	local OnTextChanged = function()
		if isGood() then
			okayButton:Enable()
		else
			okayButton:Disable()
		end
	end

	local function make(text, colorful)
		local editBox = CreateFrame("EditBox", nil, frame)
		editBox:SetFontObject(ChatFontNormal)
		editBox:SetWidth(colorful and 210 or 240)
		editBox:SetHeight(13)
		if not last then
			editBox:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -25, -35)
		else
			editBox:SetPoint("TOPLEFT", last, "BOTTOMLEFT", 0, -20)
		end
		last = editBox
		editBox:SetAutoFocus(false)
		editBox:SetScript("OnEscapePressed", OnEscapePressed)
		editBox:SetScript("OnTextChanged", OnTextChanged)

		local left = editBox:CreateTexture(nil, "BACKGROUND")
		left:SetTexture("Interface\\ChatFrame\\UI-ChatInputBorder-Left")
		left:SetTexCoord(0, 100 / 256, 0, 1)
		left:SetWidth(colorful and 125 or 140)
		left:SetHeight(32)
		left:SetPoint("LEFT", editBox, "LEFT", -10, 0)
		local right = editBox:CreateTexture(nil, "BACKGROUND")
		right:SetTexture("Interface\\ChatFrame\\UI-ChatInputBorder-Right")
		right:SetTexCoord(156/256, 1, 0, 1)
		right:SetWidth(colorful and 125 or 140)
		right:SetHeight(32)
		right:SetPoint("RIGHT", editBox, "RIGHT", 10, 0)

		local label = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
		label:SetPoint("RIGHT", editBox, "LEFT", -20, 0)
		label:SetPoint("LEFT", frame, "LEFT", 20, 0)
		label:SetPoint("TOP", editBox, "TOP")
		label:SetPoint("BOTTOM", editBox, "BOTTOM")
		label:SetJustifyH("RIGHT")
		label:SetText(text)

		if colorful then
			local button = CreateFrame("Button", nil, editBox)
			button:SetPoint("LEFT", editBox, "RIGHT", 20, 0)
			button:SetWidth(16)
			button:SetHeight(16)
			local texture = button:CreateTexture("ARTWORK")
			texture:SetAllPoints(button)
			texture:SetTexture(1, 1, 1)
			local function changeColor(r, g, b)
				texture:SetTexture(r, g, b)
				editBox:SetTextColor(r, g, b)
				Dewdrop:Close()
			end
			function editBox.resetColor(r, g, b)
				if not r then
					r, g, b = 1, 1, 1
				end
				texture:SetTexture(r, g, b)
				editBox:SetTextColor(r, g, b)
			end
			button:SetScript("OnClick", function()
				Dewdrop:Register(button,
					'children', function()
						Dewdrop:AddLine(
							'text', L["White"],
							'textR', 1,
							'textG', 1,
							'textB', 1,
							'func', changeColor,
							'arg1', 1,
							'arg2', 1,
							'arg3', 1
						)
						Dewdrop:AddLine(
							'text', L["Gray"],
							'textR', 0.8,
							'textG', 0.8,
							'textB', 0.8,
							'func', changeColor,
							'arg1', 0.8,
							'arg2', 0.8,
							'arg3', 0.8
						)
						Dewdrop:AddLine(
							'text', L["Pink"],
							'textR', 1,
							'textG', 0.62,
							'textB', 0.59,
							'func', changeColor,
							'arg1', 1,
							'arg2', 0.62,
							'arg3', 0.59
						)
						Dewdrop:AddLine(
							'text', L["Red"],
							'textR', 1,
							'textG', 0.24,
							'textB', 0.17,
							'func', changeColor,
							'arg1', 1,
							'arg2', 0.24,
							'arg3', 0.17
						)
						Dewdrop:AddLine(
							'text', L["Orange"],
							'textR', 0.98,
							'textG', 0.57,
							'textB', 0,
							'func', changeColor,
							'arg1', 0.98,
							'arg2', 0.57,
							'arg3', 0
						)
						Dewdrop:AddLine(
							'text', L["Yellow"],
							'textR', 1,
							'textG', 0.92,
							'textB', 0,
							'func', changeColor,
							'arg1', 1,
							'arg2', 0.92,
							'arg3', 0
						)
						Dewdrop:AddLine(
							'text', L["Green"],
							'textR', 0,
							'textG', 0.7,
							'textB', 0,
							'func', changeColor,
							'arg1', 0,
							'arg2', 0.7,
							'arg3', 0
						)
						Dewdrop:AddLine(
							'text', L["Lime"],
							'textR', 0.04,
							'textG', 0.95,
							'textB', 0,
							'func', changeColor,
							'arg1', 0.04,
							'arg2', 0.95,
							'arg3', 0
						)
						Dewdrop:AddLine(
							'text', L["Cyan"],
							'textR', 0,
							'textG', 1,
							'textB', 1,
							'func', changeColor,
							'arg1', 0,
							'arg2', 1,
							'arg3', 1
						)
						Dewdrop:AddLine(
							'text', L["Blue"],
							'textR', 0,
							'textG', 0.71,
							'textB', 1,
							'func', changeColor,
							'arg1', 0,
							'arg2', 0.71,
							'arg3', 1
						)
						Dewdrop:AddLine(
							'text', L["Pale blue"],
							'textR', 0.7,
							'textG', 0.82,
							'textB', 0.88,
							'func', changeColor,
							'arg1', 0.7,
							'arg2', 0.82,
							'arg3', 0.88
						)
						Dewdrop:AddLine(
							'text', L["Purple"],
							'textR', 0.83,
							'textG', 0.22,
							'textB', 0.9,
							'func', changeColor,
							'arg1', 0.83,
							'arg2', 0.22,
							'arg3', 0.9
						)
					end,
					'dontHook', true,
					'point', "TOPRIGHT",
					'relativePoint', "BOTTOMRIGHT"
				)
				button:SetScript("OnClick", function()
					if Dewdrop:IsOpen(button) then
						Dewdrop:Close()
					else
						Dewdrop:Open(button)
					end
					PlaySound("igMainMenuOptionCheckBoxOn")
				end)
				button:GetScript("OnClick")()
			end)
		end

		return editBox
	end

	frame.xEditBox = make(L["X position"])
	frame.yEditBox = make(L["Y position"])
	frame.zone = make(ZONE or "Zone")
	frame.zone:SetScript("OnEditFocusGained", function()
		this:ClearFocus()
	end)
	frame.title = make(L["Title"], true)
	frame.info1 = make(L["Info line 1 (optional)"], true)
	frame.info2 = make(L["Info line 2 (optional)"], true)
	frame.creator = make(L["Creator (optional)"])

	frame.xEditBox:SetScript("OnTabPressed", function()
		this:ClearFocus()
		frame.yEditBox:SetFocus()
	end)
	frame.yEditBox:SetScript("OnTabPressed", function()
		this:ClearFocus()
		frame.title:SetFocus()
	end)
	frame.zone:SetScript("OnTabPressed", frame.yEditBox:GetScript("OnTabPressed"))
	frame.title:SetScript("OnTabPressed", function()
		this:ClearFocus()
		frame.info1:SetFocus()
	end)
	frame.info1:SetScript("OnTabPressed", function()
		this:ClearFocus()
		frame.info2:SetFocus()
	end)
	frame.info2:SetScript("OnTabPressed", function()
		this:ClearFocus()
		frame.creator:SetFocus()
	end)
	frame.creator:SetScript("OnTabPressed", function()
		this:ClearFocus()
	end)
	function isGood()
		local x = tonumber(frame.xEditBox:GetText())
		if not x then
			return false
		elseif x < 0 or x > 100 then
			return false
		end
		local y = tonumber(frame.yEditBox:GetText())
		if not y then
			return false
		elseif y < 0 or y > 100 then
			return false
		end
		return true
	end

	local icon = CreateFrame("Frame", "CartographerNotesNewNoteFrameIcon", frame)
	frame.icon = icon
	icon:SetPoint("TOPLEFT", frame.creator, "BOTTOMLEFT", -20, -10)
	icon:SetWidth(frame:GetWidth()/2 - 25)
	icon:SetHeight(30)

	local texture = icon:CreateTexture(nil, "ARTWORK")
	texture:SetTexture("Interface\\Glues\\CharacterCreate\\CharacterCreate-LabelFrame")
	texture:SetWidth(25)
	texture:SetHeight(64)
	texture:SetPoint("TOPLEFT", icon, "TOPLEFT", 0, 17)
	texture:SetTexCoord(0, 0.1953125, 0, 1)

	local texture2 = icon:CreateTexture(nil, "ARTWORK")
	texture2:SetTexture("Interface\\Glues\\CharacterCreate\\CharacterCreate-LabelFrame")
	texture2:SetWidth(115)
	texture2:SetHeight(64)
	texture2:SetPoint("LEFT", texture, "RIGHT")
	texture2:SetTexCoord(0.1953125, 0.8046875, 0, 1)

	local texture3 = icon:CreateTexture(nil, "ARTWORK")
	texture3:SetTexture("Interface\\Glues\\CharacterCreate\\CharacterCreate-LabelFrame")
	texture3:SetWidth(25)
	texture3:SetHeight(64)
	texture3:SetPoint("LEFT", texture2, "RIGHT")
	texture3:SetTexCoord(0.8046875, 1, 0, 1)

	local fontstring = icon:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
	fontstring:SetJustifyH("RIGHT")
	fontstring:SetWidth(0)
	fontstring:SetHeight(10)
	fontstring:SetPoint("RIGHT", texture3, "RIGHT", -43, 2)

	local image = icon:CreateTexture(nil, "OVERLAY")
	image:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")
	image:SetWidth(16)
	image:SetHeight(16)
	image:SetTexCoord(0, 0.25, 0, 0.25)
	image:SetPoint("LEFT", texture, "LEFT", 20, 0)

	local button = CreateFrame("Button", "CartographerNotesNewNoteFrameIconButton", icon)
	button:SetWidth(24)
	button:SetHeight(24)
	button:SetPoint("TOPRIGHT", texture3, "TOPRIGHT", -16, -18)
	button:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up")
	button:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Down")
	button:SetDisabledTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Disabled")
	button:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
	local iconSelector = function(k)
		icon.value = k
		local t = icons[k]
		if k:find("^Interface\\") then
			if frame.title:GetText() == fontstring:GetText() then
				frame.title:SetText(L["Custom icon"])
			end
			fontstring:SetText(L["Custom icon"])
			fontstring:SetTextColor(1, 1, 1)
			image:SetTexture(k)
			if k:find("^Interface\\Icons\\") then
				image:SetTexCoord(0.05, 0.95, 0.05, 0.95)
			else
				image:SetTexCoord(0, 1, 0, 1)
			end
			Dewdrop:Close()
			return
		end
		if not t then
			t = icons.Unknown
		end
		if frame.title:GetText() == fontstring:GetText() then
			frame.title:SetText(t.text)
		end
		fontstring:SetText(t.text)
		fontstring:SetTextColor(t.r or 1, t.g or 1, t.b or 1)
		image:SetTexture(t.path)
		image:SetTexCoord(t.cLeft or 0, t.cRight or 1, t.cTop or 0, t.cBottom or 1)
		Dewdrop:Close()
	end
	frame.iconSelector = iconSelector
	button:SetScript("OnClick", function()
		local t = {}
		local mysort = function(alpha, bravo)
			if not alpha or not bravo then
				return false
			end
			local alpha_text = icons[alpha].text or alpha
			local bravo_text = icons[bravo].text or alpha
			return alpha_text < bravo_text
		end
		Dewdrop:Register(icon,
			'children', function()
				for k, v in pairs(icons) do
					if v.showToUser then
						table.insert(t, k)
					end
				end
				table.sort(t, mysort)
				for _, k in ipairs(t) do
					local v = icons[k]
					Dewdrop:AddLine(
						'text', v.text or k,
						'textR', v.r or 1,
						'textG', v.g or 1,
						'textB', v.b or 1,
						'icon', v.path,
						'iconCoordLeft', v.cLeft or 0,
						'iconCoordRight', v.cRight or 1,
						'iconCoordTop', v.cTop or 0,
						'iconCoordBottom', v.cBottom or 1,
						'func', iconSelector,
						'arg1', k
					)
				end
				for i = 1, #t do
					t[i] = nil
				end
			end,
			'dontHook', true,
			'point', "TOPLEFT",
			'relativePoint', "BOTTOMLEFT"
		)
		button:SetScript("OnClick", function()
			if Dewdrop:IsOpen(icon) then
				Dewdrop:Close()
			else
				Dewdrop:Open(icon)
			end
			PlaySound("igMainMenuOptionCheckBoxOn")
		end)
		button:GetScript("OnClick")()
	end)
	icon:SetScript("OnHide", function()
		if Dewdrop:IsOpen(icon) then
			Dewdrop:Close()
		end
	end)

	okayButton:SetScript("OnClick", function()
		local r,g,b = frame.title:GetTextColor()
		local r2,g2,b2 = frame.info1:GetTextColor()
		local r3,g3,b3 = frame.info2:GetTextColor()
		local x, y = tonumber(frame.xEditBox:GetText())/100, tonumber(frame.yEditBox:GetText())/100
		x,y,r,g,b,r2,g2,b2,r3,g3,b3 = round(x, 3),round(y, 3),round(r, 2),round(g, 2),round(b, 2),round(r2, 2),round(g2, 2),round(b2, 2),round(r3, 2),round(g3, 2),round(b3, 2)
		self:SetNote(frame.zonename, x, y, frame.icon.value, frame.creator:GetText(),
			'title', frame.title:GetText(),
			'titleR', r,
			'titleG', g,
			'titleB', b,
			'info', frame.info1:GetText(),
			'infoR', r2,
			'infoG', g2,
			'infoB', b2,
			'info2', frame.info2:GetText(),
			'info2R', r3,
			'info2G', g3,
			'info2B', b3,
			'manual', true,
			'oldId', frame.id)
		frame:Hide()
	end)

	return frame
end

local possibleIcons
function Cartographer_Notes:OpenNewNoteFrame(x, y, creator)
	if not Cartographer:GetCurrentEnglishZoneName() then
		return
	end

	local frame = GetNoteDialog()
	frame.header:SetText(L["New note"])
	frame.id = nil
	frame.xEditBox:SetText(("%.2f"):format(x*100))
	frame.yEditBox:SetText(("%.2f"):format(y*100))
	frame.zone:SetText(Cartographer:GetCurrentLocalizedZoneName())
	frame.title:SetText("")
	frame.title.resetColor()
	frame.info1:SetText("")
	frame.info1.resetColor()
	frame.info2:SetText("")
	frame.info2.resetColor()
	frame.creator:SetText(creator or UnitName("player"))
	frame:Show()
	frame.title:SetFocus()
	if not possibleIcons then
		possibleIcons = {}
	end
	for k in pairs(possibleIcons) do
		possibleIcons[k] = nil
	end
	for k,v in pairs(icons) do
		if v.showToUser then
			table.insert(possibleIcons, k)
		end
	end
	frame.iconSelector(possibleIcons[math.random(1, #possibleIcons)])
	frame.zonename = purifyZone(Cartographer:GetCurrentEnglishZoneName() .. GetCurrentMapDungeonLevel())
end
precondition(Cartographer_Notes, 'OpenNewNoteFrame', function(self, x, y, creator)
	if not Cartographer:GetCurrentEnglishZoneName() then
		return
	end
	argCheck(x, 2, "number")
	argCheck(y, 3, "number")
	argCheck(creator, 4, "string", "nil")
	if x < 0 or x > 1 then
		error(("Argument #3 to `OpenNewNoteFrame' is expected to be [0, 1], got %s"):format(x), 3)
	end
	if y < 0 or y > 1 then
		error(("Argument #4 to `OpenNewNoteFrame' is expected to be [0, 1], got %s"):format(y), 3)
	end
end)

function Cartographer_Notes:ShowEditDialog(zone, x, y)
	zone = purifyZone(zone)
	local id
	if not y then
		id = x
	else
		id = getID(x, y)
	end

	local data, db = getrawpoi(zone, id)
	if not data then
		return
	end
	local frame = GetNoteDialog()
	frame.header:SetText(L["Edit note"])
	frame.id = id
	local x, y = getXY(id)
	frame.xEditBox:SetText(("%.2f"):format(x*100))
	frame.yEditBox:SetText(("%.2f"):format(y*100))
	local z, level = getZoneAndLevel(zone)
	frame.zone:SetText(BZL[z])
	if type(data) == "table" then
		frame.title:SetText(data.title or getIconTitle(data.icon))
		frame.title.resetColor(getRGB(data.titleCol))
		frame.info1:SetText(data.info or "")
		frame.info1.resetColor(getRGB(data.infoCol))
		frame.info2:SetText(data.info2 or "")
		frame.info2.resetColor(getRGB(data.info2Col))
		frame.creator:SetText(db or data.creator or "")
		frame.iconSelector(data.icon)
	else
		frame.title:SetText(getIconTitle(data))
		frame.title.resetColor(1, 1, 1)
		frame.info1:SetText("")
		frame.info1.resetColor(1, 1, 1)
		frame.info2:SetText("")
		frame.info2.resetColor(1, 1, 1)
		frame.creator:SetText(db)
		frame.iconSelector(data)
	end
	frame:Show()
	frame.title:SetFocus()
	frame.zonename = zone
end
precondition(Cartographer_Notes, 'ShowEditDialog', function(self, zone, x, y)
	argCheck(zone, 2, "string")
	if not y then
		argCheck(x, 3, "number")
	else
		argCheck(x, 3, "number")
		argCheck(y, 4, "number")
		if x < 0 or x > 1 then
			error(("Argument #3 to `ShowEditDialog' is expected to be [0, 1], got %s"):format(x), 3)
		end
		if y < 0 or y > 1 then
			error(("Argument #4 to `ShowEditDialog' is expected to be [0, 1], got %s"):format(y), 3)
		end
	end
end)

do
	local cache = {}

	local num_pois = 0

	local OnMouseDown, OnMouseUp, OnEnter, OnLeave, OnClick, OnTabletRequest, OnLineRequest

	local function utf8trunc(str)
		-- truncate utf8 string if > 18 characters

		local len = 0
		local needsTrunc = true
		for i = 1, 18 do
			local b = str:byte(len+1)
			if not b then
				needsTrunc = false
				break
			elseif b <= 127 then
				len = len + 1
			elseif b <= 223 then
				len = len + 2
			elseif b <= 239 then
				len = len + 3
			else
				len = len + 4
			end
		end
		if needsTrunc then
			return str:sub(1, len) .. "..."
		else
			return str
		end
	end
	local dummy
	local function newpoi(minimap)
		local frame = next(cache)
		if frame then
			cache[frame] = nil
			frame:Show()
			frame.minimap = minimap
			if minimap then
				frame:SetPoint("CENTER", Minimap, "CENTER")
				frame:SetFrameStrata(Minimap:GetFrameStrata())
				frame:SetFrameLevel(5)
				frame:SetFrameLevel(Minimap:GetFrameLevel() + 2)
			else
				frame:SetPoint("CENTER", WorldMapButton, "CENTER")
				frame:SetFrameStrata(WorldMapButton:GetFrameStrata())
				frame:SetFrameLevel(WorldMapButton:GetFrameLevel() + 2)
			end
			frame:SetAlpha(1)
			return frame
		end

		num_pois = num_pois + 1

		local frame = CreateFrame("Button", "CartographerNotesPOI" .. num_pois, WorldMapButton)
		frame:EnableMouse(true)
		frame:SetMovable(true)
		frame:SetWidth(16)
		frame:SetHeight(16)
		frame:SetPoint("CENTER", WorldMapButton, "CENTER")

		local texture = frame:CreateTexture(nil, "OVERLAY")
		frame.texture = texture
		texture:SetAllPoints(frame)
		texture:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")
		texture:SetTexCoord(0, 0.25, 0, 0.25)

		frame:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		if not OnMouseDown then
			OnMouseDown = function(this, arg1)
				if arg1 == "LeftButton" and this.manual and not this.minimap and IsAltKeyDown() then
					this.isMoving = true
					this:StartMoving()
				end
			end
		end
		frame:SetScript("OnMouseDown", OnMouseDown)

		if not OnMouseUp then
			OnMouseUp = function(this, arg1)
				if arg1 == "LeftButton" then
					if this.isMoving then
						this:StopMovingOrSizing()
						this.isMoving = nil
						local x, y = this:GetCenter()
						local parent = this:GetParent()
						local left, top = parent:GetLeft(), parent:GetTop()
						local width = parent:GetWidth()
						local height = parent:GetHeight()
						x = (x - left) / width
						y = (top - y) / height

						x, y = round(x, 3), round(y, 3)
						if x > 1 then
							x = 1
						end
						if x < 0 then
							x = 0
						end
						if y > 1 then
							y = 1
						end
						if y < 0 then
							y = 0
						end
						local id = getID(x, y)
						if id ~= this.id then
							pois[id] = pois[this.id]
							pois[this.id] = nil
							local t, db = getpoi(this.zone, this.id)
							forceNextMinimapUpdate = true
							if db then
								local v = self.externalDBs[db]
								v[this.zone][id] = t
								v[this.zone][this.id] = nil
								self:ShowNote(this.zone, id, db)
							else
								self.db.account.pois[this.zone][id] = t
								self.db.account.pois[this.zone][this.id] = nil
								self:ShowNote(this.zone, id, t.creator or "")
							end
						end
					end
				end
			end
		end
		frame:SetScript("OnMouseUp", OnMouseUp)

		if not OnEnter then
			OnEnter = function(this)
				WorldMapUnit_OnEnter()
			end
		end
		frame:SetScript("OnEnter", OnEnter)

		if not OnTabletRequest then
			OnTabletRequest = function(this)
				if self.handlers[this.creator] and type(self.handlers[this.creator].OnNoteTooltipRequest) == "function" then
					local data = getrawpoi(this.zone, this.id, this.creator)
					if data then
						self.handlers[this.creator]:OnNoteTooltipRequest(this.zone, this.id, data, this.minimap)
						return
					end
				end
				Tablet:SetTitle(this.title)
				Tablet:SetTitleColor(getRGB(this.titleCol))

				if this.info and this.info ~= "" then
					local r,g,b = getRGB(this.infoCol)
					Tablet:AddCategory(
						'hideBlankLine', true
					):AddLine(
						'text', this.info,
						'textR', r,
						'textG', g,
						'textB', b,
						'wrap', true
					)
				end
				if this.info2 and this.info2 ~= "" then
					local r,g,b = getRGB(this.info2Col)
					Tablet:AddCategory(
						'hideBlankLine', true
					):AddLine(
						'text', this.info2,
						'textR', r,
						'textG', g,
						'textB', b,
						'wrap', true
					)
				end
				if not this.minimap and self:IsShowingYardsAway() then
					local x, y = getXY(this.id)
					local dist = Cartographer:GetDistanceToPoint(x, y, this.zone)
					if dist then
						Tablet:AddCategory(
							'columns', 2,
							'hideBlankLine', true
						):AddLine(
							'text', Cartographer.L["Distance:"],
							'text2', yardString:format(dist)
						)
					end
				end
				if not this.minimap and self:IsShowingCreator() and this.creator and this.creator ~= "" then
					Tablet:AddCategory(
						'columns', 2,
						'hideBlankLine', true
					):AddLine(
						'text', L["Created by"],
						'text2', this.creator
					)
				end
			end
		end
		frame.OnTabletRequest = OnTabletRequest

		if not OnLineRequest then
			local tmp = {}
			OnLineRequest = function(this)
				if self.handlers[this.creator] and type(self.handlers[this.creator].OnNoteTooltipLineRequest) == "function" then
					local data = getrawpoi(this.zone, this.id, this.creator)
					if data then
						local left, top, _, _, _, _, right, bottom = this.texture:GetTexCoord()
						local r, g, b = this.texture:GetVertexColor()
						return 'hasCheck', true,
							'checked', true,
							'checkIcon', this.texture:GetTexture(),
							'checkCoordLeft', left,
							'checkCoordRight', right,
							'checkCoordTop', top,
							'checkCoordBottom', bottom,
							'checkColorR', r,
							'checkColorG', g,
							'checkColorB', b,
							self.handlers[this.creator]:OnNoteTooltipLineRequest(this.zone, this.id, data, this.minimap)
					end
				end

				tmp[#tmp+1] = ("|cff%06x"):format(this.titleCol)
				tmp[#tmp+1] = this.title
				tmp[#tmp+1] = "|r"

				if this.info and this.info ~= "" then
					tmp[#tmp+1] = " - "
					tmp[#tmp+1] = ("|cff%06x"):format(this.infoCol)
					local info = this.info
					info = utf8trunc(info)
					tmp[#tmp+1] = info
					tmp[#tmp+1] = "|r"
				end

				if not this.minimap and self:IsShowingCreator() and this.creator and this.creator ~= "" then
					tmp[#tmp+1] = " - "
					tmp[#tmp+1] = this.creator
				end

				local text = table.concat(tmp, "")
				for i = 1, #tmp do
					tmp[i] = nil
				end
				local left, top, _, _, _, _, right, bottom = this.texture:GetTexCoord()
				local r, g, b = this.texture:GetVertexColor()
				return 'text', text,
					'hasCheck', true,
					'checked', true,
					'checkIcon', this.texture:GetTexture(),
					'checkCoordLeft', left,
					'checkCoordRight', right,
					'checkCoordTop', top,
					'checkCoordBottom', bottom,
					'checkColorR', r,
					'checkColorG', g,
					'checkColorB', b
			end
		end
		frame.OnLineRequest = OnLineRequest

		if not OnLeave then
			OnLeave = function(this)
				WorldMapUnit_OnLeave()
			end
		end
		frame:SetScript("OnLeave", OnLeave)
		Cartographer:AddPOI(frame)

		if not OnClick then
			local poi
			OnClick = function(this, arg1)
				if this.minimap then
					_G.this = Minimap
					local f = Minimap:GetScript("OnMouseDown")
					if f then
						f(Minimap, arg1)
					end
					f = Minimap:GetScript("OnMouseUp")
					if f then
						f(Minimap, arg1)
					end
					return
				end
				if arg1 == "LeftButton" then
					if self.handlers[this.creator] and type(self.handlers[this.creator].OnNoteClick) == "function" then
						local data = getrawpoi(this.zone, this.id, this.creator)
						if data then
							self.handlers[this.creator]:OnNoteClick(this.zone, this.id, data)
						end
					end
				elseif arg1 == "RightButton" then
					if not dummy then
						dummy = CreateFrame("Frame")
						local function editNoteFunc()
							self:ShowEditDialog(poi.zone, poi.id)
							Dewdrop:Close()
						end
						local function isWaypointFunc()
							return Cartographer_Waypoints:IsNoteWaypoint(poi.id..poi.zone)
						end
						local function waypointFunc()
							if isWaypointFunc() then
								Cartographer_Waypoints:CancelWaypoint(poi.id..poi.zone)
							else
								Cartographer_Waypoints:SetNoteAsWaypoint(poi.zone, poi.id)
							end
							Dewdrop:Close()
						end
						local function waypointdelFunc()
							Cartographer_Waypoints:CancelWaypoint((poi.id-1)..poi.zone)
							Dewdrop:Close()
						end
						local function deleteNoteFunc()
							self:DeleteNote(poi.zone, poi.id)
							Dewdrop:Close()
						end
						local function closeFunc()
							Dewdrop:Close()
						end
						local function sendNoteToGroupFunc()
							if getrawpoi(poi.zone, poi.id) then
								self:SendNoteToGroup(poi.zone, getXY(poi.id))
							end
						end
						local function sendNoteToGuildFunc()
							if getrawpoi(poi.zone, poi.id) then
								self:SendNoteToGuild(poi.zone, getXY(poi.id))
							end
						end
						local function sendNoteToPlayerFunc(player)
							if getrawpoi(poi.zone, poi.id) then
								local x, y = getXY(poi.id)
								self:SendNoteToPlayer(poi.zone, x, y, player)
							end
						end
						local sendNoteToPlayerValidate
						if LOCALE_enUS then -- American or Australian
							function sendNoteToPlayerValidate(player)
								return player:find("^[A-Za-z][A-Za-z]+$")
							end
						elseif GetLocale() == "enUS" or GetLocale() == "deDE" or GetLocale() == "frFR" or GetLocale() == "esES" then -- European, non-American
							local a = ('a'):byte()
							local z = ('z'):byte()
							local A = ('A'):byte()
							local Z = ('Z'):byte()
							function sendNoteToPlayerValidate(player)
								local i = 1
								local len = player:len()
								while i < len do
									local byte = player:byte(i)
									if byte >= a and byte <= z then
									elseif byte >= A and byte <= Z then
									elseif byte == 195 then
										i = i + 1
									else
										return false
									end
									i = i + 1
								end
								return true
							end
						else -- Asian or otherwise
							function sendNoteToPlayerValidate(player)
								return true
							end
						end
						local function defaultMenu(level, value, level2, level3, level4)
							if level == 1 then
								if Cartographer_Waypoints and Cartographer:IsModuleActive(Cartographer_Waypoints) then -- and BZL[poi.zone] == GetRealZoneText() then
									if poi.creator == "Waypoints" then
										Dewdrop:AddLine(
											'text', L["Clear waypoint"],
											'func', waypointdelFunc
											)
									else
										Dewdrop:AddLine(
											'text', L["Set as waypoint"],
											'func', waypointFunc,
											'checked', isWaypointFunc()
										)
									end
									Dewdrop:AddLine()
								end
								if poi.manual then
									Dewdrop:AddLine(
										'text', L["Edit note"],
										'func', editNoteFunc
									)
								end
								if poi.manual or not self.cantDelete[poi.creator] then
									Dewdrop:AddLine(
										'text', L["Delete note"],
										'func', deleteNoteFunc
									)
									Dewdrop:AddLine()
								end

								Dewdrop:AddLine(
									'text', L["Send note"],
									'hasArrow', true,
									'value', 'send'
								)
								Dewdrop:AddLine()

								Dewdrop:AddLine(
									'text', CANCEL,
									'func', closeFunc
								)
							elseif level == 2 then
								if value == 'send' then
									local bit = false
									if GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0 then
										Dewdrop:AddLine(
											'text', L["Send to group"],
											'func', sendNoteToGroupFunc,
											'disabled', not self.db.profile.commActive
										)
										bit = true
									end
									if IsInGuild() then
										Dewdrop:AddLine(
											'text', L["Send to guild"],
											'func', sendNoteToGuildFunc,
											'disabled', not self.db.profile.commActive
										)
										bit = true
									end

									if bit then
										Dewdrop:AddLine()
									end

									Dewdrop:AddLine(
										'text', L["Send to player"],
										'tooltipTitle', L["Send to player"],
										'disabled', not self.db.profile.commActive,
									--	'tooltipText', L["Note: This may be blocked by Blizzard's spam filter and cause problems. It is recommended to send to your party/raid/guild instead."],
										'hasArrow', true,
										'hasEditBox', true,
										'editBoxText', UnitExists("target") and UnitIsPlayer("target") and UnitIsFriend("player", "target") and UnitName("target") or nil,
										'editBoxFunc', sendNoteToPlayerFunc,
										'editBoxValidateFunc', sendNoteToPlayerValidate
									)
								end
							end
						end
						Dewdrop:Register(dummy,
							'children', function(level, value, level2, level3, level4)
								if self.handlers[poi.creator] and type(self.handlers[poi.creator].OnNoteMenuRequest) == "function" then
									local data = getrawpoi(poi.zone, poi.id, poi.creator)
									if data then
										self.handlers[poi.creator]:OnNoteMenuRequest(poi.zone, poi.id, data, level, value, level2, level3, level4, defaultMenu)
									end
								else
									defaultMenu(level, value, level2, level3, level4)
								end
							end,
							'dontHook', true
						)
					end
					poi = this
					if Dewdrop:IsOpen(poi) then
						Dewdrop:Close()
						poi:GetScript("OnEnter")(poi)
					else
						Dewdrop:Open(poi, dummy)
						Tablet:Close()
					end
				end
			end
		end
		frame:SetScript("OnClick", OnClick)

		frame:Hide()
		cache[frame] = true
		return newpoi(minimap)
	end

	local function delpoi(x)
		x:Hide()
		cache[x] = true
		return nil
	end

	local del = function(self, id)
		if id == 'del' then
			return
		end
		local x = rawget(self, id)
		self[id] = nil
		if x then
			delpoi(x)
		end
	end

	local __index = function(self, id)
		local frame = newpoi(self == minimapPois)
		self[id] = frame
		return frame
	end

	pois = setmetatable({ del = del }, { __index = __index })
	minimapPois = setmetatable({ del = del }, { __index = __index })
end

local cache = {}
function Cartographer_Notes:SetNote(zone, x, y, icon, creator, ...)
	local z, level = getZoneAndLevel(zone)
	if not BZH[z] then
		if BZR[z] then
			z = BZR[z]
		else
			error(("Trying to set a note with an unknown zone: %q"):format(z), 2)
		end
	end
	zone = purifyZone(z .. level)

	local usingDB = self.externalDBs[creator] and creator or nil

	local id = getID(x, y)

	if usingDB and not self.externalDBs[creator][zone] then
		self.externalDBs[creator][zone] = {}
	end
	local zoneData = usingDB and self.externalDBs[creator][zone] or self.db.account.pois[zone]
	local oldData = rawget(zoneData, id)
	if type(oldData) == "table" then
		local tmp = oldData
		oldData = cache
		for k,v in pairs(tmp) do
			oldData[k] = v
		end
	end
	local k1 = ...
	if not k1 and usingDB then
		zoneData[id] = icon
	else
		local t
		if not zoneData[id] then
			zoneData[id] = {}
		end
		t = zoneData[id]
		for k,v in pairs(t) do
			t[k] = nil
		end
		if type(k1) ~= "table" then
			for i = 1, select('#', ...), 2 do
				local k = select(i, ...)
				if k then
					t[k] = select(i+1, ...)
				else
					break
				end
			end
		else
			for k,v in pairs(k1) do
				t[k] = v
			end
		end
		t.icon = icon
		if not usingDB then
			t.creator = creator
		end
		local defaults = usingDB and self.handlers[creator] and self.handlers[creator].noteDefaults
		if type(defaults) ~= "table" then
			defaults = nil
		end
		local oldId = t.oldId
		t.oldId = nil
		if oldId and oldId ~= id then
			local oldicon
			if rawget(zoneData, oldId) then
				oldicon = zoneData[oldId]
				zoneData[oldId] = nil
				if type(oldicon) == "table" then
					oldicon = oldicon.icon
				end
			end
			if z == Cartographer:GetCurrentEnglishZoneName() and isCurrentLevel(level) then
				pois[id] = pois[oldId]
				pois[oldId] = nil
			end
			if oldicon then
				local oldx, oldy = getXY(oldId)
				self:DispatchEvent("NoteDeleted", zone, oldx, oldy, oldicon, usingDB)
				local AceEvent = Rock("AceEvent-2.0", true, true)
				if AceEvent then
					AceEvent:TriggerEvent("CartographerNotes_NoteDeleted", zone, oldx, oldy, oldicon, usingDB)
				end
			end
		end
		if t.title == getIconTitle(icon) or t.title == "" then
			t.title = nil
		end
		if t.titleR or t.titleG or t.titleB then
			local r, g, b = t.titleR or 1, t.titleG or 1, t.titleB or 1
			t.titleR, t.titleG, t.titleB = nil
			local colorID = getColorID(r, g, b)
			t.titleCol = colorID
		end
		if t.titleCol == (defaults and defaults.titleCol or whiteColorID) then
			t.titleCol = nil
		end
		if t.info == (defaults and defaults.info or "") then
			t.info = nil
		end
		if t.infoR or t.infoG or t.infoB then
			local r, g, b = t.infoR or 1, t.infoG or 1, t.infoB or 1
			t.infoR, t.infoG, t.infoB = nil
			local colorID = getColorID(r, g, b)
			t.infoCol = colorID
		end
		if t.infoCol == (defaults and defaults.infoCol or whiteColorID) then
			t.infoCol = nil
		end
		if t.info2 == (defaults and defaults.info or "") then
			t.info2 = nil
		end
		if t.info2R or t.info2G or t.info2B then
			local r, g, b = t.info2R or 1, t.info2G or 1, t.info2B or 1
			t.info2R, t.info2G, t.info2B = nil
			local colorID = getColorID(r, g, b)
			t.info2Col = colorID
		end
		if t.info2Col == (defaults and defaults.info2Col or whiteColorID) then
			t.info2Col = nil
		end
		if usingDB then
			t.creator = nil
			t.manual = nil
		end
		if creator == "" then
			t.creator = nil
		end
		if next(t) == 'icon' and next(t, 'icon') == nil then
			zoneData[id] = t.icon
		end
	end
	local different = false
	local newData = zoneData[id]
	if type(oldData) ~= type(newData) then
		different = true
	elseif type(oldData) ~= "table" then
		different = oldData ~= newData
	else
		for k,v in pairs(oldData) do
			if newData[k] ~= v then
				different = true
				break
			end
		end
		if not different then
			for k,v in pairs(newData) do
				if oldData[k] ~= v then
					different = true
					break
				end
			end
		end
	end
	for k,v in pairs(cache) do
		cache[k] = nil
	end
	if not different then
		return false
	end
	zoneData[id] = zoneData[id] -- to stop from being stored in an __index'd table.

	self:DispatchEvent("NoteSet", zone, x, y, icon, creator, setNoteFromComm)
	local AceEvent = Rock("AceEvent-2.0", true, true)
	if AceEvent then
		AceEvent:TriggerEvent("CartographerNotes_NoteSet", zone, x, y, icon, creator, setNoteFromComm)
	end

	forceNextMinimapUpdate = true
	if z ~= Cartographer:GetCurrentEnglishZoneName() or not isCurrentLevel(level) then
		return true
	end
	self:ShowNote(zone, id, usingDB)
	return true
end
precondition(Cartographer_Notes, 'SetNote', function(self, zone, x, y, icon, creator, ...)
	argCheck(zone, 2, "string")
	argCheck(x, 3, "number")
	argCheck(y, 4, "number")
	argCheck(icon, 5, "string")
	argCheck(creator, 6, "string")
	if x < 0 or x > 1 then
		error(("Argument #3 to `SetNote' is expected to be [0, 1], got %s"):format(x), 3)
	end
	if y < 0 or y > 1 then
		error(("Argument #4 to `SetNote' is expected to be [0, 1], got %s"):format(y), 3)
	end
end)

function Cartographer_Notes:GetNote(zone, x, y)
	local z, level = getZoneAndLevel(zone)
	if not BZH[z] then
		if BZR[z] then
			z = BZR[z]
		else
			error(("Trying to get a note with an unknown zone: %q"):format(z), 2)
		end
	end
	zone = purifyZone(z .. level)
	local id = getID(x, y)
	local data, db = getrawpoi(zone, id)
	if not data then
		return
	end

	return zone, x, y, type(data) == "string" and data or data.icon, db, data
end
precondition(Cartographer_Notes, 'GetNote', function(self, zone, x, y)
	argCheck(zone, 2, "string")
	argCheck(x, 3, "number")
	argCheck(y, 4, "number")
	if x < 0 or x > 1 then
		error(("Argument #3 to `SetNote' is expected to be [0, 1], got %s"):format(x), 3)
	end
	if y < 0 or y > 1 then
		error(("Argument #4 to `SetNote' is expected to be [0, 1], got %s"):format(y), 3)
	end
end)

function Cartographer_Notes:DeleteNote(zone, x, y)
	local z, level = getZoneAndLevel(zone)
	if not BZH[z] then
		if BZR[z] then
			z = BZR[z]
		else
			error(("Trying to destroy a note with an unknown zone: %q"):format(z), 2)
		end
	end
	zone = purifyZone(z .. level)
	local id
	if not y then
		id = x
		x, y = getXY(id)
	else
		id = getID(x, y)
	end
	local t, db = getrawpoi(zone, id)
	if not t then
		error(("Cannot destroy note %q at %q if it does not exist"):format(id, zone), 2)
	end
	if db then
		self.externalDBs[db][zone][id] = nil
	else
		self.db.account.pois[zone][id] = nil
	end
	local icon = t
	if type(icon) == "table" then
		icon = icon.icon
	end
	self:DispatchEvent("NoteDeleted", zone, x, y, icon, db)
	local AceEvent = Rock("AceEvent-2.0", true, true)
	if AceEvent then
		AceEvent:TriggerEvent("CartographerNotes_NoteDeleted", zone, x, y, icon, db)
	end
	if z == Cartographer:GetCurrentEnglishZoneName() and isCurrentLevel(level) then
		pois:del(id)
	end
	if Cartographer_Waypoints and Cartographer:IsModuleActive(Cartographer_Waypoints) and Cartographer_Waypoints:IsNoteWaypoint(zone, id) then
		Cartographer_Waypoints:CancelWaypoint(id..zone)
	end
	forceNextMinimapUpdate = true
end
precondition(Cartographer_Notes, 'DeleteNote', function(self, zone, x, y)
	argCheck(zone, 2, "string")
	argCheck(x, 3, "number")
	argCheck(y, 4, "number", "nil")
	if not y then
		if x < 0 or x > 1 then
			error(("Argument #3 to `DeleteNote' is expected to be [0, 1], got %s"):format(x), 3)
		end
		if y < 0 or y > 1 then
			error(("Argument #4 to `DeleteNote' is expected to be [0, 1], got %s"):format(y), 3)
		end
	end
end)

function Cartographer_Notes:ShowNote(zone, id, creator)
	local z, level = getZoneAndLevel(zone)
	if z ~= Cartographer:GetCurrentEnglishZoneName() or not isCurrentLevel(level) or not Cartographer:IsActive(self) then
		return
	end
	zone = purifyZone(zone)
	-- creator overrides
	local note_trans,note_scale,note_icon
	local default_titleCol, default_info, default_infoCol, default_info2, default_info2Col = whiteColorID, "", whiteColorID, "", whiteColorID

	local localeHandler
	if creator then
		local handler = self.handlers[creator]
		localeHandler = handler and handler.noteLocaleHandler
		local defaults = handler and handler.noteDefaults
		if type(defaults) ~= "table" then
			defaults = nil
		end
		local data = getrawpoi(zone, id, creator)
		if not data then
			return
		end
		-- check note hidden or not
		if handler and handler.IsNoteHidden and handler:IsNoteHidden(zone, id, data) then
			return
		end
		-- creator DB scaling and transparency overrides
		if handler and handler.GetNoteTransparency then
			note_trans = handler:GetNoteTransparency(zone,id,data)
			-- ensure transparency withing range
			if note_trans and (note_trans < 0 or note_trans > 1) then note_trans = nil end
		end
		-- per creator scaling overrides
		if handler and handler.GetNoteScaling then
			note_scale = handler:GetNoteScaling(zone,id,data)
			if note_scale and (note_scale < 0.5 or note_scale > 2) then note_scale = nil end
		end
		-- per creator icon overrides
		if handler and handler.GetNoteIcon then
			note_icon = handler:GetNoteIcon(zone,id,data)
			if type(note_icon) ~= 'string' then note_icon = nil end
		end

		if defaults then
			default_titleCol = defaults.titleCol or whiteColorID
			default_info = defaults.info or ""
			default_infoCol = defaults.infoCol or whiteColorID
			default_info2 = defaults.info2 or ""
			default_info2Col = defaults.info2Col or whiteColorID
		end
	end
	local data, db = getpoi(zone, id)
	local poi = pois[id]
	poi.zone = zone
	local icon
	local creator = db or data.creator or ""
	if type(data) == "string" then
		poi.title = getIconTitle(data)
		poi.titleCol = default_titleCol
		poi.info = default_info
		poi.infoCol = default_infoCol
        poi.info2 = default_info2
		poi.info2Col = default_info2Col
		poi.manual = false
		icon = note_icon or data
	else
		poi.title = data.title or getIconTitle(data.icon)
		poi.titleCol = data.titleCol or default_titleCol
		poi.info = data.info or default_info
		poi.infoCol = data.infoCol or default_infoCol
		poi.info2 = data.info2 or default_info2
		poi.info2Col = data.info2Col or default_info2Col
		poi.icon = data.icon
		poi.manual = data.manual or false
		icon = note_icon or data.icon
	end
	if localeHandler then
		if poi.title ~= getIconTitle(type(data) == "string" and data or data.icon) and localeHandler:HasTranslation(poi.title) then
			poi.title = localeHandler:GetTranslation(poi.title)
		end
		if poi.info ~= "" and localeHandler:HasTranslation(poi.info) then
			poi.info = localeHandler:GetTranslation(poi.info)
		end
		if poi.info2 ~= "" and localeHandler:HasTranslation(poi.info2) then
			poi.info2 = localeHandler:GetTranslation(poi.info2)
		end
	end
	poi.icon = icon
	poi.creator = creator
	poi.id = id
	if self.developing == creator then
		poi.manual = true
	end

	local button = z == Cartographer:GetCurrentInstance() and isCurrentLevel(level) and Cartographer:GetInstanceWorldMapButton() or WorldMapButton
	if not button:IsShown() then
		button = WorldMapButton
	end

	poi:SetParent(button)
	if type(icon) == "string" and icon:find("^Interface\\") then
		if note_scale then
			poi:SetWidth(16*self.db.profile.iconSize*note_scale)
			poi:SetHeight(16*self.db.profile.iconSize*note_scale)
		else
			poi:SetWidth(16*self.db.profile.iconSize)
			poi:SetHeight(16*self.db.profile.iconSize)
		end
		-- Note transparency overrides
		if note_trans then
			poi:SetAlpha(note_trans)
		else
			poi:SetAlpha(1)
		end
		poi.texture:SetTexture(icon)
		if icon:find("^Interface\\Icons\\") then
			poi.texture:SetTexCoord(0.05, 0.95, 0.05, 0.95)
		else
			poi.texture:SetTexCoord(0, 1, 0, 1)
		end
	else
		local t = icons[icon]
		if not t then
			t = icons.Unknown
		end
		if note_scale then
			poi:SetWidth(t.width*self.db.profile.iconSize*note_scale)
			poi:SetHeight(t.height*self.db.profile.iconSize*note_scale)
		else
			poi:SetWidth(t.width*self.db.profile.iconSize)
			poi:SetHeight(t.height*self.db.profile.iconSize)
		end
		-- Note transparency overrides
		if note_trans then
			poi:SetAlpha(note_trans)
		else
			poi:SetAlpha(t.alpha)
		end
		poi.texture:SetTexture(t.path)
		poi.texture:SetTexCoord(t.cLeft, t.cRight, t.cTop, t.cBottom)
	end
	poi:Show()

	poi:ClearAllPoints()
	local x, y = getXY(id)
	poi:SetPoint("CENTER", button, "TOPLEFT", x * button:GetWidth(), -y * button:GetHeight())
end

do
	local searchResults = {}
	function Cartographer_Notes:FindZone(search,destTable,iterFunc,iterTable,iterKey)
		if not destTable then
			while #searchResults > 0 do
				table.remove(searchResults)
			end

			destTable = searchResults
		end

		local exact = nil

		if not iterFunc then
			iterFunc, iterTable, iterKey = Tourist:IterateZonesAndInstances()
		end

        local lzone
		for zone in iterFunc, iterTable, iterKey do
			if not search then
				table.insert(destTable,zone)
            else
                lzone = zone:lower()

                if lzone == search then
                    table.insert(destTable,zone)
                    exact = zone
                elseif lzone:find(search) then
                    table.insert(destTable,zone)
                end
			end
		end

		if exact then
			return exact
		end

		return unpack(destTable)
	end
	precondition(Cartographer_Notes, 'FindZone', function(self, search,destTable,iterFunc,iterTable,iterKey)
        argCheck(search, 2, "nil", "string")
        argCheck(destTable, 3, "nil", "table")
        argCheck(iterFunc, 4, "nil", "function")
	end)
end

local tempZones = {}
function Cartographer_Notes:FindNearestNote(search,zone,x,y,minDist,validate)
	zone = purifyZone(zone)
	if not x then
		x,y = Cartographer:GetCurrentPlayerPosition()
	end

	if zone then
		if string.lower(zone) == L["all"] then
			zone = nil
		end

		local szone, notexact = Cartographer_Notes:FindZone(string.lower(zone),tempZones)

        if not szone then
            return nil,nil,nil,string.format(L["Unknown zone: %q"],zone)

        end

		if not notexact then
			while #tempZones > 0 do
				table.remove(tempZones)
			end

			table.insert(tempZones,szone)
		end
	else
		zone = Cartographer:GetCurrentLocalizedZoneName()

		while #tempZones > 0 do
			table.remove(tempZones)
		end

		table.insert(tempZones,zone)
	end

	return self:FindNotes(search,nil,tempZones,x,y,minDist,validate)
end
precondition(Cartographer_Notes, 'FindNearestNote', function(self, search,zone,x,y,minDist,validate)
	argCheck(search, 2, "string")
	argCheck(zone, 3, "string", "nil")
	argCheck(x, 4, "number", "nil")
	argCheck(y, 5, "number", "nil")
	argCheck(minDist, 6, "number", "nil")
	argCheck(validate, 7, "function", "nil")
end)

function Cartographer_Notes:FindNotes(search,results,zoneList,x,y,minDist,validate)

    if not minDist then
        minDist = 0
    end

	local _dist = math.huge
	local _x,_y,_zone,_icon,_db,_data,_print,_key,db,value,key

	local zone

	if type(zoneList) == "table" then
		zone = table.remove(zoneList)
	else
		zone = zoneList
		zoneList = nil
	end

    repeat
        repeat
			if not BZH[zone] and not BZR[zone] then
                error(string.format(L["Unknown zone: %q"],zone))
            end

            for zone,x,y,icon,db,data in self:IterateNearbyNotes(zone,x,y,nil,db) do

                if not validate or validate(zone,x,y,icon,db,data) then
                    local found,better,dist

                    if type(data) == "table" then
                        for k,v in pairs(data) do
                            if type(v) == "number" then
                                v = tostring(v)
                            end

                            if type(v) == "string" then
                                if string.find(string.lower(v),search,1,true) then
                                    dist = dist or Cartographer:GetDistanceToPoint(x,y,zone,px,py,zone) or math.huge - 1
									found = dist and dist >= minDist
                                    if found and dist < _dist then
                                        _print = v
                                        _key = k
										better = true
                                    end
                                end
                            end
                        end
                    elseif data then
                        dist = dist or Cartographer:GetDistanceToPoint(x,y,zone,px,py,zone) or math.huge - 1
                        found = dist and string.find(string.lower(data),search,1,true) and dist >= minDist
                        if found and dist < _dist then
                            _print = data
                            _key = "data"
							better = true
                        end
                    end

                    if not found then
                        dist = dist or Cartographer:GetDistanceToPoint(x,y,zone,px,py,zone) or math.huge - 1
                        found = dist and string.find(string.lower(icon),search,1,true) and dist >= minDist
                        if found and dist < _dist then
                            _print = icon
                            _key = "icon"
							better = true
                        end
                    end

                    if not found and db then
                        dist = dist or Cartographer:GetDistanceToPoint(x,y,zone,px,py,zone) or math.huge - 1
                        found = dist and string.find(string.lower(db),search,1,true) and dist >= minDist
                        if found and dist < _dist then
                            _print = db
                            _key = "db"
							better = true
                        end
                    end

                    if found then

						if results then
							if not results[zone] then
								results[zone] = {}
							end

							table.insert(results[zone],getID(x,y))
						end

						if better then
							_zone,_x,_y,_icon,_db,_data,_dist = zone,x,y,icon,db,data,dist
						end
	                end
                end
            end

            db = next(self.externalDBs, db)
		until not db

		zone = zoneList and #zoneList > 0 and table.remove(zoneList) or nil
	until not zone

	if _print then
		return _zone,_x,_y,_print,_key
	end
end

local lastMap = nil
function Cartographer_Notes:ClearMap()
	for k,v in pairs(pois) do
		pois:del(k)
	end
	lastMap = nil
end

local forceRefresh
local function RefreshMap()
	local force = forceRefresh
	forceRefresh = nil
	local z = Cartographer:GetCurrentEnglishZoneName()
	if not z or not Cartographer:IsModuleActive(self) then
		self:ClearMap()
		return
	end
	local zone = purifyZone(z .. GetCurrentMapDungeonLevel())
	if zone == lastMap and force == false then
		return
	end
	self:ClearMap()
	if rawget(self.db.account.pois, zone) then
		for id in pairs(self.db.account.pois[zone]) do
			self:ShowNote(zone, id, false)
		end
	end
	for k,v in pairs(self.externalDBs) do
		if rawget(v, zone) then
			for id in pairs(v[zone]) do
				self:ShowNote(zone, id, k)
			end
		end
	end
	lastMap = zone
	forceNextMinimapUpdate = true
end

function Cartographer_Notes:RefreshMap(value)
	-- value defaults to true and false should override forceRefresh if it is nil
	forceRefresh = (value == nil) or forceRefresh or value
	if WorldMapFrame:IsShown() then
		self:AddTimer("CartographerNotes_RefreshMap", 0, RefreshMap)
	end
end

function Cartographer_Notes:ToggleFrame(frame)
	if not frame or frame ~= WorldMapFrame then return end

	if CartographerNotesNewNoteFrame then
		CartographerNotesNewNoteFrame:Hide()
	end
	if not WorldMapFrame:IsShown() then
		self:ClearMap()
	else
		self:RefreshMap(false)
	end
end

function Cartographer_Notes:RegisterNotesDatabase(name, db, handler, cantDelete)
	upgradeDatabase(db)

	self.externalDBs[name] = db
	self.handlers[name] = handler
	self.cantDelete[name] = not not cantDelete

	for zone,zdata in pairs(self.db.account.pois) do
		if type(zdata) == "table" then
			for id,data in pairs(zdata) do
				if data.creator == name then
					zdata[id] = nil
					if not db[zone] then
						db[zone] = {}
					end
					if not rawget(db[zone], id) then
						db[zone][id] = data
						data.creator = nil
						data.manual = nil
						if next(data) == 'icon' and next(data, 'icon') == nil then
							db[zone][id] = data.icon
						end
					end
				end
			end
		end
	end

	if WorldMapFrame:IsShown() then
		local zone = purifyZone(Cartographer:GetCurrentEnglishZoneName() .. GetCurrentMapDungeonLevel())
		if rawget(db, zone) then
			for id in pairs(db[zone]) do
				self:ShowNote(zone, id, name)
			end
		end
	end
end
precondition(Cartographer_Notes, 'RegisterNotesDatabase', function(self, name, db, handler, cantDelete)
	argCheck(name, 2, "string")
	argCheck(db, 3, "table")
	argCheck(handler, 4, "table", "nil")
	argCheck(cantDelete, 5, "boolean", "nil")
	if self.externalDBs[name] then
		error("Cannot register a database already registered.", 3)
	end
end)

function Cartographer_Notes:UnregisterNotesDatabase(name)
	local t = self.externalDBs[name]
	self.externalDBs[name] = nil
	self.handlers[name] = nil
	local zone = purifyZone(Cartographer:GetCurrentEnglishZoneName() .. GetCurrentMapDungeonLevel())
	if rawget(t, zone) then
		for id in pairs(t[zone]) do
			pois:del(id)
		end
	end
end
precondition(Cartographer_Notes, 'UnregisterNotesDatabase', function(self, name)
	argCheck(name, 2, "string")
	if not self.externalDBs[name] then
		error("Cannot unregister a database not registered.", 3)
	end
end)

function Cartographer_Notes:EnableDevelopment(database)
	self.developing = database

	if Cartographer:IsActive(self) then
		Cartographer:AddToMagnifyingGlass(("Alt-Right-Click on map to add a default note to %q"):format(database))

		self:RefreshMap()
	end
end
precondition(Cartographer_Notes, 'EnableDevelopment', function(self, database)
	argCheck(database, 2, "string")
	if self.developing then
		error("Cannot enable development on two databases.", 3)
	end
end)

function Cartographer_Notes:SendNoteToPlayer(zone, x, y, player)
	local z, level = getZoneAndLevel(zone)
	if not BZH[z] then
		if BZR[z] then
			z = BZR[z]
		else
			error(("Trying to set a note with an unknown zone: %q"):format(z), 2)
		end
	end
	zone = purifyZone(z .. level)
	if GetLocale() ~= "zhTW" and GetLocale() ~= "zhCN" and GetLocale() ~= "ruRU" then
		if not player:find("^%a%a+$") then
			error(("Argument #5 to `SendNoteToPlayer' in the wrong format, got %q"):format(player), 2)
		end
	end

	local data, db = getrawpoi(zone, getID(x, y))

	if not data then
		error(("Cannot send note %q(%s,%s). Does not exist"):format(tostring(zone), x*100, y*100), 2)
	end

	self:SendCommMessage("WHISPER", player, "NOTE", zone, x, y, db, data)
	return true
end
precondition(Cartographer_Notes, 'SendNoteToPlayer', function(self, zone, x, y, player)
	argCheck(zone, 2, "string")
	argCheck(x, 3, "number")
	argCheck(y, 4, "number")
	argCheck(player, 5, "string")
	if x < 0 or x > 1 then
		error(("Argument #3 to `SendNoteToPlayer' is expected to be [0, 1], got %s"):format(x), 3)
	end
	if y < 0 or y > 1 then
		error(("Argument #4 to `SendNoteToPlayer' is expected to be [0, 1], got %s"):format(y), 3)
	end
end)

local function sendNote(distribution, zone, x, y)
	local data, db = getrawpoi(zone, getID(x, y))

	if not data then
		error(("Cannot send note %q(%s,%s). Does not exist"):format(tostring(zone), x*100, y*100), 2)
	end

	self:SendCommMessage(distribution, "NOTE", zone, x, y, db, data)
	return true
end

function Cartographer_Notes:SendNoteToGuild(zone, x, y)
	local z, level = getZoneAndLevel(zone)
	if not BZH[z] then
		if BZR[z] then
			z = BZR[z]
		else
			error(("Trying to set a note with an unknown zone: %q"):format(z), 2)
		end
	end
	zone = purifyZone(z .. level)
	if not IsInGuild() then
		return false
	end
	return sendNote("GUILD", zone, x, y)
end
precondition(Cartographer_Notes, 'SendNoteToGuild', function(self, zone, x, y)
	argCheck(zone, 2, "string")
	argCheck(x, 3, "number")
	argCheck(y, 4, "number")
	if x < 0 or x > 1 then
		error(("Argument #3 to `SendNoteToGuild' is expected to be [0, 1], got %s"):format(x), 3)
	end
	if y < 0 or y > 1 then
		error(("Argument #4 to `SendNoteToGuild' is expected to be [0, 1], got %s"):format(y), 3)
	end
end)

function Cartographer_Notes:SendNoteToGroup(zone, x, y)
	local z, level = getZoneAndLevel(zone)
	if not BZH[z] then
		if BZR[z] then
			z = BZR[z]
		else
			error(("Trying to set a note with an unknown zone: %q"):format(z), 2)
		end
	end
	zone = purifyZone(z .. level)
	if GetNumRaidMembers() > 0 or GetNumPartyMembers() > 0 then
		return sendNote("GROUP", zone, x, y)
	end
	return false
end
precondition(Cartographer_Notes, 'SendNoteToGroup', function(self, zone, x, y)
	argCheck(zone, 2, "string")
	argCheck(x, 3, "number")
	argCheck(y, 4, "number")
	if x < 0 or x > 1 then
		error(("Argument #3 to `SendNoteToGroup' is expected to be [0, 1], got %s"):format(x), 3)
	end
	if y < 0 or y > 1 then
		error(("Argument #4 to `SendNoteToGroup' is expected to be [0, 1], got %s"):format(y), 3)
	end
end)

function Cartographer_Notes:IsShowingCreator()
	return self.db.profile.showCreator
end

function Cartographer_Notes:ToggleShowingCreator(value)
	if value == nil then
		value = not self.db.profile.showCreator
	end
	self.db.profile.showCreator = value
end

-- comm nutering
function Cartographer_Notes:IsCommActive()
	return self.db.profile.commActive
end
function Cartographer_Notes:ToggleCommActive(value)
	if value == nil then
		value = not self.db.profile.commActive
	end
	self.db.profile.commActive = value
end


function Cartographer_Notes:IsShowingYardsAway()
	return self.db.profile.showYardsAway
end

function Cartographer_Notes:ToggleShowingYardsAway(value)
	if value == nil then
		value = not self.db.profile.showYardsAway
	end
	self.db.profile.showYardsAway = value
end

function Cartographer_Notes:IsShowingMinimapIcons()
	return self.db.profile.showMinimapIcons
end

function Cartographer_Notes:ToggleShowingMinimapIcons(value)
	if value == nil then
		value = not self.db.profile.showMinimapIcons
	end
	self.db.profile.showMinimapIcons = value
	if Cartographer:IsModuleActive(self) then
		if not value then
			for id in pairs(minimapPois) do
				minimapPois:del(id)
			end
			self:RemoveTimer("Cartographer-Notes-MinimapIcons")
			self:RemoveEventListener("MINIMAP_ZONE_CHANGED")
			self:RemoveEventListener("MINIMAP_UPDATE_ZOOM")
			self:RemoveEventListener("ZONE_CHANGED_NEW_AREA")
			self:RemoveEventListener("PLAYER_LEAVING_WORLD")
		else
			self:AddRepeatingTimer("Cartographer-Notes-MinimapIcons", 0, "UpdateMinimapIcons")
			self:AddEventListener("MINIMAP_ZONE_CHANGED")
			self:AddEventListener("MINIMAP_UPDATE_ZOOM")
			self:AddEventListener("ZONE_CHANGED_NEW_AREA")
			self:AddEventListener("PLAYER_LEAVING_WORLD")
			self:MINIMAP_UPDATE_ZOOM()
			self:MINIMAP_ZONE_CHANGED()
			self:ZONE_CHANGED_NEW_AREA()
		end
	end
end

function Cartographer_Notes:GetIconSize()
	return self.db.profile.iconSize
end

function Cartographer_Notes:SetIconSize(value)
	self.db.profile.iconSize = value
	if Cartographer:IsModuleActive(self) then
		self:RefreshMap()
	end
end

function Cartographer_Notes:GetMinimapIconSize()
	return self.db.profile.minimapIconSize
end

function Cartographer_Notes:SetMinimapIconSize(value)
	self.db.profile.minimapIconSize = value
	forceNextMinimapUpdate = true
end

function Cartographer_Notes:GetMinimapNotesPerDB()
	return self.db.profile.notesPerDB
end

function Cartographer_Notes:SetMinimapNotesPerDB(value)
	self.db.profile.notesPerDB = value
	forceNextMinimapUpdate = true
end

function Cartographer_Notes:IsShowingNotifications()
	return self.db.profile.showNotifications
end

function Cartographer_Notes:ToggleShowingNotifications(value)
	if value == nil then
		value = not self.db.profile.showNotifications
	end
	self.db.profile.showNotifications = value
end

function Cartographer_Notes:ClearAllNotes()
	local zone = purifyZone(Cartographer:GetCurrentEnglishZoneName() .. GetCurrentMapDungeonLevel())
	local zoneData
	zoneData = rawget(self.db.account.pois, zone)
	-- clear manual notes
	if zoneData and next(zoneData) then
		for i, data in pairs(zoneData) do
			local x, y = getXY(i)
			self:DeleteNote(zone, x, y)
		end
	end
	-- clear other db notes
	for k,v in pairs(self.externalDBs) do
		local zoneData = rawget(v, zone)
		if zoneData and next(zoneData) then
			for i,data in pairs(zoneData) do
				local x, y = getXY(i)
				self:DeleteNote(zone, x, y)
			end
		end
	end
end

local cache = {}
local function iter(t)
	t.id = t.id + 1

	local notes = t.notes

	local id = notes[t.id]
	if id then
		local data = t.zoneData[id]

		local x, y = getXY(id)

		return t.zone, x, y, type(data) == "string" and data or data.icon, t.creator, data
	end

	cache[t] = true
	for k in pairs(t) do
		t[k] = nil
	end
	cache[notes] = true
	for k in pairs(notes) do
		notes[k] = nil
	end
	return nil
end

local function retNil()
	return nil
end

local current_x, current_y
local current_using_yards
local function my_sort(alpha, bravo)
	if not alpha or not bravo then
		return false
	end
	local a_x, a_y = getXY(alpha)
	local b_x, b_y = getXY(bravo)
	a_x, a_y = a_x - current_x, a_y - current_y
	b_x, b_y = b_x - current_x, b_y - current_y
	if current_using_yards then
		a_y = a_y * 2/3
		b_y = b_y * 2/3
	end
	return a_x*a_x + a_y*a_y < b_x*b_x + b_y*b_y
end

function Cartographer_Notes:IterateNearbyNotes(zone, x, y, radius, creator, max_notes, use_yards)
	local z, level = getZoneAndLevel(zone)
	if not BZH[z] then
		if BZR[z] then
			z = BZR[z]
		else
			error(("Trying to iterate through notes in an unknown zone: %q"):format(z), 2)
		end
	end
	zone = purifyZone(z .. level)
	if not radius then
		radius = 1/0
	end
	if creator and not self.externalDBs[creator] then
		error(("Database %q not registered."):format(creator), 2)
	end

	local zoneData
	if creator then
		zoneData = rawget(self.externalDBs[creator], zone)
	else
		zoneData = rawget(self.db.account.pois, zone)
	end
	if not zoneData or not next(zoneData) then
		return retNil
	end

	-- Allow handlers to specify radius,
	if creator then
		local handler = self.handlers[creator]
		if handler and handler["GetRadius"] then
			radius = handler:GetRadius()
		end
	end

	local radius_2 = radius*radius

	local notes = next(cache) or {}
	cache[notes] = nil
	local yardWidthMult, yardHeightMult = 1, 1
	if use_yards then
		yardWidthMult, yardHeightMult = Tourist:GetZoneYardSize(BZL[z])
		if not yardWidthMult then
			yardWidthMult, yardHeightMult = 1000, 1000 * 2/3
		end
	end
	for i, data in pairs(zoneData) do
		local x_p, y_p = getXY(i)
		local x_d = (x_p - x) * yardWidthMult
		local y_d = (y_p - y) * yardHeightMult
		if x_d*x_d + y_d*y_d <= radius_2 then
			table.insert(notes, i)
		end
	end

	current_x, current_y = x, y
	current_using_yards = use_yards
	table.sort(notes, my_sort)
	current_x, current_y = nil, nil
	current_using_yards = nil

	if max_notes and max_notes > #notes then
		for i = max_notes + 1, #notes do
			notes[i] = nil
		end
	end

	local t = next(cache) or {}
	cache[t] = nil

	t.zoneData = zoneData
	t.zone = zone
	t.creator = creator
	t.notes = notes
	t.id = 0

	return iter, t, nil
end
precondition(Cartographer_Notes, 'IterateNearbyNotes', function(self, zone, x, y, radius, creator, max_notes, use_yards)
	argCheck(zone, 2, "string")
	argCheck(x, 3, "number")
	argCheck(y, 4, "number")
	argCheck(radius, 5, "number", "nil")
	argCheck(creator, 6, "string", "nil")
	argCheck(max_notes, 7, "number", "nil")
	argCheck(use_yards, 8, "boolean", "nil")
	if x < 0 or x > 1 then
		error(("Argument #3 to `IterateNearbyNotes' is expected to be [0, 1], got %s"):format(x), 3)
	end
	if y < 0 or y > 1 then
		error(("Argument #4 to `IterateNearbyNotes' is expected to be [0, 1], got %s"):format(y), 3)
	end
	if radius and radius < 0 then
		error(("Argument #5 to `IterateNearbyNotes' is expected to be [0, inf), got %s"):format(radius), 3)
	end
end)

function Cartographer_Notes:GetNearbyNote(zone, x, y, radius, creator, use_yards)
	local z, level = getZoneAndLevel(zone)
	if not BZH[z] then
		if BZR[z] then
			z = BZR[z]
		else
			error(("Trying to set a note with an unknown zone: %q"):format(z), 2)
		end
	end
	zone = purifyZone(z .. level)
	if not radius then
		radius = 1/0
	end
	if creator and not self.externalDBs[creator] then
		error(("Database %q not registered."):format(creator), 2)
	end

	local zoneData
	if creator then
		zoneData = rawget(self.externalDBs[creator], zone)
	else
		zoneData = rawget(self.db.account.pois, zone)
	end
	if not zoneData or not next(zoneData) then
		return
	end
	local radius_2 = radius*radius

	local close_distance = 1/0
	local close_id

	local yardWidthMult, yardHeightMult = 1, 1
	if use_yards then
		yardWidthMult, yardHeightMult = Tourist:GetZoneYardSize(BZL[z])
		if not yardWidthMult then
			yardWidthMult, yardHeightMult = 1000, 1000 * 2/3
		end
	end

	for id, data in pairs(zoneData) do
		local x_p, y_p = getXY(id)

		local x_d = (x_p - x) * yardWidthMult
		local y_d = (y_p - y) * yardHeightMult

		local d_2 = x_d*x_d + y_d*y_d

		if d_2 <= radius_2 and d_2 < close_distance then
			close_distance = d_2
			close_id = id
		end
	end
	if not close_id then
		return
	end
	local x_p, y_p = getXY(close_id)
	local data = zoneData[close_id]
	return zone, x_p, y_p, type(data) == "string" and data or data.icon, creator, data
end
precondition(Cartographer_Notes, 'GetNearbyNote', function(self, zone, x, y, radius, creator, use_yards)
	argCheck(zone, 2, "string")
	argCheck(x, 3, "number")
	argCheck(y, 4, "number")
	argCheck(radius, 5, "number", "nil")
	argCheck(creator, 6, "string", "nil")
	argCheck(use_yards, 7, "boolean", "nil")
	if x < 0 or x > 1 then
		error(("Argument #3 to `GetNearbyNote' is expected to be [0, 1], got %s"):format(x), 3)
	end
	if y < 0 or y > 1 then
		error(("Argument #4 to `GetNearbyNote' is expected to be [0, 1], got %s"):format(y), 3)
	end
	if radius and radius < 0 then
		error(("Argument #5 to `GetNearbyNote' is expected to be [0, inf), got %s"):format(radius), 3)
	end
end)

local MinimapSize = { -- radius of minimap
	indoor = {
		[0] = 150,
		[1] = 120,
		[2] = 90,
		[3] = 60,
		[4] = 40,
		[5] = 25,
	},
	outdoor = {
		[0] = 233 + 1/3,
		[1] = 200,
		[2] = 166 + 2/3,
		[3] = 133 + 1/6,
		[4] = 100,
		[5] = 66 + 2/3,
	},
}

local lastX, lastY = 1/0, 1/0
local lastZoom = -1
local lastTracking = nil
local indoors = 'outdoor'
local TRACK = {
	["Interface\\Icons\\Spell_Nature_Earthquake"] = "Mining",
	["Interface\\Icons\\INV_Misc_Flower_02"] = "Herbalism",
	["Interface\\Icons\\Racial_Dwarf_FindTreasure"] = "Treasure",
}
local FAKE_TRACK = {}
local function CheckToUpdateMinimapIcons(x_, y_, x, y, force)
	if isInInstance then
		return
	end
	if not x then
		return
	end
	local diffX = (lastX - x)
	local diffY = (lastY - y)
	local distance_2 = diffX*diffX + diffY*diffY
	if not force and not forceNextMinimapUpdate and distance_2 < 5^2 then
		return
	end
	forceNextMinimapUpdate = false
	lastX, lastY = x, y
	local radius = MinimapSize[indoors][lastZoom]*2
	local radius_2 = radius*radius

	local zone = purifyZone(GetRealZoneText() .. GetCurrentMapDungeonLevel())

	for id, v in pairs(minimapPois) do
		if id ~= 'del' then
			local idX, idY = Cartographer:PointToYards(getXY(id))
			local diffX, diffY = (x - idX), (y - idY)
			local distance_2 = diffX*diffX + diffY*diffY
			if distance_2 > radius_2 or not getrawpoi(zone, id) then
				minimapPois:del(id)
			end
		end
	end

	local db = nil
	local notesPerDB = self.db.profile.notesPerDB
	while true do
		db = next(self.externalDBs, db)
		for zone, x, y, icon, creator, data in Cartographer_Notes:IterateNearbyNotes(zone, x_, y_, radius, db, notesPerDB, true) do
			local id = getID(x, y)
			local note_icon
			local default_titleCol, default_info, default_infoCol, default_info2, default_info2Col = whiteColorID, "", whiteColorID, "", whiteColorID
			local keepGoing = false

			if creator then
				local handler = self.handlers[creator]
				local defaults = handler and handler.noteDefaults
				if type(defaults) ~= "table" then
					defaults = nil
				end
				local data = rawget(self.externalDBs[creator], zone)
				if handler and handler.IsTracking and handler:IsTracking(zone,id,data) then
					FAKE_TRACK[creator] = true
				elseif FAKE_TRACK[creator] then
					FAKE_TRACK[creator] = nil
				end
				if not data then
					keepGoing = true
				else
					data = rawget(data, id)
					if not data then
						keepGoing = true
					elseif handler and handler.IsNoteHidden and handler:IsNoteHidden(zone, id, data) then
						keepGoing = true
					elseif handler and handler.IsMiniNoteHidden and handler:IsMiniNoteHidden(zone,id,data) then
						keepGoing = true
					elseif handler and handler.GetNoteIcon then
						note_icon = handler:GetNoteIcon(zone,id,data)
						if type(note_icon) ~= 'string' then note_icon = nil end
					end
				end
				if keepGoing and rawget(minimapPois, id) then
					minimapPois:del(id)
				elseif defaults then
					default_titleCol = defaults.titleCol or whiteColorID
					default_info = defaults.info or ""
					default_infoCol = defaults.infoCol or whiteColorID
					default_info2 = defaults.info2 or ""
					default_info2Col = defaults.info2Col or whiteColorID
				end
			end
			if not keepGoing then
				local poi = minimapPois[id]
				poi.zone = zone
				local icon
				local creator = db or data.creator or ""
				if type(data) == "string" then
					poi.title = getIconTitle(data)
					poi.titleCol = default_titleCol
					poi.info = default_info
					poi.infoCol = default_infoCol
					poi.info2 = default_info2
					poi.info2Col = default_info2Col
					poi.manual = false
					icon = note_icon or data
				else
					poi.title = data.title or getIconTitle(data.icon)
					poi.titleCol = data.titleCol or default_titleCol
					poi.info = data.info or default_info
					poi.infoCol = data.infoCol or default_infoCol
					poi.info2 = data.info2 or default_info2
					poi.info2Col = data.info2Col or default_info2Col
					poi.manual = data.manual or false
					icon = note_icon or data.icon
				end
				poi.creator = creator
				poi.id = id
				poi.icon = icon
				if self.developing == creator then
					poi.manual = true
				end
				if creator and (creator == TRACK[lastTracking] or FAKE_TRACK[creator]) then
					local poiX, poiY = Cartographer:PointToYards(x, y)
					local diffX = lastX - poiX
					local diffY = lastY - poiY
					local distance_2 = diffX*diffX + diffY*diffY
					if distance_2 <= 100^2 then
						icon = path .. "TrackCircle"
					end
				end

				poi:SetParent(Minimap)
				if type(icon) == "string" and icon:find("^Interface\\") then
					poi:SetWidth(16*self.db.profile.minimapIconSize)
					poi:SetHeight(16*self.db.profile.minimapIconSize)
					poi:SetAlpha(1)
					poi.texture:SetTexture(icon)
					if icon:find("^Interface\\Icons\\") then
						poi.texture:SetTexCoord(0.05, 0.95, 0.05, 0.95)
					else
						poi.texture:SetTexCoord(0, 1, 0, 1)
					end
				else
					local t = icons[icon]
					if not t then
						t = icons.Unknown
					end
					poi:SetWidth(t.width*self.db.profile.minimapIconSize)
					poi:SetHeight(t.height*self.db.profile.minimapIconSize)
					poi:SetAlpha(t.alpha)
					poi.texture:SetTexture(t.path)
					poi.texture:SetTexCoord(t.cLeft, t.cRight, t.cTop, t.cBottom)
				end
				poi:Show()
			end
		end
		if db == nil then
			break
		end
	end
end

local Minimap = Minimap
local rotateMinimap = GetCVar("rotateMinimap") == "1"
local lastX, lastY, lastFacing = 1/0, 1/0, 1/0
function Cartographer_Notes:UpdateMinimapIcons()
	if isInInstance then
		return
	end
	local x_, y_ = Cartographer:GetCurrentPlayerPosition()
	if not x_ or not y_ or x_ < 0 or x_ > 1 or y_ < 0 or y_ > 1 then
		for id in pairs(minimapPois) do
			minimapPois:del(id)
		end
		return
	end
	local x, y = Cartographer:PointToYards(x_, y_)
	if not x then
		return
	end
	local zoom = Minimap:GetZoom()
	local diffZoom = zoom ~= lastZoom
	local tracking = GetTrackingTexture()
	local diffTracking = tracking ~= lastTracking
	local GetMinimapShape = GetMinimapShape
	local minimapShape = GetMinimapShape and GetMinimapShape() or "ROUND"
	local facing
	if rotateMinimap then
		facing = GetPlayerFacing()
	else
		facing = lastFacing
	end
	if diffZoom or diffTracking or x ~= lastX or y ~= lastY or facing ~= lastFacing or forceNextMinimapUpdate then
		lastZoom = zoom
		lastTracking = tracking
		lastFacing = facing
		local Minimap_Width = Minimap:GetWidth()/2
		lastX, lastY = x, y
		CheckToUpdateMinimapIcons(x_, y_, x, y, diffZoom)
		local radius = MinimapSize[indoors][lastZoom]

		for id, poi in pairs(minimapPois) do
			if id ~= 'del' then
				local px, py = Cartographer:PointToYards(getXY(id))
				local dx, dy = px - x, py - y
				if rotateMinimap then
					local sin = math.sin(facing)
					local cos = math.cos(facing)
					dx, dy = dx*cos - dy*sin, dx*sin + dy*cos
				end
				local diffX = dx / radius
				local diffY = dy / radius
				local dist
				local alpha = 1
				local round = true
				if minimapShape == "ROUND" then
					-- do nothing
				elseif minimapShape == "SQUARE" then
					round = false
				elseif minimapShape == "CORNER-TOPRIGHT" then
					if diffX < 0 or diffY > 0 then
						round = false
					end
				elseif minimapShape == "CORNER-TOPLEFT" then
					if diffX > 0 or diffY > 0 then
						round = false
					end
				elseif minimapShape == "CORNER-BOTTOMRIGHT" then
					if diffX < 0 or diffY < 0 then
						round = false
					end
				elseif minimapShape == "CORNER-BOTTOMLEFT" then
					if diffX > 0 or diffY < 0 then
						round = false
					end
				elseif minimapShape == "SIDE-LEFT" then
					if diffX > 0 then
						round = false
					end
				elseif minimapShape == "SIDE-RIGHT" then
					if diffX < 0 then
						round = false
					end
				elseif minimapShape == "SIDE-TOP" then
					if diffY > 0 then
						round = false
					end
				elseif minimapShape == "SIDE-BOTTOM" then
					if diffY < 0 then
						round = false
					end
				elseif minimapShape == "TRICORNER-TOPRIGHT" then
					if diffX < 0 and diffY > 0 then
						round = false
					end
				elseif minimapShape == "TRICORNER-TOPLEFT" then
					if diffX > 0 and diffY > 0 then
						round = false
					end
				elseif minimapShape == "TRICORNER-BOTTOMRIGHT" then
					if diffX < 0 and diffY < 0 then
						round = false
					end
				elseif minimapShape == "TRICORNER-BOTTOMLEFT" then
					if diffX > 0 and diffY < 0 then
						round = false
					end
				end
				if round then
					dist = (diffX*diffX + diffY*diffY) / 0.9^2
				else
					dist = math.max(diffX*diffX, diffY*diffY) / 0.9^2
				end
				if dist > 1 then
					dist = dist^0.5
					diffX = diffX/dist
					diffY = diffY/dist
					alpha = 2 - dist*0.9
				end
				poi:SetPoint("CENTER", Minimap, "CENTER", diffX * Minimap_Width, -diffY * Minimap_Width)
				poi:SetAlpha(alpha)
			end
		end
	end
end

function Cartographer_Notes:configureYards()
	forceNextMinimapUpdate = true
	isInInstance = Tourist:IsInstance(GetRealZoneText())
	if isInInstance then
		for k,v in pairs(minimapPois) do
			minimapPois:del(k)
		end
	end
end

function Cartographer_Notes:MINIMAP_ZONE_CHANGED()
	self:configureYards()
end

function Cartographer_Notes:MINIMAP_UPDATE_ZOOM()
	forceNextMinimapUpdate = true
	local zoom = Minimap:GetZoom()
	if GetCVar("minimapZoom") == GetCVar("minimapInsideZoom") then
		Minimap:SetZoom(zoom < 2 and zoom + 1 or zoom - 1)
	end
	indoors = GetCVar("minimapZoom")+0 == Minimap:GetZoom() and "outdoor" or "indoor"
	Minimap:SetZoom(zoom)
	self:MINIMAP_ZONE_CHANGED()
end

function Cartographer_Notes:ZONE_CHANGED_NEW_AREA()
	self:PLAYER_LEAVING_WORLD()
	self:MINIMAP_UPDATE_ZOOM()
	self:MINIMAP_ZONE_CHANGED()
end

function Cartographer_Notes:PLAYER_LEAVING_WORLD()
	for k,v in pairs(minimapPois) do
		minimapPois:del(k)
	end
	forceNextMinimapUpdate = true
end

function Cartographer_Notes:CVAR_UPDATE(caller, event, cvar, value)
	if cvar == "ROTATE_MINIMAP" then
		rotateMinimap = value == "1"
	end
end

local bs = AceLibrary("Babble-Spell-2.2")
local BZ = AceLibrary("Babble-Zone-2.2")
local AceAddon = AceLibrary("AceAddon-2.0")
local Tablet = AceLibrary("Tablet-2.0")

local L = AceLibrary("AceLocale-2.2"):new("Cartographer_Treasure")
L:RegisterTranslations("enUS", function() return {
	["Filter"] = true,
	["Filter out treasure"] = true,	
	["Select all"] = true,
	["Select none"] = true,
	
    ["Treasure"] = true,
	["Module description"] = "Treasure mapnotes for Cartographer (based on Cartographer_Mining by kergoth)",
  
    ["Icon alpha"] = true,
	["Alpha transparency of the icon"] = true,
	["Icon size"] = true,
	["Size of the icons on the map"] = true,
	["Show minimap icons"] = true,
	["Show treasure icons on the minimap"] = true,
	-- Icons
	["Box"] = true,
	["Chest"] = true,
	["Clam"] = true,
	["Barrel"] = true,
	["Shellfish"] = true,
	["Footlocker"] = true,
	["Blood"] = true,
	["Soil"] = true,
	["Sprout"] = true,
	["Crystal"] = true,
	-- Added 6 - 1 - 07
	["Heart"] = true,
	["Mushroom"] = true,
	["Egg"] = true,
	["Diamond"] = true,
	
	-- Descriptive/Menu names
	["Blood of Heroes"] = true,
	["Hero"] = true,
	["Un'Goro Dirt Pile"] = true,
	["Bloodpetal Sprout"] = true,
	["Power Crystal"] = true,
	["Food Crate"] = true,
	["Drink Barrel"] = true,
	["Shellfish Trap"] = true,
	["Giant Clam"] = true,
	["Un'Goro Power Crystal"] = true,
	["Night Dragon's Breath"] = true,
	["Nightdragon"] = true,
	["Whipper Root Tuber"] = true,
	["Whipper Root"] = true,
	["Windblossom Berries"] = true,
	["SongFlower"] = true,
	["Songflower"] = true,
	-- added 6-1-2007
	["Spore Sac"] = true,
	["Netherwing Egg"] = true,
	["Oshu'gun Crystal Fragment"] = true,
	["Apexis Shard Formation"] = true,
	
	-- missing nodes
	["Cleansed Songflower"] = true,
	["Cleansed Whipper Root"] = true,
	["Cleansed Windblossom"] = true,
	["Cleansed Night Dragon"] = true,
	--
	
	-- regex needs
	["Crate"] = true,
	["Cask"] = true,
	["Dirt Pile"] = true,
	--- Various treasure found around the world
	["Solid Chest"] = true,
	["Battered Footlocker"] = true,
	["Food Crate"] = true,
	["Barrel Of Melon Juice"] = true,
	["Horde Supply Crate"] = true,
	["Document Chest"] = true,
	["Damaged Chest"] = true,
	["Alliance Chest"] = true,
	["Barrel Of Sweet Nectar"] = true,
	["Trelane's Chest"] = true,
	["Battered Chest"] = true,
	["Barrel Of Milk"] = true,
	["Box of Assorted Parts"] = true,
	["Broken Barrel"] = true,
	["Alexston's Chest"] = true,
	["Excavation Supply Crate"] = true,
	["Chest Of Containment Coffers"] = true,
	["Karnitol's Chest"] = true,
	["Malem Chest"] = true,
	["Water Barrel"] = true,
	["Perrine's Chest"] = true,
	["Weapon Crate"] = true,
	["Crate With Holes"] = true,
	["Stolen Iron Chest"] = true,
	["Armor Crate"] = true,
	["Marvon's Chest"] = true,
	["Scattered Crate"] = true,
	["Caravan Chest"] = true,
	["Mossy Footlocker"] = true,
	["Worn Wooden Chest"] = true,
	["Arena Treasure Chest"] = true,
	["Abercrombie's Crate"] = true,
	["Rusty Chest"] = true,
	["Marshal Haggard's Chest"] = true,
	["Sealed Supply Crate"] = true,
	["Damaged Crate"] = true,
	["Gizmorium Shipping Crate"] = true,
	["Shay's Chest"] = true,
	["Kerlonian's Chest"] = true,
	-- submitted additions
	["Alliance Strongbox"] = true,
	["Ambermill Strongbox"] = true,
	["Venture Co. Strongbox"] = true,
	["Buccaneer's Strongbox"] = true,
	["Practice Lockbox"] = true,
	["Burial Chest"] = true,
	["Primitive Chest"] = true,
	["Lucius's Lockbox"] = true,
	["Duskwood Chest"] = true,
	["Gallywix's Lockbox"] = true,
	["Benedict's Chest"] = true,
	["Wicker Chest"] = true,
	["Oshu'gun Crystal Fragment"] = true,
	["Mature Spore Sac"] = true,
	["Glowcap"] = true,
	["Netherwing Egg"] = true,
	["Apexis Shard Formation"] = true,	
	
} end)

L:RegisterTranslations("deDE", function() return {
	["Filter"] = "Filter",
	["Filter out treasure"] = "Filtere Sch\195\164tze",	
	["Select all"] = "Alle ausw\195\164hlen",
	["Select none"] = "Nichts ausw\195\164hlen",
	
  ["Treasure"] = "Sch\195\164tze",
	["Module description"] = "Notizen von Schatzfundorten f\195\188r Cartographer (basiert auf Cartographer_Mining von kergoth)",
  
  ["Icon alpha"] = "Transparenz",
	["Alpha transparency of the icon"] = "Transparenz der Symbole.",
	["Icon size"] = "Symbolgr\195\182\195\159e",
	["Size of the icons on the map"] = "Gr\195\182\195\159e der Symbole auf der Weltkarte.",
	["Show minimap icons"] = "Minimap-Symbole anzeigen",
	["Show treasure icons on the minimap"] = "Schatzsymbole auf der Minimap anzeigen.",
  
  -- Icons
	["Box"] = "Kiste",
  ["Chest"] = "Truhe",
	["Clam"] = "Muschel",
	["Barrel"] = "Fass",
	["Shellfish"] = "Schalentier",
	["Footlocker"] = "Schlie\195\159kiste",
	["Blood"] = "Blut",
	["Soil"] = "Erde",
	["Sprout"] = "Spr\195\182ssling",
	["Crystal"] = "Kristall",
  
  -- Descriptive/Menu names
	["Blood of Heroes"] = "Blut von Helden",
	["Un'Goro Dirt Pile"] = "Un'Goro-Erdhaufen",
	["Bloodpetal Sprout"] = "Blutbl\195\188tenspr\195\182ssling",
	["Power Crystal"] = "Machtkristall",
	["Food Crate"] = "Lebensmittelkiste",
	["Drink Barrel"] = "Fass mit Getr\195\164nken", -- check
	["Shellfish Trap"] = "Schalentierfalle",
	["Giant Clam"] = "Riesenmuschel",
	["Un'Goro Power Crystal"] = "Un'Goro-Machtkristall", --check
	["Night Dragon's Breath"] = "Nachtdrachenodem",
	["Nightdragon"] = "Nachtdrache",
	["Whipper Root Tuber"] = "Peitscherwurzelknollen",
	["Whipper Root"] = "Peitscherwurzel",
	["Windblossom Berries"] = "Windbl\195\188tenbeeren",
	["SongFlower"] = "Liedblume",
	["Songflower"] = "Liedblume",
	-- regex needs
	["Crate"] = "Kiste",
	["Cask"] = "Fass",
	["Dirt Pile"] = "Erdhaufen",
 
    ["Cleansed Songflower"] = "Ges\195\164uberte Liedblume",
    ["Cleansed Whipper Root"] = "Ges\195\164uberte Peitscherwurzel",
    ["Cleansed Windblossom"] = "Ges\195\164uberte Windblüte",
	--- Various treasure found around the world
	["Solid Chest"] = "Robuste Truhe",
	-- not sure which translation is correct, buffed.de lists two (blizzard changed some names some times)
	--    ["Battered Footlocker"] = "Ramponierte Schlie\195\159kiste",
	--  ["Battered Footlocker"] = "Verbeulte Schlie\195\159kiste",

	["Food Crate"] = "Nahrungsmittelkiste",
	["Barrel Of Melon Juice"] = "Fass Melonensaft",
	["Horde Supply Crate"] = "Horde Vorratskiste",
	["Document Chest"] = "Dokumententruhe",
	["Damaged Chest"] = "Besch\195\164digte Truhe",
 	["Alliance Chest"] = "Truhe der Allianz",
	["Barrel Of Sweet Nectar"] = "Fass mit s\195\188\195\159em Nektar",
	--   ["Trelane's Chest"] = true,
	["Battered Chest"] = "Ramponierte Truhe",
	["Barrel Of Milk"] = "Fass mit Milch",
	["Box of Assorted Parts"] = "Kasten mit verschiedenen Ersatzteilen",
	["Broken Barrel"] = "Zerbrochenes Fass",
	["Alexston's Chest"] = "Alexstons Truhe",
    -- not sure which translation is correct, buffed.de lists two (blizzard changed some names some times)
 	["Excavation Supply Crate"] = "Ausgrabungsgrundbedarfskiste",	
   	-- ["Chest Of Containment Coffers"] = true,
  ["Karnitol's Chest"] = "Karnitols Truhe",
  ["Malem Chest"] = "Malem-Truhe",	
	["Water Barrel"] = "Wasserfass",
	["Perrine's Chest"] = "Perrines Truhe",
	["Weapon Crate"] = "Waffenkiste",
	["Crate With Holes"] = "Kiste mit L\195\182chern",
	["Stolen Iron Chest"] = "Gestohlene Eisentruhe",
	["Armor Crate"] = "R\195\188stungskiste",
	["Marvon's Chest"] = "Marvons Truhe",
	["Scattered Crate"] = "Verstreute Kiste",
	-- ["Caravan Chest"] = true,
	["Mossy Footlocker"] = "Moosbedeckte Schlie\195\159kiste",
	["Worn Wooden Chest"] = "Abgenutzte Holztruhe",

	-- not sure which translation is correct, buffed.de lists two (blizzard changed some names some times)
	-- ["Arena Treasure Chest"] = "Arena-Schatztruhe",
	-- ["Arena Treasure Chest"] = "Arenaschatztruhe",

	["Abercrombie's Crate"] = "Abercrombies Kiste",
	["Rusty Chest"] = "Rostige Truhe",
	["Marshal Haggard's Chest"] = "Truhe von Marshal Haggard",
	-- ["Sealed Supply Crate"] = true,
	["Damaged Crate"] = "Besch\195\164digte Kiste",
	["Gizmorium Shipping Crate"] = "Gizmorium-Transportkiste",
	["Shay's Chest"] = "Shays Truhe",
	["Kerlonian's Chest"] = "Kerlonians Truhe",
} end)


L:RegisterTranslations("frFR", function() return {
   ["Filter"] = "filtrer",
   ["Filter out treasure"] = "filtrer les tr\195\169sors",   
   ["Select all"] =  "Tout selectionner",
   ["Select none"] = "Rien selectionner",
   
  ["Treasure"] = "tr\195\169sors et consommables",
   ["Module description"] = "Notes Cartographe pour les tr\195\169sors et consommables (based on Cartographer_Mining by kergoth)",
 
  ["Icon alpha"] = "alpha icone",
   ["Alpha transparency of the icon"] = "transparence alpha de l'icone",
   ["Icon size"] = "taille de l'icone",
   ["Size of the icons on the map"] = "taille des icones sur la carte",
   
   -- Icons
   ["Box"] = "Boite",
   ["Chest"] = "Coffre",
   ["Clam"] = "Palourde",
   ["Barrel"] = "Baril",
   ["Shellfish"] = "Crustac\195\169s",
   ["Footlocker"] = "Pi\195\168ge",
   ["Blood"] = "Sang",
   ["Soil"] = "Tas de poussi\195\168re",
   ["Sprout"] = "Pousse",
   ["Crystal"] = "Cristal",


   -- Descriptive/Menu names
   ["Blood of Heroes"] = "Sang des h\195\169ros",
   ["Hero"] = "h\195\169ro",
   ["Un'Goro Dirt Pile"] = "Tas de poussi\195\168re d'Un'Goro",
   ["Bloodpetal Sprout"] = "Pousse de P\195\169tale-de-sang",
   ["Power Crystal"] = "Cristal de puissance",
   ["Food Crate"] = "Caisse de nourriture",
   ["Drink Barrel"] = "Barrique de boisson",
   ["Shellfish Trap"] = "Pi\195\168ge a crustac\195\169s",
   ["Giant Clam"] = "Palourde g\195\169ante",
   ["Un'Goro Power Crystal"] = "Cristal de puissance d'Ungoro",
   ["Night Dragon's Breath"] = "Souffle de dragon nocturne",
   ["Nightdragon"] = "Dragon nocturne",
   ["Whipper Root Tuber"] = "Tubercule de navetille",
   ["Whipper Root"] = "Navetille",
   ["Windblossom Berries"] = "Baies de fleur-de-vent",
   ["SongFlower"] = "Fleur-de-chant",
   ["Songflower"] = "Fleur de chant",
   -- regex needs
   ["Crate"] = "Caisse",
   ["Cask"] = "Tonneau",
   ["Dirt Pile"] = "Pile de d\195\169chets",
   
} end)

L:RegisterTranslations("esES", function() return {
	["Filter"] = "Filtrar",
	["Filter out treasure"] = "Filtra tesoros",
	["Select all"] = "Seleccionar todo",
	["Select none"] = "No seleccionar nada",
        
        ["Treasure"] = "Tesoro",
	["Module description"] = "Notas de mapa de tesoros para Cartographer (basado en Cartographer_Mining por kergoth)",
        
        ["Icon alpha"] = "Transparencia de icono",
	["Alpha transparency of the icon"] = "Transparencia del icono",
	["Icon size"] = "Tama\195\177o del icono",
	["Size of the icons on the map"] = "Tama\195\177o de los iconos en el mapa",
        ["Show minimap icons"] = "Mostrar iconos en minimapa",
        ["Show treasure icons on the minimap"] = "Muestra los iconos de tesoros en el minimapa",

	-- Icons
	["Box"] = "Caja",
	["Chest"] = "Cofre",
	["Clam"] = "Almeja",
	["Barrel"] = "Barril",
	["Shellfish"] = "Marisco",
	["Footlocker"] = "Ba\195\186l",
	["Blood"] = "Sangre",
	["Soil"] = "Tierra",
	["Sprout"] = "Brote",
	["Crystal"] = "Cristal",
	["Nightdragon"] = "Drag\195\179n nocturno",
	["Songflower"] = "Melod\195\173a",

	-- Descriptive/Menu names
	["Blood of Heroes"] = "Sangre de Heroes",
	["Hero"] = "H\195\169roe",
	["Un'Goro Dirt Pile"] = "Mont\195\179n de porquer\195\173a de Un'Goro",  
	["Bloodpetal Sprout"] = "Brote p\195\169talo de sangre",
	["Power Crystal"] = "Cristal de poder",
	["Food Crate"] = "Caj\195\179n de comida", 
	["Drink Barrel"] = "Barril de bebida",   -- check
	["Shellfish Trap"] = "Concha trampa", 
	["Giant Clam"] = "Almeja gigante",
	["Un'Goro Power Crystal"] = "Cristal de poder de Un'Goro",
	["Night Dragon's Breath"] = "Aliento de Drag\195\179n nocturno",
	["Nightdragon"] = "Drag\195\179n nocturno",
	["Whipper Root Tuber"] = "Tub\195\169rculo de blancoria",
	["Whipper Root"] = "Blancoria",
	["Windblossom Berries"] = "Frutos de la flor del viento",
	["SongFlower"] = "Melod\195\173a",
	["Songflower"] = "Melod\195\173a",
	-- regex needs
	["Crate"] = "Caj\195\179n", 
	["Cask"] = "Barril",     -- check
	["Dirt Pile"] = "Mont\195\179n de porquer\195\173a",  
	--- Various treasure found around the world
	["Solid Chest"] = "Cofre macizo",
	["Battered Footlocker"] = "Ba\195\186l abollado",
	["Food Crate"] = "Caj\195\179n de comida",
	["Barrel Of Melon Juice"] = "Barril de zumo de mel\195\179n",
--	["Horde Supply Crate"] = true,
	["Document Chest"] = "Cofre de documentos",
	["Damaged Chest"] = "Cofre maltrecho",
	["Alliance Chest"] = "Cofre de la Alianza",
--	["Barrel Of Sweet Nectar"] = true,
--	["Trelane's Chest"] = true,
	["Battered Chest"] = "Cofre abollado",
	["Barrel Of Milk"] = "Barril de leche",
	["Box of Assorted Parts"] = "Caja de colección de piezas",
	["Broken Barrel"] = "Barril roto",
--	["Alexston's Chest"] = true,
--	["Excavation Supply Crate"] = true,
--	["Chest Of Containment Coffers"] = true,
--	["Karnitol's Chest"] = true,
--	["Malem Chest"] = true,
	["Water Barrel"] = "Barril de agua",
--	["Perrine's Chest"] = true,
	["Weapon Crate"] = "Caj\195\179n de armas", -- check
--	["Crate With Holes"] = true,
--	["Stolen Iron Chest"] = true,
	["Armor Crate"] = "Caj\195\179n de armaduras",
--	["Marvon's Chest"] = true,
--	["Scattered Crate"] = true,
--	["Caravan Chest"] = true,
	["Mossy Footlocker"] = "Ba\195\186l mohoso", 
--	["Worn Wooden Chest"] = true,
	["Arena Treasure Chest"] = "Arqueta de la arena",
--	["Abercrombie's Crate"] = true,
--	["Rusty Chest"] = true,
--	["Marshal Haggard's Chest"] = true,
--	["Sealed Supply Crate"] = true,
	["Damaged Crate"] = "Caj\195\179n maltrecho", -- check
--	["Gizmorium Shipping Crate"] = true,
--	["Shay's Chest"] = true,
--	["Kerlonian's Chest"] = true,

	
} end)

L:RegisterTranslations("koKR", function() return {
	["Filter"] = "항목 분류",
	["Filter out treasure"] = "보물을 항목에 따라 분류하여 표시합니다.",	
	["Select all"] = "모두 선택",
	["Select none"] = "선택 해제",

	["Treasure"] = "보물",
	["Module description"] = "맵노트에 보물을 표시합니다.",

	["Icon alpha"] = "아이콘 투명도",
	["Alpha transparency of the icon"] = "아이콘의 투명도를 조절합니다.",
	["Icon size"] = "아이콘 크기",
	["Size of the icons on the map"] = "아이콘의 크기를 조절합니다.",

	["Show minimap icons"] = "미니맵 아이콘 표시",
	["Show treasure icons on the minimap"] = "미니맵에 보물 아이콘을 표시합니다.",

	-- Icons
	["Box"] = "상자",
	["Chest"] = "궤짝",
	["Clam"] = "조개",
	["Barrel"] = "음료",
	["Shellfish"] = "통발",
	["Footlocker"] = "사물함",
	["Blood"] = "피",
	["Soil"] = "토양",
	["Sprout"] = "씨앗",
	["Crystal"] = "수정",
	
	-- Descriptive/Menu names
	["Blood of Heroes"] = "영웅의 피",
--	["Hero"] = true,
	["Un'Goro Dirt Pile"] = "운고로 흙더미",
	["Bloodpetal Sprout"] = "붉은꽃잎 씨앗",
	["Power Crystal"] = "마력의 수정",
	["Food Crate"] = "음식 상자",
	["Drink Barrel"] = "물통",
	["Shellfish Trap"] = "가재 통발",
	["Giant Clam"] = "대합",
	["Un'Goro Power Crystal"] = "운고로 마력의 수정",
	["Night Dragon's Breath"] = "어둠용의 숨결",
	["Nightdragon"] = "어둠용",
	["Whipper Root Tuber"] = "채찍뿌리 줄기",
	["Whipper Root"] = "채찍뿌리",
	["Windblossom Berries"] = "바람꽃 열매",
	["SongFlower"] = "노래꽃",
	["Songflower"] = "노래꽃",

	-- missing nodes
	["Cleansed Songflower"] = "정화된 노래꽃",
	["Cleansed Whipper Root"] = "정화된 채찍뿌리 줄기",
	["Cleansed Windblossom"] = "정화된 바람꽃",
	["Cleansed Night Dragon"] = "정화된 어둠용의 숨결",
	
	-- regex needs
	["Crate"] = "바구니",
	["Cask"] = "통",
	["Dirt Pile"] = "흙더미",

	--- Various treasure found around the world
--	["Solid Chest"] = true,
--	["Battered Footlocker"] = true,
--	["Food Crate"] = true,
--	["Barrel Of Melon Juice"] = true,
--	["Horde Supply Crate"] = true,
--	["Document Chest"] = true,
--	["Damaged Chest"] = true,
--	["Alliance Chest"] = true,
--	["Barrel Of Sweet Nectar"] = true,
--	["Trelane's Chest"] = true,
--	["Battered Chest"] = true,
--	["Barrel Of Milk"] = true,
--	["Box of Assorted Parts"] = true,
--	["Broken Barrel"] = true,
--	["Alexston's Chest"] = true,
--	["Excavation Supply Crate"] = true,
--	["Chest Of Containment Coffers"] = true,
--	["Karnitol's Chest"] = true,
--	["Malem Chest"] = true,
--	["Water Barrel"] = true,
--	["Perrine's Chest"] = true,
--	["Weapon Crate"] = true,
--	["Crate With Holes"] = true,
--	["Stolen Iron Chest"] = true,
--	["Armor Crate"] = true,
---	["Marvon's Chest"] = true,
--	["Scattered Crate"] = true,
--	["Caravan Chest"] = true,
--	["Mossy Footlocker"] = true,
--	["Worn Wooden Chest"] = true,
--	["Arena Treasure Chest"] = true,
--	["Abercrombie's Crate"] = true,
--	["Rusty Chest"] = true,
--	["Marshal Haggard's Chest"] = true,
--	["Sealed Supply Crate"] = true,
--	["Damaged Crate"] = true,
--	["Gizmorium Shipping Crate"] = true,
--	["Shay's Chest"] = true,
--	["Kerlonian's Chest"] = true,

} end)

L:RegisterTranslations("zhTW", function() return {
	["Filter"] = "篩檢",
	["Filter out treasure"] = "篩檢寶箱",	
	["Select all"] = "全選",
	["Select none"] = "全不選",
	
    ["Treasure"] = "寶箱",
	["Module description"] = "在地圖上註記寶箱位置",
  
    ["Icon alpha"] = "標示透明度",
	["Alpha transparency of the icon"] = "標記透明度",
	["Icon size"] = "標示大小",
	["Size of the icons on the map"] = "地圖上的寶箱標記大小",
	["Show minimap icons"] = "顯示小地圖標記",
	["Show treasure icons on the minimap"] = "在小地圖上顯示寶箱標記",
	-- Icons
	["Box"] = "盒子",
	["Chest"] = "箱子",
	["Clam"] = "蚌殼",
	["Barrel"] = "桶子",
	["Shellfish"] = "貝殼",
	["Footlocker"] = "手提箱",
	["Blood"] = "血",
	["Soil"] = "泥土",
	["Sprout"] = "花苗",
	["Crystal"] = "水晶",
	
	-- Descriptive/Menu names
	["Blood of Heroes"] = "英雄之血",
--	["Hero"] = "英雄",
	["Un'Goro Dirt Pile"] = "安戈落泥土堆",
--	["Bloodpetal Sprout"] = "",
	["Power Crystal"] = "血瓣花苗",
	["Food Crate"] = "食物箱",
	["Drink Barrel"] = "飲料桶",
	["Shellfish Trap"] = "貝殼陷阱",
	["Giant Clam"] = "巨型蚌殼",
	["Un'Goro Power Crystal"] = "安戈落能量水晶",
	["Night Dragon's Breath"] = "夜龍之息",
	["Nightdragon"] = "夜龍之息",
	["Whipper Root Tuber"] = "鞭根塊莖",
	["Whipper Root"] = "鞭根塊莖",
	["Windblossom Berries"] = "風花果",
	["SongFlower"] = "輕歌花",
	["Songflower"] = "輕歌花",
	
	-- missing nodes
	["Cleansed Songflower"] = "被淨化的輕歌花", --check
	["Cleansed Whipper Root"] = "被淨化的鞭根塊莖", --check
	["Cleansed Windblossom"] = "被淨化的風花果", --check
	["Cleansed Night Dragon"] = "被淨化的夜龍之息", --check
	--
	
	-- regex needs
	["Crate"] = "箱",
	["Cask"] = "桶",
	["Dirt Pile"] = "泥土堆",
	--- Various treasure found around the world
	["Solid Chest"] = "堅固的箱子",
--	["Battered Footlocker"] = "破損的手提箱", --check
	["Food Crate"] = "食物箱",
	["Barrel Of Melon Juice"] = "一桶果汁",
	["Horde Supply Crate"] = "部落補給箱",
	["Document Chest"] = "文件箱",
--	["Damaged Chest"] = "受損的箱子", --check
	["Alliance Chest"] = "聯盟寶箱", --check
	["Barrel Of Sweet Nectar"] = "一桶蜂蜜酒",
--	["Trelane's Chest"] = "",
	["Battered Chest"] = "破損的箱子",
	["Barrel Of Milk"] = "一桶牛奶",
	["Box of Assorted Parts"] = "一箱整理過的零件",
--	["Broken Barrel"] = "破碎的桶子", --check
--	["Alexston's Chest"] = "",
--	["Excavation Supply Crate"] = "",
	["Chest Of Containment Coffers"] = "一盒封靈箱",
--	["Karnitol's Chest"] = "",
--	["Malem Chest"] = "",
	["Water Barrel"] = "水桶",
--	["Perrine's Chest"] = "",
	["Weapon Crate"] = "武器箱",
	["Crate With Holes"] = "開孔的箱子",
--	["Stolen Iron Chest"] = "",
--	["Armor Crate"] = "",
--	["Marvon's Chest"] = "",
	["Scattered Crate"] = "破爛的箱子",
	["Caravan Chest"] = "被遺棄的商隊箱子", --check
	["Mossy Footlocker"] = "生苔的提箱",
--	["Worn Wooden Chest"] = "",
--	["Arena Treasure Chest"] = "",
	["Abercrombie's Crate"] = "亞伯克隆比的箱子",
	["Rusty Chest"] = "生銹的箱子",
--	["Marshal Haggard's Chest"] = "",
	["Sealed Supply Crate"] = "密封的補給箱", --check
--	["Damaged Crate"] = "",
--	["Gizmorium Shipping Crate"] = "",
--	["Shay's Chest"] = "",
--	["Kerlonian's Chest"] = "",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Filter"] = "筛选",
	["Filter out treasure"] = "宝物筛选.",
	["Select all"] = "全部选择",
	["Select none"] = "全部取消",

	["Treasure"] = "宝物",
	["Module description"] = "Cartographer寻宝专家",

    ["Icon alpha"] = "图标透明度",
	["Alpha transparency of the icon"] = "设定图标的透明度",
	["Icon size"] = "图标大小",
	["Size of the icons on the map"] = "设定图标的大小",
	["Show minimap icons"] = "在小地图上显示",
	["Show treasure icons on the minimap"] = "在小地图上显示寻宝专家图标",

	-- Icons
	["Box"] = "盒子",
	["Chest"] = "箱子",
	["Clam"] = "蚌壳",
	["Barrel"] = "桶子",
	["Shellfish"] = "贝壳",
	["Footlocker"] = "手提箱",
	["Blood"] = "血",
	["Soil"] = "泥土",
	["Sprout"] = "花苗",
	["Crystal"] = "水晶",
	-- Added 6 - 1 - 07
	["Heart"] = "心",
	["Mushroom"] = "蘑菇",
	["Egg"] = "蛋",
	["Diamond"] = "钻石",

	-- Descriptive/Menu names
	["Blood of Heroes"] = "英雄之血",
	["Hero"] = "英雄",
	["Un'Goro Dirt Pile"] = "安戈落泥土堆",
	["Bloodpetal Sprout"] = "血瓣花苗",
	["Power Crystal"] = "能量水晶",
	["Food Crate"] = "食物箱",
	["Drink Barrel"] = "饮料桶",
	["Shellfish Trap"] = "贝壳陷阱",
	["Giant Clam"] = "巨型蚌壳",
	["Un'Goro Power Crystal"] = "安戈落能量水晶",
	["Night Dragon's Breath"] = "夜龙之息",
	["Nightdragon"] = "夜龙之息",
	["Whipper Root Tuber"] = "鞭根块茎",
	["Whipper Root"] = "鞭根块茎",
	["Windblossom Berries"] = "风花果",
	["SongFlower"] = "轻歌花",
	["Songflower"] = "轻歌花",
	-- added 6-1-2007
	["Spore Sac"] = "孢子囊",
	["Netherwing Egg"] = "灵翼龙卵",
	["Oshu'gun Crystal Fragment"] = "沃舒古水晶碎片",
	["Apexis Shard Formation"] = "埃匹希斯碎片簇",

	-- missing nodes
	["Cleansed Songflower"] = "净化过的轻歌花", 
	["Cleansed Whipper Root"] = "净化过的鞭根草", 
	["Cleansed Windblossom"] = "净化过的迎风花", 
	["Cleansed Night Dragon"] = "净化过的夜龙草", 
	--

	-- regex needs
	["Crate"] = "箱",
	["Cask"] = "桶",
	["Dirt Pile"] = "泥土堆",
	--- Various treasure found around the world
	["Solid Chest"] = "坚固的箱子",
	["Battered Footlocker"] = "破碎的提箱", 
	["Food Crate"] = "食物箱",
	["Barrel Of Melon Juice"] = "一桶果汁",
	["Horde Supply Crate"] = "部落补给箱",
	["Document Chest"] = "文件箱",
	["Damaged Chest"] = "破损的箱子", 
	["Alliance Chest"] = "联盟宝箱", --check
	["Barrel Of Sweet Nectar"] = "一桶蜂蜜酒",
	["Trelane's Chest"] = "特雷莱恩的箱子",
	["Battered Chest"] = "破损的箱子",
	["Barrel Of Milk"] = "一桶牛奶",
	["Box of Assorted Parts"] = "一箱整理过的零件",
	["Broken Barrel"] = "破桶", 
	["Alexston's Chest"] = "阿历克斯顿的箱子",
	["Excavation Supply Crate"] = "挖掘场补给箱",
	["Chest Of Containment Coffers"] = "一盒封灵箱",
	["Karnitol's Chest"] = "卡尼托的箱子",
	["Malem Chest"] = "玛雷姆的箱子",
	["Water Barrel"] = "水桶",
	["Perrine's Chest"] = "派瑞恩的箱子",
	["Weapon Crate"] = "武器箱",
	["Crate With Holes"] = "开孔的箱子",
	["Stolen Iron Chest"] = "被偷走的铁箱",
	["Armor Crate"] = "铠甲箱",
	["Marvon's Chest"] = "玛尔冯的箱子",
	["Scattered Crate"] = "破烂的箱子",
	["Caravan Chest"] = "车队箱子", 
	["Mossy Footlocker"] = "生苔的提箱",
	["Worn Wooden Chest"] = "旧木箱",
	["Arena Treasure Chest"] = "竞技场财宝箱",
	["Abercrombie's Crate"] = "亚伯克隆比的箱子",
	["Rusty Chest"] = "生锈的箱子",
	["Marshal Haggard's Chest"] = "哈加德的箱子",
	["Sealed Supply Crate"] = "密封的补给箱", 
	["Damaged Crate"] = "破损的箱子",
	["Gizmorium Shipping Crate"] = "基兹莫瑞货箱",
	["Shay's Chest"] = "沙恩的箱子", --check
	["Kerlonian's Chest"] = "克罗尼亚的箱子",
	-- submitted additions
	["Alliance Strongbox"] = "联盟保险箱",
	["Ambermill Strongbox"] = "安伯米尔保险箱",
	["Venture Co. Strongbox"] = "风险投资公司保险箱",
	["Buccaneer's Strongbox"] = "海盗的保险箱",
	["Practice Lockbox"] = "练习用保险箱",
	["Burial Chest"] = "埋起来的箱子",
	["Primitive Chest"] = "粗糙的箱子",
	["Lucius's Lockbox"] = "卢修斯的箱子",
	["Duskwood Chest"] = "暮色森林的箱子",
	["Gallywix's Lockbox"] = "加里维克斯的保险箱",
	["Benedict's Chest"] = "本尼迪克的箱子",
	["Wicker Chest"] = "柳条箱",
	["Oshu'gun Crystal Fragment"] = "沃舒古水晶碎片",
	["Mature Spore Sac"] = "成熟的孢子囊",
	["Glowcap"] = "亮顶蘑菇",
	["Netherwing Egg"] = "灵翼龙卵",
	["Apexis Shard Formation"] = "埃匹希斯碎片簇",	

} end)

Cartographer_Treasure = Cartographer:NewModule("Treasure", "AceConsole-2.0", "AceEvent-2.0")

-- Filter configuration
Cartographer_Treasure.filter = {
	["Barrel"] = L["Drink Barrel"],
	["Blood"] = L["Blood of Heroes"],
	["Box"] = L["Food Crate"],
	["Chest"] = L["Chest"],
	["Clam"] = L["Giant Clam"],
	["Crystal"] = L["Un'Goro Power Crystal"],
	["Shellfish"] = L["Shellfish Trap"],
	["Footlocker"] = L["Footlocker"],
	["Soil"] = L["Un'Goro Dirt Pile"],
	["Sprout"] = L["Bloodpetal Sprout"],
	["Whipper Root Tuber"] = L["Whipper Root Tuber"],
	["SongFlower"] = L["SongFlower"],
	["Night Dragon's Breath"] = L["Night Dragon's Breath"],
	["Windblossom Berries"] = L["Windblossom Berries"],
	["Egg"] = L["Netherwing Egg"],
	["Heart"] = L["Spore Sac"],
	["Mushroom"] = L["Glowcap"],	
	["Diamond1"] = L["Oshu'gun Crystal Fragment"],
	["Shard"] = L["Apexis Shard Formation"],
}
-- icons for felwood
Cartographer_Treasure.icon_felwood = {
	["Windblossom Berries"] = {
		text = L["Windblossom Berries"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\Berries",
		width = 14,
		height = 14,
	},
	["Night Dragon's Breath"] = {
		text = L["Night Dragon's Breath"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\Sprout",
		width = 14,
		height = 14
	},
	["Whipper Root Tuber"] = {
		text = L["Whipper Root Tuber"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\Tuber",
		width = 14,
		height = 14
	},
	["SongFlower"] = {
		text = L["SongFlower"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\songflower",
		width = 14,
		height = 14
	},	
}
Cartographer_Treasure.icon = {
	["Box"] = {
		text = L["Box"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\Crate",
		width = 14,
		height = 14,
	},
	["Barrel"] = {
		text = L["Barrel"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\Barrel",
		width = 14,
		height = 14
	},
	["Blood"] = {
		text = L["Blood"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\HeroBlood",
		width = 14,
		height = 14
	},
	["Chest"] = {
		text = L["Chest"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\Chest",
		width = 14,
		height = 14
	},
	["Clam"] = {
		text = L["Clam"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\ClamShell",
		width = 14,
		height = 14
	},
	["Crystal"] = {
		text = L["Crystal"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\Crystal",
		width = 14,
		height = 14
	},
	["Shellfish"] = {
		text = L["Shellfish"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\Lobster",
		width = 14,
		height = 14
	},
	["Footlocker"] = {
		text = L["Chest"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\Footlocker",
		width = 14,
		height = 14
	},
	["Soil"] = {
		text = L["Soil"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\Soil",
		width = 14,
		height = 14
	},
	["Sprout"] = {
		text = L["Sprout"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\Sprout",
		width = 14,
		height = 14
	},
	["Heart"] = {
		text = L["Heart"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\Heart",
		width = 14,
		height = 14
	},
	["Egg"] = {
		text = L["Egg"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\ShadowEgg",
		width = 14,
		height = 14
	},
	["Mushroom"] = {
		text = L["Mushroom"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\Mushroom",
		width = 14,
		height = 14
	},
	["Diamond1"] = {
		text = L["Oshu'gun Crystal Fragment"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\Diamond",
		width = 14,
		height = 14
	},
	["Shard"] = {
		text = L["Apexis Shard Formation"],
		path = "Interface\\AddOns\\Cartographer_Treasure\\Artwork\\Shard",
		width = 14,
		height = 14
	},

}
local regex_filter = {
	-- food boxes
	[L["Box"]] = "Box",
	[L["Crate"]] = "Box",
	-- chest goodies
	[L["Chest"]] = "Chest",
	-- underwater clam
	[L["Clam"]] = "Clam",
	-- drink tanks
	[L["Barrel"]] = "Barrel",
	[L["Cask"]] = "Barrel",
	-- Shellfish trap
	[L["Shellfish"]] = "Shellfish",
	-- rogue practice footlockers
	[L["Footlocker"]] = "Footlocker",
	-- EPL/WPL blood
	[L["Blood of Heroes"]] = "Blood",
	[L["Hero"]] = "Blood",
	-- Ungoro
	[L["Un'Goro Dirt Pile"]] = "Soil",
	[L["Dirt Pile"]] = "Soil",
	[L["Bloodpetal Sprout"]] = "Sprout",
	[L["Power Crystal"]] = "Crystal",
	-- Felwood
	[L["Nightdragon"]] = "Night Dragon's Breath",
}
local direct_lookup = {
	["Blood of Heroes"] = "Blood",
	["Un'Goro Dirt Pile"] = "Soil",
	["Bloodpetal Sprout"] = "Sprout",
	["Food Crate"] = "Box",
	["Shellfish Trap"] = "Shellfish",
	["Giant Clam"] = "Clam",
	["Night Dragon's Breath"] = "Night Dragon's Breath",
	["Whipper Root Tuber"] = "Whipper Root Tuber",
	["Windblossom Berries"] = "Windblossom Berries",
	["Cleansed Songflower"] = "SongFlower",
	["Cleansed Whipper Root"] = "Whipper Root Tuber",
	["Cleansed Windblossom"] = "Windblossom Berries",
	["Cleansed Night Dragon"] = "Night Dragon's Breath",
	["SongFlower"] = "SongFlower",
	["Solid Chest"] = "Chest",
	["Battered Footlocker"] = "Footlocker",
	["Food Crate"] = "Box",
	["Barrel Of Melon Juice"] = "Barrel",
	["Horde Supply Crate"] = "Box",
	["Document Chest"] = "Chest",
	["Damaged Chest"] = "Chest",
	["Alliance Chest"] = "Chest",
	["Barrel Of Sweet Nectar"] = "Barrel",
	["Trelane's Chest"] = "Chest",
	["Battered Chest"] = "Chest",
	["Barrel Of Milk"] = "Barrel",
	["Box of Assorted Parts"] = "Box",
	["Broken Barrel"] = "Barrel",
	["Alexston's Chest"] = "Chest",
	["Excavation Supply Crate"] = "Box",
	["Chest Of Containment Coffers"] = "Box",
	["Karnitol's Chest"] = "Chest",
	["Malem Chest"] = "Chest",
	["Water Barrel"] = "Barrel",
	["Perrine's Chest"] = "Chest",
	["Weapon Crate"] = "Box",
	["Crate With Holes"] = "Box",
	["Stolen Iron Chest"] = "Chest",
	["Armor Crate"] = "Box",
	["Marvon's Chest"] = "Chest",
	["Scattered Crate"] = "Box",
	["Caravan Chest"] = "Chest",
	["Mossy Footlocker"] = "Footlocker",
	["Worn Wooden Chest"] = "Chest",
	["Arena Treasure Chest"] = "Chest",
	["Abercrombie's Crate"] = "Box",
	["Rusty Chest"] = "Chest",
	["Marshal Haggard's Chest"] = "Chest",
	["Sealed Supply Crate"] = "Box",
	["Damaged Crate"] = "Box",
	["Gizmorium Shipping Crate"] = "Box",
	["Shay's Chest"] = "Chest",
	["Kerlonian's Chest"] = "Chest",
    ["Alliance Strongbox"] = "Footlocker",
    ["Ambermill Strongbox"] = "Footlocker",
    ["Venture Co. Strongbox"] = "Footlocker",
    ["Buccaneer's Strongbox"] = "Footlocker",
    ["Practice Lockbox"] = "Footlocker",
    ["Burial Chest"] = "Footlocker",
    ["Primitive Chest"] = "Footlocker",
    ["Lucius's Lockbox"] = "Footlocker",
    ["Duskwood Chest"] = "Footlocker",
    ["Gallywix's Lockbox"] = "Footlocker",
    ["Benedict's Chest"] = "Footlocker",
    ["Wicker Chest"] = "Footlocker",
    ["Oshu'gun Crystal Fragment"] = "Diamond1",
    ["Mature Spore Sac"] = "Heart",
    ["Glowcap"] = "Mushroom",
    ["Netherwing Egg"] = "Egg",
    ["Apexis Shard Formation"] = "Shard",		
}
local cache = {}
function Cartographer_Treasure:OnInitialize()
	self.db = Cartographer:AcquireDBNamespace("Treasure")
	Cartographer:RegisterDefaults("Treasure", "profile", {
		filter = {
			['*'] = true,
		},
		iconAlpha = 1,
		iconScale = 1,
		minicons = true,
	})
	-- clear our cache we may have to do some renaming
	
	local aceopts = {}
	aceopts.toggle = {
		name = Cartographer.L["Enabled"],
		desc = Cartographer.L["Suspend/resume this module."],
		type  = 'toggle',
		order = -1,
		get   = function() return Cartographer:IsModuleActive(self) end,
		set   = function() Cartographer:ToggleModuleActive(self) end,
	}
	aceopts.trans = {
		name = L["Icon alpha"],
		desc = L["Alpha transparency of the icon"],
		type = 'range',
		min = 0.1,
		max = 1,
		step = 0.05,
		isPercent = true,
		get = "GetIconAlpha",
		set = "SetIconAlpha",
		order = 1
	}
	aceopts.scal = {
		name = L["Icon size"],
		desc = L["Size of the icons on the map"],
		type = 'range',
		min = 0.5,
		max = 2,
		step = 0.05,
		isPercent = true,
		get = "GetIconScale",
		set = "SetIconScale",
		order = 1
	}
	aceopts.minicons = {
		name = L["Show minimap icons"],
		desc = L["Show treasure icons on the minimap"],
		type = 'toggle',
		set = "ToggleShowingMinimapIcons",
		get = "IsShowingMinimapIcons",
		order = 1,
	}
	aceopts.filter = {
		name = L["Filter"],
		desc = L["Filter out treasure"],
		type = 'group',
		args = {
			all = {
				name = L["Select all"],
				desc = L["Select all"],
				type = 'execute',
				func = function()
					for k in pairs(self.filter) do
						self:ToggleShowingTreasure(k, true)
					end
				end,
				order = 1,
			},
			none = {
				name = L["Select none"],
				desc = L["Select none"],
				type = 'execute',
				func = function()
					for k in pairs(self.filter) do
						self:ToggleShowingTreasure(k, false)
					end
				end,
				order = 2,
			},
			blank = {
				type = 'header',
				order = 3,
			}
		}
	}
	Cartographer.options.args.Treasure = {
		name = L["Treasure"],
		desc = L["Module description"],
		type = 'group',
		args = aceopts,
		handler = self,
	}
	AceLibrary("AceConsole-2.0"):InjectAceOptionsTable(self, Cartographer.options.args.Treasure)

	for k,v in pairs(self.filter) do
		local k = k
		aceopts.filter.args[k] = {
			name = v,
			desc = v,
			type = 'toggle',
			get = function()
				return self:IsShowingTreasure(k)
			end,
			set = function(value)
				return self:ToggleShowingTreasure(k, value)
			end,
		}
	end
	-- Felwood farmer support
	local _, _, _, fenabled, floadable, freason, _ = GetAddOnInfo("FelwoodFarmer")
	if fenabled then
		self.felwood_farmer = true
	else -- no felwdoo farmer instaled
		self.felwood_farmer = false
		Cartographer_Notes:SetNote(BZ["Felwood"],0.49422,0.12180,"Whipper Root Tuber","Treasure",'title',"Whipper Root Tuber")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.40734,0.19131,"Whipper Root Tuber","Treasure",'title',"Whipper Root Tuber")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.50582,0.18256,"Whipper Root Tuber","Treasure",'title',"Whipper Root Tuber")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.43041,0.46959,"Whipper Root Tuber","Treasure",'title',"Whipper Root Tuber")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.34061,0.60232,"Whipper Root Tuber","Treasure",'title',"Whipper Root Tuber")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.40145,0.85222,"Whipper Root Tuber","Treasure",'title',"Whipper Root Tuber")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.50579,0.30435,"Night Dragon's Breath","Treasure",'title',"Night Dragon's Breath")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.42464,0.13907,"Night Dragon's Breath","Treasure",'title',"Night Dragon's Breath")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.35109,0.58927,"Night Dragon's Breath","Treasure",'title',"Night Dragon's Breath")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.40725,0.78261,"Night Dragon's Breath","Treasure",'title',"Night Dragon's Breath")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.55798,0.06958,"Windblossom Berries","Treasure",'title',"Windblossom Berries")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.45367,0.18258,"Windblossom Berries","Treasure",'title',"Windblossom Berries")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.38790,0.21944,"Windblossom Berries","Treasure",'title',"Windblossom Berries")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.44783,0.41744,"Windblossom Berries","Treasure",'title',"Windblossom Berries")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.34343,0.48698,"Windblossom Berries","Treasure",'title',"Windblossom Berries")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.38985,0.59123,"Windblossom Berries","Treasure",'title',"Windblossom Berries")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.36554,0.61964,"Windblossom Berries","Treasure",'title',"Windblossom Berries")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.50005,0.80001,"Windblossom Berries","Treasure",'title',"Windblossom Berries")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.55217,0.23478,"Windblossom Berries","Treasure",'title',"Windblossom Berries")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.57535,0.20001,"Windblossom Berries","Treasure",'title',"Windblossom Berries")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.48260,0.75654,"SongFlower","Treasure",'title',"SongFlower")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.63910,0.06087,"SongFlower","Treasure",'title',"SongFlower")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.45944,0.85223,"SongFlower","Treasure",'title',"SongFlower")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.40145,0.44355,"SongFlower","Treasure",'title',"SongFlower")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.40141,0.56524,"SongFlower","Treasure",'title',"SongFlower")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.34348,0.52178,"SongFlower","Treasure",'title',"SongFlower")		
		Cartographer_Notes:SetNote(BZ["Felwood"],0.63334,0.22611,"SongFlower","Treasure",'title',"SongFlower")		
		Cartographer_Notes:SetNote(BZ["Felwood"],0.50564,0.13916,"SongFlower","Treasure",'title',"SongFlower")		
		Cartographer_Notes:SetNote(BZ["Felwood"],0.52897,0.87822,"SongFlower","Treasure",'title',"SongFlower")
		Cartographer_Notes:SetNote(BZ["Felwood"],0.55780,0.10500,"SongFlower","Treasure",'title',"SongFlower")		
	end
	
	if not Cartographer_TreasureDB then
		Cartographer_TreasureDB = {}
	else
		-- fix up broken notes
		for name, zone in pairs(Cartographer_TreasureDB) do
			if type(zone) == "table" then
				for id, data in pairs(zone) do
					if type(data) == "string" then
						local oname = data
						data = {}
						data.icon = self:getIcon(oname)
						data.title = oname
						zone[id] = data
					else
						if (not data.icon) and data.title then
							data.icon = self:getIcon(data.title)
							if L:HasReverseTranslation(data.title) then
								data.title = L:GetReverseTranslation(data.title)
							end
							zone[id] = data
						elseif (not data.title) and data.icon then
							data.title = data.icon
							data.icon = data.icon
							zone[id] = data
						elseif data.icon and data.title then
							data.icon = self:getIcon(data.title)
							if L:HasReverseTranslation(data.title) then
								data.title = L:GetReverseTranslation(data.title)
							end
							zone[id] = data
						end
					end
				end
			end
		end
	end
end

-- Enable function
function Cartographer_Treasure:OnEnable()
	if Cartographer_Notes then
		self:RegisterEvent("UI_ERROR_MESSAGE")
		self:RegisterEvent("UNIT_SPELLCAST_START")
		self:RegisterEvent("CHAT_MSG_SPELL_SELF_BUFF")
		self:RegisterEvent("LOOT_OPENED")
		if not self.iconsregistered then
			for k,v in pairs(self.icon) do
				Cartographer_Notes:RegisterIcon(k, v)
			end
			if not self.felwood_farmer then
				for k,v in pairs(self.icon_felwood) do
					Cartographer_Notes:RegisterIcon(k,v)
				end
			end
			self.iconsregistered = true
		end
		Cartographer_Notes:RegisterNotesDatabase('Treasure', Cartographer_TreasureDB, self)
	else
		Cartographer:ToggleTreasureActive(self, false)
	end
end

-- Disbale function
function Cartographer_Treasure:OnDisable()
	self:UnregisterAllEvents()
	if Cartographer_Notes then
		Cartographer_Notes:UnregisterNotesDatabase('Treasure')
	end
end

function Cartographer_Treasure:ImportNote(zone,x,y,name)
	local icon = self:getIcon(name)
	if icon then
		Cartographer_Notes:SetNote(zone,x,y,icon,"Treasure",'title',name)
		return true
	end
	return false
end

-- Set the note
function Cartographer_Treasure:SetNote(what,details)
	local x, y = GetPlayerMapPosition("player")
	if x == 0 and y == 0 then return end
	local zone = GetRealZoneText()
	for zone, x_p, y_p, icon, creator, data in Cartographer_Notes:IterateNearbyNotes(zone, x, y, 20, "Treasure", nil, true) do
		if icon == what then
			Cartographer_Notes:DeleteNote(zone, x_p, y_p)
		end
	end
	Cartographer_Notes:SetNote(zone, x, y, what, "Treasure",'title',details)
end

function Cartographer_Treasure:OnNoteTooltipRequest(zone, id, treasure_data, minimap)
	if type(treasure_data) == "table" then
		if L:HasTranslation(treasure_data.title) then
			Tablet:SetTitle(L[treasure_data.title])
		else
			Tablet:SetTitle(treasure_data.title)
		end
	else
		if L:HasTranslation(treasure_data) then
			Tablet:SetTitle(L[treasure_data])
		else
			Tablet:SetTitle(treasure_data)
		end
	end
	Tablet:SetTitleColor(0, 0.8, 0)	
	if Cartographer_Notes:IsShowingCreator() and not minimap then
		Tablet:AddCategory(
			'columns', 2,
			'hideBlankLine', true
		):AddLine(
			'text', Cartographer_Notes.L["Created by"],
			'text2', L["Treasure"]
		)
	end
end

function Cartographer_Treasure:getIcon(item)
	if item and item:len() > 0 then	
		local item = item:gsub("^(.-) %(%d+%)$", "%1")
		if cache[item] then
			return cache[item]
		end
		-- check direct lookup
		if L:HasReverseTranslation(item) and direct_lookup[L:GetReverseTranslation(item)] then
			local icon = direct_lookup[L:GetReverseTranslation(item)]
			cache[item] = icon
			return icon
		end
		for k,v in pairs(regex_filter) do
			if item:match(k) then
				cache[k] = v
				return v
			end
		end
		return nil
	else
		return nil
	end
end

-- regex match
function Cartographer_Treasure:RegisterTreasure(what)
	local icon = self:getIcon(what)
	if icon then
		if what:match(L["Power Crystal"]) then
			what = L["Un'Goro Power Crystal"]
		elseif what:match(L["Whipper Root Tuber"]) then
			what = L["Whipper Root Tuber"]
		elseif what:match(L["Night Dragon's Breath"]) then
			what = L["Night Dragon's Breath"]
		elseif what:match(L["Windblossom Berries"]) then
			what = L["Windblossom Berries"]
		elseif what:match(L["Songflower"]) then
			what = L["SongFlower"]
		elseif what:match(L["SongFlower"]) then
			what = L["SongFlower"]
		end
		if L:HasReverseTranslation(what) then
			self:SetNote(icon,L:GetReverseTranslation(what))
		else
			self:SetNote(icon,what)
		end
	end	
end

-- i used this from cart mining seemes over complicated, but maybe due to localization issues
local perform_string = '^' .. (SIMPLEPERFORMSELFOTHER:format(bs["Opening"], "%s"):gsub("([%(%)%.%*%+%-%[%]%?%^%$%%])", "%%%1"):gsub("%%%%s", "(.+)")) .. '$'

-- This shouldnt fire apparently
function Cartographer_Treasure:CHAT_MSG_SPELL_SELF_BUFF(msg)
	local what = msg:match(perform_string)
	if what then
		self:RegisterTreasure(what)
	end
end

-- opening now seems to just do a blank "Opening cast spell"
function Cartographer_Treasure:UNIT_SPELLCAST_START(who)
	-- only care about our own cast events
	if ( who ~= "player" ) then 
		return 
	end
	local spell, _, text, _, _, _ = UnitCastingInfo("player")
	-- Make sure we are performing Opening; the spell and text should both be "Opening"
	-- (Lockpicking for footlockers never casts Opening, so check for Pick Lock)
	if (text == bs["Opening"] and spell == bs["Opening"]) or (text == bs["Pick Lock"] and spell == bs["Pick Lock"]) then
		local what = GameTooltipTextLeft1:GetText();
		if what then
			self:RegisterTreasure(what)
		end
	end
end

-- Error your in comabt or had to pick the lock
function Cartographer_Treasure:UI_ERROR_MESSAGE(msg)
	-- see if we are trying to open/activate something while mounted
	if msg:find(SPELL_FAILED_NOT_MOUNTED) or msg:find(ERR_NOT_IN_COMBAT) then
		local what = GameTooltipTextLeft1:GetText()
		if what then
			self:RegisterTreasure(what)
		end
	end
end

-- blood of heroes and felwood stuff dont do opening anymore :(
function Cartographer_Treasure:LOOT_OPENED()
for idx = 1, GetNumLootItems(), 1 do
	if LootSlotIsItem(idx) then
		local lootIcon, lootName, lootQuantity, rarity = GetLootSlotInfo(idx);
		if L:HasReverseTranslation(lootName) then
			local ename = L:GetReverseTranslation(lootName)
			if direct_lookup[ename] then
				self:RegisterTreasure(ename)
			end
		end
	end
end

end

function Cartographer_Treasure:IsNoteHidden(zone, id, treasure)
	if type(treasure) == "table" then
		return not self.db.profile.filter[treasure.icon]
	else
		return not self.db.profile.filter[treasure]
	end
end

function Cartographer_Treasure:IsShowingTreasure(treasure)
	return self.db.profile.filter[treasure]
end

function Cartographer_Treasure:ToggleShowingTreasure(treasure, value)
	if value == nil then
		value = not self.db.profile.filter[treasure]
	end
	self.db.profile.filter[treasure] = value
	Cartographer_Notes:RefreshMap()
end

function Cartographer_Treasure:IsShowingMinimapIcons()
	return self.db.profile.minicons
end
function Cartographer_Treasure:ToggleShowingMinimapIcons()
	self.db.profile.minicons = not self.db.profile.minicons
end
function Cartographer_Treasure:IsMiniNoteHidden(zone,id,data)
	return not self.db.profile.minicons
end

function Cartographer_Treasure:GetIconScale()
	return self.db.profile.iconScale
end

function Cartographer_Treasure:SetIconScale(value)
	self.db.profile.iconScale = value
	Cartographer_Notes:RefreshMap()
end
function Cartographer_Treasure:GetIconAlpha()
	return self.db.profile.iconAlpha
end

function Cartographer_Treasure:SetIconAlpha(value)
	self.db.profile.iconAlpha = value
	Cartographer_Notes:RefreshMap()
end

function Cartographer_Treasure:GetNoteTransparency(zone,id,data)
	return self.db.profile.iconAlpha
end
function Cartographer_Treasure:GetNoteScaling(zone,id,data)
	return self.db.profile.iconScale
end

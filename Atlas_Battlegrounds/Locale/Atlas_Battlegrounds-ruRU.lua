--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005-2010 Dan Gilbert <dan.b.gilbert@gmail.com>

	This file is part of Atlas.

	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]

--[[

-- Atlas Data  (Russian)
-- Compiled by StingerSoft
-- stingersoft@gmail.com
-- Last Update: 27.09.2008

--]]

if ( GetLocale() == "ruRU" ) then

AtlasBGLocale = {

	--Common
	["Alliance"] = "Альянс";
	["Battleground Maps"] = "Карты Полей Сражений";
	["Entrance"] = "Вход";
	["Horde"] = "Орда";
	["Neutral"] = "Нейтральный";
	["North"] = "Север";
	["Orange"] = "Оранжевый";
	["Red"] = "Красный";
	["Reputation"] = "Реп";
	["Rescued"] = "Спасенный";
	["South"] = "Юг";
	["Start"] = "Начало";
	["Summon"] = "Призыв";
	["White"] = "Белый";
	
	--Places
	["Alterac Mountains"] = "Альтеракские горы";
	["Alterac Valley"] = "Альтеракская долина"; ["AV"] = "АД";
	["Arathi Basin"] = "Низина Арати"; ["AB"] = "НА";
	["Arathi Highlands"] = "Нагорье Арати";
	["Ashenvale"] = "Ясеневый лес";
	["Dragonblight"] = "Драконий Погост";
	["Eastern Kingdoms"] = "Восточные королевства";
	["Eye of the Storm"] = "Око Бури"; ["EotS"] = "Око";
	["Hillsbrad Foothills"] = "Старые Предгорья Хилсбрада";
	["Icecrown"] = "Ледяная Корона";
	["Isle of Conquest"] = "Остров Завоеваний"; ["IoC"] = "ОЗ";
	["Kalimdor"] = "Калимдор";
	["Netherstorm"] = "Пустоверть";
	["Outland"] = "Запределье";
	["Strand of the Ancients"] = "Берег Древних"; ["SotA"] = "Берег";
	["The Barrens"] = "Степи";
	["Warsong Gulch"] = "Ущелье Песни Войны"; ["WSG"] = "УПВ";
	
	--Alterac Valley (North)
	["Stormpike Guard"] = "Стража Грозовой Вершины";
	["Dun Baldar"] = "Дун Балдар";
	["Vanndar Stormpike <Stormpike General>"] = "Вандар Грозовая Вершина <Генерал клана Грозовой Вершины>";
	["Dun Baldar North Marshal"] = "Маршал северного Оплота Дун Балдара";
	["Dun Baldar South Marshal"] = "Маршал южного Оплота Дун Балдара";
	["Icewing Marshal"] = "Маршал Ледяного Крыла";
	["Stonehearth Marshal"] = "Маршал Каменного Очага";
	["Prospector Stonehewer"] = "Геолог Камнегрыз";
	["Irondeep Mine"] = "Шахтер из племени Железного Рудника";
	["Morloch"] = "Морлох";
	["Umi Thorson"] = "Уми Торсон";
	["Keetar"] = "Китар";
	["Arch Druid Renferal"] = "Верховный друид Дикая Лань";
	["Dun Baldar North Bunker"] = "Северный Оплот Дун Болдара";
	["Wing Commander Mulverick"] = "Командир звена Малверик";--omitted from AVS
	["Murgot Deepforge"] = "Мургот Подземная Кузня";
	["Dirk Swindle <Bounty Hunter>"] = "Дирк Надувалло <Охотник за головами>";
	["Athramanis <Bounty Hunter>"] = "Атраманис <Охотник за головами>";
	["Lana Thunderbrew <Blacksmithing Supplies>"] = "Лана Грозовар <Товары для кузнецов>";
	["Stormpike Aid Station"] = "Лазарет Грозовой Вершины";
	["Stormpike Stable Master <Stable Master>"] = "Смотритель стойл из клана Грозовой Вершины <Смотритель стойл>";
	["Stormpike Ram Rider Commander"] = "Командир наездников на баранах из клана Грозовой Вершины";
	["Svalbrad Farmountain <Trade Goods>"] = "Свальбрад Дальногор <Хозяйственные товары>";
	["Kurdrum Barleybeard <Reagents & Poison Supplies>"] = "Курдрум Ячменобород <Реагенты и яды>";
	["Stormpike Quartermaster"] = "Интендант клана Грозовой Вершины";
	["Jonivera Farmountain <General Goods>"] = "Джонивера Дальняя Гора <Потребительские товары>";
	["Brogus Thunderbrew <Food & Drink>"] = "Брогус Грозовар <Еда и напитки>";
	["Wing Commander Ichman"] = "Командир звена Ичман";--omitted from AVS
	["Wing Commander Slidore"] = "Командир звена Макарч";--omitted from AVS
	["Wing Commander Vipore"] = "Командир звена Сквороц";--omitted from AVS
	["Dun Baldar South Bunker"] = "Южный Оплот Дун Болдара";
	["Corporal Noreg Stormpike"] = "Капрал Норг Грозовая Вершина";
	["Gaelden Hammersmith <Stormpike Supply Officer>"] = "Гаелден Кузнечный Молот <Снабженец клана Грозовой Вершины>";
	["Stormpike Graveyard"] = "Кладбище Грозовой Вершины";
	["Icewing Cavern"] = "Пещера Ледяного Крыла";
	["Stormpike Banner"] = "Знамя Грозовой Вершины";
	["Stormpike Lumber Yard"] = "Stormpike Lumber Yard";
	["Wing Commander Jeztor"] = "Командир звена Мааша";--omitted from AVS
	["Icewing Bunker"] = "Укрытие Ледяного Крыла";
	["Wing Commander Guse"] = "Командир звена Смуггл";--omitted from AVS
	["Stonehearth Graveyard"] = "Кладбище Каменного Очага";
	["Stormpike Ram Rider Commander"] = "Командир наездников на баранах из клана Грозовой Вершины";
	["Stonehearth Outpost"] = "Форт Каменного Очага";
	["Captain Balinda Stonehearth <Stormpike Captain>"] = "Капитан Балинда Каменный Очаг <Капитан клана Грозовой Вершины>";
	["Snowfall Graveyard"] = "Кладбище Снегопада";
	["Ichman's Beacon"] = "Маяк Ичмена";
	["Mulverick's Beacon"] = "Маяк Малверика";
	["Stonehearth Bunker"] = "Укрытие Каменного Очага";
	["Ivus the Forest Lord"] = "Ивус Лесной Властелин";
	["Western Crater"] = "Западный Кратер";
	["Vipore's Beacon"] = "Маяк Сквороца";
	["Jeztor's Beacon"] = "Маяк Мааша";
	["Eastern Crater"] = "Восточный Кратер";
	["Slidore's Beacon"] = "Маяк Макарча";
	["Guse's Beacon"] = "Маяк Смуггла";
	["Graveyards, Capturable Areas"] = "Кладбище, Зоны захвата";--omitted from AVS
	["Bunkers, Towers, Destroyable Areas"] = "Бункеры, Башни, Зоны уничтожения";--omitted from AVS
	["Assault NPCs, Quest Areas"] = "Штурм НИПов, Зоны заданий";--omitted from AVS

	--Alterac Valley (South)
	["Frostwolf Clan"] = "Клан Северного Волка";
	["Frostwolf Keep"] = "Крепость Северного Волка";
	["Drek'Thar <Frostwolf General>"] = "Дрек'Тар <Генерал клана Северного Волка>";
	["Duros"] = "Дарос";
	["Drakan"] = "Дракан";
	["West Frostwolf Warmaster"] = "Воевода западной башни Северного Волка";
	["East Frostwolf Warmaster"] = "Воевода восточной башни Северного Волка";
	["Tower Point Warmaster"] = "Воевода Смотровой башня";
	["Iceblood Warmaster"] = "Воевода Стылой Крови";
	["Lokholar the Ice Lord"] = "Локолар Владыка Льда";
	["Iceblood Garrison"] = "Гарнизон Стылой Крови";
	["Captain Galvangar <Frostwolf Captain>"] = "Капитан Гальвангар <Капитан клана Северного Волка>";
	["Iceblood Tower"] = "Башня Стылой Крови";
	["Iceblood Graveyard"] = "Кладбище Стылой Крови";
	["Tower Point"] = "Смотровая башня";
	["Coldtooth Mine"] = "Рудник Ледяного Зуба";
	["Taskmaster Snivvle"] = "Надсмотрщик Хныкс";
	["Masha Swiftcut"] = "Маша Быстрорезка";
	["Aggi Rumblestomp"] = "Агги Шумнотоп";
	["Frostwolf Graveyard"] = "Кладбище Северного Волка";
	["Jotek"] = "Джотек";
	["Smith Regzar"] = "Кузнец Регзар";
	["Primalist Thurloga"] = "Старейшина Турлога";
	["Sergeant Yazra Bloodsnarl"] = "Сержант Язра Кровавый Рык";
	["Frostwolf Stable Master <Stable Master>"] = "Смотритель стойл из клана Северного Волка <Смотритель стойл>";
	["Frostwolf Wolf Rider Commander"] = "Командир наездников на волках клана Северного Волка";
	["Frostwolf Quartermaster"] = "Интендант клана Северного Волка";
	["West Frostwolf Tower"] = "Западная башня Северного Волка";
	["East Frostwolf Tower"] = "Восточная башня Северного Волка";
	["Frostwolf Relief Hut"] = "Приют Северного Волка";
	["Wildpaw Cavern"] = "Пещера Дикой Лапы";
	["Frostwolf Banner"] = "Знамя Северного Волка";

	--Arathi Basin
	["The Defilers"] = "Осквернители";
	["The League of Arathor"] = "Лига Аратора";
	["Trollbane Hall"] = "Зал Троллебоя";
	["Defiler's Den"] = "Логово Осквернителя";
	["Stables"] = "Стойла";
	["Gold Mine"] = "Золотой рудник";
	["Smithy"] = "Кузница";
	["Lumber Mill"] = "Лесопилка";
	["Farm"] = "Ферма";

	--Eye of the Storm
	["Graveyard"] = "Кладбище";
	["Flag"] = "Флаг";
	["Mage Tower"] = "Башня Магов";
	["Draenei Ruins"] = "Дренейские руины";
	["Fel Reaver Ruins"] = "Обломки Скверномора";
	["Blood Elf Tower"] = "Башня Эльфов Крови";
	
	--Isle of Conquest
	["The Refinery"] = "Нефтезавод";
	["The Docks"] = "Причал";
	["The Workshop"] = "Мастерская";
	["The Hangar"] = "Ангар	";
	["The Quarry"] = "Каменоломня";
	["Contested Graveyards"] = "Спорные Кладбища";
	["Horde Graveyard"] = "Кладбище Орды";
	["Alliance Graveyard"] = "Кладбище Альянса";
	["Gates are marked with red bars."] = "Ворота помечены красным.";
	["Overlord Agmar"] = "Командир Агмар";
	["High Commander Halford Wyrmbane <7th Legion>"] = "Главнокомандующий Халфорд Змеевержец <7-й легион>";
	
	--Strand of the Ancients
	["Attacking Team"] = "Группа штурма";
	["Defending Team"] = "Группа защиты";
	["Massive Seaforium Charge"] = "Сверхмощный сефориевый заряд";
	["Battleground Demolisher"] = "Разрушитель";
	["Resurrection Point"] = "Точки воскрешения";
	["Graveyard Flag"] = "Кладбище";
	["Titan Relic"] = "Реликвия титанов";
	["Gates are marked with their colors."] = "Ворота, отмечены их цветами.";
	
	--Warsong Gulch
	["Warsong Outriders"] = "Всадники Песни Войны";
	["Silverwing Sentinels"] = "Среброкрылые Часовые";
	["Silverwing Hold"] = "Крепость Среброкрылых";
	["Warsong Lumber Mill"] = "Лесопилка Песни Войны";

};

end
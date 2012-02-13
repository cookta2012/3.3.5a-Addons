ArkInventory.Const.CompanionData = {
--[[
	populated in OnInitialize, used for LDB Pet/Mount objects, see companion.xls, sourced from wowhead
	
	[spellid] = {
		f = 1 (ground only) | 2 (flight only) | 3 = (flight + ground)
		r = nil | true (requires a reagent or is restricted to a specific area)
	}
]]--
 }

ArkInventory.Const.CompanionTranslation = {
--[[
	["item:xxxx"] = { "spell:yyyy" = true }
	["spell:yyyy"] = { "item:xxxx" = true }
]]--
}

ArkInventory.Const.CompanionTranslationData = { -- temporary table for item to spell translations.
-- [itemid] = {  }
-- if itemid not a number then it's not learnt from an actual item (achievement, trainer, etc)
-- id = spell id (if spell id is not a number then it's an item only, no associated spell)
-- r = requires reagent
-- f = flight mode: 1 = ground only, 2 = air only, 3 = ground and air
-- s = speed %, 0 = auto adjust

[34493] = { id = 45127 }, -- Dragon Kite
[35227] = { id = 'XI-35227' }, -- Goblin Weather Machine - Prototype 01-B
[23713] = { id = 30156 }, -- Hippogryph Hatchling
[8494] = { id = 10682 }, -- Parrot Cage (Hyacinth Macaw) / Hyacinth Macaw
[49287] = { id = 68767 }, -- Tuskarr Kite

[44984] = { id = 62562 }, -- Ammen Vale Lashling
[45022] = { id = 62746 }, -- Argent Gruntling
[44998] = { id = 62609 }, -- Argent Squire
[32588] = { id = 40549 }, -- Banana Charm / Bananas
[54436] = { id = 75134 }, -- Blue Clockwork Rocket Bot
[20371] = { id = 24696 }, -- Blue Murloc Egg / Murky
[23083] = { id = 28871 }, -- Captured Flame / Spirit of Summer
[35350] = { id = 46426 }, -- Chuck's Bucket / Chuck
[34425] = { id = 54187 }, -- Clockwork Rocket Bot
[37298] = { id = 48408 }, -- Competitor's Souvenir / Essence of Competition
[49646] = { id = 69452 }, -- Core Hound Pup
[46545] = { id = 65381 }, -- Curious Oracle Hatchling
[46544] = { id = 65382 }, -- Curious Wolvar Pup
[13584] = { id = 17708 }, -- Diablo Stone / Mini Diablo
[44970] = { id = 62508 }, -- Dun Morogh Cub
[44973] = { id = 62513 }, -- Durotar Scorpion
[32616] = { id = 40614 }, -- Egbert's Egg / Egbert
[32622] = { id = 40634 }, -- Elekk Training Collar / Peanut
[44974] = { id = 62516 }, -- Elwynn Lamb
[44982] = { id = 62564 }, -- Enchanted Broom
[32498] = { id = 40406 }, -- Fortune Coin
[39286] = { id = 52615 }, -- Frosty's Collar / Frosty
[39973] = { id = 53316 }, -- Ghostly Skull
[43698] = { id = 59250 }, -- Giant Sewer Rat
[37297] = { id = 48406 }, -- Gold Medallion / Spirit of Competition
[34518] = { id = 45174 }, -- Golden Pig Coin / Golden Pig
[49662] = { id = 69535 }, -- Gryphon Hatchling
[46802] = { id = 66030 }, -- Heavy Murloc Egg / Grunty
[44738] = { id = 61472 }, -- Kirin Tor Familiar
[49693] = { id = 69677 }, -- Lil' Phylactery / Lil' K.T.
[54847] = { id = 75906 }, -- Lil' XT
[44841] = { id = 61991 }, -- Little Fawn's Salt Lick / Little Fawn
[30360] = { id = 24988 }, -- Lurky's Egg / Lurky
[45002] = { id = 62674 }, -- Mechanopeep
[33993] = { id = 43918 }, -- Mojo
[33818] = { id = 43698 }, -- Muckbreath's Bucket / Muckbreath
[44980] = { id = 62542 }, -- Mulgore Hatchling
[45180] = { id = 63318 }, -- Murkimus' Little Spear / Murkimus the Gladiator
[38628] = { id = 51716 }, -- Nether Ray Fry
[25535] = { id = 32298 }, -- Netherwhelp's Collar / Netherwhelp
[44723] = { id = 61357 }, -- Nurtured Penguin Egg / Pengu
[13583] = { id = 17707 }, -- Panda Collar / Panda Cub
[49665] = { id = 69541 }, -- Pandaren Monk
[49912] = { id = 70613 }, -- Perky Pug
[35504] = { id = 46599 }, -- Phoenix Hatchling
[22114] = { id = 27241 }, -- Pink Murloc Egg / Gurky
[46707] = { id = 44369 }, -- Pint-Sized Pink Pachyderm
[40653] = { id = 40990 }, -- Reeking Pet Carrier / Stinker
[34492] = { id = 45125 }, -- Rocket Chicken
[34955] = { id = 45890 }, -- Scorched Stone / Scorchling
[45606] = { id = 63712 }, -- Sen'jin Fetish
[46820] = { id = 66096 }, -- Shimmering Wyrmling
[46821] = { id = 66096 }, -- Shimmering Wyrmling
[34519] = { id = 45175 }, -- Silver Pig Coin / Silver Pig
[33154] = { id = 42609 }, -- Sinister Squashling
[32617] = { id = 40613 }, -- Sleepy Willy
[35349] = { id = 46425 }, -- Snarly's Bucket / Snarly
[38050] = { id = 49964 }, -- Soul-Trader Beacon / Ethereal Soul-Trader
[49343] = { id = 68810 }, -- Spectral Tiger Cub
[44794] = { id = 61725 }, -- Spring Rabbit's Foot / Spring Rabbit
[44983] = { id = 62561 }, -- Strand Crawler
[44965] = { id = 62491 }, -- Teldrassil Sproutling
[34478] = { id = 45082 }, -- Tiny Sporebat
[44971] = { id = 62510 }, -- Tirisfal Batling
[33816] = { id = 43697 }, -- Toothy's Bucket / Toothy
[50446] = { id = 71840 }, -- Toxic Wasteling
[44810] = { id = 61773 }, -- Turkey Cage / Plump Turkey
[39656] = { id = 53082 }, -- Tyrael's Hilt / Mini Tyrael
[41133] = { id = 55068 }, -- Unhatched Mr. Chilly / Mr. Chilly
[38658] = { id = 51851 }, -- Vampiric Batling
[46767] = { id = 65682 }, -- Warbot Ignition Key / Warbot
[49663] = { id = 69536 }, -- Wind Rider Cub
[45057] = { id = 'XI-45057' }, -- Wind-Up Train Wrecker
[32233] = { id = 39709 }, -- Wolpertinger's Tankard / Wolpertinger
[13582] = { id = 17709 }, -- Zergling Leash / Zergling

[19450] = { id = 23811 }, -- A Jubling's Tiny Home / Jubling
[44822] = { id = 10713 }, -- Albino Snake
[11023] = { id = 10685 }, -- Ancona Chicken
[34535] = { id = 10696 }, -- Azure Whelpling
[44819] = { id = 61855 }, -- Baby Blizzard Bear
[21168] = { id = 25849 }, -- Baby Shark
[10360] = { id = 10714 }, -- Black Kingsnake
[29958] = { id = 36031 }, -- Blue Dragonhawk Hatchling
[29901] = { id = 35907 }, -- Blue Moth Egg / Blue Moth
[29364] = { id = 35239 }, -- Brown Rabbit Crate / Brown Rabbit
[10361] = { id = 10716 }, -- Brown Snake
[46398] = { id = 65358 }, -- Calico Cat
[29960] = { id = 36034 }, -- Captured Firefly / Firefly
[8491] = { id = 10675 }, -- Cat Carrier (Black Tabby) / Black Tabby Cat
[8485] = { id = 10673 }, -- Cat Carrier (Bombay) / Bombay Cat
[8486] = { id = 10674 }, -- Cat Carrier (Cornish Rex) / Cornish Rex Cat
[8487] = { id = 10676 }, -- Cat Carrier (Orange Tabby) / Orange Tabby Cat
[8490] = { id = 10677 }, -- Cat Carrier (Siamese) / Siamese Cat
[8488] = { id = 10678 }, -- Cat Carrier (Silver Tabby) / Silver Tabby Cat
[8489] = { id = 10679 }, -- Cat Carrier (White Kitten) / White Kitten
[11110] = { id = 13548 }, -- Chicken Egg / Westfall Chicken
[39898] = { id = 61351 }, -- Cobra Hatchling
[10393] = { id = 10688 }, -- Cockroach
[10392] = { id = 10717 }, -- Crimson Snake
[10822] = { id = 10695 }, -- Dark Whelpling
[48112] = { id = 67413 }, -- Darting Hatchling
[48114] = { id = 67414 }, -- Deviate Hatchling
[20769] = { id = 25162 }, -- Disgusting Oozeling
[29953] = { id = 36027 }, -- Golden Dragonhawk Hatchling
[8500] = { id = 10707 }, -- Great Horned Owl
[19055] = { id = 23531 }, -- Green Dragon Orb / Tiny Green Dragon
[21301] = { id = 26533, r = 1 }, -- Green Helper Box / Father Winter's Helper
[48116] = { id = 67415 }, -- Gundrak Hatchling
[8501] = { id = 10706 }, -- Hawk Owl
[21308] = { id = 26529, r = 1 }, -- Jingling Bell / Winter Reindeer
[48118] = { id = 67416 }, -- Leaping Hatchling
[15996] = { id = 19772 }, -- Lifelike Mechanical Toad / Lifelike Toad
[11826] = { id = 15049 }, -- Lil' Smoky
[46831] = { id = 'XI-46831', r = 1 }, -- Macabre Marionette
[27445] = { id = 33050 }, -- Magical Crawdad Box / Magical Crawdad
[29363] = { id = 35156 }, -- Mana Wyrmling
[10398] = { id = 12243 }, -- Mechanical Chicken
[4401] = { id = 4055 }, -- Mechanical Squirrel Box / Mechanical Squirrel
[31760] = { id = 39181 }, -- Miniwing
[48120] = { id = 67417 }, -- Obsidian Hatchling
[49362] = { id = 69002 }, -- Onyxian Whelpling
[46397] = { id = 'XI-46397' }, -- Oracle Orphan Whistle
[8496] = { id = 10680 }, -- Parrot Cage (Cockatiel) / Cockatiel
[8492] = { id = 10683 }, -- Parrot Cage (Green Wing Macaw) / Green Wing Macaw
[8495] = { id = 10684 }, -- Parrot Cage (Senegal) / Senegal
[11825] = { id = 15048 }, -- Pet Bombling
[15048] = { id = 28739 }, -- Piglet's Collar / Mr. Wiggles
[22781] = { id = 28505 }, -- Polar Bear Collar / Poley
[10394] = { id = 10709 }, -- Prairie Dog Whistle / Brown Prairie Dog
[44721] = { id = 61350 }, -- Proto-Drake Whelp
[8497] = { id = 10711 }, -- Rabbit Crate (Snowshoe) / Snowshoe Rabbit
[23015] = { id = 28740 }, -- Rat Cage / Whiskers the Rat
[48122] = { id = 67418 }, -- Ravasaur Hatchling
[48124] = { id = 67419 }, -- Razormaw Hatchling
[48126] = { id = 67420 }, -- Razzashi Hatchling
[19054] = { id = 23530 }, -- Red Dragon Orb / Tiny Red Dragon
[29956] = { id = 36028 }, -- Red Dragonhawk Hatchling
[21305] = { id = 26541, r = 1 }, -- Red Helper Box / Winter's Little Helper
[29902] = { id = 35909 }, -- Red Moth Egg / Red Moth
[44820] = { id = 'XI-44820' }, -- Red Ribbon Pet Leash
[37460] = { id = 'XI-37460' }, -- Rope Pet Leash
[29957] = { id = 36029 }, -- Silver Dragonhawk Hatchling
[22200] = { id = 'XI-22200' }, -- Silver Shafted Arrow
[12529] = { id = 16450 }, -- Smolderweb Carrier / Smolderweb Hatchling
[21309] = { id = 26045, r = 1 }, -- Snowman Kit / Tiny Snowman
[11474] = { id = 15067 }, -- Sprite Darter Egg / Sprite Darter Hatchling
[39896] = { id = 61348 }, -- Tickbird Hatchling
[8499] = { id = 10697 }, -- Tiny Crimson Whelpling / Crimson Whelpling
[8498] = { id = 10698 }, -- Tiny Emerald Whelpling / Emerald Whelpling
[21277] = { id = 26010 }, -- Tranquil Mechanical Yeti
[11026] = { id = 10704 }, -- Tree Frog Box / Tree Frog
[22235] = { id = 27570 }, -- Truesilver Shafted Arrow / Peddlefeet
[23002] = { id = 28738 }, -- Turtle Box / Speedy
[18964] = { id = 23429 }, -- Turtle Egg (Loggerhead) / Loggerhead Snapjaw
[19462] = { id = 23811 }, -- Unhatched Jubling Egg
[29904] = { id = 35911 }, -- White Moth Egg / White Moth Egg
[39899] = { id = 61349 }, -- White Tickbird Hatchling
[46396] = { id = 'XI-46396' }, -- Wolvar Orphan Whistle
[11027] = { id = 10703 }, -- Wood Frog Box / Wood Frog
[12264] = { id = 15999 }, -- Worg Carrier / Worg Pup
[45942] = { id = 64351 }, -- XS-001 Constructor Bot
[29903] = { id = 35910 }, -- Yellow Moth Egg / Yellow Moth



[21176] = { id = 26656, f = 1, s = 100 }, -- Black Qiraji Resonating Crystal / Black Qiraji Battle Tank

[33809] = { id = 43688, f = 1, s = 100 }, -- Amani War Bear
[47179] = { id = 66906, f = 1, s = 100 }, -- Argent Charger / Paladin Only
[47180] = { id = 67466, f = 1, s = 100 }, -- Argent Warhorse
[49282] = { id = 51412, f = 1, s = 100 }, -- Big Battle Bear
[50250] = { id = 71342, f = 3, s = 0 }, -- Big Love Rocket
[29465] = { id = 22719, f = 1, s = 100 }, -- Black Battlestrider
[13328] = { id = 17461, f = 1, s = 100 }, -- Black Ram
[29466] = { id = 22718, f = 1, s = 100 }, -- Black War Kodo
[29467] = { id = 22720, f = 1, s = 100 }, -- Black War Ram
[29468] = { id = 22717, f = 1, s = 100 }, -- Black War Steed Bridle / Black War Steed
[46101] = { id = 64656, f = 1, s = 100 }, -- Blue Skeletal Warhorse
[45593] = { id = 63635, f = 1, s = 100 }, -- Darkspear Raptor
[45591] = { id = 63637, f = 1, s = 100 }, -- Darnassian Nightsaber
[13335] = { id = 17481, f = 1, s = 100 }, -- Deathcharger's Reins / Rivendare's Deathcharger
[45590] = { id = 63639, f = 1, s = 100 }, -- Exodar Elekk
[30480] = { id = 36702, f = 1, s = 100 }, -- Fiery Warhorse's Reins / Fiery Warhorse
[45597] = { id = 63643, f = 1, s = 100 }, -- Forsaken Warhorse
[13329] = { id = 17460, f = 1, s = 100 }, -- Frost Ram
[45589] = { id = 63638, f = 1, s = 100 }, -- Gnomeregan Mechanostrider
[29745] = { id = 35713, f = 1, s = 100 }, -- Great Blue Elekk
[37828] = { id = 49379, f = 1, s = 100 }, -- Great Brewfest Kodo
[18794] = { id = 23249, f = 1, s = 100 }, -- Great Brown Kodo
[46750] = { id = 65641, f = 1, s = 100 }, -- Great Golden Kodo
[18795] = { id = 23248, f = 1, s = 100 }, -- Great Gray Kodo
[29746] = { id = 35712, f = 1, s = 100 }, -- Great Green Elekk
[29747] = { id = 35714, f = 1, s = 100 }, -- Great Purple Elekk
[46745] = { id = 65637, f = 1, s = 100 }, -- Great Red Elekk
[18793] = { id = 23247, f = 1, s = 100 }, -- Great White Kodo
[15292] = { id = 18991, f = 1, s = 100 }, -- Green Kodo
[13334] = { id = 17465, f = 1, s = 100 }, -- Green Skeletal Warhorse
[12351] = { id = 16081, f = 1, s = 100 }, -- Horn of the Arctic Wolf / Winter Wolf
[29469] = { id = 22724, f = 1, s = 100 }, -- Horn of the Black War Wolf / Black War Wolf
[19029] = { id = 23509, f = 1, s = 100 }, -- Horn of the Frostwolf Howler / Frostwolf Howler
[12330] = { id = 16080, f = 1, s = 100 }, -- Horn of the Red Wolf / Red Wolf
[18796] = { id = 23250, f = 1, s = 100 }, -- Horn of the Swift Brown Wolf / Swift Brown Wolf
[18798] = { id = 23252, f = 1, s = 100 }, -- Horn of the Swift Gray Wolf / Swift Gray Wolf
[18797] = { id = 23251, f = 1, s = 100 }, -- Horn of the Swift Timber Wolf / Swift Timber Wolf
[13327] = { id = 17459, f = 1, s = 100 }, -- Icy Blue Mechanostrider Mod A
[50818] = { id = 72286, f = 3, s = 310 }, -- Invincible's Reins / Invincible
[45586] = { id = 63636, f = 1, s = 100 }, -- Ironforge Ram
[49290] = { id = 65917, f = 1, s = 100 }, -- Magic Rooster Egg / Magic Rooster
[41508] = { id = 55531, f = 1, s = 100 }, -- Mechano-hog
[44413] = { id = 60424, f = 1, s = 100 }, -- Mekgineer's Chopper
[47101] = { id = 66846, f = 1, s = 100 }, -- Ochre Skeletal Warhorse
[45595] = { id = 63640, f = 1, s = 100 }, -- Orgrimmar Wolf
[12354] = { id = 16082, f = 1, s = 100 }, -- Palomino Bridle / Palomino
[18791] = { id = 23246, f = 1, s = 100 }, -- Purple Skeletal Warhorse
[46815] = { id = 66090, f = 1, s = 100 }, -- Quel'dorei Steed
[29470] = { id = 22722, f = 1, s = 100 }, -- Red Skeletal Warhorse
[12302] = { id = 16056, f = 1, s = 100 }, -- Reins of the Ancient Frostsaber / Ancient Frostsaber
[44225] = { id = 60114, f = 1, s = 100 }, -- Reins of the Armored Brown Bear / Armored Brown Bear
[44226] = { id = 60116, f = 1, s = 100 }, -- Reins of the Armored Brown Bear / Armored Brown Bear
[44223] = { id = 60118, f = 1, s = 100 }, -- Reins of the Black War Bear / Black War Bear
[44224] = { id = 60119, f = 1, s = 100 }, -- Reins of the Black War Bear / Black War Bear
[35906] = { id = 48027, f = 1, s = 100 }, -- Reins of the Black War Elekk / Black War Elekk
[43956] = { id = 59785, f = 1, s = 100 }, -- Reins of the Black War Mammoth / Black War Mammoth
[44077] = { id = 59788, f = 1, s = 100 }, -- Reins of the Black War Mammoth / Black War Mammoth
[29471] = { id = 22723, f = 1, s = 100 }, -- Reins of the Black War Tiger / Black War Tiger
[31830] = { id = 39315, f = 1, s = 100 }, -- Reins of the Cobalt Riding Talbuk / Cobalt Riding Talbuk
[31829] = { id = 39315, f = 1, s = 100 }, -- Reins of the Cobalt Riding Talbuk / Cobalt Riding Talbuk
[29227] = { id = 34896, f = 1, s = 100 }, -- Reins of the Cobalt War Talbuk / Cobalt War Talbuk
[29102] = { id = 34896, f = 1, s = 100 }, -- Reins of the Cobalt War Talbuk / Cobalt War Talbuk
[28915] = { id = 39316, f = 1, s = 100 }, -- Reins of the Dark Riding Talbuk / Dark Riding Talbuk
[29228] = { id = 34790, f = 1, s = 100 }, -- Reins of the Dark War Talbuk / Dark War Talbuk
[43959] = { id = 61465, f = 1, s = 100 }, -- Reins of the Grand Black War Mammoth / Grand Black War Mammoth
[44083] = { id = 61467, f = 1, s = 100 }, -- Reins of the Grand Black War Mammoth / Grand Black War Mammoth
[43961] = { id = 61470, f = 1, s = 100 }, -- Reins of the Grand Ice Mammoth / Grand Ice Mammoth
[44086] = { id = 61469, f = 1, s = 100 }, -- Reins of the Grand Ice Mammoth / Grand Ice Mammoth
[43958] = { id = 59799, f = 1, s = 100 }, -- Reins of the Ice Mammoth / Ice Mammoth
[44080] = { id = 59797, f = 1, s = 100 }, -- Reins of the Ice Mammoth / Ice Mammoth
[12303] = { id = 16055, f = 1, s = 100 }, -- Reins of the Nightsaber / Black Nightsaber
[32768] = { id = 41252, f = 1, s = 100 }, -- Reins of the Raven Lord / Raven Lord
[31832] = { id = 39317, f = 1, s = 100 }, -- Reins of the Silver Riding Talbuk / Silver Riding Talbuk
[31831] = { id = 39317, f = 1, s = 100 }, -- Reins of the Silver Riding Talbuk / Silver Riding Talbuk
[29229] = { id = 34898, f = 1, s = 100 }, -- Reins of the Silver War Talbuk / Silver War Talbuk
[29104] = { id = 34898, f = 1, s = 100 }, -- Reins of the Silver War Talbuk / Silver War Talbuk
[18766] = { id = 23221, f = 1, s = 100 }, -- Reins of the Swift Frostsaber / Swift Frostsaber
[18767] = { id = 23219, f = 1, s = 100 }, -- Reins of the Swift Mistsaber / Swift Mistsaber
[49284] = { id = 42777, f = 1, s = 100 }, -- Reins of the Swift Spectral Tiger / Swift Spectral Tiger
[18902] = { id = 23338, f = 1, s = 100 }, -- Reins of the Swift Stormsaber / Swift Stormsaber
[31834] = { id = 39318, f = 1, s = 100 }, -- Reins of the Tan Riding Talbuk / Tan Riding Talbuk
[31833] = { id = 39318, f = 1, s = 100 }, -- Reins of the Tan Riding Talbuk / Tan Riding Talbuk
[29230] = { id = 34899, f = 1, s = 100 }, -- Reins of the Tan War Talbuk / Tan War Talbuk
[29105] = { id = 34899, f = 1, s = 100 }, -- Reins of the Tan War Talbuk / Tan War Talbuk
[44235] = { id = 61425, f = 1, s = 100 }, -- Reins of the Traveler's Tundra Mammoth / Traveler's Tundra Mammoth
[44234] = { id = 61447, f = 1, s = 100 }, -- Reins of the Traveler's Tundra Mammoth / Traveler's Tundra Mammoth
[43962] = { id = 54753, f = 1, s = 100 }, -- Reins of the White Polar Bear / White Polar Bear
[31836] = { id = 39319, f = 1, s = 100 }, -- Reins of the White Riding Talbuk / White Riding Talbuk
[31835] = { id = 39319, f = 1, s = 100 }, -- Reins of the White Riding Talbuk / White Riding Talbuk
[29231] = { id = 34897, f = 1, s = 100 }, -- Reins of the White War Talbuk / White War Talbuk
[29103] = { id = 34897, f = 1, s = 100 }, -- Reins of the White War Talbuk / White War Talbuk
[13086] = { id = 17229, f = 1, s = 100 }, -- Reins of the Winterspring Frostsaber / Winterspring Frostsaber
[44230] = { id = 59791, f = 1, s = 100 }, -- Reins of the Wooly Mammoth / Wooly Mammoth
[44231] = { id = 59793, f = 1, s = 100 }, -- Reins of the Wooly Mammoth / Wooly Mammoth
[23720] = { id = 30174, f = 1, s = 60 }, -- Riding Turtle
[45596] = { id = 63642, f = 1, s = 100 }, -- Silvermoon Hawkstrider
[19030] = { id = 23510, f = 1, s = 100 }, -- Stormpike Battle Charger
[45125] = { id = 63232, f = 1, s = 100 }, -- Stormwind Steed
[46816] = { id = 66091, f = 1, s = 100 }, -- Sunreaver Hawkstrider
[49044] = { id = 68057, f = 1, s = 100 }, -- Swift Alliance Steed
[18788] = { id = 23241, f = 1, s = 100 }, -- Swift Blue Raptor
[33977] = { id = 43900, f = 1, s = 100 }, -- Swift Brewfest Ram
[18786] = { id = 23238, f = 1, s = 100 }, -- Swift Brown Ram
[18777] = { id = 23229, f = 1, s = 100 }, -- Swift Brown Steed
[46749] = { id = 65646, f = 1, s = 100 }, -- Swift Burgundy Wolf
[18787] = { id = 23239, f = 1, s = 100 }, -- Swift Gray Ram
[46752] = { id = 65640, f = 1, s = 100 }, -- Swift Gray Steed
[29223] = { id = 35025, f = 1, s = 100 }, -- Swift Green Hawkstrider
[18772] = { id = 23225, f = 1, s = 100 }, -- Swift Green Mechanostrider
[49046] = { id = 68056, f = 1, s = 100 }, -- Swift Horde Wolf

[46744] = { id = 65638, f = 1, s = 100 }, -- Swift Moonsaber
[18789] = { id = 23242, f = 1, s = 100 }, -- Swift Olive Raptor
[18790] = { id = 23243, f = 1, s = 100 }, -- Swift Orange Raptor
[18776] = { id = 23227, f = 1, s = 100 }, -- Swift Palomino
[28936] = { id = 33660, f = 1, s = 100 }, -- Swift Pink Hawkstrider
[29224] = { id = 35027, f = 1, s = 100 }, -- Swift Purple Hawkstrider
[46743] = { id = 65644, f = 1, s = 100 }, -- Swift Purple Raptor
[19872] = { id = 24242, f = 1, s = 100 }, -- Swift Razzashi Raptor
[46751] = { id = 65639, f = 1, s = 100 }, -- Swift Red Hawkstrider
[46748] = { id = 65643, f = 1, s = 100 }, -- Swift Violet Ram
[34129] = { id = 35028, f = 1, s = 100 }, -- Swift Warstrider
[35513] = { id = 46628, f = 1, s = 100 }, -- Swift White Hawkstrider
[18773] = { id = 23223, f = 1, s = 100 }, -- Swift White Mechanostrider
[18785] = { id = 23240, f = 1, s = 100 }, -- Swift White Ram
[18778] = { id = 23228, f = 1, s = 100 }, -- Swift White Steed
[18774] = { id = 23222, f = 1, s = 100 }, -- Swift Yellow Mechanostrider
[37719] = { id = 49322, f = 1, s = 100 }, -- Swift Zhevra
[19902] = { id = 24252, f = 1, s = 100 }, -- Swift Zulian Tiger
[15293] = { id = 18992, f = 1, s = 100 }, -- Teal Kodo
[37012] = { id = 48025, f = 3, s = 0 }, -- The Horseman's Reins / Headless Horseman's Mount
[45592] = { id = 63641, f = 1, s = 100 }, -- Thunder Bluff Kodo
[46747] = { id = 65642, f = 1, s = 100 }, -- Turbostrider
[29472] = { id = 22721, f = 1, s = 100 }, -- Whistle of the Black War Raptor / Black War Raptor
[13317] = { id = 17450, f = 1, s = 100 }, -- Whistle of the Ivory Raptor / Ivory Raptor
[8586] = { id = 16084, f = 1, s = 100 }, -- Whistle of the Mottled Red Raptor / Mottled Red Raptor
[46102] = { id = 64659, f = 1, s = 100 }, -- Whistle of the Venomhide Ravasaur / Venomhide Ravasaur
[13326] = { id = 15779, f = 1, s = 100 }, -- White Mechanostrider Mod B
[46746] = { id = 65645, f = 1, s = 100 }, -- White Skeletal Warhorse
[12353] = { id = 16083, f = 1, s = 100 }, -- White Stallion Bridle / White Stallion

[43599] = { id = 58983, f = 1, s = 0 }, -- Big Blizzard Bear
[29221] = { id = 35022, f = 1, s = 60 }, -- Black Hawkstrider
[46308] = { id = 64977, f = 1, s = 60 }, -- Black Skeletal Horse
[2411] = { id = 470, f = 1, s = 60 }, -- Black Stallion Bridle
[29220] = { id = 35020, f = 1, s = 60 }, -- Blue Hawkstrider
[8595] = { id = 10969, f = 1, s = 60 }, -- Blue Mechanostrider
[21218] = { id = 25953, r = 1, f = 1, s = 100 }, -- Blue Qiraji Resonating Crystal / Blue Qiraji Battle Tank
[13332] = { id = 17463, f = 1, s = 60 }, -- Blue Skeletal Horse
[37827] = { id = 50869, f = 1, s = 60 }, -- Brewfest Kodo
[33976] = { id = 43899, f = 1, s = 60 }, -- Brewfest Ram
[28481] = { id = 34406, f = 1, s = 60 }, -- Brown Elekk
[5656] = { id = 458, f = 1, s = 60 }, -- Brown Horse Bridle / Brown Horse
[15290] = { id = 18990, f = 1, s = 60 }, -- Brown Kodo
[5872] = { id = 6899, f = 1, s = 60 }, -- Brown Ram
[13333] = { id = 17464, f = 1, s = 60 }, -- Brown Skeletal Horse
[5655] = { id = 6648, f = 1, s = 60 }, -- Chestnut Mare Bridle / Chestnut Mare
[29744] = { id = 35710, f = 1, s = 60 }, -- Gray Elekk
[15277] = { id = 18989, f = 1, s = 60 }, -- Gray Kodo
[5864] = { id = 6777, f = 1, s = 60 }, -- Gray Ram
[13321] = { id = 17453, f = 1, s = 60 }, -- Green Mechanostrider
[21323] = { id = 26056, r = 1, f = 1, s = 100 }, -- Green Qiraji Resonating Crystal / Green Qiraji Battle Tank
[46099] = { id = 64658, f = 1, s = 60 }, -- Horn of the Black Wolf / Black Wolf
[5668] = { id = 6654, f = 1, s = 60 }, -- Horn of the Brown Wolf / Brown Wolf
[5665] = { id = 6653, f = 1, s = 60 }, -- Horn of the Dire Wolf / Dire Wolf
[1132] = { id = 580, f = 1, s = 60 }, -- Horn of the Timber Wolf / Timber Wolf
[2414] = { id = 472, f = 1, s = 60 }, -- Pinto Bridle / Pinto
[29743] = { id = 35711, f = 1, s = 60 }, -- Purple Elekk
[29222] = { id = 35018, f = 1, s = 60 }, -- Purple Hawkstrider
[28927] = { id = 34795, f = 1, s = 60 }, -- Red Hawkstrider
[8563] = { id = 10873, f = 1, s = 60 }, -- Red Mechanostrider
[21321] = { id = 26054, r = 1, f = 1, s = 100 }, -- Red Qiraji Resonating Crystal / Red Qiraji Battle Tank
[13331] = { id = 17462, f = 1, s = 60 }, -- Red Skeletal Horse
[49283] = { id = 42776, f = 1, s = 60 }, -- Reins of the Spectral Tiger / Spectral Tiger
[8632] = { id = 10789, f = 1, s = 60 }, -- Reins of the Spotted Frostsaber / Spotted Frostsaber
[8628] = { id = 10792, f = 1, s = 60 }, -- Reins of the Spotted Nightsaber / Spotted Panther
[47100] = { id = 66847, f = 1, s = 60 }, -- Reins of the Striped Dawnsaber / Striped Dawnsaber
[8631] = { id = 8394, f = 1, s = 60 }, -- Reins of the Striped Frostsaber / Striped Frostsaber
[8629] = { id = 10793, f = 1, s = 60 }, -- Reins of the Striped Nightsaber / Striped Nightsaber
[46109] = { id = 64731, f = 1, s = 60 }, -- Sea Turtle
[13322] = { id = 17454, f = 1, s = 60 }, -- Unpainted Mechanostrider
[8588] = { id = 8395, f = 1, s = 60 }, -- Whistle of the Emerald Raptor / Emerald Raptor
[8591] = { id = 10796, f = 1, s = 60 }, -- Whistle of the Turquoise Raptor / Turquoise Raptor
[8592] = { id = 10799, f = 1, s = 60 }, -- Whistle of the Violet Raptor / Violet Raptor
[46100] = { id = 64657, f = 1, s = 60 }, -- White Kodo
[5873] = { id = 6898, f = 1, s = 60 }, -- White Ram
[21324] = { id = 26055, r = 1, f = 1, s = 100 }, -- Yellow Qiraji Resonating Crystal / Yellow Qiraji Battle Tank

[49288] = { id = 'XI-49288', f = 1, s = 0 }, -- Little Ivory Raptor Whistle
[49289] = { id = 'XI-49289', f = 1, s = 0 }, -- Little White Stallion Bridle
[33189] = { id = 'XI-33189', f = 1, s = 60 }, -- Rickety Magic Broom

[16339] = { id = 'XI-16339', r = 1, f = 1, s = 60 }, -- Commander's Steed
[44221] = { id = 'XI-44221', r = 1, f = 1, s = 60 }, -- Loaned Gryphon Reins
[44229] = { id = 'XI-44229', r = 1, f = 1, s = 60 }, -- Loaned Wind Rider Reins
[8627] = { id = 'XI-8627', r = 1, f = 1, s = 60 }, -- Reins of the Nightsaber
[8628] = { id = 'XI-8628', r = 1, f = 1, s = 60 }, -- Reins of the Spotted Nightsaber


[25596] = { id = 32345, f = 2, s = 310 }, -- Peep's Whistle / Peep the Phoenix Mount

[45725] = { id = 63844, f = 2, s = 280 }, -- Argent Hippogryph
[44690] = { id = 61230, f = 2, s = 280 }, -- Armored Blue Wind Rider
[44689] = { id = 61229, f = 2, s = 280 }, -- Armored Snowy Gryphon
[32458] = { id = 40192, f = 2, s = 310 }, -- Ashes of Al'ar
[44843] = { id = 61996, f = 2, s = 280 }, -- Blue Dragonhawk Mount / Blue Dragonhawk
[32319] = { id = 39803, f = 2, s = 280 }, -- Blue Riding Nether Ray
[43516] = { id = 58615, f = 2, s = 310 }, -- Brutal Nether Drake
[54811] = { id = 75614, f = 3, s = 0 }, -- Celestial Steed
[33999] = { id = 43927, f = 2, s = 280 }, -- Cenarion War Hippogryph
[46708] = { id = 64927, f = 2, s = 310 }, -- Deadly Gladiator's Frost Wyrm
[54797] = { id = 75596, f = 2, s = 280 }, -- Frosty Flying Carpet
[46171] = { id = 65439, f = 2, s = 310 }, -- Furious Gladiator's Frost Wyrm
[32314] = { id = 39798, f = 2, s = 280 }, -- Green Riding Nether Ray
[44558] = { id = 61309, f = 2, s = 280 }, -- Magnificent Flying Carpet
[34092] = { id = 44744, f = 2, s = 310 }, -- Merciless Nether Drake
[45693] = { id = 63796, f = 2, s = 310 }, -- Mimiron's Head
[32316] = { id = 39801, f = 2, s = 280 }, -- Purple Riding Nether Ray
[44842] = { id = 61997, f = 2, s = 280 }, -- Red Dragonhawk Mount / Red Dragonhawk
[32317] = { id = 39800, f = 2, s = 280 }, -- Red Riding Nether Ray
[44178] = { id = 60025, f = 2, s = 280 }, -- Reins of the Albino Drake / Albino Drake
[43952] = { id = 59567, f = 2, s = 280 }, -- Reins of the Azure Drake / Azure Drake
[32858] = { id = 41514, f = 2, s = 280 }, -- Reins of the Azure Netherwing Drake / Azure Netherwing Drake
[43986] = { id = 59650, f = 2, s = 280 }, -- Reins of the Black Drake / Black Drake
[44164] = { id = 59976, f = 2, s = 310 }, -- Reins of the Black Proto-Drake / Black Proto-Drake
[51954] = { id = 72808, f = 2, s = 310 }, -- Reins of the Bloodbathed Frostbrood Vanquisher / Bloodbathed Frostbrood Vanquisher
[43953] = { id = 59568, f = 2, s = 280 }, -- Reins of the Blue Drake / Blue Drake
[44151] = { id = 59996, f = 2, s = 280 }, -- Reins of the Blue Proto-Drake / Blue Proto-Drake
[43951] = { id = 59569, f = 2, s = 280 }, -- Reins of the Bronze Drake / Bronze Drake
[32859] = { id = 41515, f = 2, s = 280 }, -- Reins of the Cobalt Netherwing Drake / Cobalt Netherwing Drake
[44707] = { id = 61294, f = 2, s = 280 }, -- Reins of the Green Proto-Drake / Green Proto-Drake
[51955] = { id = 72808, f = 2, s = 310 }, -- Reins of the Icebound Frostbrood Vanquisher / Icebound Frostbrood Vanquisher
[45801] = { id = 63956, f = 2, s = 310 }, -- Reins of the Ironbound Proto-Drake / Ironbound Proto-Drake
[32857] = { id = 41513, f = 2, s = 280 }, -- Reins of the Onyx Netherwing Drake / Onyx Netherwing Drake
[49636] = { id = 69395, f = 2, s = 310 }, -- Reins of the Onyxian Drake / Onyxian Drake
[44175] = { id = 60021, f = 2, s = 310 }, -- Reins of the Plagued Proto-Drake / Plagued Proto-Drake
[32860] = { id = 41516, f = 2, s = 280 }, -- Reins of the Purple Netherwing Drake / Purple Netherwing Drake
[43955] = { id = 59570, f = 2, s = 280 }, -- Reins of the Red Drake / Red Drake
[44160] = { id = 59961, f = 2, s = 280 }, -- Reins of the Red Proto-Drake / Red Proto-Drake
[45802] = { id = 63963, f = 2, s = 310 }, -- Reins of the Rusted Proto-Drake / Rusted Proto-Drake
[44168] = { id = 60002, f = 2, s = 280 }, -- Reins of the Time-Lost Proto-Drake / Time-Lost Proto-Drake
[43954] = { id = 59571, f = 2, s = 280 }, -- Reins of the Twilight Drake / Twilight Drake
[32861] = { id = 41517, f = 2, s = 280 }, -- Reins of the Veridian Netherwing Drake / Veridian Netherwing Drake
[32862] = { id = 41518, f = 2, s = 280 }, -- Reins of the Violet Netherwing Drake / Violet Netherwing Drake
[44177] = { id = 60024, f = 2, s = 310 }, -- Reins of the Violet Proto-Drake / Violet Proto-Drake
[46813] = { id = 66087, f = 2, s = 280 }, -- Silver Covenant Hippogryph
[32318] = { id = 39802, f = 2, s = 280 }, -- Silver Riding Nether Ray
[46814] = { id = 66088, f = 2, s = 280 }, -- Sunreaver Dragonhawk
[25473] = { id = 32242, f = 2, s = 280 }, -- Swift Blue Gryphon
[33182] = { id = 'XI-33182', f = 3, s = 0 }, -- Swift Flying Broom
[25528] = { id = 32290, f = 2, s = 280 }, -- Swift Green Gryphon
[25531] = { id = 32295, f = 2, s = 280 }, -- Swift Green Wind Rider
[33184] = { id = 'XI-33184', f = 3, s = 0 }, -- Swift Magic Broom
[30609] = { id = 37015, f = 2, s = 310 }, -- Swift Nether Drake
[25529] = { id = 32292, f = 2, s = 280 }, -- Swift Purple Gryphon
[25533] = { id = 32297, f = 2, s = 280 }, -- Swift Purple Wind Rider
[25527] = { id = 32289, f = 2, s = 280 }, -- Swift Red Gryphon
[25477] = { id = 32246, f = 2, s = 280 }, -- Swift Red Wind Rider
[25532] = { id = 32296, f = 2, s = 280 }, -- Swift Yellow Wind Rider
[34061] = { id = 44151, f = 2, s = 280 }, -- Turbo-Charged Flying Machine Control / Turbo-Charged Flying Machine
[37676] = { id = 49193, f = 2, s = 310 }, -- Vengeful Nether Drake
[40775] = { id = 54729, f = 2, s = 0 }, -- Winged Steed of the Ebon Blade / Death Knight
[49286] = { id = 46199, f = 2, s = 280 }, -- X-51 Nether-Rocket X-TREME

[25475] = { id = 32244, f = 2, s = 150 }, -- Blue Wind Rider
[25471] = { id = 32239, f = 2, s = 150 }, -- Ebon Gryphon
[33176] = { id = 'XI-33176', f = 3, s = 0 }, -- Flying Broom
[44554] = { id = 61451, f = 2, s = 150 }, -- Flying Carpet
[34060] = { id = 44153, f = 2, s = 150 }, -- Flying Machine Control / Flying Machine
[25470] = { id = 32235, f = 2, s = 150 }, -- Golden Gryphon
[25476] = { id = 32245, f = 2, s = 150 }, -- Green Wind Rider
[25472] = { id = 32240, f = 2, s = 150 }, -- Snowy Gryphon
[25474] = { id = 32243, f = 2, s = 150 }, -- Tawny Wind Rider
[49285] = { id = 46197, f = 2, s = 150 }, -- X-51 Nether-Rocket


['XS-48778'] = { id = 48778, f = 1, s = 100 }, -- Acherus Deathcharger / Death Knight
['XS-23214'] = { id = 23214, f = 1, s = 100 }, -- Charger / Paladin
['XS-23161'] = { id = 23161, f = 1, s = 100 }, -- Dreadsteed / Warlock
['XS-5784'] = { id = 5784, f = 1, s = 60 }, -- Felsteed / Warlock
['XS-34767'] = { id = 34767, f = 1, s = 100 }, -- Summon Charger / Blood Elf Paladin
['XS-34769'] = { id = 34769, f = 1, s = 60 }, -- Summon Warhorse / Blood Elf Paladin
['XS-13819'] = { id = 13819, f = 1, s = 60 }, -- Warhorse / Paladin


['XS-68188'] = { id = 68188, f = 2, s = 100 }, -- Crusader's Black Warhorse
['XS-68187'] = { id = 68187, f = 2, s = 100 }, -- Crusader's White Warhorse
['XS-67336'] = { id = 67336, f = 2, s = 310 }, -- Relentless Gladiator's Frost Wyrm
['XS-71810'] = { id = 71810, f = 2, s = 310 }, -- Wrathful Gladiator's Frost Wyrm
[52200] = { id = 73313, f = 1, s = 100 }, -- Reins of the Crimson Deathcharger / Crimson Deathcharger




}

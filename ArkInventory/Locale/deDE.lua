local L = LibStub( "AceLocale-3.0" ):NewLocale( "ArkInventory", "deDE" )
if not L then return end

-- post updated translations at http://groups.google.com/group/wow-arkinventory (modify this file and include as an attachment)
-- note: when creating a new locale do not leave any english translations in your file, comment them out by placing -- at the start of the line


-- Translated by: Dancer of Gul'dan
-- Translated by: <insert your name here>










--	wow skill headers - must match exactly what is in game
	L["WOW_SKILL_HEADER_PRIMARY"] = "Berufe"
	L["WOW_SKILL_HEADER_SECONDARY"] = "Sekund\195\164re Fertigkeiten"
	
	
--	wow skill names - must match exactly what is in game
	L["WOW_SKILL_ALCHEMY"] = "Alchimie"
	L["WOW_SKILL_BLACKSMITHING"] = "Schmiedekunst"
	L["WOW_SKILL_COOKING"] = "Kochkunst"
	L["WOW_SKILL_ENCHANTING"] = "Verzauberkunst"
	L["WOW_SKILL_ENGINEERING"] = "Ingenieurskunst"
	L["WOW_SKILL_FIRST_AID"] = "Erste Hilfe"
	L["WOW_SKILL_FISHING"] = "Angeln"
	L["WOW_SKILL_HERBALISM"] = "Kr\195\164uterkunde"
	L["WOW_SKILL_INSCRIPTION"] = "Inschriftenkunde"
	L["WOW_SKILL_JEWELCRAFTING"] = "Juwelenschleifen"
	L["WOW_SKILL_LEATHERWORKING"] = "Lederverarbeitung"
	L["WOW_SKILL_MINING"] = "Bergbau"
	L["WOW_SKILL_RIDING"] = "Reiten"
	L["WOW_SKILL_SKINNING"] = "K\195\188rschnerei"
	L["WOW_SKILL_TAILORING"] = "Schneiderei"
	
	
--	wow class names - must match exactly what is in game and must exist
	L["WOW_CLASS_DRUID"] = "Druide"
	L["WOW_CLASS_HUNTER"] = "J\195\164ger"
	L["WOW_CLASS_MAGE"] = "Magier"
	L["WOW_CLASS_PALADIN"] = "Paladin"
	L["WOW_CLASS_PRIEST"] = "Priester"
	L["WOW_CLASS_ROGUE"] = "Schurke"
	L["WOW_CLASS_SHAMAN"] = "Schamane"
	L["WOW_CLASS_WARLOCK"] = "Hexenmeister"
	L["WOW_CLASS_WARRIOR"] = "Krieger"
	L["WOW_CLASS_DEATHKNIGHT"] = "Todesritter"
	
	
--	wow item types - must match exactly what is in game
	L["WOW_ITEM_TYPE_ARMOR"] = "R\195\188stung"
	L["WOW_ITEM_TYPE_CONSUMABLE"] = "Verbrauchbar"
	L["WOW_ITEM_TYPE_CONSUMABLE_BANDAGE"] = "Verband"
	L["WOW_ITEM_TYPE_CONSUMABLE_ELIXIR"] = "Elixier"
	L["WOW_ITEM_TYPE_CONSUMABLE_FLASK"] = "Fl\195\164schchen"
	L["WOW_ITEM_TYPE_CONSUMABLE_FOOD_AND_DRINK"] = "Essen & Trinken"
	L["WOW_ITEM_TYPE_CONSUMABLE_POTION"] = "Trank"
	L["WOW_ITEM_TYPE_CONSUMABLE_SCROLL"] = "Rolle"
	L["WOW_ITEM_TYPE_CONTAINER"] = "Beh\195\164lter"
	L["WOW_ITEM_TYPE_CONTAINER_BAG"] = "Beh\195\164lter"
	L["WOW_ITEM_TYPE_CONTAINER_ENCHANTING"] = "Verzauberertasche"
	L["WOW_ITEM_TYPE_CONTAINER_ENGINEERING"] = "Ingenieurstasche"
	L["WOW_ITEM_TYPE_CONTAINER_GEM"] = "Edelsteintasche"
	L["WOW_ITEM_TYPE_CONTAINER_HERB"] = "Kr\195\164utertasche"
	L["WOW_ITEM_TYPE_CONTAINER_INSCRIPTION"] = "Schreibertasche"
	L["WOW_ITEM_TYPE_CONTAINER_LEATHERWORKING"] = "Lederertasche"
	L["WOW_ITEM_TYPE_CONTAINER_MINING"] = "Bergbautasche"
	L["WOW_ITEM_TYPE_CONTAINER_SOULSHARD"] = "Seelentasche"
	L["WOW_ITEM_TYPE_GEM"] = "Edelstein"
--	L["WOW_ITEM_TYPE_GLYPH"] = ""
	L["WOW_ITEM_TYPE_KEY"] = "Schl\195\188ssel"
	L["WOW_ITEM_TYPE_MISC"] = "Verschiedenes"
	L["WOW_ITEM_TYPE_MISC_MOUNT"] = "Reittier"
	L["WOW_ITEM_TYPE_MISC_PET"] = "Begleiter"
	L["WOW_ITEM_TYPE_MISC_REAGENT"] = "Reagenz"
	L["WOW_ITEM_TYPE_PROJECTILE"] = "Projektil"
	L["WOW_ITEM_TYPE_PROJECTILE_ARROW"] = "Pfeil"
	L["WOW_ITEM_TYPE_PROJECTILE_BULLET"] = "Kugel"
--	L["WOW_ITEM_TYPE_QUEST"] = ""
	L["WOW_ITEM_TYPE_QUIVER"] = "K\195\182cher"
	L["WOW_ITEM_TYPE_QUIVER_ARROW"] = "K\195\182cher"
	L["WOW_ITEM_TYPE_QUIVER_BULLET"] = "Munitionsbeutel"
	L["WOW_ITEM_TYPE_RECIPE"] = "Rezept"
	L["WOW_ITEM_TYPE_TRADE_GOODS"] = "Handwerkswaren"
	L["WOW_ITEM_TYPE_TRADE_GOODS_CLOTH"] = "Stoff"
	L["WOW_ITEM_TYPE_TRADE_GOODS_DEVICES"] = "Ger\195\164te"
	L["WOW_ITEM_TYPE_TRADE_GOODS_ELEMENTAL"] = "Elementar"
	L["WOW_ITEM_TYPE_TRADE_GOODS_ENCHANTMENT_ARMOR"] = "R\195\188stungsverzauberung"
	L["WOW_ITEM_TYPE_TRADE_GOODS_ENCHANTMENT_WEAPON"] = "Waffenverzauberung"
	L["WOW_ITEM_TYPE_TRADE_GOODS_EXPLOSIVES"] = "Sprengstoff"
	L["WOW_ITEM_TYPE_TRADE_GOODS_HERB"] = "Kr\195\164uter"
	L["WOW_ITEM_TYPE_TRADE_GOODS_LEATHER"] = "Leder"
	L["WOW_ITEM_TYPE_TRADE_GOODS_MEAT"] = "Fleisch"
	L["WOW_ITEM_TYPE_TRADE_GOODS_METAL_AND_STONE"] = "Metall & Stein"
	L["WOW_ITEM_TYPE_TRADE_GOODS_MATERIALS"] = "Materialien"
	L["WOW_ITEM_TYPE_TRADE_GOODS_PARTS"] = "Teile"
	
	
--	wow tooltip text - must match exactly what is in game
	L["WOW_ITEM_TOOLTIP_FOOD"] = "Ihr m\195\188sst beim Essen sitzen bleiben"
	L["WOW_ITEM_TOOLTIP_DRINK"] = "Ihr m\195\188sst beim Trinken sitzen bleiben"
	L["WOW_ITEM_TOOLTIP_POTION_HEAL"] = "Stellt %d+ bis %d+ Gesundheit wieder her"
	L["WOW_ITEM_TOOLTIP_POTION_MANA"] = "Stellt %d+ bis %d+ Mana wieder her"
	L["WOW_ITEM_TOOLTIP_ELIXIR_BATTLE"] = "Kampfelixier"
	L["WOW_ITEM_TOOLTIP_ELIXIR_GUARDIAN"] = "W\195\164chterelixier"
	
	
--	location names
	L["LOCATION_ALL"] = "alle"
	L["LOCATION_BAG"] = "Taschen"
	L["LOCATION_BANK"] = "Bankfach"
	L["LOCATION_WEARING"] = "angezogen"
	L["LOCATION_PET"] = "Begleiter"
	L["LOCATION_MOUNT"] = "Reittier"
	L["LOCATION_TOKEN"] = "Abzeichen"
	
	
--	subframe names
	L["SUBFRAME_NAME_TITLE"] = "Titel"
	L["SUBFRAME_NAME_SEARCH"] = "Suche"
	L["SUBFRAME_NAME_BAGCHANGER"] = "Taschenpl\195\164tze"
--	L["SUBFRAME_NAME_STATUS"] = ""
	
	
--	status bar/bag text
	L["STATUS_OFFLINE"] = "aus dem Zwischenspeicher"
	L["STATUS_NO_DATA"] = "KEINE DATEN"
	L["STATUS_FULL"] = "VOLL"
	L["STATUS_PURCHASE"] = "kaufen"
	
	
--	restack
	L["RESTACK"] = "stapeln und umordnen"
	L["RESTACK_TEXT"] = "Stapel werden maximal aufgef\195\188llt und Gegenst\195\164nde in ihre Spezialtaschen umgeordnet"
	L["RESTACK_FAIL_WAIT"] = "Die Gegenst\195\164nde werden bereits gestapelt und umgeordnet, bitte warten"
	L["RESTACK_FAIL_ACCESS"] = "Du hast keine Rechte um die Gegenst\195\164nde in Fach %2$s der %1$s zu stapeln oder umzuordnen"


--	vault tab tooltips
	L["VAULT_TAB_ACCESS_NONE"] = "Kein Zugriff"
	L["VAULT_TAB_NAME"] = "Fach: |cffffffff%1$s - %2$s|r" --(tab number, tab name)
	L["VAULT_TAB_ACCESS"] = "Zugriff: |cffffffff%1$s|r"
	L["VAULT_TAB_REMAINING_WITHDRAWALS"] = "Verbleibende t\195\164gliche Abhebungen: |cffffffff%1$s|r"
	
	
--	category "header" descriptions  (does not have to match wow)
	L["CATEGORY_CLASS"] = "Klasse"
	L["CATEGORY_CONSUMABLE"] = "Verbrauchbares"
	L["CATEGORY_CUSTOM"] = "Benutzerdefiniert"
	L["CATEGORY_EMPTY"] = "Leer"
	L["CATEGORY_OTHER"] = "Sonstiges"
	L["CATEGORY_RULE"] = "Regel"
	L["CATEGORY_SKILL"] = "Beruf"
--	L["CATEGORY_SYSTEM"] = ""
	L["CATEGORY_TRADE_GOODS"] = "Handwerkswaren"
	
	
--	system category descriptions
	L["CATEGORY_SYSTEM_CORE_MATS"] = "Kernmaterialien"
	L["CATEGORY_SYSTEM_DEFAULT"] = "Standard"
	L["CATEGORY_SYSTEM_EQUIPMENT"] = "Ausr\195\188stung"
	L["CATEGORY_SYSTEM_EQUIPMENT_SOULBOUND"] = "seelengebundene Ausr\195\188stung"
	L["CATEGORY_SYSTEM_REPUTATION"] = "Ruf"
	L["CATEGORY_SYSTEM_SOULBOUND"] = "Seelengebunden"
	L["CATEGORY_SYSTEM_SOULSHARD"] = "Seelensplitter"
	L["CATEGORY_SYSTEM_TOKEN"] = "Abzeichen"
	L["CATEGORY_SYSTEM_TRASH"] = "Plunder"
	
	
--	consumable category descriptions
	L["CATEGORY_CONSUMABLE_DRINK"] = "Getr\195\164nke"
	L["CATEGORY_CONSUMABLE_FOOD"] = "Essen"
	L["CATEGORY_CONSUMABLE_FOOD_PET"] = "Essen f\195\188r den Begleiter"
	L["CATEGORY_CONSUMABLE_POTION_HEAL"] = "Heiltr\195\164nke"
	L["CATEGORY_CONSUMABLE_POTION_MANA"] = "Manatr\195\164nke"
	L["CATEGORY_CONSUMABLE_ELIXIR_BATTLE"] = "Kampfelixiere"
	L["CATEGORY_CONSUMABLE_ELIXIR_GUARDIAN"] = "W\195\164chterelixiere"
	
	
--	bag names - used to name the empty slots in the status frame (and LDB)
	L["STATUS_NAME_BAG"] = "Taschen"
	L["STATUS_NAME_CRITTER"] = "Begleiter"
	L["STATUS_NAME_ENCHANTING"] = "Verzaubern"
	L["STATUS_NAME_ENGINEERING"] = "Ingenieur"
	L["STATUS_NAME_GEAR"] = "Ausr\195\188stung"
	L["STATUS_NAME_GEM"] = "Edelsteine"
	L["STATUS_NAME_HERB"] = "Kr\195\164uter"
	L["STATUS_NAME_INSCRIPTION"] = "Inschriftenkunde"
	L["STATUS_NAME_KEY"] = "Schl\195\188ssel"
	L["STATUS_NAME_LEATHERWORKING"] = "Leder"
	L["STATUS_NAME_MAIL"] = "Post"
	L["STATUS_NAME_MINING"] = "Bergbau"
	L["STATUS_NAME_MOUNT"] = "Reittier"
	L["STATUS_NAME_PROJECTILE"] = "Munition"
	L["STATUS_NAME_PROJECTILE_ARROW"] = "Pfeile"
	L["STATUS_NAME_PROJECTILE_BULLET"] = "Kugeln"
	L["STATUS_NAME_SOULSHARD"] = "Seelensplitter"
	L["STATUS_NAME_TOKEN"] = "Abzeichen"
	
	
--	main menu
	L["MENU"] = "Men\195\188"
	
	L["MENU_CHARACTER_SWITCH"] = "Charakter wechseln"
	L["MENU_CHARACTER_SWITCH_TEXT"] = "wechselt zu einem anderen Charakter"
	L["MENU_CHARACTER_SWITCH_CHOOSE_NONE"] = "keine Daten von anderen Charakteren vorhanden"
	L["MENU_CHARACTER_SWITCH_CHOOSE_TEXT"] = "zeigt die Daten von %1$s"
	L["MENU_CHARACTER_SWITCH_ERASE"] = "%s Daten l\195\182schen"
	L["MENU_CHARACTER_SWITCH_ERASE_TEXT"] = "%1$s Daten von %2$s l\195\182schen"
	
	L["MENU_LOCATION_SWITCH"] = "Position wechseln"
	L["MENU_LOCATION_SWITCH_TEXT"] = "positioniert das %1$s-Fenster an einer anderen Stelle"
	
	
--	actions menu
	L["MENU_ACTION"] = "Aktionen"
	L["MENU_ACTION_REFRESH"] = "Aktualisieren"
	L["MENU_ACTION_REFRESH_TEXT"] = "aktualisiert das Fenster"
	L["MENU_ACTION_RELOAD_TEXT"] = "l\195\164dt das Fenster neu (zu verwenden nachdem man Gegenst\195\164nde in den Ausr\195\188stungs-Sets ver\195\164ndert hat)"
	L["MENU_ACTION_EDITMODE"] = "Bearbeitungs-Modus"
	L["MENU_ACTION_EDITMODE_TEXT"] = "schaltet den Bearbeitungs-Modus ein oder aus (nur im Bearbeitungs-Modus kann man Leisten, Sortierung etc. ver\195\164ndern)"
	L["MENU_ACTION_BAGCHANGER"] = "Taschen anzeigen"
	L["MENU_ACTION_BAGCHANGER_TEXT"] = "bestimmt, ob die Taschenpl\195\164tze angezeigt werden sollen, damit man die Taschen wechseln kann"
	
	
--	item menu
	L["MENU_ITEM_TITLE"] = "Informationen zu diesem Gegenstand"
	L["MENU_ITEM_ITEM"] = "Gegenstand"
	L["MENU_ITEM_DEFAULT_RESET"] = "Standardzuordnung wiederherstellen"
--	L["MENU_ITEM_DEFAULT_RESET_TEXT"] = ""
	L["MENU_ITEM_ASSIGN_CHOICES"] = "verf\195\188gbare Kategorien"
	L["MENU_ITEM_ASSIGN_THIS"] = "dieser Kategorie zuordnen"
--	L["MENU_ITEM_ASSIGN_THIS_TEXT"] = ""
	L["MENU_ITEM_MOVE"] = "in Leiste %1$s verschieben"
	L["MENU_ITEM_RULE_NEW"] = "eine neue Regel erstellen"
	L["MENU_ITEM_RULE_ADD"] = "zu einer Regel hinzuf\195\188gen"
	L["MENU_ITEM_CUSTOM_NEW"] = "eine neue Kategorie erstellen"
	L["MENU_ITEM_DEBUG"] = "Informationen zur Fehlersuche"
	L["MENU_ITEM_DEBUG_BAG"] = "Tasche"
	L["MENU_ITEM_DEBUG_SLOT"] = "Platz"
	L["MENU_ITEM_DEBUG_BAG_TYPE"] = "Taschenart"
--	L["MENU_ITEM_DEBUG_AI_ID_SHORT"] = ""
--	L["MENU_ITEM_DEBUG_AI_ID_CACHE"] = ""
	L["MENU_ITEM_DEBUG_AI_ID_RULE"] = "Regel ID"
	L["MENU_ITEM_DEBUG_AI_ID_CATEGORY"] = "AI Kategorie"
	L["MENU_ITEM_DEBUG_CLASS"] = "Klasse"
	L["MENU_ITEM_DEBUG_QUALITY"] = "Qualit\195\164t"
	L["MENU_ITEM_DEBUG_LVL_ITEM"] = "Gegenstandsstufe"
	L["MENU_ITEM_DEBUG_LVL_USE"] = "Verwendbarkeitsstufe"
	L["MENU_ITEM_DEBUG_TYPE"] = "Typ"
	L["MENU_ITEM_DEBUG_SUBTYPE"] = "Subtyp"
	L["MENU_ITEM_DEBUG_EQUIP"] = "Position"
	L["MENU_ITEM_DEBUG_ID"] = "Blizzard-ID"
	L["MENU_ITEM_DEBUG_STACK"] = "Stapelgr\195\182\195\159e"
	L["MENU_ITEM_DEBUG_FAMILY"] = "Familie"
--	L["MENU_ITEM_DEBUG_PT"] = ""
	L["MENU_ITEM_DEBUG_PT_TEXT"] = "zeigt die PT-Sets an, in denen dieser Gegenstand ist"
	L["MENU_ITEM_DEBUG_PT_NONE"] = "dieser Gegenstand ist zurzeit in keinem PT-Set"
	L["MENU_ITEM_DEBUG_PT_TITLE"] = "PT-Sets in denen dieser Gegenstand ist"
	
	
--	bar menu
	L["MENU_BAR_TITLE"] = "Einstellungen der %1$s. Leiste"
	L["MENU_BAR_CATEGORY"] = "Kategorie"
	L["MENU_BAR_CATEGORY_TEXT"] = "Kategorie %1$s dieser Leiste zuordnen"
	L["MENU_BAR_CATEGORY_CURRENT"] = "aktuell zugeordnet"
	L["MENU_BAR_CATEGORY_ASSIGN"] = "verf\195\188gbare Kategorien"
	L["MENU_BAR_CATEGORY_REMOVE_TEXT"] = "entfernt %1$s von der Leiste %2$s, wodurch diese wieder zu einer Standardleiste wird" -- 1 Name der Kategorie, 2 Leistennummer
	L["MENU_BAR_CATEGORY_HIDDEN_TEXT"] = "Versteckt eine Kategorie.\n\nGegenst\195\164nde, die sich in einer versteckten Kategorie befinden, werden in der normalen Ansicht nicht angezeigt."
	L["MENU_BAR_OPTIONS"] = "Leisteneinstellungen"
	L["MENU_BAR_CLEAR_TEXT"] = "Entfernt alle dieser Leiste zugeordneten Kategorien, mit Ausnahme der Standardkategorie."
	L["MENU_BAR_INSERT_TEXT"] = "F\195\188gt an dieser Stelle eine Leiste ein, welche alle Kategorien um eins nach oben verschiebt."
	L["MENU_BAR_REMOVE_TEXT"] = "Entfernt diese Leiste (alle Gegenst\195\164nde kommen wieder in die Standardleiste) und die Leiste dar\195\188ber nimmt diesen Platz ein.\n\nFalls dies die Standardleiste ist, wird Leiste 1 zur neuen Standardleiste."
--	L["MENU_BAR_MOVE_TEXT"] = ""
--	L["MENU_BAR_MOVE_START_TEXT"] = ""
--	L["MENU_BAR_MOVE_COMPLETE_TEXT"] = ""
--	L["MENU_BAR_SORTKEY_TEXT"] = ""
--	L["MENU_BAR_SORTKEY_DEFAULT_RESET_TEXT"] = ""
	
	
--	changer bag menu
	L["MENU_BAG_TITLE"] = "Taschen-Einstellungen"
	L["MENU_BAG_SHOW"] = "Anzeigen"
	L["MENU_BAG_SHOW_TEXT"] = "zeigt den Inhalt dieser Tasche an"
	L["MENU_BAG_ISOLATE"] = "Einzelansicht"
	L["MENU_BAG_ISOLATE_TEXT"] = "nur den Inhalt dieser Tasche anzeigen"
	L["MENU_BAG_SHOWALL"] = "alle anzeigen"
	L["MENU_BAG_SHOWALL_TEXT"] = "den Inhalt aller Taschen anzeigen"
	
	
--	configuration options
	L["CONFIG"] = "Einstellungen"
	L["CONFIG_TEXT"] = "Konfigurationsmen\195\188"
	
--	configuration options > system
--	L["CONFIG_SYSTEM"] = ""
	L["CONFIG_SYSTEM_TEXT"] = "Systemeinstellungen"
	
	L["CONFIG_SYSTEM_FONT_TEXT"] = "Legt fest, dass die Schriftart %s verwendet werden soll."
	
	L["CONFIG_SYSTEM_TOOLTIP"] = "Hinweistexte"
	L["CONFIG_SYSTEM_TOOLTIP_ENABLE_TEXT"] = "Bestimmt, ob Hinweistexte angezeigt werden."
	L["CONFIG_SYSTEM_TOOLTIP_EMPTY_ADD"] = "Leere Zeile"
	L["CONFIG_SYSTEM_TOOLTIP_EMPTY_ADD_TEXT"] = "F\195\188gt eine leere Zeile zwischen dem normalen Hinweistext und dem zus\195\164tzlichen Text ein."
	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_ADD"] = "Anzahl der Gegenst\195\164nde anzeigen"
	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_ADD_TEXT"] = "Bestimmt, ob die Anzahl der Gegenst\195\164nde angezeigt wird."
	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_COLOUR_TEXT"] = "Legt die Farbe des Textes, der die Anzahl der Gegenst\195\164nde anzeigt, fest."
--	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_VAULT_TABS"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_VAULT_TABS_TEXT"] = ""
	L["CONFIG_SYSTEM_TOOLTIP_VENDOR_ADD"] = "Kaufpreis des H\195\164ndlers anzeigen"
	L["CONFIG_SYSTEM_TOOLTIP_VENDOR_ADD_TEXT"] = "Bestimmt, ob der Kaufpreis des H\195\164ndlers angezeigt wird."
	L["CONFIG_SYSTEM_TOOLTIP_VENDOR_COLOUR_TEXT"] = "Legt fest, in welcher Farbe der Kaufpreis des H\195\164ndlers angezeigt wird."
--	L["CONFIG_SYSTEM_TOOLTIP_ITEMLEVEL_ADD"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_ITEMLEVEL_ADD_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_SCALE_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_CLASSCOLOUR_TEXT"] = ""
	L["CONFIG_SYSTEM_TOOLTIP_SELF_ONLY"] = "nur eigene"
	L["CONFIG_SYSTEM_TOOLTIP_SELF_ONLY_TEXT"] = "Zeigt die Anzahl der Gegenst\195\164nde des aktuellen Charakters."
--	L["CONFIG_SYSTEM_TOOLTIP_FACTION_ONLY"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_FACTION_ONLY_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_VAULT_TEXT"] = ""
	
	L["CONFIG_SYSTEM_BUGFIX"] = "Fehlerbehebungen / Workarounds"
	L["CONFIG_SYSTEM_BUGFIX_TEXT"] = "Schaltet die Fehlerbehebung f\195\188r diese Problem ein."
--	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL"] = ""
	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL_TEXT"] = "Ein Fehler in der Blizzard CreateFrame-API kann dazu f\195\188hren, dass der Rahmenhintergrund \195\188ber dem Vordergrund liegt, wodurch keine Hinweistexte angezeigt werden und im betroffenen Fenster auch nichts mehr ausgew\195\164hlt werden kann."
	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_TEXT"] = "Legt fest, ob und wie ausf\195\188hrlich, Meldungen bei einer Fehlerbehebung angezeigt werden."
	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE0"] = "aus"
	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE0_TEXT"] = "Meldungen bei einer Fehlerbehebung werden nicht angezeigt"
	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE1"] = "kurz"
	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE1_TEXT"] = "es werden nur kurze Meldungen bei einer Fehlerbehebung angezeigt"
	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE2"] = "lang"
	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE2_TEXT"] = "es werden ausf\195\188hrliche Meldungen bei einer Fehlerbehebung angezeigt"
--	L["CONFIG_SYSTEM_BUGFIX_ZEROSIZEBAG"] = ""
--	L["CONFIG_SYSTEM_BUGFIX_ZEROSIZEBAG_TEXT"] = ""
--	L["CONFIG_SYSTEM_BUGFIX_ZEROSIZEBAG_ALERT_TEXT"] = ""
	
	
--	configuration options > auto
	L["CONFIG_AUTO"] = "automatisches \195\150ffnen/Schlie\195\159en"
	
	L["CONFIG_AUTO_OPEN"] = "\195\182ffne %1$s %2$s beim %3$s" -- program, bag
	L["CONFIG_AUTO_OPEN_BANK"] = "\195\150ffnen des Bankfachs"
	L["CONFIG_AUTO_OPEN_VAULT"] = "\195\150ffnen der Gildenbank"
	L["CONFIG_AUTO_OPEN_MAIL"] = "\195\150ffnen des Briefkastens"
	L["CONFIG_AUTO_OPEN_MERCHANT"] = "H\195\164ndler"
	L["CONFIG_AUTO_OPEN_TRADE"] = "Handeln"
	L["CONFIG_AUTO_OPEN_AUCTION"] = "Auktionator"
	
	L["CONFIG_AUTO_CLOSE"] = "schlie\195\159e %1$s %2$s beim %3$s"
	L["CONFIG_AUTO_CLOSE_BANK"] = "Schlie\195\159en des Bankfachs"
	L["CONFIG_AUTO_CLOSE_VAULT"] = "Schlie\195\159en der Gildenbank"
	L["CONFIG_AUTO_CLOSE_MAIL"] = "Schlie\195\159en des Briefkastens"
	L["CONFIG_AUTO_CLOSE_MERCHANT"] = "Verlassen des H\195\164ndlers"
	L["CONFIG_AUTO_CLOSE_TRADE"] = "Beenden eines Handels"
	L["CONFIG_AUTO_CLOSE_AUCTION"] = "Verlassen des Auktionators"
	L["CONFIG_AUTO_CLOSE_COMBAT"] = "Beginn eines Kampfes"
	
	
--	configuration options > control
	L["CONFIG_CONTROL"] = "Verwendung"
	
	L["CONFIG_CONTROL_MONITOR"] = "\195\188berwachen"
	L["CONFIG_CONTROL_MONITOR_TEXT"] = "\195\156berwache \195\132nderungen an den %1$s Daten dieses Charakters (%2$s)."
	L["CONFIG_CONTROL_SAVE"] = "zwischenspeichern"
	L["CONFIG_CONTROL_SAVE_TEXT"] = "Speichern der %1$s Daten dieses Charakters (%2$s), so dass man sie auch ansehen kann, wenn man mit einem anderen Charakter spielt oder offline ist."
--	L["CONFIG_CONTROL_NOTIFY_ERASE"] = ""
--	L["CONFIG_CONTROL_NOTIFY_ERASE_TEXT"] = ""
	L["CONFIG_CONTROL_OVERRIDE"] = "Blizzard Interface austauschen"
	L["CONFIG_CONTROL_OVERRIDE_TEXT"] = "Tauscht das original Blizzard %2$s Interface mit dem von %1$s.\n\nIn abgeschaltetem Zustand wird das standard Blizzard %2$s Interface verwendet.\n\nMan kann in abgeschaltetem Zustand trotzdem das %2$s Interface von %1$s verwenden, aber man muss dann daf\195\188r erst Tastenkombinationen einrichten."
	L["CONFIG_CONTROL_ANCHOR_LOCK_TEXT"] = "verhindert, dass der %1$s Rahmen verschoben werden kann"
	L["CONFIG_CONTROL_SETTINGS_TEXT"] = "welche Einstellungen verwendet werden sollen, wenn das %1$s Fenster erstellt wird"
	
	
--	configuration options > settings
	L["CONFIG_SETTINGS"] = "Einstellungen"
	
	L["CONFIG_SETTINGS_FRAME"] = "Fenster"
	
--	L["CONFIG_SETTINGS_FRAME_HIDE_TEXT"] = ""
	
	L["CONFIG_SETTINGS_FRAME_SCALE_TEXT"] = "mit der Skalierung kann man Fenster gr\195\182\195\159er oder kleiner machen"
	L["CONFIG_SETTINGS_FRAME_PADDING_TEXT"] = "legt den Abstand zwischen dem Fensterrand und den Leisten fest"
	L["CONFIG_SETTINGS_FRAME_WIDTH_TEXT"] = "legt die Anzahl an Spalten fest"
	L["CONFIG_SETTINGS_FRAME_BACKGROUND_COLOUR_TEXT"] = "legt die Hintergrundfarbe des Hauptfensters fest"
	L["CONFIG_SETTINGS_FRAME_BORDER_SHOW_TEXT"] = "bestimmt, ob ein Rahmen um das Hauptfenster angezeigt wird"
	L["CONFIG_SETTINGS_FRAME_BORDER_STYLE_TEXT"] = "legt die Rahmenart des Hauptfensters fest"
	L["CONFIG_SETTINGS_FRAME_BORDER_COLOUR_TEXT"] = "legt die Rahmenfarbe des Hauptfensters fest"

	L["CONFIG_SETTINGS_FRAME_CHANGER_HIGHLIGHT"] = "Farbe zum Hervorheben einer Tasche"
--	L["CONFIG_SETTINGS_FRAME_CHANGER_HIGHLIGHT_TEXT"] = ""
	L["CONFIG_SETTINGS_FRAME_CHANGER_HIGHLIGHT_COLOUR_TEXT"] = "die Farbe zum Hervorheben der Taschenpl\195\164tze, wenn man mit der Maus \195\188ber eine Tasche f\195\164hrt"
	L["CONFIG_SETTINGS_FRAME_CHANGER_FREE"] = "Anzahl anzeigen"
	L["CONFIG_SETTINGS_FRAME_CHANGER_FREE_TEXT"] = "Bestimmt, ob die Anzahl der freien Pl\195\164tze an den Taschen angezeigt werden soll."
	L["CONFIG_SETTINGS_FRAME_CHANGER_FREE_COLOUR_TEXT"] = "Textfarbe f\195\188r die Anzahl der freien Pl\195\164tze."
	
--	L["CONFIG_SETTINGS_FRAME_STATUS_EMPTY"] = ""
--	L["CONFIG_SETTINGS_FRAME_STATUS_EMPTY_TEXT"] = ""
	
--	L["CONFIG_SETTINGS_FRAME_TITLE_SIZE_NORMAL"] = ""
--	L["CONFIG_SETTINGS_FRAME_TITLE_SIZE_THIN"] = ""
	
	L["CONFIG_SETTINGS_BARS"] = "Leisten"
	L["CONFIG_SETTINGS_BARS_PER_ROW"] = "pro Zeile"
	L["CONFIG_SETTINGS_BARS_PER_ROW_TEXT"] = "legt die Anzahl an Leisten pro Zeile fest"
	L["CONFIG_SETTINGS_BARS_BACKGROUND_TEXT"] = "legt die Hintergrundfarbe der Leisten fest"
	L["CONFIG_SETTINGS_BARS_COMPACT"] = "kompakt"
	L["CONFIG_SETTINGS_BARS_COMPACT_TEXT"] = "zeigt nur benutze Leisten gem\195\164\195\159 ihrer Reihenfolge an"
	L["CONFIG_SETTINGS_BARS_SHOW_EMPTY"] = "leere anzeigen"
	L["CONFIG_SETTINGS_BARS_SHOW_EMPTY_TEXT"] = "festlegen, ob leere Leisten angezeigt werden sollen"
	L["CONFIG_SETTINGS_BARS_PADDING_INTERNAL_TEXT"] = "Abstand zwischen den Gegenst\195\164nden"
	L["CONFIG_SETTINGS_BARS_PADDING_EXTERNAL_TEXT"] = "Abstand zwischen den Leisten"
	L["CONFIG_SETTINGS_BARS_BORDER_TEXT"] = "bestimmt, ob ein Rahmen um jede Leiste angezeigt wird"
	L["CONFIG_SETTINGS_BARS_BORDER_STYLE_TEXT"] = "legt die Rahmenart der Leisten fest"
	L["CONFIG_SETTINGS_BARS_BORDER_COLOUR_TEXT"] = "legt die Rahmenfarbe der Leisten fest"
	L["CONFIG_SETTINGS_BARS_NAME_TEXT"] = "zum Festlegen einer Beschriftung f\195\188r diese Leiste"
	L["CONFIG_SETTINGS_BARS_NAME_SHOW_TEXT"] = "bestimmt, ob die Beschriftungen der Leisten angezeigt werden"
	L["CONFIG_SETTINGS_BARS_NAME_COLOUR_TEXT"] = "legt die Textfarbe der Leistenbeschriftungen fest"
--	L["CONFIG_SETTINGS_BARS_NAME_HEIGHT_TEXT"] = ""
	
	L["CONFIG_SETTINGS_ITEMS"] = "Gegenst\195\164nde"
	L["CONFIG_SETTINGS_ITEMS_PADDING_TEXT"] = "legt den Abstand zwischen den Pl\195\164tzen der Gegenst\195\164nde fest"
	L["CONFIG_SETTINGS_ITEMS_HIDDEN"] = "versteckte anzeigen"
	L["CONFIG_SETTINGS_ITEMS_HIDDEN_TEXT"] = "bestimmt, ob Gegenst\195\164nde aus versteckten Kategorien angezeigt werden sollen"
	L["CONFIG_SETTINGS_ITEMS_FADE"] = "verbleichen, wenn nicht verf\195\188gbar"
	L["CONFIG_SETTINGS_ITEMS_FADE_TEXT"] = "bestimmt, ob nicht verf\195\188gbare Gegenst\195\164nde verblichen dargestellt werden sollen"
	L["CONFIG_SETTINGS_ITEMS_TINT_USABLE"] = "Benutzbare einf\195\164rben"
	L["CONFIG_SETTINGS_ITEMS_TINT_USABLE_TEXT"] = "Benutzbare Gegenst\195\164nde rot einf\195\164rben"
	L["CONFIG_SETTINGS_ITEMS_BORDER_SHOW_TEXT"] = "bestimmt, ob ein Rahmen um die Gegenst\195\164nde angezeigt wird"
	L["CONFIG_SETTINGS_ITEMS_BORDER_STYLE_TEXT"] = "bestimmt die Rahmenart f\195\188r Gegenst\195\164nde"
	L["CONFIG_SETTINGS_ITEMS_BORDER_RARITY"] = "Seltenheit bestimmt Rahmenfarbe"
	L["CONFIG_SETTINGS_ITEMS_BORDER_RARITY_TEXT"] = "bestimmt, ob der Rahmen um jeden Gegenst\195\164nd mit der Farbe dessen Seltenheit gezeichnet wird (verbreitet, rar, episch, etc)"
--	L["CONFIG_SETTINGS_ITEMS_BORDER_RARITY_CUTOFF"] = ""
--	L["CONFIG_SETTINGS_ITEMS_BORDER_RARITY_CUTOFF_TEXT"] = ""
	L["CONFIG_SETTINGS_ITEMS_BORDER_TEXTURE_OFFSET_TEXT"] = "Anzahl der Pixel vom Bildrand zum Beginn des Rahmens (wird beim Positionieren des Texturrahmens auf dem Rahmen des Gegenstandes verwendet)"
	L["CONFIG_SETTINGS_ITEMS_AGE"] = "neue Gegenst\195\164nde"
	L["CONFIG_SETTINGS_ITEMS_AGE_SHOW_TEXT"] = "bestimmt, ob neue Gegenst\195\164nde im %s Fenster markiert werden sollen"
	L["CONFIG_SETTINGS_ITEMS_AGE_COLOUR_TEXT"] = "legt die Farbe f\195\188r die Markierung fest"
--	L["CONFIG_SETTINGS_ITEMS_AGE_CUTOFF"] = ""
--	L["CONFIG_SETTINGS_ITEMS_AGE_CUTOFF_TEXT"] = ""
	L["CONFIG_SETTINGS_ITEMS_AGE_RESET_TEXT"] = "vergisst die als neu zu markierenden Gegenst\195\164nde"
--	L["CONFIG_SETTINGS_ITEMS_COOLDOWN_SHOW_TEXT"] = ""
--	L["CONFIG_SETTINGS_ITEMS_COOLDOWN_GLOBAL"] = ""
--	L["CONFIG_SETTINGS_ITEMS_COOLDOWN_GLOBAL_TEXT"] = ""
--	L["CONFIG_SETTINGS_ITEMS_COOLDOWN_COMBAT"] = ""
--	L["CONFIG_SETTINGS_ITEMS_COOLDOWN_COMBAT_TEXT"] = ""
	
	L["CONFIG_SETTINGS_SORTING_OPEN"] = "beim \195\150ffnenn des Fensters"
	L["CONFIG_SETTINGS_SORTING_OPEN_TEXT"] = "Die Gegenst\195\164nde werden erst beim \195\150ffnenn des Fensters sortiert."
	L["CONFIG_SETTINGS_SORTING_INSTANT"] = "sofort"
	L["CONFIG_SETTINGS_SORTING_INSTANT_TEXT"] = "Sofortige Sortierung\n\nan: wenn sich etwas ver\195\164ndert, wird sortiert\n\naus: beim \195\150ffnenn des Fensters oder wenn du auf Aktualisieren klickst, wird sortiert"
	
	L["CONFIG_SETTINGS_EMPTY"] = "freie Pl\195\164tze"
	L["CONFIG_SETTINGS_EMPTY_ICON"] = "Symbol verwenden"
	L["CONFIG_SETTINGS_EMPTY_ICON_TEXT"] = "Freie Pl\195\164tze mit Bild oder nur in einer Farbe anzeigen."
	L["CONFIG_SETTINGS_EMPTY_CLUMP"] = "typisiert"
	L["CONFIG_SETTINGS_EMPTY_CLUMP_TEXT"] = "Freie Pl\195\164tze von Spezialtaschen bei ihrer Kategorie anzeigen oder zur allgemeinen Kategorie hinzuf\195\188gen."
	L["CONFIG_SETTINGS_EMPTY_BORDER"] = "farbiger Rahmen"
	L["CONFIG_SETTINGS_EMPTY_BORDER_TEXT"] = "Freie Pl\195\164tze mit der Farbe ihrer Taschenart umrahmen."
	L["CONFIG_SETTINGS_EMPTY_COLOUR"] = "Farben der Pl\195\164tze"
	L["CONFIG_SETTINGS_EMPTY_COLOUR_TEXT"] = "Die Farbe, mit der die freien Pl\195\164tze f\195\188r %1$s markiert werden." -- slot name
--	L["CONFIG_SETTINGS_EMPTY_STATUS"] = ""
	
	
-- sorting
--	L["CONFIG_SORTMETHOD"] = ""
	
	L["CONFIG_SORTMETHOD_SORT"] = "Sortierung"
	
	L["CONFIG_SORTMETHOD_STYLE_TEXT"] = "Bestimme, wie du deine Gegenst\195\164nde sortieren willst."
	L["CONFIG_SORTMETHOD_STYLE_BAGSLOT"] = "Tasche / Platz"
	L["CONFIG_SORTMETHOD_STYLE_BAGSLOT_TEXT"] = "Sortiert das Inventar anhand der Taschen und Platznummern."
	L["CONFIG_SORTMETHOD_STYLE_USER"] = "Benutzerdefiniert"
	L["CONFIG_SORTMETHOD_STYLE_USER_TEXT"] = "Du bestimmst, wie deine Taschen sortiert werden sollen."
	
--	L["CONFIG_SORTMETHOD_INCLUDE_NAME"] = ""
	L["CONFIG_SORTMETHOD_INCLUDE_NAME_TEXT"] = "Den Namen des Gegenstandes beim Sortieren des Inventars verwenden."
	L["CONFIG_SORTMETHOD_INCLUDE_NAME_REVERSE"] = "W\195\182rter des Namens umkehren"
	L["CONFIG_SORTMETHOD_INCLUDE_NAME_REVERSE_TEXT"] = "Bei der Namenssortierung werden die einzelnen W\195\182rter in umgekehrter Reihenfolge verwendet.\n\neg Erstklassiger Manatrank wird zu Manatrank Erstklassiger"
	L["CONFIG_SORTMETHOD_INCLUDE_QUALITY"] = "Seltenheit"
	L["CONFIG_SORTMETHOD_INCLUDE_QUALITY_TEXT"] = "Die Gegenst\195\164nde anhand ihrer Seltenheit sortieren."
	L["CONFIG_SORTMETHOD_INCLUDE_LOCATION"] = "Art des Kleidungsst\195\188cks"
	L["CONFIG_SORTMETHOD_INCLUDE_LOCATION_TEXT"] = "Die Art des Kleidungsst\195\188cks beim Sortieren des Inventars verwenden.\n\nAnmerkung: Betrifft nur Kleidung, die angezogen werden kann."
	L["CONFIG_SORTMETHOD_INCLUDE_ITEMTYPE"] = "Typ und Subtyp"
	L["CONFIG_SORTMETHOD_INCLUDE_ITEMTYPE_TEXT"] = "Typ und Subtyp beim Sortieren des Inventars verwenden."
	L["CONFIG_SORTMETHOD_INCLUDE_CATEGORY"] = "Kategorie"
	L["CONFIG_SORTMETHOD_INCLUDE_CATEGORY_TEXT"] = "Die Kategorie eines Gegenstandes beim Sortieren des Inventars verwenden."
	L["CONFIG_SORTMETHOD_INCLUDE_ITEMUSELEVEL"] = "Verwendbarkeitsstufe"
	L["CONFIG_SORTMETHOD_INCLUDE_ITEMUSELEVEL_TEXT"] = "Die Stufe, ab der ein Gegenstand verwendet werden kann, bestimmt die Sortierreihenfolge."
	L["CONFIG_SORTMETHOD_INCLUDE_ITEMSTATLEVEL"] = "Gegenstandsstufe"
	L["CONFIG_SORTMETHOD_INCLUDE_ITEMSTATLEVEL_TEXT"] = "Die Stufe eines Gegenstandes beim Sortieren des Inventars verwenden."
--	L["CONFIG_SORTMETHOD_INCLUDE_ITEMAGE"] = ""
--	L["CONFIG_SORTMETHOD_INCLUDE_ITEMAGE_TEXT"] = ""
	L["CONFIG_SORTMETHOD_INCLUDE_VENDORPRICE"] = "Preis beim H\195\164ndler"
	L["CONFIG_SORTMETHOD_INCLUDE_VENDORPRICE_TEXT"] = "Der Verkaufspreis (gestapelte Gegenst\195\164nde werden aufsummiert) bestimmt die Sortierreihenfolge."
	
	L["CONFIG_SORTMETHOD_DIRECTION_TEXT"] = "Gegenst\195\164nde in aufsteigender oder absteigender Reihenfolge sortieren."
	L["CONFIG_SORTMETHOD_ORDER"] = "Sortierreihenfolge"
	L["CONFIG_SORTMETHOD_MOVE_UP_TEXT"] = "verschiebt %1$s in der Sortierreihenfolge nach oben"
	L["CONFIG_SORTMETHOD_MOVE_DOWN_TEXT"] = "verschiebt %1$s in der Sortierreihenfolge nach unten"
	L["CONFIG_SORTMETHOD_NOT_INCLUDED"] = "* wird zurzeit beim Sortieren nicht beachtet *"
	
--	L["CONFIG_SORTMETHOD_ADD"] = ""
--	L["CONFIG_SORTMETHOD_ADD_TEXT"] = ""
--	L["CONFIG_SORTMETHOD_RENAME_TEXT"] = ""
--	L["CONFIG_SORTMETHOD_DELETE_TEXT"] = ""
	
	
-- search
	L["CONFIG_SEARCH"] = "Suchen"
	
	
-- rules
	L["CONFIG_RULES"] = "Regeln"
	L["CONFIG_RULES_SHOWDISABLED"] = "deaktivierte Regeln anzeigen"
	L["CONFIG_RULES_SHOWDISABLED_TEXT"] = "bestimmt, ob deaktivierte Regeln angezeigt werden sollen"

	
--	configuration options > categories
	L["CONFIG_CATEGORY"] = "Kategorien"
	
	L["CONFIG_CATEGORY_CUSTOM"] = "Eigene Kategorien"
--	L["CONFIG_CATEGORY_DELETED"] = ""
	
--	L["CONFIG_CATEGORY_ADD"] = ""
--	L["CONFIG_CATEGORY_ADD_TEXT"] = ""
--	L["CONFIG_CATEGORY_RENAME_TEXT"] = ""
--	L["CONFIG_CATEGORY_DELETE_TEXT"] = ""
	
	
--	configuration options > debug
	L["CONFIG_DEBUG"] = "Modus zur Fehlersuche"
	L["CONFIG_DEBUG_TEXT"] = "legt fest, ob der Programmcode zur Fehlersuche ausgef\195\188hrt wird"
	
	
--	configuration options > generic
--	L["BORDER_SCALE_TEXT"] = ""
	L["BORDER_TEXTURE_TEXT"] = "Einstellungen zur Rahmentextur"
	L["BORDER_TEXTURE_FILE_TEXT"] = "Textur, die f\195\188r den Rahmen verwendet werden soll (bei einer \195\132nderung wird die Skalierung auf 100% zur\195\188ckgesetzt)"
	L["BORDER_TEXTURE_HEIGHT_TEXT"] = "H\195\182he der Textur (in Pixeln)"
	
	
--	rules frame
	L["RULE"] = "Regel"
	L["RULE_ENABLED"] = "aktiv"
	L["RULE_HIDDEN"] = "versteckt"
	L["RULE_ORDER"] = "Reihenfolge"
	L["RULE_DESCRIPTION"] = "Beschreibung"
	L["RULE_FORMULA"] = "Ausdruck"
	L["RULE_SEARCH"] = "Suchen"
	L["RULE_LIST_ENABLED"] = "Akt"
	L["RULE_LIST_DAMAGED"] = "Def"
	L["RULE_LIST_ID"] = "Regel"
	L["RULE_LIST_ORDER"] = "Reihenfolge"
	L["RULE_LIST_DESCRIPTION"] = "Beschreibung"
	
	L["RULE_DAMAGED"] = "Regel %s wird als defekt markiert und daher nicht l\195\164nger ausgef\195\188hrt, bis sie wieder korrigiert wurde"
--	L["RULE_FAILED"] = ""
	L["RULE_FAILED_KEY_NIL"] = "der angegebene Schl\195\188ssel ist nicht gesetzt"
	L["RULE_FAILED_DATA_NIL"] = "die angegebenen Daten sind nicht gesetzt"
	L["RULE_FAILED_DESCRIPTION_NIL"] = "fehlende Beschreibung"
	L["RULE_FAILED_FORMULA_NIL"] = "fehlender Ausdruck"
--	L["RULE_FAILED_FORMULA_BAD"] = ""
--	L["RULE_FAILED_ARGUMENT_IS_NIL"] = ""
--	L["RULE_FAILED_ARGUMENT_IS_INVALID"] = ""
--	L["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"] = ""
--	L["RULE_FAILED_ADDON_NOT_LOADED"] = ""
	
	
--	new item indicators
--	L["NEW_ITEM_INCREASE"] = ""
--	L["NEW_ITEM_DECREASE"] = ""
	
	
--	slash commands
--	L["SLASH_UI"] = ""
	L["SLASH_UI_TEXT"] = "Optionen zur Benutzeroberfl\195\164che"
	L["SLASH_UI_RESET"] = "standard"
	L["SLASH_UI_RESET_TEXT"] = "setzt die Benutzeroberfl\195\164che auf die Standardeinstellung zur\195\188ck"
	L["SLASH_UI_RESET_COMPLETE_TEXT"] = "alle Fensterpositionen wurden auf die Standardeinstellung zur\195\188ckgesetzt (zentriert)"
--	L["SLASH_DB"] = ""
	L["SLASH_DB_TEXT"] = "Datenbankoptionen"
	L["SLASH_DB_RESET"] = "standard"
	L["SLASH_DB_RESET_TEXT"] = "setzt die Profil-Datenbank auf die Standardwerte zur\195\188ck"
	L["SLASH_DB_RESET_CONFIRM"] = "akzeptieren"
	L["SLASH_DB_RESET_CONFIRM_TEXT"] = "best\195\164tigt das Zur\195\188cksetzen der Profil-Datenbank"
	L["SLASH_DB_RESET_COMPLETE_TEXT"] = "Profil-Datenbank wurde zur\195\188ckgesetzt.  Alle Optionen haben nun wieder ihre Standardwerte."
--	L["SLASH_CACHE"] = ""
	L["SLASH_CACHE_TEXT"] = "Zwischenspeicher-Optionen"
	L["SLASH_CACHE_ERASE"] = "leeren"
	L["SLASH_CACHE_ERASE_TEXT"] = "l\195\182scht alle zwischengespeicherten Daten"
	L["SLASH_CACHE_ERASE_CONFIRM"] = "akzeptieren"
	L["SLASH_CACHE_ERASE_CONFIRM_TEXT"] = "best\195\164tigt das L\195\182schen aller zwischengespeicherten Daten"
	L["SLASH_CACHE_ERASE_COMPLETE_TEXT"] = "l\195\182scht die Daten aller Charaktere"
	L["SLASH_MISC"] = "sonstiges"
	L["SLASH_MISC_TEXT"] = "verschiedene Optionen"
	
	
--	misc chat stuff
	L["UPGRADE_PROFILE"] = "aktualisiere Profil von [%1$s] auf Version %2$.4f" -- profile name, version
	L["UPGRADE_GLOBAL"] = "aktualisiere globale Daten von %1$s auf Version %2$.4f"  -- profile type, version
--	L["UPGRADE_CHAR"] = "Upgrading character data for %1$s to v%2$.4f"  -- character, version
	
	L["MISC_ALERT"] = "ACHTUNG!"
	L["MISC_ALERT_FRAMELEVEL_1"] = "Fehlerbehebung abgeschlossen"
	L["MISC_ALERT_FRAMELEVEL_2"] = "Der Rahmen des Fensters %1$s ist zurzeit bei %2$s und wurde auf %3$s zur\195\188ckgesetzt, um weiter verwendet werden zu k\195\182nnen.  Entschuldige bitte die Verz\195\182gerung, die dadurch verursacht wurde."
	
	
--	item count tooltip
	L["TOOLTIP_VENDOR"] = "H\195\164ndler"
--	L["TOOLTIP_ITEMLEVEL"] = ""
	L["TOOLTIP_TOTAL"] = "Gesamt"
--	L["TOOLTIP_COUNT_ME"] = ""
--	L["TOOLTIP_VAULT_TABS"] = ""
	
	
--	generic text
--	L["AUTOMATIC"] = ""
	L["BOTTOMLEFT"] = "unten links"
	L["BOTTOMRIGHT"] = "unten rechts"
	L["TOPLEFT"] = "oben links"
	L["TOPRIGHT"] = "oben rechts"
--	L["TOP"] = ""
--	L["BOTTOM"] = ""
--	L["LEFT"] = ""
--	L["RIGHT"] = ""
	L["HORIZONTAL"] = "horizontal"
	L["VERTICAL"] = "vertikal"
	L["CLOSE_MENU"] = "Schlie\195\159en"
	L["ANCHOR"] = "Position"
	L["ANCHOR_TEXT1"] = "legt die Position fest" -- window name  (bags, bank, vault)
	L["ANCHOR_TEXT2"] = "positioniert %1$s %2$s" -- object name (bars, items)
	L["BORDER"] = "Rahmen"
	L["BORDER_TEXT"] = "Rahmen-Einstellungen"
	L["SHOW"] = "Anzeigen"
	L["FILE"] = "Datei"
	L["HEIGHT"] = "H\195\182he"
	L["SCALE"] = "Skalierung"
	L["TEXTURE"] = "Textur"
	L["FONT"] = "Schriftart"
	L["COLOUR"] = "Farbe"
--	L["BACKGROUND"] = ""
	L["BACKGROUND_COLOUR"] = "Hintergrundfarbe"
	L["LOCK"] = "Position fixieren"
	L["STYLE"] = "Stil"
	L["ENABLED"] = "eingeschaltet"
	L["DISABLED"] = "ausgeschaltet"
	L["ALERT"] = "St\195\182rmeldung"
	L["PADDING"] = "Abstand"
	L["INTERNAL"] = "innen"
	L["EXTERNAL"] = "au\195\159en"
	L["WIDTH"] = "Breite"
--	L["REALM"] = ""
	L["NONE"] = "keine"
	L["VIEW"] = "Anzeige"
	L["ADD"] = "Hinzuf\195\188gen"
	L["EDIT"] = "Bearbeiten"
--	L["OK"] = ""
	L["CANCEL"] = "Abbrechen"
	L["NEW"] = "Neu"
	L["DIRECTION"] = "Richtung"
	L["ASCENDING"] = "aufsteigend"
	L["DECENDING"] = "absteigend"
	L["LOCATION"] = "Position"
	L["CLEAR"] = "l\195\182schen"
--	L["DHMS"] = ""
--	L["OPEN"] = ""
--	L["CLOSE"] = ""
--	L["RANDOM"] = ""
	L["UNKNOWN"] = "Unbekannt"
--	L["GENERAL"] = ""
	L["RELOAD"] = "Neu laden"
--	L["RENAME"] = ""
--	L["DELETE"] = ""
	L["MOVE_UP"] = "nach oben verschieben"
	L["MOVE_DOWN"] = "nach unten verschieben"
--	L["SORT_METHOD"] = ""
--	L["SORT_BY_NAME"] = ""
--	L["SORT_BY_NUMBER"] = ""
	L["START"] = "gestartet"
	L["COMPLETE"] = "beendet"
	L["REMOVE"] = "entfernen"
	L["HIDE"] = "verstecken"
--	L["MOVE"] = ""
	L["NAME"] = "Beschriftung"
	L["INSERT"] = "Leiste einf\195\188gen"
	L["CURRENT"] = "aktuelle Zuordnung"
	L["DEFAULT"] = "Standardzuordnung"
	L["OFFSET"] = "Versatz"
--	L["NUMBER"] = ""
--	L["STRING"] = ""
--	L["COOLDOWN"] = ""
--	L["FRAMES"] = ""
	
	
-- libdatabroker
--	L["LDB"] = ""
--	L["LDB_BAGS_COLOUR_USE"] = ""
--	L["LDB_BAGS_COLOUR_USE_TEXT"] = ""
--	L["LDB_BAGS_STYLE"] = ""
--	L["LDB_BAGS_STYLE_TEXT"] = ""
--	L["LDB_BAGS_INCLUDE_TYPE"] = ""
--	L["LDB_BAGS_INCLUDE_TYPE_TEXT"] = ""
--	L["LDB_AMMO_INCLUDE_DURABILITY"] = ""
--	L["LDB_AMMO_WEAPON_NONE"] = ""
--	L["LDB_AMMO_WEAPON_BROKEN"] = ""
--	L["LDB_CURRENCY_SELECT"] = ""
--	L["LDB_CURRENCY_DESELECT"] = ""
--	L["LDB_PETS_SELECT"] = ""
--	L["LDB_PETS_DESELECT"] = ""
--	L["LDB_PETS_SUMMON"] = ""
--	L["LDB_MOUNTS_SELECT"] = ""
--	L["LDB_MOUNTS_DESELECT"] = ""
--	L["LDB_MOUNTS_SPEED"] = ""
--	L["LDB_MOUNTS_SPEED_TEXT"] = ""
--	L["LDB_MOUNTS_GROUND"] = ""
--	L["LDB_MOUNTS_FLYING"] = ""
--	L["LDB_MOUNTS_FLYING_DISMOUNT"] = ""
--	L["LDB_MOUNTS_FLYING_DISMOUNT_TEXT"] = ""
--	L["LDB_MOUNTS_FLYING_DISMOUNT_WARNING"] = ""
--	L["LDB_MOUNTS_SUMMON"] = ""
--	L["LDB_COMPANION_MISSING"] = ""
--	L["LDB_COMPANION_NONE"] = ""
	
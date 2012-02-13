local L = LibStub( "AceLocale-3.0" ):NewLocale( "ArkInventory", "koKR" )
if not L then return end

-- post updated translations at http://groups.google.com/group/wow-arkinventory (modify this file and include as an attachment)
-- note: when creating a new locale do not leave any english translations in your file, comment them out by placing -- at the start of the line


-- Translated by: Fenlis (jungseop.park@gmail.com)
-- Translated by: Liebe (sumomo90@gmail.com)










--	wow skill headers - must match exactly what is in game
	L["WOW_SKILL_HEADER_PRIMARY"] = "전문 기술"
	L["WOW_SKILL_HEADER_SECONDARY"] = "보조 기술"
	
	
--	wow skill names - must match exactly what is in game
	L["WOW_SKILL_ALCHEMY"] = "연금술"
	L["WOW_SKILL_BLACKSMITHING"] = "대장기술"
	L["WOW_SKILL_COOKING"] = "요리"
	L["WOW_SKILL_ENCHANTING"] = "마법부여"
	L["WOW_SKILL_ENGINEERING"] = "기계공학"
	L["WOW_SKILL_FIRST_AID"] = "응급치료"
	L["WOW_SKILL_FISHING"] = "낚시"
	L["WOW_SKILL_HERBALISM"] = "약초 채집"
	L["WOW_SKILL_INSCRIPTION"] = "주문각인"
	L["WOW_SKILL_JEWELCRAFTING"] = "보석세공"
	L["WOW_SKILL_LEATHERWORKING"] = "가죽세공"
	L["WOW_SKILL_MINING"] = "채광"
	L["WOW_SKILL_RIDING"] = "탈것 타기"
	L["WOW_SKILL_SKINNING"] = "무두질"
	L["WOW_SKILL_TAILORING"] = "재봉술"
	
	
--	wow class names - must match exactly what is in game and must exist
	L["WOW_CLASS_DRUID"] = "드루이드"
	L["WOW_CLASS_HUNTER"] = "사냥꾼"
	L["WOW_CLASS_MAGE"] = "마법사"
	L["WOW_CLASS_PALADIN"] = "성기사"
	L["WOW_CLASS_PRIEST"] = "사제"
	L["WOW_CLASS_ROGUE"] = "도적"
	L["WOW_CLASS_SHAMAN"] = "주술사"
	L["WOW_CLASS_WARLOCK"] = "흑마법사"
	L["WOW_CLASS_WARRIOR"] = "전사"
	L["WOW_CLASS_DEATHKNIGHT"] = "죽음의 기사"
	
	
--	wow item types - must match exactly what is in game
	L["WOW_ITEM_TYPE_ARMOR"] = "방어구"
	L["WOW_ITEM_TYPE_CONSUMABLE"] = "소비 용품"
	L["WOW_ITEM_TYPE_CONSUMABLE_BANDAGE"] = "붕대"
	L["WOW_ITEM_TYPE_CONSUMABLE_ELIXIR"] = "영약"
	L["WOW_ITEM_TYPE_CONSUMABLE_FLASK"] = "비약"
	L["WOW_ITEM_TYPE_CONSUMABLE_FOOD_AND_DRINK"] = "음식과 음료"
	L["WOW_ITEM_TYPE_CONSUMABLE_POTION"] = "물약"
	L["WOW_ITEM_TYPE_CONSUMABLE_SCROLL"] = "두루마리"
	L["WOW_ITEM_TYPE_CONTAINER"] = "가방"
	L["WOW_ITEM_TYPE_CONTAINER_BAG"] = "가방"
	L["WOW_ITEM_TYPE_CONTAINER_ENCHANTING"] = "마법부여 가방"
	L["WOW_ITEM_TYPE_CONTAINER_ENGINEERING"] = "기계공학 가방"
	L["WOW_ITEM_TYPE_CONTAINER_GEM"] = "보석 가방"
	L["WOW_ITEM_TYPE_CONTAINER_HERB"] = "약초 가방"
	L["WOW_ITEM_TYPE_CONTAINER_INSCRIPTION"] = "주문각인 가방"
	L["WOW_ITEM_TYPE_CONTAINER_LEATHERWORKING"] = "가죽세공 가방"
	L["WOW_ITEM_TYPE_CONTAINER_MINING"] = "채광 가방"
	L["WOW_ITEM_TYPE_CONTAINER_SOULSHARD"] = "영혼의 가방" -- was 영혼석 가방
	L["WOW_ITEM_TYPE_GEM"] = "보석"
--	L["WOW_ITEM_TYPE_GLYPH"] = ""
	L["WOW_ITEM_TYPE_KEY"] = "열쇠"
	L["WOW_ITEM_TYPE_MISC"] = "기타"
	L["WOW_ITEM_TYPE_MISC_MOUNT"] = "탈것"
	L["WOW_ITEM_TYPE_MISC_PET"] = "애완동물"
	L["WOW_ITEM_TYPE_MISC_REAGENT"] = "재료"
	L["WOW_ITEM_TYPE_PROJECTILE"] = "투사체"
	L["WOW_ITEM_TYPE_PROJECTILE_ARROW"] = "화살"
	L["WOW_ITEM_TYPE_PROJECTILE_BULLET"] = "탄환"
	L["WOW_ITEM_TYPE_QUEST"] = "퀘스트"
	L["WOW_ITEM_TYPE_QUIVER"] = "화살통"
	L["WOW_ITEM_TYPE_QUIVER_ARROW"] = "화살통"
	L["WOW_ITEM_TYPE_QUIVER_BULLET"] = "탄환 주머니"
	L["WOW_ITEM_TYPE_RECIPE"] = "제조법"
	L["WOW_ITEM_TYPE_TRADE_GOODS"] = "직업 용품"
--	L["WOW_ITEM_TYPE_TRADE_GOODS_CLOTH"] = "천"
	L["WOW_ITEM_TYPE_TRADE_GOODS_DEVICES"] = "장치"
--	L["WOW_ITEM_TYPE_TRADE_GOODS_ELEMENTAL"] = "원소"
--	L["WOW_ITEM_TYPE_TRADE_GOODS_ENCHANTMENT_ARMOR"] = "방어구 마법부여"
--	L["WOW_ITEM_TYPE_TRADE_GOODS_ENCHANTMENT_WEAPON"] = "무기 마법부여"
	L["WOW_ITEM_TYPE_TRADE_GOODS_EXPLOSIVES"] = "폭탄"
--	L["WOW_ITEM_TYPE_TRADE_GOODS_HERB"] = "약초"
--	L["WOW_ITEM_TYPE_TRADE_GOODS_LEATHER"] = "가죽"
--	L["WOW_ITEM_TYPE_TRADE_GOODS_MEAT"] = "고기"
--	L["WOW_ITEM_TYPE_TRADE_GOODS_METAL_AND_STONE"] = "광물"
--	L["WOW_ITEM_TYPE_TRADE_GOODS_MATERIALS"] = "재료"
	L["WOW_ITEM_TYPE_TRADE_GOODS_PARTS"] = "부품"
	
	
--	wow tooltip text - must match exactly what is in game
	L["WOW_ITEM_TOOLTIP_FOOD"] = "음식을 먹으려면 앉아 있어야 합니다."
	L["WOW_ITEM_TOOLTIP_DRINK"] = "음료를 마시려면 앉아 있어야 합니다."
	L["WOW_ITEM_TOOLTIP_POTION_HEAL"] = "%d+~%d+의 생명력이 회복됩니다."
	L["WOW_ITEM_TOOLTIP_POTION_MANA"] = "%d+~%d+의 마나가 회복됩니다."
--	L["WOW_ITEM_TOOLTIP_ELIXIR_BATTLE"] = ""
--	L["WOW_ITEM_TOOLTIP_ELIXIR_GUARDIAN"] = ""
	
	
--	location names
--	L["LOCATION_ALL"] = ""
	L["LOCATION_BAG"] = "가방"
	L["LOCATION_BANK"] = "은행"
--	L["LOCATION_WEARING"] = ""
--	L["LOCATION_PET"] = ""
--	L["LOCATION_MOUNT"] = ""
--	L["LOCATION_TOKEN"] = ""
	
	
--	subframe names
	L["SUBFRAME_NAME_TITLE"] = "제목 숨김"
--	L["SUBFRAME_NAME_SEARCH"] = ""
	L["SUBFRAME_NAME_BAGCHANGER"] = "가방 변경 숨김"
	L["SUBFRAME_NAME_STATUS"] = "상태 숨김"
	
	
--	status bar/bag text
	L["STATUS_OFFLINE"] = "오프라인"
	L["STATUS_NO_DATA"] = "자료 없음"
	L["STATUS_FULL"] = "가득참"
--	L["STATUS_PURCHASE"] = ""
	
	
--	restack
	L["RESTACK"] = "압축과 쌓기"
	L["RESTACK_TEXT"] = "나뉘어진 더미를 하나로 압축하고 빈 칸 없이 채웁니다."
--	L["RESTACK_FAIL_WAIT"] = ""
--	L["RESTACK_FAIL_ACCESS"] = ""
	
	
--	vault tab tooltips
--	L["VAULT_TAB_ACCESS_NONE"] = ""
--	L["VAULT_TAB_NAME"] = ""
--	L["VAULT_TAB_ACCESS"] = ""
--	L["VAULT_TAB_REMAINING_WITHDRAWALS"] = ""
	
	
--	category "header" descriptions  (does not have to match wow)
	L["CATEGORY_CLASS"] = "직업"
	L["CATEGORY_CONSUMABLE"] = "소모품"
	L["CATEGORY_CUSTOM"] = "사용자"
	L["CATEGORY_EMPTY"] = "빈공간"
	L["CATEGORY_OTHER"] = "기타"
	L["CATEGORY_RULE"] = "규칙"
	L["CATEGORY_SKILL"] = "전문 기술"
	L["CATEGORY_SYSTEM"] = "시스템"
--	L["CATEGORY_TRADE_GOODS"] = ""
	
	
--	system category descriptions
	L["CATEGORY_SYSTEM_CORE_MATS"] = "중요 재료"
	L["CATEGORY_SYSTEM_DEFAULT"] = "기본"
	L["CATEGORY_SYSTEM_EQUIPMENT"] = "착용장비 (착용 시 귀속)"
	L["CATEGORY_SYSTEM_EQUIPMENT_SOULBOUND"] = "착용장비(귀속 아이템)"
	L["CATEGORY_SYSTEM_REPUTATION"] = "평판"
	L["CATEGORY_SYSTEM_SOULBOUND"] = "귀속 아이템"
	L["CATEGORY_SYSTEM_SOULSHARD"] = "영혼의 조각"
	L["CATEGORY_SYSTEM_TRASH"] = "잡동사니"
	L["CATEGORY_SYSTEM_TOKEN"] = "토큰"
	
	
--	consumable category descriptions
	L["CATEGORY_CONSUMABLE_DRINK"] = "음료"
	L["CATEGORY_CONSUMABLE_FOOD"] = "음식"
	L["CATEGORY_CONSUMABLE_FOOD_PET"] = "음식 (소환수용)"
	L["CATEGORY_CONSUMABLE_POTION_MANA"] = "마나 (물약/석)"
	L["CATEGORY_CONSUMABLE_POTION_HEAL"] = "치유 (물약/석)"
--	L["CATEGORY_CONSUMABLE_ELIXIR_BATTLE"] = ""
--	L["CATEGORY_CONSUMABLE_ELIXIR_GUARDIAN"] = ""
	
	
--	bag names - used to name the empty slots in the status frame
	L["STATUS_NAME_BAG"] = "가방"
--	L["STATUS_NAME_CRITTER"] = ""
	L["STATUS_NAME_ENCHANTING"] = "마부"
	L["STATUS_NAME_ENGINEERING"] = "기공"
--	L["STATUS_NAME_GEAR"] = ""
	L["STATUS_NAME_GEM"] = "보석"
	L["STATUS_NAME_HERB"] = "약초"
	L["STATUS_NAME_INSCRIPTION"] = "주각"
	L["STATUS_NAME_KEY"] = "열쇠"
	L["STATUS_NAME_LEATHERWORKING"] = "가세"
--	L["STATUS_NAME_MAIL"] = ""
	L["STATUS_NAME_MINING"] = "광물"
	L["STATUS_NAME_MOUNT"] = "탈것"
	L["STATUS_NAME_PROJECTILE"] = "탄약"
	L["STATUS_NAME_PROJECTILE_BULLET"] = "탄환"
	L["STATUS_NAME_PROJECTILE_ARROW"] = "화살"
	L["STATUS_NAME_SOULSHARD"] = "조각"
	L["STATUS_NAME_TOKEN"] = "토큰"
	
	
--	main menu
	L["MENU"] = "메뉴"
	
	L["MENU_CHARACTER_SWITCH"] = "캐릭터 전환"
	L["MENU_CHARACTER_SWITCH_TEXT"] = "다른 캐릭터로 디스플레이를 전환합니다."
	L["MENU_CHARACTER_SWITCH_CHOOSE_NONE"] = "선택할 다른 캐릭터의 데이터가 없습니다."
	L["MENU_CHARACTER_SWITCH_CHOOSE_TEXT"] = "현재 디스플레이를 %1$s|1으로;로; 전환합니다."
	L["MENU_CHARACTER_SWITCH_ERASE"] = "저장된 데이터 삭제"
	L["MENU_CHARACTER_SWITCH_ERASE_TEXT"] = "%1$s에 대해 저장된 모든 데이터를 삭제합니다."
	
--	L["MENU_LOCATION_SWITCH"] = ""
--	L["MENU_LOCATION_SWITCH_TEXT"] = ""
	
	
--	actions menu
--	L["MENU_ACTION"] = ""
	L["MENU_ACTION_REFRESH"] = "새로 고침"
	L["MENU_ACTION_REFRESH_TEXT"] = "창을 갱신합니다."
	L["MENU_ACTION_RELOAD_TEXT"] = "창을 재시작 합니다.  장비 세트에 아이템 변경시 사용하세요."
	L["MENU_ACTION_EDITMODE"] = "편집 모드 전환"
	L["MENU_ACTION_EDITMODE_TEXT"] = "아이템 레이아웃을 설정 할 수 있도록 편집 모드를 전환합니다."
	L["MENU_ACTION_BAGCHANGER"] = "가방 표시 전환"
	L["MENU_ACTION_BAGCHANGER_TEXT"] = "가방을 추가하거나 교체할 수 있도록 가방칸의 표시를 전환합니다."
	
	
--	item menu
	L["MENU_ITEM_TITLE"] = "아이템 설정"
	L["MENU_ITEM_ITEM"] = "아이템"
--	L["MENU_ITEM_DEFAULT_RESET"] = ""
--	L["MENU_ITEM_DEFAULT_RESET_TEXT"] = ""
--	L["MENU_ITEM_ASSIGN_CHOICES"] = ""
--	L["MENU_ITEM_ASSIGN_THIS"] = ""
--	L["MENU_ITEM_ASSIGN_THIS_TEXT"] = ""
	L["MENU_ITEM_MOVE"] = "%1$s|1을;를; 바로 이동"
	L["MENU_ITEM_RULE_NEW"] = "새 규칙 생성"
	L["MENU_ITEM_RULE_ADD"] = "규칙에 추가"
--	L["MENU_ITEM_CUSTOM_NEW"] = ""
	L["MENU_ITEM_DEBUG"] = "디버그 정보"
--	L["MENU_ITEM_DEBUG_BAG"] = ""
--	L["MENU_ITEM_DEBUG_SLOT"] = ""
--	L["MENU_ITEM_DEBUG_BAG_TYPE"] = ""
--	L["MENU_ITEM_DEBUG_AI_ID_SHORT"] = ""
--	L["MENU_ITEM_DEBUG_AI_ID_CACHE"] = ""
--	L["MENU_ITEM_DEBUG_AI_ID_RULE"] = ""
--	L["MENU_ITEM_DEBUG_AI_ID_CATEGORY"] = ""
--	L["MENU_ITEM_DEBUG_CLASS"] = ""
--	L["MENU_ITEM_DEBUG_QUALITY"] = ""
--	L["MENU_ITEM_DEBUG_LVL_ITEM"] = ""
--	L["MENU_ITEM_DEBUG_LVL_USE"] = ""
--	L["MENU_ITEM_DEBUG_TYPE"] = ""
--	L["MENU_ITEM_DEBUG_SUBTYPE"] = ""
--	L["MENU_ITEM_DEBUG_EQUIP"] = ""
--	L["MENU_ITEM_DEBUG_ID"] = ""
--	L["MENU_ITEM_DEBUG_STACK"] = ""
--	L["MENU_ITEM_DEBUG_FAMILY"] = ""
	L["MENU_ITEM_DEBUG_PT"] = "PT 세트"
	L["MENU_ITEM_DEBUG_PT_TEXT"] = "해당 아이템이 속한 PT 세트 목록"
	L["MENU_ITEM_DEBUG_PT_NONE"] = "해당 아이템은 PT 세트에 없습니다."
	L["MENU_ITEM_DEBUG_PT_TITLE"] = "해당 아이템의 PT 세트 위치"
	
	
--	bar menu
	L["MENU_BAR_TITLE"] = "%1$s번 바 설정"
	L["MENU_BAR_CATEGORY"] = "분류"
	L["MENU_BAR_CATEGORY_TEXT"] = "해당 바에 %1$s 분류를 지정합니다."
	L["MENU_BAR_CATEGORY_CURRENT"] = "현재 지정"
	L["MENU_BAR_CATEGORY_ASSIGN"] = "지정 가능한 분류"
	L["MENU_BAR_CATEGORY_REMOVE_TEXT"] = "%2$s번 바에서 %1$s 분류를 제거하고 기본 바로 되돌리려면 클릭하세요." -- 1 is the category name, 2 is the bar number
	L["MENU_BAR_CATEGORY_HIDDEN_TEXT"] = "해당 분류의 숨겨진 상태를 전환하려면 클릭하세요.\n\n숨겨진 분류의 아이템은 정상 모드에서 표시되지 않습니다."
--	L["MENU_BAR_OPTIONS"] = ""
	L["MENU_BAR_CLEAR_TEXT"] = "해당 바의 기본 분류를 제외하고 현재 지정된 모든 분류를 제거합니다."
	L["MENU_BAR_INSERT_TEXT"] = "모든 분류을 위로 이동시키고 빈 바를 삽입합니다."
	L["MENU_BAR_REMOVE_TEXT"] = "해당 바를 제거합니다, 현재 모든 지정된 분류를 이전의 기본 바로 되돌리고 다른 것들은 아래 바로 이동합니다."
--	L["MENU_BAR_MOVE_TEXT"] = ""
--	L["MENU_BAR_MOVE_START_TEXT"] = ""
--	L["MENU_BAR_MOVE_COMPLETE_TEXT"] = ""
--	L["MENU_BAR_SORTKEY_TEXT"] = ""
--	L["MENU_BAR_SORTKEY_DEFAULT_RESET_TEXT"] = ""
	
	
--	changer bag menu
--	L["MENU_BAG_TITLE"] = ""
--	L["MENU_BAG_SHOW"] = ""
--	L["MENU_BAG_SHOW_TEXT"] = ""
--	L["MENU_BAG_ISOLATE"] = ""
--	L["MENU_BAG_ISOLATE_TEXT"] = ""
--	L["MENU_BAG_SHOWALL"] = ""
--	L["MENU_BAG_SHOWALL_TEXT"] = ""
	
	
--	configuration options
--	L["CONFIG"] = ""
--	L["CONFIG_TEXT"] = ""
	
--	configuration options > system
--	L["CONFIG_SYSTEM"] = ""
--	L["CONFIG_SYSTEM_TEXT"] = ""
	
--	L["CONFIG_SYSTEM_FONT_TEXT"] = ""
	
--	L["CONFIG_SYSTEM_TOOLTIP"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_ENABLE_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_EMPTY_ADD"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_EMPTY_ADD_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_ADD"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_ADD_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_COLOUR_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_VAULT_TABS"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_VAULT_TABS_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_VENDOR_ADD"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_VENDOR_ADD_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_VENDOR_COLOUR_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_ITEMLEVEL_ADD"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_ITEMLEVEL_ADD_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_SCALE_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_CLASSCOLOUR_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_SELF_ONLY"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_SELF_ONLY_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_FACTION_ONLY"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_FACTION_ONLY_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_VAULT_TEXT"] = ""
	
--	L["CONFIG_SYSTEM_BUGFIX"] = ""
--	L["CONFIG_SYSTEM_BUGFIX_TEXT"] = ""
--	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL"] = ""
--	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL_TEXT"] = ""
--	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_TEXT"] = ""
--	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE0"] = ""
--	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE0_TEXT"] = ""
--	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE1"] = ""
--	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE1_TEXT"] = ""
--	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE2"] = ""
--	L["CONFIG_SYSTEM_BUGFIX_FRAMELEVEL_ALERT_STYLE2_TEXT"] = ""
--	L["CONFIG_SYSTEM_BUGFIX_ZEROSIZEBAG"] = ""
--	L["CONFIG_SYSTEM_BUGFIX_ZEROSIZEBAG_TEXT"] = ""
--	L["CONFIG_SYSTEM_BUGFIX_ZEROSIZEBAG_ALERT_TEXT"] = ""
	
	
--	configuration options > auto
	L["CONFIG_AUTO"] = "자동 열기/닫기"
	
--	L["CONFIG_AUTO_OPEN"] = ""
--	L["CONFIG_AUTO_OPEN_BANK"] = ""
--	L["CONFIG_AUTO_OPEN_VAULT"] = ""
--	L["CONFIG_AUTO_OPEN_MAIL"] = ""
--	L["CONFIG_AUTO_OPEN_MERCHANT"] = ""
--	L["CONFIG_AUTO_OPEN_TRADE"] = ""
--	L["CONFIG_AUTO_OPEN_AUCTION"] = ""
	
--	L["CONFIG_AUTO_CLOSE"] = ""
--	L["CONFIG_AUTO_CLOSE_BANK"] = ""
--	L["CONFIG_AUTO_CLOSE_VAULT"] = ""
--	L["CONFIG_AUTO_CLOSE_MAIL"] = ""
--	L["CONFIG_AUTO_CLOSE_MERCHANT"] = ""
--	L["CONFIG_AUTO_CLOSE_TRADE"] = ""
--	L["CONFIG_AUTO_CLOSE_AUCTION"] = ""
--	L["CONFIG_AUTO_CLOSE_COMBAT"] = ""
	
	
--	configuration options > control
--	L["CONFIG_CONTROL"] = ""
	
--	L["CONFIG_CONTROL_MONITOR"] = ""
--	L["CONFIG_CONTROL_MONITOR_TEXT"] = ""
	L["CONFIG_CONTROL_SAVE"] = "오프라인"
--	L["CONFIG_CONTROL_SAVE_TEXT"] = ""
--	L["CONFIG_CONTROL_NOTIFY_ERASE"] = ""
--	L["CONFIG_CONTROL_NOTIFY_ERASE_TEXT"] = ""
	L["CONFIG_CONTROL_OVERRIDE"] = "블리자드 프레임 숨김"
--	L["CONFIG_CONTROL_OVERRIDE_TEXT"] = ""
--	L["CONFIG_CONTROL_ANCHOR_LOCK_TEXT"] = ""
--	L["CONFIG_CONTROL_SETTINGS_TEXT"] = ""
	
	
--	configuration options > settings
--	L["CONFIG_SETTINGS"] = ""
	
	L["CONFIG_SETTINGS_FRAME"] = "창"
	
--	L["CONFIG_SETTINGS_FRAME_HIDE_TEXT"] = ""
	
	L["CONFIG_SETTINGS_FRAME_SCALE_TEXT"] = "창을 크게 혹은 작게 하기 위한 크기 비율을 설정합니다."
	L["CONFIG_SETTINGS_FRAME_PADDING_TEXT"] = "창의 경계와 바 사이의 간격을 설정합니다."
	L["CONFIG_SETTINGS_FRAME_WIDTH_TEXT"] = "디스플레이할 열의 수를 설정합니다."
	L["CONFIG_SETTINGS_FRAME_BACKGROUND_COLOUR_TEXT"] = "메인 창의 배경 색상을 설정합니다."
	L["CONFIG_SETTINGS_FRAME_BORDER_SHOW_TEXT"] = "메인 창 주변의 테두리 표시를 전환합니다."
--	L["CONFIG_SETTINGS_FRAME_BORDER_STYLE_TEXT"] = ""
	L["CONFIG_SETTINGS_FRAME_BORDER_COLOUR_TEXT"] = "메인 창의 테두리 색상을 설정합니다."
	
	L["CONFIG_SETTINGS_FRAME_CHANGER_HIGHLIGHT"] = "가방 강조 색상"
--	L["CONFIG_SETTINGS_FRAME_CHANGER_HIGHLIGHT_TEXT"] = ""
	L["CONFIG_SETTINGS_FRAME_CHANGER_HIGHLIGHT_COLOUR_TEXT"] = "가방에 마우스를 올렸을 때 칸을 강조하는데 사용할 색상을 설정합니다."
--	L["CONFIG_SETTINGS_FRAME_CHANGER_FREE"] = ""
--	L["CONFIG_SETTINGS_FRAME_CHANGER_FREE_TEXT"] = ""
--	L["CONFIG_SETTINGS_FRAME_CHANGER_FREE_COLOUR_TEXT"] = ""
	
--	L["CONFIG_SETTINGS_FRAME_STATUS_EMPTY"] = ""
--	L["CONFIG_SETTINGS_FRAME_STATUS_EMPTY_TEXT"] = ""
	
--	L["CONFIG_SETTINGS_FRAME_TITLE_SIZE_NORMAL"] = ""
--	L["CONFIG_SETTINGS_FRAME_TITLE_SIZE_THIN"] = ""
	
	L["CONFIG_SETTINGS_BARS"] = "바"
	L["CONFIG_SETTINGS_BARS_PER_ROW"] = "열 단위"
	L["CONFIG_SETTINGS_BARS_PER_ROW_TEXT"] = "각 열에 표시할 바의 수를 설정합니다."
	L["CONFIG_SETTINGS_BARS_BACKGROUND_TEXT"] = "바의 배경 색상을 설정합니다."
	L["CONFIG_SETTINGS_BARS_COMPACT"] = "간략형"
	L["CONFIG_SETTINGS_BARS_COMPACT_TEXT"] = "순서대로 모든 비어있지 않은 바를 표시합니다."
	L["CONFIG_SETTINGS_BARS_SHOW_EMPTY"] = "빈 바 표시"
	L["CONFIG_SETTINGS_BARS_SHOW_EMPTY_TEXT"] = "빈 바의 표시를 전환합니다."
--	L["CONFIG_SETTINGS_BARS_PADDING_INTERNAL_TEXT"] = ""
--	L["CONFIG_SETTINGS_BARS_PADDING_EXTERNAL_TEXT"] = ""
	L["CONFIG_SETTINGS_BARS_BORDER_TEXT"] = "각 바 주변의 테두리 표시를 전환합니다."
--	L["CONFIG_SETTINGS_BARS_BORDER_STYLE_TEXT"] = ""
	L["CONFIG_SETTINGS_BARS_BORDER_COLOUR_TEXT"] = "바 주변의 테두리 색상을 설정합니다."
--	L["CONFIG_SETTINGS_BARS_NAME_TEXT"] = ""
--	L["CONFIG_SETTINGS_BARS_NAME_SHOW_TEXT"] = ""
--	L["CONFIG_SETTINGS_BARS_NAME_COLOUR_TEXT"] = ""
--	L["CONFIG_SETTINGS_BARS_NAME_HEIGHT_TEXT"] = ""
	
	L["CONFIG_SETTINGS_ITEMS"] = "아이템"
	L["CONFIG_SETTINGS_ITEMS_PADDING_TEXT"] = "아이템 칸 사이에 추가할 간격을 설정합니다."
	L["CONFIG_SETTINGS_ITEMS_HIDDEN"] = "숨겨진 아이템 표시"
	L["CONFIG_SETTINGS_ITEMS_HIDDEN_TEXT"] = "숨겨진 분류 내의 아이템을 표시할 지를 결정합니다."
	L["CONFIG_SETTINGS_ITEMS_FADE"] = "아이템 숨김"
	L["CONFIG_SETTINGS_ITEMS_FADE_TEXT"] = "오프라인 아이템을 숨길지를 결정합니다."
--	L["CONFIG_SETTINGS_ITEMS_TINT_USABLE"] = ""
--	L["CONFIG_SETTINGS_ITEMS_TINT_USABLE_TEXT"] = ""
--	L["CONFIG_SETTINGS_ITEMS_BORDER_SHOW_TEXT"] = ""
--	L["CONFIG_SETTINGS_ITEMS_BORDER_STYLE_TEXT"] = ""
	L["CONFIG_SETTINGS_ITEMS_BORDER_RARITY"] = "등급에 따른 테두리 색상화"
	L["CONFIG_SETTINGS_ITEMS_BORDER_RARITY_TEXT"] = "각 아이템의 칸 주변의 테두리를 아이템의 등급에 따른 색상을 사용할 지를 결정합니다. (일반, 희귀, 영웅, 등)"
--	L["CONFIG_SETTINGS_ITEMS_BORDER_RARITY_CUTOFF"] = ""
--	L["CONFIG_SETTINGS_ITEMS_BORDER_RARITY_CUTOFF_TEXT"] = ""
--	L["CONFIG_SETTINGS_ITEMS_BORDER_TEXTURE_OFFSET_TEXT"] = ""
	L["CONFIG_SETTINGS_ITEMS_AGE"] = "새 아이템"
	L["CONFIG_SETTINGS_ITEMS_AGE_SHOW_TEXT"] = "새 아이템 글자의 표시를 전환합니다."
	L["CONFIG_SETTINGS_ITEMS_AGE_COLOUR_TEXT"] = "새 아이템 글자의 색상을 설정합니다."
--	L["CONFIG_SETTINGS_ITEMS_AGE_CUTOFF"] = ""
--	L["CONFIG_SETTINGS_ITEMS_AGE_CUTOFF_TEXT"] = ""
	L["CONFIG_SETTINGS_ITEMS_AGE_RESET_TEXT"] = "해당 캐릭터의 모든 아이템에 대한 새 아이템 상태를 클리어합니다."
--	L["CONFIG_SETTINGS_ITEMS_COOLDOWN_SHOW_TEXT"] = ""
--	L["CONFIG_SETTINGS_ITEMS_COOLDOWN_GLOBAL"] = ""
--	L["CONFIG_SETTINGS_ITEMS_COOLDOWN_GLOBAL_TEXT"] = ""
--	L["CONFIG_SETTINGS_ITEMS_COOLDOWN_COMBAT"] = ""
--	L["CONFIG_SETTINGS_ITEMS_COOLDOWN_COMBAT_TEXT"] = ""
	
--	L["CONFIG_SETTINGS_SORTING_OPEN"] = ""
--	L["CONFIG_SETTINGS_SORTING_OPEN_TEXT"] = ""
	L["CONFIG_SETTINGS_SORTING_INSTANT"] = "즉시"
	L["CONFIG_SETTINGS_SORTING_INSTANT_TEXT"] = "즉시 정렬 모드를 전환합니다.\n\nenabled: sorting is done when something changes\n\ndisabled: sorting is done only when the window is opened, or you refresh.\n\nnote: if the bag changer window is open then your choice is ignored and instant sort is always enabled"
	
	L["CONFIG_SETTINGS_EMPTY"] = "빈 칸"
	L["CONFIG_SETTINGS_EMPTY_ICON"] = "아이콘 사용"
	L["CONFIG_SETTINGS_EMPTY_ICON_TEXT"] = "빈 칸 배경에 고정 색상 혹은 아이콘 사용을 전환합니다."
--	L["CONFIG_SETTINGS_EMPTY_CLUMP"] = ""
--	L["CONFIG_SETTINGS_EMPTY_CLUMP_TEXT"] = ""
	L["CONFIG_SETTINGS_EMPTY_BORDER"] = "테두리 색상화"
	L["CONFIG_SETTINGS_EMPTY_BORDER_TEXT"] = "가방 종류에 따른 빈 칸 테두리 색상 사용을 전환합니다."
	L["CONFIG_SETTINGS_EMPTY_COLOUR"] = "칸 색상"
--	L["CONFIG_SETTINGS_EMPTY_COLOUR_TEXT"] = ""
--	L["CONFIG_SETTINGS_EMPTY_STATUS"] = ""
	
	
-- sorting
--	L["CONFIG_SORTMETHOD"] = ""
	
	L["CONFIG_SORTMETHOD_SORT"] = "정렬"
	
--	L["CONFIG_SORTMETHOD_STYLE_TEXT"] = ""
	L["CONFIG_SORTMETHOD_STYLE_BAGSLOT"] = "가방 / 칸 순"
	L["CONFIG_SORTMETHOD_STYLE_BAGSLOT_TEXT"] = "인텐토리를 가방과 칸 번호순으로 정렬합니다."
	L["CONFIG_SORTMETHOD_STYLE_USER"] = "이름순"
	L["CONFIG_SORTMETHOD_STYLE_USER_TEXT"] = "인벤토리를 아이템의 이름순으로 정렬합니다."
	
	L["CONFIG_SORTMETHOD_INCLUDE_NAME"] = "아이템 이름"
	L["CONFIG_SORTMETHOD_INCLUDE_NAME_TEXT"] = "인벤토리 정렬에 아이템 이름의 포함을 전환합니다.."
	L["CONFIG_SORTMETHOD_INCLUDE_NAME_REVERSE"] = "반전한 이름 포함"
	L["CONFIG_SORTMETHOD_INCLUDE_NAME_REVERSE_TEXT"] = "인벤토리 정렬에 반전한 이름의 포함을 전환합니다.\n\n예 최상급 마나 물약은 물약 마나 최고급이 됩니다."
	L["CONFIG_SORTMETHOD_INCLUDE_QUALITY"] = "아이템 등급"
	L["CONFIG_SORTMETHOD_INCLUDE_QUALITY_TEXT"] = "인벤토리 정렬에 아이템 등급의 포함을 전환합니다."
	L["CONFIG_SORTMETHOD_INCLUDE_LOCATION"] = "아이템 착용 부위"
	L["CONFIG_SORTMETHOD_INCLUDE_LOCATION_TEXT"] = "인벤토리 정렬에 아이템 착용 부위의 포함을 전환합니다.\n\n노트: 단 착용가능한 아이템만 적용됩니다."
	L["CONFIG_SORTMETHOD_INCLUDE_ITEMTYPE"] = "아이템 종류와 세부 종류"
	L["CONFIG_SORTMETHOD_INCLUDE_ITEMTYPE_TEXT"] = "인벤토리 정렬에 아이템의 종류와 세부 종류의 포함을 전환합니다."
	L["CONFIG_SORTMETHOD_INCLUDE_CATEGORY"] = "아이템 분류"
	L["CONFIG_SORTMETHOD_INCLUDE_CATEGORY_TEXT"] = "인벤토리 정렬에 아이템 분류의 포함을 전환합니다."
	L["CONFIG_SORTMETHOD_INCLUDE_ITEMUSELEVEL"] = "아이템 (사용) 레벨"
	L["CONFIG_SORTMETHOD_INCLUDE_ITEMUSELEVEL_TEXT"] = "인벤토리 정렬에 아이템의 (사용) 레벨의 포함을 전환합니다."
--	L["CONFIG_SORTMETHOD_INCLUDE_ITEMSTATLEVEL"] = ""
--	L["CONFIG_SORTMETHOD_INCLUDE_ITEMSTATLEVEL_TEXT"] = ""
--	L["CONFIG_SORTMETHOD_INCLUDE_ITEMAGE"] = ""
--	L["CONFIG_SORTMETHOD_INCLUDE_ITEMAGE_TEXT"] = ""
--	L["CONFIG_SORTMETHOD_INCLUDE_VENDORPRICE"] = ""
--	L["CONFIG_SORTMETHOD_INCLUDE_VENDORPRICE_TEXT"] = ""
	
--	L["CONFIG_SORTMETHOD_DIRECTION_TEXT"] = ""
	L["CONFIG_SORTMETHOD_ORDER"] = "정렬 순서"
--	L["CONFIG_SORTMETHOD_MOVE_UP_TEXT"] = ""
--	L["CONFIG_SORTMETHOD_MOVE_DOWN_TEXT"] = ""
--	L["CONFIG_SORTMETHOD_NOT_INCLUDED"] = ""
	
--	L["CONFIG_SORTMETHOD_ADD"] = ""
--	L["CONFIG_SORTMETHOD_ADD_TEXT"] = ""
--	L["CONFIG_SORTMETHOD_RENAME_TEXT"] = ""
--	L["CONFIG_SORTMETHOD_DELETE_TEXT"] = ""
	
	
-- search
--	L["CONFIG_SEARCH"] = ""
	
	
--	rules
	L["CONFIG_RULES"] = "규칙"
	L["CONFIG_RULES_SHOWDISABLED"] = "비활성화된 규칙 표시"
	L["CONFIG_RULES_SHOWDISABLED_TEXT"] = "비활성화된 규칙의 표시를 전환합니다."
	
	
--	configuration options > categories
--	L["CONFIG_CATEGORY"] = ""
	
--	L["CONFIG_CATEGORY_CUSTOM"] = ""
--	L["CONFIG_CATEGORY_DELETED"] = ""
	
--	L["CONFIG_CATEGORY_ADD"] = ""
--	L["CONFIG_CATEGORY_ADD_TEXT"] = ""
--	L["CONFIG_CATEGORY_RENAME_TEXT"] = ""
--	L["CONFIG_CATEGORY_DELETE_TEXT"] = ""
	
	
--	configuration options > debug
--	L["CONFIG_DEBUG"] = ""
--	L["CONFIG_DEBUG_TEXT"] = ""
	
	
--	configuration options > generic
--	L["BORDER_SCALE_TEXT"] = ""
--	L["BORDER_TEXTURE_TEXT"] = ""
--	L["BORDER_TEXTURE_FILE_TEXT"] = ""
--	L["BORDER_TEXTURE_HEIGHT_TEXT"] = ""
	
	
--	rules frame
	L["RULE"] = "규칙"
	L["RULE_ENABLED"] = "사용함"
	L["RULE_HIDDEN"] = "숨겨짐"
	L["RULE_ORDER"] = "순서"
	L["RULE_DESCRIPTION"] = "세부설명"
	L["RULE_FORMULA"] = "형식"
	L["RULE_SEARCH"] = "탐색"
--	L["RULE_LIST_ENABLED"] = ""
--	L["RULE_LIST_DAMAGED"] = ""
--	L["RULE_LIST_ID"] = ""
--	L["RULE_LIST_ORDER"] = ""
--	L["RULE_LIST_DESCRIPTION"] = ""
	
--	L["RULE_DAMAGED"] = ""
--	L["RULE_FAILED"] = ""
--	L["RULE_FAILED_KEY_NIL"] = ""
--	L["RULE_FAILED_DATA_NIL"] = ""
--	L["RULE_FAILED_DESCRIPTION_NIL"] = ""
--	L["RULE_FAILED_FORMULA_NIL"] = ""
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
--	L["SLASH_UI_TEXT"] = ""
--	L["SLASH_UI_RESET"] = ""
--	L["SLASH_UI_RESET_TEXT"] = ""
--	L["SLASH_UI_RESET_COMPLETE_TEXT"] = ""
--	L["SLASH_DB"] = ""
--	L["SLASH_DB_TEXT"] = ""
--	L["SLASH_DB_RESET"] = ""
--	L["SLASH_DB_RESET_TEXT"] = ""
--	L["SLASH_DB_RESET_CONFIRM"] = ""
--	L["SLASH_DB_RESET_CONFIRM_TEXT"] = ""
--	L["SLASH_DB_RESET_COMPLETE_TEXT"] = ""
--	L["SLASH_CACHE"] = ""
--	L["SLASH_CACHE_TEXT"] = ""
--	L["SLASH_CACHE_ERASE"] = ""
--	L["SLASH_CACHE_ERASE_TEXT"] = ""
--	L["SLASH_CACHE_ERASE_CONFIRM"] = ""
--	L["SLASH_CACHE_ERASE_CONFIRM_TEXT"] = ""
--	L["SLASH_CACHE_ERASE_COMPLETE_TEXT"] = ""
--	L["SLASH_MISC"] = ""
--	L["SLASH_MISC_TEXT"] = ""
	
	
--	misc chat stuff
--	L["UPGRADE_PROFILE"] = ""
--	L["UPGRADE_GLOBAL"] = ""
--	L["UPGRADE_CHAR"] = ""
	
--	L["MISC_ALERT"] = ""
--	L["MISC_ALERT_FRAMELEVEL_1"] = ""
--	L["MISC_ALERT_FRAMELEVEL_2"] = ""
	
	
--	item count tooltip
--	L["TOOLTIP_VENDOR"] = ""
--	L["TOOLTIP_ITEMLEVEL"] = ""
--	L["TOOLTIP_TOTAL"] = ""
--	L["TOOLTIP_COUNT_ME"] = ""
	L["TOOLTIP_VAULT_TABS"] = ""
	
	
--	generic text
--	L["AUTOMATIC"] = ""
	L["BOTTOMLEFT"] = "좌측 하단"
	L["BOTTOMRIGHT"] = "우측 하단"
	L["TOPLEFT"] = "좌측 상단"
	L["TOPRIGHT"] = "우측 상단"
--	L["TOP"] = ""
--	L["BOTTOM"] = ""
--	L["LEFT"] = ""
--	L["RIGHT"] = ""
	L["HORIZONTAL"] = "수평"
	L["VERTICAL"] = "수직"
	L["CLOSE_MENU"] = "메뉴 닫기"
--	L["ANCHOR"] = ""
--	L["ANCHOR_TEXT1"] = ""
--	L["ANCHOR_TEXT2"] = ""
--	L["BORDER"] = ""
--	L["BORDER_TEXT"] = ""
--	L["SHOW"] = ""
--	L["FILE"] = ""
--	L["HEIGHT"] = ""
--	L["SCALE"] = ""
--	L["TEXTURE"] = ""
--	L["FONT"] = ""
	L["COLOUR"] = "테두리 색상"
--	L["BACKGROUND"] = ""
	L["BACKGROUND_COLOUR"] = "배경 색상"
--	L["LOCK"] = ""
--	L["STYLE"] = ""
--	L["ENABLED"] = ""
--	L["DISABLED"] = ""
--	L["ALERT"] = ""
	L["PADDING"] = "간격"
--	L["INTERNAL"] = ""
--	L["EXTERNAL"] = ""
	L["WIDTH"] = "너비"
--	L["REALM"] = ""
--	L["NONE"] = ""
	L["VIEW"] = "보기"
	L["ADD"] = "추가"
	L["EDIT"] = "편집"
	L["OK"] = "확인"
	L["CANCEL"] = "취소"
--	L["NEW"] = ""
	L["DIRECTION"] = "방향"
--	L["ASCENDING"] = ""
--	L["DECENDING"] = ""
--	L["LOCATION"] = ""
	L["CLEAR"] = "클리어"
--	L["DHMS"] = ""
--	L["OPEN"] = ""
--	L["CLOSE"] = ""
--	L["RANDOM"] = ""
	L["UNKNOWN"] = "알 수 없음"
--	L["GENERAL"] = ""
	L["RELOAD"] = "재시작"
--	L["RENAME"] = ""
--	L["DELETE"] = ""
	L["MOVE_UP"] = "위로 이동"
	L["MOVE_DOWN"] = "아래로 이동"
--	L["SORT_METHOD"] = ""
--	L["SORT_BY_NAME"] = ""
--	L["SORT_BY_NUMBER"] = ""
	L["START"] = "시작"
	L["COMPLETE"] = "종료"
	L["REMOVE"] = "제거"
	L["HIDE"] = "숨김"
--	L["MOVE"] = ""
--	L["NAME"] = ""
	L["INSERT"] = "빈 바 삽입"
	L["CURRENT"] = "현재 지정"
	L["DEFAULT"] = "기본 지정"
--	L["OFFSET"] = ""
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
	
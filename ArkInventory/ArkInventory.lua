-- (c) 2009, all rights reserved.

ArkInventory = LibStub( "AceAddon-3.0" ):NewAddon( "ArkInventory", "AceConsole-3.0", "AceHook-3.0", "AceEvent-3.0", "AceBucket-3.0" )

ArkInventory.Localise = LibStub( "AceLocale-3.0" ):GetLocale( "ArkInventory" )

ArkInventory.Lib = { -- libraries live here
	
	DewDrop = LibStub( "Dewdrop-2.0" ),
	
	PeriodicTable = LibStub( "LibPeriodicTable-3.1" ),
	Config = LibStub( "AceConfig-3.0" ),
	Dialog = LibStub( "AceConfigDialog-3.0" ),
	
	SharedMedia = LibStub( "LibSharedMedia-3.0" ),
	DataBroker = LibStub( "LibDataBroker-1.1" ),
	
}

ArkInventory.db = { }

ArkInventory.Table = { } -- table functions live here, coded elsewhere

ArkInventory.Const = { -- constants
	
	TOC = select( 4, GetBuildInfo( ) ) or 0,  -- /run print( ArkInventory.Const.TOC )
	
	Program = {
		Name = "ArkInventory",
		Version = 3.0246,
		UIVersion = "3.2.46",
		--Beta = "Beta xx-xx",
	},
	
	Frame = {
		Main = {
			Name = "ARKINV_Frame",
		},
		Title = {
			Name = "Title",
			Height = 58,
			Height2 = 40,
		},
		Container = {
			Name = "Container",
		},
		Log = {
			Name = "Log",
		},
		Info = {
			Name = "Info",
		},
		Changer = {
			Name = "Changer",
			Height = 58,
		},
		Status = {
			Name = "Status",
			Height = 40,
		},
		Search = {
			Name = "Search",
			Height = 40,
		},
		Scrolling = {
			List = "List",
			ScrollBar = "ScrollBar",
		},
		Config = {
			Internal = "ArkInventory",
			Blizzard = "ArkInventoryConfigBlizzard",
		},
	},
	
	Debug = false,
	
	Profiler = false,

	Event = {
		BagUpdate = 1,
		--ObjectLock = 2,
		--PlayerMoney = 3,
		--GuildMoney = 4,
		--TabInfo = 5,
		--SkillUpdate = 6,
		--ItemUpdate = 7,
	},

	Location = {
		Bag = 1,
		Key = 2,
		Bank = 3,
		Vault = 4,
		Mail = 5,
		Wearing = 6,
		Pet = 7,
		Mount = 8,
		Token = 9,
	},

	Offset = {
		Vault = 1000,
		Mail = 2000,
		Wearing = 3000,
		Pet = 4000,
		Token = 5000,
		Mount = 6000,
	},

	Bag = {
		Status = { -- these need to be negative values,  do not use -1 (false)
			Unknown = -2,
			Active = -3,
			Empty = -4,
			Purchase = -5,
			NoAccess = -6,
		},
	},

	Slot = {
	
		Type = { -- slot type numbers, do not change this order, just add new ones to the end of the list
			Unknown = 0,
			Bag = 1,
			Key = 3,
			Soulshard = 5,
			Herb = 6,
			Enchanting = 7,
			Engineering = 8,
			Gem = 9,
			Mining = 10,
			Bullet = 11,
			Arrow = 12,
			Leatherworking = 13,
			Wearing = 14,
			Mail = 15,
			Inscription = 16,
			Critter = 17,
			Mount = 18,
			Token = 19,
		},

		New = {
			No = false,
			Yes = 1,
			Inc = 2,
			Dec = 3,
		},
	
		DefaultColour = { r = 0.3, g = 0.3, b = 0.3 },
		
		Data = { },
		
	},

	Anchor = {
		Automatic = 0,
		BottomRight = 1,
		BottomLeft = 2,
		TopLeft = 3,
		TopRight = 4,
		Top = 5,
		Bottom = 6,
		Left = 7,
		Right = 8,
	},
	
	Direction = {
		Horizontal = 1,
		Vertical = 2,
	},
	
	Window = {
	
		Offset = 9, -- hardcoded padding size for gap inside container
		
		Min = {
			Rows = 1,
			Columns = 6,
			Width = 400,
			Height = 40,
		},
		
		Draw = {
			Init = 0, -- first time
			Recalculate = 1, -- calculate
			Resort = 1, -- sort
			Refresh = 3, -- item changes
			None = 4, -- nothing
		},
		
		Title = {
			SizeNormal = 1,
			SizeThin = 2,
		},
	},

	Font = {
		Face = [[Friz Quadrata TT]],
		Size = 12,
	},

	Fade = 0.6,
	GuildTag = "+",

	InventorySlotName = { "HeadSlot", "NeckSlot", "ShoulderSlot", "BackSlot", "ChestSlot", "ShirtSlot", "TabardSlot", "WristSlot", "HandsSlot", "WaistSlot", "LegsSlot", "FeetSlot", "Finger0Slot", "Finger1Slot", "Trinket0Slot", "Trinket1Slot", "MainHandSlot", "SecondaryHandSlot", "RangedSlot" },

	Category = {
		
		Max = 8999,
		
		Type = {
			System = 1,
			Custom = 2,
			Rule = 3,
		},
		
		Code = {
			System = { -- do NOT change the indicies - if you have to then see the ConvertOldOptions( ) function to remap it
				[401] = {
					["id"] = "SYSTEM_DEFAULT",
					["text"] = ArkInventory.Localise["CATEGORY_SYSTEM_DEFAULT"],
				},
				[402] = {
					["id"] = "SYSTEM_TRASH",
					["text"] = ArkInventory.Localise["CATEGORY_SYSTEM_TRASH"],
				},
				[403] = {
					["id"] = "SYSTEM_SOULBOUND",
					["text"] = ArkInventory.Localise["CATEGORY_SYSTEM_SOULBOUND"],
				},
				[405] = {
					["id"] = "SYSTEM_CONTAINER",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER"],
				},
				[406] = {
					["id"] = "SYSTEM_KEY",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_KEY"],
				},
				[407] = {
					["id"] = "SYSTEM_MISC",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_MISC"],
				},
				[408] = {
					["id"] = "SYSTEM_REAGENT",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_MISC_REAGENT"],
				},
				[409] = {
					["id"] = "SYSTEM_RECIPE",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_RECIPE"],
				},
				[410] = {
					["id"] = "SYSTEM_PROJECTILE",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_PROJECTILE"],
				},
				[411] = {
					["id"] = "SYSTEM_QUEST",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_QUEST"],
				},
				[413] = {
					["id"] = "SYSTEM_SOULSHARD",
					["text"] = ArkInventory.Localise["CATEGORY_SYSTEM_SOULSHARD"],
				},
				[414] = {
					["id"] = "SYSTEM_EQUIPMENT",
					["text"] = ArkInventory.Localise["CATEGORY_SYSTEM_EQUIPMENT"],
				},
--[[
				[415] = {
					["id"] = "SYSTEM_MOUNT",
					["text"] = ArkInventory.Localise["WOW_SKILL_RIDING"],
				},
]]--
				[416] = {
					["id"] = "SYSTEM_EQUIPMENT_SOULBOUND",
					["text"] = ArkInventory.Localise["CATEGORY_SYSTEM_EQUIPMENT_SOULBOUND"],
				},
				[421] = {
					["id"] = "SYSTEM_PROJECTILE_BULLET",
					["text"] = string.format( "%s (%s)", ArkInventory.Localise["WOW_ITEM_TYPE_PROJECTILE"], ArkInventory.Localise["WOW_ITEM_TYPE_PROJECTILE_BULLET"] ),
				},
				[422] = {
					["id"] = "SYSTEM_PROJECTILE_ARROW",
					["text"] = string.format( "%s (%s)", ArkInventory.Localise["WOW_ITEM_TYPE_PROJECTILE"], ArkInventory.Localise["WOW_ITEM_TYPE_PROJECTILE_ARROW"] ),
				},
				[423] = {
					["id"] = "SYSTEM_PET",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_MISC_PET"],
				},
				[428] = {
					["id"] = "SYSTEM_REPUTATION",
					["text"] = ArkInventory.Localise["CATEGORY_SYSTEM_REPUTATION"],
				},
				[429] = {
					["id"] = "SYSTEM_UNKNOWN",
					["text"] = ArkInventory.Localise["UNKNOWN"],
				},
				[434] = {
					["id"] = "SYSTEM_GEM",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_GEM"],
				},
				[438] = {
					["id"] = "SYSTEM_TOKEN",
					["text"] = ArkInventory.Localise["CATEGORY_SYSTEM_TOKEN"],
				},
				[439] = {
					["id"] = "SYSTEM_GLYPH",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_GLYPH"],
				},
			},
			Consumable = {
				[404] = {
					["id"] = "CONSUMABLE",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE"],
				},
				[417] = {
					["id"] = "CONSUMABLE_FOOD",
					["text"] = ArkInventory.Localise["CATEGORY_CONSUMABLE_FOOD"],
				},
				[418] = {
					["id"] = "CONSUMABLE_DRINK",
					["text"] = ArkInventory.Localise["CATEGORY_CONSUMABLE_DRINK"],
				},
				[419] = {
					["id"] = "CONSUMABLE_POTION_MANA",
					["text"] = ArkInventory.Localise["CATEGORY_CONSUMABLE_POTION_MANA"],
				},
				[420] = {
					["id"] = "CONSUMABLE_POTION_HEAL",
					["text"] = ArkInventory.Localise["CATEGORY_CONSUMABLE_POTION_HEAL"],
				},
				[424] = {
					["id"] = "CONSUMABLE_POTION",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_POTION"],
				},
				[430] = {
					["id"] = "CONSUMABLE_ELIXIR",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_ELIXIR"],
				},
				[431] = {
					["id"] = "CONSUMABLE_FLASK",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_FLASK"],
				},
				[432] = {
					["id"] = "CONSUMABLE_BANDAGE",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_BANDAGE"],
				},
				[433] = {
					["id"] = "CONSUMABLE_SCROLL",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_SCROLL"],
				},
				[435] = {
					["id"] = "CONSUMABLE_ELIXIR_BATTLE",
					["text"] = ArkInventory.Localise["CATEGORY_CONSUMABLE_ELIXIR_BATTLE"],
				},
				[436] = {
					["id"] = "CONSUMABLE_ELIXIR_GUARDIAN",
					["text"] = ArkInventory.Localise["CATEGORY_CONSUMABLE_ELIXIR_GUARDIAN"],
				},
				[437] = {
					["id"] = "CONSUMABLE_FOOD_AND_DRINK",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_FOOD_AND_DRINK"],
				},
			},
			Trade = {
				[412] = {
					["id"] = "TRADE_GOODS",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS"],
				},
				[425] = {
					["id"] = "TRADE_GOODS_DEVICES",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS_DEVICES"],
				},
				[426] = {
					["id"] = "TRADE_GOODS_EXPLOSIVES",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS_EXPLOSIVES"],
				},
				[427] = {
					["id"] = "TRADE_GOODS_PARTS",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS_PARTS"],
				},
				[501] = {
					["id"] = "TRADE_GOODS_HERB",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS_HERB"],
				},
				[502] = {
					["id"] = "TRADE_GOODS_CLOTH",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS_CLOTH"],
				},
				[503] = {
					["id"] = "TRADE_GOODS_ELEMENTAL",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS_ELEMENTAL"],
				},
				[504] = {
					["id"] = "TRADE_GOODS_LEATHER",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS_LEATHER"],
				},
				[505] = {
					["id"] = "TRADE_GOODS_MEAT",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS_MEAT"],
				},
				[506] = {
					["id"] = "TRADE_GOODS_METAL_AND_STONE",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS_METAL_AND_STONE"],
				},
				[507] = {
					["id"] = "TRADE_GOODS_MATERIALS",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS_MATERIALS"],
				},
				[508] = {
					["id"] = "TRADE_GOODS_ENCHANTMENT_ARMOR",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS_ENCHANTMENT_ARMOR"],
				},
				[509] = {
					["id"] = "TRADE_GOODS_ENCHANTMENT_WEAPON",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS_ENCHANTMENT_WEAPON"],
				},
			},
			Skill = { -- do NOT change the indicies
				[101] = {
					["id"] = "SKILL_ALCHEMY",
					["text"] = ArkInventory.Localise["WOW_SKILL_ALCHEMY"],
				},
				[102] = {
					["id"] = "SKILL_BLACKSMITHING",
					["text"] = ArkInventory.Localise["WOW_SKILL_BLACKSMITHING"],
				},
				[103] = {
					["id"] = "SKILL_COOKING",
					["text"] = ArkInventory.Localise["WOW_SKILL_COOKING"],
				},
				[104] = {
					["id"] = "SKILL_ENGINEERING",
					["text"] = ArkInventory.Localise["WOW_SKILL_ENGINEERING"],
				},
				[105] = {
					["id"] = "SKILL_ENCHANTING",
					["text"] = ArkInventory.Localise["WOW_SKILL_ENCHANTING"],
				},
				[106] = {
					["id"] = "SKILL_FIRST_AID",
					["text"] = ArkInventory.Localise["WOW_SKILL_FIRST_AID"],
				},
				[107] = {
					["id"] = "SKILL_FISHING",
					["text"] = ArkInventory.Localise["WOW_SKILL_FISHING"],
				},
				[108] = {
					["id"] = "SKILL_HERBALISM",
					["text"] = ArkInventory.Localise["WOW_SKILL_HERBALISM"],
				},
				[109] = {
					["id"] = "SKILL_JEWELCRAFTING",
					["text"] = ArkInventory.Localise["WOW_SKILL_JEWELCRAFTING"],
				},
				[110] = {
					["id"] = "SKILL_LEATHERWORKING",
					["text"] = ArkInventory.Localise["WOW_SKILL_LEATHERWORKING"],
				},
				[111] = {
					["id"] = "SKILL_MINING",
					["text"] = ArkInventory.Localise["WOW_SKILL_MINING"],
				},
				[112] = {
					["id"] = "SKILL_SKINNING",
					["text"] = ArkInventory.Localise["WOW_SKILL_SKINNING"],
				},
				[113] = {
					["id"] = "SKILL_TAILORING",
					["text"] = ArkInventory.Localise["WOW_SKILL_TAILORING"],
				},
				[114] = {
					["id"] = "SKILL_RIDING",
					["text"] = ArkInventory.Localise["WOW_SKILL_RIDING"],
				},
				[115] = {
					["id"] = "SKILL_INSCRIPTION",
					["text"] = ArkInventory.Localise["WOW_SKILL_INSCRIPTION"],
				},
			},
			Class = {
				[201] = {
					["id"] = "CLASS_DRUID",
					["text"] = ArkInventory.Localise["WOW_CLASS_DRUID"],
				},
				[202] = {
					["id"] = "CLASS_HUNTER",
					["text"] = ArkInventory.Localise["WOW_CLASS_HUNTER"],
				},
				[203] = {
					["id"] = "CLASS_MAGE",
					["text"] = ArkInventory.Localise["WOW_CLASS_MAGE"],
				},
				[204] = {
					["id"] = "CLASS_PALADIN",
					["text"] = ArkInventory.Localise["WOW_CLASS_PALADIN"],
				},
				[205] = {
					["id"] = "CLASS_PRIEST",
					["text"] = ArkInventory.Localise["WOW_CLASS_PRIEST"],
				},
				[206] = {
					["id"] = "CLASS_ROGUE",
					["text"] = ArkInventory.Localise["WOW_CLASS_ROGUE"],
				},
				[207] = {
					["id"] = "CLASS_SHAMAN",
					["text"] = ArkInventory.Localise["WOW_CLASS_SHAMAN"],
				},
				[208] = {
					["id"] = "CLASS_WARLOCK",
					["text"] = ArkInventory.Localise["WOW_CLASS_WARLOCK"],
				},
				[209] = {
					["id"] = "CLASS_WARRIOR",
					["text"] = ArkInventory.Localise["WOW_CLASS_WARRIOR"],
				},
				[210] = {
					["id"] = "CLASS_DEATHKNIGHT",
					["text"] = ArkInventory.Localise["WOW_CLASS_DEATHKNIGHT"],
				},
			},
			Empty = {
				[300] = {
					["id"] = "EMPTY_UNKNOWN",
					["text"] = ArkInventory.Localise["UNKNOWN"],
				},
				[301] = {
					["id"] = "EMPTY",
					["text"] = ArkInventory.Localise["CATEGORY_EMPTY"],
				},
				[302] = {
					["id"] = "EMPTY_BAG",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_BAG"],
				},
				[303] = {
					["id"] = "EMPTY_KEY",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_KEY"],
				},
				[304] = {
					["id"] = "EMPTY_SOULSHARD",
					["text"] = ArkInventory.Localise["CATEGORY_SYSTEM_SOULSHARD"],
				},
				[305] = {
					["id"] = "EMPTY_HERB",
					["text"] = ArkInventory.Localise["WOW_SKILL_HERBALISM"],
				},
				[306] = {
					["id"] = "EMPTY_ENCHANTING",
					["text"] = ArkInventory.Localise["WOW_SKILL_ENCHANTING"],
				},
				[307] = {
					["id"] = "EMPTY_ENGINEERING",
					["text"] = ArkInventory.Localise["WOW_SKILL_ENGINEERING"],
				},
				[308] = {
					["id"] = "EMPTY_GEM",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_GEM"],
				},
				[309] = {
					["id"] = "EMPTY_MINING",
					["text"] = ArkInventory.Localise["WOW_SKILL_MINING"],
				},
				[312] = {
					["id"] = "EMPTY_LEATHERWORKING",
					["text"] = ArkInventory.Localise["WOW_SKILL_LEATHERWORKING"],
				},
				[310] = {
					["id"] = "EMPTY_PROJECTILE_BULLET",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_PROJECTILE_BULLET"],
				},
				[311] = {
					["id"] = "EMPTY_PROJECTILE_ARROW",
					["text"] = ArkInventory.Localise["WOW_ITEM_TYPE_PROJECTILE_ARROW"],
				},
				[313] = {
					["id"] = "EMPTY_INSCRIPTION",
					["text"] = ArkInventory.Localise["WOW_SKILL_INSCRIPTION"],
				},
			},
			Other = { -- do NOT change the indicies - if you have to then see the ConvertOldOptions( ) function to remap it
				[901] = {
					["id"] = "SYSTEM_CORE_MATS",
					["text"] = ArkInventory.Localise["CATEGORY_SYSTEM_CORE_MATS"],
				},
				[902] = {
					["id"] = "CONSUMABLE_FOOD_PET",
					["text"] = ArkInventory.Localise["CATEGORY_CONSUMABLE_FOOD_PET"],
				},
			},
		},
		
	},
	
	Texture = {
		Missing = [[Interface\Icons\Temp]],
		Empty = {
			Item = [[Interface\PaperDoll\UI-Backpack-EmptySlot]], -- [[Interface\PaperDoll\UI-Backpack-EmptySlot]]
			Ammo = [[Interface\paperDoll\UI-PaperDoll-Slot-Ammo]], -- [[Interface\paperDoll\UI-PaperDoll-Slot-Ammo]]
			Bag = [[Interface\PaperDoll\UI-PaperDoll-Slot-Bag]], -- [[Interface\PaperDoll\UI-PaperDoll-Slot-Bag]]
		},
		
		BackgroundDefault = "Solid",
		
		BorderDefault = "Blizzard Tooltip",
		BorderNone = "None",
		
		Border = {
			["Blizzard Tooltip"] = {
				["size"] = 16,
				["offset"] = 3,
				["scale"] = 1,
			},
			["Blizzard Dialog"] = {
				["size"] = 32,
				["offset"] = 9,
			},
			["Blizzard Dialog Gold"] = {
				["size"] = 32,
				["offset"] = 9,
			},
			["ArkInventory Tooltip 1"] = {
				["size"] = 16,
				["offset"] = 3,
			},
			["ArkInventory Tooltip 2"] = {
				["size"] = 16,
				["offset"] = 4,
			},
			["ArkInventory Tooltip 3"] = {
				["size"] = 16,
				["offset"] = 5,
			},
			["ArkInventory Square 1"] = {
				["size"] = 16,
				["offset"] = 3,
			},
			["ArkInventory Square 2"] = {
				["size"] = 16,
				["offset"] = 4,
			},
			["ArkInventory Square 3"] = {
				["size"] = 16,
				["offset"] = 5,
			},
		},
		
	},
	
	Actions = {
		[11] = {
			Texture = [[Interface\Icons\Trade_Engineering]],
			Name = ArkInventory.Localise["MENU_ACTION_EDITMODE"],
			LDB = true,
			Scripts = {
				OnClick = function( self )
					ArkInventory.ToggleEditMode( )
				end,
				OnEnter = function( self )
					ArkInventory.GameTooltipSetText( self, ArkInventory.Localise["MENU_ACTION_EDITMODE"] )
				end,
			},
		},
		[12] = {
			Texture = [[Interface\Icons\INV_Misc_Book_10]], --Interface\Icons\INV_Gizmo_02    INV_Misc_Note_05
			Name = ArkInventory.Localise["CONFIG_RULES"],
			LDB = true,
			Scripts = {
				OnClick = function( self )
					ArkInventory.Frame_Rules_Toggle( )
				end,
				OnEnter = function( self )
					ArkInventory.GameTooltipSetText( self, ArkInventory.Localise["CONFIG_RULES"] )
				end,
			},
		},
		[13] = {
			Texture = [[Interface\Minimap\Tracking\None]], --Interface\Icons\INV_Misc_EngGizmos_20
			Name = ArkInventory.Localise["CONFIG_SEARCH"],
			LDB = true,
			Scripts = {
				OnClick = function( self, button )
					if button == "LeftButton" then
						ArkInventory.Frame_Search_Toggle( )
					elseif button == "RightButton" then
						local loc_id = self:GetParent( ):GetParent( ):GetID( )
						if ArkInventory.Global.Location[loc_id].canSearch then
							local v = not ArkInventory.LocationOptionGet( loc_id, { "search", "hide" } )
							ArkInventory.Global.Location[loc_id].filter = nil
							ArkInventory.LocationOptionSet( loc_id, { "search", "hide" }, v )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
						end
					end
				end,
				OnEnter = function( self )
					ArkInventory.GameTooltipSetText( self, ArkInventory.Localise["CONFIG_SEARCH"] )
				end,
			},
		},
		[14] = {
			Texture = [[Interface\Icons\INV_Misc_GroupLooking]],
			Name = ArkInventory.Localise["MENU_CHARACTER_SWITCH"],
			Scripts = {
				OnClick = function( self )
					ArkInventory.MenuSwitchCharacterOpen( self:GetParent( ):GetParent( ) )
				end,
				OnEnter = function( self )
					ArkInventory.GameTooltipSetText( self, ArkInventory.Localise["MENU_CHARACTER_SWITCH"] )
				end,
			},
		},
		[21] = {
			Texture = [[Interface\Icons\INV_Helmet_47]],
			Name = ArkInventory.Localise["MENU_LOCATION_SWITCH"],
			Scripts = {
				OnClick = function( self )
					ArkInventory.MenuSwitchLocationOpen( )
				end,
				OnEnter = function( self )
					ArkInventory.GameTooltipSetText( self, ArkInventory.Localise["MENU_LOCATION_SWITCH"] )
				end,
			},
		},
		[22] = {
			Texture = [[Interface\Icons\Spell_Shadow_DestructiveSoul]],
			Name = ArkInventory.Localise["RESTACK"],
			LDB = true,
			Scripts = {
				OnClick = function( self )
					ArkInventory.Restack( )
				end,
				OnEnter = function( self )
					ArkInventory.GameTooltipSetText( self, ArkInventory.Localise["RESTACK"] )
				end,
			},
		},
		[23] = {
			Texture = [[Interface\Icons\INV_Misc_EngGizmos_17]],
			Name = ArkInventory.Localise["MENU_ACTION_BAGCHANGER"],
			Scripts = {
				OnClick = function( self )
					ArkInventory.ToggleChanger( self:GetParent( ):GetParent( ):GetID( ) )
				end,
				OnEnter = function( self )
					ArkInventory.GameTooltipSetText( self, ArkInventory.Localise["MENU_ACTION_BAGCHANGER"] )
				end,
			},
		},
		[24] = {
			Texture = [[Interface\Icons\Spell_Frost_Stun]],
			Name = ArkInventory.Localise["MENU_ACTION_REFRESH"],
			Scripts = {
				OnClick = function( self )
					ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Resort )
				end,
				OnEnter = function( self )
					ArkInventory.GameTooltipSetText( self, ArkInventory.Localise["MENU_ACTION_REFRESH"] )
				end,
			},
		},
		[91] = {
			Name = ArkInventory.Localise["MENU_ACTION_REFRESH"],
			Scripts = {
				OnClick = function( self )
					-- menu
				end,
				OnEnter = function( self )
					ArkInventory.GameTooltipSetText( self, "change tracking" )
				end,
			},
		},
	},
	
	SortKeys = { -- true = keep, false = remove
		category = true,
		location = true,
		itemuselevel = true,
		itemstatlevel = true,
		itemtype = true,
		quality = true,
		name = true,
		vendorprice = true,
		itemage = true,
	},

	Skills = "ALCHEMY,BLACKSMITHING,ENCHANTING,ENGINEERING,JEWELCRAFTING,INSCRIPTION,LEATHERWORKING,TAILORING,HERBALISM,MINING,SKINNING,COOKING,FIRST_AID,FISHING,RIDING", -- primary craft, primary collect, secondary
	
	DatabaseDefaults = { },
	
}

ArkInventory.Const.Slot.Data = {
	[ArkInventory.Const.Slot.Type.Unknown] = {
		["name"] = ArkInventory.Localise["UNKNOWN"],
		["long"] = ArkInventory.Localise["UNKNOWN"],
		["type"] = ArkInventory.Localise["UNKNOWN"],
		["colour"] = { r = 1.0, g = 0.0, b = 0.0 }, -- red
	},
	[ArkInventory.Const.Slot.Type.Key] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_KEY"],
		["long"] = ArkInventory.Localise["WOW_ITEM_TYPE_KEY"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_KEY"],
		["colour"] = { r = 1.0, g = 1.0, b = 0.0 }, -- yellow,
		["hide"] = true,
	},
	[ArkInventory.Const.Slot.Type.Bag] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_BAG"],
		["long"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_BAG"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_BAG"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
	},
	[ArkInventory.Const.Slot.Type.Soulshard] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_SOULSHARD"],
		["long"] = ArkInventory.Localise["CATEGORY_SYSTEM_SOULSHARD"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_SOULSHARD"],
		["colour"] = { r = 1.0, g = 0.0, b = 1.0 }, -- magenta
	},
	[ArkInventory.Const.Slot.Type.Herb] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_HERB"],
		["long"] = ArkInventory.Localise["WOW_SKILL_HERBALISM"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_HERB"],
		["colour"] = { r = 0.0, g = 1.0, b = 0.0 }, -- green
	},
	[ArkInventory.Const.Slot.Type.Enchanting] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_ENCHANTING"],
		["long"] = ArkInventory.Localise["WOW_SKILL_ENCHANTING"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_ENCHANTING"],
		["colour"] = { r = 0.0, g = 0.0, b = 1.0 }, -- blue
	},
	[ArkInventory.Const.Slot.Type.Engineering] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_ENGINEERING"],
		["long"] = ArkInventory.Localise["WOW_SKILL_ENGINEERING"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_ENGINEERING"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
	},
	[ArkInventory.Const.Slot.Type.Gem] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_GEM"],
		["long"] = ArkInventory.Localise["WOW_ITEM_TYPE_GEM"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_GEM"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
	},
	[ArkInventory.Const.Slot.Type.Mining] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_MINING"],
		["long"] = ArkInventory.Localise["WOW_SKILL_MINING"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_MINING"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
	},
	[ArkInventory.Const.Slot.Type.Leatherworking] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_LEATHERWORKING"],
		["long"] = ArkInventory.Localise["WOW_SKILL_LEATHERWORKING"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_LEATHERWORKING"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
	},
	[ArkInventory.Const.Slot.Type.Inscription] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_INSCRIPTION"],
		["long"] = ArkInventory.Localise["WOW_SKILL_INSCRIPTION"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_INSCRIPTION"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
	},
	[ArkInventory.Const.Slot.Type.Bullet] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_PROJECTILE_BULLET"],
		["long"] = ArkInventory.Localise["WOW_ITEM_TYPE_QUIVER_BULLET"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_QUIVER_BULLET"],
		["texture"] = ArkInventory.Const.Texture.Empty.Ammo,
		["colour"] = { r = 1.0, g = 0.5, b = 0.15 }, -- orange
		["emptycolour"] = GREEN_FONT_COLOR_CODE, -- status text colour when no slots left
	},
	[ArkInventory.Const.Slot.Type.Arrow] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_PROJECTILE_ARROW"],
		["long"] = ArkInventory.Localise["WOW_ITEM_TYPE_QUIVER_ARROW"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_QUIVER_ARROW"],
		["texture"] = ArkInventory.Const.Texture.Empty.Ammo,
		["colour"] = { r = 1.0, g = 0.5, b = 0.15 }, -- orange
		["emptycolour"] = GREEN_FONT_COLOR_CODE, -- status text colour when no slots left
	},
	[ArkInventory.Const.Slot.Type.Wearing] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_GEAR"],
		["long"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_BAG"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_BAG"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
		["emptycolour"] = GREEN_FONT_COLOR_CODE, -- status text colour when no slots left
		["hide"] = true,
	},
	[ArkInventory.Const.Slot.Type.Mail] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_MAIL"],
		["long"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_BAG"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_BAG"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
		["emptycolour"] = GREEN_FONT_COLOR_CODE, -- status text colour when no slots left
		["hide"] = true,
	},
	[ArkInventory.Const.Slot.Type.Critter] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_CRITTER"],
		["long"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_BAG"],
		["type"] = ArkInventory.Localise["WOW_ITEM_TYPE_MISC_PET"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
		["emptycolour"] = GREEN_FONT_COLOR_CODE, -- status text colour when no slots left
		["hide"] = true,
	},
	[ArkInventory.Const.Slot.Type.Mount] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_MOUNT"],
		["long"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_BAG"],
		["type"] = ArkInventory.Localise["WOW_SKILL_RIDING"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
		["emptycolour"] = GREEN_FONT_COLOR_CODE, -- status text colour when no slots left
		["hide"] = true,
	},
	[ArkInventory.Const.Slot.Type.Token] = {
		["name"] = ArkInventory.Localise["STATUS_NAME_TOKEN"],
		["long"] = ArkInventory.Localise["WOW_ITEM_TYPE_CONTAINER_BAG"],
		["type"] = ArkInventory.Localise["CATEGORY_SYSTEM_TOKEN"],
		["colour"] = ArkInventory.Const.Slot.DefaultColour,
		["emptycolour"] = GREEN_FONT_COLOR_CODE, -- status text colour when no slots left
		["hide"] = true,
	},
}

ArkInventory.Global = { -- globals

	Version = "", --calculated

	Me = nil,

	Mode = {
		Bank = false,
		Vault = false,
		Mail = false,
		Merchant = false,
		
		Edit = false,
		Combat = false,
	},

	Tooltip = {
		Scan = nil,
		Vendor = nil,
		Rule = nil,
		WOW = { GameTooltip, ShoppingTooltip1, ShoppingTooltip2, ShoppingTooltip3, ItemRefTooltip, ItemRefShoppingTooltip1, ItemRefShoppingTooltip2, ItemRefShoppingTooltip3 }
	},
	
	Category = { }, -- see CategoryGenerate( ) for how this gets populated

	Location = {
		
		[ArkInventory.Const.Location.Bag] = {
			Internal = "bag",
			Name = ArkInventory.Localise["LOCATION_BAG"],
			Texture = [[Interface\Icons\INV_Misc_Bag_07_Green]],
			bagCount = 1, -- actual value set in OnInitialize
			Bags = { },
			canRestack = true,
			hasChanger = true,
			canSearch = true,
			
			Layout = { },
			maxBar = 0,
			maxSlot = { },
			
			isOffline = false,
			canView = true,
			canOverride = true,
			
			drawState = ArkInventory.Const.Window.Draw.Init,
		},
		
		[ArkInventory.Const.Location.Key] = {
			Internal = "key",
			Name = KEYRING,
			Texture = [[Interface\ContainerFrame\KeyRing-Bag-Icon]], --Interface\Icons\INV_Misc_Key_03
			bagCount = 1,
			Bags = { },
			canRestack = true,
			hasChanger = nil,
			canSearch = true,
			
			Layout = { },
			maxBar = 0,
			maxSlot = { },
			
			isOffline = false,
			canView = true,
			canOverride = true,
			
			drawState = ArkInventory.Const.Window.Draw.Init,
		},
		
		[ArkInventory.Const.Location.Bank] = {
			Internal = "bank",
			Name = ArkInventory.Localise["LOCATION_BANK"],
			Texture = [[Interface\Icons\INV_Box_02]], --Interface\Minimap\Tracking\Banker
			bagCount = 1, -- actual value set in OnInitialize
			Bags = { },
			canRestack = true,
			hasChanger = true,
			canSearch = true,
			
			Layout = { },
			maxBar = 0,
			maxSlot = { },
			
			isOffline = true,
			canView = true,
			canOverride = true,
			canPurge = true,
			
			drawState = ArkInventory.Const.Window.Draw.Init,
		},
		
		[ArkInventory.Const.Location.Vault] = {
			Internal = "vault",
			Name = GUILD_BANK,
			Texture = [[Interface\Icons\INV_Misc_Coin_02]],
			bagCount = 1, -- actual value set in OnInitialize
			Bags = { },
			canRestack = true,
			hasChanger = true,
			canSearch = true,
			
			Layout = { },
			maxBar = 0,
			maxSlot = { },
			
			isOffline = true,
			canView = true,
			canOverride = true,
			canPurge = true,
			
			drawState = ArkInventory.Const.Window.Draw.Init,
			
			current_tab = 1,
			
		},
		
		[ArkInventory.Const.Location.Mail] = {
			Internal = "mail",
			Name = MAIL_LABEL,
			Texture = [[Interface\Minimap\Tracking\Mailbox]], --[[Interface\Icons\INV_Letter_01]]
			bagCount = 1,
			Bags = { },
			canRestack = nil,
			hasChanger = nil,
			canSearch = true,
			
			Layout = { },
			maxBar = 0,
			maxSlot = { },
			
			isOffline = true,
			canView = true,
			canOverride = nil,
			canPurge = true,
			
			drawState = ArkInventory.Const.Window.Draw.Init,
		},
		
		[ArkInventory.Const.Location.Wearing] = {
			Internal = "wearing",
			Name = ArkInventory.Localise["LOCATION_WEARING"],
			Texture = [[Interface\Icons\INV_Boots_05]],
			bagCount = 1,
			Bags = { },
			canRestack = nil,
			hasChanger = nil,
			canSearch = true,
			
			Layout = { },
			maxBar = 0,
			maxSlot = { },
			
			isOffline = false,
			canView = true,
			canOverride = nil,

			drawState = ArkInventory.Const.Window.Draw.Init,
		},
		
		[ArkInventory.Const.Location.Pet] = {
			Internal = "pet",
			Name = ArkInventory.Localise["LOCATION_PET"],
			Texture = [[Interface\Icons\INV_Jewelcrafting_GoldenOwl]],
			bagCount = 1,
			Bags = { },
			canRestack = nil,
			hasChanger = nil,
			canSearch = true,
			
			Layout = { },
			maxBar = 0,
			maxSlot = { },
			
			isOffline = false,
			canView = true,
			canOverride = nil,
			
			drawState = ArkInventory.Const.Window.Draw.Init,
		},
		
		[ArkInventory.Const.Location.Mount] = {
			Internal = "mount",
			Name = ArkInventory.Localise["LOCATION_MOUNT"],
			Texture = [[Interface\Icons\Ability_Mount_WarHippogryph]],
			bagCount = 1,
			Bags = { },
			canRestack = nil,
			hasChanger = nil,
			canSearch = true,
			
			Layout = { },
			maxBar = 0,
			maxSlot = { },
			
			isOffline = false,
			canView = true,
			canOverride = nil,
			
			drawState = ArkInventory.Const.Window.Draw.Init,
		},
		
		[ArkInventory.Const.Location.Token] = {
			Internal = "token",
			Name = ArkInventory.Localise["LOCATION_TOKEN"],
			Texture = [[Interface\TokenFrame\UI-TokenFrame-Icon]], -- Icons\Spell_Holy_ChampionsBond
			bagCount = 1,
			Bags = { },
			canRestack = nil,
			hasChanger = nil,
			canSearch = true,
			
			Layout = { },
			maxBar = 0,
			maxSlot = { },
			
			isOffline = false,
			canView = true,
			canOverride = nil,
			
			drawState = ArkInventory.Const.Window.Draw.Init,
		},
		
	},

	Cache = {
		ItemCount = { }, -- key generated via ObjectIDTooltip( h )
		Default = { }, -- key generated via ObjectIDCacheCategory( i )
		Rule = { }, -- key generated via ObjectIDCacheRule( i )
	},
	
	BAG_SLOT_SIZE = 32,

	Thread = {
		Restack = { },
	},
	
	Options = {
		Location = ArkInventory.Const.Location.Bag,
		CustomCategorySort = true,
		CustomSortKeySort = true,
		BarMoveSource = nil,
		BarMoveDestination = nil,
	},
	
}

ArkInventory.Config = {
	Blizzard = {
		type = "group",
		childGroups = "tree",
		name = ArkInventory.Const.Program.Name,
	},
	Internal = {
		type = "group",
		childGroups = "tree",
		name = ArkInventory.Const.Program.Name,
	},
}


-- Binding Variables
BINDING_HEADER_ARKINV = ArkInventory.Const.Program.Name
BINDING_NAME_ARKINV_TOGGLE_BAG = ArkInventory.Localise["LOCATION_BAG"]
BINDING_NAME_ARKINV_TOGGLE_BANK = ArkInventory.Localise["LOCATION_BANK"]
BINDING_NAME_ARKINV_TOGGLE_KEY = KEYRING
BINDING_NAME_ARKINV_TOGGLE_VAULT = GUILD_BANK
BINDING_NAME_ARKINV_TOGGLE_MAIL = MAIL_LABEL
BINDING_NAME_ARKINV_TOGGLE_WEARING = ArkInventory.Localise["LOCATION_WEARING"]
BINDING_NAME_ARKINV_TOGGLE_PET = ArkInventory.Localise["LOCATION_PET"]
BINDING_NAME_ARKINV_TOGGLE_MOUNT = ArkInventory.Localise["LOCATION_MOUNT"]
BINDING_NAME_ARKINV_TOGGLE_TOKEN = ArkInventory.Localise["LOCATION_TOKEN"]
BINDING_NAME_ARKINV_TOGGLE_EDIT = ArkInventory.Localise["MENU_ACTION_EDITMODE"]
BINDING_NAME_ARKINV_TOGGLE_RULES = ArkInventory.Localise["CONFIG_RULES"]
BINDING_NAME_ARKINV_TOGGLE_SEARCH = ArkInventory.Localise["CONFIG_SEARCH"]
BINDING_NAME_ARKINV_RESTACK = ArkInventory.Localise["RESTACK"]
BINDING_NAME_ARKINV_MENU = ArkInventory.Localise["MENU"]
BINDING_NAME_ARKINV_CONFIG = ArkInventory.Localise["CONFIG_TEXT"]
BINDING_NAME_ARKINV_LDB_PETS_SUMMON = ArkInventory.Localise["LDB_PETS_SUMMON"]
BINDING_NAME_ARKINV_LDB_MOUNTS_SUMMON = ArkInventory.Localise["LDB_MOUNTS_SUMMON"]


ArkInventory.Const.DatabaseDefaults.global = {
	["option"] = {
		["version"] = 0,
		["auto"] = {
			["open"] = {
				["*"] = true,
			},
			["close"] = {
				["*"] = true,
			},
		},
		["category"] = {
			["*"] = { -- type: rule or custom
				["data"] = {
					["*"] = {  -- [number] = { data }
						["used"] = false,
						["name"] = "",
					},
				},
				["next"] = 0,
			},
		},
		["sort"] = {
			["data"] = {
				[9999] = {
					["system"] = true,
					["used"] = true,
					["name"] = "(*) "..ArkInventory.Localise["CONFIG_SORTMETHOD_STYLE_BAGSLOT"],
					["bagslot"] = true,
					["ascending"] = true,
					["reversed"] = false,
					["active"] = { },
					["order"] = { },
				},
				[9998] = {
					["system"] = true,
					["used"] = true,
					["name"] = "(*) Rarity>Category>Location>Name",
					["bagslot"] = false,
					["ascending"] = true,
					["reversed"] = false,
					["active"] = {
						["quality"] = true,
						["category"] = true,
						["location"] = true,
						["name"] = true,
					},
					["order"] = {
						[1] = "quality",
						[2] = "category",
						[3] = "location",
						[4] = "name",
					},
				},
				[9997] = {
					["system"] = true,
					["used"] = true,
					["name"] = "(*) Name",
					["bagslot"] = false,
					["ascending"] = true,
					["reversed"] = false,
					["active"] = {
						["name"] = true,
					},
					["order"] = {
						[1] = "name",
					},
				},
				["*"] = {
					["system"] = false,
					["used"] = false,
					["name"] = "",
					["bagslot"] = true,
					["ascending"] = true,
					["reversed"] = false,
					["active"] = { },
					["order"] = { },
				},
			},
			["next"] = 0,
		},
		["showdisabled"] = true,
		["bucket"] = {	
			["*"] = nil
		},
		["bugfix"] = {
			["framelevel"] = {
				["enable"] = true,
				["alert"] = 2,
			},
			["zerosizebag"] = {
				["enable"] = true,
				["alert"] = true,
			},
		},
		["tooltip"] = {
			["show"] = true, -- show tooltips for items
			["scale"] = {
				["enabled"] = false,
				["amount"] = 1,
			},
			["me"] = false, -- only show my data
			["faction"] = false, -- only show my faction
			["add"] = { -- things to add to the tooltip
				["empty"] = false, -- empty line / seperator
				["count"] = true, -- item count
				["vendor"] = false, -- vendor price (deprecated)
				["ilvl"] = false, -- item level (deprecated)
				["vault"] = true,
				["tabs"] = true,
			},
			["colour"] = {
				["count"] =  {
					["r"] = 1,
					["g"] = 0.5,
					["b"] = 0.15,
				},
				["vendor"] =  {
					["r"] = 0.5,
					["g"] = 0.5,
					["b"] = 0.5,
				},
				["class"] = false,
			},
		},
	},
	["player"] = { },
}

ArkInventory.Const.DatabaseDefaults.realm = {
	["player"] = {
		["version"] = 0,
		["data"] = {
			["*"] = { -- player or guild name
				["monitor"] = {
					["*"] = true,
				},
				["save"] = {
					["*"] = true,
				},
				["erasesilent"] = false,
				["control"] = { -- which locations to take control of
					[ArkInventory.Const.Location.Bag] = true,
					[ArkInventory.Const.Location.Bank] = true,
					[ArkInventory.Const.Location.Key] = true,
					[ArkInventory.Const.Location.Vault] = true,
					["*"] = false,
				},
				["display"] = {
					["*"] = {
						["bag"] = {
							["*"] = true,
						},
					}
				},
				["info"] = { },
				["location"] = {
					["*"] = {
						["slot_count"] = 0,
						["bag"] = {
							["*"] = {
								["status"] = ArkInventory.Const.Bag.Status.Unknown,
								--["texture"] = nil,
								--["h"] = nil,
								--["q"] = nil,
								["type"] = ArkInventory.Const.Slot.Type.Unknown,
								["count"] = 0,
								["empty"] = 0,
								["slot"] = {	},
							},
						},
					},
				},
			},
		},
	},
}

ArkInventory.Const.DatabaseDefaults.char = {
	["option"] = {
		["version"] = 0,
		["ldb"] = {
			["bags"] = {
				["colour"] = false,
				["full"] = true,
				["includetype"] = true,
			},
			["ammo"] = {
				["durability"] = true,
			},
			["currency"] = {
				["track"] = nil,
			},
			["pets"] = {
				["track"] = nil,
				["restrict"] = true,
			},
			["mounts"] = {
				["ground"] = {
					["track"] = nil,
					["min"] = 60,
				},
				["flying"] = {
					["dismount"] = false,
					["track"] = nil,
					["min"] = 100,
				},
			},
		},
	},
}

ArkInventory.Const.DatabaseDefaults.profile = {
	["option"] = {
		["version"] = 0,
		["category"] = { }, -- ["item id"] = category number to put the item in
		["rule"] = {
			["*"] = false,
		},
		["use"] = {	},
		["location"] = {
			["*"] = {
				["window"] = {
					["scale"] = 1,
					["width"] = 16,
					["border"] = {
						["style"] = ArkInventory.Const.Texture.BorderDefault,
						["size"] = nil,
						["offset"] = nil,
						["scale"] = 1,
						["colour"] = {
							["r"] = 1,
							["g"] = 1,
							["b"] = 1,
						},
					},
					["pad"] = 8,
					["background"] = {
						["style"] = ArkInventory.Const.Texture.BackgroundDefault,
						["colour"] = {
							["r"] = 0,
							["g"] = 0,
							["b"] = 0,
							["a"] = 0.75,
						},
					},
				},
				["bar"] = {
					["per"] = 5,
					["pad"] = {
						["internal"] = 8,
						["external"] = 8,
					},
					["border"] = {
						["style"] = ArkInventory.Const.Texture.BorderDefault,
						["size"] = nil,
						["offset"] = nil,
						["scale"] = 1,
						["colour"] = {
							["r"] = 0.3,
							["g"] = 0.3,
							["b"] = 0.3,
						},
					},
					["background"] = {
						["colour"] = {
							["r"] = 0,
							["g"] = 0,
							["b"] = 0.4,
							["a"] = 0.4,
						},
					},
					["showempty"] = false,
					["anchor"] = ArkInventory.Const.Anchor.BottomRight,
					["compact"] = false,
					["hide"] = false,
					["name"] = {
						["show"] = false,
						["colour"] = {
							["r"] = 1,
							["b"] = 1,
							["g"] = 1,
						},
						["height"] = 12,
						["justify"] = ArkInventory.Const.Anchor.Left,
						["anchor"] = ArkInventory.Const.Anchor.Automatic,
					},
					["data"] = {
						["*"] = {
							-- label
							-- sortorder
						},
					},
				},
				["slot"] = {
					["empty"] = {
						["alpha"] = 0.1,
						["icon"] = true,
						["border"] = true,
						["clump"] = false,
					},
					["data"] = ArkInventory.Const.Slot.Data,
					["pad"] = 4,
					["border"] = {
						["style"] = ArkInventory.Const.Texture.BorderDefault,
						["size"] = nil,
						["offset"] = nil,
						["scale"] = 1,
						["rarity"] = true,
						["raritycutoff"] = 0,
					},
					["ignorehidden"] = false,
					["anchor"] = ArkInventory.Const.Anchor.BottomRight,
					["new"] = {
						["show"] = false,
						["colour"] = {
							["r"] = 1,
							["g"] = 1,
							["b"] = 1,
						},
						["cutoff"] = 4,
					},
					["offline"] = {
						["fade"] = true,
					},
					["unusable"] = {
						["tint"] = false,
					},
					["cooldown"] = {
						["show"] = true,
						["global"] = false,
						["combat"] = true,
					},
				},
				["sort"] = {
					["open"] = true,
					["instant"] = false,
					["default"] = 9999,
				},
				["category"] = {
					["*"] = nil, -- [category number] = bar number to put rule on
				}, 
				["anchor"] = {
					["*"] = {
						["point"] = ArkInventory.Const.Anchor.TopRight,
						["locked"] = false,
						["t"] = 0,
						["b"] = 0,
						["l"] = 0,
						["r"] = 0,
					},
				},
				["notifyerase"] = true,
				["title"] = {
					["hide"] = false,
					["size"] = 1,
				},
				["search"] = {
					["hide"] = false,
				},
				["changer"] = {
					["hide"] = false,
					["highlight"] = {
						["show"] = true,
						["colour"] = {
							["r"] = 0,
							["g"] = 1,
							["b"] = 0,
						},
					},
					["freespace"] = {
						["show"] = true,
						["colour"] = {
							["r"] = 1,
							["g"] = 1,
							["b"] = 1,
						},
					},
				},
				["status"] = {
					["hide"] = false,
					["emptytext"] = {   -- slot>empty>display
						["show"] = true,
						["colour"] = false,
						["full"] = true,
						["includetype"] = true,
					},
				},
			},
		},
		["font"] = {
			["name"] = nil,
			["size"] = 0,
		},
		["ui"] = {
			["search"] = {
				["scale"] = 1,
				["background"] = {
					["style"] = ArkInventory.Const.Texture.BackgroundDefault,
					["colour"] = {
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
						["a"] = 0.75,
					},
				},
				["border"] = {
					["style"] = ArkInventory.Const.Texture.BorderDefault,
					["size"] = nil,
					["offset"] = nil,
					["scale"] = 1,
					["colour"] = {
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
				},
			},
			["rules"] = {
				["scale"] = 1,
				["background"] = {
					["style"] = ArkInventory.Const.Texture.BackgroundDefault,
					["colour"] = {
						["r"] = 0,
						["g"] = 0,
						["b"] = 0,
						["a"] = 0.75,
					},
				},
				["border"] = {
					["style"] = ArkInventory.Const.Texture.BorderDefault,
					["size"] = nil,
					["offset"] = nil,
					["scale"] = 1,
					["colour"] = {
						["r"] = 1,
						["g"] = 1,
						["b"] = 1,
					},
				},
			},
		},
	},
}

function ArkInventory.OnInitialize( )
	
	--ArkInventory.Output( "OnInitialize" )
	
	ArkInventory.Global.Version = string.format( "v%s", ArkInventory.Const.Program.UIVersion )
	if ArkInventory.Const.Program.Beta then
		ArkInventory.Global.Version = string.format( "%s %s(%s)%s", ArkInventory.Global.Version, RED_FONT_COLOR_CODE, ArkInventory.Const.Program.Beta or "unknown beta version", FONT_COLOR_CODE_CLOSE )
	end
	
	-- pre acedb load, its just a raw table
	ArkInventory.ConvertAceDB2ToAceDB3( )
	
	-- erase old factionrealm data
	if ArkInventory.Const.Program.Version >= 3.0227 then
		if ARKINVDB and ARKINVDB.factionrealm then
			ARKINVDB.factionrealm = nil
		end
	end
	
	
	-- load database, use default profile, metatables now active so dont play with it
	ArkInventory.db = LibStub( "AceDB-3.0" ):New( "ARKINVDB", ArkInventory.Const.DatabaseDefaults, true )
	
	ArkInventory.StartupChecks( )
	
	-- cofnig menu (internal)
	ArkInventory.Lib.Config:RegisterOptionsTable( ArkInventory.Const.Frame.Config.Internal, ArkInventory.Config.Internal )
	ArkInventory.Lib.Dialog:SetDefaultSize( ArkInventory.Const.Frame.Config.Internal, 1000, 600 )
	
	-- config menu (blizzard)
	ArkInventory.ConfigBlizzard( )
	ArkInventory.Lib.Config:RegisterOptionsTable( ArkInventory.Const.Frame.Config.Blizzard, ArkInventory.Config.Blizzard, { "arkinventory", "arkinv", "ai" } )
	ArkInventory.Lib.Dialog:AddToBlizOptions( ArkInventory.Const.Frame.Config.Blizzard, ArkInventory.Const.Program.Name )
	
	
	-- tooltips
	ArkInventory.Global.Tooltip.Scan = ArkInventory.TooltipInit( "ARKINV_ScanTooltip" )	
	ArkInventory.Global.Tooltip.Vendor = ArkInventory.TooltipInit( "ARKINV_VendorTooltip" )
	ArkInventory.Global.Tooltip.Rule = ArkInventory.TooltipInit( "ARKINV_RuleTooltip" )
	
	local loc_id
	
	-- bags
	loc_id = ArkInventory.Const.Location.Bag
	ArkInventory.Global.Location[loc_id].bagCount = NUM_BAG_SLOTS + 1
	table.insert( ArkInventory.Global.Location[loc_id].Bags, BACKPACK_CONTAINER )
	--ArkInventory.Output( "added bag ", BACKPACK_CONTAINER, " to ", ArkInventory.Global.Location[loc_id].Name )
	for x = 1, NUM_BAG_SLOTS do
		table.insert( ArkInventory.Global.Location[loc_id].Bags, x )
		--ArkInventory.Output( "added bag ", x, " to ", ArkInventory.Global.Location[loc_id].Name )
	end
	
	-- keyring
	loc_id = ArkInventory.Const.Location.Key
	table.insert( ArkInventory.Global.Location[loc_id].Bags, KEYRING_CONTAINER )
	--ArkInventory.Output( "added bag ", KEYRING_CONTAINER, " to ", ArkInventory.Global.Location[loc_id].Name )
	
	-- bank
	loc_id = ArkInventory.Const.Location.Bank
	ArkInventory.Global.Location[loc_id].bagCount = NUM_BANKBAGSLOTS + 1
	table.insert( ArkInventory.Global.Location[loc_id].Bags, BANK_CONTAINER )
	--ArkInventory.Output( "added bag ", BANK_CONTAINER, " to ", ArkInventory.Global.Location[loc_id].Name )
	for x = NUM_BAG_SLOTS + 1, NUM_BAG_SLOTS + NUM_BANKBAGSLOTS do
		table.insert( ArkInventory.Global.Location[loc_id].Bags, x )
		--ArkInventory.Output( "added bag ", x, " to ", ArkInventory.Global.Location[loc_id].Name )
	end
	
	-- vault
	loc_id = ArkInventory.Const.Location.Vault
	ArkInventory.Global.Location[loc_id].bagCount = MAX_GUILDBANK_TABS
	for x = 1, MAX_GUILDBANK_TABS do
		table.insert( ArkInventory.Global.Location[loc_id].Bags, ArkInventory.Const.Offset.Vault + x )
	end
	
	-- mail
	table.insert( ArkInventory.Global.Location[ArkInventory.Const.Location.Mail].Bags, ArkInventory.Const.Offset.Mail + 1 )
	
	-- wearing
	table.insert( ArkInventory.Global.Location[ArkInventory.Const.Location.Wearing].Bags, ArkInventory.Const.Offset.Wearing + 1 )
	
	-- pet
	table.insert( ArkInventory.Global.Location[ArkInventory.Const.Location.Pet].Bags, ArkInventory.Const.Offset.Pet + 1 )
	ArkInventory.Global.Location[ArkInventory.Const.Location.Pet].bagCount = 1
	
	-- mount
	table.insert( ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].Bags, ArkInventory.Const.Offset.Mount + 1 )
	ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].bagCount = 1
	
	-- token
	table.insert( ArkInventory.Global.Location[ArkInventory.Const.Location.Token].Bags, ArkInventory.Const.Offset.Token + 1 )
	
	
	-- pets and mounts
	local key = nil
	for item, spell in pairs( ArkInventory.Const.CompanionTranslationData ) do
		
		if type( item ) == "number" and type( spell.id ) == "number" then
			
			-- item to spell
			key = string.format("item:%s", item)
			if not ArkInventory.Const.CompanionTranslation[key] then
				ArkInventory.Const.CompanionTranslation[key] = { }
			end
			ArkInventory.Const.CompanionTranslation[key][string.format("spell:%s", spell.id)] = true
			
			-- spell to item(s)
			key = string.format("spell:%s", spell.id)
			if not ArkInventory.Const.CompanionTranslation[key] then
				ArkInventory.Const.CompanionTranslation[key] = { }
			end
			ArkInventory.Const.CompanionTranslation[key][string.format("item:%s", item)] = true
			
		end
		
		if type( spell.id ) == "number" then
			-- companion spell data
			if not ArkInventory.Const.CompanionData[spell.id] then
				ArkInventory.Const.CompanionData[spell.id] = { }
			end
			ArkInventory.Const.CompanionData[spell.id]["f"] = spell.f
			ArkInventory.Const.CompanionData[spell.id]["s"] = spell.s
			ArkInventory.Const.CompanionData[spell.id]["r"] = spell.r
		end
	
	end
	
	wipe( ArkInventory.Const.CompanionTranslationData )
	ArkInventory.Const.CompanionTranslationData = nil
	
	ArkInventory.PlayerInfoSet( )
	ArkInventory.MediaRegister( )
	
	-- 3rd party addons that require hooking for item updates
	
	-- scrap: http://wow.curse.com/downloads/wow-addons/details/scrap.aspx
	if IsAddOnLoaded( "Scrap" ) then
		if Scrap.OnReceiveDrag then
			ArkInventory.Output( "enabling Scrap support" )
			Scrap:HookScript( "OnReceiveDrag", ArkInventory.ItemCacheClear )
		end
	end
	
	-- selljunk: http://wow.curse.com/downloads/wow-addons/details/sell-junk.aspx
	if IsAddOnLoaded( "SellJunk" ) then
		if SellJunk.Add and SellJunk.Rem then
			ArkInventory.Output( "enabling SellJunk support" )
			ArkInventory.MySecureHook( SellJunk, "Add", ArkInventory.ItemCacheClear )
			ArkInventory.MySecureHook( SellJunk, "Rem", ArkInventory.ItemCacheClear )
		end
	end
	
	-- reagent restocker: http://wow.curse.com/downloads/wow-addons/details/reagent_restocker.aspx
	if IsAddOnLoaded( "ReagentRestocker" ) then
		if ReagentRestocker.addItemToSellingList and ReagentRestocker.deleteItem then
			ArkInventory.Output( "enabling ReagentRestocker support" )
			ArkInventory.MySecureHook( ReagentRestocker, "addItemToSellingList", ArkInventory.ItemCacheClear )
			ArkInventory.MySecureHook( ReagentRestocker, "deleteItem", ArkInventory.ItemCacheClear )
		end
	end
	
end

function ArkInventory.OnEnable( )

	-- Called when the addon is enabled
	
	--ArkInventory.Output( "OnEnable" )
	
	ArkInventory.ConvertOldOptions( )
	
	ArkInventory.PlayerInfoSet( )
	
	ArkInventory.CategoryGenerate( )
	
	ArkInventory.BlizzardAPIHooks( )

	-- tag all locations as changed
	ArkInventory.LocationSetValue( nil, "changed", true )
	
	-- tag all locations as needing resorting/recategorisation
	ArkInventory.LocationSetValue( nil, "resort", true )
	
	-- init location player_id
	ArkInventory.LocationSetValue( nil, "player_id", ArkInventory.Global.Me.info.player_id )
	
	-- register events
	
	ArkInventory:RegisterMessage( "LISTEN_STORAGE_EVENT" )
	
	ArkInventory:RegisterEvent( "PLAYER_ENTERING_WORLD", "LISTEN_PLAYER_ENTER" ) -- not really needed but seems to fix a bug where ace doesnt seem to init again
	ArkInventory:RegisterEvent( "PLAYER_LEAVING_WORLD", "LISTEN_PLAYER_LEAVE" ) --when the player logs out or the UI is reloaded.
	ArkInventory:RegisterEvent( "PLAYER_MONEY", "LISTEN_PLAYER_MONEY" )
	
	ArkInventory:RegisterEvent( "SKILL_LINES_CHANGED", "LISTEN_PLAYER_SKILLS" ) -- triggered when you gain or lose a skill, skillup, collapse/expand a skill header
	
	ArkInventory:RegisterEvent( "PLAYER_REGEN_DISABLED", "LISTEN_COMBAT_ENTER" ) -- player about to enter combat
	ArkInventory:RegisterEvent( "PLAYER_REGEN_ENABLED", "LISTEN_COMBAT_LEAVE" ) -- player left combat
	
	local bucket1 = ArkInventory.db.global.option.bucket[ArkInventory.Const.Location.Bag] or 0.5
	
	ArkInventory:RegisterBucketMessage( "LISTEN_BAG_UPDATE_BUCKET", bucket1 )
	ArkInventory:RegisterEvent( "BAG_UPDATE", "LISTEN_BAG_UPDATE" )
	ArkInventory:RegisterEvent( "ITEM_LOCK_CHANGED", "LISTEN_BAG_LOCK" )
	ArkInventory:RegisterBucketMessage( "LISTEN_BAG_UPDATE_COOLDOWN_BUCKET", bucket1 )
	ArkInventory:RegisterEvent( "BAG_UPDATE_COOLDOWN", "LISTEN_BAG_UPDATE_COOLDOWN" )
	
	ArkInventory:RegisterBucketMessage( "LISTEN_CHANGER_UPDATE_BUCKET", 1 )
	
	ArkInventory:RegisterEvent( "BANKFRAME_OPENED", "LISTEN_BANK_ENTER" )
	ArkInventory:RegisterEvent( "BANKFRAME_CLOSED", "LISTEN_BANK_LEAVE" )
	ArkInventory:RegisterEvent( "PLAYERBANKSLOTS_CHANGED", "LISTEN_BANK_UPDATE" ) -- a bag_update event for the bank (-1)
	ArkInventory:RegisterEvent( "PLAYERBANKBAGSLOTS_CHANGED", "LISTEN_BANK_SLOT" ) -- triggered when you purchase a new bank bag slot
	
	ArkInventory:RegisterEvent( "GUILDBANKFRAME_OPENED", "LISTEN_VAULT_ENTER" )
	ArkInventory:RegisterEvent( "GUILDBANKFRAME_CLOSED", "LISTEN_VAULT_LEAVE" )
	ArkInventory:RegisterBucketMessage( "LISTEN_VAULT_UPDATE_BUCKET", ArkInventory.db.global.option.bucket[ArkInventory.Const.Location.Vault] or 1.5 )
	ArkInventory:RegisterEvent( "GUILDBANKBAGSLOTS_CHANGED", "LISTEN_VAULT_UPDATE" )
	ArkInventory:RegisterEvent( "GUILDBANK_ITEM_LOCK_CHANGED", "LISTEN_VAULT_LOCK" )
	ArkInventory:RegisterEvent( "GUILDBANK_UPDATE_MONEY", "LISTEN_VAULT_MONEY" )
	ArkInventory:RegisterEvent( "GUILDBANK_UPDATE_TABS", "LISTEN_VAULT_TABS" )
	ArkInventory:RegisterEvent( "GUILDBANKLOG_UPDATE", "LISTEN_VAULT_LOG" )
	ArkInventory:RegisterEvent( "GUILDBANK_UPDATE_TEXT", "LISTEN_VAULT_INFO" )
	
	ArkInventory:RegisterBucketMessage( "LISTEN_INVENTORY_CHANGE_BUCKET", bucket1 )
	ArkInventory:RegisterEvent( "UNIT_INVENTORY_CHANGED", "LISTEN_INVENTORY_CHANGE" )
	ArkInventory:RegisterEvent( "UPDATE_INVENTORY_DURABILITY", "LISTEN_UPDATE_INVENTORY_DURABILITY" )
	
	ArkInventory:RegisterEvent( "MAIL_SHOW", "LISTEN_MAIL_ENTER" )
	ArkInventory:RegisterEvent( "MAIL_CLOSED", "LISTEN_MAIL_LEAVE" )
	ArkInventory:RegisterBucketMessage( "LISTEN_MAIL_UPDATE_BUCKET", bucket1 )
	ArkInventory:RegisterEvent( "MAIL_INBOX_UPDATE", "LISTEN_MAIL_UPDATE" )
	
	ArkInventory:RegisterEvent( "TRADE_SHOW", "LISTEN_TRADE_ENTER" )
	ArkInventory:RegisterEvent( "TRADE_CLOSED", "LISTEN_TRADE_LEAVE" )
	
	ArkInventory:RegisterEvent( "AUCTION_HOUSE_SHOW", "LISTEN_AUCTION_ENTER" )
	ArkInventory:RegisterEvent( "AUCTION_HOUSE_CLOSED", "LISTEN_AUCTION_LEAVE" )
	
	ArkInventory:RegisterEvent( "MERCHANT_SHOW", "LISTEN_MERCHANT_ENTER" )
	ArkInventory:RegisterEvent( "MERCHANT_CLOSED", "LISTEN_MERCHANT_LEAVE" )
	
	ArkInventory:RegisterEvent( "COMPANION_LEARNED", "LISTEN_COMPANION_UPDATE" )
	
	ArkInventory:RegisterEvent( "EQUIPMENT_SETS_CHANGED", "LISTEN_EQUIPMENT_SETS_CHANGED" )
	
	ArkInventory:RegisterEvent( "KNOWN_CURRENCY_TYPES_UPDATE", "LISTEN_CURRENCY_UPDATE" )
	ArkInventory:RegisterEvent( "CURRENCY_DISPLAY_UPDATE", "LISTEN_CURRENCY_UPDATE" )
	
	ArkInventory:RegisterBucketMessage( "LISTEN_QUEST_UPDATE_BUCKET", 3 ) -- update quest item glows.  not super urgent just get them there eventually
	ArkInventory:RegisterEvent( "QUEST_ACCEPTED", "LISTEN_QUEST_UPDATE" )
	ArkInventory:RegisterEvent( "UNIT_QUEST_LOG_CHANGED", "LISTEN_QUEST_UPDATE" )
	
	
	ArkInventory.db.RegisterCallback( ArkInventory, "OnProfileChanged", "OnProfileChanged" )
	ArkInventory.db.RegisterCallback( ArkInventory, "OnProfileCopied", "OnProfileChanged" )
	ArkInventory.db.RegisterCallback( ArkInventory, "OnProfileReset", "OnProfileChanged" )
	--ArkInventory.db.RegisterCallback( ArkInventory, "OnProfileDeleted", "OnProfileChanged" )
	--ArkInventory.db.RegisterCallback( ArkInventory, "OnDatabaseReset", "OnProfileChanged" )
	
	ArkInventory.ScanTradeskill( )
	ArkInventory.ScanLocation( )
	
	ArkInventory.LDB.Money:Update( )
	ArkInventory.LDB.Bags:Update( )
	ArkInventory.LDB.Ammo:Update( )
	ArkInventory.LDB.Currency:Update( )
	ArkInventory.LDB.Pets:Update( )
	ArkInventory.LDB.Mounts:Update( )
	
	ArkInventory.Output( string.format( "%s %s", ArkInventory.Global.Version, ArkInventory.Localise["ENABLED"] ) )
	
end

function ArkInventory.OnDisable( )

	--ArkInventory.Frame_Main_Hide( )
	
	ArkInventory.BlizzardAPIHooks( true )
	
	ArkInventory.Output( string.format( "%s %s", ArkInventory.Global.Version, ArkInventory.Localise["DISABLED"] ) )
	
end

function ArkInventory.DatabaseReset( )

	-- /ai db reset confirm

	ArkInventory.Frame_Main_Hide( )

	ArkInventory.db:ResetDB( "profile" )
	
	ArkInventory.Output( GREEN_FONT_COLOR_CODE, ArkInventory.Localise["SLASH_DB_RESET_COMPLETE_TEXT"] )
	
	ArkInventory.CategoryGenerate( )
	ArkInventory.LocationSetValue( nil, "resort", true )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )

end

function ArkInventory.nilStringEmpty( arg )
	if arg == nil then arg = "" end
	return tostring( arg )
end

function ArkInventory.nilStringText( arg )
	if arg == nil then arg = "nil" end
	return tostring( arg )
end

--function ArkInventory.round( n, dp )
--	local m = 10 ^ ( dp or 0 )
--	return math.floor( n * m + 0.5 ) / m
--end

function ArkInventory.ClassColourRGB( class )

	if not class then
		return
	end
	
	local ct = nil
	
	if class == "GUILD" then
		ct = { r = 1, g = 0.5, b = 0.15 }
	else
		ct = ( CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] ) or RAID_CLASS_COLORS[class]
		-- change ct and you'll taint it
	end
	
	if not ct then
		return
	end
	
	local c = { r = ct.r <= 1 and ct.r >= 0 and ct.r or 0, g = ct.g <= 1 and ct.g >= 0 and ct.g or 0, b = ct.b <= 1 and ct.b >= 0 and ct.b or 0 }
	
	return c
	
end

function ArkInventory.ClassColourCode( class )

	local c = ArkInventory.ClassColourRGB( class )
	
	if not c then
		return FONT_COLOR_CODE_CLOSE
	end
	
	return string.format( "|cff%02x%02x%02x", c.r * 255, c.g * 255, c.b * 255 )

end
	
function ArkInventory.ColourRGBtoCode( r, g, b )

	if not r or not g or not b then
		return FONT_COLOR_CODE_CLOSE
	end
	
	local r = r <= 1 and r >= 0 and r or 0
	local g = g <= 1 and g >= 0 and g or 0
	local b = b <= 1 and b >= 0 and b or 0
	
	return string.format( "|cff%02x%02x%02x", r * 255, g * 255, b * 255 )

end

function ArkInventory.ColourCodetoRGB( c )

	if not c then
		return 1, 1, 1
	end
	
	local a, r, g, b = strmatch( c, "|c(%x%x)(%x%x)(%x%x)(%x%x)" )
	
	a = tonumber( a ) / 255
	r = tonumber( r ) / 255
	g = tonumber( g ) / 255
	b = tonumber( b ) / 255
	
	return r, g, b, a

end

function ArkInventory.OutputSerialize( d )
	if d == nil then
		return "nil"
	elseif type( d ) == "number" then
		return tostring( d )
	elseif type( d ) == "string" then
		--return string.format( "%q", d )
		return d
	elseif type( d ) == "boolean" then
		if d then
			return "true"
		else
			return "false"
		end
	elseif type( d ) == "table" then
		local tmp = { }
		for k, v in pairs( d ) do
			table.insert( tmp, "[" .. ArkInventory.OutputSerialize( k ) .. "]=" .. ArkInventory.OutputSerialize( v ) )
		end
		return "{ " .. table.concat( tmp, ", " ) .. " }"
	else
		return "**" .. type( d ) or ArkInventory.Localise["UNKNOWN"] .. "**"
	end
end

local ArkInventory_TempOutputTable = { }

function ArkInventory.Output( ... )

	if not DEFAULT_CHAT_FRAME then
		return
	end
	
	table.wipe( ArkInventory_TempOutputTable )
	
	local n = select( '#', ... )
	for i = 1, n do
		local v = select( i, ... )
		table.insert( ArkInventory_TempOutputTable, ArkInventory.OutputSerialize( v ) )
	end
	
	ArkInventory:Print( table.concat( ArkInventory_TempOutputTable ) )
	
end

function ArkInventory.OutputDebug( ... )
	if ArkInventory.Const.Debug then
		ArkInventory.Output( "|cffffff9aDEBUG> ", ... )
	end
end

function ArkInventory.OutputWarning( ... )
	ArkInventory.Output( "|cfffa8000WARNING> ", ... )
end

function ArkInventory.OutputError( ... )
	ArkInventory.Output( RED_FONT_COLOR_CODE, "ERROR> ", ... )
end

function ArkInventory.OutputDebugModeSet( value )
	
	if ArkInventory.Const.Debug ~= value then
		
		local state = ArkInventory.Localise["ENABLED"]
		if not value then
			state = ArkInventory.Localise["DISABLED"]
		end
		
		ArkInventory.Const.Debug = value
		
		ArkInventory.Output( "debug mode is now ", state )
		
	end
	
end

function ArkInventory.PT_ItemInSets( item, setnames )

	if not item or not setnames then return false end

	for setname in string.gmatch( setnames, "[^,]+" ) do
		
		local r = ArkInventory.Lib.PeriodicTable:ItemInSet( item, strtrim( setname ) )
		if r then
			return true
		end
		
	end

	return false
	
end

function ArkInventory.LocationPlayerInfoGet( loc_id )

	if loc_id == nil then return end
	
	if ArkInventory.Global.Location[loc_id].player_id == nil then
		ArkInventory.Global.Location[loc_id].player_id = ArkInventory.Global.Me.info.player_id
	end

	--ArkInventory.Output( "LocationPlayerInfoGet( ", loc_id, " ) player id=[", ArkInventory.Global.Location[loc_id].player_id, "]" )
	local cp = ArkInventory.PlayerInfoGet( ArkInventory.Global.Location[loc_id].player_id )
	
	if cp == nil then
		ArkInventory.Output( "invalid player id (", player_id, ") at location (", loc_id, ")" )
		assert( false, "code error" )
	end
	
	if loc_id == ArkInventory.Const.Location.Vault then
	
		local guild_id = cp.info.guild_id
		if guild_id then
			--ArkInventory.Output( "shift to guild (", guild_id, ")" )
			cp = ArkInventory.PlayerInfoGet( guild_id )

			if cp == nil then
				ArkInventory.Output( "player id (", player_id, ") has an invalid guild id (", guild_id, ") at location (", loc_id, ")" )
				assert( false, "code error" )
			end
		end
		
	end
	
	return cp
	
end

function ArkInventory.OnProfileChanged( )

    -- this is called every time your profile changes
	
	ArkInventory.Lib.DewDrop:Close( )
	ArkInventory.Frame_Main_Hide( )
	ArkInventory.Frame_Rules_Hide( )

	ArkInventory.ConvertOldOptions( )
	ArkInventory.ItemCacheClear( )
	ArkInventory.PlayerInfoSet( )
	
	ArkInventory.ItemCategoryClear( )
	
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Init )

end

function ArkInventory.ObjectLockChanged( loc_id, bag_id, slot_id )

	if slot_id == nil then
		
		ArkInventory.Frame_Changer_Secondary_Update_Lock( loc_id, bag_id )
		
	else
		
		local framename = ArkInventory.ContainerItemNameGet( loc_id, bag_id, slot_id )
		if framename then
			local frame = _G[framename]
			ArkInventory.Frame_Item_Update_Lock( frame )
		end
		
	end
	
end

function ArkInventory.ItemSortKeyClear( loc_id )

	-- clear sort keys
	
	local Layout = ArkInventory.Global.Location[loc_id].Layout
	
	if not Layout.bar then return end
	
	for _, bar in pairs( Layout.bar ) do
		for _, item in pairs( bar.item ) do
			item.sortkey = nil
			item.cat = nil
		end
	end

end

function ArkInventory.ItemSortKeyGenerate( i, bar_id )

	if not i then return nil end
	
	local sid = ArkInventory.LocationOptionGet( i.loc_id, { "sort", "default" } ) or 9999
	
	if bar_id then
		sid = ArkInventory.LocationOptionGet( i.loc_id, { "bar", "data", bar_id, "sortorder" } ) or sid
	end
	
	local sorting = ArkInventory.db.global.option.sort.data[sid]
	
	local s = { }
	local sx = ""

	s["!bagslot"] = string.format( "%04i %04i", i.bag_id, i.slot_id )

	if sorting.used and not sorting.bagslot then
		
		local t
		local class, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11 = ArkInventory.ObjectInfo( i.h )
		
		-- slot type (system)
		t = 0
		if not i.h then
			t = ArkInventory.BagType( i.bag_id )
		end
		s["!slottype"] = string.format( "%04i", t )


		-- item count (system)
		s["!count"] = string.format( "%04i", i.count )

	
		-- item name
		t = "!"
		if i.h and sorting.active.name then
			
			t = v2 or "!"
			
			if sorting.reversed then
				t = ArkInventory.ReverseName( t )
			end
			
		end
		s["name"] = t


		-- item quality
		t = 0
		if i.q and sorting.active.quality then
			t = i.q
		end
		s["quality"] = string.format( "%02i", t )
		

		-- location
		t = "!"
		if i.h and class == "item" and sorting.active.location then
			
			if not v10 or v10 == "" then
				t = "!"
			else
				t = _G[v10]
			end
			
		end
		s["location"] = t
		
		
		-- item type / subtype
		local item_type = "!"
		local item_subtype = "!"
		
		if i.h and class == "item" and sorting.active.itemtype then
			
			item_type = v7
			if not item_type or item_type == "" then
				item_type = "!"
			end
			
			item_subtype = v8
			if not item_subtype or item_subtype == "" then
				item_subtype = "!"
			end
			
		end
		s["itemtype"] = string.format( "%s %s", item_type, item_subtype )

		
		-- item (use) level
		t = 0
		if i.h and sorting.active.itemuselevel then
			t = v6
		end
		s["itemuselevel"] = string.format( "%04i", t or 0 )

		
		-- item (use) level
		t = 0
		if i.h and sorting.active.itemage then
			t = i.age
		end
		s["itemage"] = string.format( "%10i", t or 0 )
		
		
		-- item (stat) level
		t = 0
		if i.h and sorting.active.itemstatlevel then
			t = v5
		end
		s["itemstatlevel"] = string.format( "%04i", t or 0 )
		
		
		-- vendor price
		t = 0
		if i.h and sorting.active.vendorprice then
			t = v11 * ( i.count or 1 )
		end
		s["vendorprice"] = string.format( "%08i", t or 0 )
		
		
		-- category
		local cat_type = 0
		local cat_code = 0
		local cat_order = 0
		
		if i.h and sorting.active.category then
		
			local cat_id = i.cat or ArkInventory.ItemCategoryGet( i )
			
			cat_type, cat_code = ArkInventory.CategoryCodeSplit( cat_id )

			if cat_type == ArkInventory.Const.Category.Type.Rule then
				local cat = ArkInventory.db.global.option.category[cat_type].data[cat_code]
				if cat.used then
					cat_order = cat.order
				end
			end
			
		end
		
		s["category"] = string.format( "%02i %04i %04i", cat_type, cat_order, cat_code )
		
		
		-- build key
		for k, v in ipairs( sorting.order ) do
			if s[v] then
				sx = string.format( "%s %s", sx, s[v] )
			end
		end
		
		sx = string.format( "%s%s", sx, s["!slottype"] )
		sx = string.format( "%s%s", sx, s["!count"] )
		sx = string.format( "%s%s", sx, s["!bagslot"] )
		
	else
		
		sx = s["!bagslot"]
		
	end
	
	return sx
	
end

function ArkInventory.SortKeyMoveDown( id, s )

	local p = false
	local t = ArkInventory.db.global.option.sort.data[id].order
	
	for k, v in ipairs( t ) do
		if s == v then
			p = k
			break
		end
	end

	if not p then
		return
	end
	
	if not t[p+1] then
		-- already at the bottom
		return
	end
	
	local x, y = t[p + 1], t[p]
	t[p], t[p + 1] = x, y
	
end

function ArkInventory.SortKeyMoveUp( id, s )

	local p = false
	local t = ArkInventory.db.global.option.sort.data[id].order
	
	for k, v in ipairs( t ) do
		if s == v then
			p = k
			break
		end
	end

	if not p or p == 1 then
		return
	end
	
	local x, y = t[p - 1], t[p]
	t[p], t[p - 1] = x, y
	
end

function ArkInventory.SortKeyCheck( )
	
	for sid, data in pairs( ArkInventory.db.global.option.sort.data ) do
		
		if data.used then
			
			-- add mising keys
			for s in pairs( ArkInventory.Const.SortKeys ) do
				
				local ok = false
				
				for _, v in ipairs( data.order ) do
				
					if s == v then
						ok = true
						break
					end
				
				end
					
				if not ok then
					tinsert( data.order, s )
				end
				
			end
			
			-- remove old keys from order
			for k, v in ipairs( data.order ) do
				if not ArkInventory.Const.SortKeys[v] then
					tremove( data.order, k )
				end
			end
			
			-- check active table
			if not data.active or type( data.active ) ~= "table" then
				data.active = { }
			end
				
			-- remove old keys from active table
			for k in pairs( data.active ) do
				if not ArkInventory.Const.SortKeys[k] then
					data.active[k] = nil
				end
			end
			
		else
			
			--ArkInventory.Table.Clean( data )
			
		end
		
	end
		
end

function ArkInventory.SortKeyCustomAdd( name )
	
	local v = ArkInventory.db.global.option.sort
	
	local n = ArkInventory.CategoryGetNext( v )

	if n == -1 then
		ArkInventory.OutputError( "sort method limit reached" )
		return
	end
	
	if n == -2 then
		ArkInventory.OutputError( "your data was recently upgraded, a ui reload is required before you can add a sort method" )
		return
	end
	
	v.data[v.next] = {
		used = true,
		name = strtrim( name ),
		bagslot = false,
		ascending = true,
		active = { },
		order = { },
	}
	
	ArkInventory.SortKeyCheck( )
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "Added sortkey: ", name, " at ", ArkInventory.db.global.option.sort.next )
	ArkInventory.ConfigInternalSorting( )
	
end

function ArkInventory.SortKeyCustomDelete( id, confirm )
	
	if confirm == "DELETE" then
		
		ArkInventory.db.global.option.sort.data[id].used = false
		
		ArkInventory.ConfigInternalSorting( )
		ArkInventory.Lib.DewDrop:Close( )
		
	else
		
		ArkInventory.OutputError( "Delete sort failed, confirmation not valid" )
		
	end
	
end


function ArkInventory.NewItemIndicator( loc_id )
--[[
	c = _G[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Container.Name]
	if c and c:IsVisible( ) then
	
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		for _, bag_id in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
			for slot_id in pairs( cp.location[loc_id].bag[bag_id].slot ) do
				s = _G[c:GetName( ) .. "Bag" .. bag_id .. "Item" .. slot_id]
				if s and s:IsVisible( ) then
					ArkInventory.Frame_Item_Update_NewIndicator( s )
				end
			end
			
		end
		
	end
]]--
end

function ArkInventory.NewItemReset( loc_id )
--[[
	-- reset new item text
	
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
	for bag_id, bag in pairs( cp.location[loc_id].bag ) do
		for slot_id, slot in pairs( bag.slot ) do
			slot.new = ArkInventory.Const.Slot.New.No --~~~~ check this still works
		end
	end
]]--
end

function ArkInventory.LocationSetValue( l, k, v )
	for loc_id in pairs( ArkInventory.Global.Location ) do
		if l == nil or l == loc_id then
			if ArkInventory.Global.Location[loc_id] then
				ArkInventory.Global.Location[loc_id][k] = v
			end
		end
	end
end


function ArkInventory.CategoryBarGet( loc_id, cat_id )
	
	local cat_def = ArkInventory.CategoryGetSystemID( "SYSTEM_DEFAULT" )
	
	if cat_id == nil then
		cat_id = cat_def
	end
	
	local bar = ArkInventory.LocationOptionGet( loc_id, { "category", cat_id } )
		
	-- if it's the default category and the default is not on a bar then put it on bar 1
	if bar == nil and cat_id == cat_def then
		bar = 1
	end
	
	return bar
	
end

function ArkInventory.CategoryLocationSet( loc_id, cat_id, bar_id )

	assert( cat_id ~= nil , "category is nil" )

	local cat_def = ArkInventory.CategoryGetSystemID( "SYSTEM_DEFAULT" )
	
	if cat_id ~= cat_def or bar_id ~= nil then
		ArkInventory.LocationOptionSet( loc_id, { "category", cat_id }, bar_id )
	end
	
end

function ArkInventory.CategoryLocationGet( loc_id, cat_id )
	
	-- maps category id's to the bars they are assigned to
	
	if cat_id == nil then
		cat_id = ArkInventory.CategoryGetSystemID( "SYSTEM_UNKNOWN" )
	end	
	
	local bar = ArkInventory.CategoryBarGet( loc_id, cat_id )
	--ArkInventory.Output( "loc=[", loc_id, "], cat=[", cat_id, "], bar=[", bar, "]" )
	
	if not bar then
		-- if this category hasn't been assigned to a bar then return the bar that DEFAULT is using
		local cat_def = ArkInventory.CategoryGetSystemID( "SYSTEM_DEFAULT" )
		return ArkInventory.CategoryBarGet( loc_id, cat_def ), true
	else
		return bar, false
	end
	
end

function ArkInventory.CategoryHiddenCheck( loc_id, cat_id )
	
	-- hidden categories have a negative bar number
	
	local bar = ArkInventory.CategoryBarGet( loc_id, cat_id )
	
	if bar ~= nil and bar < 0 then
		return true
	else
		return false
	end

end

function ArkInventory.CategoryHiddenToggle( loc_id, cat_id )
	ArkInventory.CategoryLocationSet( loc_id, cat_id, 0 - ArkInventory.CategoryLocationGet( loc_id, cat_id ) )
end

function ArkInventory.CategoryGenerate( )

	local categories = {
		["SYSTEM"] = ArkInventory.Const.Category.Code.System,
		["CONSUMABLE"] = ArkInventory.Const.Category.Code.Consumable,
		["TRADE_GOODS"] = ArkInventory.Const.Category.Code.Trade,
		["SKILL"] = ArkInventory.Const.Category.Code.Skill,
		["CLASS"] = ArkInventory.Const.Category.Code.Class,
		["EMPTY"] = ArkInventory.Const.Category.Code.Empty,
		["OTHER"] = ArkInventory.Const.Category.Code.Other,
		["RULE"] = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data,
		["CUSTOM"] = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Custom].data,
	}
	
	ArkInventory.Global.Category = { }

	for tn, d in pairs( categories ) do
	
		for k, v in pairs( d ) do
			
			--ArkInventory.Output( k, " - ", v )
			
			local system, order, name, cat_id, cat_type, cat_code
			
			if tn == "RULE" then
				
				if v.used then
					
					cat_type = ArkInventory.Const.Category.Type.Rule
					cat_code = k
					
					system = nil
					order = ( v.order or 99999 ) + ( k / 10000 )
					name = string.format( "%s. %s", k, v.name )
					
				end
				
			elseif tn == "CUSTOM" then
				
				if v.used then
					
					cat_type = ArkInventory.Const.Category.Type.Custom
					cat_code = k
					
					system = nil
					order = 0
					name = v.name
				
				end
				
			else
			
				cat_type = ArkInventory.Const.Category.Type.System
				cat_code = k
				
				system = string.upper( v.id )
				order = 0
				name = v.text or system
				
			end
			
			if name then
				
				cat_id = ArkInventory.CategoryCodeJoin( cat_type, cat_code )
				
				assert( not ArkInventory.Global.Category[cat_id], string.format( "duplicate category: %s [%s] ", tn, cat_id ) )
				
				ArkInventory.Global.Category[cat_id] = {
					["id"] = cat_id,
					["system"] = system,
					["name"] = name or string.format( "%s %s %s", tn, k, "<no name>"  ),
					["fullname"] = string.format( "%s > %s", ArkInventory.Localise["CATEGORY_" .. tn], name ),
					["order"] = order,
					["type_code"] = tn,
					["type"] = ArkInventory.Localise["CATEGORY_" .. tn],
				}
			
			end
			
		end
		
	end

end

function ArkInventory.CategoryCodeSplit( id )
	local cat_type, cat_code = strmatch( id, "(%d+)!(%d+)" )
	return tonumber( cat_type ), tonumber( cat_code )
end

function ArkInventory.CategoryCodeJoin( cat_type, cat_code )
	return string.format( "%i!%i", cat_type, cat_code )
end

function ArkInventory.CategoryGetNext( v )
	
	if not v.next then
		v.next = 1
	else
		if v.next < 1 then
			v.next = 1
		end
	end
	
	local c = 0
	
	while true do
		
		v.next = v.next + 1
		
		if v.next > ArkInventory.Const.Category.Max then
			c = c + 1
			v.next = 1
		end
		
		if c > 1 then
			return -1
		end
		
		if not v.data[v.next] then
			return -2
		end
		
		if not v.data[v.next].used then
			return v.next
		end
		
	end
	
end

function ArkInventory.CategoryCustomAdd( name )
	
	local t = ArkInventory.Const.Category.Type.Custom
	local v = ArkInventory.db.global.option.category[t]
	
	local n = ArkInventory.CategoryGetNext( v )
	
	if n == -1 then
		ArkInventory.OutputError( "custom categories limit reached" )
		return
	end
	
	if n == -2 then
		ArkInventory.OutputError( "your data was recently upgraded, a ui reload is required before you can add a custom category" )
		return
	end
	
	v.data[v.next].used = true
	v.data[v.next].name = strtrim( name )
	
	ArkInventory.CategoryGenerate( )
	
end

function ArkInventory.CategoryCustomDelete( id, confirm )
	
	if confirm == "DELETE" then
		
		ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Custom].data[id].used = false
		
		ArkInventory.CategoryGenerate( )
		ArkInventory.Lib.DewDrop:Close( )
		
	else
		ArkInventory.OutputError( "Delete category failed, confirmation not valid" )
	end
	
end

function ArkInventory.CategoryCustomRename( id, name )
	
	ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Custom].data[id].name = strtrim( name )
	
	ArkInventory.CategoryGenerate( )
	
end

function ArkInventory.CategoryCustomRestore( id )
	
	local cat = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Custom].data
	
	cat[id].used = true
	if cat[id].name == "" then
		cat[id].name = string.format( "custom %s (restored)", id )
	end
	
	ArkInventory.CategoryGenerate( )
	
end

function ArkInventory.CategoryBarHasEntries( loc_id, bar_id, cat_type )

	for _, cat in ArkInventory.spairs( ArkInventory.Global.Category ) do

		local t = cat.type_code
		local cat_bar, def_bar = ArkInventory.CategoryLocationGet( loc_id, cat.id )
		
		if abs( cat_bar ) == bar_id and not def_bar then
			
			if t == "RULE" and cat_type == t then
				local _, cat_code = ArkInventory.CategoryCodeSplit( cat.id )
				--ArkInventory.Output( "rule=[", cat_code, "], enabled=[", ArkInventory.db.profile.option.rule[cat_code], "]" )
				if not ArkInventory.db.profile.option.rule[cat_code] then
					t = "DO_NOT_USE" -- don't display disabled rules
				end
			end
			
			if cat_type == t then
				--ArkInventory.Output( "true" )
				return true
			end
		
		end
	
	end

	--ArkInventory.Output( "false" )
	
end


function ArkInventory.CategoryGetSystemID( cat_name )

	-- internal system category names only, if it doesnt exist you'll get the default instead

	--ArkInventory.Output( "search=[", cat_name, "]" )
	
	local cay_name = string.upper( cat_name )
	local cat_def
	
	for _, v in pairs( ArkInventory.Global.Category ) do
		
		--ArkInventory.Output( "checking=[", v.system, "]" )
		
		if cat_name == v.system then
			--ArkInventory.Output( "found=[", cat_name, " = ", v.name, "] = [", v.id, "]" )
			return v.id
			
		elseif v.system == "SYSTEM_DEFAULT" then
			--ArkInventory.Output( "default found=[", v.name, "] = [", v.id, "]" )
			cat_def = v.id
		end
		
	end
	
	--ArkInventory.Output( "not found=[", cat_name, "] = using default[", cat_def, "]" )
	return cat_def
	
end


function ArkInventory.ItemCategoryGetDefaultActual( i )

	-- local debuginfo = { ["m"]=gcinfo( ), ["t"]=GetTime( ) }

	-- pets
	if i.loc_id == ArkInventory.Const.Location.Pet then
		return ArkInventory.CategoryGetSystemID( "SYSTEM_PET" )
	end
	
	-- mounts
	if i.loc_id == ArkInventory.Const.Location.Mount then
		return ArkInventory.CategoryGetSystemID( "SKILL_RIDING" )
	end
	
	-- tokens
	if i.loc_id == ArkInventory.Const.Location.Token then
		return ArkInventory.CategoryGetSystemID( "SYSTEM_TOKEN" )
	end
	
	-- everything else
	local class, _, itemName, _, itemRarity, _, _, itemType, itemSubType, _, itemEquipLoc = ArkInventory.ObjectInfo( i.h )
	
	-- items only
	if class ~= "item" then
		return
	end
	
	local cp = ArkInventory.Global.Me
	
	--ArkInventory.Output( "bag[", i.bag_id, "], slot[", i.slot_id, "] = ", itemType )
	
	-- no item info
	if itemName == nil then
		return nil
	end
	
	-- trash
	if itemRarity == 0 then
		return ArkInventory.CategoryGetSystemID( "SYSTEM_TRASH" )
	end
	
	-- setup tooltip for scanning
	local bliz_id = ArkInventory.BagID_Blizzard( i.loc_id, i.bag_id )
	ArkInventory.TooltipSetItem( ArkInventory.Global.Tooltip.Scan, bliz_id, i.slot_id )

	-- quest items (via type)
	if itemType == ArkInventory.Localise["WOW_ITEM_TYPE_QUEST"] then
		return ArkInventory.CategoryGetSystemID( "SYSTEM_QUEST" )
	end

	-- projectiles
	if itemEquipLoc == "INVTYPE_AMMO" or itemType == ArkInventory.Localise["WOW_ITEM_TYPE_PROJECTILE"] then
	
		if itemSubType == ArkInventory.Localise["WOW_ITEM_TYPE_PROJECTILE_BULLET"] then
			return ArkInventory.CategoryGetSystemID( "SYSTEM_PROJECTILE_BULLET" )
		end
		
		if itemSubType == ArkInventory.Localise["WOW_ITEM_TYPE_PROJECTILE_ARROW"] then
			return ArkInventory.CategoryGetSystemID( "SYSTEM_PROJECTILE_ARROW" )
		end

		return ArkInventory.CategoryGetSystemID( "SYSTEM_PROJECTILE" )
		
	end
	
	-- bags / containers
	if itemEquipLoc == "INVTYPE_BAG" or ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_CONTAINER"] ) then
		return ArkInventory.CategoryGetSystemID( "SYSTEM_CONTAINER" )
	end

	-- equipment (armour, weapons, trinkets, tabards, etc, etc)
	if itemEquipLoc ~= "" then
		if i.sb then
			return ArkInventory.CategoryGetSystemID( "SYSTEM_EQUIPMENT_SOULBOUND" )
		else
			return ArkInventory.CategoryGetSystemID( "SYSTEM_EQUIPMENT" )
		end
	end

	-- soul shards
	if ArkInventory.ObjectStringDecodeItem( i.h ) == 6265 or ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_SOULSHARD"] ) then
		return ArkInventory.CategoryGetSystemID( "SYSTEM_SOULSHARD" )
	end

	-- keys
	if itemType == ArkInventory.Localise["WOW_ITEM_TYPE_KEY"] or ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_KEY"] ) then
		return ArkInventory.CategoryGetSystemID( "SYSTEM_KEY" )
	end
	
	-- glyphs
	if itemType == ArkInventory.Localise["WOW_ITEM_TYPE_GLYPH"] then
		return ArkInventory.CategoryGetSystemID( "SYSTEM_GLYPH" )
	end
	
	-- class requirement via tooltip
	local ctext = "^" .. string.gsub( ITEM_CLASSES_ALLOWED, "%%s", "(.+)", 1 )
	local _, _, req = ArkInventory.TooltipFind( ArkInventory.Global.Tooltip.Scan, ctext, false, true, true )
	if req then
		for w in pairs( RAID_CLASS_COLORS ) do
			local key = string.format( "WOW_CLASS_%s", w )
			if strfind( req, ArkInventory.Localise[key] or key ) then
				return ArkInventory.CategoryGetSystemID( "CLASS_" .. w )
			end
		end
	end
	
	-- gems
	if itemType == ArkInventory.Localise["WOW_ITEM_TYPE_GEM"] then
		return ArkInventory.CategoryGetSystemID( "SYSTEM_GEM" )
	end
	
	if itemType == ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE"] then
	
		if itemSubType == ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_FOOD_AND_DRINK"] then
		
			if ArkInventory.TooltipContains( ArkInventory.Global.Tooltip.Scan, ArkInventory.Localise["WOW_ITEM_TOOLTIP_FOOD"] ) then
				return ArkInventory.CategoryGetSystemID( "CONSUMABLE_FOOD" )
			end
			
			if ArkInventory.TooltipContains( ArkInventory.Global.Tooltip.Scan, ArkInventory.Localise["WOW_ITEM_TOOLTIP_DRINK"] ) then
				return ArkInventory.CategoryGetSystemID( "CONSUMABLE_DRINK" )
			end
			
			if ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_CONSUMABLE_FOOD"] ) then
				return ArkInventory.CategoryGetSystemID( "CONSUMABLE_FOOD" )
			end
			
			if ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_CONSUMABLE_DRINK"] ) then
				return ArkInventory.CategoryGetSystemID( "CONSUMABLE_DRINK" )
			end
		
			return ArkInventory.CategoryGetSystemID( "CONSUMABLE_FOOD_AND_DRINK" )
			
		end
		
		if itemSubType == ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_POTION"] then
			
			if ArkInventory.TooltipContains( ArkInventory.Global.Tooltip.Scan, ArkInventory.Localise["WOW_ITEM_TOOLTIP_POTION_HEAL"] ) or ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_POTION_HEAL"] ) then
				return ArkInventory.CategoryGetSystemID( "CONSUMABLE_POTION_HEAL" )
			end
			
			if ArkInventory.TooltipContains( ArkInventory.Global.Tooltip.Scan, ArkInventory.Localise["WOW_ITEM_TOOLTIP_POTION_MANA"] ) or ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_POTION_MANA"] ) then
				return ArkInventory.CategoryGetSystemID( "CONSUMABLE_POTION_MANA" )
			end
			
			return ArkInventory.CategoryGetSystemID( "CONSUMABLE_POTION" )
			
		end
		
		if itemSubType == ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_ELIXIR"] then
		
			if ArkInventory.TooltipContains( ArkInventory.Global.Tooltip.Scan, ArkInventory.Localise["WOW_ITEM_TOOLTIP_ELIXIR_BATTLE"] ) then
				return ArkInventory.CategoryGetSystemID( "CONSUMABLE_ELIXIR_BATTLE" )
			end
			
			if ArkInventory.TooltipContains( ArkInventory.Global.Tooltip.Scan, ArkInventory.Localise["WOW_ITEM_TOOLTIP_ELIXIR_GUARDIAN"] ) then
				return ArkInventory.CategoryGetSystemID( "CONSUMABLE_ELIXIR_GUARDIAN" )
			end
			
			return ArkInventory.CategoryGetSystemID( "CONSUMABLE_ELIXIR" )
			
		end
		
		if itemSubType == ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_FLASK"] then
			return ArkInventory.CategoryGetSystemID( "CONSUMABLE_FLASK" )
		end
		
		if itemSubType == ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_BANDAGE"] then
			return ArkInventory.CategoryGetSystemID( "CONSUMABLE_BANDAGE" )
		end
		
		if itemSubType == ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE_SCROLL"] then
			return ArkInventory.CategoryGetSystemID( "CONSUMABLE_SCROLL" )
		end
		
	end

	if itemType == ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS"] then

		if itemSubType == ArkInventory.Localise["WOW_SKILL_ENCHANTING"] then
			return ArkInventory.CategoryGetSystemID( "SKILL_ENCHANTING" )
		end
		
		if itemSubType == ArkInventory.Localise["WOW_SKILL_JEWELCRAFTING"] then
			return ArkInventory.CategoryGetSystemID( "SKILL_JEWELCRAFTING" )
		end
		
		local t = "DEVICES,EXPLOSIVES,PARTS,HERB,CLOTH,ELEMENTAL,LEATHER,MEAT,METAL_AND_STONE,MATERIALS,ENCHANTMENT_ARMOR,ENCHANTMENT_WEAPON"
		
		for w in string.gmatch( t, "[^,]+" ) do
			local key = string.format( "WOW_ITEM_TYPE_TRADE_GOODS_%s", w )
			if itemSubType == ( ArkInventory.Localise[key] or key ) then
				return ArkInventory.CategoryGetSystemID( "TRADE_GOODS_" .. w )
			end
		end
		
	end

	if itemType == ArkInventory.Localise["WOW_ITEM_TYPE_RECIPE"] then
		return ArkInventory.CategoryGetSystemID( "SYSTEM_RECIPE" )
	end

	-- quest items (via tooltip)
	if ArkInventory.TooltipContains( ArkInventory.Global.Tooltip.Scan, ITEM_BIND_QUEST, false, true, true ) then
		return ArkInventory.CategoryGetSystemID( "SYSTEM_QUEST" )
	end

	-- skill requirement (via tooltip)
	-- ITEM_MIN_SKILL = "Requires %1$s (%2$d)"; -- Required skill rank to use the item
	local ctext = string.gsub( ITEM_MIN_SKILL, "1%$", "", 1 )
	local ctext = string.gsub( ctext, "2%$", "", 1 )
	local ctext = string.gsub( ctext, "%%s", "(.+)", 1 )
	local ctext = "^" .. string.gsub( ctext, "%(%%d%)", "%%(%%d+%%)", 1 )
	--ArkInventory.Output( ctext )
	--local _, _, req = ArkInventory.TooltipFind( ArkInventory.Global.Tooltip.Scan, ArkInventory.Localise["WOW_TOOLTIP_REQUIRES"], false, false, true )
	local _, _, req = ArkInventory.TooltipFind( ArkInventory.Global.Tooltip.Scan, ctext, false, true, true )
	if req then
		for w in string.gmatch( ArkInventory.Const.Skills, "[^,]+" ) do
			local key = string.format( "WOW_SKILL_%s", w )
			if strfind( req, ArkInventory.Localise[key] or key ) then
				return ArkInventory.CategoryGetSystemID( "SKILL_" .. w )
			end
		end
	end
	
	if itemType == ArkInventory.Localise["WOW_ITEM_TYPE_MISC"] then
	
		if itemSubType == ArkInventory.Localise["WOW_ITEM_TYPE_MISC_REAGENT"] then
			return ArkInventory.CategoryGetSystemID( "SYSTEM_REAGENT" )
		end
		
		if itemSubType == ArkInventory.Localise["WOW_ITEM_TYPE_MISC_PET"] or ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_VANITYPET"] ) then
			return ArkInventory.CategoryGetSystemID( "SYSTEM_PET" )
		end
		
		-- mounts
		if itemSubType == ArkInventory.Localise["WOW_ITEM_TYPE_MISC_MOUNT"] or ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_MOUNT"] ) then
			return ArkInventory.CategoryGetSystemID( "SKILL_RIDING" )
		end
		
	end


	-- class via periodictable (check this characters class first)
	local key = string.format( "PT_CLASS_%s", cp.info.class )
	if ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise[key] or key ) then
		return ArkInventory.CategoryGetSystemID( "CLASS_" .. cp.info.class )
	end

	-- class via periodictable (check all classes)
	for w in pairs( RAID_CLASS_COLORS ) do
		local key = string.format( "PT_CLASS_%s", w )
		if ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise[key] or key ) then
			return ArkInventory.CategoryGetSystemID( "CLASS_" .. w )
		end
	end
	
	
	-- skill requirement - cycle through the users skills and allocate items to those profressions first
	if cp.info.skills then
		for k, w in ipairs( cp.info.skills ) do
			local key = string.format( "PT_SKILL_%s", w )
			if ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise[key] or key ) then
				return ArkInventory.CategoryGetSystemID( "SKILL_" .. w )
			end
		end
	end
	
	-- skill requirement - do the rest
	for w in string.gmatch( ArkInventory.Const.Skills, "[^,]+" ) do
		local key = string.format( "PT_SKILL_%s", w )
		if ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise[key] or key ) then
			return ArkInventory.CategoryGetSystemID( "SKILL_" .. w )
		end
	end
	
	-- reputation hand-ins
	if ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_REPUTATION"] ) then
		return ArkInventory.CategoryGetSystemID( "SYSTEM_REPUTATION" )
	end

	-- quest items (via PT)
	if ArkInventory.PT_ItemInSets( i.h, ArkInventory.Localise["PT_CATEGORY_QUEST"] ) then
		return ArkInventory.CategoryGetSystemID( "SYSTEM_QUEST" )
	end

	if itemType == ArkInventory.Localise["WOW_ITEM_TYPE_TRADE_GOODS"] then
		return ArkInventory.CategoryGetSystemID( "TRADE_GOODS" )
	end

	if itemType == ArkInventory.Localise["WOW_ITEM_TYPE_CONSUMABLE"] then
		return ArkInventory.CategoryGetSystemID( "CONSUMABLE" )
	end

	-- soulbound items
	if i.sb then
		return ArkInventory.CategoryGetSystemID( "SYSTEM_SOULBOUND" )
	end

	if itemType == ArkInventory.Localise["WOW_ITEM_TYPE_MISC"] then
		return ArkInventory.CategoryGetSystemID( "SYSTEM_MISC" )
	end

	return ArkInventory.CategoryGetSystemID( "SYSTEM_DEFAULT" )
	
end

function ArkInventory.ItemCategoryGetDefaultEmpty( loc_id, bag_id )

	local clump = ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "clump" } )
	
	local bliz_id = ArkInventory.BagID_Blizzard( loc_id, bag_id )
	local bt = ArkInventory.BagType( bliz_id )
	
	--ArkInventory.Output( "loc[", loc_id, "] bag[", bag_id, " / ", bliz_id, "] type[", bt, "]" )
	
	if bt == ArkInventory.Const.Slot.Type.Bag then
		if clump then
			return ArkInventory.CategoryGetSystemID( "EMPTY" )
		else
			return ArkInventory.CategoryGetSystemID( "EMPTY_BAG" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Enchanting then
		if clump then
			return ArkInventory.CategoryGetSystemID( "SKILL_ENCHANTING" )
		else
			return ArkInventory.CategoryGetSystemID( "EMPTY_ENCHANTING" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Engineering then
		if clump then
			return ArkInventory.CategoryGetSystemID( "SKILL_ENGINEERING" )
		else
			return ArkInventory.CategoryGetSystemID( "EMPTY_ENGINEERING" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Gem then
		if clump then
			return ArkInventory.CategoryGetSystemID( "SKILL_JEWELCRAFTING" )
		else
			return ArkInventory.CategoryGetSystemID( "EMPTY_GEM" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Herb then
		if clump then
			return ArkInventory.CategoryGetSystemID( "SKILL_HERBALISM" )
		else
			return ArkInventory.CategoryGetSystemID( "EMPTY_HERB" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Inscription then
		if clump then
			return ArkInventory.CategoryGetSystemID( "SKILL_INSCRIPTION" )
		else
			return ArkInventory.CategoryGetSystemID( "EMPTY_INSCRIPTION" )
		end
	end

	if bt == ArkInventory.Const.Slot.Type.Key then
		if clump then
			return ArkInventory.CategoryGetSystemID( "SYSTEM_KEY" )
		else
			return ArkInventory.CategoryGetSystemID( "EMPTY_KEY" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Leatherworking then
		if clump then
			return ArkInventory.CategoryGetSystemID( "SKILL_LEATHERWORKING" )
		else
			return ArkInventory.CategoryGetSystemID( "EMPTY_LEATHERWORKING" )
		end
	end

	if bt == ArkInventory.Const.Slot.Type.Mining then
		if clump then
			return ArkInventory.CategoryGetSystemID( "SKILL_MINING" )
		else
			return ArkInventory.CategoryGetSystemID( "EMPTY_MINING" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Arrow then
		if clump then
			return ArkInventory.CategoryGetSystemID( "SYSTEM_PROJECTILE_ARROW" )
		else
			return ArkInventory.CategoryGetSystemID( "EMPTY_PROJECTILE_ARROW" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Bullet then
		if clump then
			return ArkInventory.CategoryGetSystemID( "SYSTEM_PROJECTILE_BULLET" )
		else
			return ArkInventory.CategoryGetSystemID( "EMPTY_PROJECTILE_BULLET" )
		end
	end
	
	if bt == ArkInventory.Const.Slot.Type.Soulshard then
		if clump then
			return ArkInventory.CategoryGetSystemID( "SYSTEM_SOULSHARD" )
		else
			return ArkInventory.CategoryGetSystemID( "EMPTY_SOULSHARD" )
		end
	end
	
	if clump then
		return ArkInventory.CategoryGetSystemID( "EMPTY" )
	else
		return ArkInventory.CategoryGetSystemID( "EMPTY_UNKNOWN" )
	end
	
	ArkInventory.Output( "code failure, should never get here" )
	
end

function ArkInventory.ItemCategoryGetDefault( i )
	
	-- items cache id
	local id = ArkInventory.ObjectIDCacheCategory( i )
	
	-- if the value has not been cached yet then get it and cache it
	if not ArkInventory.Global.Cache.Default[id] then
		if i.h then
			ArkInventory.Global.Cache.Default[id] = ArkInventory.ItemCategoryGetDefaultActual( i )
		else
			ArkInventory.Global.Cache.Default[id] = ArkInventory.ItemCategoryGetDefaultEmpty( i.loc_id, i.bag_id )
		end
	end
	
	return ArkInventory.Global.Cache.Default[id]
	
end


function ArkInventory.ItemCategoryGetRule( i, bt, bag_id, slot_id )

	-- local debuginfo = { ["m"]=gcinfo( ), ["t"]=GetTime( ) }

	-- ArkInventory.Output( "ItemCategoryGetRule( ) start" )
	
	-- check rules
	local t = ArkInventory.Const.Category.Type.Rule
	local r = ArkInventory.db.global.option.category[t].data
	for rid in ArkInventory.spairs( r, function(a,b) return ( r[a].order or 0 ) < ( r[b].order or 0 ) end ) do
		
		if r[rid].used then
			
			local a, em = ArkInventory.RuleAppliesToItem( rid, i )
	
			if em == nil then
			
				if a == true then
					local id = ArkInventory.CategoryCodeJoin( t, rid )
					return id
				end
			
			else
				
				ArkInventory.OutputWarning( em )
				ArkInventory.OutputWarning( string.format( ArkInventory.Localise["RULE_DAMAGED"], rid ) )
				
				ArkInventory.db.global.option.category[t].data[rid].damaged = true
				
			end
			
		end
		
	end
	
	-- ArkInventory.Output( "ItemCategoryGetRule( ) end", debuginfo )

end

function ArkInventory.ItemCategoryGetPrimary( i )
	
	i["cat"] = nil
	
	local id
	
	if i.h then -- only items can have a category, empty slots can oly be used by rules
		
		-- items category cache id
		id = ArkInventory.ObjectIDCacheCategory( i )
		
		-- manually assigned item to a category?
		if ArkInventory.db.profile.option.category[id] then
			i["cat"] = ArkInventory.db.profile.option.category[id]
			return
		end
		
	end
	
	-- items rule cache id
	id = ArkInventory.ObjectIDCacheRule( i )
	
	-- if the value has already been cached then use it
	if ArkInventory.Global.Cache.Rule[id] then
		i["cat"] = ArkInventory.Global.Cache.Rule[id]
		return
	end
	
	-- check for any rule that applies to the item
	local rs = ArkInventory.ItemCategoryGetRule( i )
	if rs then
		-- cache the result
		ArkInventory.Global.Cache.Rule[id] = rs
		i["cat"] = ArkInventory.Global.Cache.Rule[id]
		return
	end
	
end

function ArkInventory.ItemCategorySet( i, cat_id )

	-- set cat_id to nil to reset back to default
	
	local id = ArkInventory.ObjectIDCacheCategory( i )
	ArkInventory.db.profile.option.category[id] = cat_id
	
	--i["cat"] = cat_id
	ArkInventory.ItemCategoryClear( )
	
end

function ArkInventory.ItemCategoryGet( i )

	if not i.cat then
		ArkInventory.ItemCategoryGetPrimary( i )
	end
	
	local default = ArkInventory.ItemCategoryGetDefault( i )
	local unknown = ArkInventory.CategoryGetSystemID( "SYSTEM_UNKNOWN" )
	
	return i.cat or default or unknown, i.cat, default or unknown
	
end

function ArkInventory.ItemCategoryClear( player_id, loc_id, empty_only )

	-- clears the category for all items for all characters
	
	for p, pd in pairs( ArkInventory.db.realm.player.data ) do
		
		-- only process matching player id
		if ( not player_id ) or ( player_id == pd.info.player_id ) then
			
			for l, ld in pairs( pd.location ) do
				
				-- only process matching location
				if ( not loc_id ) or ( loc_id == l ) then
					
					for b, bd in pairs( ld.bag ) do
					
						for s, sd in pairs( bd.slot ) do
							
							-- only process empty slots
							if ( not empty_only ) or ( empty_only and sd.h == nil ) then
								sd["cat"] = nil
							end
							
						end
						
					end
					
				end
				
			end
			
		end
		
	end
	
end

function ArkInventory.ReverseName( n )

	if n and type( n ) == "string" then

		local s = { }

		for w in string.gmatch( n, "%S+" ) do
			tinsert( s, 1, w )
		end

		return table.concat( s, " " )
		
	end

end

function ArkInventory.ItemCacheClear( )

	-- clear all rule information
	ArkInventory.Table.Clean( ArkInventory.Global.Cache.Rule )
	--ArkInventory.Global.Cache.Rule = { }
	
	ArkInventory.Table.Clean( ArkInventory.Global.Cache.Default )
	--ArkInventory.Global.Cache.Default = { }
	
	ArkInventory.CategoryGenerate( ) --zzzzzzzz still need this?
	ArkInventory.LocationSetValue( nil, "resort", true )
	ArkInventory.ItemCategoryClear( )
	--ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventory.Frame_Main_DrawStatus( loc_id, level )

	if level == nil then
		level = ArkInventory.Const.Window.Draw.None
	end
		
	if ArkInventory.Global.Location[loc_id] and ArkInventory.Global.Location[loc_id].canView then
		if level < ArkInventory.Global.Location[loc_id].drawState then
			ArkInventory.Global.Location[loc_id].drawState = level
		end
	end
end

function ArkInventory.Frame_Main_Generate( location, drawstatus )
	
	for loc_id in pairs( ArkInventory.Global.Location ) do
		
		if not location or loc_id == location then
			ArkInventory.Frame_Main_DrawStatus( loc_id, drawstatus )
			ArkInventory.Frame_Main_DrawLocation( loc_id )
		end
	
	end
	
end

function ArkInventory.Frame_Main_DrawLocation( loc_id )
	local frame = ArkInventory.Frame_Main_Get( loc_id )
	ArkInventory.Frame_Main_Draw( frame )
end



function ArkInventory.PutItemInBank( )

	if CursorHasItem( ) then
		
		for x = 1, GetContainerNumSlots( BANK_CONTAINER ) do
			h = GetContainerItemLink( BANK_CONTAINER, x )
			if not h then
				if not PickupContainerItem( BANK_CONTAINER, x ) then
					ClearCursor( )
				end
				return
			end
		end
		
		UIErrorsFrame:AddMessage( ERR_BAG_FULL, 1.0, 0.1, 0.1, 1.0 )
		ClearCursor( )
		
	end
	
end

function ArkInventory.PutItemInGuildBank( tab_id )

	if CursorHasItem( ) then
		
		local loc_id = ArkInventory.Const.Location.Vault
		local _, _, _, canDeposit = GetGuildBankTabInfo( tab_id )

		if canDeposit then
		
			ArkInventory.Output( "PutItemInGuildBank( ", tab_id, " )" )
		
			local ctab = GetCurrentGuildBankTab( )
		
			if tab_id ~= ctab then
				SetCurrentGuildBankTab( tab_id )
				ArkInventory.QueryVault( tab_id )
			end

			for x = 1, MAX_GUILDBANK_SLOTS_PER_TAB do
				h = GetGuildBankItemLink( tab_id, x )
				if not h then
					if not PickupGuildBankItem( tab_id, x ) then --AutoStoreGuildBankItem
						ClearCursor( )
					end
					return
				end
			end
		
			UIErrorsFrame:AddMessage( ERR_BAG_FULL, 1.0, 0.1, 0.1, 1.0 )
			ClearCursor( )
			
		end
		
	end
	
end

function ArkInventory.SetItemButtonStock( frame, count, status )
	
	if not frame then
		return
	end
	
	local obj = _G[frame:GetName( ) .. "Stock"]
	if not obj then
		return
	end
	
	obj:SetText( "" )
	obj.numInStock = 0
	
	local loc_id = frame.ARK_Data.loc_id
	
	if ArkInventory.LocationOptionGet( loc_id, { "changer", "freespace", "show" } ) then
		
		if status then
			
			if status == ArkInventory.Const.Bag.Status.Purchase then
				obj:SetText( ArkInventory.Localise["STATUS_PURCHASE"] )
			elseif status == ArkInventory.Const.Bag.Status.Unknown then
				obj:SetText( ArkInventory.Localise["STATUS_NO_DATA"] )
			elseif status == ArkInventory.Const.Bag.Status.NoAccess then
				obj:SetText( ArkInventory.Localise["VAULT_TAB_ACCESS_NONE"] )
			end
			
		else
			
			if count > 0 then
				obj:SetText( count )
				obj.numInStock = count
			else
				obj:SetText( ArkInventory.Localise["STATUS_FULL"] )
			end
			
		end
		
		local colour = ArkInventory.LocationOptionGet( loc_id, { "changer", "freespace", "colour" } )
		obj:SetTextColor( colour.r, colour.g, colour.b )
		
		obj:Show( )
		
	else
		
		obj:Hide( )
		
	end
	
end

function ArkInventory.ValidFrame( frame, visible, db )

	if frame and frame.ARK_Data and frame.ARK_Data.loc_id then
		
		local res1 = true
		if db then
			local i = ArkInventory.Frame_Item_GetDB( frame )
			if i == nil then
				res1 = false
			end
		end
		
		local res2 = true
		if visible and not frame:IsVisible( ) then
			res2 = false
		end

		return res1 and res2
		
	end

	return false
	
end

function ArkInventory.Frame_Main_Get( loc_id )

	local framename = ArkInventory.Const.Frame.Main.Name .. loc_id
	local frame = _G[framename]
	assert( frame, "xml element '" .. framename .. "' could not be found" )
	
	return frame

end
	
function ArkInventory.Frame_Main_Scale( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id

	local old_scale = frame:GetScale( )
	local new_scale = ArkInventory.LocationOptionGet( loc_id, { "window", "scale" } )
	local rescale
	
	if old_scale ~= new_scale then
		--rescale = old_scale / new_scale
		frame:SetScale( new_scale )
	end

	ArkInventory.Frame_Main_Anchor_Set( loc_id, rescale )

end
	
function ArkInventory.Frame_Main_Scale_All( )
	for loc_id in ipairs( ArkInventory.Global.Location ) do
		frame = ArkInventory.Frame_Main_Get( loc_id )
		ArkInventory.Frame_Main_Scale( frame )
	end
end

function ArkInventory.Frame_Main_Offline( frame )
	
	local loc_id = frame.ARK_Data.loc_id
	
	--ArkInventory.Output( "loc_playerid=[", ArkInventory.Global.Location[loc_id].player_id, "] player_id=[", ArkInventory.Global.Me.info.player_id, "] guild_id=[", ArkInventory.Global.Me.info.guild_id, "]" )
	
	if ArkInventory.Global.Location[loc_id].player_id == ArkInventory.Global.Me.info.player_id or ArkInventory.Global.Location[loc_id].player_id == ArkInventory.Global.Me.info.guild_id then
	
		ArkInventory.Global.Location[loc_id].isOffline = false
		
		if loc_id == ArkInventory.Const.Location.Bank and ArkInventory.Global.Mode.Bank == false then
			ArkInventory.Global.Location[loc_id].isOffline = true
		end
		
		if loc_id == ArkInventory.Const.Location.Vault and ArkInventory.Global.Mode.Vault == false then
			ArkInventory.Global.Location[loc_id].isOffline = true
		end
		
		if loc_id == ArkInventory.Const.Location.Mail and ArkInventory.Global.Mode.Mail == false then
			ArkInventory.Global.Location[loc_id].isOffline = true
		end
		
	else
		
		ArkInventory.Global.Location[loc_id].isOffline = true
		
	end
	
end

function ArkInventory.Frame_Main_Anchor_Set( loc_id, rescale )

	local frame = ArkInventory.Frame_Main_Get( loc_id )
	local anchor = ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "point" } )

	local t = ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "t" } ) * ( rescale or 1 )
	local b = ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "b" } ) * ( rescale or 1 )
	local l = ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "l" } ) * ( rescale or 1 )
	local r = ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "r" } ) * ( rescale or 1 )
	
	local f1 = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Title.Name]
	local f2 = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Search.Name]
	local f3 = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Container.Name]
	local f4 = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Changer.Name]
	local f5 = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Status.Name]
	
	frame:ClearAllPoints( )
	f1:ClearAllPoints( )
	f2:ClearAllPoints( )
	f3:ClearAllPoints( )
	f4:ClearAllPoints( )
	f5:ClearAllPoints( )

	if anchor == ArkInventory.Const.Anchor.BottomRight then
		
		frame:SetPoint( "BOTTOMRIGHT", nil, "BOTTOMLEFT", r, b )
		
		f5:SetPoint( "BOTTOMRIGHT", frame )
		f5:SetPoint( "LEFT", frame )
		
		f4:SetPoint( "BOTTOMRIGHT", f5, "TOPRIGHT", 0, -3 )
		f4:SetPoint( "LEFT", frame )
		
		f3:SetPoint( "BOTTOMRIGHT", f4, "TOPRIGHT", 0, -3 )
		f3:SetPoint( "LEFT", frame )
		
		f2:SetPoint( "BOTTOMRIGHT", f3, "TOPRIGHT", 0, -4 )
		f2:SetPoint( "LEFT", frame )

		f1:SetPoint( "BOTTOMRIGHT", f2, "TOPRIGHT", 0, -3 )
		f1:SetPoint( "LEFT", frame )

	elseif anchor == ArkInventory.Const.Anchor.BottomLeft then
	
		frame:SetPoint( "BOTTOMLEFT", nil, "BOTTOMLEFT", l, b )

		f5:SetPoint( "BOTTOMLEFT", frame )
		f5:SetPoint( "RIGHT", frame )
		
		f4:SetPoint( "BOTTOMLEFT", f5, "TOPLEFT", 0, -3 )
		f4:SetPoint( "RIGHT", frame )
		
		f3:SetPoint( "BOTTOMLEFT", f4, "TOPLEFT", 0, -3 )
		f3:SetPoint( "RIGHT", frame )
		
		f2:SetPoint( "BOTTOMLEFT", f3, "TOPLEFT", 0, -4 )
		f2:SetPoint( "RIGHT", frame )

		f1:SetPoint( "BOTTOMLEFT", f2, "TOPLEFT", 0, -3 )
		f1:SetPoint( "RIGHT", frame )

	elseif anchor == ArkInventory.Const.Anchor.TopLeft then
		
		frame:SetPoint( "TOPLEFT", nil, "BOTTOMLEFT", l, t )
		
		f1:SetPoint( "TOPLEFT", frame )
		f1:SetPoint( "RIGHT", frame )

		f2:SetPoint( "TOPLEFT", f1, "BOTTOMLEFT", 0, 3 )
		f2:SetPoint( "RIGHT", frame )

		f3:SetPoint( "TOPLEFT", f2, "BOTTOMLEFT", 0, 4 )
		f3:SetPoint( "RIGHT", frame )

		f4:SetPoint( "TOPLEFT", f3, "BOTTOMLEFT", 0, 3 )
		f4:SetPoint( "RIGHT", frame )
		
		f5:SetPoint( "TOPLEFT", f4, "BOTTOMLEFT", 0, 3 )
		f5:SetPoint( "RIGHT", frame )

	else -- anchor == ArkInventory.Const.Anchor.TopRight then
		
		frame:SetPoint( "TOPRIGHT", nil, "BOTTOMLEFT", r, t )
		
		f1:SetPoint( "TOPRIGHT", frame )
		f1:SetPoint( "LEFT", frame )
		
		f2:SetPoint( "TOPRIGHT", f1, "BOTTOMRIGHT", 0, 3 )
		f2:SetPoint( "LEFT", frame )
		
		f3:SetPoint( "TOPRIGHT", f2, "BOTTOMRIGHT", 0, 4 )
		f3:SetPoint( "LEFT", frame )
		
		f4:SetPoint( "TOPRIGHT", f3, "BOTTOMRIGHT", 0, 3 )
		f4:SetPoint( "LEFT", frame )
		
		f5:SetPoint( "TOPRIGHT", f4, "BOTTOMRIGHT", 0, 3 )
		f5:SetPoint( "LEFT", frame )
		
	end

	if ArkInventory.LocationOptionGet( loc_id, { "anchor", loc_id, "locked" } ) then
		frame:RegisterForDrag( )
	else
		frame:RegisterForDrag( "LeftButton" )
	end

	if rescale then
		ArkInventory.Frame_Main_Anchor_Save( frame )
	end
	
end

function ArkInventory.Frame_Main_Paint( frame )
	
	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	
	for _, z in pairs( { frame:GetChildren( ) } ) do
		
		local framename = z:GetName( )
		if framename then -- only process objects with a name (other addons can add frames without names, we don't want to deal with them)
			
			-- background
			local obj = _G[framename .. "Background"]
			if obj then
				local style = ArkInventory.LocationOptionGet( loc_id, { "window", "background", "style" } ) or ArkInventory.Const.Texture.BackgroundDefault
				if style == ArkInventory.Const.Texture.BackgroundDefault then
					local colour = ArkInventory.LocationOptionGet( loc_id, { "window", "background", "colour" } )
					obj:SetTexture( colour.r, colour.g, colour.b, colour.a )
				else
					local file = ArkInventory.Lib.SharedMedia:Fetch( ArkInventory.Lib.SharedMedia.MediaType.BACKGROUND, style )
					obj:SetTexture( file )
				end
			end
			
			-- border
			local obj = _G[framename .. "ArkBorder"]
			if obj then
				
				if ArkInventory.LocationOptionGet( loc_id, { "window", "border", "style" } ) ~= ArkInventory.Const.Texture.BorderNone then
					
					local style = ArkInventory.LocationOptionGet( loc_id, { "window", "border", "style" } ) or ArkInventory.Const.Texture.BorderDefault
					local file = ArkInventory.Lib.SharedMedia:Fetch( ArkInventory.Lib.SharedMedia.MediaType.BORDER, style )
					local size = ArkInventory.LocationOptionGet( loc_id, { "window", "border", "size" } ) or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size
					local offset = ArkInventory.LocationOptionGet( loc_id, { "window", "border", "offset" } ) or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offset
					local scale = ArkInventory.LocationOptionGet( loc_id, { "window", "border", "scale" } ) or 1
					local colour = ArkInventory.LocationOptionGet( loc_id, { "window", "border", "colour" } )
					ArkInventory.Frame_Border_Paint( obj, false, file, size, offset, scale, colour.r, colour.g, colour.b, 1 )
					
					obj:Show( )
					
				else
					
					obj:Hide( )
					
				end
				
			end
			
		end
		
	end
	
end

function ArkInventory.Frame_Main_Paint_All( )

	for loc_id, loc_data in ipairs( ArkInventory.Global.Location ) do
		frame = ArkInventory.Frame_Main_Get( loc_id )
		ArkInventory.Frame_Main_Paint( frame )
	end
	
end

function ArkInventory.Frame_Border_Paint( border, slot, file, size, offset, scale, r, g, b, a )
	
	local otheroffset = 3
	if slot then otheroffset = 0 end
	
	local parentname = border:GetParent( ):GetName( )
	
	local offset = offset * scale
	
	border:SetBackdrop( { edgeFile = file, edgeSize = size * scale } )				
	border:SetBackdropBorderColor( r or 0, g or 0, b or 0, a or 1 )
	
	border:ClearAllPoints( )
	border:SetPoint( "TOPLEFT", parentname, 0 - offset + otheroffset, offset - otheroffset )
	border:SetPoint( "BOTTOMRIGHT", parentname, offset - otheroffset, 0 - offset + otheroffset )
	
end

function ArkInventory.Frame_Main_Update( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id

	ArkInventory.Frame_Status_Update( frame )
	
	-- set the size of the window
	local h = 0
	h = h + _G[frame:GetName( ) .. ArkInventory.Const.Frame.Title.Name]:GetHeight( )
	h = h + _G[frame:GetName( ) .. ArkInventory.Const.Frame.Container.Name]:GetHeight( )
	h = h + _G[frame:GetName( ) .. ArkInventory.Const.Frame.Changer.Name]:GetHeight( )
	h = h + _G[frame:GetName( ) .. ArkInventory.Const.Frame.Status.Name]:GetHeight( )
	frame:SetHeight( h )
	
	frame:SetWidth( ArkInventory.Global.Location[loc_id].Layout.container.width )
	
	ArkInventory.Frame_Main_Scale( frame )
	
end

function ArkInventory.Frame_Main_Draw( frame )

	if not frame:IsVisible( ) then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	
	--ArkInventory.Output( "Frame_Main_Draw( ", frame:GetName( ), " ) drawstate[", ArkInventory.Global.Location[loc_id].drawState, "], framelevel[", frame:GetFrameLevel( ), "]" )
	
	if not ArkInventory.Global.Location[loc_id].canView then
		-- not a controllable window (for scanning only)
		-- shouldnt ever get here, but just in case
		frame:Hide( )
		return
	end
	
	-- is the window online or offline?
	ArkInventory.Frame_Main_Offline( frame )
	
	-- set the window title
	local obj = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Title.Name .. "Who"]
	
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
	local t = ""
	if ArkInventory.LocationOptionGet( loc_id, { "title", "size" } ) == ArkInventory.Const.Window.Title.SizeThin then
		t = ArkInventory.DisplayName5( cp.info )
	else
		t = ArkInventory.DisplayName1( cp.info )
	end
	
	if ArkInventory.Global.Location[loc_id].isOffline then
		obj:SetTextColor( 1, 0, 0 )
		t = string.format( "%s [%s]", t, ArkInventory.Localise["STATUS_OFFLINE"] )
	else
		obj:SetTextColor( 0, 1, 0 )
	end

	obj:SetText( t )
	
	
	
	
	
	-- changer frame
	local obj = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Changer.Name]
	
	-- shrink and hide the changer frame if it can't be used
	if not ArkInventory.Global.Location[loc_id].hasChanger or ArkInventory.LocationOptionGet( loc_id, { "changer", "hide" } ) then
		
		obj:SetHeight( 3 )
		obj:Hide( )
		
	else
		
		obj:SetHeight( ArkInventory.Const.Frame.Changer.Height )
		obj:Show( )
		
		ArkInventory.Frame_Changer_Update( loc_id )
		
	end
	
	
	
	if loc_id == ArkInventory.Const.Location.Vault then
		
		-- vault tab changed
		if ArkInventory.Global.Location[loc_id].current_tab ~= GetCurrentGuildBankTab( ) then
			ArkInventory.Global.Location[loc_id].current_tab = GetCurrentGuildBankTab( )
			ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
		end
		
		-- force vault back to item display when offline
		if ArkInventory.Global.Location[loc_id].isOffline then
			GuildBankFrame.mode = "bank"
		end
		
		obj = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Container.Name]
		obj:Hide( )
		
		obj = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Info.Name]
		obj:Hide( )
		
		obj = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Log.Name]
		obj:Hide( )
		
		
		if GuildBankFrame.mode == "log" or GuildBankFrame.mode == "moneylog" then
			obj = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Log.Name]
			obj:Show( )
		elseif GuildBankFrame.mode == "tabinfo" then
			obj = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Info.Name]
			obj:Show( )
		elseif GuildBankFrame.mode == "bank" then
			obj = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Container.Name]
			obj:Show( )
		end
		
	end
	
	
	-- edit mode
	if ArkInventory.Global.Mode.Edit then
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	end

	
	-- bag data has changed
	if ArkInventory.Global.Location[loc_id].changed then

		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
	
		ArkInventory.ItemCategoryClear( nil, loc_id )
	
		-- instant sort
		if ArkInventory.LocationOptionGet( loc_id, { "sort", "instant" } ) then
			ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
		end

		ArkInventory.Global.Location[loc_id].changed = false

	end

	
	-- rebuild category and sort values
	if ArkInventory.Global.Location[loc_id].resort then
	
		ArkInventory.ItemSortKeyClear( loc_id )

		ArkInventory.Global.Location[loc_id].resort = false
	
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Refresh )
		
	end
	
	
	-- do we still need to draw the window?
	if ArkInventory.Global.Location[loc_id].drawState == ArkInventory.Const.Window.Draw.None then
		return
	end
	
	if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Init then
		ArkInventory.Frame_Main_Paint( frame )
	end

	if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Refresh then
	
		-- hide the title window if it's not needed
		local obj = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Title.Name]
		if ArkInventory.LocationOptionGet( loc_id, { "title", "hide" } ) then
			
			obj:Hide( )
			obj:SetHeight( 3 )
			
		else
			
			if ArkInventory.LocationOptionGet( loc_id, { "title", "size" } ) == ArkInventory.Const.Window.Title.SizeThin then
				
				-- thin size
				
				local z = _G[obj:GetName( ) .. "Location0"]
				z:SetWidth( 20 )
				z:SetHeight( 20 )
				
				z = _G[obj:GetName( ) .. "ActionButton21"]
				z:ClearAllPoints( )
				z:SetPoint( "RIGHT", _G[obj:GetName( ) .. "ActionButton14"], "LEFT", -3, 0 )
				
				obj:SetHeight( ArkInventory.Const.Frame.Title.Height2 )
				obj:Show( )
				
			else
				
				-- normal size
		
				local z = _G[obj:GetName( ) .. "Location0"]
				z:SetWidth( 42 )
				z:SetHeight( 42 )
				
				z = _G[obj:GetName( ) .. "ActionButton21"]
				z:ClearAllPoints( )
				z:SetPoint( "TOP", _G[obj:GetName( ) .. "ActionButton11"], "BOTTOM", 0, -2 )
				
				obj:SetHeight( ArkInventory.Const.Frame.Title.Height )
				obj:Show( )
				
			end
			
		end
		
		-- hide the search window if it's not needed
		local obj = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Search.Name]
		if ArkInventory.LocationOptionGet( loc_id, { "search", "hide" } ) then
			
			obj:Hide( )
			obj:SetHeight( 3 )
			
			obj = _G[obj:GetName( ) .. "Filter"]:SetText( "" )
			
		else
			
			obj:SetHeight( ArkInventory.Const.Frame.Search.Height )
			obj:Show( )
			
		end
	
	end
	
	obj = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Container.Name]
	ArkInventory.Frame_Container_Draw( obj )
	
	if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Refresh then
		ArkInventory.Frame_Main_Update( frame )
	end

	if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Init then
		ArkInventory.MediaSetFontFrame( frame )
	end

	ArkInventory.Global.Location[loc_id].drawState = ArkInventory.Const.Window.Draw.None
	

	-- bug fix for framelevel issue
	if ArkInventory.db.global.option.bugfix.framelevel.enable and frame:GetFrameLevel( ) > 126 then
		
		local level_old = frame:GetFrameLevel( )
		local level_new = 2
		
		ArkInventory.ResetFrameLevel( frame, level_new )
		
		if ArkInventory.db.global.option.bugfix.framelevel.alert == 1 then
			-- short
			--ArkInventory.OutputWarning( ArkInventory.Localise["MISC_ALERT"], FONT_COLOR_CODE_CLOSE, " ", ArkInventory.Localise["MISC_ALERT_FRAMELEVEL_1"] )
		elseif ArkInventory.db.global.option.bugfix.framelevel.alert == 2 then
			-- long
			--ArkInventory.OutputWarning( ArkInventory.Localise["MISC_ALERT"], FONT_COLOR_CODE_CLOSE, " ", ArkInventory.Localise["MISC_ALERT_FRAMELEVEL_1"], "  ", string.format( ArkInventory.Localise["MISC_ALERT_FRAMELEVEL_2"], ArkInventory.Global.Location[loc_id].Name, level_old, level_new ) )
		else
			-- disabled
		end
		
	end	
	
end
	
function ArkInventory.ResetFrameLevel( frame, level )

	if type( frame ) == "string" then
		frame = _G[frame]
	end
	
	if frame == nil then
		return
	end
	
	if frame:GetFrameLevel( ) ~= level then
		--ArkInventory.Output( "ResetFrameLevel( ", frame:GetName( ), " ) ", frame:GetFrameLevel( ), " -> ", level )
		frame:SetFrameLevel( level )
	end
	
	for _, z in pairs( { frame:GetChildren( ) } ) do
		ArkInventory.ResetFrameLevel( z, level + 1 )
	end

end	
	
function ArkInventory.Frame_Main_Toggle( loc_id )

	local frame = ArkInventory.Frame_Main_Get( loc_id )

	if frame then
		if frame:IsVisible( ) then
			ArkInventory.Frame_Main_Hide( loc_id )
		else
			ArkInventory.Frame_Main_Show( loc_id )
		end
	end
	
end

function ArkInventory.Frame_Main_Show( loc_id, player_id )
	
	assert( loc_id, "invalid location: nil" )
	
	local frame = ArkInventory.Frame_Main_Get( loc_id )
	
	if player_id == nil then
		
		if loc_id == ArkInventory.Const.Location.Vault then
			player_id = ArkInventory.Global.Me.info.guild_id
		else
			player_id = ArkInventory.Global.Me.info.player_id
		end
		
	end
	
	if player_id ~= ArkInventory.Global.Location[loc_id].player_id then
		-- showing a different player than whats already being displayed so init
		ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Init )
	else
		-- same player, leave as is, display code will sort it out, unless user wants it to sort
		if ArkInventory.LocationOptionGet( loc_id, { "sort", "open" } ) then
			ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Resort )
		end
		
	end

	ArkInventory.LocationSetValue( loc_id, "player_id", player_id )
	
	frame:Show( )
	ArkInventory.Frame_Main_Generate( loc_id )

end

function ArkInventory.Frame_Main_OnShow( frame )

	local loc_id = frame.ARK_Data.loc_id

	if loc_id == ArkInventory.Const.Location.Key then
		PlaySound( "KeyRingOpen" )
	elseif loc_id == ArkInventory.Const.Location.Bank then
		PlaySound( "igCharacterInfoOpen" )
	elseif loc_id == ArkInventory.Const.Location.Bag then
		PlaySound( "igBackPackOpen" )
	elseif loc_id == ArkInventory.Const.Location.Vault then
		PlaySound( "GuildVaultOpen" )
	elseif loc_id == ArkInventory.Const.Location.Mail then
		PlaySound( "igSpellBookOpen" )
	elseif loc_id == ArkInventory.Const.Location.Wearing then
		PlaySound( "igBackPackOpen" )
	elseif loc_id == ArkInventory.Const.Location.Pet then
		PlaySound( "igSpellBookOpen" )
	elseif loc_id == ArkInventory.Const.Location.Mount then
		PlaySound( "igSpellBookOpen" )
	elseif loc_id == ArkInventory.Const.Location.Token then
		ArkInventory.ScanLocation( loc_id )
		PlaySound( "igSpellBookOpen" )
	end
	
end

function ArkInventory.Frame_Main_Search( frame )
	
	if not frame then
		frame = this:GetParent( ):GetParent( ):GetName( )
	end
	
	local loc_id = _G[frame].ARK_Data.loc_id
	local search = frame .. "Search"
	local filter = _G[search .. "Filter"]:GetText( )
	
	ArkInventory.Global.Location[loc_id].filter = strtrim( filter )
	ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )

end

function ArkInventory.Frame_Main_Hide( w )

	for loc_id in ipairs( ArkInventory.Global.Location ) do
		if not w or w == loc_id then
			local frame = ArkInventory.Frame_Main_Get( loc_id )
			frame:Hide( )
		end
	end
	
end

function ArkInventory.Frame_Main_OnHide( frame )
	
	ArkInventory.Lib.DewDrop:Close( )
	
	local loc_id = frame.ARK_Data.loc_id
	
	if loc_id == ArkInventory.Const.Location.Key then
		PlaySound( "KeyRingClose" )
	elseif loc_id == ArkInventory.Const.Location.Bank then
		
		PlaySound( "igCharacterInfoClose" )
		
		if ArkInventory.Global.Mode.Bank and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bank ) then
			-- close blizzards bank frame if we're hiding blizzard frames, we're at the bank, and the bank window was closed
			CloseBankFrame( )
		end
		
	elseif loc_id == ArkInventory.Const.Location.Bag then
		PlaySound( "igBackPackClose" )
	elseif loc_id == ArkInventory.Const.Location.Vault then
		
		PlaySound( "GuildVaultClose" )
		
		if ArkInventory.Global.Mode.Vault and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Vault ) then
			
			-- close blizzards vault frame if we're hiding blizzard frames, we're at the vault, and the vault window was closed
			
			GuildBankPopupFrame:Hide( )
			StaticPopup_Hide( "GUILDBANK_WITHDRAW" )
			StaticPopup_Hide( "GUILDBANK_DEPOSIT" )
			StaticPopup_Hide( "CONFIRM_BUY_GUILDBANK_TAB" )
			
			CloseGuildBankFrame( )
			
		end
		
	elseif loc_id == ArkInventory.Const.Location.Mail then
		PlaySound( "igSpellBookClose" )
	elseif loc_id == ArkInventory.Const.Location.Wearing then
		PlaySound( "igBackPackClose" )
	elseif loc_id == ArkInventory.Const.Location.Pet then
		PlaySound( "igSpellBookClose" )
	elseif loc_id == ArkInventory.Const.Location.Mount then
		PlaySound( "igSpellBookClose" )
	elseif loc_id == ArkInventory.Const.Location.Token then
		PlaySound( "igSpellBookClose" )
	end
	
	if ArkInventory.Global.Mode.Edit then
		-- if the edit mode is active then disable edit mode and taint so it's rebuilt when next opened
		ArkInventory.Global.Mode.Edit = false
		ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	end
	
end

function ArkInventory.Frame_Main_OnLoad( frame )

	assert( frame, "frame is nil" )

	local framename = frame:GetName( )
	local loc_id = strmatch( framename, "^.-(%d+)" )
	assert( loc_id ~= nil, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	
	frame.ARK_Data = {
		["loc_id"] = tonumber( loc_id ),
	}

	loc_id = tonumber( loc_id )
	
	local tex
	
	-- setup main icon
	local obj = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Title.Name .. "Location0"]
	if obj then
	
		tex = obj:GetNormalTexture( )
		tex:SetTexture( ArkInventory.Global.Location[loc_id].Texture )
		tex:SetTexCoord( 0.075, 0.925, 0.075, 0.925 )
		
		tex = obj:GetHighlightTexture( )
		tex:SetTexture( ArkInventory.Global.Location[loc_id].Texture )
		tex:SetTexCoord( 0.075, 0.925, 0.075, 0.925 )
		
		tex = obj:GetPushedTexture( )
		tex:SetTexture( ArkInventory.Global.Location[loc_id].Texture )
		tex:SetTexCoord( 0.075, 0.925, 0.075, 0.925 )
		
	end
	
	-- setup action buttons
	for k, v in pairs( ArkInventory.Const.Actions ) do
	
		local obj = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Title.Name .. "ActionButton" .. k]
		
		if obj then
		
			tex = obj:GetNormalTexture( )
			tex:SetTexture( v.Texture )
			tex:SetTexCoord( 0.075, 0.925, 0.075, 0.925 )
			
			tex = obj:GetPushedTexture( )
			tex:SetTexture( v.Texture )
			tex:SetTexCoord( 0.075, 0.925, 0.075, 0.925 )

			tex = obj:GetHighlightTexture( )
			tex:SetTexture( v.Texture )
			tex:SetTexCoord( 0.075, 0.925, 0.075, 0.925 )

			for s, f in pairs( v.Scripts ) do
				obj:SetScript( s, f )
			end
			
		end
	end
	
	tinsert( UISpecialFrames, framename )
	
end

function ArkInventory.Frame_Main_Anchor_Save( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	
	ArkInventory.LocationOptionSet( loc_id, { "anchor", loc_id, "t" }, frame:GetTop( ) )
	ArkInventory.LocationOptionSet( loc_id, { "anchor", loc_id, "b" }, frame:GetBottom( ) )
	ArkInventory.LocationOptionSet( loc_id, { "anchor", loc_id, "l" }, frame:GetLeft( ) )
	ArkInventory.LocationOptionSet( loc_id, { "anchor", loc_id, "r" }, frame:GetRight( ) )
	
end

function ArkInventory.Frame_Container_Calculate( frame )

	--ArkInventory.Output( "Frame_Container_Calculate( ", frame:GetName( ), " )" )

	local loc_id = frame.ARK_Data.loc_id
	
	ArkInventory.Table.Clean( ArkInventory.Global.Location[loc_id].Layout, nil, true )

	-- break the inventory up into it's respective bars
	ArkInventory.Frame_Container_CalculateBars( frame, ArkInventory.Global.Location[loc_id].Layout )
	
	-- calculate what the container should look like with those bars
	ArkInventory.Frame_Container_CalculateContainer( frame, ArkInventory.Global.Location[loc_id].Layout )

end

function ArkInventory.Frame_Container_CalculateBars( frame, Layout )

	-- loads the inventory into their respective bars
	
	--cp.location[loc_id].Layout

	local loc_id = frame.ARK_Data.loc_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	local firstempty = true
	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "Frame_Container_CalculateBars( ", frame:GetName( ), " ) for [", cp.name, "] start" )

	Layout.bar = { }
	Layout.bar_count = 1

	-- the basics, just stick the items into their appropriate bars
	for bag_id, bag in pairs( cp.location[loc_id].bag ) do
	
		for slot_id, i in pairs( bag.slot ) do
		
			local ignore = false
			
			if loc_id == ArkInventory.Const.Location.Vault and not ArkInventory.db.realm.player.data[cp.info.player_id].display[loc_id].bag[bag_id] then
				ignore = true
			end
			
			if not ignore then
				
				local cat_id = i.cat or ArkInventory.ItemCategoryGet( i )
				local bar_id = ArkInventory.CategoryLocationGet( loc_id, cat_id )
				
				--ArkInventory.Output( "loc=[", loc_id, "], bag=[", bag_id, "], slot=[", slot_id, "], cat=[", cat_id, "], bar_id=[", bar_id, "]" )
				
				local hidden = false
				
				if not ArkInventory.db.realm.player.data[cp.info.player_id].display[loc_id].bag[bag_id] then
					-- isoalted bags do not get shown
					hidden = true
				elseif bar_id < 0 then
					-- hidden categories (reside on negative bar numbers) do not get shown
					-- the first empty slot is always shown
--					if firstempty and ( cat_id == ArkInventory.CategoryGetSystemID( "EMPTY" ) or cat_id == ArkInventory.CategoryGetSystemID( "EMPTY_BAG" ) ) then
--						firstempty = false
						-- need to enforce an update if we do this or you wont see newly collected items
--					else
						hidden = true
--					end
				end
				
				if ArkInventory.Global.Mode.Edit or ArkInventory.LocationOptionGet( loc_id, { "slot", "ignorehidden" } ) then
					-- show everything if in edit mode or the user wants us to ignore the hidden flag
					hidden = false
				end
				
				if not hidden then
				
					bar_id = abs( bar_id )
					
					-- create the bar
					if not Layout.bar[bar_id] then
						Layout.bar[bar_id] = { ["id"] = bar_id, ["item"] = { }, ["count"] = 0, ["width"] = 0, ["height"] = 0, ["ghost"] = false, ["frame"] = 0 }
					end
					
					-- add the item to the bar
					tinsert( Layout.bar[bar_id].item, { ["bag"] = bag_id, ["slot"] = slot_id } )
					
					-- increment the bars item count
					Layout.bar[bar_id].count = Layout.bar[bar_id].count + 1
					
					-- keep track of the last bar used
					if bar_id > Layout.bar_count then
						Layout.bar_count = bar_id
					end
					
					--ArkInventory.Output( "bag[", bag_id, "], slot[", slot_id, "], cat[", cat_id, "], bar[", bar_id, "], id=[", Layout.bar[bar_id].id, "]" )
					
				end
				
			end
			
		end
		
	end

	
	-- get highest used bar
	local cats = ArkInventory.LocationOptionGet( loc_id, { "category" } )
	for _, bar_id in pairs( cats ) do
		if bar_id > Layout.bar_count then
			Layout.bar_count = bar_id
		end
	end
	
	-- round up to a full number of bars per row
	local bpr = ArkInventory.LocationOptionGet( loc_id, { "bar", "per" } ) or 1
	Layout.bar_count = ceil( Layout.bar_count / bpr ) * bpr

	-- update the maximum number of bar frames used so far
	if Layout.bar_count > ArkInventory.Global.Location[loc_id].maxBar then
		ArkInventory.Global.Location[loc_id].maxBar = Layout.bar_count
	end

	-- if we're in edit mode then create all missing bars and add a ghost item to every bar
	-- ghost items allow for the bar menu icon
	if ArkInventory.Global.Mode.Edit or ArkInventory.LocationOptionGet( loc_id, { "bar", "showempty" } ) then
	
		--ArkInventory.Output( "edit mode - adding ghost bars" )
		for bar_id = 1, Layout.bar_count do
				
			if not Layout.bar[bar_id] then
			
				-- create a ghost bar
				Layout.bar[bar_id] = { ["id"] = bar_id, ["item"] = { }, ["count"] = 1, ["width"] = 0, ["height"] = 0, ["ghost"] = true, ["frame"] = 0 }
				
			else
	
				-- add a ghost item to the bar by incrementing the bars item count
				Layout.bar[bar_id].count = Layout.bar[bar_id].count + 1
				
			end
			
		end
		
	end

	
	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "Frame_Container_CalculateBars( ", frame:GetName( ), " ) end" )
	
end

function ArkInventory.Frame_Container_CalculateContainer( frame, Layout )

	-- calculate what the bars look like in the conatiner

	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "Frame_Container_Calculate( ", frame:GetName( ), " ) start" )

	local loc_id = frame.ARK_Data.loc_id

	Layout.container = { ["row"] = { } }
	
	local bpr = ArkInventory.LocationOptionGet( loc_id, { "bar", "per" } )
	local rownum = 0
	local bf = 1 -- bar frame, allocated to each bar as it's calculated (uses less frames this way)
	
	--ArkInventory.Output( "container ", loc_id, " has ", Layout.bar_count, " bars" )
	--ArkInventory.Output( "container ", loc_id, " set for ", bpr, " bars per row" )
	
	
	if ArkInventory.Global.Mode.Edit == false and ArkInventory.LocationOptionGet( loc_id, { "bar", "compact" } ) then
	
		--ArkInventory.Output( "compact bars enabled" )
	
		local bc = 0  -- number of bars currently in this row
		local vr = { }  -- virtual row - holds a list of bars for this row

		for j = 1, Layout.bar_count do
		
			--ArkInventory.Output( "bar [", j, "]" )
		
			if Layout.bar[j] then
				if Layout.bar[j].count > 0 then
					--ArkInventory.Output( "assignment: bar [", j, "] to frame [", bf, "]" )
					Layout.bar[j]["frame"] = bf
					bf = bf + 1
					bc = bc + 1
					--tinsert( vr, Layout.bar[j] )
					tinsert( vr, j )
				else
					--ArkInventory.Output( "bar [", j, "] has no items" )
				end
			else
				--ArkInventory.Output( "bar [", j, "] has no items (does not exist)" )
			end
		
			if bc > 0 and ( bc == bpr or j == Layout.bar_count ) then
		
				rownum = rownum + 1
				if not Layout.container.row[rownum] then
					Layout.container.row[rownum] = { }
				end
				
				--ArkInventory.Output( "row [", rownum, "] allocated [", bc, "] bars" )
			
				Layout.container.row[rownum].bar = vr
				
				--ArkInventory.Output( "row [", rownum, "] created" )
				
				bc = 0
				vr = { }

			end
		
		end
	
	else
	
		for j = 1, Layout.bar_count, bpr do
		
			local bc = 0  -- number of bars currently in this row
			local vr = { }  -- virtual row - holds a list of bars for this row

			for b = 1, bpr do
				if Layout.bar[j+b-1] then
					if Layout.bar[j+b-1].count > 0 then
						--ArkInventory.Output( "assignment: bar [", j+b-1, "] to frame [", bf, "]" )
						Layout.bar[j+b-1]["frame"] = bf
						bf = bf + 1
						bc = bc + 1
						--tinsert( vr, Layout.bar[j+b-1] )
						tinsert( vr, j+b-1 )
					else
						--ArkInventory.Output( "bar [", j+b-1, "] has no items" )
					end
				else
					--ArkInventory.Output( "bar [", j+b-1, "] has no items (does not exist)" )
				end
			end
		
			if bc > 0 then
		
				rownum = rownum + 1
				if not Layout.container.row[rownum] then
					Layout.container.row[rownum] = { }
				end
			
				--ArkInventory.Output( "row [", rownum, "] allocated [", bc, "] bars" )
				
				Layout.container.row[rownum].bar = vr
				
			end

		end
		
	end

	
	-- fit the bars into the row

	local rmw = ArkInventory.LocationOptionGet( loc_id, { "window", "width" } )  -- row max width
	local rcw = 0 -- row current width
	local rch = 1 -- row current height
	local rmh = 0 -- row max height
		
	local bar = Layout.bar
	
	--ArkInventory.Output( "bars per row=[", bpr, "], max columns=[", rmw, "], columns per bar=[", floor( rmw / bpr ), "]" )
	
	for rownum, row in ipairs( Layout.container.row ) do
		
		for k, bar_id in ipairs( row.bar ) do

			bar[bar_id].width = 1
			if bar[bar_id].width < 1 then
				bar[bar_id].width = 1
			end
			
			bar[bar_id].height = ceil( bar[bar_id].count / bar[bar_id].width )
			
			if bar[bar_id].height > rmh then
				rmh = bar[bar_id].height
			end
			
			--ArkInventory.Output( "row=[", rownum, "], index=[", k, "], bar=[", bar_id, "], width=[", bar[bar_id].width, "], height=[", bar[bar_id].height, "]" )
			
		end
		
		
		
		if rmh > 1 then

			repeat
			
				rmh = 1
				local rmb = 0
				
				-- find bar with highest height
				for _, bar_id in ipairs( row.bar ) do
					if bar[bar_id].height > rmh then
						rmh = bar[bar_id].height
						rmb = bar_id
					end
				end

				if rmh > 1 then

					-- increase that bars width by one
					bar[rmb].width = bar[rmb].width + 1
				
					-- and recalcualte it's new height
					bar[rmb].height = ceil( bar[rmb].count / ( bar[rmb].width or 1 ) )
				
					-- and see if that all fits
					rcw = 0
					rmh = 0
					for _, bar_id in ipairs( row.bar ) do
					
						rcw = rcw + bar[bar_id].width
					
						if bar[bar_id].height > rmh then
							rmh = bar[bar_id].height
						end
					
					end
					
				end
				
				-- exit if the width fits or the max height is 1
			until rcw >= rmw or rmh == 1
			
		end
		
		--ArkInventory.Output( "maximum height for row [", rownum, "] was [", rmh, "]" )
		
		for k, bar_id in ipairs( row.bar ) do
		
			--ArkInventory.Output( "setting max height for row [", rownum, "] bar [", bar_id, "] to [", rmh, "]" )
		
			-- set height of all bars in the row to the maximum height used (looks better)
			bar[bar_id].height = rmh
			
			if bar[bar_id].ghost or ArkInventory.Global.Mode.Edit or ArkInventory.LocationOptionGet( loc_id, { "bar", "showempty" } ) then
				-- remove the ghost item from the count (it was only needed to calculate properly)
				bar[bar_id].count = bar[bar_id].count - 1
			end
		end
		
	end
	

	--ArkInventory.Output( GREEN_FONT_COLOR_CODE, "Frame_Container_Calculate( ", frame:GetName( ), " ) end" )

end

function ArkInventory.Frame_Container_Draw( frame )

	local loc_id = frame.ARK_Data.loc_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
	--ArkInventory.Output( "draw frame=", frame:GetName( ), ", loc=", loc_id, ", state=", ArkInventory.Global.Location[loc_id].drawState )
	
	if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Recalculate then

		-- calculate what the container should look like
		ArkInventory.Frame_Container_Calculate( frame )

		local name

		-- create (if required) the bar frames, and hide any that are no longer required
		local placeframename = frame:GetName( ) .. "Bar"
		local placeframe = _G[placeframename]
		assert( placeframe, "xml element '" .. placeframename .. "' could not be found" )
		
		local baselevel = placeframe:GetFrameLevel( )
		
		for j = 1, ArkInventory.Global.Location[loc_id].maxBar do
			local barframename = placeframename .. j
			local barframe = _G[barframename]
			if not barframe then
				--ArkInventory.Output( "creating bar [", barframename, "]" )
				barframe = CreateFrame( "Frame", barframename, placeframe, "ARKINV_TemplateFrameBar" )
			end
			
			ArkInventory.Frame_Bar_Paint( barframe )
			barframe:Hide( )
		end
		
		-- create (if required) the bags and their item buttons, and hide any that are not currently needed
		local placeframename = frame:GetName( ) .. "Bag"
		local placeframe = _G[placeframename]
		assert( placeframe, "xml element '" .. placeframename .. "' could not be found" )
		
		--~~~~ need to fix this for when the cache is reset
		for bag_id in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
			local bagframename = placeframename .. bag_id
			local bagframe = _G[bagframename]
			if not bagframe then
				--ArkInventory.Output( "creating bag frame [", bagframename, "]" )
				bagframe = CreateFrame( "Frame", bagframename, placeframe, "ARKINV_TemplateFrameBag" )
			end

			-- remember the maximum number of slots used for each bag
			local b = cp.location[loc_id].bag[bag_id]
			
			if not ArkInventory.Global.Location[loc_id].maxSlot[bag_id] then
				ArkInventory.Global.Location[loc_id].maxSlot[bag_id] = 0
			end
			
			if b.count > ArkInventory.Global.Location[loc_id].maxSlot[bag_id] then
				ArkInventory.Global.Location[loc_id].maxSlot[bag_id] = b.count
			end
			
			-- create the item frames for the bag
			for j = 1, ArkInventory.Global.Location[loc_id].maxSlot[bag_id] do
				
				local itemframename = ArkInventory.ContainerItemNameGet( loc_id, bag_id, j )
				local itemframe = _G[itemframename]
				if not itemframe then
					--ArkInventory.Output( "creating item frame [", itemframename, "]" )
					if loc_id == ArkInventory.Const.Location.Vault then
						itemframe = CreateFrame( "Button", itemframename, bagframe, "ARKINV_TemplateButtonVaultItem" )
					elseif loc_id == ArkInventory.Const.Location.Pet or loc_id == ArkInventory.Const.Location.Mount then
						itemframe = CreateFrame( "Button", itemframename, bagframe, "ARKINV_TemplateButtonPetItem" )
					elseif loc_id == ArkInventory.Const.Location.Wearing or loc_id == ArkInventory.Const.Location.Mail or loc_id == ArkInventory.Const.Location.Token then
						itemframe = CreateFrame( "Button", itemframename, bagframe, "ARKINV_TemplateButtonViewOnlyItem" )
					else
						itemframe = CreateFrame( "Button", itemframename, bagframe, "ARKINV_TemplateButtonItem" )
					end
				end	
				
				if j == 1 then
					ArkInventory.Global.BAG_SLOT_SIZE = itemframe:GetWidth( )
				end
				
				ArkInventory.Frame_Item_Update_Clickable( itemframe )
				itemframe:Hide( )
				
			end
			
		end
		
	end

	-- build the bar frames
	
	local name = frame:GetName( )
		
	local pad_slot = ArkInventory.LocationOptionGet( loc_id, { "slot", "pad" } )
	local pad_bar_int = ArkInventory.LocationOptionGet( loc_id, { "bar", "pad", "internal" } )
	local pad_bar_ext = ArkInventory.LocationOptionGet( loc_id, { "bar", "pad", "external" } )
	local pad_window = ArkInventory.LocationOptionGet( loc_id, { "window", "pad" } )
	local pad_label = ( ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "show" } ) and ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "height" } ) ) or 0
	local anchor = ArkInventory.LocationOptionGet( loc_id, { "bar", "anchor" } )

	--ArkInventory.Output( "Layout=[", ArkInventory.Global.Location[loc_id].Layout, "]" )
	
	for rownum, row in ipairs( ArkInventory.Global.Location[loc_id].Layout.container.row ) do

		row["width"] = pad_window * 2 + pad_bar_ext
		
		for bar_index, bar_id in ipairs( row.bar ) do

			local bar = ArkInventory.Global.Location[loc_id].Layout.bar[bar_id]
			
			local barframename = name .. "Bar" .. bar.frame
			local obj = _G[barframename]
			assert( obj, "xml element '" .. barframename .. "' could not be found" )

			-- assign the bar number used to the bar frame
			obj.ARK_Data.bar_id = bar_id
			
			if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Recalculate then

				local obj_width = bar.width * ArkInventory.Global.BAG_SLOT_SIZE + ( bar.width - 1 ) * pad_slot + pad_bar_int * 2
				obj:SetWidth( obj_width )
				row.width = row.width + obj_width
				
				row.width = row.width + pad_bar_ext

				row["height"] = bar.height * ArkInventory.Global.BAG_SLOT_SIZE + ( bar.height - 1 ) * pad_slot + pad_bar_int * 2 + pad_label
				obj:SetHeight( row.height )
				
				obj:ClearAllPoints( )
				
				--ArkInventory.Output( "row=" .. rownum .. ", bar=" .. bar_index .. ", obj=" .. obj:GetName( ) .. ", frame=" .. bar.frame )
				-- anchor first bar to frame
				if bar.frame == 1 then
					
					if anchor == ArkInventory.Const.Anchor.BottomLeft then
						obj:SetPoint( "BOTTOMLEFT", frame, "BOTTOMLEFT", pad_window + pad_bar_ext, pad_window + pad_bar_ext )
					elseif anchor == ArkInventory.Const.Anchor.TopLeft then
						obj:SetPoint( "TOPLEFT", frame, "TOPLEFT", pad_window + pad_bar_ext, 0 - pad_window - pad_bar_ext )
					elseif anchor == ArkInventory.Const.Anchor.TopRight then
						obj:SetPoint( "TOPRIGHT", frame, "TOPRIGHT", 0 - pad_window - pad_bar_ext, 0 - pad_window - pad_bar_ext )
					else -- if anchor == ArkInventory.Const.Anchor.BottomRight then
						obj:SetPoint( "BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0 - pad_window - pad_bar_ext, pad_window + pad_bar_ext )
					end
					
				else
				
					if bar_index == 1 then
						-- next row, place under previous row
						--ArkInventory.Output( "anchor=" .. name .. "Bar" .. ArkInventory.Global.Location[loc_id].Layout.container.row[rownum-1].bar[1].frame )
						
						local prev = ArkInventory.Global.Location[loc_id].Layout.container.row[rownum-1].bar[1]
						local parent = name .. "Bar" .. ArkInventory.Global.Location[loc_id].Layout.bar[prev].frame
						
						if anchor == ArkInventory.Const.Anchor.BottomLeft then
							obj:SetPoint( "BOTTOMLEFT", parent, "TOPLEFT", 0, pad_bar_ext )
						elseif anchor == ArkInventory.Const.Anchor.TopLeft then
							obj:SetPoint( "TOPLEFT", parent, "BOTTOMLEFT", 0, 0 - pad_bar_ext )
						elseif anchor == ArkInventory.Const.Anchor.TopRight then
							obj:SetPoint( "TOPRIGHT", parent, "BOTTOMRIGHT", 0, 0 - pad_bar_ext )
						else -- if anchor == ArkInventory.Const.Anchor.BottomRight then
							obj:SetPoint( "BOTTOMRIGHT", parent, "TOPRIGHT", 0, pad_bar_ext )
						end

					else
					
						-- next slot, place bar next to last one
						
						local parent = name .. "Bar" .. ( bar.frame - 1 )
						
						if anchor == ArkInventory.Const.Anchor.BottomLeft then
							obj:SetPoint( "BOTTOMLEFT", parent, "BOTTOMRIGHT", pad_bar_ext, 0 )
						elseif anchor == ArkInventory.Const.Anchor.TopLeft then
							obj:SetPoint( "TOPLEFT", parent, "TOPRIGHT", pad_bar_ext, 0 )
						elseif anchor == ArkInventory.Const.Anchor.TopRight then
							obj:SetPoint( "TOPRIGHT", parent, "TOPLEFT", 0 - pad_bar_ext, 0 )
						else -- if anchor == ArkInventory.Const.Anchor.BottomRight then
							obj:SetPoint( "BOTTOMRIGHT", parent, "BOTTOMLEFT", 0 - pad_bar_ext, 0 )
						end
						
					end
				
				end
				
				obj:Show( )

			end
			
			if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Refresh then
				ArkInventory.Frame_Bar_Label( obj )
				ArkInventory.Frame_Bar_DrawItems( obj )
			end
			
		end

	end

	if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Recalculate then

		-- set container height and width
		
		local c = ArkInventory.Global.Location[loc_id].Layout.container
		
		c.width = ArkInventory.Const.Window.Min.Width
		
		c.height = pad_window * 2 + pad_bar_ext

		for row_index, row in ipairs( c.row ) do
		
			if row.width > c.width then
				c.width = row.width
			end
			
			c.height = c.height + row.height + pad_bar_ext
		
		end
		
		if c.height < ArkInventory.Const.Window.Min.Height then
			c.height = ArkInventory.Const.Window.Min.Height
		end
		
		frame:SetWidth( c.width )
		frame:SetHeight( c.height )

	end

end

function ArkInventory.Frame_Container_OnLoad( frame )

	assert( frame, "frame is nil" )

	local framename = frame:GetName( )
	local loc_id = strmatch( framename, "^.-(%d+)Container" )

	assert( loc_id, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	
	frame.ARK_Data = {
		["loc_id"] = tonumber( loc_id ),
	}
	
end


function ArkInventory.Frame_Bar_Paint_All( )

	--ArkInventory.Output( "Frame_Bar_Paint_All( )" )

	for loc_id, loc_data in ipairs( ArkInventory.Global.Location ) do

		c = _G[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Container.Name]
		
		if c and c:IsVisible( ) then
		
			for bar_id = 1, loc_data.maxBar do

				obj = _G[c:GetName( ) .. "Bar" .. bar_id]
				
				if obj then
					ArkInventory.Frame_Bar_Paint( obj )
				end
				
			end
			
		end
		
	end

end

function ArkInventory.Frame_Bar_Paint( frame )
	
	if not frame then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	
	-- border
	local obj = _G[frame:GetName( ) .. "ArkBorder"]
	if obj then
		
		if ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "style" } ) ~= ArkInventory.Const.Texture.BorderNone then
			
			local style = ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "style" } ) or ArkInventory.Const.Texture.BorderDefault
			local file = ArkInventory.Lib.SharedMedia:Fetch( ArkInventory.Lib.SharedMedia.MediaType.BORDER, style )
			local size = ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "size" } ) or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size
			local offset = ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "offset" } ) or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offset
			local scale = ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "scale" } ) or 1
			local colour = ArkInventory.LocationOptionGet( loc_id, { "bar", "border", "colour" } )
			ArkInventory.Frame_Border_Paint( obj, false, file, size, offset, scale, colour.r, colour.g, colour.b, 1 )
			
			obj:Show( )
			
		else
		
			obj:Hide( )
			
		end
		
	end
	
	-- background colour
	if ArkInventory.Global.Mode.Edit then
	
		frame:SetBackdropBorderColor( 1, 0, 0, 1 )
		_G[frame:GetName( ) .. "Background"]:SetTexture( 1, 0, 0, 0.1 )
		
		local obj = _G[frame:GetName( ) .. "Edit"]
		
		local pad_bar = ArkInventory.LocationOptionGet( loc_id, { "bar", "pad", "internal" } )
		local pad_label = ( ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "show" } ) and ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "height" } ) ) or 0
		local anchor = ArkInventory.LocationOptionGet( loc_id, { "slot", "anchor" } )

		obj:ClearAllPoints( )
		
		-- anchor to the opposite corner that items are
		if anchor == ArkInventory.Const.Anchor.BottomLeft then
			obj:SetPoint( "TOPRIGHT", 0 - pad_bar, 0 - pad_bar - pad_label ) -- OK
		elseif anchor == ArkInventory.Const.Anchor.TopLeft then
			obj:SetPoint( "BOTTOMRIGHT", 0 - pad_bar, pad_bar + pad_label )
		elseif anchor == ArkInventory.Const.Anchor.TopRight then
			obj:SetPoint( "BOTTOMLEFT", pad_bar, pad_bar + pad_label )
		else -- anchor == ArkInventory.Const.Anchor.BottomRight then
			obj:SetPoint( "TOPLEFT", pad_bar, 0 - pad_bar - pad_label ) -- OK
		end

		obj:SetWidth( ArkInventory.Global.BAG_SLOT_SIZE )
		obj:SetHeight( ArkInventory.Global.BAG_SLOT_SIZE )
		obj:Show( )
	
	else
	
		local colour = ArkInventory.LocationOptionGet( loc_id, { "bar", "background", "colour" } )
		_G[frame:GetName( ) .. "Background"]:SetTexture( colour.r, colour.g, colour.b, colour.a )
		_G[frame:GetName( ) .. "Edit"]:Hide( )
	
	end

	-- label
	ArkInventory.Frame_Bar_Label( frame )
	
end

function ArkInventory.Frame_Bar_DrawItems( frame )

	--ArkInventory.Output( "Frame_Bar_DrawItems( ", frame:GetName( ), " )" )

	local loc_id = frame.ARK_Data.loc_id
	
	if ArkInventory.Global.Location[loc_id].drawState > ArkInventory.Const.Window.Draw.Refresh then
		return
	end
	
	local bar_id = frame.ARK_Data.bar_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
	local bar = ArkInventory.Global.Location[loc_id].Layout.bar[bar_id]
	assert( bar, "bar id has not been set on frame" )
	
	if bar.count == 0 or bar.ghost then
		return
	end
	
	-- sort the items in the bar
	for j = 1, bar.count do
		local bag_id = bar.item[j].bag
		local slot_id = bar.item[j].slot
		
		local i = cp.location[loc_id].bag[bag_id].slot[slot_id]
		
		if bar.item[j].sortkey == nil then
			bar.item[j].sortkey = ArkInventory.ItemSortKeyGenerate( i, bar_id ) or "!"
		end
		
	end
	
	local sid_def = ArkInventory.LocationOptionGet( loc_id, { "sort", "default" } ) or 9999
	local sid = ArkInventory.LocationOptionGet( loc_id, { "bar", "data", bar_id, "sortorder" } ) or sid_def
	
	if not ArkInventory.db.global.option.sort.data[sid].used then
		--ArkInventory.OutputWarning( "bar ", bar_id, " in location ", loc_id, " is using an invalid sort method.  resetting it to default" )
		ArkInventory.LocationOptionSet( loc_id, { "bar", "data", bar_id, "sortorder" }, nil )
		sid = sid_def
	end
	
	if ArkInventory.db.global.option.sort.data[sid].ascending then
		sort( bar.item, function( a, b ) return a.sortkey > b.sortkey end )
	else
		sort( bar.item, function( a, b ) return a.sortkey < b.sortkey end )
	end
	

	local pad_slot = ArkInventory.LocationOptionGet( loc_id, { "slot", "pad" } )
	local pad_bar = ArkInventory.LocationOptionGet( loc_id, { "bar", "pad", "internal" } )
	local col = bar.width

	-- cycle through the items in the bar
	for j = 1, bar.count do

		local i = cp.location[loc_id].bag[bar.item[j].bag].slot[bar.item[j].slot]
		local framename = ArkInventory.ContainerItemNameGet( loc_id, bar.item[j].bag, bar.item[j].slot )
		local obj = _G[framename]
		assert( obj, "xml element '" .. framename .. "' does not exist" )

		if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Recalculate then
		
			-- anchor first item to bar frame - WARNING - item anchor point can only be bottom right, nothing else, so be relative

			local anchor = ArkInventory.LocationOptionGet( loc_id, { "slot", "anchor" } )
			local item_size = obj:GetWidth( )
			
			if j == 1 then
				
				local pad_name = 0
				
				if ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "show" } ) then
					
					local name_anchor = ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "anchor" } )
					
					if name_anchor ~= ArkInventory.Const.Anchor.Automatic then
						
						local slot_anchor = ArkInventory.Const.Anchor.Top
						if anchor == ArkInventory.Const.Anchor.BottomLeft or anchor == ArkInventory.Const.Anchor.BottomRight then
							slot_anchor = ArkInventory.Const.Anchor.Bottom
						end
						
						if name_anchor == slot_anchor then
							pad_name = ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "height" } ) or 0
						end
						
					end
					
				end
				
				
				if anchor == ArkInventory.Const.Anchor.BottomLeft then
					obj:SetPoint( "BOTTOMRIGHT", frame, "BOTTOMLEFT", pad_bar + item_size, pad_bar + pad_name ) -- OK
				elseif anchor == ArkInventory.Const.Anchor.TopLeft then
					obj:SetPoint( "BOTTOMRIGHT", frame, "TOPLEFT", pad_bar + item_size, 0 - pad_bar - pad_name - item_size ) -- OK
				elseif anchor == ArkInventory.Const.Anchor.TopRight then
					obj:SetPoint( "BOTTOMRIGHT", frame, "TOPRIGHT", 0 - pad_bar, 0 - pad_bar - pad_name - item_size ) -- OK
				else -- anchor == ArkInventory.Const.Anchor.BottomRight then
					obj:SetPoint( "BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0 - pad_bar, pad_bar + pad_name ) -- OK
				end
				
			else
			
				if mod( ( j - 1 ), col ) == 0 then
				
					-- next row, anchor to first item in previous row
					local anchorframe = ArkInventory.ContainerItemNameGet( loc_id, bar.item[j-col].bag, bar.item[j-col].slot )
					
					if anchor == ArkInventory.Const.Anchor.BottomLeft then
						obj:SetPoint( "BOTTOMRIGHT", anchorframe, 0, pad_slot + item_size ) -- OK
					elseif anchor == ArkInventory.Const.Anchor.TopLeft then
						obj:SetPoint( "BOTTOMRIGHT", anchorframe, 0, 0 - pad_slot - item_size ) -- OK
					elseif anchor == ArkInventory.Const.Anchor.TopRight then
						obj:SetPoint( "BOTTOMRIGHT", anchorframe, 0, 0 - pad_slot - item_size ) -- OK
					else -- if anchor == ArkInventory.Const.Anchor.BottomRight then
						obj:SetPoint( "BOTTOMRIGHT", anchorframe, 0, pad_slot + item_size ) -- OK
					end
						
				else
				
					-- anchor to last item
					
					local anchorframe = ArkInventory.ContainerItemNameGet( loc_id, bar.item[j-1].bag, bar.item[j-1].slot )
					
					if anchor == ArkInventory.Const.Anchor.BottomLeft then
						obj:SetPoint( "BOTTOMRIGHT", anchorframe, pad_slot + item_size, 0 )
					elseif anchor == ArkInventory.Const.Anchor.TopLeft then
						obj:SetPoint( "BOTTOMRIGHT", anchorframe, pad_slot + item_size, 0 )
					elseif anchor == ArkInventory.Const.Anchor.TopRight then
						obj:SetPoint( "BOTTOMRIGHT", anchorframe, 0 - pad_slot - item_size, 0 )
					else -- if anchor == ArkInventory.Const.Anchor.BottomRight then
						obj:SetPoint( "BOTTOMRIGHT", anchorframe, 0 - pad_slot - item_size, 0 )
					end
					
				end
				
			end
			
		end
	
		obj:Show( )

		if ArkInventory.Global.Location[loc_id].drawState <= ArkInventory.Const.Window.Draw.Refresh then
			ArkInventory.Frame_Item_Update_Border( obj )
			ArkInventory.Frame_Item_Update_Fade( obj )
			ArkInventory.Frame_Item_Update_Count( obj )
			ArkInventory.Frame_Item_Update_Texture( obj )
			ArkInventory.Frame_Item_Update_Quest( obj )
			ArkInventory.Frame_Item_Update_Cooldown( obj )
			ArkInventory.Frame_Item_Update_Lock( obj )
		end

	end

end

function ArkInventory.Frame_Bar_Label( frame )

	local loc_id = frame.ARK_Data.loc_id
	local bar_id = frame.ARK_Data.bar_id
	
	local obj = _G[frame:GetName( ) .. "Label"]
	
	if obj then
		
		local txt = ArkInventory.LocationOptionGet( loc_id, { "bar", "data", bar_id, "label" } )
		
		if txt and txt ~= "" and ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "show" } ) then
			
			local anchor = ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "anchor" } )
			if anchor == ArkInventory.Const.Anchor.Automatic then
				anchor = ArkInventory.LocationOptionGet( loc_id, { "slot", "anchor" } )
				if anchor == ArkInventory.Const.Anchor.TopLeft or anchor == ArkInventory.Const.Anchor.TopRight then
					anchor = ArkInventory.Const.Anchor.Bottom
				else
					anchor = ArkInventory.Const.Anchor.Top
				end
			end
			obj:ClearAllPoints( )
			
			if anchor == ArkInventory.Const.Anchor.Top then
				obj:SetPoint( "TOPLEFT", frame:GetName( ), 4, -4 )
			else
				obj:SetPoint( "BOTTOMLEFT", frame:GetName( ), 4, 4 )
			end
			obj:SetPoint( "RIGHT", frame:GetName( ) )
			
			obj:SetText( txt )
		
			local colour = ArkInventory.LocationOptionGet( loc_id, { "bar", "name", "colour" } )
			obj:SetTextColor( colour.r, colour.g, colour.b )
			
			obj:Show( )
			
		else
		
			obj:Hide( )
			
		end
		
	end

end

function ArkInventory.Frame_Bar_Insert( loc_id, bar_id )
	
	-- move bar data
	local t = { [bar_id] = { } }
	
	for k, v in pairs( ArkInventory.LocationOptionGet( loc_id, { "bar", "data" } ) ) do
		if k >= bar_id then
			t[k + 1] = v
		end
	end
	
	for k, v in pairs( t ) do
		ArkInventory.LocationOptionSet( loc_id, { "bar", "data", k }, v )
	end
	
	
	-- move category data (bar numbers can be negative)
	for cat, bar in pairs( ArkInventory.LocationOptionGet( loc_id, { "category" } ) ) do
		if abs( bar ) >= bar_id then
			if bar > 0 then
				ArkInventory.CategoryLocationSet( loc_id, cat, bar + 1 )
			else
				ArkInventory.CategoryLocationSet( loc_id, cat, bar - 1 )
			end
		end
	end
	
end

function ArkInventory.Frame_Bar_Remove( loc_id, bar_id )
	
	-- move bar data
	local t = { }
	local maxbar = 0
	
	for k, v in pairs( ArkInventory.LocationOptionGet( loc_id, { "bar", "data" } ) ) do
		if k > bar_id then
			t[k - 1] = v
			if k > maxbar then
				maxbar = k
			end
		end
	end
	
	t[maxbar] = { }
	
	for k, v in pairs( t ) do
		ArkInventory.LocationOptionSet( loc_id, { "bar", "data", k }, v )
	end
	
	
	-- move category data (bar numbers can be negative)
	local cat_def = ArkInventory.CategoryGetSystemID( "SYSTEM_DEFAULT" )
	
	for cat, bar in pairs( ArkInventory.LocationOptionGet( loc_id, { "category" } ) ) do
		
		if abs( bar ) > bar_id then
			
			if bar > 0 then
				ArkInventory.CategoryLocationSet( loc_id, cat, bar - 1 )
			else
				ArkInventory.CategoryLocationSet( loc_id, cat, bar + 1 )
			end
			
		elseif abs( bar ) == bar_id then
			
			if cat == cat_def then
				-- if the DEFAULT category was on the bar then move it to bar 1
				ArkInventory.CategoryLocationSet( loc_id, cat, 1 )
			else
				-- erase the location, setting it back to the same as DEFAULT
				ArkInventory.CategoryLocationSet( loc_id, cat, nil )
			end
			
		end
		
	end
	
end

function ArkInventory.Frame_Bar_Move( loc_id, bar1, bar2 )
	
	--ArkInventory.Output( "loc [", loc_id, "], bar1 [", bar1, "], bar2 [", bar2, "]" )
	
	if not bar1 or not bar2 or bar1 == bar2 or bar1 < 1 or bar2 < 1 then return end
	
	local step = 1
	if bar2 < bar1 then
		step = -1
	end
	
	-- move bar data
	local t = { }
	
	for k, v in pairs( ArkInventory.LocationOptionGet( loc_id, { "bar", "data" } ) ) do
		if k == bar1 then
			t[bar2] = v
		elseif ( ( step == 1 ) and ( k > bar1 and k <= bar2 ) ) or ( ( step == -1 ) and ( k >= bar2 and k < bar1 ) ) then
			t[k - step] = v
		end
	end
	
	for k, v in pairs( t ) do
		ArkInventory.LocationOptionSet( loc_id, { "bar", "data", k }, v )
	end
	
	
	-- move category data (bar numbers can be negative)
	for cat, bar in pairs( ArkInventory.LocationOptionGet( loc_id, { "category" } ) ) do
		local z = abs( bar )
		if z == bar1 then
			ArkInventory.CategoryLocationSet( loc_id, cat, bar2 )
		elseif ( ( step == 1 ) and ( z > bar1 and z <= bar2 ) ) or ( ( step == -1 ) and ( z >= bar2 and z < bar1 ) ) then
			if bar > 0 then
				ArkInventory.CategoryLocationSet( loc_id, cat, bar - step )
			else
				ArkInventory.CategoryLocationSet( loc_id, cat, bar + step )
			end
		end
	end
	
end

function ArkInventory.Frame_Bar_Clear( loc_id, bar_id )
	
	-- clear bar data
	table.wipe( ArkInventory.LocationOptionGet( loc_id, { "bar", "data", bar_id } ) )
	
	
	-- clear category
	for k, v in pairs( ArkInventory.LocationOptionGet( loc_id, { "category" } ) ) do
		if v == bar_id then
			local cat_def = ArkInventory.CategoryGetSystemID( "SYSTEM_DEFAULT" )
			if k ~= cat_def then
				-- erase the location, setting it back to the same as DEFAULT
				ArkInventory.CategoryLocationSet( loc_id, k, nil )
			end
		end
	end
	
end

function ArkInventory.Frame_Bar_OnLoad( frame )

	assert( frame, "frame is nil" )

	local framename = frame:GetName( )
	local loc_id, bar_id = strmatch( framename, "^.-(%d+)ContainerBar(%d+)" )

	assert( loc_id, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	assert( bar_id, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	
	frame.ARK_Data = {
		["loc_id"] = tonumber( loc_id ),
		["bar_id"] = tonumber( bar_id ),
	}
	
	frame:SetID( bar_id )
	
	ArkInventory.MediaSetFontFrame( frame )

end


function ArkInventory.Frame_Bag_OnLoad( frame )

	assert( frame, "frame is nil" )

	local framename = frame:GetName( )
	local loc_id, bag_id = strmatch( framename, "^.-(%d+)ContainerBag(%d+)" )
	
	assert( loc_id, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	assert( bag_id, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	
	loc_id = tonumber( loc_id )
	bag_id = tonumber( bag_id )
	--local inv_id = ArkInventory.InventoryIDGet( loc_id, bag_id )
	
	frame.ARK_Data = {
		["loc_id"] = loc_id,
		["bag_id"] = bag_id,
		--["inv_id"] = inv_id,
	}
	
	local bliz_id = ArkInventory.BagID_Blizzard( loc_id, bag_id )
	frame:SetID( bliz_id )
	
	ArkInventory.MediaSetFontFrame( frame )
	
end

function ArkInventory.Frame_Bag_Create( loc_id, bag_id )



end

function ArkInventory.Frame_Item_GetDB( frame )

	--ArkInventory.Output( "frame=[", frame:GetName( ), "]" )
	local loc_id = frame.ARK_Data.loc_id
	local bag_id = frame.ARK_Data.bag_id
	local slot_id = frame.ARK_Data.slot_id
	
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )

	--ArkInventory.Output( "name=[", cp.info.name, "], loc=[", loc_id, "], bag=[", bag_id, "], slot=[", slot_id, "]" )
	
	if slot_id == nil then
		return cp.location[loc_id].bag[bag_id]
	else
		return cp.location[loc_id].bag[bag_id].slot[slot_id]
	end
	
end
	
function ArkInventory.Frame_Item_Update_Texture( frame )
	
	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	local i = ArkInventory.Frame_Item_GetDB( frame )

	if i and i.h then

		-- frame has an item
		frame.hasItem = 1
		
		-- item is readable?
		if loc_id ~= ArkInventory.Const.Location.Vault then
			if ArkInventory.Global.Location[loc_id].isOffline == false then
				frame.readable = i.readable
			end
		else
			frame.readable = nil
		end
		
		-- item texture
		local t = i.texture or ArkInventory.ObjectInfoTexture( i.h )
		local r, g, b = GetItemQualityColor( 0 )
		ArkInventory.SetItemButtonTexture( frame, t, r, g, b )
	
	else
		
		frame.hasItem = nil
		frame.readable = nil
		
		ArkInventory.Frame_Item_Update_Empty( frame )
		
	end

	-- new item indicator
	ArkInventory.Frame_Item_Update_NewIndicator( frame )
	
end

function ArkInventory.Frame_Item_Update_Quest( frame )
	
	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local questTexture = _G[frame:GetName( ) .. "IconQuestTexture"]
	questTexture:Hide( )
	
	local loc_id = frame.ARK_Data.loc_id
	if ArkInventory.Global.Location[loc_id].isOffline then
		return
	end
	
	if not ( loc_id == ArkInventory.Const.Location.Bag or loc_id == ArkInventory.Const.Location.Bank ) then
		return
	end
	
	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	if i and i.h then
		
		local bliz_id = ArkInventory.BagID_Blizzard( loc_id, i.bag_id )
		local isQuestItem, questId, isActive = GetContainerItemQuestInfo( bliz_id, i.slot_id )
		
		if questId and not isActive then
			questTexture:SetTexture( TEXTURE_ITEM_QUEST_BANG )
			questTexture:Show( )
		elseif questId or isQuestItem then
			questTexture:SetTexture( TEXTURE_ITEM_QUEST_BORDER )
			questTexture:Show( )
		end
		
	end
	
end

function ArkInventory.SetItemButtonTexture( frame, texture, r, g, b )
	
	if not frame then
		return
	end
	
	local obj = _G[frame:GetName( ) .. "IconTexture"]
	
	if not obj then
		return
	end
	
	if texture then
		obj:Show( )
	else
		obj:Hide( )
	end
	
	obj:SetTexture( texture or ArkInventory.Const.Texture.Missing )
	obj:SetTexCoord( 0.070, 0.935, 0.070, 0.935 )
	
	if r and g and b then
		obj:SetVertexColor( r, g, b )
	end
	
end

function ArkInventory.SetItemButtonDesaturate( frame, desaturate, r, g, b )

	if not frame then
		return
	end
	
	local obj = _G[frame:GetName( ) .. "IconTexture"]
	
	if not obj then
		return
	end
	
	local shaderSupported = obj:SetDesaturated( desaturate )
	
	if desaturate then
	
		if shaderSupported then
			return
		end
		
		if not r or not g or not b then
			r = 0.5
			g = 0.5
			b = 0.5
		end
		
	else

		if not r or not g or not b then
			r = 1.0
			g = 1.0
			b = 1.0
		end
		
	end
	
	obj:SetVertexColor( r, g, b )
	
end

function ArkInventory.Frame_Item_Update_Count( frame )

	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	if i then
		SetItemButtonCount( frame, i.count )
		--SetItemButtonStock( frame, i.slot_id ) -- display slot number for debugging purposes
	end
	
end

function ArkInventory.Frame_Item_Update_Fade( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	local action = false
	local fade = 1

	if ArkInventory.Global.Location[loc_id].isOffline and ArkInventory.LocationOptionGet( loc_id, { "slot", "offline", "fade" } ) then
		
		fade = 0.6
		
	else
	
		if loc_id == ArkInventory.Const.Location.Vault then
		
			local bag_id = frame.ARK_Data.bag_id
			local canDeposit, numWithdrawals = select( 4, GetGuildBankTabInfo( bag_id ) )
			if not canDeposit and numWithdrawals == 0 then
				fade = 0.6
			end
		
		end
	
	end

	local f = string.lower( strtrim( ArkInventory.Global.Location[loc_id].filter or "" ) )
	if f ~= "" then
		local i = ArkInventory.Frame_Item_GetDB( frame ) or { }
		local n = string.lower( select( 3, ArkInventory.ObjectInfo( i.h ) ) or "" )
		if not string.find( n, strtrim( f ) ) then
			-- drop fade to 0.2 for all non matching items
			fade = 0.2
		end
	end
	
	frame:SetAlpha( fade )
	
end

function ArkInventory.Frame_Item_Update_Border( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	
	local obj = _G[frame:GetName( ) .. "ArkBorder"]
	if obj then
		
		if ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "style" } ) ~= ArkInventory.Const.Texture.BorderNone then
			
			local style = ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "style" } ) or ArkInventory.Const.Texture.BorderDefault
			local file = ArkInventory.Lib.SharedMedia:Fetch( ArkInventory.Lib.SharedMedia.MediaType.BORDER, style )
			local size = ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "size" } ) or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size
			local offset = ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "offset" } ) or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offset
			local scale = ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "scale" } ) or 1
			
			-- border colour
			local i = ArkInventory.Frame_Item_GetDB( frame )
			
			local r, g, b = GetItemQualityColor( 0 )
			local a = 0.6
			
			if i and i.h then
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				if ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "rarity" } ) then
					if ( i.q or 0 ) >= ( ArkInventory.LocationOptionGet( loc_id, { "slot", "border", "raritycutoff" } ) or 0 ) then
						r, g, b = GetItemQualityColor( i.q or 0 )
						a = 1
					end
				end
				
			else
				
				if ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "border" } ) then
					
					-- slot colour
					local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
					local bag_id = frame.ARK_Data.bag_id
					local bt = cp.location[loc_id].bag[bag_id].type
					local c = ArkInventory.LocationOptionGet( loc_id, { "slot", "data", bt, "colour" } )
					r, g, b = c.r, c.g, c.b
					
				end
			
			end
			
			ArkInventory.Frame_Border_Paint( obj, true, file, size, offset, scale, r, g, b, a )
			
			obj:Show( )
			
		else
		
			obj:Hide( )
			
		end
		
	end
	
end

function ArkInventory.Frame_Item_Update_NewIndicator( frame )
	
	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local framename = frame:GetName( )
	
	local obj_name = "ArkNewText"
	local obj = _G[framename .. obj_name]
	assert( obj, string.format( "xml element '%s' is missing the sub element %s", framename, obj_name ) )
	
	local loc_id = frame.ARK_Data.loc_id
	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	if i and i.h and ArkInventory.LocationOptionGet( loc_id, { "slot", "new", "show" } ) then
		
		--[[
		if i.new == ArkInventory.Const.Slot.New.No then
			obj:Hide( )
		elseif i.new == ArkInventory.Const.Slot.New.Yes then
			obj:SetText( ArkInventory.Localise["NEW"] )
			obj:Show( )
		elseif i.new == ArkInventory.Const.Slot.New.Inc then
			obj:SetText( ArkInventory.Localise["NEW_ITEM_INCREASE"] )
			obj:Show( )
		elseif i.new == ArkInventory.Const.Slot.New.Dec then
			obj:SetText( ArkInventory.Localise["NEW_ITEM_DECREASE"] )
			obj:Show( )
		end
		]]--
		
		local cutoff = ArkInventory.LocationOptionGet( loc_id, { "slot", "new", "cutoff" } )
		local age, age_text = ArkInventory.ItemAgeGet( i.age )
		
		if age and ( cutoff == 0 or age <= cutoff * 60 ) then
			local colour = ArkInventory.LocationOptionGet( loc_id, { "slot", "new", "colour" } )
			obj:SetText( age_text )
			obj:SetTextColor( colour.r, colour.g, colour.b )
			obj:Show( )
		else
			obj:Hide( )
		end
		
	else
		obj:Hide( )
	end
	
end

function ArkInventory.Frame_Item_Update_Empty( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	local bag_id = frame.ARK_Data.bag_id
	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	if i and not i.h then
	
		local bt = cp.location[loc_id].bag[bag_id].type
	
		-- slot background
		if ArkInventory.LocationOptionGet( loc_id, { "slot", "empty", "icon" } ) then
		
			-- icon
			local texture = ArkInventory.Const.Slot.Data[bt].texture or ArkInventory.Const.Texture.Empty.Item
			
			-- wearing empty slot icons
			if loc_id == ArkInventory.Const.Location.Wearing then
				local a, b = GetInventorySlotInfo( ArkInventory.Const.InventorySlotName[i.slot_id] )
				--ArkInventory.Output( "id=[", i.slot_id, "], name=[", ArkInventory.Const.InventorySlotName[i.slot_id], "], texture=[", b, "]" )
				texture = b
			end
			
			ArkInventory.SetItemButtonTexture( frame, texture, 1.0, 1.0, 1.0 )
			
		else
			
			-- solid colour
			local colour = ArkInventory.LocationOptionGet( loc_id, { "slot", "data", bt, "colour" } )
			--ArkInventory.SetItemButtonTexture( frame, [[Interface\Buttons\WHITE8X8]], colour.r * 0.25, colour.g * 0.25, colour.b * 0.25 )
			ArkInventory.SetItemButtonTexture( frame, [[Interface\Buttons\WHITE8X8]], colour.r, colour.g, colour.b )
			
		end
		
	end
	
end
	
function ArkInventory.Frame_Item_Empty_Paint_All( )

	for loc_id, loc_data in ipairs( ArkInventory.Global.Location ) do
	
		for bag_id in pairs( loc_data.Bags ) do
		
			for slot_id = 1, ArkInventory.Global.Location[loc_id].maxSlot[bag_id] or 0 do
			
				local s = _G[ArkInventory.ContainerItemNameGet( loc_id, bag_id, slot_id )]
				if s then
					ArkInventory.Frame_Item_Update_Empty( s )
					ArkInventory.Frame_Item_Update_Border( s )
				end
				
			end
			
		end
		
	end
	
end

function ArkInventory.Frame_Item_OnEnter( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	if not ArkInventory.db.global.option.tooltip.show then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	local bag_id = frame.ARK_Data.bag_id
	local bliz_id = ArkInventory.BagID_Blizzard( loc_id, bag_id )
	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	
	--ArkInventory.Output( "item=[", i.h, "]" )
	local usedmycode = false
	
	if ArkInventory.Global.Mode.Edit or ArkInventory.Global.Location[loc_id].isOffline or bliz_id == BANK_CONTAINER or bliz_id == KEYRING_CONTAINER or loc_id == ArkInventory.Const.Location.Vault or loc_id == ArkInventory.Const.Location.Wearing or loc_id == ArkInventory.Const.Location.Mail or loc_id == ArkInventory.Const.Location.Pet or loc_id == ArkInventory.Const.Location.Mount or loc_id == ArkInventory.Const.Location.Token then

		usedmycode = true -- edit mode, offline, bank, keyring, vault, mail, pet, token
		
		if i.h then
	
			ArkInventory.GameTooltipSetPosition( frame )

			if loc_id == ArkInventory.Const.Location.Mail then

				GameTooltip:SetHyperlink( i.h )
				
				local daysLeft = 0
				if i.dl then
				
					GameTooltip:AddLine( dl, 0, 1, 0 )
				
--[[					if i.dl >= 1 then
						daysLeft = TIME_REMAINING .. " " .. floor(i.dl) .. " " .. GetText("DAYS_ABBR", nil, floor(i.dl))
						GameTooltip:AddLine( daysLeft, 0, 1, 0 )
					else
						daysLeft = TIME_REMAINING .. " " .. SecondsToTime(floor(i.dl * 24 * 60 * 60))
						GameTooltip:AddLine( daysLeft, 1, 0, 0 )
					end
	]]--				
				end
				
			elseif loc_id == ArkInventory.Const.Location.Pet or loc_id == ArkInventory.Const.Location.Mount then
			
				GameTooltip:SetHyperlink( i.h )
			
			elseif loc_id == ArkInventory.Const.Location.Token then
			
				ArkInventory.GameTooltipSetToken( frame, i.h, i.count )
			
			elseif loc_id == ArkInventory.Const.Location.Wearing then
			
				GameTooltip:SetHyperlink( i.h )
				
			elseif ArkInventory.Global.Mode.Edit or ArkInventory.Global.Location[loc_id].isOffline then
				
				GameTooltip:SetHyperlink( i.h )
				
				
	-- online options
				
			elseif bliz_id == BANK_CONTAINER then
				
				GameTooltip:SetInventoryItem( "player", BankButtonIDToInvSlotID( i.slot_id ) )

			elseif bliz_id == KEYRING_CONTAINER then
			
				GameTooltip:SetInventoryItem( "player", KeyRingButtonIDToInvSlotID( i.slot_id ) )
				
			elseif loc_id == ArkInventory.Const.Location.Vault then
			
				local tab_id = i.bag_id
				
				local _, _, isViewable = GetGuildBankTabInfo( tab_id )

				if isViewable then
					GameTooltip:SetGuildBankItem( tab_id, i.slot_id )
				else
					GameTooltip:SetHyperlink( i.h )
				end

			else
			
				assert( false, "uncoded value to build tooltip " )
				
			end
			

			if IsModifiedClick( "CHATLINK" ) then
				GameTooltip_ShowCompareItem( )
			elseif IsModifiedClick( "DRESSUP" ) then
				ShowInspectCursor( )
			elseif frame.readable then
				ShowInspectCursor( )
			else
				ResetCursor( )
			end
			
			CursorUpdate( frame )
			
		end

	end
	
	if not usedmycode then
		ContainerFrameItemButton_OnEnter( frame )
	end

end

function ArkInventory.Frame_Item_OnDrag( frame )
	
	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	local usedmycode = false
	
	
	
	if SpellIsTargeting( ) or ArkInventory.Global.Location[loc_id].isOffline or ArkInventory.Global.Mode.Edit then
	
		usedmycode = true
		-- do not drag / drag disabled
		
	end

	if not usedmycode then
		ContainerFrameItemButton_OnClick( frame, "LeftButton" )
	end

end

function ArkInventory.Frame_Item_OnMouseUp( frame, arg1 )
	
	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	if ArkInventory.Global.Location[loc_id].isOffline or ArkInventory.Global.Mode.Edit then
		
		if IsModifierKeyDown( ) then
			
			if i.h then
				HandleModifiedItemClick( i.h )
			end
			
		else
			
			if ArkInventory.Global.Mode.Edit then
				ArkInventory.MenuItemOpen( frame )
			end
			
		end
		
	end
	
end

function ArkInventory.Frame_Item_Update_Cooldown( frame, arg1 )

	-- triggered when a cooldown is first started
	-- used to hide/show the cooldown frame when offline and tint unuseable items
	
	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	if i and ( arg1 == nil or arg1 == i.bag_id ) then
	
		local framename = frame:GetName( )
		local obj_name = "Cooldown"
		local obj = _G[framename .. obj_name]
		assert( obj, string.format( "xml element '%s' is missing the sub element %s", framename, obj_name ) )
		
		if ArkInventory.Global.Location[loc_id].isOffline then
			SetItemButtonTextureVertexColor( frame, 1, 1, 1 )
			obj:Hide( )
			return
		end
		
		if not ArkInventory.LocationOptionGet( loc_id, { "slot", "cooldown", "show" } ) then
			obj:Hide( )
			return
		end
		
		if i.h then
			
			local bliz_id = ArkInventory.BagID_Blizzard( loc_id, i.bag_id )
			ContainerFrame_UpdateCooldown( bliz_id, frame )
			
		else
			
			obj:Hide( )
			
		end
		
	end
	
end

function ArkInventory.Frame_Item_Update_Lock( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	if ArkInventory.Global.Location[loc_id].isOffline then
		return
	end
	
	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	if i and i.h then
		
		local locked = false
		local readable = false
		local quality = nil
		
		if loc_id == ArkInventory.Const.Location.Vault then
			locked = select( 3, GetGuildBankItemInfo( i.bag_id, i.slot_id ) )
		else
			local bliz_id = ArkInventory.BagID_Blizzard( loc_id, i.bag_id )
			locked, quality, readable = select( 3, GetContainerItemInfo( bliz_id, i.slot_id ) )
		end
		
		
		local use = true
		
		if ArkInventory.LocationOptionGet( loc_id, { "slot", "unusable", "tint" } ) then
			ArkInventory.TooltipSetHyperlink( ArkInventory.Global.Tooltip.Vendor, i.h )
			use = ArkInventory.TooltipCanUse( ArkInventory.Global.Tooltip.Vendor )
		end
		
		--ArkInventory.Output( "slot[", i.slot_id, "] locked[", locked or 0, "], use[", use or false, "]" )
		
		if use then
			ArkInventory.SetItemButtonDesaturate( frame, locked )
		else
			ArkInventory.SetItemButtonDesaturate( frame, locked, 1.0, 0.1, 0.1 )
		end
		
		
		frame.locked = locked
		frame.readable = readable
		
	else
		
		frame.locked = false
		frame.readable = false
		
	end

end

function ArkInventory.Frame_Item_Update_Clickable( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	
	local action = false

	if ArkInventory.Global.Mode.Edit
	or ArkInventory.Global.Location[loc_id].isOffline 
	or loc_id == ArkInventory.Const.Location.Wearing
	or loc_id == ArkInventory.Const.Location.Mail
	or loc_id == ArkInventory.Const.Location.Token then
		
		action = true
		
	else
		
		if frame.ARK_Data.loc_id == ArkInventory.Const.Location.Vault then
		
			local bag_id = frame.ARK_Data.bag_id
			local _, _, _, canDeposit, numWithdrawals = GetGuildBankTabInfo( bag_id )
			if not canDeposit and numWithdrawals == 0 then
				action = true
			end
		
		end
	
	end
	

	if action then
		-- disable clicks/drag when in edit mode or offline
		frame:RegisterForClicks( )
		frame:RegisterForDrag( )
	else
		frame:RegisterForClicks( "LeftButtonUp", "RightButtonUp" )
		frame:RegisterForDrag( "LeftButton" )
	end
	
end
	
function ArkInventory.Frame_Item_OnLoad( frame )

	local framename = frame:GetName( )
	--ArkInventory.Output( "OnLoad( ", framename, " ]" )
	
	local loc_id, bag_id, slot_id = strmatch( framename, "^.-(%d+)ContainerBag(%d+)Item(%d+)" )
	
	assert( loc_id, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	assert( bag_id, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	assert( slot_id, string.format( "xml element '%s' is not an %s frame", framename, ArkInventory.Const.Program.Name ) )
	
	loc_id = tonumber( loc_id )
	bag_id = tonumber( bag_id )
	slot_id = tonumber( slot_id )

	frame:SetID( slot_id )
	
	--local bag_id = ArkInventory.BagID_Blizzard( loc_id, bag_id )
	--ArkInventory.Output( "loc=[", loc_id, "], int=[", bag_id, "], slot=[", slot_id, "], bag=[", bag_id, "]" )
	
	frame.ARK_Data = {
		["loc_id"] = loc_id,
		["bag_id"] = bag_id,
		["slot_id"] = slot_id,
	}
	
	ContainerFrameItemButton_OnLoad( frame )
	
	local obj = _G[framename .. "Count"]
	if obj ~= nil then
		obj:SetPoint( "BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 2 )
		obj:SetPoint( "LEFT", frame, "LEFT", 0, 0 )
	end
	
	frame.UpdateTooltip = ArkInventory.Frame_Item_OnEnter
	
	frame.locked = false
	
	if loc_id == ArkInventory.Const.Location.Vault then
		
		-- replace the split function
		frame.SplitStack = function( button, split )
			local tab_id = frame.ARK_Data.bag_id
			local slot_id = frame.ARK_Data.slot_id
			SplitGuildBankItem( tab_id, slot_id, split )
		end
		
	end
	
	ArkInventory.MediaSetFontFrame( frame )
	
end

function ArkInventory.Frame_Pet_Item_OnClick( frame, button )
	
	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	if IsModifiedClick( "CHATLINK" ) then
		
		ChatEdit_InsertLink( i.h )
		
	else
		
		if not ArkInventory.Global.Location[loc_id].isOffline or not ArkInventory.Global.Mode.Edit then
		
			local creatureID, creatureName, spellID, icon, active = GetCompanionInfo( i.type, i.slot_id )
			
			if active then
				DismissCompanion( i.type )
				PlaySound( "igMainMenuOptionCheckBoxOn" )
			else
				CallCompanion( i.type, i.slot_id )
				PlaySound( "igMainMenuOptionCheckBoxOff" )
			end
			
		end
		
	end

end

function ArkInventory.Frame_Pet_Item_OnDrag( frame )
	
	if ArkInventory.Global.Mode.Edit then
		return
	end
	
	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	local i = ArkInventory.Frame_Item_GetDB( frame )
	
	if not ArkInventory.Global.Location[loc_id].isOffline then
		PickupCompanion( i.type, i.slot_id )
	end
	
end

function ArkInventory.Frame_Item_Update( loc_id, bag_id, slot_id )
	
	local framename = ArkInventory.ContainerItemNameGet( loc_id, bag_id, slot_id )	
	local frame = _G[framename]
	
	if frame and not ArkInventory.Global.Location[loc_id].isOffline then
		ArkInventory.Frame_Item_Update_Border( frame )
		ArkInventory.Frame_Item_Update_Fade( frame )
		ArkInventory.Frame_Item_Update_Count( frame )
		ArkInventory.Frame_Item_Update_Texture( frame )
		ArkInventory.Frame_Item_Update_Quest( frame )
		ArkInventory.Frame_Item_Update_Cooldown( frame )
		ArkInventory.Frame_Item_Update_Lock( frame )
	end
	
end

function ArkInventory.Frame_Status_Update( frame )

	local loc_id = frame.ARK_Data.loc_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
	-- hide the status window if it's not needed
	local obj = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Status.Name]
	if ArkInventory.LocationOptionGet( loc_id, { "status", "hide" } ) then
		obj:Hide( )
		obj:SetHeight( 3 )
		return
	else
		obj:SetHeight( ArkInventory.Const.Frame.Status.Height )
		obj:Show( )
	end

	
	-- update money
	local moneyFrameName = obj:GetName( ) .. "Gold"
	local moneyFrame = _G[moneyFrameName]
	assert( moneyFrame, "moneyframe is nil" )
	
	if ArkInventory.Global.Location[loc_id].isOffline then
		ArkInventory.MoneyFrame_SetType( moneyFrame, "STATIC" )
		MoneyFrame_Update( moneyFrameName, cp.info.money )
		SetMoneyFrameColor( moneyFrameName, 0.75, 0.75, 0.75 )
	else
		SetMoneyFrameColor( moneyFrameName, 1, 1, 1 )
		if loc_id == ArkInventory.Const.Location.Vault then
			ArkInventory.MoneyFrame_SetType( moneyFrame, "GUILDBANK" )
		else
			ArkInventory.MoneyFrame_SetType( moneyFrame, "PLAYER" )
		end
	end
	
	
	-- update the empty slot count
	local obj = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Status.Name .. "EmptyText"]
	if obj then
		if ArkInventory.LocationOptionGetReal( loc_id, { "status", "emptytext", "show" } ) then
			local y = ArkInventory.Frame_Status_Update_Empty( loc_id, cp )
			obj:SetText( y )
		else
			obj:SetText( "" )
		end
	end
	
	
	-- update currency tracking
	ArkInventory.Frame_Status_Update_Tracking( loc_id )
	
end

function ArkInventory.Frame_Status_Update_Empty( loc_id, cp, ldb )

	-- build the empty slot count status string
	
	local empty = { }
	local bags = cp.location[loc_id].bag
	
	for k, bag in pairs( bags ) do
	
		if not empty[bag.type] then
			empty[bag.type] = { ["count"] = 0, ["empty"] = 0, ["type"] = bag.type }
		end
		
		if bag.status == ArkInventory.Const.Bag.Status.Active then
			empty[bag.type].count = empty[bag.type].count + bag.count
			empty[bag.type].empty = empty[bag.type].empty + bag.empty
			--ArkInventory.Output( "k=[", k, "] t=[", bag.type, "] c=[", bag.count, "]" )
		end
		
	end
	
	local ee = ArkInventory.Table.Sum( empty, function( a ) return a.empty end )
	local ts = cp.location[loc_id].slot_count
	
	local y = { }
	
	if ts == 0 then
		
		table.insert( y, RED_FONT_COLOR_CODE .. ArkInventory.Localise["STATUS_NO_DATA"] )
		
	else
		
		for t, e in ArkInventory.spairs( empty, function(a,b) return empty[a].type < empty[b].type end ) do
			
			local c = "|cffffffff"
			local n = " " .. ArkInventory.Const.Slot.Data[t].name
			
			if ldb then
				
				if ArkInventory.db.char.option.ldb.bags.colour then
					c = ArkInventory.LocationOptionGet( loc_id, { "slot", "data", t, "colour" } )
					c = ArkInventory.ColourRGBtoCode( c.r, c.g, c.b )
				end
				
				if not ArkInventory.db.char.option.ldb.bags.includetype then
					n = ""
				end
				
				if ArkInventory.db.char.option.ldb.bags.full then
					table.insert( y, string.format( "%s%i/%i%s%s", c, e.count - e.empty, e.count, n, FONT_COLOR_CODE_CLOSE ) )
				else
					table.insert( y, string.format( "%s%i%s%s", c, e.empty, n, FONT_COLOR_CODE_CLOSE ) )
				end
				
			else
			
				if ArkInventory.LocationOptionGet( loc_id, { "status", "emptytext", "colour" } ) then
					c = ArkInventory.LocationOptionGet( loc_id, { "slot", "data", t, "colour" } )
					c = ArkInventory.ColourRGBtoCode( c.r, c.g, c.b )
				end
				
				if not ArkInventory.LocationOptionGet( loc_id, { "status", "emptytext", "includetype" } ) then
					n = ""
				end
				
				if ArkInventory.LocationOptionGet( loc_id, { "status", "emptytext", "full" } ) then
					table.insert( y, string.format( "%s%i/%i%s%s", c, e.count - e.empty, e.count, n, FONT_COLOR_CODE_CLOSE ) )
				else
					table.insert( y, string.format( "%s%i%s%s", c, e.empty, n, FONT_COLOR_CODE_CLOSE ) )
				end
				
			end
			
		end
		
	end
	
	return "|cfff9f9f9" .. table.concat( y, ", " )

end

function ArkInventory.Frame_Status_Update_Tracking( loc_id )
	
	if loc_id and loc_id  ~= ArkInventory.Const.Location.Bag then
		return
	end
	
	local frame = ArkInventory.Frame_Main_Get( ArkInventory.Const.Location.Bag )
	frame = _G[frame:GetName( ) .. ArkInventory.Const.Frame.Status.Name]
	
	if not frame:IsVisible( ) then return end
	
	for i = 1, MAX_WATCHED_TOKENS do
		
		local t = _G[frame:GetName( ) .. "TrackingIcon" .. i]
		local c = _G[frame:GetName( ) .. "TrackingCount" .. i]
		local d = _G[frame:GetName( ) .. "TrackingData" .. i]
		
		local name, count, currencyType, icon, item = GetBackpackCurrencyInfo( i )
		
		if name then
			
			if currencyType == 1 then
				icon = [[Interface\PVPFrame\PVP-ArenaPoints-Icon]]
			elseif currencyType == 2 then
				local factionGroup = UnitFactionGroup( "player" )
				if factionGroup then
					icon = [[Interface\PVPFrame\PVP-Currency-]] .. factionGroup
				end
			end
			
			t:SetTexture( icon )
			t:Show( )
			
			c:SetText( string.format( "%s", count ) )
			c:Show( )
			
			d.item = select( 2, GetItemInfo( item ) )
			d:Show( )
			--ArkInventory.Output( i, " = ", d.item, " ", type( d.item ) )
			
		else
			
			t:Hide( )
			
			c:Hide( )
			
			d.item = nil
			d:Hide( )
			
		end
		
	end
	
end

function ArkInventory.Frame_Vault_Item_OnClick( frame, arg1 )
	
	--ArkInventory.Output( "OnClick( ", frame:GetName( ), ", ", arg1, " )" )
	
	if frame.ARK_Data.loc_id == ArkInventory.Const.Location.Vault then
	
		local loc_id = frame.ARK_Data.loc_id
		local tab_id = frame.ARK_Data.bag_id
		local slot_id = frame.ARK_Data.slot_id
		
		if HandleModifiedItemClick( GetGuildBankItemLink( tab_id, slot_id ) ) then
			return
		end
		
		if IsModifiedClick( "SPLITSTACK" ) then
			if not frame.locked then
				OpenStackSplitFrame( frame.count, frame, "BOTTOMLEFT", "TOPLEFT")
			end
			return
		end
		
		local infoType, info1, info2 = GetCursorInfo( )
		if infoType == "money" then
			DepositGuildBankMoney( info1 )
			ClearCursor( )
		elseif infoType == "guildbankmoney" then
			DropCursorMoney( )
			ClearCursor( )
		else
			if arg1 == "RightButton" then
				AutoStoreGuildBankItem( tab_id, slot_id )
			else
				PickupGuildBankItem( tab_id, slot_id )
			end
		end

	end

end

function ArkInventory.Frame_Changer_Update( loc_id )

	if loc_id == ArkInventory.Const.Location.Bag then
	
		for bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do
		
			local frame = _G[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Changer.Name .. "WindowBag" .. bag_id]
	
			if bag_id == 1 then
				ArkInventory.Frame_Changer_Primary_Update( frame )
			else
				ArkInventory.Frame_Changer_Secondary_Update( frame )
			end
			
		end
		
	elseif loc_id == ArkInventory.Const.Location.Bank then
	
		ArkInventory.Frame_Changer_Update_Bank( )
		
	elseif loc_id == ArkInventory.Const.Location.Vault then
	
		ArkInventory.Frame_Changer_Update_Vault( )
		
	end
	
	
	local frame = _G[ArkInventory.Const.Frame.Main.Name .. loc_id]
	ArkInventory.Frame_Status_Update( frame )
	
end

function ArkInventory.Frame_Changer_Primary_OnLoad( frame )

	-- bag & bank

	local framename = frame:GetName( )
	local loc_id, bag_id = strmatch( framename, "^" .. ArkInventory.Const.Frame.Main.Name .. "(%d+).-(%d+)$" )
	
	loc_id = tonumber( loc_id )
	bag_id = tonumber( bag_id )
	
	frame.ARK_Data = {
		["loc_id"] = tonumber( loc_id ),
		["bag_id"] = tonumber( bag_id ),
	}

	frame:RegisterForClicks( "LeftButtonUp", "RightButtonUp" )
	
	ArkInventory.SetItemButtonTexture( frame, ArkInventory.Global.Location[loc_id].Texture )
	
	local obj = _G[framename .. "Count"]
	if obj ~= nil then
		obj:SetPoint( "BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 2 )
		obj:SetPoint( "LEFT", frame, "LEFT", 0, 0 )
	end

	local obj = _G[framename .. "Stock"]
	if obj ~= nil then
		obj:SetPoint( "TOPLEFT", frame, "TOPLEFT", 0, -2 )
		obj:SetPoint( "RIGHT", frame, "RIGHT", 0, 0 )
	end
	
	frame.ignoreTexture:Hide( )
	
end

function ArkInventory.Frame_Changer_Primary_Update( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	local bag_id = frame.ARK_Data.bag_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )

	ArkInventory.Frame_Item_Update_Fade( frame )
	
	ArkInventory.Frame_Item_Update_Border( frame )
	
	if ArkInventory.db.realm.player.data[cp.info.player_id].display[loc_id].bag[bag_id] == false then
		SetItemButtonTextureVertexColor( frame, 1.0, 0.1, 0.1 )
	else
		SetItemButtonTextureVertexColor( frame, 1.0, 1.0, 1.0 )
	end
	
	local bag = cp.location[loc_id].bag[bag_id]
	
	SetItemButtonCount( frame, bag.count )
	
	if bag.status == ArkInventory.Const.Bag.Status.Active then
		ArkInventory.SetItemButtonStock( frame, bag.empty )
	else
		ArkInventory.SetItemButtonStock( frame, nil, bag.status )
	end

end

function ArkInventory.Frame_Changer_Primary_OnClick( frame, button )

	local loc_id = frame.ARK_Data.loc_id
	
	--ArkInventory.Output( "primary frame=[", frame:GetName( ), "], button=[", button, "]" )

	
	if loc_id == ArkInventory.Const.Location.Bag then
		
		if button == nil then
			-- drag receive
			if not ArkInventory.Global.Location[loc_id].isOffline then
				PutItemInBackpack( )
			end
		elseif button == "RightButton" then
			ArkInventory.MenuBagOpen( frame )
		elseif button == "LeftButton" then
			if not ArkInventory.Global.Location[loc_id].isOffline and CursorHasItem( ) then
				PutItemInBackpack( )
			end
		end

	elseif loc_id == ArkInventory.Const.Location.Bank then
		
		if button == nil then
			if not ArkInventory.Global.Location[loc_id].isOffline then
				ArkInventory.PutItemInBank( )
			end
		elseif button == "RightButton" then
			ArkInventory.MenuBagOpen( frame )
		elseif button == "LeftButton" then
			if not ArkInventory.Global.Location[loc_id].isOffline and CursorHasItem( ) then
				ArkInventory.PutItemInBank( )
			end
		end

	end
	
end

function ArkInventory.Frame_Changer_Primary_OnEnter( frame )
	
	local loc_id = frame.ARK_Data.loc_id

	local tooltip_text = nil
	
	if loc_id == ArkInventory.Const.Location.Bag then
		tooltip_text = BACKPACK_TOOLTIP
	elseif loc_id == ArkInventory.Const.Location.Bank then
		tooltip_text = ArkInventory.Localise["LOCATION_BANK"]
	end

	
	if tooltip_text ~= nil then
	
		if ArkInventory.db.global.option.tooltip.show then
			ArkInventory.GameTooltipSetText( frame, tooltip_text, nil, nil, nil, true )
		end
		
		ArkInventory.BagHighlight( frame, true )
		
	end
	
end


function ArkInventory.Frame_Changer_Update_Bank( )

	local loc_id = ArkInventory.Const.Location.Bank

	local parent = _G[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Changer.Name .. "Window"]
	
	if not parent:IsVisible( ) then
		return
	end
	
	for x = 1, ArkInventory.Global.Location[loc_id].bagCount do
	
		local frame = _G[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Changer.Name .. "WindowBag" .. x]
		
		if x == 1 then
			ArkInventory.Frame_Changer_Primary_Update( frame )
		else
			ArkInventory.Frame_Changer_Secondary_Update( frame )
		end
		
	end

	local purchaseFrame = _G[parent:GetName( ) .. "PurchaseInfo"]
	
	if ArkInventory.Global.Location[loc_id].isOffline then
		purchaseFrame:Hide( )
		return
	end

	
	-- update blizzards frame as well because the static dialog box uses the data in it
	UpdateBagSlotStatus( )

	-- now mimic that frame
	local moneyFrame = purchaseFrame:GetName( ) .. "DetailMoneyFrame"
	local purchaseButton = _G[purchaseFrame:GetName( ) .. "PurchaseButton"]
	
	local numSlots, full = GetNumBankSlots( )

	-- pass in # of current slots, returns cost of next slot
	local cost = GetBankSlotCost( numSlots )
	
	purchaseFrame.nextSlotCost = cost
	if GetMoney( ) >= cost then
		SetMoneyFrameColor( moneyFrame, 1.0, 1.0, 1.0 )
		purchaseButton:Enable( )
	else
		SetMoneyFrameColor( moneyFrame, 1.0, 0.1, 0.1 )
		purchaseButton:Disable( )
	end
	MoneyFrame_Update( moneyFrame, cost )

	if full then
		purchaseFrame:Hide( )
	else
		purchaseFrame:Show( )
	end
	
end

function ArkInventory.Frame_Changer_Vault_Tab_OnEnter( frame )
	
	if not frame then return end
	
	local loc_id = frame.ARK_Data.loc_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	local bag_id = frame.ARK_Data.bag_id

	if ArkInventory.db.global.option.tooltip.show then
	
		ArkInventory.GameTooltipSetPosition( frame, true )
		
		local bag = cp.location[loc_id].bag[bag_id]
		
		if bag and bag.name then
			GameTooltip:SetText( string.format( ArkInventory.Localise["VAULT_TAB_NAME"], bag_id, bag.name ) )
			GameTooltip:AddLine( string.format( ArkInventory.Localise["VAULT_TAB_ACCESS"], bag.access ) )
			if bag.withdraw then
				GameTooltip:AddLine( string.format( ArkInventory.Localise["VAULT_TAB_REMAINING_WITHDRAWALS"], bag.withdraw ) )
			end
			GameTooltip:Show( )
		else
			GameTooltip:Hide( )
		end
		
		CursorUpdate( frame )
		
	end
	
	--ArkInventory.BagHighlight( frame, true )
	
end

function ArkInventory.Frame_Changer_Vault_Tab_OnLoad( frame )
	ArkInventory.Frame_Changer_Secondary_OnLoad( frame )
	frame.UpdateTooltip = ArkInventory.Frame_Changer_Vault_Tab_OnEnter
end

function ArkInventory.Frame_Changer_Vault_Tab_OnClick( frame, button, mode )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local mode = mode or GuildBankFrame.mode
	
	local loc_id = frame.ARK_Data.loc_id
	local bag_id = frame.ARK_Data.bag_id
	
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	local tab = cp.location[loc_id].bag[bag_id]
	
	if tab.name == nil then
		return
	end
	
	ArkInventory.Frame_Changer_Update( loc_id )
	
	if tab.status ~= ArkInventory.Const.Bag.Status.Purchase then
		
		if button == nil then
		
			-- drag'n'drop (drop)
			
			if not ArkInventory.Global.Location[loc_id].isOffline then
				--ArkInventory.PutItemInGuildBank( tab_id )
			end
	
		elseif button == "RightButton" then
			
			ArkInventory.MenuVaultTabOpen( frame )
			
		elseif button == "LeftButton" then
			
			if mode == GuildBankFrame.mode and bag_id == GetCurrentGuildBankTab( ) then
				return
			end
			
			GuildBankFrame.mode = mode
			SetCurrentGuildBankTab( bag_id )
			
			if ArkInventory.Global.Location[loc_id].isOffline then
				ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
				return
			end
			
			if tab.status == ArkInventory.Const.Bag.Status.NoAccess then
				ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Refresh )
				return
			end
			
			if GuildBankFrame.mode == "bank" then
				
				QueryGuildBankTab( bag_id ) -- fires GUILDBANKBAGSLOTS_CHANGED when data is available
				
			elseif GuildBankFrame.mode == "log" then
				
				QueryGuildBankLog( bag_id ) -- fires GUILDBANKLOG_UPDATE when data is available
				
			elseif GuildBankFrame.mode == "moneylog" then
				
				QueryGuildBankLog( MAX_GUILDBANK_TABS + 1 ) -- fires GUILDBANKLOG_UPDATE when data is available
				
			elseif GuildBankFrame.mode == "tabinfo" then
			
				QueryGuildBankText( bag_id ) -- fires GUILDBANK_UPDATE_TEXT when data is available
				
			end
			
		end
		
	end
	
end

function ArkInventory.Frame_Changer_Update_Vault( )

	local loc_id = ArkInventory.Const.Location.Vault
	local parent = ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Changer.Name .. "Window"
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
	if not _G[parent]:IsVisible( ) then
		return
	end
	
	for bag_id in ipairs( ArkInventory.Global.Location[loc_id].Bags ) do

		if bag_id == GetCurrentGuildBankTab( ) then
			ArkInventory.db.realm.player.data[cp.info.player_id].display[loc_id].bag[bag_id] = true
		else
			ArkInventory.db.realm.player.data[cp.info.player_id].display[loc_id].bag[bag_id] = false
		end

		local frame = _G[parent .. "Bag" .. bag_id]
		ArkInventory.Frame_Changer_Secondary_Update( frame )
		
	end
	
	
	local moneyDeposit = parent .. "GoldTotal"
	local buttonDeposit = parent .. "DepositButton"
	local moneyWithdraw = parent .. "GoldAvailable"
	local buttonWithdraw = parent .. "WithdrawButton"
	
	if ArkInventory.Global.Location[loc_id].isOffline then
	
		_G[moneyDeposit]:Hide( )
		_G[buttonDeposit]:Hide( )
		_G[moneyWithdraw]:Hide( )
		_G[buttonWithdraw]:Hide( )
		
	else

		-- update the guild gold total
		MoneyFrame_Update( moneyDeposit, GetGuildBankMoney( ) )
		_G[moneyDeposit]:Show( )
		_G[buttonDeposit]:Show( )
		_G[moneyWithdraw]:Show( )
		_G[buttonWithdraw]:Show( )
	
		-- update the guild withdrawl amount
		
		if CanWithdrawGuildBankMoney( ) then
	
			local withdrawLimit = GetGuildBankWithdrawMoney( )

			if withdrawLimit < 0 then
				-- no limit, set to full amount
				withdrawLimit = GetGuildBankMoney( )
			end
			
			if withdrawLimit > 0 then
				
				withdrawLimit = min( withdrawLimit, GetGuildBankMoney( ) )
				_G[buttonWithdraw]:Enable( )
				
			else
			
				_G[buttonWithdraw]:Disable( )
				
			end
			
			MoneyFrame_Update( moneyWithdraw, withdrawLimit )
			_G[moneyWithdraw]:Show( )
			
		else
		
			_G[moneyWithdraw]:Hide( )
			_G[buttonWithdraw]:Disable( )
			
		end
		
	end
	
	
	-- purchase frame
	local purchaseFrame = _G[parent .. "PurchaseInfo"]
	
	if ArkInventory.Global.Location[loc_id].isOffline or not IsGuildLeader( ) then
	
		purchaseFrame:Hide( )
	
	else

		moneyFrame = purchaseFrame:GetName( ) .. "DetailMoneyFrame"
		purchaseButton = _G[purchaseFrame:GetName( ) .. "PurchaseButton"]
	
		numSlots = GetNumGuildBankTabs( )
		cost = GetGuildBankTabCost( )
	
		if not cost then
	
			-- all tabs purchased
			purchaseFrame:Hide( )
		
		else
	
			if GetMoney( ) >= cost then
				SetMoneyFrameColor( moneyFrame, 1.0, 1.0, 1.0 )
				purchaseButton:Enable( )
			else
				SetMoneyFrameColor( moneyFrame, 1.0, 0.1, 0.1 )
				purchaseButton:Disable( )
			end
			
			MoneyFrame_Update( moneyFrame, cost )
			purchaseFrame:Show( )
	
		end
		
	end
	
end


function ArkInventory.Frame_Changer_Secondary_OnLoad( frame )

	local framename = frame:GetName( )
	
	local loc_id, bag_id = strmatch( framename, "^" .. ArkInventory.Const.Frame.Main.Name .. "(%d+).-(%d+)$" )
	
	loc_id = tonumber( loc_id )
	bag_id = tonumber( bag_id )
	--local inv_id = ArkInventory.InventoryIDGet( loc_id, bag_id )
	
	frame.ARK_Data = {
		["loc_id"] = loc_id,
		["bag_id"] = bag_id,
		--["inv_id"] = inv_id,
	}
	
	frame.locked = nil
	
	frame:RegisterForClicks( "LeftButtonUp", "RightButtonUp" )
	frame:RegisterForDrag( "LeftButton" )

	ArkInventory.SetItemButtonTexture( frame, ArkInventory.Const.Texture.Empty.Bag )

	local obj = _G[framename .. "Count"]
	if obj ~= nil then
		obj:SetPoint( "BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 2 )
		obj:SetPoint( "LEFT", frame, "LEFT", 0, 0 )
	end

	local obj = _G[framename .. "Stock"]
	if obj ~= nil then
		obj:SetPoint( "TOPLEFT", frame, "TOPLEFT", 0, -2 )
		obj:SetPoint( "RIGHT", frame, "RIGHT", 0, 0 )
	end
	
	frame.ignoreTexture:Hide( )
	
end

function ArkInventory.Frame_Changer_Secondary_OnClick( frame, button )
	
	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	
	if IsModifiedClick( "CHATLINK" ) then
	
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		local bag_id = frame.ARK_Data.bag_id
		
		local bag = cp.location[loc_id].bag[bag_id]
	
		if not bag or bag.count == 0 then
		
			-- empty slot, do nothing for the chatlink
			
		else
			
			if bag.h then
				ChatEdit_InsertLink( bag.h )
			end
			
		end
			
	else
	
		if button == nil then
			
		elseif button == "RightButton" then
		
			ArkInventory.MenuBagOpen( frame )
			
		elseif button == "LeftButton" then
			
			if ArkInventory.Global.Location[loc_id].isOffline then
				return
			end
			
			local bag_id = frame.ARK_Data.bag_id
			local inv_id = ArkInventory.InventoryIDGet( loc_id, bag_id )
			
			if CursorHasItem( ) then
			
				if PutItemInBag( inv_id ) then
					return
				end
				
			else
			
				ArkInventory.Frame_Changer_Secondary_OnDragStart( frame )
				
			end
			
		end
		
	end
	
end

function ArkInventory.Frame_Changer_Secondary_OnDragStart( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	
	if ArkInventory.Global.Location[loc_id].isOffline then
		return
	end
	
	if loc_id == ArkInventory.Const.Location.Vault then
		return
	end
	
	local bag_id = frame.ARK_Data.bag_id
	local inv_id = ArkInventory.InventoryIDGet( loc_id, bag_id )
	PickupBagFromSlot( inv_id )
	PlaySound( "BAGMENUBUTTONPRESS" )
	
end

function ArkInventory.Frame_Changer_Secondary_OnReceiveDrag( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end

	local loc_id = frame.ARK_Data.loc_id
	
	if ArkInventory.Global.Location[loc_id].isOffline then
		return
	end
	
	ArkInventory.Frame_Changer_Secondary_OnClick( frame )
	
end

function ArkInventory.Frame_Changer_Secondary_OnEnter( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	local bag_id = frame.ARK_Data.bag_id
	local inv_id = ArkInventory.InventoryIDGet( loc_id, bag_id )

	if ArkInventory.db.global.option.tooltip.show then
	
		ArkInventory.GameTooltipSetPosition( frame, true )
	
		if ArkInventory.Global.Location[loc_id].isOffline then
	
			local b = cp.location[loc_id].bag[bag_id]
	
			if not b or b.count == 0 then
				-- empty slot, do nothing for the tooltip
			else
		
				if b.h then
					GameTooltip:SetHyperlink( b.h )
				else
					GameTooltip:SetText( ArkInventory.Localise["STATUS_NO_DATA"], 1.0, 1.0, 1.0 )
				end
			
			end
		
		else
		
			GameTooltip:SetInventoryItem( "player", inv_id )
		
		end
	
		CursorUpdate( frame )
	
	end
	
	ArkInventory.BagHighlight( frame, true )
	
end

function ArkInventory.Frame_Changer_Secondary_Update( frame )

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	local loc_id = frame.ARK_Data.loc_id
	local bag_id = frame.ARK_Data.bag_id
	local slot_id = frame.ARK_Data.slot_id
	
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	local bag = cp.location[loc_id].bag[bag_id]
	
	--ArkInventory.Output( "who[", cp.player.name, "].loc[", loc_id, "].bag[", bag_id, "]" )
	
	if bag.count > 0 then
		
		frame.size = bag.count or 0
		ArkInventory.SetItemButtonTexture( frame, bag.texture )
		SetItemButtonCount( frame, frame.size )
		
	else
		
		frame.size = 0
		ArkInventory.SetItemButtonTexture( frame, bag.texture or ArkInventory.Const.Texture.Empty.Bag )
		SetItemButtonCount( frame, frame.size )
		
	end
	
	if bag.status == ArkInventory.Const.Bag.Status.Active then
		ArkInventory.SetItemButtonStock( frame, bag.empty )
	else
		ArkInventory.SetItemButtonStock( frame, nil, bag.status )
	end
	
	ArkInventory.Frame_Item_Update_Fade( frame )
	
	ArkInventory.Frame_Item_Update_Border( frame )
	
	if ArkInventory.db.realm.player.data[cp.info.player_id].display[loc_id].bag[bag_id] == false then
		SetItemButtonTextureVertexColor( frame, 1.0, 0.1, 0.1 )
	else
		if bag.status == ArkInventory.Const.Bag.Status.Purchase then
			SetItemButtonTextureVertexColor( frame, 1.0, 0.1, 0.1 )
		else
			SetItemButtonTextureVertexColor( frame, 1.0, 1.0, 1.0 )
		end
	end

end

function ArkInventory.Frame_Changer_Secondary_Update_Lock( loc_id, bag_id )

	local frame = _G[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Changer.Name .. "WindowBag" .. bag_id]
	if not frame then
		return
	end

	if ArkInventory.ValidFrame( frame, true ) == false then
		return
	end
	
	if ArkInventory.Global.Location[loc_id].isOffline then
		return
	end
	
	if ArkInventory.Global.Me.location[loc_id].bag[bag_id].h then
	
		local inv_id = ArkInventory.InventoryIDGet( loc_id, bag_id )
		local locked = IsInventoryItemLocked( inv_id )
		ArkInventory.SetItemButtonDesaturate( frame, locked )
		frame.locked = locked
	
	else
	
		frame.locked = false
	
	end

end

function ArkInventory.Frame_Changer_Generic_OnLeave( frame )
	GameTooltip:Hide( )
	ResetCursor( )
	ArkInventory.BagHighlight( frame, false )
end



function ArkInventory.BagHighlight( frame, show )
	
	local loc_id = frame.ARK_Data.loc_id
	local bag_id = frame.ARK_Data.bag_id
	
	if loc_id ~=nil and bag_id ~= nil then
		
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		
		local b = cp.location[loc_id].bag[bag_id]
		if not b then
			return
		end
		
		local name = ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Container.Name .. "Bag" .. bag_id
		local frame = _G[name]
		if not frame then
			return
		end
		
		local enabled = ArkInventory.LocationOptionGet( loc_id, { "changer", "highlight", "show" } )
		local colour = ArkInventory.LocationOptionGet( loc_id, { "changer", "highlight", "colour" } )
		
		for slot_id in pairs( b.slot ) do
			local obj = _G[name .. "Item" .. slot_id .. "ArkHighlightBag"]
			if obj then
				if enabled then
					if show then
						obj:SetTexture( colour.r, colour.g, colour.b, 0.3 )
						obj:Show( )
					else
						obj:Hide( )
					end
				else
					obj:Hide( )
				end
			end
		end
	
	end
	
end


function ArkInventory.MyHook(...)
	if not ArkInventory:IsHooked(...) then
		ArkInventory:RawHook(...)
	end
end

function ArkInventory.MyUnhook(...)
	if ArkInventory:IsHooked(...) then
		ArkInventory:Unhook(...)
	end
end

function ArkInventory.MySecureHook(...)
	if not ArkInventory:IsHooked(...) then
		ArkInventory:SecureHook(...)
	end
end

--[[
function ArkInventory.BlizzardAPIHooks_OLD( disable )
	

	-- bag hooks
	if ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) and not disable then
		
		ArkInventory.MyHook( "OpenBackpack", "HookOpenBackpack", true )
		ArkInventory.MyHook( "ToggleBackpack", "HookToggleBackpack", true )
		ArkInventory.MyHook( "OpenBag", "HookOpenBag", true )
		ArkInventory.MyHook( "ToggleBag", "HookToggleBag", true )
		ArkInventory.MyHook( "OpenAllBags", "HookOpenAllBags", true )
		
		ArkInventory.MySecureHook( "BackpackTokenFrame_Update", ArkInventory.Frame_Status_Update_Tracking )
		
		CloseBackpack( )
		for i = 1, NUM_CONTAINER_FRAMES do
			CloseBag( i )
		end
		
	else
		
		ArkInventory.MyUnhook( "OpenBackpack" )
		ArkInventory.MyUnhook( "ToggleBackpack" )
		ArkInventory.MyUnhook( "OpenBag" )
		ArkInventory.MyUnhook( "ToggleBag" )
		ArkInventory.MyUnhook( "OpenAllBags" )
		
		ArkInventory.MyUnhook( "BackpackTokenFrame_Update" )
		
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
		
	end

	-- keyring hooks
	if ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Key ) and not disable then
		ArkInventory.MyHook( "ToggleKeyRing", "HookToggleKeyRing", true )
	else
		ArkInventory.MyUnhook( "ToggleKeyRing" )
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Key )
	end
	
	-- bank hooks
	if not BankFrame then
		
		ArkInventory.OutputError( "BankFrame is missing, cannot control bank" )
		
	else
		
		if ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bank ) and not disable then
			BankFrame:Hide( )
			BankFrame:UnregisterEvent( "BANKFRAME_OPENED" )
			--BankFrame:UnregisterEvent( "BANKFRAME_CLOSED" )
		else
			BankFrame:RegisterEvent( "BANKFRAME_OPENED" )
			--BankFrame:RegisterEvent( "BANKFRAME_CLOSED" )
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bank )
		end
		
	end
	
	-- mailbox
	if not disable then
		MailFrame:UnregisterEvent( "MAIL_SHOW" )
	else
		MailFrame:RegisterEvent( "MAIL_SHOW" )
	end
	
	-- merchant
	if not disable then
		MerchantFrame:UnregisterEvent( "MERCHANT_SHOW" )
	else
		MerchantFrame:RegisterEvent( "MERCHANT_SHOW" )
	end
	
	-- guild bank hooks
	if not GuildBankFrame or not GuildBankPopupFrame then
		
		ArkInventory.OutputError( "GuildBankFrame or GuildBankPopupFrame are missing, cannot control vault" )
		
	else
		
		if ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Vault ) and not disable then
			
			UIParent:UnregisterEvent( "GUILDBANKFRAME_OPENED" )
			
			GuildBankFrame:UnregisterEvent( "GUILDBANKBAGSLOTS_CHANGED" )
			GuildBankFrame:UnregisterEvent( "GUILDBANK_ITEM_LOCK_CHANGED" )
			GuildBankFrame:UnregisterEvent( "GUILDBANK_UPDATE_TABS" )
			GuildBankFrame:UnregisterEvent( "GUILDBANK_UPDATE_MONEY" )
			GuildBankFrame:UnregisterEvent( "GUILD_ROSTER_UPDATE" )
			GuildBankFrame:UnregisterEvent( "GUILDBANKLOG_UPDATE" )
			GuildBankFrame:UnregisterEvent( "GUILDTABARD_UPDATE" )
			
			GuildBankFrame:Hide( )
			
			local frame = _G[ArkInventory.Const.Frame.Main.Name .. ArkInventory.Const.Location.Vault]
			if frame then
				GuildBankPopupFrame:Hide( )
				GuildBankPopupFrame:ClearAllPoints( )
				GuildBankPopupFrame:SetPoint( "TOPLEFT", frame, "TOPRIGHT", -4, -30 )
			end
			
		else
			
			UIParent:RegisterEvent( "GUILDBANKFRAME_OPENED" )
			
			GuildBankFrame:RegisterEvent( "GUILDBANKBAGSLOTS_CHANGED" )
			GuildBankFrame:RegisterEvent( "GUILDBANK_ITEM_LOCK_CHANGED" )
			GuildBankFrame:RegisterEvent( "GUILDBANK_UPDATE_TABS" )
			GuildBankFrame:RegisterEvent( "GUILDBANK_UPDATE_MONEY" )
			GuildBankFrame:RegisterEvent( "GUILD_ROSTER_UPDATE" )
			GuildBankFrame:RegisterEvent( "GUILDBANKLOG_UPDATE" )
			GuildBankFrame:RegisterEvent( "GUILDTABARD_UPDATE" )
			
			local frame = _G["GuildBankFrame"]
			if frame then
				GuildBankPopupFrame:ClearAllPoints( )
				GuildBankPopupFrame:SetPoint( "TOPLEFT", frame, "TOPRIGHT", -4, -30 )
			end
			
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Vault )
			
		end
		
	end
	
	
	-- tooltips
	
	local tooltip_frames = { GameTooltip, ShoppingTooltip1, ShoppingTooltip2, ShoppingTooltip3, ItemRefTooltip, ItemRefShoppingTooltip1, ItemRefShoppingTooltip2, ItemRefShoppingTooltip3 }

	local tooltip_functions = {
		"SetAuctionItem", "SetAuctionSellItem", "SetAuctionCompareItem", "SetBagItem", "SetBuybackItem", "SetCraftItem", "SetCraftSpell", "SetGuildBankItem", "SetHyperlink",
		"SetHyperlinkCompareItem", "SetInboxItem", "SetInventoryItem", "SetLootItem", "SetLootRollItem", "SetMerchantCompareItem", "SetMerchantItem", "SetQuestItem",
		"SetQuestLogItem", "SetSendMailItem", "SetTradePlayerItem", "SetTradeSkillItem", "SetTradeTargetItem", "SetCurrencyToken", "SetBackpackToken", "SetMerchantCostItem"
	}
    
	if ArkInventory.db.global.option.tooltip.show and not disable then
		
		for _, obj in pairs( ArkInventory.Global.Tooltip.WOW ) do
			for _, func in pairs( tooltip_functions ) do
				if obj and obj[func] then
					ArkInventory.MySecureHook( obj, func, ArkInventory.TooltipAdd )
				end
				if ArkInventory.db.global.option.tooltip.scale.enabled then
					obj:SetScale( ArkInventory.db.global.option.tooltip.scale.amount or 1 )
				end
			end
		end
		
	else
		
		for _, obj in pairs( tooltip_frames ) do
			for _, func in pairs( tooltip_functions ) do
				if obj and obj[func] then
					ArkInventory.MyUnhook( obj, func, ArkInventory.TooltipAdd )
				end
			end
		end
		
	end
	
end
]]--

function ArkInventory.BlizzardAPIHooks( disable )
	
	if disable or not ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		
		-- unhook the backpack functions
		
		ArkInventory.MyUnhook( "OpenBackpack" )
		ArkInventory.MyUnhook( "ToggleBackpack" )
		
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
		
	else
		
		-- hook the backpack functions
		
		ArkInventory.MyHook( "OpenBackpack", "HookOpenBackpack", true )
		ArkInventory.MyHook( "ToggleBackpack", "HookToggleBackpack", true )

		ArkInventory.MySecureHook( "BackpackTokenFrame_Update", ArkInventory.Frame_Status_Update_Tracking )
		
	end
	
	
	if disable or not ( ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) or ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bank ) ) then
		
		-- unhook the bag functions
		
		ArkInventory.MyUnhook( "OpenBag" )
		ArkInventory.MyUnhook( "ToggleBag" )
		ArkInventory.MyUnhook( "OpenAllBags" )
		
	else
	
		-- hook the bag functions
		
		ArkInventory.MyHook( "OpenBag", "HookOpenBag", true )
		ArkInventory.MyHook( "ToggleBag", "HookToggleBag", true )
		ArkInventory.MyHook( "OpenAllBags", "HookOpenAllBags", true )
		
	end

	
	if disable or not ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Key ) then
		
		-- unhook the keyring functions
		
		ArkInventory.MyUnhook( "ToggleKeyRing" )
		
		ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Key )
		
	else
		
		-- hook the keyring functions
		
		ArkInventory.MyHook( "ToggleKeyRing", "HookToggleKeyRing", true )
		
	end
	
	
	-- bank hooks
	if not BankFrame then
		
		ArkInventory.OutputError( "BankFrame is missing, cannot control bank" )
		
	else
		
		if disable or not ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bank ) then
			
			-- unhook the bank funtions
			
			BankFrame:RegisterEvent( "BANKFRAME_OPENED" )
			--BankFrame:RegisterEvent( "BANKFRAME_CLOSED" )
			
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bank )
			
		else
			
			BankFrame:Hide( )
			BankFrame:UnregisterEvent( "BANKFRAME_OPENED" )
			--BankFrame:UnregisterEvent( "BANKFRAME_CLOSED" )
			
		end
		
	end
	
	
	-- mailbox
	if disable then
		MailFrame:RegisterEvent( "MAIL_SHOW" )
	else
		MailFrame:UnregisterEvent( "MAIL_SHOW" )
	end
	
	
	-- merchant
	if disable then
		MerchantFrame:RegisterEvent( "MERCHANT_SHOW" )
	else
		MerchantFrame:UnregisterEvent( "MERCHANT_SHOW" )
	end
	
	
	-- guild bank hooks
	if not GuildBankFrame or not GuildBankPopupFrame then
		
		ArkInventory.OutputError( "GuildBankFrame or GuildBankPopupFrame are missing, cannot control vault" )
		
	else
		
		if disable or not ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Vault ) then
			
			-- restore guild bank functions
			
			UIParent:RegisterEvent( "GUILDBANKFRAME_OPENED" )
			
			GuildBankFrame:RegisterEvent( "GUILDBANKBAGSLOTS_CHANGED" )
			GuildBankFrame:RegisterEvent( "GUILDBANK_ITEM_LOCK_CHANGED" )
			GuildBankFrame:RegisterEvent( "GUILDBANK_UPDATE_TABS" )
			GuildBankFrame:RegisterEvent( "GUILDBANK_UPDATE_MONEY" )
			GuildBankFrame:RegisterEvent( "GUILDBANK_UPDATE_TEXT" )
			GuildBankFrame:RegisterEvent( "GUILD_ROSTER_UPDATE" )
			GuildBankFrame:RegisterEvent( "GUILDBANKLOG_UPDATE" )
			GuildBankFrame:RegisterEvent( "GUILDTABARD_UPDATE" )
			
			-- anchor popup to blizzard frame
			local frame = _G["GuildBankFrame"]
			if frame then
				GuildBankPopupFrame:ClearAllPoints( )
				GuildBankPopupFrame:SetPoint( "TOPLEFT", frame, "TOPRIGHT", -4, -30 )
			end
			
			ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Vault )
			
		else
			
			-- sever guild bank functions
			
			UIParent:UnregisterEvent( "GUILDBANKFRAME_OPENED" )
			
			GuildBankFrame:UnregisterEvent( "GUILDBANKBAGSLOTS_CHANGED" )
			GuildBankFrame:UnregisterEvent( "GUILDBANK_ITEM_LOCK_CHANGED" )
			GuildBankFrame:UnregisterEvent( "GUILDBANK_UPDATE_TABS" )
			GuildBankFrame:UnregisterEvent( "GUILDBANK_UPDATE_MONEY" )
			GuildBankFrame:UnregisterEvent( "GUILDBANK_UPDATE_TEXT" )
			GuildBankFrame:UnregisterEvent( "GUILD_ROSTER_UPDATE" )
			GuildBankFrame:UnregisterEvent( "GUILDBANKLOG_UPDATE" )
			GuildBankFrame:UnregisterEvent( "GUILDTABARD_UPDATE" )
			
			GuildBankFrame:Hide( )
			
			-- anchor popup to AI frame
			local frame = _G[ArkInventory.Const.Frame.Main.Name .. ArkInventory.Const.Location.Vault]
			if frame then
				GuildBankPopupFrame:Hide( )
				GuildBankPopupFrame:ClearAllPoints( )
				GuildBankPopupFrame:SetPoint( "TOPLEFT", frame, "TOPRIGHT", -4, -30 )
			end
			
		end
		
	end
	
	
	-- tooltips
	
	local tooltip_frames = { GameTooltip, ShoppingTooltip1, ShoppingTooltip2, ShoppingTooltip3, ItemRefTooltip, ItemRefShoppingTooltip1, ItemRefShoppingTooltip2, ItemRefShoppingTooltip3 }

	local tooltip_functions = {
		"SetAuctionItem", "SetAuctionSellItem", "SetAuctionCompareItem", "SetBagItem", "SetBuybackItem", "SetCraftItem", "SetCraftSpell", "SetGuildBankItem", "SetHyperlink",
		"SetHyperlinkCompareItem", "SetInboxItem", "SetInventoryItem", "SetLootItem", "SetLootRollItem", "SetMerchantCompareItem", "SetMerchantItem", "SetQuestItem",
		"SetQuestLogItem", "SetSendMailItem", "SetTradePlayerItem", "SetTradeSkillItem", "SetTradeTargetItem", "SetCurrencyToken", "SetBackpackToken", "SetMerchantCostItem"
	}
    
	if disable or not ArkInventory.db.global.option.tooltip.show then
		
		for _, obj in pairs( tooltip_frames ) do
			for _, func in pairs( tooltip_functions ) do
				if obj and obj[func] then
					ArkInventory.MyUnhook( obj, func, ArkInventory.TooltipAdd )
				end
			end
		end
		
	else
		
		for _, obj in pairs( ArkInventory.Global.Tooltip.WOW ) do
			for _, func in pairs( tooltip_functions ) do
				if obj and obj[func] then
					ArkInventory.MySecureHook( obj, func, ArkInventory.TooltipAdd )
				end
				if ArkInventory.db.global.option.tooltip.scale.enabled then
					obj:SetScale( ArkInventory.db.global.option.tooltip.scale.amount or 1 )
				end
			end
		end
		
	end
	
end

function ArkInventory.HookOpenBackpack( self )

	--ArkInventory.Output( "HookOpenBackpack( )" )
	
	local loc_id = ArkInventory.Const.Location.Bag
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		local BACKPACK_WAS_OPEN = ArkInventory.Frame_Main_Get( loc_id ):IsVisible( )
		ArkInventory.Frame_Main_Show( loc_id )
		return BACKPACK_WAS_OPEN
	end
	
	ArkInventory.OutputError( "Code failure: HookOpenBackpack( ), you should never have got here" )
	
end

function ArkInventory.HookToggleBackpack( self )

	--ArkInventory.Output( "HookToggleBackpack( )" )
	
	local loc_id = ArkInventory.Const.Location.Bag
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Toggle( loc_id )
		return
	end
	
	ArkInventory.OutputError( "Code failure: HookToggleBackpack( ), you should never have got here" )
	
end

function ArkInventory.HookToggleKeyRing( self )

	--ArkInventory.Output( "HookToggleKeyRing( )" )
	
	local loc_id = ArkInventory.Const.Location.Key
	
	if ArkInventory.LocationIsControlled( loc_id ) then
		ArkInventory.Frame_Main_Toggle( loc_id )
		return
	end
	
	ArkInventory.OutputError( "Code failure: HookToggleKeyRing( ), you should never have got here" )
	
end

function ArkInventory.HookOpenBag( self, bag_id )
	
	--ArkInventory.Output( "HookOpenBag( ", bag_id, " )" )
	
	if bag_id then
		
		local loc_id = ArkInventory.BagID_Internal( bag_id )
		
		if loc_id == ArkInventory.Const.Location.Bag or ( loc_id == ArkInventory.Const.Location.Bank and ArkInventory.Global.Mode.Bank ) then
			if ArkInventory.LocationIsControlled( loc_id ) then
				ArkInventory.Frame_Main_Show( loc_id )
				return
			end
		end
		
	end
	
	ArkInventory.hooks["OpenBag"]( bag_id )
	
end

function ArkInventory.HookToggleBag( self, bag_id )
	
	--ArkInventory.Output( "HookToggleBag( ", bag_id, " )" )
	
	if bag_id then
	
		local loc_id = ArkInventory.BagID_Internal( bag_id )
		
		if loc_id == ArkInventory.Const.Location.Bag or ( loc_id == ArkInventory.Const.Location.Bank and ArkInventory.Global.Mode.Bank ) then
			if ArkInventory.LocationIsControlled( loc_id ) then
				ArkInventory.Frame_Main_Toggle( loc_id )
				return
			end
		end
		
	end
	
	ArkInventory.hooks["ToggleBag"]( bag_id )
	
end

function ArkInventory.HookOpenAllBags( self, forceOpen )
	
	--ArkInventory.Output( "HookOpenAllBags( ", forceOpen, " )" )
	
	-- we control both so just toggle the bag and return
	if ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) and ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bank ) then
		if forceOpen then
			ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
		else
			ArkInventory.Frame_Main_Toggle( ArkInventory.Const.Location.Bag )
		end
		return
	end
	
	-- we only control one of the bag or bank
	
	-- modified from blizzard containerframe.lua
	
	local BACKPACK_WAS_OPEN = ArkInventory.Frame_Main_Get( ArkInventory.Const.Location.Bag ):IsVisible( )
	local bagsShown = 0
	local bagsTotal = 0
	
	-- close all opened blizzard bag frames
	for i = 1, NUM_CONTAINER_FRAMES do
		
		local containerFrame = _G["ContainerFrame"..i]
		
		if containerFrame:IsShown( ) then
			if containerFrame:GetID() ~= KEYRING_CONTAINER then
				bagsShown = bagsShown + 1
				containerFrame:Hide( )
			end
		end
		
	end
	
	
	if not ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bag ) then
		
		-- we dont control the bag
		
		-- find max number of bags
		bagsTotal = 1
		for x = 1, NUM_BAG_SLOTS do
			if GetContainerNumSlots(x) > 0 then		
				bagsTotal = bagsTotal + 1
			end
		end
		
		-- open all bags or leave them closed
		if ( bagsShown < bagsTotal ) or forceOpen then
			OpenBackpack( )
			for x = 1, NUM_BAG_SLOTS do
				OpenBag( x )
			end
		end
		
		return
		
	end
	
	
	if not ArkInventory.LocationIsControlled( ArkInventory.Const.Location.Bank ) then
		
		-- we dont control the bank
		
		if ArkInventory.Global.Mode.Bank then
			
			-- find max number of bags
			bagsTotal = 0
			for x = NUM_BAG_SLOTS + 1, NUM_BAG_SLOTS + NUM_BANKBAGSLOTS do
				if GetContainerNumSlots(x) > 0 then		
					bagsTotal = bagsTotal + 1
				end
			end
			
			if ( bagsShown < bagsTotal ) or forceOpen then
				for x = NUM_BAG_SLOTS + 1, NUM_BAG_SLOTS + NUM_BANKBAGSLOTS do
					OpenBag( x )
				end
				ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
			else
				--ArkInventory.Frame_Main_Hide( ArkInventory.Const.Location.Bag )
			end
		
		else
		
			ArkInventory.Frame_Main_Toggle( ArkInventory.Const.Location.Bag )
		
		end
		
		return
		
	end
	
	ArkInventory.OutputError( "Code failure at OpenAllBags( ), you should never have got here." )
	
end

function ArkInventory.HookDoNothing( self )
	-- ArkInventory.OutputDebug( "HookDoNothing( )" )
	-- do nothing
end

function ArkInventory.HookGuildBankPopupOkayButton_OnClick( self )

	--ArkInventory.OutputDebug( "GuildBankPopupOkayButton_OnClick( )" )
	--ArkInventory.hooks["GuildBankPopupOkayButton_OnClick"]( )
	
	local loc_id = ArkInventory.Const.Location.Vault
	
	if not ArkInventory.Global.Location[loc_id].isOffline then
		ArkInventory.Frame_Main_Generate( loc_id, nil )
	end
	
end

function ArkInventory.ContainerNameGet( loc_id, bag_id )
	if loc_id ~= nil and bag_id ~= nil then
		local x = ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Container.Name .. "Bag" .. bag_id
		return x
	end
end

function ArkInventory.ContainerItemNameGet( loc_id, bag_id, slot_id )
	--if loc_id ~= nil and type( loc_id ) == "number" and bag_id ~= nil and type( bag_id ) == "number" and slot_id ~= nil and type( slot_id ) == "number" then
	if loc_id ~= nil and bag_id ~= nil and slot_id ~= nil and type( slot_id ) == "number" then
		local x = ArkInventory.ContainerNameGet( loc_id, bag_id ) .. "Item" .. slot_id
		return x
	end
end

function ArkInventory.LocationOptionGet( loc_id, opt )
	local loc_id = ArkInventory.db.profile.option.use[loc_id] or loc_id
	return ArkInventory.LocationOptionGetReal( loc_id, opt )
end

function ArkInventory.LocationOptionGetReal( loc_id, opt )

	assert( loc_id ~= nil, "location id is nil" )
	assert( type( opt ) == "table", "opt is not a table" )

	local p = ArkInventory.db.profile.option.location[loc_id]
	
	for k = 1, #opt do
	
		if p == nil then
			--ArkInventory.Output( "loc_id=[", loc_id, "], opt=[", opt, "], k=[", k, "]" )
			assert( false, "code error: encountered nil on option sub path - please reload ui to reset database" )
		end
		local v = opt[k]
		assert( v ~= nil, "code error: encountered a nil parameter at position " .. k )
--		ArkInventory.Output( "p[", v, "]=[", p[v], "]" )
		p = p[v]
	end
	
	return p

end

function ArkInventory.LocationOptionSet( loc_id, opt, n )
	local loc_id = ArkInventory.db.profile.option.use[loc_id] or loc_id
	return ArkInventory.LocationOptionSetReal( loc_id, opt, n )
end

function ArkInventory.LocationOptionSetReal( loc_id, opt, n )

	assert( loc_id ~= nil, "location id is nil" )
	assert( type( opt ) == "table", "opt is not a table" )

	--s = "option.local." .. loc_id
	local p = { ArkInventory.db.profile.option.location[loc_id] }
	local c = 1
	
	for k = 1, #opt - 1 do
		c = k + 1
		local v = opt[k]
		p[c] = p[k][v]
		--s = s .. "." .. v
	end
	
	local v = opt[c]
	--ArkInventory.Output( "set ", s, "[", v, "], old=[", p[c][v], "], new=[", n, "]" )
	p[c][v] = n

end

function ArkInventory.ToggleChanger( loc_id )
	ArkInventory.LocationOptionSet( loc_id, { "changer", "hide" }, not ArkInventory.LocationOptionGet( loc_id, { "changer", "hide" } ) )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Refresh )
end

function ArkInventory.ToggleEditMode( )
	ArkInventory.Global.Mode.Edit = not ArkInventory.Global.Mode.Edit
	ArkInventory.Frame_Bar_Paint_All( )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
end

function ArkInventory.GameTooltipSetPosition( frame, bottom )

	local x, a
	x = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2
	
	if bottom then
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			a = "ANCHOR_BOTTOMLEFT"
		else
			a = "ANCHOR_BOTTOMRIGHT"
		end
	else
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			a = "ANCHOR_LEFT"
		else
			a = "ANCHOR_RIGHT"
		end
	end
	
	GameTooltip:SetOwner( frame, a )
	
end

function ArkInventory.GameTooltipSetText( frame, txt, r, g, b, bottom )
	ArkInventory.GameTooltipSetPosition( frame, bottom )
	GameTooltip:SetText( txt or "missing text", r or 1, g or 1, b or 1 )
	GameTooltip:Show( )
end

function ArkInventory.GameTooltipSetHyperlink( frame, h )

	local class = ArkInventory.ObjectStringDecode( h )
	
	ArkInventory.GameTooltipSetPosition( frame )
	
	if class == "token" then
		ArkInventory.GameTooltipSetToken( frame, h )
	else
		GameTooltip:SetHyperlink( h )
	end
	--GameTooltip:Show( )
end

function ArkInventory.GameTooltipSetToken( frame, h, count )

	local class, link, name, texture, quality, type, id = ArkInventory.ObjectInfo( h )
	
	if class ~= "token" then
		ArkInventory.GameTooltipSetHyperlink( frame, h )
		return
	end
	
	ArkInventory.GameTooltipSetPosition( frame )
	
	GameTooltip:ClearLines( )
	
	local description = ""
	
	if type == 0 then
		--ArkInventory.TooltipSetHyperlink( ArkInventory.Global.Tooltip.Vendor, string.format( "|Hitem:%s|h", id ) )
		ArkInventory.TooltipSetHyperlink( ArkInventory.Global.Tooltip.Vendor, h )
		description = ArkInventory.TooltipGetLine( ArkInventory.Global.Tooltip.Vendor, 3 )
	elseif type == 1 then
		description = TOOLTIP_ARENA_POINTS
	elseif type == 2 then
		description = TOOLTIP_HONOR_POINTS
	end
	
	local r, g, b = GetItemQualityColor( quality or 0 )
	if count and count > 0 then
		GameTooltip:AddDoubleLine( name, tostring( count ), r, g, b, r, g, b )
	else
		GameTooltip:AddLine( name, r, g, b )
	end
	
	if description then
		GameTooltip:AddLine( description, nil, nil, nil, 1 )
	end
	
	ArkInventory.TooltipAdd( GameTooltip, h )
	
	GameTooltip:Show( )
	
end

function ArkInventory.GameTooltipHide( )
	GameTooltip:Hide( )
end

function ArkInventory.PTItemSearch( item )

	-- taken from pt3.0 because someone decided that it didnt belong in pt3.1
	
	local item = ArkInventory.ObjectStringDecodeItem( item )
	
	if item <= 0 then
		return nil
	end
	
	local matches = { }
	for k, v in pairs( ArkInventory.Lib.PeriodicTable.sets ) do
		local _, set = ArkInventory.Lib.PeriodicTable:ItemInSet( item, k )
		if set then
			local have
			for _, v in ipairs( matches ) do
				if v == set then
					have = true
				end
			end
			if not have then
				table.insert( matches, set )
			end
		end
	end
	
	if #matches > 0 then
		table.sort( matches )
		return matches
	end
	
end

function ArkInventory.LocationControlToggle( loc_id )
	ArkInventory.LocationControlSet( loc_id, not ArkInventory.db.realm.player.data[player_id].control[loc_id] )
end

function ArkInventory.LocationControlSet( loc_id, control )
	
	local player_id = ArkInventory.Global.Me.info.player_id
	
	if control then
		
		-- enabling ai for location - hide open blizzard frame
		
		if loc_id == ArkInventory.Const.Location.Bag then
			CloseAllBags( )
		elseif loc_id == ArkInventory.Const.Location.Keyring then
			
		elseif loc_id == ArkInventory.Const.Location.Bank and ArkInventory.Global.Mode.Bank then
			CloseBankFrame( )
		elseif loc_id == ArkInventory.Const.Location.Vault and ArkInventory.Global.Mode.Vault then
			CloseGuildBankFrame( )
		end
		
	else
		
		-- disabling ai for location - hide ai frame
		
		ArkInventory.Frame_Main_Hide( loc_id )
		
	end
	
	ArkInventory.db.realm.player.data[player_id].control[loc_id] = control
	ArkInventory.BlizzardAPIHooks( )

end

function ArkInventory.Frame_Vault_Log_Update( )
	
	local numTransactions = 0
	if GuildBankFrame.mode == "log" then
		numTransactions = GetNumGuildBankTransactions( GetCurrentGuildBankTab( ) ) or 0
	elseif GuildBankFrame.mode == "moneylog" then
		numTransactions = GetNumGuildBankMoneyTransactions( ) or 0
	end
	
	if numTransactions == 0 then
		return
	end
	
	local loc_id = ArkInventory.Const.Location.Vault
	
	local obj = _G[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Log.Name .. ArkInventory.Const.Frame.Scrolling.List]
	obj:SetMaxLines( numTransactions )
	obj:ScrollToTop( )
	
	local tab = GetCurrentGuildBankTab( )
	
	obj:SetInsertMode( "TOP" )
	obj:AddMessage( "-*- end of list -*-" )
	
	for i = 1, numTransactions do
		
		local msg, type, name, amount, year, month, day, hour, money
		
		if GuildBankFrame.mode == "log" then
			type, name, itemLink, count, tab1, tab2, year, month, day, hour = GetGuildBankTransaction( tab, i )
		elseif GuildBankFrame.mode == "moneylog" then
			type, name, amount, year, month, day, hour = GetGuildBankMoneyTransaction( i )
		end
		
		if not name then
			name = UNKNOWN
		end
		
		name = NORMAL_FONT_COLOR_CODE..name..FONT_COLOR_CODE_CLOSE
		
		if GuildBankFrame.mode == "log" then
			
			if type == "deposit" then
				msg = format( GUILDBANK_DEPOSIT_FORMAT, name, itemLink )
				if count > 1 then
					msg = msg .. format( GUILDBANK_LOG_QUANTITY, count )
				end
			elseif type == "withdraw" then
				msg = format( GUILDBANK_WITHDRAW_FORMAT, name, itemLink )
				if count > 1 then
					msg = msg .. format( GUILDBANK_LOG_QUANTITY, count )
				end
			elseif type == "move" then
				msg = format( GUILDBANK_MOVE_FORMAT, name, itemLink, count, GetGuildBankTabInfo(tab1), GetGuildBankTabInfo(tab2) )
			end
			
		elseif GuildBankFrame.mode == "moneylog" then
			
			money = GetDenominationsFromCopper( amount )
			
			if type == "deposit" then
				msg = format( GUILDBANK_DEPOSIT_MONEY_FORMAT, name, money )
			elseif type == "withdraw" then
				msg = format( GUILDBANK_WITHDRAW_MONEY_FORMAT, name, money )
			elseif type == "repair" then
				msg = format( GUILDBANK_REPAIR_MONEY_FORMAT, name, money )
			elseif type == "withdrawForTab" then
				msg = format( GUILDBANK_WITHDRAWFORTAB_MONEY_FORMAT, name, money )
			elseif type == "buyTab" then
				msg = format( GUILDBANK_BUYTAB_MONEY_FORMAT, name, money )
			end
			
		end
		
		if msg then
			obj:AddMessage( msg .. GUILD_BANK_LOG_TIME_PREPEND .. format( GUILD_BANK_LOG_TIME, RecentTimeDate( year, month, day, hour ) ) )
		end
		
	end
	
	ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventory.Frame_Vault_Info_Update( )
	
	local loc_id = ArkInventory.Const.Location.Vault
	local tab = GetCurrentGuildBankTab( )
	local obj = _G[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Info.Name .. "ScrollInfo"]
	local text = GetGuildBankText( tab )
	
	if text then
		obj.text = text
		obj:SetText( text )
	else
		obj.text = ""
		obj:SetText( "" )
	end
	
	ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventory.Frame_Vault_Info_Changed( self )
	
	local tab = GetCurrentGuildBankTab( )
	local button = _G[self:GetParent( ):GetParent( ):GetName( ).."Save"]
	
	if tab <= GetNumGuildBankTabs( ) and CanEditGuildTabInfo( tab ) and self:GetText( ) ~= self.text then
		button:Enable( )
	else
		button:Disable( )
	end
	
end

function ArkInventory.ScrollingMessageFrame_Scroll( parent, name, direction )

	if not parent or not name then
		return
	end
	
	local obj = _G[parent:GetName( ) .. name]
	if not obj then
		return
	end
	
	local i = obj:GetInsertMode( )
	
	if i == "TOP" then
	
		if direction == "up" and not obj:AtBottom( ) then
			obj:ScrollDown( )
		elseif direction == "pageup" and not obj:AtBottom( ) then
			obj:PageDown( )
		elseif direction == "down" and not obj:AtTop( ) then
			obj:ScrollUp( )
		elseif direction == "pagedown" and not obj:AtTop( ) then
			obj:PageUp( )
		end
	
	else
	
		if direction == "up" and not obj:AtTop( ) then
			obj:ScrollUp( )
		elseif direction == "pageup" and not obj:AtTop( ) then
			obj:PageUp( )
		elseif direction == "down" and not obj:AtBottom( ) then
			obj:ScrollDown( )
		elseif direction == "pagedown" and not obj:AtBottom( ) then
			obj:PageDown( )
		end
	
	end
	
end

function ArkInventory.ScrollingMessageFrame_ScrollWheel( parent, name, direction )

	if direction == 1 then
		ArkInventory.ScrollingMessageFrame_Scroll( parent, name, "up" )
	else
		ArkInventory.ScrollingMessageFrame_Scroll( parent, name, "down" )
	end

end

function ArkInventory.LocationIsMonitored( loc_id ) -- listen for changes in this location
	return ArkInventory.Global.Me.monitor[loc_id]
end

function ArkInventory.LocationIsControlled( loc_id )
	return ArkInventory.Global.Me.control[loc_id]
end

function ArkInventory.LocationIsSaved( loc_id )
	return ArkInventory.Global.Me.save[loc_id]
end

function ArkInventory.DisplayName1( p )
	-- window titles (normal)
	return string.format( "%s\n%s > %s", p.name or ArkInventory.Localise["UNKNOWN"], p.faction_local or ArkInventory.Localise["UNKNOWN"], p.realm or ArkInventory.Localise["UNKNOWN"] )
end

function ArkInventory.DisplayName2( p )
	-- switch menu
	return string.format( "%s > %s > %s", p.realm or ArkInventory.Localise["UNKNOWN"], p.faction_local or ArkInventory.Localise["UNKNOWN"], p.name or ArkInventory.Localise["UNKNOWN"] )
end

function ArkInventory.DisplayName3( p )
	-- tooltip item count
	return string.format( "%s%s|r", ArkInventory.ClassColourCode( p.class ), p.name or ArkInventory.Localise["UNKNOWN"] )
end

function ArkInventory.DisplayName4( p )
	-- switch character
	return string.format( "%s%s (%s:%s) |cff7f7f7f[%s]|r", ArkInventory.ClassColourCode( p.class ), p.name or ArkInventory.Localise["UNKNOWN"], p.class_local or ArkInventory.Localise["UNKNOWN"], p.level or ArkInventory.Localise["UNKNOWN"], p.faction_local or ArkInventory.Localise["UNKNOWN"] )
end

function ArkInventory.DisplayName5( p )
	-- window titles (thin)
	return string.format( "%s", p.name or ArkInventory.Localise["UNKNOWN"] )
end

function ArkInventory.MemoryUsed( c )

	if c then
		collectgarbage( "stop" )
	end

	--UpdateAddOnMemoryUsage( )

	--local am = GetAddOnMemoryUsage( ArkInventory.Const.Program.Name ) * 1000
	local am = collectgarbage( "count" )
	
	if not c then
		collectgarbage( "restart" )
	end
	
	return am

end

function ArkInventory.ItemAgeUpdate( )
	return math.floor( time( date( '*t' ) ) / 60 ) -- minutes
end

function ArkInventory.ItemAgeGet( age )
	
	if age and type( age ) == "number" then
		
		local s = ArkInventory.Localise["DHMS"]
		
		local x = ArkInventory.ItemAgeUpdate( ) - age
		local m = x + 1 -- push seconds up so that items with less than a minute get displayed
		
		local d = math.floor( m / 1440 )
		m = math.floor( m - d * 1440 )
		local h = math.floor( m / 60 )
		m = math.floor( m - h * 60 )
		
		local t = ""
		
--[[
		if d > 0 then
			t = string.format( "%d%s ", d, string.sub( s, 1, 1 ) )
		end
		
		if h > 0 or ( d > 0 and m > 0 ) then
			t = string.format( "%s%d%s ", t, h, string.sub( s, 2, 2 ) )
		end
		
		if m > 0 and d == 0 then -- only show minutes if were not into days
			t = string.format( "%s%d%s", t, m, string.sub( s, 3, 3 ) )
		end
]]--		
		
		if d > 0 then
			t = string.format( "%d:%d%s", d, h, string.sub( s, 1, 1 ) )
		elseif h > 0 then
			t = string.format( "%d:%d%s", h, m, string.sub( s, 2, 2 ) )
		else
			t = string.format( "%d%s", m, string.sub( s, 3, 3 ) )
		end
		
		return x, strtrim( t )
		
	end
	
	return false, ""
	
end

function ArkInventory.StartupChecks( )
	
	-- erase leftover partial data
	for p, pd in pairs( ArkInventory.db.realm.player.data ) do
		
		local wipe = false
		
		if pd.info and not pd.info.name then
			wipe = true
		end
		
		local c = 0
		for l, ld in pairs( pd.location ) do
			c = c + ld.slot_count
		end
		
		if c == 0 then
			wipe = true
		end
		
		if wipe then
			ArkInventory.EraseSavedData( p, nil, false )
		end
		
	end
	
	
	
	
	
	
	
	
	
	
	
	if true then return end
	
	for k, v in pairs( ArkInventory.Localise ) do
		
		if string.sub( k, 1, 13 ) == "WOW_ITEM_TYPE" then
			ArkInventory.Output( k, " = ", v )
		end
		
		if string.sub( k, 1, 9 ) == "WOW_SKILL" then
			ArkInventory.Output( k, " = ", v )
		end
		
	end

end

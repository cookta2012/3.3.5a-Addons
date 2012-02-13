local L = AceLibrary("AceLocale-2.2"):new("SmallBoxIconPack")

L:RegisterTranslations("enUS", function() return {
	["SmallBox Iconpack"] = true,
	["Small Purple Box"] = true,
	["Small Blue Box"] = true,
	["Small Turquoise Box"] = true,
	["Small Green Box"] = true,
	["Small Red Box"] = true,
	["Small Orange Box"] = true,
	["Small Yellow Box"] = true,
	["Small White Box"] = true,
} end)

local pack = AceLibrary("AceAddon-2.0"):new()
function pack:OnInitialize()
	local iconPath = "Interface\\Addons\\Cartographer_Icons_SmallBoxPack\\"
     Cartographer_Icons:RegisterPack('smallbox_iconpack',L["SmallBox Iconpack"])
     Cartographer_Icons:RegisterNewIcon('smallbox_iconpack',"Small White Box",L["Small White Box"],iconPath.."small_box_white")
     Cartographer_Icons:RegisterNewIcon('smallbox_iconpack',"Small Yellow Box",L["Small Yellow Box"],iconPath.."small_box_yellow")
     Cartographer_Icons:RegisterNewIcon('smallbox_iconpack',"Small Orange Box",L["Small Orange Box"],iconPath.."small_box_orange")
     Cartographer_Icons:RegisterNewIcon('smallbox_iconpack',"Small Red Box",L["Small Red Box"],iconPath.."small_box_red")
     Cartographer_Icons:RegisterNewIcon('smallbox_iconpack',"Small Purple Box",L["Small Purple Box"],iconPath.."small_box_purple")
     Cartographer_Icons:RegisterNewIcon('smallbox_iconpack',"Small Blue Box",L["Small Blue Box"],iconPath.."small_box_blue")
     Cartographer_Icons:RegisterNewIcon('smallbox_iconpack',"Small Turquoise Box",L["Small Turquoise Box"],iconPath.."small_box_turquoise")
     Cartographer_Icons:RegisterNewIcon('smallbox_iconpack',"Small Green Box",L["Small Green Box"],iconPath.."small_box_green")
end
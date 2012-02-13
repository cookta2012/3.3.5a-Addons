local L = AceLibrary("AceLocale-2.2"):new("SmallDiamondIconPack")

L:RegisterTranslations("enUS", function() return {
	["Small Diamond Iconpack"] = true,
	["Diamond Purple"] = true,
	["Diamond Blue"] = true,
	["Diamond Turquoise"] = true,
	["Diamond Green"] = true,
	["Diamond Red"] = true,
	["Diamond Orange"] = true,
	["Diamond Yellow"] = true,
	["Diamond White"] = true,
} end)

local pack = AceLibrary("AceAddon-2.0"):new()
function pack:OnInitialize()
	local iconPath = "Interface\\Addons\\Cartographer_Icons_SmallDiamondPack\\"
     Cartographer_Icons:RegisterPack('diamond_iconpack',L["Small Diamond Iconpack"])
     Cartographer_Icons:RegisterNewIcon('diamond_iconpack',"Small White Diamond",L["Diamond White"],iconPath.."small_diamond_white")
     Cartographer_Icons:RegisterNewIcon('diamond_iconpack',"Small Yellow Diamond",L["Diamond Yellow"],iconPath.."small_diamond_yellow")
     Cartographer_Icons:RegisterNewIcon('diamond_iconpack',"Small Orange Diamond",L["Diamond Orange"],iconPath.."small_diamond_orange")
     Cartographer_Icons:RegisterNewIcon('diamond_iconpack',"Small Red Diamond",L["Diamond Red"],iconPath.."small_diamond_red")
     Cartographer_Icons:RegisterNewIcon('diamond_iconpack',"Small Purple Diamond",L["Diamond Purple"],iconPath.."small_diamond_purple")
     Cartographer_Icons:RegisterNewIcon('diamond_iconpack',"Small Blue Diamond",L["Diamond Blue"],iconPath.."small_diamond_blue")
     Cartographer_Icons:RegisterNewIcon('diamond_iconpack',"Small Turquoise Diamond",L["Diamond Turquoise"],iconPath.."small_diamond_turquoise")
     Cartographer_Icons:RegisterNewIcon('diamond_iconpack',"Small Green Diamond",L["Diamond Green"],iconPath.."small_diamond_green")
end
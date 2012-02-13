-- CartImport module for GatherMate
local GatherMate = LibStub("AceAddon-3.0"):GetAddon("GatherMate")
local CartImport = GatherMate:NewModule("CartImport")
local Config = GatherMate:GetModule("Config")
local LG = LibStub("AceLocale-3.0"):GetLocale("GatherMate", false)

-- Localization
do
	-- enUS stuff
	local L = LibStub("AceLocale-3.0"):NewLocale("GatherMate_CartImport", "enUS", true)
	if L then
		L["Merge will add the data in Cartographer gathering modules to your database. Overwrite will replace your database with the data found in Cartographer gathering modules."] = true
		L["Import Cartographer Data"] = true
		L["Import the data from currently enabled Cartographer modules into your database."] = true
		L["Cartographer data has been imported."] = true
	end

	-- deDE stuff
	local L = LibStub("AceLocale-3.0"):NewLocale("GatherMate_CartImport", "deDE")
	if L then
		L["Merge will add the data in Cartographer gathering modules to your database. Overwrite will replace your database with the data found in Cartographer gathering modules."] = "'Zusammenführen' wird Daten aus den Cartographer Modulen zu Deiner Datenbank hinzufügen. 'Überschreiben' wird Deine Datenbank mit Daten aus den Cartographer Modulen überschreiben."
		L["Import Cartographer Data"] = "Importieren"
		L["Import the data from currently enabled Cartographer modules into your database."] = "Aktivierte Cartographer Module in Deine Datenbank importieren."
		L["Cartographer data has been imported."] = "Cartographer Daten wurden importiert."
	end

	-- frFR stuff
	local L = LibStub("AceLocale-3.0"):NewLocale("GatherMate_CartImport", "frFR")
	if L then
		L["Merge will add the data in Cartographer gathering modules to your database. Overwrite will replace your database with the data found in Cartographer gathering modules."] ="La fusion ajoutera les données des modules de récolte de Cartographer dans votre base de données. L'écrasement remplacera votre base de données par les données contenues dans les modules de récolte de Cartographer."
		L["Import Cartographer Data"] = "Importer Cartographer"
		L["Import the data from currently enabled Cartographer modules into your database."] = "Importe les données des modules Cartographer actuellement activés dans votre base de données."
		L["Cartographer data has been imported."] = "Les données de Carthographer ont été importés."
	end
	
	-- ruRU stuff
	--Translated by StingerSoft (Eritnull aka Шептун)
	local L = LibStub("AceLocale-3.0"):NewLocale("GatherMate_CartImport", "ruRU")
	if L then
		L["Merge will add the data in Cartographer gathering modules to your database. Overwrite will replace your database with the data found in Cartographer gathering modules."] = "Объединение собирательных модулей Картографа с вашей базой данных. Перезаписывая вашу базу данных на данные найденные в собирательных модулях Картографа."
		L["Import Cartographer Data"] = "Импортировать данные Картографа."
		L["Import the data from currently enabled Cartographer modules into your database."] = "Импортировать данные с включенных на данный момент модулей Картографа в вашу базу данных."
		L["Cartographer data has been imported."] = "Данные Картографа импортированы."
	end
end
local L = LibStub("AceLocale-3.0"):GetLocale("GatherMate_CartImport", false)

local db

local db_options = {
	["Merge"] = LG["Merge"],
	["Overwrite"] = LG["Overwrite"]
}
local db_tables = {
	["Herbs"] = LG["Herbalism"],
	["Mines"] = LG["Mining"],
	["Gases"] = LG["Gas Clouds"],
	["Fish"]  = LG["Fishing"],
	["Treasure"] = LG["Treasure"],
}
local ImportHelper = {}
function ImportHelper:GetImportDatabase(info,k)
	if k == "Herbs" and Cartographer_HerbalismDB then
		return CartImport.db.Databases[k] and true or false
	end
	if k == "Mines" and Cartographer_MiningDB then
		return CartImport.db.Databases[k] and true or false
	end
	if k == "Gases" and Cartographer_ExtractGasDB then
		return CartImport.db.Databases[k] and true or false
	end
	if k == "Fish" and Cartographer_FishingDB then
		return CartImport.db.Databases[k] and true or false
	end	
	if k == "Treasure" and Cartographer_TreasureDB then
		return CartImport.db.Databases[k] and true or false
	end	
	return nil
end
function ImportHelper:SetImportDatabase(info,k,state)
	if k == "Herbs" and Cartographer_HerbalismDB then
		if state == nil then state = false end
		CartImport.db.Databases[k] = state
	end
	if k == "Mines" and Cartographer_MiningDB then
		if state == nil then state = false end
		CartImport.db.Databases[k] = state
	end
	if k == "Gases" and Cartographer_ExtractGasDB then
		if state == nil then state = false end
		CartImport.db.Databases[k] = state
	end
	if k == "Fish" and Cartographer_FishingDB then
		if state == nil then state = false end
		CartImport.db.Databases[k] = state
	end	
	if k == "Treasure" and Cartographer_TreasureDB then
		if state == nil then state = false end
		CartImport.db.Databases[k] = state
	end	
end
function ImportHelper:GetImportStyle(info,k)
	return CartImport.db.Style
end
function ImportHelper:SetImportStyle(info,k,state)
	CartImport.db.Style = k
end


local optionsTable = {
 	type = "group",
	name = "Cartographer", -- addon name to import from, don't localize
	handler = ImportHelper,
	disabled = function() return not IsAddOnLoaded("Cartographer") end,
	args = {
		desc = {
			order = 0,
			type = "description",
			name = LG["Importing_Desc"],
		},
		loadDatabase = {
			order = 2,
			name = LG["Databases to Import"],
			desc = LG["Databases you wish to import"],
			type = "multiselect",
			values = db_tables,
			set = "SetImportDatabase",
			get = "GetImportDatabase",
			arg = "GatherMate_CartImport",
			tristate = true,
		},		
		loadType = {
			order = 1,
			name = LG["Import Style"],
			desc = L["Merge will add the data in Cartographer gathering modules to your database. Overwrite will replace your database with the data found in Cartographer gathering modules."],
			type = "select",
			values = Config.importHelper.db_options,
			set = "SetImportStyle",
			get = "GetImportStyle",
			arg = "GatherMate_CartImport",
		},
		loadData = {
			order = 8,
			name = L["Import Cartographer Data"],
			desc = L["Import the data from currently enabled Cartographer modules into your database."],
			type = "execute",
			func = function() 
					CartImport:PerformImport(CartImport.db.Databases,CartImport.db.Style)
					Config:Print(L["Cartographer data has been imported."])
					Config:SendMessage("GatherMateConfigChanged")
			end,
			disabled = function()
				local cm = 0
				if  Cartographer_FishingDB and CartImport.db.Databases["Fish"] then cm = 1 end
				if  Cartographer_ExtractGasDB and CartImport.db.Databases["Gases"] then cm = 1 end
				if  Cartographer_MiningDB and CartImport.db.Databases["Mines"] then cm = 1 end
				if  Cartographer_HerbalismDB and CartImport.db.Databases["Herbs"] then cm = 1 end
				if  Cartographer_TreasureDB and CartImport.db.Databases["Treasure"] then cm = 1 end
				return cm == 0
			end,
		},
	},
}
local db = Config:RegisterImportModule("CartImport", optionsTable)
CartImport.db = db


local BZ = LibStub("LibBabble-Zone-3.0"):GetLookupTable()

local math_floor = math.floor
local function getXY(id)
	return (id % 10001)/10000, math_floor(id / 10001)/10000
end
function CartImport:PerformImport(dbs,style)
	if dbs["Mines"] then self:MergeMines(style ~= "Merge")end
	if dbs["Herbs"] then self:MergeHerbs(style ~= "Merge")end
	if dbs["Gases"] then self:MergeGases(style ~= "Merge")end
	if dbs["Fish"]  then self:MergeFishes(style ~= "Merge")end
	if dbs["Treasure"]  then self:MergeTreasure(style ~= "Merge")end
end

function CartImport:MergeFishes(clear)
	if Cartographer_FishingDB then
		local BO = AceLibrary("Babble-Fish-2.2")
		if clear then GatherMate:ClearDB("Fishing") 	end
		for zoneName, node_table in pairs(Cartographer_FishingDB.nodes) do
			if zoneName ~= "version" then
				zoneName = BZ[zoneName]
				for coord, nodename in pairs(node_table) do
					local x,y = getXY(coord)
					GatherMate:AddNode(zoneName, x, y, "Fishing", BO[nodename])
				end
			end
		end
	end
end
function CartImport:MergeGases(clear)
	if Cartographer_ExtractGasDB then
		local BO = AceLibrary("Babble-Gas-2.2")
		if clear then GatherMate:ClearDB("Extract Gas") end
		for zoneName, node_table in pairs(Cartographer_ExtractGasDB) do
			if zoneName ~= "version" then
				zoneName = BZ[zoneName]
				for coord, nodename in pairs(node_table) do
					local x,y = getXY(coord)
					GatherMate:AddNode(zoneName, x, y, "Extract Gas", BO[nodename])
				end
			end
		end
	end
end
function CartImport:MergeMines(clear)
	if Cartographer_MiningDB then
		local BO = AceLibrary("Babble-Ore-2.2")
		if clear then GatherMate:ClearDB("Mining") end
		for zoneName, node_table in pairs(Cartographer_MiningDB) do
			if zoneName ~= "version" then
				zoneName = BZ[zoneName]
				for coord, nodename in pairs(node_table) do
					local x,y = getXY(coord)
					GatherMate:AddNode(zoneName, x, y, "Mining", BO[nodename])
				end
			end
		end
	end
end
function CartImport:MergeHerbs(clear)
	if Cartographer_HerbalismDB then
		local BO = AceLibrary("Babble-Herbs-2.2")
		if clear then GatherMate:ClearDB("Herb Gathering") end
		for zoneName, node_table in pairs(Cartographer_HerbalismDB) do
			if zoneName ~= "version" then
				zoneName = BZ[zoneName]
				for coord, nodename in pairs(node_table) do
					local x,y = getXY(coord)
					GatherMate:AddNode(zoneName, x, y, "Herb Gathering", BO[nodename])
				end
			end
		end
	end
end
function CartImport:MergeTreasure(clear)
	if Cartographer_TreasureDB then
		if clear then GatherMate:ClearDB("Treasure") end
		for zoneName, node_table in pairs(Cartographer_TreasureDB) do
			if zoneName ~= "version" then
				zoneName = BZ[zoneName]
				for coord, nodename in pairs(node_table) do
					local x,y = getXY(coord)
					-- right now this only works for english
					if rawget(LG,nodename.title) then
						GatherMate:AddNode(zoneName, x, y, "Treasure", LG[nodename.title])
					end
				end
			end
		end
	end
end

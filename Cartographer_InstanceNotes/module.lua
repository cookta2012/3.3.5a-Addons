assert(Cartographer, "Cartographer not found!")
local revision = tonumber(string.sub("$Revision: 2250 $", 12, -3))
if revision > Cartographer.revision then
	Cartographer.version = "r" .. revision
	Cartographer.revision = revision
	Cartographer.date = string.sub("$Date: 2008-10-07 23:10:53 +0000 (Tue, 07 Oct 2008) $", 8, 17)
end

local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer_InstanceNotes")
local B = Rock("LibBabble-Boss-3.0")
local BB = B:GetLookupTable()
local BBB = B:GetBaseLookupTable()

Cartographer_InstanceNotes = Cartographer:NewModule("InstanceNotes")

function Cartographer_InstanceNotes:OnInitialize()
	self.name = L["Instance Notes"]
	self.title = L["Instance Notes"]
    Cartographer.options.args.InstanceNotes = {
        name = L["Instance Notes"],
        desc = L["Module which adds default notes to the instance maps."],
        type = 'group',
        args = {
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
	
	local missing = nil -- {} -- make this a table if you want to check what's missing.
	if missing or GetLocale() ~= "enUS" then
		Cartographer_InstanceNotes.missingTranslations = missing
	
		local lvlPattern = "Lvl ([%d%?]+) (.*)" -- Lvl 54 Dragon
		local lvlElitePattern = "Lvl ([%d%?]+) Elite (.*)" -- Lvl 54 Elite Dragon
	
		local function simpleTryConvert(s)
			if BBB[s] then
				return BB[s]
			elseif L:HasBaseTranslation(s) then
				return L[s]
			end
			return nil
		end
		local function tryConvert(s)
			local new = simpleTryConvert(s)
			if new then
				return new
			end
		
			local lvl, name = s:match(lvlElitePattern)
			if lvl then
				new = simpleTryConvert(name)
				if new then
					name = new
				elseif missing then
					missing[name] = true
				end
				return L["Lvl %s Elite %s"]:format(lvl, name)
			end
		
			local lvl, name = s:match(lvlPattern)
			if lvl then
				new = simpleTryConvert(name)
				if new then
					name = new
				elseif missing then
					missing[name] = true
				end
				return L["Lvl %s %s"]:format(lvl, name)
			end
			if missing then
				missing[s] = true
			end
			return s
		end
	
		for zname, zdata in pairs(Cartographer_InstanceNotesDB) do
			if type(zdata) == "table" then
				for id, note in pairs(zdata) do
					local title, info, info2 = note.title, note.info, note.info2
					if title then
						note.title = tryConvert(title)
					end
					if info then
						note.info = tryConvert(info)
					end
					if info2 then
						note.info2 = tryConvert(info2)
					end
				end
			end
		end
	end
end

function Cartographer_InstanceNotes:OnEnable()
    if Cartographer_Notes then
        Cartographer_Notes:RegisterNotesDatabase("InstanceNotes", Cartographer_InstanceNotesDB, self)
    end
end

function Cartographer_InstanceNotes:OnNoteClick(...)
    if Cartographer:IsModuleActive("InstanceLoot") then
        Cartographer_InstanceLoot:OnClick(...)
    end
end

function Cartographer_InstanceNotes:OnDisable()
    if Cartographer_Notes then
        Cartographer_Notes:UnregisterNotesDatabase("InstanceNotes")
    end
end

Cartographer_InstanceNotes.noteDefaults = {
	titleCol = Cartographer_Notes.getColorID(0.90196, 0, 0)
}

local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer_QuestInfo")
local BZR = LibStub("LibBabble-Zone-3.0"):GetReverseLookupTable()

local Quixote = LibStub("LibQuixote-2.0")

local C = Cartographer
local CQI = Cartographer_QuestInfo

-------------------------------------------------------------------

----
-- for start and end npc, the CQI_Data is:
-- { 
--		quest = "<quest_title>",
--		npc = <NPC>,
-- },
--
-- for objective, the CQI_Data is:
-- {
--		quest = "<quest_title>",
--		obj = <OBJECTIVE>,
-- }
----
function CQI:Hook_QuestLog_UpdateQuestDetails()
	self:CloseSeriesFrame()
	self:CloseLocationFrame()
	
	CQI_InfoButton:Hide()
	CQI_StartButton:Hide()
	CQI_EndButton:Hide()
	
	for i = 1, 9 do
		local button = getglobal("CQI_ObjButton"..i)
		button:Hide()
	end

	if not C:IsModuleActive(self) then return end

	local qlink = GetQuestLink(GetQuestLogSelection())
	if not qlink then return end
	local uid = tonumber(string.match(qlink, 'quest:(%d+)'))
	local q = self:GetQuest(uid)
	if not q then return end

	CQI_InfoButton.CQI_Data = q
	CQI_InfoButton:Show()

	if q.start_npc then
		CQI_StartButton.CQI_Data = {
			quest = q.title_full,
			npc = q.start_npc,
			type = "start",
		}
		CQI_StartButton:Show()
	end

	if q.end_npc then
		CQI_EndButton.CQI_Data = {
			quest = q.title_full,
			npc = q.end_npc,
			type = "end",
		}
		CQI_EndButton:Show()
	end
		
	if q.objs then
		local obj_type = q.daily and "obj-daily" or "obj"
		for i = 1, 9 do
			local q_string = _G["QuestLogObjective"..i]
			if q_string and q_string:IsShown() and q.objs[i] and q.objs[i].npcs then
				local button = _G["CQI_ObjButton"..i]
				button.CQI_Data = {
					quest = q.title_full,
					obj = q.objs[i],
					type = obj_type,
				}
	 			button:ClearAllPoints()
				button:SetPoint("TOPLEFT", q_string, "TOPLEFT", 0, 0)
				button:SetPoint("BOTTOMRIGHT", q_string, "BOTTOMRIGHT", 0, 0)
				button:Show()
			end
		end
	end
end

-------------------------------------------------------------------

function CQI:OnButtonClick(this, button, data)
	if not data then
		data = this.CQI_Data
		if not data then return end
	end
	
	self:CloseLocationFrame()
	CQI_Tooltip:Hide()
	self:ClearQuestNotes()

	local type = data.type
	local map = {}
	map.quest = data.quest
	map.zones = {}

	if type == "start" or type == "end" then
		map.title = (type == "start") and L["Quest Start"] or L["Quest End"]
		map.npcs = { data.npc }		
	else
		map.title = data.obj.title
		map.npcs = data.obj.npcs
	end
	
	if not map.npcs then return end
	
	local zone_count = 0
	local last_zone = nil
	
	for _, npc in ipairs(map.npcs) do
		if npc.loc then
			for zone, pos in pairs(npc.loc) do
				if BZR[zone] then
					if not map.zones[zone] then
						map.zones[zone] = { npc }
						last_zone = zone
						zone_count = zone_count + 1
					else
						table.insert(map.zones[zone], npc)
					end
				end
			end
		end
	end
	
	if zone_count == 1 then
		self:OpenQuestMap(map.quest, map.title, type, last_zone, map.zones[last_zone])
	elseif zone_count > 1 then
		self:OpenLocationFrame(map)
	end
end

function CQI:OnButtonTooltip(this, data)
	if not data then
		data = this.CQI_Data
		if not data then return end
	end
	
	local type = data.type
	local npcs, title
	if type == "start" or type == "end" then
		title = (type == "start") and L["Quest Start"] or L["Quest End"]
		npcs = { data.npc }
	else
		title = L["Quest Objective"]
		npcs = data.obj and data.obj.npcs
	end
	
	if not npcs or #npcs == 0 then return end
	
	CQI_Tooltip:SetOwner(this, "ANCHOR_RIGHT")
	CQI_Tooltip:ClearLines()
	CQI_Tooltip:AddLine(title, 1, 0.5, 0)

	if #npcs == 1 then
		CQI_Tooltip:AddLine(npcs[1].name, 1, 1, 1)
	end
	
	local i = 0
	for _, npc in ipairs(npcs) do
		if npc.loc then
			for zone, pos in pairs(npc.loc) do
				local j = 0
				for _, l in ipairs(pos) do
					if l.x ~= 0 and l.y ~= 0 then
						if j < 3 then
							zone = zone..string.format(" <%d,%d>", l.x, l.y)
							j = j + 1
						else
							zone = zone..L[" ..."]
							break
						end
					end
				end
				if i < 5 then
					if #npcs == 1 then
						CQI_Tooltip:AddLine(zone, 0.8, 1, 0)
					else
						local npc_name = npc.name
						if npc.drop_rate then
							npc_name = npc_name.." ("..npc.drop_rate.."%)"
						end
						CQI_Tooltip:AddDoubleLine(npc_name, zone, 1, 1, 1, 0.8, 1, 0)
					end
				end
				i = i + 1
			end
		end
	end

	if i >= 5 then
		CQI_Tooltip:AddDoubleLine(" ", L["... more"], 1, 1, 1, 0.6, 0.6, 0.6)
	end
	
	CQI_Tooltip:Show()
end

-------------------------------------------------------------------

function CQI:Hook_QuestLog_Update()
	if not self.db.profile.showQuestTag then return end
					
    -- patch QuestLogScrollFrame.update
    if QuestLogScrollFrame.update ~= QuestLog_Update then
        QuestLogScrollFrame.update = QuestLog_Update
					end

	-- Update the quest listing
	local numEntries = GetNumQuestLogEntries();
	local buttons = QuestLogScrollFrame.buttons
	local numButtons = #buttons
	for i = 1, numButtons do
		local questLogTitle = buttons[i]
		local questIndex = questLogTitle:GetID()
		if questIndex <= numEntries then
			local title, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily = GetQuestLogTitle(questIndex)
			if not isHeader then
                local titleText = questLogTitle:GetText()
    			if titleText and not titleText:find("%[.-%]") then
					titleText = "  ["..level.."] " .. titleText:trim()
    				questLogTitle:SetText(titleText)
        			QuestLogTitleButton_Resize(questLogTitle)
				end
			end
		end
	end
end

function CQI:Hook_ExpandQuestHeader()
	if not self.db.profile.showQuestTag then return end
	self:AddTimer(0, CQI.Hook_QuestLog_Update, CQI)
end

-------------------------------------------------------------------

local function QuestIconFaded(title)
	local objectives, complete = select(6, Quixote:GetQuest(title))
	-- if we don't have the quest, we don't fade it:
	if objectives == nil and complete == nil then return false end
	return not (complete == 1 or objectives == 0)
end

local function GossipLoop(buttonindex, do_texture, ...)
	local numQuests = select('#', ...)
	for i = 2, numQuests, 3 do
		local button = _G["GossipTitleButton"..buttonindex]
		if button and not button:GetText():find("%[.-%]") then
			local level = select(i, ...)
			button:SetText(string.format('[%s] %s', level == -1 and '*' or level, button:GetText()))
            local button_icon = _G["GossipTitleButton"..buttonindex.."GossipIcon"]
            if button_icon then
			if do_texture and QuestIconFaded(Quixote:GetQuest(select(i-1, ...))) then
    				button_icon:SetVertexColor(0.5, 0.5, 0.5, 0.5)
			else
    				button_icon:SetVertexColor(1, 1, 1, 1)
    			end
			end
		end
		buttonindex = buttonindex + 1
	end
	return buttonindex + 1
end

local function ShowQuestTagOnGossip()
	local buttonindex = 1
	if GetGossipAvailableQuests() then
		buttonindex = GossipLoop(buttonindex, false, GetGossipAvailableQuests())
	end
	if GetGossipActiveQuests() then
		buttonindex = GossipLoop(buttonindex, true, GetGossipActiveQuests())
	end
end

local function ShowQuestTagOnGreeting()
	local numActive = GetNumActiveQuests()
	local numAvailable = GetNumAvailableQuests()
	local o = 0
	local GetTitle = GetActiveTitle
	local GetLevel = GetActiveLevel
	for i = 1, numActive + numAvailable do
		local button = _G["QuestTitleButton"..i]
		if not button or button:GetText():find("%[.-%]") then break end
		if i == numActive + 1 then
			o = numActive
			GetTitle = GetAvailableTitle
			GetLevel = GetAvailableLevel
		end		
		local title = GetTitle(i-o)
		local level = GetLevel(i-o)
		button:SetText(string.format('[%s] %s', level == -1 and '*' or level, title))
        local button_icon = _G["QuestTitleButton"..i.."QuestIcon"]
        if button_icon then
		if QuestIconFaded(title) then
    			button_icon:SetVertexColor(0.5, 0.5, 0.5, 0.5)
		else
    			button_icon:SetVertexColor(1, 1, 1, 1)
    		end
		end
	end
end

function CQI:GOSSIP_SHOW()
	if not self.db.profile.showQuestTag then return end
	self:AddTimer(0, ShowQuestTagOnGossip)
end

function CQI:QUEST_GREETING()
	if not self.db.profile.showQuestTag then return end
	self:AddTimer(0, ShowQuestTagOnGreeting)
end

-------------------------------------------------------------------

function CQI:PatchQuestLog()
	if self.IsQuestLogPatched then return end
	self.IsQuestLogPatched = true

	-- delay patch show quest tag, so other addons can take chance first
	self:AddTimer(1, function()
		self:AddSecureHook("QuestLog_UpdateQuestDetails", "Hook_QuestLog_UpdateQuestDetails")
		self:AddSecureHook("QuestLog_Update", "Hook_QuestLog_Update")
		self:AddSecureHook("ExpandQuestHeader", "Hook_ExpandQuestHeader")
		self:AddEventListener("GOSSIP_SHOW")
		self:AddEventListener("QUEST_GREETING")
	end)
end

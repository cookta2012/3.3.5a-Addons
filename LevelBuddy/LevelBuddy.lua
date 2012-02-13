local UnitXP, UnitXPMax, UnitLevel, UnitClass = UnitXP, UnitXPMax, UnitLevel, UnitClass;
local GetNumFriends, GetFriendInfo = GetNumFriends, GetFriendInfo;
local GetNumRaidMembers, GetNumPartyMembers = GetNumRaidMembers, GetNumPartyMembers;
local SendAddonMessage = SendAddonMessage;
local MainMenuExpBar = MainMenuExpBar;
local RAID_CLASS_COLORS = RAID_CLASS_COLORS;


local core = CreateFrame("Frame");
core:Hide();
local marks = {};
local recycle = {};
local friends = {};
LevelBuddy_Send = {};
LevelBuddy_Receive = {};
LevelBuddy_Share = {};
LevelBuddy_Settings = {
	bar = 1,
	width = 1,
	scale = 1,
};
local player = UnitName("PLAYER");


local ldb = LibStub:GetLibrary("LibDataBroker-1.1");
local dataobj = ldb:NewDataObject("LevelBuddy",{
	type = "data source",
	text = "LevelBuddy",
	label = "LevelBuddy",
	icon = "Interface\\AddOns\\LevelBuddy\\mark.blp",
	iconR = 1,
	iconG = 1,
	iconB = 1,
});


local customBar = CreateFrame("Frame","LevelBuddyCustomBar",UIParent);
customBar:SetMovable();
customBar:SetClampedToScreen();
customBar:SetPoint("CENTER",UIParent,"CENTER");
customBar:SetFrameStrata("TOOLTIP");
customBar.texture = customBar:CreateTexture(nil,"ARTWORK");
customBar.texture:SetAllPoints(customBar);
customBar.texture:SetTexture(1,1,1,0.7);
customBar:EnableMouse();
customBar:SetScript("OnMouseDown",function(self) 
	self:StartMoving();
end);
customBar:SetScript("OnMouseUp",function(self) 
	self:StopMovingOrSizing();
end);
customBar:Hide();


local delay = 0.1;
core:SetScript("OnUpdate",function(self,elapsed)
	delay = delay - elapsed;
	if delay <= 0 then
		GameTooltip:ClearLines();
		GameTooltip:AddLine("LevelBuddy");
		for k,v in pairs(marks) do
			if v:IsMouseOver() then
				GameTooltip:AddLine(" ");
				GameTooltip:AddLine(k, RAID_CLASS_COLORS[v.class].r, RAID_CLASS_COLORS[v.class].g, RAID_CLASS_COLORS[v.class].b, 1);
				GameTooltip:AddLine("Level: "..v.level, 1, 1, 1, 1);
				GameTooltip:AddLine("XP: "..v.value.." / "..v.max, 1, 1, 1, 1);
				GameTooltip:AddLine("Percentage: "..string.format("%.2f",v.value/v.max*100).."%", 1, 1, 1, 1);
			end
		end
		GameTooltip:Show();
		delay = 0.1;
	end
end);


local function CreateMark(name)
	if recycle[1] then
		marks[name] = recycle[1];
		table.remove(recycle,1);
		marks[name]:Show();
	else
		marks[name] = CreateFrame("Frame");
		marks[name]:SetHeight(32);
		marks[name]:SetWidth(32);
		marks[name]:SetFrameStrata("DIALOG");
		marks[name].texture = marks[name]:CreateTexture(nil,"OVERLAY");
		marks[name].texture:SetAllPoints(marks[name]);
		marks[name].texture:SetTexture("Interface\\AddOns\\LevelBuddy\\mark.blp");
		
		marks[name]:EnableMouse();
		marks[name]:SetScript("OnEnter",function(self)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
			core:Show();
		end);
		marks[name]:SetScript("OnLeave",function(self)
			core:Hide();
			GameTooltip:Hide();
		end);
	end
	ReputationWatchBar_Update();
end


local function UpdateMark(name,value,max,level,class)
	if not marks[name] then
		CreateMark(name);
	end
	
	if value then
		marks[name].value = value;
	else
		value = marks[name].value;
	end
	
	if max then
		marks[name].max = max;
	else
		max = marks[name].max;
	end
	
	if level then
		marks[name].level = level;
	else
		level = marks[name].level;
	end
	
	if class then
		marks[name].class = class;
	else
		class = marks[name].class;
	end
	
	if LevelBuddy_Settings.rotate then
		marks[name].texture:SetRotation(math.pi);
	else
		marks[name].texture:SetRotation(0);
	end
	
	marks[name]:SetScale(LevelBuddy_Settings.scale);
	
	marks[name]:ClearAllPoints();
	if LevelBuddy_Settings.bar == 1 then
		marks[name]:SetParent(MainMenuExpBar);
		marks[name]:SetPoint("BOTTOM",MainMenuExpBar,"BOTTOMLEFT",(MainMenuExpBar:GetWidth()*value/max) / LevelBuddy_Settings.scale, 2 / LevelBuddy_Settings.scale);
		marks[name]:Show();
	elseif LevelBuddy_Settings.bar == 2 then
		marks[name]:SetParent(UIParent);
		marks[name]:SetPoint("CENTER",customBar,"LEFT",(customBar:GetWidth()*value/max) / LevelBuddy_Settings.scale,0);
		marks[name]:Show();
	elseif LevelBuddy_Settings.bar == 3 then
		marks[name]:Hide();
	end
	
	marks[name].texture:SetVertexColor(RAID_CLASS_COLORS[class].r,RAID_CLASS_COLORS[class].g,RAID_CLASS_COLORS[class].b,1);
	if tonumber(level) ~= UnitLevel("PLAYER") then
		marks[name]:SetAlpha(0.6);
	else
		marks[name]:SetAlpha(1);
	end
	
	if LevelBuddy_Settings.track == name then
		dataobj.label = nil;
		dataobj.text = "\124cFF"..string.format("%02x%02x%02x", RAID_CLASS_COLORS[class].r*225, RAID_CLASS_COLORS[class].g*225, RAID_CLASS_COLORS[class].b*225)..name..": \124r"..string.format("%.0f",value/max*100).."%";
		dataobj.iconR = RAID_CLASS_COLORS[class].r;
		dataobj.iconG = RAID_CLASS_COLORS[class].g;
		dataobj.iconB = RAID_CLASS_COLORS[class].b;
	end
end


local function DeleteMark(name)
	marks[name]:Hide();
	table.insert(recycle,marks[name]);
	marks[name] = nil;
	ReputationWatchBar_Update();
	
	if LevelBuddy_Settings.track == name then
		dataobj.label = "LevelBuddy";
		dataobj.text = "LevelBuddy";
		dataobj.iconR = 1;
		dataobj.iconG = 1;
		dataobj.iconB = 1;
	end
end


core:SetScript("OnEvent",function(self,event,arg1,msg,method,sender,...)
	if event == "PLAYER_XP_UPDATE" and arg1 == "player" then
		local value,max,level,class = UnitXP("PLAYER"),UnitXPMax("PLAYER"),UnitLevel("PLAYER"),select(2,UnitClass("PLAYER"));
		for k,v in pairs(friends) do
			if LevelBuddy_Send[k] then
				SendAddonMessage("LevelBuddy",value..":"..max..":"..level..":"..class,"WHISPER",k);
			end
		end
		if LevelBuddy_Settings.self then
			UpdateMark(player,value,max,level,class);
		end
	elseif event == "CHAT_MSG_ADDON" then
		if arg1 == "LevelBuddy" then
			if friends[sender] and LevelBuddy_Receive[sender] then
				local value,max,level,class = msg:match("^(.-):(.-):(.-):(.-)$");
				UpdateMark(sender,value,max,level,class);
			end
		elseif arg1 == "LevelBuddyRequest" then
			if LevelBuddy_Send[sender] then
				SendAddonMessage("LevelBuddy",UnitXP("PLAYER")..":"..UnitXPMax("PLAYER")..":"..UnitLevel("PLAYER")..":"..select(2,UnitClass("PLAYER")),"WHISPER",sender);
			end
		elseif arg1 == "LevelBuddyCancel" then
			if marks[sender] and LevelBuddy_Receive[sender] then
				DeleteMark(sender);
			end
		end
	elseif event == "FRIENDLIST_UPDATE" then
		wipe(friends);
		for i=1,GetNumFriends() do
			local name, level, class, area, connected, status, note, raf = GetFriendInfo(i);
			if connected then
				if not marks[name] and LevelBuddy_Receive[name] then
					SendAddonMessage("LevelBuddyRequest","(\"(0_o)\")","WHISPER",name);
				end
				friends[name] = true;
			else
				friends[name] = false;
			end
		end
		for k,v in pairs(marks) do
			if not friends[k] and k ~= player then
				DeleteMark(k);
			end
		end
		for k,v in pairs(LevelBuddy_Send) do
			if friends[k] == nil then
				LevelBuddy_Send[k] = nil;
			end
		end
		for k,v in pairs(LevelBuddy_Receive) do
			if friends[k] == nil then
				LevelBuddy_Receive[k] = nil;
			end
		end
		for k,v in pairs(LevelBuddy_Share) do
			if friends[k] == nil then
				LevelBuddy_Share[k] = nil;
			end
		end
	elseif event == "PLAYER_ENTERING_WORLD" then
		core:UnregisterEvent("PLAYER_ENTERING_WORLD");
		ShowFriends();
		if LevelBuddy_Settings.self then
			local value,max,level,class = UnitXP("PLAYER"),UnitXPMax("PLAYER"),UnitLevel("PLAYER"),select(2,UnitClass("PLAYER"));
			UpdateMark(player,value,max,level,class);
		end
	elseif event == "QUEST_ACCEPTED" then
		local raid = GetNumRaidMembers();
		local party = GetNumPartyMembers();
		if raid > 0 then
			for i=1,raid do
				local name = UnitName("RAID"..i);
				if friends[name] and LevelBuddy_Share[name] then
					QuestLogPushQuest(arg1);
					break;
				end
			end
		elseif party > 0 then
			for i=1,party do
				local name = UnitName("PARTY"..i);
				if friends[name] and LevelBuddy_Share[name] then
					QuestLogPushQuest(arg1);
					break;
				end
			end
		end
	elseif event == "ADDON_LOADED" and arg1 == "LevelBuddy" then
		core:UnregisterEvent("ADDON_LOADED");
		if not LevelBuddy_Settings.bar then
			LevelBuddy_Settings.bar = 1;
		end
		if not LevelBuddy_Settings.width then
			LevelBuddy_Settings.width = 1;
		end
		if not LevelBuddy_Settings.scale then
			LevelBuddy_Settings.scale = 1;
		end
		customBar:SetWidth(LevelBuddy_Settings.width * UIParent:GetWidth());
		customBar:SetHeight(22 * LevelBuddy_Settings.scale);
	end
end);
core:RegisterEvent("PLAYER_XP_UPDATE");
core:RegisterEvent("CHAT_MSG_ADDON");
core:RegisterEvent("FRIENDLIST_UPDATE");
core:RegisterEvent("PLAYER_ENTERING_WORLD");
core:RegisterEvent("QUEST_ACCEPTED");
core:RegisterEvent("ADDON_LOADED");


MainMenuExpBar.alwaysShow = true;
hooksecurefunc("ReputationWatchBar_Update",function()
	if LevelBuddy_Settings.bar == 1 and not MainMenuExpBar:IsShown() then
		local show = false;
		for k,v in pairs(marks) do
			show = true;
			break;
		end
		if show then
			ReputationWatchStatusBar:SetHeight(8);
			ReputationWatchBar:ClearAllPoints();
			ReputationWatchBar:SetPoint("BOTTOM", MainMenuBar, "TOP", 0, -3);
			ReputationWatchStatusBarText:SetPoint("CENTER", ReputationWatchBarOverlayFrame, "CENTER", 0, 3);
			ReputationWatchBarTexture0:Show();
			ReputationWatchBarTexture1:Show();
			ReputationWatchBarTexture2:Show();
			ReputationWatchBarTexture3:Show();

			ReputationXPBarTexture0:Hide();
			ReputationXPBarTexture1:Hide();
			ReputationXPBarTexture2:Hide();
			ReputationXPBarTexture3:Hide();

			MainMenuExpBar:Show();
			MainMenuExpBar.pauseUpdates = nil;

			MainMenuBarMaxLevelBar:Hide();
		end
	end
end);


local options = CreateFrame("Frame",nil,FriendsListFrame);
options:SetWidth(135);
options:SetHeight(412);
options:SetPoint("TOPLEFT",FriendsFrame,"TOPRIGHT",-30,-27);
options:SetBackdrop({ 
	bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
	edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", tile = true, tileSize = 32, edgeSize = 32, 
	insets = { left = 11, right = 11, top = 12, bottom = 10 }
});
options:EnableMouse();
options:Hide();


options.friend = options:CreateFontString(nil,"ARTWORK","GameFontHighlight");
options.friend:SetPoint("TOPLEFT",options,"TOPLEFT",15,-15);
options.friend:SetText("Selected Friend");


options.send = CreateFrame("CheckButton","LevelBuddySend",options,"UICheckButtonTemplate");
options.send:SetPoint("TOPLEFT",options.friend,"BOTTOMLEFT",0,-5);
LevelBuddySendText:SetText("Send XP");
options.send:SetScript("OnClick",function(self)
	local name = GetFriendInfo(GetSelectedFriend());
	LevelBuddy_Send[name] = self:GetChecked();
	if friends[name] then
		if LevelBuddy_Send[name] then
			SendAddonMessage("LevelBuddy",UnitXP("PLAYER")..":"..UnitXPMax("PLAYER")..":"..UnitLevel("PLAYER")..":"..select(2,UnitClass("PLAYER")),"WHISPER",name);
		else
			SendAddonMessage("LevelBuddyCancel","(\"(0_o)\")","WHISPER",name);
		end
	end
end);
options.send:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:ClearLines();
	GameTooltip:AddLine("Send XP");
	GameTooltip:AddLine("When enabled, every time you gain XP you will send an xp update to the selected friend if they are online.",1,1,1,1);
	GameTooltip:Show();
end);
options.send:SetScript("OnLeave",function(self)
	GameTooltip:Hide();
end);


options.receive = CreateFrame("CheckButton","LevelBuddyReceive",options,"UICheckButtonTemplate");
options.receive:SetPoint("TOPLEFT",options.send,"BOTTOMLEFT",0,3);
LevelBuddyReceiveText:SetText("Receive XP");
options.receive:SetScript("OnClick",function(self)
	local name = GetFriendInfo(GetSelectedFriend());
	LevelBuddy_Receive[name] = self:GetChecked();
	if LevelBuddy_Receive[name] then
		if friends[name] and not marks[name] then
			SendAddonMessage("LevelBuddyRequest","(\"(0_o)\")","WHISPER",name);
		end
	elseif marks[name] then
		DeleteMark(name);
	end
end);
options.receive:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:ClearLines();
	GameTooltip:AddLine("Receive XP");
	GameTooltip:AddLine("If the selected friend has enabled sending XP updates to you, then enabling this will allow LevelBuddy to listen to those update when it receives them.",1,1,1,1);
	GameTooltip:Show();
end);
options.receive:SetScript("OnLeave",function(self)
	GameTooltip:Hide();
end);


options.share = CreateFrame("CheckButton","LevelBuddyShare",options,"UICheckButtonTemplate");
options.share:SetPoint("TOPLEFT",options.receive,"BOTTOMLEFT",0,3);
LevelBuddyShareText:SetText("Share Quests");
options.share:SetScript("OnClick",function(self)
	local name = GetFriendInfo(GetSelectedFriend());
	LevelBuddy_Share[name] = self:GetChecked();
end);
options.share:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:ClearLines();
	GameTooltip:AddLine("Share Quests");
	GameTooltip:AddLine("Every time you accept a quest, LevelBuddy will check to see if the selected friend is in your group. If this option is enabled and the friend is in your group, it will share the quest you just accepted.",1,1,1,1);
	GameTooltip:Show();
end);
options.share:SetScript("OnLeave",function(self)
	GameTooltip:Hide();
end);


options.track = CreateFrame("CheckButton","LevelBuddyTrack",options,"UICheckButtonTemplate");
options.track:SetPoint("TOPLEFT",options.share,"BOTTOMLEFT",0,3);
LevelBuddyTrackText:SetText("Track Friend");
options.track:SetScript("OnClick",function(self)
	local name = GetFriendInfo(GetSelectedFriend());
	if self:GetChecked() then
		LevelBuddy_Settings.track = name;
		if marks[name] then
			UpdateMark(name);
		end
	else
		LevelBuddy_Settings.track = nil;
		dataobj.label = "LevelBuddy";
		dataobj.text = "LevelBuddy";
		dataobj.iconR = 1;
		dataobj.iconG = 1;
		dataobj.iconB = 1;
	end
end);
options.track:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:ClearLines();
	GameTooltip:AddLine("Track Friend");
	GameTooltip:AddLine("When you receive XP updates from the selected friend, the data will be sent to the LevelBuddy LDB plugin for other addons to display. Only one friend can be tracked at a time.",1,1,1,1);
	GameTooltip:Show();
end);
options.track:SetScript("OnLeave",function(self)
	GameTooltip:Hide();
end);


options.general = options:CreateFontString(nil,"ARTWORK","GameFontHighlight");
options.general:SetPoint("TOPLEFT",options.track,"BOTTOMLEFT",0,-15);
options.general:SetText("Options");


options.self = CreateFrame("CheckButton","LevelBuddySelf",options,"UICheckButtonTemplate");
options.self:SetPoint("TOPLEFT",options.general,"BOTTOMLEFT",0,-5);
LevelBuddySelfText:SetText("Show Self");
options.self:SetScript("OnClick",function(self)
	LevelBuddy_Settings.self = self:GetChecked();
	if LevelBuddy_Settings.self then
		UpdateMark(player,UnitXP("PLAYER"),UnitXPMax("PLAYER"),UnitLevel("PLAYER"),select(2,UnitClass("PLAYER")));
	elseif marks[player] then
		DeleteMark(player);
	end
end);
options.self:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:ClearLines();
	GameTooltip:AddLine("Show Self");
	GameTooltip:AddLine("Treat your xp as if it was one of your friends.",1,1,1,1);
	GameTooltip:Show();
end);
options.self:SetScript("OnLeave",function(self)
	GameTooltip:Hide();
end);


options.rotate = CreateFrame("CheckButton","LevelBuddyRotate",options,"UICheckButtonTemplate");
options.rotate:SetPoint("TOPLEFT",options.self,"BOTTOMLEFT",0,3);
LevelBuddyRotateText:SetText("Flip Markers");
options.rotate:SetScript("OnClick",function(self)
	LevelBuddy_Settings.rotate = self:GetChecked();
	for k,v in pairs(marks) do
		UpdateMark(k);
	end
end);
options.rotate:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:ClearLines();
	GameTooltip:AddLine("Flip Markers");
	GameTooltip:AddLine("Flip the XP bar markers upside down.",1,1,1,1);
	GameTooltip:Show();
end);
options.rotate:SetScript("OnLeave",function(self)
	GameTooltip:Hide();
end);


local function UpdateValues()
	local name = GetFriendInfo(GetSelectedFriend());
	if name then
		options.friend:SetText(name);
		
		options.send:SetChecked(LevelBuddy_Send[name] or false);
		options.send:Enable();
		
		options.receive:SetChecked(LevelBuddy_Receive[name] or false);
		options.receive:Enable();
		
		options.share:SetChecked(LevelBuddy_Share[name] or false);
		options.share:Enable();
		
		options.track:SetChecked(LevelBuddy_Settings.track == name or false);
		options.track:Enable();
	else
		options.friend:SetText("Selected Friend");
		
		options.send:SetChecked(false);
		options.send:Disable();
		
		options.receive:SetChecked(false);
		options.receive:Disable();
		
		options.share:SetChecked(false);
		options.share:Disable();
		
		options.track:SetChecked(false);
		options.track:Disable();
	end
	options.self:SetChecked(LevelBuddy_Settings.self or false);
	options.rotate:SetChecked(LevelBuddy_Settings.rotate or false);
	options.default:SetChecked(LevelBuddy_Settings.bar == 1 or false);
	options.custom:SetChecked(LevelBuddy_Settings.bar == 2 or false);
	options.no:SetChecked(LevelBuddy_Settings.bar == 3 or false);
	options.width:SetValue(LevelBuddy_Settings.width);
	options.scale:SetValue(LevelBuddy_Settings.scale);
	if LevelBuddy_Settings.bar == 2 then
		options.move:Enable();
		options.width:Enable();
	else
		options.move:Disable();
		options.width:Disable();
	end
end
hooksecurefunc("FriendsList_Update",UpdateValues);
options:SetScript("OnShow",UpdateValues);


options.default = CreateFrame("CheckButton","LevelBuddyDefault",options,"UIRadioButtonTemplate");
options.default:SetPoint("TOPLEFT",options.rotate,"BOTTOMLEFT",0,0);
LevelBuddyDefaultText:SetText("Default XP Bar");
options.default:SetScript("OnClick",function(self)
	self:SetChecked(1);
	LevelBuddy_Settings.bar = 1;
	customBar:Hide();
	options.move:SetText("Move Bar");
	UpdateValues();
	for k,v in pairs(marks) do
		UpdateMark(k);
	end
	ReputationWatchBar_Update();
end);
options.default:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:ClearLines();
	GameTooltip:AddLine("Default XP Bar");
	GameTooltip:AddLine("Place the XP markers on the default XP bar.",1,1,1,1);
	GameTooltip:Show();
end);
options.default:SetScript("OnLeave",function(self)
	GameTooltip:Hide();
end);


options.custom = CreateFrame("CheckButton","LevelBuddyCustom",options,"UIRadioButtonTemplate");
options.custom:SetPoint("TOPLEFT",options.default,"BOTTOMLEFT",0,0);
LevelBuddyCustomText:SetText("Use Custom Bar");
options.custom:SetScript("OnClick",function(self)
	self:SetChecked(1);
	LevelBuddy_Settings.bar = 2;
	UpdateValues();
	for k,v in pairs(marks) do
		UpdateMark(k);
	end
	ReputationWatchBar_Update();
end);
options.custom:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:ClearLines();
	GameTooltip:AddLine("Use Custom Bar");
	GameTooltip:AddLine("Place the XP markers on the LevelBuddy custom bar.",1,1,1,1);
	GameTooltip:Show();
end);
options.custom:SetScript("OnLeave",function(self)
	GameTooltip:Hide();
end);


options.no = CreateFrame("CheckButton","LevelBuddyNo",options,"UIRadioButtonTemplate");
options.no:SetPoint("TOPLEFT",options.custom,"BOTTOMLEFT",0,0);
LevelBuddyNoText:SetText("No Bar");
options.no:SetScript("OnClick",function(self)
	self:SetChecked(1);
	LevelBuddy_Settings.bar = 3;
	customBar:Hide();
	options.move:SetText("Move Bar");
	UpdateValues();
	for k,v in pairs(marks) do
		UpdateMark(k);
	end
	ReputationWatchBar_Update();
end);
options.no:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:ClearLines();
	GameTooltip:AddLine("No Bar");
	GameTooltip:AddLine("Do not show the XP markers.",1,1,1,1);
	GameTooltip:Show();
end);
options.no:SetScript("OnLeave",function(self)
	GameTooltip:Hide();
end);


options.width = CreateFrame("Slider","LevelBuddyWidth",options,"OptionsSliderTemplate");
options.width:SetPoint("TOPLEFT",options.no,"BOTTOMLEFT",2,-5);
options.width:SetWidth(100);
options.width:SetMinMaxValues(0,1);
LevelBuddyWidthLow:SetText("0%");
LevelBuddyWidthHigh:SetText("100%");
options.width:SetValueStep(0.01);
options.width:EnableMouseWheel();
options.width:SetScript("OnValueChanged",function(self)
	LevelBuddy_Settings.width = self:GetValue();
	customBar:SetWidth(UIParent:GetWidth() * LevelBuddy_Settings.width);
	for k,v in pairs(marks) do
		UpdateMark(k);
	end
end);
options.width:SetScript("OnMouseWheel",function(self,z)
	local value = self:GetValue() + z/100;
	if z > 1 then
		z = 1;
	elseif z < 0 then
		z = 0;
	end
	self:SetValue(value);
end);
options.width:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:ClearLines();
	GameTooltip:AddLine("Custom Bar Width");
	GameTooltip:AddLine("Sets the width of the custom bar.",1,1,1,1);
	GameTooltip:AddLine("Current value: "..LevelBuddy_Settings.width,1,1,1,1);
	GameTooltip:Show();
end);
options.width:SetScript("OnLeave",function(self)
	GameTooltip:Hide();
end);


options.scale = CreateFrame("Slider","LevelBuddyScale",options,"OptionsSliderTemplate");
options.scale:SetPoint("TOPLEFT",options.width,"BOTTOMLEFT",0,-10);
options.scale:SetWidth(100);
options.scale:SetMinMaxValues(0.1,10);
LevelBuddyScaleLow:SetText("0.1");
LevelBuddyScaleHigh:SetText("10");
options.scale:SetValueStep(0.1);
options.scale:EnableMouseWheel();
options.scale:SetScript("OnValueChanged",function(self)
	LevelBuddy_Settings.scale = self:GetValue();
	customBar:SetHeight(LevelBuddy_Settings.scale * 22);
	for k,v in pairs(marks) do
		UpdateMark(k);
	end
end);
options.scale:SetScript("OnMouseWheel",function(self,z)
	local value = self:GetValue() + z/10;
	if z > 10 then
		z = 10;
	elseif z < 0.1 then
		z = 0.1;
	end
	self:SetValue(value);
end);
options.scale:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:ClearLines();
	GameTooltip:AddLine("Marker Scale");
	GameTooltip:AddLine("Sets the size of the XP markers.",1,1,1,1);
	GameTooltip:AddLine("Current value: "..LevelBuddy_Settings.scale,1,1,1,1);
	GameTooltip:Show();
end);
options.scale:SetScript("OnLeave",function(self)
	GameTooltip:Hide();
end);


options.move = CreateFrame("Button",nil,options,"OptionsButtonTemplate");
options.move:SetPoint("TOPLEFT",options.scale,"BOTTOMLEFT",-2,-10);
options.move:SetWidth(100);
options.move:SetText("Move Bar");
options.move:SetScript("OnClick",function(self)
	if customBar:IsShown() then
		self:SetText("Move Bar");
		customBar:Hide();
	else
		self:SetText("Lock Bar");
		customBar:Show();
	end
end);
options.move:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:ClearLines();
	if customBar:IsShown() then
		GameTooltip:AddLine("Lock Bar");
		GameTooltip:AddLine("Locks the LevelBuddy custom bar so it can't be moved.",1,1,1,1);
	else
		GameTooltip:AddLine("Move Bar");
		GameTooltip:AddLine("Unlocks the LevelBuddy custom bar to move around.",1,1,1,1);
	end
	GameTooltip:Show();
end);
options.move:SetScript("OnLeave",function(self)
	GameTooltip:Hide();
end);


options.reset = CreateFrame("Button",nil,options,"OptionsButtonTemplate");
options.reset:SetPoint("TOPLEFT",options.move,"BOTTOMLEFT",0,0);
options.reset:SetWidth(100);
options.reset:SetText("Reset All");
options.reset:SetScript("OnClick",function()
	LevelBuddy_Settings = {bar = 1, width = 1, scale = 1};
	customBar:Hide();
	customBar:ClearAllPoints();
	customBar:SetPoint("CENTER",UIParent,"CENTER");
	customBar:SetUserPlaced();
	options.move:SetText("Move Bar");
	LevelBuddy_Send = {};
	LevelBuddy_Receive = {};
	LevelBuddy_Share = {};
	UpdateValues();
	for k,v in pairs(marks) do
		DeleteMark(k);
	end
end);
options.reset:SetScript("OnEnter",function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:ClearLines();
	GameTooltip:AddLine("Reset All");
	GameTooltip:AddLine("Resets LevelBuddy to its default options.",1,1,1,1);
	GameTooltip:Show();
end);
options.reset:SetScript("OnLeave",function(self)
	GameTooltip:Hide();
end);


local toggle = CreateFrame("Button",nil,FriendsListFrame,"OptionsButtonTemplate");
toggle:SetPoint("TOPRIGHT",FriendsFrame,"TOPRIGHT",-40,-37);
toggle:SetWidth(90);
toggle:SetText("LevelBuddy");
toggle:SetScript("OnClick",function()
	if options:IsShown() then
		options:Hide();
	else
		options:Show();
	end
end);


function dataobj:OnTooltipShow()
	self:AddLine("LevelBuddy");
	local empty = true;
	for k,v in pairs(marks) do
		empty = false;
		self:AddLine(" ");
		self:AddLine(k, RAID_CLASS_COLORS[v.class].r, RAID_CLASS_COLORS[v.class].g, RAID_CLASS_COLORS[v.class].b, 1);
		self:AddLine("Level: "..v.level, 1, 1, 1, 1);
		self:AddLine("XP: "..v.value.." / "..v.max, 1, 1, 1, 1);
		self:AddLine("Percentage: "..string.format("%.2f",v.value/v.max*100).."%", 1, 1, 1, 1);
	end
	if empty then
		self:AddLine(" ");
		self:AddLine("No friends online who are sending you XP updates",1,1,1,1);
	end
end

function dataobj:OnClick()
	FriendsFrame:Hide();
	FriendsFrame.selectedTab = 1;
	FriendsFrame.showFriendsList = 1;
	ShowUIPanel(FriendsFrame);
	options:Show();
end


SLASH_LEVELBUDDY1 = "/lb";
SLASH_LEVELBUDDY2 = "/levelbuddy";
SlashCmdList["LEVELBUDDY"] = function()
	if options:IsVisible() then
		options:Hide();
	else
		FriendsFrame:Hide();
		FriendsFrame.selectedTab = 1;
		FriendsFrame.showFriendsList = 1;
		ShowUIPanel(FriendsFrame);
		options:Show();
	end
end
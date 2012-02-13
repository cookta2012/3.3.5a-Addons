--[[
    This file is part of TicketChaos. All TicketChaos code is Copyright (C) 2009 Chocochaos

    TicketChaos is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    TicketChaos is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with TicketChaos. If not, see <http://www.gnu.org/licenses/>.
--]]


function ShowGMMessage(msg)
	DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000[TicketChaos]|cffffffff: "..msg);
end

function pairsByKeys (t, f)
	local a = {}
	local b = {}
	for n in pairs (t) do
		table.insert (a, n);
	end
	table.sort (a, f);
	for name,value in pairs(a) do
		table.insert (b, t[value]);
	end
	return b;
end

function pairsByKeys2 (t, f)
	local a = {}
	local b = {}
	for n in pairs (t) do
		table.insert (a, n);
	end
	table.sort (a, f);
	for name,value in pairs(a) do
		table.insert (b, value);
	end
	return b;
end

TicketChannel = "gm_sync_channel";
TicketTab = "General";

local TicketCount = 0;
local TicketPP = 15;
local PageCount = 1;
local CurrentPage = 1;
local TicketList = {};
local TicketsInList = {};
local ReadTickets = {};
CurName = nil;
CurTicketNum = 0;
local SortedBy = "num";
local PrevSortedBy = "num";
local SortedDir = "asc";
local IsReading = {};
local TicketsDone= 0;
CurWhisperMessage = '';


local MapIds = {};
	MapIds[1000]="Eastern Kingdoms";
	MapIds[1]="Kalimdor";
	MapIds[13]="Testing";
	MapIds[25]="Scott Test";
	MapIds[29]="CashTest";
	MapIds[30]="Alterac Valley";
	MapIds[33]="Shadowfang Keep";
	MapIds[34]="The Stockades";
	MapIds[35]="StormwindPrison";
	MapIds[36]="Deadmines";
	MapIds[37]="Azshara Crater";
	MapIds[42]="Collin's Test";
	MapIds[43]="Wailing Caverns";
	MapIds[44]=" Monastery";
	MapIds[47]="Razorfen Kraul";
	MapIds[48]="Blackfathom Deeps";
	MapIds[70]="Uldaman";
	MapIds[90]="Gnomeregan";
	MapIds[109]="Sunken Temple";
	MapIds[129]="Razorfen Downs";
	MapIds[169]="Emerald Dream";
	MapIds[189]="Scarlet Monastery";
	MapIds[209]="Zul'Farrak";
	MapIds[229]="Blackrock Spire";
	MapIds[230]="Blackrock Depths";
	MapIds[249]="Onyxia's Lair";
	MapIds[269]="The Black Morass";
	MapIds[289]="Scholomance";
	MapIds[309]="Zul'Gurub";
	MapIds[329]="Stratholme";
	MapIds[349]="Maraudon";
	MapIds[369]="Deeprun Tram";
	MapIds[389]="Ragefire Chasm";
	MapIds[409]="Molten Core";
	MapIds[429]="Dire Maul";
	MapIds[449]="Alliance Military Barracks";
	MapIds[450]="Horde Military Barracks";
	MapIds[451]="Development Land";
	MapIds[469]="Blackwing Lair";
	MapIds[489]="Warsong Gulch";
	MapIds[509]="Ruins of Ahn'Qiraj";
	MapIds[529]="Arathi Basin ";
	MapIds[530]="Outlands";
	MapIds[531]="Ahn'Qiraj Temple";
	MapIds[532]="Karazhan";
	MapIds[533]="Naxxramas";
	MapIds[534]="The Battle for Mount Hyjal";
	MapIds[540]="Hellfire Citadel: The Shattered Halls";
	MapIds[542]="Hellfire Citadel: The Blood Furnace";
	MapIds[543]="Hellfire Citadel: Ramparts";
	MapIds[544]="Magtheridon's Lair";
	MapIds[545]="Coilfang: The Steamvault";
	MapIds[546]="Coilfang: The Underbog";
	MapIds[547]="Coilfang: The Slave Pens";
	MapIds[548]="Coilfang: Serpentshrine Cavern";
	MapIds[550]="Tempest Keep";
	MapIds[552]="Tempest Keep: The Arcatraz";
	MapIds[553]="Tempest Keep: The Botanica";
	MapIds[554]="Tempest Keep: The Mechanar";
	MapIds[555]="Auchindoun: Shadow Labyrinth";
	MapIds[556]="Auchindoun: Sethekk Halls";
	MapIds[557]="Auchindoun: Mana-Tombs";
	MapIds[558]="Auchindoun: Auchenai Crypts";
	MapIds[559]="Nagrand Arena";
	MapIds[560]="Old Hillsbrad Foothills";
	MapIds[562]="Blade's Edge Arena";
	MapIds[564]="Black Temple";
	MapIds[565]="Gruul's Lair";
	MapIds[566]="Eye of the Storm";
	MapIds[568]="Zul'Aman";
	MapIds[571]="Northrend";
	MapIds[572]="Ruins of Lordaeron";
	MapIds[573]="ExteriorTest";
	MapIds[574]="Utgarde Keep";
	MapIds[575]="Utgarde Pinnacle";
	MapIds[576]="The Nexus";
	MapIds[578]="The Oculus";
	MapIds[582]="Transport: Ruttheran to Auberdine";
	MapIds[584]="Transport: Menethil to Theramore";
	MapIds[586]="Transport: Exodar to Auberdine";
	MapIds[587]="Transport: Feathermoon Ferry";
	MapIds[588]="Transport: Menethil to Auberdine";
	MapIds[589]="Transport: Orgrimmar to GromGol";
	MapIds[590]="Transport: GromGol to Undercity";
	MapIds[591]="Transport: Undercity to Orgrimmar";
	MapIds[593]="Transport: Booty Bay to Ratchet";
	MapIds[580]="The Sunwell";
	MapIds[585]="Magisters' Terrace";
	MapIds[598]="Sunwell Fix (Unused)";
	MapIds[592]="Transport: Borean Tundra Test";
	MapIds[594]="Transport: Howling Fjord Sister Mercy (Quest)";
	MapIds[595]="The Culling of Stratholme";
	MapIds[596]="Transport: Naglfar";
	MapIds[597]="Craig Test";
	MapIds[599]="Halls of Stone";
	MapIds[600]="Drak'Tharon Keep";
	MapIds[601]="Azjol-Nerub";
	MapIds[602]="Halls of Lightning";
	MapIds[603]="Ulduar";
	MapIds[604]="Gundrak";
	MapIds[605]="Development Land (non-weighted textures)";
	MapIds[606]="QA and DVD";
	MapIds[607]="Strand of the Ancients";
	MapIds[608]="Violet Hold";
	MapIds[609]="Ebon Hold";
	MapIds[610]="Transport: Tirisfal to Vengeance Landing";
	MapIds[612]="Transport: Menethil to Valgarde";
	MapIds[613]="Transport: Orgrimmar to Warsong Hold";
	MapIds[614]="Transport: Stormwind to Valiance Keep";
	MapIds[615]="The Obsidian Sanctum";
	MapIds[616]="The Eye of Eternity";
	MapIds[617]="Dalaran Sewers";
	MapIds[618]="The Ring of Valor";
	MapIds[619]="Ahn'kahet: The Old Kingdom";
	MapIds[620]="Transport: Moa'ki to Unu'pe";
	MapIds[621]="Transport: Moa'ki to Kamagua";
	MapIds[622]="Transport: Orgrim's Hammer";
	MapIds[623]="Transport: The Skybreaker";
	MapIds[624]="Wintergrasp Raid";


function TicketWhisper()
	ChatFrame_SendTell(CurName);
end

function AddTicket(name, map)
	map = tonumber(map);
	
	if (map < 1) then
		map = 1000;
	end
	
	if(MapIds[map]) then
		location = MapIds[map];
	else
		location = '';
	end
	
	if (TicketsInList[name] == nil) then
		TicketCount = TicketCount + 1;
		TicketsInList[name] = 1;
		local insertData = {["num"] = TicketCount, ["number"] = TicketCount, ["name"] = name, ["location"] = location};
		
		if(insertData["num"] < 10) then
			insertData["num"] = "000" .. insertData["num"];
		elseif(insertData["num"] < 100) then
			insertData["num"] = "00" .. insertData["num"];
		elseif(insertData["num"] < 1000) then
			insertData["num"] = "0" .. insertData["num"];
		end
		
		local ticketKey = insertData[SortedBy] .. insertData[PrevSortedBy];
		TicketList[ticketKey] = insertData;
	end
end

function SortTicketList(key)
	if(key ~= SortedBy) then
		PrevSortedBy = SortedBy;
		SortedDir = "asc";
		SortedBy = key;
	else
		if(SortedDir == "asc") then
			SortedDir = "desc";
		else
			SortedDir = "asc";
		end
	end
	Refresh_Tickets();
end

function Update_Tickets()
	PageCount = math.ceil(TicketCount/TicketPP);
	if (PageCount == 0) then
		PageCount = 1;
	end
	local TempPage = CurrentPage;
	if (CurrentPage > PageCount) then
		CurrentPage = PageCount;
	elseif (CurrentPage < 1) then
		CurrentPage = 1;
	end
	
	Ticket_Tracker_Info_Text:SetText("Page ".. CurrentPage .." of ".. PageCount.." (".. TicketCount .." tickets)");
	
	if (CurrentPage == 1) then
		Ticket_Tracker_Previous:Disable();
	else
		Ticket_Tracker_Previous:Enable();
	end
	
	if (CurrentPage == PageCount) then
		Ticket_Tracker_Next:Disable();
	else
		Ticket_Tracker_Next:Enable();
	end
	
	local MinTicket = 1 + ((CurrentPage - 1) * TicketPP);
	local MaxTicket = CurrentPage * TicketPP;
	
	local NumTicket = 0;
	
	if(SortedDir == "desc") then
		TicketList = pairsByKeys(TicketList, function(a,b) return a>b end);
	else
		TicketList = pairsByKeys(TicketList);
	end
	
	for name,value in pairs(TicketList) do
		NumTicket = NumTicket + 1;
		if (NumTicket >= MinTicket and NumTicket <= MaxTicket) then
			local CurrentTicket = NumTicket - ((CurrentPage - 1) * TicketPP);
			if(value["name"] == CurName) then
				getglobal("TicketStatusButton".. CurrentTicket .."_Texture"):SetTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar");
				CurTicketNum = CurrentTicket;
			else
				getglobal("TicketStatusButton".. CurrentTicket .."_Texture"):SetTexture(0, 0, 0);
			end
			getglobal("TicketStatusButton".. CurrentTicket .."Number"):SetText(value["number"]);
			getglobal("TicketStatusButton".. CurrentTicket .."Name"):SetText(value["name"]);
			getglobal("TicketStatusButton".. CurrentTicket .."Location"):SetText(value["location"]);
			getglobal("TicketStatusButton".. CurrentTicket):Show();
			getglobal("TicketStatusButton".. CurrentTicket).charname = value["name"];
			
			if (ReadTickets[value["name"]] == 1) then
				getglobal("TicketStatusButton".. CurrentTicket .."Name"):SetTextColor(1,1,1);
			else
				getglobal("TicketStatusButton".. CurrentTicket .."Name"):SetTextColor(1,0.82,0);
			end
		end
	end
	
	if (NumTicket <= MaxTicket) then
		for NumTicket = NumTicket+1, MaxTicket, 1 do
			getglobal("TicketStatusButton".. NumTicket - ((CurrentPage - 1) * TicketPP)):Hide();
		end
	end
	if (TempPage > PageCount and TicketCount == 0) then
		CurrentPage = TempPage;
	end
end

function Next_Page()
	CurrentPage = CurrentPage + 1;
	Update_Tickets();
end

function Previous_Page()
	CurrentPage = CurrentPage - 1;
	Update_Tickets();
end

function MarkTicketAsRead(name)
	ReadTickets[name] = 1;
	Chronos.scheduleByName('ticketupdate', 0, Update_Tickets);
end

function RemoveTicketFromReadList(name)
	ReadTickets[name] = nil;
end

function IsBeingRead()
	local NumReading = 0;
	local ReadingText = '';
	for GMname,charname in pairs(IsReading) do
		if (charname == CurName and GMname ~= PlayerName:GetText()) then
			NumReading = NumReading + 1;
			if NumReading > 1 then
				ReadingText = ReadingText .." and ";
			end
			ReadingText = ReadingText .. GMname;
		end
	end
	if NumReading > 0 then
		getglobal("View_Tickets_Ticket_Reading"):SetText("NOTE: this ticket is also being read by ".. ReadingText);
		getglobal("View_Tickets_Ticket_Reading"):Show();
	else
		getglobal("View_Tickets_Ticket_Reading"):Hide();
	end
end

function StartReading(GMname, charname)
	IsReading[GMname] = charname;
	if charname == CurName then
		IsBeingRead();
	end
	Chronos.scheduleByName('StopReading', 300, StopReading, GMname);
end

function StopReading(GMname, charname)
	if charname then
		if charname == IsReading[GMname] then
			IsReading[GMname] = nil;
		end
	else
		IsReading[GMname] = nil;
	end
	if charname == CurName then
		IsBeingRead();
	end
end

local ORIG_ChatFrame_MessageEventHandler = ChatFrame_MessageEventHandler;
function ChatFrame_MessageEventHandler(...)
    ticketobjectthingy, event = ...; -- sorry, I was too lazy to think of a better name =P
	
    if event == "CHAT_MSG_CHANNEL" and arg9 == TicketChannel then
		if ticketobjectthingy.name == TicketTab then
			junk,msg = strsplit(" ",arg1);
			if junk == "GmTicket" then
				args = {strsplit(",",msg)};
				if args[1] == "0" and arg2 == PlayerName:GetText() then
					AddTicket(args[2], args[4]);
					Chronos.scheduleByName('ticketupdate', 1, Update_Tickets);
				elseif args[1] == "1" then
					RemoveTicketFromReadList(args[2]);
					Refresh_Tickets();
				elseif args[1] == "2" then
					Chronos.scheduleByName('ticketupdate', 1, Update_Tickets);
				elseif args[1] == "3" and arg2 == PlayerName:GetText() then
					len = string.len(args[2])+13;
					getglobal("View_Tickets_TitleString"):SetText(args[2] .."'s Ticket");
					getglobal("View_Tickets_Root"):SetAttribute("macrotext1", "/target ".. args[2] .." \n/g .para");
					getglobal("View_Tickets_Root"):SetAttribute("macrotext2", "/target ".. args[2] .." \n/g .unpara");
					getglobal("View_Tickets_Ticket_Text"):SetText(string.sub(arg1,len));
					MarkTicketAsRead(args[2]);
				elseif args[1] == "5" then
					Refresh_Tickets();
				elseif args[1] == "8" then
					StartReading(arg2, args[2]);
				elseif args[1] == "9" then
					StopReading(arg2, args[2]);
				end
			end
		end
    else
		ORIG_ChatFrame_MessageEventHandler(...);
    end
end

function Refresh_Tickets()
	TicketCount = 0;
	TicketList = {};
	TicketsInList = {};
	SendChatMessage(".gmTicket get","GUILD");
	Schedule_Refresh();
end

function Schedule_Refresh()
	Chronos.scheduleByName('ticketrefresh', 60, Refresh_Tickets);
end

function Toggle_Tickets()
	local frame = getglobal("Ticket_Tracker");
	if (frame) then
		if(  frame:IsVisible() ) then
			LeaveChannelByName(TicketChannel);
			Chronos.unscheduleByName('ticketrefresh');
			frame:Hide();
		else
			JoinChannelByName(TicketChannel,"",ChatFrame1:GetID());
			Refresh_Tickets();
			Ticket_Tracker_Previous:SetText('<');
			Ticket_Tracker_Next:SetText('>');
			frame:Show();
		end
	end
end

function CloseTicket(ShowTicket)
	SendChatMessage("GmTicket 9,".. CurName, "CHANNEL", nil, GetChannelName(TicketChannel));
	SendChatMessage(".gm blockwhispers ".. CurName,"GUILD");
	if(CurTicketNum ~= 0 and ShowTicket ~= true) then
		getglobal("TicketStatusButton".. CurTicketNum .."_Texture"):SetTexture(0, 0, 0);
	end
	CurName = nil;
	CurTicketNum = 0;
end

function Show_Ticket(name)
	getglobal("View_Tickets_TitleString"):SetText("Loading Ticket");
	getglobal("View_Tickets_Ticket_Text"):SetText("");
	getglobal("View_Tickets_Ticket_Reading"):Hide();
	SendChatMessage(".gmTicket getid ".. name,"GUILD");
	if CurName then
		CloseTicket(true);
	end
	SendChatMessage("GmTicket 8,".. name, "CHANNEL", nil, GetChannelName(TicketChannel));
	SendChatMessage(".gm allowwhispers ".. name,"GUILD");
	SendWho(name);
	local frame = getglobal("View_Tickets");
	if (not frame:IsVisible()) then
		frame:Show();
	elseif (CurName == name) then
		frame:Hide();
	end
	CurName = name;
	IsBeingRead();
end

function Ticket_Revive()
	SendChatMessage(".reviveplr ".. CurName,"GUILD");
end

function tenaciousGaming()
	ShowGMMessage('Tenacious Gaming - A Step Above The Rest - http://www.tenaciousgaming.com');
end

function Ticket_Summon()
	SendChatMessage(".summon ".. CurName,"GUILD");
end

function Ticket_Appear()
	SendChatMessage(".appear ".. CurName,"GUILD");
end

function Ticket_Delete()
	SendChatMessage(".gmticket delid ".. CurName,"GUILD");
	TicketsDone = TicketsDone + 1;
	getglobal("Ticket_Tracker_Counter"):SetText(TicketsDone .." tickets done");
	CloseTicket();
	local frame = getglobal("View_Tickets");
	frame:Hide();
end

tenaciousGaming();

function SendWhisperMacro()
	local msg = string.gsub(WhisperMacros[this.value], "NAME", CurName);
	if string.find(msg, "SUBJECT") then
		CurWhisperMessage = msg;
		WhisperSubjectPopup:Show();
		WhisperSubjectPopup_Subject:SetFocus();
	else
		args = {strsplit("\n",msg)};
		for index,text in pairs(args) do
			SendChatMessage(text, "WHISPER", nil, CurName);
		end
	end
end

function SendWhisperWithSubject()
	WhisperSubjectPopup:Hide();
	local subject = WhisperSubjectPopup_Subject:GetText();
	WhisperSubjectPopup_Subject:SetText('');
	
	local msg = string.gsub(CurWhisperMessage, "SUBJECT", subject);
	args = {strsplit("\n",msg)};
	for index,text in pairs(args) do
		SendChatMessage(text, "WHISPER", nil, CurName);
	end
	
	CurWhisperMessage = '';
end

function WhispersDropdown_OnLoad()
	if WhisperMacros then
		local WhisperMacrosTemp = pairsByKeys2(WhisperMacros);
		for index,name in pairs(WhisperMacrosTemp) do
			info = {};
			info.text = name;
			info.value = name;
			info.func = SendWhisperMacro;
			info.owner = this:GetParent();
			UIDropDownMenu_AddButton(info);
		end
	end
end

SLASH_TICKETS1 = "/tickets";
SlashCmdList["TICKETS"] = Toggle_Tickets;

Chronos.scheduleRepeating('tenaciousgaming', 1800, tenaciousGaming);
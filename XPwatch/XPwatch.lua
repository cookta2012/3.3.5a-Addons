-- Global Variables
XPwatchVersion = "1.0";
REST_COLOR = "|cff20ff20";
PlayerXPBar_Player = {};
PlayerXPBar_Config = {};
PlayerXPBar_Config.ButtonLock = 1;
XPWatchLocked = 0;
XPWatchEnableColor = 0;
XPWatchGrowUpward = 0;
PlayersBars = 1;
XPPartySender1 = 0;
XPPartySender2 = 0;
XPPartySender3 = 0;
XPPartySender4 = 0;
XPPartySender5 = 0;
XPPartySender1XP = 0;
XPPartySender2XP = 0;
XPPartySender3XP = 0;
XPPartySender4XP = 0;
XPPartySender5XP = 0;
RestedID = 1;
XPWatchRoundedBorder = 0;
XPWatchMainWidth = 200;
XPWatchPartyWidth = 150;
XPWatchHideB = 1;

local default_config = {
		["STYLEXP"] = 1,
		["TYPEXP"] = 0,
		["AUTOREMAIN"] = 1,
		["TEXTXP"] = 1,
		["XPBAR"] = 1,
		};


function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function XPStatusBar_OnLoad()
	this:RegisterEvent("PLAYER_XP_UPDATE");
	this:RegisterEvent("UPDATE_EXHAUSTION");
	this:RegisterEvent("PLAYER_LEVEL_UP");
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	this:SetFrameLevel(0);

	XPStatusBar_Config = {};
end

function PartyXPBar_OnLoad()
	this:RegisterEvent("CHAT_MSG_ADDON")
	this:SetFrameLevel(0);
	
	XPPartyBar_Config = {};
end

function PlayerXPBarCalc()
	local currXP = UnitXP("player");
	local needXP = UnitXPMax("player");
	XPStatusBar:SetMinMaxValues(min(0, currXP), needXP);
	XPStatusBar:SetValue(currXP);

	local exhaustionStateID = GetRestState();
	
	if(exhaustionStateID ~= nil) then
		if (XPWatchMaxLvlCheck == 1) then
			XPStatusBar:SetStatusBarColor(0.0, 0.39, 0.88, 0); else
		if (exhaustionStateID == 1) then
			XPStatusBar:SetStatusBarColor(0.0, 0.39, 0.88, 1.0);			
		elseif (exhaustionStateID == 2) then
			XPStatusBar:SetStatusBarColor(0.58, 0.0, 0.55, 1.0);			
			end
		end
	end

end

function partyXPBarCalc1()
	if XPPartySender1XP ~= "message recived" 
	and XPPartySender1XP ~= 0 then
	local currXP = XPPartySender1XP;
	local needXP = 20;
	XPpartybar1:SetMinMaxValues(min(0, currXP), needXP);
	XPpartybar1:SetValue(currXP);

	Party1XPAmount:SetText(XPPartySender1 .. "    " .. XPPartySender1XP .. "/20")
	
	if (XPOptionsCheckButton2:GetChecked() == 1) then
	if (XPPartySender1XP/20*100) < 10 then
	Party1XPAmount:SetTextColor(1,0,0,1) else
	if (XPPartySender1XP/20*100) < 20 then
	Party1XPAmount:SetTextColor(0.9,0.1,0,1) else
	if (XPPartySender1XP/20*100) < 30 then
	Party1XPAmount:SetTextColor(0.8,0.2,0,1) else
	if (XPPartySender1XP/20*100) < 40 then
	Party1XPAmount:SetTextColor(0.7,0.3,0,1) else
	if (XPPartySender1XP/20*100) < 50 then
	Party1XPAmount:SetTextColor(0.6,0.4,0,1) else
	if (XPPartySender1XP/20*100) < 60 then
	Party1XPAmount:SetTextColor(0.5,0.5,0,1) else
	if (XPPartySender1XP/20*100) < 70 then
	Party1XPAmount:SetTextColor(0.4,0.6,0,1) else
	if (XPPartySender1XP/20*100) < 80 then
	Party1XPAmount:SetTextColor(0.3,0.7,0,1) else
	if (XPPartySender1XP/20*100) < 90 then
	Party1XPAmount:SetTextColor(0.2,0.8,0,1) else
	if (XPPartySender1XP/20*100) < 100 then
	Party1XPAmount:SetTextColor(0.1,0.9,0,1) else
	if (XPPartySender1XP/20*100) == 100 then
	Party1XPAmount:SetTextColor(0,1,0,1);
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
		if XPparty1rest == 1 then
		XPpartybar1:SetStatusBarColor(0.0, 0.39, 0.88, 1.0) else
		XPpartybar1:SetStatusBarColor(0.58, 0.0, 0.55, 1.0);
		end
end


function partyXPBarCalc2()
	if XPPartySender1XP ~= "message recived" then
	local currXP = XPPartySender2XP;
	local needXP = 20;
	XPpartybar2:SetMinMaxValues(min(0, currXP), needXP);
	XPpartybar2:SetValue(currXP);

	Party2XPAmount:SetText(XPPartySender2 .. "    " .. XPPartySender2XP .. "/20")
	
	if (XPOptionsCheckButton2:GetChecked() == 1) then
	if (XPPartySender2XP/20*100) < 10 then
	Party2XPAmount:SetTextColor(1,0,0,1) else
	if (XPPartySender2XP/20*100) < 20 then
	Party2XPAmount:SetTextColor(0.9,0.1,0,1) else
	if (XPPartySender2XP/20*100) < 30 then
	Party2XPAmount:SetTextColor(0.8,0.2,0,1) else
	if (XPPartySender2XP/20*100) < 40 then
	Party2XPAmount:SetTextColor(0.7,0.3,0,1) else
	if (XPPartySender2XP/20*100) < 50 then
	Party2XPAmount:SetTextColor(0.6,0.4,0,1) else
	if (XPPartySender2XP/20*100) < 60 then
	Party2XPAmount:SetTextColor(0.5,0.5,0,1) else
	if (XPPartySender2XP/20*100) < 70 then
	Party2XPAmount:SetTextColor(0.4,0.6,0,1) else
	if (XPPartySender2XP/20*100) < 80 then
	Party2XPAmount:SetTextColor(0.3,0.7,0,1) else
	if (XPPartySender2XP/20*100) < 90 then
	Party2XPAmount:SetTextColor(0.2,0.8,0,1) else
	if (XPPartySender2XP/20*100) < 100 then
	Party2XPAmount:SetTextColor(0.1,0.9,0,1) else
	if (XPPartySender2XP/20*100) == 100 then
	Party2XPAmount:SetTextColor(0,1,0,1);
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
		if XPparty2rest == 1 then
		XPpartybar2:SetStatusBarColor(0.0, 0.39, 0.88, 1.0) else
		XPpartybar2:SetStatusBarColor(0.58, 0.0, 0.55, 1.0);
		end
end

function partyXPBarCalc3()
	if XPPartySender1XP ~= "message recived" then
	local currXP = XPPartySender3XP;
	local needXP = 20;
	XPpartybar3:SetMinMaxValues(min(0, currXP), needXP);
	XPpartybar3:SetValue(currXP);

	Party3XPAmount:SetText(XPPartySender3 .. "    " .. XPPartySender3XP .. "/20")		
	
	if (XPOptionsCheckButton2:GetChecked() == 1) then
	if (XPPartySender3XP/20*100) < 10 then
	Party3XPAmount:SetTextColor(1,0,0,1) else
	if (XPPartySender3XP/20*100) < 20 then
	Party3XPAmount:SetTextColor(0.9,0.1,0,1) else
	if (XPPartySender3XP/20*100) < 30 then
	Party3XPAmount:SetTextColor(0.8,0.2,0,1) else
	if (XPPartySender3XP/20*100) < 40 then
	Party3XPAmount:SetTextColor(0.7,0.3,0,1) else
	if (XPPartySender3XP/20*100) < 50 then
	Party3XPAmount:SetTextColor(0.6,0.4,0,1) else
	if (XPPartySender3XP/20*100) < 60 then
	Party3XPAmount:SetTextColor(0.5,0.5,0,1) else
	if (XPPartySender3XP/20*100) < 70 then
	Party3XPAmount:SetTextColor(0.4,0.6,0,1) else
	if (XPPartySender3XP/20*100) < 80 then
	Party3XPAmount:SetTextColor(0.3,0.7,0,1) else
	if (XPPartySender3XP/20*100) < 90 then
	Party3XPAmount:SetTextColor(0.2,0.8,0,1) else
	if (XPPartySender3XP/20*100) < 100 then
	Party3XPAmount:SetTextColor(0.1,0.9,0,1) else
	if (XPPartySender3XP/20*100) == 100 then
	Party3XPAmount:SetTextColor(0,1,0,1);
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
		if XPparty3rest == 1 then
		XPpartybar3:SetStatusBarColor(0.0, 0.39, 0.88, 1.0) else
		XPpartybar3:SetStatusBarColor(0.58, 0.0, 0.55, 1.0);
		end
end

function partyXPBarCalc4()
	if XPPartySender1XP ~= "message recived" then
	local currXP = XPPartySender4XP;
	local needXP = 20;
	XPpartybar4:SetMinMaxValues(min(0, currXP), needXP);
	XPpartybar4:SetValue(currXP);

	Party4XPAmount:SetText(XPPartySender4 .. "    " .. XPPartySender4XP .. "/20")			
	
	if (XPOptionsCheckButton2:GetChecked() == 1) then
	if (XPPartySender4XP/20*100) < 10 then
	Party4XPAmount:SetTextColor(1,0,0,1) else
	if (XPPartySender4XP/20*100) < 20 then
	Party4XPAmount:SetTextColor(0.9,0.1,0,1) else
	if (XPPartySender4XP/20*100) < 30 then
	Party4XPAmount:SetTextColor(0.8,0.2,0,1) else
	if (XPPartySender4XP/20*100) < 40 then
	Party4XPAmount:SetTextColor(0.7,0.3,0,1) else
	if (XPPartySender4XP/20*100) < 50 then
	Party4XPAmount:SetTextColor(0.6,0.4,0,1) else
	if (XPPartySender4XP/20*100) < 60 then
	Party4XPAmount:SetTextColor(0.5,0.5,0,1) else
	if (XPPartySender4XP/20*100) < 70 then
	Party4XPAmount:SetTextColor(0.4,0.6,0,1) else
	if (XPPartySender4XP/20*100) < 80 then
	Party4XPAmount:SetTextColor(0.3,0.7,0,1) else
	if (XPPartySender4XP/20*100) < 90 then
	Party4XPAmount:SetTextColor(0.2,0.8,0,1) else
	if (XPPartySender4XP/20*100) < 100 then
	Party4XPAmount:SetTextColor(0.1,0.9,0,1) else
	if (XPPartySender4XP/20*100) == 100 then
	Party4XPAmount:SetTextColor(0,1,0,1);
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
		if XPparty4rest == 1 then
		XPpartybar4:SetStatusBarColor(0.0, 0.39, 0.88, 1.0) else
		XPpartybar4:SetStatusBarColor(0.58, 0.0, 0.55, 1.0);
		end
end

function partyXPBarCalc5()
	if XPPartySender1XP ~= "message recived" then
	local currXP = XPPartySender5XP;
	local needXP = 20;
	XPpartybar5:SetMinMaxValues(min(0, currXP), needXP);
	XPpartybar5:SetValue(currXP);

	Party5XPAmount:SetText(XPPartySender5 .. "    " .. XPPartySender5XP .. "/20")		
	
	if (XPOptionsCheckButton2:GetChecked() == 1) then
	if (XPPartySender5XP/20*100) < 10 then
	Party5XPAmount:SetTextColor(1,0,0,1) else
	if (XPPartySender5XP/20*100) < 20 then
	Party5XPAmount:SetTextColor(0.9,0.1,0,1) else
	if (XPPartySender5XP/20*100) < 30 then
	Party5XPAmount:SetTextColor(0.8,0.2,0,1) else
	if (XPPartySender5XP/20*100) < 40 then
	Party5XPAmount:SetTextColor(0.7,0.3,0,1) else
	if (XPPartySender5XP/20*100) < 50 then
	Party5XPAmount:SetTextColor(0.6,0.4,0,1) else
	if (XPPartySender5XP/20*100) < 60 then
	Party5XPAmount:SetTextColor(0.5,0.5,0,1) else
	if (XPPartySender5XP/20*100) < 70 then
	Party5XPAmount:SetTextColor(0.4,0.6,0,1) else
	if (XPPartySender5XP/20*100) < 80 then
	Party5XPAmount:SetTextColor(0.3,0.7,0,1) else
	if (XPPartySender5XP/20*100) < 90 then
	Party5XPAmount:SetTextColor(0.2,0.8,0,1) else
	if (XPPartySender5XP/20*100) < 100 then
	Party5XPAmount:SetTextColor(0.1,0.9,0,1) else
	if (XPPartySender5XP/20*100) == 100 then
	Party5XPAmount:SetTextColor(0,1,0,1);
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
		if XPparty5rest == 1 then
		XPpartybar5:SetStatusBarColor(0.0, 0.39, 0.88, 1.0) else
		XPpartybar5:SetStatusBarColor(0.58, 0.0, 0.55, 1.0);
		end
end

function PlayerXPBarShow()

    if (PlayerXPBar_Player ~= nil) and (PlayerXPBar_Player["XPBAR"] == 0) then
	XPStatusBar:Hide();
	return;
    else
	XPStatusBar:Show();
    end

    if (UnitLevel("player") > 79) then
        XPStatusBar:SetMinMaxValues(0,1);
	    XPStatusBar:SetValue(1);
	    XPStatusBar:SetStatusBarColor(0, 1, 0.0);
		XPAmount:SetText(PXPBAR_DONE);
	return;
    end

	local currXP = UnitXP("player");
	local needXP = UnitXPMax("player");
	local restXP = GetXPExhaustion();
	local str = format(TEXT(" %.1f %% "), ((currXP / needXP) * 100));
	local str_remain =  format(TEXT(" %.1f %% "), (100 - ((currXP / needXP) * 100)));
	local text_xp = "XP:";
end

function XPDropDownMenuButton_OnClick() 
if (XPWatchOptions:IsShown()) then
	XPWatchOptions:Hide(); 
	else
	XPWatchOptions:Show();
	end
end

function MoveXPFrame()
if (XPOptionsCheckButton:GetChecked() == nil) then
	XPDisplayFrame:StartMoving();
	end
end

function XPWatchsetlockedvar()
if (XPOptionsCheckButton:GetChecked() == 1) then
	XPWatchLocked = 1; else
	XPWatchLocked = 0;
	end
end

function XPWatchsetmaxlvlvar()
if (XPOptionsCheckButton3:GetChecked() == 1) then
	XPAmount:SetText(" ");
	
	XPpartyframe1:Hide();
	XPpartyframe2:Hide();
	XPpartyframe3:Hide();
	XPpartyframe4:Hide();
	XPpartyframe5:Hide();
	
	XPDisplayFrame:Hide();
	XPStatusBar:Hide();
	XPBGFRAME:Hide();
	XPWatchMaxLvl = 1; else
	XPDisplayFrame:Show();
	XPStatusBar:Show();
	XPBGFRAME:Show();
	XPAmount:SetText(UnitXP("player") .. "/" .. UnitXPMax("player") .. "     " .. round(UnitXP("player")/(UnitXPMax("player")/20), 1) .. "/20 bars");
	XPBarColor()
	XPWatchMaxLvl = 0;
	if XPPartySender1 ~= 0 then
		XPpartyframe1:Show();
		end
	if XPPartySender2 ~= 0 then
	   		XPpartyframe2:Show();
	   	end
	if XPPartySender3 ~= 0 then
	   		XPpartyframe3:Show();
	   	end
	if XPPartySender4 ~= 0 then
	   		XPpartyframe4:Show();
	   	end
	if XPPartySender5 ~= 0 then
	   		XPpartyframe5:Show();
		end
	end
end

function XPWatchMaxLvlCheck()
PlayerXPBarCalc()
if (XPWatchMaxLvl == 1) then
	XPpartyframe1:Hide();
	XPpartyframe2:Hide();
	XPpartyframe3:Hide();
	XPpartyframe4:Hide();
	XPpartyframe5:Hide();
	XPAmount:SetText(" ");
	XPDisplayFrame:Hide();
	XPStatusBar:Hide();
	XPBGFRAME:Hide();
	XPOptionsCheckButton3:SetChecked(true);
	end
end

function XPWatchsetcolorvar()
if (XPOptionsCheckButton2:GetChecked() == 1) then
	XPWatchEnableColor = 1;
	partyXPBarCalc1()
	partyXPBarCalc2()
	partyXPBarCalc3()
	partyXPBarCalc4()
	partyXPBarCalc5()
	XPBarColor() else
	XPWatchEnableColor = 0;
	XPAmount:SetTextColor(1,0.8,1,1);
	Party1XPAmount:SetTextColor(1,0.8,1,1);
	Party2XPAmount:SetTextColor(1,0.8,1,1);
	Party3XPAmount:SetTextColor(1,0.8,1,1);
	Party4XPAmount:SetTextColor(1,0.8,1,1);
	Party5XPAmount:SetTextColor(1,0.8,1,1);
	end
end

function XPWatchIsLockedCheck()
if (XPWatchLocked == 1) then
	XPOptionsCheckButton:SetChecked(true);
	end
end

function XPWatchBorderCheck()
if (XPWatchRoundedBorder == 1) then
	XPOptionsCheckButton5:SetChecked(true);
	end
	XPWatchsetbordervar()
end

function XPWatchHideBCheck()
if (XPWatchHideB == 1) then
	XPOptionsCheckButton6:SetChecked(true);
	end
	XPWatchsetHideBvar()
	MainMenuExpBar:Hide()
end

function XPWatchsetHideBvar()
if (XPOptionsCheckButton6:GetChecked() == 1) then
	XPWatchHideB = 1;
		MainMenuExpBar:Hide()
	else
	XPWatchHideB = 0;
		MainMenuExpBar:Show()
	end
end

function XPWatchsetbordervar()
if (XPOptionsCheckButton5:GetChecked() == 1) then
	XPWatchRoundedBorder = 1;
	XPDisplayFrame:SetBackdrop({edgeFile = "Interface\\Addons\\XPwatch\\TextBorder", tile = true, tileSize = 32, edgeSize = 12});
	XPpartyframe1:SetBackdrop({edgeFile = "Interface\\Addons\\XPwatch\\TextBorder", tile = true, tileSize = 32, edgeSize = 12});
	XPpartyframe2:SetBackdrop({edgeFile = "Interface\\Addons\\XPwatch\\TextBorder", tile = true, tileSize = 32, edgeSize = 12});
	XPpartyframe3:SetBackdrop({edgeFile = "Interface\\Addons\\XPwatch\\TextBorder", tile = true, tileSize = 32, edgeSize = 12});
	XPpartyframe4:SetBackdrop({edgeFile = "Interface\\Addons\\XPwatch\\TextBorder", tile = true, tileSize = 32, edgeSize = 12});
	XPpartyframe5:SetBackdrop({edgeFile = "Interface\\Addons\\XPwatch\\TextBorder", tile = true, tileSize = 32, edgeSize = 12});
	XPStatusBar:SetHeight(18)
	else
	XPWatchRoundedBorder = 0;
	XPDisplayFrame:SetBackdrop({edgeFile = "Interface\\Addons\\XPwatch\\DialogEdge", tile = true, tileSize = 32, edgeSize = 12});
	XPpartyframe1:SetBackdrop({edgeFile = "Interface\\Addons\\XPwatch\\DialogEdge", tile = true, tileSize = 32, edgeSize = 12});
	XPpartyframe2:SetBackdrop({edgeFile = "Interface\\Addons\\XPwatch\\DialogEdge", tile = true, tileSize = 32, edgeSize = 12});
	XPpartyframe3:SetBackdrop({edgeFile = "Interface\\Addons\\XPwatch\\DialogEdge", tile = true, tileSize = 32, edgeSize = 12});
	XPpartyframe4:SetBackdrop({edgeFile = "Interface\\Addons\\XPwatch\\DialogEdge", tile = true, tileSize = 32, edgeSize = 12});
	XPpartyframe5:SetBackdrop({edgeFile = "Interface\\Addons\\XPwatch\\DialogEdge", tile = true, tileSize = 32, edgeSize = 12});
	XPStatusBar:SetHeight(15)
	end
end

function XPWatchUpwardCheck()
if (XPWatchGrowUpward == 1) then
	XPOptionsCheckButton4:SetChecked(true);
	end
	XPWatchsetupwardvar();
end

function XPWatchsetupwardvar()
if (XPOptionsCheckButton4:GetChecked() == 1) then
	XPWatchGrowUpward = 1;
	XPpartyframe1:ClearAllPoints();
	XPpartyframe2:ClearAllPoints();
	XPpartyframe3:ClearAllPoints();
	XPpartyframe4:ClearAllPoints();
	XPpartyframe5:ClearAllPoints();
	XPpartyframe1:SetPoint("BOTTOMLEFT", "XPDisplayFrame", "TOPLEFT")
	XPpartyframe2:SetPoint("BOTTOMLEFT", "XPpartyframe1", "TOPLEFT")
	XPpartyframe3:SetPoint("BOTTOMLEFT", "XPpartyframe2", "TOPLEFT")
	XPpartyframe4:SetPoint("BOTTOMLEFT", "XPpartyframe3", "TOPLEFT")
	XPpartyframe5:SetPoint("BOTTOMLEFT", "XPpartyframe4", "TOPLEFT")
	else
	XPWatchGrowUpward = 0;
	XPpartyframe1:ClearAllPoints();
	XPpartyframe2:ClearAllPoints();
	XPpartyframe3:ClearAllPoints();
	XPpartyframe4:ClearAllPoints();
	XPpartyframe5:ClearAllPoints();
	XPpartyframe1:SetPoint("TOPLEFT", "XPDisplayFrame", "BOTTOMLEFT")
	XPpartyframe2:SetPoint("TOPLEFT", "XPpartyframe1", "BOTTOMLEFT")
	XPpartyframe3:SetPoint("TOPLEFT", "XPpartyframe2", "BOTTOMLEFT")
	XPpartyframe4:SetPoint("TOPLEFT", "XPpartyframe3", "BOTTOMLEFT")
	XPpartyframe5:SetPoint("TOPLEFT", "XPpartyframe4", "BOTTOMLEFT")
	end
end

function XPWatchColorCheck()
if (XPWatchEnableColor == 1) then
	XPOptionsCheckButton2:SetChecked(true);
	end
end

function XPBarColor()
if (XPOptionsCheckButton3:GetChecked() == 1) then
	XPAmount:SetText(" ") else
if (XPOptionsCheckButton2:GetChecked() == 1) then
	if (UnitXP("player")/UnitXPMax("player")*100) < 10 then
	XPAmount:SetTextColor(1,0,0,1)
	elseif (UnitXP("player")/UnitXPMax("player")*100) < 20 then
	XPAmount:SetTextColor(0.9,0.1,0,1)
	elseif (UnitXP("player")/UnitXPMax("player")*100) < 30 then
	XPAmount:SetTextColor(0.8,0.2,0,1)
	elseif (UnitXP("player")/UnitXPMax("player")*100) < 40 then
	XPAmount:SetTextColor(0.7,0.3,0,1)
	elseif (UnitXP("player")/UnitXPMax("player")*100) < 50 then
	XPAmount:SetTextColor(0.6,0.4,0,1)
	elseif (UnitXP("player")/UnitXPMax("player")*100) < 60 then
	XPAmount:SetTextColor(0.5,0.5,0,1)
	elseif (UnitXP("player")/UnitXPMax("player")*100) < 70 then
	XPAmount:SetTextColor(0.4,0.6,0,1)
	elseif (UnitXP("player")/UnitXPMax("player")*100) < 80 then
	XPAmount:SetTextColor(0.3,0.7,0,1)
	elseif (UnitXP("player")/UnitXPMax("player")*100) < 90 then
	XPAmount:SetTextColor(0.2,0.8,0,1)
	elseif (UnitXP("player")/UnitXPMax("player")*100) < 100 then
	XPAmount:SetTextColor(0.1,0.9,0,1)
	elseif (UnitXP("player")/UnitXPMax("player")*100) == 100 then
	XPAmount:SetTextColor(0,1,0,1);
	end
	end
end
end



function xpwatchcomm()
	PlayersBars = round(UnitXP("player")/(UnitXPMax("player")/20), 1);
	
		local numberofmembers = GetNumPartyMembers();
	if numberofmembers == 0 then
		XPpartyframe1:Hide();
		XPpartyframe2:Hide();
		XPpartyframe3:Hide();
		XPpartyframe4:Hide();
		XPpartyframe5:Hide();
		XPPartySender1 = 0;
		XPPartySender2 = 0;
		XPPartySender3 = 0;
		XPPartySender4 = 0;
		XPPartySender5 = 0;
	elseif numberofmembers == 1 then
		XPpartyframe2:Hide();
		XPpartyframe3:Hide();
		XPpartyframe4:Hide();
		XPpartyframe5:Hide();
		XPPartySender2 = 0;
		XPPartySender3 = 0;
		XPPartySender4 = 0;
		XPPartySender5 = 0;
	elseif numberofmembers == 2 then
		XPpartyframe3:Hide();
		XPpartyframe4:Hide();
		XPpartyframe5:Hide();
		XPPartySender3 = 0;
		XPPartySender4 = 0;
		XPPartySender5 = 0;
	elseif numberofmembers == 3 then
		XPpartyframe4:Hide();
		XPpartyframe5:Hide();
		XPPartySender4 = 0;
		XPPartySender5 = 0;
	elseif numberofmembers == 4 then
		XPpartyframe5:Hide();
		XPPartySender5 = 0;
	end
	
	SendAddonMessage("XPWATCH", PlayersBars, "PARTY");
end

if not ReceiveSoundFrame then
   ReceiveSoundFrame = CreateFrame("Frame")
end

local function OnEvent(self, event, prefix, message, channel, sender)
	if prefix == "XPWATCH" then
	  if message == "rested" then
	  	if XPPartySender1 == sender then
		XPparty1rest = 1;
	    elseif XPPartySender2 == sender then
	    XPparty2rest = 1;
	    elseif XPPartySender3 == sender then
	    XPparty3rest = 1;
	    elseif XPPartySender4 == sender then
	    XPparty4rest = 1;
	    elseif XPPartySender5 == sender then
	    XPparty5rest = 1;
	   end
	   elseif message == "nonrest" then
	   	if XPPartySender1 == sender then
	    XPparty1rest = 2;
	   	elseif XPPartySender2 == sender then
	    XPparty2rest = 2;
	    elseif XPPartySender3 == sender then
	    XPparty3rest = 2;
	    elseif XPPartySender4 == sender then
	    XPparty4rest = 2;
	    elseif XPPartySender5 == sender then
	    XPparty5rest = 2;
	    end
	   elseif message == "reloaded" then
	    XPgetrested();
	    SendAddonMessage("XPWATCH", PlayersBars, "PARTY");
	   else
      if XPPartySender1 == sender then
		XPPartySender1XP = message;
	  elseif XPPartySender2 == sender then
		XPPartySender2XP = message;
	  elseif XPPartySender3 == sender then
		XPPartySender3XP = message;
	  elseif XPPartySender4 == sender then
		XPPartySender4XP = message;
	  elseif XPPartySender5 == sender then
		XPPartySender5XP = message;
      elseif XPPartySender1 ~= sender
      and XPPartySender2 ~= sender
      and XPPartySender3 ~= sender
      and XPPartySender4 ~= sender
      and XPPartySender5 ~= sender
      and sender ~= UnitName("player")
      then
		if XPPartySender1 == 0 then
		 XPPartySender1 = sender;
		 XPPartySender1XP = message;
		 PartyXP1on();
		 elseif
		  XPPartySender2 == 0 then
		  XPPartySender2 = sender;
		  XPPartySender2XP = message;
		  PartyXP2on();
		 elseif
		  XPPartySender3 == 0 then
	      XPPartySender3 = sender;
		  XPPartySender3XP = message;
	      PartyXP3on();
		 elseif
	      XPPartySender4 == 0 then
	      XPPartySender4 = sender;
	      XPPartySender4XP = message;
	      PartyXP4on();
		 elseif
	      XPPartySender5 == 0 then
		  XPPartySender5 = sender;
		  XPPartySender5XP = message;
		  PartyXP5on();
		end
	  end
	end
  end

end

local frame = ReceiveSoundFrame
frame:RegisterEvent("CHAT_MSG_ADDON")
frame:SetScript("OnEvent", OnEvent)

function PartyXP1on()
	if XPPartySender1 ~=0 and
	XPPartySender1 ~= player then
	XPpartyframe1:Show()
	Party1XPAmount:SetText(XPPartySender1XP)
	end
end

function PartyXP2on()
	if XPPartySender2 ~=0 and
	XPPartySender2 ~= player then
	XPpartyframe2:Show()
	Party2XPAmount:SetText(XPPartySender2XP)
	end
end

function PartyXP3on()
	if XPPartySender3 ~=0 and
	XPPartySender3 ~= player then
	XPpartyframe3:Show()
	Party3XPAmount:SetText(XPPartySender3XP)
	end
end

function PartyXP4on()
	if XPPartySender4 ~=0 and
	XPPartySender4 ~= player then
	XPpartyframe4:Show()
	Party4XPAmount:SetText(XPPartySender4XP)
	end
end

function PartyXP5on()
	if XPPartySender5 ~=0 and
	XPPartySender5 ~= player then
	XPpartyframe5:Show()
	Party5XPAmount:SetText(XPPartySender5XP)
	end
end

function XPgetrested()
	RestedID = GetRestState();
	
	if RestedID ~= nil then
		if RestedID == 1 then
			SendAddonMessage("XPWATCH", "rested", "PARTY");
		elseif RestedID == 2 then
			SendAddonMessage("XPWATCH", "nonrest", "PARTY");
		end
	end
end

function XPSliderLoad()
 getglobal(XPOptionsSlider:GetName() .. 'Low'):SetText('200');
 getglobal(XPOptionsSlider:GetName() .. 'High'):SetText('1050'); 
 getglobal(XPOptionsSlider:GetName() .. 'Text'):SetText('Main Bar Length');
 XPOptionsSlider:SetValue(XPWatchMainWidth)
 XPWatchMainWidth = XPOptionsSlider:GetValue();
 XPDisplayFrame:SetWidth(XPWatchMainWidth);
 XPStatusBar:SetWidth(XPWatchMainWidth-3);
 XPBGFRAME:SetWidth(XPWatchMainWidth);
end

function XPSliderMoved()
XPWatchMainWidth = XPOptionsSlider:GetValue();
 XPDisplayFrame:SetWidth(XPWatchMainWidth);
 XPStatusBar:SetWidth(XPWatchMainWidth-3);
 XPBGFRAME:SetWidth(XPWatchMainWidth);
end

function XPSliderLoad2()
 getglobal(XPOptionsSlider2:GetName() .. 'Low'):SetText('150');
 getglobal(XPOptionsSlider2:GetName() .. 'High'):SetText('1050'); 
 getglobal(XPOptionsSlider2:GetName() .. 'Text'):SetText('Party Bar Length');
 XPWatchOtherWidth = XPOptionsSlider2:GetValue();
 XPOptionsSlider2:SetValue(XPWatchOtherWidth)
 XPpartyframe1:SetWidth(XPWatchOtherWidth);
 XPpartybar1:SetWidth(XPWatchOtherWidth);
 XPpartybg1:SetWidth(XPWatchOtherWidth);
 
  XPpartyframe2:SetWidth(XPWatchOtherWidth);
 XPpartybar2:SetWidth(XPWatchOtherWidth);
 XPpartybg2:SetWidth(XPWatchOtherWidth);
 
  XPpartyframe3:SetWidth(XPWatchOtherWidth);
 XPpartybar3:SetWidth(XPWatchOtherWidth);
 XPpartybg3:SetWidth(XPWatchOtherWidth);
 
  XPpartyframe4:SetWidth(XPWatchOtherWidth);
 XPpartybar4:SetWidth(XPWatchOtherWidth);
 XPpartybg4:SetWidth(XPWatchOtherWidth);
 
  XPpartyframe5:SetWidth(XPWatchOtherWidth);
 XPpartybar5:SetWidth(XPWatchOtherWidth);
 XPpartybg5:SetWidth(XPWatchOtherWidth);
end

function XPSliderMoved2()
XPWatchOtherWidth = XPOptionsSlider2:GetValue();
 XPpartyframe1:SetWidth(XPWatchOtherWidth);
 XPpartybar1:SetWidth(XPWatchOtherWidth);
 XPpartybg1:SetWidth(XPWatchOtherWidth);
 
  XPpartyframe2:SetWidth(XPWatchOtherWidth);
 XPpartybar2:SetWidth(XPWatchOtherWidth);
 XPpartybg2:SetWidth(XPWatchOtherWidth);
 
  XPpartyframe3:SetWidth(XPWatchOtherWidth);
 XPpartybar3:SetWidth(XPWatchOtherWidth);
 XPpartybg3:SetWidth(XPWatchOtherWidth);
 
  XPpartyframe4:SetWidth(XPWatchOtherWidth);
 XPpartybar4:SetWidth(XPWatchOtherWidth);
 XPpartybg4:SetWidth(XPWatchOtherWidth);
 
  XPpartyframe5:SetWidth(XPWatchOtherWidth);
 XPpartybar5:SetWidth(XPWatchOtherWidth);
 XPpartybg5:SetWidth(XPWatchOtherWidth);
end

function xpreloadfix(addonname)
	if addonname == XPwatch then
		SendAddonMessage("XPWATCH", "reloaded", "PARTY");
	end
end

SLASH_XPWATCH1, SLASH_XPWATCH2 = '/xpw', '/xpwatch';

function SlashCmdList.XPWATCH(msg, editbox)
 XPWatchOptions:Show()
end
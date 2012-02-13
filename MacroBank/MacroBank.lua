-- UIParentLoadAddOn("Blizzard_MacroUI");
local Addon = LibStub("AceAddon-3.0"):NewAddon("MacroBank", "AceEvent-3.0", "AceConsole-3.0");
MacroBank = Addon;
local L = LibStub("AceLocale-3.0"):GetLocale("MacroBank");

local CmdOptions = {
  ["type"] = "group",
  ["handler"] = MacroBank,
  ["hidden"] = true,
  ["args"] = {
    ["Load"] = {
      ["name"] = L["LoadCategory"],
      ["desc"] = L["LoadCategoryDesc"],
      ["type"] = "group",
      ["order"] = 0,
      ["get"] = function() end,
      ["set"] = "LoadCategoryFromAce",
      ["args"] = {
        ["Global"] = {
          ["name"] = L["Global"],
          ["desc"] = L["GlobalDesc"],
          ["type"] = "input",
          ["order"] = 0,
        },
        ["Char"] = {
          ["name"] = L["Char"],
          ["desc"] = L["CharDesc"],
          ["type"] = "input",
          ["order"] = 10,
        },
      },
    },
  },
};
local MenuOptions = {
  ["type"] = "group",
  ["handler"] = MacroBank,
  ["args"] = {
    ["MacroOptions"] = {
      ["name"] = L["MacroOptions"],
      ["desc"] = L["MacroOptionsDesc"],
      ["type"] = "group",
      ["order"] = 0,
      ["set"] = "OptionsSet",
      ["get"] = "OptionsGet",
      ["args"] = {
        ["MacroDefaults"] = {
          ["name"] = L["MacroDefaults"],
          ["desc"] = L["MacroDefaultsDesc"],
          ["type"] = "group",
          ["order"] = 0,
          ["args"] = {
            ["Name"] = {
              ["name"] = L["Name"],
              ["desc"] = L["DefaultNameDesc"],
              ["type"] = "input",
              ["order"] = 0,
              ["arg"] = { "NewName" },
            },
            ["Category"] = {
              ["name"] = L["Category"],
              ["desc"] = L["DefaultCategoryDesc"],
              ["type"] = "input",
              ["order"] = 10,
              ["arg"] = { "NewCategory" },
            },
            ["Description"] = {
              ["name"] = L["Description"],
              ["desc"] = L["DefaultDescriptionDesc"],
              ["type"] = "input",
              ["order"] = 20,
              ["arg"] = { "NewDescription" },
            },
            ["UseNameForDescription"] = {
              ["name"] = L["UseNameForDescription"],
              ["desc"] = L["UseNameForDescriptionDesc"],
              ["type"] = "toggle",
              ["width"] = "double",
              ["order"] = 30,
              ["arg"] = { "UseNameForDescription" },
            },
            ["Received"] = {
              ["name"] = L["ReceivedCategory"],
              ["desc"] = L["ReceivedCategoryDesc"],
              ["type"] = "input",
              ["order"] = 40,
              ["arg"] = { "ReceivedCategory" },
            },
          },
        },
        ["ReplaceOptions"] = {
          ["name"] = L["ReplaceOptions"],
          ["desc"] = L["ReplaceOptionsDesc"],
          ["type"] = "group",
          ["order"] = 10,
          ["args"] = {
            ["Name"] = {
              ["name"] = L["Name"],
              ["desc"] = L["ReplaceNameDesc"],
              ["type"] = "toggle",
              ["order"] = 0,
              ["arg"] = { "ReplaceName" },
            },
            ["Icon"] = {
              ["name"] = L["Icon"],
              ["desc"] = L["ReplaceIconDesc"],
              ["type"] = "toggle",
              ["order"] = 10,
              ["arg"] = { "ReplaceIcon" },
            },
          },
        },
        ["AutoOpenMacroBank"] = {
          ["name"] = L["AutoOpenMacroBank"],
          ["desc"] = L["AutoOpenMacroBankDesc"],
          ["type"] = "toggle",
          ["order"] = 20,
          ["arg"] = { "AutoOpenMacroBank" },
        },
        ["RememberPosition"] = {
          ["name"] = L["RememberPosition"],
          ["desc"] = L["RememberPositionDesc"],
          ["type"] = "toggle",
          ["order"] = 30,
          ["arg"] = { "Anchor", "Remember" },
        },
        ["ResetAnchor"] = {
          ["name"] = L["ResetAnchor"],
          ["desc"] = L["ResetAnchorDesc"],
          ["type"] = "execute",
          ["order"] = 40,
          ["func"] = "ResetAnchor",
        },
      },
    },
    ["AutoLoad"] = {
      ["name"] = L["AutoLoad"],
      ["desc"] = L["AutoLoadDesc"],
      ["type"] = "group",
      ["order"] = 10,
      ["set"] = "SetAutoLoadOptions",
      ["get"] = "GetAutoLoadOptions",
      ["args"] = {
        ["OnTalentSwap"] = {
          ["name"] = L["On Talent Swap"],
          ["type"] = "group",
          ["inline"] = true,
          ["order"] = 0,
          ["set"] = "OptionsSet",
          ["get"] = "OptionsGet",
          ["args"] = {
            ["DeleteGlobalOnTalentSwap"] = {
              ["name"] = L["Delete Global Macros"],
              ["desc"] = L["Delete Macros On AutoLoad Desc"],
              ["type"] = "toggle",
              ["order"] = 0,
              ["arg"] = { "AutoLoad", "DeleteGlobalOnTalentSwap" }
            },
            ["DeleteCharOnTalentSwap"] = {
              ["name"] = L["Delete Char Macros"],
              ["desc"] = L["Delete Macros On AutoLoad Desc"],
              ["type"] = "toggle",
              ["order"] = 10,
              ["arg"] = { "AutoLoad", "DeleteCharOnTalentSwap" }
            },
          },
        },
        ["OnLogin"] = {
          ["name"] = L["On Login"],
          ["type"] = "group",
          ["inline"] = true,
          ["order"] = 10,
          ["set"] = "OptionsSet",
          ["get"] = "OptionsGet",
          ["args"] = {
            ["DeleteGlobalOnLogin"] = {
              ["name"] = L["Delete Global Macros"],
              ["desc"] = L["Delete Macros On AutoLoad Desc"],
              ["type"] = "toggle",
              ["order"] = 0,
              ["arg"] = { "AutoLoad", "DeleteGlobalOnLogin" }
            },
            ["DeleteCharOnLogin"] = {
              ["name"] = L["Delete Char Macros"],
              ["desc"] = L["Delete Macros On AutoLoad Desc"],
              ["type"] = "toggle",
              ["order"] = 10,
              ["arg"] = { "AutoLoad", "DeleteCharOnLogin" }
            },
          },
        },
        ["PrimaryTalents"] = {
          ["name"] = L["Primary Talent Spec Group"],
          ["desc"] = L["Primary Talent Spec Group Desc"],
          ["type"] = "group",
          ["order"] = 100,
          ["args"] = {
            ["Char"] = {
              ["name"] = L["CharCategory"],
              ["desc"] = L["CharCategoryDesc"],
              ["type"] = "multiselect",
              ["order"] = 0,
              ["values"] = "GetMacroGroupList",
              ["arg"] = "PrimaryTalentsChar",
            },
            ["Global"] = {
              ["name"] = L["GlobalCategory"],
              ["desc"] = L["GlobalCategoryDesc"],
              ["type"] = "multiselect",
              ["order"] = 10,
              ["values"] = "GetMacroGroupList",
              ["arg"] = "PrimaryTalentsGlobal",
            },
          },
        },
        ["SecondaryTalents"] = {
          ["name"] = L["Secondary Talent Spec Group"],
          ["desc"] = L["Secondary Talent Spec Group Desc"],
          ["type"] = "group",
          ["order"] = 110,
          ["args"] = {
            ["Char"] = {
              ["name"] = L["CharCategory"],
              ["desc"] = L["CharCategoryDesc"],
              ["type"] = "multiselect",
              ["order"] = 0,
              ["values"] = "GetMacroGroupList",
              ["arg"] = "SecondaryTalentsChar",
            },
            ["Global"] = {
              ["name"] = L["GlobalCategory"],
              ["desc"] = L["GlobalCategoryDesc"],
              ["type"] = "multiselect",
              ["order"] = 10,
              ["values"] = "GetMacroGroupList",
              ["arg"] = "SecondaryTalentsGlobal",
            },
          },
        },
        ["Login"] = {
          ["name"] = L["Login Group"],
          ["desc"] = L["Login Group Desc"],
          ["type"] = "group",
          ["order"] = 100,
          ["args"] = {
            ["Char"] = {
              ["name"] = L["CharCategory"],
              ["desc"] = L["CharCategoryDesc"],
              ["type"] = "multiselect",
              ["order"] = 0,
              ["values"] = "GetMacroGroupList",
              ["arg"] = "LoginChar",
            },
            ["Global"] = {
              ["name"] = L["GlobalCategory"],
              ["desc"] = L["GlobalCategoryDesc"],
              ["type"] = "multiselect",
              ["order"] = 10,
              ["values"] = "GetMacroGroupList",
              ["arg"] = "LoginGlobal",
            },
          },
        },
      },
    },
    ["PreMadeMacros"] = {
      ["name"] = L["Pre-Made Macros"],
      ["type"] = "group",
      ["order"] = 20,
      ["args"] = {
        ["Load"] = {
          ["name"] = L["LoadPreMade"],
          ["desc"] = L["LoadPreMadeDesc"],
          ["type"] = "execute",
          ["order"] = 0,
          ["func"] = "ImportPreMadeMacros",
        },
      },
    },
  },
};
local defaults = {
  ["global"] = {
    ["Macros"] = {
      -- [1] = {
        -- [1] = "Category", -- Category
        -- [2] = {
          -- { "Description", "MacroName", 3, "/wave" }, -- Macro #1  (Description, MacroName Icon, MacroBody)
          -- { "Description2", "MacroName", 5, "/lol" }, -- Macro #2  (Description, MacroName, Icon, MacroBody)
        -- }, -- List of Macros under this name
      -- }, -- Sorted MacroName order
    },
  },
  ["profile"] = {
    ["Options"] = {
      ["AutoOpenMacroBank"] = true,
      ["Anchor"] = {
        ["Remember"] = false,
        ["X"] = nil,
        ["Y"] = nil,
      },
      ["NewName"] = L["TempName"],
      ["NewCategory"] = L["TempCategory"],
      ["NewDescription"] = L["TempDescription"],
      ["ReceivedCategory"] = L["TempReceivedCategory"],
      ["UseNameForDescription"] = true,
      ["ReplaceName"] = true,
      ["ReplaceIcon"] = true,
      ["AutoLoad"] = {
        ["DeleteGlobalOnTalentSwap"] = false,
        ["DeleteCharOnTalentSwap"] = false,
        ["DeleteGlobalOnLogin"] = false,
        ["DeleteCharOnLogin"] = false,
        ["PrimaryTalentsChar"] = {  -- A list in case we want to load multiple categories in the future (Won't have to upgrade DB)
          -- [1] = "Category Name 1",
        },
        ["PrimaryTalentsGlobal"] = {
          -- [1] = "Category Name 3",
        },
        ["SecondaryTalentsChar"] = {},
        ["SecondaryTalentsGlobal"] = {},
        ["LoginGlobal"] = {},
        ["LoginChar"] = {},
      },
    },
  },
};
local FontGold = "|cffffcc00";
local FontWhite = "|cffffffff";
local IconChoice = {
  ["NumLines"] = 10,
  ["NumColumns"] = 10,
};
StaticPopupDialogs.MacroBankAccept = {
  ["text"] = L["Accept new Macro from %s?"],
  ["button1"] = YES,
  ["button2"] = NO,
  ["timeout"] = 0,
  ["whileDead"] = 1,
  ["hideOnEscape"] = 1,
  ["OnAccept"] = function(self)
    if ( self.MacroBankData ) then
      MacroBank:CreateMacro(self.MacroBankData.Category,
        self.MacroBankData.Description,
        self.MacroBankData.Name,
        self.MacroBankData.IconTexture,
        self.MacroBankData.Body)
      SendAddonMessage("MacroBankAccepted", UnitName("player"), "WHISPER", self.MacroBankData.Sender)
      self.MacroBankData = nil
    end
  end,
  ["OnCancel"] = function(self)
    if ( self.MacroBankData ) then
      SendAddonMessage("MacroBankRejected", UnitName("player"), "WHISPER", self.MacroBankData.Sender)
      self.MacroBankData = nil
    end
  end,
};

StaticPopupDialogs.MacroBankSendTo = {
  ["text"] = L["Send selected macro to"],
  ["button1"] = OKAY,
  ["button2"] = CANCEL,
  ["hasEditBox"] = 1,
  ["timeout"] = 0,
  ["whileDead"] = 1,
  ["hideOnEscape"] = 1,
  ["OnAccept"] = function(self)
    local Name = self.editBox:GetText()
    if ( self.MacroBankData and Name ~= "" ) then
      MacroBank:SendMacro(self.MacroBankData, "WHISPER", Name)
      self.MacroBankData = nil
    end
  end,
  ["OnCancel"] = function(self)
    self.MacroBankData = nil
  end,
};

StaticPopupDialogs.MacroBankDeleteMacro = {
  ["text"] = L["Delete Macro %s?"],
  ["button1"] = YES,
  ["button2"] = NO,
  ["timeout"] = 0,
  ["whileDead"] = 1,
  ["hideOnEscape"] = 1,
  ["OnAccept"] = function(self)
    if ( self.MacroBankData ) then
      MacroBank:DeleteMacro(self.MacroBankData.CategoryIndex, self.MacroBankData.MacroIndex)
      self.MacroBankData = nil
    end
  end,
  ["OnCancel"] = function(self)
    self.MacroBankData = nil
  end,
};

StaticPopupDialogs.MacroBankSaveAllMacros = {
  ["text"] = L["Category?"],
  ["button1"] = ACCEPT,
  ["button2"] = CANCEL,
  ["hasEditBox"] = 1,
  ["timeout"] = 0,
  ["whileDead"] = 1,
  ["hideOnEscape"] = 1,
  ["OnAccept"] = function(self)
    MacroBank:SaveAllMacros(self.editBox:GetText())
  end,
};

-- I could do a multi-level dropdown by making an entry added with hasArrow, and adding a table of 'menuList'
Addon.EasyMenu_Send = {
  {
    ["text"] = L["MacroBank User"],
    ["isTitle"] = true,
  },
  {
    ["text"] = L["Player"],
    ["func"] = function() Addon:SendMacro_ToPlayer(true) end,
    ["disabled"] = false,
  },
  {
    ["text"] = L["Party"],
    ["func"] = function() Addon:SendMacro_ToChannel("PARTY", true) end,
    ["disabled"] = false,
  },
  {
    ["text"] = L["Raid"],
    ["func"] = function() Addon:SendMacro_ToChannel("RAID", true) end,
    ["disabled"] = false,
  },
  {
    ["text"] = L["Guild"],
    ["func"] = function() Addon:SendMacro_ToChannel("GUILD", true) end,
    ["disabled"] = false,
  },
  {
    ["text"] = "",  -- Spacer
  },
  {
    ["text"] = L["Non-MacroBank User"],
    ["isTitle"] = true,
  },
  {
    ["text"] = L["Player"],
    ["func"] = function() Addon:SendMacro_ToPlayer(false) end,
    ["disabled"] = false,
  },
  {
    ["text"] = L["Party"],
    ["func"] = function() Addon:SendMacro_ToChannel("PARTY", false) end,
    ["disabled"] = false,
  },
  {
    ["text"] = L["Raid"],
    ["func"] = function() Addon:SendMacro_ToChannel("RAID", false) end,
    ["disabled"] = false,
  },
  {
    ["text"] = L["Guild"],
    ["func"] = function() Addon:SendMacro_ToChannel("GUILD", false) end,
    ["disabled"] = false,
  },
  {
    ["text"] = "",  -- Spacer
  },
  {
    ["text"] = CANCEL,
    ["disabled"] = false,
  },
};

function Addon:OnInitialize()
-- self:Print("OnInit()")
  self.db = LibStub("AceDB-3.0"):New("MacroBankDB", defaults, L["Default"]);
  -- self.db.RegisterCallback(self, "OnProfileChanged", "OnProfileChanged");
  -- self.db.RegisterCallback(self, "OnProfileCopied", "OnProfileChanged");
  -- self.db.RegisterCallback(self, "OnProfileReset", "OnProfileChanged");
  -- self.db.RegisterCallback(self, "OnProfileDeleted", "OnProfileNewOrDelete");
  -- self.db.RegisterCallback(self, "OnNewSet", "OnProfileNewOrDelete");
  LibStub("AceConfig-3.0"):RegisterOptionsTable("MacroBank CmdLine", CmdOptions, {L["SlashCmd1"], L["SlashCmd2"]})
  MenuOptions.args.Profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db);
  LibStub("AceConfig-3.0"):RegisterOptionsTable(L["MacroBank"], MenuOptions);
  self.MainFrame = self:CreateMainFrame();
  self.DropDownFrame = CreateFrame("Frame", "MacroBank_DropDownMenu", nil, "UIDropDownMenuTemplate");
  self.ExpandedTree = {};
  self.MacroGroups = {};
  self.CurrentMacro = 0;
  self:UpgradeDatabase();
  self:RegisterEvent("ADDON_LOADED");
  self:RegisterEvent("PLAYER_TALENT_UPDATE");
  self:RegisterEvent("CHAT_MSG_ADDON");
  self:RegisterEvent("PLAYER_ENTERING_WORLD");
end

function Addon:OnEnable()
  -- if ( IsAddOnLoaded("Blizzard_MacroUI") ) then
    -- self:ADDON_LOADED(nil, "Blizzard_MacroUI");
  -- else
    -- UIParentLoadAddOn("Blizzard_MacroUI");
  -- end
  -- self:CheckAutoLoad();
  -- self.IconToIndex = {};
  -- for Index = 1, GetNumMacroIcons() do
    -- self.IconToIndex[GetMacroIconInfo(Index)] = Index;
  -- end
  -- self:SetStartingEndingIndex();
  -- self:BuildMacroGroupList();
  -- self.CurrentTalents = GetActiveTalentGroup();
  -- self.AllowAutoLoadTalents = true;
end

function Addon:PLAYER_ENTERING_WORLD()
  if ( IsAddOnLoaded("Blizzard_MacroUI") ) then
    self:ADDON_LOADED(nil, "Blizzard_MacroUI");
  else
    UIParentLoadAddOn("Blizzard_MacroUI");
  end
  self:CheckAutoLoad();
  self.IconToIndex = {};
  for Index = 1, GetNumMacroIcons() do
    self.IconToIndex[GetMacroIconInfo(Index)] = Index;
  end
  self:SetStartingEndingIndex();
  self:BuildMacroGroupList();
  self.CurrentTalents = GetActiveTalentGroup();
  self.AllowAutoLoadTalents = true;
  self:AutoLoadOnLogin();
  self:UnregisterEvent("PLAYER_ENTERING_WORLD");
end

function Addon:SetStartingEndingIndex()
  self.StartingIndex, self.EndingIndex = {}, {};
  self.StartingIndex.Global = 1;
  if ( select(4, GetBuildInfo()) < 30000 ) then
    self.EndingIndex.Global = MAX_MACROS or 18;
    self.StartingIndex.Char = (MAX_MACROS or 18) + 1;
    self.EndingIndex.Char = self.StartingIndex.Char + (MAX_MACROS or 18) - 1;
  else
    self.EndingIndex.Global = MAX_ACCOUNT_MACROS or 36;
    self.StartingIndex.Char = (MAX_ACCOUNT_MACROS or 36) + 1;
    self.EndingIndex.Char = self.StartingIndex.Char + (MAX_CHARACTER_MACROS or 18) - 1;
  end
end

-- function Addon:OnDisable()
  -- self:UnregisterEvent("ADDON_LOADED");
-- end

-- function Addon:OnProfileChanged()
  -- this is called every time your profile changes (after the change)
  -- self:OnProfileNewOrDelete();
-- end

-- function Addon:OnProfileNewOrDelete()
-- end

function Addon:ADDON_LOADED(Event, Addon)
  if ( Addon == "Blizzard_MacroUI" ) then
-- self:Print("macro ui was loaed")
    self:SetStartingEndingIndex();
    -- MacroBank toggle button
    self.MacroBankToggleButton = CreateFrame("Button", nil, MacroFrame, "UIPanelButtonTemplate");
    -- self.MacroBankToggleButton:SetPoint("RIGHT", MacroFrameCloseButton, "LEFT", 3, 1);
    self.MacroBankToggleButton:SetPoint("TOPRIGHT", MacroButtonScrollFrame, "BOTTOMRIGHT", 25, -9);
    self.MacroBankToggleButton:SetWidth(90);
    self.MacroBankToggleButton:SetHeight(22);
    self.MacroBankToggleButton:SetText(L["MacroBank"]);
    self.MacroBankToggleButton:SetScript("OnClick", function()
      if ( self.MainFrame:IsVisible() ) then
        self.MainFrame:Hide()
      else
        self.MainFrame:Show()
      end
    end);
    self.MacroBankToggleButton:Show();
    
    self.OnShowFrame = CreateFrame("Frame", nil, MacroFrame);  -- Instead of hooking the OnShow event.  (Less intrusive)
    self.OnShowFrame:SetScript("OnShow", function(...)
      if ( self.db.profile.Options.AutoOpenMacroBank ) then
        self.MainFrame:Show()
      else
        self.MainFrame:Hide()
      end
    end);
    self.MainFrame:SetParent(MacroFrame);
    self:DisplayAtAnchor();
    self:DisplayMacro();
    self:UnregisterEvent("ADDON_LOADED");
  end
end

function Addon:PLAYER_TALENT_UPDATE(Event)
  if ( GetActiveTalentGroup() ~= self.CurrentTalents and self.AllowAutoLoadTalents ) then  -- We switched talents
    self.CurrentTalents = GetActiveTalentGroup();
    local DeletedGlobal, DeletedChar;
    if ( self.CurrentTalents == 1 ) then  -- Primary Talents
      for Key, Value in pairs(self.db.profile.Options.AutoLoad.PrimaryTalentsChar) do
        if ( self.db.profile.Options.AutoLoad.DeleteCharOnTalentSwap and not DeletedChar ) then
          self:DeleteActiveMacros("Char");
          DeletedChar = true;
        end
        self:LoadCategory(Value, "Char");
      end
      for Key, Value in pairs(self.db.profile.Options.AutoLoad.PrimaryTalentsGlobal) do
        if ( self.db.profile.Options.AutoLoad.DeleteGlobalOnTalentSwap and not DeletedGlobal ) then
          self:DeleteActiveMacros("Global");
          DeletedGlobal = true;
        end
        self:LoadCategory(Value, "Global");
      end
    else  -- Secondary Talents
      for Key, Value in pairs (self.db.profile.Options.AutoLoad.SecondaryTalentsChar) do
        if ( self.db.profile.Options.AutoLoad.DeleteCharOnTalentSwap and not DeletedChar ) then
          self:DeleteActiveMacros("Char");
          DeletedChar = true;
        end
        self:LoadCategory(Value, "Char");
      end
      for Key, Value in pairs (self.db.profile.Options.AutoLoad.SecondaryTalentsGlobal) do
        if ( self.db.profile.Options.AutoLoad.DeleteGlobalOnTalentSwap and not DeletedGlobal ) then
          self:DeleteActiveMacros("Global");
          DeletedGlobal = true;
        end
        self:LoadCategory(Value, "Global");
      end
    end
  end
end

function Addon:AutoLoadOnLogin()
  local DeletedGlobal, DeletedChar;
  for Key, Value in pairs(self.db.profile.Options.AutoLoad.LoginChar) do
    if ( self.db.profile.Options.AutoLoad.DeleteCharOnLogin and not DeletedChar ) then
      self:DeleteActiveMacros("Char");
      DeletedChar = true;
    end
    self:LoadCategory(Value, "Char");
  end
  for Key, Value in pairs(self.db.profile.Options.AutoLoad.LoginGlobal) do
    if ( self.db.profile.Options.AutoLoad.DeleteGlobalOnLogin and not DeletedGlobal ) then
      self:DeleteActiveMacros("Global");
      DeletedGlobal = true;
    end
    self:LoadCategory(Value, "Global");
  end
end

Addon.ReceivingMacro = {};
function Addon:CHAT_MSG_ADDON(Event, Prefix, Message, DistributionType, Sender)
  -- print(Event.." "..DistributionType.." "..Sender.." "..Prefix.." "..Message);
  local MessageID = string.match(Prefix, "MacroBank(.*)");
  if ( Sender == UnitName("player") or not MessageID ) then
    return;
  end
  local Output;
  if ( MessageID == "Accepted" ) then
    Output = string.gsub(L["%s Accepted your macro"], "%%s", Sender);
    self:Print(Output);
  elseif ( MessageID == "Rejected" ) then
    Output = string.gsub(L["%s Rejected your macro"], "%%s", Sender);
    self:Print(Output);
  else
    if ( not self.ReceivingMacro[MessageID] ) then
      self.ReceivingMacro[MessageID] = {
        ["Category"] = string.gsub(self.db.profile.Options.ReceivedCategory, "%%s", Sender)
      };
    end
    if ( Message ~= "" ) then
      if ( not self.ReceivingMacro[MessageID].Description ) then
        self.ReceivingMacro[MessageID].Description = Message;
      elseif ( not self.ReceivingMacro[MessageID].Name ) then
        self.ReceivingMacro[MessageID].Name = Message;
      elseif ( not self.ReceivingMacro[MessageID].IconTexture ) then
        self.ReceivingMacro[MessageID].IconTexture = Message;
      elseif ( not self.ReceivingMacro[MessageID].Body ) then
        self.ReceivingMacro[MessageID].Body = Message;
      else
        self.ReceivingMacro[MessageID].Body = self.ReceivingMacro[MessageID].Body..Message;
      end
    else
      local MacroBankData = {
        ["Category"] = self.ReceivingMacro[MessageID].Category,
        ["Description"] = self.ReceivingMacro[MessageID].Description,
        ["Name"] = self.ReceivingMacro[MessageID].Name,
        ["IconTexture"] = self.ReceivingMacro[MessageID].IconTexture,
        ["Body"] = self.ReceivingMacro[MessageID].Body,
        ["Sender"] = Sender,
      };
      self.ReceivingMacro[MessageID] = nil;
      local Dialog = StaticPopup_Show("MacroBankAccept", Sender);
      if ( Dialog ) then
        Dialog.MacroBankData = MacroBankData;
      end
    end
  end
end

function Addon:StringSplit(str, patt)
  local vals = {};
  local valindex = 1;
  local word = "";
  -- need to add a trailing separator to catch the last value.
  str = str..patt;
  for i = 1, string.len(str) do
    cha = string.sub(str, i, i);
    if cha ~= patt then
      word = word..cha;
    else
      if word ~= nil then
        vals[valindex] = word;
        valindex = valindex + 1;
        word = "";
      else
        -- in case we get a line with no data.
        break;
      end
    end 
  end	
  return vals, valindex-1;
end

function Addon:SendMacro(Data, Channel, Name)
  if ( Data.OtherMacroBankUser ) then
    local MessageID = "MacroBank"..tostring(time());
    local DataSize = 254 - string.len(MessageID);
    SendAddonMessage(MessageID, Data.Description, Channel, Name);
    SendAddonMessage(MessageID, Data.Name, Channel, Name);
    SendAddonMessage(MessageID, Data.IconTexture, Channel, Name);
    for Index = 1, string.len(Data.Body), DataSize do
      SendAddonMessage(MessageID, string.sub(Data.Body, Index, Index + DataSize - 1), Channel, Name);
    end
    SendAddonMessage(MessageID, "", Channel, Name);  -- Signal that we are done sending the macro body text.
  else
    local Message = string.gsub(Data.Body, string.char(13), string.char(10));  -- Convert \013 to \010
    -- Message = string.gsub(Message, "|", "||");  -- Convert | to ||
    local Segments, NumSegments = self:StringSplit(Message, string.char(10));  -- Split on \010
    for i = 1, NumSegments do
      if ( Segments[i] and Segments[i] ~= "" ) then
        SendChatMessage(Segments[i], Channel, nil, Name);
      end
    end
  end
end

function Addon:SendMacro_ToPlayer(OtherMacroBankUser)
  self.MainFrame.Macros.MacroBody.Text:ClearFocus();  -- Save current body text.
  local CategoryIndex, MacroIndex, Expanded = self:GetMacroIndex(self.CurrentMacro);
  if ( self.CurrentMacro == 0 or MacroIndex == 0 ) then
    return;
  end
  local Dialog = StaticPopup_Show("MacroBankSendTo")
  if Dialog then
    Dialog.MacroBankData = {
      ["Description"] = self.db.global.Macros[CategoryIndex][2][MacroIndex][1],
      ["Name"] = self.db.global.Macros[CategoryIndex][2][MacroIndex][2],
      ["IconTexture"] = self.db.global.Macros[CategoryIndex][2][MacroIndex][3],
      ["Body"] = self.db.global.Macros[CategoryIndex][2][MacroIndex][4],
      ["OtherMacroBankUser"] = OtherMacroBankUser,
    };
    Dialog.editBox:SetScript("OnEnterPressed",  function(t) Dialog.button1:Click() end)
  end
end

function Addon:SendMacro_ToChannel(Channel, OtherMacroBankUser)
  self.MainFrame.Macros.MacroBody.Text:ClearFocus();  -- Save current body text.
  local CategoryIndex, MacroIndex, Expanded = self:GetMacroIndex(self.CurrentMacro);
  if ( self.CurrentMacro == 0 or MacroIndex == 0 ) then
    return;
  end
  local MacroBankData = {
    ["Description"] = self.db.global.Macros[CategoryIndex][2][MacroIndex][1],
    ["Name"] = self.db.global.Macros[CategoryIndex][2][MacroIndex][2],
    ["IconTexture"] = self.db.global.Macros[CategoryIndex][2][MacroIndex][3],
    ["Body"] = self.db.global.Macros[CategoryIndex][2][MacroIndex][4],
    ["OtherMacroBankUser"] = OtherMacroBankUser,
  };
  self:SendMacro(MacroBankData, Channel, nil);
end

function Addon:OptionsSet(Info, Value)
  local Table = self.db.profile.Options;
  for Key = 1, (#Info.arg - 1) do
    if ( not Table[Info.arg[Key]] ) then
      Table[Info.arg[Key]] = {};
    end
    Table = Table[Info.arg[Key]];
  end
  Table[Info.arg[#Info.arg]] = Value;
end

function Addon:OptionsGet(Info)
  local Table = self.db.profile.Options;
  for Key = 1, (#Info.arg - 1) do
    if ( not Table[Info.arg[Key]] ) then
      Table[Info.arg[Key]] = {};
    end
    Table = Table[Info.arg[Key]];
  end
  return Table[Info.arg[#Info.arg]];
end

function Addon:SetAutoLoadOptions(Info, Index, Value)
  -- Since I don't want to upgrade db...
  local CategoryToChange = self.MacroGroups[Index];
  for AutoLoadKey, AutoLoadValue in pairs(self.db.profile.Options.AutoLoad[Info.arg]) do
    if ( AutoLoadValue == CategoryToChange ) then
      table.remove(self.db.profile.Options.AutoLoad[Info.arg], AutoLoadKey);
      return;
    end
  end
  table.insert(self.db.profile.Options.AutoLoad[Info.arg], CategoryToChange);
end

function Addon:GetAutoLoadOptions(Info, Index)
  local Category = self.MacroGroups[Index];
  for AutoLoadKey, AutoLoadValue in pairs(self.db.profile.Options.AutoLoad[Info.arg]) do
    if ( AutoLoadValue == Category ) then
      return true;
    end
  end
end

function Addon:GetMacroGroupList()
  return self.MacroGroups;
end

function Addon:BuildMacroGroupList()
  for Key, Value in pairs(self.MacroGroups) do
    self.MacroGroups[Key] = nil;
  end
  for Key, Value in ipairs(self.db.global.Macros) do
    table.insert(self.MacroGroups, Value[1]);
  end
  LibStub("AceConfigRegistry-3.0"):NotifyChange(L["MacroBank"]);
end

function Addon:ImportPreMadeMacros()
  local Category, Desc, Name, IconTexture, Body;
  for Key, Value in pairs(self.PreMadeMacros) do
    if ( Value.body ) then
      Category = Value.category or self.db.profile.Options.NewCategory;
      Description = Value.desc or self.db.profile.Options.NewDescription;
      Name = string.sub((Value.name or self.db.profile.Options.NewName), 1, 16);
      IconTexture = GetMacroIconInfo(1);
      Body = string.sub(Value.body, 1, 255);
      self:CreateMacro(Category, Description, Name, IconTexture, Value.body)
    end
  end
end

function Addon:LoadCategoryFromAce(Info, Value)
  self:LoadCategory(Value, Info[#Info]);
end

function Addon:LoadCategory(CategoryName, MacroSet)
  -- Save the macro in the macro bank first.
  self.MainFrame.Macros.MacroBody.Text:ClearFocus();  -- Save by clearing focus (the on focus clear will save it)
  if ( UnitAffectingCombat("player") ) then
    self:Print(L["Can't load macros in combat"]);
    return;
  end
  local CategoryIndex;
  for CategoryKey, CategoryValue in ipairs(self.db.global.Macros) do
    if ( CategoryName == CategoryValue[1] ) then
      CategoryIndex = CategoryKey;
      break;
    end
  end
  if ( not CategoryIndex ) then
    self:Print(L["Can't find category"]);
    return;
  end
  local Name, Icon, Body, ErrorInfo;
  for MacroKey, MacroValue in ipairs(self.db.global.Macros[CategoryIndex][2]) do
    Name = MacroValue[2];
    Icon = MacroValue[3];
    -- Convert to icon #.
    Icon = self.IconToIndex[Icon] or self.IconToIndex[string.gsub(Icon, "%.blp", "")] or 1;
    Body = MacroValue[4];
    ErrorInfo = self:LoadMacro(Name, Icon, Body, MacroSet);
    if ( ErrorInfo ) then
      self:Print(ErrorInfo.." "..Name);
    end
  end
end

function Addon:LoadMacro(Name, Icon, Body, MacroSet, MacroIndex)
  local IsCharMacro;
  if ( MacroSet == "Global" ) then
    IsCharMacro = false;
  elseif ( MacroSet == "Char" ) then
    IsCharMacro = true;
  else
    return;
  end
  -- If we were not given a MacroIndex, see if we can find a MacroIndex with our Name
  if ( not MacroIndex ) then
    local MacroName;
    for Index = self.StartingIndex[MacroSet], self.EndingIndex[MacroSet] do
      MacroName, _, _, _ = GetMacroInfo(Index);
      if ( MacroName == Name ) then
        MacroIndex = Index;
        break;
      end
    end
  end
  -- Now, if we found a MacroIndex, we edit the macro, otherwise check if there's room and create one
  if ( MacroIndex ) then
    EditMacro(MacroIndex, Name, Icon, Body, 1, IsCharMacro);
  else
    local NumMacros = {};
    NumMacros.Global, NumMacros.Char = GetNumMacros();
    if ( NumMacros[MacroSet] < (self.EndingIndex[MacroSet] - self.StartingIndex[MacroSet] + 1) ) then
      if ( select(4, GetBuildInfo()) < 30000 ) then
        CreateMacro(Name, Icon, Body, 1, IsCharMacro);
      else
        CreateMacro(Name, Icon, Body, IsCharMacro);
      end
    else
      return L["Not enough room to load macro"];
    end
  end
  if ( MacroFrame_Update ) then
    MacroFrame_Update();
  end
end

function Addon:Load_OnClick(ReplaceSelected)
  -- Save the macro in the macro bank first.
  self.MainFrame.Macros.MacroBody.Text:ClearFocus();  -- Save by clearing focus (the on focus clear will save it)
  -- Now load/replace
  if ( UnitAffectingCombat("player") ) then
    self:Print(L["Can't load macros in combat"]);
    return;
  end
  local CurrentlySelected = {};
  CurrentlySelected.CategoryIndex, CurrentlySelected.MacroIndex, CurrentlySelected.Expanded = self:GetMacroIndex(self.CurrentMacro);
  if ( CurrentlySelected.MacroIndex == 0 ) then
    return;
  end
  
  local MacroSet;
  if ( MacroFrame.selectedTab == 1 ) then
    MacroSet = "Global";
  else
    MacroSet = "Char";
  end
  if ( IsShiftKeyDown() and not ReplaceSelected and self.db.global.Macros[CurrentlySelected.CategoryIndex] ) then
    local CategoryName = self.db.global.Macros[CurrentlySelected.CategoryIndex][1];
    self:LoadCategory(CategoryName, MacroSet);
    return;
  end

  CurrentlySelected.Name = self.db.global.Macros[CurrentlySelected.CategoryIndex][2][CurrentlySelected.MacroIndex][2];
  CurrentlySelected.Icon = self.db.global.Macros[CurrentlySelected.CategoryIndex][2][CurrentlySelected.MacroIndex][3];
  -- Convert to icon #.
  CurrentlySelected.Icon = self.IconToIndex[CurrentlySelected.Icon] or self.IconToIndex[string.gsub(CurrentlySelected.Icon, "%.blp", "")] or 1;
  CurrentlySelected.Body = self.db.global.Macros[CurrentlySelected.CategoryIndex][2][CurrentlySelected.MacroIndex][4];
  local MacroIndex;
  if ( ReplaceSelected and MacroFrame.selectedMacro ) then
    MacroIndex = MacroFrame.selectedMacro;
    local OriginalName, OriginalIcon, _, _ = GetMacroInfo(MacroFrame.selectedMacro);
    if ( not self.db.profile.Options.ReplaceName ) then
      CurrentlySelected.Name = OriginalName;
    end
    if ( not self.db.profile.Options.ReplaceIcon ) then
      CurrentlySelected.Icon = OriginalIcon;
    end
  end
  local ErrorInfo = self:LoadMacro(CurrentlySelected.Name, CurrentlySelected.Icon, CurrentlySelected.Body, MacroSet, MacroIndex);
  if ( ErrorInfo ) then
    self:Print(ErrorInfo);
  end
end

function Addon:Save_OnClick()
  if ( not MacroFrame.selectedMacro ) then
    return;
  end
  MacroFrame_SaveMacro();  -- Save whatever changes they have done, so they don't have to press escape to save
  if ( IsShiftKeyDown() ) then
    local Dialog = StaticPopup_Show("MacroBankSaveAllMacros");
    return;
  end
  local Name, IconTexture, Body, _ = GetMacroInfo(MacroFrame.selectedMacro);
  -- local Icon = self.IconToIndex[IconTexture] or self.IconToIndex[string.gsub(IconTexture, "%.blp", "")] or 1;
  local Category;
  if ( self.CurrentMacro > 0 ) then
    local CategoryIndex, MacroIndex, Expanded = self:GetMacroIndex(self.CurrentMacro);
    Category = self.db.global.Macros[CategoryIndex][1];
  else
    Category = self.db.profile.Options.NewCategory;
  end
  local Description;
  if ( self.db.profile.Options.UseNameForDescription ) then
    Description = Name;
  else
    Description = self.db.profile.Options.NewDescription;
  end
  self:CreateMacro(Category, Description, Name, IconTexture, Body);
end

function Addon:SaveAllMacros(Category)
  local Start, End;
  local NumGlobal, NumChar = GetNumMacros();
  if ( MacroFrame.selectedMacro <= self.EndingIndex.Global ) then
    Start = self.StartingIndex.Global;
    End = Start + NumGlobal - 1;
  else
    Start = self.StartingIndex.Char;
    End = Start + NumChar - 1;
  end
  local Name, IconTexture, Body, Description;
  for Index = Start, End do
    Name, IconTexture, Body, _ = GetMacroInfo(Index);
    if ( self.db.profile.Options.UseNameForDescription ) then
      Description = Name;
    else
      Description = self.db.profile.Options.NewDescription;
    end
    self:CreateMacro(Category, Description, Name, IconTexture, Body);
  end
end


function Addon:DeleteMacro(CategoryIndex, MacroIndex, NoUpdateDisplay)
  -- local CategoryIndex, MacroIndex, Expanded = self:GetMacroIndex(self.CurrentMacro);
  -- if ( self.CurrentMacro == 0 or MacroIndex == 0 ) then
  if ( not CategoryIndex or not MacroIndex or not self.db.global.Macros[CategoryIndex] or not self.db.global.Macros[CategoryIndex][2][MacroIndex] ) then
    return;
  end
  table.remove(self.db.global.Macros[CategoryIndex][2], MacroIndex);
  if ( #self.db.global.Macros[CategoryIndex][2] == 0 ) then
    self.ExpandedTree[self.db.global.Macros[CategoryIndex][1]] = nil;
    table.remove(self.db.global.Macros, CategoryIndex);
    self:BuildMacroGroupList();
  end
  self.CurrentMacro = 0;
  if ( not NoUpdateDisplay ) then
    self:DisplayMacro();
  end
  self:CheckAutoLoad();
end

function Addon:CreateMacro(Category, Description, Name, IconTexture, Body, NoUpdateDisplay)
  local CurrentlySelected = {};
  CurrentlySelected.CategoryIndex, CurrentlySelected.MacroIndex, CurrentlySelected.Expanded = self:GetMacroIndex(self.CurrentMacro);
  if ( self.CurrentMacro > 0 and CurrentlySelected.MacroIndex > 0 ) then
    CurrentlySelected.Category = self.db.global.Macros[CurrentlySelected.CategoryIndex][1];
    CurrentlySelected.Description = self.db.global.Macros[CurrentlySelected.CategoryIndex][2][CurrentlySelected.MacroIndex][1];
    CurrentlySelected.Name = self.db.global.Macros[CurrentlySelected.CategoryIndex][2][CurrentlySelected.MacroIndex][2];
    CurrentlySelected.Icon = self.db.global.Macros[CurrentlySelected.CategoryIndex][2][CurrentlySelected.MacroIndex][3];
    CurrentlySelected.Body = self.db.global.Macros[CurrentlySelected.CategoryIndex][2][CurrentlySelected.MacroIndex][4];
  end
  local CategoryIndex;
  for Key, Value in ipairs(self.db.global.Macros) do
    if ( Value[1] == Category ) then
      CategoryIndex = Key;
      break;
    end
  end
  local NewMacro = {
    [1] = Description,
    [2] = Name,
    [3] = IconTexture,
    [4] = Body,
  };
  if ( CategoryIndex ) then
    table.insert(self.db.global.Macros[CategoryIndex][2], NewMacro);
    table.sort(self.db.global.Macros[CategoryIndex][2], function(a, b) if ( string.lower(a[1]) < string.lower(b[1]) ) then return true end end);
  else
    CategoryIndex = #self.db.global.Macros + 1;
    self.db.global.Macros[CategoryIndex] = {
      [1] = Category,
      [2] = {
        [1] = NewMacro,
      },
    };
    table.sort(self.db.global.Macros, function(a, b) if ( string.lower(a[1]) < string.lower(b[1]) ) then return true end end);
    self:BuildMacroGroupList();
  end
  if ( self.CurrentMacro > 0 and CurrentlySelected.MacroIndex > 0 ) then
    self.CurrentMacro = self:FindMacroIndex(CurrentlySelected.Category, CurrentlySelected.Description, CurrentlySelected.Name, CurrentlySelected.Icon, CurrentlySelected.Body);
  end
  if ( not NoUpdateDisplay ) then
    self:DisplayMacro();
  end
end

function Addon:DeleteActiveMacros(Which)
  local GlobalMacros, CharMacros = GetNumMacros();
  if ( Which == "Global" ) then
    for Index = GlobalMacros, 1, -1 do
      DeleteMacro(Index);
    end
  else
    for Index = CharMacros, 1, -1 do
      DeleteMacro(Index + self.StartingIndex.Char - 1);
    end
  end
end

function Addon:ShowTooltip(...)
  if ( select("#", ...) == 0 ) then
    return;
  end
  GameTooltip:SetOwner(self.MainFrame, "ANCHOR_TOPLEFT");
  GameTooltip:SetText(FontWhite..select(1, ...));
  for i = 2, select("#", ...) do
    GameTooltip:AddLine(FontGold..select(i, ...));
  end
  GameTooltip:Show();
end

function Addon:DisplayMacro()
  local CategoryIndex, MacroIndex, Expanded = self:GetMacroIndex(self.CurrentMacro);
  if ( self.CurrentMacro == 0 or MacroIndex == 0 ) then
    self.MainFrame.Macros.FromMacroBank:Hide();
    -- self.MainFrame.Macros.LoadButton:Hide();
    -- self.MainFrame.Macros.ReplaceButton:Hide();
    self.MainFrame.Macros.DeleteButton:Hide();
    self.MainFrame.Macros.MacroCategory:Hide();
    self.MainFrame.Macros.MacroDescription:Hide();
    self.MainFrame.Macros.MacroName:Hide();
    self.MainFrame.Macros.MacroIcon:Hide();
    self.MainFrame.Macros.MacroBody:Hide();
    self.MainFrame.Macros.SendToButton:Hide();
  else
    self.MainFrame.Macros.FromMacroBank:Show();
    -- self.MainFrame.Macros.LoadButton:Show();
    -- self.MainFrame.Macros.ReplaceButton:Show();
    self.MainFrame.Macros.DeleteButton:Show();
    self.MainFrame.Macros.MacroCategory:Show();
    self.MainFrame.Macros.MacroDescription:Show();
    self.MainFrame.Macros.MacroName:Show();
    self.MainFrame.Macros.MacroIcon:Show();
    self.MainFrame.Macros.MacroBody:Show();
    self.MainFrame.Macros.MacroCategory:SetText(self.db.global.Macros[CategoryIndex][1]);
    self.MainFrame.Macros.MacroDescription:SetText(self.db.global.Macros[CategoryIndex][2][MacroIndex][1]);
    self.MainFrame.Macros.MacroName:SetText(self.db.global.Macros[CategoryIndex][2][MacroIndex][2]);
    -- self.MainFrame.Macros.MacroIcon.NormalTexture:SetTexture(GetMacroIconInfo(self.db.global.Macros[CategoryIndex][2][MacroIndex][3]))
    self.MainFrame.Macros.MacroIcon.NormalTexture:SetTexture(self.db.global.Macros[CategoryIndex][2][MacroIndex][3])
    self.MainFrame.Macros.MacroBody.Text:SetText(self.db.global.Macros[CategoryIndex][2][MacroIndex][4]);
    self.MainFrame.Macros.SendToButton:Show();
  end
  self:MacroList_OnScroll();
end

function Addon:SetMacroCategory(Category)
  local CategoryIndex, MacroIndex, Expanded = self:GetMacroIndex(self.CurrentMacro);
  if ( self.CurrentMacro == 0 or MacroIndex == 0 ) then
    return;
  end
  local Description = self.db.global.Macros[CategoryIndex][2][MacroIndex][1];
  local Name = self.db.global.Macros[CategoryIndex][2][MacroIndex][2];
  local Icon = self.db.global.Macros[CategoryIndex][2][MacroIndex][3];
  local Body = self.db.global.Macros[CategoryIndex][2][MacroIndex][4];
  self:DeleteMacro(CategoryIndex, MacroIndex, true);
  self:CreateMacro(Category, Description, Name, Icon, Body, true);
  self:DisplayMacro();
end

function Addon:SetMacroDescription(Description)
  local CategoryIndex, MacroIndex, Expanded = self:GetMacroIndex(self.CurrentMacro);
  if ( self.CurrentMacro == 0 or MacroIndex == 0 ) then
    return;
  end
  local Category = self.db.global.Macros[CategoryIndex][1];
  self.db.global.Macros[CategoryIndex][2][MacroIndex][1] = Description;
  local Name = self.db.global.Macros[CategoryIndex][2][MacroIndex][2];
  local Icon = self.db.global.Macros[CategoryIndex][2][MacroIndex][3];
  local Body = self.db.global.Macros[CategoryIndex][2][MacroIndex][4];
  table.sort(self.db.global.Macros[CategoryIndex][2], function(a, b) if ( string.lower(a[1]) < string.lower(b[1]) ) then return true end end);
  self.CurrentMacro = self:FindMacroIndex(Category, Description, Name, Icon, Body);
  self:DisplayMacro();
end

function Addon:SetMacroName(Name)
  local CategoryIndex, MacroIndex, Expanded = self:GetMacroIndex(self.CurrentMacro);
  if ( self.CurrentMacro == 0 or MacroIndex == 0 ) then
    return;
  end
  self.db.global.Macros[CategoryIndex][2][MacroIndex][2] = Name;
end

function Addon:SetMacroIcon(Icon)
  local CategoryIndex, MacroIndex, Expanded = self:GetMacroIndex(self.CurrentMacro);
  if ( self.CurrentMacro == 0 or MacroIndex == 0 ) then
    return;
  end
  -- self.db.global.Macros[CategoryIndex][2][MacroIndex][3] = Icon;
  self.db.global.Macros[CategoryIndex][2][MacroIndex][3] = GetMacroIconInfo(Icon);
end

function Addon:SetMacroBody(Body)
  local CategoryIndex, MacroIndex, Expanded = self:GetMacroIndex(self.CurrentMacro);
  if ( self.CurrentMacro == 0 or MacroIndex == 0 ) then
    return;
  end
  self.db.global.Macros[CategoryIndex][2][MacroIndex][4] = Body;
end

function Addon:GetMacroIndex(LineNum)
  local CurrentLine = 0;
  local NumMacros;
  for CategoryKey, CategoryValue in ipairs(self.db.global.Macros) do
    -- Add 1 for the base entry, and if it's expanded, the # of macros for the entry.
    CurrentLine = CurrentLine + 1;
    if ( self.ExpandedTree[CategoryValue[1]] ) then
      NumMacros = #CategoryValue[2];
    else
      NumMacros = 0;
    end
    CurrentLine = CurrentLine + NumMacros;
    if ( LineNum <= CurrentLine ) then
      return CategoryKey, LineNum - (CurrentLine - NumMacros), self.ExpandedTree[CategoryValue[1]];
    end
  end
end

function Addon:GetNumDisplayedMacros()
  local NumEntries = 0;
  for CategoryKey, CategoryValue in ipairs(self.db.global.Macros) do
    NumEntries = NumEntries + 1;
    if ( self.ExpandedTree[CategoryValue[1]] ) then
      NumEntries = NumEntries + #CategoryValue[2];
    end
  end
  return NumEntries;
end

function Addon:FindMacroIndex(Category, Description, Name, Icon, Body)
  local NumEntries = 0;
  for CategoryKey, CategoryValue in ipairs(self.db.global.Macros) do
    NumEntries = NumEntries + 1;
    if ( CategoryValue[1] == Category ) then
      if ( self.ExpandedTree[CategoryValue[1]] ) then
        -- Line is expanded, iterate through the macros till we find it.
        for MacroKey, MacroValue in ipairs(CategoryValue[2]) do
          NumEntries = NumEntries + 1;
          if ( Description == MacroValue[1] and Name == MacroValue[2] and Icon == MacroValue[3] and Body == MacroValue[4] ) then
            return NumEntries;
          end
        end
      else
        return 0;  -- Line isn't expanded, but this was the name we were given.
      end
    else
      if ( self.ExpandedTree[CategoryValue[1]] ) then
        NumEntries = NumEntries + #CategoryValue[2];
      end
    end
  end
end

function Addon:FindCategoryIndex(CategoryIndex)
  local CurrentLine = 0;
  local NumMacros;
  for CategoryKey, CategoryValue in ipairs(self.db.global.Macros) do
    -- Add 1 for the base entry, and if it's expanded, the # of macros for the entry.
    CurrentLine = CurrentLine + 1;
    if ( CategoryKey == CategoryIndex ) then
      return CurrentLine;
    else
      if ( self.ExpandedTree[CategoryValue[1]] ) then
        NumMacros = #CategoryValue[2];
      else
        NumMacros = 0;
      end
      CurrentLine = CurrentLine + NumMacros;
    end
  end
  return 0;
end

function Addon:SelectMacro(LineNum)
  self.MainFrame.Macros.MacroBody.Text:ClearFocus();  -- Save by clearing focus (the on focus clear will save it)
  local LineOffset = LineNum + FauxScrollFrame_GetOffset(self.MainFrame.Macros.MacroList.ScrollFrame);
  local CategoryIndex, MacroIndex, Expanded = self:GetMacroIndex(LineOffset)
  self.CurrentMacro = LineOffset;
  if ( MacroIndex == 0 ) then
    self.ExpandedTree[self.db.global.Macros[CategoryIndex][1]] = not self.ExpandedTree[self.db.global.Macros[CategoryIndex][1]];
  end
  self:DisplayMacro();
end

--[=[ No longer used, as it was deemed to confusing for people saving/creating macros and not know where they are ending up.
function Addon:ExpandCollapse_OnClick(LineNum)
  self.MainFrame.Macros.MacroBody.Text:ClearFocus();  -- Save by clearing focus (the on focus clear will save it)
  local LineOffset = LineNum + FauxScrollFrame_GetOffset(self.MainFrame.Macros.MacroList.ScrollFrame);
  local CategoryIndex, MacroIndex, Expanded = self:GetMacroIndex(LineOffset)
  local CurrentlySelected = {};
  CurrentlySelected.CategoryIndex, CurrentlySelected.MacroIndex, CurrentlySelected.Expanded = self:GetMacroIndex(self.CurrentMacro);
  if ( CurrentlySelected.MacroIndex > 0 ) then
    CurrentlySelected.Category = self.db.global.Macros[CurrentlySelected.CategoryIndex][1];
    CurrentlySelected.Description = self.db.global.Macros[CurrentlySelected.CategoryIndex][2][CurrentlySelected.MacroIndex][1];
    CurrentlySelected.Name = self.db.global.Macros[CurrentlySelected.CategoryIndex][2][CurrentlySelected.MacroIndex][2];
    CurrentlySelected.Icon = self.db.global.Macros[CurrentlySelected.CategoryIndex][2][CurrentlySelected.MacroIndex][3];
    CurrentlySelected.Body = self.db.global.Macros[CurrentlySelected.CategoryIndex][2][CurrentlySelected.MacroIndex][4];
  end
  self.ExpandedTree[self.db.global.Macros[CategoryIndex][1]] = not self.ExpandedTree[self.db.global.Macros[CategoryIndex][1]];
  if ( self.CurrentMacro ~= 0 ) then  -- We had something selected (category or specific macro)
    if ( CurrentlySelected.MacroIndex > 0 ) then -- We had a specific macro selected
      self.CurrentMacro = self:FindMacroIndex(CurrentlySelected.Category, CurrentlySelected.Description, CurrentlySelected.Name, CurrentlySelected.Icon, CurrentlySelected.Body);
    else -- We had a category selected
      self.CurrentMacro = self:FindCategoryIndex(CurrentlySelected.CategoryIndex);
    end
  end
  self:DisplayMacro();
end
]=]

function Addon:CheckAutoLoad()
  local Found;
  local Categories = { "PrimaryTalentsChar", "PrimaryTalentsGlobal", "SecondaryTalentsChar", "SecondaryTalentsGlobal", "LoginGlobal", "LoginChar" };
  for CategoryKey, CategoryValue in pairs(Categories) do
    for CategoryIndex = #self.db.profile.Options.AutoLoad[CategoryValue], 1, -1 do
      Found = false;
      for Key, Value in pairs(self.db.global.Macros) do
        if ( Value[1] == self.db.profile.Options.AutoLoad[CategoryValue][CategoryIndex] ) then
          Found = true;
          break;
        end
      end
      if ( not Found ) then
        table.remove(self.db.profile.Options.AutoLoad[CategoryValue], CategoryIndex);
      end
    end
  end
  LibStub("AceConfigRegistry-3.0"):NotifyChange(L["MacroBank"]);
end

-- In case I want to save them all whenever I do something, instead of only when pressing enter
-- function Addon:SaveMacroTexts()
  -- self:SetMacroCategory(self.MainFrame.Macros.MacroCategory:GetText());
  -- self:SetMacroDescription(self.MainFrame.Macros.MacroDescription:GetText());
  -- self:SetMacroName(self.MainFrame.Macros.MacroName:GetText());
  -- self.MainFrame.Macros.MacroBody.Text:ClearFocus();  -- Save by clearing focus (the on focus clear will save it)
-- end

function Addon:ResetAnchor()
  self.db.profile.Options.Anchor.X = nil;
  self.db.profile.Options.Anchor.Y = nil;
  self:DisplayAtAnchor();
end

function Addon:DisplayAtAnchor()
  self.MainFrame:ClearAllPoints();
  if ( self.db.profile.Options.Anchor.X and self.db.profile.Options.Anchor.Y ) then
    local Scale = self.MainFrame:GetEffectiveScale();
    self.MainFrame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", self.db.profile.Options.Anchor.X / Scale, self.db.profile.Options.Anchor.Y / Scale);
  else
    self.MainFrame:SetPoint("TOPLEFT", MacroFrame, "TOPRIGHT", 0, -10);
  end
end

function Addon:CreateCheckBox()
  local Frame = CreateFrame("CheckButton");
  Frame:SetHeight(24);
  Frame:SetWidth(24);
  Frame:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up");
  Frame:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down");
  Frame:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight");
  Frame:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check");
  Frame.Text = Frame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall");
  Frame.Text:SetPoint("LEFT", Frame, "RIGHT", -2, 0);
  return Frame;
end

function Addon:MacroList_OnScroll()
  local LineNum, LineOffset;
  local NumEntries = self:GetNumDisplayedMacros();
  local NumScrollLines = 11;
  local LineHeight = 16;
  local CategoryIndex, MacroIndex, Expanded;
  FauxScrollFrame_Update(self.MainFrame.Macros.MacroList.ScrollFrame, NumEntries, NumScrollLines, LineHeight);
  for LineNum = 1, NumScrollLines do
    LineOffset = LineNum + FauxScrollFrame_GetOffset(self.MainFrame.Macros.MacroList.ScrollFrame);
    if ( LineOffset <= NumEntries) then
      CategoryIndex, MacroIndex, Expanded = self:GetMacroIndex(LineOffset);
      if ( MacroIndex == 0 ) then
        self.MainFrame.Macros.MacroList["ScrollLine"..LineNum].Text:SetText(self.db.global.Macros[CategoryIndex][1]);
        if ( Expanded ) then
          self.MainFrame.Macros.MacroList["ScrollLine"..LineNum].ExpandCollapse:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up");
          self.MainFrame.Macros.MacroList["ScrollLine"..LineNum].ExpandCollapse:SetPushedTexture("Interface\\Buttons\\UI-MinusButton-Down");
        else
          self.MainFrame.Macros.MacroList["ScrollLine"..LineNum].ExpandCollapse:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up");
          self.MainFrame.Macros.MacroList["ScrollLine"..LineNum].ExpandCollapse:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down");
        end
        self.MainFrame.Macros.MacroList["ScrollLine"..LineNum].ExpandCollapse:Show();
      else
        self.MainFrame.Macros.MacroList["ScrollLine"..LineNum].Text:SetText(self.db.global.Macros[CategoryIndex][2][MacroIndex][1]);
        self.MainFrame.Macros.MacroList["ScrollLine"..LineNum].ExpandCollapse:Hide();
      end -- MacroIndex == 0
      if ( LineOffset == self.CurrentMacro ) then
        self.MainFrame.Macros.MacroList["ScrollLine"..LineNum].Highlight:Show();
      else
        self.MainFrame.Macros.MacroList["ScrollLine"..LineNum].Highlight:Hide();
      end
      self.MainFrame.Macros.MacroList["ScrollLine"..LineNum]:Show();
    else
      self.MainFrame.Macros.MacroList["ScrollLine"..LineNum]:Hide();
    end -- LineNum <= NumEntries
  end
end

function Addon:IconChoice_OnScroll()
  local LineNum, LineOffset;
  local NumEntries = math.ceil(GetNumMacroIcons() / IconChoice.NumColumns);
  local NumScrollLines = IconChoice.NumLines;
  local LineHeight = 36;
  FauxScrollFrame_Update(self.MainFrame.Macros.IconChoice.ScrollFrame, NumEntries, NumScrollLines, LineHeight);
  for LineNum = 1, NumScrollLines do
    LineOffset = LineNum + FauxScrollFrame_GetOffset(self.MainFrame.Macros.IconChoice.ScrollFrame);
    if ( LineOffset <= NumEntries) then
      -- If Start of each line <= Icon Choice <= End of each line   ( LineOffset * 5 - 4 <= Choice <= LineOffset * 5)
      if ( LineOffset * IconChoice.NumColumns - (IconChoice.NumColumns - 1) <= self.MainFrame.Macros.IconChoice.Choice and self.MainFrame.Macros.IconChoice.Choice <= LineOffset * IconChoice.NumColumns ) then
        self.MainFrame.Macros.IconChoice["ScrollLine"..LineNum]:HighlightIcon(self.MainFrame.Macros.IconChoice.Choice - (LineOffset - 1) * IconChoice.NumColumns);
      else
        self.MainFrame.Macros.IconChoice["ScrollLine"..LineNum]:HighlightIcon(0);
      end
      for Index = 1, IconChoice.NumColumns do
        if ( (LineOffset - 1) * IconChoice.NumColumns + Index <= GetNumMacroIcons() ) then
          self.MainFrame.Macros.IconChoice["ScrollLine"..LineNum]["Icon"..Index].NormalTexture:SetTexture(GetMacroIconInfo((LineOffset - 1) * IconChoice.NumColumns + Index));
          self.MainFrame.Macros.IconChoice["ScrollLine"..LineNum]["Icon"..Index]:Show();
        else
          self.MainFrame.Macros.IconChoice["ScrollLine"..LineNum]["Icon"..Index]:Hide();
        end
      end
      self.MainFrame.Macros.IconChoice["ScrollLine"..LineNum]:Show();
    else
      self.MainFrame.Macros.IconChoice["ScrollLine"..LineNum]:Hide();
    end
  end
end

function Addon:CreateScrollLine()
  local Frame = CreateFrame("Button");
  Frame:SetHeight(16);
  Frame:SetWidth(160);
  Frame:SetScript("OnEnter", function() self:ShowTooltip(L["MacroScrollLine"], L["MacroScrollLineDesc"]) end);
  Frame:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame:SetScript("OnClick", function() self:SelectMacro(Frame.LineNum) end);
  
  Frame.Highlight = Frame:CreateTexture(nil, "BACKGROUND");
  Frame.Highlight:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight");
  Frame.Highlight:SetHeight(16);
  Frame.Highlight:SetWidth(170);
  Frame.Highlight:SetAllPoints(Frame);
  Frame.Highlight:SetBlendMode("ADD");
  Frame.Highlight:Hide();
  
  Frame.ExpandCollapse = CreateFrame("Button", nil, Frame);
  Frame.ExpandCollapse:SetHeight(16);
  Frame.ExpandCollapse:SetWidth(16);
  Frame.ExpandCollapse:SetPoint("TOPLEFT", Frame, "TOPLEFT");
  Frame.ExpandCollapse:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up");
  Frame.ExpandCollapse:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down");
  -- Frame.ExpandCollapse:SetScript("OnClick", function() self:ExpandCollapse_OnClick(Frame.LineNum) end);
  Frame.ExpandCollapse:SetScript("OnClick", function() self:SelectMacro(Frame.LineNum) end);
  
  Frame.Text = Frame:CreateFontString(nil, "BACKGROUND", "ChatFontNormal");
  Frame.Text:SetPoint("TOPLEFT", Frame.ExpandCollapse, "TOPRIGHT", 3, 0);
  Frame.Text:SetHeight(16);
  Frame.Text:SetWidth(Frame:GetWidth() - Frame.ExpandCollapse:GetWidth() - 3);
  Frame.Text:SetJustifyH("LEFT");
  
  return Frame;
end

function Addon:CreateEditBox()
  local Frame = CreateFrame("EditBox");
  Frame:SetAutoFocus(false);
  Frame:EnableMouse(true);
  Frame:SetMaxLetters(200);
  Frame:SetBackdrop({
    ["bgFile"] = "Interface\\Tooltips\\UI-Tooltip-Background",
    ["edgeFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
    ["tile"] = true,
    ["insets"] = {
      ["top"] = 5,
      ["bottom"] = 5,
      ["left"] = 5,
      ["right"] = 5,
    },
    ["tileSize"] = 32,
    ["edgeSize"] = 16,
  });
  Frame.Title = Frame:CreateFontString(nil, "BACKGROUND", "GameFontNormalSmall");
  Frame.Title:SetPoint("BOTTOMLEFT", Frame, "TOPLEFT", 3, 0);
  Frame:SetBackdropColor(0, 0, 0, 0.95);
  Frame:SetScript("OnEditFocusLost", function(frame) frame:HighlightText(0, 0) end);
  Frame:SetScript("OnEditFocusGained", function(frame) frame:HighlightText() end);
  Frame:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame:SetFontObject(ChatFontNormal);
  Frame:SetTextInsets(6, 6, 6, 6);
  return Frame;
end

function Addon:CreateMainFrame()
  local Frame = CreateFrame("Frame");
  Frame:SetWidth(341);
  Frame:SetHeight(457);
  Frame:SetBackdrop({
    ["bgFile"] = "Interface\\DialogFrame\\UI-DialogBox-Background",
    ["edgeFile"] = "Interface\\DialogFrame\\UI-DialogBox-Border",
    ["tile"] = true,
    ["insets"] = {
      ["top"] = 12,
      ["bottom"] = 11,
      ["left"] = 11,
      ["right"] = 12,
    },
    ["tileSize"] = 32,
    ["edgeSize"] = 32,
  });
  Frame:EnableMouse(true);
  Frame:SetMovable(true);
  Frame:SetScript("OnMouseDown", function() Frame:StartMoving() end);
  Frame:SetScript("OnMouseUp", function()
    Frame:StopMovingOrSizing()
    if ( self.db.profile.Options.Anchor.Remember ) then
      local s = Frame:GetEffectiveScale()
      self.db.profile.Options.Anchor.X = Frame:GetLeft() * s
      self.db.profile.Options.Anchor.Y = Frame:GetTop() * s
    end
  end);
  Frame:SetClampedToScreen(true);
  Frame:SetClampRectInsets(250, -250, -350, 350)
  Frame:Hide();
  
  Frame.HeaderTexture = Frame:CreateTexture(nil, "ARTWORK");
  Frame.HeaderTexture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header");
  Frame.HeaderTexture:SetWidth(256);
  Frame.HeaderTexture:SetHeight(64);
  Frame.HeaderTexture:SetPoint("TOP", Frame, "TOP", 0, 12);

  Frame.HeaderText = Frame:CreateFontString(nil, "ARTWORK", "GameFontNormal");
  Frame.HeaderText:SetPoint("TOP", Frame.HeaderTexture, "TOP", 0, -14);
  Frame.HeaderText:SetText(L["MacroBank"]);

  Frame.Macros = self:CreateMacrosFrame();
  Frame.Macros:SetParent(Frame);
  Frame.Macros:SetPoint("CENTER");
  Frame.Macros:Show();
  
  return Frame;
end

function Addon:CreateMacrosFrame()
  local Frame = CreateFrame("Frame");
  Frame:SetWidth(341);
  Frame:SetHeight(457);

  Frame.ToMacroBank = self:CreateToMacroBankFrame();
  Frame.ToMacroBank:SetParent(Frame);
  Frame.ToMacroBank:SetPoint("TOPLEFT", Frame, "TOPLEFT", 20, -62);

  Frame.FromMacroBank = self:CreateFromMacroBankFrame();
  Frame.FromMacroBank:SetParent(Frame);
  Frame.FromMacroBank:SetPoint("TOP", Frame.ToMacroBank, "BOTTOM", 0, -5);
  Frame.FromMacroBank:Hide();
  
  Frame.DeleteButton = CreateFrame("Button", nil, Frame, "UIPanelButtonTemplate");
  Frame.DeleteButton:SetPoint("TOP", Frame.FromMacroBank, "BOTTOM", 0, -10);
  Frame.DeleteButton:SetWidth(90);
  Frame.DeleteButton:SetHeight(22);
  Frame.DeleteButton:SetText(L["Delete"]);
  Frame.DeleteButton:SetScript("OnEnter", function() self:ShowTooltip(L["Delete"], L["DeleteDesc"]) end);
  Frame.DeleteButton:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame.DeleteButton:SetScript("OnClick", function()
    local CategoryIndex, MacroIndex, Expanded = self:GetMacroIndex(self.CurrentMacro);
    if ( self.CurrentMacro == 0 or MacroIndex == 0 ) then
      return;
    end
    local Dialog = StaticPopup_Show("MacroBankDeleteMacro", self.db.global.Macros[CategoryIndex][2][MacroIndex][1]);
    if ( Dialog ) then
      Dialog.MacroBankData = {
        ["CategoryIndex"] = CategoryIndex,
        ["MacroIndex"] = MacroIndex,
      }
    end
    -- self:DeleteMacro()
  end);
  Frame.DeleteButton:Hide();

  Frame.OptionsButton = CreateFrame("Button", nil, Frame, "UIPanelButtonTemplate");
  Frame.OptionsButton:SetPoint("BOTTOM", Frame.ToMacroBank, "TOP", 0, 5);
  Frame.OptionsButton:SetWidth(90);
  Frame.OptionsButton:SetHeight(22);
  Frame.OptionsButton:SetText(L["Options"]);
  Frame.OptionsButton:SetScript("OnEnter", function() self:ShowTooltip(L["Options"], L["OptionsDesc"]) end);
  Frame.OptionsButton:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame.OptionsButton:SetScript("OnClick", function()
    LibStub("AceConfigDialog-3.0"):Open(L["MacroBank"]);
  end);

  Frame.MacroList = self:CreateMacroList();
  Frame.MacroList:SetParent(Frame);
  Frame.MacroList:SetPoint("TOPRIGHT", Frame, "TOPRIGHT", -20, -62);
  
  Frame.SendToButton = CreateFrame("Button", nil, Frame, "UIPanelButtonTemplate");
  Frame.SendToButton:SetPoint("BOTTOM", Frame.MacroList, "TOP", 0, 5);
  Frame.SendToButton:SetWidth(90);
  Frame.SendToButton:SetHeight(22);
  Frame.SendToButton:SetText(L["SendTo"]);
  Frame.SendToButton:SetScript("OnEnter", function() self:ShowTooltip(L["SendTo"], L["Sends the currently selected macro to another user."]) end);
  Frame.SendToButton:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame.SendToButton:SetScript("OnClick", function()
    self.EasyMenu_Send[3].disabled = (GetNumPartyMembers() == 0)
    self.EasyMenu_Send[4].disabled = (not UnitInRaid("player"))
    self.EasyMenu_Send[5].disabled = (not IsInGuild())
    self.EasyMenu_Send[9].disabled = (GetNumPartyMembers() == 0)
    self.EasyMenu_Send[10].disabled = (not UnitInRaid("player"))
    self.EasyMenu_Send[11].disabled = (not IsInGuild())
    EasyMenu(self.EasyMenu_Send, self.DropDownFrame, "cursor", nil, nil, "MENU")
  end);
  Frame.SendToButton:Hide();

  Frame.MacroCategory = self:CreateEditBox();
  Frame.MacroCategory:SetParent(Frame);
  Frame.MacroCategory:SetWidth(120);
  Frame.MacroCategory:SetHeight(26);
  Frame.MacroCategory:SetPoint("TOPRIGHT", Frame, "TOP", -10, -260);
  Frame.MacroCategory.Title:SetText(L["Category"]);
  Frame.MacroCategory:SetScript("OnEnter", function() self:ShowTooltip(L["Category"], L["CategoryDesc"]) end);
  Frame.MacroCategory:SetScript("OnEnterPressed", function(frame) self:SetMacroCategory(frame:GetText()) frame:ClearFocus() end);
  Frame.MacroCategory:SetScript("OnEscapePressed", function(frame) frame:ClearFocus() self:DisplayMacro() end);

  Frame.MacroDescription = self:CreateEditBox();
  Frame.MacroDescription:SetParent(Frame);
  Frame.MacroDescription:SetWidth(120);
  Frame.MacroDescription:SetHeight(26);
  Frame.MacroDescription:SetPoint("TOPLEFT", Frame, "TOP", 10, -260);
  Frame.MacroDescription.Title:SetText(L["Description"]);
  Frame.MacroDescription:SetScript("OnEnter", function() self:ShowTooltip(L["Description"], L["DescriptionDesc"]) end);
  Frame.MacroDescription:SetScript("OnEnterPressed", function(frame) self:SetMacroDescription(frame:GetText()) frame:ClearFocus() end);
  Frame.MacroDescription:SetScript("OnEscapePressed", function(frame) frame:ClearFocus() self:DisplayMacro() end);

  Frame.MacroName = self:CreateEditBox();
  Frame.MacroName:SetParent(Frame);
  Frame.MacroName:SetWidth(160);
  Frame.MacroName:SetHeight(26);
  Frame.MacroName:SetPoint("TOPLEFT", Frame.MacroCategory, "BOTTOMLEFT", 0, -15);
  Frame.MacroName.Title:SetText(L["Name"]);
  Frame.MacroName:SetScript("OnEnter", function() self:ShowTooltip(L["Name"], L["NameDesc"]) end);
  Frame.MacroName:SetScript("OnEnterPressed", function(frame) self:SetMacroName(frame:GetText()) frame:ClearFocus() end);
  Frame.MacroName:SetScript("OnEscapePressed", function(frame) frame:ClearFocus() self:DisplayMacro() end);
  Frame.MacroName:SetMaxLetters(16);
  
  Frame.MacroIcon = self:CreateIconButton();
  Frame.MacroIcon:SetParent(Frame);
  Frame.MacroIcon:SetPoint("BOTTOMLEFT", Frame.MacroName, "BOTTOMRIGHT", 10, 0);
  Frame.MacroIcon:SetScript("OnClick", function()
    self.MainFrame.Macros.MacroBody.Text:ClearFocus()  -- Save current body text.
    Frame.IconChoice:Show()
  end);
  Frame.MacroIcon:SetScript("OnEnter", function(frame)
    frame.HighlightTexture:Show()
    self:ShowTooltip(L["Icon"], L["IconDesc"])
  end);
  Frame.MacroIcon:SetScript("OnLeave", function(frame)
    frame.HighlightTexture:Hide()
    GameTooltip:Hide()
  end);
  
  Frame.IconChoice = self:CreateIconChoiceFrame();
  Frame.IconChoice:SetParent(Frame);

  Frame.MacroBody = self:CreateMacroBody();
  Frame.MacroBody:SetParent(Frame);
  Frame.MacroBody:SetPoint("BOTTOM", Frame, "BOTTOM", 0, 25);
  return Frame;
end

function Addon:CreateToMacroBankFrame()
  local Frame = CreateFrame("Frame");
  Frame:SetHeight(73);
  Frame:SetWidth(100);
  Frame:SetBackdrop({
    ["bgFile"] = "Interface\\DialogFrame\\UI-DialogBox-Background",
    ["edgeFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
    ["tile"] = true,
    ["insets"] = {
      ["top"] = 5,
      ["bottom"] = 5,
      ["left"] = 5,
      ["right"] = 5,
    },
    ["tileSize"] = 32,
    ["edgeSize"] = 16,
  });

  Frame.ToLabel = Frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
  Frame.ToLabel:SetPoint("TOP", Frame, "TOP", 0, -3);
  Frame.ToLabel:SetText(L["ToMacroBank"]);
  
  Frame.CreateButton = CreateFrame("Button", nil, Frame, "UIPanelButtonTemplate");
  Frame.CreateButton:SetPoint("TOP", Frame.ToLabel, "BOTTOM", 0, -2);
  Frame.CreateButton:SetWidth(90);
  Frame.CreateButton:SetHeight(22);
  Frame.CreateButton:SetText(L["Create"]);
  Frame.CreateButton:SetScript("OnEnter", function() self:ShowTooltip(L["Create"], L["CreateDesc"]) end);
  Frame.CreateButton:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame.CreateButton:SetScript("OnClick", function()
    local Category
    if ( self.CurrentMacro > 0 ) then
      local CategoryIndex, MacroIndex, Expanded = self:GetMacroIndex(self.CurrentMacro)
      Category = self.db.global.Macros[CategoryIndex][1]
    else
      Category = self.db.profile.Options.NewCategory
    end
    self:CreateMacro(Category, self.db.profile.Options.NewDescription, self.db.profile.Options.NewName, GetMacroIconInfo(1), "")
  end);

  Frame.SaveButton = CreateFrame("Button", nil, Frame, "UIPanelButtonTemplate");
  Frame.SaveButton:SetPoint("TOP", Frame.CreateButton, "BOTTOM", 0, -5);
  Frame.SaveButton:SetWidth(90);
  Frame.SaveButton:SetHeight(22);
  Frame.SaveButton:SetText(L["Save"]);
  Frame.SaveButton:SetScript("OnEnter", function() self:ShowTooltip(L["Save"], L["SaveDesc"]) end);
  Frame.SaveButton:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame.SaveButton:SetScript("OnClick", function() self:Save_OnClick() end);
  return Frame;  
end

function Addon:CreateFromMacroBankFrame()
  local Frame = CreateFrame("Frame");
  Frame:SetHeight(73);
  Frame:SetWidth(100);
  Frame:SetBackdrop({
    ["bgFile"] = "Interface\\DialogFrame\\UI-DialogBox-Background",
    ["edgeFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
    ["tile"] = true,
    ["insets"] = {
      ["top"] = 5,
      ["bottom"] = 5,
      ["left"] = 5,
      ["right"] = 5,
    },
    ["tileSize"] = 32,
    ["edgeSize"] = 16,
  });

  Frame.FromLabel = Frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
  Frame.FromLabel:SetPoint("TOP", Frame, "TOP", 0, -3);
  Frame.FromLabel:SetText(L["FromMacroBank"]);

  Frame.LoadButton = CreateFrame("Button", nil, Frame, "UIPanelButtonTemplate");
  Frame.LoadButton:SetPoint("TOP", Frame.FromLabel, "BOTTOM", 0, -2);
  Frame.LoadButton:SetWidth(90);
  Frame.LoadButton:SetHeight(22);
  Frame.LoadButton:SetText(L["Load"]);
  Frame.LoadButton:SetScript("OnEnter", function() self:ShowTooltip(L["Load"], L["LoadDesc"]) end);
  Frame.LoadButton:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame.LoadButton:SetScript("OnClick", function() self:Load_OnClick() end);

  Frame.ReplaceButton = CreateFrame("Button", nil, Frame, "UIPanelButtonTemplate");
  Frame.ReplaceButton:SetPoint("TOP", Frame.LoadButton, "BOTTOM", 0, -5);
  Frame.ReplaceButton:SetWidth(90);
  Frame.ReplaceButton:SetHeight(22);
  Frame.ReplaceButton:SetText(L["Replace"]);
  Frame.ReplaceButton:SetScript("OnEnter", function() self:ShowTooltip(L["Replace"], L["ReplaceDesc"]) end);
  Frame.ReplaceButton:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame.ReplaceButton:SetScript("OnClick", function() self:Load_OnClick(true) end);

  return Frame;
end
  
function Addon:CreateMacroList()
  local Frame = CreateFrame("Frame");
  Frame:SetHeight(186);
  Frame:SetWidth(192);
  Frame:SetBackdrop({
    ["bgFile"] = "Interface\\DialogFrame\\UI-DialogBox-Background",
    ["edgeFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
    ["tile"] = true,
    ["insets"] = {
      ["top"] = 5,
      ["bottom"] = 5,
      ["left"] = 5,
      ["right"] = 5,
    },
    ["tileSize"] = 32,
    ["edgeSize"] = 16,
  });
  Frame.ScrollFrame = CreateFrame("ScrollFrame", "MacroBank_MacroListScrollFrame", Frame, "FauxScrollFrameTemplate");
  Frame.ScrollFrame:SetPoint("TOPLEFT", Frame, "TOPLEFT", 5, -5);
  Frame.ScrollFrame:SetHeight(176);
  Frame.ScrollFrame:SetWidth(160);
  if ( select(4, GetBuildInfo()) < 30000 ) then
    Frame.ScrollFrame:SetScript("OnVerticalScroll", function() FauxScrollFrame_OnVerticalScroll(16, function() self:MacroList_OnScroll() end) end);
  else
    Frame.ScrollFrame:SetScript("OnVerticalScroll", function(frame, offset) FauxScrollFrame_OnVerticalScroll(frame, offset, 16, function() self:MacroList_OnScroll() end) end);
  end
  
  Frame.ScrollLine1 = self:CreateScrollLine();
  Frame.ScrollLine1:SetParent(Frame);
  Frame.ScrollLine1:SetPoint("TOPLEFT", Frame.ScrollFrame, "TOPLEFT", 0, 0);
  Frame.ScrollLine1.LineNum = 1;
  for Index = 2, 11 do
    Frame["ScrollLine"..Index] = self:CreateScrollLine();
    Frame["ScrollLine"..Index]:SetParent(Frame);
    Frame["ScrollLine"..Index]:SetPoint("TOPLEFT", Frame["ScrollLine"..(Index - 1)], "BOTTOMLEFT", 0, 0);
    Frame["ScrollLine"..Index].LineNum = Index;
  end
  return Frame;
end

function Addon:CreateMacroBody()
  local Frame = CreateFrame("Frame");
  Frame:SetHeight(95);
  Frame:SetWidth(319);
  Frame:SetBackdrop({
    ["bgFile"] = "Interface\\DialogFrame\\UI-DialogBox-Background",
    ["edgeFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
    ["tile"] = true,
    ["insets"] = {
      ["top"] = 5,
      ["bottom"] = 5,
      ["left"] = 5,
      ["right"] = 5,
    },
    ["tileSize"] = 32,
    ["edgeSize"] = 16,
  });
  
  Frame.ScrollFrame = CreateFrame("ScrollFrame", "MacroBank_MacroBodyScrollFrame", Frame, "UIPanelScrollFrameTemplate");
  Frame.ScrollFrame:SetHeight(85);
  Frame.ScrollFrame:SetWidth(286);  -- WowUI was 286
  Frame.ScrollFrame:SetPoint("TOPLEFT", Frame, "TOPLEFT", 7, -5);

  Frame.Text = CreateFrame("EditBox", nil, Frame.ScrollFrame);
  Frame.Text:SetHeight(85);
  Frame.Text:SetWidth(286);  -- WowUI was 286
  Frame.Text:SetAllPoints(Frame.ScrollFrame);
  Frame.Text:SetMultiLine(true);
  Frame.Text:SetAutoFocus(false);
  Frame.Text:SetMaxLetters(255);  -- Can't use MACROFRAME_CHAR_LIMIT at creation, as the MacroUI hasn't loaded.
  Frame.Text:SetFontObject(GameFontHighlightSmall);
  Frame.Text:SetScript("OnEscapePressed", function(frame) frame:ClearFocus() end);
  Frame.Text:SetScript("OnEditFocusLost", function(frame) frame:HighlightText(0, 0) self:SetMacroBody(frame:GetText()) end);
  Frame.Text:SetScript("OnEnter", function() self:ShowTooltip(L["Macro"], L["MacroDesc"]) end);
  Frame.Text:SetScript("OnLeave", function() GameTooltip:Hide() end);
  
  if ( select(4, GetBuildInfo()) < 30000 ) then
    Frame.Text:SetScript("OnTextChanged", function(frame)
      Frame.CharLimitText:SetFormattedText(MACROFRAME_CHAR_LIMIT, frame:GetNumLetters())
      local ScrollBar = _G[frame:GetParent():GetName().."ScrollBar"]
      local Min, Max = ScrollBar:GetMinMaxValues()
      if ( Max > 0 and frame.max ~= Max ) then
        frame.max = Max
        ScrollBar:SetValue(Max)
      end
    end);
    Frame.Text:SetScript("OnCursorChanged", function() ScrollingEdit_OnCursorChanged(arg1, arg2, arg3, arg4) end);
    Frame.Text:SetScript("OnUpdate", function() ScrollingEdit_OnUpdate(Frame.ScrollFrame) end);
  else
    Frame.Text:SetScript("OnTextChanged", function(frame)
      Frame.CharLimitText:SetFormattedText(MACROFRAME_CHAR_LIMIT, frame:GetNumLetters())
      ScrollingEdit_OnTextChanged(frame, frame:GetParent())
    end);
    Frame.Text:SetScript("OnCursorChanged", function(frame, x, y, w, h) ScrollingEdit_OnCursorChanged(frame, x, y, w, h) end);
    Frame.Text:SetScript("OnUpdate", function(frame, elapsed) ScrollingEdit_OnUpdate(frame, elapsed, frame:GetParent()) end);
  end
  Frame.ScrollFrame:SetScrollChild(Frame.Text);

  Frame.FocusButton = CreateFrame("Button", nil, Frame);
  Frame.FocusButton:SetAllPoints(Frame.ScrollFrame);
  Frame.FocusButton:SetScript("OnClick", function() Frame.Text:SetFocus() end);
  Frame.FocusButton:SetScript("OnEnter", function() self:ShowTooltip(L["Macro"], L["MacroDesc"]) end);
  Frame.FocusButton:SetScript("OnLeave", function() GameTooltip:Hide() end);
  
  Frame.CharLimitText = Frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
  Frame.CharLimitText:SetPoint("TOP", Frame, "BOTTOM", 0, -3);
  
  return Frame;
end

function Addon:CreateIconButton()
  local Frame = CreateFrame("Button");
  Frame:SetHeight(36);
  Frame:SetWidth(36);
  Frame:SetScript("OnEnter", function() Frame.HighlightTexture:Show() end);
  Frame:SetScript("OnLeave", function() Frame.HighlightTexture:Hide() end);
  
  Frame.BackgroundTexture = Frame:CreateTexture(nil, "BACKGROUND");
  Frame.BackgroundTexture:SetTexture("Interface\\Buttons\\UI-EmptySlot-Disabled");
  Frame.BackgroundTexture:SetWidth(64);
  Frame.BackgroundTexture:SetHeight(64);
  Frame.BackgroundTexture:SetPoint("CENTER", Frame, "CENTER", 0, -1);

  Frame.NormalTexture = Frame:CreateTexture(nil, "ARTWORK");
  Frame.NormalTexture:SetWidth(36);
  Frame.NormalTexture:SetHeight(36);
  Frame.NormalTexture:SetPoint("CENTER", Frame, "CENTER", 0, 0);

  Frame.HighlightTexture = Frame:CreateTexture(nil, "HIGHLIGHT");
  Frame.HighlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square");
  Frame.HighlightTexture:SetWidth(36);
  Frame.HighlightTexture:SetHeight(36);
  Frame.HighlightTexture:SetPoint("CENTER", Frame, "CENTER", 0, 0);
  Frame.HighlightTexture:SetBlendMode("ADD");
  Frame.HighlightTexture:Hide();
  
  Frame.SelectedTexture = Frame:CreateTexture(nil, "OVERLAY");
  Frame.SelectedTexture:SetTexture("Interface\\Buttons\\CheckButtonHilight");
  Frame.SelectedTexture:SetWidth(36);
  Frame.SelectedTexture:SetHeight(36);
  Frame.SelectedTexture:SetPoint("CENTER", Frame, "CENTER", 0, 0);
  Frame.SelectedTexture:SetBlendMode("ADD");
  Frame.SelectedTexture:Hide();
  
  return Frame;
end

local function HighlightIcon(Frame, IconNum, Hide)
  Frame.SelectedIcon = IconNum;
  for Index = 1, IconChoice.NumColumns do
    if ( Index == IconNum ) then
      Frame["Icon"..Index].SelectedTexture:Show()
    else
      Frame["Icon"..Index].SelectedTexture:Hide()
    end
  end
end

function Addon:CreateIconChoiceScrollLine()
  local Frame = CreateFrame("Frame");
  local Spacing = 8;
  Frame:SetHeight(36);
  Frame:SetWidth(36 * IconChoice.NumColumns + Spacing * (IconChoice.NumColumns - 1));

  Frame.Icon1 = self:CreateIconButton();
  Frame.Icon1:SetParent(Frame);
  Frame.Icon1:SetPoint("TOPLEFT", Frame, "TOPLEFT", 0, 0);
  Frame.Icon1:SetScript("OnClick", function() Frame:GetParent():SetChoice(Frame.LineNum, 1) end);
  for Index = 2, IconChoice.NumColumns do
    Frame["Icon"..Index] = self:CreateIconButton();
    Frame["Icon"..Index]:SetParent(Frame);
    Frame["Icon"..Index]:SetPoint("TOPLEFT", Frame["Icon"..(Index - 1)], "TOPRIGHT", Spacing, 0);
    Frame["Icon"..Index]:SetScript("OnClick", function() Frame:GetParent():SetChoice(Frame.LineNum, Index) end);
  end
  
  Frame.HighlightIcon = HighlightIcon;
  Frame.SelectedIcon = 0;
  return Frame;
end

local function SetChoice(Frame, Line, Icon)
  local OldLineNum = math.ceil(Frame.Choice / IconChoice.NumColumns) - FauxScrollFrame_GetOffset(Frame.ScrollFrame);
  if ( 1 <= OldLineNum and OldLineNum <= IconChoice.NumLines ) then
    Frame["ScrollLine"..OldLineNum]:HighlightIcon(0);
  end  
  local LineOffset = Line + FauxScrollFrame_GetOffset(Frame.ScrollFrame);
  Frame.Choice = (LineOffset - 1) * IconChoice.NumColumns + Icon;
  Frame["ScrollLine"..Line]:HighlightIcon(Icon);
end

function Addon:CreateIconChoiceFrame()
  local Frame = CreateFrame("Frame");
  Frame:SetPoint("CENTER", UIParent, "CENTER");
  Frame:SetHeight(36 * IconChoice.NumLines + 8 * (IconChoice.NumLines - 1) + 62);  -- 230 with 4 lines
  Frame:SetWidth(36 * IconChoice.NumColumns + 8 * (IconChoice.NumColumns - 1) + 58);  -- 270 with 5 columns
  Frame:SetToplevel(true);
  Frame:SetFrameStrata("DIALOG");
  Frame:EnableMouse(true);
  Frame:SetBackdrop({
    ["bgFile"] = "Interface\\DialogFrame\\UI-DialogBox-Background",
    ["edgeFile"] = "Interface\\DialogFrame\\UI-DialogBox-Border",
    ["tile"] = true,
    ["insets"] = {
      ["top"] = 12,
      ["bottom"] = 11,
      ["left"] = 11,
      ["right"] = 12,
    },
    ["tileSize"] = 32,
    ["edgeSize"] = 32,
  });
  Frame:SetScript("OnShow", function()
    local CategoryIndex, MacroIndex, Expanded = self:GetMacroIndex(self.CurrentMacro)
    Frame.Choice = self.db.global.Macros[CategoryIndex][2][MacroIndex][3]
    -- Convert to Icon#
    Frame.Choice = self.IconToIndex[Frame.Choice] or self.IconToIndex[string.gsub(Frame.Choice, "%.blp", "")] or 1
    local NumEntries = math.ceil(GetNumMacroIcons() / IconChoice.NumColumns)
    local NumScrollLines = IconChoice.NumLines
    local LineHeight = 36
    FauxScrollFrame_Update(Frame.ScrollFrame, NumEntries, NumScrollLines, LineHeight)
    local Offset = math.ceil(Frame.Choice / IconChoice.NumColumns) - 1 -- with 1044 entries, # Offsets is 0-205  (1044/5 = 208.8)
    _G[Frame.ScrollFrame:GetName().."ScrollBar"]:SetValue(Offset * LineHeight) -- Triggers OnVerticalScroll only if the value changes, so need to call OnScroll
    self:IconChoice_OnScroll()
  end);
  Frame:Hide();
  
  Frame.ScrollFrame = CreateFrame("ScrollFrame", "MacroBank_IconChoiceScrollFrame", Frame, "FauxScrollFrameTemplate");
  Frame.ScrollFrame:SetPoint("TOPLEFT", Frame, "TOPLEFT", 18, -18);
  Frame.ScrollFrame:SetHeight(36 * IconChoice.NumLines + 8 * (IconChoice.NumLines - 1));  -- 168 with 4 lines
  Frame.ScrollFrame:SetWidth(36 * IconChoice.NumColumns + 8 * (IconChoice.NumColumns - 1));  -- 212 with 5 columns
  if ( select(4, GetBuildInfo()) < 30000 ) then
    Frame.ScrollFrame:SetScript("OnVerticalScroll", function() FauxScrollFrame_OnVerticalScroll(36, function() self:IconChoice_OnScroll() end) end);
  else
    Frame.ScrollFrame:SetScript("OnVerticalScroll", function(frame, offset) FauxScrollFrame_OnVerticalScroll(frame, offset, 36, function() self:IconChoice_OnScroll() end) end);
  end
  
  Frame.ScrollLine1 = self:CreateIconChoiceScrollLine();
  Frame.ScrollLine1:SetParent(Frame);
  Frame.ScrollLine1:SetPoint("TOPLEFT", Frame.ScrollFrame, "TOPLEFT", 0, 0);
  Frame.ScrollLine1.LineNum = 1;
  for Index = 2, IconChoice.NumLines do
    Frame["ScrollLine"..Index] = self:CreateIconChoiceScrollLine();
    Frame["ScrollLine"..Index]:SetParent(Frame);
    Frame["ScrollLine"..Index]:SetPoint("TOPLEFT", Frame["ScrollLine"..(Index - 1)], "BOTTOMLEFT", 0, -7);
    Frame["ScrollLine"..Index].LineNum = Index;
  end
  
  Frame.AcceptButton = CreateFrame("Button", nil, Frame, "GameMenuButtonTemplate");
  Frame.AcceptButton:SetWidth(60);
  Frame.AcceptButton:SetHeight(21);
  Frame.AcceptButton:SetPoint("BOTTOMRIGHT", Frame, "BOTTOM", -10, 10);
  Frame.AcceptButton:SetScript("OnClick", function()
    self:SetMacroIcon(Frame.Choice)
    Frame:Hide();
    self:DisplayMacro();
  end);
  Frame.AcceptButton:SetScript("OnEnter", function() self:ShowTooltip(L["AcceptIcon"], L["AcceptIconDesc"]) end);
  Frame.AcceptButton:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame.AcceptButton:SetText(L["AcceptIcon"]);
  
  Frame.CancelButton = CreateFrame("Button", nil, Frame, "GameMenuButtonTemplate");
  Frame.CancelButton:SetWidth(60);
  Frame.CancelButton:SetHeight(21);
  Frame.CancelButton:SetPoint("BOTTOMLEFT", Frame, "BOTTOM", 10, 10);
  Frame.CancelButton:SetScript("OnClick", function() Frame:Hide() end);
  Frame.CancelButton:SetScript("OnEnter", function() self:ShowTooltip(CANCEL, L["CancelDesc"]) end);
  Frame.CancelButton:SetScript("OnLeave", function() GameTooltip:Hide() end);
  Frame.CancelButton:SetText(CANCEL);

  Frame.SetChoice = SetChoice;
  return Frame;
end

function Addon:UpgradeDatabase()
  if ( not MacroBankDB.DBVersion ) then -- Version 1
    if ( self.db.profile.Macros ) then
      for CategoryKey, CategoryValue in pairs(self.db.profile.Macros) do
        for MacroKey, MacroValue in pairs(CategoryValue[2]) do
          if ( MacroValue[3] ) then
            MacroValue[3] = GetMacroIconInfo(MacroValue[3]);
          end
        end
      end
    end
    MacroBankDB.DBVersion = 2;
  end
  if ( MacroBankDB.DBVersion == 2 ) then
    if ( self.db.profile.AutoLoad ) then
      self.db.profile.Options.AutoLoad = self.db.profile.AutoLoad;
      self.db.profile.AutoLoad = nil;
    end
    if ( self.db.profile.Macros ) then
      self.db.global.Macros = self.db.profile.Macros;
      self.db.profile.Macros = nil;
    end
    MacroBankDB.DBVersion = 3;
  end
end

--[[
  MoveAnything! by Wagthaa @ Earthen Ring EU

  Earlier versions were developed by:
		MoveAnything! V.2.66 by Vincent
		MoveAnything! vJ.11000.2 by Jason
		MA! 1.12 by Skrag
]]

local function Error( msg )
	maPrint( msg ) --, 1.0, 0.2, 0.2
end

local function void() end

-- X: http://lua-users.org/wiki/CopyTable
local function tdeepcopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end

local function tcopy(object)
	if type(object) ~= "table" then
		return object
	end
	local new_table = {}
	for index, value in pairs(object) do
		new_table[index] = value
	end
	return setmetatable(new_table, getmetatable(object))
end

local function dbg(s)
	maPrint(s)
end

function numfor(n)
	return string.format("%.2f", n)
end

MADB = {}

MovAny = {
	guiLines = -1,
	resetConfirm = "",

	bagFrames = {},
	cats = {},
	createBeforeMove = {
		AchievementAlertFrame1 = "AchievementAlertFrameTemplate",
		AchievementAlertFrame2 = "AchievementAlertFrameTemplate",
		GroupLootFrame1 = "GroupLootFrameTemplate",
		GroupLootFrame2 = "GroupLootFrameTemplate",
		GroupLootFrame3 = "GroupLootFrameTemplate",
		GroupLootFrame4 = "GroupLootFrameTemplate",
	},
	customCat = nil,
	runOnceBeforeMove = {
		AchievementAlertFrame1 = AchievementFrame_LoadUI,
		AchievementAlertFrame2 = AchievementFrame_LoadUI,
		--[[
		AuctionFrame = AuctionFrame_LoadUI,
		BattlefieldMinimap = BattlefieldMinimap_LoadUI,
		BarberShopFrame = function() BarberShopFrame_LoadUI() ShowUIPanel(BarberShopFrame) HideUIPanel(BarberShopFrame) end,
		CalendarFrame = Calendar_LoadUI,
		ClassTrainerFrame = ClassTrainerFrame_LoadUI,
		GMSurveyFrame = GMSurveyFrame_LoadUI,
		GuildBankFrame = GuildBankFrame_LoadUI,
		InspectFrame = InspectFrame_LoadUI,
		PlayerTalentFrame = TalentFrame_LoadUI,
		MacroFrame = MacroFrame_LoadUI,
		TradeSkillFrame = TradeSkillFrame_LoadUI,
		TimeManagerClockButton = TimeManager_LoadUI,
		]]
	},
	runBeforeInteract = {
		MainMenuBar = function ()
			if not MovAny.FrameOptions[ "VehicleMenuBar" ] then
				local v = _G["VehicleMenuBar"]
				v:ClearAllPoints()
				v:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", UIParent:GetWidth()/2 - v:GetWidth()/2, 0)
			end
		end,
		MultiBarLeft = function( this )
			if MovAny:IsFrameHooked( "MultiBarLeftHorizontalMover" ) then
				MovAny:ResetFrame("MultiBarLeftHorizontalMover")
			end
		end,
		MultiBarRight = function( this )
			if MovAny:IsFrameHooked( "MultiBarRightHorizontalMover" ) then
				MovAny:ResetFrame("MultiBarRightHorizontalMover")
			end
		end,
	},

	defFrames = {},
	frameListSize = 16,
	frames = {},
	framesCount = 0,
	framesIdx = {},
	framesUnsupported = {},
	initRun = false,
	lastFrameName = nil,
	lEnableMouse = {
		WatchFrame,
		DurabilityFrame,
		CastingBarFrame,
		ReputationWatchBar,
		WorldStateScoreFrame,
		WorldStateAlwaysUpFrame,
		AlwaysUpFrame1,
		AlwaysUpFrame2,
		WorldStateCaptureBar1,
		VehicleMenuBar,
		TargetFrameSpellBar,
	},
	lSimpleHide = {
	},
	lTranslate = {
		minimap = "MinimapCluster",
		tooltip = "TooltipMover",
		player = "PlayerFrame",
		target = "TargetFrame",
		tot = "TargetFrameToT",
		targetoftarget = "TargetFrameToT",
		pet = "PetFrame",
		focus = "FocusFrame",
		bags = "BagButtonsMover",
		keyring = "KeyRingFrame",
		GameTooltip = "TooltipMover",
		ShapeshiftBarFrame = "ShapeshiftButtonsMover",
	},
	lTranslateSec = {
		PVPFrame = "PVPParentFrame",
	},
	lHideOnScale = {
		["MainMenuExpBar"] = {
			MainMenuXPBarTexture0,
			MainMenuXPBarTexture1,
			MainMenuXPBarTexture2,
			MainMenuXPBarTexture3,
			ExhaustionTick,
			ExhaustionTickNormal,
			ExhaustionTickHighlight,
			ExhaustionLevelFillBar,
		},
		["ReputationWatchBar"] = {
			ReputationWatchBarTexture0,
			ReputationWatchBarTexture1,
			ReputationWatchBarTexture2,
			ReputationWatchBarTexture3,
			ReputationXPBarTexture0,
			ReputationXPBarTexture1,
			ReputationXPBarTexture2,
			ReputationXPBarTexture3,
		},
	},
	lFrameSymLink = {
	},
	lLinkedScaling = {
		["BasicActionButtonsMover"] = {
			ActionBarDownButton = "ActionBarDownButton",
			ActionBarUpButton = "ActionBarUpButton",
		},
		["ReputationWatchBar"] = {
			ReputationWatchStatusBar = "ReputationWatchStatusBar",
		},
	},
	nextFrameIdx = 1,
	pendingFrames = {},
	MOVEATONETIME = 20,
	SCROLL_HEIGHT = 20,
	currentMover = 1,
	NoScale = {
		FramerateMover = "FramerateMover",
		WorldStateAlwaysUpFrame = "WorldStateAlwaysUpFrame",
		MainMenuBarArtFrame = "MainMenuBarArtFrame",

		MainMenuBarLeftEndCap = "MainMenuBarLeftEndCap",
		MainMenuBarRightEndCap = "MainMenuBarRightEndCap",
		MainMenuBarMaxLevelBar = "MainMenuBarMaxLevelBar",
	},
	ScaleWH = {
		MainMenuExpBar = "MainMenuExpBar",
		ReputationWatchBar = "ReputationWatchBar",
		ReputationWatchStatusBar = "ReputationWatchStatusBar",
	},
	DetachFromParent = {
		MainMenuBarPerformanceBarFrame = "MainMenuBarPerformanceBarFrame",
		TargetofFocusFrame = "TargetofFocusFrame",
		PetFrame = "PetFrame",
		PartyMemberFrame1PetFrame = "PartyMemberFrame1PetFrame",
		PartyMemberFrame2PetFrame = "PartyMemberFrame2PetFrame",
		PartyMemberFrame3PetFrame = "PartyMemberFrame3PetFrame",
		PartyMemberFrame4PetFrame = "PartyMemberFrame4PetFrame",
		DebuffButton1 = "DebuffButton1",
		ReputationWatchBar = "ReputationWatchBar",
		MainMenuExpBar = "MainMenuExpBar",
		TimeManagerClockButton = "TimeManagerClockButton",
		VehicleMenuBarHealthBar = "VehicleMenuBarHealthBar",
		VehicleMenuBarLeaveButton = "VehicleMenuBarLeaveButton",
		VehicleMenuBarPowerBar = "VehicleMenuBarPowerBar",
		ContainerFrame1 = "ContainerFrame1",
		MultiCastActionBarFrame = "MultiCastActionBarFrame",
		MainMenuBarRightEndCap = "MainMenuBarRightEndCap",
		MainMenuBarMaxLevelBar = "MainMenuBarMaxLevelBar",
		TargetFrameSpellBar = "TargetFrameSpellBar",
	},
	NoHide = {},
	HideList = {
		VehicleMenuBar = {
			{ "VehicleMenuBar", "ARTWORK","BACKGROUND","BORDER","OVERLAY"},
			{ "VehicleMenuBarArtFrame", "ARTWORK","BACKGROUND","BORDER","OVERLAY"},
			{ "VehicleMenuBarActionButtonFrame", "ARTWORK","BACKGROUND","BORDER","OVERLAY"},
		},
		MAOptions = {
			{ "MAOptions", "ARTWORK","BORDER"},
		},
		GameMenuFrame = {
			{ "GameMenuFrame", "BACKGROUND","ARTWORK","BORDER"},
		},
		MainMenuBar = {
			{ "MainMenuBarArtFrame", "BACKGROUND","ARTWORK"},
			{ "PetActionBarFrame", "OVERLAY"},
			{ "ShapeshiftBarFrame", "OVERLAY"},
			{ "MainMenuBar", "DISABLEMOUSE"},
			{ "BonusActionBarFrame", "OVERLAY", "DISABLEMOUSE"},
		},
		MainMenuExpBar = {
			{ "MainMenuExpBar", "WH", "BORDER", "OVERLAY"},
			{ "ExhaustionTick", "FRAME"},
			{ "MainMenuBarMaxLevelBar", "FRAME"},
			{ "MainMenuExpBar", function( show )
					if not InCombatLockdown() then
						if show then
							MovAny:UnlockVisibility( MainMenuExpBar.TextString )
						else
							MovAny:LockVisibility( MainMenuExpBar.TextString )
						end
					end
				end
			},
		},
	},
	HideUsingWH = {
		MainMenuExpBar = "MainMenuExpBar",
		ReputationWatchBar = "ReputationWatchBar",
	},
	MoveOnlyWhenVisible = {
		WorldStateCaptureBar1 = "WorldStateCaptureBar1",
		AlwaysUpFrame1 = "AlwaysUpFrame1",
		AlwaysUpFrame2 = "AlwaysUpFrame2",
		VehicleMenuBarHealthBar = "VehicleMenuBarHealthBar",
		VehicleMenuBarPowerBar = "VehicleMenuBarPowerBar"
	},
	NoMove = {
		MinimapBorderTop = "MinimapBorderTop",
		MainMenuBarPageNumber = "MainMenuBarPageNumber",
		PVPFrame = "PVPFrame",
	},
	DefaultFrameList = {
		{ "", "Achievements" },
		{ "AchievementFrame", "Achievements" },
		{ "AchievementAlertFrame1", "Achievement Alert 1" },
		{ "AchievementAlertFrame2", "Achievement Alert 2" },
		{ "WatchFrame", "Tracker" },
		{ "QuestLogFrame", "Quest Log" },
		{ "QuestLogDetailFrame", "Quest Details" },
		{ "QuestTimerFrame", "Quest Timer" },

		{ "", "Action Bars" },
		{ "BasicActionButtonsMover", "Action Bar" },
		{ "BasicActionButtonsVerticalMover", "Action Bar - Vertical" },
		{ "MainMenuBarPageNumber", "Action Bar Page Number" },
		{ "ActionBarUpButton", "Action Bar Page Up" },
		{ "ActionBarDownButton", "Action Bar Page Down" },
		{ "PetActionButtonsMover", "Pet Action Bar" },
		{ "PetActionButtonsVerticalMover", "Pet Action Bar - Vertical" },
		{ "ShapeshiftButtonsMover", "Stance / Aura / Shapeshift Buttons" },
		{ "ShapeshiftButtonsVerticalMover", "Stance / Aura / Shapeshift - Vertical" },
		{ "MultiBarBottomLeft", "Bottom Left Action Bar" },
		{ "MultiBarBottomRight", "Bottom Right Action Bar" },
		{ "MultiBarRight", "Right Action Bar" },
		{ "MultiBarRightHorizontalMover", "Right Action Bar (Horizontal)" },
		{ "MultiBarLeft", "Right Action Bar 2" },
		{ "MultiBarLeftHorizontalMover", "Right Action Bar 2 (Horizontal)" },
		{ "MultiCastActionBarFrame", "Shaman Totem Bar" },

		{ "", "Arena, Battlegrounds & PvP" },
		{ "PVPParentFrame", "PVP Window" },
		{ "ArenaEnemyFrame1", "Arena Enemy 1" },
		{ "ArenaEnemyFrame2", "Arena Enemy 2" },
		{ "ArenaEnemyFrame3", "Arena Enemy 3" },
		{ "ArenaEnemyFrame4", "Arena Enemy 4" },
		{ "ArenaEnemyFrame5", "Arena Enemy 5" },
		{ "PVPTeamDetails", "Arena Team Details" },
		{ "ArenaFrame", "Arena Queue List" },
		{ "ArenaRegistrarFrame", "Arena Registrar" },
		{ "PVPBannerFrame", "Arena Banner" },
		{ "BattlefieldMinimap", "Battlefield Minimap" },
		{ "BattlefieldFrame", "Battleground Queue" },
		{ "WorldStateScoreFrame", "Battleground Score" },
		{ "WorldStateAlwaysUpFrame", "Flags Frame" },
		{ "AlwaysUpFrame1", "Alliance Flag" },
		{ "AlwaysUpFrame2", "Horde Flag" },
		{ "WorldStateCaptureBar1", "Flag Capture Timer Bar" },

		{ "", "Bags" },
		{ "BagButtonsMover", "Bag Buttons" },
		{ "BagButtonsVerticalMover", "Bag Buttons - Vertical" },
		{ "BagFrame1", "Backpack" },
		{ "BagFrame2", "Bag 1" },
		{ "BagFrame3", "Bag 2" },
		{ "BagFrame4", "Bag 3" },
		{ "BagFrame5", "Bag 4" },
		{ "KeyRingFrame", "Key Ring" },
		{ "CharacterBag0Slot", "Bag Button 1" },
		{ "CharacterBag1Slot", "Bag Button 2" },
		{ "CharacterBag2Slot", "Bag Button 3" },
		{ "CharacterBag3Slot", "Bag Button 4" },
		{ "KeyRingButton", "Key Ring Button" },

		{ "", "Bank" },
		{ "BankFrame", "Bank" },
		{ "BankBagFrame1", "Bank Bag 1" },
		{ "BankBagFrame2", "Bank Bag 2" },
		{ "BankBagFrame3", "Bank Bag 3" },
		{ "BankBagFrame4", "Bank Bag 4" },
		{ "BankBagFrame5", "Bank Bag 5" },
		{ "BankBagFrame6", "Bank Bag 6" },
		{ "BankBagFrame7", "Bank Bag 7" },

		{ "", "Bottom Bar" },
		{ "MainMenuBar", "Main Bar" },
		{ "MainMenuBarLeftEndCap", "Left Gryphon" },
		{ "MainMenuBarRightEndCap", "Right Gryphon" },
		{ "MainMenuExpBar", "Experience Bar" },
		{ "MainMenuBarMaxLevelBar", "Max Level Bar Filler"},
		{ "ReputationWatchBar", "Reputation Tracker Bar" },
		{ "MicroButtonsMover", "Micro Menu" },
		{ "MicroButtonsVerticalMover", "Micro Menu - Vertical" },

		{ "", "Focus" },
		{ "FocusFrame", "Focus" },
		{ "FocusFrameDebuff1", "Focus Debuffs" },
		{ "FocusFrameToT", "Target of Focus" },
		{ "FocusFrameToTDebuff1", "Target of Focus Debuffs" },

		{ "", "Game Menu" },
		{ "GameMenuFrame", "Game Menu" },
		{ "VideoOptionsFrame", "Video Options" },
		{ "AudioOptionsFrame", "Sound & Voice Options"},
		{ "InterfaceOptionsFrame", "Interface Options"},
		{ "KeyBindingFrame", "Keybinding Options" },

		{ "", "Guild" },
		{ "GuildInfoFrame", "Guild Info" },
		{ "GuildMemberDetailFrame", "Guild Member Details" },
		{ "GuildControlPopupFrame", "Guild Control" },
		{ "GuildRegistrarFrame", "Guild Registrar" },
		{ "GuildBankFrame", "Guild Bank" },

		{ "", "Info Panels" },
		{ "UIPanelMover1", "Generic Info Panel 1" },
		{ "UIPanelMover2", "Generic Info Panel 2" },
		{ "CharacterFrame", "Character / Pet / Reputation / Skills" },
		{ "TaxiFrame", "Flight Path" },
		{ "FriendsFrame", "Friends / Who / Guild / Chat / Raid" },
		{ "GossipFrame", "Gossip" },
		{ "InspectFrame", "Inspect" },
		{ "LFDParentFrame", "Looking For Dungeon" },
		{ "LFRParentFrame", "Looking For Raid" },
		{ "MacroFrame", "Macros" },
		{ "MailFrame", "Mailbox" },
		{ "MerchantFrame", "Merchant" },
		{ "OpenMailFrame", "Open Mail" },
		{ "PetStableFrame", "Pet Stable" },
		{ "SpellBookFrame", "Spell Book" },
		{ "TabardFrame", "Tabard Design" },
		{ "PlayerTalentFrame", "Talents" },
		{ "TradeFrame", "Trade" },
		{ "TradeSkillFrame", "Trade Skills" },
		{ "ClassTrainerFrame", "Trainer" },
		{ "DressUpFrame", "Wardrobe" },

		{ "", "Loot" },
		{ "LootFrame", "Loot" },
		{ "GroupLootFrame1", "Loot Roll 1" },
		{ "GroupLootFrame2", "Loot Roll 2" },
		{ "GroupLootFrame3", "Loot Roll 3" },
		{ "GroupLootFrame4", "Loot Roll 4" },

		{ "", "Minimap" },
		{ "MinimapCluster", "MiniMap" },
		{ "MinimapZoneTextButton", "Zone Text" },
		{ "MinimapBorderTop", "Top Border" },
		{ "MinimapZoomIn", "Zoom In Button" },
		{ "MinimapZoomOut", "Zoom Out Button" },
		{ "MiniMapMailFrame", "Mail Notification" },
		{ "MiniMapTracking", "Tracking Button" },
		{ "MiniMapBattlefieldFrame", "Battleground  Button" },
		{ "MiniMapWorldMapButton", "World Map Button" },
		{ "GameTimeFrame", "Calendar Button" },
		{ "TimeManagerClockButton", "Clock Button" },

		{ "", "Miscellaneous" },
		{ "TimeManagerFrame", "Alarm Clock" },
		{ "AuctionFrame", "Auction House" },
		{ "BarberShopFrame", "Barber Shop" },
		{ "MirrorTimer1", "Breath/Fatigue Bar" },
		{ "CalendarFrame", "Calendar" },
		{ "CastingBarFrame", "Casting Bar" },
		{ "ComboFrame", "Combo Points Display" },
		{ "DurabilityFrame", "Durability" },
		{ "UIErrorsFrame", "Errors Frame" },
		{ "FramerateMover", "Framerate" },
		{ "ItemSocketingFrame", "Gem Socketing" },
		{ "HelpFrame", "GM Help" },
		{ "ItemRefTooltip", "Item Popup" },
		{ "TicketStatusFrame", "Ticket Status" },
		{ "TooltipMover", "Tooltip" },
		{ "BagItemTooltipMover", "Tooltip - Bag Item" },
		--{ "TutorialFrame", "Tutorial Frame" },
		{ "ZoneTextFrame", "Zone Zoning Text" },
		{ "SubZoneTextFrame", "Subzone Zoning Text" },
		{ "StaticPopup1", "Static Popup 1" },
		{ "StaticPopup2", "Static Popup 2" },
		{ "StaticPopup3", "Static Popup 3" },
		{ "StaticPopup4", "Static Popup 4" },
		{ "ReputationDetailFrame", "Reputation Details" },
		{ "VoiceChatTalkers", "Voice Chat Talkers" },

		{ "", "MoveAnything" },
		{ "MAOptions", "MoveAnything Window" },
		{ "MANudger", "MoveAnything Nudger" },
		{ "GameMenuButtonMoveAnything", "MoveAnything Game Menu Button" },

		{ "", "Party" },
		{ "PartyMemberFrame1", "Party Member 1" },
		{ "PartyMemberFrame1Debuff1", "Party Member 1 Debuffs" },
		{ "PartyMemberFrame2", "Party Member 2" },
		{ "PartyMemberFrame2Debuff1", "Party Member 2 Debuffs" },
		{ "PartyMemberFrame3", "Party Member 3" },
		{ "PartyMemberFrame3Debuff1", "Party Member 3 Debuffs" },
		{ "PartyMemberFrame4", "Party Member 4" },
		{ "PartyMemberFrame4Debuff1", "Party Member 4 Debuffs" },

		{ "", "Pets" },
		{ "PetFrame", "Pet" },
		{ "PartyMemberFrame1PetFrame", "Party Pet 1" },
		{ "PartyMemberFrame2PetFrame", "Party Pet 2" },
		{ "PartyMemberFrame3PetFrame", "Party Pet 3" },
		{ "PartyMemberFrame4PetFrame", "Party Pet 4" },

		{ "", "Player" },
		{ "PlayerFrame", "Player" },
		{ "BuffFrame", "Buffs" },
		{ "TemporaryEnchantFrame", "Item buffs & Debuffs" },

		{ "", "Target" },
		{ "TargetFrame", "Target" },
		{ "TargetFrameSpellBar", "Casting Bar" },
		{ "TargetFrameToT", "Target of Target" },
		{ "TargetFrameToTDebuff1", "Target of Target Debuffs" },
		
		{ "", "Raid" },
		{ "RaidWarningFrame", "Raid Warning" },
		{ "RaidPullout1", "Raid Group Pullout 1" },
		{ "RaidPullout2", "Raid Group Pullout 2" },
		{ "RaidPullout3", "Raid Group Pullout 3" },
		{ "RaidPullout4", "Raid Group Pullout 4" },
		{ "RaidPullout5", "Raid Group Pullout 5" },
		{ "RaidPullout6", "Raid Group Pullout 6" },
		{ "RaidPullout7", "Raid Group Pullout 7" },
		{ "RaidPullout8", "Raid Group Pullout 8" },

		{ "", "Vehicle Bar" },
		{ "VehicleMenuBar", "Vehicle Bar" },
		{ "VehicleMenuBarHealthBar", "Vehicle Health Bar" },
		{ "VehicleMenuBarLeaveButton", "Vehicle Leave Button" },
		{ "VehicleMenuBarPowerBar", "Vehicle Power Bar" },
		{ "VehicleSeatIndicator", "Vehicle Seat Indicator" },

		{ "", "Custom Frames" },
	},


----------------------------------------------------------------
--X: hooks

	ContainerFrame_GenerateFrame = function (frame, size, id)
		--dbg("ContainerFrame_GenerateFrame")
		MovAny:GrabContainerFrame(frame, MovAny:GetBag(id))
	end,

	CloseAllWindows = function ()
		for i, v in pairs(MovAny.frames) do
			if MovAny:IsFrameHooked(v.name) then
				local opt = MovAny:GetFrameOptions(v.name)
				if opt and opt.UIPanelWindows then
					local f = _G[ v.name ]
					if f ~= nil then
						if f:IsShown() then
							f:Hide()
						end
					end
				end
			end
		end
	end,

	ShowUIPanel = function (frame)
		if not InCombatLockdown() then
			MovAny:SetLeftFrameLocation()
			MovAny:SetCenterFrameLocation()
		end
	end,

	HideUIPanel = function (frame)
		if not InCombatLockdown() then
			MovAny:SetLeftFrameLocation()
			MovAny:SetCenterFrameLocation()
		end
	end,

	GameTooltip_SetDefaultAnchor = function (tooltip, parent)
		if tooltip == GameTooltip and MovAny:IsFrameHooked("TooltipMover") then
			-- anchor the tooltip to the side of the mover that is closest to the edge
			local l, r, t, b, a, anchor
			l = TooltipMover:GetLeft() - UIParent:GetLeft()
			r = UIParent:GetRight() - TooltipMover:GetRight()
			t = UIParent:GetTop() - TooltipMover:GetTop()
			b = TooltipMover:GetBottom() - UIParent:GetBottom()
			a = t
			anchor = "TOP"
			if l < a then
				a = l
				anchor = "LEFT"
			end
			if r < a then
				a = r
				anchor = "RIGHT"
			end
			if b < a then
				a = b
				anchor = "BOTTOM"
			end

			tooltip.MAMoved = nil
			tooltip:ClearAllPoints()
			tooltip:SetOwner(parent, "ANCHOR_NONE")
			tooltip:SetPoint(anchor, "TooltipMover", anchor, 0, 0)
			tooltip:SetParent(_G[ "TooltipMover" ])
			tooltip.default = 1
			MovAny:LockPosition(tooltip)
		end
	end,

	GameTooltip_SetOwner = function (tooltip, parent)
		if tooltip.MASkip then
			tooltip.MASkip = nil
			return
		end
		if tooltip == GameTooltip and MovAny:IsFrameHooked("BagItemTooltipMover") then
			-- anchor the tooltip to the side of the mover that is closest to the edge
			local l, r, t, b, a, anchor
			l = TooltipMover:GetLeft() - UIParent:GetLeft()
			r = UIParent:GetRight() - BagItemTooltipMover:GetRight()
			t = UIParent:GetTop() - BagItemTooltipMover:GetTop()
			b = BagItemTooltipMover:GetBottom() - UIParent:GetBottom()
			a = t
			anchor = "TOP"
			if l < a then
				a = l
				anchor = "LEFT"
			end
			if r < a then
				a = r
				anchor = "RIGHT"
			end
			if b < a then
				a = b
				anchor = "BOTTOM"
			end

			tooltip.MAMoved = nil
			tooltip:ClearAllPoints()
			tooltip.MASkip = true
			tooltip:SetOwner(parent, "ANCHOR_NONE")
			tooltip:SetPoint(anchor, "BagItemTooltipMover", anchor, 0, 0)
			tooltip:SetParent(_G[ "BagItemTooltipMover" ])
			tooltip.default = 1
			MovAny:LockPosition(tooltip)
		end
	end,

	UIParent_ManageFramePositions = function()		
		if MovAny:IsFrameHooked("ShapeshiftButtonsMover") then
			MovAny:ApplyAll(_G[ "ShapeshiftButtonsMover" ])
		end
		if NUM_EXTENDED_UI_FRAMES then
			local opts = MovAny:GetFrameOptions("WorldStateCaptureBar1")
			if not opts or not opts.x then
				return
			end
			local lastBar = nil
			for i=1, NUM_EXTENDED_UI_FRAMES do
				local captureBar = _G["WorldStateCaptureBar"..i]
				if captureBar and captureBar:IsVisible() then
					captureBar:ClearAllPoints()
					if i==1 then
						captureBar:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", opts.x, opts.y)
					else
						captureBar:SetPoint("TOPLEFT", lastBar, "TOPLEFT", 0, -25)
					end
					lastBar = captureBar
				end
			end
		end
	end,

	CaptureBar_Create = function(id)
		local frame= MovAny.oCaptureBar_Create(id)
		local opts = MovAny:GetFrameOptions("WorldStateCaptureBar1")
		if opts then
			MovAny:ApplyPosition(frame, opts)
			MovAny:ApplyScale(frame, opts)
			MovAny:ApplyAlpha(frame, opts)
			MovAny:ApplyHide(frame, opts)
		end
		return frame
	end,

	AchievementAlertFrame_OnLoad = function(self)
		self.RegisterForClicks = void
		MovAny.oAchievementAlertFrame_OnLoad(self)
		local opts = MovAny:GetFrameOptions(self:GetName())
		if opts ~= nil then
			MovAny:ApplyPosition(self, opts)
			MovAny:ApplyScale(self, opts)
			MovAny:ApplyAlpha(frame, opts)
			MovAny:ApplyHide(frame, opts)
		end
	end,

	AchievementAlertFrame_GetAlertFrame = function()
		local frame = MovAny.oAchievementAlertFrame_GetAlertFrame()
		if not frame then
			return
		end
		local opts = MovAny:GetFrameOptions(frame:GetName())
		if opts then
			MovAny:ApplyPosition(frame, opts)
			MovAny:ApplyScale(frame, opts)
			MovAny:ApplyAlpha(frame, opts)
			MovAny:ApplyHide(frame, opts)
		end
		return frame
	end,
}

BINDING_HEADER_MOVEANYTHING = "MoveAnything!"
MA_LEFTARROW = "<"
MA_RIGHTARROW = ">"

MoveAnything_CustomFrames = {}
MoveAnything_CharacterSettings = {}
MoveAnything_UseCharacterSettings = false

StaticPopupDialogs["MOVEANYTHING_RESET_CONFIRM"] = {
	text = "MoveAnything: Reset all frames?",
	button1 = TEXT(YES),
	button2 = TEXT(NO),
	OnAccept = function()
		MovAny:ResetAll()
	end,
	timeout = 0,
	exclusive = 0,
	showAlert = 1,
	whileDead = 1,
	hideOnEscape = 1
}

function MovAny:Boot()
	if self.initRun then
		return
	end

	self:VerifyData()

	local MADB_Defaults = {
		autoShowNext = false,
		optsPlaySound = false,
	}

	for i, v in pairs(MADB_Defaults) do
		if MADB[i] ~= nil then
		else
			MADB[i] = v
		end
	end
	
	MADB["collapsed"] = true

	local autoShowUI = false
	if MoveAnything_CharacterSettings == nil then
		autoShowUI = true
	end
	
	MAOptionsCharacterSpecific:SetScript("OnEnter", MovAny.TooltipShowMultiline)
	MAOptionsCharacterSpecific:SetScript("OnLeave", MovAny.TooltipHide)

	MAOptionsToggleCategories:SetScript("OnEnter", MovAny.TooltipShow)
	MAOptionsToggleCategories:SetScript("OnLeave", MovAny.TooltipHide)
	
	MAOptionsToggleModifiedFramesOnly:SetScript("OnEnter", MovAny.TooltipShow)
	MAOptionsToggleModifiedFramesOnly:SetScript("OnLeave", MovAny.TooltipHide)
	
	MAOptionsToggleTooltips:SetScript("OnEnter", MovAny.TooltipShow)
	MAOptionsToggleTooltips:SetScript("OnLeave", MovAny.TooltipHide)
	
	MAOptionsSync:SetScript("OnEnter", MovAny.TooltipShow)
	MAOptionsSync:SetScript("OnLeave", MovAny.TooltipHide)
	
	MAOptionsClose:SetScript("OnEnter", MovAny.TooltipShow)
	MAOptionsClose:SetScript("OnLeave", MovAny.TooltipHide)
	
	MAOptionsResetAll:SetScript("OnEnter", MovAny.TooltipShow)
	MAOptionsResetAll:SetScript("OnLeave", MovAny.TooltipHide)
	
	for i=1, self.frameListSize do
		local label = _G[ "MAMove"..i.."FrameName" ]
		label:SetScript("OnEnter", MovAny.TooltipShowMultiline)
		label:SetScript("OnLeave", MovAny.TooltipHide)
	end

	local sepLast = nil
	local sepItems = 0
	for i, v in pairs(self.DefaultFrameList) do
		if v[1]  then
			if v[1] == "" then
				if sepLast then
					sepLast.items = sepItems
				end
				sepItems = 0

				local sep = {}
				sep.idx = self.nextFrameIdx
				self.nextFrameIdx = self.nextFrameIdx + 1
				sep.name = nil
				sep.helpfulName = v[2]
				sep.sep = true
				sep.collapsed = MADB.collapsed
				sep.items = 0
				table.insert(self.frames, sep)
				table.insert(self.cats, sep)
				self.framesCount = self.framesCount + 1
				sepLast = sep
			else
				self:AddFrameToMovableList(v[1], v[2], 2)
				sepItems = sepItems + 1
				if sepLast then
					self.frames[ self.nextFrameIdx - 1 ].cat = sepLast
				end
				if not self.defFrames[ v[1] ] then
					self:AddCustomFrameIfNew(v[1])
				end
			end
		end
	end
	self.DefaultFrameList = nil
	self.customCat = sepLast

	table.sort(MoveAnything_CustomFrames, function(o1,o2)
		return o1.name:lower() < o2.name:lower()
	end)

	for i, v in pairs(MoveAnything_CustomFrames) do
		if not self:GetFrame( v.name ) then
			self:AddFrameToMovableList(v.name, v.helpfulName, 1)
			self.customCat.items = self.customCat.items + 1
			self.frames[ self.nextFrameIdx - 1 ].cat = self.customCat
		end
	end
	
	self.FrameOptions = MoveAnything_CharacterSettings[self:GetProfileName()]
	
	self.initRun = true

	if ContainerFrame_GenerateFrame then
		hooksecurefunc("ContainerFrame_GenerateFrame", self.ContainerFrame_GenerateFrame)
	end
	if CloseAllWindows then
		hooksecurefunc("CloseAllWindows", self.CloseAllWindows)
	end
	if ShowUIPanel then
		hooksecurefunc("ShowUIPanel", self.ShowUIPanel)
	end
	if HideUIPanel then
		hooksecurefunc("HideUIPanel", self.HideUIPanel)
	end
	if GameTooltip_SetDefaultAnchor then
		hooksecurefunc("GameTooltip_SetDefaultAnchor", self.GameTooltip_SetDefaultAnchor)
	end
	if GameTooltip and GameTooltip.SetOwner then
		hooksecurefunc(GameTooltip, "SetOwner", self.GameTooltip_SetOwner)
	end
	if UIParent_ManageFramePositions then
		hooksecurefunc("UIParent_ManageFramePositions", self.UIParent_ManageFramePositions)
	end
	
	self.oUpdateContainerFrameAnchors = updateContainerFrameAnchors
	if not MADB.noBags then
		updateContainerFrameAnchors = self.UpdateContainerFrameAnchors
	end
	
	self.oCaptureBar_Create = ExtendedUI.CAPTUREPOINT.create
	ExtendedUI.CAPTUREPOINT.create = self.CaptureBar_Create

	self.oAchievementAlertFrame_OnLoad = AchievementAlertFrame_OnLoad
	AchievementAlertFrame_OnLoad = self.AchievementAlertFrame_OnLoad

	self.oAchievementAlertFrame_GetAlertFrame = AchievementAlertFrame_GetAlertFrame
	AchievementAlertFrame_GetAlertFrame = self.AchievementAlertFrame_GetAlertFrame

	_G["MAOptionsCaption"]:SetText("MoveAnything! "..GetAddOnMetadata("MoveAnything", "Version"))

	if MADB.autoShowNext == true then
		autoShowUI = true
		MADB.autoShowNext = false
	end
	if autoShowUI == true then
		MAOptions:Show()
	end
end

function MovAny:OnPlayerLogout()
	if MAOptions:IsShown() then
		MADB.autoShowNext = true
	end

	for i, v in pairs(MoveAnything_CustomFrames) do
		v.idx = nil
		v.cat = nil
	end
	
	local settingsName = self:GetProfileName()

	for i, v in pairs(MoveAnything_CharacterSettings[settingsName]) do
		v.cat = nil
	end
end

function MovAny:VerifyData()
	
	local settingsName = self:GetProfileName()
	if MoveAnything_CharacterSettings[settingsName] == nil then
		MoveAnything_CharacterSettings[settingsName] = {}
	end
	
	for i, opts in pairs(MoveAnything_CharacterSettings[settingsName]) do
		while 1 do
			if not opts or opts == nil then
				break
			end
			
			opts.movable = nil
			opts.cat = nil
			--[[
			if (opts.x and opts.originalLeft and opts.x == opts.originalLeft) and (opts.y and opts.originalBottom and opts.y == opts.originalBottom) then
				opts.x = nil
				opts.y = nil
				opts.originalLeft = nil
				opts.originalBottom = nil
			end
			
			if opts.width and opts.originalWidth and opts.width == opts.originalWidth then
				opts.width = nil
			end
			if opts.height and opts.originalHeight and opts.height == opts.originalHeight then
				opts.height = nil
			end
			]]
			
			--[[-- enable this for automatic pruning
			if not opts.hidden and opts.x == nil and opts.y == nil and opts.scale == nil and opts.alpha == nil then
				MoveAnything_CharacterSettings[settingsName][ i ] = nil
			end
			]]
			break
		end
	end
end

function MovAny:AddCustomFrameIfNew(name)
	local found = nil
	for i in pairs(MoveAnything_CustomFrames) do
		if MoveAnything_CustomFrames[i].name == name then
			found = i
			break
		end
	end
	if found == nil then
		table.insert(MoveAnything_CustomFrames, { name = name, helpfulName = name})
		--self.customCat.items = self.customCat.items + 1
		self.guiLines = -1
		self:UpdateGUIIfShown(true)
		return true
	end
	return false
end

function MovAny:ErrorNotInCombat( silent, msg )
	if UnitAffectingCombat("player") then
		if not silent then
			maPrint("Disabled during combat", msg)
		end
		return true
	end
	return false
end

function MovAny:ToggleVisibilityOnFrame(frame)
	if not frame then
		return
	end
	local opt = self:GetFrameOptions( frame:GetName() )
	if opt and opt.hidden == true then
		self:ShowFrame(frame)
	else
		self:HideFrame(frame)
	end
end

function MovAny:IsScalableFrame( f )
	if not f.SetScale then
		return false
	end
	local fn = f:GetName()
	if self.NoScale[ fn ] or self.ScaleWH[ fn ] then
		return false
	end
	return true
end

function MovAny:SyncAllFrames(dontReset)
	self.pendingFrames = tcopy(self.FrameOptions)
	self:SyncFrames(dontReset)
end

function MovAny:SyncFrames(dontReset)
	if not self.initRun or self.syncingFrames then
		return
	end
	
	local i = 0
	for k in pairs(self.pendingFrames) do
		i = i + 1
	end
	
	if i == 0 then
		--dbg("No pending frames")
		return
	end

	self.syncingFrames = true

	local f, parent, handled
	local skippedFrames = {}
	
	--dbg("Syncing "..i.." frames")
	
	for k, opt in pairs(self.pendingFrames) do
		if not opt.disabled and not self:GetMoverByFrameName( k ) then
			handled = false
			
			if self.runOnceBeforeMove[k] then
				self.runOnceBeforeMove[k]()
				self.runOnceBeforeMove[k] = nil
			end

			if not self.runBeforeInteract[k] or not self.runBeforeInteract[k]() then
				f = _G[opt.name]
				if f then
					if not f:IsProtected() or not InCombatLockdown() then
						if dontReset == nil or not dontReset then
							MovAny:ResetPosition(f, opt, true)
							MovAny:ResetScale(f, opt, true)
							MovAny:ResetAlpha(f, opt, true)
							MovAny:ResetHide(f, opt, true)
						end
						if self:IsFrameHooked(k) then
							if self:HookFrame(k, f) ~= false then
								self:ApplyAll(f, opt)
								handled = true
							end
						end
					end
				end
			end
			if not handled then
				--dbg("   "..opt.name.." unsyncable at the moment")
				skippedFrames[k] = opt
			end
		end
	end
	self.pendingFrames = skippedFrames
	self.syncingFrames = nil
end

function MovAny:GetProfileName(override)
	local val = MoveAnything_UseCharacterSettings
	if override ~= nil then
		val = override
	end
	if val then
		return GetCVar("realmName").." "..UnitName("player")
	else
		return "default"
	end
end

function MovAny:CopySettings( fromName, toName )
	if MoveAnything_CharacterSettings[toName] == nil then
		MoveAnything_CharacterSettings[toName] = {}
	end
	for i, val in pairs(MoveAnything_CharacterSettings[fromName]) do
		local l = tcopy(val)
		l.cat = nil
		MoveAnything_CharacterSettings[toName][i] = l
	end
end

function MovAny:UpdateProfile( profile )
	self:ResetAll(true)
	self.FrameOptions = MoveAnything_CharacterSettings[self:GetProfileName()]
	self:SyncAllFrames(true)
	self:UpdateGUIIfShown(true)
end

function MovAny:GetFrameCount()
	return self.framesCount
end

function MovAny:ClearFrameOptions( frameName )
	self.FrameOptions[ frameName ] = nil
	self:RemoveIfCustom(frameName)
end

function MovAny:GetFrameOptions( frameName, noSymLink )
	if MovAny.FrameOptions == nil then
		return nil
	end
	
	if not noSymLink and not MovAny.FrameOptions[ frameName ] and MovAny.lTranslateSec[ frameName ] then
		--dbg(""..frameName.." translated to "..self.lTranslateSec[ frameName ])
		frameName = MovAny.lTranslateSec[ frameName ]
	end
	return MovAny.FrameOptions[ frameName ]
end

function MovAny:GetFrame( frameName )
	for i,v in pairs(self.frames) do
		if v.name == frameName then
			return v
		end
	end
	return nil
end

function MovAny:RemoveIfCustom( frameName )
	local removed = false
	for i in pairs(MoveAnything_CustomFrames) do
		if MoveAnything_CustomFrames[i].name == frameName then
			table.remove(MoveAnything_CustomFrames, i)
			self.customCat.items = self.customCat.items - 1
			removed = true
			break
		end
	end

	if removed then
		for i in pairs(self.frames) do
			if self.frames[i].name == frameName then
				table.remove(self.frames, i)
				self.framesCount = self.framesCount - 1
				self.guiLines = -1
				break
			end
		end
	end
end

function MovAny.hShow(f, ...)
	--dbg(f:GetName()..":Show()")
	if f.MAHidden then
		--dbg("hidden")
		local fn = f:GetName()
		
		if f:IsProtected() and InCombatLockdown() then
			local opt = MovAny:GetFrameOptions(fn)
			if opt ~= nil then
				MovAny.pendingFrames[ fn ] = opt
			end
		else
			f.MAHidden = nil
			f:Hide()
			f.MAHidden = true
		end
	end
end

function MovAny:LockVisibility( f )
	f.MAHidden = true
	
	if not f.MAShowHook then
		hooksecurefunc(f, "Show", MovAny.hShow)
		f.MAShowHook = true
	end
	
	f.MAWasShown = f:IsShown()
	if f.MAWasShown then
		f:Hide()
	end

	if self.lSimpleHide[ f ] then
		--f:Hide()
		return
	end
	
	if f.attachedChildren then
		for i, v in pairs(f.attachedChildren) do
			self:LockVisibility(v)
		end
	end
end

function MovAny:UnlockVisibility( f )
	if not f.MAHidden then
		return
	end
	f.MAHidden = nil
	if self.lSimpleHide[ f ] then
		f:Show()
		return
	end
	
	if f.MAWasShown then
		f.MAWasShown = nil
		f:Show()
	end
	if f.attachedChildren then
		for i, v in pairs(f.attachedChildren) do
			self:UnlockVisibility(v)
		end
	end
end

function MovAny.hSetPoint(f, ...)
	if f.MAMoved then
		local fn = f:GetName()
		
		--dbg(fn..":SetPoint hook called")
		
		local opt = MovAny:GetFrameOptions(fn)
		
		local m = string.match(fn, "^ContainerFrame[0-9]+$")
		if m then
			local bag = MovAny:GetBagInContainerFrame(f)
			fn = bag:GetName()
			opt = MovAny:GetFrameOptions(fn)
		end
		
		if opt == nil or opt.x == nil or opt.y == nil then
			f.MAMoved = nil
			return
		end
		if f:IsProtected() and InCombatLockdown() then
			MovAny.pendingFrames[ fn ] = opt
			-- XXX temporary hack, will be removed when reparenting code has been completed in -10
			if fn == "PlayerFrame" then
				PlayerFrameTexture:GetParent():Hide()
			end
		else
			--[[
			f.MAMoved = nil
			f:ClearAllPoints()
			local pn
			local p = f:GetParent()
			if not p then
				pn = MovAny.REPARENT
			else
				pn = p:GetName()
			end
			
			--dbg(fn..":SetPoint hook repositioning to "..opt.x..", "..opt.y)
			f:SetPoint("BOTTOMLEFT", pn, "BOTTOMLEFT", opt.x, opt.y)
			MovAny:LockPosition(f)
			]]--
			MovAny:ApplyPosition(f, opt)
		end
	end
end

function MovAny.hSetParent(f, ...)
	if f.MAMoved then
		local fn = f:GetName()
		local opt = MovAny:GetFrameOptions(fn)
		if opt == nil then
			f.MAMoved = nil
			return
		end
		if f:IsProtected() and InCombatLockdown() then
			MovAny.pendingFrames[ fn ] = opt
		else
			--dbg("SetParent hook repositioning: "..fn)
			--[[
			f.MAMoved = nil
			f:ClearAllPoints()
			f:SetPoint("BOTTOMLEFT", f:GetParent(), "BOTTOMLEFT", opt.x, opt.y)
			f.MAMoved = true
			]]--
			MovAny:ApplyPosition(f, opt)
		end
	end
end

function MovAny.hSetWidth(f, ...)
	if f.MAScaled then
		local fn = f:GetName()
		
		local opt = MovAny:GetFrameOptions(fn)
		
		local m = string.match(fn, "^ContainerFrame[0-9]+$")
		if m then
			local bag = MovAny:GetBagInContainerFrame(f)
			fn = bag:GetName()
			opt = MovAny:GetFrameOptions(fn)
		end
		
		MovAny.pendingFrames[ fn ] = opt
		if not f:IsProtected() or not InCombatLockdown() then
			MovAny:SyncFrames()
		end
	end
end

function MovAny.hSetHeight(f, ...)
	if f.MAScaled then
		local fn = f:GetName()
		
		local opt = MovAny:GetFrameOptions(fn)
		
		local m = string.match(fn, "^ContainerFrame[0-9]+$")
		if m then
			local bag = MovAny:GetBagInContainerFrame(f)
			fn = bag:GetName()
			opt = MovAny:GetFrameOptions(fn)
		end
		
		MovAny.pendingFrames[ fn ] = opt
		if not f:IsProtected() or not InCombatLockdown() then
			MovAny:SyncFrames()
		end
	end
end

function MovAny.hSetScale(f, ...)
	if f.MAScaled then
		local fn = f:GetName()
		
		local opt = MovAny:GetFrameOptions(fn)
		
		local m = string.match(fn, "^ContainerFrame[0-9]+$")
		if m then
			local bag = MovAny:GetBagInContainerFrame(f)
			fn = bag:GetName()
			opt = MovAny:GetFrameOptions(fn)
		end
		
		MovAny.pendingFrames[ fn ] = opt
		if not f:IsProtected() or not InCombatLockdown() then
			MovAny:SyncFrames()
		end
	end
end

function MovAny:LockPosition( f )
	if not f.MAMoved then
		if not f.MAMoveHook then
			hooksecurefunc(f, "SetPoint", MovAny.hSetPoint)
			hooksecurefunc(f, "SetParent", MovAny.hSetParent)
			f.MAMoveHook = true
		end
		f.MAMoved = true
	end
end

function MovAny:UnlockPosition( f )
	f.MAMoved = nil
end

function MovAny:LockScale( f )
	if not f.MAScaled then
		if not f.MAScaleHook then
			-- the following doesnt work. it must be called thru the metatable somehow, these hooksecurefunc's never fires
			hooksecurefunc(f, "SetWidth", MovAny.hSetWidth)
			hooksecurefunc(f, "SetHeight", MovAny.hSetHeight)
			hooksecurefunc(f, "SetScale", MovAny.hSetScale)
			f.MAScaleHook = true
		end
		f.MAScaled = true
	end
end

function MovAny:UnlockScale( f )
	f.MAScaled = nil
end

function MovAny:HookFrame( fn, f )
	if not f then
		f = _G[ fn ]
	end
	
	--dbg("Hooking frame: "..fn)
	local opt = self:GetFrameOptions(fn, true)
	if opt == nil then
		opt = {}
		self.FrameOptions[ fn ] = opt
		opt.cat = self.customCat
	end
	if opt.name == nil then
		opt.name = fn
	end
	
	if f.OnMAHook and f.OnMAHook(f) == false then
		return false
	end
	
	if not opt.hidden and (opt.originalLeft == nil or opt.originalBottom == nil) then
		opt.originalLeft, opt.originalBottom = self:GetRelativeBottomLeft(f)
	end
	
	if UIPanelWindows[fn] then
		local left = GetUIPanel("left")
		local center = GetUIPanel("center")

		if f == left then
			UIParent.left = nil
			if center then
				MovAny:SetLeftFrameLocation()
			end
		elseif f == center and left then
			UIParent.center = nil
		end
		local opt = self:GetFrameOptions(fn, noSymLink)
		if opt then
			opt.UIPanelWindows = UIPanelWindows[ fn ]
		end
		UIPanelWindows[ fn ] = nil
	end
	--self:LockPosition(f)
end

function MovAny:IsFrameHooked( fn )
	if fn == nil then
		return
	end
	local opt = self:GetFrameOptions(fn)
	if opt and (opt.x ~= nil or opt.hidden or opt.scale ~= nil or opt.alpha ~= nil ) then
		return true
	end
	return false
end

function MovAny:IsFrameHidden( fn )
	if fn == nil then
		return
	end
	local opt = self:GetFrameOptions(fn)
	if opt and opt.hidden then
		return true
	end
	return false
end

function MovAny:AddFrameToMovableList( fn, helpfulName, default )
	if not self:GetFrame(fn) then
		if helpfulName == nil then
			helpfulName = fn
		end
		
		local frame = _G[fn]
		local opts = {}
		opts.name = fn
		opts.helpfulName = helpfulName
		opts.cat = self.customCat

		opts.idx = self.nextFrameIdx
		self.nextFrameIdx = self.nextFrameIdx + 1

		table.insert(self.frames, opts)
		self.framesCount = self.framesCount + 1

		if default == 2 then
			opts.default = true
			self.defFrames[ opts.name ] = opts
		else
			if default ~= 1 then
				table.insert(MoveAnything_CustomFrames, opts)
				--self.customCat.items = self.customCat.items + 1
				self.guiLines = -1
			end
		end
		if self.initRun then
			self:UpdateGUIIfShown()
		end
	end
end

function MovAny:AttachMover(fn, helpfulName)
	if self:IsMAFrame(fn) then
		return
	end
	
	if self.NoMove[ fn ] then
		Error("Unmovable frame: "..fn)
		return
	end

	local f = _G[fn]

	self.lastFrameName = fn
	
	if self.MoveOnlyWhenVisible[ fn ] then
		if f == nil or not f:IsShown() then
			Error(fn.." can only be moved while visible.")
			return
		end
	end

	if not self:GetMoverByFrameName(fn) then
		local mover = self:FindAvailableFrame()
		if mover == nil then
			Error("You can currently only move "..self.MOVEATONETIME.." frames at once.")
		else
			if self.runOnceBeforeMove[fn] then
				self.runOnceBeforeMove[fn]()
				self.runOnceBeforeMove[fn] = nil
			end
			if self.runBeforeInteract[fn] then
				self.runBeforeInteract[fn]()
			end
			local created = false
			
			if self.createBeforeMove[fn] and _G[ fn ] == nil then
				CreateFrame("Frame", fn, UIParent, self.createBeforeMove[fn])
				created = true
			end
			f = _G[ fn ]
			if f == nil then
				Error(fn.." can only be modified while visible.")
			else
				if f.OnMAOnAttach then
					f.OnMAOnAttach(f, mover)
				end
				self:AddFrameToMovableList(fn, helpfulName)
				if self:HookFrame(fn) == false then
					return
				end
				self:AttachMoverToFrame(mover, f)

				mover.createdTagged = created

				if f.OnMAPostAttach then
					f.OnMAPostAttach(f, mover)
				end
				self:UpdatePosition(mover)
				self:UpdateGUIIfShown()
			end
		end
	end
end

function MovAny:GetDefaultFrameParent(f)
	local c = f
	while c and c ~= UIParent and c ~= nil do
		if c.MAParent then
			c = c.MAParent
		end
		if c.GetName and c:GetName() ~= nil and c:GetName() ~= "" then
			local m = string.match(c:GetName(),"^ContainerFrame[0-9]+")
			if m then
				local bag = self:GetBagInContainerFrame(_G[ m ])
				return _G[ bag:GetName() ]
			end
			
			local transName = self:Translate(c:GetName(),true,true)

			if self:GetFrameOptions(transName) ~= nil then
				return _G[ transName ]
			else
				local frame = self:GetFrame(transName)				
				if frame then
					return _G[frame.name]
				end
			end
		end
		c = c:GetParent()
	end
	return nil
end

function MovAny:GetTopFrameParent(f)
	local c = f
	local l = nil
	while c and c ~= UIParent do
		if c:IsToplevel() then
			return c
		end
		l = c
		c = c:GetParent()
	end
	if c == UIParent then
		return l
	end
	return nil
end

--X: binds
function MovAny:SafeMoveFrameAtCursor()
	if self:ErrorNotInCombat() then
		return
	end

	local obj = GetMouseFocus()
	if self:IsMAFrame(obj:GetName()) then
		if self:IsMover(obj:GetName()) and obj.tagged then
			obj = obj.tagged
		else
			return
		end
	end

	while 1 == 1 do
		local transName = self:Translate(obj:GetName(), 1)

		if transName ~= obj:GetName() then
			self:ToggleMove(transName)
			break
		end

		local objTest = self:GetDefaultFrameParent(obj)

		if objTest then
			self:ToggleMove(objTest:GetName())
			break
		end

		objTest = self:GetTopFrameParent(obj)
		if objTest then
			self:ToggleMove(objTest:GetName())
			break
		end

		if obj and obj ~= WorldFrame and obj ~= UIParent and obj.GetName then
			self:ToggleMove(obj:GetName())
		end
		break
	end

	self:UpdateGUIIfShown(true)
end

function MovAny:MoveFrameAtCursor()
	if self:ErrorNotInCombat() then
		return
	end
	local obj = GetMouseFocus()
	if self:IsMAFrame(obj:GetName()) then
		if self:IsMover(obj:GetName()) and obj.tagged then
			obj = obj.tagged
		else
			return
		end
	end
	if obj and obj ~= WorldFrame and obj ~= UIParent and obj:GetName() then
		self:ToggleMove(obj:GetName())
	end
	
	self:UpdateGUIIfShown(true)
end

function MovAny:SafeHideFrameAtCursor()
	if self:ErrorNotInCombat() then
		return
	end
	local obj = GetMouseFocus()
	if self:IsMAFrame(obj:GetName()) then
		if self:IsMover(obj:GetName()) and obj.tagged then
			obj = obj.tagged
		else
			return
		end
	end

	while 1 do
		local transName = self:Translate(obj:GetName(), 1)
		if transName ~= obj:GetName() then
			--dbg("Hiding translated "..transName)
			self:HideFrame(_G[transName])
			break
		end
		local objTest = self:GetDefaultFrameParent(obj)
		if objTest then
			--dbg("Hiding default "..objTest:GetName())
			self:HideFrame(objTest)
			break
		end
		objTest = self:GetTopFrameParent(obj)
		if objTest then
			--dbg("Hiding top frame "..objTest:GetName())
			self:AddFrameToMovableList(objTest:GetName(), nil)
			self:HideFrame(objTest)
			break
		end
		if obj and obj ~= WorldFrame and obj ~= UIParent then
			--dbg("Hiding "..obj:GetName())
			self:AddFrameToMovableList(obj:GetName(), nil)
			self:HideFrame(obj)
			break
		end
		break
	end
	
	self:UpdateGUIIfShown(true)
end

function MovAny:HideFrameAtCursor()
	if self:ErrorNotInCombat() then
		return
	end
	local obj = GetMouseFocus()
	if self:IsMAFrame(obj:GetName()) then
		if self:IsMover(obj:GetName()) and obj.tagged then
			obj = obj.tagged
		else
			return
		end
	end
	if obj and obj ~= WorldFrame and obj ~= UIParent then
		self:HideFrame(obj)
	end
	
	self:UpdateGUIIfShown(true)
end

function MovAny:ResetFrameConfirm(fn)
	if self.resetConfirm == fn then
		self.resetConfirm = nil
		--dbg("Resetting "..fn)
		self:ResetFrame(fn)
	else
		self.resetConfirm = fn
		maPrint("Reset "..fn.."? Press again to confirm.")
	end
end

function MovAny:SafeResetFrameAtCursor()
	if self:ErrorNotInCombat() then
		return
	end
	local obj = GetMouseFocus()
	if self:IsMAFrame(obj:GetName()) then
		if self:IsMover(obj:GetName()) and obj.tagged then
			obj = obj.tagged
		else
			return
		end
	end

	while 1 do
		local transName = self:Translate(obj:GetName(), 1)
		if transName ~= obj:GetName() and self.FrameOptions[ obj:GetName() ] then
			self:ResetFrameConfirm(obj:GetName())
			break
		end
		local objTest = self:GetDefaultFrameParent(obj)
		if objTest and self.FrameOptions[ objTest:GetName() ] then
			self:ResetFrameConfirm(objTest:GetName())
			break
		end
		objTest = self:GetTopFrameParent(obj)
		if objTest and self.FrameOptions[ objTest:GetName() ] then
			self:ResetFrameConfirm(objTest:GetName())
			break
		end
		if obj and obj ~= WorldFrame and obj ~= UIParent and self.FrameOptions[ obj:GetName() ] then
			self:ResetFrameConfirm(obj:GetName())
			break
		end
		break
	end
end


function MovAny:ResetFrameAtCursor()
	if self:ErrorNotInCombat() then
		return
	end
	local obj = GetMouseFocus()
	if self:IsMAFrame(obj:GetName()) then
		if self:IsMover(obj:GetName()) and obj.tagged then
			obj = obj.tagged
		else
			return
		end
	end

	local fn = obj:GetName()

	if self.FrameOptions[ fn ] then
		self:ResetFrameConfirm(fn)
	end
end

function MovAny:UpdatePosition( mover )
	local x, y, parent
	x = nil
	y = nil
	parent = nil
	if mover.tagged  then
		local f = mover.tagged
		if self.DetachFromParent[ f:GetName() ] then
			x = f:GetLeft()
			y = f:GetBottom()
			parent = UIParent
			--dbg("UP "..f:GetName().." detached from parent. x: "..numfor(x).." y: "..numfor(y))
		else
			x, y = self:GetRelativeBottomLeft(f)
			parent = mover.tagged:GetParent()
		end
		
		local opt = self:GetFrameOptions(f:GetName())
		--[[
		if (opt.x and x ~= opt.x) or (opt.y and y ~= opt.y) then
			dbg("Moving "..f:GetName().." to "..numfor(x)..", "..numfor(y).." from "..numfor(opt.x)..", "..numfor(opt.y))
		end
		]]
		opt.x = x
		opt.y = y
		--self:ApplyPosition(mover.tagged, opt)
		if f.OnMAPosition then
			f.OnMAPosition(f, {x, y})
		end
		
		local alpha = f:GetAlpha()
		if mover.startAlpha ~= alpha then
			if f:GetAlpha() == 1 then
				opt.alpha = nil
			else
				opt.alpha = alpha
			end
			mover.startAlpha = alpha
			
			if f.OnMAAlpha then
				f.OnMAAlpha(f, alpha)
			end
		end
	end
	return x, y, parent
end

function MovAny:StopMoving( moverName )
	local frame = self:GetMoverByFrameName(moverName)
	if frame then
		self:DetachMover(frame)
		self:UpdateGUIIfShown()
	end
end

function MovAny:IsMover(frameName)
	if frameName ~= nil and string.match(frameName, "^MoveAnything[0-9]+$") ~= nil then
		return true
	else
		return false
	end
end

function MovAny:IsMAFrame(frameName)
	if frameName ~= nil and string.match(frameName, "^MoveAnything") ~= nil then
		return true
	else
		return false
	end
end

function MovAny:IsContainer(frameName)
	if string.match(frameName, "^ContainerFrame[0-9]+$") then
		return true
	end
	return false
end

function MovAny:Translate(f,secondary,nofirst)
	if not nofirst and self.lTranslate[ f ] then
		return self.lTranslate[ f ]
	end

	if secondary and self.lTranslateSec[ f ] then
		return self.lTranslateSec[ f ]
	end

	if f == "last" then
		return MovAny.lastFrameName
	else
		return f
	end
end

function MovAny:ToggleMove( moveFrameName )
	if moveFrameName == nil then
		return
	end
	if self:IsMAFrame(moveFrameName) then
		return
	end

	if self:GetMoverByFrameName( moveFrameName ) then
		self:StopMoving( moveFrameName )
	else
		self:AttachMover( moveFrameName )
	end
end

function MovAny:GetMoverByFrameName( moveFrameName )
	local frame
	for i = 1, self.MOVEATONETIME, 1 do
		frame = _G[ "MoveAnything"..i ]
		if type(frame) ~= "nil" and frame:IsShown() and frame.tagged == _G[ moveFrameName ] then
			return frame
		end
	end
	return nil
end

function MovAny:FindAvailableFrame()
	local frame
	for i = 1, self.MOVEATONETIME, 1 do
		frame = _G[ "MoveAnything"..i ]
		if not frame:IsShown() then
			return frame
		end
	end
	return nil
end

function MovAny:GetParentScaleRatio( frame )
	return MAGetScale( frame, 1 )
end

function MovAny:GetRelativeBottomLeft( tagFrame )
	x = tagFrame:GetLeft()
	if x then
		x = x - MAGetParent( tagFrame ):GetLeft() * MAGetScale( MAGetParent( tagFrame ) ) / MAGetScale( tagFrame )
	end
	y = tagFrame:GetBottom()
	if y then
		y = y - MAGetParent( tagFrame ):GetBottom() * MAGetScale( MAGetParent( tagFrame ) ) / MAGetScale( tagFrame )
	end
	return x, y
end

function MovAny:AttachMoverToFrame( mover, f )
	if mover.tagged then
		self:DetachMover(mover)
	end

	mover.wasMoved = f.MAMoved
	f.MAMoved = nil

	local listOptions = self:GetFrame(f:GetName())
	local frameOptions = self:GetFrameOptions(f:GetName())

	mover.helpfulName = listOptions.helpfulName

	if f.OnMAMoving then
		if not f:OnMAMoving() then
			self:DetachMover(mover)
			return
		end
	end

	local x, y
	x = 0
	y = 0
	if f:GetLeft() == nil then
		f:Show()
		f:Hide()
	end

	if f:GetLeft() ~= nil then
		x = f:GetLeft() * MAGetScale( f, 1 ) / UIParent:GetScale()
		x = x - MAGetParent( f ):GetLeft() * MAGetScale( MAGetParent( f ), 1 ) / UIParent:GetScale()

		y = f:GetBottom() * MAGetScale( f, 1 ) / UIParent:GetScale()
		y = y - MAGetParent( f ):GetBottom() * MAGetScale( MAGetParent( f ), 1 ) / UIParent:GetScale()
	end

	mover:ClearAllPoints()
	mover:SetPoint( "BOTTOMLEFT", MAGetParent( f ), "BOTTOMLEFT", x, y )

	mover:SetWidth( f:GetWidth() * MAGetScale( f , 1 ) / UIParent:GetScale() )
	mover:SetHeight( f:GetHeight() * MAGetScale( f, 1 ) / UIParent:GetScale() )

	if f.GetFrameLevel then
		mover:SetFrameLevel( f:GetFrameLevel() + 1 )
	end

	--dbg("  attaching "..f:GetName().." to "..mover:GetName())
	f.MAMoved = nil
	f:ClearAllPoints()
	f:SetPoint( "BOTTOMLEFT", mover, "BOTTOMLEFT", 0, 0 )
	
	f.orgX = x
	f.orgY = y
	
	mover.tagged = f
	
	local label = _G[ mover:GetName().."BackdropInfoLabel"]
	label:Hide()
	label:ClearAllPoints()
	label:SetPoint("TOP", label:GetParent(), "TOP", 0, 20)
	
	mover:Show()
end

function MovAny:DetachMover( mover )
	if mover.tagged then
		local x, y, parent = self:UpdatePosition( mover )
		local f = mover.tagged
		local opt = self:GetFrameOptions(f:GetName())
		self:ApplyPosition(f, opt)
		--[[
		--if x ~= moveFrame.tagged.orgX or y ~= moveFrame.tagged.orgY then
			mover.tagged.MAMoved = nil
			mover.tagged:ClearAllPoints()
			mover.tagged:SetPoint( "BOTTOMLEFT", parent, "BOTTOMLEFT", x, y )
			mover.tagged.MAMoved = true
		--end
		
		if mover.wasMoved then
			mover.tagged.MAMoved = true
			mover.wasMoved = nil
		end
]]
		if mover.createdTagged then
			mover.tagged:Hide()
		end
		if f.OnMAOnDetach then
			f.OnMAOnDetach(f, mover)
		end
	end
	mover:Hide()
	mover.tagged = nil
end

function MovAny:ResetFrame( frameName, dontUpdate, dontDelete )
	if frameName==nil then
			return
	end

	self:StopMoving(frameName)

	local frame = _G[frameName]
	if not frame then
		if not dontDelete then
			self:ClearFrameOptions(frameName)
		end
		if not dontUpdate then
			self:UpdateGUIIfShown(true)
		end
		return
	end

	if frame.OnMAPreReset then
		frame.OnMAPreReset(frame)
	end

	local opt = self:GetFrameOptions(frameName)
	if not opt then
		return
	end

	local width = nil
	local height = nil
	if opt then
		width = opt.originalWidth
		height = opt.originalHeight
	end

	self:ResetPosition(frame, opt, dontDelete)
	self:ResetScale(frame, opt, dontDelete)
	self:ResetAlpha(frame, opt, dontDelete)
	self:ResetHide(frame, opt, dontDelete)
	
	if width then
		frame:SetWidth(width)
	end
	if height then
		frame:SetHeight(height)
	end

	frame.attachedChildren = nil
	if opt and opt.UIPanelWindows then
		UIPanelWindows[ frameName ] = opt.UIPanelWindows
		if frame:IsShown() then
			frame:Hide()
			ShowUIPanel(frame)
		end
	end
	
	if frame.IsUserPlaced and frame:IsUserPlaced() then
		frame:SetUserPlaced(nil)
	end

	if not dontDelete then
		self:ClearFrameOptions(frameName)
	end

	if frame.OnMAPostReset then
		frame.OnMAPostReset(frame)
	end
	
	if not dontUpdate then
		self:UpdateGUIIfShown(true)
	end
end

function MovAny:SmartSetScale(f,scale)
	if not f:IsObjectType("frame") or not self:IsScalableFrame(f) then
		return false
	end
	if f:GetScale()~=scale then
		f:SetScale(scale)
	end
	return true
end

function MovAny:ToggleOptionsMenu()
	if MAOptions:IsShown() then
		MAOptions:Hide()
	else
		MAOptions:Show()
	end
end

function MovAny:GetMovableFrame( idx )
	return _G[self.frames[ idx ].name]
end

function MovAny:OnMoveCheck( button )
	local frameName = self.frames[ button:GetParent().idx ].name

	if self:ErrorNotInCombat() then
		button:SetChecked(false)
		return
	end

	if button:GetChecked() then
		self:AttachMover( frameName )
	else
		self:StopMoving( frameName )
	end

	self:UpdateGUIIfShown()
end

function MovAny:OnHideCheck( button )
	if self:ErrorNotInCombat() then
		button:SetChecked(false)
		return
	end
	local frame = self:GetMovableFrame(button:GetParent().idx)
	if not frame then
		return
	end
	if button:GetChecked() then
		self:HideFrame(frame)
	else
		self:ShowFrame(frame)
	end
	
	self:UpdateGUIIfShown(true)
end

function MovAny:OnResetCheck( button )
	if self:ErrorNotInCombat() then
		return
	end
	self:ResetFrame(self.frames[button:GetParent().idx].name)
end

function MovAny:HideFrame( f )
	if not f then
		return
	end
	if self:IsMAFrame(f:GetName()) then
		return false
	end
	
	if not self:IsFrameHooked(f:GetName()) and self:HookFrame( f:GetName() ) == false then
		return
	end

	local opt = self:GetFrameOptions(f:GetName())
	opt.hidden = true
	f.MAWasShown = f:IsShown()

	if self.HideList[ f:GetName() ] then
		for hIndex, hideEntry in pairs(self.HideList[ f:GetName() ]) do
			local val = _G[hideEntry[1]]
			local hideType
			for i = 2, table.getn(hideEntry) do
				hideType = hideEntry[ i ]
				if type(hideType) == "function" then
					hideType(false)
				elseif hideType == "DISABLEMOUSE" then
					val:EnableMouse(false)
				elseif hideType == "FRAME" then
					self:LockVisibility(val)
				elseif hideType == "WH" then
					self:StopMoving(f:GetName())
					val:SetWidth(1)
					val:SetHeight(1)
				else
					val:DisableDrawLayer( hideType )
				end
			end
		end
	elseif self.HideUsingWH[ f:GetName() ] then
		self:StopMoving(f:GetName())
		f:SetWidth(1)
		f:SetHeight(1)
		self:LockVisibility(f)
	else
		self:LockVisibility(f)
	end
	if f.OnMAHide then
		f.OnMAHide(f)
	end
end

function MovAny:ShowFrame( f, dontDelete )
	if  not f then
		return
	end
	local opt = self:GetFrameOptions( f:GetName() )
	if dontDelete == nil and opt then
		opt.hidden = nil
	end
	if self.HideList[ f:GetName() ] then
		for hIndex, hideEntry in pairs(self.HideList[ f:GetName() ]) do
			local val = _G[ hideEntry[1] ]
			local hideType
			for i = 2, table.getn( hideEntry ) do
				hideType = hideEntry[i]
				if type( hideType ) == "function" then
					hideType( true )
				elseif hideType == "DISABLEMOUSE" then
					val:EnableMouse( true )
				elseif hideType == "FRAME" then
					self:UnlockVisibility( val )
				elseif hideType == "WH" then
					val:SetWidth( opt.originalWidth )
					val:SetHeight( opt.originalHeight )
				else
					val:EnableDrawLayer( hideType )
				end
			end
		end
	elseif self.HideUsingWH[ f:GetName() ] then
		f:SetWidth( opt.originalWidth )
		f:SetHeight( opt.originalHeight )
		self:UnlockVisibility( f )
	else
		self:UnlockVisibility( f )
	end
end

function MovAny:OnCheckCharacterSpecific( button )
	local oldName = self:GetProfileName()
	if button:GetChecked() then
		MoveAnything_UseCharacterSettings = true
	else
		MoveAnything_UseCharacterSettings = false
	end
	local newProfile = self:GetProfileName()
	
	local i = 0
	if MoveAnything_CharacterSettings[newProfile] == nil then
		MoveAnything_CharacterSettings[newProfile] = {}
	else
		for v in pairs(MoveAnything_CharacterSettings[newProfile]) do 
			i = i + 1
		end
	end
	if i == 0 then
		self:CopySettings(oldName, newProfile)
	end
	self:UpdateProfile()
end

function MovAny:OnCheckToggleCategories( button )
	local state = button:GetChecked()
	if state then
		MADB.collapsed = true
	else
		MADB.collapsed = false
	end
	for i, v in pairs(self.cats) do
		v.collapsed = state
	end
	
	self:UpdateGUIIfShown(true)
end

function MovAny:OnCheckToggleModifiedFramesOnly( button )
	local state = button:GetChecked()
	if state then
		MADB.modifiedFramesOnly = true
	else
		MADB.modifiedFramesOnly = false
	end
	
	self:UpdateGUIIfShown(true)
end

function MovAny:OnCheckToggleTooltips( button )
	local state = button:GetChecked()
	if state then
		MADB.tooltips = true
	else
		MADB.tooltips = false
	end
	self:UpdateGUIIfShown()
end

function MovAny:MoverOnSizeChanged( obj )
	if obj.tagged then
		local s, w, h, f, opt
		f = obj.tagged
		opt = self:GetFrameOptions(f:GetName())
		if self.ScaleWH[ f:GetName() ] then
			if opt.width ~= obj:GetWidth() or opt.height ~= obj:GetHeight() then
				opt.width = obj:GetWidth()
				opt.height = obj:GetHeight()
				self:ApplyScale(f, opt)
				--dbg("MoverSizeChanged w: "..numfor(opt.width).." h: "..numfor(opt.height))
			end
		else
			if obj.MASizingAnchor == "LEFT" or obj.MASizingAnchor == "RIGHT" then
				w = obj:GetWidth()
				h = w * (f:GetHeight() / f:GetWidth())
				if h < 16 then
					h = 16
					w = h * (f:GetWidth() / f:GetHeight())
				end
			else
				h = obj:GetHeight()
				w = h * (f:GetWidth() / f:GetHeight())
				if w < 16 then
					w = 16
					h = w * (f:GetHeight() / f:GetWidth())
				end
			end
			s = obj:GetWidth() / f:GetWidth()
			s = s / MAGetScale(f:GetParent(), 1 ) * UIParent:GetScale()
			
			if s ~= obj.tagged:GetScale() then
				opt.scale = s
			
				--dbg("MoverSizeChanged w: "..numfor(w).." h: "..numfor(h).." s: "..numfor(s))
				self:ApplyScale(f, opt)
			end
			obj:SetWidth(w)
			obj:SetHeight(h)
			
			self:LockScale(f)
			
			local label = _G[ obj:GetName().."BackdropInfoLabel"]
			label:SetWidth(w+100)
			label:SetHeight(h)
		end
		
		local label = _G[ this:GetName().."BackdropInfoLabel"]
		label:ClearAllPoints()
		label:SetPoint("TOP", label:GetParent(), "TOP", 0, 20)
		
		local brief, long
		if not MovAny.NoScale[ this.tagged:GetName() ] then
			if MovAny.ScaleWH[this.tagged:GetName()] then
				brief = "W: "..numfor(this.tagged:GetWidth()).." H:"..numfor(this.tagged:GetHeight())
				long = brief
			else
				brief = numfor(this.tagged:GetScale())
				long = "Scale: "..brief
			end
			label:Show()
			label:SetText(brief)
			if this:GetName() == "MoveAnything"..MovAny.currentMover then
				_G[ "MANudgerInfoLabel"]:Show()
				_G[ "MANudgerInfoLabel"]:SetText(long)
			end
		end
		
		self:UpdateGUIIfShown(true)
	end
end

function MovAny:MoverOnMouseWheel(this)
	local alpha = this.tagged:GetAlpha()
	if arg1 > 0 then
		alpha = alpha + 0.05
	else
		alpha = alpha - 0.05
	end
	if alpha < 0 then
		alpha = 0
		this.tagged.alphaAttempts = nil
	elseif alpha > 0.99 then
		alpha = 1
		this.tagged.alphaAttempts = nil
	elseif alpha > 0.92 then
		if not this.tagged.alphaAttempts then
			this.tagged.alphaAttempts = 1
		elseif this.tagged.alphaAttempts > 2 then
			alpha = 1
			this.tagged.alphaAttempts = nil
		else
			this.tagged.alphaAttempts = this.tagged.alphaAttempts + 1
		end
	else
		this.tagged.alphaAttempts = nil
	end
	MovAny:ApplyAlpha(this.tagged, {alpha = alpha})
	local label = _G[ this:GetName().."BackdropInfoLabel"]
	label:Show()
	label:SetText(numfor(alpha))
	if this:GetName() == "MoveAnything"..MovAny.currentMover then
		_G[ "MANudgerInfoLabel"]:Show()
		_G[ "MANudgerInfoLabel"]:SetText("Alpha:"..numfor(alpha))
	end
end

function MovAny:ResetAll(dontDelete)
	for i,v in pairs(self.FrameOptions) do
		self:ResetFrame(v.name, true, true)
	end
	if not dontDelete then
		self.FrameOptions = {}
		MoveAnything_CharacterSettings[self:GetProfileName()] = self.FrameOptions
	end
	
	self:UpdateGUIIfShown(true)
end

function MovAny:OnShow()
	if MADB.optsPlaySound == true then
		PlaySound("igMainMenuOpen")
	end

	MANudger:Show()
	self:NudgerFrameRefresh()
	self:UpdateGUI()

	for i,v in pairs(self.lEnableMouse) do
		if v and v.EnableMouse and ( not v:IsProtected() or not InCombatLockdown()) then
			v:EnableMouse(true)
		end
	end
end

function MovAny:OnHide()
	if MADB.optsPlaySound == true then
		PlaySound("igMainMenuClose")
	end

	self:MoverOnHide()

	for i,v in pairs(self.lEnableMouse) do
		if v and v.EnableMouse then
			v:EnableMouse(false)
		end
	end
end

function MovAny:RowTitleClicked(title)
	local o = self.frames[ MAGetParent(title).idx ]

	if o.sep then
		if o.collapsed then
			o.collapsed = false
		else
			o.collapsed = true
		end

		self:UpdateGUI(1)
	end
end

function MovAny:CountGUIItems()
	local items = 0
	local nextSepItems = 0
	local curSep = nil
	
	for i, o in pairs(MovAny.frames) do
		if o.sep then
			if curSep then
				curSep.items = nextSepItems
				nextSepItems = 0
			end
			curSep = o
		else
			if MADB.modifiedFramesOnly then
				if MovAny:IsFrameHooked(o.name) then
					nextSepItems = nextSepItems + 1
				end
			else
				nextSepItems = nextSepItems + 1
			end
		end
	end

	if curSep then
		curSep.items = nextSepItems
	end
	
	for i, o in pairs(MovAny.frames) do
		if o.sep then
			if not MADB.modifiedFramesOnly then
				if o.collapsed then
					items = items + 1
				else
					items = items + o.items + 1
				end
			else
				if o.items > 0 then
					if o.collapsed then
						items = items + 1
					else
						items = items + o.items + 1
					end
				end
			end
		end
	end
	
	self.guiLines = items
	--dbg("GUI line counted: "..items)
end

function MovAny:UpdateGUI(recount)
	if recount or MovAny.guiLines == -1 then
		MovAny:CountGUIItems()
	end
	
	FauxScrollFrame_Update(MAScrollFrame, MovAny.guiLines, MovAny.frameListSize, MovAny.SCROLL_HEIGHT)
	local topOffset = FauxScrollFrame_GetOffset(MAScrollFrame)

	local startOffset = 0
	local hidden = 0
	local shown = 0
	local lastSep = nil
	for i, o in pairs(MovAny.frames) do
		if startOffset == 0 and shown >= topOffset then
			startOffset = topOffset + hidden
			break
		end

		if o.sep then
			lastSep = o
			if MADB.modifiedFramesOnly then
				if o.items == 0 then
					hidden = hidden + 1
				else
					shown = shown + 1
				end
			else
				shown = shown + 1
			end
		else
			if lastSep and lastSep.collapsed then
			elseif MADB.modifiedFramesOnly then
				if lastSep.items > 0 then
					shown = shown + 1
				else
					hidden = hidden + 1
				end
			else
				shown = shown + 1
			end
		end
	end
	
	if startOffset ~= 0 then
		-- X: fix off by one
		if startOffset > 0 then
			startOffset = startOffset + 1
		end
	end

	local prefix, move, backdrop, hide, sepOffset, wtfOffset
	prefix = "MAMove"
	move = "Move"
	hide = "Hide"
	sepOffset = 0
	wtfOffset = 0
	
	local skip = topOffset

	for i=1, MovAny.frameListSize, 1 do
		local index = i + sepOffset + wtfOffset

		local o
		-- forward to next shown element
		while 1 do
			if index > MovAny.framesCount then
				--dbg("UpdateGUI - index out of bounds: "..index.." / "..MovAny.framesCount)
				break
			end
			o = MovAny.frames[ index ]
			
			if o.sep then
				if MADB.modifiedFramesOnly then
					if o.items > 0 then
						if skip > 0 then
							index = index + 1
							wtfOffset = wtfOffset + 1
							skip = skip -1
						else
							break
						end
					else
						index = index + 1
						wtfOffset = wtfOffset + 1
					end
				else
					if skip > 0 then
						index = index + 1
						wtfOffset = wtfOffset + 1
						skip = skip -1
					else
						break
					end
				end
			elseif o.cat then
				local c = o.cat
				if c.collapsed then
					index = index + 1
					wtfOffset = wtfOffset + 1
				else
					if MADB.modifiedFramesOnly then
						if MovAny:IsFrameHooked(o.name) then
							if skip > 0 then
								index = index + 1
								wtfOffset = wtfOffset + 1
								skip = skip -1
							else
								break
							end
						else
							index = index + 1
							wtfOffset = wtfOffset + 1
						end
					else
						if skip > 0 then
							index = index + 1
							wtfOffset = wtfOffset + 1
							skip = skip -1
						else
							break
						end
					end
				end
			else
				--dbg("UpdateGUI - Error: Element neither a frame or category.  index:"..index)
				index = index + 1
				wtfOffset = wtfOffset + 1
			end
		end
			
		local row = _G[ prefix..i ]
		local frameNameLabel = _G[ prefix..i.."FrameName" ]
		frameNameLabel.idx = index

		if index > MovAny:GetFrameCount() then
			--dbg("Hiding unused list row: "..i.." ("..index.."/"..MovAny:GetFrameCount()..")")
			row:Hide()
		else
			local frameName = o.name
			local opts = MovAny:GetFrameOptions(frameName)
			local moveCheck = _G[ prefix..i..move ]
			local hideCheck = _G[ prefix..i..hide ]

			row.idx = index
			row.name = o.name
			row:Show()

			local text, frameNameLabel, tooltipLines
			if o.sep then
				text = _G[ prefix..i.."FrameNameText" ]
				text:Hide()
				text = _G[ prefix..i.."FrameNameHighlight" ]
				text:Show()
				if o.collapsed and o.items > 0 then
					text:SetText("+ "..o.helpfulName)
				else
					text:SetText("   "..o.helpfulName)
				end
				frameNameLabel = _G[ prefix..i.."FrameName" ]
				frameNameLabel.tooltipLines = nil
			else
				text = _G[ prefix..i.."FrameNameHighlight" ]
				text:Hide()
				text = _G[ prefix..i.."FrameNameText" ]
				text:Show()
				text:SetText(o.helpfulName)
			end

			if frameName then
				_G[ prefix..i.."Backdrop" ]:Show()
				moveCheck:Show()

				if MovAny:GetMoverByFrameName(frameName) then
					moveCheck:SetChecked(1)
				else
					moveCheck:SetChecked(nil)
				end

				if MovAny.NoMove[ frameName ] then
					moveCheck:Hide()
				end

				if MovAny.NoHide[ frameName ] then
					hideCheck:Hide()
				else
					if opts and opts.hidden then
						hideCheck:SetChecked(1)
					else
						hideCheck:SetChecked(nil)
					end
					hideCheck:Show()
				end

				if MovAny:IsFrameHooked(frameName) then
					_G[ prefix..i.."Reset" ]:Show()
				else
					if o.default then
						_G[ prefix..i.."Reset" ]:Hide()
					else
						_G[ prefix..i.."Reset" ]:Show()
					end
				end
			else
				_G[ prefix..i.."Backdrop" ]:Hide()
				moveCheck:Hide()
				hideCheck:Hide()
				_G[ prefix..i.."Reset" ]:Hide()
			end

			if o.sep and o.collapsed then
				sepOffset = sepOffset + o.items
			end
		end
	end
--[[
	if MoveAnything_UseCharacterSettings then
		MAOptionsCharacterSpecific:SetChecked(1)
	else
		MAOptionsCharacterSpecific:SetChecked(nil)
	end
	]]--
	MAOptionsCharacterSpecific:SetChecked(MoveAnything_UseCharacterSettings)
	MAOptionsCharacterSpecific.tooltipLines = {"Use character specific settings",
									"",
									"Current profile: "..MovAny.GetProfileName(),
									" Cmds: /movelist, /moveimport, /moveexport & /movedelete",
								}
	
	MAOptionsToggleCategories:SetChecked(MADB.collapsed)
	MAOptionsToggleModifiedFramesOnly:SetChecked(MADB.modifiedFramesOnly)
	MAOptionsToggleTooltips:SetChecked(MADB.tooltips)
	MovAny:TooltipHide()
end

function MovAny:UpdateGUIIfShown(recount)
	if recount then
		self.guiLines = -1
	end
	if MAOptions and MAOptions:IsShown() then
		self:UpdateGUI()
	end
end

function MovAny:Mover(dir)
	if dir > 0 then
		if self.currentMover < 20 then
			self.currentMover = self.currentMover + 1
		else
			self.currentMover = 1
		end
	else
		if MovAny.currentMover > 1 then
			self.currentMover = self.currentMover - 1
		else
			self.currentMover = 20
		end
	end
	self:NudgerFrameRefresh()
end

function MovAny:GetFirstMover()
	for i = 1, MovAny.MOVEATONETIME do
		if  _G[ "MoveAnything"..i ]:IsShown() then
			return i
		end
	end
	return nil
end

function MovAny:MoverOnShow(mover)
	MANudger:Show()
	self.currentMover = tonumber(mover:GetID())
	self:NudgerFrameRefresh()
end

function MovAny:MoverOnHide()
	local firstMover = self:GetFirstMover()
	if firstMover == nil then
		MANudger:Hide()
	else
		self.currentMover = firstMover
		self:NudgerFrameRefresh()
	end
end

function MovAny:NudgerOnShow()
	local firstMover = self:GetFirstMover()
	if firstMover == nil then
		MANudger:Hide()
	else
		self:NudgerFrameRefresh()
	end
end

function MovAny:NudgerFrameRefresh(reset)
	if self.currentMover < 20 then
		MANudger_MoverPlus:Enable()
	else
		MANudger_MoverPlus:Disable()
	end
	if self.currentMover > 1 then
		MANudger_MoverMinus:Enable()
	else
		MANudger_MoverMinus:Disable()
	end

	local labelText = "MA "..self.currentMover.."/20"
	if not reset and _G["MoveAnything"..self.currentMover ].tagged then
		labelText = labelText.."\n".._G[ "MoveAnything"..self.currentMover ].tagged:GetName()
		MANudger.idx = MovAny:GetFrame(_G[ "MoveAnything"..MovAny.currentMover ].tagged:GetName()).idx
	end
	MANudgerTitle:SetText(labelText)
end

function MovAny:NudgerOnUpdate()
	-- This code was originally ripped from DiscordART :)
	local obj = GetMouseFocus()
	local text = ""
	local text2 = ""
	local label = MANudgerMouseOver
	local labelSafe = MANudgerMouseOver

	if obj and obj ~= WorldFrame and obj:GetName() then
		local objTest = self:GetDefaultFrameParent(obj)
		if objTest then
			text = text.."Safe: "..objTest:GetName()
		else
			objTest = self:GetTopFrameParent(obj)
			if objTest then
				text = text.."Safe: "..objTest:GetName()
			end
		end
	end

	if obj and obj ~= WorldFrame and obj:GetName() then
		text2 = "Mouseover: "..text2..obj:GetName()
		if obj:GetParent()  and obj:GetParent() ~= WorldFrame and obj:GetParent():GetName() then
			text2 = text2.."\nParent: "..obj:GetParent():GetName()
			if obj:GetParent():GetParent() and obj:GetParent():GetParent() ~= WorldFrame and obj:GetParent():GetParent():GetName() then
				text2 = text2.."\nParent's Parent: "..obj:GetParent():GetParent():GetName()
			end
		end
	end

	if not string.find(text2, "MANudger") then
		label:SetText(text2.."\n"..text)
	else
		label:SetText(text)
	end
end

function MovAny:Center(lock)
	local mover = _G["MoveAnything"..self.currentMover]
	if lock == 0 then
		-- Both
		mover:ClearAllPoints()
		mover:SetPoint("CENTER",0,0)
	else
		local x, y
		x = mover:GetLeft()
		y = mover:GetBottom()

		mover:ClearAllPoints()
		if lock == 1 then
			--Horizontal
			mover:SetPoint("CENTER",0,0)
			x = mover:GetLeft()
			mover:ClearAllPoints()
			mover:SetPoint("BOTTOMLEFT",x,y)
		elseif lock == 2 then
			-- Vertical
			mover:SetPoint("CENTER",0,0)
			y = mover:GetBottom()
			mover:ClearAllPoints()
			mover:SetPoint("BOTTOMLEFT",x,y)
		end
	end

	self:UpdatePosition(mover)
end

function MovAny:Nudge(dir, button)
	local x, y, offsetX, offsetY, parent, mover, offsetAmount
	mover = _G["MoveAnything"..self.currentMover]

	if not mover:IsShown() then
		return
	end

	x = mover:GetLeft()
	y = mover:GetBottom()

	if button == "RightButton" then
		if IsShiftKeyDown() then
			offsetAmount = 250
		else
			offsetAmount = 50
		end
	else
		if IsShiftKeyDown() then
			offsetAmount = 10
		else
			offsetAmount = 1
		end
	end

	if dir == 1 then
		offsetX = 0
		offsetY = offsetAmount
	elseif dir == 2 then
		offsetX = 0
		offsetY = -offsetAmount
	elseif dir == 3 then
		offsetX = -offsetAmount
		offsetY = 0
	elseif dir == 4 then
		offsetX = offsetAmount
		offsetY = 0
	end

	mover:ClearAllPoints()
	mover:SetPoint("BOTTOMLEFT","UIParent","BOTTOMLEFT",x + offsetX, y + offsetY)
	self:UpdatePosition(mover)
end

function MovAny:SizingAnchor( button )
	local s, e = string.find( button:GetName(), "Resize_" )
	local anchorto = string.sub( button:GetName(), e + 1 )
	local anchor

	if anchorto == "LEFT"  then
		anchor = "RIGHT"
	elseif anchorto == "RIGHT" then
		anchor = "LEFT"
	elseif anchorto == "TOP"  then
		anchor = "BOTTOM"
	elseif anchorto == "BOTTOM" then
		anchor = "TOP"
	end
	return anchorto, anchor
end

function MovAny:SetLeftFrameLocation()
	local left = GetUIPanel("left")
	if left then
		if self:IsFrameHooked("UIPanelMover1") then
			left:ClearAllPoints()
			left:SetPoint("TOPLEFT", "UIPanelMover1", "TOPLEFT", 0)
			left:SetScale(MAGetScale( UIPanelMover1 ), 1)
		else
			left:SetScale(1)
		end
	end
end

function MovAny:SetCenterFrameLocation()
	-- don't mess with the normal center panels, just the ones
	-- that are pushed over from the left
	if GetUIPanel("left") then
		local center = GetUIPanel("center")
		if center then
			if self:IsFrameHooked("UIPanelMover2" ) then
				center:ClearAllPoints()
				center:SetPoint("TOPLEFT", "UIPanelMover2", "TOPLEFT")
				center:SetScale(MAGetScale( UIPanelMover2 ), 1)
			else
				center:SetScale(1)
			end
		end
	end
end

function MovAny:GetContainerFrame( id )
	local i = 1
	local container
	while 1 do
		container = _G["ContainerFrame"..i]
		if not container then break end
		if container:IsShown() and container:GetID() == id then
			return container
		end
		i = i + 1
	end
	return nil
end

function MovAny:GetBagInContainerFrame( f )
	return self:GetBag(f:GetID())
end

function MovAny:GetBag(id)
	return self.bagFrames[ id ]
end

function MovAny:SetBag(id, bag)
	self.bagFrames[ id ] = bag
end

function MovAny:GrabContainerFrame( container, movableBag )
	if movableBag and MovAny:IsFrameHooked(movableBag:GetName()) then
		local wasMoved = container.MAMoved
		container.MAContainerOriginalScale = MAGetScale(container)
		movableBag:Show()

		container:SetScale(MAGetScale( movableBag ))
		container:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", movableBag:GetLeft(), movableBag:GetBottom())
		
		movableBag.attachedChildren = {}
		table.insert(movableBag.attachedChildren, container)
		
		local opts = MovAny:GetFrameOptions(movableBag:GetName())
		MovAny:ApplyAlpha(container, opts)
		
		container.MAMoved = wasMoved
		MovAny:LockPosition(container)
	end
end

function MovAny:ApplyAll(f, opts)
	if not opts then
		opts = MovAny:GetFrameOptions(f:GetName())
	end
	--dbg("  applying all settings to "..(f:GetName() or "unnamed frame"))
	MovAny:ApplyPosition(f, opts)
	MovAny:ApplyScale(f, opts)
	MovAny:ApplyAlpha(f, opts)
	MovAny:ApplyHide(f, opts)
end

-- XXX extend with clampToScreen
function MovAny:ApplyPosition(f, opts)
	if not opts then
		return
	end
	
	if opts.x ~= nil and opts.y ~= nil then
		if opts.originalLeft == nil or opts.originalBottom == nil then
			opts.originalLeft, opts.originalBottom = self:GetRelativeBottomLeft(f)
		end
		
		local parent = UIParent
		
		if self.DetachFromParent[ f:GetName() ] then
			if f.MAOrgParent == nil then
				f.MAOrgParent = f:GetParent():GetName()
				--dbg("  Detaching "..f:GetName().." from "..f.MAOrgParent)
			end
		else
			parent = MAGetParent(f)
		end
		
		MovAny:UnlockPosition(f)
		f:ClearAllPoints()
		f:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", opts.x, opts.y)
		MovAny:LockPosition(f)
		
		if f.OnMAPosition then
			f.OnMAPosition(f, {x, y})
		end
	end
end

function MovAny:ResetPosition(f, opts, dontDelete)
	if not opts then
		return
	end
	MovAny:UnlockPosition(f)
	
	if opts.x ~= nil and opts.y ~= nil then
		if opts.originalLeft or opts.originalBottom then
			f:ClearAllPoints()
			if self.DetachFromParent[ f:GetName() ] then
				--dbg("Restoring original position "..f:GetName().." to "..numfor(opts.originalLeft)..", "..numfor(opts.originalBottom).." and repareting to "..f.MAOrgParent)
				f:SetPoint( "BOTTOMLEFT", f.MAOrgParent, "BOTTOMLEFT", opts.originalLeft, opts.originalBottom )
				f.MAOrgParent = nil
			else
				--dbg("Restoring original position "..f:GetName().." to "..numfor(opts.originalLeft)..", "..numfor(opts.originalBottom))
				f:SetPoint( "BOTTOMLEFT", MAGetParent( f ), "BOTTOMLEFT", opts.originalLeft, opts.originalBottom )
			end
		end
		if not dontDelete then
			opts.x = nil
			opts.y = nil
			if f.OnMAPosition then
				f.OnMAPosition(f, {opts.originalLeft, opts.originalBottom})
			end
		end
	end
	
	f.MAOrgParent = nil
end

function MovAny:ApplyAlpha(f, opts)
	if not opts then
		return
	end
	local alpha = opts.alpha
	
	if alpha and alpha >= 0 and alpha <= 1 then
		if opts.originalAlpha == nil then
			opts.originalAlpha = f:GetAlpha()
		end
		f:SetAlpha(alpha)
		
		if f.attachedChildren then
			for i, v in pairs(f.attachedChildren) do
				if v:GetAlpha() ~= 1 then
					v.MAOrgAlpha = v:GetAlpha()
				end
				v:SetAlpha(alpha)
			end
		end
		if f.OnMAAlpha then
			f.OnMAAlpha(f, alpha)
		end
	end
end

function MovAny:ResetAlpha(f, opts, dontDelete)
	if not opts then
		return
	end
	local alpha = opts.originalAlpha
	if alpha == nil or alpha > 1 then
		alpha = 1
	elseif alpha < 0 then
		alpha = 0
	end
	
	f:SetAlpha(alpha)
	
	if f.attachedChildren then
		for i, v in pairs(f.attachedChildren) do
			v:SetAlpha(alpha)
		end
	end
	
	if f.OnMAAlpha then
		f.OnMAAlpha(f, alpha)
	end
end

function MovAny:ApplyHide(f, opts)
	if not opts then
		return
	end

	-- HideFrame fires OnMAHide event now
	if opts.hidden then
		self:HideFrame(f)
	end
end

function MovAny:ResetHide(f, opts, dontDelete)
	if not opts then
		return
	end
	local wasHidden = opts.hidden
	if not dontDelete then
		opts.hidden = nil
	end
	
	if wasHidden then
		self:ShowFrame(f, dontDelete)
	end
	
	if f.OnMAHide then
		f.OnMAHide(f, wasHidden)
	end
end

function MovAny:ApplyScale( f, opts )
	if not opts then
		return
	end
	--dbg(f:GetName().."::ApplyScale")
	--dbg("scale: "..(opts.scale or ""))
	--dbg("scalable: "..(self:IsScalableFrame(f) and "true" or "false"))
	
	self:UnlockScale(f)
	if f.GetName and self.NoScale[ f:GetName() ] then
		return
	elseif f.GetName and self.ScaleWH[ f:GetName() ] then
		if opts.width or opts.height then
			--dbg(f:GetName().."::ApplyScale WH w:"..opts.width.." h:"..opts.height)
		
			if opts.width and opts.originalWidth == nil then
				opts.originalWidth = f:GetWidth()
			end
			if opts.height and opts.originalHeight == nil then
				opts.originalHeight = f:GetHeight()
			end
			if self.lHideOnScale[ f:GetName() ] then
				for i,v in pairs(self.lHideOnScale[ f:GetName() ]) do
					self:LockVisibility(v)
				end
			end
			if opts.width ~= nil and opts.width > 0 then
				f:SetWidth(opts.width)
			end
			if opts.height ~= nil and opts.height > 0 then
				f:SetHeight(opts.height)
			end
			self:LockScale(f)
			if self.lLinkedScaling[ f:GetName() ] then
				for i,v in pairs(self.lLinkedScaling[ f:GetName() ]) do
					self:ApplyScale(_G[v], opts)
				end
			end
			if f.OnMAScale then
				f.OnMAScale(f, opts.width, opts.height)
			end
		end
	elseif opts.scale ~= nil and opts.scale >= 0 and self:IsScalableFrame(f) then
		f:SetScale(opts.scale)
		self:LockScale(f)
		
		if self.lHideOnScale[ f:GetName() ] then
			for i,v in pairs(self.lHideOnScale[ f:GetName() ]) do
				self:LockVisibility(v)
			end
		end

		if f.attachedChildren and not f.MANoScaleChildren then
			for i, v in pairs(f.attachedChildren) do
				self:ApplyScale(v, opts)
			end
		end
		
		if self.lLinkedScaling[ f:GetName() ] then
			for i,v in pairs(self.lLinkedScaling[ f:GetName() ]) do
				self:ApplyScale(_G[v], opts)
			end
		end
		if f.OnMAScale then
			f.OnMAScale(f, opts.scale)
		end
	end
end

function MovAny:ResetScale(f, opts)
	self:UnlockScale(f)
	if not opts or (f.GetName and self.NoScale[ f:GetName() ] ) then
		return
	end
	if self.ScaleWH[ f:GetName() ] then
		if (opts.originalWidth and f:GetWidth() ~= opts.originalWidth) or (opts.originalHeight and f:GetHeight() ~= opts.originalHeight) then
			if opts.originalWidth ~= nil and opts.originalWidth > 0 then
				f:SetWidth(opts.originalWidth)
			end
			if opts.originalHeight ~= nil and opts.originalHeight > 0 then
				f:SetHeight(opts.originalHeight)
			end
			if self.lHideOnScale[ f:GetName() ] then
				for i,v in pairs(self.lHideOnScale[ f:GetName() ]) do
					self:UnlockVisibility(v)
				end
			end
			if self.lLinkedScaling[ f:GetName() ] then
				for i,v in pairs(self.lLinkedScaling[ f:GetName() ]) do
					self:ResetScale(_G[v], opts)
				end
			end
			if f.OnMAScale then
				f.OnMAScale(f, {opts.width, opts.height})
			end
		end
	elseif self:IsScalableFrame(f) and opts.originalScale ~= f:GetScale() then
		local scale = opts.originalScale
		if scale == nil then
			scale = 1
		end
		f:SetScale(scale)
		
		if self.lHideOnScale[ f:GetName() ] then
			for i,v in pairs(self.lHideOnScale[ f:GetName() ]) do
				self:UnlockVisibility(v)
			end
		end
		if f.attachedChildren and not f.MANoScaleChildren then
			for i, v in pairs(f.attachedChildren) do
				self:ResetScale(v, opts)
			end
		end
		if self.lLinkedScaling[ f:GetName() ] then
			for i,v in pairs(self.lLinkedScaling[ f:GetName() ]) do
				self:ResetScale(_G[v], opts)
			end
		end
		if f.OnMAScale then
			f.OnMAScale(f, opts.scale)
		end
	end
end

-- modfied version of blizzards own updateContainerFrameAnchors
-- to prevent this from overwriting the original do a "/run MADB.noBags = true" followed by a "/reload"
function MovAny:UpdateContainerFrameAnchors()
  local frame, xOffset, yOffset, screenHeight, freeScreenHeight, leftMostPoint, column
  local screenWidth = GetScreenWidth()
  local containerScale = 1
  local leftLimit = 0

  while ( containerScale > CONTAINER_SCALE ) do
    screenHeight = GetScreenHeight() / containerScale
    -- Adjust the start anchor for bags depending on the multibars
    xOffset = CONTAINER_OFFSET_X / containerScale
    yOffset = CONTAINER_OFFSET_Y / containerScale
    -- freeScreenHeight determines when to start a new column of bags
    freeScreenHeight = screenHeight - yOffset
    leftMostPoint = screenWidth - xOffset
    column = 1
    local frameHeight
    for index, frameName in ipairs(ContainerFrame1.bags) do
      frameHeight = _G[frameName]:GetHeight()
      if freeScreenHeight < frameHeight then
        -- Start a new column
        column = column + 1
        leftMostPoint = screenWidth - ( column * CONTAINER_WIDTH * containerScale ) - xOffset
        freeScreenHeight = screenHeight - yOffset
      end
      freeScreenHeight = freeScreenHeight - frameHeight - VISIBLE_CONTAINER_SPACING
    end
    if leftMostPoint < leftLimit then
      containerScale = containerScale - 0.01
    else
      break
    end
  end

  if containerScale < CONTAINER_SCALE then
    containerScale = CONTAINER_SCALE
  end

  screenHeight = GetScreenHeight() / containerScale
  -- Adjust the start anchor for bags depending on the multibars
  xOffset = CONTAINER_OFFSET_X / containerScale
  yOffset = CONTAINER_OFFSET_Y / containerScale
  -- freeScreenHeight determines when to start a new column of bags
  freeScreenHeight = screenHeight - yOffset
  column = 0

  local bag = nil
  local lastBag = nil
  for index, frameName in ipairs(ContainerFrame1.bags) do
    frame = _G[frameName]
    bag = MovAny:GetBagInContainerFrame(frame)
    if not bag or ( bag and not MovAny:IsFrameHooked(bag:GetName()) ) then
	    frame:SetScale(containerScale)
	    frame:ClearAllPoints()
	    if lastBag == nil then
	      -- First bag
	      frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", GetScreenWidth()-xOffset-CONTAINER_WIDTH, yOffset )
	    elseif freeScreenHeight < frame:GetHeight() then
	      -- Start a new column
	      column = column + 1
	      freeScreenHeight = screenHeight - yOffset
	      frame:SetPoint("BOTTOMRIGHT", frame:GetParent(), "BOTTOMRIGHT", -(column * CONTAINER_WIDTH) - xOffset, yOffset )
	    else
	      -- Anchor to the previous bag
	      frame:SetPoint("BOTTOMRIGHT", lastBag, "TOPRIGHT", 0, CONTAINER_SPACING)
	    end
	    freeScreenHeight = freeScreenHeight - frame:GetHeight() - VISIBLE_CONTAINER_SPACING

	    lastBag = frame
	   end
  end
end

----------------------------------------------------------------
-- X: slash commands

SLASH_MAMOVE1 = "/move"
SlashCmdList["MAMOVE"] = function( msg )
	if msg == nil or string.len( msg ) == 0 then
		MovAny:ToggleOptionsMenu()
	else
		MovAny:ToggleMove(MovAny:Translate(msg))
	end
end

SLASH_MAUNMOVE1= "/unmove"
SlashCmdList["MAUNMOVE"] = function( msg )
	if msg then
		if MovAny.FrameOptions[ msg ] then
			MovAny:ResetFrame(msg)
		elseif MovAny.FrameOptions[ MovAny:Translate(msg) ] then
			MovAny:ResetFrame(MovAny:Translate(msg))
		end
	else
		Error("Syntax: /unmove framename")
	end
end

SLASH_MAIMPORT1 = "/moveimport"
SlashCmdList["MAIMPORT"] = function( msg )
	if msg == nil or string.len(msg) == 0 then
		Error("Syntax: /moveimport ProfileName")
		return
	end

	if MoveAnything_CharacterSettings[msg] == nil then
		Error("Unknown profile: "..msg)
		return
	end

	MovAny:CopySettings(msg, MovAny:GetProfileName())
	MovAny:UpdateProfile()
	maPrint("Profile imported: "..msg)
end

SLASH_MAEXPORT1 = "/moveexport"
SlashCmdList["MAEXPORT"] = function( msg )
	if msg == nil or string.len(msg) == 0 then
		Error("Syntax: /moveexport ProfileName")
		return
	end

	MovAny:CopySettings(MovAny:GetProfileName(), msg)
	maPrint("Profile exported: "..msg)
end


SLASH_MALIST1 = "/movelist"
SlashCmdList["MALIST"] = function( msg )
	maPrint("Profiles:")
	for i, val in pairs(MoveAnything_CharacterSettings) do
		local str = " \""..i.."\""
		if  val == MovAny.FrameOptions then
			str = str.." (Current)"
		end
		maPrint(str)
	end
end

SLASH_MADELETE1 = "/movedelete"
SLASH_MADELETE2 = "/movedel"
SlashCmdList["MADELETE"] = function( msg )
	if msg == nil or string.len( msg ) == 0 then
		Error( "Syntax: /movedelete ProfileName" )
		return
	end

	if MoveAnything_CharacterSettings[msg] == nil then
		Error( "Unknown profile: "..msg )
		return
	end

	if msg == MovAny:GetProfileName() then
		MovAny:ResetAll()
	else
		MoveAnything_CharacterSettings[msg] = nil
	end
end
----------------------------------------------------------------
-- X: global functions

function MoveAnythingUpdater_OnUpdate(arg1)
	if MoveAnythingUpdater:GetScale() == UIParent:GetScale() then
		--MoveAnythingUpdater:SetScale(0.2)
		--MovAny:RefreshPositions()
	end
end

function MAGetParent( f )
	if not f or not f.GetParent then
		maPrint(" not f or notf.GetParent")
		return
	end
	local p = f:GetParent()
	if p == nil then
		return UIParent
	end

	return p
end

function MAGetScale( frame, effective )
	if not frame or MovAny.NoMove[frame:GetName()] then
		return 1
	else
		if not frame.GetScale or frame:GetScale() == nil then
			return 1
		end

		if effective then
			return frame:GetEffectiveScale()
		else
			return frame:GetScale()
		end
	end
end

function maPrint( msgKey, msgHighlight, msgAdditional, r, g, b, frame )
	local msgOutput
	if frame then
		msgOutput = frame
	else
		msgOutput = DEFAULT_CHAT_FRAME
	end

	if msgKey				 == "" then
		return
	end
	if msgKey        == nil then
		msgKey = "<nomsg>"
	end
	if msgHighlight == nil or msgHighlight == "" then
		msgHighlight  = " "
	end
	if msgAdditional == nil or msgAdditional == "" then
		msgAdditional = " "
	end
	if msgOutput then
		msgOutput:AddMessage( "|caaff0000MoveAnything|r|caaffff00>|r "..msgKey.." |caaaaddff"..msgHighlight.."|r"..msgAdditional, r, g, b )
	end
end

----------------------------------------------------------------
-- X: debugging code

function echo(...)
	local msg = ""
	for k,v in pairs({...}) do
		msg = msg .. k .. "=[" .. tostring(v) .."] "
	end
	DEFAULT_CHAT_FRAME:AddMessage(msg)
end

function decho(...)
	local msg = ""
	for k,v in pairs({...}) do
		if type(v) == "table" then
			msg = msg .. k .. "=[" .. dechoSub(v) .."] "
		else
			msg = msg .. k .. "=[" .. tostring(v) .."] "
		end
	end
	DEFAULT_CHAT_FRAME:AddMessage(msg)
end

function dechoSub(t)
	local msg = ""
	for k,v in pairs(t) do
		if type(v) == "table" then
			msg = msg .. k .. "=[" .. dechoSub(v) .."] "
		else
			msg = msg .. k .. "=[" .. tostring(v) .."] "
		end
	end
	return msg
end

function MovAny:DebugFrameAtCursor()
	local o = GetMouseFocus()
	if o then
		if self:IsMAFrame(o:GetName()) then
			if self:IsMover(o:GetName()) and o.tagged then
				o = o.tagged
			end
		end
		
		if o ~= WorldFrame and o ~= UIParent then
			MovAny:Dump(o)
		end
	end
end

function MovAny:Dump(o)
	maPrint("Name: "..o:GetName())
	
	local p = o:GetParent()
	if p == nil then
		p = UIParent
	end
	maPrint("Parent: "..(p:GetName() or "unnamed"))
	
	if o.MAParent then
		maPrint("MA Parent: "..(o.MAParent:GetName() or "unnamed"))
	end
	
	local point = p:GetPoint()
	if point then
		maPrint("Point: "..point)
	end
	
	if o:GetTop() then
		maPrint("Top: "..o:GetTop())
	end
	if o:GetRight() then
		maPrint("Right: "..o:GetRight())
	end
	if o:GetBottom() then
		maPrint("Bottom: "..o:GetBottom())
	end
	if o:GetLeft() then
		maPrint("Left: "..o:GetLeft())
	end
	if o:GetHeight() then
		maPrint("Height: "..o:GetHeight())
	end
	if o:GetWidth() then
		maPrint("Width: "..o:GetWidth())
	end
	maPrint("Scale: "..o:GetScale())
	maPrint("Scale Effective: "..o:GetEffectiveScale())
	maPrint("Alpha: "..o:GetAlpha())
	maPrint("Alpha Effective: "..o:GetEffectiveAlpha())
	maPrint("Level: "..o:GetFrameLevel())
	maPrint("Strata: "..o:GetFrameStrata())
	if o.GetFrameType then
		maPrint("Type: "..o:GetFrameType())
	end
	if o:IsUserPlaced() then
		maPrint("Moved: "..o:IsUserPlaced())
	end
	if o:IsMovable() then
		maPrint("Movable: "..o:IsMovable())
	end
	if o:IsResizable() then
		maPrint("Resizable: "..o:IsResizable())
	end
	if o:IsToplevel() then
		maPrint("Top Level: "..o:IsToplevel())
	end
	if o:IsKeyboardEnabled() then
		maPrint("Keyboard: "..o:IsKeyboardEnabled())
	end
	if o:IsMouseEnabled() then
		maPrint("Mouse: "..o:IsMouseEnabled())
	end
	if o:IsMouseWheelEnabled() then
		maPrint("Mouse Wheel: "..o:IsMouseWheelEnabled())
	end

	local opts = self:GetFrameOptions(o:GetName())
	if opts ~= nil then
		maPrint("MA stored variables:")
		for i,v in pairs(opts) do
--[[
			if i == "cat" then
				maPrint("  category: "..v.helpfulName)
			elseif i ~= "name" then
			]]
			if i ~= "cat" and i ~= "name" then
				if v == true then
					maPrint("  "..i..": true")
				elseif v == false then
					maPrint("  "..i..": false")
				else
					maPrint("  "..i..": "..numfor(v))
				end
			end
		end
	end
end

SLASH_MADBG1 = "/madbg"
SlashCmdList["MADBG"] = function( msg )
	if msg == nil or msg == "" then
		MADebug()
		return
	end
	local f = _G[msg]
	if f == nil then
		maPrint(msg.." not found")
	else
		MovAny:Dump(f)
	end
end

function MADebug()
	local ct = 0
	maPrint("Frames: "..table.getn(MovAny.frames))
	for i, o in pairs(MovAny.frames) do
		ct = ct + 1
		if o.sep then
			maPrint(ct.." Category: "..MovAny.frames[i].helpfulName)
		else
			maPrint(ct.." Frame: "..MovAny.frames[i].name)
		end
	end
	
	ct = 0
	maPrint( table.getn( MoveAnything_CustomFrames ).." custom frames" )
	for i, v in pairs(MoveAnything_CustomFrames) do
		ct = ct + 1
		maPrint( ct.." "..v.name )
	end
	
	ct = 0
	maPrint( table.getn( MovAny.FrameOptions ).." frame options" )
	for i, v in pairs(MovAny.FrameOptions) do
		ct = ct + 1
		maPrint( ct.." : "..v.name )
	end
end

function MovAny:EnableFrame( fn )
	if fn==nil then
		return
	end

	local opts = self:GetFrameOptions(fn)
	if not opts then
		return
	end
	opts.disabled = nil
	
	local f = _G[fn]
	if not f then
		return
	end
	self:ApplyPosition(f, opts)
	self:ApplyScale(f, opts)
	self:ApplyAlpha(f, opts)
	self:ApplyHide(f, opts)
end

function MovAny:DisableFrame( fn )
	if fn==nil then
			return
	end
	self:StopMoving(fn)

	local opt = self:GetFrameOptions(fn)
	if not opt then
		return
	end
	opt.disabled = true

	local f = _G[fn]
	if not f then
		return
	end

	if f.OnMAPreReset then
		f.OnMAPreReset(frame)
	end

	self:ResetPosition(f, opt, true)
	self:ResetScale(f, opt, true)
	self:ResetAlpha(f, opt, true)
	self:ResetHide(f, opt, true)
	
	if opt and opt.UIPanelWindows then
		UIPanelWindows[ frameName ] = opt.UIPanelWindows
		if frame:IsShown() then
			frame:Hide()
			ShowUIPanel(frame)
		end
	end
end

MovAny.dbg = dbg

function MovAny:TooltipShow()
	if not this.tooltipText then
		return
	end
	if  (MADB.tooltips and not IsShiftKeyDown()) or (not MADB.tooltips and IsShiftKeyDown()) then
		GameTooltip:SetOwner(this, "ANCHOR_CURSOR")
		GameTooltip:ClearLines()
		GameTooltip:AddLine(this.tooltipText)
		GameTooltip:Show()
	end
end

function MovAny:TooltipHide()
	GameTooltip:Hide()
end

function MovAny:TooltipShowMultiline(reserved, parent, tooltipLines)
	if this and parent == nil then
		parent = this
	end
	if this and this.tooltipLines then
		tooltipLines = this.tooltipLines
	end
	if tooltipLines == nil then
		tooltipLines = parent.tooltipLines
	end
	if tooltipLines == nil then
		tooltipLines = MovAny:GetFrameTooltipLines(MovAny.frames[ parent.idx ].name)
	end
	if tooltipLines == nil then
		return
	end
	local g = 0
	for k in pairs(tooltipLines) do
		g = 1
		break
	end
	if i == 0 then
		return
	end
	if  (MADB.tooltips and not IsShiftKeyDown()) or (not MADB.tooltips and IsShiftKeyDown()) then
		GameTooltip:SetOwner(parent, "ANCHOR_CURSOR")
		GameTooltip:ClearLines()
		for i,v in ipairs(tooltipLines) do
			GameTooltip:AddLine(v)
		end
		GameTooltip:Show()
	end
end

function MovAny:GetFrameTooltipLines(fn)
	if not fn then
		return
	end
	
	local opts = MovAny:GetFrameOptions(fn)
	local o = MovAny:GetFrame(fn)
	local msgs = {}
	local enough = false
	local added = false
	
	table.insert(msgs, o.helpfulName or fn)
	if opts then
		if opts.hidden then
			if MovAny.HideList[ fn ] then
				table.insert(msgs, "Specially hidden")
			else
				table.insert(msgs, "Hidden")
			end
			enough = true
		end
	end
	if o and o.helpfulName and o.helpfulName ~= fn and fn ~= nil then
		table.insert(msgs, " ")
		table.insert(msgs, "Frame: "..fn)
	end
	if opts then
		if (opts.x ~= nil and opts.x > 0) or (opts.y ~= nil and opts.y > 0) then
			if not added then
				table.insert(msgs, " ")
			end
			table.insert(msgs, "Position: "..numfor(opts.x)..", "..numfor(opts.y))
			enough = true
			added = true
		end
		if opts.scale and (opts.scale < 0.9998 or opts.scale > 1.0002) then
			if not added then
				table.insert(msgs, " ")
			end
			table.insert(msgs, "Scale: "..numfor(opts.scale))
			enough = true
			added = true
		end
		if opts.alpha and (opts.alpha < 0.9998 or opts.alpha > 1.0002) then
			if not added then
				table.insert(msgs, " ")
			end
			table.insert(msgs, "Alpha: "..numfor(opts.alpha))
			enough = true
			added = true
		end
		
		added = false
		
		if (opts.x ~= nil and opts.x > 0 and opts.originalLeft) or (opts.y ~= nil and opts.y > 0 and opts.originalBottom) then
			if not added then
				table.insert(msgs, " ")
			end
			table.insert(msgs, "Original Position: "..numfor(opts.originalLeft)..", "..numfor(opts.originalBottom))
			enough = true
			added = true
		end
		if opts.originalScale and opts.scale and (opts.scale < 0.9998 and opts.scale > 1.0002) then
			if not added then
				table.insert(msgs, " ")
			end
			table.insert(msgs, "Original Scale: "..numfor(opts.originalScale))
			enough = true
			added = true
		end
		if opts.alpha and (opts.alpha < 0.9998 or opts.alpha > 1.0002) then
			if not added then
				table.insert(msgs, " ")
			end
			table.insert(msgs, "Original Alpha: 1.00")
			enough = true
			added = true
		end
	end
	--enough = true
	if  enough then
		return msgs
	else
		return {}
	end
	
end

--[[
MinimapTarget - target units using minimap blips 

Copyright (C) 2006-2009 Adirelle

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
--]]

MinimapTarget = { }
local MinimapTarget = MinimapTarget

--------------------------------------------------------------------------------
-- Extensible decorator
--------------------------------------------------------------------------------
local decorators = {}
function MinimapTarget:RegisterDecorator(func)
	assert(type(func) == "function")
	tinsert(decorators, func)
end

--------------------------------------------------------------------------------
-- Secure menu
--------------------------------------------------------------------------------

local ENTRY_HEIGHT = 16
local MENU_PADDING = 10
local MENU_SPACING = 0

local function SetupButton(self, f)
	f:RegisterForClicks("AnyUp")
	f:SetHeight(ENTRY_HEIGHT)
	f:SetPoint("RIGHT", self, "RIGHT", -MENU_PADDING, 0)
	f:SetHighlightTexture([[Interface\QuestFrame\UI-QuestTitleHighlight]])
	f:SetHighlightFontObject(GameFontHighlightSmallLeft)
	f:SetNormalFontObject(GameFontHighlightSmallLeft)
end

local function CreateSecureEntry(self)
	local f = CreateFrame("Button", nil, self, "SecureActionButtonTemplate")
	SetupButton(self, f)
	return f
end

local function AddTarget(self, label, macro)
	local index = self.entryCount + 1
	local entry = self.entries[index]
	if not entry then
		entry = CreateSecureEntry(self)
		self.entries[index] = entry
	end
	entry:SetText(label)
	entry:SetAttribute('type', 'macro')
	entry:SetAttribute('macrotext', macro)
	entry:Show()
	self.entryCount = index
	self.dirty = true	
end

local function AddCancel(self)
	local f = self.cancelButton
	if not f then
		f = CreateFrame("Button", nil, self)
		SetupButton(self, f)
		f:SetText(CANCEL)
		f:SetScript('OnClick', function() self:Hide() end)
		f:SetPoint('BOTTOMLEFT', self, 'BOTTOMLEFT', MENU_PADDING, MENU_PADDING)
		self.cancelButton = f
	end
	self.dirty = true
	f:Show()
end

local function Layout(self)
	local width = self.cancelButton and self.cancelButton:GetTextWidth() or 0
	for index, entry in ipairs(self.entries) do
		if entry:IsShown() then
			entry:SetPoint("TOPLEFT", self, "TOPLEFT", MENU_PADDING, - MENU_PADDING - (index-1) * (ENTRY_HEIGHT+MENU_SPACING))
			width = math.max(width, entry:GetTextWidth())
		end
	end
	self:SetWidth(2 * MENU_PADDING + width)
	local n = self.entryCount + 1
	self:SetHeight(2 * MENU_PADDING + ENTRY_HEIGHT * n + MENU_SPACING * (n - 1))
	self.dirty = nil
end

local function Clear(self)
	self.entryCount = 0
	for i, entry in ipairs(self.entries) do
		entry:Hide()
	end
	self.dirty = true
end

local menuBackdrop = {
	bgFile = [[Interface\Tooltips\UI-Tooltip-Background]], tile = true, tileSize = 16,
	edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]], edgeSize = 16,
	insets = { left = 5, right = 5, top = 5, bottom = 5 },
}

local function CreateMenu()
	local f = CreateFrame("Frame", nil, UIParent)
	f:SetBackdrop(menuBackdrop)
	f:SetBackdropBorderColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b);
	f:SetBackdropColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r, TOOLTIP_DEFAULT_BACKGROUND_COLOR.g, TOOLTIP_DEFAULT_BACKGROUND_COLOR.b);
	f:Hide()
	local elapsed = 0	
	f:SetScript('OnShow', function() elapsed = 0 end)
	f:SetScript('OnUpdate', function(self, delta)
		if self.dirty then Layout(self) end
		if MouseIsOver(self) then
			elapsed = 0
		elseif elapsed > 0.5 then
			self:Hide()
		else
			elapsed = elapsed + delta
		end
	end)
	f:SetScript('OnEvent', f.Hide)
	f:RegisterEvent('PLAYER_REGEN_DISABLED')
	f.entries = {}
	f.entryCount = 0
	f.Clear = Clear
	f.AddTarget = AddTarget
	f.AddCancel = AddCancel
	f.Layout = Layout
	return f
end

--------------------------------------------------------------------------------
-- Core
--------------------------------------------------------------------------------

local OldPingLocation
local menuFrame
local targets = {}

local ExtractNameFromLine
if _G.BGMinimapPlayerTracker_OnUpdate then
	ExtractNameFromLine = function(line)
		if line:find("|c.*%[") then
			return line:match("|c%x%x%x%x%x%x%x%x([^|]+)|c%x%x%x%x%x%x%x%x%[.+%]")
		elseif line:find("|c") then
			return line:match("|c%x%x%x%x%x%x%x%x([^|]+)|r")
		else
			return line
		end	
	end
else
	ExtractNameFromLine = function(line)
		if line:find("|c") then
			return line:match("|c%x%x%x%x%x%x%x%x([^|]+)|r")
		else
			return line
		end	
	end
end

local function GetAnchor()
	local x, y = GetCursorPosition()
	local s = UIParent:GetEffectiveScale()
	local ySide, xSide, xOffset, yOffset = "TOP", "RIGHT", 10, 10
	x, y = x/s, y/s	
	if x < UIParent:GetWidth() / 2 then
		xSide, xOffset = "LEFT", -xOffset
	end
	if y < UIParent:GetHeight() / 2 then
		ySide, yOffset = "BOTTOM", -yOffset
	end
	return ySide..xSide, UIParent, "BOTTOMLEFT", x + xOffset, y + yOffset
end

local function NewPingLocation(...)
	-- Right now, using arg1 is the only way to catch right clicks, even with SexyMap or Chinchilla in the way
	if arg1 == "RightButton" then
		if GameTooltip:IsVisible() and not InCombatLockdown() then
			local tooltipContent = GameTooltipTextLeft1:IsVisible() and GameTooltipTextLeft1:GetText()
			if tooltipContent then
				wipe(targets)
				for line in tooltipContent:gmatch("[^\n]+") do
					local target = ExtractNameFromLine(line)
					if target then
						local label = target						
						for i, decorator in pairs(decorators) do
							label = decorator(label, target) or label
						end
						targets[label] = (target:find("[- ]") and "/target " or "/targetexact ")..target
					end
				end
				if next(targets) then
					if not menuFrame then
						menuFrame = CreateMenu()
					else
						menuFrame:Clear()
					end
					for label, macro in pairs(targets) do
						menuFrame:AddTarget(label, macro)
					end
					menuFrame:AddCancel()
					menuFrame:ClearAllPoints()
					menuFrame:SetPoint(GetAnchor())
					menuFrame:Show()
				end
			end
		end
		return -- Don't "ping" if no tooltip is shown to prevent mispings
	end
	return OldPingLocation(...)
end

local MinimapMethods = getmetatable(Minimap).__index
OldPingLocation, MinimapMethods.PingLocation = MinimapMethods.PingLocation, NewPingLocation


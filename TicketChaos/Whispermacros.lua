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

CurrentEditing = nil;

function Toggle_Whisper_Macros()
	local frame = getglobal("Whisper_Macros");
	if (frame) then
		if(	frame:IsVisible() ) then
			frame:Hide();
		else
			frame:Show();
		end
	end
end

function WhisperMacrosDropdown_OnLoad()
	if WhisperMacros then
		local WhisperMacrosTemp = pairsByKeys2(WhisperMacros);
		for index,name in pairs(WhisperMacrosTemp) do
			info = {};
			info.text = name;
			info.value = name;
			info.func = EditWhisperMacro;
			info.owner = this:GetParent();
			UIDropDownMenu_AddButton(info);
		end
	end
end

function EditWhisperMacro()
	CurrentEditing = this.value;
	Whisper_Macros_Name:SetText(this.value);
	Whisper_Macros_MacroEdit:SetText(WhisperMacros[this.value]);
	Whisper_Macros_Save:SetText("Save");
end

function SaveOrAddMacro()
	local name = Whisper_Macros_Name:GetText();
	local macro = Whisper_Macros_MacroEdit:GetText();
	
	if name and macro and name ~= "" then
		WhisperMacros[name] = macro;
		
		if CurrentEditing then
			if (name ~= CurrentEditing) then
				WhisperMacros[CurrentEditing] = nil;
				CurrentEditing = name;
			end
		else
			CurrentEditing = name;
			Whisper_Macros_Save:SetText("Save");
		end
	end
end

function CleanMacroForm()
	CurrentEditing = nil;
	Whisper_Macros_Name:SetText("");
	Whisper_Macros_MacroEdit:SetText("");
	Whisper_Macros_Save:SetText("Add");
end

function LoadWhisperMacros()
	if not WhisperMacros then
		WhisperMacros = {};
	end
end

local L = LibStub("AceLocale-3.0"):NewLocale("MacroBank", "ruRU", false);
if not L then return end
L["AcceptIcon"] = "Принять"
L["AcceptIconDesc"] = "Принять эту иконку."
-- L["Accept new Macro from %s?"] = "Accept new Macro from %s?"
-- L["AutoLoad"] = "Auto Load"
-- L["AutoLoadDesc"] = "Settings for automatically loading macro groups."
-- L["AutoOpenMacroBank"] = "Auto Open MacroBank"
-- L["AutoOpenMacroBankDesc"] = "Open MacroBank window when opening the main macro window."
L["CancelDesc"] = "Закрыть это меню"
L["Can't find category"] = "Невозможно найти категорию"
L["Can't load macros in combat"] = "Невозможно загрузить макрос в бою" -- Needs review
L["Category"] = "Категория"
-- L["Category?"] = "Category?"
L["CategoryDesc"] = [=[Назначить категорию для выбранного макроса.
(Сохраняется при нажатии клавиши Enter)]=]
-- L["Char"] = "Char"
L["CharCategory"] = "Категория персонажа"
-- L["CharCategoryDesc"] = "Select a category of macros to load into the character macros."
L["CharDesc"] = "Загрузить макрос в раздел персонажа" -- Needs review
L["Create"] = "Создать"
L["CreateDesc"] = "Создать новый макрос в банке макросов" -- Needs review
-- L["Default"] = "Default"
-- L["DefaultCategoryDesc"] = "Set the category for macros that are created or saved."
-- L["DefaultDescriptionDesc"] = "Set the description for macros that are created or saved."
-- L["DefaultNameDesc"] = "Set the name for macros that are created or saved."
L["Delete"] = "Удалить"
-- L["Delete Char Macros"] = "Delete Char Macros"
L["DeleteDesc"] = "Удалить выбранный макрос из банка макросов."
-- L["Delete Global Macros"] = "Delete Global Macros"
-- L["Delete Macro %s?"] = "Delete Macro %s?"
-- L["Delete Macros On AutoLoad Desc"] = "If any macros are selected to auto load, the current macros will be deleted before loading."
L["Description"] = "Описание"
--[==[ L["DescriptionDesc"] = [=[Sets a brief description of this macro.
(Saves when you press enter)]=] ]==]
-- L["FromMacroBank"] = "<-----"
-- L["Global"] = "Global"
-- L["GlobalCategory"] = "Global Category"
-- L["GlobalCategoryDesc"] = "Select a category of macros to load into the global macros."
L["GlobalDesc"] = "Загрузить макрос в общий раздел"
-- L["Guild"] = "Guild"
L["Icon"] = "Иконка"
L["IconDesc"] = "Назначить иконку для выбранного макроса"
-- L["Load"] = "Load"
-- L["LoadCategory"] = "LoadCategory"
L["LoadCategoryDesc"] = "Загружает категорию или отдельный макрос из категории"
--[==[ L["LoadDesc"] = [=[Load a macro with one from the macro bank.
Shift-clicking will load the entire category.
(If a macro with the same name exists, it will be replaced)]=] ]==]
-- L["LoadPreMade"] = "Load Macros"
-- L["LoadPreMadeDesc"] = "Loads the pre-made macros from PreMadeMacros.lua"
-- L["Login Group"] = "Login Group"
-- L["Login Group Desc"] = "Which macros will load when you login."
-- L["Macro"] = "Macro"
-- L["MacroBank"] = "MacroBank"
-- L["MacroBank User"] = "MacroBank User"
-- L["MacroDefaults"] = "Macro Defaults"
-- L["MacroDefaultsDesc"] = "Default settings for macros that are created or saved."
--[==[ L["MacroDesc"] = [=[Sets the macro body for the selected macro.
(Saves when you press escape or leave this edit box)]=] ]==]
-- L["MacroOptions"] = "Macro Options"
-- L["MacroOptionsDesc"] = "Settings for how MacroBank behaves."
L["MacroScrollLine"] = "Список макросов"
L["MacroScrollLineDesc"] = "Выбрать макрос для изменения, загрузки или удаления"
-- L["Name"] = "Name"
--[==[ L["NameDesc"] = [=[Sets the name for the selected macro.
Used for loading new.
(Saves when you press enter)]=] ]==]
-- L["None"] = "None"
-- L["Non-MacroBank User"] = "Non-MacroBank User"
L["Not enough room to load macro"] = "Недостаточно места для загрузки макроса"
-- L["On Login"] = "On Login"
-- L["On Talent Swap"] = "On Talent Swap"
L["Options"] = "Опции"
L["OptionsDesc"] = "Отобразить окно опций"
-- L["Party"] = "Party"
-- L["Player"] = "Player"
-- L["Pre-Made Macros"] = "Pre-Made Macros"
L["Primary Talent Spec Group"] = "Группа первого набора талантов" -- Needs review
-- L["Primary Talent Spec Group Desc"] = "Which macros will load when you switch to your primary talents."
-- L["Raid"] = "Raid"
-- L["ReceivedCategory"] = "Received Category"
-- L["ReceivedCategoryDesc"] = "Set the category for macros that are received. (Use %s as a variable for the sender)"
-- L["RememberPosition"] = "Remember Position"
-- L["RememberPositionDesc"] = "Remembers the position of the MacroBank window when moved."
L["Replace"] = "Заменить" -- Needs review
-- L["ReplaceDesc"] = "Replaces a macro with one from the macro bank."
-- L["ReplaceIconDesc"] = "Replace the icon with the one from MacroBank."
-- L["ReplaceNameDesc"] = "Replace the name with the one from MacroBank."
-- L["ReplaceOptions"] = "Replace Options"
-- L["ReplaceOptionsDesc"] = "Change how the replace button behaves."
-- L["ResetAnchor"] = "Reset Anchor"
-- L["ResetAnchorDesc"] = "Resest the MacroBank window to it's default location."
-- L["%s Accepted your macro"] = "%s Accepted your macro"
L["Save"] = "Сохранить"
L["SaveDesc"] = "Сохранить выбранный макрос в банке макросов."
L["Secondary Talent Spec Group"] = "Группа второго набора талантов" -- Needs review
-- L["Secondary Talent Spec Group Desc"] = "Which macros will load when you switch to your secondary talents."
-- L["Send selected macro to"] = "Send selected macro to"
-- L["Sends the currently selected macro to another MacroBank user."] = "Sends the currently selected macro to another MacroBank user."
-- L["Sends the currently selected macro to another user."] = "Sends the currently selected macro to another user."
-- L["SendTo"] = "Send To"
-- L["SlashCmd1"] = "macrobank"
-- L["SlashCmd2"] = "mb"
-- L["%s Rejected your macro"] = "%s Rejected your macro"
L["TempCategory"] = "Временная категория" -- Needs review
L["TempDescription"] = "Временное описание" -- Needs review
-- L["TempName"] = "Temp Name"
-- L["TempReceivedCategory"] = "From %s"
-- L["ToMacroBank"] = "----->"
-- L["UseNameForDescription"] = "Use name for description"
-- L["UseNameForDescriptionDesc"] = "Use the name of the macro as the description instead of the default description for macros being saved."


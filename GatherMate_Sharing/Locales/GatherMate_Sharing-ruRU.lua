local L = LibStub("AceLocale-3.0"):NewLocale("GatherMate_Sharing","ruRU")
if not L then return end
--Translated by StingerSoft (Eritnull aka Шептун)
-- Addon name
L["Gathermate_Sharing"] = "Gathermate_Sharing"
L["MODULE_DESC"] = "GatherMate_Sharing позволяет вам делится данными с другими игроками из вашей Гильдии, автоматически добавляя/удаляя ноды и используя их."

-- Configuration
L["Enable GatherMate_Sharing"] = "Включить Gathermate_Sharing"
L["Enable or disable syncing of GatherMate data with other players."] = "Включает/Выключает синхронизацию данных GatherMate с другими игроками."
L["Gathermate_Sharing Options"] = "Настройки Gathermate_Sharing"
L["Sync node additions"] = "Синхр. пополнение нодов"
L["When other players add nodes to their GatherMate, automatically add the same node to your database too."] = "Когда другие игроки добавляют ноды в их GatherMate, автоматически теже нод добавляется и в вашу базу данных."
L["Sync node deletions"] = "Синхр. удаление нодов"
L["When other players delete nodes from their GatherMate, automatically delete the same node from your database too."] = "Когда другие игроки удаляют ноды из их GatherMate, автоматически теже нод удаляются и из вашей базы данных."
L["Sync Channel"] = "Канал синхр."
L["Communication channel to send sync messages."] = "Канал для отсылки синхронизационных сообщений"
L["GUILD"] = "Гильдия"
L["NONE"] = "Нету"
L["PARTY"] = "Группа"
L["RAID"] = "Рейд (включая Группу)"
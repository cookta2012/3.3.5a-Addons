local L = LibStub("AceLocale-3.0"):NewLocale("GatherMate_Sharing","enUS",true)

-- Addon name
L["Gathermate_Sharing"] = true
L["MODULE_DESC"] = "GatherMate_Sharing allows you to share data with other players in your GUILD by automatically adding/deleting nodes and broadcasting them."

-- Configuration
L["Enable GatherMate_Sharing"] = true
L["Enable or disable syncing of GatherMate data with other players."] = true
L["Gathermate_Sharing Options"] = true
L["Sync node additions"] = true
L["When other players add nodes to their GatherMate, automatically add the same node to your database too."] = true
L["Sync node deletions"] = true
L["When other players delete nodes from their GatherMate, automatically delete the same node from your database too."] = true
L["Sync Channel"] = true
L["Communication channel to send sync messages."] = true
L["GUILD"] = "Guild"
L["NONE"] = "None"
L["PARTY"] = "Party"
L["RAID"] = "Raid (includes Party)"

local L = LibStub("AceLocale-3.0"):NewLocale("GatherMate_Sharing","frFR")
if not L then return end
-- Addon name
L["Gathermate_Sharing"] = "Gathermate_Sharing"
L["MODULE_DESC"] = "GatherMate_Sharing vous permet de partager des données avec d'autres joueurs de votre GUILDE en ajoutant/supprimant automatiquement les nœuds et en les diffusant."

-- Configuration
L["Enable GatherMate_Sharing"] = "Activer GM_Sharing"
L["Enable or disable syncing of GatherMate data with other players."] = "Active ou désactive la synchronisation des données de GatherMate avec les autres joueurs."
L["Gathermate_Sharing Options"] = "Options de GatherMate_Sharing"
L["Sync node additions"] = "Ajouts de nœuds par sync"
L["When other players add nodes to their GatherMate, automatically add the same node to your database too."] = "Quand un autre joueur ajoute un nœud à son GatherMate, ajoute également automatiquement le même nœud à votre base de données."
L["Sync node deletions"] = "Retraits de nœuds par sync"
L["When other players delete nodes from their GatherMate, automatically delete the same node from your database too."] = "Quand un autre joueur supprime un nœud de son GatherMate, supprime également automatiquement le même nœud de votre base de données."

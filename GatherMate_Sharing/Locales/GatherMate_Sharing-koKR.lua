local L = LibStub("AceLocale-3.0"):NewLocale("GatherMate_Sharing","koKR")
if not L then return end

-- Addon name
L["Gathermate_Sharing"] = "데이터 공유"
L["MODULE_DESC"] = "데이터 공유란? 현재 캐릭터가 포함되어 있는 길드/파티(공격대)의 다른 플레이어와 GatherMate의 데이터를 공유합니다. 선택에 따라 자동으로 데이터를 추가하거나 삭제합니다."

-- Configuration
L["Enable GatherMate_Sharing"] = "데이터 공유 가능"
L["Enable or disable syncing of GatherMate data with other players."] = "다른 플레이어와의 데이터를 공유합니다."
L["Gathermate_Sharing Options"] = "데이터 공유 설정"
L["Sync node additions"] = "노드 추가 공유"
L["When other players add nodes to their GatherMate, automatically add the same node to your database too."] = "다른 플레이어의 노드가 추가 됐을 경우 자동으로 내 데이터에도 추가됩니다."
L["Sync node deletions"] = "노드 삭제 공유"
L["When other players delete nodes from their GatherMate, automatically delete the same node from your database too."] = "다른 플레이어의 노드가 삭제 됐을 경우 자동으로 내 데이터도 삭제됩니다."
L["Sync Channel"] = "동기화 채널"
L["Communication channel to send sync messages."] = "데이터를 공유할 동기화 메시지를 주고받을 채널을 선택합니다."
L["GUILD"] = "길드"
L["NONE"] = "없음"
L["PARTY"] = "파티"
L["RAID"] = "공격대 (파티상태 포함)"

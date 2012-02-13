-- Version : Chinese (by onlyfly)
-- Update : 2007/12/25
--[[
	MapNotes: Adds a note system to the WorldMap and other AddOns that use the Plugins facility provided

	See the README file for more information.
]]

-- English is the default localization for MapNotes
if GetLocale() == "zhCN" then

-- General
MAPNOTES_NAME = "MapNotes";
MAPNOTES_ADDON_DESCRIPTION = "在世界地图上增加标记功能.";
MAPNOTES_DOWNLOAD_SITES = "查看README文件了解下载网站信息.";

-- Interface Configuration
MAPNOTES_WORLDMAP_HELP_1 = "地图上右键单击缩小地图";
MAPNOTES_WORLDMAP_HELP_2 = "地图上左键单击放大地图";
MAPNOTES_WORLDMAP_HELP_3 = "在地图上使用「Control +右键」以开启 "..MAPNOTES_NAME.." 菜单";
MAPNOTES_CLICK_ON_SECOND_NOTE = "|cFFFF0000"..MAPNOTES_NAME..":|r 选择第二个标记以创建/清除一条线";

MAPNOTES_NEW_MENU = MAPNOTES_NAME;
MAPNOTES_NEW_NOTE = "创建标记";
MAPNOTES_MININOTE_OFF = "关闭小地图标记";
MAPNOTES_OPTIONS = "选项";
MAPNOTES_CANCEL = "取消";

MAPNOTES_POI_MENU = MAPNOTES_NAME;
MAPNOTES_EDIT_NOTE = "编辑标记";
MAPNOTES_MININOTE_ON = "设置为小地图标记";
MAPNOTES_SPECIAL_ACTIONS = "特殊操作";
MAPNOTES_SEND_NOTE = "发送标记";

MAPNOTES_SPECIALACTION_MENU = "特殊操作";
MAPNOTES_TOGGLELINE = "创建/清除线条";
MAPNOTES_DELETE_NOTE = "删除标记";

MAPNOTES_EDIT_MENU = "编辑标记";
MAPNOTES_SAVE_NOTE = "保存";
MAPNOTES_EDIT_TITLE = "标题(必填):";
MAPNOTES_EDIT_INFO1 = "注释1 (可选):";
MAPNOTES_EDIT_INFO2 = "注释2 (可选):";
MAPNOTES_EDIT_CREATOR = "创建者 (可选):";

MAPNOTES_SEND_MENU = "发送标记";
MAPNOTES_SLASHCOMMAND = "改变模式";
MAPNOTES_SEND_TITLE = "发送标记:";
MAPNOTES_SEND_TIP = "这些标记可以被其他地图标记使用者接收\n('发送给队友'功能必须配合MapNotes(Fan's Update)才可使用)";
MAPNOTES_SEND_PLAYER = "输入玩家名:";
MAPNOTES_SENDTOPLAYER = "发送给玩家";
MAPNOTES_SENDTOPARTY = "发送给队友";
MAPNOTES_SENDTOPARTY_TIP = "左键单击 - 小队\n右键单击 - 团队";
MAPNOTES_SHOWSEND = "改变模式";
MAPNOTES_SEND_SLASHTITLE = "得到斜线命令:";
MAPNOTES_SEND_SLASHTIP = "选中这些并使用CTRL+C 复制到剪切板\n(之后可以将它进行上传论坛等处理)";
MAPNOTES_SEND_SLASHCOMMAND = "/Command:";

MAPNOTES_OPTIONS_MENU = "选项";
MAPNOTES_SAVE_OPTIONS = "保存";
MAPNOTES_OWNNOTES = "显示自己创建的标记";
MAPNOTES_OTHERNOTES = "显示收到的标记";
MAPNOTES_HIGHLIGHT_LASTCREATED = "高亮提示最后创建的标记为|cFFFF0000红色|r";
MAPNOTES_HIGHLIGHT_MININOTE = "高亮提示最后选择为小地图标记的标记为|cFF6666FF蓝色|r";
MAPNOTES_ACCEPTINCOMING = "接受其他玩家传入的标记";
MAPNOTES_INCOMING_CAP = "如果可接收标记少于5个则拒收标记";
MAPNOTES_AUTOPARTYASMININOTE = "自动将团队标记设为小地图标记.";

MAPNOTES_CREATEDBY = "创建人：";
MAPNOTES_CHAT_COMMAND_ENABLE_INFO = "这个命令允许你插入从其他地方得到的标记(如网页)."; 
MAPNOTES_CHAT_COMMAND_ONENOTE_INFO = "忽略选项设置,使你可以接收下一个传入的标记."; 
MAPNOTES_CHAT_COMMAND_MININOTE_INFO = "将下一个传入的标记直接设置为小地图标记(同时在地图上插入标记):"; 
MAPNOTES_CHAT_COMMAND_MININOTEONLY_INFO = "将下一个传入的标记仅设置为小地图标记(不在地图上插入标记)."; 
MAPNOTES_CHAT_COMMAND_MININOTEOFF_INFO = "关闭小地图标记."; 
MAPNOTES_CHAT_COMMAND_MNTLOC_INFO = "在地图上创建tloc标记."; 
MAPNOTES_CHAT_COMMAND_QUICKNOTE = "在地图上创建当前位置的标记."; 
MAPNOTES_CHAT_COMMAND_QUICKTLOC = "在当前区域地图上创建一个tloc制定位置的标记.";
 
MAPNOTES_CHAT_COMMAND_SEARCH = "查找包含 [文字] 的标记";
MAPNOTES_CHAT_COMMAND_HIGHLIGHT = "高亮显示具有 [标题] 的标记";

MAPNOTES_CHAT_COMMAND_IMPORT_METAMAP = "导入 MetaMap 的标记。这个功能可以使你转移到 MapNotes。\nMetaMap 必须安装并启用才可使用该命令。 然后就可以移除 MetaMap 了.\n警告 : 这个功能仅为MapNotes新用户设计。否则可能覆盖你原有的标记."; --Telic_4
MAPNOTES_CHAT_COMMAND_IMPORT_ALPHAMAP = "导入 AlphaMap 的副本标记 : 需要 AlphaMap 已安装并启用.";		--Telic_4

MAPNOTES_CHAT_COMMAND_SCALE = "改变窗口大小";
MAPNOTES_CHAT_COMMAND_ISCALE = "改变标记图标大小";
MAPNOTES_CHAT_COMMAND_ASCALE = "改变标记图标透明度";

MAPNOTES_CHAT_COMMAND_UNDELETE = "还原最后删除的标记";

MAPNOTES_MAPNOTEHELP = "这个命令只能用来创建标记";
MAPNOTES_ONENOTE_OFF = "允许一个标记传入: 关";
MAPNOTES_ONENOTE_ON = "允许一个标记传入: 开";
MAPNOTES_MININOTE_SHOW_0 = "下一个传入标记做为小地图标记: 关";
MAPNOTES_MININOTE_SHOW_1 = "下一个传入标记做为小地图标记:  开";
MAPNOTES_MININOTE_SHOW_2 = "下一个传入标记做为小地图标记:  仅小地图标记";
MAPNOTES_DECLINE_SLASH = "无法增加，太多标记在|cFFFFD100%s|r."; 
MAPNOTES_DECLINE_SLASH_NEAR = "无法增加,这个标记太接近|cFFFFD100%q|r在|cFFFFD100%s|r."; 
MAPNOTES_DECLINE_GET = "无法接收|cFFFFD100%s|r传入的标记:太多标记在|cFFFFD100%s|r,或设置中禁止接收该标记."; 
MAPNOTES_ACCEPT_SLASH = "标记增加到了|cFFFFD100%s|r的地图上."; 
MAPNOTES_ACCEPT_GET = "你接收到一个从|cFFFFD100%s|r发来的标记在|cFFFFD100%s|r."; 
MAPNOTES_PARTY_GET = "|cFFFFD100%s|r在|cFFFFD100%s|r设置了一个新的团队标记."; 
MAPNOTES_DECLINE_NOTETONEAR = "|cFFFFD100%s|r试图给你发送一个在|cFFFFD100%s|r的标记,但是它太接近|cFFFFD100%q|r了."; 
MAPNOTES_QUICKNOTE_NOTETONEAR = "无法创建标记.你太接近|cFFFFD100%s|r了."; 
MAPNOTES_QUICKNOTE_NOPOSITION = "无法创建标记:无法得到当前位置."; 
MAPNOTES_QUICKNOTE_DEFAULTNAME = "快速标记";
MAPNOTES_QUICKNOTE_OK = "在地图|cFFFFD100%s|r上创建标记."; 
MAPNOTES_QUICKNOTE_TOOMANY = "已经有太多标记在|cFFFFD100%s|r的地图上了."; 
MAPNOTES_DELETED_BY_NAME = "已删除所有由%s以及%s所创建的地图标记."; 
MAPNOTES_DELETED_BY_CREATOR = "已删除所有由%s所建立的地图标记."; 
MAPNOTES_QUICKTLOC_NOTETONEAR = "无法创建标记.位置太接近标记|cFFFFD100%s|r了."; 
MAPNOTES_QUICKTLOC_NOZONE = "无法创建标记:无法得到当前区域."; 
MAPNOTES_QUICKTLOC_NOARGUMENT = "用法: '/quicktloc xx,yy [icon] [title]'."; 
MAPNOTES_SETMININOTE = "将标记设置为新的小地图标记"; 
MAPNOTES_THOTTBOTLOC = "Thottbot坐标"; 
MAPNOTES_PARTYNOTE = "团队标记";
MAPNOTES_WFC_WARN = "使用 |c0000FF00'/mn -tloc xx,yy'|r 或 |c0000FF00'/mntloc xx,yy'|r 来 显示地图上的位置.";

MAPNOTES_CONVERSION_COMPLETE = MAPNOTES_VERSION.." - 转换完毕,请勿重复执行这个指令.";		-- ??

MAPNOTES_TRUNCATION_WARNING = "The Note Text being Sent had to be truncated";				-- ??

MAPNOTES_IMPORT_REPORT = " 标记已导入";								-- ??
MAPNOTES_NOTESFOUND = " 找到标记";									-- ??

-- Drop Down Menu
MAPNOTES_SHOWNOTES = "显示标记";
MAPNOTES_DROPDOWNTITLE = MAPNOTES_NAME;
MAPNOTES_DROPDOWNMENUTEXT = "快捷选项";

MAPNOTES_WARSONGGULCH = "战歌峡谷";
MAPNOTES_ALTERACVALLEY = "奥特兰克山谷";
MAPNOTES_ARATHIBASIN = "阿拉希盆地";
MAPNOTES_NETHERSTORM = "风暴之眼";

MAPNOTES_COSMIC = "Cosmic";


-- Coordinates
MAPNOTES_MAP_COORDS = "地图坐标";
MAPNOTES_MINIMAP_COORDS = "小地图坐标";
MAPNOTES_COORDINATE_FORMATTING_ERROR1 = "MapNotes 无法处理传入的坐标";
MAPNOTES_COORDINATE_FORMATTING_ERROR2 = "最简单的格式 : x,y    例如 55,9";
MAPNOTES_COORDINATE_FORMATTING_ERROR3 = "查看 Readme.txt 了解其他格式选项";

-- MapNotes Target & Merging
MAPNOTES_MERGED = "MapNote 合并为 : ";
MAPNOTES_MERGE_DUP = "MapNote 已存在 : ";
MAPNOTES_MERGE_WARNING = "你必须有目标才能合并标记.";

BINDING_HEADER_MAPNOTES = "地图标记";
BINDING_NAME_MN_TARGET_NEW = "快速标记/目标标记";
BINDING_NAME_MN_TARGET_MERGE = "合并目标标记";
BINDING_NAME_MN_TOGGLE_MINIS = "全部小地图标记切换";

MN_LEVEL = "Level";

-- Magellan Style LandMarks
MAPNOTES_LANDMARKS = "地标";				-- Landmarks, as in POI, or Magellan
MAPNOTES_LANDMARKS_CHECK = "自动标记地图 "..MAPNOTES_LANDMARKS;
MAPNOTES_DELETELANDMARKS = "删除 "..MAPNOTES_LANDMARKS;
MAPNOTES_MAGELLAN = "(~Magellan)";
MAPNOTES_LM_CREATED = " 地图标记创建于 ";
MAPNOTES_LM_MERGED = " 地图标记合并于 ";
MAPNOTES_LM_SKIPPED = " 地图标记未做标记于 ";
MAPNOTES_LANDMARKS_NOTIFY = MAPNOTES_LANDMARKS.." 标记于 ";

MN_STARTED_IMPORTING = "开始导入";
MN_INVALID_KEY = "无效的地图键 : ";
MN_FINISHED_IMPORTING = "完成导入";
MN_AREANOTES = "%d 标记于 %d 地区";
MN_DUPS_IGNORED = "忽视副本";

MN_WAYPOINT = "路径箭头";

end

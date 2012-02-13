--[[
    Project: AtlasMajorCities English NPC Plugin
    Author: modefanz.eu ~ Modefanz Coding Team
    Discripton: English NPC Plugin for AtlasMajorCities.
    Release Date: May.2009
    Release Version: 1.5
    Internal: AMC.enUS.15
]]--
--$Id: amc_zhTW.lua 44 2009-07-18 13:24:28Z arith $
if ( GetLocale() == "zhTW" ) then

AMCLocale = {

	--Common	
  ["Major Cities"] = 	"主城地圖";
  ["Dalaran"] = 		"中立: 達拉然 ";
  ["Dal Sewers"] = 		"中立: 達拉然下水道";
  ["Darnassus"] = 		"聯盟: 達納蘇斯 - 夜精靈";
  ["Ironforge"] = 		"聯盟: 鐵爐堡 - 矮人";
  ["Orgrimmar"] = 		"部落: 奧格瑪 - 獸人";
  ["Stormwind"] = 		"聯盟: 暴風城 - 人類";
  ["Thunder Bluff"] = 	"部落: 雷霆崖 - 牛頭人";
  ["Undercity"] = 		"部落: 幽暗城 - 不死族";
  ["Shattrath"] = 		"中立: 撒塔斯城";
  ["Silvermoon"] = 		"部落: 銀月城 - 血精靈";
  ["Exodar"] = 			"聯盟: 艾克索達 - 德萊尼";
  
  --Locations  
  ["Crystalsong"] = 	"水晶之歌森林";
  ["Teldrassil"] = 		"泰達希爾";
  ["Dun Morogh"] = 		"丹莫洛";
  ["Durotar"] = 		"杜洛塔";
  ["Elwynn Forest"] = 	"艾爾文森林";
  ["Mulgore"] = 		"莫高雷";
  ["Tirisfal Glades"] = "提里斯法林地";
  ["Terokkar Forest"] = "泰洛卡森林";
  ["Eversong Woods"] = 	"永歌森林";
  ["Azuremyst Isle"] = 	"藍謎島";

  ---Common Names, Items & Buildings  
  ["Inn"] = "旅館";
  ["Mailbox"] = "郵箱";
  ["Forge"] = "熔爐";
  ["Stove"] = "烹飪火爐";
  ["AH"] = "拍賣場";
  ["Bank"] = "銀行";
  ["Bshop"] = "美容沙龍";
  ["Alliance Brigadier"] = "聯盟准將";
  ["Ancients Emmissary"] = "遠祖灘頭密使";
  ["E Dummy"] = "專家的訓練假人";
  ["M Dummy"] = "大師的訓練假人";
  ["G Dummy"] = "領導者的訓練假人";
  ["H Dummy"] = "英雄訓練假人";
  ["Bows"] = 				"          弓";
  ["Fist Weapons"] = 		"          拳套";
  ["Staves"] = 				"          法杖";
  ["Thrown"] = 				"          投擲武器";
  ["Daggers"] = 			"          匕首";
  ["Crossbow"] = 			"          弩";
  ["Guns"] = 				"          槍械";
  ["Polearms"] = 			"          長柄武器";
  ["One-Handed Maces"] = 	"          單手錘";
  ["Two-Handed Maces"] = 	"          雙手錘";
  ["Two-Handed Sword"] = 	"          雙手劍";
  ["One-Handed Sword"] = 	"          單手劍";
  ["One-Handed Axes"] = 	"          單手斧";
  ["Two-Handed Axes"] = 	"          雙手斧";
  ["PorStor"] = "暴風城傳送門";
  ["PorIron"] = "鐵爐堡傳送門";
  ["PorDarn"] = "達納蘇斯傳送門";
  ["PorExod"] = "艾克索達傳送門";
  ["PorShat"] = "撒塔斯城傳送門";
  ["PorOrgr"] = "奧格瑪傳送門";
  ["PorUnde"] = "幽暗城傳送門";
  ["PorSilv"] = "銀月城傳送門";
  ["PorThBl"] = "雷霆崖傳送門";
  
  --NPC Dalaran 達拉然
  --White
  ["Krasus Landing"] = "卡薩斯平臺";

  ["Aludane Whitecloud"] = "艾魯丹·白雲 <飛行管理員>";

  ["Hira Snowdawn"] = "席拉·雪晨 <寒冷氣候飛行訓練師>";

  ["Officer Van Rossem"] = "軍官凡·羅森";

  ["Sky-Reaver Klum"] = "空奪者克朗";

  --Orng
  ["Runeweaver Square"] = "織符者廣場";

  ["Entrance to the Sewers"] = "下水道入口";

  ["Magical Menagerie"] = "魔法動物園";
  ["Mei Francis"] = "梅·法蘭西斯 <奇特坐騎>";
  ["Breanni"] = "布芮妮 <寵物供應商>";
  ["Tassia Whisperglen"] = "塔西亞·喃谷 <獸欄管理員>";

  ["Teleport to Violet Stand"] = "傳送至紫羅蘭看臺的水晶";
  ["Archmage Celindra"] = "大法師瑟琳卓 <傳送門訓練師>";
  ["Warcaster Fanoraithe"] = "戰爭施法者法諾瑞司 <法師訓練師>";
  ["Jessa Weaver"] = "潔沙·編織者 <法師訓練師>";

  ["The Hunter's Reach"] = "獵人地帶";
  ["Dagna Flintlock"] = "妲戈娜·燧鎖 <槍械商>";
  ["Jarold Puller"] = "傑洛德·普勒 <特殊彈藥商人>";
  ["Aemara"] = "依瑪拉 <弓箭商>";

  ["Aerith Primrose"] = "依利絲·櫻草 <花卉商>";

  ["The Arsenal Absolute"] = "完全軍械庫";
  ["Bartram Haller"] = "巴特瑞·赫勒 <匕首和拳套武器商>";
  ["Kerta the Bold"] = "英勇的克塔 <斧和長柄武器商>";
  ["Valaden Silverblade"] = "汎拉登·銀刃 <刀劍商>";
  ["Walther Whiteford"] = "華瑟·懷特弗德 <錘商>";

  ["Dalaran Visitor Center"] = "達拉然旅客中心";
  ["Andrew Matthews"] = "安德魯·馬修斯 <公會註冊員>";
  ["Elizabeth Ross"] = "伊莉莎白·羅斯 <外袍商人 >";
  ["Archivist Betha"] = "檔案管理員貝薩 <城市歷史學家>";

  ["Curiosities & Moore"] = "不只是配件";
  ["Debbi Moore"] = "黛比·摩爾 <飾品和符咒>";
  ["Brammold Deepmine"] = "布朗摩·深礦 <古董和傳家寶>";
  ["Orton Bennet"] = "歐爾頓·班尼特 <副手貨樣>";
  ["Ninsianna"] = "妮西亞娜 <聖物>";

  ["Applebough"] = "蘋果樹枝 <水果商>";
  ["Windle Sparkshine"] = "溫都·炫亮";

  ["Sisters Sorcerous"] = "巫術姊妹";
  ["Hagatha Moorehead"] = "哈嘉薩·莫爾海德 <施法材料商>";
  ["Endora Moorehead"] = "伊朵拉·莫爾海德 <魔法物品>";

  ["The Threads of Fate"] = "命運織坊";
  ["Paldesse"] = "佩德希 <布甲商>";
  ["Karandonna"] = "卡朗多納 <布商>";
  ["Sheddle Glossgleam"] = "薛斗·光爍 <製鞋匠>";
  ["Chameli Banaphash"] = "恰梅里·巴拿費許 <男裝用品商>";
  ["Norvin Alderman"] = "諾文·埃德曼 <披風>";

  ["The Wonderworks"] = "神奇玩具屋";
  ["Jepetto Joybuzz"] = "杰佩托·樂吱 <玩具商>";
  ["Clockwork Assistant"] = "發條助手 <杰佩脫的夥伴>";

  ["The Legerdemain Lounge"] = "戲法旅舍";
  ["Amisi Azuregaze"] = "阿咪希·蒼凝 <旅館老闆>";
  ["Arille Azuregaze"] = "艾立爾·蒼凝 <酒保>";
  ["Sandra Bartan"] = "珊卓拉·巴爾坦 <酒吧女服務員>";
  ["Afsaneh Asrar"] = "艾芙桑奈·亞斯拉 <旅館老闆助理>";

  ["Kizi Copperclip"] = "奇集·銅鉗 <美容師>";

  ["One More Glass"] = "勸君更進一杯酒";
  ["Fialla Sweetberry"] = "菲亞拉·甜莓 <食物和飲料商人>";
  ["Christi Stockton"] = "克利斯蒂·斯托克頓 <酒商>";
  ["Lucian Trias"] = "魯西安·提亞斯 <麵包和起司商>";

  ["Aimee"] = "安咪 <派、餡餅與蛋糕>";

  --Purp
  ["The Eventide"] = "日暮區";

  ["Marcia Chase"] = "瑪西亞·切斯 <宗師級釣魚訓練師和供應商>";
  ["Marcia Chase &"] = "";

  ["Glorious Goods"] = "輝煌商品";
  ["Jack Findle"] = "『赤紅』傑克·芬朵 <貿易供應商>";
  ["Susana Averoy"] = "蘇珊娜·艾維羅 <雜貨商>";

  ["Langrom's Leather & Links"] = "朗格姆的皮甲與鍊甲";
  ["Bragund Brightlink"] = "布拉岡·光鏈 <鎖甲商>";
  ["Valerie Langrom"] = "維勒莉·威樂曼 <皮甲商>";

  ["The Militant Mystic"] = "軍事狂秘術店";
  ["Abra Cadabra"] = "阿布拉·卡達布拉 <魔杖>";
  ["Shen Kang Cheng"] = "沈剛誠 <法杖>";

  --Yell
  ["The Violet Hold"] = "紫羅蘭堡";

  ["Archmage Timear"] = "大法師泰彌亞";
  ["Archmage Lan'dalock"] = "大法師朗達拉克";
  ["Torgo the Younger"] = "小托苟";
  ["The Violet Hold Instance"] = "紫羅蘭堡副本";

  --Blue
  ["The Silver Enclave a"] = "白銀領區 (聯盟)";

  ["A Hero's Welcome"] = "英雄光臨";
  ["Isirami Fairwind"] = "伊斯拉米·順風 <旅館老闆>";
  ["Stefen Cotter"] = "史戴芬·寇特 <酒保>";
  ["Katherine Lee"] = "凱薩琳·李 <宗師級烹飪訓練師>";
  ["Derek Odds"] = "德瑞克·奧茨 <烹飪供應商>";
  ["Inzi Charmlight"] = "英姬·魅光 <酒吧女服務員>";
  ["Marcella Bloom"] = "馬塞拉·布魯姆 <酒吧女服務員>";
  ["Caliel Brightwillow"] = "卡利爾·明柳 <旅館老闆助理>";

  ["The Beer Garden"] = "啤酒廣場";
  ["Laire Brewgold"] = "萊爾·釀金 <啤酒辣妹>";
  ["Coira Longrifle"] = "寇伊拉·長槍 <啤酒辣妹>";

  ["The Silver Enclave"] = "白銀領區";

  ["Arcanist Braedin"] = "秘法師布瑞丁 <冬握湖軍需官>";
  ["Portal to Battlefields"] = "戰場傳送門";

  ["Upstair"] = "階梯";
  ["Arcanist Ivrenne"] = "秘法師伊芙瑞琳 <英雄紋章軍需官>";
  ["Arcanist Ivrenne &"] = "";
  ["Arcanist Adurin"] = "秘法師阿度靈 <勇氣紋章軍需官>";
  ["Arcanist Firael"] = "秘法師菲瑞爾 <征服紋章軍需官>";
  ["Arcanist Firael &"] = "";

  --Gren
  ["The Violet Citadel"] = "紫羅蘭城塞";

  ["Rhonin"] = "羅甯 <祈倫托領袖>";
  ["Vereesa Windrunner"] = "凡蕾莎·風行者 <白銀誓盟遊俠將軍>";
  ["Vereesa Windrunner &"] = "";

  ["Archmage Alvareaux"] = "大法師艾瓦勒斯 <祈倫托軍需官>";

  ["Zidormi"] = "茲多米 <時光守望者>";
  ["Portal Cavern Time"] = "時光之穴傳送門";

  ["Portal Purple Parlor"] = "紫羅蘭頂閣傳送門";

  ["The Purple Parlor"] = "紫羅蘭頂閣";
  ["Archmage John Nicholas"] = "大法師約翰·尼可拉斯 <懲罰者>";
  ["Alfred Copperworth"] = "艾佛列特·銅價 <男管家>";

  --Grey
  ["The Magus Commerce"] = "魔導師貿易區";

  ["Simply Enchanting"] = "	完全附魔商店";
  ["Enchanter Nalthanis"] = "附魔師奈爾桑尼斯 <宗師級附魔訓練師>";
  ["Enchanter Nalthanis &"] = "";
  ["Ildine Sorrowspear"] = "伊爾汀·悲矛 <附魔供應商>";
  ["Vanessa Sellers"] = "凡妮莎·塞勒斯 <裂片貿易商>";

  ["First to Your Aid"] = "急救你優先";
  ["Olisarra the Kind"] = "仁慈的歐莉珊拉 <宗師級急救訓練師>";
  ["Angelique Butler"] = "安潔利奎·巴特勒 <急救供應商>";

  ["Talismanic Textiles"] = "咒符織品店";
  ["Charles Worth"] =  "查理斯·沃斯 - 宗師級裁縫訓練師";
  ["Dominique Stefano"] = "多明尼克·史特凡諾 <裁縫供應商>";
  ["Ainderu Summerleaf"] = "安戴魯·夏葉 <月布裁縫專家>";
  ["Ainderu Summerleaf &"] = "";
  ["Lalla Brightweave"] = "拉菈·亮織 <魔焰裁縫專家>";
  ["Linna Bruder"] = "莉娜·布魯德 <影紋裁縫專家>";

  ["Legendary Leathers"] = "傳奇皮革";
  ["Braeg Stoutbeard"] = "布瑞格·厚鬚 <毛和皮貿易者>";
  ["Diane Cannings"] = "黛安·坎寧斯 <宗師級製皮訓練師>";
  ["Diane Cannings &"] = "";
  ["Derik Marks"] = "戴里克·馬克思 <宗師級剝皮訓練師>";
  ["Ranid Glowergold"] = "拉尼德·怒金 <製皮和剝皮供應商>";
  ["Ranid Glowergold &"] = "";
  ["Manfred Staller"] = "邁弗瑞德·斯托勒 <元素製皮訓練師>";
  ["Manfred Staller &"] = "";
  ["Andellion"] = "安戴里昂 <龍鱗製皮訓練師>";
  ["Namha Moonwater"] = "納姆哈·月水 <部族製皮訓練師>";
  ["Namha Moonwater &"] = "";

  ["Like Clockwork"] = "精準如錶發條舖";
  ["Justin Oshenko"] = "賈斯汀·歐先可 <宗師級工程學訓練師>";
  ["Justin Oshenko &"] = "";
  ["Bryan Landers"] = "布萊恩·蘭德森 <工程學供應商>";
  ["Didi the Wrench"] = "『板手』狄迪 <哥布林工程學訓練師>";
  ["Findle Whistlesteam"] = "芬朵·嘯汽 <地精工程學訓練師>";

  ["All That Glitters Prospecting Co"] = "亮晶晶探勘公司";
  ["Jedidiah Handers"] = "捷帝迪亞·漢德斯 <宗師級採礦訓練師>";
  ["Dorian Fines"] = "多里安·范恩斯 <採礦供應商>";

  ["The Forge of Fate"] = "命運熔爐";

  ["Tanks For Everything"] = "萬物皆可坦";
  ["Alard Schmied"] = "艾拉得·席彌德 <宗師級鍛造訓練師>";
  ["Alard Schmied &"] = "";
  ["Palja Amboss"] = "沛爾嘉·安伯斯 <鍛造供應商>";
  ["Imindril Spearsong"] = "伊敏萃兒·矛歌 <武器鍛造訓練師 >";
  ["Orland Schaeffer"] = "奧蘭德·席佛 <護甲鍛造訓練師>";
  ["Dubin Clay"] = "杜賓·克雷 <鎧甲商>";
  ["Griselda Hunderland"] = "格力謝爾達·杭得廉 <鎧甲商>";
  ["Anthony Durain"] = "安東尼·都睿 <盾牌商>";

  ["Dorothy Egan"] = "桃樂西·伊根 <宗師級草藥學訓練師>";
  ["Edward Egan"] = "愛德華·伊根 <草藥學供應商>";

  ["The Scribes Sacellum"] = "雕銘師禮拜堂";
  ["Proffessor Pallin"] = "帕林教授 <宗師級銘文學訓練師>";
  ["Proffessor Pallin &"] = "";
  ["Larana Drome"] = "拉蕾娜·德羅姆 <銘文學供應商>";
  ["Jessica Sellers"] = "潔西卡·塞勒斯 <墨水商人>";
  ["Theresa Wolf"] = "瑟利莎·沃夫 <博學大師>";

  --_Red
  ["Sunreaver's Sanctuary"] = "奪日者聖堂 (部落)";

  ["Horde Warbringer"] = "部落戰爭使者";
  ["High Arcanist Savor"] = "高階秘法師塞佛";

  ["Magister Surdiel"] = "博學者瑟迪爾 <冬握湖軍需官>";
  ["Eye of the Storm Portal"] = "暴風之眼傳送門";
  ["Arathi Basin Portal"] = "阿拉希盆地傳送門";

  ["Strand of the Ancients Portal"] = "遠祖灘頭傳送門";
  ["Alterac Valley Portal"] = "奧特蘭克山谷傳送門";
  ["Warsong Gulch Portal"] = "戰歌峽谷傳送門";

  ["Magister Sarien"] = "博學者薩瑞安 <征服紋章軍需官>";
  ["Magister Sarien &"] = "";
  ["Magister Brasael"] = "博學者巴塞爾 <勇氣紋章軍需官>";
  ["Magistrix Lambriesse"] = "博學者蘭布莉斯 <英雄紋章軍需官>";
  ["Magistrix Lambriesse &"] = "";

  ["The Filthy Animal"] = "下流畜生酒店";
  ["Uda the Beast"] = "『野獸』烏達 <旅館老闆>";
  ["Kyunghee"] = "凱攸熙 <投擲飛斧>";
  ["Mato"] = "瑪托 <食物和飲料>";
  ["Hamaka"] = "哈瑪卡 <酒保>";
  ["Umbiwa"] = "昂比瓦 <酒吧女服務員>";
  ["Mimbihi"] = "敏比西 <酒吧女服務員>";
  ["Awilo Lon'gomba"] = "阿維羅·隆貢巴 <宗師級烹飪訓練師>";
  ["Awilo Lon'gomba &"] = "";
  ["Misensi"] = "米森希 <烹飪供應商>";
  ["Abohba"] = "艾波芭 <旅館老闆助理>";


  --NPC Dalaran Sewers
  --White
  ["D Sew"] = "達拉然下水道";

  ["Entrance"] = "下水道入口";

  ["The Black Market"] = "黑市";
  ["Hexil Garrot"] = "海希爾·加洛特 <商用工具>";
  ["Pazik The Pick"] = "『鎖撬』帕茲克·撬鎖 <鎖匠>";
  ["Scout Nisstina"] = "斥候妮絲蒂娜 <三指強盜>";
  ["Alchemist Cinesra"] = "鍊金師席尼斯拉 <毒藥商>";
  ["Darahir"] = "達拉喜爾 <施法材料和魔法物品>";

  ["Circle of Wills"] = "意志之環";
  ["Blazik Fireclaw"] = "布雷齊克·火爪 <飲水商>";
  ["Nargle Lashcord"] = "納高·鞭索 <老練競技場商人>";
  ["Xazi Smolderpipe"] = "札奇·燻管 <競技場商人>";
  ["Zom Bocom"] = "扎姆·巴康 <見習競技場商人>";
  ["Shifty Vickers"] = "詭詐的維克斯";

  ["Baroness Llana"] = "『女爵』拉娜- 競技場編制者";
  ["Schembari Shearbolt"] = "『塞爾大叔』史金巴利·斷栓 <競技場戰場軍官>";
  ["Schembari Shearbolt &"] = "";

  ["Rickard Rustbolt"] = "『技巧』理查·鏽栓 <競技場戰場軍官>";

  ["Sarah Brady"] = "薩拉·布萊迪 <酒商>";
  ["Minzi Minx"] = "『輕佻』敏姬 <競技場戰場軍官>";

  ["Nixi Fireclaw"] = "尼基·火爪 <飲水商>";

  ["Kanika Goldwell"] = "卡尼塔·金井 <競技場編制者>";
  ["Ramik Slamwrench"] = "拉米克·猛擰 <競技場戰場軍官>";

  ["Danik Blackshaft"] = "精悍的達尼克·黑柄 <競技場戰場軍官>";

  ["Cantrips & Crows"] = "咒語與烏鴉";
  ["Ajay Green"] = "雅杰·格林 <旅館老闆>";
  ["Narisa Redgold"] = "娜莉莎·紅金 <酒吧女服務員>";

  ["Binzik Goldbook"] = "賓奇克·金卷 <銀行職員>";

  ["Angelo Pescatore"] = "安傑羅·佩斯卡多 <釣魚供應商>";

  ["Rin Duoctane"] = "倫·杜克坦";

  ["Sewer Pipe"] = "下水道出口管道 (需要飛行坐騎進出)";
  ["Add On"] = "";

  ["Washed-up Mage"] = "疲倦的法師";


  --NPC Darnassus  達納蘇斯
  --White  
  ["Warrior's Terrace"] = "戰士區";
   
  ["Mydrannul"] = "邁德蘭努爾 <雜貨商>";
  ["Shylenai"] = "夏琳奈爾 <貓頭鷹訓練師>";
  ["Fyrenna"] = "菲琳娜 <食物和飲料商人>";
  ["Ancient of War"] = "戰爭古樹";
   
  ["Sildanair"] = "希達奈爾 <戰士訓練師>";
  ["Thyn'tel"] = "塞恩提爾·刃紋";
   
  ["Elanaria"] = "艾蘭娜瑞";
  ["Arias'ta"] = "阿雷亞斯塔·刃歌 <戰士訓練師>";
  ["Darnath"] = "達納斯·刃歌 <戰士訓練師>";
  ["Brogun"] = "布洛岡·石盾 <奧特蘭克山谷戰場軍官>";
  ["Enlae"] = "尹壘 <暴風之眼戰場軍官>";
  ["Aethalas"] = "艾薩拉斯·克羅維爾 <戰歌峽谷戰場軍官>";
  ["Fima"] = "五指費瑪 <競技場戰場軍官>";
  ["Keras"] = "克拉斯·狼心 <阿拉希盆地戰場軍官>";
  ["Nivara"] = "尼瓦拉·刃舞 <遠祖灘頭戰場軍官>";
  ["Nivara &"] = "";
 
  ["Ariyell"] = "阿瑞耶爾·天影 <武器商>";
  ["Mathiel"] = "瑪希爾";
  ["Cylania"] = "塞蘭妮亞 <夜精靈護甲商>";
  ["Ilyenia"] = "伊琳尼雅·月火 <武器大師>";
  
  --Purp
  ["Tradesmen's Terrace"] = "貿易區";
   
  ["General Goods & Bags"] = "雜貨與背包";
  ["Ellandrieth"] = "艾蘭蒂斯 <雜貨商>";
  ["Yldan"] = "伊爾丹 <背包商人>";
   
  ["Weapons"] = "武器";
  ["Glorandiir"] = "格羅拉迪爾 <斧商>";
  ["Merelyssa"] = "米利希亞 <劍刃商人>";
  ["Mythidan"] = "邁希迪安 <錘和法杖商人>";
  ["Kieran"] = "基爾蘭 <武器商>";
   
  ["Fletcher & Thrown Weapons"] = "弓箭與投擲武器";
  ["Landria"] = "蘭德瑞亞 <弓箭商人>";
  ["Turian"] = "圖里安 <投擲武器商人>";
   
  ["CAHW"] = "布甲與雙手武器";
  ["Vinasia"] = "溫娜希雅 <布甲商>";
  ["Ealyshia D"] = "伊林希亞·露珠 <雙手武器商人>";
  ["Ealyshia D &"] = "";
 
  ["Leather Armor"] = "皮甲";
  ["Cyridan"] = "塞瑞丹 <皮甲商>";
   
  ["Mail Armor & Shields"] = "鎖甲與盾牌";
  ["Melea"] = "梅爾利恩 <鎖甲商>";
  ["Caynrus"] = "坎因魯斯 <盾牌商>";
   
  ["Jareth"] = "加雷斯·深林";
   
  ["Treshala"] = "塔莎拉·靜水";
   
  ["Sentinel's Bunkhouse"] = "哨兵營地";
   
  ["Staff & Robe"] = "法杖與長袍";
  ["Andrus"] = "安德魯斯 <法杖商>";
  ["Anadyia"] = "安達迪雅 <長袍商>";

  ["Jaeana"] = "加伊娜 <肉商> (在武器與弓箭區域徘徊)";
  ["Jaeana&"] = "";

  --Yell
  ["Craftsmen's Terrace"] = "工匠區";

  ["Guild"] = "公會";
  ["Lysheana"] = "琳沙娜 <公會註冊員>";
  ["Shalumon"] = "沙魯蒙 <外袍商人 >";
  ["Ellaercia"] = "艾拉希亞 <公會外袍設計師>";

  ["Saelienne"] = "旅店老闆塞琳尼";

  ["Tailoring &"] = "裁縫與製皮";
  ["Me'lynn"] = "邁里恩 <裁縫訓練師>";
  ["Elynna"] = "愛琳娜 <裁縫供應商>";
  ["Raedon D"] = "萊頓·暗影  <聯盟布匹軍需官>";
  ["Raedon D &"] = "";
  ["Telonis"] = "泰龍尼斯 <製皮訓練師>";
  ["Saenorion"] = "塞諾里奧 <製皮供應商>";
  ["Eladriel"] = "艾拉迪爾 <剝皮訓練師>";
  ["Lotherias"] = "洛瑟里亞斯";

  ["General"] = "雜貨店";
  ["Mythrin'dir"] = "邁斯林迪爾 <貿易供應商>";

  ["Enchanting"] = "附魔與銘文";
  ["Taladan"] = "塔蘭丹 <附魔訓練師>";
  ["Vaean"] = "維安 <附魔供應商>";
  ["Feyden D"] = "菲丹·達金 <銘文學訓練師>";
  ["Illianna M"] = "伊利安娜·月繕 <銘文學供應商>";

  ["Alchemy"] = "煉金與銀色黎明";
  ["Ainethil"] = "安尼希爾 <鍊金術訓練師>";
  ["Ulthir"] = "尤希爾 <鍊金術供應商>";
  ["Argent Guard Manados"] = "銀色黎明守衛瑪納杜斯 <銀色黎明>";
  ["D Selgorm"] = "哨兵塞爾高姆 <銀色黎明>";
  ["D Shaedlass"] = "哨兵山德拉斯 <銀色黎明>";

  ["Cooking"] = "烹飪";
  ["Alegorn"] = "阿雷貢 <烹飪訓練師>";
  ["Fyldan"] = "菲爾丹 <烹飪供應商>";

  ["First Aid"] = "急救";
  ["Dannelor"] = "丹納羅爾 <急救訓練師>";

  --Blue
  ["Cenarion Enclave"] = "塞納里奧區";

  ["Tunnel R Trainer"] = "往盜賊訓練師通道";

  ["Food & Drink"] = "食物和飲料";
  ["Dendrythis"] = "德蒂希斯 <食物和飲料商人>";

  ["Rellian G"] = "雷利亞·綠樹";

  ["Mounts"] = "坐騎";
  ["Jartsam"] = "賈薩姆 <騎術訓練師>";
  ["Lelanai"] = "萊蘭奈 <馴豹人>";

  ["Hunter"] = "獵人訓練師";
  ["Alassin"] = "阿拉辛 <獸欄管理員>";
  ["Jocaste"] = "祖卡斯特 <獵人訓練師>";
  ["Corand"] = "科蘭德";
  ["Jeen'ra N"] = "吉恩拉 <獵人訓練師>";
  ["Dorion"] = "多利安 <獵人訓練師>";
  ["Silvaria"] = "西爾瓦莉雅 <寵物訓練師>";

  ["Druid"] = "德魯伊訓練師";
  ["Denatharion"] = "德納薩里安 <德魯伊訓練師>";
  ["Fylerian N"] = "菲勒里亞·夜翼 <德魯伊訓練師>";
  ["Cyroen"] = "塞羅恩 <施法材料>";
  ["Mathrengyl B"] = "瑪斯雷·馭熊者 <德魯伊訓練師>";
  ["Fandral S"] = "大德魯伊范達爾·鹿盔";

  ["Poisons"] = "毒藥商";
  ["Kyrai"] = "凱爾萊 <毒藥供應商>";
  ["Faelyssa"] = "菲琳薩";

  ["Rogue"] = "盜賊訓練師";
  ["Syurna"] = "塞尤娜 <盜賊訓練師>";
  ["Anishar"] = "安妮莎爾 <盜賊訓練師>";
  ["Erion S"] = "艾里安·影語 <盜賊訓練師>";

  --Gren
  ["The Temple Gardens"] = "神殿花園";

  ["Portal to Rut'theran"] = "魯瑟蘭村傳送門";

  ["O Lunalight"] = "軍官魯娜萊 <達納蘇斯表揚處>";

  ["Sister Aquinne"] = "艾奎恩妮修女 <低階女祭司>";

  ["Fishing"] = "釣魚";
  ["Astaia"] = "阿斯坦婭 <釣魚訓練師>";
  ["Voloren"] = "沃洛倫 <釣魚供應商>";
  ["Talaelar"] = "塔萊拉爾 <魚商>";

  ["Herbalism"] = "草藥學訓練師";
  ["Firodren M"] = "菲羅迪恩·喚月 <草藥學訓練師>";
  ["Chardryn"] = "查德瑞恩 <草藥學供應商>";

  ["Greywhisker"] = "首席考古學家杜瑟·灰鬚 <探險者協會>";
  ["Greywhisker &"] = "";

  ["Alaindia"] = "奧蘭蒂亞 <施法材料>";
  ["Alaindia&"] = "          (在四個固定點間輪流停留)";
  ["Alaindia&1"] = "";

  --Cyan
  ["Temple Moon"] = "月神殿";

  ["Main Floor"] = "一樓";
  ["Jandria"] = "賈德莉亞 <牧師訓練師>";
  ["Lariia"] = "拉瑞亞 <牧師訓練師>";
  ["Elissa D"] = "埃麗莎·仲馬 <傳送門訓練師>";
  ["Dalia S"] = "哨兵達莉亞·日刃";

  ["Balconey"] = "露台 (二樓)";
  ["P A'moora"] = "女祭司艾茉拉";

  ["Gracina S"] = "格拉希娜·靈風";

  ["AstariiS"] = "阿斯塔利·逐星 <牧師訓練師>";
  ["PAlathea"] = "女祭司阿蘭希雅 <牧師訓練師>";
  ["TyrandeW"] = "泰蘭妲·語風 <伊露恩的高階女祭司>";
  ["Valustraa"] = "大使·瓦魯斯卓";


  --NPC Exodar
  --White
  ["Outside"] = "前門入口外";
  ["Entrance Ex"] = "出入口";

  ["Stephanos"] = "史丹樊那斯, 角鷹獸管理員";

  ["Torallius"] = "『獸群管理者』托拉利斯, 伊萊克飼者";
  ["Aalun"] = "阿露恩, 騎術訓練師";

  --Gren
  ["Seat of the Naaru"] = "那魯之座";

  ["Caregiver B"] = "照顧者布利尤, 旅館老闆";
  ["Arthaid"] = "阿斯艾德, 獸欄管理員";
  ["Miglik B"] = "米格萊克·布拉特斯托姆, 競技場戰場軍官";

  ["O Khaluun"] = "軍官卡盧恩, 艾克索達表揚處";

  ["Mumman"] = "慕曼, 廚師";
  ["Phea"] = "菲亞, 烹飪供應商";
  ["CookP"] = "燉肉煮鍋";

  ["Onnis"] = "歐尼斯, 雜貨商";
  ["Cuzi"] = "庫奇, 背包商人";

  ["Bran'daan"] = "信使布拉登";

  ["Nurguni"] = "魯古尼, 商人";

  ["O'ros"] = "歐蘿絲 (斜坡下)";

  --Red
  ["Traders Tier"] = "Traders' Tier";

  ["Tailoring"] = "Tailoring";
  ["Refik"] = "Refik, Tailoring Trainer";
  ["Neii"] = "Neii, 裁縫供應商";
  ["Dugiru"] = "Dugiru, 聯盟 Cloth Quartermaster";

  ["Leatherworking and Skinning"] = "Leatherworking and Skinning";
  ["Remere"] = "Remere, 剝皮訓練師";
  ["Akham"] = "Akham, 製皮訓練師";
  ["Haferet"] = "Haferet, 製皮供應商";

  ["Plate Armor & Shields"] = "Plate Armor & Shields";
  ["Gotaan"] = "Gotaan, 鎧甲商";
  ["Treall"] = "Treall, 盾牌商";

  ["Bladed Weapons"] = "Bladed Weapons";
  ["Ven"] = "Ven, Blade Vendor";

  ["Blunt Weapons"] = "Blunt Weapons";
  ["Ellomin"] = "Ellomin, Blunt Weapon Merchant";

  ["Leather & Cloth Armor"] = "Leather & Cloth Armor (up stairs)";
  ["Mahri"] = "Mahri, 皮甲商";
  ["Gornii"] = "Gornii, 布甲商";

  ["Mail Armor"] = "Mail Armor (up stairs)";
  ["Yil"] = "Yil, 鎖甲商";

  ["Mining and Smithing"] = "Mining and Smithing";
  ["Muaat"] = "Muaat, Mining Trainer";
  ["Merran"] = "Merran, 採礦供應商";
  ["Miall"] = "Miall, Blacksmithing Trainer";
  ["Arras"] = "Arras, Blacksmithing Supplies";

  ["Engineering"] = "Engineering";
  ["Ockil"] = "Ockil, Engineering Trainer";
  ["Feera"] = "Feera, 工程學供應商";

  ["Hunters' Sanctum"] = "Hunters' Sanctum";
  ["Deremiis"] = "Deremiis, 獵人訓練師";
  ["Vord"] = "Vord, 獵人訓練師";
  ["Killac"] = "Killac, 獵人訓練師";
  ["Ganaar"] = "Ganaar, 寵物訓練師";
  ["Avelii"] = "Avelii, 弓箭商";
  ["Muhaa"] = "Muhaa, 槍械商";

  ["Ring of Arms"] = "Ring of Arms";
  ["Fingin"] = "Fingin, 毒藥供應商";
  ["Ahonan"] = "Ahonan, 戰士訓練師";
  ["Kazi"] = "Kazi, 戰士訓練師";
  ["Behomat"] = "Behomat, 戰士訓練師";
  ["Handiir"] = "Handiir, 武器大師";

  ["Guild Master and Tabards"] = "公會註冊員和外袍";
  ["Funaam"] = "Funaam, 公會註冊員";
  ["Issca"] = "Issca, 外袍商人 ";

  --Purp
  ["The Vault of Lights"] = "The Vault of Lights";

  ["Hall of the Mystics"] = "Hall of the Mystics";
  ["Bati"] = "Bati, 法師訓練師";
  ["Harnan"] = "Harnan, 法師訓練師";
  ["Edirah"] = "Edirah, 法師訓練師";
  ["Lunaraa"] = "Lunaraa, 傳送門訓練師";
  ["Oss"] = "Oss, Wand Vendor";
  ["Musal"] = "Musal, Alchemy Supplies & Reagents";

  ["Vindicators' Sanctum"] = "Vindicators' Sanctum";
  ["Kavaan"] = "Kavaan, Paladin Trainer";
  ["Jol"] = "Jol, Paladin Trainer";
  ["Baatun"] = "Baatun, Paladin Trainer";

  ["Alchemy and Herbalism"] = "Alchemy and Herbalism";
  ["Lucc"] = "Lucc, 鍊金術訓練師";
  ["Altaa"] = "Altaa, 鍊金術供應商";
  ["Cemmorhan"] = "Cemmorhan, 草藥學訓練師";

  ["Tolo"] = "Tolo, 阿拉希盆地戰場軍官";

  ["Mahul"] = "Mahul, 奧特蘭克山谷戰場軍官";
  ["Mitia"] = "Mitia, 暴風之眼戰場軍官";

  ["Jihi"] = "Jihi, 戰歌峽谷戰場軍官";
  ["Buhurda"] = "Buhurda, 遠祖灘頭戰場軍官 Battlemaster";

  ["Prophet Velen"] = "Prophet Velen";

  ["Anchorites' Sanctum"] = "Anchorites' Sanctum";
  ["Izmir"] = "Izmir, 牧師訓練師";
  ["Fallat"] = "Fallat, 牧師訓練師";
  ["Caedmos"] = "Caedmos, 牧師訓練師";

  --White
  ["The Crystal Hall"] = "The Crystal Hall";

  --["Enchanting"] = "Enchanting"; -- Duplicated
  ["Nahogg"] = "Nahogg, Echanting Trainer";
  ["Egomis"] = "Egomis, Echanting Supplies";
  ["Thoth"] = "Thoth, 銘文學訓練師";
  ["Sessoh"] = "Sessoh, 銘文學供應商";

  ["Sixx"] = "Sixx, Moth Vendor (Main Floor)";

  ["Gurrag"] = "Gurrag, 薩滿訓練師";

  ["F Nobundo"] = "Farseer Nobundo, 薩滿訓練師 (Up the Ramp)";
  ["F Dunaer"] = "Foreman Dunaer";
  ["Valon"] = "Valon";

  ["Sulaa"] = "Sulaa, 薩滿訓練師";

  --["Fishing"] = "Fishing";
  ["Erett"] = "Erett, 釣魚訓練師";
  ["Dekin"] = "Dekin, 釣魚供應商";

  ["Hobahken"] = "Hobahken, 薩滿訓練師";

  ["施法材料"] = "Reagents";
  ["Bildine"] = "Bildine, Reagent Vendor";

  --["First Aid"] = "First Aid";
  ["Nus"] = "Nus, 急救訓練師";

  ["Jewelcrafting"] = "Jewelcrafting";
  ["Farii"] = "Farii, Jewelcrafting Trainer";
  ["Arred"] = "Arred, Jewelcrafting Supplier";
  ["Padaar"] = "Padaar, Apprentice Jewelcrafter";

  ["Seer Skaltesh"] = "Seer Skaltesh";

  --NPC Ironforge 鐵爐堡
  --White
  ["The Common"] = "The Commons";

  ["Barim"] = "Barim's Reagents";
  ["Barim J"] = "Barim Jurgenstaad, Reagent Vendor";

  ["Stonefire Tavern"] = "The Stonefire Tavern";
  ["Innkeeper Firebrew"] = "Innkeeper Firebrew";
  ["Gwenna F"] = "Gwenna Firebrew, 酒吧女服務員";
  ["Larkin T"] = "Larkin Thunderbrew, Brew of the Month Club";
  ["Brew Vendor"] = "Brew Vendor, Brew of the Month Club";
  ["Sheldonore"] = "Artilleryman Sheldonore";

  ["Pella B"] = "Pella Brassbrush, 美容師";

  ["Ironforge Armory"] = "Ironforge Armory";
  ["Mangorn F"] = "Mangorn Flinthammer, 重型護甲商人";
  ["Raena F"] = "Raena Flinthammer, Light Armor Merchant";
  ["Bromiir O"] = "Bromiir Ormsen, 重型護甲商人";

  ["Dinita S"] = "Dinita Stonemantle, Vault Administrator";
  ["Lieutenant Rot"] = "Lieutenant Rotimer, Stormpike Guard";
  ["Lieutenant Rot &"] = "          Recruitment Officer (In front of the Bank)";

  ["Steelfury's Weapon Emporium"] = "Steelfury's Weapon Emporium";
  ["Dolman S"] = "Dolman Steelfury, 武器商";
  ["Grenil S"] = "Grenil Steelfury, 武器商";

  ["Fizzlespinner"] = "Fizzlespinner's General Goods";
  ["Fillius F"] = "Fillius Fizzlespinner, 貿易供應商";
  ["Bryllia I"] = "Bryllia Ironbrand, 雜貨商";

  ["Marblesten"] = "Grand Mason Marblesten. Royal Stonecutters";
  ["Marblesten&"] = "          Union";

  ["Ironforge V C"] = "Ironforge Visitor Center";
  ["Jondor S"] = "Jondor Steelbrow, 公會註冊員";
  ["Lyesa S"] = "Lyesa Steelbrow, 公會外袍商人 ";

  ["Myra T"] = "Myra Tyrngaarde, Bread Vendor (Circles in front";
  ["Myra T &"] = "          of the Bank and Auction House)";

  --Gren
  ["Mystic Ward"] = "The Mystic Ward";

  ["Fighting Wizard"] = "The Fighting Wizard";
  ["Bingus"] = "Bingus, 武器商";
  ["Harick B"] = "Harick Boulderdrum, Wands Merchant";

  ["Hall of Mysteries"] = "Hall of Mysteries";
  ["Toldren D"] = "Toldren Deepiron, 牧師訓練師";
  ["Braenna F"] = "Braenna Flintcrag, 牧師訓練師";
  ["High Priest Rohan"] = "High Priest Rohan, 牧師訓練師";
  ["Theodrus F"] = "Theodrus Frostbeard, 牧師訓練師";
  ["Bink"] = "Bink, 法師訓練師";
  ["Dink"] = "Dink, 法師訓練師";
  ["Juli S"] = "Juli Stormkettle, 法師訓練師";
  ["Milstaff S"] = "Milstaff Stormeye, 傳送門訓練師";
  ["Brandur I"] = "Brandur Ironhammer, Paladin Trainer";
  ["Beldruk D"] = "Beldruk Doombrow, Paladin Trainer";
  ["Muiredon B"] = "Muiredon Battleforge";
  ["Valgar H"] = "Valgar Highforge, Paladin Trainer";
  ["Nittlebur S"] = "Nittlebur Sparkfizzle, 法師訓練師";
  ["Tiza B"] = "Tiza Battleforge";

  ["Mage Tymor"] = "Mage Tymor";

  ["Talvash Kissel"] = "Talvash del Kissel";

  ["Maeva's"] = "Maeva's Mystical Apparel";
  ["Maeva"] = "Maeva Snowbraid, Robe Merchant";
  ["Ingrys S"] = "Ingrys Stonebrow, 布甲商";

  ["Longberry's"] = "Longberry's Reagents";
  ["Ginny L"] = "Ginny Longberry, Reagent Vendor";

  ["Bimble L"] = "Bimble Longberry, Fruit Vendor (Circles around";
  ["Bimble L&"] = "          the fountain in the Mystic Ward)";

  --Blue
  ["Forlorn Cavern"] = "The Forlorn Cavern";

  ["Stoneblades"] = "Stoneblade's";
  ["Hjoldir S"] = "Hjoldir Stoneblade, 劍刃商人";
  ["Binny"] = "Binny Springblade";
  ["Prynne"] = "Prynne";

  ["Traveling Fisherman"] = "Traveling Fisherman";
  ["Grimnur S"] = "Grimnur Stonebrand, 釣魚訓練師";
  ["Tansy P"] = "Tansy Puddlefizz, 釣魚供應商";

  ["Lago B"] = "Lago Blackwrench";

  ["Thistleheart"] = "Thistleheart, 術士訓練師";
  ["Briarthorn"] = "Briarthorn, 術士訓練師";
  ["Alexander C"] = "Alexander Calder, Warlock  Trainer";
  ["Gerrig B"] = "Gerrig Bonegrip";

  ["Tynnus V"] = "Tynnus Venomsprout, Shady Dealer";
  ["Fenthwick"] = "Fenthwick, 盜賊訓練師";
  ["Ormyr F"] = "Ormyr Flinteye, 盜賊訓練師";
  ["Hulfdan B"] = "Hulfdan Blackbeard, 盜賊訓練師";
  ["Durtham G"] = "Durtham Greldon";

  ["Ransin D"] = "Ransin Donner";
  ["Murky"] = "Murky";

  --Purp
  ["Hall of Explorers"] = "Hall of Explorers";

  ["Roetten S"] = "Roetten Stonehammer, Reclaimers Inc.";
  ["Magellas"] = "High Explorer Magellas, Explorers' League";

  ["The Library"] = "The Library";
  ["Thorius"] = "Curator Thorius";

  ["Lyon M"] = "Lyon Mountainheart";

  ["Laris G"] = "Laris Geardawdle";

  ["Krom S"] = "Krom Stoutarm";
  ["Prospector S"] = "Prospector Stormpike";
  ["Mae P"] = "Librarian Mae Paledust, Explorers' League";
  ["Advisor B"] = "Advisor Belgrum";
  ["Historian K"] = "Historian Karnik";

  --Cyan
  ["Tinker Town"] = "Tinker Town";

  ["Bubulo"] = "Bubulo, 聯盟 Cloth Quartermaster (Gnome)";

  ["Boom!"] = "Things that go Boom!";
  ["Lomac"] = "Lomac Gearstrip";
  ["Fizzlebang"] = "Fizzlebang Booms, Fireworks Vendor";

  ["Berryfizz's"] = "Berryfizz's Potions and Mixed Drinks";
  ["Tally B"] = "Tally Berryfizz, 鍊金術訓練師";
  ["Soolie B"] = "Soolie Berryfizz, 鍊金術供應商";

  ["Overspark"] = "Tinkmaster Overspark, Gnome";
  ["Overspark&"] = "          Engineering Trainer";
  ["Gnoarn"] = "Gnoarn";

  ["Mekkatorque"] = "High Tinker Mekkatorque, King of the Gnomes";

  ["Castpipe"] = "Master Mechanic Castpipe";
  ["Klockmort"] = "Klockmort Spannerspan";
  ["Porterhouse"] = "Officer Porterhouse, Gnomeregan";
  ["Porterhouse&"] = "          Commendations";

  ["Springspindle's"] = "Springspindle's Gadgets";
  ["Fizzlegear"] = "Springspindle Fizzlegear, Engineering Trainer";
  ["Cogspinner"] = "Gearcutter Cogspinner, 工程學供應商";

  ["Deeprun Tram"] = "Deeprun Tram";
  ["Monty"] = "Monty, Rat Extermination Specialist";
  ["Haggle"] = "Haggle";

  --Orng
  ["The Military Ward"] = "The Military Ward";

  ["Goldfury's"] = "Goldfury's Hunting Supplies";
  ["BrettaG"] = "Bretta Goldfury, 槍械商人";
  ["SkolminG"] = "Skolmin Goldfury, 弓箭商人";

  ["Bruuk's Corner"] = "Bruuk's Corner";
  ["BruukB"] = "Bruuk Barleybeard, 酒保";
  ["TisaM"] = "Tisa Martine";
  ["EdrisB"] = "Edris Barleybeard, 酒吧女服務員";

  ["SognarC"] = "Sognar Cliffbeard, Meat Vendor (Does a cirlce";
  ["SognarC&"] = "          in the Military Ward)";

  ["Hall of Arms"] = "Hall of Arms";
  ["RegnusT"] = "Regnus Thundergranite, 獵人訓練師";
  ["OlminB"] = "Olmin Burningbeard, 獵人訓練師";
  ["UlbrekF"] = "Ulbrek Firehand, 獸欄管理員";
  ["BeliaT"] = "Belia Thundergranite, 寵物訓練師";
  ["DemnulF"] = "Demnul Farmountain";
  ["DaeraB"] = "Daera Brightspear, 獵人訓練師";
  ["KelvS"] = "Kelv Sternhammer, 戰士訓練師";
  ["MaxX"] = "Max Xim, 競技場戰場軍官";
  ["DonalO"] = "Donal Osgood, 阿拉希盆地戰場軍官";
  ["Lylandris"] = "Lylandris, Warsong Gultch Battlemaster";
  ["MargaB"] = "Marga Bearbrawn, 遠祖灘頭戰場軍官";
  ["MargaB&"] = "          Battlemaster";
  ["GlordrumS"] = "Glordrum Steelbeard, 奧特蘭克山谷戰場軍官";
  ["Kandaar"] = "Kandaar, 暴風之眼戰場軍官";
  ["MurenS"] = "Muren Stormpike";
  ["KelstrumS"] = "Kelstrum Stonebreaker, 戰士訓練師";
  ["BilbanT"] = "Bilban Tosslespanner, 戰士訓練師";
  ["GilbartaG"] = "Gilbarta Grandhammer, Battleground Enthusiast";
  ["PLongbeard"] = "Pilot Longbeard, Ironforge Siege Brigade";
  ["XiggsF"] = "Xiggs Fuselighter";

  ["Timberline Arms"] = "Timberline Arms";
  ["BuliwyfS"] = "Buliwyf Stonehand, 武器大師";
  ["BixiW"] = "Bixi Wobblebonk, 武器大師";
  ["KelomirI"] = "Kelomir Ironhand, Maces & Staves";
  ["ThalgusT"] = "Thalgus Thunderfist, 武器商";
  ["HegnarS"] = "Hegnar Swiftaxe, 斧商";
  ["BrenwynW"] = "Brenwyn Wintersteel, 劍刃商人";

  ["Craghelm's"] = "Craghelm's Plate and Chain";
  ["LissyphusF"] = "Lissyphus Finespindle, Light Armor Merchant";
  ["DolkinC"] = "Dolkin Craghelm, 鎖甲商";
  ["OlthranC"] = "Olthran Craghelm, 重型護甲商人";

  ["SaraB"] = "Sara Balloo";

  --Yell
  ["The Great Forge"] = "The Great Forge";

  ["Ironforge Physician"] = "Ironforge Physician";
  ["ReynaS"] = "Reyna Stonebranch, 草藥學訓練師";
  ["GwinaS"] = "Gwina Stonebranch, 草藥學供應商";
  ["NissaF"] = "Nissa Firestone, 急救訓練師";

  ["GrythT"] = "Gryth Thurden, Gryphon Master";

  ["Thistlefuzz Arcanery"] = "Thistlefuzz Arcanery";
  ["EJademoon"] = "Cenarion Emissary Jademoon";
  ["GimbleT"] = "Gimble Thistlefuzz, 附魔訓練師";
  ["TilliT"] = "Tilli Thistlefuzz, 附魔供應商";
  ["EliseB"] = "Elise Brightletter, 銘文學訓練師";
  ["ThargenH"] = "Thargen Heavyquill, 銘文學供應商";

  ["Bronze Kettle"] = "The Bronze Kettle";
  ["DarylR"] = "Daryl Riknussun, 烹飪訓練師";
  ["EmrulR"] = "Emrul Riknussun, 烹飪供應商";
  ["DBcook"] = "(Cooking can be done at any Dwarven Brazier";
  ["DBcook&"] = "           in the city)";

  ["FJavad"] = "Farseer Javad, 薩滿訓練師";

  ["DMMG"] = "Deep Mountain Mining Guild";
  ["GeoframB"] = "Geofram Bouldertoe, Mining Trainer";
  ["GolnirB"] = "Golnir Bouldertoe, 採礦供應商";

  ["Burbik's"] = "Burbik's Supplies";
  ["BurbikG"] = "Burbik Gearspanner, 貿易供應商";

  ["Stonebrow's"] = "Stonebrow's 布商";
  ["JormundS"] = "Jormund Stonebrow, Tailoring Trainer";
  ["PorannaS"] = "Poranna Snowbraid, 裁縫供應商";
  ["OEric"] = "Outfitter Eric, Speciality 裁縫供應商";
  ["MistinaS"] = "Mistina Steelshield, 聯盟 Cloth";
  ["MistinaS&"] = "          Quartermaster (Dwarf)";

  ["Finespindle's"] = "Finespindle's Leather Goods";
  ["FimbleF"] = "Fimble Finespindle, 製皮訓練師";
  ["BombusF"] = "Bombus Finespindle, 製皮供應商";
  ["BalthusS"] = "Balthus Stoneflayer, 剝皮訓練師";

  ["OIronbeard"] = "Officer Ironbeard, Ironforge Commendations";

  ["Sraaz"] = "Sraaz, Pie Vendor (Does a circle around the";
  ["Sraaz&"] = "          Great Forge)";

  ["High Seat"] = "The High Seat";
  ["KingMagni"] = "King Magni Bronzebeard, Lord of Ironforge";
  ["SBarinR"] = "Senator Barin Redstone";
  ["RHArchesonus"] = "Royal Historian Archesonus";
  ["Deliana"] = "Deliana";

  ["Great Forge"] = "The Great Forge";
  ["GrumnusS"] = "Grumnus Steelshaper, Armorsmith Trainer";
  ["IronusC"] = "Ironus Coldsteel, Weaponsmith Trainer";
  ["ThurgrumD"] = "Thurgrum Deepforge, Blacksmithing Supplies";
  ["BengusD"] = "Bengus Deepforge, Blacksmithing Trainer";
  ["MyolorS"] = "Myolor Sunderfury";
  ["BrombarH"] = "Brombar Higgleby, The Keymaster";
  ["TormusD"] = "Tormus Deepforge";
  
  --NPC Orgrimmar 奧格瑪
  --White
  ["Valley Strength"] = "The Valley of Strength";
  
  ["FARokhs"] = "Frostwolf Ambassador Rokhstrom";

  ["Gryshka"] = "Innkeeper Gryshka";
  ["Morag J"] = "Barkeep Morag";
  ["Kozish"] = "Kozish";
  ["Sarok"] = "Sarok";
  ["Doyo'da"] = "Doyo'da";
  ["Zaro"] = "Zaro";
  ["Goma"] = "Goma";
  ["Gamon"] = "Gamon";

  ["SLSA"] = "Soran's Leather & Steel Armory";
  ["Sana"] = "Sana, 鎖甲商";
  ["Morgum"] = "Morgum, 皮甲商";
  ["Ollanus"] = "Ollanus, Light Armor Merchant";

  ["BImports"] = "Boomstick Imports";
  ["Kaja"] = "Kaja, Guns & Ammunition Vendor";

  ["SReagents"] = "Spiritfury Reagents";
  ["Horthus"] = "Horthus, 施法材料";

  ["Horde Embassy"] = "部落 Embassy";
  ["Urtrun"] = "Urtrun Clanbringer, Guildmaster";
  ["Garyl"] = "Garyl, 外袍商人 ";

  ["GenStore"] = "Orgrimmar General Store";
  ["Trak'gen"] = "Trak'gen, 雜貨商";
  ["Shimra"] = "Shimra, General Trade Supplies Vendor";

  ["ShattAxe"] = "The Shattered Axe";
  ["Urtharo"] = "Urtharo, 武器商";

  ["Chophouse"] = "The Chophouse";
  ["Olvia"] = "Olvia, Meat Vendor";
  ["OrcCook"] = "Orc Cooker (Cooking can be done at a Mighty";
  ["OrcCook&"] = "          Blaze as well)";

  ["SlopeVS"] = "Slope up to Valley of Spirits";

  ["Zankaja"] = "Zankaja";
  ["MBlaze"] = "Mighty Blaze";

  ["Skytower"] = "The Skytower";
  ["Doras"] = "Doras, Wind Rider Master";
  ["CEhoof"] = "Cenarion Emissary Blackhoof";

  ["HallLegends"] = "Hall of Legends";
  ["SGZarg"] = "Stone Guard Zarg, Weapons Quartermaster";
  ["DorisV"] = "Doris Volanthius, Veteran Armor Quartermaster";
  ["BraveSton"] = "Brave Stonehide, Officer Accessories";
  ["BraveSton&"] = "          Quartermaster";
  ["Zar'shi"] = "Blood Guard Zar'shi, Armor Quartermaster";
  ["LadyPal"] = "Lady Palanseer, Jewelcrafting Quartermaster";
  ["SergThunder"] = "Sergeant Thunderhorn, Apprentice Armor";
  ["SergThunder&"] = "          Quartermaster";
  ["Bork"] = "Raider Bork, Mount Quartermaster";
  ["Hola'mahi"] = "First Sergeant Hola'mahi, Armor Quartermaster";
  ["Earthbind"] = "Chieftain Earthbind";
  ["Willington"] = "Advisor Willington";
  ["Teena"] = "Legionnaire Teena, Armor Quartermaster";
  ["CArial"] = "Councilor Arial";
  ["D'Anastasis"] = "D'Anastasis";
  ["Hini'wana"] = "Blood Guard Hini'wana";
  ["Bek'rah"] = "Grunt Bek'rah";
  ["Korf"] = "Grunt Korf";

  ["SkyStaves"] = "Skyfury Staves";
  ["Ukra'nor"] = "Ukra'nor, 法杖商";

  ["Keldran"] = "Keldran";

  ["Xan'tish"] = "Xan'tish, Snake Vendor (Travels between west";
  ["Xan'tish&"] = "          entrance to the city and Valley of Spirits)";

  ["Krixx"] = "Krixx, Zepplin Engineer (Travels between the";
  ["Krixx&"] = "           bonfire near the south city entrance and";
  ["Krixx&1"] = "           Nogg's Machine Shop in The Valley of";
  ["Krixx&2"] = "           Honor)";


  --Purp
  ["ValleySpirits"] = "The Valley of Spirits";

  ["DarkbriarL"] = "Darkbriar Lodge";
  ["Uthel'nay"] = "Uthel'nay, 法師訓練師";
  ["Enyo"] = "Enyo, 法師訓練師";
  ["Deino"] = "Deino, 法師訓練師";
  ["Pephredo"] = "Pephredo, 法師訓練師";
  ["Thuul"] = "Thuul, 傳送門訓練師";
  ["Vehena"] = "Vehena, 部落 Cloth Quartermaster (Troll)";
  ["Ray'ma"] = "Ray'ma, Brew of the Month Club";
  ["Brew Vendor"] = "Brew Vendor, Brew of the Month Club";

  ["SpiLodge"] = "Spirit Lodge";
  ["Ur'kyo"] = "Ur'kyo, 牧師訓練師";
  ["X'yera"] = "X'yera, 牧師訓練師";
  ["Zayus"] = "Zayus, High Priest";

  ["SurvivalF"] = "Survival of the Fittest";
  ["Arnok"] = "Arnok, 急救訓練師";

  --Yell
  ["Drag"] = "The Drag";

  ["Borstan's"] = "Borstan's Firepit (upstairs)";
  ["Borstan"] = "Borstan, Meat Vendor";
  ["Zamja"] = "Zamja, 烹飪訓練師";
  ["Xen'to"] = "Xen'to, 烹飪供應商";

  ["Jo'mah"] = "Jo'mah, 銘文學訓練師 (Upper level)";
  ["Xantili"] = "Xantili, 銘文學供應商";
  ["Zilzibin"] = "Zilzibin Drumlore";
  ["Sarlek"] = "Sarlek";
  ["Tamaro"] = "Tamaro";

  ["Arboretum"] = "Jandi's Arboretum (Upper level)";
  ["Jandi"] = "Jandi, 草藥學訓練師";
  ["Zeal'aya"] = "Zeal'aya, 草藥學供應商";

  ["Runeworks"] = "Godan's Runeworks";
  ["Jhag"] = "Jhag, 附魔訓練師";
  ["Slope1"] = "Slope to get up or down a level";

  ["Yelmak's"] = "Yelmak's Alchemy & Potions";
  ["Yelmak"] = "Yelmak, 鍊金術訓練師";
  ["Kor'geld"] = "Kor'geld, 鍊金術供應商";
  ["Jes'rimon"] = "Jes'rimon";

  ["Salvage"] = "Droffers & Sons Salvage";
  ["Dran"] = "Dran Droffers";
  ["Malton"] = "Malton Droffers";

  ["KLeatherworks"] = "Kodohide Leatherworks";
  ["Karolek"] = "Karolek, 製皮訓練師";
  ["Tamar"] = "Tamar, 製皮供應商";
  ["Thuwd"] = "Thuwd, 剝皮訓練師";
  ["Handor"] = "Handor, Cloth & Leather Armor Merchant";

  ["ClothG"] = "Magar's Cloth Goods";
  ["Magar"] = "Magar, Tailoring Trainer";
  ["Borya"] = "Borya, 裁縫供應商";
  ["Tor'phan"] = "Tor'phan, Cloth & Leather Armor Merchant";
  ["Rashona"] = "Rashona Straglash, 部落 Cloth Quartermaster";
  ["Rashona&"] = "          (Orc)";

  ["Gotri's"] = "Gotri's Travelling Gear (Main level)";
  ["Malton"] = "Gotri, 背包商人";

  ["Krixx2"] = "Krixx, Zepplin Engineer";
  ["Felika"] = "Felika, Trade Supplies (Travels the drag from";
  ["Felika&"] = "          the Valley of Wisdom entrance to the";
  ["Felika&1"] = "          Valley of Strength entrance)";

  --Blue
  ["ValleyHonor"] = "The Valley of Honor";

  ["Kiro's"] = "Kiro's Harnesses";
  ["Kiro"] = "Kiro, War Harness Maker";

  ["OBowyer"] = "Orgrimmar Bowyer";
  ["Jin'sora"] = "Jin'sora, 弓箭商人";

  ["HallBrave"] = "Hall of the Brave";
  ["Zel'mak"] = "Zel'mak, 戰士訓練師";
  ["Sorek"] = "Sorek, 戰士訓練師";
  ["Grezz"] = "Grezz Ragefist, 戰士訓練師";
  ["Andrissa"] = "Andrissa Heartspear, Eye of the Storm";
  ["Andrissa&"] = "          Battlemaster";
  ["Deze"] = "Deze Snowbane, 阿拉希盆地戰場軍官";
  ["Zeggon"] = "Zeggon Botsnap, 競技場戰場軍官";
  ["Brakgul"] = "Brakgul Deathbringer, Warsong Gultch";
  ["Brakgul&"] = "          Battlemaster";
  ["Ufuda"] = "Ufuda Giant-Slayer, 遠祖灘頭戰場軍官";
  ["Ufuda&"] = "          Battlemaster";
  ["Kartra"] = "Kartra Bloodsnarl, 奧特蘭克山谷戰場軍官";
  ["Muja"] = "Muja, Battleground Enthusiast";
  ["HordeWar"] = "部落 Warbringer";
  ["BelgR"] = "Belgrom Rockmaul";

  ["Lumak's"] = "Lumak's Fishing";
  ["Lumak"] = "Lumak, 釣魚訓練師";
  ["Shankys"] = "Shankys, 釣魚供應商";
  ["Zas'tysh"] = "Zas'tysh";

  ["RedMining"] = "Red Canyon Mining";
  ["Makaru"] = "Makaru, Mining Trainer";
  ["Gorina"] = "Gorina, 採礦供應商";

  ["Orphanage"] = "Orphanage";

  ["Nogg's"] = "Nogg's Machine Shop";
  ["Nogg"] = "Nogg, Apprentice Engineer";
  ["Roxxik"] = "Roxxik, Engineering Trainer";
  ["Sovik"] = "Sovik, 工程學供應商";
  ["Rilli"] = "Rilli Greasygob";

  ["Shayis"] = "Shayis Steelfury, Armorsmith Trainer";
  ["Okothos"] = "Okothos Ironrager, Armorsmith";
  ["Borgosh"] = "Borgosh Corebender, Weaponsmith";
  ["OxMO"] = "Ox, The Mithril Order";
  ["Aturk"] = "Aturk the Anvil";
  ["OrokkO"] = "Orokk Omosh";

  ["BurnAnvil"] = "The Burning Anvil";
  ["Saru"] = "Saru Steelfury, Blacksmithing Trainer";
  ["Sumi"] = "Sumi, Blacksmithing Supplies";
  ["Tumi"] = "Tumi, 重型護甲商人";

  ["ArmsLegend"] = "Arms of Legend";
  ["Kelgruk"] = "Kelgruk Bloodaxe, 武器鍛造訓練師 ";
  ["Zendo'"] = "Zendo'jian, Weapon Vendor";
  ["Shoma"] = "Shoma, Weapon Vendor";
  ["Galthuk"] = "Galthuk, Two-handed Weapon Merchant";
  ["Sayoc"] = "Sayoc, 武器大師";
  ["Hanashi"] = "Hanashi, 武器大師";
  ["Koru"] = "Koru, Maces & Staves Vendor";

  ["RingValor"] = "Ring of Valor";
  ["Molog"] = "War-Hunter Molog, 競技場戰場軍官";
  ["Greela"] = "Greela 'The Grunt' Crankchain, Arena";
  ["Greela&"] = "          Organizer";

  ["Ogunaro"] = "Ogunaro Wolfrunner, Kennel Master";
  ["Kildar"] = "Kildar, Wolf Riding Instructor";
  ["Xon'cha"] = "Xon'cha, 獸欄管理員";

  ["HuntHall"] = "Hunter's Hall";
  ["Sian'dur"] = "Sian'dur, 獵人訓練師";
  ["Xor'juul"] = "Xor'juul, 獵人訓練師";
  ["Ormak"] = "Ormak Grimshot, 獵人訓練師";

  --Gren
  ["CleftShad"] = "The Cleft of Shadow";

  ["DarkEncl"] = "Darkfire Enclave";
  ["Mirket"] = "Mirket, 術士訓練師";
  ["Zevrost"] = "Zevrost, 術士訓練師";
  ["Grol'dar"] = "Grol'dar, 術士訓練師";
  ["Gan'rul"] = "Gan'rul Bloodeye";

  ["ShadReag"] = "Shadowdeep Reagents";
  ["Hagrus"] = "Hagrus, Reagent Vendor";
  ["Cazul"] = "Cazul";

  ["ISW"] = "Ironwood Staves & Wands";
  ["Muragus"] = "Muragus, 法杖商";
  ["Katis"] = "Katis, Wand Merchant";

  ["Neeru"] = "Neeru Fireblade";

  ["RCI"] = "Ragefire Chasm Instance";

  ["DEFM"] = "Dark Earth Fungus and Mushrooms";
  ["Kor'jus"] = "Kor'jus, Mushroom Vendor";

  ["Barbershop"] = "Barbershop";
  ["Berbri"] = "Berbri Coifcurl, 美容師";

  ["SlowBlade"] = "The Slow Blade";
  ["Kareth"] = "Kareth, 劍刃商人";

  ["ShadowBroth"] = "Shadowswift Brotherhood";
  ["Gest"] = "Gest, 盜賊訓練師";
  ["Ormok"] = "Ormok, 盜賊訓練師";
  ["Shenthul"] = "Shenthul, 盜賊訓練師";
  ["Zando'zan"] = "Zando'zan";
  ["Therzok"] = "Therzok";

  ["Rekkul's"] = "Rekkul's Poisons";
  ["Rekkul"] = "Rekkul, Poison Vendor";
  ["Kor'ghan"] = "Kor'ghan";
  
  ["Drok"] = "Craven Drok (Travels around in the ";
  ["Drok&"] = "                  Cleft of Shadow)";

  --Cyan
  ["ValleyWisdom"] = "The Valley of Wisdom";

  ["STVIF"] = "Stranglethorn Imported Fruits";
  ["Shan'ti"] = "Shan'ti, Fruit Vendor";

  ["ORedblade"] = "Officer Redblade, Orgrimmar Commendations";

  ["GromHold"] = "Grommash Hold";
  ["Sian'tsu"] = "Sian'tsu, 薩滿訓練師";
  ["Kardris"] = "Kardris Dreamseeker, 薩滿訓練師";
  ["Sagorne"] = "Sagorne Creststrider, 薩滿訓練師";
  ["Zor"] = "Zor Lonetree, Elder Far Seer";
  ["Searn"] = "Searn Firewarder";
  ["Eitrigg"] = "Eitrigg";
  ["Vol'jin"] = "Vol'jin";
  ["Mokvar"] = "Mokvar";
  ["Pyreanor"] = "Master Pyreanor, Paladin Trainer";
  ["Dawnsinger"] = "Ambassador Dawnsinger";
  ["Thrall"] = "Thrall, Warchief";

  ["Asoran's"] = "Asoran's Market";
  ["Asoran"] = "Asoran, 雜貨商";
  ["Magenius"] = "Magenius, 施法材料";

  ["Vu'Shalay"] = "Officer Vu'Shalay, Darkspear Commendations";

  --NPC Shattrath 撒塔斯城
  --White
  ["TerLight"] = "Terrace of the Light";

  ["ABank"] = "Bank (Aldor Aligned)";
  ["Endarin"] = "Quartermaster Endarin, Aldor Quartermaster";
  ["ISaalyn"] = "Inscriber Saalyn, Aldor Inscriptions";
  ["HaldorC"] = "Haldor the Compulsive, Aldor Apothecary";

  ["SBank"] = "Bank (Scryer Aligned)";
  ["Enuril"] = "Quartermaster Enuril, Scryer Quartermaster";
  ["IVeredis"] = "Inscriber Veredis, Scryer Inscriptions";
  ["Xorith"] = "Arcanist Xorith, Scryer Apothecary";

  ["LeagArat"] = "League of Arathor Emissary (Arathi Basin)";
  ["Defil"] = "Defilers Emissary (Arathi Basin)";

  ["A'dal"] = "A'dal";
  ["Khadgar"] = "Khadgar";
  ["Almonen"] = "Grand Anchorite Almonen";
  ["Tiras'alan"] = "General Tiras'alan";

  ["G'eras"] = "G'eras (Heroic Mode Instance reward vendor ,";
  ["G'eras&"] = "          Upper level)";
  ["Almaador"] = "Almaador, Sha'tari Quartermaster";
  ["Nasuun"] = "Exarch Nasuun";
  ["Ontuvo"] = "Ontuvo, Jewelcrafting Supplies (Shattered Sun";
  ["Ontuvo&"] = "          Offensive)";
  ["PorQuel"] = "Portal to Quel'Danas";
  ["Anwehu"] = "Anwehu, Weapons and Armorsmith (Heroic";
  ["Anwehu&"] = "          Mode Instance reward vendor)";
  ["Mehlisah"] = "Spymistress Mehlisah Highcrown";

  ["Iorioa"] = "Iorioa, 傳送門訓練師";
  ["V'eru"] = "V'eru (Upper level)";

  ["WarVet"] = "Haggard War Veteran";
  ["HordeWar"] = "部落 Warbringer";

  ["Mordin"] = "Emissary Mordin, Shattered Sun Offensive";
  ["Torvos"] = "Lord Torvos, Shattered Sun Offensive";

  ["Nutral"] = "Nutral, Flight Master";
  ["Yuula"] = "Yuula, Sha'tari Guard Recruitment Officer";

  ["Haronem"] = "Harbinger Haronem, Shattered Sun Offensive";
  ["Wafflefry"] = "Whirligig Wafflefry, Gnomish Inventor";

  ["LiftScry"] = "Lift to Scryer's Tier";

  ["LiftAR"] = "Lift to Aldor Rise";
  
  ["Ezekiel"] = "Ezekiel (Travels clock-wise around The Terrace";
  ["Ezekiel&"] = "         of Light)";

  --Yell
  ["LowCity"] = "Lower City";

  ["DLarry"] = "'Dirty' Larry, Ruffian";
  ["EMalone"] = "'Epic' Malone, Ruffian";
  ["Creepjack"] = "'Creepjack', Ruffian";

  ["AldBank"] = "Lower entrance to Aldor Bank";

  ["Araac"] = "Araac";

  ["Karokka"] = "Karokka, 毒藥供應商";
  ["Skreah"] = "Skreah, 鍊金術供應商 (Down stairs)";
  ["Lorokeem"] = "Lorokeem, Master Alchemy Trainer (Down stairs)";
  ["Vekax"] = "Vekax (Travels back and forth across bridge)";

  ["Lissaf"] = "Lissaf, 劍刃商人";

  ["RampL"] = "Ramp to Terrace of Light";
  ["Rilak"] = "Rilak the Redeemed";
  ["Adyria"] = "Arcanist Adyria, The Scryers";
  ["DGrashna"] = "Defender Grashna";

  ["Oloraak"] = "Oloraak, Fish Merchant";

  ["ShattInf"] = "Shattrath Infirmary";
  ["Sha'nir"] = "Sha'nir, The Aldor";
  ["Seth"] = "Seth";
  ["Zahila"] = "Zahila";
  ["Rokk"] = "The Rokk, Master of Cooking";
  ["Barth"] = "Barthamus";

  ["ExitTF"] = "Exit to Terokkar Forest";

  ["ABG"] = "聯盟 Brigadier General (聯盟";
  ["ABG&"] = "          Battlemasters)";
  ["Vinvo"] = "Vinvo Goldgear, 遠祖灘頭戰場軍官";
  ["Vinvo&"] = "          Battlemaster";
  ["Haelga"] = "Haelga Slatefist, 奧特蘭克山谷戰場軍官";
  ["Lylandor"] = "Lylandor, 戰歌峽谷戰場軍官";
  ["Iravar"] = "Iravar, 暴風之眼戰場軍官";
  ["AEternum"] = "Adam Eternum, 阿拉希盆地戰場軍官";

  ["WorldEndT"] = "World's End Tavern";
  ["Lathrai"] = "Wind Trader Lathrai";
  ["Shaarubo"] = "Shaarubo, 酒保";
  ["Lonika"] = "Lonika Stillblade, Rogue Academy Proprietor";
  ["Kylene"] = "Kylene, 酒吧女服務員";
  ["Pilton"] = "Haris Pilton, Socialite";
  ["Zhareem"] = "Wind Trader Zhareem";
  ["Mah'duun"] = "Nether-Stalker Mah'duun";
  ["Zephyr"] = "Zephyr (Reputation Port NPC to CoT)";
  ["salabim"] = "Sal'salabim";
  ["Raliq"] = "Raliq the Drunk";

  ["Kradu"] = "Kradu Grimblade, Weaponsmith Trainer";
  ["Zula"] = "Zula Slagfury, Armorsmith Trainer";

  ["Orph"] = "Orphanage";
  ["Bartlett"] = "Nicole Bartlett, Matron";

  ["HWB"] = "部落 Warbringer (部落 Battlemasters)";
  ["Jojindi"] = "Jojindi, 遠祖灘頭戰場軍官 Battlemaster";
  ["Montok"] = "Montok Redhands, 戰歌峽谷戰場軍官";
  ["Maka"] = "Wolf-Sister Maka, 奧特蘭克山谷戰場軍官";
  ["Keldor"] = "Keldor the Lost, 阿拉希盆地戰場軍官";
  ["Yula"] = "Yula the Fair, 暴風之眼戰場軍官";
  ["Issca"] = "Issca, 外袍商人 ";

  ["Seymour"] = "Seymour, Master 剝皮訓練師";
  ["Ernie"] = "Ernie Packwell, Trade Goods";
  ["Cro"] = "Cro Threadstrong, 製皮供應商";
  ["Darmari"] = "Darmari, Master 製皮訓練師";
  ["Andrion"] = "Andrion Darkspinner, Shadoweave Specialist";
  ["Gidge"] = "Gidge Spellweaver, Spellfire Specialist";
  ["Nasmara"] = "Nasmara Moonsong, Mooncloth Specialist";
  ["Eiin"] = "Eiin, Specialty 裁縫供應商";
  ["Griftah"] = "Griftah, Amazing Amulets";
  ["Viggz"] = "Viggz Shinesparked, 工程學供應商";
  ["Fantai"] = "Fantai, Reagent Vendor";
  ["Aaron"] = "Aaron Hollman, Blacksmithing Supplies";
  ["MRuby"] = "Madam Ruby, 附魔供應商";
  ["Eral"] = "Eral, 雜貨商";
  ["Moser"] = "Muffin Man Moser, Bread Merchant";
  ["Nakodu"] = "Nakodu, Lower City Quartermaster";
  ["JackT"] = "Jack Trapper, Cook";
  ["Saltit"] = "Jim Saltit, 烹飪供應商";
  ["GSmith"] = "Granny Smith, Fruit Seller";
  ["BTurner"] = "Brendan Turner, Meat Vendor";
  ["Grok"] = "Grok";
  ["Oven"] = "Clay Oven";
  ["Tobias"] = "Tobias the Filth Gorger";
  ["Gordie"] = "Gordie";

  ["LowerSB"] = "Lower entrance to Scryer Bank";

  ["Browning"] = "Kevin Browning, Coffee Aficionado (Travels";
  ["Browning&"] = "          from east exit to south east exit)";

  --Red
  ["Scryer's Tier"] = "Scryer's Tier";

  ["Haelthol"] = "Innkeeper Haelthol";

  ["Ilthuril"] = "Ilthuril, 獸欄管理員";
  ["Endernor"] = "Trader Endernor, Trade Goods";
  ["Lisrythe"] = "Lisrythe Bloodwatch, Fence";
  ["Mahir"] = "Mahir Redstroke, Dagger Vendor";
  ["Dathris"] = "Dathris Sunstriker";

  ["Kirembri"] = "Kirembri Silvermane, Master Jewelcrafting";
  ["Kirembri&"] = "          Trainer";
  ["Hanlir"] = "Hanlir, Master Mining Trainer";
  ["Lanloer"] = "Scribe Lanloer, Master Inscription Trainer";
  ["Andiala"] = "Enchantress Andiala, Master 附魔訓練師";

  ["Nalama"] = "Nalama the Merchant, 雜貨商";
  ["Urumir"] = "Urumir Stavebright, Staff Vendor";

  ["Falris"] = "Magister Falris";
  ["Fyalenn"] = "Magistrix Fyalenn (Accepts Tokens in exchange";
  ["Fyalenn&"] = "          for Scryer Reputation)";

  ["SeerLib"] = "The Seer's Library";
  ["Arodis"] = "Arodis Sunblade, Keeper of Sha'tari Artifacts";
  ["Veynna"] = "Veynna Dawnstar, Keeper of Sha'tari Heirlooms";
  ["Volali"] = "Enchantress Volali, 附魔訓練師";
  ["Bardolan"] = "High Enchanter Bardolan, Master Enchanting";
  ["Bardolan&"] = "          Trainer";
  ["Voren"] = "Voren'thal the Seer";
  ["Lisrythe"] = "Loremaster Skosiris";
  ["Traini"] = "Training for all professions up to Master level";
  ["Traini&"] = "          (Book stacks)";

  ["Mi'irku"] = "Mi'irku Farstep, 傳送門訓練師 (Up the outside";
  ["Mi'irku&"] = "          slope)";
  ["Olodam"] = "Olodam Farhollow";

  ["Alamaro"] = "Vinemaster Alamaro, 酒商";
  ["Amshesha"] = "Amshesha Stilldark, Reagent Vendor";
  ["Yurial"] = "Yurial Soulwater, 附魔供應商";

  ["Quelama"] = "Quelama Lightblade, Wand Vendor";
  ["Selanam"] = "Selanam the Blade, Sword Vendor";

  ["Aelthin"] = "Aelthin, Master Alchemy Trainer";
  ["Alaenra"] = "Botanist Alaenra, Master Herbalism Trainer";

  ["Delvinar"] = "Archer Delvinar, 特殊彈藥商人";
  ["Daenril"] = "Daenril, Master 製皮訓練師";
  ["Miralisse"] = "Miralisse, Master Tailoring Trainer";
  ["Irduil"] = "Irduil, Master 剝皮訓練師";
  ["Barien"] = "Barien, Master Blacksmithing Trainer";
  ["Sinbei"] = "Engineer Sinbei, Master Engineering Trainer";

  --Blue
  ["ARise"] = "Aldor Rise";

  ["Minalei"] = "Minalei, 旅館老闆";
  ["Garul"] = "Garul, Food and Drink Vendor";
  ["Oruhe"] = "Oruhe, 獸欄管理員";

  ["Nemiha"] = "Nemiha, Master Jewelcrafting Trainer";
  ["Fono"] = "Fono, Master Mining Trainer";
  ["Zurii"] = "Zurii, Master 附魔訓練師";
  ["Lidio"] = "Recorder Lidio, Master Inscription Trainer";

  ["Caylee"] = "Caylee Dak";

  ["Erothem"] = "Harbinger Erothem";
  ["Adyen"] = "Adyen the Lightwarden";

  ["Hamanar"] = "Hamanar, Master Jewelcrafting Trainer";
  ["Inessera"] = "Inessera, Jewelcrafting Supplies";
  ["Ahemen"] = "Ahemen, Staff Vendor";

  ["Dremm"] = "Dremm, Master 剝皮訓練師";
  ["Aoa"] = "Weaver Aoa, Master Tailoring Trainer";
  ["Korim"] = "Korim, Master 製皮訓練師";
  ["Bova"] = "Marksman Bova, Specialty Ammuntion";
  ["Kanhu"] = "Alchemist Kanhu, Master Alchemy Trainer";
  ["Jijia"] = "Jijia, Master Herbalism Trainer";
  ["Onodo"] = "Onodo, Master Blacksmithing Trainer";
  ["Mihila"] = "Technician Mihila, Master Engineering Trainer";

  ["UnenLight"] = "Shrine of Unending Light";
  ["Ishanah"] = "Ishanah, High Priestess of the Aldor";
  ["Kelara"] = "Kelara, Keeper of Sha'tari Heirlooms";
  ["Asuur"] = "Asuur, Keeper of Sha'tari Artifacts";

  ["ENagrand"] = "Exit to Nagrand";
    
  --NPC Silvermoon
  --White
  ["Bazaar"] = "The Bazaar";

  ["Wayfar"] = "Wayfarer's Rest";
  ["Jovia"] = " Innkeeper Jovia, 旅館老闆";
  ["Sylann"] = "Sylann, Cook";
  ["Quelis"] = "Quelis, 烹飪供應商";

  ["SFinery"] = "Silvermoon Finery";
  ["Zyandrel"] = "Zyandrel, 布甲商";
  ["Andra"] = "Andra, 布商";
  ["Rathin"] = "Rathin, 背包商人";

  ["Bithrus"] = "Bithrus, Fireworks Vendor";

  ["Keelen's"] = "Keelen's Trustworthy Tailoring";
  ["SorimL"] = "Sorim Lightsong, 部落 Cloth Quartmaster";
  ["Keelen"] = "Keelen Sheets, Tailoring Trainer";
  ["Deynna"] = "Deynna, Tailoring Supplier";

  ["Welethelon"] = "Welethelon, Blunt Weapon Merchant";
  ["Noraelath"] = "Noraelath, Leather Armor Merchant";

  ["BladesbR"] = "Blades by Rahein";
  ["Rahein"] = "Rahein, Blade Vendor";
  ["Feledis"] = "Feledis, Axe Vendor";

  ["GeGoods"] = "雜貨商";
  ["Sathren"] = "Sathren Azuredawn, 雜貨商";
  ["Zalle"] = "Zalle, Reagent Vendor";

  ["SSPMP"] = "Shields of Silver/Plate and Mail Protection";
  ["Winthren"] = "Winthren, 盾牌商";
  ["Tynna"] = "Tynna, 鎧甲商";
  ["Keeli"] = "Keeli, 鎖甲商";

  ["Parnis"] = "Parnis, 商人";

  --Purp
  ["WElders"] = "Walk of Elders";

  ["Harene"] = "Harene Plainwalker, 德魯伊訓練師";

  ["Valaani's"] = "Valaani's Arcane Goods";
  ["Velanni"] = "Velanni, Alchemy Supplies & Reagents";
  ["Zathanna"] = "Zathanna, Wand Vendor";

  ["CGate"] = "The Shepperd's Gate";

  ["SilRegistry"] = "Silvermoon Registry";
  ["Tandrine"] = "Tandrine, 公會註冊員";
  ["Kredis"] = "Kredis, 外袍商人 ";

  ["Lynalis"] = "Lynalis, 製皮訓練師";
  ["Zaralda"] = "Zaralda, 製皮供應商";
  ["Tyn"] = "Tyn, 剝皮訓練師";

  ["Drathen"] = "Drathen, 釣魚訓練師";
  ["Olirea"] = "Olirea, 釣魚供應商";
  ["Alestus"] = "Alestus, 急救訓練師";

  --Gren
  ["RoyEx"] = "The Royal Exchange";

  ["SCI"] = "Silvermoon City Inn";
  ["Velandra"] = "Innkeeper Velandra, 旅館老闆";
  ["Suntouched"] = "Vinemaster Suntouched, Wine & Spirits Merchant";
  ["BKAdept"] = "Blood Knight Adept";
  ["Stillb"] = "Blood Knight Stillblade";

  ["Kalinda"] = "Kalinda, Jewelcrafting Trainer";
  ["Gelanthis"] = "Gelanthis, Jewelcrafting Supplier";
  ["Amin"] = "Amin, Apprentice Jewelcrafter";

  --Red
  ["FarSquare"] = "Farstriders Square";

  ["Celana"] = "Celana, 弓箭商";
  ["Matha"] = "Mathaleron, 槍械商";

  ["Osselan"] = "Osselan, Paladin Trainer";
  ["Ithelis"] = "Ithelis, Paladin Trainer";
  ["CBachi"] = "Champion Bachi, Paladin Trainer";
  ["Bvalor"] = "Knight-Lord Bloodvalor";
  ["Astalor"] = "Magister Astalor Bloodsworn (Lower Section)";
  ["Solanar"] = "Lord Solanar Bloodwrath (Lower Section)";
  ["Ileda"] = "Ileda, 武器大師";

  ["Bipp"] = "Bipp Glizzitor, 競技場戰場軍官";
  ["Karen"] = "Karen Wentworth, 阿拉希盆地戰場軍官";
  ["Gurak"] = "Gurak, 奧特蘭克山谷戰場軍官";
  ["Duyash"] = "Duyash the Cruel, 暴風之眼戰場軍官";
  ["Krukk"] = "Krukk, 戰歌峽谷戰場軍官";
  ["Mabrian"] = "Mabrian Fardawn, 遠祖灘頭戰場軍官";
  ["Mabrian&"] = "          Battlemaster";

  ["SLowerSec"] = "Stairs to Lower Section";

  ["Shalenn"] = "Shalenn, 獸欄管理員";
  ["Tana"] = "Tana, 獵人訓練師";
  ["Oninath"] = "Oninath, 獵人訓練師";
  ["Zandine"] = "Zandine, 獵人訓練師";
  ["Halthenis"] = "Halthenis, 寵物訓練師";

  ["Zelan"] = "Zelan, 採礦供應商";
  ["Belil"] = "Belil, Mining Trainer";
  ["Bemarrin"] = "Bemarrin, Blacksmithing Trainer";
  ["Eriden"] = "Eriden, Blacksmithing Supplies";

  ["Danwe"] = "Danwe, Engineering Trainer";
  ["Yatheon"] = "Yatheon, Engineering Supplier";

  --Ltblu
  ["MurRow"] = "Murder Row";

  ["Nerisen"] = "Nerisen, 盜賊訓練師";
  ["Elara"] = "Elara, 盜賊訓練師";
  ["Zelanis"] = "Zelanis, 盜賊訓練師";
  ["Darlia"] = "Darlia, 毒藥供應商";

  ["Talionia"] = "Talionia, 術士訓練師";
  ["Alamma"] = "Alamma, 術士訓練師";
  ["Zanien"] = "Zanien, 術士訓練師";

  --Orng
  ["CourtSun"] = "Court of the Sun";

  ["Camberon"] = "Camberon, 鍊金術訓練師";
  ["Nathera"] = "Botanist Nathera, Herbalist";
  ["elaris"] = "Melaris, 鍊金術供應商";

  ["Sedana"] = "Sedana, 附魔訓練師";
  ["Lyna"] = "Lyna, 附魔供應商";
  ["Zanatasia"] = "Zanatasia, 銘文學訓練師";
  ["Lelorian"] = "Lelorian, 銘文學供應商";

  --Blue
  ["SunSpire"] = "Sunfury Spire";

  ["OrbTrans"] = "Orb of Translocation to Undercity";

  ["Lor'themar"] = "Lor'themar Theron, Regent Lord of Quel'Thalas";
  ["Brightwing"] = "Halduron Brightwing, Ranger General";
  ["Rommath"] = "Grand Magister Rommath";

  ["Lotheolan"] = "Lotheolan, 牧師訓練師";
  ["Belestra"] = "Belestra, 牧師訓練師";
  ["Aldrae"] = "Aldrae, 牧師訓練師";

  ["Zaedana"] = "Zaedana, 法師訓練師";
  ["Quithas"] = "Quithas, 法師訓練師";
  ["Inethven"] = "Inethven, 法師訓練師";
  ["Narinth"] = "Narinth, 傳送門訓練師";
  
  --NPC Stormwind 暴風城
  --Ltblu

  ["Barbershop"] = "美容沙龍";

  ["ValHer"] = "Valley of Heroes";

  ["SBank"] = "Stormwind Counting House";
  ["Mahloof"] = "Officer Mahloof, Stormwind Commendations";

  ["Jorgen"] = "Jorgen";
  ["Umbrua"] = "Farseer Umbrua, 薩滿訓練師";
  ["GMarcus"] = "General Marcus Jonathan";
  ["FMAfras"] = "Field Marshal Afrasiabi";
  ["MMattin"] = "Major Mattingly";
  ["Goodman"] = "Crier Goodman (Travels throughout the city)";

  --White
  ["TDistri"] = "Trade District";

  ["SWVC"] = "Stormwind Visitor Center";
  ["AdwinL"] = "Adwin Laughlin, 公會註冊員";
  ["RebecL"] = "Rebecca Laughlin, Tabard Designer";

  ["Trias'C"] = "Trias' Cheese";
  ["ElainT"] = "Elain Trias, Mistress of Cheese";
  ["BenT"] = "Ben Trias, Apprentice of Cheese";
  ["ETrias"] = "Elling Trias, Master of Cheese";

  ["Pestle's"] = "Pestle's Apothecary";
  ["RenatG"] = "Renato Gallina";
  ["KyraB"] = "Kyra Boucher, Reagent";
  ["KeldrB"] = "Keldric Boucher, Alchemy Sypplies & Reagents";
  ["MPestl"] = "Morgan Pestle";

  ["EveryM"] = "Everyday Merchandise";
  ["StefanT"] = "Stefanie Turner";
  ["EdnaM"] = "Edna Mullby, Trade Supplies";
  ["TMull"] = "Thurman Mullby, 雜貨商";

  ["Weller's"] = "Weller's Arsenal";
  ["MardaW"] = "Marda Weller, Weapon's Merchant";
  ["GunthW"] = "Gunther Weller, Weapon's Merchant";
  ["WooPing"] = "Woo Ping, 武器大師";

  ["LionArm"] = "Lionheart Armory";
  ["CarlaG"] = "Carla Granger, 布甲商";
  ["LaraM"] = "Lara Moore, Leather Armor Merchant";
  ["AldrM"] = "Aldric Moore, 鎖甲商";
  ["HarlB"] = "Harlan Bagley";

  ["TGRI"] = "The Guided Rose Inn";
  ["InnAl"] = "Innkeeper Allison";

  ["EmpQuiv"] = "The Empty Quiver";
  ["FredeS"] = "Frederick Stover, Bow & Arrow Merchant";
  ["LinaS"] = "Lina Stover, Arrow Merchant";

  ["JSharp"] = "Jelinek Sharpshear, Barber";

  ["DungL"] = "Dungar Longdrink, Gryphon Master";

  ["FragFlow"] = "Fragrant Flowers";
  ["BGump"] = "Bernard Gump, Florist";
  ["FGump"] = "Felicia Gump, 草藥學供應商";

  ["CanalTail"] = "Canal Tailor & Fit Shop";
  ["LisbS"] = "Lisbeth Schneider, 布商";
  ["RemaS"] = "Rema Schneider";

  ["ArnoL"] = "Arnold Leland, 釣魚訓練師";
  ["CatheL"] = "Catherine Leland, 釣魚供應商";

  ["GallWine"] = "Gallina Winery";
  ["JuliG"] = "Julia Gallina, 酒商";
  ["RobertP"] = "Roberto Pupellyverbos, Meriot Connoisseur";
  ["SuzetG"] = "Suzette Gallina";

  --Orng
  ["MageQuart"] = "The Mage Quarter";

  ["Stock"] = "The Stockades";
  ["WThelw"] = "Warden Thelwater";
  ["Stocks"] = "The Stormwind Stockades Instance";

  ["CStanf"] = "Catarina Stanford, 銘文學訓練師";
  ["McCorm"] = "Stanely McCormick, 銘文學供應商";

  ["Mazen"] = "Mazen Mac'Nadir, Academy of Arcane Arts";
  ["Mazen&"] = "          & Sciences";
  ["AdairG"] = "Adair Gilroy, Librarian";
  ["ADellis"] = "Acolyte Dellis";

  ["LucanC"] = "Lucan Cordell, 附魔訓練師";
  ["JessaraC"] = "Jessara Cordell, 附魔供應商";

  ["SWStaves"] = "Stormwind Staves";
  ["ArdwynC"] = "Ardwyn Cailen, Wand Merchant";
  ["AllanH"] = "Allan Hafgan, Staves Merchant";

  ["Duncan'sT"] = "Duncan's Textiles";
  ["DuncanC"] = "Duncan Cullen, Light Armor Merchant";
  ["AlexanB"] = "Alexandra Bolero, 裁縫供應商";
  ["GeorgB"] = "Georgio Bolero, Tailoring Trainer";
  ["Clavicus"] = "Clavicus Knavingham. 聯盟 Cloth";
  ["Clavicus&"] = "          Quartermaster";

  ["AlcNee"] = "Alchemy Needs";
  ["Tannysa"] = "Tannysa, 草藥學訓練師";
  ["Lilyss"] = "Lilyssia Nightbreeze, 鍊金術訓練師";
  ["MariaL"] = "Maria Lumere, 鍊金術供應商";
  ["Eldra"] = "Eldraeith, 草藥學供應商";

  ["CollinM"] = "Collin Mauren";

  ["BlueRec"] = "The Blue Recluse";
  ["Joachim"] = "Joachim Brenlow, 酒保";
  ["ConnerR"] = "Conner Rivers, Apprentice Chef";
  ["SLohan"] = "Steven Lohan";
  ["AStern"] = "Angus Stern, Head Chef";
  ["CFire"] = "Cooking Fire";

  ["AMalin"] = "Archmage Malin";

  ["WizSan"] = "Wizard's Sanctum (Central Tower)";
  ["HAndromath"] = "High Sorcerer Andromath";
  ["JCannon"] = "Jennea Cannon, 法師訓練師";
  ["Elsharin"] = "Elsharin, 法師訓練師";
  ["MDumas"] = "Maginor Dumas, Master Mage";
  ["LPurdue"] = "Larimaine Purdue, 傳送門訓練師";

  ["LarsonClo"] = "Larson Clothiers";
  ["WLarson"] = "Wynne Larson, Robe Merchant";
  ["ELarson"] = "Evan Larson, Hatter";

  ["EssenComp"] = "Essential Components";
  ["OVaughn"] = "Owen Vaughn, Reagents";

  ["AncientCu"] = "Ancient Curios";
  ["Yserian"] = "Charys Yserian, Arcane Trinkets Vendor";

  ["SlaughtLa"] = "The Slaughtered Lamb";
  ["Jarel"] = "Jarel Moore, 酒保";
  ["Jalane"] = "Jalane Ayrole, Master Shadoweave Tailor";
  ["Zardeth"] = "Zardeth of the Black Claw";
  ["Sandahl"] = "Sandahl, 術士訓練師";
  ["Gakin"] = "Gakin the Darkbinder";
  ["Cloyce"] = "Demisette Cloyce, 術士訓練師";
  ["Deline"] = "Ursula Deline, 術士訓練師";
  ["Spackle"] = "Spackle Thornberry";

  ["Pyrot"] = "Pyrotechnics";
  ["Singh"] = "Darian Singh, Fireworks Vendor";

  --Cyan
  ["SWPark"] = "The Park";

  ["Folsom"] = "Caretaker Folsom";

  ["Sylista"] = "Sylista, 獸欄管理員";

  ["SWInn"] = "Inn";

  ["Shylamir"] = "Shylamir, 草藥學訓練師";

  ["Tavern"] = "Tavern";

  ["ArgosN"] = "Argos Nightwhisper";
  ["Sheldras"] = "Sheldras Moontree, 德魯伊訓練師";
  ["Theridian"] = "Theridian, 德魯伊訓練師";
  ["Maldryn"] = "Maldryn, 德魯伊訓練師";
  ["NaraM"] = "Nara Meideros, 牧師訓練師";

  ["WAP"] = "These three wander around the Park";
  ["Shailiea"] = "Shailiea";
  ["KimberG"] = "Kimberly Grant";
  ["KellyG"] = "Kelly Grant";

  --Red
  ["SWHarbor"] = "The Stormwind Harbor";

  ["Thargold"] = "Thargold Ironwing";
  ["Nayura"] = "Nayura, Dockmaster";
  ["SAuberd"] = "Ship to Auberdine";
  ["Assurance"] = "The Assurance";
  ["PCarver"] = "Captain Paul Carver";
  ["GCPK"] = "Galley Chief Paul Kubit, 食物和飲料商人";
  ["CurtisP"] = "Engineer Curtis Paddock, Trade Supplies";
  ["LeeshaT"] = "Leesha Tannerby, Dockmaster";
  ["SVali"] = "Ship to Valiance Keep";
  ["StevenA"] = "Steven Allen";
  ["SWlight"] = "Stormwind lighthouse";

  --Purp
  ["CathSqua"] = "Cathedral Square";

  ["MorrisL"] = "Morris Lawry";

  ["FThread"] = "The Finest Thread";

  ["JMaces"] = "Just Maces";
  ["GArdus"] = "Gregory Ardus, Staff & Mace Merchant";

  ["RPlates"] = "Righteous Plates";
  ["AgustM"] = "Agustus Moulaine, 鎖甲商";
  ["TheresM"] = "Theresa Moulaine, 長袍商";

  ["BKrist"] = "Brother Kristoff";

  ["OMNight"] = "Orphan Matron Nightingale";
  ["Shel"] = "Shellene, Orphan Matron";

  ["CathLig"] = "Cathedral of Light";
  ["BSarno"] = "Brother Sarno";
  ["Rall"] = "Dunthorian Rall";
  ["BFarth"] = "Bishop Farthing";
  ["ABBened"] = "Arch Bishop Benedictus";
  ["Gazin"] = "Gazin Tenorm";
  ["HPLaur"] = "High Priestess Laurena, 牧師訓練師";
  ["JoshPT"] = "Brother Joshua, 牧師訓練師";
  ["Benj"] = "Brother Benjamin, 牧師訓練師";

  ["Grayson"] = "Lord Grayson Shadowbreaker, Paladin Trainer";
  ["KathPT"] = "Katherine the Pure, Paladin Trainer";
  ["ArthPT"] = "Arthur the Faithfull, Paladin Trainer";

  ["SFull"] = "Sharina Fuller, 急救訓練師";
  ["BCass"] = "Brother Cassius, Reagent Vendor";

  ["CathLigD"] = "Cathedral of Light (Downstairs)";
  ["BAnton"] = "Brother Anton, Scarlet Crusade Emissary";

  ["CityHall"] = "City Hall";
  ["BarosA"] = "Baros Alexston, City Architect";
  ["RFBathr"] = "Royal Factor Bathrilor, Stormwind Census";

  ["ArgentD"] = "銀色黎明";

  ["OEmma"] = "Ol' Emma (Travels to the well in the Trade District";
  ["OEmma&"] = "          and back to her house every fifteen minutes)";

  --Yell
  ["DwarvDist"] = "The Dwarven District";

  ["CTAlley"] = "Cut-Throat Alley";

  ["GelmanS"] = "Gelman Stonehand, Mining Trainer";
  ["BrookS"] = "Brook Stonebraid, 採礦供應商";

  ["BorgusS"] = "Borgus Steelhand, Weaponsmith Trainer";
  ["KathA"] = "Kathrum Axehand, 斧商";
  ["Grimand"] = "Grimand Elmore";

  ["ThulmF"] = "Thulman Flintcrag, Guns Vendor";

  ["Shoni"] = "Shoni the Shilent";

  ["LilliS"] = "Lilliam Sparkspinkdle, Engineering Trainer";
  ["BilliC"] = "Billibub Cogspinner, Engineering Supplier";

  ["EyeStorm"] = "Eye of the Storm Emissary";

  ["TherumD"] = "Therum Deepforge, Blacksmithing Trainer";
  ["KaitaD"] = "Kaita Deepforge, Blacksmithing Supplies";
  ["Hank"] = "Hank the Hammer, Mithril Order";
  ["Furen"] = "Furen Longbeard";
  ["BeniB"] = "Beni Boltshear, 鎖匠";

  ["Jenova"] = "Jenova Stoneshield, 獸欄管理員";
  ["Einris"] = "Einris Brightspear, 獵人訓練師";
  ["Ulfir"] = "Ulfir Ironbeard, 獵人訓練師";
  ["Thorfin"] = "Thorfin Stoneshield, 獵人訓練師";

  ["Morgg"] = "Morgg Stormshot";

  ["Brohann"] = "Brohann Caskbelly, Explorerers' League";
  ["Wilder"] = "Wilder Thistlenettle";

  --Blue
  ["SWKeep"] = "Stormwind Keep";

  ["PetCham"] = "Petitioner's Chamber";
  ["CRRidge"] = "Count Remington Ridgewell, House of Nobles";
  ["LBWishock"] = "Lord Baurles K. Wishock, House of Nobles";
  ["Caledra"] = "Caledra Dawnbreeze";

  ["Varian"] = "King Varian Wrynn, King of Stormwind";
  ["Anduin"] = "Anduin Wrynn, Prince of Stormwind";
  ["ETaluun"] = "Emissary Taluun";

  ["Delavey"] = "Bishop Delavey";

  ["WarRoom"] = "War Room";
  ["Jes-Ter"] = "Grand Admiral Jes-Tereth";
  ["MithI"] = "Mithras Ironhill";
  ["Beka"] = "Beka Zipwhistle, 競技場戰場軍官";
  ["ThelmS"] = "Thelman Slatefist, Alterac Valley, 競技場戰場軍官";
  ["Elfarran"] = "Elfarran, Warsong Gultch Battlemaster";
  ["Jovil"] = "Jovil, 暴風之眼戰場軍官";
  ["Hotes"] = "Lady Hoteshem, 阿拉希盆地戰場軍官";
  ["Bethany"] = "Bethany Aldire, 遠祖灘頭戰場軍官 Battlemaster";

  ["MSamuel"] = "Major Samuelson, Stormwind City Guard";

  ["Tyrion"] = "Tyrion";
  ["Alicia"] = "Alicia";

  ["RoyLib"] = "Royal Library";
  ["Milton"] = "Milton Sheaf, Librarian";
  ["Donyal"] = "Donyal Tovald, Librarian";
  ["GregorL"] = "Lord Gregor Lescovar";

  ["RoyGal"] = "Royal Gallery";

  --Gren
  ["OldTown"] = "Old Town";

  ["HHW"] = "Heavy Handed Weapons";
  ["GKoen"] = "Gerik Koen, Two-Handed Weapon Merchant";

  ["Pig&W"] = "Pig & Whistle Tavern";
  ["ReeseL"] = "Reese Langston, Tavernkeeper";
  ["SRyback"] = "Stephen Ryback, 烹飪訓練師";
  ["ETate"] = "Erika Tate, 烹飪供應商";
  ["KKabon"] = "Kendor Kabonka, Master of Cooking Recipes";
  ["Bartleby"] = "Bartleby, Drunk";
  ["DLangs"] = "David Langston";
  ["Aedis"] = "Aedis Brom";
  ["Faral"] = "Christoph Faral";
  ["HarryB"] = "Harry Burlguard";
  ["EllyLang"] = "Elly Langston, 酒吧女服務員";

  ["FDV"] = "The Five Deadly Venoms";
  ["Lenney"] = "Lenney 'Fingers' McCoy (outside)";
  ["Beasley"] = "Ol'Beasley (outside)";
  ["Dashel"] = "Dashel Stonefist (outside)";
  ["MilesS"] = "Miles Sidney, 毒藥供應商";
  ["Wright"] = "Wright Williams";

  ["HonestB"] = "Honest Blades";
  ["Heinrich"] = "Heinrich Stone, 劍刃商人";

  ["Immuni"] = "Limited Immunity";
  ["OStrang"] = "Osric Strang, 重型護甲商人";
  ["WStrang"] = "Wilhelm Strang, 鎖甲商";

  ["Osborne"] = "Osborne the Night Man, 盜賊訓練師";

  ["CHall"] = "Champion's Hall";
  ["O'Neal"] = "Captain O'Neal, Jewelcrafting Quartermaster";
  ["Jacksp"] = "Lieutenant Jackspring, Weapons Quartermaster";
  ["Biggin"] = "Master Sergeant Biggins, Officer Accessories";
  ["Biggin&"] = "          Quartermaster";
  ["Karter"] = "Lieutenant Karter, Mount Vendor";
  ["Tristia"] = "Lieutenant Tristia, Veteran Armor Quartermaster";
  ["Skyshad"] = "Sergeant Major Skyshadow";
  ["Ennarth"] = "Harbinger Ennarth";
  ["Gaiman"] = "Archmage Gaiman";
  ["Vaccar"] = "Lieutenant Major Vaccar";
  ["Dirgeh"] = "Captain Dirgehammer, Apprentice Armor";
  ["Dirgeh&"] = "          Quartermaster";
  ["Moonst"] = "Knight-Lieutenant Moonstrike, Armor";
  ["Moonst&"] = "          Quartermaster";
  ["Clate"] = "Sergeant Major Clate, Armor Quartermaster";

  ["ComCent"] = "Command Center";
  ["Wood"] = "Master Wood";
  ["IlsaC"] = "Ilsa Corbin, 戰士訓練師";
  ["WuShen"] = "Wu Shen, 戰士訓練師";
  ["AnderG"] = "Ander Germaine, 戰士訓練師";

  ["SI:7"] = "SI:7";
  ["Mathias"] = "Master Mathias Shaw, Leader of SI:7";
  ["Renzik"] = "Renzik 'The Shiv', SI:7 Operative";
  ["Sloan"] = "Sloan McCoy, 毒藥供應商";
  ["Fel"] = "Jasper Fel, Shady Dealer";
  ["Romano"] = "Lord Tony Romano, 盜賊訓練師";
  ["Mixil"] = "Doc Mixilpixil (downstairs)";

  ["ProHide"] = "The Protective Hide";
  ["STanner"] = "Simon Tanner, 製皮訓練師";
  ["JTanner"] = "Jillian Tanner, 製皮供應商";
  ["Granger"] = "Maris Granger, 剝皮訓練師";
  ["AlyssaG"] = "Alyssa Griffith, 背包商人";
  ["SeomanG"] = "Seoman Griffith, Leather Armor Merchant";
  ["Noah"] = "Little Noah";

  ["ThanBoo"] = "Thane's Boots";
  ["Mayda"] = "Mayda Thane, 製鞋匠";

  ["SilverSh"] = "The Silver Shield";
  ["BCross"] = "Bryan Cross, 盾牌商";

  ["JennL"] = "Jenn Langston (Does a circuit around Old Town)";
  ["Nikova"] = "Nikova Raskol (Does a circuit around Old Town";
  ["Nikova&"] = "          stopping at three places for a few";
  ["Nikova&1"] = "          minutes each stop)";
  
  --NPC Thunder Bluff 雷霆崖
  --White
  ["LLevel"] = "The Lower Rise";

  ["Pala"] = "Innkeeper Pala";
  ["Bulrug"] = "Bulrug, 獸欄管理員";
  ["AtHR"] = "Access to The Hunter Rise";

  ["ElevM"] = "Elevator to Mulgore";

  ["TBCI"] = "Thunder Bluff Civic Information";
  ["Thrumn"] = "Thrumn, 外袍商人 ";
  ["Krumn"] = "Krumn, 公會註冊員";
  ["Scorch"] = "Scorching Fire";

  ["Kuruk's"] = "Kuruk's Goods";
  ["Kuruk"] = "Kuruk, 雜貨商";
  ["Pakwa"] = "Pakwa, 背包商人";

  ["TGASu"] = "Trade Goods and Supplies";
  ["ShadiM"] = "Shadi Mistrunner, Trade Goods Supplies";

  ["Jyn"] = "Jyn Stonehoof, Weapons Merchant";
  ["Ansek"] = "Ansekhwa, 武器大師";

  ["Hewa's"] = "Hewa's Armory";
  ["Hewa"] = "Hewa, 布甲商";
  ["Elki"] = "Elki, 鎖甲商";
  ["Ahanu"] = "Ahanu, Armor Merchant";

  ["Tal"] = "Tal, Wind Rider Master";
  ["ALLMLUL"] = "Access to The Lower Rise, The Middle Rise and";
  ["ALLMLUL&"] = "          The Upper Rise";

  ["derstr"] = "Officer Thunderstrider, Thunder Bluff";
  ["derstr&"] = "          Commendations";

  ["BandG"] = "Breads and Grains";
  ["Fry"] = "Fry Mistrunner, Bread Vendor";

  ["Karn's"] = "Karn's Smithy";
  ["Karn"] = "Karn Stonehoof, Blacksmithing Trainer";
  ["Taur"] = "Taur Stonehoof, Blacksmithing Supplies";
  ["Orm"] = "Orm Stonehoof";

  ["Truths"] = "Sage Truthseeker";
  ["AtSR"] = "Access to The Spirit Rise";

  ["Geology"] = "Stonehoof Geology";
  ["Brek"] = "Brek Stonehoof, Mining Trainer";
  ["KurmS"] = "Kurm Stonehoof, 採礦供應商";

  ["Eyahn"] = "Eyahn Eagletalon";
  ["Auld"] = "Auld Stonespire";

  ["Chepi"] = "Chepi, Reagent Vendor (Does a circle around the";
  ["Chepi&"] = "          Lower Rise)";
  ["Windst"] = "Bluff Runner Windstrider (Travels between the";
  ["Windst&"] = "          Lower Rise and the Upper Rise)";

  --Purp
  ["MLevel"] = "The Middle Rise";

  ["Thund"] = "Thunderhorn's Archery";
  ["Kuna"] = "Kuna Thunderhorn, Bowyer & Fletching Goods";

  ["FaV"] = "Fruits and Vegetables";
  ["Nan"] = "Nan Mistrunner, Fruit Vendor";

  ["Holis"] = "Holistic Herbalism";
  ["Komin"] = "Komin Winterhoof, 草藥學訓練師";
  ["Nida"] = "Nida Winterhoof, 草藥學供應商";

  ["AtER"] = "Access to The Elder Rise";

  ["CloudB"] = "Cloudeweavers Baskets";
  ["Tand"] = "Tand, Basket Weaver";

  ["Bena's"] = "Bena's Alcehcmy";
  ["Bena"] = "Bena Winterhoof, 鍊金術訓練師";
  ["Mani"] = "Mani Winterhoof, 鍊金術供應商";

  ["TBEnchanters"] = "Dawnstrider Enchanters";
  ["Teg"] = "Teg Dawnstrider, 附魔訓練師";
  ["Nata"] = "Nata Dawnstrider, 附魔供應商";

  ["TBArmorers"] = "Thunder Bluff Armorers";
  ["Mooranta"] = "Mooranta, 剝皮訓練師";
  ["Veren"] = "Veren Tallstrider";
  ["Tepa"] = "Tepa, Tailoring Trainer";
  ["Mahu"] = "Mahu, Leatherworking & 裁縫供應商";
  ["Tagain"] = "Tagain, 布甲商";
  ["Fela"] = "Fela, 重型護甲商人";
  ["Grod"] = "Grod, Leather Armour Merchant";
  ["Una"] = "Una, 製皮訓練師";
  ["Rumstag"] = "Rumstag Proudstrider, 部落 Cloth";
  ["Rumstag&"] = "          Quartermaster";

  --Yell
  ["ULevel"] = "The Upper Rise";

  ["Rainsticks"] = "Rainsticks";
  ["Sunn"] = "Sunn Ragetotem, 法杖商";

  ["KS&R"] = "Kodo Steak & Ribs";
  ["Kaga"] = "Kaga Mistrunner, Meat Vendor";

  ["WinterT"] = "Winterhoof Totems";
  ["Tah"] = "Tah Winterhoof";

  ["MTB&T"] = "Mountaintop Bait & Tackle";
  ["Kah"] = "Kah Mistrunner, 釣魚訓練師";
  ["Sewa"] = "Sewa Mistrunner, 釣魚供應商";

  ["CairneB"] = "Cairne Bloodhoof, High Chieftain";

  ["Halpa"] = "Halpa, Prairie Dog Vendor";

  ["TBFirea"] = "Thunderbluff Firearms";
  ["Hogor"] = "Hogor Thunderhoof, Guns Merchant";

  ["Raget"] = "Ragetotem Arms";
  ["Delgo"] = "Delgo Ragetotem, 斧商";
  ["Etu"] = "Etu Ragetotem, 錘和法杖商人";
  ["Ohanko"] = "Ohanko, Two Handed Weapon Merchant";
  ["Kard"] = "Kard Ragetotem, Sword & Dagger Merchant";

  ["Sura"] = "Sura Wildmane, War Harness Vendor";

  ["Aska's"] = "Aska's Kitchen";
  ["Aska"] = "Aska Mistrunner, 烹飪訓練師";
  ["Naal"] = "Naal Mistrunner, 烹飪供應商";

  ["Zangen"] = "Zangen Stonehoof";

  --Blue
  ["HuntR"] = "The Hunter Rise";

  ["HHall"] = "Hunter's Hall";
  ["Urek"] = "Urek Thunderhorn, 獵人訓練師";
  ["Kary"] = "Kary Thunderhorn, 獵人訓練師";
  ["Holt"] = "Holt Thunderhorn, 獵人訓練師";
  ["Sark"] = "Sark Ragetotem, 戰士訓練師";
  ["Torm"] = "Torm Ragetotem, 戰士訓練師";
  ["Ker"] = "Ker Ragetotem, 戰士訓練師";

  ["Saern"] = "Saern Priderunner";
  ["Melor"] = "Melor Stonehoof";

  ["Althal"] = "Althallen Brightblade, 暴風之眼戰場軍官";
  ["Martin"] = "Martin Lindsey, 阿拉希盆地戰場軍官";
  ["Fizim"] = "Fizim Blastwrench, 競技場戰場軍官";

  ["Kergul"] = "Kergul Bloodaxe, Warsong Gultch Battlemaster";
  ["Ufuda"] = "Godo Cloudchewer, 遠祖灘頭戰場軍官";
  ["Ufuda&"] = "          Battlemaster";
  ["Taim"] = "Taim Ragetotem, 奧特蘭克山谷戰場軍官";

  ["Mosarn"] = "Mosarn";

  ["Hesuwa"] = "Hesuwa Thunderhorn, 寵物訓練師";

  --Gren
  ["ERise"] = "The Elder Rise";

  ["HElders"] = "Hall of Elders";
  ["Kym"] = "Kym Wildmane, 德魯伊訓練師";
  ["Turak"] = "Turak Runetotem, 德魯伊訓練師";
  ["Sheal"] = "Sheal Runetotem, 德魯伊訓練師";
  ["Nara"] = "Nara Wildmane";
  ["ADHamuul"] = "Arch Druid Hamuul Runetotem";

  ["Bashana"] = "Bashana Runetotem";

  ["Rahuro"] = "Rahuro, Magatha's Servant";
  ["Magatha"] = "Magatha Grimtotem, Elder Crone";
  ["Cor"] = "Cor Grimtotem";
  ["Gorm"] = "Gorm Grimtotem";

  ["ERDrums"] = "Elder Rise Drums";
  ["Sheza"] = "Sheza Wildmane";

  ["Ghede"] = "Ghede";

  --Orng
  ["SRise"] = "The Spirit Rise";

  ["HallofS"] = "Hall of Spirits";
  ["Beram"] = "Beram Skychaser, 薩滿訓練師";
  ["Siln"] = "Siln Skychaser, 薩滿訓練師";
  ["Tigor"] = "Tigor Skychaser, 薩滿訓練師";
  ["Xanis"] = "Xanis Flameweaver";

  ["SHealing"] = "Spiritual Healing";
  ["Pand"] = "Pand Stonebinder, 急救訓練師";

  ["Pawe"] = "Pawe Mistrunner";

  ["PVision"] = "Pools of Vision";
  ["Clarice"] = "Clarice Foster";
  ["Poshken"] = "Poshken Hardbinder, 銘文學訓練師";
  ["Mertle"] = "Mertle Murkpen, 銘文學供應商";
  ["Malakai"] = "Malakai Cross, 牧師訓練師";
  ["Zamah"] = "Apothecary Zamah, Royal Apothecary Society";
  ["Cranst"] = "Birgitte Cranston, 傳送門訓練師";
  ["Shymm"] = "Archmage Shymm, 法師訓練師";
  ["Welsh"] = "Miles Welsh, 牧師訓練師";
  ["Ursyn"] = "Ursyn Ghull, 法師訓練師";
  ["FCobb"] = "Father Cobb, 牧師訓練師";
  ["Xane"] = "Thurston Xane, 法師訓練師";
  
  --NPC Undercity 幽暗城
  --White
  ["TraQuart"] = "The Trade Quarter";

  ["Aucti"] = " Auctioneer (Just outside of the Trade Quarter";
  ["Aucti&"] = "           in the Canals)";

  ["ERusk"] = "Eleanor Rusk, 雜貨商";
  ["GenGoods"] = " 雜貨商";

  ["FDoan"] = "Felicia Doan, Trade Supplies";
  ["GCallow"] = "Genavie Callow";

  ["BHandler"] = "Bat Handler";
  ["MGarrett"] = "Michael Garrett, Bat Handler";
  ["PGarrett"] = "Patrick Garrett";

  ["OGothena"] = "Officer Gothena, Undercity Commendations";

  ["UWeapons"] = "Weapons";
  ["GWendham"] = "Gordon Wendham, Weapons Merchant";
  ["LWarren"] = "Louis Warren, Weapons Merchant";

  ["UHArmor"] = "Heavy Armor";
  ["TWeldon"] = "Timothy Weldon, 重型護甲商人";
  ["WElling"] = "Walter Ellingson, 重型護甲商人";

  ["ULArmor"] = "Light Armor";
  ["LNewcomb"] = "Lauren Newcomb, Light Armor Merchant";
  ["DBartlett"] = "Daniel Bartlett, Trade Supplies";

  ["AMaulray"] = "Anya Maulray, 獸欄管理員";
  ["INorman"] = "Innkeeper Norman";

  ["MReagents"] = "Mordan's Reagents";
  ["Mordan"] = "Mordan, Reagent Vendor";

  ["NaznikS"] = "Naznik Sureshave, Barber";
  ["ECairn"] = "Edward Cairn, Elder";

  ["GuildCT"] = "Guild Creation/Tabards";
  ["ROBauhaus"] = "Royal Overseer Bauhaus, Undercity  Census";
  ["EReming"] = "Edward Remington, 公會外袍設計師";
  ["CDrakul"] = "Christopher Drakul, 公會註冊員";
  ["MPleas"] = "Merill Pleasance, 外袍商人 ";

  ["UCook"] = "Cooking";
  ["EBurch"] = "Eunice Burch, 烹飪訓練師";
  ["RBurch"] = "Ronald Burch, 烹飪供應商";
  ["RAndrean"] = "Raleigh Andrean, Ex-Chef";

  ["TawnyG"] = "Tawny Grisette, Mushroom Vendor (Does a";
  ["TawnyG&"] = "          circle on the upper area of the Trade";
  ["TawnyG&1"] = "          Quarter)";

  ["JPayson"] = "Jeremiah Payson, Cockroach Vendor";

  ["Balth"] = "Harbinger Balthazad (Does a circuit in the";
  ["Balth&"] = "          Trade Quarter and in the Canals just";
  ["Balth&1"] = "          outside the Trade Quarter)";

  --Purp
  ["Apothe"] = "The Apothecarium";

  ["dugur"] = "Keeper Bel'dugur";

  ["UHerba"] = "Herbalist";
  ["MAllie"] = "Martha Alliestar, 草藥學訓練師";
  ["KAllie"] = "Katrina Alliestar, 草藥學供應商";

  ["ALuca"] = "Alessandro Luca, Blue Moon Odds and Ends";

  ["UEnchant"] = "Enchantment";
  ["LCrowe"] = "Lavinia Crowe, 附魔訓練師";
  ["TWebb"] = "Thaddeus Webb, 附魔供應商";

  ["Parq"] = "Parqual Fintallas";

  ["AGant"] = "Andron Gant";

  ["Alchemist"] = "Alchemist";
  ["Algernon"] = "Algernon, 鍊金術供應商";
  ["DMarsh"] = "Doctor Marsh, Apprentice Alchemist";

  ["DMFelben"] = "Doctor Martin Felben, Apprentice Alchemist";
  ["MAFaranell"] = "Master Apothecary Faranell, Royal Apothecary";
  ["MAFaranell&"] = "          Society";
  ["DHHalsey"] = "Doctor Herbert Halsey, 鍊金術訓練師";
  ["Fuely"] = "Chemist Fuely";
  ["Cuely"] = "Chemist Cuely";
  ["TheodG"] = "Theodore Griffs";
  ["Zinge"] = "Apothecary Zinge";
  ["AKeev"] = "Apothecary Keever, Royal Apothecary Society";

  --Blue
  ["WarQuart"] = "The War Quarter";

  ["GerardA"] = "Gerard Abernathy";
  ["LeonaT"] = "Leona Tharpe";
  ["JoannW"] = "Joanna Whitehall";

  ["UBowM"] = "弓箭商人";
  ["AbigS"] = "Abigail Sawyer, 弓箭商人";

  ["UMining"] = "Mining";
  ["BromK"] = "Brom Killian, Mining Trainer";
  ["SarahK"] = "Sarah Killan, 採礦供應商";

  ["UWeapM"] = "Weapons Merchants";
  ["Abald"] = "Archibald, 武器大師";
  ["GeoffH"] = "Geoffrey Hartwell, Weapon Merchant";
  ["BeniF"] = "Benijah Fenner, Weapon Merchant";
  ["FranE"] = "Francis Eliot, Weapon Merchant";

  ["UBlacks"] = "Blacksmith";
  ["JVBrunt"] = "James Van Brunt, Blacksmithing Trainer";
  ["SVBrunt"] = "Samuel Van Brunt, Blacksmithing Supplies";
  ["MTrem"] = "Mirelle Tremayne, 重型護甲商人";

  ["UGunsm"] = "槍械商";
  ["NAtwood"] = "Nicholas Atwood, 槍械商人";

  ["HAtwood"] = "Helena Atwood";

  ["SHouser"] = "Sergeant Houser";
  ["SRutger"] = "Sergeant Rutger";

  ["FLanke"] = "Father Lankester, 牧師訓練師";
  ["FLaza"] = "Father Lazarus, 牧師訓練師";
  ["UAelth"] = "Aelthalyste, 牧師訓練師";
  ["BFowl"] = "Baltus Fowler, 戰士訓練師";
  ["ACurt"] = "Angela Curthas, 戰士訓練師";
  ["ChristW"] = "Christopher Walker, 戰士訓練師";

  --Gren
  ["MagQuart"] = "The Magic Quarter";

  ["UStaff"] = "法杖商";
  ["SUpton"] = "Sydney Upton, 法杖商";
  ["ZaneB"] = "Zane Bradford, Wand Vendor";

  ["UTailor"] = "Tailor";
  ["RalsF"] = "Ralston Farnsley, 部落 Cloth Quartermaster"; 
  ["SVCroy"] = "Sheldon Von Croy, 布甲商";
  ["Josef"] = "Josef Gregorian, Tailoring Trainer";
  ["Millie"] = "Millie Gregorian, 裁縫供應商";
  ["LuciC"] = "Lucille Castleton, 長袍商";

  ["OranS"] = "Oran Snakewrithe";
  ["SamaS"] = "Samatha Shackleton";
  ["AndrB"] = "Andrew Brownell";

  ["UCarto"] = "Cartography";
  ["JorahA"] = "Jorah Annison";

  ["UBook"] = "Book Dealer";
  ["SalazB"] = "Salazar Bloch, Book Dealer";

  ["UReag"] = "Reagent Vendor";
  ["HannA"] = "Hannah Akeley, Reagent Supplies";

  ["URelic"] = "Relic Vendor";
  ["SilasZ"] = "Silas Zimmer";

  ["JList"] = "Josephine Lister, Master Shadoweave Tailor";

  ["CHalg"] = "Carendin Halgar";

  ["UpLevel"] = "Upper Level";
  ["LMort"] = "Lexington Mortaim, 傳送門訓練師";
  ["BIces"] = "Bethor Iceshard";

  ["RKerw"] = "Richard Kerwin, 術士訓練師";

  ["AHart"] = "Anastasia Hartwell, 法師訓練師";

  ["LoLevel"] = "Lower Level";
  ["LPick"] = "Luther Pickman, 術士訓練師";
  ["KaalS"] = "Kaal Soulreaper, 術士訓練師";
  ["KaelyH"] = "Kaelystia Hatebringer, 法師訓練師";
  ["PiercS"] = "Pierce Shackleton, 法師訓練師";
  ["MartS"] = "Martha Strain";
  ["GodrF"] = "Godrick Farsan";

  ["ArmaC"] = "Armand Cromwell, 釣魚訓練師";
  ["LizbC"] = "Lizbeth Cromwell, 釣魚供應商";

  --Orng
  ["RogQuart"] = "The Rogues' Quarter";

  ["UDag"] = "Daggers";
  ["CSeat"] = "Charles Seaton, 劍刃商人";
  ["NStee"] = "Nathaniel Steenwick, 投擲武器商人";

  ["UPois"] = "Poison";
  ["EGrav"] = "Ezekiel Graves, Poison Vendor";

  ["MEdra"] = "Mary Edras, 急救訓練師";

  ["ULeat"] = "Leather Work";
  ["ArthM"] = "Arthur Moore, 製皮訓練師";
  ["JoseM"] = "Joseph Moore, 製皮供應商";
  ["GillM"] = "Gillian Moore, Leather Armor Merchant";
  ["KillH"] = "Killian Hagey, 剝皮訓練師";

  ["UBag"] = "背包商人";
  ["JonaC"] = "Jonathan Chambers, 背包商人";

  ["UEngin"] = "Engineering";
  ["FrankL"] = "Franklin Lloyd, Engineering Trainer";
  ["ElizVT"] = "Elizabeth Van Talen, 工程學供應商";
  ["GrahVT"] = "Graham Van Talen, Apprentice Engineer";
  ["LucF"] = "Lucian Fenner";

  ["EsteG"] = "Estelle Gendry";

  ["CaroW"] = "Carolyn Ward, 盜賊訓練師";
  ["MileD"] = "Miles Dexter, 盜賊訓練師";
  ["GregC"] = "Gregory Charles, 盜賊訓練師";
  ["MennC"] = "Mennet Carkard";

  ["WaltS"] = "Walter Soref, 鎖匠";

  --Red
  ["RoyalQua"] = "The Royal Quarter";

  ["LadWindr"] = "Lady Sylvanas Windrunner, Banshee Queen";
  ["Sharl"] = "Sharlindra";
  ["Varima"] = "Varimathras";
  ["ASunsor"] = "Ambassador Sunsorrow";
  ["CyssaD"] = "Champion Cyssa Dawnrose, Paladin Trainer";

  ["GrizHalf"] = "Grizzle Halfmane, 奧特蘭克山谷戰場軍官";

  ["RexPix"] = "Rex Pixem, 競技場戰場軍官";

  ["SirMalo"] = "Sir Malory Wheeler, 阿拉希盆地戰場軍官";

  ["Lyrlia"] = "Lyrlia Blackshield, 暴風之眼戰場軍官";

  ["KurdB"] = "Kurden Bloodcalw, Warsong Gultch Battlemaster";
  ["SForth"] = "Sara Forthright, 遠祖灘頭戰場軍官";
  ["SForth&"] = "          Battlemaster";
  
};

end

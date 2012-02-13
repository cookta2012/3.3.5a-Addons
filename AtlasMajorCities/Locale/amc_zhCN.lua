--[[
    Project: AtlasMajorCities Simplified Chinese Translation
    Author: Yeachan (yeachan@live.com)
    Discripton: Chinese(simp) NPC Plugin for AtlasMajorCities.
    Release Date: May 28.2009
    Release Version: 1.5
    Internal: AMC.zhCN.15
]]--

if ( GetLocale() == "zhCN" ) then

AMCLocale = {

--Common	
  ["Major Cities"] = "主城";
  ["Dalaran"] = "达拉然 (中立)";
  ["Dal Sewers"] = "达拉然下水道 (中立)";
  ["Darnassus"] = "达纳苏斯 (联盟 - 暗夜精灵)";
  ["Ironforge"] = "铁炉堡 (联盟 - 矮人)";
  ["Orgrimmar"] = "奥格瑞玛 (部落 - 兽人)";
  ["Stormwind"] = "暴风城 (联盟 - 人类)";
  ["Thunder Bluff"] = "雷霆崖 (部落 - 牛头人)";
  ["Undercity"] = "幽暗城 (部落 - 亡灵)";
  ["Shattrath"] = "沙塔斯城 (中立)";
  ["Silvermoon"] = "银月城 (部落 - 血精灵)";
  ["Exodar"] = "埃索达 (联盟 - 德莱尼)";
  
--Locations  
  ["Crystalsong"] = "晶歌森林";
  ["Teldrassil"] = "泰达希尔";
  ["Dun Morogh"] = "丹莫罗";
  ["Durotar"] = "杜隆塔尔";
  ["Elwynn Forest"] = "艾尔文森林";
  ["Mulgore"] = "莫高雷";
  ["Tirisfal Glades"] = "提瑞斯法林地";
  ["Terokkar Forest"] = "泰罗卡森林";
  ["Eversong Woods"] = "永歌森林";
  ["Azuremyst Isle"] = "秘蓝岛";

--Common Names, Items & Buildings  
  ["Inn"] = "旅店";
  ["Mailbox"] = "邮箱";
  ["Forge"] = "熔炉";
  ["Stove"] = "烹饪炉";
  ["AH"] = "拍卖行";
  ["Bank"] = "银行";
  ["Bshop"] = "理发店";              --no localized
  ["Alliance Brigadier"] = "联盟准将";
  ["Ancients Emissary"] = "远古海滩大使";
  ["E Dummy"] = "专家的训练假人";
  ["M Dummy"] = "大师的训练假人";
  ["G Dummy"] = "宗师的训练假人";
  ["H Dummy"] = "英雄训练假人";
  ["Bows"] = "          弓";
  ["Fist Weapons"] = "          拳套";
  ["Staves"] = "          法杖";
  ["Thrown"] = "          投掷武器";
  ["Daggers"] = "          匕首";
  ["Crossbow"] = "          弩";
  ["Guns"] = "          枪";
  ["Polearms"] = "          长柄武器";
  ["One-Handed Maces"] = "          单手锤";
  ["Two-Handed Maces"] = "          双手锤";
  ["Two-Handed Sword"] = "          双手剑";
  ["One-Handed Sword"] = "          单手剑";
  ["One-Handed Axes"] = "          单手斧";
  ["Two-Handed Axes"] = "          双手斧";
  ["PorStor"] = "暴风城传送门";
  ["PorIron"] = "铁炉堡传送门";
  ["PorDarn"] = "达纳苏斯传送门";
  ["PorExod"] = "埃索达传送门";
  ["PorShat"] = "沙塔斯传送门";
  ["PorOrgr"] = "奥格瑞玛传送门";
  ["PorUnde"] = "幽暗城传送门";
  ["PorSilv"] = "银月城传送门";
  ["PorThBl"] = "雷霆崖传送门";
  
--NPC Dalaran
 --White
  ["Krasus Landing"] = "克拉苏斯平台";

  ["Aludane Whitecloud"] = "奥鲁丹·白云 《飞行管理员》";

  ["Hira Snowdawn"] = "希拉·雪晨 《寒冷天气飞行训练师》";

  ["Officer Van Rossem"] = "军官范恩·罗希姆";

  ["Sky-Reaver Klum"] = "掠天者科鲁姆";
  
 --Orng
  ["Runeweaver Square"] = "鲁因广场";

  ["Entrance to the Sewers"] = "下水道入口";

  ["Magical Menagerie"] = "魔法动物店";
  ["Mei Francis"] = "梅尔·弗兰希斯 《特殊坐骑商人》";
  ["Breanni"] = "布琳妮 《宠物商人》";
  ["Tassia Whisperglen"] = "塔西娅·幽谷 《兽栏管理员》";

  ["Teleport to Violet Stand"] = "传送到紫罗兰哨站的水晶";
  ["Archmage Celindra"] = "大法师塞琳德拉 《传送门训练师》";
  ["Warcaster Fanoraithe"] = "战争法师法诺莱斯 《法师训练师》";
  ["Jessa Weaver"] = "叶萨·维尔 《法师训练师》";

  ["The Hunter's Reach"] = "猎人用品店";
  ["Dagna Flintlock"] = "达格娜·火石 《枪械商》";
  ["Jarold Puller"] = "亚罗德·普勒 《特殊弹药商人》";
  ["Aemara"] = "艾玛拉 《弓箭商》";

  ["Aerith Primrose"] = "爱丽丝·普里洛斯 《卖花女》";

  ["The Arsenal Absolute"] = "神兵利器";
  ["Bartram Haller"] = "巴尔塔姆·霍勒 《匕首与拳套》";
  ["Kerta the Bold"] = "大胆的科尔塔 《斧与长柄武器商人》";
  ["Valaden Silverblade"] = "瓦拉丁·银刃 《利剑商人》";
  ["Walther Whiteford"] = "瓦瑟尔·白弗德 《钉锤商人》";

  ["Dalaran Visitor Center"] = "达拉然访客中心";
  ["Andrew Matthews"] = "安德鲁·马休 《公会注册员》";
  ["Elizabeth Ross"] = "伊丽莎白·罗斯 《战袍商人》";
  ["Archivist Betha"] = "档案员蓓塔 《城市历史学家》";

  ["Curiosities & Moore"] = "摩尔珍品店";
  ["Debbi Moore"] = "黛比·摩尔 《饰品和护符》";
  ["Brammold Deepmine"] = "布拉莫德·深井 《古董和传家宝》"; --32509
  ["Orton Bennet"] = "奥尔顿·本内特 《副手物品商人》"; --29527
  ["Ninsianna"] = "尼希亚娜 《圣物》"; --29529

  ["Applebough"] = "苹果树 《水果商人》"; --29547
  ["Windle Sparkshine"] = "温德尔·火花 《路灯商人》"; --29261

  ["Sisters Sorcerous"] = "巫术姐妹";
  ["Hagatha Moorehead"] = "哈加萨·莫尔海德 《材料商人》"; --29636
  ["Endora Moorehead"] = "恩多拉·莫尔海德 《魔法货物》"; --28715

  ["The Threads of Fate"] = "命运丝线";
  ["Paldesse"] = "帕尔蒂丝 《布甲商人》"; --28995
  ["Karandonna"] = "卡兰杜娜 《衣饰商人》"; --29491
  ["Sheddle Glossgleam"] = "西德尔·格罗斯 《鞋匠》"; --29703
  ["Chameli Banaphash"] = "查莉·巴纳法斯 《帽商》"; --29702
  ["Norvin Alderman"] = "诺尔文·奥德曼 《披风》"; --29495

  ["The Wonderworks"] = "奇妙玩具店";
  ["Jepetto Joybuzz"] = "耶比托·乔巴斯 《玩具商人》"; --29478
  ["Clockwork Assistant"] = "发条助手 《耶比托的伙伴》"; --29716

  ["The Legerdemain Lounge"] = "魔术旅馆";
  ["Amisi Azuregaze"] = "艾米丝·埃索盖斯 《旅店老板》"; --28687
  ["Arille Azuregaze"] = "埃里雷 《酒吧招待》"; --29049
  ["Sandra Bartan"] = "珊德拉·巴尔坦 《女招待》"; --32403
  ["Afsaneh Asrar"] = "芙莱尔·贝尔 《旅店助理》"; --32411

  ["Kizi Copperclip"] = "吉兹·考波克利 《理发师》"; --28708

  ["One More Glass"] = "再来一杯";
  ["Fialla Sweetberry"] = "菲娅拉·甜莓 《食物与饮料》"; --29715
  ["Christi Stockton"] = "克莉丝蒂·斯多克顿 《酒商》"; --32337
  ["Lucian Trias"] = "鲁希安·提亚斯 《面包与奶酪商人》"; --29714

  ["Aimee"] = "艾蜜 《馅饼和蛋糕》"; --29548

 --Purp
  ["The Eventide"] = "日暮广场";

  ["Marcia Chase"] = "玛西娅·切斯 《宗师级钓鱼训练师和补给商》"; --28742
--["Marcia Chase &"] = "             ";                      

  ["Glorious Goods"] = "荣耀杂货店";
  ["Jack Findle"] = "“红发”杰克·芬德 《杂货商人》"; --28692
  ["Susana Averoy"] = "苏珊娜·阿维罗 《杂货商》"; --28691

  ["Langrom's Leather & Links"] = "兰格鲁的皮加锁";
  ["Bragund Brightlink"] = "布拉古德·明火 《锁甲商人》"; --29523
  ["Valerie Langrom"] = "瓦蕾莉·兰格鲁 《皮甲商人》"; --28992

  ["The Militant Mystic"] = "好战的秘法师";
  ["Abra Cadabra"] = "安布拉·卡达布拉 《魔杖》"; --28994
  ["Shen Kang Chen"] = "沈志豪 《法杖》"; --29494

 --Yell
  ["The Violet Hold"] = "紫罗兰监狱";

  ["Archmage Timear"] = "大法师提迈尔"; --31439
  ["Archmage Lan'dalock"] = "大法师兰达洛克"; --20735
  ["Torgo the Younger"] = "年轻的托格"; --29325
  ["The Violet Hold Instance"] = "副本-紫罗兰监狱";

 --Blue
  ["The Silver Enclave a"] = "银色领地 (联盟)";

  ["A Hero's Welcome"] = "英雄之家";
  ["Isirami Fairwind"] = "伊丝拉米·轻风 《旅店老板》";
  ["Stefen Cotter"] = "斯蒂芬·考特尔 《酒吧招待》";
  ["Katherine Lee"] = "凯瑟琳·李 《宗师级烹饪训练师》";
  ["Derek Odds"] = "德里克·奥斯 《烹饪供应商》";
  ["Inzi Charmlight"] = "伊吉·魔光 《女招待》";
  ["Marcella Bloom"] = "玛尔塞拉·布鲁姆 《女招待》";
  ["Caliel Brightwillow"] = "卡里尔·明柳 《旅店助理》";

  ["The Beer Garden"] = "啤酒花园";
  ["Laire Brewgold"] = "莱尔蕾·金酒 《酒吧女郎》";
  ["Coira Longrifle"] = "科尔拉·长枪 《酒吧女郎》";

  ["The Silver Enclave"] = "银色领地";

  ["Arcanist Braedin"] = "奥术师布莱丁 《冬拥湖战斗法师》";
  ["Portal to Battlefields"] = "各战场传送门";

  ["Upstair"] = "楼梯";
  ["Arcanist Ivrenne"] = "奥术师艾弗蕾妮 《英雄纹章军需官》";
--["Arcanist Ivrenne &"] = "             Quartermaster";
  ["Arcanist Adurin"] = "奥术师埃杜林 《勇气纹章军需官》"; --31305
  ["Arcanist Firael"] = "Arcanist Firael, Emblem of Conquest"; --33964           --？？
--["Arcanist Firael &"] = "             Quartermaster";

 --Gren
  ["The Violet Citadel"] = "紫罗兰城堡";

  ["Rhonin"] = "罗宁 《肯瑞托的领袖》";
  ["Vereesa Windrunner"] = "温蕾萨·风行者 《银色盟约的游侠将军》";
--["Vereesa Windrunner &"] = "             Silver Covenant";

  ["Archmage Alvareaux"] = "大法师奥瓦利斯 《银色盟约的游侠将军》";

  ["Zidormi"] = "希多尔米 《时光守护者》";
  ["Portal Cavern Time"] = "时光之穴的传送门";

  ["Portal Purple Parlor"] = "通往紫色天台的传送门";

  ["The Purple Parlor"] = "紫色天台";
  ["Archmage John Nicholas"] = "大法师约翰·尼古拉斯 《惩罚者》";
  ["Alfred Copperworth"] = "阿尔弗雷德·考伯沃斯 《管事》";

 --Grey
  ["The Magus Commerce"] = "魔法商业区";

  ["Simply Enchanting"] = "简单附魔";
  ["Enchanter Nalthanis"] = "附魔师纳萨尼斯 《宗师级附魔训练师》"; --28693
--["Enchanter Nalthanis &"] = "             Trainer";
  ["Ildine Sorrowspear"] = "伊尔蒂 《附魔供应商》"; --28714
  ["Vanessa Sellers"] = "瓦妮萨·塞勒斯 《碎片商人》";

  ["First to Your Aid"] = "急你所急";
  ["Olisarra the Kind"] = "善良的欧莉萨拉 《宗师级急救训练师》"; --28706
  ["Angelique Butler"] = "安吉莉克·巴特雷 《急救供应商》"; --29628

  ["Talismanic Textiles"] = "避邪纺织店";
  ["Charles Worth"] =  "查理·沃尔斯 《宗师级裁缝训练师》"; --28699
  ["Dominique Stefano"] = "多米妮克·斯特法诺 《裁缝供应商》"; --28726
  ["Ainderu Summerleaf"] = "埃德尔鲁·夏叶 《月布裁缝专家》"; --29512
--["Ainderu Summerleaf &"] = "             Specialist";
  ["Lalla Brightweave"] = "兰尔拉·亮纹 《魔焰裁缝专家》"; --29511
  ["Linna Bruder"] = "琳娜·布鲁德 《暗纹裁缝专家》"; --29510

  ["Legendary Leathers"] = "传说皮甲";
  ["Braeg Stoutbeard"] = "布莱格·酒须 《皮货商人》";
  ["Diane Cannings"] = "蒂亚妮·坎宁斯 《宗师级制皮训练师》"; --28700
--["Diane Cannings &"] = "             Trainer";
  ["Derik Marks"] = "迪尔克·马克斯 《宗师级剥皮训练师》";
  ["Ranid Glowergold"] = "兰尼德·怒金 《制皮和剥皮供应商》";
--["Ranid Glowergold &"] = "             Skinning Supplies";
  ["Manfred Staller"] = "曼弗莱德·斯塔勒 《元素制皮训练师》"; --29507
--["Manfred Staller &"] = "             Trainer";
  ["Andellion"] = "安德里奥 《龙鳞制皮训练师》"; --29508
  ["Namha Moonwater"] = "娜穆·月水 《部族制皮训练师》"; --29509
--["Namha Moonwater &"] = "             Trainer";

  ["Like Clockwork"] = "精密仪器";
  ["Justin Oshenko"] = "加斯汀·欧希克 《宗师级工程学训练师》"; --28697
--["Justin Oshenko &"] = "             Trainer";
  ["Bryan Landers"] = "比尔亚·兰德斯 《工程学供应商》"; --28722
  ["Didi the Wrench"] = "钳工蒂迪 《地精工程学训练师》"; --29513
  ["Findle Whistlesteam"] = "芬德尔·汽哨 《侏儒工程学训练师》"; --29514

  ["All That Glitters Prospecting Co"] = "亮晶晶矿业公司";
  ["Jedidiah Handers"] = "杰迪安·汉德尔斯 《宗师级采矿训练师》";
  ["Dorian Fines"] = "多利安·芬斯 《采矿供应商》"; --28728

  ["The Forge of Fate"] = "命运熔炉";

  ["Tanks For Everything"] = "坦克用品店";
  ["Alard Schmied"] = "奥拉尔德·施米尔 《宗师级锻造训练师》";
--["Alard Schmied &"] = "             Trainer";
  ["Palja Amboss"] = "帕尔娅·安玻斯 《锻造供应商》";
  ["Imindril Spearsong"] = "伊曼蒂尔·锋歌 《武器锻造训练师》";
  ["Orland Schaeffer"] = "奥兰德·夏菲尔 《护甲锻造训练师》";
  ["Dubin Clay"] = "Dubin Clay 《板甲商人》";                     --34252           --??
  ["Griselda Hunderland"] = "格里丝华尔德·哈兰德 《板甲商人》";
  ["Anthony Durain"] = "安东尼·杜伦 《盾牌商人》";

  ["Dorothy Egan"] = "多萝希·埃根 《宗师级草药学训练师》";
  ["Edward Egan"] = "爱德华·埃根 《草药学供应商》"; --28727

  ["The Scribes Sacellum"] = "铭文师的殿堂";
  ["Proffessor Pallin"] = "帕林教授 《宗师级铭文训练师》"; --28702
--["Proffessor Pallin &"] = "             Trainer";
  ["Larana Drome"] = "拉兰娜·德罗姆 《铭文供应商》"; --28723
  ["Jessica Sellers"] = "Jessica Sellers, Ink Trader";           --33027            --??
  ["Theresa Wolf"] = "瑟蕾萨·沃尔弗 《博学者》"; --29641

 --Red
  ["Sunreaver's Sanctuary"] = "夺日者圣殿 (部落)";

  ["部落 Warbringer"] = "部落战争使者";
  ["High Arcanist Savor"] = "高阶奥术师达斯克·阿尔希斯 《夺日者》";

  ["Magister Surdiel"] = "魔导师索迪耶尔 《冬拥湖战斗法师》";
  ["Eye of the Storm Portal"] = "风暴之眼传送门";
  ["Arathi Basin Portal"] = "阿拉希盆地传送门";

  ["Strand of the Ancients Portal"] = "缘故海滩传送门";
  ["Alterac Valley Portal"] = "奥特兰克山谷传送门";
  ["Warsong Gulch Portal"] = "战歌峡谷传送门";

  ["Magister Sarien"] = "Magister Sarien, Emblem of Conquest";  --33963
--["Magister Sarien &"] = "             Quartermaster";
  ["Magister Brasael"] = "魔导师布拉塞尔 《勇气纹章军需官》";
  ["Magistrix Lambriesse"] = "魔导师拉姆布莉丝 《英雄纹章军需官》";
--["Magistrix Lambriesse &"] = "             Quartermaster";

  ["The Filthy Animal"] = "肮脏的野兽";
  ["Uda the Beast"] = "兽女乌达 《旅店老板》";
  ["Kyunghee"] = "凯乌赫 《飞斧》";
  ["Mato"] = "玛图 《食物与饮料》"; --32412
  ["Hamaka"] = "哈玛卡 《酒吧招待》";
  ["Umbiwa"] = "乌姆比瓦 《女招待》";
  ["Mimbihi"] = "米比希 《女招待》";
  ["Awilo Lon'gomba"] = "埃维罗·隆古巴 《宗师级烹饪训练师》"; --29631
--["Awilo Lon'gomba &"] = "             Trainer";
  ["Misensi"] = "米森希 《烹饪供应商》";
  ["Abohba"] = "阿波赫巴 《旅店助理》";


--NPC Dalaran Sewers
 --White
  ["D Sew"] = "达拉然下水道";

  ["Entrance"] = "下水道入口";

  ["The Black Market"] = "黑市";
  ["Hexil Garrot"] = "赫塞尔·加洛特 《业务工具》"; --29538
  ["Pazik The Pick"] = "“万能钥匙”帕兹克·派洛特 《锁匠》"; --29665
  ["Scout Nisstina"] = "斥候尼丝蒂娜 《三指大盗》"; --29778
  ["Alchemist Cinesra"] = "炼金师辛奈斯拉 《毒药商》";
  ["Darahir"] = "达拉希尔 《施法材料与魔法物品》";

  ["Circle of Wills"] = "意志竞技场";
  ["Blazik Fireclaw"] = "布拉兹克·火爪 《饮料商人》"; --30885
  ["Nargle Lashcord"] = "纳格尔·拉斯克德 《精锐竞技场商人》";
  ["Xazi Smolderpipe"] = "夏尔兹·斯莫德普 《竞技场商人》";
  ["Zom Bocom"] = "佐姆·波克 《见习竞技场商人》";
  ["Shifty Vickers"] = "狡猾的维克斯";

  ["Baroness Llana"] = "“伯爵夫人”莱娜 《竞技场组织者》";
  ["Schembari Shearbolt"] = "斯卡巴里·谢波德 《竞技场管理员》"; --29533
--["Schembari Shearbolt &"] = "             Battlemaster";

  ["Rickard Rustbolt"] = "“技术派”理查德·拉斯波特 《竞技场管理员》"; --29568

  ["Sarah Brady"] = "Sarah Brady, Alcohol"; --33026
  ["Minzi Minx"] = "顽皮的米恩兹 《竞技场管理员》";

  ["Nixi Fireclaw"] = "妮希·火爪 《饮料商人》";

  ["Kanika Goldwell"] = "坎妮卡·古德维尔 《竞技场组织者》";
  ["Ramik Slamwrench"] = "拉米克·斯拉文奇 《竞技场管理员》";

  ["Danik Blackshaft"] = "“小专家”丹尼克·布莱沙弗 《竞技场管理员》";

  ["Cantrips & Crows"] = "咒语和乌鸦旅店";
  ["Ajay Green"] = "埃因·格林 《旅店老板》";
  ["Narisa Redgold"] = "纳莉萨·赤金 《女招待》";

  ["Binzik Goldbook"] = "宾兹克·戈布克 《银行职员》";

  ["Angelo Pescatore"] = "安格罗·皮斯卡托 《钓鱼供应商》"; --28707

  ["Rin Duoctane"] = "林·多克塔";

  ["Sewer Pipe"] = "进出你需要有飞行坐骑";
--["Add On"] = "to use";

  ["Washed-up Mage"] = "疲倦的法师";


--NPC 达纳苏斯 
 --White  
  ["Warrior's Terrace"] = "战士区";
   
  ["Mydrannul"] = "迈德兰努尔 《杂货商》"; --4241
  ["Shylenai"] = "夏琳奈尔 《猫头鹰训练师》";
  ["Fyrenna"] = "菲琳娜 《食物与饮料》";
  ["Ancient of War"] = "战争古树";
   
  ["Sildanair"] = "希达奈尔 《战士训练师》";
  ["Thyn'tel"] = "塞恩提尔·刃纹";
   
  ["Elanaria"] = "艾兰娜瑞";
  ["Arias'ta"] = "阿雷亚斯塔·刃歌 《战士训练师》";
  ["Darnath"] = "达纳斯·刃歌 《战士训练师》";
  ["Brogun"] = "布洛冈·石盾 《奥特兰克山谷军官》";
  ["Enlae"] = "艾莱 《风暴之眼军官》";
  ["Aethalas"] = "伊萨拉斯 《战歌峡谷军官》";
  ["Fima"] = "五指菲玛 《竞技场管理员》";
  ["Keras"] = "克拉斯·沃夫哈特 《阿拉希盆地军官》";
  ["Nivara"] = "妮瓦拉·刃舞 《远古海滩军官》";
--["Nivara &"] = "             Battlemaster";
 
  ["Ariyell"] = "阿瑞耶尔·天影 《武器商》";
  ["Mathiel"] = "玛希尔";
  ["Cylania"] = "塞兰妮亚《暗夜精灵护甲商》";
  ["Ilyenia"] = "伊琳尼雅·月火 《武器大师》";
  
 --Purp
  ["Tradesmen's Terrace"] = "贸易区";
   
  ["General Goods & Bags"] = "杂货和背包";
  ["Ellandrieth"] = "艾兰蒂斯 《杂货商》";
  ["Yldan"] = "伊尔丹 《背包商人》";
   
  ["Weapons"] = "武器";
  ["Glorandiir"] = "格罗拉迪尔 《斧商》";
  ["Merelyssa"] = "米利希亚 《铸剑商》";
  ["Mythidan"] = "迈希迪安,  《锤和法杖商人》";
  ["Kieran"] = "基尔兰 《武器商》";
   
  ["Fletcher & Thrown Weapons"] = "弓箭与投掷武器";          --？？
  ["Landria"] = "兰德瑞亚 《弓箭商人》";
  ["Turian"] = "图里安 《投掷武器商人》";
   
  ["CAHW"] = "布甲和双手武器";
  ["Vinasia"] = "温娜希雅 《布甲商》";
  ["Ealyshia D"] = "伊林希亚·露珠 《双手武器商人》";
--["Ealyshia D &"] = "             Merchant";
 
  ["Leather Armor"] = "皮甲";
  ["Cyridan"] = "塞瑞丹 《皮甲商》";
   
  ["Mail Armor & Shields"] = "锁甲和盾牌";
  ["Melea"] = "梅尔利恩 《锁甲商》";
  ["Caynrus"] = "坎因鲁斯 《盾牌商人》";
   
  ["Jareth"] = "加雷斯·深林";
   
  ["Treshala"] = "塔莎拉·静水";
   
  ["Sentinel's Bunkhouse"] = "哨兵营地";
   
  ["Staff & Robe"] = "法杖和长袍";
  ["Andrus"] = "安德鲁斯 《法杖商》";
  ["Anadyia"] = "安达迪雅 《长袍商》";

  ["Jaeana"] = "加伊娜,  《肉商》";
--["Jaeana&"] = "          the Weapons and Fletcher buildings)";

 --Yell
  ["Craftsmen's Terrace"] = "工匠区";

  ["Guild"] = "公会";
  ["Lysheana"] = "琳沙娜 《公会注册员》";
  ["Shalumon"] = "沙鲁蒙 《战袍商人》";
  ["Ellaercia"] = "艾拉希亚 《公会徽章设计师》";

  ["Saelienne"] = "旅店老板塞琳尼";

  ["Tailoring &"] = "裁缝和制皮";
  ["Me'lynn"] = "迈里恩 《裁缝训练师》";
  ["Elynna"] = "艾琳娜 《裁缝供应商》";
  ["Raedon D"] = "莱顿·暗影,  《联盟布匹军需官》";
--["Raedon D &"] = "             Quartermaster";
  ["Telonis"] = "泰龙尼斯 《制皮训练师》";
  ["Saenorion"] = "塞诺里奥 《制皮供应商》"; --4212
  ["艾拉迪尔"] = "艾拉迪尔 《剥皮训练师》"; --6292
  ["Lotherias"] = "洛瑟里亚斯";

  ["General"] = "《杂货店》";
  ["Mythrin'dir"] = "迈斯林迪尔 《杂货商人》";

  ["Enchanting"] = "附魔和铭文";
  ["Taladan"] = "塔兰丹 《附魔训练师》";
  ["Vaean"] = "维安 《附魔供应商》";
  ["Feyden D"] = "芬迪·达金 《铭文训练师》";
  ["Illianna M"] = "伊莉安娜·月纹 《铭文供应商》";

  ["Alchemy"] = "炼金术和银色黎明";
  ["Ainethil"] = "安尼希尔 《炼金术训练师》";
  ["Ulthir"] = "尤希尔 《炼金术供应商》";
  ["Argent Guard Manados"] = "银月守卫玛纳杜斯 《银色黎明》";
  ["D Selgorm"] = "哨兵塞尔高姆 《银色黎明》";
  ["D Shaedlass"] = "哨兵山德拉斯 《银色黎明》";

  ["Cooking"] = "烹饪";
  ["Alegorn"] = "阿雷贡 《烹饪训练师》";
  ["Fyldan"] = "菲尔丹 《烹饪供应商》";

  ["First Aid"] = "急救";
  ["Dannelor"] = "丹纳罗尔 《急救训练师》";

 --Blue
  ["Cenarion Enclave"] = "塞纳里奥区";

  ["Tunnel R Trainer"] = "通向潜行者训练师的地道";

  ["Food & Drink"] = "食物与饮料";
  ["Dendrythis"] = "德蒂希斯 《食物与饮料》";

  ["Rellian G"] = "雷利亚·绿树";

  ["Mounts"] = "坐骑";
  ["Jartsam"] = "贾萨姆 《骑术训练师》";
  ["Lelanai"] = "莱兰奈 《驯豹人》";

  ["Hunter"] = "猎人训练师";
  ["Alassin"] = "阿拉辛 《兽栏管理员》";
  ["Jocaste"] = "祖卡斯特 《猎人训练师》";
  ["Corand"] = "科兰德";
  ["Jeen'ra N"] = "吉恩拉 《猎人训练师》";
  ["Dorion"] = "多利安 《猎人训练师》";
  ["Silvaria"] = "西尔瓦莉雅 《宠物训练师》";

  ["Druid"] = "德鲁伊训练师";
  ["Denatharion"] = "德纳萨里安 《德鲁伊训练师》";
  ["Fylerian N"] = "菲勒里亚·夜翼 《德鲁伊训练师》";
  ["Cyroen"] = "塞罗恩 《材料商》";
  ["Mathrengyl B"] = "玛斯雷·驭熊者 《德鲁伊训练师》";
  ["Fandral S"] = "大德鲁伊范达尔·鹿盔";

  ["Poisons"] = "毒药商";
  ["Kyrai"] = "凯尔莱 《毒药商》";
  ["Faelyssa"] = "菲琳萨";

  ["Rogue"] = "潜行者训练师";
  ["Syurna"] = "塞尤娜 《潜行者训练师》";
  ["Anishar"] = "安妮莎尔 《潜行者训练师》";
  ["Erion S"] = "艾瑞安·影语 《潜行者训练师》";

 --Gren
  ["The Temple Gardens"] = "神殿花园";

  ["Portal to Rut'theran"] = "到鲁瑟兰村的传送门";

  ["O Lunalight"] = "军官鲁娜莱 《达纳苏斯嘉奖处》";

  ["Sister Aquinne"] = "艾奎恩妮 《低阶女祭司》";

  ["Fishing"] = "钓鱼";
  ["Astaia"] = "阿斯坦娅 《钓鱼训练师》";
  ["Voloren"] = "沃洛伦 《钓鱼供应商》";
  ["Talaelar"] = "塔莱拉尔 《鱼商》";

  ["Herbalism"] = "草药学训练师";
  ["Firodren M"] = "菲罗迪恩·唤月 《草药学训练师》";
  ["Chardryn"] = "查德瑞恩 《草药学供应商》";

  ["Greywhisker"] = "首席考古学家杜瑟·灰须 《探险者协会》";
  ["Greywhisker &"] = "";

  ["Alaindia"] = "奥兰蒂亚 《材料商》 (在4个点之间来回";
  ["Alaindia&"] = "          走动，并在每个点停留5分钟)";
  ["Alaindia&1"] = "";

 --Cyan
  ["Temple Moon"] = "月神殿";

  ["Main Floor"] = "主楼层";
  ["Jandria"] = "贾德莉亚 《牧师训练师》";
  ["Lariia"] = "拉瑞亚 《牧师训练师》";
  ["Elissa D"] = "埃莉萨 《传送门训练师》";
  ["Dalia S"] = "哨兵达莉亚·炎刃";

  ["Balconey"] = "露台";
  ["P A'moora"] = "女祭司艾茉拉";

  ["Gracina S"] = "格拉希娜·灵风";

  ["AstariiS"] = "阿斯塔利·逐星 《牧师训练师》";
  ["PAlathea"] = "女祭司阿兰希雅 《牧师训练师》";
  ["TyrandeW"] = "泰兰德·语风 《艾露恩的高阶女祭司》";
  ["Valustraa"] = "瓦鲁丝塔大使";


--NPC 埃索达
 --White
  ["Outside"] = "正门外面";
  ["Entrance Ex"] = "城市出入口";

  ["Stephanos"] = "斯泰法努斯 《角鹰兽管理员》";

  ["Torallius"] = "象群管理者妥拉留斯 《雷象饲养者》"; --17584
  ["Aalun"] = "埃亚伦 《骑术训练师》";

 --Gren
  ["Seat of the Naaru"] = "纳鲁之座";

  ["Caregiver B"] = "布雷尔 《旅店老板》";
  ["Arthaid"] = "阿尔泰德 《兽栏管理员》";
  ["Miglik B"] = "米格里克·布罗斯托 《竞技场管理员》";

  ["O Khaluun"] = "军官坎鲁恩 《埃索达嘉奖官》";

  ["Mumman"] = "穆曼 《厨师》";
  ["Phea"] = "菲恩 《烹饪供应商》";
  ["CookP"] = "烹锅";

  ["Onnis"] = "昂尼斯 《杂货商》";
  ["Cuzi"] = "古兹 《背包商人》";

  ["Bran'daan"] = "通报者布兰丹恩";

  ["Nurguni"] = "努古尼 《商人》";

  ["O'ros"] = "沃洛斯 (斜坡下边)";

 --Red
  ["Traders Tier"] = "贸易阶梯";

  ["Tailoring"] = "裁缝";
  ["Refik"] = "雷菲克 《裁缝训练师》";
  ["Neii"] = "奈伊 《裁缝供应商》";
  ["Dugiru"] = "度戈鲁 《联盟布匹军需官》";

  ["Leatherworking and Skinning"] = "制皮和剥皮";
  ["Remere"] = "雷米勒 《剥皮训练师》";
  ["Akham"] = "阿克汉姆 《制皮训练师》";
  ["Haferet"] = "哈弗雷特 《制皮供应商》";

  ["Plate Armor & Shields"] = "板甲和盾牌";
  ["Gotaan"] = "古坦妮 《板甲商人》";
  ["Treall"] = "特雷奥 《盾牌商人》";

  ["Bladed Weapons"] = "利刃武器";
  ["Ven"] = "温恩 《刀剑商人》";

  ["Blunt Weapons"] = "钝器";
  ["Ellomin"] = "埃尔洛米 《钝器商人》";

  ["Leather & Cloth Armor"] = "皮甲和布甲 (上层)";
  ["Mahri"] = "玛赫里 《皮甲商》";
  ["Gornii"] = "戈恩尼 《布甲商》";

  ["Mail Armor"] = "锁甲 (上层)";
  ["Yil"] = "伊尔 《锁甲商》";

  ["Mining and Smithing"] = "采矿和锻造";
  ["Muaat"] = "穆亚特 《采矿训练师》";
  ["Merran"] = "米尔兰 《采矿供应商》";
  ["Miall"] = "米阿尔 《锻造训练师》";
  ["Arras"] = "阿尔拉斯 《锻造供应商》";

  ["Engineering"] = "工程学";
  ["Ockil"] = "奥克基尔 《工程学训练师》";
  ["Feera"] = " 菲拉《工程学供应商》";

  ["Hunters' Sanctum"] = "猎手圣殿";
  ["Deremiis"] = "德雷米斯 《猎人训练师》";
  ["Vord"] = "沃尔德 《猎人训练师》";
  ["Killac"] = "基尔拉克 《猎人训练师》";
  ["Ganaar"] = "甘纳尔 《宠物训练师》";
  ["Avelii"] = "艾维尔琳 《弓箭商》";
  ["Muhaa"] = "姆哈 《枪械商》";

  ["Ring of Arms"] = "武器之环";
  ["Fingin"] = "芬吉 《毒药商》";
  ["Ahonan"] = "安霍纳 《战士训练师》";
  ["Kazi"] = "卡兹 《战士训练师》";
  ["Behomat"] = "贝霍玛特 《战士训练师》";
  ["Handiir"] = "韩迪尔 《武器大师》";

  ["Guild Master and Tabards"] = "公会注册和徽章设计";
  ["Funaam"] = "弗纳姆 《公会注册员》";
  ["Issca"] = "伊斯卡 《战袍商人》";

 --Purp
  ["The Vault of Lights"] = "圣光穹顶";

  ["Hall of the Mystics"] = "秘法大厅";
  ["Bati"] = "巴蒂 《法师训练师》";
  ["Harnan"] = "哈尔南 《法师训练师》";
  ["Edirah"] = "伊迪拉恩 《法师训练师》";
  ["Lunaraa"] = "鲁纳尔兰 《传送门训练师》";
  ["Oss"] = "欧斯 《魔杖商人》";
  ["Musal"] = "穆萨尔 《炼金术和材料供应商》";

  ["Vindicators' Sanctum"] = "守备官圣殿";
  ["Kavaan"] = "卡维恩 《圣骑士训练师》";
  ["Jol"] = "约尔 《圣骑士训练师》";
  ["Baatun"] = "巴图恩 《圣骑士训练师》";

  ["Alchemy and Herbalism"] = "炼金和采药";
  ["Lucc"] = "鲁克 《炼金术训练师》";
  ["Altaa"] = "奥泰恩 《炼金术供应商》";
  ["Cemmorhan"] = "塞摩尔汉 《草药学训练师》";

  ["Tolo"] = "图尔洛 《阿拉希盆地军官》";

  ["Mahul"] = "玛霍尔 《奥特兰克山谷军官》";
  ["Mitia"] = "米提亚 《风暴之眼军官》";

  ["Jihi"] = "伊希 《战歌峡谷军官》";
  ["Buhurda"] = "布霍达 《远古海滩军官》";

  ["Prophet Velen"] = "先知维伦";

  ["Anchorites' Sanctum"] = "学者圣殿";
  ["Izmir"] = "伊兹米尔 《牧师训练师》";
  ["Fallat"] = "法尔拉特 《牧师训练师》";
  ["Caedmos"] = "凯德莫斯 《牧师训练师》";

  --White
  ["The Crystal Hall"] = "水晶大厅";

  --["Enchanting"] = "Enchanting"; -- Duplicated
  ["Nahogg"] = "纳霍加 《附魔训练师》";
  ["Egomis"] = "艾苟米斯 《附魔材料商》";
  ["Thoth"] = "索斯 《铭文训练师》";
  ["Sessoh"] = "萨索 《铭文供应商》";

  ["Sixx"] = "希克斯 《蛾子商人》(一层)";

  ["Gurrag"] = "古尔拉格 《萨满祭司训练师》";

  ["F Nobundo"] = "预言者努波顿 《萨满祭司训练师》 (坡道之上)";
  ["F Dunaer"] = "工头度纳尔";
  ["Valon"] = "瓦隆";

  ["Sulaa"] = "苏兰 《萨满祭司训练师》";

  --["Fishing"] = "Fishing";
  ["Erett"] = "伊雷特 《钓鱼训练师》";
  ["Dekin"] = "德金 《钓鱼供应商》";

  ["Hobahken"] = "霍巴肯 《萨满祭司训练师》";

  ["Reagents"] = "材料";
  ["Bildine"] = "比尔迪恩 《材料商》";

  --["First Aid"] = "First Aid";
  ["Nus"] = "努丝 《急救训练师》";

  ["Jewelcrafting"] = "珠宝加工";
  ["Farii"] = "法里 《珠宝加工训练师》";
  ["Arred"] = "阿尔雷德 《珠宝加工供应商》";
  ["Padaar"] = "帕达尔 《初级珠宝匠》";

  ["Seer Skaltesh"] = "先知斯卡泰斯";

  --NPC Ironforge
  --White
  ["The Common"] = "大厅";

  ["Barim"] = "巴瑞姆材料店";
  ["Barim J"] = "巴瑞姆·贾根斯塔德 《材料商》";

  ["Stonefire Tavern"] = "石火旅店";
  ["Innkeeper Firebrew"] = "旅店老板洛雷·火酒";
  ["Gwenna F"] = "吉温娜·火酒 《招待员》";
  ["Larkin T"] = "拉尔金·雷酒 《本月美酒俱乐部》";
  ["Brew Vendor"] = "美酒商人 《本月美酒俱乐部》";
  ["Sheldonore"] = "炮兵舍尔杜";

  ["Pella B"] = "贝拉·布拉鲁斯 《理发师》";

  ["Ironforge Armory"] = "铁炉堡军械库";
  ["Mangorn F"] = "曼高恩·火锤 《重甲商》";
  ["Raena F"] = "莱纳·火锤 《轻甲商》";
  ["Bromiir O"] = "波洛米尔·奥姆森 《重甲商》";

  ["Dinita S"] = "丁尼塔·石衣 《宝库管理员》";
  ["Lieutenant Rot"] = "洛泰姆中尉 《雷矛卫兵招募处》";
  ["Lieutenant Rot &"] = "           (银行门口)";

  ["Steelfury's Weapon Emporium"] = "钢怒武器店";
  ["Dolman S"] = "杜尔曼·钢怒 《武器商》";
  ["Grenil S"] = "格雷尼尔·钢怒 《武器商》";

  ["Fizzlespinner"] = "菲留斯杂货店";
  ["Fillius F"] = "菲留斯·旋翼 《商人》";
  ["Bryllia I"] = "布莱利亚·铁印 《杂货商》";

  ["Marblesten"] = "大石匠玛布勒斯坦 《皇家石匠协会》";
--["Marblesten&"] = "          Union";

  ["Ironforge V C"] = "铁炉堡访客中心";
  ["Jondor S"] = "乔多·钢眉 《公会注册员》";
  ["Lyesa S"] = "利莎·钢眉 《战袍商人》";

  ["Myra T"] = "米拉·泰恩加德 《面包商》 (在";
  ["Myra T &"] = "          银行和拍卖行前叫卖)";

  --Gren
  ["Mystic Ward"] = "秘法区";

  ["Fighting Wizard"] = "作战法师";
  ["Bingus"] = "宾古斯 《武器商》";
  ["Harick B"] = "哈瑞克·石鼓 《魔杖商人》";

  ["Hall of Mysteries"] = "秘法大厅";
  ["Toldren D"] = "托德雷·铁矿 《牧师训练师》";
  ["Braenna F"] = "布莱纳·火崖 《牧师训练师》";
  ["High Priest Rohan"] = "高阶牧师洛汉 《牧师训练师》";
  ["Theodrus F"] = "塞欧杜斯·霜须 《牧师训练师》";
  ["Bink"] = "彬克 《法师训练师》";
  ["Dink"] = "丁克 《法师训练师》";
  ["Juli S"] = "朱莉·雷线 《法师训练师》";
  ["Milstaff S"] = "贝尔斯塔弗·风暴之眼 《传送门训练师》";
  ["Brandur I"] = "布兰度尔·铁锤 《圣骑士训练师》";
  ["Beldruk D"] = "贝尔杜克·凝眉 《圣骑士训练师》";
  ["Muiredon B"] = "穆里顿·热炉";
  ["Valgar H"] = "瓦尔加·高炉 《圣骑士训练师》";
  ["Nittlebur S"] = "尼特布尔·火花 《法师训练师》";
  ["Tiza B"] = "蒂萨·热炉";

  ["Mage Tymor"] = "法师泰摩尔";

  ["Talvash Kissel"] = "塔瓦斯德·基瑟尔";

  ["Maeva's"] = "麦瓦的魔法衣饰店";
  ["Maeva"] = "麦瓦·雪衣 《长袍商》";
  ["Ingrys S"] = "因格瑞斯·石眉 《布甲商》";

  ["Longberry's"] = "比布尔材料店";
  ["Ginny L"] = "吉恩 《材料商》";

  ["Bimble L"] = "比布尔 《水果商》 (围绕";
  ["Bimble L&"] = "          秘法区的水池叫卖)";

  --Blue
  ["Forlorn Cavern"] = "荒弃的洞穴";

  ["Stoneblades"] = "石刃小店";
  ["Hjoldir S"] = "霍迪尔·石刃 《铸剑商》";
  ["Binny"] = "宾尼·冰刃";
  ["Prynne"] = "普莱恩";

  ["Traveling Fisherman"] = "旅行渔具店";
  ["Grimnur S"] = "格瑞诺尔·石印 《钓鱼训练师》";
  ["Tansy P"] = "坦斯·泥泡 《钓鱼供应商》";

  ["Lago B"] = "拉戈·黑钳";

  ["Thistleheart"] = "瑟斯哈特 《术士训练师》";
  ["Briarthorn"] = "布瑞尔索恩 《术士训练师》";
  ["Alexander C"] = "亚历山大·考德尔 《术士训练师》";
  ["Gerrig B"] = "葛利·硬骨";

  ["Tynnus V"] = "泰努斯·毒芽 《毒药商》";
  ["Fenthwick"] = "芬斯维克 《潜行者训练师》";
  ["Ormyr F"] = "奥米尔·火眼 《潜行者训练师》";
  ["Hulfdan B"] = "霍夫丹·黑须 《潜行者训练师》";
  ["Durtham G"] = "杜尔萨姆·格雷顿";

  ["Ransin D"] = "兰森·东尼";
  ["Murky"] = "奔波尔霸";

  --Purp
  ["Hall of Explorers"] = "探险者大厅";

  ["Roetten S"] = "罗顿·石锤 《寻物公司》";
  ["Magellas"] = "资深探险家麦格拉斯 《探险者协会》";

  ["The Library"] = "图书馆";
  ["Thorius"] = "索里奥斯馆长";

  ["Lyon M"] = "莱恩·山心";

  ["Laris G"] = "拉里斯·空轮";

  ["Krom S"] = "克罗姆·粗臂";
  ["Prospector S"] = "勘察员塔伯斯·雷矛";
  ["Mae P"] = "图书馆员麦伊·苍尘 《探险者协会》";
  ["Advisor B"] = "顾问贝尔格拉姆";
  ["Historian K"] = "史学家卡尼克";

  --Cyan
  ["Tinker Town"] = "侏儒区";

  ["Bubulo"] = "巴巴罗·阿克巴斯 《联盟布匹军需官》";

  ["Boom!"] = "易爆品！";
  ["Lomac"] = "洛玛克·链带";
  ["Fizzlebang"] = "菲斯巴恩 《焰火商人》";

  ["Berryfizz's"] = "苏雷的药水饮料店";
  ["Tally B"] = "塔雷·浆泡 《炼金术训练师》";
  ["Soolie B"] = "苏雷·浆泡 《炼金术供应商》";

  ["Overspark"] = "工匠大师欧沃斯巴克";
  ["Overspark&"] = "        《侏儒工程学训练师》";
  ["Gnoarn"] = "诺恩";

  ["Mekkatorque"] = "大工匠梅卡托克 《侏儒之王》";

  ["Castpipe"] = "大机械师卡斯派普";
  ["Klockmort"] = "科罗莫特·钢尺";
  ["Porterhouse"] = "军官波特霍斯 《诺莫";
  ["Porterhouse&"] = "          瑞根嘉奖处》";

  ["Springspindle's"] = "宾斯匹德器具店";
  ["Fizzlegear"] = "宾斯匹德 《工程学训练师》";
  ["Cogspinner"] = "考格斯宾 《工程学供应商》";

  ["Deeprun Tram"] = "矿道地铁";
  ["Monty"] = "蒙提 《灭鼠特派员》";
  ["Haggle"] = "哈格尔";

  --Orng
  ["The Military Ward"] = "军事区";

  ["Goldfury's"] = "金怒狩猎用品店";
  ["BrettaG"] = "布雷塔·金怒 《枪械商》";
  ["SkolminG"] = "斯克米·金怒 《弓箭商人》";

  ["Bruuk's Corner"] = "布鲁克小店";
  ["BruukB"] = "布鲁克·麦须 《调酒师》";
  ["TisaM"] = "蒂萨·马丁";
  ["EdrisB"] = "埃德瑞斯·麦须 《招待员》";

  ["SognarC"] = "索戈纳尔·硬须 《肉商》(在";
  ["SognarC&"] = "          军事区转圈游走)";

  ["Hall of Arms"] = "武器大厅";
  ["RegnusT"] = "雷格努斯·雷石 《猎人训练师》";
  ["OlminB"] = "奥尔明·燃须 《猎人训练师》";
  ["UlbrekF"] = "乌布雷克·火拳 《兽栏管理员》";
  ["BeliaT"] = "贝莉亚·雷岩 《宠物训练师》";
  ["DemnulF"] = "德姆恩·远山";
  ["DaeraB"] = "戴拉·锐矛 《猎人训练师》";
  ["KelvS"] = "凯夫·重锤 《战士训练师》";
  ["MaxX"] = "麦克斯·克希姆 《竞技场管理员》";
  ["DonalO"] = "杜纳尔·奥斯古德 《阿拉希盆地军官》";
  ["Lylandris"] = "莱兰迪斯 《战歌峡谷军官》";
  ["MargaB"] = "玛尔加·比布雷 《远古海滩军官》";
  ["MargaB&"] = "";
  ["GlordrumS"] = "格罗杜姆·钢须 《奥特兰克山谷军官》";
  ["Kandaar"] = "坎达尔 《风暴之眼军官》";
  ["MurenS"] = "穆伦·雷矛";
  ["KelstrumS"] = "克斯塔姆·碎石 《战士训练师》";
  ["BilbanT"] = "比尔班·飞钳 《战士训练师》";
  ["GilbartaG"] = "吉尔巴塔·巨锤 《战场爱好者》";
  ["PLongbeard"] = "飞行员比罗·长须 《铁炉堡攻城坦克旅》";
  ["XiggsF"] = "希格斯·熔火";

  ["Timberline Arms"] = "密林武器店";
  ["BuliwyfS"] = "布里维夫·石拳 《武器大师》";
  ["BixiW"] = "比克斯 《武器大师》";
  ["KelomirI"] = "凯洛米尔·铁手 《锤和法杖》";
  ["ThalgusT"] = "萨古斯·雷拳 《武器商》";
  ["HegnarS"] = "海格纳·快斧 《斧商》";
  ["BrenwynW"] = "布雷文·寒钢 《铸剑商》";

  ["Craghelm's"] = "石盔护甲店";
  ["LissyphusF"] = "利塞弗斯·钢轴 《轻甲商》";
  ["DolkinC"] = "杜尔金·石盔 《锁甲商》";
  ["OlthranC"] = "奥斯兰·石盔 《重甲商》";

  ["SaraB"] = "萨拉·巴鲁";

  --Yell
  ["The Great Forge"] = "大锻炉";

  ["Ironforge Physician"] = "铁炉堡医师协会";
  ["ReynaS"] = "雷纳·石枝 《草药学训练师》";
  ["GwinaS"] = "戈维纳·石枝 《草药学供应商》";
  ["NissaF"] = "尼莎·火石 《急救训练师》";

  ["GrythT"] = "格莱斯·瑟登 《狮鹫管理员》";

  ["Thistlefuzz Arcanery"] = "草须魔法用品店";
  ["EJademoon"] = "塞纳里奥使者安亚·碧月";
  ["GimbleT"] = "吉布·草须 《附魔训练师》";
  ["TilliT"] = "提尔利·草须 《附魔供应商》";
  ["EliseB"] = "艾莉丝·布莱里特 《铭文训练师》";
  ["ThargenH"] = "萨尔根·重羽 《铭文供应商》";

  ["Bronze Kettle"] = "铜壶铁罐";
  ["DarylR"] = "达瑞尔·瑞克努索 《烹饪训练师》";
  ["EmrulR"] = "埃姆鲁尔·里克努斯 《烹饪供应商》";
  ["DBcook"] = "(城市里的任何一个矮人火盆";
  ["DBcook&"] = "           都可以帮你完成烹饪)";

  ["FJavad"] = "先知亚瓦德 《萨满祭司训练师》";

  ["DMMG"] = "深山矿工协会";
  ["GeoframB"] = "吉尔弗拉姆·石趾 《采矿训练师》";
  ["GolnirB"] = "高尼尔·石趾 《采矿供应商》";

  ["Burbik's"] = "巴比克物资店";
  ["BurbikG"] = "巴比克·齿轮 《商人》";

  ["Stonebrow's"] = "石眉布衣店";
  ["JormundS"] = "约莫德·石眉 《裁缝训练师》";
  ["PorannaS"] = "博兰纳·雪衣 《裁缝供应商》";
  ["OEric"] = "埃瑞克 《特殊裁缝物资》";
  ["MistinaS"] = "米斯蒂娜·钢盾 《联盟布匹";
  ["MistinaS&"] = "          军需官》 (矮人)";

  ["Finespindle's"] = "皮甲用品店";
  ["FimbleF"] = "费布·钢轴 《制皮训练师》";
  ["BombusF"] = "伯布斯·钢轴 《制皮供应商》";
  ["BalthusS"] = "巴尔萨斯·裂石 《剥皮训练师》";

  ["OIronbeard"] = "军官彼尔德·铁须 《铁炉堡嘉奖处》";

  ["Sraaz"] = "斯拉兹 《馅饼商人》 (围绕";
  ["Sraaz&"] = "          大熔炉叫卖)";

  ["High Seat"] = "王座厅";
  ["KingMagni"] = "国王麦格尼·铜须 《铁炉堡国王》";
  ["SBarinR"] = "参议员巴林·红石";
  ["RHArchesonus"] = "皇家历史学家阿克瑟努斯";
  ["Deliana"] = "德莉亚娜";

  ["Great Forge"] = "大锻炉";
  ["GrumnusS"] = "格鲁努斯·削钢 《护甲锻造训练师》";
  ["IronusC"] = "埃隆努斯·冷钢 《武器铸造训练师》";
  ["ThurgrumD"] = "索格拉姆·深炉 《锻造供应商》";
  ["BengusD"] = "本古斯·深炉 《锻造训练师》";
  ["MyolorS"] = "米洛尔·怒斩";
  ["BrombarH"] = "布罗巴尔·西格雷比 《钥匙大师》";
  ["TormusD"] = "托姆斯·深炉";
  
  --NPC Orgrimmar
  --White
  ["Valley Strength"] = "力量谷";
  
  ["FARokhs"] = "霜狼大使";

  ["Gryshka"] = "旅店老板格雷什卡";
  ["Morag J"] = "酒吧老板莫拉格";
  ["Kozish"] = "考基什";
  ["Sarok"] = "萨洛克";
  ["Doyo'da"] = "多尤达";
  ["Zaro"] = "Zaro";    --？？
  ["Goma"] = "高玛";
  ["Gamon"] = "加摩尔";

  ["SLSA"] = "索兰装甲店";
  ["Sana"] = "萨纳 《锁甲商》";
  ["Morgum"] = "摩古姆 《皮甲商》";
  ["Ollanus"] = "奥兰努斯 《轻甲商》";

  ["BImports"] = "火枪进口公司";
  ["Kaja"] = "卡加 《枪械和弹药商》";

  ["SReagents"] = "灵魂之怒材料店";
  ["Horthus"] = "霍苏斯 《材料商》";

  ["Horde Embassy"] = "部落大使馆";
  ["Urtrun"] = "乌特伦 《公会注册员》";
  ["Garyl"] = "伽雷尔 《战袍商人》";

  ["GenStore"] = "奥格瑞玛杂货店";
  ["Trak'gen"] = "特拉克根 《杂货商》";
  ["Shimra"] = "史穆拉 《商人》";

  ["ShattAxe"] = "破碎战斧";
  ["Urtharo"] = "乌萨罗 《武器商》";

  ["Chophouse"] = "排骨餐馆";
  ["Olvia"] = "奥维亚 《肉商》";
  ["OrcCook"] = "兽人厨具 (当然，城内的";
  ["OrcCook&"] = "          任何大火盆也可以烹饪)";

  ["SlopeVS"] = "通向精神谷的斜坡";

  ["Zankaja"] = "赞卡沙";
  ["MBlaze"] = "大火盆";

  ["Skytower"] = "通天塔";
  ["Doras"] = "多拉斯 《驭风者管理员》";
  ["CEhoof"] = "塞纳里奥使者托尔·黑蹄";

  ["HallLegends"] = "传说大厅";
  ["SGZarg"] = "石头守卫扎尔格 《武器军需官》";
  ["DorisV"] = "桃丽丝·沃兰休斯 《护甲军需官》";
  ["BraveSton"] = "卫兵布莱恩·石皮 《皮甲军需官》";
  ["BraveSton&"] = "";
  ["Zar'shi"] = "Blood Guard Zar'shi 《护甲军需官》";           --translation needed
  ["LadyPal"] = "潘兰希尔女士 《护甲军需官》";
  ["SergThunder"] = "雷角中士 《武器军需官》";
--["SergThunder&"] = "          Quartermaster";
  ["Bork"] = "狼骑兵波尔克 《坐骑军需官》";
  ["Hola'mahi"] = "一等军士长霍拉麦 《护甲军需官》";
  ["Earthbind"] = "酋长泰恩·地鸣";
  ["Willington"] = "顾问威灵顿";
  ["Teena"] = "军团士兵蒂娜 《护甲军需官》";
  ["CArial"] = "议员阿尔里亚·丹纳塔斯";
  ["D'Anastasis"] = "议员阿尔里亚·丹纳塔斯";
  ["Hini'wana"] = "血卫士希尼瓦纳";
  ["Bek'rah"] = "步兵贝克拉";
  ["Korf"] = "步兵科尔夫";

  ["SkyStaves"] = "天空之怒法杖店";
  ["Ukra'nor"] = "尤克拉诺 《法杖商》";

  ["Keldran"] = "科尔丹";

  ["Xan'tish"] = "克萨迪斯 《蛇商》(在西门和";
  ["Xan'tish&"] = "          灵魂谷之间转悠)";

  ["Krixx"] = "克里克斯 《飞艇技师》(在荣誉谷的诺格机械店";
  ["Krixx&"] = "           和南门之间走动";
--["Krixx&1"] = "           Nogg's Machine Shop in The Valley of";
--["Krixx&2"] = "           Honor)";


  --Purp
  ["ValleySpirits"] = "精神谷";

  ["DarkbriarL"] = "黑石南小屋";
  ["Uthel'nay"] = "尤塞尔奈 《法师训练师》";
  ["Enyo"] = "恩尤 《法师训练师》";
  ["Deino"] = "迪诺 《法师训练师》";
  ["Pephredo"] = "皮菲瑞多 《法师训练师》";
  ["Thuul"] = "索乌 《传送门训练师》";
  ["Vehena"] = "维赫纳 《部落布匹军需官》(巨魔)";
  ["Ray'ma"] = "莱玛 《本月美酒俱乐部》";
  ["Brew Vendor"] = "美酒商人 《本月美酒俱乐部》";

  ["SpiLodge"] = "灵魂小屋";
  ["Ur'kyo"] = "乌尔库 《牧师训练师》";
  ["X'yera"] = "克塞拉 《牧师训练师》";
  ["Zayus"] = "萨尤斯 《高阶祭司》";

  ["SurvivalF"] = "适者生存";
  ["Arnok"] = "阿诺克 《急救训练师》";

  --Yell
  ["Drag"] = "暗巷区";

  ["Borstan's"] = "博斯坦的火坑 (楼上)";
  ["Borstan"] = "博斯坦 《肉商》";
  ["Zamja"] = "扎姆沙 《烹饪训练师》";
  ["Xen'to"] = "克森图 《烹饪供应商》";

  ["Jo'mah"] = "犹尔曼 《铭文训练师》";
  ["Xantili"] = "夏蒂莉 《铭文供应商》";
  ["Zilzibin"] = "基尔兹宾·鼓眼";
  ["Sarlek"] = "萨雷克";
  ["Tamaro"] = "塔玛洛";

  ["Arboretum"] = "加迪植物园 (上层)";
  ["Jandi"] = "加迪 《草药学训练师》";
  ["Zeal'aya"] = "希尔拉亚 《草药学供应商》";

  ["Runeworks"] = "古丹的符文工艺店";
  ["Jhag"] = "夏格 《附魔训练师》";
  ["Slope1"] = "连接上下两层的斜坡";

  ["Yelmak's"] = "耶尔玛克药剂店";
  ["Yelmak"] = "耶尔玛克 《炼金术训练师》";
  ["Kor'geld"] = "考吉尔德 《炼金术供应商》";
  ["Jes'rimon"] = "杰斯雷蒙";

  ["Salvage"] = "杜佛斯回收店";
  ["Dran"] = "德兰·杜佛斯";
  ["Malton"] = "玛尔顿·杜佛斯";

  ["KLeatherworks"] = "科多兽皮工店";
  ["Karolek"] = "卡洛雷克 《制皮训练师》";
  ["Tamar"] = "达玛尔 《制皮供应商》";
  ["Thuwd"] = "苏尔德 《剥皮训练师》";
  ["Handor"] = "罕杜尔 《布甲和皮甲商人》";

  ["ClothG"] = "玛加尔布品店";
  ["Magar"] = "玛加尔 《裁缝训练师》";
  ["Borya"] = "博亚 《裁缝供应商》";
  ["Tor'phan"] = "托尔凡 《布甲和皮甲商人》";
  ["Rashona"] = "莱什纳·刺藤 《部落布匹军需官》";
  ["Rashona&"] = "";

  ["Gotri's"] = "高特雷的旅行装备 (主楼层)";
  ["Malton"] = "高特雷 《背包商人》";

  ["Krixx2"] = "克里克斯 《飞艇技师》";
  ["Felika"] = "菲利卡 《商人》在智慧谷入口";
  ["Felika&"] = "          和力量谷之间走动";
--["Felika&1"] = "";

  --Blue
  ["ValleyHonor"] = "荣誉谷";

  ["Kiro's"] = "基罗护甲店";
  ["Kiro"] = "基罗 《护甲商》";

  ["OBowyer"] = "奥格瑞玛弓箭店";
  ["Jin'sora"] = "金索拉 《弓箭商人》";

  ["HallBrave"] = "勇者大厅";
  ["Zel'mak"] = "泽尔玛克 《战士训练师》";
  ["Sorek"] = "索瑞克 《战士训练师》";
  ["Grezz"] = "格雷兹·怒拳 《战士训练师》";
  ["Andrissa"] = "安蒂萨·心矛 《风暴之眼军官》";
  ["Andrissa&"] = "";
  ["Deze"] = "迪兹·斯诺班 《阿拉希盆地军官》";
  ["Zeggon"] = "赛戈·波斯纳普 《竞技场管理员》";
  ["Brakgul"] = "布拉古尔 《战歌峡谷军官》";
  ["Brakgul&"] = "";
  ["Ufuda"] = "巨人杀手乌芙达 《远古海滩军官》";
  ["Ufuda&"] = "";
  ["Kartra"] = "卡尔特拉·血喉 《奥特兰克山谷军官》";
  ["Muja"] = "穆贾 《战场爱好者》";
  ["HordeWar"] = "部落战争使者";
  ["BelgR"] = "贝尔戈洛姆·石槌";

  ["Lumak's"] = "鲁玛克渔具店";
  ["Lumak"] = "鲁玛克 《钓鱼训练师》";
  ["Shankys"] = "山吉斯 《钓鱼供应商》";
  ["Zas'tysh"] = "沙泰什";

  ["RedMining"] = "红石谷矿业工会";
  ["Makaru"] = "马卡鲁 《采矿训练师》";
  ["Gorina"] = "高里纳 《采矿供应商》";

  ["Orphanage"] = "孤儿院";

  ["Nogg's"] = "诺格机械店";
  ["Nogg"] = "诺格 《初级技师》";
  ["Roxxik"] = "罗克希克 《工程学训练师》";
  ["Sovik"] = "索维克 《工程学供应商》";
  ["Rilli"] = "雷里·格里斯高布";

  ["Shayis"] = "莎伊斯·钢怒 《护甲锻造训练师》";
  ["Okothos"] = "奥克索斯·铁怒 《护甲锻造师》";
  ["Borgosh"] = "伯古什 《武器锻造师》";
  ["OxMO"] = "奥克斯 《秘银会》";
  ["Aturk"] = "铁砧阿图尔克";
  ["OrokkO"] = "奥罗克·沃姆什";

  ["BurnAnvil"] = "燃烧的铁砧";
  ["Saru"] = "萨鲁·钢怒 《锻造训练师》";
  ["Sumi"] = "苏米 《锻造供应商》";
  ["Tumi"] = "图米 《重甲商》";

  ["ArmsLegend"] = "传说中的装备";
  ["Kelgruk"] = "克尔格鲁克·血斧 《武器锻造训练师》";
  ["Zendo'"] = "森度吉安 《武器商》";
  ["Shoma"] = "索玛 《武器商》";
  ["Galthuk"] = "加尔萨克 《双手武器商人》";
  ["Sayoc"] = "塞尤克 《武器大师》";
  ["Hanashi"] = "哈纳什 《武器大师》";
  ["Koru"] = "考鲁 《锤和法杖商人》";

  ["RingValor"] = "勇气之环";
  ["Molog"] = "狩猎者莫洛戈 《竞技场管理员》";
  ["Greela"] = "“步兵”格莉拉·克拉奇 《竞技场管理员》";
  ["Greela&"] = "";

  ["Ogunaro"] = "奥古纳罗 《驯狼者》";
  ["Kildar"] = "基尔达 《骑术训练师》";
  ["Xon'cha"] = "克苏卡 《兽栏管理员》";

  ["HuntHall"] = "猎手大厅";
  ["Sian'dur"] = "萨杜尔 《猎人训练师》";
  ["Xor'juul"] = "科索祖尔 《猎人训练师》";
  ["Ormak"] = "奥玛克 《猎人训练师》";

  --Gren
  ["CleftShad"] = "暗影裂口";

  ["DarkEncl"] = "暗火营地";
  ["Mirket"] = "米尔科特 《术士训练师》";
  ["Zevrost"] = "泽弗洛斯特 《术士训练师》";
  ["Grol'dar"] = "格罗达尔 《术士训练师》";
  ["Gan'rul"] = "甘鲁尔·血眼";

  ["ShadReag"] = "深渊材料店";
  ["Hagrus"] = "哈格鲁斯 《材料商》";
  ["Cazul"] = "卡祖尔";

  ["ISW"] = "铁木法杖店";
  ["Muragus"] = "穆拉古斯 《法杖商》";
  ["Katis"] = "卡提斯 《魔杖商人》";

  ["Neeru"] = "尼尔鲁·火刃";

  ["RCI"] = "怒焰裂谷副本";

  ["DEFM"] = "黑土蘑菇";
  ["Kor'jus"] = "考苏斯 《蘑菇商》";

  ["Barbershop"] = "理发店";
  ["Berbri"] = "贝布莉·科弗库尔 《理发师》";

  ["SlowBlade"] = "迟钝之刃";
  ["Kareth"] = "卡雷斯 《铸剑商》";

  ["ShadowBroth"] = "迅影兄弟会";
  ["Gest"] = "盖斯特 《潜行者训练师》";
  ["Ormok"] = "奥莫克 《潜行者训练师》";
  ["Shenthul"] = "申苏尔 《潜行者训练师》";
  ["Zando'zan"] = "赞杜沙";
  ["Therzok"] = "瑟祖克";

  ["Rekkul's"] = "雷库尔毒药店";
  ["Rekkul"] = "雷库尔 《毒药商》";
  ["Kor'ghan"] = "考格汉";
  
  ["Drok"] = "克拉文·德洛克 (游走于暗影裂口) ";
  ["Drok&"] = "";

  --Cyan
  ["ValleyWisdom"] = "智慧谷";

  ["STVIF"] = "荆棘谷水果进口公司";
  ["Shan'ti"] = "珊迪 《水果商》";

  ["ORedblade"] = "军官布莱德·红刺 《奥格瑞玛嘉奖处》";

  ["GromHold"] = "格罗玛什堡垒";
  ["Sian'tsu"] = "萨祖 《萨满祭司训练师》";
  ["Kardris"] = "卡德里斯 《萨满祭司训练师》";
  ["Sagorne"] = "萨格尼 《萨满祭司训练师》";
  ["Zor"] = "佐尔·孤树 《先知长老》";
  ["Searn"] = "希尔恩·火结";
  ["Eitrigg"] = "伊崔格";
  ["Vol'jin"] = "沃金";
  ["Mokvar"] = "莫克瓦尔";
  ["Pyreanor"] = "派雷亚诺 《圣骑士训练师》";
  ["Dawnsinger"] = "银月大使帕拉·晨歌";
  ["Thrall"] = "萨尔 《酋长》";

  ["Asoran's"] = "阿索兰的市场";
  ["Asoran"] = "阿索兰 《杂货商》";
  ["Magenius"] = "玛基努斯 《材料商》";

  ["Vu'Shalay"] = "军官乌萨雷 《暗矛嘉奖处》";

  --NPC Shattrath
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

  ["Iorioa"] = "Iorioa 《传送门训练师》";
  ["V'eru"] = "V'eru (Upper level)";

  ["WarVet"] = "Haggard War Veteran";
  ["HordeWar"] = "Horde Warbringer";

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

  ["Karokka"] = "Karokka 《毒药商》";
  ["Skreah"] = "Skreah, Alchemy Supplies (Down stairs)";
  ["Lorokeem"] = "Lorokeem, Master Alchemy Trainer (Down stairs)";
  ["Vekax"] = "Vekax (Travels back and forth across bridge)";

  ["Lissaf"] = "Lissaf 《铸剑商》";

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

  ["ABG"] = "Alliance Brigadier General (Alliance";
  ["ABG&"] = "          Battlemasters)";
  ["Vinvo"] = "Vinvo Goldgear 《远古海滩军官》";
  ["Vinvo&"] = "          Battlemaster";
  ["Haelga"] = "Haelga Slatefist 《奥特兰克山谷军官》";
  ["Lylandor"] = "Lylandor 《战歌峡谷军官》";
  ["Iravar"] = "Iravar 《风暴之眼军官》";
  ["AEternum"] = "Adam Eternum 《阿拉希盆地军官》";

  ["WorldEndT"] = "World's End Tavern";
  ["Lathrai"] = "Wind Trader Lathrai";
  ["Shaarubo"] = "Shaarubo 《调酒师》";
  ["Lonika"] = "Lonika Stillblade, Rogue Academy Proprietor";
  ["Kylene"] = "Kylene 《招待员》";
  ["Pilton"] = "Haris Pilton, Socialite";
  ["Zhareem"] = "Wind Trader Zhareem";
  ["Mah'duun"] = "Nether-Stalker Mah'duun";
  ["Zephyr"] = "Zephyr (Reputation Port NPC to CoT)";
  ["salabim"] = "Sal'salabim";
  ["Raliq"] = "Raliq the Drunk";

  ["Kradu"] = "Kradu Grimblade 《武器铸造训练师》";
  ["Zula"] = "Zula Slagfury 《护甲锻造训练师》";

  ["Orph"] = "Orphanage";
  ["Bartlett"] = "Nicole Bartlett, Matron";

  ["HWB"] = "Horde Warbringer (Horde Battlemasters)";
  ["Jojindi"] = "Jojindi 《远古海滩军官》";
  ["Montok"] = "Montok Redhands 《战歌峡谷军官》";
  ["Maka"] = "Wolf-Sister Maka 《奥特兰克山谷军官》";
  ["Keldor"] = "Keldor the Lost 《阿拉希盆地军官》";
  ["Yula"] = "Yula the Fair 《风暴之眼军官》";
  ["Issca"] = "Issca 《战袍商人》";

  ["Seymour"] = "Seymour, Master Skinning Trainer";
  ["Ernie"] = "Ernie Packwell, Trade Goods";
  ["Cro"] = "Cro Threadstrong 《制皮供应商》";
  ["Darmari"] = "Darmari, Master Leatherworking Trainer";
  ["Andrion"] = "Andrion Darkspinner, Shadoweave Specialist";
  ["Gidge"] = "Gidge Spellweaver, Spellfire Specialist";
  ["Nasmara"] = "Nasmara Moonsong, Mooncloth Specialist";
  ["Eiin"] = "Eiin, Specialty Tailoring Supplies";
  ["Griftah"] = "Griftah, Amazing Amulets";
  ["Viggz"] = "Viggz Shinesparked 《工程学供应商》";
  ["Fantai"] = "Fantai 《材料商》";
  ["Aaron"] = "Aaron Hollman 《锻造供应商》";
  ["MRuby"] = "Madam Ruby 《附魔供应商》";
  ["Eral"] = "Eral, General Goods";
  ["Moser"] = "Muffin Man Moser, Bread Merchant";
  ["Nakodu"] = "Nakodu, Lower City Quartermaster";
  ["JackT"] = "Jack Trapper 《厨师》";
  ["Saltit"] = "Jim Saltit 《烹饪供应商》";
  ["GSmith"] = "Granny Smith, Fruit Seller";
  ["BTurner"] = "Brendan Turner 《肉商》";
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

  ["Ilthuril"] = "Ilthuril 《兽栏管理员》";
  ["Endernor"] = "Trader Endernor, Trade Goods";
  ["Lisrythe"] = "Lisrythe Bloodwatch, Fence";
  ["Mahir"] = "Mahir Redstroke, Dagger Vendor";
  ["Dathris"] = "Dathris Sunstriker";

  ["Kirembri"] = "Kirembri Silvermane, Master Jewelcrafting";
  ["Kirembri&"] = "          Trainer";
  ["Hanlir"] = "Hanlir, Master Mining Trainer";
  ["Lanloer"] = "Scribe Lanloer, Master Inscription Trainer";
  ["Andiala"] = "Enchantress Andiala, Master Enchanting Trainer";

  ["Nalama"] = "Nalama the Merchant, General Goods";
  ["Urumir"] = "Urumir Stavebright, Staff Vendor";

  ["Falris"] = "Magister Falris";
  ["Fyalenn"] = "Magistrix Fyalenn (Accepts Tokens in exchange";
  ["Fyalenn&"] = "          for Scryer Reputation)";

  ["SeerLib"] = "The Seer's Library";
  ["Arodis"] = "Arodis Sunblade, Keeper of Sha'tari Artifacts";
  ["Veynna"] = "Veynna Dawnstar, Keeper of Sha'tari Heirlooms";
  ["Volali"] = "Enchantress Volali 《附魔训练师》";
  ["Bardolan"] = "High Enchanter Bardolan, Master Enchanting";
  ["Bardolan&"] = "          Trainer";
  ["Voren"] = "Voren'thal the Seer";
  ["Lisrythe"] = "Loremaster Skosiris";
  ["Traini"] = "Training for all professions up to Master level";
  ["Traini&"] = "          (Book stacks)";

  ["Mi'irku"] = "Mi'irku Farstep, Portal Trainer (Up the outside";
  ["Mi'irku&"] = "          slope)";
  ["Olodam"] = "Olodam Farhollow";

  ["Alamaro"] = "Vinemaster Alamaro, Wine Vendor";
  ["Amshesha"] = "Amshesha Stilldark 《材料商》";
  ["Yurial"] = "Yurial Soulwater 《附魔供应商》";

  ["Quelama"] = "Quelama Lightblade 《魔杖商人》";
  ["Selanam"] = "Selanam the Blade, Sword Vendor";

  ["Aelthin"] = "Aelthin, Master Alchemy Trainer";
  ["Alaenra"] = "Botanist Alaenra, Master Herbalism Trainer";

  ["Delvinar"] = "Archer Delvinar, Specialty Ammunition";
  ["Daenril"] = "Daenril, Master Leatherworking Trainer";
  ["Miralisse"] = "Miralisse, Master Tailoring Trainer";
  ["Irduil"] = "Irduil, Master Skinning Trainer";
  ["Barien"] = "Barien, Master Blacksmithing Trainer";
  ["Sinbei"] = "Engineer Sinbei, Master Engineering Trainer";

  --Blue
  ["ARise"] = "Aldor Rise";

  ["Minalei"] = "Minalei, Innkeeper";
  ["Garul"] = "Garul, Food and Drink Vendor";
  ["Oruhe"] = "Oruhe 《兽栏管理员》";

  ["Nemiha"] = "Nemiha, Master Jewelcrafting Trainer";
  ["Fono"] = "Fono, Master Mining Trainer";
  ["Zurii"] = "Zurii, Master Enchanting Trainer";
  ["Lidio"] = "Recorder Lidio, Master Inscription Trainer";

  ["Caylee"] = "Caylee Dak";

  ["Erothem"] = "Harbinger Erothem";
  ["Adyen"] = "Adyen the Lightwarden";

  ["Hamanar"] = "Hamanar, Master Jewelcrafting Trainer";
  ["Inessera"] = "Inessera, Jewelcrafting Supplies";
  ["Ahemen"] = "Ahemen, Staff Vendor";

  ["Dremm"] = "Dremm, Master Skinning Trainer";
  ["Aoa"] = "Weaver Aoa, Master Tailoring Trainer";
  ["Korim"] = "Korim, Master Leatherworking Trainer";
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
  ["Jovia"] = " Innkeeper Jovia, Innkeeper";
  ["Sylann"] = "Sylann 《厨师》";
  ["Quelis"] = "Quelis 《烹饪供应商》";

  ["SFinery"] = "Silvermoon Finery";
  ["Zyandrel"] = "Zyandrel 《布甲商》";
  ["Andra"] = "Andra, Clothier";
  ["Rathin"] = "Rathin 《背包商人》";

  ["Bithrus"] = "Bithrus 《焰火商人》";

  ["Keelen's"] = "Keelen's Trustworthy Tailoring";
  ["SorimL"] = "Sorim Lightsong, Horde Cloth Quartmaster";
  ["Keelen"] = "Keelen Sheets 《裁缝训练师》";
  ["Deynna"] = "Deynna, Tailoring Supplier";

  ["Welethelon"] = "Welethelon 《钝器商人》";
  ["Noraelath"] = "Noraelath 《皮甲商》";

  ["BladesbR"] = "Blades by Rahein";
  ["Rahein"] = "Rahein 《刀剑商人》";
  ["Feledis"] = "Feledis, Axe Vendor";

  ["GeGoods"] = "General Goods";
  ["Sathren"] = "Sathren Azuredawn, General Goods";
  ["Zalle"] = "Zalle 《材料商》";

  ["SSPMP"] = "Shields of Silver/Plate and Mail Protection";
  ["Winthren"] = "Winthren 《盾牌商人》";
  ["Tynna"] = "Tynna 《板甲商人》";
  ["Keeli"] = "Keeli 《锁甲商》";

  ["Parnis"] = "Parnis 《商人》";

  --Purp
  ["WElders"] = "Walk of Elders";

  ["Harene"] = "Harene Plainwalker 《德鲁伊训练师》";

  ["Valaani's"] = "Valaani's Arcane Goods";
  ["Velanni"] = "Velanni 《炼金术和材料供应商》";
  ["Zathanna"] = "Zathanna 《魔杖商人》";

  ["CGate"] = "The Shepperd's Gate";

  ["SilRegistry"] = "Silvermoon Registry";
  ["Tandrine"] = "Tandrine 《公会注册员》";
  ["Kredis"] = "Kredis 《战袍商人》";

  ["Lynalis"] = "Lynalis 《制皮训练师》";
  ["Zaralda"] = "Zaralda 《制皮供应商》";
  ["Tyn"] = "Tyn 《剥皮训练师》";

  ["Drathen"] = "Drathen 《钓鱼训练师》";
  ["Olirea"] = "Olirea 《钓鱼供应商》";
  ["Alestus"] = "Alestus 《急救训练师》";

  --Gren
  ["RoyEx"] = "The Royal Exchange";

  ["SCI"] = "Silvermoon City Inn";
  ["Velandra"] = "Innkeeper Velandra, Innkeeper";
  ["Suntouched"] = "Vinemaster Suntouched, Wine & Spirits Merchant";
  ["BKAdept"] = "Blood Knight Adept";
  ["Stillb"] = "Blood Knight Stillblade";

  ["Kalinda"] = "Kalinda 《珠宝加工训练师》";
  ["Gelanthis"] = "Gelanthis 《珠宝加工供应商》";
  ["Amin"] = "Amin 《初级珠宝匠》";

  --Red
  ["FarSquare"] = "Farstriders Square";

  ["Celana"] = "Celana, Bowyer";
  ["Matha"] = "Mathaleron, Gunsmith";

  ["Osselan"] = "Osselan 《圣骑士训练师》";
  ["Ithelis"] = "Ithelis 《圣骑士训练师》";
  ["CBachi"] = "Champion Bachi 《圣骑士训练师》";
  ["Bvalor"] = "Knight-Lord Bloodvalor";
  ["Astalor"] = "Magister Astalor Bloodsworn (Lower Section)";
  ["Solanar"] = "Lord Solanar Bloodwrath (Lower Section)";
  ["Ileda"] = "Ileda 《武器大师》";

  ["Bipp"] = "Bipp Glizzitor 《竞技场管理员》";
  ["Karen"] = "Karen Wentworth 《阿拉希盆地军官》";
  ["Gurak"] = "Gurak 《奥特兰克山谷军官》";
  ["Duyash"] = "Duyash the Cruel 《风暴之眼军官》";
  ["Krukk"] = "Krukk 《战歌峡谷军官》";
  ["Mabrian"] = "Mabrian Fardawn 《远古海滩军官》";
  ["Mabrian&"] = "          Battlemaster";

  ["SLowerSec"] = "Stairs to Lower Section";

  ["Shalenn"] = "Shalenn 《兽栏管理员》";
  ["Tana"] = "Tana 《猎人训练师》";
  ["Oninath"] = "Oninath 《猎人训练师》";
  ["Zandine"] = "Zandine 《猎人训练师》";
  ["Halthenis"] = "Halthenis 《宠物训练师》";

  ["Zelan"] = "Zelan 《采矿供应商》";
  ["Belil"] = "Belil 《采矿训练师》";
  ["Bemarrin"] = "Bemarrin 《锻造训练师》";
  ["Eriden"] = "Eriden 《锻造供应商》";

  ["Danwe"] = "Danwe 《工程学训练师》";
  ["Yatheon"] = "Yatheon, Engineering Supplier";

  --Ltblu
  ["MurRow"] = "Murder Row";

  ["Nerisen"] = "Nerisen 《潜行者训练师》";
  ["Elara"] = "Elara 《潜行者训练师》";
  ["Zelanis"] = "Zelanis 《潜行者训练师》";
  ["Darlia"] = "Darlia 《毒药商》";

  ["Talionia"] = "Talionia 《术士训练师》";
  ["Alamma"] = "Alamma 《术士训练师》";
  ["Zanien"] = "Zanien 《术士训练师》";

  --Orng
  ["CourtSun"] = "Court of the Sun";

  ["Camberon"] = "Camberon 《炼金术训练师》";
  ["Nathera"] = "Botanist Nathera, Herbalist";
  ["elaris"] = "Melaris 《炼金术供应商》";

  ["Sedana"] = "Sedana 《附魔训练师》";
  ["Lyna"] = "Lyna 《附魔供应商》";
  ["Zanatasia"] = "Zanatasia 《铭文训练师》";
  ["Lelorian"] = "Lelorian 《铭文供应商》";

  --Blue
  ["SunSpire"] = "Sunfury Spire";

  ["OrbTrans"] = "Orb of Translocation to Undercity";

  ["Lor'themar"] = "Lor'themar Theron, Regent Lord of Quel'Thalas";
  ["Brightwing"] = "Halduron Brightwing, Ranger General";
  ["Rommath"] = "Grand Magister Rommath";

  ["Lotheolan"] = "Lotheolan 《牧师训练师》";
  ["Belestra"] = "Belestra 《牧师训练师》";
  ["Aldrae"] = "Aldrae 《牧师训练师》";

  ["Zaedana"] = "Zaedana 《法师训练师》";
  ["Quithas"] = "Quithas 《法师训练师》";
  ["Inethven"] = "Inethven 《法师训练师》";
  ["Narinth"] = "Narinth 《传送门训练师》";
  
  --NPC Stormwind
  --Ltblu

  ["Barbershop"] = "Barbershop";

  ["ValHer"] = "Valley of Heroes";

  ["SBank"] = "Stormwind Counting House";
  ["Mahloof"] = "Officer Mahloof, Stormwind Commendations";

  ["Jorgen"] = "Jorgen";
  ["Umbrua"] = "Farseer Umbrua 《萨满祭司训练师》";
  ["GMarcus"] = "General Marcus Jonathan";
  ["FMAfras"] = "Field Marshal Afrasiabi";
  ["MMattin"] = "Major Mattingly";
  ["Goodman"] = "Crier Goodman (Travels throughout the city)";

  --White
  ["TDistri"] = "Trade District";

  ["SWVC"] = "Stormwind Visitor Center";
  ["AdwinL"] = "Adwin Laughlin 《公会注册员》";
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
  ["EdnaM"] = "Edna Mullby 《商人》";
  ["TMull"] = "Thurman Mullby 《杂货商》";

  ["Weller's"] = "Weller's Arsenal";
  ["MardaW"] = "Marda Weller, Weapon's Merchant";
  ["GunthW"] = "Gunther Weller, Weapon's Merchant";
  ["WooPing"] = "Woo Ping 《武器大师》";

  ["LionArm"] = "Lionheart Armory";
  ["CarlaG"] = "Carla Granger 《布甲商》";
  ["LaraM"] = "Lara Moore 《皮甲商》";
  ["AldrM"] = "Aldric Moore 《锁甲商》";
  ["HarlB"] = "Harlan Bagley";

  ["TGRI"] = "The Guided Rose Inn";
  ["InnAl"] = "Innkeeper Allison";

  ["EmpQuiv"] = "The Empty Quiver";
  ["FredeS"] = "Frederick Stover, Bow & Arrow Merchant";
  ["LinaS"] = "Lina Stover, Arrow Merchant";

  ["JSharp"] = "Jelinek Sharpshear 《理发师》";

  ["DungL"] = "Dungar Longdrink 《狮鹫管理员》";

  ["FragFlow"] = "Fragrant Flowers";
  ["BGump"] = "Bernard Gump, Florist";
  ["FGump"] = "Felicia Gump 《草药学供应商》";

  ["CanalTail"] = "Canal Tailor & Fit Shop";
  ["LisbS"] = "Lisbeth Schneider, Clothier";
  ["RemaS"] = "Rema Schneider";

  ["ArnoL"] = "Arnold Leland 《钓鱼训练师》";
  ["CatheL"] = "Catherine Leland 《钓鱼供应商》";

  ["GallWine"] = "Gallina Winery";
  ["JuliG"] = "Julia Gallina, Wine Vendor";
  ["RobertP"] = "Roberto Pupellyverbos, Meriot Connoisseur";
  ["SuzetG"] = "Suzette Gallina";

  --Orng
  ["MageQuart"] = "The Mage Quarter";

  ["Stock"] = "The Stockades";
  ["WThelw"] = "Warden Thelwater";
  ["Stocks"] = "The Stormwind Stockades Instance";

  ["CStanf"] = "Catarina Stanford 《铭文训练师》";
  ["McCorm"] = "Stanely McCormick 《铭文供应商》";

  ["Mazen"] = "Mazen Mac'Nadir, Academy of Arcane Arts";
  ["Mazen&"] = "          & Sciences";
  ["AdairG"] = "Adair Gilroy, Librarian";
  ["ADellis"] = "Acolyte Dellis";

  ["LucanC"] = "Lucan Cordell 《附魔训练师》";
  ["JessaraC"] = "Jessara Cordell 《附魔供应商》";

  ["SWStaves"] = "Stormwind Staves";
  ["ArdwynC"] = "Ardwyn Cailen 《魔杖商人》";
  ["AllanH"] = "Allan Hafgan, Staves Merchant";

  ["Duncan'sT"] = "Duncan's Textiles";
  ["DuncanC"] = "Duncan Cullen 《轻甲商》";
  ["AlexanB"] = "Alexandra Bolero 《裁缝供应商》";
  ["GeorgB"] = "Georgio Bolero 《裁缝训练师》";
  ["Clavicus"] = "Clavicus Knavingham. Alliance Cloth";
  ["Clavicus&"] = "          Quartermaster";

  ["AlcNee"] = "Alchemy Needs";
  ["Tannysa"] = "Tannysa 《草药学训练师》";
  ["Lilyss"] = "Lilyssia Nightbreeze 《炼金术训练师》";
  ["MariaL"] = "Maria Lumere 《炼金术供应商》";
  ["Eldra"] = "Eldraeith 《草药学供应商》";

  ["CollinM"] = "Collin Mauren";

  ["BlueRec"] = "The Blue Recluse";
  ["Joachim"] = "Joachim Brenlow 《调酒师》";
  ["ConnerR"] = "Conner Rivers, Apprentice Chef";
  ["SLohan"] = "Steven Lohan";
  ["AStern"] = "Angus Stern, Head Chef";
  ["CFire"] = "Cooking Fire";

  ["AMalin"] = "Archmage Malin";

  ["WizSan"] = "Wizard's Sanctum (Central Tower)";
  ["HAndromath"] = "High Sorcerer Andromath";
  ["JCannon"] = "Jennea Cannon 《法师训练师》";
  ["Elsharin"] = "Elsharin 《法师训练师》";
  ["MDumas"] = "Maginor Dumas, Master Mage";
  ["LPurdue"] = "Larimaine Purdue 《传送门训练师》";

  ["LarsonClo"] = "Larson Clothiers";
  ["WLarson"] = "Wynne Larson 《长袍商》";
  ["ELarson"] = "Evan Larson, Hatter";

  ["EssenComp"] = "Essential Components";
  ["OVaughn"] = "Owen Vaughn 《材料商》";

  ["AncientCu"] = "Ancient Curios";
  ["Yserian"] = "Charys Yserian, Arcane Trinkets Vendor";

  ["SlaughtLa"] = "The Slaughtered Lamb";
  ["Jarel"] = "Jarel Moore 《调酒师》";
  ["Jalane"] = "Jalane Ayrole, Master Shadoweave Tailor";
  ["Zardeth"] = "Zardeth of the Black Claw";
  ["Sandahl"] = "Sandahl 《术士训练师》";
  ["Gakin"] = "Gakin the Darkbinder";
  ["Cloyce"] = "Demisette Cloyce 《术士训练师》";
  ["Deline"] = "Ursula Deline 《术士训练师》";
  ["Spackle"] = "Spackle Thornberry";

  ["Pyrot"] = "Pyrotechnics";
  ["Singh"] = "Darian Singh 《焰火商人》";

  --Cyan
  ["SWPark"] = "The Park";

  ["Folsom"] = "Caretaker Folsom";

  ["Sylista"] = "Sylista 《兽栏管理员》";

  ["SWInn"] = "Inn";

  ["Shylamir"] = "Shylamir 《草药学训练师》";

  ["Tavern"] = "Tavern";

  ["ArgosN"] = "Argos Nightwhisper";
  ["Sheldras"] = "Sheldras Moontree 《德鲁伊训练师》";
  ["Theridian"] = "Theridian 《德鲁伊训练师》";
  ["Maldryn"] = "Maldryn 《德鲁伊训练师》";
  ["NaraM"] = "Nara Meideros 《牧师训练师》";

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
  ["GCPK"] = "Galley Chief Paul Kubit, Food & Drink Vendor";
  ["CurtisP"] = "Engineer Curtis Paddock 《商人》";
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
  ["AgustM"] = "Agustus Moulaine 《锁甲商》";
  ["TheresM"] = "Theresa Moulaine 《长袍商》";

  ["BKrist"] = "Brother Kristoff";

  ["OMNight"] = "Orphan Matron Nightingale";
  ["Shel"] = "Shellene, Orphan Matron";

  ["CathLig"] = "Cathedral of Light";
  ["BSarno"] = "Brother Sarno";
  ["Rall"] = "Dunthorian Rall";
  ["BFarth"] = "Bishop Farthing";
  ["ABBened"] = "Arch Bishop Benedictus";
  ["Gazin"] = "Gazin Tenorm";
  ["HPLaur"] = "High Priestess Laurena 《牧师训练师》";
  ["JoshPT"] = "Brother Joshua 《牧师训练师》";
  ["Benj"] = "Brother Benjamin 《牧师训练师》";

  ["Grayson"] = "Lord Grayson Shadowbreaker 《圣骑士训练师》";
  ["KathPT"] = "Katherine the Pure 《圣骑士训练师》";
  ["ArthPT"] = "Arthur the Faithfull 《圣骑士训练师》";

  ["SFull"] = "Sharina Fuller 《急救训练师》";
  ["BCass"] = "Brother Cassius 《材料商》";

  ["CathLigD"] = "Cathedral of Light (Downstairs)";
  ["BAnton"] = "Brother Anton, Scarlet Crusade Emissary";

  ["CityHall"] = "City Hall";
  ["BarosA"] = "Baros Alexston, City Architect";
  ["RFBathr"] = "Royal Factor Bathrilor, Stormwind Census";

  ["ArgentD"] = "The Argent Dawn";

  ["OEmma"] = "Ol' Emma (Travels to the well in the Trade District";
  ["OEmma&"] = "          and back to her house every fifteen minutes)";

  --Yell
  ["DwarvDist"] = "The Dwarven District";

  ["CTAlley"] = "Cut-Throat Alley";

  ["GelmanS"] = "Gelman Stonehand 《采矿训练师》";
  ["BrookS"] = "Brook Stonebraid 《采矿供应商》";

  ["BorgusS"] = "Borgus Steelhand 《武器铸造训练师》";
  ["KathA"] = "Kathrum Axehand 《斧商》";
  ["Grimand"] = "Grimand Elmore";

  ["ThulmF"] = "Thulman Flintcrag, Guns Vendor";

  ["Shoni"] = "Shoni the Shilent";

  ["LilliS"] = "Lilliam Sparkspinkdle 《工程学训练师》";
  ["BilliC"] = "Billibub Cogspinner, Engineering Supplier";

  ["EyeStorm"] = "Eye of the Storm Emissary";

  ["TherumD"] = "Therum Deepforge 《锻造训练师》";
  ["KaitaD"] = "Kaita Deepforge 《锻造供应商》";
  ["Hank"] = "Hank the Hammer, Mithril Order";
  ["Furen"] = "Furen Longbeard";
  ["BeniB"] = "Beni Boltshear 《锁匠》";

  ["Jenova"] = "Jenova Stoneshield 《兽栏管理员》";
  ["Einris"] = "Einris Brightspear 《猎人训练师》";
  ["Ulfir"] = "Ulfir Ironbeard 《猎人训练师》";
  ["Thorfin"] = "Thorfin Stoneshield 《猎人训练师》";

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
  ["Beka"] = "Beka Zipwhistle 《竞技场管理员》";
  ["ThelmS"] = "Thelman Slatefist, Alterac Valley 《竞技场管理员》";
  ["Elfarran"] = "Elfarran 《战歌峡谷军官》";
  ["Jovil"] = "Jovil 《风暴之眼军官》";
  ["Hotes"] = "Lady Hoteshem 《阿拉希盆地军官》";
  ["Bethany"] = "Bethany Aldire 《远古海滩军官》";

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
  ["GKoen"] = "Gerik Koen 《双手武器商人》";

  ["Pig&W"] = "Pig & Whistle Tavern";
  ["ReeseL"] = "Reese Langston, Tavernkeeper";
  ["SRyback"] = "Stephen Ryback 《烹饪训练师》";
  ["ETate"] = "Erika Tate 《烹饪供应商》";
  ["KKabon"] = "Kendor Kabonka, Master of Cooking Recipes";
  ["Bartleby"] = "Bartleby, Drunk";
  ["DLangs"] = "David Langston";
  ["Aedis"] = "Aedis Brom";
  ["Faral"] = "Christoph Faral";
  ["HarryB"] = "Harry Burlguard";
  ["EllyLang"] = "Elly Langston 《招待员》";

  ["FDV"] = "The Five Deadly Venoms";
  ["Lenney"] = "Lenney 'Fingers' McCoy (outside)";
  ["Beasley"] = "Ol'Beasley (outside)";
  ["Dashel"] = "Dashel Stonefist (outside)";
  ["MilesS"] = "Miles Sidney 《毒药商》";
  ["Wright"] = "Wright Williams";

  ["HonestB"] = "Honest Blades";
  ["Heinrich"] = "Heinrich Stone 《铸剑商》";

  ["Immuni"] = "Limited Immunity";
  ["OStrang"] = "Osric Strang 《重甲商》";
  ["WStrang"] = "Wilhelm Strang 《锁甲商》";

  ["Osborne"] = "Osborne the Night Man 《潜行者训练师》";

  ["CHall"] = "Champion's Hall";
  ["O'Neal"] = "Captain O'Neal 《护甲军需官》";
  ["Jacksp"] = "Lieutenant Jackspring 《武器军需官》";
  ["Biggin"] = "Master Sergeant Biggins 《皮甲军需官》";
  ["Biggin&"] = "          Quartermaster";
  ["Karter"] = "Lieutenant Karter, Mount Vendor";
  ["Tristia"] = "Lieutenant Tristia 《护甲军需官》";
  ["Skyshad"] = "Sergeant Major Skyshadow";
  ["Ennarth"] = "Harbinger Ennarth";
  ["Gaiman"] = "Archmage Gaiman";
  ["Vaccar"] = "Lieutenant Major Vaccar";
  ["Dirgeh"] = "Captain Dirgehammer 《武器军需官》";
  ["Dirgeh&"] = "          Quartermaster";
  ["Moonst"] = "Knight-Lieutenant Moonstrike, Armor";
  ["Moonst&"] = "          Quartermaster";
  ["Clate"] = "Sergeant Major Clate 《护甲军需官》";

  ["ComCent"] = "Command Center";
  ["Wood"] = "Master Wood";
  ["IlsaC"] = "Ilsa Corbin 《战士训练师》";
  ["WuShen"] = "Wu Shen 《战士训练师》";
  ["AnderG"] = "Ander Germaine 《战士训练师》";

  ["SI:7"] = "SI:7";
  ["Mathias"] = "Master Mathias Shaw, Leader of SI:7";
  ["Renzik"] = "Renzik 'The Shiv', SI:7 Operative";
  ["Sloan"] = "Sloan McCoy 《毒药商》";
  ["Fel"] = "Jasper Fel 《毒药商》";
  ["Romano"] = "Lord Tony Romano 《潜行者训练师》";
  ["Mixil"] = "Doc Mixilpixil (downstairs)";

  ["ProHide"] = "The Protective Hide";
  ["STanner"] = "Simon Tanner 《制皮训练师》";
  ["JTanner"] = "Jillian Tanner 《制皮供应商》";
  ["Granger"] = "Maris Granger 《剥皮训练师》";
  ["AlyssaG"] = "Alyssa Griffith 《背包商人》";
  ["SeomanG"] = "Seoman Griffith 《皮甲商》";
  ["Noah"] = "Little Noah";

  ["ThanBoo"] = "Thane's Boots";
  ["Mayda"] = "Mayda Thane, Cobbler";

  ["SilverSh"] = "The Silver Shield";
  ["BCross"] = "Bryan Cross 《盾牌商人》";

  ["JennL"] = "Jenn Langston (Does a circuit around Old Town)";
  ["Nikova"] = "Nikova Raskol (Does a circuit around Old Town";
  ["Nikova&"] = "          stopping at three places for a few";
  ["Nikova&1"] = "          minutes each stop)";
  
  --NPC Thunder Bluff
  --White
  ["LLevel"] = "The Lower Rise";

  ["Pala"] = "Innkeeper Pala";
  ["Bulrug"] = "Bulrug 《兽栏管理员》";
  ["AtHR"] = "Access to The Hunter Rise";

  ["ElevM"] = "Elevator to Mulgore";

  ["TBCI"] = "Thunder Bluff Civic Information";
  ["Thrumn"] = "Thrumn 《战袍商人》";
  ["Krumn"] = "Krumn 《公会注册员》";
  ["Scorch"] = "Scorching Fire";

  ["Kuruk's"] = "Kuruk's Goods";
  ["Kuruk"] = "Kuruk 《杂货商》";
  ["Pakwa"] = "Pakwa 《背包商人》";

  ["TGASu"] = "Trade Goods and Supplies";
  ["ShadiM"] = "Shadi Mistrunner, Trade Goods Supplies";

  ["Jyn"] = "Jyn Stonehoof, Weapons Merchant";
  ["Ansek"] = "Ansekhwa 《武器大师》";

  ["Hewa's"] = "Hewa's Armory";
  ["Hewa"] = "Hewa 《布甲商》";
  ["Elki"] = "Elki 《锁甲商》";
  ["Ahanu"] = "Ahanu, Armor Merchant";

  ["Tal"] = "Tal 《驭风者管理员》";
  ["ALLMLUL"] = "Access to The Lower Rise, The Middle Rise and";
  ["ALLMLUL&"] = "          The Upper Rise";

  ["derstr"] = "Officer Thunderstrider, Thunder Bluff";
  ["derstr&"] = "          Commendations";

  ["BandG"] = "Breads and Grains";
  ["Fry"] = "Fry Mistrunner, Bread Vendor";

  ["Karn's"] = "Karn's Smithy";
  ["Karn"] = "Karn Stonehoof 《锻造训练师》";
  ["Taur"] = "Taur Stonehoof 《锻造供应商》";
  ["Orm"] = "Orm Stonehoof";

  ["Truths"] = "Sage Truthseeker";
  ["AtSR"] = "Access to The Spirit Rise";

  ["Geology"] = "Stonehoof Geology";
  ["Brek"] = "Brek Stonehoof 《采矿训练师》";
  ["KurmS"] = "Kurm Stonehoof 《采矿供应商》";

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
  ["Nan"] = "Nan Mistrunner 《水果商》";

  ["Holis"] = "Holistic Herbalism";
  ["Komin"] = "Komin Winterhoof 《草药学训练师》";
  ["Nida"] = "Nida Winterhoof 《草药学供应商》";

  ["AtER"] = "Access to The Elder Rise";

  ["CloudB"] = "Cloudeweavers Baskets";
  ["Tand"] = "Tand, Basket Weaver";

  ["Bena's"] = "Bena's Alcehcmy";
  ["Bena"] = "Bena Winterhoof 《炼金术训练师》";
  ["Mani"] = "Mani Winterhoof 《炼金术供应商》";

  ["TBEnchanters"] = "Dawnstrider Enchanters";
  ["Teg"] = "Teg Dawnstrider 《附魔训练师》";
  ["Nata"] = "Nata Dawnstrider 《附魔供应商》";

  ["TBArmorers"] = "Thunder Bluff Armorers";
  ["Mooranta"] = "Mooranta 《剥皮训练师》";
  ["Veren"] = "Veren Tallstrider";
  ["Tepa"] = "Tepa 《裁缝训练师》";
  ["Mahu"] = "Mahu, Leatherworking & Tailoring Supplies";
  ["Tagain"] = "Tagain 《布甲商》";
  ["Fela"] = "Fela 《重甲商》";
  ["Grod"] = "Grod, Leather Armour Merchant";
  ["Una"] = "Una 《制皮训练师》";
  ["Rumstag"] = "Rumstag Proudstrider, Horde Cloth";
  ["Rumstag&"] = "          Quartermaster";

  --Yell
  ["ULevel"] = "The Upper Rise";

  ["Rainsticks"] = "Rainsticks";
  ["Sunn"] = "Sunn Ragetotem 《法杖商》";

  ["KS&R"] = "Kodo Steak & Ribs";
  ["Kaga"] = "Kaga Mistrunner 《肉商》";

  ["WinterT"] = "Winterhoof Totems";
  ["Tah"] = "Tah Winterhoof";

  ["MTB&T"] = "Mountaintop Bait & Tackle";
  ["Kah"] = "Kah Mistrunner 《钓鱼训练师》";
  ["Sewa"] = "Sewa Mistrunner 《钓鱼供应商》";

  ["CairneB"] = "Cairne Bloodhoof, High Chieftain";

  ["Halpa"] = "Halpa, Prairie Dog Vendor";

  ["TBFirea"] = "Thunderbluff Firearms";
  ["Hogor"] = "Hogor Thunderhoof, Guns Merchant";

  ["Raget"] = "Ragetotem Arms";
  ["Delgo"] = "Delgo Ragetotem 《斧商》";
  ["Etu"] = "Etu Ragetotem,  《锤和法杖商人》";
  ["Ohanko"] = "Ohanko, Two Handed Weapon Merchant";
  ["Kard"] = "Kard Ragetotem, Sword & Dagger Merchant";

  ["Sura"] = "Sura Wildmane, War Harness Vendor";

  ["Aska's"] = "Aska's Kitchen";
  ["Aska"] = "Aska Mistrunner 《烹饪训练师》";
  ["Naal"] = "Naal Mistrunner 《烹饪供应商》";

  ["Zangen"] = "Zangen Stonehoof";

  --Blue
  ["HuntR"] = "The Hunter Rise";

  ["HHall"] = "Hunter's Hall";
  ["Urek"] = "Urek Thunderhorn 《猎人训练师》";
  ["Kary"] = "Kary Thunderhorn 《猎人训练师》";
  ["Holt"] = "Holt Thunderhorn 《猎人训练师》";
  ["Sark"] = "Sark Ragetotem 《战士训练师》";
  ["Torm"] = "Torm Ragetotem 《战士训练师》";
  ["Ker"] = "Ker Ragetotem 《战士训练师》";

  ["Saern"] = "Saern Priderunner";
  ["Melor"] = "Melor Stonehoof";

  ["Althal"] = "Althallen Brightblade 《风暴之眼军官》";
  ["Martin"] = "Martin Lindsey 《阿拉希盆地军官》";
  ["Fizim"] = "Fizim Blastwrench 《竞技场管理员》";

  ["Kergul"] = "Kergul Bloodaxe 《战歌峡谷军官》";
  ["Ufuda"] = "Godo Cloudchewer 《远古海滩军官》";
  ["Ufuda&"] = "          Battlemaster";
  ["Taim"] = "Taim Ragetotem 《奥特兰克山谷军官》";

  ["Mosarn"] = "Mosarn";

  ["Hesuwa"] = "Hesuwa Thunderhorn 《宠物训练师》";

  --Gren
  ["ERise"] = "The Elder Rise";

  ["HElders"] = "Hall of Elders";
  ["Kym"] = "Kym Wildmane 《德鲁伊训练师》";
  ["Turak"] = "Turak Runetotem 《德鲁伊训练师》";
  ["Sheal"] = "Sheal Runetotem 《德鲁伊训练师》";
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
  ["Beram"] = "Beram Skychaser 《萨满祭司训练师》";
  ["Siln"] = "Siln Skychaser 《萨满祭司训练师》";
  ["Tigor"] = "Tigor Skychaser 《萨满祭司训练师》";
  ["Xanis"] = "Xanis Flameweaver";

  ["SHealing"] = "Spiritual Healing";
  ["Pand"] = "Pand Stonebinder 《急救训练师》";

  ["Pawe"] = "Pawe Mistrunner";

  ["PVision"] = "Pools of Vision";
  ["Clarice"] = "Clarice Foster";
  ["Poshken"] = "Poshken Hardbinder 《铭文训练师》";
  ["Mertle"] = "Mertle Murkpen 《铭文供应商》";
  ["Malakai"] = "Malakai Cross 《牧师训练师》";
  ["Zamah"] = "Apothecary Zamah, Royal Apothecary Society";
  ["Cranst"] = "Birgitte Cranston 《传送门训练师》";
  ["Shymm"] = "Archmage Shymm 《法师训练师》";
  ["Welsh"] = "Miles Welsh 《牧师训练师》";
  ["Ursyn"] = "Ursyn Ghull 《法师训练师》";
  ["FCobb"] = "Father Cobb 《牧师训练师》";
  ["Xane"] = "Thurston Xane 《法师训练师》";
  
  --NPC Undercity
  --White
  ["TraQuart"] = "The Trade Quarter";

  ["Aucti"] = " Auctioneer (Just outside of the Trade Quarter";
  ["Aucti&"] = "           in the Canals)";

  ["ERusk"] = "Eleanor Rusk 《杂货商》";
  ["GenGoods"] = " General Goods";

  ["FDoan"] = "Felicia Doan 《商人》";
  ["GCallow"] = "Genavie Callow";

  ["BHandler"] = "Bat Handler";
  ["MGarrett"] = "Michael Garrett, Bat Handler";
  ["PGarrett"] = "Patrick Garrett";

  ["OGothena"] = "Officer Gothena, Undercity Commendations";

  ["UWeapons"] = "Weapons";
  ["GWendham"] = "Gordon Wendham, Weapons Merchant";
  ["LWarren"] = "Louis Warren, Weapons Merchant";

  ["UHArmor"] = "Heavy Armor";
  ["TWeldon"] = "Timothy Weldon 《重甲商》";
  ["WElling"] = "Walter Ellingson 《重甲商》";

  ["ULArmor"] = "Light Armor";
  ["LNewcomb"] = "Lauren Newcomb 《轻甲商》";
  ["DBartlett"] = "Daniel Bartlett 《商人》";

  ["AMaulray"] = "Anya Maulray 《兽栏管理员》";
  ["INorman"] = "Innkeeper Norman";

  ["MReagents"] = "Mordan's Reagents";
  ["Mordan"] = "Mordan 《材料商》";

  ["NaznikS"] = "Naznik Sureshave 《理发师》";
  ["ECairn"] = "Edward Cairn, Elder";

  ["GuildCT"] = "Guild Creation/Tabards";
  ["ROBauhaus"] = "Royal Overseer Bauhaus, Undercity  Census";
  ["EReming"] = "Edward Remington 《公会徽章设计师》";
  ["CDrakul"] = "Christopher Drakul 《公会注册员》";
  ["MPleas"] = "Merill Pleasance 《战袍商人》";

  ["UCook"] = "Cooking";
  ["EBurch"] = "Eunice Burch 《烹饪训练师》";
  ["RBurch"] = "Ronald Burch 《烹饪供应商》";
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
  ["MAllie"] = "Martha Alliestar 《草药学训练师》";
  ["KAllie"] = "Katrina Alliestar 《草药学供应商》";

  ["ALuca"] = "Alessandro Luca, Blue Moon Odds and Ends";

  ["UEnchant"] = "Enchantment";
  ["LCrowe"] = "Lavinia Crowe 《附魔训练师》";
  ["TWebb"] = "Thaddeus Webb 《附魔供应商》";

  ["Parq"] = "Parqual Fintallas";

  ["AGant"] = "Andron Gant";

  ["Alchemist"] = "Alchemist";
  ["Algernon"] = "Algernon 《炼金术供应商》";
  ["DMarsh"] = "Doctor Marsh, Apprentice Alchemist";

  ["DMFelben"] = "Doctor Martin Felben, Apprentice Alchemist";
  ["MAFaranell"] = "Master Apothecary Faranell, Royal Apothecary";
  ["MAFaranell&"] = "          Society";
  ["DHHalsey"] = "Doctor Herbert Halsey 《炼金术训练师》";
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

  ["UBowM"] = "Bow Merchant";
  ["AbigS"] = "Abigail Sawyer 《弓箭商人》";

  ["UMining"] = "Mining";
  ["BromK"] = "Brom Killian 《采矿训练师》";
  ["SarahK"] = "Sarah Killan 《采矿供应商》";

  ["UWeapM"] = "Weapons Merchants";
  ["Abald"] = "Archibald 《武器大师》";
  ["GeoffH"] = "Geoffrey Hartwell 《武器商》";
  ["BeniF"] = "Benijah Fenner 《武器商》";
  ["FranE"] = "Francis Eliot 《武器商》";

  ["UBlacks"] = "Blacksmith";
  ["JVBrunt"] = "James Van Brunt 《锻造训练师》";
  ["SVBrunt"] = "Samuel Van Brunt 《锻造供应商》";
  ["MTrem"] = "Mirelle Tremayne 《重甲商》";

  ["UGunsm"] = "Gunsmith";
  ["NAtwood"] = "Nicholas Atwood 《枪械商》";

  ["HAtwood"] = "Helena Atwood";

  ["SHouser"] = "Sergeant Houser";
  ["SRutger"] = "Sergeant Rutger";

  ["FLanke"] = "Father Lankester 《牧师训练师》";
  ["FLaza"] = "Father Lazarus 《牧师训练师》";
  ["UAelth"] = "Aelthalyste 《牧师训练师》";
  ["BFowl"] = "Baltus Fowler 《战士训练师》";
  ["ACurt"] = "Angela Curthas 《战士训练师》";
  ["ChristW"] = "Christopher Walker 《战士训练师》";

  --Gren
  ["MagQuart"] = "The Magic Quarter";

  ["UStaff"] = "Staff Merchant";
  ["SUpton"] = "Sydney Upton 《法杖商》";
  ["ZaneB"] = "Zane Bradford 《魔杖商人》";

  ["UTailor"] = "Tailor";
  ["RalsF"] = "Ralston Farnsley 《部落布匹军需官》"; 
  ["SVCroy"] = "Sheldon Von Croy 《布甲商》";
  ["Josef"] = "Josef Gregorian 《裁缝训练师》";
  ["Millie"] = "Millie Gregorian 《裁缝供应商》";
  ["LuciC"] = "Lucille Castleton 《长袍商》";

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
  ["LMort"] = "Lexington Mortaim 《传送门训练师》";
  ["BIces"] = "Bethor Iceshard";

  ["RKerw"] = "Richard Kerwin 《术士训练师》";

  ["AHart"] = "Anastasia Hartwell 《法师训练师》";

  ["LoLevel"] = "Lower Level";
  ["LPick"] = "Luther Pickman 《术士训练师》";
  ["KaalS"] = "Kaal Soulreaper 《术士训练师》";
  ["KaelyH"] = "Kaelystia Hatebringer 《法师训练师》";
  ["PiercS"] = "Pierce Shackleton 《法师训练师》";
  ["MartS"] = "Martha Strain";
  ["GodrF"] = "Godrick Farsan";

  ["ArmaC"] = "Armand Cromwell 《钓鱼训练师》";
  ["LizbC"] = "Lizbeth Cromwell 《钓鱼供应商》";

  --Orng
  ["RogQuart"] = "The Rogues' Quarter";

  ["UDag"] = "Daggers";
  ["CSeat"] = "Charles Seaton 《铸剑商》";
  ["NStee"] = "Nathaniel Steenwick 《投掷武器商人》";

  ["UPois"] = "Poison";
  ["EGrav"] = "Ezekiel Graves 《毒药商》";

  ["MEdra"] = "Mary Edras 《急救训练师》";

  ["ULeat"] = "Leather Work";
  ["ArthM"] = "Arthur Moore 《制皮训练师》";
  ["JoseM"] = "Joseph Moore 《制皮供应商》";
  ["GillM"] = "Gillian Moore 《皮甲商》";
  ["KillH"] = "Killian Hagey 《剥皮训练师》";

  ["UBag"] = "Bag Vendor";
  ["JonaC"] = "Jonathan Chambers 《背包商人》";

  ["UEngin"] = "Engineering";
  ["FrankL"] = "Franklin Lloyd 《工程学训练师》";
  ["ElizVT"] = "Elizabeth Van Talen 《工程学供应商》";
  ["GrahVT"] = "Graham Van Talen 《初级技师》";
  ["LucF"] = "Lucian Fenner";

  ["EsteG"] = "Estelle Gendry";

  ["CaroW"] = "Carolyn Ward 《潜行者训练师》";
  ["MileD"] = "Miles Dexter 《潜行者训练师》";
  ["GregC"] = "Gregory Charles 《潜行者训练师》";
  ["MennC"] = "Mennet Carkard";

  ["WaltS"] = "Walter Soref 《锁匠》";

  --Red
  ["RoyalQua"] = "The Royal Quarter";

  ["LadWindr"] = "Lady Sylvanas Windrunner, Banshee Queen";
  ["Sharl"] = "Sharlindra";
  ["Varima"] = "Varimathras";
  ["ASunsor"] = "Ambassador Sunsorrow";
  ["CyssaD"] = "Champion Cyssa Dawnrose 《圣骑士训练师》";

  ["GrizHalf"] = "Grizzle Halfmane 《奥特兰克山谷军官》";

  ["RexPix"] = "Rex Pixem 《竞技场管理员》";

  ["SirMalo"] = "Sir Malory Wheeler 《阿拉希盆地军官》";

  ["Lyrlia"] = "Lyrlia Blackshield 《风暴之眼军官》";

  ["KurdB"] = "Kurden Bloodcalw 《战歌峡谷军官》";
  ["SForth"] = "Sara Forthright 《远古海滩军官》";
  ["SForth&"] = "          Battlemaster";
};
end
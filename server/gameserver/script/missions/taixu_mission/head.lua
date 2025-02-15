Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua");
Import("\\script\\lib\\define.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")

--Include("\\script\\class\\clause3.lua");
--Include("\\script\\lib\\itemfunctions.lua")
--Import("\\script\\lib\\val2str.lua");

TAIXU_TASKID_EXP_DRUG_TIME = 3536 -- 记录太虚专用exp加成道具时效
TAIXU_TASKID_EXP_DRUG_TYPE = 3538 -- 记录太虚专用exp加成道具类型

tTxExpItem = {
	{1, "Th竔 H� Th莕 Du Кn", "T蕋 c� thng x2"},
	{2, "Th竔 H� Lc 乶h Кn", "Kinh nghi謒 x2"},
}
tTxExpGDP2Item = {
    [PackItemId(2,1,31268)] = tTxExpItem[1],
    [PackItemId(2,1,31269)] = tTxExpItem[2],
}

g_MaxLevel = 30 ;--关卡最大关数
g_NeedLevel= 70 ;--玩家需要的等级
tbTaiXu = {
	name = "Th竔 H�",
	missionID = 90, --唯一ID，查看配置表
	realMapID = 1010,
	dynamicMap = 1, -- 动态地图
	

--	timerTriggerID = 101,
--	costomerID = 101,
--以下为missionV变量
--	mv1	= 1, --入口NPC的主城ID
	mv2 = 2, --这关消灭的杂兵数（通过本关时，清0）
	mv3 = 3, --这关是否消灭了精英怪（通过本关时，清0）
	mv4 = 4, --区域，1：冰天雪地，2江南 3地狱 4瀚海黄沙
	mv5 = 5, --标记是否已经领了奖励了（通过本关时，清0）
	mv6 = 6, --标记跳关的状态(0没有跳关 1从41关开始 2从61关开始)
--以下为missionS变量	
	ms1 = 1,  --预留 
}
tbTaiXu = gf_CopyInherit(missionHead, tbTaiXu);
tbTaiXu = gf_CopyInherit(missionBase, tbTaiXu);



tEnterPos = {
	{1543,3297},
	{1625,3300},
	{1542,3458},
	{1625,3470},
	}
	
tExitPos = 
{
	[100] = {100, 1379, 2858},
	[200] = {200, 1151, 2850},
	[300] = {300, 1975, 3552},
	}
	
thisFile = "\\script\\missions\\taixu_mission\\mission.lua";


tBossType = 
{
	{["Th竔 H� Nguy謙 Lng Th�"  ] = 1, ["Th竔 H� B祅 Th�"    ] = 2,},--[nStage] ={ ["NPC名字"] =  1, ["NPC名字"] =  2}, 注：1表示精英怪 ,2表示小杂兵
	{["Th竔 H� Vi猲 Nh﹏ Vng"  ] = 1, ["Th竔 H� Vn to"      ] = 2,},
	{["Th竔 H� H� tr緉g"    ] = 1, ["Th竔 H� M穘h h�"      ] = 2,},
	{["Th竔 H� B筩h 猽"    ] = 1, ["Th竔 H� Qu� n"      ] = 2,},
	{["Th竔 H� H筼 V� Ki誱"  ] = 1, ["Th竔 H� Ki誱 S竧"      ] = 2,},
	{["Th竔 H� Th� Y猽"    ] = 1, ["Th竔 H� Th鵦 Nh﹏ hoa"    ] = 2,},
	{["Th竔 H� H醓Y猽 H�"  ] = 1, ["Th竔 H� B筩h Y猽 H�"    ] = 2,},
	{["Th竔 H� Th莕 N�"    ] = 1, ["Th竔 H� C莔 Ti猲 T�"    ] = 2,},
	{["Th竔 H� Tr� Vng"    ] = 1, ["Th竔 H� Tuy誸 Qu竔"      ] = 2,},
	{["Th竔 H璗r� Йng"    ] = 1, ["Th竔 H� Th秓 Kh蕌"      ] = 2,},
	{["Th竔 H� Du H錸"    ] = 1, ["Th竔 H� Lam Ti觰 產o qu�"  ] = 2,},
	{["Th竔 H� Oan H錸"    ] = 1, ["Th竔 H� Ti觰 H錸g xoa qu�"  ] = 2,},
	{["Th竔 H� L穘h Hng Ng璶g"  ] = 1, ["Th竔 H� Lam Phi tr秓 qu�"  ] = 2,},
	{["Th竔 H� Huy襫 V� Ki誱"] = 1, ["Th竔 H� Ki誱 tng"] = 2,},
	{["Th竔 H� Nguy Ch蕁 Thi猲"  ] = 1, ["Th竔 H� S琻 T芻 u M鬰"  ] = 2,},
	{["Th竔 H� T╪g 竎"    ] = 1, ["Th竔 H� M蓇 D� Xoa"    ] = 2,},
	{["Th竔 H� Ki誱 Ma"    ] = 1, ["Th竔 H� Ki誱 H錸"      ] = 2,},
	{["Th竔 H� L璾 Quang"    ] = 1, ["Th竔 H� H醓 K� L﹏"    ] = 2,},
	{["Th竔 H� H醓Ph鬾g ho祅g"  ] = 1, ["Th竔 H� Ph鬾g ho祅g"      ] = 2,},
	{["Th竔 H� Phong Nh蕋 Ph祄"  ] = 1, ["Th竔 H� Ki誱 ti猲 T�"    ] = 2,},
	{["Th竔 H� L﹎ Xung"    ] = 1, ["Th竔 H� Ki誱 Cu錸g"      ] = 2,},
	{["Th竔 H� Ng璾 u Qu竔"    ] = 1, ["Th竔 H� B� T﹜ T筺g"      ] = 2,},
	{["Th竔 H� Hoa Th竛h"    ] = 1, ["Th竔 H� Cao Ph� So竔"    ] = 2,},
	{["Th竔 H� T� Ti猲"    ] = 1, ["Th竔 H� Hoa Si N�"    ] = 2,},
	{["Th竔 H� Kh� m藀"  ] = 1, ["Th竔 H� T鎛g qu秐"      ] = 2,},
	{["Th竔 H� Nguy謙 Th�-Cng"  ] = 1, ["Th竔 H� C� Th�-Cng"    ] = 2,},
	{["Th竔 H� H莡 Vng-Cng"  ] = 1, ["Th竔 H� C� Vi猲-Cng"      ] = 2,},
	{["Th竔 H� B筩h H�-Cng"    ] = 1, ["Th竔 H� M穘h h�-Cng"      ] = 2,},
	{["Th竔 H� B筩h 猽-Cng"    ] = 1, ["Th竔 H� H綾 Nha-Cng"      ] = 2,},
	{["Th竔 H� H筼 Ki誱-Cng"  ] = 1, ["Th竔 H� Ki誱 S竧-Cng"      ] = 2,},
	{["Th竔 H� Th� Y猽-Cng"    ] = 1, ["Th竔 H� Th鵦 Hoa-Cng"    ] = 2,},
	{["Th竔 H� H醓 H�-Cng"  ] = 1, ["Th竔 H� B筩h H�-Cng"    ] = 2,},
	{["Th竔 H� Th莕 N�-Cng"    ] = 1, ["Th竔 H� C莔 Ti猲-Cng"    ] = 2,},
	{["Th竔 H� Tr� Vng-Cng"    ] = 1, ["Th竔 H� Tuy誸 Qu竔-Cng"      ] = 2,},
	{["Th竔 H� Tr� Йng-Cng"    ] = 1, ["Th竔 H� Th秓 Kh蕌-Cng"      ] = 2,},
	{["Th竔 H� Du H錸-Cng"    ] = 1, ["Th竔 H� Lam o-Cng"  ] = 2,},
	{["Th竔 H� Oan H錸-Cng"    ] = 1, ["Th竔 H� H錸g Xoa-Cng"  ] = 2,},
	{["Th竔 H� L穘h Hng-Cng"  ] = 1, ["Th竔 H� Lam Tr秓-Cng"  ] = 2,},
	{["Th竔 H� 乷 Ki誱-Cng"] = 1, ["Th竔 H� Ki誱 Tng-Cng"] = 2,},
	{["Th竔 H� Ch蕁 Thi猲-Cng"  ] = 1, ["Th竔 H� T芻 L躰h-Cng"  ] = 2,},
	{["Th竔 H� 竎 T╪g-Cng"    ] = 1, ["Th竔 H� M蓇 D� Xoa-Cng"    ] = 2,},
	{["Th竔 H� Ki誱 Ma-Cng"    ] = 1, ["Th竔 H� Ki誱 H錸-Cng"      ] = 2,},
	{["Th竔 H� L璾 Quang-Cng"    ] = 1, ["Th竔 H� H醓 K� L﹏-Cng"    ] = 2,},
	{["Th竔 H� H醓 Ph鬾g-Cng"  ] = 1, ["Th竔 H� Ph鬾g Ho祅g-Cng"      ] = 2,},
	{["Th竔 H� Nh蕋 Ph祄-Cng"  ] = 1, ["Th竔 H� Ki誱 Ti猲-Cng"    ] = 2,},
	{["Th竔 H� L﹎ Xung-Cng"    ] = 1, ["Th竔 H� Ki誱 Cu錸g-Cng"      ] = 2,},
	{["Th竔 H� Ng璾 Qu竔-Cng"    ] = 1, ["Th竔 H� Mao Ng璾-Cng"      ] = 2,},
	{["Th竔 H� Hoa Th竛h-Cng"    ] = 1, ["Th竔 H� Ph� So竔-Cng"    ] = 2,},
	{["Th竔 H� T� Ti猲-Cng"    ] = 1, ["Th竔 H� Hoa N�-Cng"    ] = 2,},
	{["Th竔 H� C� H莡-Cng"  ] = 1, ["Th竔 H� T鎛g Qu秐-Cng"      ] = 2,},
	{["Th竔 H� Nguy謙 Th�-Tinh"  ] = 1, ["Th竔 H� C� Th�-Tinh"    ] = 2,},
	{["Th竔 H� H莡 Vng-Tinh"  ] = 1, ["Th竔 H� C� Vi猲-Tinh"      ] = 2,},
	{["Th竔 H� B筩h H�-Tinh"    ] = 1, ["Th竔 H� M穘h h�-Tinh"      ] = 2,},
	{["Th竔 H� B筩h 猽-Tinh"    ] = 1, ["Th竔 H� H綾 Nha-Tinh"      ] = 2,},
	{["Th竔 H� H筼 Ki誱-Tinh"  ] = 1, ["Th竔 H� Ki誱 S竧-Tinh"      ] = 2,},
	{["Th竔 H� Th� Y猽-Tinh"    ] = 1, ["Th竔 H� Th鵦 Hoa-Tinh"    ] = 2,},
	{["Th竔 H� H醓 H�-Tinh"  ] = 1, ["Th竔 H� B筩h H�-Tinh"    ] = 2,},
	{["Th竔 H� Th莕 N�-Tinh"    ] = 1, ["Th竔 H� C莔 Ti猲-Tinh"    ] = 2,},
	{["Th竔 H� Tr� Vng-Tinh"    ] = 1, ["Th竔 H� Tuy誸 Qu竔-Tinh"      ] = 2,},
	{["Th竔 H� Tr� Йng-Tinh"    ] = 1, ["Th竔 H� Th秓 Kh蕌-Tinh"      ] = 2,},
	{["Th竔 H� Du H錸-Tinh"    ] = 1, ["Th竔 H� Lam o-Tinh"  ] = 2,},
	{["Th竔 H� Oan H錸-Tinh"    ] = 1, ["Th竔 H� H錸g Xoa-Tinh"  ] = 2,},
	{["Th竔 H� L穘h Hng-Tinh"  ] = 1, ["Th竔 H� Lam Tr秓-Tinh"  ] = 2,},
	{["Th竔 H� 乷 Ki誱-Tinh"] = 1, ["Th竔 H� Ki誱 Tng-Tinh"] = 2,},
	{["Th竔 H� Ch蕁 Thi猲-Tinh"  ] = 1, ["Th竔 H� T芻 L躰h-Tinh"  ] = 2,},
	{["Th竔 H� 竎 T╪g-Tinh"    ] = 1, ["Th竔 H� M蓇 D� Xoa-Tinh"    ] = 2,},
	{["Th竔 H� Ki誱 Ma-Tinh"    ] = 1, ["Th竔 H� Ki誱 H錸-Tinh"      ] = 2,},
	{["Th竔 H� L璾 Quang-Tinh"    ] = 1, ["Th竔 H� H醓 K� L﹏-Tinh"    ] = 2,},
	{["Th竔 H� H醓 Ph鬾g-Tinh"  ] = 1, ["Th竔 H� Ph鬾g Ho祅g-Tinh"      ] = 2,},
	{["Th竔 H� Nh蕋 Ph祄-Tinh"  ] = 1, ["Th竔 H� Ki誱 Ti猲-Tinh"    ] = 2,},
	{["Th竔 H� L﹎ Xung-Tinh"    ] = 1, ["Th竔 H� Ki誱 Cu錸g-Tinh"      ] = 2,},
	{["Th竔 H� Ng璾 Qu竔-Tinh"    ] = 1, ["Th竔 H� Mao Ng璾-Tinh"      ] = 2,},
	{["Th竔 H� Hoa Th竛h-Tinh"    ] = 1, ["Th竔 H� Ph� So竔-Tinh"    ] = 2,},
	{["Th竔 H� T� Ti猲-Tinh"    ] = 1, ["Th竔 H� Hoa N�-Tinh"    ] = 2,},
	{["Th竔 H� C� H莡-Tinh"  ] = 1, ["Th竔 H� T鎛g Qu秐-Tinh"      ] = 2,},
	{["Th竔 H� Nguy謙 Th�-C鵦"  ] = 1, ["Th竔 H� C� Th�-C鵦"    ] = 2,},
	{["Th竔 H� H莡 Vng-C鵦"  ] = 1, ["Th竔 H� C� Vi猲-C鵦"      ] = 2,},
	{["Th竔 H� B筩h H�-C鵦"    ] = 1, ["Th竔 H� M穘h h�-C鵦"      ] = 2,},
	{["Th竔 H� B筩h 猽-C鵦"    ] = 1, ["Th竔 H� H綾 Nha-C鵦"      ] = 2,},
	{["Th竔 H� H筼 Ki誱-C鵦"  ] = 1, ["Th竔 H� Ki誱 S竧-C鵦"      ] = 2,},
	{["Th竔 H� Th� Y猽-C鵦"    ] = 1, ["Th竔 H� Th鵦 Hoa-C鵦"    ] = 2,},
	{["Th竔 H� H醓 H�-C鵦"  ] = 1, ["Th竔 H� B筩h H�-C鵦"    ] = 2,},
	{["Th竔 H� Th莕 N�-C鵦"    ] = 1, ["Th竔 H� C莔 Ti猲-C鵦"    ] = 2,},
	{["Th竔 H� Tr� Vng-C鵦"    ] = 1, ["Th竔 H� Tuy誸 Qu竔-C鵦"      ] = 2,},
	{["Th竔 H� Tr� Йng-C鵦"    ] = 1, ["Th竔 H� Th秓 Kh蕌-C鵦"      ] = 2,},
	{["Th竔 H� Du H錸-C鵦"    ] = 1, ["Th竔 H� Lam o-C鵦"  ] = 2,},
	{["Th竔 H� Oan H錸-C鵦"    ] = 1, ["Th竔 H� H錸g Xoa-C鵦"  ] = 2,},
	{["Th竔 H� L穘h Hng-C鵦"  ] = 1, ["Th竔 H� Lam Tr秓-C鵦"  ] = 2,},
	{["Th竔 H� 乷 Ki誱-C鵦"] = 1, ["Th竔 H� Ki誱 Tng-C鵦"] = 2,},
	{["Th竔 H� Ch蕁 Thi猲-C鵦"  ] = 1, ["Th竔 H� T芻 L躰h-C鵦"  ] = 2,},
	{["Th竔 H� 竎 T╪g-C鵦"    ] = 1, ["Th竔 H� M蓇 D� Xoa-C鵦"    ] = 2,},
	{["Th竔 H� Ki誱 Ma-C鵦"    ] = 1, ["Th竔 H� Ki誱 H錸-C鵦"      ] = 2,},
	{["Th竔 H� L璾 Quang-C鵦"    ] = 1, ["Th竔 H� H醓 K� L﹏-C鵦"    ] = 2,},
	{["Th竔 H� H醓 Ph鬾g-C鵦"  ] = 1, ["Th竔 H� Ph鬾g Ho祅g-C鵦"      ] = 2,},
	{["Th竔 H� Nh蕋 Ph祄-C鵦"  ] = 1, ["Th竔 H� Ki誱 Ti猲-C鵦"    ] = 2,},
	{["Th竔 H� L﹎ Xung-C鵦"    ] = 1, ["Th竔 H� Ki誱 Cu錸g-C鵦"      ] = 2,},
	{["Th竔 H� Ng璾 Qu竔-C鵦"    ] = 1, ["Th竔 H� Mao Ng璾-C鵦"      ] = 2,},
	{["Th竔 H� Hoa Th竛h-C鵦"    ] = 1, ["Th竔 H� Ph� So竔-C鵦"    ] = 2,},
	{["Th竔 H� T� Ti猲-C鵦"    ] = 1, ["Th竔 H� Hoa N�-C鵦"    ] = 2,},
	{["Th竔 H� Thanh Thanh"  ] = 1, ["Th竔 H� Th﹏ Nhi t�"      ] = 2,},
	}
	
tNPCTemplate = {
	{{"Th竔 H� B祅 Th�"      ,"Th竔 H� B祅 Th�"    ,80},{"Th竔 H� Nguy謙 Lng Th�"  ,"Th竔 H� Nguy謙 Lng Th�"  ,1},}, --[nStage] ={ {"小杂兵模版","name"，个数},{"精英模版","name",个数},},
	{{"Th竔 H� Vn to"        ,"Th竔 H� Vn to"      ,80},{"Th竔 H� Vi猲 Nh﹏ Vng"  ,"Th竔 H� Vi猲 Nh﹏ Vng"  ,1},},-- 宝箱怪模版是否每一关都一样并且以后一直一样？
	{{"Th竔 H� M穘h h�"        ,"Th竔 H� M穘h h�"      ,80},{"Th竔 H� H� tr緉g"    ,"Th竔 H� H� tr緉g"    ,1},},
	{{"Th竔 H� Qu� n"        ,"Th竔 H� Qu� n"      ,80},{"Th竔 H� B筩h 猽"    ,"Th竔 H� B筩h 猽"    ,1},},
	{{"Th竔 H� Ki誱 S竧"        ,"Th竔 H� Ki誱 S竧"      ,80},{"Th竔 H� H筼 V� Ki誱"  ,"Th竔 H� H筼 V� Ki誱"  ,1},},
	{{"Th竔 H� Th鵦 Nh﹏ hoa"      ,"Th竔 H� Th鵦 Nh﹏ hoa"    ,80},{"Th竔 H� Th� Y猽"    ,"Th竔 H� Th� Y猽"    ,1},},
	{{"Th竔 H� B筩h Y猽 H�"      ,"Th竔 H� B筩h Y猽 H�"    ,80},{"Th竔 H� H醓Y猽 H�"  ,"Th竔 H� H醓Y猽 H�"  ,1},},
	{{"Th竔 H� C莔 Ti猲 T�"      ,"Th竔 H� C莔 Ti猲 T�"    ,80},{"Th竔 H� Th莕 N�"    ,"Th竔 H� Th莕 N�"    ,1},},
	{{"Th竔 H� Tuy誸 Qu竔"        ,"Th竔 H� Tuy誸 Qu竔"      ,80},{"Th竔 H� Tr� Vng"    ,"Th竔 H� Tr� Vng"    ,1},},
	{{"Th竔 H� Th秓 Kh蕌"        ,"Th竔 H� Th秓 Kh蕌"      ,80},{"Th竔 H璗r� Йng"    ,"Th竔 H璗r� Йng"    ,1},},
	{{"Th竔 H� Lam Ti觰 產o qu�"    ,"Th竔 H� Lam Ti觰 產o qu�"  ,80},{"Th竔 H� Du H錸"    ,"Th竔 H� Du H錸"    ,1},},
	{{"Th竔 H� Ti觰 H錸g xoa qu�"    ,"Th竔 H� Ti觰 H錸g xoa qu�"  ,80},{"Th竔 H� Oan H錸"    ,"Th竔 H� Oan H錸"    ,1},},
	{{"Th竔 H� Lam Phi tr秓 qu�"    ,"Th竔 H� Lam Phi tr秓 qu�"  ,80},{"Th竔 H� L穘h Hng Ng璶g"  ,"Th竔 H� L穘h Hng Ng璶g"  ,1},},
	{{"Th竔 H� Ki誱 tng"  ,"Th竔 H� Ki誱 tng",80},{"Th竔 H� Huy襫 V� Ki誱","Th竔 H� Huy襫 V� Ki誱",1},},
	{{"Th竔 H� S琻 T芻 u M鬰"    ,"Th竔 H� S琻 T芻 u M鬰"  ,80},{"Th竔 H� Nguy Ch蕁 Thi猲"  ,"Th竔 H� Nguy Ch蕁 Thi猲"  ,1},},
	{{"Th竔 H� M蓇 D� Xoa"      ,"Th竔 H� M蓇 D� Xoa"    ,80},{"Th竔 H� T╪g 竎"    ,"Th竔 H� T╪g 竎"    ,1},},
	{{"Th竔 H� Ki誱 H錸"        ,"Th竔 H� Ki誱 H錸"      ,80},{"Th竔 H� Ki誱 Ma"    ,"Th竔 H� Ki誱 Ma"    ,1},},
	{{"Th竔 H� H醓 K� L﹏"      ,"Th竔 H� H醓 K� L﹏"    ,80},{"Th竔 H� L璾 Quang"    ,"Th竔 H� L璾 Quang"    ,1},},
	{{"Th竔 H� Ph鬾g ho祅g"        ,"Th竔 H� Ph鬾g ho祅g"      ,80},{"Th竔 H� H醓Ph鬾g ho祅g"  ,"Th竔 H� H醓Ph鬾g ho祅g"  ,1},},
	{{"Th竔 H� Ki誱 ti猲 T�"      ,"Th竔 H� Ki誱 ti猲 T�"    ,80},{"Th竔 H� Phong Nh蕋 Ph祄"  ,"Th竔 H� Phong Nh蕋 Ph祄"  ,1},},
	{{"Th竔 H� Ki誱 Cu錸g"        ,"Th竔 H� Ki誱 Cu錸g"      ,80},{"Th竔 H� L﹎ Xung"    ,"Th竔 H� L﹎ Xung"    ,1},},
	{{"Th竔 H� B� T﹜ T筺g"        ,"Th竔 H� B� T﹜ T筺g"      ,80},{"Th竔 H� Ng璾 u Qu竔"    ,"Th竔 H� Ng璾 u Qu竔"    ,1},},
	{{"Th竔 H� Cao Ph� So竔"      ,"Th竔 H� Cao Ph� So竔"    ,80},{"Th竔 H� Hoa Th竛h"    ,"Th竔 H� Hoa Th竛h"    ,1},},
	{{"Th竔 H� Hoa Si N�"      ,"Th竔 H� Hoa Si N�"    ,80},{"Th竔 H� T� Ti猲"    ,"Th竔 H� T� Ti猲"    ,1},},
	{{"Th竔 H� T鎛g qu秐"        ,"Th竔 H� T鎛g qu秐"      ,80},{"Th竔 H� Kh� m藀"  ,"Th竔 H� Kh� m藀"  ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� B祅 Th�"      ,"Th竔 H� C� Th�-Cng"    ,80},{"B秐 n﹏g c蕄-Th竔 H� Nguy謙 Lng Th�"  ,"Th竔 H� Nguy謙 Th�-Cng"  ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� Vn to"        ,"Th竔 H� C� Vi猲-Cng"      ,80},{"B秐 n﹏g c蕄-Th竔 H� Vi猲 Nh﹏ Vng"  ,"Th竔 H� H莡 Vng-Cng"  ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� M穘h h�"        ,"Th竔 H� M穘h h�-Cng"      ,80},{"B秐 n﹏g c蕄-Th竔 H� H� tr緉g"    ,"Th竔 H� B筩h H�-Cng"    ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� Qu� n"        ,"Th竔 H� H綾 Nha-Cng"      ,80},{"B秐 n﹏g c蕄-Th竔 H� B筩h 猽"    ,"Th竔 H� B筩h 猽-Cng"    ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� Ki誱 S竧"        ,"Th竔 H� Ki誱 S竧-Cng"      ,80},{"B秐 n﹏g c蕄-Th竔 H� H筼 V� Ki誱"  ,"Th竔 H� H筼 Ki誱-Cng"  ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� Th鵦 Nh﹏ hoa"      ,"Th竔 H� Th鵦 Hoa-Cng"    ,80},{"B秐 n﹏g c蕄-Th竔 H� Th� Y猽"    ,"Th竔 H� Th� Y猽-Cng"    ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� B筩h Y猽 H�"      ,"Th竔 H� B筩h H�-Cng"    ,80},{"B秐 n﹏g c蕄-Th竔 H� H醓Y猽 H�"  ,"Th竔 H� H醓 H�-Cng"  ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� C莔 Ti猲 T�"      ,"Th竔 H� C莔 Ti猲-Cng"    ,80},{"B秐 n﹏g c蕄-Th竔 H� Th莕 N�"    ,"Th竔 H� Th莕 N�-Cng"    ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� Tuy誸 Qu竔"        ,"Th竔 H� Tuy誸 Qu竔-Cng"      ,80},{"B秐 n﹏g c蕄-Th竔 H� Tr� Vng"    ,"Th竔 H� Tr� Vng-Cng"    ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� Th秓 Kh蕌"        ,"Th竔 H� Th秓 Kh蕌-Cng"      ,80},{"B秐 n﹏g c蕄-Th竔 H璗r� Йng"    ,"Th竔 H� Tr� Йng-Cng"    ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� Lam Ti觰 產o qu�"    ,"Th竔 H� Lam o-Cng"  ,80},{"B秐 n﹏g c蕄-Th竔 H� Du H錸"    ,"Th竔 H� Du H錸-Cng"    ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� Ti觰 H錸g xoa qu�"    ,"Th竔 H� H錸g Xoa-Cng"  ,80},{"B秐 n﹏g c蕄-Th竔 H� Oan H錸"    ,"Th竔 H� Oan H錸-Cng"    ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� Lam Phi tr秓 qu�"    ,"Th竔 H� Lam Tr秓-Cng"  ,80},{"B秐 n﹏g c蕄-Th竔 H� L穘h Hng Ng璶g"  ,"Th竔 H� L穘h Hng-Cng"  ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� Ki誱 tng"  ,"Th竔 H� Ki誱 Tng-Cng",80},{"B秐 n﹏g c蕄-Th竔 H� Huy襫 V� Ki誱","Th竔 H� 乷 Ki誱-Cng",1},},
	{{"B秐 n﹏g c蕄-Th竔 H� S琻 T芻 u M鬰"    ,"Th竔 H� T芻 L躰h-Cng"  ,80},{"B秐 n﹏g c蕄-Th竔 H� Nguy Ch蕁 Thi猲"  ,"Th竔 H� Ch蕁 Thi猲-Cng"  ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� M蓇 D� Xoa"      ,"Th竔 H� M蓇 D� Xoa-Cng"    ,80},{"B秐 n﹏g c蕄-Th竔 H� T╪g 竎"    ,"Th竔 H� 竎 T╪g-Cng"    ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� Ki誱 H錸"        ,"Th竔 H� Ki誱 H錸-Cng"      ,80},{"B秐 n﹏g c蕄-Th竔 H� Ki誱 Ma"    ,"Th竔 H� Ki誱 Ma-Cng"    ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� H醓 K� L﹏"      ,"Th竔 H� H醓 K� L﹏-Cng"    ,80},{"B秐 n﹏g c蕄-Th竔 H� L璾 Quang"    ,"Th竔 H� L璾 Quang-Cng"    ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� Ph鬾g ho祅g"        ,"Th竔 H� Ph鬾g Ho祅g-Cng"      ,80},{"B秐 n﹏g c蕄-Th竔 H� H醓Ph鬾g ho祅g"  ,"Th竔 H� H醓 Ph鬾g-Cng"  ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� Ki誱 ti猲 T�"      ,"Th竔 H� Ki誱 Ti猲-Cng"    ,80},{"B秐 n﹏g c蕄-Th竔 H� Phong Nh蕋 Ph祄"  ,"Th竔 H� Nh蕋 Ph祄-Cng"  ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� Ki誱 Cu錸g"        ,"Th竔 H� Ki誱 Cu錸g-Cng"      ,80},{"B秐 n﹏g c蕄-Th竔 H� L﹎ Xung"    ,"Th竔 H� L﹎ Xung-Cng"    ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� B� T﹜ T筺g"        ,"Th竔 H� Mao Ng璾-Cng"      ,80},{"B秐 n﹏g c蕄-Th竔 H� Ng璾 u Qu竔"    ,"Th竔 H� Ng璾 Qu竔-Cng"    ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� Cao Ph� So竔"      ,"Th竔 H� Ph� So竔-Cng"    ,80},{"B秐 n﹏g c蕄-Th竔 H� Hoa Th竛h"    ,"Th竔 H� Hoa Th竛h-Cng"    ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� Hoa Si N�"      ,"Th竔 H� Hoa N�-Cng"    ,80},{"B秐 n﹏g c蕄-Th竔 H� T� Ti猲"    ,"Th竔 H� T� Ti猲-Cng"    ,1},},
	{{"B秐 n﹏g c蕄-Th竔 H� T鎛g qu秐"        ,"Th竔 H� T鎛g Qu秐-Cng"      ,80},{"B秐 n﹏g c蕄-Th竔 H� Kh� m藀"  ,"Th竔 H� C� H莡-Cng"  ,1},},
	{{"B秐 t╪g cng-Th竔 H� B祅 Th�"      ,"Th竔 H� C� Th�-Tinh"    ,80},{"B秐 t╪g cng-Th竔 H� Nguy謙 Lng Th�"  ,"Th竔 H� Nguy謙 Th�-Tinh"  ,1},},
	{{"B秐 t╪g cng-Th竔 H� Vn to"        ,"Th竔 H� C� Vi猲-Tinh"      ,80},{"B秐 t╪g cng-Th竔 H� Vi猲 Nh﹏ Vng"  ,"Th竔 H� H莡 Vng-Tinh"  ,1},},
	{{"B秐 t╪g cng-Th竔 H� M穘h h�"        ,"Th竔 H� M穘h h�-Tinh"      ,80},{"B秐 t╪g cng-Th竔 H� H� tr緉g"    ,"Th竔 H� B筩h H�-Tinh"    ,1},},
	{{"B秐 t╪g cng-Th竔 H� Qu� n"        ,"Th竔 H� H綾 Nha-Tinh"      ,80},{"B秐 t╪g cng-Th竔 H� B筩h 猽"    ,"Th竔 H� B筩h 猽-Tinh"    ,1},},
	{{"B秐 t╪g cng-Th竔 H� Ki誱 S竧"        ,"Th竔 H� Ki誱 S竧-Tinh"      ,80},{"B秐 t╪g cng-Th竔 H� H筼 V� Ki誱"  ,"Th竔 H� H筼 Ki誱-Tinh"  ,1},},
	{{"B秐 t╪g cng-Th竔 H� Th鵦 Nh﹏ hoa"      ,"Th竔 H� Th鵦 Hoa-Tinh"    ,80},{"B秐 t╪g cng-Th竔 H� Th� Y猽"    ,"Th竔 H� Th� Y猽-Tinh"    ,1},},
	{{"B秐 t╪g cng-Th竔 H� B筩h Y猽 H�"      ,"Th竔 H� B筩h H�-Tinh"    ,80},{"B秐 t╪g cng-Th竔 H� H醓Y猽 H�"  ,"Th竔 H� H醓 H�-Tinh"  ,1},},
	{{"B秐 t╪g cng-Th竔 H� C莔 Ti猲 T�"      ,"Th竔 H� C莔 Ti猲-Tinh"    ,80},{"B秐 t╪g cng-Th竔 H� Th莕 N�"    ,"Th竔 H� Th莕 N�-Tinh"    ,1},},
	{{"B秐 t╪g cng-Th竔 H� Tuy誸 Qu竔"        ,"Th竔 H� Tuy誸 Qu竔-Tinh"      ,80},{"B秐 t╪g cng-Th竔 H� Tr� Vng"    ,"Th竔 H� Tr� Vng-Tinh"    ,1},},
	{{"B秐 t╪g cng-Th竔 H� Th秓 Kh蕌"        ,"Th竔 H� Th秓 Kh蕌-Tinh"      ,80},{"B秐 t╪g cng-Th竔 H璗r� Йng"    ,"Th竔 H� Tr� Йng-Tinh"    ,1},},
	{{"B秐 t╪g cng-Th竔 H� Lam Ti觰 產o qu�"    ,"Th竔 H� Lam o-Tinh"  ,80},{"B秐 t╪g cng-Th竔 H� Du H錸"    ,"Th竔 H� Du H錸-Tinh"    ,1},},
	{{"B秐 t╪g cng-Th竔 H� Ti觰 H錸g xoa qu�"    ,"Th竔 H� H錸g Xoa-Tinh"  ,80},{"B秐 t╪g cng-Th竔 H� Oan H錸"    ,"Th竔 H� Oan H錸-Tinh"    ,1},},
	{{"B秐 t╪g cng-Th竔 H� Lam Phi tr秓 qu�"    ,"Th竔 H� Lam Tr秓-Tinh"  ,80},{"B秐 t╪g cng-Th竔 H� L穘h Hng Ng璶g"  ,"Th竔 H� L穘h Hng-Tinh"  ,1},},
	{{"B秐 t╪g cng-Th竔 H� Ki誱 tng"  ,"Th竔 H� Ki誱 Tng-Tinh",80},{"B秐 t╪g cng-Th竔 H璈uy襫 V� Ki誱","Th竔 H� 乷 Ki誱-Tinh",1},},
	{{"B秐 t╪g cng-Th竔 H� S琻 T芻 u M鬰"    ,"Th竔 H� T芻 L躰h-Tinh"  ,80},{"B秐 t╪g cng-Th竔 H� Nguy Ch蕁 Thi猲"  ,"Th竔 H� Ch蕁 Thi猲-Tinh"  ,1},},
	{{"B秐 t╪g cng-Th竔 H� M蓇 D� Xoa"      ,"Th竔 H� M蓇 D� Xoa-Tinh"    ,80},{"B秐 t╪g cng-Th竔 H� T╪g 竎"    ,"Th竔 H� 竎 T╪g-Tinh"    ,1},},
	{{"B秐 t╪g cng-Th竔 H� Ki誱 H錸"        ,"Th竔 H� Ki誱 H錸-Tinh"      ,80},{"B秐 t╪g cng-Th竔 H� Ki誱 Ma"    ,"Th竔 H� Ki誱 Ma-Tinh"    ,1},},
	{{"B秐 t╪g cng-Th竔 H� H醓 K� L﹏"      ,"Th竔 H� H醓 K� L﹏-Tinh"    ,80},{"B秐 t╪g cng-Th竔 H� L璾 Quang"    ,"Th竔 H� L璾 Quang-Tinh"    ,1},},
	{{"B秐 t╪g cng-Th竔 H� Ph鬾g ho祅g"        ,"Th竔 H� Ph鬾g Ho祅g-Tinh"      ,80},{"B秐 t╪g cng-Th竔 H� H醓Ph鬾g ho祅g"  ,"Th竔 H� H醓 Ph鬾g-Tinh"  ,1},},
	{{"B秐 t╪g cng-Th竔 H� Ki誱 ti猲 T�"      ,"Th竔 H� Ki誱 Ti猲-Tinh"    ,80},{"B秐 t╪g cng-Th竔 H� Phong Nh蕋 Ph祄"  ,"Th竔 H� Nh蕋 Ph祄-Tinh"  ,1},},
	{{"B秐 t╪g cng-Th竔 H� Ki誱 Cu錸g"        ,"Th竔 H� Ki誱 Cu錸g-Tinh"      ,80},{"B秐 t╪g cng-Th竔 H� L﹎ Xung"    ,"Th竔 H� L﹎ Xung-Tinh"    ,1},},
	{{"B秐 t╪g cng-Th竔 H� B� T﹜ T筺g"        ,"Th竔 H� Mao Ng璾-Tinh"      ,80},{"B秐 t╪g cng-Th竔 H� Ng璾 u Qu竔"    ,"Th竔 H� Ng璾 Qu竔-Tinh"    ,1},},
	{{"B秐 t╪g cng-Th竔 H� Cao Ph� So竔"      ,"Th竔 H� Ph� So竔-Tinh"    ,80},{"B秐 t╪g cng-Th竔 H� Hoa Th竛h"    ,"Th竔 H� Hoa Th竛h-Tinh"    ,1},},
	{{"B秐 t╪g cng-Th竔 H� Hoa Si N�"      ,"Th竔 H� Hoa N�-Tinh"    ,80},{"B秐 t╪g cng-Th竔 H� T� Ti猲"    ,"Th竔 H� T� Ti猲-Tinh"    ,1},},
	{{"B秐 t╪g cng-Th竔 H� T鎛g qu秐"        ,"Th竔 H� T鎛g Qu秐-Tinh"      ,80},{"B秐 t╪g cng-Th竔 H� Kh� m藀"  ,"Th竔 H� C� H莡-Tinh"  ,1},},
	{{"B秐 cu鑙-Th竔 H� B祅 Th�"      ,"Th竔 H� C� Th�-C鵦"    ,80},{"B秐 cu鑙-Th竔 H� Nguy謙 Lng Th�"  ,"Th竔 H� Nguy謙 Th�-C鵦"  ,1},},
	{{"B秐 cu鑙-Th竔 H� Vn to"        ,"Th竔 H� C� Vi猲-C鵦"      ,80},{"B秐 cu鑙-Th竔 H� Vi猲 Nh﹏ Vng"  ,"Th竔 H� H莡 Vng-C鵦"  ,1},},
	{{"B秐 cu鑙-Th竔 H� M穘h h�"        ,"Th竔 H� M穘h h�-C鵦"      ,80},{"B秐 cu鑙-Th竔 H� H� tr緉g"    ,"Th竔 H� B筩h H�-C鵦"    ,1},},
	{{"B秐 cu鑙-Th竔 H� Qu� n"        ,"Th竔 H� H綾 Nha-C鵦"      ,80},{"B秐 cu鑙-Th竔 H� B筩h 猽"    ,"Th竔 H� B筩h 猽-C鵦"    ,1},},
	{{"B秐 cu鑙-Th竔 H� Ki誱 S竧"        ,"Th竔 H� Ki誱 S竧-C鵦"      ,80},{"B秐 cu鑙-Th竔 H� H筼 V� Ki誱"  ,"Th竔 H� H筼 Ki誱-C鵦"  ,1},},
	{{"B秐 cu鑙-Th竔 H� Th鵦 Nh﹏ hoa"      ,"Th竔 H� Th鵦 Hoa-C鵦"    ,80},{"B秐 cu鑙-Th竔 H� Th� Y猽"    ,"Th竔 H� Th� Y猽-C鵦"    ,1},},
	{{"B秐 cu鑙-Th竔 H� B筩h Y猽 H�"      ,"Th竔 H� B筩h H�-C鵦"    ,80},{"B秐 cu鑙-Th竔 H� H醓Y猽 H�"  ,"Th竔 H� H醓 H�-C鵦"  ,1},},
	{{"B秐 cu鑙-Th竔 H� C莔 Ti猲 T�"      ,"Th竔 H� C莔 Ti猲-C鵦"    ,80},{"B秐 cu鑙-Th竔 H� Th莕 N�"    ,"Th竔 H� Th莕 N�-C鵦"    ,1},},
	{{"B秐 cu鑙-Th竔 H� Tuy誸 Qu竔"        ,"Th竔 H� Tuy誸 Qu竔-C鵦"      ,80},{"B秐 cu鑙-Th竔 H� Tr� Vng"    ,"Th竔 H� Tr� Vng-C鵦"    ,1},},
	{{"B秐 cu鑙-Th竔 H� Th秓 Kh蕌"        ,"Th竔 H� Th秓 Kh蕌-C鵦"      ,80},{"B秐 cu鑙-Th竔 H璗r� Йng"    ,"Th竔 H� Tr� Йng-C鵦"    ,1},},
	{{"B秐 cu鑙-Th竔 H� Lam Ti觰 產o qu�"    ,"Th竔 H� Lam o-C鵦"  ,80},{"B秐 cu鑙-Th竔 H� Du H錸"    ,"Th竔 H� Du H錸-C鵦"    ,1},},
	{{"B秐 cu鑙-Th竔 H� Ti觰 H錸g xoa qu�"    ,"Th竔 H� H錸g Xoa-C鵦"  ,80},{"B秐 cu鑙-Th竔 H� Oan H錸"    ,"Th竔 H� Oan H錸-C鵦"    ,1},},
	{{"B秐 cu鑙-Th竔 H� Lam Phi tr秓 qu�"    ,"Th竔 H� Lam Tr秓-C鵦"  ,80},{"B秐 cu鑙-Th竔 H� L穘h Hng Ng璶g"  ,"Th竔 H� L穘h Hng-C鵦"  ,1},},
	{{"B秐 cu鑙-Th竔 H� Ki誱 tng"  ,"Th竔 H� Ki誱 Tng-C鵦",80},{"B秐 cu鑙-Th竔 H� Huy襫 V� Ki誱","Th竔 H� 乷 Ki誱-C鵦",1},},
	{{"B秐 cu鑙-Th竔 H� S琻 T芻 u M鬰"    ,"Th竔 H� T芻 L躰h-C鵦"  ,80},{"B秐 cu鑙-Th竔 H� Nguy Ch蕁 Thi猲"  ,"Th竔 H� Ch蕁 Thi猲-C鵦"  ,1},},
	{{"B秐 cu鑙-Th竔 H� M蓇 D� Xoa"      ,"Th竔 H� M蓇 D� Xoa-C鵦"    ,80},{"B秐 cu鑙-Th竔 H� T╪g 竎"    ,"Th竔 H� 竎 T╪g-C鵦"    ,1},},
	{{"B秐 cu鑙-Th竔 H� Ki誱 H錸"        ,"Th竔 H� Ki誱 H錸-C鵦"      ,80},{"B秐 cu鑙-Th竔 H� Ki誱 Ma"    ,"Th竔 H� Ki誱 Ma-C鵦"    ,1},},
	{{"B秐 cu鑙-Th竔 H� H醓 K� L﹏"      ,"Th竔 H� H醓 K� L﹏-C鵦"    ,80},{"B秐 cu鑙-Th竔 H� L璾 Quang"    ,"Th竔 H� L璾 Quang-C鵦"    ,1},},
	{{"B秐 cu鑙-Th竔 H� Ph鬾g ho祅g"        ,"Th竔 H� Ph鬾g Ho祅g-C鵦"      ,80},{"B秐 cu鑙-Th竔 H� H醓Ph鬾g ho祅g"  ,"Th竔 H� H醓 Ph鬾g-C鵦"  ,1},},
	{{"B秐 cu鑙-Th竔 H� Ki誱 ti猲 T�"      ,"Th竔 H� Ki誱 Ti猲-C鵦"    ,80},{"B秐 cu鑙-Th竔 H� Phong Nh蕋 Ph祄"  ,"Th竔 H� Nh蕋 Ph祄-C鵦"  ,1},},
	{{"B秐 cu鑙-Th竔 H� Ki誱 Cu錸g"        ,"Th竔 H� Ki誱 Cu錸g-C鵦"      ,80},{"B秐 cu鑙-Th竔 H� L﹎ Xung"    ,"Th竔 H� L﹎ Xung-C鵦"    ,1},},
	{{"B秐 cu鑙-Th竔 H� B� T﹜ T筺g"        ,"Th竔 H� Mao Ng璾-C鵦"      ,80},{"B秐 cu鑙-Th竔 H� Ng璾 u Qu竔"    ,"Th竔 H� Ng璾 Qu竔-C鵦"    ,1},},
	{{"B秐 cu鑙-Th竔 H� Cao Ph� So竔"      ,"Th竔 H� Ph� So竔-C鵦"    ,80},{"B秐 cu鑙-Th竔 H� Hoa Th竛h"    ,"Th竔 H� Hoa Th竛h-C鵦"    ,1},},
	{{"B秐 cu鑙-Th竔 H� Hoa Si N�"      ,"Th竔 H� Hoa N�-C鵦"    ,80},{"B秐 cu鑙-Th竔 H� T� Ti猲"    ,"Th竔 H� T� Ti猲-C鵦"    ,1},},
	{{"Th竔 H� Th﹏ Nhi t�"        ,"Th竔 H� Th﹏ Nhi t�"      ,80},{"Th竔 H� Thanh Thanh"  ,"Th竔 H� Thanh Thanh"  ,1},},
	}
	
tBoxNpc = {"Rng Qu竔 Th竔 H�","Qu竔 Rng"} -- 模版名字，名字
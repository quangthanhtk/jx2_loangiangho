Include("\\script\\missions\\kuafu_boss\\common_mission_head.lua")


BOSS_SCRIPT = "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\boss.lua"

--入场位置
ENTER_POS = {{{1510,3204},{1477,3041},{1432,2958},}} --随机
-- --默认离场位置
-- EXIT_POS  = {{300,1744,3554},}
--虚拟临时复活点，是个不可到达的点，用于强行进入onPlayerRevive
VIRTUAL_REVIVE_POS = {1594, 3117}

KFB_MS_TYPE = KFB_MISSION_DATA_IDX_DCY2
KFB_MS_TIMER_ID = T_KFB_MISSION_CONFIG[KFB_MS_TYPE][8] --计时器ID

thisFile = T_KFB_MISSION_CONFIG[KFB_MS_TYPE][7]	--thisFile

KFB_PK_FLAG = 0 --PK状态

---------------------------！！！已在公共头kfb_head.lua中定义！！！--------------------------------------
-----------------------------！！！严禁外部Import后进行覆盖！！！----------------------------------------
----大草原1、大草原2、王旗部落这3个副本的这些配置须保持一致
-- MV_MISSION_STATE			= MV_CUSTOM_BEGIN + 1; --0=初始化 1=等待 2=战斗 3=结束
-- MV_BOSS_IDX     			= MV_CUSTOM_BEGIN + 2; --boss npcIdx
------------------------------------------------------------------------------------------------------
MV_HORSE_CAR_IDX1			= MV_CUSTOM_BEGIN + 3;
MV_HORSE_CAR_IDX2			= MV_CUSTOM_BEGIN + 4;
MV_HORSE_CAR_IDX3			= MV_CUSTOM_BEGIN + 5;
MV_HORSE_CAR_IDX4			= MV_CUSTOM_BEGIN + 6;
MV_HORSE_CAR_IDX5			= MV_CUSTOM_BEGIN + 7;
MV_HORSE_CAR_IDX6			= MV_CUSTOM_BEGIN + 8;
MV_HORSE_CAR_IDX7			= MV_CUSTOM_BEGIN + 9;
MV_HORSE_CAR_IDX8			= MV_CUSTOM_BEGIN + 10;
MV_HORSE_CAR_IDX9			= MV_CUSTOM_BEGIN + 11;
MV_HORSE_CAR_IDX10			= MV_CUSTOM_BEGIN + 12;
MV_HORSE_CAR_IDX11			= MV_CUSTOM_BEGIN + 13;
MV_HORSE_CAR_IDX12			= MV_CUSTOM_BEGIN + 14;
MV_HORSE_CAR_IDX13			= MV_CUSTOM_BEGIN + 15;
MV_HORSE_CAR_IDX14			= MV_CUSTOM_BEGIN + 16;
MV_HORSE_CAR_IDX15			= MV_CUSTOM_BEGIN + 17;

--用kfb_head.lua中的通用配置初始化
Mission_Kfb = {
	missionID 	= T_KFB_MISSION_CONFIG[KFB_MS_TYPE][1],
	realMapID 	= T_KFB_MISSION_CONFIG[KFB_MS_TYPE][2],
	dynamicMap 	= T_KFB_MISSION_CONFIG[KFB_MS_TYPE][5],
	name 		= T_KFB_MISSION_CONFIG[KFB_MS_TYPE][6],
}

Mission_Kfb = inherit(missionHead, Mission_Kfb)



T_KFB_BOSS_POS = {
	{1568, 3208},
	{1556, 3145},
	{1512, 3144},
	{1501, 3214},
	{1455, 3200},
	{1459, 3131},
	{1477, 3034},
	{1474, 2962},
	{1493, 2878},
	{1545, 2939},
	{1543, 3051},
	{1420, 2893},
	{1416, 3001},
	{1401, 3120},
	{1397, 3225},
}

T_KFB_NPC_INFO_BOSS = {
	{"Ti猽 Nhi詍 Nguy謙",	"kfboss_xiaoranyue", T_KFB_BOSS_POS, MV_BOSS_IDX, BOSS_SCRIPT},
}

T_KFB_NPC_INFO_HORSE_CAR = {
	{"Xe Ng鵤 T藀 K誸",	"kfboss_mache", {1568, 3208}, MV_HORSE_CAR_IDX1, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
	{"Xe Ng鵤 T藀 K誸",	"kfboss_mache", {1556, 3145}, MV_HORSE_CAR_IDX2, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
	{"Xe Ng鵤 T藀 K誸",	"kfboss_mache", {1512, 3144}, MV_HORSE_CAR_IDX3, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
	{"Xe Ng鵤 T藀 K誸",	"kfboss_mache", {1501, 3214}, MV_HORSE_CAR_IDX4, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
	{"Xe Ng鵤 T藀 K誸",	"kfboss_mache", {1455, 3200}, MV_HORSE_CAR_IDX5, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
	{"Xe Ng鵤 T藀 K誸",	"kfboss_mache", {1459, 3131}, MV_HORSE_CAR_IDX6, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
	{"Xe Ng鵤 T藀 K誸",	"kfboss_mache", {1477, 3034}, MV_HORSE_CAR_IDX7, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
	{"Xe Ng鵤 T藀 K誸",	"kfboss_mache", {1474, 2962}, MV_HORSE_CAR_IDX8, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
	{"Xe Ng鵤 T藀 K誸",	"kfboss_mache", {1493, 2878}, MV_HORSE_CAR_IDX9, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
	{"Xe Ng鵤 T藀 K誸",	"kfboss_mache", {1545, 2939}, MV_HORSE_CAR_IDX10, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
	{"Xe Ng鵤 T藀 K誸",	"kfboss_mache", {1543, 3051}, MV_HORSE_CAR_IDX11, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
	{"Xe Ng鵤 T藀 K誸",	"kfboss_mache", {1420, 2893}, MV_HORSE_CAR_IDX12, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
	{"Xe Ng鵤 T藀 K誸",	"kfboss_mache", {1416, 3001}, MV_HORSE_CAR_IDX13, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
	{"Xe Ng鵤 T藀 K誸",	"kfboss_mache", {1401, 3120}, MV_HORSE_CAR_IDX14, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
	{"Xe Ng鵤 T藀 K誸",	"kfboss_mache", {1397, 3225}, MV_HORSE_CAR_IDX15, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
}

T_KFB_NPC_INFO_CARTER = {
	{"NPC Chuy觧 ti誴",	"kfboss_chefu", {1455,3245}, nil, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\carter1.lua"},
	{"NPC Chuy觧 ti誴",	"kfboss_chefu", {1387,2934}, nil, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\carter2.lua"},
}	

if g_kfbDebug == 1 then
	T_KFB_NPC_INFO_BOSS = {
		{"Ti猽 Nhi詍 Nguy謙",	"H綾 Trng L穙 Ti猽 Nguy謙", T_KFB_BOSS_POS, MV_BOSS_IDX, BOSS_SCRIPT},
	}

	T_KFB_NPC_INFO_HORSE_CAR = {
		{"Xe Ng鵤 T藀 K誸",	"Ti猽 Xa 2", {1568, 3208}, MV_HORSE_CAR_IDX1, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
		{"Xe Ng鵤 T藀 K誸",	"Ti猽 Xa 2", {1556, 3145}, MV_HORSE_CAR_IDX2, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
		{"Xe Ng鵤 T藀 K誸",	"Ti猽 Xa 2", {1512, 3144}, MV_HORSE_CAR_IDX3, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
		{"Xe Ng鵤 T藀 K誸",	"Ti猽 Xa 2", {1501, 3214}, MV_HORSE_CAR_IDX4, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
		{"Xe Ng鵤 T藀 K誸",	"Ti猽 Xa 2", {1455, 3200}, MV_HORSE_CAR_IDX5, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
		{"Xe Ng鵤 T藀 K誸",	"Ti猽 Xa 2", {1459, 3131}, MV_HORSE_CAR_IDX6, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
		{"Xe Ng鵤 T藀 K誸",	"Ti猽 Xa 2", {1477, 3034}, MV_HORSE_CAR_IDX7, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
		{"Xe Ng鵤 T藀 K誸",	"Ti猽 Xa 2", {1474, 2962}, MV_HORSE_CAR_IDX8, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
		{"Xe Ng鵤 T藀 K誸",	"Ti猽 Xa 2", {1493, 2878}, MV_HORSE_CAR_IDX9, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
		{"Xe Ng鵤 T藀 K誸",	"Ti猽 Xa 2", {1545, 2939}, MV_HORSE_CAR_IDX10, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
		{"Xe Ng鵤 T藀 K誸",	"Ti猽 Xa 2", {1543, 3051}, MV_HORSE_CAR_IDX11, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
		{"Xe Ng鵤 T藀 K誸",	"Ti猽 Xa 2", {1420, 2893}, MV_HORSE_CAR_IDX12, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
		{"Xe Ng鵤 T藀 K誸",	"Ti猽 Xa 2", {1416, 3001}, MV_HORSE_CAR_IDX13, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
		{"Xe Ng鵤 T藀 K誸",	"Ti猽 Xa 2", {1401, 3120}, MV_HORSE_CAR_IDX14, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
		{"Xe Ng鵤 T藀 K誸",	"Ti猽 Xa 2", {1397, 3225}, MV_HORSE_CAR_IDX15, "\\script\\missions\\kuafu_boss\\dacaoyuan2\\npc\\horse_car.lua"},
	}

end
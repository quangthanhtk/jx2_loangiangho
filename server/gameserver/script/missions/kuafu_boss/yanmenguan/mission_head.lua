Include("\\script\\missions\\kuafu_boss\\common_mission_head.lua")


BOSS_SCRIPT = ""


--入场位置
ENTER_POS = {{{1387,2854},{1359,2895},{1312,2903},}} --随机
-- --默认离场位置
-- EXIT_POS  = {{300,1744,3554},}
--虚拟临时复活点，是个不可到达的点，用于强行进入onPlayerRevive
VIRTUAL_REVIVE_POS = {1362, 2852}

KFB_MS_TYPE = KFB_MISSION_DATA_IDX_YMG
KFB_MS_TIMER_ID = T_KFB_MISSION_CONFIG[KFB_MS_TYPE][8] --计时器ID

thisFile = T_KFB_MISSION_CONFIG[KFB_MS_TYPE][7]	--thisFile

KFB_PK_FLAG = 3 --PK状态

---------------------------！！！已在公共头kfb_head.lua中定义！！！--------------------------------------
-----------------------------！！！严禁外部Import后进行覆盖！！！----------------------------------------
----大草原1、大草原2、王旗部落这3个副本的这些配置须保持一致
-- MV_MISSION_STATE			= MV_CUSTOM_BEGIN + 1; --0=初始化 1=等待 2=战斗 3=结束
-- MV_BOSS_IDX     			= MV_CUSTOM_BEGIN + 2; --boss npcIdx
------------------------------------------------------------------------------------------------------


--用kfb_head.lua中的通用配置初始化
Mission_Kfb = {
	missionID 	= T_KFB_MISSION_CONFIG[KFB_MS_TYPE][1],
	realMapID 	= T_KFB_MISSION_CONFIG[KFB_MS_TYPE][2],
	dynamicMap 	= T_KFB_MISSION_CONFIG[KFB_MS_TYPE][5],
	name 		= T_KFB_MISSION_CONFIG[KFB_MS_TYPE][6],
}

Mission_Kfb = inherit(missionHead, Mission_Kfb)



T_KFB_BOSS_POS = {

}

T_KFB_NPC_INFO_BOSS = {
}

T_KFB_NPC_INFO_HORSE_CAR = {
}

T_KFB_NPC_INFO_CARTER = {
	{"NPC Chuy觧 ti誴",	"kfboss_chefu", {1387,2854}, nil, "\\script\\missions\\kuafu_boss\\yanmenguan\\npc\\carter1.lua"},
	{"NPC Chuy觧 ti誴",	"kfboss_chefu", {1359,2895}, nil, "\\script\\missions\\kuafu_boss\\yanmenguan\\npc\\carter1.lua"},
	{"NPC Chuy觧 ti誴",	"kfboss_chefu", {1312,2903}, nil, "\\script\\missions\\kuafu_boss\\yanmenguan\\npc\\carter1.lua"},
	{"NPC Chuy觧 ti誴",	"kfboss_chefu", {1477,2733}, nil, "\\script\\missions\\kuafu_boss\\yanmenguan\\npc\\carter2.lua"},
	{"Gi韎 thi謚 ho箃 ng",	"kfboss_songjiangjun", {1344,2870}, nil, "\\script\\missions\\kuafu_boss\\yanmenguan\\npc\\introducer.lua"},
}


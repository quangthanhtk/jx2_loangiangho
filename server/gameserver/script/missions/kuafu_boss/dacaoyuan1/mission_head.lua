Include("\\script\\missions\\kuafu_boss\\common_mission_head.lua")


BOSS_SCRIPT = "\\script\\missions\\kuafu_boss\\dacaoyuan1\\npc\\boss.lua"

--�볡λ��
ENTER_POS = {{{1548,3202},{1455,3019},{1492,2868},}} --���
-- --Ĭ���볡λ��
-- EXIT_POS  = {{300,1744,3554},}
--������ʱ����㣬�Ǹ����ɵ���ĵ㣬����ǿ�н���onPlayerRevive
VIRTUAL_REVIVE_POS = {1387, 3129}

KFB_MS_TYPE = KFB_MISSION_DATA_IDX_DCY1 --����idx
KFB_MS_TIMER_ID = T_KFB_MISSION_CONFIG[KFB_MS_TYPE][8]	--��ʱ��ID

thisFile = T_KFB_MISSION_CONFIG[KFB_MS_TYPE][7]	--thisFile

KFB_PK_FLAG = 3 --PK״̬

---------------------------���������ڹ���ͷkfb_head.lua�ж��壡����--------------------------------------
-----------------------------�������Ͻ��ⲿImport����и��ǣ�����----------------------------------------
----���ԭ1�����ԭ2�����첿����3����������Щ�����뱣��һ��
-- MV_MISSION_STATE			= MV_CUSTOM_BEGIN + 1; --0=��ʼ�� 1=�ȴ� 2=ս�� 3=����
-- MV_BOSS_IDX     			= MV_CUSTOM_BEGIN + 2; --boss npcIdx
------------------------------------------------------------------------------------------------------


--��kfb_head.lua�е�ͨ�����ó�ʼ��
Mission_Kfb = {
	missionID 	= T_KFB_MISSION_CONFIG[KFB_MS_TYPE][1],
	realMapID 	= T_KFB_MISSION_CONFIG[KFB_MS_TYPE][2],
	dynamicMap 	= T_KFB_MISSION_CONFIG[KFB_MS_TYPE][5],
	name 		= T_KFB_MISSION_CONFIG[KFB_MS_TYPE][6],
}

Mission_Kfb = inherit(missionHead, Mission_Kfb)



T_KFB_BOSS_POS = {
	{1419,3144},
	{1537,3006},
	{1382,2896},
	{1383,3044},
}

T_KFB_NPC_INFO_BOSS = {
	{"Ti�u Nhi�m Nguy�t",	"kfboss_xiaoranyue", T_KFB_BOSS_POS, MV_BOSS_IDX, BOSS_SCRIPT},
}

T_KFB_NPC_INFO_HORSE_CAR = {

}

T_KFB_NPC_INFO_CARTER = {
	{"NPC Chuy�n ti�p",	"kfboss_chefu", {1585,3199}, nil, "\\script\\missions\\kuafu_boss\\dacaoyuan1\\npc\\carter1.lua"},
	{"NPC Chuy�n ti�p",	"kfboss_chefu", {1568,2865}, nil, "\\script\\missions\\kuafu_boss\\dacaoyuan1\\npc\\carter2.lua"},
}	

if g_kfbDebug == 1 then
	T_KFB_NPC_INFO_BOSS = {
		{"Ti�u Nhi�m Nguy�t",	"H�c Tr��ng L�o Ti�u Nguy�t", T_KFB_BOSS_POS, MV_BOSS_IDX, BOSS_SCRIPT},
	}

	T_KFB_NPC_INFO_HORSE_CAR = {
	
	}

end
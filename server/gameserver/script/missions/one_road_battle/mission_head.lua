Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Import("\\script\\lib\\missionfunctions.lua")
Import("\\script\\lib\\define.lua")
Include("\\script\\newbattles\\head.lua");

thisFile = "\\script\\missions\\one_road_battle\\mission.lua";

ORB_NEED_JUNGONG = 100000				-- ������Ҫ����10W
ORB_MAX_SIGNUP_NUM = 200				-- ����ʱһ��׼��������200�������һ��׼������������3��׼�������ˣ�����ʾ��ʱ�޷���������ʼ��������Բ�������
ORB_MAX_SIGNUP_MIN_NUM = 2				-- ĳ��׼����С��100�ˣ������׼������������
ORB_MAX_BATTLE_NUM = 280				-- ��ʼ������һ��ս���������Խ���280�ˣ�������������
ORB_MAX_HALF_BATTLE_NUM = 140 			-- ����˵İ����������жϡ��޸�ʱ��ORB_MAX_BATTLE_NUMͬ���޸�
ORB_JOIN_AFTER_START_COST = 10000 * 50 	-- ������Ҫ��Ǯ 50��
ORB_NEED_LEVEL = 890					-- 8ת92�����ܽ�
ORB_NEED_LEVEL_TEAM = 790 -- team yeu cau cs6 cap 80 KSGVN
ORB_MAX_TEAM_MEMBER = 6					-- ��ӱ���������������


MV_CHARIOT_IDX     			= MV_CUSTOM_BEGIN + 1;
MV_TOWER_IDX_1     			= MV_CUSTOM_BEGIN + 2;
MV_TOWER_IDX_2     			= MV_CUSTOM_BEGIN + 3;
MV_TOWER_IDX_3     			= MV_CUSTOM_BEGIN + 4;
MV_TOWER_IDX_4     			= MV_CUSTOM_BEGIN + 5;
MV_TOWER_IDX_5     			= MV_CUSTOM_BEGIN + 6;
MV_TOWER_IDX_6     			= MV_CUSTOM_BEGIN + 7;
MV_TOWER_IDX_7     			= MV_CUSTOM_BEGIN + 8;
MV_TOWER_IDX_8     			= MV_CUSTOM_BEGIN + 9;
MV_SCHEDULE_SONG   			= MV_CUSTOM_BEGIN + 10;
MV_SCHEDULE_LIAO   			= MV_CUSTOM_BEGIN + 11;
MV_BUCKET_SONG     			= MV_CUSTOM_BEGIN + 12;
MV_BUCKET_LIAO     			= MV_CUSTOM_BEGIN + 13;
MV_BOSS_COUNT      			= MV_CUSTOM_BEGIN + 14;
MV_GUARD_SONG      			= MV_CUSTOM_BEGIN + 15;
MV_GUARD_LIAO      			= MV_CUSTOM_BEGIN + 16;
MV_MONKEY_COUNT    			= MV_CUSTOM_BEGIN + 17;
MV_POINT_SONG      			= MV_CUSTOM_BEGIN + 18;
MV_POINT_LIAO      			= MV_CUSTOM_BEGIN + 19;
MV_HFZ_CHARIOT_IDX 			= MV_CUSTOM_BEGIN + 20;
MV_BATTLE_TIME     			= MV_CUSTOM_BEGIN + 21;
MV_BATTLE_INDEX    			= MV_CUSTOM_BEGIN + 22;
MV_CAMP1_TOWER_DESTORIED	= MV_CUSTOM_BEGIN + 23;
MV_CAMP2_TOWER_DESTORIED	= MV_CUSTOM_BEGIN + 24;

Mission_OneRoadBattle = {
	missionID = 89,
	realMapID = 8907,
	dynamicMap = 1,
	name = "Hi�p L� T��ng Ph�ng",
}

Mission_OneRoadBattle = inherit(missionHead, Mission_OneRoadBattle)

function createMission()
	local mapID, mapIdx = Mission_OneRoadBattle:Create();
	ClearMapNpc(mapID);
	return mapID, mapIdx;
end

function enterMission(mapID, nCamp)
	Mission_OneRoadBattle:Enter(mapID, nCamp);
	return 1;
end

CAMP_SONG    = 1;
CAMP_LIAO    = 2;
CAMP_NEUTRAL = 3;
CAMP_HFZ     = 4;

CampSong = CampPlayer;
CampLiao = CampEnemy;
CampHFZ  = "camp_demon";

CAMPIDX2STR = {
	[CAMP_SONG]    = CampSong,
	[CAMP_LIAO]    = CampLiao,
	[CAMP_NEUTRAL] = CampNeutral,
	[CAMP_HFZ]     = CampHFZ,
}

CAMPSTR2IDX = {
	[CampSong]    = CAMP_SONG,
	[CampLiao]    = CAMP_LIAO,
	[CampNeutral] = CAMP_NEUTRAL,
	[CampHFZ]     = CAMP_HFZ
}

CAMPIDX2NAME_SHORT = {
	[CAMP_SONG]    = "T�ng",
	[CAMP_LIAO]    = "Li�u",
}

CAMPIDX2NAME = {
	[CAMP_SONG]    = "Qu�n T�ng",
	[CAMP_LIAO]    = "Qu�n Li�u",
	[CAMP_NEUTRAL] = "T�ng Li�u",
	[CAMP_HFZ]     = "H�c Phong Tr�i",
}

CAMPIDX2OTHERCAMPIDX = {
	[CAMP_SONG] = CAMP_LIAO,
	[CAMP_LIAO] = CAMP_SONG,
};

--һЩȫ�ֱ���
PHASE_PREPARING = 1;
PHASE_FIGHTING  = 2;
PHASE_END       = 3;

TIME_SCHEDULE_COUNT = 3;
TIME_SCHEDULE = 6 * 60;

CHARIOT_REVIVE_TIME = 30;
HFZ_CHARIOT_DISPEAR_TIME = 10;

MAX_LEAVE_PlAYER_COUNT = 10;

ENTER_POS = {{1649,3722}, {2411,2847},{2029,3266},};
EXIT_POS  = {{200,1286,2875}, {200, 1305, 2783}, {200, 1305, 2783}};

PREPARE_NPC = {
	{"Th�ng D�u",		"Th�ng D�u",			1711,3643,	CAMP_SONG,"\\script\\missions\\one_road_battle\\npc\\bucket.lua"},
	{"Th�ng D�u",		"Th�ng D�u",			2373,2871,	CAMP_LIAO,"\\script\\missions\\one_road_battle\\npc\\bucket.lua"},
	{"T�ng-Qu�n Nhu Quan","Qu�n nhu quan",	1707,3647,	CAMP_SONG, "\\script\\missions\\one_road_battle\\npc\\quartermaster.lua"},
	{"Li�u-Qu�n Nhu Quan","Qu�n nhu quan",	2378,2867,	CAMP_LIAO, "\\script\\missions\\one_road_battle\\npc\\quartermaster.lua"},
	{"T�ng ��o Binh",		"��o Binh",			1588,3696,	CAMP_SONG, "\\script\\missions\\one_road_battle\\npc\\soldier.lua"},
	{"Li�u ��o Binh",		"��o Binh",			2403,2771,	CAMP_LIAO, "\\script\\missions\\one_road_battle\\npc\\soldier.lua"},
	{"T�ng-Th� Th�nh T��ng",	"Th� Th�nh T��ng",		1663,3704,	CAMP_SONG,},
	{"Li�u-Th� Th�nh T��ng",	"Th� Th�nh T��ng",		2396,2864,	CAMP_LIAO,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1723,3632,	CAMP_SONG,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1733,3644,	CAMP_SONG,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1748,3575,	CAMP_SONG,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1760,3589,	CAMP_SONG,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1782,3566,	CAMP_SONG,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1770,3553,	CAMP_SONG,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1849,3365,	CAMP_SONG,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1866,3363,	CAMP_SONG,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1852,3338,	CAMP_SONG,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1869,3342,	CAMP_SONG,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1877,3178,	CAMP_SONG,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1893,3176,	CAMP_SONG,},
	
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1759,3562,	CAMP_SONG,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1772,3577,	CAMP_SONG,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1767,3535,	CAMP_SONG,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1776,3541,	CAMP_SONG,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1791,3560,	CAMP_SONG,},
	{"T�ng-Th� Th�nh V�",	"Th� Th�nh V�",		1800,3569,	CAMP_SONG,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		1739,3580,	CAMP_SONG,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		1759,3603,	CAMP_SONG,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		1724,3618,	CAMP_SONG,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		1745,3637,	CAMP_SONG,},

	{"Li�u-Th� Th�nh V�",	"Th� Th�nh V�",		2352,2916,	CAMP_LIAO,},
	{"Li�u-Th� Th�nh V�",	"Th� Th�nh V�",		2363,2934,	CAMP_LIAO,},
	{"Li�u-Th� Th�nh V�",	"Th� Th�nh V�",		2331,2928,	CAMP_LIAO,},
	{"Li�u-Th� Th�nh V�",	"Th� Th�nh V�",		2341,2938,	CAMP_LIAO,},
	{"Li�u-Th� Th�nh V�",	"Th� Th�nh V�",		2307,2953,	CAMP_LIAO,},
	{"Li�u-Th� Th�nh V�",	"Th� Th�nh V�",		2320,2965,	CAMP_LIAO,},
	{"Li�u-Th� Th�nh V�",	"Th� Th�nh V�",		2192,3332,	CAMP_LIAO,},
	{"Li�u-Th� Th�nh V�",	"Th� Th�nh V�",		2204,3340,	CAMP_LIAO,},
	{"Li�u-Th� Th�nh V�",	"Th� Th�nh V�",		2227,3166,	CAMP_LIAO,},
	{"Li�u-Th� Th�nh V�",	"Th� Th�nh V�",		2231,3161,	CAMP_LIAO,},
	{"Li�u-Th� Th�nh V�",	"Th� Th�nh V�",		2225,3180,	CAMP_LIAO,},
	{"Li�u-Th� Th�nh V�",	"Th� Th�nh V�",		2234,3182,	CAMP_LIAO,},
	{"Li�u-Th� Th�nh V�",	"Th� Th�nh V�",		2319,2939,	CAMP_LIAO,},
	{"Li�u-Th� Th�nh V�",	"Th� Th�nh V�",		2332,2952,	CAMP_LIAO,},
	{"Li�u-Th� Th�nh V�",	"Th� Th�nh V�",		2324,2993,	CAMP_LIAO,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		2300,2956,	CAMP_LIAO,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		2313,2974,	CAMP_LIAO,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		2346,2915,	CAMP_LIAO,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		2354,2938,	CAMP_LIAO,},
	
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		1779,3535,	CAMP_SONG,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		1795,3548,	CAMP_SONG,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		2288,2975,	CAMP_LIAO,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		2300,2991,	CAMP_LIAO,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		1773,3522,	CAMP_SONG,},
	-- {"�Ƿ���",		"�Ƿ���6",		1808,3534,	CAMP_SONG,},
	-- {"�Ƿ���",		"�Ƿ���7",		1791,3519,	CAMP_SONG,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		1805,3550,	CAMP_SONG,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		2277,2990,	CAMP_LIAO,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		2293,3013,	CAMP_LIAO,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		2312,3002,	CAMP_LIAO,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		2313,3026,	CAMP_LIAO,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		2309,3003,	CAMP_LIAO,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		2300,3022,	CAMP_LIAO,},
	{"Th�nh Ph�ng Xa",		"Th�nh Ph�ng Xa",		2265,2982,	CAMP_LIAO,},

	-- {"��ԭ�����",	"��Ʒ����Ա",	1639,3661,	CAMP_SONG, "\\script\\biwudahui\\npc\\npc_itemkeeper.lua"},
	-- {"��ԭ�����",	"��Ʒ����Ա",	2406,2891,	CAMP_LIAO, "\\script\\biwudahui\\npc\\npc_itemkeeper.lua"},
	-- {"��ԭҩ���ƹ�","ҩ���ϰ�",		1646,3658,	CAMP_SONG, [[\script\������\����\npc\ҩ���ϰ�.lua]]},
	-- {"��ԭҩ���ƹ�","ҩ���ϰ�",		2418,2887,	CAMP_LIAO, [[\script\������\����\npc\ҩ���ϰ�.lua]]},
	-- {"����Сʦ��1",	"����Сʦ��",	1652,3707,	CAMP_SONG,},
	-- {"����Сʦ��2",	"����Сʦ��",	1665,3719,	CAMP_SONG,},
	-- {"����Сʦ��3",	"����Сʦ��",	1660,3726,	CAMP_SONG,},
	-- {"����Сʦ��4",	"����Сʦ��",	1649,3710,	CAMP_SONG,},
	-- {"����Сʦ��1",	"����Сʦ��",	2401,2845,	CAMP_LIAO,},
	-- {"����Сʦ��2",	"����Сʦ��",	2412,2866,	CAMP_LIAO,},
	-- {"����Сʦ��3",	"����Сʦ��",	2422,2848,	CAMP_LIAO,},
	-- {"����Сʦ��4",	"����Сʦ��",	2410,2829,	CAMP_LIAO,},

};

TOWER_NPC = {
	{"T�ng-Ti�n Th�p",	"Ti�n Th�p-Tr��c",	1964,3348,	CAMP_SONG, MV_TOWER_IDX_1},
	{"T�ng-Ti�n Th�p",	"Ti�n Th�p-Gi�a",	1893,3429,	CAMP_SONG, MV_TOWER_IDX_2},
	{"T�ng-Ti�n Th�p",	"Ti�n Th�p-Sau",	1846,3482,	CAMP_SONG, MV_TOWER_IDX_3},
	{"Li�u-Ti�n Th�p",	"Ti�n Th�p-Tr��c",	2109,3194,	CAMP_LIAO, MV_TOWER_IDX_5},
	{"Li�u-Ti�n Th�p",	"Ti�n Th�p-Gi�a",	2180,3116,	CAMP_LIAO, MV_TOWER_IDX_6},
	{"Li�u-Ti�n Th�p",	"Ti�n Th�p-Sau",	2228,3062,	CAMP_LIAO, MV_TOWER_IDX_7},
	{"C� T�ng",	"C� T�ng",	1792,3536,	CAMP_SONG, MV_TOWER_IDX_4},
	{"C� Li�u",	"C� Li�u",	2281,3007,	CAMP_LIAO, MV_TOWER_IDX_8},
	
};

TOWER_GUARD_NPC = {
	{
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 1950,3336},
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 1972,3369},
	},
	{
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 1879,3423},
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 1873,3412},
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 1900,3445},
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 1907,3454},
		-- {"�Ƿ���", "�Ƿ���07", 1802,3511},
		-- {"�Ƿ���", "�Ƿ���08", 1810,3530},
		-- {"�Ƿ���", "�Ƿ���09", 1794,3513},
		-- {"�Ƿ���", "�Ƿ���010", 1817,3512},
	},
	{
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 1832,3474},
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 1825,3464},
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 1856,3499},
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 1865,3503},
	},
	{
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 2100,3164},
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 2124,3204},
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 2130,3217},
	},
	{
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 2172,3090},
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 2165,3078},
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 2195,3132},
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 2201,3138},
	},
	{
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 2219,3043},
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 2213,3035},
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 2242,3076},
		{"Th�nh Ph�ng Xa", "Th�nh Ph�ng Xa", 2250,3085},
	},
}

CHARIOT_NPC = {"Hi�p L� Chi�n Xa",	"Chi�n Xa",	2029,3266,	CAMP_NEUTRAL, "\\script\\missions\\one_road_battle\\npc\\chariot.lua"};
CHARIOT_DEAD_NPC = {"Chi�n Xa b� H�c Phong Tr�i chi�m", "Chi�n Xa b� H�c Phong Tr�i chi�m","\\script\\missions\\one_road_battle\\npc\\chariot.lua"};
BOSS_NPC = {
	{"orb_hfzch",   "H�c Phong Tr�i Tam ���ng Gia Tr�n H�a",   50,  30, 100, {2, 97, 236,  5, 4}, "Thi�n Ki�u L�nh", "Hi�p s� %s �� k�t li�u Tam Gia H�c Phong Tr�i Tr�n H�a!"},
	{"orb_hfzdj",   "H�c Phong Tr�i Nh� ���ng Gia ��i Ki�t",   80,  60, 200, {2, 97, 236, 10, 4}, "Thi�n Ki�u L�nh", "Hi�p s� %s �� k�t li�u Nh� Gia H�c Phong Tr�i ��i Ki�t!"},
	{"orb_hfzzpy", "H�c Phong Tr�i ��i ���ng Gia Chi�m Phi�n Ngh�a", 100, 90, 500, {2, 97, 236, 15, 4}, "Thi�n Ki�u L�nh", "Hi�p s� %s �� k�t li�u ��i Gia H�c Phong Tr�i Chi�m Phi�n Ngh�a!"},
}

BOSS_SCRIPT = "\\script\\missions\\one_road_battle\\npc\\boss.lua";

BOSS_POS = {
	{1897, 3098},
	{2148, 3409},
};

BOSS_TALK = {
	"H�c Phong Tr�i Tam ���ng Gia Tr�n H�a: ta s� b�o Thi�n H� bi�t , T�y Th�c ��o �� l� c�a H�c Phong Tr�i tao!",
	"H�c Phong Tr�i Nh� ���ng Gia ��i Ki�t: kh�ng bi�t Tr�n H�a �i ��u r�i, v�i v�ng th� mong kh�ng �nh h��ng ��n vi�c tao.",
	"H�c Phong Tr�i ��i ���ng Gia Chi�m Phi�n Ngh�a: ��nh b�i h� th�t kh�ng d� ��u!hahaha,h�m nay H�c Phong Tr�i tao th�t l� m�nh v� thuy�t v�i.",
}

GUARD_NPC = {
	{"T��ng Th� Th�nh Vi�n Qu�n-T�ng",	"Th� Th�nh T��ng",},
	{"T��ng Th� Th�nh Vi�n Qu�n-Li�u",	"Th� Th�nh T��ng",},
};

GUARD_POS = {
	{1968,3338},
	{1900,3422},
	{1850,3471},
	
	{2100,3201},
	{2172,3122},
	{2221,3072},
};

GUARD_SCRIPT = "\\script\\missions\\one_road_battle\\npc\\guard.lua";

OBSTACLE_NPC = {
	{"Qu� Th�", "C�y C�i", "\\script\\missions\\one_road_battle\\npc\\obstalce.lua"},
	{"H�ng r�o", "H�ng r�o", "\\script\\missions\\one_road_battle\\npc\\obstalce.lua"},
};

OBSTACLE_NPC_POS = {
	--��ľ
	{
		{1832, 3495},
		{1874, 3441},
		{1924, 3420},
		{1943, 3353},
		{2145, 3148},
		{2172, 3145},
		{2204, 3063},
		{2251, 3021},
	},
	--դ��
	{
		{
			{2285, 2980},
			{2268, 3040},
			{2235, 3029},
			{2215, 3125},
			{2209, 3112},
			{2115, 3165},
			{2140, 3176},
			{2149, 3177},
		},
		{
			{1952, 3382},
			{1959, 3392},
			{1922, 3373},
			{1912, 3410},
			{1880, 3441},
			{1848, 3443},
			{1834, 3508},
			{1805, 3506},
		},
	},
}

MONKEY_NPC = {"Kh� �n Tr�m",	"Kh� �n Tr�m"};
MONKEY_SCRIPT = "\\script\\missions\\one_road_battle\\npc\\monkey.lua";
MONKEY_MAX_COUNT = 30;
MONKEY_PER_COUNT = 6;

MONKEY_POS = {
	{
		{2281,3076},
		{1781,3505},
		{1779,3507},
		{1865,3517},
		{1902,3489},
		{1848,3383},
		{1870,3348},
		{1863,3267},
		{1880,3228},
		{1885,3189},
		{1850,3122},
		{1871,3051},
		{1940,3075},
		{1896,3376},
		{1935,3451},
		{1935,3350},
		{2045,3335},
		{2008,3174},
	},
	{
		{2083,3468},
		{2093,3422},
		{2158,3353},
		{2196,3308},
		{2232,3267},
		{2233,3225},
		{2227,3169},
		{2210,3190},
		{2185,3100},
		{2179,3183},
		{2132,3115},
		{2216,3023},
		{2274,3086},
		{2321,3037},
		{2285,2955},
		{2144,3218},
		{2204,3269},
		{2230,3290},
	}
};

HFZ_CHARIOT_NPC = {"Xe C�ng Th�nh b� H�c Phong Tr�i chi�m",	"Xe C�ng Th�nh b� H�c Phong Tr�i chi�m",};
HFZ_CHARIOT_SCRIPT = "\\script\\missions\\one_road_battle\\npc\\hfz_chariot.lua";

HFZ_FISH_NPC      = {"H�c Phong Tr�i L�u La",	"H�c Phong Tr�i L�u La",};
HFZ_FISH_POS      = {{2033,3254},{2038,3269},{2034,3279},{2022,3277},{2033,3254},{2016,3264},};

HFZ_TALK_FISH_NPC = {"H�c Phong Tr�i L�u La 1",	"H�c Phong Tr�i L�u La",};
HFZ_TALK_FISH_POS = {{10,0},{-10,0},{0,10},{0,-10},};

FIELD_BOSS_POS = {
	{2298,2984},
	{2246,3017},
	{2209,3108},
	{2140,3152},
	{2091,3217},
	{2172,3389},
	{1885,3117},
	{1990,3311},
	{1947,3392},
	{1875,3461},
	{1812,3516},
	{1751,3611},
}

BUCKET_GDP = {2, 1, 31247};

--�������㷽��
POINT_KILL_PLAYER   = 1;
POINT_OWN_CHARIOT   = 1;
POINT_DESTORY_TOWER = 200;
POINT_GET_MONKEY    = 10;

--��Ծ��
ACTIVITY_NEED = 100;
ACTIVITY_MAX  = 600;
ACTIVITY_2_EXP = 15000; -- ��Ծ���ܻ�õľ��齱����Ϊ1:15000

ACTIVITY_KILL_PLAYER   = 30;
ACTIVITY_ASSISTANT     = 15;
ACTIVITY_DEATH         = 5;
ACTIVITY_DESTORY_TOWER = 250;
ACTIVITY_CHARIOT       = 1;
ACTIVITY_MONKEY        = 60;
ACTIVITY_RANDOM_BOSS   = 250;
ACTIVITY_BIG_FLAG      = 500;
ACTIVITY_SMALL_BOSS    = 20;

WINTYPE_LOSE = 0;
WINTYPE_DRAW = 1;
WINTYPE_WIN  = 2;
WINTYPE_KING = 3;

T_AWARD_BASE_JUNGONG = {
	2000, --��
	2200, --ƽ
	3000, --ʤ
}
ACTIVE_RATE_JUNGONG = 1.2; --��Ծ��Ҿ�������

T_AWARD_BASE_EXP = {
	200000000, --��
	200000000, --ƽ
	400000000, --ʤ
}
ACTIVE_RATE_EXP = 1.2; --��Ծ��Ҿ��鱶��

if _JX2WZ == 1 then
NORMAL_JUNGONG = {
	[WINTYPE_LOSE] = 900,
	[WINTYPE_DRAW] = 900,
	[WINTYPE_WIN]  = 1200,
	[WINTYPE_KING] = 1500,
};
else
NORMAL_JUNGONG = {
	[WINTYPE_LOSE] = 300,
	[WINTYPE_DRAW] = 600,
	[WINTYPE_WIN]  = 900,
	[WINTYPE_KING] = 1200,
};
end

NORMAL_EXP = {
	[WINTYPE_LOSE] = 2,
	[WINTYPE_DRAW] = 2,
	[WINTYPE_WIN]  = 4,
	[WINTYPE_KING] = 6,
};

NORMAL_DPL = {
	[WINTYPE_LOSE] = 5,
	[WINTYPE_DRAW] = 5,
	[WINTYPE_WIN]  = 25,
	[WINTYPE_KING] = 35,
};


--�����������
TASKID_ORB_CAMP        = TASKID_DLGC_CAMP;					--3500
TASKID_ORB_ACTIVITY    = 3509 --BATTLE_OFFSET + PTNC_ACTIVITY;		--700 + 83
-- TASKID_ORB_JUNGONG     = BATTLE_OFFSET + PT_JUNGONG_AWARD;	--700 + 55
-- TASKID_ORB_EXP         = BATTLE_OFFSET + PT_EXP_AWARD;		--700 + 53
-- TASKID_ORB_DPL         = BATTLE_OFFSET + PT_LAST_RESULT;	--700 + 10
TASKID_ORB_KILL        = TASKID_DLGC_KILL;
TASKID_ORB_DEAD        = TASKID_DLGC_DEAD;
TASKID_ORB_ASSIST      = TASKID_DLGC_TASK;
-- TASKID_ORB_WIN_COUNT   = TASKID_DLGC_WIN;
-- TASKID_ORB_STAR_COUNT  = TASKID_DLGC_BATTLE_STAR;
-- TASKID_ORB_STAR_FLAG   = BATTLE_OFFSET + PT_LAST_BATTLE;
-- TASKID_ORB_TIME        = TASKID_DLGC_TIME;
-- TASKID_ORB_GSID        = TASKID_DLGC_GSID;
TASKID_ORB_MAPID       = TASKID_DLGC_MAPID;
TASKID_TEMP_TOWER      = BATTLE_OFFSET + PTNC_KILL;
TASKID_TEMP_MONKEY     = BATTLE_OFFSET + PTNC_DEATH;
TASKID_TEMP_BOSS       = BATTLE_OFFSET + PTNC_SERIES_KILL;
TASKID_ORB_LAST_RESULT =  3508--BATTLE_OFFSET + PT_LAST_CAMP;		--700 + 34
TASKID_ORB_TIMEIDENTITY = 3506
g_tMissionParam = {};

--���Ʊ���
WEEKNESS_BUFF = {
	"state_immune", "state_penetration", {{15, 15}, {30, 30}, {45,45},}, {"B�o Th� R�a H�n", "L�i Tho�t", "T� Di�n S� Ca"},
};	

--ս������ĸ�����ʾ
MSG_TOWER_DESTORYED = {
	"%s ph� h�y ti�n th�p ph�a tr��c",
	"%s �� ph� h�y ti�n th�p trung qu�n, th� nh� ph� tr�c!",
	"%s �� ph� h�y ti�n th�p b�c h�u, s�p gi�nh chi�n th�ng!",
};
MSG_CHARIOT_RUN      = {
	"���ng g�n ti�n th�p ti�n phong %s �� th�ng, Chi�n Xa c� th� ti�p t�c ti�n l�n.",
	"���ng g�n ti�n th�p trung qu�n %s �� th�ng, Chi�n Xa c� th� ti�p t�c ti�n l�n.",
	"���ng g�n ti�n th�p b�c h�u %s �� th�ng, Chi�n Xa c� th� ti�p t�c ti�n l�n.",
};
MSG_TOWER_BE_ATTACKED = "%s �ang t�n c�ng %s - %s!";
MSG_FLAG_BE_ATTACKED  = "Qu�n %s �ang t�n c�ng c� qu�n %s!";
MSG_CREATE_MONKEY     = "V�t t� qu�n d�ng b� b�n kh� ��ng gh�t tr�m, mau b�t ch�ng!";
MSG_LOST_MONKEY       = "Kh� �� b� tr�n";
MSG_CATCH_MONKEY      = "Hi�p s� %s �� �o�t l�i v�t ph�m t� Kh� �n Tr�m!";
MSG_CHARIOT_STOP      = "X�c Ti�n Th�o ch�a ���c d�n d�p, Chi�n Xa kh�ng th� �i ���c.";
MSG_KILL_BOSS         = "%s t�n c�ng %s ��n cu�i, b�t ng� t� tr�n ng��i %s nh�n ���c %s.";
MSG_GET_ASSISTANT     = "B�n nh�n ���c 1 l�n tr� c�ng.";

--ս��״̬
CHARIOT_STATE_MSG = {
	IDLE           = "Chi�n Xa �ang ��nh tr�...", --����״̬
	ATTACKING_LIAO = "�ang t�n c�ng Li�u Qu�c %s...", --�����ɹ�
	ATTACKING_SONG = "�ang t�n c�ng T�ng Qu�c %s...", --�����ι�
	CLEANING_LIAO  = "X� l� Li�u Qu�c %s ���ng", --�����ɹ���·
	CLEANING_SONG  = "X� l� T�ng Qu�c %s ���ng", --�����ι���·
	OCCUPIED       = "B� H�c Phong Tr�i chi�m", --���ڷ�կռ��
};

------------------------------------ ͳ����� ------------------------------------

RUNTIMEID_BattleStart = 1					--��·��꿪������
RUNTIMEID_PlayerJoinCount = 2				--��·���������
RUNTIMEID_EachRouterJoinCount = 3 			--��·�������ɲ�����
RUNTIMEID_EachRouterKillCount = 4			--��·��������ɱ����
RUNTIMEID_EachRouterDeathCount = 5 			--��·��������������
RUNTIMEID_GetPersonalHonorCountByLevel = 6	--��·����ȡn��սѫ����
RUNTIMEID_GetTeamHonorCountByCamp = 7		--��·���X��Ӫ��ȡ���幦ѫ����
RUNTIMEID_UseOilBomb = 8					--��·���ʹ����Ͱ����
RUNTIMEID_OldDriverWaitMe = 9				--��·��겹�����������


-- ��������ͳ�ƺ��� AddRuntimeStat( Orb_GetBattleTimeType(), x, x, x )��66��ʾ���糡ս����67��ʾ����
function _orb_GetBattleTimeType()
	local szHour = date("%H")
	if szHour == "11" then
		return 66		
	end
	return 67
end

function Orb_AddRuntimeStat(subid, type, var) 
	-- print("AddRuntimeStat(",_orb_GetBattleTimeType(), subid, type, var,")")
	AddRuntimeStat(_orb_GetBattleTimeType(), subid, type, var)
end


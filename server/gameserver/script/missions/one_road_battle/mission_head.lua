Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Import("\\script\\lib\\missionfunctions.lua")
Import("\\script\\lib\\define.lua")
Include("\\script\\newbattles\\head.lua");

thisFile = "\\script\\missions\\one_road_battle\\mission.lua";

ORB_NEED_JUNGONG = 100000				-- 进入需要军功10W
ORB_MAX_SIGNUP_NUM = 200				-- 报名时一个准备场多余200则进入下一个准备场，若所有3个准备场满人，则提示暂时无法报名（开始比赛后可以补报名）
ORB_MAX_SIGNUP_MIN_NUM = 2				-- 某个准备场小于100人，则这个准备场不开比赛
ORB_MAX_BATTLE_NUM = 280				-- 开始比赛后，一个战场内最多可以进入280人（包含补报名）
ORB_MAX_HALF_BATTLE_NUM = 140 			-- 最多人的半数，用于判断。修改时和ORB_MAX_BATTLE_NUM同步修改
ORB_JOIN_AFTER_START_COST = 10000 * 50 	-- 补报名要花钱 50金
ORB_NEED_LEVEL = 890					-- 8转92级才能进
ORB_NEED_LEVEL_TEAM = 790 -- team yeu cau cs6 cap 80 KSGVN
ORB_MAX_TEAM_MEMBER = 6					-- 组队报名队伍人数上限


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
	name = "Hi謕 L� Tng Ph飊g",
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
	[CAMP_SONG]    = "T鑞g",
	[CAMP_LIAO]    = "Li猽",
}

CAMPIDX2NAME = {
	[CAMP_SONG]    = "Qu﹏ T鑞g",
	[CAMP_LIAO]    = "Qu﹏ Li猽",
	[CAMP_NEUTRAL] = "T鑞g Li猽",
	[CAMP_HFZ]     = "H綾 Phong Tr筰",
}

CAMPIDX2OTHERCAMPIDX = {
	[CAMP_SONG] = CAMP_LIAO,
	[CAMP_LIAO] = CAMP_SONG,
};

--一些全局变量
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
	{"Th飊g D莡",		"Th飊g D莡",			1711,3643,	CAMP_SONG,"\\script\\missions\\one_road_battle\\npc\\bucket.lua"},
	{"Th飊g D莡",		"Th飊g D莡",			2373,2871,	CAMP_LIAO,"\\script\\missions\\one_road_battle\\npc\\bucket.lua"},
	{"T鑞g-Qu﹏ Nhu Quan","Qu﹏ nhu quan",	1707,3647,	CAMP_SONG, "\\script\\missions\\one_road_battle\\npc\\quartermaster.lua"},
	{"Li猽-Qu﹏ Nhu Quan","Qu﹏ nhu quan",	2378,2867,	CAMP_LIAO, "\\script\\missions\\one_road_battle\\npc\\quartermaster.lua"},
	{"T鑞g Уo Binh",		"Уo Binh",			1588,3696,	CAMP_SONG, "\\script\\missions\\one_road_battle\\npc\\soldier.lua"},
	{"Li猽 Уo Binh",		"Уo Binh",			2403,2771,	CAMP_LIAO, "\\script\\missions\\one_road_battle\\npc\\soldier.lua"},
	{"T鑞g-Th� Th祅h Tng",	"Th� Th祅h Tng",		1663,3704,	CAMP_SONG,},
	{"Li猽-Th� Th祅h Tng",	"Th� Th祅h Tng",		2396,2864,	CAMP_LIAO,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1723,3632,	CAMP_SONG,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1733,3644,	CAMP_SONG,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1748,3575,	CAMP_SONG,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1760,3589,	CAMP_SONG,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1782,3566,	CAMP_SONG,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1770,3553,	CAMP_SONG,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1849,3365,	CAMP_SONG,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1866,3363,	CAMP_SONG,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1852,3338,	CAMP_SONG,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1869,3342,	CAMP_SONG,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1877,3178,	CAMP_SONG,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1893,3176,	CAMP_SONG,},
	
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1759,3562,	CAMP_SONG,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1772,3577,	CAMP_SONG,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1767,3535,	CAMP_SONG,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1776,3541,	CAMP_SONG,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1791,3560,	CAMP_SONG,},
	{"T鑞g-Th� Th祅h V�",	"Th� Th祅h V�",		1800,3569,	CAMP_SONG,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		1739,3580,	CAMP_SONG,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		1759,3603,	CAMP_SONG,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		1724,3618,	CAMP_SONG,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		1745,3637,	CAMP_SONG,},

	{"Li猽-Th� Th祅h V�",	"Th� Th祅h V�",		2352,2916,	CAMP_LIAO,},
	{"Li猽-Th� Th祅h V�",	"Th� Th祅h V�",		2363,2934,	CAMP_LIAO,},
	{"Li猽-Th� Th祅h V�",	"Th� Th祅h V�",		2331,2928,	CAMP_LIAO,},
	{"Li猽-Th� Th祅h V�",	"Th� Th祅h V�",		2341,2938,	CAMP_LIAO,},
	{"Li猽-Th� Th祅h V�",	"Th� Th祅h V�",		2307,2953,	CAMP_LIAO,},
	{"Li猽-Th� Th祅h V�",	"Th� Th祅h V�",		2320,2965,	CAMP_LIAO,},
	{"Li猽-Th� Th祅h V�",	"Th� Th祅h V�",		2192,3332,	CAMP_LIAO,},
	{"Li猽-Th� Th祅h V�",	"Th� Th祅h V�",		2204,3340,	CAMP_LIAO,},
	{"Li猽-Th� Th祅h V�",	"Th� Th祅h V�",		2227,3166,	CAMP_LIAO,},
	{"Li猽-Th� Th祅h V�",	"Th� Th祅h V�",		2231,3161,	CAMP_LIAO,},
	{"Li猽-Th� Th祅h V�",	"Th� Th祅h V�",		2225,3180,	CAMP_LIAO,},
	{"Li猽-Th� Th祅h V�",	"Th� Th祅h V�",		2234,3182,	CAMP_LIAO,},
	{"Li猽-Th� Th祅h V�",	"Th� Th祅h V�",		2319,2939,	CAMP_LIAO,},
	{"Li猽-Th� Th祅h V�",	"Th� Th祅h V�",		2332,2952,	CAMP_LIAO,},
	{"Li猽-Th� Th祅h V�",	"Th� Th祅h V�",		2324,2993,	CAMP_LIAO,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		2300,2956,	CAMP_LIAO,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		2313,2974,	CAMP_LIAO,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		2346,2915,	CAMP_LIAO,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		2354,2938,	CAMP_LIAO,},
	
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		1779,3535,	CAMP_SONG,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		1795,3548,	CAMP_SONG,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		2288,2975,	CAMP_LIAO,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		2300,2991,	CAMP_LIAO,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		1773,3522,	CAMP_SONG,},
	-- {"城防车",		"城防车6",		1808,3534,	CAMP_SONG,},
	-- {"城防车",		"城防车7",		1791,3519,	CAMP_SONG,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		1805,3550,	CAMP_SONG,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		2277,2990,	CAMP_LIAO,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		2293,3013,	CAMP_LIAO,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		2312,3002,	CAMP_LIAO,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		2313,3026,	CAMP_LIAO,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		2309,3003,	CAMP_LIAO,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		2300,3022,	CAMP_LIAO,},
	{"Th祅h Ph遪g Xa",		"Th祅h Ph遪g Xa",		2265,2982,	CAMP_LIAO,},

	-- {"中原储物柜",	"物品保管员",	1639,3661,	CAMP_SONG, "\\script\\biwudahui\\npc\\npc_itemkeeper.lua"},
	-- {"中原储物柜",	"物品保管员",	2406,2891,	CAMP_LIAO, "\\script\\biwudahui\\npc\\npc_itemkeeper.lua"},
	-- {"中原药店掌柜","药店老板",		1646,3658,	CAMP_SONG, [[\script\西南区\大理府\npc\药店老板.lua]]},
	-- {"中原药店掌柜","药店老板",		2418,2887,	CAMP_LIAO, [[\script\西南区\大理府\npc\药店老板.lua]]},
	-- {"峨嵋小师姐1",	"峨嵋小师姐",	1652,3707,	CAMP_SONG,},
	-- {"峨嵋小师姐2",	"峨嵋小师姐",	1665,3719,	CAMP_SONG,},
	-- {"峨嵋小师姐3",	"峨嵋小师姐",	1660,3726,	CAMP_SONG,},
	-- {"峨嵋小师姐4",	"峨嵋小师姐",	1649,3710,	CAMP_SONG,},
	-- {"峨嵋小师姐1",	"峨嵋小师姐",	2401,2845,	CAMP_LIAO,},
	-- {"峨嵋小师姐2",	"峨嵋小师姐",	2412,2866,	CAMP_LIAO,},
	-- {"峨嵋小师姐3",	"峨嵋小师姐",	2422,2848,	CAMP_LIAO,},
	-- {"峨嵋小师姐4",	"峨嵋小师姐",	2410,2829,	CAMP_LIAO,},

};

TOWER_NPC = {
	{"T鑞g-Ti詎 Th竝",	"Ti詎 Th竝-Trc",	1964,3348,	CAMP_SONG, MV_TOWER_IDX_1},
	{"T鑞g-Ti詎 Th竝",	"Ti詎 Th竝-Gi鱝",	1893,3429,	CAMP_SONG, MV_TOWER_IDX_2},
	{"T鑞g-Ti詎 Th竝",	"Ti詎 Th竝-Sau",	1846,3482,	CAMP_SONG, MV_TOWER_IDX_3},
	{"Li猽-Ti詎 Th竝",	"Ti詎 Th竝-Trc",	2109,3194,	CAMP_LIAO, MV_TOWER_IDX_5},
	{"Li猽-Ti詎 Th竝",	"Ti詎 Th竝-Gi鱝",	2180,3116,	CAMP_LIAO, MV_TOWER_IDX_6},
	{"Li猽-Ti詎 Th竝",	"Ti詎 Th竝-Sau",	2228,3062,	CAMP_LIAO, MV_TOWER_IDX_7},
	{"C� T鑞g",	"C� T鑞g",	1792,3536,	CAMP_SONG, MV_TOWER_IDX_4},
	{"C� Li猽",	"C� Li猽",	2281,3007,	CAMP_LIAO, MV_TOWER_IDX_8},
	
};

TOWER_GUARD_NPC = {
	{
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 1950,3336},
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 1972,3369},
	},
	{
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 1879,3423},
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 1873,3412},
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 1900,3445},
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 1907,3454},
		-- {"城防车", "城防车07", 1802,3511},
		-- {"城防车", "城防车08", 1810,3530},
		-- {"城防车", "城防车09", 1794,3513},
		-- {"城防车", "城防车010", 1817,3512},
	},
	{
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 1832,3474},
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 1825,3464},
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 1856,3499},
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 1865,3503},
	},
	{
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 2100,3164},
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 2124,3204},
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 2130,3217},
	},
	{
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 2172,3090},
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 2165,3078},
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 2195,3132},
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 2201,3138},
	},
	{
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 2219,3043},
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 2213,3035},
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 2242,3076},
		{"Th祅h Ph遪g Xa", "Th祅h Ph遪g Xa", 2250,3085},
	},
}

CHARIOT_NPC = {"Hi謕 L� Chi課 Xa",	"Chi課 Xa",	2029,3266,	CAMP_NEUTRAL, "\\script\\missions\\one_road_battle\\npc\\chariot.lua"};
CHARIOT_DEAD_NPC = {"Chi課 Xa b� H綾 Phong Tr筰 chi誱", "Chi課 Xa b� H綾 Phong Tr筰 chi誱","\\script\\missions\\one_road_battle\\npc\\chariot.lua"};
BOSS_NPC = {
	{"orb_hfzch",   "H綾 Phong Tr筰 Tam Л琻g Gia Tr莕 H醓",   50,  30, 100, {2, 97, 236,  5, 4}, "Thi猲 Ki猽 L謓h", "Hi謕 s� %s  k誸 li評 Tam Gia H綾 Phong Tr筰 Tr莕 H醓!"},
	{"orb_hfzdj",   "H綾 Phong Tr筰 Nh� Л琻g Gia Чi Ki謙",   80,  60, 200, {2, 97, 236, 10, 4}, "Thi猲 Ki猽 L謓h", "Hi謕 s� %s  k誸 li評 Nh� Gia H綾 Phong Tr筰 Чi Ki謙!"},
	{"orb_hfzzpy", "H綾 Phong Tr筰 Чi Л琻g Gia Chi猰 Phi猲 Ngh躠", 100, 90, 500, {2, 97, 236, 15, 4}, "Thi猲 Ki猽 L謓h", "Hi謕 s� %s  k誸 li評 Чi Gia H綾 Phong Tr筰 Chi猰 Phi猲 Ngh躠!"},
}

BOSS_SCRIPT = "\\script\\missions\\one_road_battle\\npc\\boss.lua";

BOSS_POS = {
	{1897, 3098},
	{2148, 3409},
};

BOSS_TALK = {
	"H綾 Phong Tr筰 Tam Л琻g Gia Tr莕 H醓: ta s� b秓 Thi猲 H� bi誸 , T﹜ Th鬰 Чo  l� c馻 H綾 Phong Tr筰 tao!",
	"H綾 Phong Tr筰 Nh� Л琻g Gia Чi Ki謙: kh玭g bi誸 Tr莕 H醓 甶 u r錳, v閕 v祅g th� mong kh玭g 秐h hng n vi謈 tao.",
	"H綾 Phong Tr筰 Чi Л琻g Gia Chi猰 Phi猲 Ngh躠: nh b筰 h� th藅 kh玭g d� u!hahaha,h玬 nay H綾 Phong Tr筰 tao th藅 l� m筺h v� thuy謙 v阨.",
}

GUARD_NPC = {
	{"Tng Th� Th祅h Vi謓 Qu﹏-T鑞g",	"Th� Th祅h Tng",},
	{"Tng Th� Th祅h Vi謓 Qu﹏-Li猽",	"Th� Th祅h Tng",},
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
	{"Qu� Th�", "C﹜ C鑙", "\\script\\missions\\one_road_battle\\npc\\obstalce.lua"},
	{"H祅g r祇", "H祅g r祇", "\\script\\missions\\one_road_battle\\npc\\obstalce.lua"},
};

OBSTACLE_NPC_POS = {
	--树木
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
	--栅栏
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

MONKEY_NPC = {"Kh�  Tr閙",	"Kh�  Tr閙"};
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

HFZ_CHARIOT_NPC = {"Xe C玭g Th祅h b� H綾 Phong Tr筰 chi誱",	"Xe C玭g Th祅h b� H綾 Phong Tr筰 chi誱",};
HFZ_CHARIOT_SCRIPT = "\\script\\missions\\one_road_battle\\npc\\hfz_chariot.lua";

HFZ_FISH_NPC      = {"H綾 Phong Tr筰 L﹗ La",	"H綾 Phong Tr筰 L﹗ La",};
HFZ_FISH_POS      = {{2033,3254},{2038,3269},{2034,3279},{2022,3277},{2033,3254},{2016,3264},};

HFZ_TALK_FISH_NPC = {"H綾 Phong Tr筰 L﹗ La 1",	"H綾 Phong Tr筰 L﹗ La",};
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

--分数计算方法
POINT_KILL_PLAYER   = 1;
POINT_OWN_CHARIOT   = 1;
POINT_DESTORY_TOWER = 200;
POINT_GET_MONKEY    = 10;

--活跃度
ACTIVITY_NEED = 100;
ACTIVITY_MAX  = 600;
ACTIVITY_2_EXP = 15000; -- 活跃度能获得的经验奖励比为1:15000

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
	2000, --负
	2200, --平
	3000, --胜
}
ACTIVE_RATE_JUNGONG = 1.2; --活跃玩家军功倍率

T_AWARD_BASE_EXP = {
	200000000, --负
	200000000, --平
	400000000, --胜
}
ACTIVE_RATE_EXP = 1.2; --活跃玩家经验倍率

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


--各种任务变量
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

--弱势保护
WEEKNESS_BUFF = {
	"state_immune", "state_penetration", {{15, 15}, {30, 30}, {45,45},}, {"B竜 Th� R鯽 H薾", "L鑙 Tho竧", "T� Di謓 S� Ca"},
};	

--战场里面的各种提示
MSG_TOWER_DESTORYED = {
	"%s ph� h駓 ti詎 th竝 ph輆 trc",
	"%s  ph� h駓 ti詎 th竝 trung qu﹏, th� nh� ph� tr骳!",
	"%s  ph� h駓 ti詎 th竝 b閏 h藆, s緋 gi祅h chi課 th緉g!",
};
MSG_CHARIOT_RUN      = {
	"Л阯g g莕 ti詎 th竝 ti襫 phong %s  th玭g, Chi課 Xa c� th� ti誴 t鬰 ti課 l猲.",
	"Л阯g g莕 ti詎 th竝 trung qu﹏ %s  th玭g, Chi課 Xa c� th� ti誴 t鬰 ti課 l猲.",
	"Л阯g g莕 ti詎 th竝 b閏 h藆 %s  th玭g, Chi課 Xa c� th� ti誴 t鬰 ti課 l猲.",
};
MSG_TOWER_BE_ATTACKED = "%s 產ng t蕁 c玭g %s - %s!";
MSG_FLAG_BE_ATTACKED  = "Qu﹏ %s 產ng t蕁 c玭g c� qu﹏ %s!";
MSG_CREATE_MONKEY     = "V藅 t� qu﹏ d鬾g b� b鋘 kh� ng gh衪 tr閙, mau b総 ch髇g!";
MSG_LOST_MONKEY       = "Kh�  b� tr鑞";
MSG_CATCH_MONKEY      = "Hi謕 s� %s  畂箃 l筰 v藅 ph萴 t� Kh�  Tr閙!";
MSG_CHARIOT_STOP      = "X竎 Ti詎 Th竜 ch璦 頲 d鋘 d裵, Chi課 Xa kh玭g th� 甶 頲.";
MSG_KILL_BOSS         = "%s t蕁 c玭g %s n cu鑙, b蕋 ng� t� tr猲 ngi %s nh薾 頲 %s.";
MSG_GET_ASSISTANT     = "B筺 nh薾 頲 1 l莕 tr� c玭g.";

--战车状态
CHARIOT_STATE_MSG = {
	IDLE           = "Chi課 Xa 產ng nh tr�...", --闲置状态
	ATTACKING_LIAO = "ng t蕁 c玭g Li猽 Qu鑓 %s...", --进攻辽国
	ATTACKING_SONG = "ng t蕁 c玭g T鑞g Qu鑓 %s...", --进攻宋国
	CLEANING_LIAO  = "X� l� Li猽 Qu鑓 %s 阯g", --清理辽国道路
	CLEANING_SONG  = "X� l� T鑞g Qu鑓 %s 阯g", --清理宋国道路
	OCCUPIED       = "B� H綾 Phong Tr筰 chi誱", --被黑风寨占领
};

------------------------------------ 统计相关 ------------------------------------

RUNTIMEID_BattleStart = 1					--狭路相逢开启场数
RUNTIMEID_PlayerJoinCount = 2				--狭路相逢参与玩家
RUNTIMEID_EachRouterJoinCount = 3 			--狭路相逢各流派参与数
RUNTIMEID_EachRouterKillCount = 4			--狭路相逢各流派杀敌数
RUNTIMEID_EachRouterDeathCount = 5 			--狭路相逢各流派死亡数
RUNTIMEID_GetPersonalHonorCountByLevel = 6	--狭路相逢获取n级战勋数量
RUNTIMEID_GetTeamHonorCountByCamp = 7		--狭路相逢X阵营获取集体功勋数量
RUNTIMEID_UseOilBomb = 8					--狭路相逢使用油桶数量
RUNTIMEID_OldDriverWaitMe = 9				--狭路相逢补报名玩家数量


-- 用于数据统计函数 AddRuntimeStat( Orb_GetBattleTimeType(), x, x, x )，66表示中午场战场，67表示晚上
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


Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Import("\\script\\lib\\missionfunctions.lua")
Import("\\script\\lib\\define.lua")
Include("\\script\\newbattles\\head.lua");

thisFile = "\\script\\missions\\one_road_battle\\mission.lua";

ORB_NEED_JUNGONG = 100000				-- ½øÈëÐèÒª¾ü¹¦10W
ORB_MAX_SIGNUP_NUM = 200				-- ±¨ÃûÊ±Ò»¸ö×¼±¸³¡¶àÓà200Ôò½øÈëÏÂÒ»¸ö×¼±¸³¡£¬ÈôËùÓÐ3¸ö×¼±¸³¡ÂúÈË£¬ÔòÌáÊ¾ÔÝÊ±ÎÞ·¨±¨Ãû£¨¿ªÊ¼±ÈÈüºó¿ÉÒÔ²¹±¨Ãû£©
ORB_MAX_SIGNUP_MIN_NUM = 2				-- Ä³¸ö×¼±¸³¡Ð¡ÓÚ100ÈË£¬ÔòÕâ¸ö×¼±¸³¡²»¿ª±ÈÈü
ORB_MAX_BATTLE_NUM = 280				-- ¿ªÊ¼±ÈÈüºó£¬Ò»¸öÕ½³¡ÄÚ×î¶à¿ÉÒÔ½øÈë280ÈË£¨°üº¬²¹±¨Ãû£©
ORB_MAX_HALF_BATTLE_NUM = 140 			-- ×î¶àÈËµÄ°ëÊý£¬ÓÃÓÚÅÐ¶Ï¡£ÐÞ¸ÄÊ±ºÍORB_MAX_BATTLE_NUMÍ¬²½ÐÞ¸Ä
ORB_JOIN_AFTER_START_COST = 10000 * 50 	-- ²¹±¨ÃûÒª»¨Ç® 50½ð
ORB_NEED_LEVEL = 890					-- 8×ª92¼¶²ÅÄÜ½ø
ORB_NEED_LEVEL_TEAM = 790 -- team yeu cau cs6 cap 80 KSGVN
ORB_MAX_TEAM_MEMBER = 6					-- ×é¶Ó±¨Ãû¶ÓÎéÈËÊýÉÏÏÞ


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
	name = "HiÖp Lé T­¬ng Phïng",
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
	[CAMP_SONG]    = "Tèng",
	[CAMP_LIAO]    = "Liªu",
}

CAMPIDX2NAME = {
	[CAMP_SONG]    = "Qu©n Tèng",
	[CAMP_LIAO]    = "Qu©n Liªu",
	[CAMP_NEUTRAL] = "Tèng Liªu",
	[CAMP_HFZ]     = "H¾c Phong Tr¹i",
}

CAMPIDX2OTHERCAMPIDX = {
	[CAMP_SONG] = CAMP_LIAO,
	[CAMP_LIAO] = CAMP_SONG,
};

--Ò»Ð©È«¾Ö±äÁ¿
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
	{"Thïng DÇu",		"Thïng DÇu",			1711,3643,	CAMP_SONG,"\\script\\missions\\one_road_battle\\npc\\bucket.lua"},
	{"Thïng DÇu",		"Thïng DÇu",			2373,2871,	CAMP_LIAO,"\\script\\missions\\one_road_battle\\npc\\bucket.lua"},
	{"Tèng-Qu©n Nhu Quan","Qu©n nhu quan",	1707,3647,	CAMP_SONG, "\\script\\missions\\one_road_battle\\npc\\quartermaster.lua"},
	{"Liªu-Qu©n Nhu Quan","Qu©n nhu quan",	2378,2867,	CAMP_LIAO, "\\script\\missions\\one_road_battle\\npc\\quartermaster.lua"},
	{"Tèng §µo Binh",		"§µo Binh",			1588,3696,	CAMP_SONG, "\\script\\missions\\one_road_battle\\npc\\soldier.lua"},
	{"Liªu §µo Binh",		"§µo Binh",			2403,2771,	CAMP_LIAO, "\\script\\missions\\one_road_battle\\npc\\soldier.lua"},
	{"Tèng-Thñ Thµnh T­íng",	"Thñ Thµnh T­íng",		1663,3704,	CAMP_SONG,},
	{"Liªu-Thñ Thµnh T­íng",	"Thñ Thµnh T­íng",		2396,2864,	CAMP_LIAO,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1723,3632,	CAMP_SONG,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1733,3644,	CAMP_SONG,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1748,3575,	CAMP_SONG,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1760,3589,	CAMP_SONG,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1782,3566,	CAMP_SONG,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1770,3553,	CAMP_SONG,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1849,3365,	CAMP_SONG,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1866,3363,	CAMP_SONG,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1852,3338,	CAMP_SONG,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1869,3342,	CAMP_SONG,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1877,3178,	CAMP_SONG,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1893,3176,	CAMP_SONG,},
	
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1759,3562,	CAMP_SONG,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1772,3577,	CAMP_SONG,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1767,3535,	CAMP_SONG,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1776,3541,	CAMP_SONG,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1791,3560,	CAMP_SONG,},
	{"Tèng-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		1800,3569,	CAMP_SONG,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		1739,3580,	CAMP_SONG,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		1759,3603,	CAMP_SONG,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		1724,3618,	CAMP_SONG,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		1745,3637,	CAMP_SONG,},

	{"Liªu-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		2352,2916,	CAMP_LIAO,},
	{"Liªu-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		2363,2934,	CAMP_LIAO,},
	{"Liªu-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		2331,2928,	CAMP_LIAO,},
	{"Liªu-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		2341,2938,	CAMP_LIAO,},
	{"Liªu-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		2307,2953,	CAMP_LIAO,},
	{"Liªu-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		2320,2965,	CAMP_LIAO,},
	{"Liªu-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		2192,3332,	CAMP_LIAO,},
	{"Liªu-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		2204,3340,	CAMP_LIAO,},
	{"Liªu-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		2227,3166,	CAMP_LIAO,},
	{"Liªu-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		2231,3161,	CAMP_LIAO,},
	{"Liªu-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		2225,3180,	CAMP_LIAO,},
	{"Liªu-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		2234,3182,	CAMP_LIAO,},
	{"Liªu-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		2319,2939,	CAMP_LIAO,},
	{"Liªu-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		2332,2952,	CAMP_LIAO,},
	{"Liªu-Thñ Thµnh VÖ",	"Thñ Thµnh VÖ",		2324,2993,	CAMP_LIAO,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		2300,2956,	CAMP_LIAO,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		2313,2974,	CAMP_LIAO,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		2346,2915,	CAMP_LIAO,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		2354,2938,	CAMP_LIAO,},
	
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		1779,3535,	CAMP_SONG,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		1795,3548,	CAMP_SONG,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		2288,2975,	CAMP_LIAO,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		2300,2991,	CAMP_LIAO,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		1773,3522,	CAMP_SONG,},
	-- {"³Ç·À³µ",		"³Ç·À³µ6",		1808,3534,	CAMP_SONG,},
	-- {"³Ç·À³µ",		"³Ç·À³µ7",		1791,3519,	CAMP_SONG,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		1805,3550,	CAMP_SONG,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		2277,2990,	CAMP_LIAO,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		2293,3013,	CAMP_LIAO,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		2312,3002,	CAMP_LIAO,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		2313,3026,	CAMP_LIAO,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		2309,3003,	CAMP_LIAO,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		2300,3022,	CAMP_LIAO,},
	{"Thµnh Phßng Xa",		"Thµnh Phßng Xa",		2265,2982,	CAMP_LIAO,},

	-- {"ÖÐÔ­´¢Îï¹ñ",	"ÎïÆ·±£¹ÜÔ±",	1639,3661,	CAMP_SONG, "\\script\\biwudahui\\npc\\npc_itemkeeper.lua"},
	-- {"ÖÐÔ­´¢Îï¹ñ",	"ÎïÆ·±£¹ÜÔ±",	2406,2891,	CAMP_LIAO, "\\script\\biwudahui\\npc\\npc_itemkeeper.lua"},
	-- {"ÖÐÔ­Ò©µêÕÆ¹ñ","Ò©µêÀÏ°å",		1646,3658,	CAMP_SONG, [[\script\Î÷ÄÏÇø\´óÀí¸®\npc\Ò©µêÀÏ°å.lua]]},
	-- {"ÖÐÔ­Ò©µêÕÆ¹ñ","Ò©µêÀÏ°å",		2418,2887,	CAMP_LIAO, [[\script\Î÷ÄÏÇø\´óÀí¸®\npc\Ò©µêÀÏ°å.lua]]},
	-- {"¶ëáÒÐ¡Ê¦½ã1",	"¶ëáÒÐ¡Ê¦½ã",	1652,3707,	CAMP_SONG,},
	-- {"¶ëáÒÐ¡Ê¦½ã2",	"¶ëáÒÐ¡Ê¦½ã",	1665,3719,	CAMP_SONG,},
	-- {"¶ëáÒÐ¡Ê¦½ã3",	"¶ëáÒÐ¡Ê¦½ã",	1660,3726,	CAMP_SONG,},
	-- {"¶ëáÒÐ¡Ê¦½ã4",	"¶ëáÒÐ¡Ê¦½ã",	1649,3710,	CAMP_SONG,},
	-- {"¶ëáÒÐ¡Ê¦½ã1",	"¶ëáÒÐ¡Ê¦½ã",	2401,2845,	CAMP_LIAO,},
	-- {"¶ëáÒÐ¡Ê¦½ã2",	"¶ëáÒÐ¡Ê¦½ã",	2412,2866,	CAMP_LIAO,},
	-- {"¶ëáÒÐ¡Ê¦½ã3",	"¶ëáÒÐ¡Ê¦½ã",	2422,2848,	CAMP_LIAO,},
	-- {"¶ëáÒÐ¡Ê¦½ã4",	"¶ëáÒÐ¡Ê¦½ã",	2410,2829,	CAMP_LIAO,},

};

TOWER_NPC = {
	{"Tèng-TiÔn Th¸p",	"TiÔn Th¸p-Tr­íc",	1964,3348,	CAMP_SONG, MV_TOWER_IDX_1},
	{"Tèng-TiÔn Th¸p",	"TiÔn Th¸p-Gi÷a",	1893,3429,	CAMP_SONG, MV_TOWER_IDX_2},
	{"Tèng-TiÔn Th¸p",	"TiÔn Th¸p-Sau",	1846,3482,	CAMP_SONG, MV_TOWER_IDX_3},
	{"Liªu-TiÔn Th¸p",	"TiÔn Th¸p-Tr­íc",	2109,3194,	CAMP_LIAO, MV_TOWER_IDX_5},
	{"Liªu-TiÔn Th¸p",	"TiÔn Th¸p-Gi÷a",	2180,3116,	CAMP_LIAO, MV_TOWER_IDX_6},
	{"Liªu-TiÔn Th¸p",	"TiÔn Th¸p-Sau",	2228,3062,	CAMP_LIAO, MV_TOWER_IDX_7},
	{"Cê Tèng",	"Cê Tèng",	1792,3536,	CAMP_SONG, MV_TOWER_IDX_4},
	{"Cê Liªu",	"Cê Liªu",	2281,3007,	CAMP_LIAO, MV_TOWER_IDX_8},
	
};

TOWER_GUARD_NPC = {
	{
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 1950,3336},
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 1972,3369},
	},
	{
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 1879,3423},
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 1873,3412},
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 1900,3445},
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 1907,3454},
		-- {"³Ç·À³µ", "³Ç·À³µ07", 1802,3511},
		-- {"³Ç·À³µ", "³Ç·À³µ08", 1810,3530},
		-- {"³Ç·À³µ", "³Ç·À³µ09", 1794,3513},
		-- {"³Ç·À³µ", "³Ç·À³µ010", 1817,3512},
	},
	{
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 1832,3474},
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 1825,3464},
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 1856,3499},
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 1865,3503},
	},
	{
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 2100,3164},
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 2124,3204},
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 2130,3217},
	},
	{
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 2172,3090},
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 2165,3078},
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 2195,3132},
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 2201,3138},
	},
	{
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 2219,3043},
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 2213,3035},
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 2242,3076},
		{"Thµnh Phßng Xa", "Thµnh Phßng Xa", 2250,3085},
	},
}

CHARIOT_NPC = {"HiÖp Lé ChiÕn Xa",	"ChiÕn Xa",	2029,3266,	CAMP_NEUTRAL, "\\script\\missions\\one_road_battle\\npc\\chariot.lua"};
CHARIOT_DEAD_NPC = {"ChiÕn Xa bÞ H¾c Phong Tr¹i chiÕm", "ChiÕn Xa bÞ H¾c Phong Tr¹i chiÕm","\\script\\missions\\one_road_battle\\npc\\chariot.lua"};
BOSS_NPC = {
	{"orb_hfzch",   "H¾c Phong Tr¹i Tam §­¬ng Gia TrÇn Háa",   50,  30, 100, {2, 97, 236,  5, 4}, "Thiªn Kiªu LÖnh", "HiÖp sÜ %s ®· kÕt liÔu Tam Gia H¾c Phong Tr¹i TrÇn Háa!"},
	{"orb_hfzdj",   "H¾c Phong Tr¹i NhÞ §­¬ng Gia §¹i KiÖt",   80,  60, 200, {2, 97, 236, 10, 4}, "Thiªn Kiªu LÖnh", "HiÖp sÜ %s ®· kÕt liÔu NhÞ Gia H¾c Phong Tr¹i §¹i KiÖt!"},
	{"orb_hfzzpy", "H¾c Phong Tr¹i §¹i §­¬ng Gia Chiªm Phiªn NghÜa", 100, 90, 500, {2, 97, 236, 15, 4}, "Thiªn Kiªu LÖnh", "HiÖp sÜ %s ®· kÕt liÔu §¹i Gia H¾c Phong Tr¹i Chiªm Phiªn NghÜa!"},
}

BOSS_SCRIPT = "\\script\\missions\\one_road_battle\\npc\\boss.lua";

BOSS_POS = {
	{1897, 3098},
	{2148, 3409},
};

BOSS_TALK = {
	"H¾c Phong Tr¹i Tam §­¬ng Gia TrÇn Háa: ta sÏ b¶o Thiªn H¹ biÕt , T©y Thôc §¹o ®ã lµ cña H¾c Phong Tr¹i tao!",
	"H¾c Phong Tr¹i NhÞ §­¬ng Gia §¹i KiÖt: kh«ng biÕt TrÇn Háa ®i ®©u råi, véi vµng thÕ mong kh«ng ¶nh h­ëng ®Õn viÖc tao.",
	"H¾c Phong Tr¹i §¹i §­¬ng Gia Chiªm Phiªn NghÜa: ®¸nh b¹i hä thËt kh«ng dÔ ®©u!hahaha,h«m nay H¾c Phong Tr¹i tao thËt lµ m¹nh vµ thuyÖt vêi.",
}

GUARD_NPC = {
	{"T­íng Thñ Thµnh ViÖn Qu©n-Tèng",	"Thñ Thµnh T­íng",},
	{"T­íng Thñ Thµnh ViÖn Qu©n-Liªu",	"Thñ Thµnh T­íng",},
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
	{"Qu¶ Thô", "C©y Cèi", "\\script\\missions\\one_road_battle\\npc\\obstalce.lua"},
	{"Hµng rµo", "Hµng rµo", "\\script\\missions\\one_road_battle\\npc\\obstalce.lua"},
};

OBSTACLE_NPC_POS = {
	--Ê÷Ä¾
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
	--Õ¤À¸
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

MONKEY_NPC = {"KhØ ¡n Trém",	"KhØ ¡n Trém"};
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

HFZ_CHARIOT_NPC = {"Xe C«ng Thµnh bÞ H¾c Phong Tr¹i chiÕm",	"Xe C«ng Thµnh bÞ H¾c Phong Tr¹i chiÕm",};
HFZ_CHARIOT_SCRIPT = "\\script\\missions\\one_road_battle\\npc\\hfz_chariot.lua";

HFZ_FISH_NPC      = {"H¾c Phong Tr¹i L©u La",	"H¾c Phong Tr¹i L©u La",};
HFZ_FISH_POS      = {{2033,3254},{2038,3269},{2034,3279},{2022,3277},{2033,3254},{2016,3264},};

HFZ_TALK_FISH_NPC = {"H¾c Phong Tr¹i L©u La 1",	"H¾c Phong Tr¹i L©u La",};
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

--·ÖÊý¼ÆËã·½·¨
POINT_KILL_PLAYER   = 1;
POINT_OWN_CHARIOT   = 1;
POINT_DESTORY_TOWER = 200;
POINT_GET_MONKEY    = 10;

--»îÔ¾¶È
ACTIVITY_NEED = 100;
ACTIVITY_MAX  = 600;
ACTIVITY_2_EXP = 15000; -- »îÔ¾¶ÈÄÜ»ñµÃµÄ¾­Ñé½±Àø±ÈÎª1:15000

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
	2000, --¸º
	2200, --Æ½
	3000, --Ê¤
}
ACTIVE_RATE_JUNGONG = 1.2; --»îÔ¾Íæ¼Ò¾ü¹¦±¶ÂÊ

T_AWARD_BASE_EXP = {
	200000000, --¸º
	200000000, --Æ½
	400000000, --Ê¤
}
ACTIVE_RATE_EXP = 1.2; --»îÔ¾Íæ¼Ò¾­Ñé±¶ÂÊ

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


--¸÷ÖÖÈÎÎñ±äÁ¿
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

--ÈõÊÆ±£»¤
WEEKNESS_BUFF = {
	"state_immune", "state_penetration", {{15, 15}, {30, 30}, {45,45},}, {"B¸o Thï Röa HËn", "Lèi Tho¸t", "Tø DiÖn Së Ca"},
};	

--Õ½³¡ÀïÃæµÄ¸÷ÖÖÌáÊ¾
MSG_TOWER_DESTORYED = {
	"%s ph¸ hñy tiÔn th¸p phÝa tr­íc",
	"%s ®· ph¸ hñy tiÔn th¸p trung qu©n, thÕ nh­ ph¸ tróc!",
	"%s ®· ph¸ hñy tiÔn th¸p béc hËu, s¾p giµnh chiÕn th¾ng!",
};
MSG_CHARIOT_RUN      = {
	"§­êng gÇn tiÔn th¸p tiÒn phong %s ®· th«ng, ChiÕn Xa cã thÓ tiÕp tôc tiÕn lªn.",
	"§­êng gÇn tiÔn th¸p trung qu©n %s ®· th«ng, ChiÕn Xa cã thÓ tiÕp tôc tiÕn lªn.",
	"§­êng gÇn tiÔn th¸p béc hËu %s ®· th«ng, ChiÕn Xa cã thÓ tiÕp tôc tiÕn lªn.",
};
MSG_TOWER_BE_ATTACKED = "%s ®ang tÊn c«ng %s - %s!";
MSG_FLAG_BE_ATTACKED  = "Qu©n %s ®ang tÊn c«ng cê qu©n %s!";
MSG_CREATE_MONKEY     = "VËt t­ qu©n dông bÞ bän khØ ®¸ng ghÐt trém, mau b¾t chóng!";
MSG_LOST_MONKEY       = "KhØ ®· bá trèn";
MSG_CATCH_MONKEY      = "HiÖp sÜ %s ®· ®o¹t l¹i vËt phÈm tõ KhØ ¡n Trém!";
MSG_CHARIOT_STOP      = "X¸c TiÔn Th¸o ch­a ®­îc dän dÑp, ChiÕn Xa kh«ng thÓ ®i ®­îc.";
MSG_KILL_BOSS         = "%s tÊn c«ng %s ®ßn cuèi, bÊt ngê tõ trªn ng­êi %s nhËn ®­îc %s.";
MSG_GET_ASSISTANT     = "B¹n nhËn ®­îc 1 lÇn trî c«ng.";

--Õ½³µ×´Ì¬
CHARIOT_STATE_MSG = {
	IDLE           = "ChiÕn Xa ®ang ®×nh trÖ...", --ÏÐÖÃ×´Ì¬
	ATTACKING_LIAO = "§ang tÊn c«ng Liªu Quèc %s...", --½ø¹¥ÁÉ¹ú
	ATTACKING_SONG = "§ang tÊn c«ng Tèng Quèc %s...", --½ø¹¥ËÎ¹ú
	CLEANING_LIAO  = "Xö lý Liªu Quèc %s ®­êng", --ÇåÀíÁÉ¹úµÀÂ·
	CLEANING_SONG  = "Xö lý Tèng Quèc %s ®­êng", --ÇåÀíËÎ¹úµÀÂ·
	OCCUPIED       = "BÞ H¾c Phong Tr¹i chiÕm", --±»ºÚ·çÕ¯Õ¼Áì
};

------------------------------------ Í³¼ÆÏà¹Ø ------------------------------------

RUNTIMEID_BattleStart = 1					--ÏÁÂ·Ïà·ê¿ªÆô³¡Êý
RUNTIMEID_PlayerJoinCount = 2				--ÏÁÂ·Ïà·ê²ÎÓëÍæ¼Ò
RUNTIMEID_EachRouterJoinCount = 3 			--ÏÁÂ·Ïà·ê¸÷Á÷ÅÉ²ÎÓëÊý
RUNTIMEID_EachRouterKillCount = 4			--ÏÁÂ·Ïà·ê¸÷Á÷ÅÉÉ±µÐÊý
RUNTIMEID_EachRouterDeathCount = 5 			--ÏÁÂ·Ïà·ê¸÷Á÷ÅÉËÀÍöÊý
RUNTIMEID_GetPersonalHonorCountByLevel = 6	--ÏÁÂ·Ïà·ê»ñÈ¡n¼¶Õ½Ñ«ÊýÁ¿
RUNTIMEID_GetTeamHonorCountByCamp = 7		--ÏÁÂ·Ïà·êXÕóÓª»ñÈ¡¼¯Ìå¹¦Ñ«ÊýÁ¿
RUNTIMEID_UseOilBomb = 8					--ÏÁÂ·Ïà·êÊ¹ÓÃÓÍÍ°ÊýÁ¿
RUNTIMEID_OldDriverWaitMe = 9				--ÏÁÂ·Ïà·ê²¹±¨ÃûÍæ¼ÒÊýÁ¿


-- ÓÃÓÚÊý¾ÝÍ³¼Æº¯Êý AddRuntimeStat( Orb_GetBattleTimeType(), x, x, x )£¬66±íÊ¾ÖÐÎç³¡Õ½³¡£¬67±íÊ¾ÍíÉÏ
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


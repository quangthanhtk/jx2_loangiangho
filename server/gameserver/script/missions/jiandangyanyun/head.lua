Include("\\settings\\static_script\\missions\\base\\phasebase.lua");
Include("\\settings\\static_script\\missions\\base\\mission_head.lua");
Include("\\settings\\static_script\\missions\\base\\missionbase.lua");
Include("\\settings\\static_script\\missions\\base\\mission_settings.lua");
Include("\\settings\\static_script\\misc\\data_state\\state.lua")
Import("\\script\\lib\\define.lua");

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

thisFile = "\\script\\missions\\jiandangyanyun\\mission.lua";

MISSION_ID = 86;

JDYY_TSK_DC_ENTER = 3465;
JDYY_ENTER_LIMIT = g_WCFG_KIEMDANGYENVAN.nLimitJoinDaily;--goc 5;

eDifType = {
	["NORMAL"] = 1,
	["HARD"] = 2,
};

tOptions = {
	[eDifType.NORMAL] = {
		["MemberNum"]		= {g_WCFG_KIEMDANGYENVAN.nTeamMemberMinReq, 8},
		["MemberRouteNum"]	= {g_WCFG_KIEMDANGYENVAN.nTeamMemberMinReq, 8},
		["MemberLevel"]		= {0, 999},
		["MemberHaveRoute"] = 1,
		["RoomWeight"]		= {1, 10},
		["PKValue"]			= {0, 9},
	},
	[eDifType.HARD] = {
		["MemberNum"]		= {g_WCFG_KIEMDANGYENVAN.nTeamMemberMinReq, 8},
		["MemberRouteNum"]	= {g_WCFG_KIEMDANGYENVAN.nTeamMemberMinReq, 8},
		["MemberLevel"]		= {0, 999},
		["MemberHaveRoute"]	= 1,
		["RoomWeight"]		= {1, 10},
		["PKValue"]			= {0, 9},
	},
};

tJDYY = {
--	name = "½£µ´ÑàÔÆ",
--	missionID = 70,
--	realMapID = 8011,
--	dynamicMap = 1,
	
	----------------------------
	MAP_ID = 19,
	
	mv_01 = 1,
	mv_02 = 2,
	mv_03 = 3,
	
	mv_19 = 19,
	mv_20 = 20,
	mv_21 = 21,
	mv_22 = 22,
	mv_23 = 23,
	mv_24 = 24,
	mv_25 = 25,
	mv_26 = 26,
	mv_27 = 27,
	mv_28 = 28,
	mv_29 = 29,
	mv_30 = 30,
	mv_31 = 31,
	mv_32 = 32,
	mv_33 = 33,
	mv_34 = 34,
	mv_35 = 35,
	mv_36 = 36,
	mv_37 = 37,
	mv_38 = 38,
	mv_39 = 39,
	mv_40 = 40,
	mv_41 = 41,
	mv_42 = 42,
	
	MS_STAGE = 1,
	ms_02 = 2,
};

tPhaseDriver = {
--	timerID = 120,
	maxsecond = 60*60,
};

--tPhaseDriver = gf_CopyInherit(phaseBase, tPhaseDriver, msSettings:GetPhaseSettings(MISSION_ID));

tMapCountLimit = {
	[eDifType.NORMAL] = 30,
	[eDifType.HARD] = 30,
};

szCamp_1 = "xsc_boss";
szCamp_2 = "xsc_tianyinsiwei";

tNpcs = {
	jjg = {"Thanh Thanh C« N­¬ng", "Thanh Thanh C« N­¬ng", "\\script\\missions\\jiandangyanyun\\npcs\\jjg_npc.lua", CampPlayer},
	qy 	= {"Thanh Diªn", "Thanh Diªn", thisFile, CampPlayer},
	smr = {"YÕn V©n Hoµn Nhan A Cèt §¶", "Ng­êi thÇn bÝ", thisFile, CampPlayer},
	zr 	= {"Háa ThÇn Chóc Dung", "Háa ThÇn Chóc Dung", thisFile, CampEnemy},
	hsy = {"Hé Tèng H¾c DÇu Thiªn ¢m Gi¸o", "Hé Tèng H¾c DÇu Thiªn ¢m Gi¸o", thisFile, CampEnemy},
	tny = {"YÕn V©n §­êng Léng NguyÖt", "§­êng Léng NguyÖt", thisFile, CampPlayer},
	yy	= {"ThuÊn ThÇn D¹ Oanh", "ThuÊn ThÇn D¹ Oanh", thisFile, CampEnemy},
	lwq = {"L¹c Hµ Tiªn Tö L¨ng UyÓn Thu", "L¹c Hµ Tiªn Tö L¨ng UyÓn Thu", thisFile, CampPlayer},
	syy = {"NiÕt Bµn T«n Gi¶ T« Y Y", "NiÕt Bµn T«n Gi¶ T« Y Y", thisFile, CampEnemy},
	shx = {"T« TuÖ Nhµn", "T« TuÖ Nhµn", thisFile, CampEnemy},
	fj 	= {"Ph­¬ng Th¾ng", "Ph­¬ng Th¾ng", thisFile, CampEnemy},
	smmf= {"T­ M· Minh Phong", "T­ M· Minh Phong", thisFile, CampPlayer},
	tbh	= {"Th¸c B¹t Ho»ng ", "Th¸c B¹t Ho»ng ", thisFile, CampPlayer},
	sl 	= {"V« L­îng Minh V­¬ng Sa La", "V« L­îng Minh V­¬ng Sa La", thisFile, CampEnemy},
	lf 	= {"Hoa Th¸nh L¹c Phi", "Hoa Th¸nh L¹c Phi", thisFile, CampPlayer},
	hy 	= {"Hång Ên Gi¸o Chñ", "Hång Ên Gi¸o Chñ", thisFile, CampEnemy},
};

tNpcs_NORMAL = {
	zr 	= {"Háa ThÇn Chóc Dung-Th­êng", "Háa ThÇn Chóc Dung", thisFile, CampEnemy},
	hsy = {"Hé Tèng H¾c DÇu Thiªn ¢m Gi¸o-Th­êng", "Hé Tèng H¾c DÇu Thiªn ¢m Gi¸o", thisFile, CampEnemy},
	yy	= {"ThuÊn ThÇn D¹ Oanh-Th­êng", "ThuÊn ThÇn D¹ Oanh", thisFile, CampEnemy},
	syy = {"NiÕt Bµn T«n Gi¶ T« Y Y-Th­êng", "NiÕt Bµn T«n Gi¶ T« Y Y", thisFile, CampEnemy},
	shx = {"T« TuÖ Nhµn-Th­êng", "T« TuÖ Nhµn", thisFile, CampEnemy},
	fj 	= {"Ph­¬ng Th¾ng-Th­êng", "Ph­¬ng Th¾ng", thisFile, CampEnemy},
	sl 	= {"V« L­îng Minh V­¬ng Sa La-Th­êng", "V« L­îng Minh V­¬ng Sa La", thisFile, CampEnemy},
	hy 	= {"Hång Än Gi¸o Chñ-Th­êng", "Hång Ên Gi¸o Chñ", thisFile, CampEnemy},
};

tNpcs_CHEAT = {
	zr 	= {"Háa ThÇn Chóc Dung-Sao chÐp", "Háa ThÇn Chóc Dung", thisFile, CampEnemy},
	yy	= {"ThuÊn ThÇn D¹ Oanh-Sao chÐp", "ThuÊn ThÇn D¹ Oanh", thisFile, CampEnemy},
	syy = {"NiÕt Bµn T«n Gi¶ T« Y Y-Sao chÐp", "NiÕt Bµn T«n Gi¶ T« Y Y", thisFile, CampEnemy},
	sl 	= {"V« L­îng Minh V­¬ng Sa La-Sao chÐp", "V« L­îng Minh V­¬ng Sa La", thisFile, CampEnemy},
	hy 	= {"Hång Än Gi¸o Chñ-Sao chÐp", "Hång Ên Gi¸o Chñ", thisFile, CampEnemy},
};

tNpcPos = {
	qy 	= {
		["01_1"] = {{1580, 3319}, },
	},
	smr = {
		["01_1"] = {{1553, 3255}, },
	},
	zr 	= {
		["01_2_2"] = {{1586, 3336}, },
		["06_2_2"] = {{1692, 3699}, },
	},
	tny = {
		["02_1"] = {{1559, 3415}, },
	},
	yy 	= {
		["02_2_2"] = {{1557, 3431}, },
		["06_2_2"] = {{1695, 3712}, },
	},
	lwq = {
		["03_1"] = {{1629, 3529}, },
	},
	syy = {
		["03_2_2"] = {{1617, 3543}, },	--{1603, 3560}, 
		["06_2_2"] = {{1702, 3706}, },
	},
	shx = {
		["03_2_2"] = {{1628, 3530}, },	--{1622, 3523},
		["06_2_2"] = {{1706, 3720}, },
	},
	fj	= {
		["03_2_2"] = {{1629, 3510}, },	--{1660, 3489},
		["06_2_2"] = {{1695, 3712}, },
	},
	smmf = {
		["04_1"] = {{1679, 3576}, },
	},
	sl	= {
		["04_1"] = {{1692, 3591}, },
		["06_2_2"] = {{1705, 3727}, },
	},
	tbh	= {
		["04_2_2"] = {{1679, 3625}, },
		["06_2_2"] = {{1698, 3706}, },
	},
	lf	= {
		["05_1"] = {{1708, 3681}, },
		["06_1"] = {{1708, 3681}, },
		["05_2_3"] = {{1708, 3681}, },
	},
	hy	= {
		["05_2_1"] = {{1696, 3700}, },
		["05_2_2"] = {{1696, 3700}, },
		["05_2_3"] = {{1696, 3700}, },
		["06_2_2"] = {{1703, 3712}, },
	},
	jjg = {
		[0] = {{1706, 3245}, },
	},
};

tPlayerPos = {
	["01"] = {{1580, 3317}, },
	["02"] = {{1563, 3409}, },
	["03"] = {{1614, 3510}, },
	["04"] = {{1676, 3577}, },
	["05"] = {{1707, 3680}, },
	["06"] = {{1707, 3680}, },
};

tTrapResetPos = {
	["01_2_2"] = {1587, 3336},
	["02_2_2"] = {1562, 3430},
	["03_2_2"] = {1629, 3530},
	["04_2_2"] = {1689, 3589},
	["05_2_2"] = {1705, 3713},
	["06_2_2"] = {1705, 3713},
};

tTrapPoints = {
	["01_2_2"] = {{{1565, 3399}, {1576, 3385}}, {{1570, 3281}, {1574, 3309}}, {{1582, 3301}, {1565, 3285}}, },
	["02_2_2"] = {{{1589, 3471}, {1606, 3494}}, {{1565, 3399}, {1576, 3385}}},
	["03_2_2"] = {{{1652, 3566}, {1669, 3563}}, {{1589, 3471}, {1606, 3494}}},
	["04_2_2"] = {{{1712, 3667}, {1724, 3652}}, {{1666, 3604}, {1678, 3637}}, {{1727, 3608}, {1708, 3634}}, {{1652, 3566}, {1669, 3563}}},
	["05_2_2"] = {{{1718, 3650}, {1714, 3678}}, {{1709, 3671}, {1724, 3652}}},
	["06_2_2"] = {{{1718, 3650}, {1714, 3678}}, {{1709, 3671}, {1724, 3652}}},
};

tTaskIDs = {
	[eDifType.HARD] = {
		["01"] = {TASKID_JDYY_HARD_CARD_TIME_BOSS_1_DAILY, 10},
		["02"] = {TASKID_JDYY_HARD_CARD_TIME_BOSS_2_DAILY, 10},
		["03"] = {TASKID_JDYY_HARD_CARD_TIME_BOSS_3_DAILY, 10},
		["04"] = {TASKID_JDYY_HARD_CARD_TIME_BOSS_4_DAILY, 10},
		["05"] = {TASKID_JDYY_HARD_CARD_TIME_BOSS_5_DAILY, 10},
	},
	[eDifType.NORMAL] = {
		["01"] = {TASKID_JDYY_NORMAL_CARD_TIME_BOSS_1_DAILY, 40},
		["02"] = {TASKID_JDYY_NORMAL_CARD_TIME_BOSS_2_DAILY, 40},
		["03"] = {TASKID_JDYY_NORMAL_CARD_TIME_BOSS_3_DAILY, 40},
		["04"] = {TASKID_JDYY_NORMAL_CARD_TIME_BOSS_4_DAILY, 40},
		["05"] = {TASKID_JDYY_NORMAL_CARD_TIME_BOSS_5_DAILY, 40},
	},
};

--µØÍ¼ÉÏÒÑ¾­´´½¨³öµÄNPC»º´æ
tExistNpcList = {
--	[nMapId] = {
--		{szName, nNpcIdx},
--	},
};

tList = {
	[2 ] = "ThiÕu L©m §ao",
	[3 ] = "ThiÕu L©m Tr­îng",
	[4 ] = "ThiÕu L©m QuyÒn",
	[6 ] = "§­êng M«n",
	[8 ] = "Nga My PhËt gia",
	[9 ] = "Nga My tôc gia",
	[11] = "C¸i Bang QuyÒn",
	[12] = "C¸i Bang Bæng",
	[14] = "Vâ §ang KiÕm",
	[15] = "Vâ §ang Bót",
	[17] = "D­¬ng Gia Th­¬ng",
	[18] = "D­¬ng Gia Cung",
	[20] = "HiÖp §éc",
	[21] = "Cæ S­",
	[23] = "C«n L«n",
	[25] = "Th¸nh ChiÕn",
	[26] = "TrËn Binh",
	[27] = "HuyÕt Nh©n",
	[29] = "Vò Tiªn",
	[30] = "Linh N÷",
	[31] = "§­êng M«n NhËm HiÖp",
	[32] = "C«n L«n KiÕm T«n",
};

tDataStateList = {
	["yanyun_cheat"] = 1,
	["yanyun_easy_open_1"] = 2,
	["yanyun_easy_over_1"] = 3,
	["yanyun_easy_open_2"] = 4,
	["yanyun_easy_over_2"] = 5,
	["yanyun_easy_open_3"] = 6,
	["yanyun_easy_over_3"] = 7,
	["yanyun_easy_open_4"] = 8,
	["yanyun_easy_over_4"] = 9,
	["yanyun_easy_open_5"] = 10,
	["yanyun_easy_over_5"] = 11,
	["yanyun_hard_open_1"] = 12,
	["yanyun_hard_over_1"] = 13,
	["yanyun_hard_open_2"] = 14,
	["yanyun_hard_over_2"] = 15,
	["yanyun_hard_open_3"] = 16,
	["yanyun_hard_over_3"] = 17,
	["yanyun_hard_open_4"] = 18,
	["yanyun_hard_over_4"] = 19,
	["yanyun_hard_open_5"] = 20,
	["yanyun_hard_over_5"] = 21,
	["yanyun_easy_free"] = 22,
	["yanyun_easy_ib"] = 23,
	["yanyun_hard_free"] = 24,
	["yanyun_hard_ib"] = 25,
	["yanyun_easy_participate_1"] = 26,
	["yanyun_easy_participate_2"] = 27,
	["yanyun_easy_participate_3"] = 28,
	["yanyun_easy_participate_4"] = 29,
	["yanyun_easy_participate_5"] = 30,
	["yanyun_xuanyin"] = 31,
	["yanyun_zhenyang"] = 32,
};

tGodStates	= {
	tInfo	= {"Ch©n Thiªn ThÇn h¹ phµm", 5},
	tState	= {
		[1] = {9920, "state_life_max_percent_add",				1000,	"Sinh lùc t¨ng tèi ®a 10 lÇn"},
		-- [2] = {9921, "state_destiny_point_add",		1000,	"´óÁ¿Ìá¸ßÌìÃüÊôÐÔ"},
		[2] = {9921, "state_critical_point_increase",			10,		"t¨ng b¹o kÝch"},
		[3] = {9922, "state_critical_damage_increase",		50,		"t¨ng s¸t th­¬ng b¹o kÝch"},
		[4] = {9923, "state_def_critical_point_increase",		10,		"t¨ng phßng thï b¹o kÝch"},
		[5] = {9924, "state_def_critical_damage_increase",		10,		"t¨ng gi¶m th­¬ng b¹o kÝch"},
		[6] = {9925, "state_immune",							100,	"Tr¹ng th¸i miÔn dÞch  "},
	},
}

tDeathPos = {1695, 3250};
tExitPos  = {1331, 2837};

this = msSettings:LoadHead(MISSION_ID);
this = inherit(tJDYY, this);

tTaskID = {
	["ConsumeTaskID"] = {
		[eDifType.NORMAL] = TASKID_JDYY_CONSUME_1,
		[eDifType.HARD] = TASKID_JDYY_CONSUME_2,
	},
};

tAdvancedPrize = {
	{"HuyÒn ¢m LÖnh", {2,95,1500,8 }, 0.25*100000},
	{"Ch©n D­¬ng BÝch", {2,95,1501,8 }, 0.25*100000},
	{"HuyÒn ¢m LÖnh", {2,95,1500,6 }, 0.15*100000},
	{"Ch©n D­¬ng BÝch", {2,95,1501,6 }, 0.15*100000},
	{"HuyÒn ¢m LÖnh", {2,95,1500,10}, 0.1*100000},
	{"Ch©n D­¬ng BÝch", {2,95,1501,10}, 0.1*100000},
};

tPrize = {
	[1] = {	--Ãâ·Ñ
		[1] = {		--ÆÕÍ¨
			{"Bång Lai Tiªn D­îc"			,{2,95,1503,1},  	10.00*1000},
			{"Tói Ng©n L­îng"			,{2,95,649,2},  	5.00*1000},
			{"Tói Ng©n L­îng"			,{2,95,649,1},  	5.00*1000},
			{"Tói Ng©n L­îng"			,{2,95,649,3},  	10.00*1000},
			{"Tói Ng©n L­îng"			,{2,95,649,9},  	1.78 *1000},
			{"Tói Ng©n L­îng"			,{2,95,649,99},  	0.20 *1000},
			{"Tói Ng©n L­îng"			,{2,95,649,999},  	0.02 *1000},
			{"M¶nh Ngo¹i Trang ?m Hån L­u Kim"	,{2,95,1515,1},  	0.00 *1000},
			{"M¶nh Ngo¹i Trang ?m Hån L­u Kim"	,{2,95,1515,4},  	0.00 *1000},
			{"M¶nh Ngo¹i Trang ?m Hån L­u Kim"	,{2,95,1515,25},  	0.00 *1000},
			{"M¶nh Hång Hoang"			,{2,95,1506,1},  	14.00*1000},
			{"M¶nh Hång Hoang"			,{2,95,1506,2},  	9.00 *1000},
			{"M¶nh Hång Hoang"			,{2,95,1506,5},  	5.00 *1000},
			{"LiÖt Vò Th¹ch"			,{2,1,10012,1},  	1.00*1000},
			{"M¶nh §¸ Kü N¨ng"		,{2,1,10011,5},  	25.00*1000},
			{"M¶nh §¸ Kü N¨ng"		,{2,1,10011,20}, 	10.00 *1000},
			{"M¶nh §¸ Kü N¨ng"		,{2,1,10011,100},  	2.00 *1000},
			{"Quang Vâ HuyÒn thiÕt"			,{2,114,3,1},  		1.00 *1000},
			{"Quang Vâ HuyÒn Th¹ch"			,{2,114,106,1},  	1.00 *1000},
		},
		[2] = {		--Ó¢ÐÛ
			{"Tói Ng©n L­îng", 				{2,95,649,3}, 		7.00*1000},
			{"Tói Ng©n L­îng", 				{2,95,649,9}, 		3.30*1000},
			{"Tói Ng©n L­îng", 				{2,95,649,99}, 		0.71 *1000},
			{"Tói Ng©n L­îng", 				{2,95,649,999},		0.01 *1000},
			{"M¶nh Ngo¹i Trang ?m Hån L­u Kim", 	{2,95,1515,1}, 		12.00*1000},
			{"M¶nh Ngo¹i Trang ?m Hån L­u Kim", 	{2,95,1515,4}, 		6.00 *1000},
			{"M¶nh Ngo¹i Trang ?m Hån L­u Kim", 	{2,95,1515,25}, 	2.78 *1000},
			{"PhiÕu Kim §·ng YÕn V©n", 		{2,95,1512,1}, 		3.00 *1000},
			{"M¶nh Hång Hoang", 			{2,95,1506,1}, 		10.00*1000},
			{"M¶nh Hång Hoang", 			{2,95,1506,2}, 		9.00 *1000},
			{"M¶nh Hång Hoang",		 	{2,95,1506,5}, 		5.00 *1000},
			{"LiÖt Vò Th¹ch",		 		{2,1,10012,1}, 		10.00*1000},
			{"M¶nh §¸ Kü N¨ng",			{2,1,10011,100},  	15.00*1000},
			{"§¸ Kü N¨ng CÊp 1",			{2,22,1,1}, 	 	5.00 *1000},
			{"§¸ Kü N¨ng CÊp 2",			{2,22,2,1},  		1.00 *1000},
			{"§¸ Kü N¨ng CÊp 3",			{2,22,3,1},  		0.20 *1000},
			{"Quang Vâ HuyÒn thiÕt",			{2,114,3,1},  		10.00 *1000},
			{"Quang Vâ HuyÒn Th¹ch",			{2,114,106,1},  	10.00 *1000},
		},
	},
	[2] = {			--¸¶·Ñ
		[1] = {		--Íâ´«
			{"HuyÒn ¢m LÖnh", 				{2,95,1500,10}, 	0.0450 * 1000, 1},
			{"Ch©n D­¬ng BÝch", 				{2,95,1501,10}, 	0.0450 * 1000, 1},
			{"HuyÒn ¢m LÖnh", 				{2,95,1500,8}, 		0.0750 * 1000, 1},
			{"Ch©n D­¬ng BÝch", 				{2,95,1501,8}, 		0.0750 * 1000, 1},
			{"HuyÒn ¢m LÖnh", 				{2,95,1500,6}, 		0.0300 * 1000, 1},
			{"Ch©n D­¬ng BÝch", 				{2,95,1501,6}, 		0.0300 * 1000, 1},
			{"HuyÒn ¢m LÖnh", 				{2,95,1500,2}, 		0.0600 * 1000, 1},
			{"Ch©n D­¬ng BÝch", 				{2,95,1501,2}, 		0.0600 * 1000, 1},
			{"HuyÒn ¢m LÖnh", 				{2,95,1500,1}, 		0.2000 * 1000, 1},
			{"Ch©n D­¬ng BÝch", 				{2,95,1501,1}, 		0.2000 * 1000, 1},
			{"§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch-Nhá", 		{2,1,1067 ,1}, 		0.0750 * 1000, 1},
			{"§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", 		{2,1,1113 ,1}, 		0.0250 * 1000, 1},
--			{"»Æ½ð»¢ÎÆ¿¨", 			{2,100,9  ,1}, 		0.2500 * 1000, 1},
			{"Thiªn BiÕn Ph¹m Thiªn QuyÓn", 			{2,95,247 ,1}, 		0.5000 * 1000, 1},
			{"Nh©n S©m v¹n n¨m", 			{2,0,796  ,1}, 		0.5000 * 1000, 1},
			{"Thiªn Th¹ch Tinh Th¹ch", 			{2,1,1009 ,1}, 		4.0000 * 1000, 1},
			{"PhiÕu Thiªn BiÕn Phµn Tinh", 			{2,95,246 ,1}, 		2.5000 * 1000},
			{"Bao m¶nh Thiªn Th¹ch", 		{2,1,1049 ,1}, 		0.1500 * 1000},
			{"§¹i Nh©n s©m", 			{2,0,553  ,1}, 		1.0000 * 1000},
			{"Ngò S¾c Th¸i NhiÔm", 			{2,201,13 ,5}, 		0.2500 * 1000, 1},
			{"Ngò S¾c Th¸i NhiÔm", 			{2,201,13 ,1}, 		2.5000 * 1000, 1},
			{"Ph­îng V¨n Kh¾c B¶n [Y phôc cÊp 3]", {2,95,591 ,1}, 		0.5000 * 1000, 1},
			{"Hæ V¨n Kh¾c B¶n [H¹ trang cÊp 3]", {2,95,594 ,1}, 		0.5000 * 1000, 1},
			{"Long V¨n Kh¾c B¶n [§Çu cÊp 3]", {2,95,588 ,1}, 		0.5000 * 1000, 1},
			{"Hoa V¨n Kh¾c B¶n [Trang søc cÊp 3]", {2,95,597 ,1}, 		1.0000 * 1000, 1},
			{"Tói Ng©n L­îng", 				{2,95,649 ,4}, 		20.1800* 1000},
			{"Bång Lai Tiªn D­îc", 			{2,95,1503,2}, 		6.0000 * 1000},
			{"TiÓu Thiªn Th¹ch Bao", 			{2,95,221 ,1}, 		5.0000 * 1000},
			{"b¸nh Ýt B¸c B¶o", 			{2,1,1125 ,1}, 		5.5000 * 1000},
			{"Cöu ChuyÓn Hoµn Hån §an", 			{1,0,32   ,1}, 		6.0000 * 1000},
			{"Tam DiÖu Long Hi_§o¹n Giao", 		{2,1,1260 ,5}, 		5.0000 * 1000},
			{"Tam DiÖu Long Hi_C¸i ThÕ", 		{2,1,1261 ,5}, 		5.0000 * 1000},
			{"TiÓu Bao L­u Kim", 			{2,95,665 ,1}, 		2.5000 * 1000},
			{"TiÓu Thiªn Th¹ch Bao", 			{2,95,221 ,1}, 		8.0000 * 1000},
			{"M¶nh Hång Hoang", 			{2,95,1506,1}, 		15.0000* 1000},
			{"M¶nh Hång Hoang", 			{2,95,1506,2}, 		5.0000 * 1000},
			{"M¶nh Hång Hoang", 			{2,95,1506,5}, 		2.0000 * 1000},
			{"M¶nh Ngo¹i Trang ?m Hån L­u Kim", 	{2,95,1515,1}, 		0.0000 * 1000},
			{"M¶nh Ngo¹i Trang ?m Hån L­u Kim", 	{2,95,1515,4}, 		0.0000 * 1000},
			{"M¶nh Ngo¹i Trang ?m Hån L­u Kim	", 	{2,95,1515,25}, 	0.0000 * 1000},
		},
		[2] = {		--IB
			{"HuyÒn ¢m LÖnh", 				{2,95,1500,10}, 	0.0450 * 1000, 1},
			{"Ch©n D­¬ng BÝch", 				{2,95,1501,10}, 	0.0450 * 1000, 1},
			{"HuyÒn ¢m LÖnh", 				{2,95,1500,8 }, 	0.0750 * 1000, 1},
			{"Ch©n D­¬ng BÝch", 				{2,95,1501,8 }, 	0.0750 * 1000, 1},
			{"HuyÒn ¢m LÖnh", 				{2,95,1500,6 }, 	0.0300 * 1000, 1},
			{"Ch©n D­¬ng BÝch", 				{2,95,1501,6 }, 	0.0300 * 1000, 1},
			{"HuyÒn ¢m LÖnh", 				{2,95,1500,2 }, 	0.0600 * 1000, 1},
			{"Ch©n D­¬ng BÝch", 				{2,95,1501,2 }, 	0.0600 * 1000, 1},
			{"HuyÒn ¢m LÖnh", 				{2,95,1500,1 }, 	0.2000 * 1000, 1},
			{"Ch©n D­¬ng BÝch", 				{2,95,1501,1 }, 	0.2000 * 1000, 1},
			{"§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", 		{2,1,1067 ,1 }, 	0.0250 * 1000, 1},
			{"Bao Thiªn Th¹ch", 			{2,1,1050 ,1 }, 	0.1500 * 1000, 1},
			{"Thiªn BiÕn Ph¹m Thiªn QuyÓn", 			{2,95,247 ,1 }, 	0.5000 * 1000, 1},
			{"Nh©n S©m v¹n n¨m", 			{2,0,796  ,1 }, 	0.2500 * 1000, 1},
			{"Thiªn Th¹ch Tinh Th¹ch", 			{2,1,1009 ,1 }, 	4.0000 * 1000, 1},
			{"PhiÕu Thiªn BiÕn Phµn Tinh", 			{2,95,246 ,1 }, 	2.5000 * 1000},
			{"Bao m¶nh Thiªn Th¹ch", 		{2,1,1049 ,1 }, 	0.1500 * 1000},
			{"§¹i Nh©n s©m", 			{2,0,553  ,1 }, 	1.0000 * 1000},
			{"Ngò S¾c Th¸i NhiÔm", 			{2,201,13 ,5 }, 	0.2500 * 1000, 1},
			{"Ngò S¾c Th¸i NhiÔm", 			{2,201,13 ,1 }, 	2.5000 * 1000, 1},
			{"Ph­îng V¨n Kh¾c B¶n [Y phôc cÊp 3]", {2,95,591 ,1 }, 	0.5000 * 1000, 1},
			{"Hæ V¨n Kh¾c B¶n [H¹ trang cÊp 3]", {2,95,594 ,1 }, 	0.5000 * 1000, 1},
			{"Long V¨n Kh¾c B¶n [§Çu cÊp 3]", {2,95,588 ,1 }, 	0.5000 * 1000, 1},
			{"Hoa V¨n Kh¾c B¶n [Trang søc cÊp 3]", {2,95,597 ,1 }, 	1.0000 * 1000, 1},
			{"Tói Ng©n L­îng", 				{2,95,649 ,4 }, 	30.1000* 1000},
			{"Bång Lai Tiªn D­îc", 			{2,95,1503,2 }, 	6.0000 * 1000},
			{"TiÓu Thiªn Th¹ch Bao", 			{2,95,221 ,1 }, 	5.0000 * 1000},
			{"b¸nh Ýt B¸c B¶o", 			{2,1,1125 ,1 }, 	5.5000 * 1000},
			{"Cöu ChuyÓn Hoµn Hån §an", 			{1,0,32   ,1 }, 	6.0000 * 1000},
			{"B¸ch Hoa ThËp CÈm NguyÖt", 			{1,0,292  ,1 }, 	0.2500 * 1000},
			{"TiÓu Bao L­u Kim", 			{2,95,665 ,1 }, 	2.5000 * 1000},
			{"TiÓu Thiªn Th¹ch Bao", 			{2,95,221 ,1 }, 	8.0000 * 1000},
			{"M¶nh Hång Hoang", 			{2,95,1506,1 }, 	15.0000* 1000},
			{"M¶nh Hång Hoang", 			{2,95,1506,2 }, 	5.0000 * 1000},
			{"M¶nh Hång Hoang", 			{2,95,1506,5 }, 	2.0000 * 1000},
			{"M¶nh Ngo¹i Trang ?m Hån L­u Kim", 	{2,95,1515,1 }, 	0.0000 * 1000},
			{"M¶nh Ngo¹i Trang ?m Hån L­u Kim", 	{2,95,1515,4 }, 	0.0000 * 1000},
			{"M¶nh Ngo¹i Trang ?m Hån L­u Kim", 	{2,95,1515,25}, 	0.0000 * 1000},
		},
		[3] = {		--PAY
			{"HuyÒn ¢m LÖnh", 						{2,95,1500,10}, 	0.0450 * 1000, 1},
			{"Ch©n D­¬ng BÝch", 						{2,95,1501,10}, 	0.0450 * 1000, 1},
			{"HuyÒn ¢m LÖnh", 						{2,95,1500,8 }, 	0.0750 * 1000, 1},
			{"Ch©n D­¬ng BÝch", 						{2,95,1501,8 }, 	0.0750 * 1000, 1},
			{"HuyÒn ¢m LÖnh", 						{2,95,1500,6 }, 	0.0300 * 1000, 1},
			{"Ch©n D­¬ng BÝch", 						{2,95,1501,6 }, 	0.0300 * 1000, 1},
			{"HuyÒn ¢m LÖnh", 						{2,95,1500,2 }, 	0.0600 * 1000, 1},
			{"Ch©n D­¬ng BÝch", 						{2,95,1501,2 }, 	0.0600 * 1000, 1},
			{"HuyÒn ¢m LÖnh", 						{2,95,1500,1 }, 	0.2000 * 1000, 1},
			{"Ch©n D­¬ng BÝch", 						{2,95,1501,1 }, 	0.2000 * 1000, 1},
			{"Thiªn C¬ B¶o Lôc", 					{2,1,2645 ,1 }, 	0.7500 * 1000},
			{"Thiªn BiÕn Ph¹m Thiªn QuyÓn", 					{2,95,247 ,1 }, 	0.5000 * 1000, 1},
			{"Nh©n S©m v¹n n¨m", 					{2,0,796  ,1 }, 	0.3000 * 1000, 1},
			{"PhiÕu Thiªn BiÕn Phµn Tinh", 					{2,95,246 ,1 }, 	2.5000 * 1000},
			{"§¹i Nh©n s©m", 					{2,0,553  ,1 }, 	1.1000 * 1000},
			{"Ngò S¾c Th¸i NhiÔm", 					{2,201,13 ,5 }, 	0.2500 * 1000, 1},
			{"Ngò S¾c Th¸i NhiÔm", 					{2,201,13 ,1 }, 	2.5000 * 1000, 1},
			{"Ph­îng V¨n Kh¾c B¶n [Y phôc cÊp 3]", 		{2,95,591 ,1 }, 	0.5000 * 1000, 1},
			{"Hæ V¨n Kh¾c B¶n [H¹ trang cÊp 3]", 		{2,95,594 ,1 }, 	0.5000 * 1000, 1},
			{"Long V¨n Kh¾c B¶n [§Çu cÊp 3]", 		{2,95,588 ,1 }, 	0.5000 * 1000, 1},
			{"Hoa V¨n Kh¾c B¶n [Trang søc cÊp 3]", 		{2,95,597 ,1 }, 	1.0000 * 1000, 1},
			{"Tói Ng©n L­îng", 						{2,95,649 ,4 }, 	30.0000* 1000},
			{"Bång Lai Tiªn D­îc", 					{2,95,1503,2 }, 	6.0000 * 1000},
			{"TiÓu Thiªn Th¹ch Bao", 					{2,95,221 ,1 }, 	5.0000 * 1000},
			{"b¸nh Ýt B¸c B¶o", 					{2,1,1125 ,1 }, 	5.5000 * 1000},
			{"Cöu ChuyÓn Hoµn Hån §an", 					{1,0,32   ,1 }, 	6.0000 * 1000},
			{"B¸ch Hoa ThËp CÈm NguyÖt", 					{1,0,292  ,1 }, 	0.2500 * 1000},
			{"TiÓu Bao L­u Kim", 					{2,95,665 ,1 }, 	2.5000 * 1000},
			{"TiÓu Thiªn Th¹ch Bao", 					{2,95,221 ,1 }, 	8.0000 * 1000},
			{"M¶nh Hång Hoang", 					{2,95,1506,1 }, 	18.5300* 1000},
			{"M¶nh Hång Hoang", 					{2,95,1506,2 }, 	5.0000 * 1000},
			{"M¶nh Hång Hoang", 					{2,95,1506,5 }, 	2.0000 * 1000},
			{"M¶nh Ngo¹i Trang ?m Hån L­u Kim", 			{2,95,1515,1 }, 	0.0000 * 1000},
			{"M¶nh Ngo¹i Trang ?m Hån L­u Kim", 			{2,95,1515,4 }, 	0.0000 * 1000},
			{"M¶nh Ngo¹i Trang ?m Hån L­u Kim", 			{2,95,1515,25}, 	0.0000 * 1000},
		},
	},
};


tExp = {  -- ¹ý¹ØÄ¬ÈÏ»ù´¡¾­Ñé£¬1ÎªÆÕÍ¨Ä£Ê½£¬2ÎªÓ¢ÐÛÄ£Ê½; ¶þ¼¶ÏÂ±êÎª¹Ø¿¨Êý£¬1-5ÊÇÕý³£¹Ø¿¨£¬6ºÅÊÇ×÷±×Ä£Ê½
	[1]={
		7000000 ,
		8000000 ,
		9000000 ,
		10000000 ,
		11000000 ,
		45000000 ,
	},
	[2]={ 
		8000000 ,
		9000000 ,
		10000000 ,
		11000000 ,
		12000000 ,
		50000000 ,
	},
}
tAward = {   -- ·­ÅÆ½±Àø×Ö¶Î£¬1ÎªÆÕÍ¨Ä£Ê½£¬2ÎªÓ¢ÐÛÄ£Ê½
	[1] = {
		"JD_free1",
		"JD_IB1",
	},
	[2] = {
		"YXJD_free1",
		"YXJD_IB1",
	}
}
tCostItem = {2, 97, 236, 1 , "Thiªn Kiªu LÖnh mang theo trªn ng­êi kh«ng ®ñ!"} -- ·­ÅÆÐèÒªµÄÎïÆ·
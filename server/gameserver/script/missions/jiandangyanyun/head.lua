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
--	name = "��������",
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
	jjg = {"Thanh Thanh C� N��ng", "Thanh Thanh C� N��ng", "\\script\\missions\\jiandangyanyun\\npcs\\jjg_npc.lua", CampPlayer},
	qy 	= {"Thanh Di�n", "Thanh Di�n", thisFile, CampPlayer},
	smr = {"Y�n V�n Ho�n Nhan A C�t ��", "Ng��i th�n b�", thisFile, CampPlayer},
	zr 	= {"H�a Th�n Ch�c Dung", "H�a Th�n Ch�c Dung", thisFile, CampEnemy},
	hsy = {"H� T�ng H�c D�u Thi�n �m Gi�o", "H� T�ng H�c D�u Thi�n �m Gi�o", thisFile, CampEnemy},
	tny = {"Y�n V�n ���ng L�ng Nguy�t", "���ng L�ng Nguy�t", thisFile, CampPlayer},
	yy	= {"Thu�n Th�n D� Oanh", "Thu�n Th�n D� Oanh", thisFile, CampEnemy},
	lwq = {"L�c H� Ti�n T� L�ng Uy�n Thu", "L�c H� Ti�n T� L�ng Uy�n Thu", thisFile, CampPlayer},
	syy = {"Ni�t B�n T�n Gi� T� Y Y", "Ni�t B�n T�n Gi� T� Y Y", thisFile, CampEnemy},
	shx = {"T� Tu� Nh�n", "T� Tu� Nh�n", thisFile, CampEnemy},
	fj 	= {"Ph��ng Th�ng", "Ph��ng Th�ng", thisFile, CampEnemy},
	smmf= {"T� M� Minh Phong", "T� M� Minh Phong", thisFile, CampPlayer},
	tbh	= {"Th�c B�t Ho�ng ", "Th�c B�t Ho�ng ", thisFile, CampPlayer},
	sl 	= {"V� L��ng Minh V��ng Sa La", "V� L��ng Minh V��ng Sa La", thisFile, CampEnemy},
	lf 	= {"Hoa Th�nh L�c Phi", "Hoa Th�nh L�c Phi", thisFile, CampPlayer},
	hy 	= {"H�ng �n Gi�o Ch�", "H�ng �n Gi�o Ch�", thisFile, CampEnemy},
};

tNpcs_NORMAL = {
	zr 	= {"H�a Th�n Ch�c Dung-Th��ng", "H�a Th�n Ch�c Dung", thisFile, CampEnemy},
	hsy = {"H� T�ng H�c D�u Thi�n �m Gi�o-Th��ng", "H� T�ng H�c D�u Thi�n �m Gi�o", thisFile, CampEnemy},
	yy	= {"Thu�n Th�n D� Oanh-Th��ng", "Thu�n Th�n D� Oanh", thisFile, CampEnemy},
	syy = {"Ni�t B�n T�n Gi� T� Y Y-Th��ng", "Ni�t B�n T�n Gi� T� Y Y", thisFile, CampEnemy},
	shx = {"T� Tu� Nh�n-Th��ng", "T� Tu� Nh�n", thisFile, CampEnemy},
	fj 	= {"Ph��ng Th�ng-Th��ng", "Ph��ng Th�ng", thisFile, CampEnemy},
	sl 	= {"V� L��ng Minh V��ng Sa La-Th��ng", "V� L��ng Minh V��ng Sa La", thisFile, CampEnemy},
	hy 	= {"H�ng �n Gi�o Ch�-Th��ng", "H�ng �n Gi�o Ch�", thisFile, CampEnemy},
};

tNpcs_CHEAT = {
	zr 	= {"H�a Th�n Ch�c Dung-Sao ch�p", "H�a Th�n Ch�c Dung", thisFile, CampEnemy},
	yy	= {"Thu�n Th�n D� Oanh-Sao ch�p", "Thu�n Th�n D� Oanh", thisFile, CampEnemy},
	syy = {"Ni�t B�n T�n Gi� T� Y Y-Sao ch�p", "Ni�t B�n T�n Gi� T� Y Y", thisFile, CampEnemy},
	sl 	= {"V� L��ng Minh V��ng Sa La-Sao ch�p", "V� L��ng Minh V��ng Sa La", thisFile, CampEnemy},
	hy 	= {"H�ng �n Gi�o Ch�-Sao ch�p", "H�ng �n Gi�o Ch�", thisFile, CampEnemy},
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

--��ͼ���Ѿ���������NPC����
tExistNpcList = {
--	[nMapId] = {
--		{szName, nNpcIdx},
--	},
};

tList = {
	[2 ] = "Thi�u L�m �ao",
	[3 ] = "Thi�u L�m Tr��ng",
	[4 ] = "Thi�u L�m Quy�n",
	[6 ] = "���ng M�n",
	[8 ] = "Nga My Ph�t gia",
	[9 ] = "Nga My t�c gia",
	[11] = "C�i Bang Quy�n",
	[12] = "C�i Bang B�ng",
	[14] = "V� �ang Ki�m",
	[15] = "V� �ang B�t",
	[17] = "D��ng Gia Th��ng",
	[18] = "D��ng Gia Cung",
	[20] = "Hi�p ��c",
	[21] = "C� S�",
	[23] = "C�n L�n",
	[25] = "Th�nh Chi�n",
	[26] = "Tr�n Binh",
	[27] = "Huy�t Nh�n",
	[29] = "V� Ti�n",
	[30] = "Linh N�",
	[31] = "���ng M�n Nh�m Hi�p",
	[32] = "C�n L�n Ki�m T�n",
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
	tInfo	= {"Ch�n Thi�n Th�n h� ph�m", 5},
	tState	= {
		[1] = {9920, "state_life_max_percent_add",				1000,	"Sinh l�c t�ng t�i �a 10 l�n"},
		-- [2] = {9921, "state_destiny_point_add",		1000,	"���������������"},
		[2] = {9921, "state_critical_point_increase",			10,		"t�ng b�o k�ch"},
		[3] = {9922, "state_critical_damage_increase",		50,		"t�ng s�t th��ng b�o k�ch"},
		[4] = {9923, "state_def_critical_point_increase",		10,		"t�ng ph�ng th� b�o k�ch"},
		[5] = {9924, "state_def_critical_damage_increase",		10,		"t�ng gi�m th��ng b�o k�ch"},
		[6] = {9925, "state_immune",							100,	"Tr�ng th�i mi�n d�ch  "},
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
	{"Huy�n �m L�nh", {2,95,1500,8 }, 0.25*100000},
	{"Ch�n D��ng B�ch", {2,95,1501,8 }, 0.25*100000},
	{"Huy�n �m L�nh", {2,95,1500,6 }, 0.15*100000},
	{"Ch�n D��ng B�ch", {2,95,1501,6 }, 0.15*100000},
	{"Huy�n �m L�nh", {2,95,1500,10}, 0.1*100000},
	{"Ch�n D��ng B�ch", {2,95,1501,10}, 0.1*100000},
};

tPrize = {
	[1] = {	--���
		[1] = {		--��ͨ
			{"B�ng Lai Ti�n D��c"			,{2,95,1503,1},  	10.00*1000},
			{"T�i Ng�n L��ng"			,{2,95,649,2},  	5.00*1000},
			{"T�i Ng�n L��ng"			,{2,95,649,1},  	5.00*1000},
			{"T�i Ng�n L��ng"			,{2,95,649,3},  	10.00*1000},
			{"T�i Ng�n L��ng"			,{2,95,649,9},  	1.78 *1000},
			{"T�i Ng�n L��ng"			,{2,95,649,99},  	0.20 *1000},
			{"T�i Ng�n L��ng"			,{2,95,649,999},  	0.02 *1000},
			{"M�nh Ngo�i Trang ?m H�n L�u Kim"	,{2,95,1515,1},  	0.00 *1000},
			{"M�nh Ngo�i Trang ?m H�n L�u Kim"	,{2,95,1515,4},  	0.00 *1000},
			{"M�nh Ngo�i Trang ?m H�n L�u Kim"	,{2,95,1515,25},  	0.00 *1000},
			{"M�nh H�ng Hoang"			,{2,95,1506,1},  	14.00*1000},
			{"M�nh H�ng Hoang"			,{2,95,1506,2},  	9.00 *1000},
			{"M�nh H�ng Hoang"			,{2,95,1506,5},  	5.00 *1000},
			{"Li�t V� Th�ch"			,{2,1,10012,1},  	1.00*1000},
			{"M�nh �� K� N�ng"		,{2,1,10011,5},  	25.00*1000},
			{"M�nh �� K� N�ng"		,{2,1,10011,20}, 	10.00 *1000},
			{"M�nh �� K� N�ng"		,{2,1,10011,100},  	2.00 *1000},
			{"Quang V� Huy�n thi�t"			,{2,114,3,1},  		1.00 *1000},
			{"Quang V� Huy�n Th�ch"			,{2,114,106,1},  	1.00 *1000},
		},
		[2] = {		--Ӣ��
			{"T�i Ng�n L��ng", 				{2,95,649,3}, 		7.00*1000},
			{"T�i Ng�n L��ng", 				{2,95,649,9}, 		3.30*1000},
			{"T�i Ng�n L��ng", 				{2,95,649,99}, 		0.71 *1000},
			{"T�i Ng�n L��ng", 				{2,95,649,999},		0.01 *1000},
			{"M�nh Ngo�i Trang ?m H�n L�u Kim", 	{2,95,1515,1}, 		12.00*1000},
			{"M�nh Ngo�i Trang ?m H�n L�u Kim", 	{2,95,1515,4}, 		6.00 *1000},
			{"M�nh Ngo�i Trang ?m H�n L�u Kim", 	{2,95,1515,25}, 	2.78 *1000},
			{"Phi�u Kim ��ng Y�n V�n", 		{2,95,1512,1}, 		3.00 *1000},
			{"M�nh H�ng Hoang", 			{2,95,1506,1}, 		10.00*1000},
			{"M�nh H�ng Hoang", 			{2,95,1506,2}, 		9.00 *1000},
			{"M�nh H�ng Hoang",		 	{2,95,1506,5}, 		5.00 *1000},
			{"Li�t V� Th�ch",		 		{2,1,10012,1}, 		10.00*1000},
			{"M�nh �� K� N�ng",			{2,1,10011,100},  	15.00*1000},
			{"�� K� N�ng C�p 1",			{2,22,1,1}, 	 	5.00 *1000},
			{"�� K� N�ng C�p 2",			{2,22,2,1},  		1.00 *1000},
			{"�� K� N�ng C�p 3",			{2,22,3,1},  		0.20 *1000},
			{"Quang V� Huy�n thi�t",			{2,114,3,1},  		10.00 *1000},
			{"Quang V� Huy�n Th�ch",			{2,114,106,1},  	10.00 *1000},
		},
	},
	[2] = {			--����
		[1] = {		--�⴫
			{"Huy�n �m L�nh", 				{2,95,1500,10}, 	0.0450 * 1000, 1},
			{"Ch�n D��ng B�ch", 				{2,95,1501,10}, 	0.0450 * 1000, 1},
			{"Huy�n �m L�nh", 				{2,95,1500,8}, 		0.0750 * 1000, 1},
			{"Ch�n D��ng B�ch", 				{2,95,1501,8}, 		0.0750 * 1000, 1},
			{"Huy�n �m L�nh", 				{2,95,1500,6}, 		0.0300 * 1000, 1},
			{"Ch�n D��ng B�ch", 				{2,95,1501,6}, 		0.0300 * 1000, 1},
			{"Huy�n �m L�nh", 				{2,95,1500,2}, 		0.0600 * 1000, 1},
			{"Ch�n D��ng B�ch", 				{2,95,1501,2}, 		0.0600 * 1000, 1},
			{"Huy�n �m L�nh", 				{2,95,1500,1}, 		0.2000 * 1000, 1},
			{"Ch�n D��ng B�ch", 				{2,95,1501,1}, 		0.2000 * 1000, 1},
			{"��nh H�n Thi�n Th�ch Th�n Th�ch-Nh�", 		{2,1,1067 ,1}, 		0.0750 * 1000, 1},
			{"��nh H�n Thi�n Th�ch Th�n Th�ch", 		{2,1,1113 ,1}, 		0.0250 * 1000, 1},
--			{"�ƽ��ƿ�", 			{2,100,9  ,1}, 		0.2500 * 1000, 1},
			{"Thi�n Bi�n Ph�m Thi�n Quy�n", 			{2,95,247 ,1}, 		0.5000 * 1000, 1},
			{"Nh�n S�m v�n n�m", 			{2,0,796  ,1}, 		0.5000 * 1000, 1},
			{"Thi�n Th�ch Tinh Th�ch", 			{2,1,1009 ,1}, 		4.0000 * 1000, 1},
			{"Phi�u Thi�n Bi�n Ph�n Tinh", 			{2,95,246 ,1}, 		2.5000 * 1000},
			{"Bao m�nh Thi�n Th�ch", 		{2,1,1049 ,1}, 		0.1500 * 1000},
			{"��i Nh�n s�m", 			{2,0,553  ,1}, 		1.0000 * 1000},
			{"Ng� S�c Th�i Nhi�m", 			{2,201,13 ,5}, 		0.2500 * 1000, 1},
			{"Ng� S�c Th�i Nhi�m", 			{2,201,13 ,1}, 		2.5000 * 1000, 1},
			{"Ph��ng V�n Kh�c B�n [Y ph�c c�p 3]", {2,95,591 ,1}, 		0.5000 * 1000, 1},
			{"H� V�n Kh�c B�n [H� trang c�p 3]", {2,95,594 ,1}, 		0.5000 * 1000, 1},
			{"Long V�n Kh�c B�n [��u c�p 3]", {2,95,588 ,1}, 		0.5000 * 1000, 1},
			{"Hoa V�n Kh�c B�n [Trang s�c c�p 3]", {2,95,597 ,1}, 		1.0000 * 1000, 1},
			{"T�i Ng�n L��ng", 				{2,95,649 ,4}, 		20.1800* 1000},
			{"B�ng Lai Ti�n D��c", 			{2,95,1503,2}, 		6.0000 * 1000},
			{"Ti�u Thi�n Th�ch Bao", 			{2,95,221 ,1}, 		5.0000 * 1000},
			{"b�nh �t B�c B�o", 			{2,1,1125 ,1}, 		5.5000 * 1000},
			{"C�u Chuy�n Ho�n H�n �an", 			{1,0,32   ,1}, 		6.0000 * 1000},
			{"Tam Di�u Long Hi_�o�n Giao", 		{2,1,1260 ,5}, 		5.0000 * 1000},
			{"Tam Di�u Long Hi_C�i Th�", 		{2,1,1261 ,5}, 		5.0000 * 1000},
			{"Ti�u Bao L�u Kim", 			{2,95,665 ,1}, 		2.5000 * 1000},
			{"Ti�u Thi�n Th�ch Bao", 			{2,95,221 ,1}, 		8.0000 * 1000},
			{"M�nh H�ng Hoang", 			{2,95,1506,1}, 		15.0000* 1000},
			{"M�nh H�ng Hoang", 			{2,95,1506,2}, 		5.0000 * 1000},
			{"M�nh H�ng Hoang", 			{2,95,1506,5}, 		2.0000 * 1000},
			{"M�nh Ngo�i Trang ?m H�n L�u Kim", 	{2,95,1515,1}, 		0.0000 * 1000},
			{"M�nh Ngo�i Trang ?m H�n L�u Kim", 	{2,95,1515,4}, 		0.0000 * 1000},
			{"M�nh Ngo�i Trang ?m H�n L�u Kim	", 	{2,95,1515,25}, 	0.0000 * 1000},
		},
		[2] = {		--IB
			{"Huy�n �m L�nh", 				{2,95,1500,10}, 	0.0450 * 1000, 1},
			{"Ch�n D��ng B�ch", 				{2,95,1501,10}, 	0.0450 * 1000, 1},
			{"Huy�n �m L�nh", 				{2,95,1500,8 }, 	0.0750 * 1000, 1},
			{"Ch�n D��ng B�ch", 				{2,95,1501,8 }, 	0.0750 * 1000, 1},
			{"Huy�n �m L�nh", 				{2,95,1500,6 }, 	0.0300 * 1000, 1},
			{"Ch�n D��ng B�ch", 				{2,95,1501,6 }, 	0.0300 * 1000, 1},
			{"Huy�n �m L�nh", 				{2,95,1500,2 }, 	0.0600 * 1000, 1},
			{"Ch�n D��ng B�ch", 				{2,95,1501,2 }, 	0.0600 * 1000, 1},
			{"Huy�n �m L�nh", 				{2,95,1500,1 }, 	0.2000 * 1000, 1},
			{"Ch�n D��ng B�ch", 				{2,95,1501,1 }, 	0.2000 * 1000, 1},
			{"��nh H�n Thi�n Th�ch Th�n Th�ch", 		{2,1,1067 ,1 }, 	0.0250 * 1000, 1},
			{"Bao Thi�n Th�ch", 			{2,1,1050 ,1 }, 	0.1500 * 1000, 1},
			{"Thi�n Bi�n Ph�m Thi�n Quy�n", 			{2,95,247 ,1 }, 	0.5000 * 1000, 1},
			{"Nh�n S�m v�n n�m", 			{2,0,796  ,1 }, 	0.2500 * 1000, 1},
			{"Thi�n Th�ch Tinh Th�ch", 			{2,1,1009 ,1 }, 	4.0000 * 1000, 1},
			{"Phi�u Thi�n Bi�n Ph�n Tinh", 			{2,95,246 ,1 }, 	2.5000 * 1000},
			{"Bao m�nh Thi�n Th�ch", 		{2,1,1049 ,1 }, 	0.1500 * 1000},
			{"��i Nh�n s�m", 			{2,0,553  ,1 }, 	1.0000 * 1000},
			{"Ng� S�c Th�i Nhi�m", 			{2,201,13 ,5 }, 	0.2500 * 1000, 1},
			{"Ng� S�c Th�i Nhi�m", 			{2,201,13 ,1 }, 	2.5000 * 1000, 1},
			{"Ph��ng V�n Kh�c B�n [Y ph�c c�p 3]", {2,95,591 ,1 }, 	0.5000 * 1000, 1},
			{"H� V�n Kh�c B�n [H� trang c�p 3]", {2,95,594 ,1 }, 	0.5000 * 1000, 1},
			{"Long V�n Kh�c B�n [��u c�p 3]", {2,95,588 ,1 }, 	0.5000 * 1000, 1},
			{"Hoa V�n Kh�c B�n [Trang s�c c�p 3]", {2,95,597 ,1 }, 	1.0000 * 1000, 1},
			{"T�i Ng�n L��ng", 				{2,95,649 ,4 }, 	30.1000* 1000},
			{"B�ng Lai Ti�n D��c", 			{2,95,1503,2 }, 	6.0000 * 1000},
			{"Ti�u Thi�n Th�ch Bao", 			{2,95,221 ,1 }, 	5.0000 * 1000},
			{"b�nh �t B�c B�o", 			{2,1,1125 ,1 }, 	5.5000 * 1000},
			{"C�u Chuy�n Ho�n H�n �an", 			{1,0,32   ,1 }, 	6.0000 * 1000},
			{"B�ch Hoa Th�p C�m Nguy�t", 			{1,0,292  ,1 }, 	0.2500 * 1000},
			{"Ti�u Bao L�u Kim", 			{2,95,665 ,1 }, 	2.5000 * 1000},
			{"Ti�u Thi�n Th�ch Bao", 			{2,95,221 ,1 }, 	8.0000 * 1000},
			{"M�nh H�ng Hoang", 			{2,95,1506,1 }, 	15.0000* 1000},
			{"M�nh H�ng Hoang", 			{2,95,1506,2 }, 	5.0000 * 1000},
			{"M�nh H�ng Hoang", 			{2,95,1506,5 }, 	2.0000 * 1000},
			{"M�nh Ngo�i Trang ?m H�n L�u Kim", 	{2,95,1515,1 }, 	0.0000 * 1000},
			{"M�nh Ngo�i Trang ?m H�n L�u Kim", 	{2,95,1515,4 }, 	0.0000 * 1000},
			{"M�nh Ngo�i Trang ?m H�n L�u Kim", 	{2,95,1515,25}, 	0.0000 * 1000},
		},
		[3] = {		--PAY
			{"Huy�n �m L�nh", 						{2,95,1500,10}, 	0.0450 * 1000, 1},
			{"Ch�n D��ng B�ch", 						{2,95,1501,10}, 	0.0450 * 1000, 1},
			{"Huy�n �m L�nh", 						{2,95,1500,8 }, 	0.0750 * 1000, 1},
			{"Ch�n D��ng B�ch", 						{2,95,1501,8 }, 	0.0750 * 1000, 1},
			{"Huy�n �m L�nh", 						{2,95,1500,6 }, 	0.0300 * 1000, 1},
			{"Ch�n D��ng B�ch", 						{2,95,1501,6 }, 	0.0300 * 1000, 1},
			{"Huy�n �m L�nh", 						{2,95,1500,2 }, 	0.0600 * 1000, 1},
			{"Ch�n D��ng B�ch", 						{2,95,1501,2 }, 	0.0600 * 1000, 1},
			{"Huy�n �m L�nh", 						{2,95,1500,1 }, 	0.2000 * 1000, 1},
			{"Ch�n D��ng B�ch", 						{2,95,1501,1 }, 	0.2000 * 1000, 1},
			{"Thi�n C� B�o L�c", 					{2,1,2645 ,1 }, 	0.7500 * 1000},
			{"Thi�n Bi�n Ph�m Thi�n Quy�n", 					{2,95,247 ,1 }, 	0.5000 * 1000, 1},
			{"Nh�n S�m v�n n�m", 					{2,0,796  ,1 }, 	0.3000 * 1000, 1},
			{"Phi�u Thi�n Bi�n Ph�n Tinh", 					{2,95,246 ,1 }, 	2.5000 * 1000},
			{"��i Nh�n s�m", 					{2,0,553  ,1 }, 	1.1000 * 1000},
			{"Ng� S�c Th�i Nhi�m", 					{2,201,13 ,5 }, 	0.2500 * 1000, 1},
			{"Ng� S�c Th�i Nhi�m", 					{2,201,13 ,1 }, 	2.5000 * 1000, 1},
			{"Ph��ng V�n Kh�c B�n [Y ph�c c�p 3]", 		{2,95,591 ,1 }, 	0.5000 * 1000, 1},
			{"H� V�n Kh�c B�n [H� trang c�p 3]", 		{2,95,594 ,1 }, 	0.5000 * 1000, 1},
			{"Long V�n Kh�c B�n [��u c�p 3]", 		{2,95,588 ,1 }, 	0.5000 * 1000, 1},
			{"Hoa V�n Kh�c B�n [Trang s�c c�p 3]", 		{2,95,597 ,1 }, 	1.0000 * 1000, 1},
			{"T�i Ng�n L��ng", 						{2,95,649 ,4 }, 	30.0000* 1000},
			{"B�ng Lai Ti�n D��c", 					{2,95,1503,2 }, 	6.0000 * 1000},
			{"Ti�u Thi�n Th�ch Bao", 					{2,95,221 ,1 }, 	5.0000 * 1000},
			{"b�nh �t B�c B�o", 					{2,1,1125 ,1 }, 	5.5000 * 1000},
			{"C�u Chuy�n Ho�n H�n �an", 					{1,0,32   ,1 }, 	6.0000 * 1000},
			{"B�ch Hoa Th�p C�m Nguy�t", 					{1,0,292  ,1 }, 	0.2500 * 1000},
			{"Ti�u Bao L�u Kim", 					{2,95,665 ,1 }, 	2.5000 * 1000},
			{"Ti�u Thi�n Th�ch Bao", 					{2,95,221 ,1 }, 	8.0000 * 1000},
			{"M�nh H�ng Hoang", 					{2,95,1506,1 }, 	18.5300* 1000},
			{"M�nh H�ng Hoang", 					{2,95,1506,2 }, 	5.0000 * 1000},
			{"M�nh H�ng Hoang", 					{2,95,1506,5 }, 	2.0000 * 1000},
			{"M�nh Ngo�i Trang ?m H�n L�u Kim", 			{2,95,1515,1 }, 	0.0000 * 1000},
			{"M�nh Ngo�i Trang ?m H�n L�u Kim", 			{2,95,1515,4 }, 	0.0000 * 1000},
			{"M�nh Ngo�i Trang ?m H�n L�u Kim", 			{2,95,1515,25}, 	0.0000 * 1000},
		},
	},
};


tExp = {  -- ����Ĭ�ϻ������飬1Ϊ��ͨģʽ��2ΪӢ��ģʽ; �����±�Ϊ�ؿ�����1-5�������ؿ���6��������ģʽ
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
tAward = {   -- ���ƽ����ֶΣ�1Ϊ��ͨģʽ��2ΪӢ��ģʽ
	[1] = {
		"JD_free1",
		"JD_IB1",
	},
	[2] = {
		"YXJD_free1",
		"YXJD_IB1",
	}
}
tCostItem = {2, 97, 236, 1 , "Thi�n Ki�u L�nh mang theo tr�n ng��i kh�ng ��!"} -- ������Ҫ����Ʒ
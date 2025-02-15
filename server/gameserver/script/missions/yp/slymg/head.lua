Include("\\script\\lib\\talktmp.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\missionfunctions.lua")
Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Import("\\script\\lib\\define.lua")

thisFile = "\\script\\missions\\yp\\slymg\\mission.lua";

tbSLYMG = { 
	debugVersion = nil,
	name = "Th蕋 L筩 Nhai M藅 C鑓",
	missionID = 84,
	realMapID = 7111,
	dynamicMap = 0,

	--以下为missionV变量
	--control
	mv1 = 1, 
	mv2 = 2,
	--record
	mv3 = 3,
}
tbSLYMG = gf_CopyInherit(missionHead, tbSLYMG)

firePhases = {
	timerID = 118,
	frequency = 18*2,
	maxsecond = 14*24*3600, --7天？
};
firePhases = gf_CopyInherit(phaseBase,firePhases)

SLYMG_MISSION_CLOSE = 0;
SLYMG_MISSION_READY = 1;
SLYMG_MISSION_STEP_1 = 2;
SLYMG_MISSION_STEP_2 = 3;
SLYMG_MISSION_STEP_3 = 4;
SLYMG_MISSION_END = 5;

SLYMG_TEMP_REV1 = {
	{6300,1412,3624},
	{6300,1176,3277},
	{6300,1364,2970},
	{6300,1412,3624},
	{6300,1412,3624},
}

SLYMG_TEMP_REV2 = {
	{7111,1705,3414},
	{7111,1705,3254},
	{7111,1674,3548},
	{7111,1803,3396},
	{7111,1588,3355},
}

SLYMG_LEVEL_MAP1 = {7112, 7113, 7114, 7115};
SLYMG_LEVEL_MAP2 = {7116, 7117};
SLYMG_LEVEL_MAP3 = {7118};

SLYMG_TRAN_POS = {
	{1648, 3197},
	{1645, 3121},
	{1719, 3116},
	{1710, 3195},
}

SLYMG_LEVEL_BOSS1 = {"baihu1_boss", "Th竚 T� Th莕 B�", 1679, 3145};
SLYMG_LEVEL_BOSS2 = {"baihu2_boss", "Long H� Л阯g h� gi竜 s�", 1679, 3145};
SLYMG_LEVEL_BOSS3 = {"baihu3_boss", "Ti猽 Nhi詍 Nguy謙 Thi猲  Gi竜", 1679, 3145};

SLYMG_TRANS_NPC = {
	[7112] = {"Xa phu", "Ngi truy襫 t鑞g  Л阯g"},
	[7113] = {"Xa phu", "Ngi truy襫 t鑞g  Л阯g"},
	[7114] = {"Xa phu", "Ngi truy襫 t鑞g Dng Л阯g"},
	[7115] = {"Xa phu", "Ngi truy襫 t鑞g Dng Л阯g"},
	[7116] = {"Xa phu", "Ngi truy襫 t鑞g t莕g 3"},
	[7117] = {"Xa phu", "Ngi truy襫 t鑞g t莕g 3"},
	[7118] = {"Xa phu", "Xa phu Thi猲  Gi竜"},
}

SLYMG_LEVEL_MSG = {
	[7112] = "%s[%s] V� � k輈h ho箃 c� quan, th玭g v韎 c鯽 l韓 Ph﹏ У  Л阯g",
	[7113] = "%s[%s] V� � k輈h ho箃 c� quan, th玭g v韎 c鯽 l韓 Ph﹏ У  Л阯g",
	[7114] = "%s[%s] V� � k輈h ho箃 c� quan, th玭g v韎 c鯽 l韓 Ph﹏ У Dng Л阯g",
	[7115] = "%s[%s] V� � k輈h ho箃 c� quan, th玭g v韎 c鯽 l韓 Ph﹏ У Dng Л阯g",
	[7116] = "%s[%s]Trng L穙 ph﹏  b蕋 ch th﹏ vong, m閠 m藅 th竚 Thi猲  kh玭g may m緉 b� b総, c竎 hi謕 kh竎h bi誸 頲 c� quan m藅 o, c鯽 l韓 t莕g 3 頲 m�.",
	[7117] = "%s[%s]Trng L穙 ph﹏  b蕋 ch th﹏ vong, m閠 m藅 th竚 Thi猲  kh玭g may m緉 b� b総, c竎 hi謕 kh竎h bi誸 頲 c� quan m藅 o, c鯽 l韓 t莕g 3 頲 m�.",
	[7118] = "%s[%s] Ti猽 Nhi詍 Nguy謙 b蕋 ch b筰 t萿, trong h鏽 lo筺 c鯽 l韓 Th蕋 L筩 Nhai M藅 C鑓 kh玭g c� ng, Hi謕 kh竎h mu鑞 r阨 kh醝 c� th� n hng c鯽 ra  r阨 kh醝",
}

SLYMG_SCORE_BASE = {
	[7112] = 10,
	[7113] = 10,
	[7114] = 10,
	[7115] = 10,
	[7116] = 30,
	[7117] = 30,
	[7118] = 60,
}

SLYMG_SCORE_BOSS = {
	[7112] = 25,
	[7113] = 25,
	[7114] = 25,
	[7115] = 25,
	[7116] = 50,
	[7117] = 50,
	[7118] = 100,
}

--小怪奖励
SLYMG_MONSTER_AWARD_PRO = {
	[7112] = {TASK_MISSION_BAIHUTANG_TAG1, 1, 1, 10, 1},
	[7113] = {TASK_MISSION_BAIHUTANG_TAG1, 1, 1, 10, 1},
	[7114] = {TASK_MISSION_BAIHUTANG_TAG1, 1, 1, 10, 1},
	[7115] = {TASK_MISSION_BAIHUTANG_TAG1, 1, 1, 10, 1},
	[7116] = {TASK_MISSION_BAIHUTANG_TAG1, 2, 2, 20, 1},
	[7117] = {TASK_MISSION_BAIHUTANG_TAG1, 2, 2, 20, 1},
	[7118] = {TASK_MISSION_BAIHUTANG_TAG1, 3, 3, 50, 1},
}
--boss奖励
SLYMG_BOSS_AWARD_PRO = {
	[7112] = 3,
	[7113] = 3,
	[7114] = 3,
	[7115] = 3,
	[7116] = 6,
	[7117] = 6,
	[7118] = 12,
}
--名册
SLYMG_BOSS_AWARD_BOOK = {
	[7112] = 1,
	[7113] = 1,
	[7114] = 1,
	[7115] = 1,
	[7116] = 2,
	[7117] = 2,
	[7118] = 4,
}

function mg_GetMissionState()
	local nTime = tonumber(date("%H%M"));
	if nTime >= 0730 and nTime < 0830 then
		return SLYMG_MISSION_CLOSE;
	end
	if nTime >= 1830 and nTime < 2130 then
		return SLYMG_MISSION_CLOSE;
	end
	local nMinute = tonumber(date("%M"));
	if nMinute >= 30 and nMinute < 60 then
		return SLYMG_MISSION_READY;
	end
	if nMinute >= 0 and nMinute < 7 then
		return SLYMG_MISSION_STEP_1;
	end
	if nMinute >= 7 and nMinute < 16 then
		return SLYMG_MISSION_STEP_2;
	end
	if nMinute >= 16 and nMinute < 25 then
		return SLYMG_MISSION_STEP_3;
	end
	if nMinute >= 25 and nMinute < 30 then
		return SLYMG_MISSION_END;
	end
	return SLYMG_MISSION_CLOSE;
end

function mg_CreateNpcList(tNpcList, nMapID)
	for _, v in tNpcList do
		local npcIndex = CreateNpc(v[1], v[2], nMapID, v[3], v[4]);
		if npcIndex > 0 then
			SetNpcScript(npcIndex, thisFile);
		end
	end
end

function mg_CreateBoss(tMap, tNpc, msg)
	for i = 1, getn(tMap) do
		local npcIndex = CreateNpc(tNpc[1], tNpc[2], tMap[i], tNpc[3], tNpc[4]);
		if npcIndex > 0 then
			SetNpcDeathScript(npcIndex, "\\script\\missions\\yp\\slymg\\npc_death.lua");
			Msg2Map(tMap[i], msg);
		end
	end
end

function mg_GotoLevel1(nType)
	local npcName = format("<color=gold>%s<color>:", GetTargetNpcName());
	if gf_CheckLevel(5, 90) ~= 1 or gf_CheckPlayerRoute() ~= 1 then
		Talk(1, "", npcName.."Чt chuy觧 sinh 5 c蕄 90 v� gia nh藀 l璾 ph竔 s� c� th� gia nh藀 th� l鵦!");
		return 0;
	end
	local nTimes = gf_GetTaskByte(TASK_MISSION_BAIHUTANG_TAG2, 3)
	if nTimes >= 3 then
		Talk(1,"", npcName..format("H玬 nay  ho祅 th祅h %d l莕, ng祔 mai h穣 quay l筰!", 3));
		return 0;
	end
	if GetPKValue() >= 10 then
		Talk(1, "", npcName.."C竎 h� 竎 kh� qu� n苙g (PK>=10), ki課 ngh� c竎 h� r鯽 s筩h 竎 kh� (th玭g qua phng th鴆 s� d鬾g ti猽 gi秈 t竛 h� th蕄 甶觤 PK).");
		return 0;
	end
	local nState = mf_GetMissionV(tbSLYMG.missionID, tbSLYMG.mv1, tbSLYMG.realMapID);
	if nState == SLYMG_MISSION_CLOSE then
		Talk(1, "", npcName.."Th阨 kh綾 v蒼 ch璦 n, c竎 i hi謕 i th猰 nh�, sau khi i th竚 t� th╩ d� r� r祅g th� h穣 甶.")
		return 0;
	end
	if nState >= SLYMG_MISSION_STEP_1 and nState <= SLYMG_MISSION_END then
		Talk(1,"", npcName.."Lt n祔  b総 u, i t� r錳 n nh�!");
		return 0;
	end
	local nIndex = random(getn(SLYMG_TRAN_POS));
	NewWorld(SLYMG_LEVEL_MAP1[nType], SLYMG_TRAN_POS[nIndex][1], SLYMG_TRAN_POS[nIndex][2]);
	SetLogoutRV(1);
	SetDeathPunish(0);
	SetCampToPlayer("");	
	SetDeathScript("\\script\\missions\\yp\\slymg\\player_death.lua");
	SetFightState(0);
	AddRuntimeStat(32, 3, 1, 1)
	--每场都重置掉落限制
	for _, v in SLYMG_MONSTER_AWARD_PRO do
		gf_SetTaskByte(v[1], v[2], 0);
	end
end

function mg_Func2AllPlayer(tMap)
	local oldPlayerIndex = PlayerIndex;
	if tMap and type(tMap) == "table" then 
		for _, v in tMap do
			local tPlayer = GetMapPlayer(v);
			if tPlayer and type(tPlayer) == "table" then
				for _, m in tPlayer do
					PlayerIndex = m;
					mg_ModifyScore(SLYMG_SCORE_BASE[v]);
					mg_SetPlayerState();
					local nTimes = gf_GetTaskByte(TASK_MISSION_BAIHUTANG_TAG2, 3);
					gf_SetTaskByte(TASK_MISSION_BAIHUTANG_TAG2, 3, nTimes + 1);
				end
			end
		end
	end
	PlayerIndex = oldPlayerIndex;
end

function mg_GotoLevel2(nType)
	local nIndex = random(getn(SLYMG_TRAN_POS));
	NewWorld(SLYMG_LEVEL_MAP2[nType], SLYMG_TRAN_POS[nIndex][1], SLYMG_TRAN_POS[nIndex][2]);
	mg_SetPlayerState();
	mg_ModifyScore(SLYMG_SCORE_BASE[SLYMG_LEVEL_MAP2[nType]]);
	AddRuntimeStat(32, 3, 2, 1)
end

function mg_GotoLevel3()
	local nIndex = random(getn(SLYMG_TRAN_POS));
	NewWorld(SLYMG_LEVEL_MAP3[1], SLYMG_TRAN_POS[nIndex][1], SLYMG_TRAN_POS[nIndex][2]);
	mg_SetPlayerState();
	mg_ModifyScore(SLYMG_SCORE_BASE[SLYMG_LEVEL_MAP3[1]]);
	AddRuntimeStat(32, 3, 3, 1)
end

function mg_ReturnMg()
	SetPlayerScript("\\script\\missions\\yp\\slymg\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\slymg\\entrynpc.lua","enter()");	
end

function mg_NoticePer2Min()
	local currMinute = tonumber(date("%M"));
	if currMinute < 30 then currMinute = currMinute + 60; end
	currMinute = currMinute - 30;	
	local leftMinute = 60 - currMinute;
	local record = GetMissionV(this.mv3);
	if record ~= leftMinute and mod(leftMinute, 3) == 0 then
		local msg = format("Thi猲  Ph﹏ У  xu蕋 hi謓 v誸 n鴗, d� t輓h sau %d ph髏 s� s藀, c竎 i hi謕 mu鑞 l蕐 danh s竎h th� h穣 mau ch鉵g 甶 t譵 ki誱 nh�.", 
			leftMinute);
		SetMissionV(this.mv3, leftMinute);
		local tMap = {SLYMG_LEVEL_MAP1, SLYMG_LEVEL_MAP2, SLYMG_LEVEL_MAP3};
		for _, v in tMap do
			for _, m in v do
				Msg2Map(m, msg);
			end
		end
	end
end

function mg_CreateMonster()
	local tPos = {
		{1679, 3103},
		{1648, 3121},
		{1629, 3160},
		{1649, 3193},
		{1682, 3213},
		{1708, 3189},
		{1735, 3161},
		{1711, 3122},
	};
	local tNpc = {
		{"baihu1_footman", "Mao T芻 lo筺 nh藀"},
		{"baihu2_footman", "Long H� Л阯g C� Quan Th�"},
		{"baihu3_footman", "H� V� Trng L穙"},	
	}
	local tMaps = {SLYMG_LEVEL_MAP1, SLYMG_LEVEL_MAP2, SLYMG_LEVEL_MAP3};
	local tFlag = {0, 0, 0, 0};
	for i = 1, getn(SLYMG_LEVEL_MAP1) do
		local tPlayer = GetMapPlayer(SLYMG_LEVEL_MAP1[i]);
		if getn(tPlayer) > 0 then
			tFlag[i] = 1;
		end
	end
	local tMapFlag = {tFlag,{0,0},{0}};
	if tFlag[1] == 1 or tFlag[2] == 1 then
		tMapFlag[2][1] = 1;
	end
	if tFlag[3] == 1 or tFlag[4] == 1 then
		tMapFlag[2][2] = 1;
	end
	if tMapFlag[2][1] == 1 or tMapFlag[2][2] == 1 then
		tMapFlag[3][1] = 1;
	end
	for i = 1, getn(tMaps) do
		for j = 1, getn(tMaps[i]) do
			if tMapFlag[i][j] == 1 then
				for _,n in tPos do
					for k = 1, 6 do
						local npcIndex = CreateNpc(tNpc[i][1], tNpc[i][2], tMaps[i][j], n[1] + random(-5, 5), n[2] + random(-5, 5));
						if npcIndex > 0 then
							SetNpcDeathScript(npcIndex, "\\script\\missions\\yp\\slymg\\monster_death.lua");
							SetNpcLifeTime(30*60);
						end
					end
				end
			end
		end
	end
end

function mg_MapClean()
	local oldPlayerIndex = PlayerIndex;
	local tMap = {SLYMG_LEVEL_MAP1, SLYMG_LEVEL_MAP2, SLYMG_LEVEL_MAP3};
	for _, v in tMap do
		for _, m in v do
			ClearMapNpc(m);
			local tPlayer = GetMapPlayer(m);
			for _,v in tPlayer do
				PlayerIndex = v;
				mg_ReturnMg();
			end
		end
	end
	PlayerIndex = oldPlayerIndex;
end

function mg_SetPlayerState()
	SetLogoutRV(1);
	SetDeathPunish(0);
	ForbidChangePK(0);
	SetPKFlag((IsTongMember() > 0) and 3 or 2, 0);
	ForbidChangePK(1);
	SetCampToPlayer("");	
	SetDeathScript("\\script\\missions\\yp\\slymg\\player_death.lua");
	RestoreAll();
	SetFightState(1);
end

function mg_BgStory()
	local tbBody = "Sau khi k誸 th骳 tr薾 chi課 Huy誸 B筩 L躰h, Thi猲  Gi竜 l蕐 nanh vu鑤 ma qu� du鏸 v祇 ba nc T﹜ H�, Th� Ph錸, Чi L� c馻 bi猲 gi韎 ph輆 T﹜ B綾, nghe th竚 t� tr譶h b竜, 3 nc u c� ngi m� 竚 th玭g ng Thi猲  gi竜, chu萵 b� l藅  3 nc, V� L﹎ Minh ph竔 cao th� h� tr� truy b総 t猲 Thi猲  gi竜 kh玭g mu鑞 mang theo danh s竎h, nh璶g b� tr鋘g thng.Nh﹏ d﹏ th╩ d� 頲 bi誸 danh s竎h  b� a n Thi猲  Gi竜 Th蕋 L筩 Nhai Ph﹏ У c馻 Th蕋 L筩 Nhai, Ph﹏  n祔 do Ti猽 Nhi詍 Nguy謙 chi誱 gi�, b猲 trong h� v� nghi猰 ng苩, ngi ngo礽 r蕋 kh� v祇.Nh薾 頲 th玭g tin n閕 b� c馻 3 nc chi猽 m� giang h� hi謕 kh竎h, v祇 Thi猲  Gi竜 Th蕋 L筩 Ph﹏ У, hy v鋘g c� th� l蕐 頲 danh s竎h k� ph秐 b閕, ng th阨 l頸 d鬾g nh鱪g t猲 ph秐 b閕 n祔 nh nc kh竎, Thi猲  gi竜 Th蕋 L筩 Nhai Ph﹏ У m閠 th阨  tr� th祅h chi課 trng h鏽 chi課 c竎 phng.";
	local tbSay = {};
	tbSay.msg = format("<color=gold>%s<color>:", GetNpcName(GetTargetNpc()))..tbBody;
	tbSay.sel = {
		{"Ra kh醝","nothing"},
	};
	temp_Talk(tbSay);
end

function mg_TimeInfo()
	local tbBody = "Th阨 gian b蕋 k� m鏸 ng祔 u c� th� n Th蕋 L筩 Nhai M藅 C鑓, nh璶g mu鑞 n Thi猲  Ph﹏ У ph秈 xem th阨 kh綾, 8:30~17:30 21:30~6:30  m鏸 ng祔, trc 30 ph髏 c馻 kho秐g th阨 gian n祔 h� v� tng i l醤g l蝟, v� v藋 c� th� ki誱 xa phu kh竎 g莕  d蒼 c竎 b筺 v祇, nh璶g khi n kh玭g th� v祇, v� d�: 8h30~9h m鏸 ng祔 c� th� h� tr� c竎 v� v祇 t莕g 1, 9h~9h30 th� kh玭g th� v祇.";
	local tbSay = {};
	tbSay.msg = format("<color=gold>%s<color>:", GetNpcName(GetTargetNpc()))..tbBody;
	tbSay.sel = {
		{"Ra kh醝","nothing"},
	};
	temp_Talk(tbSay);
end

function mg_FunctionInfo()
	local tbBody = "Ngi Ch琲 c� th� v祇 Th蕋 L筩 Nhai M藅 C鑓 th玭g qua NPC 3 phe b蕋 c� th阨 gian n祇, trong th阨 gian nh蕋 nh, ngi ch琲 c� th� t� M藅 c鑓 v祇 t莕g 1 ph﹏  Th蕋 L筩 Nhai Thi猲 ,  30 ph髏 sau ho箃 ng b総 u, sau khi b総 u ngi ch琲 kh玭g th� b竜 danh gia nh藀 n鱝, khi ho箃 ng b総 u, ngi ch琲 � t莕g 1 ph﹏  Th蕋 L筩 Nhai Thi猲  s� b総 bu閏 ph秈 chuy觧 v祇 tr筺g th竔 PK l� Tr筺g Th竔 Bang Chi課( ngi ch琲 kh玭g c� bang h閕 s� l� tr筺g th竔 chi課 u, i l藀 v韎 t蕋 c� ngi kh竎), ng th阨 qu竔 v藅 b総 u xu蕋 hi謓, suy ra nh� v藋, ph﹏  t鎛g c閚g 3 t莕g, m鏸 t莕g u c� 1 Boss, Boss s� xu蕋 hi謓 trong th阨 gian c� nh, sau khi ti猽 di謙 boss s� th玭g hng v韎 xa phu truy襫 t鑞g n t莕g ti誴 theo, sau khi k誸 th骳 th阨 gian ho箃 ng 30 ph髏 t蕋 c� ngi ch琲 b� truy襫 t鑞g n Th蕋 L筩 Nhai M藅 C鑓.    ";
	local tbSay = {};
	tbSay.msg = format("<color=gold>%s<color>:", GetNpcName(GetTargetNpc()))..tbBody;
	tbSay.sel = {
		{"Ra kh醝","nothing"},
	};
	temp_Talk(tbSay);
end

function mg_ModifyScore(nValue)
	if not nValue or nValue == 0 then return 0; end
	local nCurrValue = GetTask(TASK_MISSION_BAIHUTANG_SCORE);
	local nRealValue = max(nCurrValue + nValue, 0);
	SetTask(TASK_MISSION_BAIHUTANG_SCORE, nRealValue);
	if nValue > 0 then
		Msg2Player(format("Nh薾 頲 %d 甶觤 t輈h l騳 Long H� Л阯g", nValue));
	else
		Msg2Player(format("B筺  ti猽 hao %d 甶觤 t輈h l騳 Long H� Л阯g", nCurrValue - nRealValue));
	end
end

function mg_MonsterDropItem()
	if GetFreeItemRoom() < 1 then
		Msg2Player(format("H祅h trang kh玭g  kh玭g gian kh玭g th� nh薾 頲 %s", "Thi猲  M藅 B秓"));
		return 1;
	end	
	local mapID = GetWorldPos();
	local t = SLYMG_MONSTER_AWARD_PRO[mapID];
	local nCount = gf_GetTaskByte(t[1], t[2]);
	if nCount >= t[3] then
		return 0;
	end
	if t[4] >= random(100) then
		gf_SetTaskByte(t[1], t[2], nCount + 1);
		gf_AddItemEx2({2, 1, 30923, t[5]}, "Thi猲  M藅 B秓", "Long H� Л阯g", "Ph莕 thng gi誸 qu竔 nh�", 0, 1);
	end
end

function mg_BossDropItem(mapID, npcIndex)	
	local t = SLYMG_BOSS_AWARD_PRO[mapID];
	for i = 1, t do
		gf_ThrowDice({2, 1, 30923, 1}, nil, nil, nil, 60, npcIndex);
	end
end

function mg_DailyReset()
	SetTask(TASK_MISSION_BAIHUTANG_TAG1, 0);
	SetTask(TASK_MISSION_BAIHUTANG_TAG2, 0);
end

Include("\\script\\lib\\talktmp.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\missionfunctions.lua")
Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Import("\\script\\lib\\define.lua")

thisFile = "\\script\\missions\\yp\\slymg\\mission.lua";

tbSLYMG = { 
	debugVersion = nil,
	name = "Th�t L�c Nhai M�t C�c",
	missionID = 84,
	realMapID = 7111,
	dynamicMap = 0,

	--����ΪmissionV����
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
	maxsecond = 14*24*3600, --7�죿
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

SLYMG_LEVEL_BOSS1 = {"baihu1_boss", "Th�m T� Th�n B�", 1679, 3145};
SLYMG_LEVEL_BOSS2 = {"baihu2_boss", "Long H� ���ng h� gi�o s�", 1679, 3145};
SLYMG_LEVEL_BOSS3 = {"baihu3_boss", "Ti�u Nhi�m Nguy�t Thi�n �m Gi�o", 1679, 3145};

SLYMG_TRANS_NPC = {
	[7112] = {"Xa phu", "Ng��i truy�n t�ng �m ���ng"},
	[7113] = {"Xa phu", "Ng��i truy�n t�ng �m ���ng"},
	[7114] = {"Xa phu", "Ng��i truy�n t�ng D��ng ���ng"},
	[7115] = {"Xa phu", "Ng��i truy�n t�ng D��ng ���ng"},
	[7116] = {"Xa phu", "Ng��i truy�n t�ng t�ng 3"},
	[7117] = {"Xa phu", "Ng��i truy�n t�ng t�ng 3"},
	[7118] = {"Xa phu", "Xa phu Thi�n �m Gi�o"},
}

SLYMG_LEVEL_MSG = {
	[7112] = "%s[%s] V� � k�ch ho�t c� quan, th�ng v�i c�a l�n Ph�n �� �m ���ng",
	[7113] = "%s[%s] V� � k�ch ho�t c� quan, th�ng v�i c�a l�n Ph�n �� �m ���ng",
	[7114] = "%s[%s] V� � k�ch ho�t c� quan, th�ng v�i c�a l�n Ph�n �� D��ng ���ng",
	[7115] = "%s[%s] V� � k�ch ho�t c� quan, th�ng v�i c�a l�n Ph�n �� D��ng ���ng",
	[7116] = "%s[%s]Tr��ng L�o ph�n �� b�t ��ch th�n vong, m�t m�t th�m Thi�n �m kh�ng may m�n b� b�t, c�c hi�p kh�ch bi�t ���c c� quan m�t ��o, c�a l�n t�ng 3 ���c m�.",
	[7117] = "%s[%s]Tr��ng L�o ph�n �� b�t ��ch th�n vong, m�t m�t th�m Thi�n �m kh�ng may m�n b� b�t, c�c hi�p kh�ch bi�t ���c c� quan m�t ��o, c�a l�n t�ng 3 ���c m�.",
	[7118] = "%s[%s] Ti�u Nhi�m Nguy�t b�t ��ch b�i t�u, trong h�n lo�n c�a l�n Th�t L�c Nhai M�t C�c kh�ng c� ��ng, Hi�p kh�ch mu�n r�i kh�i c� th� ��n h��ng c�a ra �� r�i kh�i",
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

--С�ֽ���
SLYMG_MONSTER_AWARD_PRO = {
	[7112] = {TASK_MISSION_BAIHUTANG_TAG1, 1, 1, 10, 1},
	[7113] = {TASK_MISSION_BAIHUTANG_TAG1, 1, 1, 10, 1},
	[7114] = {TASK_MISSION_BAIHUTANG_TAG1, 1, 1, 10, 1},
	[7115] = {TASK_MISSION_BAIHUTANG_TAG1, 1, 1, 10, 1},
	[7116] = {TASK_MISSION_BAIHUTANG_TAG1, 2, 2, 20, 1},
	[7117] = {TASK_MISSION_BAIHUTANG_TAG1, 2, 2, 20, 1},
	[7118] = {TASK_MISSION_BAIHUTANG_TAG1, 3, 3, 50, 1},
}
--boss����
SLYMG_BOSS_AWARD_PRO = {
	[7112] = 3,
	[7113] = 3,
	[7114] = 3,
	[7115] = 3,
	[7116] = 6,
	[7117] = 6,
	[7118] = 12,
}
--����
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
		Talk(1, "", npcName.."��t chuy�n sinh 5 c�p 90 v� gia nh�p l�u ph�i s� c� th� gia nh�p th� l�c!");
		return 0;
	end
	local nTimes = gf_GetTaskByte(TASK_MISSION_BAIHUTANG_TAG2, 3)
	if nTimes >= 3 then
		Talk(1,"", npcName..format("H�m nay �� ho�n th�nh %d l�n, ng�y mai h�y quay l�i!", 3));
		return 0;
	end
	if GetPKValue() >= 10 then
		Talk(1, "", npcName.."C�c h� �c kh� qu� n�ng (PK>=10), ki�n ngh� c�c h� r�a s�ch �c kh� (th�ng qua ph��ng th�c s� d�ng ti�u gi�i t�n h� th�p �i�m PK).");
		return 0;
	end
	local nState = mf_GetMissionV(tbSLYMG.missionID, tbSLYMG.mv1, tbSLYMG.realMapID);
	if nState == SLYMG_MISSION_CLOSE then
		Talk(1, "", npcName.."Th�i kh�c v�n ch�a ��n, c�c ��i hi�p ��i th�m nh�, sau khi ��i th�m t� th�m d� r� r�ng th� h�y �i.")
		return 0;
	end
	if nState >= SLYMG_MISSION_STEP_1 and nState <= SLYMG_MISSION_END then
		Talk(1,"", npcName.."L��t n�y �� b�t ��u, ��i t� r�i ��n nh�!");
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
	--ÿ�������õ�������
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
		local msg = format("Thi�n �m Ph�n �� �� xu�t hi�n v�t n�t, d� t�nh sau %d ph�t s� s�p, c�c ��i hi�p mu�n l�y danh s�ch th� h�y mau ch�ng �i t�m ki�m nh�.", 
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
		{"baihu1_footman", "Mao T�c lo�n nh�p"},
		{"baihu2_footman", "Long H� ���ng C� Quan Th�"},
		{"baihu3_footman", "H� V� Tr��ng L�o"},	
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
	local tbBody = "Sau khi k�t th�c tr�n chi�n Huy�t B�c L�nh, Thi�n �m Gi�o l�y nanh vu�t ma qu� du�i v�o ba n��c T�y H�, Th� Ph�n, ��i L� c�a bi�n gi�i ph�a T�y B�c, nghe th�m t� tr�nh b�o, 3 n��c ��u c� ng��i m� �m th�ng ��ng Thi�n �m gi�o, chu�n b� l�t �� 3 n��c, V� L�m Minh ph�i cao th� h� tr� truy b�t t�n Thi�n �m gi�o kh�ng mu�n mang theo danh s�ch, nh�ng b� tr�ng th��ng.Nh�n d�n th�m d� ���c bi�t danh s�ch �� b� ��a ��n Thi�n �m Gi�o Th�t L�c Nhai Ph�n �� c�a Th�t L�c Nhai, Ph�n �� n�y do Ti�u Nhi�m Nguy�t chi�m gi�, b�n trong h� v� nghi�m ng�t, ng��i ngo�i r�t kh� v�o.Nh�n ���c th�ng tin n�i b� c�a 3 n��c chi�u m� giang h� hi�p kh�ch, v�o Thi�n �m Gi�o Th�t L�c Ph�n ��, hy v�ng c� th� l�y ���c danh s�ch k� ph�n b�i, ��ng th�i l�i d�ng nh�ng t�n ph�n b�i n�y ��nh n��c kh�c, Thi�n �m gi�o Th�t L�c Nhai Ph�n �� m�t th�i �� tr� th�nh chi�n tr��ng h�n chi�n c�c ph��ng.";
	local tbSay = {};
	tbSay.msg = format("<color=gold>%s<color>:", GetNpcName(GetTargetNpc()))..tbBody;
	tbSay.sel = {
		{"Ra kh�i","nothing"},
	};
	temp_Talk(tbSay);
end

function mg_TimeInfo()
	local tbBody = "Th�i gian b�t k� m�i ng�y ��u c� th� ��n Th�t L�c Nhai M�t C�c, nh�ng mu�n ��n Thi�n �m Ph�n �� ph�i xem th�i kh�c, 8:30~17:30 21:30~6:30  m�i ng�y, tr��c 30 ph�t c�a kho�ng th�i gian n�y h� v� t��ng ��i l�ng l�o, v� v�y c� th� ki�m xa phu kh�c g�n �� d�n c�c b�n v�o, nh�ng khi ��n kh�ng th� v�o, v� d�: 8h30~9h m�i ng�y c� th� h� tr� c�c v� v�o t�ng 1, 9h~9h30 th� kh�ng th� v�o.";
	local tbSay = {};
	tbSay.msg = format("<color=gold>%s<color>:", GetNpcName(GetTargetNpc()))..tbBody;
	tbSay.sel = {
		{"Ra kh�i","nothing"},
	};
	temp_Talk(tbSay);
end

function mg_FunctionInfo()
	local tbBody = "Ng��i Ch�i c� th� v�o Th�t L�c Nhai M�t C�c th�ng qua NPC 3 phe b�t c� th�i gian n�o, trong th�i gian nh�t ��nh, ng��i ch�i c� th� t� M�t c�c v�o t�ng 1 ph�n �� Th�t L�c Nhai Thi�n �m,  30 ph�t sau ho�t ��ng b�t ��u, sau khi b�t ��u ng��i ch�i kh�ng th� b�o danh gia nh�p n�a, khi ho�t ��ng b�t ��u, ng��i ch�i � t�ng 1 ph�n �� Th�t L�c Nhai Thi�n �m s� b�t bu�c ph�i chuy�n v�o tr�ng th�i PK l� Tr�ng Th�i Bang Chi�n( ng��i ch�i kh�ng c� bang h�i s� l� tr�ng th�i chi�n ��u, ��i l�p v�i t�t c� ng��i kh�c), ��ng th�i qu�i v�t b�t ��u xu�t hi�n, suy ra nh� v�y, ph�n �� t�ng c�ng 3 t�ng, m�i t�ng ��u c� 1 Boss, Boss s� xu�t hi�n trong th�i gian c� ��nh, sau khi ti�u di�t boss s� th�ng h��ng v�i xa phu truy�n t�ng ��n t�ng ti�p theo, sau khi k�t th�c th�i gian ho�t ��ng 30 ph�t t�t c� ng��i ch�i b� truy�n t�ng ��n Th�t L�c Nhai M�t C�c.    ";
	local tbSay = {};
	tbSay.msg = format("<color=gold>%s<color>:", GetNpcName(GetTargetNpc()))..tbBody;
	tbSay.sel = {
		{"Ra kh�i","nothing"},
	};
	temp_Talk(tbSay);
end

function mg_ModifyScore(nValue)
	if not nValue or nValue == 0 then return 0; end
	local nCurrValue = GetTask(TASK_MISSION_BAIHUTANG_SCORE);
	local nRealValue = max(nCurrValue + nValue, 0);
	SetTask(TASK_MISSION_BAIHUTANG_SCORE, nRealValue);
	if nValue > 0 then
		Msg2Player(format("Nh�n ���c %d �i�m t�ch l�y Long H� ���ng", nValue));
	else
		Msg2Player(format("B�n �� ti�u hao %d �i�m t�ch l�y Long H� ���ng", nCurrValue - nRealValue));
	end
end

function mg_MonsterDropItem()
	if GetFreeItemRoom() < 1 then
		Msg2Player(format("H�nh trang kh�ng �� kh�ng gian kh�ng th� nh�n ���c %s", "Thi�n �m M�t B�o"));
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
		gf_AddItemEx2({2, 1, 30923, t[5]}, "Thi�n �m M�t B�o", "Long H� ���ng", "Ph�n th��ng gi�t qu�i nh�", 0, 1);
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

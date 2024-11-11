--����ף��
-----------------------------------------------------------------
tStage01 = {
	name = "H�a Th�n Ch�c Dung",
	szStageId = "01",
	maxsecond = 15 * 60,
	actionsType = "second",
};
tStage01 = inherit(cycPhase, tStage01);

tStage01_1 = {
	name = "Giai �o�n chu�n b�",
	szStageId = "01_1",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "Giai �o�n chu�n b�",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};
tStage01_1 = inherit(cycPhase, tStage01_1);

tStage01_2 = {
	name = "H�a Th�n Ch�c Dung",
	szStageId = "01_2",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage01_2 = inherit(cycPhase, tStage01_2);

tStage01_3 = {
	name = "Giai �o�n k�t th�c",
	szStageId = "01_3",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage01_3 = inherit(cycPhase, tStage01_3);

--ǰ�԰�
tStage01_2_1 = {
	name = "H�a Th�n Ch�c Dung-��i tho�i tr��c",
	szStageId = "01_2_1",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage01_2_1 = inherit(cycPhase, tStage01_2_1);

--��԰�
tStage01_2_3 = {
	name = "H�a Th�n Ch�c Dung-��i tho�i sau",
	szStageId = "01_2_3",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "Th�i gian l�t",
		time = 15,
		cyc = 0,
		id = 2,
	},
};
tStage01_2_3 = inherit(cycPhase, tStage01_2_3);

tStage01_2_2 = {
	name = "H�a Th�n Ch�c Dung-Chi�n ��u",
	szStageId = "01_2_2",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "H�a Th�n Ch�c Dung",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};
tStage01_2_2 = inherit(cycPhase, tStage01_2_2);
-----------------------------------------------------------------
--	tStage01
-----------------------------------------------------------------
function tStage01.Init()
	local self = tStage01;
end

tStage01.actions = {
	[2] = tStage01.Init,
};

tStage01.triggers = {
};

-----------------------------------------------------------------
--	tStage01_1
-----------------------------------------------------------------
function tStage01_1:MkEventTable()
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage01_1.Breathe()
	local nNowTime = GetMissionV(this.mv_20);
	SetMissionV(this.mv_20, nNowTime + 1);
	local self = tStage01_1;
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then
		self:MkEventTable();
		--..
	end
	self.tEventTable[nMapId]:breathe();
	if nNowTime > 15 and JDYY_FindNpc(tNpcs.qy[2]) == 0 then
		self.RemoveSmr();
	end
end

function tStage01_1:CreateNpcs()
	local self = tStage01_1;
	
	if 1 == GetMissionV(this.mv_30) then	--ֱ�Ӵ����Ի�npc(��һ�س��ʧ��ʱʹ��)
		self:CreateQy();
	else
		local nSmrIdx = JDYY_CreateNpc(tNpcs.smr, tNpcPos.smr[self.szStageId][1]);
		SetNpcActivator(nSmrIdx);
		
		g_NpcAI:setAI(nSmrIdx, AT_SM_MOVE);
		g_NpcAI:setWayPoint(nSmrIdx, {{1565, 3277}, {1573, 3291}, {1576, 3301}, {1581, 3306}, {1585, 3304}, });
		
	end
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
end

function tStage01_1.RemoveSmr()
	local self = tStage01_1;
	local nSmrIdx = JDYY_FindNpc(tNpcs.smr[2]);
	RemoveNpc(nSmrIdx);
	self:CreateQy();
end

function tStage01_1:CreateQy()
	local nQyIdx = JDYY_CreateNpc(tNpcs.qy, tNpcPos.qy[self.szStageId][1]);
	JDYY_SetNpcType2Talk(nQyIdx);
end

function tStage01_1:BringDeathPlayerToFight()
	local tPlayerIndex = this.msCamp:reflash();
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, getn(tPlayerIndex) do
		PlayerIndex = tPlayerIndex[i];
		if JDYY_InDeathArea() then
			JDYY_SetPlayerPos(tPlayerPos["01"][1]);
		end
	end
	PlayerIndex = nOldPlayerIndex;
end

function tStage01_1.Init()
	local self = tStage01_1;
	this.msCamp:turnPlayer(0, function() StartTimeGuage(tStage01_1.name,tStage01_1.guage.time,0,2) end)
	-- logserver begin
	-- this.msCamp:turnPlayer(0, function() sendSwitchStageLog(this:mission_name(), %self.father.szStageId, 0) end)
	-- logserver end
	
	SetMissionV(this.mv_03, 0);		--������
	SetMissionV(this.mv_20, 0);		--NOW TIME
	SetMissionS(this.MS_STAGE, self.father.szStageId);
--	JDYY_RestoreAll();
	
	self:CreateNpcs();
	self:MkEventTable();
	self:MkOnceProcedure();
	self:BringDeathPlayerToFight();
end

function tStage01_1:MkOnceProcedure()
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then
		self:MkEventTable();
	end
	local tEventTable = self.tEventTable[nMapId];
	if 1 ~= GetMissionV(this.mv_30) then
		tEventTable:insertevent(7, tStage01_1.RemoveSmr, nil);
	end
end

function tStage01_1:OpenStage()
	local nTaskID 	= 0
	local nDifType = GetMissionV(this.mv_02)
	if nDifType == eDifType.NORMAL then
		nTaskID = TASKID_JDYY_DAILY_TIME_NORMAL;
		AddRuntimeStat(44,2,1,1) --ͳ��jdyy_Normal_OpenStage
	elseif nDifType == eDifType.HARD then
		nTaskID = TASKID_JDYY_DAILY_TIME_HARD;
		AddRuntimeStat(44,4,1,1)
	else
		return 0
	end

	this.msCamp:turnPlayer(0, function() SetTask(%nTaskID, GetTask(%nTaskID) + 1); end);

	self:onFinish();
end

function tStage01_1:NpcMain()
	local sayStr = "<color=green>Thanh Di�n: M�t hi�u h�nh ��ng ��i ph�  Thi�n �m Gi�o l�n n�y l� Ki�m ��ng Y�n V�n, Ki�m �o�t l�i 16 ch�u c�a Y�n V�n! ��i hi�p �� s�n s�ng?"
	local sexStr = "";
	if GetSex()==1 then 
		sexStr = "��i hi�p"
	else 
		sexStr = "N� hi�p "
	end

	if not JDYY_IsCaptain() then
		Talk(1, "", "<color=green>Thanh Di�n:<color> Ch� c� ��i tr��ng m�i c� th� thao t�c!");
		return 0;
	else
		local strTab = nil;

		if eDifType.NORMAL == GetMissionV(this.mv_02) then
			sayStr = sayStr.."Ta bi�t m�t con ���ng th�ng ��n Tr�y Long C�c,"..sexStr.."��i hi�p c� mu�n th� kh�ng? (Trong h�nh th�c Sao ch�p, m�i th�nh vi�n t�i thi�u d� tr� <color=red>2 ch� tr�ng t�i, 100 s�c l�c<color>) "
			strTab = {
				--				"����							/#tStage01_1.JumpStage()",
				"M� �i 1: Nghi�p H�a Ph�n Thi�n			/#tStage01_1:OpenStage()",
				"M� h�nh th�c sao ch�p (C�n 5 Thi�n Ki�u L�nh)	/#tStage01_1.JumpToStage(6)",
				"Gi�i thi�u h�nh th�c Sao ch�p					/#tStage01_1.ZuobiInfo()",
				"R�i c�a �i						/#JDYY_ConfirmClose('Thanh Di�n')",
				"H�y b�							/nothing",
			};
		else
			strTab = {
				--				"����							/#tStage01_1.JumpStage()",
				"M� �i 1: Nghi�p H�a Ph�n Thi�n			/#tStage01_1:OpenStage()",
				"R�i c�a �i						/#JDYY_ConfirmClose('Thanh Di�n')",
				"H�y b�							/nothing",
			};
		end

		if g_WCFG_KIEMDANGYENVAN.bDisableEntryConsumeMode == WEnv.TRUE then
			if eDifType.NORMAL == GetMissionV(this.mv_02) then
				tremove(strTab, 2); -- b� d�ng #tStage01_1.JumpToStage(6)
			end
		end
		Say(sayStr, getn(strTab), strTab);
	end
end

function tStage01_1:JumpStage()
	local self = tStage01_1;
	
	local strTab = {
		"Nh�y ��n �i th� 2	/#tStage01_1.JumpToStage(2)",
		"Nh�y ��n �i th� 3	/#tStage01_1.JumpToStage(3)",
		"Nh�y ��n �i th� 4	/#tStage01_1.JumpToStage(4)",
		"Nh�y ��n �i th� 5	/#tStage01_1.JumpToStage(5)",
		"tr� l�i		/#tStage01_1.NpcMain()",
		"H�y b�		/nothing",
	};
	Say("<color=green>Thanh Di�n:<color> Mu�n nh�y ��n �i n�o?", getn(strTab), strTab);
end

function tStage01_1:ZuobiInfo( )
	-- body
	Talk(1,"","<color=green>Thanh Di�n:<color>H�nh th�c Sao ch�p gi�p c�c v� ��i hi�p mau ch�ng qua �i, �� m�nh BOSS ch� c�n ��i hi�p b�t k� c� th� th�ng qua. ��i tr��ng c� th� th�ng qua h�nh th�c Sao ch�p nh�n ���c 10 b�o r��ng r�i, m�i b�o r��ng t��ng ���ng v�i gi� tr� ph�n th��ng 1 l�n L�t th� tr� ph� c�a h�nh th�c Th��ng.")
end

function tStage01_1.JumpToStage(nId)
	if 6 == nId then
		if g_WCFG_KIEMDANGYENVAN.bConsumeToFree == WEnv.TRUE then
			if 1 ~= DelItem(2, 97, 236, 5) then
				Talk(1, "", "<color=green>Thanh Di�n:<color> Thi�n Ki�u L�nh tr�n ng��i b�n kh�ng �� 5 c�i!");
				return
			else
				FireEvent("event_ib_cost", 2,97,236,5)
			end
		end
		local flag=1;
		local oldPlayer = PlayerIndex;
		local tbNameList = {}
		for i=1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if gf_Judge_Room_Weight(2, 100) ~= 1 then
				flag=0;
				tinsert(tbNameList,GetName())
			end
		end
		if flag == 0 then
			for i=1,GetTeamSize() do
				PlayerIndex = GetTeamMember(i)
				for j=1,getn(tbNameList)do
					local szMsg = format("Hi�p s� %s ph�i ��m b�o c� t�i thi�u 2 ch� tr�ng t�i v� 100 s�c l�c.",tbNameList[j])
					Msg2Player(szMsg) 
				end
			end
			return 0;
		end
		local nDifType = GetMissionV(this.mv_02);
		local TASKID_JDYY_CONSUME = tTaskID.ConsumeTaskID[nDifType];
		SetTask(TASKID_JDYY_CONSUME, GetTask(TASKID_JDYY_CONSUME) + 25);
		
		SetMissionV(this.mv_03, 1);
		-- ds_JDYY:AddStatValue(1, tDataStateList.yanyun_cheat, 1);  --ԭ��½��ͳ��
		AddRuntimeStat(44,1,0,1); -- ͳ������ģʽ
	end
	
	local self = tStage01_1;
	JDYY_ClearMapNpc();
	local tStageIds = {
		[2] = "02",
		[3] = "03",
		[4] = "04",
		[5] = "05",
		[6] = "06",
	};
	-- logserver begin
	-- this.msCamp:turnPlayer(0, function() sendSkipStageLog(this:mission_name(), %nId, this:mission_stage()) end)
	-- logserver end
	this.msCamp:turnPlayer(0, function() SetPos(tPlayerPos[%tStageIds[%nId]][1][1], tPlayerPos[%tStageIds[%nId]][1][2]); end);
	JDYY_GoToStage(self.father, self.father.father, nId);
end

function tStage01_1:onTimeout()
	this:Msg2MSAll("��i tr��ng thao t�c qu� gi�, �i �� ��ng l�i.");
	JDYY_CloseMission();
end

function tStage01_1.OnPlayerDeath()
	local self = tStage01_1;
	
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

tStage01_1.actions = {
	[2] = tStage01_1.Init,
};

tStage01_1.cycActions = {
	[1] = {
		[0] = {tStage01_1.Breathe, },
	},
};

tStage01_1.triggers = {
	Talk = {
		{action = tStage01_1.NpcMain},
	},
	PlayerDeath = {
		{action = tStage01_1.OnPlayerDeath},
	},
};
-----------------------------------------------------------------
--	tStage01_2_1
-----------------------------------------------------------------

--	not need

-----------------------------------------------------------------
--	tStage01_2_2
-----------------------------------------------------------------
function tStage01_2_2:MkEventTable()
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage01_2_2:MkDataTable()
	--��֪��ȡ��
	if not self.tPoints_BZH then
		self.tPoints_BZH = {
			{1572,3330},{1563,3340},{1573,3353},{1591,3354},{1605,3349},{1596,3366},{1604,3315},{1590,3312},{1595,3330},{1582,3332},{1554,3349},
		};
	end
	
	--ԡ������ȡ��
	if not self.tPoints_YHCS then
		self.tPoints_YHCS = {
			{1564, 3325}, {1552, 3343}, {1562, 3359}, {1584, 3371}, {1604, 3368}, {1608, 3332}, {1602, 3305}, {1587, 3304},
		};
	end
	
	if not self.tPoints_HSZY then
		self.tPoints_HSZY = {
			{{1597, 3314}, {{1572, 3330}, {1563, 3340}, {1573, 3353}, {1591, 3354},}},
			{{1600, 3357}, {{1605, 3349}, {1596, 3366}, {1604, 3315}, {1590, 3312},}},
			{{1563, 3338}, {{1595, 3330}, {1582, 3332}, {1554, 3349}, {1587, 3332},}},
		};
	end
	
	if not self.tTalks then
		self.tTalks = {
			[04] = {tNpcs.qy[2], "Mau tr�nh H�a Quy�n!"},
			[19] = {tNpcs.qy[2], "Mau tr�nh H�a Quy�n!"},
		};
	end
end

function tStage01_2_2:FreeDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if self.tEventTable and self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = nil;
	end
end

function tStage01_2_2.Breathe()
	SetMissionV(this.mv_04, GetMissionV(this.mv_04) + 1);
	SetMissionV(this.mv_22, GetMissionV(this.mv_22) + 1);
	local self = tStage01_2_2;
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then
		self:MkEventTable();
		self:MkOnceProcedure(1);
		self:ClearExpiredEvent();
	end
	
	if GetMissionV(this.mv_22) > 120 and 0 == getn(self.tEventTable[nMapId].data) then
		self:MkOnceProcedure();
	end
	
	self.tEventTable[nMapId]:breathe();
end

function tStage01_2_2:CreateNpcs()
	local nZrIdx = 0;
	
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nZrIdx = JDYY_CreateNpc(tNpcs_NORMAL.zr, tNpcPos.zr[self.szStageId][1]);
	else
		nZrIdx = JDYY_CreateNpc(tNpcs.zr, tNpcPos.zr[self.szStageId][1]);
	end
	
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
end

function tStage01_2_2:OnTrap(event, data)
	if not tTrapResetPos then return end
	
	JDYY_SetPlayerPos(tTrapResetPos[self.szStageId]);
end

function tStage01_2_2:CreateTraps()
	if not tTrapPoints[self.szStageId] then return end
	
	local nMapId = this.msPosition:getMapID();
	ClearMapTrap(nMapId);
	local nMapId = this.msPosition:getMapID();
	local tTraps = {};
	for i = 1, getn(tTrapPoints[self.szStageId]) do
		tinsert(tTraps, {nMapId, tTrapPoints[self.szStageId][i][1], tTrapPoints[self.szStageId][i][2], thisFile});
	end
	tTraps.n = nil;
	gf_CreateTraps(tTraps);
end

function tStage01_2_2.Init()
	local self = tStage01_2_2;
	SetMissionV(this.mv_04, 0);	--NOW TIME������
	SetMissionV(this.mv_20, 0);	--���ͻ�������
	SetMissionV(this.mv_21, 0);
	SetMissionV(this.mv_22, 1);	--NOW TIME
	SetMissionV(this.mv_23,	0);	--���׵���ʱ
	SetMissionV(this.mv_24, 0);	--�������Ƿ��к��ͻ���Ա�ɹ���BOSS��Ѫ
	SetMissionV(this.mv_25, 0); --��������������(������)
	
	self:CreateNpcs();
	local nQyIdx = JDYY_FindNpc(tNpcs.qy[2]);
	JDYY_SetNpcType2Fight(nQyIdx);
	CastState2Npc(nQyIdx, "state_dispear", 100, 60*60*18);
	
	self:FreeDataTable();
	self:MkDataTable();
	self:MkEventTable();
	self:MkOnceProcedure();
	
	-- ��½������ͳ�����
	-- if eDifType.NORMAL == GetMissionV(this.mv_02) then
	-- 	ds_JDYY:AddStatValue(1, tDataStateList.yanyun_easy_open_1, 1);
	-- elseif eDifType.HARD == GetMissionV(this.mv_02) then
	-- 	ds_JDYY:AddStatValue(1, tDataStateList.yanyun_hard_open_1, 1);
	-- end
	
	--����TRAP
	local nMapId = this.msPosition:getMapID();
	ClearMapTrap(nMapId);
	self:CreateTraps();
	
	this.msCamp:turnPlayer(0, function() JDYY_SetPlayerPos(tPlayerPos["01"][1]); end);
end

--��5�� ��ȭ
function tStage01_2_2.HuoQuan(nZrIdx)
	local self = tStage01_2_2;
	if tNpcs.zr[2] ~= GetNpcName(nZrIdx) then return 0; end
	local _, x, y = GetNpcWorldPos(nZrIdx);

	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end
	
	local tPlayerIndex = JDYY_FindRandomPlayer({x, y}, 4);
	if 0 == getn(tPlayerIndex) then return end
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, getn(tPlayerIndex) do
		PlayerIndex = tPlayerIndex[i];
		DoSkill2Target(nZrIdx, 1785, nSkillLevel, PIdx2NpcIdx(tPlayerIndex[i]));
	end
	PlayerIndex = nOldPlayerIndex;
end

--���׽�
function tStage01_2_2.DaYanJie(nZrIdx)
	local self = tStage01_2_2;
	if tNpcs.zr[2] ~= GetNpcName(nZrIdx) then return 0; end
	
	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end
	
	local _, x, y = GetNpcWorldPos(nZrIdx);
	DoSkill2Pos(nZrIdx, 1787, nSkillLevel, x + 5, y + 5);
end

--��֪��
function tStage01_2_2.BuZhiHuo(nZrIdx)
	local self = tStage01_2_2;
	if tNpcs.zr[2] ~= GetNpcName(nZrIdx) then return 0; end
	
	if not self.tPoints_BZH then
		self:MkDataTable();
	end
	
	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end
	
	local tRandList = floyd_m4n(getn(self.tPoints_BZH), 3);
	for k, v in tRandList do
		DoSkill2Pos(nZrIdx, 1786, nSkillLevel, self.tPoints_BZH[k][1], self.tPoints_BZH[k][2]);
	end
end

--����֮Ӱ
function tStage01_2_2:HuoShenZhiYing()
	if not self.tPoints_HSZY then
		self:MkDataTable();
	end
	
	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end
	
	local tNpcIdx = JDYY_FindAllNpc("H�a Th�n Chi ?nh");
	
	if 0 == getn(tNpcIdx) then
		local nMapId = this.msPosition:getMapID();
		for i = 1, getn(self.tPoints_HSZY) do
			local nNpcIdx = CreateNpc("Th�i Nh�t-��ng L�a", "H�a Th�n Chi ?nh", nMapId, self.tPoints_HSZY[i][1][1], self.tPoints_HSZY[i][1][2]);
			CastState2Npc(nNpcIdx, "state_fetter", 1, 5*60*18);
			SetNpcLifeTime(nNpcIdx, 10);
			tinsert(tNpcIdx, nNpcIdx);
		end
	end
	
	for i = 1, getn(tNpcIdx) do
		for k = 1, getn(self.tPoints_HSZY[i][2]) do
			local x, y = self.tPoints_HSZY[i][2][k][1], self.tPoints_HSZY[i][2][k][2];
			DoSkill2Pos(tNpcIdx[i], 1786, nSkillLevel, x, y);
		end
	end
end

function tStage01_2_2.YuHuoChongSheng(nZrIdx)
	local self = tStage01_2_2;
	
	if GetMissionV(this.mv_04) >= 240 then return end		--���һ���Ӳ���ԡ������
	
	SetMissionV(this.mv_21, 1);
	SetNpcPos(nZrIdx, 1588, 3336);
	
	CastState2Npc(nZrIdx, "state_fetter", 1, 5*60*18, 0, 10003);
	CastState2Npc(nZrIdx, "state_invincibility", 100, 5*60*18, 0, 10004);
	
	NpcChat(nZrIdx, "L�a s� ban cho ta s�c m�nh v� bi�n!");
	
	local nQyIdx = JDYY_FindNpc(tNpcs.qy[2]);
	NpcChat(nQyIdx, "��ng �� qu�i nh� ��n g�n Ch�c Dung, mau di�t ch�ng!");
	
	if not self.tPoints_YHCS then
		self:MkDataTable();
	end
	
	local tRand = floyd_m4n(getn(self.tPoints_YHCS), 3);
	
	local nMapId, x, y = GetNpcWorldPos(nZrIdx);
	
	DoSkill2Pos(nZrIdx, 2115, 1, x, y);
	local szTemplateName = "H� T�ng H�c D�u Thi�n �m Gi�o";
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		szTemplateName = "H� T�ng H�c D�u Thi�n �m Gi�o-Th��ng";
	end
	for k, v in tRand do
		local nNpcIdx = CreateNpc(szTemplateName, "H� T�ng H�c D�u Thi�n �m Gi�o", nMapId, self.tPoints_YHCS[k][1], self.tPoints_YHCS[k][2]);
		SetNpcScript(nNpcIdx, thisFile);
		SetNpcActivator(nNpcIdx);
		
		if 0 ~= nNpcIdx then SetMissionV(this.mv_20, GetMissionV(this.mv_20) + 1); end
		g_NpcAI:setAI(nNpcIdx, AT_SM_MOVE);
		g_NpcAI:setWayPoint(nNpcIdx, {{x, y}, });
	end
	SetMissionV(this.mv_23, 2);
end

--����
function tStage01_2_2.YuHuoChongSheng_YangYan()
	print("[Debug] excute D��ng Vi�m");
	local self = tStage01_2_2;
	
	local tNpcIdx = JDYY_FindAllNpc(tNpcs.hsy[2]);
	if 0 == getn(tNpcIdx) then return end

	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end
	
	SetMissionV(this.mv_23, GetMissionV(this.mv_23) - 1);
	if 0 == GetMissionV(this.mv_23) then
		for i = 1, getn(tNpcIdx) do
			CastState2Npc(tNpcIdx[i], "state_fetter", 1, 6*18, 0, 10003);
			local _, x, y = GetNpcWorldPos(tNpcIdx[i]);
			
			DoSkill2Pos(tNpcIdx[i], 1783, nSkillLevel, x + 5, y + 5);
		end
		
		SetMissionV(this.mv_23, 8);
	end
end

function tStage01_2_2.CheckPos()
	local self = tStage01_2_2;
	if 1 ~= GetMissionV(this.mv_21) then return 0; end
	if 0 == GetMissionV(this.mv_20) then return 0; end
	
	local nZrIdx = JDYY_FindNpc(tNpcs.zr[2]);
	local tNpcIdx = JDYY_FindAllNpc(tNpcs.hsy[2]);
	local _, x, y = GetNpcWorldPos(nZrIdx);
	local fAddPercent = 0;
	local nTime = 0;
	
	local fDelta = 0.15;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		fDelta = 0.05;
	end
	
	for i = 1, getn(tNpcIdx) do
		local _, x1, y1 = GetNpcWorldPos(tNpcIdx[i]);
		if abs(x1 - x) <= 5 and abs(y1 - y) <= 5 then
			RemoveNpc(tNpcIdx[i]);
			SetMissionV(this.mv_20, GetMissionV(this.mv_20) - 1);
			if 0 == GetMissionV(this.mv_20) then
				local nZrIdx = JDYY_FindNpc(tNpcs.zr[2]);
				if 0 == nZrIdx then return 0; end
				RemoveStateFromNpc(nZrIdx, 10003);
				RemoveStateFromNpc(nZrIdx, 10004);
				self:MkOnceProcedure();
			end
			
			fAddPercent = fAddPercent + fDelta;
			nTime = nTime + 1;
		end
	end
	if fAddPercent > 0 then
		SetMissionV(this.mv_24, GetMissionV(this.mv_24) + 1);
		local nMaxLife, _  	= GetUnitBaseStates(nZrIdx, 1);
		local _, nCurLife	= GetUnitCurStates(nZrIdx, 1);
		fAddPercent = (nCurLife / nMaxLife) + fAddPercent;
		if fAddPercent > 1.0 then fAddPercent = 1.0; end
		ModifyNpcData(nZrIdx, 0, floor(nMaxLife * fAddPercent), 0);
		local _, x, y = GetNpcWorldPos(nZrIdx);
		-- for i = 1, nTime do
		-- 	DoSkill2Pos(nZrIdx, 1784, 1, x, y);
		-- 	self:HuoShenZhiYing();
		-- end
		NpcChat(nZrIdx, "Nghi�p H�a Ph�n Thi�n!");
	end
end

function tStage01_2_2:OnNpcDeath(event, data)
	local szName = GetNpcName(data[1]);
	RemoveNpc(data[1]);
	if tNpcs.hsy[2] == szName then
		SetMissionV(this.mv_20, GetMissionV(this.mv_20) - 1);
		if 0 == GetMissionV(this.mv_20) then
			local nZrIdx = JDYY_FindNpc(tNpcs.zr[2]);
			if 0 == nZrIdx then return 0; end
			RemoveStateFromNpc(nZrIdx, 10003);
			RemoveStateFromNpc(nZrIdx, 10004);
			self:MkOnceProcedure();
		end
	elseif tNpcs.zr[2] == szName then
		-- logserver begin
		-- this.msCamp:turnPlayer(0, function() sendKillBossLog(this:mission_name(), %szName, this:mission_stage()) end)
		-- logserver end
		self:StagePassed();
	end
end

function tStage01_2_2.OnPlayerDeath()
	local self = tStage01_2_2;
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
	
	SetMissionV(this.mv_25, GetMissionV(this.mv_25) + 1);
	
	if JDYY_PlayerDeadFailed() then
		this:Msg2MSAll("V��t �i th�t b�i!");
		self:StageEnd();
		SetMissionV(this.mv_30, 1);		--����ʾ�����˾���
		JDYY_GoToStage(self.father, self.father.father, 1);
		
		local szCurStageId = GetMissionS(this.MS_STAGE);
		this.msCamp:turnPlayer(0, JDYY_SetPlayerPos, tPlayerPos[szCurStageId][1]);
	end
end

--��������
function tStage01_2_2:MkOnceProcedure(bNotInit)
	if not bNotInit then
		SetMissionV(this.mv_22, 1);
	end
	local nZrIdx = JDYY_FindNpc(tNpcs.zr[2]);
	if 0 == nZrIdx then return 0; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then
		self:MkEventTable();
	end
	local tEventTable = self.tEventTable[nMapId];
	
	tEventTable:insertevent(5, self.HuoQuan, nZrIdx);
	tEventTable:insertevent(10, self.DaYanJie, nZrIdx);
	tEventTable:insertevent(10, self.BuZhiHuo, nZrIdx);
	tEventTable:insertevent(20, self.HuoQuan, nZrIdx);
	tEventTable:insertevent(25, self.DaYanJie, nZrIdx);
	tEventTable:insertevent(25, self.BuZhiHuo, nZrIdx);
	tEventTable:insertevent(30, self.YuHuoChongSheng, nZrIdx);
--	tEventTable:insertevent(44, self.MkOnceProcedure, self);
end

--����ѹ����¼�
function tStage01_2_2:ClearExpiredEvent()
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return end
	
	local nNowTime = GetMissionV(this.mv_22);
	
	local tData = self.tEventTable[nMapId].data;
	if getn(tData) <= 0 then return end
	
	for i = 1, getn(tData) do
		tData[i][1] = tData[i][1] - nNowTime + 2;
	end
	
	while 1 do
		local nRemoved = nil;
		
		if 0 == getn(tData) then
			break;
		end
		
		if tData[1][1] < 0 then
			tremove(tData, 1);
			nRemoved = 1;
		end
		if not nRemoved then
			break;
		end
	end
end

--ս�������еĶԻ�
function tStage01_2_2.NpcTalk()
	local self = tStage01_2_2;
	
	if not self.tTalks then
		self:MkDataTable();
	end
	
	local nTime = GetMissionV(this.mv_22);
	if self.tTalks[nTime] then
		local nNpcIdx = JDYY_FindNpc(self.tTalks[nTime][1]);
		NpcChat(nNpcIdx, self.tTalks[nTime][2]);
	end
end

function tStage01_2_2:onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	self:StageEnd();
	
	SetMissionV(this.mv_30, 1);		--����ʾ�����˾���
	JDYY_GoToStage(self.father, self.father.father, 1);
	
	local szCurStageId = GetMissionS(this.MS_STAGE);
	this.msCamp:turnPlayer(0, JDYY_SetPlayerPos, tPlayerPos[szCurStageId][1]);
end

--ս����ʱ�����
function tStage01_2_2:StageEnd()
	if self.guage and self.guage.id then
		this.msCamp:turnPlayer(0, StopTimeGuage, self.guage.id);
	end
	
	JDYY_ClearMapNpc();
	JDYY_ReviveAll();
	JDYY_RestoreAll();
	JDYY_ClearAllState();
end

function tStage01_2_2:StagePassed()
	local nMapId = this.msPosition:getMapID();

	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		AddRuntimeStat(44,3,1,1)  --ͳ����ͨͨ��
		AddRuntimeStat(44,10,1,GetMSPlayerCount(this.missionID, 0))
	elseif eDifType.HARD == GetMissionV(this.mv_02) then
		AddRuntimeStat(44,5,1,1)  --ͳ��Ӣ��ͨ��
		AddRuntimeStat(44,11,1,GetMSPlayerCount(this.missionID, 0))
	end
	
	if eDifType.HARD == GetMissionV(this.mv_02) and GetMissionV(this.mv_24) == 0 then
		this.msCamp:turnPlayer(0, function() SetTask(%TASKID_JDYY_SPE_ACH_TASK_1, 1);end)-- OnAchEvent(2, %TASKID_JDYY_SPE_ACH_TASK_1); end);
	elseif GetMissionV(this.mv_24) >= 3 then
		this.msCamp:turnPlayer(0, function() SetTask(%TASKID_JDYY_SPE_ACH_TASK_2, 1);end)-- OnAchEvent(2, %TASKID_JDYY_SPE_ACH_TASK_2); end);
	end
	
	if eDifType.HARD == GetMissionV(this.mv_02) and GetMissionV(this.mv_25) == 0 then
		this.msCamp:turnPlayer(0, function() SetTask(%TASKID_JDYY_SPE_ACH_TASK_3, 1);end)-- OnAchEvent(2, %TASKID_JDYY_SPE_ACH_TASK_3); end);
	end
	
	self:StageEnd();
	
	JDYY_GivePrize(GetMissionS(this.MS_STAGE));
	self:onFinish();
end

tStage01_2_2.actions = {
	[1] = tStage01_2_2.Init,
};

tStage01_2_2.cycActions = {
	[1] = {
		[0] = {tStage01_2_2.CheckPos, tStage01_2_2.Breathe, tStage01_2_2.NpcTalk, }, --tStage01_2_2.YuHuoChongSheng_YangYan
	},
};

tStage01_2_2.triggers = {
	NpcDeath = {
		{action = tStage01_2_2.OnNpcDeath},
	},
	PlayerDeath = {
		{action = tStage01_2_2.OnPlayerDeath},
	},
	Trap = {
		{action = tStage01_2_2.OnTrap},
	},
};

-----------------------------------------------------------------
--	tStage01_2_3
-----------------------------------------------------------------
function tStage01_2_3:MkEventTable()
	local self = tStage01_2_3;
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage01_2_3.Breathe()
	local self = tStage01_2_3;
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	self.tEventTable[nMapId]:breathe();
end

function tStage01_2_3:CreateNpcs()
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
	local nQyIdx = JDYY_CreateNpc(tNpcs.qy, tNpcPos.qy["01_1"][1]);
end

function tStage01_2_3.Init()
	local self = tStage01_2_3;
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 0);
	
	self:CreateNpcs();
	self:FreeDataTable();
	self:MkEventTable();
	local nQyIdx = JDYY_FindNpc(tNpcs.qy[2]);
	JDYY_SetNpcType2Talk(nQyIdx);
end

function tStage01_2_3.RemoveQy(nQyIdx)
	local self = tStage01_2_3;
	RemoveNpc(nQyIdx);
	SendScript2Client('Open([[ma]], 0)');	--�رշ��ƽ���
	self:onFinish();
end

function tStage01_2_3:MkDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if not self.tTalks then self.tTalks = {}; end
	
	if not self.tTalks[nMapId] then
		local nQyIdx = JDYY_FindNpc(tNpcs.qy[2]);
		
		self.tTalks[nMapId] = {
			[1] = {
				{nQyIdx, "Ta s� ��n Tr�y Long C�c, ���ng L�ng Nguy�t �ang � U �m C�c ��i m�i ng��i."},
				{-1, ""},
			},
		};
	end
end

function tStage01_2_3:FreeDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if self.tEventTable and self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = nil;
	end
	
	if self.tTalks and self.tTalks[nMapId] then
		self.tTalks[nMapId] = nil;
	end
end

function tStage01_2_3.NpcTalk()
	if 0 ~= GetMissionV(this.mv_22) then return 0; end
	local self = tStage01_2_3;
	
	local nMapId = this.msPosition:getMapID();
	if not self.tTalks or not self.tTalks[nMapId] then
		self:MkDataTable();
	end
	
	local nPrg = GetMissionV(this.mv_20);
	local nStc = GetMissionV(this.mv_21);
	if not self.tTalks[nMapId][nPrg] then return 0; end
	
	if self.tTalks[nMapId][nPrg][nStc][1] < 0 then
		SetMissionV(this.mv_22, 1);
		
		local nQyIdx = JDYY_FindNpc(tNpcs.qy[2]);
		g_NpcAI:setAI(nQyIdx, AT_SM_MOVE);
		g_NpcAI:setWayPoint(nQyIdx, {{1545, 3354}, });
		
		self.tEventTable[nMapId]:insertevent(15, tStage01_2_3.RemoveQy, nQyIdx);
		return 0;
	end
	NpcChat(self.tTalks[nMapId][nPrg][nStc][1], self.tTalks[nMapId][nPrg][nStc][2]);
	SetMissionV(this.mv_21, nStc + 1);
end

function tStage01_2_3.OnPlayerDeath()
	local self = tStage01_2_3;
	
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage01_2_3:onTimeout()
	this:Msg2MSAll("��i tr��ng thao t�c qu� gi�, �i �� ��ng l�i.");
	JDYY_CloseMission();
end

tStage01_2_3.actions = {
	[1] = tStage01_2_3.Init,
};

tStage01_2_3.cycActions = {
	[1] = {
		[0] = {tStage01_2_3.Breathe, },
	},
	[2] = {
		[0] = {tStage01_2_3.NpcTalk, },
	},
};

tStage01_2_3.triggers = {
	PlayerDeath = {
		{action = tStage01_2_3.OnPlayerDeath},
	},
};
-----------------------------------------------------------------
tStage01_2.phases 	= {tStage01_2_2, tStage01_2_3};
tStage01.phases 	= {tStage01_1, tStage01_2};
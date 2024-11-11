--����
-----------------------------------------------------------------
tStage04 = {
	name = "Thi�n V�",
	szStageId = "04",
	maxsecond = 15 * 60,
	actionsType = "second",
};
tStage04 = inherit(cycPhase, tStage04);

tStage04_1 = {
	name = "Thi�n V�-Chu�n b�",
	szStageId = "04_1",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "Giai �o�n chu�n b�",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};
tStage04_1 = inherit(cycPhase, tStage04_1);

tStage04_2 = {
	name = "Thi�n V�",
	szStageId = "04_2",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage04_2 = inherit(cycPhase, tStage04_2);

tStage04_3 = {
	name = "Giai �o�n k�t th�c",
	szStageId = "04_3",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage04_3 = inherit(cycPhase, tStage04_3);

--ǰ�԰�
tStage04_2_1 = {
	name = "Thi�n V� 1",
	szStageId = "04_2_1",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage04_2_1 = inherit(cycPhase, tStage04_2_1);

--��԰�
tStage04_2_3 = {
	name = "Thi�n V� 3",
	szStageId = "04_2_3",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "Th�i gian l�t",
		time = 15,
		cyc = 0,
		id = 2,
	},
};
tStage04_2_3 = inherit(cycPhase, tStage04_2_3);

tStage04_2_2 = {
	name = "Thi�n V� 2",
	szStageId = "04_2_2",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "Thi�n V�",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};
tStage04_2_2 = inherit(cycPhase, tStage04_2_2);
-----------------------------------------------------------------
--	tStage04
-----------------------------------------------------------------
function tStage04.Init()
	local self = tStage04;
end

tStage04.actions = {
	[2] = tStage04.Init,
};

tStage04.triggers = {
};

-----------------------------------------------------------------
--	tStage04_1
-----------------------------------------------------------------
function tStage04_1:MkEventTable()
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage04_1:Breathe()
	local self = tStage04_1;
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	self.tEventTable[nMapId]:breathe();
end

function tStage04_1:CreateNpcs()
	local nSlIdx = 0;
	local nSmmfIdx = JDYY_CreateNpc(tNpcs.smmf, tNpcPos.smmf[self.szStageId][1]);
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSlIdx = JDYY_CreateNpc(tNpcs_NORMAL.sl, tNpcPos.sl[self.szStageId][1]);
	else
		nSlIdx = JDYY_CreateNpc(tNpcs.sl, tNpcPos.sl[self.szStageId][1]);
	end
	
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
	SetNpcActivator(nSmmfIdx);
	SetNpcActivator(nSlIdx);
	
	JDYY_SetNpcType2Talk(nSmmfIdx);
	JDYY_SetNpcType2Talk(nSlIdx);
end

function tStage04_1:BringDeathPlayerToFight()
	local tPlayerIndex = this.msCamp:reflash();
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, getn(tPlayerIndex) do
		PlayerIndex = tPlayerIndex[i];
		if JDYY_InDeathArea() then
			JDYY_SetPlayerPos(tPlayerPos["04"][1]);
		end
	end
	PlayerIndex = nOldPlayerIndex;
end

function tStage04_1.Init()
	local self = tStage04_1;
	-- logserver begin
	-- this.msCamp:turnPlayer(0, function() sendSwitchStageLog(this:mission_name(), %self.father.szStageId, this:mission_stage()) end)
	-- logserver end
	SetMissionS(this.MS_STAGE, self.father.szStageId);
	
--	JDYY_RestoreAll();
	self:CreateNpcs();
	self:BringDeathPlayerToFight();
end

function tStage04_1:OpenStage()
	local nTaskID 	= 0
	local nDifType = GetMissionV(this.mv_02)
	if nDifType == eDifType.NORMAL then
		nTaskID = TASKID_JDYY_DAILY_TIME_NORMAL;
		AddRuntimeStat(44,2,4,1) --ͳ��jdyy_Normal_OpenStage
	elseif nDifType == eDifType.HARD then
		nTaskID = TASKID_JDYY_DAILY_TIME_HARD;
		AddRuntimeStat(44,4,4,1)
	else
		return 0
	end

	local self = tStage04_1;
	self:onFinish();
end

function tStage04_1:OnPlayerDeath()
	local self = tStage04_1;
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage04_1:onTimeout()
	this:Msg2MSAll("��i tr��ng thao t�c qu� gi�, �i �� ��ng l�i.");
	JDYY_CloseMission();
end

function tStage04_1:NpcMain()
	local nNpcIdx = GetTargetNpc();
	local szNpcName = GetNpcName(nNpcIdx);
	if szNpcName == tNpcs.smmf[2] then
		if not JDYY_IsCaptain() then
			Talk(1, "", "<color=green>Ti M� Minh Phong:<color> Ch� ��i tr��ng ���c thao t�c!");
			return 0;
		else
			local strTab = {
				"M� �i th� 4: Thi�n V�			/#tStage04_1.OpenStage()",
				"R�i c�a �i					/#JDYY_ConfirmClose('T� M� Minh Phong')",	
				"H�y b�						/nothing",
			};
			Say("<color=green>Ti M� Minh Phong:<color> V� L��ng Minh V��ng Sa La l� h�a th�n c�a Ph�t T�, l�i h�i v� c�ng, c�c v� h�y c�n th�n ��i ph�. ��i hi�p �� s�n s�ng?", getn(strTab), strTab);
		end
	end
end

tStage04_1.actions = {
	[2] = tStage04_1.Init,
};

tStage04_1.triggers = {
	Talk = {
		{action = tStage04_1.NpcMain},
	},
	PlayerDeath = {
		{action = tStage04_1.OnPlayerDeath},
	},
};

-----------------------------------------------------------------
--	tStage04_2_1
-----------------------------------------------------------------
function tStage04_2_1:Init()
	local self = tStage04_2_1;
	
	self:FreeDataTable();
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
end

function tStage04_2_1:MkDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if not self.tTalks then self.tTalks = {}; end
	
	if not self.tTalks[nMapId] then
		local nSlIdx = JDYY_FindNpc(tNpcs.sl[2]);
		
		self.tTalks[nMapId] = {
			[1] = {
				{nSlIdx, "T�t c� ch� l� h� v�!"},
				{-1, ""},
			},
		};
	end
end

function tStage04_2_1:FreeDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if self.tEventTable and self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = nil;
	end
	
	if self.tTalks and self.tTalks[nMapId] then
		self.tTalks[nMapId] = nil;
	end
end

function tStage04_2_1.NpcTalk()
	local self = tStage04_2_1;
	
	local nMapId = this.msPosition:getMapID();
	
	if not self.tTalks or not self.tTalks[nMapId] then
		self:MkDataTable();
	end
	
	local nPrg = GetMissionV(this.mv_20);
	local nStc = GetMissionV(this.mv_21);
	if not self.tTalks[nMapId][nPrg] then return 0; end
	
	if self.tTalks[nMapId][nPrg][nStc][1] < 0 then
		self:onFinish();
		return 0;
	end
	NpcChat(self.tTalks[nMapId][nPrg][nStc][1], self.tTalks[nMapId][nPrg][nStc][2]);
	SetMissionV(this.mv_21, nStc + 1);
end

tStage04_2_1.actions = {
	[1] = tStage04_2_1.Init,
};

tStage04_2_1.cycActions = {
	[2] = {
		[0] = {tStage04_2_1.NpcTalk, },
	},
};

-----------------------------------------------------------------
--	tStage04_2_2
-----------------------------------------------------------------
function tStage04_2_2:MkEventTable()
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage04_2_2.Breathe()
	SetMissionV(this.mv_24, GetMissionV(this.mv_24) + 1);
	local self = tStage04_2_2;
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then
		self:MkEventTable();
		self:MkOnceProcedure(1);
		self:ClearExpiredEvent();
	end
	self.tEventTable[nMapId]:breathe();
end

function tStage04_2_2:CreateNpcs()
	local nSlIdx = JDYY_FindNpc(tNpcs.sl[2]);
	local nTbhIdx = JDYY_CreateNpc(tNpcs.tbh, tNpcPos.tbh[self.szStageId][1]);
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
	local nSmmfIdx = JDYY_FindNpc(tNpcs.smmf[2]);
	
	SetNpcActivator(nTbhIdx);
	
	CastState2Npc(nSlIdx, "state_fetter", 1, 5*60*18, 0, 10001);
	CastState2Npc(nTbhIdx, "state_fetter", 1, 5*60*18, 0, 10001);
	CastState2Npc(nSmmfIdx, "state_fetter", 1, 5*60*18, 0, 10001);
	SetNpcPos(nSmmfIdx, 1704, 3553);
	JDYY_SetNpcType2Fight(nSlIdx);
end

function tStage04_2_2:CreateTraps()
	local self = tStage04_2_2;
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

function tStage04_2_2:MkDataTable()
	if not self.tSkills then
		self.tSkills = {1796, 1797, 1798, 1799, 1800,};
	end
	
	if not self.tPoints_XCDY then
		self.tPoints_XCDY = {
			{{1693, 3549},{1710, 3559},{1714, 3581},{1722, 3615},{1695, 3620},},
			{{1667, 3617},{1674, 3587},{1700, 3566},{1706, 3579},{1702, 3600},},
			{{1685, 3605},{1679, 3588},{1691, 3592},{1674, 3571},{1692, 3604},},
		};
	end
	
	if not self.tPoints_BYJ then
		self.tPoints_BYJ = {
			{1680, 3602},{1691, 3610},{1706, 3599},{1702, 3574},{1689, 3567},{1712, 3578},{1711, 3611},{1694, 3619},
		};
	end
end

function tStage04_2_2:FreeDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if self.tEventTable and self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = nil;
	end
end

function tStage04_2_2.Init()
	local self = tStage04_2_2;
	SetMissionV(this.mv_22, 0);		-- Ѫ�ص�����ʼ�ͷ�
	SetMissionV(this.mv_23, 0);		-- Ѫ�ص���ȡ��Index
	SetMissionV(this.mv_24, 0);
	SetMissionV(this.mv_25, 0);		--Ŀ�����PlayerIndex
	SetMissionV(this.mv_26, 0);		--Ŀ�����ID
	SetMissionV(this.mv_27, 0);		--����������������������ˣ�
	
	self:FreeDataTable();
	self:MkEventTable();
	self:CreateNpcs();
	local nSmmfIdx = JDYY_FindNpc(tNpcs.smmf[2]);
	JDYY_SetNpcType2Fight(nSmmfIdx);
	self:MkOnceProcedure();
	
	local nSlIdx = JDYY_FindNpc(tNpcs.sl[2]);
	if nSlIdx then
		SetCurrentNpcSFX(nSlIdx, 996, 3, 1);
	end
	
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		ds_JDYY:AddStatValue(1, tDataStateList.yanyun_easy_open_4, 1);
	elseif eDifType.HARD == GetMissionV(this.mv_02) then
		ds_JDYY:AddStatValue(1, tDataStateList.yanyun_hard_open_4, 1);
	end
	
	--����TRAP
	local nMapId = this.msPosition:getMapID();
	ClearMapTrap(nMapId);
	self:CreateTraps();
	
	this.msCamp:turnPlayer(0, function() JDYY_SetPlayerPos(tPlayerPos["04"][1]); end);
end

--�����ֻ�
function tStage04_2_2.LiuDaoLunHui(nNpcIdx)
	local self = tStage04_2_2;
	
	local _, x, y = GetNpcWorldPos(nNpcIdx);
	local tPlayerIndex = JDYY_FindRandomPlayer({x, y}, 5);
	
	local nStateValue = 118030356;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nStateValue = 118030346;
	end
	
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, getn(tPlayerIndex) do
		PlayerIndex = tPlayerIndex[i];
		CastState("state_diffuse_skill_effect", nStateValue, 10*18);
		SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 986, 1, 1);
	end
	PlayerIndex = nOldPlayerIndex;
	
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	local tEventTable = self.tEventTable[nMapId];
	
	tEventTable:insertevent(5, JDYY_ClearPlayerSFX);					--5�������Ч
end

--Ѫ�ص���.��ʼ
function tStage04_2_2.XueChiDiYu_Begin(nNpcIdx)
	local self = tStage04_2_2;
	
	NpcChat(nNpcIdx, "K� l�m vi�c �c, tr�y l�c ��a ng�c");
	local _, x, y = GetNpcWorldPos(nNpcIdx);
	local tPlayerIndex = JDYY_FindRandomPlayer({x, y}, 1);
	if getn(tPlayerIndex) == 0 then return end
	
	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = tPlayerIndex[1];
	local nPlayerID = GetPlayerID();
	PlayerIndex = nOldPlayerIndex;
	
	SetMissionV(this.mv_22, 1);
	SetMissionV(this.mv_23, 1);
	SetMissionV(this.mv_25, tPlayerIndex[1]);
	SetMissionV(this.mv_26, nPlayerID);
end

function tStage04_2_2.XueChiDiYu_End()
	SetMissionV(this.mv_22, 0);
end

function tStage04_2_2.XueChiDiYu_DoSkill()
	local self = tStage04_2_2;
	
	local nNpcIdx = JDYY_FindNpc(tNpcs.sl[2]);
	
	if nNpcIdx == 0 then return 0; end
	if GetMissionV(this.mv_22) ~= 1 then return 0; end
	
	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end

	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = GetMissionV(this.mv_25);
	if GetPlayerID() ~= GetMissionV(this.mv_26) then
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end
	DoSkill2Target(nNpcIdx, 2121, nSkillLevel, PIdx2NpcIdx(PlayerIndex));
	PlayerIndex = nOldPlayerIndex;

--	if not self.tPoints_XCDY then
--		self:MkDataTable();
--	end
--	
--	local nIndex = GetMissionV(this.mv_23);
--	if not (nIndex >= 1 and nIndex <= getn(self.tPoints_XCDY)) then
--		nIndex = 1;
--	end
--	
--	local tPoints = self.tPoints_XCDY[nIndex];
--
--	if tPoints then
--		for i = 1, getn(tPoints) do
--			DoSkill2Pos(nNpcIdx, 2121, nSkillLevel, tPoints[i][1], tPoints[i][2]);
--		end
--	end
--	
--	SetMissionV(this.mv_23, nIndex + 1);
end

--��ħ����
function tStage04_2_2.TianMoXiangFu(nSlIdx)
	local self = tStage04_2_2;
	
	if GetNpcName(nSlIdx) ~= tNpcs.sl[2] then return end
	NpcChat(nSlIdx, "Li�n ��i ph�t quang, h�ng ph�c k� �c");
	
	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end
	local _, x, y = GetNpcWorldPos(nSlIdx);
	DoSkill2Pos(nSlIdx, 2120, nSkillLevel, x, y);
end

function tStage04_2_2.TianWuBaoLun_YinChang(nNpcIdx)
	local self = tStage04_2_2;
	
	local szNpcName = GetNpcName(nNpcIdx);
	if szNpcName ~= tNpcs.sl[2] then return end
	local _, x, y = GetNpcWorldPos(nNpcIdx);
	DoSkill2Pos(nNpcIdx, 1795, 1, x, y);
	--DoSkill2Target(nNpcIdx, 1795, 1, nNpcIdx);
end

--���豦��.����
function tStage04_2_2.TianWuBaoLun_Atk(nNpcIdx)
	local self = tStage04_2_2;
	if not self.tSkills or not self.tPoints_BYJ then
		self:MkDataTable();
	end
	
	local nRand = random(1, getn(self.tSkills));
	local nSkillId = self.tSkills[nRand];
	local nSkillLevel = 20;
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		nSkillLevel = 10;
	end
	
	local nMapId = this.msPosition:getMapID();
	local _, x, y = GetNpcWorldPos(nNpcIdx);
	local tPlayerIndex = JDYY_FindRandomPlayer({x, y}, 8);
	
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, getn(tPlayerIndex) do
		PlayerIndex = tPlayerIndex[i];
		DoSkill2Target(nNpcIdx, nSkillId, nSkillLevel, PIdx2NpcIdx(PlayerIndex));
		
		if i <= 4 then
			local nNpcIdx = CreateNpc("B�t V�n Ki�m", "B�t V�n Ki�m", nMapId, self.tPoints_BYJ[i][1], self.tPoints_BYJ[i][2]);
			SetCampToNpc(nNpcIdx, CampEnemy);
			SetNpcScript(nNpcIdx, thisFile);
			SetNpcLifeTime(nNpcIdx, 10);
		end
	end
	PlayerIndex = nOldPlayerIndex;
end

function tStage04_2_2:MkOnceProcedure(bNotInit)
	local self = tStage04_2_2;
	
	local nSlIdx = JDYY_FindNpc(tNpcs.sl[2]);
	if 0 == nSlIdx then return 0; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	local tEventTable = self.tEventTable[nMapId];
	
	if not bNotInit then
		SetMissionV(this.mv_24, 1);
	end
	
	tEventTable:insertevent(5, self.LiuDaoLunHui, nSlIdx);					--�����ֻ�
	tEventTable:insertevent(10, self.XueChiDiYu_Begin, nSlIdx);				--Ѫ�ص���
	tEventTable:insertevent(14, self.XueChiDiYu_End, nSlIdx);				--Ѫ�ص���
	tEventTable:insertevent(20, self.TianMoXiangFu, nSlIdx);				--��ħ����
	tEventTable:insertevent(30, self.TianWuBaoLun_YinChang, nSlIdx);		--���豦��.����
	tEventTable:insertevent(35, self.TianWuBaoLun_Atk, nSlIdx);				--���豦��.����
	tEventTable:insertevent(45, self.TianMoXiangFu, nSlIdx);				--��ħ����
	tEventTable:insertevent(48, self.MkOnceProcedure, self);				--48����������
end

--����ѹ����¼�
function tStage04_2_2:ClearExpiredEvent()
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return end
	
	local nNowTime = GetMissionV(this.mv_24);
	local tData = self.tEventTable[nMapId].data;
	
	if getn(tData) <= 0 then return end
	
	for i = 1, getn(tData) do
		tData[i][1] = tData[i][1] - nNowTime + 2;
	end
	
	while 1 do
		local nRemoved = nil;
		if tData[1][1] < 0 then
			tremove(tData, 1);
			nRemoved = 1;
		end
		if not nRemoved then
			break;
		end
	end
end

function tStage04_2_2:OnNpcDeath(event, data)
	local szName = GetNpcName(data[1]);
	if tNpcs.sl[2] == szName then
		-- logserver begin
		-- this.msCamp:turnPlayer(0, function() sendKillBossLog(this:mission_name(), %szName, this:mission_stage()) end)
		-- logserver end
		self:StagePassed();
	end
end

function tStage04_2_2:OnTrap(event, data)
	if not tTrapResetPos then return end
	
	JDYY_SetPlayerPos(tTrapResetPos[self.szStageId]);
end

function tStage04_2_2.OnPlayerDeath()
	local self = tStage04_2_2;
	
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
	
	SetMissionV(this.mv_27, GetMissionV(this.mv_27) + 1);
	
	if JDYY_PlayerDeadFailed() then
		this:Msg2MSAll("V��t �i th�t b�i!");
		self:StageEnd();
		
		JDYY_GoToStage(self.father, self.father.father, 1);
		
		local szCurStageId = GetMissionS(this.MS_STAGE);
		this.msCamp:turnPlayer(0, JDYY_SetPlayerPos, tPlayerPos[szCurStageId][1]);
	end
	
end

function tStage04_2_2:StagePassed()
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		AddRuntimeStat(44,3,4,1)  --ͳ����ͨͨ��
		AddRuntimeStat(44,10,4,GetMSPlayerCount(this.missionID, 0))
	elseif eDifType.HARD == GetMissionV(this.mv_02) then
		AddRuntimeStat(44,5,4,1)  --ͳ��Ӣ��ͨ��
		AddRuntimeStat(44,11,4,GetMSPlayerCount(this.missionID, 0))
	end
	if eDifType.HARD == GetMissionV(this.mv_02) and GetMissionV(this.mv_27) == 0 then
		this.msCamp:turnPlayer(0, function() SetTask(%TASKID_JDYY_SPE_ACH_TASK_6, 1);end)-- OnAchEvent(2, %TASKID_JDYY_SPE_ACH_TASK_6); end);
	end
	
	self:StageEnd();
	JDYY_GivePrize(GetMissionS(this.MS_STAGE));
	self:onFinish();
end

function tStage04_2_2:StageEnd()
	if self.guage and self.guage.id then
		this.msCamp:turnPlayer(0, StopTimeGuage, self.guage.id);
	end
	
	this.msCamp:turnPlayer(0, function() RemvoeTempEffect(); end);
	
	JDYY_ClearPlayerSFX();
	JDYY_ClearMapNpc();
	JDYY_ReviveAll();
	JDYY_RestoreAll();
	JDYY_ClearAllState();
end

function tStage04_2_2:onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	self:StageEnd();
	
	JDYY_GoToStage(self.father, self.father.father, 1);
	
	local szCurStageId = GetMissionS(this.MS_STAGE);
	this.msCamp:turnPlayer(0, JDYY_SetPlayerPos, tPlayerPos[szCurStageId][1]);
end

function tStage04_2_2:NpcMain()
	local nNpcIdx = GetTargetNpc();
	local szNpcName = GetNpcName(nNpcIdx);
	
	if szNpcName == "B�t V�n Ki�m" then
		JDYY_SetNpcType2Fight(nNpcIdx);
		SetNpcLifeTime(nNpcIdx, 1);
		CastState2Npc(nNpcIdx, "state_fetter", 1, 5*60*18);
		DoSkill2Target(nNpcIdx, 2152, 10, PIdx2NpcIdx(PlayerIndex));
	end
end

tStage04_2_2.actions = {
	[1] = tStage04_2_2.Init,
};

tStage04_2_2.cycActions = {
	[1] = {
		[0] = {tStage04_2_2.Breathe, tStage04_2_2.CheckPlayerMoved, tStage04_2_2.XueChiDiYu_DoSkill},
	},
};

tStage04_2_2.triggers = {
	Talk = {
		{action = tStage04_2_2.NpcMain},
	},
	NpcDeath = {
		{action = tStage04_2_2.OnNpcDeath},
	},
	PlayerDeath = {
		{action = tStage04_2_2.OnPlayerDeath},
	},
	Trap = {
		{action = tStage04_2_2.OnTrap},
	},
};

-----------------------------------------------------------------
--	tStage04_2_3
-----------------------------------------------------------------
function tStage04_2_3:MkEventTable()
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage04_2_3:Breathe()
	local self = tStage04_2_3;
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	self.tEventTable[nMapId]:breathe();
end

function tStage04_2_3:CreateNpcs()
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
	local nSlIdx = JDYY_CreateNpc(tNpcs.sl, tNpcPos.sl["04_1"][1]);
	JDYY_SetNpcType2Talk(nSlIdx);
end

function tStage04_2_3:Init()
	local self = tStage04_2_3;
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	
	self:CreateNpcs();
	self:FreeDataTable();
	self:MkEventTable();
	local nSmmfIdx = JDYY_FindNpc(tNpcs.smmf[2]);
	JDYY_SetNpcType2Talk(nSmmfIdx);
end

function tStage04_2_3:MkDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if not self.tTalks then self.tTalks = {}; end
	
	if not self.tTalks[nMapId] then
		local nSlIdx = JDYY_FindNpc(tNpcs.sl[2]);
		
		self.tTalks[nMapId] = {
			[1] = {
				{nSlIdx, "C�c v� v� c�ng cao c��ng, b�n t�ng ch�u thua. Gi�o ch� �ang � Tr�y Long C�c, c�c v� h�y v�o n�m th� H�ng Li�n Ng� S�t."},
				{-1, ""},
			},
		};
	end
end

function tStage04_2_3:FreeDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if self.tEventTable and self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = nil;
	end
	
	if self.tTalks and self.tTalks[nMapId] then
		self.tTalks[nMapId] = nil;
	end
end

function tStage04_2_3:StagePassed()
	JDYY_ClearMapNpc();
	SendScript2Client('Open([[ma]], 0)');	--�رշ��ƽ���
	self:onFinish();
end

function tStage04_2_3.NpcTalk()
	local self = tStage04_2_3;
	
	local nMapId = this.msPosition:getMapID();
	if not self.tTalks or not self.tTalks[nMapId] then
		self:MkDataTable();
	end
	
	local nPrg = GetMissionV(this.mv_20);
	local nStc = GetMissionV(this.mv_21);
	if not self.tTalks[nMapId][nPrg] then return 0; end
	
	if self.tTalks[nMapId][nPrg][nStc][1] < 0 then
		--self:StagePassed();
		self.tEventTable[nMapId]:insertevent(15, tStage04_2_3.StagePassed, self);
		return 0;
	end
	
	NpcChat(self.tTalks[nMapId][nPrg][nStc][1], self.tTalks[nMapId][nPrg][nStc][2]);
	SetMissionV(this.mv_21, nStc + 1);
end

function tStage04_2_3.OnPlayerDeath()
	local self = tStage04_2_3;
	
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage04_2_3:onTimeout()
	this:Msg2MSAll("��i tr��ng thao t�c qu� gi�, �i �� ��ng l�i.");
	JDYY_CloseMission();
end

tStage04_2_3.actions = {
	[1] = tStage04_2_3.Init,
};

tStage04_2_3.cycActions = {
	[1] = {
		[0] = {tStage04_2_3.Breathe, },
	},
	[2] = {
		[0] = {tStage04_2_3.NpcTalk, },
	},
};

tStage04_2_3.triggers = {
	PlayerDeath = {
		{action = tStage04_2_3.OnPlayerDeath},
	},
};

tStage04_2.phases = {tStage04_2_1, tStage04_2_2, tStage04_2_3};
tStage04.phases = {tStage04_1, tStage04_2};
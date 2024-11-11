--����ģʽ
-----------------------------------------------------------------
tStage06 = {
	name = "H�nh th�c Sao ch�p",
	szStageId = "06",
	maxsecond = 15 * 60,
	actionsType = "second",
};
tStage06 = inherit(cycPhase, tStage06);

tStage06_1 = {
	name = "H�nh th�c Sao ch�p -Chu�n b�",
	szStageId = "06_1",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "Giai �o�n chu�n b�",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};
tStage06_1 = inherit(cycPhase, tStage06_1);

tStage06_2 = {
	name = "H�nh th�c Sao ch�p",
	szStageId = "06_2",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage06_2 = inherit(cycPhase, tStage06_2);

tStage06_3 = {
	name = "Giai �o�n k�t th�c",
	szStageId = "06_3",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage06_3 = inherit(cycPhase, tStage06_3);

--ǰ�԰�
tStage06_2_1 = {
	name = "H�nh th�c Sao ch�p 1",
	szStageId = "06_2_1",
	maxsecond = 5 * 60,
	actionsType = "second",
};
tStage06_2_1 = inherit(cycPhase, tStage06_2_1);

--��԰�
tStage06_2_3 = {
	name = "H�nh th�c Sao ch�p 3",
	szStageId = "06_2_3",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "K�t th�c",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};
tStage06_2_3 = inherit(cycPhase, tStage06_2_3);

tStage06_2_2 = {
	name = "H�nh th�c Sao ch�p 2",
	szStageId = "06_2_2",
	maxsecond = 5 * 60,
	actionsType = "second",
	guage = {
		msg = "H�nh th�c Sao ch�p",
		time = 5 * 60,
		cyc = 0,
		id = 2,
	},
};
tStage06_2_2 = inherit(cycPhase, tStage06_2_2);

-----------------------------------------------------------------
--	tStage06_1
-----------------------------------------------------------------
function tStage06_1:MkEventTable()
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage06_1:Breathe()
	local self = tStage06_1;
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	self.tEventTable[nMapId]:breathe();
end

function tStage06_1:CreateNpcs()
	local nLfIdx = JDYY_CreateNpc(tNpcs.lf, tNpcPos.lf[self.szStageId][1]);
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
	JDYY_SetNpcType2Talk(nLfIdx);
end

function tStage06_1:BringDeathPlayerToFight()
	local tPlayerIndex = this.msCamp:reflash();
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, getn(tPlayerIndex) do
		PlayerIndex = tPlayerIndex[i];
		if JDYY_InDeathArea() then
			JDYY_SetPlayerPos(tPlayerPos["06"][1]);
		end
	end
	PlayerIndex = nOldPlayerIndex;
end

function tStage06_1.Init()
	local self = tStage06_1;
	-- logserver begin
	-- this.msCamp:turnPlayer(0, function() sendSwitchStageLog(this:mission_name(), %self.father.szStageId, this:mission_stage()) end)
	-- logserver end
	SetMissionS(this.MS_STAGE, self.father.szStageId);
	
--	JDYY_RestoreAll();
	self:CreateNpcs();
	self:BringDeathPlayerToFight();
end

function tStage06_1:OpenStage()
	
	local nDifType = GetMissionV(this.mv_02)
	if nDifType == eDifType.NORMAL then
		AddRuntimeStat(44,2,6,1) --ͳ��jdyy_Normal_OpenStage
	elseif nDifType == eDifType.HARD then
		AddRuntimeStat(44,4,6,1)
	else
		return 0
	end
	
	local self = tStage06_1;
	self:onFinish();
end

function tStage06_1:OnPlayerDeath()
	local self = tStage06_1;
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage06_1:NpcMain()
	if not JDYY_IsCaptain() then
		Talk(1, "", "<color=green>Hoa Th�nh L�c Phi:<color> Ch� ��i tr��ng ���c thao t�c!");
		return 0;
	else
		local strTab = {
			"M� h�nh th�c Sao ch�p	/#tStage06_1.OpenStage()",
			"R�i c�a �i		/#JDYY_ConfirmClose('Hoa Th�nh L�c Phi')",	
			"H�y b�			/nothing",
		};
		Say("<color=green>Hoa Th�nh L�c Phi:<color> ��i hi�p �� s�n s�ng?", getn(strTab), strTab);
	end
end

function tStage06_1:onTimeout()
	this:Msg2MSAll("��i tr��ng thao t�c qu� gi�, �i �� ��ng l�i.");
	JDYY_CloseMission();
end

tStage06_1.actions = {
	[2] = tStage06_1.Init,
};

tStage06_1.triggers = {
	Talk = {
		{action = tStage06_1.NpcMain},
	},
	PlayerDeath = {
		{action = tStage06_1.OnPlayerDeath},
	},
};

-----------------------------------------------------------------
--	tStage06_2_1
-----------------------------------------------------------------
function tStage06_2_1:Init()
	local self = tStage06_2_1;
	
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	self:FreeDataTable();
end

function tStage06_2_1:MkTalkTable()
	local nMapId = this.msPosition:getMapID();
	
	if not self.tTalks then self.tTalks = {}; end
	
	if not self.tTalks[nMapId] then
		local nLfIdx = JDYY_FindNpc(tNpcs.lf[2]);
		local nHyIdx = JDYY_FindNpc(tNpcs.hy[2]);
		
		self.tTalks[nMapId] = {
			[1] = {
				--{nLfIdx, "ʦ�����ɹ�������ս���Ѿ�������ȥ�����ֺαطɶ��˻��ء���"},
				--{nHyIdx, "�ߣ�������������������ע��������ɱ����ֻ�����У����ܽ�ס�����б����������뿪������̤����ԭ��"},
				{-1, ""},
			},
		};
	end
end

function tStage06_2_1:FreeDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if self.tTalks and self.tTalks[nMapId] then
		self.tTalks[nMapId] = nil;
	end
end

function tStage06_2_1.NpcTalk()
	local self = tStage06_2_1;
	
	local nMapId = this.msPosition:getMapID();
	if not self.tTalks or not self.tTalks[nMapId] then
		self:MkTalkTable();
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

tStage06_2_1.actions = {
	[1] = tStage06_2_1.Init,
};

tStage06_2_1.cycActions = {
	[2] = {
		[0] = {tStage06_2_1.NpcTalk, },
	},
};

-----------------------------------------------------------------
--	tStage06_2_2
-----------------------------------------------------------------
function tStage06_2_2:MkEventTable()
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage06_2_2:Breathe()
	SetMissionV(this.mv_24, GetMissionV(this.mv_24) + 1);
	local self = tStage06_2_2;
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then
		self:MkEventTable();
		self:MkOnceProcedure();
	end
	self.tEventTable[nMapId]:breathe();
end

function tStage06_2_2:CreateNpcs()
	local nZrIdx  = JDYY_CreateNpc(tNpcs_CHEAT.zr, tNpcPos.zr[self.szStageId][1]);
	local nYyIdx  = JDYY_CreateNpc(tNpcs_CHEAT.yy, tNpcPos.yy[self.szStageId][1]);
	local nSyyIdx  = JDYY_CreateNpc(tNpcs_CHEAT.syy, tNpcPos.syy[self.szStageId][1]);
	local nSlIdx  = JDYY_CreateNpc(tNpcs_CHEAT.sl, tNpcPos.sl[self.szStageId][1]);
	local nHyIdx  = JDYY_CreateNpc(tNpcs_CHEAT.hy, tNpcPos.hy[self.szStageId][1]);
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
end

function tStage06_2_2:CreateTraps()
	local self = tStage06_2_2;
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

function tStage06_2_2.Init()
	local self = tStage06_2_2;
	SetMissionV(this.mv_20, 1);	--BOSS��ǰ���ڵڼ��׶�
	SetMissionV(this.mv_21, 0);	--BOSS�ڻ�Ȧ���ʱ��
	SetMissionV(this.mv_22, 0);	--��������
	SetMissionV(this.mv_23, 0);	--�����1��
	SetMissionV(this.mv_24, 0);	--�����2��
	SetMissionV(this.mv_25, 0);	--�����3��
	SetMissionV(this.mv_26, 0);	--�����4��
	SetMissionV(this.mv_27, 0);	--�����������index
	SetMissionV(this.mv_28, 0);	--�����ͷŵ���ʱ
	SetMissionV(this.mv_29, 0);	--��������ʱ
	SetMissionV(this.mv_30, 0);	--���컨���ʱ
	self:MkEventTable();
	
	self:MkShedule();			--ѡ��
	
	self:CreateNpcs();
	local nLfIdx = JDYY_FindNpc(tNpcs.lf[2]);
	JDYY_SetNpcType2Fight(nLfIdx);
	CastState2Npc(nLfIdx, "state_dispear", 100, 60*60*18);
--	self:MkOnceProcedure();

	if 1 == GetMissionV(this.mv_03) then this.msCamp:turnPlayer(0, JDYY_AddGodState); end
	--����TRAP
	local nMapId = this.msPosition:getMapID();
	ClearMapTrap(nMapId);
	self:CreateTraps();
end

function tStage06_2_2:MkDataTable()
	if not self.tPoints_Followers then
		self.tPoints_Followers = {
			{1682, 3711},{1696, 3713},{1682, 3741},{1692, 3721},
			{1702, 3721},{1692, 3731},{1699, 3721},{1692, 3741},
		};
	end
	
	if not self.tBoss then
		self.tBoss = {
			tNpcs.sl[2], tNpcs.hy[2], tNpcs.syy[2], tNpcs.shx[2], tNpcs.fj[2], tNpcs.yy[2], tNpcs.zr[2],
		};
	end
end

--���Boss��4���׶�[��5�б�ѡ���������һ�׶��ͷ�]
function tStage06_2_2:MkShedule()
	local tStages = {1, 2, 3, 4};
	local tRes = {};
	for i = 1, 3 do
		local nRand = random(1, getn(tStages));
		
		tinsert(tRes, tStages[nRand]);
		tremove(tStages, nRand);
	end
	
	local nMv = this.mv_23;
	for k, v in tRes do
		SetMissionV(nMv, k);
		nMv = nMv + 1;
	end
	SetMissionV(nMv, 5);
end

function tStage06_2_2:NpcMain()
	local self = tStage06_2_2;
	local nNpcIdx = GetTargetNpc();
	
	local tStateList = {
		["Hoa ��"] = {},
		["Hoa lam"] = {},
		["Hoa l�c"] = {},
	};
	local szName = GetNpcName(nNpcIdx);
	if tStateList[szName] then
		RemoveNpc(nNpcIdx);
		
		--CastState("", "");
	end
end

function tStage06_2_2:GetEventTable()
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return nil; end
	return self.tEventTable[nMapId];
end

function tStage06_2_2.MkOnceProcedure()
	local self = tStage06_2_2;
	local nSmmfIdx = JDYY_FindNpc(tNpcs.smmf[2]);
	if 0 == nSmmfIdx then return 0; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	local tEventTable = self.tEventTable[nMapId];
	
	tEventTable:insertevent(5, self.LiuDaoLunHui, nSmmfIdx);	--�����ֻ�
	tEventTable:insertevent(20, self.MkOnceProcedure);			--����
end

function tStage06_2_2:IsBossAllDead()
	if not self.tBoss then
		self:MkDataTable();
	end
	
	for i = 1, getn(self.tBoss) do
		local nNpcIdx = JDYY_FindNpc(self.tBoss[i]);
		if nNpcIdx ~= 0 and 0 == IsNpcDeath(nNpcIdx) then return nil; end
	end
	return 1;
end

function tStage06_2_2:OnNpcDeath(event, data)
	RemoveNpc(data[1]);
	-- logserver begin
	-- this.msCamp:turnPlayer(0, function() sendKillBossLog(this:mission_name(), %data[1], this:mission_stage()) end)
	-- logserver end
	if self:IsBossAllDead() then
		this.msCamp:turnPlayer(0, function() SetTask(%TASKID_JDYY_DAILY_TIME_ZUOBI, GetTask(%TASKID_JDYY_DAILY_TIME_ZUOBI) + 1); end);
		if 1 == GetMissionV(this.mv_03) then this.msCamp:turnPlayer(0, JDYY_ClearAllGodState); end
		
		self:StagePassed();
		JDYY_GivePrize(GetMissionS(this.MS_STAGE));
	else
		if not self.tBoss then
			self:MkDataTable();
		end
		local nBossCount = 0;
		for i = 1, getn(self.tBoss) do
			local nNpcIdx = JDYY_FindNpc(self.tBoss[i]);
			if nNpcIdx ~= 0 and 0 == IsNpcDeath(nNpcIdx) then 
				nBossCount = nBossCount + 1;
			end
		end
		local nDifType = GetMissionV(this.mv_02);
		-- Observer:onEvent(OE_JDYY_PASS_STAGE, {1,nDifType, 5 - nBossCount});
	end
end

function tStage06_2_2.OnPlayerDeath()
	local self = tStage06_2_2;
	
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
	
	if JDYY_PlayerDeadFailed() then
		this:Msg2MSAll("V��t �i th�t b�i!");
		self:StageEnd();
		
		JDYY_GoToStage(self.father, self.father.father, 1);
		
		local szCurStageId = GetMissionS(this.MS_STAGE);
		this.msCamp:turnPlayer(0, JDYY_SetPlayerPos, tPlayerPos[szCurStageId][1]);
	end
	
end

function tStage06_2_2:StagePassed()
	if eDifType.NORMAL == GetMissionV(this.mv_02) then
		AddRuntimeStat(44,3,6,1)  --ͳ����ͨͨ��
		AddRuntimeStat(44,10,6,GetMSPlayerCount(this.missionID, 0))
	elseif eDifType.HARD == GetMissionV(this.mv_02) then
		AddRuntimeStat(44,5,6,1)  --ͳ��Ӣ��ͨ��
		AddRuntimeStat(44,11,6,GetMSPlayerCount(this.missionID, 0))
	end
	
	self:onFinish();
end

function tStage06_2_2:StageEnd()
	if self.guage and self.guage.id then
		this.msCamp:turnPlayer(0, StopTimeGuage, self.guage.id);
	end
	JDYY_ClearMapNpc();
	JDYY_ReviveAll();
	JDYY_RestoreAll();
	JDYY_ClearAllState();
end

function tStage06_2_2:onTimeout()
	this:Msg2MSAll("V��t �i th�t b�i!");
	self:StageEnd();
	
	JDYY_GoToStage(self.father, self.father.father, 1);
	
	local szCurStageId = GetMissionS(this.MS_STAGE);
	this.msCamp:turnPlayer(0, JDYY_SetPlayerPos, tPlayerPos[szCurStageId][1]);	
end

tStage06_2_2.actions = {
	[1] = tStage06_2_2.Init,
};

tStage06_2_2.cycActions = {
	[1] = {
		[0] = {tStage06_2_2.Breathe, },
	},
--	[43] = {
--		[0] = {tStage06_2_2.MkOnceProcedure},
--	},
};

tStage06_2_2.triggers = {
	NpcDeath = {
		{action = tStage06_2_2.OnNpcDeath},
	},
	PlayerDeath = {
		{action = tStage06_2_2.OnPlayerDeath},
	},
	Trap = {
		{action = tStage06_2_2.OnTrap},
	},
};

-----------------------------------------------------------------
--	tStage06_2_3
-----------------------------------------------------------------
function tStage06_2_3:MkEventTable()
	if not self.tEventTable then self.tEventTable = {}; end
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable[nMapId] then
		self.tEventTable[nMapId] = {};
		self.tEventTable[nMapId] = inherit(TCallFuture, self.tEventTable[nMapId]);
	end
end

function tStage06_2_3:Breathe()
	local self = tStage06_2_3;
	local nMapId = this.msPosition:getMapID();
	if not self.tEventTable or not self.tEventTable[nMapId] then return 0; end
	self.tEventTable[nMapId]:breathe();
end

function tStage06_2_3:CreateNpcs()
	local nJjgIdx = JDYY_CreateNpc(tNpcs.jjg, tNpcPos.jjg[0][1], 1);
	-- local nLfIdx = JDYY_CreateNpc(tNpcs.lf, tNpcPos.lf[self.szStageId][1]);
	local nHyIdx  = JDYY_CreateNpc(tNpcs.hy, tNpcPos.hy["05_2_3"][1]);
	JDYY_SetNpcType2Talk(nLfIdx);
	JDYY_SetNpcType2Talk(nHyIdx);
	SetNpcDir(nHyIdx, 35);
end

function tStage06_2_3:Init()
	local self = tStage06_2_3;
	SetMissionV(this.mv_20, 1);
	SetMissionV(this.mv_21, 1);
	SetMissionV(this.mv_22, 0);
	
	self:CreateNpcs();
	self:FreeDataTable();
	self:MkEventTable();
	local nLfIdx = JDYY_FindNpc(tNpcs.lf[2]);
	JDYY_SetNpcType2Talk(nLfIdx);
end

function tStage06_2_3:StagePassed()
	local nSmmfIdx = JDYY_FindNpc(tNpcs.smmf[2]);
	JDYY_SetNpcType2Talk(nSmmfIdx);
end

function tStage06_2_3:MkDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if not self.tTalks then self.tTalks = {}; end
	
	if not self.tTalks[nMapId] then
		local nLfIdx = JDYY_FindNpc(tNpcs.lf[2]);
		local nHyIdx = JDYY_FindNpc(tNpcs.hy[2]);
		local nSlIdx = JDYY_FindNpc(tNpcs.sl[2]);
		
		self.tTalks[nMapId] = {
			[1] = {
				{nHyIdx, "Thua r�i? Ta �� thua r�i?"},
				{nLfIdx, "S� ph� �n tr�ng nh� n�i, L�c Phi sao c� th� qu�n? T�y H� s� �� t�n, Thi�n �m Gi�o kh�ng �o�n k�t, s� ph� sao l�i ph�i b�n m�ng v� l�o ho�ng �� ��?"},
				{nSlIdx, "Gi�o ch�, l�i c�a L�c Phi tuy kh� nghe, nh�ng ��u l� s� th�t. Ch�ng ta kh�ng ai gi�p ��, kh� m� n�n chuy�n."},
				{nHyIdx, "Ta c�ng bi�t, d� ta c� �� S�n H� X� T�c ��, c�ng kh� l�ng ���c nh� tr��c! Th�i, ta s� l�n n�i � �n, kh�ng h�i chuy�n th� gian."},
				{nSlIdx, "B�n t�ng nguy�n theo gi�o ch� c�ng nghi�n c�u Ph�t ph�p."},
				{nHyIdx, "Ha ha ha, b� l�i h� danh th� t�c, ��c th�nh ��i ��o!"},
				{-1, ""},
			},
		};
	end
end

function tStage06_2_3:FreeDataTable()
	local nMapId = this.msPosition:getMapID();
	
	if self.tTalks and self.tTalks[nMapId] then
		self.tTalks[nMapId] = nil;
	end
end

function tStage06_2_3.NpcTalk()
	if GetMissionV(this.mv_22) ~= 0 then return end
	
	local self = tStage06_2_3;
	local nMapId = this.msPosition:getMapID();
	
	if not self.tTalks then self.tTalks = {}; end
	
	if not self.tTalks[nMapId] then
		self:MkDataTable();
	end
	
	local nPrg = GetMissionV(this.mv_20);
	local nStc = GetMissionV(this.mv_21);
	if not self.tTalks[nMapId][nPrg] then return 0; end
	
	if self.tTalks[nMapId][nPrg][nStc][1] < 0 then
		SetMissionV(this.mv_22, 1);
		
		self:StagePassed();
		return 0;
	end
	NpcChat(self.tTalks[nMapId][nPrg][nStc][1], self.tTalks[nMapId][nPrg][nStc][2]);
	SetMissionV(this.mv_21, nStc + 1);
end

function tStage06_2_3:NpcMain()
	local self = tStage06_2_3;
	
	local nNpcIdx = GetTargetNpc();
	local szNpcName = GetNpcName(nNpcIdx);
	
	if szNpcName == tNpcs.lf[2] then
		if not JDYY_IsCaptain() then
			Talk(1, "", "<color=green>Hoa Th�nh L�c Phi:<color> Ch� ��i tr��ng ���c thao t�c!");
			return 0;
		else
			local strTab = {
				"R�i c�a �i		/JDYY_CloseMission",
				"H�y b�			/nothing",
			};
			Say("<color=green>Hoa Th�nh L�c Phi:<color> Chuy�n c�a thi�n �m Gi�o �� xong, �a t� c�c v� ��i hi�p t��ng tr�.", getn(strTab), strTab);
		end
	end
end

function tStage06_2_3.OnPlayerDeath()
	local self = tStage06_2_3;
	
	local nMapId = this.msPosition:getMapID();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

function tStage06_2_3:onTimeout()
	this:Msg2MSAll("��i tr��ng thao t�c qu� gi�, �i �� ��ng l�i.");
	JDYY_CloseMission();
end

tStage06_2_3.actions = {
	[1] = tStage06_2_3.Init,
};

tStage06_2_3.cycActions = {
	[1] = {
		[0] = {tStage06_2_3.Breathe, },
	},
	[2] = {
		[0] = {tStage06_2_3.NpcTalk, },
	},
};

tStage06_2_3.triggers = {
	Talk = {
		{action = tStage06_2_3.NpcMain},
	},
	PlayerDeath = {
		{action = tStage06_2_3.OnPlayerDeath},
	},
};

tStage06_2.phases = {tStage06_2_1, tStage06_2_2, tStage06_2_3};
tStage06.phases = {tStage06_1, tStage06_2};
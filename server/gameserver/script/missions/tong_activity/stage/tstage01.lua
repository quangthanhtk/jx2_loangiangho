Include("\\script\\missions\\tong_activity\\head.lua")
Include("\\script\\missions\\tong_activity\\cfg\\pos_cfg.lua")
Include("\\script\\missions\\tong_activity\\cfg\\npc_cfg.lua")
-- Include("\\script\\misc\\observer\\observer_head.lua")

tStage01 = {
	name = "��nh BOSS",
	nStageId = 1,
	maxsecond = 15 * 60,
	actionsType = "second",
	guage = {
		msg = "Giai �o�n ti�u di�t",
		time = 15 * 60,
		cyc = 0,
		id = 2,
	},	
};

tSeriesRelations = {
	-- 1��2ľ3��4ˮ5��
	[1] = {2, 5}, --���Ƶ����С������Ƶ�����
	[2] = {3, 1},
	[3] = {4, 2},
	[4] = {5, 3},
	[5] = {1, 4},
}

tEffectsOfSeries = {1009, 1010, 1011, 1012, 1013};
g_BossSleepEffect = 985
g_nBoxExistTime = 30; --���Ӵ���ʱ��
g_nDispearTime = 30; --boss�޵�ʱ��

----�����Ѫ ����
function reviveAll(nCamp)
	nCamp = nCamp or 1;
	this.msCamp:turnPlayer(nCamp,function ()
		if IsPlayerDeath() ~= 0 or GetLife() <= 1 then
			RevivePlayer(0);
		end
	end)
end

function change_boss_series()	
	local nSeries = random(1, 5);
	SetMissionV(this.mv3, nSeries);
	if GetTime() - GetMissionV(this.mv2) > g_nDispearTime then
		SetCurrentNpcSFX(GetMissionV(this.mv1), tEffectsOfSeries[nSeries], 1, 1);
	end
end

function set_boss_effect(bEnable, nNpcIdx)
	if not nNpcIdx then
		nNpcIdx = GetMissionV(this.mv1);
	end
	
	if bEnable == 1 then
		SetCurrentNpcSFX(nNpcIdx, tEffectsOfSeries[GetMissionV(this.mv3)], 1, 1);
	else
		SetCurrentNpcSFX(nNpcIdx, 0, 1, 1);
	end
end

--�ı�BOSSѪ��
function change_boss_blood()
	local nFixedDamage = 20000;
	local szTip1 = "%s xu�t chi�u, t�ng th�m %d �i�m sinh l�c cho B�ch Th�.";
	
	local nIdx = GetMissionV(this.mv1);
	if nIdx <= 0 then
		return
	end	
	local nMaxLife,nCurLife = GetUnitCurStates(nIdx,1);
	if nMaxLife == 0 then
		return
	end
	local nBossSeries = GetMissionV(this.mv3);
	local nPlayerSeries = GetTask(TASKID_TONG_ACTIVITY_SERIES_KIND);
	local nNewLife = nCurLife;
	if nBossSeries < 1 or nBossSeries >5 then
		return
	end
	local nActualDamage = 0;
	if tSeriesRelations[nBossSeries][1] == nPlayerSeries then
		--��ұ�BOSS���ƣ���BOSS��Ѫ
		nNewLife = nCurLife + nFixedDamage;
		nActualDamage = nFixedDamage;
		local nLastTime = GetTaskTemp(TEMP_TASKID_SEND_TONG_MSG_TIME);
		local nNow = GetTime();
		if (nLastTime == 0) or ((nNow - nLastTime) > g_nDispearTime) then
			SetTaskTemp(TEMP_TASKID_SEND_TONG_MSG_TIME, nNow);
			SendTongMessage(format(szTip1, GetName(), nFixedDamage));
		end			
	elseif tSeriesRelations[nBossSeries][2] == nPlayerSeries then
		--BOSS����ҿ��ƣ���BOSS��Ѫ
		nActualDamage = -nFixedDamage;
		nNewLife = nCurLife - nFixedDamage;
	end
	
	if nNewLife < 0 then
		nNewLife = 0;
	elseif nNewLife > nMaxLife then
		nNewLife = nMaxLife;
	end

--����NPC����	
--	if nCurLife < nMaxLife then
--		nNewLife = 0;
--	end
	
	if nNewLife == 0 then
		--BOSS����
		onNpcDeath(nIdx, 0, 0);
		--Death(GetNpcName(nIdx), nIdx);
		return
	end
	
	if nNewLife ~= nCurLife then
		ModifyNpcData(nIdx,0,nNewLife,0);
	end
		
	-- NotifyClientBubbleBlood(nIdx, nActualDamage, 1);
end

function check_boss_blood()
	local nIdx = GetMissionV(this.mv1);
	local nMaxLife,nCurLife = GetUnitCurStates(nIdx,1);	
	if (nCurLife == 0) or (nMaxLife == 0) then
		return
	end
	
	local n10PercentMod = mod(floor(nCurLife / nMaxLife * 100), 10); --�ٷֱ�Ϊ10%��������
	local n10Flag = 0; --���㵱ǰѪ��ΪMax*10%�Ķ��ٱ���ֻ��1��9������Ч
	if n10PercentMod == 0 then
		n10Flag = floor(floor(nCurLife / nMaxLife * 100) / 10);
	end
	local bHasFlag = 0; --�Ƿ��Ѿ��������λ
	if 1 <= n10Flag and 9 >= n10Flag then
		if 1 == GetBit(GetMissionV(this.mv5), n10Flag) then
			bHasFlag = 1;
		end
	end
	local nDispearTime = GetMissionV(this.mv2); --��һ��BOSS�޵е�ʱ��
	if (nCurLife > 0) and (nCurLife < nMaxLife) and (n10PercentMod == 0) and ((n10Flag >=1) and (n10Flag <=9)) and (bHasFlag ~= 1) and (nDispearTime == 0) then
		--BOSS�����޵�״̬
		CastState2Npc(nIdx, "state_dispear", 100, g_nDispearTime*18);
		SetMissionV(this.mv2, GetTime());		
		NpcAnimation(nIdx, 9, 1, 1);	--������������������ֹͣAI		
		set_boss_effect(0, nIdx);
		SetCurrentNpcSFX(nIdx, 985, 1, 1);
		local nNewVal = SetBit(GetMissionV(this.mv5), n10Flag, 1);
		SetMissionV(this.mv5, nNewVal);
		drop_prizebox();		
		this.msCamp:turnPlayer(1,function ()
			gf_SetTaskByte(TASKID_TONG_GET_ACTIVITY_AWARD, 2, 0); --���ñ��ν�����ȡ���
		end)
	elseif nDispearTime ~= 0 then
		local nInterval = GetTime() - nDispearTime;
		if nInterval > g_nDispearTime then			
			--�˳��޵�״̬
			SetMissionV(this.mv2, 0);
			SendTongMessage("B�ch Th� �� �o�t l�i B�o R��ng, mau di�t n�!");
			--NpcStopAnimation(nIdx);	--ֹͣ���������������ָ�AI
			NpcAnimation(nIdx, 2, -1, 0);	--ֹͣ���Ŷ������ָ�AI
			set_boss_effect(1, nIdx);
		end
	end
end

function drop_prizebox()
	local nMapId = this.msPosition:getMapID();
	local nRandIdx = random(1, getn(g_tNpc_RandomBox.tMapXY));
	local tMapXY = g_tNpc_RandomBox.tMapXY[nRandIdx];
	local nNpcIdx = CreateNpc(g_tNpc_RandomBox.templateNpc, g_tNpc_RandomBox.name,nMapId, tMapXY[1], tMapXY[2]);
	SetNpcScript(nNpcIdx,g_tNpc_RandomBox.scriptFile);
	SetNpcLifeTime(nNpcIdx, g_nBoxExistTime);
	-- AddMapTraceNpc(nNpcIdx,1);
	-- SetNpcSpotImage(nNpcIdx,102);
	SendTongMessage("B�ch Th� gi� v� tr�ng th��ng, n�m ra 1 B�o R��ng, M�nh C�u T��ng nh�t ��nh � trong ��!");
end

function update_player_info01()
	check_give_player_exp_buff();
end

function tStage01:CreateNpcs()
	local nMapId = this.msPosition:getMapID();
	local nNpcIdx = CreateNpc(g_tBossInfo.templateNpc,g_tBossInfo.name,nMapId,g_tBossInfo.tMapXY[1],g_tBossInfo.tMapXY[2]);
	SetNpcScript(nNpcIdx,g_tBossInfo.scriptFile);
	SetMissionV(this.mv1,nNpcIdx);
	change_boss_series();
	SendTongMessage("Tr�i b�ng t�i l�i, 1 B�ch Th� xu�t hi�n � trung t�m b�n ��!");
end

function tStage01:onTimeout()
	SendTongMessage("B�ch Th� �n no n� vui v� r�i �i, �� l�i m�t c�i r��ng tr�n m�t ��t!");	
	SetNpcLifeTime(GetMissionV(this.mv1), 0);
	SetMissionV(this.mv4, 0);
	--local m = this.msPosition:getMapID();
	--ClearMapNpc(m);
	tStage01:onFinish();
end

function tStage01:OnPlayerDeath()	
	RevivePlayer(0);
	RemoveState(1);
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tPos_PlayerRevive[1][1], tPos_PlayerRevive[1][2]);
	NewWorld(nMapId, tPos_PlayerRevive[1][1], tPos_PlayerRevive[1][2]);
	Msg2Player("Ng��i �� b� th��ng n�ng, h�y t�m S� Gi� Bang �� h�i ph�c nguy�n kh�!");
end

function tStage01.Init()
	tStage01:CreateNpcs();
end

function tStage01.suc_pass_msg()
	Msg2MSAll(this.missionID,"��ng V�t G�y R�i �� b� di�t.");
end

function update_boss_pos()
	local nBossIdx = GetMissionV(this.mv1);
	if nBossIdx == 0 then
		return 0;
	end
	if GetNpcName(nBossIdx) ~= g_tBossInfo.name then return 0; end
	local nBossMapId,nX,nY = GetNpcWorldPos(nBossIdx);
	local nMapId = this.msPosition:getMapID();
	local nLenth = sqrt((nX - g_tBossInfo.tMapXY[1])^2  + (nY - g_tBossInfo.tMapXY[2])^2);
	if nBossMapId ~= nMapId or nLenth > g_tBossInfo.nDistance then
		SetNpcPos(nBossIdx,g_tBossInfo.tMapXY[1],g_tBossInfo.tMapXY[2]);
	end
end



function onNpcDeath(npcIdx, f,x)
	--��¼BOSS��ʧ֮ǰ��λ��
	local m, x, y = GetNpcWorldPos(npcIdx);
	if x and y then
		g_tBossInfo.tMapXY[1], g_tBossInfo.tMapXY[2] = x, y;
	end

	SetMissionV(this.mv4, 1);
	SetNpcLifeTime(npcIdx, 0);
	SetMissionV(this.mv1,0);	
	SendTongMessage("T�t c� bang ch�ng c�ng nhau ��nh lui B�ch Th�. B�ch Th� b� ch�y v� �� l�i 1 b�o r��ng to.");		

	
	-- ObserverToneEvent();
	-- local tCurPhase = this.msPhases[1]:getCurPhase();
	-- tCurPhase:onFinish();
	tStage01:onFinish();
end

tStage01 = inherit(cycPhase, tStage01);
tStage01.actions = {
	[1] = tStage01.Init,
};
tStage01.cycActions = {
		[1] = {
			[0] = check_boss_blood,
		},
--		[2] = {
--			[1] = update_boss_pos,
--			start = 2,		-- ��ʲôʱ��ʼ
--		},	
		[30] = {
			[0] = change_boss_series,
		},
		[59] = {
			[0] = update_player_info01,
			start = 1,		-- ��ʲôʱ��ʼ
		},		
};

tStage01.triggers = {
--	Talk = {
--		{action = tStage01.NpcMain},
--	},
	PlayerDeath = {
		{action = tStage01.OnPlayerDeath},
	},
	NpcDeath = {
		{action = onNpcDeath},
	},	
};

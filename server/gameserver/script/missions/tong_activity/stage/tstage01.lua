Include("\\script\\missions\\tong_activity\\head.lua")
Include("\\script\\missions\\tong_activity\\cfg\\pos_cfg.lua")
Include("\\script\\missions\\tong_activity\\cfg\\npc_cfg.lua")
-- Include("\\script\\misc\\observer\\observer_head.lua")

tStage01 = {
	name = "Цnh BOSS",
	nStageId = 1,
	maxsecond = 15 * 60,
	actionsType = "second",
	guage = {
		msg = "Giai 畂筺 ti猽 di謙",
		time = 15 * 60,
		cyc = 0,
		id = 2,
	},	
};

tSeriesRelations = {
	-- 1金2木3土4水5火
	[1] = {2, 5}, --克制的五行、被克制的五行
	[2] = {3, 1},
	[3] = {4, 2},
	[4] = {5, 3},
	[5] = {1, 4},
}

tEffectsOfSeries = {1009, 1010, 1011, 1012, 1013};
g_BossSleepEffect = 985
g_nBoxExistTime = 30; --箱子存在时间
g_nDispearTime = 30; --boss无敌时间

----玩家满血 满篮
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

--改变BOSS血量
function change_boss_blood()
	local nFixedDamage = 20000;
	local szTip1 = "%s xu蕋 chi猽, t╪g th猰 %d 甶觤 sinh l鵦 cho B筩h Th�.";
	
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
		--玩家被BOSS克制，则BOSS加血
		nNewLife = nCurLife + nFixedDamage;
		nActualDamage = nFixedDamage;
		local nLastTime = GetTaskTemp(TEMP_TASKID_SEND_TONG_MSG_TIME);
		local nNow = GetTime();
		if (nLastTime == 0) or ((nNow - nLastTime) > g_nDispearTime) then
			SetTaskTemp(TEMP_TASKID_SEND_TONG_MSG_TIME, nNow);
			SendTongMessage(format(szTip1, GetName(), nFixedDamage));
		end			
	elseif tSeriesRelations[nBossSeries][2] == nPlayerSeries then
		--BOSS被玩家克制，则BOSS掉血
		nActualDamage = -nFixedDamage;
		nNewLife = nCurLife - nFixedDamage;
	end
	
	if nNewLife < 0 then
		nNewLife = 0;
	elseif nNewLife > nMaxLife then
		nNewLife = nMaxLife;
	end

--测试NPC死亡	
--	if nCurLife < nMaxLife then
--		nNewLife = 0;
--	end
	
	if nNewLife == 0 then
		--BOSS死亡
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
	
	local n10PercentMod = mod(floor(nCurLife / nMaxLife * 100), 10); --百分比为10%的整数倍
	local n10Flag = 0; --计算当前血量为Max*10%的多少倍，只有1到9倍才有效
	if n10PercentMod == 0 then
		n10Flag = floor(floor(nCurLife / nMaxLife * 100) / 10);
	end
	local bHasFlag = 0; --是否已经处理过此位
	if 1 <= n10Flag and 9 >= n10Flag then
		if 1 == GetBit(GetMissionV(this.mv5), n10Flag) then
			bHasFlag = 1;
		end
	end
	local nDispearTime = GetMissionV(this.mv2); --上一次BOSS无敌的时间
	if (nCurLife > 0) and (nCurLife < nMaxLife) and (n10PercentMod == 0) and ((n10Flag >=1) and (n10Flag <=9)) and (bHasFlag ~= 1) and (nDispearTime == 0) then
		--BOSS进入无敌状态
		CastState2Npc(nIdx, "state_dispear", 100, g_nDispearTime*18);
		SetMissionV(this.mv2, GetTime());		
		NpcAnimation(nIdx, 9, 1, 1);	--播放死亡动画，并且停止AI		
		set_boss_effect(0, nIdx);
		SetCurrentNpcSFX(nIdx, 985, 1, 1);
		local nNewVal = SetBit(GetMissionV(this.mv5), n10Flag, 1);
		SetMissionV(this.mv5, nNewVal);
		drop_prizebox();		
		this.msCamp:turnPlayer(1,function ()
			gf_SetTaskByte(TASKID_TONG_GET_ACTIVITY_AWARD, 2, 0); --重置本次奖励领取标记
		end)
	elseif nDispearTime ~= 0 then
		local nInterval = GetTime() - nDispearTime;
		if nInterval > g_nDispearTime then			
			--退出无敌状态
			SetMissionV(this.mv2, 0);
			SendTongMessage("B筩h Th�  畂箃 l筰 B秓 Rng, mau di謙 n�!");
			--NpcStopAnimation(nIdx);	--停止播放死亡动画，恢复AI
			NpcAnimation(nIdx, 2, -1, 0);	--停止播放动画，恢复AI
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
	SendTongMessage("B筩h Th� gi� v� tr鋘g thng, n衜 ra 1 B秓 Rng, M秐h C莡 Tng nh蕋 nh � trong !");
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
	SendTongMessage("Tr阨 b鏽g t鑙 l筰, 1 B筩h Th� xu蕋 hi謓 � trung t﹎ b秐 !");
end

function tStage01:onTimeout()
	SendTongMessage("B筩h Th� ╪ no n� vui v� r阨 甶,  l筰 m閠 c竔 rng tr猲 m苩 t!");	
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
	Msg2Player("Ngi  b� thng n苙g, h穣 t譵 S� Gi� Bang  h錳 ph鬰 nguy猲 kh�!");
end

function tStage01.Init()
	tStage01:CreateNpcs();
end

function tStage01.suc_pass_msg()
	Msg2MSAll(this.missionID,"чng V藅 G﹜ R鑙  b� di謙.");
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
	--记录BOSS消失之前的位置
	local m, x, y = GetNpcWorldPos(npcIdx);
	if x and y then
		g_tBossInfo.tMapXY[1], g_tBossInfo.tMapXY[2] = x, y;
	end

	SetMissionV(this.mv4, 1);
	SetNpcLifeTime(npcIdx, 0);
	SetMissionV(this.mv1,0);	
	SendTongMessage("T蕋 c� bang ch髇g c飊g nhau nh lui B筩h Th�. B筩h Th� b� ch箉 v�  l筰 1 b秓 rng to.");		

	
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
--			start = 2,		-- 从什么时候开始
--		},	
		[30] = {
			[0] = change_boss_series,
		},
		[59] = {
			[0] = update_player_info01,
			start = 1,		-- 从什么时候开始
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

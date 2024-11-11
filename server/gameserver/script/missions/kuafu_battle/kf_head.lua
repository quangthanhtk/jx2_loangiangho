Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\kuafu_battle\\kf_define.lua")
Include("\\script\\system_switch_config.lua")
Import("\\script\\task_access_code_def.lua")
Import("\\script\\lib\\missionfunctions.lua")
Import("\\script\\tmp_task_id_def.lua")
Include("\\script\\online\\award_head.lua")
Include("\\script\\missions\\kuafu_battle\\runtime_data_stat.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

----ս�������˴���
--function KF_Battle_BMR()
--	local nVersion,nCurGs = GetRealmType();
--	if IsSubSystemOpen(SYS_SWITCH_KF_BATTLE) == 1 and SubWorldID2Idx(KF_NPC_POS[1]) ~= -1 and nCurGs ~= 0 then
--			local nNpcIndex = CreateNpc("ZM_jieyingren", "���ս��������", KF_NPC_POS[1], KF_NPC_POS[2], KF_NPC_POS[3]);
--			SetNpcScript(nNpcIndex, "\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua");
--	end
--end

--function KF_Battle_LJR()
--	local nVersion,nCurGs = GetRealmType();
--	if IsSubSystemOpen(SYS_SWITCH_KF_BATTLE) == 1 and SubWorldID2Idx(KF_NPC_POS_SRC[1]) ~= -1 and nCurGs == 0 then
--			local nNpcIndex = CreateNpc("ZM_jieyingren", "���ս���콱��", KF_NPC_POS_SRC[1], KF_NPC_POS_SRC[2], KF_NPC_POS_SRC[3]);
--			SetNpcScript(nNpcIndex, "\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua");
--	end
--end

--���ݻ�Ծ�ȼ���Index
function KF_Locate_Index(nActivity)
	return 1 -- ���ڻ�Ծ�Ȳ��ٲ��뽱�����λ��֣�ֻҪ��꣬������ͬ
	-- if nActivity < 0 then return 1; end
	-- for i = 1, getn(KF_ACTIVITY_LEVEL) do
	-- 	if i ~= getn(KF_ACTIVITY_LEVEL) then
	-- 		if nActivity >= KF_ACTIVITY_LEVEL[i] and nActivity < KF_ACTIVITY_LEVEL[i+1] then
	-- 			return i;
	-- 		end
	-- 	else
	-- 		return i;
	-- 	end
	-- end	
end


--���㽱��
function KF_Calculate_Award()
	--���飬����������
	local tResult = {0, 0, {0, 0, 0, 0, ""}};
	--��ȡ���
	local nRet = KF_GetBattleRezult();
	local tAward = KF_BATTLE_AWARD[nRet];
	if not tAward then  return tResult; end
	--��ȡ��Ծ��
	local nActivity = KF_GetActivity();
	local nIndex = KF_Locate_Index(nActivity);
	local tSubAward = tAward[nIndex];
	if not tSubAward then return tResult; end
	local nExp = tSubAward[2][1] -- + tSubAward[2][2] * (nActivity - 10);
	local nExpAdd = (KF_EXP_EXT_RATE + 1)*(1 + GetVipCardParam())
	local nJunGongAdd = (1+KF_JUNGONG_EXT_RATE)
	local nXiuwei = tSubAward[5]
	return {nExp * nExpAdd, tSubAward[3] * nJunGongAdd, tSubAward[4], nXiuwei};
end

--������ȡ
function KF_GetAward(nKind)
	nKind = nKind or 0;
	local tRet;
	if nKind > 0 and nKind <= getn(KF_TMULTIPLE) then
		tRet = KF_TMULTIPLE[nKind];
	end
	if not tRet then return 0; end
	local tAward = KF_Calculate_Award();
	if tAward and tAward[1] == 0 and tAward[2] == 0 then
		return 0;
	end 
	if GetFreeItemRoom() < 4 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	local tJGZ = {
		[2] = {2, 1, 9999, "Qu�n C�ng Ch��ng"},
		[3] = {2, 1, 9998, "Qu�n C�ng ��i"},
		[4] = {2, 1, 9977, "Qu�n C�ng Huy Ho�ng"},
		[5] = {2, 1, 30642, "qu�n c�ng ch��ng vinh d� "},
	}
	if tJGZ[nKind] then
		if DelItem(tJGZ[nKind][1], tJGZ[nKind][2], tJGZ[nKind][3], 1) ~= 1 then
			Talk(1,"",format("H�nh trang kh�ng �� <color=green>%s<color>", tJGZ[nKind][4]));
			return 0;
		end
		FireEvent("event_ib_cost", tJGZ[nKind][1], tJGZ[nKind][2], tJGZ[nKind][3], 1);
	end
	--������
	gf_Modify("Exp", tAward[1])-- * tRet[1]);

	local nActivity = KF_GetActivity()

	local nJungongRate = tRet[2]
	if GetTask(TASKID_KF_POZHENKING) == 1 then	-- ��������־�����Ƿ���ϻ�Ծ�ȱ�׼����Ҫ���
		nJungongRate = nJungongRate * 1.2
		SetTask(TASKID_KF_POZHENKING, 0)
	end

	if nActivity >= 300 then	-- ��Ծ�ȷ��ϱ�׼
		gf_EventGiveCustomAward(31, tAward[2] * nJungongRate, 1, KF_LOGTITEL, tRet[4]);
		KF_ParkAward(KF_GetBattleRezult(), tAward[3][2])
		ModifyPopur(tAward[4]);
		Msg2Player(format("C�c h� nh�n ���c %d �i�m tu luy�n", tAward[4]));
		local nActivityLevel = KF_Locate_Index(nActivity);
		_stat_when_award(nKind-1, nActivityLevel)
		--�������ܻ����Ľ���
		aw_kfbattle_award(nKind-1);
		-- --���ֹ�ѫ
		-- local nRet = KF_GetBattleRezult();
		-- if nRet == 2 then
		-- 	merit_KfBattle(1, nKind - 1);
		-- elseif nRet == 3 then
		-- 	merit_KfBattle(0, nKind - 1);
		-- elseif nRet == 4 then
		-- 	merit_KfBattle(-1, nKind - 1);
		-- end
	end
	
	--���ñ�Ǳ���
	KF_SetBattleRezult(0);
	KF_SetActivity(0);
	local nResult = gf_GetMyTaskBit(KF_BATTLE_TASK, 29, 31)
	FireEvent("event_mission_award", "kfbattle", nKind, nResult, 0)
end

--ս�����
function KF_SetBattleRezult(nValue)
	--1δ������2ʤ����3ʧ�ܣ�4ƽ��
	if nValue < 0 or nValue > 4 then
		return 0;
	end
	gf_SetMyTaskBit(KF_BATTLE_TASK, 29, 31, nValue, TASK_ACCESS_CODE_KF_BATTLE);
--	if nValue >= 2 and nValue <= 4 then
--		Observer:onEvent(SYSEVENT_KF_KFBATTLE_ONCE_FINISH, nValue);
--	end
end

function KF_GetBattleRezult()
	return gf_GetMyTaskBit(KF_BATTLE_TASK, 29, 31);
end


--��Ծ��
function KF_SetActivity(nValue)
	if nValue < 0 or nValue > 2^11 - 1 then
		return 0;
	end
	--�ۼ��Լ�
	gf_SetMyTaskBit(KF_BATTLE_TASK, 6, 16, nValue, TASK_ACCESS_CODE_KF_BATTLE);
end

function KF_AddActivity_Ext(nType, nCamp)
	local ACTINFO = t_ActivityInfo[nType]
	if ACTINFO == nil then print("error KF_AddActivity_Ext nil ACTIVITY_TYPE!") return end

	local nCurTypeAct = gf_GetMyTaskBit(ACTINFO.taskid, ACTINFO.lbit, ACTINFO.rbit)
	if nCurTypeAct >= ACTINFO.max then return end

	
	local addVar = ACTINFO.value
	if nCurTypeAct + addVar > ACTINFO.max then
		addVar = ACTINFO.max - nCurTypeAct
	end
	local msg = format("%s, nh�n %d �i�m t�ch c�c. �� nh�n (%d/%d) t� c�ch n�y..",ACTINFO.msg, addVar, nCurTypeAct + addVar, ACTINFO.max)
	if nCurTypeAct + addVar >= ACTINFO.max then
		msg = format("%s �� nh�n �i�m t�ch c�c t�i �a t� c�ch n�y.", msg)
	end
	Msg2Player(msg)
	gf_SetMyTaskBit(ACTINFO.taskid, ACTINFO.lbit, ACTINFO.rbit, nCurTypeAct + addVar)
	KF_AddActivity(addVar, nCamp)
end

function KF_AddActivity(nValue, nCamp)
	local nActivity = KF_GetActivity();
	if nActivity + nValue < 0 or nActivity + nValue > 2^11 - 1 then
		print("UDERROR: KF_SetActivity nValue illegality");
		return 0;
	end
	if nActivity >= KF_MAX_ACTIVITY then return end

	local addVar = nValue
	if nActivity + addVar > KF_MAX_ACTIVITY then
		addVar = KF_MAX_ACTIVITY - nActivity
	end

	--�ۼƵ�MISSION��ȥ
	if nCamp == nil then
		nCamp = KF_GetCamp();
	end
	if nCamp == KF_CampOne_ID then
		SetMissionV(KF_MV_BATTLE_SONG_ACTIVITY, GetMissionV(KF_MV_BATTLE_SONG_ACTIVITY) + addVar);
	elseif nCamp == KF_CampTwo_ID then
		SetMissionV(KF_MV_BATTLE_LIAO_ACTIVITY, GetMissionV(KF_MV_BATTLE_LIAO_ACTIVITY) + addVar);
	end
	--�ۼ��Լ�
	gf_SetMyTaskBit(KF_BATTLE_TASK, 6, 16, nActivity + addVar, TASK_ACCESS_CODE_KF_BATTLE);
	Msg2Player(format("T�ng �� t�ch c�c: %d", nActivity + addVar));
	if nActivity + addVar >= KF_MAX_ACTIVITY then
		Msg2Player("�i�m t�ch c�c �� nh�n ��n t�i �a!");
	end
end


function KF_GetActivity()
	return gf_GetMyTaskBit(KF_BATTLE_TASK, 6, 16);
end

--�μӴ���
function KF_SetJoinTimes(nValue)
	if nValue < 0 or nValue > KF_JOIN_TIMES_MAX then
		print("UDERROR: KF_SetJoinTimes nValue < 0 or nValue > KF_JOIN_TIMES_MAX");
		return 0;
	end
	gf_SetTaskByte(KF_BATTLE_TASK, 3, nValue, TASK_ACCESS_CODE_KF_BATTLE);
end

function KF_GetJoinTimes()
	return gf_GetTaskByte(KF_BATTLE_TASK, 3);
end

--��Ӫ
function KF_SetCamp(nCamp)
	if nCamp ~= KF_CampOne_ID and nCamp ~= KF_CampTwo_ID then
		print("UDERROR: KF_SetCamp nCamp illegality");
		return 0;
	end
	gf_SetMyTaskBit(KF_BATTLE_TASK, 25, 26, nCamp, TASK_ACCESS_CODE_KF_BATTLE);
	return 1;
end

function KF_GetCamp()
	return gf_GetMyTaskBit(KF_BATTLE_TASK, 25, 26, TASK_ACCESS_CODE_KF_BATTLE);
end

--��������
function KF_AddScore(nValue, nCamp, f)
	if not nValue or nValue < 0 then return 0; end
	if SubWorld and SubWorld > 0 then
		if nCamp == nil then
			nCamp = KF_GetCamp();
			SetTaskTemp(TMP_TASK_KF_SCORE, GetTaskTemp(TMP_TASK_KF_SCORE) + nValue);
		end
	else --npcɱ��npc
		if nCamp == nil then	return 0;	end
		SubWorld = f
	end
	if nCamp == KF_CampOne_ID then
		local  nScore = GetMissionV(KF_MV_BATTLE_SONG_SCORE);
		-- SetMissionV(KF_MV_BATTLE_SONG_SCORE, min(nScore + nValue, GetMissionV(KF_SCORE_MAX))); -- ���ڻ���û��������
		SetMissionV(KF_MV_BATTLE_SONG_SCORE, nScore + nValue)
	elseif nCamp == KF_CampTwo_ID then
		local  nScore = GetMissionV(KF_MV_BATTLE_LIAO_SCORE);
		-- SetMissionV(KF_MV_BATTLE_LIAO_SCORE, min(nScore + nValue, GetMissionV(KF_SCORE_MAX))); -- ���ڻ���û��������
		SetMissionV(KF_MV_BATTLE_LIAO_SCORE, nScore + nValue);
	end
	return 1;
end

--��û���
function KF_GetScore()
	local nCamp = KF_GetCamp();
	if nCamp == KF_CampOne_ID then
		return GetMissionV(KF_MV_BATTLE_SONG_SCORE);
	elseif nCamp == KF_CampTwo_ID then
		return GetMissionV(KF_MV_BATTLE_LIAO_SCORE);
	else
		return 0;
	end
end
--���������
function KF_Daily_Reset()
	--����μӴ���
	KF_SetJoinTimes(0);
	--�����һ���콱���
	gf_SetTaskBit(KF_BATTLE_TASK, 28, 0, TASK_ACCESS_CODE_KF_BATTLE);
end

--�ҵ����ʵ�MISSION
function KF_GetSuitMap(nPlayerNum)
	local tbMapID = gf_GetDataTable(GetSameMaps(KF_MAP_ID));
	local tbRetzult = {};
	for i =1, getn(tbMapID) do
		--���Ƕ�̬��ͼ�Ĳ�Ҫ
		if tbMapID[i] ~= KF_MAP_ID and 
			mf_GetMissionV(KF_MISSION_ID, KF_MV_BATTLE_STATE, tbMapID[i]) == KF_MS_STATE_PEACE and
			(mf_GetPlayerCount(KF_MISSION_ID, KF_CampOne_ID, tbMapID[i]) + nPlayerNum <= KF_PLAYER_MAX_NUM
			or mf_GetPlayerCount(KF_MISSION_ID, KF_CampTwo_ID, tbMapID[i]) + nPlayerNum <= KF_PLAYER_MAX_NUM) then
			--print("tinsert(tbRetzult, tbMapID[i]);",tbMapID[i])
			tinsert(tbRetzult, tbMapID[i]);
		end
	end
	if getn(tbRetzult) == 0 then
		return 0;
	end
	if getn(tbRetzult) ~= 1 then
		print("UDERROR: getn(tbRetzult) ~= 1");
	end
	return tbRetzult[1];
end

--��Ҽ���ս��
function KF_JoinBattle(nCamp)
	CleanInteractive();
	local nMapID = gf_GetCurMapID();
	if NewWorld(nMapID, KF_JOIN_MISSION_POS[nCamp][1], KF_JOIN_MISSION_POS[nCamp][2]) == 1 then
		Msg2MSAll(KF_MISSION_ID, GetName().." �� gia nh�p "..KF_tCampName[nCamp]);
		Msg2Player("C�c h� �� gia nh�p r�i"..KF_tCampName[nCamp]);
		KF_SetPlayerState(nCamp);
		SetTask(TASKID_KF_CONTINUOUS_DEAD_CNT, 0)
		SetTask(TASKID_KF_DESTROY_FLAG, 0)
		SetTask(TASKID_KF_POZHENKING, 0)
		AddMSPlayer(KF_MISSION_ID, nCamp);
		KF_SetCamp(nCamp);
		if GetItemCount(KF_ITEM_LINGPAI[nCamp][1], KF_ITEM_LINGPAI[nCamp][2], KF_ITEM_LINGPAI[nCamp][3]) < 1 then
			AddItem(KF_ITEM_LINGPAI[nCamp][1], KF_ITEM_LINGPAI[nCamp][2], KF_ITEM_LINGPAI[nCamp][3], 1);
			Msg2Player(format("B�n nh�n ���c %s",KF_ITEM_LINGPAI[nCamp][4]));
		end
		EnterChannel(KF_BATTLE_CHANNEL[KF_ALL_ID][1]..nMapID);
		EnterChannel(KF_BATTLE_CHANNEL[nCamp][1]..nMapID);
		KF_SetJoinTimes(KF_GetJoinTimes() + 1);
		KF_SetBattleRezult(1);
		if gf_GetCaptainName() == GetName() then
			gf_SetMyTaskBit(KF_BATTLE_TASK, 1, 5, gf_GetMyTaskBit(KF_BATTLE_TASK, 1, 5) + gf_GetTeamSize(), TASK_ACCESS_CODE_KF_BATTLE);
			Pay(gf_GetTeamSize() * KF_ENTRY_FEE * 10000); --ʵ����������δ�۽�������ǿ��
		end
		return 1;
	else
		return 0;
	end;
end

--����״̬
function KF_SetPlayerState(nCamp)
	SetLogoutRV(1);	--���õ�½��Ϊ����������
	SetDeathPunish(0);	--�������ͷ�
	ForbitTrade(1);	--��ֹ����
	InteractiveEnable(0);	--�رս���
	StallEnable(0);	--��ֹ��̯(���ߺ�ᱻ���)
	UseScrollEnable(0);	--��ֹʹ�ûسǷ�
	ForbidChangePK(0);	--����ı�PK״̬
	SetPKFlag(1,nCamp);
	ForbidChangePK(1);	--��ֹ�ı�PK״̬
	SetFightState(0);
	KillFollower();	--ɾ������
	SetMomentumBoundSwitch(1);	--��������ɱ��ֵ
	SetDeathScript(KF_PLAYER_DEATH_SCRIPT); --�����ű�
	SetCampToPlayer(KF_tCampType[nCamp]); --������Ӫ
	local nMapID = GetWorldPos();
	SetTempRevPos(nMapID, KF_JOIN_MISSION_POS[nCamp][1], KF_JOIN_MISSION_POS[nCamp][2]);
	SetTaskTemp(TMP_TASK_KF_KILL_NUM, 0);
	SetTaskTemp(TMP_TASK_KF_SCORE, 0);
	DelNBWeapon();
	local nCurrMapId, nModelMapID = SubWorldIdx2ID(SubWorld);
	SetTempRevPos(nCurrMapId, KF_JOIN_MISSION_POS[nCamp][1]*32, KF_JOIN_MISSION_POS[nCamp][2]*32);
	SetCreateTeam(1);--��ӹر�
end

--����״̬
function KF_ResetPlayerState()
	SetLogoutRV(0);
	SetDeathPunish(1);
	InteractiveEnable(1);	
	UseScrollEnable(1);
	ForbidChangePK(0);	--����ı�PK״̬	
	SetPKFlag(0,0);	
	SetFightState(0);
	SetDeathScript("");
	SetTempRevPos(0,0,0);
	SetCampToPlayer("");
	KillFollower();	--ɾ������
	SetMomentumBoundSwitch(0);
	RemvoeTempEffect(); --���������ϵ�������ʱ״̬
	SetTaskTemp(TMP_TASK_KF_KILL_NUM, 0);
	SetTaskTemp(TMP_TASK_KF_SCORE, 0);
	--��ѩ��״̬
	RemoveState(9908);
	RemoveState(9909);
	RemoveState(9910);
	RemoveState(9911);
	RemvoeTempEffect();
	local nCamp = KF_GetCamp();
	local nMapID = gf_GetCurMapID();
	LeaveChannel(KF_BATTLE_CHANNEL[KF_ALL_ID][1]..nMapID);
	LeaveChannel(KF_BATTLE_CHANNEL[nCamp][1]..nMapID);
	FloatMsg2Player();
	DelNBWeapon();
	SetTempRevPos(0,0,0)
	SetCreateTeam(0);--��Ӵ�
end

--�뿪ս����ǳ�������
function KF_LeaveBattle()
	local nCurMapId = GetWorldPos();
	KF_ResetPlayerState();
	local tCell = KF_OUT_POS[random(getn(KF_OUT_POS))];
	if 1 == NewWorld(tCell[1], tCell[2], tCell[3]) then
		local nCamp = KF_GetCamp();
		if nCamp ~= KF_CampOne_ID and nCamp ~= KF_CampTwo_ID then
			return 0;
		end
		if GetItemCount(KF_ITEM_LINGPAI[nCamp][1], KF_ITEM_LINGPAI[nCamp][2], KF_ITEM_LINGPAI[nCamp][3]) > 0 then
			DelItem(KF_ITEM_LINGPAI[nCamp][1], KF_ITEM_LINGPAI[nCamp][2], KF_ITEM_LINGPAI[nCamp][3], 1);
		end
		local nBattleState = mf_GetMissionV(KF_MISSION_ID, KF_MV_BATTLE_STATE, nCurMapId);
		if nBattleState == KF_MS_STATE_FIGHT then
			KF_SetBattleRezult(1);--��;�˳�
		end
		if nBattleState ~= KF_MS_STATE_COMPLETE then
			Msg2MSAll(KF_MISSION_ID, KF_tCampName[nCamp].."-"..GetName().."�� r�i kh�i chi�n tr��ng li�n ��u");
		end;		
	end
end

--��ʼ��ս������
function KF_InItBattle()
	SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_PEACE_TIMER_LOOP); --�ȴ�ʱ���timer����
	StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_PEACE_TIME); --����timer
	SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_PEACE);		--���õ�ǰmission״̬
	SetMissionV(KF_MV_BATTLE_GAME_FRAMETIME, GetGameLoop()); --��¼��Ϸ֡
end

--����ս��
function KF_RunBattle()
	Msg2MSAll(KF_MISSION_ID, "Th�m t� h�i b�o, phe ��ch �� b�t ��u h�nh ��ng, c�c h�o ki�t h�y nhanh ch�ng ti�n v�o ti�n tuy�n quy�t m�t tr�n t� chi�n v�i ��ch.");
	StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, KF_FIGHT_TIME);
	SetMissionV(KF_MV_BATTLE_TIMER_LOOP, KF_FIGHT_TIMER_LOOP);
	SetMissionV(KF_MV_BATTLE_STATE, KF_MS_STATE_FIGHT);
	KF_OperateAllPlayer(KF_SetBattleRezult, 3, KF_ALL_ID); --������ս��Ĭ����ʧ�ܵ�
end

--����ս��
function KF_EndBattle()
	local nPlayerOne = GetMSPlayerCount(KF_MISSION_ID, KF_CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(KF_MISSION_ID, KF_CampTwo_ID);	
	WriteLog("[Chi�n tr��ng li�n ��u k�t th�c]: th�i gian l�"..tostring(date()).."Chi�n tr��ng li�n ��u �� k�t th�c, s� ng��i cu�i c�ng l�: ["..nPlayerOne.."]:["..nPlayerTwo.."], t�ng s� ng��i l�: "..(nPlayerOne+nPlayerTwo)); 
	KF_ProcessBattleOver();
	--δ�ɹ�������ս��������������
	if GetMissionV(KF_MV_BATTLE_IS_OPEN_SUCC) == KF_MISSION_OPEN_FAIL_FLAG then
		local nMissionCount = GetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_CURR_OPEN_COUNT);
		SetMapTaskTemp(KF_MAP_TASK_TEMP_ID ,KF_CURR_OPEN_COUNT, nMissionCount - 1);
	end
	local nMapID = GetMissionV(KF_MV_BATTLE_MAP_ID);	
	ClearMapNpc(nMapID);
	local nMapIdx = GetMissionV(KF_MV_BATTLE_MAP_INDEX);
	mf_ClearMissionData();
	local nRetCode = FreeDynamicMap(nMapID, nMapIdx);	--FreeDynamicMapҲ�����CloseMisssion
	if nRetCode ~= 1 then
		WriteLog("[Chi�n tr��ng li�n ��u]: FreeDynamicMap b�o l�i, nRetCode:"..nRetCode);
	end;		
	KF_DeleteChannel();
end

function KF_OpenBattleFail()
	--�ָ�һ������
	KF_SetBattleRezult(0);
	KF_SetActivity(0);
	KF_SetJoinTimes(KF_GetJoinTimes() - 1);
	if gf_GetCaptainName() == GetName() then
		local nCount = gf_GetMyTaskBit(KF_BATTLE_TASK, 1, 5) - gf_GetTeamSize();
		if nCount >= 0 then
			gf_SetMyTaskBit(KF_BATTLE_TASK, 1, 5, nCount, TASK_ACCESS_CODE_KF_BATTLE);
			Earn(gf_GetTeamSize() * KF_ENTRY_FEE * 10000); --ʵ����������δ����������ǿ��
		end
	end
end

--����ս������
function KF_ProcessBattleOver()
	local udFunc = function()
		--�ж�ʤ��
		local nWinner = GetMissionV(KF_MV_BATTLE_WINNER);
		local nCamp = KF_GetCamp();
		if nWinner == nCamp then
			KF_SetBattleRezult(2); --ʤ��
		elseif nWinner == KF_ALL_ID then
			if GetMissionV(KF_MV_BATTLE_IS_OPEN_SUCC) == KF_MISSION_OPEN_FAIL_FLAG then
				KF_OpenBattleFail();
			else
				KF_SetBattleRezult(4); --ƽ��
			end
		else
			KF_SetBattleRezult(3); --ʧ��
		end
		--
		DelMSPlayer(KF_MISSION_ID, nCamp);
	end
	KF_OperateAllPlayer(udFunc, {}, KF_ALL_ID);
end

--��ʼ��ս��NPC����
function KF_CreateNpc()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local npcIndex;
	--�Ի�NPC
	for i, npc in KF_TALK_NPC do
		npcIndex = CreateNpc(npc[1], npc[2], nMapID, npc[3], npc[4]);
		SetNpcScript(npcIndex, npc[5]);
	end
	--����NPC
	for i, npc in KF_MONSTER_NPC do
		npcIndex = CreateNpc(npc[1], npc[2], nMapID, npc[3], npc[4]);
		--���Ƕ���Ĭ�ϵ������ű�
		SetCampToNpc(npcIndex, KF_Neutral_Type);
	end
	--����
	for i, npc in KF_FLAG_NPC do
		npcIndex = CreateNpc(npc[1], npc[2], nMapID, npc[3], npc[4]);
		SetNpcDeathScript(npcIndex, npc[5]);
		SetCampToNpc(npcIndex, KF_Neutral_Type);
	end
	
	--�˸�С��
	for i, npc in KF_tPositionFo do
		npcIndex = CreateNpc(npc[1], npc[2], nMapID, npc[3], npc[4]);
		if npcIndex <= 0 then
			print(format("create npc fail: [%s][%s][%d][%d][%d]",npc[1], npc[2], nMapID, npc[3], npc[4]))
		end
		SetCampToNpc(npcIndex,npc[5]);
	end
end

--��ʼ��ս��Ƶ��
function KF_CreateChannel()
	local nMapID = gf_GetCurMapID();
	for i, nChannel in KF_BATTLE_CHANNEL do
		CreateChannel(nChannel[1]..nMapID, nChannel[2]);
	end
end

function KF_DeleteChannel()
	local nMapID = gf_GetCurMapID();
	for i, nChannel in KF_BATTLE_CHANNEL do
		DeleteChannel(nChannel[1]..nMapID, nChannel[2]);
	end
end

--��Mission��ĳһ��Ӫ��ҽ���ͳһ����
--ʹ�÷������ȶ���һ��ִ�к���������������������Ϊһtable��
--Ȼ������������Ϊ��һ�����������OP_AllMSPlayer������
--ͨ����table�ķ�ʽ���Դ����������ִ�к�����
function KF_OperateAllPlayer(ufunc, tArg, nCamp)
	local OldPlayerIndex = PlayerIndex;
	local IDTab = mf_GetMSPlayerIndex(KF_MISSION_ID, nCamp);
	local nPlayerCount = getn(IDTab);
	for i = 1, nPlayerCount do
		PlayerIndex = IDTab[i];
		if PlayerIndex > 0 then
			ufunc(tArg);
		else
			Write_Log("[Chi�n tr��ng li�n ��u]","KF_OperateAllPlayer(), ng��i ch�i ti�p d�n nh� h�n ho�c b�ng 0");
		end;
	end
	PlayerIndex = OldPlayerIndex;
end;

--����ս�����
function KF_SetRezultToPlayer(tPara)
	local nWinner = tPara[1]
	local tPozhen1 = tPara[2][1]
	local tPozhen2 = tPara[2][2]

	if not nWinner then return 0; end
	if type(nWinner) == "table" then
		if getn(nWinner) < 1 then
			return 0;
		end
		if nWinner ~= GetMissionV(KF_MV_BATTLE_WINNER) then
			return 0;
		end
	end
	local nCamp = KF_GetCamp();
	local tMissionV = {
		[KF_CampOne_ID] = KF_MV_BATTLE_SONG_SCORE,
		[KF_CampTwo_ID] = KF_MV_BATTLE_LIAO_SCORE,	
	}
	if nWinner == nCamp then
		KF_SetBattleRezult(2);
	elseif nWinner == KF_ALL_ID then
		KF_SetBattleRezult(4);
	else
		KF_SetBattleRezult(3);
	end

	local resMsg = ""
	if nWinner == KF_ALL_ID then
		resMsg = format("K�t th�c chi�n tr��ng, hai b�n b�t ph�n th�ng b�i, h�y ch� r�i kh�i chi�n tr��ng!\n%s phe ta ���c t�ng t�ch l�y <color=green>%d<color>\nC�ng hi�n t� t�ch �i�m c� nh�n <color=green>%d<color>\n�� t�ch c�c c� nh�n <color=green>%d<color>", 
		KF_tCampName[nCamp], GetMissionV(KF_MV_BATTLE_LIAO_SCORE), GetTaskTemp(TMP_TASK_KF_SCORE), KF_GetActivity())
	else
		resMsg = format("K�t th�c chi�n tr��ng, %s gi�nh chi�n th�ng, h�y ch� r�i kh�i chi�n tr��ng!\n%s phe ta ���c t�ng t�ch l�y<color=green>%d<color>\nC�ng hi�n t� t�ch �i�m c� nh�n <color=green>%d<color>\n�� t�ch c�c c� nh�n <color=green>%d<color>",
		KF_tCampName[nWinner], KF_tCampName[nCamp], GetMissionV(tMissionV[nCamp]), GetTaskTemp(TMP_TASK_KF_SCORE), KF_GetActivity())
	end
	
	local playerName = GetName() 
	if getn(tPozhen1) > 0 or getn(tPozhen2) > 0 then
		local strPozhen = "Vua Ph� Tr�n:"

		local pzCnt = min(3, getn(tPozhen1))
		strPozhen = format("%s\n%s : ",strPozhen, KF_tCampName[1])
		for i = 1, pzCnt do
			strPozhen = format("%s  %s",strPozhen, tPozhen1[i][1])
			if playerName == tPozhen1[i][1] then
				SetTask(TASKID_KF_POZHENKING,1)
			end
		end
		pzCnt = min(3, getn(tPozhen2))
		strPozhen = format("%s\n%s : ",strPozhen, KF_tCampName[2])
		for i = 1, pzCnt do
			strPozhen = format("%s  %s",strPozhen, tPozhen2[i][1])
			if playerName == tPozhen2[i][1] then
				SetTask(TASKID_KF_POZHENKING,1)
			end
		end

		resMsg = format("%s\n%s",resMsg, strPozhen)
	end

	Talk(1, "", resMsg);
end

function KF_KickSleep()
	local nCamp = KF_GetCamp();
	if IsSleeping() == 1 then
		Talk(1,"","K� th� tr��c m�t v�y m� d�m ng� g�t, ng��i ��u l�i ra cho ta!");
		LeaveTeam();
		DelMSPlayer(KF_MISSION_ID, nCamp);
		Msg2MSAll(KF_MISSION_ID, GetName().."R�i kh�i chi�n tr��ng.");
		return 1;
	end;
	return 0;
end

function KF_KickDeather()
	if IsPlayerDeath() == 1 then
		local nLeftLoop = tonumber(GetTime()) - GetTaskTemp(TMP_TASK_KF_TIME)
		local nCamp = KF_GetCamp();
		if nLeftLoop >= 60 and GetTaskTemp(TMP_TASK_KF_TIME) ~= 0 then --60s
			LeaveTeam();
			DelMSPlayer(KF_MISSION_ID, nCamp);
			Msg2MSAll(KF_MISSION_ID, GetName().."R�i kh�i chi�n tr��ng.");
		end
		return 1;
	else
		SetTaskTemp(TMP_TASK_KF_TIME, 0);
	end;
	return 0;
end

--ˢ4��ʿ��
function KF_CreateShiBing(nKind, nCamp)
	local tNpcTable = KF_SHIBINF_NPC[nKind]
	if not tNpcTable then return 0;  end
	if nCamp ~= KF_CampOne_ID and nCamp ~= KF_CampTwo_ID then
		return 0;
	end
	local tNeedNpcTable = tNpcTable[nCamp];
	if not tNeedNpcTable then return 0; end
	local npcIndex;
	local nMapID = SubWorldIdx2ID(SubWorld);
	for i, npcInfo in tNeedNpcTable do
		npcIndex = CreateNpc(npcInfo[1], npcInfo[2], nMapID, npcInfo[3], npcInfo[4]);
		SetNpcScript(npcIndex, npcInfo[5]);
		SetCampToNpc(npcIndex, KF_tCampType[nCamp]);
	end
end

function KF_CreateZhenqi(nKind, id, f, x)
	local tNpcList = KF_FLAG_NPCLIST[nKind];
	if not tNpcList then return 0; end
	local nMap, nX, nY = GetNpcWorldPos(id);
	if 0 == f then --���ɱ��NPC
		local  nCamp = KF_GetCamp();
		local npcIndex = CreateNpc(tNpcList[nCamp][1], tNpcList[nCamp][2], nMap, nX, nY);
		SetNpcScript(npcIndex, tNpcList[nCamp][3]);
		SetCampToNpc(npcIndex, KF_tCampType[nCamp]);
		Msg2MSAll(KF_MISSION_ID, format("%s, anh h�ng %s, �� chi�m %s.", KF_tCampName[nCamp], GetName(), tNpcList[0][2]));
		--�������
		SetMissionV(tNpcList[nCamp][4], nCamp);
		KF_AddScore(KF_SCORE_ZHENQI, nCamp);
		KF_CreateShiBing(nKind, nCamp);

		local pozhenPoint = KF_FIGHT_TIMER_LOOP*200 + GetMissionV(KF_MV_BATTLE_TIMER_LOOP)  -- 1499 * 200 + ��ǰʣ������ == �����������ҵ�������� ==> Խ��������죬��ֵԽ��
		SetTask(TASKID_KF_DESTROY_FLAG, GetTask(TASKID_KF_DESTROY_FLAG) + pozhenPoint)

		if nKind ~= 5 then  -- �ݻ�����
			KF_AddActivity_Ext(KF_ACTIVITY_TYPE_KILLAFLAGS)
		else				-- �ݻٴ���
			KF_AddActivity_Ext(KF_ACTIVITY_TYPE_KILLBIGFLG)
		end

		local distroier = PlayerIndex
		-- ��������--
		local KillerMap, killerX, killerY = GetWorldPos()
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= distroier then
				local m,x,y = GetWorldPos()
				if m == KillerMap and (killerX - x)*(killerX - x) + (killerY - y)*(killerY - y) <700 then -- ͬ����
					if nKind ~= 5 then  -- ��������
						KF_AddActivity_Ext(KF_ACTIVITY_TYPE_FLAGASSIST)
					else				-- ��������
						KF_AddActivity_Ext(KF_ACTIVITY_TYPE_BIGFLGASIT)
					end
				end
			end
		end
		PlayerIndex = distroier;
		-- ------- --
		_stat_when_kill_flag()
	elseif x and x > 0 then --NPCɱNPC
		local szCampName = GetNpcCampName(x);
		local tMap = {
			["camp_player"] = KF_CampOne_ID,
			["camp_enemy"] = KF_CampTwo_ID,
		}
		if tMap[szCampName] then
			local npcIndex = CreateNpc(tNpcList[tMap[szCampName]][1], tNpcList[tMap[szCampName]][2], nMap, nX, nY);
			SetNpcScript(npcIndex, tNpcList[tMap[szCampName]][3]);
			SetCampToNpc(npcIndex, KF_tCampType[tMap[szCampName]]);
			Msg2MSAll(KF_MISSION_ID, format("%s chi�m th�nh c�ng %s.", KF_tCampName[tMap[szCampName]], tNpcList[0][2]));
			--�������
			--mf_SetMissionV(KF_MISSION_ID, tNpcList[tMap[szCampName]][4], tMap[szCampName], GetMissionV(KF_MV_BATTLE_MAP_ID));
			SubWorld = f; -- npcɱ��npc��ʱ��ű�PlayerIndexû�У�SubWorldΪ-1
			SetMissionV(tNpcList[tMap[szCampName]][4], tMap[szCampName]);
			KF_AddScore(KF_SCORE_ZHENQI, tMap[szCampName]);
			--npcɱnpc�����ۼӵ���Ծ����ȥû��PlayerInde
			--KF_AddActivity(KF_ACTIVITY_ZHENQI, tMap[szCampName]);
			KF_CreateShiBing(nKind, tMap[szCampName]);
		else
			local npcIndex = CreateNpc(tNpcList[KF_ALL_ID][1], tNpcList[KF_ALL_ID][2], nMap, nX, nY);
			SetNpcScript(npcIndex, tNpcList[KF_ALL_ID][3]);
			SetCampToNpc(npcIndex, KF_tCampType[KF_ALL_ID]);
			Msg2MSAll(KF_MISSION_ID, format("Phe trung l�p �� chi�m %s.", tNpcList[0][2]));
			SetMissionV(tNpcList[KF_ALL_ID][4], KF_ALL_ID);		
		end
	end
end

--��ǲ���ܵ�TABLE
--bTag = 0���ȷ�
--bTag = 1�ɶ�ξ
function KF_GetSayTale(nCamp, nKind, bTag)
	local tRet = {};
	if not bTag then return tRet; end
	local tTemp = {
		{KF_MV_BATTLE_FLAG_JM, "Ph�i ��n C�nh M�n"},
		{KF_MV_BATTLE_FLAG_MM, "Ph�i ��n Di�t M�n"},
		{KF_MV_BATTLE_FLAG_SM, "Ph�i ��n Sinh M�n"},
		{KF_MV_BATTLE_FLAG_SI, "Ph�i ��n T� M�n"},
		{KF_MV_BATTLE_FLAG_DA, "Ph�i ��n ��i Tr�n K�"},	
	}
	local strFunc = {
		[1] = "/#KF_Order_XianFeng(%d)",
		[2] = "/#KF_Order_Duwei(%d)",
	}
	if nKind ~= 1 and nKind ~= 2 then return 0; end
	for i = 1, getn(tTemp) do
		if bTag == 0 then
			tinsert(tRet, tTemp[i][2]..format(strFunc[nKind], i));
		elseif bTag == 1 then
			if GetMissionV(tTemp[i][1]) == nCamp then
				tinsert(tRet, tTemp[i][2]..format(strFunc[nKind], i));
			end
		end
	end
	tinsert(tRet, "Ra kh�i/nothing");
	return tRet;
end

--��ȡ�ȷ�CDʱ��
function KF_GetXianfengCD()
	local nCamp = KF_GetCamp();
	local tMissionV = {
		[KF_CampOne_ID] = {KF_MV_BATTLE_XIANFENG_TAG_SONG, KF_MV_BATTLE_XIANFENG_DEATHTIME_SONG},
		[KF_CampTwo_ID] = {KF_MV_BATTLE_XIANFENG_TAG_LIAO, KF_MV_BATTLE_XIANFENG_DEATHTIME_LIAO},
	}
	local nTag = GetMissionV(tMissionV[nCamp][1]);
	if nTag == 0 then --δ��ǲ
		return 0;
	elseif nTag == 1 then --����ǲ
		return KF_ORDER_XF_CD;
	elseif nTag == 2 then
		local nDeathTime = GetMissionV(tMissionV[nCamp][2]);
		local nSpaceTime = GetTime() - nDeathTime;
		if nSpaceTime >= KF_ORDER_XF_CD then
			SetMissionV(tMissionV[nCamp][1], 0);
			return 0;
		else
			return min(KF_ORDER_XF_CD - nSpaceTime, KF_ORDER_XF_CD);
		end
	end
end

--��ȡ��ξCDʱ��
function KF_GetDuWeiCD()
	local nCamp = KF_GetCamp();
	local tMissionV = {
		[KF_CampOne_ID] = {KF_MV_BATTLE_DUWEI_TAG_SONG, KF_MV_BATTLE_DUWEI_DEATHTIME_SONG},
		[KF_CampTwo_ID] = {KF_MV_BATTLE_DUWEI_TAG_LIAO, KF_MV_BATTLE_DUWEI_DEATHTIME_LIAO},
	}
	local nTag = GetMissionV(tMissionV[nCamp][1]);
	if nTag == 0 then --δ��ǲ
		return 0;
	elseif nTag == 1 then --����ǲ
		return KF_ORDER_DW_CD;
	elseif nTag == 2 then --������
		local nDeathTime = GetMissionV(tMissionV[nCamp][2]);
		local nSpaceTime = GetTime() - nDeathTime;
		if nSpaceTime >= KF_ORDER_DW_CD then
			SetMissionV(tMissionV[nCamp][1], 0);
			return 0;
		else
			return min(KF_ORDER_DW_CD - nSpaceTime, KF_ORDER_DW_CD);
		end
	end
end

function KF_Order_XianFeng(nWhich)
	if KF_GetXianfengCD() ~= 0 then
		Talk(1,"","Ch�c n�ng tri�u g�i v�n c�n �ang trong th�i gian ch� h�i ph�c, t�m th�i kh�ng th� tri�u g�i!");
		return 0;
	end
	local tPos = KF_ORDER_POS[nWhich];
	if not tPos then return 0;  end
	local nMapID = GetWorldPos();
	local nCamp = KF_GetCamp();
	local tNpc = {
		[KF_CampOne_ID] = {"KFZC_songxianfeng", "T�ng Ti�n Phong", "\\script\\missions\\kuafu_battle\\npc\\death_xianfeng_song.lua", KF_MV_BATTLE_XIANFENG_TAG_SONG},
		[KF_CampTwo_ID] = {"KFZC_liaoxianfeng", "Li�u Ti�n Phong", "\\script\\missions\\kuafu_battle\\npc\\death_xianfeng_liao.lua", KF_MV_BATTLE_XIANFENG_TAG_LIAO},	
	}
	local npcIndex = CreateNpc(tNpc[nCamp][1], tNpc[nCamp][2], nMapID, tPos[1], tPos[2]);
	SetNpcDeathScript(npcIndex, tNpc[nCamp][3]);
	SetCampToNpc(npcIndex, KF_tCampType[nCamp]);
	KF_CreateShiBing(nWhich, nCamp);
	SetMissionV(tNpc[nCamp][4], 1);
	Msg2MSAll(KF_MISSION_ID, format("%s (Nguy�n So�i/T��ng Qu�n): %s Ti�n Phong ph�ng m�nh ��t k�ch %s.", GetName(), KF_tCampName[nCamp], tPos[3]));
end

function KF_Order_Duwei(nWhich)
	if KF_GetDuWeiCD() ~= 0 then
		Talk(1,"","Ch�c n�ng tri�u g�i v�n c�n �ang trong th�i gian ch� h�i ph�c, t�m th�i kh�ng th� tri�u g�i!");
		return 0;
	end
	local tPos = KF_ORDER_POS[nWhich];
	if not tPos then return 0;  end
	local nMapID = GetWorldPos();
	local nCamp = KF_GetCamp();
	local tNpc = {
		[KF_CampOne_ID] = {"KFZC_songdutong", "T�ng �� Th�ng", "\\script\\missions\\kuafu_battle\\npc\\death_duwei_song.lua", KF_MV_BATTLE_DUWEI_TAG_SONG},
		[KF_CampTwo_ID] = {"KFZC_liaodutong", "Li�u �� Th�ng", "\\script\\missions\\kuafu_battle\\npc\\death_duwei_liao.lua", KF_MV_BATTLE_DUWEI_TAG_LIAO},	
	}
	local npcIndex = CreateNpc(tNpc[nCamp][1], tNpc[nCamp][2], nMapID, tPos[1], tPos[2]);
	SetNpcDeathScript(npcIndex, tNpc[nCamp][3]);
	SetCampToNpc(npcIndex, KF_tCampType[nCamp]);
	KF_CreateShiBing(nWhich, nCamp);
	SetMissionV(tNpc[nCamp][4], 1);
	Msg2MSAll(KF_MISSION_ID, format("%s (Nguy�n So�i/T��ng Qu�n): %s �� �y ph�ng m�nh ��t k�ch %s.", GetName(), KF_tCampName[nCamp], tPos[3]));
end

--��������
function KF_CreateJiangJun()
	local nMapID = GetMissionV(KF_MV_BATTLE_MAP_ID);
	local npcIndex = CreateNpc("KFZC_songjiangjun", "T�ng T��ng Qu�n", nMapID, 1660, 3671);
	SetNpcDeathScript(npcIndex, "\\script\\missions\\kuafu_battle\\npc\\death_song_jiangjun.lua");
	SetCampToNpc(npcIndex, KF_tCampType[KF_CampOne_ID]);
	KF_CreateShiBing(6, KF_CampOne_ID);
	npcIndex = CreateNpc("KFZC_liaojiangjun", "Li�u T��ng Qu�n", nMapID, 1823, 3373);
	SetNpcDeathScript(npcIndex, "\\script\\missions\\kuafu_battle\\npc\\death_liao_jiangjun.lua");
	SetCampToNpc(npcIndex, KF_tCampType[KF_CampTwo_ID]);
	KF_CreateShiBing(6, KF_CampTwo_ID);
	SetMissionV(KF_MV_BATTLE_JIANGJUN_TAG, 1);
	Msg2MSAll(KF_MISSION_ID, "Chi�n tr�n hi�n t�i v� c�ng kh�c li�t, T��ng Qu�n 2 phe �� th�ng l�nh s� binh x�ng tr�n quy�t chi�n.");
end

--Ұ��BOSS��BUFF�Ļ���
function KF_GiveMonsterBuff(nValue)
	if not nValue then return 0;  end
	local nKind = 1;
	if type(nValue) == "table" then
		nKind = nValue[1];
	else
		nKind = nValue;
	end
	if nKind < 1 or nKind > getn(KF_TSTATEMAGICATTR) then
		print("UDERROR:KF_GiveMonsterBuff nValue illegality");
		return 0;
	end
	local tMagic = KF_TSTATEMAGICATTR[nKind];
	if not tMagic then return 0; end
	local msg = "";
	for i = 1, getn(tMagic) do
		CastState(tMagic[i][1], tMagic[i][2], tMagic[i][3], 1, tMagic[i][4], 1);
		msg = msg..format(tMagic[i][6], tMagic[i][2]);
		if i ~= getn(tMagic) then
			msg = msg..","
		end
	end
	SyncCustomState(1, tMagic[1][4], tMagic[1][5], msg);
	Msg2Player("C�c h� nh�n ���c hi�u qu� h� tr� sau khi ti�u di�t qu�i tr�n chi�n tr��ng:"..msg);
end

function KF_Add_XueHenBuff()

	local nTbIdx = 0;
	local nDeathCnt = GetTask(TASKID_KF_CONTINUOUS_DEAD_CNT)
	if nDeathCnt < 3 then return end
	if nDeathCnt > 0 then
		for i = 1,getn(KF_XUEHEN) do
			if nDeathCnt >= KF_XUEHEN[i][1] then
				nTbIdx = i;
				break;
			end
		end
	end

	--����ѩ��״̬�ټ�
	RemoveState(9908);
	RemoveState(9909);
	RemoveState(9910);
	RemoveState(9911);

	RemoveState(9912); -- �����޾�
	RemoveState(9913); -- �����Ƶ�

	local BUFF_TIME = 5 -- ����
	if nTbIdx ~= 0 then
		CastState("state_destiny_armor_point_add",KF_XUEHEN_EXT[nTbIdx][1],BUFF_TIME*60*18,1,9912,1); 	-- �޾�
		CastState("state_destiny_attack_point_add",KF_XUEHEN_EXT[nTbIdx][2],BUFF_TIME*60*18,1,9913,1); 	-- �Ƶ�

		CastState("state_p_attack_percent_add",KF_XUEHEN[nTbIdx][2],BUFF_TIME*60*18,1,9908,1); 	--�⹥����
		CastState("state_m_attack_percent_add",KF_XUEHEN[nTbIdx][2],BUFF_TIME*60*18,1,9909,1);	--�ڹ�����
		CastState("state_life_max_percent_add",KF_XUEHEN[nTbIdx][3],BUFF_TIME*60*18,1,9910,1);	--��������
		CastState("state_buff_resist",KF_XUEHEN[nTbIdx][4],BUFF_TIME*60*18,1,9911,1);			--���߸���״̬
		SyncCustomState(1,9908,1,KF_XUEHEN[nTbIdx][5]);
		Msg2Player("B�n nh�n ���c "..KF_XUEHEN[nTbIdx][5].."Hi�u qu�: "..format(KF_XUEHEN[nTbIdx][6], KF_XUEHEN[nTbIdx][2], KF_XUEHEN[nTbIdx][3], KF_XUEHEN[nTbIdx][4])..format(KF_XUEHEN_EXT[nTbIdx][3],KF_XUEHEN_EXT[nTbIdx][1])..format("Duy tr� %d ph�t.",BUFF_TIME));
		if nTbIdx <= 9 then
			SetCurrentNpcSFX(PIdx2NpcIdx(), 921,1,0,18*3);
		end
	end
end

--ɱ��������
function KF_KillPaiMing()
	for nCamp = 1, 2 do
		local tKiller = {};
		local OldPlayerIndex = PlayerIndex;
		local IDTab = mf_GetMSPlayerIndex(KF_MISSION_ID, nCamp);
		local nPlayerCount = getn(IDTab);
		for i = 1, nPlayerCount do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				tKiller[i] = {gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 3, 4),GetName()};
			end;
		end
		PlayerIndex = OldPlayerIndex;
		SORT_COUNT_MAX = 3; 
		if getn(tKiller) >= SORT_COUNT_MAX then
			local _sort = function(tTable1, tTable2)
				if tTable1[1] > tTable2[1] then
					return 1;
				else
					return nil;
				end
			end
			sort(tKiller, _sort);
			local msg = format("X�p h�ng cao th� %s: ",KF_tCampName[nCamp]);
			for j = 1, SORT_COUNT_MAX do
				msg = msg..format("%s(%d)", tKiller[j][2], tKiller[j][1]);
				if j ~= SORT_COUNT_MAX then
					msg = msg..","
				end
			end
			Msg2MSAll(KF_MISSION_ID, msg);
		end
	end
end

function KF_GetZhenQiNum(nCamp)
	if nCamp ~= KF_CampOne_ID and nCamp ~= KF_CampTwo_ID then
		return 0;
	end
	local tTemp = {
		KF_MV_BATTLE_FLAG_JM, --����0������1�Σ�2��
		KF_MV_BATTLE_FLAG_MM, --����0������1�Σ�2��
		KF_MV_BATTLE_FLAG_SM,	--����0������1�Σ�2��
		KF_MV_BATTLE_FLAG_SI,	--����0������1�Σ�2��
		KF_MV_BATTLE_FLAG_DA,	--����0������1�Σ�2��
	}
	local nCount = 0;
	for i = 1, getn(tTemp) do
		if GetMissionV(tTemp[i]) == nCamp then
			nCount = nCount + 1;
		end
	end
	return nCount;
end

function KF_MsgZhenQiState()
	local tMsg = {
		[0] = "Trung l�p",
		[1] = "Qu�n T�ng",
		[2] = "Qu�n Li�u",	
	}
	Msg2MSAll(KF_MISSION_ID, format("Tr�n k� chi�m l�nh: C�nh M�n (%s), Di�t M�n (%s), Sinh M�n (%s), T� M�n (%s), ��i Tr�n K� (%s).", 
		tMsg[GetMissionV(KF_MV_BATTLE_FLAG_JM)], tMsg[GetMissionV(KF_MV_BATTLE_FLAG_MM)], tMsg[GetMissionV(KF_MV_BATTLE_FLAG_SM)], 
		tMsg[GetMissionV(KF_MV_BATTLE_FLAG_SI)], tMsg[GetMissionV(KF_MV_BATTLE_FLAG_DA)]));
end

function KF_ParkAward(nWinType, nCount)
	if nWinType < 2 or nWinType > 4 then
		return
	end
	local nWin = 1		-- ��ʤ
	if nWinType ~= 2 then
		nWin = 2		-- ս��orսƽ
	end
	local RANDOM = {
		KF_PARK_RANDOM_WIN,
		-- KF_PARK_RANDOM_LOSE
	}
	local CERTAIN = {
		KF_PARK_CERTAIN_WIN,
		KF_PARK_CERTAIN_LOSE
	}
	local tRandom = RANDOM[nWin]
	local tCertain = CERTAIN[nWin]
	if GetFreeItemRoom() < 2 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	if tRandom ~= nil then
		gf_EventGiveRandAward(tRandom, gf_SumRandBase(tRandom), 1, KF_LOGTITEL, KF_LOGTITEL);
	end
	if tCertain ~= nil then
		gf_EventGiveAllAward(tCertain, KF_LOGTITEL, KF_LOGTITEL);
	end
end

--�������������
function KF_RevivePlayer()
	local nMapID, nX, nY = GetWorldPos();
	local nCamp = KF_GetCamp();
	SetTempRevPos(nMapID, KF_JOIN_MISSION_POS[nCamp][1]*32, KF_JOIN_MISSION_POS[nCamp][2]*32);
	SetFightState(0);
end

--ǰ��ʿ������
function KF_TransmitPlayer(nPos, nX, nY)
	local tTemp = {
		KF_MV_BATTLE_FLAG_JM, --����0������1�Σ�2��
		KF_MV_BATTLE_FLAG_MM, --����0������1�Σ�2��
		KF_MV_BATTLE_FLAG_SM,	--����0������1�Σ�2��
		KF_MV_BATTLE_FLAG_SI,	--����0������1�Σ�2��
		KF_MV_BATTLE_FLAG_DA,	--����0������1�Σ�2��
	}
	local nCamp = KF_GetCamp();
	if nPos > 0 and nPos <= getn(tTemp) then
		local nCurrFlagCamp = GetMissionV(tTemp[nPos]);
		if nCurrFlagCamp == KF_ALL_ID then
			Talk(1,"","Tr�n K� trung l�p kh�ng th� d�ch chuy�n");
			return 0;
		end
		if nCurrFlagCamp ~= nCamp then
			Talk(1,"",format("Tr�n K� �� b� %s chi�m, d�ch chuy�n th�t b�i.", KF_tCampName[GetMissionV(tTemp[nPos])]))
			return 0;
		end
	end
	CastState("state_dispear",100,18*3)
	SetPos(nX, nY);
	KF_Add_XueHenBuff();
	Restore();
	RestoreNeili();
	SetFightState(1);
	Msg2Player("Khai chi�n n�o!");
end

--��ʱ�ӻ��㴫��
function KF_SafeTransmitPlayer(nIndex)
	local nCamp = KF_GetCamp();
	if nCamp ~= KF_CampOne_ID and nCamp ~= KF_CampTwo_ID then
		return 0;
	end
	local tPos = KF_TEMP_SAFE_POS[nCamp]
	if not tPos then
		return 0
	end
	if nIndex <= 0 or nIndex > getn(tPos) then
		return 0;
	end
	CastState("state_dispear",100,18*3)
	SetPos(tPos[nIndex][1], tPos[nIndex][2]);
	KF_Add_XueHenBuff();
	Restore();
	RestoreNeili();
	SetFightState(1);
	Msg2Player("Khai chi�n n�o!");
end

--FloatMsg2Player
function KF_FloatMsg2PlayerToAll()
	local uMsg2Player = function ()
		local sMsg = format("T�ng %d: Li�u %d\n s� l�n chi�m l�nh:\n T�ng %d: Li�u %d\n nh�n s�:\n T�ng %d: Li�u %d\n s� ng��i ti�u di�t:%d\n s� l�n b� ti�u di�t:%d", 
			-- GetMissionV(KF_SCORE_MAX), 
			GetMissionV(KF_MV_BATTLE_SONG_SCORE), GetMissionV(KF_MV_BATTLE_LIAO_SCORE), KF_GetZhenQiNum(KF_CampOne_ID), KF_GetZhenQiNum(KF_CampTwo_ID),
			GetMSPlayerCount(KF_MISSION_ID,KF_CampOne_ID), GetMSPlayerCount(KF_MISSION_ID,KF_CampTwo_ID),
			gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 3, 4), gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 1, 2));
		FloatMsg2Player(sMsg);
	end
	KF_OperateAllPlayer(uMsg2Player, {}, KF_ALL_ID);
end

function KF_ReviveRestoreAll()
	local uRestoreAll = function ()
		if gf_GetTaskBit(KF_BATTLE_TASK, 27) == 1 then
			RestoreAll();
			gf_SetTaskBit(KF_BATTLE_TASK, 27, 0, TASK_ACCESS_CODE_KF_BATTLE);
		end
	end
	KF_OperateAllPlayer(uRestoreAll, {}, KF_ALL_ID);
end

function KF_GetNBWeapon()
	local nRoute = GetPlayerRoute();
	local tWeapon = KF_NB_WEAPON_TABLE[nRoute];
	if not tWeapon or getn(tWeapon) ~= 14 then  return 0;  end
	if GetFreeItemRoom() < 1 then
		Msg2Player("H�nh trang ��y, kh�ng th� nh�n V� Kh� Cam +15.")
		return 0;
	end
	local nRet, nItemIndex
	if BigGetItemCount(tWeapon[1],tWeapon[2],tWeapon[3]) < 1 then
		nRet, nItemIndex = AddItem(tWeapon[1],tWeapon[2],tWeapon[3],tWeapon[4],tWeapon[5],
				tWeapon[6],tWeapon[7],tWeapon[8],tWeapon[9],tWeapon[10],tWeapon[11],tWeapon[12],tWeapon[13])
		if nRet == 1 then
			SetItemExpireTime(nItemIndex, KF_WEAPON_EXIST_TIME);
			--HeadMsg2Player(format("����<color=gold>%s<color>", tWeapon[14]));
		end
	end
end

function DelNBWeapon()
	local nRoute = GetPlayerRoute();
	local tWeapon = KF_NB_WEAPON_TABLE[nRoute];
	if not tWeapon or getn(tWeapon) ~= 14 then  return 0;  end
	if BigGetItemCount(tWeapon[1],tWeapon[2],tWeapon[3]) > 0 then
		BigDelItem(tWeapon[1],tWeapon[2],tWeapon[3], BigGetItemCount(tWeapon[1],tWeapon[2],tWeapon[3]));
	end
end

--���Դ����Ҫִ�еĿ۽���
function KF_PlayerLoginOriginServer()
	--�ⶫ���Ƿ���
	if IsSubSystemOpen(SYS_SWITCH_KF_BATTLE) ~= 1 then
		return 0;
	end	
	--�۽����
	local nCount = gf_GetMyTaskBit(KF_BATTLE_TASK, 1, 5);
	if nCount > 0 then
		if Pay(nCount * KF_ENTRY_FEE * 10000) == 1 then
			gf_SetMyTaskBit(KF_BATTLE_TASK, 1, 5, 0, TASK_ACCESS_CODE_KF_BATTLE);
		end	
	end
end
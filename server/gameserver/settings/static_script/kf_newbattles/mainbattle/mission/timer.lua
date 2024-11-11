--filename:timer.lua
--create date:2006-06-22
--describe:��ս��������ʱ���ű�
Include("\\settings\\static_script\\kf_newbattles\\mainbattle\\mainbattle_head.lua");

SZ_BF_CHEAT_OP_SCRIPT = "\\settings\\static_script\\kf_newbattles\\mainbattle\\anti_cheat\\player_cheat_op.lua"

function OnTimer()
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_PEACE then
	
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_READY then
		Process_Ready_Timer();
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		Process_Fight_Timer();
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_COMPLETE then
		Process_WaitOut_Timer();
	end;
end;

function Process_Ready_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		RunMission(MISSION_ID);
		
		local szScript = format("pco_initialize()")
		SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
		SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
	
		if mod(nGlobalState,10) == 3 then
			SetGlbValue(GLB_NEW_BATTLESTATE,nGlobalState+1);	--��Ϊxx4
			AddGlobalNews("Nh�n M�n Quan-chi�n d�ch ch�nh s�p khai chi�n, nh�ng ai �� b�o danh nhanh ch�ng v�o trong chu�n b�.");
			Msg2Global("Nh�n M�n Quan-chi�n d�ch ch�nh s�p khai chi�n, nh�ng ai �� b�o danh nhanh ch�ng v�o trong chu�n b�.");
		end;
	else
		if mod(nLoop,10) == 0 then
			AddGlobalNews("Gi� khai chi�n Nh�n M�n Quan-chi�n d�ch ch�nh ch� c�n "..(floor(nLoop/10)*5).." ph�t, m�i c�c v� anh h�ng nhanh ch�ng b�o danh tham gia!");
			Msg2Global("Gi� khai chi�n Nh�n M�n Quan-chi�n d�ch ch�nh ch� c�n "..(floor(nLoop/10)*5).." ph�t, m�i c�c v� anh h�ng nhanh ch�ng b�o danh tham gia!");
		end;
		Msg2MSAll(MISSION_ID," c�n "..Get_Time_String(READY_TIME/18*nLoop)..", "..tBattleName[BATTLE_TYPE].."s�p b�t ��u. S� ng��i T�ng-Li�u hi�n l�: T�ng ["..nPlayerSong.."]:["..nPlayerLiao.."] Li�u");
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
	end;
end;

function Process_Fight_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerAll = GetMSPlayerCount(MISSION_ID,ALL_ID);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	local nPubPointSong = BT_GetMissionPoint(SONG_ID);
	local nPubPointLiao = BT_GetMissionPoint(LIAO_ID);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StopMissionTimer(MISSION_ID,INJURE_TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		BT_ClearRelayData();
		Msg2MSAll(MISSION_ID,tBattleName[BATTLE_TYPE].." �� k�t th�c.");
		
		local szScript = format("pco_uninitialize()")
		SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
		SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
		
		if nPubPointSong > nPubPointLiao then
			SetMissionV(MV_WINNER,SONG_ID);
		elseif nPubPointSong < nPubPointLiao then
			SetMissionV(MV_WINNER,LIAO_ID);
		else
			SetMissionV(MV_WINNER,ALL_ID);
		end;
		
		local tRank = {}
		tRank[SONG_ID] = BT_SortMSPlayerByTaskValue(PTNC_ACTIVITY_KF, 0, SONG_ID)
		tRank[LIAO_ID] = BT_SortMSPlayerByTaskValue(PTNC_ACTIVITY_KF, 0, LIAO_ID)
		local tTop3 = {}
		tTop3[SONG_ID] = {}
		tTop3[LIAO_ID] = {}
		local oldPlayerIndex = PlayerIndex
		for nC = 1, 2 do
			-- ������Ӫ
			local rank = tRank[nC]
			for i = 1, getn(rank) do
				if i > T_TSK_KF_RANK_AWARD_NEED_RANK[BATTLE_TYPE] then
					break --�ܹ�n�ˣ������˳�
				end
				PlayerIndex = rank[i]
				SetTask(T_TSK_KF_PERSONAL_RANK[BATTLE_TYPE], i)
				tinsert(tTop3[nC], {GetName(), BT_GetData(PTNC_ACTIVITY_KF)})
			end
		end
		PlayerIndex = oldPlayerIndex

		BT_OperateAllPlayer(tell_end,{tTop3[SONG_ID]},SONG_ID);
		BT_OperateAllPlayer(tell_end,{tTop3[LIAO_ID]},LIAO_ID);
	else
		local nVillageResult = GetGlbValue(GLB_VILLAGE);
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID,"Ti�n �� th�i gian: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
		if mod(nLoop,2) == 0 then
			BT_OperateAllPlayer(BT_KickSleeper,{},ALL_ID);
		end;
		if mod(nLoop,3) == 0 then
			Msg2MSAll(MISSION_ID,"S� ng��i T�ng-Li�u hi�n t�i: T�ng ["..nPlayerSong.."]:["..nPlayerLiao.."] Li�u");
		end;
		if mod(nLoop,9) == 0 then	--������ˢһ�α���
			Create_Random_Pos_Box(GetMissionV(MV_KILL_BOX_COUNT));
			Msg2MSAll(MISSION_ID,"�i�m t�ch l�y c�ng c�ng T�ng-Li�u hi�n l�: T�ng ["..nPubPointSong.."]:["..nPubPointLiao.."] Li�u");
		end;
		if mod(nLoop,30) == 0 then	--ʮ����ˢһ��������ʿ����������
			Create_Nonaligned_Hero();
			Create_VillagerHeader(nVillageResult);
			BT_ShowBattleRank(10);	--��ʾ���˻������а�ǰ10��
		end;
		if mod(nLoop,9) == 0 then
			BT_ShowDebugInfor("L�p th� d�n, s� ng��i:"..GetMissionV(MV_KILL_VILLAGER_COUNT));
			Create_Random_Pos_Villager(nVillageResult,GetMissionV(MV_KILL_VILLAGER_COUNT));
			Create_Fight_NPC(TYPE_SOLDIER,GetMissionV(MV_KILL_SONG_SOLDIER_COUNT),SONG_ID);
			Create_Fight_NPC(TYPE_SOLDIER,GetMissionV(MV_KILL_LIAO_SOLDIER_COUNT),LIAO_ID);
		end;
		BT_DrivePlayerOutOfShelter();
		BT_CureAllPlayer();
	end;
end;

function Process_WaitOut_Timer()
	local nPlayerAll = GetMSPlayerCount(MISSION_ID,ALL_ID);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);

	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID," c�n "..(COMPLETE_TIME/18*nLoop).." gi�y r�i kh�i chi�n tr��ng");
	end;
end;

function tell_end(param)
	local tRank = param[1]
	local nPubPointSong = BT_GetMissionPoint(SONG_ID);
	local nPubPointLiao = BT_GetMissionPoint(LIAO_ID);
	local nWhoWin = GetMissionV(MV_WINNER);
	if nWhoWin == SONG_ID then
		szResult = "Phe T�ng gi�nh th�ng l�i chung cu�c";
	elseif nWhoWin == LIAO_ID then
		szResult = "Phe Li�u gi�nh th�ng l�i chung cu�c";
	else
		szResult = "Hai b�n b�t ph�n th�ng b�i";
	end;
	local szRank = format("Top %d �� T�ch C�c phe ta:", T_TSK_KF_RANK_AWARD_NEED_RANK[BATTLE_TYPE])
	for i = 1, getn(tRank) do
		if i > T_TSK_KF_RANK_AWARD_NEED_RANK[BATTLE_TYPE] then 
			break
		end
		szRank = format("%s\n    H�ng %d: <color=yellow>%s<color>  T�ch C�c: <color=yellow>%d<color>", szRank, i, tRank[i][1], tRank[i][2])
	end
	local szMsg = tBattleName[BATTLE_TYPE].."�� k�t th�c, <color=yellow>t�ch l�y c�ng c�ng phe T�ng:"..nPubPointSong..", t�ch l�y c�ng c�ng phe Li�u:"..nPubPointLiao..", "..szResult.."<color>."
	Say(szMsg..szRank,0);
	SetTask(T_TSK_KF_ACTIVITY_TO_SOURCE[BATTLE_TYPE], BT_GetData(PTNC_ACTIVITY_KF))
	SetFightState(0);
	RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));	--ɾ������ʱ�䴥����
	BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_IDLE);--���������Ϣ
	BT_SetTempData(PTT_ROOMINDEX,0);
end;
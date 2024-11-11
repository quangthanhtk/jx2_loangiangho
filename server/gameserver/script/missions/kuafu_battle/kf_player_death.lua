Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Import("\\script\\tmp_task_id_def.lua")
Include("\\script\\missions\\kuafu_battle\\runtime_data_stat.lua")

function OnDeath(Launcher)
	--���ҩCD
	ClearColdDown();
	--npc buff Remove

	RemoveState(9908);
	RemoveState(9909);
	RemoveState(9910);
	RemoveState(9911);
	RemoveState(9912); -- �����޾�
	RemoveState(9913); -- �����Ƶ�
	
	for i = 20101, 20106 do
		RemoveState(i);
	end
	--�ǿ�ս״̬��������
	local nBattleState = GetMissionV(KF_MV_BATTLE_STATE);
	if nBattleState ~= KF_MS_STATE_FIGHT then	
		return 0;
	end;
	--����
	KF_RevivePlayer();
	--������ʱ���¼����ʱ��
	SetTaskTemp(TMP_TASK_KF_TIME, GetTime());
	--��ɱ����Ծ��+1
	KF_AddActivity_Ext(KF_ACTIVITY_TYPE_PLAYERDEAD);
	--������ɱ����
	gf_SetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 1, 2, gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 1, 2) + 1);
	--���������
	gf_SetTaskBit(KF_BATTLE_TASK, 27, 1, TASK_ACCESS_CODE_KF_BATTLE);
	--ɾ��NB����
	DelNBWeapon();

	SetTask(TASKID_KF_CONTINUOUS_DEAD_CNT,GetTask(TASKID_KF_CONTINUOUS_DEAD_CNT)+1)
	
	
	--ɱ�˵���һ�Ծ�ͻ��ִ���
	local DeathPlayerIndex = PlayerIndex;
	local KillerPlayerIndex = NpcIdx2PIdx(Launcher);	
	if KillerPlayerIndex > 0 and KillerPlayerIndex ~= DeathPlayerIndex then
		local nOldPlayerIndex = PlayerIndex
		PlayerIndex = KillerPlayerIndex;
		KF_AddActivity_Ext(KF_ACTIVITY_TYPE_KILLPLAYER)	-- ��ɱ���
		SetTask(TASKID_KF_CONTINUOUS_DEAD_CNT, 0)
		-- ��������--
		local KillerMap, killerX, killerY = GetWorldPos()
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= KillerPlayerIndex then
				local m,x,y = GetWorldPos()
				if m == KillerMap and (killerX - x)*(killerX - x) + (killerY - y)*(killerY - y) <700 then -- ͬ����
					KF_AddActivity_Ext(KF_ACTIVITY_TYPE_ASSISTKILL)	
				end
			end
		end
		PlayerIndex = KillerPlayerIndex;
		-- ------- --

		KF_AddScore(KF_SCORE_PLAYER);
		--��¼ɱ�˴���
		gf_SetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 3, 4, gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 3, 4) + 1);
		
		_stat_when_kill_player()
		
		PlayerIndex = DeathPlayerIndex;
		_stat_when_death()
		
		PlayerIndex = nOldPlayerIndex
	end
end
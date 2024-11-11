--boss������

Include("\\settings\\static_script\\kf_newbattles\\emplacementbattle\\emplacementbattle_head.lua");

function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local nMapId, nX, nY = GetNpcWorldPos(npcIndex);
	SetNpcLifeTime(npcIndex,0);
	SetMissionV(MV_LENGXL_BOSS_NPXIDX, 0);
	
	-- BT_AddBattleEvenPoint(BP_EMPLACEMENT_KILL_BOSS);
	local nPoint = BT_GetBattleEvenPoint(BP_EMPLACEMENT_KILL_BOSS);
	BT_AddMissionPoint(BT_GetCamp(),nPoint);     -- ��������

	CastState("state_destiny_attack_point_add", 200, 180*18, 1, 10001, 1);
	CastState("state_destiny_armor_point_add", 200, 180*18, 1, 10002, 1);
	SyncCustomState(1, 10001, 4, "L�u Ly-V� C�");
	SyncCustomState(1, 10002, 7, "�� �ch-Ph� ��ch");
	Msg2Player(format("�� �� h�a oan h�n chi�n tr��ng L�nh H��ng L�ng, nh�n ���c %d �i�m V� C� v� %d �i�m Ph� ��ch", 200, 200));
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),901,0,0)
	
	-- �Ƴ�ɱ������
	-- for i=1, 4 do
	-- 	local nNpcIndex = CreateNpc("ɳĮ����","ɱ������", nMapId, nX, nY, 6, 1, 1, 100);
	-- 	SetNpcScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\shaqi_box.lua");
	-- 	SetNpcLifeTime(nNpcIndex, 3 * 60);
	-- end;
end
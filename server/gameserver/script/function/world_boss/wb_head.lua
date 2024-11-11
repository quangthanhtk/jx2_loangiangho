Include("\\script\\function\\world_boss\\wb_define.lua")
Include("\\script\\lib\\date.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\task_access_code_def.lua")
Import("\\script\\lib\\define.lua")
Include("\\script\\online_activites\\award.lua");

----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\fix\\fix_clone_pk_boss.lua");
----------------------------------------------------------------------------------------------------

function wb_RelayCallCreateBoss(nRandSeed)
	--�Ƿ�ر�
	if not WB_SWITCH or WB_SWITCH ~= 1 then
		return
	end
	--ÿ��������ˢ��
	--local today = Date();
	--local wDay = today:week();
	--if wDay ~= 6 and wDay ~= 0 then
	--	return
	--end
	if not nRandSeed then
		return
	end
	randomseed(nRandSeed)
	local nIndex = random(getn(WB_WORLD_BOSS));
	--�㲥
	local msg = format("Theo t�nh b�o, %s hi�n �ang xu�t hi�n � b�n �� %s, c�c hi�p s� h�y ��n �� xem th�.", WB_WORLD_BOSS[nIndex][2], WB_WORLD_BOSS_MAP[nIndex]);
	Msg2Global(msg);
	AddLocalNews(msg);
	Msg2Global(WB_WORLD_BOSS_INFO[nIndex]);
	AddLocalNews(WB_WORLD_BOSS_INFO[nIndex]);
	--��ͼ���ĸ�GS��
	if SubWorldID2Idx(WB_WORLD_BOSS_POS[nIndex][1][1]) == -1 then
		return
	end
	--��ˢ
	local nPosIndex = random(getn(WB_WORLD_BOSS_POS[nIndex]));
	local tPos = WB_WORLD_BOSS_POS[nIndex][nPosIndex];
	if not tPos or getn(tPos) ~= 3 then return end
	local npcIndex = CreateNpc(WB_WORLD_BOSS[nIndex][1], WB_WORLD_BOSS[nIndex][2], tPos[1], tPos[2], tPos[3]);
	if npcIndex > 0 then
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");
		SetNpcLifeTime(npcIndex, 20 * 60);
		
		_w_fix_ClonePk_OpenFreePk(tPos[1]); --Fix clone c�u tkt
	end
end

function wb_MatchNpc(szName)
	for k, v in WB_WORLD_BOSS do
		if getn(v) == 2 and v[2] == szName then
			return k;
		end
	end
	return -1;
end

function wb_GetBossName()
	for k, v in WB_WORLD_BOSS do
		if type(v) == "table" and getn(v) == 2 then
			if GetToNpcDamageByName(v[2]) > 0 then
				return v[2];
			end
		end		
	end	
	return nil
end

function wb_GetBossMapId()
	for i = 1, getn(WB_WORLD_BOSS) do
		if type(WB_WORLD_BOSS[i]) == "table" and getn(WB_WORLD_BOSS[i]) == 2 then
			if GetToNpcDamageByName(WB_WORLD_BOSS[i][2]) > 0 then
				return WB_WORLD_BOSS_POS[i][1][1];
			end
		end		
	end	
	return 0;
end

function wb_GetSmallBoxFlag()
	return gf_GetTaskBit(TASKID_WORLD_BOSS_USE, 1);
end

function wb_SetSmallBoxFlag()
	gf_SetTaskBit(TASKID_WORLD_BOSS_USE, 1, 1, TASK_ACCESS_CODE_WORLD_BOSS);
end

function wb_GetSmallBoxFlag1()
	return gf_GetTaskBit(TASKID_WORLD_BOSS_USE, 2);
end

function wb_SetSmallBoxFlag1()
	gf_SetTaskBit(TASKID_WORLD_BOSS_USE, 2, 1, TASK_ACCESS_CODE_WORLD_BOSS);
end

function wb_GetBigBoxFlag()
	return gf_GetTaskBit(TASKID_WORLD_BOSS_USE, 3);
end

function wb_SetBigBoxFlag()
	gf_SetTaskBit(TASKID_WORLD_BOSS_USE, 3, 1, TASK_ACCESS_CODE_WORLD_BOSS);
end

function wb_GetBigBoxIndex()
	return gf_GetMyTaskBit(TASKID_WORLD_BOSS_USE, 4, 31)
end

function wb_SetBigBoxIndex(index)
	gf_SetMyTaskBit(TASKID_WORLD_BOSS_USE, 4, 31, index, TASK_ACCESS_CODE_WORLD_BOSS)
end

function wb_DailyClear()
	SetTask(TASKID_WORLD_BOSS_USE, 0, TASK_ACCESS_CODE_WORLD_BOSS);
end

--��ɱboss����
function wb_KillAward()
	gf_Modify("Exp", 8000000);
	gf_AddItemEx2({2, 201, 13,  1 }, "Thi�n V�n Th�ch", "BOSS Th� Gi�i", "Ti�u di�t BOSS", 1, 1)
	gf_AddItemEx2({2, 1, 30669, 20}, "M�nh M�t T�ch", "BOSS Th� Gi�i", "Ti�u di�t BOSS", 0, 1)
	local msg = format("Ch�c M�ng [%s] �� ti�u di�t %s, nh�n ���c %d kinh nghi�m, %s*%d", GetName(), wb_GetBossName() or "BOSS", 8000000, "M�nh M�t T�ch", 20, "Thi�n V�n Th�ch", 1);
	Msg2Global(msg);
	AddLocalNews(msg);
end

function wb_SmallBoxAward()
	--LongDaiKa: mod th�m �i�u ki�n y�u c�u b�t PK
	if g_WCFG_WORLDBOSS.bPkReq == WEnv.TRUE and WPlayer:IsPKState() ~= WEnv.TRUE then
		WNpc:Talk("B�o r��ng c�n th�m s�t kh�, b�t chi�n ��u m�i c� th� m� r��ng!", 1);
		return WEnv.RETCODE_ERROR;
	end

	if gf_Judge_Room_Weight(10, 10," ") ~= 1 then
		return 0;
	end
	--LongDaiKa: ��ng qu� m�c ��nh
	--����
	--gf_Modify("Exp", 4000000);
	--local tAward = {
	--	{1, 20000, "M�nh M�t T�ch", {2, 1, 30669, 1, 4}, 0},
	--
	--	{1, 5000, "L�u Kim", {2, 1, 31096, 1, 4}, 0, 0, 0, 1},
	--	{1, 7000, "Da ��a Long", {2, 1, 30672, 50, 1}, 0},
	--	{1, 7000, "Da Ma Lang", {2, 1, 30673, 50, 1}, 0},
	--	{1, 7000, "Vi�m Linh Ti", {2, 1, 30671, 50, 1}, 0},
	--	{1, 7000, "Huy�n Vi�m Thi�t", {2, 1, 30670, 30, 1}, 0},
	--	{1, 7000, "Ti�n �m Th�ch", {2, 1, 30674, 20, 1}, 0},
	--	{1, 5000, "��ng T� Chi Nguy�n", {2, 1, 30913, 1, 1}, 0},
	--	{1, 4999, "��i Nh�n s�m", {2, 0, 553, 1, 4}, 0},
	--	{1, 10000, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1, 4}, 0},
	--	{1, 20000, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1, 4}, 0},
	--	{1, 1, "M�t T�ch Ti�u Dao", {0, 112, 224, 1}, 0, 0, 0, 1},
	--}
	--gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "BOSS Th� Gi�i", "��i Chi�n B�o H�p")
	--LongDaiKa: ��ng qu� m�c ��nh

	WAward:WorldBoss_OpenSmallBox(); --LongDaiKa: chuy�n ph�n th��ng v� 1 file
	
	--�
	vaf_get_prize_item_30709(5, 1);
	AddRuntimeStat(23, 2, 0, 1);
	--��������������Ƭ
	SendScript2VM("\\script\\function\\honor_tong\\ht_head.lua", "ht_GetTongChip(100, 1)")
	--�������
	SendScript2VM("\\script\\online_activites\\head\\activity_normal_head.lua", "vaf_award_api('tWorldBossBox')");
	--FireEvent("event_mission_box_award", "worldboss", "small", 0)
	return 1;
end

function wb_BigBoxAward()
	local npcIndex = wb_GetBigBoxIndex();
	if GetNpcName(npcIndex) ~= "R��ng V�ng ��i Chi�n" then
		Msg2Player("��ng t�c qu� ch�m, b�o r��ng �� b� ng��i kh�c nh�t m�t");
		return 0;
	end
	if IsNpcDeath(npcIndex) ~= 0 then
		Msg2Player("��ng t�c qu� ch�m, b�o r��ng �� b� ng��i kh�c nh�t m�t");
		return 0;
	end
	local nMapId = GetWorldPos();
	if nMapId ~= wb_GetBossMapId() then
		Talk(1,"","B�n �� hi�n t�i kh�ng th� m� b�o r��ng")
		return 0;
	end
	if IsPlayerDeath() == 1 then
		return 0;
	end

	--LongDaiKa: mod th�m �i�u ki�n y�u c�u b�t PK
	if g_WCFG_WORLDBOSS.bPkReq == WEnv.TRUE and WPlayer:IsPKState() ~= WEnv.TRUE then
		WNpc:Talk("B�o r��ng c�n th�m s�t kh�, b�t chi�n ��u m�i c� th� m� r��ng!", 1);
		return WEnv.RETCODE_ERROR;
	end

	if gf_Judge_Room_Weight(10, 10," ") ~= 1 then
		return 0;
	end
	SetNpcLifeTime(npcIndex, 0);
	wb_SetBigBoxFlag();
	--LongDaiKa: ��ng ph�n th��ng m� r��ng m�c ��nh
	----����
	--gf_Modify("Exp", 10000000);
	--gf_AddItemEx2({2, 1, 30669, 40}, "M�nh M�t T�ch", "BOSS Th� Gi�i", "R��ng V�ng ��i Chi�n", 0, 1);
	--local tAward = {
	--	{1, 140, "L�ng Ba Vi B�", {0, 112, 78, 1}, 0},
	--	--{1, 0, "ʦ��������", {2, 1, 30665, 1}, 0},
	--	{1, 150, "M�t T�ch Ti�u Dao T�n Quy�n", {0, 112, 225, 1}, 0},
	--	{1, 409, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 3}, 0},
	--	{1, 70, "V�y K� L�n", 	 {2, 1, 31064, 1}, 0, 0, 0, 1},
	--	{1, 20, "��ng T� Chi Nguy�n",  {2, 1, 30913, 5}, 0},
	--	{1, 100, "��i Nh�n s�m", {2, 0, 553, 1}, 0},
	--	{1, 100, "Ti�u Nh�n s�m qu�", {2, 0, 552, 2}, 0},
	--	{1, 1, "C� Kim Th�ch", {2, 201, 14, 1}, 0},
	--	{1, 10, "M�t T�ch Ti�u Dao", {0, 112, 224, 1}, 0, 0, 0, 1},
	--}
	--gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "BOSS Th� Gi�i", "R��ng V�ng ��i Chi�n");
	--LongDaiKa: ��ng ph�n th��ng m� r��ng m�c ��nh

	WAward:WorldBoss_OpenBigBox(); --LongDaiKa: chuy�n ph�n th��ng v� 1 file
	
	--�
	vaf_get_prize_item_30709(10, 1);
	AddRuntimeStat(23, 3, 0, 1);
	--��������������Ƭ
	SendScript2VM("\\script\\function\\honor_tong\\ht_head.lua", "ht_GetTongChip(100, 5)")
	--�������
	SendScript2VM("\\script\\online_activites\\head\\activity_normal_head.lua", "vaf_award_api('tWorldBossJinBox')");
	--FireEvent("event_mission_box_award", "worldboss", "gold", 0)
	return 1;
end

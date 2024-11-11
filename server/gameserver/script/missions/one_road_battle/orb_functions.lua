Include("\\script\\missions\\dlgc\\dlgc_award.lua");
Include("\\script\\missions\\one_road_battle\\mission_head.lua")
Import("\\script\\missions\\one_road_battle\\orb_honor.lua")
Include("\\script\\vng\\book15\\book15_head.lua");

--�Ƴ��Ƿ���״̬
function ORB_RemoveNonlicetState()
	local tbNonlicet =
	{
		[1] = {9901,9906},
		[2] = {19801279,19801281},
	}
	for i=1,getn(tbNonlicet) do
		for j=tbNonlicet[i][1],tbNonlicet[i][2] do
			RemoveState(j);
		end;
	end;
end;

function win_battle(nCamp)
	local camp1TowerRest = 4 - GetMissionV(MV_CAMP1_TOWER_DESTORIED)
	local camp2TowerRest = 4 - GetMissionV(MV_CAMP2_TOWER_DESTORIED)
	if nCamp == CAMP_SONG then
		if camp1TowerRest == 4 and camp2TowerRest == 0 then
			this.msCamp:turnPlayer(CAMP_SONG, orb_honor_Rampage, nil);
			Orb_AddRuntimeStat(RUNTIMEID_GetTeamHonorCountByCamp, 1, 1)
		end
		if camp1TowerRest == 1 then
			this.msCamp:turnPlayer(CAMP_SONG, orb_honor_WinBack, nil);
			Orb_AddRuntimeStat(RUNTIMEID_GetTeamHonorCountByCamp, 1, 1)
		end
		if camp1TowerRest == 1 and camp2TowerRest <= 1 then
			this.msCamp:turnPlayer(CAMP_SONG, orb_honor_WhiteHot, nil);
			Orb_AddRuntimeStat(RUNTIMEID_GetTeamHonorCountByCamp, 1, 1)
		end
		this.msCamp:turnPlayer(CAMP_SONG, set_battle_result, WINTYPE_WIN);
		this.msCamp:turnPlayer(CAMP_LIAO, set_battle_result, WINTYPE_LOSE);
	elseif nCamp == CAMP_LIAO then
		if camp2TowerRest == 4 and camp1TowerRest == 0 then
			this.msCamp:turnPlayer(CAMP_LIAO, orb_honor_Rampage, nil);
			Orb_AddRuntimeStat(RUNTIMEID_GetTeamHonorCountByCamp, 2, 1)
		end
		if camp2TowerRest == 1 then
			this.msCamp:turnPlayer(CAMP_LIAO, orb_honor_WinBack, nil);
			Orb_AddRuntimeStat(RUNTIMEID_GetTeamHonorCountByCamp, 2, 1)
		end
		if camp2TowerRest == 1 and camp1TowerRest <= 1 then
			this.msCamp:turnPlayer(CAMP_LIAO, orb_honor_WhiteHot, nil);
			Orb_AddRuntimeStat(RUNTIMEID_GetTeamHonorCountByCamp, 2, 1)
		end
		this.msCamp:turnPlayer(CAMP_SONG, set_battle_result, WINTYPE_LOSE);
		this.msCamp:turnPlayer(CAMP_LIAO, set_battle_result, WINTYPE_WIN);
	else
		this.msCamp:turnPlayer(CAMP_SONG, set_battle_result, WINTYPE_DRAW);
		this.msCamp:turnPlayer(CAMP_LIAO, set_battle_result, WINTYPE_DRAW);
	end
	this:Msg2MSAll(format("%s nh�n ���c chi�n th�ng cu�i c�ng", CAMPIDX2NAME[nCamp]));
	local nChariotIdx = GetMissionV(MV_CHARIOT_IDX);
	SetNpcTarget(nChariotIdx, 0);
	SetCampToNpc(nChariotIdx, CampNeutral);
	SetCurrentNpcSFX(nChariotIdx, 1009, 1, 1);
	
	local tPhase = this.msPhases[1]:getCurPhase();
	tPhase:onFinish();
end

function set_battle_result(nWinType)
	local nLv = GetLevel();
	local nActivity = min(GetTask(TASKID_ORB_ACTIVITY), ACTIVITY_MAX);
	if nWinType == WINTYPE_WIN then
		SendScript2Client([[Add3EElf(450,350,"\\image\\EFFECT\\sfx\\����\\ʤ��_Խ��.3e",1000*4,5)]])
	else
		SendScript2Client([[Add3EElf(450,350,"\\image\\EFFECT\\sfx\\����\\ʧ��ӡ��_Խ��.3e",1000*4,1)]])
	end

	gf_SetTaskByte(TASKID_ORB_LAST_RESULT, 1, GetTask(TASKID_ORB_CAMP));
	gf_SetTaskByte(TASKID_ORB_LAST_RESULT, 2, nWinType + 1);
	gf_SetTaskByte(TASKID_ORB_LAST_RESULT, 3, nActivity >= ACTIVITY_NEED and 1 or 2);

	local nVersion, nCurGs = GetRealmType();
	if nCurGs == 1 and nWinType == WINTYPE_WIN then
		--�ڿ����
		SendScript2VM("\\script\\misc\\fair\\fair.lua", format("ggs_do_fair_task([[%s]])", "one_road_battle"));
	end

	SetFightState(0);
end


function on_preparing_trap()
	SetFightState(0);
	local nMapId, x, y = this.msPosition:getEntryPos(GetTask(TASKID_ORB_CAMP));
	SetPos(x, y);
	Msg2Player("Hi�n t�i c�n trong giai �o�n chu�n b�, chi�n tr��ng s�p m�.");
end

function on_tower_death(...)
	local tPhase = this.msPhases[1]:getCurPhase();
	if tPhase.on_tower_death then
		tPhase.on_tower_death(gf_UnPack(arg));
	end
end

function on_flag_death(...)
	local tPhase = this.msPhases[1]:getCurPhase();
	if tPhase.on_flag_death then
		tPhase.on_flag_death(gf_UnPack(arg));
	end
end

function on_chariot_death(...)
	local tPhase = this.msPhases[1]:getCurPhase();
	if tPhase.on_chariot_death then
		tPhase.on_chariot_death(gf_UnPack(arg));
	end
end

function add_point(nCamp, nPoint)
	if nCamp == CAMP_SONG then
		SetMissionV(MV_POINT_SONG, GetMissionV(MV_POINT_SONG) + nPoint);
		update_break_point_ui();
	elseif nCamp == CAMP_LIAO then
		SetMissionV(MV_POINT_LIAO, GetMissionV(MV_POINT_LIAO) + nPoint);
		update_break_point_ui();
	end
end

function update_break_point_ui()
	this.msCamp:turnPlayer(0, StopTimeGuage, 6);
	this.msCamp:turnPlayer(0, StartTimeGuage, format("�i�m T�ng %d", GetMissionV(MV_POINT_SONG)), 45 * 60, 0, 6);
	this.msCamp:turnPlayer(0, StopTimeGuage, 7);
	this.msCamp:turnPlayer(0, StartTimeGuage, format("�i�m Li�u %d", GetMissionV(MV_POINT_LIAO)), 45 * 60, 0, 7);
end

function add_activity(nPoint)
	local curPoint = GetTask(TASKID_ORB_ACTIVITY)
	local add = nPoint
	if curPoint + nPoint >= ACTIVITY_MAX then
		add = ACTIVITY_MAX - curPoint
	end
	gf_ModifyTask(TASKID_ORB_ACTIVITY, add);
	-- Msg2Player(format("�������%d����·���ս����Ծ��!", nPoint))
end

function get_pioneer_tower(nCamp)
	local nSchedule = get_time_schedule();
	for i = 1, 4 do
		local nTowerIdx = GetMissionV(MV_TOWER_IDX_1 + i - 1 + (nCamp - 1) * 4);
		if nTowerIdx > 0 and (IsNpcDeath(nTowerIdx) ~= 1 or nSchedule == i) then
			return nTowerIdx;
		end
	end
	return 0;
end

function create_chariot()
	local nMap = this.msPosition:getMapID();
	local nChariotIdx = CreateNpc(CHARIOT_NPC[1], CHARIOT_NPC[2], nMap, CHARIOT_NPC[3], CHARIOT_NPC[4]);
	SetCampToNpc(nChariotIdx, CAMPIDX2STR[CHARIOT_NPC[5]]);
	CastState2Npc(nChariotIdx, "state_specified_skill_effect", 2, 18*60*60, 1, 10086);
	SetCurrentNpcSFX(nChariotIdx, 1009, 1, 1);
	SetNpcScript(nChariotIdx, CHARIOT_NPC[6]);
	g_NpcAI:setAI(nChariotIdx, AT_SM_ATTACK_TARGET, 1);
	SetMissionV(MV_CHARIOT_IDX, nChariotIdx);
	set_chariot_camp(CAMP_NEUTRAL);
	--�����⻷
	NpcCommand(nChariotIdx, 3, CHARIOT_NPC[3] * 32, CHARIOT_NPC[4] * 32, 68176);
end

function add_weekness_buff(nSchedule)
	CastState(WEEKNESS_BUFF[1], WEEKNESS_BUFF[3][nSchedule][1], 5 * 60 * 18, 1, 9908);
	CastState(WEEKNESS_BUFF[2], WEEKNESS_BUFF[3][nSchedule][2], 5 * 60 * 18, 1, 9909);
	SyncCustomState(1,9908,1,WEEKNESS_BUFF[4][nSchedule]);
end

--��ȡ��ǰʱ�����
function get_time_schedule()
	local nLocalTime = GetMissionV(phaseOne_Road_Battle_fighting.second);
	local nTime = GetMissionV(MV_TIMER_SECOND) - phaseOne_Road_Battle_idle.maxsecond - phaseOne_Road_Battle_waiting.maxsecond;
	if abs(nLocalTime - nTime) > 10 then
		WriteLog(format("[Thu th�p tin t�c Chi�n Xa chi�n tr��ng][total second:%d][fighting second:%d]", GetMissionV(MV_TIMER_SECOND), nLocalTime));
	end
	return ceil(max(nTime, nLocalTime) / TIME_SCHEDULE);
end

function orb_GetTimeIdentity()
    return tonumber(date("%y%m%d%H"))
end

function set_chariot_camp(nCamp)
	local nChariotIdx = GetMissionV(MV_CHARIOT_IDX);
	if nChariotIdx <= 0 then return end
	
	local nMap = GetNpcWorldPos(nChariotIdx);
	if nCamp == CAMP_SONG then
		local nTowerIdx = get_pioneer_tower(CAMP_LIAO);
		SetNpcTarget(nChariotIdx, nTowerIdx);
		SetCampToNpc(nChariotIdx, CampSong);
		SetCurrentNpcSFX(nChariotIdx, 1010, 1, 1);
		SetNpcAIControlRate(nChariotIdx, 1, 100);
		SetNpcAIControlRate(nChariotIdx, 2, 0);
		if IsNpcDeath(nTowerIdx) == 1 then
			update_chariot_state_ui(CHARIOT_STATE_MSG.CLEANING_LIAO, GetNpcName(nTowerIdx));
		else
			update_chariot_state_ui(CHARIOT_STATE_MSG.ATTACKING_LIAO, GetNpcName(nTowerIdx));
		end
		
		
		WriteLog(format("[Thi�t l�p m�c ti�u Chi�n Xa][T�n c�ng Li�u Qu�c][MAP:%d][M�c ti�u:%s][ID m�c ti�u:%d][Ti�n ��:%d]", 
			nMap, GetNpcName(nTowerIdx), GetNpcID(nTowerIdx), get_time_schedule()));
		write_all_tower_log();
	elseif nCamp == CAMP_LIAO then
		local nTowerIdx = get_pioneer_tower(CAMP_SONG);
		SetNpcTarget(nChariotIdx, nTowerIdx);
		SetCampToNpc(nChariotIdx, CampLiao);
		SetCurrentNpcSFX(nChariotIdx, 1011, 1, 1);
		SetNpcAIControlRate(nChariotIdx, 1, 0);
		SetNpcAIControlRate(nChariotIdx, 2, 100);
		if IsNpcDeath(nTowerIdx) == 1 then
			update_chariot_state_ui(CHARIOT_STATE_MSG.CLEANING_SONG, GetNpcName(nTowerIdx));
		else
			update_chariot_state_ui(CHARIOT_STATE_MSG.ATTACKING_SONG, GetNpcName(nTowerIdx));
		end
		WriteLog(format("[Thi�t l�p m�c ti�u Chi�n Xa][T�n c�ng T�ng Qu�c][MAP:%d][M�c ti�u:%s][ID m�c ti�u:%d][Ti�n ��:%d]", 
			nMap, GetNpcName(nTowerIdx), GetNpcID(nTowerIdx), get_time_schedule()));
		write_all_tower_log();
	else
		SetNpcTarget(nChariotIdx, 0);
		SetCampToNpc(nChariotIdx, CampNeutral);
		SetCurrentNpcSFX(nChariotIdx, 1009, 1, 1);
		update_chariot_state_ui(CHARIOT_STATE_MSG.IDLE);
		WriteLog(format("[Thi�t l�p m�c ti�u Chi�n Xa][Trung l�p][MAP:%d]", nMap));
		write_all_tower_log();
	end
end

function update_chariot_state_ui(szFormat, szNpcName)
	local szMsg = format(szFormat, szNpcName);
	local nTime = phaseOne_Road_Battle_fighting.maxsecond;
	if szFormat == CHARIOT_STATE_MSG.CLEANING_LIAO or szFormat == CHARIOT_STATE_MSG.CLEANING_SONG then
		local nCurTime = GetMissionV(MV_TIMER_SECOND) - phaseOne_Road_Battle_idle.maxsecond - phaseOne_Road_Battle_waiting.maxsecond;
		nTime = mod(nCurTime, TIME_SCHEDULE);
	elseif szFormat == CHARIOT_STATE_MSG.OCCUPIED then
		nTime = CHARIOT_REVIVE_TIME;
	end
	this.msCamp:turnPlayer(0, StopTimeGuage, 5);
	this.msCamp:turnPlayer(0, StartTimeGuage, szMsg, nTime, 0, 5);
end

function add_max_meridian_to_npc(nNpcIdx)
	CastState2Npc(nTowerGuardIdx, "state_immune",     999, 18*60*60, 0, 10087);
	CastState2Npc(nTowerGuardIdx, "state_penetration",999, 18*60*60, 0, 10088);
end

function write_all_tower_log()
	for i = 1, 8 do
		local nTowerIdx = GetMissionV(MV_TOWER_IDX_1 + i - 1);
		WriteLog(format("[Chi�n Xa][Ti�n th�pTin t�c][Index:%d][Name:%s][ID:%d][IsDeath:%d]",
			i, GetNpcName(nTowerIdx), GetNpcID(nTowerIdx), IsNpcDeath(nTowerIdx)));
	end
end

function orb_getCampName()
	local nCamp = GetTask(TASKID_ORB_CAMP)
	if nCamp < 1 or nCamp > 3 then
		nCamp = CAMP_NEUTRAL
	end
	return CAMPIDX2NAME_SHORT[nCamp]
end


function orb_award_talk()
	-- test code
	-- gf_SetTaskByte(TASKID_ORB_LAST_RESULT, 3, 1)
	-- gf_SetTaskByte(TASKID_ORB_LAST_RESULT, 2, 2)
	-- gf_SetTaskBit(ORB_TSKID_HONOR, 1, 1)
	-- gf_SetTaskBit(ORB_TSKID_HONOR, 2, 1)
	-- gf_SetTaskBit(ORB_TSKID_HONOR, 3, 1)
	-- gf_SetTaskBit(ORB_TSKID_HONOR, 9, 1)
	-- gf_SetTaskBit(ORB_TSKID_HONOR, 11, 1)
	-- test code
	local hasPersonalHonor = 0
	for k,v in orb_honor_list do
		if orb_honor_GetHonor(k) == 1 then
			if v[3] == 1 then 	-- ���˳ɾ�
				hasPersonalHonor = max(hasPersonalHonor, v[4])
			end
		end
	end
	if GetTask(TASKID_ORB_LAST_RESULT) == 0 and hasPersonalHonor == 0 then
		Talk(1,"","V�n ch�a tham gia chi�n tr��ng Hi�p L� T��ng Ph�ng, ho�c �� nh�n th��ng.")
		SetTask(ORB_TSKID_HONOR, 0)
		return
	end
	

	local tbSay = {}
	tinsert(tbSay, "Nh�n th��ng th�ng thua/orb_get_battle_award")
	tinsert(tbSay, format("Nh�n th��ng bi�u hi�n chi�n tr��ng (C� nh�n)/#orb_get_personal_award(%d)",hasPersonalHonor))
	tinsert(tbSay, "H�y b�/nothing")
	Say("",getn(tbSay),tbSay)
end

function orb_get_personal_award(nHonorLv)
	if nHonorLv <= 0 then
		Talk(1,"","Kh�ng c� �i�m c�ng lao c� nh�n �� nh�n.")
		return
	end
	Talk(1,"",format("C�ng lao c� nh�n cao nh�t nh�n ���c l� c�p %d, nh�n th��ng c�p %d.",nHonorLv,nHonorLv))
	local tItemCfg = {
		"xialuxiangfeng_1",
		"xialuxiangfeng_2"
	}
	local szAward = tItemCfg[nHonorLv]
	if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
		return 0
	end
	orb_honor_ClearPersonalHonor()
	CustomAwardGiveGroup(szAward, 0)
end

function orb_get_battle_award()
	if GetTask(TASKID_ORB_LAST_RESULT) == 0 then
		Talk(1,"","V�n ch�a tham gia chi�n tr��ng Hi�p L� T��ng Ph�ng, ho�c �� nh�n th��ng.")
		return
	end
	if gf_GetTaskByte(TASKID_ORB_LAST_RESULT, 3) ~= 1 then
		Talk(1,"","�� t�ch c�c tr�n tr��c c�a chi�n tr��ng Hi�p L� T��ng Ph�ng kh�ng ��, kh�ng th� nh�n th��ng..")
		SetTask(TASKID_ORB_LAST_RESULT, 0)
		return
	end
	local nWinType = gf_GetTaskByte(TASKID_ORB_LAST_RESULT, 2) - 1;
	local szTitle = "";
	if 		nWinType == WINTYPE_LOSE then 	szTitle = "Th�ng b�i l� chuy�n th��ng t�nh, ��ng n�n l�ng, h�y ch�n th��ng mu�n nh�n." 
	elseif 	nWinType == WINTYPE_DRAW then 	szTitle = "Sau chi�n ��u k�ch li�t v�n b�t ph�n th�ng b�i, thi�u hi�p h�y ch�n th��ng mu�n nh�n." 
	else 	szTitle = "Thi�u hi�p �� th�ng chi�n tr��ng T�y Th�c ��o l�n n�y, h�y ch�n qu� mu�n nh�n."
	end

	local szSingleHonor = ""
	local szTeamHonor = ""
	local tBaseJunGong = T_AWARD_BASE_JUNGONG;
	local nBaseJunGong = tBaseJunGong[gf_GetTaskByte(TASKID_ORB_LAST_RESULT, 2)];
	local tBaseExp = T_AWARD_BASE_EXP;
	local nBaseExp = tBaseExp[gf_GetTaskByte(TASKID_ORB_LAST_RESULT, 2)];

	for k,v in orb_honor_list do
		if orb_honor_GetHonor(k) == 1 then
			if v[3] == 1 then 	-- ���˳ɾ�
				szSingleHonor = format("%s%s ",szSingleHonor, v[2])
			else				-- �Ŷӳɾ�
				szTeamHonor = format("%s%s ",szTeamHonor, v[2])
			end
		end
	end
	if szSingleHonor ~= "" then
		szTitle = format("%s\nTr�n n�y thi�u hi�p �� r�t xu�t s�c, nh�n ���c: <color=gold>%s<color> c�ng lao, do �� d� th�ng hay thua ��u ���c nh�n c�ng tr�ng nh� phe th�ng.",szTitle, szSingleHonor)
		nBaseExp = floor(nBaseExp * ACTIVE_RATE_EXP)
	end
	if szTeamHonor ~= "" then
		szTitle = format("%s m�i ng��i c�ng �o�n k�t ��t c�ng lao t�p th� <color=gold>%s<color>, th��ng c�ng tr�ng l�n n�y t�ng %s",szTitle, szTeamHonor,"<color=yellow>20%<color>")
		nBaseJunGong = floor(nBaseJunGong * ACTIVE_RATE_JUNGONG)
	end
	--local activityPoint = GetTask(TASKID_ORB_ACTIVITY)
	-- szTitle = format(
	-- 	"%s.��·���ս���ɻ�þ���:%d * %d = %d(15000*��Ծ��)",
	-- 	szTitle,
	-- 	ACTIVITY_2_EXP,
	-- 	activityPoint,
	-- 	activityPoint * ACTIVITY_2_EXP
	-- )
	szTitle = format(
		"%s. �i�m Chi�n Tr��ng Hi�p L� T��ng Ph�ng: %d",
		szTitle,
		nBaseExp
	)

	szTitle = format(
		"%s.C�ng tr�ng c� th� nh�n c�a chi�n tr��ng Hi�p L� T��ng Ph�ng: <color=green>%d<color>, c� th� d�ng qu�n c�ng ch��ng �� x2 c�ng tr�ng. D�ng qu�n c�ng ch��ng nh�n <color=gold>x2<color>, d�ng huy hi�u chi�n c�ng (��i) nh�n <color=gold>x5<color>, d�ng huy hi�u chi�n c�ng (huy ho�ng) nh�n <color=gold>x10<color>, d�ng qu�n c�ng ch��ng vinh d� <color=gold>x14<color>\n",
		szTitle,
		nBaseJunGong
	)
	local tbSay = {}
	--tinsert(tbSay, format("Nh�n th��ng/#orb_get_battle_award_confirm(%d,%d,0)",nBaseJunGong,nBaseExp))
	--tinsert(tbSay, format("S� d�ng Qu�n c�ng ch��ng nh�n/#orb_get_battle_award_confirm(%d,%d,1)",nBaseJunGong,nBaseExp))
	--tinsert(tbSay, format("S� d�ng huy hi�u chi�n c�ng (��i) nh�n/#orb_get_battle_award_confirm(%d,%d,2)",nBaseJunGong,nBaseExp))
	--tinsert(tbSay, format("S� d�ng huy hi�u chi�n c�ng (huy ho�ng) nh�n/#orb_get_battle_award_confirm(%d,%d,3)",nBaseJunGong,nBaseExp))
	tinsert(tbSay, format("S� d�ng qu�n c�ng ch��ng vinh d� nh�n/#orb_get_battle_award_confirm(%d,%d,4)",nBaseJunGong,nBaseExp))
	tinsert(tbSay, "H�y b�/nothing")
	Say(szTitle,getn(tbSay),tbSay)
end

function orb_get_battle_award_confirm(nBaseJunGong, nBaseExp, nLevel)
	local tAward = {
		{2,1,9999,1,2},
		{2,1,9998,1,5},
		{2,1,9977,1,10},
		{2,1,30642,1,14},
	}
	if nLevel == 0 then
		gf_Modify("JunGong", nBaseJunGong)
	else
		if DelItem(tAward[nLevel][1],tAward[nLevel][2],tAward[nLevel][3],tAward[nLevel][4]) == 1 then
			gf_Modify("JunGong", nBaseJunGong * tAward[nLevel][5])
			FireEvent("event_ib_cost", tAward[nLevel][1],tAward[nLevel][2],tAward[nLevel][3],tAward[nLevel][4]);
		else
			Talk(1,"","��o c� mang theo tr�n ng��i kh�ng ��")
			return
		end
	end
	local nWinType = gf_GetTaskByte(TASKID_ORB_LAST_RESULT, 2) - 1;
	FireEvent("event_mission_award", "hieplo", nLevel, nWinType, 0)
	orb_honor_ClearTeamHonor()
	SetTask(TASKID_ORB_LAST_RESULT, 0)
	--gf_Modify("Exp",GetTask(TASKID_ORB_ACTIVITY) * ACTIVITY_2_EXP)
	gf_Modify("Exp", nBaseExp)
	SetTask(TASKID_ORB_ACTIVITY, 0)	
	--============nhi�m v� Book15
	book15_DailyMissionComplete(11)
end

function orb_test_nextStep()
	local tPhase = this.msPhases[1]:getCurPhase();
	tPhase:onFinish();
end

function orb_test1()
	add_point(1,500)
end
function orb_test2()
	add_point(1,500)
end
Include("\\script\\missions\\dlgc\\dlgc_award.lua");
Include("\\script\\missions\\one_road_battle\\mission_head.lua")
Import("\\script\\missions\\one_road_battle\\orb_honor.lua")
Include("\\script\\vng\\book15\\book15_head.lua");

--移除非法的状态
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
	this:Msg2MSAll(format("%s nh薾 頲 chi課 th緉g cu鑙 c飊g", CAMPIDX2NAME[nCamp]));
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
		SendScript2Client([[Add3EElf(450,350,"\\image\\EFFECT\\sfx\\其他\\胜利_越南.3e",1000*4,5)]])
	else
		SendScript2Client([[Add3EElf(450,350,"\\image\\EFFECT\\sfx\\其他\\失败印章_越南.3e",1000*4,1)]])
	end

	gf_SetTaskByte(TASKID_ORB_LAST_RESULT, 1, GetTask(TASKID_ORB_CAMP));
	gf_SetTaskByte(TASKID_ORB_LAST_RESULT, 2, nWinType + 1);
	gf_SetTaskByte(TASKID_ORB_LAST_RESULT, 3, nActivity >= ACTIVITY_NEED and 1 or 2);

	local nVersion, nCurGs = GetRealmType();
	if nCurGs == 1 and nWinType == WINTYPE_WIN then
		--在跨服区
		SendScript2VM("\\script\\misc\\fair\\fair.lua", format("ggs_do_fair_task([[%s]])", "one_road_battle"));
	end

	SetFightState(0);
end


function on_preparing_trap()
	SetFightState(0);
	local nMapId, x, y = this.msPosition:getEntryPos(GetTask(TASKID_ORB_CAMP));
	SetPos(x, y);
	Msg2Player("Hi謓 t筰 c遪 trong giai 畂筺 chu萵 b�, chi課 trng s緋 m�.");
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
	this.msCamp:turnPlayer(0, StartTimeGuage, format("觤 T鑞g %d", GetMissionV(MV_POINT_SONG)), 45 * 60, 0, 6);
	this.msCamp:turnPlayer(0, StopTimeGuage, 7);
	this.msCamp:turnPlayer(0, StartTimeGuage, format("觤 Li猽 %d", GetMissionV(MV_POINT_LIAO)), 45 * 60, 0, 7);
end

function add_activity(nPoint)
	local curPoint = GetTask(TASKID_ORB_ACTIVITY)
	local add = nPoint
	if curPoint + nPoint >= ACTIVITY_MAX then
		add = ACTIVITY_MAX - curPoint
	end
	gf_ModifyTask(TASKID_ORB_ACTIVITY, add);
	-- Msg2Player(format("您获得了%d点狭路相逢战场活跃度!", nPoint))
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
	--开启光环
	NpcCommand(nChariotIdx, 3, CHARIOT_NPC[3] * 32, CHARIOT_NPC[4] * 32, 68176);
end

function add_weekness_buff(nSchedule)
	CastState(WEEKNESS_BUFF[1], WEEKNESS_BUFF[3][nSchedule][1], 5 * 60 * 18, 1, 9908);
	CastState(WEEKNESS_BUFF[2], WEEKNESS_BUFF[3][nSchedule][2], 5 * 60 * 18, 1, 9909);
	SyncCustomState(1,9908,1,WEEKNESS_BUFF[4][nSchedule]);
end

--获取当前时间进度
function get_time_schedule()
	local nLocalTime = GetMissionV(phaseOne_Road_Battle_fighting.second);
	local nTime = GetMissionV(MV_TIMER_SECOND) - phaseOne_Road_Battle_idle.maxsecond - phaseOne_Road_Battle_waiting.maxsecond;
	if abs(nLocalTime - nTime) > 10 then
		WriteLog(format("[Thu th藀 tin t鴆 Chi課 Xa chi課 trng][total second:%d][fighting second:%d]", GetMissionV(MV_TIMER_SECOND), nLocalTime));
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
		
		
		WriteLog(format("[Thi誸 l藀 m鬰 ti猽 Chi課 Xa][T蕁 c玭g Li猽 Qu鑓][MAP:%d][M鬰 ti猽:%s][ID m鬰 ti猽:%d][Ti課 :%d]", 
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
		WriteLog(format("[Thi誸 l藀 m鬰 ti猽 Chi課 Xa][T蕁 c玭g T鑞g Qu鑓][MAP:%d][M鬰 ti猽:%s][ID m鬰 ti猽:%d][Ti課 :%d]", 
			nMap, GetNpcName(nTowerIdx), GetNpcID(nTowerIdx), get_time_schedule()));
		write_all_tower_log();
	else
		SetNpcTarget(nChariotIdx, 0);
		SetCampToNpc(nChariotIdx, CampNeutral);
		SetCurrentNpcSFX(nChariotIdx, 1009, 1, 1);
		update_chariot_state_ui(CHARIOT_STATE_MSG.IDLE);
		WriteLog(format("[Thi誸 l藀 m鬰 ti猽 Chi課 Xa][Trung l藀][MAP:%d]", nMap));
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
		WriteLog(format("[Chi課 Xa][Ti詎 th竝Tin t鴆][Index:%d][Name:%s][ID:%d][IsDeath:%d]",
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
			if v[3] == 1 then 	-- 个人成就
				hasPersonalHonor = max(hasPersonalHonor, v[4])
			end
		end
	end
	if GetTask(TASKID_ORB_LAST_RESULT) == 0 and hasPersonalHonor == 0 then
		Talk(1,"","V蒼 ch璦 tham gia chi課 trng Hi謕 L� Tng Ph飊g, ho芻  nh薾 thng.")
		SetTask(ORB_TSKID_HONOR, 0)
		return
	end
	

	local tbSay = {}
	tinsert(tbSay, "Nh薾 thng th緉g thua/orb_get_battle_award")
	tinsert(tbSay, format("Nh薾 thng bi觰 hi謓 chi課 trng (C� nh﹏)/#orb_get_personal_award(%d)",hasPersonalHonor))
	tinsert(tbSay, "H駓 b�/nothing")
	Say("",getn(tbSay),tbSay)
end

function orb_get_personal_award(nHonorLv)
	if nHonorLv <= 0 then
		Talk(1,"","Kh玭g c� 甶觤 c玭g lao c� nh﹏  nh薾.")
		return
	end
	Talk(1,"",format("C玭g lao c� nh﹏ cao nh蕋 nh薾 頲 l� c蕄 %d, nh薾 thng c蕄 %d.",nHonorLv,nHonorLv))
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
		Talk(1,"","V蒼 ch璦 tham gia chi課 trng Hi謕 L� Tng Ph飊g, ho芻  nh薾 thng.")
		return
	end
	if gf_GetTaskByte(TASKID_ORB_LAST_RESULT, 3) ~= 1 then
		Talk(1,"","ч t輈h c鵦 tr薾 trc c馻 chi課 trng Hi謕 L� Tng Ph飊g kh玭g , kh玭g th� nh薾 thng..")
		SetTask(TASKID_ORB_LAST_RESULT, 0)
		return
	end
	local nWinType = gf_GetTaskByte(TASKID_ORB_LAST_RESULT, 2) - 1;
	local szTitle = "";
	if 		nWinType == WINTYPE_LOSE then 	szTitle = "Th緉g b筰 l� chuy謓 thng t譶h, ng n秐 l遪g, h穣 ch鋘 thng mu鑞 nh薾." 
	elseif 	nWinType == WINTYPE_DRAW then 	szTitle = "Sau chi課 u k輈h li謙 v蒼 b蕋 ph﹏ th緉g b筰, thi誹 hi謕 h穣 ch鋘 thng mu鑞 nh薾." 
	else 	szTitle = "Thi誹 hi謕  th緉g chi課 trng T﹜ Th鬰 Чo l莕 n祔, h穣 ch鋘 qu� mu鑞 nh薾."
	end

	local szSingleHonor = ""
	local szTeamHonor = ""
	local tBaseJunGong = T_AWARD_BASE_JUNGONG;
	local nBaseJunGong = tBaseJunGong[gf_GetTaskByte(TASKID_ORB_LAST_RESULT, 2)];
	local tBaseExp = T_AWARD_BASE_EXP;
	local nBaseExp = tBaseExp[gf_GetTaskByte(TASKID_ORB_LAST_RESULT, 2)];

	for k,v in orb_honor_list do
		if orb_honor_GetHonor(k) == 1 then
			if v[3] == 1 then 	-- 个人成就
				szSingleHonor = format("%s%s ",szSingleHonor, v[2])
			else				-- 团队成就
				szTeamHonor = format("%s%s ",szTeamHonor, v[2])
			end
		end
	end
	if szSingleHonor ~= "" then
		szTitle = format("%s\nTr薾 n祔 thi誹 hi謕  r蕋 xu蕋 s綾, nh薾 頲: <color=gold>%s<color> c玭g lao, do  d� th緉g hay thua u 頲 nh薾 c玭g tr筺g nh� phe th緉g.",szTitle, szSingleHonor)
		nBaseExp = floor(nBaseExp * ACTIVE_RATE_EXP)
	end
	if szTeamHonor ~= "" then
		szTitle = format("%s m鋓 ngi c飊g 畂祅 k誸 t c玭g lao t藀 th� <color=gold>%s<color>, thng c玭g tr筺g l莕 n祔 t╪g %s",szTitle, szTeamHonor,"<color=yellow>20%<color>")
		nBaseJunGong = floor(nBaseJunGong * ACTIVE_RATE_JUNGONG)
	end
	--local activityPoint = GetTask(TASKID_ORB_ACTIVITY)
	-- szTitle = format(
	-- 	"%s.狭路相逢战场可获得经验:%d * %d = %d(15000*活跃度)",
	-- 	szTitle,
	-- 	ACTIVITY_2_EXP,
	-- 	activityPoint,
	-- 	activityPoint * ACTIVITY_2_EXP
	-- )
	szTitle = format(
		"%s. 觤 Chi課 Trng Hi謕 L� Tng Ph飊g: %d",
		szTitle,
		nBaseExp
	)

	szTitle = format(
		"%s.C玭g tr筺g c� th� nh薾 c馻 chi課 trng Hi謕 L� Tng Ph飊g: <color=green>%d<color>, c� th� d飊g qu﹏ c玭g chng  x2 c玭g tr筺g. D飊g qu﹏ c玭g chng nh薾 <color=gold>x2<color>, d飊g huy hi謚 chi課 c玭g (i) nh薾 <color=gold>x5<color>, d飊g huy hi謚 chi課 c玭g (huy ho祅g) nh薾 <color=gold>x10<color>, d飊g qu﹏ c玭g chng vinh d� <color=gold>x14<color>\n",
		szTitle,
		nBaseJunGong
	)
	local tbSay = {}
	--tinsert(tbSay, format("Nh薾 thng/#orb_get_battle_award_confirm(%d,%d,0)",nBaseJunGong,nBaseExp))
	--tinsert(tbSay, format("S� d鬾g Qu﹏ c玭g chng nh薾/#orb_get_battle_award_confirm(%d,%d,1)",nBaseJunGong,nBaseExp))
	--tinsert(tbSay, format("S� d鬾g huy hi謚 chi課 c玭g (i) nh薾/#orb_get_battle_award_confirm(%d,%d,2)",nBaseJunGong,nBaseExp))
	--tinsert(tbSay, format("S� d鬾g huy hi謚 chi課 c玭g (huy ho祅g) nh薾/#orb_get_battle_award_confirm(%d,%d,3)",nBaseJunGong,nBaseExp))
	tinsert(tbSay, format("S� d鬾g qu﹏ c玭g chng vinh d� nh薾/#orb_get_battle_award_confirm(%d,%d,4)",nBaseJunGong,nBaseExp))
	tinsert(tbSay, "H駓 b�/nothing")
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
			Talk(1,"","Чo c� mang theo tr猲 ngi kh玭g ")
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
	--============nhi謒 v� Book15
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
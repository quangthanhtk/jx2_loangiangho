Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Import("\\script\\lib\\npccmdhead.lua")
Include("\\script\\lib\\floyd.lua");
Include("\\settings\\static_script\\missions\\base\\callfuture.lua");
Include("\\script\\lib\\topscorelib.lua")
Include("\\script\\missions\\one_road_battle\\mission_head.lua")
Include("\\script\\missions\\one_road_battle\\orb_functions.lua");
Import("\\script\\missions\\one_road_battle\\orb_honor.lua")

MAX_DAILY_TIMES = 6
MAX_POWER_LEVEL = 50
--======================================================================================
-- ×¼±¸½×¶Î
phaseOne_Road_Battle_idle = {
	maxsecond = 1,
}
phaseOne_Road_Battle_idle = inherit(cycPhase, phaseOne_Road_Battle_idle)
phaseOne_Road_Battle_idle.onTimeout = phaseOne_Road_Battle_idle.onFinish;

phaseOne_Road_Battle_waiting = {
	maxsecond = 60*2,
	guage = {
		msg = "Giai ®o¹n chê",
		time = 60*2,
		cyc = 0,
		id = 1,
	},
}

phaseOne_Road_Battle_waiting = inherit(cycPhase, phaseOne_Road_Battle_waiting)
phaseOne_Road_Battle_waiting.onTimeout = phaseOne_Road_Battle_waiting.onFinish;

function phaseOne_Road_Battle_waiting.Init()
	SetMissionV(MV_STAGE, PHASE_PREPARING);
	
	local nMap = this.msPosition:getMapID();
	
	--Ë¢¸÷ÖÖnpc
	for i = 1, getn(PREPARE_NPC) do
		local tNpc = PREPARE_NPC[i];
		local nAttackIdx = CreateNpc(tNpc[1], tNpc[2], nMap, tNpc[3], tNpc[4]);
		SetCampToNpc(nAttackIdx, CAMPIDX2STR[tNpc[5]]);
		if tNpc[6] and type(tNpc[6]) == "string" then
			SetNpcScript(nAttackIdx, tNpc[6]);
		end
		if tNpc[2] == "Thñ Thµnh T­íng" or tNpc[2] == "Thñ Thµnh VÖ" then
			add_max_meridian_to_npc(nAttackIdx);
		elseif tNpc[2] == "Thµnh Phßng Xa" then
			add_max_meridian_to_npc(nAttackIdx);
			CastState2Npc(nTowerGuardIdx, "state_dispear",100, 18*60*60, 0, 10086);
		end
	end
	--Ë¢¼ýËþ
	for i = 1, getn(TOWER_NPC) do
		local tNpc = TOWER_NPC[i];
		local nTowerIdx = CreateNpc(tNpc[1], tNpc[2], nMap, tNpc[3], tNpc[4]);
		SetCampToNpc(nTowerIdx, CAMPIDX2STR[tNpc[5]]);
		CastState2Npc(nTowerIdx, "state_specified_skill_effect",1, 18*60*60, 1, 10086);
		add_max_meridian_to_npc(nTowerIdx);
		SetNpcScript(nTowerIdx, [[\script\missions\one_road_battle\npc\tower.lua]]);
		SetNpcLifeTime(nTowerIdx, 60 * 60);
		SetMissionV(tNpc[6], nTowerIdx);
		if TOWER_GUARD_NPC[i] then
			g_tMissionParam[nMap][tNpc[2] .. tNpc[5]] = {};
			for j = 1, getn(TOWER_GUARD_NPC[i]) do
				local tGuard = TOWER_GUARD_NPC[i][j];
				local nTowerGuardIdx = CreateNpc(tGuard[1], tGuard[2],
					nMap, tGuard[3], tGuard[4]);
				SetCampToNpc(nTowerGuardIdx, CAMPIDX2STR[tNpc[5]]);
				CastState2Npc(nTowerGuardIdx, "state_dispear",100, 18*60*60, 0, 10086);
				add_max_meridian_to_npc(nTowerGuardIdx);
				SetNpcLifeTime(nTowerGuardIdx, 60 * 60);
				tinsert(g_tMissionParam[nMap][tNpc[2] .. tNpc[5]], nTowerGuardIdx);
			end
		end
	end
	
	
	--Ë¢·ÀÖ¹¶ÂÃÅµÄTrapµã
	local tTraps = {
		{nMap, {1768,3544}, {1791,3567}, [[\script\missions\one_road_battle\trap\song_gate.lua]]},
		{nMap, {1765,3551}, {1786,3571}, [[\script\missions\one_road_battle\trap\song_gate.lua]]},
		{nMap, {2298,2947}, {2322,2976}, [[\script\missions\one_road_battle\trap\liao_gate.lua]]},
		{nMap, {2303,2946}, {2323,2972}, [[\script\missions\one_road_battle\trap\liao_gate.lua]]},
		{nMap, {1756,3559}, {1765,3589}, [[\script\missions\one_road_battle\trap\song_gate.lua]]},
		{nMap, {1753,3564}, {1777,3577}, [[\script\missions\one_road_battle\trap\song_gate.lua]]},
		{nMap, {1717,3614}, {1738,3649}, [[\script\missions\one_road_battle\trap\song_gate.lua]]},
		{nMap, {1690,3606}, {1745,3642}, [[\script\missions\one_road_battle\trap\song_gate.lua]]},
		{nMap, {2308,2943}, {2336,2955}, [[\script\missions\one_road_battle\trap\liao_gate.lua]]},
		{nMap, {2312,2938}, {2325,2964}, [[\script\missions\one_road_battle\trap\liao_gate.lua]]},
		{nMap, {2349,2910}, {2377,2926}, [[\script\missions\one_road_battle\trap\liao_gate.lua]]},
		{nMap, {2356,2905}, {2368,2932}, [[\script\missions\one_road_battle\trap\liao_gate.lua]]},
	};
	gf_CreateTraps(tTraps);
	
	--Ë¢¸÷ÖÖÕÏ°­
	--ÏÈË¢Ê÷Ä¾
	--do
	--	local nTreeCount = random(1, 3);
	--	local tPosResult = floyd_m4n(getn(OBSTACLE_NPC_POS[1]), nTreeCount);
	--	for k, v in tPosResult do
	--		local nTreeIdx = CreateNpc(OBSTACLE_NPC[1][1], OBSTACLE_NPC[1][2], nMap,
	--			OBSTACLE_NPC_POS[1][k][1], OBSTACLE_NPC_POS[1][k][2]);
	--		SetNpcObstacleShape(nTreeIdx, 2, 8);
	--		SetNpcObstacleEnable(nTreeIdx, 1);
	--		FlushNpcObstacle(nTreeIdx);
	--		SetCampToNpc(nTreeIdx, CampNeutral);
	--		SetNpcScript(nTreeIdx, OBSTACLE_NPC[1][3]);
	--	end
	--end
	--
	----Ë¢Õ¤À¸
	--for i = 1, 2 do
	--	local nFenceCount = random(1, 4);
	--	local tPosResult = floyd_m4n(getn(OBSTACLE_NPC_POS[2][i]), nFenceCount);
	--	for k, v in tPosResult do
	--		local nFenceIdx = CreateNpc(OBSTACLE_NPC[2][1], OBSTACLE_NPC[2][2], nMap,
	--			OBSTACLE_NPC_POS[2][i][k][1], OBSTACLE_NPC_POS[2][i][k][2]);
	--		SetNpcObstacleShape(nFenceIdx, 2, 8);
	--		SetNpcObstacleEnable(nFenceIdx, 1);
	--		FlushNpcObstacle(nFenceIdx);
	--		SetCampToNpc(nFenceIdx, CAMPIDX2STR[i]);
	--		SetNpcScript(nTreeIdx, OBSTACLE_NPC[2][3]);
	--	end
	--end
end

phaseOne_Road_Battle_waiting.actions = {
	[1] = phaseOne_Road_Battle_waiting.Init,
};

phaseOne_Road_Battle_fighting = {
	maxsecond = 43 * 60,
	guage = {
		msg = "ChiÕn ®Êu",
		time = 43 * 60,
		cyc = 0,
		id = 2,
	},
}

phaseOne_Road_Battle_fighting = inherit(cycPhase, phaseOne_Road_Battle_fighting)

g_tEventTable = {};

function phaseOne_Road_Battle_fighting:onPlayerDeath(event, killId)
	local nOldPlayerIndex = PlayerIndex;
	local nMapId, x, y = this.msPosition:getEntryPos(GetTask(TASKID_ORB_CAMP));
	SetTempRevPos(nMapId, x * 32, y * 32);
	gf_ModifyTask(TASKID_ORB_DEAD, 1);
	add_activity(ACTIVITY_DEATH);
	local nMonkeyIdx = GetFollower();
	if GetNpcName(nMonkeyIdx) == MONKEY_NPC[2] then
		Msg2Player(MSG_LOST_MONKEY);
		local tTemp = MONKEY_POS[random(1,2)];
		local tPos = tTemp[random(1,getn(tTemp))];
		local nMonkeyIdx = CreateNpc(MONKEY_NPC[1], MONKEY_NPC[2], nMap, tPos[1], tPos[2]);
		SetNpcScript(nMonkeyIdx, MONKEY_SCRIPT);
	end
	KillFollower();
	Orb_AddRuntimeStat(RUNTIMEID_EachRouterDeathCount, GetPlayerRoute(), 1)
	PlayerIndex = NpcIdx2PIdx(killId);
	Orb_AddRuntimeStat(RUNTIMEID_EachRouterKillCount, GetPlayerRoute(), 1)
	if PlayerIndex > 0 then
		if PlayerIndex ~= nOldPlayerIndex then
			orb_honor:OnKillPlayer()
			local nKillerCamp = GetTask(TASKID_ORB_CAMP);
			add_point(nKillerCamp, POINT_KILL_PLAYER);
			add_activity(ACTIVITY_KILL_PLAYER);
			gf_ModifyTask(TASKID_ORB_KILL, 1);
			gf_ModifyTask(TASKID_ORB_TOTOAL_KILL, 1);
			local _, x1, y1 = GetWorldPos();
			for i = 1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);
				if PlayerIndex ~= NpcIdx2PIdx(killId) and gf_GetDistance(x1, y1) < 18 then
					gf_ModifyTask(TASKID_ORB_ASSIST, 1);
					gf_ModifyTask(TASKID_ORB_TOTOAL_ASSIST, 1);
					add_activity(ACTIVITY_ASSISTANT);
					Msg2Player(MSG_GET_ASSISTANT);
				end
			end
		end
	else
		PlayerIndex = nOldPlayerIndex;
		local szNpcName = GetNpcName(killId);
		for i = 1, getn(TOWER_NPC) do
			if szNpcName == TOWER_NPC[i][2] then
				gf_ModifyTask(TASKID_ORB_KILLED_BY_TOWER, 1);
				-- OnAchEvent(2, TASKID_ORB_KILLED_BY_TOWER);
				return
			end
		end
		
		for i = 1, getn(TOWER_GUARD_NPC) do
			local tGuard = TOWER_GUARD_NPC[i];
			for j = 1, getn(tGuard) do
				if szNpcName == tGuard[j][2] then
					gf_ModifyTask(TASKID_ORB_KILLED_BY_TOWER, 1);
					-- OnAchEvent(2, TASKID_ORB_KILLED_BY_TOWER);
					return
				end
			end
		end
	end
	
	return 0;
end

function phaseOne_Road_Battle_fighting:onNpcDeath(event, data)
end

function phaseOne_Road_Battle_fighting:onPlayerRevive(event, data)
	RestoreAll();
end

phaseOne_Road_Battle_fighting.triggers = {
	PlayerDeath = {
		{action = phaseOne_Road_Battle_fighting.onPlayerDeath,},
	},
	NpcDeath = {
		{action = phaseOne_Road_Battle_fighting.onNpcDeath,},
	},
	PlayerRevive = {
		{action = phaseOne_Road_Battle_fighting.onPlayerRevive,},
	},
}

function phaseOne_Road_Battle_fighting:onTimeout()
	local nSongPoint = GetMissionV(MV_POINT_SONG);
	local nLiaoPoint = GetMissionV(MV_POINT_LIAO);
	
	-- AddStatValue("pvp_battlefield_wayover2", 1);
	if nSongPoint > nLiaoPoint then
		win_battle(CAMP_SONG);
	elseif nSongPoint < nLiaoPoint then
		win_battle(CAMP_LIAO);
	else
		win_battle(3);
	end
end

function phaseOne_Road_Battle_fighting.Init()
	--Ë¢Õ½³µ
	create_chariot();
	SetMissionV(MV_STAGE, PHASE_FIGHTING);
	update_break_point_ui();
	local nMapId = this.msPosition:getMapID();
	if not g_tEventTable[nMapId] then
		g_tEventTable[nMapId] = {};
		g_tEventTable[nMapId] = inherit(TCallFuture, g_tEventTable[nMapId]);
	end
end

function phaseOne_Road_Battle_fighting.EventBreathe()
	local nMapId = this.msPosition:getMapID();
	if not g_tEventTable or not g_tEventTable[nMapId] then return 0; end
	g_tEventTable[nMapId]:breathe();
end

function phaseOne_Road_Battle_fighting.Breathe()
	--¼ì²âÕ½³µ¸½½üµÄÍæ¼ÒÊý
	local nChariotIdx = GetMissionV(MV_CHARIOT_IDX);
	if nChariotIdx == 0 then return end
	local nMap, x, y = GetNpcWorldPos(nChariotIdx);
	local nOldCamp = CAMPSTR2IDX[GetNpcCamp(nChariotIdx)];
	local tPlayers = GetPlayersNearPos(nMap, x, y, 18);
	if not tPlayers or getn(tPlayers) <= 0 then 
		if nOldCamp ~= CAMP_NEUTRAL then
			set_chariot_camp(CAMP_NEUTRAL);
		end
		return 
	end
	
	local nOldPlayerIdx = PlayerIndex;
	local tCampPlayerCount = {0, 0};
	local bAddActivity = mod(GetMissionV(MV_TIMER_SECOND), 5);
	for i = 1, getn(tPlayers) do
		PlayerIndex = tPlayers[i];
		if IsPlayerDeath() ~= 1 then
			local nPlayerCamp = GetTask(TASKID_ORB_CAMP);
			if nPlayerCamp == CAMP_SONG or nPlayerCamp == CAMP_LIAO then
				tCampPlayerCount[nPlayerCamp] = tCampPlayerCount[nPlayerCamp] + 1;
				if bAddActivity == 0 then
					add_activity(ACTIVITY_CHARIOT);
				end
			end
		end
	end
	if tCampPlayerCount[CAMP_SONG] > tCampPlayerCount[CAMP_LIAO] and nOldCamp ~= CAMP_SONG then
		set_chariot_camp(CAMP_SONG);
	elseif tCampPlayerCount[CAMP_LIAO] > tCampPlayerCount[CAMP_SONG] and nOldCamp ~= CAMP_LIAO then
		set_chariot_camp(CAMP_LIAO);
	elseif tCampPlayerCount[CAMP_LIAO] == tCampPlayerCount[CAMP_SONG] and nOldCamp ~= CAMP_NEUTRAL then
		set_chariot_camp(CAMP_NEUTRAL);
	end
	
	for i = 1, 2 do
		local nCount = GetMissionV(MV_GUARD_SONG + i - 1);
		if nCount <= 2 then
			local nTowerIdx = GetMissionV(MV_TOWER_IDX_1 + (i - 1) * 4 + nCount);
			local nMaxLife,nCurLife = GetUnitCurStates(nTowerIdx,1);
			if nCurLife < nMaxLife then
				SetMissionV(MV_GUARD_SONG + i - 1, nCount + 1);
				if random(1, 10) == 1 then
					local nIndex = (i - 1) * 3 + nCount + 1;
					local nGuardIdx = CreateNpc(GUARD_NPC[i][1], GUARD_NPC[i][2], 
						nMap, GUARD_POS[nIndex][1], GUARD_POS[nIndex][2]);
					SetCampToNpc(nGuardIdx, GetNpcCamp(nTowerIdx));
					SetNpcScript(nGuardIdx, GUARD_SCRIPT);
					add_max_meridian_to_npc(nGuardIdx);
				end
			end
		end
	end
end

function phaseOne_Road_Battle_fighting.add_chariot_point()
	local nChariotIdx = GetMissionV(MV_CHARIOT_IDX);
	if nChariotIdx > 0 then
		local szCamp = GetNpcCamp(nChariotIdx);
		add_point(CAMPSTR2IDX[szCamp], POINT_OWN_CHARIOT);
	end
end

function phaseOne_Road_Battle_fighting.check_pk_flag()
	local fCheckPKFlag = function ()
		local nState, nCamp = GetPKFlag();
		if nState == 0 then
			SetPKFlag(1, 0, 0);
			LeaveTeam();
		end
	end
	this.msCamp:turnPlayer(0, fCheckPKFlag);
end

function phaseOne_Road_Battle_fighting.reset_bucket()
	SetMissionV(MV_BUCKET_SONG, 10);
	SetMissionV(MV_BUCKET_LIAO, 10);
end

function phaseOne_Road_Battle_fighting.on_tower_death(nCamp, nNpcIdx)
	add_point(nCamp, POINT_DESTORY_TOWER);
	
	--¸øÕ½³µÖÜÎ§µÄÍæ¼ÒÔö¼Ó»îÔ¾¶È
	local nChariotIdx = GetMissionV(MV_CHARIOT_IDX);
	if nChariotIdx > 0 then
		local nMap, x, y = GetNpcWorldPos(nChariotIdx);
		local tPlayers = GetPlayersNearPos(nMap, x, y, 18);
		if tPlayers and getn(tPlayers) > 0 then
			for i = 1, getn(tPlayers) do
				PlayerIndex = tPlayers[i];
				if IsPlayerDeath() ~= 1 then
					orb_honor:OnKillTower()
					add_activity(ACTIVITY_DESTORY_TOWER);
					-- gf_ModifyTask(TASKID_ORB_KILL_TOWER, 1);
					-- OnAchEvent(2, TASKID_ORB_KILL_TOWER);
					gf_ModifyTask(TASKID_TEMP_TOWER, 1);
				end
			end
		end
	end
	--É¾µô±£»¤¼ýËþµÄnpc
	local nMap = GetNpcWorldPos(nNpcIdx);
	local szKey = GetNpcName(nNpcIdx) .. CAMPSTR2IDX[GetNpcCamp(nNpcIdx)];
	local tGuardList = g_tMissionParam[nMap][szKey];
	for i = 1, getn(tGuardList) do
		RemoveNpc(tGuardList[i]);
	end
	g_tMissionParam[nMap][szKey] = nil;
	--´´½¨BOSS
	local nBossCount = GetMissionV(MV_BOSS_COUNT);
	if nBossCount <= 2 then
		if GetNpcName(nNpcIdx) == TOWER_NPC[nBossCount + 1][2] or GetNpcName(nNpcIdx) == TOWER_NPC[nBossCount + 4][2] then
			nBossCount = nBossCount + 1;
			SetMissionV(MV_BOSS_COUNT, nBossCount);
			if g_tEventTable[nMap] then
				g_tEventTable[nMap]:insertevent(30,
					phaseOne_Road_Battle_fighting.call_boss,
					nBossCount, nCamp);
			end
		end
	end
	--ÈõÊÆ±£»¤
	local nOtherCamp = mod(nCamp, 2) + 1;
	local nMV = MV_SCHEDULE_SONG + nOtherCamp - 1;
	local nSchedule = GetMissionV(nMV) + 1;
	SetMissionV(nMV, nSchedule);
	this.msCamp:turnPlayer(nOtherCamp, add_weekness_buff, nSchedule);
	this:Msg2MSAll(format(MSG_TOWER_DESTORYED[nSchedule], CAMPIDX2NAME[nCamp]));
	
	if nSchedule + 1 > get_time_schedule() then
		if nOtherCamp == CAMP_SONG then
			update_chariot_state_ui(CHARIOT_STATE_MSG.CLEANING_SONG, GetNpcName(nNpcIdx));
		elseif nOtherCamp == CAMP_LIAO then
			update_chariot_state_ui(CHARIOT_STATE_MSG.CLEANING_LIAO, GetNpcName(nNpcIdx));
		end
		this:Msg2MSAll(MSG_CHARIOT_STOP);
	end
	set_chariot_camp(nCamp);
end

function phaseOne_Road_Battle_fighting.on_flag_death(nCamp)
	local nChariotIdx = GetMissionV(MV_CHARIOT_IDX);
	if nChariotIdx == 0 then return end
	local nMap, x, y = GetNpcWorldPos(nChariotIdx);
	local tPlayers = GetPlayersNearPos(nMap, x, y, 18);
	if tPlayers and getn(tPlayers) > 0 then
		for i = 1, getn(tPlayers) do
			PlayerIndex = tPlayers[i];
			if IsPlayerDeath() ~= 1 then
				add_activity(ACTIVITY_BIG_FLAG);
			end
		end
	end
	-- AddStatValue("pvp_battlefield_wayover1", 1);
	win_battle(nCamp);
end

function phaseOne_Road_Battle_fighting.on_chariot_death(nNpcIndx, nSubWorldIndex, nKiller)
	--ÏÈÈÃÕ½³µÏûÊ§
	local nMap, x, y = GetNpcWorldPos(nNpcIndx);
	RemoveNpc(nNpcIndx);
	SetMissionV(MV_CHARIOT_IDX, 0);
	--´´½¨Ò»¸öÐÂµÄÕ½³µ
	local nNewChariotIdx = CreateNpc(CHARIOT_DEAD_NPC[1], CHARIOT_DEAD_NPC[2],
		nMap, x, y);
	SetNpcRemoveScript(nNewChariotIdx, CHARIOT_DEAD_NPC[3]);
	-- AddMapTraceNpc(nNewChariotIdx, 1);
	-- SetNpcSpotImage(nNewChariotIdx,103);
	SetNpcLifeTime(nNewChariotIdx, CHARIOT_REVIVE_TIME);
	NpcCommand(nNewChariotIdx,2,CHARIOT_NPC[3] * 32, CHARIOT_NPC[4] * 32, nMap);
	--´´½¨ÒªÐ®Ð¡±ø
	for i = 1, getn(HFZ_TALK_FISH_POS) do
		local tPos = HFZ_TALK_FISH_POS[i];
		local nFishIdx = CreateNpc(HFZ_TALK_FISH_NPC[1], HFZ_TALK_FISH_NPC[2],
			nMap, x + tPos[1], y + tPos[2]);
		SetNpcLifeTime(nFishIdx, CHARIOT_REVIVE_TIME);
		NpcChat(nFishIdx, "Ha Ha, ChiÕn Xa nµy bÞ H¾c Phong Tr¹i thÇu råi!");
		NpcCommand(nFishIdx, 2, (CHARIOT_NPC[3] + tPos[1]) * 32,
			(CHARIOT_NPC[4] + tPos[2]) * 32, nMap);
	end
	--´¦Àí¹¥³Ç³µ
	local nHFZIdx = GetMissionV(MV_HFZ_CHARIOT_IDX);
	SetNpcLifeTime(nHFZIdx, HFZ_CHARIOT_DISPEAR_TIME);
	local nMap = this.msPosition:getMapID();
	local tNpcList = g_tMissionParam[nMap][GetNpcName(nKiller)];
	for i = 1, getn(tNpcList) do
		SetNpcLifeTime(tNpcList[i], 10);
	end
	g_tMissionParam[nMap][GetNpcName(nNpcIndx)] = nil;
	update_chariot_state_ui(CHARIOT_STATE_MSG.OCCUPIED);
end

function phaseOne_Road_Battle_fighting.call_boss(nBossID, nCamp)
	local nMap = this.msPosition:getMapID();
	local x, y = gf_UnPack(BOSS_POS[nCamp]);
	local tBossInfo = BOSS_NPC[nBossID];
	local nBossIdx = CreateNpc(tBossInfo[1], tBossInfo[2], nMap, x, y);
	SetNpcScript(nBossIdx, BOSS_SCRIPT);
	-- AddMapTraceNpc(nBossIdx,1);
	-- SetNpcSpotImage(nBossIdx,102);
	add_max_meridian_to_npc(nBossIdx);
	this:Msg2MSAll(BOSS_TALK[nBossID], tBossInfo[2]);
end

function phaseOne_Road_Battle_fighting.call_monkey()
	local nMonkeyCount = GetMissionV(MV_MONKEY_COUNT);
	if nMonkeyCount >= MONKEY_MAX_COUNT then return end
	
	local nMap = this.msPosition:getMapID();
	
	SetMissionV(MV_MONKEY_COUNT, nMonkeyCount + MONKEY_PER_COUNT);
	for i = 1, 2 do
		local tResult = floyd_rm4n(getn(MONKEY_POS[i]), MONKEY_PER_COUNT / 2);
		for j = 1, getn(tResult) do
			local tPos = MONKEY_POS[i][tResult[j]];
			local nMonkeyIdx = CreateNpc(MONKEY_NPC[1], MONKEY_NPC[2], nMap, tPos[1], tPos[2]);
			SetNpcScript(nMonkeyIdx, MONKEY_SCRIPT);
		end
	end
	this:Msg2MSAll(MSG_CREATE_MONKEY);
end

function phaseOne_Road_Battle_fighting.create_HFZ_chariot()
	local nRand = random(1, 100);
	if nRand > 30 then return end
	
	local nHFZIdx = GetMissionV(MV_HFZ_CHARIOT_IDX);
	if nHFZIdx ~= 0 then return end
	
	local nChariotIdx = GetMissionV(MV_CHARIOT_IDX);
	if IsNpcDeath(nChariotIdx) == 1 then return end
	
	local nMap = this.msPosition:getMapID();
	nHFZIdx = CreateNpc(HFZ_CHARIOT_NPC[1], HFZ_CHARIOT_NPC[2],
		nMap, CHARIOT_NPC[3], CHARIOT_NPC[4]);
	SetMissionV(MV_HFZ_CHARIOT_IDX, nHFZIdx);
	g_NpcAI:setAI(nHFZIdx, AT_SM_ATTACK_TARGET, 1);
	SetNpcTarget(nHFZIdx, nChariotIdx);
	SetCampToNpc(nHFZIdx, CampHFZ);
	SetNpcLifeTime(nHFZIdx, 2700);
	SetNpcScript(nHFZIdx, HFZ_CHARIOT_SCRIPT);
	g_tMissionParam[nMap][HFZ_CHARIOT_NPC[2]] = {};
	for i = 1, getn(HFZ_FISH_POS) do
		local nFishIdx = CreateNpc(HFZ_FISH_NPC[1],HFZ_FISH_NPC[2],
			nMap, HFZ_FISH_POS[i][1], HFZ_FISH_POS[i][2]);
		g_NpcAI:setAI(nFishIdx, AT_SM_PROTECT, 1);
		SetNpcMaster(nFishIdx, nHFZIdx);
		tinsert(g_tMissionParam[nMap][HFZ_CHARIOT_NPC[2]], nFishIdx);
		SetNpcLifeTime(nFishIdx, 2700);
		SetCampToNpc(nFishIdx, CampHFZ);
		add_max_meridian_to_npc(nFishIdx);
	end
end

function phaseOne_Road_Battle_fighting.add_weekness_buff()
	local nScheduleSong = GetMissionV(MV_SCHEDULE_SONG);
	if nScheduleSong > 0 and nScheduleSong <= getn(WEEKNESS_BUFF[3]) then
		this.msCamp:turnPlayer(CAMP_SONG, add_weekness_buff, nScheduleSong);
	end
	local nScheduleLiao = GetMissionV(MV_SCHEDULE_LIAO);
	if nScheduleLiao > 0 and nScheduleLiao <= getn(WEEKNESS_BUFF[3]) then
		this.msCamp:turnPlayer(CAMP_LIAO, add_weekness_buff, nScheduleLiao);
	end
end

function phaseOne_Road_Battle_fighting.check_life()
	local nMap = this.msPosition:getMapID();
	for i = MV_TOWER_IDX_1, MV_TOWER_IDX_8 do
		local nNpcIdx = GetMissionV(i);
		if nNpcIdx ~= 0 and IsNpcDeath(nNpcIdx) ~= 1 then
			local szNpcName = GetNpcName(nNpcIdx);
			local nCurLife, nMaxLife = GetUnitCurStates(nNpcIdx,1);
			local nPreLife = g_tMissionParam[nMap]["Life"][szNpcName] or nMaxLife;
			if nPreLife > nCurLife then
				local nNpcCamp = CAMPSTR2IDX[GetNpcCamp(nNpcIdx)];
				local nOtherCamp = mod(nNpcCamp, 2) + 1;
				this:Msg2MSAll(format(MSG_TOWER_BE_ATTACKED, 
					CAMPIDX2NAME[nNpcCamp], CAMPIDX2NAME[nOtherCamp], szNpcName));
			end
			g_tMissionParam[nMap]["Life"][szNpcName] = nCurLife;
		end
	end
end

function phaseOne_Road_Battle_fighting.check_road(nSchedule)
	--¼ì²âËÎ·½µÀÂ·
	local nNpcIdx = GetMissionV(TOWER_NPC[nSchedule][6]);
	if nNpcIdx == 0 or IsNpcDeath(nNpcIdx) == 1 then
		this:Msg2MSAll(format(MSG_CHARIOT_RUN[nSchedule], CAMPIDX2NAME[TOWER_NPC[nSchedule][5]]));
	end
	--¼ì²âÁÉ·½µÀÂ·
	local nNpcIdx = GetMissionV(TOWER_NPC[nSchedule + 3][6]);
	if nNpcIdx == 0 or IsNpcDeath(nNpcIdx) == 1 then
		this:Msg2MSAll(format(MSG_CHARIOT_RUN[nSchedule], CAMPIDX2NAME[TOWER_NPC[nSchedule + 3][5]]));
	end
	local nChariotIdx = GetMissionV(MV_CHARIOT_IDX);
	if nChariotIdx > 0 then
		local nCamp = CAMPSTR2IDX[GetNpcName(nChariotIdx)];
		set_chariot_camp(nCamp);
	end
end

function phaseOne_Road_Battle_fighting.kick_sleep()
	if IsSleeping() == 1 then
		local nCamp = GetTask(TASKID_ORB_CAMP);
		LeaveTeam()
		Talk(1,"","KÎ thï tr­íc mÆt vËy mµ d¸m ngñ gËt, ng­êi ®©u l«i ra cho ta!");
		DelMSPlayer(this.missionID, nCamp);
		Msg2MSAll(this.missionID,GetName().."Rêi khái chiÕn tr­êng.");
		return 1;
	end;
	return 0;
end

function phaseOne_Road_Battle_fighting.call_field_boss()
	local nHour = tonumber(date("%H"));
	local nCount = tTimePoints[nHour][1];
	if not nCount then return end
	
	if not tTimePoints[nHour] then return 0; end
	local nMapID = this.msPosition:getMapID();
	local tBossNum = {
		[1] = 0,
		[2] = 0,
		[3] = 0,
		[4] = 0,
	};
	for i = 1, nCount do
		local nRand = random(1, 100000);
		for k = 1, getn(tTimePoints[nHour][2]) do
			nRand = nRand - tTimePoints[nHour][2][k] * 100000;
			if nRand <= 0 then
				tBossNum[k] = tBossNum[k] + 1;
				break;
			end
		end
	end
	
	local tPosResult = floyd_rm4n(getn(FIELD_BOSS_POS), nCount);
	local nPosIdx = 1;
	for i = 1, 4 do
		local nRand = random(1, getn(tBossList.LevelBoss[i]));
		for k = 1, tBossNum[i] do
			--Í¬ÉÏ
			local nIndex = mod(k + nRand, getn(tBossList.LevelBoss[i])) + 1;
			local tPos = FIELD_BOSS_POS[tPosResult[nPosIdx]];
			local nNpcIdx = CreateNpc(tBossList.LevelBoss[i][nIndex][1], tBossList.LevelBoss[i][nIndex][2], 
				nMapID, tPos[1], tPos[2]);
			AddUnitStates(nNpcIdx, 6, i-GetUnitCurStates(nNpcIdx, 6));
			SetNpcLifeTime(nNpcIdx, 90*60);
			SetNpcDeathScript(nNpcIdx, "\\script\\online\\2012\\duanwu\\npc\\boss_npc.lua");
			nPosIdx = nPosIdx + 1
		end
	end
end

function phaseOne_Road_Battle_fighting.sync_rank()
	WriteLog(format("[OrbLog:%s]-----------------start sync-----------------",date("%Y/%m/%d/%H:%M")))
	phaseOne_Road_Battle_fighting.sync_camp_rank(CAMP_SONG);
	phaseOne_Road_Battle_fighting.sync_camp_rank(CAMP_LIAO);
end

function phaseOne_Road_Battle_fighting.sync_camp_rank(nCamp)
	local tShowData = {
		name = "ChiÕn tr­êng HiÖp Lé T­¬ng Phïng",
		title = {"Tªn","Phe","L­u ph¸i","§¸nh b¹i ng­êi ch¬i",},
		szFormat = "%-25s%-10s%-25s%-10s",
		data = {
			--ph2 = {'ph34567890123452', '12345678', '½üÎÀ', 0, 6, 2, 1,'<color=blue>'},
		},
		szMsg = "     TØ lÖ thêi gian chiÕm: <color=blue>CËn VÖ 100<color> / <color=red>Thiªn Tai 200<color>",
	};
	this.msCamp:turnPlayer(nCamp, update_player_data, tShowData);
	
	local sortFunc = function(p1, p2)
		return p2[4]*1000 + p2[5] < p1[4]*1000 + p1[5];
	end
	tShowData.data.n = nil;
	sort(tShowData.data, sortFunc);

----------------------------------- LOG INFO -----------------------------------
	local UsefulPlayer = min(getn(tShowData.data),11)
	local szTime = date("%Y/%m/%d/%H:%M")
	WriteLog(format("[OrbLog:%s] Camp:%d      CampPlayer:%d      Useful:%d",szTime, nCamp, getn(tShowData.data), UsefulPlayer))
	for i = 1, UsefulPlayer do 
		local logStr = format("[OrbLog:%s] name:%s, camp:%s, route:%s, kill:%d",szTime,tShowData.data[i][1], tShowData.data[i][2], tShowData.data[i][3], tShowData.data[i][4] )
		WriteLog(logStr)
	end
----------------------------------- LOG INFO -----------------------------------

	for i = 11, getn(tShowData.data) do
		tShowData.data[i] = nil;
	end
	this.msCamp:turnPlayer(nCamp, sync_player_rank, tShowData);
end

function update_player_data(tShowData)
	local tData = {
		GetName(),
		orb_getCampName(),
		gf_GetRouteName(),
		GetTask(TASKID_ORB_KILL),
		1,
		"<color=white>",
	};
	--tShowData.data[GetName()] = tData;
	tinsert(tShowData.data, tData);
end

function sync_player_rank(tShowData)
	local tTowerDestoried = {
		GetMissionV(MV_CAMP1_TOWER_DESTORIED),
		GetMissionV(MV_CAMP2_TOWER_DESTORIED),
	}
	local nCamp = GetTask(TASKID_ORB_CAMP)
	tShowData.szMsg = format("Phe m×nh ®¸nh b¹i sè l­îng TiÔn Th¸p:%d<enter/>Phe ®Þch ®¸nh b¹i sè l­îng TiÔn Th¸p:%d<enter/>b¾t con khØ:%d      §é n¨ng ®éng:%d",
		tTowerDestoried[3-nCamp],
		tTowerDestoried[nCamp],
		GetTask(TASKID_TEMP_MONKEY),
		GetTask(TASKID_ORB_ACTIVITY)
		-- date("%Y:%m:%d:%H:%M:%S")
	);
	local nSelfIndex = 0;
	for i = 1, getn(tShowData.data) do
		if tShowData.data[i][1] == GetName() then
			tShowData.data[i][7] = "<color=yellow>";
			nSelfIndex = i;
			break;
		end
	end
	
	if nSelfIndex == 0 then
		local tData = {
			GetName(),
			gf_GetRouteName(),
			GetTask(TASKID_ORB_KILL),
			GetTask(TASKID_ORB_DEAD),
			GetTask(TASKID_ORB_ASSIST),
			1,
			"<color=yellow>",
		};
		tinsert(tShowData.data, tData);
	end
	tShowData.data.n = nil;
	local str = "SyncTable("..Val2Str_red(tShowData)..");";
	--str = str .. "Open('topscore');";
	--print(str);
	SendScript2Client("SyncClear()");
	sendScriptBuff(str);
	if nSelfIndex > 0 then
		tShowData.data[nSelfIndex][7] = "<color=white>";
	else
		tremove(tShowData.data, getn(tShowData.data));
	end
	
end

phaseOne_Road_Battle_fighting.actions = {
	[1]    = phaseOne_Road_Battle_fighting.Init,
	[600]  = {
		phaseOne_Road_Battle_fighting.call_monkey,
	},
	[900]  = {
		phaseOne_Road_Battle_fighting.create_HFZ_chariot,
		phaseOne_Road_Battle_fighting.call_monkey,
	},
	[1200] = {
		phaseOne_Road_Battle_fighting.create_HFZ_chariot,
		phaseOne_Road_Battle_fighting.call_monkey,
	},
	[1500] = {
		phaseOne_Road_Battle_fighting.call_monkey,
	},
	[1800] = {
		phaseOne_Road_Battle_fighting.create_HFZ_chariot,
		phaseOne_Road_Battle_fighting.call_monkey,
	},
};

for i = 1, TIME_SCHEDULE_COUNT do
	local nTime = TIME_SCHEDULE * i;
	if phaseOne_Road_Battle_fighting.actions[nTime] then
		tinsert(phaseOne_Road_Battle_fighting.actions[nTime],
			callout(phaseOne_Road_Battle_fighting.check_road, i));
	else
		phaseOne_Road_Battle_fighting.actions[nTime] = callout(phaseOne_Road_Battle_fighting.check_road, i);
	end
end

phaseOne_Road_Battle_fighting.cycActions = {
	[1] = {
		[0] = {
			phaseOne_Road_Battle_fighting.Breathe,
			phaseOne_Road_Battle_fighting.EventBreathe,
		}
	},
	[5] = {
		[0] = phaseOne_Road_Battle_fighting.add_chariot_point,
	},
	[10] = {
		[0] = {
			phaseOne_Road_Battle_fighting.kick_sleep,
			phaseOne_Road_Battle_fighting.check_pk_flag,
		}
	},
	[15] = {
		[0] = phaseOne_Road_Battle_fighting.check_life,
	},
	[60] = {
		[1] = phaseOne_Road_Battle_fighting.sync_rank,
	},
	[300] = {
		[1] = {
			phaseOne_Road_Battle_fighting.reset_bucket,
			phaseOne_Road_Battle_fighting.add_weekness_buff,
		},
	}
};

phaseOne_Road_Battle_end = {
	maxsecond = 3 * 60,
	guage = {
		msg = "KÕt thóc",
		time = 3 * 60,
		cyc = 0,
		id = 3,
	},
}
phaseOne_Road_Battle_end = inherit(cycPhase, phaseOne_Road_Battle_end)

function phaseOne_Road_Battle_end.Init()
	SetMissionV(MV_STAGE, PHASE_END);
end

function phaseOne_Road_Battle_end.kick_player()
	local nTotalPlayerNum = GetMSPlayerCount(this.missionID, 0);
	local nMSIdx, nPIdx = 0, 0;
	for i = 1, min(nTotalPlayerNum, MAX_LEAVE_PlAYER_COUNT) do
		nMSIdx, nPIdx = GetNextPlayer(this.missionID, nMSIdx, 0);
		PlayerIndex = nPIdx;
		DelMSPlayer(this.missionID, 0);
	end
end

phaseOne_Road_Battle_end.actions = {
	[1] = phaseOne_Road_Battle_end.Init,
};

phaseOne_Road_Battle_end.cycActions = {
	[5] = {
		[0] = {
			phaseOne_Road_Battle_end.kick_player,
		},
		start = 30,
	},
}

function phaseOne_Road_Battle_end:onTimeout()
	CloseMission(Mission_OneRoadBattle.missionID);
end

---------------------------------------------------------------------
phaseOne_Road_Battle = {
	phases = {
		phaseOne_Road_Battle_idle,
		phaseOne_Road_Battle_waiting,
		phaseOne_Road_Battle_fighting,
		phaseOne_Road_Battle_end,
	},
	maxsecond = 48 * 60 + 10,
	timerID = 123,
}
phaseOne_Road_Battle = inherit(phaseBase, phaseOne_Road_Battle)


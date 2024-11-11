Import("\\script\\lib\\npccmdhead.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_functions.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_head.lua")
Import("\\script\\missions\\kuafu_boss\\kfb_data.lua")

Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\script\\lib\\floyd.lua")
Include("\\settings\\static_script\\missions\\base\\callfuture.lua")
Include("\\script\\lib\\topscorelib.lua")

--======================================================================================
-- ×¼±¸½×¶Î
phase_kfb_idle = {
	maxsecond = T_KFB_COMMON_PHASE_TIME[1],
}
phase_kfb_idle = inherit(cycPhase, phase_kfb_idle)
phase_kfb_idle.onTimeout = phase_kfb_idle.onFinish;

phase_kfb_waiting = {
	maxsecond = T_KFB_COMMON_PHASE_TIME[2],
	guage = {
		msg = "Khai chiÕn ngay",
		time = T_KFB_COMMON_PHASE_TIME[2],
		cyc = 0,
		id = 1,
	},
}

phase_kfb_waiting = inherit(cycPhase, phase_kfb_waiting)
phase_kfb_waiting.onTimeout = phase_kfb_waiting.onFinish;

function phase_kfb_waiting.Init()
	local nMap = this.msPosition:getMapID()
	SetMissionV(MV_MISSION_STATE, KFB_MS_PREPARE)
	kfb_DataSetCurMSState(KFB_MS_PREPARE)
end

phase_kfb_waiting.actions = {
	[1] = phase_kfb_waiting.Init,
};

phase_kfb_fighting = {
	maxsecond = T_KFB_COMMON_PHASE_TIME[3],
	guage = {
		msg = "ChiÕn ®Êu",
		time = T_KFB_COMMON_PHASE_TIME[3],
		cyc = 0,
		id = 1,
	},
}

phase_kfb_fighting = inherit(cycPhase, phase_kfb_fighting)

function phase_kfb_fighting:onPlayerDeath(event, killId)
	kfb_AddActivePoint(KFB_ACTIVITY_TYPE_PLAYERDEAD)

	killId = tonumber(killId) or 0
	local nKillerIndex = NpcIdx2PIdx(killId)
	if not nKillerIndex or nKillerIndex <= 0 then
		return	
	end
--	local nDeathName = GetName()
--	local _,nX,nY = GetWorldPos() --ËÀÕßµÄÎ»ÖÃ

	local nOldPIdx = PlayerIndex
	PlayerIndex = nKillerIndex
	kfb_AddActivePoint(KFB_ACTIVITY_TYPE_KILLPLAYER)

	PlayerIndex = nOldPIdx
end

function phase_kfb_fighting:onNpcDeath(event, data)
end

function phase_kfb_fighting:OnRevive(event)
	--SetTempRevScript(thisFile);
	
	--RestoreAll();
	local _,nX,nY = GetWorldPos();
	if nX==VIRTUAL_REVIVE_POS[1] and nY==VIRTUAL_REVIVE_POS[2] then
		--¸´»îÊ±¿çmission»Øµ½×¼±¸³¡µØ
		kfb_EnterMSByType(KFB_MISSION_DATA_IDX_YMG, KFB_COMMON_PLAYER_CAMP)
	else
		--²¹mission debuff
		kfb_AddJoinMisisonDeBuff(KFB_MS_TYPE)
	end
end

phase_kfb_fighting.triggers = {
	PlayerDeath = {
		{action = phase_kfb_fighting.onPlayerDeath,},
	},
	NpcDeath = {
		{action = phase_kfb_fighting.onNpcDeath,},
	},
	OnRevive = {
		{action = phase_kfb_fighting.OnRevive,},
	},
}

function onFightingTimeout()
	--Ìá¹©¸øÍâ²¿Import´Ë½Å±¾ºóÊµÏÖ
end

function phase_kfb_fighting:onTimeout()
	local nMapId = this.msPosition:getMapID()
	if kfb_CheckAllMissionBossDead() ~= 1 then
		Msg2MSAll(this.missionID, format(KFB_SZ_MSG_PUBLISH_REAL_BOSS, 
			GetMapName(kfb_DataGetRealBossRealMapId()) or "", 
			kfb_DataGetKillerTong() or "Ch­a") )
		Msg2MSAll(this.missionID, format(KFB_SZ_MSG_ON_TIME_OUT) )
	end
	kfb_removeNpc(nMapId)
	phase_kfb_fighting.sync_rank(1) --Õ½¶·½×¶Î½áÊøÊ±±ØÐëÒªÍ¬²½Ò»´Î 1:log
	kfb_RemoveJoinMisisonDeBuff(KFB_MS_TYPE)

	kfb_DataSetCurMSState(KFB_MS_CLOSE) --×Ü¿ØÖÆÉèÎª¹Ø±Õ
	kfb_DataSave2SDB() --°ï»á»ý·Ö´æµµ
	
	onFightingTimeout()
	self:onFinish()
end

function phase_kfb_fighting.Init()
	SetMissionV(MV_MISSION_STATE, KFB_MS_FIGHTING)
	kfb_DataSetCurMSState(KFB_MS_FIGHTING)
end

function phase_kfb_fighting.EventBreathe()

end

function phase_kfb_fighting.Breathe()
	--¼Óboss¸½½üÍæ¼Ò»îÔ¾
	for i=1, getn(T_KFB_NPC_INFO_BOSS) do
		local nMVIdx = T_KFB_NPC_INFO_BOSS[i][4];
		if nMVIdx and nMVIdx > 0 then
			local nNpcIdx = GetMissionV(nMVIdx);
			if nNpcIdx > 0 then
				kfb_AddActivePointNearNpc(nNpcIdx, KFB_ADD_ACTIVE_POINT_RADIUS)
			end
		end
	end

	--¼Ó×ÊÔ´Âí³µ¸½½üÍæ¼Ò»îÔ¾
	for i=1, getn(T_KFB_NPC_INFO_HORSE_CAR) do
		local nMVIdx = T_KFB_NPC_INFO_HORSE_CAR[i][4];
		if nMVIdx and nMVIdx > 0 then
			local nNpcIdx = GetMissionV(nMVIdx);
			if nNpcIdx > 0 then
				--if IsNpcDeath(nNpcIdx) ~= 1 then
					kfb_AddActivePointNearNpc(nNpcIdx, KFB_ADD_ACTIVE_POINT_RADIUS)
				--end
			end
		end
	end
end

function phase_kfb_fighting.check_pk_flag()
	local fCheckPKFlag = function ()
		local nState, nCamp = GetPKFlag();
		if nState ~= KFB_PK_FLAG then
			SetPKFlag(KFB_PK_FLAG, KFB_COMMON_PLAYER_CAMP);
			LeaveTeam();
		end
	end
	this.msCamp:turnPlayer(0, fCheckPKFlag);
end

function phase_kfb_fighting.on_boss_death(nNpcIdx)

end

function phase_kfb_fighting.kick_sleep()
	if IsSleeping() == 1 then
		LeaveTeam()
		Talk(1,"","KÎ thï tr­íc mÆt vËy mµ d¸m ngñ gËt, ng­êi ®©u l«i ra cho ta!");
		DelMSPlayer(this.missionID, KFB_COMMON_PLAYER_CAMP);
		Msg2MSAll(this.missionID, GetName().."Rêi khái chiÕn tr­êng.");
		return 1;
	end;
	return 0;
end

function phase_kfb_fighting.sync_rank(bLog)
--	WriteLog(format("[KfbLog:%s]-----------------start sync-----------------",date("%Y/%m/%d/%H:%M")))
	phase_kfb_fighting.sync_tong_rank(KFB_COMMON_PLAYER_CAMP, bLog);
end

function phase_kfb_fighting.sync_tong_rank(nCamp, bLog)
	--print("=======sync_tong_rank========")
	local tShowData = {
		name = "         BOSS Liªn Server",
		title = {"h¹ng", "		Bang héi", "§iÓm tÝch lòy"},
		szFormat = "%-10s%-40s%-10s",
		data = {
			--ph2 = {"ÅÅÃû", "°ï»áÃû", °ï»á»ý·Ö, 1,'<color=blue>'},
		},
		szMsg = "",
	};

	for k,v in g_tKfbDynamicTongScores do
		local tData = {
			999,	--ÅÅÃû Ä¬ÈÏ999
			k, 		--°ï»áÃû
			tonumber(format("%0.2f",v[1])),	--°ï»á»ý·Ö
			1,
			"<color=white>",
		};
		tinsert(tShowData.data, tData);
	end


	local sortFunc = function(p1, p2)
		return p2[3] < p1[3];
	end
	tShowData.data.n = nil;
	sort(tShowData.data, sortFunc);

	for i=1, getn(tShowData.data) do
		tShowData.data[i][1] = i
	end

	-- if g_kfbDebug == 1 then
	-- 	print("\n===== after sort tShowData.data = ")
	-- 	gf_PrintTable(tShowData.data)
	-- end
	
-- ----------------------------------- LOG INFO -----------------------------------
	if bLog and bLog == 1 then
		local UsefulTong = min(getn(tShowData.data), KFB_RANK_TONG_COUNT)
		local szTime = date("%Y/%m/%d/%H:%M")
		WriteLog(format("[KfbLog][Rank][%s]  Useful:%d",szTime, UsefulTong))
		for i = 1, UsefulTong do 
			local logStr = format("[KfbLog][Rank][%s] TongRank:%d TongName:%s, Score:%0.2f ",
				szTime, tShowData.data[i][1], tShowData.data[i][2], tShowData.data[i][3])
			WriteLog(logStr)
		end
	end
-- ----------------------------------- LOG INFO -----------------------------------

	for i = KFB_RANK_TONG_COUNT+1, getn(tShowData.data) do
		tShowData.data[i] = nil;
	end

	-- print("\n===== after delete part tShowData.data = ")
	-- gf_PrintTable(tShowData.data)

	this.msCamp:turnPlayer(nCamp, sync_player_rank, tShowData);
end

function sync_player_rank(tShowData)
	--print("========sync_player_rank============")
	tShowData.szMsg = format("§iÓm bang ta: %0.2f<enter/>TÝch cùc c¸ nh©n: %d",
		kfb_DataGetTongScore(gf_GetRealmTongName()),
		GetTask(KFB_TSKID_ACTIVE_POINT) );
	
	local nSelfIndex = 0;
	for i = 1, getn(tShowData.data) do
		if tShowData.data[i][2] == gf_GetRealmTongName() then
			tShowData.data[i][5] = "<color=yellow>";
			nSelfIndex = i;
			break;
		end
	end
	
	-- if nSelfIndex == 0 then
	-- 	local tData = {
	-- 		gf_GetRealmTongName(),
	-- 		9999,
	-- 		"<color=yellow>",
	-- 	};
	-- 	tinsert(tShowData.data, tData);
	-- end
	tShowData.data.n = nil;
	local str = "SyncTable("..Val2Str_red(tShowData)..");";
	--print("========== str = "..str)
	--print("========== strlen(str) = "..strlen(str))

	--SendScript2Client("SyncClear()");
	sendScriptBuff(str);
	SendScript2Client("ts_ChangeSortLineAndType('§iÓm')");

	if nSelfIndex > 0 then
		tShowData.data[nSelfIndex][5] = "<color=white>";
	else
		--tremove(tShowData.data, getn(tShowData.data));
	end
end

function msg_count_down(nRemaining)
	if not nRemaining then
		return
	end
	Msg2MSAll(this.missionID, format("Liªu Quèc ®¹i qu©n sÏ ®Õn sau %d phót, c¸c vÞ hiÖp sÜ n¾m b¾t thêi gian hoµn thµnh nhiÖm vô chÆn ®¸nh råi trë vÒ Nh¹n M«n Quan", nRemaining) )
end

function phase_kfb_fighting.create_phase_npc()
	local nMap = this.msPosition:getMapID()
	_createMultiNpc(T_KFB_NPC_INFO_BOSS, nMap)
	if g_kfbDebug == 1 then
		print(format("=====create_phase_npc() nMap=%d =====", nMap))
	end

	Msg2MSAll(this.missionID, format("Th¸m tö b¸o tin ph¸t hiÖn %s vµ thÕ th©n xuÊt hiÖn t¹i %s, c¸c vÞ hiÖp sÜ h·y ®Õn tiªu diÖt!",
				"Tiªu NhiÔm NguyÖt", "§¹i Th¶o Nguyªn 1, §¹i Th¶o Nguyªn 2, Bé L¹c V­¬ng Kú"))
end

phase_kfb_fighting.actions = {
	[1]    	= phase_kfb_fighting.Init,
	[KFB_COMMON_PHASE_CREATE_BOSS_TIME]				= phase_kfb_fighting.create_phase_npc,
	[KFB_COMMON_PHASE_COUNT_DOWN_START_TIME]		= {callout(msg_count_down, 10), },
	[KFB_COMMON_PHASE_COUNT_DOWN_START_TIME + 5*60]	= {callout(msg_count_down, 5 ), },
	[KFB_COMMON_PHASE_COUNT_DOWN_START_TIME + 7*60]	= {callout(msg_count_down, 3 ), },
	[KFB_COMMON_PHASE_COUNT_DOWN_START_TIME + 8*60]	= {callout(msg_count_down, 2 ), },
	[KFB_COMMON_PHASE_COUNT_DOWN_START_TIME + 9*60]	= {callout(msg_count_down, 1 ), },
	-- [600]  = {
	-- 	func1,
	-- },
};

phase_kfb_fighting.cycActions = {
	[1] = {
		[0] = {
			--phase_kfb_fighting.EventBreathe,
		}
	},
	[10] = {
		[0] = {
			phase_kfb_fighting.kick_sleep,
			phase_kfb_fighting.check_pk_flag,
		}
	},
--	[30] = {
	[KFB_ADD_ACTIVE_POINT_ADD_CD] = {
		[0] = {
			phase_kfb_fighting.Breathe,
		}
	},
	[31] = {
		[0] = phase_kfb_fighting.sync_rank,
	},

};

phase_kfb_end = {
	maxsecond = T_KFB_COMMON_PHASE_TIME[4],
	guage = {
		msg = "KÕt thóc",
		time = T_KFB_COMMON_PHASE_TIME[4],
		cyc = 0,
		id = 1,
	},
}
phase_kfb_end = inherit(cycPhase, phase_kfb_end)

function phase_kfb_end.Init()
	SetMissionV(MV_MISSION_STATE, KFB_MS_CLOSE)
--	kfb_DataSetCurMSState(KFB_MS_CLOSE)
end

function phase_kfb_end.kick_player()
--	print("=========phase_kfb_end.kick_player()=======")
	local nTotalPlayerNum = GetMSPlayerCount(this.missionID, 0);
	local nMSIdx, nPIdx = 0, 0;
	for i = 1, min(nTotalPlayerNum, KFB_MAX_KICK_PlAYER_COUNT) do
		nMSIdx, nPIdx = GetNextPlayer(this.missionID, nMSIdx, 0);
		PlayerIndex = nPIdx;
		DelMSPlayer(this.missionID, 0);
	end
end

phase_kfb_end.actions = {
	[1] = phase_kfb_end.Init,
};

phase_kfb_end.cycActions = {
	[3] = {
		[0] = {
			phase_kfb_end.kick_player,
		},
		start = 30,
	},
}

function phase_kfb_end:onTimeout()
	CloseMission(this.missionID);
end

---------------------------------------------------------------------
phase_kfb = {
	phases = {
		phase_kfb_idle,
		phase_kfb_waiting,
		phase_kfb_fighting,
		phase_kfb_end,
	},
	maxsecond = g_TotalPhaseTime,
	timerID = KFB_MS_TIMER_ID,
}
phase_kfb = inherit(phaseBase, phase_kfb)

print(format("======phase_kfb.maxsecond = %d =========", phase_kfb.maxsecond)) 

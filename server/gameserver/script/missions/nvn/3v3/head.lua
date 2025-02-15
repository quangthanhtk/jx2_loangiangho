Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\missions\\nvn\\battle\\battle_head.lua")
Include("\\script\\lib\\floyd.lua")
Include("\\script\\missions\\nvn\\3v3\\3v3define.lua")
Include("\\script\\global\\xvx_callback.lua")

thisCBFile = "\\script\\missions\\nvn\\3v3.lua";

MATCH_CYCLE_TIME = 28
MAX_ROUND_DAILY = 12
WARTEAM_SIZE = 3
SIFT_LOSE_COUNT = 2
FINALS_TEAM_COUNT = 32

BS_REST = 0
BS_DAYMATCH = 1
BS_PRELIMINARY = 2
BS_FINALS = 3
----sdb data-------------------------------------------
SDBKEY_3V3 = " _3V3_DATA_";
--nkey = 0, 0		-- 赛程数据
--  Item["BattleDate"] = {"ddddd", self.dateMatchStart:tonumber(), self.dateFinals:tonumber(), 
--			PreLiminaryFinish or 0, FinalsFinish or 0, nMatchRound or 1}
--nKey = 1, gsId	-- 每日场次数据
--	Item["DailyData"] = {"dd", gf_TodayDate(), nRound};
--nkey = 2, 0		-- 赛季
--	Item["GlobalMatchRound"] = {"dd", nMatchRound, 0};
--nkey = 3, 1		-- 决赛队伍
--	Item[i] = {"s", tTeams[i].name};

----sdb data-------------------------------------------
SDBKEY_RANK_LOCAL = "XVX_RANK_LOCAL";
SDBKEY_RANK_GLOBAL = "XVX_RANK_GLOBAL";
SDBKEY_RANK_LOCAL_COPY = "XVX_RANK_LOCAL_COPY";
SDBKEY_RANK_GLOBAL_COPY = "XVX_RANK_GLOBAL_COPY";
--nKey = 0, 0		-- 排名数据
----sdb data-------------------------------------------
SDBKEY_3V3_MATCH_RANK = " _3v3_Match_Rank";
--nKey = 0, nMatchRound
--	Item[i] = {"fsfsfs...", FightTeamID, FightTeamName,...}
----sdb data-------------------------------------------
SDBKEY_3V3_FIGHTTEAM_RANK = " _3V3_FT_RANK";
--nKey = 0, 0		-- 战队排名数据
----sdb data-------------------------------------------
SDBKEY_3V3_MATCH_AWARD = " _3V3_MATCH_AWARD";
--nKey = 0, nMatchRound
--	Item[Name] = {"d", nRank}
----sdb data end---------------------------------------

g_t3v3Data = {}

K3v3Hall = {
	SetBattleState = P3v3_SetBattleState,
	SetProgress = P3v3_SetProgress,
	SetTimer = P3v3_SetTimer,
}

DayMatch = {}

Preliminary = {
	tLoser = {},
}

Finals = {
	tMatchList = {
		01,32,16,17,09,24,08,25,05,28,12,21,13,20,04,29,
		02,31,15,18,10,23,07,26,06,27,11,22,14,19,03,30,
	},
}


-- DailyCleaner & K3v3Hall::Init
function OnInit()
	DebugOutput("3v3 OnInit--->")
--	SendGlbDBData(2, 
-- [[CREATE TABLE IF NOT EXISTS `XvX_FightTeam_Rank` (
--	`TeamName` CHAR(64) NOT NULL, 
--	`LeaderName` CHAR(64),
--	`Score` INTEGER(11), 
--	PRIMARY KEY  (`TeamName`))]]);
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		SDBCallBack(SDBKEY_3V3, 0, 0, cbGetData);
	end
end

function cbGetData(nCount, sdbData)
	DebugOutput("cbGetData",CALL_SCRIPT_NAME)
	DebugOutput("cbGetData",nCount, sdbData)
	local tdata = {}
	if nCount > 0 then
		tdata = sdbData["BattleDate"];
	end
	DebugOutput("Th阨 gian h鉧 s� li謚",Val2Str(tdata));
	g_t3v3Data:Init(tdata)
end

function g_t3v3Data:Init(tData)
	local today = Date();
	DebugOutput("today =", Val2Str(today))
	----------------------
	self:resetDate(tData);	
	DebugOutput("dateMatchStart =", Val2Str(self.dateMatchStart))
	DebugOutput("datePreLiminary =", Val2Str(self.datePreLiminary))
	DebugOutput("dateFinals =", Val2Str(self.dateFinals))
	if today >= self.datePreLiminary and self.PreLiminaryFinish < 1 then
		self.battleState = BS_PRELIMINARY;
	elseif today >= self.dateFinals and self.FinalsFinish < 1 then
		if today:week() ~= 0 and today:week() ~= 6 then
			self.battleState = BS_REST;
		else
			self.battleState = BS_FINALS;
		end
	elseif today >= self.datePreLiminary then
		self.battleState = BS_REST;
	elseif today >= self.dateMatchStart then
		self.battleState = BS_DAYMATCH;
	else
		self.battleState = BS_REST;
	end
	K3v3Hall.SetBattleState(self.battleState);
	if self.battleState ~= BS_REST then
		SetStartTime();
	else
		SetStartTime(1);
	end
	if self.battleState == BS_DAYMATCH then
		CurProgress = today - self.dateMatchStart + 1;
		DebugOutput("CurProgress, self.nDay_Match",CurProgress, self.nDay_Match)
		K3v3Hall.SetProgress(CurProgress, self.nDay_Match);
	elseif self.battleState == BS_REST then
		DebugOutput("today:week(), self.nDay_Rest",today:week(), self.nDay_Rest)
		K3v3Hall.SetProgress(today:week(), self.nDay_Rest);
	end
	DebugOutput("===========================>")
	DebugOutput("L辌h thi u:",Val2Str(self))
	DebugOutput("===========================<")

	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		if self.battleState == BS_FINALS then
			Finals.Init();
		elseif self.battleState == BS_DAYMATCH then
			DayMatch:Init();
		end
	end
end

function g_t3v3Data:resetDate(tData)
	tData = tData or {}
	local ndateMatchStart, ndateFinal, PreLiminaryFinish, FinalsFinish, nMatchRound = tData[1], tData[2], tData[3] or 0, tData[4] or 0, tData[5] or 1;
	DebugOutput("Th阨 gian h鉧 s� li謚",ndateMatchStart, ndateFinal, PreLiminaryFinish, FinalsFinish, nMatchRound);
	local today = Date();
	
	local minStartDate = today+7
	if ndateMatchStart and (ndateMatchStart < 20161114 or ndateMatchStart > minStartDate:tonumber())  then --正式开赛之前强制清理赛程
		DebugOutput("Cng ch� reset l辌h thi u b蕋 thng",today, ndateMatchStart, ndateFinal, PreLiminaryFinish, FinalsFinish, nMatchRound)
		WriteGsLog(4, format("[3v3]force init error match today=%d, start=%d final=%d prefinish=%d finalfinsh=%d round=%d", today:tonumber(), ndateMatchStart, ndateFinal, PreLiminaryFinish, FinalsFinish, nMatchRound))
		ndateMatchStart, ndateFinal, PreLiminaryFinish, FinalsFinish, nMatchRound = nil, nil, nil, 0, 0, 1
	end
	
	--有赛程了1
	if ndateMatchStart and ndateFinal then
		local dateMatchStart = ndateMatchStart and nDate2Date(ndateMatchStart);
		DebugOutput("dateMatchStart =", Val2Str(dateMatchStart));
		local dateFinal = ndateFinal and nDate2Date(ndateFinal);
		DebugOutput("dateFinal = ", Val2Str(dateFinal));
		
		--是否强制跨赛程
		if today > dateFinal and FinalsFinish < 1  then
			DebugOutput("Cng ch� l辌h tr譶h li猲 u")
			FinalsFinish = 1;
		end
			
		if FinalsFinish > 0 then					--跨赛程1.1
			DebugOutput("T竔 thi誸 l辌h thi li猲 u");
			nMatchRound = nMatchRound + 1;
			if not self:MatchProcess(nMatchRound) then
				return
			end
			self.nMatchRound = nMatchRound;
			self.PreLiminaryFinish = 0;
			self.FinalsFinish = 0;
			self.nDay_Rest =  dateFinal:week();
			if self.nDay_Rest ~= 0 then 
				self.nDay_Rest = 7 - dateFinal:week();
			end
			self.dateMatchStart = dateFinal + self.nDay_Rest + 1;
			self.dateFinals = self.dateFinals or (self.dateMatchStart + MATCH_CYCLE_TIME - 1);
			self.datePreLiminary = self.dateFinals - 1;
			self.nDay_Match = self.dateFinals - self.dateMatchStart + 1;
			
			local s = SDB(SDBKEY_3V3, 0, 0);
			--如果跨服是多GS的情况，这里就要限定一个GS执行
			--if GetGSIndex()[0] == 1 then
			DebugOutput("T竔 thi誸 l辌h u:",self.dateMatchStart:tonumber(), self.dateFinals:tonumber(), 
				self.PreLiminaryFinish or 0, self.FinalsFinish or 0, self.nMatchRound or 1);
			s["BattleDate"] = {"ddddd", self.dateMatchStart:tonumber(), self.dateFinals:tonumber(), 
				self.PreLiminaryFinish or 0, self.FinalsFinish or 0, self.nMatchRound or 1};
			--end
			--全局排名数据库操作
			_CrossMatchCopyDatabase(SDBKEY_RANK_GLOBAL, SDBKEY_RANK_GLOBAL_COPY);
			
			local msg = "Li猲 u Чi H閕 T� V� 3V3 s� m� gi秈 u qu� m韎 v祇 10 gi� s竛g h玬 nay, xin c竎 i hi謕 ng nh藀 l筰 game trc khi m� gi秈 u qu� m韎,  m b秓 x誴 h祅g qu� trc b譶h thng!"
			Msg2Global(msg);
			AddGlobalNews(msg, 1);
		else											--不跨，初始化数据1.2
			DebugOutput("T竔 thi誸 l辌h thi li猲 u".."-NOT");
			self.nMatchRound = nMatchRound;
			self.PreLiminaryFinish = PreLiminaryFinish;
			self.FinalsFinish = FinalsFinish;
			self.nDay_Rest = 0;
			self.dateMatchStart = dateMatchStart;
			self.dateFinals = dateFinal;
			self.datePreLiminary = dateFinal - 1;
			self.nDay_Match = dateFinal - dateMatchStart + 1;
		end
	--还没赛程2
	else
		DebugOutput("***Init Match***");
		nMatchRound = nMatchRound;
		if not self:MatchProcess(nMatchRound) then
			return
		end
		self.nMatchRound = nMatchRound;
		self.PreLiminaryFinish = 0;
		self.FinalsFinish = 0;
		local dateFinal = today - 1;
		self.nDay_Rest =  dateFinal:week();
		if self.nDay_Rest ~= 0 then 
			self.nDay_Rest = 7 - dateFinal:week();
		end
		self.dateMatchStart = dateFinal + self.nDay_Rest + 1;
		self.dateFinals = self.dateFinals or (self.dateMatchStart + MATCH_CYCLE_TIME - 1);
		self.datePreLiminary = self.dateFinals - 1;
		self.nDay_Match = self.dateFinals - self.dateMatchStart + 1;
		
		local s = SDB(SDBKEY_3V3, 0, 0);
		--如果跨服是多GS的情况，这里就要限定一个GS执行
		--if GetGSIndex()[0] == 1 then
		DebugOutput("T竔 thi誸 l辌h u:",self.dateMatchStart:tonumber(), self.dateFinals:tonumber(), 
			self.PreLiminaryFinish or 0, self.FinalsFinish or 0, self.nMatchRound or 1);
		s["BattleDate"] = {"ddddd", self.dateMatchStart:tonumber(), self.dateFinals:tonumber(), 
			self.PreLiminaryFinish or 0, self.FinalsFinish or 0, self.nMatchRound or 1};
		--end
		--全局排名数据库操作
		_CrossMatchCopyDatabase(SDBKEY_RANK_GLOBAL, SDBKEY_RANK_GLOBAL_COPY);
	end
end

function g_t3v3Data:MatchProcess(nMatchRound)
	local s = SDB(SDBKEY_3V3, 2, 0)
	s["GlobalMatchRound"] = {"dd", nMatchRound, 0};
	return 1;
end

function SetStartTime(bTodayOver)
	local nHour, nMinute, nSecond = tonumber(date("%H")), tonumber(date("%M")), tonumber(date("%S"));
	--开启时间(整点)
	local nStart = 21;
	local nEnd = 22;
	if bTodayOver == 1 or (nHour >= nEnd and nMinute >= 30) then
		nHour = nStart - nHour - 1 + 24;
		nMinute = 59 - nMinute;
		nSecond = 60 - nSecond;
	elseif nHour < nStart then
		nHour = nStart - nHour - 1;
		nMinute = 59 - nMinute + 5;
		nSecond = 60 - nSecond;
	else
		nHour = 0;
		nMinute = 5 - mod(nMinute, 5);
		nSecond = 60 - nSecond;
	end
	local nTime = nHour * 3600 + nMinute * 60 + nSecond;
	DebugOutput(format("[3v3 init] v祇 l骳 %d gi� %d ph髏 %d gi﹜ (%d gi﹜) sau khi m�!",nHour, nMinute, nSecond, nTime));
	K3v3Hall.SetTimer(nTime * 18);
end

function GetRoundToday(cb)
	if g_nTodayRoundDate ~= gf_TodayDate() or not g_nTodayRound then
		local gsId = GetGSIndex()[0];
		SDBCallBack(SDBKEY_3V3, 1, gsId, callout(GetRoundTodayCB, cb));
		return
	end
	return g_nTodayRound;
end

function GetRoundTodayCB(cb, nCount, sdbData)
	DebugOutput(nCount, sdbData)
	local tData = sdbData["DailyData"];
	local ndate, nRound = tData[1], tData[2];
	if ndate ~= gf_TodayDate() then
		nRound = 0;
		sdbData["DailyData"] = {"dd", gf_TodayDate(), nRound};
	end
	g_nTodayRound = nRound;
	g_nTodayRoundDate = gf_TodayDate();
	cb(nRound);	
end

function SetRoundToday(nCount)
	local gsId = GetGSIndex()[0];
	local sdbData = SDB(SDBKEY_3V3, 1, gsId);
	sdbData["DailyData"] = {"dd", gf_TodayDate(), nCount};
	g_nTodayRound = nCount;
	g_nTodayRoundDate = gf_TodayDate();
end

--角色跨赛季
function _3v3_CrossMatchRetsetPlayerTask(nCount, data)
	local nMapId, nX, nY = GetWorldPos();
	local nVersion, nCurGs = GetRealmType();
	if nCurGs == 0 and nMapId == 200 then
		DebugOutput("_3v3_CrossMatchRetsetPlayerTask", nCount, data);
		if not nCount then
			return g_3v3DataMgr:getData("LocalMatchRound", _3v3_CrossMatchRetsetPlayerTask);
		end
		local nCurMatchRound = data["LocalMatchRound"][1] or 0;
		DebugOutput("nCurMatchRound , GetTask(TASKID_3V3_MATCH_ROUND)", nCurMatchRound, GetTask(TASKID_3V3_MATCH_ROUND));
		if GetTask(TASKID_3V3_MATCH_ROUND) < nCurMatchRound then
			DebugOutput("_3v3_CrossMatchRetsetPlayerTask -------> YES");
			local lastScore = GetTask(TASKID_3V3_SCORE_TOTAL);
			local historyScore = GetTask(TASKID_3V3_MAX_SCORE_HISTORY);
			SetTask(TASKID_3V3_BATTLE_SCORE, 0);		-- Rank分
			SetTask(TASKID_3V3_VIC_RATE, 0);		-- 胜率 = 总胜场 / 总场
			SetTask(TASKID_3V3_SCORE_TOTAL, 0);		-- 赛季积分
			SetTask(TASKID_3V3_SCORE_LAST, lastScore);		-- 上赛季积分
			SetTask(TASKID_3V3_MAX_SCORE_HISTORY, max(lastScore, historyScore));		-- 历史最高积分
			SetTask(TASKID_3V3_WIN_ROUND_MATCH, 0);		-- 赛季总胜场
			SetTask(TASKID_3V3_WIN_ROUND_TOTAL, 0);
			SetTask(TASKID_3V3_TOTAL_ROUND_MATCH, 0);		-- 赛季总场
			SetTask(TASKID_3V3_TOTAL_ROUND, 0); -- 总场数
			SetTask(TASKID_3V3_KILL_TOTAL, 0);
			SetTask(TASKID_3V3_DEAD_TOTAL, 0);
			SetTask(TASKID_3V3_KILL_MATCH, 0);		-- 赛季人头
			SetTask(TASKID_3V3_DEAD_MATCH, 0);		-- 赛季死亡
			SetTask(TASKID_3V3_BATTLE_POWER, 0);		-- 战斗力 = rank分数*1.5+胜率*3000*(总场/(总场+10))+min(总胜场*1, 3000)
			SetTask(TASKID_3V3_ESCAPE_MATCH, 0);		-- 赛季他哦普
			SetTask(TASKID_3V3_ESCAPE_TOTAL, 0);
			SetTask(TASKID_3V3_LOSE_ROUND_MATCH, 0);
			SetTask(TASKID_3V3_MATCH_ROUND, nCurMatchRound);
			SetTask(TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_TOTAL	, 0);
			SetTask(TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_USED	, 0);
			SetTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_TOTAL, 0);
			SetTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_USED	, 0);
			SetTask(TASKID_3V3_MATCH_FIGHTTEAM_SCORE, 0);	-- 战队积分
			local lastDay = GetTask(TASKID_3V3_AWARD_DAILY_DATE);
			if lastDay < gf_TodayDate() then
				SetTask(TASKID_3V3_WIN_ROUND_DAILY, 0);
				SetTask(TASKID_3V3_AWARD_DAILY_DATE, gf_TodayDate());
			end
			--跨了赛季了----
			gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 3, 1);
			gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 4, 1);
			----------------
			WriteLog(format("[3V3 PassMatch] [Role:%s Acc:%s] [lastScore=%d, newMatchRound=%d]",
				GetName(), GetAccount(), lastScore, nCurMatchRound));
		elseif GetTask(TASKID_3V3_MATCH_ROUND) > nCurMatchRound then
			DebugOutput("_3v3_CrossMatchRetsetPlayerTask -------> season exception");
			local myMatchRound = GetTask(TASKID_3V3_MATCH_ROUND);
			SetTask(TASKID_3V3_BATTLE_SCORE, 0);		-- Rank分
			SetTask(TASKID_3V3_VIC_RATE, 0);		-- 胜率 = 总胜场 / 总场
			SetTask(TASKID_3V3_SCORE_TOTAL, 0);		-- 赛季积分
			SetTask(TASKID_3V3_SCORE_LAST, 0);		-- 上赛季积分
			SetTask(TASKID_3V3_MAX_SCORE_HISTORY, 0);		-- 历史最高积分
			SetTask(TASKID_3V3_WIN_ROUND_MATCH, 0);		-- 赛季总胜场
			SetTask(TASKID_3V3_WIN_ROUND_TOTAL, 0);
			SetTask(TASKID_3V3_TOTAL_ROUND_MATCH, 0);		-- 赛季总场
			SetTask(TASKID_3V3_TOTAL_ROUND, 0); -- 总场数
			SetTask(TASKID_3V3_KILL_TOTAL, 0);
			SetTask(TASKID_3V3_DEAD_TOTAL, 0);
			SetTask(TASKID_3V3_KILL_MATCH, 0);		-- 赛季人头
			SetTask(TASKID_3V3_DEAD_MATCH, 0);		-- 赛季死亡
			SetTask(TASKID_3V3_BATTLE_POWER, 0);		-- 战斗力 = rank分数*1.5+胜率*3000*(总场/(总场+10))+min(总胜场*1, 3000)
			SetTask(TASKID_3V3_ESCAPE_MATCH, 0);		-- 赛季他哦普
			SetTask(TASKID_3V3_ESCAPE_TOTAL, 0);
			SetTask(TASKID_3V3_LOSE_ROUND_MATCH, 0);
			SetTask(TASKID_3V3_MATCH_ROUND, nCurMatchRound);
			SetTask(TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_TOTAL	, 0);
			SetTask(TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_USED	, 0);
			SetTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_TOTAL, 0);
			SetTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_USED	, 0);
			SetTask(TASKID_3V3_MATCH_FIGHTTEAM_SCORE, 0);	-- 战队积分
			local lastDay = GetTask(TASKID_3V3_AWARD_DAILY_DATE);
			if lastDay < gf_TodayDate() then
				SetTask(TASKID_3V3_WIN_ROUND_DAILY, 0);
				SetTask(TASKID_3V3_AWARD_DAILY_DATE, gf_TodayDate());
			end
			--排名清零
			local nLastRank = GetTask(TASKID_LAST_MATCH_RANK);
			local nCurRank = GetTask(TASKID_CUR_MATCH_RANK);
			SetTask(TASKID_LAST_MATCH_RANK, 0);
			SetTask(TASKID_CUR_MATCH_RANK, 0);
			--周赛记录清零
			SetTask(TASKID_3V3_LASTWEEK_FIGHT_TIMES, 0); --上周战况清零
			SetTask(TASKID_3V3_WEEK_FIGHT_TIMES, 0); --本周战况清零
			SetTask(TASKID_3V3_AWARD_TAG, 0); 			--领奖标记清零
			Msg2Player("S� li謚 3v3 kh竎 thng,  reset")
			local msg = format("[3V3 ERROR] [season exception] [Role:%s Acc:%s] [myMatchRound=%d, curMatchRound = %d, last rank value=%d, cur rank value=%d]",
				GetName(), GetAccount(), myMatchRound, nCurMatchRound, nLastRank, nCurRank);
			DebugOutput(msg);
			WriteLog(msg);
		end
	end
	--赛季跨完了(必须在跨完赛季之后)，我要更新排名
	DebugOutput("_3v3_CrossMatchRetsetPlayerTask -------> tag =", gf_GetTaskByte(TASKID_3V3_AWARD_TAG, 3), gf_GetTaskByte(TASKID_3V3_AWARD_TAG, 4))
	Update3v3RankData(gf_GetTaskByte(TASKID_3V3_AWARD_TAG, 3));
end

--每场3v3奖励
--function _3v3_every_match_award()
--	local nExp = GetTask(TASKID_3V3_EVERY_MATCH_EXP);
--	local nYinJuan = GetTask(TASKID_3V3_EVERY_MATCH_YINJUAN);
--	DebugOutput("_3v3_every_match_award",nExp, nYinJuan)
--	if nExp > 0 then
--		SetTask(TASKID_3V3_EVERY_MATCH_EXP, 0);
--		gf_ModifyExp(nExp);
--	end
--	if nYinJuan > 0 then
--		SetTask(TASKID_3V3_EVERY_MATCH_YINJUAN, 0);
--		ModifyYinJuan(nYinJuan, 1);
--	end
--end

--源服跨赛季
--删除排名数据库
function _3v3_System_Task()
	DebugOutput("_3v3_System_Task")
	if GetGSIndex()[0] == 2 then
		SDBCallBack(SDBKEY_3V3, 2, 0, update3v3MatchRank)
	end
end

function update3v3MatchRank(nCount, s)
	DebugOutput("update3v3MatchRank", nCount, s)
	local nRound, bAwarded = 1, 0
	if nCount > 0 then
		local tData = s["LocalMatchRound"];
		nRound, bAwarded = tData[1] or 1, tData[2] or 0;
	end
	local s = SDB(SDBKEY_3V3, 2, 0, 2)
	DebugOutput(format("Qu� hi謓 t筰: %d", nRound));
	s:apply2(callout(update3v3MatchRankCB2, nRound, bAwarded));
end

function update3v3MatchRankCB2(nRound, bAwarded, nCount, s)
	DebugOutput("update3v3MatchRankCB2",nRound, bAwarded, nCount, s)
	if nCount <= 0 then
		DebugOutput("Kh玭g c� s� li謚 to祅 cu閏, ph竧 thng th蕋 b筰");
		return
	end
	local tData = s["GlobalMatchRound"];
	DebugOutput("GlobalMatchRound =",tData[1])
	local nGlbMatchRound = tData[1] or 0;
	if nRound < nGlbMatchRound then
		local localSDB = SDB(SDBKEY_3V3, 2, 0);
		localSDB["LocalMatchRound"] = {"dd", nGlbMatchRound, 1};
		localSDB:reflash();
		DebugOutput(format("To祅 cu閏 u qu�: %d", nGlbMatchRound));
		_CrossMatchCopyDatabase(SDBKEY_RANK_LOCAL, SDBKEY_RANK_LOCAL_COPY);
	end
end

--源服跨赛季信息
function _3v3_System_Task_Msg()
	DebugOutput("_3v3_System_Task_Msg")
	if GetGSIndex()[0] == 2 then
		SDBCallBack(SDBKEY_3V3, 2, 0, update3v3MatchRank_Msg)
	end
end

function update3v3MatchRank_Msg(nCount, s)
	DebugOutput("update3v3MatchRank_Msg", nCount, s)
	local nRound, bAwarded = 1, 0
	if nCount > 0 then
		local tData = s["LocalMatchRound"];
		nRound, bAwarded = tData[1] or 1, tData[2] or 0;
	end
	DebugOutput("nRound, bAwarded =", nRound, bAwarded)
	if bAwarded == 1 then
		local msg = "Чi h閕 t� v� 3 vs 3  甶 n qu� u m韎!"
		msg = msg.."Ngi ch琲 c� th� 甶 b祅  Bi謓 Kinh i m韎 x誴 h筺g 3 vs 3 qu� trc v� nh薾 thng."
		Msg2Global(msg);
		AddGlobalNews(msg, 1);
		local localSDB = SDB(SDBKEY_3V3, 2, 0);
		localSDB["LocalMatchRound"] = {"dd", nRound, 0};
		localSDB:reflash();
		--更新Core排名数据
		OnArrive_LocalRank();
		OnArrive_GlobalRank();
	end
end

--SDBKEY_RANK_GLOBAL_COPY
function _CrossMatchCopyDatabase(szKey, szKeyCopy)
	--删除以前的备份排名
	local sdbRankCopy = SDB(szKeyCopy, 0, 0);
	sdbRankCopy:delete();
	--当前数据库拷贝
	local sdbRank = SDB(szKey, 0, 0);
	sdbRank:apply2(callout(_CrossMatchCopyDatabaseCB, szKey, szKeyCopy));
end

function _CrossMatchCopyDatabaseCB(szKey, szKeyCopy, nCount, sdb)
	DebugOutput("_CrossMatchCopyDatabaseCB nCount, sdb =",nCount, sdb);
	if nCount <= 0 then
		DebugOutput("_CrossMatchCopyDatabaseCB nCount <= 0 return 0");
		return 0;
	end
	--备份排名
	local sdbCopy = SDB(szKeyCopy, 0, 0);
	sdbCopy.sortType = 2;
	--copy
	local nSum = 0;
	for i = 0, nCount - 1 do
		local tData = sdb[i];
		if tData and tData[1] then
			DebugOutput(tData[1], tData[2], tData[3], tData[4]);
			sdbCopy[tData[1]] = {"dds", tData[2], tData[3], tData[4]};
			nSum = nSum + 1;
		end
	end
	DebugOutput("_CrossMatchCopyDatabaseCB copy Sum = ", nSum);
	--拷贝完成，删除跨服排名数据库，完成跨赛季
	local sdbOrg = SDB(szKey, 0, 0); 
	sdbOrg:delete();
	sdbOrg:reflash();
	DebugOutput("[3v3] [GGS] cross match ---------> seccussful!!!");
	WriteLog("[3v3] [GGS] cross match ---------> seccussful!!!");
end

--根据轮次和index随机
function get_rand_value(nMax)
	local nSeed = (gTodayRound * 353 + 1213) + (PlayerIndex * 7681 + 593)
	local nRand = mod(nSeed * 9733 + 3137, 65537)
	local r = mod(nRand, nMax)
	return r
end
--获取比赛段位
gtLvStage ={
	--699,1099 -- goc
	1099
}
function get_lv_stage(pidx)
	local nOldPlayerIndex = PlayerIndex
	local nRet = 0
	if type(pidx) == "table" then
		nRet = get_lv_stage(pidx[1])
	else
		PlayerIndex = pidx or PlayerIndex
		local nLv = gf_GetTransLevel()
    	for i=1,getn(gtLvStage) do
    		if nLv <= gtLvStage[i] then
    			nRet = i
    			break
    		end
    	end
	end
	PlayerIndex = nOldPlayerIndex
	return nRet
end

function get_sort_value(pidx)
	local nOldPlayerIndex = PlayerIndex
	local nVal = 0
	if type(pidx) == "table" then
		for i=1,getn(pidx) do
			local nTemp = get_sort_value(pidx[i])
			nVal = max(nVal,nTemp)
		end
	else
		PlayerIndex = pidx or PlayerIndex
		nVal = get_lv_stage() * 10000*10000 + GetTask(TASKID_3V3_WIN_ROUND_DAILY)*100 + get_rand_value(100) --最后加一个随机值，胜场一样的顺序随机，防止最后一个人始终匹配不上
	end
	PlayerIndex = nOldPlayerIndex
	
	return nVal
end

G_3V3_BEGIN_TIME = MkTime(2016, 11, 14, 0, 0, 0) 	--2016-11-14 Monday
G_3V3_SEASON_WEEKS = 4 								--每赛季4周

--return season_no, season_week_no, day_no
function get_match_stage()
	local day = 3600 * 24
	local week = day * 7
	local now = GetTime()
	local season_no, season_week_no, day_no = 0, 0, 0
	if now >= G_3V3_BEGIN_TIME then
		local dur = now - G_3V3_BEGIN_TIME
		local week_no = floor(dur / week)
		season_no = floor(week_no / G_3V3_SEASON_WEEKS) + 1
		season_week_no = mod(week_no, G_3V3_SEASON_WEEKS) + 1
		local day_no_all = floor(dur / day)
		day_no = mod(day_no_all, 7) + 1
	end
	--print(G_3V3_BEGIN_TIME, now, now-G_3V3_BEGIN_TIME)
	--print(season_no, season_week_no, day_no)
	return season_no, season_week_no, day_no
end

--是否为开赛日 0 非比赛日 1日赛 2淘汰赛 3决赛
function get_match_day_type()
	local season_no, season_week_no, day_no = get_match_stage()
	if season_no <= 0 then
		return 0 --非比赛日
	elseif season_week_no < G_3V3_SEASON_WEEKS or day_no < 6 then
		return 1 --日赛
	elseif day_no == 6 then
		return 2 --淘汰赛
	elseif day_no == 7 then
		return 3 --决赛
	end
	return 0 --非比赛日
end

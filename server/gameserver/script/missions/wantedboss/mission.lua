

Include("\\settings\\static_script\\missions\\base\\callfuture.lua");
Include("\\script\\missions\\wantedboss\\stages\\stage_idle.lua")
Include("\\script\\missions\\wantedboss\\stages\\stage_fight.lua")
Include("\\script\\missions\\wantedboss\\stages\\stage_finish.lua")


this.msOption.szInitDeahScript = thisFile;
this.msOption.bSetPkFlag = 0; --练功模式
this.msOption.bSetPkCamp = 0;
this.msOption.bForbitSuperSkill = 1;
this.msPosition.entryPos = {
	[tWantedBossMAP[0].realMapID] = tWantedBossMAP[0].entryPos,
	[tWantedBossMAP[1].realMapID] = tWantedBossMAP[1].entryPos,
	[tWantedBossMAP[2].realMapID] = tWantedBossMAP[2].entryPos,
	[tWantedBossMAP[3].realMapID] = tWantedBossMAP[3].entryPos,
}
tWBMission.msPosition.exitPos = tWBExitPos

----------------------------------------------------------------------

PhaseDriver = {
	timerID = 126, --计时器 唯一ID,查看配置表 CH
	maxsecond = TOTAL_TIME,
	guage = {
		msg = "V� L﹎ Truy S竧 L謓h",
		time = TOTAL_TIME,
		cyc = 0,
		id = 1,
	},
	phases= {},
};
PhaseDriver = gf_CopyInherit(phaseBase,PhaseDriver)
PhaseDriver.phases = {
	wb_stage_idle,
	wb_stage_fight,
	wb_stage_finish,
}
this.msPhases = { PhaseDriver }

this.msOption.OnPlayerJoin = function(self, nCamp)
	local nType = GetMissionV(tWBMission.mvBossDifficult)
	SetTask(WB_TSKID_MISSION_DEAD, 0)
	SetTask(WB_TSKID_MS_END_SIGNAL, 1)
	wb_runtime_stat(WB_STAT_ENTERMISSION, nType, 1)
end

this.msOption.OnPlayerLeave = function(self, nCamp)
	local nResult = GetMissionV(this.mvResult)
	if nResult == 0 and GetTask(WB_TSKID_MS_END_SIGNAL) == 1 then
		-- 未成功时离开副本，都算失败
		local nIdx = GetMissionV(tWBMission.mvBossDifficult) + 1
		local tAward = tWB_AWARD[nIdx]
		local nGetBounty = floor(tAward.Bounty * 0.1)
		local nGetRating = floor(tAward.Rating * 0.1)
		
		local nKillCoinGot = GetTask(WB_TSKID_DAILY_KILLCOIN)
		local nCanGet = min(nGetBounty, WB_KILL_COIN_DAILY_LIMIT - nKillCoinGot)
		SetTask(WB_TSKID_DAILY_KILLCOIN, nKillCoinGot + nCanGet)
		SetTask(WB_TSKID_COIN, GetTask(WB_TSKID_COIN) + nCanGet)
		SetTask(WB_TSKID_RATING, GetTask(WB_TSKID_RATING) + nGetRating)
		Msg2Player(format("Khi猽 chi課 th蕋 b筰! Nh薾 頲 Thng Truy S竧: %d, 觤: %d!", nCanGet, nGetRating))
	end
	SetTask(WB_TSKID_MS_END_SIGNAL, 0)
end

this.msPosition.getEntryPos = function(self, nCamp)
	local pos = self.entryPos[self:getTemplateMapID()];
	if type(pos[1]) == "table" then
		pos = pos[nCamp] or pos[1];
	end
	return self:getMapID(), gf_UnPack(pos);
end

this.msPosition.getExitPos = function(self, nCamp)
	for i = 1, getn(self.exitPos) do
		local map = self.exitPos[i]
		if SubWorldID2Idx(map[1]) >= 0 then
			return map[1],map[2],map[3]
		end
	end
	return 300, 1700, 3536;
end


function tWBMission:onMissionInit()
	SetMissionV(this.mvResult, 0)
end

function PhaseDriver:onTimeout()
	wb_mission_failed()
end

Include("\\script\\missions\\wantedboss\\head.lua")
wb_stage_finish = {
	name = "Khi猽 chi課 k誸 th骳",
	maxsecond = END_TIME, --1分钟
	actionsType = "second",
	guage = {
		msg = "Khi猽 chi課 k誸 th骳",
		time = END_TIME,
		cyc = 0,
		id = 2,
	},
};
wb_stage_finish =  inherit(cycPhase, wb_stage_finish);

function wb_stage_finish.onTimeout()
	CloseMission(this.missionID);
end

function wb_stage_finish.Breathe()
	if GetMSPlayerCount(this.missionID) == 0 then
		-- 副本里没人了
		if nResult == 0 then
			WantedBossChallengeFinished(GetMissionV(this.mvBossID), 0)
		end
		wb_mission_failed()
	end
end

wb_stage_finish.actions = {
	[15] = wb_mission_failed, --送出关卡
};

wb_stage_finish.cycActions = {
	[5] = {
		[0] = {wb_stage_fight.Breathe, },
	},
};
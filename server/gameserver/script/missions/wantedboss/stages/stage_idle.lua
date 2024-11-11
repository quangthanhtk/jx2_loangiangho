Include("\\script\\missions\\wantedboss\\head.lua")
wb_stage_idle = {
	name = "Giai Æoπn chu»n bﬁ",
	maxsecond = PREPARE_TIME,
	actionsType = "second",
	guage = {
		msg = "Giai Æoπn chu»n bﬁ",
		time = PREPARE_TIME,
		cyc = 0,
		id = 2,
	},
};
wb_stage_idle 	=  inherit(cycPhase, wb_stage_idle);

function wb_stage_idle.Init()

	local mapId = this.msPosition:getMapID();
	local npcPos = tWantedBossMAP[GetMissionV(this.mvBossDifficult)].exitNpcPos
	local npcIdx = CreateNpc(WB_NPC_TEMP, WB_NPC_NAME, mapId, npcPos[1], npcPos[2])
	SetNpcScript(npcIdx,"\\script\\missions\\wantedboss\\exitnpc.lua")
	
end

function wb_stage_idle.Breathe()
	if GetMSPlayerCount(this.missionID) == 0 then
		-- ∏±±æ¿Ô√ª»À¡À
		if nResult == 0 then
			WantedBossChallengeFinished(GetMissionV(this.mvBossID), 0)
		end
		wb_mission_failed()
	end
end


function wb_stage_idle.onTimeout()
	finish_current_stage()
end




wb_stage_idle.actions = {
	[1] = wb_stage_idle.Init,
}
wb_stage_idle.cycActions = {
	[5] = {
		[0] = {wb_stage_idle.Breathe, },
	},
};
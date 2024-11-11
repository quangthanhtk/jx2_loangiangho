
Include("\\script\\missions\\wantedboss\\head.lua")
wb_stage_fight = {
	name = "Chi�n ��u",
	maxsecond = FIGHT_TIME, 
	actionsType = "second",
	guage = {
		msg = "Chi�n ��u",
		time = FIGHT_TIME,
		cyc = 0,
		id = 2,
	},
};

wb_stage_fight 	=  inherit(cycPhase, wb_stage_fight);

function create_boss()
	local mapId = this.msPosition:getMapID();
	local Boss = tBOSS[GetMissionV(this.mvBossTemplete)]
	local BossPos = tWantedBossMAP[GetMissionV(this.mvBossDifficult)].bossPos
	local npcIdx = CreateNpc(Boss.templete, Boss.name, mapId, BossPos[1], BossPos[2])
	SetNpcLifeTime(npcIdx, FIGHT_TIME)
	SetNpcDeathScript(npcIdx, "\\script\\missions\\wantedboss\\main.lua")
end

function wb_stage_fight.Init()
	create_boss()
end

function wb_stage_fight.Breathe()
	if GetMSPlayerCount(this.missionID) == 0 then
		-- ������û����
		if nResult == 0 then
			WantedBossChallengeFinished(GetMissionV(this.mvBossID), 0)
		end
		wb_mission_failed()
	end
end

function wb_stage_fight:onTimeout()
    tWBMission.msCamp:turnPlayer(1, 
        function()
            Msg2Player("Khi�u chi�n th�t b�i!")
        end
    )
	wb_mission_failed()
end

function wb_stage_fight:onPlayerDeath(nkiller)
	local deadCnt = GetTask(WB_TSKID_MISSION_DEAD)
	local szName = GetName()
    local nRevBack = 0
    if deadCnt >= WB_PLAYER_MAX_DEATH_CNT then
        nRevBack = 1
		Msg2Player("Khi�u chi�n th�t b�i!")
		Msg2SubWorld(format("%s �� b� tr�ng th��ng, kh�ng th� ti�p t�c chi�n ��u.", szName))
    else
        Msg2Player(format("Ch�a ��t m�c ti�u, c�n %d c� h�i khi�u chi�n!", WB_PLAYER_MAX_DEATH_CNT - deadCnt ))
    end
    SetTask(WB_TSKID_MISSION_DEAD, deadCnt + 1)
    local nDiff = GetMissionV(tWBMission.mvBossDifficult)
    local tPos = tWantedBossMAP[nDiff].entryPos;
    if nRevBack == 0 then
        SetPos(tPos[1],tPos[2])
    end
	RevivePlayer(nRevBack, PlayerIndex, 1)
	
end

wb_stage_fight.actions = {
	[1] = wb_stage_fight.Init,
};

wb_stage_fight.cycActions = {
	[5] = {
		[0] = {wb_stage_fight.Breathe, },
	},
};

wb_stage_fight.triggers = {
	PlayerDeath = {
		{action = wb_stage_fight.onPlayerDeath},
	},
}


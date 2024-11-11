Include([[\script\missions\one_road_battle\mission_head.lua]])
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\missions\\one_road_battle\\orb_honor.lua")
function OnDeath(nNpcIndx, nSubWorldIndex, nKiller)
	local szNpcName = GetNpcName(nNpcIndx);
	local nMapID = GetWorldPos();
	SubWorld = SubWorldID2Idx(nMapID);
	local nOldPlayerIndex = PlayerIndex;
	local tBossInfo;
	
	for i = 1, getn(BOSS_NPC) do
		if szNpcName == BOSS_NPC[i][2] then
			tBossInfo = BOSS_NPC[i];
			break;
		end
	end
	orb_honor:OnKillBoss()
	gf_SetLogCaption("KÝch s¸t" .. szNpcName);
	gf_ModifyTask(TASKID_TEMP_BOSS, 1);
	gf_ModifyTask(TASKID_ORB_KILL_HFZ_BOSS, 1);
	SendScript2VM(thisFile, format("add_activity(%d)", ACTIVITY_SMALL_BOSS));
	Msg2MSAll(Mission_OneRoadBattle.missionID, format(tBossInfo[8], GetName()));
	PlayerIndex = nOldPlayerIndex;
	gf_SetLogCaption("");
end
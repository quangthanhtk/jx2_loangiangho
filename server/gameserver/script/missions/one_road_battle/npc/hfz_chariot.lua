Include([[\script\missions\one_road_battle\mission_head.lua]])
Import("\\script\\lib\\globalfunctions.lua")

function OnDeath(nNpcIndx, nSubWorldIndex, nKiller)
	gf_ModifyTask(TASKID_ORB_KILL_HFZ_CHARIOT, 1);
	SendScript2VM(thisFile, format("add_activity(%d)", ACTIVITY_RANDOM_BOSS));
end
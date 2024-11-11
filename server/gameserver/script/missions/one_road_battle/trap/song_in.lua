Include([[\script\missions\one_road_battle\mission_head.lua]])

function main()
	local nCamp = GetTask(TASKID_ORB_CAMP);
	if nCamp ~= CAMP_SONG then return end
	
	local nStage = GetMissionV(MV_STAGE);
	if nStage == PHASE_PREPARING then
		SendScript2VM(thisFile, "on_preparing_trap()");
	else
		SetFightState(0);
	end
end
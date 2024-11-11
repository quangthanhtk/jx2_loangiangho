-- Include([[\script\missions\one_road_battle\mission_head.lua]])

-- function main()
-- 	local nCamp = GetTask(TASKID_ORB_CAMP);
-- 	if nCamp ~= CAMP_LIAO then 
-- 		SetPos(2293,2981);
-- 		return
-- 	end
	
-- 	local nStage = GetMissionV(MV_STAGE);
-- 	if nStage == PHASE_PREPARING then
-- 		SendScript2VM(thisFile, "on_preparing_trap()");
-- 	elseif nStage == PHASE_END then
-- 		SetFightState(0);
-- 	else
-- 		SetFightState(1);
-- 	end
-- end
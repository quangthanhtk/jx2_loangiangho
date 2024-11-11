Include([[\script\missions\one_road_battle\mission_head.lua]])

function main()
	local nCamp = GetTask(TASKID_ORB_CAMP);
	if nCamp == CAMP_SONG then
		SetPos(2293,2981);
	end
end
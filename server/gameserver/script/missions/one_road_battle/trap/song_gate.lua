Include([[\script\missions\one_road_battle\mission_head.lua]])

function main()
	local nCamp = GetTask(TASKID_ORB_CAMP);
	if nCamp == CAMP_LIAO then
		SetPos(1796,3528);
	end
end
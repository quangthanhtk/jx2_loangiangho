--to天龙寺
--Include("\\script\\missions\\yp\\tls\\entrynpc.lua")

function main()
--	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
--	if nCamp ~= 1 then
--		Msg2Player("非本势力玩家无法进入天龙寺！");
--		return 0;
--	end
--	if GetPKValue() >= 10 then
--		Msg2Player("pk10的玩家无法进入天龙寺！");
--		return 0;
--	end
--	if GetTeamSize() ~= 0 then
--		Talk(1,"","大侠请离开队伍再进入！");
--		return 0;
--	end
--	enter();
--	SetPos(1596,2762);
--	SetFightState(0);
	NewWorld(400,1427,2858);
	SetFightState(0);
	SetPKFlag(0, 0);
end
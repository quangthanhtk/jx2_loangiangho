Import("\\script\\lib\\define.lua")

function main()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 2 then
		Msg2Player("Ng��i ch�i kh�ng thu�c th� l�c th� kh�ng th� v�o b�n �� b�o v� th� l�c!");
		SetPos(1783,3851);
		return 0;
	end
	LeaveTeam(1);
	NewWorld(429,1667,2872);
	SetFightState(1);
end
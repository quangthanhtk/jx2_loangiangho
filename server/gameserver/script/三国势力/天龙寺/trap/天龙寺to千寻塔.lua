Import("\\script\\lib\\define.lua")

function main()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 1 then
		Msg2Player("Ng��i ch�i kh�ng thu�c th� l�c th� kh�ng th� v�o b�n �� b�o v� th� l�c!");
		SetPos(1522,2842);
		SetFightState(1);
		return 0;
	end
	LeaveTeam(1);
	NewWorld(409,1550,3247);
	SetFightState(1);
end
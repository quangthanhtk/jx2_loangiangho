Include("\\script\\missions\\yp\\hss\\entrynpc.lua")

function main()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 2 then
		Msg2Player("Ng��i ch�i kh�ng thu�c th� l�c kh�ng th� v�o Qu�nh K�t!");
		return 0;
	end
	if GetPKValue() >= 10 then
		Msg2Player("Ng��i ch�i pk10 kh�ng th� v�o Qu�nh K�t!");
		return 0;
	end
	if GetTeamSize() ~= 0 then
		Talk(1,"","��i hi�p h�y r�i ��i r�i quay l�i!");
		return 0;
	end
	enter();
	SetPos(1791,3879);
	SetFightState(1);
end
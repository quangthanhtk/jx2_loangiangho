--ҩ����to����
Import("\\script\\lib\\define.lua")
Include("\\script\\missions\\yp\\mm\\entrynpc.lua")

function main()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 3 then
		Msg2Player("L�nh g�c c�a �ang t�p trung nh�n v� ��y, c� l� ��i hi�p kh�ng ���c hoan ngh�nh, hay l� h�y l�nh m�t tr��c!");
		return
	end
	if GetPKValue() >= 10 then
		Msg2Player("Ng��i ch�i pk10 kh�ng th� v�o H�ng Kh�nh!");
		return 0;
	end
	if GetTeamSize() ~= 0 then
		Talk(1,"","��i hi�p h�y r�i ��i r�i quay l�i!");
		return 0;
	end
	enter();
	SetPos(1532,2552);
	SetFightState(1);
end
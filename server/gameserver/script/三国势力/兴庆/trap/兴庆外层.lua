Import("\\script\\lib\\define.lua")

function main()
	SetFightState(1);
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 1 or nCamp == 2 then
		Msg2Player("L�nh g�c c�a �ang t�p trung nh�n v� ��y, c� l� ��i hi�p kh�ng ���c hoan ngh�nh, hay l� h�y l�nh m�t tr��c!");
		SetPos(1463,2840);
		return 0;
	end
end
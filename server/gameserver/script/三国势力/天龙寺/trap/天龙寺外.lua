Import("\\script\\lib\\define.lua")

function main()
	SetFightState(1);
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 2 or nCamp == 3 then
		Msg2Player("L�nh g�c c�a �ang t�p trung nh�n v� ��y, c� l� ��i hi�p kh�ng ���c hoan ngh�nh, hay l� h�y l�nh m�t tr��c!");
		SetPos(1456,2773);
		return 0;
	end
end
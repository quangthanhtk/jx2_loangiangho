Import("\\script\\lib\\globalfunctions.lua")

WD_ACTIVITY_ID = 151 --\script\online_activites\online_activites.txt
WD_TASK_ID = 2802 --\script\misc\taskmanager.lua

function ServerStartUp(nStartTime, nEndTime)
	
end

function PlayerLogin(ExchangeComing, nStartTime, nEndTime)
	if gf_CheckEventDateEx(WD_ACTIVITY_ID) ~= 1 then
		return 0;
	end
	if GetLevel() < 90 then
		return 0;
	end
	if GetTask(WD_TASK_ID) ~= 0 then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10," ") ~= 1 then
		return 0;
	end
	if GetSex() ~= 2 then		
		return 0
	end
	SetTask(WD_TASK_ID, 1);
	gf_AddItemEx2({2, 1, 30798, 1, 4}, "T�i qu� 8/3", "Ho�t ��ng ch�o m�ng 8/3 n�m 2015", "T�i qu� 8/3", 7*24*3600, 1);
end

function OnUse(nItem)
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetPlayerRoute() == 0 then
		Talk(1, "", "B�n ch�a gia nh�p m�n ph�i n�n kh�ng th� nh�n th��ng.")
		return 0
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	if GetTask(WD_TASK_ID) >= 2 then
		Talk(1, "", "B�n �� nh�n qu� m�ng ng�y 8/3 r�i.")
		return 0;
	end
	SetTask(WD_TASK_ID, 2);
	gf_ModifyExp(10000000);
	AwardGenuineQi(9999);
	gf_EventGiveCustomAward(31, 9999, 1, "Ho�t ��ng ch�o m�ng 8/3 n�m 2015");
	gf_AddItemEx2({2, 1, 30499, 10, 4}, "Hu�n ch��ng anh h�ng", "Ho�t ��ng ch�o m�ng 8/3 n�m 2015", "Hu�n ch��ng anh h�ng", 0, 1);
	local tAward = {
		{1, 14000, "Th� �en", {0, 105, 30039, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 14000, "Nguy�t L��ng Th�", {0, 105, 30038, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 15998, "��c Gi�c Th� B�o B�o", {0, 105, 30032, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 14000, "H�ng Mao Ng�u B�o B�o", {0, 105, 30023, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 14000, "B�o V�ng B�o B�o", {0, 105, 30046, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 14000, "B�o Tr�ng B�o B�o", {0, 105, 30047, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 14000, "B�o �en B�o B�o", {0, 105, 30045, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 1, "B�o �en B�o B�o", {0, 105, 30045, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Nguy�t L��ng Th�", {0, 105, 30038, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Hoat dong mung 8/3 nam 2015", "T�i qu� 8/3");
end
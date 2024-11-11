Include("\\script\\online_activites\\head\\activity_normal_head.lua")

VET_201503_ID = 149
VET_201503_USE_MAX = 2000
VET_201503_ITEM_NAME = "N��c Hoa ��c Bi�t"
VET_201503_LOG = "Ho�t ��ng th�ng 3/2015"
VET_201503_ITEM_PRE1 = "N��c Hoa Kh�"
VET_201503_ITEM_PRE2 = "N��c Hoa Tinh Ch�t"
VET_201503_TASK_PRE1 = 2846
VET_201503_TASK_PRE2 = 2847
VET_201503_TASK_TIMES = 2848
VET_201503_TASK_AWARD = 2849

function OnUse(nItem)
	if gf_CheckEventDateEx(VET_201503_ID) ~= 1 then
		Talk(1,"","V�t ph�m �� h�t h�n!");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end 
	if GetTask(VET_201503_TASK_TIMES) >= VET_201503_USE_MAX then
		Talk(1,"",format("%s s� d�ng �� ��t gi�i h�n %d", VET_201503_ITEM_NAME, VET_201503_USE_MAX));
		return 0;
	end
	if GetTask(VET_201503_TASK_PRE1) < VET_201503_USE_MAX or GetTask(VET_201503_TASK_PRE2) < VET_201503_USE_MAX then
		Talk(1,"",format("S� l��ng s� d�ng %s v� %s ch�a ��t %d c�i, kh�ng th� s� d�ng %s", VET_201503_ITEM_PRE1, VET_201503_ITEM_PRE2, VET_201503_USE_MAX, VET_201503_ITEM_NAME));
		return 0;
	end
	
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	SetTask(VET_201503_TASK_TIMES, GetTask(VET_201503_TASK_TIMES) + 1);
--	VET_201503_LookUsedNum();
	
	gf_ModifyExp(1500000);
	gf_EventGiveCustomAward(3, 2, 1);
	gf_EventGiveCustomAward(4, 2, 1);
	local tAward = {
		{2, 2000, 5000000, 1},
		{2, 1500, 10000000, 1},
		{2, 1000, 15000000, 1},
		{2, 500, 20000000, 1},
		{2, 100, 30000000, 1},
		{1, 50, "T�ng R��ng", {2, 1, 30341, 1}, 0},
		{1, 20, "Thi�n Th�ch linh th�ch", {2, 1, 1068, 1}, 7 * 24 * 3600},
		{1, 20, "��nh H�n Thi�n Th�ch Th�n Th�ch", {2, 1, 1067, 1}, 7 * 24 * 3600},
		{1, 500, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 0},
		{1, 30, "Chuy�n Sinh ��n ", {2, 1, 30345, 1}, 7 * 24 * 3600},
		{33, 600, 500, 1},
		{4, 1000, 200, 1},
		{5, 1000, 200, 1},
		{32, 500, 1000, 1},
		{1, 600, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
		{1, 300, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
		{1, 250, "M�nh Thi�n th�ch", {2, 2, 7, 1}, 0},
		{1, 25, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}, 7 * 24 * 3600},
		{1, 5, "Th�n T�i B�o R��ng", {2, 1, 30344, 1}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, VET_201503_LOG, VET_201503_ITEM_NAME);
end

function VET_201503_AdditionDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201503_ID) == 1 then
		tinsert(tbSayDialog, format("Nh�n ph�n th��ng cu�i %s /VET_201503_GetFinalAward", VET_201503_ITEM_NAME));
		tinsert(tbSayDialog, format("Ki�m tra s� l��ng %s �� s� d�ng/VET_201503_LookUsedNum", VET_201503_ITEM_NAME));
	end
	return tbSayDialog, szSayHead;
end

function VET_201503_GetFinalAward()
	if GetTask(VET_201503_TASK_TIMES) < VET_201503_USE_MAX then
		Talk(1,"",format("Gi�i h�n s� d�ng c�a %s ch�a ��t %d, kh�ng th� nh�n ph�n th��ng cu�i c�ng.", VET_201503_ITEM_NAME, VET_201503_USE_MAX))
		return 0;
	end
	if GetTask(VET_201503_TASK_AWARD) ~= 0 then
		Talk(1,"",format("B�n �� nh�n ph�n th��ng cu�i c�ng c�a %s, kh�ng th� nh�n l�i.", VET_201503_ITEM_NAME));
		return 0;
	end
	if gf_Judge_Room_Weight(5, 100, " ") ~= 1 then
		return 0;
	end
	SetTask(VET_201503_TASK_AWARD, 1);
	gf_ModifyExp(2000000000);
	gf_AddItemEx2({1, 1, 15, 222}, "B�nh B�t v�ng", VET_201503_LOG, VET_201503_ITEM_NAME, 0, 1);
	gf_AddItemEx2({1, 1, 19, 222}, "T�y B�c V�ng", VET_201503_LOG, VET_201503_ITEM_NAME, 0, 1);
	gf_AddItemEx2({1, 1, 17, 222}, "Minh Nguy�t D�", VET_201503_LOG, VET_201503_ITEM_NAME, 0, 1);
	gf_EventGiveCustomAward(31, 9999, 1, VET_201503_LOG, VET_201503_ITEM_NAME);
	gf_EventGiveCustomAward(27, 9999, 1, VET_201503_LOG, VET_201503_ITEM_NAME);
	gf_AddItemEx2({2, 1, 30344, 6}, "Th�n T�i B�o R��ng", VET_201503_LOG, VET_201503_ITEM_NAME, 0, 1);
end

function VET_201503_LookUsedNum()
	local msg = format("Hi�n nay<color=green>%s<color>c�a ng��i: s� l��ng s� d�ng l� :%d/%d ", VET_201503_ITEM_NAME, GetTask(2848), VET_201503_USE_MAX);
	Talk(1,"","<color=green>Nh�c nh�<color>:"..msg)
end
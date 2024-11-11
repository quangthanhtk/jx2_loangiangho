Include("\\script\\online_activites\\head\\activity_normal_head.lua")

function OnUse(nItem)
	if gf_CheckEventDateEx(144) ~= 1 then
		Talk(1,"","B�nh �t th�p c�m �� h�t h�n s� d�ng");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end 
	if GetTask(2848) >= 2000 then
		Talk(1,"",format("S� l�n s� d�ng B�nh �t th�p c�m �� ��t gi�i h�n %d", 2000));
		return 0;
	end
	if GetTask(2846) < 2000 or GetTask(2847) < 2000 then
		Talk(1,"",format("Nh�n v�t ph�i s� d�ng %d b�nh ch�ng �� v� b�nh ch�ng ��u xanh m�i ���c s� d�ng b�nh �t th�p c�m", 2000));
		return 0;
	end
	
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	SetTask(2848, GetTask(2848) + 1);
	--VET_201501_LookUsedNum();
	
	gf_ModifyExp(1500000);
	gf_EventGiveCustomAward(3, 2, 1);
	gf_EventGiveCustomAward(4, 2, 1);
	local tAward = {
		{2, 2000, 10000000, 1},
		{2, 1500, 15000000, 1},
		{2, 1000, 20000000, 1},
		{2, 384, 30000000, 1},
		{1, 50, "T�ng R��ng", {2, 1, 30341, 1}, 0},
		{1, 25, "Thi�n Th�ch linh th�ch", {2, 1, 1068, 1}, 7 * 24 * 3600},
		{1, 25, "��nh H�n Thi�n Th�ch Th�n Th�ch", {2, 1, 1067, 1}, 7 * 24 * 3600},
		{1, 50, "��i ��nh H�n ", {2, 1, 1113, 1}, 7 * 24 * 3600},
		{1, 100, "V� Ti�u Y V�ng", {2, 1, 30491, 1}, 7 * 24 * 3600},
		{1, 500, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 0},
		{1, 50, "Chuy�n Sinh ��n ", {2, 1, 30345, 1}, 7 * 24 * 3600},
		{33, 600, 500, 1},
		{4, 1000, 200, 1},
		{5, 1000, 200, 1},
		{32, 491, 1000, 1},
		{1, 800, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
		{1, 300, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
		{1, 100, "M�nh Thi�n th�ch", {2, 2, 7, 1}, 0},
		{1, 10, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}, 7 * 24 * 3600},
		{1, 5, "Th�n T�i B�o R��ng", {2, 1, 30344, 1}, 0},
		{1, 10, "L�c �� Tr�ng", {0, 105, 148, 1, 1, -1, -1, -1, -1, -1, -1}, 15 * 24 * 3600},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Ho�t ��ng th�ng 1 n�m 2015", "B�nh �t th�p c�m");
end

function VET_201501_AdditionDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(144) == 1 then
		tinsert(tbSayDialog, "Nh�n gi�i th��ng cu�i c�a b�nh �t th�p c�m/VET_201501_GetFinalAward");
		tinsert(tbSayDialog, "Xem s� l�n �� s� d�ng b�nh �t th�p c�m/VET_201501_LookUsedNum");
	end
	return tbSayDialog, szSayHead;
end

function VET_201501_GetFinalAward()
	if GetTask(2848) < 2000 then
		Talk(1,"",format("S� l�n s� d�ng B�nh �t th�p c�m ch�a ��n %d, kh�ng ���c nh�n th��ng cu�i c�ng", 2000))
		return 0;
	end
	if GetTask(2849) ~= 0 then
		Talk(1,"","Ng��i �� nh�n ph�n th��ng cu�i c�a b�nh �t th�p c�m, kh�ng th� nh�n l�i.");
		return 0;
	end
	if gf_Judge_Room_Weight(5, 100, " ") ~= 1 then
		return 0;
	end
	SetTask(2849, 1);
	gf_ModifyExp(2000000000);
	gf_AddItemEx2({1, 1, 15, 111}, "B�nh B�t v�ng", "Ho�t ��ng th�ng 1 n�m 2015", "B�nh �t th�p c�m", 0, 1);
	gf_AddItemEx2({1, 1, 19, 111}, "T�y B�c V�ng", "Ho�t ��ng th�ng 1 n�m 2015", "B�nh �t th�p c�m", 0, 1);
	gf_AddItemEx2({1, 1, 17, 111}, "Minh Nguy�t D�", "Ho�t ��ng th�ng 1 n�m 2015", "B�nh �t th�p c�m", 0, 1);
	gf_EventGiveCustomAward(31, 9999, 1, "Ho�t ��ng th�ng 1 n�m 2015", "B�nh �t th�p c�m");
	gf_EventGiveCustomAward(27, 9999, 1, "Ho�t ��ng th�ng 1 n�m 2015", "B�nh �t th�p c�m");
	gf_AddItemEx2({2, 1, 30344, 4}, "Th�n T�i B�o R��ng", "Ho�t ��ng th�ng 1 n�m 2015", "B�nh �t th�p c�m", 0, 1);
	gf_AddItemEx2({0, 105, 30000, 1, 1, -1, -1, -1, -1, -1, -1}, "K� l�n", "Ho�t ��ng th�ng 1 n�m 2015", "B�nh �t th�p c�m", 0, 1);
end

function VET_201501_LookUsedNum()
	local msg = format("Hi�n nay<color=green>%s<color>c�a ng��i: s� l��ng s� d�ng l� :%d/%d ", "B�nh �t th�p c�m", GetTask(2848), 2000);
	Talk(1,"","<color=green>Nh�c nh�<color>:"..msg)
end
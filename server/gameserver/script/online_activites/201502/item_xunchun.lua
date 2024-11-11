Include("\\script\\online_activites\\head\\activity_normal_head.lua")

function OnUse(nItem)
	if gf_CheckEventDateEx(147) ~= 1 then
		Talk(1,"","V�t ph�m �� h�t h�n!");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end 
	if GetTask(2768) >= 4000 then
		Talk(1,"",format("%s s� d�ng �� ��t gi�i h�n %d", "N� T�m Xu�n", 4000));
		return 0;
	end
	if GetTask(2768) >= 2000 then
		if GetTask(2769) < 1 or  GetTask(2764) < 1 or GetTask(2765) < 1 then
			Talk(1,"","��i hi�p ch�a nh�n ph�n th��ng cu�i m�c 2000 n�n kh�ng th� s� d�ng ti�p v�t ph�m event !!!!")
			return 0
		end
	end
	if GetTask(2766) < 2000 or GetTask(2767) < 2000 then
		Talk(1,"",format("S� l��ng s� d�ng %s v� %s ch�a ��t %d c�i, kh�ng th� s� d�ng %s", "Nh�nh ��o", "Nh�nh Mai", 2000, "N� T�m Xu�n"));
		return 0;
	end
	
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	SetTask(2768, GetTask(2768) + 1);
--	VET_201502_LookUsedNum();
	
	gf_ModifyExp(1500000);
	gf_EventGiveCustomAward(3, 2, 1);
	gf_EventGiveCustomAward(4, 2, 1);
	local tAward = {
		{2, 1997, 5000000, 1},
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
		{1, 3, "L�n S�", {0,105,30044,1,1,-1,-1,-1,-1,-1,-1,-1,0}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Ho�t ��ng th�ng 2 n�m 2015", "N� T�m Xu�n");
end

function VET_201502_AdditionDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(147) == 1 then
		tinsert(tbSayDialog, format("Nh�n ph�n th��ng cu�i %s /VET_201502_GetFinalAward", "N� T�m Xu�n"));
		tinsert(tbSayDialog, format("Ki�m tra s� l��ng %s �� s� d�ng/VET_201502_LookUsedNum", "N� T�m Xu�n"));
	end
	return tbSayDialog, szSayHead;
end

function VET_201502_GetFinalAward()
	if GetTask(2768) < 2000 then
		Talk(1,"",format("Gi�i h�n s� d�ng c�a %s ch�a ��t %d, kh�ng th� nh�n ph�n th��ng cu�i c�ng.", "N� T�m Xu�n", 2000))
		return 0;
	end
	if GetTask(2769) ~= 0 then
		Talk(1,"",format("B�n �� nh�n ph�n th��ng cu�i c�ng c�a %s, kh�ng th� nh�n l�i.", "N� T�m Xu�n"));
		return 0;
	end
	if gf_Judge_Room_Weight(5, 100, " ") ~= 1 then
		return 0;
	end
	SetTask(2769, 1);
	gf_ModifyExp(2000000000);
	gf_AddItemEx2({1, 1, 15, 222}, "B�nh B�t v�ng", "Ho�t ��ng th�ng 1 n�m 2015", "N� T�m Xu�n", 0, 1);
	gf_AddItemEx2({1, 1, 19, 222}, "T�y B�c V�ng", "Ho�t ��ng th�ng 1 n�m 2015", "N� T�m Xu�n", 0, 1);
	gf_AddItemEx2({1, 1, 17, 222}, "Minh Nguy�t D�", "Ho�t ��ng th�ng 1 n�m 2015", "N� T�m Xu�n", 0, 1);
	gf_EventGiveCustomAward(31, 9999, 1, "Ho�t ��ng th�ng 1 n�m 2015", "N� T�m Xu�n");
	gf_EventGiveCustomAward(27, 9999, 1, "Ho�t ��ng th�ng 1 n�m 2015", "N� T�m Xu�n");
	gf_AddItemEx2({2, 1, 30344, 4}, "Th�n T�i B�o R��ng", "Ho�t ��ng th�ng 2 n�m 2015", "N� T�m Xu�n", 0, 1);
end

function VET_201502_LookUsedNum()
	local msg = format("Hi�n nay<color=green>%s<color>c�a ng��i: s� l��ng s� d�ng l� :%d/%d ", "N� T�m Xu�n", GetTask(2768), 4000);
	Talk(1,"","<color=green>Nh�c nh�<color>:"..msg)
end
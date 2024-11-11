Import("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	if GetItemCount(2, 1, 30796) < 20 then
		Talk(1,"",format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "T�ng B�o ��", 20));
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30796, 20) ~= 1 then
		return 0;
	end
	local tAwart = {
		{1, 10, "T�ng R��ng", {2, 1, 30341, 1}, 0},
		{1, 10, "Thi�n Th�ch linh th�ch", {2, 1, 1068, 1}, 7 * 24 * 3600},
		{1, 10, "H�p M�nh Thi�n Th�ch (Nh�)", {2, 1, 30788, 1}, 7 * 24 * 3600},
		{1, 10, "Bao m�nh Thi�n Th�ch", {2, 1, 1049, 1}, 15 * 24 * 3600},
		{1, 10, "T�i Thi�n Th�ch Tinh Th�ch", {2, 1, 3356, 1}, 7 * 24 * 3600},
		{1, 10, "Tr�ng Linh Th�-Cao", {2, 1, 30728, 1}, 0},
		{1, 10, "N� Oa Tinh Th�ch", {2, 1, 504, 1}, 7 * 24 * 3600},
		{1, 10, "Chuy�n Sinh ��n ", {2, 1, 30345, 1}, 15 * 24 * 3600},
		{2, 10, 999999999, 1},
		{32, 10, 99999, 1},
	}
	gf_EventGiveRandAward(tAwart, gf_SumRandBase(tAwart), 1, "T�ng R��ng", "T�ng R��ng")
end
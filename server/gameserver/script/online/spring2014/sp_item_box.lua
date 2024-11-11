--���ޱ���
Include("\\script\\online\\spring2014\\sp_head.lua")
Include("\\script\\function\\ornament\\ornament.lua")

function OnUse(nItem)
	if sp_IsOpenActivity() ~= 1 then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	gf_ModifyExp(600000);
	ornament_add_score(10);
	Msg2Player("B�n nh�n ���c 10 �i�m Phong Hoa!")
	if SP_TASK_GROUP:GetMyTaskByte(SP_TASK_GROUP.UseTimes, 3, 4) == 15 then
		SP_TASK_GROUP:SetMyTaskByte(SP_TASK_GROUP.UseTimes, 3, 4, 0);
		Add_ShiMenZhenJuan_High();
	else
		local tAward = {
			-- {1, 200, "1��ǧ�ÿ̰�", {2, 1, 30406, 1, 4}, 0},
			-- {1, 200, "2��ǧ�ÿ̰�", {2, 1, 30407, 1, 4}, 0},
			-- {1, 100, "3��ǧ�ÿ̰�", {2, 1, 30408, 1, 4}, 0},
			{1, 700, "C�y B�t Nh� nh�", {2, 0, 504, 1, 4}, 0},
			{1, 200, "C�y B�t Nh�", {2, 0, 398, 1, 4}, 0},
			{1, 300, "Luy�n L� Thi�t Kho�ng", {2, 1, 30537, 1, 4}, 0},
			{1, 300, "T�y T�m Th�ch Kho�ng", {2, 1, 30536, 1, 4}, 0},
			-- {1, 600, "1��ϴ��ʯ", {2, 1, 30521, 1, 4}, 0},
			-- {1, 600, "1����¯��", {2, 1, 30527, 1, 4}, 0},
			-- {1, 200, "2��ϴ��ʯ", {2, 1, 30522, 1, 4}, 0},
			-- {1, 200, "2����¯��", {2, 1, 30528, 1, 4}, 0},
			{1, 600, "Thi�n th�ch", {2, 2, 8, 1, 4}, 0},
			{1, 1500, "Thi�t Tinh c�p 1", {2, 1, 30533, 1, 4}, 0},
			{1, 1000, "Thi�t Tinh c�p 2", {2, 1, 30534, 1, 4}, 0},
			{1, 700, "Ti�u L�c Th�n Ho�n", {2, 1, 30309, 1, 4}, 0},
			{1, 700, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1, 4}, 0},
			{1, 300, "B�ch C�u Ho�n", {2, 1, 270, 1, 4}, 0},
			{1, 300, "Tam Thanh ho�n", {2, 1, 1097, 1, 4}, 0},
			{1, 300, "L�c Th�n ho�n", {2, 1, 1064, 1, 4}, 0},
			{1, 295, "Th�n N�ng ��n", {2, 1, 343, 1, 4}, 0},
			{1, 600, "��i Nh�n s�m", {2, 0, 553, 1, 4}, 0},
			{1, 500, "M�nh Thi�n th�ch", {2, 2, 7, 1, 4}, 0},
			-- {1, 100, "�Ϲ��ܱ�", {2, 0, 761, 1, 4}, 0},
			-- {1, 100, "�Ϲ���", {2, 0, 763, 1, 4}, 0},
			{1, 200, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1, 4}, 0},
			{1, 100, "Qu�n C�ng ��i", {2, 1, 9998, 1, 4}, 0},
			-- {31, 500, "ModifyYinJuan(10,1)", 1},
			-- {31, 500, "ModifyYinJuan(100,1)", 1},
			-- {31, 300, "ModifyYinJuan(1000,1)", 1},
			{1, 10, "L�ng Ba Vi B�", {0, 112, 78, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
			{31,10, "Add_ShiMenZhenJuan()", 1},
			-- {31, 500, "Add_WuXing_Equip()", 1},
			{1, 200, "Th�i Nh�t ��ng Quy�n", 	{2,	1,	31066, 1, 4}, 0},
			{1, 64, "Th�i Nh�t Thi�t Quy�n", 	{2,	1,	31067, 1, 4}, 0},
			{31, 1, "Add_Normal_Haoxia_Equip()", 1},
			{1, 10, "Ng�c T�y", 		 {2, 1,	2001, 1, 4}, 0},
			{1, 100, "Thi�n Tinh Th�ch", 	{2, 1, 31191, 1, 4}, 0},
			{1, 10, "Thi�n Th�ch Tinh Th�ch", 	{2, 1, 1009, 1, 4}, 0},
			{1, 500, "Th�o Ph�t L�nh ", 		 {2, 1, 30915, 1, 4}, 0},
			{1, 500, "��ng T� Chi Nguy�n", 	{2, 1, 30913, 1, 4}, 0},
		};
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event T�t Kingsoft", "Ho�t ��ng ��nh Ni�n Th�")
	end
end

function Add_Normal_Haoxia_Equip()
	local tItem = {
		{0,103,30568,1,"H�o Hi�p ��u"},
		{0,100,30568,1,"H�o Hi�p y"},
		{0,101,30568,1,"H�o Hi�p Trang"},
	}
	local rand = random(1, getn(tItem))
	gf_AddItemEx2({tItem[rand][1],tItem[rand][2],tItem[rand][3],tItem[rand][4],4}, tItem[rand][5], "Event T�t Kingsoft", "Ho�t ��ng ��nh Ni�n Th�", 0, 1);
end
function Add_ShiMenZhenJuan()
	local tBook = {
		[2] = {0, 107, 204, 1, "Kim Cang B�t Nh� Ch�n Quy�n "},
		[3] = {0, 107, 206, 1, "V� Tr�n B� �� Ch�n Quy�n"},
		[4] = {0, 107, 205, 1, "Ti�m Long T�c Di�t Ch�n Quy�n"},
		[6] = {0, 107, 207, 1, "Thi�n La Li�n Ch�u Ch�n Quy�n"},
		[8] = {0, 107, 208, 1, "Nh� � Kim ��nh Ch�n Quy�n"},
		[9] = {0, 107, 209, 1, "B�ch H�i Tuy�t �m Ch�n Quy�n"},
		[11] = {0, 107, 210, 1, "H�n ��n Tr�n Nh�c Ch�n Quy�n"},
		[12] = {0, 107, 211, 1, "Qu� Thi�n Du Long Ch�n Quy�n"},
		[14] = {0, 107, 212, 1, "Huy�n �nh M� T�ng Ch�n Quy�n"},
		[15] = {0, 107, 213, 1, "Qu�n T� ��i Phong Ch�n Quy�n"},
		[17] = {0, 107, 214, 1, "Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
		[18] = {0, 107, 215, 1, "Xuy�n V�n L�c H�ng Ch�n Quy�n"},
		[20] = {0, 107, 216, 1, "Huy�n Minh Phong Ma Ch�n Quy�n"},
		[21] = {0, 107, 217, 1, "Linh C� Huy�n T� Ch�n Quy�n"},
		[23] = {0, 107, 218, 1, "C�u Thi�n Phong L�i Ch�n Quy�n"},

		[25] = {0, 107, 219, 1, "H�i Phong Tr�m Nh�t Ch�n Quy�n"},
		[26] = {0, 107, 220, 1, "Ph� K� H�nh Tr�n Ch�n Quy�n"},
		[27] = {0, 107, 221, 1, "Ng�ng Huy�t Phong H�n Ch�n Quy�n"},

		[29] = {0, 107, 222, 1, "H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[30] = {0, 107, 223, 1, "Phong Hoa Thi�n Di�p Ch�n Quy�n"},	
		[31] = {0, 107, 231, 1, "M� Tung Ch�n Quy�n"},
		[32] = {0, 107, 235, 1, "Thi�n Phong Ch�n Quy�n"},	
	}
	local nRoute = GetPlayerRoute();
	if tBook[nRoute] then
		gf_AddItemEx2({tBook[nRoute][1],tBook[nRoute][2],tBook[nRoute][3],tBook[nRoute][4],4}, tBook[nRoute][5], "Event T�t Kingsoft", "Ho�t ��ng ��nh Ni�n Th�", 0, 1);
	end
end


function Add_ShiMenZhenJuan_High()

	local tBook = {
		[2] = {0, 107, 30001, 1, "Kim Cang B�t Nh� Ch�n Quy�n (Cao c�p)"},
		[3] = {0, 107, 30003, 1, "V� Tr�n B� �� Ch�n Quy�n (Cao c�p)"},
		[4] = {0, 107, 30002, 1, "Ti�m Long T�c Di�t Ch�n Quy�n (Cao c�p)"},
		[6] = {0, 107, 30004, 1, "Thi�n La Li�n Ch�u Ch�n Quy�n (Cao c�p)"},
		[8] = {0, 107, 30005, 1, "Nh� � Kim ��nh Ch�n Quy�n (Cao c�p)"},
		[9] = {0, 107, 30006, 1, "B�ch H�i Tuy�t �m Ch�n Quy�n (Cao c�p)"},
		[11] = {0, 107, 30007, 1, "H�n ��n Tr�n Nh�c Ch�n Quy�n (Cao c�p)"},
		[12] = {0, 107, 30008, 1, "Qu� Thi�n Du Long Ch�n Quy�n (Cao c�p)"},
		[14] = {0, 107, 30009, 1, "Huy�n �nh M� T�ng Ch�n Quy�n (Cao c�p)"},
		[15] = {0, 107, 30010, 1, "Qu�n T� ��i Phong Ch�n Quy�n (Cao c�p)"},
		[17] = {0, 107, 30011, 1, "Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n (Cao c�p)"},
		[18] = {0, 107, 30012, 1, "Xuy�n V�n L�c H�ng Ch�n Quy�n (Cao c�p)"},
		[20] = {0, 107, 30013, 1, "Huy�n Minh Phong Ma Ch�n Quy�n (Cao c�p)"},
		[21] = {0, 107, 30014, 1, "Linh C� Huy�n T� Ch�n Quy�n (Cao c�p)"},
		[23] = {0, 107, 30015, 1, "C�u Thi�n Phong L�i Ch�n Quy�n (Cao c�p)"},

		[25] = {0, 107, 30035, 1, "H�i Phong Tr�m Nh�t Ch�n Quy�n (Cao C�p)"},
		[26] = {0, 107, 30036, 1, "Ph� K� H�nh Tr�n Ch�n Quy�n (Cao C�p)"},
		[27] = {0, 107, 30037, 1, "Ng�ng Huy�t Phong H�n Ch�n Quy�n (Cao C�p)"},

		[29] = {0, 107, 30016, 1, "H�ng Tr�n T�y M�ng Ch�n Quy�n (Cao c�p)"},
		[30] = {0, 107, 30017, 1, "Phong Hoa Thi�n Di�p Ch�n Quy�n (Cao c�p)"},	
		[31] = {0, 107, 30041, 1, "M� Tung Ch�n Quy�n (Cao c�p)"},
		[32] = {0, 107, 30043, 1, "Thi�n Phong Ch�n Quy�n (Cao c�p)"},	
	}
	local nRoute = GetPlayerRoute();
	if tBook[nRoute] then
		gf_AddItemEx2({tBook[nRoute][1],tBook[nRoute][2],tBook[nRoute][3],tBook[nRoute][4],4}, tBook[nRoute][5], "Event T�t Kingsoft", "Ho�t ��ng ��nh Ni�n Th�", 0, 1);
	end
end

function Add_WuXing_Equip()
	local tEquip = {
		{1, 12, "�o Cho�ng T�o B�",	 {0, 152, 1, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "�o Cho�ng C�m �o�n",	 {0, 152, 2, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "�o Cho�ng H�a V�n",	 {0, 152, 3, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "Gi�y V�i Th�",		 {0, 154, 1, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "Tinh Tr� B� H�i",	 {0, 154, 2, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "B� Ch� Cao ��ng Ngoa",{0, 154, 3, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "Huy Ch��ng ��ng Ch�",	 {0, 153, 1, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "Huy Ch��ng Thi�t Ch�",	 {0, 153, 2, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "Huy Ch��ng Ng�c Ch�",	 {0, 153, 3, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	}
	gf_EventGiveRandAward(tEquip, gf_SumRandBase(tEquip), 1, "Event T�t Kingsoft", "Ho�t ��ng ��nh Ni�n Th�");
end
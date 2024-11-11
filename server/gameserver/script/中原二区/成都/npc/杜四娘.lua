--�������ܽ��Ӳ�������
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\vng\\weapon_upgrade\\upgradesattinh.lua")
--KSGVN
Import("\\script\\ksgvn\\lib.lua")
-- END KSGVN
DSN_NPC = "<color=green>�� T� N��ng<color>: ";

function main()
	local tSay = {
		format("\nN�ng c�p trang b� S�t Tinh/#KsgLib:OpenEquipShop(%d)", EQUIP_SHOP_EXCHANGE_SATTINH),
		--"\nN�ng c�p trang b� S�t Tinh/updateSatTinh",
		--"N�ng c�p trang b� �m Huy�t (gi� r�)/updateAmHuyet",
		format("Ti�m �m Huy�t/#show_equip_shop(%d)", 3100),
		format("Ti�m Linh �� Gi�i Ch�/#show_equip_shop(%d)", 3044),
		--format("\n����װ���̵�/#show_equip_shop(%d)", 3045),
		--format("\n�߼������̵�/#show_equip_shop(%d)", 3043),\
		format("��i trang b� H�o Hi�p V� H�/#KsgLib:OpenEquipShop(%d)", EQUIP_SHOP_EXCHANGE_HHVH),
		--"Ti�n c�p trang b� H�o Hi�p/NormalHaoxia2Level",
		"\nT�i ch� xem xem th�i/nothing",
	}		
	Say(DSN_NPC..format("%s c� th� gi�p ���c g� kh�ng?", gf_GetPlayerSexName()), getn(tSay), tSay)
end

tRecipe2Level = {
	[0] = {{"Vi�m Linh B�", {2, 1, 30676, 15}}, {"Linh Thi�t", {2, 1, 30681, 30}},	{"H�o Hi�p L�nh", {2, 95, 2084, 300}}},
	[1] = {{"Ma Lang Gi�p", {2, 1, 30677, 15}}, {"Linh Thi�t", {2, 1, 30681, 30}},	{"H�o Hi�p L�nh", {2, 95, 2084, 300}}},
	[2] = {{"Huy�n Vi�m C��ng", {2, 1, 30675, 20}}, {"Thi�n M�n Kim L�nh", {2, 1, 30370, 10}}, {"Thi�n Cang L�nh", {2, 95, 204, 10}}, {"Linh Kh� R�c R�", {2, 1, 31122, 2}},},
	[3] = {{"��a Long Gi�p", {2, 1, 30678, 15}}, {"Linh Thi�t", {2, 1, 30681, 30}},	{"H�o Hi�p L�nh", {2, 95, 2084, 300}}},
}

tWuxiaHaoxia = {
	[0] = {"V� H� H�o Hi�p L�nh (N�n)",	{2, 1, 30944, 1, 4}},
	[1] = {"V� H� H�o Hi�p L�nh (�o)",	{2, 1, 30945, 1, 4}},
	[2] = {"V� H� H�o Hi�p L�nh (V� Kh�)",    {2, 1, 30973, 1, 4}},
	[3] = {"V� H� H�o Hi�p L�nh (Qu�n)",	{2, 1, 30946, 1, 4}},
}

tEnhanceAward = {
	[1] = {{2,2,7,1,4}},
	[2] = {{2,2,7,2,4}},
	[3] = {{2,2,7,4,4}},
	[4] = {{2,2,7,8,4}},
	[5] = {{2,2,7,16,4}},
	[6] = {{2,2,7,16,4},{2,2,8,10,4}},
	[7] = {{2,2,7,16,4},{2,2,8,20,4}},
	[8] = {{2,2,7,16,4},{2,2,8,40,4}},
	[9] = {{2,2,7,16,4},{2,2,8,80,4}},
	[10] = {{2,2,7,16,4},{2,2,8,160,4}},	
	[11] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,4,4}},
	[12] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,8,4}},
	[13] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,16,4}},
	[14] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,32,4}},
	[15] = {{2,2,7,16,4},{2,2,8,160,4},{2,1,1009,64,4}},
}

function NormalHaoxia2Level()
	local tSay = {
		format("��i V� H� H�o Hi�p L�nh (N�n)/#NormalHaoxia2Level_do(%d)", 0),
		format("��i V� H� H�o Hi�p L�nh (�o)/#NormalHaoxia2Level_do(%d)", 1),
		format("��i V� H� H�o Hi�p L�nh (Qu�n)/#NormalHaoxia2Level_do(%d)", 3),
		format("%s/#NormalHaoxia2Level_do(%d)", "��i V� H� H�o Hi�p L�nh (V� kh�)", 2),
		"\nT�i ch� xem xem th�i/nothing",
	}
	Say(DSN_NPC..format("Ti�n c�p trang b� H�o Hi�p, m�i %s h�y ch�n lo�i c�n ��i: <color=red> (H�y m�c trang b� H�o Hi�p tr�n ng��i)<color>", gf_GetPlayerSexName()), getn(tSay), tSay);
end

function NormalHaoxia2Level_do(nPos)
	local msg = "��i [<color=green>%s<color>] c�n ti�u hao: %s. <color=red>(Sau khi ��i trang b� H�o Hi�p �� c��ng h�a, ho�n tr� �� c��ng h�a theo quy t�c t�ch)<color>"
	local tRecipe = tRecipe2Level[nPos];
	local szCost = ""
	for i = 1, getn(tRecipe) do
		szCost = format("%s, %d [%s]", szCost, tRecipe[i][2][4], tRecipe[i][1])
	end
	szCost = strsub(szCost,2)
	msg = format(msg, tWuxiaHaoxia[nPos][1], szCost)
	Say(DSN_NPC..msg, 2, format("��i ngay/#Exchange2Wuxiaohao(%d)", nPos), "T�i h� ch� xem qua th�i/nothing")
end

function Exchange2Wuxiaohao(nPos)
	local nItemIndex = GetPlayerEquipIndex(nPos);
	local nEnhance = min(GetEquipAttr(nItemIndex, 2), 15);
	local nP = GetItemParticular(nItemIndex);
	if (nPos~= 2 and nP ~= 30568) or (nPos==2 and not(nP >= 30724 and nP <= 30743) and nP ~= 32190 and nP ~= 32162) then
		Talk(1,"",DSN_NPC.."Ph�i m�c trang b� H�o Hi�p l�n ng��i m�i ���c ti�n c�p!");
		return 0;
	end
	local tRecipe = tRecipe2Level[nPos];
	for i = 1, getn(tRecipe) do
		if GetItemCount(tRecipe[i][2][1], tRecipe[i][2][2], tRecipe[i][2][3]) < tRecipe[i][2][4] then
			Talk(1,"",DSN_NPC..format("%s kh�ng �� %d c�i, kh�ng th� ho�n th�nh ��i.", tRecipe[i][1], tRecipe[i][2][4]));
			return 0;
		end
	end
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end
	for i = 1, getn(tRecipe) do
		if DelItem(tRecipe[i][2][1], tRecipe[i][2][2], tRecipe[i][2][3], tRecipe[i][2][4]) ~= 1 then
			return 0;
		end
	end
	if DelItemByIndex(nItemIndex, -1) ~= 1 then
		return 0;
	end	
	if nEnhance > 0 then
		local t = tEnhanceAward[nEnhance];
		for _, v in t do
			gf_AddItemEx2(v, GetItemName(v[1],v[2],v[3]), "Ti�n c�p H�o Hi�p", "Ho�n tr� �� c��ng h�a", 0, 1);
		end
	end
	local tAward = tWuxiaHaoxia[nPos];
	gf_AddItemEx2(tAward[2], tAward[1], "Ti�n c�p H�o Hi�p", "V� H� H�o Hi�p L�nh", 0, 1);
end

function updateAmHuyet()
	local tbSayDialog = {};
	local nSaySize = 0;
	local msg = "N�ng c�p trang b� �m Huy�t c�n ti�u hao: Thi�n M�n Kim L�nh, Thi�n Cang L�nh, Huy�t B� ��, C�u Thi�n V� C�c ��n"
	
	tinsert(tbSayDialog,"N�ng c�p N�n �m Huy�t (8 TMKL, 8 TCL, 5 HB�)/#updateAmHuyet_choose(1)")
	tinsert(tbSayDialog,"N�ng c�p Qu�n �m Huy�t (8 TMKL, 8 TCL, 5 HB�)/#updateAmHuyet_choose(2)")
	tinsert(tbSayDialog,"N�ng c�p �o �m Huy�t (8 TMKL, 8 TCL, 5 HB�)/#updateAmHuyet_choose(3)")
	tinsert(tbSayDialog,"N�ng c�p V� Kh� �m Huy�t (18 TMKL, 18 TCL, 5 HB�, 1 CTVC�)/#updateAmHuyet_choose(4)")
	tinsert(tbSayDialog,"N�ng c�p Trang S�c �m Huy�t (12 TMKL, 12 TCL, 5 HB�, 1 CTVC�)/updateAmHuyet_trangsuc")
	tinsert(tbSayDialog,"T�i ch� xem xem th�i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(DSN_NPC..msg, nSaySize, tbSayDialog);
end
function updateAmHuyet_trangsuc()
	local tbSayDialog = {};
	local nSaySize = 0;
	local msg = "N�ng c�p trang s�c �m Huy�t c�n ti�u hao: 12 Thi�n M�n Kim L�nh, 12 Thi�n Cang L�nh, 5 Huy�t B� ��, 1 C�u Thi�n V� C�c ��n"
	
	tinsert(tbSayDialog,"N�ng c�p T� Gi�i �m Huy�t (12 TMKL, 12 TCL, 5 HB�, 1 CTVC�)/#updateAmHuyet_choose(5)")
	tinsert(tbSayDialog,"N�ng c�p H�u Gi�i �m Huy�t (12 TMKL, 12 TCL, 5 HB�, 1 CTVC�)/#updateAmHuyet_choose(6)")
	tinsert(tbSayDialog,"N�ng c�p Tr�y �m Huy�t (12 TMKL, 12 TCL, 5 HB�, 1 CTVC�)/#updateAmHuyet_choose(7)")
	tinsert(tbSayDialog,"N�ng c�p B�i �m Huy�t (12 TMKL, 12 TCL, 5 HB�, 1 CTVC�)/#updateAmHuyet_choose(8)")
	tinsert(tbSayDialog,"T�i ch� xem xem th�i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(DSN_NPC..msg, nSaySize, tbSayDialog);
end
function updateAmHuyet_choose(nChoose)
	local tCondition = { --Thi�n m�n kim l�nh, Thi�n cang l�nh, Huy�t b� ��, C�u thi�n v� c�c ��n
				[1] = {8, {2,1,30370}, 8, {2,95,204}, 5, {2,1,31241}, 0, {2,1,1006}, {0, 103, 30610, 1},"n�n �m huy�t"},
				[2] = {8, {2,1,30370}, 8, {2,95,204}, 5, {2,1,31241}, 0, {2,1,1006}, {0, 101, 30610, 1},"Qu�n �m huy�t"},
				[3] = {8, {2,1,30370}, 8, {2,95,204}, 5, {2,1,31241}, 0, {2,1,1006}, {0, 100, 30610, 1},"�o �m huy�t"},
				[4] = {18, {2,1,30370}, 18, {2,95,204}, 5, {2,1,31241}, 1, {2,1,1006}, {},"v� kh� �m huy�t"},
				[5] = {12, {2,1,30370}, 12, {2,95,204}, 5, {2,1,31241}, 1, {2,1,1006}, {0, 102, 31272, 1},"t� gi�i �m huy�t"},
				[6] = {12, {2,1,30370}, 12, {2,95,204}, 5, {2,1,31241}, 1, {2,1,1006}, {0, 102, 31273, 1},"h�u gi�i �m huy�t"},
				[7] = {12, {2,1,30370}, 12, {2,95,204}, 5, {2,1,31241}, 1, {2,1,1006}, {0, 102, 31415, 1},"tr�y �m huy�t"},
				[8] = {12, {2,1,30370}, 12, {2,95,204}, 5, {2,1,31241}, 1, {2,1,1006}, {0, 102, 31414, 1},"b�i �m huy�t"},
				
			}
	local tVuKhi = {
				[2] = {0,3,30884, 1},
				[3] = {0,8,30885, 1},
				[4] = {0,0,30886, 1},
				[6] = {0,1,30887, 1},
				[8] = {0,2,30888, 1},
				[9] = {0,10,30889, 1},
				[11] = {0,0,30890, 1},
				[12] = {0,5,30891, 1},
				[14] = {0,2,30892, 1},
				[15] = {0,9,30893, 1},
				[17] = {0,6,30894, 1},
				[18] = {0,4,30895, 1},
				[20] = {0,7,30896, 1},
				[21] = {0,11,30897, 1},
				[23] = {0,2,30898, 1},
				[25] = {0,3,30899, 1},
				[26] = {0,9,30900, 1},
				[27] = {0,11,30901, 1},
				[29] = {0,13,30902, 1},
				[30] = {0,12,30903, 1},
				[31] = {0,14,32164, 1},
				[32] = {0,2,32192, 1},
			}
	local nRoute = GetPlayerRoute()		
	if ( nRoute == 0 )  then
		Talk ( 1, "" , "Thi�u hi�p ch�a v� m�n ph�i n�n kh�ng th� nh�n th��ng!" )
		return 0
	end
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,1,30370) < tCondition[nChoose][1] then
		Talk(1, "","��i hi�p kh�ng mang �� "..tCondition[nChoose][1].." Thi�n M�n Kim L�nh.")
		return 0
	end
	if GetItemCount(2,95,204) < tCondition[nChoose][3] then
		Talk(1, "", "��i hi�p kh�ng mang �� "..tCondition[nChoose][3].." Thi�n Cang L�nh.")
		return 0
	end
	if GetItemCount(2,1,31241) < tCondition[nChoose][5] then
		Talk(1, "", "��i hi�p kh�ng mang �� "..tCondition[nChoose][5].." Huy�t B� ��.")
		return 0
	end
	if GetItemCount(2,1,1006) < tCondition[nChoose][7] then
		Talk(1, "", "��i hi�p kh�ng mang �� "..tCondition[nChoose][7].." C�u Thi�n V� C�c ��n.")
		return 0
	end
	if DelItem(2,1,30370,tCondition[nChoose][1]) ~= 1 then
		Talk(1,"", "X�a kh�ng th�nh c�ng v�t ph�m 1")
		gf_WriteLogEx("NANG CAP AM HUYET", "xoa", 1, "x�a v�t ph�m TMKL")
		return 0
	end
	if DelItem(2,95,204,tCondition[nChoose][3]) ~= 1 then
		Talk(1,"", "X�a kh�ng th�nh c�ng v�t ph�m 2")
		gf_WriteLogEx("NANG CAP AM HUYET", "xoa", 1, "x�a v�t ph�m TCL")
		return 0
	end
	if DelItem(2,1,31241,tCondition[nChoose][5]) ~= 1 then
		Talk(1,"", "X�a kh�ng th�nh c�ng v�t ph�m 3")
		gf_WriteLogEx("NANG CAP AM HUYET", "xoa", 1, "x�a v�t ph�m HBD")
		return 0
	end
	if DelItem(2,1,1006,tCondition[nChoose][7]) ~= 1 then
		Talk(1,"", "X�a kh�ng th�nh c�ng v�t ph�m 4")
		gf_WriteLogEx("NANG CAP AM HUYET", "xoa", 1, "x�a v�t ph�m CTVCD")
		return 0
	end
	if nChoose == 4 then
		gf_AddItemEx2(tVuKhi[nRoute], tCondition[nChoose][10], "TIEN CAP AM HUYET", "Trang b� �m huy�t");
		Talk(1, "", "Ch�c m�ng ��i hi�p �� n�ng c�p th�nh c�ng v� kh� �m Huy�t.")
	else
		gf_AddItemEx2(tCondition[nChoose][9], tCondition[nChoose][10], "TIEN CAP AM HUYET", "Trang b� �m huy�t");
		Talk(1, "", "Ch�c m�ng ��i hi�p �� n�ng c�p th�nh c�ng trang b� �m Huy�t.")
	end
	gf_WriteLogEx("NANG CAP AM HUYET", "nhan", 1, "N�ng c�p th�nh c�ng")
end
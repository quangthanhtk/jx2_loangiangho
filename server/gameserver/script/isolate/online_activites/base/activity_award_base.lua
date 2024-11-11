--���һЩ���ý�������
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\ks2vng\\isolate\\online_activites\\base\\activity_award_base_vng.lua")

BOOK1 = {
	[2] = {0, 107, 204, "Kim Cang B�t Nh� Ch�n Quy�n "},
	[3] = {0, 107, 206, "V� Tr�n B� �� Ch�n Quy�n"},
	[4] = {0, 107, 205, "Ti�m Long T�c Di�t Ch�n Quy�n"},
	[6] = {0, 107, 207, "Thi�n La Li�n Ch�u Ch�n Quy�n"},
	[8] = {0, 107, 208, "Nh� � Kim ��nh Ch�n Quy�n"},
	[9] = {0, 107, 209, "B�ch H�i Tuy�t �m Ch�n Quy�n"},
	[11] = {0, 107, 210, "H�n ��n Tr�n Nh�c Ch�n Quy�n"},
	[12] = {0, 107, 211, "Qu� Thi�n Du Long Ch�n Quy�n"},
	[14] = {0, 107, 212, "Huy�n �nh M� T�ng Ch�n Quy�n"},
	[15] = {0, 107, 213, "Qu�n T� ��i Phong Ch�n Quy�n"},
	[17] = {0, 107, 214, "Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
	[18] = {0, 107, 215, "Xuy�n V�n L�c H�ng Ch�n Quy�n"},
	[20] = {0, 107, 216, "Huy�n Minh Phong Ma Ch�n Quy�n"},
	[21] = {0, 107, 217, "Linh C� Huy�n T� Ch�n Quy�n"},
	[23] = {0, 107, 218, "C�u Thi�n Phong L�i Ch�n Quy�n"},
	[25] = {0, 107, 219, "H�i Phong Tr�m Nh�t Ch�n Quy�n"},
	[26] = {0, 107, 220, "Ph� K� H�nh Tr�n Ch�n Quy�n"},
	[27] = {0, 107, 221, "Ng�ng Huy�t Phong H�n Ch�n Quy�n"},
	[29] = {0, 107, 222, "H�ng Tr�n T�y M�ng Ch�n Quy�n"},
	[30] = {0, 107, 223, "Phong Hoa Thi�n Di�p Ch�n Quy�n"},	
	[31] = {0, 107, 231, "M� Tung Ch�n Quy�n"},
	[32] = {0, 107, 235, "Thi�n Phong Ch�n Quy�n"},
}

BOOK2 = {
	[2] = {0, 107, 30001, "Kim Cang B�t Nh� Ch�n Quy�n (Cao c�p)"},
	[3] = {0, 107, 30003, "V� Tr�n B� �� Ch�n Quy�n (Cao c�p)"},
	[4] = {0, 107, 30002, "Ti�m Long T�c Di�t Ch�n Quy�n (Cao c�p)"},
	[6] = {0, 107, 30004, "Thi�n La Li�n Ch�u Ch�n Quy�n (Cao c�p)"},
	[8] = {0, 107, 30005, "Nh� � Kim ��nh Ch�n Quy�n (Cao c�p)"},
	[9] = {0, 107, 30006, "B�ch H�i Tuy�t �m Ch�n Quy�n (Cao c�p)"},
	[11] = {0, 107, 30007, "H�n ��n Tr�n Nh�c Ch�n Quy�n (Cao c�p)"},
	[12] = {0, 107, 30008, "Qu� Thi�n Du Long Ch�n Quy�n (Cao c�p)"},
	[14] = {0, 107, 30009, "Huy�n �nh M� T�ng Ch�n Quy�n (Cao c�p)"},
	[15] = {0, 107, 30010, "Qu�n T� ��i Phong Ch�n Quy�n (Cao c�p)"},
	[17] = {0, 107, 30011, "Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n (Cao c�p)"},
	[18] = {0, 107, 30012, "Xuy�n V�n L�c H�ng Ch�n Quy�n (Cao c�p)"},
	[20] = {0, 107, 30013, "Huy�n Minh Phong Ma Ch�n Quy�n (Cao c�p)"},
	[21] = {0, 107, 30014, "Linh C� Huy�n T� Ch�n Quy�n (Cao c�p)"},
	[23] = {0, 107, 30015, "C�u Thi�n Phong L�i Ch�n Quy�n (Cao c�p)"},
	[25] = {0, 107, 30035, "H�i Phong Tr�m Nh�t Ch�n Quy�n (Cao C�p)"},
	[26] = {0, 107, 30036, "Ph� K� H�nh Tr�n Ch�n Quy�n (Cao C�p)"},
	[27] = {0, 107, 30037, "Ng�ng Huy�t Phong H�n Ch�n Quy�n (Cao c�p)"},
	[29] = {0, 107, 30016, "H�ng Tr�n T�y M�ng Ch�n Quy�n (Cao c�p)"},
	[30] = {0, 107, 30017, "Phong Hoa Thi�n Di�p Ch�n Quy�n (Cao c�p)"},	
	[31] = {0, 107, 30041, "M� Tung Ch�n Quy�n"},
	[32] = {0, 107, 30043, "Thi�n Phong Ch�n Quy�n"},
}

--�߼����
function act_give_gaoji_zhenjuan(nNum, bByRoute,  nBind, nKind)
	if not nNum or nNum <= 0 then
		return 0
	end
	nBind = nBind or 4
	local tGgBook = {
		BOOK1,
		BOOK2,
	}
	if not nKind then
		nKind = 1;
	end
	local tBook = tGgBook[nKind];
	local nIndex = 0
	if bByRoute and bByRoute == 1 then
		nIndex = GetPlayerRoute();
	else
		local tRoute = {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,25,26,27,29,30,31,32}
		nIndex = tRoute[random(getn(tRoute))]
	end
	if not tBook[nIndex] then return 0 end
	gf_AddItemEx2({tBook[nIndex][1],tBook[nIndex][2],tBook[nIndex][3], nNum, nBind}, tBook[nIndex][4], "activity", "70_gaoji_zhenjuan", 0, 1);
	return 1
end

function act_finish_pet_task(nTaskId, nBitIdx)
--	Vet_Complete_Revive_OnePartner_FirstStage(nTaskId, nBitIdx)
	local nRet = Vet_Complete_Revive_OnePartner_SecondStage(nTaskId, nBitIdx)
	return nRet
end

Import("\\script\\lib\\globalfunctions.lua")
DSN_NPC = "<color=green>L�o ��i<color>: ";
FilePath = "\\script\\vng\\bandonghanh6\\bandonghanh6.lua"
TSK_CHOOSE_CHOICE = 2664
function pet_changebooklv6()
	local tSay = {};
	tinsert(tSay,"��i 1 s�ch B�H c�p 6 (ti�u hao: 1 s�ch B�H c�p 5 b�t k� + 1 TMKL)/#choose_changebooklv6(1)")
	tinsert(tSay,"��i 1 s�ch B�H c�p 6 (ti�u hao: 1 s�ch B�H c�p 5 b�t k� + 1 TCL)/#choose_changebooklv6(2)")
	tinsert(tSay,"��i 1 s�ch B�H c�p 6 (ti�u hao: 1 s�ch B�H c�p 5 b�t k� + 6000 v�ng)/#choose_changebooklv6(3)")
	       	
	tinsert(tSay, "Ta ch� xem qua th�i./nothing")
	local szHeader = DSN_NPC.."<color=yellow>��i hi�p mu�n ��i 1 s�ch B�n ��ng H�nh c�p 6 c�n ti�u hao 1 trong 3 c�ch sau:<color>\n"..
								"- Ti�u hao: 1 s�ch b�n ��ng h�nh c�p 5 b�t k� + 1 TMKL \n"..
								"- Ti�u hao: 1 s�ch b�n ��ng h�nh c�p 5 b�t k� + 1 TCL \n"..
								"- Ti�u hao: 1 s�ch b�n ��ng h�nh c�p 5 b�t k� + 6000 v�ng\n"
								
	Say(szHeader, getn(tSay), tSay);
end
function nothing()

end

function choose_changebooklv6(nType)
	local nCheck = check_nguyenlieu(nType)
	if nCheck ~= 1 then
		return 0
	end
	SetTask(TSK_CHOOSE_CHOICE, nType)
	PutinItemBox("��i S�ch B�n ��ng H�nh c�p 6" ,1 , "C�n d�ng 1 S�ch B�n ��ng H�nh c�p 5 b�t k� ��i 1 S�ch B�n ��ng H�nh c�p 6 ng�u nhi�n, x�c nh�n ��i?", %FilePath, 1)
end
function OnPutinCheck(param, idx, genre, detail, particular)
    -- print(param, idx, genre, detail, particular)
    if param ~= 1 then
        return 0;
    end
    if genre ~= 2 or detail ~= 150 or particular < 67 or particular > 86 then
        Talk(1, "", "Ch� ���c ��t v�o S�ch B�n ��ng H�nh C�p 5.");
        return 0;
    end
    return 1;
end
function OnPutinComplete(param)
    if param ~= 1 then
        Talk(1, "", "V�t ph�m ��t v�o kh�ng ph�i s�ch B�n ��ng H�nh c�p 5.");
        return 0;
    end
	local nType = GetTask(TSK_CHOOSE_CHOICE)
	local nCheck = check_nguyenlieu(nType)
	if nCheck ~= 1 then
		return 0
	end
	local tbItemList = GetPutinItem();
	local nResult = 1;
	for i=1, getn(tbItemList) do
		if DelItemByIndex(tbItemList[i][1], -1) ~= 1 then
			nResult = 0;
		end
	end
	local nXoaNguyenLieu = xoa_nguyenlieu(nType)
	if nResult ~= 1 or nXoaNguyenLieu ~= 1 then
		Talk(1,"", "X�a v�t ph�m th�t b�i")
		gf_WriteLogEx("SACH PET LEVEL 6", "nh�n th�t b�i", 1, "s�ch b�h c�p 6")	
		return 0
	end
	local tPet_BookLev6 = {
					{1, 6000, "Ch�n kh� h� th�", {2,150,87,1}, 0},
					{1, 6000, "�ch th� di�n th��ng", {2,150,88,1}, 0},
					{1, 6000, "C��ng th�n b� th�", {2,150,89,1}, 0},
					{1, 6000, "�m phong th�c c�t", {2,150,90,1}, 0},
					{1, 5000, "Huy�n v� v� song", {2,150,91,1}, 0},
					{1, 5000, "V� h�nh v� t��ng", {2,150,92,1}, 0},
					{1, 5000, "Kim linh ph� th�", {2,150,93,1}, 0},
					{1, 5000, "M�c linh ph� th�", {2,150,94,1}, 0},
					{1, 5000, "Th�y linh ph� th�", {2,150,95,1}, 0},
					{1, 5000, "H�a linh ph� th�", {2,150,96,1}, 0},
					{1, 5000, "Th� linh ph� th�", {2,150,97,1}, 0},
					{1, 5000, "Ph� kh�ng tr�m �nh", {2,150,98,1}, 0},
					{1, 5000, "S�t th��ng gia n�ng", {2,150,99,1}, 0},
					{1, 5000, "Khinh linh t�n t�t", {2,150,100,1}, 0},
					{1, 5000, "V� h�nh chi c�", {2,150,101,1}, 0},
					{1, 5000, "Linh quang nh�t thi�m", {2,150,102,1}, 0},
					{1, 5800, "Ng�ng th�n quy�t", {2,150,103,1}, 0},
					{1, 5000, "Kinh ��o quy�t", {2,150,104,1}, 0},
					{1, 2600, "Nguy�n th�y b�o n�", {2,150,105,1}, 0},
					{1, 2600, "Thi�t b� sam", {2,150,106,1}, 0},
					}

	gf_EventGiveRandAward(tPet_BookLev6, 100000, 1, "SACH PET LEVEL 6 BK", "award ng�u nhi�n");
	gf_WriteLogEx("SACH PET LEVEL 6", "nh�n", 1, "s�ch b�h c�p 6")	
end

function check_nguyenlieu(nType)
	local nNguyenLieu = {--Thi�n M�n Kim L�nh, Thi�n Cang L�nh, v�ng
								[1] = {{2,1,30370,1}, {2,95,204,0}, 0}, 
								[2] = {{2,1,30370,0}, {2,95,204,1}, 0}, 
								[3] = {{2,1,30370,0}, {2,95,204,0}, 6000}, 
							}
	if gf_Judge_Room_Weight(2,200) ~= 1 then
		Talk(1,"",szNpcName.."H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return 0
	end
	local nCount1 = GetItemCount(nNguyenLieu[nType][1][1],nNguyenLieu[nType][1][2],nNguyenLieu[nType][1][3])
	local nCount2 = GetItemCount(nNguyenLieu[nType][2][1],nNguyenLieu[nType][2][2],nNguyenLieu[nType][2][3])
	local nCount3 = GetCash()

		
	if nCount1 < nNguyenLieu[nType][1][4] then
		Talk(1, "", DSN_NPC.."B�n kh�ng c� �� Thi�n M�n Kim L�nh �� ��i s�ch B�n ��ng H�nh c�p 6 ")
		return 0
	end						
	if nCount2 < nNguyenLieu[nType][2][4] then
		Talk(1, "", DSN_NPC.."B�n kh�ng c� �� Thi�n Cang L�nh �� ��i s�ch B�n ��ng H�nh c�p 6 ")
		return 0
	end	
	if nCount3 < nNguyenLieu[nType][3]*10000 then
		Talk(1, "", DSN_NPC.."B�n kh�ng c� �� 6000 v�ng �� ��i s�ch B�n ��ng H�nh c�p 6 ")
		return 0
	end
	return 1
end
function xoa_nguyenlieu(nType)
	local nNguyenLieu = {--Thi�n M�n Kim L�nh, Thi�n Cang L�nh, v�ng
								[1] = {{2,1,30370,1}, {2,95,204,0}, 0}, 
								[2] = {{2,1,30370,0}, {2,95,204,1}, 0}, 
								[3] = {{2,1,30370,0}, {2,95,204,0}, 6000}, 
							}
	local nDelItem1 = DelItem(nNguyenLieu[nType][1][1],nNguyenLieu[nType][1][2],nNguyenLieu[nType][1][3],nNguyenLieu[nType][1][4])
	local nDelItem2 = DelItem(nNguyenLieu[nType][2][1],nNguyenLieu[nType][2][2],nNguyenLieu[nType][2][3],nNguyenLieu[nType][2][4])
	local nDelItem3 = Pay(nNguyenLieu[nType][3]*10000)
	if nType == 1 or nType == 2 then
		if nDelItem1 == 1 and nDelItem2 == 1 then
			return 1
		end
	elseif nType == 3 then
		if nDelItem3 == 1 then
			return 1
		end
	end
	
	return 0
end

function buy_bachyeunguyenthan()
	local nCash = GetCash()
	if nCash < 40000000 then
		Talk(1,"", "B�n kh�ng mang �� 4000 v�ng �� mua B�ch Y�u Nguy�n Th�n")
		return 0
	end
	if Pay(40000000) == 1 then
		gf_AddItemEx2({2,1,31318,1}, "b�ch y�u nguy�n th�n", "BUY BYNT", "mua bynt");
	end
end
function buy_chieuyeuky()
	local nCount_TMKL = GetItemCount(2,1,30370)
	local nCount_TCL = GetItemCount(2,95,204)
	local nCount_CTVCD = GetItemCount(2,1,1006)
	if nCount_TMKL < 15 then
		Talk(1,"", "B�n kh�ng mang �� 15 Thi�n M�n Kim l�nh �� mua Chi�u Y�u K�")
		return 0
	end
	if nCount_TCL < 15 then
		Talk(1,"", "B�n kh�ng mang �� 15 Thi�n Cang l�nh �� mua Chi�u Y�u K�")
		return 0
	end
	if nCount_CTVCD < 1 then
		Talk(1,"", "B�n kh�ng mang �� 1 C�u Thi�n V� C�c ��n �� mua Chi�u Y�u K�")
		return 0
	end
	if DelItem(2,1,30370,15) == 1 and DelItem(2,95,204,15) == 1 and DelItem(2,1,1006,1) == 1 then
		gf_AddItemEx2({2,1,31307,1}, "Chi�u y�u k�", "BUY CYK", "mua cyk");
	end
end



--by liubo
--�������˽ű�
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\treasure_box\\string.lua")
Import("\\script\\online_activites\\task_values.lua")
Include("\\script\\vng\\config\\newserver.lua");
Include("\\script\\equip_feed\\feed_up_attr_recoup.lua")
Include("\\script\\vng\\weapon_upgrade\\trangbichiencuong.lua")
Include("\\script\\vng\\doinguyenlieu.lua")

FILE_NAME = "\\script\\online_activites\\treasure_box\\npc_treasuer_chests.lua";	
NANGCAPDIEUDUONG_F1 = "\\script\\vng\\weapon_upgrade\\dieuduongcongthuc1.lua";
NANGCAPDIEUDUONG_F2 = "\\script\\vng\\weapon_upgrade\\dieuduongcongthuc2.lua";
NANGCAPDIEUDUONG_NGOCBOI = "\\script\\vng\\weapon_upgrade\\dieuduong_nangcapngocboi.lua"
g_szNpcName = "<color=green>Th��ng Nh�n B�o R��ng: <color>";

TSK_TMP_CHANGE_BKVD = 206
function main()
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	--�Ƿ����ж�
	if gf_CheckEventDateEx(46) ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[5])
		return 0
	end
	--�ж��Ƿ��Ѿ�ת��
	--
	--
--	if GetTask(1538) == 0 then
--		Talk(1,"",tSTRING_TREASUER_NPC[1])
--		return 0
--	end
	local tbSay = {}
	local nSayHead = "<color=green>T� B�o Th��ng Nh�n:<color> Ta chuy�n b�n c�c b�o v�t qu� hi�m, ��i hi�p c�n t�m v�t ph�m g�: "
	if nDate < 20130904 then
		tinsert(tbSay,"Nh�n h� tr� trang b� Kim X�/_On_Repair")
	end
--	tinsert(tbSay, "Ta mu�n ��i nguy�n li�u l�y kinh nghi�m/Trade_Material2Exp_Menu")
--	if tbGioiHanThanTaiBaoRuong[nNation] == nil or nDate >= tbGioiHanThanTaiBaoRuong[nNation] then
		tinsert(tbSay,tSTRING_TREASUER_NPC[3].."/get_wooden")
		tinsert(tbSay,"Ta mu�n ��i 1 B�ch Kim R��ng (ti�u hao 5 T�ng R��ng)/get_BKR")
		tinsert(tbSay,"Ta mu�n ��i 1 Th�n T�i B�o R��ng (ti�u hao 55 T�ng R��ng)/get_TTBR")
	--end
--	tinsert(tbSay,"��i trang b� H�o Nguy�t/get_haonguyet")
--	tinsert(tbSay,"��i trang b� Di�u D��ng/NangCapDieuDuong")
--	tinsert(tbSay,"N�ng c�p ng�c b�i Di�u D��ng 6% th�nh 8%/NangCapDieuDuong_NgocBoi")
--		"N�ng c�p B�ch Kim Vi�m ��/get_BKVD",
--		tSTRING_TREASUER_NPC[4].."/get_treasure",
--	tinsert(tbSay, "��i trang b� Chi�n Cu�ng/TrangBiChienCuong_Form")
	if nDate <= 20200311 then
		tinsert(tbSay,"Ta mu�n mua 1 C� Kim Th�ch (+10 v�n s�c)(ti�u hao 1 TCL, 3000 v�ng)/#shop_uudai_thang32020(1)")
		tinsert(tbSay,"Ta mu�n mua 1 C� Kim Th�ch (+10 v�n s�c)(ti�u hao 1 TMKL, 3000 v�ng)/#shop_uudai_thang32020(2)")
		tinsert(tbSay,"Ta mu�n mua 1 �i�m Tinh Ng�c (+15 v�n s�c)(ti�u hao 2 TCL, 3 TMKL)/#shop_uudai_thang32020(3)")
		tinsert(tbSay,"Ta mu�n ��i 1 th� c��i B�ch Lang (v�nh vi�n)(ti�u hao 17 TCL, 17 TMKL)/#shop_uudai_thang32020(4)")
		tinsert(tbSay,"Ta mu�n ��i 1 th� c��i Chi�n T��ng nguy�n so�i (v�nh vi�n)(ti�u hao 22 TCL, 22 TMKL)/#shop_uudai_thang32020(5)")
	end
		--tinsert(tbSay,"Ta mu�n ��i 1 T�i trang b� Kim X� 7 (19 TMKL, 19 TCL, 1500 TNL)/change_KimXa7")
		--tinsert(tbSay,"Ta mu�n ��i v�t ph�m t�y luy�n Kim X� 7/menu_tayluyenkimxa7")
		tinsert(tbSay,"R�i kh�i/do_nothing")
	
	Say(nSayHead, getn(tbSay), tbSay)
end

function get_wooden()
	local nNum = GetTask(VET_TREASURE_BOX_MNUM)
	local tNumWooden = {2,5,12}
	local nIndex = floor(nNum/20)+1
	if nIndex < 3 then
		Say(TREASURE_NPC_NMAE..format(tSTRING_TREASUER_NPC[5],tNumWooden[nIndex],nIndex*20-nNum),2,format("Ta mu�n mua/#pay_award(%d,0,%d)",nIndex*20-nNum,tNumWooden[nIndex]),"Kh�ng c�n ��u/do_nothing")
	else
		Say(TREASURE_NPC_NMAE..format(tSTRING_TREASUER_NPC[6],tNumWooden[3]),2,format("Ta mu�n mua/#pay_award(%d,0,%d)",999,tNumWooden[3]),"Kh�ng c�n ��u/do_nothing")
	end
end

function get_treasure()
	local nNum = GetTask(VET_TREASURE_BOX_CNUM)
	local tNumTreasure = { 60, 150, 400 }
	local nIndex = floor(nNum / 20) + 1
	if nIndex < 3 then
		Say(TREASURE_NPC_NMAE .. format(tSTRING_TREASUER_NPC[5], tNumTreasure[nIndex], nIndex * 20 - nNum), 2, format("Ta mu�n mua/#pay_award(%d,1,%d)", nIndex * 20 - nNum, tNumTreasure[nIndex]), "Kh�ng c�n ��u/do_nothing")
	else
		Say(TREASURE_NPC_NMAE .. format(tSTRING_TREASUER_NPC[6], tNumTreasure[3]), 2, format("Ta mu�n mua/#pay_award(%d,1,%d)", 999, tNumTreasure[3]), "Kh�ng c�n ��u/do_nothing")
	end
end

function pay_award(nNum1,nNum2,nNum3)
	local nNum = GetItemCount(2, 1, 30230)
	if nNum2 == 0 then
		if nNum < nNum1 * nNum3 then nNum1 = floor(nNum / nNum3) end
		AskClientForNumber("pay_wooden", 1, nNum1, "H�y nh�p s� l��ng", "")
	end
	if nNum2 == 1 then
		if nNum < nNum1 * nNum3 then nNum1 = floor(nNum / nNum3) end
		AskClientForNumber("pay_treasure", 1, nNum1, "H�y nh�p s� l��ng", "")
	end
end

function pay_wooden(nNum)
	local nNumTask = GetTask(VET_TREASURE_BOX_MNUM)
	local tNumWooden = { 2, 5, 12 }
	local nIndex = floor(nNumTask / 20) + 1
	if nIndex > 3 then nIndex = 3 end
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		Talk(1, "", tSTRING_TREASUER_BOX[4])
		return 0
	end
	if GetItemCount(2, 1, 30230) < nNum * tNumWooden[nIndex] then
		Talk(1, "", format(tSTRING_TREASUER_NPC[7], nNum * tNumWooden[nIndex]))
		return 0
	end
	if DelItem(2, 1, 30230, nNum * tNumWooden[nIndex]) == 1 then
		if gf_AddItemEx({ 2, 1, 30340, nNum }, "M�c R��ng", nNum) ~= 1 then
			return 0
		end
		SetTask(VET_TREASURE_BOX_MNUM, nNumTask + nNum)
		return 1
	end
	return 0
end

function pay_treasure(nNum)
	local nNumTask = GetTask(VET_TREASURE_BOX_CNUM)
	local tNumTreasure = { 60, 150, 400 }
	local nIndex = floor(nNumTask / 20) + 1
	if nIndex > 3 then nIndex = 3 end
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		Talk(1, "", tSTRING_TREASUER_BOX[4])
		return 0
  	end
	if GetItemCount(2,1,30230) < nNum * tNumTreasure[nIndex] then
		Talk(1,"",format(tSTRING_TREASUER_NPC[7],nNum * tNumTreasure[nIndex]))
		return 0 
	end	
	if DelItem(2,1,30230,nNum * tNumTreasure[nIndex]) == 1 then
		if gf_AddItemEx2({2,1,30341,nNum},"��i T�ng R��ng lo�i "..tNumTreasure[nIndex].." xu","Than Tai Bao Ruong","��i T�ng R��ng th�nh c�ng",0,1) ~= 1 then
			return 0
		end
		SetTask(VET_TREASURE_BOX_CNUM, nNumTask + nNum)
		return 1
	end
	return 0
end

function do_nothing()
end

function get_BKVD()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H�y ch�n trang b� c�n n�ng c�p."
	
	tinsert(tbSayDialog, "- Ta c�n ��i 1 B�ch Kim Vi�m �� Kh�i (100 M�nh B�ch Kim + 3 B�ch Kim H�ng Bao (c� ch�a 4000 v�ng + 1 Thi�n Chi Vi�m �� Kh�i[+12])/#get_BKVD_confirm(1,0)")
	tinsert(tbSayDialog, "- Ta c�n ��i 1 B�ch Kim Vi�m �� Gi�p (100 M�nh B�ch Kim + 3 B�ch Kim H�ng Bao (c� ch�a 4000 v�ng + 1 Thi�n Chi Vi�m �� Gi�p[+12])/#get_BKVD_confirm(2,0)")
	tinsert(tbSayDialog, "- Ta c�n ��i 1 B�ch Kim Vi�m �� Trang (100 M�nh B�ch Kim + 3 B�ch Kim H�ng Bao (c� ch�a 4000 v�ng + 1 Thi�n Chi Vi�m �� Trang[+12])/#get_BKVD_confirm(3,0)")
	tinsert(tbSayDialog, "Tr� l�i/main")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function get_haonguyet()
	do return 0 end
	
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H�y ch�n trang b� c�n ��i."
	
	tinsert(tbSayDialog, "- Ta c�n ��i N�n H�o Nguy�t (8 M�nh B�ch Kim + 1 N� Oa Tinh Th�ch + 1 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(1,0)")
	tinsert(tbSayDialog, "- Ta c�n ��i �o H�o Nguy�t (6 M�nh B�ch Kim + 1 N� Oa Tinh Th�ch + 1 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(2,0)")
	tinsert(tbSayDialog, "- Ta c�n ��i Qu�n H�o Nguy�t (6 M�nh B�ch Kim + 1 N� Oa Tinh Th�ch + 1 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(3,0)")
	tinsert(tbSayDialog, "- Ta c�n ��i Trang S�c H�o Nguy�t (12 M�nh B�ch Kim + 2 N� Oa Tinh Th�ch + 2 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/get_haonguyet_trangsuc")
	tinsert(tbSayDialog, "- Ta c�n ��i V� Kh� H�o Nguy�t (16 M�nh B�ch Kim + 4 N� Oa Tinh Th�ch + 4 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(5,0)")
	tinsert(tbSayDialog, "Tr� l�i/main")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function get_haonguyet_trangsuc()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H�y ch�n trang b� c�n ��i."
	
	tinsert(tbSayDialog, "- Ta c�n ��i H�o Nguy�t-X�ch T��c Ho�n (12 M�nh B�ch Kim + 2 N� Oa Tinh Th�ch + 2 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(4,1)")
	tinsert(tbSayDialog, "- Ta c�n ��i H�o Nguy�t-T� Giao Ng�c B�i (12 M�nh B�ch Kim + 2 N� Oa Tinh Th�ch + 2 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(4,2)")
	tinsert(tbSayDialog, "- Ta c�n ��i H�o Nguy�t-V�n H� L�nh (12 M�nh B�ch Kim + 2 N� Oa Tinh Th�ch + 2 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(4,3)")
	tinsert(tbSayDialog, "- Ta c�n ��i H�o Nguy�t-� L�n B�o Gi�i (12 M�nh B�ch Kim + 2 N� Oa Tinh Th�ch + 2 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(4,4)")
	tinsert(tbSayDialog, "- Ta c�n ��i H�o Nguy�t-B�ch Quy Li�n (12 M�nh B�ch Kim + 2 N� Oa Tinh Th�ch + 2 B�ch Kim ��i H�ng Bao( c� ch�a 4000 v�ng)/#get_haonguyet_confirm(4,5)")
	tinsert(tbSayDialog, "Tr� l�i/get_haonguyet")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function get_BKVD_confirm(nGetType, nSelected)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "","Ph�i gia nh�p h� ph�i m�i n�ng c�p trang b� ���c!");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 500, "") == 0 then
        return 0;
     end
    	local nItemNum1 = tItem_need[1][3]
	if GetItemCount(2,1,30346) < nItemNum1 then
		Talk(1, "", "B�n kh�ng �� "..tItem_need[1][1].." �� ��i trang b� B�ch Kim Vi�m ��")
		return 0
	end
	    	local nItemNum2 = tItem_need[2][3]
	if GetItemCount(2,1,30229) < nItemNum2 then
		Talk(1, "", "B�n kh�ng �� "..tItem_need[2][1].." �� ��i trang b� B�ch Kim Vi�m ��")
		return 0
	end
	SetTaskTemp(TSK_TMP_CHANGE_BKVD,nGetType)
	local nSlot = BKVD_need[nGetType][1]		
	PutinItemBox("��i trang b�" ,nSlot , "X�c nh�n mu�n th�c hi�n n�ng c�p trang b�?", FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
	local nGetType = GetTaskTemp(TSK_TMP_CHANGE_BKVD)
	if nGetType == 0 then
		return 0;
	end
	
	local tb_item = BKVD_need[nGetType][3]
	local tItem = {}
	local check = 0

	for i = 1, getn(tb_item) do
		tinsert(tItem,tb_item[i])
	end
	for i=1,getn(tItem) do
		local nG, nD, nP = gf_UnPack(tb_item[i])
		if (GetEquipAttr(idx,2) < 12) and genre == 0 then
			Talk(1,"",g_szNpcName.."�� c��ng h�a v�t ph�m ph�i t� 12 tr� l�n");
			return 0;		
		end
		if (genre == nG and detail == nD and particular == nP) then	
			check = 1	
		end
	end
	if check == 1 then
		return 1
	end
	Talk(1, "", g_szNpcName.."Ch� c� th� b� v�o "..BKVD_need[nGetType][2]);
	return 0;
end

function OnPutinComplete(param)
	local nGetType = GetTaskTemp(TSK_TMP_CHANGE_BKVD)
	if nGetType == 0 then
		Talk(1, "", g_szNpcName.."B� v�o v�t ph�m kh�ng ��ng");
		return 0;
	end
	if param ~= 1 then
		Talk(1, "", g_szNpcName.."B� v�o v�t ph�m kh�ng ��ng");
		return 0;
	end
	local t = GetPutinItem()
	if getn(t) ~= BKVD_need[nGetType][1] then
		Talk(1, "", g_szNpcName.."B� v�o v�t ph�m kh�ng ��ng");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 500, "") == 0 then
        return 0;
     end
    	local nItemNum1 = tItem_need[1][3]
	if GetItemCount(2,1,30346) < nItemNum1 then
		Talk(1, "", "B�n kh�ng �� "..tItem_need[1][1].." �� ��i trang b� B�ch Kim Vi�m ��")
		return 0
	end
	    	local nItemNum2 = tItem_need[2][3]
	if GetItemCount(2,1,30229) < nItemNum2 then
		Talk(1, "", "B�n kh�ng �� "..tItem_need[2][1].." �� ��i trang b� B�ch Kim Vi�m ��")
		return 0
	end
	local nResult = 1
	for i = 1, getn(t) do		
		if DelItemByIndex(t[i][1], -1) ~= 1 then
			nResult = 0;
			break;
		end
	end
	local nItemNum1 = tItem_need[1][3]
	local nItemNum2 = tItem_need[2][3]
	local nbody = GetBody()
	if nResult ==1 then
		if DelItem(2,1,30346, nItemNum1) == 1 and DelItem(2,1,30229, nItemNum2) == 1 then
			SetTaskTemp(TSK_TMP_CHANGE_BKVD,0)
			local nItem = BKVD_suc[nGetType][2][nbody]
			gf_AddItemEx2(nItem, "N�ng c�p trang b� th�nh c�ng", "NANG CAP TRANG BI BKVD", "n�ng c�p th�nh c�ng")
			Talk(1,"","Ch�c m�ng b�n nh�n ���c 1 trang b� B�ch Kim Vi�m ��!")
		end
	end
end

function get_haonguyet_confirm(nGetType, nSelected)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "","Ph�i gia nh�p h� ph�i m�i n�ng c�p trang b� ���c!");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 500, "") == 0 then
        return 0;
     end
     if nGetType == 1 then
    		if GetItemCount(2,1,30346) < 8 then
			Talk(1, "", "B�n kh�ng �� 8 m�nh B�ch Kim �� ��i trang b� H�o Nguy�t")
			return 0
		end
    		if GetItemCount(2,1,30229) < 1 then
			Talk(1, "", "B�n kh�ng �� 1 B�ch Kim ��i H�ng Bao �� ��i trang b� H�o Nguy�t")
			return 0
		end		
    		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", "B�n kh�ng �� 1 N� Oa Tinh Th�ch �� ��i trang b� H�o Nguy�t")
			return 0
		end			
     end
     if nGetType == 2 then
    		if GetItemCount(2,1,30346) < 6 then
			Talk(1, "", "B�n kh�ng �� 6 m�nh B�ch Kim �� ��i trang b� H�o Nguy�t")
			return 0
		end
    		if GetItemCount(2,1,30229) < 1 then
			Talk(1, "", "B�n kh�ng �� 1 B�ch Kim ��i H�ng Bao �� ��i trang b� H�o Nguy�t")
			return 0
		end	
    		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", "B�n kh�ng �� 1 N� Oa Tinh Th�ch �� ��i trang b� H�o Nguy�t")
			return 0
		end					
     end
     if nGetType == 3 then
     		if GetItemCount(2,1,30346) < 6 then
			Talk(1, "", "B�n kh�ng �� 6 m�nh B�ch Kim �� ��i trang b� H�o Nguy�t")
			return 0
		end   
    		if GetItemCount(2,1,30229) < 1 then
			Talk(1, "", "B�n kh�ng �� 1 B�ch Kim ��i H�ng Bao �� ��i trang b� H�o Nguy�t")
			return 0
		end	
    		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", "B�n kh�ng �� 1 N� Oa Tinh Th�ch �� ��i trang b� H�o Nguy�t")
			return 0
		end							
     end     
     if nGetType == 4 then
    		if GetItemCount(2,1,30346) < 12 then
			Talk(1, "", "B�n kh�ng �� 12 m�nh B�ch Kim �� ��i trang b� H�o Nguy�t")
			return 0
		end    	
    		if GetItemCount(2,1,30229) < 2 then
			Talk(1, "", "B�n kh�ng �� 2 B�ch Kim ��i H�ng Bao �� ��i trang b� H�o Nguy�t")
			return 0
		end		
    		if GetItemCount(2,1,504) < 2 then
			Talk(1, "", "B�n kh�ng �� 2 N� Oa Tinh Th�ch �� ��i trang b� H�o Nguy�t")
			return 0
		end					
     end
     if nGetType == 5 then
    		if GetItemCount(2,1,30346) < 16 then
			Talk(1, "", "B�n kh�ng �� 16 m�nh B�ch Kim �� ��i trang b� H�o Nguy�t")
			return 0
		end    	
    		if GetItemCount(2,1,30229) < 4 then
			Talk(1, "", "B�n kh�ng �� 4 B�ch Kim ��i H�ng Bao �� ��i trang b� H�o Nguy�t")
			return 0
		end		
    		if GetItemCount(2,1,504) < 4 then
			Talk(1, "", "B�n kh�ng �� 4 N� Oa Tinh Th�ch �� ��i trang b� H�o Nguy�t")
			return 0
		end					
     end          

	local nbody = GetBody()
	local nfaction = GetPlayerRoute()
     if nGetType == 1 then	
     		if DelItem(2,1,30346, 8) == 1 and DelItem(2,1,30229, 1) == 1 and DelItem(2,1,504, 1) == 1 then
     			local nNon = tHaoNguyet_suc[nGetType][nfaction][2][nbody]
     			gf_AddItemEx2(nNon, "��i trang b� th�nh c�ng", "DOI TRANG BI", "��i th�nh c�ng")
			Talk(1,"","��i trang b� th�nh c�ng!")
     		end
     end
	if nGetType == 2 then	
     		if DelItem(2,1,30346, 6) == 1 and DelItem(2,1,30229, 1) == 1 and DelItem(2,1,504, 1) == 1 then
     			local nAo = tHaoNguyet_suc[nGetType][nfaction][2][nbody]
     			gf_AddItemEx2(nAo, "��i trang b� th�nh c�ng", "DOI TRANG BI", "��i th�nh c�ng")
			Talk(1,"","��i trang b� th�nh c�ng!")
     		end
     end
     if nGetType == 3 then	
     		if DelItem(2,1,30346, 6) == 1 and DelItem(2,1,30229, 1) == 1 and DelItem(2,1,504, 1) == 1 then
     			local nQuan = tHaoNguyet_suc[nGetType][nfaction][2][nbody]
     			gf_AddItemEx2(nQuan, "��i trang b� th�nh c�ng", "DOI TRANG BI", "��i th�nh c�ng")
			Talk(1,"","��i trang b� th�nh c�ng!")
     		end
     end
     if nGetType == 4 then
          	if DelItem(2,1,30346, 12) == 1 and DelItem(2,1,30229, 2) == 1 and DelItem(2,1,504, 2) == 1 then
			local nTrangsuc = tHaoNguyet_suc[nGetType][nSelected][2]
			gf_AddItemEx2(nTrangsuc, "��i trang b� th�nh c�ng", "DOI TRANG BI", "��i th�nh c�ng ")
			Talk(1,"","��i trang b� th�nh c�ng!")
		end
	end
	if nGetType == 5 then
	 	if DelItem(2,1,30346, 16) == 1 and DelItem(2,1,30229, 4) == 1 and DelItem(2,1,504, 4) == 1 then
			local nVukhi = tHaoNguyet_suc[nGetType][nfaction][2]
			gf_AddItemEx2(nVukhi, "��i trang b� th�nh c�ng", "DOI TRANG BI", "��i th�nh c�ng ")
			Talk(1,"","��i trang b� th�nh c�ng!")
		end
	end
	
end

function get_item_count(t, id1, id2, id3)
	local nCount = 0
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then  
			nCount = nCount + 1
		end
	end
	return nCount
end

function get_BKR()
	local nCountTR = GetItemCount(2, 1, 30341)
	local nMax = 0
	if nCountTR > 0 then
		nMax = floor(nCountTR / 5)
	end
	AskClientForNumber("Confirm_get_BKR", 0, nMax, "B�ch Kim R��ng")
end
function get_TTBR()
	local nCountTR = GetItemCount(2, 1, 30341)
	local nMax = 0
	if nCountTR > 0 then
		nMax = floor(nCountTR / 55)
	end
	AskClientForNumber("Confirm_get_TTBR", 0, nMax, "Th�n T�i R��ng")
end

function Confirm_get_BKR(nCount)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	if gf_Judge_Room_Weight(5, 50," ") ~= 1 then
        	return
    end
	if GetItemCount(2,1,30341) < 5 * nCount then
		Talk(1, "", "B�n kh�ng �� T�ng R��ng �� ��i B�ch Kim R��ng")
		return 0
	end    	
	if DelItem(2,1,30341, 5 * nCount) == 1 then
		gf_AddItemEx2({2,1,30343,nCount}, "B�ch Kim R��ng", "Than Tai Bao Ruong", "nh�n th�nh c�ng")
        gf_WriteLogEx("Than Tai Bao Ruong", "��i th�nh c�ng", nCount, "S� l��ng B�ch Kim R��ng")			
	end
end

function Confirm_get_TTBR(nCount)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	if gf_Judge_Room_Weight(5, 50," ") ~= 1 then
        	return
    end
	if GetItemCount(2,1,30341) < 55 * nCount then
		Talk(1, "", "B�n kh�ng �� T�ng R��ng �� ��i Th�n T�i B�o R��ng")
		return 0
	end    	
	if DelItem(2,1,30341, 55 * nCount) == 1 then
		gf_AddItemEx2({2,1,30344,nCount}, "Th�n T�i R��ng", "Than Tai Bao Ruong", "nh�n th�nh c�ng")
		gf_WriteLogEx("Than Tai Bao Ruong", "��i th�nh c�ng", nCount, "S� l��ng Th�n T�i R��ng")	
	end
end


function NangCapDieuDuong()
	do return 0 end 
	
	local tbSay = {
		"N�ng c�p b�ng Thi�n M�n Kim L�nh v� trang b� H�o Nguy�t/NangCapDieuDuong_CongThuc1_Form",
		"N�ng c�p b�ng Thi�n M�n Kim L�nh, C� Linh Ng�c v� trang b� H�o Nguy�t/NangCapDieuDuong_CongThuc2_Form",
	}
	Say("N�ng c�p trang b� H�o Nguy�t th�nh Di�u D��ng", getn(tbSay), tbSay)
end


function NangCapDieuDuong_CongThuc1_Form()
	local szTitle = "N�ng c�p trang b� H�o Nguy�t th�nh Di�u D��ng c�n:\n- N�n: 5 Thi�n M�n Kim L�nh\n- �o: 6 Thi�n M�n Kim L�nh\n- Qu�n: 7 Thi�n M�n Kim L�nh\n- Trang s�c: 6 Thi�n M�n Kim L�nh\n- V� Kh�: 11 Thi�n M�n Kim L�nh"
	local tbSay = {
		"Ta mu�n n�ng c�p/NangCapDieuDuong_CongThuc1",
		"Ta ch� gh� xem th�i/gf_DoNothing",
	}
	Say(szTitle, getn(tbSay), tbSay)
end


function NangCapDieuDuong_CongThuc2_Form()
	local szTitle = "N�ng c�p trang b� H�o Nguy�t th�nh Di�u D��ng c�n:\n- N�n: 3 Thi�n M�n Kim L�nh, 500 C� Linh Ng�c\n- �o: 3 Thi�n M�n Kim L�nh, 500 C� Linh Ng�c\n- Qu�n: 3 Thi�n M�n Kim L�nh, 500 C� Linh Ng�c\n- Trang s�c: 3 Thi�n M�n Kim L�nh, 500 C� Linh Ng�c\n- V� Kh�: 6 Thi�n M�n Kim L�nh, 1000 C� Linh Ng�c"
	local tbSay = {
		"Ta mu�n n�ng c�p/NangCapDieuDuong_CongThuc2",
		"Ta ch� gh� xem th�i/gf_DoNothing",
	}
	Say(szTitle, getn(tbSay), tbSay)
end


function NangCapDieuDuong_CongThuc1()
	do return 0 end 
	
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", NANGCAPDIEUDUONG_F1, 1)
end


function NangCapDieuDuong_CongThuc2()
	do return 0 end 
	
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", NANGCAPDIEUDUONG_F2, 1)
end


function NangCapDieuDuong_NgocBoi()
	do return 0 end 
	
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", NANGCAPDIEUDUONG_NGOCBOI, 1)
end

function shop_uudai_thang32020(nChoose)
	local tCondition = { -- Thi�n cang l�nh, Thi�n m�n kim l�nh, v�ng, id v�t ph�m
				[1] = {1 , {2,95,204}, 0 , {2,1,30370}, 3000	, {2, 201, 14, 1},"C��ng h�a v�n s�c +10"},
				[2] = {0 , {2,95,204}, 1 , {2,1,30370}, 3000	, {2, 201, 14, 1},"C��ng h�a v�n s�c +10"},
				[3] = {2 , {2,95,204}, 3 , {2,1,30370}, 0	  	, {2, 201, 16, 1},"C��ng h�a v�n s�c +15"},
				[4] = {17, {2,95,204}, 17, {2,1,30370}, 0		, {0, 105, 206,  1,1,-1,-1,-1,-1,-1,-1,-1},"B�ch lang"},
				[5] = {22, {2,95,204}, 22, {2,1,30370}, 0		, {0, 105, 30033,1,1,-1,-1,-1,-1,-1,-1,-1},"Chi�n t��ng"},
			}
			
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,95,204) < tCondition[nChoose][1] then
		Talk(1, "", g_szNpcName.."��i hi�p kh�ng mang �� "..tCondition[nChoose][1].." Thi�n Cang L�nh.")
		return 0
	end
	if GetItemCount(2,1,30370) < tCondition[nChoose][3] then
		Talk(1, "",g_szNpcName.."��i hi�p kh�ng mang �� "..tCondition[nChoose][3].." Thi�n M�n Kim L�nh.")
		return 0
	end
	if GetCash() < 	tCondition[nChoose][5]*10000 then
		Talk(1, "",g_szNpcName.."��i hi�p kh�ng mang �� "..tCondition[nChoose][5].." v�ng.")
		return 0
	end
	local nHor = GetTask(701);
	local nTypeHor = GetTask(704);
	if nChoose == 5 then
		if abs(nHor) < 5000000  then
			Talk(1, "", g_szNpcName.."Ta ch� nh�n b�n Chi�n T��ng cho Nguy�n So�i v� c� c�ng tr�ng t� 5000000 �i�m tr� l�n.");
			return 0
		end
		if abs(nTypeHor) < 6  then
			Talk(1, "", g_szNpcName.."Ta ch� nh�n b�n Chi�n T��ng cho Nguy�n So�i v� c� c�ng tr�ng t� 5000000 �i�m tr� l�n!");
			return 0
		end
	end
	--****************
	if nChoose == 1 then
		if DelItem(2,95,204,tCondition[nChoose][1]) == 1 and Pay(tCondition[nChoose][5]*10000) == 1 then
			gf_AddItemEx2(tCondition[nChoose][6], tCondition[nChoose][7], "UU DAI THANG 3 2020 BK", tCondition[nChoose][7]);
			Talk(1, "", "Ch�c m�ng ��i hi�p �� n�ng c�p th�nh c�ng trang b� "..tCondition[nChoose][8])	
			gf_WriteLogEx("UU DAI THANG 3 2020", "nhan", 1, tCondition[nChoose][7])
		end
	end
	if nChoose == 2 then
		if DelItem(2,1,30370,tCondition[nChoose][3]) == 1 and Pay(tCondition[nChoose][5]*10000) == 1 then
			gf_AddItemEx2(tCondition[nChoose][6], tCondition[nChoose][7], "UU DAI THANG 3 2020 BK", tCondition[nChoose][7]);
			Talk(1, "", "Ch�c m�ng ��i hi�p �� n�ng c�p th�nh c�ng trang b� "..tCondition[nChoose][8])	
			gf_WriteLogEx("UU DAI THANG 3 2020", "nhan", 1, tCondition[nChoose][7])
		end
	end
	if nChoose == 3 or nChoose == 4 or nChoose == 5 then
		if DelItem(2,95,204,tCondition[nChoose][1]) == 1 and DelItem(2,1,30370,tCondition[nChoose][3]) == 1 then
			gf_AddItemEx2(tCondition[nChoose][6], tCondition[nChoose][7], "UU DAI THANG 3 2020 BK", tCondition[nChoose][7]);
			Talk(1, "", "Ch�c m�ng ��i hi�p �� n�ng c�p th�nh c�ng trang b� "..tCondition[nChoose][8])	
			gf_WriteLogEx("UU DAI THANG 3 2020", "nhan", 1, tCondition[nChoose][7])
		end
	end

end

function change_KimXa7()
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,1,30370) < 19 then
		Talk(1, "",g_szNpcName.."��i hi�p kh�ng mang �� 19 Thi�n M�n Kim L�nh.")
		return 0
	end
	if GetItemCount(2,95,204) < 19 then
		Talk(1, "", g_szNpcName.."��i hi�p kh�ng mang �� 19 Thi�n Cang L�nh.")
		return 0
	end
	if GetItemCount(2,1,30687) < 1500 then
		Talk(1, "", g_szNpcName.."��i hi�p kh�ng mang �� 1500 Th�i Nh�t L�nh.")
		return 0
	end
	if DelItem(2,1,30370,19) == 1 and DelItem(2,95,204,19) == 1 and DelItem(2,1,30687,1500) == 1 then
		gf_AddItemEx2({2,1,31400,1}, "T�i trang b� Kim X� 7", "CHANGE KIM XA 7 BK", "T�i trang b� Kim X� 7");
		Talk(1, "", g_szNpcName.."Ch�c m�ng ��i hi�p �� ��i th�nh c�ng T�i trang b� Kim X� 7")	
		gf_WriteLogEx("CHANGE KIM XA 7", "nhan", 1, "T�i Kim X� 7")
	end
end
function menu_tayluyenkimxa7()
	local tbSay = {}
	local szSayHead = g_szNpcName.."��i hi�p mu�n ��i v�t ph�m t�y luy�n Kim X� 7 theo c�ch n�o:"
	tinsert(tbSay,"��i 1 T�y T�m Th�ch c�p 7: c�n 2 T�y T�m Th�ch c�p 6 + 200 v�ng/#change_tayluyenkimxa7(7)")
	tinsert(tbSay,"��i 1 Luy�n L� Thi�t c�p 7: c�n 2 Luy�n L� Thi�t c�p 6 + 200 v�ng/#change_tayluyenkimxa7(8)")
	tinsert(tbSay,"��i 1 T�a Linh Th�ch cao(1) Kim X� 7: c�n 2 T� Linh Quy�t + 2 linh th�ch kh�a(1)/#change_tayluyenkimxa7(1)")
	tinsert(tbSay,"��i 1 T�a Linh Th�ch cao(2) Kim X� 7: c�n 2 T� Linh Quy�t + 2 linh th�ch kh�a(2)/#change_tayluyenkimxa7(2)")
	tinsert(tbSay,"��i 1 T�a Linh Th�ch cao(3) Kim X� 7: c�n 2 T� Linh Quy�t + 2 linh th�ch kh�a(3)/#change_tayluyenkimxa7(3)")
	tinsert(tbSay,"��i 1 T�a Linh Th�ch cao(4) Kim X� 7: c�n 2 T� Linh Quy�t + 2 linh th�ch kh�a(4)/#change_tayluyenkimxa7(4)")
	tinsert(tbSay,"��i 1 T�a Linh Th�ch cao(5) Kim X� 7: c�n 2 T� Linh Quy�t + 2 linh th�ch kh�a(5)/#change_tayluyenkimxa7(5)")
	tinsert(tbSay,"��i 1 T�a Linh Th�ch cao(6) Kim X� 7: c�n 2 T� Linh Quy�t + 2 linh th�ch kh�a(6)/#change_tayluyenkimxa7(6)")
	tinsert(tbSay,"R�i kh�i/do_nothing")
	
	Say(szSayHead, getn(tbSay), tbSay)
end
function change_tayluyenkimxa7(nChoose)
local tCondition = { -- T� linh quy�t, linh th�ch kh�a, t�y t�m th�ch c�p 6, luy�n l� thi�t c�p 6, v�ng, get item
				[1] = {2, {2,1,31248}, 2, {2,1,30904}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31391,1}, "t�a linh thach cao 1"},
				[2] = {2, {2,1,31248}, 2, {2,1,30905}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31392,1}, "t�a linh thach cao 2"},
				[3] = {2, {2,1,31248}, 2, {2,1,30906}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31393,1}, "t�a linh thach cao 3"},
				[4] = {2, {2,1,31248}, 2, {2,1,30907}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31394,1}, "t�a linh thach cao 4"},
				[5] = {2, {2,1,31248}, 2, {2,1,30908}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31395,1}, "t�a linh thach cao 5"},
				[6] = {2, {2,1,31248}, 2, {2,1,30909}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31396,1}, "t�a linh thach cao 6"},
				[7] = {0, {2,1,31248}, 0, {2,1,30908}, 2, {2,1,30526}, 0, {2,1,30532}, 200, {2,1,31402,1}, "T�y T�m Th�ch c�p 7"},
				[8] = {0, {2,1,31248}, 0, {2,1,30909}, 0, {2,1,30526}, 2, {2,1,30532}, 200, {2,1,31401,1}, "Luy�n L� Thi�t c�p 7"},
			}
			
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,1,31248) < tCondition[nChoose][1] then
		Talk(1, "", g_szNpcName.."��i hi�p kh�ng mang �� "..tCondition[nChoose][1].." T� linh quy�t.")
		return 0
	end
	if GetItemCount(2,1,tCondition[nChoose][4][3]) < tCondition[nChoose][3] then
		Talk(1, "",g_szNpcName.."��i hi�p kh�ng mang �� "..tCondition[nChoose][3].." Linh Th�ch kh�a "..nChoose..".")
		return 0
	end
	if GetItemCount(2,1,30526) < tCondition[nChoose][5] then
		Talk(1, "", g_szNpcName.."��i hi�p kh�ng mang �� "..tCondition[nChoose][5].." T�y T�m Th�ch c�p 6.")
		return 0
	end
	if GetItemCount(2,1,30532) < tCondition[nChoose][7] then
		Talk(1, "", g_szNpcName.."��i hi�p kh�ng mang �� "..tCondition[nChoose][7].." Luy�n L� Thi�t c�p 6.")
		return 0
	end
	if GetCash() < 	tCondition[nChoose][9]*10000then
		Talk(1, "",g_szNpcName.."��i hi�p kh�ng mang �� 200 v�ng.")
		return 0
	end
	--*******************************
	if nChoose <= 6 then
		if DelItem(2,1,31248,2) == 1 and DelItem(2,1,tCondition[nChoose][4][3],2) == 1 then
			gf_AddItemEx2({2,1,31390 + nChoose,1}, tCondition[nChoose][11], "CHANGE TAY LUYEN KIM XA 7 BK", tCondition[nChoose][11]);
			Talk(1, "", g_szNpcName.."Ch�c m�ng ��i hi�p �� ��i th�nh c�ng v�t ph�m "..tCondition[nChoose][11])	
			gf_WriteLogEx("CHANGE TAY LUYEN KIM XA 7", "nhan", 1, tCondition[nChoose][11])
		end
	end
	if nChoose == 7 then
		if DelItem(2,1,30526,tCondition[nChoose][5]) == 1 and Pay(tCondition[nChoose][9]*10000) == 1 then
			gf_AddItemEx2(tCondition[nChoose][10], tCondition[nChoose][11], "CHANGE TAY LUYEN KIM XA 7 BK", tCondition[nChoose][11]);
			Talk(1, "", g_szNpcName.."Ch�c m�ng ��i hi�p �� ��i th�nh c�ng T�y T�m Th�ch c�p 7")	
			gf_WriteLogEx("CHANGE TAY LUYEN KIM XA 7", "nhan", 1, tCondition[nChoose][11])
		end
	end
	if nChoose == 8 then
		if DelItem(2,1,30532,tCondition[nChoose][7]) == 1 and Pay(tCondition[nChoose][9]*10000) == 1 then
			gf_AddItemEx2(tCondition[nChoose][10], tCondition[nChoose][11], "CHANGE TAY LUYEN KIM XA 7 BK", tCondition[nChoose][11]);
			Talk(1, "", g_szNpcName.."Ch�c m�ng ��i hi�p �� ��i th�nh c�ng Luy�n L� Thi�t c�p 7")	
			gf_WriteLogEx("CHANGE TAY LUYEN KIM XA 7", "nhan", 1, tCondition[nChoose][11])
		end
	end
end



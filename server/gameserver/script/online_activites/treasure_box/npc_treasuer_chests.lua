--by liubo
--宝箱商人脚本
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
g_szNpcName = "<color=green>Thng Nh﹏ B秓 Rng: <color>";

TSK_TMP_CHANGE_BKVD = 206
function main()
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	--是否开启判断
	if gf_CheckEventDateEx(46) ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[5])
		return 0
	end
	--判断是否已经转生
	--
	--
--	if GetTask(1538) == 0 then
--		Talk(1,"",tSTRING_TREASUER_NPC[1])
--		return 0
--	end
	local tbSay = {}
	local nSayHead = "<color=green>T� B秓 Thng Nh﹏:<color> Ta chuy猲 b竛 c竎 b秓 v藅 qu� hi誱, Чi hi謕 c莕 t譵 v藅 ph萴 g�: "
	if nDate < 20130904 then
		tinsert(tbSay,"Nh薾 h� tr� trang b� Kim X�/_On_Repair")
	end
--	tinsert(tbSay, "Ta mu鑞 i nguy猲 li謚 l蕐 kinh nghi謒/Trade_Material2Exp_Menu")
--	if tbGioiHanThanTaiBaoRuong[nNation] == nil or nDate >= tbGioiHanThanTaiBaoRuong[nNation] then
		tinsert(tbSay,tSTRING_TREASUER_NPC[3].."/get_wooden")
		tinsert(tbSay,"Ta mu鑞 i 1 B筩h Kim Rng (ti猽 hao 5 T祅g Rng)/get_BKR")
		tinsert(tbSay,"Ta mu鑞 i 1 Th莕 T礽 B秓 Rng (ti猽 hao 55 T祅g Rng)/get_TTBR")
	--end
--	tinsert(tbSay,"фi trang b� H筼 Nguy謙/get_haonguyet")
--	tinsert(tbSay,"фi trang b� Di謚 Dng/NangCapDieuDuong")
--	tinsert(tbSay,"N﹏g c蕄 ng鋍 b閕 Di謚 Dng 6% th祅h 8%/NangCapDieuDuong_NgocBoi")
--		"N﹏g c蕄 B筩h Kim Vi猰 д/get_BKVD",
--		tSTRING_TREASUER_NPC[4].."/get_treasure",
--	tinsert(tbSay, "фi trang b� Chi課 Cu錸g/TrangBiChienCuong_Form")
	if nDate <= 20200311 then
		tinsert(tbSay,"Ta mu鑞 mua 1 C� Kim Th筩h (+10 v╪ s鴆)(ti猽 hao 1 TCL, 3000 v祅g)/#shop_uudai_thang32020(1)")
		tinsert(tbSay,"Ta mu鑞 mua 1 C� Kim Th筩h (+10 v╪ s鴆)(ti猽 hao 1 TMKL, 3000 v祅g)/#shop_uudai_thang32020(2)")
		tinsert(tbSay,"Ta mu鑞 mua 1 觤 Tinh Ng鋍 (+15 v╪ s鴆)(ti猽 hao 2 TCL, 3 TMKL)/#shop_uudai_thang32020(3)")
		tinsert(tbSay,"Ta mu鑞 i 1 th� ci B筩h Lang (v躰h vi詎)(ti猽 hao 17 TCL, 17 TMKL)/#shop_uudai_thang32020(4)")
		tinsert(tbSay,"Ta mu鑞 i 1 th� ci Chi課 Tng nguy猲 so竔 (v躰h vi詎)(ti猽 hao 22 TCL, 22 TMKL)/#shop_uudai_thang32020(5)")
	end
		--tinsert(tbSay,"Ta mu鑞 i 1 T骾 trang b� Kim X� 7 (19 TMKL, 19 TCL, 1500 TNL)/change_KimXa7")
		--tinsert(tbSay,"Ta mu鑞 i v藅 ph萴 t葃 luy謓 Kim X� 7/menu_tayluyenkimxa7")
		tinsert(tbSay,"R阨 kh醝/do_nothing")
	
	Say(nSayHead, getn(tbSay), tbSay)
end

function get_wooden()
	local nNum = GetTask(VET_TREASURE_BOX_MNUM)
	local tNumWooden = {2,5,12}
	local nIndex = floor(nNum/20)+1
	if nIndex < 3 then
		Say(TREASURE_NPC_NMAE..format(tSTRING_TREASUER_NPC[5],tNumWooden[nIndex],nIndex*20-nNum),2,format("Ta mu鑞 mua/#pay_award(%d,0,%d)",nIndex*20-nNum,tNumWooden[nIndex]),"Kh玭g c莕 u/do_nothing")
	else
		Say(TREASURE_NPC_NMAE..format(tSTRING_TREASUER_NPC[6],tNumWooden[3]),2,format("Ta mu鑞 mua/#pay_award(%d,0,%d)",999,tNumWooden[3]),"Kh玭g c莕 u/do_nothing")
	end
end

function get_treasure()
	local nNum = GetTask(VET_TREASURE_BOX_CNUM)
	local tNumTreasure = { 60, 150, 400 }
	local nIndex = floor(nNum / 20) + 1
	if nIndex < 3 then
		Say(TREASURE_NPC_NMAE .. format(tSTRING_TREASUER_NPC[5], tNumTreasure[nIndex], nIndex * 20 - nNum), 2, format("Ta mu鑞 mua/#pay_award(%d,1,%d)", nIndex * 20 - nNum, tNumTreasure[nIndex]), "Kh玭g c莕 u/do_nothing")
	else
		Say(TREASURE_NPC_NMAE .. format(tSTRING_TREASUER_NPC[6], tNumTreasure[3]), 2, format("Ta mu鑞 mua/#pay_award(%d,1,%d)", 999, tNumTreasure[3]), "Kh玭g c莕 u/do_nothing")
	end
end

function pay_award(nNum1,nNum2,nNum3)
	local nNum = GetItemCount(2, 1, 30230)
	if nNum2 == 0 then
		if nNum < nNum1 * nNum3 then nNum1 = floor(nNum / nNum3) end
		AskClientForNumber("pay_wooden", 1, nNum1, "H穣 nh藀 s� lng", "")
	end
	if nNum2 == 1 then
		if nNum < nNum1 * nNum3 then nNum1 = floor(nNum / nNum3) end
		AskClientForNumber("pay_treasure", 1, nNum1, "H穣 nh藀 s� lng", "")
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
		if gf_AddItemEx({ 2, 1, 30340, nNum }, "M閏 Rng", nNum) ~= 1 then
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
		if gf_AddItemEx2({2,1,30341,nNum},"фi T祅g Rng lo筰 "..tNumTreasure[nIndex].." xu","Than Tai Bao Ruong","фi T祅g Rng th祅h c玭g",0,1) ~= 1 then
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
	local szSayHead = "H穣 ch鋘 trang b� c莕 n﹏g c蕄."
	
	tinsert(tbSayDialog, "- Ta c莕 i 1 B筩h Kim Vi猰 д Kh玦 (100 M秐h B筩h Kim + 3 B筩h Kim H錸g Bao (c� ch鴄 4000 v祅g + 1 Thi猲 Chi Vi猰 д Kh玦[+12])/#get_BKVD_confirm(1,0)")
	tinsert(tbSayDialog, "- Ta c莕 i 1 B筩h Kim Vi猰 д Gi竝 (100 M秐h B筩h Kim + 3 B筩h Kim H錸g Bao (c� ch鴄 4000 v祅g + 1 Thi猲 Chi Vi猰 д Gi竝[+12])/#get_BKVD_confirm(2,0)")
	tinsert(tbSayDialog, "- Ta c莕 i 1 B筩h Kim Vi猰 д Trang (100 M秐h B筩h Kim + 3 B筩h Kim H錸g Bao (c� ch鴄 4000 v祅g + 1 Thi猲 Chi Vi猰 д Trang[+12])/#get_BKVD_confirm(3,0)")
	tinsert(tbSayDialog, "Tr� l筰/main")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function get_haonguyet()
	do return 0 end
	
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H穣 ch鋘 trang b� c莕 i."
	
	tinsert(tbSayDialog, "- Ta c莕 i N鉵 H筼 Nguy謙 (8 M秐h B筩h Kim + 1 N� Oa Tinh Th筩h + 1 B筩h Kim Чi H錸g Bao( c� ch鴄 4000 v祅g)/#get_haonguyet_confirm(1,0)")
	tinsert(tbSayDialog, "- Ta c莕 i 竜 H筼 Nguy謙 (6 M秐h B筩h Kim + 1 N� Oa Tinh Th筩h + 1 B筩h Kim Чi H錸g Bao( c� ch鴄 4000 v祅g)/#get_haonguyet_confirm(2,0)")
	tinsert(tbSayDialog, "- Ta c莕 i Qu莕 H筼 Nguy謙 (6 M秐h B筩h Kim + 1 N� Oa Tinh Th筩h + 1 B筩h Kim Чi H錸g Bao( c� ch鴄 4000 v祅g)/#get_haonguyet_confirm(3,0)")
	tinsert(tbSayDialog, "- Ta c莕 i Trang S鴆 H筼 Nguy謙 (12 M秐h B筩h Kim + 2 N� Oa Tinh Th筩h + 2 B筩h Kim Чi H錸g Bao( c� ch鴄 4000 v祅g)/get_haonguyet_trangsuc")
	tinsert(tbSayDialog, "- Ta c莕 i V� Kh� H筼 Nguy謙 (16 M秐h B筩h Kim + 4 N� Oa Tinh Th筩h + 4 B筩h Kim Чi H錸g Bao( c� ch鴄 4000 v祅g)/#get_haonguyet_confirm(5,0)")
	tinsert(tbSayDialog, "Tr� l筰/main")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
function get_haonguyet_trangsuc()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H穣 ch鋘 trang b� c莕 i."
	
	tinsert(tbSayDialog, "- Ta c莕 i H筼 Nguy謙-X輈h Tc Ho祅 (12 M秐h B筩h Kim + 2 N� Oa Tinh Th筩h + 2 B筩h Kim Чi H錸g Bao( c� ch鴄 4000 v祅g)/#get_haonguyet_confirm(4,1)")
	tinsert(tbSayDialog, "- Ta c莕 i H筼 Nguy謙-T� Giao Ng鋍 B閕 (12 M秐h B筩h Kim + 2 N� Oa Tinh Th筩h + 2 B筩h Kim Чi H錸g Bao( c� ch鴄 4000 v祅g)/#get_haonguyet_confirm(4,2)")
	tinsert(tbSayDialog, "- Ta c莕 i H筼 Nguy謙-V﹏ H� L謓h (12 M秐h B筩h Kim + 2 N� Oa Tinh Th筩h + 2 B筩h Kim Чi H錸g Bao( c� ch鴄 4000 v祅g)/#get_haonguyet_confirm(4,3)")
	tinsert(tbSayDialog, "- Ta c莕 i H筼 Nguy謙-� L﹏ B秓 Gi韎 (12 M秐h B筩h Kim + 2 N� Oa Tinh Th筩h + 2 B筩h Kim Чi H錸g Bao( c� ch鴄 4000 v祅g)/#get_haonguyet_confirm(4,4)")
	tinsert(tbSayDialog, "- Ta c莕 i H筼 Nguy謙-B輈h Quy Li猲 (12 M秐h B筩h Kim + 2 N� Oa Tinh Th筩h + 2 B筩h Kim Чi H錸g Bao( c� ch鴄 4000 v祅g)/#get_haonguyet_confirm(4,5)")
	tinsert(tbSayDialog, "Tr� l筰/get_haonguyet")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function get_BKVD_confirm(nGetType, nSelected)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "","Ph秈 gia nh藀 h� ph竔 m韎 n﹏g c蕄 trang b� 頲!");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 500, "") == 0 then
        return 0;
     end
    	local nItemNum1 = tItem_need[1][3]
	if GetItemCount(2,1,30346) < nItemNum1 then
		Talk(1, "", "B筺 kh玭g  "..tItem_need[1][1].."  i trang b� B筩h Kim Vi猰 д")
		return 0
	end
	    	local nItemNum2 = tItem_need[2][3]
	if GetItemCount(2,1,30229) < nItemNum2 then
		Talk(1, "", "B筺 kh玭g  "..tItem_need[2][1].."  i trang b� B筩h Kim Vi猰 д")
		return 0
	end
	SetTaskTemp(TSK_TMP_CHANGE_BKVD,nGetType)
	local nSlot = BKVD_need[nGetType][1]		
	PutinItemBox("фi trang b�" ,nSlot , "X竎 nh薾 mu鑞 th鵦 hi謓 n﹏g c蕄 trang b�?", FILE_NAME, 1)
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
			Talk(1,"",g_szNpcName.."ч cng h鉧 v藅 ph萴 ph秈 t� 12 tr� l猲");
			return 0;		
		end
		if (genre == nG and detail == nD and particular == nP) then	
			check = 1	
		end
	end
	if check == 1 then
		return 1
	end
	Talk(1, "", g_szNpcName.."Ch� c� th� b� v祇 "..BKVD_need[nGetType][2]);
	return 0;
end

function OnPutinComplete(param)
	local nGetType = GetTaskTemp(TSK_TMP_CHANGE_BKVD)
	if nGetType == 0 then
		Talk(1, "", g_szNpcName.."B� v祇 v藅 ph萴 kh玭g ng");
		return 0;
	end
	if param ~= 1 then
		Talk(1, "", g_szNpcName.."B� v祇 v藅 ph萴 kh玭g ng");
		return 0;
	end
	local t = GetPutinItem()
	if getn(t) ~= BKVD_need[nGetType][1] then
		Talk(1, "", g_szNpcName.."B� v祇 v藅 ph萴 kh玭g ng");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 500, "") == 0 then
        return 0;
     end
    	local nItemNum1 = tItem_need[1][3]
	if GetItemCount(2,1,30346) < nItemNum1 then
		Talk(1, "", "B筺 kh玭g  "..tItem_need[1][1].."  i trang b� B筩h Kim Vi猰 д")
		return 0
	end
	    	local nItemNum2 = tItem_need[2][3]
	if GetItemCount(2,1,30229) < nItemNum2 then
		Talk(1, "", "B筺 kh玭g  "..tItem_need[2][1].."  i trang b� B筩h Kim Vi猰 д")
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
			gf_AddItemEx2(nItem, "N﹏g c蕄 trang b� th祅h c玭g", "NANG CAP TRANG BI BKVD", "n﹏g c蕄 th祅h c玭g")
			Talk(1,"","Ch骳 m鮪g b筺 nh薾 頲 1 trang b� B筩h Kim Vi猰 д!")
		end
	end
end

function get_haonguyet_confirm(nGetType, nSelected)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "","Ph秈 gia nh藀 h� ph竔 m韎 n﹏g c蕄 trang b� 頲!");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 500, "") == 0 then
        return 0;
     end
     if nGetType == 1 then
    		if GetItemCount(2,1,30346) < 8 then
			Talk(1, "", "B筺 kh玭g  8 m秐h B筩h Kim  i trang b� H筼 Nguy謙")
			return 0
		end
    		if GetItemCount(2,1,30229) < 1 then
			Talk(1, "", "B筺 kh玭g  1 B筩h Kim Чi H錸g Bao  i trang b� H筼 Nguy謙")
			return 0
		end		
    		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", "B筺 kh玭g  1 N� Oa Tinh Th筩h  i trang b� H筼 Nguy謙")
			return 0
		end			
     end
     if nGetType == 2 then
    		if GetItemCount(2,1,30346) < 6 then
			Talk(1, "", "B筺 kh玭g  6 m秐h B筩h Kim  i trang b� H筼 Nguy謙")
			return 0
		end
    		if GetItemCount(2,1,30229) < 1 then
			Talk(1, "", "B筺 kh玭g  1 B筩h Kim Чi H錸g Bao  i trang b� H筼 Nguy謙")
			return 0
		end	
    		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", "B筺 kh玭g  1 N� Oa Tinh Th筩h  i trang b� H筼 Nguy謙")
			return 0
		end					
     end
     if nGetType == 3 then
     		if GetItemCount(2,1,30346) < 6 then
			Talk(1, "", "B筺 kh玭g  6 m秐h B筩h Kim  i trang b� H筼 Nguy謙")
			return 0
		end   
    		if GetItemCount(2,1,30229) < 1 then
			Talk(1, "", "B筺 kh玭g  1 B筩h Kim Чi H錸g Bao  i trang b� H筼 Nguy謙")
			return 0
		end	
    		if GetItemCount(2,1,504) < 1 then
			Talk(1, "", "B筺 kh玭g  1 N� Oa Tinh Th筩h  i trang b� H筼 Nguy謙")
			return 0
		end							
     end     
     if nGetType == 4 then
    		if GetItemCount(2,1,30346) < 12 then
			Talk(1, "", "B筺 kh玭g  12 m秐h B筩h Kim  i trang b� H筼 Nguy謙")
			return 0
		end    	
    		if GetItemCount(2,1,30229) < 2 then
			Talk(1, "", "B筺 kh玭g  2 B筩h Kim Чi H錸g Bao  i trang b� H筼 Nguy謙")
			return 0
		end		
    		if GetItemCount(2,1,504) < 2 then
			Talk(1, "", "B筺 kh玭g  2 N� Oa Tinh Th筩h  i trang b� H筼 Nguy謙")
			return 0
		end					
     end
     if nGetType == 5 then
    		if GetItemCount(2,1,30346) < 16 then
			Talk(1, "", "B筺 kh玭g  16 m秐h B筩h Kim  i trang b� H筼 Nguy謙")
			return 0
		end    	
    		if GetItemCount(2,1,30229) < 4 then
			Talk(1, "", "B筺 kh玭g  4 B筩h Kim Чi H錸g Bao  i trang b� H筼 Nguy謙")
			return 0
		end		
    		if GetItemCount(2,1,504) < 4 then
			Talk(1, "", "B筺 kh玭g  4 N� Oa Tinh Th筩h  i trang b� H筼 Nguy謙")
			return 0
		end					
     end          

	local nbody = GetBody()
	local nfaction = GetPlayerRoute()
     if nGetType == 1 then	
     		if DelItem(2,1,30346, 8) == 1 and DelItem(2,1,30229, 1) == 1 and DelItem(2,1,504, 1) == 1 then
     			local nNon = tHaoNguyet_suc[nGetType][nfaction][2][nbody]
     			gf_AddItemEx2(nNon, "фi trang b� th祅h c玭g", "DOI TRANG BI", "i th祅h c玭g")
			Talk(1,"","фi trang b� th祅h c玭g!")
     		end
     end
	if nGetType == 2 then	
     		if DelItem(2,1,30346, 6) == 1 and DelItem(2,1,30229, 1) == 1 and DelItem(2,1,504, 1) == 1 then
     			local nAo = tHaoNguyet_suc[nGetType][nfaction][2][nbody]
     			gf_AddItemEx2(nAo, "фi trang b� th祅h c玭g", "DOI TRANG BI", "i th祅h c玭g")
			Talk(1,"","фi trang b� th祅h c玭g!")
     		end
     end
     if nGetType == 3 then	
     		if DelItem(2,1,30346, 6) == 1 and DelItem(2,1,30229, 1) == 1 and DelItem(2,1,504, 1) == 1 then
     			local nQuan = tHaoNguyet_suc[nGetType][nfaction][2][nbody]
     			gf_AddItemEx2(nQuan, "фi trang b� th祅h c玭g", "DOI TRANG BI", "i th祅h c玭g")
			Talk(1,"","фi trang b� th祅h c玭g!")
     		end
     end
     if nGetType == 4 then
          	if DelItem(2,1,30346, 12) == 1 and DelItem(2,1,30229, 2) == 1 and DelItem(2,1,504, 2) == 1 then
			local nTrangsuc = tHaoNguyet_suc[nGetType][nSelected][2]
			gf_AddItemEx2(nTrangsuc, "фi trang b� th祅h c玭g", "DOI TRANG BI", "i th祅h c玭g ")
			Talk(1,"","фi trang b� th祅h c玭g!")
		end
	end
	if nGetType == 5 then
	 	if DelItem(2,1,30346, 16) == 1 and DelItem(2,1,30229, 4) == 1 and DelItem(2,1,504, 4) == 1 then
			local nVukhi = tHaoNguyet_suc[nGetType][nfaction][2]
			gf_AddItemEx2(nVukhi, "фi trang b� th祅h c玭g", "DOI TRANG BI", "i th祅h c玭g ")
			Talk(1,"","фi trang b� th祅h c玭g!")
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
	AskClientForNumber("Confirm_get_BKR", 0, nMax, "B筩h Kim Rng")
end
function get_TTBR()
	local nCountTR = GetItemCount(2, 1, 30341)
	local nMax = 0
	if nCountTR > 0 then
		nMax = floor(nCountTR / 55)
	end
	AskClientForNumber("Confirm_get_TTBR", 0, nMax, "Th莕 T礽 Rng")
end

function Confirm_get_BKR(nCount)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi謓 t筰 kh玭g th� nh薾 thng!!!")
		return
	end
	if gf_Judge_Room_Weight(5, 50," ") ~= 1 then
        	return
    end
	if GetItemCount(2,1,30341) < 5 * nCount then
		Talk(1, "", "B筺 kh玭g  T祅g Rng  i B筩h Kim Rng")
		return 0
	end    	
	if DelItem(2,1,30341, 5 * nCount) == 1 then
		gf_AddItemEx2({2,1,30343,nCount}, "B筩h Kim Rng", "Than Tai Bao Ruong", "nh薾 th祅h c玭g")
        gf_WriteLogEx("Than Tai Bao Ruong", "i th祅h c玭g", nCount, "S� lng B筩h Kim Rng")			
	end
end

function Confirm_get_TTBR(nCount)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi謓 t筰 kh玭g th� nh薾 thng!!!")
		return
	end
	if gf_Judge_Room_Weight(5, 50," ") ~= 1 then
        	return
    end
	if GetItemCount(2,1,30341) < 55 * nCount then
		Talk(1, "", "B筺 kh玭g  T祅g Rng  i Th莕 T礽 B秓 Rng")
		return 0
	end    	
	if DelItem(2,1,30341, 55 * nCount) == 1 then
		gf_AddItemEx2({2,1,30344,nCount}, "Th莕 T礽 Rng", "Than Tai Bao Ruong", "nh薾 th祅h c玭g")
		gf_WriteLogEx("Than Tai Bao Ruong", "i th祅h c玭g", nCount, "S� lng Th莕 T礽 Rng")	
	end
end


function NangCapDieuDuong()
	do return 0 end 
	
	local tbSay = {
		"N﹏g c蕄 b籲g Thi猲 M玭 Kim L謓h v� trang b� H筼 Nguy謙/NangCapDieuDuong_CongThuc1_Form",
		"N﹏g c蕄 b籲g Thi猲 M玭 Kim L謓h, C� Linh Ng鋍 v� trang b� H筼 Nguy謙/NangCapDieuDuong_CongThuc2_Form",
	}
	Say("N﹏g c蕄 trang b� H筼 Nguy謙 th祅h Di謚 Dng", getn(tbSay), tbSay)
end


function NangCapDieuDuong_CongThuc1_Form()
	local szTitle = "N﹏g c蕄 trang b� H筼 Nguy謙 th祅h Di謚 Dng c莕:\n- N鉵: 5 Thi猲 M玭 Kim L謓h\n- 竜: 6 Thi猲 M玭 Kim L謓h\n- Qu莕: 7 Thi猲 M玭 Kim L謓h\n- Trang s鴆: 6 Thi猲 M玭 Kim L謓h\n- V� Kh�: 11 Thi猲 M玭 Kim L謓h"
	local tbSay = {
		"Ta mu鑞 n﹏g c蕄/NangCapDieuDuong_CongThuc1",
		"Ta ch� gh� xem th玦/gf_DoNothing",
	}
	Say(szTitle, getn(tbSay), tbSay)
end


function NangCapDieuDuong_CongThuc2_Form()
	local szTitle = "N﹏g c蕄 trang b� H筼 Nguy謙 th祅h Di謚 Dng c莕:\n- N鉵: 3 Thi猲 M玭 Kim L謓h, 500 C� Linh Ng鋍\n- 竜: 3 Thi猲 M玭 Kim L謓h, 500 C� Linh Ng鋍\n- Qu莕: 3 Thi猲 M玭 Kim L謓h, 500 C� Linh Ng鋍\n- Trang s鴆: 3 Thi猲 M玭 Kim L謓h, 500 C� Linh Ng鋍\n- V� Kh�: 6 Thi猲 M玭 Kim L謓h, 1000 C� Linh Ng鋍"
	local tbSay = {
		"Ta mu鑞 n﹏g c蕄/NangCapDieuDuong_CongThuc2",
		"Ta ch� gh� xem th玦/gf_DoNothing",
	}
	Say(szTitle, getn(tbSay), tbSay)
end


function NangCapDieuDuong_CongThuc1()
	do return 0 end 
	
	PutinItemBox("N﹏g c蕄 trang b�" ,1 , "X竎 nh薾 mu鑞 th鵦 hi謓 n﹏g c蕄?", NANGCAPDIEUDUONG_F1, 1)
end


function NangCapDieuDuong_CongThuc2()
	do return 0 end 
	
	PutinItemBox("N﹏g c蕄 trang b�" ,1 , "X竎 nh薾 mu鑞 th鵦 hi謓 n﹏g c蕄?", NANGCAPDIEUDUONG_F2, 1)
end


function NangCapDieuDuong_NgocBoi()
	do return 0 end 
	
	PutinItemBox("N﹏g c蕄 trang b�" ,1 , "X竎 nh薾 mu鑞 th鵦 hi謓 n﹏g c蕄?", NANGCAPDIEUDUONG_NGOCBOI, 1)
end

function shop_uudai_thang32020(nChoose)
	local tCondition = { -- Thi猲 cang l謓h, Thi猲 m玭 kim l謓h, v祅g, id v藅 ph萴
				[1] = {1 , {2,95,204}, 0 , {2,1,30370}, 3000	, {2, 201, 14, 1},"Cng h鉧 v╪ s鴆 +10"},
				[2] = {0 , {2,95,204}, 1 , {2,1,30370}, 3000	, {2, 201, 14, 1},"Cng h鉧 v╪ s鴆 +10"},
				[3] = {2 , {2,95,204}, 3 , {2,1,30370}, 0	  	, {2, 201, 16, 1},"Cng h鉧 v╪ s鴆 +15"},
				[4] = {17, {2,95,204}, 17, {2,1,30370}, 0		, {0, 105, 206,  1,1,-1,-1,-1,-1,-1,-1,-1},"B筩h lang"},
				[5] = {22, {2,95,204}, 22, {2,1,30370}, 0		, {0, 105, 30033,1,1,-1,-1,-1,-1,-1,-1,-1},"Chi課 tng"},
			}
			
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,95,204) < tCondition[nChoose][1] then
		Talk(1, "", g_szNpcName.."Чi hi謕 kh玭g mang  "..tCondition[nChoose][1].." Thi猲 Cang L謓h.")
		return 0
	end
	if GetItemCount(2,1,30370) < tCondition[nChoose][3] then
		Talk(1, "",g_szNpcName.."Чi hi謕 kh玭g mang  "..tCondition[nChoose][3].." Thi猲 M玭 Kim L謓h.")
		return 0
	end
	if GetCash() < 	tCondition[nChoose][5]*10000 then
		Talk(1, "",g_szNpcName.."Чi hi謕 kh玭g mang  "..tCondition[nChoose][5].." v祅g.")
		return 0
	end
	local nHor = GetTask(701);
	local nTypeHor = GetTask(704);
	if nChoose == 5 then
		if abs(nHor) < 5000000  then
			Talk(1, "", g_szNpcName.."Ta ch� nh薾 b竛 Chi課 Tng cho Nguy猲 So竔 v� c� c玭g tr筺g t� 5000000 甶觤 tr� l猲.");
			return 0
		end
		if abs(nTypeHor) < 6  then
			Talk(1, "", g_szNpcName.."Ta ch� nh薾 b竛 Chi課 Tng cho Nguy猲 So竔 v� c� c玭g tr筺g t� 5000000 甶觤 tr� l猲!");
			return 0
		end
	end
	--****************
	if nChoose == 1 then
		if DelItem(2,95,204,tCondition[nChoose][1]) == 1 and Pay(tCondition[nChoose][5]*10000) == 1 then
			gf_AddItemEx2(tCondition[nChoose][6], tCondition[nChoose][7], "UU DAI THANG 3 2020 BK", tCondition[nChoose][7]);
			Talk(1, "", "Ch骳 m鮪g i hi謕  n﹏g c蕄 th祅h c玭g trang b� "..tCondition[nChoose][8])	
			gf_WriteLogEx("UU DAI THANG 3 2020", "nhan", 1, tCondition[nChoose][7])
		end
	end
	if nChoose == 2 then
		if DelItem(2,1,30370,tCondition[nChoose][3]) == 1 and Pay(tCondition[nChoose][5]*10000) == 1 then
			gf_AddItemEx2(tCondition[nChoose][6], tCondition[nChoose][7], "UU DAI THANG 3 2020 BK", tCondition[nChoose][7]);
			Talk(1, "", "Ch骳 m鮪g i hi謕  n﹏g c蕄 th祅h c玭g trang b� "..tCondition[nChoose][8])	
			gf_WriteLogEx("UU DAI THANG 3 2020", "nhan", 1, tCondition[nChoose][7])
		end
	end
	if nChoose == 3 or nChoose == 4 or nChoose == 5 then
		if DelItem(2,95,204,tCondition[nChoose][1]) == 1 and DelItem(2,1,30370,tCondition[nChoose][3]) == 1 then
			gf_AddItemEx2(tCondition[nChoose][6], tCondition[nChoose][7], "UU DAI THANG 3 2020 BK", tCondition[nChoose][7]);
			Talk(1, "", "Ch骳 m鮪g i hi謕  n﹏g c蕄 th祅h c玭g trang b� "..tCondition[nChoose][8])	
			gf_WriteLogEx("UU DAI THANG 3 2020", "nhan", 1, tCondition[nChoose][7])
		end
	end

end

function change_KimXa7()
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,1,30370) < 19 then
		Talk(1, "",g_szNpcName.."Чi hi謕 kh玭g mang  19 Thi猲 M玭 Kim L謓h.")
		return 0
	end
	if GetItemCount(2,95,204) < 19 then
		Talk(1, "", g_szNpcName.."Чi hi謕 kh玭g mang  19 Thi猲 Cang L謓h.")
		return 0
	end
	if GetItemCount(2,1,30687) < 1500 then
		Talk(1, "", g_szNpcName.."Чi hi謕 kh玭g mang  1500 Th竔 Nh蕋 L謓h.")
		return 0
	end
	if DelItem(2,1,30370,19) == 1 and DelItem(2,95,204,19) == 1 and DelItem(2,1,30687,1500) == 1 then
		gf_AddItemEx2({2,1,31400,1}, "T骾 trang b� Kim X� 7", "CHANGE KIM XA 7 BK", "T骾 trang b� Kim X� 7");
		Talk(1, "", g_szNpcName.."Ch骳 m鮪g i hi謕  i th祅h c玭g T骾 trang b� Kim X� 7")	
		gf_WriteLogEx("CHANGE KIM XA 7", "nhan", 1, "T骾 Kim X� 7")
	end
end
function menu_tayluyenkimxa7()
	local tbSay = {}
	local szSayHead = g_szNpcName.."Чi hi謕 mu鑞 i v藅 ph萴 t葃 luy謓 Kim X� 7 theo c竎h n祇:"
	tinsert(tbSay,"фi 1 T葃 T﹎ Th筩h c蕄 7: c莕 2 T葃 T﹎ Th筩h c蕄 6 + 200 v祅g/#change_tayluyenkimxa7(7)")
	tinsert(tbSay,"фi 1 Luy謓 L� Thi誸 c蕄 7: c莕 2 Luy謓 L� Thi誸 c蕄 6 + 200 v祅g/#change_tayluyenkimxa7(8)")
	tinsert(tbSay,"фi 1 T醓 Linh Th筩h cao(1) Kim X� 7: c莕 2 T� Linh Quy誸 + 2 linh th筩h kh鉧(1)/#change_tayluyenkimxa7(1)")
	tinsert(tbSay,"фi 1 T醓 Linh Th筩h cao(2) Kim X� 7: c莕 2 T� Linh Quy誸 + 2 linh th筩h kh鉧(2)/#change_tayluyenkimxa7(2)")
	tinsert(tbSay,"фi 1 T醓 Linh Th筩h cao(3) Kim X� 7: c莕 2 T� Linh Quy誸 + 2 linh th筩h kh鉧(3)/#change_tayluyenkimxa7(3)")
	tinsert(tbSay,"фi 1 T醓 Linh Th筩h cao(4) Kim X� 7: c莕 2 T� Linh Quy誸 + 2 linh th筩h kh鉧(4)/#change_tayluyenkimxa7(4)")
	tinsert(tbSay,"фi 1 T醓 Linh Th筩h cao(5) Kim X� 7: c莕 2 T� Linh Quy誸 + 2 linh th筩h kh鉧(5)/#change_tayluyenkimxa7(5)")
	tinsert(tbSay,"фi 1 T醓 Linh Th筩h cao(6) Kim X� 7: c莕 2 T� Linh Quy誸 + 2 linh th筩h kh鉧(6)/#change_tayluyenkimxa7(6)")
	tinsert(tbSay,"R阨 kh醝/do_nothing")
	
	Say(szSayHead, getn(tbSay), tbSay)
end
function change_tayluyenkimxa7(nChoose)
local tCondition = { -- T� linh quy誸, linh th筩h kh鉧, t葃 t﹎ th筩h c蕄 6, luy謓 l� thi誸 c蕄 6, v祅g, get item
				[1] = {2, {2,1,31248}, 2, {2,1,30904}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31391,1}, "t醓 linh thach cao 1"},
				[2] = {2, {2,1,31248}, 2, {2,1,30905}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31392,1}, "t醓 linh thach cao 2"},
				[3] = {2, {2,1,31248}, 2, {2,1,30906}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31393,1}, "t醓 linh thach cao 3"},
				[4] = {2, {2,1,31248}, 2, {2,1,30907}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31394,1}, "t醓 linh thach cao 4"},
				[5] = {2, {2,1,31248}, 2, {2,1,30908}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31395,1}, "t醓 linh thach cao 5"},
				[6] = {2, {2,1,31248}, 2, {2,1,30909}, 0, {2,1,30526}, 0, {2,1,30532}, 0,   {2,1,31396,1}, "t醓 linh thach cao 6"},
				[7] = {0, {2,1,31248}, 0, {2,1,30908}, 2, {2,1,30526}, 0, {2,1,30532}, 200, {2,1,31402,1}, "T葃 T﹎ Th筩h c蕄 7"},
				[8] = {0, {2,1,31248}, 0, {2,1,30909}, 0, {2,1,30526}, 2, {2,1,30532}, 200, {2,1,31401,1}, "Luy謓 L� Thi誸 c蕄 7"},
			}
			
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,1,31248) < tCondition[nChoose][1] then
		Talk(1, "", g_szNpcName.."Чi hi謕 kh玭g mang  "..tCondition[nChoose][1].." T� linh quy誸.")
		return 0
	end
	if GetItemCount(2,1,tCondition[nChoose][4][3]) < tCondition[nChoose][3] then
		Talk(1, "",g_szNpcName.."Чi hi謕 kh玭g mang  "..tCondition[nChoose][3].." Linh Th筩h kh鉧 "..nChoose..".")
		return 0
	end
	if GetItemCount(2,1,30526) < tCondition[nChoose][5] then
		Talk(1, "", g_szNpcName.."Чi hi謕 kh玭g mang  "..tCondition[nChoose][5].." T葃 T﹎ Th筩h c蕄 6.")
		return 0
	end
	if GetItemCount(2,1,30532) < tCondition[nChoose][7] then
		Talk(1, "", g_szNpcName.."Чi hi謕 kh玭g mang  "..tCondition[nChoose][7].." Luy謓 L� Thi誸 c蕄 6.")
		return 0
	end
	if GetCash() < 	tCondition[nChoose][9]*10000then
		Talk(1, "",g_szNpcName.."Чi hi謕 kh玭g mang  200 v祅g.")
		return 0
	end
	--*******************************
	if nChoose <= 6 then
		if DelItem(2,1,31248,2) == 1 and DelItem(2,1,tCondition[nChoose][4][3],2) == 1 then
			gf_AddItemEx2({2,1,31390 + nChoose,1}, tCondition[nChoose][11], "CHANGE TAY LUYEN KIM XA 7 BK", tCondition[nChoose][11]);
			Talk(1, "", g_szNpcName.."Ch骳 m鮪g i hi謕  i th祅h c玭g v藅 ph萴 "..tCondition[nChoose][11])	
			gf_WriteLogEx("CHANGE TAY LUYEN KIM XA 7", "nhan", 1, tCondition[nChoose][11])
		end
	end
	if nChoose == 7 then
		if DelItem(2,1,30526,tCondition[nChoose][5]) == 1 and Pay(tCondition[nChoose][9]*10000) == 1 then
			gf_AddItemEx2(tCondition[nChoose][10], tCondition[nChoose][11], "CHANGE TAY LUYEN KIM XA 7 BK", tCondition[nChoose][11]);
			Talk(1, "", g_szNpcName.."Ch骳 m鮪g i hi謕  i th祅h c玭g T葃 T﹎ Th筩h c蕄 7")	
			gf_WriteLogEx("CHANGE TAY LUYEN KIM XA 7", "nhan", 1, tCondition[nChoose][11])
		end
	end
	if nChoose == 8 then
		if DelItem(2,1,30532,tCondition[nChoose][7]) == 1 and Pay(tCondition[nChoose][9]*10000) == 1 then
			gf_AddItemEx2(tCondition[nChoose][10], tCondition[nChoose][11], "CHANGE TAY LUYEN KIM XA 7 BK", tCondition[nChoose][11]);
			Talk(1, "", g_szNpcName.."Ch骳 m鮪g i hi謕  i th祅h c玭g Luy謓 L� Thi誸 c蕄 7")	
			gf_WriteLogEx("CHANGE TAY LUYEN KIM XA 7", "nhan", 1, tCondition[nChoose][11])
		end
	end
end



Import("\\script\\lib\\globalfunctions.lua")

TLP_NPC = "<color=green>Hoa Th�nh L�c Phi: <color>";
function nothing()

end

function change_VanSuc_cap2()
	local nDate = tonumber(date("%Y%m%d"));
	--if nDate > 20200731 then
	--	Talk(1, "", "Hi�n t�i ta �� h�t h�ng, ��i hi�p h�y quay l�i sau nha.")
	--	return 0 
	--end
	local tbSayDialog = {};
	local nSaySize = 0;
	local msg = "N�ng c�p trang b� V�n S�c c�p 2 c�n ti�u hao: Thi�n M�n Kim L�nh, Thi�n Cang L�nh"
	
	tinsert(tbSayDialog,"N�ng c�p Kh�c b�n linh ho�t c�p 2 (��u)(ti�u hao 3 TMKL, 3 TCL) /#updateVanSuc_choose(1)")
	tinsert(tbSayDialog,"N�ng c�p Kh�c b�n linh ho�t c�p 2 (�o)(ti�u hao 4 TMKL, 4 TCL) /#updateVanSuc_choose(2)")
	tinsert(tbSayDialog,"N�ng c�p Kh�c b�n linh ho�t c�p 2 (Qu�n)(ti�u hao 4 TMKL, 4 TCL) /#updateVanSuc_choose(3)")
	tinsert(tbSayDialog,"N�ng c�p Kh�c b�n linh ho�t c�p 2 (Nh�n)(ti�u hao 6 TMKL, 6 TCL) /#updateVanSuc_choose(4)")
	tinsert(tbSayDialog,"N�ng c�p Kh�c b�n linh ho�t c�p 2 (Ng�c B�i)(ti�u hao 6 TMKL, 6 TCL) /#updateVanSuc_choose(5)")
	tinsert(tbSayDialog,"T�i ch� xem xem th�i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(TLP_NPC..msg, nSaySize, tbSayDialog);
end

function updateVanSuc_choose(nChoose)
	local tCondition = { --Thi�n m�n kim l�nh, Thi�n cang l�nh, C�u thi�n v� c�c ��n
				[1] = {3, {2,1,30370}, 3, {2,95,204}, 0, {2,1,1006}, {2, 1, 31073, 1},"Kh�c b�n c�p 2 ��u"},
				[2] = {4, {2,1,30370}, 4, {2,95,204}, 0, {2,1,1006}, {2, 1, 31074, 1},"Kh�c b�n c�p 2 �o"},
				[3] = {4, {2,1,30370}, 4, {2,95,204}, 0, {2,1,1006}, {2, 1, 31075, 1},"Kh�c b�n c�p 2 qu�n"},
				[4] = {6, {2,1,30370}, 6, {2,95,204}, 0, {2,1,1006}, {2, 1, 31076, 1},"Kh�c b�n c�p 2 nh�n"},
				[5] = {6, {2,1,30370}, 6, {2,95,204}, 0, {2,1,1006}, {2, 1, 31077, 1},"Kh�c b�n c�p 2 ng�c b�i"},
			}
			
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
--	if GetItemCount(2,1,1006) < tCondition[nChoose][5] then
--		Talk(1, "", "��i hi�p kh�ng mang �� "..tCondition[nChoose][5].." C�u Thi�n V� C�c ��n.")
--		return 0
--	end
	if DelItem(2,1,30370,tCondition[nChoose][1]) ~= 1 then
		Talk(1,"", "X�a kh�ng th�nh c�ng v�t ph�m 1")
		gf_WriteLogEx("NANG CAP VAN SUC", "xoa", 1, "x�a v�t ph�m TMKL")
		return 0
	end
	if DelItem(2,95,204,tCondition[nChoose][3]) ~= 1 then
		Talk(1,"", "X�a kh�ng th�nh c�ng v�t ph�m 2")
		gf_WriteLogEx("NANG CAP VAN SUC", "xoa", 1, "x�a v�t ph�m TCL")
		return 0
	end
--	if DelItem(2,1,1006,tCondition[nChoose][5]) ~= 1 then
--		Talk(1,"", "X�a kh�ng th�nh c�ng v�t ph�m 3")
--		gf_WriteLogEx("NANG CAP VAN SUC", "xoa", 1, "x�a v�t ph�m CTVCD")
--		return 0
--	end	
	gf_AddItemEx2(tCondition[nChoose][7], tCondition[nChoose][8], "TIEN CAP VAN SUC", "Trang b� v�n s�c c�p 2");
	Talk(1, "", "Ch�c m�ng ��i hi�p �� n�ng c�p th�nh c�ng trang b� "..tCondition[nChoose][8])	
	gf_WriteLogEx("NANG CAP VAN SUC", "nhan", 1, "N�ng c�p th�nh c�ng")
end

function buy_nguyenlieuvansuc()
	local tbSayDialog = {};
	local nSaySize = 0;
	local msg = "Mua nguy�n li�u c��ng h�a trang b� V�n S�c: L�u Kim v� Thi�n V�n Th�ch"
	
	tinsert(tbSayDialog,"Ta mu�n mua 1 L�u Kim (ti�u hao 80 xu v�t ph�m) /#finish_buy_nguyenlieuvansuc(1)")
	tinsert(tbSayDialog,"Ta mu�n mua 1 Thi�n V�n Th�ch (ti�u hao 50 xu v�t ph�m) /#finish_buy_nguyenlieuvansuc(2)")
	
	tinsert(tbSayDialog,"T�i ch� xem xem th�i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(TLP_NPC..msg, nSaySize, tbSayDialog);
end

function finish_buy_nguyenlieuvansuc(nType)
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > 20180630 then
		Talk(1, "", "Hi�n t�i ta �� h�t h�ng, ��i hi�p h�y quay l�i sau nha.")
		return 0 
	end
	local tnguyenlieu = {--
			[1] = {2,1,31096,1, "L�u Kim", 80},	
			[2] = {2,201,13,1, "Thi�n V�n Th�ch", 50},	
		}
	if gf_Judge_Room_Weight(2,200) ~= 1 then
		Talk(1,"","H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return
	end
	if GetItemCount(2,1,30230) < tnguyenlieu[nType][6] then
		Talk(1, "", "��i hi�p kh�ng mang theo �� "..tnguyenlieu[nType][6].." xu v�t ph�m.")
		return 0
	end
	if  DelItem(2,1,30230,tnguyenlieu[nType][6]) ~= 1 then
		Talk(1, "", "X�y ra l�i 1")
		return 0
	end

	gf_AddItemEx2({tnguyenlieu[nType][1],tnguyenlieu[nType][2],tnguyenlieu[nType][3],tnguyenlieu[nType][4]}, "nguy�n li�u", "NGUYEN LIEU CUONG HOA VAN SUC", "Mua nguy�n li�u lo�i "..tnguyenlieu[nType][5])
end

function change_VanSuc_cap3()
--	local nDate = tonumber(date("%Y%m%d"));
--	if nDate > 20180731 then
--		Talk(1, "", "Hi�n t�i ta �� h�t h�ng, ��i hi�p h�y quay l�i sau nha.")
--		return 0 
--	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local msg = "Ta c� th� gi�p ��i hi�p n�ng c�p trang b� V�n S�c Ho�n M� C�p 3"
		
	tinsert(tbSayDialog,"N�ng c�p Kh�c B�n Ho�n M� c�p 3 (��u): ti�u hao 3 Kh�c b�n linh ho�t c�p 2 /#updateVanSuccap3_choose(1)")
	tinsert(tbSayDialog,"N�ng c�p Kh�c B�n Ho�n M� c�p 3 (�o): ti�u hao 3 Kh�c b�n linh ho�t c�p 2 /#updateVanSuccap3_choose(2)")
	tinsert(tbSayDialog,"N�ng c�p Kh�c B�n Ho�n M� c�p 3 (Qu�n): ti�u hao 3 Kh�c b�n linh ho�t c�p 2 /#updateVanSuccap3_choose(3)")
	tinsert(tbSayDialog,"N�ng c�p Kh�c B�n Ho�n M� c�p 3 (Nh�n): ti�u hao 3 Kh�c b�n linh ho�t c�p 2 /#updateVanSuccap3_choose(4)")
	tinsert(tbSayDialog,"N�ng c�p Kh�c B�n Ho�n M� c�p 3 (Ng�c B�i): ti�u hao 3 Kh�c b�n linh ho�t c�p 2 /#updateVanSuccap3_choose(5)")
	tinsert(tbSayDialog,"T�i ch� xem xem th�i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(TLP_NPC..msg, nSaySize, tbSayDialog);
end
function updateVanSuccap3_choose(nType)

	local tbSayDialog = {};
	local nSaySize = 0;
	local tmsg = {
				[1] = {"N�ng c�p Kh�c B�n Ho�n M� c�p 3(��u): ti�u hao 1 V�n S�c Ho�n M� C�p 2 (��u) + 3 Kh�c b�n linh ho�t c�p 2 (��u)"},
				[2] = {"N�ng c�p Kh�c B�n Ho�n M� c�p 3(�o): ti�u hao 1 V�n S�c Ho�n M� C�p 2 (�o) + 3 Kh�c b�n linh ho�t c�p 2 (�o)"},
				[3] = {"N�ng c�p Kh�c B�n Ho�n M� c�p 3(Qu�n): ti�u hao 1 V�n S�c Ho�n M� C�p 2 (�o) + 3 Kh�c b�n linh ho�t c�p 2 (qu�n)"},
				[4] = {"N�ng c�p Kh�c B�n Ho�n M� c�p 3(Nh�n): ti�u hao 1 V�n S�c Ho�n M� C�p 2 (�o) + 3 Kh�c b�n linh ho�t c�p 2 (nh�n)"},
				[5] = {"N�ng c�p Kh�c B�n Ho�n M� c�p 3(Ng�c b�i): ti�u hao 1 V�n S�c Ho�n M� C�p 2 (�o) + 3 Kh�c b�n linh ho�t c�p 2 (ng�c b�i)"},
			}

	tinsert(tbSayDialog,"��ng � ��i Kh�c B�n Ho�n M� c�p 3/#finish_updateVanSuccap3_choose("..nType..")")
	tinsert(tbSayDialog,"T�i ch� xem xem th�i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(TLP_NPC..tmsg[nType][1], nSaySize, tbSayDialog);
end

function finish_updateVanSuccap3_choose(nType)
	local tDieuKien = { --V�n s�c c�p 2, Kh�c b�n linh ho�t c�p 2, Kh�c b�n c�p 3
				[1] = {1, {0,116,20},"V�n S�c Ho�n M� C�p 2 (��u)", 3, {2,1,31073},"Kh�c b�n linh ho�t c�p 2", {2, 1, 31261, 1},"Kh�c b�n c�p 3 ��u"},
				[2] = {1, {0,113,20},"V�n S�c Ho�n M� C�p 2 (�o)", 3, {2,1,31074},"Kh�c b�n linh ho�t c�p 2", {2, 1, 31262, 1},"Kh�c b�n c�p 3 �o"},
				[3] = {1, {0,114,20},"V�n S�c Ho�n M� C�p 2 (qu�n)", 3, {2,1,31075},"Kh�c b�n linh ho�t c�p 2", {2, 1, 31263, 1},"Kh�c b�n c�p 3 qu�n"},
				[4] = {1, {0,115,20},"V�n S�c Ho�n M� C�p 2 (nh�n)", 3, {2,1,31076},"Kh�c b�n linh ho�t c�p 2", {2, 1, 31264, 1},"Kh�c b�n c�p 3 nh�n"},
				[5] = {1, {0,117,19},"V�n S�c Ho�n M� C�p 2 (ng�c b�i)", 3, {2,1,31077},"Kh�c b�n linh ho�t c�p 2", {2, 1, 31265, 1},"Kh�c b�n c�p 3 ng�c b�i"},
			}
	local tVansuc2 = {--0,116,16--20
				[1] = {0,116,16,"V�n S�c Ho�n M� C�p 2 (��u)"},
				[2] = {0,113,16,"V�n S�c Ho�n M� C�p 2 (�o)"},
				[3] = {0,114,16,"V�n S�c Ho�n M� C�p 2 (qu�n)"},
				[4] = {0,115,16,"V�n S�c Ho�n M� C�p 2 (nh�n)"},
				[5] = {0,117,16,"V�n S�c Ho�n M� C�p 2 (ng�c b�i)"},
			}		
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
--	if GetItemCount(tDieuKien[nType][2][1],tDieuKien[nType][2][2],tDieuKien[nType][2][3]) < tDieuKien[nType][1] then
--		Talk(1, "","��i hi�p kh�ng mang �� 1 "..tDieuKien[nType][3])
--		return 0
--	end
	local nCheckVanSuc = 0
	for i = 16, 20 do
		if GetItemCount(tVansuc2[nType][1],tVansuc2[nType][2],i) >= 1 then
			nCheckVanSuc = 1
			break
		end	
	end
	if nCheckVanSuc == 0 then
		Talk(1, "",TLP_NPC.."��i hi�p kh�ng mang �� 1 "..tVansuc2[nType][4])
		return 0
	end
	if GetItemCount(tDieuKien[nType][5][1],tDieuKien[nType][5][2],tDieuKien[nType][5][3]) < tDieuKien[nType][4] then
		Talk(1, "",TLP_NPC.."��i hi�p kh�ng mang �� 3 "..tDieuKien[nType][6])
		return 0
	end
	if nCheckVanSuc == 1 then
		for i = 16, 20 do
			if DelItem(tVansuc2[nType][1],tVansuc2[nType][2],i,1) == 1 then
				break
			end	
		end
	else
		Talk(1, "",TLP_NPC..": ��i hi�p kh�ng mang �� 1 "..tVansuc2[nType][4])
		return 0
	end
--	if DelItem(tDieuKien[nType][2][1],tDieuKien[nType][2][2],tDieuKien[nType][2][3],tDieuKien[nType][1]) ~= 1 then
--		Talk(1,"", "X�a kh�ng th�nh c�ng v�t ph�m 1")
--		gf_WriteLogEx("NANG CAP VAN SUC 3", "xoa", 1, "x�a v�t ph�m v�n s�c c�p 2")
--		return 0
--	end
	if DelItem(tDieuKien[nType][5][1],tDieuKien[nType][5][2],tDieuKien[nType][5][3],tDieuKien[nType][4]) ~= 1 then
		Talk(1,"", "X�a kh�ng th�nh c�ng v�t ph�m 2")
		return 0
	end	
	gf_AddItemEx2(tDieuKien[nType][7], tDieuKien[nType][8], "TIEN CAP VAN SUC", "Trang b� v�n s�c c�p 2");
	Talk(1, "", "Ch�c m�ng ��i hi�p �� n�ng c�p th�nh c�ng trang b� "..tDieuKien[nType][8])	
	gf_WriteLogEx("NANG CAP VAN SUC CAP 3", "nhan", 1, "N�ng c�p th�nh c�ng")
end
function check_condition()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > 20191031 then
		Talk(1, "", "Hi�n t�i ta �� h�t h�ng, ��i hi�p h�y quay l�i sau nha.")
		return 0 
	end
	--check s� d�ng 30 N� Oa/ng�y
	if GetTask(2156) < 30 then	--VET_201003_01_TASK_USE_BAOHE_COUNT = 2156
    	Talk(1,"", "B�n �� ch�a s� d�ng �� 30 N� Oa B�o H�p trong ng�y, h�y s� d�ng th�m r�i ��n g�p ta!")
    	return 0
    end
	--check s� d�ng 2 Ng�i sao/ng�y
	local nUsed = mod(GetTask(2661), 100) 				-- 2 so cuoi luu so lan su dung trong ngay TSK_LUCKY_STAR_201011 = 2661
	if nUsed < 2 then
		Talk(1,"","B�n �� ch�a s� d�ng �� 2 Ng�i Sao May M�n trong ng�y, h�y s� d�ng th�m r�i ��n g�p ta")
		return 0
	end
	return 1
end
function get_free_NguyenLieuCuongHoaVS()
	local nCheck = check_condition()
	if nCheck == 0 then
		return 0
	end
	local nCheckFree = VNG_GetTaskPos(TSK_CUONGHOA_VANSUC, 9, 9)
	if nCheckFree >= 1 then
		Talk(1,"","B�n �� nh�n mi�n ph� trang b� c��ng h�a V�n S�c h�m nay r�i, ng�y mai h�y quay l�i ti�p nha.")
		return 0
	end
	if gf_Judge_Room_Weight(2,200) ~= 1 then
		Talk(1,"","H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return 0
	end

	gf_AddItemEx2({2,1,31096, 2}, "L�u Kim", "CUONG HOA VAN SUC BK", "Nh�n free")
	gf_AddItemEx2({2,201,13, 1}, "Thi�n V�n Th�ch", "CUONG HOA VAN SUC BK", "Nh�n free")
	Msg2Player("B�n nh�n ���c 1 Thi�n V�n Th�ch v� 2 L�u Kim")
	VNG_SetTaskPos(TSK_CUONGHOA_VANSUC, nCheckFree + 1, 9, 9)	
	gf_WriteLogEx("CUONG HOA VAN SUC", "nh�n free th�nh c�ng", 1, "Nh�n free th�nh c�ng trang b� c��ng h�a v�n s�c")
end

function get_NguyenLieuCuongHoaVS()
	local nCheck = check_condition()
	if nCheck == 0 then
		return 0
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local msg = "Mua gi� r� nguy�n li�u c��ng h�a trang b� V�n S�c: L�u Kim v� Thi�n V�n Th�ch (m�i d�ng ch�n c� th� mua 20 l�n/1 ng�y"
	
	tinsert(tbSayDialog,"Ta mu�n mua 1 L�u Kim (ti�u hao 15 xu v�t ph�m) /#finish_get_NguyenLieuCuongHoaVS(1)")
	tinsert(tbSayDialog,"Ta mu�n mua 1 L�u Kim (ti�u hao 75 v�ng) /#finish_get_NguyenLieuCuongHoaVS(3)")
	tinsert(tbSayDialog,"Ta mu�n mua 1 Thi�n V�n Th�ch (ti�u hao 5 xu v�t ph�m) /#finish_get_NguyenLieuCuongHoaVS(5)")
	tinsert(tbSayDialog,"Ta mu�n mua 1 Thi�n V�n Th�ch (ti�u hao 25 v�ng) /#finish_get_NguyenLieuCuongHoaVS(7)")
	
	tinsert(tbSayDialog,"T�i ch� xem xem th�i/nothing")
	nSaySize = getn(tbSayDialog);
	Say(TLP_NPC..msg, nSaySize, tbSayDialog);
end
function finish_get_NguyenLieuCuongHoaVS(nType)
	local tnguyenlieu = {--xu v�t ph�m, v�ng, G,D,P,....
			[1] = {15,   0, 2,1,31096,1, "L�u Kim xu"},
			[3] = {0 , 75, 2,1,31096,1, "L�u Kim v�ng"},	
			[5] = {5,   0, 2,201,13,1, "Thi�n V�n Th�ch xu"},	
			[7] = {0 , 25, 2,201,13,1, "Thi�n V�n Th�ch v�ng"},	
		}
	local nCheckBuy = VNG_GetTaskPos(TSK_CUONGHOA_VANSUC, nType+1, nType)
	if nCheckBuy >= 20 then
		Talk(1,"","H�m nay b�n �� mua 20 l�n gi� r� lo�i trang b� c��ng h�a V�n S�c n�y r�i, ng�y mai h�y quay l�i ti�p nha.")
		return 0
	end
	if gf_Judge_Room_Weight(2,200) ~= 1 then
		Talk(1,"","H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return 0
	end
	if GetItemCount(2,1,30230) < tnguyenlieu[nType][1] then
		Talk(1, "", "��i hi�p kh�ng mang theo �� "..tnguyenlieu[nType][1].." xu v�t ph�m.")
		return 0
	end
	if GetCash() < tnguyenlieu[nType][2]*10000 then
		Talk(1, "", "��i hi�p kh�ng mang theo �� "..tnguyenlieu[nType][2].." V�ng.")
		return 0
	end
	if nType == 1 or nType == 5 then
		if DelItem(2,1,30230,tnguyenlieu[nType][1]) ~= 1 then
			Talk(1, "", "X�y ra l�i 1")
			return 0
		end
		gf_WriteLogEx("CUONG HOA VAN SUC", "mua th�nh c�ng", 1, "Mua th�nh c�ng b�ng xu")
	elseif nType == 3 or nType == 7 then
		if Pay(tnguyenlieu[nType][2]*10000) ~= 1 then
			Talk(1, "", "X�y ra l�i 2")
			return 0
		end
		gf_WriteLogEx("CUONG HOA VAN SUC", "mua th�nh c�ng", 1, "Mua th�nh c�ng b�ng v�ng")
	end
	VNG_SetTaskPos(TSK_CUONGHOA_VANSUC, nCheckBuy + 1, nType+1, nType)	
	gf_WriteLogEx("CUONG HOA VAN SUC", "mua th�nh c�ng", 1, "Mua th�nh c�ng trang b� c��ng h�a v�n s�c")
	Msg2Player("B�n nh�n ���c 1 "..tnguyenlieu[nType][7])
	gf_AddItemEx2({tnguyenlieu[nType][3],tnguyenlieu[nType][4],tnguyenlieu[nType][5],tnguyenlieu[nType][6]}, "nguy�n li�u", "CUONG HOA VAN SUC BK", "Mua nguy�n li�u lo�i "..tnguyenlieu[nType][7])
end

--Code by PhucnG 23-10-2014
--Event Den Bu Server Hoa Phung
Include("\\script\\newbattles\\sign_up_npc.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\warlord\\functions\\function_doiphe_chutuoc.lua");

--g_sNpcName = "Ti�u Vi�n L�u";
g_sNpcName = "Ti�u Ng�c";
g_nNpcCamp = LIAO_ID;
szNpcName = "<color=green>Ti�u Vi�n L�u: <color>"

m_nMinMeritChange = 1000000;
m_nCostXu = 1000;

function main()
		local tSay = {}
		if GetTargetNpcName() == "Ti�u Vi�n L�u" then
			local nDate = tonumber(date("%Y%m%d"))
			if nDate >= 20200823 and nDate <= 20200825  then
				
--				if VNG_GetTaskPos(TSK_MATTICH_TIEUDAO,7,7) >= 1 then 
--					Talk(1,"",szNpcName.."Tr�ng thanh gi� m�t, c�c h� c� vi�c c�n chi?")
--					do return 0 end
--				end
				-- tinsert(tbSay,"Ta mu�n nh�n �i�m c�a chi�n tr��ng 4x/Denbu_NhanThuong4x")
--				tinsert(tbSay,"Ta mu�n nh�n th��ng h� tr� l�i l�m c�a chi�n tr��ng/Denbu_FixChienTruong")
--				tinsert(tbSay,"R�i kh�i/gf_DoNothing")
--				Say(szNpcName.."�� c� th� b� ��p h�t m�i l�i l�m, c�c h� h�y nh�n ph�n th��ng n�y. \n",getn(tbSay),tbSay)
				tinsert(tSay,"Ph�n th��ng ��n b� chi�n tr��ng ph�/#get_support_chientruong(1)");
				tinsert(tSay,"Ph�n th��ng ��n b� chi�n tr��ng ch�nh/#get_support_chientruong(2)");
				tinsert(tSay,"Ph�n th��ng ��n b� 2 t� �i�m kinh nghi�m/#get_support_chientruong_final(3,0)");

				tinsert(tSay,"\nChuy�n c�ng tr�ng t� phe T�ng qua phe Li�u/#changeCongTrang2020(1)")
				tinsert(tSay,"Chuy�n c�ng tr�ng t� phe Li�u qua phe T�ng/#changeCongTrang2020(2)")
				tinsert(tSay,"R�i kh�i/gf_DoNothing")
				Say(szNpcName.."�� c� th� b� ��p h�t m�i l�i l�m, c�c h� h�y nh�n ph�n th��ng n�y. \n",getn(tSay),tSay)
				return
			else
				tinsert(tSay,"Chuy�n c�ng tr�ng t� phe T�ng qua phe Li�u/#changeCongTrang2020(1)")
				tinsert(tSay,"Chuy�n c�ng tr�ng t� phe Li�u qua phe T�ng/#changeCongTrang2020(2)")
				tinsert(tSay,"Chuy�n ��i phe trang b� chi�n tr��ng/#ChuyenDoiTrangBiChuTruoc()")
				tinsert(tSay,"R�i kh�i/gf_DoNothing")
				--goc Say(szNpcName.."Quy�n l�c c�a ta r�t m�nh, ta c� th� gi�p ��i hi�p chuy�n ��i c�ng tr�ng t� T�ng qua Li�u, ho�c t� Li�u qua T�ng. <color=green>D� nhi�n l� c�n ph�i t�n ch�t ph�: 25 TCL + 25 TMKL, v� ��i hi�p ph�i c� c�ng tr�ng t� 5 tri�u tr� l�n.<color>\n",getn(tSay),tSay)
				Say(szNpcName.."Quy�n l�c c�a ta r�t m�nh, ta c� th� gi�p ��i hi�p chuy�n ��i c�ng tr�ng t� T�ng qua Li�u, ho�c t� Li�u qua T�ng. <color=green>D� nhi�n l� c�n ph�i t�n ch�t ph�: " .. m_nCostXu .. " V�t Ph�m Xu, v� ��i hi�p ph�i c� c�ng tr�ng t� " .. m_nMinMeritChange .. " tr� l�n<color>\n",getn(tSay),tSay)
--				Talk(1,"",szNpcName.."Tr�ng thanh gi� m�t, c�c h� c� vi�c c�n chi?")
				return
			end
		end		
		
		if random(1,50) == 1 then
				NpcChat(GetTargetNpc(),"�� kh�ch l� t��ng s� ��i Li�u ta anh d�ng gi�t gi�c, nh�ng ai tham gia tr�n ��nh Nh�n m�n quan ��u ���c nh�n Linh Th�ch!");
		end;
		battle_main();			
end;
function ChuyenDoiTrangBiChuTruoc()
	local tbSay = {}
	tinsert(tbSay,"Chuy�n ��i trang b� Chu T��c t� Li�u sang phe T�ng/#DoiPhe_ChuTuoc_Lieu_Tong()")
	tinsert(tbSay,"Chuy�n ��i trang b� Chu T��c t� T�ng sang phe Li�u/#DoiPhe_ChuTuoc_Tong_Lieu()")
	tinsert(tbSay,"R�i kh�i/gf_DoNothing")
	Say(szNpcName.."C�c h� c� th� chuy�n ��i trang b� sang phe ��i di�n. Chi ph� l� 200 xu v�t ph�m/1 trang b�? \n",getn(tbSay),tbSay)
end
function Denbu_NhanThuong4x()
	local tbSay = {}
	tinsert(tbSay,"Nh�n 600 �i�m c�ng tr�ng v� 10.000.000 �i�m kinh nghi�m/#Denbu_NhanThuong4x_01(1)")
	tinsert(tbSay,"Nh�n 1200 �i�m c�ng tr�ng v� 15.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng ch��ng)/#Denbu_NhanThuong4x_01(2)")
	tinsert(tbSay,"Nh�n 3000 �i�m c�ng tr�ng v� 20.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng ��i)/#Denbu_NhanThuong4x_01(3)")
	tinsert(tbSay,"Nh�n 6000 �i�m c�ng tr�ng v� 30.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng huy ho�ng)/#Denbu_NhanThuong4x_01(4)")
	tinsert(tbSay,"Nh�n 8400 �i�m c�ng tr�ng v� 45.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng vinh d�)/#Denbu_NhanThuong4x_01(5)")
	tinsert(tbSay,"R�i kh�i/gf_DoNothing")
	Say(szNpcName.."C�c h� mu�n nh�n g� n�o? \n",getn(tbSay),tbSay)
end

function Denbu_NhanThuong4x_01(nChoice)
	if gf_GetTaskByte(TSK_DENBU_HOAPHUNG,3) == 1 then
		Talk(1,"",szNpcName.."C�c h� �� nh�n ph�n th��ng trong ng�y. Xin vui l�ng quay l�i ng�y h�m sau!")
		return
	end
	
	if nChoice == 1 then
		gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
		--Nh�n C�ng tr�ng
		gf_EventGiveCustomAward(31, 600, 1, "DenBuHoaPhung", "Nhan")
		
		--Nh�n kinh nghi�m
		gf_EventGiveCustomAward(1, 10000000, 1, "DenBuHoaPhung", "Nhan")
	elseif nChoice == 2 then
		if GetItemCount(2,1,9999) < 1 then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� Qu�n C�ng Ch��ng trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		if DelItem(2,1,9999,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
			
			--Nh�n C�ng tr�ng
			gf_EventGiveCustomAward(31, 1200, 1, "DenBuHoaPhung", "Nhan")
			
			--Nh�n kinh nghi�m
			gf_EventGiveCustomAward(1, 15000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 3 then
		if GetItemCount(2,1,9998) < 1 then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� Qu�n C�ng ��i trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		
		if DelItem(2,1,9998,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
			
			--Nh�n C�ng tr�ng
			gf_EventGiveCustomAward(31, 3000, 1, "DenBuHoaPhung", "Nhan")
			
			--Nh�n kinh nghi�m
			gf_EventGiveCustomAward(1, 20000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 4 then
		if GetItemCount(2,1,9977) < 1 then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� Qu�n C�ng Huy Ho�ng trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		
		if DelItem(2,1,9977,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
			
			--Nh�n C�ng tr�ng
			gf_EventGiveCustomAward(31, 6000, 1, "DenBuHoaPhung", "Nhan")
			
			--Nh�n kinh nghi�m
			gf_EventGiveCustomAward(1, 30000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 5 then
		if GetItemCount(2,1,30642) < 1 then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� Qu�n C�ng Ch��ng Vinh D� trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		
		if DelItem(2,1,30642,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
		
			--Nh�n C�ng tr�ng
			gf_EventGiveCustomAward(31, 8400, 1, "DenBuHoaPhung", "Nhan")
			
			--Nh�n kinh nghi�m
			gf_EventGiveCustomAward(1, 45000000, 1, "DenBuHoaPhung", "Nhan")
		end
	end
end

function Denbu_NhanThuong6x()
	local tbSay = {}
	tinsert(tbSay,"Nh�n 1200 �i�m c�ng tr�ng v� 20.000.000 �i�m kinh nghi�m/#Denbu_NhanThuong6x_01(1)")
	tinsert(tbSay,"Nh�n 2400 �i�m c�ng tr�ng v� 30.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng ch��ng)/#Denbu_NhanThuong6x_01(2)")
	tinsert(tbSay,"Nh�n 6000 �i�m c�ng tr�ng v� 40.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng ��i)/#Denbu_NhanThuong6x_01(3)")
	tinsert(tbSay,"Nh�n 12000 �i�m c�ng tr�ng v� 60.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng huy ho�ng)/#Denbu_NhanThuong6x_01(4)")
	tinsert(tbSay,"Nh�n 16800 �i�m c�ng tr�ng v� 90.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng vinh d�)/#Denbu_NhanThuong6x_01(5)")
	tinsert(tbSay,"R�i kh�i/gf_DoNothing")
	Say(szNpcName.."C�c h� mu�n nh�n g� n�o? \n",getn(tbSay),tbSay)
end

function Denbu_NhanThuong6x_01(nChoice)
	if gf_GetTaskByte(TSK_DENBU_HOAPHUNG,4) == 1 then
		Talk(1,"",szNpcName.."C�c h� �� nh�n ph�n th��ng trong ng�y. Xin vui l�ng quay l�i ng�y h�m sau!")
		return
	end

	if nChoice == 1 then
		gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
		--Nh�n C�ng tr�ng
		gf_EventGiveCustomAward(31, 1200, 1, "DenBuHoaPhung", "Nhan")
		
		--Nh�n kinh nghi�m
		gf_EventGiveCustomAward(1, 20000000, 1, "DenBuHoaPhung", "Nhan")
	elseif nChoice == 2 then
		if GetItemCount(2,1,9999) < 1 then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� Qu�n C�ng Ch��ng trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		if DelItem(2,1,9999,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
			--Nh�n C�ng tr�ng
			gf_EventGiveCustomAward(31, 2400, 1, "DenBuHoaPhung", "Nhan")
			
			--Nh�n kinh nghi�m
			gf_EventGiveCustomAward(1, 30000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 3 then
		if GetItemCount(2,1,9998) < 1 then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� Qu�n C�ng ��i trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		
		if DelItem(2,1,9998,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
			--Nh�n C�ng tr�ng
			gf_EventGiveCustomAward(31, 6000, 1, "DenBuHoaPhung", "Nhan")
			
			--Nh�n kinh nghi�m
			gf_EventGiveCustomAward(1, 40000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 4 then
		if GetItemCount(2,1,9977) < 1 then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� Qu�n C�ng Huy Ho�ng trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		
		if DelItem(2,1,9977,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
			--Nh�n C�ng tr�ng
			gf_EventGiveCustomAward(31, 12000, 1, "DenBuHoaPhung", "Nhan")
			
			--Nh�n kinh nghi�m
			gf_EventGiveCustomAward(1, 60000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 5 then
		if GetItemCount(2,1,30642) < 1 then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� Qu�n C�ng Ch��ng Vinh D� trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		
		if DelItem(2,1,30642,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
			--Nh�n C�ng tr�ng
			gf_EventGiveCustomAward(31, 16800, 1, "DenBuHoaPhung", "Nhan")
			
			--Nh�n kinh nghi�m
			gf_EventGiveCustomAward(1, 90000000, 1, "DenBuHoaPhung", "Nhan")
		end
	end
end

function Denbu_FixChienTruong()
		local nDate = tonumber(date("%Y%m%d"))
		if nDate > 20151120 then
			do return 0 end
		end
		if VNG_GetTaskPos(TSK_MATTICH_TIEUDAO,7,7) >= 1 then 
			Talk(1,"",szNpcName.."C�c h� �� nh�n th��ng r�i. Kh�ng th� nh�n ph�n th��ng!")
			return
		end
		VNG_SetTaskPos(TSK_MATTICH_TIEUDAO, 1, 7, 7)			
		gf_WriteLogEx("NHAN THUONG DEN BU CHIEN TRUONG", "nh�n th�nh c�ng", 1, "ph�n th��ng")
		--Nh�n C�ng tr�ng
		if GetTask(701) >= 0 then
			SetTask(701, GetTask(701) + 20000)
		else
			SetTask(701, GetTask(701) - 20000)
		end			
		--Nh�n kinh nghi�m
		ModifyExp(50000000)
		Msg2Player("��i hi�p nh�n 20000 �i�m c�ng tr�ng")
end

function get_support_chientruong(nType)
	local tSay = {}
	if nType == 1 then
		tinsert(tSay,"Nh�n 1500 �i�m c�ng tr�ng v� 10.000.000 �i�m kinh nghi�m (kh�ng d�ng qu�n c�ng)/#get_support_chientruong_final("..nType..",1)")
		tinsert(tSay,"Nh�n 3000 �i�m c�ng tr�ng v� 15.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng ch��ng)/#get_support_chientruong_final("..nType..",2)")
		tinsert(tSay,"Nh�n 7500 �i�m c�ng tr�ng v� 20.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng ��i)/#get_support_chientruong_final("..nType..",3)")
		tinsert(tSay,"Nh�n 15000 �i�m c�ng tr�ng v� 30.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng huy ho�ng)/#get_support_chientruong_final("..nType..",4)")
		tinsert(tSay,"Nh�n 21000 �i�m c�ng tr�ng v� 45.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng vinh d�)/#get_support_chientruong_final("..nType..",5)")
	else
		tinsert(tSay,"Nh�n 2000 �i�m c�ng tr�ng v� 10.000.000 �i�m kinh nghi�m (kh�ng d�ng qu�n c�ng)/#get_support_chientruong_final("..nType..",1)")
		tinsert(tSay,"Nh�n 4000 �i�m c�ng tr�ng v� 15.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng ch��ng)/#get_support_chientruong_final("..nType..",2)")
		tinsert(tSay,"Nh�n 10000 �i�m c�ng tr�ng v� 20.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng ��i)/#get_support_chientruong_final("..nType..",3)")
		tinsert(tSay,"Nh�n 20000 �i�m c�ng tr�ng v� 30.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng huy ho�ng)/#get_support_chientruong_final("..nType..",4)")
		tinsert(tSay,"Nh�n 28000 �i�m c�ng tr�ng v� 45.000.000 �i�m kinh nghi�m(d�ng qu�n c�ng vinh d�)/#get_support_chientruong_final("..nType..",5)")
	end	
	tinsert(tSay,"Ta ch� gh� qua/nothing")
	Say(szNpcName.."Ta chuy�n ph� tr�ch c�c ho�t ��ng nh�n th��ng. C�c h� c�n ta gi�p �� vi�c g�?",getn(tSay),tSay)
end
function get_support_chientruong_final(nType,nChoose)
	local tCondition = {
					[1] = {
							[1]	= {"kh�ng s� d�ng qu�n c�ng",2,1,9999,0,1500,10000000},
							[2]	= {"Qu�n C�ng Ch��ng",2,1,9999,1,3000,15000000},
							[3]	= {"Qu�n C�ng ��i",2,1,9998,1,7500,20000000},
							[4]	= {"Qu�n C�ng Huy Ho�ng",2,1,9977,1,15000,30000000},
							[5]	= {"Qu�n C�ng Ch��ng Vinh D�",2,1,30642,1,21000,45000000},
							},
					[2]	= {
							[1]	= {"kh�ng s� d�ng qu�n c�ng",2,1,9999,0,2000,10000000},
							[2]	= {"Qu�n C�ng Ch��ng",2,1,9999,1,4000,15000000},
							[3]	= {"Qu�n C�ng ��i",2,1,9998,1,10000,20000000},
							[4]	= {"Qu�n C�ng Huy Ho�ng",2,1,9977,1,20000,30000000},
							[5]	= {"Qu�n C�ng Ch��ng Vinh D�",2,1,30642,1,28000,45000000},
							},
						}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return 0
	end
	local nCheck
	if nType == 1 then
		nCheck = VNG_GetTaskPos(TSK_HOTRO_QUANCONG, 1, 1)	
	elseif nType == 2 then
		nCheck = VNG_GetTaskPos(TSK_HOTRO_QUANCONG, 2, 2)	
	elseif nType == 3 then
		nCheck = VNG_GetTaskPos(TSK_HOTRO_QUANCONG, 3, 3)		
	end 
	if nCheck >= 1 then
		Talk(1,"",szNpcName.."��i hi�p �� nh�n ph�n th��ng h� tr� n�y r�i! Xin quay l�i v�o ng�y mai.")
		return 0
	end
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	if nChuyenSinh < 90 then
		Talk(1,"",szNpcName.."��ng c�p 90 tr� l�n m�i c� th� l�nh th��ng!")
		return 0
	end
--	if GetReputation() < 3000 then
--		Talk(1, "", szNpcName.."�i�m danh v�ng ch�a �� 3000, ch�a th� nh�n th��ng..");
--		return 0
--	end
--	if GetTask(336) < 4000 then
--		Talk(1, "", szNpcName.."�i�m s� m�n ch�a �� 4000, ch�a th� nh�n th��ng..");
--		return 0
--	end
	if nType ~= 3 then
		if GetItemCount(tCondition[nType][nChoose][2],tCondition[nType][nChoose][3],tCondition[nType][nChoose][4]) < tCondition[nType][nChoose][5] then 
			Talk(1,"",szNpcName.."C�c h� kh�ng c� "..tCondition[nType][nChoose][1].." trong h�nh trang. Kh�ng th� nh�n ph�n th��ng!")
			return
		end	
	end
	if nType == 3 then
		gf_WriteLogEx("NHAN THUONG DEN BU CHIEN TRUONG", "nh�n th�nh c�ng", 1, "ph�n th��ng KN")
		ModifyExp(2000000000)
		VNG_SetTaskPos(TSK_HOTRO_QUANCONG, 1, 3, 3)	
		return 0
	end
	if DelItem(tCondition[nType][nChoose][2],tCondition[nType][nChoose][3],tCondition[nType][nChoose][4],tCondition[nType][nChoose][5]) == 1 then
		if nType == 1 then
			VNG_SetTaskPos(TSK_HOTRO_QUANCONG, 1, 1, 1)	
		elseif nType == 2 then
			VNG_SetTaskPos(TSK_HOTRO_QUANCONG, 1, 2, 2)	
		end
		--Nh�n c�ng tr�ng
		if GetTask(701) >= 0 then
			SetTask(701, GetTask(701) + tCondition[nType][nChoose][6])
			Talk(1, "", "Ch�c m�ng b�n �� nh�n h� tr� qu�n c�ng th�nh c�ng")
		else
			SetTask(701, GetTask(701) - tCondition[nType][nChoose][6])
			Talk(1, "", "Ch�c m�ng b�n �� nh�n h� tr� qu�n c�ng th�nh c�ng")
		end
		--Nh�n kinh nghi�m
		ModifyExp(tCondition[nType][nChoose][7])
		gf_WriteLogEx("NHAN THUONG DEN BU CHIEN TRUONG", "nh�n th�nh c�ng", 1, "ph�n th��ng")
	end						
end
function changeCongTrang2020(nType)
	local nHor = GetTask(701);
	if abs(nHor) < m_nMinMeritChange  then
		Talk(1, "", szNpcName.."Ta ch� nh�n chuy�n cho nh�ng ��i hi�p c� c�ng tr�ng t� " .. m_nMinMeritChange .. " �i�m tr� l�n.");
		return 0
	end
	--local nCount1 = GetItemCount(2,1,30370)
	--local nCount2 = GetItemCount(2,95,204)
	local nCount3 = GetItemCount(2, 1, 30230); -- V�t Ph�m Xu
	--if nCount1 < 25 then
	--	Talk(1, "", szNpcName .. "��i hi�p kh�ng c� �� 25 Thi�n M�n Kim L�nh th� l�m sao ta c� th� gi�p ��i hi�p ���c.")
	--	return 0
	--end
	--if nCount2 < 25 then
	--	Talk(1, "", szNpcName .. "��i hi�p kh�ng c� �� 25 Thi�n Cang L�nh th� l�m sao ta c� th� gi�p ��i hi�p ���c.")
	--	return 0
	--end
	if nCount3 < m_nCostXu then
		Talk(1, "", szNpcName .. "��i hi�p kh�ng c� �� <color=red>" .. m_nCostXu .. " V�t Ph�m Xu<color> th� l�m sao ta c� th� gi�p ��i hi�p ���c.")
		return 0
	end
	if nType == 1 and nHor < 0 then
		Talk(1, "", szNpcName .. "��i hi�p �ang � phe Li�u r�i n�n kh�ng c�n ta gi�p �� ��u.")
		return 0
	end
	if nType == 2 and nHor >= 0 then
		Talk(1, "", szNpcName .. "��i hi�p �ang � phe T�ng r�i n�n kh�ng c�n ta gi�p �� ��u.")
		return 0
	end
	if nType == 1 and nHor >= 0 then
		--if DelItem(2,1,30370,25) == 1 and DelItem(2,95,204,25) == 1 then
		if DelItem(2, 1, 30230, m_nCostXu) == 1 then
			SetTask(701, -m_nMinMeritChange)
			SetTask(704, -4)
			Talk(1, "", szNpcName .. "Ch�c m�ng ��i hi�p, ta �� gi�p ��i hi�p chuy�n sang phe Li�u th�nh c�ng.")
			gf_WriteLogEx("CHUYEN DOI PHE CONG TRANG", "chuy�n Li�u", 1, "T�ng sang Li�u")
		end
	end
	if nType == 2 and nHor < 0 then
		--if DelItem(2,1,30370,25) == 1 and DelItem(2,95,204,25) == 1 then
		if DelItem(2, 1, 30230, m_nCostXu) == 1 then
			SetTask(701, m_nMinMeritChange)
			SetTask(704, 4)
			Talk(1, "", szNpcName .. "Ch�c m�ng ��i hi�p, ta �� gi�p ��i hi�p chuy�n sang phe T�ng th�nh c�ng.")
			gf_WriteLogEx("CHUYEN DOI PHE CONG TRANG", "chuy�n T�ng", 1, "Li�u sang T�ng")
		end
	end
end
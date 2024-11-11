-- IP Bonus Created by TuanNA5
-- Edit by PhucNG
Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua") -- IP bonus
Include("\\script\\online\\viet_event\\golden_card\\npc_golden.lua") -- event Ho�ng Kim L�nh B�i
Include("\\script\\online\\viet_event\\bet_game\\bet_npc.lua") -- D� �o�n k�t qu� thi ��u
Include("\\script\\online_activites\\ipbonus\\ipbonus.lua") -- IP Bonus 2011 (CSM)
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\chitonvuonglenh\\chitonvuonglenh.lua");
Include("\\script\\vng\\all_trangbi.lua");
Include("\\script\\function\\cdkey\\hotro_mamoi.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\function\\cdkey\\ck_head.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");


szNpcName = "<color=green>Ch� Ph�ng M�y: <color>"
--��ng k� chuy�n server
CHUYENSERVER_FILENAME = "chuyenserver_dangky_20190516.txt"
LIB_txtData.szPattern = "[A-Za-z0-9����������Ƣ�����E����ѣ����������������������������������������������������Ʃ���������Ѫ������������������������������������������_]"
--#####################
--szLogTitle = "NHAN THUONG MOI BAN"
--szLogTitle = "CHI TON VUONG LENH"
	tbTrangBiHaoNguyet_trangbi = {
		[2] = HaoNguyet_TLD,
		[3] = HaoNguyet_TLT,
		[4] = HaoNguyet_TLQ,
		[6] = HaoNguyet_DM,
		[8] = HaoNguyet_NMK,
		[9] = HaoNguyet_NMD,
		[11] = HaoNguyet_CBQ,
		[12] = HaoNguyet_CBB,
		[14] = HaoNguyet_VDK,
		[15] = HaoNguyet_VDB,
		[17] = HaoNguyet_DGT,
		[18] = HaoNguyet_DGC,
		[20] = HaoNguyet_5DD,
		[21] = HaoNguyet_5DT,
		[23] = HaoNguyet_CLTS,
		[25] = HaoNguyet_CLTS,
		[26] = HaoNguyet_CLTS,
		[27] = HaoNguyet_CLTS,
		[29] = HaoNguyet_TYVT,
		[30] =HaoNguyet_TYLN,
		[31] = HaoNguyet_DM,
		[32] = HaoNguyet_CLTS,
	}
tbVBonusItemShop = {
		[1] = {"B�ch C�u Ho�n", {2,1,270,1,4}, 4, 2,5},
		[2] = {"Tam Thanh Ho�n", {2,1,1097,1,4}, 2, 2,6},
		[3] = {"L�c Th�n Ho�n", {2,1,1064,1,4}, 2, 2,7},
		[4] = {"Ng�i Sao May M�n", {2,1,30191,1,4}, 16, 2,8},
--		[5] = {"T� Linh Ti�n ��n", {2,1,30460,1,4}, 50, 2, 9},
	}
	-- table define: {ItemName, {G,D,P}, Prize, Quanlity, Position in Task}
	--====================
	tbQuanCongTP = {
		
--			{"coconuttl","ko check", 9000000,89, 9000000},
--			{"mgbbestxl","ko check", 4000000,92, 4000000},

			
--			{"mailinhclub89","ko check", 6300000,89},
--			{"taochoitlq1","iSHKzAnhYeuEmz",3297633,89},
--			{"phandinhkhiem0780","izKenn",3300000,89},
		}
	tbSuMon = {
--			{"mabupha99","o0oHoaYaSio0o",70000,8},
		}	
	 tbAwardBHTA14 = {
--			{"nhtl051925","ii0sBpHacMieuNo1",7},
--			{"mailinhclub89","iizLucyLukeCz",7},
		}
	tbds_nhiemvu = {
 					-- {"tangkiemchilo01","ko check",39},					
					-- {"ngochung93liv","ko check",89},
					-- {"junetyln","ko check",39},
				}
				
 	 tbDsVIPCode = {
--				{"bykute7","ii34HDzNguoiDung",50},
--				{"nguy3nphuongng4","iiiHDzAlanWalker",104},
--				{"t01689300002","zllxxGaTapSutzz",6},
--				{"d9nguyenoanh","iMsXuyenChiHoa",104},			
			}						
function main()
	if IsIPBonus() == 1 then
		IpBonusClose()
		IpBonusStart()	
		npc_talk()
	else
		Say(szNpcName.."Ho�t ��ng �� k�t th�c!",0)
	end
end


function npc_talk()
	local nDate = tonumber(date("%Y%m%d"))
	local nDate1 =  tonumber(date("%y%m%d%H"))
	local nServerID_Hotro = GetGlbValue(1023)
	local nAcc = GetAccount()
	local nRole = GetName()
	local x,y,z = GetWorldPos()
	local tSay = {
			"Nh�n th��ng t�ch l�y online/IpBonus",
			"Nh�n th��ng Vinh Danh T��ng S�/get_solider_glory",
			"Nguy�n So�i tuy�n b� chi�m ��ng th�nh th� n�y, ta mu�n l�m nhi�m v� qu�n ��i/do_military_job",
			"Thu h�i C�m Nang ��i S� Ki�n/get_camnang",			
	}
	if nDate < 20171116 then	
		if nServerID_Hotro == 113 then
			tinsert(tSay,1,"Nh�n Danh Hi�u V� V��ng/ThanHo_get_danhhieuVV")
			tinsert(tSay,1,"Nh�n l�i danh hi�u Chuy�n Sinh 8/_chuyensinh8_ThanHo_get_danhhieu")
		end
	end
	if nDate <= 20170423 then	
		tinsert(tSay,1,"Nh�n Danh Hi�u/get_danhhieu")
	end
	if CheckVbonus() == 1 then
--		tinsert(tSay,1,"Nh�n th��ng VBonus/VBonusMenu")
--		tinsert(tSay,1,"Mua v�t ph�m Si�u �u ��i h�ng ng�y c�a VBonus/VBonusShop")
	end
	--==H� tr� 
	if nDate == 20200416 then	
		for i = 1, getn(tbds_nhiemvu) do
			if nAcc == tbds_nhiemvu[i][1] and nServerID_Hotro == tbds_nhiemvu[i][3] then	 	--and nRole == tbds_nhiemvu[i][2] 	--
--				if nAcc == "hoangduytlq" then
--					tinsert(tSay,1,"Trao Gi�i BHTA 22/#get_item_support(2)")
--				else
					tinsert(tSay,1,"H� tr� VIP/#get_item_support(2)")
--					tinsert(tSay,1,"Nh�n th��ng h� tr� Th�n H�/thangcapnhanthuong_695_HT")
--				end
			end
		end		
	end
	--====Big promotion th�ng 7 c�a PG1
--	local nB1_active = gf_GetExtPointBit(EXT_BIGPRO_PG1,1)	--k�ch ho�t web code v�o c�a
--	local nB2_active = gf_GetExtPointBit(EXT_BIGPRO_PG1,2)	--k�ch ho�t web code face
--	local nB3_award = gf_GetExtPointBit(EXT_BIGPRO_PG1,3)	--nh�n th��ng ingame code v�o c�a
--	local nB4_award = gf_GetExtPointBit(EXT_BIGPRO_PG1,4)	--nh�n th��ng ingame code face
--	local nCheckAward = gf_GetExtPointBit(EXT_BIGPRO_PG1,12)
	local nCheckAward = GetExtPoint(EXT_SURVEY2016)	
	if nDate >= 20161231 and nDate <= 20161231 then
		for i = 1, getn(tbDsVIPCode) do		
			if nAcc == tbDsVIPCode[i][1] and nRole == tbDsVIPCode[i][2] and nServerID_Hotro == tbDsVIPCode[i][3] then	 
				tinsert(tSay,1,"Nh�n th��ng Vang Danh Thi�n H�/award_mattich20_codeVIP_update")
				break
			end
		end
	end
	if CheckBigPromotionThang7() == 1 then
		if nB1_active == 1 and nB3_award == 0 then
			tinsert(tSay,1,"Nh�n th��ng Code Vang Danh Thi�n H�/#award_promotion(1)")
		end
		if nB2_active == 1 and nB4_award == 0 then
			tinsert(tSay,1,"Nh�n th��ng Code Facebook/#award_promotion(2)")
		end
	end
	--=============

	if nDate == 20200115 then	-- and nServerID_Hotro == 7 then
		for i = 1, getn(tbQuanCongTP) do
			if nAcc == tbQuanCongTP[i][1] and nServerID_Hotro == tbQuanCongTP[i][4] then	 	--and nRole == tbQuanCongTP[i][2] 
				local nQuanCong = abs(GetTask(701))	
				if nQuanCong < tbQuanCongTP[i][3] then
				--if GetTask(TSK_VANGDANHTHIENHA_DUATOP) < 1 then	
					--tinsert(tSay,1,"Nh�n th��ng �ua top Duy H�/award_vdth")--award_BHTA14")
					tinsert(tSay,1, "Nh�n h� tr� qu�n c�ng/get_QuanCong_HoTro")
				end
			end
		end
		for i = 1, getn(tbSuMon) do
			if nAcc == tbSuMon[i][1] and nRole == tbSuMon[i][2] and nServerID_Hotro == tbSuMon[i][4] then	 
				local nSuMon = abs(GetTask(336))	
				if nSuMon < tbSuMon[i][3] then
				--	tinsert(tSay,"Nh�n h� tr� �i�m s� m�n/get_SuMon_HoTro")
				end
			end
		end
	end	
	if nDate <= 20200119 then	
		tinsert(tSay,1,"��i ngo�i trang Mai Li�u c� th� l�u tr�/change_7daytoEver")
	end
	if nDate <= 20200127 then	
		tinsert(tSay,1,"Mua ngo�i trang B�ch Sa V�nh Vi�n (ti�u hao 100 Thi�n Ki�u L�nh)/buy_BachSa")
	end
	if nDate >= 20200121 and nDate <= 20200203 then
		tinsert(tSay,1,"��ng nh�p online nh�n th��ng T�t 2020 (t� 21.01.2020 ��n 03.02.2020)/Online_award_2018")
	end
	if nDate >= 20161207 and nDate <= 20161207 then
		local nCheck = check_gamer_inlist()
		if nCheck == 1 then
			tinsert(tSay,"Nh�n th��ng Bang H�i Tinh Anh 16/award_BHTA15")
		end
	end
	if nDate >= 20150203 and nDate <= 20150211 then
		tinsert(tSay,"Nh�n th��ng quay s� T�t �t M�i 2015/QuaySoTet")
	end
	
	if nDate >= 20150723 and nDate <= 20150723 then
		tinsert(tSay,"��i Mao Ng�u B�o B�o/DoiLacDa")
	end
	
	if nDate >= 20130401 and nDate < 20130405 then
		tinsert(tSay,1,"Nh�n th��ng N�p ZingXu tr�c tuy�n/VBonus_123Pay")
	end
	
	if nDate >= 20150128 and nDate <= 20150129  then
		tinsert(tSay,"H� tr� nh�n th��ng Khi�u Chi�n L�nh/HoTroKCL");
	end
	----------------------------------------------------------------------------------------------
--	if nDate >= 20091202 then
--		tinsert(tSay,1,"Nh�n th��ng Ho�ng Kim L�nh B�i/golden_award")
--	end
	--Ch� T�n V��ng L�nh
--	tinsert(tSay,1,"Ch� T�n V��ng L�nh/CTVL_first")
	-- ****************** Quay s� Ingame th�ng 12-2013******************
	if nDate >= 20131219 and nDate < 20140101 then
		tinsert(tSay,1,"Nh�n th��ng may m�n/lucky_award")
	end
	if nDate >= 20120314 and nDate <= 20120504 then
		tinsert(tSay, "Nh�n th��ng Huynh �� Th�m Giao /get_Invite")
	end
--	if nDate >= 20120611 and nDate <= 20120715 then
--		tinsert(tSay, "M� R��ng Th�n T�i ��n Phi�n B�n M�i/get_Invite")
	--end	
	
	local nDay = tonumber(date("%d"))
	local nYear = tonumber(date("%Y"))
	local nWeek = tonumber(date("%w"))
	if nDate >= 20120907 and nDate <= 20121230 then
		if  nWeek == 0 then
			tinsert(tSay,1,"Ta mu�n nh�n Vinh Danh VIP JX2/vip_award")
		end
	end
	if nDate >= 20200204 and nDate <= 20200208 then			
		tinsert(tSay,1,"Nh�n th��ng Kh�o S�t Online: 1 th� c��i Linh Ngh� (7 ng�y)/award_KhaoSatOnline")
	end
	if nDate == 20190515 and nServerID_Hotro ~= 123 and x == 100 then			
		tinsert(tSay,1,"��ng K� Chuy�n Server/dangkychuyenserver_chonserver")
	end
	if nDate == 20200415 then	
		tinsert(tSay,1,"T�ng 200 �i�m n�ng ��ng (nh�n th��ng mi�n ph�)/hotrodiemnangdongpbm")	
		tinsert(tSay,1,"T�ng 2 t� �i�m kinh nghi�m (nh�n th��ng mi�n ph�)/#hotrocongtrangpbm(2)")	
		tinsert(tSay,1,"T�ng �i�m c�ng tr�ng (nh�n th��ng mi�n ph�)/#hotrocongtrangpbm(3)")
	end
	if nDate >= 20191203 and nDate <= 20191205 then		
		tinsert(tSay,1,"��i v�t ph�m event th�ng 11 th�nh v�t ph�m event th�ng 12/thang11tothang12")
	end
	tinsert(tSay,"Ta ch� gh� qua/nothing")
	Say(szNpcName.."Ta chuy�n ph� tr�ch c�c ho�t ��ng nh�n th��ng. C�c h� c�n ta gi�p �� vi�c g�?",getn(tSay),tSay)
end
function award_mattich20_codeVIP_update() 
	local tbMatTich = {
		[2] = {0,107,204, 2,"Kim Cang B�t Nh� Ch�n Quy�n"},
		[4] = {0,107,205, 1,"Ti�m Long T�c Di�t Ch�n Quy�n"},
		[3] = {0,107,206, 1,"V� Tr�n B� �� Ch�n Quy�n"},
		[6] = {0,107,207, 2,"Thi�n La Li�n Ch�u Ch�n Quy�n"},
		[8] = {0,107,208, 1,"Nh� � Kim ��nh Ch�n Quy�n"},
		[9] = {0,107,209, 1,"B�ch H�i Tuy�t �m Ch�n Quy�n"},
		[11] = {0,107,210, 2,"H�n ��n Tr�n Nh�c Ch�n Quy�n"},
		[12] = {0,107,211, 2,"Qu� Thi�n Du Long Ch�n Quy�n"},
		[14] = {0,107,212, 1,"Huy�n �nh M� T�ng Ch�n Quy�n"},
		[15] = {0,107,213, 2,"Qu�n T� ��i Phong Ch�n Quy�n"},
		[17] = {0,107,214, 2,"Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
		[18] = {0,107,215, 2,"Xuy�n V�n L�c H�ng Ch�n Quy�n"},
		[20] = {0,107,216, 2,"Huy�n Minh Phong Ma Ch�n Quy�n"},
		[21] = {0,107,217, 1,"Linh C� Huy�n T� Ch�n Quy�n"},
		[23] = {0,107,218,1,"C�u Thi�n Phong L�i Ch�n Quy�n"},
		[25] = {0,107,219,2,"Minh gi�o th�nh chi�n Ch�n Quy�n"},
		[26] = {0,107,220,2,"Minh gi�o tr�n binh Ch�n Quy�n"},
		[27] = {0,107,221,1,"Minh gi�o huy�t nh�n Ch�n Quy�n"},
		[29] = {0,107,222,2,"H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[30] = {0,107,223,2,"Phong Hoa Thi�n Di�p Ch�n Quy�n"},
		[31] = {0,107,231,2,"M� Tung Ch�n Quy�n"},
		[32] = {0,107,235,2,"Thi�n Phong Ch�n Quy�n"},
	}
	local nDate = tonumber(date("%Y%m%d"))
 	if nDate > 20161231 then	
 		return 0
 	end
 	
	if gf_Judge_Room_Weight(6, 100," ") ~= 1 then
		Msg2Player("B�n kh�ng �� � tr�ng �� nh�n th��ng")
       	return 0
	end	
	local nCheckAward = GetExtPoint(EXT_SURVEY2016)
 	if nCheckAward < 32 then
 		PayExtPoint(EXT_SURVEY2016, GetExtPoint(EXT_SURVEY2016))
 	end
	if nCheckAward >= 32 then
		Talk(1, "", "��i hi�p �� nh�n th��ng r�i.")
		return 0
	end	
	
	AddExtPoint(EXT_SURVEY2016, 32)
	-- local nAcc = GetAccount()
	-- if nAcc == "nguy3nphuongng4" or nAcc == "d9nguyenoanh" then 
		-- local _, nItemID = AddItem(tbMatTich[26][1], tbMatTich[26][2], tbMatTich[26][3], 1)
		-- if tbMatTich[26][4] == 1 then
			-- SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
		-- else
			-- SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
		-- end
	-- end
	gf_WriteLogEx("BIG PROMOTION 12/2016", "Nh�n ph�n th��ng", 1, "Nh�n th��ng lo�i VIP ");		
end
function award_mattich20_codeVIP()
	local nDate = tonumber(date("%Y%m%d"))
 	if nDate > 20161225 then	
 		return 0
 	end
 	
	if gf_Judge_Room_Weight(6, 100," ") ~= 1 then
		Msg2Player("B�n kh�ng �� � tr�ng �� nh�n th��ng")
       	return 0
	end	
	local nCheckAward = GetExtPoint(EXT_SURVEY2016)
 	if nCheckAward < 30 then
 		PayExtPoint(EXT_SURVEY2016, GetExtPoint(EXT_SURVEY2016))
 	end
	if nCheckAward >= 30 then
		Talk(1, "", "��i hi�p �� nh�n th��ng r�i.")
		return 0
	end	
	
	local nAcc = GetAccount()
	-- if nAcc == "hongdepzai1102" then --2 acc nh�n th��ng b�c th�m vdth nh�ng ko c� m�t t�ch
			-- AddExtPoint(EXT_SURVEY2016, 30)
			-- gf_AddItemEx2({2,1,30944,1},"L�nh b�i h�o hi�p","NHAN THUONG VDTH 122016","nh�n")
			-- gf_AddItemEx2({2,1,30945,1},"L�nh b�i h�o hi�p","NHAN THUONG VDTH 122016","nh�n")
			-- gf_AddItemEx2({2,1,30946,1},"L�nh b�i h�o hi�p","NHAN THUONG VDTH 122016","nh�n")
			-- gf_AddItemEx2({2,1,30973,1},"L�nh b�i h�o hi�p","NHAN THUONG VDTH 122016","nh�n")
		-- return 0
	-- elseif nAcc == "571985ii" then 
			-- AddExtPoint(EXT_SURVEY2016, 30)
			-- gf_AddItemEx2({0,152,31,1,1,-1,-1,-1,-1,-1,-1,-1,13},"��ng V�n","NHAN THUONG VDTH 122016","nh�n")
			-- gf_AddItemEx2({0,153,31,1,1,-1,-1,-1,-1,-1,-1,-1,13},"��ng V�n","NHAN THUONG VDTH 122016","nh�n")
			-- gf_AddItemEx2({0,154,31,1,1,-1,-1,-1,-1,-1,-1,-1,13},"��ng V�n","NHAN THUONG VDTH 122016","nh�n")
		-- return 0
	-- end
	
	local tSay = {}
	tinsert(tSay, "Ph�i Thi�u L�m T�c Gia - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(2)")
	tinsert(tSay, "Ph�i Thi�u L�m Thi�n T�ng - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(3)")
	tinsert(tSay, "Ph�i Thi�u L�m V� T�ng - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(4)")
	tinsert(tSay, "Ph�i ���ng M�n - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(6)")
	tinsert(tSay, "Ph�i Nga My Ph�t Gia - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(8)")
	tinsert(tSay, "Ph�i Nga My T�c Gia - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(9)")
	tinsert(tSay, "Ph�i C�i Bang T�nh Y - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(11)")
	tinsert(tSay, "Ph�i C�i Bang � Y - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(12)")
	tinsert(tSay, "Ph�i V� �ang ��o Gia - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(14)")
	tinsert(tSay, "Ph�i V� �ang T�c Gia - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(15)")
	tinsert(tSay, "Ph�i D��ng M�n Th��ng K� - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(17)")
	tinsert(tSay, "Ph�i D��ng M�n Cung K� - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(18)")
	tinsert(tSay, "Ph�i Ng� ��c T� Hi�p - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(20)")
	tinsert(tSay, "Ph�i Ng� ��c C� S� - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(21)")
	tinsert(tSay, "Ph�i C�n L�n Thi�n S� - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(23)")
	tinsert(tSay, "Ph�i Minh Gi�o Th�nh Chi�n - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(25)")
	tinsert(tSay, "Ph�i Minh Gi�o Tr�n Binh - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(26)")
	tinsert(tSay, "Ph�i Minh Gi�o Huy�t Nh�n - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(27)")
	tinsert(tSay, "Ph�i Th�y Y�n V� Ti�n - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(29)")
	tinsert(tSay, "Ph�i Th�y Y�n Linh N� - Nh�n m�t t�ch 20%/#get_award_mattich20_codeVIP(30)")	
	
	tinsert(tSay,"Ta ch� gh� qua/nothing")
	Say(szNpcName.."Ta chuy�n ph� tr�ch c�c ho�t ��ng nh�n th��ng. C�c h� c�n ta gi�p �� vi�c g�?",getn(tSay),tSay)
end
function DoiLacDa()
	local DOILACDA = "\\script\\vng\\doitrangbi\\doilacda.lua";
	PutinItemBox("Chuy�n ��i trang b�" ,1 , "X�c nh�n mu�n th�c hi�n chuy�n ��i?", DOILACDA, 1)
end

function do_military_job()
	Talk(1,"",szNpcName.."Hi�n t�i th�nh n�y ch�a c� Nguy�n So�i n�o chi�m ��ng!")
end


function vip_award()
	local nValVipP = GetBit(GetExtPoint(0),1)
	local nValVipE = GetBit(GetExtPoint(0),2)
	if nValVipE ~= 1 and nValVipP ~= 1 then
		Talk(1,"",szNpcName.."T�i kho�n c�a c�c h� kh�ng c� trong danh s�ch nh�n th��ng ho�c �� nh�n th��ng r�i!")
		return 
	end	
	if nValVipP == 1 then
		if abs(GetTask(704)) ~= 6 then
			Talk(1,"",szNpcName.."T�i kho�n c�a c�c h� kh�ng ph�i Nguy�n So�i n�n kh�ng th� nh�n th��ng ���c!")
			return 
		end
		if abs(GetTask(701)) < 880000 then
			Talk(1,"",szNpcName.."T�i kho�n c�a c�c h� ph�i c� qu�n c�ng l�n h�n 880000 m�i c� th� nh�n th��ng ���c!")
			return 
		end
	end
	if gf_Judge_Room_Weight(10, 100," ") ~= 1 then
        	return
    end	
	if PayExtPoint(0, GetExtPoint(0)) == 1 then
		gf_AddItemEx2({2,1,30369,10,4},"C� Linh Th�ch","Tai khoan VIP 092012","nh�n")
		gf_AddItemEx2({2,1,30368,10,4},"C� Linh Th�ch","Tai khoan VIP 092012","nh�n")
		gf_AddItemEx2({2,95,204 ,1,1},"Thi�n Cang L�nh","Tai khoan VIP 092012","nh�n")
		gf_AddItemEx2({2,1,30071,6,1},"Nh�n S�m V�n N�m","Tai khoan VIP 092012","nh�n")	
		gf_AddItemEx2({2,1,1125,6,4},"B�nh �t b�t b�o","Tai khoan VIP 092012","nh�n")		
		gf_AddItemEx2({2,1,30346,1,1},"M�nh B�ch Kim","Tai khoan VIP 092012","nh�n")				
		gf_WriteLogEx("Tai khoan VIP 2012", "Nh�n th�nh c�ng", 1, "Nh�n th��ng account VIP")		
		--gf_EventGiveCustomAward(2,10000000,0,"Tai khoan VIP","nh�n v�ng")
		--gf_EventGiveCustomAward(5,240*60,1,"Tai khoan VIP","nh�n BCH")
	end	
end


function get_solider_glory()
	if GetLevel() < 73 then
		Talk(1,"",szNpcName.."��ng c�p 73 tr� l�n m�i c� th� l�nh th��ng!")
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."C�c h� ch�a gia nh�p h� ph�i kh�ng th� l�nh th��ng!")
		return
	end
	if gf_JudgeRoomWeight(2,100,szNpcName) == 0 then
		return
	end
	 local tGloryAwardExp = {	
		{240000,300000,1000000,0},
		{300001,350000,1300000,0},
		{350001,400000,1600000,1},
		{400001,450000,1900000,1},
		{450001,500000,2200000,2},
		{500001,550000,2500000,2},
		{550001,800000,3000000,3},
		{800000,9000000,3500000,3}	
	}
	local nBattlePoint = abs(GetTask(701))
	local nRank = 0
	for i=1,getn(tGloryAwardExp) do
		if tGloryAwardExp[i][1] <= nBattlePoint and nBattlePoint <= tGloryAwardExp[i][2] then
			nRank = i
			break
		end
	end
	if nRank <= 0 then
		Talk(1,"",szNpcName.."�i�m c�ng tr�ng c�a c�c h� ch�a �� �� l�nh th��ng!")
		return
	end
	local nDay = tonumber(date("%d"))
	if gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_DATE) ~= nDay then
		gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_DATE,nDay)
		gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT,0)	
	end
	local nCount = gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT)
	if nCount >= 3 then
		Talk(1,"",szNpcName.."H�m nay c�c h� �� l�nh th��ng 3 l�n r�i!")
		return
	end
	gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT,nCount + 1)
	gf_EventGiveCustomAward(1, tGloryAwardExp[nRank][3], 1, "Vinh Danh Tuong Si","nh�n")
	if tGloryAwardExp[nRank][4] > 0 and gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT) == 3 then
		gf_AddItemEx2({2,0,1082,tGloryAwardExp[nRank][4]},"Th�i D�ch H�n Nguy�n C�ng ��","Vinh Danh Tuong Si","nh�n")
	end
end


function get_award_for_hklb()
	local nExtVal = GetExtPoint(4)
	if nExtVal == 1 or nExtVal == 2 or nExtVal == 3 then
		local strItem = "1 ��nh H�n Thi�n Th�ch Th�n Th�ch"
		if nExtVal == 2 then
			strItem = "1 Thi�n Th�ch Linh Th�ch"
		elseif nExtVal == 3 then
			strItem = "2 Thi�n Th�ch Linh Th�ch"
		end
		Say(szNpcName.."Ch�c m�ng c�c h� �� tr�ng th��ng <color=yellow>"..strItem.."<color>, c� mu�n nh�n kh�ng?",2,"Ta mu�n nh�n!/get_award_for_hklb_confirm","Ch�a c�n/gf_DoNothing")	
	else
		Talk(1,"",szNpcName.."C�c h� kh�ng c� t�n trong danh s�ch nh�n th��ng ho�c �� nh�n th��ng!")		
	end
end


function get_award_for_hklb_confirm()
	local nExtVal = GetExtPoint(4)
	if nExtVal == 1 or nExtVal == 2 or nExtVal == 3 then
		if gf_Judge_Room_Weight(3,100,szNpcName) == 0 then
			return
		end
		PayExtPoint(4,nExtVal)
	else
		return
	end
end


function get_camnang()
	local nCount = GetItemCount(2, 1, 30045)
	if nCount > 0 then
		DelItem(2, 1, 30045,nCount)
		Talk(1,"",szNpcName.."Thu h�i C�m Nang ��i S� Ki�n th�nh c�ng!")
	else
		Talk(1,"",szNpcName.."H�nh nh� ng��i kh�ng c� C�m Nang ��i S� Ki�n trong ng��i?")
	end
end


function lucky_award()
	local nExtVal = GetExtPoint(EXT_QUAYSOINGAME)
	local tSay = {
		"Ta mu�n th� v�n may c�a m�nh/confirm_lucky_award",
		"Ta bi�t r�i/nothing",
	}
	Say(szNpcName.."Trong th�i gian t� <color=red>19/12/2013 - 31/12/2013<color>, khi qu� ��ng ��o th�c hi�n n�p ZingXu v� quy ��i sang Xu V� L�m Truy�n K� II th� s� nh�n ���c c�c l�n Quay S� Nh�n Th��ng trong game �� c� c� h�i nh�n ���c c�c ph�n th��ng may m�n � ch� ta. Hi�n t�i c�c h� c�n <color=yellow>"..nExtVal.."<color> l�n nh�n th��ng.",getn(tSay),tSay)
end


function confirm_lucky_award()
	local nExtVal = GetExtPoint(EXT_QUAYSOINGAME)
	if nExtVal <= 0 then
		Talk(1, "", szNpcName.."S� l�n nh�n th��ng may m�n c�a c�c h� kh�ng c�n.");
		return
	end
	if gf_JudgeRoomWeight(1,100,szNpcName) == 0 then
		return
	end
	Msg2Player("�ang ti�n h�nh quay s�...")
--	CastState("state_fetter", 4 * 18)
	DoWait(13,14,3)	
end


function IpBonus()
	local tSay = {}
	tinsert(tSay, "Nh�n hi�u qu� h� tr� h�ng ng�y/buff_award")
	tinsert(tSay, "Nh�n th��ng m�i 1 gi� tr�n m�ng/online_award")
	tinsert(tSay, "Xem th�i gian t�ch l�y/show_time")
	tinsert(tSay, "T�m hi�u ho�t ��ng/get_help")
	tinsert(tSay, "Ta ch� gh� qua/nothing")	
	Say(szNpcName.."Th�i gian tr�n m�ng c�a c�c h� s� ���c t�ch l�y �� ��i nh�ng ph�n th��ng h�p d�n. C�c h� c�n ta gi�p �� vi�c g�?",getn(tSay),tSay)
end


function buff_award()
	if GetPlayerRoute() == 0 then
		Talk(1, "", szNpcName.."Ch�a gia nh�p m�n ph�i kh�ng th� nh�n ���c ch�c n�ng h� tr�");
		return
	end
	if GetTask(TASK_GET_FUZHU_DATE) >= tonumber(date("%y%m%d")) then
		Talk(1, "", szNpcName.."H�m nay c�c h� �� nh�n ���c ch�c n�ng h� tr� r�i, kh�ng th� ti�p t�c nh�n th�m.");
		return
	end
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nLeftTime = ((23 - nHour) * 60 * 60 + (59 - nMin) * 60 + (60 - nSec)) * 18;
	local nRandAttr = 0;
	local nAttrId = 2600022;
	nRandAttr = gf_GetRandItemByTable(tBuff, 1000, 1);
	for i = 1, getn(tBuff[nRandAttr][3]) do
		CastState(tBuff[nRandAttr][3][i][1], tBuff[nRandAttr][3][i][2], nLeftTime, 1, nAttrId, 1);
		nAttrId = nAttrId + 1;
	end
	Say("Trong h�m nay c�c h� nh�n ���c hi�u qu� "..tBuff[nRandAttr][1],0)
	Msg2Player("B�n nh�n ���c hi�u qu� "..tBuff[nRandAttr][1]);
	
	SetTask(TASK_GET_FUZHU_TYPE,nRandAttr);
	SetTask(TASK_GET_FUZHU_DATE, tonumber(date("%y%m%d")));
end


function online_award()
	local tSay = {
		"\nNh�n ph�n th��ng s� c�p/get_low_award",
		--"\nNh�n ph�n th��ng trung c�p/get_med_award",
		"\nNh�n ph�n th��ng cao c�p/get_high_award",
		"\nNh�n ph�n th��ng Ho�ng Kim/#get_online_award(4,0)",
		"\nNh�n ph�n th��ng B�ch Kim/#get_online_award(5,0)",	--new
		"Ta ch� gh� qua/nothing",
	}
	Say(szNpcName.."C�c h� ch�n ph�n th��ng n�o?",getn(tSay),tSay);
end


function get_low_award()
	local tSay = {
		format("\nNh�n th��ng kinh nghi�m (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ho�n)/#get_online_award(%d,%d)",1,0),
		--format("Nh�n th��ng kinh nghi�m v� danh v�ng (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ho�n + 1 gi� L�c Th�n Ho�n)/#get_online_award(%d,%d)",1,1),
		--format("Nh�n th��ng kinh nghi�m v� s� m�n (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ho�n + 1 gi� Tam Thanh Ho�n)/#get_online_award(%d,%d)",1,2),
		format("Nh�n th��ng t�t c� (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ho�n + 1 gi� L�c Th�n Ho�n + 1 gi� Tam Thanh Ho�n)/#get_online_award(%d,%d)",1,3),
		format("Nh�n th��ng t�t c� k�m ch�n kh� (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ho�n + 1 gi� L�c Th�n Ho�n + 1 gi� Tam Thanh Ho�n + 1 gi� T� Linh Ho�n)/#get_online_award(%d,%d)",1,4),
		"Ta ch� gh� qua/nothing",
	}	
	Say(szNpcName.."C�c h� ch�n ph�n th��ng n�o?",getn(tSay),tSay);
end


function get_med_award()
	local tSay = {		
		format("\nNh�n th��ng kinh nghi�m (1 gi� tr�n m�ng + 1 gi� ��i B�ch C�u Ho�n)/#get_online_award(%d,%d)",2,0),
		format("Nh�n th��ng kinh nghi�m v� danh v�ng (1 gi� tr�n m�ng + 1 gi� ��i B�ch C�u Ho�n + 1 gi� C��ng L�c Th�n Ho�n)/#get_online_award(%d,%d)",2,1),
		format("Nh�n th��ng kinh nghi�m v� s� m�n (1 gi� tr�n m�ng + 1 gi� ��i B�ch C�u Ho�n + 1 gi� C��ng Hi�u Tam Thanh Ho�n)/#get_online_award(%d,%d)",2,2),
		format("Nh�n th��ng t�t c� (1 gi� tr�n m�ng + 1 gi� ��i B�ch C�u Ho�n + 1 gi� C��ng L�c Th�n Ho�n + 1 gi� C��ng Hi�u Tam Thanh Ho�n)/#get_online_award(%d,%d)",2,3),
		"Ta ch� gh� qua/nothing",
	}	
	Say(szNpcName.."C�c h� ch�n ph�n th��ng n�o?",getn(tSay),tSay);
end


function get_high_award()
	local tSay = {		
		format("\nNh�n th��ng kinh nghi�m (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ti�n ��n)/#get_online_award(%d,%d)",3,0),
	--	format("Nh�n th��ng kinh nghi�m v� danh v�ng (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ti�n ��n + 1 gi� L�c Th�n Ti�n ��n)/#get_online_award(%d,%d)",3,1),
	--	format("Nh�n th��ng kinh nghi�m v� s� m�n (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ti�n ��n + 1 gi� Tam Thanh Ti�n ��n)/#get_online_award(%d,%d)",3,2),
		format("Nh�n th��ng t�t c� (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ti�n ��n + 1 gi� L�c Th�n Ti�n ��n + 1 gi� Tam Thanh Ti�n ��n)/#get_online_award(%d,%d)",3,3),
		format("Nh�n th��ng t�t c� k�m ch�n kh� (1 gi� tr�n m�ng + 1 gi� B�ch C�u Ti�n ��n + 1 gi� L�c Th�n Ti�n ��n + 1 gi� Tam Thanh Ti�n ��n + 1 gi� T� Linh Ti�n ��n)/#get_online_award(%d,%d)",3,4),
		"Ta ch� gh� qua/nothing",
	}	
	Say(szNpcName.."C�c h� ch�n ph�n th��ng n�o?",getn(tSay),tSay);
end


function get_online_award(nType, nChosen)
	if GetLevel() < 73 then
		Talk(1,"IpBonus",szNpcName.."��ng c�p 73 tr� l�n m�i c� th� tham gia ho�t ��ng!")
		return
	end
	IpBonusClose()	
	IpBonusStart()
	local nLevel = floor(GetLevel()/10) - 6 -- tr� 6  t��ng �ng v�i ph�n t� 1,2,3 trong b�ng th��ng
	local nSmallBCH = GetTask(2501)
	local nSmallLTH = EatLiushen(1,0)
	local nSmallTTH = EatSanqin(1,0)
	local nSmallTLH = GetTask(3105)
	
	local nBigBCH = GetTask(2507)
	local nBigLTH = EatLiushen(2,0)
	local nBigTTH = EatSanqin(2,0)
	local nBigTLH = GetTask(3106)
	
	local nExBigBCH = GetTask(2508)
	local nExBigLTH = EatLiushen(3,0)
	local nExBigTTH = EatSanqin(3,0)
	local nExBigTLH = GetTask(3107)
	
	if nType == 5 then
		if GetOnlineTime() < 1 * 3600 * 6 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian tr�n m�ng c�a c�c h� ch�a �� 6 gi�!")
			return
		end
	else
		if GetOnlineTime() < 1 * 3600 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian tr�n m�ng c�a c�c h� ch�a �� 1 gi�!")
			return
		end
	end
	
	if nType == 1 then
		if nSmallBCH < 60 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ho�n c�a c�c h� kh�ng �� 1 gi�!")
			return
		end	
		if nChosen == 3 or  nChosen == 4 then
			if nSmallLTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ho�n c�a c�c h� kh�ng �� 1 gi�!!!")
				return
			end
			if nSmallTTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ho�n c�a c�c h� kh�ng �� 1 gi�!")
				return
			end
		end		
		if nChosen == 4 then
			if nSmallTLH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c T� Linh Ho�n c�a c�c h� kh�ng �� 1 gi�!!")
				return
			end
		end			
	elseif nType == 2 then
			Talk(1,"IpBonus",szNpcName.."T�nh n�ng t�m ��ng!")
			return
	elseif nType == 3 then
		if nExBigBCH < 60 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ti�n ��n c�a c�c h� kh�ng �� 1 gi�!")
			return
		end	
		if nChosen == 3 or  nChosen == 4 then
			if nExBigLTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ti�n ��n c�a c�c h� kh�ng �� 1 gi�!")
				return
			end
			if nExBigTTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ti�n ��n c�a c�c h� kh�ng �� 1 gi�!")
				return
			end
		end		
		if nChosen == 4 then
			if nExBigTLH < 60 then
				Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c T� Linh Ti�n ��n c�a c�c h� kh�ng �� 1 gi�!")
				return
			end
		end	
	elseif nType == 4 then
		if nSmallBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nSmallLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nSmallTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c ��i B�ch C�u Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c C��ng Hi�u L�c Th�n Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c C��ng Hi�u Tam Thanh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nExBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nExBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nExBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
	elseif nType == 5 then
		if nSmallBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nSmallLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nSmallTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nSmallTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c T� Linh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end			
		if nBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c ��i B�ch C�u Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c C��ng Hi�u L�c Th�n Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c C��ng Hi�u Tam Thanh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nBigTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c ��i T� Linh Ho�n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end		
		if nExBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c B�ch C�u Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end	
		if nExBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c L�c Th�n Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end
		if nExBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c Tam Thanh Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end		
		if nExBigTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."Th�i gian �y th�c T� Linh Ti�n ��n c�a c�c h� kh�ng �� 8 gi�!")
			return
		end				
	else
		Talk(1,"IpBonus",szNpcName.."Ho�t ��ng ch�a h� tr� ph�n th��ng lo�i n�y!")
		return
	end
	if nType == 5 then
		if SetOnlineTime(3600 * 6,2) >= 0 then	
			SetTask(2501,nSmallBCH - 480)
			EatLiushen(1,-480)
			EatSanqin(1,-480)
			SetTask(2507,nBigBCH - 480)
			EatLiushen(2,-480)
			EatSanqin(2,-480)
			SetTask(2508,nExBigBCH - 480)
			EatLiushen(3,-480)
			EatSanqin(3,-480)
			SetTask(3105, nSmallTLH - 480,8)
			SetTask(3106, nBigTLH - 480,8)
			SetTask(3107, nExBigTLH - 480,8)
		
			ModifyExp(7900000)
			Msg2Player("B�n nh�n ���c 7.900.000 �i�m kinh nghi�m.")
			SetTask(336,GetTask(336) + 120)
			Msg2Player("B�n nh�n ���c 120 �i�m s� m�n.")
			ModifyReputation(120,0)				
			Earn(790000)
			if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + 68)
				Msg2Player("B�n nh�n ���c 68 �i�m c�ng tr�ng.")	
			else	
				SetTask(701, GetTask(701) - 68)
				Msg2Player("B�n nh�n ���c 68 �i�m c�ng tr�ng.")	
			end
			if MeridianGetLevel() >= 1 then
				AwardGenuineQi(2900)
			end
			 gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online B�ch Kim ")
			online_award()
		end
		return
	end
	if SetOnlineTime(3600,2) >= 0 then	
		if nType == 1 then
			if nChosen == 0 then
				SetTask(2501,nSmallBCH - 60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online SC�p exp ")							
			elseif nChosen == 3 then
				SetTask(2501,nSmallBCH - 60)
				EatLiushen(1,-60)
				EatSanqin(1,-60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online SC�p all ")		
			elseif nChosen == 4 then
				SetTask(2501,nSmallBCH - 60)
				EatLiushen(1,-60)
				EatSanqin(1,-60)
				SetTask(3105,nSmallTLH - 60, 8)
				if MeridianGetLevel() >= 1 then
					AwardGenuineQi(66)
				end
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online SC�p all & ch�n kh� ")		
			else
				Talk(1,"IpBonus",szNpcName.."Ho�t ��ng ch�a h� tr� ph�n th��ng lo�i n�y!")
				return	
			end
			ModifyExp(tOnlineAward[nType][nChosen][1])	--kinh nghi�m
			Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][1].." �i�m kinh nghi�m.")						
			ModifyReputation(tOnlineAward[nType][nChosen][2],0)		--danh v�ng
			SetTask(336,GetTask(336) + tOnlineAward[nType][nChosen][3])		--s� m�n
			if nChosen ~= 0 then
				Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][3].." �i�m s� m�n.")					
			end
			Earn(tOnlineAward[nType][nChosen][6] * 10000)	--v�ng
		
			online_award()	
		elseif nType == 2 then
			online_award()
		elseif nType == 3 then
			if nChosen == 0 then
				SetTask(2508,nExBigBCH - 60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online Cao C�p exp ")							
			elseif nChosen == 3 then
				SetTask(2508,nExBigBCH - 60)
				EatLiushen(3,-60)
				EatSanqin(3,-60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online Cao C�p all ")	
				if GetTask(701) >= 0 then
					SetTask(701, GetTask(701) + tOnlineAward[nType][nChosen][4])
					Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][4].." �i�m c�ng tr�ng.")				
				else
					SetTask(701, GetTask(701) -  tOnlineAward[nType][nChosen][4])
					Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][4].." �i�m c�ng tr�ng.")					
				end	
			elseif nChosen == 4 then
				SetTask(2508,nExBigBCH - 60)
				EatLiushen(3,-60)
				EatSanqin(3,-60)
				SetTask(3107, nExBigTLH - 60, 8)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online Cao C�p all & ch�n kh� ")
				if GetTask(701) >= 0 then
					SetTask(701, GetTask(701) + tOnlineAward[nType][nChosen][4])
					Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][4].." �i�m c�ng tr�ng.")				
				else
					SetTask(701, GetTask(701) -  tOnlineAward[nType][nChosen][4])
					Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][4].." �i�m c�ng tr�ng.")					
				end	
				if MeridianGetLevel() >= 1 then
					AwardGenuineQi(199)
				end						
			else
				Talk(1,"IpBonus",szNpcName.."Ho�t ��ng ch�a h� tr� ph�n th��ng lo�i n�y!")
				return	
			end
			ModifyExp(tOnlineAward[nType][nChosen][1])	--kinh nghi�m
			Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][1].." �i�m kinh nghi�m.")						
			ModifyReputation(tOnlineAward[nType][nChosen][2],0)		--danh v�ng
			SetTask(336,GetTask(336) + tOnlineAward[nType][nChosen][3])		--s� m�n
			if nChosen ~= 0 then
				Msg2Player("B�n nh�n ���c "..tOnlineAward[nType][nChosen][3].." �i�m s� m�n.")	
			end
			Earn(tOnlineAward[nType][nChosen][6] * 10000)	--v�ng
		
			online_award()
		elseif nType == 4 then
			SetTask(2501,nSmallBCH - 480)
			EatLiushen(1,-480)
			EatSanqin(1,-480)
			SetTask(2507,nBigBCH - 480)
			EatLiushen(2,-480)
			EatSanqin(2,-480)
			SetTask(2508,nExBigBCH - 480)
			EatLiushen(3,-480)
			EatSanqin(3,-480)
		
			ModifyExp(7200000)
			Msg2Player("B�n nh�n ���c 7.200.000 �i�m kinh nghi�m.")
			SetTask(336,GetTask(336) + 120)
			Msg2Player("B�n nh�n ���c 120 �i�m s� m�n.")
			ModifyReputation(120,0)				
			Earn(720000)
			if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + 60)
				Msg2Player("B�n nh�n ���c 60 �i�m c�ng tr�ng.")	
			else	
				SetTask(701, GetTask(701) - 60)
				Msg2Player("B�n nh�n ���c 60 �i�m c�ng tr�ng.")	
			end
			 gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho�t th�nh c�ng", 1, "T�ch l�y online Ho�ng Kim")
			online_award()
		else
			Talk(1,"IpBonus",szNpcName.."Ho�t ��ng ch�a h� tr� ph�n th��ng lo�i n�y!")
			return
		end		
	end	
end

function day_award()
	local tSay = {
		format("Nh�n ph�n th��ng v�t ph�m thu th�p/#get_day_award(%d)",1),
		format("Nh�n ph�n th��ng v�t ph�m qu�n d�ng/#get_day_award(%d)",2),
		format("Nh�n ph�n th��ng T�ng Ki�m Anh H�ng Thi�p/#get_day_award(%d)",3),
		"Ta ch� gh� qua/nothing",
	}	
	Say(szNpcName.."C�c h� ch�n ph�n th��ng n�o?",getn(tSay),tSay);
end

function get_day_award(nType)
	Talk(1,"","T�nh n�ng nh�n th��ng �� ��ng ng�y l�u r�i")
	do return end
	if GetLevel() < 73 then
		Talk(1,"IpBonus",szNpcName.."��ng c�p 73 tr� l�n m�i c� th� tham gia ho�t ��ng!")
		return
	end
	
	local nDate = tonumber(date("%Y%m%d"))	
	if GetTask(TASK_GET_DAY_AWARD) == nDate then
		Talk(1,"IpBonus",szNpcName.."H�m nay c�c h� ��i ph�n th��ng n�y r�i. M�i ng�y ch� ���c ��i 1 l�n.")
		return
	end
	
	
	if GetTask(TASK_FULL_8_HOUR) ~= 1 then
		Talk(1,"IpBonus",szNpcName.."Th�i gian tr�n m�ng c�a c�c h� ch�a �� 8 gi�!")
		return
	end		

	if GetFreeItemRoom() < 2 then
		Talk(1,"IpBonus",szNpcName.."H�nh trang c�c h� kh�ng �� 2 � tr�ng.")
		return
	end	
	
	local nLevel = floor(GetLevel()/10) - 6 -- tr� 6  t��ng �ng v�i ph�n t� 1,2,3 trong b�ng th��ng		
	SetTask(TASK_GET_DAY_AWARD,nDate)
	SetTask(TASK_FULL_8_HOUR,2)
	local nRet, nItemIdx = gf_AddItemEx(tDayAward[nType][nLevel][2], tDayAward[nType][nLevel][1] )
	WriteLogEx("IP Bonus","nh�n","",tDayAward[nType][nLevel][1])			
	if nType == 3 and nRet == 1 then
		SetItemExpireTime(nItemIdx,2 * 24 * 3600)
	end
end

function show_time()
	IpBonusClose()	
	local nHour, nMin, nSec = ShowTime()
	local strMsg = format("%sTh�i gian tr�n m�ng c�a c�c h� l�: <color=yellow>%d gi� %d ph�t %d gi�y<color>.",szNpcName,nHour, nMin, nSec)
	IpBonusStart()
	Talk(1,"IpBonus",strMsg)
end

function get_help()
	local tSay = {
		format("%sTh�i gian nh�n v�t tr�n m�ng s� ���c t�ch l�y li�n t�c. Nh�n v�t c� th� s� d�ng 2 gi�  tr�n m�ng �� ��i c�c lo�i ph�n th��ng. Ph�n th��ng bao g�m kinh nghi�m, danh v�ng, �i�m s� m�n v� v�ng. <color=red>Ch� �: n�u ch�n nh�n th��ng t�t c�, s� l��ng ph�n th��ng s� nhi�u h�n. M�i nh�n v�t ch� c� th� t�ch l�y ���c 8 gi� tr�n m�ng, sau khi ��i th��ng th� th�i gian ti�p t�c ���c t�ch l�y<color>.",szNpcName),
		format("%sN�u t�ch l�y �� 8 gi� tr�n m�ng, nh�n v�t c� th� ��i ���c c�c lo�i v�t ph�m thu th�p, v�t ph�m qu�n d�ng ho�c Anh H�ng Thi�p (kh�ng th� giao d�ch, h�n t�n t�i 2 ng�y). <color=red>Ch� �: m�i ng�y nh�n v�t ch� c� th� ��i 1 l�n<color>.",szNpcName),
		format("%sNgo�i ra, nh�n v�t c�n c� th� nh�n ���c hi�u qu� h� tr� ng�u nhi�n h�ng ng�y. <color=red>Ch� �: sau 24 gi� h�ng ng�y, hi�u qu� s� bi�n m�t. M�i ng�y nh�n v�t ch� c� th� nh�n hi�u qu� h� tr� 1 l�n<color>.",szNpcName),
	}
	TalkEx("IpBonus",tSay)
end

function nothing()
end

tbMoiBanCungChoi = {
	[1] = {{0, 100, 8055}, {0, 101, 8055},{0, 103, 8055}, "Set Thi�n Chi Vi�m ��"},
	[2] = {
				{"Ph� Y�n �ao", {0, 3, 6001,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Ph� Y�n c�n", {0, 5, 6002,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Ph� Y�n tr��ng", {0, 8, 6003,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"H�m Y�n th�", {0, 0, 6004,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"T�ng Y�n ch�m", {0, 1, 6005,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Phi Y�n ki�m", {0, 2, 6006,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"V�n Y�n c�m", {0, 10, 6007,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"V�n Y�n th�", {0, 0, 6008,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"L�u Y�n c�n", {0, 5, 6009,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Huy�n Y�n ki�m", {0, 2, 6010,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"V� Y�n b�t", {0, 9, 6011,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"H� Ti�m Th��ng", {0, 6, 6012,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"H�nh Y�n Cung", {0, 4, 6013,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Tr�c Y�n nh�n", {0, 7, 6014,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Y�u Y�n tr�o", {0, 11, 6015,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
			},
	[3] = {{2,1,9977,8}, "Qu�n c�ng Huy Ho�ng", 7*24*60*60},
	[4] = {{2,1,9998,8}, "Qu�n c�ng ��i", 7*24*60*60},
	[5] = {{2,1,30087,5}, "T�i h�t gi�ng", 7*24*60*60},
	[6] = {{2,1,1008,1}, "B�ch C�u Ti�n ��n", 7*24*60*60},
}
tbMoRuongThanTai = {
		[4] = {"T�i Thi�n Th�ch Tinh Th�ch",{2,1,3356,1}, 7*24*60*60 },
		[5] = {"Qu�n C�ng Huy Ho�ng",{2,1,9977,1}, 7*24*60*60 },
		[6] = {"Thi�n Th�ch Tinh Th�ch",{2,1,1009,1}},
		[7] = {"Chi�m Y Ph�",{0,107,66,1}},
	}

function get_Invite()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H�y ch�n ph�n th��ng."
	
	tinsert(tbSayDialog, "- Nh�n 1 b� trang b� Thi�n Chi Vi�m �� [+10]/#get_TCVD_new(10)")
	tinsert(tbSayDialog, "- Nh�n 1 b� trang b� Vi�m �� [+13]/#get_VD(13)")
	tinsert(tbSayDialog, "- Nh�n 1 m�t t�ch cao c�p theo h� ph�i/#get_Award(3)")	
	tinsert(tbSayDialog, "- Nh�n 1 t�i Thi�n Th�ch Tinh Th�ch/#get_Award(4)")	
	tinsert(tbSayDialog, "- Nh�n 1 qu�n c�ng Huy Ho�ng/#get_Award(5)")	
	tinsert(tbSayDialog, "- Nh�n 1 Thi�n Th�ch Tinh Th�ch/#get_Award(6)")	
	tinsert(tbSayDialog, "- Nh�n 1 Chi�m Y Ph�/#get_Award(7)")	
	
	
	--tinsert(tbSayDialog, "- Nh�n 1 v� kh� Vi�t Y�n [+10]/get_vukhi")
	--tinsert(tbSayDialog, "- Nh�n 8 qu�n c�ng Huy Ho�ng/#get_prize(3)")
	--tinsert(tbSayDialog, "- Nh�n 8 qu�n c�ng ��i/#get_prize(4)")
	--tinsert(tbSayDialog, "- Nh�n 5 T�i h�t gi�ng/#get_prize(5)")
	--tinsert(tbSayDialog, "- Nh�n 1 B�ch C�u Ti�n ��n/#get_prize(6)")
	tinsert(tbSayDialog, "Ta ch� gh� qua/nothing")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

function get_TCVD()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H�y ch�n ph�n th��ng."
	
	tinsert(tbSayDialog, "- Nam Ti�u Chu�n/#get_prize(1,1)")
	tinsert(tbSayDialog, "- Nam Kh�i Ng�/#get_prize(1,2)")
	tinsert(tbSayDialog, "- N� G�i C�m/#get_prize(1,3)")
	tinsert(tbSayDialog, "- Ki�u N�/#get_prize(1,4)")
	tinsert(tbSayDialog, "Tr� l�i/get_Invite")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function get_vukhi()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H�y ch�n v� kh� c�n nh�n."
	
	tinsert(tbSayDialog, "- Ph� Y�n �ao/#get_prize(2,1)")
	tinsert(tbSayDialog, "- Ph� Y�n c�n/#get_prize(2,2)")
	tinsert(tbSayDialog, "- Ph� Y�n tr��ng/#get_prize(2,3)")
	tinsert(tbSayDialog, "- H�m Y�n th�/#get_prize(2,4)")
	tinsert(tbSayDialog, "- T�ng Y�n ch�m/#get_prize(2,5)")
	tinsert(tbSayDialog, "- Phi Y�n ki�m/#get_prize(2,6)")
	tinsert(tbSayDialog, "- V�n Y�n c�m/#get_prize(2,7)")
	tinsert(tbSayDialog, "- V�n Y�n th�/#get_prize(2,8)")
	tinsert(tbSayDialog, "- L�u Y�n c�n/#get_prize(2,9)")
	tinsert(tbSayDialog, "- Huy�n Y�n ki�m/#get_prize(2,10)")
	tinsert(tbSayDialog, "- V� Y�n b�t/#get_prize(2,11)")
	tinsert(tbSayDialog, "- H� Ti�m Th��ng/#get_prize(2,12)")
	tinsert(tbSayDialog, "- H�nh Y�n Cung/#get_prize(2,13)")
	tinsert(tbSayDialog, "- Tr�c Y�n nh�n/#get_prize(2,14)")
	tinsert(tbSayDialog, "- Y�u Y�n tr�o/#get_prize(2,15)")
	tinsert(tbSayDialog, "Tr� l�i/get_Invite")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

function get_prize(nGetType, nSelected)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	if nGetType == 0 then
		return 0;
	end	
	if gf_Judge_Room_Weight(10, 500, "") == 0 then
        return 0;
    	end	
	if gf_GetExtPointByte(1,2) <= 0 then
		Talk(1, "", "��i hi�p ch�a k�ch ho�t code ho�c �� nh�n th��ng r�i n�n kh�ng th� nh�n th��ng ���c n�a!!!")
		return
	end
	if nGetType == 1 then
		if  gf_GetExtPointByte(1,2) == 1 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
					nP = 8055 + nSelected - 1		
					gf_AddItemEx2({0, 100, nP,1,1, -1,-1, -1, -1, -1, -1, -1,10}, tbMoiBanCungChoi[nGetType][4], szLogTitle, "nh�n th�nh c�ng")	
					gf_AddItemEx2({0, 101, nP,1,1, -1,-1, -1, -1, -1, -1, -1,10}, tbMoiBanCungChoi[nGetType][4], szLogTitle, "nh�n th�nh c�ng")			
					gf_AddItemEx2({0, 103, nP,1,1, -1,-1, -1, -1, -1, -1, -1,10}, tbMoiBanCungChoi[nGetType][4], szLogTitle, "nh�n th�nh c�ng")													
			end
		else
			Talk(1, "", "��i hi�p �� ch�n kh�ng ��ng v�i ph�n th��ng �� tr�ng khi quay s�, xin m�i ch�n l�i!!!")
		end
	end
	
	if nGetType == 2 then
		if  gf_GetExtPointByte(1,2) == 2 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
					local nChoose = tbMoiBanCungChoi[nGetType][nSelected][2]
					gf_AddItemEx2(nChoose, tbMoiBanCungChoi[nGetType][nSelected][1], szLogTitle, "nh�n th�nh c�ng")											
			end
		else
			Talk(1, "", "��i hi�p �� ch�n kh�ng ��ng v�i ph�n th��ng �� tr�ng khi quay s�, xin m�i ch�n l�i!!!")
		end
	end
	
	if nGetType == 3 then
		if  gf_GetExtPointByte(1,2) == 3 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
				gf_AddItemEx2(tbMoiBanCungChoi[nGetType][1], tbMoiBanCungChoi[nGetType][2], szLogTitle, "nh�n th�nh c�ng", tbMoiBanCungChoi[nGetType][3])			
			end
		else
			Talk(1, "", "��i hi�p �� ch�n kh�ng ��ng v�i ph�n th��ng �� tr�ng khi quay s�, xin m�i ch�n l�i!!!")
		end
	end
	if nGetType == 4 then
		if  gf_GetExtPointByte(1,2) == 4 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
				gf_AddItemEx2(tbMoiBanCungChoi[nGetType][1], tbMoiBanCungChoi[nGetType][2], szLogTitle, "nh�n th�nh c�ng", tbMoiBanCungChoi[nGetType][3])			
			end
		else
			Talk(1, "", "��i hi�p �� ch�n kh�ng ��ng v�i ph�n th��ng �� tr�ng khi quay s�, xin m�i ch�n l�i!!!")
		end
	end
	if nGetType == 5 then
		if  gf_GetExtPointByte(1,2) == 5 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
				gf_AddItemEx2(tbMoiBanCungChoi[nGetType][1], tbMoiBanCungChoi[nGetType][2], szLogTitle, "nh�n th�nh c�ng", tbMoiBanCungChoi[nGetType][3])			
			end
		else
			Talk(1, "", "��i hi�p �� ch�n kh�ng ��ng v�i ph�n th��ng �� tr�ng khi quay s�, xin m�i ch�n l�i!!!")
		end
	end
	if nGetType == 6 then
		if  gf_GetExtPointByte(1,2) == 6 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
				gf_AddItemEx2(tbMoiBanCungChoi[nGetType][1], tbMoiBanCungChoi[nGetType][2], szLogTitle, "nh�n th�nh c�ng", tbMoiBanCungChoi[nGetType][3])			
			end
		else
			Talk(1, "", "��i hi�p �� ch�n sai ph�n th��ng, xin m�i ch�n l�i!!!")
		end
	end
end
function Check_Award()
	local nValue = 0
	nValue = GetExtPoint(6)
	if nValue > 0 then
		return nValue
	end
	return 0
end
function get_VD(nLv)
	local VD =
	{
		{0,103,8000,"Vi�m �� Kh�i"},
		{0,100,8000,"Vi�m �� Gi�p"},
		{0,101,8000,"Vi�m �� Trang"},
	}
	local nBody = GetBody()
	local nCheck  = Check_Award()
	if nCheck ~= 2 then
		Talk(1, "", "��i hi�p �� ch�n sai ph�n th��ng, xin m�i ch�n l�i!!!")
		return 0
	end
	if gf_Judge_Room_Weight(5, 100," ") ~= 1 then
        	return
    end	
	PayExtPoint(6, GetExtPoint(6))
	
	for i = 1 , getn(VD) do
		gf_AddItemEx2({VD[i][1],VD[i][2],VD[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nLv},VD[i][4],"Mo Ruong Than Tai","nh�n th��ng VD th�nh c�ng")
	end
end
function get_TCVD_new(nLv)
	local TCVD =
	{
		{0,103,8054,"Thi�n Chi Vi�m �� Kh�i"},
		{0,100,8054,"Thi�n Chi Vi�m �� Gi�p"},
		{0,101,8054,"Thi�n Chi Vi�m �� Trang"},
	}
	local nBody = GetBody()
	local nCheck  = Check_Award()
	if nCheck ~= 1 then
		Talk(1, "", "��i hi�p �� ch�n sai ph�n th��ng, xin m�i ch�n l�i!!!")
		return 0
	end
	if gf_Judge_Room_Weight(5, 100," ") ~= 1 then
        	return
    end		
	PayExtPoint(6, GetExtPoint(6))
	for i = 1 , getn(TCVD) do
		gf_AddItemEx2({TCVD[i][1],TCVD[i][2],TCVD[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nLv},TCVD[i][4],"Mo Ruong Than Tai","nh�n th��ng TCVD th�nh c�ng")
	end
end
function get_Award(nType)
	local nCheck  = Check_Award()
	local nRoute = GetPlayerRoute()
	if nType == 3 then	
		if nRoute <= 0 then
			Talk(1, "", "��i hi�p ch�a gia nh�p h� ph�i n�n kh�ng th� nh�n th��ng !!!")
			return 0
		end
	end
	if nCheck ~= nType then
		Talk(1, "", "��i hi�p �� ch�n sai ph�n th��ng, xin m�i ch�n l�i!!!")
		return 0
	end
	if gf_Judge_Room_Weight(5, 100," ") ~= 1 then
        	return
    end		
	PayExtPoint(6, GetExtPoint(6))

	if nType == 3 then
		gf_AddItemEx2(VET_70_GAOJIMIJI_NEW[nRoute][2], VET_70_GAOJIMIJI_NEW[nRoute][1], "Mo Ruong Than Tai", "nh�n th��ng th�nh c�ng")
	elseif nType == 4 or nType == 5 then
		gf_AddItemEx2(tbMoRuongThanTai[nType][2], tbMoRuongThanTai[nType][1], "Mo Ruong Than Tai", "nh�n th��ng th�nh c�ng", tbMoRuongThanTai[nType][3])
	elseif nType == 6 or nType == 7 then
			gf_AddItemEx2(tbMoRuongThanTai[nType][2], tbMoRuongThanTai[nType][1], "Mo Ruong Than Tai", "nh�n th��ng th�nh c�ng")
	
	end
--tbMoRuongThanTai
end


function VBonusMenu()
	do return 0 end
	local nDate = tonumber(date("%Y%m%d"))
	local tbSay = {}
	tinsert(tbSay,"K�ch ho�t c�p �� 81/ChonPheVBonus")
	tinsert(tbSay,"Nh�n th��ng ��ng c�p 83/#NhanThuongVBonus(83)")
	tinsert(tbSay,"Nh�n th��ng ��ng c�p 86/#NhanThuongVBonus(86)")
	tinsert(tbSay,"Nh�n th��ng ��ng c�p 89/#NhanThuongVBonus(89)")
	tinsert(tbSay,"Nh�n th��ng ��ng c�p 91/#NhanThuongVBonus(91)")
	tinsert(tbSay,"Nh�n th��ng ��ng c�p 96/#NhanThuongVBonus(96)")
	tinsert(tbSay,"Nh�n th��ng ��ng c�p 98/#NhanThuongVBonus(98)")
	tinsert(tbSay,"Nh�n th��ng ��ng c�p 99/#NhanThuongVBonus(99)")
	tinsert(tbSay,"Ta ch� gh� xem th�i/gf_DoNothing")
	Say(szNpcName .."Ta l� ng��i ch�u tr�ch nhi�m trao ph�n th��ng ch��ng tr�nh V-Bonus cho c�c h�", getn(tbSay), tbSay)
end


function ChonPheVBonus()
	tbSay = {}
	tinsert(tbSay, "Ta mu�n ch�n phe T�ng/#KichHoatVBonus(1)")
	tinsert(tbSay, "Ta mu�n ch�n phe Li�u/#KichHoatVBonus(2)")
	tinsert(tbSay, "Ta c�n suy ngh� th�m/gf_DoNothing")
	Say("C�c h� h�y ch�n cho m�nh phe ph�i th�ch h�p.", getn(tbSay), tbSay)
end


function KichHoatVBonus(nPhe)
	local nVB = GetExtPoint(EXT_VBONUS)
	if GetBit(nVB,1) == 0 then
		Talk(1,"",szNpcName .."T�i kho�n c�c h� ch�a ���c ch� ph�ng m�y k�ch ho�t.")
		return 0
	end
	if GetBit(nVB,2) == 1 then
		Talk(1,"",szNpcName .."T�i kho�n c�c h� �� h�t h�n nh�n th��ng.")
		return 0
	end
	if GetBit(nVB,3) == 1 then
		Talk(1,"",szNpcName .."T�i kho�n c�c h� �� k�ch ho�t c�p �� 81 r�i.")
		return 0
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."��i hi�p ch�a gia nh�p h� ph�i, ta kh�ng th� gi�p g� ���c...")
		return 0
	end
	if GetLevel() >= 81 then
		Talk(1,"",szNpcName.."��ng c�p c�c h� �� qu� cao, ta kh�ng th� gi�p g� ���c...")
		return 0
	end
--	if gf_Judge_Room_Weight(7,100) ~= 1 then
--		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
--		return 0
--	end
	
--	nVB = SetBit(nVB,3,1)
--	PayExtPoint(EXT_VBONUS,GetExtPoint(EXT_VBONUS))
--	AddExtPoint(EXT_VBONUS, nVB)
	VNG_SetExtBit(EXT_VBONUS,3,1)
	gf_WriteLogEx("NHAN THUONG VBONUS","nh�n",1,"Ph�n th��ng k�ch ho�t")
	SetLevel(81,0)
	SetTask(336,GetTask(336) + 2000)
	Msg2Player("C�ng hi�n s� m�n t�ng 2000 �i�m.")
	ModifyReputation(2000,0)
	SetTask(TSK_nvVBonus, 1) --task x�c ��nh b�t ��u �� b�t l�m nhi�m v� VBonus
	if nPhe == 1 then
		SetTask(701,GetTask(701)+3000)
	else
		local nCongTrang = GetTask(701)
		nCongTrang = -nCongTrang
		SetTask(701,nCongTrang-3000)
	end
	Msg2Player("C�ng tr�ng t�ng 3000 �i�m.")
--	local tbItem = {item={{gdp={2,1,30340,6789}, name = "M�c R��ng"}}}
--	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
--	LIB_Award.szLogAction = "nh�n"
--	LIB_Award:Award(tbItem)
	Talk(1,"","��ng c�p c�a c�c h� �� t�ng ��n 81, vui l�ng ��ng nh�p l�i �� c� hi�u l�c.")
end


function TopCheckSkill(nSkillLevel)
	tb_Skill_ID = {
		[0] = 0,
		[1] = 0,	
		[2] = 32,	
		[3] = 57,	
		[4] = 44,	
		[5] = 0,	
		[6] = 74,	
		[7] = 0,	
		[8] = 89,	
		[9] = 102,
		[10] = 0,			
		[11] = 113,
		[12] = 124,
		[13] = 0,		
		[14] = 146,
		[15] = 159,
		[16] = 0,		
		[17] = 732,
		[18] = 745,
		[19] = 0,		
		[20] = 775,
		[21] = 774,
		[23] = 1032,
		[25] = 1065,
		[26] = 1093,
		[27] = 1143,
		[29] = 1196,
		[30] = 1230,
		[31] = 1883,
		[32] = 1897,
	}
	local nRoute = GetPlayerRoute();
	local nSkillID = tb_Skill_ID[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= nSkillLevel then
			return 1
		else
			return 0
		end;
	end;
end;


function VBonusShop()
	do return 0 end
	
	local nDate = tonumber(date("%m%d"))
	if mod(tonumber(GetTask(TSK_VBONUS_SaleOff)),10000) ~= nDate then
		SetTask(TSK_VBONUS_SaleOff, nDate)
	end
	local tbSay = {}
	for i=1,getn(tbVBonusItemShop) do
		tinsert(tbSay, "Mua "..tbVBonusItemShop[i][1].." ("..tbVBonusItemShop[i][3].." xu v�t ph�m)/#VBonusShop_Buy("..i..")")
	end
	tinsert(tbSay,"Ta ch� mu�n gh� xem/gf_DoNothing")
	Say(szNpcName.."Ta c� l� h�ng gi� ��c bi�t, ch� d�nh ri�ng cho b�ng h�u �� k�ch ho�t VBonus, c�c h� h�y xem th�...", getn(tbSay), tbSay)
end


function VBonusShop_Buy(nOption)
	do return 0 end
	
	local nVB = GetExtPoint(EXT_VBONUS)
	if GetBit(nVB,1) == 0 then
		Talk(1,"",szNpcName.."Ch� c� b�ng h�u tham gia ch��ng tr�nh VBonus m�i ���c mua l� h�ng n�y.");
		return 0
	end
	if gf_Judge_Room_Weight(1, 100," ") ~= 1 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
		return 0
	end
	local szName = tbVBonusItemShop[nOption][1]
	local tbItem = tbVBonusItemShop[nOption][2]
	local nPrize = tbVBonusItemShop[nOption][3]
	local nMax = tbVBonusItemShop[nOption][4]
	local nPos = tbVBonusItemShop[nOption][5]
	local nQty = GetTaskPosition(TSK_VBONUS_SaleOff, nPos)
	if nQty >= nMax then
		Talk(1,"",szNpcName.."B�ng h�u �� mua �� <color=red>"..nMax.."<color> <color=yellow>"..szName.."<color> trong ng�y, mai h�y quay l�i nh�.");
		return 0
	end
	if GetItemCount(2,1,30230) < nPrize then
		Talk(1,"",szNpcName.."B�ng h�u kh�ng �em �� <color=yellow>"..nPrize.." xu v�t ph�m<color>, h�y chu�n b� th�m.");
		return 0
	end
	
	if DelItem(2,1,30230, nPrize) == 1 then
		gf_AddItemEx2(tbItem, szName,"MUA VAT PHAM VBONUS","nh�n", 7*24*60*60)
		SetTaskPosition(TSK_VBONUS_SaleOff, nPos, nQty+1)
	end
end


function GetTaskPosition(nTask, nPosition)
	if nPosition <= 0 then
		return
	end
	local nTaskValue = GetTask(nTask)
	local nResult = floor(nTaskValue/(10^(nPosition-1)))
	return mod(nResult,10)
end


function SetTaskPosition(nTask, nPosition, nValue)
	if nPosition <= 0 then
		return
	end
	if nValue > 9 or nValue < 0 then
		return
	end
	local nTaskValue = GetTask(nTask)
	local nResult = floor(nTaskValue/(10^nPosition))*(10^nPosition) + nValue*(10^(nPosition-1)) + mod(nTaskValue,(10^(nPosition-1)))
	SetTask(nTask, nResult)
	return 1
end


function NhanThuongVBonus(nOption)
	do return 0 end
	
	local tbAwardList = {
		[83] = {fn = "VBonus_NhanThuong83()", nChankhi = 5000},
		[86] = {fn = "VBonus_NhanThuong86()", nChankhi = 10000},
		[89] = {item={{gdp={0,105,10107,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "Thi�u D��ng Ki�m", nExpired = 14*24*60*60}}, fn = "VBonus_NhanThuong89()", nPetExp = 300, nChankhi = 15000},
		[91] = {item={{gdp={2,1,1068,1,4}, name = "Thi�n Th�ch Linh Th�ch", nExpired = 30*24*60*60}}, nPetExp = 300, nPetLinhluc = 200, nChankhi = 15000},
		[96] = {item={{gdp={2,1,1067,1,4}, name = "��nh h�n thi�n th�ch", nExpired = 30*24*60*60}},nPetExp = 300, nPetLinhluc = 200, nChankhi = 20000},
		[98] = {item={
								{gdp={2,0,1082,1000}, name = "M�nh Th�i D�ch"},
								{gdp={2,1,9977,2,4}, name = "Qu�n C�ng Huy Ho�ng", nExpired = 7*24*60*60},
							}
							, nChankhi = 20000, nGold = 10000000},
		[99] = {item={
					{gdp={2,1,30345,1,1}, name = "Chuy�n Sinh ��n", nExpired = 60*24*3600},
					{gdp={2,1,1113,1,4}, name = "��i ��nh H�n", nExpired = 30*24*60*60},
				},
				fn = "VBonus_NhanThuong99()"}
	}
	if tbAwardList[nOption] == nil then
		return 0
	end
	
	local tbCondition = {
		[83] = {nPos = 4, nSlot = 6, nWeight = 300},
		[86] = {nPos = 5, nSlot = 6, nWeight = 300},
		[89] = {nPos = 6, nSlot = 6, nWeight = 300},
		[91] = {nPos = 7, nSlot = 6, nWeight = 300},
		[96] = {nPos = 8, nSlot = 6, nWeight = 300},
		[98] = {nPos = 9, nSlot = 6, nWeight = 300},
		[99] = {nPos = 10, nSlot = 6, nWeight = 300},
	}
	local tbTaskCondition = {
		[83] = {1},
		[86] = {2},
		[89] = {3},
		[91] = {4},
		[96] = {5},
		[98] = {6},
		[99] = {7},
	}
	local nVB = GetExtPoint(EXT_VBONUS)
	if GetBit(nVB,1) == 0 then
		Talk(1,"",szNpcName .."T�i kho�n c�c h� ch�a ���c ch� ph�ng m�y k�ch ho�t.")
		return 0
	end
	if GetBit(nVB,2) == 1 then
		Talk(1,"",szNpcName .."T�i kho�n c�c h� �� h�t h�n nh�n th��ng.")
		return 0
	end
	if GetBit(nVB,tbCondition[nOption]["nPos"]) == 1 then
		Talk(1,"",szNpcName .."C�c h� �� nh�n th��ng c�p �� ".. nOption .." r�i.")
		return 0
	end
	if GetLevel() < nOption then
		Talk(1,"",szNpcName.."B�ng h�u kh�ng �� ��ng c�p nh�n th��ng, h�y c� g�ng th�m.");
		return 0
	end
	vb_tbRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [25] = 1, [26] = 1, [27] = 1, [29] = 1,[30] = 1,[31] = 1,[32] = 1}
	local nRoute = GetPlayerRoute()
	if vb_tbRoute [nRoute] ~= 1 then
		Talk(1, "", " Ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng.");
		return 0
	end
	local nTaskNhiemVu_check = mod(GetTask(TSK_nvVBonus),10)	
	if nTaskNhiemVu_check ~= tbTaskCondition[nOption][1] then
		Talk(1,"",szNpcName.."B�ng h�u ch�a nh�n th��ng c�p tr��c ��.");
		return 0
	end
	if nOption == 99  then
		if TopCheckSkill(20) == 0 then
			Talk(1, "", szNpcName.."C�c h� ch�a luy�n th�nh v� c�ng tr�n ph�i 20 c�p.");
			return 0
		end
		if abs(GetTask(701)) < 180000 then
			Talk(1, "", szNpcName.."�i�m c�ng tr�ng ch�a �� 180000, ch�a th� nh�n th��ng..");
			return 0
		end
		if GetReputation() < 15000 then
			Talk(1, "", szNpcName.."�i�m danh v�ng ch�a �� 15000, ch�a th� nh�n th��ng..");
			return 0
		end
		if GetTask(336) < 15000 then
			Talk(1, "", szNpcName.."�i�m s� m�n ch�a �� 15000, ch�a th� nh�n th��ng..");
			return 0
		end
	end
	if nOption >= 88  then
		if TopCheckSkill(10) == 0 then
			Talk(1, "", szNpcName.."C�c h� ch�a luy�n th�nh v� c�ng tr�n ph�i 10 c�p.");
			return 0
		end
	end
	if gf_Judge_Room_Weight(tbCondition[nOption]["nSlot"], tbCondition[nOption]["nWeight"]) ~= 1 then
		Talk(1,"",szNpcName.."B�ng h�u kh�ng �� ".. tbCondition[nOption]["nSlot"] .." � h�nh trang, "..tbCondition[nOption]["nWeight"].." s�c l�c, h�y s�p x�p l�i nh�.")
		return 0
	end
	local nCheckNV = check_nhiemvu(nOption) 
	if nCheckNV ~= 1 then
		return 0
	end
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)	
	SetTask(TSK_nvVBonus, nTaskNhiemVu + 1) -- settask x�c nh�n l�m nhi�m v� th�m 1 �� l�m nhi�m v� m�i cho nh�n th��ng level ti�p
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbAwardList[nOption])
--	if nOption ~= 86 then
--		nVB = SetBit(nVB,tbCondition[nOption]["nPos"],1)
--		PayExtPoint(EXT_VBONUS,GetExtPoint(EXT_VBONUS))
--		AddExtPoint(EXT_VBONUS, nVB)
		VNG_SetExtBit(EXT_VBONUS,tbCondition[nOption]["nPos"],1)
--	end
	if nOption ~= 83 and nOption ~= 86 and nOption ~= 99 then
		gf_WriteLogEx("NHAN THUONG VBONUS","nh�n",1,"Ph�n th��ng c�p "..nOption)
	end
end

function VBonus_NhanThuong83()
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nh�n"
	local nRoute = GetPlayerRoute()
	local tbAward = tbTrangBiHaoNguyet_trangbi[nRoute]
	LIB_Award:AwardByBody(tbAward)
	gf_WriteLogEx("NHAN THUONG VBONUS","nh�n",1,"Ph�n th��ng c�p 83")
	Talk(1,"",szNpcName.."C�c h� �� nh�n ���c ph�n th��ng VBonus ��ng c�p 83.")
end

function VBonus_NhanThuong86()
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:AwardByRoute(tbVuKhiHaoNguyet_trangbi)	
	LIB_Award:AwardByRoute(tbNgocBoiCuuChau)
	gf_WriteLogEx("NHAN THUONG VBONUS","nh�n",1,"Ph�n th��ng c�p 86")
	Talk(1,"",szNpcName.."C�c h� �� nh�n ���c ph�n th��ng VBonus ��ng c�p 86.")
end

function VBonus_NhanThuong86_old()	--Vbonus c�
	local tbSay = {}
	tinsert(tbSay,"Thi�n Ngh�a C�u D��ng/#NhanThuongThienNghia(1)")
	tinsert(tbSay,"Thi�n Ngh�a C�u �m/#NhanThuongThienNghia(2)")
	tinsert(tbSay,"�� ta suy ngh� th�m/gf_DoNothing")
	Say(szNpcName .."Ng��i h�y ch�n cho m�nh b� trang b� th�ch h�p.", getn(tbSay), tbSay)
end

function VBonus_NhanThuong89()
	local tbMatTich = {
		[2] = {item={{gdp={0, 112, 101, 1}}}},
		[4] = {item={{gdp={0, 112, 102, 1}}}},		
		[3] = {item={{gdp={0, 112, 103, 1}}}},		
		[6] = {item={{gdp={0, 112, 104, 1}}}},		
		[8] = {item={{gdp={0, 112, 105, 1}}}},		
		[9] = {item={{gdp={0, 112, 106, 1}}}},		
		[11] = {item={{gdp={0, 112, 107, 1}}}},		
		[12] = {item={{gdp={0, 112, 108, 1}}}},		
		[14] = {item={{gdp={0, 112, 109, 1}}}},		
		[15] = {item={{gdp={0, 112, 110, 1}}}},		
		[17] = {item={{gdp={0, 112, 111, 1}}}},		
		[18] = {item={{gdp={0, 112, 112, 1}}}},		
		[20] = {item={{gdp={0, 112, 113, 1}}}},		
		[21] = {item={{gdp={0, 112, 114, 1}}}},
		[23] = {item={{gdp={0,112,192,1}}}},
		[25] = {item={{gdp={0,112,192,1}}}},
		[26] = {item={{gdp={0,112,192,1}}}},
		[27] = {item={{gdp={0,112,192,1}}}},
		[29] = {item={{gdp={0,112,196,1}}}},
		[30] = {item={{gdp={0,112,197,1}}}},
		[31] = {item={{gdp={0, 112, 104, 1}}}},
		[32] = {item={{gdp={0,112,192,1}}}},		
	}
	local nRoute = GetPlayerRoute()
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nh�n"	
	LIB_Award:Award(tbMatTich[nRoute])
end
function VBonus_NhanThuong99()
	local nBody = GetBody()
	local nRoute = GetPlayerRoute()
	if tbVuKhiChienCuong[nBody] == nil or tbVuKhiChienCuong[nBody][nRoute] == nil then
			return 0
		end
	tbNewItem = tbVuKhiChienCuong[nBody]
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:AwardByRoute(tbNewItem)
	gf_WriteLogEx("NHAN THUONG VBONUS","nh�n",1,"Ph�n th��ng c�p 99")
	Talk(1,"",szNpcName.."C�c h� �� nh�n ���c ph�n th��ng VBonus ��ng c�p 99.")
	
end

function NhanThuongThienNghia_old(nOption)
	local tbNuOaTinhThach = {item={{gdp={2,1,504,6,4}, name = "N� Oa Tinh Th�ch	", nExpired = 30*24*60*60}}}
	local tbThienNghia1_B1 = {item = {
			{gdp={0,100,3034,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng H�a Y"},
			{gdp={0,103,3034,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng Nh�t Qu�n"},
			{gdp={0,101,3034,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng Long Trang"},}
	}
	local tbThienNghia1_B2 = {item = {
			{gdp={0,100,3040,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng H�a Y"},
			{gdp={0,103,3040,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng Nh�t Qu�n"},
			{gdp={0,101,3040,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng Long Trang"},}
	}
	local tbThienNghia1_B3 = {item = {
			{gdp={0,100,3046,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng H�a Y"},
			{gdp={0,103,3046,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng Nh�t Qu�n"},
			{gdp={0,101,3046,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng Long Trang"},}
	}
	local tbThienNghia1_B4 = {item = {
			{gdp={0,100,3052,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng H�a Y"},
			{gdp={0,103,3052,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng Nh�t Qu�n"},
			{gdp={0,101,3052,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u D��ng Long Trang"},}
	}
	local tbThienNghiaSet1 = {
		[1] = tbThienNghia1_B1,
		[2] = tbThienNghia1_B2,
		[3] = tbThienNghia1_B3,
		[4] = tbThienNghia1_B4,
	}
	
	local tbThienNghia2_B1 = {item = {
			{gdp={0,100,3037,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Th�y Y"},
			{gdp={0,103,3037,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Nguy�t Qu�n"},
			{gdp={0,101,3037,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Ph�ng Trang"},}
	}
	local tbThienNghia2_B2 = {item = {
			{gdp={0,100,3043,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Th�y Y"},
			{gdp={0,103,3043,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Nguy�t Qu�n"},
			{gdp={0,101,3043,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Ph�ng Trang"},}
	}
	local tbThienNghia2_B3 = {item = {
			{gdp={0,100,3049,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Th�y Y"},
			{gdp={0,103,3049,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Nguy�t Qu�n"},
			{gdp={0,101,3049,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Ph�ng Trang"},}
	}
	local tbThienNghia2_B4 = {item = {
			{gdp={0,100,3055,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Th�y Y"},
			{gdp={0,103,3055,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Nguy�t Qu�n"},
			{gdp={0,101,3055,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thi�n Ngh�a-C�u �m Ph�ng Trang"},}
	}
	local tbThienNghiaSet2 = {
		[1] = tbThienNghia2_B1,
		[2] = tbThienNghia2_B2,
		[3] = tbThienNghia2_B3,
		[4] = tbThienNghia2_B4,
	}
	local nVB = GetExtPoint(EXT_VBONUS)
--	nVB = SetBit(nVB,4,1)
--	PayExtPoint(EXT_VBONUS,GetExtPoint(EXT_VBONUS))
--	AddExtPoint(EXT_VBONUS, nVB)
	VNG_SetExtBit(EXT_VBONUS, 4, 1)
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nh�n"
	if nOption == 1 then
		LIB_Award:AwardByBody(tbThienNghiaSet1)
	else
		LIB_Award:AwardByBody(tbThienNghiaSet2)
	end
	LIB_Award:Award(tbNuOaTinhThach)
	gf_WriteLogEx("NHAN THUONG VBONUS","nh�n",1,"Ph�n th��ng c�p 86")
	Talk(1,"",szNpcName.."C�c h� �� nh�n ���c ph�n th��ng VBonus ��ng c�p 86.")
end


function VBonus_NhanThuong93()
	local tbNgocBoi = {item={
			{gdp={0,102,3122,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Ngh�a- Huy�n Th�ch Kim Ng�c"},
			{gdp={0,102,3125,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Ngh�a- Ph� Th�y Ng�c ��i"},
			{gdp={0,102,3128,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Ngh�a- Nguy�t Hoa Th�y B�i"},
			{gdp={0,102,3131,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Ngh�a- C�u �u H�a Gi�i"},
			{gdp={0,102,3134,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Ngh�a- Ng�ng Ng�c Th� Ho�n"},
		},
	}
	local tbThieuLamDao = {item={{gdp={0,3,8894,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-L�u Ly Gi�i �ao"}}}
	local tbThieuLamQuyen = {item={{gdp={0,0,8876,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-L�i �m Nang Th�"}}}
	local tbThieuLamTruong = {item={{gdp={0,8,8910,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Kinh L�i Thi�n Tr��ng"}}}
	local tbDuongMon = {item={{gdp={0,1,8880,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-�m D��ng Xuy�n �nh"}}}
	local tbNgaMyKiem = {item={{gdp={0,2,8887,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-T� H�n �m Ki�m"}}}
	local tbNgaMyDan = {item={{gdp={0,10,8919,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-C�u Ho�n B�i C�m"}}}
	local tbCaiBangQuyen = {item={{gdp={0,0,8877,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Quy L�n H� Th�"}}}
	local tbCaiBangBong = {item={{gdp={0,5,8901,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Tr�n Ng�o C�n"}}}
	local tbVoDangKiem = {item={{gdp={0,2,8888,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Thu�n Phong Ki�m"}}}
	local tbVoDangBut = {item={{gdp={0,9,8915,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Tinh ��u Chuy�n B�t"}}}
	local tbDuongGiaThuong = {item={{gdp={0,6,8904,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Ph� Qu�n Tr�n Th��ng"}}}
	local tbDuongGiaCung = {item={{gdp={0,4,8898,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Truy M�nh Cung"}}}
	local tbNguDocCoSu = {item={{gdp={0,11,8924,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Luy�n H�n Huy�t Tr�o"}}}
	local tbNguDocTaHiep = {item={{gdp={0,7,8907,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Thi�p C�t Huy�t �ao"}}}	
	local tbConLonThienSu = {item={{gdp={0,2,8889,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Ng� Thi�n Phong Ki�m"}}}	
	local tbThuyYenVuTien = {item={{gdp={0,13,8931,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-Linh Lung Chi"}}}
	local tbThuyYenLinhNu = {item={{gdp={0,12,8928,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thi�n Ngh�a-C�u Ti�u S�o"}}}
	local tbVuKhiThienNghia = {
		[2] = tbThieuLamDao,
		[3] = tbThieuLamTruong,
		[4] = tbThieuLamQuyen,
		[6] = tbDuongMon,
		[8] = tbNgaMyKiem,
		[9] = tbNgaMyDan,
		[11] = tbCaiBangQuyen,
		[12] = tbCaiBangBong,
		[14] = tbVoDangKiem,
		[15] = tbVoDangBut,
		[17] = tbDuongGiaThuong,
		[18] = tbDuongGiaCung,
		[20] = tbNguDocTaHiep,
		[21] =tbNguDocCoSu,
		[23] = tbConLonThienSu,
		[25] = tbConLonThienSu,
		[26] = tbConLonThienSu,
		[27] = tbConLonThienSu,
		[29] = tbThuyYenVuTien,
		[30] = tbThuyYenLinhNu,
		[31] = tbDuongMon,
		[32] = tbConLonThienSu,
	}
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbNgocBoi);
	LIB_Award:AwardByRoute(tbVuKhiThienNghia)
	gf_WriteLogEx("NHAN THUONG VBONUS","nh�n",1,"Ph�n th��ng c�p 93")
	Talk(1,"",szNpcName.."C�c h� �� nh�n ���c ph�n th��ng VBonus ��ng c�p 93.")
end
--==nhi�m v� VBonus

--Task nhi�m v� VBonus: TSK_nvVBonus =
	tbVBonus = {	--nType = 1:H�t gi�ng, 2:BNN, 3:TMT, 4:T� Linh, 5:TNC, 6:Th�i h�, 7:C�ng T�, 8:Th�y l�i, 9:Ng�i sao, 10:N� oa, 11:nv S� m�n, 12:LSB, 13:Tr� an, 14:Nh�n m�n quan, 15: B�o v� th�nh tr�, 16:Luy�n ��n
					[1] = {83, 16, 16, 3}, --lev, h�t gi�ng, BNN, TMT
					[2] = {86, 8, 3, 1}, --lev, t� linh, TNC, Th�i h�
					[3] = {89, 3, 1}, --lev, c�ng t�, th�y l�i
					[4] = {91, 16, 100, 3},
					[5] = {96, 3, 3},
					[6] = {98, 1, 1, 3},
					[7] = {99, 1},
					}
					
function nhiemvuVBonus(nType)
	do return 0 end
	
	if CheckVbonus() ~= 1 then
		return 0
	end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)
	if nTaskNhiemVu >= 8 then
		Talk(1, "", "��i hi�p �� nh�n h�t ph�n th��ng c�a VBonus")
		return 0
	end	
	if nTaskNhiemVu == 1 then
		nhiemvu83(nType)
	elseif nTaskNhiemVu == 2 then
		nhiemvu86(nType)
	elseif nTaskNhiemVu == 3 then
		nhiemvu89(nType)
	elseif nTaskNhiemVu == 4 then
		nhiemvu91(nType)
	elseif nTaskNhiemVu == 5 then
		nhiemvu96(nType)
	elseif nTaskNhiemVu == 6 then
		nhiemvu98(nType)
	elseif nTaskNhiemVu == 7 then
		nhiemvu99(nType)
	end
end

function check_nhiemvu(nLevel)
	do return 0 end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)						
	if nLevel == 83 and nTaskNhiemVu == 1 then
		local nHatGiong = VNG_GetTaskPos(TSK_nvVBonus,3,2)
		local nBNN = VNG_GetTaskPos(TSK_nvVBonus,5,4)
		local nTMT = VNG_GetTaskPos(TSK_nvVBonus,6,6)
		if nHatGiong < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B�n ch�a k�ch ho�t �� 16 h�t gi�ng")
			return 0
		end
		if nBNN < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B�n ch�a k�ch ho�t �� 16 c�y b�t nh� nh�")
			return 0
		end
		if nTMT < tbVBonus[nTaskNhiemVu][4] then
			Talk(1, "", szNpcName.."B�n ch�a nh�n th��ng �� 3 l�n Thi�n M�n Tr�n")
			return 0
		end
		return 1
	end
	if nLevel == 86 and nTaskNhiemVu == 2 then
		local nTulinh = VNG_GetTaskPos(TSK_nvVBonus,2,2)
		local nTNC = VNG_GetTaskPos(TSK_nvVBonus,3,3)
		local nThaiHu = VNG_GetTaskPos(TSK_nvVBonus,4,4)
		if nTulinh < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B�n ch�a k�ch ho�t �� 8 c�y T� Linh")
			return 0
		end
		if nTNC < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B�n ch�a ho�n th�nh 3 l�n nhi�m v� T�i Nguy�n Chi�n")
			return 0
		end
		if nThaiHu < tbVBonus[nTaskNhiemVu][4] then
			Talk(1, "", szNpcName.."B�n ch�a ho�n th�nh �i 8 Th�i H� Huy�n c�nh")
			return 0
		end
		return 1	
	end
	if nLevel == 89 and nTaskNhiemVu == 3 then
		local nCungTe = VNG_GetTaskPos(TSK_nvVBonus,2,2)
		local nThuyLoi = VNG_GetTaskPos(TSK_nvVBonus,3,3)	
		if nCungTe < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B�n ch�a ho�n th�nh 3 nhi�m v� C�ng T�")
			return 0
		end
		if nThuyLoi < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B�n ch�a ho�n th�nh nhi�m v� Th�y L�i")
			return 0
		end
		return 1
	end
	if nLevel == 91 and nTaskNhiemVu == 4 then
		local nNgoiSao = VNG_GetTaskPos(TSK_nvVBonus,3,2)
		local nNuOa = VNG_GetTaskPos(TSK_nvVBonus,6,4)
		local nSuMon = VNG_GetTaskPos(TSK_nvVBonus,7,7)	
		if nNgoiSao < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B�n ch�a s� d�ng �� 16 ng�i sao")
			return 0
		end	
		if nNuOa < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B�n ch�a s� d�ng �� 100 n� oa b�o h�p")
			return 0
		end
		if nSuMon < tbVBonus[nTaskNhiemVu][4] then
			Talk(1, "", szNpcName.."B�n ch�a ho�n th�nh �� 3 nhi�m v� s� m�n")
			return 0
		end	
		return 1
	end
	if nLevel == 96 and nTaskNhiemVu == 5 then
		local nLuongSon = VNG_GetTaskPos(TSK_nvVBonus,2,2)
		local nTriAn = VNG_GetTaskPos(TSK_nvVBonus,3,3)	
		if nLuongSon < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B�n ch�a ho�n th�nh 3 nhi�m v� L��ng S�n B�c")
			return 0
		end
		if nTriAn < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B�n ch�a ho�n th�nh 3 nhi�m v� Tr� An")
			return 0
		end
		return 1
	end
	if nLevel == 98 and nTaskNhiemVu == 6 then
--		local nNhanMon = VNG_GetTaskPos(TSK_nvVBonus,2,2)
		local nThanhTri = VNG_GetTaskPos(TSK_nvVBonus,3,3)
		local nTMT = VNG_GetTaskPos(TSK_nvVBonus,4,4)
--		if nNhanMon < tbVBonus[nTaskNhiemVu][2] then
--			Talk(1, "", szNpcName.."B�n ch�a nh�n th��ng Nh�n M�n Quan")
--			return 0
--		end
		if nThanhTri < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B�n ch�a nh�n th��ng B�o V� Th�nh Tr�")
			return 0
		end
		if nTMT < tbVBonus[nTaskNhiemVu][4] then
			Talk(1, "", szNpcName.."B�n ch�a nh�n th��ng 3 l�n Thi�n M�n Tr�n")
			return 0
		end
		return 1
	end
	if nLevel == 99 and nTaskNhiemVu == 7 then
		local nLuyenDon = VNG_GetTaskPos(TSK_nvVBonus,2,2)	
		if nLuyenDon < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B�n ch�a ho�n th�nh 1 l�n Luy�n ��n")
			return 0
		end
		return 1
	end	
	return 0
end
function nhiemvu83(nType)
	do return 0 end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)	--TSK_nvVBonus: dccbba: a:nhi�m v�; bb: h�t gi�ng; cc: BNN; d: TMT
	if nTaskNhiemVu < 1 or nTaskNhiemVu > 1 then
		Talk(1, "", "C� l�i nhi�m v� c�p 83")
		return 0
	end
	local nHatGiong = VNG_GetTaskPos(TSK_nvVBonus,3,2)
	local nBNN = VNG_GetTaskPos(TSK_nvVBonus,5,4)
	local nTMT = VNG_GetTaskPos(TSK_nvVBonus,6,6)
	if nType == 1 and nHatGiong < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nHatGiong + 1,3,2)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: h�t gi�ng")
	end
	if nType == 2 and nBNN < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nBNN + 1,5,4)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: BNN")
	end
	if nType == 3 and nTMT < tbVBonus[nTaskNhiemVu][4] then
		VNG_SetTaskPos(TSK_nvVBonus, nTMT + 1,6,6)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: TMT")
	end
end

function nhiemvu86(nType)
	do return 0 end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)--TSK_nvVBonus: dcba: a:nhi�m v�; b: c�y t� linh; c: TNC; d: Th�i h�
	if nTaskNhiemVu < 2 or nTaskNhiemVu > 2 then
		Talk(1, "", "C� l�i nhi�m v� c�p 86")
		return 0
	end
	local nTulinh = VNG_GetTaskPos(TSK_nvVBonus,2,2)
	local nTNC = VNG_GetTaskPos(TSK_nvVBonus,3,3)
	local nThaiHu = VNG_GetTaskPos(TSK_nvVBonus,4,4)
	if nType == 4 and nTulinh < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nTulinh + 1,2,2)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: c�y t� linh")
	end
	if nType == 5 and nTNC < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nTNC + 1,3,3)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: TNC")
	end
	if nType == 6 and nThaiHu < tbVBonus[nTaskNhiemVu][4] then
		VNG_SetTaskPos(TSK_nvVBonus, nThaiHu + 1,4,4)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: th�i h�")
	end
end

function nhiemvu89(nType)
	do return 0 end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10) --TSK_nvVBonus: cba: a:nhi�m v�; b: c�ng t�; c: Th�y l�i
	if nTaskNhiemVu < 3 or nTaskNhiemVu > 3 then
		Talk(1, "", "C� l�i nhi�m v� c�p 89")
		return 0
	end
	local nCungTe = VNG_GetTaskPos(TSK_nvVBonus,2,2)
	local nThuyLoi = VNG_GetTaskPos(TSK_nvVBonus,3,3)
	if nType == 7 and nCungTe < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nCungTe + 1,2,2)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: c�ng t�")
	end
	if nType == 8 and nThuyLoi < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nThuyLoi + 1,3,3)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: Th�y l�i")
	end
end

function nhiemvu91(nType)
	do return 0 end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10) --TSK_nvVBonus: dcccbba: a:nhi�m v�; bb: ng�i sao; ccc: N� oa; d: s� m�n
	if nTaskNhiemVu < 4 or nTaskNhiemVu > 4 then
		Talk(1, "", "C� l�i nhi�m v� c�p 91")
		return 0
	end
	local nNgoiSao = VNG_GetTaskPos(TSK_nvVBonus,3,2)
	local nNuOa = VNG_GetTaskPos(TSK_nvVBonus,6,4)
	local nSuMon = VNG_GetTaskPos(TSK_nvVBonus,7,7)
	if nType == 9 and nNgoiSao < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nNgoiSao + 1,3,2)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: Ng�i sao")
	end
	if nType == 10 and nNuOa < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nNuOa + 1,6,4)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: N� oa")
	end
	if nType == 11 and nSuMon < tbVBonus[nTaskNhiemVu][4] then
		VNG_SetTaskPos(TSK_nvVBonus, nSuMon + 1,7,7)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: S� m�n")
	end
end

function nhiemvu96(nType)
	do return 0 end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)--TSK_nvVBonus: cba: a:nhi�m v�; b: L��ng S�n; c: Tr� An
	if nTaskNhiemVu < 5 or nTaskNhiemVu > 5 then
		Talk(1, "", "C� l�i nhi�m v� c�p 96")
		return 0
	end
	local nLuongSon = VNG_GetTaskPos(TSK_nvVBonus,2,2)
	local nTriAn = VNG_GetTaskPos(TSK_nvVBonus,3,3)
	if nType == 12 and nLuongSon < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nLuongSon + 1,2,2)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: LSB")
	end
	if nType == 13 and nTriAn < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nTriAn + 1,3,3)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: tr� an")
	end
end

function nhiemvu98(nType)
	do return 0 end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)--TSK_nvVBonus: dcba: a:nhi�m v�; b: Nh�n m�n; c: Th�nh Tr�; d:TMT
	if nTaskNhiemVu < 6 or nTaskNhiemVu > 6 then
		Talk(1, "", "C� l�i nhi�m v� c�p 98")
		return 0
	end
--	local nNhanMon = VNG_GetTaskPos(TSK_nvVBonus,2,2)
	local nThanhTri = VNG_GetTaskPos(TSK_nvVBonus,3,3)
	local nTMT = VNG_GetTaskPos(TSK_nvVBonus,4,4)
--	if nType == 14 and nNhanMon < tbVBonus[nTaskNhiemVu][2] then
--		VNG_SetTaskPos(TSK_nvVBonus, nNhanMon + 1,2,2)
--		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
--		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: Nh�n m�n")
--	end
	if nType == 15 and nThanhTri < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nThanhTri + 1,3,3)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: th�nh tr�")
	end
	if nType == 3 and nTMT < tbVBonus[nTaskNhiemVu][4] then
		VNG_SetTaskPos(TSK_nvVBonus, nTMT + 1,4,4)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: TMT")
	end
end

function nhiemvu99(nType)
	do return 0 end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)--TSK_nvVBonus: ba: a:nhi�m v�; b: Luy�n ��n
	if nTaskNhiemVu < 7 or nTaskNhiemVu > 7 then
		Talk(1, "", "C� l�i nhi�m v� c�p 99")
		return 0
	end
	local nLuyenDon = VNG_GetTaskPos(TSK_nvVBonus,2,2)
	if nType == 16 and nLuyenDon < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nLuyenDon + 1,2,2)
		Msg2Player("Ho�n th�nh 1 l�n nhi�m v� VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","ho�n th�nh",1,"Ho�n th�nh 1 nhi�m v� VBonus: luy�n ��n")
	end
end

function HoTroKCL()
	local tbSay = {}
	local szRole = GetName()
	local nServerID = GetGlbValue(1023)
	local bFound = 0
	local nNum = 0
	for i = 1, getn(accountNhanThuong) do
		if szRole == accountNhanThuong[i][1] then
			bFound = 1
			nNum = i
		end
	end
	
	if bFound == 0 then
		Talk(1,"",szNpcName.."C�c h� kh�ng c� trong danh s�ch h� tr� nh�n th��ng KCL")
		return
	end
	
	if nServerID ~= accountNhanThuong[nNum][3] then
		Talk(1,"",szNpcName.."C�c h� kh�ng c� trong danh s�ch h� tr� nh�n th��ng KCL")
		return
	end
	
	if gf_GetTaskByte(TSK_HOTROKCL,4) == 1 then
		Talk(1,"",szNpcName.."C�c h� �� nh�n th��ng r�i, ��ng tham ch�!")
		return
	end
	
	if gf_Judge_Room_Weight(3,200) ~= 1 then
		Talk(1,"",szNpcName.."H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return
	end
	
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "",szNpcName.."T�nh tr�ng hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
	
	if accountNhanThuong[nNum][2] == 1 then
		ahf_GetEquipByRouteBody(VET_ZHANKUANG_CLOTH);
		gf_WriteLogEx("HoTroKCL","nhan",1,"�o Chi�n cu�ng")
		gf_SetTaskByte(TSK_HOTROKCL,4,1)
		return
	end
	
	if accountNhanThuong[nNum][2] == 2 then
		local tDialog = {}
		
			for i = 1, getn(CK_YAOYANG_JIEZI_2) do
				tinsert(tDialog, format("%s/#NhanDieuDuong(%d)", CK_YAOYANG_JIEZI_2[i][1], i));
			end
			
			tinsert(tDialog, "\nT�i ch� xem xem th�i/nothing");
		Say(CK_NPC_NAME.."H�y ch�n lo�i c�n:", getn(tDialog), tDialog);	
		return
	end
end

function NhanDieuDuong(nIndex)	
	gf_AddItemEx2(CK_YAOYANG_JIEZI_2[nIndex][2], CK_YAOYANG_JIEZI_2[nIndex][1], "CDKEY", "CDKEY", 0, 1)
	gf_SetTaskByte(TSK_HOTROKCL,4,1)
	gf_WriteLogEx("HoTroKCL","nhan",1,"Trang S�c Di�u D��ng")
end

function QuaySoTet()
	local tbSay = {}
	local tbItems = {
		[1] = {"B�n Long B�ch"},
		[2] = {"H�a Th� B�ch"},
		[3] = {"T�i Thi�n Th�ch Tinh Th�ch"},
		[4] = {"Bao Thi�n Th�ch Tinh Th�ch"},
		[5] = {"Kim X� 4 Ng�u nhi�n + 15 ch�a d��ng th�nh"},
		[6] = {"Set Chi�n Cu�ng +15 theo h� ph�i"},
	}	
	for i = 1, getn(tbItems) do
		tinsert(tbSay,format("%s/#QuaySoTet_01(%d)","Ta mu�n nh�n th��ng "..tbItems[i][1],i))
	end
	tinsert(tbSay,"R�i Kh�i/nothing")
	Say(CK_NPC_NAME.."Mau ch�ng nh�n th��ng quay t�t, mau l�n mau l�n!",getn(tbSay),tbSay)
end

function QuaySoTet_01(nIndex)	
	
	local nExt = gf_GetExtPointBit(EXT_QUAYSOTET,nIndex)
	
	if nExt ~= 1 then
		Talk(1,"",szNpcName.."Ph�n th��ng n�y kh�ng ph�i mu�n c� l� ���c, c�c h� �� quay s� ch�a? Th� v�n may �i n�o!")
		return
	end
	
	if gf_Judge_Room_Weight(5,250) ~= 1 then
		Talk(1,"",szNpcName.."H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return
	end
	
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "",szNpcName.."T�nh tr�ng hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
	
	if nIndex == 1 then
		gf_AddItemEx2({2,1,1000,1},"B�n Long B�ch","QuaySoAtMui","Nhan",3600*24*14,1)
		LIB_WriteLog("Promotion_QS_201502",1,"Nh�n 1 B�n Long B�ch","nil","BLB","nil")		
		gf_SetExtPointBit(EXT_QUAYSOTET,1,0)	
	end
	
	if nIndex == 2 then
		gf_AddItemEx2({2,1,1001,1},"H�a Th� B�ch","QuaySoAtMui","Nhan",3600*24*14,1)	
		LIB_WriteLog("Promotion_QS_201502",1,"Nh�n 1 H�a Th� B�ch","nil","HTB","nil")
		gf_SetExtPointBit(EXT_QUAYSOTET,2,0)	
	end
	
	if nIndex == 3 then
		gf_AddItemEx2({2,1,3356,1},"T�i Thi�n Th�ch Tinh Th�ch","QuaySoAtMui","Nhan",3600*24*14,1)	
		LIB_WriteLog("Promotion_QS_201502",1,"Nh�n 1 T�i Thi�n Th�ch Tinh Th�ch","nil","TTTTT","nil")
		gf_SetExtPointBit(EXT_QUAYSOTET,3,0)	
	end
	
	if nIndex == 4 then
		gf_AddItemEx2({2,1,1051,1},"Bao Thi�n Th�ch Tinh Th�ch","QuaySoAtMui","Nhan",3600*24*14,1)
		LIB_WriteLog("Promotion_QS_201502",1,"Nh�n 1 Bao Thi�n Th�ch Tinh Th�ch","nil","BTTTT","nil")		
		gf_SetExtPointBit(EXT_QUAYSOTET,4,0)	
	end
	
	if nIndex == 5 then
		local nRnd = random(1,3)
		
		if nRnd  == 1 then
			TraoKimXa(15,1)
		elseif nRnd == 2 then
			TraoKimXa(15,2)
		elseif nRnd == 3 then
			TraoKimXa(15,3)
		end	
		LIB_WriteLog("Promotion_QS_201502",1,"Nh�n 1 B� Kim X� 4","nil","KimXa4","nil")
		gf_SetExtPointBit(EXT_QUAYSOTET,5,0)	
	end
	
	if nIndex == 6 then
		local nRoute = gf_CheckPlayerRoute()
		if nRoute == 0 then
			Talk(1,"",szNpcName.."C�c h� ch�a ch�n h� ph�i, kh�ng th� nh�n th��ng!")
			return
		end
		TraoChienCuong(15)
		LIB_WriteLog("Promotion_QS_201502",1,"Nh�n 1 Set Chi�n Cu�ng","nil","SetChienCuong","nil")
		gf_SetExtPointBit(EXT_QUAYSOTET,6,0)		
	end
	Talk(1,"",szNpcName.."C�c h� �� nh�n th��ng th�nh c�ng!")
end

function TraoKimXa(nLevel,nType)
	local tbKimXaVanDu = {
		item = {
			{gdp={0,153,28,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Huy Ch��ng V�n Du"},
			{gdp={0,152,28,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="�o Cho�ng V�n Du"},
			{gdp={0,154,28,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="��o H�i V�n Du"},
		}
	}
	
	local tbKimXaThietHuyet = {
		item = {
			{gdp={0,153,27,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Huy Ch��ng Thi�t Huy�t"},
			{gdp={0,152,27,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="�o Cho�ng Thi�t Huy�t"},
			{gdp={0,154,27,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="��o H�i Thi�t Huy�t"},
		}
	}
	
	local tbKimXaDuHiep = {
		item = {
			{gdp={0,153,26,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Huy Ch��ng Du Hi�p"},
			{gdp={0,152,26,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="�o Cho�ng Du Hi�p"},
			{gdp={0,154,26,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="��o H�i Du Hi�p"},
		}
	}	
	
	LIB_Award.szLogTitle = "QuaySoAtMui"
	LIB_Award.szLogAction = "nhan"
	
	if nType  == 1 then
		LIB_Award:Award(tbKimXaVanDu)
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� V�n Du")
	elseif nType == 2 then
		LIB_Award:Award(tbKimXaThietHuyet)
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� Thi�t Huy�t")
	elseif nType == 3 then
		LIB_Award:Award(tbKimXaDuHiep)
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� Du Hi�p")
	end	
	
end

function TraoChienCuong(nLevel)
	local tbTrangBiChienCuong = {
		[100] = {
			[1] = {
				[2] = {item={{gdp={0,100,30143,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n ��a B�o"}}},
				[4] = {item={{gdp={0,100,30145,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ph� T� B�o"}}},
				[3] = {item={{gdp={0,100,30147,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n T�n B�o"}}},
				[6] = {item={{gdp={0,100,30149,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Tuy�t M�nh Y"}}},
				[11] = {item={{gdp={0,100,30157,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�n Du Y"}}},
				[12] = {item={{gdp={0,100,30161,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ti�u Dao Y"}}},
				[14] = {item={{gdp={0,100,30165,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng V� Vi B�o"}}},
				[15] = {item={{gdp={0,100,30169,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C�n Kh�n B�o"}}},
				[17] = {item={{gdp={0,100,30173,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n Tinh  Gi�p"}}},
				[18] = {item={{gdp={0,100,30177,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Xuy�n V�n Gi�p"}}},
				[20] = {item={{gdp={0,100,30181,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Minh T�n Y"}}},
				[21] = {item={{gdp={0,100,30185,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C� T�m Y"}}},
				[23] = {item={{gdp={0,100,30189,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Phong L�i B�o"}}},
				[25] = {item={{gdp={0,100,30191,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng ��i ��a Y"}}},
				[26] = {item={{gdp={0,100,30195,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng T�y M�ng B�o"}}},
				[27] = {item={{gdp={0,100,30199,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ma V�c  B�o"}}},
			},
			[2] = {
				[2] = {item={{gdp={0,100,30144,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n ��a B�o"}}},
				[4] = {item={{gdp={0,100,30146,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ph� T� B�o"}}},
				[3] = {item={{gdp={0,100,30148,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n T�n B�o"}}},
				[6] = {item={{gdp={0,100,30150,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Tuy�t M�nh Y"}}},
				[11] = {item={{gdp={0,100,30158,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�n Du Y"}}},
				[12] = {item={{gdp={0,100,30162,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ti�u Dao Y"}}},
				[14] = {item={{gdp={0,100,30166,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng V� Vi B�o"}}},
				[15] = {item={{gdp={0,100,30170,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C�n Kh�n B�o"}}},
				[17] = {item={{gdp={0,100,30174,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n Tinh  Gi�p"}}},
				[18] = {item={{gdp={0,100,30178,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Xuy�n V�n Gi�p"}}},
				[20] = {item={{gdp={0,100,30182,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Minh T�n Y"}}},
				[21] = {item={{gdp={0,100,30186,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C� T�m Y"}}},
				[23] = {item={{gdp={0,100,30190,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Phong L�i B�o"}}},
				[25] = {item={{gdp={0,100,30192,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng ��i ��a Y"}}},
				[26] = {item={{gdp={0,100,30196,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng T�y M�ng B�o"}}},
				[27] = {item={{gdp={0,100,30200,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ma V�c  B�o"}}},
			},
			[3] = {
				[6] = {item={{gdp={0,100,30151,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Tuy�t M�nh Y"}}},
				[8] = {item={{gdp={0,100,30153,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng B� T�t Y"}}},
				[9] = {item={{gdp={0,100,30155,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng L�u Th�yY"}}},
				[11] = {item={{gdp={0,100,30159,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�n Du Y"}}},
				[12] = {item={{gdp={0,100,30163,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ti�u Dao Y"}}},
				[14] = {item={{gdp={0,100,30167,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng V� Vi B�o"}}},
				[15] = {item={{gdp={0,100,30171,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C�n Kh�n B�o"}}},
				[17] = {item={{gdp={0,100,30175,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n Tinh  Gi�p"}}},
				[18] = {item={{gdp={0,100,30179,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Xuy�n V�n Gi�p"}}},
				[20] = {item={{gdp={0,100,30183,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Minh T�n Y"}}},
				[21] = {item={{gdp={0,100,30187,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C� T�m Y"}}},
				[25] = {item={{gdp={0,100,30193,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng ��i ��a Y"}}},
				[26] = {item={{gdp={0,100,30197,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng T�y M�ng B�o"}}},
				[27] = {item={{gdp={0,100,30201,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ma V�c  B�o"}}},
				[29] = {item={{gdp={0,100,30203,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�nh N�  Y"}}},
				[30] = {item={{gdp={0,100,30205,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�nh Linh Y"}}},
			},
			[4] = {
				[6] = {item={{gdp={0,100,30152,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Tuy�t M�nh Y"}}},
				[8] = {item={{gdp={0,100,30154,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng B� T�t Y"}}},
				[9] = {item={{gdp={0,100,30156,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng L�u Th�yY"}}},
				[11] = {item={{gdp={0,100,30160,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�n Du Y"}}},
				[12] = {item={{gdp={0,100,30164,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ti�u Dao Y"}}},
				[14] = {item={{gdp={0,100,30168,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng V� Vi B�o"}}},
				[15] = {item={{gdp={0,100,30172,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C�n Kh�n B�o"}}},
				[17] = {item={{gdp={0,100,30176,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n Tinh  Gi�p"}}},
				[18] = {item={{gdp={0,100,30180,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Xuy�n V�n Gi�p"}}},
				[20] = {item={{gdp={0,100,30184,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Minh T�n Y"}}},
				[21] = {item={{gdp={0,100,30188,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C� T�m Y"}}},
				[25] = {item={{gdp={0,100,30194,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng ��i ��a Y"}}},
				[26] = {item={{gdp={0,100,30198,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng T�y M�ng B�o"}}},
				[27] = {item={{gdp={0,100,30202,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ma V�c  B�o"}}},
				[29] = {item={{gdp={0,100,30204,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�nh N�  Y"}}},
				[30] = {item={{gdp={0,100,30206,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�nh Linh Y"}}},
			}
		},
		
		[101] = {
			[1] = {
				[2] = {item={{gdp={0,101,30143,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n ��a Trang"}}},
				[4] = {item={{gdp={0,101,30145,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ph� T� Trang"}}},
				[3] = {item={{gdp={0,101,30147,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n T�n Trang"}}},
				[6] = {item={{gdp={0,101,30149,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Tuy�t M�nh Trang"}}},
				[11] = {item={{gdp={0,101,30157,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�n Du Trang"}}},
				[12] = {item={{gdp={0,101,30161,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ti�u Dao Trang"}}},
				[14] = {item={{gdp={0,101,30165,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng V� Vi Trang"}}},
				[15] = {item={{gdp={0,101,30169,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C�n Kh�n Trang"}}},
				[17] = {item={{gdp={0,101,30173,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n Tinh  Trang"}}},
				[18] = {item={{gdp={0,101,30177,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Xuy�n V�n Trang"}}},
				[20] = {item={{gdp={0,101,30181,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Minh T�n Trang"}}},
				[21] = {item={{gdp={0,101,30185,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C� T�m Trang"}}},
				[23] = {item={{gdp={0,101,30189,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Phong L�i Trang"}}},
				[25] = {item={{gdp={0,101,30191,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng ��i ��a Trang"}}},
				[26] = {item={{gdp={0,101,30195,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng T�y M�ng Trang"}}},
				[27] = {item={{gdp={0,101,30199,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ma V�c  Trang"}}},
			},
			[2] = {
				[2] = {item={{gdp={0,101,30144,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n ��a Trang"}}},
				[4] = {item={{gdp={0,101,30146,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ph� T� Trang"}}},
				[3] = {item={{gdp={0,101,30148,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n T�n Trang"}}},
				[6] = {item={{gdp={0,101,30150,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Tuy�t M�nh Trang"}}},
				[11] = {item={{gdp={0,101,30158,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�n Du Trang"}}},
				[12] = {item={{gdp={0,101,30162,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ti�u Dao Trang"}}},
				[14] = {item={{gdp={0,101,30166,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng V� Vi Trang"}}},
				[15] = {item={{gdp={0,101,30170,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C�n Kh�n Trang"}}},
				[17] = {item={{gdp={0,101,30174,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n Tinh  Trang"}}},
				[18] = {item={{gdp={0,101,30178,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Xuy�n V�n Trang"}}},
				[20] = {item={{gdp={0,101,30182,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Minh T�n Trang"}}},
				[21] = {item={{gdp={0,101,30186,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C� T�m Trang"}}},
				[23] = {item={{gdp={0,101,30190,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Phong L�i Trang"}}},
				[25] = {item={{gdp={0,101,30192,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng ��i ��a Trang"}}},
				[26] = {item={{gdp={0,101,30196,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng T�y M�ng Trang"}}},
				[27] = {item={{gdp={0,101,30200,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ma V�c  Trang"}}},
			},
			[3] = {
				[6] = {item={{gdp={0,101,30151,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Tuy�t M�nh Trang"}}},
				[8] = {item={{gdp={0,101,30153,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng B� T�t Kh�"}}},
				[9] = {item={{gdp={0,101,30155,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng L�u Th�yKh�"}}},
				[11] = {item={{gdp={0,101,30159,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�n Du Trang"}}},
				[12] = {item={{gdp={0,101,30163,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ti�u Dao Trang"}}},
				[14] = {item={{gdp={0,101,30167,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng V� Vi Trang"}}},
				[15] = {item={{gdp={0,101,30171,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C�n Kh�n Trang"}}},
				[17] = {item={{gdp={0,101,30175,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n Tinh  Trang"}}},
				[18] = {item={{gdp={0,101,30179,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Xuy�n V�n Trang"}}},
				[20] = {item={{gdp={0,101,30183,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Minh T�n Trang"}}},
				[21] = {item={{gdp={0,101,30187,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C� T�m Trang"}}},
				[25] = {item={{gdp={0,101,30193,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng ��i ��a Trang"}}},
				[26] = {item={{gdp={0,101,30197,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng T�y M�ng Trang"}}},
				[27] = {item={{gdp={0,101,30201,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ma V�c  Trang"}}},
				[29] = {item={{gdp={0,101,30203,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�nh N�  Kh�"}}},
				[30] = {item={{gdp={0,101,30205,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�nh Linh Kh�"}}},
			},
			[4] = {
				[6] = {item={{gdp={0,101,30152,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Tuy�t M�nh Trang"}}},
				[8] = {item={{gdp={0,101,30154,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng B� T�t Kh�"}}},
				[9] = {item={{gdp={0,101,30156,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng L�u Th�yKh�"}}},
				[11] = {item={{gdp={0,101,30160,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�n Du Trang"}}},
				[12] = {item={{gdp={0,101,30164,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ti�u Dao Trang"}}},
				[14] = {item={{gdp={0,101,30168,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng V� Vi Trang"}}},
				[15] = {item={{gdp={0,101,30172,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C�n Kh�n Trang"}}},
				[17] = {item={{gdp={0,101,30176,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n Tinh  Trang"}}},
				[18] = {item={{gdp={0,101,30180,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Xuy�n V�n Trang"}}},
				[20] = {item={{gdp={0,101,30184,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Minh T�n Trang"}}},
				[21] = {item={{gdp={0,101,30188,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C� T�m Trang"}}},
				[25] = {item={{gdp={0,101,30194,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng ��i ��a Trang"}}},
				[26] = {item={{gdp={0,101,30198,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng T�y M�ng Trang"}}},
				[27] = {item={{gdp={0,101,30202,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ma V�c  Trang"}}},
				[29] = {item={{gdp={0,101,30204,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�nh N�  Kh�"}}},
				[30] = {item={{gdp={0,101,30206,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�nh Linh Kh�"}}},
			},
		},
		
		[103] = {
			[1] = {
				[2] = {item={{gdp={0,103,30143,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n ��a M�o"}}},
				[4] = {item={{gdp={0,103,30145,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ph� T� M�o"}}},
				[3] = {item={{gdp={0,103,30147,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n T�n M�o"}}},
				[6] = {item={{gdp={0,103,30149,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Tuy�t M�nh Qu�n"}}},
				[11] = {item={{gdp={0,103,30157,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�n Du C�n"}}},
				[12] = {item={{gdp={0,103,30161,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ti�u Dao C�n"}}},
				[14] = {item={{gdp={0,103,30165,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng V� Vi Qu�n"}}},
				[15] = {item={{gdp={0,103,30169,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C�n Kh�n Qu�n"}}},
				[17] = {item={{gdp={0,103,30173,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n Tinh  Kh�i"}}},
				[18] = {item={{gdp={0,103,30177,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Xuy�n V�n Kh�i"}}},
				[20] = {item={{gdp={0,103,30181,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Minh T�n C�n"}}},
				[21] = {item={{gdp={0,103,30185,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C� T�m C�n"}}},
				[23] = {item={{gdp={0,103,30189,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Phong L�i Qu�n"}}},
				[25] = {item={{gdp={0,103,30191,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng ��i ��a C�n"}}},
				[26] = {item={{gdp={0,103,30195,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng T�y M�ng Qu�n"}}},
				[27] = {item={{gdp={0,103,30199,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ma V�c  Qu�n"}}},
			},
			[2] = {
				[2] = {item={{gdp={0,103,30144,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n ��a M�o"}}},
				[4] = {item={{gdp={0,103,30146,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ph� T� M�o"}}},
				[3] = {item={{gdp={0,103,30148,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n T�n M�o"}}},
				[6] = {item={{gdp={0,103,30150,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Tuy�t M�nh Qu�n"}}},
				[11] = {item={{gdp={0,103,30158,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�n Du C�n"}}},
				[12] = {item={{gdp={0,103,30162,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ti�u Dao C�n"}}},
				[14] = {item={{gdp={0,103,30166,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng V� Vi Qu�n"}}},
				[15] = {item={{gdp={0,103,30170,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C�n Kh�n Qu�n"}}},
				[17] = {item={{gdp={0,103,30174,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n Tinh  Kh�i"}}},
				[18] = {item={{gdp={0,103,30178,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Xuy�n V�n Kh�i"}}},
				[20] = {item={{gdp={0,103,30182,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Minh T�n C�n"}}},
				[21] = {item={{gdp={0,103,30186,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C� T�m C�n"}}},
				[23] = {item={{gdp={0,103,30190,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Phong L�i Qu�n"}}},
				[25] = {item={{gdp={0,103,30192,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng ��i ��a C�n"}}},
				[26] = {item={{gdp={0,103,30196,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng T�y M�ng Qu�n"}}},
				[27] = {item={{gdp={0,103,30200,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ma V�c  Qu�n"}}},
			},
			[3] = {
				[6] = {item={{gdp={0,103,30151,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Tuy�t M�nh Qu�n"}}},
				[8] = {item={{gdp={0,103,30153,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng B� T�t Tr�m"}}},
				[9] = {item={{gdp={0,103,30155,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng L�u Th�y Tr�m"}}},
				[11] = {item={{gdp={0,103,30159,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�n Du C�n"}}},
				[12] = {item={{gdp={0,103,30163,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ti�u Dao C�n"}}},
				[14] = {item={{gdp={0,103,30167,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng V� Vi Qu�n"}}},
				[15] = {item={{gdp={0,103,30171,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C�n Kh�n Qu�n"}}},
				[17] = {item={{gdp={0,103,30175,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n Tinh  Kh�i"}}},
				[18] = {item={{gdp={0,103,30179,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Xuy�n V�n Kh�i"}}},
				[20] = {item={{gdp={0,103,30183,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Minh T�n C�n"}}},
				[21] = {item={{gdp={0,103,30187,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C� T�m C�n"}}},
				[25] = {item={{gdp={0,103,30193,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng ��i ��a C�n"}}},
				[26] = {item={{gdp={0,103,30197,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng T�y M�ng Qu�n"}}},
				[27] = {item={{gdp={0,103,30201,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ma V�c  Qu�n"}}},
				[29] = {item={{gdp={0,103,30203,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�nh N�  Tr�m"}}},
				[30] = {item={{gdp={0,103,30205,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�nh Linh Tr�m"}}},
			},
			[4] = {
				[6] = {item={{gdp={0,103,30152,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Tuy�t M�nh Qu�n"}}},
				[8] = {item={{gdp={0,103,30154,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng B� T�t Tr�m"}}},
				[9] = {item={{gdp={0,103,30156,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng L�u Th�y Tr�m"}}},
				[11] = {item={{gdp={0,103,30160,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�n Du C�n"}}},
				[12] = {item={{gdp={0,103,30164,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ti�u Dao C�n"}}},
				[14] = {item={{gdp={0,103,30168,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng V� Vi Qu�n"}}},
				[15] = {item={{gdp={0,103,30172,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C�n Kh�n Qu�n"}}},
				[17] = {item={{gdp={0,103,30176,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n Tinh  Kh�i"}}},
				[18] = {item={{gdp={0,103,30180,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Xuy�n V�n Kh�i"}}},
				[20] = {item={{gdp={0,103,30184,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Minh T�n C�n"}}},
				[21] = {item={{gdp={0,103,30188,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng C� T�m C�n"}}},
				[25] = {item={{gdp={0,103,30194,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng ��i ��a C�n"}}},
				[26] = {item={{gdp={0,103,30198,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng T�y M�ng Qu�n"}}},
				[27] = {item={{gdp={0,103,30202,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ma V�c  Qu�n"}}},
				[29] = {item={{gdp={0,103,30204,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�nh N�  Tr�m"}}},
				[30] = {item={{gdp={0,103,30206,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�nh Linh Tr�m"}}},
			},
		},
	}

	local tbVuKhiChienCuong = {
		[1] = {
			[2] = {item={{gdp={0,3,30143,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng B�ng Thi�n �ao"}}},
			[3] = {item={{gdp={0,8,30147,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n ��nh Tr��ng"}}},
			[4] = {item={{gdp={0,0,30145,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�nh Chi�n Th�"}}},
			[6] = {item={{gdp={0,1,30149,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng �o�t H�n Ch�m"}}},
			[11] = {item={{gdp={0,0,30157,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Tr�ng �c Th�"}}},
			[12] = {item={{gdp={0,5,30161,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng V� C�c C�n"}}},
			[14] = {item={{gdp={0,2,30165,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Khu Ma Ki�m"}}},
			[15] = {item={{gdp={0,9,30169,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th��ng Khung B�t"}}},
			[17] = {item={{gdp={0,6,30173,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�n K�ch Th��ng"}}},
			[18] = {item={{gdp={0,4,30177,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Xung Thi�n Cung"}}},
			[20] = {item={{gdp={0,7,30181,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Luy�n Ng�c �ao"}}},
			[21] = {item={{gdp={0,11,30185,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Nhi�p H�n Tr�o"}}},
			[23] = {item={{gdp={0,2,30189,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n Ph�t Ki�m"}}},
			[25] = {item={{gdp={0,3,30191,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ch�c Dung �ao"}}},
			[26] = {item={{gdp={0,9,30195,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng T� M�nh B�t"}}},
			[27] = {item={{gdp={0,11,30199,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Truy H�n Tr�o"}}},
		},
		[2] = {
			[2] = {item={{gdp={0,3,30144,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng B�ng Thi�n �ao"}}},
			[3] = {item={{gdp={0,8,30148,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n ��nh Tr��ng"}}},
			[4] = {item={{gdp={0,0,30146,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�nh Chi�n Th�"}}},
			[6] = {item={{gdp={0,1,30150,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng �o�t H�n Ch�m"}}},
			[11] = {item={{gdp={0,0,30158,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Tr�ng �c Th�"}}},
			[12] = {item={{gdp={0,5,30162,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng V� C�c C�n"}}},
			[14] = {item={{gdp={0,2,30166,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Khu Ma Ki�m"}}},
			[15] = {item={{gdp={0,9,30170,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th��ng Khung B�t"}}},
			[17] = {item={{gdp={0,6,30174,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�n K�ch Th��ng"}}},
			[18] = {item={{gdp={0,4,30178,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Xung Thi�n Cung"}}},
			[20] = {item={{gdp={0,7,30182,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Luy�n Ng�c �ao"}}},
			[21] = {item={{gdp={0,11,30186,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Nhi�p H�n Tr�o"}}},
			[23] = {item={{gdp={0,2,30190,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Thi�n Ph�t Ki�m"}}},
			[25] = {item={{gdp={0,3,30192,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ch�c Dung �ao"}}},
			[26] = {item={{gdp={0,9,30196,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng T� M�nh B�t"}}},
			[27] = {item={{gdp={0,11,30200,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Truy H�n Tr�o"}}},

		},
		[3] = {
			[6] = {item={{gdp={0,1,30151,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng �o�t H�n Ch�m"}}},
			[8] = {item={{gdp={0,2,30153,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ph�t Quang Ki�m"}}},
			[9] = {item={{gdp={0,10,30155,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng H� Bang C�m"}}},
			[11] = {item={{gdp={0,0,30159,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Tr�ng �c Th�"}}},
			[12] = {item={{gdp={0,5,30163,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng V� C�c C�n"}}},
			[14] = {item={{gdp={0,2,30167,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Khu Ma Ki�m"}}},
			[15] = {item={{gdp={0,9,30171,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th��ng Khung B�t"}}},
			[17] = {item={{gdp={0,6,30175,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�n K�ch Th��ng"}}},
			[18] = {item={{gdp={0,4,30179,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Xung Thi�n Cung"}}},
			[20] = {item={{gdp={0,7,30183,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Luy�n Ng�c �ao"}}},
			[21] = {item={{gdp={0,11,30187,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Nhi�p H�n Tr�o"}}},
			[25] = {item={{gdp={0,3,30193,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ch�c Dung �ao"}}},
			[26] = {item={{gdp={0,9,30197,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng T� M�nh B�t"}}},
			[27] = {item={{gdp={0,11,30201,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Truy H�n Tr�o"}}},
			[29] = {item={{gdp={0,13,30203,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Phong Linh Phi�n"}}},
			[30] = {item={{gdp={0,12,30205,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Kh�ng Minh ��ch"}}},
		},
		[4] = {
			[6] = {item={{gdp={0,1,30152,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng �o�t H�n Ch�m"}}},
			[8] = {item={{gdp={0,2,30154,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ph�t Quang Ki�m"}}},
			[9] = {item={{gdp={0,10,30156,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng H� Bang C�m"}}},
			[11] = {item={{gdp={0,0,30160,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Tr�ng �c Th�"}}},
			[12] = {item={{gdp={0,5,30164,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng V� C�c C�n"}}},
			[14] = {item={{gdp={0,2,30168,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Khu Ma Ki�m"}}},
			[15] = {item={{gdp={0,9,30172,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th��ng Khung B�t"}}},
			[17] = {item={{gdp={0,6,30176,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Th�n K�ch Th��ng"}}},
			[18] = {item={{gdp={0,4,30180,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Xung Thi�n Cung"}}},
			[20] = {item={{gdp={0,7,30184,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Luy�n Ng�c �ao"}}},
			[21] = {item={{gdp={0,11,30188,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Nhi�p H�n Tr�o"}}},
			[25] = {item={{gdp={0,3,30194,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Ch�c Dung �ao"}}},
			[26] = {item={{gdp={0,9,30198,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng T� M�nh B�t"}}},
			[27] = {item={{gdp={0,11,30202,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Truy H�n Tr�o"}}},
			[29] = {item={{gdp={0,13,30204,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Phong Linh Phi�n"}}},
			[30] = {item={{gdp={0,12,30206,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Chi�n Cu�ng Kh�ng Minh ��ch"}}},
		},
	}
	
	local nBody = GetBody()

	LIB_Award.szLogTitle = "QuaySoAtMui"
	LIB_Award.szLogAction = "nhan"
	LIB_Award:AwardByRoute(tbTrangBiChienCuong[103][nBody])
	LIB_Award:AwardByRoute(tbTrangBiChienCuong[100][nBody])
	LIB_Award:AwardByRoute(tbTrangBiChienCuong[101][nBody])
	LIB_Award:AwardByRoute(tbVuKhiChienCuong[nBody])
end

function get_QuanCong_HoTro()
	local nDate = tonumber(date("%Y%m%d"))
 	if nDate > 20200115 then	
 		return 0
 	end
 	local nExt_Support = GetExtPoint(EXT_SURVEY2016)
 	if nExt_Support < 341 then
 		PayExtPoint(EXT_SURVEY2016, GetExtPoint(EXT_SURVEY2016))
 	end
	if nExt_Support >= 341 then
		Talk(1, "", szNpcName.."��i hi�p �� nh�n h� tr� r�i")
		return 0
	end	
	local nAcc = GetAccount()
	local nRole = GetName()
	local nQuanCong = abs(GetTask(701))	
	if nQuanCong >= tbQuanCongTP[1][3] then
		Talk(1, "", "Qu�n c�ng c�a b�n qu� nhi�u r�i")
		return 0
	end
--	SetTask(TSK_DENBU_TIENPHUNG,1)
	gf_WriteLogEx("Ho tro QC 2019", "NhanThuong", 1, "Nhan ho tro nam 2019");

	for i = 1, getn(tbQuanCongTP) do	
		if nAcc == tbQuanCongTP[i][1] then		--and nRole == tbQuanCongTP[i][2] 
--			SetLevel(97,0)
--			ModifyExp(tbQuanCongTP[i][5])
--				if nAcc == "cuto1hd2" then
--					CancelBoxPassword()		
--				end
			--============
--			SetTask(704, 5)
			--============
			if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + tbQuanCongTP[i][5])
				Talk(1, "", "Ch�c m�ng b�n �� nh�n h� tr� qu�n c�ng th�nh c�ng")
			else
				SetTask(701, GetTask(701) - tbQuanCongTP[i][5])
				Talk(1, "", "Ch�c m�ng b�n �� nh�n h� tr� qu�n c�ng th�nh c�ng")
			end
			--===========
			AddExtPoint(EXT_SURVEY2016, 341)
			Talk(1, "", szNpcName.."��i hi�p nh�n h� tr� VIP th�nh c�ng.")
			--===========
			break
		end
	end	
end
function get_SuMon_HoTro()
	local nAcc = GetAccount()
	local nRole = GetName()
	local nSuMon = abs(GetTask(336))	
	if nSuMon >= tbSuMon[1][3] then
		Talk(1, "", "�i�m S� m�n c�a b�n qu� nhi�u r�i")
		return 0
	end
	for i = 1, getn(tbSuMon) do	
		if nAcc == tbSuMon[i][1] and nRole == tbSuMon[i][2] then	
			if GetTask(336) >= 0 then
				SetTask(336, GetTask(336) + tbSuMon[i][3])
				Talk(1, "", "Ch�c m�ng b�n �� nh�n h� tr� �i�m s� m�n th�nh c�ng")
			end
			break
		end
	end	
end
--================
function LIB_WriteLog(szevent_name, szaction, szaction_Detail, Item_Used,Item_Get, Item_Give)
-- 	local nDate = tonumber(date("%Y%m%d"))
	local szevent_name = szevent_name or ""	
	local szaction = szaction or ""
 	local nAccount = GetAccount() or ""
 	local nRole = GetName() or ""
 	local nChuyenSinh = gf_GetPlayerRebornCount() or ""	
 	local nLevel = GetLevel() or ""
 	local nRoute = GetPlayerRoute() or ""
 	local szaction_Detail = szaction_Detail or ""
 	local Item_Used = Item_Used or ""
 	local Item_Get = Item_Get or ""
 	local Item_Give = Item_Give or ""
 	if szaction == 1 then		--1:Buy	;	2:Used	;	3:Exchange	;	4:Fight
 		szaction = "Buy"
 	elseif szaction == 2 then
 		szaction = "Used"
 	elseif szaction == 3 then
 		szaction = "Exchange"
 	elseif szaction == 4 then	
 		szaction = "Fight"
 	end
 	
 	local strString = szevent_name.."\t"..nAccount.."\t"..nRole.."\t"..nChuyenSinh.."\t"..nLevel.."\t"..nRoute.."\t"..szaction.."\t"..szaction_Detail.."\t"..Item_Used.."\t"..Item_Get.."\t"..Item_Give
 	WriteLog(strString)
 end
 function get_award_mattich20_codeVIP(nType)
 	do return 0 end
 	
	local tbMatTich = {
		[2] = {0,107,204, 2,"Kim Cang B�t Nh� Ch�n Quy�n"},
		[4] = {0,107,205, 1,"Ti�m Long T�c Di�t Ch�n Quy�n"},
		[3] = {0,107,206, 1,"V� Tr�n B� �� Ch�n Quy�n"},
		[6] = {0,107,207, 2,"Thi�n La Li�n Ch�u Ch�n Quy�n"},
		[8] = {0,107,208, 1,"Nh� � Kim ��nh Ch�n Quy�n"},
		[9] = {0,107,209, 1,"B�ch H�i Tuy�t �m Ch�n Quy�n"},
		[11] = {0,107,210, 2,"H�n ��n Tr�n Nh�c Ch�n Quy�n"},
		[12] = {0,107,211, 2,"Qu� Thi�n Du Long Ch�n Quy�n"},
		[14] = {0,107,212, 1,"Huy�n �nh M� T�ng Ch�n Quy�n"},
		[15] = {0,107,213, 2,"Qu�n T� ��i Phong Ch�n Quy�n"},
		[17] = {0,107,214, 2,"Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
		[18] = {0,107,215, 2,"Xuy�n V�n L�c H�ng Ch�n Quy�n"},
		[20] = {0,107,216, 2,"Huy�n Minh Phong Ma Ch�n Quy�n"},
		[21] = {0,107,217, 1,"Linh C� Huy�n T� Ch�n Quy�n"},
		[23] = {0,107,218,1,"C�u Thi�n Phong L�i Ch�n Quy�n"},
		[25] = {0,107,219,1,"Minh gi�o th�nh chi�n Ch�n Quy�n"},
		[26] = {0,107,220,1,"Minh gi�o tr�n binh Ch�n Quy�n"},
		[27] = {0,107,221,1,"Minh gi�o huy�t nh�n Ch�n Quy�n"},
		[29] = {0,107,222,2,"H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[30] = {0,107,223,2,"Phong Hoa Thi�n Di�p Ch�n Quy�n"},
		[31] = {0,107,231,2,"M� Tung Ch�n Quy�n"},
		[32] = {0,107,235,2,"Thi�n Phong Ch�n Quy�n"},
	}
	
	local nDate = tonumber(date("%Y%m%d"))
 	if nDate > 20161225 then	
 		return 0
 	end		
	if gf_Judge_Room_Weight(6, 100," ") ~= 1 then
       	return 0
	end	
	
	local nAcc = GetAccount()
	local nCheck = 0
	for i = 1, getn(tbDsVIPCode) do
		if nAcc == tbDsVIPCode[i] then	 
			nCheck = 1				
			break
		end
	end
	if nCheck == 0 then
		Talk(1, "", "��i hi�p kh�ng c� trong danh s�ch nh�n th��ng.")
		return 0
	end
	local nCheckAward = GetExtPoint(EXT_SURVEY2016)
-- 	if nCheckAward < 30 then
-- 		PayExtPoint(EXT_SURVEY2016, GetExtPoint(EXT_SURVEY2016))
-- 	end
	if nCheckAward >= 30 then
		Talk(1, "", "��i hi�p �� nh�n th��ng r�i.")
		return 0
	end	
	AddExtPoint(EXT_SURVEY2016, 30)
--	VNG_SetExtBit(EXT_BIGPRO_PG1, 12, 1)

	-- if nAcc == "acchuaxu2000" then --4 acc nh�n th��ng b�c th�m vdth + c� m�t t�ch
			-- gf_AddItemEx2({2,1,30944,1},"L�nh b�i h�o hi�p","NHAN THUONG VDTH 122016","nh�n")
			-- gf_AddItemEx2({2,1,30945,1},"L�nh b�i h�o hi�p","NHAN THUONG VDTH 122016","nh�n")
			-- gf_AddItemEx2({2,1,30946,1},"L�nh b�i h�o hi�p","NHAN THUONG VDTH 122016","nh�n")
			-- gf_AddItemEx2({2,1,30973,1},"L�nh b�i h�o hi�p","NHAN THUONG VDTH 122016","nh�n")
	-- elseif nAcc == "chungainhung1" then 
			-- gf_AddItemEx2({0,152,30,1,1,-1,-1,-1,-1,-1,-1,-1,13},"Qu� ph�","NHAN THUONG VDTH 122016","nh�n")
			-- gf_AddItemEx2({0,153,30,1,1,-1,-1,-1,-1,-1,-1,-1,13},"Qu� ph�","NHAN THUONG VDTH 122016","nh�n")
			-- gf_AddItemEx2({0,154,30,1,1,-1,-1,-1,-1,-1,-1,-1,13},"Qu� ph�","NHAN THUONG VDTH 122016","nh�n")
	-- elseif nAcc == "chibay939" or nAcc == "s2luckytai" then 
			-- gf_AddItemEx2({2,1,30911,3},"Tam D��ng","NHAN THUONG VDTH 122016","nh�n")
	-- end
	-- if nAcc == "fernet106cz" then --th�c hi�n reset pass r��ng cho kh theo request c�a pg
		-- CancelBoxPassword()
	-- end
	local _, nItemID = AddItem(tbMatTich[nType][1], tbMatTich[nType][2], tbMatTich[nType][3], 1)
	if tbMatTich[nType][4] == 1 then
		SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
	else
		SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
	end
	gf_WriteLogEx("BIG PROMOTION 12/2016", "Nh�n ph�n th��ng", 1, "Nh�n th��ng lo�i VIP ");		
 end
 function award_promotion(nType)
 	local tBigPro = {
 					[1] = {
							{1, "Kinh nghi�m", 100000000},
 							{2, "B�n Long B�ch", {2, 1, 1000, 1,4}, 7 * 24 * 3600},
 							{2, "C� Linh Ng�c", {2, 1, 30369, 40,4}, 0},
 							{2, "C� Linh Th�ch", {2, 1, 30368, 100,4}, 0},
 							{2, "M�nh Thi�n M�n", {2, 1, 30410, 25, 4}, 0}, 						
 							{2, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1, 4}, 7 * 24 * 3600}, 	
 							{2, "Huy Ch��ng Anh H�ng", {2, 1, 30499, 50, 4}, 0}, 	
 							{2, "T�i H�t Gi�ng", {2, 1, 30087, 1, 4}, 0}, 	
 							{2, "B�t Nh� L�n", {2, 0, 398, 3, 4}, 0}, 	
 							{2, "Thi�n Ki�u L�nh", {2, 97, 236, 2, 4}, 0}, 	
 						},
 					[2] = {
 							{2, "T�y T�m Th�ch c�p 3", {2, 1, 30523, 2, 4}, 0}, 	
 							{2, "Luy�n L� Thi�t c�p 3", {2, 1, 30529, 2, 4}, 0}, 	
 							{2, "B�ng Tinh Th�ch", {2, 1, 30554, 4, 4}, 0}, 	
 							{2, "B�t Nh� Nh�", {2, 0, 504, 2, 4}, 0}, 	
 							{2, "B�t Nh� L�n", {2, 0, 398, 2, 4}, 0}, 	
 							{2, "Thi�n Ki�u L�nh", {2, 97, 236, 2, 4}, 0}, 	
 						},
-- 					[1] = {--Ch��ng tr�nh Change Pass
--							{1, 3000, "R��ng C�u Hoa Ng�c L� Ho�n", {2, 1, 30824, 1}},
-- 							{1, 2500, "R��ng �i�n Th�t Sa ��m Ho�n", {2, 1, 30823, 1}},
-- 							{1, 3000, "R��ng Nh�n S�m D��ng Vinh Ho�n", {2, 1, 30822, 1}},
-- 							{1, 500, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}},
-- 							{1, 1000, "Thi�n Ki�u L�nh (kh�a)", {2, 97, 236, 1, 4}},
-- 						},
-- 					[2] = {--Ch��ng tr�nh VL Plus
-- 							{2, 2500, 1000000, 1},	
-- 							{2, 2000, 5000000, 1},	
-- 							{2, 1500, 10000000, 1},	
-- 							{1, 2500, "Th� c��i Kim Mao Ng�u", {0, 105, 30006, 1,1,-1,-1,-1,-1,-1,-1,-1}, 7 * 24 * 3600},
-- 							{1, 2000, "V� Ti�u Y B�c", {2, 1, 30492, 1}},
--							{1, 2000, "B�n Long B�ch", {2, 1, 1000, 1}, 7 * 24 * 3600},
-- 							{1, 2000, "Thi�n Ki�u L�nh (kh�a)", {2, 97, 236, 1, 4}},
-- 							{1, 2000, "C�y B�t Nh� L�n", {2, 0, 398, 1}},
-- 						},
 				}
 	--Bit 3: nh�n th��ng ingame H� tr� passport
	--Bit 4: nh�n th��ng ingame VL Plus		

	local nchecklevel = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()	
	if nType == 1 then
		if nchecklevel < 697 then
			Talk(1, "", "C�c h� ch�a ��t chuy�n sinh 6, c�p 97, n�n kh�ng th� nh�n th��ng")
			return 0
		end				
	end
	if gf_Judge_Room_Weight(10, 300," ") ~= 1 then
        	return 0
    end	
	local nCheckAward = gf_GetExtPointBit(EXT_BIGPRO_PG1,nType+2)	
	local nCheckActive = gf_GetExtPointBit(EXT_BIGPRO_PG1,nType)	
	if nCheckActive == 0 then
		Talk(1, "", "B�n ch�a nh�p code n�n kh�ng th� nh�n th��ng.")
		return 0
	end
	if nCheckAward == 1 then
		Talk(1, "", "B�n �� nh�n th��ng r�i.")
		return 0
	end
	VNG_SetExtBit(EXT_BIGPRO_PG1, nType+2, 1)
	for i = 1, getn(tBigPro[nType]) do
		if tBigPro[nType][i][1] == 1 then
			ModifyExp(tBigPro[nType][i][3])
		else
			gf_AddItemEx2(tBigPro[nType][i][3], tBigPro[nType][i][2],"BIG PROMOTION 12/2015 BK", "Nh�n ph�n th��ng", tBigPro[nType][i][4])
		end
	end
--	gf_EventGiveRandAward(tBigPro[nType], gf_SumRandBase(tBigPro[nType]), 1, "BIG PROMOTION 7/2015 BK", "Nh�n th��ng th�nh c�ng");
	gf_WriteLogEx("BIG PROMOTION 12/2015", "Nh�n ph�n th��ng", 1, "Nh�n th��ng lo�i "..nType);		
 end
 function award_BHTA15()
 local VET_HOAPHUNG_CLOTH = {
	[4] = {
		[1] = {{0, 100, 30315, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30443, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 100, 30316, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30444, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
}

local VET_HOAPHUNG_CAP = {
	[4] = {
		[1] = {{0, 103, 30315, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 103, 30443, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 103, 30316, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 103, 30444, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
}  

local VET_HOAPHUNG_SHOE = {
	[4] = {
		[1] = {{0, 101, 30315, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 101, 30443, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 101, 30316, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 101, 30444, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
}

local VET_HOAPHUNG_PHU = {
	[4] = {
		[1] = {{0, 102, 30360, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30808, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 102, 30361, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30809, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
}

local VET_HOAPHUNG_KY = {
	[4] = {
		[1] = {{0, 102, 30296, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30744, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 102, 30297, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30745, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
}

local VET_HOAPHUNG_BAI = {
	[4] = {
		[1] = {{0, 102, 30232, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30680, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 102, 30233, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30681, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
}

	local nDate = tonumber(date("%Y%m%d"))
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nCheck = check_gamer_inlist()
	local nAcc = GetAccount()
--	if nRoute ~= 9 then
--		Talk(1, "", "H� ph�i c�a ��i hi�p kh�ng c� trong danh s�ch nh�n th��ng.")
--		return 0
--	end

	if nCheck == 0 then
		Talk(1, "", "��i hi�p kh�ng c� trong danh s�ch nh�n th��ng.")
		return 0
	end

	if GetTask(TSK_TRAOTHUONG_BHTA15) >= 1 then
 		Talk(1, "", "��i hi�p �� nh�n th��ng Bang H�i Tinh Anh 16 r�i.")
 		return 0		
 	end
 	if gf_Judge_Room_Weight(7, 100," ") ~= 1 then
        	return 0
	end	
	-- SetTask(TSK_TRAOTHUONG_BHTA15,1)
	-- gf_WriteLogEx("NHAN THUONG BHTA16", "nh�n th�nh c�ng", 1, "ph�n th��ng")
	-- Talk(1, "", "Ch�c m�ng ��i hi�p nh�n th��ng th�nh c�ng gi�i th��ng Bang H�i Tinh Anh 16.")	
	-- local nQuanHam = GetTask(704)
	-- if nAcc == "tlq222" then
		-- if nQuanHam < 0 then	
			-- gf_AddItemEx2(VET_HOAPHUNG_CLOTH[nRoute][nBody][2], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA14 ", "Nh�n trang b� h�a ph�ng", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_CAP[nRoute][nBody][2], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA14 ", "Nh�n trang b� h�a ph�ng", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_SHOE[nRoute][nBody][2], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA14 ", "Nh�n trang b� h�a ph�ng", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_PHU[nRoute][nBody][2], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA14 ", "Nh�n trang b� h�a ph�ng", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_KY[nRoute][nBody][2], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA14 ", "Nh�n trang b� h�a ph�ng", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_BAI[nRoute][nBody][2], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA14 ", "Nh�n trang b� h�a ph�ng", 0, 1);
	 	-- else
	 		-- gf_AddItemEx2(VET_HOAPHUNG_CLOTH[nRoute][nBody][1], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA14 ", "Nh�n trang b� h�a ph�ng", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_CAP[nRoute][nBody][1], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA14 ", "Nh�n trang b� h�a ph�ng", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_SHOE[nRoute][nBody][1], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA14 ", "Nh�n trang b� h�a ph�ng", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_PHU[nRoute][nBody][1], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA14 ", "Nh�n trang b� h�a ph�ng", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_KY[nRoute][nBody][1], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA14 ", "Nh�n trang b� h�a ph�ng", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_BAI[nRoute][nBody][1], "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA14 ", "Nh�n trang b� h�a ph�ng", 0, 1);
	 	-- end
	 -- end
	 -- if nAcc == "thienthanh12cute" then
	 	-- gf_AddItemEx2({0, 103, 30315, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA16 ", "Nh�n trang b� h�a ph�ng", 0, 1);
		-- gf_AddItemEx2({0, 102, 30232, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA16 ", "Nh�n trang b� h�a ph�ng", 0, 1);
	 -- end
	  -- if nAcc == "s2luckytai" then
	 	-- gf_AddItemEx2({0, 102, 30305, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA16 ", "Nh�n trang b� h�a ph�ng", 0, 1);
		-- gf_AddItemEx2({0, 102, 30369, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA16 ", "Nh�n trang b� h�a ph�ng", 0, 1);
	 -- end
	  -- if nAcc == "vitxinh180592" then
		-- gf_AddItemEx2({0, 100, 30450, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA16 ", "Nh�n trang b� h�a ph�ng", 0, 1);
		-- gf_AddItemEx2({0, 101, 30450, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "B� Trang b� H�a Ph�ng T��ng Qu�n", "NHAN THUONG BHTA16 ", "Nh�n trang b� h�a ph�ng", 0, 1);
	 -- end
 end
 
 function award_vdth()
 	if GetTask(TSK_VANGDANHTHIENHA_DUATOP) >= 1 then
 		Talk(1, "", "��i hi�p �� nh�n th��ng r�i.")
 		return 0		
 	end
 	if gf_Judge_Room_Weight(18, 300, strNpcName) == 0 then
		Talk(1,"", "H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang.")
		return
	end
 	SetTask(TSK_VANGDANHTHIENHA_DUATOP,1)
 	AddTrangBiHoaPhungTuongQuan(0,0)
	TraoMatTichCaoCap20(7)
	local tbAward = {item={{gdp={0,105,160,1,4,-1,-1,-1,-1,-1,-1,-1,0}}}}
	LIB_Award:Award(tbAward)
	Talk(1, "", "Ch�c m�ng ��i hi�p nh�n th��ng �ua top Vang Danh Thi�n H�.")
	gf_WriteLogEx("NHAN THUONG LAI DUA TOP DUY HO", "nh�n th�nh c�ng", 1, "ph�n th��ng")
 end
 
 function check_gamer_inlist()
 	tbgamerinlist = {--acc, role, server
			-- {"tlq222","AcEzWooAiNiK52",16},
			-- {"thienthanh12cute","BKViizHaiCongTu",08},
			-- {"s2luckytai","BKViizSayGoodBye",08},
			-- {"vitxinh180592","BKVzBuffHau",08},
		}
	local nServerID = GetGlbValue(1023)
	local nAcc = GetAccount()
	local nRole = GetName()	
	for i = 1, getn(tbgamerinlist) do	
		if nAcc == tbgamerinlist[i][1] and nRole == tbgamerinlist[i][2] and nServerID == tbgamerinlist[i][3] then	 
			return 1
		end
	end
	return 0
 end
 function get_item_support(nType) 					
 	local nDate = tonumber(date("%Y%m%d"))
	local nAcc = GetAccount()
	local nRole = GetName()
	local nRoute = gf_CheckPlayerRoute()
	local nServerID = GetGlbValue(1023)
	local nQuanCong = abs(GetTask(701))
	local otrong = 0
	local nCheck = 0
 	if nDate > 20200416 then	
 		return 0
 	end
 	local nExt_Support = GetExtPoint(EXT_SURVEY2016)
 	if nExt_Support < 345 then
 		PayExtPoint(EXT_SURVEY2016, GetExtPoint(EXT_SURVEY2016))
 	end
	
-- 	local nExtPoint = GetExtPoint(EXT_CDKEY)
--	if GetBit(nExtPoint,9) ~= 1 and GetBit(nExtPoint,8) ~= 1 then			
--		Talk(1, "", szNpcName.."��i hi�p ch�a k�ch ho�t Minh Gi�o L�nh.")
--		return 0
--	end	

 	if nExt_Support >= 345 then
		Talk(1, "", szNpcName.."��i hi�p �� nh�n h� tr� r�i")
		return 0
	end	
--	if nAcc == "thanhlonglenh888" then
--		otrong = 4
--	end
	if gf_Judge_Room_Weight(otrong,100) ~= 1 then
			Talk(1,"",szNpcName.."H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
			return
	end
	
--	if nRoute == 0 then
--		Talk(1, "", "��i hi�p ch�a gia nh�p m�n ph�i n�o, n�n kh�ng th� nh�n th��ng ���c.")
--		return 0
--	end 
	
	for i = 1, getn(tbds_nhiemvu) do
		if tbds_nhiemvu[i][1] ==  nAcc and tbds_nhiemvu[i][3] == nServerID then	--and tbds_nhiemvu[i][2] ==  nRole
			nCheck = 1
			break
		end
	end	
	if nCheck ~= 1 then
		Talk(1,"",szNpcName.."��i hi�p kh�ng c� trong danh s�ch nh�n h� tr�.")
		return 0
	end

	if nCheck == 1 then		
			
		-- if nAcc == "jx2cbbvip2018" then 
			-- SetTask(704, 6)		--qu�n h�m So�i T�ng
			
			-- AddExtPoint(EXT_SURVEY2016, 345)
			-- Talk(1, "", szNpcName.."��i hi�p nh�n h� tr� VIP th�nh c�ng.")
			-- gf_WriteLogEx("HO TRO NV", "nh�n h� tr� VIP", 1, "nhan ho tro vip")			
		-- end	
		
	end	
--SetSelfLiveness(9915)	--�i�m t�ch c�c c� nh�n
-- gf_AddItemEx2({0,154,33,1,4,-1,-1,-1,-1,-1,-1,-1}, "Ho tro VIP", "HO TRO NV ", "H� tr� VIP")		
--			AddTitle(28, 2) -- danh hi�u cs5	
--			ClearItemInPos()
--GiveJue()--yeu quyet theo he phai
--			thangcapnhanthuong_695_HT()	
--			SetTask(704, 6)		--qu�n h�m So�i T�ng
--			gf_Modify("JunGong",7000000)	--�i�m qu�n c�ng	
--			gf_Modify("ShiMen",11000)	--�i�m s� m�n
--			gf_Modify("Rep",2000)	--�i�m danh v�ng
--			SetTask(652,0) --�i�m t� quang c�c
--			CancelBoxPassword()
--			gf_AddItemEx2({0,153,31,1,4,-1,-1,-1,-1,-1,-1,-1}, "Ho tro bi hack", "HO TRO NV ", "H� tr� b� hack")
--			gf_AddItemEx2({2,1,31117,1,4}, "Ho tro nhiem vu", "HO TRO NV", "H� tr� nhi�m v�")
--			MeridianUpdateLevel()
--		if nAcc == "mapthulu9193" or nAcc == "nhacca144" then	
--			for i=1,4 do	--�� qu� level3
--				gf_AddItemEx2({2,22,i*100+3, 6}, "�� qu� 3 h� ph�i", "HO TRO NV" , "nh�n")
--			end
--			for i=1,4 do	--�� qu� level4
--				gf_AddItemEx2({2,22,i*100+4, 6}, "�� qu� 4 h� ph�i", "HO TRO NV" , "nh�n")
--			end
--			for i=1,4 do	--�� qu� level5
--				gf_AddItemEx2({2,22,i*100+5, 4}, "�� qu� 5 h� ph�i", "HO TRO NV" , "nh�n")
--			end
--			for i=1,4 do	--�� qu� level6
--				gf_AddItemEx2({2,22,i*100+6, 1}, "�� qu� 6 h� ph�i", "HO TRO NV" , "nh�n")
--			end
--			gf_AddItemEx2({2,1,30912,2400,4},"Hi�p Ngh�a Chi Ch�ng","HO TRO NV","Hi�p Ngh�a Chi Ch�ng")
--			
--			AddExtPoint(EXT_SURVEY2016, 58)
--			Talk(1, "", szNpcName.."��i hi�p nh�n h� tr� VIP th�nh c�ng.")
--		end	
	
 end
 function chohuong_chuyensinh_VIP()
		local tRoute = {"Long T�", "H� T�", "�ng T�", "Ph�ng T�"}
		local szTitle = format("B�n s� t�ng l�n chuy�n sinh 8, m�i b�n ch�n m�n h�i mu�n ra nh�p.")
    		local tbSay = {}
		for i=1,getn(tRoute) do
			tinsert(tbSay, format("%s/#hotro_chuyensinh_VIP(%d, %d, %d)", tRoute[i], 8, 10, i))
		end
		tinsert(tbSay,"Ta ch� gh� qua/nothing")
		Say(szTitle,getn(tbSay),tbSay)		
end

function hotro_chuyensinh_VIP(nTransLife, nLevel, nType)
	AddExtPoint(EXT_SURVEY2016, 100)
	local nTransVn = nTransLife
	local nTransKs = 0
	if nTransVn > 5 then
		nTransKs = nTransVn - 5
		nTransVn = 5
	end
	local tb_translife_seal_cs6 = {
							{"Long T� �n",{2,0,30002,1,1}, "Long T�"},
							{"H� T� �n",{2,0,30003,1,1}, "H� T�"},
							{"�ng T� �n",{2,0,30006,1,1}, "�ng T�"},
							{"Ph�ng T� �n",{2,0,30005,1,1}, "Ph�ng T�"},							
					}
	local tb_translife_cloth_PS = {
										[1] = {
													{"Chuy�n Sinh Trang", {0,108,30005,1,4,5,639,6,102}}, 
													{"Chuy�n Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													{"Chuy�n Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},		
										[2] = {
													{"Chuy�n Sinh Trang", {0,108,30005,1,4,6,302,6,102}}, 
													{"Chuy�n Sinh Trang", {0,109,30005,1,4,5,409,6,102}}, 
													{"Chuy�n Sinh Trang", {0,110,30005,1,4,5,79,5,80,6,102}},
											},
										[3] = {
													 {"Chuy�n Sinh Trang", {0,108,30005,1,4,2,13075,6,102}}, 
													 {"Chuy�n Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"Chuy�n Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},	
										[4] = {
													 {"Chuy�n Sinh Trang", {0,108,30005,1,4,5,27,6,102}}, 
													 {"Chuy�n Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"Chuy�n Sinh Trang", {0,110,30005,1,4,4,292,4,293,6,102}},
											},
									}
	tb_translife_cloth_cs7_nhanlai = {
			[1] = {
					[1] = {{0,108,30029,1,4,7,639,3,371,7,102}, {0,109,30029,1,4,5,342,7,102}, {0,110,30029,1,4,4,282,7,250,7,102}},
					[2] = {{0,108,30030,1,4,7,639,3,371,7,102}, {0,109,30030,1,4,5,342,7,102}, {0,110,30030,1,4,4,282,7,250,7,102}},
					[3] = {{0,108,30031,1,4,7,639,3,371,7,102}, {0,109,30031,1,4,5,342,7,102}, {0,110,30031,1,4,4,282,7,250,7,102}},
					[4] = {{0,108,30032,1,4,7,639,3,371,7,102}, {0,109,30032,1,4,5,342,7,102}, {0,110,30032,1,4,4,282,7,250,7,102}},
					[5] = {{0,108,30029,1,4}, {0,109,30029,1,4}, {0,110,30029,1,4}},
					[6] = {{0,108,30030,1,4}, {0,109,30030,1,4}, {0,110,30030,1,4}},
					[7] = {{0,108,30031,1,4}, {0,109,30031,1,4}, {0,110,30031,1,4}},
					[8] = {{0,108,30032,1,4}, {0,109,30032,1,4}, {0,110,30032,1,4}},					
				},	
			[4] = {
					[1] = {{0,108,30029,1,4,7,27,7,102}, {0,109,30029,1,4,5,342,4,409,7,102}, {0,110,30029,1,4,5,292,5,293,7,102}},
					[2] = {{0,108,30030,1,4,7,27,7,102}, {0,109,30030,1,4,5,342,4,409,7,102}, {0,110,30030,1,4,5,292,5,293,7,102}},
					[3] = {{0,108,30031,1,4,7,27,7,102}, {0,109,30031,1,4,5,342,4,409,7,102}, {0,110,30031,1,4,5,292,5,293,7,102}},
					[4] = {{0,108,30032,1,4,7,27,7,102}, {0,109,30032,1,4,5,342,4,409,7,102}, {0,110,30032,1,4,5,292,5,293,7,102}},
					[4] = {{0,108,30029,1,4}, {0,109,30029,1,4}, {0,110,30029,1,4}},
					[6] = {{0,108,30030,1,4}, {0,109,30030,1,4}, {0,110,30030,1,4}},
					[7] = {{0,108,30031,1,4}, {0,109,30031,1,4}, {0,110,30031,1,4}},
					[8] = {{0,108,30032,1,4}, {0,109,30032,1,4}, {0,110,30032,1,4}},					
				},		
			[3] = {
					[1] = {{0,108,30029,1,4,3,13075,7,102}, {0,109,30029,1,4,5,342,2,346,7,102}, {0,110,30029,1,4,4,282,7,250,7,102}},
					[2] = {{0,108,30030,1,4,3,13075,7,102}, {0,109,30030,1,4,5,342,2,346,7,102}, {0,110,30030,1,4,4,282,7,250,7,102}},
					[3] = {{0,108,30031,1,4,3,13075,7,102}, {0,109,30031,1,4,5,342,2,346,7,102}, {0,110,30031,1,4,4,282,7,250,7,102}},
					[4] = {{0,108,30032,1,4,3,13075,7,102}, {0,109,30032,1,4,5,342,2,346,7,102}, {0,110,30032,1,4,4,282,7,250,7,102}},
					[5] = {{0,108,30029,1,4}, {0,109,30029,1,4}, {0,110,30029,1,4}},
					[6] = {{0,108,30030,1,4}, {0,109,30030,1,4}, {0,110,30030,1,4}},
					[7] = {{0,108,30031,1,4}, {0,109,30031,1,4}, {0,110,30031,1,4}},
					[8] = {{0,108,30032,1,4}, {0,109,30032,1,4}, {0,110,30032,1,4}},					
				},											
			[2] = {
					[1] = {{0,108,30029,1,4,6,302,7,409,7,102}, {0,109,30029,1,4,5,13219,5,13220,7,102}, {0,110,30029,1,4,4,290,7,250,7,102}},
					[2] = {{0,108,30030,1,4,6,302,7,409,7,102}, {0,109,30030,1,4,5,13219,5,13220,7,102}, {0,110,30030,1,4,4,290,7,250,7,102}},
					[3] = {{0,108,30031,1,4,6,302,7,409,7,102}, {0,109,30031,1,4,5,13219,5,13220,7,102}, {0,110,30031,1,4,4,290,7,250,7,102}},
					[4] = {{0,108,30032,1,4,6,302,7,409,7,102}, {0,109,30032,1,4,5,13219,5,13220,7,102}, {0,110,30032,1,4,4,290,7,250,7,102}},
					[5] = {{0,108,30029,1,4}, {0,109,30029,1,4}, {0,110,30029,1,4}},
					[6] = {{0,108,30030,1,4}, {0,109,30030,1,4}, {0,110,30030,1,4}},
					[7] = {{0,108,30031,1,4}, {0,109,30031,1,4}, {0,110,30031,1,4}},
					[8] = {{0,108,30032,1,4}, {0,109,30032,1,4}, {0,110,30032,1,4}},					
				},	
		}		
	--==============================
	if nTransKs == 3 then 	--ph�c sinh 3
		local nPhucSinh_Count = GetPlayerRebornParam(0) 
		local nRoute = GetPlayerRoute()
		local tbType = {"Long T�", "H� T�", "�ng T�", "Ph�ng T�"}
		local nType_cs7 = GetPlayerRebornParam(1)
		--============	
		BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
		BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
		BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
		BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
		local nBody = GetBody()	
		for i=1, getn(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody][i])
			--P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
		end	
		--=========
		gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
		PlayerReborn(3,nType) -- Chuy�n Sinh 8 th�nh c�ng (Ph�c Sinh 3)
		RemoveTitle(61,6)
		AddTitle(71,1)
		local nGetExp = GetExp()
		local nTime = floor(nGetExp/2000000000)
		if nTime >= 1 then
			for i = 1, nTime do
				ModifyExp(-2000000000)
			end
		end
		ModifyExp(-GetExp())
		gf_WriteLogEx("THE VIP", "chuy�n sinh th�nh c�ng", 1, "THE VIP chuyen sinh 8")	
		ExitGame()		
	end
--	AddExtPoint(EXT_SURVEY2016, 37)
	Talk(1, "", szNpcName.."��i hi�p �� nh�n h� tr� th�nh c�ng")
	
end
function get_danhhieu()
	if GetTask(TSK_TRAOTHUONG_BHTA15) >= 1 then
		Talk(1, "", szNpcName.."��i hi�p �� nh�n danh hi�u r�i.")
		return 0
	end
	
	local nBody = GetBody()
	if nBody <= 2 then
		AddTitle(67,11)
		SetTitleTime(67,11,GetTime() + 604800)
		SetCurTitle(67, 11)
		SetTask(TSK_TRAOTHUONG_BHTA15,1)
	else
		AddTitle(67,1)
		SetTitleTime(67,1,GetTime() + 604800)
		SetCurTitle(67, 1)
		SetTask(TSK_TRAOTHUONG_BHTA15,1)
	end
	
	Talk(1, "", szNpcName.."��i hi�p �� nh�n danh hi�u th�nh c�ng, h�y v�o b�ng nh�n v�t �� k�ch ho�t danh hi�u.")
end
function ThanHo_get_danhhieuVV()
	if MeridianGetLevel() == 2 then
		Talk(1, "", "Ch�c m�ng ��i hi�p nh�n nh�n th��ng c�nh gi�i V� V��ng th�nh c�ng.")
		MeridianUpdateLevel()
	else
		Talk(1, "", "C�nh gi�i c�a ��i hi�p kh�ng ph� h�p �� nh�n th��ng.")
	end
end
function thangcapnhanthuong_695_HT()

	local tbSay = {}		
	tinsert(tbSay,"Ta mu�n nh�n trang b� Kim X� V�n Du/#thangcapnhanthuong_695_finish(1)")
	tinsert(tbSay,"Ta mu�n nh�n trang b� Kim X� Thi�t Huy�t/#thangcapnhanthuong_695_finish(2)")
	tinsert(tbSay,"Ta mu�n nh�n trang b� Kim X� Du Hi�p/#thangcapnhanthuong_695_finish(3)")
	Say(szNpcName.."C�c h� h�y l�a ch�n 1 trong 3 b� trang b� Kim X�: ",getn(tbSay),tbSay)
end
function thangcapnhanthuong_695_finish(nChoice)
	AddExtPoint(EXT_SURVEY2016, 0922)
	Talk(1, "", szNpcName.."��i hi�p nh�n h� tr� th�nh c�ng.")
	
	if nChoice  == 1 then
		LIB_Award:Award(tbKimXaVanDu7)
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� V�n Du")
	elseif nChoice == 2 then
		LIB_Award:Award(tbKimXaThietHuyet7)
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� Thi�t Huy�t")
	elseif nChoice == 3 then
		LIB_Award:Award(tbKimXaDuHiep7)
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� Du Hi�p")
	end	
		gf_AddItemEx2({2,1,30497,1000,1},"Ma Tinh","DUA TOP","Ma Tinh")
		AwardGenuineQi(80000)
		gf_AddItemEx2({2,1,1001,1,4},"H�a Th� B�ch","DUA TOP","nh�n h�a th� b�ch",7*24*3600,1)
		gf_AddItemEx2({2,1,30368,100,4},"C� Linh Th�ch","DUA TOP","nh�n C� Linh Th�ch")
		gf_AddItemEx2({2,1,30369,100,4},"C� Linh Ng�c","DUA TOP","nh�n C� Linh Ng�c")	
		gf_AddItemEx2({2,1,30912,800,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")	
		for i=1,4 do	--�� qu� level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "�� qu� 3 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level4
			gf_AddItemEx2({2,22,i*100+4, 1}, "�� qu� 4 h� ph�i", "DUA TOP" , "nh�n")
		end
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 1 c�p 94")
end
function _chuyensinh8_ThanHo_get_danhhieu()
	local nChuyenSinh = GetPlayerRebornParam(0)
	if nChuyenSinh == 3 then
		RemoveTitle(61,6)
		AddTitle(71,1)
		Talk(1, "", szNpcName.."��i hi�p danh hi�u chuy�n sinh 8 th�nh c�ng.")
	else	
		Talk(1, "", szNpcName.."danh hi�u c�a ��i hi�p kh�ng ph� h�p.")
		return 0
	end	
end

function Online_award_2018()
	local _,nOnlineTime,_ = GetAntiEnthrallmentInfo();
	local nAward1 = VNG_GetTaskPos(TSK_Award_2018, 1, 1)	
	local nAward2 = VNG_GetTaskPos(TSK_Award_2018, 2, 2)
--	local nAward3 = VNG_GetTaskPos(TSK_Award_2018, 3, 3)
--	local nAward6 = VNG_GetTaskPos(TSK_Award_2018, 6, 6)
	nOnlineTime = floor(nOnlineTime/60)
	local tSay = {}
	
	if nAward1 == 0 then
		tinsert(tSay,"��ng nh�p Online ng�y T�t - nh�n th��ng/#finish_Online_award_2018(1)")
	end
	if nAward2== 0 then
		tinsert(tSay,"��ng nh�p Online ng�y T�t �� 60 ph�t - nh�n th��ng/#finish_Online_award_2018(2)")
	end
--	if nAward3 == 0 then
--		tinsert(tSay,"��ng nh�p Online ng�y T�t �� 60 ph�t - nh�n th��ng/#finish_Online_award_2018(3)")
--	end
--	if nAward6 == 0 then
--		tinsert(tSay,"��ng nh�p Online ng�y T�t �� 60 ph�t - nh�n b� ng�y 01-01-2020/#finish_Online_award_2018(6)")
--	end
--	tinsert(tSay,"��ng nh�p ng�y T�t - nh�n th��ng/#finish_Online_award_2018(1)")
--	tinsert(tSay,"Online ng�y T�t �� 60 ph�t - nh�n th��ng/#finish_Online_award_2018(2)")
	tinsert(tSay,"Ta ch� gh� qua/nothing")
	Say(szNpcName.." ��ng nh�p nh�n th��ng, v� online �� 60 ph�t nh�n th��ng. ��i hi�p �� online ���c "..nOnlineTime.." ph�t.",getn(tSay),tSay)
end
function finish_Online_award_2018(nType)
	local tbAwardOnline_2018 = {
								[1] = {
										[21] = {500000000},
										[22] = {500000000},
										[23] = {500000000},
										[24] = {500000000},
										[25] = {1000000000},
										[26] = {500000000},										
										[27] = {500000000},
										[28] = {500000000},
										[29] = {500000000},
										[30] = {500000000},
										[31] = {500000000},										
										[1] = {500000000},	
										[2] = {500000000},	
										[3] = {500000000},	
										
									},
								[2] = {
										[21] = {item ={													
													{gdp={2, 1, 30912, 3000, 4}, name="Hi�p Ngh�a Chi Ch�ng"},	--, nExpired = 15*24*60*60},
													{gdp={2, 1, 30847, 2, 4}, name="H�i Ti�n ��n"},
													{gdp={2, 1, 31383, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M�nh Kim X� 6"},
													},	
												nExp = 500000000,
												--fn = "ngoaitrangMaiLieu()",
												},
										[22] = {item ={													
													{gdp={2, 1, 31244, 200, 4}, name="M�nh C� Quan M�c Gia"},
													{gdp={2, 1, 30847, 2, 4}, name="H�i Ti�n ��n"},
													{gdp={2, 1, 31383, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M�nh Kim X� 6"},
													},	
												nExp = 500000000,
												},
										[23] = {item ={													
													{gdp={2, 1, 31244, 200, 4}, name="M�nh C� Quan M�c Gia"},
													{gdp={2, 1, 31001, 1, 4}, name="T�i �� Qu� C�p 4"},
													{gdp={2, 1, 31383, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M�nh Kim X� 6"},
													},	
												nExp = 500000000,
												},
										[24] = {item ={													
													{gdp={2, 1, 31244, 200, 4}, name="M�nh C� Quan M�c Gia"},
													{gdp={2, 1, 31001, 1, 4}, name="T�i �� Qu� C�p 4"},
													{gdp={2, 1, 31383, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M�nh Kim X� 6"},
													},	
												nExp = 500000000,
												},	
										[25] = {item ={													
													{gdp={2, 1, 1113, 1, 4}, name="��i ��nh H�n", nExpired = 7*24*60*60},
													{gdp={2, 97, 236, 1, 4}, name="Thi�n Ki�u L�nh", nExpired = 7*24*60*60},
													{gdp={2, 1, 31123, 1, 4}, name="T�i �� Qu� C�p 6"}, 
													{gdp={2, 1, 31244, 500, 4}, name="M�nh C� Quan M�c Gia"},
													{gdp={2, 1, 31383, 5, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31384, 5, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31385, 5, 4}, name="M�nh Kim X� 6"},
													},	
												nExp = 2000000000,
												},	
										[26] = {item ={	
													{gdp={2, 1, 1009, 1, 4}, name="Thi�n Th�ch Tinh Th�ch", nExpired = 7*24*60*60},
													{gdp={2, 1, 31024, 1, 4}, name="T�i �� Qu� C�p 5"},
													{gdp={2, 1, 1067, 1, 4}, name="��nh H�n Thi�n Th�ch Th�n Th�ch", nExpired = 7*24*60*60},
													{gdp={2, 1, 31383, 3, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31384, 3, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31385, 3, 4}, name="M�nh Kim X� 6"},
													},	
												nExp = 1000000000,
												},											
										[27] = {item ={													
													{gdp={2, 1, 31024, 1, 4}, name="T�i �� Qu� C�p 5"},
													{gdp={2, 1, 30847, 2, 4}, name="H�i Ti�n ��n"},
													{gdp={2, 1, 31244, 200, 4}, name="M�nh C� Quan M�c Gia"},	
													{gdp={2, 1, 31383, 3, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31384, 3, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31385, 3, 4}, name="M�nh Kim X� 6"},
													},	
												nExp = 1000000000,
												},	
										[28] = {item ={													
													{gdp={2, 1, 31001, 1, 4}, name="T�i �� Qu� C�p 4"},
													{gdp={2, 1, 31244, 200, 4}, name="M�nh C� Quan M�c Gia"},
													{gdp={2, 1, 31383, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M�nh Kim X� 6"},
													},	
												nExp = 500000000,
												},	
										[29] = {item ={													
													{gdp={2, 1, 31001, 1, 4}, name="T�i �� Qu� C�p 4"},
													{gdp={2, 1, 30728, 1, 4}, name="Tr�ng Linh Th�-Cao"},
													{gdp={2, 1, 31383, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M�nh Kim X� 6"},
													},	
												nExp = 500000000,
												},	
										[30] = {item ={													
													{gdp={2, 1, 31001, 1, 4}, name="T�i �� Qu� C�p 4"},
													{gdp={2, 1, 1068, 1, 4}, name="Thi�n Th�ch linh th�ch", nExpired = 7*24*60*60},
													{gdp={2, 1, 31383, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M�nh Kim X� 6"},
													},	
												nExp = 500000000,
												},	
										[31] = {item ={													
													{gdp={2, 1, 31001, 1, 4}, name="T�i �� Qu� C�p 4"},
													{gdp={2, 1, 30847, 2, 4}, name="H�i Ti�n ��n"},
													{gdp={2, 1, 31383, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M�nh Kim X� 6"},
													},	
												nExp = 500000000,
												},	
										[1] = {item ={													
													{gdp={2, 1, 31001, 1, 4}, name="T�i �� Qu� C�p 4"},
													{gdp={2, 1, 30847, 2, 4}, name="H�i Ti�n ��n"},
													{gdp={2, 1, 31383, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M�nh Kim X� 6"},
													},	
												nExp = 500000000,
												},	
										[2] = {item ={													
													{gdp={2, 1, 31001, 1, 4}, name="T�i �� Qu� C�p 4"},
													{gdp={2, 1, 30847, 2, 4}, name="H�i Ti�n ��n"},
													{gdp={2, 1, 31383, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M�nh Kim X� 6"},
													},	
												nExp = 500000000,
												},	
										[3] = {item ={													
													{gdp={2, 1, 31001, 1, 4}, name="T�i �� Qu� C�p 4"},
													{gdp={2, 1, 30847, 2, 4}, name="H�i Ti�n ��n"},
													{gdp={2, 1, 31244, 500, 4}, name="M�nh C� Quan M�c Gia"},
													{gdp={2, 1, 31383, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M�nh Kim X� 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M�nh Kim X� 6"},
													},	
												nExp = 500000000,
												},			
									},
								

							}
	local nDay = tonumber(date("%d"))
	local nAward1 = VNG_GetTaskPos(TSK_Award_2018, 1, 1)	
	local nAward2 = VNG_GetTaskPos(TSK_Award_2018, 2, 2)	
--	local nAward3 = VNG_GetTaskPos(TSK_Award_2018, 3, 3)	
--	local nAward6 = VNG_GetTaskPos(TSK_Award_2018, 6, 6)
--	local nAward4 = VNG_GetTaskPos(TSK_Award_2018, 4, 4)
--	local nAward5 = VNG_GetTaskPos(TSK_Award_2018, 5, 5)
	local _,nOnlineTime,_ = GetAntiEnthrallmentInfo();
	if gf_Judge_Room_Weight(5,250) ~= 1 then
		Talk(1,"",szNpcName.."H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return
	end	
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "",szNpcName.."T�nh tr�ng hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
	if GetLevel() < 59 then		--gf_GetPlayerRebornCount() < 1 and
		Talk(1, "", szNpcName.."B�n kh�ng �� ��ng c�p 59 n�n kh�ng th� nh�n th��ng.")	
		return 0
	end
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", szNpcName.."B�n ch�a h�c xong 1 k� n�ng c�p 55 n�n kh�ng th� nh�n th��ng.")	
		return 0
	end
	if nType == 1 then
		if nAward1 == 1 then
			Talk(1, "", szNpcName.."B�n �� nh�n th��ng r�i n�n kh�ng th� nh�n th��ng.")	
			return 0
		end
	end
	if nType == 2 then
		if nAward2 == 1 then
			Talk(1, "", szNpcName.."B�n �� nh�n th��ng r�i n�n kh�ng th� nh�n th��ng.")	
			return 0
		end
		if nOnlineTime < 3600 then
			Talk(1, "", szNpcName.."B�n ch�a online �� 60 ph�t n�n kh�ng th� nh�n th��ng.")	
			return 0
		end
	end

	
	--Award
	if nType == 1 then
		VNG_SetTaskPos(TSK_Award_2018, 1, 1, 1)	
		ModifyExp(tbAwardOnline_2018[nType][nDay][1])
		Msg2Player("B�n nh�n ���c "..tbAwardOnline_2018[nType][nDay][1].." �i�m kinh nghi�m.")	
		gf_WriteLogEx("PHAN THUONG ONLINE 2020", "nh�n", 1, "Nh�n th�nh c�ng online 1 gi�y")
	end
	if nType == 2 then
		VNG_SetTaskPos(TSK_Award_2018, 1, 2, 2)	
		LIB_Award.szLogTitle = "PHAN THUONG ONLINE 2019"
		LIB_Award.szLogAction = "Nh�n th�nh c�ng online 60 ph�t"
		LIB_Award:Award(tbAwardOnline_2018[nType][nDay])
	end

end
function dangkychuyenserver_chonserver()
	local tbServer = {
		{2,"T�ng Long"}, 
		{3,"B�ch H�"}, 
		{8,"Ph�c H�"},
		{22,"Thi�n Long"},
		{33,"Th�n Long"},
		{39,"Qu�n H�"},
		{89, "Linh B�o S�n"},
		{92, "H�a Ph�ng"},
		{118,"Chi�n H�"},
		{121,"Cu�ng Long"},
--		{122,"Uy H�"},
		}
	local nExt_Support = GetExtPoint(EXT_SURVEY2016)
	local nChuyenSinh = gf_GetTransLevel()
 	if nExt_Support < 64 then
 		PayExtPoint(EXT_SURVEY2016, GetExtPoint(EXT_SURVEY2016))
 	end
	if nExt_Support >= 64 then
		Talk(1, "", szNpcName.."��i hi�p �� ��ng k� chuy�n server r�i.")
		return 0
	end	
	if GetItemCount(2,1,30230) < 300 then
		Talk(1,"",szNpcName.."��i hi�p kh�ng mang �� 300 Xu v�t ph�m !!! ")
		return 0
	end
	if nChuyenSinh < 10 or nChuyenSinh > 799 then
		Talk(1,"",szNpcName.."��ng c�p 10 ��n chuy�n sinh 7 c�p 99 m�i c� th� ��ng k� chuy�n server!")
		return 0
	end
	local tbDanhsachServer = {}
	for i=getn(tbServer),1,-1 do
		tinsert(tbDanhsachServer, tbServer[i][2].."/#dangkychuyenserver("..tbServer[i][1]..")")
	end
	tinsert(tbDanhsachServer, "Ta s� quay l�i sau/nothing")
	
	Say(szNpcName.."��i hi�p mu�n chuy�n ��n Server n�o?", getn(tbDanhsachServer), tbDanhsachServer)
end
function dangkychuyenserver(nNewServer)
	local nServerID = GetGlbValue(1023)
	
	if nNewServer == nServerID then
		Talk(1,"",szNpcName.."��i hi�p �ang � server n�y r�i.")
		return 0
	end
	SetTask(TSK_ChuyenServer, nNewServer)
	AskClientForString("KiemTraDangKyChuyenServer","",6,15,"Nh�p T�n M�i");
end
function KiemTraDangKyChuyenServer(szNewName)
	local szAcc = GetAccount()
	local szRole = GetName()
	local nServerID = GetGlbValue(1023)
	local nNewServer = GetTask(TSK_ChuyenServer)
	if GetItemCount(2,1,30230) < 300 then
		Talk(1,"","��i hi�p kh�ng mang �� 300 Xu v�t ph�m !!! ")
		return 0
	end
	if LIB_txtData:CheckString(szNewName) > 0 then
		Talk(1, "",szNpcName.."T�n m�i c�a c�c h� c� nhi�u ch� l� qu�, ta kh�ng bi�t ghi l�i nh� th� n�o n�a. Hay l� ��i t�n kh�c �i nh�.")
		return 0
	end
	
	LIB_txtData:Init(CHUYENSERVER_FILENAME)
	LIB_txtData:LoadMultiColumn()
	if DelItem(2,1,30230,300) ~= 1 then
		Talk(1, "", szNpcName.."��i hi�p kh�ng mang �� 300 Xu v�t ph�m !!!")
		return 0
	end
	local szData = szAcc.."	"..szRole.."	"..szNewName.."	"..nServerID.."	"..nNewServer
	LIB_txtData:AddLine(szData)
	LIB_Award.szLogTitle = "DANG KY CHUYEN SERVER"
	LIB_Award.szLogAction = "��ng k� chuy�n th�nh c�ng"
	AddExtPoint(EXT_SURVEY2016, 64)
	Talk(1, "", szNpcName.."��i hi�p ��ng k� chuy�n server th�nh c�ng.")
end
function hotrodiemnangdongpbm()
	local nExtPoint = GetExtPoint(3)
	if nExtPoint == 0 then
		Talk(1, "", "��i hi�p ch�a k�ch ho�t code Uy H� L�nh 4, n�n kh�ng th� nh�n th��ng.")
		return 0
	end
	local nOneTime = GetTaskPosition(TSK_HOTRO_QUANCONG, 1)
	if nOneTime >= 1 then
		Talk(1, "", "��i hi�p �� nh�n h� tr� �i�m n�ng ��ng r�i.")
		return 0
	end

	SetTask(3053, GetTask(3053)+200)
	Talk(1, "", "Ch�c m�ng b�n �� nh�n h� tr� 200 �i�m n�ng ��ng th�nh c�ng")
	Msg2Player("Ch�c m�ng b�n nh�n 200 �i�m n�ng ��ng")
	SetTaskPosition(TSK_HOTRO_QUANCONG, 1, nOneTime+1)
	gf_WriteLogEx("NHAN HO TRO ALL SERVER", "nh�n th�nh c�ng", 1, "200 n�ng ��ng")

end

function hotrocongtrangpbm(nType)
	local nchecklevel = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()	
	local nLevelCheck = 690
	local nLevelCheck1 = 90
	if nType == 3 then
		nLevelCheck = 892
		nLevelCheck1 = 92
	end	
	if nType == 2 then
		if nchecklevel < nLevelCheck then
			Talk(1, "", "��i hi�p ��t chuy�n sinh 6 c�p "..nLevelCheck1.." r�i h�y quay l�i nh�n h� tr�. ")
			return 0
		end	
		local nOneTimeExp = GetTaskPosition(TSK_HOTRO_QUANCONG, 2)
		if nOneTimeExp >= 1 then
			Talk(1, "", "��i hi�p �� nh�n h� tr� �i�m kinh nghi�m r�i, xin h�y ch�n nh�n h� tr� kh�c.")
			return 0
		end
		local nExp = 2000000000
		ModifyExp(nExp)
		Talk(1, "", "Ch�c m�ng b�n �� nh�n h� tr� 2 t� �i�m kinh nghi�m th�nh c�ng")
		Msg2Player("Ch�c m�ng b�n nh�n 2 t� �i�m kinh nghi�m")
		SetTaskPosition(TSK_HOTRO_QUANCONG, 2, nOneTimeExp+1)
		gf_WriteLogEx("NHAN HO TRO ALL SERVER", "nh�n th�nh c�ng", 1, "2 t� exp")
		return 0
	end
	if nType == 3 then
		if nchecklevel < nLevelCheck then
			Talk(1, "", "��i hi�p ��t chuy�n sinh 8 c�p "..nLevelCheck1.." r�i h�y quay l�i nh�n h� tr�. ")
			return 0
		end	
		local nOneTimeCT = GetTaskPosition(TSK_HOTRO_QUANCONG, 3)
		if nOneTimeCT >= 1 then
			Talk(1, "", "��i hi�p �� nh�n h� tr� �i�m c�ng tr�ng r�i, xin h�y ch�n nh�n h� tr� kh�c.")
			return 0
		end
		local tbSayDialog = {};
		local nSaySize = 0;
		local szSayHead = "Ta h� tr� cho ��i hi�p �i�m c�ng tr�ng."
		
		tinsert(tbSayDialog, "- Kh�ng s� d�ng qu�n c�ng ch��ng: nh�n 10000 �i�m c�ng tr�ng/#_hotrocongtrangpbm(1)")
		tinsert(tbSayDialog, "- S� d�ng qu�n c�ng ch��ng: nh�n 20000 �i�m c�ng tr�ng/#_hotrocongtrangpbm(2)")
		tinsert(tbSayDialog, "- S� d�ng qu�n c�ng ��i: nh�n 40000 �i�m c�ng tr�ng/#_hotrocongtrangpbm(3)")	
		tinsert(tbSayDialog, "- S� d�ng qu�n c�ng huy ho�ng: nh�n 80000 �i�m c�ng tr�ng/#_hotrocongtrangpbm(4)")
		tinsert(tbSayDialog, "- S� d�ng qu�n c�ng vinh d�: nh�n 150000 �i�m c�ng tr�ng/#_hotrocongtrangpbm(5)")
		tinsert(tbSayDialog,"Ta ch� gh� qua/nothing")
		
		nSaySize = getn(tbSayDialog);
		Say(szSayHead, nSaySize, tbSayDialog);
	end
end
function _hotrocongtrangpbm(nType)
	local tItem = {	
						[1] = {2, 1, 9999, 0, "Kh�ng qu�n c�ng",10000},
						[2] = {2, 1, 9999, 1, "Qu�n C�ng Ch��ng",20000},
						[3] = {2, 1, 9998, 1, "Qu�n C�ng ��i",40000},
						[4] = {2, 1, 9977, 1, "Qu�n C�ng Huy Ho�ng",80000},
						[5] = {2, 1, 30642, 1, "qu�n c�ng ch��ng vinh d�",150000},
					}
	if GetItemCount(2,1,tItem[nType][3]) < tItem[nType][4] then
		Talk(1, "", szNpcName.."��i hi�p kh�ng mang "..tItem[nType][4].." �� nh�n th��ng !!!")
		return 0
	end
	
	local nOneTimeCT = GetTaskPosition(TSK_HOTRO_QUANCONG, 3)
	if nOneTimeCT >= 1 then
		Talk(1, "", "��i hi�p �� nh�n h� tr� �i�m c�ng tr�ng r�i, xin h�y ch�n nh�n h� tr� kh�c.")
		return 0
	end
	if DelItem(2,1,tItem[nType][3],tItem[nType][4]) == 1 then
		if GetTask(701) >= 0 then
			SetTask(701, GetTask(701) + tItem[nType][6])
--			Talk(1, "", "Ch�c m�ng b�n �� nh�n h� tr� qu�n c�ng th�nh c�ng")
		else
			SetTask(701, GetTask(701) - tItem[nType][6])
--			Talk(1, "", "Ch�c m�ng b�n �� nh�n h� tr� qu�n c�ng th�nh c�ng")
		end
		
		Talk(1, "", "Ch�c m�ng b�n �� nh�n h� tr� qu�n c�ng th�nh c�ng")
		Msg2Player("Ch�c m�ng b�n "..tItem[nType][6].." �i�m c�ng tr�ng")
		SetTaskPosition(TSK_HOTRO_QUANCONG, 3, nOneTimeCT+1)
		gf_WriteLogEx("NHAN HO TRO ALL SERVER", "nh�n th�nh c�ng", 1, "c�ng tr�ng")
	end
end
function thang11tothang12()
	local nQuaBac = GetItemCount(2, 200, 46)
	local nQuaBachKim = GetItemCount(2, 200, 47)
	local nQuaTonSu = GetItemCount(2, 200, 48)
	local tSay = {}
	if nQuaBac <= 0 and nQuaBachKim <= 0 and nQuaTonSu <= 0 then	
		Talk(1, "", szNpcName.."��i hi�p �� h�t v�t ph�m event th�ng 11 �� ��i r�i.")
		return 0
	end
	if nQuaBac > 0 then		
		tinsert(tSay,"��i "..nQuaBac.." H�p Qu� B�c th�nh " ..nQuaBac.." C�y Th�ng An L�nh/#change_thang11tothang12(1)")
	end
	if nQuaBachKim > 0 then		
		tinsert(tSay,"��i "..nQuaBachKim.." H�p Qu� B�ch Kim th�nh " ..nQuaBachKim.." C�y Th�ng �m �p/#change_thang11tothang12(2)")
	end
	if nQuaTonSu > 0 then		
		tinsert(tSay,"��i "..nQuaTonSu.." H�p Qu� T�n S� th�nh " ..nQuaTonSu.." C�y Th�ng Gi�ng Sinh/#change_thang11tothang12(3)")
	end
	
	tinsert(tSay,"Ta ch� gh� qua/nothing")
	Say(szNpcName.."Ta s� gi�p ��i hi�p ��i v�t ph�m event th�ng 11 th�nh v�t ph�m event th�ng 12.",getn(tSay),tSay)
end
function change_thang11tothang12(nType)
	local nQuaBac = GetItemCount(2, 200, 46)
	local nQuaBachKim = GetItemCount(2, 200, 47)
	local nQuaTonSu = GetItemCount(2, 200, 48)
	if nQuaBac <= 0 and nQuaBachKim <= 0 and nQuaTonSu <= 0 then	
		Talk(1, "", szNpcName.."��i hi�p �� h�t v�t ph�m event th�ng 11 �� ��i r�i.")
		return 0
	end
	if nType == 1 and nQuaBac > 0 then
		if BigDelItem(2, 200, 46,nQuaBac) == 1 then
			gf_AddItemEx2({2, 200, 52,nQuaBac}, "Doi event 11 to 12", "HO TRO DOI EVENT 11 TO 12", "��i event 11 to 12")
			Talk(1, "", szNpcName.."��i hi�p �� nh�n ���c "..nQuaBac.." C�y Th�ng An L�nh.")
		end
	end
	if nType == 2 and nQuaBachKim > 0 then
		if BigDelItem(2, 200, 47,nQuaBachKim) == 1 then
			gf_AddItemEx2({2, 200, 53,nQuaBachKim}, "Doi event 11 to 12", "HO TRO DOI EVENT 11 TO 12", "��i event 11 to 12")
			Talk(1, "", szNpcName.."��i hi�p �� nh�n ���c "..nQuaBachKim.." C�y Th�ng �m �p.")
		end
	end
	if nType == 3 and nQuaTonSu > 0 then
		if BigDelItem(2, 200, 48,nQuaTonSu) == 1 then
			gf_AddItemEx2({2, 200, 54,nQuaTonSu}, "Doi event 11 to 12", "HO TRO DOI EVENT 11 TO 12", "��i event 11 to 12")
			Talk(1, "", szNpcName.."��i hi�p �� nh�n ���c "..nQuaTonSu.." C�y Th�ng Gi�ng Sinh.")
		end
	end
end

function ngoaitrangMaiLieu()
	local nBody = GetBody();
	local nRand = random(1,100);
	
	if nRand == 1 then
		gf_AddItemEx2({0,108,1076+nBody,1,5},"Mai Li�u","PHAN THUONG ONLINE 2019","nh�n Mai Li�u")
		gf_AddItemEx2({0,109,1076+nBody,1,5},"Mai Li�u","PHAN THUONG ONLINE 2019","nh�n Mai Li�u")
		gf_AddItemEx2({0,110,1076+nBody,1,5},"Mai Li�u","PHAN THUONG ONLINE 2019","nh�n Mai Li�u")
	else
		gf_AddItemEx2({0,108,1076+nBody,1,5},"Mai Li�u","PHAN THUONG ONLINE 2019","nh�n Mai Li�u",7*24*3600)
		gf_AddItemEx2({0,109,1076+nBody,1,5},"Mai Li�u","PHAN THUONG ONLINE 2019","nh�n Mai Li�u",7*24*3600)
		gf_AddItemEx2({0,110,1076+nBody,1,5},"Mai Li�u","PHAN THUONG ONLINE 2019","nh�n Mai Li�u",7*24*3600)
	end
	gf_WriteLogEx("PHAN THUONG ONLINE 2020", "nh�n", 1, "Nh�n th�nh c�ng online 60 ph�t")
end

function change_7daytoEver()
--	if GetItemCount(2,97,236) < 100 then
--		Talk(1, "", "��i hi�p kh�ng c� �� 100 Thi�n Ki�u L�nh �� ��i.")
--		return 0
--	end
	local nBody = GetBody();
	if GetItemCount(0,108,1076+nBody) < 1 then
		Talk(1, "", "��i hi�p kh�ng c� �� b� ngo�i trang Mai Li�u �� ��i.")
		return 0
	end	
	if GetItemCount(0,109,1076+nBody) < 1 then
		Talk(1, "", "��i hi�p kh�ng c� �� b� ngo�i trang Mai Li�u �� ��i.")
		return 0
	end	
	if GetItemCount(0,110,1076+nBody) < 1 then
		Talk(1, "", "��i hi�p kh�ng c� �� b� ngo�i trang Mai Li�u �� ��i.")
		return 0
	end
	if DelItem(0,108,1076+nBody,1) == 1 and DelItem(0,109,1076+nBody,1) == 1 and DelItem(0,110,1076+nBody,1) == 1 then
		gf_AddItemEx2({0,108,1076+nBody,1,5},"Mai Li�u","PHAN THUONG ONLINE 2019","nh�n Mai Li�u")
		gf_AddItemEx2({0,109,1076+nBody,1,5},"Mai Li�u","PHAN THUONG ONLINE 2019","nh�n Mai Li�u")
		gf_AddItemEx2({0,110,1076+nBody,1,5},"Mai Li�u","PHAN THUONG ONLINE 2019","nh�n Mai Li�u")
		gf_WriteLogEx("PHAN THUONG ONLINE 2020", "nh�n", 1, "��i ngo�i trang v�nh vi�n th�nh c�ng")
	else
		gf_WriteLogEx("PHAN THUONG ONLINE 2020", "nh�n", 1, "��i ngo�i trang v�nh vi�n th�t b�i")
	end
end
function buy_BachSa()
	if GetItemCount(2,97,236) < 100 then
		Talk(1, "", "��i hi�p kh�ng c� �� 100 Thi�n Ki�u L�nh �� ��i.")
		return 0
	end
	if DelItem(2,97,236,100) == 1 then
		gf_AddItemEx2({2,1,31388,1,4},"B�ch Sa","MUA BACH SA BK","nh�n t�i B�ch Sa")
		gf_WriteLogEx("MUA BACH SA", "nh�n", 1, "Mua ngo�i trang b�ch sa v�nh vi�n th�nh c�ng")
	end
end
function award_KhaoSatOnline()
	local nDate = tonumber(date("%Y%m%d"))
 	if nDate > 20200208 then	
 		return 0
 	end
 	local nExt_Support = GetExtPoint(EXT_SURVEY2016)
 	if nExt_Support ~= 1 then
 		Talk(1, "", "��i hi�p �� nh�n th��ng r�i ho�c ��i hi�p �� kh�ng th�c hi�n kh�o s�t online.")
		return 0
 	end
	if nExt_Support == 1 then
		gf_AddItemEx2({0,105,201,1,1,-1,-1,-1,-1,-1,-1,-1},"Linh Ngh�","KHAO SAT ONLINE","nh�n linh ngh�",7*24*3600)	
		PayExtPoint(EXT_SURVEY2016, GetExtPoint(EXT_SURVEY2016))
	end
end


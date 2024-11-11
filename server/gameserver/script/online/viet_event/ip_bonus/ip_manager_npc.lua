-- IP Bonus Created by TuanNA5
-- Edit by PhucNG
Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua") -- IP bonus
Include("\\script\\online\\viet_event\\golden_card\\npc_golden.lua") -- event Hoµng Kim LÖnh Bµi
Include("\\script\\online\\viet_event\\bet_game\\bet_npc.lua") -- Dù ®o¸n kÕt qu¶ thi ®Êu
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


szNpcName = "<color=green>Chñ Phßng M¸y: <color>"
--§¨ng ký chuyÓn server
CHUYENSERVER_FILENAME = "chuyenserver_dangky_20190516.txt"
LIB_txtData.szPattern = "[A-Za-z0-9¸µ¶·¹¡¾»¼½Æ¢ÊÇÈÉËEÐÌÎÏÑ£ÕÒÓÔÖãßáâä¤èåæçé¥íêëìîóïñòô¦øõö÷ùÝ×ØÜÞýúûüþ§¸µ¶·¹¨¾»¼½Æ©ÊÇÈÉËÐÌÎÏÑªÕÒÓÔÖãßáâä«èåæçé¬íêëìîóïñòô­øõö÷ùÝ×ØÜÞýúûüþ®_]"
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
		[1] = {"B¹ch CÇu Hoµn", {2,1,270,1,4}, 4, 2,5},
		[2] = {"Tam Thanh Hoµn", {2,1,1097,1,4}, 2, 2,6},
		[3] = {"Lôc ThÇn Hoµn", {2,1,1064,1,4}, 2, 2,7},
		[4] = {"Ng«i Sao May M¾n", {2,1,30191,1,4}, 16, 2,8},
--		[5] = {"Tô Linh Tiªn §¬n", {2,1,30460,1,4}, 50, 2, 9},
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
		Say(szNpcName.."Ho¹t ®éng ®· kÕt thóc!",0)
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
			"NhËn th­ëng tÝch lòy online/IpBonus",
			"NhËn th­ëng Vinh Danh T­íng SÜ/get_solider_glory",
			"Nguyªn So¸i tuyªn bè chiÕm ®ãng thµnh thÞ nµy, ta muèn lµm nhiÖm vô qu©n ®éi/do_military_job",
			"Thu håi CÈm Nang §¹i Sù KiÖn/get_camnang",			
	}
	if nDate < 20171116 then	
		if nServerID_Hotro == 113 then
			tinsert(tSay,1,"NhËn Danh HiÖu Vâ V­¬ng/ThanHo_get_danhhieuVV")
			tinsert(tSay,1,"NhËn l¹i danh hiÖu ChuyÓn Sinh 8/_chuyensinh8_ThanHo_get_danhhieu")
		end
	end
	if nDate <= 20170423 then	
		tinsert(tSay,1,"NhËn Danh HiÖu/get_danhhieu")
	end
	if CheckVbonus() == 1 then
--		tinsert(tSay,1,"NhËn th­ëng VBonus/VBonusMenu")
--		tinsert(tSay,1,"Mua vËt phÈm Siªu ­u ®·i h»ng ngµy cña VBonus/VBonusShop")
	end
	--==Hç trî 
	if nDate == 20200416 then	
		for i = 1, getn(tbds_nhiemvu) do
			if nAcc == tbds_nhiemvu[i][1] and nServerID_Hotro == tbds_nhiemvu[i][3] then	 	--and nRole == tbds_nhiemvu[i][2] 	--
--				if nAcc == "hoangduytlq" then
--					tinsert(tSay,1,"Trao Gi¶i BHTA 22/#get_item_support(2)")
--				else
					tinsert(tSay,1,"Hç trî VIP/#get_item_support(2)")
--					tinsert(tSay,1,"NhËn th­ëng hç trî ThÇn Hæ/thangcapnhanthuong_695_HT")
--				end
			end
		end		
	end
	--====Big promotion th¸ng 7 cña PG1
--	local nB1_active = gf_GetExtPointBit(EXT_BIGPRO_PG1,1)	--kÝch ho¹t web code vµo cöa
--	local nB2_active = gf_GetExtPointBit(EXT_BIGPRO_PG1,2)	--kÝch ho¹t web code face
--	local nB3_award = gf_GetExtPointBit(EXT_BIGPRO_PG1,3)	--nhËn th­ëng ingame code vµo cöa
--	local nB4_award = gf_GetExtPointBit(EXT_BIGPRO_PG1,4)	--nhËn th­ëng ingame code face
--	local nCheckAward = gf_GetExtPointBit(EXT_BIGPRO_PG1,12)
	local nCheckAward = GetExtPoint(EXT_SURVEY2016)	
	if nDate >= 20161231 and nDate <= 20161231 then
		for i = 1, getn(tbDsVIPCode) do		
			if nAcc == tbDsVIPCode[i][1] and nRole == tbDsVIPCode[i][2] and nServerID_Hotro == tbDsVIPCode[i][3] then	 
				tinsert(tSay,1,"NhËn th­ëng Vang Danh Thiªn H¹/award_mattich20_codeVIP_update")
				break
			end
		end
	end
	if CheckBigPromotionThang7() == 1 then
		if nB1_active == 1 and nB3_award == 0 then
			tinsert(tSay,1,"NhËn th­ëng Code Vang Danh Thiªn H¹/#award_promotion(1)")
		end
		if nB2_active == 1 and nB4_award == 0 then
			tinsert(tSay,1,"NhËn th­ëng Code Facebook/#award_promotion(2)")
		end
	end
	--=============

	if nDate == 20200115 then	-- and nServerID_Hotro == 7 then
		for i = 1, getn(tbQuanCongTP) do
			if nAcc == tbQuanCongTP[i][1] and nServerID_Hotro == tbQuanCongTP[i][4] then	 	--and nRole == tbQuanCongTP[i][2] 
				local nQuanCong = abs(GetTask(701))	
				if nQuanCong < tbQuanCongTP[i][3] then
				--if GetTask(TSK_VANGDANHTHIENHA_DUATOP) < 1 then	
					--tinsert(tSay,1,"NhËn th­ëng ®ua top Duy Hæ/award_vdth")--award_BHTA14")
					tinsert(tSay,1, "NhËn hç trî qu©n c«ng/get_QuanCong_HoTro")
				end
			end
		end
		for i = 1, getn(tbSuMon) do
			if nAcc == tbSuMon[i][1] and nRole == tbSuMon[i][2] and nServerID_Hotro == tbSuMon[i][4] then	 
				local nSuMon = abs(GetTask(336))	
				if nSuMon < tbSuMon[i][3] then
				--	tinsert(tSay,"NhËn hç trî ®iÓm s­ m«n/get_SuMon_HoTro")
				end
			end
		end
	end	
	if nDate <= 20200119 then	
		tinsert(tSay,1,"§æi ngo¹i trang Mai LiÔu cã thÓ l­u tr÷/change_7daytoEver")
	end
	if nDate <= 20200127 then	
		tinsert(tSay,1,"Mua ngo¹i trang B¹ch Sa VÜnh ViÔn (tiªu hao 100 Thiªn Kiªu LÖnh)/buy_BachSa")
	end
	if nDate >= 20200121 and nDate <= 20200203 then
		tinsert(tSay,1,"§¨ng nhËp online nhËn th­ëng TÕt 2020 (tõ 21.01.2020 ®Õn 03.02.2020)/Online_award_2018")
	end
	if nDate >= 20161207 and nDate <= 20161207 then
		local nCheck = check_gamer_inlist()
		if nCheck == 1 then
			tinsert(tSay,"NhËn th­ëng Bang Héi Tinh Anh 16/award_BHTA15")
		end
	end
	if nDate >= 20150203 and nDate <= 20150211 then
		tinsert(tSay,"NhËn th­ëng quay sè TÕt Êt Mïi 2015/QuaySoTet")
	end
	
	if nDate >= 20150723 and nDate <= 20150723 then
		tinsert(tSay,"§æi Mao Ng­u B¶o B¶o/DoiLacDa")
	end
	
	if nDate >= 20130401 and nDate < 20130405 then
		tinsert(tSay,1,"NhËn th­ëng N¹p ZingXu trùc tuyÕn/VBonus_123Pay")
	end
	
	if nDate >= 20150128 and nDate <= 20150129  then
		tinsert(tSay,"Hç trî nhËn th­ëng Khiªu ChiÕn LÖnh/HoTroKCL");
	end
	----------------------------------------------------------------------------------------------
--	if nDate >= 20091202 then
--		tinsert(tSay,1,"NhËn th­ëng Hoµng Kim LÖnh Bµi/golden_award")
--	end
	--ChÝ T«n V­¬ng LÖnh
--	tinsert(tSay,1,"ChÝ T«n V­¬ng LÖnh/CTVL_first")
	-- ****************** Quay sè Ingame th¸ng 12-2013******************
	if nDate >= 20131219 and nDate < 20140101 then
		tinsert(tSay,1,"NhËn th­ëng may m¾n/lucky_award")
	end
	if nDate >= 20120314 and nDate <= 20120504 then
		tinsert(tSay, "NhËn th­ëng Huynh §Ö Th©m Giao /get_Invite")
	end
--	if nDate >= 20120611 and nDate <= 20120715 then
--		tinsert(tSay, "Më R­¬ng ThÇn Tµi ®ãn Phiªn B¶n Míi/get_Invite")
	--end	
	
	local nDay = tonumber(date("%d"))
	local nYear = tonumber(date("%Y"))
	local nWeek = tonumber(date("%w"))
	if nDate >= 20120907 and nDate <= 20121230 then
		if  nWeek == 0 then
			tinsert(tSay,1,"Ta muèn nhËn Vinh Danh VIP JX2/vip_award")
		end
	end
	if nDate >= 20200204 and nDate <= 20200208 then			
		tinsert(tSay,1,"NhËn th­ëng Kh¶o S¸t Online: 1 thó c­ìi Linh Nghª (7 ngµy)/award_KhaoSatOnline")
	end
	if nDate == 20190515 and nServerID_Hotro ~= 123 and x == 100 then			
		tinsert(tSay,1,"§¨ng Ký ChuyÓn Server/dangkychuyenserver_chonserver")
	end
	if nDate == 20200415 then	
		tinsert(tSay,1,"TÆng 200 ®iÓm n¨ng ®éng (nhËn th­ëng miÔn phÝ)/hotrodiemnangdongpbm")	
		tinsert(tSay,1,"TÆng 2 tû ®iÓm kinh nghiÖm (nhËn th­ëng miÔn phÝ)/#hotrocongtrangpbm(2)")	
		tinsert(tSay,1,"TÆng ®iÓm c«ng tr¹ng (nhËn th­ëng miÔn phÝ)/#hotrocongtrangpbm(3)")
	end
	if nDate >= 20191203 and nDate <= 20191205 then		
		tinsert(tSay,1,"§æi vËt phÈm event th¸ng 11 thµnh vËt phÈm event th¸ng 12/thang11tothang12")
	end
	tinsert(tSay,"Ta chØ ghÐ qua/nothing")
	Say(szNpcName.."Ta chuyªn phô tr¸ch c¸c ho¹t ®éng nhËn th­ëng. C¸c h¹ cÇn ta gióp ®ì viÖc g×?",getn(tSay),tSay)
end
function award_mattich20_codeVIP_update() 
	local tbMatTich = {
		[2] = {0,107,204, 2,"Kim Cang B¸t Nh· Ch©n QuyÓn"},
		[4] = {0,107,205, 1,"TiÒm Long Tóc DiÖt Ch©n QuyÓn"},
		[3] = {0,107,206, 1,"V« TrÇn Bå §Ò Ch©n QuyÓn"},
		[6] = {0,107,207, 2,"Thiªn La Liªn Ch©u Ch©n QuyÓn"},
		[8] = {0,107,208, 1,"Nh­ ý Kim §Ønh Ch©n QuyÓn"},
		[9] = {0,107,209, 1,"BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"},
		[11] = {0,107,210, 2,"Hçn §én TrÊn Nh¹c Ch©n QuyÓn"},
		[12] = {0,107,211, 2,"Quú Thiªn Du Long Ch©n QuyÓn"},
		[14] = {0,107,212, 1,"HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"},
		[15] = {0,107,213, 2,"Qu©n Tö §íi Phong Ch©n QuyÓn"},
		[17] = {0,107,214, 2,"TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"},
		[18] = {0,107,215, 2,"Xuyªn V©n L¹c Hång Ch©n QuyÓn"},
		[20] = {0,107,216, 2,"HuyÒn Minh Phong Ma Ch©n QuyÓn"},
		[21] = {0,107,217, 1,"Linh Cæ HuyÒn Tµ Ch©n QuyÓn"},
		[23] = {0,107,218,1,"Cöu Thiªn Phong L«i Ch©n QuyÓn"},
		[25] = {0,107,219,2,"Minh gi¸o th¸nh chiÕn Ch©n QuyÓn"},
		[26] = {0,107,220,2,"Minh gi¸o trËn binh Ch©n QuyÓn"},
		[27] = {0,107,221,1,"Minh gi¸o huyÕt nh©n Ch©n QuyÓn"},
		[29] = {0,107,222,2,"Hång TrÇn Tóy Méng Ch©n QuyÓn"},
		[30] = {0,107,223,2,"Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},
		[31] = {0,107,231,2,"Mª Tung Ch©n QuyÓn"},
		[32] = {0,107,235,2,"Thiªn Phong Ch©n QuyÓn"},
	}
	local nDate = tonumber(date("%Y%m%d"))
 	if nDate > 20161231 then	
 		return 0
 	end
 	
	if gf_Judge_Room_Weight(6, 100," ") ~= 1 then
		Msg2Player("B¹n kh«ng ®ñ « trèng ®Ó nhËn th­ëng")
       	return 0
	end	
	local nCheckAward = GetExtPoint(EXT_SURVEY2016)
 	if nCheckAward < 32 then
 		PayExtPoint(EXT_SURVEY2016, GetExtPoint(EXT_SURVEY2016))
 	end
	if nCheckAward >= 32 then
		Talk(1, "", "§¹i hiÖp ®· nhËn th­ëng råi.")
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
	gf_WriteLogEx("BIG PROMOTION 12/2016", "NhËn phÇn th­ëng", 1, "NhËn th­ëng lo¹i VIP ");		
end
function award_mattich20_codeVIP()
	local nDate = tonumber(date("%Y%m%d"))
 	if nDate > 20161225 then	
 		return 0
 	end
 	
	if gf_Judge_Room_Weight(6, 100," ") ~= 1 then
		Msg2Player("B¹n kh«ng ®ñ « trèng ®Ó nhËn th­ëng")
       	return 0
	end	
	local nCheckAward = GetExtPoint(EXT_SURVEY2016)
 	if nCheckAward < 30 then
 		PayExtPoint(EXT_SURVEY2016, GetExtPoint(EXT_SURVEY2016))
 	end
	if nCheckAward >= 30 then
		Talk(1, "", "§¹i hiÖp ®· nhËn th­ëng råi.")
		return 0
	end	
	
	local nAcc = GetAccount()
	-- if nAcc == "hongdepzai1102" then --2 acc nhËn th­ëng bèc th¨m vdth nh­ng ko cã mËt tÞch
			-- AddExtPoint(EXT_SURVEY2016, 30)
			-- gf_AddItemEx2({2,1,30944,1},"LÖnh bµi hµo hiÖp","NHAN THUONG VDTH 122016","nhËn")
			-- gf_AddItemEx2({2,1,30945,1},"LÖnh bµi hµo hiÖp","NHAN THUONG VDTH 122016","nhËn")
			-- gf_AddItemEx2({2,1,30946,1},"LÖnh bµi hµo hiÖp","NHAN THUONG VDTH 122016","nhËn")
			-- gf_AddItemEx2({2,1,30973,1},"LÖnh bµi hµo hiÖp","NHAN THUONG VDTH 122016","nhËn")
		-- return 0
	-- elseif nAcc == "571985ii" then 
			-- AddExtPoint(EXT_SURVEY2016, 30)
			-- gf_AddItemEx2({0,152,31,1,1,-1,-1,-1,-1,-1,-1,-1,13},"§»ng V©n","NHAN THUONG VDTH 122016","nhËn")
			-- gf_AddItemEx2({0,153,31,1,1,-1,-1,-1,-1,-1,-1,-1,13},"§»ng V©n","NHAN THUONG VDTH 122016","nhËn")
			-- gf_AddItemEx2({0,154,31,1,1,-1,-1,-1,-1,-1,-1,-1,13},"§»ng V©n","NHAN THUONG VDTH 122016","nhËn")
		-- return 0
	-- end
	
	local tSay = {}
	tinsert(tSay, "Ph¸i ThiÕu L©m Tôc Gia - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(2)")
	tinsert(tSay, "Ph¸i ThiÕu L©m ThiÒn T«ng - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(3)")
	tinsert(tSay, "Ph¸i ThiÕu L©m Vâ T«ng - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(4)")
	tinsert(tSay, "Ph¸i §­êng M«n - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(6)")
	tinsert(tSay, "Ph¸i Nga My PhËt Gia - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(8)")
	tinsert(tSay, "Ph¸i Nga My Tôc Gia - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(9)")
	tinsert(tSay, "Ph¸i C¸i Bang TÞnh Y - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(11)")
	tinsert(tSay, "Ph¸i C¸i Bang ¤ Y - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(12)")
	tinsert(tSay, "Ph¸i Vâ §ang §¹o Gia - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(14)")
	tinsert(tSay, "Ph¸i Vâ §ang Tôc Gia - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(15)")
	tinsert(tSay, "Ph¸i D­¬ng M«n Th­¬ng Kþ - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(17)")
	tinsert(tSay, "Ph¸i D­¬ng M«n Cung Kþ - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(18)")
	tinsert(tSay, "Ph¸i Ngò §éc Tµ HiÖp - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(20)")
	tinsert(tSay, "Ph¸i Ngò §éc Cæ S­ - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(21)")
	tinsert(tSay, "Ph¸i C«n L«n Thiªn Sø - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(23)")
	tinsert(tSay, "Ph¸i Minh Gi¸o Th¸nh ChiÕn - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(25)")
	tinsert(tSay, "Ph¸i Minh Gi¸o TrËn Binh - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(26)")
	tinsert(tSay, "Ph¸i Minh Gi¸o HuyÕt Nh©n - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(27)")
	tinsert(tSay, "Ph¸i Thóy Yªn Vò Tiªn - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(29)")
	tinsert(tSay, "Ph¸i Thóy Yªn Linh N÷ - NhËn mËt tÞch 20%/#get_award_mattich20_codeVIP(30)")	
	
	tinsert(tSay,"Ta chØ ghÐ qua/nothing")
	Say(szNpcName.."Ta chuyªn phô tr¸ch c¸c ho¹t ®éng nhËn th­ëng. C¸c h¹ cÇn ta gióp ®ì viÖc g×?",getn(tSay),tSay)
end
function DoiLacDa()
	local DOILACDA = "\\script\\vng\\doitrangbi\\doilacda.lua";
	PutinItemBox("ChuyÓn ®æi trang bÞ" ,1 , "X¸c nhËn muèn thùc hiÖn chuyÓn ®æi?", DOILACDA, 1)
end

function do_military_job()
	Talk(1,"",szNpcName.."HiÖn t¹i thµnh nµy ch­a cã Nguyªn So¸i nµo chiÕm ®ãng!")
end


function vip_award()
	local nValVipP = GetBit(GetExtPoint(0),1)
	local nValVipE = GetBit(GetExtPoint(0),2)
	if nValVipE ~= 1 and nValVipP ~= 1 then
		Talk(1,"",szNpcName.."Tµi kho¶n cña c¸c h¹ kh«ng cã trong danh s¸ch nhËn th­ëng hoÆc ®· nhËn th­ëng råi!")
		return 
	end	
	if nValVipP == 1 then
		if abs(GetTask(704)) ~= 6 then
			Talk(1,"",szNpcName.."Tµi kho¶n cña c¸c h¹ kh«ng ph¶i Nguyªn So¸i nªn kh«ng thÓ nhËn th­ëng ®­îc!")
			return 
		end
		if abs(GetTask(701)) < 880000 then
			Talk(1,"",szNpcName.."Tµi kho¶n cña c¸c h¹ ph¶i cã qu©n c«ng lín h¬n 880000 míi cã thÓ nhËn th­ëng ®­îc!")
			return 
		end
	end
	if gf_Judge_Room_Weight(10, 100," ") ~= 1 then
        	return
    end	
	if PayExtPoint(0, GetExtPoint(0)) == 1 then
		gf_AddItemEx2({2,1,30369,10,4},"Cæ Linh Th¹ch","Tai khoan VIP 092012","nhËn")
		gf_AddItemEx2({2,1,30368,10,4},"Cæ Linh Th¹ch","Tai khoan VIP 092012","nhËn")
		gf_AddItemEx2({2,95,204 ,1,1},"Thiªn Cang LÖnh","Tai khoan VIP 092012","nhËn")
		gf_AddItemEx2({2,1,30071,6,1},"Nh©n S©m V¹n N¨m","Tai khoan VIP 092012","nhËn")	
		gf_AddItemEx2({2,1,1125,6,4},"B¸nh Ýt b¸t b¶o","Tai khoan VIP 092012","nhËn")		
		gf_AddItemEx2({2,1,30346,1,1},"M¶nh B¹ch Kim","Tai khoan VIP 092012","nhËn")				
		gf_WriteLogEx("Tai khoan VIP 2012", "NhËn thµnh c«ng", 1, "NhËn th­ëng account VIP")		
		--gf_EventGiveCustomAward(2,10000000,0,"Tai khoan VIP","nhËn vµng")
		--gf_EventGiveCustomAward(5,240*60,1,"Tai khoan VIP","nhËn BCH")
	end	
end


function get_solider_glory()
	if GetLevel() < 73 then
		Talk(1,"",szNpcName.."§¼ng cÊp 73 trë lªn míi cã thÓ lÜnh th­ëng!")
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."C¸c h¹ ch­a gia nhËp hÖ ph¸i kh«ng thÓ lÜnh th­ëng!")
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
		Talk(1,"",szNpcName.."§iÓm c«ng tr¹ng cña c¸c h¹ ch­a ®ñ ®Ó lÜnh th­ëng!")
		return
	end
	local nDay = tonumber(date("%d"))
	if gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_DATE) ~= nDay then
		gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_DATE,nDay)
		gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT,0)	
	end
	local nCount = gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT)
	if nCount >= 3 then
		Talk(1,"",szNpcName.."H«m nay c¸c h¹ ®· lÜnh th­ëng 3 lÇn råi!")
		return
	end
	gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT,nCount + 1)
	gf_EventGiveCustomAward(1, tGloryAwardExp[nRank][3], 1, "Vinh Danh Tuong Si","nhËn")
	if tGloryAwardExp[nRank][4] > 0 and gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT) == 3 then
		gf_AddItemEx2({2,0,1082,tGloryAwardExp[nRank][4]},"Th¸i DÞch Hçn Nguyªn C«ng §å","Vinh Danh Tuong Si","nhËn")
	end
end


function get_award_for_hklb()
	local nExtVal = GetExtPoint(4)
	if nExtVal == 1 or nExtVal == 2 or nExtVal == 3 then
		local strItem = "1 §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch"
		if nExtVal == 2 then
			strItem = "1 Thiªn Th¹ch Linh Th¹ch"
		elseif nExtVal == 3 then
			strItem = "2 Thiªn Th¹ch Linh Th¹ch"
		end
		Say(szNpcName.."Chóc mõng c¸c h¹ ®· tróng th­ëng <color=yellow>"..strItem.."<color>, cã muèn nhËn kh«ng?",2,"Ta muèn nhËn!/get_award_for_hklb_confirm","Ch­a cÇn/gf_DoNothing")	
	else
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã tªn trong danh s¸ch nhËn th­ëng hoÆc ®· nhËn th­ëng!")		
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
		Talk(1,"",szNpcName.."Thu håi CÈm Nang §¹i Sù KiÖn thµnh c«ng!")
	else
		Talk(1,"",szNpcName.."H×nh nh­ ng­¬i kh«ng cã CÈm Nang §¹i Sù KiÖn trong ng­êi?")
	end
end


function lucky_award()
	local nExtVal = GetExtPoint(EXT_QUAYSOINGAME)
	local tSay = {
		"Ta muèn thö vËn may cña m×nh/confirm_lucky_award",
		"Ta biÕt råi/nothing",
	}
	Say(szNpcName.."Trong thêi gian tõ <color=red>19/12/2013 - 31/12/2013<color>, khi quý ®ång ®¹o thùc hiÖn n¹p ZingXu vµ quy ®æi sang Xu Vâ L©m TruyÒn Kú II th× sÏ nhËn ®­îc c¸c lÇn Quay Sè NhËn Th­ëng trong game ®Ó cã c¬ héi nhËn ®­îc c¸c phÇn th­ëng may m¾n ë chç ta. HiÖn t¹i c¸c h¹ cßn <color=yellow>"..nExtVal.."<color> lÇn nhËn th­ëng.",getn(tSay),tSay)
end


function confirm_lucky_award()
	local nExtVal = GetExtPoint(EXT_QUAYSOINGAME)
	if nExtVal <= 0 then
		Talk(1, "", szNpcName.."Sè lÇn nhËn th­ëng may m¾n cña c¸c h¹ kh«ng cßn.");
		return
	end
	if gf_JudgeRoomWeight(1,100,szNpcName) == 0 then
		return
	end
	Msg2Player("§ang tiÕn hµnh quay sè...")
--	CastState("state_fetter", 4 * 18)
	DoWait(13,14,3)	
end


function IpBonus()
	local tSay = {}
	tinsert(tSay, "NhËn hiÖu qu¶ hç trî h»ng ngµy/buff_award")
	tinsert(tSay, "NhËn th­ëng mçi 1 giê trªn m¹ng/online_award")
	tinsert(tSay, "Xem thêi gian tÝch lòy/show_time")
	tinsert(tSay, "T×m hiÓu ho¹t ®éng/get_help")
	tinsert(tSay, "Ta chØ ghÐ qua/nothing")	
	Say(szNpcName.."Thêi gian trªn m¹ng cña c¸c h¹ sÏ ®­îc tÝch lòy ®Ó ®æi nh÷ng phÇn th­ëng hÊp dÉn. C¸c h¹ cÇn ta gióp ®ì viÖc g×?",getn(tSay),tSay)
end


function buff_award()
	if GetPlayerRoute() == 0 then
		Talk(1, "", szNpcName.."Ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn ®­îc chøc n¨ng hç trî");
		return
	end
	if GetTask(TASK_GET_FUZHU_DATE) >= tonumber(date("%y%m%d")) then
		Talk(1, "", szNpcName.."H«m nay c¸c h¹ ®· nhËn ®­îc chøc n¨ng hç trî råi, kh«ng thÓ tiÕp tôc nhËn thªm.");
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
	Say("Trong h«m nay c¸c h¹ nhËn ®­îc hiÖu qu¶ "..tBuff[nRandAttr][1],0)
	Msg2Player("B¹n nhËn ®­îc hiÖu qu¶ "..tBuff[nRandAttr][1]);
	
	SetTask(TASK_GET_FUZHU_TYPE,nRandAttr);
	SetTask(TASK_GET_FUZHU_DATE, tonumber(date("%y%m%d")));
end


function online_award()
	local tSay = {
		"\nNhËn phÇn th­ëng s¬ cÊp/get_low_award",
		--"\nNhËn phÇn th­ëng trung cÊp/get_med_award",
		"\nNhËn phÇn th­ëng cao cÊp/get_high_award",
		"\nNhËn phÇn th­ëng Hoµng Kim/#get_online_award(4,0)",
		"\nNhËn phÇn th­ëng B¹ch Kim/#get_online_award(5,0)",	--new
		"Ta chØ ghÐ qua/nothing",
	}
	Say(szNpcName.."C¸c h¹ chän phÇn th­ëng nµo?",getn(tSay),tSay);
end


function get_low_award()
	local tSay = {
		format("\nNhËn th­ëng kinh nghiÖm (1 giê trªn m¹ng + 1 giê B¹ch C©u Hoµn)/#get_online_award(%d,%d)",1,0),
		--format("NhËn th­ëng kinh nghiÖm vµ danh väng (1 giê trªn m¹ng + 1 giê B¹ch C©u Hoµn + 1 giê Lôc ThÇn Hoµn)/#get_online_award(%d,%d)",1,1),
		--format("NhËn th­ëng kinh nghiÖm vµ s­ m«n (1 giê trªn m¹ng + 1 giê B¹ch C©u Hoµn + 1 giê Tam Thanh Hoµn)/#get_online_award(%d,%d)",1,2),
		format("NhËn th­ëng tÊt c¶ (1 giê trªn m¹ng + 1 giê B¹ch C©u Hoµn + 1 giê Lôc ThÇn Hoµn + 1 giê Tam Thanh Hoµn)/#get_online_award(%d,%d)",1,3),
		format("NhËn th­ëng tÊt c¶ kÌm ch©n khÝ (1 giê trªn m¹ng + 1 giê B¹ch C©u Hoµn + 1 giê Lôc ThÇn Hoµn + 1 giê Tam Thanh Hoµn + 1 giê Tô Linh Hoµn)/#get_online_award(%d,%d)",1,4),
		"Ta chØ ghÐ qua/nothing",
	}	
	Say(szNpcName.."C¸c h¹ chän phÇn th­ëng nµo?",getn(tSay),tSay);
end


function get_med_award()
	local tSay = {		
		format("\nNhËn th­ëng kinh nghiÖm (1 giê trªn m¹ng + 1 giê §¹i B¹ch C©u Hoµn)/#get_online_award(%d,%d)",2,0),
		format("NhËn th­ëng kinh nghiÖm vµ danh väng (1 giê trªn m¹ng + 1 giê §¹i B¹ch C©u Hoµn + 1 giê C­êng Lôc ThÇn Hoµn)/#get_online_award(%d,%d)",2,1),
		format("NhËn th­ëng kinh nghiÖm vµ s­ m«n (1 giê trªn m¹ng + 1 giê §¹i B¹ch C©u Hoµn + 1 giê C­êng HiÖu Tam Thanh Hoµn)/#get_online_award(%d,%d)",2,2),
		format("NhËn th­ëng tÊt c¶ (1 giê trªn m¹ng + 1 giê §¹i B¹ch C©u Hoµn + 1 giê C­êng Lôc ThÇn Hoµn + 1 giê C­êng HiÖu Tam Thanh Hoµn)/#get_online_award(%d,%d)",2,3),
		"Ta chØ ghÐ qua/nothing",
	}	
	Say(szNpcName.."C¸c h¹ chän phÇn th­ëng nµo?",getn(tSay),tSay);
end


function get_high_award()
	local tSay = {		
		format("\nNhËn th­ëng kinh nghiÖm (1 giê trªn m¹ng + 1 giê B¹ch C©u Tiªn §¬n)/#get_online_award(%d,%d)",3,0),
	--	format("NhËn th­ëng kinh nghiÖm vµ danh väng (1 giê trªn m¹ng + 1 giê B¹ch C©u Tiªn §¬n + 1 giê Lôc ThÇn Tiªn §¬n)/#get_online_award(%d,%d)",3,1),
	--	format("NhËn th­ëng kinh nghiÖm vµ s­ m«n (1 giê trªn m¹ng + 1 giê B¹ch C©u Tiªn §¬n + 1 giê Tam Thanh Tiªn §¬n)/#get_online_award(%d,%d)",3,2),
		format("NhËn th­ëng tÊt c¶ (1 giê trªn m¹ng + 1 giê B¹ch C©u Tiªn §¬n + 1 giê Lôc ThÇn Tiªn §¬n + 1 giê Tam Thanh Tiªn §¬n)/#get_online_award(%d,%d)",3,3),
		format("NhËn th­ëng tÊt c¶ kÌm ch©n khÝ (1 giê trªn m¹ng + 1 giê B¹ch C©u Tiªn §¬n + 1 giê Lôc ThÇn Tiªn §¬n + 1 giê Tam Thanh Tiªn §¬n + 1 giê Tô Linh Tiªn §¬n)/#get_online_award(%d,%d)",3,4),
		"Ta chØ ghÐ qua/nothing",
	}	
	Say(szNpcName.."C¸c h¹ chän phÇn th­ëng nµo?",getn(tSay),tSay);
end


function get_online_award(nType, nChosen)
	if GetLevel() < 73 then
		Talk(1,"IpBonus",szNpcName.."§¼ng cÊp 73 trë lªn míi cã thÓ tham gia ho¹t ®éng!")
		return
	end
	IpBonusClose()	
	IpBonusStart()
	local nLevel = floor(GetLevel()/10) - 6 -- trõ 6  t­¬ng øng víi phÇn tö 1,2,3 trong b¶ng th­ëng
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
			Talk(1,"IpBonus",szNpcName.."Thêi gian trªn m¹ng cña c¸c h¹ ch­a ®ñ 6 giê!")
			return
		end
	else
		if GetOnlineTime() < 1 * 3600 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian trªn m¹ng cña c¸c h¹ ch­a ®ñ 1 giê!")
			return
		end
	end
	
	if nType == 1 then
		if nSmallBCH < 60 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c B¹ch C©u Hoµn cña c¸c h¹ kh«ng ®ñ 1 giê!")
			return
		end	
		if nChosen == 3 or  nChosen == 4 then
			if nSmallLTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Lôc ThÇn Hoµn cña c¸c h¹ kh«ng ®ñ 1 giê!!!")
				return
			end
			if nSmallTTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tam Thanh Hoµn cña c¸c h¹ kh«ng ®ñ 1 giê!")
				return
			end
		end		
		if nChosen == 4 then
			if nSmallTLH < 60 then
				Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tô Linh Hoµn cña c¸c h¹ kh«ng ®ñ 1 giê!!")
				return
			end
		end			
	elseif nType == 2 then
			Talk(1,"IpBonus",szNpcName.."TÝnh n¨ng t¹m ®ãng!")
			return
	elseif nType == 3 then
		if nExBigBCH < 60 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c B¹ch C©u Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 1 giê!")
			return
		end	
		if nChosen == 3 or  nChosen == 4 then
			if nExBigLTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Lôc ThÇn Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 1 giê!")
				return
			end
			if nExBigTTH < 60 then
				Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tam Thanh Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 1 giê!")
				return
			end
		end		
		if nChosen == 4 then
			if nExBigTLH < 60 then
				Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tô Linh Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 1 giê!")
				return
			end
		end	
	elseif nType == 4 then
		if nSmallBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c B¹ch C©u Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nSmallLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Lôc ThÇn Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end
		if nSmallTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tam Thanh Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c §¹i B¹ch C©u Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c C­êng HiÖu Lôc ThÇn Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c C­êng HiÖu Tam Thanh Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end
		if nExBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c B¹ch C©u Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nExBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Lôc ThÇn Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end
		if nExBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tam Thanh Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end
	elseif nType == 5 then
		if nSmallBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c B¹ch C©u Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nSmallLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Lôc ThÇn Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end
		if nSmallTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tam Thanh Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nSmallTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tô Linh Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end			
		if nBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c §¹i B¹ch C©u Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c C­êng HiÖu Lôc ThÇn Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c C­êng HiÖu Tam Thanh Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end
		if nBigTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c §¹i Tô Linh Hoµn cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end		
		if nExBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c B¹ch C©u Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end	
		if nExBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Lôc ThÇn Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end
		if nExBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tam Thanh Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end		
		if nExBigTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."Thêi gian ñy th¸c Tô Linh Tiªn §¬n cña c¸c h¹ kh«ng ®ñ 8 giê!")
			return
		end				
	else
		Talk(1,"IpBonus",szNpcName.."Ho¹t ®éng ch­a hç trî phÇn th­ëng lo¹i nµy!")
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
			Msg2Player("B¹n nhËn ®­îc 7.900.000 ®iÓm kinh nghiÖm.")
			SetTask(336,GetTask(336) + 120)
			Msg2Player("B¹n nhËn ®­îc 120 ®iÓm s­ m«n.")
			ModifyReputation(120,0)				
			Earn(790000)
			if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + 68)
				Msg2Player("B¹n nhËn ®­îc 68 ®iÓm c«ng tr¹ng.")	
			else	
				SetTask(701, GetTask(701) - 68)
				Msg2Player("B¹n nhËn ®­îc 68 ®iÓm c«ng tr¹ng.")	
			end
			if MeridianGetLevel() >= 1 then
				AwardGenuineQi(2900)
			end
			 gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho¹t thµnh c«ng", 1, "TÝch lòy online B¹ch Kim ")
			online_award()
		end
		return
	end
	if SetOnlineTime(3600,2) >= 0 then	
		if nType == 1 then
			if nChosen == 0 then
				SetTask(2501,nSmallBCH - 60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho¹t thµnh c«ng", 1, "TÝch lòy online SCÊp exp ")							
			elseif nChosen == 3 then
				SetTask(2501,nSmallBCH - 60)
				EatLiushen(1,-60)
				EatSanqin(1,-60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho¹t thµnh c«ng", 1, "TÝch lòy online SCÊp all ")		
			elseif nChosen == 4 then
				SetTask(2501,nSmallBCH - 60)
				EatLiushen(1,-60)
				EatSanqin(1,-60)
				SetTask(3105,nSmallTLH - 60, 8)
				if MeridianGetLevel() >= 1 then
					AwardGenuineQi(66)
				end
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho¹t thµnh c«ng", 1, "TÝch lòy online SCÊp all & ch©n khÝ ")		
			else
				Talk(1,"IpBonus",szNpcName.."Ho¹t ®éng ch­a hç trî phÇn th­ëng lo¹i nµy!")
				return	
			end
			ModifyExp(tOnlineAward[nType][nChosen][1])	--kinh nghiÖm
			Msg2Player("B¹n nhËn ®­îc "..tOnlineAward[nType][nChosen][1].." ®iÓm kinh nghiÖm.")						
			ModifyReputation(tOnlineAward[nType][nChosen][2],0)		--danh väng
			SetTask(336,GetTask(336) + tOnlineAward[nType][nChosen][3])		--s­ m«n
			if nChosen ~= 0 then
				Msg2Player("B¹n nhËn ®­îc "..tOnlineAward[nType][nChosen][3].." ®iÓm s­ m«n.")					
			end
			Earn(tOnlineAward[nType][nChosen][6] * 10000)	--vµng
		
			online_award()	
		elseif nType == 2 then
			online_award()
		elseif nType == 3 then
			if nChosen == 0 then
				SetTask(2508,nExBigBCH - 60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho¹t thµnh c«ng", 1, "TÝch lòy online Cao CÊp exp ")							
			elseif nChosen == 3 then
				SetTask(2508,nExBigBCH - 60)
				EatLiushen(3,-60)
				EatSanqin(3,-60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho¹t thµnh c«ng", 1, "TÝch lòy online Cao CÊp all ")	
				if GetTask(701) >= 0 then
					SetTask(701, GetTask(701) + tOnlineAward[nType][nChosen][4])
					Msg2Player("B¹n nhËn ®­îc "..tOnlineAward[nType][nChosen][4].." ®iÓm c«ng tr¹ng.")				
				else
					SetTask(701, GetTask(701) -  tOnlineAward[nType][nChosen][4])
					Msg2Player("B¹n nhËn ®­îc "..tOnlineAward[nType][nChosen][4].." ®iÓm c«ng tr¹ng.")					
				end	
			elseif nChosen == 4 then
				SetTask(2508,nExBigBCH - 60)
				EatLiushen(3,-60)
				EatSanqin(3,-60)
				SetTask(3107, nExBigTLH - 60, 8)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho¹t thµnh c«ng", 1, "TÝch lòy online Cao CÊp all & ch©n khÝ ")
				if GetTask(701) >= 0 then
					SetTask(701, GetTask(701) + tOnlineAward[nType][nChosen][4])
					Msg2Player("B¹n nhËn ®­îc "..tOnlineAward[nType][nChosen][4].." ®iÓm c«ng tr¹ng.")				
				else
					SetTask(701, GetTask(701) -  tOnlineAward[nType][nChosen][4])
					Msg2Player("B¹n nhËn ®­îc "..tOnlineAward[nType][nChosen][4].." ®iÓm c«ng tr¹ng.")					
				end	
				if MeridianGetLevel() >= 1 then
					AwardGenuineQi(199)
				end						
			else
				Talk(1,"IpBonus",szNpcName.."Ho¹t ®éng ch­a hç trî phÇn th­ëng lo¹i nµy!")
				return	
			end
			ModifyExp(tOnlineAward[nType][nChosen][1])	--kinh nghiÖm
			Msg2Player("B¹n nhËn ®­îc "..tOnlineAward[nType][nChosen][1].." ®iÓm kinh nghiÖm.")						
			ModifyReputation(tOnlineAward[nType][nChosen][2],0)		--danh väng
			SetTask(336,GetTask(336) + tOnlineAward[nType][nChosen][3])		--s­ m«n
			if nChosen ~= 0 then
				Msg2Player("B¹n nhËn ®­îc "..tOnlineAward[nType][nChosen][3].." ®iÓm s­ m«n.")	
			end
			Earn(tOnlineAward[nType][nChosen][6] * 10000)	--vµng
		
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
			Msg2Player("B¹n nhËn ®­îc 7.200.000 ®iÓm kinh nghiÖm.")
			SetTask(336,GetTask(336) + 120)
			Msg2Player("B¹n nhËn ®­îc 120 ®iÓm s­ m«n.")
			ModifyReputation(120,0)				
			Earn(720000)
			if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + 60)
				Msg2Player("B¹n nhËn ®­îc 60 ®iÓm c«ng tr¹ng.")	
			else	
				SetTask(701, GetTask(701) - 60)
				Msg2Player("B¹n nhËn ®­îc 60 ®iÓm c«ng tr¹ng.")	
			end
			 gf_WriteLogEx("TICH LUY ONLINE NEW", "kick ho¹t thµnh c«ng", 1, "TÝch lòy online Hoµng Kim")
			online_award()
		else
			Talk(1,"IpBonus",szNpcName.."Ho¹t ®éng ch­a hç trî phÇn th­ëng lo¹i nµy!")
			return
		end		
	end	
end

function day_award()
	local tSay = {
		format("NhËn phÇn th­ëng vËt phÈm thu thËp/#get_day_award(%d)",1),
		format("NhËn phÇn th­ëng vËt phÈm qu©n dông/#get_day_award(%d)",2),
		format("NhËn phÇn th­ëng Tµng KiÕm Anh Hïng ThiÕp/#get_day_award(%d)",3),
		"Ta chØ ghÐ qua/nothing",
	}	
	Say(szNpcName.."C¸c h¹ chän phÇn th­ëng nµo?",getn(tSay),tSay);
end

function get_day_award(nType)
	Talk(1,"","TÝnh n¨ng nhËn th­ëng ®· ®ãng ngµy l©u råi")
	do return end
	if GetLevel() < 73 then
		Talk(1,"IpBonus",szNpcName.."§¼ng cÊp 73 trë lªn míi cã thÓ tham gia ho¹t ®éng!")
		return
	end
	
	local nDate = tonumber(date("%Y%m%d"))	
	if GetTask(TASK_GET_DAY_AWARD) == nDate then
		Talk(1,"IpBonus",szNpcName.."H«m nay c¸c h¹ ®æi phÇn th­ëng nµy råi. Mçi ngµy chØ ®­îc ®æi 1 lÇn.")
		return
	end
	
	
	if GetTask(TASK_FULL_8_HOUR) ~= 1 then
		Talk(1,"IpBonus",szNpcName.."Thêi gian trªn m¹ng cña c¸c h¹ ch­a ®ñ 8 giê!")
		return
	end		

	if GetFreeItemRoom() < 2 then
		Talk(1,"IpBonus",szNpcName.."Hµnh trang c¸c h¹ kh«ng ®ñ 2 « trèng.")
		return
	end	
	
	local nLevel = floor(GetLevel()/10) - 6 -- trõ 6  t­¬ng øng víi phÇn tö 1,2,3 trong b¶ng th­ëng		
	SetTask(TASK_GET_DAY_AWARD,nDate)
	SetTask(TASK_FULL_8_HOUR,2)
	local nRet, nItemIdx = gf_AddItemEx(tDayAward[nType][nLevel][2], tDayAward[nType][nLevel][1] )
	WriteLogEx("IP Bonus","nhËn","",tDayAward[nType][nLevel][1])			
	if nType == 3 and nRet == 1 then
		SetItemExpireTime(nItemIdx,2 * 24 * 3600)
	end
end

function show_time()
	IpBonusClose()	
	local nHour, nMin, nSec = ShowTime()
	local strMsg = format("%sThêi gian trªn m¹ng cña c¸c h¹ lµ: <color=yellow>%d giê %d phót %d gi©y<color>.",szNpcName,nHour, nMin, nSec)
	IpBonusStart()
	Talk(1,"IpBonus",strMsg)
end

function get_help()
	local tSay = {
		format("%sThêi gian nh©n vËt trªn m¹ng sÏ ®­îc tÝch lòy liªn tôc. Nh©n vËt cã thÓ sö dông 2 giê  trªn m¹ng ®Ó ®æi c¸c lo¹i phÇn th­ëng. PhÇn th­ëng bao gåm kinh nghiÖm, danh väng, ®iÓm s­ m«n vµ vµng. <color=red>Chó ý: nÕu chän nhËn th­ëng tÊt c¶, sè l­îng phÇn th­ëng sÏ nhiÒu h¬n. Mçi nh©n vËt chØ cã thÓ tÝch lòy ®­îc 8 giê trªn m¹ng, sau khi ®æi th­ëng th× thêi gian tiÕp tôc ®­îc tÝch lòy<color>.",szNpcName),
		format("%sNÕu tÝch lòy ®ñ 8 giê trªn m¹ng, nh©n vËt cã thÓ ®æi ®­îc c¸c lo¹i vËt phÈm thu thËp, vËt phÈm qu©n dông hoÆc Anh Hïng ThiÕp (kh«ng thÓ giao dÞch, h¹n tån t¹i 2 ngµy). <color=red>Chó ý: mçi ngµy nh©n vËt chØ cã thÓ ®æi 1 lÇn<color>.",szNpcName),
		format("%sNgoµi ra, nh©n vËt cßn cã thÓ nhËn ®­îc hiÖu qu¶ hç trî ngÉu nhiªn h»ng ngµy. <color=red>Chó ý: sau 24 giê h»ng ngµy, hiÖu qu¶ sÏ biÕn mÊt. Mçi ngµy nh©n vËt chØ cã thÓ nhËn hiÖu qu¶ hç trî 1 lÇn<color>.",szNpcName),
	}
	TalkEx("IpBonus",tSay)
end

function nothing()
end

tbMoiBanCungChoi = {
	[1] = {{0, 100, 8055}, {0, 101, 8055},{0, 103, 8055}, "Set Thiªn Chi Viªm §Õ"},
	[2] = {
				{"Ph¸ Yªn ®ao", {0, 3, 6001,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Ph¸ Yªn c«n", {0, 5, 6002,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Phï Yªn tr­îng", {0, 8, 6003,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Hµm Yªn thñ", {0, 0, 6004,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Tµng Yªn ch©m", {0, 1, 6005,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Phi Yªn kiÕm", {0, 2, 6006,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"VËn Yªn cÇm", {0, 10, 6007,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"V©n Yªn thñ", {0, 0, 6008,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"L­u Yªn c«n", {0, 5, 6009,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"HuyÒn Yªn kiÕm", {0, 2, 6010,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Vò Yªn bót", {0, 9, 6011,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Hµ Tiªm Th­¬ng", {0, 6, 6012,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Hµnh Yªn Cung", {0, 4, 6013,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Träc Yªn nhÉn", {0, 7, 6014,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
				{"Yªu Yªn tr¶o", {0, 11, 6015,1,1, -1,-1, -1, -1, -1, -1, -1,10}},
			},
	[3] = {{2,1,9977,8}, "Qu©n c«ng Huy Hoµng", 7*24*60*60},
	[4] = {{2,1,9998,8}, "Qu©n c«ng §¹i", 7*24*60*60},
	[5] = {{2,1,30087,5}, "Tói h¹t gièng", 7*24*60*60},
	[6] = {{2,1,1008,1}, "B¹ch C©u Tiªn ®¬n", 7*24*60*60},
}
tbMoRuongThanTai = {
		[4] = {"Tói Thiªn Th¹ch Tinh Th¹ch",{2,1,3356,1}, 7*24*60*60 },
		[5] = {"Qu©n C«ng Huy Hoµng",{2,1,9977,1}, 7*24*60*60 },
		[6] = {"Thiªn Th¹ch Tinh Th¹ch",{2,1,1009,1}},
		[7] = {"Chiªm Y Phæ",{0,107,66,1}},
	}

function get_Invite()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H·y chän phÇn th­ëng."
	
	tinsert(tbSayDialog, "- NhËn 1 bé trang bÞ Thiªn Chi Viªm §Õ [+10]/#get_TCVD_new(10)")
	tinsert(tbSayDialog, "- NhËn 1 bé trang bÞ Viªm §Õ [+13]/#get_VD(13)")
	tinsert(tbSayDialog, "- NhËn 1 mËt tÞch cao cÊp theo hÖ ph¸i/#get_Award(3)")	
	tinsert(tbSayDialog, "- NhËn 1 tói Thiªn Th¹ch Tinh Th¹ch/#get_Award(4)")	
	tinsert(tbSayDialog, "- NhËn 1 qu©n c«ng Huy Hoµng/#get_Award(5)")	
	tinsert(tbSayDialog, "- NhËn 1 Thiªn Th¹ch Tinh Th¹ch/#get_Award(6)")	
	tinsert(tbSayDialog, "- NhËn 1 Chiªm Y Phæ/#get_Award(7)")	
	
	
	--tinsert(tbSayDialog, "- NhËn 1 vò khÝ ViÖt Yªn [+10]/get_vukhi")
	--tinsert(tbSayDialog, "- NhËn 8 qu©n c«ng Huy Hoµng/#get_prize(3)")
	--tinsert(tbSayDialog, "- NhËn 8 qu©n c«ng §¹i/#get_prize(4)")
	--tinsert(tbSayDialog, "- NhËn 5 Tói h¹t gièng/#get_prize(5)")
	--tinsert(tbSayDialog, "- NhËn 1 B¹ch CÇu Tiªn §¬n/#get_prize(6)")
	tinsert(tbSayDialog, "Ta chØ ghÐ qua/nothing")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

function get_TCVD()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H·y chän phÇn th­ëng."
	
	tinsert(tbSayDialog, "- Nam Tiªu ChuÈn/#get_prize(1,1)")
	tinsert(tbSayDialog, "- Nam Kh«i Ng«/#get_prize(1,2)")
	tinsert(tbSayDialog, "- N÷ Gîi C¶m/#get_prize(1,3)")
	tinsert(tbSayDialog, "- KiÒu N÷/#get_prize(1,4)")
	tinsert(tbSayDialog, "Trë l¹i/get_Invite")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


function get_vukhi()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H·y chän vò khÝ cÇn nhËn."
	
	tinsert(tbSayDialog, "- Ph¸ Yªn ®ao/#get_prize(2,1)")
	tinsert(tbSayDialog, "- Ph¸ Yªn c«n/#get_prize(2,2)")
	tinsert(tbSayDialog, "- Phï Yªn tr­îng/#get_prize(2,3)")
	tinsert(tbSayDialog, "- Hµm Yªn thñ/#get_prize(2,4)")
	tinsert(tbSayDialog, "- Tµng Yªn ch©m/#get_prize(2,5)")
	tinsert(tbSayDialog, "- Phi Yªn kiÕm/#get_prize(2,6)")
	tinsert(tbSayDialog, "- VËn Yªn cÇm/#get_prize(2,7)")
	tinsert(tbSayDialog, "- V©n Yªn thñ/#get_prize(2,8)")
	tinsert(tbSayDialog, "- L­u Yªn c«n/#get_prize(2,9)")
	tinsert(tbSayDialog, "- HuyÒn Yªn kiÕm/#get_prize(2,10)")
	tinsert(tbSayDialog, "- Vò Yªn bót/#get_prize(2,11)")
	tinsert(tbSayDialog, "- Hµ Tiªm Th­¬ng/#get_prize(2,12)")
	tinsert(tbSayDialog, "- Hµnh Yªn Cung/#get_prize(2,13)")
	tinsert(tbSayDialog, "- Träc Yªn nhÉn/#get_prize(2,14)")
	tinsert(tbSayDialog, "- Yªu Yªn tr¶o/#get_prize(2,15)")
	tinsert(tbSayDialog, "Trë l¹i/get_Invite")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

function get_prize(nGetType, nSelected)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	if nGetType == 0 then
		return 0;
	end	
	if gf_Judge_Room_Weight(10, 500, "") == 0 then
        return 0;
    	end	
	if gf_GetExtPointByte(1,2) <= 0 then
		Talk(1, "", "§¹i hiÖp ch­a kÝch ho¹t code hoÆc ®· nhËn th­ëng råi nªn kh«ng thÓ nhËn th­ëng ®­îc n÷a!!!")
		return
	end
	if nGetType == 1 then
		if  gf_GetExtPointByte(1,2) == 1 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
					nP = 8055 + nSelected - 1		
					gf_AddItemEx2({0, 100, nP,1,1, -1,-1, -1, -1, -1, -1, -1,10}, tbMoiBanCungChoi[nGetType][4], szLogTitle, "nhËn thµnh c«ng")	
					gf_AddItemEx2({0, 101, nP,1,1, -1,-1, -1, -1, -1, -1, -1,10}, tbMoiBanCungChoi[nGetType][4], szLogTitle, "nhËn thµnh c«ng")			
					gf_AddItemEx2({0, 103, nP,1,1, -1,-1, -1, -1, -1, -1, -1,10}, tbMoiBanCungChoi[nGetType][4], szLogTitle, "nhËn thµnh c«ng")													
			end
		else
			Talk(1, "", "§¹i hiÖp ®· chän kh«ng ®óng víi phÇn th­ëng ®· tróng khi quay sè, xin mêi chän l¹i!!!")
		end
	end
	
	if nGetType == 2 then
		if  gf_GetExtPointByte(1,2) == 2 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
					local nChoose = tbMoiBanCungChoi[nGetType][nSelected][2]
					gf_AddItemEx2(nChoose, tbMoiBanCungChoi[nGetType][nSelected][1], szLogTitle, "nhËn thµnh c«ng")											
			end
		else
			Talk(1, "", "§¹i hiÖp ®· chän kh«ng ®óng víi phÇn th­ëng ®· tróng khi quay sè, xin mêi chän l¹i!!!")
		end
	end
	
	if nGetType == 3 then
		if  gf_GetExtPointByte(1,2) == 3 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
				gf_AddItemEx2(tbMoiBanCungChoi[nGetType][1], tbMoiBanCungChoi[nGetType][2], szLogTitle, "nhËn thµnh c«ng", tbMoiBanCungChoi[nGetType][3])			
			end
		else
			Talk(1, "", "§¹i hiÖp ®· chän kh«ng ®óng víi phÇn th­ëng ®· tróng khi quay sè, xin mêi chän l¹i!!!")
		end
	end
	if nGetType == 4 then
		if  gf_GetExtPointByte(1,2) == 4 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
				gf_AddItemEx2(tbMoiBanCungChoi[nGetType][1], tbMoiBanCungChoi[nGetType][2], szLogTitle, "nhËn thµnh c«ng", tbMoiBanCungChoi[nGetType][3])			
			end
		else
			Talk(1, "", "§¹i hiÖp ®· chän kh«ng ®óng víi phÇn th­ëng ®· tróng khi quay sè, xin mêi chän l¹i!!!")
		end
	end
	if nGetType == 5 then
		if  gf_GetExtPointByte(1,2) == 5 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
				gf_AddItemEx2(tbMoiBanCungChoi[nGetType][1], tbMoiBanCungChoi[nGetType][2], szLogTitle, "nhËn thµnh c«ng", tbMoiBanCungChoi[nGetType][3])			
			end
		else
			Talk(1, "", "§¹i hiÖp ®· chän kh«ng ®óng víi phÇn th­ëng ®· tróng khi quay sè, xin mêi chän l¹i!!!")
		end
	end
	if nGetType == 6 then
		if  gf_GetExtPointByte(1,2) == 6 then
			if gf_SetExtPointByte(1, 2, 0) == 1 then
				gf_AddItemEx2(tbMoiBanCungChoi[nGetType][1], tbMoiBanCungChoi[nGetType][2], szLogTitle, "nhËn thµnh c«ng", tbMoiBanCungChoi[nGetType][3])			
			end
		else
			Talk(1, "", "§¹i hiÖp ®· chän sai phÇn th­ëng, xin mêi chän l¹i!!!")
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
		{0,103,8000,"Viªm §Õ Kh«i"},
		{0,100,8000,"Viªm §Õ Gi¸p"},
		{0,101,8000,"Viªm §Õ Trang"},
	}
	local nBody = GetBody()
	local nCheck  = Check_Award()
	if nCheck ~= 2 then
		Talk(1, "", "§¹i hiÖp ®· chän sai phÇn th­ëng, xin mêi chän l¹i!!!")
		return 0
	end
	if gf_Judge_Room_Weight(5, 100," ") ~= 1 then
        	return
    end	
	PayExtPoint(6, GetExtPoint(6))
	
	for i = 1 , getn(VD) do
		gf_AddItemEx2({VD[i][1],VD[i][2],VD[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nLv},VD[i][4],"Mo Ruong Than Tai","nhËn th­ëng VD thµnh c«ng")
	end
end
function get_TCVD_new(nLv)
	local TCVD =
	{
		{0,103,8054,"Thiªn Chi Viªm §Õ Kh«i"},
		{0,100,8054,"Thiªn Chi Viªm §Õ Gi¸p"},
		{0,101,8054,"Thiªn Chi Viªm §Õ Trang"},
	}
	local nBody = GetBody()
	local nCheck  = Check_Award()
	if nCheck ~= 1 then
		Talk(1, "", "§¹i hiÖp ®· chän sai phÇn th­ëng, xin mêi chän l¹i!!!")
		return 0
	end
	if gf_Judge_Room_Weight(5, 100," ") ~= 1 then
        	return
    end		
	PayExtPoint(6, GetExtPoint(6))
	for i = 1 , getn(TCVD) do
		gf_AddItemEx2({TCVD[i][1],TCVD[i][2],TCVD[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nLv},TCVD[i][4],"Mo Ruong Than Tai","nhËn th­ëng TCVD thµnh c«ng")
	end
end
function get_Award(nType)
	local nCheck  = Check_Award()
	local nRoute = GetPlayerRoute()
	if nType == 3 then	
		if nRoute <= 0 then
			Talk(1, "", "§¹i hiÖp ch­a gia nhËp hÖ ph¸i nªn kh«ng thÓ nhËn th­ëng !!!")
			return 0
		end
	end
	if nCheck ~= nType then
		Talk(1, "", "§¹i hiÖp ®· chän sai phÇn th­ëng, xin mêi chän l¹i!!!")
		return 0
	end
	if gf_Judge_Room_Weight(5, 100," ") ~= 1 then
        	return
    end		
	PayExtPoint(6, GetExtPoint(6))

	if nType == 3 then
		gf_AddItemEx2(VET_70_GAOJIMIJI_NEW[nRoute][2], VET_70_GAOJIMIJI_NEW[nRoute][1], "Mo Ruong Than Tai", "nhËn th­ëng thµnh c«ng")
	elseif nType == 4 or nType == 5 then
		gf_AddItemEx2(tbMoRuongThanTai[nType][2], tbMoRuongThanTai[nType][1], "Mo Ruong Than Tai", "nhËn th­ëng thµnh c«ng", tbMoRuongThanTai[nType][3])
	elseif nType == 6 or nType == 7 then
			gf_AddItemEx2(tbMoRuongThanTai[nType][2], tbMoRuongThanTai[nType][1], "Mo Ruong Than Tai", "nhËn th­ëng thµnh c«ng")
	
	end
--tbMoRuongThanTai
end


function VBonusMenu()
	do return 0 end
	local nDate = tonumber(date("%Y%m%d"))
	local tbSay = {}
	tinsert(tbSay,"KÝch ho¹t cÊp ®é 81/ChonPheVBonus")
	tinsert(tbSay,"NhËn th­ëng ®¼ng cÊp 83/#NhanThuongVBonus(83)")
	tinsert(tbSay,"NhËn th­ëng ®¼ng cÊp 86/#NhanThuongVBonus(86)")
	tinsert(tbSay,"NhËn th­ëng ®¼ng cÊp 89/#NhanThuongVBonus(89)")
	tinsert(tbSay,"NhËn th­ëng ®¼ng cÊp 91/#NhanThuongVBonus(91)")
	tinsert(tbSay,"NhËn th­ëng ®¼ng cÊp 96/#NhanThuongVBonus(96)")
	tinsert(tbSay,"NhËn th­ëng ®¼ng cÊp 98/#NhanThuongVBonus(98)")
	tinsert(tbSay,"NhËn th­ëng ®¼ng cÊp 99/#NhanThuongVBonus(99)")
	tinsert(tbSay,"Ta chØ ghÐ xem th«i/gf_DoNothing")
	Say(szNpcName .."Ta lµ ng­êi chÞu tr¸ch nhiÖm trao phÇn th­ëng ch­¬ng tr×nh V-Bonus cho c¸c h¹", getn(tbSay), tbSay)
end


function ChonPheVBonus()
	tbSay = {}
	tinsert(tbSay, "Ta muèn chän phe Tèng/#KichHoatVBonus(1)")
	tinsert(tbSay, "Ta muèn chän phe Liªu/#KichHoatVBonus(2)")
	tinsert(tbSay, "Ta cÇn suy nghÜ thªm/gf_DoNothing")
	Say("C¸c h¹ h·y chän cho m×nh phe ph¸i thÝch hîp.", getn(tbSay), tbSay)
end


function KichHoatVBonus(nPhe)
	local nVB = GetExtPoint(EXT_VBONUS)
	if GetBit(nVB,1) == 0 then
		Talk(1,"",szNpcName .."Tµi kho¶n c¸c h¹ ch­a ®­îc chñ phßng m¸y kÝch ho¹t.")
		return 0
	end
	if GetBit(nVB,2) == 1 then
		Talk(1,"",szNpcName .."Tµi kho¶n c¸c h¹ ®· hÕt h¹n nhËn th­ëng.")
		return 0
	end
	if GetBit(nVB,3) == 1 then
		Talk(1,"",szNpcName .."Tµi kho¶n c¸c h¹ ®· kÝch ho¹t cÊp ®é 81 råi.")
		return 0
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."§¹i hiÖp ch­a gia nhËp hÖ ph¸i, ta kh«ng thÓ gióp g× ®­îc...")
		return 0
	end
	if GetLevel() >= 81 then
		Talk(1,"",szNpcName.."§¼ng cÊp c¸c h¹ ®· qu¸ cao, ta kh«ng thÓ gióp g× ®­îc...")
		return 0
	end
--	if gf_Judge_Room_Weight(7,100) ~= 1 then
--		Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.")
--		return 0
--	end
	
--	nVB = SetBit(nVB,3,1)
--	PayExtPoint(EXT_VBONUS,GetExtPoint(EXT_VBONUS))
--	AddExtPoint(EXT_VBONUS, nVB)
	VNG_SetExtBit(EXT_VBONUS,3,1)
	gf_WriteLogEx("NHAN THUONG VBONUS","nhËn",1,"PhÇn th­ëng kÝch ho¹t")
	SetLevel(81,0)
	SetTask(336,GetTask(336) + 2000)
	Msg2Player("Cèng hiÕn s­ m«n t¨ng 2000 ®iÓm.")
	ModifyReputation(2000,0)
	SetTask(TSK_nvVBonus, 1) --task x¸c ®Þnh b¾t ®Çu ®Ó b¾t lµm nhiÖm vô VBonus
	if nPhe == 1 then
		SetTask(701,GetTask(701)+3000)
	else
		local nCongTrang = GetTask(701)
		nCongTrang = -nCongTrang
		SetTask(701,nCongTrang-3000)
	end
	Msg2Player("C«ng tr¹ng t¨ng 3000 ®iÓm.")
--	local tbItem = {item={{gdp={2,1,30340,6789}, name = "Méc R­¬ng"}}}
--	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
--	LIB_Award.szLogAction = "nhËn"
--	LIB_Award:Award(tbItem)
	Talk(1,"","§¼ng cÊp cña c¸c h¹ ®· t¨ng ®Õn 81, vui lßng ®¨ng nhËp l¹i ®Ó cã hiÖu lùc.")
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
		tinsert(tbSay, "Mua "..tbVBonusItemShop[i][1].." ("..tbVBonusItemShop[i][3].." xu vËt phÈm)/#VBonusShop_Buy("..i..")")
	end
	tinsert(tbSay,"Ta chØ muèn ghÐ xem/gf_DoNothing")
	Say(szNpcName.."Ta cã l« hµng gi¸ ®Æc biÖt, chØ dµnh riªng cho b»ng h÷u ®· kÝch ho¹t VBonus, c¸c h¹ h·y xem thö...", getn(tbSay), tbSay)
end


function VBonusShop_Buy(nOption)
	do return 0 end
	
	local nVB = GetExtPoint(EXT_VBONUS)
	if GetBit(nVB,1) == 0 then
		Talk(1,"",szNpcName.."ChØ cã b»ng h÷u tham gia ch­¬ng tr×nh VBonus míi ®­îc mua l« hµng nµy.");
		return 0
	end
	if gf_Judge_Room_Weight(1, 100," ") ~= 1 then
		Talk(1,"",szNpcName.."Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
		return 0
	end
	local szName = tbVBonusItemShop[nOption][1]
	local tbItem = tbVBonusItemShop[nOption][2]
	local nPrize = tbVBonusItemShop[nOption][3]
	local nMax = tbVBonusItemShop[nOption][4]
	local nPos = tbVBonusItemShop[nOption][5]
	local nQty = GetTaskPosition(TSK_VBONUS_SaleOff, nPos)
	if nQty >= nMax then
		Talk(1,"",szNpcName.."B»ng h÷u ®· mua ®ñ <color=red>"..nMax.."<color> <color=yellow>"..szName.."<color> trong ngµy, mai h·y quay l¹i nhÐ.");
		return 0
	end
	if GetItemCount(2,1,30230) < nPrize then
		Talk(1,"",szNpcName.."B»ng h÷u kh«ng ®em ®ñ <color=yellow>"..nPrize.." xu vËt phÈm<color>, h·y chuÈn bÞ thªm.");
		return 0
	end
	
	if DelItem(2,1,30230, nPrize) == 1 then
		gf_AddItemEx2(tbItem, szName,"MUA VAT PHAM VBONUS","nhËn", 7*24*60*60)
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
		[89] = {item={{gdp={0,105,10107,1,1,-1,-1,-1,-1,-1,-1,-1}, name = "ThiÕu D­¬ng KiÕm", nExpired = 14*24*60*60}}, fn = "VBonus_NhanThuong89()", nPetExp = 300, nChankhi = 15000},
		[91] = {item={{gdp={2,1,1068,1,4}, name = "Thiªn Th¹ch Linh Th¹ch", nExpired = 30*24*60*60}}, nPetExp = 300, nPetLinhluc = 200, nChankhi = 15000},
		[96] = {item={{gdp={2,1,1067,1,4}, name = "§Þnh hån thiªn th¹ch", nExpired = 30*24*60*60}},nPetExp = 300, nPetLinhluc = 200, nChankhi = 20000},
		[98] = {item={
								{gdp={2,0,1082,1000}, name = "M¶nh Th¸i DÞch"},
								{gdp={2,1,9977,2,4}, name = "Qu©n C«ng Huy Hoµng", nExpired = 7*24*60*60},
							}
							, nChankhi = 20000, nGold = 10000000},
		[99] = {item={
					{gdp={2,1,30345,1,1}, name = "ChuyÓn Sinh §¬n", nExpired = 60*24*3600},
					{gdp={2,1,1113,1,4}, name = "§¹i §Þnh Hån", nExpired = 30*24*60*60},
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
		Talk(1,"",szNpcName .."Tµi kho¶n c¸c h¹ ch­a ®­îc chñ phßng m¸y kÝch ho¹t.")
		return 0
	end
	if GetBit(nVB,2) == 1 then
		Talk(1,"",szNpcName .."Tµi kho¶n c¸c h¹ ®· hÕt h¹n nhËn th­ëng.")
		return 0
	end
	if GetBit(nVB,tbCondition[nOption]["nPos"]) == 1 then
		Talk(1,"",szNpcName .."C¸c h¹ ®· nhËn th­ëng cÊp ®é ".. nOption .." råi.")
		return 0
	end
	if GetLevel() < nOption then
		Talk(1,"",szNpcName.."B»ng h÷u kh«ng ®ñ ®¼ng cÊp nhËn th­ëng, h·y cè g¾ng thªm.");
		return 0
	end
	vb_tbRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [25] = 1, [26] = 1, [27] = 1, [29] = 1,[30] = 1,[31] = 1,[32] = 1}
	local nRoute = GetPlayerRoute()
	if vb_tbRoute [nRoute] ~= 1 then
		Talk(1, "", " Ch­a gia nhËp hÖ ph¸i, kh«ng thÓ nhËn th­ëng.");
		return 0
	end
	local nTaskNhiemVu_check = mod(GetTask(TSK_nvVBonus),10)	
	if nTaskNhiemVu_check ~= tbTaskCondition[nOption][1] then
		Talk(1,"",szNpcName.."B»ng h÷u ch­a nhËn th­ëng cÊp tr­íc ®ã.");
		return 0
	end
	if nOption == 99  then
		if TopCheckSkill(20) == 0 then
			Talk(1, "", szNpcName.."C¸c h¹ ch­a luyÖn thµnh vâ c«ng trÊn ph¸i 20 cÊp.");
			return 0
		end
		if abs(GetTask(701)) < 180000 then
			Talk(1, "", szNpcName.."§iÓm c«ng tr¹ng ch­a ®ñ 180000, ch­a thÓ nhËn th­ëng..");
			return 0
		end
		if GetReputation() < 15000 then
			Talk(1, "", szNpcName.."§iÓm danh väng ch­a ®ñ 15000, ch­a thÓ nhËn th­ëng..");
			return 0
		end
		if GetTask(336) < 15000 then
			Talk(1, "", szNpcName.."§iÓm s­ m«n ch­a ®ñ 15000, ch­a thÓ nhËn th­ëng..");
			return 0
		end
	end
	if nOption >= 88  then
		if TopCheckSkill(10) == 0 then
			Talk(1, "", szNpcName.."C¸c h¹ ch­a luyÖn thµnh vâ c«ng trÊn ph¸i 10 cÊp.");
			return 0
		end
	end
	if gf_Judge_Room_Weight(tbCondition[nOption]["nSlot"], tbCondition[nOption]["nWeight"]) ~= 1 then
		Talk(1,"",szNpcName.."B»ng h÷u kh«ng ®ñ ".. tbCondition[nOption]["nSlot"] .." « hµnh trang, "..tbCondition[nOption]["nWeight"].." søc lùc, h·y s¾p xÕp l¹i nhÐ.")
		return 0
	end
	local nCheckNV = check_nhiemvu(nOption) 
	if nCheckNV ~= 1 then
		return 0
	end
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)	
	SetTask(TSK_nvVBonus, nTaskNhiemVu + 1) -- settask x¸c nhËn lµm nhiÖm vô thªm 1 ®Ó lµm nhiÖm vô míi cho nhËn th­ëng level tiÕp
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbAwardList[nOption])
--	if nOption ~= 86 then
--		nVB = SetBit(nVB,tbCondition[nOption]["nPos"],1)
--		PayExtPoint(EXT_VBONUS,GetExtPoint(EXT_VBONUS))
--		AddExtPoint(EXT_VBONUS, nVB)
		VNG_SetExtBit(EXT_VBONUS,tbCondition[nOption]["nPos"],1)
--	end
	if nOption ~= 83 and nOption ~= 86 and nOption ~= 99 then
		gf_WriteLogEx("NHAN THUONG VBONUS","nhËn",1,"PhÇn th­ëng cÊp "..nOption)
	end
end

function VBonus_NhanThuong83()
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nhËn"
	local nRoute = GetPlayerRoute()
	local tbAward = tbTrangBiHaoNguyet_trangbi[nRoute]
	LIB_Award:AwardByBody(tbAward)
	gf_WriteLogEx("NHAN THUONG VBONUS","nhËn",1,"PhÇn th­ëng cÊp 83")
	Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn ®­îc phÇn th­ëng VBonus ®¼ng cÊp 83.")
end

function VBonus_NhanThuong86()
	LIB_Award.szLogTitle = "NHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:AwardByRoute(tbVuKhiHaoNguyet_trangbi)	
	LIB_Award:AwardByRoute(tbNgocBoiCuuChau)
	gf_WriteLogEx("NHAN THUONG VBONUS","nhËn",1,"PhÇn th­ëng cÊp 86")
	Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn ®­îc phÇn th­ëng VBonus ®¼ng cÊp 86.")
end

function VBonus_NhanThuong86_old()	--Vbonus cò
	local tbSay = {}
	tinsert(tbSay,"Thiªn NghÜa Cöu D­¬ng/#NhanThuongThienNghia(1)")
	tinsert(tbSay,"Thiªn NghÜa Cöu ¢m/#NhanThuongThienNghia(2)")
	tinsert(tbSay,"§Ó ta suy nghÜ thªm/gf_DoNothing")
	Say(szNpcName .."Ng­¬i h·y chän cho m×nh bé trang bÞ thÝch hîp.", getn(tbSay), tbSay)
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
	LIB_Award.szLogAction = "nhËn"	
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
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:AwardByRoute(tbNewItem)
	gf_WriteLogEx("NHAN THUONG VBONUS","nhËn",1,"PhÇn th­ëng cÊp 99")
	Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn ®­îc phÇn th­ëng VBonus ®¼ng cÊp 99.")
	
end

function NhanThuongThienNghia_old(nOption)
	local tbNuOaTinhThach = {item={{gdp={2,1,504,6,4}, name = "N÷ Oa Tinh Th¹ch	", nExpired = 30*24*60*60}}}
	local tbThienNghia1_B1 = {item = {
			{gdp={0,100,3034,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu D­¬ng Háa Y"},
			{gdp={0,103,3034,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu D­¬ng NhËt Qu¸n"},
			{gdp={0,101,3034,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu D­¬ng Long Trang"},}
	}
	local tbThienNghia1_B2 = {item = {
			{gdp={0,100,3040,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu D­¬ng Háa Y"},
			{gdp={0,103,3040,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu D­¬ng NhËt Qu¸n"},
			{gdp={0,101,3040,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu D­¬ng Long Trang"},}
	}
	local tbThienNghia1_B3 = {item = {
			{gdp={0,100,3046,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu D­¬ng Háa Y"},
			{gdp={0,103,3046,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu D­¬ng NhËt Qu¸n"},
			{gdp={0,101,3046,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu D­¬ng Long Trang"},}
	}
	local tbThienNghia1_B4 = {item = {
			{gdp={0,100,3052,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu D­¬ng Háa Y"},
			{gdp={0,103,3052,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu D­¬ng NhËt Qu¸n"},
			{gdp={0,101,3052,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu D­¬ng Long Trang"},}
	}
	local tbThienNghiaSet1 = {
		[1] = tbThienNghia1_B1,
		[2] = tbThienNghia1_B2,
		[3] = tbThienNghia1_B3,
		[4] = tbThienNghia1_B4,
	}
	
	local tbThienNghia2_B1 = {item = {
			{gdp={0,100,3037,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu ¢m Thñy Y"},
			{gdp={0,103,3037,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n"},
			{gdp={0,101,3037,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu ¢m Phông Trang"},}
	}
	local tbThienNghia2_B2 = {item = {
			{gdp={0,100,3043,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu ¢m Thñy Y"},
			{gdp={0,103,3043,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n"},
			{gdp={0,101,3043,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu ¢m Phông Trang"},}
	}
	local tbThienNghia2_B3 = {item = {
			{gdp={0,100,3049,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu ¢m Thñy Y"},
			{gdp={0,103,3049,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n"},
			{gdp={0,101,3049,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu ¢m Phông Trang"},}
	}
	local tbThienNghia2_B4 = {item = {
			{gdp={0,100,3055,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu ¢m Thñy Y"},
			{gdp={0,103,3055,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n"},
			{gdp={0,101,3055,1,1,-1,-1,-1,-1,-1,-1,-1,14}, name = "Thiªn NghÜa-Cöu ¢m Phông Trang"},}
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
	LIB_Award.szLogAction = "nhËn"
	if nOption == 1 then
		LIB_Award:AwardByBody(tbThienNghiaSet1)
	else
		LIB_Award:AwardByBody(tbThienNghiaSet2)
	end
	LIB_Award:Award(tbNuOaTinhThach)
	gf_WriteLogEx("NHAN THUONG VBONUS","nhËn",1,"PhÇn th­ëng cÊp 86")
	Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn ®­îc phÇn th­ëng VBonus ®¼ng cÊp 86.")
end


function VBonus_NhanThuong93()
	local tbNgocBoi = {item={
			{gdp={0,102,3122,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn NghÜa- HuyÒn Th¹ch Kim Ngäc"},
			{gdp={0,102,3125,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn NghÜa- PhØ Thóy Ngäc §íi"},
			{gdp={0,102,3128,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn NghÜa- NguyÖt Hoa Thñy Bèi"},
			{gdp={0,102,3131,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn NghÜa- Cöu ¦u Háa Giíi"},
			{gdp={0,102,3134,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thiªn NghÜa- Ng­ng Ngäc Thæ Hoµn"},
		},
	}
	local tbThieuLamDao = {item={{gdp={0,3,8894,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-L­u Ly Giíi §ao"}}}
	local tbThieuLamQuyen = {item={{gdp={0,0,8876,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-L«i ¢m Nang Thñ"}}}
	local tbThieuLamTruong = {item={{gdp={0,8,8910,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-Kinh L«i ThiÒn Tr­îng"}}}
	local tbDuongMon = {item={{gdp={0,1,8880,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-¢m D­¬ng Xuyªn ¶nh"}}}
	local tbNgaMyKiem = {item={{gdp={0,2,8887,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-Tõ Hµn ¢m KiÕm"}}}
	local tbNgaMyDan = {item={{gdp={0,10,8919,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-Cöu Hoµn Bèi CÇm"}}}
	local tbCaiBangQuyen = {item={{gdp={0,0,8877,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-Quy L©n Hé Thñ"}}}
	local tbCaiBangBong = {item={{gdp={0,5,8901,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-TrÊn Ng¹o C«n"}}}
	local tbVoDangKiem = {item={{gdp={0,2,8888,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-ThuÇn Phong KiÕm"}}}
	local tbVoDangBut = {item={{gdp={0,9,8915,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-Tinh §Èu ChuyÓn Bót"}}}
	local tbDuongGiaThuong = {item={{gdp={0,6,8904,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-Ph¸ Qu©n TrËn Th­¬ng"}}}
	local tbDuongGiaCung = {item={{gdp={0,4,8898,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-Truy MÖnh Cung"}}}
	local tbNguDocCoSu = {item={{gdp={0,11,8924,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-LuyÖn Hån HuyÕt Tr¶o"}}}
	local tbNguDocTaHiep = {item={{gdp={0,7,8907,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-ThiÖp Cèt HuyÕt §ao"}}}	
	local tbConLonThienSu = {item={{gdp={0,2,8889,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-Ngù Thiªn Phong KiÕm"}}}	
	local tbThuyYenVuTien = {item={{gdp={0,13,8931,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-Linh Lung Chi"}}}
	local tbThuyYenLinhNu = {item={{gdp={0,12,8928,1,1,-1,-1,-1,-1,-1,-1,-1,15}, name = "Thiªn NghÜa-Cöu Tiªu S¸o"}}}
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
	LIB_Award.szLogAction = "nhËn"
	LIB_Award:Award(tbNgocBoi);
	LIB_Award:AwardByRoute(tbVuKhiThienNghia)
	gf_WriteLogEx("NHAN THUONG VBONUS","nhËn",1,"PhÇn th­ëng cÊp 93")
	Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn ®­îc phÇn th­ëng VBonus ®¼ng cÊp 93.")
end
--==nhiÖm vô VBonus

--Task nhiÖm vô VBonus: TSK_nvVBonus =
	tbVBonus = {	--nType = 1:H¹t gièng, 2:BNN, 3:TMT, 4:Tø Linh, 5:TNC, 6:Th¸i h­, 7:Cóng TÕ, 8:Thñy lîi, 9:Ng«i sao, 10:N÷ oa, 11:nv S­ m«n, 12:LSB, 13:TrÞ an, 14:Nh¹n m«n quan, 15: B¶o vÖ thµnh tr×, 16:LuyÖn §¬n
					[1] = {83, 16, 16, 3}, --lev, h¹t gièng, BNN, TMT
					[2] = {86, 8, 3, 1}, --lev, tø linh, TNC, Th¸i h­
					[3] = {89, 3, 1}, --lev, cóng tÕ, thñy lîi
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
		Talk(1, "", "§¹i hiÖp ®· nhËn hÕt phÇn th­ëng cña VBonus")
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
			Talk(1, "", szNpcName.."B¹n ch­a kÝch ho¹t ®ñ 16 h¹t gièng")
			return 0
		end
		if nBNN < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B¹n ch­a kÝch ho¹t ®ñ 16 c©y b¸t nh· nhá")
			return 0
		end
		if nTMT < tbVBonus[nTaskNhiemVu][4] then
			Talk(1, "", szNpcName.."B¹n ch­a nhËn th­ëng ®ñ 3 lÇn Thiªn M«n TrËn")
			return 0
		end
		return 1
	end
	if nLevel == 86 and nTaskNhiemVu == 2 then
		local nTulinh = VNG_GetTaskPos(TSK_nvVBonus,2,2)
		local nTNC = VNG_GetTaskPos(TSK_nvVBonus,3,3)
		local nThaiHu = VNG_GetTaskPos(TSK_nvVBonus,4,4)
		if nTulinh < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B¹n ch­a kÝch ho¹t ®ñ 8 c©y Tø Linh")
			return 0
		end
		if nTNC < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B¹n ch­a hoµn thµnh 3 lÇn nhiÖm vô Tµi Nguyªn ChiÕn")
			return 0
		end
		if nThaiHu < tbVBonus[nTaskNhiemVu][4] then
			Talk(1, "", szNpcName.."B¹n ch­a hoµn thµnh ¶i 8 Th¸i H­ HuyÔn c¶nh")
			return 0
		end
		return 1	
	end
	if nLevel == 89 and nTaskNhiemVu == 3 then
		local nCungTe = VNG_GetTaskPos(TSK_nvVBonus,2,2)
		local nThuyLoi = VNG_GetTaskPos(TSK_nvVBonus,3,3)	
		if nCungTe < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B¹n ch­a hoµn thµnh 3 nhiÖm vô Cóng TÕ")
			return 0
		end
		if nThuyLoi < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B¹n ch­a hoµn thµnh nhiÖm vô Thñy Lîi")
			return 0
		end
		return 1
	end
	if nLevel == 91 and nTaskNhiemVu == 4 then
		local nNgoiSao = VNG_GetTaskPos(TSK_nvVBonus,3,2)
		local nNuOa = VNG_GetTaskPos(TSK_nvVBonus,6,4)
		local nSuMon = VNG_GetTaskPos(TSK_nvVBonus,7,7)	
		if nNgoiSao < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B¹n ch­a sö dông ®ñ 16 ng«i sao")
			return 0
		end	
		if nNuOa < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B¹n ch­a sö dông ®ñ 100 n÷ oa b¶o h¹p")
			return 0
		end
		if nSuMon < tbVBonus[nTaskNhiemVu][4] then
			Talk(1, "", szNpcName.."B¹n ch­a hoµn thµnh ®ñ 3 nhiÖm vô s­ m«n")
			return 0
		end	
		return 1
	end
	if nLevel == 96 and nTaskNhiemVu == 5 then
		local nLuongSon = VNG_GetTaskPos(TSK_nvVBonus,2,2)
		local nTriAn = VNG_GetTaskPos(TSK_nvVBonus,3,3)	
		if nLuongSon < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B¹n ch­a hoµn thµnh 3 nhiÖm vô L­¬ng S¬n B¹c")
			return 0
		end
		if nTriAn < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B¹n ch­a hoµn thµnh 3 nhiÖm vô TrÞ An")
			return 0
		end
		return 1
	end
	if nLevel == 98 and nTaskNhiemVu == 6 then
--		local nNhanMon = VNG_GetTaskPos(TSK_nvVBonus,2,2)
		local nThanhTri = VNG_GetTaskPos(TSK_nvVBonus,3,3)
		local nTMT = VNG_GetTaskPos(TSK_nvVBonus,4,4)
--		if nNhanMon < tbVBonus[nTaskNhiemVu][2] then
--			Talk(1, "", szNpcName.."B¹n ch­a nhËn th­ëng Nh¹n M«n Quan")
--			return 0
--		end
		if nThanhTri < tbVBonus[nTaskNhiemVu][3] then
			Talk(1, "", szNpcName.."B¹n ch­a nhËn th­ëng B¶o VÖ Thµnh Tr×")
			return 0
		end
		if nTMT < tbVBonus[nTaskNhiemVu][4] then
			Talk(1, "", szNpcName.."B¹n ch­a nhËn th­ëng 3 lÇn Thiªn M«n TrËn")
			return 0
		end
		return 1
	end
	if nLevel == 99 and nTaskNhiemVu == 7 then
		local nLuyenDon = VNG_GetTaskPos(TSK_nvVBonus,2,2)	
		if nLuyenDon < tbVBonus[nTaskNhiemVu][2] then
			Talk(1, "", szNpcName.."B¹n ch­a hoµn thµnh 1 lÇn LuyÖn ®¬n")
			return 0
		end
		return 1
	end	
	return 0
end
function nhiemvu83(nType)
	do return 0 end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)	--TSK_nvVBonus: dccbba: a:nhiÖm vô; bb: h¹t gièng; cc: BNN; d: TMT
	if nTaskNhiemVu < 1 or nTaskNhiemVu > 1 then
		Talk(1, "", "Cã lçi nhiÖm vô cÊp 83")
		return 0
	end
	local nHatGiong = VNG_GetTaskPos(TSK_nvVBonus,3,2)
	local nBNN = VNG_GetTaskPos(TSK_nvVBonus,5,4)
	local nTMT = VNG_GetTaskPos(TSK_nvVBonus,6,6)
	if nType == 1 and nHatGiong < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nHatGiong + 1,3,2)
		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: h¹t gièng")
	end
	if nType == 2 and nBNN < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nBNN + 1,5,4)
		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: BNN")
	end
	if nType == 3 and nTMT < tbVBonus[nTaskNhiemVu][4] then
		VNG_SetTaskPos(TSK_nvVBonus, nTMT + 1,6,6)
		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: TMT")
	end
end

function nhiemvu86(nType)
	do return 0 end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)--TSK_nvVBonus: dcba: a:nhiÖm vô; b: c©y tø linh; c: TNC; d: Th¸i h­
	if nTaskNhiemVu < 2 or nTaskNhiemVu > 2 then
		Talk(1, "", "Cã lçi nhiÖm vô cÊp 86")
		return 0
	end
	local nTulinh = VNG_GetTaskPos(TSK_nvVBonus,2,2)
	local nTNC = VNG_GetTaskPos(TSK_nvVBonus,3,3)
	local nThaiHu = VNG_GetTaskPos(TSK_nvVBonus,4,4)
	if nType == 4 and nTulinh < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nTulinh + 1,2,2)
		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: c©y tø linh")
	end
	if nType == 5 and nTNC < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nTNC + 1,3,3)
		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: TNC")
	end
	if nType == 6 and nThaiHu < tbVBonus[nTaskNhiemVu][4] then
		VNG_SetTaskPos(TSK_nvVBonus, nThaiHu + 1,4,4)
		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: th¸i h­")
	end
end

function nhiemvu89(nType)
	do return 0 end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10) --TSK_nvVBonus: cba: a:nhiÖm vô; b: cóng tÕ; c: Thñy lîi
	if nTaskNhiemVu < 3 or nTaskNhiemVu > 3 then
		Talk(1, "", "Cã lçi nhiÖm vô cÊp 89")
		return 0
	end
	local nCungTe = VNG_GetTaskPos(TSK_nvVBonus,2,2)
	local nThuyLoi = VNG_GetTaskPos(TSK_nvVBonus,3,3)
	if nType == 7 and nCungTe < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nCungTe + 1,2,2)
		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: cóng tÕ")
	end
	if nType == 8 and nThuyLoi < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nThuyLoi + 1,3,3)
		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: Thñy lîi")
	end
end

function nhiemvu91(nType)
	do return 0 end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10) --TSK_nvVBonus: dcccbba: a:nhiÖm vô; bb: ng«i sao; ccc: N÷ oa; d: s­ m«n
	if nTaskNhiemVu < 4 or nTaskNhiemVu > 4 then
		Talk(1, "", "Cã lçi nhiÖm vô cÊp 91")
		return 0
	end
	local nNgoiSao = VNG_GetTaskPos(TSK_nvVBonus,3,2)
	local nNuOa = VNG_GetTaskPos(TSK_nvVBonus,6,4)
	local nSuMon = VNG_GetTaskPos(TSK_nvVBonus,7,7)
	if nType == 9 and nNgoiSao < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nNgoiSao + 1,3,2)
		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: Ng«i sao")
	end
	if nType == 10 and nNuOa < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nNuOa + 1,6,4)
		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: N÷ oa")
	end
	if nType == 11 and nSuMon < tbVBonus[nTaskNhiemVu][4] then
		VNG_SetTaskPos(TSK_nvVBonus, nSuMon + 1,7,7)
		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: S­ m«n")
	end
end

function nhiemvu96(nType)
	do return 0 end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)--TSK_nvVBonus: cba: a:nhiÖm vô; b: L­¬ng S¬n; c: TrÞ An
	if nTaskNhiemVu < 5 or nTaskNhiemVu > 5 then
		Talk(1, "", "Cã lçi nhiÖm vô cÊp 96")
		return 0
	end
	local nLuongSon = VNG_GetTaskPos(TSK_nvVBonus,2,2)
	local nTriAn = VNG_GetTaskPos(TSK_nvVBonus,3,3)
	if nType == 12 and nLuongSon < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nLuongSon + 1,2,2)
		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: LSB")
	end
	if nType == 13 and nTriAn < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nTriAn + 1,3,3)
		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: trÞ an")
	end
end

function nhiemvu98(nType)
	do return 0 end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)--TSK_nvVBonus: dcba: a:nhiÖm vô; b: Nh¹n m«n; c: Thµnh Tr×; d:TMT
	if nTaskNhiemVu < 6 or nTaskNhiemVu > 6 then
		Talk(1, "", "Cã lçi nhiÖm vô cÊp 98")
		return 0
	end
--	local nNhanMon = VNG_GetTaskPos(TSK_nvVBonus,2,2)
	local nThanhTri = VNG_GetTaskPos(TSK_nvVBonus,3,3)
	local nTMT = VNG_GetTaskPos(TSK_nvVBonus,4,4)
--	if nType == 14 and nNhanMon < tbVBonus[nTaskNhiemVu][2] then
--		VNG_SetTaskPos(TSK_nvVBonus, nNhanMon + 1,2,2)
--		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
--		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: Nh¹n m«n")
--	end
	if nType == 15 and nThanhTri < tbVBonus[nTaskNhiemVu][3] then
		VNG_SetTaskPos(TSK_nvVBonus, nThanhTri + 1,3,3)
		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: thµnh tr×")
	end
	if nType == 3 and nTMT < tbVBonus[nTaskNhiemVu][4] then
		VNG_SetTaskPos(TSK_nvVBonus, nTMT + 1,4,4)
		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: TMT")
	end
end

function nhiemvu99(nType)
	do return 0 end
	
	local nTaskNhiemVu = mod(GetTask(TSK_nvVBonus),10)--TSK_nvVBonus: ba: a:nhiÖm vô; b: LuyÖn §¬n
	if nTaskNhiemVu < 7 or nTaskNhiemVu > 7 then
		Talk(1, "", "Cã lçi nhiÖm vô cÊp 99")
		return 0
	end
	local nLuyenDon = VNG_GetTaskPos(TSK_nvVBonus,2,2)
	if nType == 16 and nLuyenDon < tbVBonus[nTaskNhiemVu][2] then
		VNG_SetTaskPos(TSK_nvVBonus, nLuyenDon + 1,2,2)
		Msg2Player("Hoµn thµnh 1 lÇn nhiÖm vô VBonus")
		gf_WriteLogEx("NHAN THUONG VBONUS","hoµn thµnh",1,"Hoµn thµnh 1 nhiÖm vô VBonus: luyÖn ®¬n")
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
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã trong danh s¸ch hç trî nhËn th­ëng KCL")
		return
	end
	
	if nServerID ~= accountNhanThuong[nNum][3] then
		Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã trong danh s¸ch hç trî nhËn th­ëng KCL")
		return
	end
	
	if gf_GetTaskByte(TSK_HOTROKCL,4) == 1 then
		Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn th­ëng råi, ®õng tham chø!")
		return
	end
	
	if gf_Judge_Room_Weight(3,200) ~= 1 then
		Talk(1,"",szNpcName.."Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return
	end
	
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "",szNpcName.."T×nh tr¹ng hiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end	
	
	if accountNhanThuong[nNum][2] == 1 then
		ahf_GetEquipByRouteBody(VET_ZHANKUANG_CLOTH);
		gf_WriteLogEx("HoTroKCL","nhan",1,"¸o ChiÕn cuång")
		gf_SetTaskByte(TSK_HOTROKCL,4,1)
		return
	end
	
	if accountNhanThuong[nNum][2] == 2 then
		local tDialog = {}
		
			for i = 1, getn(CK_YAOYANG_JIEZI_2) do
				tinsert(tDialog, format("%s/#NhanDieuDuong(%d)", CK_YAOYANG_JIEZI_2[i][1], i));
			end
			
			tinsert(tDialog, "\nT«i chØ xem xem th«i/nothing");
		Say(CK_NPC_NAME.."H·y chän lo¹i cÇn:", getn(tDialog), tDialog);	
		return
	end
end

function NhanDieuDuong(nIndex)	
	gf_AddItemEx2(CK_YAOYANG_JIEZI_2[nIndex][2], CK_YAOYANG_JIEZI_2[nIndex][1], "CDKEY", "CDKEY", 0, 1)
	gf_SetTaskByte(TSK_HOTROKCL,4,1)
	gf_WriteLogEx("HoTroKCL","nhan",1,"Trang Søc DiÖu D­¬ng")
end

function QuaySoTet()
	local tbSay = {}
	local tbItems = {
		[1] = {"Bµn Long BÝch"},
		[2] = {"Hßa ThÞ BÝch"},
		[3] = {"Tói Thiªn Th¹ch Tinh Th¹ch"},
		[4] = {"Bao Thiªn Th¹ch Tinh Th¹ch"},
		[5] = {"Kim Xµ 4 NgÉu nhiªn + 15 ch­a d­ìng thµnh"},
		[6] = {"Set ChiÕn Cuång +15 theo hÖ ph¸i"},
	}	
	for i = 1, getn(tbItems) do
		tinsert(tbSay,format("%s/#QuaySoTet_01(%d)","Ta muèn nhËn th­ëng "..tbItems[i][1],i))
	end
	tinsert(tbSay,"Rêi Khái/nothing")
	Say(CK_NPC_NAME.."Mau chãng nhËn th­ëng quay tÕt, mau lªn mau lªn!",getn(tbSay),tbSay)
end

function QuaySoTet_01(nIndex)	
	
	local nExt = gf_GetExtPointBit(EXT_QUAYSOTET,nIndex)
	
	if nExt ~= 1 then
		Talk(1,"",szNpcName.."PhÇn th­ëng nµy kh«ng ph¶i muèn cã lµ ®­îc, c¸c h¹ ®· quay sè ch­a? Thö vËn may ®i nµo!")
		return
	end
	
	if gf_Judge_Room_Weight(5,250) ~= 1 then
		Talk(1,"",szNpcName.."Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return
	end
	
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "",szNpcName.."T×nh tr¹ng hiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end	
	
	if nIndex == 1 then
		gf_AddItemEx2({2,1,1000,1},"Bµn Long BÝch","QuaySoAtMui","Nhan",3600*24*14,1)
		LIB_WriteLog("Promotion_QS_201502",1,"NhËn 1 Bµn Long BÝch","nil","BLB","nil")		
		gf_SetExtPointBit(EXT_QUAYSOTET,1,0)	
	end
	
	if nIndex == 2 then
		gf_AddItemEx2({2,1,1001,1},"Hßa Th× BÝch","QuaySoAtMui","Nhan",3600*24*14,1)	
		LIB_WriteLog("Promotion_QS_201502",1,"NhËn 1 Hßa ThÞ BÝch","nil","HTB","nil")
		gf_SetExtPointBit(EXT_QUAYSOTET,2,0)	
	end
	
	if nIndex == 3 then
		gf_AddItemEx2({2,1,3356,1},"Tói Thiªn Th¹ch Tinh Th¹ch","QuaySoAtMui","Nhan",3600*24*14,1)	
		LIB_WriteLog("Promotion_QS_201502",1,"NhËn 1 Tói Thiªn Th¹ch Tinh Th¹ch","nil","TTTTT","nil")
		gf_SetExtPointBit(EXT_QUAYSOTET,3,0)	
	end
	
	if nIndex == 4 then
		gf_AddItemEx2({2,1,1051,1},"Bao Thiªn Th¹ch Tinh Th¹ch","QuaySoAtMui","Nhan",3600*24*14,1)
		LIB_WriteLog("Promotion_QS_201502",1,"NhËn 1 Bao Thiªn Th¹ch Tinh Th¹ch","nil","BTTTT","nil")		
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
		LIB_WriteLog("Promotion_QS_201502",1,"NhËn 1 Bé Kim Xµ 4","nil","KimXa4","nil")
		gf_SetExtPointBit(EXT_QUAYSOTET,5,0)	
	end
	
	if nIndex == 6 then
		local nRoute = gf_CheckPlayerRoute()
		if nRoute == 0 then
			Talk(1,"",szNpcName.."C¸c h¹ ch­a chän hÖ ph¸i, kh«ng thÓ nhËn th­ëng!")
			return
		end
		TraoChienCuong(15)
		LIB_WriteLog("Promotion_QS_201502",1,"NhËn 1 Set ChiÕn Cuång","nil","SetChienCuong","nil")
		gf_SetExtPointBit(EXT_QUAYSOTET,6,0)		
	end
	Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn th­ëng thµnh c«ng!")
end

function TraoKimXa(nLevel,nType)
	local tbKimXaVanDu = {
		item = {
			{gdp={0,153,28,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Huy Ch­¬ng V©n Du"},
			{gdp={0,152,28,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="¸o Choµng V©n Du"},
			{gdp={0,154,28,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="§¹o Hµi V©n Du"},
		}
	}
	
	local tbKimXaThietHuyet = {
		item = {
			{gdp={0,153,27,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Huy Ch­¬ng ThiÕt HuyÕt"},
			{gdp={0,152,27,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="¸o Choµng ThiÕt HuyÕt"},
			{gdp={0,154,27,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="§¹o Hµi ThiÕt HuyÕt"},
		}
	}
	
	local tbKimXaDuHiep = {
		item = {
			{gdp={0,153,26,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="Huy Ch­¬ng Du HiÖp"},
			{gdp={0,152,26,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="¸o Choµng Du HiÖp"},
			{gdp={0,154,26,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="§¹o Hµi Du HiÖp"},
		}
	}	
	
	LIB_Award.szLogTitle = "QuaySoAtMui"
	LIB_Award.szLogAction = "nhan"
	
	if nType  == 1 then
		LIB_Award:Award(tbKimXaVanDu)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ V©n Du")
	elseif nType == 2 then
		LIB_Award:Award(tbKimXaThietHuyet)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ ThiÕt HuyÕt")
	elseif nType == 3 then
		LIB_Award:Award(tbKimXaDuHiep)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ Du HiÖp")
	end	
	
end

function TraoChienCuong(nLevel)
	local tbTrangBiChienCuong = {
		[100] = {
			[1] = {
				[2] = {item={{gdp={0,100,30143,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn §Þa Bµo"}}},
				[4] = {item={{gdp={0,100,30145,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Phæ TÕ Bµo"}}},
				[3] = {item={{gdp={0,100,30147,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn T«n Bµo"}}},
				[6] = {item={{gdp={0,100,30149,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång TuyÖt MÖnh Y"}}},
				[11] = {item={{gdp={0,100,30157,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThÇn Du Y"}}},
				[12] = {item={{gdp={0,100,30161,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tiªu Dao Y"}}},
				[14] = {item={{gdp={0,100,30165,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång V« Vi Bµo"}}},
				[15] = {item={{gdp={0,100,30169,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cµn Kh«n Bµo"}}},
				[17] = {item={{gdp={0,100,30173,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn Tinh  Gi¸p"}}},
				[18] = {item={{gdp={0,100,30177,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Xuyªn V©n Gi¸p"}}},
				[20] = {item={{gdp={0,100,30181,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Minh T«n Y"}}},
				[21] = {item={{gdp={0,100,30185,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cæ T©m Y"}}},
				[23] = {item={{gdp={0,100,30189,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Phong L«i Bµo"}}},
				[25] = {item={{gdp={0,100,30191,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång §¹i §Þa Y"}}},
				[26] = {item={{gdp={0,100,30195,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tóy Méng Bµo"}}},
				[27] = {item={{gdp={0,100,30199,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Ma Vùc  Bµo"}}},
			},
			[2] = {
				[2] = {item={{gdp={0,100,30144,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn §Þa Bµo"}}},
				[4] = {item={{gdp={0,100,30146,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Phæ TÕ Bµo"}}},
				[3] = {item={{gdp={0,100,30148,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn T«n Bµo"}}},
				[6] = {item={{gdp={0,100,30150,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång TuyÖt MÖnh Y"}}},
				[11] = {item={{gdp={0,100,30158,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThÇn Du Y"}}},
				[12] = {item={{gdp={0,100,30162,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tiªu Dao Y"}}},
				[14] = {item={{gdp={0,100,30166,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång V« Vi Bµo"}}},
				[15] = {item={{gdp={0,100,30170,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cµn Kh«n Bµo"}}},
				[17] = {item={{gdp={0,100,30174,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn Tinh  Gi¸p"}}},
				[18] = {item={{gdp={0,100,30178,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Xuyªn V©n Gi¸p"}}},
				[20] = {item={{gdp={0,100,30182,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Minh T«n Y"}}},
				[21] = {item={{gdp={0,100,30186,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cæ T©m Y"}}},
				[23] = {item={{gdp={0,100,30190,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Phong L«i Bµo"}}},
				[25] = {item={{gdp={0,100,30192,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång §¹i §Þa Y"}}},
				[26] = {item={{gdp={0,100,30196,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tóy Méng Bµo"}}},
				[27] = {item={{gdp={0,100,30200,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Ma Vùc  Bµo"}}},
			},
			[3] = {
				[6] = {item={{gdp={0,100,30151,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång TuyÖt MÖnh Y"}}},
				[8] = {item={{gdp={0,100,30153,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Bå T¸t Y"}}},
				[9] = {item={{gdp={0,100,30155,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång L­u ThñyY"}}},
				[11] = {item={{gdp={0,100,30159,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThÇn Du Y"}}},
				[12] = {item={{gdp={0,100,30163,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tiªu Dao Y"}}},
				[14] = {item={{gdp={0,100,30167,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång V« Vi Bµo"}}},
				[15] = {item={{gdp={0,100,30171,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cµn Kh«n Bµo"}}},
				[17] = {item={{gdp={0,100,30175,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn Tinh  Gi¸p"}}},
				[18] = {item={{gdp={0,100,30179,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Xuyªn V©n Gi¸p"}}},
				[20] = {item={{gdp={0,100,30183,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Minh T«n Y"}}},
				[21] = {item={{gdp={0,100,30187,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cæ T©m Y"}}},
				[25] = {item={{gdp={0,100,30193,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång §¹i §Þa Y"}}},
				[26] = {item={{gdp={0,100,30197,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tóy Méng Bµo"}}},
				[27] = {item={{gdp={0,100,30201,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Ma Vùc  Bµo"}}},
				[29] = {item={{gdp={0,100,30203,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th¸nh N÷  Y"}}},
				[30] = {item={{gdp={0,100,30205,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th¸nh Linh Y"}}},
			},
			[4] = {
				[6] = {item={{gdp={0,100,30152,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång TuyÖt MÖnh Y"}}},
				[8] = {item={{gdp={0,100,30154,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Bå T¸t Y"}}},
				[9] = {item={{gdp={0,100,30156,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång L­u ThñyY"}}},
				[11] = {item={{gdp={0,100,30160,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThÇn Du Y"}}},
				[12] = {item={{gdp={0,100,30164,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tiªu Dao Y"}}},
				[14] = {item={{gdp={0,100,30168,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång V« Vi Bµo"}}},
				[15] = {item={{gdp={0,100,30172,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cµn Kh«n Bµo"}}},
				[17] = {item={{gdp={0,100,30176,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn Tinh  Gi¸p"}}},
				[18] = {item={{gdp={0,100,30180,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Xuyªn V©n Gi¸p"}}},
				[20] = {item={{gdp={0,100,30184,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Minh T«n Y"}}},
				[21] = {item={{gdp={0,100,30188,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cæ T©m Y"}}},
				[25] = {item={{gdp={0,100,30194,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång §¹i §Þa Y"}}},
				[26] = {item={{gdp={0,100,30198,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tóy Méng Bµo"}}},
				[27] = {item={{gdp={0,100,30202,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Ma Vùc  Bµo"}}},
				[29] = {item={{gdp={0,100,30204,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th¸nh N÷  Y"}}},
				[30] = {item={{gdp={0,100,30206,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th¸nh Linh Y"}}},
			}
		},
		
		[101] = {
			[1] = {
				[2] = {item={{gdp={0,101,30143,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn §Þa Trang"}}},
				[4] = {item={{gdp={0,101,30145,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Phæ TÕ Trang"}}},
				[3] = {item={{gdp={0,101,30147,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn T«n Trang"}}},
				[6] = {item={{gdp={0,101,30149,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång TuyÖt MÖnh Trang"}}},
				[11] = {item={{gdp={0,101,30157,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThÇn Du Trang"}}},
				[12] = {item={{gdp={0,101,30161,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tiªu Dao Trang"}}},
				[14] = {item={{gdp={0,101,30165,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång V« Vi Trang"}}},
				[15] = {item={{gdp={0,101,30169,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cµn Kh«n Trang"}}},
				[17] = {item={{gdp={0,101,30173,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn Tinh  Trang"}}},
				[18] = {item={{gdp={0,101,30177,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Xuyªn V©n Trang"}}},
				[20] = {item={{gdp={0,101,30181,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Minh T«n Trang"}}},
				[21] = {item={{gdp={0,101,30185,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cæ T©m Trang"}}},
				[23] = {item={{gdp={0,101,30189,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Phong L«i Trang"}}},
				[25] = {item={{gdp={0,101,30191,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång §¹i §Þa Trang"}}},
				[26] = {item={{gdp={0,101,30195,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tóy Méng Trang"}}},
				[27] = {item={{gdp={0,101,30199,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Ma Vùc  Trang"}}},
			},
			[2] = {
				[2] = {item={{gdp={0,101,30144,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn §Þa Trang"}}},
				[4] = {item={{gdp={0,101,30146,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Phæ TÕ Trang"}}},
				[3] = {item={{gdp={0,101,30148,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn T«n Trang"}}},
				[6] = {item={{gdp={0,101,30150,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång TuyÖt MÖnh Trang"}}},
				[11] = {item={{gdp={0,101,30158,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThÇn Du Trang"}}},
				[12] = {item={{gdp={0,101,30162,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tiªu Dao Trang"}}},
				[14] = {item={{gdp={0,101,30166,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång V« Vi Trang"}}},
				[15] = {item={{gdp={0,101,30170,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cµn Kh«n Trang"}}},
				[17] = {item={{gdp={0,101,30174,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn Tinh  Trang"}}},
				[18] = {item={{gdp={0,101,30178,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Xuyªn V©n Trang"}}},
				[20] = {item={{gdp={0,101,30182,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Minh T«n Trang"}}},
				[21] = {item={{gdp={0,101,30186,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cæ T©m Trang"}}},
				[23] = {item={{gdp={0,101,30190,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Phong L«i Trang"}}},
				[25] = {item={{gdp={0,101,30192,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång §¹i §Þa Trang"}}},
				[26] = {item={{gdp={0,101,30196,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tóy Méng Trang"}}},
				[27] = {item={{gdp={0,101,30200,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Ma Vùc  Trang"}}},
			},
			[3] = {
				[6] = {item={{gdp={0,101,30151,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång TuyÖt MÖnh Trang"}}},
				[8] = {item={{gdp={0,101,30153,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Bå T¸t Khè"}}},
				[9] = {item={{gdp={0,101,30155,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång L­u ThñyKhè"}}},
				[11] = {item={{gdp={0,101,30159,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThÇn Du Trang"}}},
				[12] = {item={{gdp={0,101,30163,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tiªu Dao Trang"}}},
				[14] = {item={{gdp={0,101,30167,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång V« Vi Trang"}}},
				[15] = {item={{gdp={0,101,30171,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cµn Kh«n Trang"}}},
				[17] = {item={{gdp={0,101,30175,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn Tinh  Trang"}}},
				[18] = {item={{gdp={0,101,30179,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Xuyªn V©n Trang"}}},
				[20] = {item={{gdp={0,101,30183,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Minh T«n Trang"}}},
				[21] = {item={{gdp={0,101,30187,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cæ T©m Trang"}}},
				[25] = {item={{gdp={0,101,30193,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång §¹i §Þa Trang"}}},
				[26] = {item={{gdp={0,101,30197,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tóy Méng Trang"}}},
				[27] = {item={{gdp={0,101,30201,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Ma Vùc  Trang"}}},
				[29] = {item={{gdp={0,101,30203,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th¸nh N÷  Khè"}}},
				[30] = {item={{gdp={0,101,30205,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th¸nh Linh Khè"}}},
			},
			[4] = {
				[6] = {item={{gdp={0,101,30152,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång TuyÖt MÖnh Trang"}}},
				[8] = {item={{gdp={0,101,30154,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Bå T¸t Khè"}}},
				[9] = {item={{gdp={0,101,30156,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång L­u ThñyKhè"}}},
				[11] = {item={{gdp={0,101,30160,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThÇn Du Trang"}}},
				[12] = {item={{gdp={0,101,30164,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tiªu Dao Trang"}}},
				[14] = {item={{gdp={0,101,30168,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång V« Vi Trang"}}},
				[15] = {item={{gdp={0,101,30172,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cµn Kh«n Trang"}}},
				[17] = {item={{gdp={0,101,30176,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn Tinh  Trang"}}},
				[18] = {item={{gdp={0,101,30180,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Xuyªn V©n Trang"}}},
				[20] = {item={{gdp={0,101,30184,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Minh T«n Trang"}}},
				[21] = {item={{gdp={0,101,30188,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cæ T©m Trang"}}},
				[25] = {item={{gdp={0,101,30194,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång §¹i §Þa Trang"}}},
				[26] = {item={{gdp={0,101,30198,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tóy Méng Trang"}}},
				[27] = {item={{gdp={0,101,30202,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Ma Vùc  Trang"}}},
				[29] = {item={{gdp={0,101,30204,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th¸nh N÷  Khè"}}},
				[30] = {item={{gdp={0,101,30206,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th¸nh Linh Khè"}}},
			},
		},
		
		[103] = {
			[1] = {
				[2] = {item={{gdp={0,103,30143,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn §Þa M¹o"}}},
				[4] = {item={{gdp={0,103,30145,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Phæ TÕ M¹o"}}},
				[3] = {item={{gdp={0,103,30147,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn T«n M¹o"}}},
				[6] = {item={{gdp={0,103,30149,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång TuyÖt MÖnh Qu¸n"}}},
				[11] = {item={{gdp={0,103,30157,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThÇn Du C©n"}}},
				[12] = {item={{gdp={0,103,30161,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tiªu Dao C©n"}}},
				[14] = {item={{gdp={0,103,30165,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång V« Vi Qu¸n"}}},
				[15] = {item={{gdp={0,103,30169,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cµn Kh«n Qu¸n"}}},
				[17] = {item={{gdp={0,103,30173,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn Tinh  Kh«i"}}},
				[18] = {item={{gdp={0,103,30177,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Xuyªn V©n Kh«i"}}},
				[20] = {item={{gdp={0,103,30181,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Minh T«n C©n"}}},
				[21] = {item={{gdp={0,103,30185,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cæ T©m C©n"}}},
				[23] = {item={{gdp={0,103,30189,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Phong L«i Qu¸n"}}},
				[25] = {item={{gdp={0,103,30191,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång §¹i §Þa C©n"}}},
				[26] = {item={{gdp={0,103,30195,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tóy Méng Qu¸n"}}},
				[27] = {item={{gdp={0,103,30199,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Ma Vùc  Qu¸n"}}},
			},
			[2] = {
				[2] = {item={{gdp={0,103,30144,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn §Þa M¹o"}}},
				[4] = {item={{gdp={0,103,30146,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Phæ TÕ M¹o"}}},
				[3] = {item={{gdp={0,103,30148,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn T«n M¹o"}}},
				[6] = {item={{gdp={0,103,30150,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång TuyÖt MÖnh Qu¸n"}}},
				[11] = {item={{gdp={0,103,30158,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThÇn Du C©n"}}},
				[12] = {item={{gdp={0,103,30162,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tiªu Dao C©n"}}},
				[14] = {item={{gdp={0,103,30166,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång V« Vi Qu¸n"}}},
				[15] = {item={{gdp={0,103,30170,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cµn Kh«n Qu¸n"}}},
				[17] = {item={{gdp={0,103,30174,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn Tinh  Kh«i"}}},
				[18] = {item={{gdp={0,103,30178,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Xuyªn V©n Kh«i"}}},
				[20] = {item={{gdp={0,103,30182,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Minh T«n C©n"}}},
				[21] = {item={{gdp={0,103,30186,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cæ T©m C©n"}}},
				[23] = {item={{gdp={0,103,30190,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Phong L«i Qu¸n"}}},
				[25] = {item={{gdp={0,103,30192,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång §¹i §Þa C©n"}}},
				[26] = {item={{gdp={0,103,30196,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tóy Méng Qu¸n"}}},
				[27] = {item={{gdp={0,103,30200,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Ma Vùc  Qu¸n"}}},
			},
			[3] = {
				[6] = {item={{gdp={0,103,30151,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång TuyÖt MÖnh Qu¸n"}}},
				[8] = {item={{gdp={0,103,30153,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Bå T¸t Tr©m"}}},
				[9] = {item={{gdp={0,103,30155,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång L­u Thñy Tr©m"}}},
				[11] = {item={{gdp={0,103,30159,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThÇn Du C©n"}}},
				[12] = {item={{gdp={0,103,30163,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tiªu Dao C©n"}}},
				[14] = {item={{gdp={0,103,30167,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång V« Vi Qu¸n"}}},
				[15] = {item={{gdp={0,103,30171,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cµn Kh«n Qu¸n"}}},
				[17] = {item={{gdp={0,103,30175,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn Tinh  Kh«i"}}},
				[18] = {item={{gdp={0,103,30179,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Xuyªn V©n Kh«i"}}},
				[20] = {item={{gdp={0,103,30183,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Minh T«n C©n"}}},
				[21] = {item={{gdp={0,103,30187,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cæ T©m C©n"}}},
				[25] = {item={{gdp={0,103,30193,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång §¹i §Þa C©n"}}},
				[26] = {item={{gdp={0,103,30197,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tóy Méng Qu¸n"}}},
				[27] = {item={{gdp={0,103,30201,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Ma Vùc  Qu¸n"}}},
				[29] = {item={{gdp={0,103,30203,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th¸nh N÷  Tr©m"}}},
				[30] = {item={{gdp={0,103,30205,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th¸nh Linh Tr©m"}}},
			},
			[4] = {
				[6] = {item={{gdp={0,103,30152,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång TuyÖt MÖnh Qu¸n"}}},
				[8] = {item={{gdp={0,103,30154,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Bå T¸t Tr©m"}}},
				[9] = {item={{gdp={0,103,30156,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång L­u Thñy Tr©m"}}},
				[11] = {item={{gdp={0,103,30160,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThÇn Du C©n"}}},
				[12] = {item={{gdp={0,103,30164,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tiªu Dao C©n"}}},
				[14] = {item={{gdp={0,103,30168,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång V« Vi Qu¸n"}}},
				[15] = {item={{gdp={0,103,30172,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cµn Kh«n Qu¸n"}}},
				[17] = {item={{gdp={0,103,30176,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn Tinh  Kh«i"}}},
				[18] = {item={{gdp={0,103,30180,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Xuyªn V©n Kh«i"}}},
				[20] = {item={{gdp={0,103,30184,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Minh T«n C©n"}}},
				[21] = {item={{gdp={0,103,30188,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Cæ T©m C©n"}}},
				[25] = {item={{gdp={0,103,30194,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång §¹i §Þa C©n"}}},
				[26] = {item={{gdp={0,103,30198,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tóy Méng Qu¸n"}}},
				[27] = {item={{gdp={0,103,30202,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Ma Vùc  Qu¸n"}}},
				[29] = {item={{gdp={0,103,30204,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th¸nh N÷  Tr©m"}}},
				[30] = {item={{gdp={0,103,30206,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th¸nh Linh Tr©m"}}},
			},
		},
	}

	local tbVuKhiChienCuong = {
		[1] = {
			[2] = {item={{gdp={0,3,30143,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång B¨ng Thiªn §ao"}}},
			[3] = {item={{gdp={0,8,30147,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThiÒn §Þnh Tr­îng"}}},
			[4] = {item={{gdp={0,0,30145,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th¸nh ChiÕn Thñ"}}},
			[6] = {item={{gdp={0,1,30149,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång §o¹t Hån Ch©m"}}},
			[11] = {item={{gdp={0,0,30157,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Trõng ¸c Thñ"}}},
			[12] = {item={{gdp={0,5,30161,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång V« Cùc C«n"}}},
			[14] = {item={{gdp={0,2,30165,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Khu Ma KiÕm"}}},
			[15] = {item={{gdp={0,9,30169,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th­¬ng Khung Bót"}}},
			[17] = {item={{gdp={0,6,30173,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThÇn KÝch Th­¬ng"}}},
			[18] = {item={{gdp={0,4,30177,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Xung Thiªn Cung"}}},
			[20] = {item={{gdp={0,7,30181,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång LuyÖn Ngôc §ao"}}},
			[21] = {item={{gdp={0,11,30185,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång NhiÕp Hån Tr¶o"}}},
			[23] = {item={{gdp={0,2,30189,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn Ph¹t KiÕm"}}},
			[25] = {item={{gdp={0,3,30191,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Chóc Dung §ao"}}},
			[26] = {item={{gdp={0,9,30195,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tö MÖnh Bót"}}},
			[27] = {item={{gdp={0,11,30199,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Truy Hån Tr¶o"}}},
		},
		[2] = {
			[2] = {item={{gdp={0,3,30144,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång B¨ng Thiªn §ao"}}},
			[3] = {item={{gdp={0,8,30148,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThiÒn §Þnh Tr­îng"}}},
			[4] = {item={{gdp={0,0,30146,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th¸nh ChiÕn Thñ"}}},
			[6] = {item={{gdp={0,1,30150,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång §o¹t Hån Ch©m"}}},
			[11] = {item={{gdp={0,0,30158,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Trõng ¸c Thñ"}}},
			[12] = {item={{gdp={0,5,30162,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång V« Cùc C«n"}}},
			[14] = {item={{gdp={0,2,30166,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Khu Ma KiÕm"}}},
			[15] = {item={{gdp={0,9,30170,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th­¬ng Khung Bót"}}},
			[17] = {item={{gdp={0,6,30174,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThÇn KÝch Th­¬ng"}}},
			[18] = {item={{gdp={0,4,30178,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Xung Thiªn Cung"}}},
			[20] = {item={{gdp={0,7,30182,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång LuyÖn Ngôc §ao"}}},
			[21] = {item={{gdp={0,11,30186,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång NhiÕp Hån Tr¶o"}}},
			[23] = {item={{gdp={0,2,30190,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Thiªn Ph¹t KiÕm"}}},
			[25] = {item={{gdp={0,3,30192,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Chóc Dung §ao"}}},
			[26] = {item={{gdp={0,9,30196,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tö MÖnh Bót"}}},
			[27] = {item={{gdp={0,11,30200,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Truy Hån Tr¶o"}}},

		},
		[3] = {
			[6] = {item={{gdp={0,1,30151,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång §o¹t Hån Ch©m"}}},
			[8] = {item={{gdp={0,2,30153,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång PhËt Quang KiÕm"}}},
			[9] = {item={{gdp={0,10,30155,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Hé Bang CÇm"}}},
			[11] = {item={{gdp={0,0,30159,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Trõng ¸c Thñ"}}},
			[12] = {item={{gdp={0,5,30163,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång V« Cùc C«n"}}},
			[14] = {item={{gdp={0,2,30167,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Khu Ma KiÕm"}}},
			[15] = {item={{gdp={0,9,30171,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th­¬ng Khung Bót"}}},
			[17] = {item={{gdp={0,6,30175,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThÇn KÝch Th­¬ng"}}},
			[18] = {item={{gdp={0,4,30179,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Xung Thiªn Cung"}}},
			[20] = {item={{gdp={0,7,30183,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång LuyÖn Ngôc §ao"}}},
			[21] = {item={{gdp={0,11,30187,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång NhiÕp Hån Tr¶o"}}},
			[25] = {item={{gdp={0,3,30193,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Chóc Dung §ao"}}},
			[26] = {item={{gdp={0,9,30197,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tö MÖnh Bót"}}},
			[27] = {item={{gdp={0,11,30201,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Truy Hån Tr¶o"}}},
			[29] = {item={{gdp={0,13,30203,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Phong Linh PhiÕn"}}},
			[30] = {item={{gdp={0,12,30205,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Kh«ng Minh §Þch"}}},
		},
		[4] = {
			[6] = {item={{gdp={0,1,30152,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång §o¹t Hån Ch©m"}}},
			[8] = {item={{gdp={0,2,30154,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång PhËt Quang KiÕm"}}},
			[9] = {item={{gdp={0,10,30156,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Hé Bang CÇm"}}},
			[11] = {item={{gdp={0,0,30160,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Trõng ¸c Thñ"}}},
			[12] = {item={{gdp={0,5,30164,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång V« Cùc C«n"}}},
			[14] = {item={{gdp={0,2,30168,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Khu Ma KiÕm"}}},
			[15] = {item={{gdp={0,9,30172,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Th­¬ng Khung Bót"}}},
			[17] = {item={{gdp={0,6,30176,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång ThÇn KÝch Th­¬ng"}}},
			[18] = {item={{gdp={0,4,30180,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Xung Thiªn Cung"}}},
			[20] = {item={{gdp={0,7,30184,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång LuyÖn Ngôc §ao"}}},
			[21] = {item={{gdp={0,11,30188,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång NhiÕp Hån Tr¶o"}}},
			[25] = {item={{gdp={0,3,30194,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Chóc Dung §ao"}}},
			[26] = {item={{gdp={0,9,30198,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Tö MÖnh Bót"}}},
			[27] = {item={{gdp={0,11,30202,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Truy Hån Tr¶o"}}},
			[29] = {item={{gdp={0,13,30204,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Phong Linh PhiÕn"}}},
			[30] = {item={{gdp={0,12,30206,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel}, name="ChiÕn Cuång Kh«ng Minh §Þch"}}},
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
		Talk(1, "", szNpcName.."§¹i hiÖp ®· nhËn hç trî råi")
		return 0
	end	
	local nAcc = GetAccount()
	local nRole = GetName()
	local nQuanCong = abs(GetTask(701))	
	if nQuanCong >= tbQuanCongTP[1][3] then
		Talk(1, "", "Qu©n c«ng cña b¹n qu¸ nhiÒu råi")
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
				Talk(1, "", "Chóc mõng b¹n ®· nhËn hç trî qu©n c«ng thµnh c«ng")
			else
				SetTask(701, GetTask(701) - tbQuanCongTP[i][5])
				Talk(1, "", "Chóc mõng b¹n ®· nhËn hç trî qu©n c«ng thµnh c«ng")
			end
			--===========
			AddExtPoint(EXT_SURVEY2016, 341)
			Talk(1, "", szNpcName.."§¹i hiÖp nhËn hç trî VIP thµnh c«ng.")
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
		Talk(1, "", "§iÓm S­ m«n cña b¹n qu¸ nhiÒu råi")
		return 0
	end
	for i = 1, getn(tbSuMon) do	
		if nAcc == tbSuMon[i][1] and nRole == tbSuMon[i][2] then	
			if GetTask(336) >= 0 then
				SetTask(336, GetTask(336) + tbSuMon[i][3])
				Talk(1, "", "Chóc mõng b¹n ®· nhËn hç trî ®iÓm s­ m«n thµnh c«ng")
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
		[2] = {0,107,204, 2,"Kim Cang B¸t Nh· Ch©n QuyÓn"},
		[4] = {0,107,205, 1,"TiÒm Long Tóc DiÖt Ch©n QuyÓn"},
		[3] = {0,107,206, 1,"V« TrÇn Bå §Ò Ch©n QuyÓn"},
		[6] = {0,107,207, 2,"Thiªn La Liªn Ch©u Ch©n QuyÓn"},
		[8] = {0,107,208, 1,"Nh­ ý Kim §Ønh Ch©n QuyÓn"},
		[9] = {0,107,209, 1,"BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"},
		[11] = {0,107,210, 2,"Hçn §én TrÊn Nh¹c Ch©n QuyÓn"},
		[12] = {0,107,211, 2,"Quú Thiªn Du Long Ch©n QuyÓn"},
		[14] = {0,107,212, 1,"HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"},
		[15] = {0,107,213, 2,"Qu©n Tö §íi Phong Ch©n QuyÓn"},
		[17] = {0,107,214, 2,"TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"},
		[18] = {0,107,215, 2,"Xuyªn V©n L¹c Hång Ch©n QuyÓn"},
		[20] = {0,107,216, 2,"HuyÒn Minh Phong Ma Ch©n QuyÓn"},
		[21] = {0,107,217, 1,"Linh Cæ HuyÒn Tµ Ch©n QuyÓn"},
		[23] = {0,107,218,1,"Cöu Thiªn Phong L«i Ch©n QuyÓn"},
		[25] = {0,107,219,1,"Minh gi¸o th¸nh chiÕn Ch©n QuyÓn"},
		[26] = {0,107,220,1,"Minh gi¸o trËn binh Ch©n QuyÓn"},
		[27] = {0,107,221,1,"Minh gi¸o huyÕt nh©n Ch©n QuyÓn"},
		[29] = {0,107,222,2,"Hång TrÇn Tóy Méng Ch©n QuyÓn"},
		[30] = {0,107,223,2,"Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},
		[31] = {0,107,231,2,"Mª Tung Ch©n QuyÓn"},
		[32] = {0,107,235,2,"Thiªn Phong Ch©n QuyÓn"},
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
		Talk(1, "", "§¹i hiÖp kh«ng cã trong danh s¸ch nhËn th­ëng.")
		return 0
	end
	local nCheckAward = GetExtPoint(EXT_SURVEY2016)
-- 	if nCheckAward < 30 then
-- 		PayExtPoint(EXT_SURVEY2016, GetExtPoint(EXT_SURVEY2016))
-- 	end
	if nCheckAward >= 30 then
		Talk(1, "", "§¹i hiÖp ®· nhËn th­ëng råi.")
		return 0
	end	
	AddExtPoint(EXT_SURVEY2016, 30)
--	VNG_SetExtBit(EXT_BIGPRO_PG1, 12, 1)

	-- if nAcc == "acchuaxu2000" then --4 acc nhËn th­ëng bèc th¨m vdth + cã mËt tÞch
			-- gf_AddItemEx2({2,1,30944,1},"LÖnh bµi hµo hiÖp","NHAN THUONG VDTH 122016","nhËn")
			-- gf_AddItemEx2({2,1,30945,1},"LÖnh bµi hµo hiÖp","NHAN THUONG VDTH 122016","nhËn")
			-- gf_AddItemEx2({2,1,30946,1},"LÖnh bµi hµo hiÖp","NHAN THUONG VDTH 122016","nhËn")
			-- gf_AddItemEx2({2,1,30973,1},"LÖnh bµi hµo hiÖp","NHAN THUONG VDTH 122016","nhËn")
	-- elseif nAcc == "chungainhung1" then 
			-- gf_AddItemEx2({0,152,30,1,1,-1,-1,-1,-1,-1,-1,-1,13},"Quû phï","NHAN THUONG VDTH 122016","nhËn")
			-- gf_AddItemEx2({0,153,30,1,1,-1,-1,-1,-1,-1,-1,-1,13},"Quû phï","NHAN THUONG VDTH 122016","nhËn")
			-- gf_AddItemEx2({0,154,30,1,1,-1,-1,-1,-1,-1,-1,-1,13},"Quû phï","NHAN THUONG VDTH 122016","nhËn")
	-- elseif nAcc == "chibay939" or nAcc == "s2luckytai" then 
			-- gf_AddItemEx2({2,1,30911,3},"Tam D­¬ng","NHAN THUONG VDTH 122016","nhËn")
	-- end
	-- if nAcc == "fernet106cz" then --thùc hiÖn reset pass r­¬ng cho kh theo request cña pg
		-- CancelBoxPassword()
	-- end
	local _, nItemID = AddItem(tbMatTich[nType][1], tbMatTich[nType][2], tbMatTich[nType][3], 1)
	if tbMatTich[nType][4] == 1 then
		SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
	else
		SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
	end
	gf_WriteLogEx("BIG PROMOTION 12/2016", "NhËn phÇn th­ëng", 1, "NhËn th­ëng lo¹i VIP ");		
 end
 function award_promotion(nType)
 	local tBigPro = {
 					[1] = {
							{1, "Kinh nghiÖm", 100000000},
 							{2, "Bµn Long BÝch", {2, 1, 1000, 1,4}, 7 * 24 * 3600},
 							{2, "Cæ Linh Ngäc", {2, 1, 30369, 40,4}, 0},
 							{2, "Cæ Linh Th¹ch", {2, 1, 30368, 100,4}, 0},
 							{2, "M¶nh Thiªn M«n", {2, 1, 30410, 25, 4}, 0}, 						
 							{2, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1, 4}, 7 * 24 * 3600}, 	
 							{2, "Huy Ch­¬ng Anh Hïng", {2, 1, 30499, 50, 4}, 0}, 	
 							{2, "Tói H¹t Gièng", {2, 1, 30087, 1, 4}, 0}, 	
 							{2, "B¸t Nh· Lín", {2, 0, 398, 3, 4}, 0}, 	
 							{2, "Thiªn Kiªu LÖnh", {2, 97, 236, 2, 4}, 0}, 	
 						},
 					[2] = {
 							{2, "TÈy T©m Th¹ch cÊp 3", {2, 1, 30523, 2, 4}, 0}, 	
 							{2, "LuyÖn L« ThiÕt cÊp 3", {2, 1, 30529, 2, 4}, 0}, 	
 							{2, "B¨ng Tinh Th¹ch", {2, 1, 30554, 4, 4}, 0}, 	
 							{2, "B¸t Nh· Nhá", {2, 0, 504, 2, 4}, 0}, 	
 							{2, "B¸t Nh· Lín", {2, 0, 398, 2, 4}, 0}, 	
 							{2, "Thiªn Kiªu LÖnh", {2, 97, 236, 2, 4}, 0}, 	
 						},
-- 					[1] = {--Ch­¬ng tr×nh Change Pass
--							{1, 3000, "R­¬ng Cöu Hoa Ngäc Lé Hoµn", {2, 1, 30824, 1}},
-- 							{1, 2500, "R­¬ng §iÒn ThÊt Sa §¶m Hoµn", {2, 1, 30823, 1}},
-- 							{1, 3000, "R­¬ng Nh©n S©m D­ìng Vinh Hoµn", {2, 1, 30822, 1}},
-- 							{1, 500, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1}},
-- 							{1, 1000, "Thiªn Kiªu LÖnh (khãa)", {2, 97, 236, 1, 4}},
-- 						},
-- 					[2] = {--Ch­¬ng tr×nh VL Plus
-- 							{2, 2500, 1000000, 1},	
-- 							{2, 2000, 5000000, 1},	
-- 							{2, 1500, 10000000, 1},	
-- 							{1, 2500, "Thó c­ìi Kim Mao Ng­u", {0, 105, 30006, 1,1,-1,-1,-1,-1,-1,-1,-1}, 7 * 24 * 3600},
-- 							{1, 2000, "VÐ TiÕu Y B¹c", {2, 1, 30492, 1}},
--							{1, 2000, "Bµn Long BÝch", {2, 1, 1000, 1}, 7 * 24 * 3600},
-- 							{1, 2000, "Thiªn Kiªu LÖnh (khãa)", {2, 97, 236, 1, 4}},
-- 							{1, 2000, "C©y B¸t Nh· Lín", {2, 0, 398, 1}},
-- 						},
 				}
 	--Bit 3: nhËn th­ëng ingame Hç trî passport
	--Bit 4: nhËn th­ëng ingame VL Plus		

	local nchecklevel = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()	
	if nType == 1 then
		if nchecklevel < 697 then
			Talk(1, "", "C¸c h¹ ch­a ®¹t chuyÓn sinh 6, cÊp 97, nªn kh«ng thÓ nhËn th­ëng")
			return 0
		end				
	end
	if gf_Judge_Room_Weight(10, 300," ") ~= 1 then
        	return 0
    end	
	local nCheckAward = gf_GetExtPointBit(EXT_BIGPRO_PG1,nType+2)	
	local nCheckActive = gf_GetExtPointBit(EXT_BIGPRO_PG1,nType)	
	if nCheckActive == 0 then
		Talk(1, "", "B¹n ch­a nhËp code nªn kh«ng thÓ nhËn th­ëng.")
		return 0
	end
	if nCheckAward == 1 then
		Talk(1, "", "B¹n ®· nhËn th­ëng råi.")
		return 0
	end
	VNG_SetExtBit(EXT_BIGPRO_PG1, nType+2, 1)
	for i = 1, getn(tBigPro[nType]) do
		if tBigPro[nType][i][1] == 1 then
			ModifyExp(tBigPro[nType][i][3])
		else
			gf_AddItemEx2(tBigPro[nType][i][3], tBigPro[nType][i][2],"BIG PROMOTION 12/2015 BK", "NhËn phÇn th­ëng", tBigPro[nType][i][4])
		end
	end
--	gf_EventGiveRandAward(tBigPro[nType], gf_SumRandBase(tBigPro[nType]), 1, "BIG PROMOTION 7/2015 BK", "NhËn th­ëng thµnh c«ng");
	gf_WriteLogEx("BIG PROMOTION 12/2015", "NhËn phÇn th­ëng", 1, "NhËn th­ëng lo¹i "..nType);		
 end
 function award_BHTA15()
 local VET_HOAPHUNG_CLOTH = {
	[4] = {
		[1] = {{0, 100, 30315, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30443, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 100, 30316, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel},{0, 100, 30444, 1, 4, -1, -1, -1, -1, -1, -1, -1, nLevel}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
}

local VET_HOAPHUNG_CAP = {
	[4] = {
		[1] = {{0, 103, 30315, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 103, 30443, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 103, 30316, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 103, 30444, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
}  

local VET_HOAPHUNG_SHOE = {
	[4] = {
		[1] = {{0, 101, 30315, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 101, 30443, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 101, 30316, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0},{0, 101, 30444, 1, 4, -1, -1, -1, -1, -1, -1, -1, 0}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
}

local VET_HOAPHUNG_PHU = {
	[4] = {
		[1] = {{0, 102, 30360, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30808, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 102, 30361, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30809, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
}

local VET_HOAPHUNG_KY = {
	[4] = {
		[1] = {{0, 102, 30296, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30744, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 102, 30297, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30745, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
}

local VET_HOAPHUNG_BAI = {
	[4] = {
		[1] = {{0, 102, 30232, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30680, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
		[2] = {{0, 102, 30233, 1, 4, -1, -1, -1, -1, -1, -1, -1},{0, 102, 30681, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang"},
	},
}

	local nDate = tonumber(date("%Y%m%d"))
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nCheck = check_gamer_inlist()
	local nAcc = GetAccount()
--	if nRoute ~= 9 then
--		Talk(1, "", "HÖ ph¸i cña ®¹i hiÖp kh«ng cã trong danh s¸ch nhËn th­ëng.")
--		return 0
--	end

	if nCheck == 0 then
		Talk(1, "", "§¹i hiÖp kh«ng cã trong danh s¸ch nhËn th­ëng.")
		return 0
	end

	if GetTask(TSK_TRAOTHUONG_BHTA15) >= 1 then
 		Talk(1, "", "§¹i hiÖp ®· nhËn th­ëng Bang Héi Tinh Anh 16 råi.")
 		return 0		
 	end
 	if gf_Judge_Room_Weight(7, 100," ") ~= 1 then
        	return 0
	end	
	-- SetTask(TSK_TRAOTHUONG_BHTA15,1)
	-- gf_WriteLogEx("NHAN THUONG BHTA16", "nhËn thµnh c«ng", 1, "phÇn th­ëng")
	-- Talk(1, "", "Chóc mõng ®¹i hiÖp nhËn th­ëng thµnh c«ng gi¶i th­ëng Bang Héi Tinh Anh 16.")	
	-- local nQuanHam = GetTask(704)
	-- if nAcc == "tlq222" then
		-- if nQuanHam < 0 then	
			-- gf_AddItemEx2(VET_HOAPHUNG_CLOTH[nRoute][nBody][2], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA14 ", "NhËn trang bÞ háa phông", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_CAP[nRoute][nBody][2], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA14 ", "NhËn trang bÞ háa phông", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_SHOE[nRoute][nBody][2], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA14 ", "NhËn trang bÞ háa phông", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_PHU[nRoute][nBody][2], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA14 ", "NhËn trang bÞ háa phông", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_KY[nRoute][nBody][2], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA14 ", "NhËn trang bÞ háa phông", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_BAI[nRoute][nBody][2], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA14 ", "NhËn trang bÞ háa phông", 0, 1);
	 	-- else
	 		-- gf_AddItemEx2(VET_HOAPHUNG_CLOTH[nRoute][nBody][1], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA14 ", "NhËn trang bÞ háa phông", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_CAP[nRoute][nBody][1], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA14 ", "NhËn trang bÞ háa phông", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_SHOE[nRoute][nBody][1], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA14 ", "NhËn trang bÞ háa phông", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_PHU[nRoute][nBody][1], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA14 ", "NhËn trang bÞ háa phông", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_KY[nRoute][nBody][1], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA14 ", "NhËn trang bÞ háa phông", 0, 1);
			-- gf_AddItemEx2(VET_HOAPHUNG_BAI[nRoute][nBody][1], "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA14 ", "NhËn trang bÞ háa phông", 0, 1);
	 	-- end
	 -- end
	 -- if nAcc == "thienthanh12cute" then
	 	-- gf_AddItemEx2({0, 103, 30315, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA16 ", "NhËn trang bÞ háa phông", 0, 1);
		-- gf_AddItemEx2({0, 102, 30232, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA16 ", "NhËn trang bÞ háa phông", 0, 1);
	 -- end
	  -- if nAcc == "s2luckytai" then
	 	-- gf_AddItemEx2({0, 102, 30305, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA16 ", "NhËn trang bÞ háa phông", 0, 1);
		-- gf_AddItemEx2({0, 102, 30369, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA16 ", "NhËn trang bÞ háa phông", 0, 1);
	 -- end
	  -- if nAcc == "vitxinh180592" then
		-- gf_AddItemEx2({0, 100, 30450, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA16 ", "NhËn trang bÞ háa phông", 0, 1);
		-- gf_AddItemEx2({0, 101, 30450, 1, 4, -1, -1, -1, -1, -1, -1, -1}, "Bé Trang bÞ Háa Phông T­íng Qu©n", "NHAN THUONG BHTA16 ", "NhËn trang bÞ háa phông", 0, 1);
	 -- end
 end
 
 function award_vdth()
 	if GetTask(TSK_VANGDANHTHIENHA_DUATOP) >= 1 then
 		Talk(1, "", "§¹i hiÖp ®· nhËn th­ëng råi.")
 		return 0		
 	end
 	if gf_Judge_Room_Weight(18, 300, strNpcName) == 0 then
		Talk(1,"", "Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i hµnh trang.")
		return
	end
 	SetTask(TSK_VANGDANHTHIENHA_DUATOP,1)
 	AddTrangBiHoaPhungTuongQuan(0,0)
	TraoMatTichCaoCap20(7)
	local tbAward = {item={{gdp={0,105,160,1,4,-1,-1,-1,-1,-1,-1,-1,0}}}}
	LIB_Award:Award(tbAward)
	Talk(1, "", "Chóc mõng ®¹i hiÖp nhËn th­ëng ®ua top Vang Danh Thiªn H¹.")
	gf_WriteLogEx("NHAN THUONG LAI DUA TOP DUY HO", "nhËn thµnh c«ng", 1, "phÇn th­ëng")
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
--		Talk(1, "", szNpcName.."§¹i hiÖp ch­a kÝch ho¹t Minh Gi¸o LÖnh.")
--		return 0
--	end	

 	if nExt_Support >= 345 then
		Talk(1, "", szNpcName.."§¹i hiÖp ®· nhËn hç trî råi")
		return 0
	end	
--	if nAcc == "thanhlonglenh888" then
--		otrong = 4
--	end
	if gf_Judge_Room_Weight(otrong,100) ~= 1 then
			Talk(1,"",szNpcName.."Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
			return
	end
	
--	if nRoute == 0 then
--		Talk(1, "", "§¹i hiÖp ch­a gia nhËp m«n ph¸i nµo, nªn kh«ng thÓ nhËn th­ëng ®­îc.")
--		return 0
--	end 
	
	for i = 1, getn(tbds_nhiemvu) do
		if tbds_nhiemvu[i][1] ==  nAcc and tbds_nhiemvu[i][3] == nServerID then	--and tbds_nhiemvu[i][2] ==  nRole
			nCheck = 1
			break
		end
	end	
	if nCheck ~= 1 then
		Talk(1,"",szNpcName.."§¹i hiÖp kh«ng cã trong danh s¸ch nhËn hç trî.")
		return 0
	end

	if nCheck == 1 then		
			
		-- if nAcc == "jx2cbbvip2018" then 
			-- SetTask(704, 6)		--qu©n hµm So¸i Tèng
			
			-- AddExtPoint(EXT_SURVEY2016, 345)
			-- Talk(1, "", szNpcName.."§¹i hiÖp nhËn hç trî VIP thµnh c«ng.")
			-- gf_WriteLogEx("HO TRO NV", "nhËn hç trî VIP", 1, "nhan ho tro vip")			
		-- end	
		
	end	
--SetSelfLiveness(9915)	--®iÓm tÝch cùc c¸ nh©n
-- gf_AddItemEx2({0,154,33,1,4,-1,-1,-1,-1,-1,-1,-1}, "Ho tro VIP", "HO TRO NV ", "Hç trî VIP")		
--			AddTitle(28, 2) -- danh hiÖu cs5	
--			ClearItemInPos()
--GiveJue()--yeu quyet theo he phai
--			thangcapnhanthuong_695_HT()	
--			SetTask(704, 6)		--qu©n hµm So¸i Tèng
--			gf_Modify("JunGong",7000000)	--®iÓm qu©n c«ng	
--			gf_Modify("ShiMen",11000)	--®iÓm s­ m«n
--			gf_Modify("Rep",2000)	--®iÓm danh väng
--			SetTask(652,0) --®iÓm tö quang c¸c
--			CancelBoxPassword()
--			gf_AddItemEx2({0,153,31,1,4,-1,-1,-1,-1,-1,-1,-1}, "Ho tro bi hack", "HO TRO NV ", "Hç trî bÞ hack")
--			gf_AddItemEx2({2,1,31117,1,4}, "Ho tro nhiem vu", "HO TRO NV", "Hç trî nhiÖm vô")
--			MeridianUpdateLevel()
--		if nAcc == "mapthulu9193" or nAcc == "nhacca144" then	
--			for i=1,4 do	--®¸ quÝ level3
--				gf_AddItemEx2({2,22,i*100+3, 6}, "®¸ quÝ 3 hÖ ph¸i", "HO TRO NV" , "nhËn")
--			end
--			for i=1,4 do	--®¸ quÝ level4
--				gf_AddItemEx2({2,22,i*100+4, 6}, "®¸ quÝ 4 hÖ ph¸i", "HO TRO NV" , "nhËn")
--			end
--			for i=1,4 do	--®¸ quÝ level5
--				gf_AddItemEx2({2,22,i*100+5, 4}, "®¸ quÝ 5 hÖ ph¸i", "HO TRO NV" , "nhËn")
--			end
--			for i=1,4 do	--®¸ quÝ level6
--				gf_AddItemEx2({2,22,i*100+6, 1}, "®¸ quÝ 6 hÖ ph¸i", "HO TRO NV" , "nhËn")
--			end
--			gf_AddItemEx2({2,1,30912,2400,4},"HiÖp NghÜa Chi Chøng","HO TRO NV","HiÖp NghÜa Chi Chøng")
--			
--			AddExtPoint(EXT_SURVEY2016, 58)
--			Talk(1, "", szNpcName.."§¹i hiÖp nhËn hç trî VIP thµnh c«ng.")
--		end	
	
 end
 function chohuong_chuyensinh_VIP()
		local tRoute = {"Long Tö", "Hæ Tö", "¦ng Tö", "Phông Tö"}
		local szTitle = format("B¹n sÏ t¨ng lªn chuyÓn sinh 8, mêi b¹n chän m«n héi muèn ra nhËp.")
    		local tbSay = {}
		for i=1,getn(tRoute) do
			tinsert(tbSay, format("%s/#hotro_chuyensinh_VIP(%d, %d, %d)", tRoute[i], 8, 10, i))
		end
		tinsert(tbSay,"Ta chØ ghÐ qua/nothing")
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
							{"Long Tö Ên",{2,0,30002,1,1}, "Long Tö"},
							{"Hæ Tö Ên",{2,0,30003,1,1}, "Hæ Tö"},
							{"¦ng Tö Ên",{2,0,30006,1,1}, "¦ng Tö"},
							{"Phông Tö Ên",{2,0,30005,1,1}, "Phông Tö"},							
					}
	local tb_translife_cloth_PS = {
										[1] = {
													{"ChuyÓn Sinh Trang", {0,108,30005,1,4,5,639,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},		
										[2] = {
													{"ChuyÓn Sinh Trang", {0,108,30005,1,4,6,302,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,409,6,102}}, 
													{"ChuyÓn Sinh Trang", {0,110,30005,1,4,5,79,5,80,6,102}},
											},
										[3] = {
													 {"ChuyÓn Sinh Trang", {0,108,30005,1,4,2,13075,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},	
										[4] = {
													 {"ChuyÓn Sinh Trang", {0,108,30005,1,4,5,27,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"ChuyÓn Sinh Trang", {0,110,30005,1,4,4,292,4,293,6,102}},
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
	if nTransKs == 3 then 	--phôc sinh 3
		local nPhucSinh_Count = GetPlayerRebornParam(0) 
		local nRoute = GetPlayerRoute()
		local tbType = {"Long Tö", "Hæ Tö", "¦ng Tö", "Phông Tö"}
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
		PlayerReborn(3,nType) -- ChuyÓn Sinh 8 thµnh c«ng (Phôc Sinh 3)
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
		gf_WriteLogEx("THE VIP", "chuyÓn sinh thµnh c«ng", 1, "THE VIP chuyen sinh 8")	
		ExitGame()		
	end
--	AddExtPoint(EXT_SURVEY2016, 37)
	Talk(1, "", szNpcName.."§¹i hiÖp ®· nhËn hç trî thµnh c«ng")
	
end
function get_danhhieu()
	if GetTask(TSK_TRAOTHUONG_BHTA15) >= 1 then
		Talk(1, "", szNpcName.."§¹i hiÖp ®· nhËn danh hiÖu råi.")
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
	
	Talk(1, "", szNpcName.."§¹i hiÖp ®· nhËn danh hiÖu thµnh c«ng, h·y vµo b¶ng nh©n vËt ®Ó kÝch ho¹t danh hiÖu.")
end
function ThanHo_get_danhhieuVV()
	if MeridianGetLevel() == 2 then
		Talk(1, "", "Chóc mõng ®¹i hiÖp nhËn nhËn th­ëng c¶nh giíi Vâ V­¬ng thµnh c«ng.")
		MeridianUpdateLevel()
	else
		Talk(1, "", "C¶nh giíi cña ®¹i hiÖp kh«ng phï hîp ®Ó nhËn th­ëng.")
	end
end
function thangcapnhanthuong_695_HT()

	local tbSay = {}		
	tinsert(tbSay,"Ta muèn nhËn trang bÞ Kim Xµ V©n Du/#thangcapnhanthuong_695_finish(1)")
	tinsert(tbSay,"Ta muèn nhËn trang bÞ Kim Xµ ThiÕt HuyÕt/#thangcapnhanthuong_695_finish(2)")
	tinsert(tbSay,"Ta muèn nhËn trang bÞ Kim Xµ Du HiÖp/#thangcapnhanthuong_695_finish(3)")
	Say(szNpcName.."C¸c h¹ h·y lùa chän 1 trong 3 bé trang bÞ Kim Xµ: ",getn(tbSay),tbSay)
end
function thangcapnhanthuong_695_finish(nChoice)
	AddExtPoint(EXT_SURVEY2016, 0922)
	Talk(1, "", szNpcName.."§¹i hiÖp nhËn hç trî thµnh c«ng.")
	
	if nChoice  == 1 then
		LIB_Award:Award(tbKimXaVanDu7)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ V©n Du")
	elseif nChoice == 2 then
		LIB_Award:Award(tbKimXaThietHuyet7)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ ThiÕt HuyÕt")
	elseif nChoice == 3 then
		LIB_Award:Award(tbKimXaDuHiep7)
		Msg2Player("NhËn thµnh c«ng bé trang bÞ Kim Xµ Du HiÖp")
	end	
		gf_AddItemEx2({2,1,30497,1000,1},"Ma Tinh","DUA TOP","Ma Tinh")
		AwardGenuineQi(80000)
		gf_AddItemEx2({2,1,1001,1,4},"Hßa ThÞ BÝch","DUA TOP","nhËn hßa thÞ bÝch",7*24*3600,1)
		gf_AddItemEx2({2,1,30368,100,4},"Cæ Linh Th¹ch","DUA TOP","nhËn Cæ Linh Th¹ch")
		gf_AddItemEx2({2,1,30369,100,4},"Cæ Linh Ngäc","DUA TOP","nhËn Cæ Linh Ngäc")	
		gf_AddItemEx2({2,1,30912,800,4},"HiÖp NghÜa Chi Chøng","DUA TOP","HiÖp NghÜa Chi Chøng")	
		for i=1,4 do	--®¸ quÝ level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "®¸ quÝ 3 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		for i=1,4 do	--®¸ quÝ level4
			gf_AddItemEx2({2,22,i*100+4, 1}, "®¸ quÝ 4 hÖ ph¸i", "DUA TOP" , "nhËn")
		end
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nhËn", 1, "vdth PhÇn th­ëng Phôc sinh 1 cÊp 94")
end
function _chuyensinh8_ThanHo_get_danhhieu()
	local nChuyenSinh = GetPlayerRebornParam(0)
	if nChuyenSinh == 3 then
		RemoveTitle(61,6)
		AddTitle(71,1)
		Talk(1, "", szNpcName.."§¹i hiÖp danh hiÖu chuyÓn sinh 8 thµnh c«ng.")
	else	
		Talk(1, "", szNpcName.."danh hiÖu cña §¹i hiÖp kh«ng phï hîp.")
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
		tinsert(tSay,"§¨ng nhËp Online ngµy TÕt - nhËn th­ëng/#finish_Online_award_2018(1)")
	end
	if nAward2== 0 then
		tinsert(tSay,"§¨ng nhËp Online ngµy TÕt ®ñ 60 phót - nhËn th­ëng/#finish_Online_award_2018(2)")
	end
--	if nAward3 == 0 then
--		tinsert(tSay,"§¨ng nhËp Online ngµy TÕt ®ñ 60 phót - nhËn th­ëng/#finish_Online_award_2018(3)")
--	end
--	if nAward6 == 0 then
--		tinsert(tSay,"§¨ng nhËp Online ngµy TÕt ®ñ 60 phót - nhËn bï ngµy 01-01-2020/#finish_Online_award_2018(6)")
--	end
--	tinsert(tSay,"§¨ng nhËp ngµy TÕt - nhËn th­ëng/#finish_Online_award_2018(1)")
--	tinsert(tSay,"Online ngµy TÕt ®ñ 60 phót - nhËn th­ëng/#finish_Online_award_2018(2)")
	tinsert(tSay,"Ta chØ ghÐ qua/nothing")
	Say(szNpcName.." §¨ng nhËp nhËn th­ëng, vµ online ®ñ 60 phót nhËn th­ëng. §¹i hiÖp ®· online ®­îc "..nOnlineTime.." phót.",getn(tSay),tSay)
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
													{gdp={2, 1, 30912, 3000, 4}, name="HiÖp NghÜa Chi Chøng"},	--, nExpired = 15*24*60*60},
													{gdp={2, 1, 30847, 2, 4}, name="Håi Tiªn §¬n"},
													{gdp={2, 1, 31383, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M¶nh Kim Xµ 6"},
													},	
												nExp = 500000000,
												--fn = "ngoaitrangMaiLieu()",
												},
										[22] = {item ={													
													{gdp={2, 1, 31244, 200, 4}, name="M¶nh C¬ Quan MÆc Gia"},
													{gdp={2, 1, 30847, 2, 4}, name="Håi Tiªn §¬n"},
													{gdp={2, 1, 31383, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M¶nh Kim Xµ 6"},
													},	
												nExp = 500000000,
												},
										[23] = {item ={													
													{gdp={2, 1, 31244, 200, 4}, name="M¶nh C¬ Quan MÆc Gia"},
													{gdp={2, 1, 31001, 1, 4}, name="Tói §¸ QuÝ CÊp 4"},
													{gdp={2, 1, 31383, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M¶nh Kim Xµ 6"},
													},	
												nExp = 500000000,
												},
										[24] = {item ={													
													{gdp={2, 1, 31244, 200, 4}, name="M¶nh C¬ Quan MÆc Gia"},
													{gdp={2, 1, 31001, 1, 4}, name="Tói §¸ QuÝ CÊp 4"},
													{gdp={2, 1, 31383, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M¶nh Kim Xµ 6"},
													},	
												nExp = 500000000,
												},	
										[25] = {item ={													
													{gdp={2, 1, 1113, 1, 4}, name="§¹i §Þnh Hån", nExpired = 7*24*60*60},
													{gdp={2, 97, 236, 1, 4}, name="Thiªn Kiªu LÖnh", nExpired = 7*24*60*60},
													{gdp={2, 1, 31123, 1, 4}, name="Tói §¸ QuÝ CÊp 6"}, 
													{gdp={2, 1, 31244, 500, 4}, name="M¶nh C¬ Quan MÆc Gia"},
													{gdp={2, 1, 31383, 5, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31384, 5, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31385, 5, 4}, name="M¶nh Kim Xµ 6"},
													},	
												nExp = 2000000000,
												},	
										[26] = {item ={	
													{gdp={2, 1, 1009, 1, 4}, name="Thiªn Th¹ch Tinh Th¹ch", nExpired = 7*24*60*60},
													{gdp={2, 1, 31024, 1, 4}, name="Tói §¸ QuÝ CÊp 5"},
													{gdp={2, 1, 1067, 1, 4}, name="§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", nExpired = 7*24*60*60},
													{gdp={2, 1, 31383, 3, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31384, 3, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31385, 3, 4}, name="M¶nh Kim Xµ 6"},
													},	
												nExp = 1000000000,
												},											
										[27] = {item ={													
													{gdp={2, 1, 31024, 1, 4}, name="Tói §¸ QuÝ CÊp 5"},
													{gdp={2, 1, 30847, 2, 4}, name="Håi Tiªn §¬n"},
													{gdp={2, 1, 31244, 200, 4}, name="M¶nh C¬ Quan MÆc Gia"},	
													{gdp={2, 1, 31383, 3, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31384, 3, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31385, 3, 4}, name="M¶nh Kim Xµ 6"},
													},	
												nExp = 1000000000,
												},	
										[28] = {item ={													
													{gdp={2, 1, 31001, 1, 4}, name="Tói §¸ QuÝ CÊp 4"},
													{gdp={2, 1, 31244, 200, 4}, name="M¶nh C¬ Quan MÆc Gia"},
													{gdp={2, 1, 31383, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M¶nh Kim Xµ 6"},
													},	
												nExp = 500000000,
												},	
										[29] = {item ={													
													{gdp={2, 1, 31001, 1, 4}, name="Tói §¸ QuÝ CÊp 4"},
													{gdp={2, 1, 30728, 1, 4}, name="Trøng Linh Thó-Cao"},
													{gdp={2, 1, 31383, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M¶nh Kim Xµ 6"},
													},	
												nExp = 500000000,
												},	
										[30] = {item ={													
													{gdp={2, 1, 31001, 1, 4}, name="Tói §¸ QuÝ CÊp 4"},
													{gdp={2, 1, 1068, 1, 4}, name="Thiªn Th¹ch linh th¹ch", nExpired = 7*24*60*60},
													{gdp={2, 1, 31383, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M¶nh Kim Xµ 6"},
													},	
												nExp = 500000000,
												},	
										[31] = {item ={													
													{gdp={2, 1, 31001, 1, 4}, name="Tói §¸ QuÝ CÊp 4"},
													{gdp={2, 1, 30847, 2, 4}, name="Håi Tiªn §¬n"},
													{gdp={2, 1, 31383, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M¶nh Kim Xµ 6"},
													},	
												nExp = 500000000,
												},	
										[1] = {item ={													
													{gdp={2, 1, 31001, 1, 4}, name="Tói §¸ QuÝ CÊp 4"},
													{gdp={2, 1, 30847, 2, 4}, name="Håi Tiªn §¬n"},
													{gdp={2, 1, 31383, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M¶nh Kim Xµ 6"},
													},	
												nExp = 500000000,
												},	
										[2] = {item ={													
													{gdp={2, 1, 31001, 1, 4}, name="Tói §¸ QuÝ CÊp 4"},
													{gdp={2, 1, 30847, 2, 4}, name="Håi Tiªn §¬n"},
													{gdp={2, 1, 31383, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M¶nh Kim Xµ 6"},
													},	
												nExp = 500000000,
												},	
										[3] = {item ={													
													{gdp={2, 1, 31001, 1, 4}, name="Tói §¸ QuÝ CÊp 4"},
													{gdp={2, 1, 30847, 2, 4}, name="Håi Tiªn §¬n"},
													{gdp={2, 1, 31244, 500, 4}, name="M¶nh C¬ Quan MÆc Gia"},
													{gdp={2, 1, 31383, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31384, 1, 4}, name="M¶nh Kim Xµ 6"},
													{gdp={2, 1, 31385, 1, 4}, name="M¶nh Kim Xµ 6"},
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
		Talk(1,"",szNpcName.."Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return
	end	
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "",szNpcName.."T×nh tr¹ng hiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end	
	if GetLevel() < 59 then		--gf_GetPlayerRebornCount() < 1 and
		Talk(1, "", szNpcName.."B¹n kh«ng ®ñ ®¼ng cÊp 59 nªn kh«ng thÓ nhËn th­ëng.")	
		return 0
	end
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", szNpcName.."B¹n ch­a häc xong 1 kü n¨ng cÊp 55 nªn kh«ng thÓ nhËn th­ëng.")	
		return 0
	end
	if nType == 1 then
		if nAward1 == 1 then
			Talk(1, "", szNpcName.."B¹n ®· nhËn th­ëng råi nªn kh«ng thÓ nhËn th­ëng.")	
			return 0
		end
	end
	if nType == 2 then
		if nAward2 == 1 then
			Talk(1, "", szNpcName.."B¹n ®· nhËn th­ëng råi nªn kh«ng thÓ nhËn th­ëng.")	
			return 0
		end
		if nOnlineTime < 3600 then
			Talk(1, "", szNpcName.."B¹n ch­a online ®ñ 60 phót nªn kh«ng thÓ nhËn th­ëng.")	
			return 0
		end
	end

	
	--Award
	if nType == 1 then
		VNG_SetTaskPos(TSK_Award_2018, 1, 1, 1)	
		ModifyExp(tbAwardOnline_2018[nType][nDay][1])
		Msg2Player("B¹n nhËn ®­îc "..tbAwardOnline_2018[nType][nDay][1].." ®iÓm kinh nghiÖm.")	
		gf_WriteLogEx("PHAN THUONG ONLINE 2020", "nhËn", 1, "NhËn thµnh c«ng online 1 gi©y")
	end
	if nType == 2 then
		VNG_SetTaskPos(TSK_Award_2018, 1, 2, 2)	
		LIB_Award.szLogTitle = "PHAN THUONG ONLINE 2019"
		LIB_Award.szLogAction = "NhËn thµnh c«ng online 60 phót"
		LIB_Award:Award(tbAwardOnline_2018[nType][nDay])
	end

end
function dangkychuyenserver_chonserver()
	local tbServer = {
		{2,"Tµng Long"}, 
		{3,"B¹ch Hæ"}, 
		{8,"Phôc Hæ"},
		{22,"Thiªn Long"},
		{33,"ThÇn Long"},
		{39,"Qu¸n Hæ"},
		{89, "Linh B¶o S¬n"},
		{92, "Háa Phông"},
		{118,"ChiÕn Hæ"},
		{121,"Cuång Long"},
--		{122,"Uy Hæ"},
		}
	local nExt_Support = GetExtPoint(EXT_SURVEY2016)
	local nChuyenSinh = gf_GetTransLevel()
 	if nExt_Support < 64 then
 		PayExtPoint(EXT_SURVEY2016, GetExtPoint(EXT_SURVEY2016))
 	end
	if nExt_Support >= 64 then
		Talk(1, "", szNpcName.."§¹i hiÖp ®· ®¨ng ký chuyÓn server råi.")
		return 0
	end	
	if GetItemCount(2,1,30230) < 300 then
		Talk(1,"",szNpcName.."§¹i hiÖp kh«ng mang ®ñ 300 Xu vËt phÈm !!! ")
		return 0
	end
	if nChuyenSinh < 10 or nChuyenSinh > 799 then
		Talk(1,"",szNpcName.."§¼ng cÊp 10 ®Õn chuyÓn sinh 7 cÊp 99 míi cã thÓ ®¨ng ký chuyÓn server!")
		return 0
	end
	local tbDanhsachServer = {}
	for i=getn(tbServer),1,-1 do
		tinsert(tbDanhsachServer, tbServer[i][2].."/#dangkychuyenserver("..tbServer[i][1]..")")
	end
	tinsert(tbDanhsachServer, "Ta sÏ quay l¹i sau/nothing")
	
	Say(szNpcName.."§¹i hiÖp muèn chuyÓn ®Õn Server nµo?", getn(tbDanhsachServer), tbDanhsachServer)
end
function dangkychuyenserver(nNewServer)
	local nServerID = GetGlbValue(1023)
	
	if nNewServer == nServerID then
		Talk(1,"",szNpcName.."§¹i hiÖp ®ang ë server nµy råi.")
		return 0
	end
	SetTask(TSK_ChuyenServer, nNewServer)
	AskClientForString("KiemTraDangKyChuyenServer","",6,15,"NhËp Tªn Míi");
end
function KiemTraDangKyChuyenServer(szNewName)
	local szAcc = GetAccount()
	local szRole = GetName()
	local nServerID = GetGlbValue(1023)
	local nNewServer = GetTask(TSK_ChuyenServer)
	if GetItemCount(2,1,30230) < 300 then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ 300 Xu vËt phÈm !!! ")
		return 0
	end
	if LIB_txtData:CheckString(szNewName) > 0 then
		Talk(1, "",szNpcName.."Tªn míi cña c¸c h¹ cã nhiÒu ch÷ l¹ qu¸, ta kh«ng biÕt ghi l¹i nh­ thÕ nµo n÷a. Hay lµ ®æi tªn kh¸c ®i nhÐ.")
		return 0
	end
	
	LIB_txtData:Init(CHUYENSERVER_FILENAME)
	LIB_txtData:LoadMultiColumn()
	if DelItem(2,1,30230,300) ~= 1 then
		Talk(1, "", szNpcName.."§¹i hiÖp kh«ng mang ®ñ 300 Xu vËt phÈm !!!")
		return 0
	end
	local szData = szAcc.."	"..szRole.."	"..szNewName.."	"..nServerID.."	"..nNewServer
	LIB_txtData:AddLine(szData)
	LIB_Award.szLogTitle = "DANG KY CHUYEN SERVER"
	LIB_Award.szLogAction = "§¨ng ký chuyÓn thµnh c«ng"
	AddExtPoint(EXT_SURVEY2016, 64)
	Talk(1, "", szNpcName.."§¹i hiÖp ®¨ng ký chuyÓn server thµnh c«ng.")
end
function hotrodiemnangdongpbm()
	local nExtPoint = GetExtPoint(3)
	if nExtPoint == 0 then
		Talk(1, "", "§¹i hiÖp ch­a kÝch ho¹t code Uy Hæ LÖnh 4, nªn kh«ng thÓ nhËn th­ëng.")
		return 0
	end
	local nOneTime = GetTaskPosition(TSK_HOTRO_QUANCONG, 1)
	if nOneTime >= 1 then
		Talk(1, "", "§¹i hiÖp ®· nhËn hç trî ®iÓm n¨ng ®éng råi.")
		return 0
	end

	SetTask(3053, GetTask(3053)+200)
	Talk(1, "", "Chóc mõng b¹n ®· nhËn hç trî 200 ®iÓm n¨ng ®éng thµnh c«ng")
	Msg2Player("Chóc mõng b¹n nhËn 200 ®iÓm n¨ng ®éng")
	SetTaskPosition(TSK_HOTRO_QUANCONG, 1, nOneTime+1)
	gf_WriteLogEx("NHAN HO TRO ALL SERVER", "nhËn thµnh c«ng", 1, "200 n¨ng ®éng")

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
			Talk(1, "", "§¹i hiÖp ®¹t chuyÓn sinh 6 cÊp "..nLevelCheck1.." råi h·y quay l¹i nhËn hç trî. ")
			return 0
		end	
		local nOneTimeExp = GetTaskPosition(TSK_HOTRO_QUANCONG, 2)
		if nOneTimeExp >= 1 then
			Talk(1, "", "§¹i hiÖp ®· nhËn hç trî ®iÓm kinh nghiÖm råi, xin h·y chän nhËn hç trî kh¸c.")
			return 0
		end
		local nExp = 2000000000
		ModifyExp(nExp)
		Talk(1, "", "Chóc mõng b¹n ®· nhËn hç trî 2 tû ®iÓm kinh nghiÖm thµnh c«ng")
		Msg2Player("Chóc mõng b¹n nhËn 2 tû ®iÓm kinh nghiÖm")
		SetTaskPosition(TSK_HOTRO_QUANCONG, 2, nOneTimeExp+1)
		gf_WriteLogEx("NHAN HO TRO ALL SERVER", "nhËn thµnh c«ng", 1, "2 tû exp")
		return 0
	end
	if nType == 3 then
		if nchecklevel < nLevelCheck then
			Talk(1, "", "§¹i hiÖp ®¹t chuyÓn sinh 8 cÊp "..nLevelCheck1.." råi h·y quay l¹i nhËn hç trî. ")
			return 0
		end	
		local nOneTimeCT = GetTaskPosition(TSK_HOTRO_QUANCONG, 3)
		if nOneTimeCT >= 1 then
			Talk(1, "", "§¹i hiÖp ®· nhËn hç trî ®iÓm c«ng tr¹ng råi, xin h·y chän nhËn hç trî kh¸c.")
			return 0
		end
		local tbSayDialog = {};
		local nSaySize = 0;
		local szSayHead = "Ta hç trî cho §¹i hiÖp ®iÓm c«ng tr¹ng."
		
		tinsert(tbSayDialog, "- Kh«ng sö dông qu©n c«ng ch­¬ng: nhËn 10000 ®iÓm c«ng tr¹ng/#_hotrocongtrangpbm(1)")
		tinsert(tbSayDialog, "- Sö dông qu©n c«ng ch­¬ng: nhËn 20000 ®iÓm c«ng tr¹ng/#_hotrocongtrangpbm(2)")
		tinsert(tbSayDialog, "- Sö dông qu©n c«ng ®¹i: nhËn 40000 ®iÓm c«ng tr¹ng/#_hotrocongtrangpbm(3)")	
		tinsert(tbSayDialog, "- Sö dông qu©n c«ng huy hoµng: nhËn 80000 ®iÓm c«ng tr¹ng/#_hotrocongtrangpbm(4)")
		tinsert(tbSayDialog, "- Sö dông qu©n c«ng vinh dù: nhËn 150000 ®iÓm c«ng tr¹ng/#_hotrocongtrangpbm(5)")
		tinsert(tbSayDialog,"Ta chØ ghÐ qua/nothing")
		
		nSaySize = getn(tbSayDialog);
		Say(szSayHead, nSaySize, tbSayDialog);
	end
end
function _hotrocongtrangpbm(nType)
	local tItem = {	
						[1] = {2, 1, 9999, 0, "Kh«ng qu©n c«ng",10000},
						[2] = {2, 1, 9999, 1, "Qu©n C«ng Ch­¬ng",20000},
						[3] = {2, 1, 9998, 1, "Qu©n C«ng §¹i",40000},
						[4] = {2, 1, 9977, 1, "Qu©n C«ng Huy Hoµng",80000},
						[5] = {2, 1, 30642, 1, "qu©n c«ng ch­¬ng vinh dù",150000},
					}
	if GetItemCount(2,1,tItem[nType][3]) < tItem[nType][4] then
		Talk(1, "", szNpcName.."§¹i hiÖp kh«ng mang "..tItem[nType][4].." ®Ó nhËn th­ëng !!!")
		return 0
	end
	
	local nOneTimeCT = GetTaskPosition(TSK_HOTRO_QUANCONG, 3)
	if nOneTimeCT >= 1 then
		Talk(1, "", "§¹i hiÖp ®· nhËn hç trî ®iÓm c«ng tr¹ng råi, xin h·y chän nhËn hç trî kh¸c.")
		return 0
	end
	if DelItem(2,1,tItem[nType][3],tItem[nType][4]) == 1 then
		if GetTask(701) >= 0 then
			SetTask(701, GetTask(701) + tItem[nType][6])
--			Talk(1, "", "Chóc mõng b¹n ®· nhËn hç trî qu©n c«ng thµnh c«ng")
		else
			SetTask(701, GetTask(701) - tItem[nType][6])
--			Talk(1, "", "Chóc mõng b¹n ®· nhËn hç trî qu©n c«ng thµnh c«ng")
		end
		
		Talk(1, "", "Chóc mõng b¹n ®· nhËn hç trî qu©n c«ng thµnh c«ng")
		Msg2Player("Chóc mõng b¹n "..tItem[nType][6].." ®iÓm c«ng tr¹ng")
		SetTaskPosition(TSK_HOTRO_QUANCONG, 3, nOneTimeCT+1)
		gf_WriteLogEx("NHAN HO TRO ALL SERVER", "nhËn thµnh c«ng", 1, "c«ng tr¹ng")
	end
end
function thang11tothang12()
	local nQuaBac = GetItemCount(2, 200, 46)
	local nQuaBachKim = GetItemCount(2, 200, 47)
	local nQuaTonSu = GetItemCount(2, 200, 48)
	local tSay = {}
	if nQuaBac <= 0 and nQuaBachKim <= 0 and nQuaTonSu <= 0 then	
		Talk(1, "", szNpcName.."§¹i hiÖp ®· hÕt vËt phÈm event th¸ng 11 ®Ó ®æi råi.")
		return 0
	end
	if nQuaBac > 0 then		
		tinsert(tSay,"§æi "..nQuaBac.." Hép Quµ B¹c thµnh " ..nQuaBac.." C©y Th«ng An Lµnh/#change_thang11tothang12(1)")
	end
	if nQuaBachKim > 0 then		
		tinsert(tSay,"§æi "..nQuaBachKim.." Hép Quµ B¹ch Kim thµnh " ..nQuaBachKim.." C©y Th«ng Êm ¸p/#change_thang11tothang12(2)")
	end
	if nQuaTonSu > 0 then		
		tinsert(tSay,"§æi "..nQuaTonSu.." Hép Quµ T«n S­ thµnh " ..nQuaTonSu.." C©y Th«ng Gi¸ng Sinh/#change_thang11tothang12(3)")
	end
	
	tinsert(tSay,"Ta chØ ghÐ qua/nothing")
	Say(szNpcName.."Ta sÏ gióp ®¹i hiÖp ®æi vËt phÈm event th¸ng 11 thµnh vËt phÈm event th¸ng 12.",getn(tSay),tSay)
end
function change_thang11tothang12(nType)
	local nQuaBac = GetItemCount(2, 200, 46)
	local nQuaBachKim = GetItemCount(2, 200, 47)
	local nQuaTonSu = GetItemCount(2, 200, 48)
	if nQuaBac <= 0 and nQuaBachKim <= 0 and nQuaTonSu <= 0 then	
		Talk(1, "", szNpcName.."§¹i hiÖp ®· hÕt vËt phÈm event th¸ng 11 ®Ó ®æi råi.")
		return 0
	end
	if nType == 1 and nQuaBac > 0 then
		if BigDelItem(2, 200, 46,nQuaBac) == 1 then
			gf_AddItemEx2({2, 200, 52,nQuaBac}, "Doi event 11 to 12", "HO TRO DOI EVENT 11 TO 12", "§æi event 11 to 12")
			Talk(1, "", szNpcName.."§¹i hiÖp ®· nhËn ®­îc "..nQuaBac.." C©y Th«ng An Lµnh.")
		end
	end
	if nType == 2 and nQuaBachKim > 0 then
		if BigDelItem(2, 200, 47,nQuaBachKim) == 1 then
			gf_AddItemEx2({2, 200, 53,nQuaBachKim}, "Doi event 11 to 12", "HO TRO DOI EVENT 11 TO 12", "§æi event 11 to 12")
			Talk(1, "", szNpcName.."§¹i hiÖp ®· nhËn ®­îc "..nQuaBachKim.." C©y Th«ng Êm ¸p.")
		end
	end
	if nType == 3 and nQuaTonSu > 0 then
		if BigDelItem(2, 200, 48,nQuaTonSu) == 1 then
			gf_AddItemEx2({2, 200, 54,nQuaTonSu}, "Doi event 11 to 12", "HO TRO DOI EVENT 11 TO 12", "§æi event 11 to 12")
			Talk(1, "", szNpcName.."§¹i hiÖp ®· nhËn ®­îc "..nQuaTonSu.." C©y Th«ng Gi¸ng Sinh.")
		end
	end
end

function ngoaitrangMaiLieu()
	local nBody = GetBody();
	local nRand = random(1,100);
	
	if nRand == 1 then
		gf_AddItemEx2({0,108,1076+nBody,1,5},"Mai LiÔu","PHAN THUONG ONLINE 2019","nhËn Mai LiÔu")
		gf_AddItemEx2({0,109,1076+nBody,1,5},"Mai LiÔu","PHAN THUONG ONLINE 2019","nhËn Mai LiÔu")
		gf_AddItemEx2({0,110,1076+nBody,1,5},"Mai LiÔu","PHAN THUONG ONLINE 2019","nhËn Mai LiÔu")
	else
		gf_AddItemEx2({0,108,1076+nBody,1,5},"Mai LiÔu","PHAN THUONG ONLINE 2019","nhËn Mai LiÔu",7*24*3600)
		gf_AddItemEx2({0,109,1076+nBody,1,5},"Mai LiÔu","PHAN THUONG ONLINE 2019","nhËn Mai LiÔu",7*24*3600)
		gf_AddItemEx2({0,110,1076+nBody,1,5},"Mai LiÔu","PHAN THUONG ONLINE 2019","nhËn Mai LiÔu",7*24*3600)
	end
	gf_WriteLogEx("PHAN THUONG ONLINE 2020", "nhËn", 1, "NhËn thµnh c«ng online 60 phót")
end

function change_7daytoEver()
--	if GetItemCount(2,97,236) < 100 then
--		Talk(1, "", "§¹i hiÖp kh«ng cã ®ñ 100 Thiªn Kiªu LÖnh ®Ó ®æi.")
--		return 0
--	end
	local nBody = GetBody();
	if GetItemCount(0,108,1076+nBody) < 1 then
		Talk(1, "", "§¹i hiÖp kh«ng cã ®ñ bé ngo¹i trang Mai LiÔu ®Ó ®æi.")
		return 0
	end	
	if GetItemCount(0,109,1076+nBody) < 1 then
		Talk(1, "", "§¹i hiÖp kh«ng cã ®ñ bé ngo¹i trang Mai LiÔu ®Ó ®æi.")
		return 0
	end	
	if GetItemCount(0,110,1076+nBody) < 1 then
		Talk(1, "", "§¹i hiÖp kh«ng cã ®ñ bé ngo¹i trang Mai LiÔu ®Ó ®æi.")
		return 0
	end
	if DelItem(0,108,1076+nBody,1) == 1 and DelItem(0,109,1076+nBody,1) == 1 and DelItem(0,110,1076+nBody,1) == 1 then
		gf_AddItemEx2({0,108,1076+nBody,1,5},"Mai LiÔu","PHAN THUONG ONLINE 2019","nhËn Mai LiÔu")
		gf_AddItemEx2({0,109,1076+nBody,1,5},"Mai LiÔu","PHAN THUONG ONLINE 2019","nhËn Mai LiÔu")
		gf_AddItemEx2({0,110,1076+nBody,1,5},"Mai LiÔu","PHAN THUONG ONLINE 2019","nhËn Mai LiÔu")
		gf_WriteLogEx("PHAN THUONG ONLINE 2020", "nhËn", 1, "§æi ngo¹i trang vÜnh viÔn thµnh c«ng")
	else
		gf_WriteLogEx("PHAN THUONG ONLINE 2020", "nhËn", 1, "§æi ngo¹i trang vÜnh viÔn thÊt b¹i")
	end
end
function buy_BachSa()
	if GetItemCount(2,97,236) < 100 then
		Talk(1, "", "§¹i hiÖp kh«ng cã ®ñ 100 Thiªn Kiªu LÖnh ®Ó ®æi.")
		return 0
	end
	if DelItem(2,97,236,100) == 1 then
		gf_AddItemEx2({2,1,31388,1,4},"B¹ch Sa","MUA BACH SA BK","nhËn tói B¹ch Sa")
		gf_WriteLogEx("MUA BACH SA", "nhËn", 1, "Mua ngo¹i trang b¹ch sa vÜnh viÔn thµnh c«ng")
	end
end
function award_KhaoSatOnline()
	local nDate = tonumber(date("%Y%m%d"))
 	if nDate > 20200208 then	
 		return 0
 	end
 	local nExt_Support = GetExtPoint(EXT_SURVEY2016)
 	if nExt_Support ~= 1 then
 		Talk(1, "", "§¹i hiÖp ®· nhËn th­ëng råi hoÆc ®¹i hiÖp ®· kh«ng thùc hiÖn kh¶o s¸t online.")
		return 0
 	end
	if nExt_Support == 1 then
		gf_AddItemEx2({0,105,201,1,1,-1,-1,-1,-1,-1,-1,-1},"Linh Nghª","KHAO SAT ONLINE","nhËn linh nghª",7*24*3600)	
		PayExtPoint(EXT_SURVEY2016, GetExtPoint(EXT_SURVEY2016))
	end
end


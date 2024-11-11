--Code by PhucnG 23-10-2014
--Event Den Bu Server Hoa Phung
Include("\\script\\newbattles\\sign_up_npc.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\warlord\\functions\\function_doiphe_chutuoc.lua");

--g_sNpcName = "Tiªu ViÔn L©u";
g_sNpcName = "TiÓu Ngäc";
g_nNpcCamp = LIAO_ID;
szNpcName = "<color=green>Tiªu ViÔn L©u: <color>"

m_nMinMeritChange = 1000000;
m_nCostXu = 1000;

function main()
		local tSay = {}
		if GetTargetNpcName() == "Tiªu ViÔn L©u" then
			local nDate = tonumber(date("%Y%m%d"))
			if nDate >= 20200823 and nDate <= 20200825  then
				
--				if VNG_GetTaskPos(TSK_MATTICH_TIEUDAO,7,7) >= 1 then 
--					Talk(1,"",szNpcName.."Tr¨ng thanh giã m¸t, c¸c h¹ cã viÖc cÇn chi?")
--					do return 0 end
--				end
				-- tinsert(tbSay,"Ta muèn nhËn ®iÓm cña chiÕn tr­êng 4x/Denbu_NhanThuong4x")
--				tinsert(tbSay,"Ta muèn nhËn th­ëng hç trî lçi lÇm cña chiÕn tr­êng/Denbu_FixChienTruong")
--				tinsert(tbSay,"Rêi khái/gf_DoNothing")
--				Say(szNpcName.."§Ó cã thÓ bï ®¾p hÕt mäi lçi lÇm, c¸c h¹ h·y nhËn phÇn th­ëng nµy. \n",getn(tbSay),tbSay)
				tinsert(tSay,"PhÇn th­ëng ®Òn bï chiÕn tr­êng phô/#get_support_chientruong(1)");
				tinsert(tSay,"PhÇn th­ëng ®Òn bï chiÕn tr­êng chİnh/#get_support_chientruong(2)");
				tinsert(tSay,"PhÇn th­ëng ®Òn bï 2 tû ®iÓm kinh nghiÖm/#get_support_chientruong_final(3,0)");

				tinsert(tSay,"\nChuyÓn c«ng tr¹ng tõ phe Tèng qua phe Liªu/#changeCongTrang2020(1)")
				tinsert(tSay,"ChuyÓn c«ng tr¹ng tõ phe Liªu qua phe Tèng/#changeCongTrang2020(2)")
				tinsert(tSay,"Rêi khái/gf_DoNothing")
				Say(szNpcName.."§Ó cã thÓ bï ®¾p hÕt mäi lçi lÇm, c¸c h¹ h·y nhËn phÇn th­ëng nµy. \n",getn(tSay),tSay)
				return
			else
				tinsert(tSay,"ChuyÓn c«ng tr¹ng tõ phe Tèng qua phe Liªu/#changeCongTrang2020(1)")
				tinsert(tSay,"ChuyÓn c«ng tr¹ng tõ phe Liªu qua phe Tèng/#changeCongTrang2020(2)")
				tinsert(tSay,"ChuyÓn ®æi phe trang bŞ chiÕn tr­êng/#ChuyenDoiTrangBiChuTruoc()")
				tinsert(tSay,"Rêi khái/gf_DoNothing")
				--goc Say(szNpcName.."QuyÒn lùc cña ta rÊt m¹nh, ta cã thÓ gióp ®¹i hiÖp chuyÓn ®æi c«ng tr¹ng tõ Tèng qua Liªu, hoÆc tõ Liªu qua Tèng. <color=green>DÜ nhiªn lµ cÇn ph¶i tèn chót phİ: 25 TCL + 25 TMKL, vµ ®¹i hiÖp ph¶i cã c«ng tr¹ng tõ 5 triÖu trë lªn.<color>\n",getn(tSay),tSay)
				Say(szNpcName.."QuyÒn lùc cña ta rÊt m¹nh, ta cã thÓ gióp ®¹i hiÖp chuyÓn ®æi c«ng tr¹ng tõ Tèng qua Liªu, hoÆc tõ Liªu qua Tèng. <color=green>DÜ nhiªn lµ cÇn ph¶i tèn chót phİ: " .. m_nCostXu .. " VËt PhÈm Xu, vµ ®¹i hiÖp ph¶i cã c«ng tr¹ng tõ " .. m_nMinMeritChange .. " trë lªn<color>\n",getn(tSay),tSay)
--				Talk(1,"",szNpcName.."Tr¨ng thanh giã m¸t, c¸c h¹ cã viÖc cÇn chi?")
				return
			end
		end		
		
		if random(1,50) == 1 then
				NpcChat(GetTargetNpc(),"§Ó khİch lÖ t­íng sÜ §¹i Liªu ta anh dòng giÕt giÆc, nh÷ng ai tham gia trËn ®¸nh Nh¹n m«n quan ®Òu ®­îc nhËn Linh Th¹ch!");
		end;
		battle_main();			
end;
function ChuyenDoiTrangBiChuTruoc()
	local tbSay = {}
	tinsert(tbSay,"ChuyÓn ®æi trang bŞ Chu T­íc tõ Liªu sang phe Tèng/#DoiPhe_ChuTuoc_Lieu_Tong()")
	tinsert(tbSay,"ChuyÓn ®æi trang bŞ Chu T­íc tõ Tèng sang phe Liªu/#DoiPhe_ChuTuoc_Tong_Lieu()")
	tinsert(tbSay,"Rêi khái/gf_DoNothing")
	Say(szNpcName.."C¸c h¹ cã thÓ chuyÓn ®æi trang bŞ sang phe ®èi diÖn. Chi phİ lµ 200 xu vËt phÈm/1 trang bŞ? \n",getn(tbSay),tbSay)
end
function Denbu_NhanThuong4x()
	local tbSay = {}
	tinsert(tbSay,"NhËn 600 ®iÓm c«ng tr¹ng vµ 10.000.000 ®iÓm kinh nghiÖm/#Denbu_NhanThuong4x_01(1)")
	tinsert(tbSay,"NhËn 1200 ®iÓm c«ng tr¹ng vµ 15.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng ch­¬ng)/#Denbu_NhanThuong4x_01(2)")
	tinsert(tbSay,"NhËn 3000 ®iÓm c«ng tr¹ng vµ 20.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng ®¹i)/#Denbu_NhanThuong4x_01(3)")
	tinsert(tbSay,"NhËn 6000 ®iÓm c«ng tr¹ng vµ 30.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng huy hoµng)/#Denbu_NhanThuong4x_01(4)")
	tinsert(tbSay,"NhËn 8400 ®iÓm c«ng tr¹ng vµ 45.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng vinh dù)/#Denbu_NhanThuong4x_01(5)")
	tinsert(tbSay,"Rêi khái/gf_DoNothing")
	Say(szNpcName.."C¸c h¹ muèn nhËn g× nµo? \n",getn(tbSay),tbSay)
end

function Denbu_NhanThuong4x_01(nChoice)
	if gf_GetTaskByte(TSK_DENBU_HOAPHUNG,3) == 1 then
		Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng trong ngµy. Xin vui lßng quay l¹i ngµy h«m sau!")
		return
	end
	
	if nChoice == 1 then
		gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
		--NhËn C«ng tr¹ng
		gf_EventGiveCustomAward(31, 600, 1, "DenBuHoaPhung", "Nhan")
		
		--NhËn kinh nghiÖm
		gf_EventGiveCustomAward(1, 10000000, 1, "DenBuHoaPhung", "Nhan")
	elseif nChoice == 2 then
		if GetItemCount(2,1,9999) < 1 then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã Qu©n C«ng Ch­¬ng trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		if DelItem(2,1,9999,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
			
			--NhËn C«ng tr¹ng
			gf_EventGiveCustomAward(31, 1200, 1, "DenBuHoaPhung", "Nhan")
			
			--NhËn kinh nghiÖm
			gf_EventGiveCustomAward(1, 15000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 3 then
		if GetItemCount(2,1,9998) < 1 then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã Qu©n C«ng §¹i trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		
		if DelItem(2,1,9998,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
			
			--NhËn C«ng tr¹ng
			gf_EventGiveCustomAward(31, 3000, 1, "DenBuHoaPhung", "Nhan")
			
			--NhËn kinh nghiÖm
			gf_EventGiveCustomAward(1, 20000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 4 then
		if GetItemCount(2,1,9977) < 1 then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã Qu©n C«ng Huy Hoµng trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		
		if DelItem(2,1,9977,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
			
			--NhËn C«ng tr¹ng
			gf_EventGiveCustomAward(31, 6000, 1, "DenBuHoaPhung", "Nhan")
			
			--NhËn kinh nghiÖm
			gf_EventGiveCustomAward(1, 30000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 5 then
		if GetItemCount(2,1,30642) < 1 then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã Qu©n C«ng Ch­¬ng Vinh Dù trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		
		if DelItem(2,1,30642,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,3,1)
		
			--NhËn C«ng tr¹ng
			gf_EventGiveCustomAward(31, 8400, 1, "DenBuHoaPhung", "Nhan")
			
			--NhËn kinh nghiÖm
			gf_EventGiveCustomAward(1, 45000000, 1, "DenBuHoaPhung", "Nhan")
		end
	end
end

function Denbu_NhanThuong6x()
	local tbSay = {}
	tinsert(tbSay,"NhËn 1200 ®iÓm c«ng tr¹ng vµ 20.000.000 ®iÓm kinh nghiÖm/#Denbu_NhanThuong6x_01(1)")
	tinsert(tbSay,"NhËn 2400 ®iÓm c«ng tr¹ng vµ 30.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng ch­¬ng)/#Denbu_NhanThuong6x_01(2)")
	tinsert(tbSay,"NhËn 6000 ®iÓm c«ng tr¹ng vµ 40.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng ®¹i)/#Denbu_NhanThuong6x_01(3)")
	tinsert(tbSay,"NhËn 12000 ®iÓm c«ng tr¹ng vµ 60.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng huy hoµng)/#Denbu_NhanThuong6x_01(4)")
	tinsert(tbSay,"NhËn 16800 ®iÓm c«ng tr¹ng vµ 90.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng vinh dù)/#Denbu_NhanThuong6x_01(5)")
	tinsert(tbSay,"Rêi khái/gf_DoNothing")
	Say(szNpcName.."C¸c h¹ muèn nhËn g× nµo? \n",getn(tbSay),tbSay)
end

function Denbu_NhanThuong6x_01(nChoice)
	if gf_GetTaskByte(TSK_DENBU_HOAPHUNG,4) == 1 then
		Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn phÇn th­ëng trong ngµy. Xin vui lßng quay l¹i ngµy h«m sau!")
		return
	end

	if nChoice == 1 then
		gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
		--NhËn C«ng tr¹ng
		gf_EventGiveCustomAward(31, 1200, 1, "DenBuHoaPhung", "Nhan")
		
		--NhËn kinh nghiÖm
		gf_EventGiveCustomAward(1, 20000000, 1, "DenBuHoaPhung", "Nhan")
	elseif nChoice == 2 then
		if GetItemCount(2,1,9999) < 1 then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã Qu©n C«ng Ch­¬ng trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		if DelItem(2,1,9999,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
			--NhËn C«ng tr¹ng
			gf_EventGiveCustomAward(31, 2400, 1, "DenBuHoaPhung", "Nhan")
			
			--NhËn kinh nghiÖm
			gf_EventGiveCustomAward(1, 30000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 3 then
		if GetItemCount(2,1,9998) < 1 then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã Qu©n C«ng §¹i trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		
		if DelItem(2,1,9998,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
			--NhËn C«ng tr¹ng
			gf_EventGiveCustomAward(31, 6000, 1, "DenBuHoaPhung", "Nhan")
			
			--NhËn kinh nghiÖm
			gf_EventGiveCustomAward(1, 40000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 4 then
		if GetItemCount(2,1,9977) < 1 then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã Qu©n C«ng Huy Hoµng trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		
		if DelItem(2,1,9977,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
			--NhËn C«ng tr¹ng
			gf_EventGiveCustomAward(31, 12000, 1, "DenBuHoaPhung", "Nhan")
			
			--NhËn kinh nghiÖm
			gf_EventGiveCustomAward(1, 60000000, 1, "DenBuHoaPhung", "Nhan")
		end
	elseif nChoice == 5 then
		if GetItemCount(2,1,30642) < 1 then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã Qu©n C«ng Ch­¬ng Vinh Dù trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		
		if DelItem(2,1,30642,1) == 1 then
			gf_SetTaskByte(TSK_DENBU_HOAPHUNG,4,1)
			--NhËn C«ng tr¹ng
			gf_EventGiveCustomAward(31, 16800, 1, "DenBuHoaPhung", "Nhan")
			
			--NhËn kinh nghiÖm
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
			Talk(1,"",szNpcName.."C¸c h¹ ®· nhËn th­ëng råi. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end
		VNG_SetTaskPos(TSK_MATTICH_TIEUDAO, 1, 7, 7)			
		gf_WriteLogEx("NHAN THUONG DEN BU CHIEN TRUONG", "nhËn thµnh c«ng", 1, "phÇn th­ëng")
		--NhËn C«ng tr¹ng
		if GetTask(701) >= 0 then
			SetTask(701, GetTask(701) + 20000)
		else
			SetTask(701, GetTask(701) - 20000)
		end			
		--NhËn kinh nghiÖm
		ModifyExp(50000000)
		Msg2Player("§¹i hiÖp nhËn 20000 ®iÓm c«ng tr¹ng")
end

function get_support_chientruong(nType)
	local tSay = {}
	if nType == 1 then
		tinsert(tSay,"NhËn 1500 ®iÓm c«ng tr¹ng vµ 10.000.000 ®iÓm kinh nghiÖm (kh«ng dïng qu©n c«ng)/#get_support_chientruong_final("..nType..",1)")
		tinsert(tSay,"NhËn 3000 ®iÓm c«ng tr¹ng vµ 15.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng ch­¬ng)/#get_support_chientruong_final("..nType..",2)")
		tinsert(tSay,"NhËn 7500 ®iÓm c«ng tr¹ng vµ 20.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng ®¹i)/#get_support_chientruong_final("..nType..",3)")
		tinsert(tSay,"NhËn 15000 ®iÓm c«ng tr¹ng vµ 30.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng huy hoµng)/#get_support_chientruong_final("..nType..",4)")
		tinsert(tSay,"NhËn 21000 ®iÓm c«ng tr¹ng vµ 45.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng vinh dù)/#get_support_chientruong_final("..nType..",5)")
	else
		tinsert(tSay,"NhËn 2000 ®iÓm c«ng tr¹ng vµ 10.000.000 ®iÓm kinh nghiÖm (kh«ng dïng qu©n c«ng)/#get_support_chientruong_final("..nType..",1)")
		tinsert(tSay,"NhËn 4000 ®iÓm c«ng tr¹ng vµ 15.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng ch­¬ng)/#get_support_chientruong_final("..nType..",2)")
		tinsert(tSay,"NhËn 10000 ®iÓm c«ng tr¹ng vµ 20.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng ®¹i)/#get_support_chientruong_final("..nType..",3)")
		tinsert(tSay,"NhËn 20000 ®iÓm c«ng tr¹ng vµ 30.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng huy hoµng)/#get_support_chientruong_final("..nType..",4)")
		tinsert(tSay,"NhËn 28000 ®iÓm c«ng tr¹ng vµ 45.000.000 ®iÓm kinh nghiÖm(dïng qu©n c«ng vinh dù)/#get_support_chientruong_final("..nType..",5)")
	end	
	tinsert(tSay,"Ta chØ ghĞ qua/nothing")
	Say(szNpcName.."Ta chuyªn phô tr¸ch c¸c ho¹t ®éng nhËn th­ëng. C¸c h¹ cÇn ta gióp ®ì viÖc g×?",getn(tSay),tSay)
end
function get_support_chientruong_final(nType,nChoose)
	local tCondition = {
					[1] = {
							[1]	= {"kh«ng sö dông qu©n c«ng",2,1,9999,0,1500,10000000},
							[2]	= {"Qu©n C«ng Ch­¬ng",2,1,9999,1,3000,15000000},
							[3]	= {"Qu©n C«ng §¹i",2,1,9998,1,7500,20000000},
							[4]	= {"Qu©n C«ng Huy Hoµng",2,1,9977,1,15000,30000000},
							[5]	= {"Qu©n C«ng Ch­¬ng Vinh Dù",2,1,30642,1,21000,45000000},
							},
					[2]	= {
							[1]	= {"kh«ng sö dông qu©n c«ng",2,1,9999,0,2000,10000000},
							[2]	= {"Qu©n C«ng Ch­¬ng",2,1,9999,1,4000,15000000},
							[3]	= {"Qu©n C«ng §¹i",2,1,9998,1,10000,20000000},
							[4]	= {"Qu©n C«ng Huy Hoµng",2,1,9977,1,20000,30000000},
							[5]	= {"Qu©n C«ng Ch­¬ng Vinh Dù",2,1,30642,1,28000,45000000},
							},
						}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
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
		Talk(1,"",szNpcName.."§¹i hiÖp ®· nhËn phÇn th­ëng hç trî nµy råi! Xin quay l¹i vµo ngµy mai.")
		return 0
	end
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	if nChuyenSinh < 90 then
		Talk(1,"",szNpcName.."§¼ng cÊp 90 trë lªn míi cã thÓ lÜnh th­ëng!")
		return 0
	end
--	if GetReputation() < 3000 then
--		Talk(1, "", szNpcName.."§iÓm danh väng ch­a ®ñ 3000, ch­a thÓ nhËn th­ëng..");
--		return 0
--	end
--	if GetTask(336) < 4000 then
--		Talk(1, "", szNpcName.."§iÓm s­ m«n ch­a ®ñ 4000, ch­a thÓ nhËn th­ëng..");
--		return 0
--	end
	if nType ~= 3 then
		if GetItemCount(tCondition[nType][nChoose][2],tCondition[nType][nChoose][3],tCondition[nType][nChoose][4]) < tCondition[nType][nChoose][5] then 
			Talk(1,"",szNpcName.."C¸c h¹ kh«ng cã "..tCondition[nType][nChoose][1].." trong hµnh trang. Kh«ng thÓ nhËn phÇn th­ëng!")
			return
		end	
	end
	if nType == 3 then
		gf_WriteLogEx("NHAN THUONG DEN BU CHIEN TRUONG", "nhËn thµnh c«ng", 1, "phÇn th­ëng KN")
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
		--NhËn c«ng tr¹ng
		if GetTask(701) >= 0 then
			SetTask(701, GetTask(701) + tCondition[nType][nChoose][6])
			Talk(1, "", "Chóc mõng b¹n ®· nhËn hç trî qu©n c«ng thµnh c«ng")
		else
			SetTask(701, GetTask(701) - tCondition[nType][nChoose][6])
			Talk(1, "", "Chóc mõng b¹n ®· nhËn hç trî qu©n c«ng thµnh c«ng")
		end
		--NhËn kinh nghiÖm
		ModifyExp(tCondition[nType][nChoose][7])
		gf_WriteLogEx("NHAN THUONG DEN BU CHIEN TRUONG", "nhËn thµnh c«ng", 1, "phÇn th­ëng")
	end						
end
function changeCongTrang2020(nType)
	local nHor = GetTask(701);
	if abs(nHor) < m_nMinMeritChange  then
		Talk(1, "", szNpcName.."Ta chØ nhËn chuyÓn cho nh÷ng ®¹i hiÖp cã c«ng tr¹ng tõ " .. m_nMinMeritChange .. " ®iÓm trê lªn.");
		return 0
	end
	--local nCount1 = GetItemCount(2,1,30370)
	--local nCount2 = GetItemCount(2,95,204)
	local nCount3 = GetItemCount(2, 1, 30230); -- VËt PhÈm Xu
	--if nCount1 < 25 then
	--	Talk(1, "", szNpcName .. "§¹i hiÖp kh«ng cã ®ñ 25 Thiªn M«n Kim LÖnh th× lµm sao ta cã thÓ gióp ®¹i hiÖp ®­îc.")
	--	return 0
	--end
	--if nCount2 < 25 then
	--	Talk(1, "", szNpcName .. "§¹i hiÖp kh«ng cã ®ñ 25 Thiªn Cang LÖnh th× lµm sao ta cã thÓ gióp ®¹i hiÖp ®­îc.")
	--	return 0
	--end
	if nCount3 < m_nCostXu then
		Talk(1, "", szNpcName .. "§¹i hiÖp kh«ng cã ®ñ <color=red>" .. m_nCostXu .. " VËt PhÈm Xu<color> th× lµm sao ta cã thÓ gióp ®¹i hiÖp ®­îc.")
		return 0
	end
	if nType == 1 and nHor < 0 then
		Talk(1, "", szNpcName .. "§¹i hiÖp ®ang ë phe Liªu råi nªn kh«ng cÇn ta gióp ®ì ®©u.")
		return 0
	end
	if nType == 2 and nHor >= 0 then
		Talk(1, "", szNpcName .. "§¹i hiÖp ®ang ë phe Tèng råi nªn kh«ng cÇn ta gióp ®ì ®©u.")
		return 0
	end
	if nType == 1 and nHor >= 0 then
		--if DelItem(2,1,30370,25) == 1 and DelItem(2,95,204,25) == 1 then
		if DelItem(2, 1, 30230, m_nCostXu) == 1 then
			SetTask(701, -m_nMinMeritChange)
			SetTask(704, -4)
			Talk(1, "", szNpcName .. "Chóc mõng ®¹i hiÖp, ta ®· gióp ®¹i hiÖp chuyÓn sang phe Liªu thµnh c«ng.")
			gf_WriteLogEx("CHUYEN DOI PHE CONG TRANG", "chuyÓn Liªu", 1, "Tèng sang Liªu")
		end
	end
	if nType == 2 and nHor < 0 then
		--if DelItem(2,1,30370,25) == 1 and DelItem(2,95,204,25) == 1 then
		if DelItem(2, 1, 30230, m_nCostXu) == 1 then
			SetTask(701, m_nMinMeritChange)
			SetTask(704, 4)
			Talk(1, "", szNpcName .. "Chóc mõng ®¹i hiÖp, ta ®· gióp ®¹i hiÖp chuyÓn sang phe Tèng thµnh c«ng.")
			gf_WriteLogEx("CHUYEN DOI PHE CONG TRANG", "chuyÓn Tèng", 1, "Liªu sang Tèng")
		end
	end
end
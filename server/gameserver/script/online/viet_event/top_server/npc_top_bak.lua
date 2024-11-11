-- Event �ua top
-- Created by TuanNA5
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\newserver\\topbanghoi.lua");
Include("\\script\\vng\\newserver\\hoatdong.lua");

strNpcName = "<color=green>S�t H�: <color> "
szLogTitle = "Top SAT HO"
szStartDate = "18-03-2020"
szEndDate = "18-05-2020"
szServerName = "S�t H�"

function main()
	local nDate = tonumber(date("%Y%m%d"))
	
--	if GetCreateTime() <= TOP_CREATED_ROLE then
--		Talk(1,"",strNpcName.."Th�i gian t�o t�i kho�n kh�ng h�p l� n�n kh�ng th� nh�n th��ng!")
--		return
--	end

	if GetGlbValue(GLB_TSK_SERVER_ID) ~= TOP_SERVER_ID or GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR) ~= TOP_SERVER_ID then
		Talk(1,"",strNpcName.."Ng��i kh�ng ph�i th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return
	end
	local tSay = {}
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then		
--		tinsert(tSay,"Nh�n th��ng th�ng c�p d�nh cho 2 h� ph�i m�i: C�n L�n Ki�m T�n v� ���ng M�n Nh�m Hi�p/minhgiao_get_award_by_level")
--		tinsert(tSay,"Nh�n ph�n th��ng theo ��ng c�p/get_award_by_level")
--		tinsert(tSay,"Nh�n th��ng l�u ph�i Th�y Y�n Linh N� c�p 92-99/get_route_award_by_level_menu")
--		tinsert(tSay,"Nh�n th��ng tr�c ti�p l�n chuy�n sinh 7, 8, 9, 10/vangdanhthienha_get_fast_level")
		tinsert(tSay,"Nh�n th��ng th�ng c�p t�i m�y ch� m�i/vangdanhthienha_get_award_by_level")
		tinsert(tSay,"Nh�n th��ng 1 cao th� ��u ti�n ��t 6.600.000 �i�m c�ng tr�ng/confirm_get_1mil_Hornor_award")	--
--		tinsert(tSay,"Nh�n ph�n th��ng �u ��i server " .. szServerName .. "/Say_NhanUuDai")
		tinsert(tSay,"Nh�n ph�n th��ng cao th� Top 1 m�i h� ph�i/get_top_faction_award")	--
		tinsert(tSay,"Nh�n ph�n th��ng 2 nh�n s� ��u ti�n m�i phe ��t 5.400.000 c�ng tr�ng/confirm_get_top_Hornor_award")	--
--		tinsert(tSay,"��ng k� nh�n th��ng top 10 chuy�n sinh 6 c�p 99/#CS_TopAward(6)")
--		tinsert(tSay,"��ng k� top 3 ph�i Minh Gi�o ��t chuy�n sinh 7 c�p 90 ��u ti�n/get_fast_MinhGiao")	
		tinsert(tSay,"��ng k� nh�n th��ng 3 nh�n s� ��u ti�n chuy�n sinh 10 c�p 94/#CS_TopAward(7)")	--
--		tinsert(tSay,"��ng k� nh�n th��ng top 100 chuy�n sinh 3 c�p 99/#CS_TopAward(3)")
--		tinsert(tSay,"Ho�t ��ng "..szServerName.."/NewServer_HoatDong_Menu")
	end
	tinsert(tSay,"Bang h�i danh gi�/TopBangHoi_Menu")
	tinsert(tSay,"Xem t�nh h�nh nh�n th��ng top h� ph�i/get_top_faction_info")
--	tinsert(tSay,"Xem t�nh h�nh nh�n th��ng top 3 chi�n tr��ng/get_top_nation_info")
--	tinsert(tSay,"Xem t�nh h�nh ��ng k� nh�n th��ng m�t t�ch/get_top100_award_info")
--	tinsert(tSay,"Ph�t th��ng bang h�i/PhatThuongBangHoi")
	tinsert(tSay,"Ta bi�t r�i/dlgover")	
	
	if nDate >= TOP_START_DATE then
		local strSay = strNpcName.."Ho�t ��ng <color=yellow>Truy C�ng L�nh Th��ng<color> di�n ra t� ng�y<color=red> "..szStartDate.." ��n 24:00 "..szEndDate.."<color>. Trong th�i gian n�y, qu� ��ng ��o c� th� ��n g�p ta �� nh�n c�c ph�n th��ng h�p d�n. Th�ng tin chi ti�t ho�t ��ng ��ng ��o c� th� xem t�i trang ch�."
		Say(strSay,getn(tSay),tSay)
	end
end

function get_award_by_level()
	local tSay = {}
	tSay[0] = strNpcName.."Trong th�i gian t� ng�y<color=red> "..szStartDate.." ��n 24:00 "..szEndDate.."<color>, khi ��t ���c c�c m�c �i�u ki�n nh�n th��ng (chi ti�t xem t�i trang ch�), ��ng ��o c� th� ��n g�p ta �� nh�n ph�n th��ng."
	for i=1,getn(tb_topserver_award_limit) do
		if tb_topserver_award_limit[i] ~= nil then
			if tb_topserver_award_limit[i][4] >= gf_GetTaskByte(TSK_TOP_LEVEL,1)  then
				tinsert(tSay, "Ta mu�n nh�n ph�n th��ng c�p �� "..i.."/#conf_get_award_by_level("..i..")")
			end
		end
	end
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then
		gf_PageSay(tSay, 1, 6)
	else
		Talk(1,"",strNpcName.."Ho�t ��ng �� k�t th�c!")
	end
end


-- Truy c�ng l�nh th��ng theo ��ng c�p
function conf_get_award_by_level(nLevel)
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", strNpcName.."C�c h� ch�a gia nh�p m�n ph�i kh�ng th� nh�n th��ng.");
		return
	end
	if tFactionSkillInfo[nRoute] == 0 then
		Talk(1, "", strNpcName.."C�c h� ch�a gia nh�p h� ph�i kh�ng th� nh�n th��ng.");
		return
	end
	if GetLevel() < nLevel then
		Talk(1, "", strNpcName.."��ng c�p c�a c�c h� ch�a �� "..nLevel..", kh�ng th� nh�n th��ng.");
		return
	end
--	if CheckMaxSkill55() == 0 then
--		Talk(1, "", strNpcName.."C�c h� ch�a h�c ��y �� v� c�ng c�p 55, kh�ng th� nh�n th��ng.");
--		return
--	end
	if gf_GetTaskByte(TSK_TOP_LEVEL,1) > tb_topserver_award_limit[nLevel][4] then
		Talk(1, "", strNpcName.."C�c h� �� nh�n ph�n th��ng n�y r�i. Kh�ng th� nh�n ti�p ���c n�a!");
		return
	end
	local nAwardLevel = TopCheckLevel()
	if nAwardLevel == 0 or nAwardLevel < nLevel then
		Talk(1, "", strNpcName.."Kh�ng �� �i�u ki�n nh�n ph�n th��ng n�y. Vui l�ng ki�m tra l�i c�c �i�u ki�n ��ng c�p, danh v�ng, s� m�n, c�ng tr�ng ho�c c�c h� ch�a nh�n c�c ph�n th��ng tr��c.");
		return 0
	end
	warning_get_award_by_level(nLevel, nAwardLevel);
end


-- Truy c�ng l�nh th��ng theo ��ng c�p
function warning_get_award_by_level(nWantLevel, nLevel)
	Say("X�c nh�n mu�n nh�n ph�n th��ng n�y",
		2,
		"Ta mu�n nh�n /#confirm_conf_get_award_by_level("..nWantLevel..")",
		"�� ta suy ngh� l�i./dlgover");
end


-- Truy c�ng l�nh th��ng theo ��ng c�p
function confirm_conf_get_award_by_level(nLevel)
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)

	-- Check qu�c t�ch
	if nNationality ~= nNation then
		Talk(1, "", "Ng��i kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return
	end

	-- Check h�nh trang
	if gf_Judge_Room_Weight(14,500)~=1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return
	end

	if GetLevel() < 76 then
		Talk(1, "", strNpcName.."��ng c�p c�a c�c h� ch�a �� 76, kh�ng th� nh�n th��ng.");
		return
	end
	if gf_GetTaskByte(TSK_TOP_LEVEL,1) ~= tb_topserver_award_limit[nLevel][4] then
		Talk(1, "", strNpcName.."C�c h� �� nh�n ph�n th��ng n�y r�i. Kh�ng th� nh�n ti�p ���c n�a!");
		return
	end
	local nRoute = GetPlayerRoute()
	if tFactionSkillInfo[nRoute] == 0 then
		Talk(1, "", strNpcName.."C�c h� ch�a gia nh�p h� ph�i kh�ng th� nh�n th��ng.");
		return
	end
--	if GetReputation() < 100 then
--		Talk(1, "", strNpcName.."C�c h� ch�a �� 100 �i�m Danh v�ng.");
--		return
--	end
--
--	if GetTask(336) < 50 then
--		Talk(1, "", strNpcName.."C�c h� ch�a �� 50 �i�m S� m�n.");
--		return
--	end

	local nRet, nItemIdx = 0,0
	if nLevel == 83 then
		if GetCash() < 9990000 then
			Talk(1, "", strNpcName.."C�c h� kh�ng c� �� 999 v�ng.");
			return 0
		end
	end

	-- B� sung �i�u ki�n cho c�c Level sau
	if nLevel >= 99 then
		if GetReputation() < 3000 then
			Talk(1,"","C�c h� kh�ng �� 3000 �i�m danh v�ng")
			return
		end
		if GetTask(336) < 3000 then
			Talk(1,"","C�c h� kh�ng �� 2003 �i�m danh v�ng s� m�n.")
			return
		end
		if GetItemCount(2,1,30230) < 300 then
			Talk(1,"","C�c h� kh�ng �� xu v�t ph�m nh�n th��ng.")
			return
		end
		if GetExp() < 300000000 then
			Talk(1,"","C�c h� kh�ng �� �i�m kinh nghi�m nh�n th��ng.")
			return
		end
	elseif nLevel >= 91 then
		if TopCheckSkill(tFactionSkillInfo,20) == 0 then
			Talk(1, "", strNpcName.."C�c h� ch�a luy�n th�nh v� c�ng tr�n ph�i 20 c�p.");
			return 0
		end
		if GetReputation() < 500 then
			Talk(1,"","C�c h� kh�ng �� 500 �i�m danh v�ng")
			return 0
		end
		if GetTask(336) < 500 then
			Talk(1,"","C�c h� kh�ng �� 500 �i�m danh v�ng s� m�n.")
			return 0
		end
		if GetCash() < 500000 then
			Talk(1, "", strNpcName.."C�c h� kh�ng c� �� 50 v�ng.");
			return 0
		end
	end

	-- Trao thuong
	local nAwardOrder = tonumber(gf_GetTaskByte(TSK_TOP_LEVEL,1))+1
	gf_SetTaskByte(TSK_TOP_LEVEL,1,nAwardOrder)
	--SetTask(TSK_TOP_LEVEL,GetTask(TSK_TOP_LEVEL) + 1)
	if nLevel == 83 then
		Pay(9990000)
	end

	if nLevel >= 99 then
		ModifyReputation(-3000,0)
		SetTask(336, GetTask(336) - 3000)
		Msg2Player("B�n b� tr� 3000 �i�m s� m�n!")
		DelItem(2,1,30230,300)
		Msg2Player("B�n b� tr� 300 xu v�t ph�m!")
		ModifyExp(-300000000)
		Msg2Player("B�n b� tr� 300.000.000 �i�m kinh nghi�m!")
	elseif  nLevel > 90 then
		ModifyReputation(-500,0)
		SetTask(336, GetTask(336) - 500)
		Msg2Player("B�n b� tr� 500 �i�m s� m�n!")
		Pay(500000)
	end

	for i=1,getn(tb_topserver_award_item[nLevel]) do
		local tb_item = {}
		tb_item = tb_topserver_award_item[nLevel][i]
		if tb_item[1] == 1 then -- item
			if tb_item[4] == 0 then
				gf_AddItemEx2(tb_item[3],tb_item[2], szLogTitle, "nh�n th��ng c�p "..nLevel)
			elseif tb_item[4] > 0 then
		 		gf_AddItemEx2(tb_item[3],tb_item[2], szLogTitle, "nh�n th��ng c�p "..nLevel, tb_item[4])
		 	end
		elseif tb_item[1] == 2 then -- command
			dostring(format(tb_item[2],tb_item[3]))
			WriteLogEx(szLogTitle,"nh�n th��ng c�p "..nLevel,tb_item[3],tb_item[2])
		elseif tb_item[1] == 3 then -- table
			local tb_Award = tb_item[2]
			if tb_item[4] == 0 then
				gf_AddItemEx2(tb_Award[nRoute][2],tb_Award[nRoute][1], szLogTitle,"nh�n th��ng c�p "..nLevel)
			elseif tb_item[4] > 0 then
		 		gf_AddItemEx2(tb_Award[nRoute][2],tb_Award[nRoute][1], szLogTitle,"nh�n th��ng c�p "..nLevel, tb_item[4])
		 	end
		 	-- Ch�n v� kh� Vi�t Y�n cho TL t�c gia
		 	if nRoute == 2 and nLevel == 292 then
		 		Say("Ta c� 2 m�n v� kh� d�nh cho c�c h�, h�y ch�n v� kh� ph� h�p:", 2, "Vi�t Y�n Phi Tinh �ao/#ChonVuKhiThieuLam(1)", "Vi�t Y�n Phi Tinh C�n/#ChonVuKhiThieuLam(2)")
		 	end
		else
			Talk(1, "", strNpcName.."��ng c�p kh�ng ��ng!");
			WriteLogEx(szLogTitle,"��ng c�p kh�ng ��ng???");
			return
		end
	end

	local szChuyensinh = " "
	if floor(nLevel/100)>0 then
		local szChuyensinh = " (chuy�n sinh "..floor(nLevel/100)..")"
	end
	Say(strNpcName.."Ch�c m�ng c�c h� nh�n ���c ph�n th��ng "..mod(nLevel,100).." "..szChuyensinh,0)
end

--Ch�n V� kh� Thi�u L�m
function ChonVuKhiThieuLam(nOption)
	if nOption==1 then
		gf_AddItemEx2({0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,13},"Vi�t Y�n Phi Tinh �ao",1)
	else
		gf_AddItemEx2({0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,13},"Vi�t Y�n Phi Tinh C�n",1)
	end
end


---- Nh�n th��ng top chuy�n sinh theo m�n ph�i  ----------
function get_top_faction_award()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= TOP_START_DATE and nDate <= TOP_END_DATE then
		Say(strNpcName.."Nh�n ph�n th��ng cao th� ho�n th�nh <color=red>chuy�n sinh 10 c�p 92<color> ��u ti�n (theo h� ph�i), ti�u hao 10.000 xu v�t ph�m: ",
			2,
			"Ta mu�n nh�n/confirm_get_top_faction_award",
			"�� ta suy ngh� l�i./dlgover");
	else
		Talk(1,"",strNpcName.."Ho�t ��ng �� k�t th�c!")
	end
end

--- Nh�n th��ng top 1 h� ph�i ----
function confirm_get_top_faction_award()
	-- Dieu kien nhan thuong
	local nMonPhai = GetPlayerRoute()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = abs(GetTask(701));
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	local tbRoute = {[2]=1,[3]=1,[4]=1,[6]=1,[8]=1,[9]=1,[11]=1,[12]=1,[14]=1,[15]=1,[17]=1,[18]=1,[20]=1,[21]=1,[23]=1,[25]=1,[26]=1,[27]=1,[29]=1,[30]=1,[31]=1,[32]=1}
	if nNationality ~= nNation then
		Talk(1, "", strNpcName .. "C�c h� kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return 0
	end

	if tbRoute[nMonPhai] ~= 1 then
		Talk(1,"",strNpcName .. "C�c h� ch�a ch�n h� ph�i n�n kh�ng th� nh�n th��ng.")
		return 0
	end

	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_TRANSLIFE1) == 1 then
		Talk(1, "", strNpcName.."C�c h� �� nh�n ph�n th��ng top 1 theo h� ph�i r�i.");
		return 0
	end

	if gf_CheckLevel(10,92) ~= 1 then
		Talk(1, "", strNpcName.."C�c h� ch�a ��t ph�c sinh 10 c�p �� 92, h�y c� g�ng th�m..");
		return 0
	end

	if nRep < 30000 or nFaction < 30000 or nHor < 4400000  then
		Talk(1, "", strNpcName.."C�c h� ch�a �� �i�u ki�n nh�n th��ng. Vui l�ng ki�m tra �i�u ki�n danh v�ng, s� m�n, c�ng tr�ng.");
		return 0
	end

	if GetItemCount(2,1,30230) < 10000 then
		Talk(1,"",strNpcName .. "C�c h� kh�ng �em �� 10.000 xu v�t ph�m.")
		return 0
	end

--	if TopCheckSkill(tFactionSkillInfo,20) == 0 then
--		Talk(1, "", strNpcName.."C�c h� ch�a luy�n th�nh v� c�ng tr�n ph�i 20 c�p.");
--		return
--	end

	if gf_Judge_Room_Weight(25, 300, strNpcName) == 0 then
		Talk(1,"",strNpcName .. "H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang.")
		return
	end


	LIB_txtData:Init("top_route.txt")
	LIB_txtData:LoadData()
	local nFactionRank = LIB_txtData.tbTextData[tonumber(nMonPhai)]
	if nFactionRank >= 1 then
		Talk(1, "", strNpcName.."Ph�n th��ng n�y �� c� ch� nh�n!");
		return
	end
	local nRoute = GetPlayerRoute()
	if LIB_txtData:AddValue(tonumber(nMonPhai),1,5) == 1 then
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nh�n"
		if DelItem(2,1,30230,10000) ~= 1 then
			Talk(1,"",strNpcName .. "C�c h� kh�ng �em �� 10.000 xu v�t ph�m.")
			return 0
		end
		-- Bit 1 nh�n ph�n th��ng chuy�n sinh 1
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_TRANSLIFE1,1)
		local nItemLevel = 0
		get_award_daquy123()
		--M�t t�ch c�p 70
		TraoMatTichCaoCap20(2,nRoute)

		--Th� C��i
		local tbAward = {
			item = {
				{gdp = {0,105,30025,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "B�ch H� B�o B�o"},
				{gdp = {2,1,30814,1,1}, name = "Ph�c Sinh ��n"},
				{gdp = {2,1,31313,1,4}, name = "S�t Tinh L�nh (N�n)"},
				{gdp = {2,1,31314,1,4}, name = "S�t Tinh L�nh (�o)"},
				{gdp = {2,1,31315,1,4}, name = "S�t Tinh L�nh (Qu�n)"},
--				{gdp = {2,1,30973,1,4}, name = "V� H� H�o Hi�p L�nh (V� Kh�)"},
				{gdp = {2,1,1009,100,1}, name = "Thi�n Th�ch Tinh Th�ch"},
				{gdp = {0,102,8846, 1,4, -1, -1, -1, -1, -1, -1}, name = "Huy Ho�ng Qu�t Kh�i"},
				{gdp = {0,102,8847, 1,4, -1, -1, -1, -1, -1, -1}, name = "Vinh D� Qu�t Kh�i"},
			}
		}

		LIB_Award:Award(tbAward)
		local tVuKhi = {
				[2] = {0,3,30884, 1,4},
				[3] = {0,8,30885, 1,4},
				[4] = {0,0,30886, 1,4},
				[6] = {0,1,30887, 1,4},
				[8] = {0,2,30888, 1,4},
				[9] = {0,10,30889, 1,4},
				[11] = {0,0,30890, 1,4},
				[12] = {0,5,30891, 1,4},
				[14] = {0,2,30892, 1,4},
				[15] = {0,9,30893, 1,4},
				[17] = {0,6,30894, 1,4},
				[18] = {0,4,30895, 1,4},
				[20] = {0,7,30896, 1,4},
				[21] = {0,11,30897, 1,4},
				[23] = {0,2,30898, 1,4},
				[25] = {0,3,30899, 1,4},
				[26] = {0,9,30900, 1,4},
				[27] = {0,11,30901, 1,4},
				[29] = {0,13,30902, 1,4},
				[30] = {0,12,30903, 1,4},
				[31] = {0,14,32164, 1,4},
				[32] = {0,2,32192, 1,4},
			}
		gf_AddItemEx2(tVuKhi[nRoute], "VK �m huy�t", "NHAN THUONG DUA TOP", "nh�n vk �m huy�t th�nh c�ng");
		local tbSay = {}
		tinsert(tbSay,"Ta mu�n nh�n trang b� Kim X� S�t Lang/#receive_KimXa_top1_faction(1)")
		tinsert(tbSay,"Ta mu�n nh�n trang b� Kim X� Nhu� Nha/#receive_KimXa_top1_faction(2)")
		tinsert(tbSay,"Ta mu�n nh�n trang b� Kim X� M�ng S�t/#receive_KimXa_top1_faction(3)")
		Say(strNpcName.."C�c h� h�y l�a ch�n 1 trong 3 b� trang b� Kim X� 7: ",getn(tbSay),tbSay)
		--Talk(1,"","Nh�n th�nh c�ng ph�n th��ng h�ng "..(nFactionRank+1).." m�n ph�i "..tb_Route_Name[tonumber(nMonPhai)] .. ".")
	end
end

function receive_KimXa_top1_faction(nChoice)

	if nChoice  == 1 then
		LIB_Award:Award(tb7KimXaHoanLang)	--tbKimXaVanDu
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� 7 S�t Lang")
	elseif nChoice == 2 then
		LIB_Award:Award(tb7KimXaDangGiao)	--tbKimXaThietHuyet
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� 7 Nhu� Nha")
	elseif nChoice == 3 then
		LIB_Award:Award(tb7KimXaKhoiPhuong)	--tbKimXaDuHiep
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� 7 M�ng S�t")
	end

--	receive_DieuDuong_Top1_faction_01(0,1)
end

function receive_DieuDuong_Top1_faction_01(nType,nReceive)
	do return 0 end

	local nType = nType or 0
	local nReceive = nReceive or 1
	tbSay = {}
	tinsert(tbSay,format("Ta mu�n nh�n trang s�c Di�u D��ng(S�c M�nh)/#receive_DieuDuong_Top1_faction_02(%d,%d,%d)",1,nType,nReceive))
	tinsert(tbSay,format("Ta mu�n nh�n trang s�c Di�u D��ng(Th�n Ph�p)/#receive_DieuDuong_Top1_faction_02(%d,%d,%d)",2,nType,nReceive))
	tinsert(tbSay,format("Ta mu�n nh�n trang s�c Di�u D��ng(N�i C�ng)/#receive_DieuDuong_Top1_faction_02(%d,%d,%d)",3,nType,nReceive))
	tinsert(tbSay,format("Ta mu�n nh�n trang s�c Di�u D��ng(Linh Ho�t)/#receive_DieuDuong_Top1_faction_02(%d,%d,%d)",4,nType,nReceive))
	tinsert(tbSay,format("Ta mu�n nh�n trang s�c Di�u D��ng(G�n C�t)/#receive_DieuDuong_Top1_faction_02(%d,%d,%d)",5,nType,nReceive))
	Say("C�c h� h�y l�a ch�n 2 trong 5 m�n sau: ",getn(tbSay),tbSay)
end

function receive_DieuDuong_Top1_faction_02(nChoice,nType,nReceive)
	
	tbDieuDuong = {
		item = {
			[1] = {gdp={0,102,3190,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng Thi�n Cung"},
			[2] = {gdp={0,102,3191,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng Thi�n Cung"},
			[3] = {gdp={0,102,3192,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng Thi�n Cung"},
			[4] = {gdp={0,102,3193,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng Thi�n Cung"},
			[5] = {gdp={0,102,3194,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng Thi�n Cung"},
		}
	}	
	
	if nChoice == 1 then
		if nReceive == 2 then
			if nType == 1 then
				Talk(1,"#receive_DieuDuong_Top1_faction_01(1,2)","C�c h� �� nh�n m�n n�y r�i!")
			else
				LIB_Award:Award({item={[1] = {gdp={0,102,3190,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng Thi�n Cung"},}})
				Msg2Player("C�c h� nh�n th��ng th�nh c�ng ph�n th��ng Top 1 m�n ph�i!")
				return
			end
		else
			LIB_Award:Award({item={[1] = {gdp={0,102,3190,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng Thi�n Cung"},}})
			receive_DieuDuong_Top1_faction_01(1,2)
		end
	end
	
	if nChoice  == 2 then
		if nReceive == 2 then
			if nType == 2 then
				Talk(1,"#receive_DieuDuong_Top1_faction_01(2,2)","C�c h� �� nh�n m�n n�y r�i!")
			else
				LIB_Award:Award({item={[1] = {gdp={0,102,3191,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng Thi�n Cung"},}})
				return
			end
		else
			LIB_Award:Award({item={[1] = {gdp={0,102,3191,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng Thi�n Cung"},}})
			receive_DieuDuong_Top1_faction_01(2,2)
		end
	end
	
	if nChoice  == 3 then
		if nReceive == 2 then
			if nType == 3 then
				Talk(1,"#receive_DieuDuong_Top1_faction_01(3,2)","C�c h� �� nh�n m�n n�y r�i!")
			else
				LIB_Award:Award({item={[1] = {gdp={0,102,3192,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng Thi�n Cung"},}})
				return
			end
		else
			LIB_Award:Award({item={[1] = {gdp={0,102,3192,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng Thi�n Cung"},}})
			receive_DieuDuong_Top1_faction_01(3,2)
		end
	end
	
	if nChoice  == 4 then
		if nReceive == 2 then
			if nType == 4 then
				Talk(1,"#receive_DieuDuong_Top1_faction_01(4,2)","C�c h� �� nh�n m�n n�y r�i!")
			else
				LIB_Award:Award({item={[1] = {gdp={0,102,3193,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng Thi�n Cung"},}})
				return
			end
		else
			LIB_Award:Award({item={[1] = {gdp={0,102,3193,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng Thi�n Cung"},}})
			receive_DieuDuong_Top1_faction_01(4,2)
		end
	end
	
	if nChoice  == 5 then
		if nReceive == 2 then
			if nType == 5 then
				Talk(1,"#receive_DieuDuong_Top1_faction_01(5,2)","C�c h� �� nh�n m�n n�y r�i!")
			else
				LIB_Award:Award({item={[1] = {gdp={0,102,3194,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng Thi�n Cung"},}})
				return
			end
		else
			LIB_Award:Award({item={[1] = {gdp={0,102,3194,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng Thi�n Cung"},}})
			receive_DieuDuong_Top1_faction_01(5,2)
		end
	end
	
end

-- Nh�n th��ng top c�ng tr�ng
function confirm_get_top_Hornor_award()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = GetTask(701);
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	
	local nTongLieu = 1
	if nHor < 0 then
		nTongLieu = 2
	end
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	
	if nNationality ~= nNation then
		Talk(1, "", strNpcName.."C�c h� kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return 0
	end
	
	if gf_CheckLevel(10,92) ~= 1 then
		Talk(1, "", strNpcName.."C�c h� ch�a ��t ph�c sinh 10 c�p �� 92, h�y c� g�ng th�m..");
		return 0
	end
	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",strNpcName.."C�c h� ch�a gia nh�p h� ph�i!")
		return
	end
	
	--if nRep < 25000 or nFaction < 25000 or abs(nHor) < 860000  then
	if abs(nHor) < 5200000  then
	--	Talk(1, "", strNpcName.."C�c h� ch�a �� �i�u ki�n nh�n th��ng. Vui l�ng ki�m tra �i�u ki�n danh v�ng, s� m�n, c�ng tr�ng.");
		Talk(1, "", strNpcName.."C�c h� ch�a �� �i�u ki�n nh�n th��ng. Vui l�ng ki�m tra �i�u ki�n c�ng tr�ng.");
		return 0
	end
	
	if abs(GetTask(704)) < 5 then
		Talk(1,"",strNpcName.."C�c h�, ph�n th��ng n�y ch� ���c trao t�ng cho t��ng qu�n, C�c h� h�y c� g�ng th�m nh�...");
		return
	end
	
	 if GetItemCount(2,1,30230) < 9000 then
		 Talk(1,"", strNpcName.."C�c h� kh�ng �em �� 9000 xu v�t ph�m, hay l� �� �� qu�n trong r��ng?")
		 return
	 end
	
	if gf_Judge_Room_Weight(25, 300, strNpcName) == 0 then
		Talk(1,"", strNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang.")
		return
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_1MIL_HORNOR) == 1 then
		Talk(1, "", strNpcName.."C�c h� �� nh�n ph�n th��ng �ua Top C�ng Tr�ng r�i.");
		return	
	end
	
	LIB_txtData:Init("top_nation.txt")
	LIB_txtData:LoadData()
	local nNationRank = LIB_txtData.tbTextData[1]
	--====
	if nTongLieu == 2 then
		nNationRank = LIB_txtData.tbTextData[2]
	end
	--====
	if nNationRank >= 2 then
		Talk(1, "", strNpcName.."Ph�n th��ng �� c� ch� nh�n!");
		return	
	end
	--====
	local nCheck_add_value = 0
--	nCheck_add_value =LIB_txtData:AddValue(1,1,3)
	if nTongLieu == 1 then
		nCheck_add_value =LIB_txtData:AddValue(1,1,2)
	elseif nTongLieu == 2 then
		nCheck_add_value =LIB_txtData:AddValue(2,1,2)
	end
	--===	
	if nCheck_add_value == 1 then
		nNationRank = LIB_txtData.tbTextData[1]
		--====
		if nTongLieu == 2 then
			nNationRank = LIB_txtData.tbTextData[2]
		end
		--====
		DelItem(2,1,30230,9000)
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nh�n"
--		local tbAward = {item = {{gdp={2,1,9977,1,1}, name = "Qu�n C�ng Huy Ho�ng", nExpired = 90*24*60*60}}}
--		Bit 1 nh�n ph�n th��ng top c�ng tr�ng
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_1MIL_HORNOR,1)
		get_award_daquy345(2)
		gf_AddItemEx2({2,1,30821, 1}, "Tr�ng Th�n B� T�y V�c ", "DUA TOP 1" , "nh�n tr�ng")
		if nNationRank == 1 then
			--Th�m trang b� Thanh Long --AddTrangBiHoaPhungTuongQuan(10,0)
			AddTrangBiUyHoTuongQuan(0,0)
		elseif nNationRank == 2 then
			--Th�m trang b� Thanh Long --AddTrangBiHoaPhungTuongQuan(10,0)
			AddTrangBiUyHoTuongQuan(0,0)
--		elseif nNationRank == 3 then
			--TraoLoiHoTuongQuan(13)
--			AddTrangBiHoaPhungTuongQuan(0,0)
		end
		Talk(1,"","Nh�n th�nh c�ng ph�n th��ng 5.400.000 c�ng tr�ng")
	end
end


-- Nh�n th��ng top 5.600.000 c�ng tr�ng
function confirm_get_1mil_Hornor_award()
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = GetTask(701);
	
	local nTongLieu = 1
	if nHor < 0 then
		nTongLieu = 2
	end
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	
	if nNationality ~= nNation then
		Talk(1, "", strNpcName.."C�c h� kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return 0
	end
	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",strNpcName.."C�c h� ch�a gia nh�p h� ph�i!")
		return
	end
	
	if gf_CheckLevel(10,92) ~= 1 then
		Talk(1, "", strNpcName.."C�c h� ch�a ��t ph�c sinh 10 c�p �� 92, h�y c� g�ng th�m..");
		return 0
	end
	
	--if nRep < 30000 or nFaction < 30000 or abs(nHor) < 2400000  then
	if abs(nHor) < 6400000  then
--		Talk(1, "", strNpcName.."C�c h� ch�a �� �i�u ki�n nh�n th��ng. Vui l�ng ki�m tra �i�u ki�n danh v�ng, s� m�n, c�ng tr�ng.");
		Talk(1, "", strNpcName.."C�c h� ch�a �� �i�u ki�n nh�n th��ng. Vui l�ng ki�m tra �i�u ki�n c�ng tr�ng.");
		return 0
	end
	
	LIB_txtData:Init("top_1milhornor.txt")
	LIB_txtData:LoadData()
		
	local nNationRank = LIB_txtData.tbTextData[1]
	if nNationRank ~= 0 then
		Talk(1,"",strNpcName.."Ph�n th��ng n�y �� c� ng��i nh�n r�i, C�c h� h�y ch�n ph�n th��ng kh�c nh� !!!!");
		return 0
	end
	if nNationRank == 0 then
		if abs(GetTask(704)) < 6 then
			Talk(1,"",strNpcName.."C�c h�, ph�n th��ng n�y ch� ���c trao t�ng cho nguy�n so�i, C�c h� h�y c� g�ng th�m nh�...");
			return 0
		end
	elseif nNationRank == 1 then
		if abs(GetTask(704)) < 5 then
			Talk(1,"",strNpcName.."C�c h�, ph�n th��ng n�y ch� ���c trao t�ng cho t��ng qu�n, C�c h� h�y c� g�ng th�m nh�...");
			return 0
		end
	end
	 if GetItemCount(2,1,30230) < 13000 then
		 Talk(1,"", strNpcName.."C�c h� kh�ng �em �� 13.000 xu v�t ph�m, hay l� �� �� qu�n trong r��ng?")
		 return 0
	 end
	
	if gf_Judge_Room_Weight(15, 300, strNpcName) == 0 then
		Talk(1,"", strNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang.")
		return
	end
	
	if GetBit(GetTask(TSK_TOP_AWARD),TSK_TOP_1MIL_HORNOR) == 1 then
		Talk(1, "", strNpcName.."C�c h� �� nh�n ph�n th��ng �ua Top C�ng Tr�ng r�i.");
		return	
	end
	
--	local nNationRank = LIB_txtData.tbTextData[tonumber(nTongLieu)]
	if nNationRank >= 1 then
		Talk(1, "", strNpcName.."Ph�n th��ng n�y �� c� ch� nh�n!");
		return	
	end
	
	if LIB_txtData:AddValue(1,1,2) == 1 then
		nNationRank = LIB_txtData.tbTextData[1]
		LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
		LIB_Award.szLogAction = "nh�n"
		DelItem(2,1,30230,13000) -- Xu V�t Ph�m
		gf_SetTaskBit(TSK_TOP_AWARD,TSK_TOP_1MIL_HORNOR,1)
		get_award_daquy345(1)
		gf_AddItemEx2({2,1,30787, 1}, "tr�ng b�n �i�u", "DUA TOP 1" , "nh�n tr�ng")
		if nNationRank == 1 then -- B� Trang bi Hoa Phung Nguy�n So�i
			--Th�m trang b� Thanh Long --AddTrangBiHoaPhungNguyenSoai(10,0)
			AddTrangBiUyHoNguyenSoai(0,0)
--		elseif nNationRank == 2 then
--			TraoLoiHoNguyenSoai(13)
		end
		-- Bit 1 nh�n ph�n th��ng top c�ng tr�ng
		--local tbChienTuong = {item = {{gdp={0,105,30033,1,4,-1,-1,-1,-1,-1,-1,-1}, name = "Chi�n T��ng Nguy�n So�i"}}}
		--LIB_Award:Award(tbChienTuong)		
		Talk(1,"","Nh�n th�nh c�ng ph�n th��ng 6.600.000 c�ng tr�ng")
	end
end


-- Xem th�ng tin top 100 nh�n m�t t�ch
function get_top100_award_info()
	LIB_txtData:Init("soluongphanthuong.txt")
	LIB_txtData:LoadData()
	local szList = "S� l��ng nh�n th��ng m�t t�ch �� ��ng k�: \n"	
	local szList2 = szList
	local i = 0
	for i=1, getn(LIB_txtData.tbTextData) do
		szList = szList.."Chuy�n sinh "..i..": "..LIB_txtData.tbTextData[i].."/100\n"
	end
	Talk(1,"",szList)	
end


-- Xem th�ng tin top m�n ph�i
function get_top_faction_info()
	LIB_txtData:Init("top_route.txt")
	LIB_txtData:LoadData()
	local szList = "Th�ng tin ph�n th��ng top 1 h� ph�i �� nh�n: \n"	
	local szList2 = szList
	local szList3 = szList
	local i = 0
	for i=1, getn(LIB_txtData.tbTextData) do
		if tb_Route_Name[i] ~= "" then
			if i > 20 then
				szList3 = szList3.."Cao th� <color=green>"..tb_Route_Name[i].."<color>: "..LIB_txtData.tbTextData[i].."\n"
			elseif i > 10 and i <= 20 then
				szList2 = szList2.."Cao th� <color=green>"..tb_Route_Name[i].."<color>: "..LIB_txtData.tbTextData[i].."\n"
			else
				szList = szList.."Cao th� <color=green>"..tb_Route_Name[i].."<color>: "..LIB_txtData.tbTextData[i].."\n"
			end
		end
	end
	Talk(3,"",szList, szList2, szList3)	
end

-- Xem th�ng tin top qu�n c�ng
function get_top_nation_info()
	LIB_txtData:Init("top_nation.txt")
	LIB_txtData:LoadData()
	for i=1,getn(LIB_txtData.tbTextData) do
		print(LIB_txtData.tbTextData[i])
	end
	local szList = "Th�ng tin ph�n th��ng top 3 vinh d� chi�n tr��ng: \n"	
	local i = 0
	for i=1, getn(LIB_txtData.tbTextData) do		
		szList = szList.."Cao th� phe <color=green>"..tb_Nation_Name[i].."<color>: "..LIB_txtData.tbTextData[i].."\n"
	end
	Talk(1,"",szList)	
end

-- Nh�n �u ��i server m�i
function Say_NhanUuDai()
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	if nNation~=TOP_SERVER_ID then
		Talk(1,"","Ch� c� server " .. szServerName .. " m�i nh�n ���c ph�n th��ng")
		return
	end
	tbSay = {"Ta ch� gh� ngang/dlgover"}
	for i=getn(tbDieuKienUuDai),1,-1 do
		tinsert(tbSay,1,"C�p "..tbDieuKienUuDai[i]["nLevel"]..": "..tbDieuKienUuDai[i]["name"].." c�n "..tbDieuKienUuDai[i]["tbitem"][4].." "..tbDieuKienUuDai[i]["tbitem"][5].."/#UuDaiServerMoi("..i..")")
	end
	Say("M�i c�c h� nh�n ph�n t��ng t��ng x�ng",getn(tbSay), unpack(tbSay))
end

function UuDaiServerMoi(nOrder)
	if type(tbDieuKienUuDai[nOrder]) ~= "table" then
		Talk(1,"","Kh�ng c� ph�n th��ng cho c�p �� n�y")
		return
	end
	
	local tbAward = tbDieuKienUuDai[nOrder]
	local nLevel = GetLevel()
	local nRoute = GetPlayerRoute()
	
	if tbAward["nLevel"] > nLevel then
		Talk(1,"","C�c h� ch�a �� c�p �� nh�n th��ng")
		return
	end
	
	if gf_Judge_Room_Weight(tbAward["nSlot"] ,tbAward["nWeight"] ) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return
	end
	
	if gf_GetTaskBit(TSK_TOP_LEVEL, tbAward["nBit"]) == 1 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng �u ��i n�y r�i.")
		return 1
	end
	
	if nRoute == 0 then
		Talk(1,"","C�c h� ch�a gia nh�p h� ph�i n�n kh�ng th� nh�n th��ng.");
		return
	end
	
	if GetItemCount(tbAward["tbitem"][1], tbAward["tbitem"][2], tbAward["tbitem"][3]) < tbAward["tbitem"][4] then
		Talk(1,"","C�c h� kh�ng �em �� "..tbAward["tbitem"][5]..", h�y ki�m tra l�i h�nh trang.")
		return
	end
	
	-- Trao th��ng �u ��i
--	if nOrder == 10 then
--		Say_NhanVuKhiVietYen()
--		return
--	end
	
--	if nOrder < 10 then
		if DelItem(tbAward["tbitem"][1], tbAward["tbitem"][2], tbAward["tbitem"][3], tbAward["tbitem"][4])==1 then
			LIB_Award.szLogTitle = "Uu Dai "..szLOGSERVERNAME
			LIB_Award.szLogAction = "nh�n"
			gf_SetTaskBit(TSK_TOP_LEVEL, tbAward["nBit"], 1)
			if nOrder == 1 then
				GiveAwardTCTK(7)
			elseif nOrder == 2 then
				GiveAwardTCTK(8)
			elseif nOrder == 3 then
				GiveAwardTCTK(9)
			elseif nOrder == 4 then
				local tbUuDai = {item = {{gdp = {0,102,24,1,1,-1,-1,-1,-1,-1,-1,-1},  name = "��ng Ph��ng Long Ch�u"}}}
				LIB_Award:Award(tbUuDai)
			elseif nOrder == 5 then
				local tbUuDai = {item = {{gdp={2,1,30164+(mod(random(1,10000),20)),1000}, name = "tr�i c�y"}}}
				LIB_Award:Award(tbUuDai)
			elseif nOrder == 6 then
				local tbUuDai = {item = {{gdp={2,1,30164+(mod(random(1,10000),20)),1000}, name = "tr�i c�y"}}}
				LIB_Award:Award(tbUuDai)
			elseif nOrder == 7 then
				local tbUuDai = {item = {{gdp={2,1,30368,500}, name = "C� Linh Th�ch"}, {gdp={2,1,30369,1000}, name = "C� Linh Ng�c"}}}
				LIB_Award:Award(tbUuDai)
			elseif nOrder == 8 then
				local tbUuDai = {item = {{gdp={2,1,30368,1200}, name = "C� Linh Th�ch"}, {gdp={2,1,30369,2000}, name = "C� Linh Ng�c"}}}
				LIB_Award:Award(tbUuDai)
			end
--			elseif nOrder == 9 then
--				local tbUuDai = {item = {{gdp={2,1,30164+(mod(random(1,10000),20)),1000}, name = "tr�i c�y"}}}
--				LIB_Award:Award(tbUuDai)
--			elseif nOrder == 10 then
--				local tbUuDai = {item = {{gdp={2,1,30164+(mod(random(1,10000),20)),1000}, name = "tr�i c�y"}}}
--				LIB_Award:Award(tbUuDai)
--			elseif nOrder == 11 then
--				local tbUuDai = {item = {{gdp={0,107,tbMatTich70caocap[nRoute][2][3],9}, name = "M�t t�ch 70 cao c�p"}}}
--				LIB_Award:Award(tbUuDai)
--			elseif nOrder == 12 then
--				local tbUuDai = {item = {{gdp={2,1,30368,500}, name = "C� Linh Th�ch"}, {gdp={2,1,30369,1000}, name = "C� Linh Ng�c"}}}
--				LIB_Award:Award(tbUuDai)
--			end
		end
--	end
end

--
--function Say_NhanVuKhiVietYen()
--	local tbListAllVietYen = {
--		[1] = {"Vi�t Y�n Phi Tinh �ao", {0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,0}}, 
--		[2] = {"Vi�t Y�n Phi Tinh C�n", {0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[3] =  {"Vi�t Y�n Phi Tinh Tr��ng", {0,8,30003,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[4] =  {"Vi�t Y�n Phi Tinh Th�", {0,0,30004,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[5] =  {"Vi�t Y�n Tr�m Nguy�t Ki�m", {0,2,30010,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[6] =  {"Vi�t Y�n Tr�m Nguy�t B�t", {0,9,30011,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[7] =  {"Vi�t Y�n Phi Tinh Ki�m", {0,2,30006,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[8] =  {"Vi�t Y�n Phi Tinh C�m", {0,10,30007,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[9] =  {"Vi�t Y�n Phi Tinh Th�", {0,0,30008,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[10] =  {"Vi�t Y�n Tr�m Nguy�t C�n", {0,5,30009,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[11] =  {"Vi�t Y�n Phi Tinh Ch�m", {0,1,30005,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[12] =  {"Vi�t Y�n Tr�m Nguy�t Th��ng", {0,6,30012,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[13] =  {"Vi�t Y�n Tr�m Nguy�t Cung", {0,4,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[14] = {"Vi�t Y�n Tr�m Nguy�t Nh�n", {0,7,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[15] = {"Vi�t Y�n Tr�m Nguy�t Tr�o", {0,11,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--	}
--	tbSay = {"Ta c�n suy ngh� l�i/dlgover"}
--	for i=getn(tbListAllVietYen), 1, -1 do
--		tinsert(tbSay,1,tbListAllVietYen[i][1].."/#NhanVuKhiVietYen("..i..")")
--	end
--	Say("C�c h� h�y ch�n  v� kh� t�y th�ch:", getn(tbSay), unpack(tbSay))
--end
--
--function NhanVuKhiVietYen(nOption)
--	local tbAward = tbDieuKienUuDai[10]
--	local tbListAllVietYen = {
--		[1] = {"Vi�t Y�n Phi Tinh �ao", {0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,0}}, 
--		[2] = {"Vi�t Y�n Phi Tinh C�n", {0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[3] =  {"Vi�t Y�n Phi Tinh Tr��ng", {0,8,30003,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[4] =  {"Vi�t Y�n Phi Tinh Th�", {0,0,30004,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[5] =  {"Vi�t Y�n Tr�m Nguy�t Ki�m", {0,2,30010,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[6] =  {"Vi�t Y�n Tr�m Nguy�t B�t", {0,9,30011,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[7] =  {"Vi�t Y�n Phi Tinh Ki�m", {0,2,30006,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[8] =  {"Vi�t Y�n Phi Tinh C�m", {0,10,30007,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[9] =  {"Vi�t Y�n Phi Tinh Th�", {0,0,30008,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[10] =  {"Vi�t Y�n Tr�m Nguy�t C�n", {0,5,30009,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[11] =  {"Vi�t Y�n Phi Tinh Ch�m", {0,1,30005,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[12] =  {"Vi�t Y�n Tr�m Nguy�t Th��ng", {0,6,30012,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[13] =  {"Vi�t Y�n Tr�m Nguy�t Cung", {0,4,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[14] = {"Vi�t Y�n Tr�m Nguy�t Nh�n", {0,7,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--		[15] = {"Vi�t Y�n Tr�m Nguy�t Tr�o", {0,11,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
--	}
--	if DelItem(tbAward["tbitem"][1], tbAward["tbitem"][2], tbAward["tbitem"][3], tbAward["tbitem"][4]) == 1 then
--		gf_SetTaskBit(TSK_TOP_LEVEL, tbAward["nBit"], 1)
--		gf_AddItemEx2(tbListAllVietYen[nOption][2], tbListAllVietYen[nOption][1], "Uu Dai "..szLOGSERVERNAME, "nh�n")
--	end
--end

function dlgover()
end


function PhatThuongBangHoi()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20130519 then
		Talk(1,"","Ch�a ��n ng�y trao th��ng, phi�n C�c h� ��i ��n 19-05-2013 nh�.")
		return 0
	end
	
	local nTongMember = IsTongMember();
	if nTongMember == 0 then
		Talk(1,"","Ph�n th��ng n�y ch� d�nh cho bang h�i, C�c h� h�y gia nh�p bang h�i tr��c �� nh�.")
		return 0
	end
		
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(3600*24));
	if nDayCount <  15 then
		Talk(1,"","Th�i gian gia nh�p c�a c�c h� �t h�n 15 ng�y, kh�ng th� nh�n th��ng n�y!")
		return 0
	end
	
	if gf_GetTaskBit(TSK_TOP_LEVEL, 21) == 1 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i.")
		return 0
	end
	
	if gf_Judge_Room_Weight(25,2100) ~=1 then
		Talk(1,"","C�c h� c�n chu�n b� 25 � h�nh trang v� 2100 s�c l�c �� nh�n th��ng.")
		return 0
	end
	
	local szTongName = GetTongName()
	LIB_txtData:Init("banghoinhanthuong.txt")
	LIB_txtData:LoadMultiColumn();
	tbTenBang = LIB_txtData.tbTextData
	if tbTenBang[1] ~= nil and tbTenBang[1][1] ~= nil then
		if tbTenBang[1][1] ~= szTongName then
			Talk(1,"","Ph�n th��ng n�y �� trao cho bang ".. tbTenBang[1][1])
			return 0
		end
	else
		if GetTongPopuLadder() ~= 1 then
			Talk(1,"","Ph�n th��ng n�y ch� trao cho bang h�i x�p h�ng 1 nh�n kh�.")
			return 0
		end
		LIB_txtData:AddLine(szTongName)
	end
	
	LIB_Award.szLogTitle = "TOP BANG HOI "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	gf_SetTaskBit(TSK_TOP_LEVEL, 21, 1)
	local tbThuongBangHoi = {item = {
		{gdp={2,0,189,2003,1}, name = "Qu� Hoa T�u"},
		{gdp={2,1,1208,2,1}, name = "P_th��ng C�ng Th�nh (th�ng)"},
		{gdp={2,1,1210,20,1}, name = "B�o r��ng T�i nguy�n"},
		{gdp={0,105,33,1,4,-1,-1,-1,-1,-1,-1,-1}, name = "Ni�n Th�", nExpired = 90*24*60*60}
	}}
	LIB_Award:Award(tbThuongBangHoi)
end


function CS_TopAward(nOption)
	local tbOps = {
		[1] = {nCS = 1, nBit = 22},
		[2] = {nCS = 2, nBit = 23},
		[3] = {nCS = 3, nBit = 24},
		[4] = {nCS = 4, nBit = 25},
		[5] = {nCS = 5, nBit = 26},
		[6] = {nCS = 6, nBit = 27},
		[7] = {nCS = 7, nBit = 28},
	}
	local nTongLieu = 0
	if GetTask(701) > 0 then
		nTongLieu = 1
	elseif  GetTask(701) < 0 then
		nTongLieu = 2
	end
	
	if gf_GetTaskBit(TSK_TOP_LEVEL, tbOps[nOption]["nBit"]) == 1 then
		Talk(1,"","C�c h� �� ��ng k� nh�n ph�n th��ng n�y r�i.")
		return 0
	end
	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",strNpcName.."C�c h� ch�a gia nh�p h� ph�i!")
		return
	end
	
	local nPhucSinh = GetPlayerRebornParam(0)
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + nPhucSinh
	
	if nOption == 6 then
		if gf_CheckLevel(6,99) ~= 1 then
			Talk(1, "", strNpcName.."C�c h� ch�a ��t ph�c sinh 6 c�p �� 99, h�y c� g�ng th�m..");
			return 0
		end
	end
	
	if nOption == 7 then
		if gf_CheckLevel(10,94) ~= 1 then
			Talk(1, "", strNpcName.."C�c h� ch�a ��t ph�c sinh 10 c�p �� 94, h�y c� g�ng th�m..");
			return 0
		end
	end
	
	
	if gf_Judge_Room_Weight(10,500) ~=1 then
		Talk(1,"","C�c h� c�n chu�n b� 10 � h�nh trang v� 500 s�c l�c �� nh�n th��ng.")
		return 0
	end
	
	LIB_txtData:Init("soluongphanthuong.txt")
	LIB_txtData:LoadData()
	local nAward = LIB_txtData.tbTextData[tonumber(nOption)]
	
	if nOption == 6 then
		if nAward >= 10 then
			Talk(1, "", strNpcName.."�� c� �� 10 cao th� ��ng k� nh�n ph�n th��ng n�y, c�c h� h�y c� g�ng chi�m ph�n th��ng kh�c nh�!");
			return 0
		end
	end
	
	if nOption == 7 then
		if nAward >= 3 then
			Talk(1, "", strNpcName.."�� c� �� 3 cao th� ��ng k� nh�n ph�n th��ng n�y, c�c h� h�y c� g�ng chi�m ph�n th��ng kh�c nh�!");
			return 0
		end
	end
	
	local nRoute = GetPlayerRoute()
	if LIB_txtData:AddValue(tonumber(nOption),1,10) == 1 then
		gf_SetTaskBit(TSK_TOP_LEVEL, tbOps[nOption]["nBit"], 1)
		LIB_txtData:Init("danhsachnhanthuong.txt")
		local szLogAward = GetAccount().."	"..GetName().."	"..GetPlayerRoute().."	"..nTongLieu.."	"..nChuyenSinh.."	TOPCS"..nOption.."	"..date("%Y-%m-%d %H:%M:%S")
		LIB_txtData:AddLine(szLogAward)
		Talk(1,"","C�c h� l� ng��i th� "..(nAward+1).." nh�n th��ng th�nh c�ng.")
		
		if nOption == 6 then			
			AddItem(2,1,30344,3)
			TraoMatTichCaoCap20(1,nRoute)
		end
		
		if nOption == 7 then
			AddItem(2,1,30913,300)	--��ng t� chi nguy�n
			AddItem(2,1,30912,5000)	--hi�p ngh�a chi ch�ng
			AddItem(2,1,1051,1)	--bao thi�n th�ch tinh th�ch
			TraoMatTichCaoCap20(2,nRoute)
			gf_WriteLogEx("DUA TOP 3 CAO THU CS10", "nh�n", 1, "Nh�n th��ng th�nh c�ng")
		end
	end
end


function get_route_award_by_level_menu()
	local tbSay = {}
	tinsert(tbSay, "Nh�n th��ng Th�y Y�n Linh N� c�p 92/#get_route_award_by_level_done(92)")
	tinsert(tbSay, "Nh�n th��ng Th�y Y�n Linh N� c�p 93/#get_route_award_by_level_done(93)")
	tinsert(tbSay, "Nh�n th��ng Th�y Y�n Linh N� c�p 94/#get_route_award_by_level_done(94)")
	tinsert(tbSay, "Nh�n th��ng Th�y Y�n Linh N� c�p 96/#get_route_award_by_level_done(96)")
	tinsert(tbSay, "Nh�n th��ng Th�y Y�n Linh N� c�p 99/#get_route_award_by_level_done(99)")
	tinsert(tbSay, "Ta ch�a mu�n nh�n ngay/gf_DoNothing")
	Say("�� t� ph�i C�n L�n n�u ��t ��n ��ng c�p nh�t ��nh s� ���c ta t�ng th��ng ��c bi�t, d� nhi�n c�ng ph�i c�n ch�t th� lao.", getn(tbSay), tbSay)
end


function get_route_award_by_level_done(nOption)
	local tbAward = {
			[92] = {fn="TraoNguLongTuongQuan_TrangBi(7)"},
			[93] = {fn="TraoMatTich70CaoCap(20)"},
			[94] = {fn="TraoNguLongTuongQuan_TrangSuc()"},
			[96] = {fn="ThuongVuKhi_ThuyYenLinhNu()"},
			[99] = {item={
						{gdp={2,1,30345,1,1}, name = "Chuy�n Sinh ��n"}, 
						{gdp={2,0,1083,3,1}, name = "Th�i D�ch H�n Nguy�n C�ng Ph�"}, 
						{gdp={2,95,204,4,1}, name = "Thi�n Cang L�nh"}},
					nChankhi = 150000,
			},
	}
	if GetPlayerRoute() == 0 then
		Talk(1,"",strNpcName.."Ng��i ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng..")
		return
	end
	if GetLevel() < nOption then
		Talk(1,"",strNpcName.."��ng c�p ch�a ��, kh�ng th� nh�n th��ng..")	
		return
	end
	if IsPlayerDeath() == 1 then
		Talk(1,"",strNpcName.."Tr�ng th�i hi�n t�i kh�ng th� nh�n th��ng.")	
		return
	end
	if IsStalling() == 1 then
		Talk(1,"",strNpcName.."Tr�ng th�i hi�n t�i kh�ng th� nh�n th��ng.")	
		return
	end
	if TopCheckSkill(tFactionSkillInfo,20) == 0 then
		Talk(1, "", strNpcName.."C�c h� ch�a luy�n th�nh 20 c�p v� c�ng tr�n ph�i.");
		return	
	end
	local tbDieuKien = {
		[92] = {Bit = 1, Route = 30, Quanham = 3, Quancong = 200000, Danhvong = 20000, Sumon = 20000, Slot = 3},
		[93] = {Bit = 2, Route = 30, Quanham = 3, Quancong = 200000, Danhvong = 20000, Sumon = 20000, Slot = 20},
		[94] = {Bit = 3, Route = 30, Quanham = 4, Quancong = 230000, Danhvong = 23000, Sumon = 23000, Slot = 3},
		[96] = {Bit = 4, Route = 30, Quanham = 5, Quancong = 300000, Danhvong = 26000, Sumon = 26000, Slot = 1},
		[99] = {Bit = 5, Route = 30, Quanham = 5, Quancong = 330000, Danhvong = 30000, Sumon = 30000, Slot = 2},
	}
	local tbMaterial = {
		[92] = {Danhvong = 2000, Sumon = 2000, Gold = 2000, Xu = 2000, Exp = 200000000},
		[93] = {Danhvong = 2000, Sumon = 2000, Gold = 2000, Xu = 2000, Exp = 200000000},
		[94] = {Danhvong = 2000, Sumon = 2000, Gold = 2000, Xu = 2000, Exp = 200000000},
		[96] = {Danhvong = 3000, Sumon = 3000, Gold = 3000, Xu = 3000, Exp = 600000000},
		[99] = {Danhvong = 3000, Sumon = 3000, Gold = 3000, Xu = 3000, Exp = 1000000000},
	}
	if tbDieuKien[nOption] == nil then
		return 0
	end
	
	if gf_Judge_Room_Weight(tbDieuKien[nOption]["Slot"],500) ~= 1 then
		Talk(1,"",strNpcName.."C�n ".. tbDieuKien[nOption]["Slot"] .." h�nh trang , 500 s�c l�c. Vui l�ng s�p x�p l�i.")
		return
	end
	
	local nRoute = GetPlayerRoute()
	local nQuanham = GetTask(704)
	local nQuancong = GetTask(701)
	local nDanhvong = GetReputation()
	local nSumon = GetTask(336)
	
	if gf_GetTaskBit(TSK_BONUS_CONLON, tbDieuKien[nOption]["Bit"]) ~= 0 then
		Talk(1,"", strNpcName.."C�c h� �� nh�n ph�n th��ng n�y r�i.")
		return 0
	end
	
	if nRoute ~= tbDieuKien[nOption]["Route"] then
		Talk(1,"", strNpcName.."H� ph�i kh�ng ph� h�p, kh�ng th� nh�n th��ng.")
		return 0
	end
	
	if nDanhvong < tbDieuKien[nOption]["Danhvong"] then
		Talk(1,"", strNpcName.."Danh v�ng ch�a ��t m�c "..tbDieuKien[nOption]["Danhvong"]..", ta ch�a th� trao th��ng cho c�c h�.")
		return 0
	end
	
	if nSumon < tbDieuKien[nOption]["Sumon"] then
		Talk(1,"", strNpcName.."�i�m c�ng hi�n s� m�n ch�a ��t m�c "..tbDieuKien[nOption]["Sumon"]..", ta ch�a th� trao th��ng cho c�c h�.")
		return 0
	end
	
	if abs(nQuanham) < abs(tbDieuKien[nOption]["Quanham"]) then
		Talk(1,"", strNpcName.."Qu�n h�m ch�a �� �i�u ki�n, ng��i h�y c� g�ng th�m.")
		return 0
	end
	
	if abs(nQuancong) < abs(tbDieuKien[nOption]["Quancong"]) then
		Talk(1,"", strNpcName.."Qu�n c�ng ch�a �� "..abs(tbDieuKien[nOption]["Quancong"])..", ng��i h�y c� g�ng th�m.")
		return 0
	end
	
	if GetCash() < tbMaterial[nOption]["Gold"]*10000 then
		Talk(1,"", strNpcName.."Ng��i ch�a �em �� "..tbMaterial[nOption]["Gold"].." v�ng, h�y ki�m tra l�i nh�.")
		return 0
	end
	
	if GetItemCount(2,1,30230) < tbMaterial[nOption]["Xu"] then
		Talk(1,"", strNpcName.."Ng��i ch�a �em �� "..tbMaterial[nOption]["Xu"].." xu v�t ph�m, h�y ki�m tra l�i nh�.")
		return 0
	end
	
	if GetExp() < tbMaterial[nOption]["Exp"] then
		Talk(1,"", strNpcName.."Ng��i ch�a t�ch l�y �� "..tbMaterial[nOption]["Exp"].." �i�m kinh nghi�m, h�y c� g�ng th�m.")
		return 0
	end

--	****************** Trao th��ng *************************
	ModifyReputation(-tbMaterial[nOption]["Danhvong"],0)
	SetTask(336, GetTask(336) - tbMaterial[nOption]["Sumon"])
	Msg2Player("B�n b� tr� "..tbMaterial[nOption]["Sumon"].." �i�m s� m�n")
	Pay(tbMaterial[nOption]["Gold"]*10000)
	DelItem(2,1,30230,tbMaterial[nOption]["Xu"])
	Msg2Player("B�n b� tr� "..tbMaterial[nOption]["Xu"].." xu v�t ph�m")
	ModifyExp(-tbMaterial[nOption]["Exp"])
	Msg2Player("B�n b� tr� "..tbMaterial[nOption]["Exp"].." �i�m kinh nghi�m")
	gf_SetTaskBit(TSK_BONUS_CONLON, tbDieuKien[nOption]["Bit"], 1, 0)
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbAward[nOption])
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "Ph�n th��ng Th�y Y�n Linh N� c�p "..nOption)
end
function get_award_daquy345(nType)
	local nNum3 = 32
	local nNum4 = 32
	local nNum5 = 8
	if nType == 1 then
		nNum3 = 32
		nNum4 = 32
		nNum5 = 16
	elseif nType == 3 then
		nNum3 = 16
		nNum4 = 4
		nNum5 = 0
	end
	
	local tbCheckCase = {
		[1] = {2500},
		[2] = {2500},
		[3] = {2500},
		[4] = {2500},
	}
--	local tbAwardRate = {[1] = 0, [2] = 0, [3] = 0,[4] = 0,}
	for i=1,nNum3 do	--�� qu� level3
		local nIndex = get_random_event_ittem(tbCheckCase, 10000)
		gf_AddItemEx2({2,22,nIndex*100+3, 1}, "�� qu� ", "DUA TOP 1" , "nh�n")
	end
	for i=1,nNum4 do	--�� qu� level4
		local nIndex = get_random_event_ittem(tbCheckCase, 10000)
		gf_AddItemEx2({2,22,nIndex*100+4, 1}, "�� qu� ", "DUA TOP 1" , "nh�n")
	end
	for i=1,nNum5 do	--�� qu� level5
		local nIndex = get_random_event_ittem(tbCheckCase, 10000)
		gf_AddItemEx2({2,22,nIndex*100+5, 1}, "�� qu� ", "DUA TOP 1" , "nh�n")
	end
end
function get_award_daquy123()
	for i=1,4 do	--�� qu� level2
		gf_AddItemEx2({2,22,i*100+4, 8}, "�� qu� 1 h� ph�i", "DUA TOP" , "nh�n")
	end
	for i=1,4 do	--�� qu� level3
		gf_AddItemEx2({2,22,i*100+5, 4}, "�� qu� 1 h� ph�i", "DUA TOP" , "nh�n")
	end
	for i=1,4 do	--�� qu� level4
		gf_AddItemEx2({2,22,i*100+6, 3}, "�� qu� 1 h� ph�i", "DUA TOP" , "nh�n")
	end
end
function get_random_event_ittem(nTab, nDeterminator)
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTab) do
		nBase = nBase + nTab[i][1]
		if nRandom <= nBase then
			return i			
		end
	end	
end
function vangdanhthienha_get_fast_level()
	
	local tSay = {}

--	tinsert(tSay,"Th�ng ti�n ��n ��ng c�p chuy�n sinh 6 c�p 90(ph�i ��t c�p 73, 3000 danh v�ng, 4000 s� m�n, 50000 c�ng tr�ng)/#vdth_get_level(1)")	----TSK_TT_VANGDANHTHIENHA_DUATOP:s� d�ng bit 1
	tinsert(tSay,"Th�ng ti�n ��n ��ng c�p chuy�n sinh 7 c�p 90(ph�i ��t c�p 73, 3000 danh v�ng, 4000 s� m�n, 50000 c�ng tr�ng)/#vdth_get_level(1)")	----TSK_TT_VANGDANHTHIENHA_DUATOP:s� d�ng bit 1
	tinsert(tSay,"Th�ng ti�n ��n ��ng c�p chuy�n sinh 8 c�p 90(ph�i ��t chuy�n sinh 7 c�p 95, 6000 danh v�ng, 6000 s� m�n, 120000 c�ng tr�ng)/#vdth_get_level(2)")	----TSK_TT_VANGDANHTHIENHA_DUATOP:s� d�ng bit 2
	tinsert(tSay,"Th�ng ti�n ��n ��ng c�p chuy�n sinh 9 c�p 90(ph�i ��t chuy�n sinh 8 c�p 95, 6000 danh v�ng, 6000 s� m�n, 180000 c�ng tr�ng)/#vdth_get_level(3)")	----TSK_TT_VANGDANHTHIENHA_DUATOP:s� d�ng bit 3
	tinsert(tSay,"Th�ng ti�n ��n ��ng c�p chuy�n sinh 10 c�p 10(ph�i ��t chuy�n sinh 9 c�p 97, 10000 danh v�ng, 10000 s� m�n, 500000 c�ng tr�ng)/#vdth_get_level(4)")	----TSK_TT_VANGDANHTHIENHA_DUATOP: s� d�ng bit 4	(2666)
	tinsert(tSay,"Ta bi�t r�i/dlgover")	
	local strSay = strNpcName.."Ho�t ��ng <color=yellow>Truy C�ng L�nh Th��ng<color> di�n ra t� ng�y<color=red> "..szStartDate.." ��n 24:00 "..szEndDate.."<color>. Trong th�i gian n�y, qu� ��ng ��o c� th� ��n g�p ta �� nh�n c�c ph�n th��ng h�p d�n. Th�ng tin chi ti�t qu� ��ng ��o vui l�ng xem t�i trang ch�."
	Say(strSay,getn(tSay),tSay)
end
function vangdanhthienha_get_award_by_level()
	local tSay = {}
	tinsert(tSay,"Ta mu�n nh�n th��ng Chuy�n Sinh 6 c�p 90/#vdth_get_award(1)")	--TSK_VANGDANHTHIENHA_DUATOP: s� d�ng bit 1 (2733)
	tinsert(tSay,"Ta mu�n nh�n th��ng Chuy�n Sinh 7 c�p 90/#vdth_get_award(2)")	--TSK_VANGDANHTHIENHA_DUATOP: s� d�ng bit 2
	tinsert(tSay,"Ta mu�n nh�n th��ng Chuy�n Sinh 7 c�p 91/#vdth_get_award(3)")	--TSK_VANGDANHTHIENHA_DUATOP: s� d�ng bit 3
	tinsert(tSay,"Ta mu�n nh�n th��ng Chuy�n Sinh 8 c�p 90/#vdth_get_award(4)")	--TSK_VANGDANHTHIENHA_DUATOP: s� d�ng bit 4
	tinsert(tSay,"Ta mu�n nh�n th��ng Chuy�n Sinh 8 c�p 93/#vdth_get_award(5)")	--TSK_VANGDANHTHIENHA_DUATOP: s� d�ng bit 5
	tinsert(tSay,"Ta mu�n nh�n th��ng Chuy�n Sinh 9 c�p 90/#vdth_get_award(6)")	--TSK_VANGDANHTHIENHA_DUATOP: s� d�ng bit 6
	tinsert(tSay,"Ta mu�n nh�n th��ng Chuy�n Sinh 9 c�p 91/#vdth_get_award(7)")	--TSK_VANGDANHTHIENHA_DUATOP: s� d�ng bit 7
	tinsert(tSay,"Ta mu�n nh�n th��ng Chuy�n Sinh 9 c�p 92/#vdth_get_award(8)")	--TSK_VANGDANHTHIENHA_DUATOP: s� d�ng bit 8
	tinsert(tSay,"Ta mu�n nh�n th��ng Chuy�n Sinh 9 c�p 93/#vdth_get_award(9)")	--TSK_VANGDANHTHIENHA_DUATOP: s� d�ng bit 9
	tinsert(tSay,"Ta mu�n nh�n th��ng Chuy�n Sinh 10 c�p 90/#vdth_get_award(10)")	--TSK_VANGDANHTHIENHA_DUATOP: s� d�ng bit 10
	tinsert(tSay,"Ta mu�n nh�n th��ng Chuy�n Sinh 10 c�p 91/#vdth_get_award(11)")	--TSK_VANGDANHTHIENHA_DUATOP: s� d�ng bit 11
	tinsert(tSay,"Ta mu�n nh�n th��ng Chuy�n Sinh 10 c�p 92/#vdth_get_award(12)")	--TSK_VANGDANHTHIENHA_DUATOP: s� d�ng bit 12
	tinsert(tSay,"Ta mu�n nh�n th��ng Chuy�n Sinh 10 c�p 93/#vdth_get_award(13)")	--TSK_VANGDANHTHIENHA_DUATOP: s� d�ng bit 13
	tinsert(tSay,"Ta mu�n nh�n th��ng Chuy�n Sinh 10 c�p 94/#vdth_get_award(14)")	--TSK_VANGDANHTHIENHA_DUATOP: s� d�ng bit 14
	tinsert(tSay,"Ta bi�t r�i/dlgover")	
	local strSay = strNpcName.."Ho�t ��ng <color=yellow>Truy C�ng L�nh Th��ng<color> di�n ra t� ng�y<color=red> "..szStartDate.." ��n 24:00 "..szEndDate.."<color>. Trong th�i gian n�y, qu� ��ng ��o c� th� ��n g�p ta �� nh�n c�c ph�n th��ng h�p d�n. Th�ng tin chi ti�t qu� ��ng ��o vui l�ng xem th�m t�i trang ch�."
	Say(strSay,getn(tSay),tSay)
end
function vdth_get_level(nType)
	do return 0 end
	
	local tbCondition = {--level y�u c�u, danh v�ng, s� m�n, c�ng trang, level l�n						
							[1] = {73, 3000, 4000, 50000, 790, "��ng c�p 73"},
							[2] = {795, 6000, 6000, 120000, 890, "chuy�n sinh 7 c�p 95"},
							[3] = {895, 6000, 6000, 180000, 990, "chuy�n sinh 8 c�p 95"},
							[4] = {997, 10000, 10000, 500000, 1010, "chuy�n sinh 9 c�p 97"},
						}
	if GetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),nType) == 1 then	--S� d�ng Bit 1,2,3,4,5
		Talk(1, "", "��i hi�p �� nh�n ph�n th��ng n�y r�i, n�n kh�ng th� nh�n th��ng ���c.")
		return 0
	end						
	local nRoute = gf_CheckPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", "��i hi�p ch�a gia nh�p m�n ph�i n�o, n�n kh�ng th� nh�n th��ng ���c.")
		return 0
	end 
--	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
--	local nPhucSinh = GetPlayerRebornParam(0) or 0
	local nChuyenPhucSinh = gf_GetTransLevel()  -- bao g�m chuy�n sinh v� ph�c sinh
--	local nLevel = (nChuyenSinh + nPhucSinh)*100 + GetLevel()			
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = abs(GetTask(701));
	if nChuyenPhucSinh < tbCondition[nType][1] then
		Talk(1, "", strNpcName.."C�c h� ch�a �� "..tbCondition[nType][6].." n�n kh�ng th� nh�n th��ng.");
		return 0
	end
	if nChuyenPhucSinh >= tbCondition[nType][5] then
		Talk(1, "", strNpcName.."��ng c�p c�a c�c h� qu� cao n�n kh�ng th� nh�n th��ng.");
		return 0
	end
	if nRep < tbCondition[nType][2] then
		Talk(1, "", strNpcName.."C�c h� ch�a �� �i�m danh v�ng n�n kh�ng th� nh�n th��ng.");
		return 0
	end
	if nFaction < tbCondition[nType][3] then
		Talk(1, "", strNpcName.."C�c h� ch�a �� �i�m s� m�n n�n kh�ng th� nh�n th��ng.");
		return 0
	end
	if nHor < tbCondition[nType][4] then
		Talk(1, "", strNpcName.."C�c h� ch�a �� �i�m c�ng trang n�n kh�ng th� nh�n th��ng.");
		return 0
	end
	if gf_JudgeRoomWeight(38,400,strNpcName) == 0 then
		return 0
	end
	if nType == 4 then 					
		if GetItemCount(2,1,30814) < 3 then
			Talk(1, "", strNpcName.."C�c h� kh�ng c� �� 3 ph�c sinh ��n n�n kh�ng th� nh�n th��ng.");
			return 0
		end
	end
	if nType == 4 then
--		vdth_phucsinh5()
--		vdth_chuyensinh5()
--		MeridianUpdateLevel()
--	elseif nType == 1 then
--		vdth_phucsinh1()
--		MeridianUpdateLevel()
	elseif nType == 1 then
		vdth_phucsinh2()
	elseif nType == 2 then
		vdth_phucsinh3()
	elseif nType == 3 then
		vdth_phucsinh4()		
	end
end
function vdth_chuyensinh5()
	
	local tSay = 	{
							"V�n b�i mu�n tu luy�n theo h��ng Long T�!/#vdth_chuyensinh5_finish(1)",
							"V�n b�i mu�n tu luy�n theo h��ng H� T�!/#vdth_chuyensinh5_finish(2)",
							"V�n b�i mu�n tu luy�n theo h��ng Ph�ng T�!/#vdth_chuyensinh5_finish(4)",
							"V�n b�i mu�n tu luy�n theo h��ng �ng T�!/#vdth_chuyensinh5_finish(3)",
							"V�n b�i suy ngh� l�i ��./dlgover",
						}
	Say(strNpcName.."<color=yellow>H�n T�c H�a Quang<color> h�p thu linh kh� �m d��ng, v�n v�t sinh di�t ��u c� th� kh�ng ch�, ng��i mu�n tu luy�n theo h��ng n�o?",getn(tSay),tSay)
end

function vdth_chuyensinh5_finish(nType)
	do return 0 end
	
	local nRoute = GetPlayerRoute()
	-- Set s� l�n chuy�n sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT, 5)
	-- Set h��ng chuy�n sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nType)
	local nTransCount = GetTranslifeCount()	
	gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
	for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
		local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
		P = P + GetBody() - 1
		Pnew = 561 + GetBody()
		lvatt3 = lvatt3 or 0
		att3 = att3 or 0
--		BigDelItem(G,D,P,BigGetItemCount(G,D,P))
--		BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
		gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"T� Linh Vi�t Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
	end
	RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
	AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
	SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
--	SetTaskTrans()
	ResetProperty()
	SetLevel(90,0)
	Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� t�...")
	AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 8 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),1,1));		
	--ph�n th��ng th�m
	AddItem(0,152,9,1)
	AddItem(0,153,9,1)
	AddItem(0,154,9,1)
	gf_AddItemEx2({0,102,8844, 1,4, -1, -1, -1, -1, -1, -1},"Huy Ho�ng Qu�t Kh�i","DUA TOP","Huy Ho�ng Qu�t Kh�i")	
	gf_AddItemEx2({0,102,8845, 1,4, -1, -1, -1, -1, -1, -1},"Vinh D� Qu�t Kh�i","DUA TOP","Vinh D� Qu�t Kh�i")	
	gf_AddItemEx2({2,1,30912,500,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
	gf_AddItemEx2({0,112,78,1,1},"L�ng Ba Vi B�","DUA TOP","L�ng Ba Vi B� to�n t�p")	
	gf_AddItemEx2({2,1,31068,1},"kh�c b�n c�p 1","DUA TOP","kh�c b�n c�p 1")
	gf_AddItemEx2({2,1,31069,1},"kh�c b�n c�p 1","DUA TOP","kh�c b�n c�p 1")
	gf_AddItemEx2({2,1,31070,1},"kh�c b�n c�p 1","DUA TOP","kh�c b�n c�p 1")
	gf_AddItemEx2({2,1,31071,1},"kh�c b�n c�p 1","DUA TOP","kh�c b�n c�p 1")
	gf_AddItemEx2({2,1,31072,1},"kh�c b�n c�p 1","DUA TOP","kh�c b�n c�p 1")
	TraoTrangBiChienCuong()
	MeridianUpdateLevel()
--	SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (500 * 100)) --�i�m n�ng c�p
--	Msg2Player("B�n nh�n ���c 500 �i�m N�ng C�p B�n ��ng H�nh")
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng tr�ng sinh 5 c�p 90")
	GiveJue() --y�u quy�t theo h� ph�i
	DoWait(15,15,10)
end

function vdth_phucsinh1()
	
	local tSay = 	{}         
	tinsert(tSay, "Ph�c sinh theo h��ng Long T�/#vdth_phucsinh1_finish(1)")			
	tinsert(tSay, "Ph�c sinh theo h��ng H� T�/#vdth_phucsinh1_finish(2)")			
	tinsert(tSay, "Ph�c sinh theo h��ng Ph�ng T�/#vdth_phucsinh1_finish(4)")			
	tinsert(tSay, "Ph�c sinh theo h��ng �ng T�/#vdth_phucsinh1_finish(3)")		
	tinsert(tSay, "Ta ch�a mu�n Ph�c Sinh/dlgover")	

	Say(strNpcName.."<color=yellow>H�n T�c H�a Quang<color> h�p thu linh kh� �m d��ng, v�n v�t sinh di�t ��u c� th� kh�ng ch�, ng��i mu�n tu luy�n theo h��ng n�o?",getn(tSay),tSay)
end
function vdth_phucsinh1_finish(nType)
	do return 0 end
	
	local nTransCount = GetTranslifeCount()
	local nRoute = GetPlayerRoute()
	local tbType = {"Long T�", "H� T�", "�ng T�", "Ph�ng T�"}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	

	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),1,1));		
--	ModifyExp(-GetExp())
 	local nGetExp = GetExp()
	local nTime = floor(nGetExp/2000000000)
	if nTime >= 1 then
		for i = 1, nTime do
			ModifyExp(-2000000000)
		end
	end
	ModifyExp(-GetExp())
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(1,nType) -- Chuy�n Sinh 6 th�nh c�ng	
	AddTitle(61,05)
	SetLevel(90,0)
	--ph�n th��ng th�m
	TraoTrangBiChienCuong()
	gf_AddItemEx2({0,102,8844, 1,4, -1, -1, -1, -1, -1, -1},"Huy Ho�ng Qu�t Kh�i","DUA TOP","Huy Ho�ng Qu�t Kh�i")	
	gf_AddItemEx2({0,102,8845, 1,4, -1, -1, -1, -1, -1, -1},"Vinh D� Qu�t Kh�i","DUA TOP","Vinh D� Qu�t Kh�i")	
	AddItem(0,152,9,1)
	AddItem(0,153,9,1)
	AddItem(0,154,9,1)
	gf_AddItemEx2({0,112,78,1,1},"L�ng Ba Vi B�","DUA TOP","L�ng Ba Vi B� to�n t�p")	
	gf_AddItemEx2({2,1,30912,800,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
	MeridianUpdateLevel()
	GiveJue() --y�u quy�t theo h� ph�i
	gf_AddItemEx2({2,1,31068,1},"kh�c b�n c�p 1","DUA TOP","kh�c b�n c�p 1")
	gf_AddItemEx2({2,1,31069,1},"kh�c b�n c�p 1","DUA TOP","kh�c b�n c�p 1")
	gf_AddItemEx2({2,1,31070,1},"kh�c b�n c�p 1","DUA TOP","kh�c b�n c�p 1")
	gf_AddItemEx2({2,1,31071,1},"kh�c b�n c�p 1","DUA TOP","kh�c b�n c�p 1")
	gf_AddItemEx2({2,1,31072,1},"kh�c b�n c�p 1","DUA TOP","kh�c b�n c�p 1")
	gf_AddItemEx2({2,1,30944,1,4},"V� H� H�o Hi�p L�nh n�n","DUA TOP","V� H� H�o Hi�p n�n")	
	
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 1 c�p 90")
	Say("Ch�c m�ng ��i hi�p �� l�nh ng� th�nh c�ng b� k�p gia truy�n T� Linh Ph�c Tinh! H�y ��ng nh�p l�i.",1,"Tho�t!/go_exit")
end
function vdth_phucsinh2()
	
	local tSay = 	{}         
	tinsert(tSay, "Ph�c sinh theo h��ng Long T�/#vdth_phucsinh2_finish(1)")			
	tinsert(tSay, "Ph�c sinh theo h��ng H� T�/#vdth_phucsinh2_finish(2)")			
	tinsert(tSay, "Ph�c sinh theo h��ng Ph�ng T�/#vdth_phucsinh2_finish(4)")			
	tinsert(tSay, "Ph�c sinh theo h��ng �ng T�/#vdth_phucsinh2_finish(3)")		
	tinsert(tSay, "Ta ch�a mu�n Ph�c Sinh/dlgover")	

	Say(strNpcName.."<color=yellow>H�n T�c H�a Quang<color> h�p thu linh kh� �m d��ng, v�n v�t sinh di�t ��u c� th� kh�ng ch�, ng��i mu�n tu luy�n theo h��ng n�o?",getn(tSay),tSay)
end
function vdth_phucsinh2_finish(nType)

	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	local nType_cs6 = GetPlayerRebornParam(1)	
	local nTransCount = GetTranslifeCount()	
--	for i=1, getn(tb_translife_cloth_PS_DuaTop[nType_cs6]) do 
--			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_PS_DuaTop[nType_cs6][i][2])
--			P = P + GetBody() - 1
--			BigDelItem(G,D,P,BigGetItemCount(G,D,P))			
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"T� Linh Vi�t Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
--	end
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(2,nType) -- Chuy�n Sinh 7 th�nh c�ng		
	SetLevel(90,0)
	RemoveTitle(61,05)
	AddTitle(61,06)
 	local nGetExp = GetExp()
	local nTime = floor(nGetExp/2000000000)
	if nTime >= 1 then
		for i = 1, nTime do
			ModifyExp(-2000000000)
		end
	end
	ModifyExp(-GetExp())

	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),1,1));		
	
	--ph�n th��ng th�m
	TraoTrangBiChienCuong()
	gf_AddItemEx2({0,102,8844, 1,4, -1, -1, -1, -1, -1, -1},"Huy Ho�ng Qu�t Kh�i","DUA TOP","Huy Ho�ng Qu�t Kh�i")	
	gf_AddItemEx2({0,102,8845, 1,4, -1, -1, -1, -1, -1, -1},"Vinh D� Qu�t Kh�i","DUA TOP","Vinh D� Qu�t Kh�i")	
	AddItem(0,152,9,1)
	AddItem(0,153,9,1)
	AddItem(0,154,9,1)
	gf_AddItemEx2({0,112,78,1,1},"L�ng Ba Vi B�","DUA TOP","L�ng Ba Vi B� to�n t�p")	
	gf_AddItemEx2({2,1,30912,800,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
	MeridianUpdateLevel()
	GiveJue() --y�u quy�t theo h� ph�i
	gf_AddItemEx2({2,1,31068,1},"kh�c b�n c�p 1","DUA TOP","kh�c b�n c�p 1")
	gf_AddItemEx2({2,1,31069,1},"kh�c b�n c�p 1","DUA TOP","kh�c b�n c�p 1")
	gf_AddItemEx2({2,1,31070,1},"kh�c b�n c�p 1","DUA TOP","kh�c b�n c�p 1")
	gf_AddItemEx2({2,1,31071,1},"kh�c b�n c�p 1","DUA TOP","kh�c b�n c�p 1")
	gf_AddItemEx2({2,1,31072,1},"kh�c b�n c�p 1","DUA TOP","kh�c b�n c�p 1")
	gf_AddItemEx2({2,1,30944,1,4},"V� H� H�o Hi�p L�nh n�n","DUA TOP","V� H� H�o Hi�p n�n")	
	gf_AddItemEx2({2,1,30945,1,4},"V� H� H�o Hi�p L�nh �o","DUA TOP","V� H� H�o Hi�p �o")	
	gf_AddItemEx2({2,1,30946,1,4},"V� H� H�o Hi�p L�nh qu�n","DUA TOP","V� H� H�o Hi�p qu�n")	
	
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 2 c�p 90")
	Say("Ch�c m�ng ��i hi�p �� l�nh ng� th�nh c�ng b� k�p gia truy�n T� Linh Ph�c Tinh! H�y ��ng nh�p l�i.",1,"Tho�t!/go_exit")

end
function vdth_phucsinh3()
	
	local tSay = 	{}         
	tinsert(tSay, "Ph�c sinh theo h��ng Long T�/#vdth_phucsinh3_finish(1)")			
	tinsert(tSay, "Ph�c sinh theo h��ng H� T�/#vdth_phucsinh3_finish(2)")			
	tinsert(tSay, "Ph�c sinh theo h��ng Ph�ng T�/#vdth_phucsinh3_finish(4)")			
	tinsert(tSay, "Ph�c sinh theo h��ng �ng T�/#vdth_phucsinh3_finish(3)")		
	tinsert(tSay, "Ta ch�a mu�n Ph�c Sinh/dlgover")	

	Say(strNpcName.."<color=yellow>H�n T�c H�a Quang<color> h�p thu linh kh� �m d��ng, v�n v�t sinh di�t ��u c� th� kh�ng ch�, ng��i mu�n tu luy�n theo h��ng n�o?",getn(tSay),tSay)
end
function vdth_phucsinh3_finish(nType)

	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	local nType_cs6 = GetPlayerRebornParam(1)	
	local nTransCount = GetTranslifeCount()	
	for i=1, getn(tb_translife_cloth_PS_DuaTop[nType_cs6]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_PS_DuaTop[nType_cs6][i][2])
			P = P + GetBody() - 1
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))			
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"T� Linh Vi�t Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(3,nType) -- Chuy�n Sinh 8 th�nh c�ng		
	SetLevel(90,0)
	RemoveTitle(61,06)
	AddTitle(71,1)
 	local nGetExp = GetExp()
	local nTime = floor(nGetExp/2000000000)
	if nTime >= 1 then
		for i = 1, nTime do
			ModifyExp(-2000000000)
		end
	end
	ModifyExp(-GetExp())

	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),2,1));		

	--ph�n th��ng th�m
	for i=1,4 do	--�� qu� level1
		gf_AddItemEx2({2,22,i*100+1, 8}, "�� qu� 1 h� ph�i", "DUA TOP" , "nh�n")
	end
	for i=1,4 do	--�� qu� level2
		gf_AddItemEx2({2,22,i*100+2, 8}, "�� qu� 2 h� ph�i", "DUA TOP" , "nh�n")
	end
	for i=1,4 do	--�� qu� level3
		gf_AddItemEx2({2,22,i*100+3, 6}, "�� qu� 3 h� ph�i", "DUA TOP" , "nh�n")
	end
--	for i=1,4 do	--�� qu� level4
--		gf_AddItemEx2({2,22,i*100+4, 4}, "�� qu� 4 h� ph�i", "DUA TOP" , "nh�n")
--	end
	gf_AddItemEx2({0,112,158,1,4},"L�ng Ba Vi B�","DUA TOP","L�ng Ba Vi B� to�n t�p")	
	GiveJue() --y�u quy�t theo h� ph�i
	gf_AddItemEx2({2,1,30912,1200,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
	MeridianUpdateLevel()
	AwardGenuineQi(80000)
--	gf_AddItemEx2({2,1,30946,1,4},"V� H� H�o Hi�p L�nh qu�n","DUA TOP","V� H� H�o Hi�p qu�n")	
	
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 3 c�p 90")
	Say("Ch�c m�ng ��i hi�p �� l�nh ng� th�nh c�ng b� k�p gia truy�n T� Linh Ph�c Tinh! H�y ��ng nh�p l�i.",1,"Tho�t!/go_exit")

end
function vdth_phucsinh4()
	
	local tSay = 	{}         
	tinsert(tSay, "Ph�c sinh theo h��ng Long T�/#vdth_phucsinh4_finish(1)")			
	tinsert(tSay, "Ph�c sinh theo h��ng H� T�/#vdth_phucsinh4_finish(2)")			
	tinsert(tSay, "Ph�c sinh theo h��ng Ph�ng T�/#vdth_phucsinh4_finish(4)")			
	tinsert(tSay, "Ph�c sinh theo h��ng �ng T�/#vdth_phucsinh4_finish(3)")		
	tinsert(tSay, "Ta ch�a mu�n Ph�c Sinh/dlgover")	

	Say(strNpcName.."<color=yellow>H�n T�c H�a Quang<color> h�p thu linh kh� �m d��ng, v�n v�t sinh di�t ��u c� th� kh�ng ch�, ng��i mu�n tu luy�n theo h��ng n�o?",getn(tSay),tSay)
end
function vdth_phucsinh4_finish(nType)

	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	local nType_cs6 = GetPlayerRebornParam(1)	
	for i=1, getn(tb_translife_cloth_PS_DuaTop[nType_cs6]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_PS_DuaTop[nType_cs6][i][2])
			P = P + GetBody() - 1
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))			
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"T� Linh Vi�t Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(4,nType) -- Chuy�n Sinh 9 th�nh c�ng		
	SetLevel(90,0)
	RemoveTitle(71,1)
	AddTitle(73,1)
 	local nGetExp = GetExp()
	local nTime = floor(nGetExp/2000000000)
	if nTime >= 1 then
		for i = 1, nTime do
			ModifyExp(-2000000000)
		end
	end
	ModifyExp(-GetExp())

	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),3,1));		

	--ph�n th��ng th�m
	for i=1,4 do	--�� qu� level2
		gf_AddItemEx2({2,22,i*100+2, 6}, "�� qu� 2 h� ph�i", "DUA TOP" , "nh�n")
	end
	for i=1,4 do	--�� qu� level3
		gf_AddItemEx2({2,22,i*100+3, 6}, "�� qu� 3 h� ph�i", "DUA TOP" , "nh�n")
	end
	for i=1,4 do	--�� qu� level4
		gf_AddItemEx2({2,22,i*100+4, 4}, "�� qu� 4 h� ph�i", "DUA TOP" , "nh�n")
	end
--	for i=1,4 do	--�� qu� level5
--		gf_AddItemEx2({2,22,i*100+5, 4}, "�� qu� 5 h� ph�i", "DUA TOP" , "nh�n")
--	end
	gf_AddItemEx2({2,1,30912,1500,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
	MeridianUpdateLevel()	
	AwardGenuineQi(100000)
	
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 4 c�p 80")
	Say("Ch�c m�ng ��i hi�p �� l�nh ng� th�nh c�ng b� k�p gia truy�n T� Linh Ph�c Tinh! H�y ��ng nh�p l�i.",1,"Tho�t!/go_exit")

end

function vdth_phucsinh5()
	
	local tSay = 	{}         
	tinsert(tSay, "Ph�c sinh theo h��ng Long T�/#vdth_phucsinh5_finish(1)")			
	tinsert(tSay, "Ph�c sinh theo h��ng H� T�/#vdth_phucsinh5_finish(2)")			
	tinsert(tSay, "Ph�c sinh theo h��ng Ph�ng T�/#vdth_phucsinh5_finish(4)")			
	tinsert(tSay, "Ph�c sinh theo h��ng �ng T�/#vdth_phucsinh5_finish(3)")		
	tinsert(tSay, "Ta ch�a mu�n Ph�c Sinh/dlgover")	

	Say(strNpcName.."<color=yellow>H�n T�c H�a Quang<color> h�p thu linh kh� �m d��ng, v�n v�t sinh di�t ��u c� th� kh�ng ch�, ng��i mu�n tu luy�n theo h��ng n�o?",getn(tSay),tSay)
end
function vdth_phucsinh5_finish(nType)

	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return 0
	end	
	if DelItem(2,1,30814,3) ~= 1 then
		Talk(1, "", strNpcName.."C�c h� kh�ng c� �� 3 ph�c sinh ��n n�n kh�ng th� nh�n th��ng.");
		return 0
	end
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	local nType_cs6 = GetPlayerRebornParam(1)	
--	for i=1, getn(tb_translife_cloth_PS_DuaTop[nType_cs6]) do
--			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_PS_DuaTop[nType_cs6][i][2])
--			P = P + GetBody() - 1
--			BigDelItem(G,D,P,BigGetItemCount(G,D,P))			
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"T� Linh Vi�t Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
--		end
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(5,nType) -- Chuy�n Sinh 10 th�nh c�ng		
	SetLevel(80,0)
	RemoveTitle(73,1)
	AddTitle(76,1)
 	local nGetExp = GetExp()
	local nTime = floor(nGetExp/2000000000)
	if nTime >= 1 then
		for i = 1, nTime do
			ModifyExp(-2000000000)
		end
	end
	ModifyExp(-GetExp())

--	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),4,1));		--Task d�ng khi s� d�ng t�nh n�ng Th�ng Ti�n
	SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),10,1));	
	
	--ph�n th��ng th�m
	for i=1,4 do	--�� qu� level3
		gf_AddItemEx2({2,22,i*100+3, 6}, "�� qu� 3 h� ph�i", "DUA TOP" , "nh�n")
	end
	for i=1,4 do	--�� qu� level4
		gf_AddItemEx2({2,22,i*100+4, 6}, "�� qu� 4 h� ph�i", "DUA TOP" , "nh�n")
	end
	for i=1,4 do	--�� qu� level5
		gf_AddItemEx2({2,22,i*100+5, 4}, "�� qu� 5 h� ph�i", "DUA TOP" , "nh�n")
	end
	for i=1,4 do	--�� qu� level6
		gf_AddItemEx2({2,22,i*100+6, 1}, "�� qu� 6 h� ph�i", "DUA TOP" , "nh�n")
	end
	gf_AddItemEx2({2,1,30912,2400,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
--	MeridianUpdateLevel()	
--	AwardGenuineQi(100000)
	
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 5 c�p 10")
	Say("Ch�c m�ng ��i hi�p �� l�nh ng� th�nh c�ng b� k�p gia truy�n T� Linh Ph�c Tinh! H�y ��ng nh�p l�i.",1,"Tho�t!/go_exit")

end

function vdth_get_award(nType)
	local tbCondition = {--level, xu , TCL, TMKL, C�u Thi�n VC�
							[1] = {690, 0,0, 0, 0, "chuy�n sinh 6 c�p 90"},
							[2] = {790, 0,0, 0, 0, "chuy�n sinh 7 c�p 90"},
							[3] = {791, 500,0, 0, 0,"chuy�n sinh 7 c�p 91"},
							[4] = {890, 0,0, 0, 0,"chuy�n sinh 8 c�p 90"},
							[5] = {893, 2000,0, 0, 0,"chuy�n sinh 8 c�p 93"},
							[6] = {990, 0,0, 0, 0,"chuy�n sinh 9 c�p 90"},
							[7] = {991, 0,0, 0, 0,"chuy�n sinh 9 c�p 91"},
							[8] = {992, 0,0, 0, 0,"chuy�n sinh 9 c�p 92"},
							[9] = {993, 0,0, 0, 0,"chuy�n sinh 9 c�p 93"},
							[10] = {1090, 0,8, 8, 0,"chuy�n sinh 10 c�p 90"},
							[11] = {1091, 0,5, 5, 0,"chuy�n sinh 10 c�p 91"},
							[12] = {1092, 0,0, 0, 0,"chuy�n sinh 10 c�p 92"},
							[13] = {1093, 0,0, 0, 0,"chuy�n sinh 10 c�p 93"},
							[14] = {1094, 0,0, 0, 0,"chuy�n sinh 10 c�p 94"},
						}
	if GetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),nType) == 1 then	--S� d�ng Bit 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
		Talk(1, "", "��i hi�p �� nh�n ph�n th��ng n�y r�i, n�n kh�ng th� nh�n th��ng ���c.")
		return 0
	end			
	local nRoute = GetPlayerRoute()
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	local nLevel = (nChuyenSinh + nPhucSinh)*100 + GetLevel()		
	local nChuyenPhucSinh = gf_GetTransLevel()  -- bao g�m chuy�n sinh v� ph�c sinh	
	if nChuyenPhucSinh < tbCondition[nType][1] then
		Talk(1, "", strNpcName.."C�c h� ch�a �� ��ng c�p "..tbCondition[nType][6].." n�n kh�ng th� nh�n th��ng.");
		return 0
	end
--	if nType == 10 then
--		if nChuyenPhucSinh >= 1010 then
--			Talk(1, "", strNpcName.."��ng c�p c�a c�c h� qu� cao n�n kh�ng th� nh�n th��ng.");
--			return 0
--		end
--	end
	if gf_Judge_Room_Weight(31,500)~=1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return
	end
	if GetItemCount(2,1,30230) < tbCondition[nType][2] then
		Talk(1,"","C�c h� kh�ng �� xu "..tbCondition[nType][2].." v�t ph�m nh�n th��ng.")
		return
	end
	if GetItemCount(2,95,204) < tbCondition[nType][3] then
		Talk(1,"","C�c h� kh�ng �� "..tbCondition[nType][3].." thi�n cang l�nh nh�n th��ng.")
		return
	end
	if GetItemCount(2,1,30370) < tbCondition[nType][4] then
		Talk(1,"","C�c h� kh�ng �� "..tbCondition[nType][4].." thi�n m�n kim l�nh nh�n th��ng.")
		return
	end
	if GetItemCount(2,1,1006) < tbCondition[nType][5] then
		Talk(1,"","C�c h� kh�ng �� "..tbCondition[nType][5].." C�u Thi�n V� C�c ��n �� nh�n th��ng.")
		return
	end
	if nType == 10 or nType == 11 then
		if DelItem(2,95,204,tbCondition[nType][3]) ~= 1 or DelItem(2,1,30370,tbCondition[nType][4]) ~= 1 then
			Talk(1, "", "��i hi�p kh�ng mang �� thi�n cang l�nh ho�c thi�n m�n kim l�nh.")
			return 0
		end
	end
	if nType == 3 or nType == 5 then
		if DelItem(2,1,30230,tbCondition[nType][2]) ~= 1 then
			Talk(1, "", "��i hi�p kh�ng mang �� xu v�t ph�m")
			return 0
		end
	end
	if nType ~= 2 and nType ~= 13 then
		SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),nType,1));		
	end
	
--========================
	if nType == 1 then
		AddItem(0,152,9,1)
		AddItem(0,153,9,1)
		AddItem(0,154,9,1)
		gf_AddItemEx2({2,1,30912,2000,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
		gf_AddItemEx2({2,1,31068,1},"Kh�c B�n V� C�p 1","DUA TOP","Kh�c B�n V� C�p")
		gf_AddItemEx2({2,1,31069,1},"Kh�c B�n V� C�p 1","DUA TOP","Kh�c B�n V� C�p")
		gf_AddItemEx2({2,1,31070,1},"Kh�c B�n V� C�p 1","DUA TOP","Kh�c B�n V� C�p")
		gf_AddItemEx2({2,1,31071,1},"Kh�c B�n V� C�p 1","DUA TOP","Kh�c B�n V� C�p")
		gf_AddItemEx2({2,1,31072,1},"Kh�c B�n V� C�p 1","DUA TOP","Kh�c B�n V� C�p")
		gf_AddItemEx2({0,102,8844, 1,4, -1, -1, -1, -1, -1, -1},"Huy Ho�ng Qu�t Kh�i","DUA TOP","Huy Ho�ng Qu�t Kh�i")	
		gf_AddItemEx2({0,102,8845, 1,4, -1, -1, -1, -1, -1, -1},"Vinh D� Qu�t Kh�i","DUA TOP","Vinh D� Qu�t Kh�i")	
		GiveJue() --y�u quy�t theo h� ph�i
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Chuy�n sinh 6 c�p 90")
	elseif nType == 2 then
		thangcapnhanthuong_692()
	elseif nType == 3 then
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,1001,1,4},"H�a Th� B�ch","DUA TOP","nh�n h�a th� b�ch",7*24*3600,1)
		gf_AddItemEx2({2,1,1009,5,4},"Thi�n Th�ch Tinh Th�ch","DUA TOP","nh�n Thi�n Th�ch Tinh Th�ch",7*24*3600,1)
		gf_AddItemEx2({2,1,30912,3000,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
		gf_AddItemEx2({2,1,30913,20,4},"��ng T� Chi Nguy�n","DUA TOP","��ng T� Chi Nguy�n")
		gf_AddItemEx2({2,1,30668,16,1},"U�n Linh 6","DUA TOP","U�n Linh 6")
		gf_AddItemEx2({2,1,30847,30,4},"H�i ti�n ��n","DUA TOP","H�i ti�n ��n")
		TraoMatTichCaoCap20(1,nRoute)
		for i=1,4 do	--�� qu� level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "�� qu� 3 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level4
			gf_AddItemEx2({2,22,i*100+4, 3}, "�� qu� 4 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level5
			gf_AddItemEx2({2,22,i*100+5, 1}, "�� qu� 5 h� ph�i", "DUA TOP" , "nh�n")
		end
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 2 c�p 91")
--		gf_AddItemEx2({0,112,158,1,1},"L�ng Ba Vi B� to�n t�p","DUA TOP","L�ng Ba Vi B� to�n t�p")		
--		gf_AddItemEx2({2,95,204,1,1},"Thi�n Cang L�nh","DUA TOP","nh�n Thi�n Cang L�nh")
--		gf_AddItemEx2({2,1,30370,1,1},"Thi�n M�n Kim L�nh","DUA TOP","nh�n Thi�n M�n Kim L�nh")
--		gf_AddItemEx2({2,1,30368,100,4},"C� Linh Th�ch","DUA TOP","nh�n C� Linh Th�ch")
--		gf_AddItemEx2({2,1,30369,100,4},"C� Linh Ng�c","DUA TOP","nh�n C� Linh Ng�c")
	elseif nType == 4 then
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,30814,1,4},"Ph�c Sinh ��n","DUA TOP","Ph�c Sinh ��n")
		gf_AddItemEx2({2,1,30912,3000,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
		gf_AddItemEx2({2,1,30913,150,4},"��ng T� Chi Nguy�n","DUA TOP","��ng T� Chi Nguy�n")
		gf_AddItemEx2({2,1,30668,16,1},"U�n Linh 6","DUA TOP","U�n Linh 6")		
		gf_AddItemEx2({2,1,30847,40,4},"H�i ti�n ��n","DUA TOP","H�i ti�n ��n")
		for i=1,4 do	--�� qu� level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "�� qu� 3 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level4
			gf_AddItemEx2({2,22,i*100+4, 3}, "�� qu� 4 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level5
			gf_AddItemEx2({2,22,i*100+5, 1}, "�� qu� 5 h� ph�i", "DUA TOP" , "nh�n")
		end

		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 3 c�p 90")
	elseif nType == 5 then
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,1113,1},"��i ��nh H�n","DUA TOP","nh�n ��i ��nh H�n",7*24*3600,1)
		gf_AddItemEx2({2,1,30814,1,4},"Ph�c Sinh ��n","DUA TOP","Ph�c Sinh ��n")
		gf_AddItemEx2({2,1,1001,1,4},"H�a Th� B�ch","DUA TOP","nh�n h�a th� b�ch",7*24*3600,1)
		gf_AddItemEx2({2,1,1009,5,4},"Thi�n Th�ch Tinh Th�ch","DUA TOP","nh�n Thi�n Th�ch Tinh Th�ch",7*24*3600,1)				
		gf_AddItemEx2({2,1,30368,100,4},"C� Linh Th�ch","DUA TOP","nh�n C� Linh Th�ch")
		gf_AddItemEx2({2,1,30369,100,4},"C� Linh Ng�c","DUA TOP","nh�n C� Linh Ng�c")
		gf_AddItemEx2({2,95,204,1,1},"Thi�n Cang L�nh","DUA TOP","nh�n Thi�n Cang L�nh")
		gf_AddItemEx2({2,1,30370,1,1},"Thi�n M�n Kim L�nh","DUA TOP","nh�n Thi�n M�n Kim L�nh")		
		gf_AddItemEx2({2,1,30970,1,4},"Tr�ng B� Ng�c","DUA TOP","Tr�ng B� Ng�c")
		TraoMatTichCaoCap20(1,nRoute)
		gf_AddItemEx2({2,1,30912,4000,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
		gf_AddItemEx2({2,1,30847,60,4},"H�i ti�n ��n","DUA TOP","H�i ti�n ��n")

		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 3 c�p 93")
	elseif nType == 6 then
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,30912,3000,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
		gf_AddItemEx2({2,1,30913,200,4},"��ng T� Chi Nguy�n","DUA TOP","��ng T� Chi Nguy�n")
		gf_AddItemEx2({2,1,30668,16,1},"U�n Linh 6","DUA TOP","U�n Linh 6")
		gf_AddItemEx2({2,1,30847,40,4},"H�i ti�n ��n","DUA TOP","H�i ti�n ��n")
		for i=1,4 do	--�� qu� level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "�� qu� 3 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level4
			gf_AddItemEx2({2,22,i*100+4, 3}, "�� qu� 4 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level5
			gf_AddItemEx2({2,22,i*100+5, 1}, "�� qu� 5 h� ph�i", "DUA TOP" , "nh�n")
		end
--		for i=1,4 do	--�� qu� level6
--			gf_AddItemEx2({2,22,i*100+6, 1}, "�� qu� 6 h� ph�i", "DUA TOP" , "nh�n")
--		end
		
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 4 c�p 90")
	elseif nType == 7 then
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,30912,3000,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
		gf_AddItemEx2({2,1,30913,300,4},"��ng T� Chi Nguy�n","DUA TOP","��ng T� Chi Nguy�n")
		gf_AddItemEx2({2,1,30814,1,4},"Ph�c Sinh ��n","DUA TOP","Ph�c Sinh ��n")
--		TraoMatTichCaoCap20(1,nRoute)
		gf_AddItemEx2({2,1,30847,40,4},"H�i ti�n ��n","DUA TOP","H�i ti�n ��n")
		
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 4 c�p 91")
	elseif nType == 8 then
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,30912,4000,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
		gf_AddItemEx2({2,1,30847,50,4},"H�i ti�n ��n","DUA TOP","H�i ti�n ��n")
		for i=1,4 do	--�� qu� level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "�� qu� 3 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level4
			gf_AddItemEx2({2,22,i*100+4, 4}, "�� qu� 4 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level5
			gf_AddItemEx2({2,22,i*100+5, 2}, "�� qu� 5 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level6
			gf_AddItemEx2({2,22,i*100+6, 1}, "�� qu� 6 h� ph�i", "DUA TOP" , "nh�n")
		end
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 4 c�p 92")
	
	elseif nType == 9 then
		gf_AddItemEx2({2,1,31168,1,4},"H�c B�ch K�","DUA TOP","H�c B�ch K�")
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 4 c�p 93")
	elseif nType == 10 then
		gf_AddItemEx2({2,1,31261,1,4},"Kh�c b�n c�p 3","DUA TOP","Kh�c b�n c�p 3")
		gf_AddItemEx2({2,1,31262,1,4},"Kh�c b�n c�p 3","DUA TOP","Kh�c b�n c�p 3")
		gf_AddItemEx2({2,1,31263,1,4},"Kh�c b�n c�p 3","DUA TOP","Kh�c b�n c�p 3")
		gf_AddItemEx2({2,1,31264,1,4},"Kh�c b�n c�p 3","DUA TOP","Kh�c b�n c�p 3")
		gf_AddItemEx2({2,1,31265,1,4},"Kh�c b�n c�p 3","DUA TOP","Kh�c b�n c�p 3")
			
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 5 c�p 90")
	elseif nType == 11 then
		gf_AddItemEx2({2,1,31307,1,4},"Chi�u Y�u K�","DUA TOP","Chi�u Y�u K�")
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 5 c�p 91")	
	elseif nType == 12 then
--		duatop_choose_amhuyet()
		for i=1,4 do	--�� qu� level3
			gf_AddItemEx2({2,22,i*100+3, 6}, "�� qu� 3 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level4
			gf_AddItemEx2({2,22,i*100+4, 6}, "�� qu� 4 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level5
			gf_AddItemEx2({2,22,i*100+5, 4}, "�� qu� 5 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level6
			gf_AddItemEx2({2,22,i*100+6, 1}, "�� qu� 6 h� ph�i", "DUA TOP" , "nh�n")
		end
		gf_AddItemEx2({2,1,30912,2400,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 5 c�p 92")	
	elseif nType == 13 then
		duatop_choose_VKamhuyet()
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 5 c�p 93")
	elseif nType == 14 then
		for i=1,4 do	--�� qu� level7
			gf_AddItemEx2({2,22,i*100+7, 2}, "�� qu� 7 h� ph�i", "DUA TOP" , "nh�n")
		end
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 5 c�p 94")	
	end
--========================
end
function thangcapnhanthuong_692()
	local tbSay = {}		
	tinsert(tbSay,"Ta mu�n nh�n trang b� Kim X� V�n Du/#thangcapnhanthuong_692_finish(1)")
	tinsert(tbSay,"Ta mu�n nh�n trang b� Kim X� Thi�t Huy�t/#thangcapnhanthuong_692_finish(2)")
	tinsert(tbSay,"Ta mu�n nh�n trang b� Kim X� Du Hi�p/#thangcapnhanthuong_692_finish(3)")
	tinsert(tbSay,"T�i ch� xem th�i/gf_DoNothing");
	Say(strNpcName.."C�c h� h�y l�a ch�n 1 trong 3 b� trang b� Kim X�: ",getn(tbSay),tbSay)
end
function thangcapnhanthuong_692_finish(nChoice)
	SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),2,1));	
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
	AwardGenuineQi(80000)
	gf_AddItemEx2({2,1,30368,100,4},"C� Linh Th�ch","DUA TOP","nh�n C� Linh Th�ch")	
	gf_AddItemEx2({2,1,1009,2,4},"Thi�n Th�ch Tinh Th�ch","DUA TOP","nh�n Thi�n Th�ch Tinh Th�ch",7*24*3600,1)		
	gf_AddItemEx2({2,1,30497,1000,1},"Ma Tinh","DUA TOP","Ma Tinh")
	gf_AddItemEx2({2,1,30912,2000,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")	
--		gf_AddItemEx2({2,1,30369,100,4},"C� Linh Ng�c","DUA TOP","nh�n C� Linh Ng�c")	
--		gf_AddItemEx2({2,1,30847,10,4},"H�i ti�n ��n","DUA TOP","H�i ti�n ��n")	
		for i=1,4 do	--�� qu� level1
			gf_AddItemEx2({2,22,i*100+1, 4}, "�� qu� 1 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level2
			gf_AddItemEx2({2,22,i*100+2, 4}, "�� qu� 2 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "�� qu� 3 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level4
			gf_AddItemEx2({2,22,i*100+4, 1}, "�� qu� 4 h� ph�i", "DUA TOP" , "nh�n")
		end
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 2 c�p 90")
end
function thangcapnhanthuong_797()
	receive_DieuDuong_Top1_faction_01(0,1)	--2 ng�c di�u d��ng 8%
	--M�t t�ch c�p 70
	local nRoute = GetPlayerRoute()
	TraoMatTichCaoCap20(1,nRoute)
	AwardGenuineQi(100000)
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 2 c�p 97")
end
function go_exit()
	ExitGame()
end
function get_fast_MinhGiao()
	local nRoute = GetPlayerRoute()
	if nRoute ~= 25 and nRoute ~= 26 and nRoute ~= 27 then
		Talk(1, "", strNpcName.."Ph�n th��ng n�y ch� d�nh cho c�c h� ph�i Minh Gi�o!");
		return 0
	end
	local nPhucSinh = GetPlayerRebornParam(0)
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + nPhucSinh
	if gf_CheckLevel(7,90) ~= 1 then
		Talk(1, "", strNpcName.."C�c h� ch�a ��t ph�c sinh 7 c�p �� 90, h�y c� g�ng th�m..");
		return 0
	end
	if GetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),11) == 1 then		--TSK_VANGDANHTHIENHA_DUATOP: s� d�ng bit 11
		Talk(1, "", strNpcName.."��i hi�p �� ��ng k� nh�n ph�n th��ng n�y r�i.")
		return 0
	end		
	LIB_txtData:Init("top3minhgiao.txt")
	LIB_txtData:LoadData()
	local nAward = LIB_txtData.tbTextData[1]

	if nAward >= 3 then
		Talk(1, "", strNpcName.."�� c� �� 3 cao th� Minh Gi�o ��ng k� nh�n ph�n th��ng n�y, c�c h� h�y c� g�ng chi�m ph�n th��ng kh�c nh�!");
		return 0
	end
	if LIB_txtData:AddValue(1,1,3) == 1 then
		SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),11,1));		
		Talk(1, "", strNpcName.." Ch�c m�ng ��i hi�p �� ��ng k� nh�n th��ng th�nh c�ng");
		gf_WriteLogEx("TOP 3 MINH GIAO CS7", "nh�n", 1, "��ng k� th�nh c�ng")
	end
end
function minhgiao_get_award_by_level()
	do return 0 end
	local nRoute = GetPlayerRoute()
	if nRoute ~= 31 and nRoute ~= 32 then
		Talk(1, "", strNpcName.."Ph�n th��ng n�y ch� d�nh cho c�c h� ph�i: C�n L�n Ki�m T�n v� ���ng M�n Nh�m Hi�p !!!!");
		return 0
	end
	local tSay = {}
	tinsert(tSay,"Ta mu�n nh�n th��ng Tr�ng Sinh 5 c�p 94/#minhgiao_get_award(1)")	--TSK_TT_VANGDANHTHIENHA_DUATOP: s� d�ng bit 1
	tinsert(tSay,"Ta mu�n nh�n th��ng Ph�c Sinh 6 c�p 94/#minhgiao_get_award(2)")	--TSK_TT_VANGDANHTHIENHA_DUATOP: s� d�ng bit 2
	tinsert(tSay,"Ta mu�n nh�n th��ng Ph�c Sinh 6 c�p 99/#minhgiao_get_award(3)")	--TSK_TT_VANGDANHTHIENHA_DUATOP: s� d�ng bit 3
	tinsert(tSay,"Ta mu�n nh�n th��ng Ph�c Sinh 7 c�p 94/#minhgiao_get_award(4)")	--TSK_TT_VANGDANHTHIENHA_DUATOP: s� d�ng bit 4
	tinsert(tSay,"Ta mu�n nh�n th��ng Ph�c Sinh 8 c�p 94/#minhgiao_get_award(5)")	--TSK_TT_VANGDANHTHIENHA_DUATOP: s� d�ng bit 5
	tinsert(tSay,"Ta bi�t r�i/dlgover")	
	local strSay = strNpcName.."Ho�t ��ng <color=yellow>Truy C�ng L�nh Th��ng<color> di�n ra t� ng�y<color=red> "..szStartDate.." ��n 24:00 "..szEndDate.."<color>. Trong th�i gian n�y, qu� ��ng ��o c� th� ��n g�p ta �� nh�n c�c ph�n th��ng h�p d�n. Th�ng tin chi ti�t qu� ��ng ��o vui l�ng xem t�i trang ch�."
	Say(strSay,getn(tSay),tSay)
end

function minhgiao_get_award(nType)
	do return 0 end
	local tbCondition = {--level
							[1] = {594, 0,},
							[2] = {694, 0,},
							[3] = {699, 0,},
							[4] = {794, 0,},
							[5] = {894, 0,}, 
						}
	local nRoute = GetPlayerRoute()
	if nRoute ~= 31 and nRoute ~= 32 then
		Talk(1, "", strNpcName.."Ph�n th��ng n�y ch� d�nh cho c�c h� ph�i Minh Gi�o!");
		return 0
	end						
	if GetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),nType) == 1 then	
		Talk(1, "", strNpcName.."��i hi�p �� nh�n ph�n th��ng n�y r�i, h�y c� g�ng l�n c�p �� nh�n ph�n th��ng ti�p theo.")
		return 0
	end			
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	local nLevel = (nChuyenSinh + nPhucSinh)*100 + GetLevel()	
	local nChuyenPhucSinh = gf_GetTransLevel()  -- bao g�m chuy�n sinh v� ph�c sinh	
	if nChuyenPhucSinh < tbCondition[nType][1] then
		Talk(1, "", strNpcName.."C�c h� ch�a �� ��ng c�p n�n kh�ng th� nh�n th��ng.");
		return 0
	end
	if gf_Judge_Room_Weight(10,500)~=1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return
	end
--	if GetItemCount(2,1,30230) < tbCondition[nType][2] then
--		Talk(1,"","C�c h� kh�ng �� xu v�t ph�m nh�n th��ng.")
--		return
--	end
--	DelItem(2,1,30230,tbCondition[nType][2])
	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),nType,1));		
	if nType == 1 then
		AwardGenuineQi(20000)
		GiveJue() --y�u quy�t theo h� ph�i
		TraoMatTichCaoCap20_loaithuong(1,nRoute)
--		gf_AddItemEx2({2,1,30499,20,4},"Hu�n ch��ng anh h�ng","DUA TOP","nh�n h�a th� b�ch")
--		gf_AddItemEx2({0,152,9,1,1,-1,-1,-1,-1,-1,-1,-1},"�o Cho�ng �m Ch� ng� h�nh","DUA TOP","nh�n �o cho�ng")
--		gf_AddItemEx2({0,153,9,1,1,-1,-1,-1,-1,-1,-1,-1},"Huy Ch��ng �m Ch� ng� h�nh","DUA TOP","nh�n huy ch��ng")
--		gf_AddItemEx2({0,154,9,1,1,-1,-1,-1,-1,-1,-1,-1},"Chi�n H�i �m Ch� ng� h�nh","DUA TOP","nh�n chi�n h�i")
		for i=1,4 do	--�� qu� level2
			gf_AddItemEx2({2,22,i*100+2, 4}, "�� qu� 2", "DUA TOP" , "nh�n")
		end
		gf_WriteLogEx("NHAN THUONG DUA TOP PHAI MOI"..szLOGSERVERNAME, "nh�n", 1, "Ph�n th��ng Tr�ng sinh 5 c�p 94")
	elseif nType == 2 then
--		for i=1,4 do	--�� qu� level2
--			gf_AddItemEx2({2,22,i*100+2, 5}, "�� qu� 2", "DUA TOP" , "nh�n")
--		end
		AwardGenuineQi(40000)
		gf_AddItemEx2({2,1,30368,100,4},"C� Linh Th�ch","DUA TOP","nh�n C� Linh Th�ch")
		gf_AddItemEx2({2,1,30369,100,4},"C� Linh Ng�c","DUA TOP","nh�n C� Linh Ng�c")
		gf_AddItemEx2({2,1,30912,2000,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","nh�n Thi�n Cang L�nh")
		gf_AddItemEx2({2,1,30913,50,4},"��ng T� Chi Nguy�n","DUA TOP","Th�i D�ch")
		for i=1,4 do	--�� qu� level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "�� qu� 3", "DUA TOP" , "nh�n")
		end
		gf_WriteLogEx("NHAN THUONG DUA TOP PHAI MOI"..szLOGSERVERNAME, "nh�n", 1, "Ph�n th��ng Ph�c sinh 1 c�p 94")
	elseif nType == 3 then
		AwardGenuineQi(60000)
		gf_AddItemEx2({2,1,30368,200,4},"C� Linh Th�ch","DUA TOP","nh�n C� Linh Th�ch")
		gf_AddItemEx2({2,1,30369,200,4},"C� Linh Ng�c","DUA TOP","nh�n C� Linh Ng�c")
		gf_AddItemEx2({2,95,204,1,4},"Thi�n Cang L�nh","DUA TOP","nh�n Thi�n Cang L�nh")
		gf_AddItemEx2({2,1,30668,16,1},"U�n Linh 6","DUA TOP","U�n Linh 6")
		gf_WriteLogEx("NHAN THUONG DUA TOP PHAI MOI"..szLOGSERVERNAME, "nh�n", 1, "Ph�n th��ng Ph�c sinh 1 c�p 99")
	elseif nType == 4 then
		gf_AddItemEx2({2,0,1083,2,4},"Th�i D�ch H�n Nguy�n","DUA TOP","Th�i D�ch")
--		get_award_daquy345(3)	
		gf_AddItemEx2({2,1,30370,1,4},"Thi�n M�n Kim L�nh","DUA TOP","nh�n Thi�n M�n Kim L�nh")		
		for i=1,4 do	--�� qu� level4
			gf_AddItemEx2({2,22,i*100+4, 4}, "�� qu� 4", "DUA TOP" , "nh�n")
		end
		gf_WriteLogEx("NHAN THUONG DUA TOP PHAI MOI"..szLOGSERVERNAME, "nh�n", 1, "Ph�n th��ng Ph�c sinh 2 c�p 94")
	elseif nType == 5 then
--		AwardGenuineQi(100000)
		TraoMatTichCaoCap20(1,nRoute)
		gf_AddItemEx2({2,1,30847,30,4},"H�i ti�n ��n","DUA TOP","H�i ti�n ��n")
		gf_AddItemEx2({2,1,30814,1,4},"Ph�c Sinh ��n","DUA TOP","Ph�c Sinh ��n")
		gf_AddItemEx2({2,1,30970,1,4},"Tr�ng B� Ng�c","DUA TOP","Ph�c Sinh ��n")
		gf_WriteLogEx("NHAN THUONG DUA TOP PHAI MOI"..szLOGSERVERNAME, "nh�n", 1, "Ph�n th��ng Ph�c sinh 3 c�p 94")
	end
end
function duatop_choose_kimxa5(nType)
	
	local tSay = {}
	if nType == 2 then
		tinsert(tSay,"Hi�p C�t Phi Phong/#finish_duatop_choose_kimxa5(1,"..nType..")");
		tinsert(tSay,"Qu� Ph� Phi Phong/#finish_duatop_choose_kimxa5(2,"..nType..")");
		tinsert(tSay,"��ng V�n Phi Phong/#finish_duatop_choose_kimxa5(3,"..nType..")");
	end
	if nType == 3 then
		tinsert(tSay,"Hi�p C�t Ch��ng/#finish_duatop_choose_kimxa5(4,"..nType..")");
		tinsert(tSay,"Qu� Ph� Ch��ng/#finish_duatop_choose_kimxa5(5,"..nType..")");
		tinsert(tSay,"��ng V�n Ch��ng/#finish_duatop_choose_kimxa5(6,"..nType..")");
	end
	if nType == 4 then
		tinsert(tSay,"Hi�p C�t Ngoa/#finish_duatop_choose_kimxa5(7,"..nType..")");
		tinsert(tSay,"Qu� Ph� Ngoa/#finish_duatop_choose_kimxa5(8,"..nType..")");
		tinsert(tSay,"��ng V�n Ngoa/#finish_duatop_choose_kimxa5(9,"..nType..")");
	end
	tinsert(tSay,"T�i ch� xem xem th�i/gf_DoNothing");
	
	Say("��i hi�p h�y ch�n 1 trang b� Kim X� 5: ", getn(tSay), tSay);
end
function finish_duatop_choose_kimxa5(nTypeKX, nTypeAward)
	local nRoute = GetPlayerRoute();
	local tbKimXa5 = {
				[1] ={{0,152,29,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "Hi�p C�t Phi Phong"},	
				[2] ={{0,152,30,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "Qu� Ph� Phi Phong"},
				[3] ={{0,152,31,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "��ng V�n Phi Phong"},					
				[4] ={{0,153,29,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "Hi�p C�t Ch��ng"},	
				[5] ={{0,153,30,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "Qu� Ph� Ch��ng"},	
				[6] ={{0,153,31,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "��ng V�n Ch��ng"},			
				[7] ={{0,154,29,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "Hi�p C�t Ngoa"},					
				[8] ={{0,154,30,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "Qu� Ph� Ngoa"},							
				[9] ={{0,154,31,1,4,-1,-1,-1,-1,-1,-1,-1,9}, "��ng V�n Ngoa"},		
			}

	if nTypeAward == 2 then
--		if DelItem(2,1,30230,2000) ~= 1 then
--			Talk(1, "", "��i hi�p kh�ng mang �� xu v�t ph�m")
--			return 0
--		end
		SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),2,1));	
		
		gf_AddItemEx2(tbKimXa5[nTypeKX][1], tbKimXa5[nTypeKX][2], "DUA TOP", "�o kim x� 5")
		Msg2Player("B�n nh�n ���c v�t ph�m Kim X� 5 "..tbKimXa5[nTypeKX][2])
	
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,1009,2,4},"Thi�n Th�ch Tinh Th�ch","DUA TOP","nh�n Thi�n Th�ch Tinh Th�ch",7*24*3600,1)
		gf_AddItemEx2({2,1,1001,1,4},"H�a Th� B�ch","DUA TOP","nh�n h�a th� b�ch",7*24*3600,1)
		gf_AddItemEx2({2,1,30912,2000,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
		gf_AddItemEx2({2,1,30913,20,4},"��ng T� Chi Nguy�n","DUA TOP","��ng T� Chi Nguy�n")
		gf_AddItemEx2({2,1,30668,16,1},"U�n Linh 6","DUA TOP","U�n Linh 6")
		gf_AddItemEx2({2,1,30847,20,4},"H�i ti�n ��n","DUA TOP","H�i ti�n ��n")	
		for i=1,4 do	--�� qu� level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "�� qu� 3 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level4
			gf_AddItemEx2({2,22,i*100+4, 3}, "�� qu� 4 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level5
			gf_AddItemEx2({2,22,i*100+5, 1}, "�� qu� 5 h� ph�i", "DUA TOP" , "nh�n")
		end

		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 2 c�p 90")
	end
	if nTypeAward == 3 then		
		SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),3,1));
		
		gf_AddItemEx2(tbKimXa5[nTypeKX][1], tbKimXa5[nTypeKX][2], "DUA TOP", "ch��ng kim x� 5")
		Msg2Player("B�n nh�n ���c v�t ph�m Kim X� 5 "..tbKimXa5[nTypeKX][2])
		
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,30814,1,4},"Ph�c Sinh ��n","DUA TOP","Ph�c Sinh ��n")
		gf_AddItemEx2({2,1,30912,2000,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
		gf_AddItemEx2({2,1,30913,150,4},"��ng T� Chi Nguy�n","DUA TOP","��ng T� Chi Nguy�n")
		gf_AddItemEx2({2,1,30668,16,1},"U�n Linh 6","DUA TOP","U�n Linh 6")
		gf_AddItemEx2({2,1,30847,40,4},"H�i ti�n ��n","DUA TOP","H�i ti�n ��n")	
		for i=1,4 do	--�� qu� level3
			gf_AddItemEx2({2,22,i*100+3, 4}, "�� qu� 3 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level4
			gf_AddItemEx2({2,22,i*100+4, 3}, "�� qu� 4 h� ph�i", "DUA TOP" , "nh�n")
		end
		for i=1,4 do	--�� qu� level5
			gf_AddItemEx2({2,22,i*100+5, 1}, "�� qu� 5 h� ph�i", "DUA TOP" , "nh�n")
		end

		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 2 c�p 92")
	end
	if nTypeAward == 4 then
		if DelItem(2,1,30230,2000) ~= 1 then
			Talk(1, "", "��i hi�p kh�ng mang �� xu v�t ph�m")
			return 0
		end
		local nRoute = GetPlayerRoute()
		SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),4,1));
		
		gf_AddItemEx2(tbKimXa5[nTypeKX][1], tbKimXa5[nTypeKX][2], "DUA TOP", "ngoa kim x� 5")
		Msg2Player("B�n nh�n ���c v�t ph�m Kim X� 5 "..tbKimXa5[nTypeKX][2])
		
		AwardGenuineQi(100000)
		gf_AddItemEx2({2,1,1113,1,1},"��i ��nh H�n","DUA TOP","��i ��nh H�n",7*24*3600,1)
		gf_AddItemEx2({2,1,30814,1,4},"Ph�c Sinh ��n","DUA TOP","Ph�c Sinh ��n")
		gf_AddItemEx2({2,1,30368,100,4},"C� Linh Th�ch","DUA TOP","nh�n C� Linh Th�ch")
		gf_AddItemEx2({2,1,30369,100,4},"C� Linh Ng�c","DUA TOP","nh�n C� Linh Ng�c")	
		gf_AddItemEx2({2,1,1009,5,4},"Thi�n Th�ch Tinh Th�ch","DUA TOP","nh�n Thi�n Th�ch Tinh Th�ch",7*24*3600,1)
		gf_AddItemEx2({2,95,204,1,1},"Thi�n Cang L�nh","DUA TOP","nh�n Thi�n Cang L�nh")	
		gf_AddItemEx2({2,1,30370,1,1},"Thi�n M�n Kim L�nh","DUA TOP","nh�n Thi�n M�n Kim L�nh")	
		gf_AddItemEx2({2,1,1001,1,4},"H�a Th� B�ch","DUA TOP","nh�n H�a Th� B�ch",7*24*3600,1)
		gf_AddItemEx2({2,1,30970,1,1},"Tr�ng B� Ng�c","DUA TOP","Ph�c Sinh ��n")
		--M�t t�ch c�p 70
		TraoMatTichCaoCap20(1,nRoute)
		gf_AddItemEx2({2,1,30912,2000,4},"Hi�p Ngh�a Chi Ch�ng","DUA TOP","Hi�p Ngh�a Chi Ch�ng")
		gf_AddItemEx2({2,1,30847,60,4},"H�i ti�n ��n","DUA TOP","H�i ti�n ��n")

		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 2 c�p 95")
	end
end
function duatop_choose_amhuyet()
	local tSay = {}
	tinsert(tSay,"N�n �m Huy�t/#finish_duatop_choose_amhuyet(1)");
	tinsert(tSay,"�o �m Huy�t/#finish_duatop_choose_amhuyet(2)");
	tinsert(tSay,"Qu�n �m Huy�t/#finish_duatop_choose_amhuyet(3)");

	tinsert(tSay,"T�i ch� xem th�i/gf_DoNothing");
	
	Say("��i hi�p h�y ch�n 1 trang b� �m Huy�t: ", getn(tSay), tSay);
end		
function finish_duatop_choose_amhuyet(nType)				
	local tbamHuyet = {
				[1] ={{0,103,30610,1,4}, "N�n �m Huy�t"},	
				[2] ={{0,100,30610,1,4}, "�o �m Huy�t"},
				[3] ={{0,101,30610,1,4}, "Qu�n �m Huy�t"},
			}
	SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),12,1));	

	gf_AddItemEx2(tbamHuyet[nType][1], tbamHuyet[nType][2], "DUA TOP", "trang b� �m huy�t")
	Msg2Player("B�n nh�n ���c v�t ph�m "..tbamHuyet[nType][2])	
	gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 5 c�p 92")
end
function duatop_choose_VKamhuyet()
	local tVuKhi = {
				[2] = {0,3,30884, 1,4},
				[3] = {0,8,30885, 1,4},
				[4] = {0,0,30886, 1,4},
				[6] = {0,1,30887, 1,4},
				[8] = {0,2,30888, 1,4},
				[9] = {0,10,30889, 1,4},
				[11] = {0,0,30890, 1,4},
				[12] = {0,5,30891, 1,4},
				[14] = {0,2,30892, 1,4},
				[15] = {0,9,30893, 1,4},
				[17] = {0,6,30894, 1,4},
				[18] = {0,4,30895, 1,4},
				[20] = {0,7,30896, 1,4},
				[21] = {0,11,30897, 1,4},
				[23] = {0,2,30898, 1,4},
				[25] = {0,3,30899, 1,4},
				[26] = {0,9,30900, 1,4},
				[27] = {0,11,30901, 1,4},
				[29] = {0,13,30902, 1,4},
				[30] = {0,12,30903, 1,4},
				[31] = {0,14,32164, 1,4},
				[32] = {0,2,32192, 1,4},
			}
		local nRoute = GetPlayerRoute()
		SetTask(TSK_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_VANGDANHTHIENHA_DUATOP),13,1));	
		gf_AddItemEx2(tVuKhi[nRoute], "VK �m huy�t", "NHAN THUONG DUA TOP", "nh�n vk �m huy�t th�nh c�ng");	
		Msg2Player("B�n nh�n ���c v�t ph�m V� Kh� �m Huy�t")	
		gf_WriteLogEx("NHAN THUONG DUA TOP "..szLOGSERVERNAME, "nh�n", 1, "vdth Ph�n th��ng Ph�c sinh 5 c�p 93")
end
Include("\\script\\online_activites\\reborn\\tongban\\head.lua");
Include("\\script\\online\\abluemoon\\item\\moon_furnace.lua")
Include("\\script\\online_activites\\2010_11\\activity_02\\head.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua")
Import("\\script\\meridian\\meridian_script_api.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\quyty_box\\quyty2013_box_npc.lua")
Include("\\script\\vng\\taixuatgiangho.lua")
Include("\\script\\missions\\siling_trial\\slt_npc.lua")
Include("\\script\\item\\item_phucsinhdon.lua")
Include("\\script\\online\\viet_event\\200911\\6\\npc_bachtiensinh.lua")
Import("\\script\\ksgvn\\lib.lua")

szLogTitle = "Ban Dong Hanh"

_g_tbSupportRebornConfig = {
	[1] = {
		tbCondition = {
			nBigLevel = 1096,
			tbItems = {
				{ tbProp = { 2, 95, 204 }, nCount = 10 }, -- Thi�n Cang L�nh
				{ tbProp = { 2, 1, 30370 }, nCount = 10 }, -- Thi�n M�n Kim L�nh
				{ tbProp = { 2, 1, 30814 }, nCount = 1 }, -- Ph�c Sinh ��n
			}
		},
		nRequireLevel = 1096
	},
	[2] = {
		tbCondition = {
			nBigLevel = 1097,
			tbItems = {
				{ tbProp = { 2, 95, 204 }, nCount = 20 }, -- Thi�n Cang L�nh
				{ tbProp = { 2, 1, 30370 }, nCount = 20 }, -- Thi�n M�n Kim L�nh
				{ tbProp = { 2, 1, 30814 }, nCount = 2 }, -- Ph�c Sinh ��n
				{ tbProp = { 2, 1, 31239 }, nCount = 10 }, -- Linh Ph�ch ��n
			}
		},
		nRequireLevel = 1097
	},
	[3] = {
		tbCondition = {
			nBigLevel = 1098,
			tbItems = {
				{ tbProp = { 2, 95, 204 }, nCount = 30 }, -- Thi�n Cang L�nh
				{ tbProp = { 2, 1, 30370 }, nCount = 30 }, -- Thi�n M�n Kim L�nh
				{ tbProp = { 2, 1, 30814 }, nCount = 3 }, -- Ph�c Sinh ��n
				{ tbProp = { 2, 1, 31239 }, nCount = 30 }, -- Linh Ph�ch ��n
			}
		},
		nRequireLevel = 1098
	},
}

function _FastLevelUp(nIdx)
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	if not _g_tbSupportRebornConfig[nIdx] then
		return KsgNpc:Talk(szNpcName .. "Ta kh�ng th� gi�p g� ���c ��i hi�p.")
	end
	local tbCfg = _g_tbSupportRebornConfig[nIdx]
	if KsgPlayer:GetBigLevel() > tbCfg.nRequireLevel then
		return KsgNpc:Talk(szNpcName .. "��i hi�p �� ��t ��n c�p �� mong mu�n, kh�ng c�n t�ng c�p n�a.")
	end
	if KsgLib:PayMaterial(tbCfg.tbCondition) then
		AddLevelUp(1)
		Msg2Player("Th�ng c�p th�nh c�ng!")
		PlaySound("\\sound\\sound_i016.wav")
	end
end

function main()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Tr�n th� gian c� v� s� �i�u k� b�, ta �� t�ng �i qua r�t nhi�u n�i n�n c� am hi�u v� m�t s� k� thu�t, c�c h� c� mu�n th� gi�o kh�ng?"
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + GetPlayerRebornParam(0)
	local nDate = tonumber(date("%Y%m%d"))
	local nIsPS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10)
	for nIdx, tbCfg in _g_tbSupportRebornConfig do
		if KsgPlayer:GetBigLevel() == tbCfg.nRequireLevel then
			tinsert(tSay, format("T�ng c�p %s/#_FastLevelUp(%d)", KsgLib:Level2String(tbCfg.nRequireLevel + 1), nIdx))
		end
	end
	if nDate >= 20140221 and nDate <= 20140320 then
		tinsert(tSay, "T�i xu�t giang h�/TaiXuatGiangHo_Menu")
	end
--	tinsert(tSay,"Ta mu�n t�y to�n b� huy�t ��o ch�n kh�/vng_restore_Meridian");	
	if nDate >= 20140213 and nDate <= 20140220 then
		if  gf_GetTaskBit(TSK_XOA_KHUATNGUYENBOI,1) == 1 and gf_GetTaskBit(TSK_XOA_KHUATNGUYENBOI,2) == 0 and nChuyenSinh >= 5 then
			tinsert(tSay, "Nh�n Khu�t Nguy�n B�i mi�n ph�/NhanKhuatNguyenBoi_Free")
		end
	end
	if nDate >= 20140124 and nDate <= 20140203 then
		tinsert(tSay, "Nh�n th��ng M� ��o Th�nh C�ng/giapngo")
	end
	if GetItemCount(2,1,30862) > 0 and GetPlayerRebornParam(0) == 2 then	
		tinsert(tSay, "Ho�n th�nh Ph�c Sinh 3/finish_reborn3")
	end
	if GetItemCount(2,1,31117) > 0 and GetPlayerRebornParam(0) == 3 then	
		tinsert(tSay, "Ho�n th�nh Ph�c Sinh 4/finish_reborn4")
	end
	if GetItemCount(2,0,31010) > 0 and GetPlayerRebornParam(0) == 4 then	
		tinsert(tSay, "Ho�n th�nh Ph�c Sinh 5/finish_reborn5")
	end
	tinsert(tSay, "Ph�c Sinh B�n ��ng H�nh L�n 2/lan2_pet_phucsinh")
	tinsert(tSay, "Ph�c Sinh B�n ��ng H�nh/pet_phucsinh")
	tinsert(tSay, "Th� Luy�n B�n ��ng H�nh/main_slt")
	tinsert(tSay, "Ta mu�n k�ch ho�t kinh m�ch V� T�n - V� Ho�ng/_vng_UpdateKinhMach")
	tinsert(tSay, "S� d�ng Chuy�n Sinh ��n/use_chuyensinhdon")
	tinsert(tSay, "Ta mu�n s� d�ng ph�c sinh ��n/use_phucsinhdon")	
	if nIsPS >= 1 then
--		tinsert(tSay, "Nh�n nu�i th�m B�n ��ng H�nh (ti�u hao 150 xu v�t ph�m)/#get_more_pet(1)")
--		tinsert(tSay, "Nh�n nu�i th�m B�n ��ng H�nh (ti�u hao 490 v�ng)/#get_more_pet(2)")
	end
	tinsert(tSay, "Ta mu�n thay ��i h��ng chuy�n sinh/change_chuyensinh")
	if nDate >= 20130301 and nDate <= 20130317 then
		tinsert(tSay, "Ta mu�n ��i c�c lo�i nguy�n li�u l�y kinh nghi�m/exchange_to_exp")
	end
	if GetTask(TSK_CS6_TULINH) < 1 then
		tinsert(tSay, "Ta mu�n c� b� k�p Ph�c Sinh �� ��t c�nh gi�i cao h�n trong �� Th�ng Kinh M�ch/cs6_infor")		
	elseif GetTask(TSK_CS6_TULINH) >= 1 then
		tinsert(tSay, "Ta mu�n h�c b� k�p Ph�c Sinh �� ��t c�nh gi�i cao h�n trong �� Th�ng Kinh M�ch/cs6_npc1_infor2")			
	end
--	tinsert(tSay, "Ta mu�n ��i �i�m ch�n kh� (1 �i�m ch�n kh� ti�u hao 2.000.000 �i�m kinh nghi�m)/exchange_chankhi")
--	tinsert(tSay, "Ta mu�n ��i 1 �i�m ch�n kh� (ti�u hao 10 v�ng)/#exchange_chankhi_bygold(1)")	
--	tinsert(tSay, "Ta mu�n ��i 10 �i�m ch�n kh� (ti�u hao 100 v�ng)/#exchange_chankhi_bygold(2)")	
--	tinsert(tSay, "Nh�n h� tr� ho�n th�nh nhi�m v� �� Th�ng Kinh M�ch (ti�u hao 10 Xu v�t ph�m)/get_item_kinhmach")	

--	tinsert(tSay, "Ta c� �t ��c s�n, nh� ti�n b�i gi�p luy�n ch�n kh�/GetQiByFruit")
--	tinsert(tSay, "Ta c� �t c�a c�i, nh� ti�n b�i gi�p luy�n ch�n kh�/GetQiByGold")
	
	tinsert(tSay, "Ta mu�n luy�n B�c ��u Ng� Linh Th�n Thu�t (B�n ��ng H�nh)/learn_subskill_1")
--	tinsert(tSay, "Ta mu�n luy�n B�c ��u Gi� Kim Thu�t/learn_subskill_2")
	tinsert(tSay, "Ta mu�n luy�n B�c ��u Ph�c Nguy�n Thu�t/learn_subskill_3")
	tinsert(tSay, "Nh�n v�t ph�m h� tr� l�m nhi�m v� T� Linh Di�t Ph�p Tr�n (ti�u hao 10 Xu v�t ph�m)/get_item_tulinh")	
--	tinsert(tSay, "Ta mu�n luy�n B�c ��u Truy�n C�ng Thu�t/transfer_neili")
--	tinsert(tSay, "Ta mu�n luy�n B�c ��u D��ng Sinh Thu�t/pratice_neili")
	
	tinsert(tSay, "T�m th�i ta ch�a mu�n luy�n/do_nothing")
	Say(tHeader, getn(tSay), tSay)
end
function pet_phucsinh()
	local nIsPS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10)
	if nIsPS >= 1 then
		Talk(1,"", "B�n ��ng H�nh c�a ��i hi�p �� th�c hi�n Ph�c Sinh r�i !!!!")
		return 0
	end
	local nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."B�n ��ng h�nh sau khi ���c Ph�c Sinh r�t m�nh m�, c�c h� c� mu�n th�c hi�n Ph�c Sinh cho B�n ��ng h�nh kh�ng?"

	if nGetQuest == 0 then
		tinsert(tSay, "Nh�n nhi�m v� Ph�c Sinh cho B�n ��ng H�nh/get_quest_PhucSinh_BDH")
	end
	if nGetQuest == 1 then
		tHeader = szNpcName.." <color=red>Ho�n th�nh Giai �o�n 1 c�n : <color>k�ch ho�t 160 c�y t� linh, 160 b�t nh� nh�, 30 l�n C�ng T�, 30 l�n Tr� An, 30 l�n Th�y L�i, 30 l�n Luy�n ��n"
		tinsert(tSay, "Ho�n th�nh giai �o�n 1 Ph�c Sinh cho B�n ��ng H�nh/finish_quest1_PhucSinh_BDH")
		tinsert(tSay, "Xem s� l��ng nhi�m v� �� ho�n th�nh/show_quest1_PhucSinh_BDH")
		tinsert(tSay, "H� tr� ho�n th�nh nhanh 2 giai �o�n nhi�m v� Ph�c Sinh/support_finish_quest_PhucSinh_BDH")
	end
	if nGetQuest == 2 then
		tHeader = szNpcName.." <color=red>Ho�n th�nh Giai �o�n 2 c�n : <color>B�H c�p 4 (999 �i�m linh l�c), 500 thi�n th�ch, 500 m�nh thi�n th�ch, 20 thi�n th�ch tinh th�ch, 20 b�ng th�ch, 2 ho�ng kim ��i ng�n phi�u, 2 h�a th� b�ch"
		tinsert(tSay, "Ho�n th�nh giai �o�n 2 Ph�c Sinh cho B�n ��ng H�nh/finish_quest2_PhucSinh_BDH")
		tinsert(tSay, "H� tr� ho�n th�nh nhanh 2 giai �o�n nhi�m v� Ph�c Sinh/support_finish_quest_PhucSinh_BDH")
	end	
	
	
	tinsert(tSay, "Ta ch� gh� qua th�i/do_nothing")
	Say(tHeader, getn(tSay), tSay)
end
function change_chuyensinh()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."T�i h� c� th� gi�p ��i hi�p thay ��i h��ng chuy�n sinh hi�n t�i th�nh h��ng chuy�n sinh kh�c."
	local nDate = tonumber(date("%Y%m%d"))
	
	tinsert(tSay, "Thay ��i h��ng Ph�c Sinh 5/#way_change_chuyensinh(2)")
	tinsert(tSay, "Thay ��i h��ng Ph�c Sinh 4/#way_change_chuyensinh(2)")
	tinsert(tSay, "Thay ��i h��ng Ph�c Sinh 1, 2, 3/#way_change_chuyensinh(2)")
	tinsert(tSay, "Thay ��i h��ng Chuy�n Sinh (�p d�ng cho chuy�n sinh t� 1 ��n 5)/#way_change_chuyensinh(1)")
	
--	if nDate >= 20130521 and nDate <= 20130607 then
--		tinsert(tSay, "Mi�n ph� 1 l�n chuy�n sinh theo h��ng �ng T� (�p d�ng chuy�n sinh 1,2,3,4,5)/#way_change_chuyensinh(3)")
--		tinsert(tSay, "Mi�n ph� 1 l�n chuy�n sinh theo h��ng Ph�ng T� (�p d�ng cho chuy�n sinh 1,2,3,4,5)/#way_change_chuyensinh(4)")		
--	end
	tinsert(tSay, "T�m th�i ta ch�a mu�n thay ��i/do_nothing")
	Say(tHeader, getn(tSay), tSay)
end
function way_change_chuyensinh(nType)
	local nNum_cs6 = GetPlayerRebornParam(0)
	if nNum_cs6 > 5 then
--		Talk(1, "", "Ph�c Sinh 4 t�m th�i ch�a th� chuy�n h��ng ���c.")
		return 0
	end
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."��i hi�p mu�n thay ��i Chuy�n Sinh theo h��ng n�o ????."
	if nType == 1 then
		tinsert(tSay, "H��ng Long T�/#confirm_change_chuyensinh("..nType..", 1)")
		tinsert(tSay, "H��ng H� T�/#confirm_change_chuyensinh("..nType..", 2)")
		tinsert(tSay, "H��ng �ng T�/#confirm_change_chuyensinh("..nType..", 3)")
		tinsert(tSay, "H��ng Ph�ng T�/#confirm_change_chuyensinh("..nType..", 4)")
		tinsert(tSay, "T�m th�i ta ch�a mu�n thay ��i/do_nothing")
		Say(tHeader, getn(tSay), tSay)		
	elseif nType == 2 then
		tHeader = szNpcName.."��i hi�p mu�n thay ��i theo h��ng n�o. ��i v�i Ph�c Sinh, sau khi thay ��i s� b� v� level 10, h�y ��n g�p B�ch Ti�n Sinh (Tuy�n Ch�u) �� nh�n l�i level !!!!."		
		tinsert(tSay, "H��ng Long T�/#confirm_change_chuyensinh("..nType..", 1)")
		tinsert(tSay, "H��ng H� T�/#confirm_change_chuyensinh("..nType..", 2)")
		tinsert(tSay, "H��ng �ng T�/#confirm_change_chuyensinh("..nType..", 3)")		
		tinsert(tSay, "H��ng Ph�ng T�/#confirm_change_chuyensinh("..nType..", 4)")
		tinsert(tSay, "T�m th�i ta ch�a mu�n thay ��i/do_nothing")
		Say(tHeader, getn(tSay), tSay)			
--	elseif nType == 3 then
--		if GetTask(TSK_SUPPORT_CHUYENSINH) == 1 then
--			Talk(1,"", "Ta �� gi�p ��i hi�p chuy�n sinh mi�n ph� 1 l�n r�i!!!!")		
--			return 0
--		end
--		if nNum_cs6 >= 1 then
--			Talk(1,"", "��i hi�p �� ho�n th�nh Ph�c Sinh r�i n�n kh�ng th� th�c hi�n Chuy�n Sinh ���c n�a!!!!")		
--			return 0
--		end
--		if GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_FACTION) ~= 3 and GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_FACTION) ~= 4 then
--			Talk(1,"", "Ta ch� c� th� gi�p cho nh�n v�t chuy�n sinh theo h��ng Ph�ng T� v� �ng T�!!!!")		
--			return 0		
--		end
--		SetTask(TSK_SUPPORT_CHUYENSINH,1)
--		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, 3)	
--		 ModifyReputation(3000,0)
--		 SetTask(336,GetTask(336) + 4000)
--		Talk(1,"", "Ch�c m�ng ��i hi�p �� thay ��i h��ng Chuy�n Sinh th�nh c�ng, h�y ��n g�p B�ch Ti�n Sinh �� nh�n l�i trang b� Chuy�n Sinh m�i !!!!")		
--		Msg2Player("Ch�c m�ng ��i hi�p �� thay ��i h��ng Chuy�n Sinh th�nh c�ng, h�y ��n g�p B�ch Ti�n Sinh �� nh�n l�i trang b� Chuy�n Sinh m�i !!!!")
--		gf_WriteLogEx("THAY DOI HUONG CHUYEN SINH", "thay ��i th�nh c�ng", 1, "Chuy�n Sinh mi�n ph� th�nh �ng T�")	
--	elseif nType == 4 then
--		if GetTask(TSK_SUPPORT_CHUYENSINH) == 1 then
--			Talk(1,"", "Ta �� gi�p ��i hi�p chuy�n sinh mi�n ph� 1 l�n r�i!!!!")		
--			return 0
--		end
--		if nNum_cs6 >= 1 then
--			Talk(1,"", "��i hi�p �� ho�n th�nh Ph�c Sinh r�i n�n kh�ng th� th�c hi�n Chuy�n Sinh ���c n�a!!!!")		
--			return 0
--		end	
--		if GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_FACTION) ~= 3 and GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_FACTION) ~= 4 then
--			Talk(1,"", "Ta ch� c� th� gi�p cho nh�n v�t chuy�n sinh theo h��ng Ph�ng T� v� �ng T�!!!!")		
--			return 0		
--		end	
--		SetTask(TSK_SUPPORT_CHUYENSINH,1)
--		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, 4)	
--		ModifyReputation(3000,0)
--		SetTask(336,GetTask(336) + 4000)
--		Talk(1,"", "Ch�c m�ng ��i hi�p �� thay ��i h��ng Chuy�n Sinh th�nh c�ng, h�y ��n g�p B�ch Ti�n Sinh �� nh�n l�i trang b� Chuy�n Sinh m�i !!!!")		
--		Msg2Player("Ch�c m�ng ��i hi�p �� thay ��i h��ng Chuy�n Sinh th�nh c�ng, h�y ��n g�p B�ch Ti�n Sinh �� nh�n l�i trang b� Chuy�n Sinh m�i !!!!")
--		gf_WriteLogEx("THAY DOI HUONG CHUYEN SINH", "thay ��i th�nh c�ng", 1, "Chuy�n Sinh mi�n ph� th�nh Ph�ng T�")	
	end
end
function confirm_change_chuyensinh(nType, nWay)
	local nNum_cs6 = GetPlayerRebornParam(0)
	if nNum_cs6 > 5 then
--		Talk(1, "", "Ph�c Sinh 4 t�m th�i ch�a th� chuy�n h��ng ���c.")
		return 0
	end
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng��i ch�i c�n s�ng m�i ���c chuy�n sinh")
		return
	end	
	if nType <= 0 or nWay <= 0 then
		Talk(1,"","��i hi�p kh�ng �� �i�u ki�n �� thay ��i h��ng Chuy�n Sinh")
		return
	end
	local nCheck = check_change_chuyensinh(nType)
	if nCheck ~= 1 then
		Msg2Player("B�n kh�ng �� �i�u ki�n")
		return 0
	end
	if nType == 1 then
		if GetTranslifeCount() < 1 then
			Talk(1,"", "��i hi�p ch�a ho�n th�nh xong nhi�m v� Chuy�n Sinh !!!!")		
			return 0
		end	
		if nNum_cs6 >= 1 then
			Talk(1,"", "��i hi�p �� ho�n th�nh Ph�c Sinh r�i n�n kh�ng th� th�c hi�n Chuy�n Sinh ���c n�a!!!!")		
			return 0
		end
	end
	if nType == 2 then
		if GetPlayerRebornParam(0) < 1 then --GetTranslifeCount() < 6 
			Talk(1,"", "��i hi�p ch�a ho�n th�nh xong nhi�m v� Ph�c Sinh !!!!")		
			return 0
		end
	end
	------------------------
	local tChange = {--Xu v�t ph�m, Thi�n Cang L�nh, Thi�n M�n Kim L�nh,  V�ng
					[1] = {777, 1, 0, 0},
					[2] = {777, 1, 1, 777},	
				}
	if nType == 1 then				
		DelItem(2,1,30230,tChange[nType][1])
		DelItem(2,95,204,tChange[nType][2])
	elseif nType == 2 then
		if nNum_cs6 == 5 then
			DelItem(2,1,30490,3)
			DelItem(2,1,539,5)
			DelItem(2,95,204,5)
			DelItem(2,1,30370,5)
			-----
			local t_uanlinh_ps = {
											{0,148,137},
											{0,148,138},
											{0,148,139},
											{0,148,140},
											{0,149,141},
											{0,149,142},
											{0,149,143},
											{0,149,144},
											{0,150,137},
											{0,150,138},
											{0,150,139},
											{0,150,140},									
										}
			
			BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
			BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
			BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
			BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))
			local nBody = GetBody()	
			for i=1, getn(tb_translife_cloth_cs10_nhanlai[nBody]) do
				local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs10_nhanlai[nBody][i])
				lvatt3 = lvatt3 or 0
				att3 = att3 or 0
				BigDelItem(G,D,P,BigGetItemCount(G,D,P))			
			end			
			for i=1, getn(t_uanlinh_ps) do
				local G = t_uanlinh_ps[i][1]
				local D = t_uanlinh_ps[i][2]
				local P = t_uanlinh_ps[i][3]
				BigDelItem(G,D,P,BigGetItemCount(G,D,P))		
			end
		elseif nNum_cs6 == 4 then
			DelItem(2,1,30490,3)
			DelItem(2,95,204,3)
			DelItem(2,1,30370,3)
			Pay(5000*10000)	
			-----
			local t_uanlinh_ps = {
											{0,148,133},
											{0,148,134},
											{0,148,135},
											{0,148,136},
											{0,149,137},
											{0,149,138},
											{0,149,139},
											{0,149,140},
											{0,150,133},
											{0,150,134},
											{0,150,135},
											{0,150,136},									
										}
			
			BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
			BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
			BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
			BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))
			local nBody = GetBody()	
			for i=1, getn(tb_translife_cloth_cs9_nhanlai[nBody]) do
				local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs9_nhanlai[nBody][i])
				lvatt3 = lvatt3 or 0
				att3 = att3 or 0
				BigDelItem(G,D,P,BigGetItemCount(G,D,P))			
			end			
			for i=1, getn(t_uanlinh_ps) do
				local G = t_uanlinh_ps[i][1]
				local D = t_uanlinh_ps[i][2]
				local P = t_uanlinh_ps[i][3]
				BigDelItem(G,D,P,BigGetItemCount(G,D,P))		
			end
		else
			DelItem(2,1,30230,tChange[nType][1])
			DelItem(2,95,204,tChange[nType][2])
			DelItem(2,1,30370,tChange[nType][3])
			Pay(tChange[nType][4]*10000)	
		end
	end
	gf_WriteLogEx("THAY DOI HUONG CHUYEN SINH", "thay ��i th�nh c�ng", 1, "X�a th�nh c�ng v�t ph�m")			
	------------------------
	if nType == 1 then
		-- Set h��ng chuy�n sinh
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nWay)	
		Talk(1,"", "Ch�c m�ng ��i hi�p �� thay ��i h��ng Chuy�n Sinh th�nh c�ng, h�y ��n g�p B�ch Ti�n Sinh �� nh�n l�i trang b� Chuy�n Sinh m�i !!!!")		
		Msg2Player("Ch�c m�ng ��i hi�p �� thay ��i h��ng Chuy�n Sinh th�nh c�ng, h�y ��n g�p B�ch Ti�n Sinh �� nh�n l�i trang b� Chuy�n Sinh m�i !!!!")
		gf_WriteLogEx("THAY DOI HUONG CHUYEN SINH", "thay ��i th�nh c�ng", 1, "Chuy�n Sinh ��i h��ng "..nWay)
	end	
	if nType == 2 then
--		local nNum_cs6 = GetPlayerRebornParam(0)	--�p d�ng thay ��i h��ng Ph�c sinh lu�n cho c�c Ph�c sinh 2, 3, 4...
		local nLevel_CS6 = GetLevel()
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FLAG_LEVEL, 0)	
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_SAVE_LEVEL, 0)	
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FLAG_LEVEL, 1)	
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_SAVE_LEVEL, nLevel_CS6)	
		PlayerReborn(nNum_cs6,nWay) -- Thay ��i h��ng chuy�n Sinh 6 th�nh c�ng		
		Talk(1,"", "Ch�c m�ng ��i hi�p �� thay ��i h��ng Ph�c Sinh th�nh c�ng, h�y ��n g�p B�ch Ti�n Sinh �� nh�n l�i trang b� Ph�c Sinh m�i !!!!")		
		Msg2Player("Ch�c m�ng ��i hi�p �� thay ��i h��ng Ph�c Sinh th�nh c�ng, h�y ��n g�p B�ch Ti�n Sinh �� nh�n l�i trang b� Ph�c Sinh m�i !!!!")
		gf_WriteLogEx("THAY DOI HUONG CHUYEN SINH", "thay ��i th�nh c�ng", 1, "Ph�c Sinh ��i h��ng "..nWay)
		NewWorld(200,1353, 2876)
	end
end
-- Doi chan khi bang trai cay
function GetQiByFruit()
	if tonumber(gf_GetTaskByte(TSK_GETQIBYFRUIT, 1)) ~= tonumber(date("%w")) then
		SetTask(TSK_GETQIBYFRUIT, 0)
		gf_SetTaskByte(TSK_GETQIBYFRUIT, 1, tonumber(date("%w")))
	end
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Tr�n th� gian c� v� s� �i�u k� b�, ta �� t�ng �i qua r�t nhi�u n�i n�n c� am hi�u v� m�t s� k� thu�t, c�c h� c� mu�n th� gi�o kh�ng?"
	tinsert(tSay,"Ta mu�n n�p m�t �t tr�i c�y/NopTraiCayNhanChanKhi_Form")
	local nFruitCount = 0
	for i = 1, 20 do
		nFruitCount = nFruitCount + gf_GetTaskBit(TSK_GETQIBYFRUIT, i + 9)
	end
	if nFruitCount > 1 then
		tinsert(tSay,"Ta mu�n nh�n th��ng n�p nhi�u tr�i c�y/NhanThuongNopNhieuTraiCay")
	end
	tinsert(tSay, "T�m th�i ta ch�a mu�n luy�n/do_nothing")
	Say(tHeader, getn(tSay), tSay)
end


function NopTraiCayNhanChanKhi_Form()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	if MeridianGetLevel() < 1 then
		Talk(1,"", szNpcName .. "C�c h� ch�a �� th�ng kinh m�ch, ta kh�ng th� h��ng d�n tu luy�n ch�n kh�.")
		return 0
	end
	local tbFruitList = {
		[1] = "Nh�n", [2] = "Ch�m Ch�m", [3] = "Cam", [4] = "D�a", [5] = "M�ng c�t", [6] = "B��i", [7] = "D�u", [8] = "Chu�i", [9] = "Xo�i", [10] = "��o", 
		[11] = "M�n", [12] = "V�i", [13] = "T�o", [14] = "B�", [15] = "�u ��", [16] = "M�ng c�u", [17] = "Kh�m", [18] = "L�", [19] = "B�n bon", [20] = "Kh�",
	}
	local tSay = {}
	tSay[0] =  szNpcName.."C�c h� mu�n ��a ta lo�i tr�i c�y n�o?"
	for i = 1, 20 do
		if gf_GetTaskBit(TSK_GETQIBYFRUIT, i + 9) == 0 then
			tinsert(tSay ,format("Ta mu�n n�p 30 %s/#NopTraiCayNhanChanKhi_Done(%d)", tbFruitList[i], i))
		end
	end
	gf_PageSay(tSay, 1, 6)
end


function NopTraiCayNhanChanKhi_Done(nFruit)
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tbFruitListID = {
		[1] = 30164, [2] = 30165, [3] = 30166, [4] = 30167, [5] = 30168, [6] = 30169, [7] = 30170, [8] = 30171, [9] = 30172, [10] = 30173,
		[11] = 30174, [12] = 30175, [13] = 30176, [14] = 30177, [15] = 30178, [16] = 30179, [17] = 30180, [18] = 30181, [19] = 30182, [20] = 30183,
	}
	if GetItemCount(2,1,tbFruitListID[nFruit]) < 30 then
		Talk(1,"", szNpcName .. "Ng��i tay kh�ng d�ng n�p, ��nh ��a v�i ta sao?")
		return 0
	end
	if DelItem(2,1,tbFruitListID[nFruit],30) == 1 then
		gf_SetTaskBit(TSK_GETQIBYFRUIT, nFruit + 9, 1)
		AwardGenuineQi(6)
		gf_WriteLogEx("NOP TRAI CAY DOI CHAN KHI", "nh�n", 6, "Ch�n kh�")
	end
end


function NhanThuongNopNhieuTraiCay()
	if gf_GetTaskBit(TSK_GETQIBYFRUIT, 9) == 1 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng h�m nay r�i.");
		return 0
	end
	local nFruitCount = 0
	for i = 1, 20 do
		nFruitCount = nFruitCount + gf_GetTaskBit(TSK_GETQIBYFRUIT, i + 9)
	end
	if nFruitCount > 1 then
		gf_SetTaskBit(TSK_GETQIBYFRUIT, 9, 1)
		AwardGenuineQi(nFruitCount * 10)
		gf_WriteLogEx("NOP NHIEU TRAI CAY THUONG CHAN KHI", "nh�n", (nFruitCount * 10), "Ch�n kh�")
	end
end


-- Doi chan khi bang tien + kinh nghiem
function GetQiByGold()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Tr�n th� gian c� v� s� �i�u k� b�, ta �� t�ng �i qua r�t nhi�u n�i n�n c� am hi�u v� m�t s� k� thu�t, c�c h� c� mu�n th� gi�o kh�ng?"
	tinsert(tSay, "Tu luy�n 100 �i�m ch�n kh� (ti�u hao 1000 v�ng)/#exchange_chankhi_bygold(5)")	
	tinsert(tSay, "Tu luy�n 100 �i�m ch�n kh� (ti�u hao 250 v�ng + 30 tri�u �i�m kinh nghi�m)/#exchange_chankhi_bygold(1)")	
	tinsert(tSay, "Tu luy�n 1000 �i�m ch�n kh� (ti�u hao 2500 v�ng + 300 tri�u �i�m kinh nghi�m)/#exchange_chankhi_bygold(2)")	
	tinsert(tSay, "Tu luy�n 100 �i�m ch�n kh� (ti�u hao 69 v�t ph�m Xu + 30 tri�u �i�m kinh nghi�m)/#exchange_chankhi_bygold(3)")	
	tinsert(tSay, "Tu luy�n 1000 �i�m ch�n kh� (ti�u hao 690 v�t ph�m Xu + 300 tri�u �i�m kinh nghi�m)/#exchange_chankhi_bygold(4)")	
	tinsert(tSay, "T�m th�i ta ch�a mu�n luy�n/do_nothing")
	Say(tHeader, getn(tSay), tSay)
end


function use_chuyensinhdon()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Tr�n th� gian c� v� s� �i�u k� b�, ta �� t�ng �i qua r�t nhi�u n�i n�n c� am hi�u v� m�t s� k� thu�t, c�c h� c� mu�n th� gi�o kh�ng?"
	tinsert(tSay, "Ta mu�n ��t c�nh gi�i Chuy�n Sinh 2/#confirm_use_chuyensinhdon(1)")		
	tinsert(tSay, "Ta mu�n ��t c�nh gi�i Chuy�n Sinh 3/#confirm_use_chuyensinhdon(2)")		
	tinsert(tSay, "Ta mu�n ��t c�nh gi�i Chuy�n Sinh 4/#confirm_use_chuyensinhdon(3)")		
	tinsert(tSay, "Ta mu�n ��t c�nh gi�i Chuy�n Sinh 5/#confirm_use_chuyensinhdon(4)")		
	tinsert(tSay, "Ta ch� mu�n t�m hi�u th�i/do_nothing")
	Say(tHeader, getn(tSay), tSay)	
end

function learn_subskill_1()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."C�c h� h�y l�a ch�n k� thu�t mu�n luy�n:"
	
	tinsert(tSay, "Luy�n Thu�n Th� Thu�t c�p 1/learn_subskill_1_active")
	tinsert(tSay, "Luy�n Thu�n Th� Thu�t c�p 2/#levelup_subskill_1(2)")
	tinsert(tSay, "Luy�n Thu�n Th� Thu�t c�p 3/#levelup_subskill_1(3)")
	tinsert(tSay, "Luy�n Ph�c Nh�n Thu�t c�p 4/#levelup_subskill_1(4)")
--	tinsert(tSay, "Luy�n Ph�c Nh�n Thu�t c�p 5/#levelup_subskill_1(5)")
--	tinsert(tSay, "Luy�n Ph�c Nh�n Thu�t c�p 6/#levelup_subskill_1(6)")
--	tinsert(tSay, "Luy�n Ng� Linh Th�n Thu�t c�p 7/#levelup_subskill_1(7)")
--	tinsert(tSay, "Luy�n Ng� Linh Th�n Thu�t c�p 8/#levelup_subskill_1(8)")
--	tinsert(tSay, "Luy�n Ng� Linh Th�n Thu�t c�p 9/#levelup_subskill_1(9)")
--	tinsert(tSay, "Luy�n Ng� Linh Th�n Thu�t c�p 10/#levelup_subskill_1(10)")
	tinsert(tSay, "Ta ch� mu�n t�m hi�u th�i/do_nothing")
	
	Say(tHeader, getn(tSay), tSay)
end

function learn_subskill_1_active()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>"
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	
	if nCurLevel >= 1 then
		Talk(1, "", szNpcName..": C�c h� �� luy�n B�c ��u Ng� Linh Th�n Thu�t r�i, kh�ng c�n ph�i k�ch ho�t l�i n�a!")
		return
	end
	
	local tSay = {}
	tinsert(tSay, "��ng � luy�n/confirm_learn_subskill_1_active")
	tinsert(tSay, "�� ta suy ngh� l�i/do_nothing")
	
	local nGold = tRequireElement[1][3] / 10000
	Say(szNpcName..": Luy�n B�c ��u Ng� Linh Th�n Thu�t c�n c� <color=yellow>"..tRequireElement[1][2].." �i�m tu luy�n, "..nGold.." v�ng v� "..tRequireElement[1][4].." m�nh Th�i D�ch H�n Nguy�n C�ng ��<color>, c�c h� c� ��ng � luy�n kh�ng?", 2, tSay)
end

function confirm_learn_subskill_1_active()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>"		
--	if GetLevel() < 75 then
--		Talk(1, "", szNpcName..": ��ng c�p 75 tr� l�n m�i c� th� luy�n B�c ��u Ng� Linh Th�n Thu�t!")
--		return
--	end
--	if check_skill_55() == 0 then
--		Talk(1, "", szNpcName..": �� luy�n B�c ��u Ng� Linh Th�n Thu�t tr��c h�t ph�i h�c ��y �� k� n�ng c�p 55 c�a m�n ph�i!")
--		return
--	end	
	if GetPopur() < tRequireElement[1][2] then
		Talk(1, "", szNpcName..": C�c h� ch�a �� �i�m tu luy�n �� luy�n B�c ��u Ng� Linh Th�n Thu�t!")
		return
	end
	if GetCash() < tRequireElement[1][3] then
		Talk(1, "", szNpcName..": C�c h� ch�a �� ti�n �� luy�n B�c ��u Ng� Linh Th�n Thu�t!")
		return
	end
	if GetItemCount(2, 0, 1082) < tRequireElement[1][4] then
		Talk(1, "", szNpcName..": C�c h� ch�a mang �� Th�i D�ch H�n Nguy�n C�ng �� �� luy�n B�c ��u Ng� Linh Th�n Thu�t!")
		return
	end
	
	if DelItem(2, 0, 1082, tRequireElement[1][4]) == 1 then		
		ModifyPopur(-tRequireElement[1][2])
		Pay(tRequireElement[1][3])
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + 1)
		gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_SEX,  random(1,2))
		gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE,  1)
		Msg2Player("B�n �� k�ch ho�t th�nh c�ng B�c ��u Ng� Linh Th�n Thu�t!")
		WriteLogEx(szLogTitle, "k�ch ho�t th�nh c�ng")
		Talk(1, "", szNpcName..": Ch�c m�ng c�c h� �� luy�n th�nh c�ng B�c ��u Ng� Linh Th�n Thu�t!")
	end
end

function levelup_subskill_1(nSkillLevel)
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>"
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)	
	if nCurLevel == nSkillLevel then
		Talk(1, "", szNpcName..": C�c h� �� luy�n B�c ��u Ng� Linh Th�n Thu�t ��n c�p "..nSkillLevel.." r�i!")
		return
	end
	if nCurLevel < nSkillLevel - 1 then
		Talk(1, "", szNpcName..": C�c h� c�n luy�n B�c ��u Ng� Linh Th�n Thu�t c�p d��i r�i h�y ��n g�p ta �� n�ng l�n c�p "..nSkillLevel)
		return
	end
	if nCurLevel > 4 then
		Talk(1, "", szNpcName..": C�c h� ch�a �� �i�u ki�n �� n�ng l�n c�p "..nSkillLevel)
		return
	end
	if nSkillLevel == nCurLevel + 1 then
		local tSay = {}
		tinsert(tSay, format("��ng � n�ng c�p/#confirm_levelup_subskill_1(%d)",nSkillLevel))
		tinsert(tSay, "�� ta suy ngh� l�i/do_nothing")
		
		local nGold = tRequireElement[nSkillLevel][3] / 10000
		Say("�� n�ng c�p B�c ��u Ng� Linh Th�n Thu�t l�n c�p "..nSkillLevel.."c�n c� <color=yellow>"..tRequireElement[nSkillLevel][1].." �i�m N�ng C�p, "..tRequireElement[nSkillLevel][5].." �i�m Linh L�c, "..tRequireElement[nSkillLevel][2].." �i�m tu luy�n, "..nGold.." v�ng v� "..tRequireElement[nSkillLevel][4].." m�nh Th�i D�ch H�n Nguy�n C�ng ��<color>, c�c h� c� ��ng � n�ng c�p kh�ng?", 2, tSay)
	end
end

function confirm_levelup_subskill_1(nSkillLevel)
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>"
	local nCurPoint = floor(GetTask(TASK_VNG_PET) / 100)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	
--	if GetLevel() < 75 then
--		Talk(1, "", szNpcName..": ��ng c�p 75 tr� l�n m�i c� th� luy�n B�c ��u Ng� Linh Th�n Thu�t!")
--		return
--	end
--	if check_skill_55() == 0 then
--		Talk(1, "", szNpcName..": �� luy�n B�c ��u Ng� Linh Th�n Thu�t tr��c h�t ph�i h�c ��y �� k� n�ng c�p 55 c�a m�n ph�i!")
--		return
--	end
	if nCurLevel == 0 then
		Talk(1, "", szNpcName..": C�c h� ch�a luy�n B�c ��u Ng� Linh Th�n Thu�t ��n c�p 1!")
		return
	end
	if nCurLevel == nSkillLevel then
		Talk(1, "", szNpcName..": C�c h� �� luy�n B�c ��u Ng� Linh Th�n Thu�t ��n c�p "..nSkillLevel.." r�i!")
		return
	end
	if nCurLevel < nSkillLevel - 1 then
		Talk(1, "", szNpcName..": C�c h� c�n luy�n B�c ��u Ng� Linh Th�n Thu�t c�p d��i r�i h�y ��n g�p ta �� n�ng l�n c�p "..nSkillLevel)
		return
	end
	if nCurLevel > nSkillLevel or nSkillLevel > 4 then
		Talk(1, "", szNpcName..": C�c h� ch�a �� �i�u ki�n �� n�ng l�n c�p "..nSkillLevel.." c�a B�c ��u Ng� Linh Th�n Thu�t!")
		return
	end
	if GetPopur() < tRequireElement[nSkillLevel][2] then
		Talk(1, "", szNpcName..": C�c h� ch�a �� �i�m N�ng c�p �� n�ng c�p B�c ��u Ng� Linh Th�n Thu�t!")
		return
	end
	if nCurPoint < tRequireElement[nSkillLevel][1] then
		Talk(1, "", szNpcName..": C�c h� ch�a �� �i�m �� n�ng c�p B�c ��u Ng� Linh Th�n Thu�t!")
		return
	end
	if nCurGodPoint < tRequireElement[nSkillLevel][5] then
		Talk(1, "", szNpcName..": C�c h� ch�a �� �i�m Linh L�c  �� n�ng c�p B�c ��u Ng� Linh Th�n Thu�t!")
		return
	end
	if GetCash() < tRequireElement[nSkillLevel][3] then
		Talk(1, "", szNpcName..": C�c h� ch�a �� ti�n �� n�ng c�p B�c ��u Ng� Linh Th�n Thu�t!")
		return
	end
	if GetItemCount(2, 0, 1082) < tRequireElement[nSkillLevel][4] then
		Talk(1, "", szNpcName..": C�c h� ch�a mang �� Th�i D�ch H�n Nguy�n C�ng �� �� n�ng c�p B�c ��u Ng� Linh Th�n Thu�t!")
		return
	end
	
	if DelItem(2, 0, 1082, tRequireElement[nSkillLevel][4]) == 1 then
		ModifyPopur(-tRequireElement[nSkillLevel][2])
		Pay(tRequireElement[nSkillLevel][3])
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + 1)
		if nSkillLevel < 4 then
			gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE,  random(1,2))
		end
		Msg2Player("B�n �� n�ng th�nh c�ng B�c ��u Ng� Linh Th�n Thu�t l�n c�p "..nSkillLevel)
		WriteLogEx(szLogTitle, "n�ng l�n c�p "..nSkillLevel)
		Talk(1, "", szNpcName..": Ch�c m�ng c�c h� �� n�ng th�nh c�ng B�c ��u Ng� Linh Th�n Thu�t l�n c�p "..nSkillLevel)
	end
end

function learn_subskill_2()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>"
	Talk(1, "", szNpcName..": C�c h� ch�a �� �i�u ki�n �� luy�n B�c ��u Gi� Kim Thu�t!")
	return
end

function learn_subskill_3()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>"
	Talk(1, "", szNpcName..": C�c h� ch�a �� �i�u ki�n �� luy�n B�c ��u Ph�c Nguy�n Thu�t!")
	return
end

function learn_subskill_4()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>"
	Talk(1, "", szNpcName..": K� thu�t n�y c� th� ���c k�ch ho�t s� d�ng trong Nguy�t L��ng Th� Luy�n ��n L�!")
	return
end

function check_skill_55()
	local nRoute = GetPlayerRoute()
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0
		end
	end
end

function exchange_chankhi()
	AskClientForNumber("Confirm_Exchange_chankhi", 1, 100, "�i�m t�ch l�y")
end

function Confirm_Exchange_chankhi(nCount)
	local nDate = tonumber(date("%y%m%d"))
	local nCurdate = floor(GetTask(2726)/10000)
	local CHANGE_EXP = 2000000
	if nDate ~= nCurdate then
		SetTask(2726 , nDate*10000)
	end
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� ��i �i�m ch�n kh� !!!")
		return
	end
	if MeridianGetLevel() <= 0 then
		Talk ( 1, "", "��i hi�p ch�a k�ch ho�t xong kinh m�ch n�n kh�ng th� ��i �i�m ch�n kh� !!!" )
		return
	end
	if ( GetPlayerRoute() == 0 )  then
		Talk ( 1, "" , "Thi�u hi�p ch�a v� m�n ph�i n�n kh�ng th� k�ch ho�t Kinh M�ch" )
		return
	end
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "Ph�i c� k� n�ng c�p 55 m�i c� th� k�ch ho�t Kinh M�ch!")
		return
	end
	if mod(GetTask(2726),10000) >= 1000 then
		Talk(1,"","H�m nay ��i hi�p �� ��i h�t �i�m r�i, vui l�ng quay l�i v�o ng�y mai")
		return	
	end
	if (mod(GetTask(2726),10000) + nCount) > 1000 then
		Talk(1,"","T�ng �i�m ch�n kh� ��i trong ng�y kh�ng th� qu� 1000 �i�m. ")
		return	
	end
	if GetExp() < CHANGE_EXP * nCount then
		Talk(1,"","��i hi�p ch�a �� �i�m kinh nghi�m �� ��i "..nCount.." �i�m ch�n kh�")
		return
	end	
	--add �i�m ch�n kh�
	SetTask(2726, GetTask(2726) + nCount)
	ModifyExp(-2000000 * nCount)
	AwardGenuineQi(nCount)
	--IBAwardGenuineQiDaily(nCount)
	Msg2Player("Ch�c m�ng ��i hi�p �� ��i ���c "..nCount.." �i�m ch�n kh�")
	gf_WriteLogEx("DA THONG KINH MACH", "��i th�nh c�ng", nCount, "ch�n kh� = exp")
end

function exchange_chankhi_bygold(nTypeCK)
	local nDate = tonumber(date("%y%m%d"))
	local nCurdate = floor(GetTask(2728)/10000)
	local tb_check_CK_gold = {
		[1] = {100, 2500000, 30000000, "250 vang + exp"},
		[2] = {1000, 25000000, 300000000, "2500 v�ng + exp"},
		[3] = {100, 69, 30000000, "69 xu + exp"},
		[4] = {1000, 690, 300000000, "690 xu + exp"},
		[5] = {100, 10000000, 0, "1000 v�ng"},
	}
	if nDate ~= nCurdate then
		SetTask(2728 , nDate*10000)
	end	
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� ��i �i�m ch�n kh� !!!")
		return
	end
	if MeridianGetLevel() <= 0 then
		Talk ( 1, "", "��i hi�p ch�a k�ch ho�t xong kinh m�ch n�n kh�ng th� ��i �i�m ch�n kh� !!!" )
		return
	end
	if ( GetPlayerRoute() == 0 )  then
		Talk ( 1, "" , "Thi�u hi�p ch�a v� m�n ph�i n�n kh�ng th� k�ch ho�t Kinh M�ch" )
		return
	end
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "Ph�i c� k� n�ng c�p 55 m�i c� th� k�ch ho�t Kinh M�ch!")
		return
	end	
	if nTypeCK == 1 or nTypeCK == 2 or nTypeCK == 5 then
		if GetCash() < tb_check_CK_gold[nTypeCK][2] then
			Talk(1, "", "��i hi�p kh�ng c� �� ti�n �� tr� c�ng cho l�o phu !!!")
			return
		end
	end
	if nTypeCK == 3 or nTypeCK == 4 then
		if GetItemCount(2,1,30230) < tb_check_CK_gold[nTypeCK][2] then
			Talk(1, "", "��i hi�p kh�ng c� �� Xu v�t ph�m �� tr� c�ng cho l�o phu !!!")
			return
		end
	end
	if GetExp() < tb_check_CK_gold[nTypeCK][3] then
		Talk(1, "", "��i hi�p kh�ng c� �� kinh nghi�m �� tu luy�n !!!")
		return
	end
	if mod(GetTask(2728),10000) >= 2000 then
		Talk(1,"","H�m nay ��i hi�p �� ��i h�t �i�m r�i, vui l�ng quay l�i v�o ng�y mai")
		return	
	end
	if (mod(GetTask(2728),10000) + tb_check_CK_gold[nTypeCK][1]) > 2000 then
		Talk(1,"","T�ng �i�m ch�n kh� ��i trong ng�y kh�ng th� qu� 2000 �i�m. ")
		return	
	end
	SetTask(2728, GetTask(2728) + tb_check_CK_gold[nTypeCK][1])
	if nTypeCK == 1 or nTypeCK == 2 or nTypeCK == 5 then
		Pay(tb_check_CK_gold[nTypeCK][2])
	else
		DelItem(2,1,30230, tb_check_CK_gold[nTypeCK][2])
	end
	ModifyExp(-tb_check_CK_gold[nTypeCK][3])
	AwardGenuineQi(tb_check_CK_gold[nTypeCK][1])
	Msg2Player("Ch�c m�ng ��i hi�p �� tu luy�n ���c "..tb_check_CK_gold[nTypeCK][1].." �i�m ch�n kh�")	
	gf_WriteLogEx("DA THONG KINH MACH", "��i th�nh c�ng", tb_check_CK_gold[nTypeCK][1], "27/6 ch�n kh� lo�i ".. tb_check_CK_gold[nTypeCK][4])	
end

tb_checkdk = {
		[1] = {1, 2, 6000, 6000, 1, 6, 2},
		[2] = {1, 3, 8000, 8000, 2, 12, 3},
		[3] = {1, 4, 10000, 10000, 3, 22, 4},
		[4] = {1, 4, 12000, 12000, 4, 30, 5},
}
function confirm_use_chuyensinhdon(nCSLoai)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>"
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	
	if GetItemCount(2,1,30345) < tb_checkdk[nCSLoai][1] then
		Talk(1, "", szNpcName..": C�c h� kh�ng c� Chuy�n Sinh ��n n�n ta kh�ng th� gi�p c�c h� ���c !!!")
		return
	end
	if GetItemCount(2,1,539) < tb_checkdk[nCSLoai][2] then
		Talk(1, "", szNpcName..": C�c h� kh�ng c� �� Ho�ng Kim ��i H�ng Bao (ch�a 999 v�ng) n�n ta kh�ng th� gi�p c�c h� ���c !!!")
		return
	end
	if nRep < tb_checkdk[nCSLoai][3] then
		Talk(1, "", szNpcName..": C�c h� kh�ng c� �� �i�m Danh V�ng n�n ta kh�ng th� gi�p c�c h� ���c !!!")
		return
	end	
	if nFaction < tb_checkdk[nCSLoai][4] then
		Talk(1, "", szNpcName..": C�c h� kh�ng c� �� �i�m S� M�n n�n ta kh�ng th� gi�p c�c h� ���c !!!")
		return
	end	
	if GetTranslifeCount() < tb_checkdk[nCSLoai][5] or GetTaskTrans() <tb_checkdk[nCSLoai][6] then
		Talk(1,"","B�n ch�a ho�n th�nh chuy�n sinh "..tb_checkdk[nCSLoai][5].." n�n ta kh�ng th� gi�p c�c h� ���c")
		return
	end
	if GetTranslifeCount() >= tb_checkdk[nCSLoai][7] then
		Talk(1,"","B�n �� ho�n th�nh chuy�n sinh "..tb_checkdk[nCSLoai][7].." r�i, n�n ta kh�ng th� gi�p c�c h� ���c")
		return
	end
	select_trend(nCSLoai)
end

function select_trend(nCSLoai)
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>"
	local nLoai = nCSLoai
	local tSay = 	{
							"V�n b�i mu�n tu luy�n theo h��ng Long T�!/#select_translife(1, "..nLoai..")",
							"V�n b�i mu�n tu luy�n theo h��ng H� T�!/#select_translife(2, "..nLoai..")",
							"V�n b�i mu�n tu luy�n theo h��ng �ng T�!/#select_translife(3, "..nLoai..")",
							"V�n b�i mu�n tu luy�n theo h��ng Ph�ng T�!/#select_translife(4, "..nLoai..")",
						--	"Gi�i thi�u c�c h��ng tu luy�n/view_info",
							"V�n b�i suy ngh� l�i ��./nothing",
						}
	Say(szNpcName.."<color=yellow>H�n T�c H�a Quang<color> h�p thu linh kh� �m d��ng, v�n v�t sinh di�t ��u c� th� kh�ng ch�, ng��i mu�n tu luy�n theo h��ng n�o?",getn(tSay),tSay)
end
function select_translife(nType, nLoai)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	DelItem(2,1,30345,1)
	DelItem(2,1,539, tb_checkdk[nLoai][2])
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))
	local nRoute = GetPlayerRoute()
	-- Set s� l�n chuy�n sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT, gf_GetTaskByte(TRANSLIFE_TASK_ID,TRANSLIFE_BYTE_COUNT) +1)
	-- Set h��ng chuy�n sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nType)
	if nLoai == 1 then
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			gf_AddItemEx2({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1],"Chuyen Sinh","nh�n ngo�i trang",0,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		--SetTaskTrans()
		SetTask(TRANSLIFE_MISSION_ID, 13)
		ResetProperty()
		SetLevel(88,0)
		Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� hai...")
		AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 4 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
		WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)	
	elseif nLoai == 2 then
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 570 + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, Pnew, nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"V�n S� Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		--SetTaskTrans()
		SetTask(TRANSLIFE_MISSION_ID, 23)
		ResetProperty()
		SetLevel(86,0)
		Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� ba...")
		AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 6 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
		WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)		
	elseif nLoai == 3 then
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 570 + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, (561 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Thi�n �m Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		--SetTaskTrans()
		SetTask(TRANSLIFE_MISSION_ID, 31)
		ResetProperty()
		SetLevel(84,0)
		Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� t�...")
		AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 8 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
		WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)	
	elseif nLoai == 4 then
		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 561 + GetBody()
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"T� Linh Vi�t Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		--SetTaskTrans()
		SetTask(TRANSLIFE_MISSION_ID, 37)
		ResetProperty()
		SetLevel(79,0)
		Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� t�...")
		AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 8 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
		WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)	
	end

end
function get_item_kinhmach()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Ta c� th� gi�p c�c h� k�ch ho�t th�nh c�ng c�nh gi�i V� Hi�n c�a Kinh M�ch. C�c h� c� mu�n kh�ng ?"
	
	tinsert(tSay, "��ng �/confirm_get_item_kinhmach")
	tinsert(tSay, "T�m th�i ta ch�a mu�n l�m/do_nothing")
	
	Say(tHeader, getn(tSay), tSay)
end
function get_item_tulinh()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Ta cho c�c h� v�t ph�m T� Linh Di�t Ph�p Tr�n B�n �� l�m ti�p nhi�m v� T� Linh Di�t Ph�p Tr�n. C�c h� c� mu�n nh�n kh�ng ?"
	
	tinsert(tSay, "��ng �/confirm_get_item_tulinh")
	tinsert(tSay, "T�m th�i ta ch�a mu�n l�m/do_nothing")
	
	Say(tHeader, getn(tSay), tSay)
end
function confirm_get_item_kinhmach()
	if GetLevel() < 90 then
		Talk(1,"","��i hi�p kh�ng �� c�p �� k�ch ho�t Kinh M�ch !!!!")
		return 0
	end
	if gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
		Talk(1,"","��i hi�p ch�a c� skill 55 n�n kh�ng th� k�ch ho�t Kinh M�ch !!!!")
		return 0
	end
	if MeridianGetLevel() ~= 0 then
		Talk(1,"","��i hi�p �� k�ch ho�t Kinh M�ch r�i !!!!")
		return 0
	end
	if GetItemCount(2,1,30230) < 10 then
		Talk(1,"","��i hi�p kh�ng mang theo �� Xu v�t ph�m !!!!")
		return 0
	end
	DelItem(2,1,30230,10)
	if MeridianGetLevel() == 0 then
	--print("MeridianGetLevel")
		local tSex = gf_GetPlayerSexName();
		if MeridianUpdateLevel() == 1 then
			Msg2Player("Ch�c m�ng "..tSex.."Nghi�n c�u <Qu� Hoa B�o �i�n> th�nh c�ng v� ��t ��n c�nh gi�i V� Gi�.");
			if MeridianGetLevel() == 1 then
				gf_WriteLogEx("KICK HOAT KINH MACH", "th�nh c�ng", 1, "V� Hi�n 27/7")
		  		Msg2Player("Ch�c m�ng "..tSex.."So b� l�nh ng� <Qu� Hoa B�o �i�n>");
		  		Talk(2,"",format("Ch�c m�ng <color=green>%s<color>�� ��c'Qu� Hoa B�o �i�n'th�nh c�ng v� ��t  ��n c�nh gi�i v� gi�",tSex),format("Ch�c m�ng %s s� b� l�nh ng� ���c'Qu� Hoa B�o �i�n',(b�m n�t J�� xem kinh m�ch)",tSex));
			end
		end
	end
end
function confirm_get_item_tulinh()
	if GetItemCount(2,1,30230) < 10 then
		Talk(1,"","��i hi�p kh�ng mang theo �� Xu v�t ph�m !!!!")
		return 0	
	end
	if BigGetItemCount(2,0,30049) == 0 then
		Talk(1,"","Ch� c� nh�ng ��i hi�p b� k�t nhi�m v� tr��c ��y m�i nh�n ���c v�t ph�m h� tr� !!!!")
		return 0	
	end
	if BigGetItemCount(2,0,30050) >= 1 then
		Talk(1,"","��i hi�p �� nh�n v�t ph�m h� tr� r�i ho�c �� ho�n th�nh nhi�m v� r�i !!!!")
		return 0	
	end	
	DelItem(2,1,30230,10)
	BigDelItem(2,0,30052,GetItemCount(2,0,30052))
	--if BigDelItem(2,0,30049,GetItemCount(2,0,30049)) == 1 then
		if BigGetItemCount(2,0,30050) == 0 then
			AddItem(2,0,30050,1);
			Msg2Player("Gh�p th�nh c�ng T� Linh Di�t Ph�p Tr�n B�n");
		end
	--end
end
function exchange_to_exp()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."Tr�n th� gian c� v� s� �i�u k� b�, ta �� t�ng �i qua r�t nhi�u n�i n�n c� am hi�u v� m�t s� k� thu�t, c�c h� c� mu�n th� gi�o kh�ng?"

	tinsert(tSay, "Nh�n 390000 kinh nghi�m (1 m�nh thi�n th�ch + 1 xu v�t ph�m)/#confirm_exchange_to_exp(1)")
	tinsert(tSay, "Nh�n 390000 kinh nghi�m (2 thi�n th�ch + 1 xu v�t ph�m)/#confirm_exchange_to_exp(2)")
	tinsert(tSay, "Nh�n 390000 kinh nghi�m (20 m�nh tinh ng�n + 1 xu v�t ph�m)/#confirm_exchange_to_exp(3)")
	tinsert(tSay, "Nh�n 390000 kinh nghi�m (20 ng� h�nh huy�n th�ch + 1 xu v�t ph�m)/#confirm_exchange_to_exp(4)")
	tinsert(tSay, "Nh�n 390000 kinh nghi�m (8 thi�n ngh�a tinh thi�t + 1 xu v�t ph�m)/#confirm_exchange_to_exp(5)")
	tinsert(tSay, "Nh�n 390000 kinh nghi�m (8 ng� h�nh huy�n thi�t + 1 xu v�t ph�m)/#confirm_exchange_to_exp(6)")
	tinsert(tSay, "Nh�n 100000 kinh nghi�m (1 ti�u Nh� � + 1 v�ng)/#confirm_exchange_to_exp(7)")
	tinsert(tSay, "T�m th�i ta ch�a mu�n ��i/do_nothing")
	Say(tHeader, getn(tSay), tSay)
end
function confirm_exchange_to_exp(nType)
	if nType == 1 then
		AskClientForNumber("NguyenLieu1", 1, 999, "S� l�n ��i (1-999)")
	elseif nType == 2 then
		AskClientForNumber("NguyenLieu2", 1, 999, "S� l�n ��i (1-999)")
	elseif nType == 3 then
		AskClientForNumber("NguyenLieu3", 1, 999, "S� l�n ��i (1-999)")
	elseif nType == 4 then
		AskClientForNumber("NguyenLieu4", 1, 999, "S� l�n ��i (1-999)")
	elseif nType == 5 then
		AskClientForNumber("NguyenLieu5", 1, 999, "S� l�n ��i (1-999)")
	elseif nType == 6 then
		AskClientForNumber("NguyenLieu6", 1, 999, "S� l�n ��i (1-999)")
	elseif nType == 7 then
		AskClientForNumber("NguyenLieu7", 1, 999, "S� l�n ��i (1-999)")
	end
end
function NguyenLieu1(nCount)
	if check_exchange_to_exp(nCount) == 0 then
		return 0
	end
	if GetItemCount(2,2,7) < 1 * nCount then
		Talk(1,"","��i hi�p kh�ng mang �� "..1 * nCount.." M�nh thi�n th�ch �� ��i !")
		return 0		
	end	
	DelItem(2,1,30230,1 * nCount)
	if DelItem(2,2,7,1 * nCount) == 1 then
		ModifyExp(390000 * nCount)
		Msg2Player("B�n nh�n ���c "..390000 * nCount.." �i�m kinh nghi�m")
		gf_WriteLogEx("DOI NGUYEN LIEU LAY KINH NGHIEM", "��i th�nh c�ng", nCount, "��i nguy�n li�u lo�i 1")
	end
end
function NguyenLieu2(nCount)
	if check_exchange_to_exp(nCount) == 0 then
		return 0
	end
	if GetItemCount(2,2,8) < 2 * nCount then
		Talk(1,"","��i hi�p kh�ng mang �� "..2 * nCount.." Thi�n th�ch �� ��i !")
		return 0		
	end	
	DelItem(2,1,30230,1 * nCount)
	if DelItem(2,2,8,2 * nCount) == 1 then
		ModifyExp(390000 * nCount)
		Msg2Player("B�n nh�n ���c "..390000 * nCount.." �i�m kinh nghi�m")
		gf_WriteLogEx("DOI NGUYEN LIEU LAY KINH NGHIEM", "��i th�nh c�ng", nCount, "��i nguy�n li�u lo�i 2")
	end
end
function NguyenLieu3(nCount)
	if check_exchange_to_exp(nCount) == 0 then
		return 0
	end
	if GetItemCount(2,1,30299) < 20 * nCount then
		Talk(1,"","��i hi�p kh�ng mang �� "..20 * nCount.." M�nh tinh ng�n �� ��i !")
		return 0		
	end	
	DelItem(2,1,30230,1 * nCount)
	if DelItem(2,1,30299,20 * nCount) == 1 then
		ModifyExp(390000 * nCount)
		Msg2Player("B�n nh�n ���c "..390000 * nCount.." �i�m kinh nghi�m")
		gf_WriteLogEx("DOI NGUYEN LIEU LAY KINH NGHIEM", "��i th�nh c�ng", nCount, "��i nguy�n li�u lo�i 3")
	end
end
function NguyenLieu4(nCount)
	if check_exchange_to_exp(nCount) == 0 then
		return 0
	end
	if GetItemCount(2,1,30302) < 20 * nCount then
		Talk(1,"","��i hi�p kh�ng mang �� "..20 * nCount.." Ng� h�nh huy�n th�ch �� ��i !")
		return 0		
	end	
	DelItem(2,1,30230,1 * nCount)
	if DelItem(2,1,30302,20 * nCount) == 1 then
		ModifyExp(390000 * nCount)
		Msg2Player("B�n nh�n ���c "..390000 * nCount.." �i�m kinh nghi�m")
		gf_WriteLogEx("DOI NGUYEN LIEU LAY KINH NGHIEM", "��i th�nh c�ng", nCount, "��i nguy�n li�u lo�i 4")
	end
end
function NguyenLieu5(nCount)
	if check_exchange_to_exp(nCount) == 0 then
		return 0
	end
	if GetItemCount(2,1,30300) < 8 * nCount then
		Talk(1,"","��i hi�p kh�ng mang �� "..8 * nCount.." Thi�n ngh�a tinh thi�t �� ��i !")
		return 0		
	end	
	DelItem(2,1,30230,1 * nCount)
	if DelItem(2,1,30300,8 * nCount) == 1 then
		ModifyExp(390000 * nCount)
		Msg2Player("B�n nh�n ���c "..390000 * nCount.." �i�m kinh nghi�m")
		gf_WriteLogEx("DOI NGUYEN LIEU LAY KINH NGHIEM", "��i th�nh c�ng", nCount, "��i nguy�n li�u lo�i 5")
	end
end
function NguyenLieu6(nCount)
	if check_exchange_to_exp(nCount) == 0 then
		return 0
	end
	if GetItemCount(2,1,30303) < 8 * nCount then
		Talk(1,"","��i hi�p kh�ng mang �� "..8 * nCount.." Ng� h�nh huy�n thi�t �� ��i !")
		return 0		
	end	
	DelItem(2,1,30230,1 * nCount)
	if DelItem(2,1,30303,8 * nCount) == 1 then
		ModifyExp(390000 * nCount)
		Msg2Player("B�n nh�n ���c "..390000 * nCount.." �i�m kinh nghi�m")
		gf_WriteLogEx("DOI NGUYEN LIEU LAY KINH NGHIEM", "��i th�nh c�ng", nCount, "��i nguy�n li�u lo�i 6")
	end
end
function NguyenLieu7(nCount)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� ��i �i�m kinh nghi�m !!!")
		return
	end
	if GetTranslifeCount() < 6 and GetTask(TSK_CS6_TULINH) < 5 then
		if GetExp() + 100000 > 2000000000 then
			Talk(1,"",format("�i�m kinh nghi�m c� ���c sau khi ��i qu� l�n, ��i hi�p h�y s� d�ng b�t r�i quay l�i g�p ta !!!!!"))
			return 0
		end
	end
	if GetCash() < 10000 * nCount then
		Talk(1,"","��i hi�p kh�ng mang �� v�ng �� ��i !!!!")
		return 0		
	end
	--check_exchange_to_exp(nCount)
	if GetItemCount(2,1,30030) < 1 * nCount then
		Talk(1,"","��i hi�p kh�ng mang �� "..1 * nCount.." Ti�u Nh� � �� ��i !")
		return 0		
	end	
	Pay(10000 * nCount)
	if DelItem(2,1,30030,1 * nCount) == 1 then
		ModifyExp(100000 * nCount)
		Msg2Player("B�n nh�n ���c "..100000 * nCount.." �i�m kinh nghi�m")
		gf_WriteLogEx("DOI NGUYEN LIEU LAY KINH NGHIEM", "��i th�nh c�ng", nCount, "��i nguy�n li�u lo�i 7")
	end
end
function check_exchange_to_exp(nCount)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� ��i �i�m kinh nghi�m !!!")
		return
	end
	if GetTranslifeCount() < 6 and GetTask(TSK_CS6_TULINH) < 5 then
		if GetExp() + 390000 > 2000000000 then
			Talk(1,"",format("�i�m kinh nghi�m c� ���c sau khi ��i qu� l�n, ��i hi�p h�y s� d�ng b�t r�i quay l�i g�p ta !!!!!"))
			return 0
		end
	end
	if GetItemCount(2,1,30230) < 1 * nCount then
		Talk(1,"","��i hi�p kh�ng mang �� Xu v�t ph�m �� ��i !!!!")
		return 0		
	end
end

function confirm_exchange_to_exp_BK(nType)
	local tCheck = {
					[1] = {2,2,7,390000, 1, " M�nh thi�n th�ch"},
					[2] = {2,2,8,390000, 2, " Thi�n th�ch"},
					[3] = {2,1,30299,390000, 20, " M�nh tinh ng�n"},	
					[4] = {2,1,30302,390000, 20, " Ng� h�nh huy�n th�ch"},
					[5] = {2,1,30300,390000, 8, " Thi�n ngh�a tinh thi�t"},
					[6] = {2,1,30303,390000, 8, " Ng� h�nh huy�n thi�t"},
					[7] = {2,1,30030,100000, 1, " Ti�u Nh� �"},
			}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� ��i �i�m kinh nghi�m !!!")
		return
	end
	if GetTranslifeCount() < 6 and GetTask(TSK_CS6_TULINH) < 5 then
		if GetExp() + tCheck[nType][4] > 2000000000 then
			Talk(1,"",format("�i�m kinh nghi�m c� ���c sau khi ��i qu� l�n, ��i hi�p h�y s� d�ng b�t r�i quay l�i g�p ta !!!!!"))
			return 0
		end
	end
	local nG = tCheck[nType][1]
	local nD = tCheck[nType][2]
	local nP = tCheck[nType][3]
	if GetItemCount(nG,nD,nP) < tCheck[nType][5] then
		Talk(1,"","��i hi�p kh�ng mang �� "..tCheck[nType][5]..tCheck[nType][6].." v�t ph�m �� ��i !!!!")
		return 0	
	end
	if nType == 7 then
		if GetCash() < 10000 then
			Talk(1,"","��i hi�p kh�ng mang �� v�ng �� ��i !!!!")
			return 0		
		end
	else
		if GetItemCount(2,1,30230) < 1 then
			Talk(1,"","��i hi�p kh�ng mang �� Xu v�t ph�m �� ��i !!!!")
			return 0		
		end
	end
	if nType == 7 then
		Pay(10000)
	else
		DelItem(2,1,30230,1)
	end
	if DelItem(nG,nD,nP,tCheck[nType][5]) == 1 then
		ModifyExp(tCheck[nType][4])
		Msg2Player("B�n nh�n ���c "..tCheck[nType][4].." �i�m kinh nghi�m")
		gf_WriteLogEx("DOI NGUYEN LIEU LAY KINH NGHIEM", "��i th�nh c�ng", 1, "��i nguy�n li�u lo�i "..nType)
	end

end
function check_change_chuyensinh(nType)
	local tChange = {--Xu v�t ph�m, Thi�n Cang L�nh, Thi�n M�n Kim L�nh,  V�ng
					[1] = {777, 1, 0, 0},
					[2] = {777, 1, 1, 777},
			}
	local nNum_cs6 = GetPlayerRebornParam(0)
	if nNum_cs6 == 5 then			
		if GetItemCount(2,1,30490) < 3 then
			Talk(1,"","��i hi�p kh�ng mang �� Ho�ng Kim ��i Ng�n Phi�u !!!!")
			return 0		
		end	
		if GetItemCount(2,1,539) < 5 then
			Talk(1,"","��i hi�p kh�ng mang �� Ho�ng Kim ��i H�ng Bao !!!!")
			return 0		
		end	
		if GetItemCount(2,95,204) < 5 then
			Talk(1,"","��i hi�p kh�ng mang �� Thi�n Cang L�nh !!!!")
			return 0		
		end	
		if GetItemCount(2,1,30370) < 5 then
			Talk(1,"","��i hi�p kh�ng mang �� Thi�n m�n kim l�nh !!!!")
			return 0		
		end	
		return 1
	end
	if nNum_cs6 == 4 then			
		if GetItemCount(2,1,30490) < 3 then
			Talk(1,"","��i hi�p kh�ng mang �� Ho�ng Kim ��i Ng�n Phi�u !!!!")
			return 0		
		end	
		if GetItemCount(2,95,204) < 3 then
			Talk(1,"","��i hi�p kh�ng mang �� Thi�n Cang L�nh !!!!")
			return 0		
		end	
		if GetItemCount(2,1,30370) < 3 then
			Talk(1,"","��i hi�p kh�ng mang �� Thi�n m�n kim l�nh !!!!")
			return 0		
		end	
		if GetCash() < 5000*10000 then
			Talk(1,"","��i hi�p kh�ng mang �� v�ng !!!!")
			return 0		
		end	
	
		return 1
	end
	if GetItemCount(2,1,30230) < tChange[nType][1] then
		Talk(1,"","��i hi�p kh�ng mang �� Xu v�t ph�m !!!!")
		return 0		
	end	
	if GetItemCount(2,95,204) < tChange[nType][2] then
		Talk(1,"","��i hi�p kh�ng mang �� Thi�n Cang L�nh !!!!")
		return 0		
	end	
	if GetItemCount(2,1,30370) < tChange[nType][3] then
		Talk(1,"","��i hi�p kh�ng mang �� Thi�n m�n kim l�nh !!!!")
		return 0		
	end	
	if GetCash() < tChange[nType][4]*10000 then
		Talk(1,"","��i hi�p kh�ng mang �� v�ng !!!!")
		return 0		
	end					
	return 1
end
function vng_restore_Meridian()
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng��i ch�i c�n s�ng m�i th�c hi�n ���c")
		return
	end	
	if MeridianGetLevel() < 1 then
		Talk(1,"", "��i hi�p ch�a k�ch ho�t kinh m�ch n�n kh�ng th� th�c hi�n t�y �i�m ch�n kh� !!!!")		
		return 0
	end
	if GetExp() < 200000000 then
		Talk(1,"", "��i hi�p kh�ng �� �i�m kinh nghi�m �� th�c hi�n t�y �i�m ch�n kh� !!!!")		
		return 0
	end
	if GetItemCount(2,1,30230) < 2000 then
		Talk(1,"", "��i hi�p kh�ng �� 2000 Xu v�t ph�m �� th�c hi�n t�y �i�m ch�n kh� !!!!")		
		return 0	
	end
	if GetItemCount(2,1,30410) < 200 then
		Talk(1,"", "��i hi�p kh�ng �� 200 M�nh Thi�n M�n �� th�c hi�n t�y �i�m ch�n kh� !!!!")		
		return 0	
	end
	if GetItemCount(2,1,30344) < 2 then
		Talk(1,"", "��i hi�p kh�ng �� 2 Th�n T�i B�o R��ng �� th�c hi�n t�y �i�m ch�n kh� !!!!")		
		return 0	
	end		
	if DelItem(2,1,30230, 2000) == 1 and DelItem(2,1,30410, 200) == 1 and DelItem(2,1,30344, 2) == 1 then
		ModifyExp(-200000000)
		MeridianRestore()
		Talk(1,"", "��i hi�p �� ���c t�y to�n b� �i�m ch�n kh� v� kinh m�ch c� ���c. B�y gi� ��i hi�p c� th� t�ng �i�m l�i theo h��ng m�i !!!!")		
		gf_WriteLogEx("TAY DIEM CHAN KHI", "t�y ch�n kh� th�nh c�ng", 1, "T�y �i�m ch�n kh� th�nh c�ng")
	else
		gf_WriteLogEx("TAY DIEM CHAN KHI", "t�y ch�n kh� th�t b�i", 1, "T�y �i�m ch�n kh� th�t b�i")	
		Talk(1,"", "��i hi�p kh�ng �� �i�u ki�n �� th�c hi�n t�y �i�m ch�n kh� !!!!")		
		return 0			
	end
end
function get_quest_PhucSinh_BDH()
	local nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
	if nGetQuest == 0 then
		SetTask(TSK_PET_PS_GIAIDOAN_B,1) --t�ng b��c nhi�m v� l�n gi� tr� 1 l� nh�n nhi�m v�
		gf_WriteLogEx("PHUC SINH PET", "nh�n giai �o�n 1", 1, "Nh�n Giai �o�n 1")
		Msg2Player("��i hi�p �� nh�n nhi�m v� Ph�c Sinh Giai �o�n 1 cho B�n ��ng H�nh !!!!")
	end
	nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.." <color=red>Ho�n th�nh Giai �o�n 1 c�n : <color>k�ch ho�t 160 c�y t� linh, 160 b�t nh� nh�, 30 l�n C�ng T�, 30 l�n Tr� An, 30 l�n Th�y L�i, 30 l�n Luy�n ��n"
	if nGetQuest == 1 then
		tinsert(tSay, "Ho�n th�nh giai �o�n 1 Ph�c Sinh cho B�n ��ng H�nh/finish_quest1_PhucSinh_BDH")
		tinsert(tSay, "Xem s� l��ng nhi�m v� �� ho�n th�nh/show_quest1_PhucSinh_BDH")
		tinsert(tSay, "H� tr� ho�n th�nh nhanh 2 giai �o�n nhi�m v� Ph�c Sinh/support_finish_quest_PhucSinh_BDH")
	end
	tinsert(tSay, "Ta ch� gh� qua th�i/do_nothing")
	Say(tHeader, getn(tSay), tSay)
end
function finish_quest1_PhucSinh_BDH()
	local nActive_CT_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/100),100)
	local nActive_TA_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10000),100)
	local nActive_TL_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/1000000),100)
	local nActive_LD_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/100000000),100)
	local nActive_BNN_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10000),1000)
	local nActive_CTL_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10000000),1000)
	if nActive_CT_PET_PS < 30 or nActive_TA_PET_PS < 30 or nActive_TL_PET_PS < 30 or nActive_LD_PET_PS < 3 then
		Talk(1,"","��i hi�p ch�a ho�n th�nh xong c�c nhi�m v� Tr� Qu�c B�nh Thi�n H� !!!!")
		return 0
	end
	if nActive_BNN_PET_PS < 160 or nActive_CTL_PET_PS < 160 then
		Talk(1,"","��i hi�p ch�a ho�n th�nh k�ch ho�t C�y T� Linh ho�c B�t Nh� Nh� !!!!")
		return 0
	end
	---------------------
	local nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
	if nGetQuest == 1 then 
		SetTask(TSK_PET_PS_GIAIDOAN_B, GetTask(TSK_PET_PS_GIAIDOAN_B) + 1) --t�ng b��c nhi�m v� l�n gi� tr� 2 l� ho�n th�nh xong giai �o�n 1
		gf_WriteLogEx("PHUC SINH PET", "xong giai �o�n 1", 1, "Ho�n th�nh Giai �o�n 1")
		Msg2Player("��i hi�p �� nh�n nhi�m v� Ph�c Sinh Giai �o�n 2 cho B�n ��ng H�nh !!!!")
	end
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.." Ch�c m�ng ��i hi�p <color=yellow>�� ho�n th�nh xong Giai �o�n 1<color> Ph�c Sinh cho B�n ��ng H�nh. <color=red>Ho�n th�nh Giai �o�n 2 c�n : <color>B�H c�p 4 (999 �i�m linh l�c), 500 thi�n th�ch, 500 m�nh thi�n th�ch, 20 thi�n th�ch tinh th�ch, 20 b�ng th�ch, 2 ho�ng kim ��i ng�n phi�u, 2 h�a th� b�ch"

	tinsert(tSay, "Ho�n th�nh giai �o�n 2 Ph�c Sinh cho B�n ��ng H�nh/finish_quest2_PhucSinh_BDH")
	tinsert(tSay, "H� tr� ho�n th�nh nhanh 2 giai �o�n nhi�m v� Ph�c Sinh/support_finish_quest_PhucSinh_BDH")
	tinsert(tSay, "Ta ch� gh� qua th�i/do_nothing")
	Say(tHeader, getn(tSay), tSay)
end
function finish_quest2_PhucSinh_BDH()
	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nLinhLuc = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	if nLinhLuc < 200 then	--nPetLevel < 4 or 
		Talk(1,"","B�n ��ng h�nh ch�a ��t c�p 4 ho�c �i�m linh l�c kh�ng �� 200 �i�m")
		return 
	end
--	local tbDieuKien = {nPetLinhluc = 999}
--	local nCheck = LIB_Award:CheckMaterial(tbDieuKien)
--	if nCheck == 0 then
--		return 0
--	end
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.." ��i hi�p h�y ch�n h��ng Ph�c Sinh cho B�n ��ng H�nh c�a m�nh."
	tinsert(tSay, "H� tr� h� N�i C�ng/#way_change_PET(1,1)")
	tinsert(tSay, "H� tr� h� Ngo�i C�ng/#way_change_PET(1,2)")
	tinsert(tSay, "Ta ch� gh� qua th�i/do_nothing")
	Say(tHeader, getn(tSay), tSay)	
end	
function way_change_PET(nType, nWay)
	local tCheck_item = {
									[1]	= {"Thi�n Th�ch", 500,  2,2,8},
									[2]	= {"M�nh Thi�n Th�ch", 500 ,2,2,7},
									[3]	= {"Thi�n Th�ch TInh Th�ch", 20 ,2,1,1009},
									[4]	= {"B�ng Th�ch", 20, 2,1,149},
									[5]	= {"Ho�ng Kim ��i Ng�n Phi�u", 2, 2,1,30490},
									[6]	= {"H�a Th� B�ch", 2, 2,1,1001},
								}

	for i = 1, getn(tCheck_item) do
		if GetItemCount(tCheck_item[i][3], tCheck_item[i][4], tCheck_item[i][5]) < tCheck_item[i][2] then
			Talk(1, "", "��i hi�p kh�ng mang �� "..tCheck_item[i][2].." "..tCheck_item[i][1])
			return 0
		end
	end	
	add_buff(nType,nWay) --Set c�c ch� s� buff
end

function add_buff(nType, nWay)
	local tNoiNgoai = {
			 [1] = {
						{"N�i C�ng 6%", "state_m_attack_percent_add", 6},
						{"Sinh L�c +6000", "state_life_max_point_add", 8000},
						{"Sinh L�c 6%", "state_life_max_percent_add", 6},
						{"Kh�ng t�t c� +12", "state_add_allability", 12}, 
					},
			[2] = {
						{"Ngo�i C�ng 12%", "state_p_attack_percent_add", 12},
						{"Sinh L�c +6000", "state_life_max_point_add", 10000},
						{"Sinh L�c 6%", "state_life_max_percent_add", 6},
						{"N�i ph�ng/Ngo�i ph�ng +60", "state_i_defence_point_add", 60},
						{"Ngo�i ph�ng +60", "state_o_defence_point_add", 60},
					},
				}
	local tCheck_item = {
									[1]	= {"Thi�n Th�ch", 500,  2,2,8},
									[2]	= {"M�nh Thi�n Th�ch", 500 ,2,2,7},
									[3]	= {"Thi�n Th�ch TInh Th�ch", 20 ,2,1,1009},
									[4]	= {"B�ng Th�ch", 20, 2,1,149},
									[5]	= {"Ho�ng Kim ��i Ng�n Phi�u", 2, 2,1,30490},
									[6]	= {"H�a Th� B�ch", 2, 2,1,1001},
								}

	local t_pet_type = {
									[1] = {"Th� tr�ng",3333,24},
									[2] = {"Th� x�m",3333,25},
									[3] = {"Th� �en",3334,26},		
								}		
		-----------------x�a v�t ph�m: lo�i 1 l� l�m nv b�nh thu�ng, lo�i 2 l� h� tr� nhanh
		if nType == 1 then
				for i = 1, getn(tCheck_item) do
					if GetItemCount(tCheck_item[i][3], tCheck_item[i][4], tCheck_item[i][5]) < tCheck_item[i][2] then
						Talk(1, "", "��i hi�p kh�ng mang �� "..tCheck_item[i][2].." "..tCheck_item[i][1])
						return 0
					end
				end	
				for i = 1, getn(tCheck_item) do
					if DelItem(tCheck_item[i][3], tCheck_item[i][4], tCheck_item[i][5], tCheck_item[i][2]) ~= 1 then
						gf_WriteLogEx("PHUC SINH PET", "X�a th�t b�i", 1, "X�a th�t b�i"..tCheck_item[i][1])
						return 0
					end
				end	
				local nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10) --task nhi�m v� giai �o�n 1
				if nGetQuest == 2 then 
					SetTask(TSK_PET_PS_GIAIDOAN_B, GetTask(TSK_PET_PS_GIAIDOAN_B) + 1) --t�ng b��c nhi�m v� l�n gi� tr� 3 l� ho�n th�nh xong giai �o�n 2
					gf_WriteLogEx("PHUC SINH PET", "xong giai �o�n 2", 1, "Ho�n th�nh Giai �o�n 2")
				end
		end
		if nType == 2 then
				if GetItemCount(2,1,30490) < 39 then
					Talk(1, "", "��i hi�p kh�ng mang �� 39 Ho�ng Kim ��i Ng�n Phi�u.")
					return 0	
				end
				if GetCash() < 39000000 then
					Talk(1, "", "��i hi�p kh�ng mang �� 3900 v�ng.")
					return 0	
				end
				if DelItem(2,1,30490,39) ~= 1 then
						gf_WriteLogEx("PHUC SINH PET", "X�a th�t b�i", 1, "X�a th�t b�i khi h� tr� nhanh")
						return 0
				end
				gf_WriteLogEx("PHUC SINH PET", "ho�n th�nh nhanh", 1, "H� tr� nhanh")	
				Pay(39000000)		
			SetTask(TSK_PET_PS_GIAIDOAN_A, 1601600000)
			SetTask(TSK_PET_PS_GIAIDOAN_B, 330303013)
		end	
		------------------------------
		local nIsPS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10) --mod 10 l� gi� tr� x�c ��nh c� Ph�c Sinh PET 
		nIsPS = (nIsPS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
		SetTask(TSK_PET_PS_GIAIDOAN_B, nIsPS) --set gi� tr� x�c ��nh c� Ph�c Sinh PET
		-------------
		local nCount_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10)
		nCount_PET_PS = (nCount_PET_PS +1) *10 + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10) 
		SetTask(TSK_PET_PS_GIAIDOAN_A, nCount_PET_PS) --set gi� tr� x�c ��nh s� l�n Ph�c Sinh PET
		-------------
		local nNewValue =  SetBytePos(GetTask(TSK_PET_PS_GIAIDOAN_A),nWay,4)
		SetTask(TSK_PET_PS_GIAIDOAN_A, nNewValue ) -- set h��ng Ph�c Sinh c�a PET
		-------------Set c�c ch� s� buff
		local nAttrId = 2908130 --29/08/13 + x
		for i = 1, getn(tNoiNgoai[nWay]) do
			CastState(tNoiNgoai[nWay][i][2], tNoiNgoai[nWay][i][3], -1, 1, nAttrId);
			nAttrId = nAttrId + 1;
		end		
		------------- add PET m�i
		local nRand = gf_GetRandItemByTable(t_pet_type,10000,1)
		local nNewType = t_pet_type[nRand][3]
		local nResult = AddPet(nNewType)
		if nResult >= 0 then
			Msg2Player("Ch�c m�ng ��i hi�p �� chi�u m� PET th�nh c�ng")
		else
			gf_WriteLogEx("PHUC SINH PET BK", "add th�t b�i", 1, "Add pet th�t b�i")			
		end
		-------------
		Msg2Player("Ch�c m�ng ��i hi�p �� ho�n th�nh nhi�m v� Ph�c Sinh cho B�n ��ng H�nh !!!!")		
		gf_WriteLogEx("PHUC SINH PET BK", "xong giai �o�n 2", 1, "Ho�n th�nh Giai �o�n buff")			
end
function support_finish_quest_PhucSinh_BDH()
	if GetItemCount(2,1,30490) < 39 then
		Talk(1, "", "��i hi�p kh�ng mang �� 39 Ho�ng Kim ��i Ng�n Phi�u.")
		return 0	
	end
	if GetCash() < 39000000 then
		Talk(1, "", "��i hi�p kh�ng mang �� 3900 v�ng.")
		return 0	
	end
	support_finish_quest2_PhucSinh_BDH()
end
function support_finish_quest2_PhucSinh_BDH()
	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nLinhLuc = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	if nLinhLuc < 200 then	--nPetLevel < 4 or 
		Talk(1,"","B�n ��ng h�nh ch�a ��t c�p 4 ho�c �i�m linh l�c kh�ng �� 200 �i�m")
		return 
	end
--	local tbDieuKien = {nPetLinhluc = 999}
--	local nCheck = LIB_Award:CheckMaterial(tbDieuKien)
--	if nCheck == 0 then
--		return 0
--	end
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.." ��i hi�p h�y ch�n h��ng Ph�c Sinh cho B�n ��ng H�nh c�a m�nh."
	tinsert(tSay, "H� tr� h� N�i C�ng/#add_buff(2,1)")
	tinsert(tSay, "H� tr� h� Ngo�i C�ng/#add_buff(2,2)")
	tinsert(tSay, "Ta ch� gh� qua th�i/do_nothing")
	Say(tHeader, getn(tSay), tSay)	
end	
function get_more_pet(nType)
	do return 0 end
	
	local t_pet_type = {
									[1] = {"Th� tr�ng",3333,24},
									[2] = {"Th� x�m",3333,25},
									[3] = {"Th� �en",3334,26},		
								}		
	local tCheck = {
							[1] = {150, 0},
							[2] = {0, 490}						
						}
	if GetItemCount(2,1,30230) < tCheck[nType][1] then
		Talk(1, "", "��i hi�p kh�ng mang theo �� 150 xu v�t ph�m.")
		return
	end	
	if GetCash() < tCheck[nType][2]*10000 then
		Talk(1, "", "��i hi�p kh�ng mang theo �� 490 v�ng.")
		return
	end	
	
	local nRand = gf_GetRandItemByTable(t_pet_type,10000,1)
	local nNewType = t_pet_type[nRand][3]
	local nResult = AddPet(nNewType)
	if nResult >= 0 then
		DelItem(2,1,30230,tCheck[nType][1])
		Pay(tCheck[nType][2]*10000)
		Msg2Player("Ch�c m�ng ��i hi�p �� chi�u m� PET th�nh c�ng")
		gf_WriteLogEx("PHUC SINH PET", "mua th�nh c�ng", 1, "Mua PET th�nh c�ng")
		if nType == 1 then
			WriteLogEx("LOG XU VAT PHAM","PET - Mua b�ng 150 xu")	
			gf_WriteLogEx("PHUC SINH PET", "mua th�nh c�ng", 1, "Mua b�ng 150 xu")		
		else
			WriteLogEx("PHUC SINH PET","PET - Mua b�ng 490 v�ng")			
		end
	else
		Talk(1, "", "��i hi�p �ang c� qu� nhi�u B�n ��ng h�nh, n�n kh�ng th� chi�u m� th�m ���c n�a")
		gf_WriteLogEx("PHUC SINH PET BK", "mua th�t b�i", 1, "Mua pet th�t b�i")			
	end
end
function show_quest1_PhucSinh_BDH()
	local nActive_CT_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/100),100)
	local nActive_TA_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10000),100)
	local nActive_TL_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/1000000),100)
	local nActive_LD_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/100000000),100)
	local nActive_BNN_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10000),1000)
	local nActive_CTL_PET_PS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10000000),1000)
	Talk(1,"","Ti�n �� th�c hi�n nhi�m v� !!!! \nC�y T� Linh: <color=red>"..nActive_CTL_PET_PS.."/160<color> \nB�t Nh� Nh�: <color=red>"..nActive_BNN_PET_PS.."/160<color> \nC�ng T�: <color=red>"..nActive_CT_PET_PS.."/30<color> \nTr� An: <color=red>"..nActive_TA_PET_PS.."/30<color> \nTh�y L�i: <color=red>"..nActive_TL_PET_PS.."/30<color> \nLuy�n ��n: <color=red>"..nActive_LD_PET_PS.."/3<color>")
end


function NhanKhuatNguyenBoi_Free()
	if  gf_GetTaskBit(TSK_XOA_KHUATNGUYENBOI,1) ~= 1 then
		return 0
	end
	if gf_GetTaskBit(TSK_XOA_KHUATNGUYENBOI,2) ~= 0 then
		return 0
	end
	if gf_Judge_Room_Weight(2, 200, "") == 0 then				
		return 0
	end
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + GetPlayerRebornParam(0)
	if nChuyenSinh < 5 then
		return 0
	end
	
	gf_SetTaskBit(TSK_XOA_KHUATNGUYENBOI, 2, 1, 0)
	gf_AddItemEx2({0,102,27,1,4,-1,-1,-1,-1,-1,-1},"Khu�t Nguy�n B�i","NHAN LAI KHUAT NGUYEN BOI","nh�n",30*24*3600,1)
end

function use_phucsinhdon()
	local tbSay = {}
	local szTitle = format("��t chuy�n sinh 6 c�p 99, ti�u hao 1 Ph�c Sinh ��n, %d %s, c� th� t�ng l�n chuy�n sinh 7 c�p 10.", fsd_taiyihunyuan[5], fsd_taiyihunyuan[1])
	tinsert(tbSay, "��ng � s� d�ng/use_phucsinhdon_01")
	tinsert(tbSay, format("%s/nothing", "Ra kh�i"))
	Say(szTitle, getn(tbSay), tbSay)
end

function use_phucsinhdon_01()
	if GetItemCount(2,1,30814) < 1 then
		Talk(1,"","C�c h� kh�ng c� ph�c sinh ��n tr�n ng��i!")
		return
	end
	
	if get_trans_level() ~= 699 then
		Talk(1,"","Ch� c� chuy�n sinh 6 c�p 99 m�i ���c d�ng Ph�c Sinh ��n!")
		return 0
	end
	if GetItemCount(fsd_taiyihunyuan[2], fsd_taiyihunyuan[3], fsd_taiyihunyuan[4]) < fsd_taiyihunyuan[5] then
		Talk(1, "", format("%s kh�ng �� %d", fsd_taiyihunyuan[1], fsd_taiyihunyuan[5]))
		return 0
	end
	
	gf_WriteLogEx("SuDungPhucSinhDon", "S� d�ng ph�c sinh ��n th�nh c�ng", 1, "S� d�ng ph�c sinh ��n th�nh c�ng")
	
	local tHeader = szNpcName.."C�c h� h�y ch�n h��ng ph�c sinh!"
	local tSay = {}
	tinsert(tSay, "Ph�c sinh theo h��ng Long T�/#phucsinh2(1)")			
	tinsert(tSay, "Ph�c sinh theo h��ng H� T�/#phucsinh2(2)")			
	tinsert(tSay, "Ph�c sinh theo h��ng Ph�ng T�/#phucsinh2(4)")			
	tinsert(tSay, "Ph�c sinh theo h��ng �ng T�/#phucsinh2(3)")		
	tinsert(tSay, "Ta ch�a mu�n Ph�c Sinh/nothing")		
	Say(tHeader, getn(tSay), tSay)	
	
end

function phucsinh2(nType)
	if DelItem(2,1,30814,1) ~= 1 then
		return 
	end
	
	if DelItem(fsd_taiyihunyuan[2], fsd_taiyihunyuan[3], fsd_taiyihunyuan[4], fsd_taiyihunyuan[5])~= 1 then
		return 0
	end
			
		local tb_translife_seal_cs7 = {
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
	local nPhucSinh_Count = GetPlayerRebornParam(0) 
	local nRoute = GetPlayerRoute()
	local tbType = {"Long T�", "H� T�", "�ng T�", "Ph�ng T�"}
	local nType_cs6 = GetPlayerRebornParam(1)
	if nType_cs6 < 0 or nType_cs6 > 4 then
		Msg2Player("�� x�y ra l�i")
		gf_WriteLogEx("LOI API", "ghi nh�n th�nh c�ng", 1, "L�i API chuy�n sinh 7")	
		return
	end
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
	--------------------
	local nExp = GetExp()
	big_del_exp(nExp)
	--------------------
	
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	

--	local nTransCount = GetTranslifeCount()	
		for i=1, getn(tb_translife_cloth_PS[nType_cs6]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_PS[nType_cs6][i][2])
			P = P + GetBody() - 1
--			lvatt3 = lvatt3 or 0
--			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"T� Linh Vi�t Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end

--	RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	

	local tbVanSu = {"V�n S� ngo�i trang",0,108,570,188}
	local nPVanSu = tbVanSu[4]  + GetBody() - 1
	for i = 0, 2 do
		BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
	end
	gf_AddItemEx(tb_translife_seal_cs7[nType][2], tb_translife_seal_cs7[nType][1])
	gf_AddItemEx2({0, 105, 10107, 1, 4, -1, -1, -1, -1, -1, -1},"Th�t tinh ki�m", "That tinh kiem","mien phi 7 ngay",7*24*3600)
	PlayerReborn(2,nType) -- Chuy�n Sinh 7 th�nh c�ng (Ph�c Sinh 2)
	RemoveTitle(61,05)
	AddTitle(61,06)
	PhucSinh2_Award_SetStatus()
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
 	gf_WriteLogEx("CHUYEN SINH 7", "chuy�n sinh th�nh c�ng", 1, "Finish nv chuy�n Sinh 6 npc 2")	
	Msg2Player("Ch�c m�ng ��i hi�p �� Ph�c Sinh th�nh c�ng theo h��ng "..tbType[nType])
	local szTitle = format("Ch�c m�ng b�n ��t chuy�n sinh 7 c�p 10, h�y ��ng nh�p l�i!")
	local tbSay = {}
	tinsert(tbSay, format("%s/fsd_offline", "��ng nh�p l�i"))
	Say(szTitle, getn(tbSay), tbSay)

end

function fsd_offline()
	ExitGame()
end

function do_nothing()

end

function finish_reborn3()
	local tHeader = szNpcName.."C�c h� h�y ch�n c�ch ph�c sinh!"
	local tSay = {}
	tinsert(tSay, "Nh�n v�t Ph�c Sinh c�p 99/#finish_reborn3_level(1)")			
	tinsert(tSay, "Nh�n v�t Ph�c Sinh c�p 98/#finish_reborn3_level(2)")
	tinsert(tSay, "Nh�n v�t Ph�c Sinh c�p 97/#finish_reborn3_level(3)")			
	tinsert(tSay, "Ta ch�a mu�n Ph�c Sinh/nothing")		
	Say(tHeader, getn(tSay), tSay)	
end

function finish_reborn3_level(nlevel)
	local nCondition = condition_reborn3(nlevel)
	if nCondition ~= 1 then
		return 0
	end
	local tHeader = szNpcName.."C�c h� h�y ch�n h��ng ph�c sinh!"
	local tSay = {}
	tinsert(tSay, "Ph�c sinh theo h��ng Long T�/#phucsinh3(1,"..nlevel..")")			
	tinsert(tSay, "Ph�c sinh theo h��ng H� T�/#phucsinh3(2,"..nlevel..")")		
	tinsert(tSay, "Ph�c sinh theo h��ng Ph�ng T�/#phucsinh3(4,"..nlevel..")")		
	tinsert(tSay, "Ph�c sinh theo h��ng �ng T�/#phucsinh3(3,"..nlevel..")")		
	tinsert(tSay, "Ta ch�a mu�n Ph�c Sinh/nothing")		
	Say(tHeader, getn(tSay), tSay)			
end
function phucsinh3(nType,nlevel)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
	local nCondition = condition_reborn3(nlevel)
	if nCondition ~= 1 then
		return 0
	end
		local tb_translife_seal_cs7 = {
							{"Long T� �n",{2,0,30002,1,1}, "Long T�"},
							{"H� T� �n",{2,0,30003,1,1}, "H� T�"},
							{"�ng T� �n",{2,0,30006,1,1}, "�ng T�"},
							{"Ph�ng T� �n",{2,0,30005,1,1}, "Ph�ng T�"},							
					}
					
	local nPhucSinh_Count = GetPlayerRebornParam(0) 
	local nRoute = GetPlayerRoute()
	local tbType = {"Long T�", "H� T�", "�ng T�", "Ph�ng T�"}
	local nType_cs7 = GetPlayerRebornParam(1)
	if nType_cs7 < 0 or nType_cs7 > 4 then
		Msg2Player("�� x�y ra l�i")
		gf_WriteLogEx("LOI API", "ghi nh�n th�nh c�ng", 1, "L�i API chuy�n sinh 7")	
		return
	end
	--------------------
	local nExp = GetExp()
	big_del_exp(nExp)
	if DelItem(2,1,30862,GetItemCount(2,1,30862)) ~= 1 then
		return 0
	end
	local big_del_check = delItem_reborn3(nlevel)
	if big_del_check ~= 1 then
		return 0
	end
	--------------------
	
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	--============	
	local nBody = GetBody()	
	for i=1, getn(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody]) do
		local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody][i])
		--P = P + GetBody() - 1
		lvatt3 = lvatt3 or 0
		att3 = att3 or 0
		BigDelItem(G,D,P,BigGetItemCount(G,D,P))
	end	
	--=========
--	RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	

	local tbVanSu = {"V�n S� ngo�i trang",0,108,570,188}
	local nPVanSu = tbVanSu[4]  + GetBody() - 1
	for i = 0, 2 do
		BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
	end
	gf_AddItemEx(tb_translife_seal_cs7[nType][2], tb_translife_seal_cs7[nType][1])
	--gf_AddItemEx2({0, 105, 10107, 1, 4, -1, -1, -1, -1, -1, -1},"Th�t tinh ki�m", "That tinh kiem","mien phi 7 ngay",7*24*3600)
	PlayerReborn(3,nType) -- Chuy�n Sinh 8 th�nh c�ng (Ph�c Sinh 3)
	RemoveTitle(61,6)
	AddTitle(71,1)
	PhucSinh2_Award_SetStatus()
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
 	gf_WriteLogEx("PHUC SINH 3 ", "ph�c sinh th�nh c�ng", 1, "Ho�n th�nh ph�c sinh 3")	
	Msg2Player("Ch�c m�ng ��i hi�p �� Ph�c Sinh th�nh c�ng theo h��ng "..tbType[nType])
	local nName = GetName()
	AddGlobalNews("Ch�c m�ng Thi�u Hi�p <color=green>"..nName.."<color> �� tr� th�nh C�u Ng� Ch� T�n trong thi�n h�.",1)
	Msg2Global("Ch�c m�ng Thi�u Hi�p "..nName.." �� tr� th�nh C�u Ng� Ch� T�n trong thi�n h�.")
	local szTitle = format("Ch�c m�ng b�n ��t Ph�c Sinh 3 c�p 10, h�y ��ng nh�p l�i!")
	local tbSay = {}
	tinsert(tbSay, format("%s/fsd_offline", "��ng nh�p l�i"))
	Say(szTitle, getn(tbSay), tbSay)
end

function condition_reborn3(nlevel)
	local tbCondition = 
				{--level, Ph�c Sinh ��n, Th�n T�i B�o R��ng, Th�i D�ch, kinh nghi�m
					[1] = {99, {2,1,30814},0, {2,1,30344},0,   {2,0,1083},4, 20000000000},
					[2] = {98, {2,1,30814},1, {2,1,30344},4,   {2,0,1083},4, 0  },
					[3] = {97, {2,1,30814},2, {2,1,30344},10, {2,0,1083},4, 0  },
				}	
	local tbSex = 
				{"Ch�ng trai tr�",
				 "C� g�i xinh ��p",	
				}
	local nSex = GetSex()
	if GetItemCount(2,1,30862) < 1 then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> ch�a c� th� ti�n c� n�n ta kh�ng th� gi�p b�n Ph�c Sinh ���c.")
		return 0
	end
	if GetLevel() ~= tbCondition[nlevel][1] then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> h�y Ph�c Sinh theo ��ng ��ng c�p c�a m�nh.")
		return 0
	end	
	if MeridianGetLevel() < 4 then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> ch�a ��t c�nh gi�i V� T�n.")
		return 0
	end
	if GetPlayerRebornParam(0) < 2 then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> ch�a ho�n th�nh Ph�c Sinh 2.")
		return 0
	end
	if GetExp() < tbCondition[nlevel][8] then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> ch�a �� 20 t� kinh nghi�m �� th�c hi�n Ph�c Sinh.")
		return 0
	end
	if GetItemCount(tbCondition[nlevel][2][1],tbCondition[nlevel][2][2],tbCondition[nlevel][2][3]) < tbCondition[nlevel][3] then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> kh�ng mang �� "..tbCondition[nlevel][3].." Ph�c Sinh ��n.")
		return 0
	end
	if GetItemCount(tbCondition[nlevel][4][1],tbCondition[nlevel][4][2],tbCondition[nlevel][4][3]) < tbCondition[nlevel][5] then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> kh�ng mang �� "..tbCondition[nlevel][5].." Th�n T�i B�o R��ng.")
		return 0
	end	
	if GetItemCount(tbCondition[nlevel][6][1],tbCondition[nlevel][6][2],tbCondition[nlevel][6][3]) < tbCondition[nlevel][7] then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> kh�ng mang �� "..tbCondition[nlevel][7].." Th�i D�ch H�n Nguy�n C�ng Ph�.")
		return 0
	end
	return 1
end
function delItem_reborn3(nlevel)
		local tbCondition = 
				{--Ph�c Sinh ��n, Th�n T�i B�o R��ng, Th�i D�ch
					[1] = {{2,1,30814},0, {2,1,30344},0,   {2,0,1083},4},
					[2] = {{2,1,30814},1, {2,1,30344},4,   {2,0,1083},4},
					[3] = {{2,1,30814},2, {2,1,30344},10, {2,0,1083},4},
				}	
		if DelItem(tbCondition[nlevel][1][1],tbCondition[nlevel][1][2],tbCondition[nlevel][1][3],tbCondition[nlevel][2]) ~= 1 then
			return 0
		end
		if DelItem(tbCondition[nlevel][3][1],tbCondition[nlevel][3][2],tbCondition[nlevel][3][3],tbCondition[nlevel][4]) ~= 1 then
			return 0
		end
		if DelItem(tbCondition[nlevel][5][1],tbCondition[nlevel][5][2],tbCondition[nlevel][5][3],tbCondition[nlevel][6]) ~= 1 then
			return 0
		end
		return 1
end
function finish_reborn4()
	local tHeader = szNpcName.."C�c h� h�y ch�n c�ch ph�c sinh!"
	local tSay = {}
	tinsert(tSay, "Nh�n v�t �ang Ph�c Sinh 3 c�p 99/#finish_reborn4_level(1)")			
	tinsert(tSay, "Nh�n v�t �ang Ph�c Sinh 3 c�p 98/#finish_reborn4_level(2)")
	tinsert(tSay, "Nh�n v�t �ang Ph�c Sinh 3 c�p 97/#finish_reborn4_level(3)")			
	tinsert(tSay, "Ta ch�a mu�n Ph�c Sinh/nothing")		
	Say(tHeader, getn(tSay), tSay)	
end
function finish_reborn4_level(nlevel)
	local nCondition = condition_reborn4(nlevel)
	if nCondition ~= 1 then
		return 0
	end
	local tHeader = szNpcName.."C�c h� h�y ch�n h��ng ph�c sinh!"
	local tSay = {}
	tinsert(tSay, "Ph�c sinh theo h��ng Long T�/#phucsinh4(1,"..nlevel..")")			
	tinsert(tSay, "Ph�c sinh theo h��ng H� T�/#phucsinh4(2,"..nlevel..")")		
	tinsert(tSay, "Ph�c sinh theo h��ng Ph�ng T�/#phucsinh4(4,"..nlevel..")")		
	tinsert(tSay, "Ph�c sinh theo h��ng �ng T�/#phucsinh4(3,"..nlevel..")")		
	tinsert(tSay, "Ta ch�a mu�n Ph�c Sinh/nothing")		
	Say(tHeader, getn(tSay), tSay)			
end
function phucsinh4(nType,nlevel)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
	local nCondition = condition_reborn4(nlevel)
	if nCondition ~= 1 then
		return 0
	end
		local tb_translife_seal_cs8 = {
							{"Long T� �n",{2,0,30002,1,1}, "Long T�"},
							{"H� T� �n",{2,0,30003,1,1}, "H� T�"},
							{"�ng T� �n",{2,0,30006,1,1}, "�ng T�"},
							{"Ph�ng T� �n",{2,0,30005,1,1}, "Ph�ng T�"},							
					}
					
	local nPhucSinh_Count = GetPlayerRebornParam(0) 
	local nRoute = GetPlayerRoute()
	local tbType = {"Long T�", "H� T�", "�ng T�", "Ph�ng T�"}
	local nType_cs8 = GetPlayerRebornParam(1)
	if nType_cs8 < 0 or nType_cs8 > 4 then
		Msg2Player("�� x�y ra l�i")
		gf_WriteLogEx("LOI API", "ghi nh�n th�nh c�ng", 1, "L�i API chuy�n sinh 8")	
		return
	end
	--------------------
	local nExp = GetExp()
	big_del_exp(nExp)
	if DelItem(2,1,31117,GetItemCount(2,1,31117)) ~= 1 then
		return 0
	end
	local big_del_check = delItem_reborn4(nlevel)
	if big_del_check ~= 1 then
		return 0
	end
	--------------------
	
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	--============	
	local nBody = GetBody()	
	for i=1, getn(tb_translife_cloth_cs8_nhanlai[nType_cs8][nBody]) do
		local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs8_nhanlai[nType_cs8][nBody][i])
		--P = P + GetBody() - 1
		lvatt3 = lvatt3 or 0
		att3 = att3 or 0
		BigDelItem(G,D,P,BigGetItemCount(G,D,P))
	end	
	--=========
--	RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	

	local tbVanSu = {"V�n S� ngo�i trang",0,108,570,188}
	local nPVanSu = tbVanSu[4]  + GetBody() - 1
	for i = 0, 2 do
		BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
	end
	gf_AddItemEx(tb_translife_seal_cs8[nType][2], tb_translife_seal_cs8[nType][1])
	gf_AddItemEx2({0, 105, 30056, 1, 4, -1, -1, -1, -1, -1, -1},"Long M�", "Long Ma","mien phi 7 ngay",30*24*3600)
	PlayerReborn(4,nType) -- Chuy�n Sinh 9 th�nh c�ng (Ph�c Sinh 4)
	RemoveTitle(71,1)
	AddTitle(73,1)
--	PhucSinh2_Award_SetStatus()
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
 	gf_WriteLogEx("PHUC SINH 4 ", "ph�c sinh th�nh c�ng", 1, "Ho�n th�nh ph�c sinh 4")	
	Msg2Player("Ch�c m�ng ��i hi�p �� Ph�c Sinh 4 th�nh c�ng theo h��ng "..tbType[nType])
	local nName = GetName()
	AddGlobalNews("Ch�c m�ng Thi�u Hi�p <color=green>"..nName.."<color> �� tr� th�nh C�u Ng� Ch� T�n trong thi�n h�.",1)
	Msg2Global("Ch�c m�ng Thi�u Hi�p "..nName.." �� tr� th�nh C�u Ng� Ch� T�n trong thi�n h�.")
	local szTitle = format("Ch�c m�ng b�n ��t Ph�c Sinh 4 c�p 10, h�y ��ng nh�p l�i!")
	local tbSay = {}
	tinsert(tbSay, format("%s/fsd_offline", "��ng nh�p l�i"))
	Say(szTitle, getn(tbSay), tbSay)
end

function condition_reborn4(nlevel)
	local tbCondition = 
				{--level, Ph�c Sinh ��n, Th�n T�i B�o R��ng, Th�i D�ch, kinh nghi�m
					[1] = {99, {2,1,30814},0, {2,1,30344},0,   {2,0,1083},6, 20000000000},
					[2] = {98, {2,1,30814},3, {2,1,30344},4,   {2,0,1083},6, 0  },
					[3] = {97, {2,1,30814},6, {2,1,30344},10, {2,0,1083},6, 0  },
				}	
	local tbSex = 
				{"Ch�ng trai tr�",
				 "C� g�i xinh ��p",	
				}
	local nSex = GetSex()
	if GetItemCount(2,1,31117) < 1 then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> ch�a c� th� ti�n c� n�n ta kh�ng th� gi�p b�n Ph�c Sinh ���c.")
		return 0
	end
	if GetLevel() ~= tbCondition[nlevel][1] then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> h�y Ph�c Sinh theo ��ng ��ng c�p c�a m�nh.")
		return 0
	end	
	if MeridianGetLevel() < 5 then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> ch�a ��t c�nh gi�i V� Ho�ng.")
		return 0
	end
	if GetPlayerRebornParam(0) < 3 then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> ch�a ho�n th�nh Ph�c Sinh 3.")
		return 0
	end
	if GetExp() < tbCondition[nlevel][8] then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> ch�a �� 20 t� kinh nghi�m �� th�c hi�n Ph�c Sinh.")
		return 0
	end
	if GetItemCount(tbCondition[nlevel][2][1],tbCondition[nlevel][2][2],tbCondition[nlevel][2][3]) < tbCondition[nlevel][3] then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> kh�ng mang �� "..tbCondition[nlevel][3].." Ph�c Sinh ��n.")
		return 0
	end
	if GetItemCount(tbCondition[nlevel][4][1],tbCondition[nlevel][4][2],tbCondition[nlevel][4][3]) < tbCondition[nlevel][5] then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> kh�ng mang �� "..tbCondition[nlevel][5].." Th�n T�i B�o R��ng.")
		return 0
	end	
	if GetItemCount(tbCondition[nlevel][6][1],tbCondition[nlevel][6][2],tbCondition[nlevel][6][3]) < tbCondition[nlevel][7] then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> kh�ng mang �� "..tbCondition[nlevel][7].." Th�i D�ch H�n Nguy�n C�ng Ph�.")
		return 0
	end
	return 1
end
function delItem_reborn4(nlevel)
		local tbCondition = 
				{--Ph�c Sinh ��n, Th�n T�i B�o R��ng, Th�i D�ch
					[1] = {{2,1,30814},0, {2,1,30344},0,   {2,0,1083},6},
					[2] = {{2,1,30814},3, {2,1,30344},4,   {2,0,1083},6},
					[3] = {{2,1,30814},6, {2,1,30344},10, {2,0,1083},6},
				}	
		if DelItem(tbCondition[nlevel][1][1],tbCondition[nlevel][1][2],tbCondition[nlevel][1][3],tbCondition[nlevel][2]) ~= 1 then
			return 0
		end
		if DelItem(tbCondition[nlevel][3][1],tbCondition[nlevel][3][2],tbCondition[nlevel][3][3],tbCondition[nlevel][4]) ~= 1 then
			return 0
		end
		if DelItem(tbCondition[nlevel][5][1],tbCondition[nlevel][5][2],tbCondition[nlevel][5][3],tbCondition[nlevel][6]) ~= 1 then
			return 0
		end
		return 1
end
--****************************** Ph�c Sinh 5 ************
function finish_reborn5()
	local tHeader = szNpcName.."C�c h� h�y ch�n c�ch ph�c sinh!"
	local tSay = {}
	tinsert(tSay, "Nh�n v�t �ang Ph�c Sinh 4 c�p 99/#finish_reborn5_level(1)")			
	tinsert(tSay, "Nh�n v�t �ang Ph�c Sinh 4 c�p 98/#finish_reborn5_level(2)")
	tinsert(tSay, "Nh�n v�t �ang Ph�c Sinh 4 c�p 97/#finish_reborn5_level(3)")			
	tinsert(tSay, "Ta ch�a mu�n Ph�c Sinh/nothing")		
	Say(tHeader, getn(tSay), tSay)	
end
function finish_reborn5_level(nlevel)
	local nCondition = condition_reborn5(nlevel)
	if nCondition ~= 1 then
		return 0
	end
	local tHeader = szNpcName.."C�c h� h�y ch�n h��ng ph�c sinh!"
	local tSay = {}
	tinsert(tSay, "Ph�c sinh theo h��ng Long T�/#phucsinh5(1,"..nlevel..")")			
	tinsert(tSay, "Ph�c sinh theo h��ng H� T�/#phucsinh5(2,"..nlevel..")")		
	tinsert(tSay, "Ph�c sinh theo h��ng Ph�ng T�/#phucsinh5(4,"..nlevel..")")		
	tinsert(tSay, "Ph�c sinh theo h��ng �ng T�/#phucsinh5(3,"..nlevel..")")		
	tinsert(tSay, "Ta ch�a mu�n Ph�c Sinh/nothing")		
	Say(tHeader, getn(tSay), tSay)			
end
function phucsinh5(nType,nlevel)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
	local nCondition = condition_reborn5(nlevel)
	if nCondition ~= 1 then
		return 0
	end
		local tb_translife_seal_cs9 = {
							{"Long T� �n",{2,0,30002,1,1}, "Long T�"},
							{"H� T� �n",{2,0,30003,1,1}, "H� T�"},
							{"�ng T� �n",{2,0,30006,1,1}, "�ng T�"},
							{"Ph�ng T� �n",{2,0,30005,1,1}, "Ph�ng T�"},							
					}
					
	local nPhucSinh_Count = GetPlayerRebornParam(0) 
	local nRoute = GetPlayerRoute()
	local tbType = {"Long T�", "H� T�", "�ng T�", "Ph�ng T�"}
	local nType_cs9 = GetPlayerRebornParam(1)
	if nType_cs9 < 0 or nType_cs9 > 5 then
		Msg2Player("�� x�y ra l�i")
		gf_WriteLogEx("LOI API", "ghi nh�n th�nh c�ng", 1, "L�i API chuy�n sinh 9")	
		return
	end
	--------------------
	local nExp = GetExp()
	big_del_exp(nExp)
	if DelItem(2,0,31010,GetItemCount(2,0,31010)) ~= 1 then
		return 0
	end
	local big_del_check = delItem_reborn5(nlevel)
	if big_del_check ~= 1 then
		return 0
	end
	--------------------
	
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	--============	
	local nBody = GetBody()	
	local nTypePS = GetPlayerRebornParam(1)
	for i=1, getn(tb_translife_cloth_cs9_nhanlai[nBody]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth_cs9_nhanlai[nBody][i])
			--P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
		end		
		for i=1, getn(t_translife_uanlinh_cs_ps[4][nTypePS]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(t_translife_uanlinh_cs_ps[4][nTypePS][i])
			--P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
		end	
	--=========
--	RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	

	local tbVanSu = {"V�n S� ngo�i trang",0,108,570,188}
	local nPVanSu = tbVanSu[4]  + GetBody() - 1
	for i = 0, 2 do
		BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
	end
	gf_AddItemEx(tb_translife_seal_cs9[nType][2], tb_translife_seal_cs9[nType][1])
	gf_AddItemEx2({0, 105, 163, 1, 4, -1, -1, -1, -1, -1, -1},"Tuyet Ho", "Cuu Vi Tuyet Ho","mien phi 7 ngay",30*24*3600)
	PlayerReborn(5,nType) -- Chuy�n Sinh 10 th�nh c�ng (Ph�c Sinh 5)
	RemoveTitle(73,1)
	AddTitle(76,1)
--	PhucSinh2_Award_SetStatus()
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
 	gf_WriteLogEx("PHUC SINH 4 ", "ph�c sinh th�nh c�ng", 1, "Ho�n th�nh ph�c sinh 4")	
	Msg2Player("Ch�c m�ng ��i hi�p �� Ph�c Sinh 5 th�nh c�ng theo h��ng "..tbType[nType])
	local nName = GetName()
	AddGlobalNews("Ch�c m�ng Thi�u Hi�p <color=green>"..nName.."<color> �� tr� th�nh C�u Ng� Ch� T�n trong thi�n h�.",1)
	Msg2Global("Ch�c m�ng Thi�u Hi�p "..nName.." �� tr� th�nh C�u Ng� Ch� T�n trong thi�n h�.")
	local szTitle = format("Ch�c m�ng b�n ��t Ph�c Sinh 5 c�p 10, h�y ��ng nh�p l�i!")
	local tbSay = {}
	tinsert(tbSay, format("%s/fsd_offline", "��ng nh�p l�i"))
	Say(szTitle, getn(tbSay), tbSay)
end

function condition_reborn5(nlevel)
	local tbCondition = 
				{--level, Ph�c Sinh ��n, Th�n T�i B�o R��ng, Th�i D�ch, kinh nghi�m
					[1] = {99, {2,1,30814},3, {2,1,30344},0,   {2,0,1083},6, 20000000000},
					[2] = {98, {2,1,30814},6, {2,1,30344},4,   {2,0,1083},6, 0  },
					[3] = {97, {2,1,30814},8, {2,1,30344},8,	 {2,0,1083},6, 0  },
				}	
	local tbSex = 
				{"Ch�ng trai tr�",
				 "C� g�i xinh ��p",	
				}
	local nSex = GetSex()
	if GetItemCount(2,0,31010) < 1 then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> ch�a c� th� ti�n c� n�n ta kh�ng th� gi�p b�n Ph�c Sinh ���c.")
		return 0
	end
	if GetLevel() ~= tbCondition[nlevel][1] then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> h�y Ph�c Sinh theo ��ng ��ng c�p c�a m�nh.")
		return 0
	end	
--	if MeridianGetLevel() < 5 then
--		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> ch�a ��t c�nh gi�i V� Ho�ng.")
--		return 0
--	end
	if GetPlayerRebornParam(0) < 4 then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> ch�a ho�n th�nh Ph�c Sinh 4.")
		return 0
	end
	if GetExp() < tbCondition[nlevel][8] then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> ch�a �� 20 t� kinh nghi�m �� th�c hi�n Ph�c Sinh.")
		return 0
	end
	if GetItemCount(tbCondition[nlevel][2][1],tbCondition[nlevel][2][2],tbCondition[nlevel][2][3]) < tbCondition[nlevel][3] then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> kh�ng mang �� "..tbCondition[nlevel][3].." Ph�c Sinh ��n.")
		return 0
	end
	if GetItemCount(tbCondition[nlevel][4][1],tbCondition[nlevel][4][2],tbCondition[nlevel][4][3]) < tbCondition[nlevel][5] then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> kh�ng mang �� "..tbCondition[nlevel][5].." Th�n T�i B�o R��ng.")
		return 0
	end	
	if GetItemCount(tbCondition[nlevel][6][1],tbCondition[nlevel][6][2],tbCondition[nlevel][6][3]) < tbCondition[nlevel][7] then
		Talk(1, "", "<color=green>"..tbSex[nSex].."<color> kh�ng mang �� "..tbCondition[nlevel][7].." Th�i D�ch H�n Nguy�n C�ng Ph�.")
		return 0
	end
	return 1
end
function delItem_reborn5(nlevel)
		local tbCondition = 
				{--Ph�c Sinh ��n, Th�n T�i B�o R��ng, Th�i D�ch
					[1] = {{2,1,30814},3, {2,1,30344},0,   {2,0,1083},6},
					[2] = {{2,1,30814},6, {2,1,30344},4,   {2,0,1083},6},
					[3] = {{2,1,30814},8, {2,1,30344},8, {2,0,1083},6},
				}	
		if DelItem(tbCondition[nlevel][1][1],tbCondition[nlevel][1][2],tbCondition[nlevel][1][3],tbCondition[nlevel][2]) ~= 1 then
			return 0
		end
		if DelItem(tbCondition[nlevel][3][1],tbCondition[nlevel][3][2],tbCondition[nlevel][3][3],tbCondition[nlevel][4]) ~= 1 then
			return 0
		end
		if DelItem(tbCondition[nlevel][5][1],tbCondition[nlevel][5][2],tbCondition[nlevel][5][3],tbCondition[nlevel][6]) ~= 1 then
			return 0
		end
		return 1
end

function _vng_UpdateKinhMach()
	local tbSay = {};
	tinsert(tbSay, "Ta mu�n k�ch ho�t c�nh gi�i V� T�n/#confirm_vng_UpdateKinhMach(1)")	
	tinsert(tbSay, "Ta mu�n k�ch ho�t c�nh gi�i V� Ho�ng/#confirm_vng_UpdateKinhMach(2)")
	tinsert(tbSay, "T�m th�i ta ch�a mu�n luy�n/do_nothing")
	Say("<color=green>B�c ��u L�o Nh�n: <color> L�o phu c� th� gi�p thi�u hi�p k�ch ho�t khai th�ng kinh m�ch, nh�ng �� k�ch ho�t c�nh gi�i kh�c nhau c� y�u c�u ti�u hao kh�c nhau, thi�u h�p c�n khai th�ng c�nh gi�i n�o?",getn(tbSay),tbSay);
end

function confirm_vng_UpdateKinhMach(nType)
	local tbSay = {};
	local tHeader = "<color=green>K�ch ho�t V� T�n c�n : <color>��t c�nh gi�i V� V��ng, Tr�ng Sinh 6 c�p 90, ti�u hao 3 ��i ng�n phi�u. "	
	if nType == 2 then
		tHeader = "<color=green>K�ch ho�t V� Ho�ng c�n : <color>��t c�nh gi�i V� T�n, Tr�ng Sinh 6 c�p 90, ti�u hao 5 ��i ng�n phi�u, 1 thi�n cang l�nh, 1 thi�n m�n kim l�nh."
	end	
	tinsert(tbSay, "Ta ��ng �/#finish_vng_UpdateKinhMach("..nType..")")	
	tinsert(tbSay, "�� ta suy ngh� th�m/do_nothing")
	Say(tHeader, getn(tbSay), tbSay)
end

function finish_vng_UpdateKinhMach(nType)
	local tCondition = {--kinh m�ch, ��i ng�n phi�u, thi�n cang l�nh, thi�n m�n kim l�nh
						[1] = {3, 3, 0, 0, "V� T�n",},
						[2] = {4, 5, 1, 1, "V� Ho�ng",},
					}
					
	local nCountMe = MeridianGetLevel()
	local nCountCS = gf_GetPlayerRebornCount()*100 + GetLevel()
	if nCountMe ~= tCondition[nType][1] then
		Talk(1,"", "C�nh gi�i Kinh M�ch c�a ��i hi�p kh�ng ph� h�p.")
		return 0
	end
	if nCountCS < 690 then
		Talk(1,"", "C�nh gi�i Chuy�n Sinh c�a ��i hi�p kh�ng �� Chuy�n sinh 6 c�p 90.")
		return 0
	end
	if GetItemCount(2,1,199) < tCondition[nType][2] then
		Talk(1,"", "��i hi�p kh�ng mang �� ��i Ng�n Phi�u.")
		return 0
	end
	if GetItemCount(2,95,204) < tCondition[nType][3] then
		Talk(1,"", "��i hi�p kh�ng mang �� Thi�n Cang L�nh.")
		return 0
	end
	if GetItemCount(2,1,30370) < tCondition[nType][4] then
		Talk(1,"", "��i hi�p kh�ng mang �� Thi�n M�n Kim L�nh.")
		return 0
	end
	if DelItem(2,1,199,tCondition[nType][2]) == 1 and DelItem(2,95,204,tCondition[nType][3]) == 1 and DelItem(2,1,30370,tCondition[nType][4]) == 1 then
		MeridianUpdateLevel()
		Talk(1,"", "Ch�c m�ng ��i hi�p k�ch ho�t c�nh gi�i "..tCondition[nType][5].." th�nh c�ng.")
		gf_WriteLogEx("KINH MACH 34 ", "k�ch ho�t kinh m�ch th�nh c�ng", 1, "Ho�n th�nh kinh m�ch lo�i "..tCondition[nType][1])	
	end
	
end
function lan2_pet_phucsinh()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local nIsPS_lan1 = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10)
	local nIsPS_lan2 = floor(GetTask(TSK_PET_PSLAN2_TASK_1)/1000000000)
	if nIsPS_lan1 < 1 then
		Talk(1,"", szNpcName.."H�y ph�c sinh B�n ��ng H�nh c�a ��i hi�p l�n 1 xong r�i h�y ��n g�p ta !!!!")
		return 0
	end
	if nIsPS_lan2 >= 1 then
		Talk(1,"", szNpcName.."B�n ��ng h�nh c�a ��i hi�p �� ph�c sinh l�n 2 r�i, �� qu� m�nh r�i !!!!")
		return 0
	end
	
	local nLan2_GetQuest = floor(GetTask(TSK_PET_PSLAN2_TASK_2)/1000000000)
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local tSay = {}
	local tHeader = szNpcName.."B�n ��ng h�nh sau khi ���c Ph�c Sinh l�n 2 r�t m�nh m�, c�c h� c� mu�n th�c hi�n Ph�c Sinh cho B�n ��ng h�nh kh�ng?"

	if nLan2_GetQuest == 0 then
		tinsert(tSay, "Nh�n nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh/lan2_get_quest_PhucSinh_BDH")
	end
	if nLan2_GetQuest == 1 then
		tHeader = szNpcName.." <color=red>\n- Ho�n th�nh nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh c�n : <color>"
						.."\n	 Tr�ng th�nh c�ng 160 b�t nh� nh�, 240 c�y h�t gi�ng, 320 c�y t� linh"
						.."\n	 S� d�ng th�nh c�ng 999 n� oa b�o h�p, 160 ng�i sao may m�n, 600 ph�o hoa"
						.."\n	 C�n: 20 TMKL, 20 TCL, 1 CTVC�, 3900 v�ng"
						.." <color=red>\n- H� tr� ho�n th�nh nhanh nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh c�n : <color>"
						.."\n	 C�n: 25 TMKL, 25 TCL, 2 CTVC�, 4900 v�ng"
		tinsert(tSay, "Ho�n th�nh nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh/lan2_finish_quest_PhucSinh_BDH")
		tinsert(tSay, "H� tr� ho�n th�nh nhanh nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh/lan2_fast_finish_quest_PhucSinh_BDH")
		tinsert(tSay, "Xem s� l��ng nhi�m v� �� ho�n th�nh/lan2_showquest_PhucSinh_BDH")
	end
	
	--##################	
	tinsert(tSay, "Ta ch� gh� qua th�i/do_nothing")
	Say(tHeader, getn(tSay), tSay)	
	
end
function lan2_get_quest_PhucSinh_BDH()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local nLan2_GetQuest = floor(GetTask(TSK_PET_PSLAN2_TASK_2)/1000000000)
	if nLan2_GetQuest == 0 then
		VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_2, 1, 10, 10)	 --t�ng b��c nhi�m v� l�n gi� tr� 1 l� nh�n nhi�m v�
		gf_WriteLogEx("PHUC SINH PET LAN 2", "nh�n nhi�m v�", 1, "Nh�n nv PS Pet l�n 2")
		Msg2Player("��i hi�p �� nh�n nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh !!!!")
		Talk(1,"", szNpcName.."��i hi�p �� nh�n nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh !!!!")
	end
end
function lan2_finish_quest_PhucSinh_BDH()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local nIsPS_lan2 = floor(GetTask(TSK_PET_PSLAN2_TASK_1)/1000000000)
	local nLan2_GetQuest = floor(GetTask(TSK_PET_PSLAN2_TASK_2)/1000000000)
	if nLan2_GetQuest >= 2 then
		Talk(1,"", szNpcName.."��i hi�p �� ho�n th�nh nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh !!!!")
		return 0
	elseif nLan2_GetQuest < 1 then
		Talk(1,"", szNpcName.."��i hi�p ch�a nh�n nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh !!!!")
		return 0	
	end
	if nIsPS_lan2 >= 1 then
		Talk(1,"", szNpcName.."B�n ��ng h�nh c�a ��i hi�p �� ph�c sinh l�n 2, �� qu� m�nh r�i !!!!")
		return 0
	end
--################################	
--	TSK_PET_PSLAN2_TASK_1 	--a111222333: a (x�c ��nh c� PS); 111 (160 BNN); 222(240 h�t gi�ng); 333(320 t� linh)
--	TSK_PET_PSLAN2_TASK_2	--a111222333: a (x�c ��nh nh�n nv PS); 111 (999 n� oa); 222 (160 ng�i sao); 333 (600 ph�o hoa)
	local nCheck_BNN = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_1,9,7)	
	local nCheck_HatGiong = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_1,6,4)
	local nCheck_TuLinh = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_1,3,1)
	local nCheck_NuOa = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_2,9,7)
	local nCheck_NgoiSao = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_2,6,4)
	local nCheck_PhaoHoa = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_2,3,1)
	if nCheck_BNN < 160 then
		Talk(1,"", szNpcName.."��i hi�p ch�a tr�ng th�nh c�ng 160 c�y b�t nh� nh� !!!!")
		return 0
	end
	if nCheck_HatGiong < 240 then
		Talk(1,"", szNpcName.."��i hi�p ch�a tr�ng th�nh c�ng 240 h�t gi�ng !!!!")
		return 0
	end
	if nCheck_TuLinh < 320 then
		Talk(1,"", szNpcName.."��i hi�p ch�a tr�ng th�nh c�ng 320 c�y t� linh !!!!")
		return 0
	end
	if nCheck_NuOa < 999 then
		Talk(1,"", szNpcName.."��i hi�p ch�a s� d�ng th�nh c�ng 999 n� oa b�o h�p !!!!")
		return 0
	end
	if nCheck_NgoiSao < 160 then
		Talk(1,"", szNpcName.."��i hi�p ch�a s� d�ng th�nh c�ng 160 ng�i sao may m�n !!!!")
		return 0
	end
	if nCheck_PhaoHoa < 600 then
		Talk(1,"", szNpcName.."��i hi�p ch�a s� d�ng th�nh c�ng 600 ph�o hoa chi�n th�ng !!!!")
		return 0
	end
--################################
	local nCheck_TMKL = GetItemCount(2,1,30370)
	local nCheck_TCL = GetItemCount(2,95,204)
	local nCheck_CTVCD = GetItemCount(2,1,1006)
	local nCheck_Cost = GetCash()
	if nCheck_TMKL < 20 then
		Talk(1,"", szNpcName.."��i hi�p kh�ng mang �� 20 Thi�n M�n Kim L�nh !!!!")
		return 0
	end
	if nCheck_TCL < 20 then
		Talk(1,"", szNpcName.."��i hi�p kh�ng mang �� 20 Thi�n Cang L�nh !!!!")
		return 0
	end
	if nCheck_CTVCD < 1 then
		Talk(1,"", szNpcName.."��i hi�p kh�ng mang �� 1 C�u Thi�n V� C�c ��n !!!!")
		return 0
	end
	if nCheck_Cost < 39000000 then
		Talk(1,"", szNpcName.."��i hi�p kh�ng mang �� 3900 v�ng !!!!")
		return 0
	end
--##############################	
	if DelItem(2,1,30370,20) == 1 and DelItem(2,95,204,20) == 1 and DelItem(2,1,1006,1) == 1 and Pay(39000000) == 1 then
		VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_1, 1, 10, 10)	 --t�ng b��c nhi�m v� l�n gi� tr� 1 l� �� ph�c sinh pet l�n 2 th�nh c�ng 
		VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_2, 2, 10, 10)	 --t�ng b��c nhi�m v� l�n gi� tr� 2 l� ho�n th�nh chu�i nhi�m v�
		AddTitle(77, 1)	--title ph�c sinh b�n ��ng h�nh l�n 2
		gf_WriteLogEx("PHUC SINH PET LAN 2", "Ho�n th�nh PS Pet l�n 2", 1, "Ho�n th�nh nv PS Pet l�n 2")
		Msg2Player("��i hi�p ho�n th�nh nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh th�nh c�ng !!!!")
		Talk(1,"", szNpcName.."Ch�c m�ng ��i hi�p, B�n ��ng H�nh c�a ��i hi�p �� Ph�c Sinh l�n 2 th�nh c�ng. Ta �� t�n r�t nhi�u s�c l�c, ta ph�i �i ngh� ng�i ��y !!!!")
	end
	
end
function lan2_fast_finish_quest_PhucSinh_BDH()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local nIsPS_lan2 = floor(GetTask(TSK_PET_PSLAN2_TASK_1)/1000000000)
	local nLan2_GetQuest = floor(GetTask(TSK_PET_PSLAN2_TASK_2)/1000000000)
	if nLan2_GetQuest >= 2 then
		Talk(1,"", szNpcName.."��i hi�p �� ho�n th�nh nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh !!!!")
		return 0
	elseif nLan2_GetQuest < 1 then
		Talk(1,"", szNpcName.."��i hi�p ch�a nh�n nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh !!!!")
		return 0	
	end
	if nIsPS_lan2 >= 1 then
		Talk(1,"", szNpcName.."B�n ��ng h�nh c�a ��i hi�p �� ph�c sinh l�n 2, �� qu� m�nh r�i !!!!")
		return 0
	end
--################################
	local nCheck_TMKL = GetItemCount(2,1,30370)
	local nCheck_TCL = GetItemCount(2,95,204)
	local nCheck_CTVCD = GetItemCount(2,1,1006)
	local nCheck_Cost = GetCash()
	if nCheck_TMKL < 25 then
		Talk(1,"", szNpcName.."��i hi�p kh�ng mang �� 25 Thi�n M�n Kim L�nh !!!!")
		return 0
	end
	if nCheck_TCL < 25 then
		Talk(1,"", szNpcName.."��i hi�p kh�ng mang �� 25 Thi�n Cang L�nh !!!!")
		return 0
	end
	if nCheck_CTVCD < 2 then
		Talk(1,"", szNpcName.."��i hi�p kh�ng mang �� 2 C�u Thi�n V� C�c ��n !!!!")
		return 0
	end
	if nCheck_Cost < 49000000 then
		Talk(1,"", szNpcName.."��i hi�p kh�ng mang �� 4900 v�ng !!!!")
		return 0
	end
--##############################	
	if DelItem(2,1,30370,25) == 1 and DelItem(2,95,204,25) == 1 and DelItem(2,1,1006,2) == 1 and Pay(49000000) == 1 then
		VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_1, 1, 10, 10)	 --t�ng b��c nhi�m v� l�n gi� tr� 1 l� �� ph�c sinh pet l�n 2 th�nh c�ng 
		VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_2, 2, 10, 10)	 --t�ng b��c nhi�m v� l�n gi� tr� 2 l� ho�n th�nh chu�i nhi�m v�
		AddTitle(77, 1)	--title ph�c sinh b�n ��ng h�nh l�n 2
		gf_WriteLogEx("PHUC SINH PET LAN 2", "Ho�n th�nh nhanh PS Pet l�n 2", 1, "Ho�n th�nh nhanh nv PS Pet l�n 2")
		Msg2Player("��i hi�p ho�n th�nh nhanh nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh th�nh c�ng !!!!")
		Talk(1,"", szNpcName.."Ch�c m�ng ��i hi�p, B�n ��ng H�nh c�a ��i hi�p �� Ph�c Sinh l�n 2 th�nh c�ng. Ta �� t�n r�t nhi�u s�c l�c, ta ph�i �i ngh� ng�i ��y !!!!")
	end
end
function lan2_set_quest_PhucSinh_BDH(nType)
--	TSK_PET_PSLAN2_TASK_1 	--a111222333: a (x�c ��nh c� PS); 111 (160 BNN); 222(240 h�t gi�ng); 333(320 t� linh)
--	TSK_PET_PSLAN2_TASK_2	--a111222333: a (x�c ��nh nh�n nv PS); 111 (999 n� oa); 222 (160 ng�i sao); 333 (600 ph�o hoa)
--	nType = 1 (160 BNN) - nCheck_BNN
--	nType = 2 (240 h�t gi�ng) - nCheck_HatGiong
--	nType = 3 (320 t� linh) - nCheck_TuLinh
--	nType = 4 (999 n� oa) - nCheck_NuOa
--	nType = 5 (160 ng�i sao) - nCheck_NgoiSao
--	nType = 6 (600 ph�o hoa) - nCheck_PhaoHoa
	local nLan2_GetQuest = floor(GetTask(TSK_PET_PSLAN2_TASK_2)/1000000000)
	if nLan2_GetQuest >= 2 then
--		Talk(1,"", "��i hi�p �� ho�n th�nh nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh !!!!")
		return 0
	elseif nLan2_GetQuest < 1 then
--		Talk(1,"", "��i hi�p ch�a nh�n nhi�m v� Ph�c Sinh l�n 2 cho B�n ��ng H�nh !!!!")
		return 0	
	end
--#########################
	local nCheck_BNN = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_1,9,7)	
	local nCheck_HatGiong = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_1,6,4)
	local nCheck_TuLinh = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_1,3,1)
	local nCheck_NuOa = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_2,9,7)
	local nCheck_NgoiSao = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_2,6,4)
	local nCheck_PhaoHoa = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_2,3,1)
	if nType == 1 and nCheck_BNN < 160 then
		VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_1, nCheck_BNN + 1, 9, 7)	
	elseif nType == 2 and nCheck_HatGiong < 240 then
		VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_1, nCheck_HatGiong + 1, 6, 4)	
	elseif nType == 3 and nCheck_TuLinh < 320 then
		VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_1, nCheck_TuLinh + 1, 3, 1)	
	elseif nType == 4 and nCheck_NuOa < 999 then
		VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_2, nCheck_NuOa + 1, 9, 7)	
	elseif nType == 5 and nCheck_NgoiSao < 160 then
		VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_2, nCheck_NgoiSao + 1, 6, 4)	
	elseif nType == 6 and nCheck_PhaoHoa < 600 then
		VNG_SetTaskPos(TSK_PET_PSLAN2_TASK_2, nCheck_PhaoHoa + 1, 3, 1)	
	end
end
function lan2_showquest_PhucSinh_BDH()
	local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
	local nCheck_BNN = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_1,9,7)	
	local nCheck_HatGiong = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_1,6,4)
	local nCheck_TuLinh = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_1,3,1)
	local nCheck_NuOa = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_2,9,7)
	local nCheck_NgoiSao = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_2,6,4)
	local nCheck_PhaoHoa = VNG_GetTaskPos(TSK_PET_PSLAN2_TASK_2,3,1)
	local sColor = "green"
	local sColor1 = "red"
	local sColor2 = "red"
	local sColor3 = "red"
	local sColor4 = "red"
	local sColor5 = "red"
	local sColor6 = "red"
	if nCheck_BNN == 160 then
		sColor1 = sColor
	end
	if nCheck_HatGiong == 240 then
		sColor2 = sColor
	end
	if nCheck_TuLinh == 320 then
		sColor3 = sColor
	end
	if nCheck_NuOa == 999 then
		sColor4 = sColor
	end
	if nCheck_NgoiSao == 160 then
		sColor5 = sColor
	end
	if nCheck_PhaoHoa == 600 then
		sColor6 = sColor
	end
	Talk(1,"",szNpcName.."Ti�n �� th�c hi�n nhi�m v� !!!! \nB�t Nh� Nh�: <color="..sColor1..">"..nCheck_BNN.."/160<color> \nH�t Gi�ng: <color="..sColor2..">"..nCheck_HatGiong.."/240<color> \nC�y T� Linh: <color="..sColor3..">"..nCheck_TuLinh.."/320<color> \nS� d�ng N� Oa B�o H�p: <color="..sColor4..">"..nCheck_NuOa.."/999<color> \nS� d�ng Ng�i Sao May M�n: <color="..sColor5..">"..nCheck_NgoiSao.."/160<color> \nS� d�ng Ph�o Hoa: <color="..sColor6..">"..nCheck_PhaoHoa.."/600<color>")
end
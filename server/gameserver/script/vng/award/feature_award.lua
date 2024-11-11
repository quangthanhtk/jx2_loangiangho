Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\chitonvuonglenh\\chitonvuonglenh_head.lua");
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\sinhtuvonga\\sinhtuvonga_core.lua");
Include("\\script\\vng\\sinhtuvonga\\sinhtuvonga.lua");
Include("\\script\\vng\\weapon_upgrade\\viemde2thienchiviemde.lua");
Include("\\script\\vng\\book15\\book15_head.lua");
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua");
Include("\\script\\online\\plant\\tree_head.lua");
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua")
----script KS
Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")
Import("\\script\\task_access_code_def.lua")
----
Include("\\script\\online\\olympic\\oly_head.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

--Award cho  B�t nh� nh�
function ThuHoachBatNhaNho()
	--============nhi�m v� Book15
	book15_DailyMissionComplete(4)
	vaf_award_api("tPlantSmallTreePrize") --2xu
	local nExp = 25000000
	ModifyExp(nExp)
	Msg2Player("B�n nh�n ���c 25000000 �i�m kinh nghi�m")
	local t_thuhoach_batnhanho = {
								{2, 5500, 2500000},
								{1, 2000, "B�t nh� ch�ng th�", {2, 1, 30114, 1},7 * 24 * 3600},
								{1, 500, "t�i �� qu� c�p 1", {2, 1, 30998, 1}},
								{1, 200, "H�i ti�n ��n", {2,1,30847, 1}},
								{1, 600, "Kinh m�ch ��ng nh�n", {2, 1, 30730, 1}},
								{1, 200, "Kinh m�ch ng�n nh�n", {2, 1, 30731, 1}},
								{1, 500, "T� linh ho�n", {2, 1, 30458, 1}},
								{1, 100, "T� linh quy�t", {2, 1, 31248, 1}},
								{1, 150, "T�y t�m th�ch", {2, 1, 30526, 1}},
								{1, 150, "Luy�n L� Thi�t", {2, 1, 30532, 1}},
								{1, 100, "Qu�n c�ng huy ho�ng", {2,1,9977, 1},7 * 24 * 3600},
								
							}
	gf_EventGiveRandAward(t_thuhoach_batnhanho,10000,1,"THU HOACH BAT NHA NHO","thu ho�ch b�t nh� nh�")
	--================Nhi�m v� tr�ng c�y th�ng 4/2015=====================
	local nDate = tonumber(date("%Y%m%d"))
	local nHour = tonumber(date("%H"))
	if nDate >= 20150426 and nDate <= 20150430 then
		if nHour >= 21 then
			if gf_GetTaskByte(TSK_NHIEMVUTRONGCAY,3) == 1 then
				local nThuHoach = gf_GetTaskByte(TSK_NHIEMVUTRONGCAY,2)
				gf_SetTaskByte(TSK_NHIEMVUTRONGCAY,2,nThuHoach+1)
			end			
		end
	end
	--=============== Chu�i nhi�m v� Ph�c Sinh PET l�n 2=====================================================
	lan2_set_quest_PhucSinh_BDH(1)
	--=============== Chu�i nhi�m v� Ph�c Sinh 2 ===================
--	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 9 and PhucSinh2_GetMissionPart() > 0 then
--		PhucSinh2_SetMissionPart()
--	end
	--=============== Sinh Tu Vo Nga =========================
--	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
--		STVN_SubMissionComplete(2)
--	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	--=============== Chi Ton Vuong Lenh New=========================
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 1 or ChiTonNew_GetStep() == 2 or ChiTonNew_GetStep() == 4 or ChiTonNew_GetStep() == 10 then
			ChiTonNew_SetMissionPart(1)
		end
	end
	--=======	
end

function KichHoatBatNhaNho()
--	STVN3_LamNhiemVu(2)	--h�t h�n ng�y 11/10/2015
--	nhiemvuVBonus(2) --nhi�m v� VBonus 07/2014
--	VBonus_BatNhaNho()
	ModifyReputation(2,0)
	SetTask(336,GetTask(336)+2)
	Msg2Player("B�n nh�n ���c 2 �i�m S� m�n !")
	local nExp = 2500000
	ModifyExp(nExp)
	Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m!")
	local nExpChanKhi = 100
	AwardGenuineQi(nExpChanKhi)
	gf_WriteLogEx("DA THONG KINH MACH", "��i th�nh c�ng", nExpChanKhi, "�i�m ch�n kh� B�t nh� nh�")			
	gf_WriteLogEx("KICH HOAT BAT NHA NHO 13/5/2013", "kick ho�t th�nh c�ng", 1, "K�ch ho�t  B�t nh� nh�")
	-- chu�i nhi�m v� Ph�c Sinh PET
	local nActive_BNN_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10000) --l�y s� l�n k�ch ho�t b�t nh� nh� c�a Pet Ph�c Sinh
	if mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10) == 1 then
		if mod(nActive_BNN_PET_PS,1000) < 160 then
			nActive_BNN_PET_PS = (nActive_BNN_PET_PS + 1) * 10000 -- c�ng 1 khi k�ch ho�t th�nh c�ng
			nActive_BNN_PET_PS = nActive_BNN_PET_PS + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10000) --c�ng v�o nguy�n task
			SetTask(TSK_PET_PS_GIAIDOAN_A, nActive_BNN_PET_PS) --set l�i to�n b� task
			gf_WriteLogEx("PHUC SINH PET", "kick ho�t th�nh c�ng", 1, "K�ch ho�t  B�t nh� nh�")
		end
	end
 	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 29 or CTVL_GetDailyMission() == 30 or CTVL_GetDailyMission() == 31 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	---------	 
--	ChiTonNew_ExpBonus(300000)
end

function KichHoatBatNhaTo()
--	STVN3_LamNhiemVu(9)	--h�t h�n ng�y 11/10/2015
	local nDate = tonumber(date("%Y%m%d"))
--	if GetTask(TASK_PLAN_BIGTREE_COUNT) == 16 and nDate <= 20151130 then
--		FireEvent("event_mission_task_award","planttree","plantbigtree",16)
--		gf_AddItemEx2({2,1,30928 , 50}, "T�i Th�m ��c bi�t", "Ho�t ��ng th�ng 10/2015", "Thu ho�ch 16 B�t nh� to",0,1)
--	end
end

--Award cho  H�t Gi�ng
function ThuHoachHatGiong()
	--============nhi�m v� Book15
	book15_DailyMissionComplete(3)
	local nDate = tonumber(date("%y%m%d"))
	vaf_award_api("tPlantSeedTree") --2XU
	local nExp = 25000000
	ModifyExp(nExp)
	Msg2Player("B�n nh�n ���c 30000000 �i�m kinh nghi�m")
	local t_thuhoach_hatgiong = {
								{2, 5500, 3000000},
								{1, 2000, "B�t nh� ch�ng th�", {2, 1, 30114, 1},7 * 24 * 3600},
								{1, 500, "t�i �� qu� c�p 1", {2, 1, 30998, 1}},
								{1, 200, "H�i ti�n ��n", {2,1,30847, 1}},
								{1, 500, "Kinh m�ch ��ng nh�n", {2, 1, 30730, 1}},
								{1, 200, "Kinh m�ch ng�n nh�n", {2, 1, 30731, 1}},
								{1, 500, "T� linh ho�n", {2, 1, 30458, 1}},
								{1, 100, "T� linh quy�t", {2, 1, 31248, 1}},
								{1, 150, "T�y t�m th�ch", {2, 1, 30526, 1}},
								{1, 150, "Luy�n L� Thi�t", {2, 1, 30532, 1}},
								{1, 200, "Qu�n c�ng huy ho�ng", {2,1,9977, 1},7 * 24 * 3600},
							}
	gf_EventGiveRandAward(t_thuhoach_hatgiong,10000,1,"THU HOACH HAT GIONG","thu ho�ch h�t gi�ng")
--	STVN3_LamNhiemVu(3)	--h�t h�n ng�y 11/10/2015
--	nhiemvuVBonus(1) --nhi�m v� VBonus 07/2014
	
	if nDate >= 130524 and nDate <=130613 then		
			gf_AddItemEx2({2,1,30512 , 100}, "Nguy�n li�u Event ", "MAT LANH NGAY HE THANG 5", "Thu ho�ch h�t gi�ng")
	end
	--=============== Chu�i nhi�m v� Ph�c Sinh PET l�n 2=====================================================
	lan2_set_quest_PhucSinh_BDH(2)
	--=============== Chu�i nhi�m v� Ph�c Sinh 2 ====================
--	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 7 and PhucSinh2_GetMissionPart() > 0 then
--		PhucSinh2_SetMissionPart()
--	end

	--=============== Sinh Tu Vo Nga =========================
--	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
--		STVN_SubMissionComplete(3)
--	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	--=============== Chi Ton Vuong Lenh New=========================
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 1 or ChiTonNew_GetStep() == 4 then
			ChiTonNew_SetMissionPart(2)
		elseif ChiTonNew_GetStep() == 3 or ChiTonNew_GetStep() == 15 or ChiTonNew_GetStep() == 17 then
			ChiTonNew_SetMissionPart(1)
		end
	end
	--==========
end

function KichHoatHatGiong()
--	VBonus_HatGiong()
	ModifyReputation(2,0)
	SetTask(336,GetTask(336)+2)
	Msg2Player("B�n nh�n ���c 2 �i�m S� m�n !")
	local nExp = 3000000
	ModifyExp(nExp)
	Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m!")
	local nExpChanKhi = 150
	AwardGenuineQi(nExpChanKhi)
	gf_WriteLogEx("DA THONG KINH MACH", "��i th�nh c�ng", nExpChanKhi, "�i�m ch�n kh� h�t gi�ng")	
	gf_WriteLogEx("KICH HOAT HAT GIONG 13/5/2013", "kick ho�t th�nh c�ng", 1, "K�ch ho�t H�t gi�ng")
	 
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 26 or CTVL_GetDailyMission() == 27 or CTVL_GetDailyMission() == 28 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	---------	 
--	ChiTonNew_ExpBonus(300000)
	--============= Nhi�m v� ��i trang b� Vi�m �� ==================
	set_value_nv_nangcap(5)
	set_value_nv_nangcap(10)	
end

--Award cho  C�y T� Linh
function ThuHoachCayTuLinh()
	--============nhi�m v� Book15
	book15_DailyMissionComplete(6)
	local nExp = 35000000*10
	ModifyExp(nExp)
	Msg2Player("B�n nh�n ���c " .. nExp .. " �i�m kinh nghi�m");
	--local t_thuhoach_tulinh = {
	--							{2, 5500, 3500000},
	--							{1, 2000, "B�t nh� ch�ng th�", {2, 1, 30114, 1},7 * 24 * 3600},
	--							{1, 500, "t�i �� qu� c�p 1", {2, 1, 30998, 1}},
	--							{1, 200, "H�i ti�n ��n", {2,1,30847, 1}},
	--							{1, 500, "Kinh m�ch ��ng nh�n", {2, 1, 30730, 1}},
	--							{1, 200, "Kinh m�ch ng�n nh�n", {2, 1, 30731, 1}},
	--							{1, 500, "T� linh ho�n", {2, 1, 30458, 1}},
	--							{1, 100, "T� linh quy�t", {2, 1, 31248, 1}},
	--							{1, 150, "T�y t�m th�ch", {2, 1, 30526, 1}},
	--							{1, 150, "Luy�n L� Thi�t", {2, 1, 30532, 1}},
	--							{1, 200, "Qu�n c�ng huy ho�ng", {2,1,9977, 1},7 * 24 * 3600},
	--						}
	--gf_EventGiveRandAward(t_thuhoach_tulinh,10000,1,"THU HOACH TU LINH","thu ho�ch t� linh")
	--================Nhi�m v� tr�ng c�y th�ng 4/2015=====================
	local nDate = tonumber(date("%Y%m%d"))
	local nHour = tonumber(date("%H"))
	if nDate >= 20150426 and nDate <= 20150430 then
		if nHour >= 21 then
			if gf_GetTaskByte(TSK_NHIEMVUTRONGCAY,3) == 1 then
				local nThuHoach = gf_GetTaskByte(TSK_NHIEMVUTRONGCAY,1)
				gf_SetTaskByte(TSK_NHIEMVUTRONGCAY,1,nThuHoach+1)
			end
		end
	end
	--=============== Chu�i nhi�m v� Ph�c Sinh PET l�n 2=====================================================
	lan2_set_quest_PhucSinh_BDH(3)
	--=============== Chu�i nhi�m v� Ph�c Sinh 2 ==========================
--	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 13 and PhucSinh2_GetMissionPart() > 0 then
--		PhucSinh2_SetMissionPart()
--	end
	--=============== Sinh Tu Vo Nga =========================
--	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
--		STVN_SubMissionComplete(1)
--	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	if VietCheckEvent() == 1 then
		gf_AddItemEx2({2,1,30661 ,200}, "Nguy�n li�u Event", "Hoat dong thang 06 nam 2014", "ho�n th�nh tr�ng c�y T� Linh")
		Msg2Player("B�n nh�n ���c 200 Nguy�n Li�u Event")
	end		
	--=============== Chi Ton Vuong Lenh New=========================
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 1 then
			ChiTonNew_SetMissionPart(3)
		elseif ChiTonNew_GetStep() == 2 or ChiTonNew_GetStep() == 3 then
			ChiTonNew_SetMissionPart(2)
		elseif ChiTonNew_GetStep() == 9 or ChiTonNew_GetStep() == 13 then
			ChiTonNew_SetMissionPart(1)
		end
	end
	--===========
end

function KichHoatCayTuLinh()
--	STVN3_LamNhiemVu(1)	--h�t h�n ng�y 11/10/2015
--	nhiemvuVBonus(4) --nhi�m v� VBonus 07/2014
--	VBonus_CayTuLinh()
--	if GetTask(701) >= 0 then
--		SetTask(701,GetTask(701) + 10)
--	else
--		SetTask(701,GetTask(701) - 10)
--	end
--	Msg2Player("B�n nh�n ���c 10 �i�m c�ng tr�ng")
--	SetTask(707, GetTask(707)+ 200)
--	Msg2Player("B�n nh�n ���c 200 �i�m t�ch l�y")
    local nBonusExp = 3500000
	ModifyExp(nBonusExp)
	Msg2Player("B�n nh�n ���c "..nBonusExp.." �i�m kinh nghi�m!")
	ModifyReputation(4,0)
	SetTask(336,GetTask(336)+4)
	Msg2Player("B�n nh�n ���c 4 �i�m S� m�n !")
	local nExpChanKhi = 200
	AwardGenuineQi(nExpChanKhi)
	gf_WriteLogEx("DA THONG KINH MACH", "��i th�nh c�ng", nExpChanKhi, "�i�m ch�n kh� c�y T� Linh")		
	gf_WriteLogEx("KICH HOAT CAY TU LINH", "kick ho�t th�nh c�ng", 1, "K�ch ho�t C�y T� Linh")	
	local nDate = tonumber(date("%y%m%d"))
	--K�ch ho�t c�y t� linh th� 16
	if mod(GetTask(2651), 100) == 15 then -- and nDate <= 160731 then
		FireEvent("event_mission_task_award","planttree","plant4lingtree",16)
		--gf_AddItemEx2({2,1,30928 , 50}, "T�i Th�m ��c bi�t", "Ho�t ��ng th�ng 10/2015", "K�ch ho�t 16 c�y t� linh",0,1)
	end	
	
	-- chu�i nhi�m v� Ph�c Sinh PET
	local nActive_CTL_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10000000) --l�y s� l�n k�ch ho�t b�t nh� nh� c�a Pet Ph�c Sinh
	if mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10) == 1 then
		if mod(nActive_CTL_PET_PS,1000) < 160 then
			nActive_CTL_PET_PS = (nActive_CTL_PET_PS + 1) * 10000000 -- c�ng 1 khi k�ch ho�t th�nh c�ng
			nActive_CTL_PET_PS = nActive_CTL_PET_PS + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10000000) --c�ng v�o nguy�n task
			SetTask(TSK_PET_PS_GIAIDOAN_A, nActive_CTL_PET_PS) --set l�i to�n b� task
			gf_WriteLogEx("PHUC SINH PET", "kick ho�t th�nh c�ng", 1, "K�ch ho�t  c�y T� Linh")
		end
	end
 	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 32 or CTVL_GetDailyMission() == 33 or CTVL_GetDailyMission() == 34 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	---------	 	
--	ChiTonNew_ExpBonus(300000)
	--============= Nhi�m v� ��i trang b� Vi�m �� ==================
	set_value_nv_nangcap(4)
	set_value_nv_nangcap(9)	
end

--Award cho N� Oa B�o H�p
function Use_Award_NuOa()
	--Do b� bug s� d�ng v��t qu� s� l�n t� item n�n ph�t sinh th�m ch�n � ��y
	if WTASKID_USE_NUOA_DAILY == nil then
		print("Error, task WTASKID_USE_NUOA_DAILY is null", GetAccount(), GetName());
		return 0;
	end
	WTask:ResetDaily();
	local nMax = 200;
	if WTask:Get(WTASKID_USE_NUOA_DAILY) >= nMax or GetTask(VET_201003_01_TASK_USE_BAOHE_COUNT) > nMax then
		WNpc:Talk(format("�� nh�n t�i �a %d ph�n th��ng t� N� Oa B�o H�p, kh�ng th� nh�n th�m!", nMax));
		return 0;
	end
	WTask:Modify(WTASKID_USE_NUOA_DAILY, 1);
	
	local nExpBefore = WPlayer:GetExp();
	local nHonorBefore = WPlayer:GetHonor(1);
	local nPointBefore = WPlayer:GetBattlePoint();

--	STVN3_LamNhiemVu(5)	--h�t h�n ng�y 11/10/2015
--	nhiemvuVBonus(10) --nhi�m v� VBonus 07/2014
--	VBonus_NuOa()
  	local nExp = 8000000	--�i�m v�n may khai b�o b�n file g�c
  	ModifyExp(nExp)
	Msg2Player("B�n nh�n ���c 8.000.000 �i�m kinh nghi�m")
    local nExpChanKhi = 60
	AwardGenuineQi(nExpChanKhi)
	local nQuanCong = 220
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + nQuanCong)
	else
		SetTask(701,GetTask(701) - nQuanCong)
	end	
	Msg2Player("B�n nh�n ���c 220 �i�m c�ng tr�ng")

	WPlayerLog:WriteBattleLog("Use_Award_NuOa", "S� d�ng N� Oa B�o H�p", 0, "", nExpBefore, nExp, nHonorBefore, nQuanCong, nPointBefore, 0);

	--============nhi�m v� Book15
	book15_DailyMissionComplete(7)
	--=============== Chu�i nhi�m v� Ph�c Sinh PET l�n 2=====================================================
	lan2_set_quest_PhucSinh_BDH(4)

	--============= Chu�i nhi�m v� Ph�c Sinh 2 =====================
--	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 40 and PhucSinh2_GetMissionPart() > 0 then
--		PhucSinh2_SetMissionPart()
--	end
	
	do return 0 end
 	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 35 or CTVL_GetDailyMission() == 36 or CTVL_GetDailyMission() == 37 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	if ChiTonNew_CheckNewServer() == 1 then
		--------========== CTVL new server ==========
		if ChiTonNew_GetStep() == 1 then
			ChiTonNew_SetMissionPart(4)
		elseif ChiTonNew_GetStep() == 4 then
			ChiTonNew_SetMissionPart(3)
		elseif ChiTonNew_GetStep() == 13 or ChiTonNew_GetStep() == 17 then
			ChiTonNew_SetMissionPart(2)
		elseif ChiTonNew_GetStep() == 5 or ChiTonNew_GetStep() == 16 or ChiTonNew_GetStep() == 20 then
			ChiTonNew_SetMissionPart(1)
		end
	end
	---------
	ChiTonNew_ExpBonus(100000)
end

function Use_Award_NuOa_100()
	do return 0; end
	
	local tbAward = {--item ={
			--{gdp={2, 0, 553, 3}, name="��i Nh�n S�m", nExpired = 7*24*60*60},
			--{gdp={2, 0, 552, 3}, name="Ti�u Nh�n S�m", nExpired = 7*24*60*60},
			--{gdp={2, 0, 554, 3}, name="Tu Ch�n Y�u Quy�t", nExpired = 7*24*60*60},},
		nChankhi = 3000,
		nExp = 300000000,
		nGold = 160000,
		nPetExp = 50,
		nPetLinhluc = 20,
	}
	LIB_Award.szLogTitle = VET_201003_01_STR_LOG_TITLE
	LIB_Award.szLogAction = "Nh�n th�nh c�ng s� d�ng 100"
	LIB_Award:Award(tbAward)
	SetTask(2501, GetTask(2501) + 60) --b�ch c�u ho�n
	EatSanqin(1, 60) --tam thanh ho�n
	EatLiushen(1, 60) --l�c th�n ho�n
	SetTask(3105, GetTask(3105) + 60, 8)	--t� linh ho�n
	gf_Modify("ShiMen",350)
	gf_Modify("Rep",350)
	Msg2Player("B�n nh�n 1 gi� �y th�c: b�ch c�u ho�n, l�c th�n ho�n, t�m thanh ho�n, t� linh ho�n")
	
	local tAwardNuOa = {
					{1, 10000, "Qu�n c�ng ch��ng", {2, 1, 9999, 1}, 15*24*3600},
					{1, 50000, "Qu�n c�ng ��i", {2, 1, 9998, 1}, 15*24*3600},
					{1, 40000, "Qu�n c�ng huy ho�ng", {2, 1, 9977, 1}, 15*24*3600},
					}
	gf_EventGiveRandAward(tAwardNuOa, 100000, 1, "Su Dung 100 Nu Oa", "award ng�u nhi�n");				

--	Earn(300000)
--	gf_AddItemEx2({2, 0, 553, 3}, "��i Nh�n S�m", VET_201003_01_STR_LOG_TITLE, "Nh�n th�nh c�ng s� d�ng 100", 7*24*60*60)	
--	gf_AddItemEx2({2, 0, 552, 3}, "Ti�u Nh�n S�m", VET_201003_01_STR_LOG_TITLE, "Nh�n th�nh c�ng s� d�ng 100", 7*24*60*60)		
--	gf_AddItemEx2({2, 0, 554, 3}, "Tu Ch�n Y�u Quy�t", VET_201003_01_STR_LOG_TITLE, "Nh�n th�nh c�ng s� d�ng 100", 7*24*60*60)		
end

--Award cho Ng�i Sao May M�n
function Use_Award_NgoiSao()
	--Do b� bug s� d�ng v��t qu� s� l�n t� item n�n ph�t sinh th�m ch�n � ��y
	if WTASKID_USE_NGOISAO_DAILY == nil then
		print("Error, task WTASKID_USE_NGOISAO_DAILY is null", GetAccount(), GetName());
		return 0;
	end
	WTask:ResetDaily();
	local nMax = 32;
	if WTask:Get(WTASKID_USE_NGOISAO_DAILY) >= nMax  or mod(GetTask(TSK_LUCKY_STAR_201011), 100) > nMax then
		WNpc:Talk(format("�� nh�n t�i �a %d ph�n th��ng t� Ng�i Sao May M�n, kh�ng th� nh�n th�m!", nMax));
		return 0;
	end
	WTask:Modify(WTASKID_USE_NGOISAO_DAILY, 1);
	
	local nExpBefore = WPlayer:GetExp();
	local nHonorBefore = WPlayer:GetHonor(1);
	local nPointBefore = WPlayer:GetBattlePoint();

--	STVN3_LamNhiemVu(4)	--h�t h�n ng�y 11/10/2015
--	nhiemvuVBonus(9) --nhi�m v� VBonus 07/2014
	VBonus_LuckyStar()
	local tbAward = {
		nChankhi = 600,
--		nQuancong = 1000,
	}
	LIB_Award:Award(tbAward)
--    	local nExpChanKhi = 20
--	AwardGenuineQi(nExpChanKhi)
	local nQuanCong = 2200
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + nQuanCong)
	else
		SetTask(701,GetTask(701) - nQuanCong)
	end
	Msg2Player("B�n nh�n ���c 2200 �i�m c�ng tr�ng")

	WPlayerLog:WriteBattleLog("Use_Award_NgoiSao", "S� d�ng Ng�i Sao May M�n", 0, "", nExpBefore, 0, nHonorBefore, nQuanCong, nPointBefore, 0);

	--============nhi�m v� Book15
	book15_DailyMissionComplete(8)
	--=============== Chu�i nhi�m v� Ph�c Sinh PET l�n 2=====================================================
	lan2_set_quest_PhucSinh_BDH(5)
	
	--============= Chu�i nhi�m v� Ph�c Sinh 2 =====================
--	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 41 and PhucSinh2_GetMissionPart() > 0 then
--		PhucSinh2_SetMissionPart()
--	end	
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
 	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 38 or CTVL_GetDailyMission() == 39 or CTVL_GetDailyMission() == 40 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	--==================== Chi Ton Vuong Lenh NewServer ============
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 5 then
			ChiTonNew_SetMissionPart(3)
		elseif ChiTonNew_GetStep() == 9 then
			ChiTonNew_SetMissionPart(2)
--		elseif ChiTonNew_GetStep() == 13 then
--			ChiTonNew_SetMissionPart(4)
		elseif ChiTonNew_GetStep() == 14 or ChiTonNew_GetStep() == 19 then
			ChiTonNew_SetMissionPart(1)
		end
	end
	---------	 
	ChiTonNew_ExpBonus(300000)
end

function Use_Award_NgoiSao_16()
	do return 0; end
	
	local tbAward = {
		nChankhi = 5000,
		nExp = 400000000,
		nGold = 320000,
		nPetExp = 75,
		nPetLinhluc = 30,
	}
	LIB_Award:Award(tbAward)
	LIB_Award.szLogTitle = "Su dung 16 ngoi sao"
	LIB_Award.szLogAction = "nh�n"
	SetTask(2501, GetTask(2501) + 60) --b�ch c�u ho�n
	EatSanqin(1, 60) --tam thanh ho�n
	EatLiushen(1, 60) --l�c th�n ho�n
	SetTask(3105, GetTask(3105) + 60, 8)	--t� linh ho�n
	gf_Modify("ShiMen",500)
	gf_Modify("Rep",500)
	Msg2Player("B�n nh�n 1 gi� �y th�c: b�ch c�u ho�n, l�c th�n ho�n, t�m thanh ho�n, t� linh ho�n")
	local tAwardNuOa = {
					{1, 10000, "Qu�n c�ng ch��ng", {2, 1, 9999, 1}, 15*24*3600},
					{1, 50000, "Qu�n c�ng ��i", {2, 1, 9998, 1}, 15*24*3600},
					{1, 40000, "Qu�n c�ng huy ho�ng", {2, 1, 9977, 1}, 15*24*3600},
					}
	gf_EventGiveRandAward(tAwardNuOa, 100000, 1, "Su Dung 106 ngoi sao", "award ng�u nhi�n");
end


-- Th��ng t�ng �i Th�i H�
function ThaiHu_ThuongVuotAi()
	local tbAward1 = {
		[1] = {nCheckExp = 0, nExp = 2000000, nChankhi = 10},
		[2] = {nCheckExp = 0, nExp = 3000000, nChankhi = 20},
		[3] = {nCheckExp = 0, nExp = 3500000, nChankhi = 20},
		[4] = {nCheckExp = 0, nExp = 4000000, nChankhi = 20},
		[5] = {nCheckExp = 0, nExp = 4500000, nChankhi = 20},
		[6] = {nCheckExp = 0, nExp = 5000000, nChankhi = 30},
		[7] = {nDanhvong = 60, nSumon = 60, nChankhi = 40},
		[8] = {fn="RandThaiHuRing(8)", nExp = 7000000, nChankhi = 40},
	}
	local tbAward2 = {
		[1] = {nCheckExp = 0, nExp = 3000000, nChankhi = 15},
		[2] = {nCheckExp = 0, nExp = 4500000, nChankhi = 15},
		[3] = {nCheckExp = 0, nExp = 5250000, nChankhi = 25},
		[4] = {nCheckExp = 0, nExp = 6000000, nChankhi = 30},
		[5] = {nCheckExp = 0, nExp = 6750000, nChankhi = 30},
		[6] = {nCheckExp = 0, nExp = 7500000, nChankhi = 40},
		[7] = {nDanhvong = 90, nSumon = 90, nChankhi = 45},
		[8] = {fn="RandThaiHuRing(8)", nExp = 10500000,nChankhi = 50},
	}
	local nCountType = GetTaskTemp(104) -- S� l�n v��t �i
	LIB_Award.szLogTitle = "Thai Hu Huyen Canh"
	LIB_Award.szLogAction = "nh�n"
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local tbAward = tbAward1
		if mod(GetTask(TSK_THAIHU_DAY) ,100) > 1 then
			_vjw_SetTaixu()
			if VietCheckEvent() == 1 then
				--gf_AddItemEx2({2,1,30927 ,10}, "Nguy�n li�u Th�i H�", "Hoat dong thang 10 nam 2015", "ho�n th�nh nhi�m v� Th�i H� l�n 2 tr� l�n")
				--Msg2Player("B�n nh�n ���c 10 Nguy�n Li�u Event")
			end		
			--===== nhi�m v� Th�ng Ti�n Ph�c Sinh
			if TTPS_GetStatus() == 1 then
				VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,1,6,6)
			end
			----------------------------------
			tbAward = tbAward2
		end
		if tbAward[nCountType] ~= nil then
			LIB_Award:Award(tbAward[nCountType])
			--- �i�m V�n May
--			local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--			if tbAward[nCountType]["nExp"] ~= nil then
--				local nExpVM = (nPointVM - 100)/100*tbAward[nCountType]["nExp"]
--				ModifyExp(nExpVM)
--				if nExpVM > 0 then
--					Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--				else
--					Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--				end
--			end
		end
		--==================== Chi Ton Vuong Lenh NewServer
--		if ChiTonNew_CheckNewServer() == 1 then
--			if ChiTonNew_GetStep() == 4 then
--				ChiTonNew_SetMissionPart(5)
--			end
--		end
	end
	PlayerIndex = nOldPlayer
end


-- Random v�ng th�i h� theo t� l� thi�t k�
function RandThaiHuRing(nQty)	
--	nhiemvuVBonus(6) --nhi�m v� VBonus 07/2014
	local tThaiHuRing = {
		[1] = {[1] = {item={{gdp={2,1,469,1}, name = "V�ng Th�i H� B�t Qu�i - C�n"}}}, nRate = 35},
		[2] = {[1] = {item={{gdp={2,1,470,1}, name = "V�ng Th�i H� B�t Qu�i - Kh�n"}}}, nRate = 10},
		[3] = {[1] = {item={{gdp={2,1,471,1}, name = "V�ng Th�i H� B�t Qu�i - Kh�m"}}}, nRate = 10},
		[4] = {[1] = {item={{gdp={2,1,472,1}, name = "V�ng Th�i H� B�t Qu�i - �o�i"}}}, nRate = 10},
		[5] = {[1] = {item={{gdp={2,1,473,1}, name = "V�ng Th�i H� B�t Qu�i - Ly"}}}, nRate = 20},
		[6] = {[1] = {item={{gdp={2,1,474,1}, name = "V�ng Th�i H� B�t Qu�i - Ch�n"}}}, nRate = 8},
		[7] = {[1] = {item={{gdp={2,1,475,1}, name = "V�ng Th�i H� B�t Qu�i - C�n"}}}, nRate = 6},
		[8] = {[1] = {item={{gdp={2,1,476,1}, name = "V�ng Th�i H� B�t Qu�i - T�n"}}}, nRate = 1},
	}
	LIB_Award.szLogTitle = "Thai Hu Huyen Canh"
	LIB_Award.szLogAction = "nh�n"
	for i = 1, nQty do
		LIB_Award:AwardByRate(tThaiHuRing)
	end
end


-- Nh�n th��ng Thi�n M�n Tr�n
function ThienMonTran_NhanThuong(nType)
--	STVN3_LamNhiemVu(7)	--h�t h�n ng�y 11/10/2015
--	nhiemvuVBonus(3) --nhi�m v� VBonus 07/2014
	--Add nguy�n li�u Event
	if nType == 4 then
		if VietCheckEvent() == 1 then
			--gf_AddItemEx2({2,1,30790 ,500}, "Nguy�n li�u Event VIP TMT", "Hoat dong thang 10 nam 2015", "ho�n th�nh nhi�m v� Thi�n M�n Tr�n VIP")
			--Msg2Player("B�n nh�n ���c 500 Nguy�n Li�u Event")
		end		
	end
	------------------
	local tbBonus = {
		[0] = {item={{gdp={2,1,30340,1}, name="M�c R��ng"}}},
		[1] = {item={{gdp={2,1,30340,3}, name="M�c R��ng"}}},
		[2] = {item={{gdp={2,1,30340,6}, name="M�c R��ng"}}},
		[3] = {item={{gdp={2,1,30340,10}, name="M�c R��ng"}}},
		[4] = {item={{gdp={2,1,30340,14}, name="M�c R��ng"}}},
	}
	LIB_Award:Award(tbBonus[nType])
	--============= Chu�i nhi�m v� Ph�c Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 23 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end
	---------	 	
	local nDate = tonumber(date("%Y%m%d"))
	if nDate <= 20140406 then
		local nQty = VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 6,5)
		if nQty < 30 then
			VNG_SetTaskPos(TSK_HOATDONGNEWSERVER, nQty + 1, 6,5)
			TaskTip("Ho�t ��ng Linh B�o S�n: Ho�n th�nh 1 l�n nhi�m v� Thi�n M�n Tr�n")
		end
	end
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(5)
	end
	if STVN_GetDailyAwardStatus() == 1 and STVN_GetStatus() == 2 then
		STVN_DailyMissionComplete(4)
	end
	--============= Nhi�m v� ��i trang b� Vi�m �� ==================
	set_value_nv_nangcap(6)
	set_value_nv_nangcap(7)
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	  	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 17 or CTVL_GetDailyMission() == 18 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	--=============== T�i xu�t giang h� ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION1, 2,1)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION1, nQty + 1, 2,1)
				TaskTip("T�i xu�t giang h�: Ho�n th�nh 1 l�n nhi�m v� Thi�n M�n Tr�n")
			end
		end
	end		
	--========================
end

-- Nh�n th��ng T�i Nguy�n Chi�n
function TaiNguyenChien_NhanThuong(nType)
	local nDate = tonumber(date("%Y%m%d"))
	_vjw_SetZyz()
--	STVN3_LamNhiemVu(8)	--h�t h�n ng�y 11/10/2015
--	nhiemvuVBonus(5) --nhi�m v� VBonus 07/2014
--	if VietCheckEvent() == 1 then	
--		local tMaterialQuantity2013 =
--		{
--			[1] = {50}, -- s� d�ng qu�n c�ng ch��ng
--			[2] = {100},-- s� d�ng qu�n c�ng ��i
--			[3] = {250}, -- S� d�ng qu�n c�ng huy ho�ng
--			[4] = {20},  -- Kh�ng s� d�ng qu�n c�ng
--			[5] = {500}, -- VIP
--		}
--		--FireEvent("event_mission_award", "newbattle", nType -1 , 0, 0)
--		gf_AddItemEx2({2,200,14 ,  tMaterialQuantity2013[nType][1]}, "Nguy�n li�u Event", "Hoat dong thang 1 nam 2016", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n lo�i"..nType)
--
--		--------T�ng th�m Ho�ng s�c th�nh h�a th�ch--------
--		oly_AddShengHuo(1,3)
--		---------------------------------------------------
--
--		Msg2Player("B�n nh�n ���c "..tMaterialQuantity2013[nType][1].." Nguy�n li�u Event")
--	end						
------------Ph�n th��ng Hu�n Ch��ng Anh H�ng
	local tbHCAnhHung = 
		{
			[1] = {3},
			[2] = {4},
			[3] = {8},
			[4] = {0},
			[5] = {12},
		}
--		gf_AddItemEx2({2,1,30499 ,  tbHCAnhHung[nType][1]}, "Hu�n Ch��ng Anh H�ng", "TAI NGUYEN CHIEN NEW LOG", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n nh�n th��ng HCAH")
--		Msg2Player("B�n nh�n ���c "..tbHCAnhHung[nType][1].." Hu�n Ch��ng Anh H�ng")
		gf_AddItemEx2({2,1,30912 ,  10}, "Hi�p Ngh�a Chi Ch�ng", "TAI NGUYEN CHIEN NEW LOG", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n nh�n th��ng HNCC")
		Msg2Player("B�n nh�n ���c 10 Hi�p Ngh�a Chi Ch�ng")
		gf_AddItemEx2({2,102,215 ,  10}, "B�t tr�n ch�u", "TAI NGUYEN CHIEN NEW LOG", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n nh�n th��ng HNCC")
		Msg2Player("B�n nh�n ���c 10 B�t tr�n ch�u")
------------
	local tbBonus = {
		[0] = {item={{gdp={2,1,30340,1}, name="M�c R��ng"}}},
		[1] = {item={{gdp={2,1,30340,2}, name="M�c R��ng"}}},
		[2] = {item={{gdp={2,1,30340,4}, name="M�c R��ng"}}},
		[3] = {item={{gdp={2,1,30340,6}, name="M�c R��ng"}}},
		[4] = {item={{gdp={2,1,30340,1}, name="M�c R��ng"}}}, -- Kh�ng s� d�ng qu�n c�ng
		[5] = {item={{gdp={2,1,30340,10}, name="M�c R��ng"}}}, -- VIP
	}
	--------T�ng th�m Ho�ng s�c th�nh h�a th�ch--------
	--gf_AddItemEx2({2,1,30749 ,  1}, "Event Noel", "Hoat dong thang 12 nam 2014", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n lo�i"..nType)
	---------------------------------------------------
	
	LIB_Award:Award(tbBonus[nType])
	--============= Chu�i nhi�m v� Ph�c Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 24 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end
	---------
	local nDate = tonumber(date("%Y%m%d"))
	if nDate <= 20140406 then
		local nQty = VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 2,1)
		if nQty < 30 then
			VNG_SetTaskPos(TSK_HOATDONGNEWSERVER, nQty + 1, 2,1)
			TaskTip("Ho�t ��ng Linh B�o S�n: Ho�n th�nh 1 l�n nhi�m v� T�i Nguy�n Chi�n")
		end
	end
	--=============== T�i xu�t giang h� ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION1, 4,3)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION1, nQty + 1, 4,3)
				TaskTip("T�i xu�t giang h�: Ho�n th�nh 1 l�n nhi�m v� T�i nguy�n chi�n")
			end
		end
	end
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 2 and STVN_GetDailyAwardStatus() == 1 then
		STVN_DailyMissionComplete(3)
	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 9 or CTVL_GetDailyMission() == 10 or CTVL_GetDailyMission() == 11 or CTVL_GetDailyMission() == 12 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	if ChiTonNew_CheckNewServer() == 1 then
		--==================== Chi Ton Vuong Lenh NewServer
		if ChiTonNew_GetStep() == 5 then
			ChiTonNew_SetMissionPart(2)
		elseif ChiTonNew_GetStep() == 17 then
			ChiTonNew_SetMissionPart(3)
		end
	end
	--=============	
end

function ThuHoachBatNhaLon()
	--LongDaiKa: b� ph�n th��ng b�t nh� l�n c�
	--local nDate = tonumber(date("%y%m%d"))
	--local nVang = 160000
	--if nDate >= 151027 and nDate <=151103 then
	--	nVang = 280000
	--end
	--Earn(nVang)
	vaf_award_api("tPlantBigTreePrize")
	FireEvent("event_mission_task_award","planttree","plantbigtree",16)
	--VBonus_BatNhaLon()--LongDaiKa: b� ph�n th��ng b�t nh� l�n c�
	--============nhi�m v� Book15
	book15_DailyMissionComplete(5)
	--============= Chu�i nhi�m v� Ph�c Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 11 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end

	--============= Nhi�m v� ��i trang b� Vi�m �� ==================
	set_value_nv_nangcap(3)
	set_value_nv_nangcap(8)
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a	
	--============= Bonus Chi Ton server moi ==================
	if ChiTonNew_CheckNewServer() == 1 then
		Earn(20000)
		local nRandom = mod(random(1,10000),20)
		AddItem(2,1,(30164 + nRandom), 5)
	end
	--================
end

function Use_Award_PhaoHoa()
	--============nhi�m v� Book15
	book15_DailyMissionComplete(2)
	--=============== Chu�i nhi�m v� Ph�c Sinh PET l�n 2=====================================================
	lan2_set_quest_PhucSinh_BDH(6)
	-----------------------Chu�i nhi�m v� Ph�c Sinh 2
--	if PhucSinh2_CheckActive() == 1 then
--		if PhucSinh2_GetDailyMission() == 1 and PhucSinh2_GetMissionPart() > 0 then
--			PhucSinh2_SetMissionPart()
--		end
--	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a		
    	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 19 or CTVL_GetDailyMission() == 20 or CTVL_GetDailyMission() == 21 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	--------========== CTVL new server ==========
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 1 then
			ChiTonNew_SetMissionPart(5)
		elseif ChiTonNew_GetStep() == 2 then
			ChiTonNew_SetMissionPart(3)
		elseif ChiTonNew_GetStep() == 20 then
			ChiTonNew_SetMissionPart(2)
		end
	end
end

function TriQuocBinhThienHa_NhanThuong(nType)
	--Add nguy�n li�u Event
--	if VietCheckEvent() == 1 then
		FireEvent("event_task_award","contributecountry",nType,0)
--		gf_AddItemEx2({2,1,30926 ,200}, "Nguy�n li�u Event", "Hoat dong thang 10 nam 2015", "ho�n th�nh nhi�m v� Tr� Qu�c B�nh Thi�n H� lo�i"..nType)
--		Msg2Player("B�n nh�n ���c 200 Nguy�n Li�u Event")
--	end		
	
	--do return 0 end
    	-----------------------Nhi�m v� h�ng ng�y CTVL
    	if nType == 1 then
    		TriQuocBinhThienHa_NhanThuongCungTe()
    	elseif nType == 2 then
    		TriQuocBinhThienHa_NhanThuongTriAn()
    	elseif nType == 3 then
    		TriQuocBinhThienHa_NhanThuongThuyLoi()
    	elseif nType == 4 then
    		TriQuocBinhThienHa_NhanThuongLuyenDon()
    	end
end


function TriQuocBinhThienHa_NhanThuongCungTe()
--	nhiemvuVBonus(7) --nhi�m v� VBonus 07/2014
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(7)
	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 22 and  CTVL_GetMissionPart() > 0 then	
			CTVL_SetMissionPart()
		end
	end
	--=========== New server ==========
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 2 then
			ChiTonNew_SetMissionPart(4)
		elseif ChiTonNew_GetStep() == 3 or  ChiTonNew_GetStep() == 13 then
			ChiTonNew_SetMissionPart(3)
		end
	end
end

function TriQuocBinhThienHa_NhanThuongTriAn()
--	nhiemvuVBonus(13) --nhi�m v� VBonus 07/2014
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 23 and  CTVL_GetMissionPart() > 0 then
			CTVL_SetMissionPart()
		end
	end
	--=========== New server ==========
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 6 then
			ChiTonNew_SetMissionPart(1)
		end
	end
end


function TriQuocBinhThienHa_NhanThuongThuyLoi()
--	nhiemvuVBonus(8) --nhi�m v� VBonus 07/2014
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(6)
	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 24 and  CTVL_GetMissionPart() > 0 then
			CTVL_SetMissionPart()
		end
	end
	--=========== New server ==========
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 1 then
			ChiTonNew_SetMissionPart(6)
		elseif ChiTonNew_GetStep() == 4 then
			ChiTonNew_SetMissionPart(4)
		end
	end
end

function TriQuocBinhThienHa_NhanThuongLuyenDon()
--	nhiemvuVBonus(16) --nhi�m v� VBonus 07/2014
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 25 and  CTVL_GetMissionPart() > 0 then
			CTVL_SetMissionPart()
		end
	end
end


function ThitNuong_NhanThuong()
	--===== nhi�m v� Th�ng Ti�n Ph�c Sinh
	if TTPS_GetStatus() == 1 then
		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,1,7,7)
	end
	----------------------------------	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a	
	if VietCheckEvent() == 1 then
		gf_AddItemEx2({2,1,30660 ,50}, "Nguy�n li�u Event", "Hoat dong thang 06 nam 2014", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 50 Nguy�n Li�u Event")
	end			
    	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 13 or CTVL_GetDailyMission() == 14 or CTVL_GetDailyMission() == 15 or CTVL_GetDailyMission() == 16 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
end


function TongLieu_NhanThuong(nType)
	if nType == 1 then
		TongLieu_NhanThuongNongTrang()
	elseif nType == 2 then
		TongLieu_NhanThuongLuongThao()
	elseif nType == 3 then
--		STVN3_LamNhiemVu(10)	--h�t h�n ng�y 11/10/2015
--		nhiemvuVBonus(15) --nhi�m v� VBonus 07/2014
		TongLieu_NhanThuongThanhTri()
	elseif nType == 4 then
--		STVN3_LamNhiemVu(11)	--h�t h�n ng�y 11/10/2015
--		nhiemvuVBonus(14) --nhi�m v� VBonus 07/2014
		TongLieu_NhanThuongNhanMonQuan()
	end
	--===== nhi�m v� Th�ng Ti�n Ph�c Sinh
	if TTPS_GetStatus() == 1 then
		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,1,8,8)
	end
	----------------------------------	
end


function TongLieu_NhanThuongNongTrang()

	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 1 or CTVL_GetDailyMission() == 2 then  
			if CTVL_GetMissionPart() > 0 then	
				CTVL_SetMissionPart()
			end
		end
	end
	--=============== T�i xu�t giang h� ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION1, 8,7)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION1, nQty + 1, 8,7)
				TaskTip("T�i xu�t giang h�: Ho�n th�nh 1 l�n chi�n tr��ng n�ng trang")
			end
		end
	end
end


function TongLieu_NhanThuongLuongThao()

	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 3 or CTVL_GetDailyMission() == 4 then  
			if CTVL_GetMissionPart() > 0 then	
				CTVL_SetMissionPart()
			end
		end
	end
	--=============== T�i xu�t giang h� ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION2, 2,1)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION2, nQty + 1, 2,1)
				TaskTip("T�i xu�t giang h�: Ho�n th�nh 1 l�n chi�n tr��ng l��ng th�o")
			end
		end
	end
end


function TongLieu_NhanThuongThanhTri()
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 2 and STVN_GetDailyAwardStatus() == 1 then
		STVN_DailyMissionComplete(1)
	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 5 or CTVL_GetDailyMission() == 6 then  
			if CTVL_GetMissionPart() > 0 then	
				CTVL_SetMissionPart()
			end
		end
	end
	--=============== T�i xu�t giang h� ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION2, 4,3)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION2, nQty + 1, 4,3)
				TaskTip("T�i xu�t giang h�: Ho�n th�nh 1 l�n chi�n tr��ng b�o v� th�nh tr�")
			end
		end
	end
end


function TongLieu_NhanThuongNhanMonQuan()
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 2 and STVN_GetDailyAwardStatus() == 1 then
		STVN_DailyMissionComplete(2)
	end

	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 7 or CTVL_GetDailyMission() == 8 then  
			if CTVL_GetMissionPart() > 0 then	
				CTVL_SetMissionPart()
			end
		end
	end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate <= 20140406 then
		local nQty = VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 8,7)
		if nQty < 30 then
			VNG_SetTaskPos(TSK_HOATDONGNEWSERVER, nQty + 1, 8,7)
			TaskTip("Ho�t ��ng Linh B�o S�n: Ho�n th�nh 1 l�n nhi�m v� Nh�n M�n Quan")
		end
	end
	--=============== T�i xu�t giang h� ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION2, 6,5)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION2, nQty + 1, 6,5)
				TaskTip("T�i xu�t giang h�: Ho�n th�nh 1 l�n chi�n tr��ng Nh�n M�n Quan")
			end
		end
	end
end


function KichHoatBacDauDuongSinhThuat()

	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	--==================== Chi Ton Vuong Lenh NewServer
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 3 then
			ChiTonNew_SetMissionPart(4)
		elseif ChiTonNew_GetStep() == 12 or ChiTonNew_GetStep() == 18 then
			ChiTonNew_SetMissionPart(1)
		end
	end
end


function HoanThanhNhiemVuLuongSonBac()
--	STVN3_LamNhiemVu(6)	--h�t h�n ng�y 11/10/2015
--	nhiemvuVBonus(12) --nhi�m v� VBonus 07/2014
	-----------------------Chu�i nhi�m v� ��ng H�nh
	if CFG_NhiemVuDongHanh == 1 then
		if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 26 then
			if mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_1), 10) == 3 or mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_2), 10) == 3  or mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_3), 10) == 3  then
				if DongHanh_GetMissionPart() > 0 then
					DongHanh_SetMissionPart()
					if DongHanh_GetMissionPart() == 0 then
						DongHanh_SetStatus()
					end
				end
			end
		end
	end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate <= 20140406 then
		local nQty = VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 4,3)
		if nQty < 30 then
			VNG_SetTaskPos(TSK_HOATDONGNEWSERVER, nQty + 1, 4,3)
			TaskTip("Ho�t ��ng Linh B�o S�n: Ho�n th�nh 1 l�n nhi�m v� L��ng S�n B�c")
		end
	end
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(4)
	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a	
	--=============== T�i xu�t giang h� ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION1, 6,5)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION1, nQty + 1, 6,5)
				TaskTip("T�i xu�t giang h�: Ho�n th�nh 1 l�n nhi�m v� L��ng S�n B�c")
			end
		end
	end	
	--===========	
end

function HoanThanhNhiemVuSuMon()
--	nhiemvuVBonus(11)
end

function VietCheckEvent()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 161002 and nDate <=161230 then
		return 1
	end
	return 0
end

--====ph�n th��ng VBonus cho s� d�ng c�c item
function VBonus_NuOa()
	if CheckVbonus() == 1 then
		ModifyExp(200000)
		Msg2Player("T�i kho�n c� k�ch ho�t VBonus, ���c nh�n th�m 200.000 kinh nghi�m.")
	end
end

function VBonus_BatNhaNho()
	if CheckVbonus() == 1 then
		ModifyExp(300000)
		Msg2Player("T�i kho�n c� k�ch ho�t VBonus, ���c nh�n th�m 300.000 kinh nghi�m.")
	end
end

function VBonus_HatGiong()
	if CheckVbonus() == 1 then
		ModifyExp(300000)
		Msg2Player("T�i kho�n c� k�ch ho�t VBonus, ���c nh�n th�m 300.000 kinh nghi�m.")
	end
end

function VBonus_CayTuLinh()
	if CheckVbonus() == 1 then
		ModifyExp(300000)
		Msg2Player("T�i kho�n c� k�ch ho�t VBonus, ���c nh�n th�m 300.000 kinh nghi�m.")
	end
end

function VBonus_LuckyStar()
	if CheckVbonus() == 1 then
		ModifyExp(250000)
		Msg2Player("T�i kho�n c� k�ch ho�t VBonus, ���c nh�n th�m 250.000 kinh nghi�m.")
	end
end

function VBonus_BatNhaLon()
	local tbFruite = {
		[1] = {"Nh�n" , 30164},			[2] = {"Ch�m Ch�m", 30165},		[3] = {"Cam", 30165},		[4] = {"D�a", 30167},
		[5] = {"M�ng C�t", 30168},		[6] = {"M�ng c�u", 30179},			[7] = {"Kh�m", 30180},	[8] = {"L�", 30181},
		[9] = {"B�n Bon", 30182},		 [10] = {"Kh�", 30183},				[11] = {"B��i", 30169},	[12] = {"D�u", 30170},
		[13] = {"Chu�i", 30171},			[14] = {"Xo�i", 30172},				[15] = {"��o", 30173},	[16] = {"M�n", 30174},
		[17] = {"V�i", 30175},				[18] = {"T�o", 30176},				[19] = {"B�", 30177},		[20] = {"�u ��", 30178},
		}
	if CheckVbonus() == 1 then
		local nIndex = random(1,20)
		gf_AddItemEx2({2, 1, tbFruite[nIndex][2], 2}, tbFruite[nIndex][1], "NHAN THUONG VBONUS BK", "tr�i c�y")
	end
end

function TTPS_GetStatus()
	local nStatus = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,1,1)
	return nStatus
end

--interface for viet----------
function _vjw_SetTaixu()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		return 0;
	end
	local nTimes = gf_GetMyTaskBit(TASKID_IB_ACT_WUZUN_TASK, 1, 2);
	if nTimes < 2 then
		gf_SetMyTaskBit(TASKID_IB_ACT_WUZUN_TASK, 1, 2, nTimes + 1, TASK_ACCESS_CODE_VJW);
		Msg2Player(format("Nhi�m v� k�ch ho�t c�nh gi�i V� T�n: %s (%d/%d)", "Tham gia Th�i H� Huy�n C�nh", nTimes + 1, 2));
	end
end

function _vjw_SetZyz()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		return 0;
	end
	local nTimes = gf_GetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 5);
	if nTimes < 1 then
		gf_SetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 5, nTimes + 1, TASK_ACCESS_CODE_VJW);
		Msg2Player(format("Nhi�m v� k�ch ho�t c�nh gi�i V� T�n: %s (%d/%d)", "Ho�n th�nh T�i Nguy�n Chi�n", nTimes + 1, 1));
	end
end
-------------------------------

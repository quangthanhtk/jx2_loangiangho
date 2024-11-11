Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
Include("\\script\\vng\\newserver\\topbanghoi.lua");
Include("\\script\\online_activites\\2011_12\\qingrenjie\\sale_chocolate.lua")
Include("\\script\\online_activites\\201202\\zengsongpifeng\\send_pifeng.lua")
Include("\\script\\online_activites\\201211\\jixiang_ruyi.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\vng\\doinguyenlieu.lua")
Include("\\script\\vng\\eventkimxalienserver.lua")
Include("\\script\\online_activites\\201502\\wupanguo.lua")
Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua")
Include("\\script\\vng\\lasa\\\la_sa.lua")
LASA_FILE = "\\script\\vng\\lasa\\\la_sa.lua"
LASA_FILE1 = "\\script\\vng\\lasa\\\la_sa1.lua"
szNpcName = "<color=green>La Sa<color>: "
DuaTop_StartDate = 20150121
DuaTop_EndDate = 20150228
NewServer_Id = 94
Max_Vote_Point = 200
tbVoteMaterials = {
	[1] = {1, {nExp = 10000000}, "10 tri�u �i�m kinh nghi�m(1 �i�m t�ch l�y)"},
	[2] = {10,{nExp = 100000000}, "100 tri�u �i�m kinh nghi�m(10 �i�m t�ch l�y)"},
	[3] = {1, {item={{gdp={2,1,30499,1}}}}, "1 Hu�n Ch��ng Anh H�ng(1 �i�m t�ch l�y)"},
	[4] = {2, {item={{gdp={2,1,30614,1}}}}, "1 L�i H� Tinh Ph�ch(2 �i�m t�ch l�y)"},
	[5] = {1, {item={{gdp={2,2,8,5}},{gdp={2,1,30230,6}}}}, "5 Thi�n Th�ch v� 6 Xu V�t Ph�m(1 �i�m t�ch l�y)"},
	[6] = {1, {item={{gdp={2,1,270,1}},{gdp={2,1,30230,1}}}}, "1 B�ch c�u ho�n v� 1 Xu V�t Ph�m(1 �i�m t�ch l�y)"},
	[7] = {2, {item={{gdp={2,1,1007,1}},{gdp={2,1,30230,2}}}}, "1 ��i b�ch c�u ho�n v� 2 Xu V�t Ph�m(2 �i�m t�ch l�y)"},
	[8] = {3, {item={{gdp={2,1,1008,1}}}}, "1 B�ch c�u ti�n ��n(3 �i�m t�ch l�y)"},
	[9] = {1, {item={{gdp={2,1,30762,300}},{gdp={2,1,30230,1}}}}, "300 L� Dong v� 1 Xu V�t Ph�m(1 �i�m t�ch l�y)"},
	[10] = {1, {item={{gdp={2,1,30763,300}},{gdp={2,1,30230,1}}}}, "300 G�o N�p v� 1 Xu V�t Ph�m(1 �i�m t�ch l�y)"},
	[11] = {1, {item={{gdp={2,1,30764,50}},{gdp={2,1,30230,1}}}}, "50 ��u Xanh Nh�n Th�t v� 1 Xu V�t Ph�m(1 �i�m t�ch l�y)"},
}

function main()
	local nDate = tonumber(date("%Y%m%d"))
	if gf_CheckEventDateEx(53) == 1 then
		Say("#<color=green>Lasa<color>: b�n Socola l� t�nh nh�n",2,"Ta ��n mua Socola l� t�nh nh�n/buy_chocolate","Ta ch� gh� ch�i/do_nothing");
		return 1;
	end
	if gf_CheckEventDateEx(57) == 1 then
		Say("<color=green>Lasa<color>:t�ng Ho�ng Kim Phi Phong cho t�t c� n� sinh trong th�nh (<color=green>�� s� d�ng ph�n th��ng cu�i c�a event 8 thang 3 s� nh�n ���c ph�n th��ng cu�i phong ph� h�n<color>)",2,"M�i SaSa thay ta t�ng Phi Phong cho c�c ch� em ph� n� trong th�nh (ti�u hao 8 Phi Phong Ho�ng Kim + 3 v�ng)/deal_send","Ta ch� gh� ch�i/do_nothing")
		return 1;
	end
	if gf_CheckEventDateEx(VET_ACTIVITY_JIXIANG_RUYI) == 1 then
		Say("<color=green>La Sa<color>: Gi�ng sinh vui v�!", getn(TABLE_JIXIANG_RUYI), TABLE_JIXIANG_RUYI);
		return 1;
	end
	
	
	--���
	local tSay = {};
	--���
	local tActivityID = {84, 124, 127, 136};
	for k, v in tActivityID do
		tSay = aah_GetSayDialog(tonumber(v));
	end
	
	if gf_CheckEventDateEx(147) == 1 then
		for i = 1, getn(WPG_DIALOG) do
			tinsert(tSay,WPG_DIALOG[i])
		end		
	end
	
	--Event Dua Top Bang Hoi Lien Server 21/01/2015 - 28/02/2015
	if GetGlbValue(GLB_TSK_SERVER_ID) ~= NewServer_Id and GetGlbValue(GLB_TSK_SERVER_ID) ~= 93 then
		--DuaTop_Main()
		if nDate >= DuaTop_StartDate and nDate <= DuaTop_EndDate then
			tinsert(tSay,"Bang ch� ��i di�n Bang H�i ��ng k� tham gia/DuaTop_DangKy")
			tinsert(tSay,"Xem th�ng tin c�c Bang H�i tham gia trong m�y ch�/DuaTop_ViewListBangHoi")
			tinsert(tSay,"�ng h� c�c Bang H�i/DuaTop_UngHo")
			tinsert(tSay,"Xem t�ch l�y b�n th�n/DuaTop_ViewPersonalPoint")
			tinsert(tSay,"Xem t�ch l�y c�c Bang H�i/DuaTop_ViewBangHoiPoint")		
		end	
	end
	
	if nDate >= 20130416 and nDate <= 20130421 then
		tinsert(tSay, "Ta mu�n ��i nguy�n li�u l�y kinh nghi�m/Trade_Material2Exp_Menu")
		tinsert(tSay, "Ta mu�n ��i c�c lo�i nguy�n li�u l�y ph�n th��ng/Trade_Material2Item_Menu")
	end
	if nDate >= 20131012 and nDate <= 20131024 then
		tinsert(tSay, "�ua top Trang b� Kim X� Nguy�n So�i/EventKimXaLienServer_Menu")
	end
	if nDate == 20131027 then
		tinsert(tSay, "Bang ch� nh�n th��ng �ua top Kim X� Nguy�n So�i/EventKimXaLienServer_NhanThuong_Form")
	end
	
	local nHour = tonumber(date("%H"))
	if nDate >= 20150426 and nDate <= 20150427 then
		if nHour >= 21 and nHour <= 22 then
			tinsert(tSay,"Ta mu�n quay s� nh�n th��ng /QuaySo8t3_01");
		end
--		tinsert(tSay,"Ta mu�n nh�n qu� Qu�c T� Ph� N� 8 th�ng 3/Award8t3");
	end
	if nDate >= 20150426 and nDate <= 20150430 then
		if nHour >= 21 then
			tinsert(tSay,"Nh�n nhi�m Th�n T�c Xuy�n ��m (h�ng ng�y) /NhiemVuTrongCay");
			tinsert(tSay,"Nh�n th��ng nhi�m v� Th�n T�c Xuy�n ��m (h�ng ng�y)/NhiemVuTrongCay_award");	
		end
	end
	if nDate >= 20151118 and nDate <= 20151130 then
		tinsert(tSay,"Ta mu�n gh�p m�t t�ch si�u c�p 20% (d�ng 3 m�t t�ch c�ng h� ph�i + 3 Chi�n th�n ho�n)/#change_MatTich20(1)");
		tinsert(tSay,"Ta mu�n gh�p m�t t�ch si�u c�p 20% (d�ng 5 m�t t�ch kh�ng c�ng h� ph�i + 3 Chi�n th�n ho�n)/#change_MatTich20(2)");
	end
	if nDate >= 20151118 and nDate <= 20161031 then
		tinsert(tSay,"��i ngo�i trang B�ng �i�u (v�nh c�u) /change_ChimBang");
	end
	if nDate <= 20200630 then
		tinsert(tSay,"Ta mu�n mua nguy�n li�u �� gh�p event/buy_nguyenlieu_lasa")
	end	
	
	if nDate <= 20200731 then
		tinsert(tSay, "��i 1 K� Y�u ho�c 1 L�u B�t (ti�u hao 10 v�ng)/#_gold_exchange_talk(1)")
		tinsert(tSay, "��i 10 K� Y�u ho�c 10 L�u B�t (ti�u hao 100 v�ng)/#_gold_exchange_talk(2)")
		tinsert(tSay, "��i 100 K� Y�u ho�c 100 L�u B�t (ti�u hao 1000 v�ng)/#_gold_exchange_talk(3)")
--		tinsert(tSay, "��i 1000 b�nh trung thu (B�nh th��ng ho�c B�nh ��c Bi�t)(ti�u hao b�ng v�ng)/#_gold_exchange_talk(4)")
	end
	tinsert(tSay, "\nK�t th�c ��i tho�i/do_nothing");
	Say("<color=green>La Sa<color>: ��i 1 K� Y�u ho�c 1 L�u B�t: ti�u hao 10 B�t M�c + 10 T�p V� + 10 V�ng!", getn(tSay), tSay);
end

function do_nothing()
end

function DuaTop_NhanThuong(nRank)
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	
	local szTongName = GetTongName()
	local isTong = IsTongMaster()
	
	local nCheck = 0
	local nPoint = 0
	for i = 1, getn(LIB_txtData.tbTextData) do
		if szTongName == LIB_txtData.tbTextData[i][1] then
			nPoint = LIB_txtData.tbTextData[i][5]
			nCheck = 1
			break
		end
	end
		
	if nCheck <= 0 then
		Talk(1,"","C�c h� kh�ng c� trong danh s�ch bang h�i nh�n th��ng!")
		return
	end
	
	if isTong ~= 1 then
		Talk(1,"","C�c h� kh�ng ph�i bang ch�, kh�ng th� nh�n th��ng!")
		return
	end
	
	local nNhanThuong = gf_GetTaskByte(TSK_DUATOPSERVERCANHAN,2,0)
	if nNhanThuong >= 1 then
		Talk(1,"",szNpcName.."C�c h� �� nh�n th��ng. Kh�ng th� nh�n ���c n�a!")
		return
	end
	
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(7*24*3600));
	if nDayCount <=  1 then
		Talk(1,"",szNpcName.."Th�i gian gia nh�p c�a c�c h� �t h�n 7 ng�y, kh�ng th� nh�n th��ng!")
		return 0
	end
	
	if nPoint < 30000 then
		Talk(1,"","�i�m t�ch l�y d��i 30,000 �i�m. Bang h�i kh�ng th� nh�n th��ng!")
		return
	end
	
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", strNpcName.."C�c h� ch�a gia nh�p m�n ph�i kh�ng th� nh�n th��ng.");
		return
	end
	
	if gf_Judge_Room_Weight(15, 700) == 0 then
		Talk(1,"", szNpcName.."H�y chu�n b� �t nh�t 15 � tr�ng v� 700 s�c l�c r�i quay l�i ��y nh�n th��ng !")
		return 0
	end
	local tbAward11 = {item = {{gdp={2,1,1051,1}, name="Bao Thi�n Th�ch Tinh Th�ch", nExpired = 7*24*60*60}}}
	local nRoute = GetPlayerRoute()
	if nRank == 1 then
		LIB_Award.szLogTitle = "DuaTopLienServer"
		LIB_Award.szLogAction = "NhanRank1"
		TraoChienCuong(15)
		receive_DieuDuong_Top1_faction_01(0,1)
		Receive_KimXa(11)
		LIB_Award:Award({item = {{gdp={0,112,225,3}, name="M�t T�ch Ti�u Dao To�n �nh"}}})
		TraoMatTichCaoCap(5,nRoute,15)
		LIB_Award:Award({item = {{gdp={2,1,1051,3}, name="Bao Thi�n Th�ch Tinh Th�ch"}}})
		LIB_Award:Award({item = {{gdp={2,1,1051,300}, name="Thi�n Ki�u L�nh"}}})
		LIB_Award:Award({item = {{gdp={2,1,1001,5}, name="H�a Th� B�ch"}}})
		LIB_Award:Award({item = {{gdp={0,105,30014,2,1,-1,-1,-1,-1,-1,-1,-1,0}, name="B�o V�ng"}}})
	elseif nRank == 2 then
		LIB_Award.szLogTitle = "DuaTopLienServer"
		LIB_Award.szLogAction = "NhanRank2"
		TraoChienCuong(13)
		receive_DieuDuong_Top1_faction_01(0,1)
		Receive_KimXa(7)
		LIB_Award:Award({item = {{gdp={0,112,225,1}, name="M�t T�ch Ti�u Dao To�n �nh"}}})
		TraoMatTichCaoCap(2,nRoute,15)
		LIB_Award:Award({item = {{gdp={2,1,1051,1}, name="Bao Thi�n Th�ch Tinh Th�ch"}}})
		LIB_Award:Award({item = {{gdp={2,1,1051,200}, name="Thi�n Ki�u L�nh"}}})
		LIB_Award:Award({item = {{gdp={2,1,1001,3}, name="H�a Th� B�ch"}}})
		LIB_Award:Award({item = {{gdp={0,105,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="B�o �en"}}})
	elseif nRank == 3 then
		LIB_Award.szLogTitle = "DuaTopLienServer"
		LIB_Award.szLogAction = "NhanRank3"
		TraoChienCuong(10)
		receive_DieuDuong_Top1_faction_01(0,1)
		Receive_KimXa(0)
		LIB_Award:Award({item = {{gdp={0,112,225,1}, name="M�t T�ch Ti�u Dao To�n �nh"}}})
		TraoMatTichCaoCap(2,nRoute,15)
		LIB_Award:Award({item = {{gdp={2,1,3356,6}, name="T�i Thi�n Th�ch Tinh Th�ch"}}})
		LIB_Award:Award({item = {{gdp={2,1,1051,100}, name="Thi�n Ki�u L�nh"}}})
		LIB_Award:Award({item = {{gdp={2,1,1001,1}, name="H�a Th� B�ch"}}})
		LIB_Award:Award({item = {{gdp={0,105,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name="B�o �en"}}})
	end
	gf_SetTaskByte(TSK_DUATOPSERVERCANHAN,2,1)
	Msg2Player("C�c h� �� nh�n th��ng th�nh c�ng")
end

function DuaTop_ViewPersonalPoint()
	local nPoint = gf_GetTaskByte(TSK_DUATOPSERVERCANHAN,1)
	Talk(1,"",szNpcName.."H�m nay c�c h� �� �ng h� ���c t�ng c�ng <color=red>"..nPoint.."<color> �i�m")
end

function DuaTop_ViewBangHoiPoint()
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	local msgs = {"","","",""}
		
	for i = 1, getn(LIB_txtData.tbTextData) do
		if i <= 50 then
			msgs[1] = msgs[1] .."<color=green>".. LIB_txtData.tbTextData[i][1].."<color>(<color=red>"..LIB_txtData.tbTextData[i][5].."<color> �i�m), "
		elseif i <= 100 then
			msgs[2] = msgs[2] .."<color=green>".. LIB_txtData.tbTextData[i][1].."<color>(<color=red>"..LIB_txtData.tbTextData[i][5].."<color> �i�m), "
		end
	end	
	
	if msgs[1] == "" then
		Talk(1,"",szNpcName.."Hi�n t�i kh�ng c� bang h�i n�o ��ng k� tham gia!")
		return
	end
	
	for i = 1, getn(msgs) do
		if msgs[i] ~= "" then
			Talk(1, "", msgs[i])
		end
	end
end

function DuaTop_UngHo()
	local nConfirmCDKey = GetTask(2840) --GetExtPoint(EXT_CDKEY)
	local nConfirmVC = GetVipCardRemainTime()
	
	local nW, nX, nY = GetWorldPos()
	if nW ~= 100 then
		Talk(1,"", szNpcName.."C�c h� vui l�ng ��n Tuy�n Ch�u �ng h� nh�!")
		return 
	end
	
	if IsPlayerDeath() == 1 then
		Talk(1,"",szNpcName.."Tr�ng th�i hi�n t�i kh�ng th� nh�n th��ng.")	
		return
	end
	
	-- Check Kich ho�t Khi�u Chi�n L�nh
	if nConfirmCDKey <= 0 then
		Talk(1,"",szNpcName.."C�c h� ch�a k�ch ho�t Khi�u Chi�n L�nh, kh�ng th� ��ng k� tham gia!")
		return
	end
	
	-- Check k�ch ho�t VIP
	if nConfirmVC <= 0 then
		Talk(1,"",szNpcName.."C�c h� ch�a k�ch ho�t th� th�ng, kh�ng th� ��ng k� tham gia!")
		return
	end

	--Check gia nh�p m�n ph�i
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", szNpcName.."C�c h� ch�a gia nh�p m�n ph�i kh�ng th� tham gia �ng h� Bang H�i!");
		return
	end
	
	--Check Level
	if 	gf_GetPlayerRebornCount() < 1 and GetLevel() < 90 then
		Talk(1,"",szNpcName.."C�c h� ch�a �� level 90. H�y v� nh� luy�n th�m r�i quay l�i ��y!")
		return
	end
	
	--Check max skill 55
	if CheckMaxSkill55() ~= 1 then
		Talk(1,"",szNpcName.."C�c h� ch�a n�ng c�p t�i �� k� n�ng c�p 55!")
		return
	end
	
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	
	if LIB_txtData.tbTextData == nil then
		Talk(1,"","Kh�ng c� bang h�i n�o ��ng k� tham gia!")
		return
	end	
	
	local tbSay = {}
	tbSay[0] = szNpcName.."C�c h� h�y l�a ch�n bang h�i mu�n b�nh ch�n: "
	for i = 1, getn(LIB_txtData.tbTextData) do
		tinsert(tbSay,"Ta mu�n b�nh ch�n bang h�i "..LIB_txtData.tbTextData[i][1].."/#DuaTop_UngHo_01("..i..")")
	end
	
	gf_PageSay(tbSay, 1, 6);
end

function DuaTop_UngHo_01(nBang)
	local tbSay = {}
	for i = 1, getn(tbVoteMaterials) do
		tinsert(tbSay,format(tbVoteMaterials[i][3].."/#DuaTop_UngHo_02(%d,%d)",i,nBang))
	end
	tinsert(tbSay,"R�i Kh�i/gf_DoNothing")
	Say(szNpcName.."C�c h� mu�n b�nh ch�n b�ng h�nh th�c n�o?",getn(tbSay),tbSay)
end

function DuaTop_UngHo_02(nType,nBang)
	
	local nPointVote = gf_GetTaskByte(TSK_DUATOPSERVERCANHAN,1)
	if nPointVote + tbVoteMaterials[nType][1] > Max_Vote_Point then
		Talk(1,"","C�c h� ch� ���c n�p t�i �a "..Max_Vote_Point.." �i�m trong ng�y. Xin vui l�ng quay l�i ng�y h�m sau!")
		return
	end
	
	if LIB_Award:CheckMaterial(tbVoteMaterials[nType][2]) ~= 1 then
		return
	end
	
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	gf_SetTaskByte(TSK_DUATOPSERVERCANHAN,1,nPointVote + tbVoteMaterials[nType][1])
	LIB_txtData.tbTextData[nBang][5] = LIB_txtData.tbTextData[nBang][5] + tbVoteMaterials[nType][1]
	sort(LIB_txtData.tbTextData, function(x,y) return tonumber(x[5]) > tonumber(y[5]) end)
	LIB_txtData:SaveMultiColumn()
	LIB_Award:PayMaterial(tbVoteMaterials[nType][2])
	Msg2Player("C�c h� �� b�nh ch�n th�nh c�ng cho bang h�i "..LIB_txtData.tbTextData[nBang][1])
	AddGlobalNews("S� ki�n �ua Top Bang H�i Li�n Server: Bang H�i "..LIB_txtData.tbTextData[nBang][1].." �� ���c b�nh ch�n "..tbVoteMaterials[nType][1].." �i�m!")
	DuaTop_UngHo_01(nBang)
end

function DuaTop_ViewListBangHoi()
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	
	local nCount = getn(LIB_txtData.tbTextData)
	local msgs = {
		szNpcName.."Hi�n t�i �� c� "..nCount.." bang h�i tham gia s� ki�n: \n",
		"","","",
	}
	
	for i = 1, nCount do
		if i <= 40 then
			msgs[1] = msgs[1] .. "<color=green>"..LIB_txtData.tbTextData[i][1].."<color>, "
		elseif i <= 80 then
			msgs[2] = msgs[2] .. "<color=green>"..LIB_txtData.tbTextData[i][1].."<color>, "
		end
	end	
	
	for i = 1, getn(msgs) do
		if msgs[i] ~= "" then
			Talk(1, "", msgs[i])
		end
	end
end

function DuaTop_DangKy()
	local szTong = GetTongName()
	local szAccount = GetAccount()
	local nLevel = GetLevel()
	local szName = GetName()
	local nPoint = 0
	local nConfirmCDKey = GetTask(2840) --GetExtPoint(EXT_CDKEY)
	local nConfirmVC = GetVipCardRemainTime()
	
	--Check Kich ho�t Khi�u chi�n l�nh
	if nConfirmCDKey <= 0 then
		Talk(1,"",szNpcName.."C�c h� ch�a k�ch ho�t Khi�u Chi�n L�nh, kh�ng th� ��ng k� tham gia!")
		return
	end
	
	--Check k�ch ho�t VIP
	if nConfirmVC <= 0 then
		Talk(1,"",szNpcName.."C�c h� ch�a k�ch ho�t th� X� n�, kh�ng th� ��ng k� tham gia!")
		return
	end
	
	--Check c� ph�i bang ch�?
	local isTong = IsTongMaster()
	if isTong ~= 1 then
		Talk(1,"",szNpcName.."C�c h� kh�ng ph�i bang ch�. Kh�ng th� ��ng k� tham gia Bang H�i �ua top!")
		return
	end
	
	--Check gia nh�p m�n ph�i
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", szNpcName.."C�c h� ch�a gia nh�p m�n ph�i kh�ng th� tham gia �ng h� Bang H�i!");
		return
	end
	
	--Check Level
	if 	gf_GetPlayerRebornCount() < 1 and GetLevel() < 90 then
		Talk(1,"",szNpcName.."C�c h� ch�a �� level 90. H�y v� nh� luy�n th�m r�i quay l�i ��y!")
		return
	end
	
	--Check max skill 55
	if CheckMaxSkill55() ~= 1 then
		Talk(1,"",szNpcName.."C�c h� ch�a n�ng c�p t�i �� k� n�ng c�p 55!")
		return
	end
	
	--Check C�ng server
	if gf_GetTaskByte(TSK_SERVER_ID,1) ~= GetGlbValue(GLB_TSK_SERVER_ID) then
		Talk(1,"",szNpcName.."C�c h� kh�ng ph�i th�n d�n b�n qu�c, kh�ng ���c ��ng k� tham gia!")
		return 0
	end
	
	LIB_txtData:Init("ListDuaTopBangHoi.txt")
	LIB_txtData:LoadMultiColumn()
	local nCheck = 0	
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheck = 1
			break
		end
	end
	
	if nCheck == 1 then
		Talk(1,"",szNpcName.."Bang h�i c�c h� �� ��ng k� th�nh c�ng, kh�ng ���c ��ng k� th�m l�n n�a!")
		return 0
	end
	
	local szLog = szTong.."	"..szAccount.."	"..szName.."	"..nLevel.."	".. nPoint
	LIB_txtData:AddLine(szLog)
	Talk(1,"",szNpcName.."Bang h�i c�c h� b�o danh s� ki�n �ua Top Bang H�i Li�n Server th�nh c�ng, xin ch�c m�ng.")
	AddGlobalNews("Ch�c m�ng bang h�i "..szTong.." b�o danh th�nh c�ng s� ki�n �ua Top Bang H�i Li�n Server!")
end

function QuaySo8t3_01()
	AskClientForNumber("QuaySo8t3_02",1,10,"Nh�p s� l�n quay")
end

function QuaySo8t3_02(nQuay)
	local QuaySo83 = {	
		{1,500,"M�nh Thi�n Th�ch",{2,2,7,1},0},	
		{1,500,"B�nh �t B�t B�o",{2,1,1125,2},0},
		{1,1000,"C�u Chuy�n H�i H�n ��n",{1,0,32,5},0},	
		{1,600,"L�i H� Tinh Ph�ch",{2,1,30614,1},0},
		{1,600,"Hu�n ch��ng anh h�ng",{2,1,30499,4},0},	
		{1,1,"H�a Th� B�ch",{2,1,1001,1},24*3600*7},		
		{1,500,"T�ng R��ng",{2,1,30341,1},0},			
		{1,100,"Tr�ng Linh Th�-Cao",{2,1,30728,1},0},
		{2,2300,10000000,"Kinh Nghi�m",0},
		{2,1546,15000000,"Kinh Nghi�m",0},
		{1,700,"B�n Long b�ch",{2,1,1000,1},24*3600*7},
		{1,600,"Thi�n Ki�u L�nh",{2,97,236,1},0},
		{1,50,"Bao Thi�n Ki�u L�nh Nh�",{2,95,2086,1},0},
		{1,700,"T�y T�y Linh ��n",{2,0,137,1},30 * 24 *3600},
		{1,300,"Thi�n Th�ch Tinh Th�ch",{2,1,1009,1},24*3600*7},	
		{1,1,"Tr�ng B�n �i�u",{2,1,30787,1},0},	
	}
	
	local QuaySo83_02 = {
		[1] = {0,105,10110,1,1,-1,-1,-1,-1,-1,-1,-1,0},
		[2] = {0,105,30029,1,1,-1,-1,-1,-1,-1,-1,-1,0},
	}
	
	if gf_Judge_Room_Weight(10, 50,1) == 0 then
		return
	end
	
	if GetItemCount(2,1,30230) < (29 * nQuay) then
		Talk(1,"",szNpcName.."C�c h� kh�ng �em �� "..(29 * nQuay).." Xu v�t ph�m")
		return
	end
	
	if GetOnlineTime() < nQuay * 3600 then
		Talk(1,"",szNpcName.."Th�i gian tr�n m�ng c�a c�c h� ch�a �� "..nQuay.." gi�")
		return
	end
	
	local szFileName = "quayso"..date("%Y%m%d") .. ".txt"
	LIB_txtData:Init(szFileName)
	LIB_txtData:LoadMultiColumn()	
	
	for i = 1,nQuay do
		local nRand = random(1,10000)
		if DelItem(2,1,30230,29) == 1 then
			SetOnlineTime(3600,2)
			local nRnd = random(1,2)
			local nNum = tonumber(LIB_txtData.tbTextData[nRnd][2])
			if nRand == 540 or nRand == 345 then
				if nRnd == 1 then
					if nNum > 0 then
						gf_AddItemEx2({0,105,10110,1,1,-1,-1,-1,-1,-1,-1,-1,0}, "Ti�n Du Ki�m", "QuaySoThang4", "nh�n th��ng ", 0, 1)
						LIB_txtData.tbTextData[nRnd][2] = tonumber(LIB_txtData.tbTextData[nRnd][2]) - 1
						LIB_txtData:SaveMultiColumn()
					else
						gf_EventGiveRandAward(QuaySo83,9998,9,"QuaySoThang4","NhanThuong")
					end
				else
					if nNum > 0 then
						gf_AddItemEx2({0,105,30029,1,1,-1,-1,-1,-1,-1,-1,-1,0}, "B�o �en B�o B�o", "QuaySoThang4", "nh�n th��ng ", 0, 1)
						LIB_txtData.tbTextData[nRnd][2] = tonumber(LIB_txtData.tbTextData[nRnd][2]) - 1
						LIB_txtData:SaveMultiColumn()
					else
						gf_EventGiveRandAward(QuaySo83,9998,9,"QuaySoThang4","NhanThuong")
					end
				end
			else
				gf_EventGiveRandAward(QuaySo83,9998,9,"QuaySoThang4","NhanThuong")
			end
			gf_WriteLogEx("QuaySoThang4", "NhanThuong", 0, "VatPhamQuaySo");		
		end
	end
end

function Award8t3()
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if GetLevel() < 90 then
		Talk(1, "", "B�n ch�a ��t c�p 90 n�n kh�ng th� nh�n th��ng.")	
		return 0;
	end	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "B�n ch�a gia nh�p m�n ph�i n�n kh�ng th� nh�n th��ng.")
		return 0
	end
	if GetSex() ~= 2 then		
		Talk(1, "", "Ng�y Ph� N� n�n ch� c� Ph� N� m�i ���c nh�n th��ng.")
		return 0
	end
	if GetTask(2731) >=1 then
		Talk(1, "", "B�n �� nh�n th��ng r�i.")
		return 0
	end
	SetTask(2731,1)
	gf_ModifyExp(10000000);
	AwardGenuineQi(9999);
	gf_EventGiveCustomAward(31, 9999, 1, "Ho�t ��ng ch�o m�ng 8/3 n�m 2015");
	gf_AddItemEx2({2, 1, 30499, 10, 4}, "Hu�n ch��ng anh h�ng", "Ho�t ��ng ch�o m�ng 8/3 n�m 2015", "Hu�n ch��ng anh h�ng", 0, 1);
	local tAward = {
		{1, 14000, "Th� �en", {0, 105, 30039, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 14000, "Nguy�t L��ng Th�", {0, 105, 30038, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 15998, "��c Gi�c Th� B�o B�o", {0, 105, 30032, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 14000, "H�ng Mao Ng�u B�o B�o", {0, 105, 30023, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 14000, "B�o V�ng B�o B�o", {0, 105, 30046, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 14000, "B�o Tr�ng B�o B�o", {0, 105, 30047, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 14000, "B�o �en B�o B�o", {0, 105, 30045, 1, 1, -1, -1, -1, -1, -1, -1}, 30 * 24 * 3600},
		{1, 1, "B�o �en B�o B�o", {0, 105, 30045, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
		{1, 1, "Nguy�t L��ng Th�", {0, 105, 30038, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Hoat dong mung 8/3 nam 2015", "T�i qu� 8/3");	
end

function NhiemVuTrongCay()
	if gf_GetTaskByte(TSK_NHIEMVUTRONGCAY,3) == 1 then
		Talk(1,"",szNpcName.."C�c h� �� nh�n nhi�m v� r�i. H�y mau ch�ng �i thu ho�ch c�c lo�i c�y mau l�n, ��ng ch�m tr�!")
		return
	end
	
	gf_SetTaskByte(TSK_NHIEMVUTRONGCAY,3,1)
	Talk(1,"",szNpcName.."C�c h� �� nh�n nhi�m v� th�nh c�ng. H�y mau ch�ng �i thu ho�ch c�c lo�i c�y mau l�n, ��ng ch�m tr�!")
end

function NhiemVuTrongCay_award()
	--Byte 1,2 : So l�n. Byte 3: nh�n nv, Byte 4: nh�n th��ng
	if gf_GetTaskByte(TSK_NHIEMVUTRONGCAY,3) == 0 then
		Talk(1,"",szNpcName.."C�c h� ch�a nh�n nhi�m v� m� mu�n nh�n th��ng sao?")
		return
	end
	
	if gf_GetTaskByte(TSK_NHIEMVUTRONGCAY,4) == 1 then
		Talk(1,"",szNpcName.."C�c h� �� nh�n th��ng ng�y h�m nay r�i!")
		return
	end
		
	if gf_GetTaskByte(TSK_NHIEMVUTRONGCAY,1) < 6 then
		Talk(1,"",szNpcName.."C�c h� ch�a thu ho�ch �� 6 c�y t� linh!")
		return
	end
	
	if gf_GetTaskByte(TSK_NHIEMVUTRONGCAY,2) < 8 then
		Talk(1,"",szNpcName.."C�c h� ch�a thu ho�ch �� 8 c�y b�t nh� nh�!")
		return
	end
			
	if gf_Judge_Room_Weight(1, 100, 1) ~= 1 then
		return 0;
	end
	
	if GetItemCount(2,1,30230) < 8 then
		Talk(1,"",szNpcName.."C�c h� kh�ng �em �� 8 Xu v�t ph�m")
		return
	end
	
	if DelItem(2,1,30230,8) == 1 then		
		gf_SetTaskByte(TSK_NHIEMVUTRONGCAY,4,1)
		--Award
		ModifyExp(21000000)
		gf_AddItemEx2({2, 0, 1082, 15}, "M�nh Th�i D�ch", "NhiemVuTrongCay_042015", "M�nh Th�i D�ch", 0, 1);
		--ModifyYinJuan(100, 1) -- Ng�n Phi�u
		gf_WriteLogEx("NhiemVuTrongCay_042015", "NhanThuong", 0, "VatPhamNhiemVuTrongCay");	
	end
end

function change_MatTich20(nType)
	if nType == 1 then
		PutinItemBox("��i m�t t�ch 20%" ,3 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", LASA_FILE, 1)
	elseif nType == 2 then
		PutinItemBox("��i m�t t�ch 20%" ,5 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", LASA_FILE1, 1)
	end
end
function change_ChimBang()
	local nBody = GetBody()
	local tChimBang = {
					[1] = {0,120,255},
					[2] = {0,120,256},
					[3] = {0,120,257},
					[4] = {0,120,258},
				}
	if gf_Judge_Room_Weight(1, 100, 1) ~= 1 then
		return 0;
	end			
	if GetItemCount(tChimBang[nBody][1],tChimBang[nBody][2],tChimBang[nBody][3]) < 1 then
		Talk(1, "", "��i hi�p kh�ng c� mang theo B�ng �i�u �� ��i.")
		return 0
	end
	if DelItem(tChimBang[nBody][1],tChimBang[nBody][2],tChimBang[nBody][3],1) == 1 then
		gf_AddItemEx2({tChimBang[nBody][1],tChimBang[nBody][2],tChimBang[nBody][3],1}, "B�ng �i�u", "DOI NGOAI TRANG CHIM BANG", "Chimbang", 0, 1);
		gf_WriteLogEx("DOINGOAITRANGCHIMBANG", "change", 0, "chim bang");	
	end
end
function buy_nguyenlieu_lasa()
	local tSay = {};
--	tinsert(tSay, "Ta mu�n mua 2000 gi�y xu�n �� (ti�u hao 15 Ti�u Dao Ng�c)/#finish_buy_nguyenlieu_lasa(1)")
	tinsert(tSay, "Ta mu�n mua 2000 Di�u Gi�y (ti�u hao 80 v�ng)/#finish_buy_nguyenlieu_lasa(2)")
--	tinsert(tSay, "Ta mu�n mua 2000 m�c t�u (ti�u hao 15 Ti�u Dao Ng�c)/#finish_buy_nguyenlieu_lasa(3)")
	tinsert(tSay, "Ta mu�n mua 2000 Con Quay (ti�u hao 100 v�ng)/#finish_buy_nguyenlieu_lasa(4)")
--	tinsert(tSay, "Ta mu�n mua 2000 ��i C�t (ti�u hao 50 Ti�u Dao Ng�c)/#finish_buy_nguyenlieu_lasa(5)")
	tinsert(tSay, "Ta mu�n mua 2000 Robot (ti�u hao 120 v�ng)/#finish_buy_nguyenlieu_lasa(6)")
	tinsert(tSay, "Tho�t/nothing")
	local szHeader = "<color=green>Gi�o S�:<color>Hi�n t�i ta c� r�t nhi�u nguy�n li�u event:"
	Say(szHeader, getn(tSay), tSay);
end
function finish_buy_nguyenlieu_lasa(nType)
	local tnguyenlieu = {--x, x, s� l��ng ti�u dao ng�c, v�ng
--				[1] = {31018, "X� h��ng", 15, 0},	
				[2] = {13, "Di�u Gi�y", 0, 80},	
--				[3] = {31019, "T�i Th�m", 15, 0},	
				[4] = {14, "Con Quay", 0, 100},	
--				[5] = {31020, "T�i Th�m ��c Bi�t", 50, 0},	
				[6] = {15, "Robot", 0, 120},	
			}
	if gf_Judge_Room_Weight(2,200) ~= 1 then
		Talk(1,"",szNpcName.."H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return
	end
--	if GetItemCount(2,1,30603) < tnguyenlieu[nType][3] then
--		Talk(1, "", szNpcName.."��i hi�p kh�ng mang theo �� "..tnguyenlieu[nType][3].." Ti�u Dao Ng�c.")
--		return 0
--	end
	if GetCash() < tnguyenlieu[nType][4]*10000 then
		Talk(1, "", szNpcName.."��i hi�p kh�ng mang theo �� "..tnguyenlieu[nType][4].." V�ng.")
		return 0
	end
	if nType == 1 or nType == 3 or nType == 5 then
		if  DelItem(2,1,30603,tnguyenlieu[nType][3]) ~= 1 then
			Talk(1, "", "X�y ra l�i 1")
			return 0
		end
	elseif nType == 2 or nType == 4 or nType == 6 then
		if Pay(tnguyenlieu[nType][4]*10000) ~= 1 then
			Talk(1, "", "X�y ra l�i 2")
			return 0
		end
	end
	gf_AddItemEx2({2,200,tnguyenlieu[nType][1],2000}, "nguy�n li�u", "MUA NGUYEN LIEU THANG 2020", "Mua nguy�n li�u")
end

--------------------

function _gold_exchange_talk(nType)
	local tType = {
					[1] = {1},
					[2] = {10},
					[3] = {100},
--					[4] = {1000},
				}

	if gf_Judge_Room_Weight(4, 300 , "") ~= 1 then
			return 0
	end
	if GetItemCount(2, 200, 19) < 10*tType[nType][1] then
		Talk(1, "", "B�n kh�ng mang �� B�t M�c, h�y ki�m tra l�i.")
		return 0
	end
	if GetItemCount(2, 200, 20) < 10*tType[nType][1] then
		Talk(1, "", "B�n kh�ng mang �� T�p V�, h�y ki�m tra l�i.")
		return 0
	end
	if GetCash() < 100000*tType[nType][1] then
		Talk(1, "", "B�n kh�ng mang �� v�ng, h�y ki�m tra l�i.")
		return 0
	end
	local nItem1 = 0
	local nItem2 = 0
	for i=1,tType[nType][1] do
		if random(100)<=50 then--50%�ɹ���
			nItem1 = nItem1 + 1
		else
			nItem2 = nItem2 + 1
		end
	end
	if DelItem(2, 200, 19, 10*tType[nType][1]) == 1 and DelItem(2, 200, 20, 10*tType[nType][1]) == 1 and Pay(100000*tType[nType][1]) == 1 then
		gf_AddItemEx2({2, 200, 22,nItem1}, "K� Y�u", "PHAN THUONG EVENT MO RONG", "nh�n m� r�ng event b�ng v�ng")
		gf_AddItemEx2({2, 200, 23,nItem2}, "L�u B�t", "PHAN THUONG EVENT MO RONG", "nh�n m� r�ng event b�ng v�ng")
	else
		gf_WriteLogEx("PHAN THUONG EVENT MO RONG", "th�t b�i", 1, "��i th�t b�i")	
	end
end
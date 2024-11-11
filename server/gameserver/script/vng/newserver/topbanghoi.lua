Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
Include("\\script\\online\\viet_event\\top_server\\npc_top.lua");

nMAXPOINT = 100
TOPBANGHOI_FILENAME = "newserver_topbanghoi.txt"
LIB_txtData.szPattern = "[A-Za-z0-9����������Ƣ�����E����ѣ����������������������������������������������������Ʃ���������Ѫ������������������������������������������_]"
szNpcName =  "<color=green>S�t H�<color>: "
szLOGSERVERNAME = "SAT HO"
LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
LIB_Award.szLogAction = "nh�n"
DuaTopBangHoi_NhanThuongDate = 20200520
DuaTopBangHoi_EndDate = 20200518

tbCongHienBang_NguyenLieu = {
	[1] = {1, {item={{gdp={2,1,30230,1}}},nExp = 1000000}, "1 �i�m c�ng hi�n: ti�u hao 1.000.000 kinh nghi�m, 1 xu"},
	[2] = {10, {item={{gdp={2,1,30230,10}}},nExp = 10000000}, "10 �i�m c�ng hi�n: ti�u hao 10.000.000 kinh nghi�m, 10 xu"},
	[3] = {100, {item={{gdp={2,1,30230,100}}},nExp = 100000000}, "100 �i�m c�ng hi�n: ti�u hao 100.000.000 kinh nghi�m, 100 xu"},
--	[4] = {1000, {nExp = 1000000000, nGold = 10000000}, "1000 �i�m c�ng hi�n: ti�u hao 1.000.000.000 kinh nghi�m, 1000 v�ng"},
}

function TopBangHoi_Menu()
	local nDate = tonumber(date("%Y%m%d"))
	local tbSay = {}
	if nDate <= DuaTopBangHoi_EndDate then
		tinsert(tbSay, "Ta mu�n ��ng k� �ua top c�ng hi�n bang h�i/TopBangHoi_DangKy")
		tinsert(tbSay, "Ta mu�n c�ng hi�n cho bang h�i h�ng m�nh/TopBangHoi_CongHien_Menu")
	end
	tinsert(tbSay, "Xem �i�m c�ng hi�n c�a bang h�i/TopBangHoi_XemDiem")
--	tinsert(tbSay, "Xem danh s�ch bang h�i ��ng k� �ua top")
	if nDate == DuaTopBangHoi_NhanThuongDate then
		tinsert(tbSay, "Th�nh vi�n nh�n th��ng bang h�i h�ng 1,2,3/#TopBangHoi_NhanThuong(1)")		--TSK_TT_VANGDANHTHIENHA_DUATOP: s� d�ng bit 11
		local nTongLevel = IsTongMember()
		if nTongLevel == 1 then
			tinsert(tbSay, "Bang ch� nh�n th��ng bang h�i h�ng 1,2,3/#TopBangHoi_NhanThuong(2)")	--TSK_TT_VANGDANHTHIENHA_DUATOP: s� d�ng bit 10
		end
	end
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say("", getn(tbSay), tbSay)
end


function TopBangHoi_DangKy()
	--local tbMaterial = {item={{gdp={2,1,30490,10}, name="Ho�ng Kim ��i Ng�n Phi�u"}}}
	local szTong = GetTongName()
	local szAcc = GetAccount()
	local nTongLevel = IsTongMember()
	local szRole = GetName()
	-- kiem tra Maxx Skill 55 va dang cap 81
	local nMaxSkill = CheckMaxSkill55()
	local nLevel = GetLevel();
	if nLevel <  90 then
		Talk(1,"",szNpcName.."��ng c�p c�a c�c h� kh�ng �� c�p 90, kh�ng th� ��ng k� tham gia!")
		return 0
	end
	if nMaxSkill ~= 1 then
		Talk(1, "",szNpcName.."K� n�ng skill 55 c�a c�c h� ch�a ��. N�u mu�n ��ng k� tham gia, h�y n�ng c�p k� n�ng c�p 55 r�i ��n g�p ta.");
		return 0
	end
	if nTongLevel ~= 1 then
		Talk(1, "",szNpcName.."C�c h� kh�ng ph�i bang ch�. N�u mu�n ��ng k� tham gia, h�y m�i bang ch� c�c h� ��n g�p ta.");
		return 0
	end
	if LIB_txtData:CheckString(szTong) > 0 then
		Talk(1, "",szNpcName.."T�n bang h�i c�c h� c� nhi�u ch� l� qu�, ta kh�ng bi�t ghi l�i nh� th� n�o n�a. Hay l� ��i bang kh�c �i nh�.")
--		return 0
	end
	--local nCheck = 0
	--nCheck = LIB_Award:CheckMaterial(tbMaterial)
	--if nCheck ~= 1 then
	--	return 0
	--end
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	local nCheckTongName = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheckTongName = i
			break
		end
	end
	if nCheckTongName > 0 then
		Talk(1,"",szNpcName.."Bang h�i c�c h� �� ��ng k� th�nh c�ng, kh�ng c�n ��ng k� th�m l�n n�a.")
		return 0
	end
	--LIB_Award:PayMaterial(tbMaterial)
	local szLogAward = szTong.."	"..szAcc.."	"..szRole.."	0"
	local nResult = LIB_txtData:AddLine(szLogAward)
	Talk(1,"",szNpcName.."Bang h�i c�c h� b�o danh th�nh c�ng v�o cu�c �ua vinh danh bang h�i danh gi� , h�y b�o tin cho c�c th�nh vi�n t�ch c�c x�y d�ng danh ti�ng bang h�i.")
	gf_WriteLogEx(szLogTitle, "nh�n", 1, "��ng k� th�nh c�ng")
end


function TopBangHoi_CongHien_Menu()
	local szTong = GetTongName() or ""
	if szTong == "" then
		Talk(1,"",szNpcName.."C�c h� kh�ng c� trong danh s�ch b�t k� bang n�o. H�y t�m ch� gia nh�p tr��c �� nh�.")
		return 0
	end
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	local nCheckTongName = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheckTongName = i
			break
		end
	end
	if nCheckTongName == 0 then
		Talk(1,"",szNpcName.."Bang h�i c�c h� kh�ng c� trong danh s�ch ��ng k� vinh danh.")
		return 0
	end
	local tbSay = {}
	for i=1,getn(tbCongHienBang_NguyenLieu) do
		tinsert(tbSay, tbCongHienBang_NguyenLieu[i][3].."/#TopBangHoi_CongHien_Done("..i..")")
	end
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say(szNpcName.."��ng ng��i th�m s�c m�nh. Ng��i h�y c�ng hi�n cho bang h�i b�ng h�t kh� n�ng m�nh c�.", getn(tbSay), tbSay)
end


function TopBangHoi_CongHien_Done(nOption)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Tr�ng th�i hi�n t�i kh�ng th� c�ng hi�n.")
		return
	end	
	-- kiem tra Maxx Skill 55 va dang cap 81
	local nMaxSkill = CheckMaxSkill55()
	local nLevel = GetLevel();
	if nLevel <  90 then
		Talk(1,"",szNpcName.."��ng c�p c�a c�c h� kh�ng �� 90, kh�ng th� tham gia c�ng hi�n!")
		return 0
	end
	if nMaxSkill ~= 1 then
		Talk(1, "",szNpcName.."K� n�ng skill 55 c�a c�c h� ch�a ��. N�u mu�n ��ng k� tham gia, h�y n�ng c�p k� n�ng c�p 55 r�i ��n g�p ta.");
		return 0
	end
	local szName = GetName()
	local szTong = GetTongName() or ""
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbCongHienBang_NguyenLieu[nOption][2])
	if nCheck == 0 then
		return 0
	end
	local nPoint = VNG_GetTaskPos(TSK_CONGHIENBANG, 4,1)
	if (nPoint + tbCongHienBang_NguyenLieu[nOption][1]) > nMAXPOINT then
		Talk(1,"",szNpcName.."M�c c�ng hi�n ng��i ch�n v��t qu� s� �i�m t�i �a m�i ng�y. H�y ch�n m�c kh�c ho�c mai quay l�i nh�.")
		return 0
	end
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	local nBang = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nBang = i
			break
		end
	end
	if nBang == 0 then
		return 0
	end
	LIB_Award:PayMaterial(tbCongHienBang_NguyenLieu[nOption][2])
	VNG_SetTaskPos(TSK_CONGHIENBANG, (nPoint + tbCongHienBang_NguyenLieu[nOption][1]), 4, 1)
	LIB_txtData.tbTextData[nBang][4] = LIB_txtData.tbTextData[nBang][4] + tbCongHienBang_NguyenLieu[nOption][1]
	sort(LIB_txtData.tbTextData, function(x,y) return tonumber(x[4]) > tonumber(y[4]) end)
	LIB_txtData:SaveMultiColumn()
	if tbCongHienBang_NguyenLieu[nOption][1] == 100 then
	AddGlobalNews(szName.." �� c�ng hi�n 100 �i�m cho bang ".. szTong ..". M�nh Th��ng Qu�n �� xu�t hi�n t�i bang "..szTong..".")
		--AddGlobalNews(szName.." �� c�ng hi�n 10 �i�m cho bang ".. szTong .." th�t ��ng ng��ng m�.")
	--elseif tbCongHienBang_NguyenLieu[nOption][1] == 100 then
	--	AddGlobalNews(szName.." �� c�ng hi�n 100 �i�m cho bang ".. szTong ..". M�nh Th��ng Qu�n �� xu�t hi�n t�i bang "..szTong..".")
	end
	local nNewRank = 10000
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nNewRank = i
			break
		end
	end
	if nBang >= nNewRank then
		if LIB_txtData.tbTextData[(nNewRank+1)] ~= nil then
			AddGlobalNews(szName.." �� gi�p bang h�i "..LIB_txtData.tbTextData[nNewRank][1].." v��t qua bang h�i "..LIB_txtData.tbTextData[(nNewRank+1)][1]..". D��ng nh� bang "..LIB_txtData.tbTextData[(nNewRank+1)][1].." c� bi�u hi�n �u�i s�c.")
		end
	end
	Msg2Player("B�n �� c�ng hi�n "..tbCongHienBang_NguyenLieu[nOption][1].." cho bang h�i.")
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogaction, 1, "C�ng hi�n "..tbCongHienBang_NguyenLieu[nOption][1].." �i�m")
	TopBangHoi_CongHien_Menu()
end


function TopBangHoi_XemDiem()
	local tbData = {}
	tinsert(tbData,szNpcName.."K�t qu� hi�n t�i:\n")
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	for i=1,getn(LIB_txtData.tbTextData) do
		local nIndex = floor(i/10)+1
		if tbData[nIndex] == nil then
			tinsert(tbData, szNpcName.."K�t qu� hi�n t�i:\n")
		end
		tbData[nIndex] = tbData[nIndex] .. i.." - ".."<color=yellow>"..LIB_txtData.tbTextData[i][1].."<color>: <color=red>"..LIB_txtData.tbTextData[i][4].." �i�m<color>\n"
	end
	for i=1, getn(tbData) do
		Talk(1,"",tbData[i])
	end
end


function TopBangHoi_NhanThuong(nOption)
	local szTong = GetTongName() or ""
	if szTong == "" then
		Talk(1,"",szNpcName.."C�c h� ch�a gia nh�p bang h�i, kh�ng th� nh�n th��ng.")
		return 0
	end
	if nOption == 1 then
		if GetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),11) == 1 then	--S� d�ng Bit 11 cho th�nh vi�n v� 10 cho bang ch�
			Talk(1,"",szNpcName.."C�c h� �� nh�n th��ng th�nh vi�n r�i, kh�ng th� nh�n th�m l�n n�a.")
			return 0
		end
	elseif nOption == 2 then
		if GetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),10) == 1 then	--S� d�ng Bit 11 cho th�nh vi�n v� 10 cho bang ch�
			Talk(1,"",szNpcName.."C�c h� �� nh�n th��ng Bang ch� r�i, kh�ng th� nh�n th�m l�n n�a.")
			return 0
		end
	end
	LIB_txtData:Init(TOPBANGHOI_FILENAME)
	LIB_txtData:LoadMultiColumn()
	local nCheckTongName = 10000
	local nDiemCongHien = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheckTongName = i
			nDiemCongHien =  LIB_txtData.tbTextData[i][4]
			break
		end
	
	end
	
	-- local nConditionRank = 10000

	-- if max(tonumber(nDiemCongHien) >= 180000 then
		-- nConditionRank = 1
	-- elseif tonumber(nDiemCongHien) >= 175000 then
		-- nConditionRank = 2
	-- elseif tonumber(nDiemCongHien) >= 160000 then
		-- nConditionRank = 3
	-- else
		-- nConditionRank = 4
	-- end
	
	if tonumber(nDiemCongHien) < 150000 then
		Talk(1,"",szNpcName.."�i�m c�ng hi�n kh�ng �� 150000 kh�ng th� nh�n th��ng �ua top.")
		return 0
	end
		
	-- nCheckTongName = min(nCheckTongName,nConditionRank)
	if nOption == 1 then
		if nCheckTongName <= 3 then
			TopBangHoi_NhanThuong_ThanhVien(nCheckTongName)
		else
			Talk(1,"",szNpcName.."Bang h�i c�c h� kh�ng c� trong danh s�ch nh�n th��ng.")
		end
	elseif nOption == 2 then
		if nCheckTongName <= 3 then
			TopBangHoi_NhanThuong_BangChu(nCheckTongName)
		else
			Talk(1,"",szNpcName.."Bang h�i c�c h� kh�ng c� trong danh s�ch nh�n th��ng.")
		end
	end
end


function TopBangHoi_NhanThuong_ThanhVien(nRank)
	if gf_Judge_Room_Weight(20, 300) == 0 then
		Talk(1,"", szNpcName.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 0
	end
--	if VNG_GetTaskPos(TSK_CONGHIENBANG,5,5) == 1 then
	if GetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),11) == 1 then	--S� d�ng Bit 11 cho th�nh vi�n v� 10 cho bang ch�
		Talk(1,"",szNpcName.."C�c h� �� nh�n th��ng th�nh vi�n r�i, kh�ng th� nh�n th�m l�n n�a.")
		return 0
	end
	
	local nChuyenSinh = 5	--gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nPhucSinh = GetPlayerRebornParam(0) or 0
	local nLevel = (nChuyenSinh + nPhucSinh)*100 + GetLevel()				
	if nLevel <  790 then
		Talk(1,"",szNpcName.."��ng c�p c�a c�c h� kh�ng �� nh�n th��ng!")
		return 0
	end
	
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", strNpcName.."C�c h� ch�a gia nh�p m�n ph�i kh�ng th� nh�n th��ng.");
		return
	end
	
	local nJoinTime = GetJoinTongTime();	
	local nDayCount = floor((GetTime()-nJoinTime)/(1*24*3600));
	if nDayCount <=  1 then
		Talk(1,"",szNpcName.."Th�i gian gia nh�p c�a c�c h� �t h�n 1 ng�y, kh�ng th� nh�n th��ng!")
		return 0
	end
--	VNG_SetTaskPos(TSK_CONGHIENBANG, 1, 5, 5)
	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),11,1));
	local tbAward1 = {
		item = {
			{gdp={2,1,30912,4000,4}}, -- hi�p ngh�a chi ch�ng
			{gdp={2,1,30913,180,4}}, -- ��ng t� chi nguy�n
--			{gdp={2,1,30612,200,4}}, -- Thi�t tinh c�p 4
			{gdp={2,1,1113,1,4}, nExpired=7*24*3600}, -- ��i ��nh H�n
			{gdp={0,105,164,1,4,-1,-1,-1,-1,-1,-1,-1}}, -- H�a H�
			{gdp={2,22,100+6, 2}}, -- �� qu� 6
			{gdp={2,22,200+6, 2}}, -- �� qu� 6
			{gdp={2,22,300+6, 2}}, -- �� qu� 6
			{gdp={2,22,400+6, 2}}, -- �� qu� 6
		},
--		nExp = 200000000,
	}
	
	local tbAward2 = {
		item = {
			{gdp={2,1,30912,3000,4}}, -- hi�p ngh�a chi ch�ng
			{gdp={2,1,30913,120,4}}, -- ��ng t� chi nguy�n
--			{gdp={2,1,30612,150,4}}, -- Thi�t tinh c�p 4
			{gdp={2,1,1113,1,4}, nExpired=7*24*3600}, -- ��i ��nh H�n
			{gdp={0,105,164,1,4,-1,-1,-1,-1,-1,-1,-1}}, -- H�a H�
			{gdp={2,22,100+6, 1}}, -- �� qu� 6
			{gdp={2,22,200+6, 1}}, -- �� qu� 6
			{gdp={2,22,300+6, 1}}, -- �� qu� 6
			{gdp={2,22,400+6, 1}}, -- �� qu� 6
		},
--		nExp = 100000000,
	}
	
	local tbAward3 = {
		item = {
			{gdp={2,1,30912,1500,4}}, -- hi�p ngh�a chi ch�ng
			{gdp={2,1,30913,80,4}}, -- ��ng t� chi nguy�n
--			{gdp={2,1,30612,100,4}}, -- Thi�t tinh c�p 4
			{gdp={2,1,1113,1,4}, nExpired=7*24*3600}, -- ��i ��nh H�n
			{gdp={0,105,164,1,4,-1,-1,-1,-1,-1,-1,-1}}, -- H�a H�
			{gdp={2,22,100+5, 2}}, -- �� qu� 5
			{gdp={2,22,200+5, 2}}, -- �� qu� 5
			{gdp={2,22,300+5, 2}}, -- �� qu� 5
			{gdp={2,22,400+5, 2}}, -- �� qu� 5
		},
--		nExp = 80000000,
	}
	tbAward = {
		[1] = tbAward1,
		[2] = tbAward2,
		[3] = tbAward3,
	}
	
	LIB_Award:Award(tbAward[nRank])
	
	Talk(1,"",szNpcName.."Nh�n th�nh c�ng ph�n t��ng d�nh cho th�nh vi�n bang h�ng "..nRank)
	gf_WriteLogEx("TOP BANG HOI THANH VIEN", "th�nh c�ng", 1, "Ph�n th��ng th�nh vi�n bang h�i h�ng "..nRank)
end


function TopBangHoi_NhanThuong_BangChu(nRank)
	local nBody = GetBody()
	if gf_Judge_Room_Weight(20, 300) == 0 then
		Talk(1,"", szNpcName.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 0
	end
--	if VNG_GetTaskPos(TSK_CONGHIENBANG,6,6) == 1 then
	if GetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),10) == 1 then	--S� d�ng Bit 11 cho th�nh vi�n v� 10 cho bang ch�
		Talk(1,"",szNpcName.."C�c h� �� nh�n th��ng bang ch� r�i, kh�ng th� nh�n th�m l�n n�a.")
		return 0
	end
	local nTongLevel = IsTongMember()
	if nTongLevel ~= 1 then
		Talk(1, "",szNpcName.."C�c h� kh�ng ph�i bang ch�. N�u mu�n nh�n th��ng, h�y m�i bang ch� c�c h� ��n g�p ta.");
		return 0
	end
	
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", strNpcName.."C�c h� ch�a gia nh�p m�n ph�i kh�ng th� nh�n th��ng.");
		return
	end
	
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if (nNow - nLastAssignTime) < (7*24*3600)   then
		Talk(1,"",szNpcName.."Th�i gian t�i v� c�a c�c h� �t h�n 7 ng�y, kh�ng th� nh�n th��ng!")
		return 0
	end
	
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP BANG HOI SERVER"..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
--	VNG_SetTaskPos(TSK_CONGHIENBANG, 1, 6, 6)
	SetTask(TSK_TT_VANGDANHTHIENHA_DUATOP,SetBit(GetTask(TSK_TT_VANGDANHTHIENHA_DUATOP),10,1));	
	if nRank == 1 then
		--Th�m trang b� Thanh Long --AddTrangBiHoaPhungTuongQuan(0,0)
--		AddTrangBiThanhLongTuongQuan(0,0)
		AddTrangBiUyHoTuongQuan(0,0)
		TraoMatTichCaoCap20(7)
		local tbAward = {item={{gdp={0,105,30029,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
											{gdp={2,22,100+6, 1}}, -- �� qu� 6
											{gdp={2,22,200+6, 1}}, -- �� qu� 6
											{gdp={2,22,300+6, 1}}, -- �� qu� 6
											{gdp={2,22,400+6, 1}}, -- �� qu� 6	
												}}
		LIB_Award:Award(tbAward)
	elseif nRank == 2 then
--		AddTrangBiHoaPhungTuongQuan(13,0)
		AddTrangBiThanhLongTuongQuan(10,0)
		TraoMatTichCaoCap20(5)
		local tbAward = {item={{gdp={0,105,30026,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
											{gdp={2,22,100+6, 1}}, -- �� qu� 6
											{gdp={2,22,200+6, 1}}, -- �� qu� 6
											{gdp={2,22,300+6, 1}}, -- �� qu� 6
											{gdp={2,22,400+6, 1}}, -- �� qu� 6	
										}}
		LIB_Award:Award(tbAward)
--		TraoLoiHoTuongQuan(13)	
--		Receive_KimXa(10,nRank)		
	elseif nRank == 3 then
--		AddTrangBiHoaPhungTuongQuan(0,0)
		AddTrangBiThanhLongTuongQuan(0,0)
		local tbAward = {item={{gdp={0,105,30026,1,4,-1,-1,-1,-1,-1,-1,-1,0}},
											{gdp={2,22,100+6, 1}}, -- �� qu� 6
											{gdp={2,22,200+6, 1}}, -- �� qu� 6
											{gdp={2,22,300+6, 1}}, -- �� qu� 6
											{gdp={2,22,400+6, 1}}, -- �� qu� 6	
										}}
		LIB_Award:Award(tbAward)
--		TraoMatTichCaoCap20(3)	
--		Receive_KimXa(7,nRank)	
	end
	
	Talk(1,"",szNpcName.."Nh�n th�nh c�ng ph�n t��ng d�nh cho bang h�ng "..nRank)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogaction, 1, "Ph�n th��ng bang ch� bang h�i h�ng "..nRank)
end

function Receive_KimXa(nLevel,nRank)
	local tbSay = {}		
		tinsert(tbSay,"Ta mu�n nh�n trang b� Kim X� V�n Du/#Receive_KimXa_01(1,"..nLevel..","..nRank..")")
		tinsert(tbSay,"Ta mu�n nh�n trang b� Kim X� Thi�t Huy�t/#Receive_KimXa_01(2,"..nLevel..","..nRank..")")
		tinsert(tbSay,"Ta mu�n nh�n trang b� Kim X� Du Hi�p/#Receive_KimXa_01(3,"..nLevel..","..nRank..")")
		Say(strNpcName.."C�c h� h�y l�a ch�n 1 trong 3 b� trang b� Kim X�: ",getn(tbSay),tbSay)
end

function Receive_KimXa_01(nChoice,nLevel,nRank)	
	local	tbKimXaVanDu = {
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
	
	if nChoice  == 1 then
		LIB_Award:Award(tbKimXaVanDu)
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� V�n Du")
	elseif nChoice == 2 then
		LIB_Award:Award(tbKimXaThietHuyet)
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� Thi�t Huy�t")
	elseif nChoice == 3 then
		LIB_Award:Award(tbKimXaDuHiep)
		Msg2Player("Nh�n th�nh c�ng b� trang b� Kim X� Du Hi�p")
	end	
	
	if nRank == 3 then
		receive_DieuDuong_Top1_faction_01(0,1)
	end
end

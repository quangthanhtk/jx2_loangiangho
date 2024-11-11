Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\vng\\config\\vng_feature.lua") 

VUKHI_HH_HHVH_FILE = "\\script\\vng\\weapon_upgrade\\vkhhtohhvh.lua"; --��i v� kh� h�o hi�p th�nh h�o hi�p v� h�
VUKHI_HHVH_TO_AMHUYET_FILE = "\\script\\vng\\weapon_upgrade\\vkhhvhtoamhuyet.lua"; --��i v� kh� h�o hi�p v� h� th�nh �m huy�t
TRANGSUC_HHVH_TO_AMHUYET_FILE = "\\script\\vng\\weapon_upgrade\\trangsuchhvhtoamhuyet.lua"; --��i trang s�c h�o hi�p v� h� th�nh �m huy�t
szNpcName = "<color=green>Gi�o S�: <color>"
szBang = {	
	[1] = {"B�ch H�","1:1.78"},
	[2] = {"��i �ng","1:2"},
	[3] = {"K� H�","1:1.96"},
	[4] = {"M�nh H�","1:1.96"},
	[5] = {"Ng� H�","1:1.74"},
	[6] = {"Ph�c H�","1:1.97"},
	[7] = {"Th�n Long","1:1.66"},
	[8] = {"Thi�n Long","1:1.96"},
	[9] = {"X�ch Long","1:1.97"},
}
	
function main()
	local tSay = {};
	--���
	local tActivityID = {102, 104, 106, 108, 113, 143};
	for k, v in tActivityID do
		if 200 == GetWorldPos() then
			tSay = aah_GetSayDialog(tonumber(v));
		end
	end	
	
	local nDate = tonumber(date("%Y%m%d"))
	if nDate >= 20141103 and nDate <= 20141108 then
		tinsert(tSay,"Ta mu�n xem t�nh tr�ng ��t c��c/show_DuDoan")
		--Event D� �o�n BHTA12
		if gf_GetTaskByte(TSK_DUDOAN_BHTA12,2) == 0 then		
			for i = 1, getn(szBang) do
				tinsert(tSay,"Ta mu�n ��nh c��c Bang H�i "..szBang[i][1].."(t�n Thi�n Ki�u L�nh - T� l� "..szBang[i][2]..")/#DuDoan_02("..i..")")
			end			
		else
			local nBangHoi = gf_GetTaskByte(TSK_DUDOAN_BHTA12,2)
			tinsert(tSay,"Ta mu�n ��nh c��c Bang H�i "..szBang[nBangHoi][1].."(t�n Thi�n Ki�u L�nh - T� l� "..szBang[nBangHoi][2]..")/#DuDoan_02("..nBangHoi..")")
		end
	end
	
	if nDate <= 20141128 then
		tinsert(tSay,"Ta mu�n nh�n th��ng d� �o�n BHTA12/GetReward")
	end
	if nDate <= 20160624 then
		local nExt_Survey = GetExtPoint(EXT_SURVEY2016)
		if nExt_Survey < 1 then
			tinsert(tSay,"Ta mu�n nh�n th��ng Kh�o S�t/Award_Survey")
		end
	end
	if nDate <= 20161118 then
		tinsert(tSay,"��i ��ng Ti�n Th�n K� l�y T� T�i Th�ch/change_dongtien_tutaithach")
	end
	if nDate <= 20161231 then
--		tinsert(tSay,"Nh�n th��ng Kinh M�ch ��ng Nh�n/EventKinhMachDongNhan_092015")
--		tinsert(tSay,"Nh�n th��ng M�t T�ch Ti�u Dao/EventphuThang9_092015")
--		tinsert(tSay,"N�p 24 H�p Qu� B�c + 69 ti�u dao ng�c/#EventPhuThangMenu_do(1)")
--		tinsert(tSay,"N�p 24 H�p Qu� V�ng + 69 ti�u dao ng�c/#EventPhuThangMenu_do(2)")
		tinsert(tSay,"Ta mu�n mua nguy�n li�u �� gh�p event/buy_nguyenlieu")
	end
	if nDate >= 20190723 and nDate <= 20191130 then
		tinsert(tSay,"Ta mu�n ��i H�o Hi�p Gi�i/#change_HaoHiep(1)")
		tinsert(tSay,"Ta mu�n ��i H�o Hi�p B�i/#change_HaoHiep(2)")
		tinsert(tSay,"Ta mu�n ��i H�o Hi�p Gi�i V� H�/#upgrade_HaoHiep_VHHH(1)")
		tinsert(tSay,"Ta mu�n ��i H�o Hi�p B�i V� H�/#upgrade_HaoHiep_VHHH(2)")
		tinsert(tSay,"Ta mu�n ��i V� Kh� H�o Hi�p th��ng/upgrade_VuKhi_HaoHiep")
		tinsert(tSay,"Ta mu�n ��i V� Kh� H�o Hi�p V� H�/upgrade_VuKhi_HaoHiep_VHHH")
	end
	if nDate >= 20200214 and nDate <= 20200314 then
		tinsert(tSay,"N�ng c�p V� Kh� �m Huy�t (10 TMKL, 10 TCL, 1 v� kh� HHVH)/#updateAmHuyet_choose2020(1)")
		tinsert(tSay,"N�ng c�p T� Gi�i �m Huy�t (8 TMKL, 8 TCL, 1 nh�n HHVH ho�c 1 b�i HHVH)/#updateAmHuyet_choose2020(2)")
		tinsert(tSay,"N�ng c�p H�u Gi�i �m Huy�t (8 TMKL, 8 TCL, 1 nh�n HHVH ho�c 1 b�i HHVH)/#updateAmHuyet_choose2020(3)")
		tinsert(tSay,"N�ng c�p Tr�y �m Huy�t (8 TMKL, 8 TCL, 1 nh�n HHVH ho�c 1 b�i HHVH)/#updateAmHuyet_choose2020(4)")
		tinsert(tSay,"N�ng c�p B�i �m Huy�t (8 TMKL, 8 TCL, 1 nh�n HHVH ho�c 1 b�i HHVH)/#updateAmHuyet_choose2020(5)")
	end
	tinsert(tSay, "Tho�t/nothing")
	local msg = "<color=green>Gi�o S�: <color>N�ng c�p trang b� �m Huy�t c�n ti�u hao: Thi�n M�n Kim L�nh, Thi�n Cang L�nh, v� trang b� H�o Hi�p V� H�"
	local szHeader = "<color=green>Gi�o S�:<color>��i hi�p mu�n ��i trang b� H�o Hi�p c�n c�:\n"..
								"<color=yellow>- ��i H�o Hi�p Gi�i (B�i): <color>1 TMKL, 1 TCL\n"..
								"<color=yellow>- ��i H�o Hi�p Gi�i (B�i) V� H�: <color>1 H�o Hi�p Gi�i (B�i), 4 TMKL, 4 TCL\n"..
								"<color=yellow>- ��i V� Kh� H�o Hi�p th��ng: <color>1 TMKL, 1 TCL\n"..
								"<color=yellow>- ��i V� Kh� H�o Hi�p V� H�: <color>1 V� Kh� H�o Hi�p th��ng, 5 TMKL, 5 TCL"
	Say(msg, getn(tSay), tSay);
end

function show_DuDoan()
	local nBang = gf_GetTaskByte(TSK_DUDOAN_BHTA12,2)
	Talk(1,"",szNpcName.."C�c h� �� d� �o�n ���c <color=yellow>"..gf_GetTaskByte(TSK_DUDOAN_BHTA12,3).." Thi�n Ki�u L�nh<color> cho bang h�i <color=yellow>"..szBang[nBang][1].."<color>")
end

function DuDoan_02(nBang)
	if gf_CheckLevel(5,90) ~= 1 then
		Talk(1,"", szNpcName.."C�c h� c�n ��t �t nh�t chuy�n sinh 5 c�p 90 �� ���c d� �o�n!")
		return
	end
	
	if gf_GetTaskByte(TSK_DUDOAN_BHTA12,3) >= 50 then
		Talk(1,"",szNpcName.."C�c h� �� d� �o�n �� s� l��ng. Kh�ng th� ti�p t�c tham gia!")
		return
	end
	
	if gf_GetTaskByte(TSK_DUDOAN_BHTA12,2) ~= 0 then
		if gf_GetTaskByte(TSK_DUDOAN_BHTA12,2) ~= nBang then
			Talk(1,"",szNpcName.."C�c h� ch� ���c d� �o�n 1 bang duy nh�t")
			return
		end
	end	
	
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"",szNpcName.."Tr�ng th�i hi�n t�i kh�ng th� d� �o�n!")
		return
	end	
	
	if gf_Judge_Room_Weight(15, 300) == 0 then
		Talk(1,"", szNpcName.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 
	end

	local tSay = {}
	tinsert(tSay,format("Ta mu�n ��t c��c 5 Thi�n Ki�u L�nh/#DuDoan_01(%d,%d)",nBang,5))
	tinsert(tSay,format("Ta mu�n ��t c��c 10 Thi�n Ki�u L�nh/#DuDoan_01(%d,%d)",nBang,10))
	tinsert(tSay,format("Ta mu�n ��t c��c 15 Thi�n Ki�u L�nh/#DuDoan_01(%d,%d)",nBang,15))
	tinsert(tSay,format("Ta mu�n ��t c��c 20 Thi�n Ki�u L�nh/#DuDoan_01(%d,%d)",nBang,20))
	tinsert(tSay,format("Ta mu�n ��t c��c 50 Thi�n Ki�u L�nh/#DuDoan_01(%d,%d)",nBang,50))
	tinsert(tSay, "Tho�t/nothing")
	Say(szNpcName.."C�c h� mu�n ��t c��c th� n�o?", getn(tSay), tSay);
end

function DuDoan_01(nBang,nDatCuoc)

	if gf_GetTaskByte(TSK_DUDOAN_BHTA12,3) + nDatCuoc > 50 then
		Talk(1,"",szNpcName.."C�c h� ch� ���c d� �o�n t�i �a <color=yellow>50<color> Thi�n Ki�u L�nh!")
		return
	end

	if GetItemCount(2,97,236) < nDatCuoc then
		Talk(1,"",szNpcName.."C�c h� kh�ng �em �� s� l��ng Thi�n Ki�u L�nh!")
		return
	end
	
	if DelItem(2,97,236,nDatCuoc) == 1 then		
		gf_SetTaskByte(TSK_DUDOAN_BHTA12,2,nBang)
		gf_SetTaskByte(TSK_DUDOAN_BHTA12,3,gf_GetTaskByte(TSK_DUDOAN_BHTA12,3) + nDatCuoc)
		gf_WriteLogEx("DU DOAN BHTA12", "du doan thanh cong", nDatCuoc, "du doan "..szBang[nBang][1])	
		Talk(1,"",szNpcName.."C�c h� �� ��t c��c th�nh c�ng <color=yellow>"..nDatCuoc.."<color> cho bang h�i <color=yellow>"..szBang[nBang][1].."<color>")
		return
	else
		Talk(1,"",szNpcName.."��t c��c kh�ng th�nh c�ng, xin vui l�ng th�c hi�n l�i!")
		return
	end
end

function GetReward()
	nBang = gf_GetTaskByte(TSK_DUDOAN_BHTA12,2)
	nBinhChon = gf_GetTaskByte(TSK_DUDOAN_BHTA12,3)
	nNhanThuong = floor(gf_GetTaskByte(TSK_DUDOAN_BHTA12,3) * 1.74)
	
	if gf_GetTaskByte(TSK_DUDOAN_BHTA12,2) == 10 then
		Talk(1,"",szNpcName.."C�c h� �� nh�n th��ng r�i, th�t l� tham qu� m�!")
		return
	end
	
	if nBang ~= 5 or nBinhChon == 0 then
		Talk(1,"",szNpcName.."C�c h� kh�ng tham gia b�nh ch�n ho�c b�nh ch�n bang h�i kh�c!")
		return
	end
	
	if gf_Judge_Room_Weight(2,200) ~= 1 then
		Talk(1,"",szNpcName.."H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return
	end
	
	gf_AddItemEx2({2,97,236,nNhanThuong,4}, "Thi�n Ki�u L�nh", "D� �o�n BHTA12", "Ph�n th��ng Thi�n Ki�u L�nh", 0, 1)
	gf_SetTaskByte(TSK_DUDOAN_BHTA12,2,10)
	gf_WriteLogEx("NHAN THUONG DU DOAN BHTA12", "Thanh Cong", 1, "Nhan thuong")
end

function EventphuThang9_092015()
	local tSay = {};
	
	tinsert(tSay,"N�p 24 N��c Hoa th��ng + 69 ti�u dao ng�c/#EventPhuThangMenu_do(1)")
	tinsert(tSay,"N�p 24 N��c Hoa kh� + 69 ti�u dao ng�c/#EventPhuThangMenu_do(2)")
	tinsert(tSay, "Tho�t/nothing")
	Say("<color=green>Gi�o S�:<color>Ta c� v�i m�n �� qu�, ��i hi�p c� mu�n nh�n kh�ng ?!", getn(tSay), tSay);
end
function EventPhuThangMenu_do(nType)
	local tnguyenlieu = {
				[1] = {30936, "H�p Qu� B�c"},	-- V� tr� 1
				[2] = {30937, "H�p Qu� V�ng"},	-- V� tr� 2
			}
			
	local nCheck = VNG_GetTaskPos(TSK_EVENT_112015, nType, nType)	
	if nCheck >= 3 then
		Talk(1, "", szNpcName.."H�m nay ��i hi�p �� n�p "..nCheck.." l�n lo�i "..tnguyenlieu[nType][2].." r�i. H�y quay l�i v�o ng�y mai.")
		return 0
	end
	if gf_Judge_Room_Weight(3,300) ~= 1 then
		Talk(1,"",szNpcName.."H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return
	end
	if GetItemCount(2,1,tnguyenlieu[nType][1]) < 24 then
		Talk(1, "", szNpcName.."��i hi�p kh�ng mang theo �� 24 " ..tnguyenlieu[nType][2])
		return 0
	end
	if GetItemCount(2,1,30603) < 69 then
		Talk(1, "", szNpcName.."��i hi�p kh�ng mang theo �� 69 Ti�u Dao Ng�c.")
		return 0
	end
	if DelItem(2,1,tnguyenlieu[nType][1],24) == 1 and DelItem(2,1,30603,69) == 1 then
		--SetTask(TSK_EVENTTHANG9,SetBit(GetTask(TSK_EVENTTHANG9),nType,1));
		VNG_SetTaskPos(TSK_EVENT_112015, nCheck+1, nType, nType)	
		if nType == 1 then
			AwardGenuineQi(5000)
		elseif nType == 2 then
			gf_AddItemEx2({2,1,30730,2,4}, "2 kinh mach dong nhan", "EVENT PHU THANG 11/2015 bk", "Ph�n th��ng")
		end
--		gf_AddItemEx2({2,1,30669,50,4}, "50 m�nh m�t t�ch", "EVENT PHU THANG 9/2015 bk", "Ph�n th��ng")
--		gf_AddItemEx2({2,97,236,2,4}, "2 thi�n ki�u l�nh", "EVENT PHU THANG 9/2015 bk", "Ph�n th��ng")
		gf_WriteLogEx("EVENT PHU THANG 11/2015", "Thanh Cong", 1, "Nh�n th��ng lo�i "..nType)
	end
end

function EventKinhMachDongNhan_092015()
	local tSay = {};
	
	tinsert(tSay,"N�p 36 B�nh Trung Thu th��ng + 72 ti�u dao ng�c/#EventKinhMachDongNhan_092015_do(1)")
	tinsert(tSay,"N�p 36 B�nh Trung Thu ��c bi�t + 72 ti�u dao ng�c/#EventKinhMachDongNhan_092015_do(2)")
	tinsert(tSay, "Tho�t/nothing")
	Say("<color=green>Gi�o S�:<color>Ta c� v�i m�n �� qu�, ��i hi�p c� mu�n nh�n kh�ng ?!", getn(tSay), tSay);
end
function EventKinhMachDongNhan_092015_do(nType)
	local tnguyenlieu = {
				[1] = {30919, "B�nh Trung Thu th��ng"},	-- Byte 1
				[2] = {30920, "B�nh Trung Thu ��c bi�t"},	-- Byte 2
			}
	local nCheck = GetByte(GetTask(TSK_KINHMACH_THANG9),nType)
	if nCheck >= 3 then
		Talk(1, "", szNpcName.."H�m nay ��i hi�p �� ��i 3 l�n Kinh M�ch ��ng Nh�n r�i. H�y quay l�i v�o ng�y mai.")
		return 0
	end
	if gf_Judge_Room_Weight(3,300) ~= 1 then
		Talk(1,"",szNpcName.."H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return
	end
	if GetItemCount(2,1,tnguyenlieu[nType][1]) < 36 then
		Talk(1, "", szNpcName.."��i hi�p kh�ng mang theo �� 36 " ..tnguyenlieu[nType][2])
		return 0
	end
	if GetItemCount(2,1,30603) < 72 then
		Talk(1, "", szNpcName.."��i hi�p kh�ng mang theo �� 72 Ti�u Dao Ng�c.")
		return 0
	end
	if DelItem(2,1,tnguyenlieu[nType][1],36) == 1 and DelItem(2,1,30603,72) == 1 then
		SetTask(TSK_KINHMACH_THANG9,SetByte(GetTask(TSK_KINHMACH_THANG9),nType,nCheck+1));
		gf_AddItemEx2({2,1,30730,4,4}, "4 kinh mach dong nhan", "EVENT KINH MACH DONG NHAN THANG 9/2015 bk", "Ph�n th��ng")
		ModifyExp(10000000) --10 tri�u kinh nghi�m
		gf_WriteLogEx("EVENT KINH MACH DONG NHAN THANG 9/2015", "Thanh Cong", 1, "Nh�n th��ng lo�i "..nType)
	end
end
function buy_nguyenlieu()
	local tSay = {};
--	tinsert(tSay, "Ta mu�n mua 2000 gi�y xu�n �� (ti�u hao 15 Ti�u Dao Ng�c)/#finish_buy_nguyenlieu(1)")
	tinsert(tSay, "Ta mu�n mua 2000 C�y Th�ng Gi�o H�i (ti�u hao 90 v�ng)/#finish_buy_nguyenlieu(2)")
--	tinsert(tSay, "Ta mu�n mua 2000 m�c t�u (ti�u hao 15 Ti�u Dao Ng�c)/#finish_buy_nguyenlieu(3)")
	tinsert(tSay, "Ta mu�n mua 2000 v�t Trang Tr� (ti�u hao 180 v�ng)/#finish_buy_nguyenlieu(4)")
--	tinsert(tSay, "Ta mu�n mua 2000 ��i C�t (ti�u hao 50 Ti�u Dao Ng�c)/#finish_buy_nguyenlieu(5)")
	tinsert(tSay, "Ta mu�n mua 2000 Ng�i Sao Gi�ng Sinh (ti�u hao 300 v�ng)/#finish_buy_nguyenlieu(6)")
	tinsert(tSay, "Tho�t/nothing")
	local szHeader = "<color=green>Gi�o S�:<color>Hi�n t�i ta c� r�t nhi�u nguy�n li�u event:"
	Say(szHeader, getn(tSay), tSay);
end
function finish_buy_nguyenlieu(nType)
	local tnguyenlieu = {--x, x, s� l��ng ti�u dao ng�c, v�ng
				[1] = {31018, "gi�y xu�n ��", 15, 0},	
				[2] = {49, "c�y th�ng gi�o h�i", 0, 90},	
				[3] = {31019, "m�c t�u", 15, 0},	
				[4] = {50, "v�t trang tr�", 0, 180},	
				[5] = {31020, "��i C�t", 50, 0},	
				[6] = {51, "ng�i sao gi�ng sinh", 0, 300},	
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
	gf_AddItemEx2({2,200,tnguyenlieu[nType][1],2000}, "nguy�n li�u", "MUA NGUYEN LIEU THANG 2016", "Mua nguy�n li�u")
end
function Award_Survey()
	local tbdanhsach1 = {--acc
	
								}
	local tbdanhsach2 = {--acc								
							
								}							
	local tbdanhsach3 = {--acc
							
								}
															
	local nExt_Survey = GetExtPoint(EXT_SURVEY2016)
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20160624 then
		Talk(1, "", szNpcName.."H�t th�i gian nh�n th��ng")
		return 0
	end
	if nExt_Survey >= 1 then
		Talk(1, "", szNpcName.."��i hi�p �� nh�n th��ng survey r�i")
		return 0
	end							
	if gf_Judge_Room_Weight(1,200) ~= 1 then
		Talk(1,"",szNpcName.."H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return
	end
	local nAcc = GetAccount()
	local nCheck = 0
	for i = 1, getn(tbdanhsach1) do
		if tbdanhsach1[i] ==  nAcc then
			nCheck = 1
			break
		end
	end
	for i = 1, getn(tbdanhsach2) do
		if nCheck == 1 then
			break
		else
			if tbdanhsach2[i] ==  nAcc then
				nCheck = 1
				break
			end
		end
	end
	for i = 1, getn(tbdanhsach3) do
		if nCheck == 1 then
			break
		else
			if tbdanhsach3[i] ==  nAcc then
				nCheck = 1
				break
			end
		end
	end
	if nCheck == 1 then
		AddExtPoint(EXT_SURVEY2016, 1)
		gf_AddItemEx2({0,105,160,1,4,-1,-1,-1,-1,-1,-1,-1}, "Tam vi tuyet ho", "PHAT THUONG SURVEY 2016", "Ph�t th��ng survey",7*24*3600)
	else
		Talk(1,"",szNpcName.."��i hi�p kh�ng c� trong danh s�ch nh�n th��ng")
		return 0
	end
end

function change_dongtien_tutaithach()
	local nCount = GetItemCount(2,1,31007)
	if nCount <= 0 then
		Talk(1, "", "B�n kh�ng c� ��ng Ti�n Th�n K� n�o �� ��i.")
		return 0
	end
	if DelItem(2,1,31007,nCount) == 1 then
		gf_AddItemEx2({2,1,31170,nCount}, "dong tien - tu tai thach", "DOI DONG TIEN", "��i ��ng ti�n")
	end
end
function change_HaoHiep(nType)
	local nNguyenLieu = {--Thi�n M�n Kim L�nh, Thi�n Cang L�nh, C�u Thi�n V� C�c ��n
								[1] = {{2,1,30370,1}, {2,95,204,1},{2,1,1006,0},31126}, 
								[2] = {{2,1,30370,1}, {2,95,204,1},{2,1,1006,0},31127}, 
							}
	if gf_Judge_Room_Weight(1,200) ~= 1 then
		Talk(1,"",szNpcName.."H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return
	end
	local nCount1 = GetItemCount(nNguyenLieu[nType][1][1],nNguyenLieu[nType][1][2],nNguyenLieu[nType][1][3])
	local nCount2 = GetItemCount(nNguyenLieu[nType][2][1],nNguyenLieu[nType][2][2],nNguyenLieu[nType][2][3])
--	local nCount3 = GetItemCount(nNguyenLieu[nType][3][1],nNguyenLieu[nType][3][2],nNguyenLieu[nType][3][3])
	if nCount1 < nNguyenLieu[nType][1][4] then
		Talk(1, "", "B�n kh�ng c� �� Thi�n M�n Kim L�nh �� ��i trang b� H�o Hi�p.")
		return 0
	end						
	if nCount2 < nNguyenLieu[nType][2][4] then
		Talk(1, "", "B�n kh�ng c� �� Thi�n Cang L�nh �� ��i trang b� H�o Hi�p.")
		return 0
	end						
--	if nCount3 < nNguyenLieu[nType][3][4] then
--		Talk(1, "", "B�n kh�ng c� �� C�u Thi�n V� C�c ��n �� ��i trang b� H�o Hi�p.")
--		return 0
--	end	
	local nDelItem1 = DelItem(nNguyenLieu[nType][1][1],nNguyenLieu[nType][1][2],nNguyenLieu[nType][1][3],nNguyenLieu[nType][1][4])
	local nDelItem2 = DelItem(nNguyenLieu[nType][2][1],nNguyenLieu[nType][2][2],nNguyenLieu[nType][2][3],nNguyenLieu[nType][2][4])
--	local nDelItem3 = DelItem(nNguyenLieu[nType][3][1],nNguyenLieu[nType][3][2],nNguyenLieu[nType][3][3],nNguyenLieu[nType][3][4])		
	if nDelItem1 == 1 and nDelItem2 == 1 then --and nDelItem3 == 1 then
		gf_AddItemEx2({0,102,nNguyenLieu[nType][4],1}, "Nang cap hao hiep", "NANG CAP HAO HIEP BK", "N�ng c�p h�o hi�p")
		gf_WriteLogEx("NANG CAP HAO HIEP", "Thanh Cong", 1, "��i lo�i "..nType)
	else
		gf_WriteLogEx("NANG CAP HAO HIEP", "That bai", 1, "��i lo�i "..nType)
	end
end
function upgrade_HaoHiep_VHHH(nType)
	local nNguyenLieu = {--Thi�n M�n Kim L�nh, Thi�n Cang L�nh, Linh Kh� R�c R�, C�u Thi�n V� C�c ��n, H�o Hi�p Gi�i (B�i)
								[1] = {{2,1,30370,4}, {2,95,204,4}, {2,1,31122,0}, {2,1,1006,0},{0,102,31126,1},"H�o Hi�p Gi�i", 30974}, 
								[2] = {{2,1,30370,4}, {2,95,204,4}, {2,1,31122,0}, {2,1,1006,0},{0,102,31127,1},"H�o Hi�p B�i", 30974}, 
							}
	if gf_Judge_Room_Weight(1,200) ~= 1 then
		Talk(1,"",szNpcName.."H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return
	end
	local nCount1 = GetItemCount(nNguyenLieu[nType][1][1],nNguyenLieu[nType][1][2],nNguyenLieu[nType][1][3])
	local nCount2 = GetItemCount(nNguyenLieu[nType][2][1],nNguyenLieu[nType][2][2],nNguyenLieu[nType][2][3])
--	local nCount3 = GetItemCount(nNguyenLieu[nType][3][1],nNguyenLieu[nType][3][2],nNguyenLieu[nType][3][3])
--	local nCount4 = GetItemCount(nNguyenLieu[nType][4][1],nNguyenLieu[nType][4][2],nNguyenLieu[nType][4][3])
	local nCount5 = GetItemCount(nNguyenLieu[nType][5][1],nNguyenLieu[nType][5][2],nNguyenLieu[nType][5][3])
	if nCount1 < nNguyenLieu[nType][1][4] then
		Talk(1, "", "B�n kh�ng c� �� Thi�n M�n Kim L�nh �� ��i trang b� H�o Hi�p V� H�.")
		return 0
	end						
	if nCount2 < nNguyenLieu[nType][2][4] then
		Talk(1, "", "B�n kh�ng c� �� Thi�n Cang L�nh �� ��i trang b� H�o Hi�p V� H�.")
		return 0
	end		
--	if nCount3 < nNguyenLieu[nType][3][4] then
--		Talk(1, "", "B�n kh�ng c� �� Linh Kh� R�c R� �� ��i trang b� H�o Hi�p V� H�.")
--		return 0
--	end				
--	if nCount4 < nNguyenLieu[nType][4][4] then
--		Talk(1, "", "B�n kh�ng c� �� C�u Thi�n V� C�c ��n �� ��i trang b� H�o Hi�p V� H�.")
--		return 0
--	end	
	if nCount5 < nNguyenLieu[nType][5][4] then
		Talk(1, "", "B�n kh�ng c� �� "..nNguyenLieu[nType][6].." �� ��i trang b� H�o Hi�p V� H�.")
		return 0
	end	
	local nDelItem1 = DelItem(nNguyenLieu[nType][1][1],nNguyenLieu[nType][1][2],nNguyenLieu[nType][1][3],nNguyenLieu[nType][1][4])
	local nDelItem2 = DelItem(nNguyenLieu[nType][2][1],nNguyenLieu[nType][2][2],nNguyenLieu[nType][2][3],nNguyenLieu[nType][2][4])
--	local nDelItem3 = DelItem(nNguyenLieu[nType][3][1],nNguyenLieu[nType][3][2],nNguyenLieu[nType][3][3],nNguyenLieu[nType][3][4])		
	local nDelItem4 = DelItem(nNguyenLieu[nType][4][1],nNguyenLieu[nType][4][2],nNguyenLieu[nType][4][3],nNguyenLieu[nType][4][4])	
	local nDelItem5 = DelItem(nNguyenLieu[nType][5][1],nNguyenLieu[nType][5][2],nNguyenLieu[nType][5][3],nNguyenLieu[nType][5][4])	
	if nDelItem1 == 1 and nDelItem2 == 1 and nDelItem4 == 1 and nDelItem5 == 1 then
		gf_AddItemEx2({2,1,nNguyenLieu[nType][7],1}, "Nang cap hao hiep", "NANG CAP HAO HIEP VO HA BK", "N�ng c�p h�o hi�p")
		gf_WriteLogEx("NANG CAP HAO HIEP VO HA", "Thanh Cong", 1, "��i lo�i "..nType)
	else
		gf_WriteLogEx("NANG CAP HAO HIEP VO HA", "That bai", 1, "��i lo�i "..nType)
	end
end
function upgrade_VuKhi_HaoHiep()
	local tbVKHaoHiepThuong = {
		[2] = {{0,3,30724,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 2"},
		[3] = {{0,8,30725,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 4"},
		[4] = {{0,0,30726,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 3"},
		[6] = {{0,1,30727,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 6"},
		[8] = {{0,2,30728,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 8"},
		[9] = {{0,10,30729,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 9"},
		[11] = {{0,0,30730,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 11"},
		[12] = {{0,5,30731,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 12"},
		[14] = {{0,2,30732,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 14"},
		[15] = {{0,9,30733,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 15"},
		[17] = {{0,6,30734,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 17"},
		[18] = {{0,4,30735,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 18"},
		[20] = {{0,7,30736,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 20"},
		[21] = {{0,11,30737,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 21"},
		[23] = {{0,2,30738,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 23"},
		[25] = {{0,3,30739,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 25"},
		[26] = {{0,9,30740,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 26"},
		[27] = {{0,11,30741,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 27"},
		[29] = {{0,13,30742,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 29"},
		[30] = {{0,12,30743,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 30"},
		[31] = {{0,14,32162,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 6"},
		[32] = {{0,2,32190,1,1,-1,-1,-1,-1,-1,-1,-1}, "V� Kh� H�o Hi�p Th��ng 23"},
	}
	local nNguyenLieu = {--Thi�n M�n Kim L�nh, Thi�n Cang L�nh, C�u Thi�n V� C�c ��n
								[1] = {{2,1,30370,1}, {2,95,204,1}, {2,1,1006,0}}, 
							}
	local tbRoute = {[2]=1,[3]=1,[4]=1,[6]=1,[8]=1,[9]=1,[11]=1,[12]=1,[14]=1,[15]=1,[17]=1,[18]=1,[20]=1,[21]=1,[23]=1,[25]=1,[26]=1,[27]=1,[29]=1,[30]=1,[31]=1,[32]=1}						
	if gf_Judge_Room_Weight(1,200) ~= 1 then
		Talk(1,"",szNpcName.."H�nh trang c�a c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return
	end
	local nCount1 = GetItemCount(nNguyenLieu[1][1][1],nNguyenLieu[1][1][2],nNguyenLieu[1][1][3])
	local nCount2 = GetItemCount(nNguyenLieu[1][2][1],nNguyenLieu[1][2][2],nNguyenLieu[1][2][3])
--	local nCount3 = GetItemCount(nNguyenLieu[1][3][1],nNguyenLieu[1][3][2],nNguyenLieu[1][3][3])
	local nRoute = GetPlayerRoute()
	if tbRoute[nRoute] ~= 1 then
		Talk(1,"",strNpcName .. "C�c h� ch�a ch�n h� ph�i n�n kh�ng th� nh�n th��ng.")
		return 0
	end
	if nCount1 < nNguyenLieu[1][1][4] then
		Talk(1, "", "B�n kh�ng c� �� Thi�n M�n Kim L�nh �� ��i trang b� H�o Hi�p.")
		return 0
	end						
	if nCount2 < nNguyenLieu[1][2][4] then
		Talk(1, "", "B�n kh�ng c� �� Thi�n Cang L�nh �� ��i trang b� H�o Hi�p.")
		return 0
	end						
--	if nCount3 < nNguyenLieu[1][3][4] then
--		Talk(1, "", "B�n kh�ng c� �� C�u Thi�n V� C�c ��n �� ��i trang b� H�o Hi�p.")
--		return 0
--	end	
	local nDelItem1 = DelItem(nNguyenLieu[1][1][1],nNguyenLieu[1][1][2],nNguyenLieu[1][1][3],nNguyenLieu[1][1][4])
	local nDelItem2 = DelItem(nNguyenLieu[1][2][1],nNguyenLieu[1][2][2],nNguyenLieu[1][2][3],nNguyenLieu[1][2][4])
--	local nDelItem3 = DelItem(nNguyenLieu[1][3][1],nNguyenLieu[1][3][2],nNguyenLieu[1][3][3],nNguyenLieu[1][3][4])		
	if nDelItem1 == 1 and nDelItem2 == 1 then 	--and nDelItem3 == 1 then	
		gf_AddItemEx2(tbVKHaoHiepThuong[nRoute][1], tbVKHaoHiepThuong[nRoute][2], "NANG CAP VU KHI HAO HIEP 1 BK", "nh�n trang b�")
		gf_WriteLogEx("NANG CAP HAO HIEP", "Thanh Cong", 1, "��i th�nh c�ng")
	else
		gf_WriteLogEx("NANG CAP HAO HIEP", "That bai", 1, "��i th�nh c�ng")
	end
end
function upgrade_VuKhi_HaoHiep_VHHH()
	local nNguyenLieu = {--Thi�n M�n Kim L�nh, Thi�n Cang L�nh, C�u Thi�n V� C�c ��n
								[1] = {{2,1,30370,5}, {2,95,204,5}, {2,1,1006,0}}, 
							}
	local nCount1 = GetItemCount(nNguyenLieu[1][1][1],nNguyenLieu[1][1][2],nNguyenLieu[1][1][3])
	local nCount2 = GetItemCount(nNguyenLieu[1][2][1],nNguyenLieu[1][2][2],nNguyenLieu[1][2][3])
	local nCount3 = GetItemCount(nNguyenLieu[1][3][1],nNguyenLieu[1][3][2],nNguyenLieu[1][3][3])
	if nCount1 < nNguyenLieu[1][1][4] then
		Talk(1, "", "B�n kh�ng c� �� Thi�n M�n Kim L�nh �� ��i trang b� H�o Hi�p.")
		return 0
	end						
	if nCount2 < nNguyenLieu[1][2][4] then
		Talk(1, "", "B�n kh�ng c� �� Thi�n Cang L�nh �� ��i trang b� H�o Hi�p.")
		return 0
	end						
	if nCount3 < nNguyenLieu[1][3][4] then
		Talk(1, "", "B�n kh�ng c� �� C�u Thi�n V� C�c ��n �� ��i trang b� H�o Hi�p.")
		return 0
	end		
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", VUKHI_HH_HHVH_FILE, 1)
end

function updateAmHuyet_choose2020(nType)
	local nNguyenLieu = {--Thi�n M�n Kim L�nh, Thi�n Cang L�nh
								[1] = {{2,1,30370,10}, {2,95,204,10}}, 
								[2] = {{2,1,30370,8 }, {2,95,204,8 }}, 
								[3] = {{2,1,30370,8 }, {2,95,204,8 }}, 
								[4] = {{2,1,30370,8 }, {2,95,204,8 }}, 
								[5] = {{2,1,30370,8 }, {2,95,204,8 }}, 
							}
	local nCount1 = GetItemCount(2,1,30370)
	local nCount2 = GetItemCount(2,95,204)
	
	if nCount1 < nNguyenLieu[nType][1][4] then
		Talk(1, "", szNpcName.."B�n kh�ng c� �� Thi�n M�n Kim L�nh �� ��i trang b� �m Huy�t.")
		return 0
	end						
	if nCount2 < nNguyenLieu[nType][2][4] then
		Talk(1, "", szNpcName.."B�n kh�ng c� �� Thi�n Cang L�nh �� ��i trang b� �m Huy�t.")
		return 0
	end						
	if nType == 1 then
		PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", VUKHI_HHVH_TO_AMHUYET_FILE, 1)	
	else
		VNG_SetTaskPos(TSK_Type_HHVHtoAMHUYET, nType,6,6)
		PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", TRANGSUC_HHVH_TO_AMHUYET_FILE, 1)	
	end
end




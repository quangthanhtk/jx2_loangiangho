--Code by PhucNG,TrungBT2
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\vng\\lib\\vnglib_award.lua") 

PROMOTION_EVERYDAY = "KHUYEN MAI MOI NGAY"
SALEOFF_START_DATE = 20151116
SALEOFF_END_DATE = 20151130
SALEOFF_START_TIME = 1900
SALEOFF_END_TIME = 2100
szNpcName = "<color=green>T� B�o Th��ng Nh�n: <color>"

tbItemSaleOff = {
	{"H�a Th� B�ch",2,1,1001,1,{2,1,1001,1}, 30*24*60*60},	
	{"T�i Thi�n Th�ch Tinh Th�ch",2,1,3356,1,{2,1,3356,1}, 30*24*60*60},
	{"Bao Thi�n Th�ch Tinh Th�ch",2,1,1051,1,{2,1,1051,1}, 30*24*60*60},
	{"C��ng H�a Quy�n 12",2,1,30424,1,{2,1,30424,1}, 30*24*60*60},
	{"C��ng H�a Quy�n 13",2,1,30425,1,{2,1,30425,1}, 30*24*60*60},
	{"C��ng H�a Quy�n 14",2,1,30426,1,{2,1,30426,1}, 30*24*60*60},
--	{"C��ng H�a Quy�n 15",2,1,30427,1,{2,1,30427,1}, 30*24*60*60},
}

--tbThuCuoi = {
--		[1] = {"��c Gi�c Th� B�o B�o", 0,105,30032},
--		[2] = {"Kim K� L�n B�o B�o", 0,105,30017},
--		[3] = {"Kim Mao Ng�u B�o B�o", 0,105,30022},
--		[4] = {"B�o V�ng B�o B�o", 0,105,30030},
--}

function main()
	local nSaySize = 0;
	local szSayHead = "<color=green>Ch� Ti�n Trang: <color>Ta c� r�t nhi�u b�o v�t qu� hi�m, ��i hi�p c�n t�m g�?"
	local tbSay = {}
	local nDate = tonumber(date("%Y%m%d"))
	
	if nDate >= 20180421 and nDate <= 20180430 then
		szSayHead = "<color=green>Ch� Ti�n Trang: <color>Ta c� th� gi�p ��i hi�p c� ���c ngo�i trang <color=yellow>B� D�c Song Phi (v�nh vi�n)<color> c�n: 1 B� D�c Song Phi, 10 Thi�n Cang L�nh, 10 Thi�n M�n Kim L�nh"
		tinsert(tbSay,"Ta mu�n ��i B� D�c Song Phi v�nh vi�n/Change_SongPhiYen")
	end
	if nDate >= 20151116 and nDate <= 20151130 then
		tinsert(tbSay,"Nguy�n Li�u Event/menu_get_nguyenlieu11")
	end
	if nDate >= SALEOFF_START_DATE and nDate <= SALEOFF_END_DATE then
--		for i=1, getn(tbThuCuoi) do
--			tinsert(tbSay, "Mua "..tbThuCuoi[i][1].." gi� r� (999 v�ng)/#MuaThuCuoi("..i..")")
--		end
		tinsert(tbSay,"Kinh Th� Trao Tay/menu_get_KinhThu")		
	end
	tinsert(tbSay,"Ta ch� gh� xem/gf_Nothing")
	Say(szSayHead, getn(tbSay), tbSay)
	--:::::::::::::::::: Sieu Khuyen Mai :::::::::::::::::::::::::::
--	local nDate = tonumber(date("%Y%m%d"))
--	local nTime = tonumber(date("%H%M"))
--	if nDate >= SALEOFF_START_DATE and nDate <=SALEOFF_END_DATE then
--		if nTime >= SALEOFF_START_TIME and nTime < SALEOFF_END_TIME then
--			tbSayDialog = SaleOff_CreateMenu()
--		else
--			Talk(1,"",szNpcName.."C�a ti�m c�a ta ch� m� c�a t� 19:00 ��n 21:00, c�c h� h�y tranh th� ��n v�o ��ng th�i �i�m.!")
--			return 0
--		end
--	end
--	gf_PageSay(tbSayDialog, 1, 6)
	--------------------------------------------------------------
end
function menu_get_nguyenlieu11()
	local nSaySize = 0;
	local szSayHead = "<color=green>Ch� Ti�n Trang: <color> Nguy�n Li�u Event ah, ta c� v�i c�i, ng��i c� mu�n mua kh�ng?"
	local tbSay = {}	
	tinsert(tbSay,"Ta mu�n mua 1000 T�i Qu� (ti�u hao 23 Ti�u Dao Ng�c)/#get_nguyenlieu11(1)")
	tinsert(tbSay,"Ta mu�n mua 1000 Gi�y B�c (ti�u hao 23 Ti�u Dao Ng�c)/#get_nguyenlieu11(2)")
	tinsert(tbSay,"Ta mu�n mua 1000 Thi�p T�n S� (ti�u hao 31 Ti�u Dao Ng�c)/#get_nguyenlieu11(3)")
	tinsert(tbSay,"Ta ch� gh� xem/gf_Nothing")
	Say(szSayHead, getn(tbSay), tbSay)
end
function menu_get_KinhThu()
	local nSaySize = 0;
	local szSayHead = "<color=green>Ch� Ti�n Trang: <color>Kinh Th� ta c� r�t nhi�u, ng��i c� mu�n nh�n kh�ng?"
	local tbSay = {}
	tinsert(tbSay,"Ta mu�n nh�n 111 V� T� Kinh Th�/#get_KinhThu(1)")
	tinsert(tbSay,"Ta mu�n nh�n 222 V� T� Kinh Th�/#get_KinhThu(2)")
	tinsert(tbSay,"Ta mu�n nh�n 333 V� T� Kinh Th�/#get_KinhThu(3)")
	tinsert(tbSay,"Ta ch� gh� xem/gf_Nothing")
	Say(szSayHead, getn(tbSay), tbSay)
end
function gf_Nothing()

end
function MuaThuCuoi(nOption)
	if gf_JudgeRoomWeight(1,200) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	if GetCash() < 9990000 then
		Talk(1,"",szNpcName.."Thu�n mua v�a b�n, <color=yellow>999<color> v�ng c�a ng��i ��u? �� ti�n ta m�i giao h�ng nh�!!");
		return 0
	end
	if Pay(9990000) == 1 then
		local tbAward = {item={{gdp={tbThuCuoi[nOption][2],tbThuCuoi[nOption][3],tbThuCuoi[nOption][4],1,1,-1,-1,-1,-1,-1,-1,-1}, name= tbThuCuoi[nOption][1], nExpired = 7*24*60*60}}}
		LIB_Award.szLogTitle = "BAN THU CUOI GIA RE"
		LIB_Award.szLogAction = "mua"
		LIB_Award:Award(tbAward)
	end
end

--****************************************************************
--			Si�u khuy�n m�i - BEGIN
--****************************************************************
function SaleOff_CreateMenu()
	local tSay = {}
	local szFileName = date("%Y%m%d") .. ".txt"
--	local nQuay =  5 - GetTask(TSK_QUAYSOMAYMAN)
	LIB_txtData:Init(szFileName)
	local nRet = LIB_txtData:LoadMultiColumn();
		if nRet > 0 then
			tSay[0] =  szNpcName.."Ta m�i �em v� l� h�ng gi� ��c bi�t, m�i v� l�m h�o ki�t ��n xem th�!!!"
			--tinsert(tSay,"Ta mu�n quay s� may m�n m�ng n�m m�i(C�n l�i "..nQuay.." l�n quay - Ti�u hao 20 ti�u dao ng�c)/QuaySoMayMan")
			for i = 1, getn(LIB_txtData.tbTextData) do
				local szItem = tbItemSaleOff[i][1]
				local nQty = tonumber(LIB_txtData.tbTextData[i][1])
				local nPrize = tonumber(LIB_txtData.tbTextData[i][2])
				local szExpired = ""
				if tonumber(LIB_txtData.tbTextData[i][3]) > 0 then
					szExpired = ", h�n s� d�ng ".. LIB_txtData.tbTextData[i][3] .. "ng�y"
				end
				if i >= 1 and i <= 3 then
					tinsert(tSay ,szItem..": Gi� " .. nPrize  .. " Bao Ti�u dao ng�c" .. szExpired .." (c�n l�i: " .. nQty ..")/#MuaSieuKhuyenMai("..i..")")
				else
					tinsert(tSay ,szItem..": Gi� " .. nPrize  .. " T�i Ti�u dao ng�c" .. szExpired .." (c�n l�i: " .. nQty ..")/#MuaSieuKhuyenMai("..i..")")
				end
			end
		else
			tSay[0] =  szNpcName.."H�ng h�a h�m nay kh�ng c�, khi kh�c c�c h� ��n nh�!!!"
		end	
	return tSay
end
--
--
function MuaSieuKhuyenMai(nOption)
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i h�nh trang.")
		return 0
	end
	local nTime = GetTime()
	if nTime < (GetGlbValue(GLB_TASK_PROMOTION) + 5) then
		local nTimeRemain = (GetGlbValue(GLB_TASK_PROMOTION) + 5) - GetTime()
		Talk(1,"","Nhi�u ng��i mua qu�, cho ta ngh� m�t m�t t�. H�y quay l�i sau "..nTimeRemain.." gi�y n�a !!!")
		return 0
	end
	
	local szFileName = date("%Y%m%d") .. ".txt"
	LIB_txtData:Init(szFileName)
	local nRet = LIB_txtData:LoadMultiColumn();
	if nRet == 0 then
		return 0
	end
	local nQty = tonumber(LIB_txtData.tbTextData[nOption][1])
	if nQty <= 0 then
		Talk(1,"",szNpcName.."<color=yellow>"..tbItemSaleOff[nOption][1].." �� h�t, hay l� c�c h� h�y ch�n m�n kh�c nh�!.")
		return 0
	end
	if nOption <= 3 then
		if GetItemCount(2,1,30605) <  tonumber(LIB_txtData.tbTextData[nOption][2]) then
			Talk(1,"",szNpcName.."C�c h� kh�ng �� bao ti�u dao ng�c �� mua m�n n�y, hay ch�n m�n kh�c r� h�n?.")
			return 0
		end
	else
		if GetItemCount(2,1,30604) <  tonumber(LIB_txtData.tbTextData[nOption][2]) then
			Talk(1,"",szNpcName.."C�c h� kh�ng �� t�i ti�u dao ng�c �� mua m�n n�y, hay ch�n m�n kh�c r� h�n?.")
			return 0
		end
	end
	LIB_txtData.tbTextData[nOption][1] = nQty - 1
	LIB_txtData:SaveMultiColumn()
	
	LIB_Award.szLogTitle = "SIEU KHUYEN MAI THANG 10/2015"
	LIB_Award.szLogAction = "mua"
	local nHSD = tonumber(LIB_txtData.tbTextData[nOption][3]) * 24*60*60
	local tbAward = {
			item={gdp={tbItemSaleOff[nOption][2],tbItemSaleOff[nOption][3],tbItemSaleOff[nOption][4],1}, name = tbItemSaleOff[nOption][1], nExpired = nHSD}
	}
	if nOption <= 3 then
		if DelItem(2,1,30605,tonumber(LIB_txtData.tbTextData[nOption][2])) ~= 1 then
			return 0
		end
	else
		if DelItem(2,1,30604,tonumber(LIB_txtData.tbTextData[nOption][2])) ~= 1 then
			return 0
		end
	end
	LIB_txtData.tbTextData[nOption][1] = nQty - 1
	LIB_txtData:SaveMultiColumn()
	--LIB_Award:Award(tbAward)
	SetGlbValue(GLB_TASK_PROMOTION, GetTime())
	--Talk(1,"","Thanh cong - " ..nHSD)
	gf_AddItemEx2(tbItemSaleOff[nOption][6], tbItemSaleOff[nOption][1], PROMOTION_EVERYDAY, "mua "..tbItemSaleOff[nOption][1], tbItemSaleOff[nOption][7])
end

function QuaySoMayMan()
	local tbRate =
	{
		[1] = {1398,"Thi�n Ki�u L�nh"},
		[2] = {100,"Bao Thi�n Ki�u L�nh Nh�"},
		[3] = {1000,"Thi�n Th�ch Tinh Th�ch"},
		[4] = {1,"Ti�n Du Ki�m"},
		[5] = {1,"B�o �en B�o B�o"},
		[6] = {1500,"Minh Nguy�t D�"},
		[7] = {1500,"B�nh B�t V�ng"},
		[8] = {1000,"B�n Long B�ch"},
		[9] = {1500,"10.000.000 kinh nghi�m"},
		[10] = {2000,"5.000.000 kinh nghi�m"},
	}		
	
	local nQuay =  5 - GetTask(TSK_QUAYSOMAYMAN)
	if nQuay <= 0 then
		Talk(1,"",szNpcName.."L��t quay h�m nay �� h�t. Xin quay l�i ng�y h�m sau!")
		return 0 
	end
	
	if gf_CheckLevel(5,90) ~= 1 then
		Talk(1,"",szNpcName.."C�c h� kh�ng ��t chuy�n sinh 5 c�p 90, kh�ng th� quay s� may m�n!")
		return 0
	end
	
	if gf_Judge_Room_Weight(2,100) ~= 1 then
		Talk(1,"",szNpcName.."H�nh trang c�c h� kh�ng �� � tr�ng ho�c �� n�ng!")
		return 0
	end
	
	if GetItemCount(2,1,30603) < 20 then
		Talk(1,"",szNpcName.."C�c h� kh�ng �em �� 20 Ti�u dao ng�c trong ng��i!")
		return 0
	end
	
	SetTask(TSK_QUAYSOMAYMAN,GetTask(TSK_QUAYSOMAYMAN) + 1)
	DelItem(2,1,30603,20)
	
	local nIdRate = get_random_event_item(tbRate,10000)
	local szFileName = "quayso"..date("%Y%m%d") .. ".txt"
	LIB_txtData:Init(szFileName)
	LIB_txtData:LoadMultiColumn()
	
	local nNum = tonumber(LIB_txtData.tbTextData[nIdRate][2])
	if nNum <= 0 then
		--Talk(1,"",szNpcName.."C�c h� �� tr�ng th��ng "..tbRate[nIdRate][2].. " xin ch�c m�ng. Xui thay,ph�n th��ng lo�i n�y �� h�t, xin h�y ki�n tr� quay l�i l�n n�a!")
		--return 0
		nIdRate = 9
	end		
	
	if nIdRate == 1 then
		gf_AddItemEx2({2,97,236 , 1}, "Thi�n Ki�u L�nh", "Quay So May Man 2015", "Nhan",0,1)
	end
	
	if nIdRate == 2 then
		gf_AddItemEx2({2,95,2086 , 1}, "Bao Thi�n Ki�u L�nh Nh�", "Quay So May Man 2015", "Nhan",0,1)
	end
	
	if nIdRate == 3 then
		gf_AddItemEx2({2,1,1009 , 1}, "Thi�n Th�ch Tinh Th�ch", "Quay So May Man 2015", "Nhan",3600 * 24 * 7,1)
	end
	
	if nIdRate == 4 then
		gf_AddItemEx2({0,105,10110 , 1,4,-1,-1,-1,-1,-1,-1,-1,0}, "Ti�n Du Ki�m", "Quay So May Man 2015", "Nhan",0,1)
	end
	
	if nIdRate == 5 then
		gf_AddItemEx2({0,105,30029 , 1,4,-1,-1,-1,-1,-1,-1,-1,0}, "B�o �en B�o B�o", "Quay So May Man 2015", "Nhan",0,1)
	end
	
	if nIdRate == 6 then
		gf_AddItemEx2({1,1,17 , 10}, "Minh Nguy�t D�", "Quay So May Man 2015", "Nhan",0,1)
	end
	
	if nIdRate == 7 then
		gf_AddItemEx2({1,1,15 , 10}, "B�nh B�t V�ng", "Quay So May Man 2015", "Nhan",0,1)
	end
	
	if nIdRate == 8 then
		gf_AddItemEx2({2,1,1000 , 1}, "B�n Long B�ch", "Quay So May Man 2015", "Nhan",3600*24*7,1)
	end
	
	if nIdRate == 9 then
		gf_Modify("Exp",10000000)
		gf_WriteLogEx("Quay So May Man 2015", "nh�n th�nh c�ng", 1, "10000000 Kinh Nghiem")
	end
	
	if nIdRate == 10 then
		gf_Modify("Exp",5000000)
		gf_WriteLogEx("Quay So May Man 2015", "nh�n th�nh c�ng", 1, "5000000 Kinh Nghiem")
	end	
	
	AddGlobalNews("S� ki�n quay s� may m�n: C�c h� "..GetName().." �� tr�ng th��ng "..tbRate[nIdRate][2])
	LIB_txtData.tbTextData[nIdRate][2] = tonumber(LIB_txtData.tbTextData[nIdRate][2]) - 1
	LIB_txtData:SaveMultiColumn()
	SetGlbValue(GLB_TASK_PROMOTION, GetTime())
end

function get_random_event_item(nTab, nDeterminator)
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTab) do
		nBase = nBase + nTab[i][1]
		if nRandom <= nBase then
			return i
		end
	end
	return getn(nTab)
end




--****************************************************************
--			Si�u khuy�n m�i - END
--****************************************************************
--function get_selloff()
--	local nTime = tonumber(date("%H%M"))
--	if nTime < 0800 or nTime > 2400 then
--		Talk(1,"","Hi�n t�i ch�a ��n gi� b�n, ��i hi�p h�y quay l�i sau nha !!!")		
--		return
--	end
--	local tbSayDialog = {};
--	tinsert(tbSayDialog, "��ng � /confirm_buy")
--	tinsert(tbSayDialog, "Ta ch� gh� ngang /do_nothing")	
--	Say("Ch��ng tr�nh khuy�n m�i gi� r�", getn(tbSayDialog), tbSayDialog);
--end
--function get_infor()
--	proday:load()
--	local nNumremain = 0
--	local nDate = tonumber(date("%Y%m%d"))
--	if nDate ~= proday.tList["baothienthach"][2] then
--		nNumremain = 500
--	else
--		nNumremain = proday.tList["baothienthach"][1]
--	end
--	Talk(1,"","S� l��ng c�n c� th� mua trong ng�y hi�n t�i l�: "..nNumremain.." c�i")	
--end
--
--function confirm_buy()
--	proday:load()
--	---------------------------------
--	local nDate = tonumber(date("%Y%m%d"))
--	local nTime = GetTime()
--	print(proday.tList["baothienthach"][2])
--	if nDate ~= proday.tList["baothienthach"][2] then
--		proday.tList["baothienthach"][1] = 500
--	end
--	
--	if nTime < (GetGlbValue(GLB_TASK_PROMOTION) + 6) then
--		local nTimeRemain = (GetGlbValue(GLB_TASK_PROMOTION) + 6) - GetTime()
--		Talk(1,"","Nhi�u ng��i mua qu�, cho ta ngh� m�t m�t t�. H�y quay l�i sau "..nTimeRemain.." gi�y n�a !!!")
--		return
--	end
--	---------------------------------
--	if proday.tList["baothienthach"][1] <= 0 then
--		Talk(1,"","Th�t ��ng ti�c! �� h�t h�ng gi�m gi� r�i. Ng�y mai ��i hi�p nh� gh� s�m nh�  !!!")
--		return
--	end
--	if IsPlayerDeath() ~= 0 then 
--		Talk(1, "", "Hi�n t�i kh�ng th� mua !!!")
--		return
--	end
--	if gf_Judge_Room_Weight(2, 100," ") ~= 1 then
--        	return
--    end
--	if GetItemCount(2,1,30230) < 500 then
--		Talk(1,"","Hi�n kh�ng c� �� Xu, ��i hi�p vui l�ng quay l�i v�o l�c kh�c!")
--		return
--	end
--
--	SetGlbValue(GLB_TASK_PROMOTION, GetTime())
--	gf_WriteLogEx("THAM GIA KHUYEN MAI", "mua th�nh c�ng")
--	proday:register()
--	if DelItem(2, 1, 30230, 500) == 1  then
----		gf_WriteLogEx("THAM GIA KHUYEN MAI", "mua th�nh c�ng")
--		gf_AddItemEx2({2, 1, 1001, 1}, "Hoa Thi Bich", PROMOTION_EVERYDAY, "mua H�a Th� B�ch", 7*24*60*60)
--		Talk(1,"","C�c h� �� mua th�nh c�ng 1 H�a Th� B�ch")
--		Msg2Player("C�c h� �� mua th�nh c�ng 1 H�a Th� B�ch")
--	--	AddGlobalNews("Ch�c m�ng ��i hi�p <color=yellow>"..GetName().."<color> �� mua th�nh c�ng 1 Bao Thi�n Th�ch Tinh Th�ch v�i gi� r�.")
--	end
--end
--
--function do_nothing()
--
--end
function get_lucky_2thang9()
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	local nQuay = VNG_GetTaskPos(TSK_MATTICH_TIEUDAO, 7,6)	
--	if nChuyenSinh < 590 then 
--		Talk(1,"","<color=green>Ch� Ti�n Trang: <color>��i hi�p ch�a ��t chuy�n sinh 5 c�p 90, ta kh�ng th� gi�p g� ���c c� !!!!")
--		return 0	
--	end
	if gf_Judge_Room_Weight(4,100) ~= 1 then
		Talk(1,"","<color=green>Ch� Ti�n Trang: <color>H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
        	return 0
	end
	if nQuay >= 15 then
		Talk(1,"","<color=green>Ch� Ti�n Trang: <color>H�m nay ��i hi�p �� th� h�t l�n quay may m�n.")
        	return 0
	end
	if GetItemCount(2,1,30603) < 27 then
		Talk(1,"","<color=green>Ch� Ti�n Trang: <color>��i hi�p kh�ng mang �� 27 ti�u dao ng�c.")
        	return 0
	end
	if DelItem(2,1,30603,27) ~= 1 then
		gf_WriteLogEx("EVENT 2 THANG 9 NAM 2015 bk", "kh�ng th�nh c�ng", 1, "quay kh�ng th�nh c�ng")
		return 0
	end
	--SetTask(TSK_EVENT_NIEMVUI, GetTask(TSK_EVENT_NIEMVUI)+1)
	VNG_SetTaskPos(TSK_MATTICH_TIEUDAO, nQuay+1, 7, 6)	
	local tAward2thang9 = {
					{31, 17998, "get_ChanKhi(3000)", 0},
					{1, 10000, "Thi�t tinh c�p 3", {2, 1, 30535, 3}, 0},
					{1, 15000, "T�y t�m c�p 3", {2, 1, 30523, 3}, 0},
					{1, 15000, "Luy�n L� Thi�t c�p 3", {2, 1, 30529, 3}, 0},
					{1, 12000, "Kinh m�ch ��ng nh�n", {2, 1, 30730, 3}, 0},
					{1, 15000, "B�ng Tinh Th�ch", {2, 1, 30554, 5}, 0},
					{1, 15000, "B�n Long b�ch", {2, 1, 1000, 1}, 15*24*3600},
					{1, 1, "H�a Th� B�ch", {2, 1, 1001, 1}, 15*24*3600},
					{1, 1, "Bao Thi�n Ki�u L�nh", {2, 95, 2087, 1}, 30*24*3600},
					}
	ModifyExp(5311015)	--th��ng exp m�i l�n quay				
	gf_EventGiveRandAward(tAward2thang9, 100000, 1, "EVENT 2 THANG 9 NAM 2015 bk", "award ng�u nhi�n");				
--	gf_AddItemEx2({2,1,30191,2}, "ng�i sao", "EVENT 2 THANG 9 NAM 2015 bk", "nh�n th��ng th�nh c�ng",7 * 24 * 3600)
	gf_WriteLogEx("EVENT 2 THANG 9 NAM 2015", "th�nh c�ng", 1, "quay th�nh c�ng")
	if nQuay == 14 then	--quay 14 l�n+l�n �ang quay = 15 l�n
		local nBody = GetBody()	
		for i = 1, 3 do
			gf_AddItemEx2({0,107+i,679+nBody,1,4}, "Ngo�i trang �m h�n", "EVENT 2 THANG 9 NAM 2015", "nh�n ngo�i trang",7 * 24 * 3600)
		end
	end
end
function get_ChanKhi(nDiem)
	AwardGenuineQi(nDiem);
end
function get_KinhThu(nType)
	local nCheck = VNG_GetTaskPos(TSK_MATTICH_TIEUDAO, nType+2,nType+2)
	if nCheck >= 1 then
		Talk(1,"", "<color=green>Ch� Ti�n Trang: <color>H�m nay ��i hi�p �� nh�n Kinh Th� lo�i n�y r�i, h�y ch�n lo�i kh�c ho�c quay l�i v�o ng�y mai.")
		return 0
	end
	if GetItemCount(2,1,199) < nType then
		Talk(1,"", "<color=green>Ch� Ti�n Trang: <color>��i hi�p kh�ng mang �� "..nType.." ��i Ng�n Phi�u �� ��i Kinh Th�.")
		return 0
	end
	if gf_Judge_Room_Weight(1,100) ~= 1 then
		Talk(1,"","<color=green>Ch� Ti�n Trang: <color>H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
        	return 0
	end
	if DelItem(2,1,199,nType) ~= 1 then
		return 0
	end
	if nType == 1 or nType == 2 or nType == 3 then
		VNG_SetTaskPos(TSK_MATTICH_TIEUDAO, 1, nType+2, nType+2)		
		gf_AddItemEx2({2,1,30785,111*nType,4}, "v� t� kinh th�", "KINH THU TRAO TAY bk", "nh�n")
		gf_WriteLogEx("KINH THU TRAO TAY", "th�nh c�ng "..nType, 1, "Mua d�ng "..nType)
	else
		Talk(1,"", "Hi�n t�i ta kh�ng c� g� ��a cho c�c h�.")
		return 0
	end
end
function get_nguyenlieu11(nType)
	local tbCondition = {--So luong TieuDaoNgoc, ID TieuDaoNgoc, ID VatPhamEvent, S� l��ng VatPhamEvent
								[1] = {23, 30603, 1000, 30933}, --T�i qu�
								[2] = {23, 30603, 1000, 30934}, --Gi�y b�c	
								[3] = {31, 30603, 1000, 30935}, --Thi�p T�n S�
							}
	if gf_Judge_Room_Weight(2,100) ~= 1 then
		Talk(1,"","<color=green>Ch� Ti�n Trang: <color>H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
        	return 0
	end
	if GetItemCount(2,1,tbCondition[nType][2]) < tbCondition[nType][1] then
		Talk(1,"", "<color=green>Ch� Ti�n Trang: <color>��i hi�p kh�ng mang �� "..tbCondition[nType][1].." Ti�u Dao Ng�c �� ��i nguy�n li�u.")
		return 0
	end
	if DelItem(2,1,tbCondition[nType][2],tbCondition[nType][1]) == 1 then
		gf_AddItemEx2({2,1,tbCondition[nType][4],tbCondition[nType][3]}, "nguy�n li�u", "MUA NGUYEN LIEU EVENT bk", "nh�n")
		gf_WriteLogEx("MUA NGUYEN LIEU EVENT", "th�nh c�ng "..nType, 1, "Mua d�ng "..nType)
	end
end

function Change_SongPhiYen()
	local tPhiYen = {
						[1] = {0,120,259},
						[2] = {0,120,260},
						[3] = {0,120,261},
						[4] = {0,120,262},
					}
	local nCheck = 0
	if gf_Judge_Room_Weight(2,100) ~= 1 then
		Talk(1,"","<color=green>Ch� Ti�n Trang: <color>H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
        	return 0
	end
	for i = 1, getn(tPhiYen) do
		if GetItemCount(tPhiYen[i][1],tPhiYen[i][2],tPhiYen[i][3]) > 0 then
			nCheck = 1
			break
		end
	end
	if nCheck == 0 then
		Talk(1,"", "<color=green>Ch� Ti�n Trang: <color>��i hi�p kh�ng c� B� D�c Song Phi trong h�nh trang �� ��i.")
		return 0
	end
	if GetItemCount(2,95,204) < 10 then
		Talk(1,"", "<color=green>Ch� Ti�n Trang: <color>��i hi�p kh�ng mang �� 10 Thi�n Cang L�nh.")
		return 0
	end
	if GetItemCount(2,1,30370) < 10 then
		Talk(1,"", "<color=green>Ch� Ti�n Trang: <color>��i hi�p kh�ng mang �� 10 Thi�n M�n Kim L�nh.")
		return 0
	end
	if DelItem(2,95,204,10) == 1 and DelItem(2,1,30370,10) == 1 then
		for i = 1, getn(tPhiYen) do
			if GetItemCount(tPhiYen[i][1],tPhiYen[i][2],tPhiYen[i][3]) > 0 then
				DelItem(tPhiYen[i][1],tPhiYen[i][2],tPhiYen[i][3],1)
				nCheck = 2
				break
			end
		end
		if nCheck == 2 then
			local nKHinh = GetBody()
			gf_AddItemEx2({tPhiYen[nKHinh][1],tPhiYen[nKHinh][2],tPhiYen[nKHinh][3],1,4}, "nguy�n li�u", "DOI SONG PHI YEN bk", "nh�n")			
		end
		gf_WriteLogEx("DOI SONG PHI YEN", "th�nh c�ng ki�u h�nh"..nKHinh, 1, "��i d�ng "..nKHinh)
	end

end
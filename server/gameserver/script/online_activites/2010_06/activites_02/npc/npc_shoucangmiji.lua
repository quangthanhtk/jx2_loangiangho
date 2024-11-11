--=============================================
--create by zhangming 2010.5.12
--describe:Խ�ϰ�2010��6�»2 �ղ��ؼ�ר��NPC�ű��ļ�
--=============================================
Include("\\script\\online_activites\\2010_06\\activites_02\\head.lua");--�ͷ�ļ�
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");
Import("\\script\\lib\\globalfunctions.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

FILE_NAME = "\\script\\online_activites\\2010_06\\activites_02\\npc\\npc_shoucangmiji.lua"
VET_201006_STR_NPC_NAME = gf_FixColor(VET_201006_02_TB_NPC_LIST[1][2],2,1)

function main()
--   if gf_CheckEventDateEx(VET_201006_02_EVENT_NUMBER) == 1 then
        local tbSel = {}
        local nDate = tonumber(date("%y%m%d"));
--		tinsert(tbSel, 1, "Ta mu�n ��i 1 cu�n m�t t�ch 70 cao c�p ng�u nhi�n (5 Tu ch�n y�u quy�t + 400 S�c�la)/BuyVET_70_GAOJIMIJI");
--		tinsert(tbSel, 1, "Ta mu�n ��i 1 cu�n m�t t�ch 70 cao c�p ng�u nhi�n (ti�u hao 2 Ho�ng Kim ��i H�ng Bao(999 v�ng)/BuyVET_70_GAOJIMIJI_New");
		
		--tinsert(tbSel, "Ta mu�n ��i 1 cu�n m�t t�ch Tr�n Ph�i (ti�u hao 3 ��i Ng�n Phi�u)/BuyVET_70_GAOJIMIJI_byFaction");		
		--tinsert(tbSel, "Luy�n nhanh M�t t�ch ch�nh/MatTichChinh_Fast");
		tinsert(tbSel, "Luy�n nhanh M�t t�ch ph�/MatTichPhu_Fast");
		--tinsert(tbSel, "Ta mu�n mua m�t cu�n m�t t�ch/MatTichSoCap_Mua_Page1");
		tinsert(tbSel, format("%s/#WLib:OpenEquipShop(%d)", "Ta mu�n mua m�t cu�n m�t t�ch", EQUIP_SHOP_BUY_COMMON_BOOK));
		tinsert(tbSel, "Ta mu�n mua m�t t�ch m�n ph�i c�p 45/MatTichMonPhai45");
		tinsert(tbSel, VET_201006_02_TB_STRING_LIST[2].."/change_school_book");
		tinsert(tbSel, VET_201006_02_TB_STRING_LIST[3].."/gf_DoNothing");
		
        local szDialogTitle = VET_201006_02_TB_STRING_LIST[1];
        Say(szDialogTitle,getn(tbSel),tbSel)
        return 0;
--    end
end

function change_school_book()
    PutinItemBox(VET_201006_02_TB_STRING_LIST[4] ,5 , VET_201006_02_TB_STRING_LIST[5], FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
    if param ~= 1 then
        return 0;
    end
    if genre ~= 0 or detail ~= 107 or particular < 1 or particular > 28 then
        Talk(1, "", VET_201006_STR_NPC_NAME..VET_201006_02_TB_STRING_LIST[6]);
        return 0;
    end
    if GetItemSpecialAttr(idx,"LOCK") == 1 then --�����ж�
		Talk(1,"","V�t ph�m n�y l� v�t ph�m kh�a, m� kh�a r�i ��i nh�!");
		return 0;
	end
    return 1;
end
	
function OnPutinComplete(param)
    if param ~= 1 then
        Talk(1, "", VET_201006_STR_NPC_NAME..VET_201006_02_TB_STRING_LIST[7]);
        return 0;
    end
    local t = GetPutinItem()
    if getn(t) ~= 5 then		-- ������
        return 0;
    end
    if get_item_count(t) ~= 5 then
        Talk(1, "", VET_201006_STR_NPC_NAME..VET_201006_02_TB_STRING_LIST[7]);
        return 0;
    end
    if GetCash() < 1000000 then
        Talk(1, "", VET_201006_STR_NPC_NAME..VET_201006_02_TB_STRING_LIST[8]);
        return 0;
    end
    local nResult = 1;
    for i = 1, getn(t) do
	if DelItemByIndex(t[i][1], -1) ~= 1 then
	    nResult = 0;
	end
    end
    if nResult == 1 and Pay(1000000) == 1 then
    --������ؼ�
        gf_EventGiveRandAward(VET_201006_02_TB_CHANGE_BOOK_LIST, 100, 1, VET_201006_02_STR_LOG_TITLE, VET_201006_02_TB_LOG_ACTION_LIST[1])
    end
end

function get_item_count(t)
    local nCount = 0;
    for i = 1, getn(t) do
        if (t[i][2] == 0 and t[i][3] == 107 and t[i][4] >= 1 and t[i][4] <= 28) then
            nCount = nCount + 1;
        end
    end
    return nCount;
end

function BuyVET_70_GAOJIMIJI()
	local nDate = tonumber(date("%y%m%d"));
	if nDate < 120224 or nDate > 120311 then
		Talk(1, "", "Ho�t ��ng �� qu� h�n th�i gian r�i");
		return 
	end
	
	if  GetTranslifeCount() == 1 then
		VIET_MATTICH_TIMES = 2
	elseif GetTranslifeCount() > 1 then
		VIET_MATTICH_TIMES = 3
	end
	if nDate~= floor(GetTask(TSK_MATTICH_HIGHT)/10) then
		SetTask(TSK_MATTICH_HIGHT,nDate*10)
	end
	if mod(GetTask(TSK_MATTICH_HIGHT),10) >= VIET_MATTICH_TIMES then
		Talk(1,"","H�m nay ��i hi�p �� ��i �� l�n")
		return
	end
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		Talk(1,"","H�nh trang kh�ng �� � tr�ng ho�c �� n�ng")
		return
	end
	if GetItemCount(2,0,554) < 5 then
		Talk(1,"","H�nh trang ��i hi�p kh�ng c� 5 Tu ch�n y�u quy�t")
		return
	end
	if GetItemCount(2,1,30359) < 400 then
		Talk(1,"","H�nh trang ��i hi�p kh�ng c� 400 Socola t�nh nh�n")
		return
	end
	if DelItem(2,0,554,5)==1 and DelItem(2,1,30359,400)==1 then
		gf_EventGiveRandAward(VET_70_GAOJIMIJI,10000,1,"DOI MAT TICH 70","th�nh c�ng")
	end
	SetTask(TSK_MATTICH_HIGHT,GetTask(TSK_MATTICH_HIGHT)+1)
end

function BuyVET_70_GAOJIMIJI_New()
--	local nDate = tonumber(date("%y%m%d"));
--	if nDate < 120224 or nDate > 120311 then
--		Talk(1, "", "Ho�t ��ng �� qu� h�n th�i gian r�i");
--		return 
--	end
	
--	if  GetTranslifeCount() == 1 then
--		VIET_MATTICH_TIMES = 2
--	elseif GetTranslifeCount() > 1 then
--		VIET_MATTICH_TIMES = 3
--	end
--	if nDate~= floor(GetTask(TSK_MATTICH_HIGHT_NEW)/10) then
--		SetTask(TSK_MATTICH_HIGHT_NEW,nDate*10)
--	end
--	if mod(GetTask(TSK_MATTICH_HIGHT_NEW),10) >= VIET_MATTICH_TIMES then
--		Talk(1,"","H�m nay ��i hi�p �� ��i �� l�n")
--		return
--	end
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		Talk(1,"","H�nh trang kh�ng �� � tr�ng ho�c �� n�ng")
		return
	end
--	if GetItemCount(2,0,554) < 5 then
--		Talk(1,"","H�nh trang ��i hi�p kh�ng c� 5 Tu ch�n y�u quy�t")
--		return
--	end
	if GetItemCount(2,1,539) < 2 then
		Talk(1,"","H�nh trang ��i hi�p kh�ng c� 2 Ho�ng Kim ��i H�ng Bao")
		return
	end
	if DelItem(2,1,539,2)==1 then --DelItem(2,0,554,5)==1 and
		gf_EventGiveRandAward(VET_70_GAOJIMIJI,10000,1,"DOI MAT TICH 70","th�nh c�ng")
	end
	--SetTask(TSK_MATTICH_HIGHT_NEW,GetTask(TSK_MATTICH_HIGHT_NEW)+1)
end

function BuyVET_70_GAOJIMIJI_byFaction()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H�y ch�n m�t t�ch c�n mua."
	
	tinsert(tbSayDialog, "- Thi�n �nh Tuy�t S�t M�t Quy�n/#confirm_BuyVET_70_GAOJIMIJI_byFaction(21)")
	tinsert(tbSayDialog, "- V�n Ki�m H�a V� M�t Quy�n/#confirm_BuyVET_70_GAOJIMIJI_byFaction(22)")
	tinsert(tbSayDialog, "- D�ch C�n Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(1)")
	tinsert(tbSayDialog, "- Nh� Lai Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(2)")
	tinsert(tbSayDialog, "- T�y T�y Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(3)")
	tinsert(tbSayDialog, "- H�p Tinh M�t T�ch/#confirm_BuyVET_70_GAOJIMIJI_byFaction(4)")
	tinsert(tbSayDialog, "- V�n T��ng M�t T�ch/#confirm_BuyVET_70_GAOJIMIJI_byFaction(19)")
	tinsert(tbSayDialog, "- Thi�n �m Tr�n H�n Ph�/#confirm_BuyVET_70_GAOJIMIJI_byFaction(20)")	
	tinsert(tbSayDialog, "- Gi�ng Long Ch��ng/#confirm_BuyVET_70_GAOJIMIJI_byFaction(5)")
	tinsert(tbSayDialog, "- �� C�u Tr�n Ph�/#confirm_BuyVET_70_GAOJIMIJI_byFaction(6)")
	tinsert(tbSayDialog, "- Th�i C�c Ki�m Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(7)")
	tinsert(tbSayDialog, "- Th�i C�c T�m Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(8)")
	tinsert(tbSayDialog, "- To�n Long Th��ng Ph�/#confirm_BuyVET_70_GAOJIMIJI_byFaction(9)")
	tinsert(tbSayDialog, "- B� V��ng Ti�n Ph�/#confirm_BuyVET_70_GAOJIMIJI_byFaction(10)")
	tinsert(tbSayDialog, "- V� Thi�n B�o �i�n/#confirm_BuyVET_70_GAOJIMIJI_byFaction(11)")
	tinsert(tbSayDialog, "- V� �nh Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(12)")
	tinsert(tbSayDialog, "- Phong L�i Ch�u/#confirm_BuyVET_70_GAOJIMIJI_byFaction(13)")
	tinsert(tbSayDialog, "- C�n Kh�n ��i Na Di T�m Ph�p/#confirm_BuyVET_70_GAOJIMIJI_byFaction(14)")
	tinsert(tbSayDialog, "- Quang Minh Ng� H�nh L�nh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(15)")
	tinsert(tbSayDialog, "- H�n B�ng Ng�ng Huy�t Ch��ng/#confirm_BuyVET_70_GAOJIMIJI_byFaction(16)")
	tinsert(tbSayDialog, "- Ph�ng Minh Ph�/#confirm_BuyVET_70_GAOJIMIJI_byFaction(17)")
	tinsert(tbSayDialog, "- Hoa Ti�n T�m Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(18)")
	tinsert(tbSayDialog, "Tr� l�i/main")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end


--tbMattich = {{0, 107, 204}, {0, 107, 205}, {0, 107, 206}, {0, 107, 207}, {0, 107, 208}, {0, 107, 209}, {0, 107, 210}, {0, 107, 211}, {0, 107, 212}, {0, 107, 213}, {0, 107, 214}, {0, 107, 215}, {0, 107, 216}, {0, 107, 217}}
function confirm_BuyVET_70_GAOJIMIJI_byFaction(nGetType)
	local tbmattich_tranphai = {
										[1] = {0, 112,101},
										[2] = {0, 112,102},
										[3] = {0, 112,103},
										[4] = {0, 112,104},
										[5] = {0, 112,107},
										[6] = {0, 112,108},
										[7] = {0, 112,109},
										[8] = {0, 112,110},
										[9] = {0, 112,111},
										[10] = {0, 112,112},
										[11] = {0, 112,113},
										[12] = {0, 112,114},
										[13] = {0, 112,192},
										[14] = {0, 112,193},
										[15] = {0, 112,194},
										[16] = {0, 112,195},
										[17] = {0, 112,196},
										[18] = {0, 112,197},	
										[19] = {0, 112,105},	
										[20] = {0, 112,106},
										[21] = {0, 112,236},	
										[22] = {0, 112,237},										
									}
	if gf_Judge_Room_Weight(1, 100)==0 then 
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, xin h�y s�p x�p l�i.")
		return
	end
	if GetItemCount(2,1,199) < 3 then
		Talk(1, "", "��i hi�p kh�ng mang theo �� 3 ��i Ng�n Phi�u , vui l�ng ki�m tra l�i !!!")
		return 0
	end
	if DelItem(2,1,199,3) == 1 then		
		gf_AddItemEx2({tbmattich_tranphai[nGetType][1], tbmattich_tranphai[nGetType][2], tbmattich_tranphai[nGetType][3],1}, "m�t t�ch tr�n ph�i", "MUA MAT TICH TRAN PHAI 201608", "nh�n th�nh c�ng")	
	end
end


function MatTichSoCap_Mua_Page1()
	local tbMatTich = {
		{"Tr��ng Quy�n Ph�", 1, 10},
		{"T��ng H�nh Ph�", 2, 20},
		{"Trung B�nh Ph�", 3, 20},
		{"Khai S�n Ph�", 4, 20},
		{"Kh� Li�u Thu�t", 5, 50},
		{"To�i Di�p Ph�", 6, 50},
		{"T� Nguy�n C�ng Ph�", 7, 30},
		{"Huy�n Th�ch C�ng Ph�", 8, 30},
		{"Kim Thi�n Ph�", 9, 120},
		{"Tu La M�t t�ch", 10, 50},
	}

	local tbBuyOption = {"Xem ti�p/MatTichSoCap_Mua_Page2"}
	tinsert(tbBuyOption,2, "T�i s� quay l�i sau/do_nothing")
	
	for i=getn(tbMatTich),1,-1 do
		tinsert(tbBuyOption,1,tbMatTich[i][1].." ("..tbMatTich[i][3].." v�ng)/#MatTichSoCap_MuaBuoc2("..tbMatTich[i][2]..")")
	end
	
	Say("Ta c� m�t s� m�t t�ch, ng��i xem c� c�n quy�n n�o kh�ng?", getn(tbBuyOption), unpack(tbBuyOption))
end
	
function MatTichSoCap_Mua_Page2()
	local tbMatTich = {
		{"B� Kim M�t t�ch", 11, 100},
		{"B� Th�ch M�t t�ch", 12, 100},
		{"Ng� Qu� M�t t�ch", 13, 50},
		{"Thi�n H� M�t t�ch", 14, 120},
		{"T� H� M�t t�ch", 15, 120},
		{"Chi�m Y Ph�", 16, 150},
		{"T� Linh Chi�n � Ph�", 17, 150},
		{"T� Linh Thi�n � Ph�", 18, 150},
		{"T� Linh T� � Ph�", 19, 150}
	}

	local tbBuyOption = {"Quay l�i/MatTichSoCap_Mua_Page1"}
	tinsert(tbBuyOption,2, "T�i s� quay l�i sau/do_nothing")
	
	for i=getn(tbMatTich),1,-1 do
		tinsert(tbBuyOption,1,tbMatTich[i][1].." ("..tbMatTich[i][3].." v�ng)/#MatTichSoCap_MuaBuoc2("..tbMatTich[i][2]..")")
	end
	Say("Ta c� m�t s� m�t t�ch, ng��i xem c� c�n quy�n n�o kh�ng?", getn(tbBuyOption), unpack(tbBuyOption))
end

function MatTichSoCap_MuaBuoc2(nIdx)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	
	local tbMatTich = {
		[1] = {"Tr��ng Quy�n Ph�", 0, 107, 51, 10},
		[2] = {"T��ng H�nh Ph�", 0, 107, 52, 20},
		[3] = {"Trung B�nh Ph�", 0, 107, 53, 20},
		[4] = {"Khai S�n Ph�", 0, 107, 54, 20},
		[5] = {"Kh� Li�u Thu�t", 0, 107, 55, 50},
		[6] = {"To�i Di�p Ph�", 0, 107, 56, 50},
		[7] = {"T� Nguy�n C�ng Ph�", 0, 107, 57, 30},
		[8] = {"Huy�n Th�ch C�ng Ph�", 0, 107, 58, 30},
		[9] = {"Kim Thi�n Ph�", 0, 107, 59, 120},
		[10] = {"Tu La M�t t�ch", 0, 107, 60, 50},
		[11] = {"B� Kim M�t t�ch", 0, 107, 61, 100},
		[12] = {"B� Th�ch M�t t�ch", 0, 107, 62, 100},
		[13] = {"Ng� Qu� M�t t�ch", 0, 107, 63, 50},
		[14] = {"Thi�n H� M�t t�ch", 0, 107, 64, 120},
		[15] = {"T� H� M�t t�ch", 0, 107, 65, 120},
		[16] = {"Chi�m Y Ph�", 0, 107, 66, 150},
		[17] = {"T� Linh Chi�n � Ph�", 0, 107, 159, 150},
		[18] = {"T� Linh Thi�n � Ph�", 0, 107, 160, 150},
		[19] = {"T� Linh T� � Ph�", 0, 107, 161, 150}
	}
	
	if GetCash()<tbMatTich[nIdx][5]*10000 then
		Talk(1,"","H�nh nh� c�c h� mang kh�ng �� �� ti�n.");
		return
	end
	
	if gf_Judge_Room_Weight(1, 100)==0 then 
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, xin h�y s�p x�p l�i.")
		return
	end
	
	if Pay(tbMatTich[nIdx][5]*10000) == 1 then
		AddItem(tbMatTich[nIdx][2], tbMatTich[nIdx][3],  tbMatTich[nIdx][4], 1);
		gf_WriteLogEx("MUAMATTICH","mua", 1, tbMatTich[nIdx][1])
		Talk(1,"","Mua th�nh c�ng m�t quy�n ".. tbMatTich[nIdx][1].."!");
	end
end

function MatTichPhu_Fast()
	local nTimeMinus = 120 * 60 * 18 * 60
	local TASK_ID = 2505  --- ��i nh�n s�m
	local nLeftTime = GetTask(TASK_ID)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)
	local TASK_ID1 = 2506 --- Ti�u nh�n s�m
	local nLeftTime1 = GetTask(TASK_ID1)
	nLeftTime1 = floor(nLeftTime1 / 18 / 60)
	local nHour1 = floor(nLeftTime1 / 60)
	if nHour < 120 or nHour1 < 120 then
		Talk(1,"","��i nh�n s�m c�n "..nHour.." gi� v� Ti�u nh�n s�m c�n "..nHour1.." gi�, m�i lo�i ph�i �� 120 gi� m�i c� th� luy�n nhanh m�t t�ch ���c !!!.");
		Msg2Player("��i nh�n s�m c�n: "..nHour.." gi�, Ti�u nh�n s�m c�n: "..nHour1.." gi�")
		return 0
	end
	if GetPlayerEquipIndex(9) == 0 then
		Talk(1,"","��i hi�p h�y �eo m�t t�ch l�n ng��i m�i th� luy�n nhanh m�t t�ch ���c !!!.");
		return 0		
	end
	SetTask(2505, GetTask(2505) - nTimeMinus)
	SetTask(2506, GetTask(2506) - nTimeMinus)
	for i=1,100 do LevelUpBook(99) end
	Msg2Player("Ch�c m�ng ��i hi�p �� luy�n th�nh c�ng M�t t�ch ph�")
	Talk(1,"","Ch�c m�ng ��i hi�p �� luy�n th�nh c�ng M�t t�ch")	
	gf_WriteLogEx("MAT TICH PHU", "kick ho�t th�nh c�ng", 1, "Luy�n nhanh m�t t�ch ph�")	
	
end
function MatTichChinh_Fast()
	local tbSel = {}
	local szDialogTitle = "Ta c� th� gi�p t�i h� luy�n nhanh m�t t�ch !!!"
	tinsert(tbSel, "Ta mu�n r�t ng�n th�i gian tu luy�n 28 c�p (ti�u hao 10 Tu ch�n y�u quy�t, 10h ��i nh�n s�m, 10h Ti�u nh�n s�m/#confirm_mtc(1)")
	tinsert(tbSel, "Ta mu�n m�t b��c th�nh hi�n t�i (ti�u hao 10 Tu ch�n y�u quy�t, 60h ��i nh�n s�m, 60h Ti�u nh�n s�m/#confirm_mtc(2)")	
	tinsert(tbSel, "Ta s� quay l�i sau/do_nothing")		
	
    Say(szDialogTitle,getn(tbSel),tbSel)	
end
function confirm_mtc(nType)
	local tCheckNhanSam = {
											[1] = {10},
											[2] = {60},
											}
	local nTimeMinus = 60 * 18 * 60
	local confirm_time = tCheckNhanSam[nType][1] * nTimeMinus
	local TASK_ID = 2505  --- ��i nh�n s�m
	local nLeftTime = GetTask(TASK_ID)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)
	local TASK_ID1 = 2506 --- Ti�u nh�n s�m
	local nLeftTime1 = GetTask(TASK_ID1)
	nLeftTime1 = floor(nLeftTime1 / 18 / 60)
	local nHour1 = floor(nLeftTime1 / 60)
	if nHour < tCheckNhanSam[nType][1] or nHour1 < tCheckNhanSam[nType][1] then
		Talk(1,"","��i nh�n s�m c�n "..nHour.." gi� v� Ti�u nh�n s�m c�n "..nHour1.." gi�, m�i lo�i ph�i �� " ..tCheckNhanSam[nType][1].. " gi� m�i c� th� luy�n nhanh m�t t�ch ���c !!!.");
		Msg2Player("��i nh�n s�m c�n: "..nHour.." gi�, Ti�u nh�n s�m c�n: "..nHour1.." gi�")
		return 0
	end	
	if GetItemCount(2,0,554) < 10 then
		Talk(1,"","��i hi�p kh�ng mang theo �� Tu Ch�n Y�u Quy�t, n�n kh�ng th� luy�n nhanh m�t t�ch ���c !!!.");
		return 0	
	end	
	if GetPlayerEquipIndex(11) == 0 then
		Talk(1,"","��i hi�p h�y �eo m�t t�ch l�n ng��i m�i th� luy�n nhanh m�t t�ch ���c !!!.");
		return 0		
	end
	SetTask(2505, GetTask(2505) - confirm_time)
	SetTask(2506, GetTask(2506) - confirm_time)
	DelItem(2,0,554,10)
	if nType == 1 then
		for i=1,28 do LevelUpBook() end
		gf_WriteLogEx("MAT TICH CHINH", "kick ho�t th�nh c�ng", 1, "Luy�n nhanh m�t t�ch ch�nh 28")		
		Talk(1,"","Ch�c m�ng ��i hi�p �� luy�n th�nh c�ng M�t t�ch ch�nh th�m 28 c�p")		
	else
		for i=1,100 do LevelUpBook() end
		gf_WriteLogEx("MAT TICH CHINH", "kick ho�t th�nh c�ng", 1, "Luy�n nhanh m�t t�ch ch�nh full")		
		Talk(1,"","Ch�c m�ng ��i hi�p �� luy�n th�nh c�ng M�t t�ch ch�nh")		
	end
	Msg2Player("Ch�c m�ng ��i hi�p �� luy�n th�nh c�ng M�t t�ch")


end

function do_nothing()
end

function MatTichMonPhai45()
	local tbMatTich = {
		{"Kim Cang Ph�c Ma kinh", 1}, 
		{"V� Tr�n M�t t�ch", 2}, 
		{"Ti�m Long M�t t�ch", 3}, 
		{"Huy�n �nh M�t t�ch", 4}, 
		{"Qu�n T� M�t t�ch", 5}, 
		{"Nh� � M�t T�ch", 6}, 
		{"B�ch H�i Ph�", 7}, 
		{"H�n ��n M�t t�ch", 8}, 
		{"Qu� Thi�n M�t t�ch", 9}, 
		{"Thi�n La M�t T�ch", 10}, 
		{"Tr�n Qu�n M�t t�ch", 11}, 
		{"Xuy�n V�n M�t t�ch", 12}, 
		{"U Minh Qu� L�c", 13}, 
		{"Linh C� M�t t�ch", 14}, 
		{"Kinh Phong M�t t�ch", 15}, 
		{"T�y M�ng  M�t t�ch", 16}, 
		{"Ph�n Hoa M�t t�ch", 17}, 
		{"M� Tung M�t t�ch", 18}, 
		{"Thi�n Phong M�t t�ch", 19},
		{"H�i Phong M�t t�ch", 20},
		{"Ph� K� M�t t�ch", 21},
		{"Ng�ng Huy�t M�t t�ch", 22},
	}

	local tbBuyOption = {}
	for i=getn(tbMatTich),1,-1 do
		tinsert(tbBuyOption,1,tbMatTich[i][1].."/#MatTichMonPhai45_Buy("..tbMatTich[i][2]..")")
	end
	tinsert(tbBuyOption, "Ta s� quay l�i sau/do_nothing")
	
	Say("Ta c� m�t s� m�t t�ch 45, ch� c�n 1000 v�ng, ng��i c� mu�n mua kh�ng?", getn(tbBuyOption), tbBuyOption)
end
function MatTichMonPhai45_Buy(nType)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� mua m�t t�ch !!!")
		return 0
	end
	
	local tbMatTich = {
			[1] =  {"Kim Cang Ph�c Ma kinh", {0,107,1,1}}, 
			[2] =  {"V� Tr�n M�t t�ch", {0,107,5,1}}, 
			[3] =  {"Ti�m Long M�t t�ch", {0,107,3,1}}, 
			[4] =  {"Huy�n �nh M�t t�ch", {0,107,17,1}}, 
			[5] =  {"Qu�n T� M�t t�ch", {0,107,19,1}}, 
			[6] =  {"Nh� � M�t T�ch", {0,107,9,1}}, 
			[7] =  {"B�ch H�i Ph�", {0,107,11,1}}, 
			[8] =  {"H�n ��n M�t t�ch", {0,107,13,1}}, 
			[9] =  {"Qu� Thi�n M�t t�ch", {0,107,15,1}}, 
			[10] = {"Thi�n La M�t t�ch", {0,107,7,1}}, 
			[11] = {"Tr�n Qu�n M�t t�ch", {0,107,21,1}}, 
			[12] = {"Xuy�n V�n M�t t�ch", {0,107,23,1}}, 
			[13] = {"U Minh Qu� L�c", {0,107,25,1}}, 
			[14] = {"Linh C� M�t t�ch", {0,107,27,1}}, 
			[15] = {"Kinh Phong M�t t�ch", {0,107,180,1}}, 
			[16] = {"T�y M�ng  M�t t�ch", {0,107,188,1}}, 
			[17] = {"Ph�n Hoa M�t t�ch", {0,107,190,1}}, 
			[18] = {"M� Tung M�t t�ch", {0,107,228,1}}, 
			[19] = {"Thi�n Phong M�t t�ch", {0,107,232,1}},
			[20] = {"H�i Phong M�t t�ch", {0,107,182,1}},
			[21] = {"Ph� K� M�t t�ch", {0,107,184,1}},
			[22] = {"Ng�ng Huy�t M�t t�ch", {0,107,186,1}},
	}
	
	if GetCash()<1000*10000 then
		Talk(1,"","H�nh nh� c�c h� mang kh�ng �� 1000 v�ng.");
		return
	end
	
	if gf_Judge_Room_Weight(2, 100)==0 then 
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, xin h�y s�p x�p l�i.")
		return
	end
	
	if Pay(1000*10000) == 1 then
		AddItem(tbMatTich[nType][2][1], tbMatTich[nType][2][2],  tbMatTich[nType][2][3], 1);
		gf_WriteLogEx("MUAMATTICH45","mua", 1, tbMatTich[nType][1])		
		Talk(1,"","Mua th�nh c�ng m�t quy�n ".. tbMatTich[nType][1].."!");
	end

end
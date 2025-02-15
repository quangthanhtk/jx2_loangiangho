--=============================================
--create by zhangming 2010.5.12
--describe:越南版2010年6月活动2 收藏秘籍专家NPC脚本文件
--=============================================
Include("\\script\\online_activites\\2010_06\\activites_02\\head.lua");--活动头文件
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
--		tinsert(tbSel, 1, "Ta mu鑞 i 1 cu鑞 m藅 t辌h 70 cao c蕄 ng蓇 nhi猲 (5 Tu ch﹏ y誹 quy誸 + 400 S玞玪a)/BuyVET_70_GAOJIMIJI");
--		tinsert(tbSel, 1, "Ta mu鑞 i 1 cu鑞 m藅 t辌h 70 cao c蕄 ng蓇 nhi猲 (ti猽 hao 2 Ho祅g Kim Чi H錸g Bao(999 v祅g)/BuyVET_70_GAOJIMIJI_New");
		
		--tinsert(tbSel, "Ta mu鑞 i 1 cu鑞 m藅 t辌h Tr蕁 Ph竔 (ti猽 hao 3 Чi Ng﹏ Phi誹)/BuyVET_70_GAOJIMIJI_byFaction");		
		--tinsert(tbSel, "Luy謓 nhanh M藅 t辌h ch輓h/MatTichChinh_Fast");
		tinsert(tbSel, "Luy謓 nhanh M藅 t辌h ph�/MatTichPhu_Fast");
		--tinsert(tbSel, "Ta mu鑞 mua m閠 cu鑞 m藅 t辌h/MatTichSoCap_Mua_Page1");
		tinsert(tbSel, format("%s/#WLib:OpenEquipShop(%d)", "Ta mu鑞 mua m閠 cu鑞 m藅 t辌h", EQUIP_SHOP_BUY_COMMON_BOOK));
		tinsert(tbSel, "Ta mu鑞 mua m藅 t辌h m玭 ph竔 c蕄 45/MatTichMonPhai45");
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
    if GetItemSpecialAttr(idx,"LOCK") == 1 then --锁定判断
		Talk(1,"","V藅 ph萴 n祔 l� v藅 ph萴 kh鉧, m� kh鉧 r錳 i nh�!");
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
    if getn(t) ~= 5 then		-- 额外检测
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
    --添加新秘籍
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
		Talk(1, "", "Ho箃 ng  qu� h筺 th阨 gian r錳");
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
		Talk(1,"","H玬 nay i hi謕  i  l莕")
		return
	end
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		Talk(1,"","H祅h trang kh錸g  � tr鑞g ho芻  n苙g")
		return
	end
	if GetItemCount(2,0,554) < 5 then
		Talk(1,"","H祅h trang i hi謕 kh玭g c� 5 Tu ch﹏ y誹 quy誸")
		return
	end
	if GetItemCount(2,1,30359) < 400 then
		Talk(1,"","H祅h trang i hi謕 kh玭g c� 400 Socola t譶h nh﹏")
		return
	end
	if DelItem(2,0,554,5)==1 and DelItem(2,1,30359,400)==1 then
		gf_EventGiveRandAward(VET_70_GAOJIMIJI,10000,1,"DOI MAT TICH 70","th祅h c玭g")
	end
	SetTask(TSK_MATTICH_HIGHT,GetTask(TSK_MATTICH_HIGHT)+1)
end

function BuyVET_70_GAOJIMIJI_New()
--	local nDate = tonumber(date("%y%m%d"));
--	if nDate < 120224 or nDate > 120311 then
--		Talk(1, "", "Ho箃 ng  qu� h筺 th阨 gian r錳");
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
--		Talk(1,"","H玬 nay i hi謕  i  l莕")
--		return
--	end
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		Talk(1,"","H祅h trang kh錸g  � tr鑞g ho芻  n苙g")
		return
	end
--	if GetItemCount(2,0,554) < 5 then
--		Talk(1,"","H祅h trang i hi謕 kh玭g c� 5 Tu ch﹏ y誹 quy誸")
--		return
--	end
	if GetItemCount(2,1,539) < 2 then
		Talk(1,"","H祅h trang i hi謕 kh玭g c� 2 Ho祅g Kim Чi H錸g Bao")
		return
	end
	if DelItem(2,1,539,2)==1 then --DelItem(2,0,554,5)==1 and
		gf_EventGiveRandAward(VET_70_GAOJIMIJI,10000,1,"DOI MAT TICH 70","th祅h c玭g")
	end
	--SetTask(TSK_MATTICH_HIGHT_NEW,GetTask(TSK_MATTICH_HIGHT_NEW)+1)
end

function BuyVET_70_GAOJIMIJI_byFaction()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H穣 ch鋘 m藅 t辌h c莕 mua."
	
	tinsert(tbSayDialog, "- Thi猲 秐h Tuy謙 S竧 M藅 Quy觧/#confirm_BuyVET_70_GAOJIMIJI_byFaction(21)")
	tinsert(tbSayDialog, "- V筺 Ki誱 H鉧 V� M藅 Quy觧/#confirm_BuyVET_70_GAOJIMIJI_byFaction(22)")
	tinsert(tbSayDialog, "- D辌h C﹏ Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(1)")
	tinsert(tbSayDialog, "- Nh� Lai Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(2)")
	tinsert(tbSayDialog, "- T葃 T駓 Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(3)")
	tinsert(tbSayDialog, "- H蕄 Tinh M藅 T辌h/#confirm_BuyVET_70_GAOJIMIJI_byFaction(4)")
	tinsert(tbSayDialog, "- V筺 Tng M藅 T辌h/#confirm_BuyVET_70_GAOJIMIJI_byFaction(19)")
	tinsert(tbSayDialog, "- Thi猲  Tr蕁 H錸 Ph�/#confirm_BuyVET_70_GAOJIMIJI_byFaction(20)")	
	tinsert(tbSayDialog, "- Gi竛g Long Chng/#confirm_BuyVET_70_GAOJIMIJI_byFaction(5)")
	tinsert(tbSayDialog, "- Ф C萿 Tr薾 Ph�/#confirm_BuyVET_70_GAOJIMIJI_byFaction(6)")
	tinsert(tbSayDialog, "- Th竔 C鵦 Ki誱 Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(7)")
	tinsert(tbSayDialog, "- Th竔 C鵦 T﹎ Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(8)")
	tinsert(tbSayDialog, "- To祅 Long Thng Ph�/#confirm_BuyVET_70_GAOJIMIJI_byFaction(9)")
	tinsert(tbSayDialog, "- B� Vng Ti詎 Ph�/#confirm_BuyVET_70_GAOJIMIJI_byFaction(10)")
	tinsert(tbSayDialog, "- V� Thi猲 B秓 觧/#confirm_BuyVET_70_GAOJIMIJI_byFaction(11)")
	tinsert(tbSayDialog, "- V� 秐h Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(12)")
	tinsert(tbSayDialog, "- Phong L玦 Ch﹗/#confirm_BuyVET_70_GAOJIMIJI_byFaction(13)")
	tinsert(tbSayDialog, "- C祅 Kh玭 Чi Na Di T﹎ Ph竝/#confirm_BuyVET_70_GAOJIMIJI_byFaction(14)")
	tinsert(tbSayDialog, "- Quang Minh Ng� H祅h L謓h/#confirm_BuyVET_70_GAOJIMIJI_byFaction(15)")
	tinsert(tbSayDialog, "- H祅 B╪g Ng璶g Huy誸 Chng/#confirm_BuyVET_70_GAOJIMIJI_byFaction(16)")
	tinsert(tbSayDialog, "- Ph鬾g Minh Ph�/#confirm_BuyVET_70_GAOJIMIJI_byFaction(17)")
	tinsert(tbSayDialog, "- Hoa Ti猲 T﹎ Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(18)")
	tinsert(tbSayDialog, "Tr� l筰/main")
	
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
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , xin h穣 s緋 x誴 l筰.")
		return
	end
	if GetItemCount(2,1,199) < 3 then
		Talk(1, "", "Чi hi謕 kh玭g mang theo  3 Чi Ng﹏ Phi誹 , vui l遪g ki觤 tra l筰 !!!")
		return 0
	end
	if DelItem(2,1,199,3) == 1 then		
		gf_AddItemEx2({tbmattich_tranphai[nGetType][1], tbmattich_tranphai[nGetType][2], tbmattich_tranphai[nGetType][3],1}, "m藅 t辌h tr蕁 ph竔", "MUA MAT TICH TRAN PHAI 201608", "nh薾 th祅h c玭g")	
	end
end


function MatTichSoCap_Mua_Page1()
	local tbMatTich = {
		{"Trng Quy襫 Ph�", 1, 10},
		{"Tng H譶h Ph�", 2, 20},
		{"Trung B譶h Ph�", 3, 20},
		{"Khai S琻 Ph�", 4, 20},
		{"Kh� Li謚 Thu藅", 5, 50},
		{"To竔 Di謕 Ph�", 6, 50},
		{"T� Nguy謓 C玭g Ph�", 7, 30},
		{"Huy襫 Th筩h C玭g Ph�", 8, 30},
		{"Kim Thi襫 Ph�", 9, 120},
		{"Tu La M藅 t辌h", 10, 50},
	}

	local tbBuyOption = {"Xem ti誴/MatTichSoCap_Mua_Page2"}
	tinsert(tbBuyOption,2, "T筰 s� quay l筰 sau/do_nothing")
	
	for i=getn(tbMatTich),1,-1 do
		tinsert(tbBuyOption,1,tbMatTich[i][1].." ("..tbMatTich[i][3].." v祅g)/#MatTichSoCap_MuaBuoc2("..tbMatTich[i][2]..")")
	end
	
	Say("Ta c� m閠 s� m藅 t辌h, ngi xem c� c莕 quy觧 n祇 kh玭g?", getn(tbBuyOption), unpack(tbBuyOption))
end
	
function MatTichSoCap_Mua_Page2()
	local tbMatTich = {
		{"B� Kim M藅 t辌h", 11, 100},
		{"B� Th筩h M藅 t辌h", 12, 100},
		{"Ng� Qu� M藅 t辌h", 13, 50},
		{"Thi猲 H� M藅 t辌h", 14, 120},
		{"T� H� M藅 t辌h", 15, 120},
		{"Chi猰 Y Ph�", 16, 150},
		{"T� Linh Chi課 � Ph�", 17, 150},
		{"T� Linh Thi猲 � Ph�", 18, 150},
		{"T� Linh T� � Ph�", 19, 150}
	}

	local tbBuyOption = {"Quay l筰/MatTichSoCap_Mua_Page1"}
	tinsert(tbBuyOption,2, "T筰 s� quay l筰 sau/do_nothing")
	
	for i=getn(tbMatTich),1,-1 do
		tinsert(tbBuyOption,1,tbMatTich[i][1].." ("..tbMatTich[i][3].." v祅g)/#MatTichSoCap_MuaBuoc2("..tbMatTich[i][2]..")")
	end
	Say("Ta c� m閠 s� m藅 t辌h, ngi xem c� c莕 quy觧 n祇 kh玭g?", getn(tbBuyOption), unpack(tbBuyOption))
end

function MatTichSoCap_MuaBuoc2(nIdx)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi謓 t筰 kh玭g th� nh薾 thng!!!")
		return
	end
	
	local tbMatTich = {
		[1] = {"Trng Quy襫 Ph�", 0, 107, 51, 10},
		[2] = {"Tng H譶h Ph�", 0, 107, 52, 20},
		[3] = {"Trung B譶h Ph�", 0, 107, 53, 20},
		[4] = {"Khai S琻 Ph�", 0, 107, 54, 20},
		[5] = {"Kh� Li謚 Thu藅", 0, 107, 55, 50},
		[6] = {"To竔 Di謕 Ph�", 0, 107, 56, 50},
		[7] = {"T� Nguy謓 C玭g Ph�", 0, 107, 57, 30},
		[8] = {"Huy襫 Th筩h C玭g Ph�", 0, 107, 58, 30},
		[9] = {"Kim Thi襫 Ph�", 0, 107, 59, 120},
		[10] = {"Tu La M藅 t辌h", 0, 107, 60, 50},
		[11] = {"B� Kim M藅 t辌h", 0, 107, 61, 100},
		[12] = {"B� Th筩h M藅 t辌h", 0, 107, 62, 100},
		[13] = {"Ng� Qu� M藅 t辌h", 0, 107, 63, 50},
		[14] = {"Thi猲 H� M藅 t辌h", 0, 107, 64, 120},
		[15] = {"T� H� M藅 t辌h", 0, 107, 65, 120},
		[16] = {"Chi猰 Y Ph�", 0, 107, 66, 150},
		[17] = {"T� Linh Chi課 � Ph�", 0, 107, 159, 150},
		[18] = {"T� Linh Thi猲 � Ph�", 0, 107, 160, 150},
		[19] = {"T� Linh T� � Ph�", 0, 107, 161, 150}
	}
	
	if GetCash()<tbMatTich[nIdx][5]*10000 then
		Talk(1,"","H譶h nh� c竎 h� mang kh玭g   ti襫.");
		return
	end
	
	if gf_Judge_Room_Weight(1, 100)==0 then 
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , xin h穣 s緋 x誴 l筰.")
		return
	end
	
	if Pay(tbMatTich[nIdx][5]*10000) == 1 then
		AddItem(tbMatTich[nIdx][2], tbMatTich[nIdx][3],  tbMatTich[nIdx][4], 1);
		gf_WriteLogEx("MUAMATTICH","mua", 1, tbMatTich[nIdx][1])
		Talk(1,"","Mua th祅h c玭g m閠 quy觧 ".. tbMatTich[nIdx][1].."!");
	end
end

function MatTichPhu_Fast()
	local nTimeMinus = 120 * 60 * 18 * 60
	local TASK_ID = 2505  --- i nh﹏ s﹎
	local nLeftTime = GetTask(TASK_ID)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)
	local TASK_ID1 = 2506 --- Ti觰 nh﹏ s﹎
	local nLeftTime1 = GetTask(TASK_ID1)
	nLeftTime1 = floor(nLeftTime1 / 18 / 60)
	local nHour1 = floor(nLeftTime1 / 60)
	if nHour < 120 or nHour1 < 120 then
		Talk(1,"","Чi nh﹏ s﹎ c遪 "..nHour.." gi� v� Ti觰 nh﹏ s﹎ c遪 "..nHour1.." gi�, m鏸 lo筰 ph秈  120 gi� m韎 c� th� luy謓 nhanh m藅 t辌h 頲 !!!.");
		Msg2Player("Чi nh﹏ s﹎ c遪: "..nHour.." gi�, Ti觰 nh﹏ s﹎ c遪: "..nHour1.." gi�")
		return 0
	end
	if GetPlayerEquipIndex(9) == 0 then
		Talk(1,"","Чi hi謕 h穣 甧o m藅 t辌h l猲 ngi m韎 th� luy謓 nhanh m藅 t辌h 頲 !!!.");
		return 0		
	end
	SetTask(2505, GetTask(2505) - nTimeMinus)
	SetTask(2506, GetTask(2506) - nTimeMinus)
	for i=1,100 do LevelUpBook(99) end
	Msg2Player("Ch骳 m鮪g i hi謕  luy謓 th祅h c玭g M藅 t辌h ph�")
	Talk(1,"","Ch骳 m鮪g i hi謕  luy謓 th祅h c玭g M藅 t辌h")	
	gf_WriteLogEx("MAT TICH PHU", "kick ho箃 th祅h c玭g", 1, "Luy謓 nhanh m藅 t辌h ph�")	
	
end
function MatTichChinh_Fast()
	local tbSel = {}
	local szDialogTitle = "Ta c� th� gi髉 t筰 h� luy謓 nhanh m藅 t辌h !!!"
	tinsert(tbSel, "Ta mu鑞 r髏 ng緉 th阨 gian tu luy謓 28 c蕄 (ti猽 hao 10 Tu ch﹏ y誹 quy誸, 10h Чi nh﹏ s﹎, 10h Ti觰 nh﹏ s﹎/#confirm_mtc(1)")
	tinsert(tbSel, "Ta mu鑞 m閠 bc th祅h hi襫 t礽 (ti猽 hao 10 Tu ch﹏ y誹 quy誸, 60h Чi nh﹏ s﹎, 60h Ti觰 nh﹏ s﹎/#confirm_mtc(2)")	
	tinsert(tbSel, "Ta s� quay l筰 sau/do_nothing")		
	
    Say(szDialogTitle,getn(tbSel),tbSel)	
end
function confirm_mtc(nType)
	local tCheckNhanSam = {
											[1] = {10},
											[2] = {60},
											}
	local nTimeMinus = 60 * 18 * 60
	local confirm_time = tCheckNhanSam[nType][1] * nTimeMinus
	local TASK_ID = 2505  --- i nh﹏ s﹎
	local nLeftTime = GetTask(TASK_ID)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)
	local TASK_ID1 = 2506 --- Ti觰 nh﹏ s﹎
	local nLeftTime1 = GetTask(TASK_ID1)
	nLeftTime1 = floor(nLeftTime1 / 18 / 60)
	local nHour1 = floor(nLeftTime1 / 60)
	if nHour < tCheckNhanSam[nType][1] or nHour1 < tCheckNhanSam[nType][1] then
		Talk(1,"","Чi nh﹏ s﹎ c遪 "..nHour.." gi� v� Ti觰 nh﹏ s﹎ c遪 "..nHour1.." gi�, m鏸 lo筰 ph秈  " ..tCheckNhanSam[nType][1].. " gi� m韎 c� th� luy謓 nhanh m藅 t辌h 頲 !!!.");
		Msg2Player("Чi nh﹏ s﹎ c遪: "..nHour.." gi�, Ti觰 nh﹏ s﹎ c遪: "..nHour1.." gi�")
		return 0
	end	
	if GetItemCount(2,0,554) < 10 then
		Talk(1,"","Чi hi謕 kh玭g mang theo  Tu Ch﹏ Y誹 Quy誸, n猲 kh玭g th� luy謓 nhanh m藅 t辌h 頲 !!!.");
		return 0	
	end	
	if GetPlayerEquipIndex(11) == 0 then
		Talk(1,"","Чi hi謕 h穣 甧o m藅 t辌h l猲 ngi m韎 th� luy謓 nhanh m藅 t辌h 頲 !!!.");
		return 0		
	end
	SetTask(2505, GetTask(2505) - confirm_time)
	SetTask(2506, GetTask(2506) - confirm_time)
	DelItem(2,0,554,10)
	if nType == 1 then
		for i=1,28 do LevelUpBook() end
		gf_WriteLogEx("MAT TICH CHINH", "kick ho箃 th祅h c玭g", 1, "Luy謓 nhanh m藅 t辌h ch輓h 28")		
		Talk(1,"","Ch骳 m鮪g i hi謕  luy謓 th祅h c玭g M藅 t辌h ch輓h th猰 28 c蕄")		
	else
		for i=1,100 do LevelUpBook() end
		gf_WriteLogEx("MAT TICH CHINH", "kick ho箃 th祅h c玭g", 1, "Luy謓 nhanh m藅 t辌h ch輓h full")		
		Talk(1,"","Ch骳 m鮪g i hi謕  luy謓 th祅h c玭g M藅 t辌h ch輓h")		
	end
	Msg2Player("Ch骳 m鮪g i hi謕  luy謓 th祅h c玭g M藅 t辌h")


end

function do_nothing()
end

function MatTichMonPhai45()
	local tbMatTich = {
		{"Kim Cang Ph鬰 Ma kinh", 1}, 
		{"V� Tr莕 M藅 t辌h", 2}, 
		{"Ti襪 Long M藅 t辌h", 3}, 
		{"Huy襫 秐h M藅 t辌h", 4}, 
		{"Qu﹏ T� M藅 t辌h", 5}, 
		{"Nh� � M藅 T辌h", 6}, 
		{"B輈h H秈 Ph�", 7}, 
		{"H鏽 чn M藅 t辌h", 8}, 
		{"Qu� Thi猲 M藅 t辌h", 9}, 
		{"Thi猲 La M藅 T辌h", 10}, 
		{"Tr蕁 Qu﹏ M藅 t辌h", 11}, 
		{"Xuy猲 V﹏ M藅 t辌h", 12}, 
		{"U Minh Qu� L鬰", 13}, 
		{"Linh C� M藅 t辌h", 14}, 
		{"Kinh Phong M藅 t辌h", 15}, 
		{"T髖 M閚g  M藅 t辌h", 16}, 
		{"Ph錸 Hoa M藅 t辌h", 17}, 
		{"M� Tung M藅 t辌h", 18}, 
		{"Thi猲 Phong M藅 t辌h", 19},
		{"H錳 Phong M藅 t辌h", 20},
		{"Ph� K� M藅 t辌h", 21},
		{"Ng璶g Huy誸 M藅 t辌h", 22},
	}

	local tbBuyOption = {}
	for i=getn(tbMatTich),1,-1 do
		tinsert(tbBuyOption,1,tbMatTich[i][1].."/#MatTichMonPhai45_Buy("..tbMatTich[i][2]..")")
	end
	tinsert(tbBuyOption, "Ta s� quay l筰 sau/do_nothing")
	
	Say("Ta c� m閠 s� m藅 t辌h 45, ch� c莕 1000 v祅g, ngi c� mu鑞 mua kh玭g?", getn(tbBuyOption), tbBuyOption)
end
function MatTichMonPhai45_Buy(nType)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi謓 t筰 kh玭g th� mua m藅 t辌h !!!")
		return 0
	end
	
	local tbMatTich = {
			[1] =  {"Kim Cang Ph鬰 Ma kinh", {0,107,1,1}}, 
			[2] =  {"V� Tr莕 M藅 t辌h", {0,107,5,1}}, 
			[3] =  {"Ti襪 Long M藅 t辌h", {0,107,3,1}}, 
			[4] =  {"Huy襫 秐h M藅 t辌h", {0,107,17,1}}, 
			[5] =  {"Qu﹏ T� M藅 t辌h", {0,107,19,1}}, 
			[6] =  {"Nh� � M藅 T辌h", {0,107,9,1}}, 
			[7] =  {"B輈h H秈 Ph�", {0,107,11,1}}, 
			[8] =  {"H鏽 чn M藅 t辌h", {0,107,13,1}}, 
			[9] =  {"Qu� Thi猲 M藅 t辌h", {0,107,15,1}}, 
			[10] = {"Thi猲 La M藅 t辌h", {0,107,7,1}}, 
			[11] = {"Tr蕁 Qu﹏ M藅 t辌h", {0,107,21,1}}, 
			[12] = {"Xuy猲 V﹏ M藅 t辌h", {0,107,23,1}}, 
			[13] = {"U Minh Qu� L鬰", {0,107,25,1}}, 
			[14] = {"Linh C� M藅 t辌h", {0,107,27,1}}, 
			[15] = {"Kinh Phong M藅 t辌h", {0,107,180,1}}, 
			[16] = {"T髖 M閚g  M藅 t辌h", {0,107,188,1}}, 
			[17] = {"Ph錸 Hoa M藅 t辌h", {0,107,190,1}}, 
			[18] = {"M� Tung M藅 t辌h", {0,107,228,1}}, 
			[19] = {"Thi猲 Phong M藅 t辌h", {0,107,232,1}},
			[20] = {"H錳 Phong M藅 t辌h", {0,107,182,1}},
			[21] = {"Ph� K� M藅 t辌h", {0,107,184,1}},
			[22] = {"Ng璶g Huy誸 M藅 t辌h", {0,107,186,1}},
	}
	
	if GetCash()<1000*10000 then
		Talk(1,"","H譶h nh� c竎 h� mang kh玭g  1000 v祅g.");
		return
	end
	
	if gf_Judge_Room_Weight(2, 100)==0 then 
		Talk(1,"","H祅h trang ho芻 s鴆 l鵦 kh玭g , xin h穣 s緋 x誴 l筰.")
		return
	end
	
	if Pay(1000*10000) == 1 then
		AddItem(tbMatTich[nType][2][1], tbMatTich[nType][2][2],  tbMatTich[nType][2][3], 1);
		gf_WriteLogEx("MUAMATTICH45","mua", 1, tbMatTich[nType][1])		
		Talk(1,"","Mua th祅h c玭g m閠 quy觧 ".. tbMatTich[nType][1].."!");
	end

end
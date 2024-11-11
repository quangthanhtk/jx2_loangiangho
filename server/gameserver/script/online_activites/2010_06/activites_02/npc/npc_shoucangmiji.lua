--=============================================
--create by zhangming 2010.5.12
--describe:Ô½ÄÏ°æ2010Äê6ÔÂ»î¶¯2 ÊÕ²ØÃØ¼®×¨¼ÒNPC½Å±¾ÎÄ¼þ
--=============================================
Include("\\script\\online_activites\\2010_06\\activites_02\\head.lua");--»î¶¯Í·ÎÄ¼þ
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
--		tinsert(tbSel, 1, "Ta muèn ®æi 1 cuèn mËt tÞch 70 cao cÊp ngÉu nhiªn (5 Tu ch©n yÕu quyÕt + 400 S«c«la)/BuyVET_70_GAOJIMIJI");
--		tinsert(tbSel, 1, "Ta muèn ®æi 1 cuèn mËt tÞch 70 cao cÊp ngÉu nhiªn (tiªu hao 2 Hoµng Kim §¹i Hång Bao(999 vµng)/BuyVET_70_GAOJIMIJI_New");
		
		--tinsert(tbSel, "Ta muèn ®æi 1 cuèn mËt tÞch TrÊn Ph¸i (tiªu hao 3 §¹i Ng©n PhiÕu)/BuyVET_70_GAOJIMIJI_byFaction");		
		--tinsert(tbSel, "LuyÖn nhanh MËt tÞch chÝnh/MatTichChinh_Fast");
		tinsert(tbSel, "LuyÖn nhanh MËt tÞch phô/MatTichPhu_Fast");
		--tinsert(tbSel, "Ta muèn mua mét cuèn mËt tÞch/MatTichSoCap_Mua_Page1");
		tinsert(tbSel, format("%s/#WLib:OpenEquipShop(%d)", "Ta muèn mua mét cuèn mËt tÞch", EQUIP_SHOP_BUY_COMMON_BOOK));
		tinsert(tbSel, "Ta muèn mua mËt tÞch m«n ph¸i cÊp 45/MatTichMonPhai45");
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
    if GetItemSpecialAttr(idx,"LOCK") == 1 then --Ëø¶¨ÅÐ¶Ï
		Talk(1,"","VËt phÈm nµy lµ vËt phÈm khãa, më khãa råi ®æi nhÐ!");
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
    if getn(t) ~= 5 then		-- ¶îÍâ¼ì²â
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
    --Ìí¼ÓÐÂÃØ¼®
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
		Talk(1, "", "Ho¹t ®éng ®· qu¸ h¹n thêi gian råi");
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
		Talk(1,"","H«m nay ®¹i hiÖp ®· ®æi ®ñ lÇn")
		return
	end
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		Talk(1,"","Hµnh trang khång ®ñ « trèng hoÆc ®é nÆng")
		return
	end
	if GetItemCount(2,0,554) < 5 then
		Talk(1,"","Hµnh trang ®¹i hiÖp kh«ng cã 5 Tu ch©n yÕu quyÕt")
		return
	end
	if GetItemCount(2,1,30359) < 400 then
		Talk(1,"","Hµnh trang ®¹i hiÖp kh«ng cã 400 Socola t×nh nh©n")
		return
	end
	if DelItem(2,0,554,5)==1 and DelItem(2,1,30359,400)==1 then
		gf_EventGiveRandAward(VET_70_GAOJIMIJI,10000,1,"DOI MAT TICH 70","thµnh c«ng")
	end
	SetTask(TSK_MATTICH_HIGHT,GetTask(TSK_MATTICH_HIGHT)+1)
end

function BuyVET_70_GAOJIMIJI_New()
--	local nDate = tonumber(date("%y%m%d"));
--	if nDate < 120224 or nDate > 120311 then
--		Talk(1, "", "Ho¹t ®éng ®· qu¸ h¹n thêi gian råi");
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
--		Talk(1,"","H«m nay ®¹i hiÖp ®· ®æi ®ñ lÇn")
--		return
--	end
	if gf_Judge_Room_Weight(1, 10, " ") == 0 then
		Talk(1,"","Hµnh trang khång ®ñ « trèng hoÆc ®é nÆng")
		return
	end
--	if GetItemCount(2,0,554) < 5 then
--		Talk(1,"","Hµnh trang ®¹i hiÖp kh«ng cã 5 Tu ch©n yÕu quyÕt")
--		return
--	end
	if GetItemCount(2,1,539) < 2 then
		Talk(1,"","Hµnh trang ®¹i hiÖp kh«ng cã 2 Hoµng Kim §¹i Hång Bao")
		return
	end
	if DelItem(2,1,539,2)==1 then --DelItem(2,0,554,5)==1 and
		gf_EventGiveRandAward(VET_70_GAOJIMIJI,10000,1,"DOI MAT TICH 70","thµnh c«ng")
	end
	--SetTask(TSK_MATTICH_HIGHT_NEW,GetTask(TSK_MATTICH_HIGHT_NEW)+1)
end

function BuyVET_70_GAOJIMIJI_byFaction()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "H·y chän mËt tÞch cÇn mua."
	
	tinsert(tbSayDialog, "- Thiªn ¶nh TuyÖt S¸t MËt QuyÓn/#confirm_BuyVET_70_GAOJIMIJI_byFaction(21)")
	tinsert(tbSayDialog, "- V¹n KiÕm Hãa Vò MËt QuyÓn/#confirm_BuyVET_70_GAOJIMIJI_byFaction(22)")
	tinsert(tbSayDialog, "- DÞch C©n Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(1)")
	tinsert(tbSayDialog, "- Nh­ Lai Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(2)")
	tinsert(tbSayDialog, "- TÈy Tñy Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(3)")
	tinsert(tbSayDialog, "- HÊp Tinh MËt TÞch/#confirm_BuyVET_70_GAOJIMIJI_byFaction(4)")
	tinsert(tbSayDialog, "- V¹n T­íng MËt TÞch/#confirm_BuyVET_70_GAOJIMIJI_byFaction(19)")
	tinsert(tbSayDialog, "- Thiªn ¢m TrÊn Hån Phæ/#confirm_BuyVET_70_GAOJIMIJI_byFaction(20)")	
	tinsert(tbSayDialog, "- Gi¸ng Long Ch­ëng/#confirm_BuyVET_70_GAOJIMIJI_byFaction(5)")
	tinsert(tbSayDialog, "- §¶ CÈu TrËn Phæ/#confirm_BuyVET_70_GAOJIMIJI_byFaction(6)")
	tinsert(tbSayDialog, "- Th¸i Cùc KiÕm Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(7)")
	tinsert(tbSayDialog, "- Th¸i Cùc T©m Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(8)")
	tinsert(tbSayDialog, "- Toµn Long Th­¬ng Phæ/#confirm_BuyVET_70_GAOJIMIJI_byFaction(9)")
	tinsert(tbSayDialog, "- B¸ V­¬ng TiÔn Phæ/#confirm_BuyVET_70_GAOJIMIJI_byFaction(10)")
	tinsert(tbSayDialog, "- V« Thiªn B¶o §iÓn/#confirm_BuyVET_70_GAOJIMIJI_byFaction(11)")
	tinsert(tbSayDialog, "- V« ¶nh Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(12)")
	tinsert(tbSayDialog, "- Phong L«i Ch©u/#confirm_BuyVET_70_GAOJIMIJI_byFaction(13)")
	tinsert(tbSayDialog, "- Cµn Kh«n §¹i Na Di T©m Ph¸p/#confirm_BuyVET_70_GAOJIMIJI_byFaction(14)")
	tinsert(tbSayDialog, "- Quang Minh Ngò Hµnh LÖnh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(15)")
	tinsert(tbSayDialog, "- Hµn B¨ng Ng­ng HuyÕt Ch­ëng/#confirm_BuyVET_70_GAOJIMIJI_byFaction(16)")
	tinsert(tbSayDialog, "- Phông Minh Phæ/#confirm_BuyVET_70_GAOJIMIJI_byFaction(17)")
	tinsert(tbSayDialog, "- Hoa Tiªn T©m Kinh/#confirm_BuyVET_70_GAOJIMIJI_byFaction(18)")
	tinsert(tbSayDialog, "Trë l¹i/main")
	
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
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, xin h·y s¾p xÕp l¹i.")
		return
	end
	if GetItemCount(2,1,199) < 3 then
		Talk(1, "", "§¹i hiÖp kh«ng mang theo ®ñ 3 §¹i Ng©n PhiÕu , vui lßng kiÓm tra l¹i !!!")
		return 0
	end
	if DelItem(2,1,199,3) == 1 then		
		gf_AddItemEx2({tbmattich_tranphai[nGetType][1], tbmattich_tranphai[nGetType][2], tbmattich_tranphai[nGetType][3],1}, "mËt tÞch trÊn ph¸i", "MUA MAT TICH TRAN PHAI 201608", "nhËn thµnh c«ng")	
	end
end


function MatTichSoCap_Mua_Page1()
	local tbMatTich = {
		{"Tr­êng QuyÒn Phæ", 1, 10},
		{"T­îng H×nh Phæ", 2, 20},
		{"Trung B×nh Phæ", 3, 20},
		{"Khai S¬n Phæ", 4, 20},
		{"KhÝ LiÖu ThuËt", 5, 50},
		{"To¸i DiÖp Phæ", 6, 50},
		{"Tô NguyÖn C«ng Phæ", 7, 30},
		{"HuyÒn Th¹ch C«ng Phæ", 8, 30},
		{"Kim ThiÒn Phæ", 9, 120},
		{"Tu La MËt tÞch", 10, 50},
	}

	local tbBuyOption = {"Xem tiÕp/MatTichSoCap_Mua_Page2"}
	tinsert(tbBuyOption,2, "T¹i sÏ quay l¹i sau/do_nothing")
	
	for i=getn(tbMatTich),1,-1 do
		tinsert(tbBuyOption,1,tbMatTich[i][1].." ("..tbMatTich[i][3].." vµng)/#MatTichSoCap_MuaBuoc2("..tbMatTich[i][2]..")")
	end
	
	Say("Ta cã mét sè mËt tÞch, ng­¬i xem cã cÇn quyÓn nµo kh«ng?", getn(tbBuyOption), unpack(tbBuyOption))
end
	
function MatTichSoCap_Mua_Page2()
	local tbMatTich = {
		{"Bæ Kim MËt tÞch", 11, 100},
		{"Bæ Th¹ch MËt tÞch", 12, 100},
		{"Ngò Quû MËt tÞch", 13, 50},
		{"Thiªn Hµ MËt tÞch", 14, 120},
		{"Tö Hµ MËt tÞch", 15, 120},
		{"Chiªm Y Phæ", 16, 150},
		{"Tø Linh ChiÕn ý Phæ", 17, 150},
		{"Tø Linh Thiªn ý Phæ", 18, 150},
		{"Tø Linh Tö ý Phæ", 19, 150}
	}

	local tbBuyOption = {"Quay l¹i/MatTichSoCap_Mua_Page1"}
	tinsert(tbBuyOption,2, "T¹i sÏ quay l¹i sau/do_nothing")
	
	for i=getn(tbMatTich),1,-1 do
		tinsert(tbBuyOption,1,tbMatTich[i][1].." ("..tbMatTich[i][3].." vµng)/#MatTichSoCap_MuaBuoc2("..tbMatTich[i][2]..")")
	end
	Say("Ta cã mét sè mËt tÞch, ng­¬i xem cã cÇn quyÓn nµo kh«ng?", getn(tbBuyOption), unpack(tbBuyOption))
end

function MatTichSoCap_MuaBuoc2(nIdx)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
		return
	end
	
	local tbMatTich = {
		[1] = {"Tr­êng QuyÒn Phæ", 0, 107, 51, 10},
		[2] = {"T­îng H×nh Phæ", 0, 107, 52, 20},
		[3] = {"Trung B×nh Phæ", 0, 107, 53, 20},
		[4] = {"Khai S¬n Phæ", 0, 107, 54, 20},
		[5] = {"KhÝ LiÖu ThuËt", 0, 107, 55, 50},
		[6] = {"To¸i DiÖp Phæ", 0, 107, 56, 50},
		[7] = {"Tô NguyÖn C«ng Phæ", 0, 107, 57, 30},
		[8] = {"HuyÒn Th¹ch C«ng Phæ", 0, 107, 58, 30},
		[9] = {"Kim ThiÒn Phæ", 0, 107, 59, 120},
		[10] = {"Tu La MËt tÞch", 0, 107, 60, 50},
		[11] = {"Bæ Kim MËt tÞch", 0, 107, 61, 100},
		[12] = {"Bæ Th¹ch MËt tÞch", 0, 107, 62, 100},
		[13] = {"Ngò Quû MËt tÞch", 0, 107, 63, 50},
		[14] = {"Thiªn Hµ MËt tÞch", 0, 107, 64, 120},
		[15] = {"Tö Hµ MËt tÞch", 0, 107, 65, 120},
		[16] = {"Chiªm Y Phæ", 0, 107, 66, 150},
		[17] = {"Tø Linh ChiÕn ý Phæ", 0, 107, 159, 150},
		[18] = {"Tø Linh Thiªn ý Phæ", 0, 107, 160, 150},
		[19] = {"Tø Linh Tö ý Phæ", 0, 107, 161, 150}
	}
	
	if GetCash()<tbMatTich[nIdx][5]*10000 then
		Talk(1,"","H×nh nh­ c¸c h¹ mang kh«ng ®ñ ®ñ tiÒn.");
		return
	end
	
	if gf_Judge_Room_Weight(1, 100)==0 then 
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, xin h·y s¾p xÕp l¹i.")
		return
	end
	
	if Pay(tbMatTich[nIdx][5]*10000) == 1 then
		AddItem(tbMatTich[nIdx][2], tbMatTich[nIdx][3],  tbMatTich[nIdx][4], 1);
		gf_WriteLogEx("MUAMATTICH","mua", 1, tbMatTich[nIdx][1])
		Talk(1,"","Mua thµnh c«ng mét quyÓn ".. tbMatTich[nIdx][1].."!");
	end
end

function MatTichPhu_Fast()
	local nTimeMinus = 120 * 60 * 18 * 60
	local TASK_ID = 2505  --- ®¹i nh©n s©m
	local nLeftTime = GetTask(TASK_ID)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)
	local TASK_ID1 = 2506 --- TiÓu nh©n s©m
	local nLeftTime1 = GetTask(TASK_ID1)
	nLeftTime1 = floor(nLeftTime1 / 18 / 60)
	local nHour1 = floor(nLeftTime1 / 60)
	if nHour < 120 or nHour1 < 120 then
		Talk(1,"","§¹i nh©n s©m cßn "..nHour.." giê vµ TiÓu nh©n s©m cßn "..nHour1.." giê, mçi lo¹i ph¶i ®ñ 120 giê míi cã thÓ luyÖn nhanh mËt tÞch ®­îc !!!.");
		Msg2Player("§¹i nh©n s©m cßn: "..nHour.." giê, TiÓu nh©n s©m cßn: "..nHour1.." giê")
		return 0
	end
	if GetPlayerEquipIndex(9) == 0 then
		Talk(1,"","§¹i hiÖp h·y ®eo mËt tÞch lªn ng­êi míi thÓ luyÖn nhanh mËt tÞch ®­îc !!!.");
		return 0		
	end
	SetTask(2505, GetTask(2505) - nTimeMinus)
	SetTask(2506, GetTask(2506) - nTimeMinus)
	for i=1,100 do LevelUpBook(99) end
	Msg2Player("Chóc mõng ®¹i hiÖp ®· luyÖn thµnh c«ng MËt tÞch phô")
	Talk(1,"","Chóc mõng ®¹i hiÖp ®· luyÖn thµnh c«ng MËt tÞch")	
	gf_WriteLogEx("MAT TICH PHU", "kick ho¹t thµnh c«ng", 1, "LuyÖn nhanh mËt tÞch phô")	
	
end
function MatTichChinh_Fast()
	local tbSel = {}
	local szDialogTitle = "Ta cã thÓ gióp t¹i h¹ luyÖn nhanh mËt tÞch !!!"
	tinsert(tbSel, "Ta muèn rót ng¾n thêi gian tu luyÖn 28 cÊp (tiªu hao 10 Tu ch©n yÕu quyÕt, 10h §¹i nh©n s©m, 10h TiÓu nh©n s©m/#confirm_mtc(1)")
	tinsert(tbSel, "Ta muèn mét b­íc thµnh hiÒn tµi (tiªu hao 10 Tu ch©n yÕu quyÕt, 60h §¹i nh©n s©m, 60h TiÓu nh©n s©m/#confirm_mtc(2)")	
	tinsert(tbSel, "Ta sÏ quay l¹i sau/do_nothing")		
	
    Say(szDialogTitle,getn(tbSel),tbSel)	
end
function confirm_mtc(nType)
	local tCheckNhanSam = {
											[1] = {10},
											[2] = {60},
											}
	local nTimeMinus = 60 * 18 * 60
	local confirm_time = tCheckNhanSam[nType][1] * nTimeMinus
	local TASK_ID = 2505  --- ®¹i nh©n s©m
	local nLeftTime = GetTask(TASK_ID)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)
	local TASK_ID1 = 2506 --- TiÓu nh©n s©m
	local nLeftTime1 = GetTask(TASK_ID1)
	nLeftTime1 = floor(nLeftTime1 / 18 / 60)
	local nHour1 = floor(nLeftTime1 / 60)
	if nHour < tCheckNhanSam[nType][1] or nHour1 < tCheckNhanSam[nType][1] then
		Talk(1,"","§¹i nh©n s©m cßn "..nHour.." giê vµ TiÓu nh©n s©m cßn "..nHour1.." giê, mçi lo¹i ph¶i ®ñ " ..tCheckNhanSam[nType][1].. " giê míi cã thÓ luyÖn nhanh mËt tÞch ®­îc !!!.");
		Msg2Player("§¹i nh©n s©m cßn: "..nHour.." giê, TiÓu nh©n s©m cßn: "..nHour1.." giê")
		return 0
	end	
	if GetItemCount(2,0,554) < 10 then
		Talk(1,"","§¹i hiÖp kh«ng mang theo ®ñ Tu Ch©n YÕu QuyÕt, nªn kh«ng thÓ luyÖn nhanh mËt tÞch ®­îc !!!.");
		return 0	
	end	
	if GetPlayerEquipIndex(11) == 0 then
		Talk(1,"","§¹i hiÖp h·y ®eo mËt tÞch lªn ng­êi míi thÓ luyÖn nhanh mËt tÞch ®­îc !!!.");
		return 0		
	end
	SetTask(2505, GetTask(2505) - confirm_time)
	SetTask(2506, GetTask(2506) - confirm_time)
	DelItem(2,0,554,10)
	if nType == 1 then
		for i=1,28 do LevelUpBook() end
		gf_WriteLogEx("MAT TICH CHINH", "kick ho¹t thµnh c«ng", 1, "LuyÖn nhanh mËt tÞch chÝnh 28")		
		Talk(1,"","Chóc mõng ®¹i hiÖp ®· luyÖn thµnh c«ng MËt tÞch chÝnh thªm 28 cÊp")		
	else
		for i=1,100 do LevelUpBook() end
		gf_WriteLogEx("MAT TICH CHINH", "kick ho¹t thµnh c«ng", 1, "LuyÖn nhanh mËt tÞch chÝnh full")		
		Talk(1,"","Chóc mõng ®¹i hiÖp ®· luyÖn thµnh c«ng MËt tÞch chÝnh")		
	end
	Msg2Player("Chóc mõng ®¹i hiÖp ®· luyÖn thµnh c«ng MËt tÞch")


end

function do_nothing()
end

function MatTichMonPhai45()
	local tbMatTich = {
		{"Kim Cang Phôc Ma kinh", 1}, 
		{"V« TrÇn MËt tÞch", 2}, 
		{"TiÒm Long MËt tÞch", 3}, 
		{"HuyÒn ¶nh MËt tÞch", 4}, 
		{"Qu©n Tö MËt tÞch", 5}, 
		{"Nh­ ý MËt TÞch", 6}, 
		{"BÝch H¶i Phæ", 7}, 
		{"Hçn §én MËt tÞch", 8}, 
		{"Quý Thiªn MËt tÞch", 9}, 
		{"Thiªn La MËt TÞch", 10}, 
		{"TrÊn Qu©n MËt tÞch", 11}, 
		{"Xuyªn V©n MËt tÞch", 12}, 
		{"U Minh Quû Lôc", 13}, 
		{"Linh Cæ MËt tÞch", 14}, 
		{"Kinh Phong MËt tÞch", 15}, 
		{"Tóy Méng  MËt tÞch", 16}, 
		{"Phån Hoa MËt tÞch", 17}, 
		{"Mª Tung MËt tÞch", 18}, 
		{"Thiªn Phong MËt tÞch", 19},
		{"Håi Phong MËt tÞch", 20},
		{"Phô Kú MËt tÞch", 21},
		{"Ng­ng HuyÕt MËt tÞch", 22},
	}

	local tbBuyOption = {}
	for i=getn(tbMatTich),1,-1 do
		tinsert(tbBuyOption,1,tbMatTich[i][1].."/#MatTichMonPhai45_Buy("..tbMatTich[i][2]..")")
	end
	tinsert(tbBuyOption, "Ta sÏ quay l¹i sau/do_nothing")
	
	Say("Ta cã mét sè mËt tÞch 45, chØ cÇn 1000 vµng, ng­¬i cã muèn mua kh«ng?", getn(tbBuyOption), tbBuyOption)
end
function MatTichMonPhai45_Buy(nType)
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "HiÖn t¹i kh«ng thÓ mua mËt tÞch !!!")
		return 0
	end
	
	local tbMatTich = {
			[1] =  {"Kim Cang Phôc Ma kinh", {0,107,1,1}}, 
			[2] =  {"V« TrÇn MËt tÞch", {0,107,5,1}}, 
			[3] =  {"TiÒm Long MËt tÞch", {0,107,3,1}}, 
			[4] =  {"HuyÒn ¶nh MËt tÞch", {0,107,17,1}}, 
			[5] =  {"Qu©n Tö MËt tÞch", {0,107,19,1}}, 
			[6] =  {"Nh­ ý MËt TÞch", {0,107,9,1}}, 
			[7] =  {"BÝch H¶i Phæ", {0,107,11,1}}, 
			[8] =  {"Hçn §én MËt tÞch", {0,107,13,1}}, 
			[9] =  {"Quý Thiªn MËt tÞch", {0,107,15,1}}, 
			[10] = {"Thiªn La MËt tÞch", {0,107,7,1}}, 
			[11] = {"TrÊn Qu©n MËt tÞch", {0,107,21,1}}, 
			[12] = {"Xuyªn V©n MËt tÞch", {0,107,23,1}}, 
			[13] = {"U Minh Quû Lôc", {0,107,25,1}}, 
			[14] = {"Linh Cæ MËt tÞch", {0,107,27,1}}, 
			[15] = {"Kinh Phong MËt tÞch", {0,107,180,1}}, 
			[16] = {"Tóy Méng  MËt tÞch", {0,107,188,1}}, 
			[17] = {"Phån Hoa MËt tÞch", {0,107,190,1}}, 
			[18] = {"Mª Tung MËt tÞch", {0,107,228,1}}, 
			[19] = {"Thiªn Phong MËt tÞch", {0,107,232,1}},
			[20] = {"Håi Phong MËt tÞch", {0,107,182,1}},
			[21] = {"Phô Kú MËt tÞch", {0,107,184,1}},
			[22] = {"Ng­ng HuyÕt MËt tÞch", {0,107,186,1}},
	}
	
	if GetCash()<1000*10000 then
		Talk(1,"","H×nh nh­ c¸c h¹ mang kh«ng ®ñ 1000 vµng.");
		return
	end
	
	if gf_Judge_Room_Weight(2, 100)==0 then 
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, xin h·y s¾p xÕp l¹i.")
		return
	end
	
	if Pay(1000*10000) == 1 then
		AddItem(tbMatTich[nType][2][1], tbMatTich[nType][2][2],  tbMatTich[nType][2][3], 1);
		gf_WriteLogEx("MUAMATTICH45","mua", 1, tbMatTich[nType][1])		
		Talk(1,"","Mua thµnh c«ng mét quyÓn ".. tbMatTich[nType][1].."!");
	end

end
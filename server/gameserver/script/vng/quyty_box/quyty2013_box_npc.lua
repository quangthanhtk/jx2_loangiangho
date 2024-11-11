Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\viet_event\\platinum_card\\platinum_head.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua");

tbBox_QuyTy = { --xu vËt phÈm, vµng
    [0] = { 199, 999 },
    [1] = { 79, 600 },
    [2] = { 68, 500 },
}
function main()
    if IsPlayerDeath() ~= 0 then
        Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
        return
    end
    local nCountDaoRuong = VNG_GetTaskPos(TSK_DaoRuongCanhTy, 4, 1)
    if nCountDaoRuong >= 2000 then
        Talk(1, "", "<color=green>Canh Tý B¶o R­¬ng<color>: §¹i hiÖp ®· më r­¬ng 2000 lÇn råi, kh«ng thÓ më thªm ®­îc n÷a.");
        return 0
    end
    --	if GetLevel() < 86 then
    --		Talk(1, "", "§¹i hiÖp ch­a ®ñ cÊp 86 ®Ó cã thÓ më ®­îc r­¬ng !!!")
    --		return
    --	end
    --	if gf_Check55FullSkill == 0 then
    --		Talk(1, "", "§¹i hiÖp ch­a häc ®ñ kü n¨ng cÊp 55 ®Ó cã thÓ më ®­îc r­¬ng !!!")
    --		return
    --	end
    local npc_index = GetTargetNpc()
    local nNPC_name = GetNpcName(npc_index)
    local nLoaiBox = 0
    if nNPC_name == "Canh Tý B¶o R­¬ng" then
        nLoaiBox = 1
        --	elseif nNPC_name == "ChiÕu D¹ Ph¸p B¶o" then
        --		nLoaiBox = 2
        --	elseif nNPC_name == "XÝch Thè Cæ VËt" then
        --		nLoaiBox = 3
    end
    if nLoaiBox == 0 then
        Talk(1, "", "Lo¹i r­¬ng nµy hiÖn t¹i ch­a cã !!!")
        return
    end

    local tbSayDialog = {};
    local nSaySize = 0;
    local szSayHead = "Th«ng tin chi tiÕt ho¹t ®éng ®ång ®¹o cã thÓ xem t¹i trang chñ."
    tinsert(tbSayDialog, "Sö dông 199 vËt phÈm Xu ®Ó më r­¬ng/#open_QuyTy_box(1)")
    tinsert(tbSayDialog, "Sö dông 1099 vµng ®Ó më r­¬ng/#open_QuyTy_box(2)")
    tinsert(tbSayDialog, "KÕt thóc ®èi tho¹i/dialog_over")
    nSaySize = getn(tbSayDialog);
    Say(szSayHead, nSaySize, tbSayDialog);

end

function open_QuyTy_box(nType)
    if IsPlayerDeath() ~= 0 then
        Talk(1, "", "HiÖn t¹i kh«ng thÓ nhËn th­ëng!!!")
        return
    end
    local nCountDaoRuong = VNG_GetTaskPos(TSK_DaoRuongCanhTy, 4, 1)
    VNG_SetTaskPos(TSK_DaoRuongCanhTy, nType, 5, 5)
    if nCountDaoRuong >= 2000 then
        Talk(1, "", "<color=green>Canh Tý B¶o R­¬ng<color>: §¹i hiÖp ®· më r­¬ng 2000 lÇn råi, kh«ng thÓ më thªm ®­îc n÷a.");
        return 0
    end
    --	local nKCL = GetExtPoint(EXT_CDKEY)
    --	if nKCL < 1 then
    --		Talk(1, "", "§¹i hiÖp ch­a kÝch ho¹t Khiªu ChiÕn LÖnh nªn kh«ng tham gia ®­îc !!!!")
    --		return 0
    --	end
    if nType == 1 then
        if GetItemCount(2, 1, 30230) < 199 then
            Talk(1, "", "<color=green>Canh Tý B¶o R­¬ng<color>: §¹i hiÖp kh«ng ®ñ Xu vËt phÈm ®Ó më r­¬ng.");
            return 0
        end
    else
        if GetCash() < 1099 * 10000 then
            Talk(1, "", "<color=green>Canh Tý B¶o R­¬ng<color>: §¹i hiÖp kh«ng ®ñ Vµng ®Ó më r­¬ng.");
            return 0
        end
    end
    if gf_Judge_Room_Weight(5, 500) ~= 1 then
        Talk(1, "", "Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
        return 0
    end
    -------------------------------------
    local box_index = GetTargetNpc()
    --	Msg2Player("Gia tri box_index: "..box_index)
    --	SetTask(2693,box_index)  --sau khi xong, ®æi thµnh 2693 ##################################################

    if GetUnitCurStates(box_index, 2) ~= 1 or (GetTime() - GetUnitCurStates(box_index, 1)) > 5 then
        SetUnitCurStates(box_index, 1, GetTime())
        SetUnitCurStates(box_index, 2, 1)
        DoWait(28, 29, 1)
    else
        Talk(1, "", "HiÖn ®· cã ng­êi sö dông <color=red>Canh Tý B¶o r­¬ng<color>.")
        return 0
    end

end

function atmui_box_award()
    local tAward_QuyTy = {
        { 3, 5882, 390000 },
        { 1, 4000, "Qu©n C«ng Huy Hoµng", { 2, 1, 9977, 1 }, 7 * 24 * 3600 },
        { 1, 1000, "Qu©n C«ng Huy Hoµng", { 2, 1, 9977, 2 }, 7 * 24 * 3600 },
        { 2, 15000, 119000000 },
        { 2, 12000, 99000000 },
        { 2, 5000, 139000000 },
        { 31, 10000, "give_weapon7()" },
        { 31, 10000, "give_weapon8()" },
        { 31, 18000, "give_weapon9()" },
        { 31, 7000, "give_sachPet6()" },
        { 1, 10, "Chiªu yªu Kú", { 2, 1, 31307, 1 } },
        { 1, 150, "Th«n NguyÖt LÖnh", { 2, 1, 31256, 1 } },
        { 1, 5000, "§¸ quý 3", { 2, 1, 31000, 1 } },
        { 1, 2000, "§¸ quý 4", { 2, 1, 31001, 1 } },
        { 1, 1000, "§¸ quý 5", { 2, 1, 31024, 1 } },
        { 1, 400, "§¸ quý 6", { 2, 1, 31123, 1 } },
        { 31, 500, "give_VanSucHoanMy2()" },
        { 1, 700, "Ngäc Béi Hµo HiÖp V« H¹", { 2, 1, 30974, 1 } },
        { 1, 8, "LÖnh bµi trang søc S¸t Tinh", { 2, 1, 31317, 1 } },
        { 31, 400, "give_vkAmHuyet()" },
        { 1, 250, "L¹c ®µ tr¾ng", { 0, 105, 184, 1, 1, -1, -1, -1, -1, -1, -1, -1 } },
        { 31, 1700, "MatTichMonPhai20_Random()" },

        --{31, 3500, "give_stone3()"},
        --{31, 500, "give_stone4()"},
        --{31, 200, "give_stone5()"},
        --{31, 100, "give_stone6()"},
        --		 		{31, 250, "give_KimXa4(1)"},
        --		 		{31, 1, "give_HHVD5()"},
        --		 		{1, 1500, "N÷ Oa Tinh Th¹ch", {2, 1, 504, 1}, 7 * 24 * 3600},
        --		 		{31, 249, "MatTichMonPhai20_Random()"},

        --				{3, 3000, 790000},
        --				{3, 1000, 3900000},
        --				{1, 3290, "M¶nh B¹ch Kim", {2, 1, 30346, 1}},
        --				{2, 5000, 6666666},
        --				{2, 7000, 8888888},
        --				{1, 5000, "QuÕ Hoa Töu", {2,0,189, 79}},
        --				{1, 4500, "M¶nh Thiªn Cang", {2,1,30390,8}},
        --				{1, 3020, "M¶nh Thiªn Cang", {2,1,30390,39}},
        --				{31, 10000, "give_fruit1()"},
        --				{31, 7000, "give_fruit2()"},
        --				{31, 20000, "give_weapon7()"},
        --				{31, 10000, "give_weapon8()"},
        --		 		{31, 5000, "give_weapon9()"},
        --				{31, 6178, "give70GaojiMiji()"},
        --				{1, 5000, "L× X×", {2,1,30476, 6}},
        --				{1, 5000, "L× X×", {2,1,30476, 8}},
        --				{31, 5, "give_HHVD2()"},
        --				{31, 4, "give_HHVD3()"},
        --				{31, 2, "give_HHVD4()"},
        --				{31, 1, "give_HHVD5()"},
    }
    --	if GetItemCount(2,1,30230) < 199 then
    --			Talk(1, "", "<color=green>Êt Mïi  B¶o R­¬ng<color>: §¹i hiÖp kh«ng ®ñ Xu vËt phÈm ®Ó më r­¬ng.");
    --			return 0
    --	end
    --	if DelItem(2,1,30230, 199) == 1 then
    local nTypePay = VNG_GetTaskPos(TSK_DaoRuongCanhTy, 5, 5)
    local nCountDaoRuong = VNG_GetTaskPos(TSK_DaoRuongCanhTy, 4, 1)
    VNG_SetTaskPos(TSK_DaoRuongCanhTy, nCountDaoRuong + 1, 4, 1)
    if nCountDaoRuong > 2000 then
        return 0
    end
    if nTypePay == 1 then
        if GetItemCount(2, 1, 30230) < 199 then
            Talk(1, "", "<color=green>Canh Tý B¶o R­¬ng<color>: §¹i hiÖp kh«ng ®ñ Xu vËt phÈm ®Ó më r­¬ng.");
            return 0
        end
        if DelItem(2, 1, 30230, 199) == 1 then
            --				DelItem(2,1,30230, 199)
            ModifyExp(120000000)
            gf_EventGiveRandAward(tAward_QuyTy, 100000, 1, "CANH TY BAO RUONG", "më r­¬ng thµnh c«ng")
            gf_WriteLogEx("CANH TY BAO RUONG", "Trõ xu", 1, "§µo b»ng xu")
        end
    elseif nTypePay == 2 then
        if GetCash() < 1099 * 10000 then
            Talk(1, "", "<color=green>Canh Tý B¶o R­¬ng<color>: §¹i hiÖp kh«ng ®ñ Vµng ®Ó më r­¬ng.");
            return 0
        end
        if Pay(1099 * 10000) == 1 then
            --			Pay(1200*10000)
            ModifyExp(120000000)
            gf_EventGiveRandAward(tAward_QuyTy, 100000, 1, "CANH TY BAO RUONG", "më r­¬ng thµnh c«ng")
            gf_WriteLogEx("CANH TY BAO RUONG", "Trõ tiÒn", 1, "§µo b»ng vµng")
        end
    else
        return 0
    end
    VNG_SetTaskPos(TSK_DaoRuongCanhTy, 0, 5, 5)
    gf_WriteLogEx("CANH TY BAO RUONG BK", "Trõ", 1, "§· trõ")
    --	end
end

function give_weapon7()
    tAttribute_quyty_first = {    --tAttribute_bkl_first
        [1] = { 285, 11, { { 5, 900 }, { 6, 90 }, { 7, 10 } } },
        [2] = { 304, 30, { { 4, 800 }, { 5, 150 }, { 6, 50 } } },
        [3] = { 41, 60, { { 5, 600 }, { 6, 300 }, { 7, 100 } } },
        [4] = { 42, 60, { { 5, 600 }, { 6, 300 }, { 7, 100 } } },
        [5] = { 49, 60, { { 6, 500 }, { 7, 500 } } },
        [6] = { 50, 15, { { 6, 600 }, { 7, 400 } } },
        [7] = { 252, 4, { { 4, 850 }, { 5, 120 }, { 6, 30 } } },
        [8] = { 268, 10, { { 5, 800 }, { 6, 150 }, { 7, 50 } } },
        [9] = { 53, 35, { { 6, 600 }, { 7, 400 } } },
        [10] = { 54, 35, { { 6, 600 }, { 7, 400 } } },
        [11] = { 63, 35, { { 5, 400 }, { 6, 400 }, { 7, 200 } } },
        [12] = { 64, 35, { { 5, 400 }, { 6, 400 }, { 7, 200 } } },
        [13] = { 390, 5, { { 3, 700 }, { 4, 200 }, { 5, 100 } } },
        [14] = { 85, 35, { { 5, 500 }, { 6, 300 }, { 7, 200 } } },
        [15] = { 86, 35, { { 5, 500 }, { 6, 300 }, { 7, 200 } } },
        [16] = { 94, 70, { { 6, 400 }, { 7, 600 } } },
        [17] = { 95, 70, { { 6, 400 }, { 7, 600 } } },
        [18] = { 96, 70, { { 6, 400 }, { 7, 600 } } },
        [19] = { 97, 70, { { 6, 400 }, { 7, 600 } } },
        [20] = { 98, 70, { { 6, 400 }, { 7, 600 } } },
        [21] = { 102, 40, { { 6, 400 }, { 7, 600 } } },
        [22] = { 111, 70, { { 6, 600 }, { 7, 400 } } },
        [23] = { 277, 30, { { 4, 800 }, { 5, 150 }, { 6, 50 } } },
        [24] = { 278, 40, { { 4, 800 }, { 5, 150 }, { 6, 50 } } },
        [25] = { 308, 5, { { 5, 700 }, { 6, 200 }, { 7, 100 } } },

    }
    local tWeapon_quyty = { --tWeapon_bkl
        { 300, "V¹n NhÉn", 0, 0, 14 },
        { 700, "M·n Thiªn Hoa Vò", 0, 1, 53 },
        { 700, "Háa Tinh", 0, 2, 36 },
        { 800, "Cæ §Ýnh", 0, 3, 64 },
        { 700, "ThÇn Cung", 0, 4, 119 },
        { 700, "LiÖt DiÖm", 0, 5, 40 },
        { 1000, "§¹i H¶o L«i Th­¬ng", 0, 6, 108 },
        { 700, "L¨ng Phong", 0, 7, 12 },
        { 700, "A La H¸n Tr­îng", 0, 8, 97 },
        { 700, "ThÇn Hµnh", 0, 9, 86 },
        { 700, "Hi Nh©n CÇm", 0, 10, 75 },
        { 700, "M·nh Hæ", 0, 11, 12 },
        { 900, "Minh B¨ng", 0, 12, 12 },
        { 700, "Ngäc Doanh", 0, 13, 12 },
    }

    local add_flag = 0
    local prize_name = ""
    local nRan_weapon = get_random_quyty(tWeapon_quyty, 10000, 1)
    local nRandomAttr = 0
    local nRandomAttrLevel = 0
    local tWeaponAttr = { { 0, 0 }, { 0, 0 }, { 0, 0 } }
    local nPerTurn = 1000
    for i = 1, 3 do
        nRandomAttr = get_random_attrib_quyty(tAttribute_quyty_first, nPerTurn)
        --print("gia tri random "..nRandomAttr)
        nPerTurn = nPerTurn - tAttribute_quyty_first[nRandomAttr][2]
        nRandomAttrLevel = get_random_attrib_quyty(tAttribute_quyty_first[nRandomAttr][3], 1000)
        tWeaponAttr[i][1] = tAttribute_quyty_first[nRandomAttr][3][nRandomAttrLevel][1]
        tWeaponAttr[i][2] = tAttribute_quyty_first[nRandomAttr][1]
        tremove(tAttribute_quyty_first, nRandomAttr)
    end
    add_flag = AddItem(tWeapon_quyty[nRan_weapon][3], tWeapon_quyty[nRan_weapon][4], tWeapon_quyty[nRan_weapon][5], 1, 1, tWeaponAttr[1][1], tWeaponAttr[1][2], tWeaponAttr[2][1], tWeaponAttr[2][2], tWeaponAttr[3][1], tWeaponAttr[3][2])
    prize_name = tWeapon_quyty[nRan_weapon][2]
    if add_flag == 1 then
        Msg2Player("B¹n më B¶o r­¬ng, nhËn ®­îc: " .. prize_name .. "!")
        gf_WriteLogEx("CANH TY BAO RUONG BK", "Më r­¬ng thµnh c«ng", 1, prize_name)
    else
        gf_WriteLogEx("CANH TY BAO RUONG BK", "Më r­¬ng thÊt b¹i", 1, prize_name)
    end
    --	Msg2Player("Vò khÝ cÊp 7")
end
function give_weapon8()
    tAttribute_quyty_first = {    --tAttribute_bkl_first
        [1] = { 285, 8, { { 5, 900 }, { 6, 90 }, { 7, 10 } } },
        [2] = { 304, 30, { { 4, 800 }, { 5, 150 }, { 6, 50 } } },
        [3] = { 41, 60, { { 5, 600 }, { 6, 300 }, { 7, 100 } } },
        [4] = { 42, 60, { { 5, 600 }, { 6, 300 }, { 7, 100 } } },
        [5] = { 49, 60, { { 6, 500 }, { 7, 500 } } },
        [6] = { 50, 15, { { 6, 600 }, { 7, 400 } } },
        [7] = { 252, 6, { { 3, 700 }, { 4, 250 }, { 5, 50 } } },
        [8] = { 268, 10, { { 5, 800 }, { 6, 150 }, { 7, 50 } } },
        [9] = { 53, 35, { { 6, 600 }, { 7, 400 } } },
        [10] = { 54, 35, { { 6, 600 }, { 7, 400 } } },
        [11] = { 63, 35, { { 5, 400 }, { 6, 400 }, { 7, 200 } } },
        [12] = { 64, 35, { { 5, 400 }, { 6, 400 }, { 7, 200 } } },
        [13] = { 390, 6, { { 3, 700 }, { 4, 200 }, { 5, 100 } } },
        [14] = { 85, 35, { { 5, 500 }, { 6, 300 }, { 7, 200 } } },
        [15] = { 86, 35, { { 5, 500 }, { 6, 300 }, { 7, 200 } } },
        [16] = { 94, 70, { { 6, 400 }, { 7, 600 } } },
        [17] = { 95, 70, { { 6, 400 }, { 7, 600 } } },
        [18] = { 96, 70, { { 6, 400 }, { 7, 600 } } },
        [19] = { 97, 70, { { 6, 400 }, { 7, 600 } } },
        [20] = { 98, 70, { { 6, 400 }, { 7, 600 } } },
        [21] = { 102, 40, { { 6, 400 }, { 7, 600 } } },
        [22] = { 111, 70, { { 6, 600 }, { 7, 400 } } },
        [23] = { 277, 30, { { 4, 800 }, { 5, 150 }, { 6, 50 } } },
        [24] = { 278, 40, { { 4, 800 }, { 5, 150 }, { 6, 50 } } },
        [25] = { 308, 5, { { 5, 700 }, { 6, 200 }, { 7, 100 } } },
    }
    local tWeapon_quyty = { --tWeapon_bkl
        { 700, "ThÇn Quy", 0, 0, 15 },
        { 700, "Khoa Phô", 0, 1, 54 },
        { 700, "Häa ¶nh", 0, 2, 37 },
        { 800, "LËu C¶nh", 0, 3, 65 },
        { 700, "Viªn §Ò", 0, 4, 120 },
        { 700, "Ngäc Trô", 0, 5, 41 },
        { 800, "Cöu Long Toµn KÝch", 0, 6, 109 },
        { 700, "BÝch Thñy", 0, 7, 13 },
        { 700, "Môc KiÒn Liªn Tr­îng", 0, 8, 98 },
        { 700, "Toan D­", 0, 9, 87 },
        { 700, "§¹i Th¸nh Di ¢m", 0, 10, 76 },
        { 700, "V« NgÊn", 0, 11, 13 },
        { 700, "XÝch Tiªu", 0, 12, 13 },
        { 700, "Di T©m", 0, 13, 13 },
    }

    local add_flag = 0
    local prize_name = ""
    local nRan_weapon = get_random_quyty(tWeapon_quyty, 10000, 1)
    local nRandomAttr = 0
    local nRandomAttrLevel = 0
    local tWeaponAttr = { { 0, 0 }, { 0, 0 }, { 0, 0 } }
    local nPerTurn = 1000
    for i = 1, 3 do
        nRandomAttr = get_random_attrib_quyty(tAttribute_quyty_first, nPerTurn)
        nPerTurn = nPerTurn - tAttribute_quyty_first[nRandomAttr][2]
        nRandomAttrLevel = get_random_attrib_quyty(tAttribute_quyty_first[nRandomAttr][3], 1000)
        tWeaponAttr[i][1] = tAttribute_quyty_first[nRandomAttr][3][nRandomAttrLevel][1]
        tWeaponAttr[i][2] = tAttribute_quyty_first[nRandomAttr][1]
        tremove(tAttribute_quyty_first, nRandomAttr)
    end
    add_flag = AddItem(tWeapon_quyty[nRan_weapon][3], tWeapon_quyty[nRan_weapon][4], tWeapon_quyty[nRan_weapon][5], 1, 1, tWeaponAttr[1][1], tWeaponAttr[1][2], tWeaponAttr[2][1], tWeaponAttr[2][2], tWeaponAttr[3][1], tWeaponAttr[3][2])
    prize_name = tWeapon_quyty[nRan_weapon][2]
    if add_flag == 1 then
        Msg2Player("B¹n më B¶o r­¬ng, nhËn ®­îc: " .. prize_name .. "!")
        gf_WriteLogEx("CANH TY BAO RUONG BK", "Më r­¬ng thµnh c«ng", 1, prize_name)
    else
        gf_WriteLogEx("CANH TY BAO RUONG BK", "Më r­¬ng thÊt b¹i", 1, prize_name)
    end
    --	Msg2Player("Vò khÝ cÊp 8")
end
function give_weapon9()
    tAttribute_quyty_first = {    --tAttribute_bkl_first
        [1] = { 285, 8, { { 5, 900 }, { 6, 90 }, { 7, 10 } } },
        [2] = { 304, 30, { { 4, 800 }, { 5, 150 }, { 6, 50 } } },
        [3] = { 41, 60, { { 5, 600 }, { 6, 300 }, { 7, 100 } } },
        [4] = { 42, 60, { { 5, 600 }, { 6, 300 }, { 7, 100 } } },
        [5] = { 49, 60, { { 6, 500 }, { 7, 500 } } },
        [6] = { 50, 15, { { 6, 600 }, { 7, 400 } } },
        [7] = { 252, 6, { { 3, 700 }, { 4, 250 }, { 5, 50 } } },
        [8] = { 268, 10, { { 5, 800 }, { 6, 150 }, { 7, 50 } } },
        [9] = { 53, 35, { { 6, 600 }, { 7, 400 } } },
        [10] = { 54, 35, { { 6, 600 }, { 7, 400 } } },
        [11] = { 63, 35, { { 5, 400 }, { 6, 400 }, { 7, 200 } } },
        [12] = { 64, 35, { { 5, 400 }, { 6, 400 }, { 7, 200 } } },
        [13] = { 390, 6, { { 3, 700 }, { 4, 200 }, { 5, 100 } } },
        [14] = { 85, 35, { { 5, 500 }, { 6, 300 }, { 7, 200 } } },
        [15] = { 86, 35, { { 5, 500 }, { 6, 300 }, { 7, 200 } } },
        [16] = { 94, 70, { { 6, 400 }, { 7, 600 } } },
        [17] = { 95, 70, { { 6, 400 }, { 7, 600 } } },
        [18] = { 96, 70, { { 6, 400 }, { 7, 600 } } },
        [19] = { 97, 70, { { 6, 400 }, { 7, 600 } } },
        [20] = { 98, 70, { { 6, 400 }, { 7, 600 } } },
        [21] = { 102, 40, { { 6, 400 }, { 7, 600 } } },
        [22] = { 111, 70, { { 6, 600 }, { 7, 400 } } },
        [23] = { 277, 30, { { 4, 800 }, { 5, 150 }, { 6, 50 } } },
        [24] = { 278, 40, { { 4, 800 }, { 5, 150 }, { 6, 50 } } },
        [25] = { 308, 5, { { 5, 700 }, { 6, 200 }, { 7, 100 } } },
    }
    local tWeapon_quyty = { --tWeapon_bkl
        { 700, "¢m D­¬ng ¢n", 0, 0, 16 },
        { 700, "Kh«ng Cã", 0, 1, 55 },
        { 700, "Nha Cöu", 0, 2, 38 },
        { 800, "NghÞch L©n", 0, 3, 66 },
        { 700, "B¸t X¹ Chi X¹", 0, 4, 121 },
        { 700, "ThÇn Ch©m", 0, 5, 42 },
        { 800, "Th­¬ng N«", 0, 6, 110 },
        { 700, "Thiªn T«n", 0, 7, 14 },
        { 700, "D­îc S­ Tr­îng", 0, 8, 99 },
        { 700, "Th¸i H­", 0, 9, 88 },
        { 700, "Kh« Méc Long Ng©m", 0, 10, 77 },
        { 700, "Thanh Long", 0, 11, 14 },
        { 700, "U©n H­¬ng", 0, 12, 14 },
        { 700, "Hoan Linh", 0, 13, 14 },
    }

    local add_flag = 0
    local prize_name = ""
    local nRan_weapon = get_random_quyty(tWeapon_quyty, 10000, 1)
    local nRandomAttr = 0
    local nRandomAttrLevel = 0
    local tWeaponAttr = { { 0, 0 }, { 0, 0 }, { 0, 0 } }
    local nPerTurn = 1000
    for i = 1, 3 do
        nRandomAttr = get_random_attrib_quyty(tAttribute_quyty_first, nPerTurn)
        nPerTurn = nPerTurn - tAttribute_quyty_first[nRandomAttr][2]
        nRandomAttrLevel = get_random_attrib_quyty(tAttribute_quyty_first[nRandomAttr][3], 1000)
        tWeaponAttr[i][1] = tAttribute_quyty_first[nRandomAttr][3][nRandomAttrLevel][1]
        tWeaponAttr[i][2] = tAttribute_quyty_first[nRandomAttr][1]
        tremove(tAttribute_quyty_first, nRandomAttr)
    end
    add_flag = AddItem(tWeapon_quyty[nRan_weapon][3], tWeapon_quyty[nRan_weapon][4], tWeapon_quyty[nRan_weapon][5], 1, 1, tWeaponAttr[1][1], tWeaponAttr[1][2], tWeaponAttr[2][1], tWeaponAttr[2][2], tWeaponAttr[3][1], tWeaponAttr[3][2])
    prize_name = tWeapon_quyty[nRan_weapon][2]
    if add_flag == 1 then
        Msg2Player("B¹n më B¶o r­¬ng, nhËn ®­îc: " .. prize_name .. "!")
        gf_WriteLogEx("CANH TY BAO RUONG BK", "Më r­¬ng thµnh c«ng", 1, prize_name)
    else
        gf_WriteLogEx("CANH TY BAO RUONG BK", "Më r­¬ng thÊt b¹i", 1, prize_name)
    end
    --	Msg2Player("Vò khÝ cÊp 9")
end
function get_random_quyty(tWeapon_quyty, nMaxPE, nDefault)
    --get_random_bkl
    local nPos = 0;
    local nRand = random(1, nMaxPE);
    for i = 1, getn(tWeapon_quyty) do
        if nRand > nPos and nRand <= nPos + tWeapon_quyty[i][1] then
            return i;
        end
        nPos = nPos + tWeapon_quyty[i][1];
    end
    return nDefault;
end
function get_random_attrib_quyty(nTabQuyTy, nDeterminator)
    --get_random_attrib_bkl
    local nRandom = random(1, nDeterminator)
    local nBase = 0
    for i = 1, getn(nTabQuyTy) do
        nBase = nBase + nTabQuyTy[i][2]
        if nRandom <= nBase then
            return i
        end
    end
    --them gia tri default o day
    --return 1
end
-- MËt tÞch cao cÊp
VET_2012_GAOJIMIJI = {
    [2] = { "Kim Cang B¸t Nh· Ch©n QuyÓn ", { 0, 107, 204, 1 } },
    [4] = { "TiÒm Long Tóc DiÖt Ch©n QuyÓn", { 0, 107, 205, 1 } },
    [3] = { "V« TrÇn Bå §Ò Ch©n QuyÓn", { 0, 107, 206, 1 } },
    [6] = { "Thiªn La Liªn Ch©u Ch©n QuyÓn", { 0, 107, 207, 1 } },
    [8] = { "Nh­ ý Kim §Ønh Ch©n QuyÓn", { 0, 107, 208, 1 } },
    [9] = { "BÝch H¶i TuyÖt ¢m Ch©n QuyÓn", { 0, 107, 209, 1 } },
    [11] = { "Hçn §én TrÊn Nh¹c Ch©n QuyÓn", { 0, 107, 210, 1 } },
    [12] = { "Quú Thiªn Du Long Ch©n QuyÓn", { 0, 107, 211, 1 } },
    [14] = { "HuyÒn ¶nh Mª T«ng Ch©n QuyÓn", { 0, 107, 212, 1 } },
    [15] = { "Qu©n Tö §íi Phong Ch©n QuyÓn", { 0, 107, 213, 1 } },
    [17] = { "TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn", { 0, 107, 214, 1 } },
    [18] = { "Xuyªn V©n L¹c Hång Ch©n QuyÓn", { 0, 107, 215, 1 } },
    [20] = { "HuyÒn Minh Phong Ma Ch©n QuyÓn", { 0, 107, 216, 1 } },
    [21] = { "Linh Cæ HuyÒn Tµ Ch©n QuyÓn", { 0, 107, 217, 1 } },
    [23] = { "Cöu Thiªn Phong L«i Ch©n QuyÓn", { 0, 107, 218, 1 } },
    [25] = { "Cöu Thiªn Phong L«i Ch©n QuyÓn", { 0, 107, 219, 1 } },
    [26] = { "Cöu Thiªn Phong L«i Ch©n QuyÓn", { 0, 107, 220, 1 } },
    [27] = { "Cöu Thiªn Phong L«i Ch©n QuyÓn", { 0, 107, 221, 1 } },
    [29] = { "Hång TrÇn Tóy Méng Ch©n QuyÓn", { 0, 107, 222, 1 } },
    [30] = { "Phong Hoa Thiªn DiÖp Ch©n QuyÓn", { 0, 107, 223, 1 } },
}

function give70GaojiMiji()
    local nRoute = GetPlayerRoute()
    gf_AddItemEx2(VET_2012_GAOJIMIJI[nRoute][2], VET_2012_GAOJIMIJI[nRoute][1], "CANH TY BAO RUONG BK", "nhËn ®­îc")
    --gf_EventGiveRandAward(VET_2012_GAOJIMIJI,10000,1)
end
VET_2013_FRUIT = {
    [1] = { 1, 5, "Nh·n", { 2, 1, 30164, 1 }, 0 },
    [2] = { 1, 5, "Ch«m Ch«m", { 2, 1, 30165, 1 }, 0 },
    [3] = { 1, 5, "Cam", { 2, 1, 30165, 1 }, 0 },
    [4] = { 1, 5, "Dõa", { 2, 1, 30167, 1 }, 0 },
    [5] = { 1, 5, "M¨ng Côt", { 2, 1, 30168, 1 }, 0 },
    [6] = { 1, 5, "M·ng cÇu", { 2, 1, 30179, 1 }, 0 },
    [7] = { 1, 5, "Khãm", { 2, 1, 30180, 1 }, 0 },
    [8] = { 1, 5, "Lª", { 2, 1, 30181, 1 }, 0 },
    [9] = { 1, 5, "Bßn Bon", { 2, 1, 30182, 1 }, 0 },
    [10] = { 1, 5, "KhÕ", { 2, 1, 30183, 1 }, 0 },
    [11] = { 1, 5, "B­ëi", { 2, 1, 30169, 1 }, 0 },
    [12] = { 1, 5, "D©u", { 2, 1, 30170, 1 }, 0 },
    [13] = { 1, 5, "Chuèi", { 2, 1, 30171, 1 }, 0 },
    [14] = { 1, 5, "Xoµi", { 2, 1, 30172, 1 }, 0 },
    [15] = { 1, 5, "§µo", { 2, 1, 30173, 1 }, 0 },
    [16] = { 1, 5, "MËn", { 2, 1, 30174, 1 }, 0 },
    [17] = { 1, 5, "V¶i", { 2, 1, 30175, 1 }, 0 },
    [18] = { 1, 5, "T¸o", { 2, 1, 30176, 1 }, 0 },
    [19] = { 1, 5, "B¬", { 2, 1, 30177, 1 }, 0 },
    [20] = { 1, 5, "§u §ñ", { 2, 1, 30178, 1 }, 0 },
}
function give_fruit1()
    local nIndex = random(1, 20)
    local nG = VET_2013_FRUIT[nIndex][4][1]
    local nD = VET_2013_FRUIT[nIndex][4][2]
    local nP = VET_2013_FRUIT[nIndex][4][3]
    gf_AddItemEx2({ nG, nD, nP, 39 }, VET_2013_FRUIT[nIndex][3], "CANH TY BAO RUONG BK", "tr¸i c©y")
end
function give_fruit2()
    local nIndex = random(1, 20)
    local nG = VET_2013_FRUIT[nIndex][4][1]
    local nD = VET_2013_FRUIT[nIndex][4][2]
    local nP = VET_2013_FRUIT[nIndex][4][3]
    gf_AddItemEx2({ nG, nD, nP, 68 }, VET_2013_FRUIT[nIndex][3], "CANH TY BAO RUONG BK", "tr¸i c©y")
end
function give_fruit3()
    --	local nIndex = random(1,20)
    local nG = VET_2013_FRUIT[20][4][1]
    local nD = VET_2013_FRUIT[20][4][2]
    local nP = VET_2013_FRUIT[20][4][3]
    gf_AddItemEx2({ nG, nD, nP, 77 }, VET_2013_FRUIT[20][3], "CANH TY BAO RUONG BK", "tr¸i c©y")
    Msg2Player("B¹n nhËn ®­îc 77 §u §ñ")
end
function give_fruit4()
    --	local nIndex = random(1,20)
    local nG = VET_2013_FRUIT[14][4][1]
    local nD = VET_2013_FRUIT[14][4][2]
    local nP = VET_2013_FRUIT[14][4][3]
    gf_AddItemEx2({ nG, nD, nP, 77 }, VET_2013_FRUIT[14][3], "CANH TY BAO RUONG BK", "tr¸i c©y")
    Msg2Player("B¹n nhËn ®­îc 77 Xoµi")
end
function give_HHVD2()
    gf_AddItemEx2({ 0, 102, 8840, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0 }, "Huy Hoµng Chi Thñy", "CANH TY BAO RUONG BK", "Huy Hoµng Chi Thñy")
    gf_AddItemEx2({ 0, 102, 8841, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0 }, "Vinh Dù Chi Thñy", "CANH TY BAO RUONG BK", "Vinh Dù Chi Thñy")
end
function give_HHVD3()
    gf_AddItemEx2({ 0, 102, 8842, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0 }, "Huy Hoµng Chi KÕ", "CANH TY BAO RUONG BK", "Huy Hoµng Chi KÕ")
    gf_AddItemEx2({ 0, 102, 8843, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0 }, "Vinh Dù Chi KÕ", "CANH TY BAO RUONG BK", "Vinh Dù Chi KÕ")
end
function give_HHVD4()
    gf_AddItemEx2({ 0, 102, 8844, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0 }, "Huy Hoµng QuËt Khëi", "CANH TY BAO RUONG BK", "Huy Hoµng QuËt Khëi")
    gf_AddItemEx2({ 0, 102, 8845, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0 }, "Vinh Dù QuËt Khëi", "CANH TY BAO RUONG BK", "Vinh Dù QuËt Khëi")
    Msg2Player("B¹n nhËn ®­îc vËt phÈm Huy Hoµng Vinh Dù QuËt Khëi")
end
function give_HHVD5()
    gf_AddItemEx2({ 0, 102, 8846, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0 }, "Huy Hoµng", "CANH TY BAO RUONG BK", "Huy Hoµng")
    gf_AddItemEx2({ 0, 102, 8847, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0 }, "Vinh Dù", "CANH TY BAO RUONG BK", "Vinh Dù")
    Msg2Player("B¹n nhËn ®­îc vËt phÈm Huy Hoµng Vinh Dù")
end

function giapngo()
    local szNpcName = "<color=green>B¾c §Èu L·o Nh©n<color>: "
    local tSay = {}
    local tHeader = szNpcName .. "NhËn th­ëng xong 3 lo¹i (TuyÖt ¶nh BÝ B¶o, ChiÕu D¹ Ph¸p B¶o, XÝch Thè Cæ VËt) sÏ ®­îc nhËn phÇn th­ëng hÊp dÉn M· §¸o Thµnh C«ng"

    tinsert(tSay, "NhËn th­ëng TuyÖt ¶nh BÝ B¶o (kÝch ho¹t r­¬ng TuyÖt ¶nh thµnh c«ng 1000 lÇn)/#get_MaDaoThanhCong(1)")
    tinsert(tSay, "NhËn th­ëng ChiÕu D¹ Ph¸p B¶o (kÝch ho¹t r­¬ng ChiÕu D¹ thµnh c«ng 1000 lÇn)/#get_MaDaoThanhCong(2)")
    tinsert(tSay, "NhËn th­ëng XÝch Thè Cæ VËt (kÝch ho¹t r­¬ng XÝch Thè thµnh c«ng 1000 lÇn)/#get_MaDaoThanhCong(3)")
    tinsert(tSay, "NhËn th­ëng M· §¸o Thµnh C«ng (®· nhËn th­ëng thµnh c«ng 3 lo¹i r­¬ng)/#get_MaDaoThanhCong(4)")
    tinsert(tSay, "Ta ch­a muèn nhËn th­ëng/dialog_over")
    Say(tHeader, getn(tSay), tSay)
end

function get_MaDaoThanhCong(nType)
    if gf_Judge_Room_Weight(5, 500) ~= 1 then
        Talk(1, "", "Hµnh trang hoÆc søc lùc kh«ng ®ñ, vui lßng s¾p xÕp l¹i.");
        return 0
    end
    local nCheck = 0
    local nCount = 0
    if nType == 1 then
        nCheck = VNG_GetTaskPos(TSK_GIAPNGO_1, 5, 5)
        nCount = VNG_GetTaskPos(TSK_GIAPNGO_1, 4, 1)
    elseif nType == 2 then
        nCheck = VNG_GetTaskPos(TSK_GIAPNGO_1, 10, 10)
        nCount = VNG_GetTaskPos(TSK_GIAPNGO_1, 9, 6)
    elseif nType == 3 then
        nCheck = VNG_GetTaskPos(TSK_GIAPNGO_2, 5, 5)
        nCount = VNG_GetTaskPos(TSK_GIAPNGO_2, 4, 1)
    elseif nType == 4 then
        --check ®k lo¹i 4
        nCheck = VNG_GetTaskPos(TSK_GIAPNGO_2, 6, 6)
        local nCheck1 = VNG_GetTaskPos(TSK_GIAPNGO_1, 5, 5)
        local nCheck2 = VNG_GetTaskPos(TSK_GIAPNGO_1, 10, 10)
        local nCheck3 = VNG_GetTaskPos(TSK_GIAPNGO_2, 5, 5)
        if nCheck >= 1 then
            Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi. PhÇn th­ëng chØ nhËn ®­îc 1 lÇn duy nhÊt !!!!")
            return 0
        end
        if nCheck1 < 1 or nCheck2 < 1 or nCheck3 < 1 then
            Talk(1, "", "§¹i hiÖp ch­a nhËn th­ëng hÕt 3 lo¹i B¶o R­¬ng ë trªn !!!!")
            return 0
        end
    end
    --check ®k lo¹i 1, 2, 3
    if nType == 1 or nType == 2 or nType == 3 then
        if nCheck >= 1 then
            Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi. PhÇn th­ëng chØ nhËn ®­îc 1 lÇn duy nhÊt !!!!")
            return 0
        end
        if nCount < 1000 then
            Talk(1, "", "§¹i hiÖp ch­a kÝch ho¹t ®ñ 1000 B¶o R­¬ng !!!!")
            return 0
        end
    end
    --ph¸t th­ëng
    if nType == 1 then
        VNG_SetTaskPos(TSK_GIAPNGO_1, 1, 5, 5)
        ModifyExp(1000000000)
        give_weapon7()
        Msg2Player("Ph¸t th­ëng TuyÖt ¶nh BÝ B¶o thµnh c«ng")
        gf_WriteLogEx("CANH TY BAO RUONG BK", "nhËn", 1, "NhËn th­ëng cuèi TuyÖt ¶nh BÝ B¶o")
    elseif nType == 2 then
        VNG_SetTaskPos(TSK_GIAPNGO_1, 1, 10, 10)
        ModifyExp(2000000000)
        MatTichMonPhai20_Random()
        Msg2Player("Ph¸t th­ëng ChiÕu D¹ Ph¸p B¶o thµnh c«ng")
        gf_WriteLogEx("CANH TY BAO RUONG BK", "nhËn", 1, "NhËn th­ëng cuèi ChiÕu D¹ Ph¸p B¶o")
    elseif nType == 3 then
        VNG_SetTaskPos(TSK_GIAPNGO_2, 1, 5, 5)
        ModifyExp(2000000000)
        give_weapon8()
        Msg2Player("Ph¸t th­ëng XÝch Thè Cæ VËt thµnh c«ng")
        gf_WriteLogEx("CANH TY BAO RUONG BK", "nhËn", 1, "NhËn th­ëng cuèi XÝch Thè Cæ VËt")
    elseif nType == 4 then
        VNG_SetTaskPos(TSK_GIAPNGO_2, 1, 6, 6)
        ModifyExp(2000000000)
        give_HHVD5()
        MatTichMonPhai20_HePhai()
        Msg2Player("Ph¸t th­ëng M· §¸o Thµnh C«ng thµnh c«ng")
        gf_WriteLogEx("CANH TY BAO RUONG BK", "nhËn", 1, "NhËn th­ëng cuèi M· §¸o Thµnh C«ng")
    end
end
VET_BOOK_PET1 = {
    { 1, 699, "Ch©n khÝ hé thÓ CÊp 1", { 2, 150, 1, 1 }, 0 },
    { 1, 699, "Ých Thä Diªn D­¬ng CÊp 1", { 2, 150, 5, 1 }, 0 },
    { 1, 699, "C­êng Th©n B¸ ThÓ CÊp 1", { 2, 150, 9, 1 }, 0 },
    { 1, 699, "¢m Phong Thùc Cèt CÊp 1", { 2, 150, 13, 1 }, 0 },
    { 1, 456, "HuyÒn Vò V« Song CÊp 1", { 2, 150, 17, 1 }, 0 },
    { 1, 699, "V« Hµnh V« T­¬ng CÊp 1", { 2, 150, 21, 1 }, 0 },
    { 1, 699, "Kim Linh Phô ThÓ CÊp 1", { 2, 150, 25, 1 }, 0 },
    { 1, 699, "Méc Linh Phô ThÓ CÊp 1", { 2, 150, 29, 1 }, 0 },
    { 1, 699, "Thñy Linh Phô ThÓ CÊp 1", { 2, 150, 33, 1 }, 0 },
    { 1, 699, "Háa Linh Phô ThÓ CÊp 1", { 2, 150, 37, 1 }, 0 },
    { 1, 699, "Thæ Linh Phô ThÓ CÊp 1", { 2, 150, 41, 1 }, 0 },
    { 1, 699, "Ph¸ Kh«ng Tr¶m ¶nh CÊp 1", { 2, 150, 45, 1 }, 0 },
    { 1, 699, "S¸t th­¬ng gia n©ng CÊp 1", { 2, 150, 49, 1 }, 0 },
    { 1, 456, "Khinh Linh TÊn TËt CÊp 1", { 2, 150, 53, 1 }, 0 },
    { 1, 700, "V« H×nh Chi Cæ CÊp 1", { 2, 150, 57, 1 }, 0 },
}

VET_BOOK_PET2 = {
    { 1, 699, "Ch©n khÝ hé thÓ CÊp 2", { 2, 150, 2, 1 }, 0 },
    { 1, 699, "Ých Thä Diªn D­¬ng CÊp 2", { 2, 150, 6, 1 }, 0 },
    { 1, 699, "C­êng Th©n B¸ ThÓ CÊp 2", { 2, 150, 10, 1 }, 0 },
    { 1, 699, "¢m Phong Thùc Cèt CÊp 2", { 2, 150, 14, 1 }, 0 },
    { 1, 456, "HuyÒn Vò V« Song CÊp 2", { 2, 150, 18, 1 }, 0 },
    { 1, 699, "V« Hµnh V« T­¬ng CÊp 2", { 2, 150, 22, 1 }, 0 },
    { 1, 699, "Kim Linh Phô ThÓ CÊp 2", { 2, 150, 26, 1 }, 0 },
    { 1, 699, "Méc Linh Phô ThÓ CÊp 2", { 2, 150, 30, 1 }, 0 },
    { 1, 699, "Thñy Linh Phô ThÓ CÊp 2", { 2, 150, 34, 1 }, 0 },
    { 1, 699, "Háa Linh Phô ThÓ CÊp 2", { 2, 150, 38, 1 }, 0 },
    { 1, 699, "Thæ Linh Phô ThÓ CÊp 2", { 2, 150, 42, 1 }, 0 },
    { 1, 699, "Ph¸ Kh«ng Tr¶m ¶nh CÊp 2", { 2, 150, 46, 1 }, 0 },
    { 1, 699, "S¸t th­¬ng gia n©ng CÊp 2", { 2, 150, 50, 1 }, 0 },
    { 1, 456, "Khinh Linh TÊn TËt CÊp 2", { 2, 150, 54, 1 }, 0 },
    { 1, 700, "V« H×nh Chi Cæ CÊp 2", { 2, 150, 58, 1 }, 0 },
}

VET_BOOK_PET3 = {
    { 1, 718, "Ch©n khÝ hé thÓ CÊp 3", { 2, 150, 3, 1 }, 0 },
    { 1, 718, "Ých Thä Diªn D­¬ng CÊp 3", { 2, 150, 7, 1 }, 0 },
    { 1, 718, "C­êng Th©n B¸ ThÓ CÊp 3", { 2, 150, 11, 1 }, 0 },
    { 1, 718, "¢m Phong Thùc Cèt CÊp 3", { 2, 150, 15, 1 }, 0 },
    { 1, 333, "HuyÒn Vò V« Song CÊp 3", { 2, 150, 19, 1 }, 0 },
    { 1, 718, "V« Hµnh V« T­¬ng CÊp 3", { 2, 150, 23, 1 }, 0 },
    { 1, 718, "Kim Linh Phô ThÓ CÊp 3", { 2, 150, 27, 1 }, 0 },
    { 1, 718, "Méc Linh Phô ThÓ CÊp 3", { 2, 150, 31, 1 }, 0 },
    { 1, 718, "Thñy Linh Phô ThÓ CÊp 3", { 2, 150, 35, 1 }, 0 },
    { 1, 718, "Háa Linh Phô ThÓ CÊp 3", { 2, 150, 39, 1 }, 0 },
    { 1, 718, "Thæ Linh Phô ThÓ CÊp 3", { 2, 150, 43, 1 }, 0 },
    { 1, 718, "Ph¸ Kh«ng Tr¶m ¶nh CÊp 3", { 2, 150, 47, 1 }, 0 },
    { 1, 718, "S¸t th­¬ng gia n©ng CÊp 3", { 2, 150, 51, 1 }, 0 },
    { 1, 333, "Khinh Linh TÊn TËt CÊp 3", { 2, 150, 55, 1 }, 0 },
    { 1, 718, "V« H×nh Chi Cæ CÊp 3", { 2, 150, 59, 1 }, 0 },
}
VET_BOOK_PET4 = {
    { 1, 718, "Ch©n khÝ hé thÓ CÊp 4", { 2, 150, 4, 1 }, 0 },
    { 1, 718, "Ých Thä Diªn D­¬ng CÊp 4", { 2, 150, 8, 1 }, 0 },
    { 1, 718, "C­êng Th©n B¸ ThÓ CÊp 4", { 2, 150, 12, 1 }, 0 },
    { 1, 718, "¢m Phong Thùc Cèt CÊp 4", { 2, 150, 16, 1 }, 0 },
    { 1, 333, "HuyÒn Vò V« Song CÊp 4", { 2, 150, 20, 1 }, 0 },
    { 1, 718, "V« Hµnh V« T­¬ng CÊp 4", { 2, 150, 24, 1 }, 0 },
    { 1, 718, "Kim Linh Phô ThÓ CÊp 4", { 2, 150, 28, 1 }, 0 },
    { 1, 718, "Méc Linh Phô ThÓ CÊp 4", { 2, 150, 32, 1 }, 0 },
    { 1, 718, "Thuû Linh Phô ThÓ CÊp 4", { 2, 150, 36, 1 }, 0 },
    { 1, 718, "Ho¶ Linh Phô ThÓ CÊp 4", { 2, 150, 40, 1 }, 0 },
    { 1, 718, "Thæ Linh Phô ThÓ CÊp 4", { 2, 150, 44, 1 }, 0 },
    { 1, 718, "Ph¸ Kh«ng Tr¶m ¶nh CÊp 4", { 2, 150, 48, 1 }, 0 },
    { 1, 718, "S¸t th­¬ng gia n©ng cÊp 4", { 2, 150, 52, 1 }, 0 },
    { 1, 333, "Khinh Linh TÊn TËt  CÊp 4", { 2, 150, 56, 1 }, 0 },
    { 1, 718, "V« H×nh Chi Cæ CÊp 4", { 2, 150, 60, 1 }, 0 },
}
function Book_Pet1(nNum)
    for i = 1, nNum do
        gf_EventGiveRandAward(VET_BOOK_PET1, 10000, "", "CANH TY BAO RUONG BK", "S¸ch PET 1")
        Msg2Player("B¹n nhËn ®­îc 1 s¸ch PET cÊp 1")
    end
end

function Book_Pet2(nNum)
    for i = 1, nNum do
        gf_EventGiveRandAward(VET_BOOK_PET2, 10000, "", "CANH TY BAO RUONG BK", "S¸ch PET 2")
        Msg2Player("B¹n nhËn ®­îc 1 s¸ch PET cÊp 2")
    end
end

function Book_Pet3(nNum)
    for i = 1, nNum do
        gf_EventGiveRandAward(VET_BOOK_PET3, 10000, "", "CANH TY BAO RUONG BK", "S¸ch PET 3")
        Msg2Player("B¹n nhËn ®­îc 1 s¸ch PET cÊp 3")
    end
end

function Book_Pet4(nNum)
    for i = 1, nNum do
        gf_EventGiveRandAward(VET_BOOK_PET4, 10000, "", "CANH TY BAO RUONG BK", "S¸ch PET 4")
        Msg2Player("B¹n nhËn ®­îc 1 s¸ch PET cÊp 4")
    end
end

tbKimXa3sao = {
    [1] = { item = { { gdp = { 0, 152, 3, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "¸o Choµng Háa V©n" } } },
    [2] = { item = { { gdp = { 0, 152, 4, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "¸o Choµng Kim ChÕ ngò hµnh" } } },
    [3] = { item = { { gdp = { 0, 152, 5, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "¸o Choµng Méc ChÕ ngò hµnh" } } },
    [4] = { item = { { gdp = { 0, 152, 6, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "¸o Choµng Thñy ChÕ ngò hµnh" } } },
    [5] = { item = { { gdp = { 0, 152, 7, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "¸o Choµng Háa ChÕ ngò hµnh" } } },
    [6] = { item = { { gdp = { 0, 152, 8, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "¸o Choµng Thæ ChÕ ngò hµnh" } } },
    [7] = { item = { { gdp = { 0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "¸o Choµng ¢m ChÕ ngò hµnh" } } },
    [8] = { item = { { gdp = { 0, 153, 3, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Huy Ch­¬ng Ngäc ChÕ" } } },
    [9] = { item = { { gdp = { 0, 153, 4, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Huy Ch­¬ng Kim ChÕ ngò hµnh" } } },
    [10] = { item = { { gdp = { 0, 153, 5, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Huy Ch­¬ng Méc ChÕ ngò hµnh" } } },
    [11] = { item = { { gdp = { 0, 153, 6, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Huy Ch­¬ng Thñy ChÕ ngò hµnh" } } },
    [12] = { item = { { gdp = { 0, 153, 7, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Huy Ch­¬ng Háa ChÕ ngò hµnh" } } },
    [13] = { item = { { gdp = { 0, 153, 8, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Huy Ch­¬ng Thæ ChÕ ngò hµnh" } } },
    [14] = { item = { { gdp = { 0, 153, 9, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Huy Ch­¬ng ¢m ChÕ ngò hµnh" } } },
    [15] = { item = { { gdp = { 0, 154, 3, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Bè ChÕ Cao §ång Ngoa" } } },
    [16] = { item = { { gdp = { 0, 154, 4, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "ChiÕn Hµi Kim ChÕ ngò hµnh" } } },
    [17] = { item = { { gdp = { 0, 154, 5, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "ChiÕn Hµi Méc ChÕ ngò hµnh" } } },
    [18] = { item = { { gdp = { 0, 154, 6, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "ChiÕn Hµi Thñy ChÕ ngò hµnh" } } },
    [19] = { item = { { gdp = { 0, 154, 7, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "ChiÕn Hµi Háa ChÕ ngò hµnh" } } },
    [20] = { item = { { gdp = { 0, 154, 8, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "ChiÕn Hµi Thæ ChÕ ngò hµnh" } } },
    [21] = { item = { { gdp = { 0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "ChiÕn Hµi ¢m ChÕ ngò hµnh" } } },
}

tbAwardRate = {
    [1] = { [1] = tbKimXa3sao[1], nRate = 7 },
    [2] = { [1] = tbKimXa3sao[2], nRate = 5 },
    [3] = { [1] = tbKimXa3sao[3], nRate = 5 },
    [4] = { [1] = tbKimXa3sao[4], nRate = 5 },
    [5] = { [1] = tbKimXa3sao[5], nRate = 5 },
    [6] = { [1] = tbKimXa3sao[6], nRate = 5 },
    [7] = { [1] = tbKimXa3sao[7], nRate = 1 },
    [8] = { [1] = tbKimXa3sao[8], nRate = 7 },
    [9] = { [1] = tbKimXa3sao[9], nRate = 5 },
    [10] = { [1] = tbKimXa3sao[10], nRate = 5 },
    [11] = { [1] = tbKimXa3sao[11], nRate = 5 },
    [12] = { [1] = tbKimXa3sao[12], nRate = 5 },
    [13] = { [1] = tbKimXa3sao[13], nRate = 5 },
    [14] = { [1] = tbKimXa3sao[14], nRate = 1.5 },
    [15] = { [1] = tbKimXa3sao[15], nRate = 7 },
    [16] = { [1] = tbKimXa3sao[16], nRate = 5 },
    [17] = { [1] = tbKimXa3sao[17], nRate = 5 },
    [18] = { [1] = tbKimXa3sao[18], nRate = 5 },
    [19] = { [1] = tbKimXa3sao[19], nRate = 5 },
    [20] = { [1] = tbKimXa3sao[20], nRate = 5 },
    [21] = { [1] = tbKimXa3sao[21], nRate = 1.5 },
}

function TrangBiKimXa3Sao(nQty)
    for i = 1, nQty do
        LIB_Award:AwardByRate(tbAwardRate)
        Msg2Player("B¹n nhËn ®­îc trang bÞ Kim Xµ !!!!")
    end
    gf_WriteLogEx("CANH TY BAO RUONG BK", "nhËn", 1, "trang bÞ Kim Xµ")
end
tbMatTich_GN = {
    [2] = { 0, 107, 204, 2, "Kim Cang B¸t Nh· Ch©n QuyÓn" },
    [4] = { 0, 107, 205, 1, "TiÒm Long Tóc DiÖt Ch©n QuyÓn" },
    [3] = { 0, 107, 206, 1, "V« TrÇn Bå §Ò Ch©n QuyÓn" },
    [6] = { 0, 107, 207, 2, "Thiªn La Liªn Ch©u Ch©n QuyÓn" },
    [8] = { 0, 107, 208, 1, "Nh­ ý Kim §Ønh Ch©n QuyÓn" },
    [9] = { 0, 107, 209, 1, "BÝch H¶i TuyÖt ¢m Ch©n QuyÓn" },
    [11] = { 0, 107, 210, 2, "Hçn §én TrÊn Nh¹c Ch©n QuyÓn" },
    [12] = { 0, 107, 211, 2, "Quú Thiªn Du Long Ch©n QuyÓn" },
    [14] = { 0, 107, 212, 1, "HuyÒn ¶nh Mª T«ng Ch©n QuyÓn" },
    [15] = { 0, 107, 213, 2, "Qu©n Tö §íi Phong Ch©n QuyÓn" },
    [17] = { 0, 107, 214, 2, "TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn" },
    [18] = { 0, 107, 215, 2, "Xuyªn V©n L¹c Hång Ch©n QuyÓn" },
    [20] = { 0, 107, 216, 2, "HuyÒn Minh Phong Ma Ch©n QuyÓn" },
    [21] = { 0, 107, 217, 1, "Linh Cæ HuyÒn Tµ Ch©n QuyÓn" },
    [23] = { 0, 107, 218, 1, "Cöu Thiªn Phong L«i Ch©n QuyÓn" },
    [25] = { 0, 107, 219, 1, "Cöu Thiªn Phong L«i Ch©n QuyÓn" },
    [26] = { 0, 107, 220, 1, "Cöu Thiªn Phong L«i Ch©n QuyÓn" },
    [27] = { 0, 107, 221, 1, "Cöu Thiªn Phong L«i Ch©n QuyÓn" },
    [29] = { 0, 107, 222, 2, "Hång TrÇn Tóy Méng Ch©n QuyÓn" },
    [30] = { 0, 107, 223, 2, "Phong Hoa Thiªn DiÖp Ch©n QuyÓn" },
}
function MatTichMonPhai20_HePhai()
    local nRoute = GetPlayerRoute()
    local _, nItemID = AddItem(tbMatTich_GN[nRoute][1], tbMatTich_GN[nRoute][2], tbMatTich_GN[nRoute][3], 1)
    if tbMatTich_GN[nRoute][4] == 1 then
        SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
    else
        SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
    end
    gf_WriteLogEx("CANH TY BAO RUONG BK", "nhËn", 1, "MËt tÞch siªu cÊp")
    Msg2Player("B¹n nhËn ®­îc 1 mËt tÞch siªu cÊp")
end
tbMatTich_random_GN = {
    [0] = { 0, 107, 204, 2, "Kim Cang B¸t Nh· Ch©n QuyÓn" },
    [1] = { 0, 107, 205, 1, "TiÒm Long Tóc DiÖt Ch©n QuyÓn" },
    [2] = { 0, 107, 206, 1, "V« TrÇn Bå §Ò Ch©n QuyÓn" },
    [3] = { 0, 107, 207, 2, "Thiªn La Liªn Ch©u Ch©n QuyÓn" },
    [4] = { 0, 107, 208, 1, "Nh­ ý Kim §Ønh Ch©n QuyÓn" },
    [5] = { 0, 107, 209, 1, "BÝch H¶i TuyÖt ¢m Ch©n QuyÓn" },
    [6] = { 0, 107, 210, 2, "Hçn §én TrÊn Nh¹c Ch©n QuyÓn" },
    [7] = { 0, 107, 211, 2, "Quú Thiªn Du Long Ch©n QuyÓn" },
    [8] = { 0, 107, 212, 1, "HuyÒn ¶nh Mª T«ng Ch©n QuyÓn" },
    [9] = { 0, 107, 213, 2, "Qu©n Tö §íi Phong Ch©n QuyÓn" },
    [10] = { 0, 107, 214, 2, "TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn" },
    [11] = { 0, 107, 215, 2, "Xuyªn V©n L¹c Hång Ch©n QuyÓn" },
    [12] = { 0, 107, 216, 2, "HuyÒn Minh Phong Ma Ch©n QuyÓn" },
    [13] = { 0, 107, 217, 1, "Linh Cæ HuyÒn Tµ Ch©n QuyÓn" },
    [14] = { 0, 107, 218, 1, "Cöu Thiªn Phong L«i Ch©n QuyÓn" },
    [15] = { 0, 107, 222, 2, "Hång TrÇn Tóy Méng Ch©n QuyÓn" },
    [16] = { 0, 107, 223, 2, "Phong Hoa Thiªn DiÖp Ch©n QuyÓn" },
    [17] = { 0, 107, 231, 2, "Hång TrÇn Tóy Méng Ch©n QuyÓn" },
    [18] = { 0, 107, 235, 2, "Phong Hoa Thiªn DiÖp Ch©n QuyÓn" },
}
function MatTichMonPhai20_Random()
    local nAwardRand = mod(random(1, 1000), 19)
    local _, nItemID = AddItem(tbMatTich_random_GN[nAwardRand][1], tbMatTich_random_GN[nAwardRand][2], tbMatTich_random_GN[nAwardRand][3], 1)
    if tbMatTich_random_GN[nAwardRand][4] == 1 then
        SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
    else
        SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
    end
    gf_WriteLogEx("CANH TY BAO RUONG BK", "nhËn", 1, "MËt tÞch siªu cÊp")
    Msg2Player("B¹n nhËn ®­îc 1 mËt tÞch siªu cÊp")
end
function give_sachPet6()
    local tPet_BookLev6 = {
        { 1, 5400, "Ch©n khÝ hé thÓ", { 2, 150, 87, 1 }, 0 },
        { 1, 6400, "Ých thä diªn th­¬ng", { 2, 150, 88, 1 }, 0 },
        { 1, 6400, "C­êng th©n b¸ thÓ", { 2, 150, 89, 1 }, 0 },
        { 1, 6400, "¢m phong thùc cèt", { 2, 150, 90, 1 }, 0 },
        { 1, 6000, "HuyÒn vò v« song", { 2, 150, 91, 1 }, 0 },
        { 1, 6000, "V« hµnh v« t­¬ng", { 2, 150, 92, 1 }, 0 },
        { 1, 5000, "Kim linh phô thÓ", { 2, 150, 93, 1 }, 0 },
        { 1, 5000, "Méc linh phô thÓ", { 2, 150, 94, 1 }, 0 },
        { 1, 5000, "Thñy linh phô thÓ", { 2, 150, 95, 1 }, 0 },
        { 1, 5000, "Háa linh phô thÓ", { 2, 150, 96, 1 }, 0 },
        { 1, 5000, "Thæ linh phô thÓ", { 2, 150, 97, 1 }, 0 },
        { 1, 5000, "Ph¸ kh«ng tr¶m ¶nh", { 2, 150, 98, 1 }, 0 },
        { 1, 5000, "S¸t th­¬ng gia n©ng", { 2, 150, 99, 1 }, 0 },
        { 1, 5000, "Khinh linh tÊn tËt", { 2, 150, 100, 1 }, 0 },
        { 1, 5000, "V« h×nh chi cæ", { 2, 150, 101, 1 }, 0 },
        { 1, 5000, "Linh quang nhÊt thiÓm", { 2, 150, 102, 1 }, 0 },
        { 1, 5400, "Ng­ng thÇn quyÕt", { 2, 150, 103, 1 }, 0 },
        { 1, 5000, "Kinh ®µo quyÕt", { 2, 150, 104, 1 }, 0 },
        { 1, 1500, "Nguyªn thñy b¹o né", { 2, 150, 105, 1 }, 0 },
        { 1, 1500, "ThiÕt bè sam", { 2, 150, 106, 1 }, 0 },
    }

    gf_EventGiveRandAward(tPet_BookLev6, 100000, 1, "SACH PET LEVEL 6 BK", "award ngÉu nhiªn");
    gf_WriteLogEx("SACH PET LEVEL 6", "nhËn", 1, "s¸ch b®h cÊp 6")
end
function give_stone4()
    local tbRanStone1 = {
        { 1, 25, "HuyÕt TrÝch Th¹ch CÊp 4", { 2, 22, 104, 1 } },
        { 1, 25, "NguyÖt B¹ch Th¹ch CÊp 4", { 2, 22, 204, 1 } },
        { 1, 25, "Hæ Ph¸ch Th¹ch CÊp 4", { 2, 22, 304, 1 } },
        { 1, 25, "H¾c DiÖu Th¹ch CÊp 4", { 2, 22, 404, 1 } },
    }
    gf_EventGiveRandAward(tbRanStone1, 100, 1, "CANH TY BAO RUONG BK", "§¸ 4")
end

function give_stone5()
    local tbRanStone2 = {
        { 1, 25, "HuyÕt TrÝch Th¹ch CÊp 5", { 2, 22, 105, 1 } },
        { 1, 25, "NguyÖt B¹chT h¹ch CÊp 5", { 2, 22, 205, 1 } },
        { 1, 25, "Hæ Ph¸ch Th¹ch CÊp 5", { 2, 22, 305, 1 } },
        { 1, 25, "H¾c DiÖu Th¹ch CÊp 5", { 2, 22, 405, 1 } },
    }
    gf_EventGiveRandAward(tbRanStone2, 100, 1, "CANH TY BAO RUONG BK", "§¸ 5")
end
function give_stone6()
    local tbRanStone2 = {
        { 1, 25, "HuyÕt TrÝch Th¹ch CÊp 6", { 2, 22, 106, 1 } },
        { 1, 25, "NguyÖt B¹chT h¹ch CÊp 6", { 2, 22, 206, 1 } },
        { 1, 25, "Hæ Ph¸ch Th¹ch CÊp 6", { 2, 22, 306, 1 } },
        { 1, 25, "H¾c DiÖu Th¹ch CÊp 6", { 2, 22, 406, 1 } },
    }
    gf_EventGiveRandAward(tbRanStone2, 100, 1, "CANH TY BAO RUONG BK", "§¸ 6")
end
function give_stone3()
    local tbRanStone3 = {
        { 1, 25, "HuyÕt TrÝch Th¹ch CÊp 3", { 2, 22, 103, 1 } },
        { 1, 25, "NguyÖt B¹ch Th¹ch CÊp 3", { 2, 22, 203, 1 } },
        { 1, 25, "Hæ Ph¸ch Th¹ch CÊp 3", { 2, 22, 303, 1 } },
        { 1, 25, "H¾c DiÖu Th¹ch CÊp 3", { 2, 22, 403, 1 } },
    }
    gf_EventGiveRandAward(tbRanStone3, 100, 1, "CANH TY BAO RUONG BK", "§¸ 3")
end
function give_VanSucHoanMy2()
    local tbVanSucHM = {
        { 1, 20, "Kh¾c b¶n cÊp 2", { 2, 1, 31073, 1 } },
        { 1, 20, "Kh¾c b¶n cÊp 2", { 2, 1, 31074, 1 } },
        { 1, 20, "Kh¾c b¶n cÊp 2", { 2, 1, 31075, 1 } },
        { 1, 20, "Kh¾c b¶n cÊp 2", { 2, 1, 31076, 1 } },
        { 1, 20, "Kh¾c b¶n cÊp 2", { 2, 1, 31077, 1 } },
    }
    gf_EventGiveRandAward(tbVanSucHM, 100, 1, "CANH TY BAO RUONG BK", "Kh¾c b¶n 2")
end
tbKimXa4 = {
    [1] = { item = { { gdp = { 0, 153, 28, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "Huy Ch­¬ng V©n Du" } } },
    [2] = { item = { { gdp = { 0, 152, 28, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "¸o Choµng V©n Du" } } },
    [3] = { item = { { gdp = { 0, 154, 28, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "§¹o Hµi V©n Du" } } },
    [4] = { item = { { gdp = { 0, 153, 27, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "Huy Ch­¬ng ThiÕt HuyÕt" } } },
    [5] = { item = { { gdp = { 0, 152, 27, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "¸o Choµng ThiÕt HuyÕt" } } },
    [6] = { item = { { gdp = { 0, 154, 27, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "§¹o Hµi ThiÕt HuyÕt" } } },
    [7] = { item = { { gdp = { 0, 153, 26, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "Huy Ch­¬ng Du HiÖp" } } },
    [8] = { item = { { gdp = { 0, 152, 26, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "¸o Choµng Du HiÖp" } } },
    [9] = { item = { { gdp = { 0, 154, 26, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "§¹o Hµi Du HiÖp" } } },
}
tbAwardRateKX4 = {
    [1] = { [1] = tbKimXa4[1], nRate = 11.1 },
    [2] = { [1] = tbKimXa4[2], nRate = 11.1 },
    [3] = { [1] = tbKimXa4[3], nRate = 11.1 },
    [4] = { [1] = tbKimXa4[4], nRate = 11.1 },
    [5] = { [1] = tbKimXa4[5], nRate = 11.1 },
    [6] = { [1] = tbKimXa4[6], nRate = 11.1 },
    [7] = { [1] = tbKimXa4[7], nRate = 11.1 },
    [8] = { [1] = tbKimXa4[8], nRate = 11.1 },
    [9] = { [1] = tbKimXa4[9], nRate = 11.2 },
}
function give_KimXa4()
    LIB_Award:AwardByRate(tbAwardRateKX4)
    Msg2Player("B¹n nhËn ®­îc trang bÞ Kim Xµ !!!!")
    gf_WriteLogEx("GIAP NGO BAO RUONG BK", "nhËn", 1, "trang bÞ Kim Xµ 4")
end

function dialog_over()

end
function give_vkAmHuyet()
    local tvkAmHuyet = {
        { 1, 4600, "vk Èm huyÕt", { 0, 3, 30884, 1 }, 0 },
        { 1, 4600, "vk Èm huyÕt", { 0, 8, 30885, 1 }, 0 },
        { 1, 4600, "vk Èm huyÕt", { 0, 0, 30886, 1 }, 0 },
        { 1, 4600, "vk Èm huyÕt", { 0, 1, 30887, 1 }, 0 },
        { 1, 4600, "vk Èm huyÕt", { 0, 2, 30888, 1 }, 0 },
        { 1, 4600, "vk Èm huyÕt", { 0, 10, 30889, 1 }, 0 },
        { 1, 4600, "vk Èm huyÕt", { 0, 0, 30890, 1 }, 0 },
        { 1, 4600, "vk Èm huyÕt", { 0, 5, 30891, 1 }, 0 },
        { 1, 4600, "vk Èm huyÕt", { 0, 2, 30892, 1 }, 0 },
        { 1, 4600, "vk Èm huyÕt", { 0, 9, 30893, 1 }, 0 },
        { 1, 4500, "vk Èm huyÕt", { 0, 6, 30894, 1 }, 0 },
        { 1, 4500, "vk Èm huyÕt", { 0, 4, 30895, 1 }, 0 },
        { 1, 4500, "vk Èm huyÕt", { 0, 7, 30896, 1 }, 0 },
        { 1, 4500, "vk Èm huyÕt", { 0, 11, 30897, 1 }, 0 },
        { 1, 4500, "vk Èm huyÕt", { 0, 2, 30898, 1 }, 0 },
        { 1, 4500, "vk Èm huyÕt", { 0, 3, 30899, 1 }, 0 },
        { 1, 4500, "vk Èm huyÕt", { 0, 9, 30900, 1 }, 0 },
        { 1, 4500, "vk Èm huyÕt", { 0, 11, 30901, 1 }, 0 },
        { 1, 4500, "vk Èm huyÕt", { 0, 13, 30902, 1 }, 0 },
        { 1, 4500, "vk Èm huyÕt", { 0, 12, 30903, 1 }, 0 },
        { 1, 4500, "vk Èm huyÕt", { 0, 14, 32164, 1 }, 0 },
        { 1, 4500, "vk Èm huyÕt", { 0, 2, 32192, 1 }, 0 },
    }
    gf_EventGiveRandAward(tvkAmHuyet, 100000, 1, "VK AM HUYET BK", "award ngÉu nhiªn");
end
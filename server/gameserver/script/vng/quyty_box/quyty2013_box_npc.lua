Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\viet_event\\platinum_card\\platinum_head.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua");

tbBox_QuyTy = { --xu v�t ph�m, v�ng
    [0] = { 199, 999 },
    [1] = { 79, 600 },
    [2] = { 68, 500 },
}
function main()
    if IsPlayerDeath() ~= 0 then
        Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
        return
    end
    local nCountDaoRuong = VNG_GetTaskPos(TSK_DaoRuongCanhTy, 4, 1)
    if nCountDaoRuong >= 2000 then
        Talk(1, "", "<color=green>Canh T� B�o R��ng<color>: ��i hi�p �� m� r��ng 2000 l�n r�i, kh�ng th� m� th�m ���c n�a.");
        return 0
    end
    --	if GetLevel() < 86 then
    --		Talk(1, "", "��i hi�p ch�a �� c�p 86 �� c� th� m� ���c r��ng !!!")
    --		return
    --	end
    --	if gf_Check55FullSkill == 0 then
    --		Talk(1, "", "��i hi�p ch�a h�c �� k� n�ng c�p 55 �� c� th� m� ���c r��ng !!!")
    --		return
    --	end
    local npc_index = GetTargetNpc()
    local nNPC_name = GetNpcName(npc_index)
    local nLoaiBox = 0
    if nNPC_name == "Canh T� B�o R��ng" then
        nLoaiBox = 1
        --	elseif nNPC_name == "Chi�u D� Ph�p B�o" then
        --		nLoaiBox = 2
        --	elseif nNPC_name == "X�ch Th� C� V�t" then
        --		nLoaiBox = 3
    end
    if nLoaiBox == 0 then
        Talk(1, "", "Lo�i r��ng n�y hi�n t�i ch�a c� !!!")
        return
    end

    local tbSayDialog = {};
    local nSaySize = 0;
    local szSayHead = "Th�ng tin chi ti�t ho�t ��ng ��ng ��o c� th� xem t�i trang ch�."
    tinsert(tbSayDialog, "S� d�ng 199 v�t ph�m Xu �� m� r��ng/#open_QuyTy_box(1)")
    tinsert(tbSayDialog, "S� d�ng 1099 v�ng �� m� r��ng/#open_QuyTy_box(2)")
    tinsert(tbSayDialog, "K�t th�c ��i tho�i/dialog_over")
    nSaySize = getn(tbSayDialog);
    Say(szSayHead, nSaySize, tbSayDialog);

end

function open_QuyTy_box(nType)
    if IsPlayerDeath() ~= 0 then
        Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
        return
    end
    local nCountDaoRuong = VNG_GetTaskPos(TSK_DaoRuongCanhTy, 4, 1)
    VNG_SetTaskPos(TSK_DaoRuongCanhTy, nType, 5, 5)
    if nCountDaoRuong >= 2000 then
        Talk(1, "", "<color=green>Canh T� B�o R��ng<color>: ��i hi�p �� m� r��ng 2000 l�n r�i, kh�ng th� m� th�m ���c n�a.");
        return 0
    end
    --	local nKCL = GetExtPoint(EXT_CDKEY)
    --	if nKCL < 1 then
    --		Talk(1, "", "��i hi�p ch�a k�ch ho�t Khi�u Chi�n L�nh n�n kh�ng tham gia ���c !!!!")
    --		return 0
    --	end
    if nType == 1 then
        if GetItemCount(2, 1, 30230) < 199 then
            Talk(1, "", "<color=green>Canh T� B�o R��ng<color>: ��i hi�p kh�ng �� Xu v�t ph�m �� m� r��ng.");
            return 0
        end
    else
        if GetCash() < 1099 * 10000 then
            Talk(1, "", "<color=green>Canh T� B�o R��ng<color>: ��i hi�p kh�ng �� V�ng �� m� r��ng.");
            return 0
        end
    end
    if gf_Judge_Room_Weight(5, 500) ~= 1 then
        Talk(1, "", "H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
        return 0
    end
    -------------------------------------
    local box_index = GetTargetNpc()
    --	Msg2Player("Gia tri box_index: "..box_index)
    --	SetTask(2693,box_index)  --sau khi xong, ��i th�nh 2693 ##################################################

    if GetUnitCurStates(box_index, 2) ~= 1 or (GetTime() - GetUnitCurStates(box_index, 1)) > 5 then
        SetUnitCurStates(box_index, 1, GetTime())
        SetUnitCurStates(box_index, 2, 1)
        DoWait(28, 29, 1)
    else
        Talk(1, "", "Hi�n �� c� ng��i s� d�ng <color=red>Canh T� B�o r��ng<color>.")
        return 0
    end

end

function atmui_box_award()
    local tAward_QuyTy = {
        { 3, 5882, 390000 },
        { 1, 4000, "Qu�n C�ng Huy Ho�ng", { 2, 1, 9977, 1 }, 7 * 24 * 3600 },
        { 1, 1000, "Qu�n C�ng Huy Ho�ng", { 2, 1, 9977, 2 }, 7 * 24 * 3600 },
        { 2, 15000, 119000000 },
        { 2, 12000, 99000000 },
        { 2, 5000, 139000000 },
        { 31, 10000, "give_weapon7()" },
        { 31, 10000, "give_weapon8()" },
        { 31, 18000, "give_weapon9()" },
        { 31, 7000, "give_sachPet6()" },
        { 1, 10, "Chi�u y�u K�", { 2, 1, 31307, 1 } },
        { 1, 150, "Th�n Nguy�t L�nh", { 2, 1, 31256, 1 } },
        { 1, 5000, "�� qu� 3", { 2, 1, 31000, 1 } },
        { 1, 2000, "�� qu� 4", { 2, 1, 31001, 1 } },
        { 1, 1000, "�� qu� 5", { 2, 1, 31024, 1 } },
        { 1, 400, "�� qu� 6", { 2, 1, 31123, 1 } },
        { 31, 500, "give_VanSucHoanMy2()" },
        { 1, 700, "Ng�c B�i H�o Hi�p V� H�", { 2, 1, 30974, 1 } },
        { 1, 8, "L�nh b�i trang s�c S�t Tinh", { 2, 1, 31317, 1 } },
        { 31, 400, "give_vkAmHuyet()" },
        { 1, 250, "L�c �� tr�ng", { 0, 105, 184, 1, 1, -1, -1, -1, -1, -1, -1, -1 } },
        { 31, 1700, "MatTichMonPhai20_Random()" },

        --{31, 3500, "give_stone3()"},
        --{31, 500, "give_stone4()"},
        --{31, 200, "give_stone5()"},
        --{31, 100, "give_stone6()"},
        --		 		{31, 250, "give_KimXa4(1)"},
        --		 		{31, 1, "give_HHVD5()"},
        --		 		{1, 1500, "N� Oa Tinh Th�ch", {2, 1, 504, 1}, 7 * 24 * 3600},
        --		 		{31, 249, "MatTichMonPhai20_Random()"},

        --				{3, 3000, 790000},
        --				{3, 1000, 3900000},
        --				{1, 3290, "M�nh B�ch Kim", {2, 1, 30346, 1}},
        --				{2, 5000, 6666666},
        --				{2, 7000, 8888888},
        --				{1, 5000, "Qu� Hoa T�u", {2,0,189, 79}},
        --				{1, 4500, "M�nh Thi�n Cang", {2,1,30390,8}},
        --				{1, 3020, "M�nh Thi�n Cang", {2,1,30390,39}},
        --				{31, 10000, "give_fruit1()"},
        --				{31, 7000, "give_fruit2()"},
        --				{31, 20000, "give_weapon7()"},
        --				{31, 10000, "give_weapon8()"},
        --		 		{31, 5000, "give_weapon9()"},
        --				{31, 6178, "give70GaojiMiji()"},
        --				{1, 5000, "L� X�", {2,1,30476, 6}},
        --				{1, 5000, "L� X�", {2,1,30476, 8}},
        --				{31, 5, "give_HHVD2()"},
        --				{31, 4, "give_HHVD3()"},
        --				{31, 2, "give_HHVD4()"},
        --				{31, 1, "give_HHVD5()"},
    }
    --	if GetItemCount(2,1,30230) < 199 then
    --			Talk(1, "", "<color=green>�t M�i  B�o R��ng<color>: ��i hi�p kh�ng �� Xu v�t ph�m �� m� r��ng.");
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
            Talk(1, "", "<color=green>Canh T� B�o R��ng<color>: ��i hi�p kh�ng �� Xu v�t ph�m �� m� r��ng.");
            return 0
        end
        if DelItem(2, 1, 30230, 199) == 1 then
            --				DelItem(2,1,30230, 199)
            ModifyExp(120000000)
            gf_EventGiveRandAward(tAward_QuyTy, 100000, 1, "CANH TY BAO RUONG", "m� r��ng th�nh c�ng")
            gf_WriteLogEx("CANH TY BAO RUONG", "Tr� xu", 1, "��o b�ng xu")
        end
    elseif nTypePay == 2 then
        if GetCash() < 1099 * 10000 then
            Talk(1, "", "<color=green>Canh T� B�o R��ng<color>: ��i hi�p kh�ng �� V�ng �� m� r��ng.");
            return 0
        end
        if Pay(1099 * 10000) == 1 then
            --			Pay(1200*10000)
            ModifyExp(120000000)
            gf_EventGiveRandAward(tAward_QuyTy, 100000, 1, "CANH TY BAO RUONG", "m� r��ng th�nh c�ng")
            gf_WriteLogEx("CANH TY BAO RUONG", "Tr� ti�n", 1, "��o b�ng v�ng")
        end
    else
        return 0
    end
    VNG_SetTaskPos(TSK_DaoRuongCanhTy, 0, 5, 5)
    gf_WriteLogEx("CANH TY BAO RUONG BK", "Tr�", 1, "�� tr�")
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
        { 300, "V�n Nh�n", 0, 0, 14 },
        { 700, "M�n Thi�n Hoa V�", 0, 1, 53 },
        { 700, "H�a Tinh", 0, 2, 36 },
        { 800, "C� ��nh", 0, 3, 64 },
        { 700, "Th�n Cung", 0, 4, 119 },
        { 700, "Li�t Di�m", 0, 5, 40 },
        { 1000, "��i H�o L�i Th��ng", 0, 6, 108 },
        { 700, "L�ng Phong", 0, 7, 12 },
        { 700, "A La H�n Tr��ng", 0, 8, 97 },
        { 700, "Th�n H�nh", 0, 9, 86 },
        { 700, "Hi Nh�n C�m", 0, 10, 75 },
        { 700, "M�nh H�", 0, 11, 12 },
        { 900, "Minh B�ng", 0, 12, 12 },
        { 700, "Ng�c Doanh", 0, 13, 12 },
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
        Msg2Player("B�n m� B�o r��ng, nh�n ���c: " .. prize_name .. "!")
        gf_WriteLogEx("CANH TY BAO RUONG BK", "M� r��ng th�nh c�ng", 1, prize_name)
    else
        gf_WriteLogEx("CANH TY BAO RUONG BK", "M� r��ng th�t b�i", 1, prize_name)
    end
    --	Msg2Player("V� kh� c�p 7")
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
        { 700, "Th�n Quy", 0, 0, 15 },
        { 700, "Khoa Ph�", 0, 1, 54 },
        { 700, "H�a �nh", 0, 2, 37 },
        { 800, "L�u C�nh", 0, 3, 65 },
        { 700, "Vi�n ��", 0, 4, 120 },
        { 700, "Ng�c Tr�", 0, 5, 41 },
        { 800, "C�u Long To�n K�ch", 0, 6, 109 },
        { 700, "B�ch Th�y", 0, 7, 13 },
        { 700, "M�c Ki�n Li�n Tr��ng", 0, 8, 98 },
        { 700, "Toan D�", 0, 9, 87 },
        { 700, "��i Th�nh Di �m", 0, 10, 76 },
        { 700, "V� Ng�n", 0, 11, 13 },
        { 700, "X�ch Ti�u", 0, 12, 13 },
        { 700, "Di T�m", 0, 13, 13 },
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
        Msg2Player("B�n m� B�o r��ng, nh�n ���c: " .. prize_name .. "!")
        gf_WriteLogEx("CANH TY BAO RUONG BK", "M� r��ng th�nh c�ng", 1, prize_name)
    else
        gf_WriteLogEx("CANH TY BAO RUONG BK", "M� r��ng th�t b�i", 1, prize_name)
    end
    --	Msg2Player("V� kh� c�p 8")
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
        { 700, "�m D��ng �n", 0, 0, 16 },
        { 700, "Kh�ng C�", 0, 1, 55 },
        { 700, "Nha C�u", 0, 2, 38 },
        { 800, "Ngh�ch L�n", 0, 3, 66 },
        { 700, "B�t X� Chi X�", 0, 4, 121 },
        { 700, "Th�n Ch�m", 0, 5, 42 },
        { 800, "Th��ng N�", 0, 6, 110 },
        { 700, "Thi�n T�n", 0, 7, 14 },
        { 700, "D��c S� Tr��ng", 0, 8, 99 },
        { 700, "Th�i H�", 0, 9, 88 },
        { 700, "Kh� M�c Long Ng�m", 0, 10, 77 },
        { 700, "Thanh Long", 0, 11, 14 },
        { 700, "U�n H��ng", 0, 12, 14 },
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
        Msg2Player("B�n m� B�o r��ng, nh�n ���c: " .. prize_name .. "!")
        gf_WriteLogEx("CANH TY BAO RUONG BK", "M� r��ng th�nh c�ng", 1, prize_name)
    else
        gf_WriteLogEx("CANH TY BAO RUONG BK", "M� r��ng th�t b�i", 1, prize_name)
    end
    --	Msg2Player("V� kh� c�p 9")
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
-- M�t t�ch cao c�p
VET_2012_GAOJIMIJI = {
    [2] = { "Kim Cang B�t Nh� Ch�n Quy�n ", { 0, 107, 204, 1 } },
    [4] = { "Ti�m Long T�c Di�t Ch�n Quy�n", { 0, 107, 205, 1 } },
    [3] = { "V� Tr�n B� �� Ch�n Quy�n", { 0, 107, 206, 1 } },
    [6] = { "Thi�n La Li�n Ch�u Ch�n Quy�n", { 0, 107, 207, 1 } },
    [8] = { "Nh� � Kim ��nh Ch�n Quy�n", { 0, 107, 208, 1 } },
    [9] = { "B�ch H�i Tuy�t �m Ch�n Quy�n", { 0, 107, 209, 1 } },
    [11] = { "H�n ��n Tr�n Nh�c Ch�n Quy�n", { 0, 107, 210, 1 } },
    [12] = { "Qu� Thi�n Du Long Ch�n Quy�n", { 0, 107, 211, 1 } },
    [14] = { "Huy�n �nh M� T�ng Ch�n Quy�n", { 0, 107, 212, 1 } },
    [15] = { "Qu�n T� ��i Phong Ch�n Quy�n", { 0, 107, 213, 1 } },
    [17] = { "Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n", { 0, 107, 214, 1 } },
    [18] = { "Xuy�n V�n L�c H�ng Ch�n Quy�n", { 0, 107, 215, 1 } },
    [20] = { "Huy�n Minh Phong Ma Ch�n Quy�n", { 0, 107, 216, 1 } },
    [21] = { "Linh C� Huy�n T� Ch�n Quy�n", { 0, 107, 217, 1 } },
    [23] = { "C�u Thi�n Phong L�i Ch�n Quy�n", { 0, 107, 218, 1 } },
    [25] = { "C�u Thi�n Phong L�i Ch�n Quy�n", { 0, 107, 219, 1 } },
    [26] = { "C�u Thi�n Phong L�i Ch�n Quy�n", { 0, 107, 220, 1 } },
    [27] = { "C�u Thi�n Phong L�i Ch�n Quy�n", { 0, 107, 221, 1 } },
    [29] = { "H�ng Tr�n T�y M�ng Ch�n Quy�n", { 0, 107, 222, 1 } },
    [30] = { "Phong Hoa Thi�n Di�p Ch�n Quy�n", { 0, 107, 223, 1 } },
}

function give70GaojiMiji()
    local nRoute = GetPlayerRoute()
    gf_AddItemEx2(VET_2012_GAOJIMIJI[nRoute][2], VET_2012_GAOJIMIJI[nRoute][1], "CANH TY BAO RUONG BK", "nh�n ���c")
    --gf_EventGiveRandAward(VET_2012_GAOJIMIJI,10000,1)
end
VET_2013_FRUIT = {
    [1] = { 1, 5, "Nh�n", { 2, 1, 30164, 1 }, 0 },
    [2] = { 1, 5, "Ch�m Ch�m", { 2, 1, 30165, 1 }, 0 },
    [3] = { 1, 5, "Cam", { 2, 1, 30165, 1 }, 0 },
    [4] = { 1, 5, "D�a", { 2, 1, 30167, 1 }, 0 },
    [5] = { 1, 5, "M�ng C�t", { 2, 1, 30168, 1 }, 0 },
    [6] = { 1, 5, "M�ng c�u", { 2, 1, 30179, 1 }, 0 },
    [7] = { 1, 5, "Kh�m", { 2, 1, 30180, 1 }, 0 },
    [8] = { 1, 5, "L�", { 2, 1, 30181, 1 }, 0 },
    [9] = { 1, 5, "B�n Bon", { 2, 1, 30182, 1 }, 0 },
    [10] = { 1, 5, "Kh�", { 2, 1, 30183, 1 }, 0 },
    [11] = { 1, 5, "B��i", { 2, 1, 30169, 1 }, 0 },
    [12] = { 1, 5, "D�u", { 2, 1, 30170, 1 }, 0 },
    [13] = { 1, 5, "Chu�i", { 2, 1, 30171, 1 }, 0 },
    [14] = { 1, 5, "Xo�i", { 2, 1, 30172, 1 }, 0 },
    [15] = { 1, 5, "��o", { 2, 1, 30173, 1 }, 0 },
    [16] = { 1, 5, "M�n", { 2, 1, 30174, 1 }, 0 },
    [17] = { 1, 5, "V�i", { 2, 1, 30175, 1 }, 0 },
    [18] = { 1, 5, "T�o", { 2, 1, 30176, 1 }, 0 },
    [19] = { 1, 5, "B�", { 2, 1, 30177, 1 }, 0 },
    [20] = { 1, 5, "�u ��", { 2, 1, 30178, 1 }, 0 },
}
function give_fruit1()
    local nIndex = random(1, 20)
    local nG = VET_2013_FRUIT[nIndex][4][1]
    local nD = VET_2013_FRUIT[nIndex][4][2]
    local nP = VET_2013_FRUIT[nIndex][4][3]
    gf_AddItemEx2({ nG, nD, nP, 39 }, VET_2013_FRUIT[nIndex][3], "CANH TY BAO RUONG BK", "tr�i c�y")
end
function give_fruit2()
    local nIndex = random(1, 20)
    local nG = VET_2013_FRUIT[nIndex][4][1]
    local nD = VET_2013_FRUIT[nIndex][4][2]
    local nP = VET_2013_FRUIT[nIndex][4][3]
    gf_AddItemEx2({ nG, nD, nP, 68 }, VET_2013_FRUIT[nIndex][3], "CANH TY BAO RUONG BK", "tr�i c�y")
end
function give_fruit3()
    --	local nIndex = random(1,20)
    local nG = VET_2013_FRUIT[20][4][1]
    local nD = VET_2013_FRUIT[20][4][2]
    local nP = VET_2013_FRUIT[20][4][3]
    gf_AddItemEx2({ nG, nD, nP, 77 }, VET_2013_FRUIT[20][3], "CANH TY BAO RUONG BK", "tr�i c�y")
    Msg2Player("B�n nh�n ���c 77 �u ��")
end
function give_fruit4()
    --	local nIndex = random(1,20)
    local nG = VET_2013_FRUIT[14][4][1]
    local nD = VET_2013_FRUIT[14][4][2]
    local nP = VET_2013_FRUIT[14][4][3]
    gf_AddItemEx2({ nG, nD, nP, 77 }, VET_2013_FRUIT[14][3], "CANH TY BAO RUONG BK", "tr�i c�y")
    Msg2Player("B�n nh�n ���c 77 Xo�i")
end
function give_HHVD2()
    gf_AddItemEx2({ 0, 102, 8840, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0 }, "Huy Ho�ng Chi Th�y", "CANH TY BAO RUONG BK", "Huy Ho�ng Chi Th�y")
    gf_AddItemEx2({ 0, 102, 8841, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0 }, "Vinh D� Chi Th�y", "CANH TY BAO RUONG BK", "Vinh D� Chi Th�y")
end
function give_HHVD3()
    gf_AddItemEx2({ 0, 102, 8842, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0 }, "Huy Ho�ng Chi K�", "CANH TY BAO RUONG BK", "Huy Ho�ng Chi K�")
    gf_AddItemEx2({ 0, 102, 8843, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0 }, "Vinh D� Chi K�", "CANH TY BAO RUONG BK", "Vinh D� Chi K�")
end
function give_HHVD4()
    gf_AddItemEx2({ 0, 102, 8844, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0 }, "Huy Ho�ng Qu�t Kh�i", "CANH TY BAO RUONG BK", "Huy Ho�ng Qu�t Kh�i")
    gf_AddItemEx2({ 0, 102, 8845, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0 }, "Vinh D� Qu�t Kh�i", "CANH TY BAO RUONG BK", "Vinh D� Qu�t Kh�i")
    Msg2Player("B�n nh�n ���c v�t ph�m Huy Ho�ng Vinh D� Qu�t Kh�i")
end
function give_HHVD5()
    gf_AddItemEx2({ 0, 102, 8846, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0 }, "Huy Ho�ng", "CANH TY BAO RUONG BK", "Huy Ho�ng")
    gf_AddItemEx2({ 0, 102, 8847, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0 }, "Vinh D�", "CANH TY BAO RUONG BK", "Vinh D�")
    Msg2Player("B�n nh�n ���c v�t ph�m Huy Ho�ng Vinh D�")
end

function giapngo()
    local szNpcName = "<color=green>B�c ��u L�o Nh�n<color>: "
    local tSay = {}
    local tHeader = szNpcName .. "Nh�n th��ng xong 3 lo�i (Tuy�t �nh B� B�o, Chi�u D� Ph�p B�o, X�ch Th� C� V�t) s� ���c nh�n ph�n th��ng h�p d�n M� ��o Th�nh C�ng"

    tinsert(tSay, "Nh�n th��ng Tuy�t �nh B� B�o (k�ch ho�t r��ng Tuy�t �nh th�nh c�ng 1000 l�n)/#get_MaDaoThanhCong(1)")
    tinsert(tSay, "Nh�n th��ng Chi�u D� Ph�p B�o (k�ch ho�t r��ng Chi�u D� th�nh c�ng 1000 l�n)/#get_MaDaoThanhCong(2)")
    tinsert(tSay, "Nh�n th��ng X�ch Th� C� V�t (k�ch ho�t r��ng X�ch Th� th�nh c�ng 1000 l�n)/#get_MaDaoThanhCong(3)")
    tinsert(tSay, "Nh�n th��ng M� ��o Th�nh C�ng (�� nh�n th��ng th�nh c�ng 3 lo�i r��ng)/#get_MaDaoThanhCong(4)")
    tinsert(tSay, "Ta ch�a mu�n nh�n th��ng/dialog_over")
    Say(tHeader, getn(tSay), tSay)
end

function get_MaDaoThanhCong(nType)
    if gf_Judge_Room_Weight(5, 500) ~= 1 then
        Talk(1, "", "H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.");
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
        --check �k lo�i 4
        nCheck = VNG_GetTaskPos(TSK_GIAPNGO_2, 6, 6)
        local nCheck1 = VNG_GetTaskPos(TSK_GIAPNGO_1, 5, 5)
        local nCheck2 = VNG_GetTaskPos(TSK_GIAPNGO_1, 10, 10)
        local nCheck3 = VNG_GetTaskPos(TSK_GIAPNGO_2, 5, 5)
        if nCheck >= 1 then
            Talk(1, "", "��i hi�p �� nh�n ph�n th��ng n�y r�i. Ph�n th��ng ch� nh�n ���c 1 l�n duy nh�t !!!!")
            return 0
        end
        if nCheck1 < 1 or nCheck2 < 1 or nCheck3 < 1 then
            Talk(1, "", "��i hi�p ch�a nh�n th��ng h�t 3 lo�i B�o R��ng � tr�n !!!!")
            return 0
        end
    end
    --check �k lo�i 1, 2, 3
    if nType == 1 or nType == 2 or nType == 3 then
        if nCheck >= 1 then
            Talk(1, "", "��i hi�p �� nh�n ph�n th��ng n�y r�i. Ph�n th��ng ch� nh�n ���c 1 l�n duy nh�t !!!!")
            return 0
        end
        if nCount < 1000 then
            Talk(1, "", "��i hi�p ch�a k�ch ho�t �� 1000 B�o R��ng !!!!")
            return 0
        end
    end
    --ph�t th��ng
    if nType == 1 then
        VNG_SetTaskPos(TSK_GIAPNGO_1, 1, 5, 5)
        ModifyExp(1000000000)
        give_weapon7()
        Msg2Player("Ph�t th��ng Tuy�t �nh B� B�o th�nh c�ng")
        gf_WriteLogEx("CANH TY BAO RUONG BK", "nh�n", 1, "Nh�n th��ng cu�i Tuy�t �nh B� B�o")
    elseif nType == 2 then
        VNG_SetTaskPos(TSK_GIAPNGO_1, 1, 10, 10)
        ModifyExp(2000000000)
        MatTichMonPhai20_Random()
        Msg2Player("Ph�t th��ng Chi�u D� Ph�p B�o th�nh c�ng")
        gf_WriteLogEx("CANH TY BAO RUONG BK", "nh�n", 1, "Nh�n th��ng cu�i Chi�u D� Ph�p B�o")
    elseif nType == 3 then
        VNG_SetTaskPos(TSK_GIAPNGO_2, 1, 5, 5)
        ModifyExp(2000000000)
        give_weapon8()
        Msg2Player("Ph�t th��ng X�ch Th� C� V�t th�nh c�ng")
        gf_WriteLogEx("CANH TY BAO RUONG BK", "nh�n", 1, "Nh�n th��ng cu�i X�ch Th� C� V�t")
    elseif nType == 4 then
        VNG_SetTaskPos(TSK_GIAPNGO_2, 1, 6, 6)
        ModifyExp(2000000000)
        give_HHVD5()
        MatTichMonPhai20_HePhai()
        Msg2Player("Ph�t th��ng M� ��o Th�nh C�ng th�nh c�ng")
        gf_WriteLogEx("CANH TY BAO RUONG BK", "nh�n", 1, "Nh�n th��ng cu�i M� ��o Th�nh C�ng")
    end
end
VET_BOOK_PET1 = {
    { 1, 699, "Ch�n kh� h� th� C�p 1", { 2, 150, 1, 1 }, 0 },
    { 1, 699, "�ch Th� Di�n D��ng C�p 1", { 2, 150, 5, 1 }, 0 },
    { 1, 699, "C��ng Th�n B� Th� C�p 1", { 2, 150, 9, 1 }, 0 },
    { 1, 699, "�m Phong Th�c C�t C�p 1", { 2, 150, 13, 1 }, 0 },
    { 1, 456, "Huy�n V� V� Song C�p 1", { 2, 150, 17, 1 }, 0 },
    { 1, 699, "V� H�nh V� T��ng C�p 1", { 2, 150, 21, 1 }, 0 },
    { 1, 699, "Kim Linh Ph� Th� C�p 1", { 2, 150, 25, 1 }, 0 },
    { 1, 699, "M�c Linh Ph� Th� C�p 1", { 2, 150, 29, 1 }, 0 },
    { 1, 699, "Th�y Linh Ph� Th� C�p 1", { 2, 150, 33, 1 }, 0 },
    { 1, 699, "H�a Linh Ph� Th� C�p 1", { 2, 150, 37, 1 }, 0 },
    { 1, 699, "Th� Linh Ph� Th� C�p 1", { 2, 150, 41, 1 }, 0 },
    { 1, 699, "Ph� Kh�ng Tr�m �nh C�p 1", { 2, 150, 45, 1 }, 0 },
    { 1, 699, "S�t th��ng gia n�ng C�p 1", { 2, 150, 49, 1 }, 0 },
    { 1, 456, "Khinh Linh T�n T�t C�p 1", { 2, 150, 53, 1 }, 0 },
    { 1, 700, "V� H�nh Chi C� C�p 1", { 2, 150, 57, 1 }, 0 },
}

VET_BOOK_PET2 = {
    { 1, 699, "Ch�n kh� h� th� C�p 2", { 2, 150, 2, 1 }, 0 },
    { 1, 699, "�ch Th� Di�n D��ng C�p 2", { 2, 150, 6, 1 }, 0 },
    { 1, 699, "C��ng Th�n B� Th� C�p 2", { 2, 150, 10, 1 }, 0 },
    { 1, 699, "�m Phong Th�c C�t C�p 2", { 2, 150, 14, 1 }, 0 },
    { 1, 456, "Huy�n V� V� Song C�p 2", { 2, 150, 18, 1 }, 0 },
    { 1, 699, "V� H�nh V� T��ng C�p 2", { 2, 150, 22, 1 }, 0 },
    { 1, 699, "Kim Linh Ph� Th� C�p 2", { 2, 150, 26, 1 }, 0 },
    { 1, 699, "M�c Linh Ph� Th� C�p 2", { 2, 150, 30, 1 }, 0 },
    { 1, 699, "Th�y Linh Ph� Th� C�p 2", { 2, 150, 34, 1 }, 0 },
    { 1, 699, "H�a Linh Ph� Th� C�p 2", { 2, 150, 38, 1 }, 0 },
    { 1, 699, "Th� Linh Ph� Th� C�p 2", { 2, 150, 42, 1 }, 0 },
    { 1, 699, "Ph� Kh�ng Tr�m �nh C�p 2", { 2, 150, 46, 1 }, 0 },
    { 1, 699, "S�t th��ng gia n�ng C�p 2", { 2, 150, 50, 1 }, 0 },
    { 1, 456, "Khinh Linh T�n T�t C�p 2", { 2, 150, 54, 1 }, 0 },
    { 1, 700, "V� H�nh Chi C� C�p 2", { 2, 150, 58, 1 }, 0 },
}

VET_BOOK_PET3 = {
    { 1, 718, "Ch�n kh� h� th� C�p 3", { 2, 150, 3, 1 }, 0 },
    { 1, 718, "�ch Th� Di�n D��ng C�p 3", { 2, 150, 7, 1 }, 0 },
    { 1, 718, "C��ng Th�n B� Th� C�p 3", { 2, 150, 11, 1 }, 0 },
    { 1, 718, "�m Phong Th�c C�t C�p 3", { 2, 150, 15, 1 }, 0 },
    { 1, 333, "Huy�n V� V� Song C�p 3", { 2, 150, 19, 1 }, 0 },
    { 1, 718, "V� H�nh V� T��ng C�p 3", { 2, 150, 23, 1 }, 0 },
    { 1, 718, "Kim Linh Ph� Th� C�p 3", { 2, 150, 27, 1 }, 0 },
    { 1, 718, "M�c Linh Ph� Th� C�p 3", { 2, 150, 31, 1 }, 0 },
    { 1, 718, "Th�y Linh Ph� Th� C�p 3", { 2, 150, 35, 1 }, 0 },
    { 1, 718, "H�a Linh Ph� Th� C�p 3", { 2, 150, 39, 1 }, 0 },
    { 1, 718, "Th� Linh Ph� Th� C�p 3", { 2, 150, 43, 1 }, 0 },
    { 1, 718, "Ph� Kh�ng Tr�m �nh C�p 3", { 2, 150, 47, 1 }, 0 },
    { 1, 718, "S�t th��ng gia n�ng C�p 3", { 2, 150, 51, 1 }, 0 },
    { 1, 333, "Khinh Linh T�n T�t C�p 3", { 2, 150, 55, 1 }, 0 },
    { 1, 718, "V� H�nh Chi C� C�p 3", { 2, 150, 59, 1 }, 0 },
}
VET_BOOK_PET4 = {
    { 1, 718, "Ch�n kh� h� th� C�p 4", { 2, 150, 4, 1 }, 0 },
    { 1, 718, "�ch Th� Di�n D��ng C�p 4", { 2, 150, 8, 1 }, 0 },
    { 1, 718, "C��ng Th�n B� Th� C�p 4", { 2, 150, 12, 1 }, 0 },
    { 1, 718, "�m Phong Th�c C�t C�p 4", { 2, 150, 16, 1 }, 0 },
    { 1, 333, "Huy�n V� V� Song C�p 4", { 2, 150, 20, 1 }, 0 },
    { 1, 718, "V� H�nh V� T��ng C�p 4", { 2, 150, 24, 1 }, 0 },
    { 1, 718, "Kim Linh Ph� Th� C�p 4", { 2, 150, 28, 1 }, 0 },
    { 1, 718, "M�c Linh Ph� Th� C�p 4", { 2, 150, 32, 1 }, 0 },
    { 1, 718, "Thu� Linh Ph� Th� C�p 4", { 2, 150, 36, 1 }, 0 },
    { 1, 718, "Ho� Linh Ph� Th� C�p 4", { 2, 150, 40, 1 }, 0 },
    { 1, 718, "Th� Linh Ph� Th� C�p 4", { 2, 150, 44, 1 }, 0 },
    { 1, 718, "Ph� Kh�ng Tr�m �nh C�p 4", { 2, 150, 48, 1 }, 0 },
    { 1, 718, "S�t th��ng gia n�ng c�p 4", { 2, 150, 52, 1 }, 0 },
    { 1, 333, "Khinh Linh T�n T�t  C�p 4", { 2, 150, 56, 1 }, 0 },
    { 1, 718, "V� H�nh Chi C� C�p 4", { 2, 150, 60, 1 }, 0 },
}
function Book_Pet1(nNum)
    for i = 1, nNum do
        gf_EventGiveRandAward(VET_BOOK_PET1, 10000, "", "CANH TY BAO RUONG BK", "S�ch PET 1")
        Msg2Player("B�n nh�n ���c 1 s�ch PET c�p 1")
    end
end

function Book_Pet2(nNum)
    for i = 1, nNum do
        gf_EventGiveRandAward(VET_BOOK_PET2, 10000, "", "CANH TY BAO RUONG BK", "S�ch PET 2")
        Msg2Player("B�n nh�n ���c 1 s�ch PET c�p 2")
    end
end

function Book_Pet3(nNum)
    for i = 1, nNum do
        gf_EventGiveRandAward(VET_BOOK_PET3, 10000, "", "CANH TY BAO RUONG BK", "S�ch PET 3")
        Msg2Player("B�n nh�n ���c 1 s�ch PET c�p 3")
    end
end

function Book_Pet4(nNum)
    for i = 1, nNum do
        gf_EventGiveRandAward(VET_BOOK_PET4, 10000, "", "CANH TY BAO RUONG BK", "S�ch PET 4")
        Msg2Player("B�n nh�n ���c 1 s�ch PET c�p 4")
    end
end

tbKimXa3sao = {
    [1] = { item = { { gdp = { 0, 152, 3, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "�o Cho�ng H�a V�n" } } },
    [2] = { item = { { gdp = { 0, 152, 4, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "�o Cho�ng Kim Ch� ng� h�nh" } } },
    [3] = { item = { { gdp = { 0, 152, 5, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "�o Cho�ng M�c Ch� ng� h�nh" } } },
    [4] = { item = { { gdp = { 0, 152, 6, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "�o Cho�ng Th�y Ch� ng� h�nh" } } },
    [5] = { item = { { gdp = { 0, 152, 7, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "�o Cho�ng H�a Ch� ng� h�nh" } } },
    [6] = { item = { { gdp = { 0, 152, 8, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "�o Cho�ng Th� Ch� ng� h�nh" } } },
    [7] = { item = { { gdp = { 0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "�o Cho�ng �m Ch� ng� h�nh" } } },
    [8] = { item = { { gdp = { 0, 153, 3, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Huy Ch��ng Ng�c Ch�" } } },
    [9] = { item = { { gdp = { 0, 153, 4, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Huy Ch��ng Kim Ch� ng� h�nh" } } },
    [10] = { item = { { gdp = { 0, 153, 5, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Huy Ch��ng M�c Ch� ng� h�nh" } } },
    [11] = { item = { { gdp = { 0, 153, 6, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Huy Ch��ng Th�y Ch� ng� h�nh" } } },
    [12] = { item = { { gdp = { 0, 153, 7, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Huy Ch��ng H�a Ch� ng� h�nh" } } },
    [13] = { item = { { gdp = { 0, 153, 8, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Huy Ch��ng Th� Ch� ng� h�nh" } } },
    [14] = { item = { { gdp = { 0, 153, 9, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Huy Ch��ng �m Ch� ng� h�nh" } } },
    [15] = { item = { { gdp = { 0, 154, 3, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "B� Ch� Cao ��ng Ngoa" } } },
    [16] = { item = { { gdp = { 0, 154, 4, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Chi�n H�i Kim Ch� ng� h�nh" } } },
    [17] = { item = { { gdp = { 0, 154, 5, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Chi�n H�i M�c Ch� ng� h�nh" } } },
    [18] = { item = { { gdp = { 0, 154, 6, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Chi�n H�i Th�y Ch� ng� h�nh" } } },
    [19] = { item = { { gdp = { 0, 154, 7, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Chi�n H�i H�a Ch� ng� h�nh" } } },
    [20] = { item = { { gdp = { 0, 154, 8, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Chi�n H�i Th� Ch� ng� h�nh" } } },
    [21] = { item = { { gdp = { 0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, -1 }, name = "Chi�n H�i �m Ch� ng� h�nh" } } },
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
        Msg2Player("B�n nh�n ���c trang b� Kim X� !!!!")
    end
    gf_WriteLogEx("CANH TY BAO RUONG BK", "nh�n", 1, "trang b� Kim X�")
end
tbMatTich_GN = {
    [2] = { 0, 107, 204, 2, "Kim Cang B�t Nh� Ch�n Quy�n" },
    [4] = { 0, 107, 205, 1, "Ti�m Long T�c Di�t Ch�n Quy�n" },
    [3] = { 0, 107, 206, 1, "V� Tr�n B� �� Ch�n Quy�n" },
    [6] = { 0, 107, 207, 2, "Thi�n La Li�n Ch�u Ch�n Quy�n" },
    [8] = { 0, 107, 208, 1, "Nh� � Kim ��nh Ch�n Quy�n" },
    [9] = { 0, 107, 209, 1, "B�ch H�i Tuy�t �m Ch�n Quy�n" },
    [11] = { 0, 107, 210, 2, "H�n ��n Tr�n Nh�c Ch�n Quy�n" },
    [12] = { 0, 107, 211, 2, "Qu� Thi�n Du Long Ch�n Quy�n" },
    [14] = { 0, 107, 212, 1, "Huy�n �nh M� T�ng Ch�n Quy�n" },
    [15] = { 0, 107, 213, 2, "Qu�n T� ��i Phong Ch�n Quy�n" },
    [17] = { 0, 107, 214, 2, "Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n" },
    [18] = { 0, 107, 215, 2, "Xuy�n V�n L�c H�ng Ch�n Quy�n" },
    [20] = { 0, 107, 216, 2, "Huy�n Minh Phong Ma Ch�n Quy�n" },
    [21] = { 0, 107, 217, 1, "Linh C� Huy�n T� Ch�n Quy�n" },
    [23] = { 0, 107, 218, 1, "C�u Thi�n Phong L�i Ch�n Quy�n" },
    [25] = { 0, 107, 219, 1, "C�u Thi�n Phong L�i Ch�n Quy�n" },
    [26] = { 0, 107, 220, 1, "C�u Thi�n Phong L�i Ch�n Quy�n" },
    [27] = { 0, 107, 221, 1, "C�u Thi�n Phong L�i Ch�n Quy�n" },
    [29] = { 0, 107, 222, 2, "H�ng Tr�n T�y M�ng Ch�n Quy�n" },
    [30] = { 0, 107, 223, 2, "Phong Hoa Thi�n Di�p Ch�n Quy�n" },
}
function MatTichMonPhai20_HePhai()
    local nRoute = GetPlayerRoute()
    local _, nItemID = AddItem(tbMatTich_GN[nRoute][1], tbMatTich_GN[nRoute][2], tbMatTich_GN[nRoute][3], 1)
    if tbMatTich_GN[nRoute][4] == 1 then
        SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
    else
        SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
    end
    gf_WriteLogEx("CANH TY BAO RUONG BK", "nh�n", 1, "M�t t�ch si�u c�p")
    Msg2Player("B�n nh�n ���c 1 m�t t�ch si�u c�p")
end
tbMatTich_random_GN = {
    [0] = { 0, 107, 204, 2, "Kim Cang B�t Nh� Ch�n Quy�n" },
    [1] = { 0, 107, 205, 1, "Ti�m Long T�c Di�t Ch�n Quy�n" },
    [2] = { 0, 107, 206, 1, "V� Tr�n B� �� Ch�n Quy�n" },
    [3] = { 0, 107, 207, 2, "Thi�n La Li�n Ch�u Ch�n Quy�n" },
    [4] = { 0, 107, 208, 1, "Nh� � Kim ��nh Ch�n Quy�n" },
    [5] = { 0, 107, 209, 1, "B�ch H�i Tuy�t �m Ch�n Quy�n" },
    [6] = { 0, 107, 210, 2, "H�n ��n Tr�n Nh�c Ch�n Quy�n" },
    [7] = { 0, 107, 211, 2, "Qu� Thi�n Du Long Ch�n Quy�n" },
    [8] = { 0, 107, 212, 1, "Huy�n �nh M� T�ng Ch�n Quy�n" },
    [9] = { 0, 107, 213, 2, "Qu�n T� ��i Phong Ch�n Quy�n" },
    [10] = { 0, 107, 214, 2, "Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n" },
    [11] = { 0, 107, 215, 2, "Xuy�n V�n L�c H�ng Ch�n Quy�n" },
    [12] = { 0, 107, 216, 2, "Huy�n Minh Phong Ma Ch�n Quy�n" },
    [13] = { 0, 107, 217, 1, "Linh C� Huy�n T� Ch�n Quy�n" },
    [14] = { 0, 107, 218, 1, "C�u Thi�n Phong L�i Ch�n Quy�n" },
    [15] = { 0, 107, 222, 2, "H�ng Tr�n T�y M�ng Ch�n Quy�n" },
    [16] = { 0, 107, 223, 2, "Phong Hoa Thi�n Di�p Ch�n Quy�n" },
    [17] = { 0, 107, 231, 2, "H�ng Tr�n T�y M�ng Ch�n Quy�n" },
    [18] = { 0, 107, 235, 2, "Phong Hoa Thi�n Di�p Ch�n Quy�n" },
}
function MatTichMonPhai20_Random()
    local nAwardRand = mod(random(1, 1000), 19)
    local _, nItemID = AddItem(tbMatTich_random_GN[nAwardRand][1], tbMatTich_random_GN[nAwardRand][2], tbMatTich_random_GN[nAwardRand][3], 1)
    if tbMatTich_random_GN[nAwardRand][4] == 1 then
        SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
    else
        SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
    end
    gf_WriteLogEx("CANH TY BAO RUONG BK", "nh�n", 1, "M�t t�ch si�u c�p")
    Msg2Player("B�n nh�n ���c 1 m�t t�ch si�u c�p")
end
function give_sachPet6()
    local tPet_BookLev6 = {
        { 1, 5400, "Ch�n kh� h� th�", { 2, 150, 87, 1 }, 0 },
        { 1, 6400, "�ch th� di�n th��ng", { 2, 150, 88, 1 }, 0 },
        { 1, 6400, "C��ng th�n b� th�", { 2, 150, 89, 1 }, 0 },
        { 1, 6400, "�m phong th�c c�t", { 2, 150, 90, 1 }, 0 },
        { 1, 6000, "Huy�n v� v� song", { 2, 150, 91, 1 }, 0 },
        { 1, 6000, "V� h�nh v� t��ng", { 2, 150, 92, 1 }, 0 },
        { 1, 5000, "Kim linh ph� th�", { 2, 150, 93, 1 }, 0 },
        { 1, 5000, "M�c linh ph� th�", { 2, 150, 94, 1 }, 0 },
        { 1, 5000, "Th�y linh ph� th�", { 2, 150, 95, 1 }, 0 },
        { 1, 5000, "H�a linh ph� th�", { 2, 150, 96, 1 }, 0 },
        { 1, 5000, "Th� linh ph� th�", { 2, 150, 97, 1 }, 0 },
        { 1, 5000, "Ph� kh�ng tr�m �nh", { 2, 150, 98, 1 }, 0 },
        { 1, 5000, "S�t th��ng gia n�ng", { 2, 150, 99, 1 }, 0 },
        { 1, 5000, "Khinh linh t�n t�t", { 2, 150, 100, 1 }, 0 },
        { 1, 5000, "V� h�nh chi c�", { 2, 150, 101, 1 }, 0 },
        { 1, 5000, "Linh quang nh�t thi�m", { 2, 150, 102, 1 }, 0 },
        { 1, 5400, "Ng�ng th�n quy�t", { 2, 150, 103, 1 }, 0 },
        { 1, 5000, "Kinh ��o quy�t", { 2, 150, 104, 1 }, 0 },
        { 1, 1500, "Nguy�n th�y b�o n�", { 2, 150, 105, 1 }, 0 },
        { 1, 1500, "Thi�t b� sam", { 2, 150, 106, 1 }, 0 },
    }

    gf_EventGiveRandAward(tPet_BookLev6, 100000, 1, "SACH PET LEVEL 6 BK", "award ng�u nhi�n");
    gf_WriteLogEx("SACH PET LEVEL 6", "nh�n", 1, "s�ch b�h c�p 6")
end
function give_stone4()
    local tbRanStone1 = {
        { 1, 25, "Huy�t Tr�ch Th�ch C�p 4", { 2, 22, 104, 1 } },
        { 1, 25, "Nguy�t B�ch Th�ch C�p 4", { 2, 22, 204, 1 } },
        { 1, 25, "H� Ph�ch Th�ch C�p 4", { 2, 22, 304, 1 } },
        { 1, 25, "H�c Di�u Th�ch C�p 4", { 2, 22, 404, 1 } },
    }
    gf_EventGiveRandAward(tbRanStone1, 100, 1, "CANH TY BAO RUONG BK", "�� 4")
end

function give_stone5()
    local tbRanStone2 = {
        { 1, 25, "Huy�t Tr�ch Th�ch C�p 5", { 2, 22, 105, 1 } },
        { 1, 25, "Nguy�t B�chT h�ch C�p 5", { 2, 22, 205, 1 } },
        { 1, 25, "H� Ph�ch Th�ch C�p 5", { 2, 22, 305, 1 } },
        { 1, 25, "H�c Di�u Th�ch C�p 5", { 2, 22, 405, 1 } },
    }
    gf_EventGiveRandAward(tbRanStone2, 100, 1, "CANH TY BAO RUONG BK", "�� 5")
end
function give_stone6()
    local tbRanStone2 = {
        { 1, 25, "Huy�t Tr�ch Th�ch C�p 6", { 2, 22, 106, 1 } },
        { 1, 25, "Nguy�t B�chT h�ch C�p 6", { 2, 22, 206, 1 } },
        { 1, 25, "H� Ph�ch Th�ch C�p 6", { 2, 22, 306, 1 } },
        { 1, 25, "H�c Di�u Th�ch C�p 6", { 2, 22, 406, 1 } },
    }
    gf_EventGiveRandAward(tbRanStone2, 100, 1, "CANH TY BAO RUONG BK", "�� 6")
end
function give_stone3()
    local tbRanStone3 = {
        { 1, 25, "Huy�t Tr�ch Th�ch C�p 3", { 2, 22, 103, 1 } },
        { 1, 25, "Nguy�t B�ch Th�ch C�p 3", { 2, 22, 203, 1 } },
        { 1, 25, "H� Ph�ch Th�ch C�p 3", { 2, 22, 303, 1 } },
        { 1, 25, "H�c Di�u Th�ch C�p 3", { 2, 22, 403, 1 } },
    }
    gf_EventGiveRandAward(tbRanStone3, 100, 1, "CANH TY BAO RUONG BK", "�� 3")
end
function give_VanSucHoanMy2()
    local tbVanSucHM = {
        { 1, 20, "Kh�c b�n c�p 2", { 2, 1, 31073, 1 } },
        { 1, 20, "Kh�c b�n c�p 2", { 2, 1, 31074, 1 } },
        { 1, 20, "Kh�c b�n c�p 2", { 2, 1, 31075, 1 } },
        { 1, 20, "Kh�c b�n c�p 2", { 2, 1, 31076, 1 } },
        { 1, 20, "Kh�c b�n c�p 2", { 2, 1, 31077, 1 } },
    }
    gf_EventGiveRandAward(tbVanSucHM, 100, 1, "CANH TY BAO RUONG BK", "Kh�c b�n 2")
end
tbKimXa4 = {
    [1] = { item = { { gdp = { 0, 153, 28, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "Huy Ch��ng V�n Du" } } },
    [2] = { item = { { gdp = { 0, 152, 28, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "�o Cho�ng V�n Du" } } },
    [3] = { item = { { gdp = { 0, 154, 28, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "��o H�i V�n Du" } } },
    [4] = { item = { { gdp = { 0, 153, 27, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "Huy Ch��ng Thi�t Huy�t" } } },
    [5] = { item = { { gdp = { 0, 152, 27, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "�o Cho�ng Thi�t Huy�t" } } },
    [6] = { item = { { gdp = { 0, 154, 27, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "��o H�i Thi�t Huy�t" } } },
    [7] = { item = { { gdp = { 0, 153, 26, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "Huy Ch��ng Du Hi�p" } } },
    [8] = { item = { { gdp = { 0, 152, 26, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "�o Cho�ng Du Hi�p" } } },
    [9] = { item = { { gdp = { 0, 154, 26, 1, 1, -1, -1, -1, -1, -1, -1, -1, nLevel }, name = "��o H�i Du Hi�p" } } },
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
    Msg2Player("B�n nh�n ���c trang b� Kim X� !!!!")
    gf_WriteLogEx("GIAP NGO BAO RUONG BK", "nh�n", 1, "trang b� Kim X� 4")
end

function dialog_over()

end
function give_vkAmHuyet()
    local tvkAmHuyet = {
        { 1, 4600, "vk �m huy�t", { 0, 3, 30884, 1 }, 0 },
        { 1, 4600, "vk �m huy�t", { 0, 8, 30885, 1 }, 0 },
        { 1, 4600, "vk �m huy�t", { 0, 0, 30886, 1 }, 0 },
        { 1, 4600, "vk �m huy�t", { 0, 1, 30887, 1 }, 0 },
        { 1, 4600, "vk �m huy�t", { 0, 2, 30888, 1 }, 0 },
        { 1, 4600, "vk �m huy�t", { 0, 10, 30889, 1 }, 0 },
        { 1, 4600, "vk �m huy�t", { 0, 0, 30890, 1 }, 0 },
        { 1, 4600, "vk �m huy�t", { 0, 5, 30891, 1 }, 0 },
        { 1, 4600, "vk �m huy�t", { 0, 2, 30892, 1 }, 0 },
        { 1, 4600, "vk �m huy�t", { 0, 9, 30893, 1 }, 0 },
        { 1, 4500, "vk �m huy�t", { 0, 6, 30894, 1 }, 0 },
        { 1, 4500, "vk �m huy�t", { 0, 4, 30895, 1 }, 0 },
        { 1, 4500, "vk �m huy�t", { 0, 7, 30896, 1 }, 0 },
        { 1, 4500, "vk �m huy�t", { 0, 11, 30897, 1 }, 0 },
        { 1, 4500, "vk �m huy�t", { 0, 2, 30898, 1 }, 0 },
        { 1, 4500, "vk �m huy�t", { 0, 3, 30899, 1 }, 0 },
        { 1, 4500, "vk �m huy�t", { 0, 9, 30900, 1 }, 0 },
        { 1, 4500, "vk �m huy�t", { 0, 11, 30901, 1 }, 0 },
        { 1, 4500, "vk �m huy�t", { 0, 13, 30902, 1 }, 0 },
        { 1, 4500, "vk �m huy�t", { 0, 12, 30903, 1 }, 0 },
        { 1, 4500, "vk �m huy�t", { 0, 14, 32164, 1 }, 0 },
        { 1, 4500, "vk �m huy�t", { 0, 2, 32192, 1 }, 0 },
    }
    gf_EventGiveRandAward(tvkAmHuyet, 100000, 1, "VK AM HUYET BK", "award ng�u nhi�n");
end
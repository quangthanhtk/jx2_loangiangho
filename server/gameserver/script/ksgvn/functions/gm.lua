Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\functions\\guild_functions.lua")
Include("\\script\\ksgvn\\functions\\meridian_functions.lua")
Include("\\script\\ksgvn\\functions\\book_functions.lua")
Include("\\script\\ksgvn\\functions\\battle_functions.lua")
Include("\\script\\ksgvn\\functions\\pet_functions.lua")
Include("\\script\\ksgvn\\functions\\faction_support_functions.lua")
Include("\\script\\ksgvn\\functions\\weapon_effect_functions.lua")
Include("\\script\\ksgvn\\functions\\fair_functions.lua")
Include("\\script\\ksgvn\\functions\\phutu_functions.lua")

function kgm_ShowMenuEquip()
    local tSay = {
        "Ch�n lo�i trang b� mu�n nh�n:",
        "Trang b� ch�nh/kgm_ShowMenuNewItem",
        "Trang b� n�ng c�p/kgm_ShowMenuUpgradableItem",
        "Trang b� chi�n tr��ng/kgm_ShowMenuBattleItem",
        "Trang b� Kim X�/kgm_ShowMenuKimXaItem",
        "Trang b� V�n S�c/kgm_ShowMenuVanSucItem",
        "Trang b� gi�i ��u/kgm_ShowMenuVipItem",
    }
    --if KsgPlayer:IsGM() then
    --    local tSayGM = {
    --        "Trang b� gi�i ��u/kgm_ShowMenuVipItem",
    --    }
    --    tSay = gf_MergeTable(tSay, tSayGM)
    --end
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuHorse()
    local tSay = { "Ch�n m�t lo�i th� c��i y�u th�ch:" }
    for i = 30100, 30203 do
        tinsert(tSay, format("Ta mu�n nh�n %s/#kgm_AddHorse(%d)", KsgItem:GetName(0, 105, i), i))
    end
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:PageSay(tSay, 2, 10)
end

function kgm_ShowMenuSupport()
    local tSay = {
        "Ch�n h� tr�:",
        "Thay ��i qu�n h�m/battle_ChangeTitle",
        "Nh�n 100 t� kinh nghi�m/#KsgPlayer:BigAddExp(100e9)",
        "Nh�n 100.000 v�ng/#KsgPlayer:AddGold(100000)",
        "Nh�n 100.000 t�ch l�y/#WPlayer:ModifyBattlePoint(100000)",
        "Nh�n nguy�n li�u c��ng h�a v� ma �ao th�ch/kgm_AddNLCuongHoa",
        "Nh�n �� qu�/kgm_AddGem",
        "\nNh�n nguy�n li�u nu�i Kim X�/kgm_AddKimXaFeed",
        "Nh�n �� t�y thu�c t�nh Kim X�/kgm_AddKimXaGem",
        "Nh�n �� kh�a thu�c t�nh Kim X�/kgm_AddLockKimXaGem",
        "\nNh�n H�i Ti�n ��n v� Linh Ph�ch ��n/kgm_AddLinhDon",
        "\nNh�n Tinh H�n v� Nguy�t Ph�ch/#kgm_AddLinhDon(1)"
    }
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuPet()
    local tSay = {
        "Thao t�c th� nu�i/��ng h�nh",
        "Nh�n �i�m linh l�c/pet_AddLinhLuc",
        "H�c Gi�ng Linh Thu�t/#pet_Active(8)",
    }
    for i = 1, 8 do
        tinsert(tSay, "\n")
        tinsert(tSay, format("Nh�n Pet c�p %d/#pet_AddRandom(%d)", i, i))
        tinsert(tSay, format("Nh�n s�ch k� n�ng c�p %d\n/#pet_AddBookByNum(%d, 10)", i, i))
    end
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_AddGem()
    local nMax = 8
    if not KsgLib:HasEnoughBagRoom(nMax * 4) then
        return
    end
    for i = 1, nMax do
        KsgAward:ReceiveGem(i, 100)
    end
end

function kgm_AddHorse(nId)
    if not KsgLib:HasEnoughBagRoom(1) then
        return
    end
    local tbAward = {
        { tbProp = { 0, 105, nId }, nStatus = 4 },
    }
    KsgAward:Give(tbAward, 'Nh�n Th� c��i')
end

function kgm_AddKimXaFeed()
    if not KsgLib:HasEnoughBagRoom(2) then
        return
    end
    local tbAward = {
        { tbProp = { 2, 1, 30612 }, nStack = 500 },
    }
    KsgAward:Give(tbAward, 'Nh�n Thi�t Tinh 4')
end

function kgm_AddKimXaGem()
    if not KsgLib:HasEnoughBagRoom(15) then
        return
    end
    local tbAward = {}
    for i = 1, 12 do
        tinsert(tbAward, { tbProp = { 2, 1, 30520 + i }, nStack = 100 }) -- T�y t�m luy�n l� th�ch
    end
    tinsert(tbAward, { tbProp = { 2, 1, 31401 }, nStack = 50 }) -- T�y t�m luy�n l� th�ch 7
    tinsert(tbAward, { tbProp = { 2, 1, 31402 }, nStack = 50 }) -- T�y t�m luy�n l� th�ch 7
    tinsert(tbAward, { tbProp = { 2, 1, 31614 }, nStack = 50 }) -- T�y t�m luy�n l� th�ch 8
    tinsert(tbAward, { tbProp = { 2, 1, 31615 }, nStack = 50 }) -- T�y t�m luy�n l� th�ch 8
    KsgAward:Give(tbAward, "Nh�n �� T�y KX")
end

function kgm_AddLockKimXaGem()
    if not KsgLib:HasEnoughBagRoom(18) then
        return
    end
    local tbAward = {}
    for i = 30904, 30909 do
        tinsert(tbAward, { tbProp = { 2, 1, i }, nStack = 100 }) -- �� kh�a kim x� 5
    end
    for i = 31249, 31254 do
        tinsert(tbAward, { tbProp = { 2, 1, i }, nStack = 100 }) -- �� kh�a kim x� 6
    end
    for i = 31391, 31396 do
        tinsert(tbAward, { tbProp = { 2, 1, i }, nStack = 50 }) -- �� kh�a kim x� 7
    end  
    for i = 31604, 31609 do
        tinsert(tbAward, { tbProp = { 2, 1, i }, nStack = 50 }) -- �� kh�a kim x� 8
    end
    KsgAward:Give(tbAward, "Nh�n �� Kh�a KX")
end

function kgm_AddLinhDon(bNewItem)
    if not KsgLib:HasEnoughBagRoom(2, 100) then
        return
    end
    local tbAward = {
        { tbProp = { 2, 1, 30847 }, nStack = 500 },
        { tbProp = { 2, 1, 31239 }, nStack = 500 },
    }
    if bNewItem then
        tbAward = {
            { tbProp = { 2, 95, 3855 }, nStack = 500 },
            { tbProp = { 2, 102, 232 }, nStack = 500 },
        }
    end
    KsgAward:Give(tbAward, 'Nh�n Linh ��n')
end

function kgm_AddNLCuongHoa()
    if not KsgLib:HasEnoughBagRoom(10, 100) then
        return
    end
    local tbAward = {
        { tbProp = { 2, 1, 1067 } }, --  ��nh h�n th�ch c�p 7
        { tbProp = { 2, 1, 1113 } }, --  ��nh h�n th�ch c�p 10
        { tbProp = { 2, 1, 1068 } }, -- Thi�n Th�ch linh th�ch + 7
        { tbProp = { 2, 1, 1009 }, nStack = 100 }, -- Thi�n th�ch tinh th�ch
        { tbProp = { 2, 1, 30424 }, nStack = 50 },
        { tbProp = { 2, 1, 30425 }, nStack = 50 },
        { tbProp = { 2, 1, 30426 }, nStack = 50 },
        { tbProp = { 2, 1, 30427 }, nStack = 50 },
        { tbProp = { 2, 1, 30428 }, nStack = 20 },
        { tbProp = { 2, 1, 30429 }, nStack = 20 },
        { tbProp = { 2, 1, 30430 }, nStack = 20 },
    }
    KsgAward:Give(tbAward, "Nh�n NL C��ng H�a")
end

function kgm_ShowMenuHorseAndCoat()
    EarnCollectionCoin(100000)
    if BigGetItemCount(2, 1, 30494) <= 0 then
        AddItem(2, 1, 30494, 1, 4)
        KsgNpc:Talk("C�c h� nh�n ���c T� �o Thi�n Bi�n Ti�u")
    end
    if GetPlayerCollectionData(2, 1) == 0 then
        SetPlayerCollectionData(2, 1, 1)
        SetPlayerCollectionData(2, 2, 1)
        SetPlayerCollectionData(2, 3, 1)
    end
    if KsgPlayer:GetPhongHoa() < 1e6 then
        KsgPlayer:ModifyPhongHoaPoint(300000)
    end
    local tbAward = {
        { tbProp = { 2, 1, 50265 }, nStack = 10 },
        { tbProp = { 2, 1, 50266 }, nStack = 10 },
        { tbProp = { 2, 1, 50267 }, nStack = 10 },
    }
    KsgAward:Give(tbAward, "Nh�n phi�u v� v� ��i ngo�i trang")
end

function kgm_ShowMenuBook()
    local tSay = {
        "Nh�n m�t t�ch v� y�u quy�t:",
        "Nh�n m�t t�ch S� c�p/#book_AddBookByType(2,1)",
        "Nh�n m�t t�ch Trung c�p/#book_AddBookByType(2,2)",
        "Nh�n m�t t�ch Cao c�p/#book_AddBookByType(2,3)",
        "Nh�n m�t t�ch Cao c�p 15%/#book_AddBookByType(2,4)",
        "Nh�n m�t t�ch Si�u c�p/#book_AddBookByType(2,5)",
        "Nh�n m�t t�ch B� �i�n/#book_AddBookByType(2,6)",
        "Nh�n m�t t�ch Tr�n Ph�i/book_AddMasterBook",
        "Nh�n Y�u Quy�t/book_AddYeuQuyet",
        "Nh�n C� Ph�/book_AddCoPho",
        "Nh�n m�nh c� quan m�c gia/book_AddManhCoQuan",
        "\nNh�n m�t t�ch th�ng d�ng/book_ShowCommonMenu",
        "\nNh�n L�ng Ba Vi B�/book_AddLangBa",
        "Nh�n M�t T�ch Ti�u Dao/book_AddTieuDao",
        "\nNh�n �i�m luy�n v� l�ch luy�n/book_AddPopur",
        "\nLuy�n nhanh m�t t�ch/book_FastPractice",
    }
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuMeridian()
    local tSay = {
        "Thao t�c kinh m�ch:",
        "Nh�n ch�n kh�/meridian_AddChanKhi",
        "Nh�n Kinh M�ch ��ng Nh�n/#meridian_AddKinhMachDongNhan(25)",
        "Nh�n Kinh M�ch Ng�n Nh�n/#meridian_AddKinhMachNganNhan(25)",
        "T�y �i�m kinh m�ch/meridian_ResetPoint",
    }
    local nMax = 6
    for i = 1, nMax do
        if i > MeridianGetLevel() then
            tinsert(tSay, i + 1, format("Th�ng c�p c�nh gi�i %s/#meridian_LevelUp(%d)", KsgPlayer:GetMeridianName(i), i))
        else
            tinsert(tSay, i + 1, format("Th�ng c�p c�nh gi�i %s (�� k�ch ho�t)/no", KsgPlayer:GetMeridianName(i)))
        end
    end

    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuFair()
    local tSay = {
        "Thao t�c h�a c�nh:",
        --"M� h�a c�nh/#KsgPlayer:OpenFair()",
        "T�ng 1 c�p h�a c�nh/#kgm_UpFair(1)",
        "T�ng 10 c�p h�a c�nh/#kgm_UpFair(10)",
        "Th�ng c�p ��n 10 t�ng h�a c�nh/#KsgPlayer:LevelUpFair(10)",
        "Th�ng c�p ��n 25 t�ng h�a c�nh/#KsgPlayer:LevelUpFair(25)",
        "Th�ng c�p ��n 50 t�ng h�a c�nh/#KsgPlayer:LevelUpFair(50)",
        "Th�ng c�p ��n 75 t�ng h�a c�nh/#KsgPlayer:LevelUpFair(75)",
        "Th�ng c�p ��n 100 t�ng h�a c�nh/#KsgPlayer:LevelUpFair(100)",
    }
    if KsgPlayer:IsAdmin() then
        tinsert(tSay, "Th�ng c�p ��n 200 t�ng h�a c�nh/#KsgPlayer:LevelUpFair(200)")
    end
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_UpFair(nLevel)
    nLevel = nLevel or 1
    for _ = 1, nLevel do
        KsgPlayer:LevelUpFair()
    end
end

function kgm_ShowMenuUpgradableItem()
    local tSay = {
        "Ch�n lo�i trang b� mu�n nh�n:",
        "Nh�n b� Di�u D��ng /#KsgAward:SetDieuDuong(15)",
        "Nh�n b� Chi�n Cu�ng /#KsgAward:SetChienCuong(15)",
        "Nh�n b� H�o Hi�p /kgm_SetHaoHiep",
        "Nh�n b� H�o Hi�p V� H� /kgm_SetHaoHiepVoHa",
        "Nh�n b� �m Huy�t /kgm_SetAmHuyet",
        "Nh�n b� S�t Tinh /kgm_SetSatTinh",
        "Nh�n b� Ph� H�n/kgm_SetPhaHon",
    }
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuNewItem()
    local tSay = {
        "Ch�n lo�i trang b� mu�n nh�n:",
        "Nh�n b� T�ng Ki�m /kgm_SetTangKiem",
        "Nh�n b� Thi�n Chi T�ng Ki�m /kgm_SetThienChiTangKiem",
        "Nh�n b� Vi�m �� /#KsgItem:AddSuitByBody(8001, 15)",
        "Nh�n b� Thi�n Chi Vi�m ��  /#KsgItem:AddSuitByBody(8055, 15)",
        "Nh�n b� B�ch Kim Vi�m ��   /#KsgItem:AddSuitByBody(30013, 15)",
    }
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuBang()
    local tSay = {
        "Ch�n thao t�c bang h�i",
        "Ta mu�n l�p bang h�i/guild_ShowCreateDialog",
        "Ta mu�n th�ng c�p bang h�i/guild_LevelUp",
        "Nh�n danh hi�u bang h�i/guild_ShowAddTitle",
        "Nh�n t�n v�t bang h�i/guild_ShowAddGangToken",
        "Nh�n �i�m c�ng hi�n bang/guild_AddGxd",
    }
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuVipItem()
    local tSay = {
        "Ch�n lo�i trang b� mu�n nh�n:",
        "Nh�n b� V� Song Chi�n Th�n /#KsgItem:AddSuitByBody(30651, 15)",
        "Nh�n b� Thi�n H� V� Song /#KsgItem:AddSuitByBody(30207, 15)",
        "Nh�n b� V� C�c Minh Tinh/#KsgItem:AddJewelry(31130, 2)",
    }
    if KsgPlayer:IsGM() then
        local tSayGM = {
            "Nh�n b� H�c B�ch V� Song /#KsgItem:AddSuitByBody(50006, 15)",
        }
        tSay = gf_MergeTable(tSay, tSayGM)
    end
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuKimXaItem()
    local tSay = {
        "Ch�n lo�i trang b� mu�n nh�n:",
    }
    for i = 1, 8 do
        tinsert(tSay, format("Nh�n Kim X� c�p %d /#kgm_NhanKimXa(%d, 15)", i, i))
    end
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuReborn()
    local tSay = {
        "Thao t�c chuy�n sinh:",
    }
    for i = 1, MAX_REBORN_LEVEL do
        local nBigLevel = tonumber(i .. 90)
        if i > KsgPlayer:GetRebornCount() then
            tinsert(tSay, format("Th�ng c�p ��n chuy�n sinh %d/#KsgPlayer:Reborn(%d)", i, nBigLevel))
        end
    end
    tinsert(tSay, "\nNh�n �n v� ngo�i trang chuy�n sinh /#KsgReborn:ReceiveCoatAndSeal()")
    tinsert(tSay, "��i h��ng chuy�n sinh/kgm_ShowMenuChangeRebornRoute")
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuChangeRebornRoute()
    local tSay = {
        "Ch�n h��ng chuy�n sinh m�i:",
    }
    for nRoute, szRouteName in KsgPlayer:GetRebornRouteName() do
        tinsert(tSay, format("Chuy�n sinh theo h��ng %s/#KsgReborn:ChangeRoute(%d)", szRouteName, nRoute))
    end
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuPear()
    local tSay = {
        "Ch�n c�p Th��ng H�i Ch�u mu�n nh�n:",
    }
    local nMax = 7
    for i = 1, nMax do
        --tinsert(tSay, format("Nh�n 200 Th��ng H�i Ch�u c�p %d (Ch� ���c nh�n 1 l�n)/#kgm_ThuongHaiChau(%d)", i, i))
        tinsert(tSay, format("Nh�n Th��ng H�i Ch�u c�p %d/#KsgAward:ThuongHaiChau(%d, 1000)", i, i))
    end
    tinsert(tSay, "Nh�n B�t Tr�n Ch�u/kgm_AddBotTranChau")
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuVanSucItem()
    local tSay = {
        "Ch�n lo�i v�n s�c mu�n nh�n:",
    }
    for i = 1, 4 do
        tinsert(tSay, format("Nh�n V�n s�c c�p %d /#KsgAward:SetVanSuc(%d)", i, i))
    end

    tinsert(tSay, "\nNh�n nguy�n li�u c��ng h�a V�n S�c/kgm_NhanNLVanSuc")
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_ShowMenuBattleItem()
    local tSay = {
        g_szTitle .. "Nh�n trang b� Cao c�p",
        "\nNh�n b� Thi�n Chi T��ng Qu�n/#KsgItem:AddBattleSuit_ThienChi_Tuong(15)",
        "\nNh�n b� Ng� Long T��ng Qu�n/#KsgItem:AddBattleSuit_NguLong_Tuong(15)",
        "Nh�n b� Th��ng �ng T��ng Qu�n/#KsgItem:AddBattleSuit_ThuongUng_Tuong(15)",
        "Nh�n b� L�i H� T��ng Qu�n/#KsgItem:AddBattleSuit_LoiHo_Tuong(15)",
        "Nh�n b� H�a Ph�ng T��ng/#KsgItem:AddBattleSuit_HoaPhung_Tuong(15)",
        "Nh�n b� Thanh Long T��ng/#KsgItem:AddBattleSuit_ThanhLong_Tuong(15)",
        "Nh�n b� Uy H� T��ng/#KsgItem:AddBattleSuit_UyHo_Tuong(15)",
        "Nh�n b� Chu T��c T��ng/#KsgItem:AddBattleSuit_ChuTuoc_Tuong(15)",
    }
    if KsgPlayer:IsGM() then
        local tSayGM = {
            "Nh�n nguy�n li�u n�ng c�p trang b� T��ng So�i/kgm_nhanNLTuongSoai",
            "Nh�n b� Th��ng �ng Nguy�n So�i/#KsgItem:AddBattleSuit_ThuongUng_Soai(15)",
            "Nh�n b� L�i H� Nguy�n So�i/#KsgItem:AddBattleSuit_LoiHo_Soai(15)",
            "Nh�n b� H�a Ph�ng So�i/#KsgItem:AddBattleSuit_HoaPhung_Soai(15)",
            "Nh�n b� Thanh Long So�i/#KsgItem:AddBattleSuit_ThanhLong_Soai(15)",
            "Nh�n b� Uy H� So�i/#KsgItem:AddBattleSuit_UyHo_Soai(15)",
            "Nh�n b� Chu T��c So�i/#KsgItem:AddBattleSuit_ChuTuoc_Soai(15)",
        }
        tSay = gf_MergeTable(tSay, tSayGM)
    end
    tinsert(tSay, "\nR�i kh�i/no")
    KsgNpc:SayDialog(tSay)
end

function kgm_NhanKimXa(nLevel, nUpgradeLevel)
    nUpgradeLevel = nUpgradeLevel or 8
    if nLevel > 3 then
        KsgAward:AddKimXa(nLevel, nUpgradeLevel, KIMXA_TYPE_KHANGTATCA)
        KsgAward:AddKimXa(nLevel, nUpgradeLevel, KIMXA_TYPE_NOICONG)
        KsgAward:AddKimXa(nLevel, nUpgradeLevel, KIMXA_TYPE_NGOAICONG)
    else
        KsgAward:AddKimXa(nLevel, nUpgradeLevel)
    end
end

function kgm_NhanNLVanSuc()
    local tbAward = {
        { tbProp = { 2, 1, 31096 }, nStack = 100 }, -- L�u Kim
        { tbProp = { 2, 201, 13 }, nStack = 100 }, -- Thi�n V�n Th�ch
        { tbProp = { 2, 201, 14 }, nStack = 5 }, --  C� Kim Th�ch
        { tbProp = { 2, 201, 16 }, nStack = 5 }, --  �i�m Tinh Ng�c-Nh�
    }
    KsgAward:Give(tbAward, "Nh�n NL C��ng H�a V�n S�c")
end

function kgm_AddBotTranChau()
    local tbAward = {
        { tbProp = { 2, 102, 215 }, nStack = 10000 },
    }
    KsgAward:Give(tbAward, "Nh�n NL B�t Tr�n Ch�u")
end

function kgm_SetHaoHiep(nLevel)
    nLevel = nLevel or 7
    KsgItem:AddSuit(30568)
    KsgItem:AddJewelry(31126, 2, 'Nh�n Trang S�c HH')
    local nRoute = KsgPlayer:GetRoute()
    local tbNewRoute = {
        [ROUTE_DUONGMON_NHAMHIEP] = 32162,
        [ROUTE_CONLON_KIEMTON] = 32190,
    }
    if tbNewRoute[nRoute] then
        return KsgItem:AddWeaponByRoute(tbNewRoute[nRoute], 4, nLevel, 'Nh�n V� Kh� HH')
    end
    KsgItem:AddWeaponByRouteIndex(30724, 4, nLevel, 'Nh�n V� Kh� HH')
end

function kgm_ThuongHaiChau(nLevel)
    if KsgTask:GetBit(TASKID_LIMIT_SERVER_TEST, TASKID_LIMIT_SERVER_TEST_BIT_THDC) == 1 and not KsgPlayer:IsGM() then
        return KsgNpc:Talk("M�i nh�n v�t � m�y ch� th� nghi�m ch� ���c nh�n Th��ng H�i Ch�u 1 l�n, c�c h� �� nh�n r�i.")
    end
    KsgAward:ThuongHaiChau(nLevel, 200)
    KsgTask:SetBit(TASKID_LIMIT_SERVER_TEST, TASKID_LIMIT_SERVER_TEST_BIT_THDC, 1)
end

function kgm_SetLietVu(nLevel)
    nLevel = nLevel or 0
    local nRouteIndex = KsgPlayer:GetRouteIndex()
    KsgItem:AddSuitByRouteOffset(22270, nLevel, "Nh�n b� Li�t V�")
    KsgItem:AddJewelry(8092 + nRouteIndex * 2 - 2, 2, 'Nh�n Trang S�c Li�t V�')
    KsgItem:AddWeaponByRouteOffset(22270, nLevel, 'Nh�n V� kh� Li�t V�')
end

function kgm_SetHaoHiepVoHa()
    local tbAward = {
        { tbProp = { 2, 1, 30944 } },
        { tbProp = { 2, 1, 30945 } },
        { tbProp = { 2, 1, 30946 } },
        { tbProp = { 2, 1, 30973 } },
        { tbProp = { 2, 1, 30974 }, nStack = 2 },
    }
    KsgAward:Give(tbAward, 'Nh�n b� HHVH')
end

function kgm_SetSatTinh()
    local tbAward = {
        { tbProp = { 2, 1, 31313 } },
        { tbProp = { 2, 1, 31314 } },
        { tbProp = { 2, 1, 31315 } },
        { tbProp = { 2, 1, 31316 } },
        { tbProp = { 2, 1, 31317 }, nStack = 2 },
    }
    KsgAward:Give(tbAward, 'Nh�n b� S�t Tinh')
end

function kgm_SetPhaHon()
    local tbAward = {
        { tbProp = { 2, 1, 31529 } },
        { tbProp = { 2, 1, 31530 } },
        { tbProp = { 2, 1, 31531 } },
        { tbProp = { 2, 1, 31532 } },
        { tbProp = { 2, 1, 31533 }, nStack = 2 },
    }
    KsgAward:Give(tbAward, 'Nh�n b� Ph� H�n')
end

function kgm_SetAmHuyet(nLevel)
    nLevel = nLevel or 7
    KsgItem:AddSuit(30610, nLevel, "Nh�n trang b� AH", 4);
    KsgItem:AddJewelry(31272, 2, 'Nh�n Trang S�c AH', 4);
    KsgItem:AddJewelry(31414, 2, 'Nh�n Trang S�c AH', 4);
    local nRoute = KsgPlayer:GetRoute()
    local tbNewRoute = {
        [ROUTE_DUONGMON_NHAMHIEP] = 32164,
        [ROUTE_CONLON_KIEMTON] = 32192,
    }
    if tbNewRoute[nRoute] then
        return KsgItem:AddWeaponByRoute(tbNewRoute[nRoute], 4, nLevel, 'Nh�n V� Kh� �m Huy�t')
    end
    KsgItem:AddWeaponByRouteIndex(30884, 4, nLevel, 'Nh�n V� Kh� �m Huy�t')
end

function kgm_SetTangKiem(nLevel)
    nLevel = nLevel or 7
    KsgItem:AddSuitByBody(95, nLevel, 'Nh�n B� T�ng Ki�m')
    KsgItem:AddJewelry(36, 5, 'Nh�n B� T�ng Ki�m_Trang S�c')
end

function kgm_SetThienChiTangKiem(nLevel)
    nLevel = nLevel or 7
    KsgItem:AddSuitByBody(30001, nLevel, 'Nh�n B� Thi�n Chi T�ng Ki�m')
    KsgItem:AddJewelry(30001, 3, 'Nh�n B� Thi�n Chi T�ng Ki�m_Trang S�c')
end

function kgm_nhanNLTuongSoai()
    local tbAward = {
        { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 100 },
        { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 100 },
        { tbProp = { 2, 1, 31194 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 31195 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 31294 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 31295 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 31241 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 30769 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 30770 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 31122 }, nStack = 100, nStatus = 1 },
        { tbProp = { 2, 1, 30687 }, nStack = 2000, nStatus = 1 },
    }
    KsgAward:Give(tbAward)
end

function kgm_ChangeRoute()
    if KsgPlayer:IsJoinedRoute() and not KsgPlayer:IsGM() then
        return KsgNpc:Talk("Ng��i �� gia nh�p m�n ph�i r�i, ta kh�ng th� gi�p ���c g�.")
    end
    local tSay = {
        "Ng��i mu�n gia nh�p ph�i n�o?",
    }
    for _, nFactionRoute in g_tbFactionRoutes do
        tinsert(tSay, format("Ta mu�n gia nh�p %s/#kgm_JoinRoute(%d)", KsgPlayer:GetRouteName(nFactionRoute), nFactionRoute))
    end
    tinsert(tSay, "R�i kh�i/no")
    KsgNpc:PageSay(tSay, 2, 8)
end

function kgm_JoinRoute(nRoute)
    local nSex = GetSex()
    if KsgPlayer:IsJoinedRoute() and not KsgPlayer:IsAdmin() then
        return KsgNpc:Talk("Ng��i �� gia nh�p m�n ph�i r�i, ta kh�ng th� gi�p ���c g�.")
    end
    kgm_RemoveCurrentRouteSkill()
    if g_tbFactionRoute_Gender[nRoute] ~= 0 then
        if g_tbFactionRoute_Gender[nRoute] ~= nSex then
            local tbSexName = {
                [1] = "Nam",
                [2] = "N�",
            }
            return KsgNpc:Talk(format("Ph�i %s kh�ng nh�n �� t� %s", KsgPlayer:GetRouteName(nRoute), tbSexName[nSex]))
        end
    end
    SetPlayerRoute(nRoute)
    kgm_FixFactionTask()
    SetTask(336, 10000)
    ModifyReputation(10000, 0)
    kgm_LearnRouteSkill(nRoute)
    -- ��t chi�u m�t ��nh th�nh skill ��nh qu�i
    SetLRSkill(g_tbFactionRoute_Skill[nRoute].tbMonsters[1], 0)
    SetLRSkill(g_tbFactionRoute_Skill[nRoute].tbMonsters[1], 1)
    PlaySound("\\sound\\sound_i016.wav")
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
    if KsgPlayer:GetBigLevel() < 55 then
        AddLevelUp(55 - GetLevel())
    end
    --if KsgItem:Count(2, 1, 50264) == 0 then --LongDaiKa: ��ng t�i qu� t�n th�
    --    KsgAward:Give({ tbProp = { 2, 1, 50264 }, nStack = 1, nStatus = 4 }, "Nh�n T�i Qu� T�n Th�")
    --end
    KsgAward:Give({ tbProp = { 2, 1, 1006 }, nStack = 1, nStatus = 4 }, "Nh�n C�u Thi�n V� C�c ��n"); --LongDaiKa: ��i t�i qu� t�n th� th�nh C�u Thi�n V� C�c ��n kh�a
end

function kgm_FixFactionTask()
    if KsgPlayer:GetFaction() == ROUTE_DUONGMON and GetTask(1005) < 8 then
        -- fix nv so nhap duong mon
        SetTask(1005, 8)
    end
end

function kgm_RemoveCurrentRouteSkill()
    local nRoute = KsgPlayer:GetRoute()
    if not g_tbFactionRoute_Skill[nRoute] then
        return
    end
    local tbSkillCfg = g_tbFactionRoute_Skill[nRoute]
    RemoveSkill(20)
    RemoveSkill(tbSkillCfg.nTranPhai) -- Tr�n Ph�i
    for i = tbSkillCfg.nBegin, tbSkillCfg.nEnd do
        -- C�c skill c� b�n
        RemoveSkill(i)
    end
    for _, nSkillId in tbSkillCfg.tbDefault do
        -- Skill ��nh th��ng
        RemoveSkill(nSkillId)
    end
    for _, nSkillId in tbSkillCfg.tbMonsters do
        -- Skill ��nh qu�i
        RemoveSkill(nSkillId)
    end
end

function kgm_LearnRouteSkill(nRoute)
    if not g_tbFactionRoute_Skill[nRoute] then
        return
    end
    local tbSkillCfg = g_tbFactionRoute_Skill[nRoute]

    LearnSkill(20) -- Khinh c�ng
    if WPlayer:IsSuperAdmin() == WEnv.TRUE then --LongDaiKa: fix kh�ng t� h�c tr�n ph�i
        LearnSkill(tbSkillCfg.nTranPhai) -- Tr�n Ph�i
    end

    for i = tbSkillCfg.nBegin, tbSkillCfg.nEnd do
        -- C�c skill c� b�n
        LearnSkill(i)
        while LevelUpSkill(i) == 1 do
        end
    end
    for _, nSkillId in tbSkillCfg.tbDefault do
        -- Skill ��nh th��ng
        LearnSkill(nSkillId)
    end
    for _, nSkillId in tbSkillCfg.tbMonsters do --LongDaiKa: t�t skill ��nh qu�i, nh�n r�i m�t, �t d�ng
        -- Skill ��nh qu�i
        LearnSkill(nSkillId)
    end
end

function kgm_ClearBagItems(nConfirm)
    if not nConfirm or tonumber(nConfirm) ~= 1 then
        KsgNpc:SayDialog({
            g_szTitle .. "X�c nh�n x�a to�n b� v�t ph�m trong h�nh trang?",
            "��ng �/#kgm_ClearBagItems(1)",
            "Hu�/no",
        })
        return
    end
    ClearItemInPos()
    for _, cfg in g_tbLoginCfg do
        local nHaveItemCount = KsgItem:CountAll(cfg.tbProp)
        local bOtherRule = 1
        if cfg.szRequireRule == 'admin' then
            bOtherRule = KsgPlayer:IsAdmin()
        end
        if cfg.szRequireRule == 'gm' then
            bOtherRule = KsgPlayer:IsGM()
        end
        if KsgLib:GetSrvCfg(cfg.bCondition) == 1 and bOtherRule == 1 then
            if nHaveItemCount < 1 and GetFreeItemRoom() > 0 then
                KsgAward:Give({ { tbProp = cfg.tbProp } }, "onKsgPlayerLogin received card, type = " .. cfg.szRequireRule)
                if type(cfg.szMsg) == "string" then
                    KsgNpc:Talk(cfg.szMsg)
                end
            end
        else
            -- Admin kh�ng b� x�a item
            if nHaveItemCount > 0 and not KsgPlayer:IsAdmin() then
                KsgItem:DeleteAll(cfg.tbProp)
                KsgNpc:Talk(format("B� m�t %s do h�t h�n ho�c b� c�m s� d�ng!", KsgItem:GetName(cfg.tbProp)))
            end
        end
    end
end

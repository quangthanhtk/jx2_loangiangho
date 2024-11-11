Import("\\script\\ksgvn\\lib.lua");
Import("\\script\\ksgvn\\functions\\gm.lua");
Import("\\script\\warlord\\functions\\function_book.lua");

----------------------------------------------------------------------------------------------------
--- h�m OnUse ���c chuy�n v� file n�y
Import("\\script\\warlord\\items\\item_test_card.lua");
----------------------------------------------------------------------------------------------------

g_szTitle = "<color=green>Th� tr�i nghi�m: <color>"

function _w_OpenMenu_Box()
    local tbSay = { "��y l� c�c lo�i r��ng, b�o v�t s� xu�t hi�n trong qu� tr�nh b�n t�u, m�i <sex> xem qua!" };

    tinsert(tbSay, "Nh�n R��ng B�t Nh� L�n/#AddItem(2,1,40019,16,4)");
    tinsert(tbSay, "Nh�n R��ng L��ng S�n B�c/#AddItem(2,1,40017,9999,4)");
    tinsert(tbSay, "Nh�n R��ng ��a Huy�n Cung/#AddItem(2,1,40018,9999,4)");
    tinsert(tbSay, "Nh�n R��ng Ki�m ��ng Y�n V�n/#AddItem(2,1,40020,9999,4)");

    tinsert(tbSay, "\nR�i kh�i/no");
    WNpc:SayDialog(tbSay);
end

function _w_OpenMenu_Equip()
    local tbSay = { "��y l� c�c lo�i trang b� t�t nh�t �� b�t ��u chinh ph�t V� L�m, m�i <sex> xem qua!" };

    tinsert(tbSay, "Nh�n b� S� M�n 4 +15/#KsgAward:SetSuMon4(15)");
    tinsert(tbSay, "Nh�n b� S� M�n 5 +15/#KsgAward:SetSuMon5(15)");
    tinsert(tbSay, "Nh�n b� V� H� H�o Hi�p +15/#KsgAward:SetLenhBaiVoHaHaoHiep(15)");
    tinsert(tbSay, "Nh�n b� H�a Ph�ng T��ng Qu�n +15/#KsgItem:AddBattleSuit_HoaPhung_Tuong(15)");
    tinsert(tbSay, "Nh�n b� Chi�n Kh� S�t Th�n +15/#KsgAward:SetChienKhiSatThan(15)");
    tinsert(tbSay, "Nh�n b� Kim X� c�p 4 +15/#kgm_NhanKimXa(4, 15)");
    tinsert(tbSay, "Nh�n b� V�n S�c c�p 2/#KsgAward:SetVanSuc(2)");

    tinsert(tbSay, "\nR�i kh�i/no");
    WNpc:SayDialog(tbSay);
end

function _w_OpenMenu_Book()
    local tbSay = { "��y l� c�c lo�i m�t t�ch v� y�u quy�t s� xu�t hi�n tr�n V� L�m, m�i <sex> xem qua!" };

    tinsert(tbSay, "Nh�n m�t t�ch th�ng d�ng (ch�a luy�n)/#_w_book_AddCommonBook(0,2)");
    tinsert(tbSay, "Nh�n m�t t�ch th�ng d�ng (10 th�nh, 4 ph� l�c, 100%)/#_w_book_AddCommonBook(0,2,10,4,100,100,100,100)");
    tinsert(tbSay, "Nh�n m�t t�ch Si�u c�p (ch�a luy�n)/#_w_book_AddBookByType(2,5)");
    tinsert(tbSay, "Nh�n m�t t�ch Si�u c�p (10 th�nh, 4 ph� l�c, 110%)/#_w_book_AddBookByType(2,5,10,4,110,110,110,110)");
    tinsert(tbSay, "Nh�n m�t t�ch B� �i�n (ch�a luy�n)/#_w_book_AddBookByType(2,6)");
    tinsert(tbSay, "Nh�n m�t t�ch B� �i�n (10 th�nh, 4 ph� l�c, 110%)/#_w_book_AddBookByType(2,6,10,4,110,110,110,110)");
    tinsert(tbSay, "Nh�n m�t t�ch Tr�n Ph�i (10 th�nh)/#_w_book_AddMasterBook(10)");

    tinsert(tbSay, "\nNh�n Y�u Quy�t/book_AddYeuQuyet");
    tinsert(tbSay, "Nh�n C� Ph�/book_AddCoPho");
    tinsert(tbSay, "Nh�n �i�m luy�n v� l�ch luy�n/book_AddPopur");
    tinsert(tbSay, "Nh�n m�nh c� quan m�c gia/book_AddManhCoQuan");
    tinsert(tbSay, "Luy�n nhanh m�t t�ch �ang trang b� tr�n ng��i/book_FastPractice");

    tinsert(tbSay, "\nR�i kh�i/no");
    WNpc:SayDialog(tbSay);
end

function _w_Get_PetEggs()
    local tbAward = {
        { szName = "Tr�ng ng�u nhi�n", tbProp = { 2, 1, 30218 }, nStack = 1, nStatus = 4 },
        { szName = "Tr�ng Linh Th�-S�", tbProp = { 2, 1, 30726 }, nStack = 100, nStatus = 4 },
        { szName = "Tr�ng Linh Th�-Trung", tbProp = { 2, 1, 30727 }, nStack = 100, nStatus = 4 },
        { szName = "Tr�ng Linh Th�-Cao", tbProp = { 2, 1, 30728 }, nStack = 100, nStatus = 4 },
        { szName = "Tr�ng Th� C�ng-Si�u", tbProp = { 2, 1, 31169 }, nStack = 100, nStatus = 4 },
        { szName = "H�c B�ch K�", tbProp = { 2, 1, 31168 }, nStack = 100, nStatus = 4 },
        { szName = "Chi�u Y�u K�", tbProp = { 2, 1, 31307 }, nStack = 100, nStatus = 4 },
        { szName = "��a Linh Tinh Hoa", tbProp = { 2, 1, 31600 }, nStack = 100, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_OpenMenu_Pet()
    local tbSay = { "Thao t�c th� c�ng/b�n ��ng h�nh" };

    tinsert(tbSay, "Nh�n c�c lo�i tr�ng th� c�ng/_w_Get_PetEggs");
    tinsert(tbSay, "Nh�n �i�m linh l�c/pet_AddLinhLuc");
    tinsert(tbSay, "H�c Gi�ng Linh Thu�t/#pet_Active(8)");
    for i = 1, 8 do
        --tinsert(tbSay, "\n");
        --tinsert(tbSay, format("Nh�n Pet c�p %d/#pet_AddRandom(%d)", i, i))
        tinsert(tbSay, format("Nh�n s�ch k� n�ng c�p %d\n/#pet_AddBookByNum(%d, 10)", i, i));
    end

    tinsert(tbSay, "\nR�i kh�i/no");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_NEEDCONFIRM;
end

function _w_OpenMenu_Gem()
    local tbSay = { "Thao t�c t�nh n�ng �� qu�" };

    tinsert(tbSay, "Nh�n T�i �� Qu� Lv1/#AddItem(2,1,30998,999,4)");
    tinsert(tbSay, "Nh�n T�i �� Qu� Lv2/#AddItem(2,1,30999,999,4)");
    tinsert(tbSay, "Nh�n T�i �� Qu� Lv3/#AddItem(2,1,31000,999,4)");
    tinsert(tbSay, "Nh�n T�i �� Qu� Lv4/#AddItem(2,1,31001,999,4)");
    tinsert(tbSay, "Nh�n T�i �� Qu� Lv5/#AddItem(2,1,31024,999,4)");
    --tinsert(tbSay, "Nh�n T�i �� Qu� Lv6/#AddItem(2,1,31123,999,4)");
    --tinsert(tbSay, "Nh�n T�i �� Qu� Lv7/#AddItem(2,1,31505,999,4)");
    --tinsert(tbSay, "Nh�n T�i �� Qu� Lv8/#AddItem(2,1,40030,999,4)");

    tinsert(tbSay, "\nR�i kh�i/no");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_NEEDCONFIRM;
end

function _w_OpenMenu_ChangeBattleCamp(nSelectIdx, nCamp)
    nSelectIdx = nSelectIdx or 0;

    local tbCamp = {
        { szName = "T�ng", nCamp = 1, nPrefix = 1 },
        { szName = "Li�u", nCamp = 2, nPrefix = -1 },
    }

    local tbRank = {
        --{szName = " Binh s�", nRank = 1, nPoint = 1000},
        --{szName = "Hi�u �y", nRank = 2, nPoint = 15000},
        --{szName = "�� Th�ng", nRank = 3, nPoint = 50000},
        --{szName = "Ti�n Phong", nRank = 4, nPoint = 80000},
        { szName = "T��ng Qu�n", nRank = 5, nPoint = 120000 },
        --{szName = "Nguy�n So�i", nRank = 6, nPoint = 250000},
    };

    if nSelectIdx == 0 then
        local tbSay = { "M�i <sex> ch�n phe tham gia T�ng Li�u:" };

        nCamp = 1;
        for i = 1, getn(tbRank) do
            tinsert(tbSay, format("Ta mu�n nh�n qu�n h�m %s %s/#_w_OpenMenu_ChangeBattleCamp(%d, %d)", tbCamp[nCamp].szName, tbRank[i].szName, i, nCamp));
        end

        nCamp = 2;
        for i = 1, getn(tbRank) do
            tinsert(tbSay, format("Ta mu�n nh�n qu�n h�m %s %s/#_w_OpenMenu_ChangeBattleCamp(%d, %d)", tbCamp[nCamp].szName, tbRank[i].szName, i, nCamp));
        end

        tinsert(tbSay, "\nR�i kh�i/no");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    WTask:Set(704, tbCamp[nCamp].nPrefix * tbRank[nSelectIdx].nRank);
    WTask:Set(701, tbCamp[nCamp].nPrefix * tbRank[nSelectIdx].nPoint);
    WPlayer:Msg(format("Nh�n ���c qu�n h�m %s %s v� %d �i�m qu�n c�ng.", tbCamp[nCamp].szName, tbRank[nSelectIdx].szName, tbRank[nSelectIdx].nPoint));
end
function _w_Get_SuMonDanhVong(nPoint)
    WPlayer:SetFactionPoint(nPoint);
    WPlayer:SetReputation(nPoint);
end

function _w_Get_Xu(nAmount)
    local nXVP = 1000;
    if nAmount > 10000 then
        nXVP = 10000;
    end
    local nKNB = nAmount - nXVP;
    local tbAward = {
        { szName = "Kim Nguy�n B�o", tbProp = { 2, 1, 40032 }, nStack = nKNB / 1000, nStatus = 4 },
        { szName = "Xu V�t Ph�m", tbProp = { 2, 1, 40033 }, nStack = nXVP, nStatus = 4 },
    };
    WAward:Give(tbAward, "item_test_card");
end

function _w_Get_Medicine()
    local tbAward = {
        { szName = "B�ch V�n T�n", tbProp = { 1, 0, 4 }, nStack = 100, nStatus = 4 },
        { szName = "H�c Ng�c �o�n T�c Cao", tbProp = { 1, 0, 6 }, nStack = 100, nStatus = 4 },

        { szName = "��i Ho�n ��n", tbProp = { 1, 0, 9 }, nStack = 100, nStatus = 4 },
        { szName = "V�n V�t Quy Nguy�n ��n", tbProp = { 1, 0, 11 }, nStack = 100, nStatus = 4 },

        { szName = "Ng�c Linh T�n", tbProp = { 1, 0, 14 }, nStack = 100, nStatus = 4 },
        { szName = "Sinh Sinh H�a T�n", tbProp = { 1, 0, 16 }, nStack = 100, nStatus = 4 },

        { szName = "B�n Tinh Nguy�t ��n", tbProp = { 1, 0, 21 }, nStack = 100, nStatus = 4 },
        { szName = "��i Nh�t D��ng T�n", tbProp = { 1, 0, 26 }, nStack = 100, nStatus = 4 },

        { szName = "C�u Chuy�n Ho�n H�n �an", tbProp = { 1, 0, 32 }, nStack = 100, nStatus = 4 },

        { szName = "B�nh Ng�", tbProp = { 1, 1, 1 }, nStack = 100, nStatus = 4 },
        { szName = "B�nh B�t V�ng", tbProp = { 1, 1, 15 }, nStack = 100, nStatus = 4 },
        { szName = "Minh Nguy�t D�", tbProp = { 1, 1, 17 }, nStack = 100, nStatus = 4 },
        { szName = "T�y B�c V�ng", tbProp = { 1, 1, 19 }, nStack = 100, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_Get_NLCuongHoaVanSuc()
    local tbAward = {
        { szName = "L�u Kim", tbProp = { 2, 1, 31096 }, nStack = 1, nStatus = 4 },
        { szName = "Thi�n V�n Th�ch", tbProp = { 2, 201, 13 }, nStack = 1, nStatus = 4 },
        { szName = "C� Kim Th�ch", tbProp = { 2, 201, 14 }, nStack = 1, nStatus = 4 },
        { szName = "�i�m Tinh Ng�c", tbProp = { 2, 201, 15 }, nStack = 1, nStatus = 4 },
        { szName = "�i�m Tinh Ng�c-Nh�", tbProp = { 2, 201, 16 }, nStack = 1, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_Get_NLCuongHoa()
    local tbAward = {
        { szName = "M�nh Thi�n Th�ch", tbProp = { 2, 2, 7 }, nStack = 999, nStatus = 4 },
        { szName = "Thi�n Th�ch", tbProp = { 2, 2, 8 }, nStack = 999, nStatus = 4 },
        { szName = "��nh H�n Thi�n Th�ch Th�n Th�ch", tbProp = { 2, 1, 1067 }, nStack = 4, nStatus = 4 },
        { szName = "��i ��nh H�n", tbProp = { 2, 1, 1113 }, nStack = 4, nStatus = 4 },
        { szName = "Thi�n Th�ch Linh Th�ch", tbProp = { 2, 1, 1068 }, nStack = 4, nStatus = 4 },
        { szName = "Thi�n Th�ch Tinh Th�ch", tbProp = { 2, 1, 1009 }, nStack = 999, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_Get_BuaCuongHoa()
    local tbAward = {
        { szName = "C��ng H�a Quy�n 12", tbProp = { 2, 1, 30424 }, nStack = 100, nStatus = 4 },
        { szName = "C��ng H�a Quy�n 13", tbProp = { 2, 1, 30425 }, nStack = 100, nStatus = 4 },
        { szName = "C��ng H�a Quy�n 14", tbProp = { 2, 1, 30426 }, nStack = 100, nStatus = 4 },
        { szName = "C��ng H�a Quy�n 15", tbProp = { 2, 1, 30427 }, nStack = 100, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_Get_NLMaiDame()
    local tbAward = {
        { szName = "Ma �ao Th�ch C�p 1", tbProp = { 2, 1, 30428 }, nStack = 100, nStatus = 4 },
        { szName = "Ma �ao Th�ch C�p 2", tbProp = { 2, 1, 30429 }, nStack = 100, nStatus = 4 },
        { szName = "Ma �ao Th�ch C�p 3", tbProp = { 2, 1, 30430 }, nStack = 100, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_Get_KimXa_NLFeed()
    local tbAward = {
        { szName = "Thi�t Tinh Lv1", tbProp = { 2, 1, 30533 }, nStack = 1000, nStatus = 4 },
        { szName = "Thi�t Tinh Lv2", tbProp = { 2, 1, 30534 }, nStack = 1000, nStatus = 4 },
        { szName = "Thi�t Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 1000, nStatus = 4 },
        { szName = "Thi�t Tinh Lv4", tbProp = { 2, 1, 30612 }, nStack = 1000, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_Get_KimXa_NLGenAttr()
    local tbAward = {
        { szName = "T�y T�m Th�ch Lv1", tbProp = { 2, 1, 30521 }, nStack = 100, nStatus = 4 },
        { szName = "T�y T�m Th�ch Lv2", tbProp = { 2, 1, 30522 }, nStack = 100, nStatus = 4 },
        { szName = "T�y T�m Th�ch Lv3", tbProp = { 2, 1, 30523 }, nStack = 100, nStatus = 4 },
        { szName = "T�y T�m Th�ch Lv4", tbProp = { 2, 1, 30524 }, nStack = 100, nStatus = 4 },
        { szName = "T�y T�m Th�ch Lv5", tbProp = { 2, 1, 30525 }, nStack = 100, nStatus = 4 },
        { szName = "T�y T�m Th�ch Lv6", tbProp = { 2, 1, 30526 }, nStack = 100, nStatus = 4 },
        { szName = "T�y T�m Th�ch Lv7", tbProp = { 2, 1, 31402 }, nStack = 100, nStatus = 4 },
        { szName = "T�y T�m Th�ch Lv8", tbProp = { 2, 1, 31615 }, nStack = 100, nStatus = 4 },

        { szName = "Luy�n L� Thi�t Lv1", tbProp = { 2, 1, 30527 }, nStack = 100, nStatus = 4 },
        { szName = "Luy�n L� Thi�t Lv2", tbProp = { 2, 1, 30528 }, nStack = 100, nStatus = 4 },
        { szName = "Luy�n L� Thi�t Lv3", tbProp = { 2, 1, 30529 }, nStack = 100, nStatus = 4 },
        { szName = "Luy�n L� Thi�t Lv4", tbProp = { 2, 1, 30530 }, nStack = 100, nStatus = 4 },
        { szName = "Luy�n L� Thi�t Lv5", tbProp = { 2, 1, 30531 }, nStack = 100, nStatus = 4 },
        { szName = "Luy�n L� Thi�t Lv6", tbProp = { 2, 1, 30532 }, nStack = 100, nStatus = 4 },
        { szName = "Luy�n L� Thi�t Lv7", tbProp = { 2, 1, 31401 }, nStack = 100, nStatus = 4 },
        { szName = "Luy�n L� Thi�t Lv8", tbProp = { 2, 1, 31614 }, nStack = 100, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_Get_KimXa_NLLockAttr()
    local tbAward = {
        { szName = "Linh Th�ch kh�a (1)", tbProp = { 2, 1, 30904 }, nStack = 100, nStatus = 4 },
        { szName = "Linh Th�ch kh�a (2)", tbProp = { 2, 1, 30905 }, nStack = 100, nStatus = 4 },
        { szName = "Linh Th�ch kh�a (3)", tbProp = { 2, 1, 30906 }, nStack = 100, nStatus = 4 },
        { szName = "Linh Th�ch kh�a (4)", tbProp = { 2, 1, 30907 }, nStack = 100, nStatus = 4 },
        { szName = "Linh Th�ch kh�a (5)", tbProp = { 2, 1, 30908 }, nStack = 100, nStatus = 4 },
        { szName = "Linh Th�ch kh�a (6)", tbProp = { 2, 1, 30909 }, nStack = 100, nStatus = 4 },

        { szName = "��i Linh Th�ch-Cao 1", tbProp = { 2, 1, 31249 }, nStack = 100, nStatus = 4 },
        { szName = "��i Linh Th�ch-Cao 2", tbProp = { 2, 1, 31250 }, nStack = 100, nStatus = 4 },
        { szName = "��i Linh Th�ch-Cao 3", tbProp = { 2, 1, 31251 }, nStack = 100, nStatus = 4 },
        { szName = "��i Linh Th�ch-Cao 4", tbProp = { 2, 1, 31252 }, nStack = 100, nStatus = 4 },
        { szName = "��i Linh Th�ch-Cao 5", tbProp = { 2, 1, 31253 }, nStack = 100, nStatus = 4 },
        { szName = "��i Linh Th�ch-Cao 6", tbProp = { 2, 1, 31254 }, nStack = 100, nStatus = 4 },

        { szName = "X� Qu�n T�a Linh Th�ch 1", tbProp = { 2, 1, 31391 }, nStack = 100, nStatus = 4 },
        { szName = "X� Qu�n T�a Linh Th�ch 2", tbProp = { 2, 1, 31392 }, nStack = 100, nStatus = 4 },
        { szName = "X� Qu�n T�a Linh Th�ch 3", tbProp = { 2, 1, 31393 }, nStack = 100, nStatus = 4 },
        { szName = "X� Qu�n T�a Linh Th�ch 4", tbProp = { 2, 1, 31394 }, nStack = 100, nStatus = 4 },
        { szName = "X� Qu�n T�a Linh Th�ch 5", tbProp = { 2, 1, 31395 }, nStack = 100, nStatus = 4 },
        { szName = "X� Qu�n T�a Linh Th�ch 6", tbProp = { 2, 1, 31396 }, nStack = 100, nStatus = 4 },

        { szName = "Tinh V�n T�a Linh Th�ch 1", tbProp = { 2, 1, 31604 }, nStack = 100, nStatus = 4 },
        { szName = "Tinh V�n T�a Linh Th�ch 2", tbProp = { 2, 1, 31605 }, nStack = 100, nStatus = 4 },
        { szName = "Tinh V�n T�a Linh Th�ch 3", tbProp = { 2, 1, 31606 }, nStack = 100, nStatus = 4 },
        { szName = "Tinh V�n T�a Linh Th�ch 4", tbProp = { 2, 1, 31607 }, nStack = 100, nStatus = 4 },
        { szName = "Tinh V�n T�a Linh Th�ch 5", tbProp = { 2, 1, 31608 }, nStack = 100, nStatus = 4 },
        { szName = "Tinh V�n T�a Linh Th�ch 6", tbProp = { 2, 1, 31609 }, nStack = 100, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_Get_NLSuaDo()
    local tbAward = {
        { szName = "M�nh B�ng Th�ch", tbProp = { 2, 1, 148 }, nStack = 100, nStatus = 4 },
        { szName = "B�ng Th�ch", tbProp = { 2, 1, 149 }, nStack = 100, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_OpenMenu_Other()
    local tbSay = { "M�i <sex> ch�n nh�n h� tr� t��ng �ng:" };

    tinsert(tbSay, "Thay ��i qu�n h�m/_w_OpenMenu_ChangeBattleCamp");
    tinsert(tbSay, "Nh�n 100.000 �i�m t�ch l�y chi�n tr��ng/#WPlayer:ModifyBattlePoint(100000)");
    tinsert(tbSay, "Nh�n 30.000 �i�m s� m�n & danh v�ng/#_w_Get_SuMonDanhVong(30000)");
    tinsert(tbSay, "Nh�n 100.000 v�ng/#AddItem(2,1,539,100,4)");
    tinsert(tbSay, "Nh�n 100.000 xu/#_w_Get_Xu(100000)");
    tinsert(tbSay, "Nh�n 100 t� �i�m kinh nghi�m/#WPlayer:BigAddExp(100e9)");
    tinsert(tbSay, "Nh�n d��c ph�m/_w_Get_Medicine");
    tinsert(tbSay, "Nh�n M�nh Chu T��c/#AddItem(2,1,40016,9999,4)");
    tinsert(tbSay, "Nh�n Thi�n Ki�u L�nh/#AddItem(2,97,236,999,4)");
    tinsert(tbSay, "Nh�n v�t ph�m s�a ��/_w_Get_NLSuaDo");

    tinsert(tbSay, "\nNh�n nguy�n li�u c��ng h�a trang b�/_w_Get_NLCuongHoa");
    tinsert(tbSay, "Nh�n c�c lo�i b�a c��ng h�a trang b�/_w_Get_BuaCuongHoa");
    tinsert(tbSay, "Nh�n c�c lo�i �� m�i v� kh�/_w_Get_NLMaiDame");

    tinsert(tbSay, "\nNh�n nguy�n li�u c��ng h�a V�n S�c/_w_Get_NLCuongHoaVanSuc");

    tinsert(tbSay, "\nNh�n nguy�n li�u nu�i Kim X�/_w_Get_KimXa_NLFeed");
    tinsert(tbSay, "Nh�n �� t�y thu�c t�nh Kim X�/_w_Get_KimXa_NLGenAttr");
    tinsert(tbSay, "Nh�n �� kh�a thu�c t�nh Kim X�/_w_Get_KimXa_NLLockAttr");
    tinsert(tbSay, "\nNh�n H�i Ti�n ��n v� Linh Ph�ch ��n/kgm_AddLinhDon");
    --tinsert(tbSay, "Nh�n C�u Thi�n V� C�c ��n/#AddItem(2,1,1006,1,4)");


    tinsert(tbSay, "\nR�i kh�i/no");
    WNpc:SayDialog(tbSay);
end

function OnUse_bk(nItemIndex)
    local nCurDate = KsgDate:Today()
    if KsgLib:GetSrvCfg("bOpenTestCard") ~= 1 and not KsgPlayer:IsGM() then
        return KsgNpc:Talk("S� ki�n tr�i nghi�m t�nh n�ng �� k�t th�c!")
    end
    if nCurDate > KsgLib:GetSrvCfg("tbTimeTest").nEndDate and not KsgPlayer:IsGM() then
        return KsgNpc:Talk("S� ki�n tr�i nghi�m t�nh n�ng �� k�t th�c!")
    end
    local tSay = { g_szTitle .. format("Ch�o m�ng ��n v�i %s<color=yellow> Hi�n l� ng�y tr�i nghi�m th� %d, th�i gian tr�i nghi�m t�nh n�ng c�n: %d ng�y<color>, ch�c c�c b�n ch�i game vui v�! <enter>H�y l�a ch�n t�nh n�ng:", g_WCFG.szProductName, KsgDate:CurrentTestDay(), KsgDate:TestRemainingDays()) }
    local nRoute = KsgPlayer:GetRoute()
    if nRoute == 0 then
        tinsert(tSay, "Gia nh�p m�n ph�i/kgm_ChangeRoute")
    else
        tinsert(tSay, "Nh�n r��ng ho�t ��ng/_w_OpenMenu_Box");
        tinsert(tSay, "Nh�n trang b� c� b�n/_w_OpenMenu_Equip");
        tinsert(tSay, "Nh�n m�t t�ch & y�u quy�t/_w_OpenMenu_Book");
        tinsert(tSay, "T�nh n�ng Chuy�n sinh/kgm_ShowMenuReborn");
        tinsert(tSay, "T�nh n�ng H�a c�nh/kgm_ShowMenuFair");
        tinsert(tSay, "T�nh n�ng Kinh m�ch/kgm_ShowMenuMeridian");
        tinsert(tSay, "T�nh n�ng Th��ng h�i di ch�u/kgm_ShowMenuPear");
        tinsert(tSay, "T�nh n�ng �� qu�/_w_OpenMenu_Gem");
        tinsert(tSay, "T�nh n�ng Bang h�i/kgm_ShowMenuBang");
        tinsert(tSay, "T�nh n�ng Th� c�ng/_w_OpenMenu_Pet");
        tinsert(tSay, "Nh�n c�c h� tr� kh�c/_w_OpenMenu_Other");

        -- goc
        --tinsert(tSay, "Nh�n trang b�/kgm_ShowMenuEquip")
        --tinsert(tSay, "Nh�n m�t t�ch/kgm_ShowMenuBook")
        --tinsert(tSay, "Nh�n ngo�i trang & th� c��i/kgm_ShowMenuHorseAndCoat")
        --tinsert(tSay, "Chuy�n sinh/kgm_ShowMenuReborn")
        --tinsert(tSay, "H�a c�nh/kgm_ShowMenuFair")
        --tinsert(tSay, "T�ng kinh m�ch/kgm_ShowMenuMeridian")
        --tinsert(tSay, "Th��ng h�i di ch�u/kgm_ShowMenuPear")
        --tinsert(tSay, "Ch�c n�ng Bang h�i/kgm_ShowMenuBang")
        --tinsert(tSay, "Nh�n th� c�ng/kgm_ShowMenuPet")
        --tinsert(tSay, "Nh�n c�c h� tr� kh�c/kgm_ShowMenuSupport")
    end

    if not factionSupport_IsTodayReceived() then
        if ROUTE_THIEULAM_TRUONG == nRoute then
            tinsert(tSay, "Nh�n Thi�n Ph�t Ch�u v� Ph� Ma Ch�/factionSupport_TLT")
        end
        if ROUTE_DUONGMON_AMKHI == nRoute then
            tinsert(tSay, "Nh�n �m Kh� v� C� Quan/factionSupport_DuongMon")
        end
        if ROUTE_NGAMI_KIEM == nRoute then
            tinsert(tSay, "Nh�n X� L�i Kim ��n/factionSupport_NgaMiKiem")
        end
        if ROUTE_DUONGGIA_THUONG == nRoute then
            tinsert(tSay, "Nh�n Chi�n M�/factionSupport_DGT")
        end
        if ROUTE_DUONGGIA_CUNG == nRoute then
            tinsert(tSay, "Nh�n Chi�n M� v� T� Ti�n/factionSupport_DGC")
        end
        if ROUTE_NGUDOC_HIEP == nRoute then
            tinsert(tSay, "Nh�n Phong Thi Ph�/factionSupport_HiepDoc")
        end
        if ROUTE_NGUDOC_TA == nRoute then
            tinsert(tSay, "Nh�n C�/factionSupport_TaDoc")
        end
        if ROUTE_THUYYEN_LINHNU == nRoute then
            tinsert(tSay, "Nh�n �i�u/factionSupport_ThuyYenLinhNu")
        end
        if ROUTE_CONLON_KIEMTON == nRoute then
            tinsert(tSay, "Nh�n Linh Ki�m/factionSupport_CLKT")
        end
    end

    tinsert(tSay, "Thanh l� t�i/kgm_ClearBagItems")
    tinsert(tSay, "\nK�t th�c ��i tho�i/no")
    KsgNpc:SayDialog(tSay)
end

Import("\\script\\ksgvn\\lib.lua");
Import("\\script\\ksgvn\\functions\\gm.lua");
Import("\\script\\warlord\\functions\\function_book.lua");

----------------------------------------------------------------------------------------------------
--- hµm OnUse ®­îc chuyÓn vÒ file nµy
Import("\\script\\warlord\\items\\item_test_card.lua");
----------------------------------------------------------------------------------------------------

g_szTitle = "<color=green>ThÎ tr¶i nghiÖm: <color>"

function _w_OpenMenu_Box()
    local tbSay = { "§©y lµ c¸c lo¹i r­¬ng, b¶o vËt sÏ xuÊt hiÖn trong qu¸ tr×nh b«n tÈu, mêi <sex> xem qua!" };

    tinsert(tbSay, "NhËn R­¬ng B¸t Nh· Lín/#AddItem(2,1,40019,16,4)");
    tinsert(tbSay, "NhËn R­¬ng L­¬ng S¬n B¹c/#AddItem(2,1,40017,9999,4)");
    tinsert(tbSay, "NhËn R­¬ng §Þa HuyÒn Cung/#AddItem(2,1,40018,9999,4)");
    tinsert(tbSay, "NhËn R­¬ng KiÕm §·ng YÕn V©n/#AddItem(2,1,40020,9999,4)");

    tinsert(tbSay, "\nRêi khái/no");
    WNpc:SayDialog(tbSay);
end

function _w_OpenMenu_Equip()
    local tbSay = { "§©y lµ c¸c lo¹i trang bÞ tèt nhÊt ®Ó b¾t ®Çu chinh ph¹t Vâ L©m, mêi <sex> xem qua!" };

    tinsert(tbSay, "NhËn bé S­ M«n 4 +15/#KsgAward:SetSuMon4(15)");
    tinsert(tbSay, "NhËn bé S­ M«n 5 +15/#KsgAward:SetSuMon5(15)");
    tinsert(tbSay, "NhËn bé V« H¹ Hµo HiÖp +15/#KsgAward:SetLenhBaiVoHaHaoHiep(15)");
    tinsert(tbSay, "NhËn bé Háa Phông T­íng Qu©n +15/#KsgItem:AddBattleSuit_HoaPhung_Tuong(15)");
    tinsert(tbSay, "NhËn bé ChiÕn KhÝ S¸t ThÇn +15/#KsgAward:SetChienKhiSatThan(15)");
    tinsert(tbSay, "NhËn bé Kim Xµ cÊp 4 +15/#kgm_NhanKimXa(4, 15)");
    tinsert(tbSay, "NhËn bé V¨n Søc cÊp 2/#KsgAward:SetVanSuc(2)");

    tinsert(tbSay, "\nRêi khái/no");
    WNpc:SayDialog(tbSay);
end

function _w_OpenMenu_Book()
    local tbSay = { "§©y lµ c¸c lo¹i mËt tÞch vµ yÕu quyÕt sÏ xuÊt hiÖn trªn Vâ L©m, mêi <sex> xem qua!" };

    tinsert(tbSay, "NhËn mËt tÞch th«ng dông (ch­a luyÖn)/#_w_book_AddCommonBook(0,2)");
    tinsert(tbSay, "NhËn mËt tÞch th«ng dông (10 thµnh, 4 phô lôc, 100%)/#_w_book_AddCommonBook(0,2,10,4,100,100,100,100)");
    tinsert(tbSay, "NhËn mËt tÞch Siªu cÊp (ch­a luyÖn)/#_w_book_AddBookByType(2,5)");
    tinsert(tbSay, "NhËn mËt tÞch Siªu cÊp (10 thµnh, 4 phô lôc, 110%)/#_w_book_AddBookByType(2,5,10,4,110,110,110,110)");
    tinsert(tbSay, "NhËn mËt tÞch BÝ ®iÓn (ch­a luyÖn)/#_w_book_AddBookByType(2,6)");
    tinsert(tbSay, "NhËn mËt tÞch BÝ ®iÓn (10 thµnh, 4 phô lôc, 110%)/#_w_book_AddBookByType(2,6,10,4,110,110,110,110)");
    tinsert(tbSay, "NhËn mËt tÞch TrÊn Ph¸i (10 thµnh)/#_w_book_AddMasterBook(10)");

    tinsert(tbSay, "\nNhËn YÕu QuyÕt/book_AddYeuQuyet");
    tinsert(tbSay, "NhËn Cæ Phæ/book_AddCoPho");
    tinsert(tbSay, "NhËn ®iÓm luyÖn vµ lÞch luyÖn/book_AddPopur");
    tinsert(tbSay, "NhËn m¶nh c¬ quan mÆc gia/book_AddManhCoQuan");
    tinsert(tbSay, "LuyÖn nhanh mËt tÞch ®ang trang bÞ trªn ng­êi/book_FastPractice");

    tinsert(tbSay, "\nRêi khái/no");
    WNpc:SayDialog(tbSay);
end

function _w_Get_PetEggs()
    local tbAward = {
        { szName = "Trøng ngÉu nhiªn", tbProp = { 2, 1, 30218 }, nStack = 1, nStatus = 4 },
        { szName = "Trøng Linh Thó-S¬", tbProp = { 2, 1, 30726 }, nStack = 100, nStatus = 4 },
        { szName = "Trøng Linh Thó-Trung", tbProp = { 2, 1, 30727 }, nStack = 100, nStatus = 4 },
        { szName = "Trøng Linh Thó-Cao", tbProp = { 2, 1, 30728 }, nStack = 100, nStatus = 4 },
        { szName = "Trøng Thó C­ng-Siªu", tbProp = { 2, 1, 31169 }, nStack = 100, nStatus = 4 },
        { szName = "H¾c B¹ch Kú", tbProp = { 2, 1, 31168 }, nStack = 100, nStatus = 4 },
        { szName = "Chiªu Yªu Kú", tbProp = { 2, 1, 31307 }, nStack = 100, nStatus = 4 },
        { szName = "§Þa Linh Tinh Hoa", tbProp = { 2, 1, 31600 }, nStack = 100, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_OpenMenu_Pet()
    local tbSay = { "Thao t¸c thó c­ng/b¹n ®ång hµnh" };

    tinsert(tbSay, "NhËn c¸c lo¹i trøng thó c­ng/_w_Get_PetEggs");
    tinsert(tbSay, "NhËn ®iÓm linh lùc/pet_AddLinhLuc");
    tinsert(tbSay, "Häc Gi¸ng Linh ThuËt/#pet_Active(8)");
    for i = 1, 8 do
        --tinsert(tbSay, "\n");
        --tinsert(tbSay, format("NhËn Pet cÊp %d/#pet_AddRandom(%d)", i, i))
        tinsert(tbSay, format("NhËn s¸ch kü n¨ng cÊp %d\n/#pet_AddBookByNum(%d, 10)", i, i));
    end

    tinsert(tbSay, "\nRêi khái/no");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_NEEDCONFIRM;
end

function _w_OpenMenu_Gem()
    local tbSay = { "Thao t¸c tÝnh n¨ng ®¸ quý" };

    tinsert(tbSay, "NhËn Tói §¸ Quý Lv1/#AddItem(2,1,30998,999,4)");
    tinsert(tbSay, "NhËn Tói §¸ Quý Lv2/#AddItem(2,1,30999,999,4)");
    tinsert(tbSay, "NhËn Tói §¸ Quý Lv3/#AddItem(2,1,31000,999,4)");
    tinsert(tbSay, "NhËn Tói §¸ Quý Lv4/#AddItem(2,1,31001,999,4)");
    tinsert(tbSay, "NhËn Tói §¸ Quý Lv5/#AddItem(2,1,31024,999,4)");
    --tinsert(tbSay, "NhËn Tói §¸ Quý Lv6/#AddItem(2,1,31123,999,4)");
    --tinsert(tbSay, "NhËn Tói §¸ Quý Lv7/#AddItem(2,1,31505,999,4)");
    --tinsert(tbSay, "NhËn Tói §¸ Quý Lv8/#AddItem(2,1,40030,999,4)");

    tinsert(tbSay, "\nRêi khái/no");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_NEEDCONFIRM;
end

function _w_OpenMenu_ChangeBattleCamp(nSelectIdx, nCamp)
    nSelectIdx = nSelectIdx or 0;

    local tbCamp = {
        { szName = "Tèng", nCamp = 1, nPrefix = 1 },
        { szName = "Liªu", nCamp = 2, nPrefix = -1 },
    }

    local tbRank = {
        --{szName = " Binh sÜ", nRank = 1, nPoint = 1000},
        --{szName = "HiÖu óy", nRank = 2, nPoint = 15000},
        --{szName = "§« Thèng", nRank = 3, nPoint = 50000},
        --{szName = "Tiªn Phong", nRank = 4, nPoint = 80000},
        { szName = "T­íng Qu©n", nRank = 5, nPoint = 120000 },
        --{szName = "Nguyªn So¸i", nRank = 6, nPoint = 250000},
    };

    if nSelectIdx == 0 then
        local tbSay = { "Mêi <sex> chän phe tham gia Tèng Liªu:" };

        nCamp = 1;
        for i = 1, getn(tbRank) do
            tinsert(tbSay, format("Ta muèn nhËn qu©n hµm %s %s/#_w_OpenMenu_ChangeBattleCamp(%d, %d)", tbCamp[nCamp].szName, tbRank[i].szName, i, nCamp));
        end

        nCamp = 2;
        for i = 1, getn(tbRank) do
            tinsert(tbSay, format("Ta muèn nhËn qu©n hµm %s %s/#_w_OpenMenu_ChangeBattleCamp(%d, %d)", tbCamp[nCamp].szName, tbRank[i].szName, i, nCamp));
        end

        tinsert(tbSay, "\nRêi khái/no");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    WTask:Set(704, tbCamp[nCamp].nPrefix * tbRank[nSelectIdx].nRank);
    WTask:Set(701, tbCamp[nCamp].nPrefix * tbRank[nSelectIdx].nPoint);
    WPlayer:Msg(format("NhËn ®­îc qu©n hµm %s %s vµ %d ®iÓm qu©n c«ng.", tbCamp[nCamp].szName, tbRank[nSelectIdx].szName, tbRank[nSelectIdx].nPoint));
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
        { szName = "Kim Nguyªn B¶o", tbProp = { 2, 1, 40032 }, nStack = nKNB / 1000, nStatus = 4 },
        { szName = "Xu VËt PhÈm", tbProp = { 2, 1, 40033 }, nStack = nXVP, nStatus = 4 },
    };
    WAward:Give(tbAward, "item_test_card");
end

function _w_Get_Medicine()
    local tbAward = {
        { szName = "B¹ch V©n T¸n", tbProp = { 1, 0, 4 }, nStack = 100, nStatus = 4 },
        { szName = "H¾c Ngäc §o¹n Tôc Cao", tbProp = { 1, 0, 6 }, nStack = 100, nStatus = 4 },

        { szName = "§¹i Hoµn §¬n", tbProp = { 1, 0, 9 }, nStack = 100, nStatus = 4 },
        { szName = "V¹n VËt Quy Nguyªn §¬n", tbProp = { 1, 0, 11 }, nStack = 100, nStatus = 4 },

        { szName = "Ngäc Linh T¸n", tbProp = { 1, 0, 14 }, nStack = 100, nStatus = 4 },
        { szName = "Sinh Sinh Hãa T¸n", tbProp = { 1, 0, 16 }, nStack = 100, nStatus = 4 },

        { szName = "B«n Tinh NguyÖt §¬n", tbProp = { 1, 0, 21 }, nStack = 100, nStatus = 4 },
        { szName = "§¹i NhËt D­¬ng T¸n", tbProp = { 1, 0, 26 }, nStack = 100, nStatus = 4 },

        { szName = "Cöu ChuyÓn Hoµn Hån §an", tbProp = { 1, 0, 32 }, nStack = 100, nStatus = 4 },

        { szName = "B¸nh Ng«", tbProp = { 1, 1, 1 }, nStack = 100, nStatus = 4 },
        { szName = "B¸nh Bét Vµng", tbProp = { 1, 1, 15 }, nStack = 100, nStatus = 4 },
        { szName = "Minh NguyÖt D¹", tbProp = { 1, 1, 17 }, nStack = 100, nStatus = 4 },
        { szName = "T©y B¾c Väng", tbProp = { 1, 1, 19 }, nStack = 100, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_Get_NLCuongHoaVanSuc()
    local tbAward = {
        { szName = "L­u Kim", tbProp = { 2, 1, 31096 }, nStack = 1, nStatus = 4 },
        { szName = "Thiªn V¨n Th¹ch", tbProp = { 2, 201, 13 }, nStack = 1, nStatus = 4 },
        { szName = "Cæ Kim Th¹ch", tbProp = { 2, 201, 14 }, nStack = 1, nStatus = 4 },
        { szName = "§iÓm Tinh Ngäc", tbProp = { 2, 201, 15 }, nStack = 1, nStatus = 4 },
        { szName = "§iÓm Tinh Ngäc-Nhá", tbProp = { 2, 201, 16 }, nStack = 1, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_Get_NLCuongHoa()
    local tbAward = {
        { szName = "M¶nh Thiªn Th¹ch", tbProp = { 2, 2, 7 }, nStack = 999, nStatus = 4 },
        { szName = "Thiªn Th¹ch", tbProp = { 2, 2, 8 }, nStack = 999, nStatus = 4 },
        { szName = "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", tbProp = { 2, 1, 1067 }, nStack = 4, nStatus = 4 },
        { szName = "§¹i §Þnh Hån", tbProp = { 2, 1, 1113 }, nStack = 4, nStatus = 4 },
        { szName = "Thiªn Th¹ch Linh Th¹ch", tbProp = { 2, 1, 1068 }, nStack = 4, nStatus = 4 },
        { szName = "Thiªn Th¹ch Tinh Th¹ch", tbProp = { 2, 1, 1009 }, nStack = 999, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_Get_BuaCuongHoa()
    local tbAward = {
        { szName = "C­êng Hãa QuyÓn 12", tbProp = { 2, 1, 30424 }, nStack = 100, nStatus = 4 },
        { szName = "C­êng Hãa QuyÓn 13", tbProp = { 2, 1, 30425 }, nStack = 100, nStatus = 4 },
        { szName = "C­êng Hãa QuyÓn 14", tbProp = { 2, 1, 30426 }, nStack = 100, nStatus = 4 },
        { szName = "C­êng Hãa QuyÓn 15", tbProp = { 2, 1, 30427 }, nStack = 100, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_Get_NLMaiDame()
    local tbAward = {
        { szName = "Ma §ao Th¹ch CÊp 1", tbProp = { 2, 1, 30428 }, nStack = 100, nStatus = 4 },
        { szName = "Ma §ao Th¹ch CÊp 2", tbProp = { 2, 1, 30429 }, nStack = 100, nStatus = 4 },
        { szName = "Ma §ao Th¹ch CÊp 3", tbProp = { 2, 1, 30430 }, nStack = 100, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_Get_KimXa_NLFeed()
    local tbAward = {
        { szName = "ThiÕt Tinh Lv1", tbProp = { 2, 1, 30533 }, nStack = 1000, nStatus = 4 },
        { szName = "ThiÕt Tinh Lv2", tbProp = { 2, 1, 30534 }, nStack = 1000, nStatus = 4 },
        { szName = "ThiÕt Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 1000, nStatus = 4 },
        { szName = "ThiÕt Tinh Lv4", tbProp = { 2, 1, 30612 }, nStack = 1000, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_Get_KimXa_NLGenAttr()
    local tbAward = {
        { szName = "TÈy T©m Th¹ch Lv1", tbProp = { 2, 1, 30521 }, nStack = 100, nStatus = 4 },
        { szName = "TÈy T©m Th¹ch Lv2", tbProp = { 2, 1, 30522 }, nStack = 100, nStatus = 4 },
        { szName = "TÈy T©m Th¹ch Lv3", tbProp = { 2, 1, 30523 }, nStack = 100, nStatus = 4 },
        { szName = "TÈy T©m Th¹ch Lv4", tbProp = { 2, 1, 30524 }, nStack = 100, nStatus = 4 },
        { szName = "TÈy T©m Th¹ch Lv5", tbProp = { 2, 1, 30525 }, nStack = 100, nStatus = 4 },
        { szName = "TÈy T©m Th¹ch Lv6", tbProp = { 2, 1, 30526 }, nStack = 100, nStatus = 4 },
        { szName = "TÈy T©m Th¹ch Lv7", tbProp = { 2, 1, 31402 }, nStack = 100, nStatus = 4 },
        { szName = "TÈy T©m Th¹ch Lv8", tbProp = { 2, 1, 31615 }, nStack = 100, nStatus = 4 },

        { szName = "LuyÖn L« ThiÕt Lv1", tbProp = { 2, 1, 30527 }, nStack = 100, nStatus = 4 },
        { szName = "LuyÖn L« ThiÕt Lv2", tbProp = { 2, 1, 30528 }, nStack = 100, nStatus = 4 },
        { szName = "LuyÖn L« ThiÕt Lv3", tbProp = { 2, 1, 30529 }, nStack = 100, nStatus = 4 },
        { szName = "LuyÖn L« ThiÕt Lv4", tbProp = { 2, 1, 30530 }, nStack = 100, nStatus = 4 },
        { szName = "LuyÖn L« ThiÕt Lv5", tbProp = { 2, 1, 30531 }, nStack = 100, nStatus = 4 },
        { szName = "LuyÖn L« ThiÕt Lv6", tbProp = { 2, 1, 30532 }, nStack = 100, nStatus = 4 },
        { szName = "LuyÖn L« ThiÕt Lv7", tbProp = { 2, 1, 31401 }, nStack = 100, nStatus = 4 },
        { szName = "LuyÖn L« ThiÕt Lv8", tbProp = { 2, 1, 31614 }, nStack = 100, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_Get_KimXa_NLLockAttr()
    local tbAward = {
        { szName = "Linh Th¹ch khãa (1)", tbProp = { 2, 1, 30904 }, nStack = 100, nStatus = 4 },
        { szName = "Linh Th¹ch khãa (2)", tbProp = { 2, 1, 30905 }, nStack = 100, nStatus = 4 },
        { szName = "Linh Th¹ch khãa (3)", tbProp = { 2, 1, 30906 }, nStack = 100, nStatus = 4 },
        { szName = "Linh Th¹ch khãa (4)", tbProp = { 2, 1, 30907 }, nStack = 100, nStatus = 4 },
        { szName = "Linh Th¹ch khãa (5)", tbProp = { 2, 1, 30908 }, nStack = 100, nStatus = 4 },
        { szName = "Linh Th¹ch khãa (6)", tbProp = { 2, 1, 30909 }, nStack = 100, nStatus = 4 },

        { szName = "§æi Linh Th¹ch-Cao 1", tbProp = { 2, 1, 31249 }, nStack = 100, nStatus = 4 },
        { szName = "§æi Linh Th¹ch-Cao 2", tbProp = { 2, 1, 31250 }, nStack = 100, nStatus = 4 },
        { szName = "§æi Linh Th¹ch-Cao 3", tbProp = { 2, 1, 31251 }, nStack = 100, nStatus = 4 },
        { szName = "§æi Linh Th¹ch-Cao 4", tbProp = { 2, 1, 31252 }, nStack = 100, nStatus = 4 },
        { szName = "§æi Linh Th¹ch-Cao 5", tbProp = { 2, 1, 31253 }, nStack = 100, nStatus = 4 },
        { szName = "§æi Linh Th¹ch-Cao 6", tbProp = { 2, 1, 31254 }, nStack = 100, nStatus = 4 },

        { szName = "X· Qu©n Táa Linh Th¹ch 1", tbProp = { 2, 1, 31391 }, nStack = 100, nStatus = 4 },
        { szName = "X· Qu©n Táa Linh Th¹ch 2", tbProp = { 2, 1, 31392 }, nStack = 100, nStatus = 4 },
        { szName = "X· Qu©n Táa Linh Th¹ch 3", tbProp = { 2, 1, 31393 }, nStack = 100, nStatus = 4 },
        { szName = "X· Qu©n Táa Linh Th¹ch 4", tbProp = { 2, 1, 31394 }, nStack = 100, nStatus = 4 },
        { szName = "X· Qu©n Táa Linh Th¹ch 5", tbProp = { 2, 1, 31395 }, nStack = 100, nStatus = 4 },
        { szName = "X· Qu©n Táa Linh Th¹ch 6", tbProp = { 2, 1, 31396 }, nStack = 100, nStatus = 4 },

        { szName = "Tinh VÉn Táa Linh Th¹ch 1", tbProp = { 2, 1, 31604 }, nStack = 100, nStatus = 4 },
        { szName = "Tinh VÉn Táa Linh Th¹ch 2", tbProp = { 2, 1, 31605 }, nStack = 100, nStatus = 4 },
        { szName = "Tinh VÉn Táa Linh Th¹ch 3", tbProp = { 2, 1, 31606 }, nStack = 100, nStatus = 4 },
        { szName = "Tinh VÉn Táa Linh Th¹ch 4", tbProp = { 2, 1, 31607 }, nStack = 100, nStatus = 4 },
        { szName = "Tinh VÉn Táa Linh Th¹ch 5", tbProp = { 2, 1, 31608 }, nStack = 100, nStatus = 4 },
        { szName = "Tinh VÉn Táa Linh Th¹ch 6", tbProp = { 2, 1, 31609 }, nStack = 100, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_Get_NLSuaDo()
    local tbAward = {
        { szName = "M¶nh B¨ng Th¹ch", tbProp = { 2, 1, 148 }, nStack = 100, nStatus = 4 },
        { szName = "B¨ng Th¹ch", tbProp = { 2, 1, 149 }, nStack = 100, nStatus = 4 },
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_OpenMenu_Other()
    local tbSay = { "Mêi <sex> chän nhËn hç trî t­¬ng øng:" };

    tinsert(tbSay, "Thay ®æi qu©n hµm/_w_OpenMenu_ChangeBattleCamp");
    tinsert(tbSay, "NhËn 100.000 ®iÓm tÝch lòy chiÕn tr­êng/#WPlayer:ModifyBattlePoint(100000)");
    tinsert(tbSay, "NhËn 30.000 ®iÓm s­ m«n & danh väng/#_w_Get_SuMonDanhVong(30000)");
    tinsert(tbSay, "NhËn 100.000 vµng/#AddItem(2,1,539,100,4)");
    tinsert(tbSay, "NhËn 100.000 xu/#_w_Get_Xu(100000)");
    tinsert(tbSay, "NhËn 100 tû ®iÓm kinh nghiÖm/#WPlayer:BigAddExp(100e9)");
    tinsert(tbSay, "NhËn d­îc phÈm/_w_Get_Medicine");
    tinsert(tbSay, "NhËn M¶nh Chu T­íc/#AddItem(2,1,40016,9999,4)");
    tinsert(tbSay, "NhËn Thiªn Kiªu LÖnh/#AddItem(2,97,236,999,4)");
    tinsert(tbSay, "NhËn vËt phÈm söa ®å/_w_Get_NLSuaDo");

    tinsert(tbSay, "\nNhËn nguyªn liÖu c­êng hãa trang bÞ/_w_Get_NLCuongHoa");
    tinsert(tbSay, "NhËn c¸c lo¹i bïa c­êng hãa trang bÞ/_w_Get_BuaCuongHoa");
    tinsert(tbSay, "NhËn c¸c lo¹i ®¸ mµi vò khÝ/_w_Get_NLMaiDame");

    tinsert(tbSay, "\nNhËn nguyªn liÖu c­êng hãa V¨n Søc/_w_Get_NLCuongHoaVanSuc");

    tinsert(tbSay, "\nNhËn nguyªn liÖu nu«i Kim Xµ/_w_Get_KimXa_NLFeed");
    tinsert(tbSay, "NhËn ®¸ tÈy thuéc tÝnh Kim Xµ/_w_Get_KimXa_NLGenAttr");
    tinsert(tbSay, "NhËn ®¸ khãa thuéc tÝnh Kim Xµ/_w_Get_KimXa_NLLockAttr");
    tinsert(tbSay, "\nNhËn Håi Tiªn §¬n vµ Linh Ph¸ch §¬n/kgm_AddLinhDon");
    --tinsert(tbSay, "NhËn Cöu Thiªn V« Cùc §¬n/#AddItem(2,1,1006,1,4)");


    tinsert(tbSay, "\nRêi khái/no");
    WNpc:SayDialog(tbSay);
end

function OnUse_bk(nItemIndex)
    local nCurDate = KsgDate:Today()
    if KsgLib:GetSrvCfg("bOpenTestCard") ~= 1 and not KsgPlayer:IsGM() then
        return KsgNpc:Talk("Sù kiÖn tr¶i nghiÖm tÝnh n¨ng ®· kÕt thóc!")
    end
    if nCurDate > KsgLib:GetSrvCfg("tbTimeTest").nEndDate and not KsgPlayer:IsGM() then
        return KsgNpc:Talk("Sù kiÖn tr¶i nghiÖm tÝnh n¨ng ®· kÕt thóc!")
    end
    local tSay = { g_szTitle .. format("Chµo mõng ®Õn víi %s<color=yellow> HiÖn lµ ngµy tr¶i nghiÖm thø %d, thêi gian tr¶i nghiÖm tÝnh n¨ng cßn: %d ngµy<color>, chóc c¸c b¹n ch¬i game vui vÎ! <enter>H·y lùa chän tÝnh n¨ng:", g_WCFG.szProductName, KsgDate:CurrentTestDay(), KsgDate:TestRemainingDays()) }
    local nRoute = KsgPlayer:GetRoute()
    if nRoute == 0 then
        tinsert(tSay, "Gia nhËp m«n ph¸i/kgm_ChangeRoute")
    else
        tinsert(tSay, "NhËn r­¬ng ho¹t ®éng/_w_OpenMenu_Box");
        tinsert(tSay, "NhËn trang bÞ c¬ b¶n/_w_OpenMenu_Equip");
        tinsert(tSay, "NhËn mËt tÞch & yÕu quyÕt/_w_OpenMenu_Book");
        tinsert(tSay, "TÝnh n¨ng ChuyÓn sinh/kgm_ShowMenuReborn");
        tinsert(tSay, "TÝnh n¨ng Hãa c¶nh/kgm_ShowMenuFair");
        tinsert(tSay, "TÝnh n¨ng Kinh m¹ch/kgm_ShowMenuMeridian");
        tinsert(tSay, "TÝnh n¨ng Th­¬ng h¶i di ch©u/kgm_ShowMenuPear");
        tinsert(tSay, "TÝnh n¨ng §¸ quý/_w_OpenMenu_Gem");
        tinsert(tSay, "TÝnh n¨ng Bang héi/kgm_ShowMenuBang");
        tinsert(tSay, "TÝnh n¨ng Thó c­ng/_w_OpenMenu_Pet");
        tinsert(tSay, "NhËn c¸c hç trî kh¸c/_w_OpenMenu_Other");

        -- goc
        --tinsert(tSay, "NhËn trang bÞ/kgm_ShowMenuEquip")
        --tinsert(tSay, "NhËn mËt tÞch/kgm_ShowMenuBook")
        --tinsert(tSay, "NhËn ngo¹i trang & thó c­ìi/kgm_ShowMenuHorseAndCoat")
        --tinsert(tSay, "ChuyÓn sinh/kgm_ShowMenuReborn")
        --tinsert(tSay, "Hãa c¶nh/kgm_ShowMenuFair")
        --tinsert(tSay, "T¨ng kinh m¹ch/kgm_ShowMenuMeridian")
        --tinsert(tSay, "Th­¬ng h¶i di ch©u/kgm_ShowMenuPear")
        --tinsert(tSay, "Chøc n¨ng Bang héi/kgm_ShowMenuBang")
        --tinsert(tSay, "NhËn thó c­ng/kgm_ShowMenuPet")
        --tinsert(tSay, "NhËn c¸c hç trî kh¸c/kgm_ShowMenuSupport")
    end

    if not factionSupport_IsTodayReceived() then
        if ROUTE_THIEULAM_TRUONG == nRoute then
            tinsert(tSay, "NhËn Thiªn PhËt Ch©u vµ Ph¸ Ma Chó/factionSupport_TLT")
        end
        if ROUTE_DUONGMON_AMKHI == nRoute then
            tinsert(tSay, "NhËn ¸m KhÝ vµ C¬ Quan/factionSupport_DuongMon")
        end
        if ROUTE_NGAMI_KIEM == nRoute then
            tinsert(tSay, "NhËn X¸ Lîi Kim §¬n/factionSupport_NgaMiKiem")
        end
        if ROUTE_DUONGGIA_THUONG == nRoute then
            tinsert(tSay, "NhËn ChiÕn M·/factionSupport_DGT")
        end
        if ROUTE_DUONGGIA_CUNG == nRoute then
            tinsert(tSay, "NhËn ChiÕn M· vµ Tô TiÔn/factionSupport_DGC")
        end
        if ROUTE_NGUDOC_HIEP == nRoute then
            tinsert(tSay, "NhËn Phong Thi Phï/factionSupport_HiepDoc")
        end
        if ROUTE_NGUDOC_TA == nRoute then
            tinsert(tSay, "NhËn Cæ/factionSupport_TaDoc")
        end
        if ROUTE_THUYYEN_LINHNU == nRoute then
            tinsert(tSay, "NhËn §iªu/factionSupport_ThuyYenLinhNu")
        end
        if ROUTE_CONLON_KIEMTON == nRoute then
            tinsert(tSay, "NhËn Linh KiÕm/factionSupport_CLKT")
        end
    end

    tinsert(tSay, "Thanh lý tói/kgm_ClearBagItems")
    tinsert(tSay, "\nKÕt thóc ®èi tho¹i/no")
    KsgNpc:SayDialog(tSay)
end

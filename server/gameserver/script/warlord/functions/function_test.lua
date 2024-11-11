----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-24
--- Description: file chøa c¸c hµm liªn quan ®Õn thÎ tr¶i nghiÖm
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
function _w_test_Give_Money(nAmount)
    --- Check
    if WLib:CheckInv(1 + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    local tbAward = {
        { tbProp = { 2, 1, 539 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- §¹i hång bao hoµng kim
    };
    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_Coin(nAmount)
    --- Check
    if WLib:CheckInv(1 + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    local tbAward = {
        { tbProp = { 2, 1, 30490 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- VËt phÈm Xu
    };
    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_SuMonDanhVong(nPoint)
    local tbAward = {
        nFactionPoint = nPoint,
        nRepute = nPoint,
    };
    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_PlayerTitle()
    local tbTitle = {
        [SEX_MALE] = {
            { 67, 11, "§¹i S­ Huynh" }
        },
        [SEX_FEMALE] = {
            { 67, 11, "§¹i S­ Huynh" },
        },
        [SEX_ALL] = {
            { 74, 1, "Thiªn Xu" },
            { 74, 2, "Thiªn Toµn" },
            { 74, 3, "Thiªn C¬" },
            { 75, 1, "Thiªn QuyÒn" },
            { 75, 2, "Ngäc H»ng" },
        }
    };
    for k, v in pairs(tbTitle) do
        if k ~= "n" and v ~= nil then
            for k1, v1 in pairs(v) do
                RemoveTitle(v1[1], v1[2]);
                AddTitle(v1[1], v1[2]);
                SetTitleTime(v1[1], v1[2], GetTime() + 30 * 24 * 3600);
                SetCurTitle(v1[1], v1[2]);
            end
        end
    end
end

function _w_test_Give_BattleRank(nRank, nCamp)
    if nRank == WEnv.NULL then
        local tbSay = { "Chän cÊp bËc qu©n hµm:" };
        for i = 1, getn(BATTLERANK_NAMES) do
            tinsert(tbSay, format("%s/#_w_test_Give_BattleRank(%d)", BATTLERANK_NAMES[i], i));
        end
        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "[x] §ãng/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if nCamp == WEnv.NULL then
        local tbSay = { "Chän phe chiÕn tr­êng:" };
        for i = 1, getn(BATTLECAMP_NAMES) do
            tinsert(tbSay, format("%s/#_w_test_Give_BattleRank(%d, %d)", "Phe " .. BATTLECAMP_NAMES[i], nRank, i));
        end
        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "[x] §ãng/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    local nTongOrLieu = 1;
    if nCamp == 2 then
        nTongOrLieu = -1;
    end
    local nCurrentPoint = WPlayer:GetHonor();
    if nCurrentPoint < BATTLERANK_POINTS[nRank] then
        WPlayer:SetHonor(BATTLERANK_POINTS[nRank] * nTongOrLieu);
    else
        WPlayer:SetHonor(nCurrentPoint * nTongOrLieu);
    end
    WTask:Set(TASKID_BATTLE_RANK, nRank * nTongOrLieu);
    WPlayer:Msg(format("NhËn ®­îc qu©n hµm %s phe %s!", BATTLERANK_NAMES[nRank], BATTLECAMP_NAMES[nCamp]));
end

function _w_test_Give_Gem(nLevel, nSelectIdx)
    --- Check
    if WLib:CheckInv(4 + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    if nLevel == WEnv.NULL then
        local tbSay = { "Chän cÊp ®¸ quý:" };
        for i = 1, 8 do
            tinsert(tbSay, format("%s%d/#_w_test_Give_Gem(%d)", "Bé ®¸ quý Lv", i, i));
        end
        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "[x] §ãng/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    WItem:AddGem(255, ITEMSTATUS_LOCK, nLevel, 1, "item_test_card");
    WItem:AddGem(255, ITEMSTATUS_LOCK, nLevel, 2, "item_test_card");
    WItem:AddGem(255, ITEMSTATUS_LOCK, nLevel, 3, "item_test_card");
    WItem:AddGem(255, ITEMSTATUS_LOCK, nLevel, 4, "item_test_card");
end

function _w_test_Give_NLMaiDame()
    local tbAward = {
        { tbProp = { 2, 1, 30428 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- Ma §ao Th¹ch CÊp 1
        { tbProp = { 2, 1, 30429 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- Ma §ao Th¹ch CÊp 2
        { tbProp = { 2, 1, 30430 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- Ma §ao Th¹ch CÊp 3
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_NLSuaDo()
    local tbAward = {
        { tbProp = { 2, 1, 148 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- M¶nh B¨ng Th¹ch
        { tbProp = { 2, 1, 149 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- B¨ng Th¹ch
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_HiepNghiaChiChung()
    local tbAward = {
        { tbProp = { 2, 1, 30912 }, nStack = 9999, nStatus = ITEMSTATUS_LOCK }, --HiÖp NghÜa Chi Chøng
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_NLCuongHoaVS()
    local tbAward = {
        { tbProp = { 2, 201, 15 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- §iÓm Tinh Ngäc
        --{ tbProp = { 2, 201, 16 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- §iÓm Tinh Ngäc-Nhá
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_NLCuongHoa()
    local tbAward = {
        { tbProp = { 2, 2, 7 }, nStack = 999, nStatus = ITEMSTATUS_LOCK }, -- M¶nh Thiªn Th¹ch
        { tbProp = { 2, 2, 8 }, nStack = 999, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Th¹ch
        { tbProp = { 2, 1, 1067 }, nStack = 4, nStatus = ITEMSTATUS_LOCK }, -- §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch
        { tbProp = { 2, 1, 1113 }, nStack = 4, nStatus = ITEMSTATUS_LOCK }, -- §¹i §Þnh Hån
        { tbProp = { 2, 1, 1068 }, nStack = 4, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Th¹ch Linh Th¹ch
        { tbProp = { 2, 1, 1009 }, nStack = 999, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Th¹ch Tinh Th¹ch
        { tbProp = { 2, 1, 30424 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- C­êng Hãa QuyÓn 12
        { tbProp = { 2, 1, 30425 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- C­êng Hãa QuyÓn 13
        { tbProp = { 2, 1, 30426 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- C­êng Hãa QuyÓn 14
        { tbProp = { 2, 1, 30427 }, nStack = 100, nStatus = ITEMSTATUS_LOCK }, -- C­êng Hãa QuyÓn 15
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_NLUanLinh(nLevel, nType, nSelectIdx)
    --- Check
    if WLib:CheckInv(3 + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    if nLevel == WEnv.NULL then
        local tbSay = { "Chän bé cÊp uÈn linh:" };
        for i = 1, getn(g_tbCixiuSet) do
            tinsert(tbSay, format("%s%d/#_w_test_Give_NLUanLinh(%d)", "UÈn linh Lv", i, i));
        end
        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "[x] §ãng/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if nType == WEnv.NULL then
        local tbSay = { "Chän bé uÈn linh cho vÞ trÝ:" };
        tinsert(tbSay, format("%s/#_w_test_Give_NLUanLinh(%d, %d)", "UÈn linh ngo¹i trang-m·o", nLevel, ITEM_D_EQUIP_WENSHI_H));
        tinsert(tbSay, format("%s/#_w_test_Give_NLUanLinh(%d, %d)", "UÈn linh ngo¹i trang-y phôc", nLevel, ITEM_D_EQUIP_WENSHI_C));
        tinsert(tbSay, format("%s/#_w_test_Give_NLUanLinh(%d, %d)", "UÈn linh ngo¹i trang-h¹ y", nLevel, ITEM_D_EQUIP_WENSHI_T));
        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "[x] §ãng/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if nSelectIdx == WEnv.NULL then
        local tbSay = { "Chän uÈn linh:" };
        local nStartId = g_tbCixiuSet[nLevel][nType].nStartId;
        local nEndId = g_tbCixiuSet[nLevel][nType].nEndId;
        for i = nStartId, nEndId do
            tinsert(tbSay, format("%s/#_w_test_Give_NLUanLinh(%d, %d, %d)", WItem:GetName(ITEM_G_EQUIP, nType, i), nLevel, nType, i));
        end
        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "[x] §ãng/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    WItem:AddOnce(nSelectIdx, ITEMSTATUS_LOCK, 0, nType, "item_test_card");
end

---------------------------------------------Tinh vÉn táa Linh th¹ch 1-8
function _w_test_Give_NLTinhVanToaLinhThach()
    local tbAward = {
                -- dµnh cho kim xµ 8
        { tbProp = { 2, 1, 31604 }, nStack = 99, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 1
        { tbProp = { 2, 1, 31605 }, nStack = 99, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 2
        { tbProp = { 2, 1, 31606 }, nStack = 99, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 3
        { tbProp = { 2, 1, 31607 }, nStack = 99, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 4
        { tbProp = { 2, 1, 31608 }, nStack = 99, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 5
        { tbProp = { 2, 1, 31609 }, nStack = 99, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 6
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
-------------------------------------AD Ruong Vuot Ai-
function _w_test_Give_RuongPhuBan()
    local tbAward = {
        { tbProp = { 2, 1, 40017 }, nStack = 9999, nStatus = ITEMSTATUS_LOCK }, -- Ruong Luong Son bac
        { tbProp = { 2, 1, 40018 }, nStack = 9999, nStatus = ITEMSTATUS_LOCK }, -- Ruong Dia Huyen
        { tbProp = { 2, 97, 236 }, nStack = 9999, nStatus = ITEMSTATUS_LOCK }, -- Thieen kieu Lenh
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
-------------------------------------AD Ruong Su Kien-
function _w_test_Give_EventT12()
    local tbAward = {
        { tbProp = { 2, 200, 52 }, nStack = 2000, nStatus = ITEMSTATUS_LOCK }, -- Cay Thong An lanh
        { tbProp = { 2, 200, 53 }, nStack = 2000, nStatus = ITEMSTATUS_LOCK }, -- Cay Thong Am Ap
        { tbProp = { 2, 200, 54 }, nStack = 2000, nStatus = ITEMSTATUS_LOCK }, --Cay Thong Giang Sinh
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
-----------------------------NhËn Nl n©ng cÊp t­íng so¸i------------------
function _w_test_Give_NangCapTuongSoai()
    local tbAward = {
        -- dµnh cho kim xµ 8
        { tbProp = { 2, 1, 31295 }, nStack = 999, nStatus = ITEMSTATUS_LOCK }, -- Uy Hæ Tinh Hoa
        { tbProp = { 2, 1, 30687 }, nStack = 9999, nStatus = ITEMSTATUS_LOCK }, -- Th¸i NhÊt LÖnh
        { tbProp = { 2,1,	31294 }, nStack = 999, nStatus = ITEMSTATUS_LOCK }, -- Uy Hå Hån
        { tbProp = { 2,1,31515 }, nStack = 999, nStatus = ITEMSTATUS_LOCK }, -- Chu T­íc Tinh Hoa
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
-----------------------------------------------------------------------------------



function _w_test_Give_NLKhoaThuocTinhKimXa()
    local tbAward = {
        -- dµnh cho kim xµ 5
        --{ tbProp = { 2, 1, 30904 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Linh Th¹ch khãa (1)
        --{ tbProp = { 2, 1, 30905 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Linh Th¹ch khãa (2)
        --{ tbProp = { 2, 1, 30906 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Linh Th¹ch khãa (3)
        --{ tbProp = { 2, 1, 30907 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Linh Th¹ch khãa (4)
        --{ tbProp = { 2, 1, 30908 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Linh Th¹ch khãa (5)
        --{ tbProp = { 2, 1, 30909 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Linh Th¹ch khãa (6)

        -- dµnh cho kim xµ 6
        { tbProp = { 2, 1, 31249 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- §æi Linh Th¹ch-Cao 1
        { tbProp = { 2, 1, 31250 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- §æi Linh Th¹ch-Cao 2
        { tbProp = { 2, 1, 31251 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- §æi Linh Th¹ch-Cao 3
        { tbProp = { 2, 1, 31252 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- §æi Linh Th¹ch-Cao 4
        { tbProp = { 2, 1, 31253 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- §æi Linh Th¹ch-Cao 5
        { tbProp = { 2, 1, 31254 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- §æi Linh Th¹ch-Cao 6

        -- dµnh cho kim xµ 7
        --{ tbProp = { 2, 1, 31391 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- X· Qu©n Táa Linh Th¹ch 1
        --{ tbProp = { 2, 1, 31392 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- X· Qu©n Táa Linh Th¹ch 2
        --{ tbProp = { 2, 1, 31393 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- X· Qu©n Táa Linh Th¹ch 3
        --{ tbProp = { 2, 1, 31394 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- X· Qu©n Táa Linh Th¹ch 4
        --{ tbProp = { 2, 1, 31395 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- X· Qu©n Táa Linh Th¹ch 5
        --{ tbProp = { 2, 1, 31396 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- X· Qu©n Táa Linh Th¹ch 6

        -- dµnh cho kim xµ 8
        --{ tbProp = { 2, 1, 31604 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 1
        --{ tbProp = { 2, 1, 31605 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 2
        --{ tbProp = { 2, 1, 31606 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 3
        --{ tbProp = { 2, 1, 31607 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 4
        --{ tbProp = { 2, 1, 31608 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 5
        --{ tbProp = { 2, 1, 31609 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Tinh VÉn Táa Linh Th¹ch 6
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_NLTayThuocTinhKimXa()
    local tbAward = {
        --{ tbProp = { 2, 1, 30521 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv1
        --{ tbProp = { 2, 1, 30522 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv2
        --{ tbProp = { 2, 1, 30523 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv3
        --{ tbProp = { 2, 1, 30524 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv4
        --{ tbProp = { 2, 1, 30525 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv5
        { tbProp = { 2, 1, 30526 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv6
        --{ tbProp = { 2, 1, 31402 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv7
        --{ tbProp = { 2, 1, 31615 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv8

        --{ tbProp = { 2, 1, 30527 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv1
        --{ tbProp = { 2, 1, 30528 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv2
        --{ tbProp = { 2, 1, 30529 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv3
        --{ tbProp = { 2, 1, 30530 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv4
        --{ tbProp = { 2, 1, 30531 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv5
        { tbProp = { 2, 1, 30532 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv6
        --{ tbProp = { 2, 1, 31401 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv7
        --{ tbProp = { 2, 1, 31614 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv8
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_NLNuoiKimXa()
    local tbAward = {
        { tbProp = { 2, 1, 30533 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- ThiÕt Tinh Lv1
        { tbProp = { 2, 1, 30534 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- ThiÕt Tinh Lv2
        { tbProp = { 2, 1, 30535 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- ThiÕt Tinh Lv3
        { tbProp = { 2, 1, 30612 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- ThiÕt Tinh Lv4
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_ManhBiDien(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 40047 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- M¶nh BÝ §iÓn 25
        { tbProp = { 2, 1, 40048 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- M¶nh BÝ §iÓn 27
        { tbProp = { 2, 1, 40049 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- M¶nh BÝ §iÓn 30
        { tbProp = { 2, 1, 40050 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- M¶nh BÝ §iÓn 32
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_ManhTuyBienChau(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 40046 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- M¶nh Tïy BiÕn Ch©u 7
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_KXLenh(nLevel)
    local tbAward = {
        { tbProp = { 2, 1, 40148 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Hoan L¨ng LÖnh (Phi Phong)
        { tbProp = { 2, 1, 40149 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Hoan L¨ng LÖnh (Huy Ch­¬ng)
        { tbProp = { 2, 1, 40150 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Hoan L¨ng LÖnh (ChiÕn Hµi)

        { tbProp = { 2, 1, 40151 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- §»ng Giao LÖnh (Phi Phong)
        { tbProp = { 2, 1, 40152 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- §»ng Giao LÖnh (Huy Ch­¬ng)
        { tbProp = { 2, 1, 40153 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- §»ng Giao LÖnh (ChiÕn Hµi)
        
        { tbProp = { 2, 1, 40154 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Khëi Ph­îng LÖnh (Phi Phong)
        { tbProp = { 2, 1, 40155 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Khëi Ph­îng LÖnh (Huy Ch­¬ng)
        { tbProp = { 2, 1, 40156 }, nStack = 1, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- Khëi Ph­îng LÖnh (ChiÕn Hµi)
        ----Thiet tinh 4 up level
        { tbProp = { 2, 1, 30612 }, nStack = 5000, nStatus = ITEMSTATUS_LOCK, nFeed = ITEMFEED_12 }, -- thiet tinh 4
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_test_Give_TTLL9()
    local tbAward = {
        { tbProp = { 2, 1, 31761 }, nStack = 198, nStatus = ITEMSTATUS_LOCK }, -- Tay Tam 9
        { tbProp = { 2, 1, 31762 }, nStack = 198, nStatus = ITEMSTATUS_LOCK}, -- Luyen Lo 9
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_test_Give_Da9()
    local tbAward = {
        { tbProp = { 2, 22, 109 }, nStack = 99, nStatus = ITEMSTATUS_LOCK }, -- da 9
        { tbProp = { 2, 22, 209 }, nStack = 99, nStatus = ITEMSTATUS_LOCK }, -- da 9
        { tbProp = { 2, 22, 309 }, nStack = 99, nStatus = ITEMSTATUS_LOCK }, -- da 9
        { tbProp = { 2, 22, 409 }, nStack = 99, nStatus = ITEMSTATUS_LOCK }, -- da 9

    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_test_Give_DHTLT()
    local tbAward = {
        { tbProp = { 2, 1, 31751 }, nStack = 99, nStatus = ITEMSTATUS_LOCK }, -- §¹i Hoang Táa Linh Th¹ch
        { tbProp = { 2, 1, 31752 }, nStack = 99, nStatus = ITEMSTATUS_LOCK }, -- §¹i Hoang Táa Linh Th¹ch
        { tbProp = { 2, 1, 31753 }, nStack = 99, nStatus = ITEMSTATUS_LOCK }, -- §¹i Hoang Táa Linh Th¹ch
        { tbProp = { 2, 1, 31754 }, nStack = 99, nStatus = ITEMSTATUS_LOCK }, -- §¹i Hoang Táa Linh Th¹ch
        { tbProp = { 2, 1, 31755 }, nStack = 99, nStatus = ITEMSTATUS_LOCK }, -- §¹i Hoang Táa Linh Th¹ch
        { tbProp = { 2, 1, 31756 }, nStack = 99, nStatus = ITEMSTATUS_LOCK }, -- §¹i Hoang Táa Linh Th¹ch
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end
function _w_test_Give_TTTA()
    local tbAward = {
        { tbProp = { 2, 1, 40137 }, nStack = 9999, nStatus = ITEMSTATUS_LOCK }, -- Bét Tr©n Ch©u Tinh Anh
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_ManhCoQuanMacGia(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- M¶nh C¬ Quan MÆc Gia
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_YeuQuyet()

    local tbAward = {
        { tbProp = { 2, 1, 31244 }, nStack = 5000, nStatus = ITEMSTATUS_LOCK }, -- M¶nh C¬ Quan MÆc Gia
        { tbProp = { 2, 1, 50005 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- R­¬ng yÕu QuyÕt
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_ChanVoHonThach(nAmount)
    local tbAward = {
        { tbProp = { 2, 114, 143 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Ch©n Vâ Hån Th¹ch
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

function _w_test_Give_LinhKhiRucRo(nAmount)
    local tbAward = {
        { tbProp = { 2, 1, 31122 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- Linh KhÝ Rùc Rì
        { tbProp = { 2, 1, 31241 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK }, -- HuyÕt Bå §Ò
    };

    if WLib:CheckInv(getn(tbAward) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    WAward:Give(tbAward, "item_test_card");
end

----------------------------------------------------------------------------------------------------
--- Menu test néi bé
function _w_test_ReJoinRoute()
    SetPlayerRoute(0);
    kgm_ChangeRoute();
end

function _w_test_BuffDame(bEnable, bShowMsg)
    bEnable = bEnable or 1;
    bShowMsg = bShowMsg or 1;

    local nStateIdOffset = 6000;
    local nMaxStateBuff = 20;
    local tbBuffAdmin = {
        { "TESTER",
          {
              { "state_interval_ignore", 100, -1, 1 },
              { "state_cost_free", 100, -1, 1 },
              { "state_damage_point", 1000000, -1, 1 },
              { "state_max_carry_point_add", 10000, -1, 1 },
              { "state_life_max_point_add", 100000, -1, 1 },
              { "state_neili_max_point_add", 20000, -1, 1 },
              { "state_life_percent_per10s_anytime", 10, -1, 1 },
              { "state_neili_percent_per10s_anytime", 10, -1, 1 },
              { "state_move_speed_percent_add", 120, -1, 1 },
          },
        },
    };

    local nSelectIdx = 1;

    local tbBuffInfo = tbBuffAdmin[nSelectIdx];
    if tbBuffInfo == WEnv.NULL then
        return WEnv.RETCODE_NOTOPEN;
    end

    if bEnable == 1 then
        WTask:SetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_BUFFTEST, 1);
        local tbBuffState = tbBuffInfo[2];
        for i = 1, nMaxStateBuff do
            if tbBuffState[i] ~= WEnv.NULL then
                CastState(tbBuffState[i][1], tbBuffState[i][2], tbBuffState[i][3], tbBuffState[i][4], nStateIdOffset + i);
            end
        end
        if bShowMsg == 1 then
            WPlayer:Msg("§· nhËn hiÖu qu¶ " .. tbBuffInfo[1]);
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        end
    else
        WTask:SetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_BUFFTEST, 0);
        for i = 1, nMaxStateBuff do
            RemoveState(nStateIdOffset + i);
        end
        if bShowMsg == 1 then
            WPlayer:Msg("§· hñy hiÖu qu¶ " .. tbBuffInfo[1]);
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        end
    end
end

function _w_test_FinishTaskTNC()
    WTask:SetByte(TSK_NEWRES_FINISH, BYTE_NEWRES_STATE, 2);
    WPlayer:Msg("§· hoµn thµnh 1 nhiÖm vô Tµi Nguyªn ChiÕn!");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
end

function _w_test_ResetDailyTaskLimitTNC()
    WTask:SetByte(TSK_NEWRES_FINISH, BYTE_NEWRES_DONE, 0);
    WPlayer:Msg("§· reset giíi h¹n nhiÖm vô Tµi Nguyªn ChiÕn h«m nay!");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
end

function _w_test_ResetDailyTaskLimitTH()
    local TAIXU_TIME = 1782;
    WTask:Set(TAIXU_TIME, 0);
    WPlayer:Msg("§· reset giíi h¹n nhiÖm vô Th¸i Hu h«m nay!");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
end

function _w_test_ResetDailyTaskLimitVanTieu()
    WTask:Set(TASK_FIELD_PVP_CAR_DAILY_NUM, 0);
    WPlayer:Msg("§· reset giíi h¹n nhiÖm vô VËn Tiªu h«m nay!");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
end

function _w_test_FinishTaskVanTieu()
    WTask:Modify(TASK_FIELD_PVP_CAR_DAILY_NUM, 1);
    WAward:BaPhe_VanTieu();
    WPlayer:Msg("§· hoµn thµnh 1 nhiÖm vô VËn Tiªu!");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
end

function _w_test_ResetDailySystem()
    WTask:Set(WTASKID_CURRENT_DATE, 0);
    WPlayer:Msg("§· reset giíi h¹n ngµy hÖ thèng míi!");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
end

function _w_test_GenCode(nSelectIdx)
    nSelectIdx = tonumber(nSelectIdx) or 0;
    if nSelectIdx == 0 then
        local tbSay = { "Chän mét giftcode cÇn t¹o:" }
        for i = 1, getn(WGiftCode.tbAwardDef) do
            if WGiftCode.tbAwardDef[i] ~= WEnv.NULL then
                tinsert(tbSay, format("%s/#_w_test_GenCode(%d)", WGiftCode.tbAwardDef[i].szName, i));
            end
        end

        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "[x] §ãng/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    WGiftCode:GenCode(nSelectIdx);
end

function _w_test_SetOpenBox_BachBaoRuong(nCount)
    if nCount == WEnv.NULL then
        WLib:InputNumber("NhËp sè lÇn...", 1, 9999, 0, _w_test_SetOpenBox_BachBaoRuong);
        return WEnv.RETCODE_NEEDCONFIRM;
    end
    
    WTask:SetPosValue(TASKID_EVENT_BACHBAORUONG, nCount, 1, 4);
    WPlayer:Msg(format("§· set sè lÇn më B¸ch B¶o R­¬ng míi: %d!", WTask:GetPosValue(TASKID_EVENT_BACHBAORUONG, 1, 4)));
end

function _w_test_FinishTaskCTP()
    WAward:ChienTruong_NhanMonQuan(1, 1, 1, 0, 0);
    WPlayer:Msg("§· hoµn thµnh 1 nhiÖm vô tham gia ChiÕn Tr­êng Phô!");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
end

function _w_test_FinishTaskCTC()
    WAward:ChienTruong_NhanMonQuan(4, 1, 1, 0, 0);
    WPlayer:Msg("§· hoµn thµnh 1 nhiÖm vô tham gia ChiÕn Tr­êng ChÝnh!");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
end

function _w_test_FinishMaxTuBaoTrai()
    WTask:Set(TASKID_TUBAOTRAI_LOTTERY_NUM, 100000, TASK_ACCESS_CODE_TUBAOTRAI);
    WPlayer:Msg("§· hoµn thµnh max l­ît quay Tô B¶o Trai!");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
end

function _w_test_ResetTuBaoTrai()
    WTask:Set(TASKID_TUBAOTRAI_LOTTERY_NUM, 0, TASK_ACCESS_CODE_TUBAOTRAI);
    WTask:Set(TASKID_TUBAOTRAI_AWARD, 0, TASK_ACCESS_CODE_TUBAOTRAI);
    WTask:Set(TASKID_TUBAOTRAI_LOTTERY_NUM, 0, TASK_ACCESS_CODE_TUBAOTRAI);
    WPlayer:Msg("§· reset sè lÇn quay Tô B¶o Trai!");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
end

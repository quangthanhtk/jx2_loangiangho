----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-21
--- Description: c¸c hµm liªn quan ®Õn phÇn th­ëng ®ua top dùa trªn BXH
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
function _w_duatopbxh_GiveUyHoSoai(nLevel)
    KsgItem:AddBattleSuit_UyHo_Soai(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);
end

function _w_duatopbxh_GiveUyHoTuong(nLevel)
    KsgItem:AddBattleSuit_UyHo_Tuong(nLevel, BATTLE_ITEM_TYPE_SUIT_RING_WEAPON);
end

function _w_duatopbxh_GiveSatTinh(nLevel, nStatus)
    nLevel = nLevel or 0;
    nStatus = nStatus or ITEMSTATUS_LOCK;

    local tbAward = {
        { tbProp = { 2, 1, 31313 }, nStack = 1, nStatus = nStatus, nLevel = nLevel },
        { tbProp = { 2, 1, 31314 }, nStack = 1, nStatus = nStatus, nLevel = nLevel },
        { tbProp = { 2, 1, 31315 }, nStack = 1, nStatus = nStatus, nLevel = nLevel },
        { tbProp = { 2, 1, 31316 }, nStack = 1, nStatus = nStatus, nLevel = nLevel },
        { tbProp = { 2, 1, 31317 }, nStack = 2, nStatus = nStatus },
    }
    KsgAward:Give(tbAward, 'NhËn bé S¸t Tinh')
end

--- Hµm lùa chän cho phÇn th­ëng nFunc
--- c¸c param replace nµy ®Òu kiÓu string, l­u ý ®æi l¹i trong hµm xö lý cña tõng hµm phÇn th­ëng
function _w_duatopbxh_PrepareParam(nType, nAwardIdx, nSelectKimXa7)
    --- param1
    if nSelectKimXa7 == WEnv.NULL then
        local tbSay = { "Chän <color=yellow>1 bé trang bÞ Kim xµ d­íi ®©y<color>:" };

        for nTypeKimXa, szNameKimXa in g_tbKimXaCfg[7] do
            tinsert(tbSay, format("Ta muèn nhËn bé %s/#_w_duatopbxh_PrepareParam(%d, %d, %d)",
                    szNameKimXa, nType, nAwardIdx, nTypeKimXa));
        end

        tinsert(tbSay, "\nT¹m thêi ch­a muèn nhËn./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    WDuaTopBXH:GiveAward(nType, nAwardIdx, nSelectKimXa7);
    return WEnv.RETCODE_SUCCESS;
end

enumWDuaTopBXHStatusCode = {
    AWARD_CAN_GET = 1,
    AWARD_HAS_GET = 2,
    AWARD_NOT_AVAILABLE = 3,
    AWARD_NEED_GET_BEFORE = 4,
    AWARD_REQ_LEVEL = 5,
    AWARD_REQ_JOIN_ROUTE = 6,
    AWARD_REQ_ROOM = 7,
};
WDuaTopBXH = {
    tbTopDef = {
        [1] = { szName = "3 top c«ng tr¹ng phe Tèng",
                nTopLimit = 3,
                nTaskId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT,
                nTaskBitId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_MERIT,
                szDataFilePath = "\\data\\warlord\\duatopbxh\\top_battlemerit_tong.txt",
                szSuccessDataFilePath = "data/warlord/duatopbxh/top_battlemerit_tong_success.txt",
                szDataLabel = "C«ng tr¹ng",
                fnDataStrFormal = WLib.MoneyFormat,
                tbAwardDef = {
                    [1] = {
                        szName = "Top 1 c«ng tr¹ng phe Tèng",
                        fnPrepareParam = _w_duatopbxh_PrepareParam,
                        tbAwards = {
                            { szName = "1 bé Uy Hæ So¸i+0 (khãa)", nFunc = "_w_duatopbxh_GiveUyHoSoai(0)" },
                            { szName = "Voi ChiÕn-§Ñp (khãa)", tbProp = { 0, 105, 30132 }, nStack = 1, nStatus = 4 },
                            { szName = "C¸n Khª Sa", tbProp = { 2, 1, 31558 }, nStack = 1, nStatus = 4 },
                            { szName = "15 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 15, 1)" },
                            { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 30, nStatus = 1 },
                            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 30, nStatus = 1 },
                            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 30, nStatus = 1 },
                            { szName = "1 bé V¨n Søc Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
                            { szName = "1 bé Kim Xµ Lv7+0", nFunc = "KsgAward:AddKimXa(7, 0, param1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 1 + 3 + 5,
                        },
                    },
                    [2] = {
                        szName = "Top 2 c«ng tr¹ng phe Tèng",
                        tbAwards = {
                            { szName = "1 bé Uy Hæ T­íng+0 (khãa)", nFunc = "_w_duatopbxh_GiveUyHoTuong(0)" },
                            { szName = "Tö Liªn Hoa-Rùc Rì (khãa)", tbProp = { 0, 105, 30151 }, nStack = 1, nStatus = 4 },
                            { szName = "L©m Giang Tiªn", tbProp = { 2, 1, 31559 }, nStack = 1, nStatus = 4 },
                            { szName = "10 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 10, 1)" },
                            { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 20, nStatus = 1 },
                            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 20, nStatus = 1 },
                            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 20, nStatus = 1 },
                            { szName = "1 bé V¨n Søc Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 1 + 5,
                        },
                    },
                    [3] = {
                        szName = "Top 3 c«ng tr¹ng phe Tèng",
                        tbAwards = {
                            { szName = "1 bé Uy Hæ T­íng+0 (khãa)", nFunc = "_w_duatopbxh_GiveUyHoTuong(0)" },
                            { szName = "BÐ B¸o Vµng-§Ñp (khãa)", tbProp = { 0, 105, 30129 }, nStack = 1, nStatus = 4 },
                            { szName = "5 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 5, 1)" },
                            { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 10, nStatus = 1 },
                            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 15, nStatus = 1 },
                            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 15, nStatus = 1 },
                            { szName = "1 bé V¨n Søc Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 5,
                        },
                    },
                }
        },
        [2] = { szName = "3 top c«ng tr¹ng phe Liªu",
                nTopLimit = 3,
                nTaskId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT,
                nTaskBitId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_MERIT,
                szDataFilePath = "\\data\\warlord\\duatopbxh\\top_battlemerit_lieu.txt",
                szSuccessDataFilePath = "data/warlord/duatopbxh/top_battlemerit_lieu_success.txt",
                szDataLabel = "C«ng tr¹ng",
                fnDataStrFormal = WLib.MoneyFormat,
                tbAwardDef = {
                    [1] = {
                        szName = "Top 1 c«ng tr¹ng phe Liªu",
                        fnPrepareParam = _w_duatopbxh_PrepareParam,
                        tbAwards = {
                            { szName = "1 bé Uy Hæ So¸i+0 (khãa)", nFunc = "_w_duatopbxh_GiveUyHoSoai(0)" },
                            { szName = "Voi ChiÕn-§Ñp (khãa)", tbProp = { 0, 105, 30132 }, nStack = 1, nStatus = 4 },
                            { szName = "C¸n Khª Sa", tbProp = { 2, 1, 31558 }, nStack = 1, nStatus = 4 },
                            { szName = "15 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 15, 1)" },
                            { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 30, nStatus = 1 },
                            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 30, nStatus = 1 },
                            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 30, nStatus = 1 },
                            { szName = "1 bé V¨n Søc Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
                            { szName = "1 bé Kim Xµ Lv7+0", nFunc = "KsgAward:AddKimXa(7, 0, param1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 1 + 3 + 5,
                        },
                    },
                    [2] = {
                        szName = "Top 2 c«ng tr¹ng phe Liªu",
                        tbAwards = {
                            { szName = "1 bé Uy Hæ T­íng+0 (khãa)", nFunc = "_w_duatopbxh_GiveUyHoTuong(0)" },
                            { szName = "Tö Liªn Hoa-Rùc Rì (khãa)", tbProp = { 0, 105, 30151 }, nStack = 1, nStatus = 4 },
                            { szName = "L©m Giang Tiªn", tbProp = { 2, 1, 31559 }, nStack = 1, nStatus = 4 },
                            { szName = "10 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 10, 1)" },
                            { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 20, nStatus = 1 },
                            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 20, nStatus = 1 },
                            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 20, nStatus = 1 },
                            { szName = "1 bé V¨n Søc Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 1 + 5,
                        },
                    },
                    [3] = {
                        szName = "Top 3 c«ng tr¹ng phe Liªu",
                        tbAwards = {
                            { szName = "1 bé Uy Hæ T­íng+0 (khãa)", nFunc = "_w_duatopbxh_GiveUyHoTuong(0)" },
                            { szName = "BÐ B¸o Vµng-§Ñp (khãa)", tbProp = { 0, 105, 30129 }, nStack = 1, nStatus = 4 },
                            { szName = "5 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 5, 1)" },
                            { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 10, nStatus = 1 },
                            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 15, nStatus = 1 },
                            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 15, nStatus = 1 },
                            { szName = "1 bé V¨n Søc Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 5,
                        },
                    },
                }
        },
        [3] = { szName = "10 top cÊp toµn server",
                nTopLimit = 10,
                nTaskId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT,
                nTaskBitId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_LEVEL,
                szDataFilePath = "\\data\\warlord\\duatopbxh\\top_level_all.txt",
                szSuccessDataFilePath = "data/warlord/duatopbxh/top_level_all_success.txt",
                szDataLabel = "CÊp ®é",
                fnDataStrFormal = WLib.Level2ShortString,
                tbAwardDef = {
                    [1] = {
                        szName = "Top 1 cÊp toµn server",
                        fnPrepareParam = _w_duatopbxh_PrepareParam,
                        tbAwards = {
                            { szName = "1 bé S¸t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "H¾c Gi¸p ChiÕn Nghª-§Ñp (khãa)", tbProp = { 0, 105, 30184 }, nStack = 1, nStatus = 4 },
                            { szName = "5 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 5, 1)" },
                            { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 20, nStatus = 1 },
                            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 20, nStatus = 1 },
                            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 20, nStatus = 1 },
                            { szName = "1 bé Kim Xµ Lv7+0", nFunc = "KsgAward:AddKimXa(7, 0, param1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 5,
                        },
                    },
                    [2] = {
                        szName = "Top 2 cÊp toµn server",
                        fnPrepareParam = _w_duatopbxh_PrepareParam,
                        tbAwards = {
                            { szName = "1 bé S¸t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "B¹ch Lang-§Ñp (khãa)", tbProp = { 0, 105, 30186 }, nStack = 1, nStatus = 4 },
                            { szName = "4 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 4, 1)" },
                            { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 15, nStatus = 1 },
                            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 15, nStatus = 1 },
                            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 15, nStatus = 1 },
                            { szName = "1 bé Kim Xµ Lv7+0", nFunc = "KsgAward:AddKimXa(7, 0, param1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 5,
                        },
                    },
                    [3] = {
                        szName = "Top 3 cÊp toµn server",
                        fnPrepareParam = _w_duatopbxh_PrepareParam,
                        tbAwards = {
                            { szName = "1 bé S¸t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "ChiÕn Nghª-§Ñp (khãa)", tbProp = { 0, 105, 30182 }, nStack = 1, nStatus = 4 },
                            { szName = "3 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 3, 1)" },
                            { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 10, nStatus = 1 },
                            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 10, nStatus = 1 },
                            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 10, nStatus = 1 },
                            { szName = "1 bé Kim Xµ Lv7+0", nFunc = "KsgAward:AddKimXa(7, 0, param1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 5,
                        },
                    },
                    [4] = {
                        szName = "Top 4 cÊp toµn server",
                        tbAwards = {
                            { szName = "1 bé S¸t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "Tiªn H¹t C¸t-§Ñp (khãa)", tbProp = { 0, 105, 30197 }, nStack = 1, nStatus = 4 },
                            { szName = "3 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 3, 1)" },
                            { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 1 },
                            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 5, nStatus = 1 },
                            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 1 },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1,
                        },
                    },
                    [5] = {
                        szName = "Top 5 cÊp toµn server",
                        tbAwards = {
                            { szName = "1 bé S¸t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "Tiªn H¹t C¸t-§Ñp (khãa)", tbProp = { 0, 105, 30197 }, nStack = 1, nStatus = 4 },
                            { szName = "3 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 3, 1)" },
                            { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 1 },
                            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 5, nStatus = 1 },
                            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 1 },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1,
                        },
                    },
                    [6] = {
                        szName = "Top 6 cÊp toµn server",
                        tbAwards = {
                            { szName = "1 bé S¸t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "Tiªn H¹t C¸t-§Ñp (khãa)", tbProp = { 0, 105, 30197 }, nStack = 1, nStatus = 4 },
                            { szName = "3 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 3, 1)" },
                            { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 1 },
                            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 5, nStatus = 1 },
                            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 1 },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1,
                        },
                    },
                    [7] = {
                        szName = "Top 7 cÊp toµn server",
                        tbAwards = {
                            { szName = "1 bé S¸t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "Tiªn H¹t C¸t-§Ñp (khãa)", tbProp = { 0, 105, 30197 }, nStack = 1, nStatus = 4 },
                            { szName = "3 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 3, 1)" },
                            { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 1 },
                            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 5, nStatus = 1 },
                            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 1 },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1,
                        },
                    },
                    [8] = {
                        szName = "Top 8 cÊp toµn server",
                        tbAwards = {
                            { szName = "1 bé S¸t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "Tiªn H¹t C¸t-§Ñp (khãa)", tbProp = { 0, 105, 30197 }, nStack = 1, nStatus = 4 },
                            { szName = "3 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 3, 1)" },
                            { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 1 },
                            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 5, nStatus = 1 },
                            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 1 },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1,
                        },
                    },
                    [9] = {
                        szName = "Top 9 cÊp toµn server",
                        tbAwards = {
                            { szName = "1 bé S¸t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "Tiªn H¹t C¸t-§Ñp (khãa)", tbProp = { 0, 105, 30197 }, nStack = 1, nStatus = 4 },
                            { szName = "3 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 3, 1)" },
                            { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 1 },
                            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 5, nStatus = 1 },
                            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 1 },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1,
                        },
                    },
                    [10] = {
                        szName = "Top 10 cÊp toµn server",
                        tbAwards = {
                            { szName = "1 bé S¸t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "Tiªn H¹t C¸t-§Ñp (khãa)", tbProp = { 0, 105, 30197 }, nStack = 1, nStatus = 4 },
                            { szName = "3 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 3, 1)" },
                            { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 1 },
                            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 5, nStatus = 1 },
                            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 1 },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1,
                        },
                    },
                }
        },
    },

    tbTopData = {},
};

ff_GetTabFileTable(WDuaTopBXH.tbTopDef[1].szDataFilePath, 1, {
    tostring, --szLogTime
    tostring, --szAccount
    tostring, --szRoleName
    tonumber, --nRank
    tonumber, --nData
    tonumber, --nRoute
    tonumber, --nLevel
    tonumber, --nCamp
},
        function(tConfig)
            local nRank = tConfig[4];
            tConfig.n = nil;
            if WDuaTopBXH.tbTopData[1] == nil then
                WDuaTopBXH.tbTopData[1] = {};
            end
            WDuaTopBXH.tbTopData[1][nRank] = tConfig;
        end
);

ff_GetTabFileTable(WDuaTopBXH.tbTopDef[2].szDataFilePath, 1, {
    tostring, --szLogTime
    tostring, --szAccount
    tostring, --szRoleName
    tonumber, --nRank
    tonumber, --nData
    tonumber, --nRoute
    tonumber, --nLevel
    tonumber, --nCamp
},
        function(tConfig)
            local nRank = tConfig[4];
            tConfig.n = nil;
            if WDuaTopBXH.tbTopData[2] == nil then
                WDuaTopBXH.tbTopData[2] = {};
            end
            WDuaTopBXH.tbTopData[2][nRank] = tConfig;
        end
);

ff_GetTabFileTable(WDuaTopBXH.tbTopDef[3].szDataFilePath, 1, {
    tostring, --szLogTime
    tostring, --szAccount
    tostring, --szRoleName
    tonumber, --nRank
    tonumber, --nData
    tonumber, --nRoute
    tonumber, --nLevel
    tonumber, --nCamp
},
        function(tConfig)
            local nRank = tConfig[4];
            tConfig.n = nil;
            if WDuaTopBXH.tbTopData[3] == nil then
                WDuaTopBXH.tbTopData[3] = {};
            end
            WDuaTopBXH.tbTopData[3][nRank] = tConfig;
        end
);

function WDuaTopBXH:IsGetAward()
    local nRetCode = WEnv.FALSE;
    for nTopType = 1, getn(self.tbTopDef) do
        for nTaskBitId = 1, 31 do
            if WTask:GetBit(self.tbTopDef[nTopType].nTaskId, nTaskBitId) == 1 then
                nRetCode = WEnv.TRUE;
                break ;
            end
        end
        if nRetCode == WEnv.TRUE then
            break ;
        end
    end
    return nRetCode;
end

function WDuaTopBXH:GetAwardCondition(nType, nAwardIdx)
    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local tbAwardCondition = tbAwardDef[nAwardIdx].tbConditions or {};

    -- KiÓm tra level
    local tbCheckInfo = {};
    local nRetCode = enumWDuaTopBXHStatusCode.AWARD_CAN_GET;

    -- KiÓm tra cÊp ®é
    if tbAwardCondition.nLevelReq and tbAwardCondition.nLevelReq > 0 then
        local nPlayerLevel = WPlayer:GetBigLevel();
        if tbAwardCondition.nLevelReq > nPlayerLevel then
            tinsert(tbCheckInfo, format("<color=red>§¹t %s<color>", WLib:Level2String(tbAwardCondition.nLevelReq)));
            nRetCode = enumWDuaTopBXHStatusCode.AWARD_REQ_LEVEL;
        else
            tinsert(tbCheckInfo, format("<color=green>§¹t %s<color>", WLib:Level2String(tbAwardCondition.nLevelReq)));
        end
    end

    -- KiÓm tra gia nhËp m«n ph¸i
    if tbAwardCondition.bJoinRouteReq and tbAwardCondition.bJoinRouteReq == WEnv.TRUE then
        if WPlayer:IsJoinedRoute() ~= WEnv.TRUE then
            tinsert(tbCheckInfo, "<color=red>Gia nhËp m«n ph¸i<color>");
            nRetCode = enumWDuaTopBXHStatusCode.AWARD_REQ_JOIN_ROUTE;
        else
            tinsert(tbCheckInfo, "<color=green>Gia nhËp m«n ph¸i<color>");
        end
    end

    -- KiÓm tra søc lùc
    if tbAwardCondition.nRoomReq and tbAwardCondition.nRoomReq > 0 then
        if WLib:CheckInv(tbAwardCondition.nRoomReq + 3, 1000, WEnv.FALSE) ~= WEnv.TRUE then
            tinsert(tbCheckInfo, format("<color=red>Hµnh trang %d «<color>", tbAwardCondition.nRoomReq));
            tinsert(tbCheckInfo, "<color=red>Søc lùc 1000<color>");
            nRetCode = enumWDuaTopBXHStatusCode.AWARD_REQ_ROOM;
        else
            tinsert(tbCheckInfo, format("<color=green>Hµnh trang %d «<color>", tbAwardCondition.nRoomReq));
            tinsert(tbCheckInfo, "<color=green>Søc lùc 1000<color>");
        end
    end

    return nRetCode, tbCheckInfo;
end

function WDuaTopBXH:GetAwardItemName(nType, nAwardIdx)
    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local tbAwardItem = tbAwardDef[nAwardIdx].tbAwards;

    -- LÊy th«ng tin phÇn th­ëng
    local tbAwardItemName = {};
    for nItemDefineIdx = 1, getn(tbAwardItem) do
        if tbAwardItem[nItemDefineIdx] ~= WEnv.NULL then
            if type(tbAwardItem[nItemDefineIdx].tbProp) == 'table' then
                tinsert(tbAwardItemName, format("%d %s", tbAwardItem[nItemDefineIdx].nStack, tbAwardItem[nItemDefineIdx].szName));
            else
                tinsert(tbAwardItemName, tbAwardItem[nItemDefineIdx].szName);
            end
        end
    end
    return tbAwardItemName;
end

function WDuaTopBXH:ShowAwardList(nType)
    local tbSay = { format("<npcname>: §©y lµ danh s¸ch gi¶i th­ëng <color=yellow>%s<color>. \nMêi <sex> xem thö cã tªn m×nh kh«ng!\n" ..
            "    <color=white>%s  %s  %s  %s<color>",
            self.tbTopDef[nType].szName,
            WLib:Align("H¹ng", 4, 1),
            WLib:Align("Tªn nh©n vËt", 16, 1),
            WLib:Align(self.tbTopDef[nType].szDataLabel or "D÷ liÖu", 12, 1),
            WLib:Align("M«n ph¸i", 20, 1)
    --WLib:Align("CÊp", 6, 1),
    --WLib:Align("C«ng Tr¹ng", 16, 2),
    --WLib:Align("Phe", 6, 2)
    ) };
    local tbTopData = self.tbTopData[nType] or {};
    for nRow = 1, self.tbTopDef[nType].nTopLimit do
        local szAwardStatus = "";
        local szRoleName, nAwardIdx, nDataValue, nRoute = "ch­a cËp nhËp", 0, 0, 0;

        if tbTopData[nRow] ~= WEnv.NULL then
            szRoleName = WLib:Trim(tbTopData[nRow][3] or "");
            nAwardIdx = tbTopData[nRow][4];
            nDataValue = tbTopData[nRow][5];
            nRoute = tbTopData[nRow][6];
        end

        local tbGiveSuccessData = ff_GetTabFileTable("\\" .. WLib:Replace(self.tbTopDef[nType].szSuccessDataFilePath, "/", "\\"), 1, {
            tostring, --szLogTime
            tostring, --szAccount
            tostring, --szRoleName
            tonumber, --nAwardIdx
            tostring, --szAwardName
            tostring, --szAwardData
        });
        for nRowData = 1, getn(tbGiveSuccessData) do
            if tbGiveSuccessData[nRowData][4] == nAwardIdx then
                szAwardStatus = "(®· cã chñ nh©n)";
                break ;
            end
        end

        if szRoleName == WPlayer:GetName() then
            -- hiÓn thÞ nÕu nh©n vËt cã trong danh s¸ch
            if self:IsGetAward() == WEnv.TRUE then
                if WTask:GetBit(self.tbTopDef[nType].nTaskId, self.tbTopDef[nType].nTaskBitId) == 1 then
                    szAwardStatus = "(®· nhËn)"; -- ®èi víi phÇn th­ëng ®· nhËn th× míi hiÖn ch÷ ®· nhËn
                else
                    szAwardStatus = ""; -- c¸c phÇn th­ëng kh¸c nÕu k nhËn th× kh«ng hiÖn
                end
            elseif szAwardStatus == "" then
                szAwardStatus = "(cã thÓ nhËn)";
            end
        end

        local szData = tostring(nDataValue or "");
        if type(self.tbTopDef[nType].fnDataStrFormal) == "function" then
            szData = self.tbTopDef[nType].fnDataStrFormal(WLib, nDataValue);
        end

        tinsert(tbSay, format("  %s  %s  %s  %s  %s/#WDuaTopBXH:ShowAwardInfo(%d, %d)",
                WLib:Align(nAwardIdx, 4, 1),
                WLib:Align(szRoleName, 16, 1),
                WLib:Align(szData, 12, 1),
                WLib:Align(WPlayer:GetRouteName(nRoute, 0), 20, 1),
                szAwardStatus,
                nType, nAwardIdx));
    end

    tinsert(tbSay, "\nTa chØ xem qua th«i./nothing");
    WNpc:SayDialog(tbSay);
end

function WDuaTopBXH:ShowAwardInfo(nType, nAwardIdx)
    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local szAwardName = tbAwardDef[nAwardIdx].szName;
    local tbAwardItem = tbAwardDef[nAwardIdx].tbAwards;
    local nCheckCode, tbCheckInfo = self:GetAwardCondition(nType, nAwardIdx);

    -- KiÓm tra phÇn th­ëng kh«ng cßn n÷a
    if self.tbTopDef[nType] == WEnv.NULL or tbAwardDef[nAwardIdx] == WEnv.NULL then
        local tbSay = { "PhÇn th­ëng nµy ®· hÕt h¹n hoÆc kh«ng cßn xuÊt hiÖn trªn giang hå n÷a!" };
        tinsert(tbSay, "Ta ®· hiÓu råi./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- LÊy th«ng tin phÇn th­ëng
    local tbAwardItemName = self:GetAwardItemName(nType, nAwardIdx);

    local szRoleName = "";
    if self.tbTopData[nType] ~= WEnv.NULL and self.tbTopData[nType][nAwardIdx] ~= WEnv.NULL then
        szRoleName = WLib:Trim(self.tbTopData[nType][nAwardIdx][3] or "");
    end

    -- HiÓn thÞ ®iÒu kiÖn vµ trao th­ëng
    local tbSay = {};
    tinsert(tbSay, format("%s/#WDuaTopBXH:ShowAwardList(%d)", "\nXem l¹i danh s¸ch", nType));
    tinsert(tbSay, format("%s/nothing", "Ta chØ xem qua th«i"));

    local tbInfoLines = {};
    local szAwardStatus = "";

    local tbGiveSuccessData = ff_GetTabFileTable("\\" .. WLib:Replace(self.tbTopDef[nType].szSuccessDataFilePath, "/", "\\"), 1, {
        tostring, --szLogTime
        tostring, --szAccount
        tostring, --szRoleName
        tonumber, --nAwardIdx
        tostring, --szAwardName
        tostring, --szAwardData
    });
    for nRowData = 1, getn(tbGiveSuccessData) do
        if tbGiveSuccessData[nRowData][4] == nAwardIdx then
            szAwardStatus = "(<color=white>®· cã chñ nh©n<color>)";
            break ;
        end
    end

    if szAwardStatus == "" and szRoleName == WPlayer:GetName() and szRoleName ~= "" then
        if WTask:GetBit(self.tbTopDef[nType].nTaskId, self.tbTopDef[nType].nTaskBitId) == 1 then
            szAwardStatus = "(<color=white>®· nhËn<color>)";
        else
            if self:IsGetAward() ~= WEnv.TRUE then
                -- ®· nhËn phÇn th­ëng bÊt kú sÏ kh«ng hiÖn dßng nhËn th­ëng ra n÷a
                if nCheckCode == enumWDuaTopBXHStatusCode.AWARD_CAN_GET then
                    szAwardStatus = "(<color=green>cã thÓ nhËn<color>)";
                    tinsert(tbSay, 1, format("\nNhËn th­ëng/#WDuaTopBXH:GiveAward(%d, %d)", nType, nAwardIdx));
                else
                    szAwardStatus = "(<color=red>ch­a ®¹t yªu cÇu<color>)";
                end
                tbInfoLines[3] = format("\nYªu cÇu mµu ®á lµ ch­a ®¹t: \n%s", WLib:Join(tbCheckInfo, ", "));
            end
        end
    end

    tbInfoLines[1] = format("<color=green>%s %s<color>", szAwardName, szAwardStatus);
    tbInfoLines[2] = format("<color=yellow>%s<color>", WLib:Join(tbAwardItemName, "<color>, <color=yellow>"));

    -- ChÌn header lªn ®Çu table
    tinsert(tbSay, 1, WLib:Join(tbInfoLines, "\n"));
    WNpc:SayDialog(tbSay);
end

function WDuaTopBXH:GiveAward(nType, nAwardIdx, ...)
    --WNpc:Talk("PhÇn th­ëng nµy t¹m thêi ch­a thÓ nhËn!");
    --do return WEnv.RETCODE_NOTOPEN; end

    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local szAwardName = tbAwardDef[nAwardIdx].szName;
    local tbAwardItem = tbAwardDef[nAwardIdx].tbAwards;
    local nCheckCode, tbCheckInfo = self:GetAwardCondition(nType, nAwardIdx);

    -- KiÓm tra phÇn th­ëng kh«ng cßn n÷a
    if self.tbTopDef[nType] == WEnv.NULL or tbAwardDef[nAwardIdx] == WEnv.NULL then
        local tbSay = { "PhÇn th­ëng nµy ®· hÕt h¹n hoÆc kh«ng cßn xuÊt hiÖn trªn giang hå n÷a!" };
        tinsert(tbSay, "Ta ®· hiÓu råi./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- KiÓm tra ng­êi kh¸c ®· nhËn ch­a
    local tbGiveSuccessData = ff_GetTabFileTable("\\" .. WLib:Replace(self.tbTopDef[nType].szSuccessDataFilePath, "/", "\\"), 1, {
        tostring, --szLogTime
        tostring, --szAccount
        tostring, --szRoleName
        tonumber, --nAwardIdx
        tostring, --szAwardName
        tostring, --szAwardData
    });
    local bIsGiveSuccess = WEnv.FALSE;
    for nRowData = 1, getn(tbGiveSuccessData) do
        if tbGiveSuccessData[nRowData][4] == nAwardIdx then
            bIsGiveSuccess = WEnv.TRUE;
            break ;
        end
    end
    if bIsGiveSuccess == WEnv.TRUE then
        local tbSay = { "ThËt ®¸ng tiÕc, phÇn th­ëng nµy ®· cã chñ nh©n råi!" };
        tinsert(tbSay, "Ta ®· hiÓu råi./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- KiÓm tra cã ®óng ng­êi kh«ng
    local szRoleName = "";
    if self.tbTopData[nType] ~= WEnv.NULL then
        szRoleName = WLib:Trim(self.tbTopData[nType][nAwardIdx][3] or "");
    end
    if szRoleName ~= WPlayer:GetName() or szRoleName == "" then
        local tbSay = { "PhÇn th­ëng nµy kh«ng dµnh cho c¸c h¹!" };
        tinsert(tbSay, "Ta ®· hiÓu råi./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- KiÓm tra ®· nhËn råi ch­a
    if WTask:GetBit(self.tbTopDef[nType].nTaskId, self.tbTopDef[nType].nTaskBitId) ~= 0 then
        local tbSay = { "<sex> ®· nhËn phÇn th­ëng nµy tr­íc ®ã råi kh«ng thÓ nhËn thªm!" };
        tinsert(tbSay, "Ta ®· hiÓu råi./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- KiÓm tra chØ cho phÐp nhËn ®­îc 1 lo¹i phÇn th­ëng
    if self:IsGetAward() == WEnv.TRUE then
        local tbSay = { "<sex> tr­íc ®ã ®· nhËn th­ëng råi kh«ng thÓ nhËn thªm!" };
        tinsert(tbSay, "Ta ®· hiÓu råi./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- KiÓm tra hîp lÖ
    if nCheckCode ~= enumWDuaTopBXHStatusCode.AWARD_CAN_GET then
        local tbSay = { "B¹n kh«ng ®¹t ®iÒu kiÖn nhËn th­ëng mµu ®á d­íi ®©y: \n" .. WLib:Join(tbCheckInfo, ", ") };
        tinsert(tbSay, "Ta ®· hiÓu råi./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- Setup param cho quµ d¹ng fnFunc
    if type(tbAwardDef[nAwardIdx].fnPrepareParam) == "function" and getn(arg) == 0 then
        tbAwardDef[nAwardIdx].fnPrepareParam(nType, nAwardIdx);
        return WEnv.RETCODE_NEEDCONFIRM;
    end
    local tbAwardNew = new(tbAwardItem);
    for k, v in pairs(tbAwardNew) do
        if k ~= "n" and v ~= WEnv.NULL and v.nFunc ~= WEnv.NULL then
            for i = 1, getn(arg) do
                v.nFunc = WLib:Replace(v.nFunc, "param" .. i, arg[i]);
            end
        end
    end

    -- L­u phÇn th­ëng ®· nhËn råi
    WTask:SetBit(self.tbTopDef[nType].nTaskId, self.tbTopDef[nType].nTaskBitId, 1);

    -- NhËn quµ
    local nRetCode = WAward:Give(tbAwardNew, szAwardName);
    if nRetCode == WEnv.RETCODE_SUCCESS then
        local szAwardItemName = WLib:Join(self:GetAwardItemName(nType, nAwardIdx), ", ");
        local szLogTime = date('%Y-%m-%d %H:%M:%S');
        WFileLog:WriteTabFile(self.tbTopDef[nType].szSuccessDataFilePath,
                { szLogTime, WPlayer:GetAccount(), WPlayer:GetName() .. " ", nAwardIdx, szAwardItemName .. " ", nRetCode },
                { "szLogTime", "szAccount", "szRoleName", "nAwardIdx", "szAwardItemName", "szAwardData" });
    else
        WNpc:Talk("NhËn th­ëng thÊt b¹i, vui lßng liªn hÖ admin!", WEnv.TRUE);
    end
    return nRetCode;
end

----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-21
--- Description: c�c h�m li�n quan ��n ph�n th��ng �ua top d�a tr�n BXH
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
    KsgAward:Give(tbAward, 'Nh�n b� S�t Tinh')
end

--- H�m l�a ch�n cho ph�n th��ng nFunc
--- c�c param replace n�y ��u ki�u string, l�u � ��i l�i trong h�m x� l� c�a t�ng h�m ph�n th��ng
function _w_duatopbxh_PrepareParam(nType, nAwardIdx, nSelectKimXa7)
    --- param1
    if nSelectKimXa7 == WEnv.NULL then
        local tbSay = { "Ch�n <color=yellow>1 b� trang b� Kim x� d��i ��y<color>:" };

        for nTypeKimXa, szNameKimXa in g_tbKimXaCfg[7] do
            tinsert(tbSay, format("Ta mu�n nh�n b� %s/#_w_duatopbxh_PrepareParam(%d, %d, %d)",
                    szNameKimXa, nType, nAwardIdx, nTypeKimXa));
        end

        tinsert(tbSay, "\nT�m th�i ch�a mu�n nh�n./nothing");
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
        [1] = { szName = "3 top c�ng tr�ng phe T�ng",
                nTopLimit = 3,
                nTaskId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT,
                nTaskBitId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_MERIT,
                szDataFilePath = "\\data\\warlord\\duatopbxh\\top_battlemerit_tong.txt",
                szSuccessDataFilePath = "data/warlord/duatopbxh/top_battlemerit_tong_success.txt",
                szDataLabel = "C�ng tr�ng",
                fnDataStrFormal = WLib.MoneyFormat,
                tbAwardDef = {
                    [1] = {
                        szName = "Top 1 c�ng tr�ng phe T�ng",
                        fnPrepareParam = _w_duatopbxh_PrepareParam,
                        tbAwards = {
                            { szName = "1 b� Uy H� So�i+0 (kh�a)", nFunc = "_w_duatopbxh_GiveUyHoSoai(0)" },
                            { szName = "Voi Chi�n-��p (kh�a)", tbProp = { 0, 105, 30132 }, nStack = 1, nStatus = 4 },
                            { szName = "C�n Kh� Sa", tbProp = { 2, 1, 31558 }, nStack = 1, nStatus = 4 },
                            { szName = "15 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 15, 1)" },
                            { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 30, nStatus = 1 },
                            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 30, nStatus = 1 },
                            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 30, nStatus = 1 },
                            { szName = "1 b� V�n S�c Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
                            { szName = "1 b� Kim X� Lv7+0", nFunc = "KsgAward:AddKimXa(7, 0, param1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 1 + 3 + 5,
                        },
                    },
                    [2] = {
                        szName = "Top 2 c�ng tr�ng phe T�ng",
                        tbAwards = {
                            { szName = "1 b� Uy H� T��ng+0 (kh�a)", nFunc = "_w_duatopbxh_GiveUyHoTuong(0)" },
                            { szName = "T� Li�n Hoa-R�c R� (kh�a)", tbProp = { 0, 105, 30151 }, nStack = 1, nStatus = 4 },
                            { szName = "L�m Giang Ti�n", tbProp = { 2, 1, 31559 }, nStack = 1, nStatus = 4 },
                            { szName = "10 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 10, 1)" },
                            { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 20, nStatus = 1 },
                            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 20, nStatus = 1 },
                            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 20, nStatus = 1 },
                            { szName = "1 b� V�n S�c Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 1 + 5,
                        },
                    },
                    [3] = {
                        szName = "Top 3 c�ng tr�ng phe T�ng",
                        tbAwards = {
                            { szName = "1 b� Uy H� T��ng+0 (kh�a)", nFunc = "_w_duatopbxh_GiveUyHoTuong(0)" },
                            { szName = "B� B�o V�ng-��p (kh�a)", tbProp = { 0, 105, 30129 }, nStack = 1, nStatus = 4 },
                            { szName = "5 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 5, 1)" },
                            { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 10, nStatus = 1 },
                            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 15, nStatus = 1 },
                            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 15, nStatus = 1 },
                            { szName = "1 b� V�n S�c Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 5,
                        },
                    },
                }
        },
        [2] = { szName = "3 top c�ng tr�ng phe Li�u",
                nTopLimit = 3,
                nTaskId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT,
                nTaskBitId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_MERIT,
                szDataFilePath = "\\data\\warlord\\duatopbxh\\top_battlemerit_lieu.txt",
                szSuccessDataFilePath = "data/warlord/duatopbxh/top_battlemerit_lieu_success.txt",
                szDataLabel = "C�ng tr�ng",
                fnDataStrFormal = WLib.MoneyFormat,
                tbAwardDef = {
                    [1] = {
                        szName = "Top 1 c�ng tr�ng phe Li�u",
                        fnPrepareParam = _w_duatopbxh_PrepareParam,
                        tbAwards = {
                            { szName = "1 b� Uy H� So�i+0 (kh�a)", nFunc = "_w_duatopbxh_GiveUyHoSoai(0)" },
                            { szName = "Voi Chi�n-��p (kh�a)", tbProp = { 0, 105, 30132 }, nStack = 1, nStatus = 4 },
                            { szName = "C�n Kh� Sa", tbProp = { 2, 1, 31558 }, nStack = 1, nStatus = 4 },
                            { szName = "15 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 15, 1)" },
                            { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 30, nStatus = 1 },
                            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 30, nStatus = 1 },
                            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 30, nStatus = 1 },
                            { szName = "1 b� V�n S�c Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
                            { szName = "1 b� Kim X� Lv7+0", nFunc = "KsgAward:AddKimXa(7, 0, param1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 1 + 3 + 5,
                        },
                    },
                    [2] = {
                        szName = "Top 2 c�ng tr�ng phe Li�u",
                        tbAwards = {
                            { szName = "1 b� Uy H� T��ng+0 (kh�a)", nFunc = "_w_duatopbxh_GiveUyHoTuong(0)" },
                            { szName = "T� Li�n Hoa-R�c R� (kh�a)", tbProp = { 0, 105, 30151 }, nStack = 1, nStatus = 4 },
                            { szName = "L�m Giang Ti�n", tbProp = { 2, 1, 31559 }, nStack = 1, nStatus = 4 },
                            { szName = "10 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 10, 1)" },
                            { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 20, nStatus = 1 },
                            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 20, nStatus = 1 },
                            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 20, nStatus = 1 },
                            { szName = "1 b� V�n S�c Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 1 + 5,
                        },
                    },
                    [3] = {
                        szName = "Top 3 c�ng tr�ng phe Li�u",
                        tbAwards = {
                            { szName = "1 b� Uy H� T��ng+0 (kh�a)", nFunc = "_w_duatopbxh_GiveUyHoTuong(0)" },
                            { szName = "B� B�o V�ng-��p (kh�a)", tbProp = { 0, 105, 30129 }, nStack = 1, nStatus = 4 },
                            { szName = "5 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 5, 1)" },
                            { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 10, nStatus = 1 },
                            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 15, nStatus = 1 },
                            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 15, nStatus = 1 },
                            { szName = "1 b� V�n S�c Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 5,
                        },
                    },
                }
        },
        [3] = { szName = "10 top c�p to�n server",
                nTopLimit = 10,
                nTaskId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT,
                nTaskBitId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_LEVEL,
                szDataFilePath = "\\data\\warlord\\duatopbxh\\top_level_all.txt",
                szSuccessDataFilePath = "data/warlord/duatopbxh/top_level_all_success.txt",
                szDataLabel = "C�p ��",
                fnDataStrFormal = WLib.Level2ShortString,
                tbAwardDef = {
                    [1] = {
                        szName = "Top 1 c�p to�n server",
                        fnPrepareParam = _w_duatopbxh_PrepareParam,
                        tbAwards = {
                            { szName = "1 b� S�t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "H�c Gi�p Chi�n Ngh�-��p (kh�a)", tbProp = { 0, 105, 30184 }, nStack = 1, nStatus = 4 },
                            { szName = "5 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 5, 1)" },
                            { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 20, nStatus = 1 },
                            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 20, nStatus = 1 },
                            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 20, nStatus = 1 },
                            { szName = "1 b� Kim X� Lv7+0", nFunc = "KsgAward:AddKimXa(7, 0, param1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 5,
                        },
                    },
                    [2] = {
                        szName = "Top 2 c�p to�n server",
                        fnPrepareParam = _w_duatopbxh_PrepareParam,
                        tbAwards = {
                            { szName = "1 b� S�t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "B�ch Lang-��p (kh�a)", tbProp = { 0, 105, 30186 }, nStack = 1, nStatus = 4 },
                            { szName = "4 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 4, 1)" },
                            { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 15, nStatus = 1 },
                            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 15, nStatus = 1 },
                            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 15, nStatus = 1 },
                            { szName = "1 b� Kim X� Lv7+0", nFunc = "KsgAward:AddKimXa(7, 0, param1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 5,
                        },
                    },
                    [3] = {
                        szName = "Top 3 c�p to�n server",
                        fnPrepareParam = _w_duatopbxh_PrepareParam,
                        tbAwards = {
                            { szName = "1 b� S�t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "Chi�n Ngh�-��p (kh�a)", tbProp = { 0, 105, 30182 }, nStack = 1, nStatus = 4 },
                            { szName = "3 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 3, 1)" },
                            { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 10, nStatus = 1 },
                            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 10, nStatus = 1 },
                            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 10, nStatus = 1 },
                            { szName = "1 b� Kim X� Lv7+0", nFunc = "KsgAward:AddKimXa(7, 0, param1, 1)" },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 5,
                        },
                    },
                    [4] = {
                        szName = "Top 4 c�p to�n server",
                        tbAwards = {
                            { szName = "1 b� S�t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "Ti�n H�t C�t-��p (kh�a)", tbProp = { 0, 105, 30197 }, nStack = 1, nStatus = 4 },
                            { szName = "3 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 3, 1)" },
                            { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 1 },
                            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 5, nStatus = 1 },
                            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 1 },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1,
                        },
                    },
                    [5] = {
                        szName = "Top 5 c�p to�n server",
                        tbAwards = {
                            { szName = "1 b� S�t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "Ti�n H�t C�t-��p (kh�a)", tbProp = { 0, 105, 30197 }, nStack = 1, nStatus = 4 },
                            { szName = "3 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 3, 1)" },
                            { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 1 },
                            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 5, nStatus = 1 },
                            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 1 },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1,
                        },
                    },
                    [6] = {
                        szName = "Top 6 c�p to�n server",
                        tbAwards = {
                            { szName = "1 b� S�t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "Ti�n H�t C�t-��p (kh�a)", tbProp = { 0, 105, 30197 }, nStack = 1, nStatus = 4 },
                            { szName = "3 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 3, 1)" },
                            { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 1 },
                            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 5, nStatus = 1 },
                            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 1 },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1,
                        },
                    },
                    [7] = {
                        szName = "Top 7 c�p to�n server",
                        tbAwards = {
                            { szName = "1 b� S�t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "Ti�n H�t C�t-��p (kh�a)", tbProp = { 0, 105, 30197 }, nStack = 1, nStatus = 4 },
                            { szName = "3 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 3, 1)" },
                            { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 1 },
                            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 5, nStatus = 1 },
                            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 1 },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1,
                        },
                    },
                    [8] = {
                        szName = "Top 8 c�p to�n server",
                        tbAwards = {
                            { szName = "1 b� S�t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "Ti�n H�t C�t-��p (kh�a)", tbProp = { 0, 105, 30197 }, nStack = 1, nStatus = 4 },
                            { szName = "3 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 3, 1)" },
                            { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 1 },
                            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 5, nStatus = 1 },
                            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 1 },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1,
                        },
                    },
                    [9] = {
                        szName = "Top 9 c�p to�n server",
                        tbAwards = {
                            { szName = "1 b� S�t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "Ti�n H�t C�t-��p (kh�a)", tbProp = { 0, 105, 30197 }, nStack = 1, nStatus = 4 },
                            { szName = "3 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 3, 1)" },
                            { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 1 },
                            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 5, nStatus = 1 },
                            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 1 },
                        },
                        tbConditions = {
                            nRoomReq = 6 + 1 + 1 + 1 + 1 + 1,
                        },
                    },
                    [10] = {
                        szName = "Top 10 c�p to�n server",
                        tbAwards = {
                            { szName = "1 b� S�t Tinh+0", nFunc = "_w_duatopbxh_GiveSatTinh(0, 1)" },
                            { szName = "Ti�n H�t C�t-��p (kh�a)", tbProp = { 0, 105, 30197 }, nStack = 1, nStatus = 4 },
                            { szName = "3 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 3, 1)" },
                            { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 1 },
                            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 5, nStatus = 1 },
                            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 1 },
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

    -- Ki�m tra level
    local tbCheckInfo = {};
    local nRetCode = enumWDuaTopBXHStatusCode.AWARD_CAN_GET;

    -- Ki�m tra c�p ��
    if tbAwardCondition.nLevelReq and tbAwardCondition.nLevelReq > 0 then
        local nPlayerLevel = WPlayer:GetBigLevel();
        if tbAwardCondition.nLevelReq > nPlayerLevel then
            tinsert(tbCheckInfo, format("<color=red>��t %s<color>", WLib:Level2String(tbAwardCondition.nLevelReq)));
            nRetCode = enumWDuaTopBXHStatusCode.AWARD_REQ_LEVEL;
        else
            tinsert(tbCheckInfo, format("<color=green>��t %s<color>", WLib:Level2String(tbAwardCondition.nLevelReq)));
        end
    end

    -- Ki�m tra gia nh�p m�n ph�i
    if tbAwardCondition.bJoinRouteReq and tbAwardCondition.bJoinRouteReq == WEnv.TRUE then
        if WPlayer:IsJoinedRoute() ~= WEnv.TRUE then
            tinsert(tbCheckInfo, "<color=red>Gia nh�p m�n ph�i<color>");
            nRetCode = enumWDuaTopBXHStatusCode.AWARD_REQ_JOIN_ROUTE;
        else
            tinsert(tbCheckInfo, "<color=green>Gia nh�p m�n ph�i<color>");
        end
    end

    -- Ki�m tra s�c l�c
    if tbAwardCondition.nRoomReq and tbAwardCondition.nRoomReq > 0 then
        if WLib:CheckInv(tbAwardCondition.nRoomReq + 3, 1000, WEnv.FALSE) ~= WEnv.TRUE then
            tinsert(tbCheckInfo, format("<color=red>H�nh trang %d �<color>", tbAwardCondition.nRoomReq));
            tinsert(tbCheckInfo, "<color=red>S�c l�c 1000<color>");
            nRetCode = enumWDuaTopBXHStatusCode.AWARD_REQ_ROOM;
        else
            tinsert(tbCheckInfo, format("<color=green>H�nh trang %d �<color>", tbAwardCondition.nRoomReq));
            tinsert(tbCheckInfo, "<color=green>S�c l�c 1000<color>");
        end
    end

    return nRetCode, tbCheckInfo;
end

function WDuaTopBXH:GetAwardItemName(nType, nAwardIdx)
    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local tbAwardItem = tbAwardDef[nAwardIdx].tbAwards;

    -- L�y th�ng tin ph�n th��ng
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
    local tbSay = { format("<npcname>: ��y l� danh s�ch gi�i th��ng <color=yellow>%s<color>. \nM�i <sex> xem th� c� t�n m�nh kh�ng!\n" ..
            "    <color=white>%s  %s  %s  %s<color>",
            self.tbTopDef[nType].szName,
            WLib:Align("H�ng", 4, 1),
            WLib:Align("T�n nh�n v�t", 16, 1),
            WLib:Align(self.tbTopDef[nType].szDataLabel or "D� li�u", 12, 1),
            WLib:Align("M�n ph�i", 20, 1)
    --WLib:Align("C�p", 6, 1),
    --WLib:Align("C�ng Tr�ng", 16, 2),
    --WLib:Align("Phe", 6, 2)
    ) };
    local tbTopData = self.tbTopData[nType] or {};
    for nRow = 1, self.tbTopDef[nType].nTopLimit do
        local szAwardStatus = "";
        local szRoleName, nAwardIdx, nDataValue, nRoute = "ch�a c�p nh�p", 0, 0, 0;

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
                szAwardStatus = "(�� c� ch� nh�n)";
                break ;
            end
        end

        if szRoleName == WPlayer:GetName() then
            -- hi�n th� n�u nh�n v�t c� trong danh s�ch
            if self:IsGetAward() == WEnv.TRUE then
                if WTask:GetBit(self.tbTopDef[nType].nTaskId, self.tbTopDef[nType].nTaskBitId) == 1 then
                    szAwardStatus = "(�� nh�n)"; -- ��i v�i ph�n th��ng �� nh�n th� m�i hi�n ch� �� nh�n
                else
                    szAwardStatus = ""; -- c�c ph�n th��ng kh�c n�u k nh�n th� kh�ng hi�n
                end
            elseif szAwardStatus == "" then
                szAwardStatus = "(c� th� nh�n)";
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

    tinsert(tbSay, "\nTa ch� xem qua th�i./nothing");
    WNpc:SayDialog(tbSay);
end

function WDuaTopBXH:ShowAwardInfo(nType, nAwardIdx)
    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local szAwardName = tbAwardDef[nAwardIdx].szName;
    local tbAwardItem = tbAwardDef[nAwardIdx].tbAwards;
    local nCheckCode, tbCheckInfo = self:GetAwardCondition(nType, nAwardIdx);

    -- Ki�m tra ph�n th��ng kh�ng c�n n�a
    if self.tbTopDef[nType] == WEnv.NULL or tbAwardDef[nAwardIdx] == WEnv.NULL then
        local tbSay = { "Ph�n th��ng n�y �� h�t h�n ho�c kh�ng c�n xu�t hi�n tr�n giang h� n�a!" };
        tinsert(tbSay, "Ta �� hi�u r�i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- L�y th�ng tin ph�n th��ng
    local tbAwardItemName = self:GetAwardItemName(nType, nAwardIdx);

    local szRoleName = "";
    if self.tbTopData[nType] ~= WEnv.NULL and self.tbTopData[nType][nAwardIdx] ~= WEnv.NULL then
        szRoleName = WLib:Trim(self.tbTopData[nType][nAwardIdx][3] or "");
    end

    -- Hi�n th� �i�u ki�n v� trao th��ng
    local tbSay = {};
    tinsert(tbSay, format("%s/#WDuaTopBXH:ShowAwardList(%d)", "\nXem l�i danh s�ch", nType));
    tinsert(tbSay, format("%s/nothing", "Ta ch� xem qua th�i"));

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
            szAwardStatus = "(<color=white>�� c� ch� nh�n<color>)";
            break ;
        end
    end

    if szAwardStatus == "" and szRoleName == WPlayer:GetName() and szRoleName ~= "" then
        if WTask:GetBit(self.tbTopDef[nType].nTaskId, self.tbTopDef[nType].nTaskBitId) == 1 then
            szAwardStatus = "(<color=white>�� nh�n<color>)";
        else
            if self:IsGetAward() ~= WEnv.TRUE then
                -- �� nh�n ph�n th��ng b�t k� s� kh�ng hi�n d�ng nh�n th��ng ra n�a
                if nCheckCode == enumWDuaTopBXHStatusCode.AWARD_CAN_GET then
                    szAwardStatus = "(<color=green>c� th� nh�n<color>)";
                    tinsert(tbSay, 1, format("\nNh�n th��ng/#WDuaTopBXH:GiveAward(%d, %d)", nType, nAwardIdx));
                else
                    szAwardStatus = "(<color=red>ch�a ��t y�u c�u<color>)";
                end
                tbInfoLines[3] = format("\nY�u c�u m�u �� l� ch�a ��t: \n%s", WLib:Join(tbCheckInfo, ", "));
            end
        end
    end

    tbInfoLines[1] = format("<color=green>%s %s<color>", szAwardName, szAwardStatus);
    tbInfoLines[2] = format("<color=yellow>%s<color>", WLib:Join(tbAwardItemName, "<color>, <color=yellow>"));

    -- Ch�n header l�n ��u table
    tinsert(tbSay, 1, WLib:Join(tbInfoLines, "\n"));
    WNpc:SayDialog(tbSay);
end

function WDuaTopBXH:GiveAward(nType, nAwardIdx, ...)
    --WNpc:Talk("Ph�n th��ng n�y t�m th�i ch�a th� nh�n!");
    --do return WEnv.RETCODE_NOTOPEN; end

    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local szAwardName = tbAwardDef[nAwardIdx].szName;
    local tbAwardItem = tbAwardDef[nAwardIdx].tbAwards;
    local nCheckCode, tbCheckInfo = self:GetAwardCondition(nType, nAwardIdx);

    -- Ki�m tra ph�n th��ng kh�ng c�n n�a
    if self.tbTopDef[nType] == WEnv.NULL or tbAwardDef[nAwardIdx] == WEnv.NULL then
        local tbSay = { "Ph�n th��ng n�y �� h�t h�n ho�c kh�ng c�n xu�t hi�n tr�n giang h� n�a!" };
        tinsert(tbSay, "Ta �� hi�u r�i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- Ki�m tra ng��i kh�c �� nh�n ch�a
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
        local tbSay = { "Th�t ��ng ti�c, ph�n th��ng n�y �� c� ch� nh�n r�i!" };
        tinsert(tbSay, "Ta �� hi�u r�i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- Ki�m tra c� ��ng ng��i kh�ng
    local szRoleName = "";
    if self.tbTopData[nType] ~= WEnv.NULL then
        szRoleName = WLib:Trim(self.tbTopData[nType][nAwardIdx][3] or "");
    end
    if szRoleName ~= WPlayer:GetName() or szRoleName == "" then
        local tbSay = { "Ph�n th��ng n�y kh�ng d�nh cho c�c h�!" };
        tinsert(tbSay, "Ta �� hi�u r�i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- Ki�m tra �� nh�n r�i ch�a
    if WTask:GetBit(self.tbTopDef[nType].nTaskId, self.tbTopDef[nType].nTaskBitId) ~= 0 then
        local tbSay = { "<sex> �� nh�n ph�n th��ng n�y tr��c �� r�i kh�ng th� nh�n th�m!" };
        tinsert(tbSay, "Ta �� hi�u r�i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- Ki�m tra ch� cho ph�p nh�n ���c 1 lo�i ph�n th��ng
    if self:IsGetAward() == WEnv.TRUE then
        local tbSay = { "<sex> tr��c �� �� nh�n th��ng r�i kh�ng th� nh�n th�m!" };
        tinsert(tbSay, "Ta �� hi�u r�i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- Ki�m tra h�p l�
    if nCheckCode ~= enumWDuaTopBXHStatusCode.AWARD_CAN_GET then
        local tbSay = { "B�n kh�ng ��t �i�u ki�n nh�n th��ng m�u �� d��i ��y: \n" .. WLib:Join(tbCheckInfo, ", ") };
        tinsert(tbSay, "Ta �� hi�u r�i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- Setup param cho qu� d�ng fnFunc
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

    -- L�u ph�n th��ng �� nh�n r�i
    WTask:SetBit(self.tbTopDef[nType].nTaskId, self.tbTopDef[nType].nTaskBitId, 1);

    -- Nh�n qu�
    local nRetCode = WAward:Give(tbAwardNew, szAwardName);
    if nRetCode == WEnv.RETCODE_SUCCESS then
        local szAwardItemName = WLib:Join(self:GetAwardItemName(nType, nAwardIdx), ", ");
        local szLogTime = date('%Y-%m-%d %H:%M:%S');
        WFileLog:WriteTabFile(self.tbTopDef[nType].szSuccessDataFilePath,
                { szLogTime, WPlayer:GetAccount(), WPlayer:GetName() .. " ", nAwardIdx, szAwardItemName .. " ", nRetCode },
                { "szLogTime", "szAccount", "szRoleName", "nAwardIdx", "szAwardItemName", "szAwardData" });
    else
        WNpc:Talk("Nh�n th��ng th�t b�i, vui l�ng li�n h� admin!", WEnv.TRUE);
    end
    return nRetCode;
end

----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-08-17
--- Description: qu� th�ng c�p v� m�t s� h�m cho ng��i ch�i m�i
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\functions\\function_book.lua");
----------------------------------------------------------------------------------------------------
function _w_newbieaward_UpLevel(nBigLevel, nRebornRoute)
    nBigLevel = tonumber(nBigLevel) or 0;
    if nBigLevel == 0 then
        return WEnv.RETCODE_ERROR;
    end

    if nBigLevel > 99 then
        if nRebornRoute == WEnv.NULL then
            local tbSay = { "H�y ch�n h��ng chuy�n sinh ph� h�p:" };
            for _nRebornRoute, _szRouteName in g_tbRebornRouteNames do
                tinsert(tbSay, format("Chuy�n sinh theo h��ng %s/#_w_newbieaward_UpLevel(%d, %d)", _szRouteName, nBigLevel, _nRebornRoute));
            end

            tinsert(tbSay, "\nT�m th�i ch�a mu�n nh�n./nothing");
            WNpc:SayDialog(tbSay);
            return WEnv.RETCODE_NEEDCONFIRM;
        end
    end

    nRebornRoute = tonumber(nRebornRoute);
    KsgReborn:PlayerRebornWithNews(nBigLevel, nRebornRoute);
end

function _w_newbieaward_GiveBattleSuit(nSuitType, nEnhanceLevel, nBattleCamp)
    nSuitType = tonumber(nSuitType) or 0;
    nEnhanceLevel = tonumber(nEnhanceLevel) or 0;

    if nBattleCamp == WEnv.NULL then
        local nCampPoint = WPlayer:GetHonor(WEnv.TRUE);
        if nCampPoint == 0 then
            local tbSay = { "H�y ch�n phe chi�n tr��ng:" };
            tinsert(tbSay, format("Gia nh�p v� nh�n trang b� phe %s/#_w_newbieaward_GiveBattleSuit(%d, %d)", WEnv.BATTLECAMP_NAMES[WEnv.BATTLECAMP_TONG], nEnhanceLevel, WEnv.BATTLECAMP_TONG));
            tinsert(tbSay, format("Gia nh�p v� nh�n trang b� phe %s/#_w_newbieaward_GiveBattleSuit(%d, %d)", WEnv.BATTLECAMP_NAMES[WEnv.BATTLECAMP_LIEU], nEnhanceLevel, WEnv.BATTLECAMP_LIEU));

            tinsert(tbSay, "\nT�m th�i ch�a mu�n nh�n./nothing");
            WNpc:SayDialog(tbSay);
            return WEnv.RETCODE_NEEDCONFIRM;
        elseif nCampPoint > 0 then
            nBattleCamp = WEnv.BATTLECAMP_TONG;
        else
            nBattleCamp = WEnv.BATTLECAMP_LIEU;
        end
    end

    nBattleCamp = tonumber(nBattleCamp or WEnv.BATTLECAMP_TONG);
    if nBattleCamp == WEnv.BATTLECAMP_TONG then
        if WTask:Get(704) == 0 then
            WTask:Set(704, 1);
        end
        if WTask:Get(701) == 0 then
            WTask:Set(701, 1);
        end
    elseif nBattleCamp == WEnv.BATTLECAMP_LIEU then
        if WTask:Get(704) == 0 then
            WTask:Set(704, -1);
        end
        if WTask:Get(701) == 0 then
            WTask:Set(701, -1);
        end
    end

    if nSuitType == 1 then
        KsgItem:AddBattleSuit_HoaPhung_Tuong(nEnhanceLevel);
    end
end

--- H�m l�a ch�n cho ph�n th��ng nFunc, nAwardIdx l� param0
--- c�c param replace n�y ��u ki�u string, l�u � ��i l�i trong h�m x� l� c�a t�ng h�m ph�n th��ng
function _w_newbieaward_PrepareParam(nAwardIdx, nRebornRoute, nBattleCamp)
    --- param1
    if nRebornRoute == WEnv.NULL then
        local tbSay = { "H�y ch�n h��ng chuy�n sinh ph� h�p:" };
        for _nRebornRoute, _szRouteName in g_tbRebornRouteNames do
            tinsert(tbSay, format("Chuy�n sinh theo h��ng %s/#WNewbieAward.tbAwardDef[%d].fnPrepareParam(%d, %d)", _szRouteName, nAwardIdx, nAwardIdx, _nRebornRoute));
        end

        tinsert(tbSay, "\nT�m th�i ch�a mu�n nh�n./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    --- param2
    if nBattleCamp == WEnv.NULL then
        local nCampPoint = WPlayer:GetHonor(WEnv.TRUE);
        if nCampPoint == 0 then
            local tbSay = { "H�y ch�n phe chi�n tr��ng:" };
            tinsert(tbSay, format("Gia nh�p phe %s/#WNewbieAward.tbAwardDef[%d].fnPrepareParam(%d, %d, %d)", WEnv.BATTLECAMP_NAMES[WEnv.BATTLECAMP_TONG], nAwardIdx, nAwardIdx, nRebornRoute, WEnv.BATTLECAMP_TONG));
            tinsert(tbSay, format("Gia nh�p phe %s/#WNewbieAward.tbAwardDef[%d].fnPrepareParam(%d, %d, %d)", WEnv.BATTLECAMP_NAMES[WEnv.BATTLECAMP_LIEU], nAwardIdx, nAwardIdx, nRebornRoute, WEnv.BATTLECAMP_LIEU));

            tinsert(tbSay, "\nT�m th�i ch�a mu�n nh�n./nothing");
            WNpc:SayDialog(tbSay);
            return WEnv.RETCODE_NEEDCONFIRM;
        elseif nCampPoint > 0 then
            nBattleCamp = WEnv.BATTLECAMP_TONG;
        else
            nBattleCamp = WEnv.BATTLECAMP_LIEU;
        end
    end

    WNewbieAward:GiveAward(nAwardIdx, nRebornRoute, nBattleCamp);
    return WEnv.RETCODE_SUCCESS;
end

enumWNewbieAwardStatusCode = {
    AWARD_CAN_GET = 1,
    AWARD_HAS_GET = 2,
    AWARD_NOT_AVAILABLE = 3,
    AWARD_NEED_GET_BEFORE = 4,
    AWARD_REQ_LEVEL = 5,
    AWARD_REQ_JOIN_ROUTE = 6,
    AWARD_REQ_ROOM = 7,
};
WNewbieAward = {
    tbAwardDef = {
        [1] = {
            szName = "Nh�n th��ng ��t c�p 73",
            fnPrepareParam = _w_newbieaward_PrepareParam,
            tbAwards = {
                { szName = "Tr�c ti�p chuy�n sinh 7 c�p 98", nFunc = "_w_newbieaward_UpLevel(798, param1)" },
                { szName = "Th�n h�nh b�o �i�n", tbProp = { 0, 200, 40 }, nStack = 1, nStatus = 4 },
                { szName = "B�t Tr�n Ch�u", tbProp = { 2, 102, 215 }, nStack = 200, nStatus = 4 },
                { szName = "1 b� H�a Ph�ng T��ng+0", nFunc = "_w_newbieaward_GiveBattleSuit(1, 0, param2)" },
                { szName = "T�i �� Qu� C�p 3", tbProp = { 2, 1, 31000 }, nStack = 20, nStatus = 4 },
                { szName = "K�ch ho�t kinh m�ch V� T�n", nFunc = "KsgPlayer:MeridianLevelUp(4)" },
                { szName = "1 b� v�n s�c c�p 2+0", nFunc = "KsgAward:SetVanSuc(2)" },
                { szName = "1 b� Di�u D��ng+0", nFunc = "KsgAward:SetDieuDuong(0, 4)" },
                { szName = "1 b� V� H� H�o Hi�p+0", nFunc = "KsgAward:SetLenhBaiVoHaHaoHiep(0)" },
                { szName = "3 b� Kim x� 4+0", nFunc = "kgm_NhanKimXa(4, 0)" },
                { szName = "1 M�t t�ch 70 si�u c�p luy�n s�n 10t 4pl 95%", nFunc = "_w_book_AddBookByType(1,5,10,4,95,95,95,95)" },
                { szName = "M�nh M�t T�ch Cao C�p", tbProp = { 2, 1, 40026 }, nStack = 30, nStatus = 4 },
                { szName = "R��ng Y�u Quy�t_S�", tbProp = { 2, 1, 50005 }, nStack = 2, nStatus = 4 },
                { szName = "L�ng Ba Vi B� to�n t�p", tbProp = { 0, 112, 158 }, nStack = 1, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 73,
                nRoomReq = 1 + 1 + 7 + 1 + 1 + 5 + 6 + 9 + 1 + 9 + 1 + 1 + 1,
                bJoinRouteReq = WEnv.TRUE,
            },
        },
        [2] = {
            szName = "Nh�n th��ng ��t chuy�n sinh 7 c�p 99",
            fnPrepareParam = _w_newbieaward_PrepareParam,
            tbAwards = {
                { szName = "Tr�c ti�p chuy�n sinh 8 c�p 95", nFunc = "_w_newbieaward_UpLevel(895, param1)" },
                { szName = "Thi�t Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 200, nStatus = 4 },
                { szName = "B�t Tr�n Ch�u", tbProp = { 2, 102, 215 }, nStack = 300, nStatus = 4 },
                { szName = "T�i �� Qu� C�p 4", tbProp = { 2, 1, 31001 }, nStack = 10, nStatus = 4 },
                { szName = "��ng T� Chi Nguy�n", tbProp = { 2, 1, 30913 }, nStack = 30, nStatus = 4 },
                { szName = "Hi�p Ngh�a Chi Ch�ng", tbProp = { 2, 1, 30912 }, nStack = 200, nStatus = 4 },
                { szName = "H�i Ti�n ��n", tbProp = { 2, 1, 30847 }, nStack = 200, nStatus = 4 },
                { szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 2, nStatus = 4 },
                { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 1, nStatus = 4 },
                { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 799,
                nRoomReq = 9,
                bJoinRouteReq = WEnv.TRUE,
            },
        },
        [3] = {
            szName = "Nh�n th��ng ��t chuy�n sinh 8 c�p 99",
            fnPrepareParam = _w_newbieaward_PrepareParam,
            tbAwards = {
                { szName = "Tr�c ti�p chuy�n sinh 9 c�p 95", nFunc = "_w_newbieaward_UpLevel(995, param1)" },
                { szName = "Thi�t Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 200, nStatus = 4 },
                { szName = "B�t Tr�n Ch�u", tbProp = { 2, 102, 215 }, nStack = 300, nStatus = 4 },
                { szName = "T�i �� Qu� C�p 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                { szName = "��ng T� Chi Nguy�n", tbProp = { 2, 1, 30913 }, nStack = 30, nStatus = 4 },
                { szName = "Hi�p Ngh�a Chi Ch�ng", tbProp = { 2, 1, 30912 }, nStack = 200, nStatus = 4 },
                { szName = "H�i Ti�n ��n", tbProp = { 2, 1, 30847 }, nStack = 200, nStatus = 4 },
                { szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 4 },
                { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 899,
                nRoomReq = 9,
            },
        },
        [4] = {
            szName = "Nh�n th��ng ��t chuy�n sinh 9 c�p 99",
            fnPrepareParam = _w_newbieaward_PrepareParam,
            tbAwards = {
                { szName = "Tr�c ti�p chuy�n sinh 10 c�p 90", nFunc = "_w_newbieaward_UpLevel(1090, param1)" },
                { szName = "Thi�t Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 200, nStatus = 4 },
                { szName = "B�t Tr�n Ch�u", tbProp = { 2, 102, 215 }, nStack = 500, nStatus = 4 },
                { szName = "T�i �� Qu� C�p 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                { szName = "��ng T� Chi Nguy�n", tbProp = { 2, 1, 30913 }, nStack = 30, nStatus = 4 },
                { szName = "Hi�p Ngh�a Chi Ch�ng", tbProp = { 2, 1, 30912 }, nStack = 100, nStatus = 4 },
                { szName = "H�i Ti�n ��n", tbProp = { 2, 1, 30847 }, nStack = 50, nStatus = 4 },
                { szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 4 },
                { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 999,
                nRoomReq = 9,
            },
        },
        [5] = {
            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 95",
            tbAwards = {
                { szName = "Thi�t Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 200, nStatus = 4 },
                { szName = "Tr�ng Th� C�ng-Si�u", tbProp = { 2, 1, 31169 }, nStack = 5, nStatus = 4 },
                { szName = "B�t Tr�n Ch�u", tbProp = { 2, 102, 215 }, nStack = 500, nStatus = 4 },
                { szName = "T�i �� Qu� C�p 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                { szName = "��ng T� Chi Nguy�n", tbProp = { 2, 1, 30913 }, nStack = 50, nStatus = 4 },
                { szName = "Hi�p Ngh�a Chi Ch�ng", tbProp = { 2, 1, 30912 }, nStack = 100, nStatus = 4 },
                { szName = "H�i Ti�n ��n", tbProp = { 2, 1, 30847 }, nStack = 50, nStatus = 4 },
                { szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 4 },
                { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = 4 },
                { szName = "Th��ng H�i Ch�u C�p 7 (Ch�a gi�m ��nh)", tbProp = { 2, 102, 214 }, nStack = 1, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 1095,
                nRoomReq = 11,
            },
        },
        [6] = {
            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 96",
            tbAwards = {
                { szName = "M�nh C� Quan M�c Gia", tbProp = { 2, 1, 31244 }, nStack = 200, nStatus = 4 },
                { szName = "Tr�ng Th� C�ng-Si�u", tbProp = { 2, 1, 31169 }, nStack = 5, nStatus = 4 },
                { szName = "B�t Tr�n Ch�u", tbProp = { 2, 102, 215 }, nStack = 500, nStatus = 4 },
                { szName = "T�i �� Qu� C�p 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                { szName = "Thi�t Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 50, nStatus = 4 },
                { szName = "��ng T� Chi Nguy�n", tbProp = { 2, 1, 30913 }, nStack = 50, nStatus = 4 },
                { szName = "H�i Ti�n ��n", tbProp = { 2, 1, 30847 }, nStack = 50, nStatus = 4 },
                { szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 1, nStatus = 4 },
                { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = 4 },
                { szName = "Th��ng H�i Ch�u C�p 7 (Ch�a gi�m ��nh)", tbProp = { 2, 102, 214 }, nStack = 1, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 1096,
                nRoomReq = 11,
            },
        },
        [7] = {
            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 97",
            tbAwards = {
                { szName = "M�nh C� Quan M�c Gia", tbProp = { 2, 1, 31244 }, nStack = 200, nStatus = 4 },
                { szName = "Tr�ng Th� C�ng-Si�u", tbProp = { 2, 1, 31169 }, nStack = 5, nStatus = 4 },
                { szName = "B�t Tr�n Ch�u", tbProp = { 2, 102, 215 }, nStack = 500, nStatus = 4 },
                { szName = "T�i �� Qu� C�p 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                { szName = "Thi�t Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 50, nStatus = 4 },
                { szName = "Hi�p Ngh�a Chi Ch�ng", tbProp = { 2, 1, 30912 }, nStack = 50, nStatus = 4 },
                { szName = "H�i Ti�n ��n", tbProp = { 2, 1, 30847 }, nStack = 50, nStatus = 4 },
                { szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 1, nStatus = 4 },
                { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = 4 },
                { szName = "Th��ng H�i Ch�u C�p 7 (Ch�a gi�m ��nh)", tbProp = { 2, 102, 214 }, nStack = 2, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 1097,
                nRoomReq = 11,
            },
        },
        [8] = {
            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 98",
            tbAwards = {
                { szName = "M�nh C� Quan M�c Gia", tbProp = { 2, 1, 31244 }, nStack = 200, nStatus = 4 },
                { szName = "Tr�ng Th� C�ng-Si�u", tbProp = { 2, 1, 31169 }, nStack = 5, nStatus = 4 },
                { szName = "B�t Tr�n Ch�u", tbProp = { 2, 102, 215 }, nStack = 500, nStatus = 4 },
                { szName = "T�i �� Qu� C�p 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                { szName = "Thi�t Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 50, nStatus = 4 },
                { szName = "Hi�p Ngh�a Chi Ch�ng", tbProp = { 2, 1, 30912 }, nStack = 100, nStatus = 4 },
                { szName = "H�i Ti�n ��n", tbProp = { 2, 1, 30847 }, nStack = 50, nStatus = 4 },
                { szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 1, nStatus = 4 },
                { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = 4 },
                { szName = "Th��ng H�i Ch�u C�p 7 (Ch�a gi�m ��nh)", tbProp = { 2, 102, 214 }, nStack = 2, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 1098,
                nRoomReq = 11,
            },
        },
        [9] = {
            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 99",
            tbAwards = {
                { szName = "H�i M�ng ��n", tbProp = { 2, 1, 31260 }, nStack = 1, nStatus = 4 },
                { szName = "M�nh C� Quan M�c Gia", tbProp = { 2, 1, 31244 }, nStack = 1000, nStatus = 1 },
                { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 1 },
                { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = 1 },
                { szName = "Th��ng H�i Ch�u C�p 7 (Ch�a gi�m ��nh)", tbProp = { 2, 102, 225 }, nStack = 5, nStatus = 1 },
                { szName = "H�c B�ch K�", tbProp = { 2, 1, 31168 }, nStack = 2, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 1099,
                nRoomReq = 6,
            },
        },
    },
    nAwardGiveStatusTaskId = WTASKID_NEWBIE_AWARD_GIVE_STATUS,
};

function WNewbieAward:CheckAwardCondition(nAwardIdx)
    local tbAwardDef = self.tbAwardDef;
    local nAwardGiveStatus = WTask:Get(self.nAwardGiveStatusTaskId);
    local nPlayerLevel = WPlayer:GetBigLevel();

    local tbAwardCondition = tbAwardDef[nAwardIdx].tbConditions or {};

    -- Ki�m tra qu� �� khai b�o ch�a
    if tbAwardDef[nAwardIdx] == WEnv.NULL then
        return enumWNewbieAwardStatusCode.AWARD_NOT_AVAILABLE, "Ph�n th��ng n�y �� h�t h�n ho�c kh�ng c�n xu�t hi�n tr�n giang h� n�a!";
    end

    -- Ki�m tra �� nh�n qu�
    if nAwardGiveStatus >= nAwardIdx then
        -- RemoveAward(nAwardIdx); -- X�a h�p qu�
        return enumWNewbieAwardStatusCode.AWARD_HAS_GET, "Ph�n th��ng n�y b�n �� nh�n tr��c �� r�i!";
    end

    -- Ki�m tra level
    local tbCheckInfo = {};
    local nRetCode = enumWNewbieAwardStatusCode.AWARD_CAN_GET;

    -- Ki�m tra c�p ��
    if tbAwardCondition.nLevelReq and tbAwardCondition.nLevelReq > 0 then
        if tbAwardCondition.nLevelReq > nPlayerLevel then
            tinsert(tbCheckInfo, format("<color=red>��t %s<color>", WLib:Level2String(tbAwardCondition.nLevelReq)));
            nRetCode = enumWNewbieAwardStatusCode.AWARD_REQ_LEVEL;
        else
            tinsert(tbCheckInfo, format("<color=green>��t %s<color>", WLib:Level2String(tbAwardCondition.nLevelReq)));
        end
    end

    -- Ki�m tra gia nh�p m�n ph�i
    if tbAwardCondition.bJoinRouteReq and tbAwardCondition.bJoinRouteReq == WEnv.TRUE then
        if WPlayer:IsJoinedRoute() ~= WEnv.TRUE then
            tinsert(tbCheckInfo, "<color=red>Gia nh�p m�n ph�i<color>");
            nRetCode = enumWNewbieAwardStatusCode.AWARD_REQ_JOIN_ROUTE;
        else
            tinsert(tbCheckInfo, "<color=green>Gia nh�p m�n ph�i<color>");
        end
    end

    -- Ki�m tra s�c l�c
    if tbAwardCondition.nRoomReq and tbAwardCondition.nRoomReq > 0 then
        if WLib:CheckInv(tbAwardCondition.nRoomReq + 3, 1000, WEnv.FALSE) ~= WEnv.TRUE then
            tinsert(tbCheckInfo, format("<color=red>H�nh trang %d �<color>", tbAwardCondition.nRoomReq));
            tinsert(tbCheckInfo, "<color=red>S�c l�c 1000<color>");
            nRetCode = enumWNewbieAwardStatusCode.AWARD_REQ_ROOM;
        else
            tinsert(tbCheckInfo, format("<color=green>H�nh trang %d �<color>", tbAwardCondition.nRoomReq));
            tinsert(tbCheckInfo, "<color=green>S�c l�c 1000<color>");
        end
    end

    -- Ch�n ch�a nh�n qu� tr��c ��
    if nRetCode == enumWNewbieAwardStatusCode.AWARD_CAN_GET and nAwardIdx - nAwardGiveStatus > 1 then
        local nRetAward = 0;
        for i = nAwardGiveStatus + 1, nAwardIdx do
            if tbAwardDef[i] ~= WEnv.NULL then
                nRetAward = nRetAward + 1;
            end
            -- D�ng khi > 1 �� ti�t ki�m t�i nguy�n
            if nRetAward > 1 then
                break ;
            end
        end
        if nRetAward > 1 then
            return enumWNewbieAwardStatusCode.AWARD_NEED_GET_BEFORE, "B�n ch�a nh�n qu� tr��c ��!";
        end
    end

    return nRetCode, tbCheckInfo;
end

function WNewbieAward:GetAwardItemName(nAwardIdx)
    local tbAwardDef = self.tbAwardDef;
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

function WNewbieAward:GiveAwardConfirm(nAwardIdx)
    local tbAwardDef = self.tbAwardDef;
    local szAwardName = tbAwardDef[nAwardIdx].szName;
    local tbAwardItem = tbAwardDef[nAwardIdx].tbAwards;
    local nCheckCode, tbCheckInfo = self:CheckAwardCondition(nAwardIdx);

    -- Ki�m tra ph�n th��ng �� nh�n ho�c kh�ng c�n n�a
    if nCheckCode == enumWNewbieAwardStatusCode.AWARD_NOT_AVAILABLE
            or nCheckCode == enumWNewbieAwardStatusCode.AWARD_HAS_GET
    then
        local tbSay = { tbCheckInfo };
        tinsert(tbSay, "Ta �� hi�u r�i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- L�y th�ng tin ph�n th��ng
    local tbAwardItemName = self:GetAwardItemName(nAwardIdx);

    -- Hi�n th� �i�u ki�n v� trao th��ng
    local tbSay = {};
    local szAwardStatus = "";
    if nCheckCode == enumWNewbieAwardStatusCode.AWARD_HAS_GET then
        szAwardStatus = "<color=white>�� nh�n<color>";
        tbSay = { "\nTa ch� xem qua th�i./nothing" };
    else
        if nCheckCode == enumWNewbieAwardStatusCode.AWARD_CAN_GET then
            szAwardStatus = "<color=green>c� th� nh�n<color>";
            tbSay = {
                format("Nh�n th��ng\n /#WNewbieAward:GiveAward(%d)", nAwardIdx),
                "T�m th�i ch�a c�n ��n./nothing",
            };
        else
            szAwardStatus = "<color=red>ch�a ��t y�u c�u<color>";
            tbSay = {
                "\n�� ta xem l�i./nothing",
            };
        end
    end

    local tbInfoLines = {};
    tbInfoLines[1] = format("<color=green>%s (%s)<color>", szAwardName, szAwardStatus);
    tbInfoLines[2] = format("<color=yellow>%s<color>", WLib:Join(tbAwardItemName, "<color>, <color=yellow>"));
    tbInfoLines[3] = format("\nY�u c�u m�u �� l� ch�a ��t: \n%s", WLib:Join(tbCheckInfo, ", "));

    -- Ch�n header l�n ��u table
    tinsert(tbSay, 1, WLib:Join(tbInfoLines, "\n"));
    WNpc:SayDialog(tbSay);
end

function WNewbieAward:GiveAward(nAwardIdx, ...)
    -- if nAwardIdx == 80 then
    -- Say('Ph�n qu� n�y t�m ��ng, Admin s� th�ng b�o v� ph�n qu� n�y sau!', 0);
    -- return 0;
    -- end

    local tbAwardDef = self.tbAwardDef;
    local nCheckCode, tbCheckInfo = self:CheckAwardCondition(nAwardIdx);

    -- Ki�m tra ph�n th��ng �� nh�n ho�c kh�ng c�n n�a
    if nCheckCode == enumWNewbieAwardStatusCode.AWARD_NOT_AVAILABLE
            or nCheckCode == enumWNewbieAwardStatusCode.AWARD_HAS_GET
    then
        local tbSay = { tbCheckInfo };
        tinsert(tbSay, "Ta �� hi�u r�i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- Ki�m tra h�p l�
    if nCheckCode ~= enumWNewbieAwardStatusCode.AWARD_CAN_GET then
        local tbSay = { "B�n kh�ng ��t �i�u ki�n nh�n th��ng m�u �� d��i ��y: \n" .. WLib:Join(tbCheckInfo, ", ") };
        tinsert(tbSay, "Ta �� hi�u r�i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- Setup param cho qu� d�ng fnFunc
    if type(tbAwardDef[nAwardIdx].fnPrepareParam) == "function" and getn(arg) == 0 then
        tbAwardDef[nAwardIdx].fnPrepareParam(nAwardIdx);
        return WEnv.RETCODE_NEEDCONFIRM;
    end
    local tbAwardNew = new(tbAwardDef[nAwardIdx].tbAwards);
    for k, v in pairs(tbAwardNew) do
        if k ~= "n" and v ~= WEnv.NULL and v.nFunc ~= WEnv.NULL then
            for i = 1, getn(arg) do
                v.nFunc = WLib:Replace(v.nFunc, "param" .. i, arg[i]);
            end
        end
    end

    -- L�u ph�n th��ng �� nh�n r�i
    WTask:Set(self.nAwardGiveStatusTaskId, nAwardIdx);
    -- RemoveAward(nAwardIdx); X�a h�p qu�

    -- Nh�n qu�
    local nRetCode = WAward:Give(tbAwardNew, tbAwardDef[nAwardIdx].szName);
    if nRetCode == WEnv.RETCODE_SUCCESS then
    else
        WNpc:Talk("Nh�n th��ng th�t b�i, vui l�ng li�n h� admin!", WEnv.TRUE);
    end
    return nRetCode;
end

function WNewbieAward:OpenAwardList()
    local tbAwardDef = self.tbAwardDef;
    local nTotalAwardCount = getn(tbAwardDef);

    local tbSay = { "Mau th�ng c�p �� s� h�u nh�ng ph�n th��ng gi� tr�!" };
    local tbAwardHasGet = {};
    for nAwardIdx = 1, nTotalAwardCount do
        if tbAwardDef[nAwardIdx] ~= WEnv.NULL then
            local szGiveStatus = "(ch�n �� xem chi ti�t)";
            local nCheckCode, tbCheckInfo = self:CheckAwardCondition(nAwardIdx);
            if nCheckCode == enumWNewbieAwardStatusCode.AWARD_CAN_GET then
                szGiveStatus = "(c� th� nh�n)";
            elseif nCheckCode == enumWNewbieAwardStatusCode.AWARD_HAS_GET then
                szGiveStatus = "(�� nh�n)";
            elseif nCheckCode == enumWNewbieAwardStatusCode.AWARD_NEED_GET_BEFORE then
                szGiveStatus = "(c�n nh�n qu� tr��c ��)";
            end
            if nCheckCode == enumWNewbieAwardStatusCode.AWARD_HAS_GET then
                tinsert(tbAwardHasGet, format("%s %s/#WNewbieAward:GiveAwardConfirm(%d)", tbAwardDef[nAwardIdx].szName, szGiveStatus, nAwardIdx));
            elseif nCheckCode == enumWNewbieAwardStatusCode.AWARD_CAN_GET then
                tinsert(tbSay, format("%s %s/#WNewbieAward:GiveAwardConfirm(%d)", tbAwardDef[nAwardIdx].szName, szGiveStatus, nAwardIdx));
            elseif nCheckCode ~= enumWNewbieAwardStatusCode.AWARD_NOT_AVAILABLE then
                tinsert(tbSay, format("%s %s/#WNewbieAward:GiveAwardConfirm(%d)", tbAwardDef[nAwardIdx].szName, szGiveStatus, nAwardIdx));
            end
        end
    end

    local nTotalReadyGet = getn(tbAwardHasGet);
    for nAwardIdx = 1, nTotalReadyGet do
        tinsert(tbSay, tbAwardHasGet[nAwardIdx]);
    end

    tinsert(tbSay, "\nTa ch� xem qua./nothing");
    WNpc:SayDialog(tbSay);
end

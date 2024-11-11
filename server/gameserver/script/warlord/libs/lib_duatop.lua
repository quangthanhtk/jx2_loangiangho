----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-22
--- Description: Th� vi�n �ua top trao th��ng
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
--- Lib base: define config

WDuaTopBase = {
    szClassName = "WDuaTopBase",
    fnDebug = print,

    nGiveAwardTime = 0,

    tbTopDef = {
        --[1] = { szName = "3 top c�ng tr�ng phe T�ng",
        --        nTopLimit = 3,
        --        nTaskId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT,
        --        nTaskBitId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_MERIT,
        --        szDataFilePath = "\\data\\warlord\\duatopbxh\\top_battlemerit_tong.txt",
        --        szSuccessDataFilePath = "data/warlord/duatopbxh/top_battlemerit_tong_success.txt",
        --        szDataLabel = "C�ng tr�ng",
        --        fnDataStrFormal = WLib.MoneyFormat,
        --        tbAwardDef = {
        --            [1] = {
        --                szName = "Top 1 c�ng tr�ng phe T�ng",
        --                fnPrepareParam = _w_duatopbxh_PrepareParam,
        --                tbAwards = {
        --                    { szName = "1 b� Uy H� So�i+0 (kh�a)", nFunc = "_w_duatopbxh_GiveUyHoSoai(0)" },
        --                    { szName = "Voi Chi�n-��p (kh�a)", tbProp = { 0, 105, 30132 }, nStack = 1, nStatus = 4 },
        --                    { szName = "C�n Kh� Sa", tbProp = { 2, 1, 31558 }, nStack = 1, nStatus = 4 },
        --                    { szName = "15 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 15, 1)" },
        --                    { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 30, nStatus = 1 },
        --                    { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 30, nStatus = 1 },
        --                    { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 30, nStatus = 1 },
        --                    { szName = "1 b� V�n S�c Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
        --                    { szName = "1 b� Kim X� Lv7+0", nFunc = "KsgAward:AddKimXa(7, 0, param1, 1)" },
        --                },
        --                tbConditions = {
        --                    nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 1 + 3 + 5,
        --                },
        --            },
        --            [2] = {
        --                szName = "Top 2 c�ng tr�ng phe T�ng",
        --                tbAwards = {
        --                    { szName = "1 b� Uy H� T��ng+0 (kh�a)", nFunc = "_w_duatopbxh_GiveUyHoTuong(0)" },
        --                    { szName = "T� Li�n Hoa-R�c R� (kh�a)", tbProp = { 0, 105, 30151 }, nStack = 1, nStatus = 4 },
        --                    { szName = "L�m Giang Ti�n", tbProp = { 2, 1, 31559 }, nStack = 1, nStatus = 4 },
        --                    { szName = "10 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 10, 1)" },
        --                    { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 20, nStatus = 1 },
        --                    { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 20, nStatus = 1 },
        --                    { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 20, nStatus = 1 },
        --                    { szName = "1 b� V�n S�c Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
        --                },
        --                tbConditions = {
        --                    nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 1 + 5,
        --                },
        --            },
        --            [3] = {
        --                szName = "Top 3 c�ng tr�ng phe T�ng",
        --                tbAwards = {
        --                    { szName = "1 b� Uy H� T��ng+0 (kh�a)", nFunc = "_w_duatopbxh_GiveUyHoTuong(0)" },
        --                    { szName = "B� B�o V�ng-��p (kh�a)", tbProp = { 0, 105, 30129 }, nStack = 1, nStatus = 4 },
        --                    { szName = "5 Th��ng H�i Ch�u 7", nFunc = "KsgAward:ThuongHaiChau(7, 5, 1)" },
        --                    { szName = "T�i �� Qu� C�p 7", tbProp = { 2, 1, 31505 }, nStack = 10, nStatus = 1 },
        --                    { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 15, nStatus = 1 },
        --                    { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 15, nStatus = 1 },
        --                    { szName = "1 b� V�n S�c Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
        --                },
        --                tbConditions = {
        --                    nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 5,
        --                },
        --            },
        --        }
        --},
    },

    tbTopData = {},
};

----------------------------------------------------------------------------------------------------
--- Lib functions: c�c h�m c�a th� vi�n

---H�m ki�m tra �� nh�n 1 trong 31 gi�i c�a t�ng lo�i ph�n th��ng ch�a
function WDuaTopBase:IsGetAward()
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

---Ki�m tra �i�u ki�n c�a nh�n v�t, khai b�o � tbTopDef[nType].tbAwar�ef[nAwardIdx].tbCondition
---@param nType number ID lo�i ph�n th��ng
---@param nAwardIdx table ID ph�n thu��ng
---@return number, table return1 number: WEnv.TRUE �� �� �i�u ki�n nh�n, WEnv.FALSE ch�a �� �k nh�n; return2 table: c�c �i�u ki�n
function WDuaTopBase:GetAwardCondition(nType, nAwardIdx)
    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local tbAwardCondition = tbAwardDef[nAwardIdx].tbConditions or {};

    -- Ki�m tra level
    local tbCheckInfo = {};
    local nRetCode = enumWDuaTopStatusCode.AWARD_CAN_GET;

    -- Ki�m tra c�p ��
    if tbAwardCondition.nLevelReq and tbAwardCondition.nLevelReq > 0 then
        local nPlayerLevel = WPlayer:GetBigLevel();
        if tbAwardCondition.nLevelReq > nPlayerLevel then
            tinsert(tbCheckInfo, format("<color=red>��t %s<color>", WLib:Level2String(tbAwardCondition.nLevelReq)));
            nRetCode = enumWDuaTopStatusCode.AWARD_REQ_LEVEL;
        else
            tinsert(tbCheckInfo, format("<color=green>��t %s<color>", WLib:Level2String(tbAwardCondition.nLevelReq)));
        end
    end

    -- Ki�m tra gia nh�p m�n ph�i
    if tbAwardCondition.bJoinRouteReq and tbAwardCondition.bJoinRouteReq == WEnv.TRUE then
        if WPlayer:IsJoinedRoute() ~= WEnv.TRUE then
            tinsert(tbCheckInfo, "<color=red>Gia nh�p m�n ph�i<color>");
            nRetCode = enumWDuaTopStatusCode.AWARD_REQ_JOIN_ROUTE;
        else
            tinsert(tbCheckInfo, "<color=green>Gia nh�p m�n ph�i<color>");
        end
    end

    -- Ki�m tra qu�n c�ng
    if tbAwardCondition.nMeritReq and tbAwardCondition.nMeritReq > 0 then
        if WPlayer:GetHonor() < tbAwardCondition.nMeritReq then
            tinsert(tbCheckInfo, format("<color=red>��t c�ng tr�ng %s<color>", WLib:MoneyFormat(tbAwardCondition.nMeritReq)));
            nRetCode = enumWNewbieAwardStatusCode.AWARD_REQ_MERIT;
        else
            tinsert(tbCheckInfo, format("<color=green>��t c�ng tr�ng %s<color>", WLib:MoneyFormat(tbAwardCondition.nMeritReq)));
        end
    end

    -- Ki�m tra s�c l�c
    if tbAwardCondition.nRoomReq and tbAwardCondition.nRoomReq > 0 then
        if WLib:CheckInv(tbAwardCondition.nRoomReq + 3, 1000, WEnv.FALSE) ~= WEnv.TRUE then
            tinsert(tbCheckInfo, format("<color=red>H�nh trang %d �<color>", tbAwardCondition.nRoomReq));
            tinsert(tbCheckInfo, "<color=red>S�c l�c 1000<color>");
            nRetCode = enumWDuaTopStatusCode.AWARD_REQ_ROOM;
        else
            tinsert(tbCheckInfo, format("<color=green>H�nh trang %d �<color>", tbAwardCondition.nRoomReq));
            tinsert(tbCheckInfo, "<color=green>S�c l�c 1000<color>");
        end
    end

    return nRetCode, tbCheckInfo;
end

---L�y ra c�c t�n ph�n th��ng ���c khai b�o � tbTopDef[nType].tbAwar�ef[nAwardIdx].szName
---@param nType number ID lo�i ph�n th��ng
---@param nAwardIdx table ID ph�n thu��ng
function WDuaTopBase:GetAwardItemName(nType, nAwardIdx)
    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local tbAwardItem = tbAwardDef[nAwardIdx].tbAwards;

    -- L�y th�ng tin ph�n th��ng
    local tbAwardItemName = {};
    for nItemDefineIdx = 1, getn(tbAwardItem) do
        if tbAwardItem[nItemDefineIdx] ~= WEnv.NULL then
            if type(tbAwardItem[nItemDefineIdx].tbProp) == 'table' then
                if type(tbAwardItem[nItemDefineIdx].szName) == "string" then
                    tinsert(tbAwardItemName, format("%d %s", tbAwardItem[nItemDefineIdx].nStack, tbAwardItem[nItemDefineIdx].szName));
                else
                    tinsert(tbAwardItemName, format("%d %s", tbAwardItem[nItemDefineIdx].nStack, WItem:Get(tbAwardItem[nItemDefineIdx].tbProp)));
                end
            else
                tinsert(tbAwardItemName, tbAwardItem[nItemDefineIdx].szName);
            end
        end
    end
    return tbAwardItemName;
end

---Ki�m tra ph�n t��ng c� s�n �� nh�n hay kh�ng (tr�nh bug khi b� reset task)
---@param nType number ID lo�i ph�n th��ng
---@param nAwardIdx table ID ph�n thu��ng
---@return number, string return1 number: WEnv.TRUE c� th� nh�n, WEnv.FALSE �� c� ng��i nh�n r�i; return2 string: t�n ng��i nh�n (�� trim)
function WDuaTopBase:IsAwardAvailable(nType, nAwardIdx)
    local tbGiveSuccessData = WLib:GetTabFileTable(WLib:Replace(self.tbTopDef[nType].szDataFilePath, ".txt", "_success.txt"), 1, {
        tostring, --szLogTime
        tostring, --szAccount
        tostring, --szRoleName
        tonumber, --nAwardIdx
        tostring, --szAwardName
        tostring, --szAwardData
    });

    local bIsCanGet = WEnv.TRUE;
    local szRoleName = "";
    for nRowData = 1, getn(tbGiveSuccessData) do
        if tbGiveSuccessData[nRowData][4] == nAwardIdx then
            bIsCanGet = WEnv.FALSE;
            szRoleName = WLib:Trim(tbGiveSuccessData[nRowData][3]);
            break ;
        end
    end

    return bIsCanGet, szRoleName;
end

---Load danh s�ch nh�n th��ng v�o trong tbTopData
---@param nType number ID lo�i ph�n th��ng
function WDuaTopBase:LoadAwardList(nType)
    nType = tonumber(nType) or 0;

    local tbData = WLib:GetTabFileTable(self.tbTopDef[nType].szDataFilePath, 1,
            {
                tostring, --szLogTime
                tostring, --szAccount
                tostring, --szRoleName
                tonumber, --nRank
                tonumber, --nData
                tonumber, --nRoute
            }
    );

    if getn(tbData) > 0 then
        for k, v in pairs(tbData) do
            local nRank = v[4];
            v.n = nil;
            if self.tbTopData[nType] == nil then
                self.tbTopData[nType] = {};
            end
            self.tbTopData[nType][nRank] = v;
        end
    end
end

---Hi�n th� danh s�ch ng��i nh�n th��ng
---@param nType number ID lo�i ph�n th��ng
function WDuaTopBase:ShowAwardList(nType)
    nType = tonumber(nType) or 0;

    if nType == 0 then
        return WEnv.RETCODE_NOTOPEN;
    end

    self:LoadAwardList(nType);

    local tbSay = { format("<npcname>: ��y l� danh s�ch gi�i th��ng <color=yellow>%s<color>. \nM�i <sex> xem th� c� t�n m�nh kh�ng!\n" ..
            "    <color=white>%s  %s  %s  %s<color>",
            self.tbTopDef[nType].szName,
            WLib:Align("H�ng", 4, 1),
            WLib:Align("T�n nh�n v�t", 16, 1),
            WLib:Align(self.tbTopDef[nType].szDataLabel or "D� li�u", 12, 1),
            WLib:Align("M�n ph�i", 20, 1)
    ) };
    local tbTopData = self.tbTopData[nType] or {};
    for nRow = 1, getn(self.tbTopDef[nType].tbAwardDef) do
        local szAwardStatus = "";
        local szRoleName, nAwardIdx, nDataValue, nRoute = "ch�a c�p nh�p", nRow, 0, 0;

        if tbTopData[nRow] ~= WEnv.NULL then
            szRoleName = WLib:Trim(tbTopData[nRow][3] or "");
            nAwardIdx = tbTopData[nRow][4];
            nDataValue = tbTopData[nRow][5];
            nRoute = tbTopData[nRow][6];
        end

        if self:IsAwardAvailable(nType, nAwardIdx) == WEnv.FALSE then
            szAwardStatus = "(�� c� ch� nh�n)";
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

        tinsert(tbSay, format("  %s  %s  %s  %s  %s/#%s:ShowAwardInfo(%d, %d)",
                WLib:Align(nAwardIdx, 4, 1),
                WLib:Align(szRoleName, 16, 1),
                WLib:Align(szData, 12, 1),
                WLib:Align(WPlayer:GetRouteName(nRoute, 0), 20, 1),
                szAwardStatus,
                self.szClassName, nType, nAwardIdx));
    end

    tinsert(tbSay, "\nTa ch� xem qua th�i./nothing");
    WNpc:SayDialog(tbSay);
end

---Hi�n th� chi ti�t ph�n th��ng
---@param nType number ID lo�i ph�n th��ng
---@param nAwardIdx table ID ph�n thu��ng
function WDuaTopBase:ShowAwardInfo(nType, nAwardIdx)
    nType = tonumber(nType) or 0;
    nAwardIdx = tonumber(nAwardIdx) or 0;

    if nType == 0 or nAwardIdx == 0 then
        return WEnv.RETCODE_NOTOPEN;
    end

    -- Ki�m tra ph�n th��ng kh�ng c�n n�a
    if self.tbTopDef[nType] == WEnv.NULL or self.tbTopDef[nType].tbAwardDef == WEnv.NULL then
        local tbSay = { "Ph�n th��ng n�y �� h�t h�n ho�c kh�ng c�n xu�t hi�n tr�n giang h� n�a!" };
        tinsert(tbSay, "Ta �� hi�u r�i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- L�y th�ng tin ph�n th��ng
    local nCheckCode, tbCheckInfo = self:GetAwardCondition(nType, nAwardIdx);
    local tbAwardItemName = self:GetAwardItemName(nType, nAwardIdx);

    -- L�y ra t�n ng��i nh�n th��ng
    local szRoleName = "";
    if self.tbTopData[nType] ~= WEnv.NULL and self.tbTopData[nType][nAwardIdx] ~= WEnv.NULL then
        szRoleName = WLib:Trim(self.tbTopData[nType][nAwardIdx][3] or "");
    end

    -- Hi�n th� �i�u ki�n v� trao th��ng
    local tbSay = {};
    tinsert(tbSay, format("%s/#%s:ShowAwardList(%d)", "Xem l�i danh s�ch nh�n th��ng", self.szClassName, nType));
    tinsert(tbSay, format("%s/nothing", "Ta ch� xem qua th�i."));

    local tbSayTitleInfoLines = {};
    local szAwardStatus = "";

    if self:IsAwardAvailable(nType, nAwardIdx) == WEnv.TRUE then
        if szRoleName ~= "" and szRoleName == WPlayer:GetName() then
            if WTask:GetBit(self.tbTopDef[nType].nTaskId, self.tbTopDef[nType].nTaskBitId) == 1 then
                szAwardStatus = "(<color=white>�� nh�n<color>)";
            else
                if self:IsGetAward() == WEnv.FALSE then
                    -- �� nh�n ph�n th��ng b�t k� s� kh�ng hi�n d�ng nh�n th��ng ra n�a
                    if nCheckCode == enumWDuaTopStatusCode.AWARD_CAN_GET then
                        szAwardStatus = "(<color=green>c� th� nh�n<color>)";
                        tinsert(tbSay, 1, format("\nNh�n th��ng/#%s:GiveAward(%d, %d)", self.szClassName, nType, nAwardIdx));
                    else
                        szAwardStatus = "(<color=red>ch�a ��t y�u c�u<color>)";
                    end
                    tbSayTitleInfoLines[3] = format("\nY�u c�u m�u �� l� ch�a ��t: \n%s", WLib:Join(tbCheckInfo, ", "));
                end
            end
        end
    else
        szAwardStatus = "(�� c� ch� nh�n)";
    end

    tbSayTitleInfoLines[1] = format("<color=green>%s %s<color>", self.tbTopDef[nType].tbAwardDef[nAwardIdx].szName, szAwardStatus);
    tbSayTitleInfoLines[2] = format("<color=yellow>%s<color>", WLib:Join(tbAwardItemName, "<color>, <color=yellow>"));

    -- Ch�n header l�n ��u tbSay
    tinsert(tbSay, 1, WLib:Join(tbSayTitleInfoLines, "\n"));
    WNpc:SayDialog(tbSay);
end

---Trao ph�n th��ng
---@param nType number ID lo�i ph�n th��ng
---@param nAwardIdx table ID ph�n thu��ng
---@param arg table Tham s� th�m kh�ng b�t bu�c, k�t h�p v�i tbTopDef[nType].tbAwar�ef[nAwardIdx].fnPrepareParam l�a ch�n g� �� �� c� tham s� ��u v�o c� th� c�a h�m nh�n th��ng
function WDuaTopBase:GiveAward(nType, nAwardIdx, ...)
    nType = tonumber(nType) or 0;
    nAwardIdx = tonumber(nAwardIdx) or 0;

    if nType == 0 or nAwardIdx == 0 then
        return WEnv.RETCODE_NOTOPEN;
    end

    if WLib:IsTestServer() == WEnv.FALSE and self.nGiveAwardTime > 0 and self.nGiveAwardTime > WDate:Today(WEnv.TRUE) then
        WNpc:Talk(format("Th�i gian th�ch h�p �� nh�n th��ng l� <color=green>%s<color>, <sex> h�y quay l�i sau nh�!\n<color=red>N�u <sex> c� khi�u n�i v� k�t qu� vui l�ng inbox Fanpage �� ���c h� tr�!<color>", WDate:ToString(self.nGiveAwardTime, WEnv.TRUE)));
        return WEnv.RETCODE_NOTOPEN;
    end
    
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
    if self:IsAwardAvailable(nType, nAwardIdx) == WEnv.FALSE then
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
    if nCheckCode ~= enumWDuaTopStatusCode.AWARD_CAN_GET then
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
        WFileLog:WriteTabFile(WLib:Replace(self.tbTopDef[nType].szDataFilePath, ".txt", "_success.txt"),
                { szLogTime, WPlayer:GetAccount(), WPlayer:GetName() .. " ", nAwardIdx, szAwardItemName .. " ", nRetCode },
                { "szLogTime", "szAccount", "szRoleName", "nAwardIdx", "szAwardItemName", "szAwardData" });

        local szMsg = format("Ch�c m�ng ng��i ch�i <color=yellow>%s<color> �� nh�n th�nh c�ng <color=green>%s<color>!", WPlayer:GetName(), szAwardName);
        Msg2Global(WLib:RemoveTag(szMsg));
        AddGlobalNews(szMsg, 1);
    else
        WNpc:Talk("Nh�n th��ng th�t b�i, vui l�ng li�n h� admin!", WEnv.TRUE);
    end
    return nRetCode;
end

----------------------------------------------------------------------------------------------------
--- Lib interface: kh�i t�o 1 l�n v�o memory stack

enumWDuaTopStatusCode = {
    AWARD_CAN_GET = 1,
    AWARD_HAS_GET = 2,
    AWARD_NOT_AVAILABLE = 3,
    AWARD_NEED_GET_BEFORE = 4,
    AWARD_REQ_LEVEL = 5,
    AWARD_REQ_JOIN_ROUTE = 6,
    AWARD_REQ_ROOM = 7,
};
WDuaTop = {};
WDuaTop.TYPES = {};
function WDuaTop:RegType(szKey, tbClass)
    --if self.TYPES[szKey] == WEnv.NULL then
        tbClass.szKey = szKey;
        self.TYPES[szKey] = inherit(WDuaTopBase, tbClass);
        self.TYPES[szKey].fnDebug("WDuaTop:RegType called -> init success!", szKey, tbClass);
    --end

    return self.TYPES[szKey];
end

----------------------------------------------------------------------------------------------------
--- Lib register & include inherit class

Include("\\script\\warlord\\online_activities\\ruong_hoat_dong\\head.lua");
Include("\\script\\warlord\\online_activities\\dua_top_bxh\\head.lua");

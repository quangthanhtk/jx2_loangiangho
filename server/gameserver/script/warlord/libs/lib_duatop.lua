----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-22
--- Description: Th­ viÖn ®ua top trao th­ëng
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
--- Lib base: define config

WDuaTopBase = {
    szClassName = "WDuaTopBase",
    fnDebug = print,

    nGiveAwardTime = 0,

    tbTopDef = {
        --[1] = { szName = "3 top c«ng tr¹ng phe Tèng",
        --        nTopLimit = 3,
        --        nTaskId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT,
        --        nTaskBitId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_MERIT,
        --        szDataFilePath = "\\data\\warlord\\duatopbxh\\top_battlemerit_tong.txt",
        --        szSuccessDataFilePath = "data/warlord/duatopbxh/top_battlemerit_tong_success.txt",
        --        szDataLabel = "C«ng tr¹ng",
        --        fnDataStrFormal = WLib.MoneyFormat,
        --        tbAwardDef = {
        --            [1] = {
        --                szName = "Top 1 c«ng tr¹ng phe Tèng",
        --                fnPrepareParam = _w_duatopbxh_PrepareParam,
        --                tbAwards = {
        --                    { szName = "1 bé Uy Hæ So¸i+0 (khãa)", nFunc = "_w_duatopbxh_GiveUyHoSoai(0)" },
        --                    { szName = "Voi ChiÕn-§Ñp (khãa)", tbProp = { 0, 105, 30132 }, nStack = 1, nStatus = 4 },
        --                    { szName = "C¸n Khª Sa", tbProp = { 2, 1, 31558 }, nStack = 1, nStatus = 4 },
        --                    { szName = "15 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 15, 1)" },
        --                    { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 30, nStatus = 1 },
        --                    { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 30, nStatus = 1 },
        --                    { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 30, nStatus = 1 },
        --                    { szName = "1 bé V¨n Søc Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
        --                    { szName = "1 bé Kim Xµ Lv7+0", nFunc = "KsgAward:AddKimXa(7, 0, param1, 1)" },
        --                },
        --                tbConditions = {
        --                    nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 1 + 3 + 5,
        --                },
        --            },
        --            [2] = {
        --                szName = "Top 2 c«ng tr¹ng phe Tèng",
        --                tbAwards = {
        --                    { szName = "1 bé Uy Hæ T­íng+0 (khãa)", nFunc = "_w_duatopbxh_GiveUyHoTuong(0)" },
        --                    { szName = "Tö Liªn Hoa-Rùc Rì (khãa)", tbProp = { 0, 105, 30151 }, nStack = 1, nStatus = 4 },
        --                    { szName = "L©m Giang Tiªn", tbProp = { 2, 1, 31559 }, nStack = 1, nStatus = 4 },
        --                    { szName = "10 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 10, 1)" },
        --                    { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 20, nStatus = 1 },
        --                    { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 20, nStatus = 1 },
        --                    { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 20, nStatus = 1 },
        --                    { szName = "1 bé V¨n Søc Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
        --                },
        --                tbConditions = {
        --                    nRoomReq = 6 + 1 + 1 + 1 + 1 + 1 + 1 + 5,
        --                },
        --            },
        --            [3] = {
        --                szName = "Top 3 c«ng tr¹ng phe Tèng",
        --                tbAwards = {
        --                    { szName = "1 bé Uy Hæ T­íng+0 (khãa)", nFunc = "_w_duatopbxh_GiveUyHoTuong(0)" },
        --                    { szName = "BÐ B¸o Vµng-§Ñp (khãa)", tbProp = { 0, 105, 30129 }, nStack = 1, nStatus = 4 },
        --                    { szName = "5 Th­¬ng H¶i Ch©u 7", nFunc = "KsgAward:ThuongHaiChau(7, 5, 1)" },
        --                    { szName = "Tói §¸ Quý CÊp 7", tbProp = { 2, 1, 31505 }, nStack = 10, nStatus = 1 },
        --                    { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 15, nStatus = 1 },
        --                    { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 15, nStatus = 1 },
        --                    { szName = "1 bé V¨n Søc Lv4+0", nFunc = "KsgAward:SetVanSuc(4, 1, 1)" },
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
--- Lib functions: c¸c hµm cña th­ viÖn

---Hµm kiÓm tra ®· nhËn 1 trong 31 gi¶i cña tõng lo¹i phÇn th­ëng ch­a
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

---KiÓm tra ®iÒu kiÖn cña nh©n vËt, khai b¸o ë tbTopDef[nType].tbAwar®ef[nAwardIdx].tbCondition
---@param nType number ID lo¹i phÇn th­ëng
---@param nAwardIdx table ID phÇn thu­ëng
---@return number, table return1 number: WEnv.TRUE ®· ®ñ ®iÒu kiÖn nhËn, WEnv.FALSE ch­a ®ñ ®k nhËn; return2 table: c¸c ®iÒu kiÖn
function WDuaTopBase:GetAwardCondition(nType, nAwardIdx)
    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local tbAwardCondition = tbAwardDef[nAwardIdx].tbConditions or {};

    -- KiÓm tra level
    local tbCheckInfo = {};
    local nRetCode = enumWDuaTopStatusCode.AWARD_CAN_GET;

    -- KiÓm tra cÊp ®é
    if tbAwardCondition.nLevelReq and tbAwardCondition.nLevelReq > 0 then
        local nPlayerLevel = WPlayer:GetBigLevel();
        if tbAwardCondition.nLevelReq > nPlayerLevel then
            tinsert(tbCheckInfo, format("<color=red>§¹t %s<color>", WLib:Level2String(tbAwardCondition.nLevelReq)));
            nRetCode = enumWDuaTopStatusCode.AWARD_REQ_LEVEL;
        else
            tinsert(tbCheckInfo, format("<color=green>§¹t %s<color>", WLib:Level2String(tbAwardCondition.nLevelReq)));
        end
    end

    -- KiÓm tra gia nhËp m«n ph¸i
    if tbAwardCondition.bJoinRouteReq and tbAwardCondition.bJoinRouteReq == WEnv.TRUE then
        if WPlayer:IsJoinedRoute() ~= WEnv.TRUE then
            tinsert(tbCheckInfo, "<color=red>Gia nhËp m«n ph¸i<color>");
            nRetCode = enumWDuaTopStatusCode.AWARD_REQ_JOIN_ROUTE;
        else
            tinsert(tbCheckInfo, "<color=green>Gia nhËp m«n ph¸i<color>");
        end
    end

    -- KiÓm tra qu©n c«ng
    if tbAwardCondition.nMeritReq and tbAwardCondition.nMeritReq > 0 then
        if WPlayer:GetHonor() < tbAwardCondition.nMeritReq then
            tinsert(tbCheckInfo, format("<color=red>§¹t c«ng tr¹ng %s<color>", WLib:MoneyFormat(tbAwardCondition.nMeritReq)));
            nRetCode = enumWNewbieAwardStatusCode.AWARD_REQ_MERIT;
        else
            tinsert(tbCheckInfo, format("<color=green>§¹t c«ng tr¹ng %s<color>", WLib:MoneyFormat(tbAwardCondition.nMeritReq)));
        end
    end

    -- KiÓm tra søc lùc
    if tbAwardCondition.nRoomReq and tbAwardCondition.nRoomReq > 0 then
        if WLib:CheckInv(tbAwardCondition.nRoomReq + 3, 1000, WEnv.FALSE) ~= WEnv.TRUE then
            tinsert(tbCheckInfo, format("<color=red>Hµnh trang %d «<color>", tbAwardCondition.nRoomReq));
            tinsert(tbCheckInfo, "<color=red>Søc lùc 1000<color>");
            nRetCode = enumWDuaTopStatusCode.AWARD_REQ_ROOM;
        else
            tinsert(tbCheckInfo, format("<color=green>Hµnh trang %d «<color>", tbAwardCondition.nRoomReq));
            tinsert(tbCheckInfo, "<color=green>Søc lùc 1000<color>");
        end
    end

    return nRetCode, tbCheckInfo;
end

---LÊy ra c¸c tªn phÇn th­ëng ®­îc khai b¸o ë tbTopDef[nType].tbAwar®ef[nAwardIdx].szName
---@param nType number ID lo¹i phÇn th­ëng
---@param nAwardIdx table ID phÇn thu­ëng
function WDuaTopBase:GetAwardItemName(nType, nAwardIdx)
    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local tbAwardItem = tbAwardDef[nAwardIdx].tbAwards;

    -- LÊy th«ng tin phÇn th­ëng
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

---KiÓm tra phÇn t­ëng cã s½n ®Ó nhËn hay kh«ng (tr¸nh bug khi bÞ reset task)
---@param nType number ID lo¹i phÇn th­ëng
---@param nAwardIdx table ID phÇn thu­ëng
---@return number, string return1 number: WEnv.TRUE cã thÓ nhËn, WEnv.FALSE ®· cã ng­êi nhËn råi; return2 string: tªn ng­êi nhËn (®· trim)
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

---Load danh s¸ch nhËn th­ëng vµo trong tbTopData
---@param nType number ID lo¹i phÇn th­ëng
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

---HiÓn thÞ danh s¸ch ng­êi nhËn th­ëng
---@param nType number ID lo¹i phÇn th­ëng
function WDuaTopBase:ShowAwardList(nType)
    nType = tonumber(nType) or 0;

    if nType == 0 then
        return WEnv.RETCODE_NOTOPEN;
    end

    self:LoadAwardList(nType);

    local tbSay = { format("<npcname>: §©y lµ danh s¸ch gi¶i th­ëng <color=yellow>%s<color>. \nMêi <sex> xem thö cã tªn m×nh kh«ng!\n" ..
            "    <color=white>%s  %s  %s  %s<color>",
            self.tbTopDef[nType].szName,
            WLib:Align("H¹ng", 4, 1),
            WLib:Align("Tªn nh©n vËt", 16, 1),
            WLib:Align(self.tbTopDef[nType].szDataLabel or "D÷ liÖu", 12, 1),
            WLib:Align("M«n ph¸i", 20, 1)
    ) };
    local tbTopData = self.tbTopData[nType] or {};
    for nRow = 1, getn(self.tbTopDef[nType].tbAwardDef) do
        local szAwardStatus = "";
        local szRoleName, nAwardIdx, nDataValue, nRoute = "ch­a cËp nhËp", nRow, 0, 0;

        if tbTopData[nRow] ~= WEnv.NULL then
            szRoleName = WLib:Trim(tbTopData[nRow][3] or "");
            nAwardIdx = tbTopData[nRow][4];
            nDataValue = tbTopData[nRow][5];
            nRoute = tbTopData[nRow][6];
        end

        if self:IsAwardAvailable(nType, nAwardIdx) == WEnv.FALSE then
            szAwardStatus = "(®· cã chñ nh©n)";
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

        tinsert(tbSay, format("  %s  %s  %s  %s  %s/#%s:ShowAwardInfo(%d, %d)",
                WLib:Align(nAwardIdx, 4, 1),
                WLib:Align(szRoleName, 16, 1),
                WLib:Align(szData, 12, 1),
                WLib:Align(WPlayer:GetRouteName(nRoute, 0), 20, 1),
                szAwardStatus,
                self.szClassName, nType, nAwardIdx));
    end

    tinsert(tbSay, "\nTa chØ xem qua th«i./nothing");
    WNpc:SayDialog(tbSay);
end

---HiÓn thÞ chi tiÕt phÇn th­ëng
---@param nType number ID lo¹i phÇn th­ëng
---@param nAwardIdx table ID phÇn thu­ëng
function WDuaTopBase:ShowAwardInfo(nType, nAwardIdx)
    nType = tonumber(nType) or 0;
    nAwardIdx = tonumber(nAwardIdx) or 0;

    if nType == 0 or nAwardIdx == 0 then
        return WEnv.RETCODE_NOTOPEN;
    end

    -- KiÓm tra phÇn th­ëng kh«ng cßn n÷a
    if self.tbTopDef[nType] == WEnv.NULL or self.tbTopDef[nType].tbAwardDef == WEnv.NULL then
        local tbSay = { "PhÇn th­ëng nµy ®· hÕt h¹n hoÆc kh«ng cßn xuÊt hiÖn trªn giang hå n÷a!" };
        tinsert(tbSay, "Ta ®· hiÓu råi./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- LÊy th«ng tin phÇn th­ëng
    local nCheckCode, tbCheckInfo = self:GetAwardCondition(nType, nAwardIdx);
    local tbAwardItemName = self:GetAwardItemName(nType, nAwardIdx);

    -- LÊy ra tªn ng­êi nhËn th­ëng
    local szRoleName = "";
    if self.tbTopData[nType] ~= WEnv.NULL and self.tbTopData[nType][nAwardIdx] ~= WEnv.NULL then
        szRoleName = WLib:Trim(self.tbTopData[nType][nAwardIdx][3] or "");
    end

    -- HiÓn thÞ ®iÒu kiÖn vµ trao th­ëng
    local tbSay = {};
    tinsert(tbSay, format("%s/#%s:ShowAwardList(%d)", "Xem l¹i danh s¸ch nhËn th­ëng", self.szClassName, nType));
    tinsert(tbSay, format("%s/nothing", "Ta chØ xem qua th«i."));

    local tbSayTitleInfoLines = {};
    local szAwardStatus = "";

    if self:IsAwardAvailable(nType, nAwardIdx) == WEnv.TRUE then
        if szRoleName ~= "" and szRoleName == WPlayer:GetName() then
            if WTask:GetBit(self.tbTopDef[nType].nTaskId, self.tbTopDef[nType].nTaskBitId) == 1 then
                szAwardStatus = "(<color=white>®· nhËn<color>)";
            else
                if self:IsGetAward() == WEnv.FALSE then
                    -- §· nhËn phÇn th­ëng bÊt kú sÏ kh«ng hiÖn dßng nhËn th­ëng ra n÷a
                    if nCheckCode == enumWDuaTopStatusCode.AWARD_CAN_GET then
                        szAwardStatus = "(<color=green>cã thÓ nhËn<color>)";
                        tinsert(tbSay, 1, format("\nNhËn th­ëng/#%s:GiveAward(%d, %d)", self.szClassName, nType, nAwardIdx));
                    else
                        szAwardStatus = "(<color=red>ch­a ®¹t yªu cÇu<color>)";
                    end
                    tbSayTitleInfoLines[3] = format("\nYªu cÇu mµu ®á lµ ch­a ®¹t: \n%s", WLib:Join(tbCheckInfo, ", "));
                end
            end
        end
    else
        szAwardStatus = "(®· cã chñ nh©n)";
    end

    tbSayTitleInfoLines[1] = format("<color=green>%s %s<color>", self.tbTopDef[nType].tbAwardDef[nAwardIdx].szName, szAwardStatus);
    tbSayTitleInfoLines[2] = format("<color=yellow>%s<color>", WLib:Join(tbAwardItemName, "<color>, <color=yellow>"));

    -- ChÌn header lªn ®Çu tbSay
    tinsert(tbSay, 1, WLib:Join(tbSayTitleInfoLines, "\n"));
    WNpc:SayDialog(tbSay);
end

---Trao phÇn th­ëng
---@param nType number ID lo¹i phÇn th­ëng
---@param nAwardIdx table ID phÇn thu­ëng
---@param arg table Tham sè thªm kh«ng b¾t buéc, kÕt hîp víi tbTopDef[nType].tbAwar®ef[nAwardIdx].fnPrepareParam lùa chän g× ®ã ®Ó cã tham sè ®Çu vµo cô thÓ cña hµm nhËn th­ëng
function WDuaTopBase:GiveAward(nType, nAwardIdx, ...)
    nType = tonumber(nType) or 0;
    nAwardIdx = tonumber(nAwardIdx) or 0;

    if nType == 0 or nAwardIdx == 0 then
        return WEnv.RETCODE_NOTOPEN;
    end

    if WLib:IsTestServer() == WEnv.FALSE and self.nGiveAwardTime > 0 and self.nGiveAwardTime > WDate:Today(WEnv.TRUE) then
        WNpc:Talk(format("Thêi gian thÝch hîp ®Ó nhËn th­ëng lµ <color=green>%s<color>, <sex> h·y quay l¹i sau nhÐ!\n<color=red>NÕu <sex> cã khiÕu n¹i vÒ kÕt qu¶ vui lßng inbox Fanpage ®Ó ®­îc hç trî!<color>", WDate:ToString(self.nGiveAwardTime, WEnv.TRUE)));
        return WEnv.RETCODE_NOTOPEN;
    end
    
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
    if self:IsAwardAvailable(nType, nAwardIdx) == WEnv.FALSE then
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
    if nCheckCode ~= enumWDuaTopStatusCode.AWARD_CAN_GET then
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
        WFileLog:WriteTabFile(WLib:Replace(self.tbTopDef[nType].szDataFilePath, ".txt", "_success.txt"),
                { szLogTime, WPlayer:GetAccount(), WPlayer:GetName() .. " ", nAwardIdx, szAwardItemName .. " ", nRetCode },
                { "szLogTime", "szAccount", "szRoleName", "nAwardIdx", "szAwardItemName", "szAwardData" });

        local szMsg = format("Chóc mõng ng­êi ch¬i <color=yellow>%s<color> ®· nhËn thµnh c«ng <color=green>%s<color>!", WPlayer:GetName(), szAwardName);
        Msg2Global(WLib:RemoveTag(szMsg));
        AddGlobalNews(szMsg, 1);
    else
        WNpc:Talk("NhËn th­ëng thÊt b¹i, vui lßng liªn hÖ admin!", WEnv.TRUE);
    end
    return nRetCode;
end

----------------------------------------------------------------------------------------------------
--- Lib interface: khëi t¹o 1 lÇn vµo memory stack

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

----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: c¸c hµm th«ng dông hay dïng
----------------------------------------------------------------------------------------------------
WLib = {};
----------------------------------------------------------------------------------------------------

function WLib:GetMapPos()
    local nMapId, nX, nY = GetWorldPos();
    local x = floor(nX / 8);
    local y = floor(nY / 16);
    return x, y, nMapId;
end

function WLib:Trim(szString)
    local nStart, nLast = strfind(szString, "%S+.*%S+");
    if (nStart == WEnv.NULL or nLast == WEnv.NULL) then
        return szString;
    end
    return strsub(szString, nStart, nLast);
end

function WLib:Split(szInput, szDelimiter)
    szDelimiter = szDelimiter or ", ";

    local tbResult = {};
    local nStart = 1;
    local nSeparatorLength = strlen(szDelimiter);
    local nFoundIdx = strfind(szInput, szDelimiter, nStart);

    if nFoundIdx == WEnv.NULL then
        tbResult[1] = szInput;
        return tbResult;
    end

    local i = 1;

    while nFoundIdx do
        tbResult[i] = strsub(szInput, nStart, nFoundIdx - 1);
        i = i + 1;
        nStart = nFoundIdx + nSeparatorLength;
        nFoundIdx = strfind(szInput, szDelimiter, nStart);
    end
    tbResult[i] = strsub(szInput, nStart, strlen(szInput));
    return tbResult;
end

function WLib:IsRate(nPercent)
    local nRateTotal = 10000000;
    local nRandom = random(1, nRateTotal);
    local nRate = floor(nPercent * nRateTotal / 100);
    if (nRandom <= nRate) then
        return WEnv.TRUE;
    end
    return WEnv.FALSE;
end

function WLib:IsInTable(item, tb)
    if tb == WEnv.NULL or type(tb) ~= "table" then
        return WEnv.FALSE;
    end
    for _, v in tb do
        if _ ~= "n" and v == item then
            return WEnv.TRUE;
        end
    end
    return WEnv.FALSE;
end

function WLib:TableLength(tb)
    local nCount = 0;
    for i, _ in pairs(tb) do
        if i ~= "n" then
            nCount = nCount + 1;
        end
    end
    return nCount
end

function WLib:RandomTableValue(tb, bIsReturnKey)
    local nRandomIndex = random(1, getn(tb))
    local index = 0
    for k, v in tb do
        if k ~= "n" then
            index = index + 1;
            if index == nRandomIndex then
                if bIsReturnKey then
                    return v, k;
                end
                return v;
            end
        end
    end

    return WLib:RandomTableValue(tb, bIsReturnKey);
end

function WLib:IsInRange(nValue, nStart, nEnd)
    if nValue >= nStart and nValue <= nEnd then
        return WEnv.TRUE;
    end
    return WEnv.FALSE;
end

function WLib:UnPack(tb, nStartIdx, nEndIdx)
    if tb == WEnv.NULL then
        return WEnv.NULL;
    end
    if type(tb) ~= "table" then
        return tb;
    end

    local nSize = getn(tb);
    nStartIdx = nStartIdx or 1;
    nEndIdx = nEndIdx or nSize;
    if tb[nStartIdx] and nStartIdx <= nEndIdx then
        return tb[nStartIdx], self:UnPack(tb, nStartIdx + 1, nEndIdx);
    end
end

function WLib:MergeTable(...)
    local tbTable = {};
    local nIdx = 1;
    for i = 1, arg.n do
        for k, v in arg[i] do
            if type(tbTable[k]) == "table" and type(v) == "table" then
                tbTable[k] = self:MergeTable(tbTable[k], v);
            else
                tbTable[k] = v;
            end
            nIdx = nIdx + 1;
        end
    end
    return tbTable;
end

function WLib:CheckInv(nNeedRoom, nNeedWeight, bShowMsg)
    nNeedWeight = nNeedWeight or 100;
    bShowMsg = bShowMsg or WEnv.TRUE;
    if GetFreeItemRoom() < nNeedRoom or GetMaxItemWeight() - GetCurItemWeight() < nNeedWeight then
        if bShowMsg == WEnv.TRUE then
            WNpc:Talk(format("Hµnh trang cña %s <color=yellow>kh«ng ®ñ %d chç trèng hoÆc søc lùc kh«ng ®ñ %d<color>, xin h·y <color=green>s¾p xÕp l¹i hµnh trang<color>!", WPlayer:GetSexName(), nNeedRoom, nNeedWeight));
        end
        return WEnv.FALSE;
    end
    return WEnv.TRUE;
end

function WLib:Exp2String(nExp)
    if nExp >= 1e6 and nExp < 1e9 then
        return format("%d.%d triÖu kinh nghiÖm", floor(nExp / 1e6), mod(nExp, 1e6));
    end
    if nExp >= 1e9 then
        local nBillion = floor(nExp / 1e9);
        local nMillion = mod(nExp, 1e9);
        if nMillion > 0 then
            return format("%d tû %d.%d triÖu kinh nghiÖm", nBillion, floor(nMillion / 1e6), mod(nMillion, 1e6));
        end
        return format("%d tû ®iÓm kinh nghiÖm", nBillion);
    end
    return format("%d ®iÓm kinh nghiÖm", nExp);
end

function WLib:Level2String(nBigLevel)
    if nBigLevel > 100 then
        local nRebornCount, nLevel = WPlayer:GetRebornAndLevel(nBigLevel);
        return format("chuyÓn sinh %d cÊp %d", nRebornCount, nLevel);
    end
    return format("cÊp %d", nBigLevel);
end

function WLib:Level2ShortString(nBigLevel)
    if nBigLevel > 100 then
        local nRebornCount, nLevel = WPlayer:GetRebornAndLevel(nBigLevel);
        return format("cs %d cÊp %d", nRebornCount, nLevel);
    end
    return format("cÊp %d", nBigLevel);
end

function WLib:BattleRank2Title(nLevel)
    return g_tbBattleTitleCfg[nLevel]
end

-- Vi du
--tbRequirements = {
--    tbItems = {{tbProp = {2,1,2}, nCount = 10},} -- 10 duoi tho
--    nLevel = 90, -- Cap 99
--    nBattleRank = 6, -- Nguyen Soai
--}
function WLib:CheckMaterial(tbRequirements, szMsgHead, szMsgFooter, bNotTalk)
    local nPass = 1;
    local nItemCount = 0;
    local szJoinString = ", ";
    local szMessage = szMsgHead or format("%s ch­a ®¹t ®iÒu kiÖn yªu cÇu: <enter>", WPlayer:GetSexName());
    local nIndex = 0;
    for szConditionName, mCondition in tbRequirements do
        nIndex = nIndex + 1;
        if nIndex == 1 then
            szJoinString = "";
        else
            szJoinString = ", ";
        end
        if type(mCondition) == "number" and szConditionName == "nPhongHoa" then
            local szColor = "green";
            if WPlayer:GetPhongHoa() < mCondition then
                nPass = 0;
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>%d ®iÓm phong hoa<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "number" and szConditionName == "nGold" then
            local szColor = "green"
            if WPlayer:GetGold() < mCondition then
                nPass = 0;
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>%d vµng<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "number" and szConditionName == "nMeridianLevel" then
            local szColor = "green"
            if WPlayer:GetMeridianLevel() < mCondition then
                nPass = 0;
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>kinh m¹ch ®¹t c¶nh giíi %s<color>", szJoinString, szColor, WPlayer:GetMeridianName(mCondition));
        end
        if type(mCondition) == "number" and szConditionName == "nLevel" then
            local szColor = "green";
            if WPlayer:GetLevel() < mCondition then
                nPass = 0;
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>®¹t cÊp %d<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "number" and szConditionName == "nBigLevel" then
            local szColor = "green";
            if WPlayer:GetBigLevel() < mCondition then
                nPass = 0;
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>®¹t %s<color>", szJoinString, szColor, self:Level2String(mCondition));
        end
        if type(mCondition) == "number" and szConditionName == "nExp" then
            local szColor = "green";
            if WPlayer:GetExp() < mCondition then
                nPass = 0;
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>®ñ %s<color>", szJoinString, szColor, self:Exp2String(mCondition));
        end
        if type(mCondition) == "number" and szConditionName == "nBattleRank" then
            local szColor = "green";
            if WPlayer:GetBattleRank() < mCondition then
                nPass = 0;
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>cã qu©n hµm %s<color>", szJoinString, szColor, self:BattleRank2Title(mCondition));
        end
        if type(mCondition) == "number" and szConditionName == "nHonor" then
            local szColor = "green";
            if WPlayer:GetHonor() < mCondition then
                nPass = 0;
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>c«ng tr¹ng ®¹t %d ®iÓm trë lªn<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "number" and szConditionName == "nBattlePoint" then
            local szColor = "green";
            if WPlayer:GetBattlePoint() < mCondition then
                nPass = 0;
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>tÝch lòy chiÕn tr­êng ®¹t %d ®iÓm trë lªn<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "number" and szConditionName == "nFactionPoint" then
            local szColor = "green";
            if WPlayer:GetFactionPoint() < mCondition then
                nPass = 0;
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>cã %d ®iÓm s­ m«n<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "number" and szConditionName == "nLinhKhi" then
            local szColor = "green";
            if WPlayer:GetLinhKhiPoint() < mCondition then
                nPass = 0;
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>cã %d ®iÓm linh khÝ<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "number" and szConditionName == "nPopur" then
            local szColor = "green";
            if WPlayer:GetPopur() < mCondition then
                nPass = 0;
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>cã %d ®iÓm tu luyÖn<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "number" and szConditionName == "nRepute" then
            local szColor = "green";
            if WPlayer:GetRepute() < mCondition then
                nPass = 0;
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>danh väng ®¹t %d ®iÓm<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "table" and szConditionName == "tbItems" then
            for _, tbItem in mCondition do
                if _ ~= "n" and tbItem.tbProp and type(tbItem.tbProp) == "table" then
                    local szColor = "green";
                    local szName = tbItem.szName or WItem:GetName(tbItem.tbProp);
                    if WItem:Count(tbItem.tbProp) < tbItem.nCount then
                        nPass = 0;
                        szColor = "red";
                    end
                    local szItemDescText = "®em theo ";
                    nItemCount = nItemCount + 1;
                    if nItemCount > 1 then
                        szItemDescText = ", ";
                    end
                    szMessage = szMessage .. format("%s<color=%s>%s%d %s<color>", szJoinString, szColor, szItemDescText, tbItem.nCount, szName);
                end
            end
        end
    end

    if nPass == 1 then
        return WEnv.TRUE;
    else
        if bNotTalk == WEnv.NULL then
            szMsgFooter = szMsgFooter or format("Xin %s h·y chuÈn bÞ ®Çy ®ñ!", WPlayer:GetSexName());
            WNpc:Talk(szMessage .. format("<enter>§iÒu kiÖn <color=green>mµu xanh<color> lµ ®· ®¹t, <color=red>mµu ®á<color> lµ ch­a ®¹t.<enter>%s", szMsgFooter));
        end
        return WEnv.FALSE;
    end
end

function WLib:PayMaterial(tbRequirements, bNotTalk)
    if self:CheckMaterial(tbRequirements, "", "", bNotTalk) ~= WEnv.TRUE then
        return WEnv.FALSE;
    end
    local nPassedCondition = 0;
    for szConditionName, mCondition in tbRequirements do
        if szConditionName ~= "n" then
            if type(mCondition) == "number" and szConditionName == "nGold" then
                WPlayer:PayGold(mCondition);
                nPassedCondition = nPassedCondition + 1;
            end
            if type(mCondition) == "number" and szConditionName == "nPhongHoa" then
                if WPlayer:GetPhongHoa() >= mCondition then
                    WPlayer:ModifyPhongHoaPoint(-mCondition);
                    nPassedCondition = nPassedCondition + 1;
                end
            end
            if type(mCondition) == "number" and szConditionName == "nMeridianLevel" then
                if WPlayer:GetMeridianLevel() >= mCondition then
                    nPassedCondition = nPassedCondition + 1;
                end
            end
            if type(mCondition) == "number" and szConditionName == "nLevel" then
                if WPlayer:GetLevel() >= mCondition then
                    nPassedCondition = nPassedCondition + 1;
                end
            end
            if type(mCondition) == "number" and szConditionName == "nBigLevel" then
                if WPlayer:GetBigLevel() >= mCondition then
                    nPassedCondition = nPassedCondition + 1;
                end
            end
            if type(mCondition) == "number" and szConditionName == "nExp" then
                if WPlayer:BigDelExp(mCondition) == 1 then
                    nPassedCondition = nPassedCondition + 1;
                end
            end
            if type(mCondition) == "number" and szConditionName == "nBattleRank" then
                if WPlayer:GetBattleRank() >= mCondition then
                    nPassedCondition = nPassedCondition + 1;
                end
            end
            if type(mCondition) == "number" and szConditionName == "nHonor" then
                if WPlayer:GetHonor() >= mCondition then
                    nPassedCondition = nPassedCondition + 1;
                end
            end
            if type(mCondition) == "number" and szConditionName == "nBattlePoint" then
                if WPlayer:GetBattlePoint() >= mCondition then
                    WPlayer:ModifyBattlePoint(-mCondition);
                    nPassedCondition = nPassedCondition + 1;
                end
            end
            if type(mCondition) == "number" and szConditionName == "nFactionPoint" then
                if WPlayer:GetFactionPoint() >= mCondition then
                    nPassedCondition = nPassedCondition + 1;
                end
            end
            if type(mCondition) == "number" and szConditionName == "nLinhKhi" then
                if WPlayer:GetLinhKhiPoint() >= mCondition then
                    WPlayer:ModifyLinhKhiPoint(-mCondition);
                    nPassedCondition = nPassedCondition + 1;
                end
            end
            if type(mCondition) == "number" and szConditionName == "nPopur" then
                if WPlayer:GetPopur() >= mCondition then
                    ModifyPopur(-mCondition);
                    nPassedCondition = nPassedCondition + 1;
                end
            end
            if type(mCondition) == "number" and szConditionName == "nRepute" then
                if WPlayer:GetRepute() >= mCondition then
                    nPassedCondition = nPassedCondition + 1;
                end
            end
            if type(mCondition) == "table" and szConditionName == "tbItems" then
                local nSubPass = 0;
                for _, tbItem in mCondition do
                    if tbItem.tbProp and type(tbItem.tbProp) == "table" then
                        if WItem:Delete(tbItem.tbProp, tbItem.nCount) == WEnv.RETCODE_SUCCESS then
                            nSubPass = nSubPass + 1;
                            if tbItem.tbProp[1] == GENRE_ITEM_OTHER then
                                FireEvent("event_ib_cost", tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.nCount);
                            end
                        end
                    end
                end
                if nSubPass == self:TableLength(mCondition) then
                    nPassedCondition = nPassedCondition + 1;
                end
            end
        end
    end

    if nPassedCondition == self:TableLength(tbRequirements) then
        return WEnv.TRUE;
    else
        return WEnv.FALSE;
    end
end

function WLib:MaterialDescription(tbRequirements)
    local nItemCount = 0;
    local szJoinString = ", ";
    local szMessage = "";
    local nIndex = 0;
    for szConditionName, mCondition in tbRequirements do
        nIndex = nIndex + 1
        if nIndex == 1 then
            szJoinString = "";
        else
            szJoinString = ", ";
        end
        if type(mCondition) == "number" and szConditionName == "nPhongHoa" then
            local szColor = "green";
            if WPlayer:GetPhongHoa() < mCondition then
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>%d ®iÓm phong hoa<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "number" and szConditionName == "nGold" then
            local szColor = "green";
            if WPlayer:GetGold() < mCondition then
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>%d vµng<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "number" and szConditionName == "nMeridianLevel" then
            local szColor = "green";
            if WPlayer:GetMeridianLevel() < mCondition then
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>kinh m¹ch ®¹t c¶nh giíi %s<color>", szJoinString, szColor, WPlayer:GetMeridianName(mCondition));
        end
        if type(mCondition) == "number" and szConditionName == "nLevel" then
            local szColor = "green";
            if WPlayer:GetLevel() < mCondition then
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>®¹t cÊp %d<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "number" and szConditionName == "nBigLevel" then
            local szColor = "green";
            if WPlayer:GetBigLevel() < mCondition then
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>®¹t %s<color>", szJoinString, szColor, self:Level2String(mCondition));
        end
        if type(mCondition) == "number" and szConditionName == "nExp" then
            local szColor = "green";
            if WPlayer:GetExp() < mCondition then
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>®ñ %s<color>", szJoinString, szColor, self:Exp2String(mCondition));
        end
        if type(mCondition) == "number" and szConditionName == "nBattleRank" then
            local szColor = "green";
            if WPlayer:GetBattleRank() < mCondition then
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>cã qu©n hµm %s<color>", szJoinString, szColor, self:BattleRank2Title(mCondition));
        end
        if type(mCondition) == "number" and szConditionName == "nHonor" then
            local szColor = "green";
            if WPlayer:GetHonor() < mCondition then
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>c«ng tr¹ng ®¹t %d ®iÓm trë lªn<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "number" and szConditionName == "nBattlePoint" then
            local szColor = "green";
            if WPlayer:GetBattlePoint() < mCondition then
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>%d tÝch lòy chiÕn tr­êng<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "number" and szConditionName == "nFactionPoint" then
            local szColor = "green";
            if WPlayer:GetFactionPoint() < mCondition then
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>cã %d ®iÓm s­ m«n<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "number" and szConditionName == "nLinhKhi" then
            local szColor = "green";
            if WPlayer:GetLinhKhiPoint() < mCondition then
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>cã %d ®iÓm Linh KhÝ<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "number" and szConditionName == "nPopur" then
            local szColor = "green";
            if WPlayer:GetPopur() < mCondition then
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>cã %d ®iÓm Tu LuyÖn<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "number" and szConditionName == "nRepute" then
            local szColor = "green";
            if WPlayer:GetRepute() < mCondition then
                szColor = "red";
            end
            szMessage = szMessage .. format("%s<color=%s>danh väng ®¹t %d ®iÓm<color>", szJoinString, szColor, mCondition);
        end
        if type(mCondition) == "table" and szConditionName == "tbItems" then
            for _, tbItem in mCondition do
                if _ ~= "n" and tbItem.tbProp and type(tbItem.tbProp) == "table" then
                    local szColor = "green";
                    local szName = tbItem.szName or WItem:GetName(tbItem.tbProp)
                    if WItem:Count(tbItem.tbProp) < tbItem.nCount then
                        szColor = "red";
                    end
                    local szItemDescText = "cã ";
                    nItemCount = nItemCount + 1;
                    if nItemCount > 1 then
                        szItemDescText = ", ";
                    end
                    szMessage = szMessage .. format("%s<color=%s>%s%d %s<color>", szJoinString, szColor, szItemDescText, tbItem.nCount, szName);
                end
            end
        end
    end

    return szMessage;
end

function WLib:GetMaterialNeedRoom(tbRequirements)
    local nTotal = 0;
    for i = 1, getn(tbRequirements) do
        if type(tbRequirements[i].nCount) == "number" then
            nTotal = nTotal + 1;
        end
    end
    return nTotal;
end

function WLib:GetServerId()
    return GetGlbValue(GLB_VALUE_SERVER_ID);
end

function WLib:IsTestServer()
    --if self:GetServerId() > 99 and not WPlayer:IsAdmin() then
    if self:GetServerId() > 99 then
        return WEnv.TRUE;
    else
        return WEnv.FALSE;
    end
end

function WLib:ServerIsOpened()
    local tbTimeOpen = self:GetSrvCfg("tbTimeOpen");
    if GetTime() >= MkTime(tbTimeOpen.nYear, tbTimeOpen.nMonth, tbTimeOpen.nDay, tbTimeOpen.nHour, 0, 0) then
        return WEnv.TRUE;
    else
        return WEnv.FALSE;
    end
end

function WLib:OpenLuckyBox()
    SendScript2Client("Open[[luckybox]]");
    return WEnv.RETCODE_SUCCESS;
end

function WLib:OpenTuBaoTrai()
    SendScript2Client("Open[[JbzBox]]");
    return WEnv.RETCODE_SUCCESS;
end

function WLib:ShowInputNumber(szCallback, nMin, nMax)
    nMin = nMin or 0;
    nMax = nMax or 9999;
    AskClientForNumber(szCallback, nMin, nMax, "NhËp vµo sè l­îng.");
end

function WLib:GetValueFromRange(nPosition, nStart, nEnd)
    local nIndex = 0;
    for i = nStart, nEnd do
        nIndex = nIndex + 1;
        if nIndex == nPosition then
            return i;
        end
    end
    return WEnv.NULL;
end

function WLib:GetPosValue(nSource, nStart, nEnd)
    return floor(mod(nSource, 10 ^ (nEnd)) / (10 ^ (nStart - 1)));
end

function WLib:SetPosValue(nSource, nSetValue, nStart, nEnd)
    local nHead = floor(nSource / (10 ^ nEnd)) * (10 ^ nEnd);
    local nTail = mod(nSource, 10 ^ (nStart - 1));
    local nBody = nSetValue * (10 ^ (nStart - 1));
    return (nHead + nBody + nTail);
end

function WLib:GetSrvCfg(szKey, nServerId)
    local nCurServerId = nServerId or self:GetServerId();
    if nCurServerId then
        return g_tbServerCfg[nCurServerId][szKey];
    end
    return g_tbServerDefaultCfg[szKey];
end

function WLib:IsInDualTopTime()
    local nDate = WDate:Today()
    return self:GetSrvCfg("bOpenTop") == 1 and nDate >= self:GetSrvCfg("tbTimeTop").nStartDate and nDate < self:GetSrvCfg("tbTimeTop").nEndDate;
end

function WLib:OpenEquipShop(nShopId)
    if g_tbEquipShop[nShopId] == WEnv.NULL then
        return WEnv.RETCODE_UNDEFINE;
    end

    SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", nShopId, g_tbEquipShop[nShopId]));
    return WEnv.RETCODE_SUCCESS;
end

function WLib:Random(tbItem)
    if tbItem == WEnv.NULL then
        return WEnv.NULL;
    end
    local nRateTotal = 10000000;
    local nRandom = random(1, nRateTotal);
    local nStep = 0;
    for i = 1, getn(tbItem) do
        nStep = nStep + floor(tbItem[i].nRate * nRateTotal / 100);
        if (nRandom <= nStep) then
            return tbItem[i], i;
        end
    end
    return WEnv.NULL;
end

function WLib:SetUnitCurStates(nNpcIdx, nAttrIdx, nValue)
    if nValue > 99 and nAttrIdx ~= 1 and nAttrIdx ~= 4 and nAttrIdx ~= 5 and nAttrIdx ~= 6 then
        return WEnv.FALSE;
    end
    local nLastValue = GetUnitCurStates(nNpcIdx, nAttrIdx);
    nLastValue = nValue - nLastValue;
    AddUnitStates(nNpcIdx, nAttrIdx, nLastValue);
    return WEnv.TRUE;
end

----------------------------
-- Hµm format l¹i chuçi string ®èi tho¹i víi mét sè code tag
-- return: string (chuçi  sau khi format)
-- param: string (chuçi  sau khi format)
function WLib:StringFormal(szMsg, ...)
    local szNewStr = tostring(szMsg or "");
    if arg then
        szNewStr = format(szNewStr, self:UnPack(arg));
    end
    if szNewStr ~= "" then
        szNewStr = self:Replace(szNewStr, "<npcname>", "<color=green>" .. WNpc:GetName() .. "<color>");
        szNewStr = self:Replace(szNewStr, "<playername>", "<color=yellow>" .. WPlayer:GetName() .. "<color>");
        szNewStr = self:Replace(szNewStr, "<sex>", WPlayer:GetSexName());
        return szNewStr;
    else
        return "";
    end
end

function WLib:Replace(szInput, szPattern, szReplace)
    if szPattern == szReplace then
        -- chÆn viÖc ®­a vµo cïng 1 gi¸ trÞ
        return szInput;
    end

    local nMaxLoop = strlen(szInput);
    local nReplaceLength = strlen(szReplace);
    local nLoop = 0;
    local nStart, nEnd = strfind(szInput, szPattern);
    while (nStart) do
        if nLoop > nMaxLoop then
            print("[Hµm sè b¸o lçi]: sè lÇn replace qu¸ lín, tr¸nh chÕt liªn tôc, buéc tho¸t ra");
            return "";
        end
        szInput = strsub(szInput, 1, nStart - 1) .. szReplace .. strsub(szInput, nEnd + 1, strlen(szInput));
        nStart, nEnd = strfind(szInput, szPattern, nStart + nReplaceLength);
        nLoop = nLoop + 1;
    end
    return szInput;
end

function WLib:Join(tb, szDelimiter)
    szDelimiter = szDelimiter or ",";
    local szNewStr = "";

    if tb.n == WEnv.NULL then
        for _, content in pairs(tb) do
            if _ ~= "n" then
                if szNewStr == "" then
                    szNewStr = tostring(content) or "nil";
                else
                    szNewStr = szNewStr .. szDelimiter .. (tostring(content) or "nil");
                end
            end
        end
    else
        local content = "";
        for i = 1, getn(tb) do
            content = tb[i];
            if szNewStr == "" then
                szNewStr = tostring(content) or "nil";
            else
                szNewStr = szNewStr .. szDelimiter .. (tostring(content) or "nil");
            end
        end
    end
    return szNewStr;
end

function WLib:ConvertColorString(szString, tbColorInfo)
    tbColorInfo = tbColorInfo or g_tbColorInfo;

    for i = 1, getn(tbColorInfo) do
        szString = self:Replace(szString, tbColorInfo[i][1], "<color=" .. tbColorInfo[i][3] .. ">");
        szString = self:Replace(szString, tbColorInfo[i][2], "<color>");
    end
    return szString;
end

function WLib:RemoveTag(szInput, szTagStart, szTagEnd)
    szTagStart = szTagStart or "<";
    szTagEnd = szTagEnd or ">";
    
    local szSubStr = "";
    local nTagStartIdx = strfind(szInput, szTagStart, 1);
    local nTagEndIdx = strfind(szInput, szTagEnd, 1);
    local nMaxLoop = strlen(szInput);
    local nLoop = 0;

    while nTagStartIdx ~= WEnv.NULL and nTagEndIdx ~= WEnv.NULL do
        if nLoop >= nMaxLoop then
            print("[Hµm sè b¸o lçi]: sè lÇn WLib:RemoveTag qu¸ lín, tr¸nh chÕt liªn tôc, buéc tho¸t ra");
            return "";
        end
        szSubStr = strsub(szInput, nTagStartIdx, nTagEndIdx);
        szInput = self:Replace(szInput, szSubStr, "");
        nTagStartIdx = strfind(szInput, szTagStart, nTagStartIdx);
        if nTagStartIdx ~= WEnv.NULL then
            nTagEndIdx = strfind(szInput, szTagEnd, nTagStartIdx);
        end
        nLoop = nLoop + 1;
    end
    return szInput;
end

-- Hµm kiÓm tra ho¹t ®éng cã ®ang më hay kh«ng
-- return: number (1= më; 0= ®ãng)
-- param: nDateOpen (1= lu«n më, =0 lu«n ®ãng, yyyymmdd= më vµo 00h ngµy ®ã)
-- param: nDateClose (1= lu«n më, yyyymmdd= ®ãng vµo lóc 24h ngµy ®ã)
function WLib:IsDateValid(nDateOpen, nDateClose)
    nDateOpen = tonumber(nDateOpen) or 0;
    nDateClose = tonumber(nDateClose) or 0;
    local nToday = WDate:Today();

    if nDateOpen == 1 -- më mÆc ®Þnh
            or (nDateOpen > 1 and nDateClose == 1 and nDateOpen <= nToday)  -- më theo ngµy nh­ng kh«ng kÕt thóc
            or (nDateOpen > 1 and nDateClose > 1 and nDateOpen <= nToday and nDateClose >= nToday)  -- më theo ngµy vµ cã h¹n
    then
        return WEnv.TRUE; -- trong thêi gian open
    end

    return WEnv.FALSE;
end

-- Hµm kiÓm tra trang bÞ cã n»m trong danh s¸ch hay kh«ng
-- return: number, table (idx, row info)
-- param: nGenre, nDetail, nParticular (m· item)
function WLib:FindValidItem(tbValidList, nGenre, nDetail, nParticular)
    tbValidList = tbValidList or {};
    nGenre = tonumber(nGenre) or 0;
    nDetail = tonumber(nDetail) or 0;
    nParticular = tonumber(nParticular) or 0;
    local nValidIdx = 0;

    for nIdx, tbItemInfo in pairs(tbValidList) do
        if nIdx ~= "n" and nGenre == tbItemInfo[1][2][1] and nDetail == tbItemInfo[1][2][2] and nParticular == tbItemInfo[1][2][3] then
            nValidIdx = nIdx;
            break ;
        end
    end

    return nValidIdx, tbValidList[nValidIdx] or WEnv.NULL;
end

function WLib:GenRandomCode(nLength)
    local tbChars = { "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M" };
    local tbNums = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    local szCode = "";
    local tbSelect = tbChars;
    for i = 1, nLength * 2 do
        if random(1, 100) > 50 then
            tbSelect = tbChars;
        else
            tbSelect = tbNums;
        end
        szCode = szCode .. tbSelect[random(1, getn(tbSelect))];
    end
    local nBegin = random(1, nLength);
    return strsub(szCode, nBegin, nBegin + nLength - 1);
end

function WLib:Translate(tbDict, szText)
    local nLanguageId = WTask:Get(WTASKID_CURRENT_LANGUAGE); -- 0: mÆc ®Þnh vn, 1: tiÕng anh
    if tbDict[szText] == WEnv.NULL or tbDict[szText][nLanguageId] == WEnv.NULL then
        return szText;
    else
        return tbDict[szText][nLanguageId];
    end
end

function WLib:MoneyFormat(nAmount)
    local szAmountStr = tostring(nAmount);
    local i = 10;
    while (i > 0) do
        szAmountStr, k = gsub(szAmountStr, "^(-?%d+)(%d%d%d)", '%1,%2');
        if (k == 0) then
            break ;
        end
        i = i - 1;
    end
    return szAmountStr;
end

function WLib:InputString(szPlaceHolderText, szTitleText, nMin, nMax, nDiff, fnCallback, ...)
    szTitleText = szTitleText or "NhËp ...";
    nMin = nMin or 0;
    nMax = nMax or 32;
    nDiff = nDiff or 0;
    local szDataKey = tostring(fnCallback) .. "_" .. nDiff;
    local tbCallbackInfo = WPlayer:GetUserData("InputString_" .. szDataKey) or {};
    tbCallbackInfo.szPlaceHolderText = (szPlaceHolderText or tbCallbackInfo.szPlaceHolderText) or "";
    tbCallbackInfo.fnCallback = fnCallback;
    tbCallbackInfo.nMin = nMin;
    tbCallbackInfo.nMax = nMax;
    tbCallbackInfo.arg = arg;
    WPlayer:SetUserData("InputString_cb_key", szDataKey);
    WPlayer:SetUserData("InputString_" .. szDataKey, tbCallbackInfo);
    AskClientForString("WLib_InputString_cb", tbCallbackInfo.szPlaceHolderText, nMin, nMax, szTitleText);
end
function WLib_InputString_cb(szInput)
    if szInput == WEnv.NULL then
        return WEnv.RETCODE_NOTOPEN;
    end

    local szDataKey = WPlayer:GetUserData("InputString_cb_key") or "";
    local tbCallbackInfo = WPlayer:GetUserData("InputString_" .. szDataKey);

    if tbCallbackInfo == WEnv.NULL or tbCallbackInfo.fnCallback == WEnv.NULL or tbCallbackInfo.nMin == WEnv.NULL or tbCallbackInfo.nMax == WEnv.NULL then
        return WEnv.RETCODE_NOTOPEN;
    end

    -- check string length
    szInput = tostring(szInput) or "";
    local nInputLength = strlen(szInput);
    if nInputLength < tbCallbackInfo.nMin or nInputLength > tbCallbackInfo.nMax then
        return WEnv.RETCODE_NOTOPEN;
    end

    tbCallbackInfo.szPlaceHolderText = szInput;
    tinsert(tbCallbackInfo.arg, tbCallbackInfo.szPlaceHolderText);
    WPlayer:SetUserData("InputString_" .. szDataKey, tbCallbackInfo);
    tbCallbackInfo.fnCallback(WLib:UnPack(tbCallbackInfo.arg));
end

function WLib:InputNumber(szTitleText, nMin, nMax, nDiff, fnCallback, ...)
    szTitleText = szTitleText or "NhËp ...";
    nMin = nMin or 1;
    nMax = nMax or 10000;
    nDiff = nDiff or 0;
    local szDataKey = tostring(fnCallback) .. "_" .. nDiff;
    local tbCallbackInfo = WPlayer:GetUserData("InputNumber_" .. szDataKey) or {};
    tbCallbackInfo.szPlaceHolderText = tbCallbackInfo.szPlaceHolderText or nMin;
    tbCallbackInfo.fnCallback = fnCallback;
    tbCallbackInfo.nMin = nMin;
    tbCallbackInfo.nMax = nMax;
    tbCallbackInfo.arg = arg;
    WPlayer:SetUserData("InputNumber_cb_key", szDataKey);
    WPlayer:SetUserData("InputNumber_" .. szDataKey, tbCallbackInfo);
    --AskClientForNumber("WLib_InputNumber_cb", nMin, nMax, szTitleText);
    AskClientForString("WLib_InputNumber_cb", tbCallbackInfo.szPlaceHolderText, nMin, nMax, szTitleText);
end
function WLib_InputNumber_cb(nInput)
    if nInput == WEnv.NUL then
        return WEnv.RETCODE_NOTOPEN;
    end

    local szDataKey = WPlayer:GetUserData("InputNumber_cb_key") or "";
    local tbCallbackInfo = WPlayer:GetUserData("InputNumber_" .. szDataKey);

    if tbCallbackInfo == WEnv.NULL or tbCallbackInfo.fnCallback == WEnv.NULL or tbCallbackInfo.nMin == WEnv.NULL or tbCallbackInfo.nMax == WEnv.NULL then
        return WEnv.RETCODE_NOTOPEN;
    end

    -- check number value
    nInput = tonumber(nInput) or 0;
    if nInput < tbCallbackInfo.nMin or nInput > tbCallbackInfo.nMax then
        return WEnv.RETCODE_NOTOPEN;
    end

    tbCallbackInfo.szPlaceHolderText = nInput;
    tinsert(tbCallbackInfo.arg, tbCallbackInfo.szPlaceHolderText);
    WPlayer:SetUserData("InputNumber_" .. szDataKey, tbCallbackInfo);
    tbCallbackInfo.fnCallback(WLib:UnPack(tbCallbackInfo.arg));
end

function WLib:Align(szString, nLength, nAlignType)
    szString = tostring(szString);
    local nStrLen = strlen(szString);
    if nStrLen >= nLength then
        return strsub(szString, 1, nLength)
    end
    for i = 1, nLength - nStrLen do
        if nAlignType == WEnv.NULL or nAlignType == 1 then
            szString = szString .. " ";
        else
            szString = " " .. szString;
        end
    end
    return szString;
end

function WLib:GetGSIndex()
    return GetGSIndex()[0];
end

function WLib:GetGSPlayers()
    local tbPlayerList = {};

    --- START LOOP PlayerIndex
    local nOldPlayerIdx = PlayerIndex;
    local nFoundPlayerIdx = FirstPlayer();
    while nFoundPlayerIdx > 0 do
        PlayerIndex = nFoundPlayerIdx;
        --- START TODO
        local nMapId, nPosX, nPosY = WPlayer:GetWorldPos();
        tinsert(tbPlayerList, { nFoundPlayerIdx, WPlayer:GetName(), nMapId, nPosX, nPosY });
        --- END TODO
        PlayerIndex = nOldPlayerIdx;
        nFoundPlayerIdx = NextPlayer(nFoundPlayerIdx);
    end
    PlayerIndex = nOldPlayerIdx;
    --- END LOOP PlayerIndex

    return tbPlayerList;
end

function WLib:OpenCaptcha(tbCustomRand, fnSuccess, tbArg, szCaptchaConfirm)
    if type(fnSuccess) ~= "function" then
        WNpc:Talk("Lçi gi¸ trÞ function callback!");
        return WEnv.RETCODE_ERROR;
    end

    tbCustomRand = tbCustomRand or {};
    local nMin = 1;
    local nMax = 1000;
    if getn(tbCustomRand) == 1 then
        nMax = abs(tonumber(tbCustomRand[1]) or 9999);
    end
    if getn(tbCustomRand) > 1 then
        nMin = abs(tonumber(tbCustomRand[1]) or 1000);
        nMax = abs(tonumber(tbCustomRand[2]) or 9999);
    end

    -- KiÓm tra captcha
    local nCurrentTime = GetTime();
    local nTempCaptcha = WTaskTemp:Get(WTASKTEMP_TEMP_CAPTCHA);
    local nLastFailedTime = WTaskTemp:Get(WTASKTEMP_CAPTCHA_FAILED_DURATION);
    local nTotalFailedCount = WTaskTemp:Get(WTASKTEMP_CAPTCHA_FAILED_COUNT);
    local nFailedDurationTime = 5 * (nTotalFailedCount - 5);

    if nTotalFailedCount >= 4 and nCurrentTime - nLastFailedTime < nFailedDurationTime then
        WNpc:Talk(format("B¹n nhËp sai m· captcha qu¸ nhiÒu lÇn, vui lßng ®îi <color=red>%d<color> gi©y n÷a!", nFailedDurationTime - (nCurrentTime - nLastFailedTime)), WEnv.TRUE);
        return WEnv.RETCODE_DENY;
    end

    if szCaptchaConfirm == WEnv.NULL or nTempCaptcha == 0 then
        local nNewCaptcha = random(nMin, nMax);
        WTaskTemp:Set(WTASKTEMP_TEMP_CAPTCHA, nNewCaptcha);
        WLib:InputString("", format("NhËp captcha: %d", nNewCaptcha), 1, 6, 0, WLib.OpenCaptcha, WLib, tbCustomRand, fnSuccess, tbArg);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if nTempCaptcha ~= (tonumber(szCaptchaConfirm) or 0) then
        WTaskTemp:Set(WTASKTEMP_CAPTCHA_FAILED_COUNT, nTotalFailedCount + 1);
        WTaskTemp:Set(WTASKTEMP_CAPTCHA_FAILED_DURATION, GetTime());
        WPlayer:Msg(format("M· captcha nhËp vµo kh«ng ®óng %d lÇn!", (nTotalFailedCount + 1)));
        local nNewCaptcha = random(nMin, nMax);
        WTaskTemp:Set(WTASKTEMP_TEMP_CAPTCHA, nNewCaptcha);
        WLib:InputString("", format("NhËp captcha: %d", nNewCaptcha), 1, 6, 0, WLib.OpenCaptcha, WLib, tbCustomRand, fnSuccess, tbArg);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    WTaskTemp:Set(WTASKTEMP_CAPTCHA_FAILED_COUNT, 0);
    WTaskTemp:Set(WTASKTEMP_CAPTCHA_FAILED_DURATION, 0);
    fnSuccess(WLib:UnPack(tbArg));
    return WEnv.RETCODE_SUCCESS;
end

function WLib:GetTabFileTable(szFilePath, nDataStartLine, handles)
    handles = handles or {}
    nDataStartLine = nDataStartLine or 2;    --ÕæÕýµÄÊý¾ÝÄ¬ÈÏ´ÓµÚ2ÐÐ¿ªÊ¼
    local tbFile = new(KTabFile, szFilePath);
    if not tbFile then
        TabFile_Unload(szFilePath);
        return {};
    end ;
    local nRow = tbFile:getRow();
    local nCol = tbFile:getCol();
    local tbRet = {};
    tbRet[0] = {};
    for i = 1, nCol do
        tbRet[0][i] = tbFile:getCell(1, i);    --Ë÷Òý0Îª±íÍ·ÄÚÈÝ
    end ;
    for i = 1, nRow - nDataStartLine + 1 do
        tbRet[i] = {};
        for j = 1, nCol do
            local szKey = tbRet[0][j];
            local data = tbFile:getCell(i + nDataStartLine - 1, j);    --¶ÁÊý¾Ý
            local err
            if handles[szKey] then
                data, err = handles[szKey](data);
            elseif handles[j] then
                data, err = handles[j](data);
            end
            if err then
                error(err)
            end
            tbRet[i][j] = data;
        end
    end
    tbFile:close();
    return tbRet;
end

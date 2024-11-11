----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-01
--- Description: Gold coin
----------------------------------------------------------------------------------------------------
m_szWWebCoinName = "WebCoin";
WWebCoin = WIC:RegType("warlord_webcoin", {
    fnDebug = nothing,

    nMaxNumber = 50000,

    tbExchanceTypes = {
        [1] = { szName = "Kim Nguyªn B¶o", tbProp = { 2, 1, 40032 }, nValue = 1000 },
        [2] = { szName = "Xu VËt PhÈm", tbProp = { 2, 1, 40033 }, nValue = 1 },
    },

    tbMsgString = {
        [1] = "<npcname>: Kim Nguyªn B¶o vµ Xu VËt PhÈm cña ta cã thÓ dïng ®Ó giao th­¬ng víi ng­êi kh¸c, <sex> cã thÓ dïng " .. m_szWWebCoinName .. " ®Ó ®æi víi tØ lÖ lµ: \n" ..
                " * 1000 " .. m_szWWebCoinName .. " = 1 Kim Nguyªn B¶o \n" ..
                " * 1 " .. m_szWWebCoinName .. " = 1 Xu VËt PhÈm \n!",
        [2] = "Ta muèn ®æi Kim Nguyªn B¶o",
        [3] = "Ta muèn ®æi Xu VËt PhÈm",
        [4] = "\nT¹m thêi ta ch­a cÇn ®Õn",
        [5] = m_szWWebCoinName .. " kh«ng ®ñ ®Ó thùc hiÖn giao dÞch",
        [6] = m_szWWebCoinName .. " cña b¹n v­ît qu¸ møc cho phÐp",
        [7] = "NhËp sè %s cÇn rót",
        [8] = "Sè d­ qu¸ nhá kh«ng thÓ rót %d %s (tèi thiÓu cÇn %s " .. m_szWWebCoinName .. ")",
    },
});

function WWebCoin:QueryWebCoin()
    self:Get(WPlayer:GetAccount(), "", WWebCoin.QueryWebCoin_cb);
end

function WWebCoin:QueryWebCoin_cb(nRetCode, nPoint, ...)
    if nRetCode == 1 then
        local tbSay = { self.tbMsgString[1] };
        tinsert(tbSay, format("%s/#WWebCoin:ExchanceWebCoin(1, %d)", self.tbMsgString[2], nPoint));
        tinsert(tbSay, format("%s/#WWebCoin:ExchanceWebCoin(2, %d)", self.tbMsgString[3], nPoint));
        tinsert(tbSay, format("%s/nothing", self.tbMsgString[4]));
        WNpc:SayDialog(tbSay);
    else
        self:Set(WPlayer:GetAccount(), "", 0, WWebCoin.QueryWebCoin_cb);
    end
    return WEnv.RETCODE_SUCCESS;
end

function WWebCoin:ExchanceWebCoin(nExchanceType, nCurrentPoint)
    if type(nExchanceType) ~= "number" or type(nCurrentPoint) ~= "number" then
        -- log hack, tr­êng hîp nhËp sai kiÓu gi¸ trÞ
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_NOT_NUMBER", "ExchanceWebCoin Bug nExchanceType, nCurrentPoint is not number", "args", "all args value is number", { 0, 0, nCurrentPoint, nExchanceType, 0, 0, "" });
        return WEnv.RETCODE_ERROR;
    end

    if nCurrentPoint <= 0 then
        WNpc:Talk(self.tbMsgString[5], 1);
        if nCurrentPoint < 0 then
            -- log hack, tr­êng hîp nhËp sè ©m
            WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_NEGATIVE_NUMBER", format("ExchanceWebCoin Bug nCurrentPoint(%d) < 0", nCurrentPoint), nCurrentPoint, "nCurrentPoint > 0", { 0, 0, nCurrentPoint, nExchanceType, 0, 0, "" });
        end
        return WEnv.RETCODE_ERROR;
    end

    if nCurrentPoint > self.nMaxNumber then
        WNpc:Talk(self.tbMsgString[6], 1);
        -- log hack, tr­êng hîp tµi kho¶n cã gi¸ trÞ v­ît qu¸ th× kh«ng cho rót
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_MAX_NUMBER", format("ExchanceWebCoin Bug nCurrentPoint(%d) > self.nMaxNumber(%d)", nCurrentPoint, self.nMaxNumber), nCurrentPoint, "nCurrentPoint < " .. self.nMaxNumber, { 0, 0, nCurrentPoint, nExchanceType, 0, 0, "" });
        return WEnv.RETCODE_ERROR;
    end

    local tbExchanceTypeInfo = self.tbExchanceTypes[nExchanceType];
    local nMin = 1;
    local nMax = floor(nCurrentPoint / tbExchanceTypeInfo.nValue);
    if nMax > 0 then
        WLib:InputNumber(format(self.tbMsgString[7], tbExchanceTypeInfo.szName), nMin, nMax, 0, WWebCoin.ExchanceWebCoinToItem, WWebCoin, nCurrentPoint, nExchanceType);
    else
        -- kh«ng ®ñ sè d­
        WNpc:Talk(format(self.tbMsgString[8], 1, tbExchanceTypeInfo.szName, WLib:MoneyFormat(tbExchanceTypeInfo.nValue)), 1);
    end
end

function WWebCoin:ExchanceWebCoinToItem(nLastPoint, nExchanceType, nAmount)
    if type(nLastPoint) ~= "number" or type(nExchanceType) ~= "number" or type(nAmount) ~= "number" then
        -- log hack, tr­êng hîp nhËp sai kiÓu gi¸ trÞ
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_NOT_NUMBER", "ExchanceWebCoinToItem Bug nLastPoint, nExchanceType, nAmount is not number", "args", "all args value is number", { 0, 0, nLastPoint, nExchanceType, 0, nAmount, "" });
        return WEnv.RETCODE_ERROR;
    end
    if self.tbExchanceTypes[nExchanceType] == WEnv.NULL then
        -- log hack, tr­êng hîp nhËp sai kiÓu ®æi dÉn ®Õn kh«ng t×m thÊy th«ng tin
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_NOT_EXCHANCE_TYPE", format("ExchanceWebCoinToItem Bug nExchanceType(%d) not found", nExchanceType), nExchanceType or "nil", "not = " .. (nExchanceType .. "nil"), { 0, 0, nLastPoint, nExchanceType, 0, nAmount, "" });
        return WEnv.RETCODE_ERROR;
    end
    if nAmount <= 0 then
        -- log hack, tr­êng hîp nhËp sè ©m
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_NEGATIVE_NUMBER", format("ExchanceWebCoinToItem Bug nAmount(%d) <= 0", nAmount), nAmount, "nAmount > 0", { 0, 0, nLastPoint, nExchanceType, 0, nAmount, "" });
        return WEnv.RETCODE_ERROR;
    end

    self:Get(WPlayer:GetAccount(), "", WWebCoin.ExchanceWebCoinToItem_cb, { nLastPoint, nExchanceType, 0, nAmount });
end

function WWebCoin:ExchanceWebCoinToItem_cb(nRetCode, nPoint, ...)
    --- gièng cb2
    local nLastPoint = arg[1];
    local nExchanceType = arg[2];
    local nModifyValue = arg[3];
    local nAmount = arg[4];
    if type(nLastPoint) ~= "number" or type(nExchanceType) ~= "number" or type(nAmount) ~= "number" or type(nModifyValue) ~= "number" then
        -- log hack, tr­êng hîp nhËp sai kiÓu gi¸ trÞ
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_NOT_NUMBER", "ExchanceWebCoinToItem_cb Bug args is not number", "args", "all args value is number", { nRetCode, nPoint, nLastPoint, nExchanceType, nModifyValue, nAmount, "" });
        return WEnv.RETCODE_ERROR;
    end
    if self.tbExchanceTypes[nExchanceType] == WEnv.NULL then
        -- log hack, tr­êng hîp nhËp sai kiÓu ®æi dÉn ®Õn kh«ng t×m thÊy th«ng tin
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_NOT_EXCHANCE_TYPE", format("ExchanceWebCoinToItem_cb Bug nExchanceType(%d) not found", nExchanceType), nExchanceType or "nil", "not = " .. (nExchanceType .. "nil"), { nRetCode, nPoint, nLastPoint, nExchanceType, nModifyValue, nAmount, "" });
        return WEnv.RETCODE_ERROR;
    end
    if nAmount <= 0 then
        -- log hack, tr­êng hîp nhËp sè ©m
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_NEGATIVE_NUMBER", format("ExchanceWebCoinToItem_cb Bug nAmount(%d) <= 0", nAmount), nAmount, "nAmount > 0", { nRetCode, nPoint, nLastPoint, nExchanceType, nModifyValue, nAmount, "" });
        return WEnv.RETCODE_ERROR;
    end
    if nPoint < 0 then
        -- log hack, tr­êng hîp nhËp sè ©m
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_NEGATIVE_NUMBER", format("ExchanceWebCoinToItem_cb Bug nPoint(%d) < 0", nPoint), nPoint, "nPoint > 0", { nRetCode, nPoint, nLastPoint, nExchanceType, nModifyValue, nAmount, "" });
        return WEnv.RETCODE_ERROR;
    end
    if nAmount > self.nMaxNumber then
        -- log hack, tr­êng hîp nhËp sè v­ît qu¸ gi¸ trÞ cho phÐp
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_MAX_NUMBER", format("ExchanceWebCoinToItem_cb Bug nAmount(%d) > self.nMaxNumber(%d)", nAmount, self.nMaxNumber), nAmount, nLastPoint, { nRetCode, nPoint, nLastPoint, nExchanceType, nModifyValue, nAmount, "" });
        return WEnv.RETCODE_ERROR;
    end
    if nPoint > self.nMaxNumber then
        -- log hack, tr­êng hîp tµi kho¶n cã gi¸ trÞ v­ît qu¸ th× kh«ng cho rót
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_MAX_NUMBER", format("ExchanceWebCoinToItem_cb Bug nPoint(%d) > self.nMaxNumber(%d)", nPoint, self.nMaxNumber), nPoint, nLastPoint, { nRetCode, nPoint, nLastPoint, nExchanceType, nModifyValue, nAmount, "" });
        return WEnv.RETCODE_ERROR;
    end
    --- gièng cb2

    local tbExchanceTypeInfo = self.tbExchanceTypes[nExchanceType];
    local nModifyValue = -abs(nAmount * tbExchanceTypeInfo.nValue);
    if nRetCode == 1 and nPoint > 0 and nPoint >= abs(nModifyValue) then
        self:Modify(WPlayer:GetAccount(), "", nModifyValue, WWebCoin.ExchanceWebCoinToItem_cb2, { nPoint, nExchanceType, nModifyValue, nAmount });
    else
        -- kh«ng ®ñ sè d­
        WNpc:Talk(format(self.tbMsgString[8], nAmount, tbExchanceTypeInfo.szName, WLib:MoneyFormat(abs(nModifyValue))), 1);
    end
end

function WWebCoin:ExchanceWebCoinToItem_cb2(nRetCode, nPoint, ...)
    --- gièng cb2
    local nLastPoint = arg[1];
    local nExchanceType = arg[2];
    local nModifyValue = arg[3];
    local nAmount = arg[4];
    if type(nLastPoint) ~= "number" or type(nExchanceType) ~= "number" or type(nAmount) ~= "number" or type(nModifyValue) ~= "number" then
        -- log hack, tr­êng hîp nhËp sai kiÓu gi¸ trÞ
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_NOT_NUMBER", "ExchanceWebCoinToItem_cb2 Bug args is not number", "args", "all args value is number", { nRetCode, nPoint, nLastPoint, nExchanceType, nModifyValue, nAmount, "" });
        return WEnv.RETCODE_ERROR;
    end
    if self.tbExchanceTypes[nExchanceType] == WEnv.NULL then
        -- log hack, tr­êng hîp nhËp sai kiÓu ®æi dÉn ®Õn kh«ng t×m thÊy th«ng tin
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_NOT_EXCHANCE_TYPE", format("ExchanceWebCoinToItem_cb2 Bug nExchanceType(%d) not found", nExchanceType), nExchanceType or "nil", "not = " .. (nExchanceType .. "nil"), { nRetCode, nPoint, nLastPoint, nExchanceType, nModifyValue, nAmount, "" });
        return WEnv.RETCODE_ERROR;
    end
    if nAmount <= 0 then
        -- log hack, tr­êng hîp nhËp sè ©m
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_NEGATIVE_NUMBER", format("ExchanceWebCoinToItem_cb2 Bug nAmount(%d) <= 0", nAmount), nAmount, "nAmount > 0", { nRetCode, nPoint, nLastPoint, nExchanceType, nModifyValue, nAmount, "" });
        return WEnv.RETCODE_ERROR;
    end
    if nPoint < 0 then
        -- log hack, tr­êng hîp nhËp sè ©m
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_NEGATIVE_NUMBER", format("ExchanceWebCoinToItem_cb2 Bug nPoint(%d) < 0", nPoint), nPoint, "nPoint > 0", { nRetCode, nPoint, nLastPoint, nExchanceType, nModifyValue, nAmount, "" });
        return WEnv.RETCODE_ERROR;
    end
    if nAmount > self.nMaxNumber then
        -- log hack, tr­êng hîp nhËp sè v­ît qu¸ gi¸ trÞ cho phÐp
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_MAX_NUMBER", format("ExchanceWebCoinToItem_cb2 Bug nAmount(%d) > self.nMaxNumber(%d)", nAmount, self.nMaxNumber), nAmount, nLastPoint, { nRetCode, nPoint, nLastPoint, nExchanceType, nModifyValue, nAmount, "" });
        return WEnv.RETCODE_ERROR;
    end
    if nPoint > self.nMaxNumber then
        -- log hack, tr­êng hîp tµi kho¶n cã gi¸ trÞ v­ît qu¸ th× kh«ng cho rót
        WPlayerLog:WriteBugLog("WWebCoin_ExchanceWebCoin_BUG", "BUG_MAX_NUMBER", format("ExchanceWebCoinToItem_cb2 Bug nPoint(%d) > self.nMaxNumber(%d)", nPoint, self.nMaxNumber), nPoint, nLastPoint, { nRetCode, nPoint, nLastPoint, nExchanceType, nModifyValue, nAmount, "" });
        return WEnv.RETCODE_ERROR;
    end
    --- gièng cb2

    local tbExchanceTypeInfo = self.tbExchanceTypes[nExchanceType];
    if nRetCode == 1 then
        local tbAward = self.tbExchanceTypes[nExchanceType];
        tbAward.nStack = nAmount;
        local nRetAdd = WAward:Give(tbAward, "WWebCoin_ExchanceWebCoin");
        WPlayerLog:WriteAddItemLog("WWebCoin_ExchanceWebCoin", format("ExchanceWebCoinToItem_cb2 Exchance(%d %s) to (%d %s)", nModifyValue, m_szWWebCoinName, nAmount, tbAward.szName), nRetAdd, tbAward, nAmount, { nRetCode, nPoint, nLastPoint, nExchanceType, nAmount, nModifyValue, WLib:Join(tbAward.tbProp, ",") });
    else
        -- kh«ng ®ñ sè d­
        WNpc:Talk(format(self.tbMsgString[8], nAmount, tbExchanceTypeInfo.szName, WLib:MoneyFormat(abs(nModifyValue))), 1);
    end
end

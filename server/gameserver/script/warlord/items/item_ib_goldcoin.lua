----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-01
--- Description: mod item xu ngù c¸c
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
WGoldCoin = {
    fnDebug = nothing,
    nMaxValue = 10000000,
    tbItemConsume = {
        --[PackItemId(2, 1, 40032)] = {
        --    szName = "Kim Nguyªn B¶o",
        --    tbProp = { 2, 1, 40032 },
        --    nValue = 1000,
        --    nMaxUseOneTime = 1000,
        --},
        [PackItemId(2, 1, 30230)] = {
            szName = "VËt phÈm Xu", -- vng
            tbProp = { 2, 1, 30230 },
            nValue = 1,
            nMaxUseOneTime = 50000,
        },
    },

    tbMsgString = {
        [1] = "<sex> ®ang gi÷ trªn ng­êi mét l­îng lín xu råi, kh«ng thÓ sö dông thªm %s!",
        [2] = "Mét lÇn <sex> cã thÓ sö dông tèi ®a %d %s!",
        [3] = "Trªn ng­êi <sex> kh«ng cã ®ñ %d %s!",
        [4] = "Kh«ng sö dông ®­îc vËt phÈm %s, <sex> h·y liªn hÖ nhµ ph¸t hµnh ®Ó xö lý!",
        [5] = "<sex> ®· nhËn ®­îc %s xu ngù c¸c, h·y ®¨ng nhËp l¹i ®Ó cËp nhËp sè d­!",
    },
};

function WGoldCoin:UseItemConsume(nGenre, nDetail, nParticular, nAmount)
    local nExchanceType = PackItemId(nGenre, nDetail, nParticular);
    local tbItemConsumeInfo = self.tbItemConsume[nExchanceType];
    if type(tbItemConsumeInfo) ~= "table" then
        return WEnv.RETCODE_NOTOPEN;
    end

    local nCurrentGoldCoin = GetGoldCoin();
    local nModifyValue = tbItemConsumeInfo.nValue * nAmount;
    nAmount = tonumber(nAmount) or 0;
    if nAmount <= 0 then
        if nAmount < 0 then
            -- log hack, tr­êng hîp nhËp sè ©m
            WPlayerLog:WriteBugLog("WGoldCoin_UseItemConsume_BUG", "BUG_NEGATIVE_NUMBER", format("UseItemConsume Bug nAmount(%d) < 0", nAmount), nAmount, "nAmount > 0", { 0, 0, nCurrentGoldCoin, nExchanceType, nModifyValue, nAmount, "" });
        end
        return WEnv.RETCODE_NOTOPEN;
    end

    if nCurrentGoldCoin >= self.nMaxValue then
        WNpc:Talk(format(self.tbMsgString[1], tbItemConsumeInfo.szName), 1);
        return WEnv.RETCODE_NOTOPEN;
    end

    if nAmount > tbItemConsumeInfo.nMaxUseOneTime then
        WNpc:Talk(format(self.tbMsgString[2], tbItemConsumeInfo.nMaxUseOneTime, tbItemConsumeInfo.szName), 1);
        return WEnv.RETCODE_CONSUMEERROR;
    end

    local nItemCount = WItem:Count(tbItemConsumeInfo.tbProp);
    if nItemCount < nAmount then
        WNpc:Talk(format(self.tbMsgString[3], nAmount, tbItemConsumeInfo.szName), 1);
        return WEnv.RETCODE_CONSUMEERROR;
    end

    local nRetCode = WItem:Delete(tbItemConsumeInfo.tbProp, nAmount);
    if nRetCode ~= WEnv.RETCODE_SUCCESS then
        WNpc:Talk(format(self.tbMsgString[4], tbItemConsumeInfo.szName), 1);
        return WEnv.RETCODE_CONSUMEERROR;
    end
    WPlayerLog:WritePayItemLog("WGoldCoin_UseItemConsume", "Xãa vËt phÈm sö dông", nRetCode, tbItemConsumeInfo, nAmount);

    self:UpdatePaysys(nModifyValue);
    WPlayerLog:WriteGoldCoinLog("WGoldCoin_UseItemConsume", "Sö dông vËt phÈm", nCurrentGoldCoin, nExchanceType, nModifyValue, nAmount, { WItem:GetName(tbItemConsumeInfo.tbProp) .. " ", WLib:Join(tbItemConsumeInfo.tbProp, ",") });

    WNpc:Talk(format(self.tbMsgString[5], WLib:MoneyFormat(nModifyValue)), 1, "ExitGame");
end

function WGoldCoin:UpdatePaysys(nModifyValue)
    local szQuery = format([[UPDATE %s SET coin=coin+%d WHERE username=%q;]], "paysys.account", nModifyValue, WPlayer:GetAccount());
    SendGlbDBData(0, szQuery);
end

function OnUse(nItemIdx)
    local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
    local nExchanceType = PackItemId(nGenre, nDetail, nParticular);
    if WGoldCoin.tbItemConsume[nExchanceType] == WEnv.NULL then
        return WEnv.RETCODE_NOTMATCH;
    end

    local tbItemConsumeInfo = WGoldCoin.tbItemConsume[nExchanceType];
    local nItemCount = WItem:Count(tbItemConsumeInfo.tbProp);

    if nItemCount <= 0 then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    if nItemCount == 1 then
        WGoldCoin:UseItemConsume(nGenre, nDetail, nParticular, 1);
        return WEnv.RETCODE_SUCCESS;
    end

    if nItemCount >= tbItemConsumeInfo.nMaxUseOneTime then
        nItemCount = tbItemConsumeInfo.nMaxUseOneTime;
    end

    WLib:InputNumber("NhËp sè l­îng.", 1, nItemCount, 0,
            WGoldCoin.UseItemConsume, WGoldCoin, tbItemConsumeInfo.tbProp[1], tbItemConsumeInfo.tbProp[2], tbItemConsumeInfo.tbProp[3]);
end

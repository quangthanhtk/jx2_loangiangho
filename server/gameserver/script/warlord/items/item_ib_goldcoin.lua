----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-01
--- Description: mod item xu ng� c�c
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
WGoldCoin = {
    fnDebug = nothing,
    nMaxValue = 10000000,
    tbItemConsume = {
        --[PackItemId(2, 1, 40032)] = {
        --    szName = "Kim Nguy�n B�o",
        --    tbProp = { 2, 1, 40032 },
        --    nValue = 1000,
        --    nMaxUseOneTime = 1000,
        --},
        [PackItemId(2, 1, 30230)] = {
            szName = "V�t ph�m Xu", -- vng
            tbProp = { 2, 1, 30230 },
            nValue = 1,
            nMaxUseOneTime = 50000,
        },
    },

    tbMsgString = {
        [1] = "<sex> �ang gi� tr�n ng��i m�t l��ng l�n xu r�i, kh�ng th� s� d�ng th�m %s!",
        [2] = "M�t l�n <sex> c� th� s� d�ng t�i �a %d %s!",
        [3] = "Tr�n ng��i <sex> kh�ng c� �� %d %s!",
        [4] = "Kh�ng s� d�ng ���c v�t ph�m %s, <sex> h�y li�n h� nh� ph�t h�nh �� x� l�!",
        [5] = "<sex> �� nh�n ���c %s xu ng� c�c, h�y ��ng nh�p l�i �� c�p nh�p s� d�!",
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
            -- log hack, tr��ng h�p nh�p s� �m
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
    WPlayerLog:WritePayItemLog("WGoldCoin_UseItemConsume", "X�a v�t ph�m s� d�ng", nRetCode, tbItemConsumeInfo, nAmount);

    self:UpdatePaysys(nModifyValue);
    WPlayerLog:WriteGoldCoinLog("WGoldCoin_UseItemConsume", "S� d�ng v�t ph�m", nCurrentGoldCoin, nExchanceType, nModifyValue, nAmount, { WItem:GetName(tbItemConsumeInfo.tbProp) .. " ", WLib:Join(tbItemConsumeInfo.tbProp, ",") });

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

    WLib:InputNumber("Nh�p s� l��ng.", 1, nItemCount, 0,
            WGoldCoin.UseItemConsume, WGoldCoin, tbItemConsumeInfo.tbProp[1], tbItemConsumeInfo.tbProp[2], tbItemConsumeInfo.tbProp[3]);
end

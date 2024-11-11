----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-02
--- Description: event m� r��ng ho�t ��ng t�ch l�y h�ng n�y
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\lib\\sdb.lua");
----------------------------------------------------------------------------------------------------
--- H�m d�ng m�nh �� ��i l�y item
function WRUONGHD:ExchanceGoods(nSelect, nPayType, nAmount)
    nSelect = tonumber(nSelect) or 0;
    nPayType = tonumber(nPayType) or 0;

    if nSelect == 0 then
        local tbSay = { "<npcname>: M� r��ng nh�n ng�u nhi�n c�c m�nh gh�p c� th� ��i c�c v�t ph�m:" };
        tinsert(tbSay, format("%s/WRUONGHD:ExchanceGoods_VSCT", "D�ng 5 m�nh c�c lo�i ��i l�y 1 b� V� Song Chi�n Th�n+7"));

        for i = 1, getn(self.tbExchanceGoods) do
            tinsert(tbSay, format("%s/#WRUONGHD:ExchanceGoods(%d)", self.tbExchanceGoods[i].szName, i));
        end

        tinsert(tbSay, format("%s/nothing", "Ta ch� xem qua th�i."));
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if self.tbExchanceGoods[nSelect] == WEnv.NULL then
        return WEnv.RETCODE_NOTOPEN;
    end

    local nConsumeNum = self.tbExchanceGoods[nSelect].tbConsume.nCount;
    local tbConsume = self.tbMaterialType;

    if nPayType == 0 then
        local tbSay = { "Ch�n m�t trong c�c c�ch ��i sau:" };

        for k, v in pairs(tbConsume) do
            tinsert(tbSay, format("%d %s/#WRUONGHD:ExchanceGoods(%d, %d)", nConsumeNum, WItem:GetName(v.tbProp), nSelect, k));
        end

        tinsert(tbSay, format("%s/nothing", "�� ta ngh� l�i ��."));
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if tbConsume[nPayType] == WEnv.NULL then
        return WEnv.RETCODE_NOTOPEN;
    end

    nAmount = tonumber(nAmount) or 1;
    if nAmount <= 0 then
        return WEnv.RETCODE_ERROR;
    end

    local tbMaterial = {
        tbItems = {
            { tbProp = tbConsume[nPayType].tbProp, nCount = nConsumeNum * nAmount },
        },
    };
    local tbAward = new(self.tbExchanceGoods[nSelect].tbGoods);
    tbAward.nStack = tbAward.nStack * nAmount;

    if WLib:PayMaterial(tbMaterial) ~= WEnv.TRUE then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    WAward:Give(tbAward);
end
--
--function WRUONGHD:ShowTopYesterday()
--    local nDay, nMonth, nYear = WDate:SetDate(WDate:Today(), -1);
--    local szKey = format("_w_ruonghoatdong_%d%02d%02d", nYear, nMonth, nDay);
--
--    local sdb = SDB(szKey, 0, 0);
--    sdb.sortType = ORDER_BY_DESC;
--    sdb:apply2(WRUONGHD_ShowTopYesterday_cb);
--end
--
--function WRUONGHD_ShowTopYesterday_cb(nCount, sdb)
--    if nCount == 0 or sdb == WEnv.NULL then
--        WNpc:Talk("D� li�u ch�a ���c c�p nh�p, ng�y mai h�y quay l�i!");
--        return WEnv.RETCODE_NOTOPEN;
--    end
--
--    if tonumber(date("%H%M")) < 1000 then
--        WNpc:Talk("Th�i gian nh�n th��ng t� b�t ��u t� 10h - 23h m�i ng�y, <sex> h�y ch� � th�i gian quay l�i nh�n th��ng nh�!");
--        return WEnv.RETCODE_NOTOPEN;
--    end
--
--    local tbSay = { "D��i ��y l� danh s�ch TOP 3 nh�n s� c� �i�m t�ch lu� cao nh�t" };
--
--    for nRankIndex = 0, 2 do
--        gf_PrintTable(sdb[nRankIndex]);
--        --local szRoleName, nData, nRoute, nLevel, nCamp = GetRelayShareDataByIndex(sdb.key, sdb.n1, sdb.n2, nRankIndex);
--        --print(szRoleName, nData, nRoute, nLevel, nCamp);
--
--        --tinsert(tbBattleRankData, { szRoleName, nData, nRoute, nLevel, nCamp });
--        --
--        --local szLogTime = date('%Y-%m-%d %H:%M:%S');
--        --WFileLog:WriteTabFile(format("data/warlord/duatopbxh/top_battlemerit_%s.txt", szLogName),
--        --        { szLogTime, "RelayNotSave", (szRoleName or "") .. " ", nRankIndex + 1, nData, nRoute, nLevel, nCamp },
--        --        { "szLogTime", "szAccount", "szRoleName", "nRank", "nData", "nRoute", "nLevel", "nCamp" });
--    end
--end
--
--function _w_ruonghoatdong_ExchanceItem_VSCT()
--    local szAwardItemName = "_w_ruonghoatdong_ExchanceItem_VSCT";
--    local tbMaterial = {
--        tbItems = {
--            { tbProp = { 2, 1, 40064 }, nCount = 1 }, -- M�nh [V�]
--            { tbProp = { 2, 1, 40065 }, nCount = 1 }, -- M�nh [L�m]
--            { tbProp = { 2, 1, 40066 }, nCount = 1 }, -- M�nh [2]
--            { tbProp = { 2, 1, 40067 }, nCount = 1 }, -- M�nh [Huy�n]
--            { tbProp = { 2, 1, 40068 }, nCount = 1 }, -- M�nh [Tho�i]
--        },
--    };
--
--    -- Ki�m tra ng��i kh�c �� nh�n ch�a
--    local tbGiveSuccessData = ff_GetTabFileTable("\\" .. WLib:Replace(_W_RHD_DATA_FILE_PATH, "/", "\\"), 1, {
--        tostring, --szLogTime
--        tostring, --szAccount
--        tostring, --szRoleName
--        tonumber, --nAwardIdx
--        tostring, --szAwardName
--        tostring, --szAwardData
--    });
--    local nGiveSuccessCount = 0;
--    for nRowData = 1, getn(tbGiveSuccessData) do
--        if WLib:Trim(tbGiveSuccessData[nRowData][5]) == szAwardItemName then
--            nGiveSuccessCount = nGiveSuccessCount + 1;
--            break ;
--        end
--    end
--
--    if nGiveSuccessCount >= _W_RHD_LIMIT_VOSONG then
--        WNpc:Talk("<sex> ch�m ch�n m�t r�i, <color=yellow>V� Song Chi�n Th�n<color> �� h�t l��t ��i!",
--                WEnv.TRUE);
--        return WEnv.RETCODE_DENY;
--    end
--
--    if WLib:PayMaterial(tbMaterial) ~= WEnv.TRUE then
--        return WEnv.RETCODE_CONSUMEERROR;
--    end
--
--    local szLogTime = date('%Y-%m-%d %H:%M:%S');
--    WFileLog:WriteTabFile(_W_RHD_DATA_FILE_PATH,
--            { szLogTime, WPlayer:GetAccount(), WPlayer:GetName() .. " ", nGiveSuccessCount + 1, szAwardItemName, 0 },
--            { "szLogTime", "szAccount", "szRoleName", "nAwardIdx", "szAwardName", "szAwardData" });
--    WItem:AddSuit_VoSongChienThan(7, ITEMSTATUS_LOCK, szAwardItemName);
--end

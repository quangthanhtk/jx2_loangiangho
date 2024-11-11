----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-25
--- Description: Checkpoint ghi log nh©n vËt vµo database, ®ång thêi sÏ cã 1 b¶n txt ghi vµo logs/warlord/...
----------------------------------------------------------------------------------------------------
--- Use in web:
--- ObjName=PlayerName
--- LogContent=data string latin1
--- Query: SELECT *, CONVERT(LogContent USING latin1) FROM jx2ib_log.warlord_player_log where ObjName="TenNhanVat";
----------------------------------------------------------------------------------------------------
m_enumWPlayerLogTypes = {
    LOG_BATTLE = 1,
    LOG_ITEM_ADD = 2,
    LOG_ITEM_PAY = 3,
    LOG_BUG = 4,
    LOG_ADD_GOLDCOIN = 5,
    LOG_BUG_FIX = 4,
    LOG_RENAME = 6,
};
WPlayerLog = WDbLog:RegType("warlord_player", {
    fnDebug = nothing,
});

--- Ghi l¹i lÞch sö cña ®iÓm chiÕn tr­êng
function WPlayerLog:WriteBattleLog(szLogTitle, szLogAction, nBonusType, szBonusName, nExpBefore, nExpAward, nHonorBefore, nHonorAward, nPointBefore, nPointAward)
    self:WriteDbLog(
            m_enumWPlayerLogTypes.LOG_BATTLE,
            {
                szLogTitle .. " ", szLogAction .. " ", -- tªn ho¹t ®éng
                WPlayer:GetAccount() .. " ", WPlayer:GetName() .. " ",

                nBonusType or 0, (szBonusName or "") .. " ",

                nExpBefore or 0, -- kinh nghiÖm tr­íc
                nExpAward or 0, -- kinh nghiÖm nhËn ®­îc
                WPlayer:GetExp(), -- kinh nghiÖm sau
                nHonorBefore or 0, -- qu©n c«ng tr­íc
                nHonorAward or 0, -- qu©n c«ng nhËn ®­îc
                WPlayer:GetHonor(1), -- qu©n c«ng sau
                nPointBefore or 0, -- tÝch lòy tr­íc
                nPointAward or 0, -- tÝch lòy nhËn ®­îc
                WPlayer:GetBattlePoint(), -- tÝch lòy sau
            },
            WPlayer:GetName()
    );
end

--- Ghi l¹i lÞch sö add vËt phÈm vµo nh©n vËt
function WPlayerLog:WriteAddItemLog(szLogTitle, szLogAction, nRetCode, nItemIdx, nCount, tbExtendData)
    local tbItem = {};
    local szDataType = type(nItemIdx);

    if szDataType == "number" then
        local nOptId1, nOptLv1 = GetItemAttr(nItemIdx, 1);
        local nOptId2, nOptLv2 = GetItemAttr(nItemIdx, 2);
        local nOptId3, nOptLv3 = GetItemAttr(nItemIdx, 3);
        local tbItemInfo = GetItemInfoByIndex(nItemIdx, 1) or {};

        tbItem.tbProp = {
            [1] = tbItemInfo.genre or 0,
            [2] = tbItemInfo.detail or 0,
            [3] = tbItemInfo.particular or 0,
        };
        tbItem.nStack = nCount or 0;
        tbItem.nStatus = GetItemStatus(nItemIdx, 1) or 0;
        tbItem.tbParam = {
            [1] = nOptLv1 or 0,
            [2] = nOptId1 or 0,
            [3] = nOptLv2 or 0,
            [4] = nOptId2 or 0,
            [5] = nOptLv3 or 0,
            [6] = nOptId3 or 0,
        };
        tbItem.nNguHanh = 0;
        tbItem.nLevel = GetEquipAttr(nItemIdx, 2) or 0;
        tbItem.nLinhKhi = 0;
        tbItem.nExpiredTime = GetItemExpireTime(nItemIdx) or 0;
    elseif szDataType == "table" then
        tbItem = nItemIdx;
    else
        return WEnv.RETCODE_ERROR;
    end

    tbItem.tbParam = tbItem.tbParam or {};
    local szItemName = WItem:GetName(tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3]);

    self:WriteDbLog(
            m_enumWPlayerLogTypes.LOG_ITEM_ADD,
            WLib:MergeTable(
                    {
                        szLogTitle .. " ", szLogAction .. " ", -- tªn ho¹t ®éng
                        WPlayer:GetAccount() .. " ", WPlayer:GetName() .. " ",

                        nRetCode or 0, nItemIdx or 0, szItemName .. " ", nCount or 0, -- tªn trang bÞ

                        tbItem.tbProp[1] or 0, --1: nG
                        tbItem.tbProp[2] or 0, --2: nD
                        tbItem.tbProp[3] or 0, --3: nP
                        tbItem.statck or 0, --4: nStack
                        tbItem.nStatus or 0, --5: nStatus
                        tbItem.tbParam[1] or 0, --6: nOptLv1
                        tbItem.tbParam[2] or 0, --7: nOptId1
                        tbItem.tbParam[3] or 0, --8: nOptLv2
                        tbItem.tbParam[4] or 0, --9: nOptId2
                        tbItem.tbParam[5] or 0, --10: nOptLv3
                        tbItem.tbParam[6] or 0, --11: nOptId3
                        tbItem.nNguHanh, --12: ???
                        tbItem.nLevel or 0, --13: nEnhance
                        tbItem.nLinhKhi or 0, --14: nLingQi
                        0, --15: ???
                        0, --16: ???
                        tbItem.nExpiredTime or 0, -- nExpireTime
                    },
                    tbExtendData or {} -- nFeedUpAttr1 -> nFeedUpAttr6 ???
            ),
            WPlayer:GetName()
    );
end

--- Ghi l¹i lÞch sö xãa item trªn nh©n vËt
function WPlayerLog:WritePayItemLog(szLogTitle, szLogAction, nRetCode, nItemIdx, nCount, tbExtendData)
    local tbItem = {};
    local szDataType = type(nItemIdx);

    if szDataType == "number" then
        local nOptId1, nOptLv1 = GetItemAttr(nItemIdx, 1);
        local nOptId2, nOptLv2 = GetItemAttr(nItemIdx, 2);
        local nOptId3, nOptLv3 = GetItemAttr(nItemIdx, 3);
        local tbItemInfo = GetItemInfoByIndex(nItemIdx, 1) or {};

        tbItem.tbProp = {
            [1] = tbItemInfo.genre or 0,
            [2] = tbItemInfo.detail or 0,
            [3] = tbItemInfo.particular or 0,
        };
        tbItem.nStack = nCount or 0;
        tbItem.nStatus = GetItemStatus(nItemIdx, 1) or 0;
        tbItem.tbParam = {
            [1] = nOptLv1 or 0,
            [2] = nOptId1 or 0,
            [3] = nOptLv2 or 0,
            [4] = nOptId2 or 0,
            [5] = nOptLv3 or 0,
            [6] = nOptId3 or 0,
        };
        tbItem.nNguHanh = 0;
        tbItem.nLevel = GetEquipAttr(nItemIdx, 2) or 0;
        tbItem.nLinhKhi = 0;
        tbItem.nExpiredTime = GetItemExpireTime(nItemIdx) or 0;
    elseif szDataType == "table" then
        tbItem = nItemIdx;
    else
        return WEnv.RETCODE_ERROR;
    end

    tbItem.tbParam = tbItem.tbParam or {};
    local szItemName = WItem:GetName(tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3]);

    self:WriteDbLog(
            m_enumWPlayerLogTypes.LOG_ITEM_PAY,
            WLib:MergeTable(
                    {
                        szLogTitle .. " ", szLogAction .. " ", -- tªn ho¹t ®éng
                        WPlayer:GetAccount() .. " ", WPlayer:GetName() .. " ",

                        nRetCode or 0, nItemIdx or 0, szItemName .. " ", nCount or 0, -- tªn trang bÞ

                        tbItem.tbProp[1] or 0, --1: nG
                        tbItem.tbProp[2] or 0, --2: nD
                        tbItem.tbProp[3] or 0, --3: nP
                        tbItem.statck or 0, --4: nStack
                        tbItem.nStatus or 0, --5: nStatus
                        tbItem.tbParam[1] or 0, --6: nOptLv1
                        tbItem.tbParam[2] or 0, --7: nOptId1
                        tbItem.tbParam[3] or 0, --8: nOptLv2
                        tbItem.tbParam[4] or 0, --9: nOptId2
                        tbItem.tbParam[5] or 0, --10: nOptLv3
                        tbItem.tbParam[6] or 0, --11: nOptId3
                        tbItem.nNguHanh, --12: ???
                        tbItem.nLevel or 0, --13: nEnhance
                        tbItem.nLinhKhi or 0, --14: nLingQi
                        0, --15: ???
                        0, --16: ???
                        tbItem.nExpiredTime or 0, -- nExpireTime
                    },
                    tbExtendData or {} -- nFeedUpAttr1 -> nFeedUpAttr6 ???
            ),
            WPlayer:GetName()
    );
end

--- Ghi l¹i lÞch sö add coin
function WPlayerLog:WriteGoldCoinLog(szLogTitle, szLogAction, nCurrentGoldCoin, nExchanceType, nModifyValue, nAmount, tbExtendData)
    self:WriteDbLog(
            m_enumWPlayerLogTypes.LOG_ADD_GOLDCOIN,
            WLib:MergeTable(
                    {
                        szLogTitle .. " ", szLogAction .. " ",
                        WPlayer:GetAccount() .. " ", WPlayer:GetName() .. " ",

                        nCurrentGoldCoin or 0,
                        nExchanceType or 0,
                        nModifyValue or 0,
                        nAmount or 0,
                    },
                    tbExtendData or {}
            ),
            WPlayer:GetName()
    );
end

--- Ghi l¹i lÞch sö bug
function WPlayerLog:WriteBugLog(szLogTitle, szLogAction, szBugDesc, nBugData, nCorrectData, tbExtendData)
    self:WriteDbLog(
            m_enumWPlayerLogTypes.LOG_BUG,
            WLib:MergeTable(
                    {
                        szLogTitle .. " ", szLogAction .. " ", -- tªn ho¹t ®éng
                        WPlayer:GetAccount() .. " ", WPlayer:GetName() .. " ",

                        (szBugDesc or "") .. " ",
                        nBugData or 0,
                        nCorrectData or 0,
                    },
                    tbExtendData or {}
            ),
            WPlayer:GetName()
    );
end

--- Ghi l¹i lÞch sö bug ®· ®­îc fix
function WPlayerLog:WriteBugFixLog(szLogTitle, szLogAction, szBugDesc, nBugData, nCorrectData, tbExtendData)
    self:WriteDbLog(
            m_enumWPlayerLogTypes.LOG_BUG_FIX,
            WLib:MergeTable(
                    {
                        szLogTitle .. " ", szLogAction .. " ", -- tªn ho¹t ®éng
                        WPlayer:GetAccount() .. " ", WPlayer:GetName() .. " ",

                        (szBugDesc or "") .. " ",
                        nBugData or 0,
                        nCorrectData or 0,
                    },
                    tbExtendData or {}
            ),
            WPlayer:GetName()
    );
end
function WPlayerLog:WriteRenameLog(szLogTitle, szLogAction, szNewName)
    self:WriteDbLog(
            m_enumWPlayerLogTypes.LOG_RENAME,
            WLib:MergeTable(
                    {
                        szLogTitle .. " ", szLogAction .. " ", -- tªn ho¹t ®éng
                        WPlayer:GetAccount() .. " ", WPlayer:GetName() .. " ",
                        szNewName or 0,
                    },
                    tbExtendData or {}
            ),
            WPlayer:GetName()
    );
end

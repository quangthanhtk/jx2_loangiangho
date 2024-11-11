----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: th� vi�n mod c�a n�ng c�p �� b�ng script, ti�t ki�m id (d�ng 2 id trong actionbar, c�n l�i s� d�ng tasktemp)
----------------------------------------------------------------------------------------------------
WItemUpgrade = {
    tbUpgradeTypes = {},
    nDoWaitCompleteId = 254,
    nDoWaitAbortId = 255,
    nDoWaitTime = 3, -- T�nh b�ng gi�y
    tbMsgString = {
        [1] = "<npcname>: V�t ph�m n�y <color=red>�ang ���c kh�a b�o h�<color>, h�y m� kh�a v� th� l�i!",
        [2] = "<npcname>: V�t ph�m n�y kh�ng ��ng, h�y ki�m tra l�i!",
        [3] = "<npcname>: Trang b� ��t v�o y�u c�u <color=red>c��ng h�a +%d tr� l�n<color>!",
        [4] = "<npcname>: �ang ti�n h�nh n�ng c�p..... xin ch� trong gi�y l�t.....\n<color=green>(H��ng d�n: c� th� h�y n�ng c�p b�ng thao t�c �n ph�m t�t M l�n xu�ng ng�a)<color>",
        [5] = "<npcname>: <sex> �� h�y b� thao t�c.",
        [6] = "<npcname>: N�ng c�p trang b� th�t b�i, <sex> nh�n l�i ���c trang b� c�.",
        [7] = "<npcname>: Kh�ng t�m th�y trang b� th�ch h�p!",
        [8] = "<npcname>: Thu h�i trang b� [<color=white>%s<color>] th�t b�i!",
        [9] = "<npcname>: N�ng c�p th�nh c�ng [<color=white>%s<color>]!",
        [10] = "Xin ch�c m�ng v� ��i hi�p [<color=yellow>%s<color>] v�a n�ng c�p th�nh c�ng [<color=white>%s<color>]!",
    },
};
enumWItemUpgradeMatchBodyMode = {
    [1] = "gi� nguy�n ki�u h�nh trang b�", -- n:1
    [2] = "ki�u h�nh thay ��i theo ng��i n�ng c�p",
    [3] = "gi� nguy�n ki�u h�nh trang b�, m�n ph�i thay ��i theo ng��i n�ng c�p",
    [4] = "gi� nguy�n ki�u h�nh trang b�", -- 1:1 gi�ng theo h�ng c�a tbSourceItem
};
enumWItemUpgradeEnhanceMode = {
    [1] = "gi� nguy�n c��ng h�a",
    [2] = "c��ng h�a gi�m 1",
    [3] = "c��ng h�a v� 7",
    [4] = "c��ng h�a v� 0",
};
----------------------------------------------------------------------------------------------------

function WItemUpgrade:GetAllTypes()
    return WItemUpgrade.tbUpgradeTypes;
end

function WItemUpgrade:GetTypeConfigs(nTypeIdx)
    return WItemUpgrade.tbUpgradeTypes[nTypeIdx] or WEnv.NULL;
end

function WItemUpgrade:RegType(tbTypeConfigs)
    local nFoundIdx = 0;
    for nTypeIdx, tbTmpConfig in pairs(WItemUpgrade.tbUpgradeTypes) do
        if nTypeIdx ~= "n" and tbTmpConfig.szLogTitle == tbTypeConfigs.szLogTitle then
            nFoundIdx = nTypeIdx;
            break ;
        end
    end

    if nFoundIdx == 0 then
        nFoundIdx = getn(WItemUpgrade.tbUpgradeTypes) + 1;
        tinsert(WItemUpgrade.tbUpgradeTypes, nFoundIdx, tbTypeConfigs);
    end

    return nFoundIdx;
end

function WItemUpgrade:ResetData()
    WTaskTemp:Set(WTASKTEMP_ITEMUPGRADE_TYPE_IDX, 0); -- Reset
    WTaskTemp:Set(WTASKTEMP_ITEMUPGRADE_PUTITEM1_IDX, 0); -- Reset
    WTaskTemp:Set(WTASKTEMP_ITEMUPGRADE_PUTITEM1_NUM, 0); -- Reset
end

function WItemUpgrade:DoWaitComplete()
    local nTypeIdx = WTaskTemp:Get(WTASKTEMP_ITEMUPGRADE_TYPE_IDX);
    local tbTypeConfigs = WItemUpgrade:GetTypeConfigs(nTypeIdx);
    local nPutInItemIdx = WTaskTemp:Get(WTASKTEMP_ITEMUPGRADE_PUTITEM1_IDX);
    local nPutInItemNum = WTaskTemp:Get(WTASKTEMP_ITEMUPGRADE_PUTITEM1_NUM);

    self:ResetData();

    if nTypeIdx <= 0 or tbTypeConfigs == WEnv.NULL or nPutInItemIdx <= 0 then
        return WEnv.RETCODE_UNDEFINE;
    end

    if WLib:CheckInv(getn(tbTypeConfigs.tbMaterialConsume) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    local nGenre, nDetail, nParticular = GetItemInfoByIndex(nPutInItemIdx);
    local nValidIdx = WItemUpgrade:GetSourceItemInfo(nTypeIdx, nGenre, nDetail, nParticular);
    if nValidIdx == WEnv.NULL then
        WNpc:Talk(WItemUpgrade.tbMsgString[2], 1);
        return WEnv.RETCODE_NOTMATCH;
    end

    local szItemName = GetItemName(nPutInItemIdx);
    local nOldEnhance = GetEquipAttr(nPutInItemIdx, 2) or 0;
    local nOptId1, nOptLv1 = GetItemAttr(nPutInItemIdx, 1);
    local nOptId2, nOptLv2 = GetItemAttr(nPutInItemIdx, 2);
    local nOptId3, nOptLv3 = GetItemAttr(nPutInItemIdx, 3);
    local nStatus = GetItemSpecialAttr(nPutInItemIdx, "BIND");

    local nSex = tbTypeConfigs.tbItemAllowUpgrade[nValidIdx].nSex or 0;
    local nBody = tbTypeConfigs.tbItemAllowUpgrade[nValidIdx].nBody or 0;
    local nRoute = tbTypeConfigs.tbItemAllowUpgrade[nValidIdx].nRoute or 0;
    local nCamp = tbTypeConfigs.tbItemAllowUpgrade[nValidIdx].nCamp or 0;

    local tbPutItemInfo = {
        nItemIdx = nPutInItemIdx,
        nGenre = nGenre,
        nDetail = nDetail,
        nParticular = nParticular,
        nQuantity = nPutInItemNum,
        szItemName = szItemName,
        nEnhance = nOldEnhance,
        nOptId1 = nOptId1,
        nOptLv1 = nOptLv1,
        nOptId2 = nOptId2,
        nOptLv2 = nOptLv2,
        nOptId3 = nOptId3,
        nOptLv3 = nOptLv3,
        nValidIdx = nValidIdx,
        nSex = nSex,
        nBody = nBody,
        nRoute = nRoute,
        nCamp = nCamp,
        nStatus = nStatus,
    };

    local tbMaterial = tbTypeConfigs.tbMaterialConsume;
    if WLib:PayMaterial(tbMaterial) ~= WEnv.TRUE then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    local nRand = random(1, tbTypeConfigs.nMaxRandom);
    if nRand > tbTypeConfigs.nLuckyNum then
        if tbTypeConfigs.OnUpgradeFailure and type(tbTypeConfigs.OnUpgradeFailure) == "function" then
            tbTypeConfigs.OnUpgradeFailure(nTypeIdx, tbPutItemInfo);
        else
            WItemUpgrade:OnUpgradeFailure(nTypeIdx, tbPutItemInfo);
        end
    else
        if tbTypeConfigs.OnUpgradeFailure and type(tbTypeConfigs.OnUpgradeSuccess) == "function" then
            tbTypeConfigs.OnUpgradeSuccess(nTypeIdx, tbPutItemInfo);
        else
            WItemUpgrade:OnUpgradeSuccess(nTypeIdx, tbPutItemInfo);
        end
    end
    return WEnv.RETCODE_SUCCESS;
end

function WItemUpgrade:DoWaitAbort()
    self:ResetData();
    WNpc:Talk(WItemUpgrade.tbMsgString[5], 1);
    return WEnv.RETCODE_SUCCESS;
end

function WItemUpgrade:GetSourceItemInfo(nTypeIdx, nMatchItemG, nMatchItemD, nMatchItemP)
    local tbTypeConfigs = WItemUpgrade:GetTypeConfigs(nTypeIdx);

    if nTypeIdx == 0 or tbTypeConfigs == WEnv.NULL then
        return WEnv.NULL, WEnv.NULL;
    end

    for nRowIdx, tbRowData in pairs(tbTypeConfigs.tbItemAllowUpgrade) do
        if nRowIdx ~= "n"
                and ((nMatchItemG > -1 and nMatchItemG == tbRowData[1][2][1]) or nMatchItemG == -1)
                and ((nMatchItemD > -1 and nMatchItemD == tbRowData[1][2][2]) or nMatchItemD == -1)
                and ((nMatchItemP > -1 and nMatchItemP == tbRowData[1][2][3]) or nMatchItemP == -1)
        then
            return nRowIdx, tbRowData[1];
        end
    end

    return WEnv.NULL, WEnv.NULL;
end

function WItemUpgrade:GetTargetItemInfo(nTypeIdx, nMatchItemG, nMatchItemD, nMatchItemP, nMatchSex, nMatchBody, nMatchRoute, nMatchCamp)
    -- H�m d�ng cho n:n, n�u define h�m n�y s� �u ti�n ch�y khi t�m item c�n n�ng l�n
    nMatchItemG = nMatchItemG or -1;
    nMatchItemD = nMatchItemD or -1;
    nMatchItemP = nMatchItemP or -1;
    nMatchSex = nMatchSex or 0;
    nMatchBody = nMatchBody or 0;
    nMatchRoute = nMatchRoute or 0;
    nMatchCamp = nMatchCamp or 0;
    local tbTypeConfigs = WItemUpgrade:GetTypeConfigs(nTypeIdx);

    if nTypeIdx == 0 or tbTypeConfigs == WEnv.NULL then
        return WEnv.NULL, WEnv.NULL;
    end

    for nRowIdx, tbRowData in pairs(tbTypeConfigs.tbTargetItem) do
        if nRowIdx ~= "n"
                and ((nMatchItemG > -1 and nMatchItemG == tbRowData[1][2][1]) or nMatchItemG == -1)
                and ((nMatchItemD > -1 and nMatchItemD == tbRowData[1][2][2]) or nMatchItemD == -1)
                and ((nMatchSex > 0 and nMatchSex == tbRowData.nSex) or tbRowData.nSex == 0 or nMatchSex == 0)
                and ((nMatchBody > 0 and nMatchBody == tbRowData.nBody) or tbRowData.nBody == 0 or nMatchBody == 0)
                and ((nMatchRoute > 0 and nMatchRoute == tbRowData.nRoute) or tbRowData.nRoute == 0 or nMatchRoute == 0)
                and ((nMatchCamp > 0 and nMatchCamp == (tbRowData.nCamp or 0)) or (tbRowData.nCamp or 0) == 0 or nMatchCamp == 0)
        then
            return nRowIdx, tbRowData[1];
        end
    end

    return WEnv.NULL, WEnv.NULL;
end

function WItemUpgrade:OnUpgradeSuccess(nTypeIdx, tbPutItemInfo)
    nTypeIdx = tonumber(nTypeIdx) or 0;
    local tbTypeConfigs = WItemUpgrade:GetTypeConfigs(nTypeIdx);

    if nTypeIdx == 0 or tbTypeConfigs == WEnv.NULL or tbPutItemInfo == WEnv.NULL then
        return WEnv.RETCODE_UNDEFINE;
    end

    local nTargetItemIdx = 0;
    local tbTargetItemInfo = {};

    local nPlayerSex = WPlayer:GetSex();
    local nPlayerBody = WPlayer:GetBody();
    local nPlayerRoute = WPlayer:GetRoute();
    local nPlayerCamp = WPlayer:GetBattleCamp();
    local tbSourceItemInfo = tbTypeConfigs.tbItemAllowUpgrade[tbPutItemInfo.nValidIdx];

    if tbTypeConfigs.nMatchBodyMode == 2 then
        -- ki�u h�nh thay ��i theo ng��i n�ng c�p
        nTargetItemIdx, tbTargetItemInfo = WItemUpgrade:GetTargetItemInfo(nTypeIdx, tbPutItemInfo.nGenre, tbPutItemInfo.nDetail, -1, nPlayerSex, nPlayerBody, nPlayerRoute, nPlayerCamp);
    elseif tbTypeConfigs.nMatchBodyMode == 3 then
        -- gi� nguy�n ki�u h�nh trang b�, m�n ph�i thay ��i theo ng��i n�ng c�p
        nTargetItemIdx, tbTargetItemInfo = WItemUpgrade:GetTargetItemInfo(nTypeIdx, tbPutItemInfo.nGenre, tbPutItemInfo.nDetail, -1, tbSourceItemInfo.nSex, tbSourceItemInfo.nBody, nPlayerRoute, tbSourceItemInfo.nCamp);
    elseif tbTypeConfigs.nMatchBodyMode == 4 then
        -- gi� nguy�n ki�u h�nh trang b�, tr��ng h�p 1:1 gi�ng theo h�ng c�a tbSourceItem
        nTargetItemIdx, tbTargetItemInfo = tbPutItemInfo.nValidIdx, tbTypeConfigs.tbTargetItem[tbPutItemInfo.nValidIdx][1];
    else
        -- gi� nguy�n ki�u h�nh trang b� n:1
        nTargetItemIdx, tbTargetItemInfo = WItemUpgrade:GetTargetItemInfo(nTypeIdx, tbPutItemInfo.nGenre, tbPutItemInfo.nDetail, -1, tbSourceItemInfo.nSex, tbSourceItemInfo.nBody, tbSourceItemInfo.nRoute, tbSourceItemInfo.nCamp);
    end

    if tbTargetItemInfo == WEnv.NULL then
        WNpc:Talk(WItemUpgrade.tbMsgString[7], 1);
        return WEnv.RETCODE_ERROR;
    end

    local nRetCode = WItem:DelByIndex(tbPutItemInfo.nItemIdx, tbPutItemInfo.nQuantity);
    if nRetCode ~= WEnv.RETCODE_SUCCESS then
        WNpc:Talk(format(WItemUpgrade.tbMsgString[8], tbPutItemInfo.szItemName), 1);
        return WEnv.RETCODE_CONSUMEERROR;
    end
    WPlayerLog:WritePayItemLog(tbTypeConfigs.szLogTitle, "X�a v�t ph�m n�ng c�p", nRetCode, tbPutItemInfo, tbPutItemInfo.nQuantity);

    local szNewName = tbTargetItemInfo[1];
    local nNewG = tbTargetItemInfo[2][1];
    local nNewD = tbTargetItemInfo[2][2];
    local nNewP = tbTargetItemInfo[2][3];
    local nNewLock = 4;
    local nNewEnhance = tbPutItemInfo.nEnhance or 0;

    if tbTypeConfigs.nEnhanceMode == 1 then
        nNewEnhance = tbPutItemInfo.nEnhance;
    elseif tbTypeConfigs.nEnhanceMode == 2 then
        nNewEnhance = tbPutItemInfo.nEnhance - 1;
    elseif tbTypeConfigs.nEnhanceMode == 3 then
        if nNewEnhance >= 7 then
            nNewEnhance = 7;
        else
            nNewEnhance = 0;
        end
    elseif tbTypeConfigs.nEnhanceMode == 4 then
        nNewEnhance = 0;
    end
    if nNewEnhance <= 0 then
        -- Fix gi� tr� c��ng h�a trong ph�m vi cho ph�p < 0 th� set = 0; > 15 th� set =15
        nNewEnhance = 0;
    elseif nNewEnhance >= 15 then
        nNewEnhance = 15;
    end
    if nNewD == 102 then
        -- Fix gi� tr� c��ng h�a c�a nh�n =0 l� tr��ng h�p l�i
        nNewEnhance = 0;
    end

    local nRetAddCode, nRetAddItemIdx = 0, 0;

    if nNewG == ITEM_G_EQUIP
            and (nNewD == EQUIP_TYPE_BODY
            or nNewD == EQUIP_TYPE_PANTS
            or nNewD == EQUIP_TYPE_CAP
            or (nNewD >= 0 and nNewD <= 14))
    then
        nRetAddCode, nRetAddItemIdx = gf_AddItemEx2({ nNewG, nNewD, nNewP, 1, nNewLock, -1, -1, -1, -1, -1, -1, -1, nNewEnhance }, szNewName, tbTypeConfigs.szLogTitle, "N�ng c�p", 0, 1);
    else
        nRetAddCode, nRetAddItemIdx = gf_AddItemEx2({ nNewG, nNewD, nNewP, 1, nNewLock, 0, 0, 0, 0, 0, 0, 0, 0 }, szNewName, tbTypeConfigs.szLogTitle, "N�ng c�p", 0, 1);
        if nRetAddItemIdx > 0 then
            SetItemParam(nRetAddItemIdx, 1, nNewEnhance); -- b�o l�u c��ng h�a
        end
    end

    WPlayerLog:WriteAddItemLog(tbTypeConfigs.szLogTitle, "N�ng c�p th�nh c�ng", nRetAddCode, nRetAddItemIdx, 1);

    WNpc:Talk(format(WItemUpgrade.tbMsgString[9], szNewName), 1);
    AddGlobalNews(WLib:StringFormal(WItemUpgrade.tbMsgString[10], WPlayer:GetName(), szNewName), 2);
    return WEnv.RETCODE_SUCCESS;
end

function WItemUpgrade:OnUpgradeFailure(nTypeIdx, tbPutItemInfo)
    nTypeIdx = tonumber(nTypeIdx) or 0;
    local tbTypeConfigs = WItemUpgrade:GetTypeConfigs(nTypeIdx);

    if nTypeIdx == 0 or tbTypeConfigs == WEnv.NULL or tbPutItemInfo == WEnv.NULL then
        return WEnv.RETCODE_UNDEFINE;
    end

    WNpc:Talk(WItemUpgrade.tbMsgString[6], 1);
    return WEnv.RETCODE_SUCCESS;
end

--- H�m OnPutinCheck n�y ��c bi�t, return 0 ngh�a l� ko �� �i�u ki�n, return 1 ngh�a l� ��t
function WItemUpgrade:OnPutinCheck(nTypeIdx, nItemIdx, nGenre, nDetail, nParticular)
    nTypeIdx = tonumber(nTypeIdx) or 0;
    nItemIdx = tonumber(nItemIdx) or 0;
    nGenre = tonumber(nGenre) or 0;
    nDetail = tonumber(nDetail) or 0;
    nParticular = tonumber(nParticular) or 0;
    local tbTypeConfigs = WItemUpgrade:GetTypeConfigs(nTypeIdx);

    if nItemIdx == 0
            or nTypeIdx == 0
            or nTypeIdx ~= WTaskTemp:Get(WTASKTEMP_ITEMUPGRADE_TYPE_IDX)
            or tbTypeConfigs == WEnv.NULL
    then
        return 0;
    end

    if GetItemSpecialAttr(nItemIdx, "LOCK") == 1 then
        WNpc:Talk(WItemUpgrade.tbMsgString[1], 1);
        return 0;
    end

    if WItemUpgrade:GetSourceItemInfo(nTypeIdx, nGenre, nDetail, nParticular) == WEnv.NULL then
        WNpc:Talk(WItemUpgrade.tbMsgString[2], 1);
        return 0;
    end

    if tbTypeConfigs.nEnhanceReq > 0 then
        -- Ki�m tra �� c��ng h�a
        if nGenre == 0 or nDetail ~= 102 then
            if GetEquipAttr(nItemIdx, 2) < tbTypeConfigs.nEnhanceReq then
                WNpc:Talk(format(WItemUpgrade.tbMsgString[3], tbTypeConfigs.nEnhanceReq), 1);
                return 0;
            end
        end
    end

    return 1;
end

function WItemUpgrade:OnPutinComplete(nTypeIdx)
    nTypeIdx = tonumber(nTypeIdx) or 0;
    local tbTypeConfigs = WItemUpgrade:GetTypeConfigs(nTypeIdx);
    local tbUpgradeList = GetPutinItem();
    local nPutInItemIdx, nG, nD, nP, szItemName = tbUpgradeList[1][1], tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4], tbUpgradeList[1][5];
    local nPutInItemNum = 1;
    local tbItemInfo = GetItemInfoByIndex(nPutInItemIdx, 1);
    local tbItemTemplateInfo = GetItemTemplateInfo(tbItemInfo.genre, tbItemInfo.detail, tbItemInfo.particular);
    if tbItemTemplateInfo.StackCount > 0 then
        nPutInItemNum = tbItemInfo.statck;
    end

    if nTypeIdx == 0
            or nTypeIdx ~= WTaskTemp:Get(WTASKTEMP_ITEMUPGRADE_TYPE_IDX)
            or tbTypeConfigs == WEnv.NULL
            or nPutInItemIdx <= 0
    then
        return WEnv.RETCODE_UNDEFINE;
    end

    if WLib:CheckInv(getn(tbTypeConfigs.tbMaterialConsume) + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    local tbMaterial = tbTypeConfigs.tbMaterialConsume;
    if WLib:CheckMaterial(tbMaterial) ~= WEnv.TRUE then
        return WEnv.RETCODE_CONSUMEERROR;
    end

    -- Th�c hi�n action bar
    WTaskTemp:Set(WTASKTEMP_ITEMUPGRADE_PUTITEM1_IDX, nPutInItemIdx);
    WTaskTemp:Set(WTASKTEMP_ITEMUPGRADE_PUTITEM1_NUM, nPutInItemNum);
    if tbTypeConfigs.nDoWaitTime > 0 then
        WNpc:Talk(WItemUpgrade.tbMsgString[4], 1);
        DoWait(WItemUpgrade.nDoWaitCompleteId, WItemUpgrade.nDoWaitAbortId, tbTypeConfigs.nDoWaitTime or WItemUpgrade.nDoWaitTime);
    else
        WItemUpgrade:DoWaitComplete();
    end
    return WEnv.RETCODE_SUCCESS;
end

--- H�m g�i c�a PutinItemBox
function OnPutinCheck(nTypeIdx, nItemIdx, nGenre, nDetail, nParticular)
    return WItemUpgrade:OnPutinCheck(nTypeIdx, nItemIdx, nGenre, nDetail, nParticular);
end
function OnPutinComplete(nTypeIdx)
    return WItemUpgrade:OnPutinComplete(nTypeIdx);
end

--- H�m g�i c�a \script\global\action_bar_callback.lua
function _w_DoWaitComplete()
    return WItemUpgrade:DoWaitComplete();
end
function _w_DoWaitAbort()
    return WItemUpgrade:DoWaitAbort();
end

----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: th­ viÖn mod cña n©ng cÊp ®å b»ng script, tiÕt kiÖm id (dïng 2 id trong actionbar, cßn l¹i sÏ dïng tasktemp)
----------------------------------------------------------------------------------------------------
WItemUpgrade = {
    tbUpgradeTypes = {},
    nDoWaitCompleteId = 254,
    nDoWaitAbortId = 255,
    nDoWaitTime = 3, -- TÝnh b»ng gi©y
    tbMsgString = {
        [1] = "<npcname>: VËt phÈm nµy <color=red>®ang ®­îc khãa b¶o hé<color>, h·y më khãa vµ thö l¹i!",
        [2] = "<npcname>: VËt phÈm nµy kh«ng ®óng, h·y kiÓm tra l¹i!",
        [3] = "<npcname>: Trang bÞ ®Æt vµo yªu cÇu <color=red>c­êng hãa +%d trë lªn<color>!",
        [4] = "<npcname>: §ang tiÕn hµnh n©ng cÊp..... xin chê trong gi©y l¸t.....\n<color=green>(H­íng dÉn: cã thÓ hñy n©ng cÊp b»ng thao t¸c Ên phÝm t¾t M lªn xuèng ngùa)<color>",
        [5] = "<npcname>: <sex> ®· hñy bá thao t¸c.",
        [6] = "<npcname>: N©ng cÊp trang bÞ thÊt b¹i, <sex> nhËn l¹i ®­îc trang bÞ cò.",
        [7] = "<npcname>: Kh«ng t×m thÊy trang bÞ thÝch hîp!",
        [8] = "<npcname>: Thu håi trang bÞ [<color=white>%s<color>] thÊt b¹i!",
        [9] = "<npcname>: N©ng cÊp thµnh c«ng [<color=white>%s<color>]!",
        [10] = "Xin chóc mõng vÞ ®¹i hiÖp [<color=yellow>%s<color>] võa n©ng cÊp thµnh c«ng [<color=white>%s<color>]!",
    },
};
enumWItemUpgradeMatchBodyMode = {
    [1] = "gi÷ nguyªn kiÓu h×nh trang bÞ", -- n:1
    [2] = "kiÓu h×nh thay ®æi theo ng­êi n©ng cÊp",
    [3] = "gi÷ nguyªn kiÓu h×nh trang bÞ, m«n ph¸i thay ®æi theo ng­êi n©ng cÊp",
    [4] = "gi÷ nguyªn kiÓu h×nh trang bÞ", -- 1:1 giãng theo hµng cña tbSourceItem
};
enumWItemUpgradeEnhanceMode = {
    [1] = "gi÷ nguyªn c­êng hãa",
    [2] = "c­êng hãa gi¶m 1",
    [3] = "c­êng hãa vÒ 7",
    [4] = "c­êng hãa vÒ 0",
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
    -- Hµm dïng cho n:n, nÕu define hµm nµy sÏ ­u tiªn ch¹y khi t×m item cÇn n©ng lªn
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
        -- kiÓu h×nh thay ®æi theo ng­êi n©ng cÊp
        nTargetItemIdx, tbTargetItemInfo = WItemUpgrade:GetTargetItemInfo(nTypeIdx, tbPutItemInfo.nGenre, tbPutItemInfo.nDetail, -1, nPlayerSex, nPlayerBody, nPlayerRoute, nPlayerCamp);
    elseif tbTypeConfigs.nMatchBodyMode == 3 then
        -- gi÷ nguyªn kiÓu h×nh trang bÞ, m«n ph¸i thay ®æi theo ng­êi n©ng cÊp
        nTargetItemIdx, tbTargetItemInfo = WItemUpgrade:GetTargetItemInfo(nTypeIdx, tbPutItemInfo.nGenre, tbPutItemInfo.nDetail, -1, tbSourceItemInfo.nSex, tbSourceItemInfo.nBody, nPlayerRoute, tbSourceItemInfo.nCamp);
    elseif tbTypeConfigs.nMatchBodyMode == 4 then
        -- gi÷ nguyªn kiÓu h×nh trang bÞ, tr­êng hîp 1:1 giãng theo hµng cña tbSourceItem
        nTargetItemIdx, tbTargetItemInfo = tbPutItemInfo.nValidIdx, tbTypeConfigs.tbTargetItem[tbPutItemInfo.nValidIdx][1];
    else
        -- gi÷ nguyªn kiÓu h×nh trang bÞ n:1
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
    WPlayerLog:WritePayItemLog(tbTypeConfigs.szLogTitle, "Xãa vËt phÈm n©ng cÊp", nRetCode, tbPutItemInfo, tbPutItemInfo.nQuantity);

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
        -- Fix gi¸ trÞ c­êng hãa trong ph¹m vi cho phÐp < 0 th× set = 0; > 15 th× set =15
        nNewEnhance = 0;
    elseif nNewEnhance >= 15 then
        nNewEnhance = 15;
    end
    if nNewD == 102 then
        -- Fix gi¸ trÞ c­êng hãa cña nhÉn =0 lì tr­êng hîp lçi
        nNewEnhance = 0;
    end

    local nRetAddCode, nRetAddItemIdx = 0, 0;

    if nNewG == ITEM_G_EQUIP
            and (nNewD == EQUIP_TYPE_BODY
            or nNewD == EQUIP_TYPE_PANTS
            or nNewD == EQUIP_TYPE_CAP
            or (nNewD >= 0 and nNewD <= 14))
    then
        nRetAddCode, nRetAddItemIdx = gf_AddItemEx2({ nNewG, nNewD, nNewP, 1, nNewLock, -1, -1, -1, -1, -1, -1, -1, nNewEnhance }, szNewName, tbTypeConfigs.szLogTitle, "N©ng cÊp", 0, 1);
    else
        nRetAddCode, nRetAddItemIdx = gf_AddItemEx2({ nNewG, nNewD, nNewP, 1, nNewLock, 0, 0, 0, 0, 0, 0, 0, 0 }, szNewName, tbTypeConfigs.szLogTitle, "N©ng cÊp", 0, 1);
        if nRetAddItemIdx > 0 then
            SetItemParam(nRetAddItemIdx, 1, nNewEnhance); -- b¶o l­u c­êng hãa
        end
    end

    WPlayerLog:WriteAddItemLog(tbTypeConfigs.szLogTitle, "N©ng cÊp thµnh c«ng", nRetAddCode, nRetAddItemIdx, 1);

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

--- Hµm OnPutinCheck nµy ®Æc biÖt, return 0 nghÜa lµ ko ®ñ ®iÒu kiÖn, return 1 nghÜa lµ ®¹t
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
        -- KiÓm tra ®é c­êng hãa
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

    -- Thùc hiÖn action bar
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

--- Hµm gäi cña PutinItemBox
function OnPutinCheck(nTypeIdx, nItemIdx, nGenre, nDetail, nParticular)
    return WItemUpgrade:OnPutinCheck(nTypeIdx, nItemIdx, nGenre, nDetail, nParticular);
end
function OnPutinComplete(nTypeIdx)
    return WItemUpgrade:OnPutinComplete(nTypeIdx);
end

--- Hµm gäi cña \script\global\action_bar_callback.lua
function _w_DoWaitComplete()
    return WItemUpgrade:DoWaitComplete();
end
function _w_DoWaitAbort()
    return WItemUpgrade:DoWaitAbort();
end

AwardItem = {}
AwardItem.szKey = 'tbProp'

function AwardItem:NewItemEx(tbItem)
    local nStatus = tbItem.nStatus or 1
    if nStatus < 0 then
        nStatus = 99
    end
    local nExpiredTime = tbItem.nExpiredTime or 0
    nStatus = nExpiredTime * 100 + nStatus
    if tbItem.tbParam == nil or type(tbItem.tbParam) ~= 'table' then
        tbItem.tbParam = {}
    end
    if tbItem.tbProp[2] == EQUIP_TYPE_RING then
        -- n�u l� nh�n th� ko set level
        tbItem.nLevel = 0
    end
    local nCoatG = 0
    local tCoatD = {
        [EQUIP_TYPE_COAT_CAP] = 1,
        [EQUIP_TYPE_COAT_CLOTH] = 1,
        [EQUIP_TYPE_COAT_TROUSERS] = 1,
        [EQUIP_TYPE_COAT_SET] = 1,
        [EQUIP_TYPE_TOOL] = 1,
        [EQUIP_TYPE_ORNAMENT_CAP] = 1,
        [EQUIP_TYPE_ORNAMENT_CLOTH] = 1,
        [EQUIP_TYPE_ORNAMENT_FOOT] = 1,
    }
    local bIBFlag = 0
    local nAttribute = -1
    if nCoatG == tbItem.tbProp[1] then
        if tCoatD[tbItem.tbProp[2]] then
            bIBFlag = 1
            nAttribute = 0
        end
    end
    local itemProp = {
        tbItem.tbProp[1] or 0,
        tbItem.tbProp[2] or 0,
        tbItem.tbProp[3] or 0,
        tbItem.nStack or 1, -- S� l��ng
        nStatus, -- status < 0 l� ch�a gi�m ��nh 4 l� kh�a, 3 l� kh�a khi m�c
        tbItem.tbParam[1] or nAttribute, --attr 1 level
        tbItem.tbParam[2] or nAttribute, --attr 1 id
        tbItem.tbParam[3] or nAttribute,
        tbItem.tbParam[4] or nAttribute,
        tbItem.tbParam[5] or nAttribute,
        tbItem.tbParam[6] or nAttribute,
        tbItem.nNguHanh or 0, -- Ng� h�nh: 1 - Kim, 2 - M�c, 3 - Th�y, 4 - H�a, 5 - Th�
        tbItem.nLevel or 0,
        tbItem.nLinhKhi or 0,
    }

    local nRet, nIdx = AddItem(KsgLib:UnPack(itemProp))
    if 1 == bIBFlag then
        SetItemStatus(nIdx, 2, 1)
    end
    return nRet, nIdx
end

function AwardItem:Give(tbItem, szLogTitle, nAwardCount)
    local nRet, nItemIndex, nFailedCount, nDropCount, nOkCount = 0, 0, 0, 0, 0
    local nAmount = (nAwardCount or 1) * (tbItem.nCount or 1)
    local nStack = tbItem.nStack or 1
    local szName = ''
    local nExpiredTime = tbItem.nExpiredTime or 0
    for _ = 1, nAmount do
        nRet, nItemIndex = self:NewItemEx(tbItem)
        if nItemIndex < 0 then
            break
        end
        szName = tbItem.szName or GetItemName(nItemIndex)
        --if nExpiredTime > 0 then
        --    SetItemExpireTime(nItemIndex, tbItem.nExpiredTime) -- Set Th�i gian h�t h�n (t�m kh�ng c�n v� �� set = status)
        --end
        if type(tbItem.bProtectLevel7) == 'number' then
            -- ��nh h�n v�t ph�m
            if tbItem.bProtectLevel7 == 1 or tbItem.bProtectLevel7 == 0 then
                SetItemSpecialAttr(nItemIndex, "DING7", tbItem.bProtectLevel7)
            end
        end
        if type(tbItem.bProtectLevel10) == 'number' then
            -- ��nh h�n v�t ph�m
            if tbItem.bProtectLevel10 == 1 or tbItem.bProtectLevel10 == 0 then
                SetItemSpecialAttr(nItemIndex, "DING10", tbItem.bProtectLevel10)
            end
        end
        if type(tbItem.bLayLinhKhi) == 'number' then
            if tbItem.bLayLinhKhi == 1 or tbItem.bLayLinhKhi == 0 then
                SetEquipCanChouQu(nItemIndex, tbItem.bLayLinhKhi)
            end
        end
        if type(tbItem.bLock) == 'number' then
            if tbItem.bLock == 1 or tbItem.bLock == 0 then
                SetItemSpecialAttr(nItemIndex, "LOCK", tbItem.bLock)
            end
        end
        if type(tbItem.nFeed) == 'number' then
            FeedItem(nItemIndex, tbItem.nFeed)
        end
        if type(tbItem.tbFeedAttrs) == 'table' then
            SetItemFeedUpAttrs(nItemIndex, tbItem.tbFeedAttrs[1] or -1, tbItem.tbFeedAttrs[2] or -1, tbItem.tbFeedAttrs[3] or -1, tbItem.tbFeedAttrs[4] or -1, tbItem.tbFeedAttrs[5] or -1, tbItem.tbFeedAttrs[6] or -1)
        end
        if type(tbItem.tGem) == 'table' then
            for i, v in tbItem.tGem do
                SetItemGemInfo(nItemIndex, i, v)
            end
        end
        if type(tbItem.nBookType) == 'number' and type(tbItem.nBookValue) == 'number' then
            local nBookValue1, nBookValue2, nBookValue3, nBookValue4 = tbItem.nBookValue, tbItem.nBookValue, tbItem.nBookValue, tbItem.nBookValue
            if nBookValue1 > 25 then
                nBookValue1 = random(nBookValue1 - 4, nBookValue1)
                nBookValue2 = random(nBookValue2 - 4, nBookValue2)
                nBookValue3 = random(nBookValue3 - 4, nBookValue3)
                nBookValue4 = random(nBookValue4 - 4, nBookValue4)
            end
            local nPhuLuc = BOOK_PHU_LUC_MIN
            local nBookSkillLevel
            if type(tbItem.nBookPhuLuc) == 'number' then
                nPhuLuc = tbItem.nBookPhuLuc
            end
            if type(tbItem.nBookSkillLevel) == 'number' then
                nBookSkillLevel = tbItem.nBookSkillLevel
                if nBookSkillLevel > 10 then
                    nBookSkillLevel = 10
                end
            end
            if nPhuLuc > BOOK_PHU_LUC_MAX then
                nPhuLuc = BOOK_PHU_LUC_MAX
            end
            if tbItem.nBookType == DAME_TYPE_NGOAICONG then
                -- ngo�i
                nBookValue2 = 1
            end
            if tbItem.nBookType == DAME_TYPE_NOICONG then
                -- n�i
                nBookValue1 = 1
            end
            SetBookInfo(nItemIndex, nBookSkillLevel, nPhuLuc, nBookValue1, nBookValue2, nBookValue3, nBookValue4)
        end
        if nRet == ADD_ITEM_STATUS_FAILED then
            nFailedCount = nFailedCount + nAmount
        elseif nRet == ADD_ITEM_STATUS_DROPPED then
            nDropCount = nDropCount + nAmount
        else
            nOkCount = nOkCount + nAmount
        end
    end
    if nItemIndex == 0 then
        print("[KsgAward] AwardItem v�t ph�m kh�ng t�n t�i!")
        return
    end
    local msgGlobal = ''
    nAmount = nAmount * nStack
    if tbItem.nQuality == 1 then
        msgGlobal = format("%s nh�n ph�m ��t ph�t, nh�n ���c %d %s!!!", GetName(), nAmount, szName)
        local nRandom = random(0, 100)
        if nRandom < 5 then
            msgGlobal = format("%s c�m %d %s trong tay n�i: ai ���c nh� ta!", GetName(), nAmount, szName)
        elseif nRandom < 10 then
            msgGlobal = format("%s l�m nhi�u vi�c thi�n, t� bi c�u ng��i, tri�u ��nh ban th��ng %d %s!", GetName(), nAmount, szName)
        elseif nRandom < 20 then
            msgGlobal = format("%s nh�t ���c %d %s ng�c nhi�n kh�ng bi�t ai l�m r�i ra!", GetName(), nAmount, szName)
        elseif nRandom < 30 then
            msgGlobal = format("%s �ang du ngo�n th� v� t�nh �� ph�i %d %s!", GetName(), nAmount, szName)
        end
    end
    if type(tbItem.nQuality) == 'string' then
        msgGlobal = format(tbItem.nQuality, GetName(), nAmount, szName)
    end
    if msgGlobal ~= '' then
        AddLocalNews(msgGlobal)
        Msg2Global(msgGlobal)
    end
    KsgPlayer:Msg(format("Nh�n ���c %d %s.", nAmount, szName))
    local szMsg1 = format("[%s] Th�m th�nh c�ng %d c�i, th�m th�t b�i %d c�i, r�i ��t %d c�i.", szName, nOkCount, nFailedCount, nDropCount)
    local szMsg2 = "Th�i gian t�n t�i v�t ph�m ���c ��t th�nh %d gi�y"
    if nExpiredTime <= 0 then
        szMsg2 = ""
    else
        szMsg2 = format(szMsg2, nExpiredTime)
    end
    local szExtraInfo = szMsg1 .. szMsg2
    self:WriteLog(szExtraInfo, szLogTitle)
end

function AwardItem:WriteLog(szExtraInfo, szLogTitle)
    if szLogTitle then
        local szName = self.szKey or ""
        WriteLog("[AWARD_TEMPLATE] " .. szLogTitle .. "\t" .. GetAccount() .. "\t" .. GetName() .. "\t" .. szName .. "\t " .. szExtraInfo)
    end
end

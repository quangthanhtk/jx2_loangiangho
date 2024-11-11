Import("\\script\\ksgvn\\lib.lua")
Include('\\script\\ksgvn\\event\\monthly\\monthly_head.lua')

function monthlyEvent_OnNpcTalk()
    local szAwardName1 = KsgItem:GetName(MONTHLY_EVENT_AWARD1)
    local szAwardName2 = KsgItem:GetName(MONTHLY_EVENT_AWARD2)
    local szAwardName3 = KsgItem:GetName(MONTHLY_EVENT_AWARD3)
    local tSay = {
        format("<color=green>%s:<color> S� ki�n �� k�t th�c!", _monthlyEvent_GetNpcName()),
        --"Gi�i th�ch ho�t ��ng /_monthlyEvent_ShowInfo",
        ----format("\nMua H�p Qu� S� Ki�n/_monthlyEvent_BuyDropEventBox"),
        --format("\n��i %s, %s /_monthlyEvent_OnExchange1", szAwardName1, szAwardName2),
        --format("��i %s/_monthlyEvent_OnExchange2", szAwardName3),
        --format("\nTra xem s� l��ng %s, %s �� d�ng /_monthlyEvent_OnLookUp1", KsgItem:GetName(MONTHLY_EVENT_AWARD1), KsgItem:GetName(MONTHLY_EVENT_AWARD2)),
        --format("Tra xem s� l��ng %s �� d�ng/_monthlyEvent_OnLookUp2", KsgItem:GetName(MONTHLY_EVENT_AWARD3)),
        --format("\nNh�n m�c s� d�ng %d %s/_monthlyEvent_Gift1", MONTHLY_EVENT_GIFT_REQUIRE_NUM1, szAwardName1),
        --format("Nh�n m�c s� d�ng %d %s/_monthlyEvent_Gift2", MONTHLY_EVENT_GIFT_REQUIRE_NUM2, szAwardName2),
        --"\nTa ch� ti�n ���ng gh� qua/no",
    }
    if KsgPlayer:IsAdmin() then
        tinsert(tSay, 2, format("%s/_monthlyEvent_Test1", "Test m�c 1"))
    end
    KsgNpc:SayDialog(tSay)
end

function _monthlyEvent_BuyDropEventBox(nSelected)
    local tbGoods = {
        [1] = { tbProp = { 2, 1, 50263 }, nStack = 1000, nCostGold = 500 },
        [2] = { tbProp = { 2, 1, 50263 }, nStack = 10000, nCostGold = 5000 }
    };

    if nSelected == WEnv.NULL then
        local tbSay = { "<npcname>: H�p Qu� S� Ki�n c� th� nh�n ���c t� c�c ho�t ��ng trong game mi�n ph�, � ��y ti�u mu�i c� m�t �t h�p qu� ch�a d�ng ��n, <sex> c� mu�n mua kh�ng?" };

        for i = 1, getn(tbGoods) do
            tinsert(tbSay, format("��ng � mua %d %s %d v�ng/#_monthlyEvent_BuyDropEventBox(%d)", tbGoods[i].nStack, WItem:GetName(tbGoods[i].tbProp), tbGoods[i].nCostGold, i));
        end

        tinsert(tbSay, "Ta ch� h�i qua th�i/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if tbGoods[nSelected] == WEnv.NULL then
        return WEnv.RETCODE_NOTMATCH;
    end

    if WPlayer:PayGold(tbGoods[nSelected].nCostGold) ~= WEnv.RETCODE_SUCCESS then
        WNpc:Talk(format("<npcname>: <sex> <color=red>kh�ng �� %d v�ng tr�n ng��i<color>, kh�ng th� mua %d %s!", tbGoods[nSelected].nCostGold, tbGoods[nSelected].nStack, WItem:GetName(tbGoods[nSelected].tbProp)));
        return WEnv.RETCODE_CONSUMEERROR;
    end

    WAward:Give(tbGoods[nSelected], "Mua h�p qu� t�i Li�n Chi");
end

function _monthlyEvent_ShowInfo()
    local nYear = date("%Y")
    local nMonth = date("%m")
    local nStartDate = tonumber(nYear .. nMonth .. "01")
    local nEndDate = tonumber(nYear .. nMonth .. KsgDate:GetDaysInMonth(nMonth, nYear))
    local szAwardName1 = KsgItem:GetName(MONTHLY_EVENT_AWARD1)
    local szAwardName2 = KsgItem:GetName(MONTHLY_EVENT_AWARD2)
    local szAwardName3 = KsgItem:GetName(MONTHLY_EVENT_AWARD3)
    local szTitle = format("<color=green>%s:<color> Trong th�i gian <color=yellow>%s<color> ��n <color=yellow>%s<color>, qu� nh�n s� c� th� ��n ch� ta �� ti�n h�nh ��i %s v� %s, d�ng %s v� %s c�n c� th� ��i ���c %s", _monthlyEvent_GetNpcName(), KsgDate:ToString(nStartDate), KsgDate:ToString(nEndDate), szAwardName1, szAwardName2, szAwardName1, szAwardName2, szAwardName3)
    szTitle = szTitle .. format("\n��i 1 %s ho�c %s c�n: %s", szAwardName1, szAwardName2, KsgLib:MaterialDescription(_g_monthlyEvent_ExchangeCfg1[1].tbCondition))
    szTitle = szTitle .. format("\n��i 1 %s c�n: %s", szAwardName3, KsgLib:MaterialDescription(_g_monthlyEvent_ExchangeCfg2[1].tbCondition))
    local tSay = {
        szTitle,
        "Ta bi�t r�i/no"
    }
    KsgNpc:SayDialog(tSay)
end

function _monthlyEvent_OnLookUp1()
    local nUsedCount1 = KsgTask:Get(TASKID_EVENT_MONTHLY_ITEM1)
    local nUsedCount2 = KsgTask:Get(TASKID_EVENT_MONTHLY_ITEM2)
    local szAwardName1 = KsgItem:GetName(MONTHLY_EVENT_AWARD1)
    local szAwardName2 = KsgItem:GetName(MONTHLY_EVENT_AWARD2)
    local szAwardName3 = KsgItem:GetName(MONTHLY_EVENT_AWARD3)
    local nNeedUse1 = MONTHLY_EVENT_REQUIRE_USE_NUM - nUsedCount1
    local nNeedUse2 = MONTHLY_EVENT_REQUIRE_USE_NUM - nUsedCount2
    local szTalk = format("<color=green>%s:<color> C�c h� �� s� d�ng:<enter><color=yellow>%d l�n<color> <color=gold>%s<color><enter><color=yellow>%d l�n<color> <color=gold>%s<color><enter><color=green>�� c� th� d�ng %s<color>", _monthlyEvent_GetNpcName(), nUsedCount1, szAwardName1, nUsedCount2, szAwardName2, szAwardName3)
    if nNeedUse1 > 0 or nNeedUse2 > 0 then
        szTalk = format("<color=green>%s:<color> C�c h� �� s� d�ng: <enter><color=yellow>%d l�n<color> <color=gold>%s<color><enter><color=yellow>%d l�n<color> <color=gold>%s<color>", _monthlyEvent_GetNpcName(), nUsedCount1, szAwardName1, nUsedCount2, szAwardName2)
        if nNeedUse1 > 0 then
            szTalk = szTalk .. format("<enter>Ti�p t�c d�ng th�m <color=red>%d<color> %s", nNeedUse1, szAwardName1)
        end
        if nNeedUse2 > 0 then
            if nNeedUse1 > 0 then
                szTalk = szTalk .. format(" v� <color=red>%d<color> %s", nNeedUse2, szAwardName2)
            else
                szTalk = szTalk .. format("<enter>Ti�p t�c d�ng th�m <color=red>%d<color> %s", nNeedUse2, szAwardName2)
            end
        end
        szTalk = szTalk .. format(" s� s� d�ng ���c <color=yellow>%s<color>", szAwardName3)
    end
    KsgNpc:Talk(szTalk)
end

function _monthlyEvent_OnLookUp2()
    local nUsedCount = KsgTask:Get(TASKID_EVENT_MONTHLY_ITEM3)
    local nNextAwardIndex, tbNextAccumulate = _monthlyEvent_GetNextAwardInfo(nUsedCount)
    local szAwardName3 = KsgItem:GetName(MONTHLY_EVENT_AWARD3)
    local szTalk = format("<color=green>%s:<color> C�c h� �� s� d�ng <color=yellow>%d l�n<color> <color=gold>%s<color>, �� nh�n ���c t�t c� ph�n th��ng", _monthlyEvent_GetNpcName(), nUsedCount, szAwardName3)
    if nNextAwardIndex ~= 0 then
        szTalk = format("<color=green>%s:<color> C�c h� �� s� d�ng <color=gold>%s<color> <color=yellow>%d l�n<color>, ti�p t�c d�ng th�m %d l�n s� nh�n ���c ph�n th��ng <color=gold>%s<color>", _monthlyEvent_GetNpcName(), szAwardName3, nUsedCount, tbNextAccumulate.nRequireNum - nUsedCount, tbNextAccumulate.szName)
    end
    KsgNpc:Talk(szTalk)
end

function _monthlyEvent_GetNextAwardInfo(nUseNum)
    for nIndex, tbAccumulate in _g_monthlyEvent_AwardAccumulate do
        if nUseNum < tbAccumulate.nRequireNum then
            return nIndex, tbAccumulate
        end
    end
    return 0, nil
end

function _monthlyEvent_OnExchange1(nExchangeIndex)
    if not _monthlyEvent_CanJoin() then
        return
    end
    if nExchangeIndex then
        local exchange = _g_monthlyEvent_ExchangeCfg1[nExchangeIndex]
        if not KsgLib:HasEnoughBagRoom(5) then
            return
        end
        if KsgLib:PayMaterial(exchange.tbCondition) then
            local nItem1, nItem2 = 0, 0
            for _ = 1, exchange.nNum do
                if KsgLib:IsRate(50) then
                    nItem1 = nItem1 + 1
                else
                    nItem2 = nItem2 + 1
                end
            end
            local tbAward = {}
            if nItem1 > 0 then
                tinsert(tbAward, { tbProp = MONTHLY_EVENT_AWARD1, nStack = nItem1, nStatus = 1 })
            end
            if nItem2 > 0 then
                tinsert(tbAward, { tbProp = MONTHLY_EVENT_AWARD2, nStack = nItem2, nStatus = 1 })
            end
            KsgAward:Give(tbAward, "MonthlyEvent_ExchangeItem1")
        else
            return
        end
    end
    local szAwardName1 = KsgItem:GetName(MONTHLY_EVENT_AWARD1)
    local szAwardName2 = KsgItem:GetName(MONTHLY_EVENT_AWARD2)
    local tSay = {
        format("<color=green>%s:<color> ��i 1 %s ho�c %s c�n: %s", _monthlyEvent_GetNpcName(), szAwardName1, szAwardName2, KsgLib:MaterialDescription(_g_monthlyEvent_ExchangeCfg1[1].tbCondition)),
    }
    for nExchangeIdx, tbExchangeCfg in _g_monthlyEvent_ExchangeCfg1 do
        tinsert(tSay, format("Ta mu�n ��i %d %s - %s /#_monthlyEvent_OnExchange1(%d)", tbExchangeCfg.nNum, szAwardName1, szAwardName2, nExchangeIdx))
    end
    tinsert(tSay, "T�m ch�a mu�n ��i/no")
    KsgNpc:SayDialog(tSay)
end

function _monthlyEvent_OnExchange2(nExchangeIndex)
    if not _monthlyEvent_CanJoin() then
        return
    end
    if nExchangeIndex then
        local tbExchangeCfg = _g_monthlyEvent_ExchangeCfg2[nExchangeIndex]
        if not KsgLib:HasEnoughBagRoom(5) then
            return
        end
        if KsgLib:PayMaterial(tbExchangeCfg.tbCondition) then
            KsgAward:Give({ tbProp = MONTHLY_EVENT_AWARD3, nStack = tbExchangeCfg.nNum, nStatus = 1 }, "MonthlyEvent_ExchangeItem2")
        else
            return
        end
    end
    local szAwardName3 = KsgItem:GetName(MONTHLY_EVENT_AWARD3)
    local tSay = {
        format("<color=green>%s:<color> ��i 1 %s c�n: %s", _monthlyEvent_GetNpcName(), szAwardName3, KsgLib:MaterialDescription(_g_monthlyEvent_ExchangeCfg2[1].tbCondition)),
    }
    for nExchangeIdx, tbExchangeCfg in _g_monthlyEvent_ExchangeCfg2 do
        tinsert(tSay, format("Ta mu�n ��i %d %s/#_monthlyEvent_OnExchange2(%d)", tbExchangeCfg.nNum, szAwardName3, nExchangeIdx))
    end
    tinsert(tSay, "T�m ch�a mu�n ��i/no")
    KsgNpc:SayDialog(tSay)
end

function monthlyEvent_OnUseItem(nIndex)
    if not _monthlyEvent_CanJoin() then
        return
    end
    local nG, nD, nP = GetItemInfoByIndex(nIndex)
    local nId = PackItemId(nG, nD, nP)
    if not _g_monthlyEvent_ItemCfg[nId] then
        return
    end
    local tbItemCfg = _g_monthlyEvent_ItemCfg[nId]
    local szAwardName1 = KsgItem:GetName(MONTHLY_EVENT_AWARD1)
    local szAwardName2 = KsgItem:GetName(MONTHLY_EVENT_AWARD2)
    local szAwardName3 = KsgItem:GetName(MONTHLY_EVENT_AWARD3)
    if tbItemCfg.nType == MONTHLY_EVENT_ITEM_TYPE_SPECIAL and KsgTask:Get(TASKID_EVENT_MONTHLY_ITEM1) < MONTHLY_EVENT_REQUIRE_USE_NUM then
        return KsgNpc:Talk(format("C�c h� ch�a s� d�ng �� %d %s, kh�ng th� s� d�ng %s!", MONTHLY_EVENT_REQUIRE_USE_NUM, szAwardName1, szAwardName3))
    end
    if tbItemCfg.nType == MONTHLY_EVENT_ITEM_TYPE_SPECIAL and KsgTask:Get(TASKID_EVENT_MONTHLY_ITEM2) < MONTHLY_EVENT_REQUIRE_USE_NUM then
        return KsgNpc:Talk(format("C�c h� ch�a s� d�ng �� %d %s, kh�ng th� s� d�ng %s!", MONTHLY_EVENT_REQUIRE_USE_NUM, szAwardName2, szAwardName3))
    end
    local szItemName = KsgItem:GetName(nG, nD, nP)
    local nCurUse = KsgTask:Get(tbItemCfg.nTaskId)
    if nCurUse >= MONTHLY_EVENT_MAX_USE then
        return KsgNpc:Talk(format("M�i nh�n v�t ch� c� th� s� d�ng t�i �a %d %s!", MONTHLY_EVENT_MAX_USE, szItemName))
    end
    if not KsgLib:HasEnoughBagRoom(5) then
        return
    end
    if DelItemByIndex(nIndex, 1) == 1 then
        KsgTask:Modify(tbItemCfg.nTaskId, 1)
        KsgPlayer:BigAddExp(tbItemCfg.nExp)
        KsgAward:Give(tbItemCfg.tbAward, "MonthlyEventAward_" .. tbItemCfg.nType)
        if tbItemCfg.nType == MONTHLY_EVENT_ITEM_TYPE_SPECIAL then
            local nUsedCount = KsgTask:Get(tbItemCfg.nTaskId)
            for _, tbAccumulate in _g_monthlyEvent_AwardAccumulate do
                if tbAccumulate.nRequireNum == nUsedCount then
                    KsgAward:Give(tbAccumulate.tbAward, 'EventAward_Accumulate_' .. tbItemCfg.nType)
                end
            end
        end
    end
    KsgPlayer:Msg(format("�� d�ng %d/%d %s", nCurUse + 1, MONTHLY_EVENT_MAX_USE, szItemName))
end

function _monthlyEvent_Gift1()
    local szAwardName1 = KsgItem:GetName(MONTHLY_EVENT_AWARD1)
    if KsgTask:Get(TASKID_EVENT_MONTHLY_ITEM1) < MONTHLY_EVENT_GIFT_REQUIRE_NUM1 then
        return KsgNpc:Talk(format("C�c h� ch�a s� d�ng �� %d %s, kh�ng th� nh�n ph�n th��ng n�y!", MONTHLY_EVENT_GIFT_REQUIRE_NUM1, szAwardName1))
    end
    if KsgTask:GetBit(TASKID_EVENT_MONTHLY_ACCUMULATE, TASKID_EVENT_MONTHLY_BIT_ACCUMULATE1) == 1 then
        return KsgNpc:Talk("C�c h� �� nh�n ph�n th��ng n�y r�i.")
    end
    if not KsgLib:HasEnoughBagRoom(2) then
        return
    end
    KsgAward:Give(_g_monthlyEvent_AwardAccumulate1)
    KsgTask:SetBit(TASKID_EVENT_MONTHLY_ACCUMULATE, TASKID_EVENT_MONTHLY_BIT_ACCUMULATE1, 1)
end

function _monthlyEvent_Gift2()
    local szAwardName2 = KsgItem:GetName(MONTHLY_EVENT_AWARD2)
    if KsgTask:Get(TASKID_EVENT_MONTHLY_ITEM2) < MONTHLY_EVENT_GIFT_REQUIRE_NUM2 then
        return KsgNpc:Talk(format("C�c h� ch�a s� d�ng �� %d %s, kh�ng th� nh�n ph�n th��ng n�y!", MONTHLY_EVENT_GIFT_REQUIRE_NUM2, szAwardName2))
    end

    if KsgTask:GetBit(TASKID_EVENT_MONTHLY_ACCUMULATE, TASKID_EVENT_MONTHLY_BIT_ACCUMULATE2) == 1 then
        return KsgNpc:Talk("C�c h� �� nh�n ph�n th��ng n�y r�i.")
    end
    if not KsgLib:HasEnoughBagRoom(2) then
        return
    end
    KsgAward:Give(_g_monthlyEvent_AwardAccumulate2)
    KsgTask:SetBit(TASKID_EVENT_MONTHLY_ACCUMULATE, TASKID_EVENT_MONTHLY_BIT_ACCUMULATE2, 1)
end

function _monthlyEvent_CanJoin()
    if MONTHLY_EVENT_SWITCH ~= 1 then
        KsgNpc:Talk("S� ki�n �� t�m ��ng. Th�ng tin chi ti�t ho�t ��ng ��ng ��o c� th� xem t�i trang ch�.")
        return nil
    end
    if KsgPlayer:GetBigLevel() < MONTHLY_EVENT_REQUIRE_LEVEL then
        KsgNpc:Talk(format("Ch�a ��t %s, kh�ng th� tham gia s� ki�n!", KsgLib:Level2String(MONTHLY_EVENT_REQUIRE_LEVEL)))
        return nil
    end
    local nVersion = tonumber(date("%Y%m"))
    if KsgTask:Get(TASKID_EVENT_MONTHLY_VERSION) ~= nVersion then
        KsgNpc:Talk("S� ki�n n�y �� k�t th�c, v�t ph�m s� ki�n c�ng �� h�t h�n. H�y ��ng nh�p l�i �� c�p nh�t v� tham gia s� ki�n m�i.")
        return nil
    end
    return 1
end

function _monthlyEvent_Test1()
    SetTask(TASKID_EVENT_MONTHLY_ITEM1, MONTHLY_EVENT_REQUIRE_USE_NUM)
    SetTask(TASKID_EVENT_MONTHLY_ITEM2, MONTHLY_EVENT_REQUIRE_USE_NUM)
    KsgLog:Print(format("��t s� l��ng item 1,2 �� s� d�ng th�nh %d", MONTHLY_EVENT_REQUIRE_USE_NUM))
end

function _monthlyEvent_GetNpcName()
    if GetTargetNpcName() then
        return GetTargetNpcName()
    end
    return "C�m Nang ��i S� Ki�n"
end

function _monthlyEvent_OnLogin()
    local nVersion = tonumber(date("%Y%m"))
    if KsgTask:Get(TASKID_EVENT_MONTHLY_VERSION) ~= nVersion then

        -- X�a nguy�n li�u c�
        KsgItem:DeleteAll(MONTHLY_EVENT_MATERIAL1_OLD)
        KsgItem:DeleteAll(MONTHLY_EVENT_MATERIAL2_OLD)
        KsgItem:DeleteAll(MONTHLY_EVENT_MATERIAL3_OLD)

        -- X�a ph�n th��ng c�
        KsgItem:DeleteAll(MONTHLY_EVENT_AWARD1_OLD)
        KsgItem:DeleteAll(MONTHLY_EVENT_AWARD2_OLD)
        KsgItem:DeleteAll(MONTHLY_EVENT_AWARD3_OLD)

        KsgItem:DeleteAll({ 2, 1, 50263 }) -- X�a h�p qu� s� ki�n

        -- Reset s� l�n s� d�ng v� tr�ng th�i nh�n th��ng m�c
        KsgTask:Set(TASKID_EVENT_MONTHLY_ITEM1, 0)
        KsgTask:Set(TASKID_EVENT_MONTHLY_ITEM2, 0)
        KsgTask:Set(TASKID_EVENT_MONTHLY_ITEM3, 0)
        KsgTask:Set(TASKID_EVENT_MONTHLY_ACCUMULATE, 0)

        -- C�p nh�t version m�i
        KsgTask:Set(TASKID_EVENT_MONTHLY_VERSION, nVersion)
    end
end

function monthlyEvent_DropMaterial()
    local nVersion = tonumber(date("%Y%m"))
    if KsgTask:Get(TASKID_EVENT_MONTHLY_VERSION) ~= nVersion then
        _monthlyEvent_OnLogin()
        return
    end
    local nRandStart = 5
    local nRandEnd = 20
    local tbMaterials = {
        { tbProp = MONTHLY_EVENT_MATERIAL1, nStatus = 1, nStack = random(nRandStart, nRandEnd), nRate = 40 },
        { tbProp = MONTHLY_EVENT_MATERIAL2, nStatus = 1, nStack = random(nRandStart, nRandEnd), nRate = 40 },
        { tbProp = MONTHLY_EVENT_MATERIAL3, nStatus = 1, nStack = random(nRandStart, nRandEnd), nRate = 20 },
    }
    KsgAward:Give(tbMaterials, "MonthlyEvent_DropMaterials")
end

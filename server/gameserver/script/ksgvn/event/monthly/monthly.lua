Import("\\script\\ksgvn\\lib.lua")
Include('\\script\\ksgvn\\event\\monthly\\monthly_head.lua')

function monthlyEvent_OnNpcTalk()
    local szAwardName1 = KsgItem:GetName(MONTHLY_EVENT_AWARD1)
    local szAwardName2 = KsgItem:GetName(MONTHLY_EVENT_AWARD2)
    local szAwardName3 = KsgItem:GetName(MONTHLY_EVENT_AWARD3)
    local tSay = {
        format("<color=green>%s:<color> Sù kiÖn ®· kÕt thóc!", _monthlyEvent_GetNpcName()),
        --"Gi¶i thÝch ho¹t ®éng /_monthlyEvent_ShowInfo",
        ----format("\nMua Hép Quµ Sù KiÖn/_monthlyEvent_BuyDropEventBox"),
        --format("\n§æi %s, %s /_monthlyEvent_OnExchange1", szAwardName1, szAwardName2),
        --format("§æi %s/_monthlyEvent_OnExchange2", szAwardName3),
        --format("\nTra xem sè l­îng %s, %s ®· dïng /_monthlyEvent_OnLookUp1", KsgItem:GetName(MONTHLY_EVENT_AWARD1), KsgItem:GetName(MONTHLY_EVENT_AWARD2)),
        --format("Tra xem sè l­îng %s ®· dïng/_monthlyEvent_OnLookUp2", KsgItem:GetName(MONTHLY_EVENT_AWARD3)),
        --format("\nNhËn mèc sö dông %d %s/_monthlyEvent_Gift1", MONTHLY_EVENT_GIFT_REQUIRE_NUM1, szAwardName1),
        --format("NhËn mèc sö dông %d %s/_monthlyEvent_Gift2", MONTHLY_EVENT_GIFT_REQUIRE_NUM2, szAwardName2),
        --"\nTa chØ tiÖn ®­êng ghÐ qua/no",
    }
    if KsgPlayer:IsAdmin() then
        tinsert(tSay, 2, format("%s/_monthlyEvent_Test1", "Test mèc 1"))
    end
    KsgNpc:SayDialog(tSay)
end

function _monthlyEvent_BuyDropEventBox(nSelected)
    local tbGoods = {
        [1] = { tbProp = { 2, 1, 50263 }, nStack = 1000, nCostGold = 500 },
        [2] = { tbProp = { 2, 1, 50263 }, nStack = 10000, nCostGold = 5000 }
    };

    if nSelected == WEnv.NULL then
        local tbSay = { "<npcname>: Hép Quµ Sù KiÖn cã thÓ nhËn ®­îc tõ c¸c ho¹t ®éng trong game miÔn phÝ, ë ®©y tiÓu muéi cã mét Ýt hép quµ ch­a dïng ®Õn, <sex> cã muèn mua kh«ng?" };

        for i = 1, getn(tbGoods) do
            tinsert(tbSay, format("§ång ý mua %d %s %d vµng/#_monthlyEvent_BuyDropEventBox(%d)", tbGoods[i].nStack, WItem:GetName(tbGoods[i].tbProp), tbGoods[i].nCostGold, i));
        end

        tinsert(tbSay, "Ta chØ hái qua th«i/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if tbGoods[nSelected] == WEnv.NULL then
        return WEnv.RETCODE_NOTMATCH;
    end

    if WPlayer:PayGold(tbGoods[nSelected].nCostGold) ~= WEnv.RETCODE_SUCCESS then
        WNpc:Talk(format("<npcname>: <sex> <color=red>kh«ng ®ñ %d vµng trªn ng­êi<color>, kh«ng thÓ mua %d %s!", tbGoods[nSelected].nCostGold, tbGoods[nSelected].nStack, WItem:GetName(tbGoods[nSelected].tbProp)));
        return WEnv.RETCODE_CONSUMEERROR;
    end

    WAward:Give(tbGoods[nSelected], "Mua hép quµ t¹i Liªn Chi");
end

function _monthlyEvent_ShowInfo()
    local nYear = date("%Y")
    local nMonth = date("%m")
    local nStartDate = tonumber(nYear .. nMonth .. "01")
    local nEndDate = tonumber(nYear .. nMonth .. KsgDate:GetDaysInMonth(nMonth, nYear))
    local szAwardName1 = KsgItem:GetName(MONTHLY_EVENT_AWARD1)
    local szAwardName2 = KsgItem:GetName(MONTHLY_EVENT_AWARD2)
    local szAwardName3 = KsgItem:GetName(MONTHLY_EVENT_AWARD3)
    local szTitle = format("<color=green>%s:<color> Trong thêi gian <color=yellow>%s<color> ®Õn <color=yellow>%s<color>, quý nh©n sÜ cã thÓ ®Õn chç ta ®Ó tiÕn hµnh ®æi %s vµ %s, dïng %s vµ %s cßn cã thÓ ®æi ®­îc %s", _monthlyEvent_GetNpcName(), KsgDate:ToString(nStartDate), KsgDate:ToString(nEndDate), szAwardName1, szAwardName2, szAwardName1, szAwardName2, szAwardName3)
    szTitle = szTitle .. format("\n§æi 1 %s hoÆc %s cÇn: %s", szAwardName1, szAwardName2, KsgLib:MaterialDescription(_g_monthlyEvent_ExchangeCfg1[1].tbCondition))
    szTitle = szTitle .. format("\n§æi 1 %s cÇn: %s", szAwardName3, KsgLib:MaterialDescription(_g_monthlyEvent_ExchangeCfg2[1].tbCondition))
    local tSay = {
        szTitle,
        "Ta biÕt råi/no"
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
    local szTalk = format("<color=green>%s:<color> C¸c h¹ ®· sö dông:<enter><color=yellow>%d lÇn<color> <color=gold>%s<color><enter><color=yellow>%d lÇn<color> <color=gold>%s<color><enter><color=green>§· cã thÓ dïng %s<color>", _monthlyEvent_GetNpcName(), nUsedCount1, szAwardName1, nUsedCount2, szAwardName2, szAwardName3)
    if nNeedUse1 > 0 or nNeedUse2 > 0 then
        szTalk = format("<color=green>%s:<color> C¸c h¹ ®· sö dông: <enter><color=yellow>%d lÇn<color> <color=gold>%s<color><enter><color=yellow>%d lÇn<color> <color=gold>%s<color>", _monthlyEvent_GetNpcName(), nUsedCount1, szAwardName1, nUsedCount2, szAwardName2)
        if nNeedUse1 > 0 then
            szTalk = szTalk .. format("<enter>TiÕp tôc dïng thªm <color=red>%d<color> %s", nNeedUse1, szAwardName1)
        end
        if nNeedUse2 > 0 then
            if nNeedUse1 > 0 then
                szTalk = szTalk .. format(" vµ <color=red>%d<color> %s", nNeedUse2, szAwardName2)
            else
                szTalk = szTalk .. format("<enter>TiÕp tôc dïng thªm <color=red>%d<color> %s", nNeedUse2, szAwardName2)
            end
        end
        szTalk = szTalk .. format(" sÏ sö dông ®­îc <color=yellow>%s<color>", szAwardName3)
    end
    KsgNpc:Talk(szTalk)
end

function _monthlyEvent_OnLookUp2()
    local nUsedCount = KsgTask:Get(TASKID_EVENT_MONTHLY_ITEM3)
    local nNextAwardIndex, tbNextAccumulate = _monthlyEvent_GetNextAwardInfo(nUsedCount)
    local szAwardName3 = KsgItem:GetName(MONTHLY_EVENT_AWARD3)
    local szTalk = format("<color=green>%s:<color> C¸c h¹ ®· sö dông <color=yellow>%d lÇn<color> <color=gold>%s<color>, ®· nhËn ®­îc tÊt c¶ phÇn th­ëng", _monthlyEvent_GetNpcName(), nUsedCount, szAwardName3)
    if nNextAwardIndex ~= 0 then
        szTalk = format("<color=green>%s:<color> C¸c h¹ ®· sö dông <color=gold>%s<color> <color=yellow>%d lÇn<color>, tiÕp tôc dïng thªm %d lÇn sÏ nhËn ®­îc phÇn th­ëng <color=gold>%s<color>", _monthlyEvent_GetNpcName(), szAwardName3, nUsedCount, tbNextAccumulate.nRequireNum - nUsedCount, tbNextAccumulate.szName)
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
        format("<color=green>%s:<color> §æi 1 %s hoÆc %s cÇn: %s", _monthlyEvent_GetNpcName(), szAwardName1, szAwardName2, KsgLib:MaterialDescription(_g_monthlyEvent_ExchangeCfg1[1].tbCondition)),
    }
    for nExchangeIdx, tbExchangeCfg in _g_monthlyEvent_ExchangeCfg1 do
        tinsert(tSay, format("Ta muèn ®æi %d %s - %s /#_monthlyEvent_OnExchange1(%d)", tbExchangeCfg.nNum, szAwardName1, szAwardName2, nExchangeIdx))
    end
    tinsert(tSay, "T¹m ch­a muèn ®æi/no")
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
        format("<color=green>%s:<color> §æi 1 %s cÇn: %s", _monthlyEvent_GetNpcName(), szAwardName3, KsgLib:MaterialDescription(_g_monthlyEvent_ExchangeCfg2[1].tbCondition)),
    }
    for nExchangeIdx, tbExchangeCfg in _g_monthlyEvent_ExchangeCfg2 do
        tinsert(tSay, format("Ta muèn ®æi %d %s/#_monthlyEvent_OnExchange2(%d)", tbExchangeCfg.nNum, szAwardName3, nExchangeIdx))
    end
    tinsert(tSay, "T¹m ch­a muèn ®æi/no")
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
        return KsgNpc:Talk(format("C¸c h¹ ch­a sö dông ®ñ %d %s, kh«ng thÓ sö dông %s!", MONTHLY_EVENT_REQUIRE_USE_NUM, szAwardName1, szAwardName3))
    end
    if tbItemCfg.nType == MONTHLY_EVENT_ITEM_TYPE_SPECIAL and KsgTask:Get(TASKID_EVENT_MONTHLY_ITEM2) < MONTHLY_EVENT_REQUIRE_USE_NUM then
        return KsgNpc:Talk(format("C¸c h¹ ch­a sö dông ®ñ %d %s, kh«ng thÓ sö dông %s!", MONTHLY_EVENT_REQUIRE_USE_NUM, szAwardName2, szAwardName3))
    end
    local szItemName = KsgItem:GetName(nG, nD, nP)
    local nCurUse = KsgTask:Get(tbItemCfg.nTaskId)
    if nCurUse >= MONTHLY_EVENT_MAX_USE then
        return KsgNpc:Talk(format("Mçi nh©n vËt chØ cã thÓ sö dông tèi ®a %d %s!", MONTHLY_EVENT_MAX_USE, szItemName))
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
    KsgPlayer:Msg(format("§· dïng %d/%d %s", nCurUse + 1, MONTHLY_EVENT_MAX_USE, szItemName))
end

function _monthlyEvent_Gift1()
    local szAwardName1 = KsgItem:GetName(MONTHLY_EVENT_AWARD1)
    if KsgTask:Get(TASKID_EVENT_MONTHLY_ITEM1) < MONTHLY_EVENT_GIFT_REQUIRE_NUM1 then
        return KsgNpc:Talk(format("C¸c h¹ ch­a sö dông ®ñ %d %s, kh«ng thÓ nhËn phÇn th­ëng nµy!", MONTHLY_EVENT_GIFT_REQUIRE_NUM1, szAwardName1))
    end
    if KsgTask:GetBit(TASKID_EVENT_MONTHLY_ACCUMULATE, TASKID_EVENT_MONTHLY_BIT_ACCUMULATE1) == 1 then
        return KsgNpc:Talk("C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
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
        return KsgNpc:Talk(format("C¸c h¹ ch­a sö dông ®ñ %d %s, kh«ng thÓ nhËn phÇn th­ëng nµy!", MONTHLY_EVENT_GIFT_REQUIRE_NUM2, szAwardName2))
    end

    if KsgTask:GetBit(TASKID_EVENT_MONTHLY_ACCUMULATE, TASKID_EVENT_MONTHLY_BIT_ACCUMULATE2) == 1 then
        return KsgNpc:Talk("C¸c h¹ ®· nhËn phÇn th­ëng nµy råi.")
    end
    if not KsgLib:HasEnoughBagRoom(2) then
        return
    end
    KsgAward:Give(_g_monthlyEvent_AwardAccumulate2)
    KsgTask:SetBit(TASKID_EVENT_MONTHLY_ACCUMULATE, TASKID_EVENT_MONTHLY_BIT_ACCUMULATE2, 1)
end

function _monthlyEvent_CanJoin()
    if MONTHLY_EVENT_SWITCH ~= 1 then
        KsgNpc:Talk("Sù kiÖn ®· t¹m ®ãng. Th«ng tin chi tiÕt ho¹t ®éng ®ång ®¹o cã thÓ xem t¹i trang chñ.")
        return nil
    end
    if KsgPlayer:GetBigLevel() < MONTHLY_EVENT_REQUIRE_LEVEL then
        KsgNpc:Talk(format("Ch­a ®¹t %s, kh«ng thÓ tham gia sù kiÖn!", KsgLib:Level2String(MONTHLY_EVENT_REQUIRE_LEVEL)))
        return nil
    end
    local nVersion = tonumber(date("%Y%m"))
    if KsgTask:Get(TASKID_EVENT_MONTHLY_VERSION) ~= nVersion then
        KsgNpc:Talk("Sù kiÖn nµy ®· kÕt thóc, vËt phÈm sù kiÖn còng ®· hÕt h¹n. H·y ®¨ng nhËp l¹i ®Ó cËp nhËt vµ tham gia sù kiÖn míi.")
        return nil
    end
    return 1
end

function _monthlyEvent_Test1()
    SetTask(TASKID_EVENT_MONTHLY_ITEM1, MONTHLY_EVENT_REQUIRE_USE_NUM)
    SetTask(TASKID_EVENT_MONTHLY_ITEM2, MONTHLY_EVENT_REQUIRE_USE_NUM)
    KsgLog:Print(format("§Æt sè l­îng item 1,2 ®· sö dông thµnh %d", MONTHLY_EVENT_REQUIRE_USE_NUM))
end

function _monthlyEvent_GetNpcName()
    if GetTargetNpcName() then
        return GetTargetNpcName()
    end
    return "CÈm Nang §¹i Sù KiÖn"
end

function _monthlyEvent_OnLogin()
    local nVersion = tonumber(date("%Y%m"))
    if KsgTask:Get(TASKID_EVENT_MONTHLY_VERSION) ~= nVersion then

        -- Xãa nguyªn liÖu cò
        KsgItem:DeleteAll(MONTHLY_EVENT_MATERIAL1_OLD)
        KsgItem:DeleteAll(MONTHLY_EVENT_MATERIAL2_OLD)
        KsgItem:DeleteAll(MONTHLY_EVENT_MATERIAL3_OLD)

        -- Xãa phÇn th­ëng cò
        KsgItem:DeleteAll(MONTHLY_EVENT_AWARD1_OLD)
        KsgItem:DeleteAll(MONTHLY_EVENT_AWARD2_OLD)
        KsgItem:DeleteAll(MONTHLY_EVENT_AWARD3_OLD)

        KsgItem:DeleteAll({ 2, 1, 50263 }) -- Xãa hép quµ sù kiÖn

        -- Reset sè lÇn sö dông vµ tr¹ng th¸i nhËn th­ëng mèc
        KsgTask:Set(TASKID_EVENT_MONTHLY_ITEM1, 0)
        KsgTask:Set(TASKID_EVENT_MONTHLY_ITEM2, 0)
        KsgTask:Set(TASKID_EVENT_MONTHLY_ITEM3, 0)
        KsgTask:Set(TASKID_EVENT_MONTHLY_ACCUMULATE, 0)

        -- CËp nhËt version míi
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

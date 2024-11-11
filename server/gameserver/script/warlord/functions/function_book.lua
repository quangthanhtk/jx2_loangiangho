----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-21
--- Description: c∏c hµm li™n quan Æ’n s∏ch
----------------------------------------------------------------------------------------------------
--Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
function _w_book_AddCommonBook(nSelectIdx, nNum, nSkillLevel, nPageCount, nValue1, nValue2, nValue3, nValue4)
    nSelectIdx = nSelectIdx or 0;
    nNum = nNum or 1;

    -- MÀt tﬁch m´n ph∏i
    local tbBook = g_tbCommonBook;

    if nSelectIdx == 0 then
        local tbSay = { "H∑y ch‰n mÈt loπi mÀt tﬁch sΩn c„ sau Æ©y:" };
        for i = 1, getn(tbBook) do
            if type(nSkillLevel) == "number" then
                tinsert(tbSay, format("%s/#_w_book_AddCommonBook(%d, %d, %d, %d, %d, %d, %d, %d)", WItem:GetName(tbBook[i].tbProp), i, nNum, nSkillLevel, nPageCount, nValue1, nValue2, nValue3, nValue4));
            else
                tinsert(tbSay, format("%s/#_w_book_AddCommonBook(%d, %d)", WItem:GetName(tbBook[i].tbProp), i, nNum));
            end
        end
        tinsert(tbSay, "\nRÍi kh·i/no");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if tbBook[nSelectIdx] == WEnv.NULL then
        WPlayer:Msg("Kh´ng t◊m th y loπi mÀt tﬁch nµy!");
        return WEnv.RETCODE_ERROR;
    end

    local tbAward = {
        { tbProp = tbBook[nSelectIdx].tbProp, nStack = 1, nStatus = 4 };
    };

    local nBookCount = getn(tbAward);
    if WLib:CheckInv(nBookCount * nNum, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    for i = 1, nNum do
        for nIndex = 1, nBookCount do
            local tbBookParam = tbAward[nIndex].tbProp;
            local nRetAdd, nBookIdx = gf_AddItemEx2({ tbBookParam[1], tbBookParam[2], tbBookParam[3], tbAward[nIndex].nStack, tbAward[nIndex].nStatus }, tbBook[nSelectIdx].szName, "item_test_card", "NhÀn mÀt tﬁch th´ng dÙng");
            if type(nSkillLevel) == "number" and nBookIdx ~= 0 then
                _w_book_LearnBook(nBookIdx, nSkillLevel, nPageCount, nValue1, nValue2, nValue3, nValue4);
            end
        end
    end
    return WEnv.RETCODE_SUCCESS;
end
function _w_book_AddBookByType(nNum, nType, nSkillLevel, nPageCount, nValue1, nValue2, nValue3, nValue4, bRandom)
    bRandom = tonumber(bRandom) or 0;
    
    -- MÀt tﬁch m´n ph∏i
    if WPlayer:IsJoinedRoute() ~= WEnv.TRUE then
        WNpc:Talk("C∏c hπ ch≠a gia nhÀp m´n ph∏i, kh´ng th” nhÀn mÀt tﬁch m´n ph∏i!", WEnv.TRUE);
        return WEnv.RETCODE_ROUTE;
    end
    local nRoute = WPlayer:GetRoute()
    local tbBook = g_tbFactionBook_Basic;
    nType = nType or 1;
    if nType == 2 then
        tbBook = g_tbFactionBook_Advanced;
    end
    if nType == 3 then
        tbBook = g_tbFactionBook_High;
    end
    if nType == 4 then
        tbBook = g_tbFactionBook_High_VIP;
    end
    if nType == 5 then
        tbBook = g_tbFactionBook_Super;
    end
    if nType == 6 then
        tbBook = g_tbFactionBook_Secret;
    end
    if tbBook[nRoute] == WEnv.NULL then
        WPlayer:Msg("Kh´ng t◊m th y loπi mÀt tﬁch m´n ph∏i nµy!");
        return WEnv.RETCODE_ERROR;
    end

    local nStatus = ITEMSTATUS_LOCK;
    if bRandom == 1 then
        local nRand = random(1, getn(gf_GetRouteTable()));
        nRoute = gf_GetRouteTable()[nRand];
        nStatus = ITEMSTATUS_TRADE;
    end
    
    local tbAward = {
        { tbProp = { ITEM_G_EQUIP, ITEM_D_EQUIP_BOOK, tbBook[nRoute] }, nStack = nNum, nStatus = nStatus };
    };
    if nType == 1 then
        tinsert(tbAward, { tbProp = { ITEM_G_EQUIP, ITEM_D_EQUIP_BOOK, tbBook[nRoute] + 1 }, nStack = nNum, nStatus = nStatus });
    end

    local nBookCount = getn(tbAward);
    if WLib:CheckInv(nBookCount * nNum, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    for i = 1, nNum do
        for nIndex = 1, nBookCount do
            local tbBookParam = tbAward[nIndex].tbProp;
            local nRetAdd, nBookIdx = gf_AddItemEx2({ tbBookParam[1], tbBookParam[2], tbBookParam[3], 1, tbAward[nIndex].nStatus }, GetItemName(tbBookParam[1], tbBookParam[2], tbBookParam[3]), "item_test_card", "NhÀn mÀt tﬁch m´n ph∏i");
            if type(nSkillLevel) == "number" and nBookIdx ~= 0 then
                _w_book_LearnBook(nBookIdx, nSkillLevel, nPageCount, nValue1, nValue2, nValue3, nValue4);
            end
        end
    end
    return WEnv.RETCODE_SUCCESS;
end
function _w_book_AddMasterBook(nSkillLevel)
    local tbBook = g_tbFactionBook_Master;
    if WPlayer:IsJoinedRoute() ~= WEnv.TRUE then
        WNpc:Talk("C∏c hπ ch≠a gia nhÀp m´n ph∏i, kh´ng th” nhÀn mÀt tﬁch tr n ph∏i!", WEnv.TRUE);
        return WEnv.RETCODE_ROUTE;
    end

    local nRoute = WPlayer:GetRoute()
    if tbBook[nRoute] == WEnv.NULL then
        WPlayer:Msg("Kh´ng t◊m th y loπi mÀt tﬁch tr n ph∏i nµy!");
        return WEnv.RETCODE_NOTMATCH;
    end

    local tbAward = {
        { tbProp = { ITEM_G_EQUIP, ITEM_D_EQUIP_GREAT_BOOK, tbBook[nRoute] }, nStack = 1, nStatus = 4 },
    };

    local nBookCount = getn(tbAward);
    if WLib:CheckInv(nBookCount + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    for nIndex = 1, nBookCount do
        local tbBookParam = tbAward[nIndex].tbProp;
        local nRetAdd, nBookIdx = gf_AddItemEx2({ tbBookParam[1], tbBookParam[2], tbBookParam[3], 1, tbAward[nIndex].nStatus }, GetItemName(tbBookParam[1], tbBookParam[2], tbBookParam[3]), "item_test_card", "NhÀn mÀt tﬁch tr n ph∏i");
        if type(nSkillLevel) == "number" and nBookIdx ~= 0 then
            _w_book_LearnBook(nBookIdx, nSkillLevel);
        end
    end
end
function _w_book_LearnBook(nBookIdx, nSkillLevel, nPageCount, nValue1, nValue2, nValue3, nValue4)
    nBookIdx = nBookIdx or 0;
    
    local nItemG, nItemD, nItemP = GetItemInfoByIndex(nBookIdx);
    if nItemD ~= ITEM_D_EQUIP_BOOK and nItemD ~= ITEM_D_EQUIP_GREAT_BOOK then
        return WEnv.RETCODE_NOTMATCH;
    end

    local nSkillLevelMax = 10;
    local nSkillLevelMin = 0;
    local nValueMax = 120;
    local nValueMin = 20;

    local tbBookData = GetBookInfo(nBookIdx);
    if tonumber(tbBookData.nBookLevel) >= 99 then
        return WEnv.RETCODE_ERROR;
    end

    if type(nSkillLevel) == "number" then
        if nSkillLevel > nSkillLevelMax then
            nSkillLevel = nSkillLevelMax;
        elseif nSkillLevel < nSkillLevelMin then
            nSkillLevel = nSkillLevelMin;
        end
    else
        nSkillLevel = random(nSkillLevelMin, nSkillLevelMax);
    end

    if nItemD == ITEM_D_EQUIP_BOOK then
        if type(nPageCount) == "number" then
            if nPageCount > BOOK_PHU_LUC_MAX then
                nPageCount = BOOK_PHU_LUC_MAX;
            elseif nPageCount < BOOK_PHU_LUC_MIN then
                nPageCount = BOOK_PHU_LUC_MIN;
            end
        else
            nPageCount = random(tbBookData.nPageCount, BOOK_PHU_LUC_MAX);
        end
        if type(nValue1) == "number" then
            if nValue1 > nValueMax then
                nValue1 = nValueMax;
            elseif nValue1 < nValueMin then
                nValue1 = nValueMin;
            end
        end
        if type(nValue2) == "number" then
            if nValue2 > nValueMax then
                nValue2 = nValueMax;
            elseif nValue2 < nValueMin then
                nValue2 = nValueMin;
            end
        end
        if type(nValue3) == "number" then
            if nValue3 > nValueMax then
                nValue3 = nValueMax;
            elseif nValue3 < nValueMin then
                nValue3 = nValueMin;
            end
        end
        if type(nValue4) == "number" then
            if nValue4 > nValueMax then
                nValue4 = nValueMax;
            elseif nValue4 < nValueMin then
                nValue4 = nValueMin;
            end
        end

        if tbBookData.tbBookValue[1] > tbBookData.tbBookValue[2] then
            -- s∏ch ngoπi c´ng
            nValue2 = nValue2 or random(30, 60);
        elseif tbBookData.tbBookValue[2] > tbBookData.tbBookValue[1] then
            -- s∏ch nÈi c´ng
            nValue1 = nValue1 or random(30, 60);
        else
            -- Æ“u nhau
            local nRand = random(1, 100);
            if nRand <= 50 then
                -- s∏ch ngoπi c´ng
                nValue2 = nValue2 or random(30, 60);
            else
                -- s∏ch nÈi c´ng
                nValue1 = nValue1 or random(30, 60);
            end
        end

        if tbBookData.tbBookValue[3] > tbBookData.tbBookValue[4] then
            -- s∏ch t n c´ng
            nValue4 = nValue4 or random(30, 60);
        elseif tbBookData.tbBookValue[4] > tbBookData.tbBookValue[3] then
            -- s∏ch phﬂng thÒ
            nValue3 = nValue3 or random(30, 60);
        else
            -- Æ“u nhau
            local nRand = random(1, 100);
            if nRand <= 50 then
                -- s∏ch t n c´ng
                nValue4 = nValue4 or random(30, 60);
            else
                -- s∏ch phﬂng thÒ
                nValue3 = nValue3 or random(30, 60);
            end
        end
    elseif nItemD == ITEM_D_EQUIP_GREAT_BOOK then
        nPageCount = 0;
        nValue1 = 0;
        nValue2 = 0;
        nValue3 = 0;
        nValue4 = 0;
    end

    SetBookInfo(nBookIdx, nSkillLevel, nPageCount, nValue1, nValue2, nValue3, nValue4);
    if nSkillLevel > 0 then
        SetItemIncreaseLevel(nBookIdx, 1);
        for nBookLevel = 1, 99 - GetItemLevel(nBookIdx) do
            SetItemIncreaseLevel(nBookIdx, nBookLevel + 1);
        end
    end
    return WEnv.RETCODE_SUCCESS;
end
function _w_book_LearnBookEquip()
    local nBookIdx = GetPlayerEquipIndex(ITEMPART_BOOK);
    if nBookIdx ~= 0 then
        for _ = 1, 100 do
            LevelUpBook();
        end
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        WPlayer:Msg("Hoµn thµnh luy÷n mÀt tﬁch ch›nh!");
    end
    local nGreatBookIdx = GetPlayerEquipIndex(ITEMPART_GREAT_BOOK);
    if nGreatBookIdx ~= 0 then
        for _ = 1, 100 do
            LevelUpBook(99);
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
            WPlayer:Msg("Hoµn thµnh luy÷n mÀt tﬁch phÙ!");
        end
    end
    if nBookIdx == 0 and nGreatBookIdx == 0 then
        WNpc:Talk("MÀt tﬁch ch≠a Æ≠Óc trang bﬁ l™n ng≠Íi, kh´ng th” luy÷n nhanh!", WEnv.TRUE);
    end
end

----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-30
--- Description: item m¶nh mËt tÞch cao cÊp ®æi ra mËt tÞch 20%
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>M¶nh BÝ §iÓn<color>: ";

m_tbItemList = {
    [PackItemId(2, 1, 40047)] = { nPercentValue = 25, nUpdatePercentCost = 10, nComposeCost = 100 },
    [PackItemId(2, 1, 40048)] = { nPercentValue = 27, nUpdatePercentCost = 10, nComposeCost = 100 },
    [PackItemId(2, 1, 40049)] = { nPercentValue = 30, nUpdatePercentCost = 10, nComposeCost = 100 },
    [PackItemId(2, 1, 40050)] = { nPercentValue = 32, nUpdatePercentCost = 10, nComposeCost = 100 },
};

function OnUse(nItemIdx)
    local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
    local nPackItemtId = PackItemId(nGenre, nDetail, nParticular);
    if m_tbItemList[nPackItemtId] == WEnv.NULL then
        return WEnv.RETCODE_NOTMATCH;
    end

    local szFragmentName = WItem:GetName(nGenre, nDetail, nParticular);
    local nPercentValue = m_tbItemList[nPackItemtId].nPercentValue;
    local nUpdatePercentCost = m_tbItemList[nPackItemtId].nUpdatePercentCost;
    local nComposeCost = m_tbItemList[nPackItemtId].nComposeCost;

    local tbSay = { format("<npcname>: lµ mét trang cña bÝ ®iÓn bÞ thÊt l¹c, thu thËp ®ñ %d %s cã thÓ ®ãng l¹i thµnh mét <color=white>BÝ §iÓn chØ sè %d<color>.", nComposeCost, szFragmentName, nPercentValue),
        --format("%s/#_apply_update_percent_book(%d)", format("GhÐp %d m¶nh cßn thiÕu vµo bÝ ®iÓn trªn ng­êi", nUpdatePercentCost), nItemIdx),
                    format("%s/#_compose_new_percent_book(%d)", "B¾t ®Çu ghÐp BÝ §iÓn", nItemIdx),
    };

    tinsert(tbSay, "\nT¹m thêi ch­a muèn./nothing");
    WNpc:SayDialog(tbSay);
end

function _compose_new_percent_book(nItemIdx, bConfirm)
    local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
    local nPackItemtId = PackItemId(nGenre, nDetail, nParticular);
    if m_tbItemList[nPackItemtId] == WEnv.NULL then
        return WEnv.RETCODE_NOTMATCH;
    end

    local nRoute = WPlayer:GetRoute();
    if g_tbFactionBook_Secret[nRoute] == WEnv.NULL then
        WNpc:Talk("BÝ ®iÓn l­u ph¸ mµ <sex> ®ang t×m kh«ng hÒ tån t¹i!", WEnv.TRUE);
        return WEnv.RETCODE_NOTMATCH;
    end

    local szFragmentName = WItem:GetName(nGenre, nDetail, nParticular);
    local szBookName = WItem:GetName(ITEM_G_EQUIP, ITEM_D_EQUIP_BOOK, g_tbFactionBook_Secret[nRoute]);
    local nPercentValue = m_tbItemList[nPackItemtId].nPercentValue;
    local nComposeCost = m_tbItemList[nPackItemtId].nComposeCost;
    if WItem:Count(nGenre, nDetail, nParticular) < nComposeCost then
        WPlayer:Talk(format("Hµnh trang kh«ng cã ®ñ <color=red>%d %s<color>, kh«ng thÓ ghÐp thµnh <color=white>%s<color> ®­îc!", nComposeCost, szFragmentName, szBookName));
        return WEnv.RETCODE_CONSUMEERROR;
    end

    bConfirm = tonumber(bConfirm) or 0;
    if bConfirm == 0 then
        WNpc:SayConfirm(format("<sex> x¸c nhËn muèn ghÐp <color=white>%d %s<color> thµnh <color=white>1 %s<color> chØ sè c¬ b¶n <color=white>%d<color> kh«ng?", nComposeCost, szFragmentName, szBookName, nPercentValue), format("_compose_new_percent_book(%d, %d)", nItemIdx, 1));
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if WLib:CheckInv(3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    if WItem:Delete(nGenre, nDetail, nParticular, nComposeCost) ~= WEnv.RETCODE_SUCCESS then
        WPlayer:Talk(format("Hµnh trang kh«ng cã ®ñ <color=red>%d %s<color>, kh«ng thÓ ghÐp thµnh <color=white>%s<color> ®­îc!", nComposeCost, szFragmentName, szBookName));
        return WEnv.RETCODE_CONSUMEERROR;
    end

    local tbBookParam = { tbProp = { ITEM_G_EQUIP, ITEM_D_EQUIP_BOOK, g_tbFactionBook_Secret[nRoute] }, nStack = 1 };
    local nRetAdd, nBookIdx = gf_AddItemEx2({ tbBookParam.tbProp[1], tbBookParam.tbProp[2], tbBookParam.tbProp[3], tbBookParam.nStack }, szBookName, "item_manh_bidien_" .. nPercentValue, "GhÐp bÝ ®iÓn_" .. nPercentValue);
    if nBookIdx ~= 0 then
        local tbBookData = GetBookInfo(nBookIdx);

        --- set l¹i % mËt tÞch
        SetBookInfo(nBookIdx, tbBookData.nSkillLevel, tbBookData.nPageCount, nPercentValue, nPercentValue, nPercentValue, nPercentValue);
        WNpc:Talk(format("Chóc mõng <sex> ®· ghÐp thµnh c«ng <color=white>%s<color> chØ sè c¬ b¶n <color=white>%d<color> thµnh c«ng!", szBookName, nPercentValue), WEnv.TRUE);
    end
end

function _apply_update_percent_book(nItemIdx)
    local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
    local nPackItemtId = PackItemId(nGenre, nDetail, nParticular);
    if m_tbItemList[nPackItemtId] == WEnv.NULL then
        return WEnv.RETCODE_NOTMATCH;
    end

    local nPercentValue = m_tbItemList[nPackItemtId].nPercentValue;
    local nUpdatePercentCost = m_tbItemList[nPackItemtId].nUpdatePercentCost;
    local nBookIdx = GetPlayerEquipIndex(ITEMPART_BOOK);
    local nBookGenre, nBookDetail, nBookParticular = GetItemInfoByIndex(nBookIdx);
    local szBookName = WItem:GetName(nBookGenre, nBookDetail, nBookParticular);

    --- kiÓm tra bÝ ®iÓn ®· mÆc ch­a
    if nBookIdx == 0 then
        WNpc:Talk("CÇn <color=red>trang bÞ mËt tÞch ch­a luyÖn lªn ng­êi<color> míi cã thÓ ghÐp thµnh chØ sè nh­ ý!!", WEnv.TRUE);
        return WEnv.RETCODE_NOTMATCH;
    end
    --- kiÓm tra lo¹i bÝ ®iÓn
    if nBookGenre ~= ITEM_G_EQUIP or nBookDetail ~= ITEM_D_EQUIP_BOOK or (nBookParticular < 30045 or nBookParticular > 30066) then
        WNpc:Talk("MËt tÞch trªn ng­êi <color=red>kh«ng ph¶i lµ bÝ ®iÓn<color>, kh«ng thÓ ghÐp thµnh chØ sè nh­ ý!", WEnv.TRUE);
        return WEnv.RETCODE_NOTMATCH;
    end
    --- kiÓm tra ch­a luyÖn
    local tbBookData = GetBookInfo(nBookIdx);
    if tbBookData.nBookLevel > 1 then
        WNpc:Talk("MËt tÞch trªn ng­êi <color=red>®· ®­îc luyÖn<color> råi, kh«ng thÓ ghÐp thµnh chØ sè nh­ ý!", WEnv.TRUE);
        return WEnv.RETCODE_NOTMATCH;
    end
    --- kiÓm tra mËt tÞch > chØ sè ®ang cÇn up
    if tbBookData.tbBookValue[1] >= nPercentValue or tbBookData.tbBookValue[2] >= nPercentValue or tbBookData.tbBookValue[3] >= nPercentValue or tbBookData.tbBookValue[4] >= nPercentValue then
        WNpc:Talk(format("ChØ sè mËt tÞch trªn ng­êi <color=red>®· ®¹t %d<color> råi, kh«ng thÓ n©ng thªm!", nPercentValue), WEnv.TRUE);
        return WEnv.RETCODE_NOTMATCH;
    end

    --- trõ m¶nh
    if WItem:Delete(nGenre, nDetail, nParticular, nUpdatePercentCost) ~= WEnv.RETCODE_SUCCESS then
        WNpc:Talk(format("Hµnh trang cña <sex> <color=red>kh«ng cã ®ñ %d %s<color>!", nUpdatePercentCost, WItem:GetName(nGenre, nDetail, nParticular)));
        return WEnv.RETCODE_CONSUMEERROR;
    end

    --- set l¹i % mËt tÞch
    SetBookInfo(nBookIdx, tbBookData.nSkillLevel, tbBookData.nPageCount, nPercentValue, nPercentValue, nPercentValue, nPercentValue);
    WNpc:Talk(format("Chóc mõng <sex> ®· n©ng cÊp thµnh c«ng <color=white>%s<color> chØ sè c¬ b¶n <color=white>%d<color>!", szBookName, nPercentValue), WEnv.TRUE);
end

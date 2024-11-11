----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-30
--- Description: item m�nh m�t t�ch cao c�p ��i ra m�t t�ch 20%
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>M�nh B� �i�n<color>: ";

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

    local tbSay = { format("<npcname>: l� m�t trang c�a b� �i�n b� th�t l�c, thu th�p �� %d %s c� th� ��ng l�i th�nh m�t <color=white>B� �i�n ch� s� %d<color>.", nComposeCost, szFragmentName, nPercentValue),
        --format("%s/#_apply_update_percent_book(%d)", format("Gh�p %d m�nh c�n thi�u v�o b� �i�n tr�n ng��i", nUpdatePercentCost), nItemIdx),
                    format("%s/#_compose_new_percent_book(%d)", "B�t ��u gh�p B� �i�n", nItemIdx),
    };

    tinsert(tbSay, "\nT�m th�i ch�a mu�n./nothing");
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
        WNpc:Talk("B� �i�n l�u ph� m� <sex> �ang t�m kh�ng h� t�n t�i!", WEnv.TRUE);
        return WEnv.RETCODE_NOTMATCH;
    end

    local szFragmentName = WItem:GetName(nGenre, nDetail, nParticular);
    local szBookName = WItem:GetName(ITEM_G_EQUIP, ITEM_D_EQUIP_BOOK, g_tbFactionBook_Secret[nRoute]);
    local nPercentValue = m_tbItemList[nPackItemtId].nPercentValue;
    local nComposeCost = m_tbItemList[nPackItemtId].nComposeCost;
    if WItem:Count(nGenre, nDetail, nParticular) < nComposeCost then
        WPlayer:Talk(format("H�nh trang kh�ng c� �� <color=red>%d %s<color>, kh�ng th� gh�p th�nh <color=white>%s<color> ���c!", nComposeCost, szFragmentName, szBookName));
        return WEnv.RETCODE_CONSUMEERROR;
    end

    bConfirm = tonumber(bConfirm) or 0;
    if bConfirm == 0 then
        WNpc:SayConfirm(format("<sex> x�c nh�n mu�n gh�p <color=white>%d %s<color> th�nh <color=white>1 %s<color> ch� s� c� b�n <color=white>%d<color> kh�ng?", nComposeCost, szFragmentName, szBookName, nPercentValue), format("_compose_new_percent_book(%d, %d)", nItemIdx, 1));
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if WLib:CheckInv(3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    if WItem:Delete(nGenre, nDetail, nParticular, nComposeCost) ~= WEnv.RETCODE_SUCCESS then
        WPlayer:Talk(format("H�nh trang kh�ng c� �� <color=red>%d %s<color>, kh�ng th� gh�p th�nh <color=white>%s<color> ���c!", nComposeCost, szFragmentName, szBookName));
        return WEnv.RETCODE_CONSUMEERROR;
    end

    local tbBookParam = { tbProp = { ITEM_G_EQUIP, ITEM_D_EQUIP_BOOK, g_tbFactionBook_Secret[nRoute] }, nStack = 1 };
    local nRetAdd, nBookIdx = gf_AddItemEx2({ tbBookParam.tbProp[1], tbBookParam.tbProp[2], tbBookParam.tbProp[3], tbBookParam.nStack }, szBookName, "item_manh_bidien_" .. nPercentValue, "Gh�p b� �i�n_" .. nPercentValue);
    if nBookIdx ~= 0 then
        local tbBookData = GetBookInfo(nBookIdx);

        --- set l�i % m�t t�ch
        SetBookInfo(nBookIdx, tbBookData.nSkillLevel, tbBookData.nPageCount, nPercentValue, nPercentValue, nPercentValue, nPercentValue);
        WNpc:Talk(format("Ch�c m�ng <sex> �� gh�p th�nh c�ng <color=white>%s<color> ch� s� c� b�n <color=white>%d<color> th�nh c�ng!", szBookName, nPercentValue), WEnv.TRUE);
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

    --- ki�m tra b� �i�n �� m�c ch�a
    if nBookIdx == 0 then
        WNpc:Talk("C�n <color=red>trang b� m�t t�ch ch�a luy�n l�n ng��i<color> m�i c� th� gh�p th�nh ch� s� nh� �!!", WEnv.TRUE);
        return WEnv.RETCODE_NOTMATCH;
    end
    --- ki�m tra lo�i b� �i�n
    if nBookGenre ~= ITEM_G_EQUIP or nBookDetail ~= ITEM_D_EQUIP_BOOK or (nBookParticular < 30045 or nBookParticular > 30066) then
        WNpc:Talk("M�t t�ch tr�n ng��i <color=red>kh�ng ph�i l� b� �i�n<color>, kh�ng th� gh�p th�nh ch� s� nh� �!", WEnv.TRUE);
        return WEnv.RETCODE_NOTMATCH;
    end
    --- ki�m tra ch�a luy�n
    local tbBookData = GetBookInfo(nBookIdx);
    if tbBookData.nBookLevel > 1 then
        WNpc:Talk("M�t t�ch tr�n ng��i <color=red>�� ���c luy�n<color> r�i, kh�ng th� gh�p th�nh ch� s� nh� �!", WEnv.TRUE);
        return WEnv.RETCODE_NOTMATCH;
    end
    --- ki�m tra m�t t�ch > ch� s� �ang c�n up
    if tbBookData.tbBookValue[1] >= nPercentValue or tbBookData.tbBookValue[2] >= nPercentValue or tbBookData.tbBookValue[3] >= nPercentValue or tbBookData.tbBookValue[4] >= nPercentValue then
        WNpc:Talk(format("Ch� s� m�t t�ch tr�n ng��i <color=red>�� ��t %d<color> r�i, kh�ng th� n�ng th�m!", nPercentValue), WEnv.TRUE);
        return WEnv.RETCODE_NOTMATCH;
    end

    --- tr� m�nh
    if WItem:Delete(nGenre, nDetail, nParticular, nUpdatePercentCost) ~= WEnv.RETCODE_SUCCESS then
        WNpc:Talk(format("H�nh trang c�a <sex> <color=red>kh�ng c� �� %d %s<color>!", nUpdatePercentCost, WItem:GetName(nGenre, nDetail, nParticular)));
        return WEnv.RETCODE_CONSUMEERROR;
    end

    --- set l�i % m�t t�ch
    SetBookInfo(nBookIdx, tbBookData.nSkillLevel, tbBookData.nPageCount, nPercentValue, nPercentValue, nPercentValue, nPercentValue);
    WNpc:Talk(format("Ch�c m�ng <sex> �� n�ng c�p th�nh c�ng <color=white>%s<color> ch� s� c� b�n <color=white>%d<color>!", szBookName, nPercentValue), WEnv.TRUE);
end

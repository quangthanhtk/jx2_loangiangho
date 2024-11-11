----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: c�c h�m callback c�a equipshop
--- Include v�o file \\script\\equip_shop\\equip_shop.lua
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
function _w_saveAttr(nOldItemIdx)
    local t = {};
    t.tInfo = GetItemInfoByIndex(nOldItemIdx, 1);
    t.nEquipEnhance = GetEquipAttr(nOldItemIdx, 2);
    t.nEquipDing10 = GetItemSpecialAttr(nOldItemIdx, "DING10");
    t.nEquipDing7 = GetItemSpecialAttr(nOldItemIdx, "DING7");
    t.nBind = 1;
    if GetItemSpecialAttr(nOldItemIdx, "BIND") == 1 then
        t.nBind = 4;
    end
    t.tGem = GetItemGemInfo(nOldItemIdx);
    local tItemInfo = GetItemFeedUpAttrs(nOldItemIdx);
    local tSaveAttr = { -1, -1, -1, -1, -1, -1 };
    if tItemInfo then
        for i, tAttr in tItemInfo.tSocketInfo do
            local nAttrInfoIndex = tAttr.AttrId * 1000 + tAttr.AttrLv;
            tSaveAttr[i] = g_tbSaveAttrMap[nAttrInfoIndex] or -1;
        end
        t.tSaveAttr = tSaveAttr;
    end
    return t;
end
function _w_restoreAttr(tSave)
    local tInfo = tSave.tInfo;
    local ok, nIndex = AddItem(tInfo.genre, tInfo.detail, tInfo.particular, 1, tSave.nBind, -1, -1, -1, -1, -1, -1, 0, tSave.nEquipEnhance, 0, tInfo.randseed);
    if 0 < tSave.nEquipDing10 then
        SetItemSpecialAttr(nIndex, "DING10", 1);
    end
    if 0 < tSave.nEquipDing7 then
        SetItemSpecialAttr(nIndex, "DING7", 1);
    end
    if tSave.tSaveAttr then
        SetItemFeedUpAttrs(nIndex, tSave.tSaveAttr[1], tSave.tSaveAttr[2], tSave.tSaveAttr[3], tSave.tSaveAttr[4], tSave.tSaveAttr[5], tSave.tSaveAttr[6]);
    end
    if tSave.tGem then
        for i, v in tSave.tGem do
            SetItemGemInfo(nIndex, i, v);
        end
    end
end
----------------------------------------------------------------------------------------------------
function _specialop_attrcheck_w_enhance_req12_reduce0(nOldItemIdx)
    local nD = GetItemDetail(nOldItemIdx);
    if nD ~= 102 then
        if _specialop_attrcheck_reduce_enhance12(nOldItemIdx) ~= 1 then
            WNpc:Talk("Trang b� c��ng h�a c�p 12 tr� l�n m�i ���c n�ng c�p.");
            return 0;
        end
    end
    if WLib:CheckInv(5, 100) ~= WEnv.TRUE then
        return 0;
    end
    return 1;
end
function _specialop_attrsave_w_enhance_req12_reduce0(nOldItemIdx)
    return _w_saveAttr(nOldItemIdx);
end
function _specialop_attrrestore_w_enhance_req12_reduce0(nNewItemIdx, tSave)
    if tSave.nEquipEnhance > 0 then
        local tbNewItemInfo = GetItemInfoByIndex(nNewItemIdx, 1);
        if (tbNewItemInfo.genre == GENRE_ITEM_EQUIP
                and (tbNewItemInfo.detail == EQUIP_TYPE_BODY
                or tbNewItemInfo.detail == EQUIP_TYPE_PANTS
                or tbNewItemInfo.detail == EQUIP_TYPE_CAP
                or (tbNewItemInfo.detail >= 0 and tbNewItemInfo.detail <= 14)))
                or g_tbSpecialItemCanEnhance[PackItemId(tbNewItemInfo.genre, tbNewItemInfo.detail, tbNewItemInfo.particular)] ~= WEnv.NULL
        then
            SetItemEnhance(nNewItemIdx, 0);
        end
    end
    return 1;
end
----------------------------------------------------------------------------------------------------
function _specialop_attrcheck_w_enhance_req15_save(nOldItemIdx)
    local nD = GetItemDetail(nOldItemIdx);
    if nD ~= 102 then
        if _specialop_attrcheck_reduce_enhance15(nOldItemIdx) ~= 1 then
            WNpc:Talk("Trang b� c��ng h�a c�p 15 tr� l�n m�i ���c n�ng c�p.");
            return 0;
        end
    end
    if WLib:CheckInv(5, 100) ~= WEnv.TRUE then
        return 0;
    end
    return 1;
end
function _specialop_attrsave_w_enhance_req15_save(nOldItemIdx)
    return _w_saveAttr(nOldItemIdx);
end
function _specialop_attrrestore_w_enhance_req15_save(nNewItemIdx, tSave)
    if tSave.nEquipEnhance > 0 then
        local tbNewItemInfo = GetItemInfoByIndex(nNewItemIdx, 1);
        if (tbNewItemInfo.genre == GENRE_ITEM_EQUIP
                and (tbNewItemInfo.detail == EQUIP_TYPE_BODY
                or tbNewItemInfo.detail == EQUIP_TYPE_PANTS
                or tbNewItemInfo.detail == EQUIP_TYPE_CAP
                or (tbNewItemInfo.detail >= 0 and tbNewItemInfo.detail <= 14)))
                or g_tbSpecialItemCanEnhance[PackItemId(tbNewItemInfo.genre, tbNewItemInfo.detail, tbNewItemInfo.particular)] ~= WEnv.NULL
        then
            SetItemEnhance(nNewItemIdx, tSave.nEquipEnhance);
        end
    end
    return 1;
end
----------------------------------------------------------------------------------------------------
function _specialop_attrcheck_w_enhance_req7_reduce7(nOldItemIdx)
    local nD = GetItemDetail(nOldItemIdx);
    if nD ~= 102 then
        if _specialop_attrcheck_reduce_enhance7(nOldItemIdx) ~= 1 then
            WNpc:Talk("Trang b� c��ng h�a c�p 7 tr� l�n m�i ���c n�ng c�p.");
            return 0;
        end
    end
    if WLib:CheckInv(5, 100) ~= WEnv.TRUE then
        return 0;
    end
    return 1;
end
function _specialop_attrsave_w_enhance_req7_reduce7(nOldItemIdx)
    return _w_saveAttr(nOldItemIdx);
end
function _specialop_attrrestore_w_enhance_req7_reduce7(nNewItemIdx, tSave)
    if tSave.nEquipEnhance > 0 then
        local tbNewItemInfo = GetItemInfoByIndex(nNewItemIdx, 1);
        if (tbNewItemInfo.genre == GENRE_ITEM_EQUIP
                and (tbNewItemInfo.detail == EQUIP_TYPE_BODY
                or tbNewItemInfo.detail == EQUIP_TYPE_PANTS
                or tbNewItemInfo.detail == EQUIP_TYPE_CAP
                or (tbNewItemInfo.detail >= 0 and tbNewItemInfo.detail <= 14)))
                or g_tbSpecialItemCanEnhance[PackItemId(tbNewItemInfo.genre, tbNewItemInfo.detail, tbNewItemInfo.particular)] ~= WEnv.NULL
        then
            SetItemEnhance(nNewItemIdx, 7);
        end
    end
    return 1;
end
----------------------------------------------------------------------------------------------
function _specialop_attrcheck_w_enhance_req10_reduce10(nOldItemIdx)
    local nD = GetItemDetail(nOldItemIdx);
    if nD ~= 102 then
        if _specialop_attrcheck_reduce_enhance10(nOldItemIdx) ~= 1 then
            WNpc:Talk("Trang b� c��ng h�a c�p 10 tr� l�n m�i ���c n�ng c�p.");
            return 0;
        end
    end
    if WLib:CheckInv(5, 100) ~= WEnv.TRUE then
        return 0;
    end
    return 1;
end
function _specialop_attrsave_w_enhance_req10_reduce10(nOldItemIdx)
    return _w_saveAttr(nOldItemIdx);
end
function _specialop_attrrestore_w_enhance_req10_reduce10(nNewItemIdx, tSave)
    if tSave.nEquipEnhance > 0 then
        local tbNewItemInfo = GetItemInfoByIndex(nNewItemIdx, 1);
        if (tbNewItemInfo.genre == GENRE_ITEM_EQUIP
                and (tbNewItemInfo.detail == EQUIP_TYPE_BODY
                or tbNewItemInfo.detail == EQUIP_TYPE_PANTS
                or tbNewItemInfo.detail == EQUIP_TYPE_CAP
                or (tbNewItemInfo.detail >= 0 and tbNewItemInfo.detail <= 14)))
                or g_tbSpecialItemCanEnhance[PackItemId(tbNewItemInfo.genre, tbNewItemInfo.detail, tbNewItemInfo.particular)] ~= WEnv.NULL
        then
            SetItemEnhance(nNewItemIdx, 10);
        end
    end
    return 1;
end
----------------------------------------------------------------------------------------------------
function _specialop_attrsave_w_demo(nOldItemIdx)
    return _w_saveAttr(nOldItemIdx)
end
function _specialop_attrrestore_w_demo(nNewItemIdx, tSave)
    local nRate = 1000; -- Set t� l� n�ng c�p trang b� th�nh c�ng l� 10%
    local szItemName = GetItemName(nNewItemIdx);
    if random(1, 10000) <= nRate then
        local szMsg = format("Ch�c m�ng %s luy�n h�a th�nh c�ng, nh�n ���c %s.", GetName(), szItemName);
        Msg2Global(szMsg);
    else
        DelItemByIndex(nNewItemIdx, -1)-- X�a trang b� ngu�n
        _w_restoreAttr(tSave);
        local szMsg = format("Luy�n h�a %s th�t b�i, vui l�ng th� l�i.", szItemName);
        WNpc:Talk(szMsg, 1);
    end

    return 0;
end
---------------------------------------------------------------------------------------------------
function _specialop_attrrestore_update_uyho_equip(nNewItemIdx, tSave)
    --	local nEnhance = tSave.nEquipEnhance
    --	local nNewEnhance = 0
    --	if nEnhance > 0 then
    --		if nEnhance >= 1 and nEnhance <=13 then
    --			nNewEnhance = 0
    --		elseif nEnhance >= 14 and nEnhance <=15 then
    --			nNewEnhance = 7
    --		end
    --		if nNewEnhance > 0 then
    --			SetItemEnhance(nNewItemIdx, nNewEnhance);
    --		end
    --    end
    local nRate = 1000 --Ĭ��10%����
    local _,nD,_= GetItemInfoByIndex(nNewItemIdx)
    if nD == 102 then --����5%����
        nRate = 1000
    end
    local szItemName = GetItemName(nNewItemIdx)
    if random(1,10000) <= nRate then
        local szMsg = format("Ch�c m�ng %s n�ng c�p th�nh c�ng %s", GetName(), szItemName)
        Msg2Global(szMsg)
    else--ʧ��
        DelItemByIndex(nNewItemIdx, -1)--ɾ��������װ��
        local tInfo = tSave.tInfo
        local ok, nIndex =  AddItem(tInfo.genre, tInfo.detail, tInfo.particular,1,tSave.nBind,-1,-1,-1,-1,-1,-1,
                0 ,tSave.nEquipEnhance, 0, tInfo.randseed)
        if 0 < tSave.nEquipDing10 then
            SetItemSpecialAttr(nIndex, "DING10", 1);
        end
        if 0 < tSave.nEquipDing7 then
            SetItemSpecialAttr(nIndex, "DING7", 1);
        end
        if tSave.tGem then
            for i,v in tSave.tGem do
                SetItemGemInfo(nIndex, i, v)
            end
        end
        AddItem(2,1,31295,1)--��һ����ﾫ��
        local szMsg = format("N�ng c�p %s th�t b�i, nh�n ���c 1 Uy H� Tinh Hoa ��n b�", szItemName)
        Talk(1, "", szMsg)
        Msg2Player(szMsg)
        return 0
    end
    return 1
end
--------------------------------------------------------------
function _specialop_attrcheck_ngocboi(nOldItemIdx)
    if WLib:CheckInv(5, 100) ~= WEnv.TRUE then
        return 0;
    end
    return 1;
end
function _specialop_attrsave_ngocboi(nOldItemIdx)
    return _w_saveAttr(nOldItemIdx);
end
function _specialop_attrrestore_update_uyho_boi(nNewItemIdx, tSave)
    local nRate = 500 --Ĭ��10%����
    local _,nD,_= GetItemInfoByIndex(nNewItemIdx)
    if nD == 102 then --����5%����
        nRate = 500
    end
    local szItemName = GetItemName(nNewItemIdx)
    if random(1,10000) <= nRate then
        local szMsg = format("Ch�c m�ng %s n�ng c�p th�nh c�ng %s", GetName(), szItemName)
        Msg2Global(szMsg)
    else--ʧ��
        DelItemByIndex(nNewItemIdx, -1)--ɾ��������װ��
        local tInfo = tSave.tInfo
        local ok, nIndex =  AddItem(tInfo.genre, tInfo.detail, tInfo.particular,1,tSave.nBind,-1,-1,-1,-1,-1,-1,
                0 ,tSave.nEquipEnhance, 0, tInfo.randseed)
        if 0 < tSave.nEquipDing10 then
            SetItemSpecialAttr(nIndex, "DING10", 1);
        end
        if 0 < tSave.nEquipDing7 then
            SetItemSpecialAttr(nIndex, "DING7", 1);
        end
        if tSave.tGem then
            for i,v in tSave.tGem do
                SetItemGemInfo(nIndex, i, v)
            end
        end
        AddItem(2,1,31295,1)--��һ����ﾫ��
        local szMsg = format("N�ng c�p %s th�t b�i, nh�n ���c 1 Uy H� Tinh Hoa ��n b�", szItemName)
        Talk(1, "", szMsg)
        Msg2Player(szMsg)
        return 0
    end
    return 1
end
----------------------------------------------
function _specialop_attrrestore_update_chutuoc_equip(nNewItemIdx, tSave)
    --	local nEnhance = tSave.nEquipEnhance
    --	local nNewEnhance = 0
    --	if nEnhance > 0 then
    --		if nEnhance >= 1 and nEnhance <=13 then
    --			nNewEnhance = 0
    --		elseif nEnhance >= 14 and nEnhance <=15 then
    --			nNewEnhance = 7
    --		end
    --		if nNewEnhance > 0 then
    --			SetItemEnhance(nNewItemIdx, nNewEnhance);
    --		end
    --    end
    local nRate = 1000 --Ĭ��10%����
    local _,nD,_= GetItemInfoByIndex(nNewItemIdx)
    if nD == 102 then --����5%����
        nRate = 1000
    end
    local szItemName = GetItemName(nNewItemIdx)
    if random(1,10000) <= nRate then
        local szMsg = format("Ch�c m�ng %s n�ng c�p th�nh c�ng %s", GetName(), szItemName)
        Msg2Global(szMsg)
    else--ʧ��
        DelItemByIndex(nNewItemIdx, -1)--ɾ��������װ��
        local tInfo = tSave.tInfo
        local ok, nIndex =  AddItem(tInfo.genre, tInfo.detail, tInfo.particular,1,tSave.nBind,-1,-1,-1,-1,-1,-1,
                0 ,tSave.nEquipEnhance, 0, tInfo.randseed)
        if 0 < tSave.nEquipDing10 then
            SetItemSpecialAttr(nIndex, "DING10", 1);
        end
        if 0 < tSave.nEquipDing7 then
            SetItemSpecialAttr(nIndex, "DING7", 1);
        end
        if tSave.tGem then
            for i,v in tSave.tGem do
                SetItemGemInfo(nIndex, i, v)
            end
        end
        AddItem(2,1,31515,1)--��һ����ﾫ��
        local szMsg = format("N�ng c�p %s th�t b�i, nh�n ���c 1 chu T��c Tinh Hoa ��n b�", szItemName)
        Talk(1, "", szMsg)
        Msg2Player(szMsg)
        return 0
    end
    return 1
end
function _specialop_attrrestore_update_thanung_equip(nNewItemIdx, tSave)
    local nRate = 1000 --Ĭ��10%����
    local _,nD,_= GetItemInfoByIndex(nNewItemIdx)
    if nD == 102 then --����5%����
        nRate = 1000
    end
    local szItemName = GetItemName(nNewItemIdx)
    if random(1,10000) <= nRate then
        local szMsg = format("Ch�c m�ng %s n�ng c�p th�nh c�ng %s", GetName(), szItemName)
        Msg2Global(szMsg)
    else--ʧ��
        DelItemByIndex(nNewItemIdx, -1)--ɾ��������װ��
        local tInfo = tSave.tInfo
        local ok, nIndex =  AddItem(tInfo.genre, tInfo.detail, tInfo.particular,1,tSave.nBind,-1,-1,-1,-1,-1,-1,
                0 ,tSave.nEquipEnhance, 0, tInfo.randseed)
        if 0 < tSave.nEquipDing10 then
            SetItemSpecialAttr(nIndex, "DING10", 1);
        end
        if 0 < tSave.nEquipDing7 then
            SetItemSpecialAttr(nIndex, "DING7", 1);
        end
        if tSave.tGem then
            for i,v in tSave.tGem do
                SetItemGemInfo(nIndex, i, v)
            end
        end
        AddItem(2,1,31676,1)--��һ����ﾫ��
        local szMsg = format("N�ng c�p %s th�t b�i, nh�n ���c 1 Th�n �ng Tinh Hoa ��n b�", szItemName)
        Talk(1, "", szMsg)
        Msg2Player(szMsg)
        return 0
    end
    return 1
end
function _specialop_attrrestore_update_chutuoc_boi(nNewItemIdx, tSave)
    local nRate = 500 --Ĭ��10%����
    local _,nD,_= GetItemInfoByIndex(nNewItemIdx)
    if nD == 102 then --����5%����
        nRate = 500
    end
    local szItemName = GetItemName(nNewItemIdx)
    if random(1,10000) <= nRate then
        local szMsg = format("Ch�c m�ng %s n�ng c�p th�nh c�ng %s", GetName(), szItemName)
        Msg2Global(szMsg)
    else--ʧ��
        DelItemByIndex(nNewItemIdx, -1)--ɾ��������װ��
        local tInfo = tSave.tInfo
        local ok, nIndex =  AddItem(tInfo.genre, tInfo.detail, tInfo.particular,1,tSave.nBind,-1,-1,-1,-1,-1,-1,
                0 ,tSave.nEquipEnhance, 0, tInfo.randseed)
        if 0 < tSave.nEquipDing10 then
            SetItemSpecialAttr(nIndex, "DING10", 1);
        end
        if 0 < tSave.nEquipDing7 then
            SetItemSpecialAttr(nIndex, "DING7", 1);
        end
        if tSave.tGem then
            for i,v in tSave.tGem do
                SetItemGemInfo(nIndex, i, v)
            end
        end
        AddItem(2,1,31515,1)--��һ����ﾫ��
        local szMsg = format("N�ng c�p %s th�t b�i, nh�n ���c 1 chu t��c Tinh Hoa ��n b�", szItemName)
        Talk(1, "", szMsg)
        Msg2Player(szMsg)
        return 0
    end
    return 1
end
function _specialop_attrrestore_update_thanung_boi(nNewItemIdx, tSave)
    local nRate = 500 --Ĭ��10%����
    local _,nD,_= GetItemInfoByIndex(nNewItemIdx)
    if nD == 102 then --����5%����
        nRate = 500
    end
    local szItemName = GetItemName(nNewItemIdx)
    if random(1,10000) <= nRate then
        local szMsg = format("Ch�c m�ng %s n�ng c�p th�nh c�ng %s", GetName(), szItemName)
        Msg2Global(szMsg)
    else--ʧ��
        DelItemByIndex(nNewItemIdx, -1)--ɾ��������װ��
        local tInfo = tSave.tInfo
        local ok, nIndex =  AddItem(tInfo.genre, tInfo.detail, tInfo.particular,1,tSave.nBind,-1,-1,-1,-1,-1,-1,
                0 ,tSave.nEquipEnhance, 0, tInfo.randseed)
        if 0 < tSave.nEquipDing10 then
            SetItemSpecialAttr(nIndex, "DING10", 1);
        end
        if 0 < tSave.nEquipDing7 then
            SetItemSpecialAttr(nIndex, "DING7", 1);
        end
        if tSave.tGem then
            for i,v in tSave.tGem do
                SetItemGemInfo(nIndex, i, v)
            end
        end
        AddItem(2,1,31676,1)--��һ����ﾫ��
        local szMsg = format("N�ng c�p %s th�t b�i, nh�n ���c 1 Th�n �ng Tinh Hoa ��n b�", szItemName)
        Talk(1, "", szMsg)
        Msg2Player(szMsg)
        return 0
    end
    return 1
end
-------------------------------------------------------------------------------------------

function attrrestore_w_enhance_req10_reduce10_rate5(nNewItemIdx, tSave)
    --if tSave.nEquipEnhance > 0 then
    --    local tbNewItemInfo = GetItemInfoByIndex(nNewItemIdx, 1);
    --    if (tbNewItemInfo.genre == GENRE_ITEM_EQUIP
    --            and (tbNewItemInfo.detail == EQUIP_TYPE_BODY
    --            or tbNewItemInfo.detail == EQUIP_TYPE_PANTS
    --            or tbNewItemInfo.detail == EQUIP_TYPE_CAP
    --            or (tbNewItemInfo.detail >= 0 and tbNewItemInfo.detail <= 14)))
    --            or g_tbSpecialItemCanEnhance[PackItemId(tbNewItemInfo.genre, tbNewItemInfo.detail, tbNewItemInfo.particular)] ~= WEnv.NULL
    --    then
    --        SetItemEnhance(nNewItemIdx, 10);
    --    end
    --end
    --return 1;
    --	local nEnhance = tSave.nEquipEnhance
    --	local nNewEnhance = 0
    --	if nEnhance > 0 then
    --		if nEnhance >= 1 and nEnhance <=13 then
    --			nNewEnhance = 0
    --		elseif nEnhance >= 14 and nEnhance <=15 then
    --			nNewEnhance = 7
    --		end
    --		if nNewEnhance > 0 then
    --			SetItemEnhance(nNewItemIdx, nNewEnhance);
    --		end
    --    end
    -----Fix chuy�n th�nh t� l� th�nh c�ng 5% - th�t b�i ho�n tr� 80% nguy�n li�u
    local nRate = 1000 --Ĭ��10%����
    local _,nD,_= GetItemInfoByIndex(nNewItemIdx)
    if nD == 102 then --����5%����
        nRate = 500
    end
    local szItemName = GetItemName(nNewItemIdx)
    if random(1,10000) <= nRate then
        local szMsg = format("Ch�c m�ng %s n�ng c�p th�nh c�ng %s", GetName(), szItemName)
        Msg2Global(szMsg)
    else--ʧ��
        DelItemByIndex(nNewItemIdx, -1)--ɾ��������װ��
        local tInfo = tSave.tInfo
        local ok, nIndex =  AddItem(tInfo.genre, tInfo.detail, tInfo.particular,1,tSave.nBind,-1,-1,-1,-1,-1,-1,
                0 ,tSave.nEquipEnhance, 0, tInfo.randseed)
        if 0 < tSave.nEquipDing10 then
            SetItemSpecialAttr(nIndex, "DING10", 1);
        end
        if 0 < tSave.nEquipDing7 then
            SetItemSpecialAttr(nIndex, "DING7", 1);
        end
        if tSave.tGem then
            for i,v in tSave.tGem do
                SetItemGemInfo(nIndex, i, v)
            end
        end
        local tbAward = {
            { tbProp = { 2, 1, 30370 }, nStack = 80, nStatus = ITEMSTATUS_LOCK }, -- Thi�n M�n Kim L�nh
            { tbProp = { 2, 95, 204 }, nStack = 80, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Cang
            { tbProp = { 2, 1, 31122 }, nStack = 800, nStatus = ITEMSTATUS_LOCK }, -- Linh kh� r�c r�
        };

        WAward:Give(tbAward, "item_test_card");
        --AddItem(2,1,31515,1)--��һ����ﾫ��
        local szMsg = "N�ng c�p th�t b�i, tr� v� trang b� v� 80% Nguy�n Li�u";
        Talk(1, "", szMsg)
        Msg2Player(szMsg)
        return 0
    end
    return 1
end
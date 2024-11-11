Import("\\script\\ksgvn\\lib.lua")
-------------------------------------------------------------------------------------------------

function _specialop_attrcheck_update_sattinh_equip(nOldItemIdx)
    local nD = GetItemDetail(nOldItemIdx)
    if nD ~= 102 then
        if _specialop_attrcheck_reduce_enhance7(nOldItemIdx) ~= 1 then
            -- Trang b� c��ng h�a c�p 7 tr� l�n m�i ���c n�ng c�p
            return 0
        end
    end
    if GetFreeItemRoom() < 2 then
        return 0
    end
    return 1
end

function _specialop_attrsave_update_sattinh_equip(nOldItemIdx)
    return _meoSaveAttr(nOldItemIdx)
end

function _specialop_attrrestore_update_sattinh_equip(nNewItemIdx, tSave)
    local nRate = 1000 -- Set t� l� n�ng c�p trang b� th�nh c�ng l� 10%
    local szItemName = GetItemName(nNewItemIdx)
    if random(1, 10000) <= nRate then
        local szMsg = format("Ch�c m�ng %s luy�n h�a th�nh c�ng, nh�n ���c %s", GetName(), szItemName)
        Msg2Global(szMsg)
    else
        DelItemByIndex(nNewItemIdx, -1)-- X�a trang b� ngu�n
        _meoRestoreAttr(tSave)
        local szMsg = format("Luy�n h�a %s th�t b�i, vui l�ng th� l�i.", szItemName)
        KsgNpc:Talk(szMsg, 1)
    end

    return 0
end

function _meoRestoreAttr(tSave)
    local tInfo = tSave.tInfo
    local ok, nIndex = AddItem(tInfo.genre, tInfo.detail, tInfo.particular, 1, tSave.nBind, -1, -1, -1, -1, -1, -1, 0, tSave.nEquipEnhance, 0, tInfo.randseed)
    if 0 < tSave.nEquipDing10 then
        SetItemSpecialAttr(nIndex, "DING10", 1)
    end
    if 0 < tSave.nEquipDing7 then
        SetItemSpecialAttr(nIndex, "DING7", 1)
    end
    if tSave.tSaveAttr then
        SetItemFeedUpAttrs(nIndex, tSave.tSaveAttr[1], tSave.tSaveAttr[2], tSave.tSaveAttr[3], tSave.tSaveAttr[4], tSave.tSaveAttr[5], tSave.tSaveAttr[6])
    end
    if tSave.tGem then
        for i, v in tSave.tGem do
            SetItemGemInfo(nIndex, i, v)
        end
    end
end

function _meoSaveAttr(nOldItemIdx)
    local t = {}
    t.tInfo = GetItemInfoByIndex(nOldItemIdx, 1)
    t.nEquipEnhance = GetEquipAttr(nOldItemIdx, 2)
    t.nEquipDing10 = GetItemSpecialAttr(nOldItemIdx, "DING10")
    t.nEquipDing7 = GetItemSpecialAttr(nOldItemIdx, "DING7")
    t.nBind = 1
    if GetItemSpecialAttr(nOldItemIdx, "BIND") == 1 then
        t.nBind = 4
    end
    t.tGem = GetItemGemInfo(nOldItemIdx)
    local tItemInfo = GetItemFeedUpAttrs(nOldItemIdx)
    local tSaveAttr = { -1, -1, -1, -1, -1, -1 }
    if tItemInfo then
        for i, tAttr in tItemInfo.tSocketInfo do
            local nAttrInfoIndex = tAttr.AttrId * 1000 + tAttr.AttrLv
            tSaveAttr[i] = g_tbSaveAttrMap[nAttrInfoIndex] or -1
        end
        t.tSaveAttr = tSaveAttr
    end
    return t
end

-------------------------------------------------------------------------------------------------

function _specialop_attrcheck_update_hbvs_equip(nOldItemIdx)
    local nD = GetItemDetail(nOldItemIdx)
    if nD ~= 102 then
        if _specialop_attrcheck_reduce_enhance10(nOldItemIdx) ~= 1 then
            -- Trang b� c��ng h�a c�p 10 tr� l�n m�i ���c n�ng c�p
            return 0
        end
    end
    if GetFreeItemRoom() < 2 then
        return 0
    end
    return 1
end

function _specialop_attrrestore_update_vip_equip(nNewItemIdx, tSave)
    SetItemEnhance(nNewItemIdx, 0);
end

function _specialop_attrcheck_update_hanvu_equip(nOldItemIdx)
    local nD = GetItemDetail(nOldItemIdx)
    if nD ~= 102 then
        if _specialop_attrcheck_reduce_enhance7(nOldItemIdx) ~= 1 then
            -- Trang b� c��ng h�a c�p 7 tr� l�n m�i ���c n�ng c�p
            return 0
        end
    end
    if GetFreeItemRoom() < 2 then
        return 0
    end
    return 1
end

function _specialop_attrsave_update_hanvu_equip(nOldItemIdx)
    return _meoSaveAttr(nOldItemIdx)
end

function _specialop_attrrestore_update_hanvu_equip(nNewItemIdx, tSave)
    local nRate = 1000 -- Set t� l� n�ng c�p trang b� th�nh c�ng l� 10%
    local _, nD, _ = GetItemInfoByIndex(nNewItemIdx)
    if nD == 102 then
        -- Set t� l� th�nh c�ng trang s�c l� 5%
        nRate = 500
    end
    local szItemName = GetItemName(nNewItemIdx)
    if random(1, 10000) <= nRate then
        local szMsg = format("Ch�c m�ng %s n�ng c�p th�nh c�ng, nh�n ���c %s", GetName(), szItemName)
        Msg2Global(szMsg)
    else
        DelItemByIndex(nNewItemIdx, -1)-- X�a trang b� ngu�n
        AddItem(2, 196, 1, 1, 4)-- Ho�n tr� tinh ph�ch n�u th�t b�i
        _meoRestoreAttr(tSave)
        local szMsg = format("N�ng c�p %s th�t b�i, vui l�ng th� l�i. Nh�n ���c 1 H�n V� Tinh Ph�ch ho�n tr�.", szItemName)
        KsgNpc:Talk(szMsg, 1)
    end

    return 0
end

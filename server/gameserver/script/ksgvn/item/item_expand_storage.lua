Import("\\script\\ksgvn\\lib.lua")

_g_tbExpandCondition = { -- R��ng th� x => S� l�nh b�i c�n 
    [6] = 1,
    [7] = 3,
    [8] = 10,
    [9] = 20,
    [10] = 50,
}

MAX_STORAGE_BOXES = 10

function OnUse(nItemIdx)
    local nCurrentStoreBox = GetStoreBoxPageCount()
    local nNextStoreBox = nCurrentStoreBox + 1

    if not _CanExpandStorage(nNextStoreBox) then
        return
    end

    local nNeedCount = _g_tbExpandCondition[nNextStoreBox]

    local tSay = {
        format("M� r�ng r��ng ch�a �� <color=gold>th� %d<color> c�n t�n <color=red>%d L�nh B�i M� R�ng R��ng<color> ��i hi�p x�c ��nh s� d�ng kh�ng?", nNextStoreBox, nNeedCount),
        format("X�c ��nh/#_DoExpand(%d)", nNextStoreBox),
        "\n�� ta suy ngh� l�i m�t l�t/no",
    }
    KsgNpc:SayDialog(tSay)
end

function _CanExpandStorage(nExpandTo)
    local nCurrentStoreBox = GetStoreBoxPageCount()
    if nCurrentStoreBox < 5 then
        KsgNpc:Talk("��i hi�p c�n m� r�ng ��n r��ng ch�a th� 5 m�i c� th� s� d�ng l�nh b�i n�y.")
        return nil
    end

    if nCurrentStoreBox == MAX_STORAGE_BOXES then
        KsgNpc:Talk("R��ng ch�a �� c�a ��i hi�p �� ��t t�i �a, kh�ng th� ti�p t�c m� r�ng th�m n�a.")
        return nil
    end
    if not _g_tbExpandCondition[nExpandTo] then
        KsgNpc:Talk("R��ng ch�a n�y t�m th�i ch�a ���c h� tr�. Xin h�y th� l�i sau!")
        return nil
    end
    return 1
end

function _DoExpand(nExpandTo)
    if not _CanExpandStorage(nExpandTo) then
        return
    end

    local nNeedCount = _g_tbExpandCondition[nExpandTo]

    local tbCondition = {
        tbItems = {
            { tbProp = { 2, 1, 50257 }, nCount = nNeedCount }
        },
    }
    if KsgLib:PayMaterial(tbCondition) then
        if GetStoreBoxPageCount() < MAX_STORAGE_BOXES then
            SetStoreBoxPageCount(nExpandTo)
        end
        KsgNpc:Talk(format("M� r�ng r��ng th�nh c�ng, ��i hi�p �� c� th� s� d�ng r��ng ch�a �� <color=gold>th� %d<color> �� c�t gi� v�t ph�m.", nExpandTo))
    end
end
Import("\\script\\ksgvn\\lib.lua")

_g_tbItemPack = {
    [PackItemId(2, 1, 50255)] = {
        tbGive = { 1, 0, 32 },
        nStack = 100,
        nNeedBag = 1,
        nNeedWeight = 0,
    }
}

function OnUse(nItemIndex)
    local g,d,p = GetItemInfoByIndex(nItemIndex)
    local id = PackItemId(g,d,p)
    if not _g_tbItemPack[id] then
        return KsgNpc:Talk("V�t ph�m kh�ng t�n t�i")
    end
    local tbItemCfg = _g_tbItemPack[id]
    local bBind = GetItemSpecialAttr(nItemIndex, "BIND")
    local tSay = {
        format("D�ng <color=gold>%s<color> c� th� m� ra <color=green>%d %s<color>, ��i hi�p c� mu�n d�ng kh�ng?", KsgItem:GetName(nItemIndex), tbItemCfg.nStack, KsgItem:GetName(tbItemCfg.tbGive)),
        format("M�/#_ConfirmUse(%d, %d)", nItemIndex, bBind),
        "\n�� ta suy ngh� l�i m�t ch�t/no"
    }
    KsgNpc:SayDialog(tSay)
end

function _ConfirmUse(nItemIndex, bBind)
    local g,d,p = GetItemInfoByIndex(nItemIndex)
    local id = PackItemId(g,d,p)
    if not _g_tbItemPack[id] then
        return KsgNpc:Talk("V�t ph�m kh�ng t�n t�i")
    end
    local tbItemCfg = _g_tbItemPack[id]
    local nStatus = 5
    if bBind == 1 then
        nStatus = 4
    end
    if not KsgLib:HasEnoughBagRoom(tbItemCfg.nNeedBag, tbItemCfg.nNeedWeight) then
        return
    end
    if KsgItem:DeleteByIndex(nItemIndex) ~= 1 then
        return KsgNpc:Talk(format("Kh�ng th� m� %s. H�nh trang kh�ng c� v�t ph�m n�y.", KsgItem:GetName(nItemIndex)))
    end
    KsgAward:Give({
        tbProp = tbItemCfg.tbGive,
        nStatus = nStatus,
        nStack = tbItemCfg.nStack
    }, "OpenItemPack_" .. id)
end

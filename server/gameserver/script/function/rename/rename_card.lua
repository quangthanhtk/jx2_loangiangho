-- rename_card
Import("\\script\\function\\rename\\rename_npc.lua")

function OnUse(nItemIdx)
    _rename_card_AskUse(nItemIdx)
end

function _rename_card_AskUse(nItemIdx, bSure)
    if RENAME_SWITCH ~= 1 then
        return KsgNpc:Talk("T�nh n�ng n�y t�m ch�a m�!")
    end
    if CheckSpecialFlag(RENAME_SPECIAL_FLAG_USE_RENAMECARD) == 1 then
        return KsgNpc:Talk("C�c h� �� s� d�ng <color=gold>Th� ��i t�n<color> r�i, c�n ��i t�n tr��c m�i c� th� d�ng l�i!")
    end
    if not bSure then
        local tbSay = {
            "Sau khi s� d�ng <color=gold>Th� ��i t�n<color> nh�n ���c <color=red>1 l�n c� h�i<color> ��i t�n Nh�n v�t ho�c t�n Bang h�i, ng��i c� ��ng � s� d�ng kh�ng?<enter><color=green>(Sau khi s� d�ng s� ���c truy�n t�ng ��n ch� H� B� Th� Lang)<color>",
            format("��ng v�y/#_rename_card_AskUse(%d, 1)", nItemIdx),
            "Tho�t/nothing",
        }
        return KsgNpc:SayDialog(tbSay)
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        SetSpecialFlag(RENAME_SPECIAL_FLAG_USE_RENAMECARD, 0)
        WriteLog(format("[RENAME] [Use RenameCard] [Acc:%s, Role:%s]", GetAccount(), GetName()))
        NewWorld(200, 1469, 2752)
    end
    -- N�n add v�o stat �� th�ng k� t�i ��y
end


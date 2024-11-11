Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\function\\rename\\rename_head.lua")

g_szNpcName = "<color=green>H� B� Th� Lang<color>: "

function main()
    local tSay = {
        g_szNpcName .. "Ta ��y qu�n l� vi�c ��i s�, ng��i ��n l� mu�n ��i t�n <color=yellow>nh�n v�t v� bang h�i<color> sao? \nChi ti�t xem t�i trang ch�."
    }
    if RENAME_SWITCH == 1 then
        for nType, szTypeName in _g_tbTypeNames do
            tinsert(tSay, format("��i t�n %s/#request_rename(%d)", szTypeName, nType))
        end
    end
    tinsert(tSay, "\nTa ch� ti�n gh� qua/no")

    KsgNpc:SayDialog(tSay)
end

function request_rename(nType)
    if RENAME_SWITCH ~= 1 then
        return KsgNpc:Talk(g_szNpcName .. "T�nh n�ng n�y hi�n ch�a m�!")
    end
    if CheckSpecialFlag(RENAME_SPECIAL_FLAG_USE_RENAMECARD) ~= 1 then
        return KsgNpc:Talk(g_szNpcName .. "Nh� ng��i �� s� d�ng <color=gold>Th� ��i t�n<color> ch�a? ��ng ��a v�i b�n quan!")
    end
    if _g_tbSwitches[nType] and _g_tbSwitches[nType] ~= 1 then
        return KsgNpc:Talk(g_szNpcName .. "T�nh n�ng n�y hi�n ch�a m�!")
    end
    if nType == RENAME_TYPE_PLAYER then
        request_rename_player()
    elseif nType == RENAME_TYPE_TONG then
        request_rename_tong()
    else
        return KsgNpc:Talk(g_szNpcName .. "T�nh n�ng n�y hi�n ch�a m�!")
    end
end

function request_rename_player()
    local isTongMember = IsTongMember() or 0
    local szTong = GetTongName() or ""
    if szTong ~= "" or isTongMember > 0 then
        return KsgNpc:Talk(g_szNpcName .. "Ng��i �� c� bang h�i! C�n r�i kh�i bang tr��c m�i c� th� ��i t�n!")
    end

    RenameQuerySubmitedName(GetName(), RENAME_TYPE_PLAYER)
end

function request_rename_tong()
    if IsTongMaster() ~= 1 then
        return KsgNpc:Talk(g_szNpcName .. "Ch� c� bang ch� m�i c� quy�n ��i t�n Bang H�i!")
    end
    RenameQuerySubmitedName(GetTongName(), RENAME_TYPE_TONG)
end

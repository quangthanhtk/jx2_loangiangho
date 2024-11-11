-- Rename Callback
Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\function\\rename\\rename_head.lua")

g_szInfoHeader = "<color=green>H� B� Th� Lang<color>: "

function RenameQuerySubmitedNameCallBack(nResult, szOldName, szNewName, nType)
    if nResult == 0 and nType == RENAME_TYPE_TONG then
        KsgNpc:Talk(g_szInfoHeader .. "Ch�a c� bang h�i ho�c bang h�i ch�a th�nh l�p, kh�ng th� ��i t�n!")
        return 0
    end
    local tSay = {}
    if _g_tbTypeNames[nType] then
        --��i t�n bang h�i
        if IsTongMaster() ~= 1 and nType == RENAME_TYPE_TONG then
            -- Bang ch� m�i ���c ��i
            KsgNpc:Talk(g_szInfoHeader .. "Ch� c� bang ch� m�i c� quy�n xin ��i t�n Bang h�i!")
            return 0
        end
        local szTypeName = _g_tbTypeNames[nType]
        --��i t�n nh�n v�t
        if szNewName == "" then
            tSay = {
                format(g_szInfoHeader .. "T�n %s m�i <color=red>y�u c�u ph�i c� %d-%d k� t� v� kh�ng ch�a k� t� ��c bi�t<color>. Ng��i x�c ��nh ��i t�n %s ch�?", szTypeName, RENAME_MIN_LENGTH, RENAME_MAX_LENGTH, szTypeName),
                format("Ta quy�t ��nh ��i t�n %s. H�y gi�p ta!/#request_rename(%d)", szTypeName, nType),
                "\nTa mu�n suy ngh� l�i m�t l�t/no",
            }
            KsgNpc:SayDialog(tSay)
        else
            tSay = {
                g_szInfoHeader .. format("Ng��i �� ch�n ��i t�n %s th�nh <color=yellow>%s<color>, c� mu�n thay ��i hay h�y b� kh�ng?", szTypeName, szNewName),
                format("Ta mu�n ��i l�i t�n %s/#request_rename(%d)", szTypeName, nType),
                format("H�y ��i t�n %s/#cancel_rename(%d)", szTypeName, nType),
                "\nTho�t/no",
            }
            KsgNpc:SayDialog(tSay)

        end
    else
        WriteLog("[RENAME] [��i t�n g�p l�i]: RenameQuerySubmitedNameCallBack tham s� nType : " .. tostring(nType))
    end
end

function RenameSumbitCallBack(nResult, szOldName, szNewName, nType)
    if nResult <= 0 then
        KsgNpc:Talk(g_szInfoHeader .. "T�n ��i hi�p ch�n �� c� ho�c kh�ng ��ng quy t�c, vui l�ng th� l�i!")
        return 0
    end
    local nTime = tonumber(date("%Y%m%d%H%M%S"))
    if szNewName == "" then
        Say(g_szInfoHeader .. "��i hi�p �� h�y b� thao t�c ��i t�n th�nh c�ng!", 0)
        WriteLog(format("[RENAME] H�y b� thao t�c ��i t�n, Th�i gian: %d, T�i kho�n: %s, Nh�n v�t: %s", nTime, GetAccount(), GetName()))
        return 0
    end
    if _g_tbTypeNames[nType] then
        local szType = _g_tbTypeNames[nType]
        Say(g_szInfoHeader .. format("��i hi�p �� y�u c�u ��i t�n %s th�nh <color=yellow>%s<color> th�nh c�ng!<enter>V�o b�o tr� ��nh k� h�ng ng�y t�n m�i c�a ��i hi�p s� ���c c�p nh�t, trong th�i gian ch� ��i ��i hi�p c� th� ch�n 1 t�n kh�c ho�c h�y thao t�c n�y!<enter><color=red>(N�u sau b�o tr� m� t�n m�i c�a ��i hi�p kh�ng ���c c�p nh�t, r�t c� th� t�n ��i hi�p ch�n �� b� chi�m d�ng, c�n thao t�c l�i t� ��u.)<color>", szType, szNewName), 0)
        local szCurrentName = GetName()
        if nType == RENAME_TYPE_TONG then
            szCurrentName = GetTongName()
        end
        WriteLog(format("[RENAME] Y�u c�u ��i t�n %s, Th�i gian: %d, T�i kho�n: %s, Nh�n v�t: %s, T�n hi�n t�i: %s, T�n m�i: %s", szType, nTime, GetAccount(), GetName(), szCurrentName, szNewName))
    else
        WriteLog("[RENAME] [��i t�n th�t b�i]: RenameSumbitCallBack tr� s� nType l� " .. tostring(nType))
    end
end

function request_rename(nType)
    if nType == RENAME_TYPE_PLAYER then
        AskClientForString("submit_name_p", "", RENAME_MIN_LENGTH, RENAME_MAX_LENGTH, "Nh�p v�o t�n Nh�n v�t")
    elseif nType == RENAME_TYPE_TONG then
        AskClientForString("submit_name_t", "", RENAME_MIN_LENGTH, RENAME_MAX_LENGTH, "Nh�p v�o t�n Bang H�i")
    end
end

function submit_name_p(szNewName)
    RenameSubmit(szNewName, RENAME_TYPE_PLAYER)
end

function submit_name_t(szNewName)
    RenameSubmit(szNewName, RENAME_TYPE_TONG)
end

function cancel_rename(nType)
    RenameSubmit("", nType)
end

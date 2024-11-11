Import("\\script\\ksgvn\\lib.lua")
Include('\\script\\ksgvn\\event\\nganphieu\\nganphieu_head.lua')

g_szNpcName = g_szNpcName or "<color=yellow>Ch� Ti�n Trang: <color>"

function nganPhieu_ExchangeMenu()
    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� ch�a gia nh�p m�n ph�i n�n kh�ng th� tham gia ho�t ��ng n�y.")
    end
    local tSay = {
        g_szNpcName .. "C�c h� �� mang h�ng ��n r�i sao? C� b�o v�t g� h�y mau ��a ta xem! N�u ���c ta s� tr� cho c�c h� Ng�n Phi�u t��ng x�ng!",
    }
    for nIndex, tbExchangeCfg in _g_tbExchangeList do
        if tbExchangeCfg.nNeedNum > 1 then
            tinsert(tSay, format("Ta c� %d %s (gi� thu mua %d Ng�n Phi�u)/#_nganPhieu_ExchangeShowInput(%d)", tbExchangeCfg.nNeedNum, tbExchangeCfg.szName, tbExchangeCfg.nTicket, nIndex))
        else
            tinsert(tSay, format("Ta c� %s (gi� thu mua %d Ng�n Phi�u)/#_nganPhieu_ExchangeShowInput(%d)", tbExchangeCfg.szName, tbExchangeCfg.nTicket, nIndex))
        end
    end
    tinsert(tSay, "\nTa kh�ng mu�n ��i v�i �ng/no")
    KsgNpc:SayDialog(tSay)
end

function _nganPhieu_ExchangeShowInput(nIndex)
    if not _g_tbExchangeList[nIndex] then
        return KsgNpc:FormalTalk(g_szNpcName, "d��ng nh� kh�ng mang theo th� ta c�n, hay l� khi kh�c l�i t�i!")
    end
    local tbExchangeCfg = _g_tbExchangeList[nIndex]
    local nHaveItemCount = KsgItem:Count(tbExchangeCfg.tbProp)
    if nHaveItemCount < tbExchangeCfg.nNeedNum then
        return KsgNpc:FormalTalk(g_szNpcName, format("th�t c� mang theo <color=yellow>%d %s<color> t�i �? Ta kh�ng nh�n nh�m ch�?", tbExchangeCfg.nNeedNum, tbExchangeCfg.szName))
    else
        g_tbCurrentExchange[GetName()] = nIndex
        AskClientForNumber("_nganPhieu_DoExchange", 0, floor(nHaveItemCount / tbExchangeCfg.nNeedNum), "Nh�p s� l��ng ��i")
    end

end

function _nganPhieu_DoExchange(nCount, nIndex)
    if nCount > 0 then
        if nIndex then
            local nExchangeIndex = g_tbCurrentExchange[GetName()]
            if not _g_tbExchangeList[nExchangeIndex] then
                return KsgNpc:FormalTalk(g_szNpcName, "d��ng nh� kh�ng mang theo th� ta c�n, hay l� khi kh�c l�i t�i!")
            end
            local nLeftCapacity = _nganPhieu_GetNganPhieuLeftCapacity()
            local tbExchangeCfg = _g_tbExchangeList[nExchangeIndex]
            local nGainTicket = nCount * tbExchangeCfg.nTicket
            if nGainTicket > nLeftCapacity then
                return KsgNpc:FormalTalk(g_szNpcName, "�� mang theo qu� nhi�u ng�n phi�u tr�n ng��i, xin h�y d�ng b�t �i!<enter><color=gray>L�u �: T�i �a ch� c� th� mang theo<color><color=gold>%d Ng�n Phi�u<color>")
            end
            if KsgItem:Delete(tbExchangeCfg.tbProp, nCount * tbExchangeCfg.nNeedNum) then
                KsgTask:Modify(TASKID_EVENT_NGANPHIEU_POINT, nCount * tbExchangeCfg.nTicket)
            end
            return
        end
        local nExchangeIndex = g_tbCurrentExchange[GetName()]
        if not _g_tbExchangeList[nExchangeIndex] then
            return KsgNpc:FormalTalk(g_szNpcName, "d��ng nh� kh�ng mang theo th� ta c�n, hay l� khi kh�c l�i t�i!")
        end
        local tbExchangeCfg = _g_tbExchangeList[nExchangeIndex]
        local tSay = {
            g_szNpcName .. format("Ng��i x�c nh�n mu�n <color=yellow>��i %d %s l�y %d Ng�n Phi�u<color>?", nCount * tbExchangeCfg.nNeedNum, tbExchangeCfg.szName, tbExchangeCfg.nTicket * nCount),
            format("��ng v�y/#_nganPhieu_DoExchange(%d, %d)", nCount, nExchangeIndex),
            "Suy ngh� l�i m�t ch�t/no",
        }

        KsgNpc:SayDialog(tSay)
    end
end

function _nganPhieu_GetNganPhieu()
    return KsgTask:Get(TASKID_EVENT_NGANPHIEU_POINT)
end

function _nganPhieu_GetNganPhieuLeftCapacity()
    return MAX_NGAN_PHIEU - KsgTask:Get(TASKID_EVENT_NGANPHIEU_POINT)
end
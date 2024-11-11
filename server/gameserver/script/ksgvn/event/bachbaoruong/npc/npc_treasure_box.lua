Import("\\script\\ksgvn\\lib.lua")
Import('\\script\\ksgvn\\event\\bachbaoruong\\bachbaoruong.lua')

function main()
    local nToday = KsgDate:Today()
    if nToday > EVENT_BACHBAORUONG_END_DATE then
        return KsgNpc:Talk(g_szNpcName .. "S� ki�n B�ch B�o R��ng �� k�t th�c! Kh�ng th� m� b�o r��ng.")
    end
    local nNpcIndex = GetTargetNpc()
    local szNpcName = GetNpcName(nNpcIndex)

    if szNpcName == "B�ch B�o R��ng" then
        if GetPKFlag() == 0 or GetFightState() == 0 then
            return KsgNpc:Talk(g_szNpcName .. "PK � d�ng luy�n c�ng, kh�ng th� ti�n h�nh m� b�o r��ng.")
        end
    end

    if KsgPlayer:IsDeath() then
        return KsgNpc:Talk(g_szNpcName .. "Tr�ng th�i hi�n t�i kh�ng th� m� b�o r��ng.")
    end

    local nCurOpenedBox = KsgTask:GetPosValue(TASKID_EVENT_BACHBAORUONG, 1, 4)
    if nCurOpenedBox >= MAX_OPEN_BOX_COUNT then
        return KsgNpc:FormalTalk(g_szNpcName, format("�� m� r��ng %d l�n r�i, kh�ng th� m� th�m n�a.", MAX_OPEN_BOX_COUNT))
    end

    local tbSay = { g_szNpcName .. format("H�y ch�n c�c c�ch sau �� m� r��ng:<enter>Hi�n t�i c�c h� �� m� <color=gold>%d/%d<color> b�o r��ng", nCurOpenedBox, MAX_OPEN_BOX_COUNT), }
    for nIndex, tbExchangeCfg in _g_tbExchangeBox do
        tinsert(tbSay, tbExchangeCfg.szDesc .. "/#_bachbaoruong_OpenBox(" .. nIndex .. ")")
    end
    tinsert(tbSay, "\nK�t th�c ��i tho�i/no")
    KsgNpc:SayDialog(tbSay)
end

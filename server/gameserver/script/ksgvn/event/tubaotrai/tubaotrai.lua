Import("\\script\\ksgvn\\lib.lua")
Include('\\script\\ksgvn\\event\\tubaotrai\\tubaotrai_head.lua')

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

function tubaotrai_GiveHuyenThach(tEvent, data, para)
    if GetFreeItemRoom() < 1 then
        return 0
    end
    KsgAward:Give(g_tbTuBaoTrai_TaskAward)
end

function tubaotrai_OnNpcTalk()
    if KsgTask:Get(TASKID_TUBAOTRAI_VERSION) ~= EVENT_TUBAOTRAI_VERSION then
        KsgTask:Set(TASKID_TUBAOTRAI_VERSION, EVENT_TUBAOTRAI_VERSION, TASK_ACCESS_CODE_TUBAOTRAI)
        KsgTask:Set(TASKID_TUBAOTRAI_AWARD, 0, TASK_ACCESS_CODE_TUBAOTRAI)
        KsgTask:Set(TASKID_TUBAOTRAI_LOTTERY_NUM, 0, TASK_ACCESS_CODE_TUBAOTRAI)
    end
    local szTitle = g_szTuBaoNpcName .. "G�n ��y c�c Ch� Th��ng H�i nh�n ���c l�i m�i c�a m�t ng��i th�n b� ��n Tuy�n Ch�u, kh�ng l�u sau trong giang h� c� tin ��n: Ch� Th��ng H�i � kh�p n�i �� l�p m�t t� ch�c c� t�n 'T� B�o Trai', ��ng th�i thu th�p m�t l��ng l�n v�t ph�m trong V�n Ki�m Tr�ng, ��a Huy�n Cung v� L��ng S�n c� t�n l� 'Huy�n Th�ch', ti�c l� b�n t�nh c�a th��ng nh�n c�ng keo ki�t, c�c ��i hi�p nh�n ���c v�t ph�m g� trong T� B�o Trai th� ph�i xem c� duy�n c�a m�nh.";
    local tSay = {"Ho�t ��ng n�y ch�a m� ."}; -- m� th� x�a b� d�ng n�y m� d�ng d��i l�n
    local tSay = {
        szTitle,
        format("M� T� B�o Trai (K� %d)/tubaotrai_Open", EVENT_TUBAOTRAI_VERSION),
        "Nh�n th��ng t�ch l�y T� B�o Trai/tubaotrai_GetAccumulateAward",
        --"Nh�n Huy�n Th�ch (ch� danh ph�n ��i Hi�p)/tubaotrai_VIPGiftHuyenThach",
        "\nTa ch� ��n xem th�i/no"
    }
    KsgNpc:SayDialog(tSay)
end

function tubaotrai_Open()
    SendScript2Client("Open[[JbzBox]]")
end

function tubaotrai_VIPGiftHuyenThach()
    if KsgTask:GetBit(TASKID_TUBAOTRAI_AWARD, TASKID_TUBAOTRAI_BIT_VIP_GIFT) == 1 then
        return KsgNpc:Talk(g_szTuBaoNpcName .. "M�i k� T� B�o Trai ch� c� th� nh�n Huy�n Th�ch 1 l�n")
    end
    if not KsgPlayer:IsVipAccount() then
        return KsgNpc:Talk(g_szTuBaoNpcName .. "Ch� ng��i ch�i c� danh ph�n ��i Hi�p m�i c� th� nh�n Huy�n Th�ch mi�n ph�.")
    end
    if not KsgLib:HasEnoughBagRoom(1, 10, g_szTuBaoNpcName) then
        return
    end
    KsgTask:SetBit(TASKID_TUBAOTRAI_AWARD, TASKID_TUBAOTRAI_BIT_VIP_GIFT, 1, TASK_ACCESS_CODE_TUBAOTRAI)
    KsgAward:Give(g_tbTuBaoTrai_VIPGift, "Danh ph�n ��i Hi�p nh�n Huy�n Th�ch")
end

function tubaotrai_GetAccumulateAward(nIndex)
    local nSpinNum = KsgTask:Get(TASKID_TUBAOTRAI_LOTTERY_NUM)
    local szSpinNum = format("<enter>(S� l�n r�t th��ng may m�n c�a ��i hi�p hi�n t�i l� <color=green>%d<color> l�n)", nSpinNum)
    if nIndex then
        local nStatus = KsgTask:GetBit(TASKID_TUBAOTRAI_AWARD, 2 + nIndex)
        if not g_tbTuBaoTrai_AccumulateAward[nIndex] then
            return KsgNpc:FormalTalk(g_szTuBaoNpcName, "h�nh nh� ch�n sai r�i, ph�n th��ng n�y hi�n kh�ng c� � ch� ta")
        end
        local tbAccumulate = g_tbTuBaoTrai_AccumulateAward[nIndex]
        if nSpinNum < tbAccumulate.nRequireNum then
            return KsgNpc:FormalTalk(g_szTuBaoNpcName, format("ch�a ��t �� %d l�n t�ch l�y r�t th��ng, kh�ng th� nh�n ph�n th��ng m�c n�y %s", tbAccumulate.nRequireNum, szSpinNum))
        end
        if nStatus == 1 then
            return KsgNpc:FormalTalk(g_szTuBaoNpcName, "�� nh�n ph�n th��ng n�y r�i.")
        end
        if not KsgLib:HasEnoughBagRoom(3, 10, g_szTuBaoNpcName) then
            return
        end
        KsgTask:SetBit(TASKID_TUBAOTRAI_AWARD, 2 + nIndex, 1, TASK_ACCESS_CODE_TUBAOTRAI)
        KsgAward:Give(tbAccumulate.tbAward, "Nh�n th��ng m�c T� B�o Trai " .. nIndex)
        if tbAccumulate.nRequireNum == EVENT_TUBAOTRAI_MAX_LOTTERY_NUM then
            KsgTask:Set(TASKID_TUBAOTRAI_AWARD, 0, TASK_ACCESS_CODE_TUBAOTRAI)
            KsgTask:Set(TASKID_TUBAOTRAI_LOTTERY_NUM, 0, TASK_ACCESS_CODE_TUBAOTRAI)
            KsgPlayer:Msg("S� l�n r�t th��ng T� B�o Trai �� ���c ��t l�i. ��i hi�p c� th� ti�p t�c t�ch l�y r�t th��ng.")
        end
    end
    local szTitle = g_szTuBaoNpcName .. "R�t th��ng may m�n ��t s� l�n nh�t ��nh th� ��i hi�p s� nh�n ���c ph�n th��ng th�m"
    local tbStatus = { "Ch�a nh�n", "�� nh�n" }
    local tSay = {
        szTitle .. szSpinNum
    }
    for nAwardIndex, tbAccumulate in g_tbTuBaoTrai_AccumulateAward do
        local nStatus = KsgTask:GetBit(TASKID_TUBAOTRAI_AWARD, 2 + nAwardIndex) + 1
        local szStatus = tbStatus[nStatus]
        tinsert(tSay, format("T�ch l�y r�t th��ng %d l�n nh�n ���c %s (%s)/#tubaotrai_GetAccumulateAward(%d)", tbAccumulate.nRequireNum, tbAccumulate.szName, szStatus, nAwardIndex))
    end
    tinsert(tSay, "\nTa ch� xem qua th�i/no")
    KsgNpc:SayDialog(tSay)
end

function tubaotrai_GetAwardInfo(nUseNum)
    for nIndex, tbAccumulate in g_tbTuBaoTrai_AccumulateAward do
        if nUseNum >= tbAccumulate.nRequireNum then
            return nIndex, tbAccumulate
        end
    end
    return 0, nil
end
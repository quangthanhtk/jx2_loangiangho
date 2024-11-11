Import("\\script\\ksgvn\\lib.lua")

FAIR_LV_MAX = 3 --VN:�����ȼ�����
FAIR_LV_ROUND = 3 --VN:����������Ҫ�����������޵��״�
FAIR_STAR_NUM = 10 --VN:ÿ���ж��ٿ�����
FAIR_STAR_LV_MAX = (FAIR_STAR_NUM * FAIR_LV_ROUND * FAIR_LV_MAX) --VN:�������ǵȼ�����
g_tFairBaseNeedLingpo = { -- ���ǵ����Ļ�׼
    2, 4, 6--10,20,30
}
g_tFairBaseNeedHuixian = { -- ���ɵ����Ļ�׼
    5, 10, 15
}
TASKID_FAIR_UP_FLAG = 3511
TASKID_FAIR_VALUE = 3510

function fair_Recall(nConfirm)
    local nTotalHoiTienDan, nTotalLinhPhachDan, nTotalTuiQua = fair_GetRecallCount()
    if nTotalHoiTienDan == 0 then
        return KsgNpc:Talk("C�c h� ch�a h�a c�nh, kh�ng th� nh�n ��n b�.")
    end
    if not KsgLib:HasEnoughBagRoom(7) then
        return
    end
    local nFairLv = GetTask(TASKID_FAIR_VALUE)
    if not nConfirm then
        local tSay = {
            format("��i hi�p �� h�a c�nh %d m�ch, nh�n ���c <color=gold>%d H�i Ti�n ��n<color> v� <color=gold>%d Linh Ph�ch ��n<color> ��n b�, ��i hi�p mu�n nh�n ngay kh�ng?", nFairLv, nTotalHoiTienDan, nTotalLinhPhachDan),
            format("Ta mu�n nh�n /#fair_Recall(1)"),
            "\nT�m ch�a mu�n nh�n/no"
        }
        return KsgNpc:SayDialog(tSay)
    end
    SetTask(TASKID_FAIR_VALUE, 0)
    SetTask(TASKID_FAIR_UP_FLAG, 0)
    KsgAward:Give({
        { tbProp = { 2, 1, 31239 }, nStack = nTotalLinhPhachDan, nStatus = 4 },
        { tbProp = { 2, 1, 30847 }, nStack = nTotalHoiTienDan, nStatus = 4 },
        { tbProp = { 2, 1, 50016 }, nStack = nTotalTuiQua, nStatus = 4 },
    }, "��n b� ��ng H�a C�nh")
    KsgNpc:Talk(format("Nh�n ��n b� th�nh c�ng, thu l�i ���c <color=gold>%d H�i Ti�n ��n<color> v� <color=gold>%d Linh Ph�ch ��n<color>."))
end

function fair_GetRecallCount()
    if GetTask(TASKID_FAIR_UP_FLAG) == 0 then
        return 0, 0, 0
    end
    local nTotalLinhPhachDan = 0
    local nTotalHoiTienDan = 0
    local nTotalTuiQua = 0

    local nFairLv = GetTask(TASKID_FAIR_VALUE)
    local nMaxFairLv = FAIR_LV_MAX * 30
    for i = 1, nMaxFairLv do
        if nFairLv >= i then
            local nFair = floor(i / (FAIR_LV_ROUND * FAIR_STAR_NUM))
            local nRound = mod(floor(i / FAIR_STAR_NUM), FAIR_LV_ROUND) + 1
            local nNeedLingpo = g_tFairBaseNeedLingpo[nRound] + nFair
            local nNeedHuixian = g_tFairBaseNeedHuixian[nRound] + nFair
            nTotalHoiTienDan = nTotalHoiTienDan + nNeedHuixian
            nTotalLinhPhachDan = nTotalLinhPhachDan + nNeedLingpo
            nTotalTuiQua = nTotalTuiQua + 10
        end
    end
    return nTotalHoiTienDan, nTotalLinhPhachDan, nTotalTuiQua
end
Import("\\script\\ksgvn\\lib.lua")

FAIR_LV_MAX = 3 --VN:化境等级上限
FAIR_LV_ROUND = 3 --VN:升级化境需要激活所有星宿的伦次
FAIR_STAR_NUM = 10 --VN:每轮有多少颗星星
FAIR_STAR_LV_MAX = (FAIR_STAR_NUM * FAIR_LV_ROUND * FAIR_LV_MAX) --VN:化境星星等级上限
g_tFairBaseNeedLingpo = { -- 灵魄丹消耗基准
    2, 4, 6--10,20,30
}
g_tFairBaseNeedHuixian = { -- 回仙丹消耗基准
    5, 10, 15
}
TASKID_FAIR_UP_FLAG = 3511
TASKID_FAIR_VALUE = 3510

function fair_Recall(nConfirm)
    local nTotalHoiTienDan, nTotalLinhPhachDan, nTotalTuiQua = fair_GetRecallCount()
    if nTotalHoiTienDan == 0 then
        return KsgNpc:Talk("C竎 h� ch璦 h鉧 c秐h, kh玭g th� nh薾 n b�.")
    end
    if not KsgLib:HasEnoughBagRoom(7) then
        return
    end
    local nFairLv = GetTask(TASKID_FAIR_VALUE)
    if not nConfirm then
        local tSay = {
            format("Чi hi謕  h鉧 c秐h %d m筩h, nh薾 頲 <color=gold>%d H錳 Ti猲 Кn<color> v� <color=gold>%d Linh Ph竎h Кn<color> n b�, i hi謕 mu鑞 nh薾 ngay kh玭g?", nFairLv, nTotalHoiTienDan, nTotalLinhPhachDan),
            format("Ta mu鑞 nh薾 /#fair_Recall(1)"),
            "\nT筸 ch璦 mu鑞 nh薾/no"
        }
        return KsgNpc:SayDialog(tSay)
    end
    SetTask(TASKID_FAIR_VALUE, 0)
    SetTask(TASKID_FAIR_UP_FLAG, 0)
    KsgAward:Give({
        { tbProp = { 2, 1, 31239 }, nStack = nTotalLinhPhachDan, nStatus = 4 },
        { tbProp = { 2, 1, 30847 }, nStack = nTotalHoiTienDan, nStatus = 4 },
        { tbProp = { 2, 1, 50016 }, nStack = nTotalTuiQua, nStatus = 4 },
    }, "бn b� ng H鉧 C秐h")
    KsgNpc:Talk(format("Nh薾 n b� th祅h c玭g, thu l筰 頲 <color=gold>%d H錳 Ti猲 Кn<color> v� <color=gold>%d Linh Ph竎h Кn<color>."))
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
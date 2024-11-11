Import("\\script\\ksgvn\\lib.lua")
g_szNpcName = "<color=green>Cao Nh�n � �n<color>: "

function main()
    local tSay = {
        g_szNpcName .. _cn_CurrentIntimatePointMsg(),
        --"Ta mu�n t�ng l�o ch�t qu�/_cn_NotOpenYet",
        --"Ti�m n�i c�ng giang h�/_cn_NotOpenYet",
        format("Ti�m Y�u Quy�t th�t truy�n/#KsgLib:OpenEquipShop(%d)", EQUIP_SHOP_YEUQUYET_CAOCAP),
        --format("Ti�m C� ph�/#KsgLib:OpenEquipShop(%d)", EQUIP_SHOP_EXCHANGE_COPHO), --LongDaiKa: ��ng t�nh n�ng c� ph�
        --"H�c th� n�i c�ng giang h�/_cn_NotOpenYet",
        --"Luy�n l�i n�i c�ng giang h�/_cn_NotOpenYet",
        --"Th�ng c�p nhanh n�i c�ng tuy�t th�/_cn_NotOpenYet",
        "\nTa ch� ti�n ���ng gh� qua/no"
    }

    KsgNpc:SayDialog(tSay)
end

function _cn_NotOpenYet()
    return KsgNpc:Talk(format("L�o phu �ang b�n, xin %s khi kh�c h�y quay l�i...", KsgPlayer:GetSexName()))
end

function _cn_GetCurrentIntimatePoint()
    return KsgTask:Get(TASKID_INTIMATE_POINT)
end

function _cn_CurrentIntimatePointMsg()
    local nCurPoint = _cn_GetCurrentIntimatePoint()
    local szHaoCam = "Ng��i l� ai ? T� ��u ��n? <enter>H�o c�m hi�n t�i: <color=yellow>V� v�<color>"
    local szSexName = KsgPlayer:GetSexName()
    if nCurPoint > 500 then
        szHaoCam = format("V� %s n�y, sao l�i ��n ��y n�a r�i <enter>H�o c�m hi�n t�i: <color=yellow>C� ch�t �n t��ng<color>", szSexName())
    end
    if nCurPoint > 2000 then
        szHaoCam = format("A... %s l�i t�i th�m l�o gi� n�y sao, c� g� xin h�y ch� gi�o.<enter>H�o c�m hi�n t�i: <color=yellow>Qu�<color>", szSexName())
    end
    if nCurPoint > 3000 then
        szHaoCam = format("Hahaha... g�p l�i %s th�t l� m�ng, h�m nay c�c h� th� n�o? L�o gi� ta m�t m�nh tr�n C�n L�n S�n n�y th�t l� bu�n ch�n....<enter>H�o c�m hi�n t�i: <color=yellow>Th�ch<color>", szSexName())
    end
    if nCurPoint > 5000 then
        szHaoCam = format("%s %s �� t�i r�i sao, giang h� ng�y c�ng hi�m �c, xin h�y c�n tr�ng gi� m�nh! Ta r�t lo l�ng cho %s<enter>H�o c�m hi�n t�i: <color=yellow>B�ng H�u<color>", KsgPlayer:GetName(), szSexName(), szSexName())
    end
    if nCurPoint >= 8000 then
        szHaoCam = format("%s %s l�i ��n th�m ta �? Qu� l� h�o b�ng h�u, ha ha....! Giang h� ng�y c�ng hi�m �c, xin h�y c�n tr�ng gi� m�nh! <enter>H�o c�m hi�n t�i: <color=yellow>Ch� H�u<color>", KsgPlayer:GetName(), szSexName())
    end
    return szHaoCam
end

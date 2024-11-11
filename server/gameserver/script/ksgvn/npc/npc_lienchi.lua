Import("\\script\\ksgvn\\lib.lua")
Import("\\script\\ksgvn\\event\\newplayer\\newplayer.lua")
Import('\\script\\ksgvn\\event\\monthly\\monthly.lua')

g_szNpcName = "<color=green>Li�n Chi<color>: "

_g_tbCompensationList = {
}

_g_tbCompensationBug5Doc = {
}

function main()
    --if KsgLib:IsTestServer() then
    --    return KsgNpc:Talk("C�c h� ��n ��y c� vi�c g� kh�ng?")
    --end
    local tMenuOptions = {
        "��i hi�p t�m ta c� vi�c g� kh�ng?",
        format("S� ki�n %s/monthlyEvent_OnNpcTalk", g_monthlyEvent_Name),
    }
    --if KsgTask:GetBit(TASKID_GIFT_CODE, TASK_GIFTCODE_BIT_NEWPLAYER) ~= 1 then
    --    tinsert(tMenuOptions, "Ta ��n nh�n th��ng Ng�a H� T�ng Long/newplayer_ActiveGiftCode")
    --end
    --if KsgDate:Today() <= EVENT_SPEND_COIN_END_DATE and KsgDate:Today() >= EVENT_SPEND_COIN_START_DATE then
    --    tinsert(tMenuOptions, format("Ta ��n nh�n th��ng Ti�u Ph�/#KsgLib:OpenEquipShop(%d)", EQUIP_SHOP_AWARD_SPEND_MONEY))
    --end
    --if KsgLib:IsInTable(KsgPlayer:GetName(), _g_tbCompensationList) and KsgTask:GetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_HONOR_19_07) ~= 1 and KsgDate:Today() <= 20200722 then
    --    tinsert(tMenuOptions, "Ta ��n nh�n ��n b� Hi�p L� ng�y 19-07/_lienChi_DenBuHiepLo")
    --end
    --if KsgLib:IsInTable(KsgPlayer:GetName(), _g_tbCompensationBug5Doc) and KsgTask:GetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_BUG_5DOC) ~= 1 and KsgDate:Today() <= 20200729 then
    --    tinsert(tMenuOptions, "Nh�n ��n b�/_lienChi_DenBuBug5Doc")
    --end
    tinsert(tMenuOptions, "\nTa ch� ti�n gh� qua/no")
    KsgNpc:SayDialog(tMenuOptions)
end

function _lienChi_DenBuHiepLo()
    if not KsgLib:IsInTable(KsgPlayer:GetName(), _g_tbCompensationList) then
        return KsgNpc:Talk("C�c h� kh�ng c� trong danh s�ch nh�n ��n b�")
    end
    if KsgTask:GetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_HONOR_19_07) == 1 then
        return KsgNpc:Talk("C�c h� �� nh�n ph�n qu� ��n b� n�y r�i!")
    end
    KsgAward:Give({ nHonor = 50000 }, "��n b� Hi�p L� 19-07")
    KsgTask:SetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_HONOR_19_07, 1)
    KsgNpc:Talk("Th�nh c�ng, nh�n ���c qu� ��n b� <color=gold>50.000<color> �i�m c�ng tr�ng.")
end

function _lienChi_DenBuBug5Doc()
    if not KsgLib:IsInTable(KsgPlayer:GetName(), _g_tbCompensationBug5Doc) then
        return KsgNpc:Talk("C�c h� kh�ng c� trong danh s�ch nh�n ��n b�")
    end
    if KsgTask:GetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_BUG_5DOC) == 1 then
        return KsgNpc:Talk("C�c h� �� nh�n ph�n qu� ��n b� n�y r�i!")
    end
    KsgAward:Give({ nHonor = 500e3, nExp = 10e9 }, "��n b� s� c� bug ng� ��c")
    KsgTask:SetBit(TASKID_COMPENSATION, TASKID_COMPENSATION_BIT_BUG_5DOC, 1)
end


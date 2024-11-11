Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\event\\newplayer\\newplayer_head.lua")

function newplayer_ActiveGiftCode()
    if not KsgPlayer:IsJoinedRoute() then
        return KsgNpc:FormalTalk(g_szNpcName, "ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng")
    end
    if KsgTask:GetBit(TASKID_GIFT_CODE, TASK_GIFTCODE_BIT_NEWPLAYER) == 1 then
        return KsgNpc:FormalTalk(g_szNpcName, "�� nh�n ph�n th��ng Giftcode n�y r�i. Th�ng tin chi ti�t ho�t ��ng ��ng ��o c� th� xem t�i trang ch�.")
    end
    if GetExtPoint(EXTPOINT_GIFTCODE_NEWPLAYER) < 1 then
        return KsgNpc:FormalTalk(g_szNpcName, "ch�a c� k�ch ho�t Giftcode. Th�ng tin chi ti�t ho�t ��ng ��ng ��o c� th� xem t�i trang ch�.")
    end
    if not KsgLib:HasEnoughBagRoom(15, 500) then
        return
    end
    if PayExtPoint(EXTPOINT_GIFTCODE_NEWPLAYER, 1) == 1 then
        KsgAward:Give(_g_tbAward_Giftcode_NewPlayer)
        KsgTask:SetBit(TASKID_GIFT_CODE, TASK_GIFTCODE_BIT_NEWPLAYER, 1)
        return KsgNpc:FormalTalk(g_szNpcName, "k�ch ho�t th�nh c�ng Giftcode Ng�a H� T�ng Long, nh�n ���c ph�n th��ng phong ph�! Xin h�y ki�m tra trong t�i h�nh trang!")
    end
end

function newplayer_GetDailyGift()
    if KsgTask:GetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_DAILY_GIFT) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� �� nh�n ph�n th��ng h�m nay r�i, kh�ng th� nh�n l�i!")
    end
    if not KsgLib:HasEnoughBagRoom(15) then
        return
    end
    local tbAward = g_tbNewPlayerGift_Daily
    if KsgPlayer:IsVipAccount() then
        tbAward = g_tbNewPlayerGift_Daily_VIP
    end
    KsgAward:Give(tbAward)
    KsgTask:SetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_DAILY_GIFT, 1)
    KsgNpc:Talk("Nh�n ph�n th��ng h�ng ng�y th�nh c�ng!")
end

function newplayer_GetWeeklyGift()
    local wDay = tonumber(date("%w"))
    if wDay ~= 6 and wDay ~= 0 then
        return KsgNpc:Talk(g_szNpcName .. "Ph�n th��ng n�y ch� c� th� nh�n v�o cu�i tu�n. Xin h�y quay l�i sau.")
    end

    if KsgTask:GetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_WEEKLY_GIFT) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� �� nh�n ph�n th��ng tu�n n�y r�i, kh�ng th� nh�n l�i!!")
    end

    if not KsgLib:HasEnoughBagRoom(2) then
        return
    end

    local tbAward = g_tbNewPlayerGift_Weekly
    if KsgPlayer:IsVipAccount() then
        tbAward = g_tbNewPlayerGift_Weekly_VIP
    end

    KsgAward:Give(tbAward)
    KsgTask:SetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_WEEKLY_GIFT, 1)
    KsgNpc:Talk("Nh�n ph�n th��ng h�ng tu�n th�nh c�ng!")
end

-- Nhan thuong thang cap cs 8, 9, 10
function newplayer_ShowSupportRebornAward()
    local nStartDate = KsgLib:GetSrvCfg('tbTimeTop').nStartDate
    local nEndDate = KsgLib:GetSrvCfg('tbTimeTop').nEndDate
    local tSay = {
        g_szNpcName .. "Ho�t ��ng <color=yellow>�ua Top Nh�n Th��ng<color> di�n ra t� ng�y<color=gold> " .. KsgDate:ToString(nStartDate) .. " ��n 24:00 " .. KsgDate:ToString(nEndDate) .. "<color>. Trong th�i gian n�y, qu� ��ng ��o c� th� ��n g�p ta �� nh�n c�c ph�n th��ng h�p d�n. Th�ng tin chi ti�t ho�t ��ng ��ng ��o c� th� xem t�i trang ch�."
    }
    if not KsgLib:IsInDualTopTime() then
        tSay = {
            g_szNpcName .. "C�c h� mu�n nh�n h� tr� n�o?"
        }
    end
    for nIndex, tbLevelCfg in g_tbNewPlayer_AwardSupportReborn do
        if KsgTask:GetBit(TASKID_NEWPLAYER_AWARD_REBORN, nIndex) ~= 1 then
            if tbLevelCfg.nAwardLevel > 1090 then
                tinsert(tSay, format("Nh�n ph�n th��ng ��t %s/#newplayer_GetSupportRebornAward(%d)", KsgLib:Level2String(tbLevelCfg.nAwardLevel), nIndex))
            else
                tinsert(tSay, format("Nh�n qu� tr�c ti�p th�ng ti�n ��n %s/#newplayer_GetSupportRebornAward(%d)", KsgLib:Level2String(tbLevelCfg.nAwardLevel), nIndex))
            end

        end
    end
    if getn(tSay) == 1 then
        return KsgNpc:FormalTalk(g_szNpcName, "d��ng nh� �� nh�n h�t ph�n th��ng l�n n�y, khi kh�c l�i t�i nh�!")
    end
    tinsert(tSay, "\nT�m th�i ch�a mu�n nh�n/no")
    KsgNpc:SayDialog(tSay)
end

function newplayer_GetSupportRebornAward(nIndex)
    if KsgTask:GetBit(TASKID_NEWPLAYER_AWARD_REBORN, nIndex) == 1 then
        return KsgNpc:Talk(g_szNpcName .. "C�c h� �� nh�n ph�n th��ng n�y r�i!")
    end

    if not g_tbNewPlayer_AwardSupportReborn[nIndex] then
        return KsgNpc:Talk(g_szNpcName .. "Ph�n th��ng n�y kh�ng t�n t�i!")
    end
    local tbRebornAwardCfg = g_tbNewPlayer_AwardSupportReborn[nIndex]
    local tbAward = tbRebornAwardCfg.tbAward
    local tbAwardBonus = {}
    if KsgPlayer:GetBigLevel() >= tbRebornAwardCfg.nAwardLevel then
        if type(tbRebornAwardCfg.tbAwardBonus) == "table" then
            tbAwardBonus = tbRebornAwardCfg.tbAwardBonus
        end
    end

    if not KsgLib:HasEnoughBagRoom(25, 1000) then
        return
    end

    if KsgLib:PayMaterial(tbRebornAwardCfg.tbCondition) then
        KsgAward:Give(tbAward, "RebornAward_" .. nIndex)
        if KsgLib:TableLength(tbAwardBonus) > 0 then
            KsgAward:Give(tbAwardBonus, "RebornAwardBonus_" .. nIndex)
        end
        KsgTask:SetBit(TASKID_NEWPLAYER_AWARD_REBORN, nIndex, 1)
    end
end

function newplayer_HasRebornAward()
    for nIndex, _ in g_tbNewPlayer_AwardSupportReborn do
        if KsgTask:GetBit(TASKID_NEWPLAYER_AWARD_REBORN, nIndex) ~= 1 then
            return 1
        end
    end
    return nil
end
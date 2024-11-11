-- Lib Core
Import("\\script\\ksgvn\\lib.lua")
Import("\\script\\ksgvn\\functions\\gm.lua")

-- Events
Import("\\script\\ksgvn\\event\\newplayer\\newplayer.lua")

-- Others
Import("\\script\\function\\vip_card\\vc_head.lua")
Import("\\script\\function\\cdkey\\ck_head.lua")

----------------------------------------------------------------------------------------------------
--- Nh�n qu� c�p
Import("\\script\\warlord\\items\\item_newbie_card.lua");
----------------------------------------------------------------------------------------------------

g_szTitle = "<color=green>T�n Th� L�nh: <color>"

_g_tbAccountNeedFix = {

}

DENBU_END_DATE = 20201205
DENBU_TASK_ID = TASKID_COMPENSATION_BIT_TL0412

MERGE_SERVER_AWARD_DATE = 20210305
MERGE_SERVER_TASK_BIT = TASKID_COMPENSATION_BIT_MERGE_SERVER4
MERGE_SERVER_ID = 7

_g_tbBattleHonor = {
    [1] = {
        szName = "Kh�ng d�ng Qu�n C�ng Ch��ng",
        tbCondition = {
            nBigLevel = 891,
        },
        tbAward = {
            { nHonor = 2500 },
            { tbProp = { 2, 1, 50016 }, nStack = 15 },
        }
    },
    [2] = {
        szName = "D�ng Qu�n C�ng Ch��ng",
        tbCondition = {
            nBigLevel = 891,
            tbItems = {
                { tbProp = { 2, 1, 9999 }, nCount = 1 }
            }
        },
        tbAward = {
            { nHonor = 5000, },
            { tbProp = { 2, 1, 50016 }, nStack = 15 * 2 },
        }
    },
    [3] = {
        szName = "D�ng Qu�n C�ng Ch��ng (��i)",
        tbCondition = {
            nBigLevel = 891,
            tbItems = {
                { tbProp = { 2, 1, 9998 }, nCount = 1 }
            }
        },
        tbAward = {
            { nHonor = 12500 },
            { tbProp = { 2, 1, 50016 }, nStack = 15 * 5 },
        }
    },
    [4] = {
        szName = "D�ng Qu�n C�ng Ch��ng Huy Ho�ng",
        tbCondition = {
            nBigLevel = 891,
            tbItems = {
                { tbProp = { 2, 1, 9977 }, nCount = 1 }
            }
        },
        tbAward = {
            { nHonor = 25000 },
            { tbProp = { 2, 1, 50016 }, nStack = 15 * 10 },
        }
    },
    [5] = {
        szName = "D�ng Qu�n C�ng Ch��ng Vinh D�",
        tbCondition = {
            nBigLevel = 891,
            tbItems = {
                { tbProp = { 2, 1, 30642 }, nCount = 1 }
            },
        },
        tbAward = {
            { nHonor = 35000 },
            { tbProp = { 2, 1, 50016 }, nStack = 15 * 14 },
        }
    },
}

function OnUse_bk(nItemIndex)
    local nRemainTime = GetVipCardRemainTime()
    local szAccState = format("B�n l� <color=yellow>��i Hi�p V� L�m (C�n %d ng�y)<color>", ceil(nRemainTime / (24 * 3600)))
    if (nRemainTime <= 0) then
        szAccState = "Hi�n b�n <color=red>ch�a k�ch ho�t danh ph�n ��i Hi�p V� L�m<color>"
    end
    local szHead = g_szTitle .. format("Ch�o m�ng ��n v�i V� L�m Online. <color=yellow>S� ng�y m� m�y ch�: %d ng�y. <color>%s, h�y ch�n ch�c n�ng h� tr� d��i ��y:", KsgDate:CurrentRunningDay(), szAccState)
    local tSay = {
        szHead
    }
    local nRoute = KsgPlayer:GetRoute()
    if nRoute == 0 then
        tinsert(tSay, "Ta mu�n gia nh�p m�n ph�i v� h�c k� n�ng/kgm_ChangeRoute")
    else
        if vc_IsVipCardOpen() ~= 0 then
            tinsert(tSay, 2, vc_GetMainTitle())
        end
        -- TODO Add stub here
        if KsgTask:GetBit(TASKID_GIFT_CODE, TASK_GIFTCODE_BIT_NEWPLAYER) ~= 1 and GetExtPoint(EXTPOINT_GIFTCODE_NEWPLAYER) >= 1 then
            tinsert(tSay, "Nh�n th��ng Giftcode Ng�a H� T�ng Long/newplayer_ActiveGiftCode")
        end
        if WPlayer:IsVipAccount() == WEnv.TRUE then --LongDaiKa: ch� cho nh�n v�t k�ch ho�t th� m�i �c nh�n
            if KsgTask:GetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_DAILY_GIFT) ~= 1 then
                tinsert(tSay, "Nh�n ph�n th��ng ng�y/newplayer_GetDailyGift")
            end
            local wDay = tonumber(date("%w"))
            if wDay == 6 or wDay == 0 then
                if KsgTask:GetByte(TASKID_KSG_NEWPLAYER, TASKID_KSG_NEWPLAYER_BYTE_WEEKLY_GIFT) ~= 1 then
                    tinsert(tSay, "Nh�n ph�n th��ng tu�n/newplayer_GetWeeklyGift")
                end
            end
        end
        local nToday = KsgDate:Today()
        if nToday <= DENBU_END_DATE and KsgTask:GetBit(TASKID_COMPENSATION, DENBU_TASK_ID) ~= 1 then
            tinsert(tSay, "Nh�n ��n b� T�ng Li�u ng�y 04-12/_denbu_BaoTri")
        end

        if nToday <= MERGE_SERVER_AWARD_DATE and KsgTask:GetBit(TASKID_COMPENSATION, MERGE_SERVER_TASK_BIT) ~= 1 and KsgLib:GetServerId() == MERGE_SERVER_ID then
            tinsert(tSay, "Nh�n qu� g�p m�y ch�/_denbu_GopServer")
        end

        --if newplayer_HasRebornAward() then
        --    tinsert(tSay, "Nh�n th��ng c�p v� h� tr� l�n chuy�n sinh 8, 9, 10/newplayer_ShowSupportRebornAward")
        --end

        tinsert(tSay, "Nh�n qu� th�ng c�p/#WNewbieAward:OpenAwardList()");
        tinsert(tSay, "Ki�m tra tin nh�n h� tr� t�i kho�n/#WWebService:CheckCode()");
        tinsert(tSay, "\nNh�p GIFTCODE nh�n qu� (m� vi�t li�n kh�ng d�u v� kh�ng bao g�m s� 0)\n /#WGiftCode:ActiveCode()");

        tinsert(tSay, "K�ch ho�t linh ph�ch V� kh�/weaponEffect_Show")
        tinsert(tSay, "Luy�n h�a Linh Ph�ch ��n/Exp2Item")
        --tinsert(tSay, "Ho�t ��ng Code/handle_npc_talk_huodongdashi") --LongDaiKa: ��ng t�nh n�ng code n�ng ��ng
    end

    if not factionSupport_IsTodayReceived() then
        if ROUTE_THIEULAM_TRUONG == nRoute then
            tinsert(tSay, "Nh�n Thi�n Ph�t Ch�u v� Ph� Ma Ch� (h�m nay ch�a nh�n)/factionSupport_TLT")
        end
        if ROUTE_DUONGMON_AMKHI == nRoute then
            tinsert(tSay, "Nh�n �m Kh� v� C� Quan (h�m nay ch�a nh�n)/factionSupport_DuongMon")
        end
        if ROUTE_NGAMI_KIEM == nRoute then
            tinsert(tSay, "Nh�n X� L�i Kim ��n (h�m nay ch�a nh�n)/factionSupport_NgaMiKiem")
        end
        if ROUTE_DUONGGIA_THUONG == nRoute then
            tinsert(tSay, "Nh�n Chi�n M�/factionSupport_DGT")
        end
        if ROUTE_DUONGGIA_CUNG == nRoute then
            tinsert(tSay, "Nh�n Chi�n M� v� T� Ti�n (h�m nay ch�a nh�n)/factionSupport_DGC")
        end
        if ROUTE_NGUDOC_HIEP == nRoute then
            tinsert(tSay, "Nh�n Phong Thi Ph� (h�m nay ch�a nh�n)/factionSupport_HiepDoc")
        end
        if ROUTE_NGUDOC_TA == nRoute then
            tinsert(tSay, "Nh�n C� (h�m nay ch�a nh�n)/factionSupport_TaDoc")
        end
        if ROUTE_THUYYEN_LINHNU == nRoute then
            tinsert(tSay, "H� tr� nu�i Ti�u �i�u (h�m nay ch�a nh�n)/factionSupport_ThuyYenLinhNu")
        end
        if ROUTE_CONLON_KIEMTON == nRoute then
            tinsert(tSay, "Nh�n Linh Ki�m v� L� Luy�n Ki�m/factionSupport_CLKT")
        end
    end

    tinsert(tSay, "\nK�t th�c ��i tho�i/no")
    KsgNpc:SayDialog(tSay)
end

--- H�m copy t�i file \script\function\exp2item\jinke_npc.lua
function Exp2Item()
    local tbSay = { "Sau khi ��i hi�p ��t 10 chuy�n 80 c�p, mu�n n�ng c�o n�ng l�c c�a b�n th�n ti�p th� c�n ��n l�c l��ng l�n h�n.\n"..
                            "Nh�ng m� trong ��n �i�n c�a c�c h� ch� c� th� d� tr� n�ng l��ng c� h�n. N�u chuy�n h�a n�ng l��ng t�ch l�y h�ng ng�y luy�n th�nh ��n d��c, v� s� d�ng khi ��t ph� gi�i h�n b�n th�n m�nh th� l� c�ch kh�c ph�c t�t nh�t. Luy�n h�a m�t <color=red>Linh Ph�ch ��n<color> c�n <color=red>10 t�<color> kinh nghi�m. <sex> mu�n luy�n h�a kh�ng?" };
    tinsert(tbSay,"��ng/Exp2ItemConfirm");
    tinsert(tbSay,"Sai/nothing");
    WNpc:SayDialog(tbSay);
end
function Exp2ItemConfirm()
    if IsPlayerDeath() ~= 0 then
        Talk(1, "", "Tr�ng th�i hi�n t�i kh�ng th� nh�n th��ng!!!")
        return
    end
    --local m,_,_ = GetWorldPos()
    --if m ~= 6300 then
    --    return
    --end
    if CanModifyLargeExp(-10000000000) ~= 1 then
        Talk(1,"",format("Kinh nghi�m c�a ��i hi�p kh�ng ��, m�i �i l�ch luy�n th�m l�i ��n ��y."))
        return
    end
    if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
        Talk(1,"",format("H�nh trang c�a b�n kh�ng �� ch�."))
        return
    end
    if GetCash() < 1000000 then
        Talk(1,"",format("Luy�n ��n c�n 100 v�ng, m�i b�n chu�n b� �� v�ng tr�n ng��i."))
        return
    end
    if GetTask(3472) < 6 then
        Talk(1,"",format("Luy�n ��n c�n 6 �i�m t�ch c�c bang h�i c� nh�n."))
        return
    end
    for i = 1,5 do
        if ModifyExp(-2000000000) == 0 then
            return
        end
    end
    SetTask(3472,GetTask(3472)-6)
    Pay(1000000)

    gf_AddItemEx({2,1,31239,1}, "Linh Ph�ch ��n");
    FireEvent("event_gain_item", 2, 1, 31239, 1)
end

function _denbu_BaoTri(nType)
    if not nType then
        local tSay = {
            g_szTitle .. "H�y ch�n h�nh th�c nh�n ��n b�:",
        }
        for nIndex, tbCfg in _g_tbBattleHonor do
            tinsert(tSay, format("Nh�n ��n b� - %s/#_denbu_BaoTri(%d)", tbCfg.szName, nIndex))
        end
        tinsert(tSay, "\nT�m ch�a mu�n nh�n/no")
        return KsgNpc:SayDialog(tSay)
    end
    if not nType or not _g_tbBattleHonor[nType] then
        return KsgNpc:Talk(g_szTitle .. "Kh�ng c� l�a ch�n n�y.")
    end
    local tbCfg = _g_tbBattleHonor[nType]

    --if not KsgLib:IsInTable(KsgPlayer:GetAccount(), _g_tbAccountNeedFix) then
    --    return KsgNpc:Talk(g_szTitle .. "C�c h� kh�ng n�m trong danh s�ch nh�n ��n b�.")
    --end

    if KsgDate:Today() > DENBU_END_DATE then
        return KsgNpc:Talk(g_szTitle .. "�� qu� th�i h�n nh�n ��n b�")
    end

    if KsgTask:GetBit(TASKID_COMPENSATION, DENBU_TASK_ID) == 1 then
        return KsgNpc:Talk(g_szTitle .. "C�c h� �� nh�n qu� ��n b� n�y r�i.")
    end

    if not KsgLib:HasEnoughBagRoom(5) then
        return
    end

    if KsgLib:PayMaterial(tbCfg.tbCondition) then
        KsgTask:SetBit(TASKID_COMPENSATION, DENBU_TASK_ID, 1)
        KsgAward:Give(tbCfg.tbAward, "Nh�n ��n b� b�o tr�")
        return KsgNpc:Talk(g_szTitle .. format("C�c h� �� nh�n th�nh c�ng qu� ��n b�, h�nh th�c nh�n: <color=gold>%s<color>.", tbCfg.szName))
    end
end

function _denbu_GopServer()
    if KsgLib:GetServerId() ~= MERGE_SERVER_ID then
        return KsgNpc:Talk(g_szTitle .. "C�c h� kh�ng n�m trong danh s�ch nh�n qu�.")
    end

    if KsgPlayer:GetBigLevel() < 992 then
        return KsgNpc:Talk(g_szTitle .. "Nh�n v�t ��t chuy�n sinh 9 c�p 92 tr� l�n m�i c� th� nh�n th��ng")
    end

    if KsgDate:Today() > MERGE_SERVER_AWARD_DATE then
        return KsgNpc:Talk(g_szTitle .. "�� qu� th�i h�n nh�n ph�n qu� n�y")
    end

    if KsgTask:GetBit(TASKID_COMPENSATION, MERGE_SERVER_TASK_BIT) == 1 then
        return KsgNpc:Talk(g_szTitle .. "C�c h� �� nh�n ph�n qu� n�y r�i.")
    end

    KsgTask:SetBit(TASKID_COMPENSATION, MERGE_SERVER_TASK_BIT, 1)
    KsgAward:Give({ tbProp = { 2, 1, 50256 }, nStatus = 4, }, "Nh�n qu� g�p server")
    return KsgNpc:Talk(g_szTitle .. "Nh�n th�nh c�ng qu� g�p m�y ch�.")
end

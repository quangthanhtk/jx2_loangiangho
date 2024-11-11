----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-24
--- Description: GM item all in one
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>��c c�ch h� tr�<color>: ";

function OnUse(nItemIdx, bConfirm)
    bConfirm = tonumber(bConfirm) or 0;
    if bConfirm == 0 then
        WNpc:SayConfirm("<npcname>: Sau khi s� d�ng l�p t�c ���c reset tr�ng th�i nh�n trang b� h� tr� trong <color=white>Th� T�n Th�<color>, tr� Th��ng H�i Di Ch�u. <sex> ��ng � s� d�ng kh�ng?",
                format("OnUse(%d, 1)", nItemIdx));
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if WItem:DelByIndex(nItemIdx, 1) ~= WEnv.RETCODE_SUCCESS then
        WNpc:Talk("Thu h�i v�t ph�m th�t b�i!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end

    local tbExceptTask = {
        [WTASKID_NEWBIE_BIT_GIVE_THUONGHAIDICHAU] = 1
    };
    for i = 1, 31 do
        if tbExceptTask[i] == nil then
            WTask:SetBit(WTASKID_NEWBIE_BIT_GIVE_STATUS, i, 0);
        end
    end

    local tbExceptTask2 = {
    };
    for i = 1, 31 do
        if tbExceptTask2[i] == nil then
            WTask:SetBit(WTASKID_NEWBIE_BIT_GIVE2_STATUS, i, 0);
        end
    end

    WNpc:Talk("�� reset th�nh c�ng, h�y ki�m tra l�i t�i <color=white>Th� T�n Th�<color>!", WEnv.TRUE);
    return WEnv.RETCODE_SUCCESS;
end

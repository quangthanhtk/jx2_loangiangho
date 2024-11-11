----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item r��ng ho�t ��ng ph� b�n ��a huy�n cung
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------


function OnUse(nItemIdx)
    local nMapId = GetWorldPos();
    if nMapId~=205 then
        WNpc:Talk("<sex> c�n ph�i ��n ��ng Bi�n Kinh m�i s� d�ng th� n�y ���c!", WEnv.TRUE);
        return
    end
    --if WDate:Today() > 20240216 then
    --    WNpc:Talk("Ch�o <sex>! �� h�t th�i gian s� d�ng l�nh b�i!", WEnv.TRUE);
    --end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        local szMsg = "Ni�n Th� xu�t hi�n trong ��ng Bi�n Kinh !";
        Msg2Global(szMsg);
        AddGlobalNews(szMsg);
        local nBossIdx = CreateNpc("Ni�n th� to l�n", "Ni�n Th�", GetWorldPos());
        if nBossIdx ~= 0 then
            SetNpcScript(nBossIdx,"\\script\\warlord\\online_activities\\tetnguyendan2024\\eventboss\\nienthu1.lua")
            WriteLog("[WBOSS_TNC:CreateBossEvent2024] success!");
            SetNpcLifeTime(nBossIdx, 600);
        else
            WriteLog("[WBOSS_TNC:CreateBossEvent2024] error!");
        end
    else
        WNpc:Talk("Thu h�i v�t ph�m th�t b�i!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end
end

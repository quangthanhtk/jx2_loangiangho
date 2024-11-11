----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-04-25
--- Description: th�c thi khi boss b� ng��i ch�i gi�t
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\online_activities\\boss_tai_nguyen_chien\\head.lua");
----------------------------------------------------------------------------------------------------

function OnRemove(nNpcIdx, szNpcName)
    local szMsg = "Sau m�t h�i giao tranh b�t ph�n th�ng b�i, gi�o ch� ��ng Ph��ng quay tr� v� t�ng ��n �� d��ng th��ng, anh h�ng ch�n v� l�m qu� l� k� t�i!";
    Msg2Global(szMsg);
    AddGlobalNews(szMsg, 2);

    SetNpcDeathScript(nNpcIdx, "");
    SetNpcRemoveScript(nNpcIdx, "");
    SetNpcLifeTime(nNpcIdx, 0);
end 

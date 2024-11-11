----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-04-25
--- Description: thùc thi khi boss bÞ ng­êi ch¬i giÕt
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\online_activities\\boss_tai_nguyen_chien\\head.lua");
----------------------------------------------------------------------------------------------------

function OnRemove(nNpcIdx, szNpcName)
    local szMsg = "Sau mét håi giao tranh bÊt ph©n th¾ng b¹i, gi¸o chñ §«ng Ph­¬ng quay trë vÒ tæng ®µn ®Ó d­ìng th­¬ng, anh hïng chèn vâ l©m qu¶ lµ kú tµi!";
    Msg2Global(szMsg);
    AddGlobalNews(szMsg, 2);

    SetNpcDeathScript(nNpcIdx, "");
    SetNpcRemoveScript(nNpcIdx, "");
    SetNpcLifeTime(nNpcIdx, 0);
end 

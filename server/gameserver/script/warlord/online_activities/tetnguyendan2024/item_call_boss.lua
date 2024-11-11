----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item r­¬ng ho¹t ®éng phã b¶n ®Þa huyÒn cung
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------


function OnUse(nItemIdx)
    local nMapId = GetWorldPos();
    if nMapId~=205 then
        WNpc:Talk("<sex> cÇn ph¶i ®Õn §«ng BiÖn Kinh míi sö dông thÎ nµy ®­îc!", WEnv.TRUE);
        return
    end
    --if WDate:Today() > 20240216 then
    --    WNpc:Talk("Chµo <sex>! §· hÕt thêi gian sö dông lÖnh bµi!", WEnv.TRUE);
    --end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        local szMsg = "Niªn Thó xuÊt hiÖn trong §«ng BiÖn Kinh !";
        Msg2Global(szMsg);
        AddGlobalNews(szMsg);
        local nBossIdx = CreateNpc("Niªn thó to lín", "Niªn Thó", GetWorldPos());
        if nBossIdx ~= 0 then
            SetNpcScript(nBossIdx,"\\script\\warlord\\online_activities\\tetnguyendan2024\\eventboss\\nienthu1.lua")
            WriteLog("[WBOSS_TNC:CreateBossEvent2024] success!");
            SetNpcLifeTime(nBossIdx, 600);
        else
            WriteLog("[WBOSS_TNC:CreateBossEvent2024] error!");
        end
    else
        WNpc:Talk("Thu håi vËt phÈm thÊt b¹i!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end
end

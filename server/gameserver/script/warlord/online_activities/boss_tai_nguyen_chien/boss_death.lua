----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-04-25
--- Description: thùc thi khi boss bÞ ng­êi ch¬i giÕt
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\online_activities\\boss_tai_nguyen_chien\\head.lua");
----------------------------------------------------------------------------------------------------

function OnDeath(nNpcIdx)
    local szBossName = GetNpcName(nNpcIdx);
    local nBossMapId, nBossPosX, nBossPosY = GetNpcWorldPos(nNpcIdx);

    for i = 1, WBOSS_TNC.nDropBoxNum do
        local nSmallBoxIdx = CreateNpc(WBOSS_TNC.tbBoxInfo[1], WBOSS_TNC.tbBoxInfo[2], nBossMapId, nBossPosX + random(-i, i), nBossPosY + random(-i, i));
        if nSmallBoxIdx ~= 0 then
            SetNpcScript(nSmallBoxIdx, "\\script\\warlord\\online_activities\\boss_tai_nguyen_chien\\small_box.lua");
            SetNpcLifeTime(nSmallBoxIdx, WBOSS_TNC.tbBoxInfo[3]);
            WLib:SetUnitCurStates(nSmallBoxIdx, 6, GetTime());
        end
    end

    SetNpcLifeTime(nNpcIdx, 0);
    SetNpcRemoveScript(nNpcIdx, "");
    SetNpcDeathScript(nNpcIdx, "");
    
    WAward:BossTnc_KillBoss(szBossName);
end 

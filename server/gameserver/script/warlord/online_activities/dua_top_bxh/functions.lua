----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-01-13
--- Description: C¸c hµm sö dông trong trao th­ëng top bxh
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\lib\\sdb.lua");
----------------------------------------------------------------------------------------------------

function WDUATOPBXH:GetData_TopMerrit()
    local sdb = SDB("_PlayerBattleRankS", 5, 0);
    sdb:apply2(callout(WDUATOPBXH.GetData_TopMerrit_cb, self));

    local sdb = SDB("_PlayerBattleRankL", 5, 0);
    sdb:apply2(callout(WDUATOPBXH.GetData_TopMerrit_cb, self));
end

function WDUATOPBXH:GetData_TopMerrit_cb(nCount, sdb)
    if nCount == 0 or sdb == WEnv.NULL then
        print("WDUATOPBXH:GetData_TopMerrit_cb", "Empty data!");
        return WEnv.RETCODE_NOTOPEN;
    end

    local nType = 0;
    if sdb.key == "_PlayerBattleRankS" then
        nType = 1;
    elseif sdb.key == "_PlayerBattleRankL" then
        nType = 2;
    else
        return WEnv.RETCODE_ERROR;
    end

    local nRankMax = min(nCount, 15);
    for nRankIndex = 0, nRankMax do
        -- lÊy l­îng lín h¬n sè phÇn th­ëng ®Ó trõ hao khi bÞ kiÖn tông
        if sdb[nRankIndex] ~= nil then
            local szRoleName = sdb[nRankIndex][1] or "";
            local nData = sdb[nRankIndex][2] or 0;
            local nRoute = sdb[nRankIndex][3] or 0;
            local nLevel = sdb[nRankIndex][4] or 0;
            local szLogTime = date('%Y-%m-%d %H:%M:%S');
            WFileLog:WriteTabFile(self.tbTopDef[nType].szDataFilePath,
                    { szLogTime, "RelayNotSave", (szRoleName or "") .. " ", nRankIndex + 1, nData, nRoute, nLevel },
                    { "szLogTime", "szAccount", "szRoleName", "nRank", "nData", "nRoute", "nLevel" });

        end
    end
    print("WDUATOPBXH:GetData_TopMerrit_cb", format("Get data success, nType= %d, nCount = %d, nRankMax = %d!", nType, nCount, nRankMax));
end

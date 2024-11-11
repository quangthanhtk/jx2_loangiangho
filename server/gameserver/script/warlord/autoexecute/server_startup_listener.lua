----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-02
--- Description: xö lý khi server khëi ®éng
--- Include trong file \script\global\autoexec.lua
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

m_tbNpcList_FixBugBNL = {
    { 301, 1592, 3138, "\\script\\warlord\\npcs\\npc_luumanhthanhthi.lua", "L­u manh thµnh thÞ", "L­u manh thµnh thÞ", },
    { 108, 1397, 3159, "\\script\\warlord\\npcs\\npc_luumanhthanhthi.lua", "L­u manh thµnh thÞ", "L­u manh thµnh thÞ", },
};

m_tbNpcList_DuaTopBXH = {
    { 200, 1361, 2878, "\\script\\warlord\\online_activities\\dua_top_bxh\\npc_hoanghuynh.lua", "laodai", "Hoµng Huynh", },
};

function _w_OnServerStartup()
    local nVersion, nCurGs = GetRealmType();
    if nCurGs == 0 then
        _w_AddDialogNpc(m_tbNpcList_FixBugBNL);
        --_w_AddDialogNpc(m_tbNpcList_DuaTopBXH);
    end
end

function _w_AddDialogNpc(tbConfig)
    for i = 1, getn(tbConfig) do
        local tbNpcConfig = tbConfig[i];
        local nMapId = tbNpcConfig[1];
        local nSubWorldIdx = SubWorldID2Idx(nMapId);
        if (nSubWorldIdx >= 0) then
            local szNpcTemplate = tbNpcConfig[5];
            local szNpcName = tbNpcConfig[6];
            local szScriptFile = tbNpcConfig[4] or "";
            local nNpcPosX = tbNpcConfig[2];
            local nNpcPosY = tbNpcConfig[3];
            local nNpcIdx = CreateNpc(szNpcTemplate, szNpcName, nMapId, nNpcPosX, nNpcPosY);
            if nNpcIdx > 0 then
                SetNpcScript(nNpcIdx, szScriptFile);
            end
        end
    end
end
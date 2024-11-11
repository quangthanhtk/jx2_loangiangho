----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-07
--- Description: c¸c hµm gm liªn quan ®Õn server
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_tbBossCfg = {
    { szName = "Gäi boss §µo Hoa §¶o Chñ Hoµng Long", szScriptFile = "\\script\\gmscript.lua", szScriptFunc = "wb_CreateBoss()" },
    { szName = "Gäi boss Tµi Nguyªn ChiÕn", szScriptFile = "\\script\\gmscript.lua", szScriptFunc = "_w_r2s_CreateBossTnc()" },
    { szName = "Gäi boss Phï Thuû B¨ng Gi¸", szScriptFile = "\\script\\gmscript.lua", szScriptFunc = "oly_hanbingwunv(1)" },
};
m_tbBattleCfg = {
    { szName = "Më Nh¹n M«n Quan-ChiÕn dÞch chÝnh", szScriptFile = "\\script\\warlord\\functions\\function_gm_battle.lua", szScriptFunc = "_wgm_battle_OpenNMQ()" },
    { szName = "§ãng Nh¹n M«n Quan-ChiÕn dÞch chÝnh", szScriptFile = "\\script\\warlord\\functions\\function_gm_battle.lua", szScriptFunc = "_wgm_battle_CloseNMQ()" },
    { szName = "Më Th«n Trang-ChiÕn dÞch phô", szScriptFile = "\\script\\warlord\\functions\\function_gm_battle.lua", szScriptFunc = "_wgm_battle_OpenSub(1)" },
    { szName = "§ãng Th«n Trang-ChiÕn dÞch phô", szScriptFile = "\\script\\warlord\\functions\\function_gm_battle.lua", szScriptFunc = "_wgm_battle_CloseSub(1)" },
    { szName = "Më L­¬ng Th¶o-ChiÕn dÞch phô", szScriptFile = "\\script\\warlord\\functions\\function_gm_battle.lua", szScriptFunc = "_wgm_battle_OpenSub(2)" },
    { szName = "§ãng L­¬ng Th¶o-ChiÕn dÞch phô", szScriptFile = "\\script\\warlord\\functions\\function_gm_battle.lua", szScriptFunc = "_wgm_battle_CloseSub(2)" },
    { szName = "Më Ph¸o §µi-ChiÕn dÞch phô", szScriptFile = "\\script\\warlord\\functions\\function_gm_battle.lua", szScriptFunc = "_wgm_battle_OpenSub(3)" },
    { szName = "§ãng Ph¸o §µi-ChiÕn dÞch phô", szScriptFile = "\\script\\warlord\\functions\\function_gm_battle.lua", szScriptFunc = "_wgm_battle_CloseSub(3)" },
};
----------------------------------------------------------------------------------------------------
--- C¸c menu chÝnh
function _wgm_server_OpenMenu()
    local self = WGM;

    local tbSay = { _wgm_GetGmSayHeader() };
    _wgm_InsertSay(tbSay, "_wgm_server_OpenMenu_MovePlayersOnMap", "Menu ®­a toµn bé nh©n vËt map nµy ®Õn.../_wgm_server_OpenMenu_MovePlayersOnMap");

    tinsert(tbSay, g_szSpaceLine);
    _wgm_InsertSay(tbSay, "_wgm_server_OpenMenu_Activities", "Menu bËt t¾t c¸c ho¹t ®éng.../_wgm_server_OpenMenu_Activities");
    _wgm_InsertSay(tbSay, "_wgm_server_OpenMenu_KickPlayers", "Menu kick toµn bé nh©n vËt.../_wgm_server_OpenMenu_KickPlayers");
    _wgm_InsertSay(tbSay, "_wgm_server_KickAccountAllGS", "Kick tµi kho¶n khái game theo list/_wgm_server_KickAccountAllGS");

    tinsert(tbSay, g_szSpaceLine);
    _wgm_InsertSay(tbSay, "_wgm_server_ReloadScript", "Reload Script/_wgm_server_ReloadScript");

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "<<  Trë l¹i GM Item/_wgm_OpenMenu");
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_SUCCESS;
end

function _wgm_server_OpenMenu_Activities()
    local tbSay = { _wgm_GetGmSayHeader() };

    _wgm_InsertSay(tbSay, "_wgm_server_CallBoss", "Gäi boss.../_wgm_server_CallBoss");
    _wgm_InsertSay(tbSay, "_wgm_server_CallBattle", "ChiÕn tr­êng.../_wgm_server_CallBattle");

    tinsert(tbSay, g_szSpaceLine);
    _wgm_InsertSay(tbSay, "_wgm_server_LoadDuaTopBXHData_TopBattleMerit", "Load danh s¸ch ®ua top chiÕn tr­êng/_wgm_server_LoadDuaTopBXHData_TopBattleMerit");
    --_wgm_InsertSay(tbSay, "_wgm_server_LoadDuaTopBXHData_TopLevel", "Load danh s¸ch ®ua top cÊp toµn server/_wgm_server_LoadDuaTopBXHData_TopLevel");

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "<<  Trë l¹i GM Item/_wgm_OpenMenu");
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_SUCCESS;
end

function _wgm_server_OpenMenu_MovePlayersOnMap(nSelectIdx)
    nSelectIdx = tonumber(nSelectIdx) or 0;

    local tbTargetMap = {
        { "T­¬ng D­¬ng ®­îc ®iÕm", { 350, 1410, 2979 } },
    };

    if nSelectIdx == 0 then
        local tbSay = { _wgm_GetGmSayHeader() };

        for i = 1, getn(tbTargetMap) do
            _wgm_InsertSay(tbSay, "_wgm_server_OpenMenu_MovePlayersOnMap", format("§­a ®Õn %s/#_wgm_server_OpenMenu_MovePlayersOnMap(%d)", tbTargetMap[i][1], i));
        end

        tinsert(tbSay, g_szSpaceLine);
        --tinsert(tbSay, "<<  Trë l¹i GM Item/_wgm_OpenMenu");
        tinsert(tbSay, "[x] §ãng/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    -- TiÕn hµnh move
    local nCurrentMapId = WPlayer:GetWorldPos();
    local nMapId = tbTargetMap[nSelectIdx][2][1];
    local nPosX = tbTargetMap[nSelectIdx][2][2];
    local nPosY = tbTargetMap[nSelectIdx][2][3];
    local nOldPlayerIdx = PlayerIndex;

    local szCurrentAccount = WPlayer:GetAccount();
    local nFoundPlayerIdx = FirstPlayer();
    while nFoundPlayerIdx > 0 do
        PlayerIndex = nFoundPlayerIdx;
        if WPlayer:GetAccount() ~= szCurrentAccount then
            if nCurrentMapId == WPlayer:GetWorldPos() then
                _wgm_SafeNewWorld(nMapId, nPosX + random(-2, 2), nPosY + random(-2, 2));
            end
        end
        PlayerIndex = nOldPlayerIdx;
        nFoundPlayerIdx = NextPlayer(nFoundPlayerIdx);
    end

    PlayerIndex = nOldPlayerIdx;
end

function _wgm_server_OpenMenu_KickPlayers()
    local tbSay = { _wgm_GetGmSayHeader() };

    _wgm_InsertSay(tbSay, "_wgm_server_KickAllPlayerOnMap", "Kick toµn bé nh©n vËt t¹i b¶n ®å nµy/_wgm_server_KickAllPlayerOnMap");
    _wgm_InsertSay(tbSay, "_wgm_server_KickAllPlayerOnGS", "Kick toµn bé nh©n vËt t¹i GS nµy/_wgm_server_KickAllPlayerOnGS");
    tinsert(tbSay, g_szSpaceLine);
    for i = 1, 6 do
        _wgm_InsertSay(tbSay, "_wgm_server_KickAllPlayerOnGS", format("Kick toµn bé nh©n vËt t¹i GS_%d/#_wgm_server_KickAllPlayerOnGS(\"_wgm_KickAllPlayerOnGS\", %d)", i, i));
    end

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "<<  Trë l¹i GM Item/_wgm_OpenMenu");
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_SUCCESS;
end
----------------------------------------------------------------------------------------------------
--- C¸c hµm thùc thi
function _wgm_server_ReloadScript(bHideMsg)
    local self = WGM;

    bHideMsg = bHideMsg or 0;
    local nGSIndex = WLib:GetGSIndex();
    local szDateTime = date("%Y-%m-%d %H:%M:%S");
    if bHideMsg == 0 then
        WPlayer:Msg(format("[%s] GS_%d: script reload begin...", szDateTime, nGSIndex));
    end
    print(format("===== [%s] GS_%d: script reload begin... =====", szDateTime, nGSIndex));
    local nCoreScriptCount = getn(self.tbReloadCoreScript);
    if nCoreScriptCount > 0 then
        for i = 1, nCoreScriptCount do
            local cell_szScriptFile = WLib:Trim(self.tbReloadCoreScript[i]);
            if cell_szScriptFile ~= "" then
                cell_szScriptFile = WLib:Replace(cell_szScriptFile, "/", "\\");
                if bHideMsg == 0 then
                    WPlayer:Msg(format("Reload core script: %d/%d", i, nCoreScriptCount));
                end
                print(format("Reload core script: %d/%d [%s]", i, nCoreScriptCount, cell_szScriptFile));
                LoadScript(cell_szScriptFile);
            end
        end
    end

    local tbFile = new(KTabFile, self.szReloadScriptFile);
    if tbFile == WEnv.NULL then
        TabFile_Unload(self.szReloadScriptFile);
        WPlayer:Msg(format("ScriptList file [%s] not found!", self.szReloadScriptFile));
    else
        local nRows = tbFile:getRow();
        for i = 1, nRows do
            local cell_szScriptFile = WLib:Trim(tbFile:getCell(i, 1));
            if cell_szScriptFile ~= "" then
                cell_szScriptFile = WLib:Replace(cell_szScriptFile, "/", "\\");
                if bHideMsg == 0 then
                    WPlayer:Msg(format("Reload ScriptList: %d/%d", i, nRows));
                end
                print(format("Reload ScriptList: %d/%d [%s]", i, nRows, cell_szScriptFile));
                LoadScript(cell_szScriptFile);
            end
        end
        TabFile_Unload(self.szReloadScriptFile);
    end

    local szDateTime = date("%Y-%m-%d %H:%M:%S");
    if bHideMsg == 0 then
        WPlayer:Msg(format("[%s] GS_%d: script reload success!", szDateTime, nGSIndex));
    end
    print(format("===== [%s] GS_%d: script reload success! =====", szDateTime, nGSIndex));
end

function _wgm_server_KickAccountOnGSByList()
    if g_tbTmpAccountKick ~= WEnv.NULL then
        print("Other process kick account is running!");
        return WEnv.RETCODE_ERROR;
    end

    local tbAccountList = WLib:GetTabFileTable(WGM.szAccountKickOutFile, 1, {
        tostring,
    }, function(tbLineData)
        local szAccount = tbLineData[1];
        tbLineData.n = nil;
        g_tbTmpAccountKick = g_tbTmpAccountKick or {};
        g_tbTmpAccountKick[szAccount] = tbLineData
    end);

    if getn(tbAccountList) == 0 then
        print("Account list  is empty!");
        return WEnv.RETCODE_ERROR;
    end

    local nOldPlayerIdx = PlayerIndex;

    local szCurrentAccount = WPlayer:GetAccount();
    local nFoundPlayerIdx = FirstPlayer();
    local nKickCount = 0;
    while nFoundPlayerIdx > 0 do
        PlayerIndex = nFoundPlayerIdx;
        if WPlayer:GetAccount() ~= "" and szCurrentAccount ~= WPlayer:GetAccount() and g_tbTmpAccountKick[WPlayer:GetAccount()] ~= WEnv.NULL then
            nKickCount = nKickCount + 1;
            SaveNow();
            ExitGame();
        end
        PlayerIndex = nOldPlayerIdx;
        nFoundPlayerIdx = NextPlayer(nFoundPlayerIdx);
    end

    PlayerIndex = nOldPlayerIdx;

    g_tbTmpAccountKick = WEnv.NULL;
    print("Process kick account run success, total kickout="..nKickCount);
end

function _wgm_server_KickAllPlayerOnGS(nGSIdx)
    if nGSIdx ~= WEnv.NULL and nGSIdx ~= "" then
        nGSIdx = tonumber(nGSIdx);
        if nGSIdx ~= WLib:GetGSIndex() then
            return 0;
        end
    end

    local nOldPlayerIdx = PlayerIndex;

    local szCurrentAccount = WPlayer:GetAccount();
    local nFoundPlayerIdx = FirstPlayer();
    while nFoundPlayerIdx > 0 do
        PlayerIndex = nFoundPlayerIdx;
        if WPlayer:GetAccount() ~= szCurrentAccount then
            SaveNow();
            ExitGame();
        end
        PlayerIndex = nOldPlayerIdx;
        nFoundPlayerIdx = NextPlayer(nFoundPlayerIdx);
    end

    PlayerIndex = nOldPlayerIdx;
    return nFoundPlayerIdx;
end

function _wgm_server_KickAllPlayerOnMap(nMapId)
    if nMapId == WEnv.NULL then
        nMapId = WPlayer:GetWorldPos();
    end

    local nOldPlayerIdx = PlayerIndex;

    local szCurrentAccount = WPlayer:GetAccount();
    local nFoundPlayerIdx = FirstPlayer();
    while nFoundPlayerIdx > 0 do
        PlayerIndex = nFoundPlayerIdx;
        if WPlayer:GetAccount() ~= szCurrentAccount then
            if nMapId == WPlayer:GetWorldPos() then
                SaveNow();
                ExitGame();
            end
        end
        PlayerIndex = nOldPlayerIdx;
        nFoundPlayerIdx = NextPlayer(nFoundPlayerIdx);
    end

    PlayerIndex = nOldPlayerIdx;
    return nFoundPlayerIdx;
end

function _wgm_server_LoadDuaTopBXHData_TopBattleMerit()
    ApplyRelayShareData('_PlayerBattleRankS', 5, 0, WGM.szScriptFile, '_wgm_server_LoadDuaTopBXHData_TopBattleMerit_cb');
    ApplyRelayShareData('_PlayerBattleRankL', 5, 0, WGM.szScriptFile, '_wgm_server_LoadDuaTopBXHData_TopBattleMerit_cb');
end
function _wgm_server_LoadDuaTopBXHData_TopBattleMerit_cb(szKey, nKey1, nKey2, nCount)
    local szCampName = 'ch­a râ';
    local szLogName = 'unknow';
    if szKey == '_PlayerBattleRankS' then
        szCampName = 'Tèng';
        szLogName = 'tong';
    elseif szKey == '_PlayerBattleRankL' then
        szCampName = 'Liªu';
        szLogName = 'lieu';
    end

    local tbBattleRankData = {};
    for nRankIndex = 0, 2 do
        -- top 1-3
        local szRoleName, nData, nRoute, nLevel, nCamp = GetRelayShareDataByIndex(szKey, nKey1, nKey2, nRankIndex);
        tinsert(tbBattleRankData, { szRoleName, nData, nRoute, nLevel, nCamp });

        local szLogTime = date('%Y-%m-%d %H:%M:%S');
        WFileLog:WriteTabFile(format("data/warlord/duatopbxh/top_battlemerit_%s.txt", szLogName),
                { szLogTime, "RelayNotSave", (szRoleName or "") .. " ", nRankIndex + 1, nData, nRoute, nLevel, nCamp },
                { "szLogTime", "szAccount", "szRoleName", "nRank", "nData", "nRoute", "nLevel", "nCamp" });
    end

    local nTotalRow = getn(tbBattleRankData);
    if nTotalRow > 0 then
        WNpc:Talk("§· log thµnh c«ng top " .. nTotalRow .. " c«ng tr¹ng phe <color=white>" .. szCampName .. "<color>!", WEnv.TRUE);
    else
        WNpc:Talk("Ch­a cã d÷ liÖu phe <color=white>" .. szCampName .. "<color>!", WEnv.TRUE);
    end
end
function _wgm_server_LoadDuaTopBXHData_TopLevel()

end

function _wgm_server_CallBoss(nSelectIdx)
    local self = WGM;

    nSelectIdx = tonumber(nSelectIdx) or 0;
    if nSelectIdx == 0 then
        local tbSay = { "Chän thao t¸c: " };

        for i = 1, getn(m_tbBossCfg) do
            _wgm_InsertSay(tbSay, "_wgm_server_CallBoss", format("%s/#_wgm_server_CallBoss(%d)", m_tbBossCfg[i].szName, i));
        end

        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "<<  Trë l¹i GM Item/_wgm_OpenMenu");
        tinsert(tbSay, "[x] §ãng/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    SetPlayerScript(m_tbBossCfg[nSelectIdx].szScriptFile);
    SendScript2VM(m_tbBossCfg[nSelectIdx].szScriptFile, m_tbBossCfg[nSelectIdx].szScriptFunc);
    WPlayer:Msg(format("§· thùc thi %s!", m_tbBossCfg[nSelectIdx].szName));
end

function _wgm_server_CallBattle(nSelectIdx)
    local self = WGM;

    nSelectIdx = tonumber(nSelectIdx) or 0;
    if nSelectIdx == 0 then
        local tbSay = { "Chän thao t¸c: " };

        for i = 1, getn(m_tbBattleCfg) do
            _wgm_InsertSay(tbSay, "_wgm_server_CallBattle", format("%s/#_wgm_server_CallBattle(%d)", m_tbBattleCfg[i].szName, i));
        end

        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "<<  Trë l¹i GM Item/_wgm_OpenMenu");
        tinsert(tbSay, "[x] §ãng/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    SetPlayerScript(m_tbBattleCfg[nSelectIdx].szScriptFile);
    SendScript2VM(m_tbBattleCfg[nSelectIdx].szScriptFile, m_tbBattleCfg[nSelectIdx].szScriptFunc);
    WPlayer:Msg(format("§· thùc thi %s!", m_tbBattleCfg[nSelectIdx].szName));
end

----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-04
--- Description: c¸c hµm gm liªn quan ®Õn chiÕn tr­êng
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\newbattles\\head.lua");
Include("\\script\\newbattles\\functions.lua");
----------------------------------------------------------------------------------------------------

function _wgm_battle_OpenNMQ(bConfirm)
    if bConfirm == WEnv.NULL then
        WNpc:SayConfirm("X¸c nhËn thao t¸c më [<color=white>Nh¹n M«n Quan-ChiÕn dÞch chÝnh<color>]?", "_wgm_battle_OpenNMQ(1)");
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    local _, nCurGs = GetRealmType()
    if nCurGs == 1 then
        return WEnv.RETCODE_NOTOPEN;
    end

    WriteLog("[NewBattle]:Admin initialize Main-Battle");
    if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
        local nHour = tonumber(date("%H"));
        if SubWorldID2Idx(200) >= 0 then
            AddLocalNews("Th¸m m· håi b¸o, Nh¹n M«n Quan-chiÕn dÞch chÝnh s¾p khai chiÕn, mêi c¸c vÞ anh hïng nhanh chãng b¸o danh.");
            Msg2Global("Th¸m m· håi b¸o, Nh¹n M«n Quan-chiÕn dÞch chÝnh s¾p khai chiÕn, mêi c¸c vÞ anh hïng nhanh chãng b¸o danh.");
        end
        local nOldSubWorld = SubWorld;
        SetGlbValue(GLB_NEW_BATTLESTATE, nHour * 10 + 3);    --ÉèÎªXX3£¬×¢Òâ£¬ÕâÀïµÄXX¿ÉÄÜºÍ¸±Õ½³¡µÄXX²»Ò»ÑùÅ¶
        SubWorld = SubWorldID2Idx(tBTMSInfo[MAINBATTLE_ID][2]);
        if RANDOM_CAMP_PLACE == 1 then
            SetGlbValue(GLB_RANDOM_PLACE_MAIN, random(0, 1));
        end
        if SubWorld >= 0 then
            WriteLog("[NewBattle]:Admin opening Main-Battle");
            OpenMission(tBTMSInfo[MAINBATTLE_ID][1]);
            WPlayer:Msg("Khëi t¹o [Nh¹n M«n Quan-chiÕn dÞch chÝnh] thµnh c«ng!");
        else
            WriteLog("[NewBattle]:Admin fail to initialized Sub-Battle,Map ID:" .. tostring(tBTMSInfo[MAINBATTLE_ID][2]) .. ",SubWorld ID:" .. tostring(SubWorld));
            WPlayer:Msg("Khëi t¹o [Nh¹n M«n Quan-chiÕn dÞch chÝnh] thÊt b¹i!");
        end
        SubWorld = nOldSubWorld;
    else
        WPlayer:Msg("[Nh¹n M«n Quan-chiÕn dÞch chÝnh] ®ang më, kh«ng thÓ më thªm!");
    end
end

function _wgm_battle_CloseNMQ(nSelectIdx)
    nSelectIdx = tonumber(nSelectIdx) or 0;
    if nSelectIdx == 0 then
        local tbSay = {
            "X¸c nhËn thao t¸c ®ãng [<color=white>Nh¹n M«n Quan-ChiÕn dÞch chÝnh<color>]?",
            "X¸c nhËn ®ãng - ghi nhËn trËn chiÕn/#_wgm_battle_CloseNMQ(1)",
            "X¸c nhËn ®ãng - hñy trËn/#_wgm_battle_CloseNMQ(2)",
            "\nT¹m ch­a cÇn ®ãng./nothing",
        }
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    local _, nCurGs = GetRealmType();
    if nCurGs == 1 then
        return WEnv.RETCODE_NOTOPEN;
    end

    if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
        local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
        if nGlobalState ~= 0 then
            local nOldSubWorld = SubWorld;
            SubWorld = SubWorldID2Idx(tBTMSInfo[MAINBATTLE_ID][2]);
            if SubWorld >= 0 then
                if nSelectIdx == 2 then
                    local IDTab = BT_SortMSPlayerByTaskValue(PTNC_BATTLEPOINT, 0, ALL_ID);
                    local nPlayerCount = getn(IDTab);
                    local nOldPlayerIdx = PlayerIndex;
                    for i = 1, nPlayerCount do
                        --ÉÆºó´¦Àí
                        PlayerIndex = IDTab[i];
                        --BT_ReportFinalResult(); -- hñy kÕt qu¶
                        --BT_ProcessBattleOver(); -- hñy kÕt qu¶
                        BT_ShowDebugInfor("Trong _wgm_battle_CloseNMQ, Admin xãa nh©n vËt:" .. GetName() .. ", trÞ BT_GetData(PT_SIGN_UP):" .. BT_GetData(PT_SIGN_UP));
                        DelMSPlayer(MISSION_ID, ALL_ID);
                        BT_SetData(PT_SIGN_UP, 0);        --±¨ÃûÐÅÏ¢Çå¿Õ£¨µ¥³¡Õ½³¡²âÊÔ½×¶ÎÓÃ£©
                        PlayerIndex = nOldPlayerIdx;
                    end
                    PlayerIndex = nOldPlayerIdx;
                end

                WriteLog("[NewBattle]: Admin close Main-Battle");
                CloseMission(tBTMSInfo[MAINBATTLE_ID][1]);
                WPlayer:Msg("§ãng [Nh¹n M«n Quan-chiÕn dÞch chÝnh] thµnh c«ng!");
            else
                WriteLog("[NewBattle]: Admin fail to initialized Sub-Battle,Map ID:" .. tostring(tBTMSInfo[MAINBATTLE_ID][2]) .. ",SubWorld ID:" .. tostring(SubWorld));
                WPlayer:Msg("§ãng [Nh¹n M«n Quan-chiÕn dÞch chÝnh] thÊt b¹i!");
            end
            SubWorld = nOldSubWorld;
        end
    else
        WPlayer:Msg("[Nh¹n M«n Quan-chiÕn dÞch chÝnh] ch­a më, kh«ng thÓ ®ãng!");
    end
end

function _wgm_battle_OpenSub(nBattleType, bConfirm)
    bConfirm = tonumber(bConfirm) or 0;
    nBattleType = tonumber(nBattleType) or -1;
    local szBattleName = "phô ba n¬i";
    if nBattleType >= 1 then
        szBattleName = tBattleName[nBattleType];
    end
    
    if bConfirm == 0 then
        WNpc:SayConfirm(format("X¸c nhËn thao t¸c më [<color=white>%s<color>]?", szBattleName), format("_wgm_battle_OpenSub(%d, 1)", nBattleType));
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    local _, nCurGs = GetRealmType()
    if nCurGs == 1 then
        return WEnv.RETCODE_NOTOPEN;
    end

    WriteLog("[NewBattle]:Admin initialize Sub-Battle");
    if nBattleType == -1 or nBattleType == 1 then
        SetGlbValue(GLB_VILLAGE, 0);    --²»¹ÜÔõÑù£¬¶¼°ÑÕ½³¡µÄ½á¹ûÇåµô
    end
    if nBattleType == -1 or nBattleType == 2 then
        SetGlbValue(GLB_RESOURCE, 0);
    end
    if nBattleType == -1 or nBattleType == 3 then
        SetGlbValue(GLB_EMPLACEMENT, 0);
    end
    SetGlbValue(GLB_MAINBATTLE, 0);
    if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
        local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
        local nHour = tonumber(date("%H"));
        if nGlobalState == 0 then
            if SubWorldID2Idx(200) >= 0 then
                AddGlobalNews("ChiÕn tr­êng " .. szBattleName .. " s¾p khai chiÕn, mêi c¸c vÞ anh hïng nhanh chãng b¸o danh.", 2);
                Msg2Global("ChiÕn tr­êng " .. szBattleName .. " s¾p khai chiÕn, mêi c¸c vÞ anh hïng nhanh chãng b¸o danh.");
            end
            local nOldSubWorld = SubWorld;
            SetGlbValue(GLB_NEW_BATTLESTATE, nHour * 10 + 1);    --ÉèÎªXX1
            if RANDOM_CAMP_PLACE == 1 then
                if nBattleType == -1 or nBattleType == 1 then
                    SetGlbValue(GLB_RANDOM_PLACE_VILL, random(0, 1));
                end
                if nBattleType == -1 or nBattleType == 2 then
                    SetGlbValue(GLB_RANDOM_PLACE_RESO, random(0, 1));
                end
                if nBattleType == -1 or nBattleType == 3 then
                    SetGlbValue(GLB_RANDOM_PLACE_EMPL, random(0, 1));
                end
            end ;

            local nFrom, nTo = 1, 3;
            if nBattleType ~= -1 then
                nFrom = nBattleType;
                nTo = nBattleType;
            end

            for i = nFrom, nTo do
                SubWorld = SubWorldID2Idx(tBTMSInfo[i][2]);
                if SubWorld >= 0 then
                    WriteLog("[NewBattle]:Admin opening Sub-Battle");
                    OpenMission(tBTMSInfo[i][1]);
                    WPlayer:Msg("Khëi t¹o [" .. szBattleName .. "] thµnh c«ng!");
                else
                    WriteLog("[NewBattle]:Admin fail to initialized Sub-Battle,Map ID:" .. tostring(tBTMSInfo[i][2]) .. ",SubWorld ID:" .. tostring(SubWorld));
                    WPlayer:Msg("Khëi t¹o [" .. szBattleName .. "] thÊt b¹i!");
                end
            end
            SubWorld = nOldSubWorld;
        else
            --WriteLog("[NewBattle]:Global state error,value:"..tostring(nGlobalState));
            WPlayer:Msg("[" .. szBattleName .. "] ®ang më, kh«ng thÓ më thªm!");
        end
    end
end

function _wgm_battle_CloseSub(nBattleType, nSelectIdx)
    nSelectIdx = tonumber(nSelectIdx) or 0;
    nBattleType = tonumber(nBattleType) or -1;
    local szBattleName = "phô ba n¬i";
    if nBattleType >= 1 then
        szBattleName = tBattleName[nBattleType];
    end

    if nSelectIdx == 0 then
        local tbSay = {
            format("X¸c nhËn thao t¸c ®ãng chiÕn tr­êng [<color=white>%s<color>]?", szBattleName),
            format("X¸c nhËn ®ãng - ghi nhËn trËn chiÕn/#_wgm_battle_CloseSub(%d, 1)", nBattleType),
            format("X¸c nhËn ®ãng - hñy trËn/#_wgm_battle_CloseSub(%d, 2)", nBattleType),
            "\nT¹m ch­a cÇn ®ãng./nothing",
        }
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    local _, nCurGs = GetRealmType();
    if nCurGs == 1 then
        return WEnv.RETCODE_NOTOPEN;
    end

    if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
        local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
        if nGlobalState ~= 0 then
            local nOldSubWorld = SubWorld;

            local nFrom, nTo = 1, 3;
            if nBattleType ~= -1 then
                nFrom = nBattleType;
                nTo = nBattleType;
            end

            for i = nFrom, nTo do
                SubWorld = SubWorldID2Idx(tBTMSInfo[i][2]);
                if SubWorld >= 0 then
                    if nSelectIdx == 2 then
                        local IDTab = BT_SortMSPlayerByTaskValue(PTNC_BATTLEPOINT, 0, ALL_ID);
                        local nPlayerCount = getn(IDTab);
                        local nOldPlayerIdx = PlayerIndex;
                        for i = 1, nPlayerCount do
                            --ÉÆºó´¦Àí
                            PlayerIndex = IDTab[i];
                            --BT_ReportFinalResult(); -- hñy kÕt qu¶
                            --BT_ProcessBattleOver(); -- hñy kÕt qu¶
                            BT_ShowDebugInfor("Trong _wgm_battle_CloseSub, Admin xãa nh©n vËt:" .. GetName() .. ", trÞ BT_GetData(PT_SIGN_UP):" .. BT_GetData(PT_SIGN_UP));
                            DelMSPlayer(MISSION_ID, ALL_ID);
                            BT_SetData(PT_SIGN_UP, 0);        --±¨ÃûÐÅÏ¢Çå¿Õ£¨µ¥³¡Õ½³¡²âÊÔ½×¶ÎÓÃ£©
                            PlayerIndex = nOldPlayerIdx;
                        end
                        PlayerIndex = nOldPlayerIdx;
                    end

                    WriteLog("[NewBattle]:Admin close Sub-Battle");
                    CloseMission(tBTMSInfo[i][1]);
                    WPlayer:Msg("§ãng [" .. szBattleName .. "] thµnh c«ng!");
                else
                    WriteLog("[NewBattle]:Admin fail to close Sub-Battle,Map ID:" .. tostring(tBTMSInfo[i][2]) .. ",SubWorld ID:" .. tostring(SubWorld));
                    WPlayer:Msg("§ãng [" .. szBattleName .. "] thÊt b¹i!");
                end
            end
            SubWorld = nOldSubWorld;
        else
            WPlayer:Msg("[" .. szBattleName .. "] ch­a më, kh«ng thÓ ®ãng!");
        end
    end
end

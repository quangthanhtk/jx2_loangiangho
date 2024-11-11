----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-04
--- Description: c�c h�m gm li�n quan ��n chi�n tr��ng
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\newbattles\\head.lua");
Include("\\script\\newbattles\\functions.lua");
----------------------------------------------------------------------------------------------------

function _wgm_battle_OpenNMQ(bConfirm)
    if bConfirm == WEnv.NULL then
        WNpc:SayConfirm("X�c nh�n thao t�c m� [<color=white>Nh�n M�n Quan-Chi�n d�ch ch�nh<color>]?", "_wgm_battle_OpenNMQ(1)");
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
            AddLocalNews("Th�m m� h�i b�o, Nh�n M�n Quan-chi�n d�ch ch�nh s�p khai chi�n, m�i c�c v� anh h�ng nhanh ch�ng b�o danh.");
            Msg2Global("Th�m m� h�i b�o, Nh�n M�n Quan-chi�n d�ch ch�nh s�p khai chi�n, m�i c�c v� anh h�ng nhanh ch�ng b�o danh.");
        end
        local nOldSubWorld = SubWorld;
        SetGlbValue(GLB_NEW_BATTLESTATE, nHour * 10 + 3);    --��ΪXX3��ע�⣬�����XX���ܺ͸�ս����XX��һ��Ŷ
        SubWorld = SubWorldID2Idx(tBTMSInfo[MAINBATTLE_ID][2]);
        if RANDOM_CAMP_PLACE == 1 then
            SetGlbValue(GLB_RANDOM_PLACE_MAIN, random(0, 1));
        end
        if SubWorld >= 0 then
            WriteLog("[NewBattle]:Admin opening Main-Battle");
            OpenMission(tBTMSInfo[MAINBATTLE_ID][1]);
            WPlayer:Msg("Kh�i t�o [Nh�n M�n Quan-chi�n d�ch ch�nh] th�nh c�ng!");
        else
            WriteLog("[NewBattle]:Admin fail to initialized Sub-Battle,Map ID:" .. tostring(tBTMSInfo[MAINBATTLE_ID][2]) .. ",SubWorld ID:" .. tostring(SubWorld));
            WPlayer:Msg("Kh�i t�o [Nh�n M�n Quan-chi�n d�ch ch�nh] th�t b�i!");
        end
        SubWorld = nOldSubWorld;
    else
        WPlayer:Msg("[Nh�n M�n Quan-chi�n d�ch ch�nh] �ang m�, kh�ng th� m� th�m!");
    end
end

function _wgm_battle_CloseNMQ(nSelectIdx)
    nSelectIdx = tonumber(nSelectIdx) or 0;
    if nSelectIdx == 0 then
        local tbSay = {
            "X�c nh�n thao t�c ��ng [<color=white>Nh�n M�n Quan-Chi�n d�ch ch�nh<color>]?",
            "X�c nh�n ��ng - ghi nh�n tr�n chi�n/#_wgm_battle_CloseNMQ(1)",
            "X�c nh�n ��ng - h�y tr�n/#_wgm_battle_CloseNMQ(2)",
            "\nT�m ch�a c�n ��ng./nothing",
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
                        --�ƺ���
                        PlayerIndex = IDTab[i];
                        --BT_ReportFinalResult(); -- h�y k�t qu�
                        --BT_ProcessBattleOver(); -- h�y k�t qu�
                        BT_ShowDebugInfor("Trong _wgm_battle_CloseNMQ, Admin x�a nh�n v�t:" .. GetName() .. ", tr� BT_GetData(PT_SIGN_UP):" .. BT_GetData(PT_SIGN_UP));
                        DelMSPlayer(MISSION_ID, ALL_ID);
                        BT_SetData(PT_SIGN_UP, 0);        --������Ϣ��գ�����ս�����Խ׶��ã�
                        PlayerIndex = nOldPlayerIdx;
                    end
                    PlayerIndex = nOldPlayerIdx;
                end

                WriteLog("[NewBattle]: Admin close Main-Battle");
                CloseMission(tBTMSInfo[MAINBATTLE_ID][1]);
                WPlayer:Msg("��ng [Nh�n M�n Quan-chi�n d�ch ch�nh] th�nh c�ng!");
            else
                WriteLog("[NewBattle]: Admin fail to initialized Sub-Battle,Map ID:" .. tostring(tBTMSInfo[MAINBATTLE_ID][2]) .. ",SubWorld ID:" .. tostring(SubWorld));
                WPlayer:Msg("��ng [Nh�n M�n Quan-chi�n d�ch ch�nh] th�t b�i!");
            end
            SubWorld = nOldSubWorld;
        end
    else
        WPlayer:Msg("[Nh�n M�n Quan-chi�n d�ch ch�nh] ch�a m�, kh�ng th� ��ng!");
    end
end

function _wgm_battle_OpenSub(nBattleType, bConfirm)
    bConfirm = tonumber(bConfirm) or 0;
    nBattleType = tonumber(nBattleType) or -1;
    local szBattleName = "ph� ba n�i";
    if nBattleType >= 1 then
        szBattleName = tBattleName[nBattleType];
    end
    
    if bConfirm == 0 then
        WNpc:SayConfirm(format("X�c nh�n thao t�c m� [<color=white>%s<color>]?", szBattleName), format("_wgm_battle_OpenSub(%d, 1)", nBattleType));
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    local _, nCurGs = GetRealmType()
    if nCurGs == 1 then
        return WEnv.RETCODE_NOTOPEN;
    end

    WriteLog("[NewBattle]:Admin initialize Sub-Battle");
    if nBattleType == -1 or nBattleType == 1 then
        SetGlbValue(GLB_VILLAGE, 0);    --��������������ս���Ľ�����
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
                AddGlobalNews("Chi�n tr��ng " .. szBattleName .. " s�p khai chi�n, m�i c�c v� anh h�ng nhanh ch�ng b�o danh.", 2);
                Msg2Global("Chi�n tr��ng " .. szBattleName .. " s�p khai chi�n, m�i c�c v� anh h�ng nhanh ch�ng b�o danh.");
            end
            local nOldSubWorld = SubWorld;
            SetGlbValue(GLB_NEW_BATTLESTATE, nHour * 10 + 1);    --��ΪXX1
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
                    WPlayer:Msg("Kh�i t�o [" .. szBattleName .. "] th�nh c�ng!");
                else
                    WriteLog("[NewBattle]:Admin fail to initialized Sub-Battle,Map ID:" .. tostring(tBTMSInfo[i][2]) .. ",SubWorld ID:" .. tostring(SubWorld));
                    WPlayer:Msg("Kh�i t�o [" .. szBattleName .. "] th�t b�i!");
                end
            end
            SubWorld = nOldSubWorld;
        else
            --WriteLog("[NewBattle]:Global state error,value:"..tostring(nGlobalState));
            WPlayer:Msg("[" .. szBattleName .. "] �ang m�, kh�ng th� m� th�m!");
        end
    end
end

function _wgm_battle_CloseSub(nBattleType, nSelectIdx)
    nSelectIdx = tonumber(nSelectIdx) or 0;
    nBattleType = tonumber(nBattleType) or -1;
    local szBattleName = "ph� ba n�i";
    if nBattleType >= 1 then
        szBattleName = tBattleName[nBattleType];
    end

    if nSelectIdx == 0 then
        local tbSay = {
            format("X�c nh�n thao t�c ��ng chi�n tr��ng [<color=white>%s<color>]?", szBattleName),
            format("X�c nh�n ��ng - ghi nh�n tr�n chi�n/#_wgm_battle_CloseSub(%d, 1)", nBattleType),
            format("X�c nh�n ��ng - h�y tr�n/#_wgm_battle_CloseSub(%d, 2)", nBattleType),
            "\nT�m ch�a c�n ��ng./nothing",
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
                            --�ƺ���
                            PlayerIndex = IDTab[i];
                            --BT_ReportFinalResult(); -- h�y k�t qu�
                            --BT_ProcessBattleOver(); -- h�y k�t qu�
                            BT_ShowDebugInfor("Trong _wgm_battle_CloseSub, Admin x�a nh�n v�t:" .. GetName() .. ", tr� BT_GetData(PT_SIGN_UP):" .. BT_GetData(PT_SIGN_UP));
                            DelMSPlayer(MISSION_ID, ALL_ID);
                            BT_SetData(PT_SIGN_UP, 0);        --������Ϣ��գ�����ս�����Խ׶��ã�
                            PlayerIndex = nOldPlayerIdx;
                        end
                        PlayerIndex = nOldPlayerIdx;
                    end

                    WriteLog("[NewBattle]:Admin close Sub-Battle");
                    CloseMission(tBTMSInfo[i][1]);
                    WPlayer:Msg("��ng [" .. szBattleName .. "] th�nh c�ng!");
                else
                    WriteLog("[NewBattle]:Admin fail to close Sub-Battle,Map ID:" .. tostring(tBTMSInfo[i][2]) .. ",SubWorld ID:" .. tostring(SubWorld));
                    WPlayer:Msg("��ng [" .. szBattleName .. "] th�t b�i!");
                end
            end
            SubWorld = nOldSubWorld;
        else
            WPlayer:Msg("[" .. szBattleName .. "] ch�a m�, kh�ng th� ��ng!");
        end
    end
end

Import("\\script\\lib\\globalfunctions.lua");

Include("\\script\\newbattles\\battlestatistic.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\newbattles\\battleaward.lua");
Include("\\script\\online\\viet_2008_51\\viet_51_function.lua");
Include("\\script\\task\\happiness_bag\\happiness_bag.lua");

Include("\\script\\meridian\\meridian_award_zhenqi.lua")--���������Ľӿ�
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\vng\\book15\\book15_head.lua");
Include("\\script\\function\\vip_card\\vc_head.lua")

Include("\\settings\\static_script\\global\\merit.lua")
Include("\\script\\online_activites\\award.lua")
Import("\\script\\ksgvn\\functions\\battle_functions.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

--g_sNpcName��g_nNpcCamp����һ��ȫ�ֱ�������������Զ¥��������Ľű��϶���

function battle_main()
    BT_NewBattleClear();
    if GetLevel() < 40 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Chi�n tr��ng l� n�i nguy hi�m, ��i ng��i luy�n t�p th�m m�t th�i gian ��t c�p <color=yellow>40<color> r�i h�y quay l�i!");
        return 0;
    end ;
    if GetPlayerRoute() == 0 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: V� danh ti�u t�t nh� ng��i m� c�ng mu�n tham gia cu�c chi�n T�ng-Li�u �? Gia nh�p m�n ph�i r�i h�y t�nh.");
        return 0;
    end ;
    local nDate = tonumber(date("%y%m%d"));
    local nSignUpTime = BT_GetData(PT_BATTLE_DATE);    --��ȡ��ұ���������һ���ε�ս��
    local nSignUpInfo = BT_GetData(PT_SIGN_UP);        --��ȡ��ұ�����������ĸ�ս�����ķ�
    local nBattleType = BT_GetBattleType();
    local nSongPlayerCountV = BT_GetSignUpPlayerCount(VILLAGE_ID, SONG_ID);
    local nLiaoPlayerCountV = BT_GetSignUpPlayerCount(VILLAGE_ID, LIAO_ID);
    local nSongPlayerCountR = BT_GetSignUpPlayerCount(RESOURCE_ID, SONG_ID);
    local nLiaoPlayerCountR = BT_GetSignUpPlayerCount(RESOURCE_ID, LIAO_ID);
    local nSongPlayerCountE = BT_GetSignUpPlayerCount(EMPLACEMENT_ID, SONG_ID);
    local nLiaoPlayerCountE = BT_GetSignUpPlayerCount(EMPLACEMENT_ID, LIAO_ID);
    local nSongPlayerCountM = BT_GetSignUpPlayerCount(MAINBATTLE_ID, SONG_ID);
    local nLiaoPlayerCountM = BT_GetSignUpPlayerCount(MAINBATTLE_ID, LIAO_ID);
    local nSongPlayerMSCount = BT_GetPlayerCount(nBattleType, SONG_ID);
    local nLiaoPlayerMSCount = BT_GetPlayerCount(nBattleType, LIAO_ID);
    --��ѡ��ֻ�ܼ�����������ѡ��֮��
    local selTab = {
        "B�o danh " .. tBattleName[VILLAGE_ID] .. " [T�ng " .. nSongPlayerCountV .. " ng��i]: [Li�u " .. nLiaoPlayerCountV .. " ng��i]/#sign_up(" .. VILLAGE_ID .. ")",
        "B�o danh " .. tBattleName[RESOURCE_ID] .. " [T�ng " .. nSongPlayerCountR .. " ng��i]: [Li�u " .. nLiaoPlayerCountR .. " ng��i]/#sign_up(" .. RESOURCE_ID .. ")",
        "B�o danh " .. tBattleName[EMPLACEMENT_ID] .. " [T�ng " .. nSongPlayerCountE .. " ng��i]: [Li�u " .. nLiaoPlayerCountE .. " ng��i]/#sign_up(" .. EMPLACEMENT_ID .. ")",
        "B�o danh " .. tBattleName[MAINBATTLE_ID] .. " [T�ng " .. nSongPlayerCountM .. " ng��i]: [Li�u " .. nLiaoPlayerCountM .. " ng��i]/#sign_up(" .. MAINBATTLE_ID .. ")",
        "Ta mu�n v�o chi�n tr��ng " .. tBattleName[nBattleType] .. " [T�ng " .. nSongPlayerMSCount .. " ng��i]: [Li�u " .. nLiaoPlayerMSCount .. " ng��i]/#join_battle(" .. nBattleType .. ")",
        "Xem s� li�u th�ng k�/BTS_ViewBattleStatistic",
        "Ta mu�n nh�n ph�n th��ng chi�n tr��ng/get_battle_award",
        "��i ph�n th��ng chi�n tr��ng/battle_regular_award",
        "Tham gia ��nh gi� qu�n h�m/assess_rank",
        "Ta mu�n ���c h��ng d�n v� chi�n tr��ng/get_battle_book",
        "Ta mu�n chu�c l�i qu�n c�ng b� t�n th�t/get_lost_jungong",
        "K�t th�c ��i tho�i/nothing",
    }
    local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
    if nGlobalState == 0 then
        for i = 1, 5 do
            tremove(selTab, 1);
        end
        Say("<color=green>" .. g_sNpcName .. "<color>: ��i qu�n ch�a xu�t ph�t, luy�n t�p m�t th�i gian r�i h�y quay l�i.", getn(selTab), selTab);
        return 0;
    end
    if BT_GetCamp() == SONGLIAO_ID - g_nNpcCamp then
        if 3 - g_nNpcCamp == SONG_ID then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: N�u ng��i �� ch�n ��i T�ng ta c�ng kh�ng c��ng �p, xin b�o tr�ng!");
        else
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: N�u ng��i �� ch�n ��i Li�u ta c�ng kh�ng c��ng �p, xin b�o tr�ng!");
        end
        return 0;
    end
    local nBattleSegment = mod(nGlobalState, 10);    --��ȡս����ǰ�����ĸ��׶�
    if nBattleSegment == 2 or nBattleSegment == 4 then
        --ս��������
        if nDate * 1000 + nGlobalState - 1 == nSignUpTime then
            --���֮ǰ�б���
            for i = 1, 4 do
                tremove(selTab, 1);
            end
            --LongDaiKa: fix l�i khi d�ng GM lo�i b� player ra kh�i chi�n tr��ng
            if nBattleType == 0 then
                tremove(selTab, 1); -- x�a d�ng v�o chi�n tr��ng
                Say("<color=green>" .. g_sNpcName .. "<color>: V�o chi�n tr��ng? Tr��c �� ng��i �� c� bi�u hi�n kh�ng t�t n�n �� b� lo�i kh�i danh s�ch nh�n s� tham gia r�i.", getn(selTab), selTab);
                return 0;
            end
            Say("<color=green>" .. g_sNpcName .. "<color>: V�o chi�n tr��ng? Tr��c �� ng��i �� b�o danh tham gia <color=yellow>" .. tBattleName[nBattleType] .. "<color>.", getn(selTab), selTab);
            return 0;
        else
            --LongDaiKa: mod l�i theo t�ng t�nh n�ng y�u c�u ��ng gi�i h�n th�i gian ��ng k�
            --BT_SetData(PT_SIGN_UP, 0);
            if nSignUpInfo == 0 then
                tremove(selTab,5); -- x�a d�ng v�o chi�n tr��ng �� b�o danh
            end
            if nBattleSegment == 4 then
                if g_WCFG_NEWBATTLES_MAIN.bDisableRegisterTimeLimit ~= WEnv.TRUE
                    or nSignUpInfo == MAINBATTLE_ID*10+g_nNpcCamp
                then
                    tremove(selTab,4); --4=nh�n m�n quan
                end
                tremove(selTab,3); --3= ph�o ��i
                tremove(selTab,2); --2= th�o c�c
                tremove(selTab,1); --1= th�n trang
            elseif nBattleSegment == 2 then
                tremove(selTab,4); --4=nh�n m�n quan
                if g_WCFG_NEWBATTLES_EMPLACEMENT.bDisableRegisterTimeLimit ~= WEnv.TRUE
                    or g_WCFG_NEWBATTLES_EMPLACEMENT:IsDateOpen() ~= WEnv.TRUE
                    or nSignUpInfo == EMPLACEMENT_ID*10+g_nNpcCamp
                then
                    tremove(selTab,3); --3= ph�o ��i
                end
                if g_WCFG_NEWBATTLES_RESOURCE.bDisableRegisterTimeLimit ~= WEnv.TRUE
                    or g_WCFG_NEWBATTLES_RESOURCE:IsDateOpen() ~= WEnv.TRUE
                    or nSignUpInfo == RERESOURCE_ID*10+g_nNpcCamp
                then
                    tremove(selTab,2); --2= th�o c�c
                end
                if g_WCFG_NEWBATTLES_VILLAGE.bDisableRegisterTimeLimit ~= WEnv.TRUE
                    or g_WCFG_NEWBATTLES_VILLAGE:IsDateOpen() ~= WEnv.TRUE
                    or nSignUpInfo == VILLAGE_ID*10+g_nNpcCamp
                then
                    tremove(selTab,1); --1= th�n trang
                end
            end

            -- g�c
            --֮ǰû�б���
            --for i = 1, 5 do
            --    tremove(selTab, 1)
            --end
            Say("<color=green>" .. g_sNpcName .. "<color>: Th�i gian b�o danh �� k�t th�c, xin ��i tr�n sau!", getn(selTab), selTab);
        end
        return 0;
    elseif nDate * 1000 + nGlobalState == nSignUpTime then
        --�ڱ����׶Σ���������
        for i = 1, 4 do
            tremove(selTab, 1);
        end
        Say("<color=green>" .. g_sNpcName .. "<color>: V�o chi�n tr��ng? Tr��c �� ng��i �� b�o danh tham gia <color=yellow>" .. tBattleName[nBattleType] .. "<color>.", getn(selTab), selTab);
        return 0;
    elseif nBattleSegment == 1 then
        --��ս�������У�δ��������
        tremove(selTab, 4);    --ȥ����ս������
        tremove(selTab, 4);    --ȥ������ս��ѡ��
    elseif nBattleSegment == 3 then
        --��ս�������У�δ��������
        for i = 1, 3 do
            tremove(selTab, 1)
        end
        tremove(selTab, 2);    --ȥ������ս��ѡ��
    end

    --local nWeekly = tonumber(date('%w'));
    --if nWeekly == 0 or nWeekly == 6 then --LongDaiKa: t7 & cn ch� c� ct ph�o
        if nBattleSegment == 1 or nBattleSegment == 2 then -- 1,2: ctp 3,4: ctc
            if g_WCFG_NEWBATTLES_EMPLACEMENT:IsDateOpen() ~= WEnv.TRUE then
                tremove(selTab,3); --3= ph�o ��i
            end
            if g_WCFG_NEWBATTLES_RESOURCE:IsDateOpen() ~= WEnv.TRUE then
                tremove(selTab,2); --2= th�o c�c
            end
            if g_WCFG_NEWBATTLES_VILLAGE:IsDateOpen() ~= WEnv.TRUE then
                tremove(selTab,1); --1= th�n trang
            end
        end
   -- end

    Say("<color=green>" .. g_sNpcName .. "<color>: Xin ch�n chi�n tr��ng mu�n tham gia.", getn(selTab), selTab);
end;

function sign_up(nBattleType)
    --�ж�ս��ʱ������ҵȼ�
    if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: H�y tham gia ��nh gi� qu�n h�m, nh�n qu�n c�ng qu�n h�m tu�n n�y v� ��i m�i qu�n h�m. Sau �� ��n g�p ta.");
        return 0;
    end
    if not battle_CanSignUp(nBattleType) then
        return 0
    end
    local nLevel = GetLevel();
    local nBattleMapID = tBTMSInfo[nBattleType][2];
    local nCurCamp = BT_GetCurCamp();
    local nCurRank = BT_GetCurRank();
    if BT_GetData(PT_LAST_CAMP) ~= 0 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Ng��i ch�a nh�n ph�n th��ng l�n tr��c.");
        return 0;
    end ;
    if GetPKValue() >= 4 then
        --�������ܽ�ս��
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: T�i �c t�y tr�i kh�ng th� tham gia chi�n tr��ng!");
        return 0;
    end ;
    local nCamp = g_nNpcCamp;
    local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
    if nGlobalState == 0 then
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: ��i qu�n ch�a xu�t ph�t, luy�n t�p m�t th�i gian r�i h�y quay l�i.");
        return 0;
    end
    local nBattleSegment = mod(nGlobalState, 10);    --��ȡս����ǰ�����ĸ��׶�
    if nBattleSegment == 2 or nBattleSegment == 4 then
        if (nBattleType == MAINBATTLE_ID and g_WCFG_NEWBATTLES_MAIN.bDisableRegisterTimeLimit == WEnv.TRUE)
            or (nBattleType == EMPLACEMENT_ID and g_WCFG_NEWBATTLES_EMPLACEMENT.bDisableRegisterTimeLimit == WEnv.TRUE)
            or (nBattleType == RESOURCE_ID and g_WCFG_NEWBATTLES_RESOURCE.bDisableRegisterTimeLimit == WEnv.TRUE)
            or (nBattleType == VILLAGE_ID and g_WCFG_NEWBATTLES_VILLAGE.bDisableRegisterTimeLimit == WEnv.TRUE)
        then
        else -- g�c
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Tr�n chi�n �� di�n ra nh�ng ai ch�a tham gia vui l�ng ��i tr�n sau.");
            return 0;
        end
    end
    local nMaxPlayer, nPlayerDiff = 0, 0;
    local nCountCS = gf_GetPlayerRebornCount() * 100 + GetLevel()
    if nBattleType < 4 then
        if nCountCS < 592 then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Nh� h�n chuy�n sinh 5 c�p 92 kh�ng th� tham gia chi�n tr��ng ph�.");
            return 0;
        end
    else
        if nCountCS < 690 then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Nh� h�n chuy�n sinh 6 c�p 90 kh�ng th� tham gia chi�n tr��ng ch�nh.");
            return 0;
        end ;
    end ;
    if nBattleType == 4 then
        if GetReputation() < 4000 then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: B�n kh�ng �� 4000 �i�m danh v�ng �� b�o danh tham gia chi�n tr��ng ch�nh");
            return 0;
        end
    end
    --local sMedicineStr = "";
    --if nBattleType == VILLAGE_MAP_ID or nBattleType == EMPLACEMENT_MAP_ID then
    --sMedicineStr = "��ȷ�ϱ���<color=yellow>"..tBattleName[].."���������ѻ��";
    --end;
    local nLoopLeft = mf_GetMissionV(tBTMSInfo[nBattleType][1], MV_TIMER_LOOP, nBattleMapID);
    local nBattleState = mf_GetMissionV(tBTMSInfo[nBattleType][1], MV_BATTLE_STATE, nBattleMapID);
    local selTab = {
        "��ng �/#sign_up_confirm(" .. nBattleType .. ",0)",
        "Ta mu�n s� d�ng b�o danh VIP (kh�ng b� gi�i h�n s� ng��i ch�nh l�ch, ch� d�nh cho ng��i c� Qu�n h�m Nguy�n So�i, T��ng Qu�n phe " .. tCampNameZ[nCamp] .. "). L�u �: ph� b�o danh 99 v�ng! /#sign_up_confirm(" .. nBattleType .. ",1)",
        "Ta suy ngh� l�i!/nothing",
    }
    if nLoopLeft >= 24 and nBattleType == MAINBATTLE_ID and nBattleState == MS_STATE_READY then
        if nCurRank < 5 then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Th�i gian <color=yellow>3 ph�t <color>��u ch� cho ph�p <color=yellow>nh�ng ng��i c� Qu�n h�m T��ng Qu�n v� Nguy�n So�i<color> b�o danh.");
            return 0;
        end ;
        tremove(selTab, 1);
    else
        tremove(selTab, 2);
    end ;
    if g_nNpcCamp == SONG_ID then
        Say("<color=green>" .. g_sNpcName .. "<color>: <color=red>Ch� �: Th� c�ng s� bi�n m�t sau khi v�o chi�n tr��ng. <color>B�n mu�n gia nh�p <color=yellow>phe T�ng<color>?", getn(selTab), selTab);
    else
        Say("<color=green>" .. g_sNpcName .. "<color>: <color=red>Ch� �: Th� c�ng s� bi�n m�t sau khi v�o chi�n tr��ng. <color>B�n mu�n gia nh�p <color=yellow>phe Li�u<color>?", getn(selTab), selTab);
    end ;
end;

function sign_up_confirm_bk(nBattleType, nSignUpType)
    --�ж�ս��ʱ�䡢������������������
    local nCamp = g_nNpcCamp;
    local nCurCamp = BT_GetCurCamp();
    local nCurRank = BT_GetCurRank();
    local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
    nSignUpType = nSignUpType or 0;
    if nGlobalState == 0 then
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: ��i qu�n ch�a xu�t ph�t, luy�n t�p m�t th�i gian r�i h�y quay l�i.");
        return 0;
    end ;
    local nBattleSegment = mod(nGlobalState, 10);    --��ȡս����ǰ�����ĸ��׶�
    if nBattleSegment == 2 or nBattleSegment == 4 then
        if (nBattleType == MAINBATTLE_ID and g_WCFG_NEWBATTLES_MAIN.bDisableRegisterTimeLimit == WEnv.TRUE)
            or (nBattleType == EMPLACEMENT_ID and g_WCFG_NEWBATTLES_EMPLACEMENT.bDisableRegisterTimeLimit == WEnv.TRUE)
            or (nBattleType == RESOURCE_ID and g_WCFG_NEWBATTLES_RESOURCE.bDisableRegisterTimeLimit == WEnv.TRUE)
            or (nBattleType == VILLAGE_ID and g_WCFG_NEWBATTLES_VILLAGE.bDisableRegisterTimeLimit == WEnv.TRUE)
        then
        else -- g�c
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Tr�n chi�n �� di�n ra nh�ng ai ch�a tham gia vui l�ng ��i tr�n sau.");
            return 0;
        end
    end
    local nMaxPlayer, nPlayerDiff = SUB_BATTLE_SIGNUP_MAX_PLAYER, SUB_BATTLE_SIGNUP_PLAYER_DIFF;
    if nBattleType == MAINBATTLE_ID then
        nMaxPlayer = MAIN_BATTLE_SIGNUP_MAX_PLAYER;
        nPlayerDiff = MAIN_BATTLE_SIGNUP_PLAYER_DIFF;
    end ;
    local nCurPlayerCount = BT_GetSignUpPlayerCount(nBattleType, nCamp);
    local nOppositePlayerCount = BT_GetSignUpPlayerCount(nBattleType, SONGLIAO_ID - nCamp);
    if nCurPlayerCount >= nMaxPlayer then
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: Hi�n t�i chi�n tr��ng<color> �� ��y, m�i c�c anh h�ng ch�n chi�n tr��ng ho�c phe kh�c.");
        return 0;
    end ;
    if nSignUpType == 1 then
        if nCurRank < 5 then
            --�ȷ����Ͼ��β���ʹ�þ�����
            Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: Qu�n h�m c�a b�n hi�n t�i qu� th�p, kh�ng th� b�o danh VIP.");
            return 0;
        end ;
        if nCurCamp ~= g_nNpcCamp then
            Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: Ng��i � phe ��i ��ch c�ng mu�n b�o danh VIP sao?");
            return 0;
        end
        if GetCash() < 990000 then
            Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: V� anh h�ng n�y h�nh nh� kh�ng mang �� ng�n l��ng.");
            return 0;
        end
        Pay(990000)
    else
        if nCurPlayerCount - nOppositePlayerCount >= nPlayerDiff then
            Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: Hi�n s� ng��i T�ng-Li�u ��i b�n b�o danh ��t t�i �a <color=yellow>" .. nPlayerDiff .. " ng��i<color>, m�i c�c anh h�ng ch�n chi�n tr��ng ho�c phe kh�c");
            Msg2Player("S� ng��i hi�n t�i kho�ng " .. nPlayerDiff);
            return 0;
        end
        if nBattleType == MAINBATTLE_ID then
            if GetCash() < 100000 then
                Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: V� anh h�ng n�y h�nh nh� kh�ng mang �� ng�n l��ng �� ��ng g�p cho chi�n tr��ng ch�nh.");
                return 0;
            end
            Pay(100000)
            ModifyExp(1000000)
            Msg2Player("��i hi�p nh�n ���c 1000000 �i�m kinh nghi�m cho s� gan d� xung phong gi�t gi�c !!!")
        end
    end

    _w_BattleJoin_SignupCounting(nBattleType, nSignUpType); --LongDaiKa: qu�n l� ��m l��t ��ng k� tham gia

    battle_LogSignUp(nBattleType, nCamp)
    BT_SetData(PT_SIGN_UP, nBattleType * 10 + nCamp);
    BT_SetData(PT_BATTLE_DATE, tonumber(date("%y%m%d")) * 1000 + nGlobalState);
    BT_AddSignUpPlayerCount(nBattleType, nCamp);
    --WriteLogEx("Tong Lieu loai "..nBattleType, "Tham gia phe "..nCamp);
    gf_WriteLogEx("NEW TONG LIEU", "��ng k� th�nh c�ng", 1, "TL " .. nBattleType)
    if nCamp == SONG_ID then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: B�n �� b�o danh tham gia <color=yellow>phe T�ng<color>, xin chu�n b� ch� khai chi�n!");
    else
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: B�n �� b�o danh tham gia <color=yellow>phe Li�u<color>, xin chu�n b� ch� khai chi�n!");
    end ;
end;

function join_battle(nBattleType)
    if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: H�y tham gia ��nh gi� qu�n h�m, nh�n qu�n c�ng qu�n h�m tu�n n�y v� ��i m�i qu�n h�m. Sau �� ��n g�p ta.");
        return 0;
    end
    local nDate = tonumber(date("%y%m%d"));
    local nCamp = g_nNpcCamp
    local nCurCamp = BT_GetCurCamp();
    local nCurRank = BT_GetCurRank();
    local nSignUpTime = BT_GetData(PT_BATTLE_DATE);    --��ȡ��ұ���������һ��ս��
    local nSignUpInfo = BT_GetData(PT_SIGN_UP);        --��ȡ��ұ�����������ĸ�ս�����ķ�
    local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
    local nMaxPlayer = SUB_BATTLE_MAX_PLAYER;
    local nDiffPlayerCount = SUB_BATTLE_PLAYER_DIFF;
    if nGlobalState == 0 then
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: ��i qu�n ch�a xu�t ph�t, luy�n t�p m�t th�i gian r�i h�y quay l�i.");
        return 0;
    end ;
    if nDate * 1000 + nGlobalState - nSignUpTime > 1 then
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: Ng��i ch�a b�o danh kh�ng th� tham gia chi�n tr��ng.");
        return 0;
    end ;
    local nBattleType = BT_GetBattleType();
    local nCamp = mod(nSignUpInfo, 10);
    local nBattleMapID = tBTMSInfo[nBattleType][2];
    local nSongPlayerCount = BT_GetPlayerCount(nBattleType, SONG_ID);
    local nLiaoPlayerCount = BT_GetPlayerCount(nBattleType, LIAO_ID);
    local tPlayerCount = { nSongPlayerCount, nLiaoPlayerCount };
    if nBattleType == MAINBATTLE_ID then
        nMaxPlayer = MAIN_BATTLE_MAX_PLAYER;
        nDiffPlayerCount = MAIN_BATTLE_PLAYER_DIFF
    end ;
    local selTab = {
        "Mau ��a b�n t��ng v�o chi�n tr��ng (c�n 99 v�ng, kh�ng gi�i h�n s� ng��i ch�nh l�ch)/#join_battle_use_VIP_confirm(" .. nBattleType .. ")",
        "�� ta suy ngh� th�m/nothing",
    }
    if tPlayerCount[nCamp] >= nMaxPlayer then
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: Phe n�y �� c� <color=yellow>" .. nMaxPlayer .. "<color> ng��i, khi kh�c h�y quay l�i!");
        return 0;
    end ;
    if tPlayerCount[nCamp] - tPlayerCount[SONGLIAO_ID - nCamp] >= nDiffPlayerCount then
        if nCurRank >= 5 and nBattleType == MAINBATTLE_ID and nCurCamp == nCamp then
            Say("<color=green>" .. g_sNpcName .. "<color>: Binh l�c phe n�y �� ��, b�n c� th� <color=yellow>s� d�ng l�i �i VIP v�o chi�n tr��ng<color> ho�c ��i b�n ngo�i, hi�n s� ng��i 2 phe trong chi�n tr��ng l�: <color=yellow>T�ng [" .. nSongPlayerCount .. "]:[" .. nLiaoPlayerCount .. "] Li�u<color>.", getn(selTab), selTab);
            Msg2Player("S� ng��i hi�n t�i kho�ng " .. nDiffPlayerCount);
        else
            Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: Binh l�c phe n�y �� ��, B�ng h�u h�y quay l�i sau nh�! S� ng��i ��i b�n hi�n l�: <color=yellow>T�ng [" .. nSongPlayerCount .. "]:[" .. nLiaoPlayerCount .. "] Li�u<color>.");
            Msg2Player("S� ng��i hi�n t�i kho�ng " .. nDiffPlayerCount);
        end
        return 0;
    end
    BT_SetData(PT_BATTLE_TYPE, nBattleType);    --����nSignUpInfoҲ���Եõ�nBattleType�������ٱ���һ�λ᲻������أ�
    local Old_SubWorld = SubWorld;

    SubWorld = SubWorldID2Idx(nBattleMapID);
    JoinMission(tBTMSInfo[nBattleType][1], nCamp);
    SubWorld = Old_SubWorld;
    --cdkey
    SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", format("ck_global_set_task_finish(%d)", 1305 + nBattleType - 1));
    --book15
    if nBattleType == MAINBATTLE_ID then
        book15_DailyMissionComplete(10)
    elseif nBattleType == EMPLACEMENT_ID then
        book15_DailyMissionComplete(9)
    end
end;

function join_battle_use_VIP_confirm(nBattleType)
    if GetCash() < 990000 then
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: V� anh h�ng n�y h�nh nh� kh�ng mang �� ng�n l��ng.");
        return 0;
    end
    if Pay(990000) == 1 then
        BT_SetData(PT_BATTLE_TYPE, nBattleType);
        local Old_SubWorld = SubWorld;
        local nBattleMapID = tBTMSInfo[nBattleType][2];
        local nSignUpInfo = BT_GetData(PT_SIGN_UP)
        local nCamp = mod(nSignUpInfo, 10);
        SubWorld = SubWorldID2Idx(nBattleMapID);
        JoinMission(tBTMSInfo[nBattleType][1], nCamp);
        SubWorld = Old_SubWorld;
    end
end

function get_battle_book()
    if GetItemCount(tBattleItem[5][2], tBattleItem[5][3], tBattleItem[5][4]) == 0 then
        AddItem(tBattleItem[5][2], tBattleItem[5][3], tBattleItem[5][4], 1);
    else
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: Ch�ng ph�i ng��i c� quy�n s�ch sao?");
    end ;
end;

function battle_shouxian()
    local nValue = GetTask(701)
    if g_nNpcCamp == SONG_ID and nValue < 0 then
        -- �������귽���ܽ����ɷ�����
        Say("<color=green>" .. g_sNpcName .. "<color>: Ng��i kh�ng ph�i phe T�ng kh�ng th� nh�n qu�n h�m", 0)
    elseif g_nNpcCamp == LIAO_ID and nValue > 0 then
        -- ��Զ¥�����ܽ����η�����
        Say("<color=green>" .. g_sNpcName .. "<color>: Ng��i kh�ng ph�i phe Li�u kh�ng th� nh�n qu�n h�m", 0)
    else
        Say("<color=green>" .. g_sNpcName .. "<color>: N�u tu�n n�y ch�a tham gia qua chi�n tr��ng m� mu�n nh�n x�p h�ng qu�n c�ng ta ph�i tham gia nghi th�c trao qu�n h�m, c�n n�u ng��i ch�i �� tham gia qua s� m�c ��nh tham gia nh�n qu�n h�m, <color=yellow>21 gi� t�i th� 6 h�ng tu�n<color> c� h�nh nghi th�c trao qu�n h�m cho ng��i ch�i <color=yellow>online v� tham gia nh�n qu�n h�m<color>, nh�n xong ta c� th� <color=yellow>��ng nh�p l�i ho�c ��n ��y<color> nh�n qu�n h�m m�i nh�t.", 2, "Tham gia nh�n qu�n h�m/battle_shouxian_yes", "Kh�ng c�n/nothing")
    end
end

function battle_shouxian_yes()
    SetRankPoint(5, 701, 1)
    SetTask(TSK_TRANS_POINT_ALLOW, 1)
end

function update_cur_rank()
    CalcBattleRank()
    UpdateBattleMaxRank()
    Say("<color=green>" .. g_sNpcName .. "<color>: Qu�n h�m c�a ng��i �� ���c thay ��i.", 0)
end

function record_cur_rank()
    Say("<color=green>"..g_sNpcName.."<color>: X�t duy�t qu�n h�m v�nh vi�n l� th�ng k� s� tu�n b�n duy tr� ���c qu�n h�m, n�u t�ch l�y s� tu�n gi� qu�n h�m Nguy�n So�i ��t 15 l�n tr� l�n, b�n s� nh�n ���c Qu�n h�m Nguy�n So�i V�nh Vi�n, n�u s� tu�n duy tr� qu�n h�m T��ng + s� l�n duy tr� Nguy�n So�i >= 10 b�n c� th� nh�n ���c qu�n h�m T��ng Qu�n v�nh vi�n, s� tu�n duy tr� T��ng + So�i + Ti�n Phong >=10 s� nh�n ���c qu�n h�m Ti�n Phong V�nh Vi�n. S� h�u qu�n h�m v�nh vi�n s� c� th� trang b� t��ng �ng v�nh vi�n.",2,"Tham gia x�t duy�t t� c�ch/record_cur_rank_yes","R�i kh�i/nothing")
end

function record_cur_rank_yes()
    update_cur_rank()	-- ��i m�i l�i qu�n h�m
    local nBodyRecordWeek = GetTask(768)
    local nWeek = GetTask(763)
    if nBodyRecordWeek >= nWeek then
        Say("<color=green>"..g_sNpcName.."<color>: Ng�i �� tham gia x�t duy�t t� c�ch l�n n�y, t�nh h�nh duy tr� qu�n h�m hi�n t�i nh� sau:\n��t qu�n h�m Nguy�n So�i <color=green>"..GetTask(765).."<color> l�n, qu�n h�m T��ng Qu�n <color=green>"..GetTask(766).."<color> l�n, qu�n h�m Ti�n Phong <color=green>"..GetTask(767).."<color> l�n", 0)
        return
    end

    if nBodyRecordWeek < nWeek then
        SetTask(768, nWeek)
        local nRank = GetTask(704)
        if nRank == 6 or nRank == -6 then
            SetTask(765, GetTask(765)+1)
        elseif nRank == 5 or nRank == -5 then
            SetTask(766, GetTask(766)+1)
        elseif nRank == 4 or nRank == -4 then
            SetTask(767, GetTask(767)+1)
        end
        Say("<color=green>"..g_sNpcName.."<color>: Ng�i �� tham gia x�t duy�t t� c�ch l�n n�y, tri�u ��nh �� ghi ch�p l�i c�ng lao to c�a ng��i, t�nh h�nh duy tr� qu�n h�m hi�n t�i c�a ng�i nh� sau:\n��t qu�n h�m Nguy�n So�i <color=green>"..GetTask(765).."<color> l�n, qu�n h�m T��ng Qu�n <color=green>"..GetTask(766).."<color> l�n, qu�n h�m Ti�n Phong <color=green>"..GetTask(767).."<color> l�n", 0)
        WriteLog("[Chi�n tr��ng] player:"..GetName().." event:record rank Nguy�n So�i: "..GetTask(765).." T��ng Qu�n:"..GetTask(766).." Ti�n Phong:"..GetTask(767))
    end
end

function get_yongjiu_yuanshuai()
    if GetTask(765) >= 15 then
        Say("<color=green>"..g_sNpcName.."<color>: Ng�i �� l� Nguy�n So�i v�nh vi�n, kh�ng c�n tham gia ��nh gi� Nguy�n So�i v�nh vi�n", 0)
        return
    end

    SetRankPoint(5, 701, 1) -- Th�m v�o b�ng x�p h�ng qu�n c�ng
    local nValue = GetTask(701)
    if g_nNpcCamp == SONG_ID and nValue < 0 then
        Say("<color=green>"..g_sNpcName.."<color>: Ng��i phe Li�u kh�ng th� tham gia ��nh gi� qu�n h�m Nguy�n So�i v�nh vi�n phe T�ng", 0)
        return
    elseif g_nNpcCamp == LIAO_ID and nValue > 0 then
        Say("<color=green>"..g_sNpcName.."<color>: Ng��i phe T�ng kh�ng th� tham gia ��nh gi� qu�n h�m Nguy�n So�i v�nh vi�n phe Li�u", 0)
        return
    elseif abs(nValue) < 20e6 then
        Say("<color=green>"..g_sNpcName.."<color>: Qu�n c�ng c�a ng�i ch�a �� 20 tri�u, kh�ng th� tham gia ��nh gi� Nguy�n So�i V�nh Vi�n, khi qu�n c�ng ��t 20 tri�u c� th� ��n <color=yellow>Ti�u Ph��ng<color>-Phe T�ng ho�c <color=yellow>Ti�u Ng�c<color>-Phe Li�u �� ��nh gi�.", 0)
        return
    end

    SetTask(765, 15)
    WriteLog("[new battle] player="..GetName().." event=Nh�n ���c Nguy�n So�i v�nh vi�n("..GetTask(701)..")")

    local szCamp = ""
    local szSex = ""
    if nValue < 0 then
        szCamp = "��i Li�u"
    else
        szCamp = "��i T�ng"
    end

    if GetSex() == 1 then
        szSex = "Thi�u hi�p"
    elseif GetSex() == 2 then
        szSex = "N� hi�p"
    end

    Say("<color=green>"..g_sNpcName.."<color>:"..szSex.." t�n trung v� n��c, c�c cung t�n t�y, ��c bi�t khen t�ng danh hi�u Nguy�n So�i "..szCamp.." v�nh vi�n, th�ng c�o thi�n h�, d� �y qu�n t�m.", 0)
    AddGlobalNews("Ng��i ch�i "..GetName().." t�n trung v� n��c, c�c cung t�n t�y, ��c bi�t khen t�ng danh hi�u Nguy�n So�i"..szCamp.." v�nh vi�n, th�ng c�o thi�n h�, d� �y qu�n t�m")
end

tbJUNGONGZHANG = {
    -- [nType] = {"szQCCName", nG, nD, nP, nHonorRate, nExpRate, nBattlePointRate },
    [0] = { QCC_NAMES[QCC_NONE], 0, 0, 0, g_tbQCCBonusRateCfg[QCC_NONE].nHonorRate, g_tbQCCBonusRateCfg[QCC_NONE].nExpRate, g_tbQCCBonusRateCfg[QCC_NONE].nBattlePointRate },
    [1] = { QCC_NAMES[QCC_NORNAL], 2, 1, 9999, g_tbQCCBonusRateCfg[QCC_NORNAL].nHonorRate, g_tbQCCBonusRateCfg[QCC_NORNAL].nExpRate, g_tbQCCBonusRateCfg[QCC_NORNAL].nBattlePointRate },
    [2] = { QCC_NAMES[QCC_DAI], 2, 1, 9998, g_tbQCCBonusRateCfg[QCC_DAI].nHonorRate, g_tbQCCBonusRateCfg[QCC_DAI].nExpRate, g_tbQCCBonusRateCfg[QCC_DAI].nBattlePointRate },
    [3] = { QCC_NAMES[QCC_HUYHOANG], 2, 1, 9977, g_tbQCCBonusRateCfg[QCC_HUYHOANG].nHonorRate, g_tbQCCBonusRateCfg[QCC_HUYHOANG].nExpRate, g_tbQCCBonusRateCfg[QCC_HUYHOANG].nBattlePointRate },
    [4] = { QCC_NAMES[QCC_VINHDU], 2, 1, 30642, g_tbQCCBonusRateCfg[QCC_VINHDU].nHonorRate, g_tbQCCBonusRateCfg[QCC_VINHDU].nExpRate, g_tbQCCBonusRateCfg[QCC_VINHDU].nBattlePointRate },
};

function get_battle_award()
    local nLastCamp = BT_GetData(PT_LAST_CAMP);
    if nLastCamp == 0 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Mau �i tham gia chi�n tr��ng r�i ��n ��y l�nh th��ng!");
        return 0;
    end
    if g_nNpcCamp ~= nLastCamp then
        if nLastCamp == SONG_ID then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: L�n tr��c b�n �� tham gia phe <color=yellow>T�ng<color>, m�i ��n �i�m b�o danh l�nh th��ng!")
        else
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: L�n tr��c b�n �� tham gia phe <color=yellow>Li�u<color>, m�i ��n �i�m b�o danh l�nh th��ng!")
        end
        return 0;
    end
    local selTab = {
        format("D�ng %s (Ph�n th��ng qu�n c�ng g�p %d l�n, kinh nghi�m g�p %d l�n)/#get_battle_award_confirm(%d)", tbJUNGONGZHANG[1][1], tbJUNGONGZHANG[1][5], tbJUNGONGZHANG[1][6], 1),
        format("D�ng %s (Ph�n th��ng qu�n c�ng g�p %d l�n, kinh nghi�m g�p %d l�n)/#get_battle_award_confirm(%d)", tbJUNGONGZHANG[2][1], tbJUNGONGZHANG[2][5], tbJUNGONGZHANG[2][6], 2),
        format("D�ng %s (Ph�n th��ng qu�n c�ng g�p %d l�n, kinh nghi�m g�p %d l�n)/#get_battle_award_confirm(%d)", tbJUNGONGZHANG[3][1], tbJUNGONGZHANG[3][5], tbJUNGONGZHANG[3][6], 3),
        format("D�ng %s (Ph�n th��ng qu�n c�ng %d l�n, ph�n th��ng kinh nghi�m g�p %d l�n)/#get_battle_award_confirm(%d)", tbJUNGONGZHANG[4][1], tbJUNGONGZHANG[4][5], tbJUNGONGZHANG[4][6], 4),
        "Kh�ng d�ng/not_use_jungongzhang_confirm",
        "Ch�a mu�n nh�n th��ng/nothing",
    };
    local nPointAward = BT_GetData(PT_POINT_AWARD);
    local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
    local nExpAward = BT_GetData(PT_EXP_AWARD);
    local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
    local nLastBattle = BT_GetData(PT_LAST_BATTLE);
    local szSay = "";
    local nDate = tonumber(date("%y%m%d"));
    if nDate > BT_GetData(PT_GET_EXP_AWARD_DATE) then
        BT_SetData(PT_GET_EXP_AWARD_COUNT, 0);
    end ;
    local szExpAward = "M�i ng�y m�i ng��i ch� c� th� nh�n ph�n th��ng 1 l�n";
    local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
    if nGetExpAwardCount >= 1 and nLastBattle == MAINBATTLE_ID then
        --��������ù����齱��
        nExpAward = 0;
        szExpAward = "M�i ng�y m�i ng��i ch� c� th� nh�n ph�n th��ng 1 l�n, <color=yellow>h�m nay b�n �� nh�n qua ph�n th��ng<color>.";
    end
    if nLastBattle ~= MAINBATTLE_ID then
        --�����Сս��
        local nChargeType = BT_CheckCharge(nLastCamp)
        if nChargeType > 0 then
            if nChargeType > 4 then
                nChargeType = nChargeType - 4;
            end
            if nChargeType == nLastBattle then
                nExpAward = nExpAward * 2;
            end
        end
    end
    if IB_VERSION == 1 then
        --�����IB�汾
        szSay = "Ph�n th��ng kinh nghi�m l�n tr��c b�n nh�n l� <color=yellow>" .. nExpAward .. " �i�m<color>, " .. szExpAward .. " ph�n th��ng t�ch l�y l� <color=yellow>" .. nPointAward .. " �i�m<color> t�ch l�y, <color=yellow>" .. nJunGongAward .. " �i�m<color> qu�n c�ng. <color=yellow>B�n c� th� d�ng qu�n c�ng ch��ng �� nh�n ��i ph�n th��ng qu�n c�ng v� ph�n th��ng kinh nghi�m<color>.";
    else
        szSay = "Ph�n th��ng kinh nghi�m l�n tr��c b�n nh�n l� <color=yellow>" .. nExpAward .. " �i�m<color>, " .. szExpAward .. ", c� th� chuy�n <color=yellow>" .. nGoldenExpAward .. " �i�m<color> s�c kh�e th�nh �i�m kinh nghi�m, ph�n th��ng t�ch l�y l� <color=yellow>" .. nPointAward .. " �i�m<color> t�ch l�y, <color=yellow>" .. nJunGongAward .. " �i�m<color> qu�n c�ng. <color=yellow>B�n c� th� d�ng qu�n c�ng ch��ng �� nh�n ��i ph�n th��ng qu�n c�ng<color>."
    end

    Say("<color=green>" .. g_sNpcName .. "<color>: " .. szSay, getn(selTab), selTab);
end

function get_battle_award_confirm(nType)
    local nCurCamp = BT_GetCurCamp();
    local nLastCamp = BT_GetData(PT_LAST_CAMP);
    if nLastCamp ~= nCurCamp then
        Talk(1, "get_battle_award", "<color=green>" .. g_sNpcName .. "<color>: Ng��i tham gia chi�n tr��ng phe c�a ��i ph��ng, kh�ng th� d�ng Qu�n C�ng Ch��ng/��i Qu�n C�ng Ch��ng/Huy Ho�ng Qu�n C�ng Ch��ng/Vinh D� Qu�n C�ng Ch��ng, h�y ch�n d�ng kh�ng d�ng Qu�n C�ng Ch��ng �� nh�n th��ng.");
        return 0;
    end ;
    local selTab = {
        format("��ng/#get_all_award(%d)", nType),
        "Sai/nothing",
    }
    Say("<color=green>" .. g_sNpcName .. "<color>: Ng��i mu�n s� d�ng <color=yellow>" .. tbJUNGONGZHANG[nType][1] .. "<color>?", getn(selTab), selTab);
end;

function get_all_award(nType)-- h�m g�c
    local nExpBefore = WPlayer:GetExp();
    local nHonorBefore = WPlayer:GetHonor(1);
    local nPointBefore = WPlayer:GetBattlePoint();

    local nPointAward = floor(BT_GetData(PT_POINT_AWARD) * tbJUNGONGZHANG[nType][7]);
    local nJunGongAward = floor(BT_GetData(PT_JUNGONG_AWARD) * tbJUNGONGZHANG[nType][5]);
    local nExpAward = floor(BT_GetData(PT_EXP_AWARD) * tbJUNGONGZHANG[nType][6]);
    local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
    local nLastCamp = BT_GetData(PT_LAST_CAMP);
    local nLastBattle = BT_GetData(PT_LAST_BATTLE);
    local nLastResult = BT_GetData(PT_LAST_RESULT);
    local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
    local nTimePassed = GetTime() - nSpyClothTime;

    if gf_JudgeRoomWeight(3, 30) ~= 1 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: H�nh trang c�a b�n kh�ng �� ch� tr�ng!");
        return 0;
    end ;

    if nType ~= 0 then
        if nTimePassed <= ITEM_SPYCLOTH_TIME then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Hi�u qu� m�t n� Gi�n �i�p c�a b�n v�n c�n, kh�ng th� s� d�ng ph�n th��ng qu�n c�ng nh�n ph�n th��ng. Th�i gian s� d�ng m�t n� Gi�n �i�p: <color=yellow>" .. tf_GetTimeString(ITEM_SPYCLOTH_TIME - nTimePassed) .. "<color>.")
            return 0
        end
        if DelItem(tbJUNGONGZHANG[nType][2], tbJUNGONGZHANG[nType][3], tbJUNGONGZHANG[nType][4], 1) == 1 then
            FireEvent("event_ib_cost",tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1);
        else
            Talk(1, "get_battle_award", "<color=green>" .. g_sNpcName .. "<color>: Ng��i kh�ng mang theo <color=yellow>" .. tbJUNGONGZHANG[nType][1] .. "<color> th� ph�i!")
            return 0
        end
    end

    --===========
    --��������� ��ֹ����콱
    BT_SetData(PT_POINT_AWARD, 0);
    BT_SetData(PT_JUNGONG_AWARD, 0);
    BT_SetData(PT_EXP_AWARD, 0);
    BT_SetData(PT_GOLDENEXP_AWARD, 0);
    BT_SetData(PT_LAST_CAMP, 0);
    BT_SetData(PT_SPYCLOTH_TIME, 0)
    BT_SetData(PT_LAST_BATTLE, 0);

    local nDate = tonumber(date("%y%m%d"));
    if nDate > BT_GetData(PT_GET_EXP_AWARD_DATE) then
        BT_SetData(PT_GET_EXP_AWARD_COUNT, 0);
    end

    local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
    if nLastBattle ~= MAINBATTLE_ID then
        --�����Сս��
        local nChargeType = BT_CheckCharge(nLastCamp)
        if nChargeType > 0 then
            if nChargeType > 4 then
                nChargeType = nChargeType - 4
            end
            if nChargeType == nLastBattle then
                nExpAward = nExpAward * 2
            end
        end
        --< Added by SunZhuoshi
        HBRewardInSmallBattleField();
        -->
        ModifyExp(nExpAward);
        Msg2Player("B�n nh�n ���c " .. nExpAward .. " �i�m kinh nghi�m");
        --����vip��
        _vc_JoinSmallBattle();
    else
        --��ս������
        --< Added by SunZhuoshi
        HBRewardInBigBattleField();
        -->
        if nGetExpAwardCount < 1 then
            --�����ȡ��ս����������С��1
            ModifyExp(nExpAward);
            Msg2Player("B�n nh�n ���c " .. nExpAward .. " �i�m kinh nghi�m");
            --ModifyExp(5000000); --LongDaiKa: mod b� th��ng th�m exp
            --Msg2Player("B�n nh�n th�m ���c 5000000 �i�m kinh nghi�m");
            BT_SetData(PT_GET_EXP_AWARD_COUNT, nGetExpAwardCount + 1);
            BT_SetData(PT_GET_EXP_AWARD_DATE, nDate);
        else
            nExpAward = 0;
            Msg2Player("H�m nay b�n �� nh�n 1 l�n ph�n th��ng kinh nghi�m, m�i ng�y ch� c� th� nh�n 1 l�n");
        end
        --nhi�m v� l�m gi�u
        if CFG_NhiemVuLamGiau == 1 then
            if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 10) == 0 then
                gf_SetTaskBit(TSK_LAMGIAU, 10, 1, 0)
                TaskTip("Ho�n th�nh nhi�m v� l�m gi�u: Ho�n th�nh nhi�m v� Nh�n M�n R�c L�a.")
            end
        end
        --����vip��
        _vc_JoinBigbattle();
    end
    -----------------------Chu�i nhi�m v� ��ng H�nh
    if CFG_NhiemVuDongHanh == 1 then
        if nLastBattle == VILLAGE_ID then
            if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 5 then
                DongHanh_SetStatus()
            end
        end
        if nLastBattle == RESOURCE_ID then
            if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 6 then
                DongHanh_SetStatus()
            end
        end
        if nLastBattle == EMPLACEMENT_ID then
            if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 7 then
                DongHanh_SetStatus()
            end
        end
        if nLastBattle == MAINBATTLE_ID then
            if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 8 then
                DongHanh_SetStatus()
            end
        end
    end
    -- Խ��2008 5.1 �����
    local is_main_batter = (nLastBattle == MAINBATTLE_ID) or 0;
    local is_winner = (nLastCamp == nLastResult) or 0
    viet_51_battle_award(is_main_batter, is_winner);

    --��������
    AwardZhenQi_ZhanChang(is_main_batter, is_winner)

    if IB_VERSION ~= 1 then
        --������շѰ汾�����ӽ���ת���齱��
        gf_GoldenExp2Exp(nGoldenExpAward);
    end
    BT_SetData(PT_TOTALPOINT, BT_GetData(PT_TOTALPOINT) + nPointAward);
    SetRankPoint(RANK_BATTLE_POINT, BATTLE_OFFSET + PT_TOTALPOINT, 1);    --ִ��SetRankPoint��˥������
    Msg2Player("B�n nh�n ���c " .. nPointAward .. " �i�m t�ch l�y chi�n tr��ng");
    if nTimePassed <= ITEM_SPYCLOTH_TIME then
        nJunGongAward = 0;
        Msg2Player("Hi�u qu� m�t n� Gi�n �i�p: B�n kh�ng nh�n ���c qu�n c�ng");
    end
    local nCurRankPoint = BT_GetData(PT_RANKPOINT);    --��ȡ˥����ľ���
    if nLastCamp == SONG_ID then
        BT_SetData(PT_RANKPOINT, nCurRankPoint + nJunGongAward);
    else
        BT_SetData(PT_RANKPOINT, nCurRankPoint - nJunGongAward);
    end
    SetRankPoint(RANK_BATTLE_CONTRIBUTION, BATTLE_OFFSET + PT_RANKPOINT, 1);
    Msg2Player("B�n nh�n ���c " .. tCampNameZ[nLastCamp] .. " Ph��ng " .. nJunGongAward .. " �i�m c�ng tr�ng");
    local tMocRuong = {
        [0] = { "Kh�ng", 1 },
        [1] = { "Qu�n C�ng Ch��ng", 2 },
        [2] = { "Qu�n C�ng ��i", 4 },
        [3] = { "Qu�n C�ng Huy Ho�ng", 8 },
        [4] = { "Qu�n C�ng Vinh D�", 16 },
    };
    gf_AddItemEx2({ 2, 1, 30340, tMocRuong[nType][2] }, "M�c R��ng lo�i " .. tMocRuong[nType][1], "Th�n T�i B�o R��ng", "T�ng Li�u", 0, 1)
    --���ֹ�ѫ
    if nLastBattle ~= MAINBATTLE_ID then
        --�����Сս��
        merit_SmallBattle(is_winner, nType);
    else
        merit_BigBattle(is_winner, nType);
    end
    local nResult
    if nLastResult == ALL_ID then
        nResult = 0
    elseif nLastResult == nLastCamp then
        nResult = 1
    else
        nResult = 2
    end
    local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
    local bUseSpyCloth = WEnv.FALSE;
    if nTimePassed <= ITEM_SPYCLOTH_TIME then
        bUseSpyCloth = WEnv.TRUE;
    end
    WAward:ChienTruong_NhanMonQuan(nLastBattle, nResult, nType, nGetExpAwardCount, bUseSpyCloth);
    FireEvent("event_mission_award", "newbattle", nType, nResult, nLastBattle);

    local tbLogTitle = {
        [0] = "unknow",
        [VILLAGE_ID] = g_WCFG_NEWBATTLES_VILLAGE.szKey,
        [RESOURCE_ID] = g_WCFG_NEWBATTLES_RESOURCE.szKey,
        [EMPLACEMENT_ID] = g_WCFG_NEWBATTLES_EMPLACEMENT.szKey,
        [MAINBATTLE_ID] = g_WCFG_NEWBATTLES_MAIN.szKey,
        [PRIMARY_MAINBATTLE_ID] = "newbattles_primary_main",
    };
    WPlayerLog:WriteBattleLog(tbLogTitle[nType], "newbattle award is_winner=" .. is_winner, nType, QCC_NAMES[nType], nExpBefore, nExpAward, nHonorBefore, nJunGongAward, nPointBefore, nPointAward);
end

function get_all_award_new_mod(nType)
    local nPointAward = BT_GetData(PT_POINT_AWARD);
    local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
    local nExpAward = BT_GetData(PT_EXP_AWARD);
    local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
    local nLastCamp = BT_GetData(PT_LAST_CAMP);
    local nLastBattle = BT_GetData(PT_LAST_BATTLE);
    local nLastResult = BT_GetData(PT_LAST_RESULT);
    local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
    local nTimePassed = GetTime() - nSpyClothTime;

    if WLib:CheckInv(3, 30) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    if nType ~= 0 then
        if nTimePassed <= ITEM_SPYCLOTH_TIME then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Hi�u qu� m�t n� Gi�n �i�p c�a b�n v�n c�n, kh�ng th� s� d�ng ph�n th��ng qu�n c�ng nh�n ph�n th��ng. Th�i gian s� d�ng m�t n� Gi�n �i�p: <color=yellow>" .. tf_GetTimeString(ITEM_SPYCLOTH_TIME - nTimePassed) .. "<color>.")
            return 0
        end
        if DelItem(tbJUNGONGZHANG[nType][2], tbJUNGONGZHANG[nType][3], tbJUNGONGZHANG[nType][4], 1) == 1 then
            FireEvent("event_ib_cost",tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1);
        else
            Talk(1, "get_battle_award", "<color=green>" .. g_sNpcName .. "<color>: Ng��i kh�ng mang theo <color=yellow>" .. tbJUNGONGZHANG[nType][1] .. "<color> th� ph�i!")
            return 0
        end
    end

    WTask:ResetDaily();

    if nLastBattle ~= MAINBATTLE_ID then
        --< Added by SunZhuoshi
        HBRewardInSmallBattleField();
        -->
        --����vip��
        _vc_JoinSmallBattle();
    else
        --��ս������
        --< Added by SunZhuoshi
        HBRewardInBigBattleField();
        -->
        --nhi�m v� l�m gi�u
        if CFG_NhiemVuLamGiau == 1 then
            if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 10) == 0 then
                gf_SetTaskBit(TSK_LAMGIAU, 10, 1, 0)
                TaskTip("Ho�n th�nh nhi�m v� l�m gi�u: Ho�n th�nh nhi�m v� Nh�n M�n R�c L�a.")
            end
        end
        --����vip��
        _vc_JoinBigbattle();
    end ;
    -----------------------Chu�i nhi�m v� ��ng H�nh
    if CFG_NhiemVuDongHanh == 1 then
        if nLastBattle == VILLAGE_ID then
            if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 5 then
                DongHanh_SetStatus()
            end
        end
        if nLastBattle == RESOURCE_ID then
            if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 6 then
                DongHanh_SetStatus()
            end
        end
        if nLastBattle == EMPLACEMENT_ID then
            if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 7 then
                DongHanh_SetStatus()
            end
        end
        if nLastBattle == MAINBATTLE_ID then
            if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 8 then
                DongHanh_SetStatus()
            end
        end
    end
    -- Խ��2008 5.1 �����
    local is_main_batter = (nLastBattle == MAINBATTLE_ID) or 0;
    local is_winner = (nLastCamp == nLastResult) or 0
    viet_51_battle_award(is_main_batter, is_winner);
    --��������
    AwardZhenQi_ZhanChang(is_main_batter, is_winner);
    SetRankPoint(RANK_BATTLE_CONTRIBUTION, BATTLE_OFFSET + PT_RANKPOINT, 1);
    --���ֹ�ѫ
    if nLastBattle ~= MAINBATTLE_ID then
        --�����Сս��
        merit_SmallBattle(is_winner, nType);
    else
        merit_BigBattle(is_winner, nType);
    end

    local nResult = WEnv.BATTLERESULT_DRAW;
    if nLastResult == nLastCamp then
        nResult = WEnv.BATTLERESULT_WIN;
    else
        nResult = WEnv.BATTLERESULT_LOSE;
    end
    local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
    local bUseSpyCloth = WEnv.FALSE;
    if nTimePassed <= ITEM_SPYCLOTH_TIME then
        bUseSpyCloth = WEnv.TRUE;
    end
    if WAward:ChienTruong_NhanMonQuan(nLastBattle, nResult, nType, nGetExpAwardCount, bUseSpyCloth) == WEnv.RETCODE_SUCCESS then
        BT_SetData(PT_GET_EXP_AWARD_COUNT, nGetExpAwardCount + 1);
        BT_SetData(PT_GET_EXP_AWARD_DATE, WDate:Today());

        --��������� ��ֹ����콱
        BT_SetData(PT_POINT_AWARD, 0);
        BT_SetData(PT_JUNGONG_AWARD, 0);
        BT_SetData(PT_EXP_AWARD, 0);
        BT_SetData(PT_GOLDENEXP_AWARD, 0);
        BT_SetData(PT_LAST_CAMP, 0);
        BT_SetData(PT_SPYCLOTH_TIME, 0)
        BT_SetData(PT_LAST_BATTLE, 0);
    end
    FireEvent("event_mission_award", "newbattle", nType, nResult, nLastBattle)
end

function not_use_jungongzhang_confirm()
    local selTab = {
        "S� d�ng qu�n c�ng ch��ng/get_battle_award",
        "Kh�ng mu�n d�ng qu�n c�ng n�o h�t/#not_use_jungongzhang_confirm2(0)",
    }
    Say("<color=green>" .. g_sNpcName .. "<color>: Ng��i kh�ng d�ng qu�n c�ng ch��ng sao?", getn(selTab), selTab);
end;

function not_use_jungongzhang_confirm2()
    local nCurCamp = BT_GetCurCamp();
    local nLastCamp = BT_GetData(PT_LAST_CAMP);
    local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
    local nTimePassed = GetTime() - nSpyClothTime;
    if nLastCamp == nCurCamp or nTimePassed <= ITEM_SPYCLOTH_TIME then
        --����μӵ��Ǳ�����Ӫ����װ������Чʱ����
        get_all_award(0);
        return 0;
    end ;
    local selTab = {
        "��ng �/#get_all_award(0)",
        "Tho�t/nothing",
    }
    Say("<color=green>" .. g_sNpcName .. "<color>: B�n tham gia chi�n tr��ng phe ��i ph��ng, tr�c ti�p nh�n th��ng s� b� kh�u tr� �i�m qu�n c�ng, c� th� s� d�ng <color=yellow>m�t n� Gi�n �i�p<color> l�m qu�n c�ng b�n b� kh�u tr� th�nh 0. N�u b�n v�n mu�n nh�n ph�n th��ng h�y ch�n x�c nh�n, n�u b�n mu�n suy ngh� th�m hay ch�n R�i kh�i.", getn(selTab), selTab);
end;

function assess_rank()
    local selTab = {
        --"Ta mu�n tham gia x�t duy�t t� c�ch qu�n h�m v�nh vi�n l�n n�y/record_cur_rank", --LongDaiKa: ��ng qu�n h�m v�nh vi�n
        "Ta mu�n nh�n qu�n h�m qu�n c�ng tu�n n�y/battle_shouxian",
        "��i m�i qu�n h�m/update_cur_rank",
        --"Qu�n c�ng c�a ta �� ��t 20 tri�u, ta mu�n tham gia ��nh gi� Nguy�n So�i v�nh vi�n/get_yongjiu_yuanshuai", --LongDaiKa: ��ng qu�n h�m v�nh vi�n
        "Quay l�i n�i dung tr��c./main",
        "K�t th�c ��i tho�i/nothing",
    }
    Say("<color=green>" .. g_sNpcName .. "<color>: Ng��i mu�n tham gia trao qu�n h�m tu�n n�y �?", getn(selTab), selTab);
end;

function battle_regular_award()
    local selTab = {
        "��i trang b� chi�n tr��ng/BTA_Main",
        "Ta mu�n ��i 100000 �i�m t�ch l�y l�y H� y c�a T�ng Ki�m c�p 70/want_cangjian_equip",
        "Ta mu�n ��i 30000 �i�m t�ch l�y l�y L�nh b�i bang h�i/want_ling_pai",
        "Ta mu�ni 1000 �i�m t�ch l�y l�y �i�m kinh nghi�m/want_exp_award",
        "Quay l�i n�i dung tr��c./main",
        "K�t th�c ��i tho�i/nothing",
    }
    if IB_VERSION == 1 then
        --IB�汾û�л��ֻ�װ�������顢�������ƽ���
        tremove(selTab, 2);
        tremove(selTab, 3);
        --		tremove(selTab,2);
    end ;
    Say("<color=green>" .. g_sNpcName .. "<color>: Ng��i mu�n ��i ph�n th��ng n�o?", getn(selTab), selTab);
end;

function want_ling_pai()
    local selTab = {
        "��ng �/give_ling_pai",
        "H�y b�/nothing",
    }
    Say("<color=green>" .. g_sNpcName .. "<color>: ��i <color=yellow>L�nh b�i bang h�i<color> c�n <color=yellow>30000 �i�m t�ch l�y<color>, b�n x�c nh�n mu�n ��i?", getn(selTab), selTab);
end;

function give_ling_pai()
    local nCurPoint = BT_GetData(PT_TOTALPOINT);
    local nNeedPoint = 30000;
    if nCurPoint < nNeedPoint then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Xin l�i! �i�m t�ch l�y c�a b�n kh�ng �� ");
        return 0;
    end ;
    if gf_JudgeRoomWeight(1, 30) ~= 1 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: H�nh trang c�a b�n kh�ng �� ch� tr�ng!");
        return 0;
    end ;
    BT_SetData(PT_TOTALPOINT, nCurPoint - nNeedPoint);
    local nRetCode = AddItem(2, 0, 125, 1);
    if nRetCode == 1 then
        Msg2Player("B�n �� ��i m�t L�nh b�i bang h�i");
        WriteLog("[ph�n th��ng chi�n tr�n]:" .. GetName() .. " �� ��i m�t l�nh b�i bang h�i");
    else
        WriteLog("[ph�n th��ng b� l�i]" .. GetName() .. "Khi ��i l�nh b�i bang h�i AddItem b�o l�i, nRetCode:" .. nRetCode);
    end ;
end;

function want_cangjian_equip()
    local selTab = {
        "��ng �/give_cangjian_equip",
        "H�y b�/nothing",
    }
    Say("<color=green>" .. g_sNpcName .. "<color>: Mu�n ��i <color=yellow>H� y T�ng Ki�m c�p 70<color> c�n <color=yellow>100000 �i�m t�ch l�y<color>, b�n x�c nh�n mu�n ��i?", getn(selTab), selTab);
end;

function give_cangjian_equip()
    local nCurPoint = BT_GetData(PT_TOTALPOINT);
    local nNeedPoint = 100000;
    if nCurPoint < nNeedPoint then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Xin l�i! �i�m t�ch l�y c�a b�n kh�ng �� ");
        return 0;
    end ;
    if gf_JudgeRoomWeight(1, 100) ~= 1 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: H�nh trang c�a b�n kh�ng �� ch� tr�ng!");
        return 0;
    end ;
    if gf_CheckPlayerRoute() ~= 1 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: B�n ph�i gia nh�p m�n ph�i m�i c� th� ��i H� y T�ng Ki�m");
        return 0;
    end ;
    local nRoute = GetPlayerRoute();
    local nBody = GetBody();
    local nNum = nRoute * 100 + 70 + nBody;
    BT_SetData(PT_TOTALPOINT, nCurPoint - nNeedPoint);
    local nRetCode = AddItem(0, 101, nNum, 1, 1, -1, -1, -1, -1, -1, -1);
    if nRetCode == 1 then
        Msg2Player("B�n ��i " .. nNeedPoint .. " �i�m t�ch l�y l�y 1 H� y T�ng Ki�m c�p 70");
        WriteLog("[ph�n th��ng chi�n tr�n]:" .. GetName() .. " ��i l�y H� y T�ng Ki�m c�p 70");
    else
        WriteLog("[ph�n th��ng b� l�i]" .. GetName() .. "��i l�y H� y T�ng Ki�m c�p 70 AddItem b�o l�i, nRetCode:" .. nRetCode);
    end ;
end;

function want_exp_award()
    local nCurPoint = BT_GetData(PT_TOTALPOINT);
    local nNeedPoint = 1000;
    local nLevel = GetLevel();
    if nLevel < 40 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Xin l�i! Nh�n v�t d��i c�p <color=yellow>40<color> kh�ng th� ��i ph�n th��ng kinh nghi�m");
        return 0;
    end ;
    local nDate = tonumber(date("%y%m%d"));
    if nDate > BT_GetData(PT_EXCHANGE_EXP_DATE) then
        BT_SetData(PT_EXCHANGE_EXP_COUNT, 0);
    end ;
    local nCurCount = BT_GetData(PT_EXCHANGE_EXP_COUNT);
    if nCurCount >= 20 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Xin l�i! H�m nay b�n �� nh�n <color=yellow>20<color> l�n ph�n th��ng �i�m kinh nghi�m, m�i ng�y ch� c� th� ��i �i�m t�ch l�y l�y �i�m kinh nghi�m 20 l�n");
        return 0;
    end ;
    if nCurPoint < nNeedPoint then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Xin l�i! �i�m t�ch l�y c�a b�n kh�ng �� ");
        return 0;
    end ;
    local nExpAward = floor((((nLevel ^ 2) / 1600) ^ 2) * 20000);
    nCurCount = nCurCount + 1;
    BT_SetData(PT_TOTALPOINT, nCurPoint - nNeedPoint);
    BT_SetData(PT_EXCHANGE_EXP_COUNT, nCurCount);
    BT_SetData(PT_EXCHANGE_EXP_DATE, nDate);
    ModifyExp(nExpAward);
    Msg2Player("B�n ��i " .. nNeedPoint .. " �i�m t�ch l�y ��i l�y " .. nExpAward .. " �i�m kinh nghi�m, ��y l� l�n ��i �i�m kinh nghi�m th� " .. nCurCount .. ".");
    WriteLog("[ph�n th��ng chi�n tr�n]:" .. nLevel .. "-(c�p):" .. GetName() .. " �� d�ng �i�m t�ch l�y ��i" .. nExpAward .. " �i�m kinh nghi�m");
end;

function change_camp()
    local nDate = tonumber(date("%y%m%d"));
    if nDate > 070920 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Th�i gian ��i phe mi�n ph� �� qua, c�c v� ��i hi�p h�y c�n tr�ng khi ch�n phe!");
        return 0;
    end ;
    if BT_GetData(PT_CHANGE_CAMP_COUNT) >= MAX_CHANGE_CAMP then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: B�n �� ��i qu�n c�ng <color=yellow>" .. MAX_CHANGE_CAMP .. "<color> l�n, kh�ng th� ��i ti�p.");
        return 0;
    end ;
    local selTab = {
        "T�ng/#change_camp_confirm(1)",
        "Li�u/#change_camp_confirm(2)",
        "Ta suy ngh� l�i/nothing",
    }
    local nJunGong = BT_GetData(PT_RANKPOINT);
    local szStr = "";
    if nJunGong < 0 then
        szStr = "B�n �ang thu�c phe Li�u, qu�n c�ng hi�n t�i:" .. abs(nJunGong) .. ".";
    elseif nJunGong > 0 then
        szStr = "B�n �ang thu�c phe T�ng, qu�n c�ng hi�n t�i:" .. abs(nJunGong) .. ".";
    else
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Qu�n c�ng hi�n t�i c�a b�n l� 0, kh�ng c�n ph�i chuy�n qu�n c�ng.");
        return 0;
    end ;
    local nChangeCampCount = BT_GetData(PT_CHANGE_CAMP_COUNT);
    Say("<color=green>" .. g_sNpcName .. "<color>: " .. szStr .. "Ng��i mu�n c�ng hi�n cho phe n�o? <color=yellow>Tr��c 20/9<color> ta c� th� gi�p ng��i ��i qu�n c�ng mi�n ph� 3 l�n. Hi�n gi� ng��i c� th� chuy�n ��i qu�n c�ng <color=yellow>" .. (MAX_CHANGE_CAMP - nChangeCampCount) .. "<color> l�n.", getn(selTab), selTab);
end;

function change_camp_confirm(nCamp)
    local nJunGong = BT_GetData(PT_RANKPOINT);
    local szStr = "";
    local nChangeCampCount = BT_GetData(PT_CHANGE_CAMP_COUNT);
    if nJunGong <= 0 then
        if nCamp == LIAO_ID then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Ng��i �� l� T��ng s� phe Li�u, kh�ng c�n chuy�n ��i qu�n c�ng!");
            return 0;
        end ;
        szStr = "B�n �� ��i sang phe T�ng, qu�n c�ng c�a b�n l�: <color=yellow>" .. abs(nJunGong) .. "<color>. B�n c�n <color=yellow>" .. (MAX_CHANGE_CAMP - nChangeCampCount - 1) .. "<color> l�n ��i phe mi�n ph�";
    elseif nJunGong > 0 then
        if nCamp == SONG_ID then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Ng��i �� l� T��ng s� phe T�ng, kh�ng c�n chuy�n ��i qu�n c�ng!");
            return 0;
        end ;
        szStr = "B�n �� ��i sang phe Li�u, qu�n c�ng c�a b�n l�: <color=yellow>" .. abs(nJunGong) .. "<color>. B�n c�n <color=yellow>" .. (MAX_CHANGE_CAMP - nChangeCampCount - 1) .. "<color> l�n ��i phe mi�n ph�";
    end ;
    BT_SetData(PT_RANKPOINT, -nJunGong);
    BT_SetData(PT_CHANGE_CAMP_COUNT, nChangeCampCount + 1);
    Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: " .. szStr);
end;


function get_lost_jungong()
    local selTab = {
        "��ng v�y, ta mu�n chu�c l�i/ask_for_jungong",
        "Ta suy ngh� th�m m�t ch�t/nothing",
    }
    local nLostJunGong = BT_GetData(PT_DEATH_LOST_JUNGONG);
    Say("T�ng qu�n c�ng ng�i t�n th�t hi�n l� <color=yellow>"..nLostJunGong.."<color> �i�m, m�i qu�n c�ng ch��ng <color=yellow>c� th� chu�c l�i 1000 �i�m qu�n c�ng<color>, ng�i x�c ��nh mu�n chu�c l�i sao",getn(selTab),selTab);
end;

function ask_for_jungong()
    local nLostJunGong = BT_GetData(PT_DEATH_LOST_JUNGONG);
    if nLostJunGong == 0 then
        Talk(1,"","Hi�n ng�i kh�ng c� qu�n c�ng b� t�n th�t, kh�ng c�n chu�c l�i.");
        return 0;
    end;
    AskClientForNumber("ask_for_jungong_callback",1,nLostJunGong,"Ng�i mu�n chu�c bao nhi�u qu�n c�ng?");
end;

function ask_for_jungong_callback(nJunGong)
    local nLostJunGong = BT_GetData(PT_DEATH_LOST_JUNGONG);
    if nJunGong > nLostJunGong or nJunGong == 0 then
        return 0;
    end;
    local nNeedItemNum = ceil(nJunGong/1000);
    local selTab = {
        "��ng v�y, ta x�c ��nh chu�c l�i/#get_lost_jungong_confirm("..nJunGong..")",
        "T�m kh�ng chu�c/noting",
    }
    Say("Ng�i x�c ��nh chu�c l�i <color=yellow>"..nJunGong.."<color> �i�m qu�n c�ng sao? C�n t�n <color=yellow>"..nNeedItemNum.."<color> Qu�n C�ng Ch��ng.",getn(selTab),selTab);
end;

function get_lost_jungong_confirm(nJunGong)
    local nNeedItemNum = ceil(nJunGong/1000);
    local nLostJunGong = BT_GetData(PT_DEATH_LOST_JUNGONG);
    if nJunGong > nLostJunGong then
        return 0;
    end;
    local nCurCamp = BT_GetCurCamp();
    if DelItem(2,1,9999,nNeedItemNum) == 1 then
        if nCurCamp == SONG_ID then
            BT_SetData(PT_RANKPOINT,BT_GetData(PT_RANKPOINT)+nJunGong);
            Msg2Player("Ng��i s� d�ng "..nNeedItemNum.." c�i Qu�n C�ng Ch��ng, kh�i ph�c "..nJunGong.." �i�m qu�n c�ng phe T�ng");
            WriteLog("[Chu�c Qu�n C�ng]:"..GetName().." S� d�ng "..nNeedItemNum.." c�i Qu�n C�ng Ch��ng, kh�i ph�c "..nJunGong.." �i�m qu�n c�ng phe T�ng");
        else
            BT_SetData(PT_RANKPOINT,BT_GetData(PT_RANKPOINT)-nJunGong);
            Msg2Player("Ng��i s� d�ng "..nNeedItemNum.." c�i Qu�n C�ng Ch��ng, kh�i ph�c "..nJunGong.." �i�m qu�n c�ng phe Li�u");
            WriteLog("[Chu�c Qu�n C�ng]:"..GetName().." S� d�ng "..nNeedItemNum.." c�i Qu�n C�ng Ch��ng, kh�i ph�c "..nJunGong.." �i�m qu�n c�ng phe Li�u");
        end;
        BT_SetData(PT_DEATH_LOST_JUNGONG,nLostJunGong-nJunGong);
        SetRankPoint(5,701,1);	--Tham gia x�p h�ng qu�n c�ng
    else
        Talk(1,"get_lost_jungong","Qu�n C�ng Ch��ng c�a ng�i ch�a ��, c�n c� <color=yellow>"..nNeedItemNum.."<color> Qu�n C�ng Ch��ng m�i c� th� chu�c l�i <color=yellow>"..nJunGong.."<color> �i�m qu�n c�ng.");
    end;
end;

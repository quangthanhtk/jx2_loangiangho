----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-24
--- Description: x� l� khi player login
--- Include trong file \script\global\playerloginin.lua
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\functions\\function_gm.lua");
Include("\\script\\warlord\\fix\\fix_clone_pk_boss.lua");
--Include("\\script\\warlord\\online_activities\\tetnguyendan2024\\plant\\head.lua");
----------------------------------------------------------------------------------------------------

function _w_OnPlayerLogin()
    _w_CreateGlobalTrigger(); --LongDaiKa: Kh�i t�o c�c trigger ��ng b�
    _wgm_AddGmItem(); --LongDaiKa: ki�m tra v� add GM item
    _w_LoginForwardMap();
    WTask:ResetDaily();
    _w_fix_BugNuOaBH(); --thu h�i s� qu�n c�ng do d�ng v��t m�c
    _w_fix_BugNgoiSaoMM(); --thu h�i s� qu�n c�ng do d�ng v��t m�c
    _w_fix_ClonePk_OnEnterMapFreePk(); --fix l�i d�ng clone c�u ti�u ki�p t�n
    --_w_Set_RankUnLimit() --------update Rank Tuong Unlimit
   -- plant_create_map_trigger(); -- create map trigger event tet2024f
    if GetTask(WTASKID_GIVEBACK_HONOR)~=1 then
        WAward:GiveBack_Honor()
    end
end

function _w_CreateGlobalTrigger()
    local tbGlobalTrigger = { -- T�o c�c trigger th�i gian ��ng b� v�i server
        { 2001, '_w_sync_1s' },
        { 2002, '_w_sync_2s' },
        { 2003, '_w_sync_5s' },
        { 2004, '_w_sync_10s' },
        { 2005, '_w_sync_60s' },
    };
    for i = 1, getn(tbGlobalTrigger) do
        local nTriggerId = tbGlobalTrigger[i][1];
        local nCustomTriggerId = nTriggerId * 2;
        local nCurrentTriggerId = GetTrigger(nCustomTriggerId);
        if nCurrentTriggerId <= 0 then
            nCurrentTriggerId = CreateTrigger(1, nTriggerId, nCustomTriggerId);
        end
        if nCurrentTriggerId > 0 then
            ContinueTimer(nCurrentTriggerId);
        end
    end
end

function _w_LoginForwardMap()
    local bIsFist = GetItemLockStatus();
    -- D�ch chuy�n nh�n v�t v� v� tr� ��nh s�n
    if bIsFist ~= 0 then
        if WLib:IsTestServer() == WEnv.TRUE then
            NewWorld(350, 1410 + random(-2, 2), 2979 + random(-2, 2)); -- Server test chuy�n nh�n v�t v� T��ng D��ng g�n D��c �i�m
            Say("Ch�o m�ng b�n ��n v�i m�y ch� AlphaTest phi�n b�n 2023 t�i jx2loangiangho.com!\nTrong th�i gian test, ��i hi�p h�y l�m nhi�m v� �� nh�n m� GiftCode, xem chi ti�t t�i <color=green>C�m Nang ��i S� Ki�n<color> ho�c <color=green>��i S� Ho�t ��ng<color> nh�.", 0);
        else
            NewWorld(350, 1410 + random(-2, 2), 2979 + random(-2, 2)); -- Server test chuy�n nh�n v�t v� T��ng D��ng g�n D��c �i�m
            --NewWorld(200, 1169 + random(-4, 4), 2851 + random(-4, 4)); -- ��y v� Bi�n Kinh
        end
    end
end

function _w_fix_BugNuOaBH()
    local tbNeedFixData = {
        ['i0cun�0i'] = { 100, 22000, 100 },
        ['oC�mTr�0o'] = { 100, 22000, 100 },
        ['Tu�nDubai'] = { 1, 220, 1 },
        ['iVDBxLeoMessiM30'] = { 1, 220, 1 },
        ["HelloWorld"] = { 1, 220, 1 },
    };

    local szRoleName = WPlayer:GetName();
    local szSuccessDataFile = "data/warlord/fix_bug/fix_use_nuoabaohap_success.txt";
    if type(tbNeedFixData[szRoleName]) == "table" then
        local tbSuccessData = WLib:GetTabFileTable("\\" .. WLib:Replace(szSuccessDataFile, "/", "\\"), 1);

        local bIsFixed = 0;
        for i = 1, getn(tbSuccessData) do
            if szRoleName == WLib:Trim(tbSuccessData[i][3]) then
                bIsFixed = 1;
            end
        end

        if bIsFixed == 0 then
            local nExpBefore = WPlayer:GetExp();
            local nHonorBefore = WPlayer:GetHonor(1);
            local nPointBefore = WPlayer:GetBattlePoint();

            local nBugCount = abs(tbNeedFixData[szRoleName][1]);
            local nPointRemove = abs(tbNeedFixData[szRoleName][2]);
            local nCoinBack = abs(tbNeedFixData[szRoleName][3]);
            if nHonorBefore >= 0 then
                WTask:Modify(TASKID_BATTLE_HONOR, -nPointRemove);
            else
                WTask:Modify(TASKID_BATTLE_HONOR, nPointRemove);
            end

            local tbAward = {
                { tbProp = { 2, 1, 30230 }, nStack = nCoinBack }, -- V�t ph�m Xu
            };
            WAward:Give(tbAward, "Fix_Use_Award_NuOa");
            WPlayerLog:WriteBattleLog("Fix_Use_Award_NuOa", "Fix N� Oa B�o H�p", 0, "", nExpBefore, 0, nHonorBefore, -nPointRemove, nPointBefore, 0);

            local szLogTime = date('%Y-%m-%d %H:%M:%S');
            WFileLog:WriteTabFile(szSuccessDataFile,
                    { szLogTime, WPlayer:GetAccount(), (szRoleName or "") .. " ", nBugCount, nPointRemove, nCoinBack, nHonorBefore, WPlayer:GetHonor(1) },
                    { "szLogTime", "szAccount", "szRoleName", "nBugCount", "nPoint", "nCoinBack", "nBeforePoint", "nAfterPoint" });

            WNpc:Talk(format("Thu h�i <color=white>%d c�ng tr�ng<color> v� ho�n tr� <color=white>%d V�t ph�m Xu<color> t� %d N� Oa B�o H�p v��t m�c!", nPointRemove, nCoinBack, nBugCount), WEnv.TRUE);
        end
    end
end

function _w_fix_BugNgoiSaoMM()
    local tbNeedFixData = {
        ['MFATi�uXu�n'] = { 10, 22000, 50 },
        ['IoMi�nC�T�choI'] = { 4, 8800, 20 },
        ['iiM�iM�i1T�nhY�u'] = { 3, 6600, 15 },
        ['i0cun�0i'] = { 3, 6600, 15 },
        ['iiLineKai'] = { 2, 4400, 10 },
        ['Jx2Thuy'] = { 2, 4400, 10 },
        ['oC�mTr�0o'] = { 2, 4400, 10 },
        ['ZzM�oNg�cNgh�chZ'] = { 1, 2200, 5 },
        ['GORILA'] = { 1, 2200, 5 },
        ['iVDBxLeoMessiM30'] = { 1, 2200, 5 },
        ['Gi�Ph�Du'] = { 1, 2200, 5 },
        ["HelloWorld"] = { 1, 220, 1 },
    };

    local szRoleName = WPlayer:GetName();
    local szSuccessDataFile = "data/warlord/fix_bug/fix_use_ngoisaomayman_success.txt";
    if type(tbNeedFixData[szRoleName]) == "table" then
        local tbSuccessData = WLib:GetTabFileTable("\\" .. WLib:Replace(szSuccessDataFile, "/", "\\"), 1);

        local bIsFixed = 0;
        for i = 1, getn(tbSuccessData) do
            if szRoleName == WLib:Trim(tbSuccessData[i][3]) then
                bIsFixed = 1;
            end
        end

        if bIsFixed == 0 then
            local nExpBefore = WPlayer:GetExp();
            local nHonorBefore = WPlayer:GetHonor(1);
            local nPointBefore = WPlayer:GetBattlePoint();

            local nBugCount = abs(tbNeedFixData[szRoleName][1]);
            local nPointRemove = abs(tbNeedFixData[szRoleName][2]);
            local nCoinBack = abs(tbNeedFixData[szRoleName][3]);
            if nHonorBefore >= 0 then
                WTask:Modify(TASKID_BATTLE_HONOR, -nPointRemove);
            else
                WTask:Modify(TASKID_BATTLE_HONOR, nPointRemove);
            end

            local tbAward = {
                { tbProp = { 2, 1, 30230 }, nStack = nCoinBack }, -- V�t ph�m Xu
            };
            WAward:Give(tbAward, "Fix_Use_Award_NgoiSao");
            WPlayerLog:WriteBattleLog("Fix_Use_Award_NgoiSao", "Fix Ng�i Sao May M�n", 0, "", nExpBefore, 0, nHonorBefore, -nPointRemove, nPointBefore, 0);

            local szLogTime = date('%Y-%m-%d %H:%M:%S');
            WFileLog:WriteTabFile(szSuccessDataFile,
                    { szLogTime, WPlayer:GetAccount(), (szRoleName or "") .. " ", nBugCount, nPointRemove, nCoinBack, nHonorBefore, WPlayer:GetHonor(1) },
                    { "szLogTime", "szAccount", "szRoleName", "nBugCount", "nPoint", "nCoinBack", "nBeforePoint", "nAfterPoint" });

            WNpc:Talk(format("Thu h�i <color=white>%d c�ng tr�ng<color> v� ho�n tr� <color=white>%d V�t ph�m Xu<color> t� %d Ng�i Sao May M�n v��t m�c!", nPointRemove, nCoinBack, nBugCount), WEnv.TRUE);
        end
    end
end

--function _w_Set_RankUnLimit()
--    local nCurRank=GetTask(704);
--    local checkRankLieu=GetTask(WTASKID_QHTUONG_UNLIMIT2024_LIEU) or 0;
--    local checkRankTong=GetTask(WTASKID_QHTUONG_UNLIMIT2024_TONG) or 0;
--
--
--    if nCurRank < 0 and nCurRank>-5 and checkRankLieu==1 then
--            SetTask(704,-5);
--            --SetTask(WTASKID_QHTUONG_UNLIMIT2024_LIEU,1);
--    elseif nCurRank > 0 and nCurRank <5 and checkRankTong==1 then
--            SetTask(704,5)
--            --SetTask(WTASKID_QHTUONG_UNLIMIT2024_TONG,1);
--    end
--end

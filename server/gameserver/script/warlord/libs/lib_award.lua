----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: c�c h�m li�n quan t�i ph�n th��ng ho�t ��ng
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\online_activities\\giftcode_alphatest\\functions.lua");
Include("\\script\\warlord\\functions\\function_book.lua");
Include("\\script\\ksgvn\\event\\monthly\\monthly_head.lua");
Include("\\script\\online\\olympic\\oly_head.lua");
----------------------------------------------------------------------------------------------------
WAward = {};
----------------------------------------------------------------------------------------------------
function WAward:Give(tbItem, szLogTitle, nAwardCount)
    if KsgAward:Give(tbItem, szLogTitle, nAwardCount) == 1 then
        return WEnv.RETCODE_SUCCESS;
    end
    return WEnv.RETCODE_ERROR;
end

function WAward:GiveByRandom(tbItem, szLogTitle, nAwardCount)
    if tbItem == WEnv.NULL then
        return WEnv.RETCODE_ERROR
    end
    local nRateTotal = 10000000;
    local nRandom = random(1, nRateTotal);
    local nStep = 0;
    for i = 1, getn(tbItem) do
        nStep = nStep + floor(tbItem[i].nRate * nRateTotal / 100);
        if (nRandom <= nStep) then
            return self:Give(tbItem[i], szLogTitle, nAwardCount);
        end
    end
end
----------------------------------------------------------------------------------------------------

---Ph�n th��ng gi�t boss L��ng S�n B�c t�ng �i
---@param nStage number T�ng ho�n th�nh
function WAward:LuongSonBac_KillBoss(nStage)
    if nStage == WEnv.NULL then
        return WEnv.RETCODE_ERROR;
    end
    local tbStageAward = {
        [1] = {
            { tbProp = { 2, 1, 40017 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R��ng L��ng S�n B�c
            --{ tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng anh h�ng
            --{ nFunc = "KsgAward:DropEventBox(10)" },
            ---c�p nh�p event t�t 2023 qu� m�o
            --{ nFunc = "KsgAward:DropEventBox(2)" },

            --- Th�nh Ho� ��n
            --{ nFunc = "oly_AddShengHuo(20, 5)" },
        },
        [2] = {
            { tbProp = { 2, 1, 40017 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R��ng L��ng S�n B�c
            --{ tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng anh h�ng
            --{ nFunc = "KsgAward:DropEventBox(2)" },

            --- Th�nh Ho� ��n
            --{ nFunc = "oly_AddShengHuo(20, 5)" },
        },
        [3] = {
            { tbProp = { 2, 1, 40017 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R��ng L��ng S�n B�c
          --  { tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng anh h�ng
            --{ nFunc = "KsgAward:DropEventBox(2)" },

            --- Th�nh Ho� ��n
            --{ nFunc = "oly_AddShengHuo(20, 5)" },
        },
        [4] = {
            { tbProp = { 2, 1, 40017 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R��ng L��ng S�n B�c
           -- { tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng anh h�ng
            --{ nFunc = "KsgAward:DropEventBox(2)" },

            --- Th�nh Ho� ��n
            --{ nFunc = "oly_AddShengHuo(20, 5)" },
        },
        [5] = {
            { tbProp = { 2, 1, 40017 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R��ng L��ng S�n B�c
           -- { tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng anh h�ng
            --{ nFunc = "KsgAward:DropEventBox(2)" },

            --- Th�nh Ho� ��n
            --{ nFunc = "oly_AddShengHuo(20, 5)" },
        },
        [6] = {
            { tbProp = { 2, 1, 40017 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R��ng L��ng S�n B�c
            --{ tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng anh h�ng
            -- { nFunc = "KsgAward:DropEventBox(2)" },

            -- Th�nh Ho� ��n
            --{ nFunc = "oly_AddShengHuo(20, 5)" },
        },
        [7] = {
            { tbProp = { 2, 1, 40017 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R��ng L��ng S�n B�c
            --{ tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng anh h�ng
            --{ nFunc = "KsgAward:DropEventBox(2)" },

            -- Th�nh Ho� ��n
            --{ nFunc = "oly_AddShengHuo(20, 5)" },
        },
        [8] = {
            { tbProp = { 2, 1, 40017 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R��ng L��ng S�n B�c
            -- tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng anh h�ng
            --{ nFunc = "KsgAward:DropEventBox(2)" },

            -- --Th�nh Ho� ��n
            --{ nFunc = "oly_AddShengHuo(20, 5)" },
        },
    };
    if tbStageAward[nStage] then
        for _, tbAward in tbStageAward[nStage] do
            if _ ~= "n" then
                local nCaptain = GetTeamMember(0);
                if nCaptain == PlayerIndex then
                self:Give(tbAward, "Th��ng boss LSB");
                end
                AddItem(2,1,50263,2,4)

            end
        end
        local nTimeKillBoss=GetTask(VET_MS_LS_TASKID_LIANGSHAN_ITEM_DAILY)
        if nTimeKillBoss == 800 then
            AddItem(2, 1, 31239,3);
            WPlayerLog:WriteAddItemLog("800BossLSB", "LPD_LuongSonBac", 1, 31239, 1, 1);
        end
    end
    return WEnv.RETCODE_SUCCESS;
end

---Ph�n th��ng gi�t boss ��a Huy�n Cung theo t�ng �i
---@param nStage number T�ng ho�n th�nh
function WAward:DiaHuyenCung_KillBoss(nStage)
    if nStage == WEnv.NULL then
        return WEnv.RETCODE_ERROR;
    end
    local tbStageAward = {
        [1] = {
            { tbProp = { 2, 1, 40018 }, nStack = 4,nStatus = ITEMSTATUS_TRADE }, -- R��ng ��a huy�n cung
           -- { tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng anh h�ng
            --{ nFunc = "KsgAward:DropEventBox(2)" },
            ---c�p nh�p event t�t 2023 qu� m�o
            --{ nFunc = "KsgAward:DropEventBox(10)" },

            --- Th�nh Ho� ��n
            --{ nFunc = "oly_AddShengHuo(20, 1)" },
        },
        [2] = {
            { tbProp = { 2, 1, 40018 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R��ng ��a huy�n cung
           -- { tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng anh h�ng
            --{ nFunc = "KsgAward:DropEventBox(2)" },
        },
        [3] = {
            --{ tbProp = { 2, 1, 40018 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R��ng ��a huy�n cung
            --{ tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng anh h�ng
            --{ nFunc = "KsgAward:DropEventBox(2)" },
        },
        [4] = {
            { tbProp = { 2, 1, 40018 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, --R��ng ��a huy�n cung
          --  { tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng anh h�ng
            --{ nFunc = "KsgAward:DropEventBox(2)" },
        },
        [5] = {
            { tbProp = { 2, 1, 40018 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R��ng ��a huy�n cung
          --  { tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng anh h�ng
            --{ nFunc = "KsgAward:DropEventBox(2)" },
        },
        [6] = {
            { tbProp = { 2, 1, 40018 }, nStack =4, nStatus = ITEMSTATUS_TRADE }, -- R��ng ��a huy�n cung
            --{ tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng anh h�ng
            --{ nFunc = "KsgAward:DropEventBox(2)" },
       },
       [7] = {
            { tbProp = { 2, 1, 40018 }, nStack =4, nStatus = ITEMSTATUS_TRADE }, -- R��ng ��a huy�n cung
            --{ tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng anh h�ng
            --{ nFunc = "KsgAward:DropEventBox(2)" },
        },
      [8] = {
            { tbProp = { 2, 1, 40018 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, --R��ng ��a huy�n cung
           --{ tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng anh h�ng
            --{ nFunc = "KsgAward:DropEventBox(2)" },
        },
    };
    if tbStageAward[nStage] then
        for _, tbAward in tbStageAward[nStage] do
            if _ ~= "n" then
                local nCaptain = GetTeamMember(0);
                if nCaptain == PlayerIndex then
                    self:Give(tbAward, "Th��ng boss �HC");
                end
                AddItem(2,1,50263,2,4)
            end
        end
        local nBossCount = GetTask(WMISSION_TASK_BOSS_DHC_CHECK); ---
        if nBossCount == 500 then
            AddItem(2, 1, 31239,3);
            WPlayerLog:WriteAddItemLog("500BossDHC", "LPD_DiaHuyenCung", 1, 31239, 1, 1);
        end
    end
    return WEnv.RETCODE_SUCCESS;
end

---Ph�n th��ng tr�ng th�nh c�ng B�t Nh� L�n
function WAward:BatNhaLon_ThuHoach()
    WTask:ResetDaily();

    -----@type table
    local tbAward = {
        { nExp = 50000000 },
        { nGold = 2000000 },
        { nFunc = "KsgAward:DropEventBox(10)" },
        { tbProp = { 2, 1, 31122 }, nStack = 1 }, -- Linh Khi ruc ro
        { tbProp = { 2, 1, 1124 }, nStack = 1 }, -- B�nh �t ch�n g�
        { tbProp = { 2, 1, 1125 }, nStack = 1 }, -- B�nh �t b�t b�o
        { tbProp = { 2, 1, 30410 }, nStack = 5}, -- M�nh Thi�n m�n
        { tbProp = { 2, 1, 30390 }, nStack = 30 }, -- M�nh thi�n cang
        { tbProp = { 2, 1, 40037 }, nStack = 1 }, -- T�i th� c�ng c�p 6
        { tbProp = { 2, 1, 30687 }, nStack = 10 }, -- Th�i Nh�t L�nh

        --{ tbProp = { 2, 102, 215 }, nStack = 500, nStatus = ITEMSTATUS_EQUIP_LOCK }, -- B�t Tr�n Ch�u
        {
            { tbProp = { 2, 1, 31402 }, nStack = 3, nRate = 20.00 }, -- Tay Tam Thach lv7
            { tbProp = { 2, 1, 31401 }, nStack = 3 , nRate = 20.00}, -- Luy�n l� thi�t c7
            --{ tbProp = { 2, 1, 40048 }, nStack = 5, nRate = 50 }, --M�nh B� �i�n 27
            { tbProp = { 2, 1, 40049 }, nStack = 5, nRate = 40.00 }, -- M�nh B� �i�n 30
            --{ nFunc = "_w_book_AddBookByType(1100, 6, 0, 3, 27, 27, 27, 27, 5)", nRate = 50 }, -- M�t T�ch B� �i�n 27% ng�u nhi�n ph�i
            --{ nFunc = "_w_book_AddBookByType(100, 6, 0, 3, 30, 30, 30, 30, 1)", nRate = 50 }, -- M�t T�ch B� �i�n 30% ng�u nhi�n ph�i
            --{ tbProp = { 2, 1, 40057 }, nStack = 1, nRate = 5 }, -- T�i m�t t�ch b� �i�n 27
            --{ tbProp = { 2, 1, 40058 }, nStack = 1, nRate = 5 }, -- T�i m�t t�ch b� �i�n 30
            { tbProp = { 2, 1, 40037 }, nStack = 1, nRate = 15.00 }, -- T�i K� N�ng B�H Lv6
            { tbProp = { 2, 102, 214 }, nStack = 1,nStatus = ITEMSTATUS_LOCK, nRate = 5.00}, -- Ch�u 7
          ---c�p nh�p event t�t 2023 qu� m�o


         },


        --{ nFunc = "KsgAward:DropEventBox(20)" },
        ---50% nh�n ���c ng�u nhi�n 1 trong 2 lo�i event 1 ho�c 2 kho�
        --{
        --    { tbProp = MONTHLY_EVENT_AWARD1, nRate = 25, nStatus = ITEMSTATUS_LOCK },
        --    { tbProp = MONTHLY_EVENT_AWARD2, nRate = 25, nStatus = ITEMSTATUS_LOCK },
        --},
    };

    --if g_WCFG_RUONGHOATDONG:IsDateOpen() == WEnv.TRUE then
    --    tinsert(tbAward, { tbProp = { 2, 1, 40063 }, nStack = 1 });-- R��ng Ho�t ��ng
    --end
   if GetTask(WTASKID_DAYLY_BATNHALON_DAILY_COUNT) == 15 then
    		--FireEvent("event_mission_task_award","planttree","plantbigtree",16)
    	gf_AddItemEx2({2,1,31239 , 5,4}, "Linh Phach ��n", "Ho�t ��ng th�ng 10/2015", "Thu ho�ch 16 B�t nh� to",0,1)
   end
    --------set thuoowngr �i�m n�ng ��ng
    if WTask:GetBit(WMISSION_AWARD_NANGDONG,WMISSION_AWARD_BIT_DAILY_NANGDONG_BATNHA) ==0 then
        WTask:Set(WMISSION_AWARD_NANGDONG,WTask:Get(WMISSION_AWARD_NANGDONG)+100);
        WTask:SetBit(WMISSION_AWARD_NANGDONG,WMISSION_AWARD_BIT_DAILY_NANGDONG_BATNHA,1)
    end

    self:Give(tbAward, "Th��ng thu ho�ch BNL");

    --Th��ng code alphatest
    WGIFTCODE_ALPHATEST:SuccessTaskReq("BatNhaLon", 1);

    --Nhi�m v� tu�n
    WTask:SetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_BNL_DONE, WTask:GetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_BNL_DONE) + 1);

    -- Nhi�m v� h� tr� t�n th�
    WTask:SetByte(WTASKID_SUPPORT1_TASK2_BYTE, WTASKID_SUPPORT1_TASK2_BYTE_BNL_DONE, WTask:GetByte(WTASKID_SUPPORT1_TASK2_BYTE, WTASKID_SUPPORT1_TASK2_BYTE_BNL_DONE) + 1);
    SetTask(WTASKID_DAYLY_BATNHALON_DAILY_COUNT,GetTask(WTASKID_DAYLY_BATNHALON_DAILY_COUNT)+1)
    return WEnv.RETCODE_SUCCESS;
end
function WAward:BatNhaNho_ThuHoach()
    WTask:ResetDaily();

    local tbAward = {
        { nExp = 25000000 },
       -- { nGold = 1000000 },
        { nFunc = "KsgAward:DropEventBox(2)" },
        { tbProp = { 2, 1, 30499 }, nStack = 5,nStatus = ITEMSTATUS_LOCK }, -- Hu�n ch��ng Anh Hung
        --{ tbProp = { 2, 1, 1124 }, nStack = 1 }, -- B�nh �t ch�n g�
        --{ tbProp = { 2, 1, 1125 }, nStack = 1 }, -- B�nh �t b�t b�o
        --{ tbProp = { 2, 1, 30410 }, nStack = 5}, -- M�nh Thi�n m�n
        --{ tbProp = { 2, 1, 30390 }, nStack = 25 }, -- M�nh thi�n cang
        --{ tbProp = { 2, 1, 40025 }, nStack = 1 }, -- T�i th� c�ng c�p 5
        --{ tbProp = { 2, 102, 215 }, nStack = 500, nStatus = ITEMSTATUS_EQUIP_LOCK }, -- B�t Tr�n Ch�u
        { tbProp = { 2, 1, 30525 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Tay Tam 5
        { tbProp = { 2, 1, 30114}, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Bat nha chung thu
        {
            { tbProp = { 2, 1, 40049 }, nStack = 5, nRate = 50 }, ---m�nh b� �i�n 30
            --{ nFunc = "_w_book_AddBookByType(1100, 6, 0, 3, 27, 27, 27, 27, 5)", nRate = 50 }, -- M�t T�ch B� �i�n 27% ng�u nhi�n ph�i
            --{ nFunc = "_w_book_AddBookByType(100, 6, 0, 3, 30, 30, 30, 30, 1)", nRate = 1 }, -- M�t T�ch B� �i�n 30% ng�u nhi�n ph�i
            { tbProp = { 2, 102, 213 }, nStack = 1,nStatus = ITEMSTATUS_LOCK, nRate = 5}, -- Ch�u 6
            { tbProp = { 2, 102, 212 }, nStack = 1,nStatus = ITEMSTATUS_LOCK, nRate = 45}, -- Ch�u 5
           -- { tbProp = { 2, 1, 30531 }, nStack = 1, nRate = 50.00,nStatus = ITEMSTATUS_LOCK }, -- Luyen Lo 5
            --{ tbProp = { 2, 1, 31248 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_LOCK }, -- T� Linh Quy�t
          --  { tbProp = { 2, 1, 30847 }, nStack = 1, nRate = 10.00,nStatus = ITEMSTATUS_LOCK }, -- H�i ti�n ��n
            --{ tbProp = { 2, 1, 30731 }, nStack = 1, nRate = 10.00,nStatus = ITEMSTATUS_LOCK }, -- Kinh mach Ngan nhan

            ---c�p nh�p event t�t 2023 qu� m�o
            --{ tbProp = { 2, 1, 40037 }, nStack = 1, nRate = 50 }, -- T�i K� N�ng B�H Lv6
        },

        ---c�p nh�p event t�t 2023 qu� m�o
        --{ nFunc = "KsgAward:DropEventBox(10)" },
        ---50% nh�n ���c ng�u nhi�n 1 trong 2 lo�i event 1 ho�c 2 kho�
        --{
        --    { tbProp = MONTHLY_EVENT_AWARD1, nRate = 25, nStatus = ITEMSTATUS_LOCK },
        --    { tbProp = MONTHLY_EVENT_AWARD2, nRate = 25, nStatus = ITEMSTATUS_LOCK },
        --},
    };
    ---------event tet 2024 Canh Thinh
    --if g_WCFG_RUONGHOATDONG:IsDateOpen() == WEnv.TRUE then
    --    tinsert(tbAward, { tbProp = { 2, 1, 40063 }, nStack = 1 });-- R��ng Ho�t ��ng
    --end

    self:Give(tbAward, "Th��ng thu ho�ch BNN");

    --Th��ng code alphatest
    WGIFTCODE_ALPHATEST:SuccessTaskReq("BatNhaNho", 1);

    --Nhi�m v� tu�n
    WTask:SetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_BNN_DONE, WTask:GetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_BNN_DONE) + 1);

    -- Nhi�m v� h� tr� t�n th�
    WTask:SetByte(WTASKID_SUPPORT1_TASK2_BYTE, WTASKID_SUPPORT1_TASK2_BYTE_BNN_DONE, WTask:GetByte(WTASKID_SUPPORT1_TASK2_BYTE, WTASKID_SUPPORT1_TASK2_BYTE_BNN_DONE) + 1);
    ---------------------------th��ng khi tr�ng �� c�y
    local tbAwardfinal = {
        { tbProp = { 2, 1, 31239 }, nStack = 1,nStatus = ITEMSTATUS_LOCK }, -- Linh Ph�ch ��n
    };
    local nCountTree = GetTask(TASK_PLAN_SMALLTREE_COUNT);
    if nCountTree ==20 then
        self:Give(tbAwardfinal, "Th��ng thu ho�ch 20 c�y b�t Nh�");
    end
    return WEnv.RETCODE_SUCCESS;
end
function WAward:HatGiong_ThuHoach()
    WTask:ResetDaily();

    local tbAward = {
        { nExp = 25000000 },
        -- { nGold = 1000000 },
        --{ nExp = 3000000 },
        { tbProp = { 2, 1, 30499 }, nStack = 5 ,nStatus = ITEMSTATUS_LOCK}, -- Hu�n ch��ng Anh Hung
        { tbProp = { 2, 1, 30531 }, nStack = 1 }, -- Luyen Lo 5
        --{ tbProp = { 2, 1, 1124 }, nStack = 1 }, -- B�nh �t ch�n g�
        --{ tbProp = { 2, 1, 1125 }, nStack = 1 }, -- B�nh �t b�t b�o
        --{ tbProp = { 2, 1, 30410 }, nStack = 5}, -- M�nh Thi�n m�n
        --{ tbProp = { 2, 1, 30390 }, nStack = 25 }, -- M�nh thi�n cang
        --{ tbProp = { 2, 1, 40025 }, nStack = 1 }, -- T�i th� c�ng c�p 5
        --{ tbProp = { 2, 102, 215 }, nStack = 500, nStatus = ITEMSTATUS_EQUIP_LOCK }, -- B�t Tr�n Ch�u
        {
            { tbProp = { 2, 1, 40049 }, nStack = 5, nRate = 70 }, --m�nh b� �i�n 30
            { tbProp = { 2, 102, 212 }, nStack = 1,nStatus = ITEMSTATUS_LOCK, nRate = 30}, -- Ch�u 5
            --{ nFunc = "_w_book_AddBookByType(1100, 6, 0, 3, 27, 27, 27, 27, 5)", nRate = 50 }, -- M�t T�ch B� �i�n 27% ng�u nhi�n ph�i
            --{ nFunc = "_w_book_AddBookByType(100, 6, 0, 3, 30, 30, 30, 30, 1)", nRate = 1 }, -- M�t T�ch B� �i�n 30% ng�u nhi�n ph�i
           -- { tbProp = { 2, 1, 30525 }, nStack = 1, nRate = 50.00,nStatus = ITEMSTATUS_LOCK }, -- Tay Tam 5
          --  { tbProp = { 2, 1, 30531 }, nStack = 1, nRate = 50.00,nStatus = ITEMSTATUS_LOCK }, -- Luyen Lo 5
           -- { tbProp = { 2, 1, 31248 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_LOCK }, -- T� Linh Quy�t
           -- { tbProp = { 2, 1, 30847 }, nStack = 1, nRate = 10.00,nStatus = ITEMSTATUS_LOCK }, -- H�i ti�n ��n
            --{ tbProp = { 2, 1, 30731 }, nStack = 1, nRate = 10.00,nStatus = ITEMSTATUS_LOCK }, -- Kinh mach Ngan nhan

            ---c�p nh�p event t�t 2023 qu� m�o
            --{ tbProp = { 2, 1, 40037 }, nStack = 1, nRate = 50 }, -- T�i K� N�ng B�H Lv6
        },

        ---c�p nh�p event t�t 2023 qu� m�o
        --{ nFunc = "KsgAward:DropEventBox(10)" },
        ---50% nh�n ���c ng�u nhi�n 1 trong 2 lo�i event 1 ho�c 2 kho�
        --{
        --    { tbProp = MONTHLY_EVENT_AWARD1, nRate = 25, nStatus = ITEMSTATUS_LOCK },
        --    { tbProp = MONTHLY_EVENT_AWARD2, nRate = 25, nStatus = ITEMSTATUS_LOCK },
        --},
    };

    --if g_WCFG_RUONGHOATDONG:IsDateOpen() == WEnv.TRUE then
    --    tinsert(tbAward, { tbProp = { 2, 1, 40063 }, nStack = 1 });-- R��ng Ho�t ��ng
    --end
    self:Give(tbAward, "Th��ng thu ho�ch BNN");

    --Th��ng code alphatest
    --WGIFTCODE_ALPHATEST:SuccessTaskReq("BatNhaNho", 1);

    --Nhi�m v� tu�n
    WTask:SetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_HATGIONG_DONE, WTask:GetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_BNN_DONE) + 1);

    -- Nhi�m v� h� tr� t�n th�
    WTask:SetByte(WTASKID_SUPPORT1_TASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_HATGIONG_DONE, WTask:GetByte(WTASKID_SUPPORT1_TASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_HATGIONG_DONE) + 1);
    local tbAwardfinal = {
        { tbProp = { 2, 1, 31239 }, nStack = 1,nStatus = ITEMSTATUS_LOCK }, -- Linh Ph�ch ��n

    };
    local nCountTree = GetTask(TASK_PLANT_TREE_COUNT);
    if nCountTree ==24 then
        self:Give(tbAwardfinal, "Th��ng thu ho�ch 24 c�y H�t Gi�ng");
    end
    return WEnv.RETCODE_SUCCESS;
end

---Ph�n th��ng thuhoach C�y  Linh
---@param
function WAward:CayTuLinh_ThuHoach()
    WTask:ResetDaily();

    -----@type table
    local tbAward = {
        { nExp = 300000 },
        { nHonor = 1000 },
        { tbProp = { 2, 1, 31681 }, nStack = 5,nStatus = ITEMSTATUS_TRADE }, -- M�nh �� 9
        { tbProp = { 2, 1, 31194 }, nStack = 1, nStatus = ITEMSTATUS_TRADE }, -- Thanh Long h�n
        { tbProp = { 2, 1, 31248 }, nStack = 1, nStatus = ITEMSTATUS_TRADE }, -- T� Linh QUy�t
        { tbProp = { 2, 1, 31615 }, nStack = 10,nStatus = ITEMSTATUS_TRADE }, --  Luy�n L� Thi�t Lv8
        { tbProp = { 2, 1, 31614 }, nStack = 10,nStatus = ITEMSTATUS_TRADE }, --T�y T�m Th�ch Lv8
        { tbProp = { 2, 1, 31675 }, nStack = 1,nStatus = ITEMSTATUS_TRADE }, -- Th�n �ng H�n
        {
            { tbProp = { 2, 1, 31761 }, nStack = 1, nRate = 20, nStatus = ITEMSTATUS_TRADE }, -- T�y t�m 9
            { tbProp = { 2, 1, 31762 }, nStack = 1, nRate = 20, nStatus = ITEMSTATUS_TRADE }, -- Luy�n l� 9
            { tbProp = { 2, 95, 204 }, nStack = 1, nRate = 30, nStatus = ITEMSTATUS_TRADE }, -- Thi�n Cang l�nh
            { tbProp = { 2, 1, 30370 }, nStack = 1, nRate = 30, nStatus = ITEMSTATUS_TRADE }, -- Thi�n m�n Kim L�nh

        },
    };
    SetTask(WTASKID_DAYLY_CAYTULINH,GetTask(WTASKID_DAYLY_CAYTULINH)+1);
    self:Give(tbAward, "Th��ng thu ho�ch CayTuLinh");

    return WEnv.RETCODE_SUCCESS;
end
------Ph�n th��ng v�n ti�u th�nh c�ng
---@param nDouble number x2 ph�n t��ng
function WAward:BaPhe_VanTieu(nDouble)
    WTask:ResetDaily();

    nDouble = tonumber(nDouble) or 1;
    local tbAward = {
        { nExp = 50000000 },
        { nGold = 500000 },
        --{ tbProp = { 2, 1, 30687 }, nStack = random(5, 10) * nDouble }, -- M�nh Thi�n M�n
        { tbProp = { 2, 1, 30687 }, nStack = 20 * nDouble }, -- Thai Nhaat Lenh
       -- { tbProp = { 2, 1, 31505 }, nStack = 1 * nDouble }, -- T�i �� quuys 7
       -- { tbProp = { 1, 0, 30009 }, nStack = 2 * nDouble }, -- Linh chi Tuc menh hoan
       -- { tbProp = { 1, 0, 30010 }, nStack = 2 * nDouble }, -- Dao tri Dai hoan don
        { tbProp = { 2, 1, 40046 }, nStack = 5 * nDouble }, -- M�nh t�y bi�n ch�u
        { tbProp = { 2, 1, 31244 }, nStack = 20 * nDouble }, -- M�nh c� quan m�c gia
        { tbProp = { 2, 1, 30912 }, nStack = 50 * nDouble }, -- Hi�p ngh�a chi ch�ng
        { tbProp = { 2, 1, 30847 }, nStack = 2 *nDouble, nStatus = ITEMSTATUS_LOCK }, -- H�i Ti�n ��n
        { tbProp = { 2, 1, 31194 }, nStack = 2*nDouble }, -- Thanh Long h�n
        { tbProp = { 2, 1, 31248 }, nStack = 1*nDouble }, --  T Linh Quyet
        { tbProp = { 2, 1, 31122 }, nStack = 2 * nDouble }, -- Linh kh� r�c r�
        { tbProp = { 2, 1, 31402 }, nStack = 2 * nDouble }, -- Tay Tam Thach lv6
        { tbProp = { 2, 1, 31401 }, nStack = 2 * nDouble}, -- Luy�n l� thi�t c6
        ---c�p nh�p event t�t 2023 qu� m�o
       -- { tbProp = { 2, 1, 31505 }, nStack = 2 * nDouble }, -- T�i �� Qu� C�p 7
        --{ nFunc = "KsgAward:DropEventBox(50)" },
        { tbProp = { 2, 1, 40050 }, nStack = 10* nDouble }, --m�nh b� �i�n 32
        { nFunc = "KsgAward:DropEventBox(20)" },
        --{ tbProp = { 2, 1, 40037 }, nStack = 3 * nDouble }, -- T�i K� N�ng B�H Lv6
    };

    --if g_WCFG_RUONGHOATDONG:IsDateOpen() == WEnv.TRUE then
    --    tinsert(tbAward, { tbProp = { 2, 1, 40063 }, nStack = 5 });-- R��ng Ho�t ��ng
    --end
    if GetTask(WTASKID_DAYLY_VANTIEU_DAILY_COUNT)==7 then
        AddItem(2,1,31239,3);
    end
    self:Give(tbAward, "Th��ng v�n ti�u x" .. nDouble);

    --------th��ng �i�m n�ng ��ng
    if WTask:GetBit(WMISSION_AWARD_NANGDONG,WMISSION_AWARD_BIT_DAILY_NANGDONG_VANTIEU) ==0 then
        WTask:Set(WMISSION_AWARD_NANGDONG,WTask:Get(WMISSION_AWARD_NANGDONG)+200);
        WTask:SetBit(WMISSION_AWARD_NANGDONG,WMISSION_AWARD_BIT_DAILY_NANGDONG_VANTIEU,1)
    end
    --Giftcode alphatest
    WGIFTCODE_ALPHATEST:SuccessTaskReq("VanTieu", 1);

    --Nhi�m v� tu�n
    WTask:SetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_VANTIEU_DONE, WTask:GetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_VANTIEU_DONE) + 1);

    -- Nhi�m v� h� tr� t�n th�
    WTask:SetByte(WTASKID_SUPPORT1_TASK2_BYTE, WTASKID_SUPPORT1_TASK2_BYTE_VANTIEU_DONE, WTask:GetByte(WTASKID_SUPPORT1_TASK2_BYTE, WTASKID_SUPPORT1_TASK2_BYTE_VANTIEU_DONE) + 1);
    SetTask(WTASKID_DAYLY_VANTIEU_DAILY_COUNT,GetTask(WTASKID_DAYLY_VANTIEU_DAILY_COUNT)+1);
    return WEnv.RETCODE_SUCCESS;
end

---Ph�n th��ng c��p ti�u th�nh c�ng
---@param nCount number S� l��ng ti�u c��p ���c
function WAward:BaPhe_CuopTieu(nCount)
    WTask:ResetDaily();

    nCount = tonumber(nCount) or 1;
    local tbAward = {
        { nGold = 300000 },
        { tbProp = { 2, 1, 30230 }, nStack = 30 },
        { nFunc = "KsgAward:DropEventBox(20)" },
    };
    --if g_WCFG_RUONGHOATDONG:IsDateOpen() == WEnv.TRUE then
    --    tinsert(tbAward, { tbProp = { 2, 1, 40063 }, nStack = 3 });-- R��ng Ho�t ��ng
    --end
    self:Give(tbAward, "Th��ng c��p ti�u x" .. nCount);

    --Nhi�m v� tu�n
    WTask:SetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_CUOPTIEU_DONE, WTask:GetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_CUOPTIEU_DONE) + nCount);

    -- Nhi�m v� h� tr� t�n th�
    WTask:SetByte(WTASKID_SUPPORT1_TASK2_BYTE, WTASKID_SUPPORT1_TASK2_BYTE_CUOPTIEU_DONE, WTask:GetByte(WTASKID_SUPPORT1_TASK2_BYTE, WTASKID_SUPPORT1_TASK2_BYTE_CUOPTIEU_DONE) + nCount);

    return WEnv.RETCODE_SUCCESS;
end

function WAward:KiemDangYenVan_KillBoss(nType, nStage)
    if nStage == WEnv.NULL then
        return WEnv.RETCODE_ERROR;
    end
    local tbStageAward = {
        [1] = {
            { nExp = 30000000 },
            { szName = 'R��ng Ki�m ��ng Y�n V�n', tbProp = { 2, 1, 40020 }, nStack = 10,nStatus = ITEMSTATUS_LOCK },
            { nFunc = "KsgAward:DropEventBox(10)" },
        },
        [2] = {
            { nExp = 30000000 },
            { szName = 'R��ng Ki�m ��ng Y�n V�n', tbProp = { 2, 1, 40020 }, nStack = 10 ,nStatus = ITEMSTATUS_LOCK},
            { nFunc = "KsgAward:DropEventBox(10)" },
        },
        [3] = {
            { nExp = 30000000 },
            { szName = 'R��ng Ki�m ��ng Y�n V�n', tbProp = { 2, 1, 40020 }, nStack = 10 ,nStatus = ITEMSTATUS_LOCK},
            { nFunc = "KsgAward:DropEventBox(10)" },
        },
        [4] = {
            { nExp = 30000000 },
            { szName = 'R��ng Ki�m ��ng Y�n V�n', tbProp = { 2, 1, 40020 }, nStack = 10,nStatus = ITEMSTATUS_LOCK },
            { nFunc = "KsgAward:DropEventBox(10)" },
        },
        [5] = {
            { nExp = 30000000 },
            { szName = 'R��ng Ki�m ��ng Y�n V�n', tbProp = { 2, 1, 40020 }, nStack = 10 ,nStatus = ITEMSTATUS_LOCK},
            { nFunc = "KsgAward:DropEventBox(10)" },
        },
        [6] = {
            { nExp = 30000000 },
            { szName = 'R��ng Ki�m ��ng Y�n V�n', tbProp = { 2, 1, 40020 }, nStack = 10 ,nStatus = ITEMSTATUS_LOCK},
            { nFunc = "KsgAward:DropEventBox(10)" },
        },
        [7] = {
            { nExp = 30000000 },
            { szName = 'R��ng Ki�m ��ng Y�n V�n', tbProp = { 2, 1, 40020 }, nStack = 10,nStatus = ITEMSTATUS_LOCK },
            { nFunc = "KsgAward:DropEventBox(10)" },
        },
        [8] = {
            { nExp = 30000000 },
            { szName = 'R��ng Ki�m ��ng Y�n V�n', tbProp = { 2, 1, 40020 }, nStack = 10 ,nStatus = ITEMSTATUS_LOCK},
            { nFunc = "KsgAward:DropEventBox(10)" },
        },
    };
    if tbStageAward[nStage] then
        for _, tbAward in tbStageAward[nStage] do
            if _ ~= "n" then
                self:Give(tbAward, "Th��ng boss KDYV");
                local nCaptain = GetTeamMember(0);
                if nCaptain == PlayerIndex then
                    AddItem(2,1,40128,10,4);
                end
            end
        end
    end
    return WEnv.RETCODE_SUCCESS;
end
----------------------------------------------------------------------------------------------------
--Import("\\script\\newbattles\\head.lua");
----------------------------------------------------------------------------------------------------
function WAward:ChienTruong_NhanMonQuan_ThuongTop(nBattleType, nResultRank)
    nResultRank = nResultRank or WTask:GetByte(WTASKID_NEWBATTLE_LASTDATA_BYTE, WTASKID_NEWBATTLE_LASTDATA_BYTE_RANK);
    if nResultRank < 1 or nResultRank > 10 then
        return WEnv.RETCODE_NOTOPEN;
    end

    if WLib:IsTestServer() == WEnv.TRUE then
        if nBattleType == MAINBATTLE_ID then
            local nLastBatteDate = WTask:Get(WTASKID_NEWBATTLE_LASTDATA_DATE);
            if WTask:GetByte(WTASKID_NEWBATTLE_LASTDATA_BYTE, WTASKID_NEWBATTLE_LASTDATA_BYTE_JOINHOUR) == 20 then

                if nLastBatteDate >= 20221221 and nLastBatteDate <= 20221223 then
                    -- cho nh�n code trong 3 ng�y 21 22 23
                    WGIFTCODE_ALPHATEST:GiveBattleTopAward(nResultRank);
                end

            end
        end
    end
end
function WAward:ChienTruong_NhanMonQuan(nBattleType, nResult, nBonusType, nGetExpAwardCount, bUseSpyCloth)
    WTask:ResetDaily();

    if nBattleType == MAINBATTLE_ID then
        self:ChienTruong_NhanMonQuan_ThuongTop(nBattleType);
    end

    WTask:Set(WTASKID_NEWBATTLE_LASTDATA_DATE, 0); --LongDaiKa: reset data tr�n cu�i
    WTask:Set(WTASKID_NEWBATTLE_LASTDATA_BYTE, 0); --LongDaiKa: reset data tr�n cu�i

    local tbBattleAwards = {
        [VILLAGE_ID] = {
            --{ tbProp = { 2, 1, 30526 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- T�y T�m Th�ch Lv6
            --{ tbProp = { 2, 1, 30532 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� Thi�t Lv6

            --{ tbProp = { 2, 1, 31402 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- T�y T�m Th�ch Lv7
            --{ tbProp = { 2, 1, 31401 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� Thi�t Lv7
            --
            ----- Th�nh Ho� ��n
            --{ nFunc = "oly_AddShengHuo(30, 2)" },
        },
        [RESOURCE_ID] = {
            --{ tbProp = { 2, 1, 30526 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- T�y T�m Th�ch Lv6
            --{ tbProp = { 2, 1, 30532 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� Thi�t Lv6

            --{ tbProp = { 2, 1, 31402 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- T�y T�m Th�ch Lv7
            --{ tbProp = { 2, 1, 31401 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� Thi�t Lv7
            --
            ----- Th�nh Ho� ��n
            --{ nFunc = "oly_AddShengHuo(30, 2)" },
        },
        [EMPLACEMENT_ID] = {
            --{ tbProp = { 2, 1, 30526 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- T�y T�m Th�ch Lv6
            --{ tbProp = { 2, 1, 30532 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� Thi�t Lv6
            --
            --{ tbProp = { 2, 1, 31402 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- T�y T�m Th�ch Lv7
            --{ tbProp = { 2, 1, 31401 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� Thi�t Lv7
            --
            ----- Th�nh Ho� ��n
            --{ nFunc = "oly_AddShengHuo(30, 2)" },
        },
        [MAINBATTLE_ID] = {
            --{ tbProp = { 2, 1, 30526 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- T�y T�m Th�ch Lv6
            --{ tbProp = { 2, 1, 30532 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� Thi�t Lv6
            --
            --{ tbProp = { 2, 1, 31402 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- T�y T�m Th�ch Lv7
            --{ tbProp = { 2, 1, 31401 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� Thi�t Lv7

            --- Th�nh Ho� ��n
            --{ nFunc = "oly_AddShengHuo(50, 2)" },
        },
    };
    if g_WCFG_RUONGHOATDONG:IsDateOpen() == WEnv.TRUE then
        tinsert(tbBattleAwards[VILLAGE_ID], { tbProp = { 2, 1, 40063 }, nStack = 10, nStatus = ITEMSTATUS_LOCK });-- R��ng Ho�t ��ng
        tinsert(tbBattleAwards[RESOURCE_ID], { tbProp = { 2, 1, 40063 }, nStack = 10, nStatus = ITEMSTATUS_LOCK });-- R��ng Ho�t ��ng
        tinsert(tbBattleAwards[EMPLACEMENT_ID], { tbProp = { 2, 1, 40063 }, nStack = 10, nStatus = ITEMSTATUS_LOCK });-- R��ng Ho�t ��ng
        tinsert(tbBattleAwards[MAINBATTLE_ID], { tbProp = { 2, 1, 40063 }, nStack = 20, nStatus = ITEMSTATUS_LOCK });-- R��ng Ho�t ��ng
    end



    if nBonusType == QCC_VINHDU then
        tinsert(tbBattleAwards[nBattleType], { tbProp = { 2, 0, 398 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }); -- C�y B�t Nh�
    end

    WAward:Give(tbBattleAwards[nBattleType], format("Nh�n th��ng %s", tBattleName[nBattleType]));

    if nBattleType == MAINBATTLE_ID then
        -- Nhi�m v� h� tr� h�ng ng�y
        WTask:SetByte(WTASKID_DAILYTASK_BYTE, WTASKID_DAILYTASK_BYTE_CTC_DONE, WTask:GetByte(WTASKID_DAILYTASK_BYTE, WTASKID_DAILYTASK_BYTE_CTC_DONE) + 1);

        -- Nhi�m v� tu�n
        WTask:SetByte(WTASKID_WEEKLYTASK_BYTE, WTASKID_WEEKLYTASK_BYTE_CTC_DONE, WTask:GetByte(WTASKID_WEEKLYTASK_BYTE, WTASKID_WEEKLYTASK_BYTE_CTC_DONE) + 1);

        -- Nhi�m v� h� tr� t�n th�
        WTask:SetByte(WTASKID_SUPPORT1_TASK_BYTE, WTASKID_SUPPORT1_TASK_BYTE_CTC_DONE, WTask:GetByte(WTASKID_SUPPORT1_TASK_BYTE, WTASKID_SUPPORT1_TASK_BYTE_CTC_DONE) + 1);

        -------------Nh�n th��ng �i�m n�ng ��ng
        if WTask:GetBit(WMISSION_AWARD_NANGDONG,WMISSION_AWARD_BIT_DAILY_NANGDONGCHIENTRUONGCHINH) ==0 then
            WTask:Set(WMISSION_AWARD_NANGDONG,WTask:Get(WMISSION_AWARD_NANGDONG)+500);
            WTask:SetBit(WMISSION_AWARD_NANGDONG,WMISSION_AWARD_BIT_DAILY_NANGDONGCHIENTRUONGCHINH,1)
        end
    else
        -- Nhi�m v� h� tr� h�ng ng�y
        WTask:SetByte(WTASKID_DAILYTASK_BYTE, WTASKID_DAILYTASK_BYTE_CTP_DONE, WTask:GetByte(WTASKID_DAILYTASK_BYTE, WTASKID_DAILYTASK_BYTE_CTP_DONE) + 1);

        -- Nhi�m v� tu�n
        WTask:SetByte(WTASKID_WEEKLYTASK_BYTE, WTASKID_WEEKLYTASK_BYTE_CTP_DONE, WTask:GetByte(WTASKID_WEEKLYTASK_BYTE, WTASKID_WEEKLYTASK_BYTE_CTP_DONE) + 1);

        -- Nhi�m v� h� tr� t�n th�
        WTask:SetByte(WTASKID_SUPPORT1_TASK_BYTE, WTASKID_SUPPORT1_TASK_BYTE_CTP_DONE, WTask:GetByte(WTASKID_SUPPORT1_TASK_BYTE, WTASKID_SUPPORT1_TASK_BYTE_CTP_DONE) + 1);

        -------------Nh�n th��ng �i�m n�ng ��ng
        if WTask:GetBit(WMISSION_AWARD_NANGDONG,WMISSION_AWARD_BIT_DAILY_NANGDONG_CHIENTRUONGPHU) ==0 then
            WTask:Set(WMISSION_AWARD_NANGDONG,WTask:Get(WMISSION_AWARD_NANGDONG)+200);
            WTask:SetBit(WMISSION_AWARD_NANGDONG,WMISSION_AWARD_BIT_DAILY_NANGDONG_CHIENTRUONGPHU,1)
        end
    end

    -- Kh�ng ch�y � d��i, ph�n d��i ch� d�ng � h�m get_all_award_new_mod
    do
        return WEnv.RETCODE_SUCCESS;
    end

    local tbNewBattleConfigs = {
        [VILLAGE_ID] = g_WCFG_NEWBATTLES_VILLAGE,
        [RESOURCE_ID] = g_WCFG_NEWBATTLES_RESOURCE,
        [EMPLACEMENT_ID] = g_WCFG_NEWBATTLES_EMPLACEMENT,
        [MAINBATTLE_ID] = g_WCFG_NEWBATTLES_MAIN,
    };

    if tbNewBattleConfigs[nBattleType] == WEnv.NULL then
        return WEnv.RETCODE_NOTOPEN;
    end

    local tbAward = tbNewBattleConfigs[nBattleType].tbDrawAward;
    if nResult == WEnv.BATTLERESULT_WIN then
        tbAward = tbNewBattleConfigs[nBattleType].tbWinAward;
    elseif nResult == WEnv.BATTLERESULT_LOSE then
        tbAward = tbNewBattleConfigs[nBattleType].tbLoseAward;
    end

    local nGiveExp = 2*tbAward.nExp * g_tbQCCBonusRateCfg[nBonusType].nExpRate;
    local nGiveHonor = 2*tbAward.nHonor * g_tbQCCBonusRateCfg[nBonusType].nHonorRate;
    local nGiveBattlePoint = 2*tbAward.nBattlePoint * g_tbQCCBonusRateCfg[nBonusType].nBattlePointRate;

    --1. d�ng m�t n� th� kh�ng cho nh�n th��ng v�i qu�n c�ng ch��ng c�c lo�i
    if nBonusType ~= 0 and bUseSpyCloth == WEnv.TRUE then
        WPlayer:Msg(format("Hi�u qu� m�t n� gi�n �i�p: kh�ng th� nh�n th��ng v�i %s.", QCC_NAMES[nBonusType]));
        return WEnv.RETCODE_ERROR;
    end

    --2. nh�n th��ng exp chi�n tr��ng ch�nh ch� ���c 1 l�n trong ng�y
    if nBattleType == MAINBATTLE_ID then
        if nGetExpAwardCount > 0 then
            nGiveExp = 0;
            WPlayer:Msg("H�m nay �� nh�n r�i, m�i ng�y ch� ���c 1 l�n th��ng kinh nghi�m.");
        end
    end

    --3. s� d�ng m�t n� gi�n �i�p s� kh�ng nh�n d��c �i�m qu�n c�ng
    if bUseSpyCloth == WEnv.TRUE then
        nGiveHonor = 0;
        WPlayer:Msg("Hi�u qu� m�t n� gi�n �i�p: kh�ng nh�n ���c qu�n c�ng.");
    end

    self:Give({ nExp = nGiveExp, nHonor = nGiveHonor, nBattlePoint = nGiveBattlePoint }, format("Nh�n th��ng %s", tBattleName[nBattleType]));

    return WEnv.RETCODE_SUCCESS;
end

function WAward:TaiNguyenChien_HoanThanhNv(nBonusType)
    WTask:ResetDaily();

    --Giftcode alphatest
    WGIFTCODE_ALPHATEST:SuccessTaskReq("TaiNguyenChien", 1); --LongDaiKa: ph�n th��ng code alphatest

    -- Nhi�m v� h� tr� h�ng ng�y
    WTask:SetByte(WTASKID_DAILYTASK_BYTE, WTASKID_DAILYTASK_BYTE_TNC_DONE, WTask:GetByte(WTASKID_DAILYTASK_BYTE, WTASKID_DAILYTASK_BYTE_TNC_DONE) + 1);

    -- Nhi�m v� tu�n
    WTask:SetByte(WTASKID_WEEKLYTASK_BYTE, WTASKID_WEEKLYTASK_BYTE_TNC_DONE, WTask:GetByte(WTASKID_WEEKLYTASK_BYTE, WTASKID_WEEKLYTASK_BYTE_TNC_DONE) + 1);

    -- Nhi�m v� h� tr� t�n th�
    WTask:SetByte(WTASKID_SUPPORT1_TASK_BYTE, WTASKID_SUPPORT1_TASK_BYTE_TNC_DONE, WTask:GetByte(WTASKID_SUPPORT1_TASK_BYTE, WTASKID_SUPPORT1_TASK_BYTE_TNC_DONE) + 1);
    SetTask(WTASKID_DAYLY_TNC_DAILY_COUNT,GetTask(WTASKID_DAYLY_TNC_DAILY_COUNT)+1)
    --- Th�nh Ho� ��n
    --oly_AddShengHuo(20, 3);
    if nBonusType == 5 then
        AddItem(2, 1, 50263,50,1);
        if GetTask(WTASKID_DAYLY_TNC_DAILY_COUNT)==6 then
            AddItem(2, 1, 31239,3); -- Th��ng 3 Linh Ph�ch ��n
        end
    end

end
--------Th��ng nh�n v�t k�t th�c Boss
function WAward:WorldBoss_KillBoss(szBossName)
    local tbAward = {
        { tbProp = { 2, 95, 204 }, nStack = 1 }, -- Thi�n cang
        { tbProp = { 2, 1, 30370 }, nStack = 1 }, -- Thien Mon lenh
        { tbProp = { 2, 1, 31194 }, nStack = 3, }, -- Thanh Long Hon
        { tbProp = { 2, 1, 31402 }, nStack = 10, }, -- T�y t�m 6
        { tbProp = { 2, 1, 31401 }, nStack = 10, }, -- Luy�n L� 6
        --{ tbProp = { 2, 1, 31252 }, nStack = 10, }, -- ��i Linh Th�ch-Cao 4
        --{ tbProp = { 2, 1, 31253 }, nStack = 10, }, -- ��i Linh Th�ch-Cao 5
        --{ tbProp = { 2, 1, 31254 }, nStack = 10, }, -- ��i Linh Th�ch-Cao 6
        --{ tbProp = { 2, 102, 225 }, nStack = 5 }, -- Th��ng H�i Ch�u C�p 7 (Ch�a gi�m ��nh)
        --{
        --    { tbProp = { 2, 1, 31324 }, nStack = 10, nRate = 5 }, -- Th� c��i manh manh
        --    { tbProp = { 2, 1, 31321 }, nStack = 10, nRate = 5 }, -- X� Qu�n T�a Linh Th�ch 2
        --    { tbProp = { 2, 1, 31393 }, nStack = 10, nRate = 16.6 }, -- X� Qu�n T�a Linh Th�ch 3
        --    { tbProp = { 2, 1, 31394 }, nStack = 10, nRate = 16.6 }, -- X� Qu�n T�a Linh Th�ch 4
        --    { tbProp = { 2, 1, 31395 }, nStack = 10, nRate = 16.6 }, -- X� Qu�n T�a Linh Th�ch 5
        --    { tbProp = { 2, 1, 31396 }, nStack = 10, nRate = 16.6 }, -- X� Qu�n T�a Linh Th�ch 6
        --},
        ---c�p nh�p event t�t 2023 qu� m�o
        { nFunc = "KsgAward:DropEventBox(20)" },
    };

    self:Give(tbAward, format("Th��ng gi�t boss %s", szBossName));
end
-------------------------Ph�n th��ng Boss H�ng ng�y R��ng ��i Chi�n
function WAward:WorldBoss_OpenBigBox()
    local tbAward = {
        --{ tbProp = { 2, 102, 215 }, nStack = 15000 }, -- B�t Tr�n Ch�u
        { tbProp = { 2, 1, 30847 }, nStack = 10 }, -- h�i ti�n ��n
        { tbProp = { 2, 1, 30370 }, nStack = 2, }, -- Thi�n m�n l�nh
        { tbProp = { 2, 95, 204 }, nStack = 2, }, -- Theien cang l�nh
        { tbProp = { 2, 1, 30687 }, nStack = 200, }, -- Thai nh�t L�nh
        { tbProp = { 2, 1, 31294 }, nStack = 1, }, -- Uy H� H�n
        { tbProp = { 2, 1, 31402 }, nStack = 20, }, -- T�y t�m 7
        { tbProp = { 2, 1, 31401 }, nStack = 20, }, -- Luy�n L� 7
        --{ tbProp = { 2, 201, 15 }, nStack = 1 }, -- �i�m Tinh Ng�c

        ---c�p nh�p event t�t 2023 qu� m�o
    --    { nFunc = "KsgAward:DropEventBox(20)" },
    --
    --    { tbProp = { 2, 1, 30390 }, nStack = 250 }, -- M�nh Thi�n Cang
    --    { tbProp = { 2, 1, 30410 }, nStack = 50 }, -- M�nh Thi�n M�n
    --    {
    --        { tbProp = { 2, 1, 31391 }, nStack = 10, nRate = 17 }, -- X� Qu�n T�a Linh Th�ch 1
    --        { tbProp = { 2, 1, 31392 }, nStack = 10, nRate = 16.6 }, -- X� Qu�n T�a Linh Th�ch 2
    --        { tbProp = { 2, 1, 31393 }, nStack = 10, nRate = 16.6 }, -- X� Qu�n T�a Linh Th�ch 3
    --        { tbProp = { 2, 1, 31394 }, nStack = 10, nRate = 16.6 }, -- X� Qu�n T�a Linh Th�ch 4
    --        { tbProp = { 2, 1, 31395 }, nStack = 10, nRate = 16.6 }, -- X� Qu�n T�a Linh Th�ch 5
    --        { tbProp = { 2, 1, 31396 }, nStack = 10, nRate = 16.6 }, -- X� Qu�n T�a Linh Th�ch 6
    --    },
    --    {
    --        { tbProp = { 2, 1, 31402 }, nStack = 20, nRate = 50 }, -- T�y T�m Th�ch Lv7
    --        { tbProp = { 2, 1, 31401 }, nStack = 20, nRate = 50 }, -- Luy�n L� Thi�t Lv7
    --    }
    };
    self:Give(tbAward, "Th��ng m� R��ng V�ng ��i Chi�n");
end
---------- R��ng b�o h�p Boss h�ng ng�y
function WAward:WorldBoss_OpenSmallBox()
    local tbAward = {
        { tbProp = { 2, 1, 31402 }, nStack = 5, nRate= 10  }, -- Tay tam 7
        { tbProp = { 2, 1, 31401 }, nStack = 5, nRate= 10 }, -- Luyen Lo 7
        --{ tbProp = { 2, 1, 30687 }, nStack = 20, }, -- Thai nh�t L�nh
        --{ tbProp = { 2, 1, 31194 }, nStack = 1, }, -- �Thanh Long hon
        --{ tbProp = { 2, 1, 30426 }, nStack = 1, }, -- Bua Cuong hoa 14
        { tbProp = { 2, 102, 210 }, nStack = 30, nRate = 20 }, -- 1th��ng h�i di ch�u c3
        { tbProp = { 2, 102, 211 }, nStack = 20, nRate = 20 }, -- 1th��ng h�i di ch�u c4
        { tbProp = { 2,1,1157 }, nStack = 1, nRate = 10 }, -- Dau hon
        { tbProp = { 2, 102, 212 }, nStack = 5, nRate = 10 }, -- 1th��ng h�i di ch�u c5
        { nGold = 10,  nRate = 3 },
        { nGold = 200000,  nRate = 7 },
        ---c�p nh�p event t�t 2023 qu� m�o
        --{ nFunc = "KsgAward:DropEventBox(20)" },
        --
        --{
        --    { tbProp = { 2, 1, 31391 }, nStack = 2, nRate = 17 }, -- X� Qu�n T�a Linh Th�ch 1
        --    { tbProp = { 2, 1, 31392 }, nStack = 2, nRate = 16.6 }, -- X� Qu�n T�a Linh Th�ch 2
        --    { tbProp = { 2, 1, 31393 }, nStack = 2, nRate = 16.6 }, -- X� Qu�n T�a Linh Th�ch 3
        --    { tbProp = { 2, 1, 31394 }, nStack = 2, nRate = 16.6 }, -- X� Qu�n T�a Linh Th�ch 4
        --    { tbProp = { 2, 1, 31395 }, nStack = 2, nRate = 16.6 }, -- X� Qu�n T�a Linh Th�ch 5
        --    { tbProp = { 2, 1, 31396 }, nStack = 2, nRate = 16.6 }, -- X� Qu�n T�a Linh Th�ch 6
        --},
        --{
        --    { tbProp = { 2, 1, 31402 }, nStack = random(10, 20), nRate = 50 }, -- T�y T�m Th�ch Lv7
        --    { tbProp = { 2, 1, 31401 }, nStack = random(10, 20), nRate = 50 }, -- Luy�n L� Thi�t Lv7
        --}
    };
    --if g_WCFG_RUONGHOATDONG:IsDateOpen() == WEnv.TRUE then
    --    tinsert(tbAward, { tbProp = { 2, 1, 40063 }, nStack = 10 });-- R��ng Ho�t ��ng
    --end
    self:Give(tbAward, "Th��ng m� R��ng B�o H�p");
end

---Ph�n th��ng th�i h� c� ch� m�i
function WAward:ThaiHu2_HoanThanhTatCaAi()
    local tbAward = {
        { tbProp = { 2, 1, 31766 }, nStack = 50, nStatus = ITEMSTATUS_TRADE }, -- R��ng Th�i H�
        --{ tbProp = { 2, 1, 31096 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- L�u Kim

        ---c�p nh�p event t�t 2023 qu� m�o
        { nFunc = "KsgAward:DropEventBox(50)" },
    };

    self:Give(tbAward, "Ho�n th�nh t�t c� �i th�i h� m�i");
    SetTask(WTASKID_DAYLY_THAIHU_DAILY_COUNT,GetTask(WTASKID_DAYLY_THAIHU_DAILY_COUNT)+1)
    if GetTask(WTASKID_DAYLY_THAIHU_DAILY_COUNT)==4 then
        AddItem(2,1,31239,6);
    end
end

---Ph�n th��ng ho�n th�nh c�c �i t�ng ki�m
---@param nChance number S� l�n v��t �i
---@param nStage number T�ng ho�n th�nh
function WAward:TangKiem_HoanThanhAi(nChance, nStage)
    nChance = tonumber(nChance) or 0;
    nStage = tonumber(nStage) or 0;

    if nChance <= 0 then
        return WEnv.RETCODE_NOTOPEN;
    end

    if WTask:GetByte(WTASKID_TANGKIEM_BYTE, WTASKID_TANGKIEM_BYTE_GIVE_STAGE_AWARD_STATUS) == nStage then
        -- fix bug ��p ph�n th��ng
        --WPlayer:Msg("Debug ��p ph�n th��ng!");
        return WEnv.RETCODE_ERROR;
    else
        WTask:SetByte(WTASKID_TANGKIEM_BYTE, WTASKID_TANGKIEM_BYTE_GIVE_STAGE_AWARD_STATUS, nStage);
    end

    local tbAward = {
        [7] = {
            { nGold = 3000000 },
            { tbProp = { 2, 1, 31767 }, nStack = 50, nStatus = ITEMSTATUS_TRADE }, -- R��ng T�ng Ki�m
            ---c�p nh�p event t�t 2023 qu� m�o
            { nFunc = "KsgAward:DropEventBox(50)" },
        },
    };

    if tbAward[nStage] ~= WEnv.NULL then
        self:Give(tbAward[nStage]);
        SetTask(WTASKID_DAYLY_TANGKIEM_DAILY_COUNT,GetTask(WTASKID_DAYLY_TANGKIEM_DAILY_COUNT)+1)
    end
    if GetTask(WTASKID_DAYLY_TANGKIEM_DAILY_COUNT)==4 then
        AddItem(2,1,31239,6);
    end
    return WEnv.RETCODE_SUCCESS;
end

---Ph�n th��ng gi�t boss trong TNC
---@param szBossName string
function WAward:BossTnc_KillBoss(szBossName)
    local tbAward = {
        { nExp = 300000000 }, -- 1 t� exp
        { tbProp = { 2, 1, 539 }, nStack = 5 }, -- Ho�ng Kim ��i H�ng Bao
        { tbProp = { 2, 1, 31294 }, nStack = 5, nStatus = ITEMSTATUS_TRADE }, -- uy H� H�n
        { tbProp = { 2, 95, 204 }, nStack = 5,nStatus = ITEMSTATUS_LOCK }, -- Thi�n cang
        { tbProp = { 2, 1, 30370 }, nStack = 5,nStatus = ITEMSTATUS_LOCK }, -- Thien Mon lenh
        --{ tbProp = { 2, 1, 40046 }, nStack = 50 }, -- M�nh t�y bi�n
    };

    self:Give(tbAward, format("Th��ng gi�t boss t�i nguy�n chi�n %s", szBossName));
end

---Ph�n th��ng m� r��ng boss trong TNC
function WAward:BossTnc_OpenSmallBox()
    local nCountrd=random( 1,3) or 1;
    local tbAward = {
        { nExp = 300000000 }, -- 300 tri�u exp
        { tbProp = { 2, 1, 31239 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Linh Ph�ch ��n
        --{ tbProp = { 2, 1, 31194 }, nStack = random(1, 3), nStatus = ITEMSTATUS_LOCK }, -- H�i Ti�n ��n
        { tbProp = { 2, 1, 31194 }, nStack = nCountrd, nStatus = ITEMSTATUS_LOCK }, -- Thanh Long Hon
        {
            { tbProp = { 2, 1, 40037 }, nStack = 1, nRate = 16 }, -- T�i K� N�ng B�H Lv6
            { tbProp = { 2, 102, 225 }, nStack = 1, nRate = 3 }, -- Th��ng H�i Ch�u C�p 7 (Ch�a gi�m ��nh)
            { tbProp = { 2,102,224 }, nStack = 1, nRate = 5 }, -- Th��ng H�i Ch�u C�p 6
            { tbProp = { 2, 102, 223 }, nStack = 10, nRate = 10 },-- Th��ng H�i Ch�u C�p5
            { tbProp = { 2, 1, 30390 }, nStack = 60, nRate = 5 }, -- M�nh Thi�n Cang
            { tbProp = { 2, 1, 30410 }, nStack = 60, nRate = 5 }, -- M�nh Thi�n M�n
            { tbProp = { 2, 1, 539 }, nStack =1, nRate = 10}, -- Ho�ng Kim ��i H�ng Bao
            { tbProp = { 2, 1, 31402 }, nStack = 10, nRate = 10 }, -- T�y T�m Th�ch Lv7
            { tbProp = { 2, 1, 31401 }, nStack = 10, nRate = 10 }, -- Luy�n L� Thi�t Lv7
            { tbProp = { 2, 1, 1009 }, nStack = 5, nRate = 10 }, -- Thi�n th�ch tinh th�ch
            --{ tbProp = { 2, 114, 143 }, nStack = 10, nRate = 15 }, -- Thi�n V�n Th�ch
            { tbProp = {  2, 1, 31505 }, nStack = 10, nRate = 1 }, -- T�i �� Qu� C�p 7
            { tbProp = {  2,1,31123 }, nStack = 15, nRate = 5 }, -- T�i �� Qu� C�p 6
            { tbProp = {  2, 114, 143 }, nStack = 1, nRate = 10}, -- Ch�n vo hon thach
        }
    };

    self:Give(tbAward, "Th��ng m� r��ng boss boss t�i nguy�n chi�n");
end
function WAward:GiveBack_Honor()
    if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
        fileName = "data\\givebackhonor.txt";
    else
        fileName = "data/givebackhonor.txt";
    end
    local szData=GetAccount().."=";
    local HonorGive=0;
    local pf = openfile(fileName, "r");
    if pf ~= nil then
        local str = ""
        local nRow = 0
        while 1 do
            nRow = nRow + 1
            str = read(pf, "*l");
            if not str then break end
            if strfind(str,szData) then
                local nPosition = strfind(str,"=");
                HonorGive = strsub(str,nPosition+1) or 0
                if GetTask(WTASKID_GIVEBACK_HONOR)~=1 then
                    local nHonorBefore=WPlayer:GetHonor();
                    WPlayer:ModifyHonor(HonorGive)
                    SetTask(WTASKID_GIVEBACK_HONOR,1)
                    WPlayerLog:WriteBattleLog("giveback_honor", "Ho�n Tr� C�ng Tr�ng", 0, "", WPlayer:GetExp(), 0, nHonorBefore, HonorGive, WPlayer:GetBattlePoint(), 0);
                end
            end
        end
        closefile(pf);
        return HonorGive;
    else
        return 0
    end
end
----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: c¸c hµm liªn quan tíi phÇn th­ëng ho¹t ®éng
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

---PhÇn th­ëng giÕt boss L­¬ng S¬n B¹c tõng ¶i
---@param nStage number TÇng hoµn thµnh
function WAward:LuongSonBac_KillBoss(nStage)
    if nStage == WEnv.NULL then
        return WEnv.RETCODE_ERROR;
    end
    local tbStageAward = {
        [1] = {
            { tbProp = { 2, 1, 40017 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R­¬ng L­¬ng S¬n B¹c
            --{ tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng anh hïng
            --{ nFunc = "KsgAward:DropEventBox(10)" },
            ---cËp nhËp event tÕt 2023 quý m·o
            --{ nFunc = "KsgAward:DropEventBox(2)" },

            --- Th¸nh Ho¶ §µn
            --{ nFunc = "oly_AddShengHuo(20, 5)" },
        },
        [2] = {
            { tbProp = { 2, 1, 40017 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R­¬ng L­¬ng S¬n B¹c
            --{ tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng anh hïng
            --{ nFunc = "KsgAward:DropEventBox(2)" },

            --- Th¸nh Ho¶ §µn
            --{ nFunc = "oly_AddShengHuo(20, 5)" },
        },
        [3] = {
            { tbProp = { 2, 1, 40017 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R­¬ng L­¬ng S¬n B¹c
          --  { tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng anh hïng
            --{ nFunc = "KsgAward:DropEventBox(2)" },

            --- Th¸nh Ho¶ §µn
            --{ nFunc = "oly_AddShengHuo(20, 5)" },
        },
        [4] = {
            { tbProp = { 2, 1, 40017 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R­¬ng L­¬ng S¬n B¹c
           -- { tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng anh hïng
            --{ nFunc = "KsgAward:DropEventBox(2)" },

            --- Th¸nh Ho¶ §µn
            --{ nFunc = "oly_AddShengHuo(20, 5)" },
        },
        [5] = {
            { tbProp = { 2, 1, 40017 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R­¬ng L­¬ng S¬n B¹c
           -- { tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng anh hïng
            --{ nFunc = "KsgAward:DropEventBox(2)" },

            --- Th¸nh Ho¶ §µn
            --{ nFunc = "oly_AddShengHuo(20, 5)" },
        },
        [6] = {
            { tbProp = { 2, 1, 40017 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R­¬ng L­¬ng S¬n B¹c
            --{ tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng anh hïng
            -- { nFunc = "KsgAward:DropEventBox(2)" },

            -- Th¸nh Ho¶ §µn
            --{ nFunc = "oly_AddShengHuo(20, 5)" },
        },
        [7] = {
            { tbProp = { 2, 1, 40017 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R­¬ng L­¬ng S¬n B¹c
            --{ tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng anh hïng
            --{ nFunc = "KsgAward:DropEventBox(2)" },

            -- Th¸nh Ho¶ §µn
            --{ nFunc = "oly_AddShengHuo(20, 5)" },
        },
        [8] = {
            { tbProp = { 2, 1, 40017 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R­¬ng L­¬ng S¬n B¹c
            -- tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng anh hïng
            --{ nFunc = "KsgAward:DropEventBox(2)" },

            -- --Th¸nh Ho¶ §µn
            --{ nFunc = "oly_AddShengHuo(20, 5)" },
        },
    };
    if tbStageAward[nStage] then
        for _, tbAward in tbStageAward[nStage] do
            if _ ~= "n" then
                local nCaptain = GetTeamMember(0);
                if nCaptain == PlayerIndex then
                self:Give(tbAward, "Th­ëng boss LSB");
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

---PhÇn th­ëng giÕt boss §Þa HuyÒn Cung theo tõng ¶i
---@param nStage number TÇng hoµn thµnh
function WAward:DiaHuyenCung_KillBoss(nStage)
    if nStage == WEnv.NULL then
        return WEnv.RETCODE_ERROR;
    end
    local tbStageAward = {
        [1] = {
            { tbProp = { 2, 1, 40018 }, nStack = 4,nStatus = ITEMSTATUS_TRADE }, -- R­¬ng ®Þa huyÒn cung
           -- { tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng anh hïng
            --{ nFunc = "KsgAward:DropEventBox(2)" },
            ---cËp nhËp event tÕt 2023 quý m·o
            --{ nFunc = "KsgAward:DropEventBox(10)" },

            --- Th¸nh Ho¶ §µn
            --{ nFunc = "oly_AddShengHuo(20, 1)" },
        },
        [2] = {
            { tbProp = { 2, 1, 40018 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R­¬ng ®Þa huyÒn cung
           -- { tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng anh hïng
            --{ nFunc = "KsgAward:DropEventBox(2)" },
        },
        [3] = {
            --{ tbProp = { 2, 1, 40018 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R­¬ng ®Þa huyÒn cung
            --{ tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng anh hïng
            --{ nFunc = "KsgAward:DropEventBox(2)" },
        },
        [4] = {
            { tbProp = { 2, 1, 40018 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, --R­¬ng ®Þa huyÒn cung
          --  { tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng anh hïng
            --{ nFunc = "KsgAward:DropEventBox(2)" },
        },
        [5] = {
            { tbProp = { 2, 1, 40018 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, -- R­¬ng ®Þa huyÒn cung
          --  { tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng anh hïng
            --{ nFunc = "KsgAward:DropEventBox(2)" },
        },
        [6] = {
            { tbProp = { 2, 1, 40018 }, nStack =4, nStatus = ITEMSTATUS_TRADE }, -- R­¬ng ®Þa huyÒn cung
            --{ tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng anh hïng
            --{ nFunc = "KsgAward:DropEventBox(2)" },
       },
       [7] = {
            { tbProp = { 2, 1, 40018 }, nStack =4, nStatus = ITEMSTATUS_TRADE }, -- R­¬ng ®Þa huyÒn cung
            --{ tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng anh hïng
            --{ nFunc = "KsgAward:DropEventBox(2)" },
        },
      [8] = {
            { tbProp = { 2, 1, 40018 }, nStack = 4, nStatus = ITEMSTATUS_TRADE }, --R­¬ng ®Þa huyÒn cung
           --{ tbProp = { 2, 1, 30499 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng anh hïng
            --{ nFunc = "KsgAward:DropEventBox(2)" },
        },
    };
    if tbStageAward[nStage] then
        for _, tbAward in tbStageAward[nStage] do
            if _ ~= "n" then
                local nCaptain = GetTeamMember(0);
                if nCaptain == PlayerIndex then
                    self:Give(tbAward, "Th­ëng boss §HC");
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

---PhÇn th­ëng trång thµnh c«ng B¸t Nh· Lín
function WAward:BatNhaLon_ThuHoach()
    WTask:ResetDaily();

    -----@type table
    local tbAward = {
        { nExp = 50000000 },
        { nGold = 2000000 },
        { nFunc = "KsgAward:DropEventBox(10)" },
        { tbProp = { 2, 1, 31122 }, nStack = 1 }, -- Linh Khi ruc ro
        { tbProp = { 2, 1, 1124 }, nStack = 1 }, -- B¸nh Ýt ch©n gµ
        { tbProp = { 2, 1, 1125 }, nStack = 1 }, -- B¸nh Ýt b¸t b¶o
        { tbProp = { 2, 1, 30410 }, nStack = 5}, -- M¶nh Thiªn m«n
        { tbProp = { 2, 1, 30390 }, nStack = 30 }, -- M¶nh thiªn cang
        { tbProp = { 2, 1, 40037 }, nStack = 1 }, -- Tói thó c­ng cÊp 6
        { tbProp = { 2, 1, 30687 }, nStack = 10 }, -- Th¸i NhÊt LÖnh

        --{ tbProp = { 2, 102, 215 }, nStack = 500, nStatus = ITEMSTATUS_EQUIP_LOCK }, -- Bét Tr©n Ch©u
        {
            { tbProp = { 2, 1, 31402 }, nStack = 3, nRate = 20.00 }, -- Tay Tam Thach lv7
            { tbProp = { 2, 1, 31401 }, nStack = 3 , nRate = 20.00}, -- LuyÖn l« thiÕt c7
            --{ tbProp = { 2, 1, 40048 }, nStack = 5, nRate = 50 }, --M¶nh BÝ §iÓn 27
            { tbProp = { 2, 1, 40049 }, nStack = 5, nRate = 40.00 }, -- M¶nh BÝ §iÓn 30
            --{ nFunc = "_w_book_AddBookByType(1100, 6, 0, 3, 27, 27, 27, 27, 5)", nRate = 50 }, -- MËt TÞch BÝ §iÓn 27% ngÉu nhiªn ph¸i
            --{ nFunc = "_w_book_AddBookByType(100, 6, 0, 3, 30, 30, 30, 30, 1)", nRate = 50 }, -- MËt TÞch BÝ §iÓn 30% ngÉu nhiªn ph¸i
            --{ tbProp = { 2, 1, 40057 }, nStack = 1, nRate = 5 }, -- Tói mËt tÞch bÝ ®iÓn 27
            --{ tbProp = { 2, 1, 40058 }, nStack = 1, nRate = 5 }, -- Tói mËt tÞch bÝ ®iÓn 30
            { tbProp = { 2, 1, 40037 }, nStack = 1, nRate = 15.00 }, -- Tói Kü N¨ng B§H Lv6
            { tbProp = { 2, 102, 214 }, nStack = 1,nStatus = ITEMSTATUS_LOCK, nRate = 5.00}, -- Ch©u 7
          ---cËp nhËp event tÕt 2023 quý m·o


         },


        --{ nFunc = "KsgAward:DropEventBox(20)" },
        ---50% nhËn ®­îc ngÉu nhiªn 1 trong 2 lo¹i event 1 hoÆc 2 kho¸
        --{
        --    { tbProp = MONTHLY_EVENT_AWARD1, nRate = 25, nStatus = ITEMSTATUS_LOCK },
        --    { tbProp = MONTHLY_EVENT_AWARD2, nRate = 25, nStatus = ITEMSTATUS_LOCK },
        --},
    };

    --if g_WCFG_RUONGHOATDONG:IsDateOpen() == WEnv.TRUE then
    --    tinsert(tbAward, { tbProp = { 2, 1, 40063 }, nStack = 1 });-- R­¬ng Ho¹t §éng
    --end
   if GetTask(WTASKID_DAYLY_BATNHALON_DAILY_COUNT) == 15 then
    		--FireEvent("event_mission_task_award","planttree","plantbigtree",16)
    	gf_AddItemEx2({2,1,31239 , 5,4}, "Linh Phach §¬n", "Ho¹t ®éng th¸ng 10/2015", "Thu ho¹ch 16 B¸t nh· to",0,1)
   end
    --------set thuoowngr ®iÓm n¨ng ®éng
    if WTask:GetBit(WMISSION_AWARD_NANGDONG,WMISSION_AWARD_BIT_DAILY_NANGDONG_BATNHA) ==0 then
        WTask:Set(WMISSION_AWARD_NANGDONG,WTask:Get(WMISSION_AWARD_NANGDONG)+100);
        WTask:SetBit(WMISSION_AWARD_NANGDONG,WMISSION_AWARD_BIT_DAILY_NANGDONG_BATNHA,1)
    end

    self:Give(tbAward, "Th­ëng thu ho¹ch BNL");

    --Th­ëng code alphatest
    WGIFTCODE_ALPHATEST:SuccessTaskReq("BatNhaLon", 1);

    --NhiÖm vô tuÇn
    WTask:SetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_BNL_DONE, WTask:GetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_BNL_DONE) + 1);

    -- NhiÖm vô hç trî t©n thñ
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
        { tbProp = { 2, 1, 30499 }, nStack = 5,nStatus = ITEMSTATUS_LOCK }, -- Hu©n ch­¬ng Anh Hung
        --{ tbProp = { 2, 1, 1124 }, nStack = 1 }, -- B¸nh Ýt ch©n gµ
        --{ tbProp = { 2, 1, 1125 }, nStack = 1 }, -- B¸nh Ýt b¸t b¶o
        --{ tbProp = { 2, 1, 30410 }, nStack = 5}, -- M¶nh Thiªn m«n
        --{ tbProp = { 2, 1, 30390 }, nStack = 25 }, -- M¶nh thiªn cang
        --{ tbProp = { 2, 1, 40025 }, nStack = 1 }, -- Tói thó c­ng cÊp 5
        --{ tbProp = { 2, 102, 215 }, nStack = 500, nStatus = ITEMSTATUS_EQUIP_LOCK }, -- Bét Tr©n Ch©u
        { tbProp = { 2, 1, 30525 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Tay Tam 5
        { tbProp = { 2, 1, 30114}, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Bat nha chung thu
        {
            { tbProp = { 2, 1, 40049 }, nStack = 5, nRate = 50 }, ---m¶nh bÝ ®iÓn 30
            --{ nFunc = "_w_book_AddBookByType(1100, 6, 0, 3, 27, 27, 27, 27, 5)", nRate = 50 }, -- MËt TÞch BÝ §iÓn 27% ngÉu nhiªn ph¸i
            --{ nFunc = "_w_book_AddBookByType(100, 6, 0, 3, 30, 30, 30, 30, 1)", nRate = 1 }, -- MËt TÞch BÝ §iÓn 30% ngÉu nhiªn ph¸i
            { tbProp = { 2, 102, 213 }, nStack = 1,nStatus = ITEMSTATUS_LOCK, nRate = 5}, -- Ch©u 6
            { tbProp = { 2, 102, 212 }, nStack = 1,nStatus = ITEMSTATUS_LOCK, nRate = 45}, -- Ch©u 5
           -- { tbProp = { 2, 1, 30531 }, nStack = 1, nRate = 50.00,nStatus = ITEMSTATUS_LOCK }, -- Luyen Lo 5
            --{ tbProp = { 2, 1, 31248 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_LOCK }, -- Tô Linh QuyÕt
          --  { tbProp = { 2, 1, 30847 }, nStack = 1, nRate = 10.00,nStatus = ITEMSTATUS_LOCK }, -- Håi tiªn ®¬n
            --{ tbProp = { 2, 1, 30731 }, nStack = 1, nRate = 10.00,nStatus = ITEMSTATUS_LOCK }, -- Kinh mach Ngan nhan

            ---cËp nhËp event tÕt 2023 quý m·o
            --{ tbProp = { 2, 1, 40037 }, nStack = 1, nRate = 50 }, -- Tói Kü N¨ng B§H Lv6
        },

        ---cËp nhËp event tÕt 2023 quý m·o
        --{ nFunc = "KsgAward:DropEventBox(10)" },
        ---50% nhËn ®­îc ngÉu nhiªn 1 trong 2 lo¹i event 1 hoÆc 2 kho¸
        --{
        --    { tbProp = MONTHLY_EVENT_AWARD1, nRate = 25, nStatus = ITEMSTATUS_LOCK },
        --    { tbProp = MONTHLY_EVENT_AWARD2, nRate = 25, nStatus = ITEMSTATUS_LOCK },
        --},
    };
    ---------event tet 2024 Canh Thinh
    --if g_WCFG_RUONGHOATDONG:IsDateOpen() == WEnv.TRUE then
    --    tinsert(tbAward, { tbProp = { 2, 1, 40063 }, nStack = 1 });-- R­¬ng Ho¹t §éng
    --end

    self:Give(tbAward, "Th­ëng thu ho¹ch BNN");

    --Th­ëng code alphatest
    WGIFTCODE_ALPHATEST:SuccessTaskReq("BatNhaNho", 1);

    --NhiÖm vô tuÇn
    WTask:SetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_BNN_DONE, WTask:GetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_BNN_DONE) + 1);

    -- NhiÖm vô hç trî t©n thñ
    WTask:SetByte(WTASKID_SUPPORT1_TASK2_BYTE, WTASKID_SUPPORT1_TASK2_BYTE_BNN_DONE, WTask:GetByte(WTASKID_SUPPORT1_TASK2_BYTE, WTASKID_SUPPORT1_TASK2_BYTE_BNN_DONE) + 1);
    ---------------------------th­ëng khi trång ®ñ c©y
    local tbAwardfinal = {
        { tbProp = { 2, 1, 31239 }, nStack = 1,nStatus = ITEMSTATUS_LOCK }, -- Linh Ph¸ch §¬n
    };
    local nCountTree = GetTask(TASK_PLAN_SMALLTREE_COUNT);
    if nCountTree ==20 then
        self:Give(tbAwardfinal, "Th­ëng thu ho¹ch 20 c©y b¸t Nh·");
    end
    return WEnv.RETCODE_SUCCESS;
end
function WAward:HatGiong_ThuHoach()
    WTask:ResetDaily();

    local tbAward = {
        { nExp = 25000000 },
        -- { nGold = 1000000 },
        --{ nExp = 3000000 },
        { tbProp = { 2, 1, 30499 }, nStack = 5 ,nStatus = ITEMSTATUS_LOCK}, -- Hu©n ch­¬ng Anh Hung
        { tbProp = { 2, 1, 30531 }, nStack = 1 }, -- Luyen Lo 5
        --{ tbProp = { 2, 1, 1124 }, nStack = 1 }, -- B¸nh Ýt ch©n gµ
        --{ tbProp = { 2, 1, 1125 }, nStack = 1 }, -- B¸nh Ýt b¸t b¶o
        --{ tbProp = { 2, 1, 30410 }, nStack = 5}, -- M¶nh Thiªn m«n
        --{ tbProp = { 2, 1, 30390 }, nStack = 25 }, -- M¶nh thiªn cang
        --{ tbProp = { 2, 1, 40025 }, nStack = 1 }, -- Tói thó c­ng cÊp 5
        --{ tbProp = { 2, 102, 215 }, nStack = 500, nStatus = ITEMSTATUS_EQUIP_LOCK }, -- Bét Tr©n Ch©u
        {
            { tbProp = { 2, 1, 40049 }, nStack = 5, nRate = 70 }, --m¶nh bÝ ®iÓn 30
            { tbProp = { 2, 102, 212 }, nStack = 1,nStatus = ITEMSTATUS_LOCK, nRate = 30}, -- Ch©u 5
            --{ nFunc = "_w_book_AddBookByType(1100, 6, 0, 3, 27, 27, 27, 27, 5)", nRate = 50 }, -- MËt TÞch BÝ §iÓn 27% ngÉu nhiªn ph¸i
            --{ nFunc = "_w_book_AddBookByType(100, 6, 0, 3, 30, 30, 30, 30, 1)", nRate = 1 }, -- MËt TÞch BÝ §iÓn 30% ngÉu nhiªn ph¸i
           -- { tbProp = { 2, 1, 30525 }, nStack = 1, nRate = 50.00,nStatus = ITEMSTATUS_LOCK }, -- Tay Tam 5
          --  { tbProp = { 2, 1, 30531 }, nStack = 1, nRate = 50.00,nStatus = ITEMSTATUS_LOCK }, -- Luyen Lo 5
           -- { tbProp = { 2, 1, 31248 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_LOCK }, -- Tô Linh QuyÕt
           -- { tbProp = { 2, 1, 30847 }, nStack = 1, nRate = 10.00,nStatus = ITEMSTATUS_LOCK }, -- Håi tiªn ®¬n
            --{ tbProp = { 2, 1, 30731 }, nStack = 1, nRate = 10.00,nStatus = ITEMSTATUS_LOCK }, -- Kinh mach Ngan nhan

            ---cËp nhËp event tÕt 2023 quý m·o
            --{ tbProp = { 2, 1, 40037 }, nStack = 1, nRate = 50 }, -- Tói Kü N¨ng B§H Lv6
        },

        ---cËp nhËp event tÕt 2023 quý m·o
        --{ nFunc = "KsgAward:DropEventBox(10)" },
        ---50% nhËn ®­îc ngÉu nhiªn 1 trong 2 lo¹i event 1 hoÆc 2 kho¸
        --{
        --    { tbProp = MONTHLY_EVENT_AWARD1, nRate = 25, nStatus = ITEMSTATUS_LOCK },
        --    { tbProp = MONTHLY_EVENT_AWARD2, nRate = 25, nStatus = ITEMSTATUS_LOCK },
        --},
    };

    --if g_WCFG_RUONGHOATDONG:IsDateOpen() == WEnv.TRUE then
    --    tinsert(tbAward, { tbProp = { 2, 1, 40063 }, nStack = 1 });-- R­¬ng Ho¹t §éng
    --end
    self:Give(tbAward, "Th­ëng thu ho¹ch BNN");

    --Th­ëng code alphatest
    --WGIFTCODE_ALPHATEST:SuccessTaskReq("BatNhaNho", 1);

    --NhiÖm vô tuÇn
    WTask:SetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_HATGIONG_DONE, WTask:GetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_BNN_DONE) + 1);

    -- NhiÖm vô hç trî t©n thñ
    WTask:SetByte(WTASKID_SUPPORT1_TASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_HATGIONG_DONE, WTask:GetByte(WTASKID_SUPPORT1_TASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_HATGIONG_DONE) + 1);
    local tbAwardfinal = {
        { tbProp = { 2, 1, 31239 }, nStack = 1,nStatus = ITEMSTATUS_LOCK }, -- Linh Ph¸ch §¬n

    };
    local nCountTree = GetTask(TASK_PLANT_TREE_COUNT);
    if nCountTree ==24 then
        self:Give(tbAwardfinal, "Th­ëng thu ho¹ch 24 c©y H¹t Gièng");
    end
    return WEnv.RETCODE_SUCCESS;
end

---PhÇn th­ëng thuhoach C©y  Linh
---@param
function WAward:CayTuLinh_ThuHoach()
    WTask:ResetDaily();

    -----@type table
    local tbAward = {
        { nExp = 300000 },
        { nHonor = 1000 },
        { tbProp = { 2, 1, 31681 }, nStack = 5,nStatus = ITEMSTATUS_TRADE }, -- M¶nh ®¸ 9
        { tbProp = { 2, 1, 31194 }, nStack = 1, nStatus = ITEMSTATUS_TRADE }, -- Thanh Long hån
        { tbProp = { 2, 1, 31248 }, nStack = 1, nStatus = ITEMSTATUS_TRADE }, -- Tô Linh QUyÕt
        { tbProp = { 2, 1, 31615 }, nStack = 10,nStatus = ITEMSTATUS_TRADE }, --  LuyÖn L« ThiÕt Lv8
        { tbProp = { 2, 1, 31614 }, nStack = 10,nStatus = ITEMSTATUS_TRADE }, --TÈy T©m Th¹ch Lv8
        { tbProp = { 2, 1, 31675 }, nStack = 1,nStatus = ITEMSTATUS_TRADE }, -- ThÇn ¦ng Hån
        {
            { tbProp = { 2, 1, 31761 }, nStack = 1, nRate = 20, nStatus = ITEMSTATUS_TRADE }, -- TÈy t©m 9
            { tbProp = { 2, 1, 31762 }, nStack = 1, nRate = 20, nStatus = ITEMSTATUS_TRADE }, -- LuyÖn l« 9
            { tbProp = { 2, 95, 204 }, nStack = 1, nRate = 30, nStatus = ITEMSTATUS_TRADE }, -- Thiªn Cang lÖnh
            { tbProp = { 2, 1, 30370 }, nStack = 1, nRate = 30, nStatus = ITEMSTATUS_TRADE }, -- Thiªn m«n Kim LÖnh

        },
    };
    SetTask(WTASKID_DAYLY_CAYTULINH,GetTask(WTASKID_DAYLY_CAYTULINH)+1);
    self:Give(tbAward, "Th­ëng thu ho¹ch CayTuLinh");

    return WEnv.RETCODE_SUCCESS;
end
------PhÇn th­ëng vËn tiªu thµnh c«ng
---@param nDouble number x2 phÇn t­ëng
function WAward:BaPhe_VanTieu(nDouble)
    WTask:ResetDaily();

    nDouble = tonumber(nDouble) or 1;
    local tbAward = {
        { nExp = 50000000 },
        { nGold = 500000 },
        --{ tbProp = { 2, 1, 30687 }, nStack = random(5, 10) * nDouble }, -- M¶nh Thiªn M«n
        { tbProp = { 2, 1, 30687 }, nStack = 20 * nDouble }, -- Thai Nhaat Lenh
       -- { tbProp = { 2, 1, 31505 }, nStack = 1 * nDouble }, -- Tói ®¸ quuys 7
       -- { tbProp = { 1, 0, 30009 }, nStack = 2 * nDouble }, -- Linh chi Tuc menh hoan
       -- { tbProp = { 1, 0, 30010 }, nStack = 2 * nDouble }, -- Dao tri Dai hoan don
        { tbProp = { 2, 1, 40046 }, nStack = 5 * nDouble }, -- M¶nh tïy biÕn ch©u
        { tbProp = { 2, 1, 31244 }, nStack = 20 * nDouble }, -- M¶nh c¬ quan mÆc gia
        { tbProp = { 2, 1, 30912 }, nStack = 50 * nDouble }, -- HiÖp nghÜa chi chøng
        { tbProp = { 2, 1, 30847 }, nStack = 2 *nDouble, nStatus = ITEMSTATUS_LOCK }, -- Håi Tiªn §¬n
        { tbProp = { 2, 1, 31194 }, nStack = 2*nDouble }, -- Thanh Long hån
        { tbProp = { 2, 1, 31248 }, nStack = 1*nDouble }, --  T Linh Quyet
        { tbProp = { 2, 1, 31122 }, nStack = 2 * nDouble }, -- Linh khÝ rùc rì
        { tbProp = { 2, 1, 31402 }, nStack = 2 * nDouble }, -- Tay Tam Thach lv6
        { tbProp = { 2, 1, 31401 }, nStack = 2 * nDouble}, -- LuyÖn l« thiÕt c6
        ---cËp nhËp event tÕt 2023 quý m·o
       -- { tbProp = { 2, 1, 31505 }, nStack = 2 * nDouble }, -- Tói §¸ Quý CÊp 7
        --{ nFunc = "KsgAward:DropEventBox(50)" },
        { tbProp = { 2, 1, 40050 }, nStack = 10* nDouble }, --m¶nh bÝ ®iÓn 32
        { nFunc = "KsgAward:DropEventBox(20)" },
        --{ tbProp = { 2, 1, 40037 }, nStack = 3 * nDouble }, -- Tói Kü N¨ng B§H Lv6
    };

    --if g_WCFG_RUONGHOATDONG:IsDateOpen() == WEnv.TRUE then
    --    tinsert(tbAward, { tbProp = { 2, 1, 40063 }, nStack = 5 });-- R­¬ng Ho¹t §éng
    --end
    if GetTask(WTASKID_DAYLY_VANTIEU_DAILY_COUNT)==7 then
        AddItem(2,1,31239,3);
    end
    self:Give(tbAward, "Th­ëng vËn tiªu x" .. nDouble);

    --------th­ëng ®iÓm n¨ng ®éng
    if WTask:GetBit(WMISSION_AWARD_NANGDONG,WMISSION_AWARD_BIT_DAILY_NANGDONG_VANTIEU) ==0 then
        WTask:Set(WMISSION_AWARD_NANGDONG,WTask:Get(WMISSION_AWARD_NANGDONG)+200);
        WTask:SetBit(WMISSION_AWARD_NANGDONG,WMISSION_AWARD_BIT_DAILY_NANGDONG_VANTIEU,1)
    end
    --Giftcode alphatest
    WGIFTCODE_ALPHATEST:SuccessTaskReq("VanTieu", 1);

    --NhiÖm vô tuÇn
    WTask:SetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_VANTIEU_DONE, WTask:GetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_VANTIEU_DONE) + 1);

    -- NhiÖm vô hç trî t©n thñ
    WTask:SetByte(WTASKID_SUPPORT1_TASK2_BYTE, WTASKID_SUPPORT1_TASK2_BYTE_VANTIEU_DONE, WTask:GetByte(WTASKID_SUPPORT1_TASK2_BYTE, WTASKID_SUPPORT1_TASK2_BYTE_VANTIEU_DONE) + 1);
    SetTask(WTASKID_DAYLY_VANTIEU_DAILY_COUNT,GetTask(WTASKID_DAYLY_VANTIEU_DAILY_COUNT)+1);
    return WEnv.RETCODE_SUCCESS;
end

---PhÇn th­ëng c­íp tiªu thµnh c«ng
---@param nCount number Sè l­îng tiªu c­íp ®­îc
function WAward:BaPhe_CuopTieu(nCount)
    WTask:ResetDaily();

    nCount = tonumber(nCount) or 1;
    local tbAward = {
        { nGold = 300000 },
        { tbProp = { 2, 1, 30230 }, nStack = 30 },
        { nFunc = "KsgAward:DropEventBox(20)" },
    };
    --if g_WCFG_RUONGHOATDONG:IsDateOpen() == WEnv.TRUE then
    --    tinsert(tbAward, { tbProp = { 2, 1, 40063 }, nStack = 3 });-- R­¬ng Ho¹t §éng
    --end
    self:Give(tbAward, "Th­ëng c­íp tiªu x" .. nCount);

    --NhiÖm vô tuÇn
    WTask:SetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_CUOPTIEU_DONE, WTask:GetByte(WTASKID_WEEKLYTASK2_BYTE, WTASKID_WEEKLYTASK2_BYTE_CUOPTIEU_DONE) + nCount);

    -- NhiÖm vô hç trî t©n thñ
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
            { szName = 'R­¬ng KiÕm §·ng YÕn V©n', tbProp = { 2, 1, 40020 }, nStack = 10,nStatus = ITEMSTATUS_LOCK },
            { nFunc = "KsgAward:DropEventBox(10)" },
        },
        [2] = {
            { nExp = 30000000 },
            { szName = 'R­¬ng KiÕm §·ng YÕn V©n', tbProp = { 2, 1, 40020 }, nStack = 10 ,nStatus = ITEMSTATUS_LOCK},
            { nFunc = "KsgAward:DropEventBox(10)" },
        },
        [3] = {
            { nExp = 30000000 },
            { szName = 'R­¬ng KiÕm §·ng YÕn V©n', tbProp = { 2, 1, 40020 }, nStack = 10 ,nStatus = ITEMSTATUS_LOCK},
            { nFunc = "KsgAward:DropEventBox(10)" },
        },
        [4] = {
            { nExp = 30000000 },
            { szName = 'R­¬ng KiÕm §·ng YÕn V©n', tbProp = { 2, 1, 40020 }, nStack = 10,nStatus = ITEMSTATUS_LOCK },
            { nFunc = "KsgAward:DropEventBox(10)" },
        },
        [5] = {
            { nExp = 30000000 },
            { szName = 'R­¬ng KiÕm §·ng YÕn V©n', tbProp = { 2, 1, 40020 }, nStack = 10 ,nStatus = ITEMSTATUS_LOCK},
            { nFunc = "KsgAward:DropEventBox(10)" },
        },
        [6] = {
            { nExp = 30000000 },
            { szName = 'R­¬ng KiÕm §·ng YÕn V©n', tbProp = { 2, 1, 40020 }, nStack = 10 ,nStatus = ITEMSTATUS_LOCK},
            { nFunc = "KsgAward:DropEventBox(10)" },
        },
        [7] = {
            { nExp = 30000000 },
            { szName = 'R­¬ng KiÕm §·ng YÕn V©n', tbProp = { 2, 1, 40020 }, nStack = 10,nStatus = ITEMSTATUS_LOCK },
            { nFunc = "KsgAward:DropEventBox(10)" },
        },
        [8] = {
            { nExp = 30000000 },
            { szName = 'R­¬ng KiÕm §·ng YÕn V©n', tbProp = { 2, 1, 40020 }, nStack = 10 ,nStatus = ITEMSTATUS_LOCK},
            { nFunc = "KsgAward:DropEventBox(10)" },
        },
    };
    if tbStageAward[nStage] then
        for _, tbAward in tbStageAward[nStage] do
            if _ ~= "n" then
                self:Give(tbAward, "Th­ëng boss KDYV");
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
                    -- cho nhËn code trong 3 ngµy 21 22 23
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

    WTask:Set(WTASKID_NEWBATTLE_LASTDATA_DATE, 0); --LongDaiKa: reset data trËn cuèi
    WTask:Set(WTASKID_NEWBATTLE_LASTDATA_BYTE, 0); --LongDaiKa: reset data trËn cuèi

    local tbBattleAwards = {
        [VILLAGE_ID] = {
            --{ tbProp = { 2, 1, 30526 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv6
            --{ tbProp = { 2, 1, 30532 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv6

            --{ tbProp = { 2, 1, 31402 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv7
            --{ tbProp = { 2, 1, 31401 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv7
            --
            ----- Th¸nh Ho¶ §µn
            --{ nFunc = "oly_AddShengHuo(30, 2)" },
        },
        [RESOURCE_ID] = {
            --{ tbProp = { 2, 1, 30526 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv6
            --{ tbProp = { 2, 1, 30532 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv6

            --{ tbProp = { 2, 1, 31402 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv7
            --{ tbProp = { 2, 1, 31401 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv7
            --
            ----- Th¸nh Ho¶ §µn
            --{ nFunc = "oly_AddShengHuo(30, 2)" },
        },
        [EMPLACEMENT_ID] = {
            --{ tbProp = { 2, 1, 30526 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv6
            --{ tbProp = { 2, 1, 30532 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv6
            --
            --{ tbProp = { 2, 1, 31402 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv7
            --{ tbProp = { 2, 1, 31401 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv7
            --
            ----- Th¸nh Ho¶ §µn
            --{ nFunc = "oly_AddShengHuo(30, 2)" },
        },
        [MAINBATTLE_ID] = {
            --{ tbProp = { 2, 1, 30526 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv6
            --{ tbProp = { 2, 1, 30532 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv6
            --
            --{ tbProp = { 2, 1, 31402 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- TÈy T©m Th¹ch Lv7
            --{ tbProp = { 2, 1, 31401 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« ThiÕt Lv7

            --- Th¸nh Ho¶ §µn
            --{ nFunc = "oly_AddShengHuo(50, 2)" },
        },
    };
    if g_WCFG_RUONGHOATDONG:IsDateOpen() == WEnv.TRUE then
        tinsert(tbBattleAwards[VILLAGE_ID], { tbProp = { 2, 1, 40063 }, nStack = 10, nStatus = ITEMSTATUS_LOCK });-- R­¬ng Ho¹t §éng
        tinsert(tbBattleAwards[RESOURCE_ID], { tbProp = { 2, 1, 40063 }, nStack = 10, nStatus = ITEMSTATUS_LOCK });-- R­¬ng Ho¹t §éng
        tinsert(tbBattleAwards[EMPLACEMENT_ID], { tbProp = { 2, 1, 40063 }, nStack = 10, nStatus = ITEMSTATUS_LOCK });-- R­¬ng Ho¹t §éng
        tinsert(tbBattleAwards[MAINBATTLE_ID], { tbProp = { 2, 1, 40063 }, nStack = 20, nStatus = ITEMSTATUS_LOCK });-- R­¬ng Ho¹t §éng
    end



    if nBonusType == QCC_VINHDU then
        tinsert(tbBattleAwards[nBattleType], { tbProp = { 2, 0, 398 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }); -- C©y B¸t Nh·
    end

    WAward:Give(tbBattleAwards[nBattleType], format("NhËn th­ëng %s", tBattleName[nBattleType]));

    if nBattleType == MAINBATTLE_ID then
        -- NhiÖm vô hç trî h»ng ngµy
        WTask:SetByte(WTASKID_DAILYTASK_BYTE, WTASKID_DAILYTASK_BYTE_CTC_DONE, WTask:GetByte(WTASKID_DAILYTASK_BYTE, WTASKID_DAILYTASK_BYTE_CTC_DONE) + 1);

        -- NhiÖm vô tuÇn
        WTask:SetByte(WTASKID_WEEKLYTASK_BYTE, WTASKID_WEEKLYTASK_BYTE_CTC_DONE, WTask:GetByte(WTASKID_WEEKLYTASK_BYTE, WTASKID_WEEKLYTASK_BYTE_CTC_DONE) + 1);

        -- NhiÖm vô hç trî t©n thñ
        WTask:SetByte(WTASKID_SUPPORT1_TASK_BYTE, WTASKID_SUPPORT1_TASK_BYTE_CTC_DONE, WTask:GetByte(WTASKID_SUPPORT1_TASK_BYTE, WTASKID_SUPPORT1_TASK_BYTE_CTC_DONE) + 1);

        -------------NhËn th­ëng ®iÓm n¨ng ®éng
        if WTask:GetBit(WMISSION_AWARD_NANGDONG,WMISSION_AWARD_BIT_DAILY_NANGDONGCHIENTRUONGCHINH) ==0 then
            WTask:Set(WMISSION_AWARD_NANGDONG,WTask:Get(WMISSION_AWARD_NANGDONG)+500);
            WTask:SetBit(WMISSION_AWARD_NANGDONG,WMISSION_AWARD_BIT_DAILY_NANGDONGCHIENTRUONGCHINH,1)
        end
    else
        -- NhiÖm vô hç trî h»ng ngµy
        WTask:SetByte(WTASKID_DAILYTASK_BYTE, WTASKID_DAILYTASK_BYTE_CTP_DONE, WTask:GetByte(WTASKID_DAILYTASK_BYTE, WTASKID_DAILYTASK_BYTE_CTP_DONE) + 1);

        -- NhiÖm vô tuÇn
        WTask:SetByte(WTASKID_WEEKLYTASK_BYTE, WTASKID_WEEKLYTASK_BYTE_CTP_DONE, WTask:GetByte(WTASKID_WEEKLYTASK_BYTE, WTASKID_WEEKLYTASK_BYTE_CTP_DONE) + 1);

        -- NhiÖm vô hç trî t©n thñ
        WTask:SetByte(WTASKID_SUPPORT1_TASK_BYTE, WTASKID_SUPPORT1_TASK_BYTE_CTP_DONE, WTask:GetByte(WTASKID_SUPPORT1_TASK_BYTE, WTASKID_SUPPORT1_TASK_BYTE_CTP_DONE) + 1);

        -------------NhËn th­ëng ®iÓm n¨ng ®éng
        if WTask:GetBit(WMISSION_AWARD_NANGDONG,WMISSION_AWARD_BIT_DAILY_NANGDONG_CHIENTRUONGPHU) ==0 then
            WTask:Set(WMISSION_AWARD_NANGDONG,WTask:Get(WMISSION_AWARD_NANGDONG)+200);
            WTask:SetBit(WMISSION_AWARD_NANGDONG,WMISSION_AWARD_BIT_DAILY_NANGDONG_CHIENTRUONGPHU,1)
        end
    end

    -- Kh«ng ch¹y ë d­íi, phÇn d­íi chØ dïng ë hµm get_all_award_new_mod
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

    --1. dïng mÆt n¹ th× kh«ng cho nhËn th­ëng víi qu©n c«ng ch­¬ng c¸c lo¹i
    if nBonusType ~= 0 and bUseSpyCloth == WEnv.TRUE then
        WPlayer:Msg(format("HiÖu qu¶ mÆt n¹ gi¸n ®iÖp: kh«ng thÓ nhËn th­ëng víi %s.", QCC_NAMES[nBonusType]));
        return WEnv.RETCODE_ERROR;
    end

    --2. nhËn th­ëng exp chiÕn tr­êng chÝnh chØ ®­îc 1 lÇn trong ngµy
    if nBattleType == MAINBATTLE_ID then
        if nGetExpAwardCount > 0 then
            nGiveExp = 0;
            WPlayer:Msg("H«m nay ®· nhËn råi, mçi ngµy chØ ®­îc 1 lÇn th­ëng kinh nghiÖm.");
        end
    end

    --3. sö dông mÆt n¹ gi¸n ®iÖp sÏ kh«ng nhËn d­îc ®iÓm qu©n c«ng
    if bUseSpyCloth == WEnv.TRUE then
        nGiveHonor = 0;
        WPlayer:Msg("HiÖu qu¶ mÆt n¹ gi¸n ®iÖp: kh«ng nhËn ®­îc qu©n c«ng.");
    end

    self:Give({ nExp = nGiveExp, nHonor = nGiveHonor, nBattlePoint = nGiveBattlePoint }, format("NhËn th­ëng %s", tBattleName[nBattleType]));

    return WEnv.RETCODE_SUCCESS;
end

function WAward:TaiNguyenChien_HoanThanhNv(nBonusType)
    WTask:ResetDaily();

    --Giftcode alphatest
    WGIFTCODE_ALPHATEST:SuccessTaskReq("TaiNguyenChien", 1); --LongDaiKa: phÇn th­ëng code alphatest

    -- NhiÖm vô hç trî h»ng ngµy
    WTask:SetByte(WTASKID_DAILYTASK_BYTE, WTASKID_DAILYTASK_BYTE_TNC_DONE, WTask:GetByte(WTASKID_DAILYTASK_BYTE, WTASKID_DAILYTASK_BYTE_TNC_DONE) + 1);

    -- NhiÖm vô tuÇn
    WTask:SetByte(WTASKID_WEEKLYTASK_BYTE, WTASKID_WEEKLYTASK_BYTE_TNC_DONE, WTask:GetByte(WTASKID_WEEKLYTASK_BYTE, WTASKID_WEEKLYTASK_BYTE_TNC_DONE) + 1);

    -- NhiÖm vô hç trî t©n thñ
    WTask:SetByte(WTASKID_SUPPORT1_TASK_BYTE, WTASKID_SUPPORT1_TASK_BYTE_TNC_DONE, WTask:GetByte(WTASKID_SUPPORT1_TASK_BYTE, WTASKID_SUPPORT1_TASK_BYTE_TNC_DONE) + 1);
    SetTask(WTASKID_DAYLY_TNC_DAILY_COUNT,GetTask(WTASKID_DAYLY_TNC_DAILY_COUNT)+1)
    --- Th¸nh Ho¶ §µn
    --oly_AddShengHuo(20, 3);
    if nBonusType == 5 then
        AddItem(2, 1, 50263,50,1);
        if GetTask(WTASKID_DAYLY_TNC_DAILY_COUNT)==6 then
            AddItem(2, 1, 31239,3); -- Th­ëng 3 Linh Ph¸ch §¬n
        end
    end

end
--------Th­ëng nh©n vËt kÕt thóc Boss
function WAward:WorldBoss_KillBoss(szBossName)
    local tbAward = {
        { tbProp = { 2, 95, 204 }, nStack = 1 }, -- Thiên cang
        { tbProp = { 2, 1, 30370 }, nStack = 1 }, -- Thien Mon lenh
        { tbProp = { 2, 1, 31194 }, nStack = 3, }, -- Thanh Long Hon
        { tbProp = { 2, 1, 31402 }, nStack = 10, }, -- TÈy t©m 6
        { tbProp = { 2, 1, 31401 }, nStack = 10, }, -- LuyÖn L« 6
        --{ tbProp = { 2, 1, 31252 }, nStack = 10, }, -- §æi Linh Th¹ch-Cao 4
        --{ tbProp = { 2, 1, 31253 }, nStack = 10, }, -- §æi Linh Th¹ch-Cao 5
        --{ tbProp = { 2, 1, 31254 }, nStack = 10, }, -- §æi Linh Th¹ch-Cao 6
        --{ tbProp = { 2, 102, 225 }, nStack = 5 }, -- Th­¬ng H¶i Ch©u CÊp 7 (Ch­a gi¸m ®Þnh)
        --{
        --    { tbProp = { 2, 1, 31324 }, nStack = 10, nRate = 5 }, -- Thó c­ìi manh manh
        --    { tbProp = { 2, 1, 31321 }, nStack = 10, nRate = 5 }, -- X· Qu©n Táa Linh Th¹ch 2
        --    { tbProp = { 2, 1, 31393 }, nStack = 10, nRate = 16.6 }, -- X· Qu©n Táa Linh Th¹ch 3
        --    { tbProp = { 2, 1, 31394 }, nStack = 10, nRate = 16.6 }, -- X· Qu©n Táa Linh Th¹ch 4
        --    { tbProp = { 2, 1, 31395 }, nStack = 10, nRate = 16.6 }, -- X· Qu©n Táa Linh Th¹ch 5
        --    { tbProp = { 2, 1, 31396 }, nStack = 10, nRate = 16.6 }, -- X· Qu©n Táa Linh Th¹ch 6
        --},
        ---cËp nhËp event tÕt 2023 quý m·o
        { nFunc = "KsgAward:DropEventBox(20)" },
    };

    self:Give(tbAward, format("Th­ëng giÕt boss %s", szBossName));
end
-------------------------PhÇn th­ëng Boss Hµng ngµy R­¬ng §¹i ChiÕn
function WAward:WorldBoss_OpenBigBox()
    local tbAward = {
        --{ tbProp = { 2, 102, 215 }, nStack = 15000 }, -- Bét Tr©n Ch©u
        { tbProp = { 2, 1, 30847 }, nStack = 10 }, -- håi tiªn ®¬n
        { tbProp = { 2, 1, 30370 }, nStack = 2, }, -- Thiªn m«n lÖnh
        { tbProp = { 2, 95, 204 }, nStack = 2, }, -- Theien cang lÖnh
        { tbProp = { 2, 1, 30687 }, nStack = 200, }, -- Thai nhÊt LÖnh
        { tbProp = { 2, 1, 31294 }, nStack = 1, }, -- Uy Hæ Hån
        { tbProp = { 2, 1, 31402 }, nStack = 20, }, -- TÈy t©m 7
        { tbProp = { 2, 1, 31401 }, nStack = 20, }, -- LuyÖn L« 7
        --{ tbProp = { 2, 201, 15 }, nStack = 1 }, -- §iÓm Tinh Ngäc

        ---cËp nhËp event tÕt 2023 quý m·o
    --    { nFunc = "KsgAward:DropEventBox(20)" },
    --
    --    { tbProp = { 2, 1, 30390 }, nStack = 250 }, -- M¶nh Thiªn Cang
    --    { tbProp = { 2, 1, 30410 }, nStack = 50 }, -- M¶nh Thiªn M«n
    --    {
    --        { tbProp = { 2, 1, 31391 }, nStack = 10, nRate = 17 }, -- X· Qu©n Táa Linh Th¹ch 1
    --        { tbProp = { 2, 1, 31392 }, nStack = 10, nRate = 16.6 }, -- X· Qu©n Táa Linh Th¹ch 2
    --        { tbProp = { 2, 1, 31393 }, nStack = 10, nRate = 16.6 }, -- X· Qu©n Táa Linh Th¹ch 3
    --        { tbProp = { 2, 1, 31394 }, nStack = 10, nRate = 16.6 }, -- X· Qu©n Táa Linh Th¹ch 4
    --        { tbProp = { 2, 1, 31395 }, nStack = 10, nRate = 16.6 }, -- X· Qu©n Táa Linh Th¹ch 5
    --        { tbProp = { 2, 1, 31396 }, nStack = 10, nRate = 16.6 }, -- X· Qu©n Táa Linh Th¹ch 6
    --    },
    --    {
    --        { tbProp = { 2, 1, 31402 }, nStack = 20, nRate = 50 }, -- TÈy T©m Th¹ch Lv7
    --        { tbProp = { 2, 1, 31401 }, nStack = 20, nRate = 50 }, -- LuyÖn L« ThiÕt Lv7
    --    }
    };
    self:Give(tbAward, "Th­ëng më R­¬ng Vµng §¹i ChiÕn");
end
---------- R­¬ng b¶o h¹p Boss hµng ngµy
function WAward:WorldBoss_OpenSmallBox()
    local tbAward = {
        { tbProp = { 2, 1, 31402 }, nStack = 5, nRate= 10  }, -- Tay tam 7
        { tbProp = { 2, 1, 31401 }, nStack = 5, nRate= 10 }, -- Luyen Lo 7
        --{ tbProp = { 2, 1, 30687 }, nStack = 20, }, -- Thai nhÊt LÖnh
        --{ tbProp = { 2, 1, 31194 }, nStack = 1, }, -- §Thanh Long hon
        --{ tbProp = { 2, 1, 30426 }, nStack = 1, }, -- Bua Cuong hoa 14
        { tbProp = { 2, 102, 210 }, nStack = 30, nRate = 20 }, -- 1th­¬ng h¶i di ch©u c3
        { tbProp = { 2, 102, 211 }, nStack = 20, nRate = 20 }, -- 1th­¬ng h¶i di ch©u c4
        { tbProp = { 2,1,1157 }, nStack = 1, nRate = 10 }, -- Dau hon
        { tbProp = { 2, 102, 212 }, nStack = 5, nRate = 10 }, -- 1th­¬ng h¶i di ch©u c5
        { nGold = 10,  nRate = 3 },
        { nGold = 200000,  nRate = 7 },
        ---cËp nhËp event tÕt 2023 quý m·o
        --{ nFunc = "KsgAward:DropEventBox(20)" },
        --
        --{
        --    { tbProp = { 2, 1, 31391 }, nStack = 2, nRate = 17 }, -- X· Qu©n Táa Linh Th¹ch 1
        --    { tbProp = { 2, 1, 31392 }, nStack = 2, nRate = 16.6 }, -- X· Qu©n Táa Linh Th¹ch 2
        --    { tbProp = { 2, 1, 31393 }, nStack = 2, nRate = 16.6 }, -- X· Qu©n Táa Linh Th¹ch 3
        --    { tbProp = { 2, 1, 31394 }, nStack = 2, nRate = 16.6 }, -- X· Qu©n Táa Linh Th¹ch 4
        --    { tbProp = { 2, 1, 31395 }, nStack = 2, nRate = 16.6 }, -- X· Qu©n Táa Linh Th¹ch 5
        --    { tbProp = { 2, 1, 31396 }, nStack = 2, nRate = 16.6 }, -- X· Qu©n Táa Linh Th¹ch 6
        --},
        --{
        --    { tbProp = { 2, 1, 31402 }, nStack = random(10, 20), nRate = 50 }, -- TÈy T©m Th¹ch Lv7
        --    { tbProp = { 2, 1, 31401 }, nStack = random(10, 20), nRate = 50 }, -- LuyÖn L« ThiÕt Lv7
        --}
    };
    --if g_WCFG_RUONGHOATDONG:IsDateOpen() == WEnv.TRUE then
    --    tinsert(tbAward, { tbProp = { 2, 1, 40063 }, nStack = 10 });-- R­¬ng Ho¹t §éng
    --end
    self:Give(tbAward, "Th­ëng më R­¬ng B¶o H¹p");
end

---PhÇn th­ëng th¸i h­ c¬ chÕ míi
function WAward:ThaiHu2_HoanThanhTatCaAi()
    local tbAward = {
        { tbProp = { 2, 1, 31766 }, nStack = 50, nStatus = ITEMSTATUS_TRADE }, -- R­¬ng Th¸i H­
        --{ tbProp = { 2, 1, 31096 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- L­u Kim

        ---cËp nhËp event tÕt 2023 quý m·o
        { nFunc = "KsgAward:DropEventBox(50)" },
    };

    self:Give(tbAward, "Hoµn thµnh tÊt c¶ ¶i th¸i h­ míi");
    SetTask(WTASKID_DAYLY_THAIHU_DAILY_COUNT,GetTask(WTASKID_DAYLY_THAIHU_DAILY_COUNT)+1)
    if GetTask(WTASKID_DAYLY_THAIHU_DAILY_COUNT)==4 then
        AddItem(2,1,31239,6);
    end
end

---PhÇn th­ëng hoµn thµnh c¸c ¶i tµng kiÕm
---@param nChance number Sè lÇn v­ît ¶i
---@param nStage number TÇng hoµn thµnh
function WAward:TangKiem_HoanThanhAi(nChance, nStage)
    nChance = tonumber(nChance) or 0;
    nStage = tonumber(nStage) or 0;

    if nChance <= 0 then
        return WEnv.RETCODE_NOTOPEN;
    end

    if WTask:GetByte(WTASKID_TANGKIEM_BYTE, WTASKID_TANGKIEM_BYTE_GIVE_STAGE_AWARD_STATUS) == nStage then
        -- fix bug ®óp phÇn th­ëng
        --WPlayer:Msg("Debug ®óp phÇn th­ëng!");
        return WEnv.RETCODE_ERROR;
    else
        WTask:SetByte(WTASKID_TANGKIEM_BYTE, WTASKID_TANGKIEM_BYTE_GIVE_STAGE_AWARD_STATUS, nStage);
    end

    local tbAward = {
        [7] = {
            { nGold = 3000000 },
            { tbProp = { 2, 1, 31767 }, nStack = 50, nStatus = ITEMSTATUS_TRADE }, -- R­¬ng Tµng KiÕm
            ---cËp nhËp event tÕt 2023 quý m·o
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

---PhÇn th­ëng giÕt boss trong TNC
---@param szBossName string
function WAward:BossTnc_KillBoss(szBossName)
    local tbAward = {
        { nExp = 300000000 }, -- 1 tû exp
        { tbProp = { 2, 1, 539 }, nStack = 5 }, -- Hoµng Kim §¹i Hång Bao
        { tbProp = { 2, 1, 31294 }, nStack = 5, nStatus = ITEMSTATUS_TRADE }, -- uy Hæ Hån
        { tbProp = { 2, 95, 204 }, nStack = 5,nStatus = ITEMSTATUS_LOCK }, -- Thiên cang
        { tbProp = { 2, 1, 30370 }, nStack = 5,nStatus = ITEMSTATUS_LOCK }, -- Thien Mon lenh
        --{ tbProp = { 2, 1, 40046 }, nStack = 50 }, -- M¶nh tïy biÕn
    };

    self:Give(tbAward, format("Th­ëng giÕt boss tµi nguyªn chiÕn %s", szBossName));
end

---PhÇn th­ëng më r­¬ng boss trong TNC
function WAward:BossTnc_OpenSmallBox()
    local nCountrd=random( 1,3) or 1;
    local tbAward = {
        { nExp = 300000000 }, -- 300 triÖu exp
        { tbProp = { 2, 1, 31239 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Linh Ph¸ch §¬n
        --{ tbProp = { 2, 1, 31194 }, nStack = random(1, 3), nStatus = ITEMSTATUS_LOCK }, -- Håi Tiªn §¬n
        { tbProp = { 2, 1, 31194 }, nStack = nCountrd, nStatus = ITEMSTATUS_LOCK }, -- Thanh Long Hon
        {
            { tbProp = { 2, 1, 40037 }, nStack = 1, nRate = 16 }, -- Tói Kü N¨ng B§H Lv6
            { tbProp = { 2, 102, 225 }, nStack = 1, nRate = 3 }, -- Th­¬ng H¶i Ch©u CÊp 7 (Ch­a gi¸m ®Þnh)
            { tbProp = { 2,102,224 }, nStack = 1, nRate = 5 }, -- Th­¬ng H¶i Ch©u CÊp 6
            { tbProp = { 2, 102, 223 }, nStack = 10, nRate = 10 },-- Th­¬ng H¶i Ch©u CÊp5
            { tbProp = { 2, 1, 30390 }, nStack = 60, nRate = 5 }, -- M¶nh Thiªn Cang
            { tbProp = { 2, 1, 30410 }, nStack = 60, nRate = 5 }, -- M¶nh Thiªn M«n
            { tbProp = { 2, 1, 539 }, nStack =1, nRate = 10}, -- Hoµng Kim §¹i Hång Bao
            { tbProp = { 2, 1, 31402 }, nStack = 10, nRate = 10 }, -- TÈy T©m Th¹ch Lv7
            { tbProp = { 2, 1, 31401 }, nStack = 10, nRate = 10 }, -- LuyÖn L« ThiÕt Lv7
            { tbProp = { 2, 1, 1009 }, nStack = 5, nRate = 10 }, -- Thiªn th¹ch tinh th¹ch
            --{ tbProp = { 2, 114, 143 }, nStack = 10, nRate = 15 }, -- Thiªn V¨n Th¹ch
            { tbProp = {  2, 1, 31505 }, nStack = 10, nRate = 1 }, -- Tói §¸ Quý CÊp 7
            { tbProp = {  2,1,31123 }, nStack = 15, nRate = 5 }, -- Tói §¸ Quý CÊp 6
            { tbProp = {  2, 114, 143 }, nStack = 1, nRate = 10}, -- Ch©n vo hon thach
        }
    };

    self:Give(tbAward, "Th­ëng më r­¬ng boss boss tµi nguyªn chiÕn");
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
                    WPlayerLog:WriteBattleLog("giveback_honor", "Hoµn Tr¶ C«ng Tr¹ng", 0, "", WPlayer:GetExp(), 0, nHonorBefore, HonorGive, WPlayer:GetBattlePoint(), 0);
                end
            end
        end
        closefile(pf);
        return HonorGive;
    else
        return 0
    end
end
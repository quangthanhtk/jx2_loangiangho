----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: file tËp hîp c¸c config giê më/®iÒu kiÖn c¸c ho¹t ®éng
----------------------------------------------------------------------------------------------------
--- Th­ viÖn config
WConfigsBase = {
    fnDebug = nothing,
    szKey = "WConfigsBase",
    szModuleName = "WConfigsBase",
    tbTimeOpen = {},
    tbCanDoAtTime = { -- 1=cn; 2=t2; 3=t3; 4=t4; 5=t5; 6=t6; 7=t7 (v× 0 kh«ng ®Õm ®c trong table nªn ®¨t key = nWeek+1)
        --[1] = {{1000, 1200},  {1500, 1700}, {2200, 2400},},
        --[2] = {{1000, 1200},  {1500, 1700}, {2200, 2400},},
        --[3] = {{1000, 1200},  {1500, 1700}, {2200, 2400},},
        --[4] = {{1000, 1200},  {1500, 1700}, {2200, 2400},},
        --[5] = {{1000, 1200},  {1500, 1700}, {2200, 2400},},
        --[6] = {{1000, 1200},  {1500, 1700}, {2200, 2400},},
        --[7] = {{1000, 1200},  {1500, 1700}, {2200, 2400},},
    },
};
function WConfigsBase:IsDateOpen(bShowMsg)
    --do return 1; end -- test më full
    bShowMsg = bShowMsg or WEnv.FALSE;
    if type(self.nDateOpen) ~= "number" then
        print("WConfigs:IsDateOpen self.nDateOpen missing number", self.szModuleName);
        return WEnv.FALSE;
    end

    local nToday = WDate:Today();
    if self.nDateOpen == 0
            or (self.nDateOpen ~= 1 and self.nDateOpen > nToday)
    then
        if bShowMsg == WEnv.TRUE then
            if self.nDateOpen ~= 0 then
                Msg2Player(format("%s sÏ më vµo ngµy %s, h·y quay l¹i sau!", self.szModuleName, WDate:ToString(self.nDateOpen)));
            else
                Msg2Player(format("%s ®· ®ãng, h·y quay l¹i sau!", self.szModuleName));
            end
        else
            if bShowMsg ~= -1 then
                print(format("[%s] (%d) not in open date (%d) by \\script\\warlord\\configs.lua!", self.szKey, nToday, self.nDateOpen));
            end
        end
        return WEnv.FALSE;
    else
        return WEnv.TRUE;
    end
end
function WConfigsBase:IsTimeOpen(bShowMsg)
    bShowMsg = bShowMsg or WEnv.FALSE;
    if type(self.tbTimeOpen) ~= "table" then
        print("WConfigs:IsTimeOpen self.tbTimeOpen missing table", self.szModuleName);
        return WEnv.FALSE;
    end

    local nCurrentTime = WDate:GetTime();
    local bIsTimeOpen = WEnv.FALSE;
    local szTimeOpen = "";
    local szDelimiter = "";
    local nTimeOpenCount = getn(self.tbTimeOpen);
    if nTimeOpenCount == 0 then
        return WEnv.TRUE;
    end
    for i = 1, nTimeOpenCount do
        if i == 1 then
            szDelimiter = "";
        else
            szDelimiter = ", ";
        end
        if self.tbTimeOpen[i] ~= WEnv.NULL then
            szTimeOpen = szTimeOpen .. szDelimiter .. self.tbTimeOpen[i];
            if nCurrentTime == self.tbTimeOpen[i] then
                bIsTimeOpen = WEnv.TRUE;
                --break;
            end
        end
    end

    if bIsTimeOpen == WEnv.FALSE then
        if bShowMsg == WEnv.TRUE then
            Msg2Player(format("Ch­a ®Õn thêi gian më %s, h·y quay l¹i sau!", self.szModuleName));
        else
            print(format("[%s] (%d) not in open time (%s) by \\script\\warlord\\configs.lua!", self.szKey, nCurrentTime, szTimeOpen));
        end
        return WEnv.FALSE;
    else
        return WEnv.TRUE;
    end
end
function WConfigsBase:IsCanDoAtTime(bShowMsg)
    bShowMsg = bShowMsg or WEnv.FALSE;
    if type(self.tbCanDoAtTime) ~= "table" then
        print("WConfigs:IsCanDoAtTime self.tbCanDoAtTime missing table", self.szModuleName);
        return WEnv.FALSE;
    end

    local nWeekDay = tonumber(date('%w')) + 1;
    local nCurrentTime = tonumber(date('%H%M'));
    local bIsTimeOpen = WEnv.FALSE;
    local szTimeOpen = "";
    local szDelimiter = "";
    local nCanDoAtTimeCount = getn(self.tbCanDoAtTime);
    if nCanDoAtTimeCount == 0 then
        return WEnv.TRUE;
    end
    if self.tbCanDoAtTime[nWeekDay] ~= WEnv.NULL then
        for i = 1, getn(self.tbCanDoAtTime[nWeekDay]) do
            if i == 1 then
                szDelimiter = "";
            else
                szDelimiter = ", ";
            end
            if self.tbCanDoAtTime[nWeekDay][i] ~= WEnv.NULL then
                local nStartTime = self.tbCanDoAtTime[nWeekDay][i][1];
                local nStopTime = self.tbCanDoAtTime[nWeekDay][i][2];
                szTimeOpen = szTimeOpen .. szDelimiter .. nStartTime .. "-" .. nStopTime;
                if nCurrentTime >= nStartTime and nCurrentTime <= nStopTime then
                    bIsTimeOpen = WEnv.TRUE;
                    --break;
                end
            end
        end
    end

    if bIsTimeOpen == WEnv.FALSE then
        if bShowMsg == WEnv.TRUE then
            Msg2Player(format("Ch­a ®Õn thêi gian më %s, h·y quay l¹i sau!", self.szModuleName));
        else
            print(format("[%s] (%d) not in open time (%s) by \\script\\warlord\\configs.lua!", self.szKey, nCurrentTime, szTimeOpen));
        end
        return WEnv.FALSE;
    else
        return WEnv.TRUE;
    end
end
WConfigs = WConfigs or { TYPES = {} };
function WConfigs:RegType(szKey, tbConfigs)
    if self.TYPES[szKey] == WEnv.NULL then
        tbConfigs.szKey = szKey;
        self.TYPES[szKey] = inherit(WConfigsBase, tbConfigs);
    end

    return self.TYPES[szKey];
end
----------------------------------------------------------------------------------------------------
g_WCFG = {
    szProductName = "Vâ L©m 2",
    szHomeUrl = "jx2loangiangho.com",
    szFbUrl = "fb.com/jx2loangiangho",
};
----------------------------------------------------------------------------------------------------
--- Config tÝnh n¨ng S¸t thñ ®­êng
g_WCFG_SATTHUDUONG = WConfigs:RegType("satthuduong", { nDateOpen = 0, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\task\killer_hall\mission\init_killer_hall.lua, \script\warlord\npcs\sat_thu_duong.lua, \script\task\killer_hall\entrance_npc.lua
                                                       szModuleName = "S¸t Thñ §­êng",
                                                       nTaskPerDay = 4,
                                                       nBuyGoldCost = 40,
                                                       nLevelMinReq = 77,

                                                       tbReloadFile = {
                                                           "\\script\\task\\killer_hall\\killer_hall_head.lua",
                                                           "\\script\\task\\killer_hall\\mission\\init_killer_hall.lua",
                                                           "\\script\\task\\killer_hall\\entrance_npc.lua",
                                                           "\\script\\task\\killer_hall\\quest_npc.lua",
                                                       },
});
----------------------------------------------------------------------------------------------------
--- Config tÝnh n¨ng Th¸i NhÊt Th¸p
g_WCFG_THAINHATTHAP = WConfigs:RegType("thainhatthap", { nDateOpen = 0, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\missions\taiyi\yangzongbao_npc.lua, \script\missions\taiyi\muguiying_npc.lua
                                                         szModuleName = "Th¸i NhÊt Th¸p",
                                                         tbReloadFile = {
                                                             "\\script\\missions\\taiyi\\yangzongbao_npc.lua",
                                                             "\\script\\missions\\taiyi\\muguiying_npc.lua",
                                                         },
});
----------------------------------------------------------------------------------------------------
--- Config tÝnh n¨ng V¹n KiÕm Tròng
g_WCFG_VANKIEMTRUNG = WConfigs:RegType("vankiemtrung", { nDateOpen = 0, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\missions\cangjianshanzhuang\jt_npc.lua
                                                         szModuleName = "V¹n KiÕm Tròng",

                                                         tbReloadFile = {
                                                             "\\script\\missions\\cangjianshanzhuang\\jt_npc.lua",
                                                             "\\script\\missions\\cangjianshanzhuang\\wjz_mission_entry_npc.lua",
                                                         },

                                                         bDisableDropBox = WEnv.TRUE,
});
----------------------------------------------------------------------------------------------------
--- Config tÝnh n¨ng Ma Vùc
g_WCFG_MAVUC = WConfigs:RegType("mavuc", { nDateOpen = 0, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\isolate\functions\moyutaoyuan\main.lua
                                           szModuleName = "Ma Vùc",

                                           tbReloadFile = {
                                               "\\script\\isolate\\functions\\moyutaoyuan\\main.lua",
                                           },
});
----------------------------------------------------------------------------------------------------
--- Config tÝnh n¨ng ChiÕn tr­êng Liªn Server
g_WCFG_CHIENTRUONG_LSV = WConfigs:RegType("chientruong_lsv", { nDateOpen = 0, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\missions\kuafu_battle\npc\kf_jieyinren.lua
                                                               szModuleName = "ChiÕn tr­êng liªn server",

                                                               tbReloadFile = {
                                                                   "\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua",
                                                               },
});
----------------------------------------------------------------------------------------------------
--- Config tÝnh n¨ng ChiÕn tr­êng HiÖp Lé T­¬ng Phïng
g_WCFG_CHIENTRUONG_HIEPLO = WConfigs:RegType("chientruong_hieplo", { nDateOpen = 0, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\exchg_server\one_road_battle_npc.lua
                                                                     szModuleName = "ChiÕn tr­êng HiÖp lé t­¬ng phïng",

                                                                     tbReloadFile = {
                                                                         "\\script\\exchg_server\\one_road_battle_npc.lua",
                                                                     },
});
----------------------------------------------------------------------------------------------------
---- Config tÝnh n¨ng NhiÖm vô s­ m«n míi
g_WCFG_NHIEMVUSMMOI = WConfigs:RegType("nhiemvusumonmoi", { nDateOpen = 0, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\faction\faction_head.lua
                                                            szModuleName = "NhiÖm vô s­ m«n míi",

                                                            tbReloadFile = {
                                                                "\\script\\faction\\faction_head.lua",
                                                            },
});
----------------------------------------------------------------------------------------------------
--- Config tÝnh n¨ng ChiÕn tr­êng Nh¹n M«n Quan_ChiÕn dÞch chÝnh
g_WCFG_NEWBATTLES_MAIN = WConfigs:RegType("newbattles_main", { nDateOpen = 20231210, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\newbattles\systemtimemessage\main_battle_signup.lua, \script\ÖÐÔ­Ò»Çø\ãê¾©\npc\ÏôÔ¶Â¥.lua
                                                               szModuleName = "Nh¹n M«n Quan_Nh¹n M«n Rùc Löa",

                                                               bDisableRegisterTimeLimit = WEnv.TRUE,
                                                               tbTimeOpen = {
                                                                   --1501, -- -- Giê ch¹y trong \settings\systemtimetask.txt
                                                                   2001, -- -- Giê ch¹y trong \settings\systemtimetask.txt
                                                               },
                                                               ---\script\newbattles\functions.lua
                                                               tbWinAward = {
                                                                   nHonor = 6000,
                                                                   nExp = 80000000,
                                                                   nBattlePoint = 1600,
                                                               },
                                                               tbLoseAward = {
                                                                   nHonor = 4500,
                                                                   nExp = 80000000,
                                                                   nBattlePoint = 800,
                                                               },
                                                               tbDrawAward = {
                                                                   nHonor = 3000,
                                                                   nExp = 80000000,
                                                                   nBattlePoint = 800,
                                                               },
                                                               bEnableCaptchaEntry = WEnv.TRUE,
                                                               nHonorSkipCaptcha = 200000,
                                                               bEnableCaptchaSignUp = WEnv.TRUE,

                                                               ---- Danh s¸ch c¸c file cÇn reload
                                                               tbReloadFile = {
                                                                   "\\script\\newbattles\\functions.lua",
                                                                   "\\script\\newbattles\\sign_up_npc.lua",
                                                                   "\\script\\newbattles\\systemtimemessage\\main_battle_signup.lua",
                                                                   "\\script\\battles\\battlejoin1.lua",
                                                                   "\\script\\battles\\battlejoin2.lua",
                                                                   "\\script\\online\\viet_event\\Battle_TieuPhuong\\TieuPhuong.lua", -- TiÓu Ph­¬ng
                                                                   "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÏôÔ¶Â¥.lua", -- TiÓu Ngäc
                                                                   "\\script\\newbattles\\mainbattle\\soldier_npc.lua", -- Npc vµo vÞ trÝ hËu, tiÒn doanh
                                                               },
});
----------------------------------------------------------------------------------------------------
---- Config tÝnh n¨ng ChiÕn tr­êng phô Ph¸o §µi
---TriÖu Diªn Niªn:
---Tiªu ViÔn L©u:
g_WCFG_NEWBATTLES_EMPLACEMENT = WConfigs:RegType("newbattles_emplacement", { nDateOpen = 20231210, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\newbattles\sign_up_npc.lua
                                                                             szModuleName = "Nh¹n M«n Quan_B¶o VÖ Thµnh Tr×",

                                                                             bDisableRegisterTimeLimit = WEnv.TRUE,
                                                                             tbTimeOpen = {
                                                                                 --1401, -- Giê ch¹y trong \settings\systemtimetask.txt
                                                                                 1901, -- Giê ch¹y trong \settings\systemtimetask.txt
                                                                             },

                                                                             tbWinAward = {
                                                                                 nHonor = 3000,
                                                                                 nExp = 60000000,
                                                                                 nBattlePoint = 400,
                                                                             },
                                                                             tbLoseAward = {
                                                                                 nHonor = 2000,
                                                                                 nExp = 40000000,
                                                                                 nBattlePoint = 400,
                                                                             },
                                                                             tbDrawAward = {
                                                                                 nHonor = 2000,
                                                                                 nExp = 40000000,
                                                                                 nBattlePoint = 400,
                                                                             },

                                                                             tbReloadFile = {
                                                                                 "\\script\\newbattles\\functions.lua",
                                                                                 "\\script\\newbattles\\sign_up_npc.lua",
                                                                                 "\\script\\newbattles\\systemtimemessage\\main_battle_signup.lua",
                                                                                 "\\script\\battles\\battlejoin1.lua",
                                                                                 "\\script\\battles\\battlejoin2.lua",
                                                                                 "\\script\\online\\viet_event\\Battle_TieuPhuong\\TieuPhuong.lua", -- TiÓu Ph­¬ng
                                                                                 "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÏôÔ¶Â¥.lua", -- TiÓu Ngäc
                                                                             },
});
----------------------------------------------------------------------------------------------------
---- Config tÝnh n¨ng ChiÕn tr­êng phô Th«n Trang -- ®ãng h¼n kh«ng dïng ®Õn
g_WCFG_NEWBATTLES_VILLAGE = WConfigs:RegType("newbattles_village", { nDateOpen = 0, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\newbattles\sign_up_npc.lua
                                                                     szModuleName = "Nh¹n M«n Quan_Gi¶i Cøu N«ng Trang",

                                                                     bDisableRegisterTimeLimit = WEnv.FALSE,
                                                                     tbTimeOpen = {
                                                                         1401, -- Giê ch¹y trong \settings\systemtimetask.txt
                                                                         1901, -- Giê ch¹y trong \settings\systemtimetask.txt
                                                                     },

                                                                     tbWinAward = {
                                                                         nHonor = 1200,
                                                                         nExp = 30000000,
                                                                         nBattlePoint = 400,
                                                                     },
                                                                     tbLoseAward = {
                                                                         nHonor = 800,
                                                                         nExp = 20000000,
                                                                         nBattlePoint = 200,
                                                                     },
                                                                     tbDrawAward = {
                                                                         nHonor = 800,
                                                                         nExp = 20000000,
                                                                         nBattlePoint = 200,
                                                                     },
                                                                     tbReloadFile = {
                                                                         "\\script\\newbattles\\functions.lua",
                                                                         "\\script\\newbattles\\sign_up_npc.lua",
                                                                         "\\script\\newbattles\\systemtimemessage\\main_battle_signup.lua",
                                                                         "\\script\\battles\\battlejoin1.lua",
                                                                         "\\script\\battles\\battlejoin2.lua",
                                                                         "\\script\\online\\viet_event\\Battle_TieuPhuong\\TieuPhuong.lua", -- TiÓu Ph­¬ng
                                                                         "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÏôÔ¶Â¥.lua", -- TiÓu Ngäc
                                                                     },
});
----------------------------------------------------------------------------------------------------
---- Config tÝnh n¨ng ChiÕn tr­êng phô L­¬ng Th¶o -- ®ãng h¼n kh«ng dïng ®Õn
g_WCFG_NEWBATTLES_RESOURCE = WConfigs:RegType("newbattles_resource", { nDateOpen = 0, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\newbattles\sign_up_npc.lua
                                                                       szModuleName = "Nh¹n M«n Quan_Thu ThËp L­¬ng Th¶o",

                                                                       bDisableRegisterTimeLimit = WEnv.FALSE,
                                                                       tbTimeOpen = {
                                                                           1401, -- Giê ch¹y trong \settings\systemtimetask.txt
                                                                           1901, -- Giê ch¹y trong \settings\systemtimetask.txt
                                                                       },

                                                                       tbWinAward = {
                                                                           nHonor = 1200,
                                                                           nExp = 30000000,
                                                                           nBattlePoint = 400,
                                                                       },
                                                                       tbLoseAward = {
                                                                           nHonor = 800,
                                                                           nExp = 20000000,
                                                                           nBattlePoint = 200,
                                                                       },
                                                                       tbDrawAward = {
                                                                           nHonor = 800,
                                                                           nExp = 20000000,
                                                                           nBattlePoint = 200,
                                                                       },

                                                                       tbReloadFile = {
                                                                           "\\script\\newbattles\\functions.lua",
                                                                           "\\script\\newbattles\\sign_up_npc.lua",
                                                                           "\\script\\newbattles\\systemtimemessage\\main_battle_signup.lua",
                                                                           "\\script\\battles\\battlejoin1.lua",
                                                                           "\\script\\battles\\battlejoin2.lua",
                                                                           "\\script\\online\\viet_event\\Battle_TieuPhuong\\TieuPhuong.lua", -- TiÓu Ph­¬ng
                                                                           "\\script\\ÖÐÔ­Ò»Çø\\ãê¾©\\npc\\ÏôÔ¶Â¥.lua", -- TiÓu Ngäc
                                                                       },
});
----------------------------------------------------------------------------------------------------
---- Config tÝnh n¨ng Tµi Nguyªn ChiÕn
---T­ M· TÊn Nguyªn: \script\ÖÐÔ­¶þÇø\ÏåÑô\npc\Ë¾Âí½úÔª.lua
g_WCFG_NEWRESOURCE = WConfigs:RegType("newresource", { nDateOpen = 20231210, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\newbattles\sign_up_npc.lua
                                                       szModuleName = "Thiªn M«n TrËn_Tµi Nguyªn ChiÕn",
});
----------------------------------------------------------------------------------------------------
---- Config tÝnh n¨ng L­¬ng S¬n B¹c
---ThÇn Hµnh §íi B¶o T«ng: \script\missions\liangshan\npc\entrynpc_.lua
g_WCFG_LUONGSONBAC = WConfigs:RegType("luongsonbac", { nDateOpen = 1, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\missions\liangshan\npc\entrynpc_.lua
                                                       szModuleName = "L­¬ng S¬n B¹c",

                                                       --- Mod ®iÒu kiÖn tham gia
                                                       nTeamMemberMinReq = 3,
                                                       nLevelMinReq = 98,
                                                       nRebornMinReq = 3,
                                                       nLimitDay = 200,
                                                       nConsumeEnergy = 20, -- mÆc ®Þnh tiªu hao tinh lùc 20

                                                       --- Mod thêi gian cã thÓ tham gia ¶i
                                                       tbCanDoAtTime = { -- 1=cn; 2=t2; 3=t3; 4=t4; 5=t5; 6=t6; 7=t7 (v× 0 kh«ng ®Õm ®c trong table nªn ®¨t key = nWeek+1)
                                                           --[1] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                           --[2] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                           --[3] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                           --[4] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                           --[5] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                           --[6] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                           --[7] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                       },

                                                       ---- Mod bËt t¾t tÝnh n¨ng drop r­¬ng
                                                       bDisableDropBox = WEnv.TRUE,

                                                       ---- Mod bËt t¾t c¸c dßng chän vµo ¶i
                                                       bDisableEntryNormalMode = WEnv.FALSE,
                                                       bDisableEntryConsumeMode = WEnv.FALSE,

                                                       ---- Mod tiªu phÝ thµnh free
                                                       bConsumeToFree = WEnv.FALSE,

                                                       ---- Danh s¸ch c¸c file cÇn reload
                                                       tbReloadFile = {
                                                           "\\script\\missions\\liangshan\\string_liangshan.lua",
                                                           "\\script\\missions\\liangshan\\head.lua",
                                                           "\\script\\missions\\liangshan\\npc\\entrynpc_.lua",
                                                           "\\script\\missions\\liangshan\\stage\\stagebase.lua",
                                                           "\\script\\missions\\liangshan\\npc\\box_gold.lua",
                                                           "\\script\\missions\\liangshan\\npc\\box_yin.lua",
                                                           "\\script\\missions\\liangshan\\npc\\box_tong.lua",
                                                           "\\script\\missions\\liangshan\\stage\\stage_6.lua",
                                                       },
});
----------------------------------------------------------------------------------------------------
---- Config tÝnh n¨ng §Þa HuyÒn Cung
---\script\missions\dixuangong\npc\entrynpc.lua
g_WCFG_DIAHUYENCUNG = WConfigs:RegType("diahuyencung", { nDateOpen = 1, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\missions\dixuangong\npc\entrynpc.lua
                                                         szModuleName = "§Þa HuyÒn Cung",

                                                         --- Mod ®iÒu kiÖn tham gia
                                                         nTeamMemberMinReq = 3,
                                                         nLevelMinReq = 98,
                                                         nRebornMinReq = 3,
                                                         nConsumeEnergy = 20, -- mÆc ®Þnh tiªu hao tinh lùc 20

                                                         --- Mod thêi gian cã thÓ tham gia ¶i
                                                         tbCanDoAtTime = { -- 1=cn; 2=t2; 3=t3; 4=t4; 5=t5; 6=t6; 7=t7 (v× 0 kh«ng ®Õm ®c trong table nªn ®¨t key = nWeek+1)
                                                             --[1] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                             --[2] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                             --[3] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                             --[4] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                             --[5] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                             --[6] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                             --[7] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                         },

                                                         ---- Mod bËt t¾t tÝnh n¨ng drop r­¬ng
                                                         bDisableDropBox = WEnv.TRUE,

                                                         ---- Mod bËt t¾t c¸c dßng chän vµo ¶i
                                                         bDisableEntryNormalMode = WEnv.FALSE,
                                                         bDisableEntryConsumeMode = WEnv.FALSE,

                                                         ---- Mod tiªu hao vËt phÈm thµnh free
                                                         bConsumeToFree = WEnv.FALSE,

                                                         ---- Danh s¸ch c¸c file cÇn reload
                                                         tbReloadFile = {
                                                             "\\script\\missions\\dixuangong\\mission_head.lua",
                                                             "\\script\\missions\\dixuangong\\npc\\entrynpc.lua",
                                                             "\\script\\missions\\dixuangong\\stage\\stagexx.lua",
                                                             "\\script\\missions\\dixuangong\\npc\\box_gold.lua",
                                                             "\\script\\missions\\dixuangong\\npc\\box_yin.lua",
                                                             "\\script\\missions\\dixuangong\\npc\\box_tong.lua",
                                                         },
});
----------------------------------------------------------------------------------------------------
---- Config tÝnh n¨ng KiÕm §·ng YÕn V©n
---Hoa Th¸nh L¹c Phi: \script\missions\jiandangyanyun\npcs\luofei_npc.lua
g_WCFG_KIEMDANGYENVAN = WConfigs:RegType("kiemdangyenvan", { nDateOpen = 0, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\missions\jiandangyanyun\npcs\luofei_npc.lua
                                                             szModuleName = "KiÕm §·ng Yªn V©n",

                                                             --- Mod ®iÒu kiÖn tham gia
                                                             nTeamMemberMinReq = 4,
                                                             nLimitJoinDaily = 10,
                                                             nBigLevelReq = 398,
                                                             nConsumeEnergy = 0, -- mÆc ®Þnh tiªu hao tinh lùc 20

                                                             ---- Mod bËt t¾t tÝnh n¨ng drop r­¬ng
                                                             bDisableDropBox = WEnv.TRUE,

                                                             ---- Mod bËt t¾t tÝnh n¨ng tiªu phÝ ¶i
                                                             bDisableEntryNormalMode = WEnv.TRUE,
                                                             bDisableEntryConsumeMode = WEnv.FALSE,

                                                             ---- Mod tiªu hao vËt phÈm thµnh free
                                                             bConsumeToFree = WEnv.TRUE,

                                                             ---- Danh s¸ch c¸c file cÇn reload
                                                             tbReloadFile = {
                                                                 "\\script\\missions\\jiandangyanyun\\head.lua",
                                                                 "\\script\\missions\\jiandangyanyun\\jdyyfunctions.lua",
                                                                 "\\script\\missions\\jiandangyanyun\\npcs\\luofei_npc.lua",
                                                                 "\\script\\missions\\jiandangyanyun\\stage\\tstage01.lua",
                                                             },
});
----------------------------------------------------------------------------------------------------
---- Config tÝnh n¨ng trång c©y tø linh
---B¸ch Th¶o Tiªn: \script\online_activites\2010_12\activites_04\init.lua
g_WCFG_CAYTULINH = WConfigs:RegType("caytulinh", { nDateOpen = 1, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\online_activites\2010_12\activites_04\init.lua
                                                   szModuleName = "C©y Tø Linh",

                                                   ---- Danh s¸ch c¸c file cÇn reload
                                                   tbReloadFile = {
                                                       "\\script\\online_activites\\2010_12\\activites_04\\init.lua",
                                                   },
});
----------------------------------------------------------------------------------------------------
---- Config tÝnh n¨ng trång b¸t nh· lín
---C©y B¸t Nh·: \script\online\plant\seed_item.lua
g_WCFG_BATNHALON = WConfigs:RegType("batnhalon", { nDateOpen = 1, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më -- File: \script\online\plant\seed_item.lua
                                                   szModuleName = "B¸t Nh· Lín",

                                                   --- Mod ®iÒu kiÖn tham gia
                                                   ---\script\online\plant\seed_item.lua
                                                   nLevelMinReq = 70,
                                                   bPkReq = WEnv.TRUE,
                                                   nRobLevelMinReq = 75,
                                                   nRobReputationMinReq = 3000,

                                                   ---- Mod chØ cho phÐp trång trong thêi gian quy ®Þnh
                                                   ---\script\online\plant\seed_item.lua
                                                   tbCanDoAtTime = { -- 1=cn; 2=t2; 3=t3; 4=t4; 5=t5; 6=t6; 7=t7
                                                       --[1] = {{1000, 1200},  {1500, 1700}, {2200, 2400},},
                                                       --[2] = {{1000, 1200},  {1500, 1700}, {2200, 2400},},
                                                       --[3] = {{1000, 1200},  {1500, 1700}, {2200, 2400},},
                                                       --[4] = {{1000, 1200},  {1500, 1700}, {2200, 2400},},
                                                       --[5] = {{1000, 1200},  {1500, 1700}, {2200, 2400},},
                                                       --[6] = {{1000, 1200},  {1500, 1700}, {2200, 2400},},
                                                       --[7] = {{1000, 1200},  {1500, 1700}, {2200, 2400},},
                                                   },

                                                   ---- Danh s¸ch c¸c file cÇn reload
                                                   tbReloadFile = {
                                                       --"\\script\\online\\plant\\tree_head.lua",
                                                       "\\script\\online\\plant\\seed_item.lua",
                                                       "\\script\\online\\plant\\tree_npc.lua",
                                                   },
});
----------------------------------------------------------------------------------------------------
---- Config tÝnh n¨ng Tµng KiÕm
---Sø gi¶ Tµng KiÕm: \script\²Ø½£É½×¯\task_script\task_head.lua
g_WCFG_TANGKIEM = WConfigs:RegType("tangkiemsontrang", { nDateOpen = 1, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më
                                                         szModuleName = "Tµng KiÕm S¬n Trang",
                                                         nCountStageLimit=4,
                                                         bEnableEnergyMode = WEnv.TRUE,
                                                         nConsumeEnergy = 20, -- mÆc ®Þnh tiªu hao tinh lùc 20

                                                         ---- Danh s¸ch c¸c file cÇn reload
                                                         tbReloadFile = {
                                                             "\\script\\²Ø½£É½×¯\\task_script\\task_head.lua",
                                                             "\\script\\²Ø½£É½×¯\\task_script\\²Ø½£Ê¹Õß.lua",
                                                             -- c¸c thµnh kh¸c
                                                             "\\script\\²Ø½£É½×¯\\task_script\\³É¶¼\\²Ø½£Ê¹Õß.lua",
                                                             "\\script\\²Ø½£É½×¯\\task_script\\³É¶¼\\task_head.lua",
                                                             "\\script\\²Ø½£É½×¯\\task_script\\ãê¾©\\²Ø½£Ê¹Õß.lua",
                                                             "\\script\\²Ø½£É½×¯\\task_script\\ãê¾©\\task_head.lua",
                                                             "\\script\\²Ø½£É½×¯\\task_script\\ÈªÖÝ\\²Ø½£Ê¹Õß.lua",
                                                             "\\script\\²Ø½£É½×¯\\task_script\\ÈªÖÝ\\task_head.lua",
                                                             "\\script\\²Ø½£É½×¯\\task_script\\ÏåÑô\\²Ø½£Ê¹Õß.lua",
                                                             "\\script\\²Ø½£É½×¯\\task_script\\ÏåÑô\\task_head.lua",
                                                             "\\script\\²Ø½£É½×¯\\task_script\\ÑïÖÝ\\²Ø½£Ê¹Õß.lua",
                                                             "\\script\\²Ø½£É½×¯\\task_script\\ÑïÖÝ\\task_head.lua",
                                                         },
});
----------------------------------------------------------------------------------------------------
---- Config tÝnh n¨ng Th¸i H­ verion 1
---ThÇn Du Ch©n Nh©n: \script\Ì«Ðé»Ã¾³\¿Õ¿ÕºÍÉÐ.lua
g_WCFG_THAIHU1 = WConfigs:RegType("thaihuhuyencanh", { nDateOpen = 1, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më
                                                       szModuleName = "Th¸i H­ HuyÔn C¶nh",

                                                       ---- Danh s¸ch c¸c file cÇn reload
                                                       tbReloadFile = {
                                                           "\\script\\Ì«Ðé»Ã¾³\\¿Õ¿ÕºÍÉÐ.lua",
                                                       },
});
----------------------------------------------------------------------------------------------------
---- Config tÝnh n¨ng Th¸i H­ version 2
---ThÇn Du Ch©n Nh©n: \script\missions\taixu_mission\¿Õ¿ÕºÍÉÐ.lua
g_WCFG_THAIHU2 = WConfigs:RegType("thaihuhuyencanh2", { nDateOpen = 1, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më
                                                        szModuleName = "Th¸i H­ HuyÔn C¶nh",
                                                        nCountStageLimit=4,
                                                        bEnableEnergyMode = WEnv.FALSE,
                                                        nConsumeEnergy = 20, -- mÆc ®Þnh tiªu hao tinh lùc 20

                                                        ---- Danh s¸ch c¸c file cÇn reload
                                                        tbReloadFile = {
                                                            "\\script\\missions\\taixu_mission\\¿Õ¿ÕºÍÉÐ.lua",
                                                        },
});
----------------------------------------------------------------------------------------------------
---- Config tÝnh n¨ng Giftcode alphatest
---ThÇn Du Ch©n Nh©n: \script\warlord\libs\lib_award.lua
g_WCFG_GIFTCODE_ALPHATEST = WConfigs:RegType("giftcode_alphatest", { nDateOpen = 0, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më
                                                           szModuleName = "GiftCode AlphaTest",

                                                           ---- Danh s¸ch c¸c file cÇn reload
                                                           tbReloadFile = {
                                                               "\\script\\warlord\\online_activities\\giftcode_alphatest\\head.lua",
                                                               "\\script\\warlord\\online_activities\\giftcode_alphatest\\functions.lua",
                                                               "\\script\\warlord\\online_activities\\giftcode_alphatest\\main.lua",
                                                               "\\script\\warlord\\libs\\lib_award.lua",
                                                               "\\script\\online\\activity_ambassador.lua",
                                                           },

                                                           --- NhiÖm vô nhËn giftcode
                                                           bTaskReqEnable = WEnv.TRUE,
});
----------------------------------------------------------------------------------------------------
---- Config tÝnh n¨ng tû vâ
---§Æc sø §¹i Héi Tû Vâ: \script\biwudahui\tournament\npc\npc_zhenzidan.lua
g_WCFG_BIWUDAHUI_1VS1 = WConfigs:RegType("biwudahui_1vs1", { nDateOpen = 1, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më
                                                             szModuleName = "§¹i Héi Tû Vâ 1vs1",

                                                             --- Yªu cÇu tham gia
                                                             nBigLevelReq = 798,

                                                             --- Danh s¸ch c¸c file cÇn reload
                                                             tbReloadFile = {
                                                                 "\\script\\biwudahui\\tournament\\npc\\npc_zhenzidan.lua",
                                                             },

});
----------------------------------------------------------------------------------------------------
---- Config tÝnh n¨ng tû vâ 3v3 (bËt t¾t chÝnh t¹i system_switch_config.lua)
---§Æc sø §¹i Héi Tû Vâ: \script\biwudahui\tournament\npc\npc_zhenzidan.lua
g_WCFG_BIWUDAHUI_3VS3 = WConfigs:RegType("biwudahui_3vs3", { nDateOpen = 1, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më
                                                             szModuleName = "§¹i Héi Tû Vâ 3vs3",

                                                             --- Yªu cÇu tham gia
                                                             nBigLevelReq = 798,

                                                             ---- Danh s¸ch c¸c file cÇn reload
                                                             tbReloadFile = {
                                                                 "\\script\\missions\\nvn\\3v3npc.lua",
                                                                 "\\script\\biwudahui\\tournament\\npc\\npc_zhenzidan.lua",
                                                             },
});
----------------------------------------------------------------------------------------------------
--- Config tÝnh n¨ng boss thÕ giíi  (bËt t¾t chÝnh t¹i system_switch_config.lua)
g_WCFG_WORLDBOSS = WConfigs:RegType("worldboss", { nDateOpen = 1, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më
                                                   szModuleName = "Boss thÕ giíi",

                                                   --- Yªu cÇu tham gia
                                                   nBigLevelReq = 798,
                                                   bPkReq = WEnv.TRUE,

                                                   ---- Danh s¸ch c¸c file cÇn reload
                                                   tbReloadFile = {
                                                       "\\script\\warlord\\libs\\lib_award.lua",
                                                       "\\script\\function\\world_boss\\wb_define.lua",
                                                       "\\script\\function\\world_boss\\wb_head.lua",
                                                       "\\script\\function\\world_boss\\wb_big_box.lua",
                                                       "\\script\\function\\world_boss\\wb_big_box1.lua",
                                                   },
});
----------------------------------------------------------------------------------------------------
--- Config vËn tiªu
g_WCFG_VANTIEU = WConfigs:RegType("vantieu", { nDateOpen = 1, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më
                                               szModuleName = "Boss thÕ giíi",

                                               --- Yªu cÇu tham gia
                                               nBigLevelReq = 798,
                                               bPkReq = WEnv.TRUE,

                                               bEnableConsumeMode = WEnv.TRUE,
                                               tbConsume = { tbProp = { 2, 1, 30230 }, nCount = 60 },

                                               ---- Danh s¸ch c¸c file cÇn reload
                                               tbReloadFile = {
                                               },
});
----------------------------------------------------------------------------------------------------
--- Config ho¹t ®éng ®ua tÝch luü më r­¬ng mçi ngµy
g_WCFG_RUONGHOATDONG = WConfigs:RegType("ruonghoatdong", { nDateOpen = 0, -- Ngµy më tÝnh n¨ng ®Þnh d¹ng yyyymmdd, nÕu ®Ó =0 lµ lu«n ®ãng, =1 lµ lu«n më
                                               szModuleName = "R­¬ng ho¹t ®éng",

                                               ---- Danh s¸ch c¸c file cÇn reload
                                               tbReloadFile = {
                                               },
});

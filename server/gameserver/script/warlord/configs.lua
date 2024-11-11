----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: file t�p h�p c�c config gi� m�/�i�u ki�n c�c ho�t ��ng
----------------------------------------------------------------------------------------------------
--- Th� vi�n config
WConfigsBase = {
    fnDebug = nothing,
    szKey = "WConfigsBase",
    szModuleName = "WConfigsBase",
    tbTimeOpen = {},
    tbCanDoAtTime = { -- 1=cn; 2=t2; 3=t3; 4=t4; 5=t5; 6=t6; 7=t7 (v� 0 kh�ng ��m �c trong table n�n ��t key = nWeek+1)
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
    --do return 1; end -- test m� full
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
                Msg2Player(format("%s s� m� v�o ng�y %s, h�y quay l�i sau!", self.szModuleName, WDate:ToString(self.nDateOpen)));
            else
                Msg2Player(format("%s �� ��ng, h�y quay l�i sau!", self.szModuleName));
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
            Msg2Player(format("Ch�a ��n th�i gian m� %s, h�y quay l�i sau!", self.szModuleName));
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
            Msg2Player(format("Ch�a ��n th�i gian m� %s, h�y quay l�i sau!", self.szModuleName));
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
    szProductName = "V� L�m 2",
    szHomeUrl = "jx2loangiangho.com",
    szFbUrl = "fb.com/jx2loangiangho",
};
----------------------------------------------------------------------------------------------------
--- Config t�nh n�ng S�t th� ���ng
g_WCFG_SATTHUDUONG = WConfigs:RegType("satthuduong", { nDateOpen = 0, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\task\killer_hall\mission\init_killer_hall.lua, \script\warlord\npcs\sat_thu_duong.lua, \script\task\killer_hall\entrance_npc.lua
                                                       szModuleName = "S�t Th� ���ng",
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
--- Config t�nh n�ng Th�i Nh�t Th�p
g_WCFG_THAINHATTHAP = WConfigs:RegType("thainhatthap", { nDateOpen = 0, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\missions\taiyi\yangzongbao_npc.lua, \script\missions\taiyi\muguiying_npc.lua
                                                         szModuleName = "Th�i Nh�t Th�p",
                                                         tbReloadFile = {
                                                             "\\script\\missions\\taiyi\\yangzongbao_npc.lua",
                                                             "\\script\\missions\\taiyi\\muguiying_npc.lua",
                                                         },
});
----------------------------------------------------------------------------------------------------
--- Config t�nh n�ng V�n Ki�m Tr�ng
g_WCFG_VANKIEMTRUNG = WConfigs:RegType("vankiemtrung", { nDateOpen = 0, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\missions\cangjianshanzhuang\jt_npc.lua
                                                         szModuleName = "V�n Ki�m Tr�ng",

                                                         tbReloadFile = {
                                                             "\\script\\missions\\cangjianshanzhuang\\jt_npc.lua",
                                                             "\\script\\missions\\cangjianshanzhuang\\wjz_mission_entry_npc.lua",
                                                         },

                                                         bDisableDropBox = WEnv.TRUE,
});
----------------------------------------------------------------------------------------------------
--- Config t�nh n�ng Ma V�c
g_WCFG_MAVUC = WConfigs:RegType("mavuc", { nDateOpen = 0, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\isolate\functions\moyutaoyuan\main.lua
                                           szModuleName = "Ma V�c",

                                           tbReloadFile = {
                                               "\\script\\isolate\\functions\\moyutaoyuan\\main.lua",
                                           },
});
----------------------------------------------------------------------------------------------------
--- Config t�nh n�ng Chi�n tr��ng Li�n Server
g_WCFG_CHIENTRUONG_LSV = WConfigs:RegType("chientruong_lsv", { nDateOpen = 0, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\missions\kuafu_battle\npc\kf_jieyinren.lua
                                                               szModuleName = "Chi�n tr��ng li�n server",

                                                               tbReloadFile = {
                                                                   "\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua",
                                                               },
});
----------------------------------------------------------------------------------------------------
--- Config t�nh n�ng Chi�n tr��ng Hi�p L� T��ng Ph�ng
g_WCFG_CHIENTRUONG_HIEPLO = WConfigs:RegType("chientruong_hieplo", { nDateOpen = 0, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\exchg_server\one_road_battle_npc.lua
                                                                     szModuleName = "Chi�n tr��ng Hi�p l� t��ng ph�ng",

                                                                     tbReloadFile = {
                                                                         "\\script\\exchg_server\\one_road_battle_npc.lua",
                                                                     },
});
----------------------------------------------------------------------------------------------------
---- Config t�nh n�ng Nhi�m v� s� m�n m�i
g_WCFG_NHIEMVUSMMOI = WConfigs:RegType("nhiemvusumonmoi", { nDateOpen = 0, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\faction\faction_head.lua
                                                            szModuleName = "Nhi�m v� s� m�n m�i",

                                                            tbReloadFile = {
                                                                "\\script\\faction\\faction_head.lua",
                                                            },
});
----------------------------------------------------------------------------------------------------
--- Config t�nh n�ng Chi�n tr��ng Nh�n M�n Quan_Chi�n d�ch ch�nh
g_WCFG_NEWBATTLES_MAIN = WConfigs:RegType("newbattles_main", { nDateOpen = 20231210, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\newbattles\systemtimemessage\main_battle_signup.lua, \script\��ԭһ��\�꾩\npc\��Զ¥.lua
                                                               szModuleName = "Nh�n M�n Quan_Nh�n M�n R�c L�a",

                                                               bDisableRegisterTimeLimit = WEnv.TRUE,
                                                               tbTimeOpen = {
                                                                   --1501, -- -- Gi� ch�y trong \settings\systemtimetask.txt
                                                                   2001, -- -- Gi� ch�y trong \settings\systemtimetask.txt
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

                                                               ---- Danh s�ch c�c file c�n reload
                                                               tbReloadFile = {
                                                                   "\\script\\newbattles\\functions.lua",
                                                                   "\\script\\newbattles\\sign_up_npc.lua",
                                                                   "\\script\\newbattles\\systemtimemessage\\main_battle_signup.lua",
                                                                   "\\script\\battles\\battlejoin1.lua",
                                                                   "\\script\\battles\\battlejoin2.lua",
                                                                   "\\script\\online\\viet_event\\Battle_TieuPhuong\\TieuPhuong.lua", -- Ti�u Ph��ng
                                                                   "\\script\\��ԭһ��\\�꾩\\npc\\��Զ¥.lua", -- Ti�u Ng�c
                                                                   "\\script\\newbattles\\mainbattle\\soldier_npc.lua", -- Npc v�o v� tr� h�u, ti�n doanh
                                                               },
});
----------------------------------------------------------------------------------------------------
---- Config t�nh n�ng Chi�n tr��ng ph� Ph�o ��i
---Tri�u Di�n Ni�n:
---Ti�u Vi�n L�u:
g_WCFG_NEWBATTLES_EMPLACEMENT = WConfigs:RegType("newbattles_emplacement", { nDateOpen = 20231210, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\newbattles\sign_up_npc.lua
                                                                             szModuleName = "Nh�n M�n Quan_B�o V� Th�nh Tr�",

                                                                             bDisableRegisterTimeLimit = WEnv.TRUE,
                                                                             tbTimeOpen = {
                                                                                 --1401, -- Gi� ch�y trong \settings\systemtimetask.txt
                                                                                 1901, -- Gi� ch�y trong \settings\systemtimetask.txt
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
                                                                                 "\\script\\online\\viet_event\\Battle_TieuPhuong\\TieuPhuong.lua", -- Ti�u Ph��ng
                                                                                 "\\script\\��ԭһ��\\�꾩\\npc\\��Զ¥.lua", -- Ti�u Ng�c
                                                                             },
});
----------------------------------------------------------------------------------------------------
---- Config t�nh n�ng Chi�n tr��ng ph� Th�n Trang -- ��ng h�n kh�ng d�ng ��n
g_WCFG_NEWBATTLES_VILLAGE = WConfigs:RegType("newbattles_village", { nDateOpen = 0, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\newbattles\sign_up_npc.lua
                                                                     szModuleName = "Nh�n M�n Quan_Gi�i C�u N�ng Trang",

                                                                     bDisableRegisterTimeLimit = WEnv.FALSE,
                                                                     tbTimeOpen = {
                                                                         1401, -- Gi� ch�y trong \settings\systemtimetask.txt
                                                                         1901, -- Gi� ch�y trong \settings\systemtimetask.txt
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
                                                                         "\\script\\online\\viet_event\\Battle_TieuPhuong\\TieuPhuong.lua", -- Ti�u Ph��ng
                                                                         "\\script\\��ԭһ��\\�꾩\\npc\\��Զ¥.lua", -- Ti�u Ng�c
                                                                     },
});
----------------------------------------------------------------------------------------------------
---- Config t�nh n�ng Chi�n tr��ng ph� L��ng Th�o -- ��ng h�n kh�ng d�ng ��n
g_WCFG_NEWBATTLES_RESOURCE = WConfigs:RegType("newbattles_resource", { nDateOpen = 0, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\newbattles\sign_up_npc.lua
                                                                       szModuleName = "Nh�n M�n Quan_Thu Th�p L��ng Th�o",

                                                                       bDisableRegisterTimeLimit = WEnv.FALSE,
                                                                       tbTimeOpen = {
                                                                           1401, -- Gi� ch�y trong \settings\systemtimetask.txt
                                                                           1901, -- Gi� ch�y trong \settings\systemtimetask.txt
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
                                                                           "\\script\\online\\viet_event\\Battle_TieuPhuong\\TieuPhuong.lua", -- Ti�u Ph��ng
                                                                           "\\script\\��ԭһ��\\�꾩\\npc\\��Զ¥.lua", -- Ti�u Ng�c
                                                                       },
});
----------------------------------------------------------------------------------------------------
---- Config t�nh n�ng T�i Nguy�n Chi�n
---T� M� T�n Nguy�n: \script\��ԭ����\����\npc\˾���Ԫ.lua
g_WCFG_NEWRESOURCE = WConfigs:RegType("newresource", { nDateOpen = 20231210, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\newbattles\sign_up_npc.lua
                                                       szModuleName = "Thi�n M�n Tr�n_T�i Nguy�n Chi�n",
});
----------------------------------------------------------------------------------------------------
---- Config t�nh n�ng L��ng S�n B�c
---Th�n H�nh ��i B�o T�ng: \script\missions\liangshan\npc\entrynpc_.lua
g_WCFG_LUONGSONBAC = WConfigs:RegType("luongsonbac", { nDateOpen = 1, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\missions\liangshan\npc\entrynpc_.lua
                                                       szModuleName = "L��ng S�n B�c",

                                                       --- Mod �i�u ki�n tham gia
                                                       nTeamMemberMinReq = 3,
                                                       nLevelMinReq = 98,
                                                       nRebornMinReq = 3,
                                                       nLimitDay = 200,
                                                       nConsumeEnergy = 20, -- m�c ��nh ti�u hao tinh l�c 20

                                                       --- Mod th�i gian c� th� tham gia �i
                                                       tbCanDoAtTime = { -- 1=cn; 2=t2; 3=t3; 4=t4; 5=t5; 6=t6; 7=t7 (v� 0 kh�ng ��m �c trong table n�n ��t key = nWeek+1)
                                                           --[1] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                           --[2] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                           --[3] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                           --[4] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                           --[5] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                           --[6] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                           --[7] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                       },

                                                       ---- Mod b�t t�t t�nh n�ng drop r��ng
                                                       bDisableDropBox = WEnv.TRUE,

                                                       ---- Mod b�t t�t c�c d�ng ch�n v�o �i
                                                       bDisableEntryNormalMode = WEnv.FALSE,
                                                       bDisableEntryConsumeMode = WEnv.FALSE,

                                                       ---- Mod ti�u ph� th�nh free
                                                       bConsumeToFree = WEnv.FALSE,

                                                       ---- Danh s�ch c�c file c�n reload
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
---- Config t�nh n�ng ��a Huy�n Cung
---\script\missions\dixuangong\npc\entrynpc.lua
g_WCFG_DIAHUYENCUNG = WConfigs:RegType("diahuyencung", { nDateOpen = 1, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\missions\dixuangong\npc\entrynpc.lua
                                                         szModuleName = "��a Huy�n Cung",

                                                         --- Mod �i�u ki�n tham gia
                                                         nTeamMemberMinReq = 3,
                                                         nLevelMinReq = 98,
                                                         nRebornMinReq = 3,
                                                         nConsumeEnergy = 20, -- m�c ��nh ti�u hao tinh l�c 20

                                                         --- Mod th�i gian c� th� tham gia �i
                                                         tbCanDoAtTime = { -- 1=cn; 2=t2; 3=t3; 4=t4; 5=t5; 6=t6; 7=t7 (v� 0 kh�ng ��m �c trong table n�n ��t key = nWeek+1)
                                                             --[1] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                             --[2] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                             --[3] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                             --[4] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                             --[5] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                             --[6] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                             --[7] = { { 2000, 2359 }, { 0000, 1000 }, },
                                                         },

                                                         ---- Mod b�t t�t t�nh n�ng drop r��ng
                                                         bDisableDropBox = WEnv.TRUE,

                                                         ---- Mod b�t t�t c�c d�ng ch�n v�o �i
                                                         bDisableEntryNormalMode = WEnv.FALSE,
                                                         bDisableEntryConsumeMode = WEnv.FALSE,

                                                         ---- Mod ti�u hao v�t ph�m th�nh free
                                                         bConsumeToFree = WEnv.FALSE,

                                                         ---- Danh s�ch c�c file c�n reload
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
---- Config t�nh n�ng Ki�m ��ng Y�n V�n
---Hoa Th�nh L�c Phi: \script\missions\jiandangyanyun\npcs\luofei_npc.lua
g_WCFG_KIEMDANGYENVAN = WConfigs:RegType("kiemdangyenvan", { nDateOpen = 0, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\missions\jiandangyanyun\npcs\luofei_npc.lua
                                                             szModuleName = "Ki�m ��ng Y�n V�n",

                                                             --- Mod �i�u ki�n tham gia
                                                             nTeamMemberMinReq = 4,
                                                             nLimitJoinDaily = 10,
                                                             nBigLevelReq = 398,
                                                             nConsumeEnergy = 0, -- m�c ��nh ti�u hao tinh l�c 20

                                                             ---- Mod b�t t�t t�nh n�ng drop r��ng
                                                             bDisableDropBox = WEnv.TRUE,

                                                             ---- Mod b�t t�t t�nh n�ng ti�u ph� �i
                                                             bDisableEntryNormalMode = WEnv.TRUE,
                                                             bDisableEntryConsumeMode = WEnv.FALSE,

                                                             ---- Mod ti�u hao v�t ph�m th�nh free
                                                             bConsumeToFree = WEnv.TRUE,

                                                             ---- Danh s�ch c�c file c�n reload
                                                             tbReloadFile = {
                                                                 "\\script\\missions\\jiandangyanyun\\head.lua",
                                                                 "\\script\\missions\\jiandangyanyun\\jdyyfunctions.lua",
                                                                 "\\script\\missions\\jiandangyanyun\\npcs\\luofei_npc.lua",
                                                                 "\\script\\missions\\jiandangyanyun\\stage\\tstage01.lua",
                                                             },
});
----------------------------------------------------------------------------------------------------
---- Config t�nh n�ng tr�ng c�y t� linh
---B�ch Th�o Ti�n: \script\online_activites\2010_12\activites_04\init.lua
g_WCFG_CAYTULINH = WConfigs:RegType("caytulinh", { nDateOpen = 1, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\online_activites\2010_12\activites_04\init.lua
                                                   szModuleName = "C�y T� Linh",

                                                   ---- Danh s�ch c�c file c�n reload
                                                   tbReloadFile = {
                                                       "\\script\\online_activites\\2010_12\\activites_04\\init.lua",
                                                   },
});
----------------------------------------------------------------------------------------------------
---- Config t�nh n�ng tr�ng b�t nh� l�n
---C�y B�t Nh�: \script\online\plant\seed_item.lua
g_WCFG_BATNHALON = WConfigs:RegType("batnhalon", { nDateOpen = 1, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m� -- File: \script\online\plant\seed_item.lua
                                                   szModuleName = "B�t Nh� L�n",

                                                   --- Mod �i�u ki�n tham gia
                                                   ---\script\online\plant\seed_item.lua
                                                   nLevelMinReq = 70,
                                                   bPkReq = WEnv.TRUE,
                                                   nRobLevelMinReq = 75,
                                                   nRobReputationMinReq = 3000,

                                                   ---- Mod ch� cho ph�p tr�ng trong th�i gian quy ��nh
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

                                                   ---- Danh s�ch c�c file c�n reload
                                                   tbReloadFile = {
                                                       --"\\script\\online\\plant\\tree_head.lua",
                                                       "\\script\\online\\plant\\seed_item.lua",
                                                       "\\script\\online\\plant\\tree_npc.lua",
                                                   },
});
----------------------------------------------------------------------------------------------------
---- Config t�nh n�ng T�ng Ki�m
---S� gi� T�ng Ki�m: \script\�ؽ�ɽׯ\task_script\task_head.lua
g_WCFG_TANGKIEM = WConfigs:RegType("tangkiemsontrang", { nDateOpen = 1, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m�
                                                         szModuleName = "T�ng Ki�m S�n Trang",
                                                         nCountStageLimit=4,
                                                         bEnableEnergyMode = WEnv.TRUE,
                                                         nConsumeEnergy = 20, -- m�c ��nh ti�u hao tinh l�c 20

                                                         ---- Danh s�ch c�c file c�n reload
                                                         tbReloadFile = {
                                                             "\\script\\�ؽ�ɽׯ\\task_script\\task_head.lua",
                                                             "\\script\\�ؽ�ɽׯ\\task_script\\�ؽ�ʹ��.lua",
                                                             -- c�c th�nh kh�c
                                                             "\\script\\�ؽ�ɽׯ\\task_script\\�ɶ�\\�ؽ�ʹ��.lua",
                                                             "\\script\\�ؽ�ɽׯ\\task_script\\�ɶ�\\task_head.lua",
                                                             "\\script\\�ؽ�ɽׯ\\task_script\\�꾩\\�ؽ�ʹ��.lua",
                                                             "\\script\\�ؽ�ɽׯ\\task_script\\�꾩\\task_head.lua",
                                                             "\\script\\�ؽ�ɽׯ\\task_script\\Ȫ��\\�ؽ�ʹ��.lua",
                                                             "\\script\\�ؽ�ɽׯ\\task_script\\Ȫ��\\task_head.lua",
                                                             "\\script\\�ؽ�ɽׯ\\task_script\\����\\�ؽ�ʹ��.lua",
                                                             "\\script\\�ؽ�ɽׯ\\task_script\\����\\task_head.lua",
                                                             "\\script\\�ؽ�ɽׯ\\task_script\\����\\�ؽ�ʹ��.lua",
                                                             "\\script\\�ؽ�ɽׯ\\task_script\\����\\task_head.lua",
                                                         },
});
----------------------------------------------------------------------------------------------------
---- Config t�nh n�ng Th�i H� verion 1
---Th�n Du Ch�n Nh�n: \script\̫��þ�\�տպ���.lua
g_WCFG_THAIHU1 = WConfigs:RegType("thaihuhuyencanh", { nDateOpen = 1, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m�
                                                       szModuleName = "Th�i H� Huy�n C�nh",

                                                       ---- Danh s�ch c�c file c�n reload
                                                       tbReloadFile = {
                                                           "\\script\\̫��þ�\\�տպ���.lua",
                                                       },
});
----------------------------------------------------------------------------------------------------
---- Config t�nh n�ng Th�i H� version 2
---Th�n Du Ch�n Nh�n: \script\missions\taixu_mission\�տպ���.lua
g_WCFG_THAIHU2 = WConfigs:RegType("thaihuhuyencanh2", { nDateOpen = 1, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m�
                                                        szModuleName = "Th�i H� Huy�n C�nh",
                                                        nCountStageLimit=4,
                                                        bEnableEnergyMode = WEnv.FALSE,
                                                        nConsumeEnergy = 20, -- m�c ��nh ti�u hao tinh l�c 20

                                                        ---- Danh s�ch c�c file c�n reload
                                                        tbReloadFile = {
                                                            "\\script\\missions\\taixu_mission\\�տպ���.lua",
                                                        },
});
----------------------------------------------------------------------------------------------------
---- Config t�nh n�ng Giftcode alphatest
---Th�n Du Ch�n Nh�n: \script\warlord\libs\lib_award.lua
g_WCFG_GIFTCODE_ALPHATEST = WConfigs:RegType("giftcode_alphatest", { nDateOpen = 0, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m�
                                                           szModuleName = "GiftCode AlphaTest",

                                                           ---- Danh s�ch c�c file c�n reload
                                                           tbReloadFile = {
                                                               "\\script\\warlord\\online_activities\\giftcode_alphatest\\head.lua",
                                                               "\\script\\warlord\\online_activities\\giftcode_alphatest\\functions.lua",
                                                               "\\script\\warlord\\online_activities\\giftcode_alphatest\\main.lua",
                                                               "\\script\\warlord\\libs\\lib_award.lua",
                                                               "\\script\\online\\activity_ambassador.lua",
                                                           },

                                                           --- Nhi�m v� nh�n giftcode
                                                           bTaskReqEnable = WEnv.TRUE,
});
----------------------------------------------------------------------------------------------------
---- Config t�nh n�ng t� v�
---��c s� ��i H�i T� V�: \script\biwudahui\tournament\npc\npc_zhenzidan.lua
g_WCFG_BIWUDAHUI_1VS1 = WConfigs:RegType("biwudahui_1vs1", { nDateOpen = 1, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m�
                                                             szModuleName = "��i H�i T� V� 1vs1",

                                                             --- Y�u c�u tham gia
                                                             nBigLevelReq = 798,

                                                             --- Danh s�ch c�c file c�n reload
                                                             tbReloadFile = {
                                                                 "\\script\\biwudahui\\tournament\\npc\\npc_zhenzidan.lua",
                                                             },

});
----------------------------------------------------------------------------------------------------
---- Config t�nh n�ng t� v� 3v3 (b�t t�t ch�nh t�i system_switch_config.lua)
---��c s� ��i H�i T� V�: \script\biwudahui\tournament\npc\npc_zhenzidan.lua
g_WCFG_BIWUDAHUI_3VS3 = WConfigs:RegType("biwudahui_3vs3", { nDateOpen = 1, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m�
                                                             szModuleName = "��i H�i T� V� 3vs3",

                                                             --- Y�u c�u tham gia
                                                             nBigLevelReq = 798,

                                                             ---- Danh s�ch c�c file c�n reload
                                                             tbReloadFile = {
                                                                 "\\script\\missions\\nvn\\3v3npc.lua",
                                                                 "\\script\\biwudahui\\tournament\\npc\\npc_zhenzidan.lua",
                                                             },
});
----------------------------------------------------------------------------------------------------
--- Config t�nh n�ng boss th� gi�i  (b�t t�t ch�nh t�i system_switch_config.lua)
g_WCFG_WORLDBOSS = WConfigs:RegType("worldboss", { nDateOpen = 1, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m�
                                                   szModuleName = "Boss th� gi�i",

                                                   --- Y�u c�u tham gia
                                                   nBigLevelReq = 798,
                                                   bPkReq = WEnv.TRUE,

                                                   ---- Danh s�ch c�c file c�n reload
                                                   tbReloadFile = {
                                                       "\\script\\warlord\\libs\\lib_award.lua",
                                                       "\\script\\function\\world_boss\\wb_define.lua",
                                                       "\\script\\function\\world_boss\\wb_head.lua",
                                                       "\\script\\function\\world_boss\\wb_big_box.lua",
                                                       "\\script\\function\\world_boss\\wb_big_box1.lua",
                                                   },
});
----------------------------------------------------------------------------------------------------
--- Config v�n ti�u
g_WCFG_VANTIEU = WConfigs:RegType("vantieu", { nDateOpen = 1, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m�
                                               szModuleName = "Boss th� gi�i",

                                               --- Y�u c�u tham gia
                                               nBigLevelReq = 798,
                                               bPkReq = WEnv.TRUE,

                                               bEnableConsumeMode = WEnv.TRUE,
                                               tbConsume = { tbProp = { 2, 1, 30230 }, nCount = 60 },

                                               ---- Danh s�ch c�c file c�n reload
                                               tbReloadFile = {
                                               },
});
----------------------------------------------------------------------------------------------------
--- Config ho�t ��ng �ua t�ch lu� m� r��ng m�i ng�y
g_WCFG_RUONGHOATDONG = WConfigs:RegType("ruonghoatdong", { nDateOpen = 0, -- Ng�y m� t�nh n�ng ��nh d�ng yyyymmdd, n�u �� =0 l� lu�n ��ng, =1 l� lu�n m�
                                               szModuleName = "R��ng ho�t ��ng",

                                               ---- Danh s�ch c�c file c�n reload
                                               tbReloadFile = {
                                               },
});

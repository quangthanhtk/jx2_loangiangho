----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-10
--- Description: c¸c hµm liªn quan ®Õn gm
--- ThÎ gm sÏ cã 2 chç add, 1 lµ login, 2 lµ trong thÎ t©n thñ
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\functions\\function_gm_server.lua");
Include("\\script\\warlord\\functions\\function_gm_player.lua");
Include("\\script\\gmscript.lua");
----------------------------------------------------------------------------------------------------

g_nGMVersion = 2; -- Dïng ®Ó kiÓm tra khi reload script
m_szThisFile = "\\script\\warlord\\functions\\function_gm.lua";
m_tbAdminGotoMap = {
    [1] = {
        szName = "§Õn c¸c thµnh thÞ",
        tbPos = {
            { "BiÖn Kinh", { 200, 1360, 2872 } },
            { "TuyÒn Ch©u", { 100, 1416, 2958 } },
            { "Thµnh §«", { 300, 1769, 3552 } },
            { "T­¬ng D­¬ng", { 350, 1360, 2872 } },
            { "D­¬ng Ch©u", { 150, 1360, 2872 } },
            { "§¹i Lý", { 400, 1360, 2872 } },
            { "Ph­îng T­êng", { 500, 1360, 2872 } },
        }
    },
    [2] = {
        szName = "ThÕ lùc ba phe",
        tbPos = {
            { "Vâ L©m Minh", { 425, 1746, 3197 } },
            { "§¹i Lý Thiªn Long Tù", { 6000, 1603, 2808 } },
            { "Thæ Phån Quúnh KÕt", { 6100, 1648, 3676 } },
            { "T©y H¹ H­ng Kh¸nh", { 6200, 1406, 3138 } },
            { "ThÊt L¹c Nhai", { 6300, 1382, 3252 } },
            { "Thiªn ¢m Th¸nh §Þa", { 6400, 1629, 3267 } },
        }
    },
    --[2] = { szName = "§Õn c¸c m«n ph¸i",
    --    tbPos = {
    --
    --    }
    --},

    [3] = {
        szName = "§Õn chiÕn tr­êng Nh¹n M«n Quan - Gi¶i Cøu N«ng Trang",
        tbPos = {
            { 'Vµo trung t©m', { 881, 1668, 3365 } },

            { 'Vµo khu vùc håi sinh Tèng', { 881, 1552, 3623 } },
            { 'Vµo khu vùc håi sinh Liªu', { 881, 1786, 3152 } },

            { 'Gãc trªn bªn tr¸i b¶n ®å', { 881, 1598, 3216 } },
            { 'Gãc trªn bªn ph¶i b¶n ®å', { 881, 1742, 3224 } },
            { 'Gãc d­íi bªn ph¶i b¶n ®å', { 881, 1732, 3507 } },
            { 'Gãc d­íi bªn tr¸i b¶n ®å', { 881, 1601, 3517 } },
        }
    },
    [4] = {
        szName = "§Õn chiÕn tr­êng Nh¹n M«n Quan - Thu ThËp L­¬ng Th¶o",
        tbPos = {
            { 'Vµo trung t©m', { 882, 1679, 3377 } },

            { 'Vµo khu vùc håi sinh Tèng', { 882, 1572, 3554 } },
            { 'Vµo khu vùc håi sinh Liªu', { 882, 1767, 3182 } },

            { 'NPC N¹n d©n', { 882, 1606, 3263 } },
            { 'NPC Thñ lÜnh s¬n tÆc', { 882, 1729, 3534 } },

            { 'Gãc trªn bªn tr¸i b¶n ®å', { 882, 1608, 3265 } },
            { 'Gãc trªn bªn ph¶i b¶n ®å', { 882, 1722, 3269 } },
            { 'Gãc d­íi bªn ph¶i b¶n ®å', { 882, 1716, 3452 } },
            { 'Gãc d­íi bªn tr¸i b¶n ®å', { 882, 1613, 3486 } },
        }
    },
    [5] = {
        szName = "§Õn chiÕn tr­êng Nh¹n M«n Quan - B¶o VÖ Thµnh Tr×",
        tbPos = {
            { 'Lªn Ph¸o', { 883, 1728, 2909 } },

            { 'Vµo khu vùc håi sinh Tèng', { 883, 1618, 3365 } },
            { '§Õn hËu doanh Tèng', { 883, 1639, 3303 } },
            { '§Õn tiÒn doanh Tèng', { 883, 1675, 3141 } },

            { 'Vµo khu vùc håi sinh Liªu', { 883, 1844, 3367 } },
            { '§Õn hËu doanh Liªu', { 883, 1804, 3307 } },
            { '§Õn tiÒn doanh Liªu', { 883, 1770, 3138 } },
        }
    },
    [6] = {
        szName = "§Õn chiÕn tr­êng Nh¹n M«n Quan - Nh¹n M«n Rùc Löa",
        tbPos = {
            { 'Lªn Ph¸o', { 884, 1765, 3364 } },

            { 'Vµo khu vùc håi sinh Tèng', { 884, 1565, 3744 } },
            { '§Õn hËu doanh Tèng', { 884, 1629, 3651 } },
            { '§Õn tiÒn doanh Tèng', { 884, 1666, 3606 } },

            { 'Vµo khu vùc håi sinh Liªu', { 884, 1933, 3740 } },
            { '§Õn hËu doanh Liªu', { 884, 1899, 3662 } },
            { '§Õn tiÒn doanh Liªu', { 884, 1828, 3611 } },
        }
    },
    [7] = {
        szName = "§Õn khu vùc b¸o danh chiÕn tr­êng",
        tbPos = {
            { 'Mé Binh Quan Phe Tèng', { 808, 1730, 3038 } },
            { 'Mé Binh Quan Phe Liªu', { 808, 1647, 3170 } },
        }
    },

    [8] = {
        szName = "§Õn khu vùc Tµi Nguyªn ChiÕn",
        tbPos = {
            { 'Doanh tr¹i Tèng (TriÖu Tè Quyªn)', { 606, 1234, 2851 } },
            { 'Doanh tr¹i Liªu (Tiªu ViÔn TuÊn)', { 606, 1493, 3111 } },
            { 'Mua c«ng cô (Hoµng TrÝ th­¬ng nh©n)', { 606, 1349, 2994 } },

            { 'B·i 5 R­¬ng ch©u b¸u Tèng', { 606, 1327, 2932 } },
            { 'B·i 12 Thuéc da tµi nguyªn Tèng', { 606, 1365, 2878 } },
            { 'B·i 12 Gç tµi nguyªn Tèng', { 606, 1265, 2977 } },

            { 'B·i 5 Thuéc da tµi nguyªn Liªu', { 606, 1400, 3010 } },
            { 'B·i 12 Th¶o d­îc tµi nguyªn Liªu', { 606, 1468, 2975 } },
            { 'B·i 12 R­¬ng ch©u b¸u Liªu', { 606, 1364, 3072 } },

            { 'B·i 6 Gç tµi nguyªn (b¾c)', { 606, 1503, 2826 } },
            { 'B·i 5 Gç tµi nguyªn (nam)', { 606, 1232, 3044 } },
            { 'B·i 6 R­¬ng ch©u b¸u (nam)', { 606, 1303, 3110 } },
            { 'B·i 5 Th¶o d­îc tµi nguyªn (nam)', { 606, 1243, 3174 } },
        }
    },
    --[8] = {
    --    szName = "§Õn khu vùc C«ng Thµnh ChiÕn",
    --    tbPos = {
    --        {'§Õn Long Trô & §¹i Kú Trung T©m', {887, 1292, 2779}},
    --        {'§Õn §¹i Kú T©y', {887, 138*8, 172*16}},
    --        {'§Õn §¹i Kú §«ng', {887, 162*8, 185*16}},
    --        {'§Õn Cöa T©y', {887, 132*8, 176*16}},
    --        {'§Õn Cöa Trung T©m', {887, 147*8, 180*16}},
    --        {'§Õn Cöa §«ng', {887, 156*8, 188*16}},
    --
    --        {'Vµo khu vùc chuÈn bÞ phe C«ng', {887, 1132, 3153}},
    --        {'§Õn ®iÓm tËp kÕt T©y Nam', {887, 986, 2973}},
    --        {'§Õn ®iÓm tËp kÕt §«ng Nam', {887, 1108, 3067}},
    --
    --        {'Vµo khu vùc chuÈn bÞ phe Thñ', {887, 1457, 2578}},
    --        {'§Õn T©y hËu doanh', {887, 171*8, 160*16}},
    --        {'§Õn §«ng hËu doanh', {887, 186*8, 167*16}},
    --        {'§Õn T©y tiÒn doanh', {887, 150*8, 165*16}},
    --        {'§Õn §«ng tiÒn doanh', {887, 176*8, 179*16}},
    --    }
    --},
    --[9] = {
    --    szName = "§Õn khu vùc Hoa S¬n §¹i ChiÕn",
    --    tbPos = {
    --        {'Lªn b¶o r­¬ng (Hoa S¬n)', {969, 1599, 2985}},
    --        {'§Õn NPC Vâ L©m §Æc Sø (Hoa S¬n)', {969, 1640, 3227}},
    --        {'§Õn NPC Tr­¬ng §¹i H÷u (Long TuyÒn Th«n)', {106, 1309, 3000}},
    --        --{'VÞ trÝ håi sinh 1', {1588, 3219}},
    --        --{'VÞ trÝ håi sinh 2', {1588, 3219}},
    --        --{'VÞ trÝ håi sinh 3', {1588, 3219}},
    --        --{'VÞ trÝ håi sinh 4', {1588, 3219}},
    --    }
    --},
    --[10] = {
    --    szName = "§Õn khu vùc Tö Quang C¸c",
    --    tbPos = {
    --        {'Khu vùc 1-1 ngo¹i ®­êng', {926, 1580, 3317}},
    --        {'Khu vùc 1-1 néi ®­êng', {926, 1542, 3146}},
    --        {'Khu vùc 1-2 ngo¹i ®­êng', {927, 1580, 3317}},
    --        {'Khu vùc 1-2 néi ®­êng', {927, 1542, 3146}},
    --        {'Khu vùc 1-3 ngo¹i ®­êng', {928, 1580, 3317}},
    --        {'Khu vùc 1-3 néi ®­êng', {928, 1542, 3146}},
    --
    --        {'Khu vùc 2-1 ngo¹i ®­êng', {929, 1580, 3317}},
    --        {'Khu vùc 2-1 néi ®­êng', {929, 1542, 3146}},
    --        {'Khu vùc 2-2 ngo¹i ®­êng', {930, 1580, 3317}},
    --        {'Khu vùc 2-2 néi ®­êng', {930, 1542, 3146}},
    --        {'Khu vùc 2-3 ngo¹i ®­êng', {931, 1580, 3317}},
    --        {'Khu vùc 2-3 néi ®­êng', {931, 1542, 3146}},
    --    }
    --},
    [11] = {
        szName = "§Õn liªn server",
        tbPos = {
            { "Khu vùc 1v1", { 7100, 1410, 2857 } },
            { "Khu vùc 3v3", { 8000, 1410, 2857 } },
        }
    },
};

----------------------------------------------------------------------------------------------------

WGM = {
    szClassName = "WGM",
    fnDebug = nothing,
    
    szAccountKickOutFile = "\\data\\warlord\\kickout_account_list.txt",
    szReloadScriptFile = "\\data\\warlord\\reloadscripts\\reloadscript.txt",
    szScriptFile = m_szThisFile,
    tbReloadCoreScript = { -- §©y lµ b¶ng danh s¸ch c¸c script mµ warlord hook vµo hÖ thèng cña game
        -- ksgvn
        "\\script\\ksgvn\\lib.lua",

        -- warlord
        "\\script\\warlord\\preload.lua",
        "\\script\\warlord\\functions\\function_sync.lua",
        "\\script\\warlord\\functions\\function_gm.lua",
        "\\script\\warlord\\items\\item_gm_card.lua",

        -- game
        "\\script\\global\\playerloginin.lua",
        "\\script\\gmscript.lua",
    },

    nShowProcessTime = 2 * 18,
    nLimitSegmentDataLength = 32 - (11 + 2),
    -- 32 lµ ®é dµi string tèi ®a cña hµm gèc DoScriptByName
    -- 11 lµ tæng ®é dµi cña segment header: XX&YYY&ZZZ&
    -- 2 lµ chiÒu d¹i 2 ký tù cuèi ~~ cña segment
    -- cÊu tróc cña 1 segment: XX&YYY&ZZZ&AAAA~~
    -- XX lµ id package
    -- YYY lµ sè thø tù segment
    -- ZZZ lµ tæng sè segment
    -- AAAA lµ data cña 1 segment

    tbMsgString = {
        [1] = "LÖnh ®· ®­îc göi ®Õn ng­êi ch¬i [%s]!",
        [2] = "Göi sai môc tiªu szRevicerName=[%s] thùc tÕ lµ [%s]!",
        [3] = "Ng­êi ch¬i [%s] kh«ng t×m thÊy hoÆc ®· rêi m¹ng!",
        [4] = "[%s] RetCode=[%d] RetMsg=[%s]!",
    },

    tbAccessGroups = g_tbAccountCfg,
    tbAccessFunctions = {
        superadmin = {
            "superadmin",

            "_wgm_server_OpenMenu",
            "_wgm_server_OpenMenu_Activities",
            "_wgm_server_OpenMenu_KickPlayers",
            "_wgm_server_OpenMenu_MovePlayersOnMap",
            "_wgm_server_KickAccountAllGS",

            "_wgm_DoCommand",
            "_wgm_AddItem",
            "_wgm_ReloadGmItem",
            "_wgm_server_LoadDuaTopBXHData_TopBattleMerit", --top chiÕn tr­êng
            "_wgm_server_LoadDuaTopBXHData_TopLevel", -- top cÊp
            "_wgm_server_ReloadScript",
            "_wgm_server_KickAllPlayerOnGS",
            "_wgm_server_KickAllPlayerOnMap",
            "_wgm_server_CallBoss",
            "_wgm_server_CallBattle",

            "_wgm_OpenMenu_GM",
            "_wgm_OpenMenu_ModLive",
            "_wgm_AdminGoto",
            "_wgm_SetAdminState",

            "_wgm_player_FindPlayerByName",
            "_wgm_player_ShowPlayerProcessMenu",
            "_wgm_player_JumpToPlayer",
            "_wgm_player_MovePlayerToHere",
            "_wgm_player_MovePlayerToRandomCity",
            "_wgm_player_ForceClearBCH",
            "_wgm_player_KickoutGame",
            "_wgm_player_LockAccount",
            "_wgm_player_BanMac",
            "_wgm_player_ResetBattle",
            "_wgm_player_KickoutBattle",
            "_wgm_player_ForbitChat",
            "_wgm_player_ArrestPlayer",
            "_wgm_player_SetFightState",
            "_wgm_player_TempUnlockBox",
            "_wgm_player_ClearBoxPassword",
            "_wgm_player_ClearItemPassword",
            "_wgm_player_AddItem",
            "_wgm_player_SavePlayerData",
            "_wgm_player_ModifyGold",

            "_wgm_player_LoadPlayerTask",
            "_wgm_player_ShowPlayerTaskMenu",
            "_wgm_player_SetTask_OnTarget",
            "_wgm_player_ModifyTask_OnTarget",
            "_wgm_player_SetTaskByte_OnTarget",
            "_wgm_player_SetTaskBit_OnTarget",
            "_wgm_player_ModifyDaiHiepLenh",
            "_wgm_player_SetTKLUsed",
            "_wgm_player_ModifyWorldBoss",
            "_wgm_player_ModifyPopur2",
            "_wgm_player_ModifyMonthlyEvent",
            "_wgm_player_SetTask",
            "_wgm_player_SetTaskByte",
            "_wgm_player_SetTaskBit",
        },
        admin = {
            "admin",

            "_wgm_OpenMenu_GM",
            "_wgm_OpenMenu_ModLive",
            "_wgm_AdminGoto",
            "_wgm_SetAdminState",

            "_wgm_player_FindPlayerByName",
            "_wgm_player_ShowPlayerProcessMenu",
            "_wgm_player_JumpToPlayer",
            "_wgm_player_MovePlayerToHere",
            "_wgm_player_MovePlayerToRandomCity",
            "_wgm_player_ForceClearBCH",
            "_wgm_player_KickoutGame",
            "_wgm_player_LockAccount",
            "_wgm_player_BanMac",
            "_wgm_player_KickoutBattle",
            "_wgm_player_ForbitChat",
            "_wgm_player_ArrestPlayer",
            "_wgm_player_SetFightState",
            --"_wgm_player_TempUnlockBox",
            "_wgm_player_ClearBoxPassword",
            "_wgm_player_ClearItemPassword",
            "_wgm_player_AddItem",
            "_wgm_player_SavePlayerData",

            "_wgm_player_LoadPlayerTask",
            "_wgm_player_ShowPlayerTaskMenu",
            "_wgm_player_SetTask_OnTarget",
            "_wgm_player_ModifyTask_OnTarget",
            "_wgm_player_SetTaskByte_OnTarget",
            "_wgm_player_SetTaskBit_OnTarget",
            "_wgm_player_ModifyDaiHiepLenh",
            "_wgm_player_SetTKLUsed",
            "_wgm_player_ModifyMonthlyEvent",
        },
        supermod = {
            "supermod",

            "_wgm_OpenMenu_GM",
            "_wgm_OpenMenu_ModLive",
            "_wgm_AdminGoto",
            "_wgm_SetAdminState",

            "_wgm_player_FindPlayerByName",
            "_wgm_player_ShowPlayerProcessMenu",
            "_wgm_player_JumpToPlayer",
            --"_wgm_player_MovePlayerToHere",
            "_wgm_player_MovePlayerToRandomCity",
            "_wgm_player_ForceClearBCH",
            "_wgm_player_KickoutGame",
            "_wgm_player_LockAccount",
            --"_wgm_player_BanMac",
            "_wgm_player_KickoutBattle",
            "_wgm_player_ForbitChat",
            "_wgm_player_ArrestPlayer",
            --"_wgm_player_SetFightState",
            --"_wgm_player_TempUnlockBox",
            --"_wgm_player_ClearBoxPassword",
            --"_wgm_player_ClearItemPassword",
            --"_wgm_player_AddItem",
        },
        modlive = {
            "modlive",

            "_wgm_OpenMenu_ModLive",
            "_wgm_AdminGoto",
            "_wgm_SetAdminState",
        },
    },
};

----------------------------------------------------------------------------------------------------
--- C¸c hµm base th­ viÖn GM
----------------------------------------------------------------------------------------------------

---Hµm t¹o ra gãi tin d¹ng string
---@param szTargetName string Tªn nh©n vËt cÇn göi ®Õn
---@param bIsShowProcessBar number BËt/t¾t hiÓn thÞ thanh ch¹y
---@param szScriptFile string Script file path
---@param szFunctionName string Tªn hµm cÇn thùc thi
---@param tbArgs table B¶ng biÕn cÇn truyÒn vµo
---@return string Chuçi m· ho¸ sÏ göi ®i
function _wgm_MakeData(szTargetName, bIsShowProcessBar, szScriptFile, szFunctionName, tbArgs)
    local tbHeader = {
        [1] = WPlayer:GetName(), -- szSenderName
        [2] = szTargetName, -- szRevicerName
        [3] = tostring(bIsShowProcessBar),
        [4] = szScriptFile,
        [5] = szFunctionName,
    };
    local szType = type(tbArgs);
    local szHeader = WLib:Join(tbHeader, "@@");
    if szType == "nil" then
        szHeader = szHeader .. "@@nil";
    elseif szType == "table" then
        szHeader = szHeader .. "@@" .. WLib:Join(tbArgs, "##");
    else
        szHeader = szHeader .. "@@" .. tostring(tbArgs);
    end
    return szHeader;
end

---Hµm bãc t¸ch gãi tin vÒ tr¹ng th¸i ban ®Çu vµ theo ®óng thø tù ®Çu vµo cña hµm _wgm_MakeData
---@param tbData table D÷ liÖu nhËn ®­îc
---@return table Thø tù theo ®Çu vµo cña hµm _wgm_MakeData
function _wgm_ParseData(tbData)
    local szData = WLib:Join(tbData, "");
    szData = WLib:Replace(szData, "@@", "@");
    szData = WLib:Replace(szData, "##", "#");

    local tbParseData = WLib:Split(szData, "@");
    local tbArgs = WEnv.NULL;
    if tbParseData[6] ~= WEnv.NULL then
        tbArgs = WLib:Split(tbParseData[6], "#");
    end
    return tbParseData[1], tbParseData[2], tonumber(tbParseData[3] or 0), tbParseData[4], tbParseData[5], tbArgs;
end

---Hµm göi gãi tin, hµm nµy sÏ thùc hiÖn chia nhá c©u lÖnh ®Ó göi d­íi d¹ng segment
---c¸c segment sÏ ®­îc nèi l¹i t¹i hµm _wgm_RevicePackage khi nhËn ®­îc gãi tin cuèi cïng
---@param szTargetName string Tªn nh©n vËt nhËn
---@param szScriptFile string Script file path
---@param szFunctionName string Tªn hµm sÏ thùc thi trªn nh©n v©n vËt nhËn tin
---@param tbArgs table Danh s¸ch biÕn input cña hµm szFunctionName
---@param bIsShowProcessBar number BËt/T¾t hiÓn thÞ thanh ch¹y
function _wgm_SendPackage(szTargetName, szScriptFile, szFunctionName, tbArgs, bIsShowProcessBar)
    local self = WGM;

    szScriptFile = szScriptFile or self.szScriptFile;
    bIsShowProcessBar = bIsShowProcessBar or WEnv.FALSE;

    if szTargetName == WEnv.NULL then
        print("[ERROR][_wgm_SendPackage]: _wgm_SendPackage param szTargetName missing!");
        return WEnv.RETCODE_ERROR;
    end
    if szFunctionName == WEnv.NULL then
        print("[ERROR][_wgm_SendPackage]: _wgm_SendPackage param szFunctionName missing!");
        return WEnv.RETCODE_ERROR;
    end
    if type(szFunctionName) ~= "string" then
        print("[ERROR][_wgm_SendPackage]: _wgm_SendPackage param szFunctionName accept function name as string!");
        return WEnv.RETCODE_ERROR;
    end

    local szSenderName = WPlayer:GetName();
    if _wgm_DoFuncOnTargetPlayer(szTargetName, _wgm_RevicePackage_cb, szSenderName, szTargetName, bIsShowProcessBar, szScriptFile, szFunctionName, tbArgs) ~= WEnv.RETCODE_ERROR then
        --print("[SUCCESS][_wgm_SendPackage]: nTargetPlayerIdx is found, call function direct!");
        return 0;
    end

    local nPackageId = random(1, 99);
    local szData = _wgm_MakeData(szTargetName, bIsShowProcessBar, szScriptFile, szFunctionName, tbArgs);
    local nDataLength = strlen(szData);
    local nTotalSegment = ceil(nDataLength / self.nLimitSegmentDataLength);

    local nSegmentOffset = 0;
    local szSegmentData = "";
    --print(format("==========\n[SUCCESS][_wgm_SendPackage][%s] send to szTargetName(%s) szData(%s)", szSenderName, szTargetName, szData));
    for i = 1, nTotalSegment do
        szSegmentData = nPackageId .. "&" .. i .. "&" .. nTotalSegment .. "&" .. strsub(szData, nSegmentOffset + 1, i * self.nLimitSegmentDataLength) .. "~~";
        nSegmentOffset = i * self.nLimitSegmentDataLength;
        --print(format("[SUCCESS][_wgm_SendPackage][%s] send to szTargetName(%s) szSegmentData(%s)", szSenderName, szTargetName, szSegmentData));
        DoScriptByName(szTargetName, m_szThisFile, "_wgm_RevicePackage", szSegmentData);
    end

    if bIsShowProcessBar == WEnv.TRUE and szFunctionName ~= "_wgm_SendPackage_cb" then
        ProgressSlot(self.nShowProcessTime, format("#_wgm_StopProgressBar(%q)", szTargetName));
    end
end

---Hµm nhËn gãi tin, hµm nµy sÏ thùc hiÖn l­u tr÷ c¸c segment göi ®Õn
---nÕu nhËn ®­îc gãi tin cuèi sÏ thùc hiÖn nèi c¸c gãi tin l¹i vµ ch¹y ®Õn hµm _wgm_RevicePackage_cb
---@param szData string D÷ liÖu chia nhá cña hµm göi tin _wgm_SendPackage
function _wgm_RevicePackage(szData)
    if szData == WEnv.NULL or type(szData) ~= "string" then
        return WEnv.RETCODE_ERROR;
    end

    local self = WGM;

    local tbSegmentData = WLib:Split(szData, "&");
    local nPackageId = tonumber(tbSegmentData[1]) or 0;
    local nCurrentSegment = tonumber(tbSegmentData[2]) or 0;
    local nTotalSegment = tonumber(tbSegmentData[3]) or 0;
    local szSegmentData = WLib:Replace(tbSegmentData[4], "~", "");
    if nCurrentSegment == 1 then
        -- reset
        WPlayer:SetUserData("_wgm_RevicePackage_" .. nPackageId, {
            nPackageId = nPackageId,
            nTotalSegment = nTotalSegment,
            tbData = {},
        });
    end
    local tbSegmentDataSave = WPlayer:GetUserData("_wgm_RevicePackage_" .. nPackageId);
    tinsert(tbSegmentDataSave.tbData, szSegmentData);

    if nCurrentSegment ~= 0 and nCurrentSegment == tbSegmentDataSave.nTotalSegment then
        -- revice finish
        local szSenderName, szRevicerName, bIsShowProcessBar, szScriptFile, szFunctionName, tbArgs = _wgm_ParseData(tbSegmentDataSave.tbData);
        _wgm_RevicePackage_cb(szSenderName, szRevicerName, bIsShowProcessBar, szScriptFile, szFunctionName, tbArgs);
    end
end

---Hµm nµy sÏ gäi thùc thi trªn szTargetName khi nhËn ®ñ gãi tin thµnh c«ng
---®ång thêi kiÓm tra ®óng ng­êi nhËn szRevicerName th× míi cho thùc thi lªnh
---@param szSenderName string Tªn nh©n vËt göi ®i
---@param szRevicerName string Tªn nh©n vËt nhËn
---@param bIsShowProcessBar number BËt/T¾t hiÓn thÞ thanh ch¹y
---@param szScriptFile string Script file path
---@param szFunctionName string Tªn hµm sÏ thùc thi trªn nh©n vËt nhËn
---@param tbArgs table Danh s¸ch biÕn input cña hµm szFunctionName
function _wgm_RevicePackage_cb(szSenderName, szRevicerName, bIsShowProcessBar, szScriptFile, szFunctionName, tbArgs)
    local self = WGM;

    local szCurrentRevicerName = WPlayer:GetName();
    if szRevicerName == szCurrentRevicerName then
        if bIsShowProcessBar == WEnv.TRUE then
            if szFunctionName ~= "_wgm_SendPackage_cb" then
                --print(format("[SUCCESS][_wgm_RevicePackage][%s] revice data from szSenderName(%s) => szCurrentRevicerName(%s) => szFunctionName(%s)", szRevicerName, szSenderName, szCurrentRevicerName, szFunctionName));
                local szMsgFeedBack = format(self.tbMsgString[1], szCurrentRevicerName);
                _wgm_SendPackage(szSenderName, self.szScriptFile, "_wgm_SendPackage_cb", { szSenderName, szRevicerName, szMsgFeedBack }, bIsShowProcessBar);
            else
                ProgressSlotCancle();
            end
        end
        local nTotalArgs = getn(tbArgs or {});
        local szArg = "\"" .. szSenderName .. "\"";
        local szSplitor = ",";
        for i = 1, nTotalArgs do
            local szParamType = type(tbArgs[i]);
            if szParamType == "nil" then
                szArg = szArg .. szSplitor .. "nil";
            elseif szParamType ~= "userdata" and szParamType ~= "table" and type(tonumber(tbArgs[i])) == "nil" then
                szArg = szArg .. szSplitor .. "\"" .. tbArgs[i] .. "\"";
            else
                szArg = szArg .. szSplitor .. tbArgs[i];
            end
        end
        local nRetCode, nRetData = 0, 0; --dostring(szFunctionName .. "(" .. szArg .. ")");
        --SetPlayerScript(format([[%s]], szScriptFile));
        nRetCode = SendScript2VM(format([[%s]], szScriptFile), szFunctionName .. "(" .. szArg .. ")");

        if nRetCode ~= WEnv.NULL and szFunctionName ~= "_wgm_SendPackage_cb" then
            --- TODO: Chç nµy cÇn ghi log gäi hµm
            --_wgm_SendPackage(szSenderName, self.szScriptFile, "_wgm_SendPackage_cb", {nRetCode, nRetData});
            --print(format("[SUCCESS][_wgm_RevicePackage][%s] do function complete %s(%s) !", szRevicerName, szFunctionName, szArg), nRetCode, nRetData);
        end
        return nRetCode, nRetData;
    end
    return WEnv.RETCODE_ERROR;
end

---Hµm nµy t¹o ra ®Ó stop ProcessBar vµ th«ng b¸o kh«ng t×m thÊy player
---nÕu gãi tin göi ®i ng­êi göi cã bËt ProcessBar th× sÏ ®­îc cancel ProcessBar => t×m thÊy player
---@param szRevicerName string Tªn nh©n vËt nhËn
function _wgm_StopProgressBar(szRevicerName)
    local self = WGM;
    ProgressSlotCancle();
    WPlayer:Msg(format(self.tbMsgString[3], szRevicerName or ""));
end

---Hµm nµy lµ hµm göi tr¶ cña szTargetName vµ thùc thi trªn szSenderName
---param szSenderName chÝnh lµ szTargetName, t¹m thêi ch­a biÕt lµm g× víi nã
---@param szSenderName string Nh©n vËt göi ®i
---@param szOriginalSenderName string Nh©n vËt göi gèc (do truyÒn qua nhiÒu l­ît nªn cÇn l­u l¹i ng­êi ®Çu tiªn göi lÖnh ®Ó tiÖn kiÓm tra)
---@param szOriginalTargetName string Nh©n vËt nhËn gèc (do truyÒn qua nhiÒu l­ît nªn cÇn l­u l¹i ng­êi ®Çu tiªn göi lÖnh ®Ó tiÖn kiÓm tra)
---@param ... table Tham sè tuú biÕn, input cña hµm thùc thi bªn trong
function _wgm_SendPackage_cb(szSenderName, szOriginalSenderName, szOriginalTargetName, ...)
    --print(format("[SUCCESS][_wgm_SendPackage_cb][%s] get cb from szSenderName(%s)", WPlayer:GetName(), szSenderName), szOriginalSenderName, szOriginalTargetName);
    do
        return WEnv.RETCODE_SUCCESS;
    end

    local tbArgs = arg;
    local nTotalArgs = getn(tbArgs);
    if nTotalArgs == 1 then
        if type(tbArgs[1]) == "string" and tbArgs[1] ~= "" then
            WPlayer:Msg(tbArgs[1]);
        end
    elseif nTotalArgs > 1 then
        local szFunctionName = tbArgs[1];
        local szArg = "";
        local szSplitor = "";
        for i = 2, nTotalArgs do
            if i > 2 then
                szSplitor = ",";
            end
            local szParamType = type(tbArgs[i]);
            if szParamType == "nil" then
                szArg = szArg .. szSplitor .. "nil";
            elseif szParamType ~= "userdata" and szParamType ~= "table" and type(tonumber(tbArgs[i])) == "nil" then
                szArg = szArg .. szSplitor .. "\"" .. tbArgs[i] .. "\"";
            else
                szArg = szArg .. szSplitor .. tbArgs[i];
            end
        end
        local nRetCode, nRetData = dostring(szFunctionName .. "(" .. szArg .. ")");
        return nRetCode, nRetData;
    end
    return WEnv.RETCODE_SUCCESS;
end

---Hµm nµy cho phÐp thùc thi 1 lÖnh b»ng c¸ch ®Çu vµo lµ tªn nh©n vËt, hµm, vµ param
---@param szFindPlayerName string Tªn nh©n vËt cÇn t×m
---@param fnFunc function Hµm cÇn thùc thi trªn nh©n vËt
---@param ... table Tham sè tuú biÕn, input cña fnFunc
---@return number Gi¸ trÞ tr¶ vÒ WEnv.RETCODE_ERROR lµ kh«ng t×m thÊy nh©n vËt
function _wgm_DoFuncOnTargetPlayer(szFindPlayerName, fnFunc, ...)
    local nRetCode = WEnv.RETCODE_ERROR;
    if szFindPlayerName == WEnv.NULL or szFindPlayerName == "" then
        return nRetCode;
    end

    local nOldPlayerIdx = PlayerIndex;
    PlayerIndex = _wgm_FindPlayerIdx(szFindPlayerName);
    --- START TODO
    if PlayerIndex > 0 then
        nRetCode = fnFunc(WLib:UnPack(arg));
    end
    --- END TODO
    PlayerIndex = nOldPlayerIdx;

    return nRetCode;
end

---Hµm nµy cho phÐp t×m player b»ng tªn nh©n vËt (loop qua c¸c player cïng GS)
---@param szFindPlayerName string Tªn nh©n vËt cÇn t×m
---@return number PlayerIndex > 0 cña nh©n vËt nÕu t×m ®­îc
function _wgm_FindPlayerIdx(szFindPlayerName)
    if szFindPlayerName == 0 then
        return WEnv.RETCODE_ERROR;
    end

    --- START LOOP PlayerIndex
    local nOldPlayerIdx = PlayerIndex;
    local nFoundPlayerIdx = FirstPlayer();
    while nFoundPlayerIdx > 0 do
        PlayerIndex = nFoundPlayerIdx;
        --- START TODO
        if szFindPlayerName == WPlayer:GetName() then
            break ;
        end
        --- END TODO
        PlayerIndex = nOldPlayerIdx;
        nFoundPlayerIdx = NextPlayer(nFoundPlayerIdx);
    end
    PlayerIndex = nOldPlayerIdx;
    --- END LOOP PlayerIndex

    return nFoundPlayerIdx;
end

---Hµm nµy kiÓm tra quyÒn sö dông theo tªn tµi kho¶n hµm ®­îc khai b¸o ë trªn
---@param szFunctionName string Tªn hµm cÇn kiÓm tra quyÒn thùc thi
---@param szAccount string Tªn tµi kho¶n cÇn kiÓm tra cã quyÒn thùc thi hµm kh«ng
---@return number Tr¶ vÒ 2 tham sè, return1: WEnv.TRUE lµ cã quyÒn, return2: group cña user
function _wgm_IsHaveAccessFunction(szFunctionName, szAccount)
    szFunctionName = szFunctionName or "";
    szAccount = szAccount or WPlayer:GetAccount();

    local bRetCode = WEnv.FALSE;
    if szFunctionName == "" then
        return bRetCode;
    end

    local szGroupAccess = "";
    for szGroupName, tbGroupAccounts in pairs(WGM.tbAccessGroups) do
        if szGroupName ~= "n" and tbGroupAccounts ~= WEnv.NULL then
            for i = 1, getn(tbGroupAccounts) do
                if tbGroupAccounts[i] == szAccount then
                    szGroupAccess = szGroupName;
                    local tbGroupFunctions = WGM.tbAccessFunctions[szGroupName];
                    if tbGroupFunctions ~= WEnv.NULL then
                        for ia = 1, getn(tbGroupFunctions) do
                            if tbGroupFunctions[ia] == szFunctionName then
                                bRetCode = WEnv.TRUE;
                                break ;
                            end
                        end
                    end
                end
            end
        end
    end

    return bRetCode, szGroupAccess;
end

---Hµm nµy sÏ insert vµo menu Say dùa vµo quyÒn cña player
---@param tbSay table D÷ liÖu Say cÇn insert vµo
---@param szFunctionName string Tªn hµm sÏ add vµo
---@param ... table Tham sè tuú biÕn, nÕu size > 2 th× gi¸ trÞ thø nhÊt lµ vÞ trÝ insert vµo b¶ng
---@return table D÷ liÖu say hoµn chØnh cã läc quyÒn truy cËp cña user
function _wgm_InsertSay(tbSay, szFunctionName, ...)
    if _wgm_IsHaveAccessFunction(szFunctionName) == WEnv.FALSE then
        return tbSay;
    end

    local nTotalItem = getn(arg);
    if nTotalItem == 1 then
        return tinsert(tbSay, arg[1]);
    elseif nTotalItem > 1 then
        return tinsert(tbSay, arg[1], arg[2]);
    end
end

----------------------------------------------------------------------------------------------------
--- C¸c hµm entrypoint cña thÎ gm
----------------------------------------------------------------------------------------------------

---Hµm add thÎ gm khi login, cã check quyÒn tr­íc khi add
function _wgm_AddGmItem()
    local tbGMItem = { tbProp = { 2, 1, 40039 }, nStack = 1, nStatus = ITEMSTATUS_LOCK };
    if WPlayer:IsSuperAdmin() == WEnv.TRUE
            or WPlayer:IsAdmin() == WEnv.TRUE
            or WPlayer:IsSuperMod() == WEnv.TRUE
            or WPlayer:IsModLive() == WEnv.TRUE
    then
        if WItem:CountAll(tbGMItem.tbProp) <= 0 and WLib:CheckInv(1, 0) == WEnv.TRUE then
            WAward:Give(tbGMItem, "GM on login");
        end
    else
        WItem:DeleteAll(tbGMItem.tbProp);
    end
end

---Hµm t¹o ra say title cho tõng chøc vô
function _wgm_GetGmSayHeader()
    local nMapId, nPosX, nPosY = WPlayer:GetWorldPos();
    local tbGSPlayers = WLib:GetGSPlayers();
    local tbMapPlayers = {};
    local nTotalGSPlayer = getn(tbGSPlayers);
    for i = 1, nTotalGSPlayer do
        if tbGSPlayers[i][3] == nMapId then
            tinsert(tbMapPlayers, tbGSPlayers[i]);
        end
    end
    local nTotalMapPlayer = getn(tbMapPlayers);
    local nVersion, bGlbRealm = GetRealmType();

    local szServerInfo = format("\nTotal players on Map_%d: <color=green>%d<color> / on GS_%d: <color=green>%d<color> - nGSVer: <color=green>%d<color> / nCurGS: <color=green>%d<color>", nMapId, nTotalMapPlayer, WLib:GetGSIndex(), nTotalGSPlayer, nVersion, bGlbRealm);
    local szSayHeader = format("Hello Master, have a nice day! \n" ..
            "GM Version: <color=green>%d<color> - Server time: <color=green>%s<color> - Total day open: <color=green>%d<color> \n" ..
            "Position: <color=green>%s(%d/%d)<color> - <color=green>%d %d %d<color>",

            g_nGMVersion, date("%Y-%m-%d %H:%M:%S"), WDate:CurrentRunningDay(),
            GetMapName(nMapId), floor(nPosX / 8), floor(nPosY / 16), nMapId, nPosX, nPosY
    );
    if WPlayer:IsSuperAdmin() == WEnv.TRUE or WPlayer:IsAdmin() == WEnv.TRUE then
        szSayHeader = szSayHeader .. szServerInfo;
    end

    return szSayHeader;
end

---Hµm reload thÎ gm, chØ cã t¸c dông ë gs hiÖn t¹i
function _wgm_ReloadGmItem()
    --dofile("script/warlord/item/gm0_item.lua");
    LoadScript(WGM.szScriptFile); -- c¸ch nµy bÞ chËm 1 l­ît
    LoadScript("\\script\\warlord\\items\\item_gm_card.lua"); -- c¸ch nµy bÞ chËm 1 l­ît
    WPlayer:Msg(date("%Y-%m-%d %H:%M:%S") .. ": GM ®· ®­îc reload!");
end

---Hµm entrypoint cña item gm
---@param nItemIdx number ID cña thÎ gm
function _wgm_OpenMenu(nItemIdx)
    local self = WGM;

    if IsBoxLocking() == 1 then
        WNpc:Talk("§Ó ®¶m b¶o tµi s¶n cña c¸c h¹, h·y më khãa kho tr­íc ®i.", WEnv.TRUE);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if _wgm_IsHaveAccessFunction("_wgm_OpenMenu_GM") == WEnv.TRUE then
        return _wgm_OpenMenu_GM();
    elseif _wgm_IsHaveAccessFunction("_wgm_OpenMenu_ModLive") == WEnv.TRUE then
        return _wgm_OpenMenu_ModLive();
    elseif nItemIdx ~= WEnv.NULL then
        WItem:DelByIndex(nItemIdx);
        WNpc:Talk("B¹n kh«ng cã quyÒn sö dông vËt phÈm bÞ thu håi!", WEnv.TRUE);
    end
end

---Hµm menu riªng cho GM
function _wgm_OpenMenu_GM()
    local self = WGM;

    if WPlayer:IsSuperAdmin() == WEnv.TRUE then
        --dofile("script/warlord/defines/define_static.lua");
        --dofile("script/gmscript.lua");
        dofile("script/warlord/functions/function_gm_server.lua");
        dofile("script/warlord/functions/function_gm.lua");
        WPlayer:Msg(date("%Y-%m-%d %H:%M:%S") .. ": function_gm update!");
        --dofile("script/warlord/items/item_gm_card.lua");
        --Msg2Player("ok23455"); -- doan nay giup fix the gm bi loi~
        --_wgm_server_ReloadScript();
        --do return 0; end
    end

    local tbSay = { _wgm_GetGmSayHeader() };

    local tbLastPlayerInfo = WPlayer:GetUserData("_wgm_player_ShowPlayerProcessMenu");
    if tbLastPlayerInfo and tbLastPlayerInfo[3] ~= WEnv.NULL then
        _wgm_InsertSay(tbSay, "_wgm_player_ShowPlayerProcessMenu", format("Xö lý nh©n vËt [%s]/#_wgm_player_FindPlayerByName(%q)", tbLastPlayerInfo[3], tbLastPlayerInfo[3]));
    end
    _wgm_InsertSay(tbSay, "_wgm_player_FindPlayerByName", "T×m nh©n vËt theo tªn/_wgm_player_FindPlayerByName");

    tinsert(tbSay, g_szSpaceLine);
    _wgm_InsertSay(tbSay, "_wgm_AdminGoto", "Di chuyÓn ®Õn.../_wgm_AdminGoto");
    if WTask:GetBit(WTASKID_GMSTATE_BIT, WTASKID_GMSTATE_BIT_GMBUFF) == 0 then
        _wgm_InsertSay(tbSay, "_wgm_SetAdminState", "NhËn buff admin (tµng h×nh, bÊt tö, tèc ch¹y)/#_wgm_SetAdminState(1)");
    else
        _wgm_InsertSay(tbSay, "_wgm_SetAdminState", "T¾t buff admin/#_wgm_SetAdminState(0)");
    end

    tinsert(tbSay, g_szSpaceLine);
    _wgm_InsertSay(tbSay, "_wgm_server_OpenMenu", "Qu¶n lý server/_wgm_server_OpenMenu");
    _wgm_InsertSay(tbSay, "_wgm_DoCommand", "Open Console/_wgm_DoCommand");
    _wgm_InsertSay(tbSay, "_wgm_AddItem", "Thªm vËt phÈm/_wgm_AddItem");
    _wgm_InsertSay(tbSay, "_wgm_ReloadGmItem", "Reload GM item/_wgm_ReloadGmItem");

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[!] Thanh lý vËt phÈm/_wgm_ClearBag");
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_SUCCESS;
end

---Hµm menu dµnh riªng cho ModLive
function _wgm_OpenMenu_ModLive()
    local self = WGM;

    local nMapId, nPosX, nPosY = WPlayer:GetWorldPos();

    local tbSay = { format("Hello Moderator, have a nice day! \n" ..
            "GM Version: <color=green>%d<color> - Server time: <color=green>%s<color> - Total day open: <color=green>%d<color> \n" ..
            "Position: <color=green>%s(%d/%d)<color> - <color=green>%d %d %d<color>",

            g_nGMVersion, date("%Y-%m-%d %H:%M:%S"), WDate:CurrentRunningDay(),
            GetMapName(nMapId), floor(nPosX / 8), floor(nPosY / 16), nMapId, nPosX, nPosY
    ) };

    _wgm_InsertSay(tbSay, "_wgm_AdminGoto", "Di chuyÓn ®Õn.../_wgm_AdminGoto");
    if WTask:GetBit(WTASKID_GMSTATE_BIT, WTASKID_GMSTATE_BIT_GMBUFF) == 0 then
        _wgm_InsertSay(tbSay, "_wgm_SetAdminState", "NhËn buff admin (tµng h×nh, bÊt tö, tèc ch¹y)/#_wgm_SetAdminState(1)");
    else
        _wgm_InsertSay(tbSay, "_wgm_SetAdminState", "T¾t buff admin/#_wgm_SetAdminState(0)");
    end

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[!] Thanh lý vËt phÈm/_wgm_ClearBag");
    tinsert(tbSay, "[x] §ãng/nothing");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_SUCCESS;
end

----------------------------------------------------------------------------------------------------
--- C¸c hµm c¬ b¶n th«ng dông
----------------------------------------------------------------------------------------------------

---Hµm di chuyÓn cña gm
---@param nSelect1 number Index cña tb say cÊp 1
---@param nSelect2 number Index cña tb say cÊp 2
function _wgm_AdminGoto(nSelect1, nSelect2)
    if nSelect1 == WEnv.NULL then
        local tbSay = { "Mêi chän n¬i ®Õn:" };
        for i = 1, getn(m_tbAdminGotoMap) do
            if m_tbAdminGotoMap[i] ~= WEnv.NULL then
                if getn(m_tbAdminGotoMap[i].tbPos) == 1 then
                    tinsert(tbSay, format("%s/#_wgm_AdminGoto(%d, %d)", m_tbAdminGotoMap[i].tbPos[1][1], i, 1));
                else
                    tinsert(tbSay, format("%s/#_wgm_AdminGoto(%d)", m_tbAdminGotoMap[i].szName, i));
                end
            end
        end

        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "[x] T¹m thêi ch­a muèn ®i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if nSelect2 == WEnv.NULL then
        local tbSay = { "Mêi chän n¬i ®Õn:" };
        for i = 1, getn(m_tbAdminGotoMap[nSelect1].tbPos) do
            tinsert(tbSay, format("%s/#_wgm_AdminGoto(%d, %d)", m_tbAdminGotoMap[nSelect1].tbPos[i][1], nSelect1, i));
        end

        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "<<  Trë l¹i trang tr­íc/_wgm_AdminGoto");
        tinsert(tbSay, "[x] T¹m thêi ch­a muèn ®i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    local nMapId, nPosX, nPosY = WPlayer:GetWorldPos();
    local nNewMapId, nNewPosX, nNewPosY = m_tbAdminGotoMap[nSelect1].tbPos[nSelect2][2][1], m_tbAdminGotoMap[nSelect1].tbPos[nSelect2][2][2], m_tbAdminGotoMap[nSelect1].tbPos[nSelect2][2][3];
    if nMapId == nNewMapId then
        SetPos(nNewPosX, nNewPosY);
    else
        _wgm_SafeNewWorld(nNewMapId, nNewPosX, nNewPosY, 1);
    end
end

---Hµm thay thÕ cho NewWorld, cã check liªn server tr¸nh kÑt acc
---@param nMapId number MapId, xem trong maps/map_list.ini
---@param nPosX number To¹ ®é b¶n ®å X*8
---@param nPosY number To¹ ®é b¶n ®å Y*16
---@param nRule number QuyÒn chuyÓn map
function _wgm_SafeNewWorld(nMapId, nPosX, nPosY, nRule)
    local tbRealmMap = {
        [6028] = "Vâ Tr­êng Liªn Server",
        [6029] = "ChiÕn tr­êng Th«n trang-Nh¹n M«n Quan",
        [6030] = "ChiÕn tr­êng Th¶o cèc-Nh¹n M«n Quan",
        [6031] = "ChiÕn tr­êng ph¸o ®µi-Nh¹n M«n Quan",
        [6032] = "ChiÕn tr­êng chÝnh-Nh¹n M«n Quan",
        [6066] = "BÝch Hoang Thµnh",
        [6067] = "Hoa S¬n §iÖn",
        [6068] = "Hoµng Cung Gi¸o Tr­êng",
        [6069] = "Uy Vò §¹i L«i",
        [6070] = "H¹ L­u Thanh TuyÒn",
        [6071] = "Tö CÊm §iÖn",
        [6072] = "Th«ng Thiªn T¸c §¹o",
        [6076] = "¢n O¸n §µi",
        [7100] = "Khu vùc tû thÝ liªn server", --1v1
        [8000] = "§Êu Tr­êng ChuÈn BÞ",
        [8001] = "§Êu Tr­êng Phèi Hîp",
        [8002] = "M« h×nh tån t¹i 2v2",
        [8003] = "M« h×nh tån t¹i 3v3",
        [8004] = "M« h×nh tån t¹i 5v5",
        [8005] = "M« h×nh tæ ®éi 1v1",
        [8006] = "M« h×nh tæ ®éi 2v2",
        [8007] = "M« h×nh tæ ®éi 3v3",
        [8008] = "M« h×nh tæ ®éi 5v5",
        [8009] = "Khu vùc chuÈn bÞ liªn server",
        [8899] = "Khu liªn server",
        [8907] = "T©y Thôc §¹o",
        [8908] = "ChuÈn BÞ ChiÕn Tr­êng T©y Thôc §¹o 1",
        [8909] = "ChuÈn BÞ ChiÕn Tr­êng T©y Thôc §¹o 2",
        [8910] = "ChuÈn BÞ ChiÕn Tr­êng T©y Thôc §¹o 3",
        [8916] = "Nh¹n M«n Quan-§Þa ®iÓm bÞ chiÕn",
        [8921] = "§¹i Th¶o Nguyªn 1 (pvp)",
        [8922] = "Bé l¹c V­¬ng Kú (pvp)",
        [8923] = "§¹i Th¶o Nguyªn 2 (pve)",
    };
    local nVersion, bGlbRealm = GetRealmType();
    if bGlbRealm ~= 0 or tbRealmMap[nMapId] ~= WEnv.NULL then
        return ChangeGroupWorld(nMapId, nPosX, nPosY);
    else
        return NewWorld(nMapId, nPosX, nPosY, nRule);
    end
end

---Hµm set buff cho admin/mod
---@param bEnable number BËt/t¾t buff admin
---@param bShowMsg number HiÓn thÞ th«ng b¸o hay kh«ng, c¸i nµy ho¹t ®éng trong sync 
function _wgm_SetAdminState(bEnable, bShowMsg)
    bEnable = bEnable or 1;
    bShowMsg = bShowMsg or 1;

    local self = WGM;

    local nStateIdOffset = 5000;
    local nMaxStateBuff = 20;
    local tbBuffAdmin = {
        { "ADMIN",
          {
              { "state_interval_ignore", 100, -1, 1 },
              { '"state_cost_free', 100, -1, 1 },
              { "state_damage_point", 1000000, -1, 1 },
              --{"state_add_allability", 9999, -1, 1},
              { "state_max_carry_point_add", 10000, -1, 1 },
              { "state_life_max_point_add", 100000, -1, 1 },
              { "state_neili_max_point_add", 20000, -1, 1 },
              { "state_life_percent_per10s_anytime", 10, -1, 1 },
              { "state_neili_percent_per10s_anytime", 10, -1, 1 },
              { "state_move_speed_percent_add", 120, -1, 1 },
              { "state_illusion_latent", 1, -1, 0 },
              { '"state_dispear', 1, -1, 0 },
          },
        },
        { '"MOD',
          {
              { "state_move_speed_percent_add", 120, -1, 1 },
              { "state_illusion_latent", 1, -1, 0 },
              { "state_dispear", 1, -1, 0 },
          },
        },
    };

    local bIsHaveAccess, szGroupAccess = _wgm_IsHaveAccessFunction("_wgm_SetAdminState");
    if bIsHaveAccess ~= WEnv.TRUE then
        return WEnv.RETCODE_NOTOPEN;
    end

    local nSelectIdx = 0;
    if szGroupAccess == "superadmin" then
        nSelectIdx = 1;
    else
        nSelectIdx = 2;
    end

    local tbBuffInfo = tbBuffAdmin[nSelectIdx];
    if tbBuffInfo == WEnv.NULL then
        return WEnv.RETCODE_NOTOPEN;
    end

    if bEnable == 1 then
        WTask:SetBit(WTASKID_GMSTATE_BIT, WTASKID_GMSTATE_BIT_GMBUFF, 1);
        local tbBuffState = tbBuffInfo[2];
        for i = 1, nMaxStateBuff do
            if tbBuffState[i] ~= WEnv.NULL then
                CastState(tbBuffState[i][1], tbBuffState[i][2], tbBuffState[i][3], tbBuffState[i][4], nStateIdOffset + i);
            end
        end
        if bShowMsg == 1 then
            WPlayer:Msg("§· nhËn hiÖu qu¶ " .. tbBuffInfo[1]);
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        end
    else
        WTask:SetBit(WTASKID_GMSTATE_BIT, WTASKID_GMSTATE_BIT_GMBUFF, 0);
        for i = 1, nMaxStateBuff do
            RemoveState(nStateIdOffset + i);
        end
        if bShowMsg == 1 then
            WPlayer:Msg("§· hñy hiÖu qu¶ " .. tbBuffInfo[1]);
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        end
    end
end

---Hµm dän r­¬ng, hµm sÏ kh«ng xo¸ vËt phÈm ®ang bÞ kho¸ b¶o hiÓm
---@param nClearType number C¸ch xo¸ r­¬ng
---@param bConfirm number X¸c nhËn xo¸ r­¬ng
function _wgm_ClearBag(nClearType, bConfirm)
    local tbClearBagTypes = {
        [1] = "Dän hµnh trang chÝnh",
        [2] = "Dän hµnh trang më réng",
        [3] = "Dän r­¬ng bµy b¸n",
        [4] = "Dän r­¬ng thñ khè",
        [5] = "Dän trong hµnh trang vµ më réng",
        [6] = "Dän tÊt c¶ (hµnh trang chÝnh-phô-thñ khè-bµy b¸n)",
    };

    if nClearType == WEnv.NULL then
        local tbSay = { "Chän c¸ch xãa c¸c vËt phÈm ®ang cã trong r­¬ng, c¸c vËt phÈm khãa b¶o vÖ sÏ kh«ng thÓ tù xãa, thao t¸c kh«ng thÓ hoµn l¹i, cÇn c©n nh¾c tr­íc khi sö dông:" };

        for i = 1, getn(tbClearBagTypes) do
            tinsert(tbSay, format("%s/#_wgm_ClearBag(%d)", tbClearBagTypes[i], i));
        end

        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "[x] T¹m thêi ch­a cÇn ®Õn/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if tbClearBagTypes[nClearType] == WEnv.NULL then
        return WEnv.RETCODE_ERROR;
    end

    if bConfirm == WEnv.NULL then
        WNpc:SayConfirm(format("B¹n x¸c nhËn muèn <color=green>%s<color>?\n<color=red>Chó ý: thao t¸c kh«ng thÓ hoµn l¹i.<color>", tbClearBagTypes[nClearType]),
                format("_wgm_ClearBag(%d, 1)", nClearType)
        );
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    local tbMainBag = {};
    local tbExtBag = {};
    local tbStallBag = {};
    local tbBox = {};

    local tbAllItem = GetAllItem();
    for i = 1, getn(tbAllItem) do
        local nItemIdx = tbAllItem[i];
        local x, y, z = GetItemPlace(nItemIdx);
        if x == ITEMPOS_EQUIPROOM and z >= 0 and z <= 5 then
            tinsert(tbMainBag, nItemIdx);
        end
        if x == ITEMPOS_EQUIPROOM and z >= 6 and z <= 11 then
            tinsert(tbExtBag, nItemIdx);
        end
        if x == ITEMPOS_STALLSELF and z >= 0 and z <= 6 then
            tinsert(tbStallBag, nItemIdx);
        end
        if x == ITEMPOS_REPOSITORYROOM then
            tinsert(tbBox, nItemIdx);
        end
    end

    if nClearType == 1 then
        -- Xãa trong hµnh trang chÝnh
        for i = 1, getn(tbMainBag) do
            if GetItemSpecialAttr(tbMainBag[i], "LOCK") ~= 1 then
                DelItemByIndex(tbMainBag[i], -1);
            end
        end
    end
    if nClearType == 2 then
        -- Xãa trong hµnh trang më réng
        for i = 1, getn(tbExtBag) do
            if GetItemSpecialAttr(tbExtBag[i], "LOCK") ~= 1 then
                DelItemByIndex(tbExtBag[i], -1);
            end
        end
    end
    if nClearType == 3 then
        -- Xãa trong r­¬ng bµy b¸n
        for i = 1, getn(tbStallBag) do
            if GetItemSpecialAttr(tbStallBag[i], "LOCK") ~= 1 then
                DelItemByIndex(tbStallBag[i], -1);
            end
        end
    end
    if nClearType == 4 then
        -- Xãa trong r­¬ng chøa ®å
        for i = 1, getn(tbBox) do
            if GetItemSpecialAttr(tbBox[i], "LOCK") ~= 1 then
                DelItemByIndex(tbBox[i], -1);
            end
        end
    end
    if nClearType == 5 then
        -- Xãa tÊt c¶ ë hµnh trang chÝnh+më réng
        --ClearItemInPos();
        for i = 1, getn(tbMainBag) do
            if GetItemSpecialAttr(tbMainBag[i], "LOCK") ~= 1 then
                DelItemByIndex(tbMainBag[i], -1);
            end
        end
        for i = 1, getn(tbExtBag) do
            if GetItemSpecialAttr(tbExtBag[i], "LOCK") ~= 1 then
                DelItemByIndex(tbExtBag[i], -1);
            end
        end
    end
    if nClearType == 6 then
        -- Xãa tÊt c¶ trong hµnh trang
        for i = 1, getn(tbMainBag) do
            if GetItemSpecialAttr(tbMainBag[i], "LOCK") ~= 1 then
                DelItemByIndex(tbMainBag[i], -1);
            end
        end
        for i = 1, getn(tbExtBag) do
            if GetItemSpecialAttr(tbExtBag[i], "LOCK") ~= 1 then
                DelItemByIndex(tbExtBag[i], -1);
            end
        end
        for i = 1, getn(tbStallBag) do
            if GetItemSpecialAttr(tbStallBag[i], "LOCK") ~= 1 then
                DelItemByIndex(tbStallBag[i], -1);
            end
        end
        for i = 1, getn(tbBox) do
            if GetItemSpecialAttr(tbBox[i], "LOCK") ~= 1 then
                DelItemByIndex(tbBox[i], -1);
            end
        end
    end
    WPlayer:Msg("§· dän r­¬ng xong!");

    -- Thªm l¹i item
    local tbAddItem = {
        { tbProp = { 2, 1, 30045 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- CÈm Nang §¹i Sù KiÖn
        { tbProp = { 2, 1, 30240 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- TiÕu Ng¹o Giang Hå Lôc
        { tbProp = { 2, 1, 50002 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- T©n Thñ LÖnh
    };
    if WPlayer:IsSuperAdmin() == WEnv.TRUE
            or WPlayer:IsAdmin() == WEnv.TRUE
            or WPlayer:IsSuperMod() == WEnv.TRUE
            or WPlayer:IsModLive() == WEnv.TRUE
    then
        tinsert(tbAddItem, { tbProp = { 2, 1, 40039 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }); -- ThÎ GM
        tinsert(tbAddItem, { tbProp = { 0, 200, 40 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }); -- ThÇn Hµnh B¶o §iÓn
    end
    if WLib:IsTestServer() == WEnv.TRUE or WTask:GetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_ACTIVETESTCARD) == 1 then
        tinsert(tbAddItem, { tbProp = { 2, 1, 50001 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }); -- ThÎ Tr¶i NghiÖm
    end
    for i = 1, getn(tbAddItem) do
        if WItem:Count(tbAddItem[i].tbProp) <= 0 then
            WItem:DeleteAll(tbAddItem[i].tbProp);
            AddItem(tbAddItem[i].tbProp[1], tbAddItem[i].tbProp[2], tbAddItem[i].tbProp[3], tbAddItem[i].nStack, tbAddItem[i].nStatus);
        end
    end
end

---Hµm thùc thi lÖnh thay thÕ cho kªnh hÖ thèng, sö dông khi server ®ang onl b»ng WLib:InputString
---@param szCommand string LÖnh ch¹y t­¬ng tù ?gm ds nh­ng kh«ng bao gåm ?gm ds
function _wgm_DoCommand(szCommand)
    local self = WGM;

    if szCommand == nil then
        WLib:InputString(nil, "Command Line", 1, 255, 0, _wgm_DoCommand);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    szCommand = WLib:Trim(szCommand) or "";
    local tbForbitCommand = {
        ReloadAllScript = 1,
        rlas = 1,
    };

    local bIsHaveForbitCmd = 0;
    for szLuaAPI, bForbit in tbForbitCommand do
        if szLuaAPI ~= 'n' then
            local tbCommandParse = WLib:Split(szCommand, szLuaAPI);
            if getn(tbCommandParse) > 1 then
                bIsHaveForbitCmd = 1;
                break ;
            end
        end
    end

    if bIsHaveForbitCmd == 1 then
        WNpc:Talk("LÖnh nµy kh«ng ®­îc phÐp sö dông!", 1, "_wgm_DoCommand");
        return WEnv.RETCODE_NOTOPEN;
    end

    local szResult = tostring(dostring(szCommand));
    --local tbCoreApi = WLib:Split(szCommand, "\(") or { "unknow" };
    local szCoreApi = "";
    WGMLog:WriteExeCmdLog("_wgm_DoCommand", "Thùc thi lÖnh script tõ gm", szCoreApi, WPlayer:GetName(), szCommand, szResult);

    WPlayer:Msg("Command: " .. szCommand);
    WPlayer:Msg("Result: " .. szResult);
    _wgm_DoCommand();
end

---Hµm add item vµo nh©n vËt
---@param nType number KiÓu truyÒn tham sè
---@param szParam string tham sè truyÒn vµo tõ hµm WLib:InputString
function _wgm_AddItem(nType, szParam)
    local self = WGM;

    nType = tonumber(nType) or 0;
    if nType == 0 then
        local tbSay = { "Chän c¸ch nhËp m·: \n" ..
                                " - nG nD nP: 3 tham sè b¾t buéc; nS: sè l­îng \n" ..
                                " - nB: -1= ch­a gi¸m ®Þnh, 1= cã thÓ giao dÞch, 4= khãa \n" ..
                                " - nE: c­êng hãa 0-15; c¸c tham sè nLv nOpt nÕu muèn ngÉu nhiªn, ®Ó lµ -1 -1\n" };
        tinsert(tbSay, format("%s/#_wgm_AddItem(1)", "Tù nhËp m· (nG nD nP nS nB nE)"));
        tinsert(tbSay, format("%s/#_wgm_AddItem(2)", "LÊy trang bÞ - m·o (nP nS nB nE nLv1 nOpt1 nLv2 nOpt 2 nLv3 nOpt3)"));
        tinsert(tbSay, format("%s/#_wgm_AddItem(3)", "LÊy trang bÞ - y phôc (nP nS nB nE nLv1 nOpt1 nLv2 nOpt 2 nLv3 nOpt3)"));
        tinsert(tbSay, format("%s/#_wgm_AddItem(4)", "LÊy trang bÞ - h¹ y (nP nS nB nE nLv1 nOpt1 nLv2 nOpt 2 nLv3 nOpt3)"));
        tinsert(tbSay, format("%s/#_wgm_AddItem(5)", "LÊy trang bÞ - nhÉn (nP nS nB nE nLv1 nOpt1 nLv2 nOpt 2 nLv3 nOpt3)"));
        tinsert(tbSay, format("%s/#_wgm_AddItem(6)", "LÊy trang bÞ - vò khÝ (nD nP nS nB nE nLv1 nOpt1 nLv2 nOpt 2 nLv3 nOpt3)"));
        tinsert(tbSay, format("%s/#_wgm_AddItem(7)", "LÊy ngùa (nP nS nB)"));

        tinsert(tbSay, g_szSpaceLine);
        --tinsert(tbSay, "<<  Trë l¹i GM Item/_wgm_OpenMenu");
        tinsert(tbSay, "[x] §ãng/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szParam == WEnv.NULL then
        if nType == 1 then
            WLib:InputString(nil, "nG nD nP nS nB nE", 5, 32, nType, _wgm_AddItem, nType);
        end
        if nType > 1 and nType < 6 then
            WLib:InputString(nil, "nP nS nB nE", 1, 32, nType, _wgm_AddItem, nType);
        end
        if nType == 6 then
            WLib:InputString(nil, "nD nP nS nB nE", 3, 32, nType, _wgm_AddItem, nType);
        end
        if nType == 7 then
            WLib:InputString(nil, "nP nS nB", 1, 32, nType, _wgm_AddItem, nType);
        end
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if type(szParam) == "string" then
        szParam = WLib:Trim(szParam);

        if szParam == "" then
            return WEnv.RETCODE_ERROR;
        end

        local tbParam = WLib:Split(szParam, " ");
        local nG, nD, nP = 0, 0, 0;
        local nParamOffet = 0;
        if nType == 1 then
            if getn(tbParam) < 3 then
                WPlayer:Msg("Lçi có ph¸p, Ýt nhÊt cã 3 gi¸ trÞ lµ sè truyÒn vµo: nG nD nP");
                WPlayer:Msg("Thø tù m·: nG nD nP nStack nBind nEnhance");
                WPlayer:Msg("HoÆc: nG nD nP nStack nBind nEnhance nOptLv1 nOptId1 nOptLv2 nOptId2 nOptLv3 nOptId3");
                _wgm_AddItem(nType);
                return WEnv.RETCODE_ERROR;
            end

            nParamOffet = 0;

            nG = tonumber(tbParam[1 - nParamOffet]) or 0;
            nD = tonumber(tbParam[2 - nParamOffet]) or 0;
            nP = tonumber(tbParam[3 - nParamOffet]) or 0;
        end

        if nType > 1 and nType < 6 then
            if getn(tbParam) < 1 then
                WPlayer:Msg("Lçi có ph¸p, Ýt nhÊt cã 1 gi¸ trÞ lµ sè truyÒn vµo: nP");
                WPlayer:Msg("Thø tù m·: nP nStack nBind nEnhance");
                WPlayer:Msg("HoÆc: nP nStack nBind nEnhance nOptLv1 nOptId1 nOptLv2 nOptId2 nOptLv3 nOptId3");
                _wgm_AddItem(nType);
                return WEnv.RETCODE_ERROR;
            end

            if nType == 2 then
                nParamOffet = 2;

                nG = ITEM_G_EQUIP;
                nD = ITEM_D_EQUIP_HEAD;
                nP = tonumber(tbParam[3 - nParamOffet]) or 0;
            end

            if nType == 3 then
                nParamOffet = 2;

                nG = ITEM_G_EQUIP;
                nD = ITEM_D_EQUIP_CLOTH;
                nP = tonumber(tbParam[3 - nParamOffet]) or 0;
            end

            if nType == 4 then
                nParamOffet = 2;

                nG = ITEM_G_EQUIP;
                nD = ITEM_D_EQUIP_SHOE;
                nP = tonumber(tbParam[3 - nParamOffet]) or 0;
            end

            if nType == 5 then
                nParamOffet = 2;

                nG = ITEM_G_EQUIP;
                nD = ITEM_D_EQUIP_ADORN;
                nP = tonumber(tbParam[3 - nParamOffet]) or 0;
            end
        end

        if nType == 6 then
            if getn(tbParam) < 1 then
                WPlayer:Msg("Lçi có ph¸p, Ýt nhÊt cã 2 gi¸ trÞ lµ sè truyÒn vµo: nD nP");
                WPlayer:Msg("Thø tù m·: nD nP nStack nBind nEnhance");
                WPlayer:Msg("HoÆc: nD nP nStack nBind nEnhance nOptLv1 nOptId1 nOptLv2 nOptId2 nOptLv3 nOptId3");
                _wgm_AddItem(nType);
                return WEnv.RETCODE_ERROR;
            end

            nParamOffet = 1;

            nG = ITEM_G_EQUIP;
            nD = tonumber(tbParam[2 - nParamOffet]) or 0;
            nP = tonumber(tbParam[3 - nParamOffet]) or 0;

            if nD < 0 or nD > 14 then
                WPlayer:Msg("Lçi có ph¸p, nD lµ sè gi¸ trÞ tõ 0-14");
                WPlayer:Msg("Thø tù m·: nD nP nStack nBind nEnhance");
                WPlayer:Msg("HoÆc: nD nP nStack nBind nEnhance nOptLv1 nOptId1 nOptLv2 nOptId2 nOptLv3 nOptId3");
                _wgm_AddItem(nType);
                return WEnv.RETCODE_ERROR;
            end
        end

        if nType == 7 then
            if getn(tbParam) < 1 then
                WPlayer:Msg("Lçi có ph¸p, Ýt nhÊt cã 1 gi¸ trÞ lµ sè truyÒn vµo: nP");
                WPlayer:Msg("Thø tù m·: nP nStack nBind");
                WPlayer:Msg("HoÆc: nP nStack nBind 0 nOptLv1 nOptId1 nOptLv2 nOptId2 nOptLv3 nOptId3");
                _wgm_AddItem(nType);
                return WEnv.RETCODE_ERROR;
            end

            if nType == 7 then
                nParamOffet = 2;

                nG = ITEM_G_EQUIP;
                nD = ITEM_D_EQUIP_HORSE;
                nP = tonumber(tbParam[3 - nParamOffet]) or 0;
            end
        end

        if nP <= 0 then
            WPlayer:Msg("Lçi có ph¸p, gi¸ trÞ nP <= 0");
            _wgm_AddItem(nType);
            return WEnv.RETCODE_ERROR;
        end

        local nStack = tonumber(tbParam[4 - nParamOffet]) or 1;
        local nBind = tonumber(tbParam[5 - nParamOffet]) or 4;
        local nEnhance = 0;

        if WLib:IsInTable(nD, g_tbItemDHaveEnhance) == WEnv.TRUE
                or WLib:IsInTable(nD, g_tbSpecialItemCanEnhance) == WEnv.TRUE
        then
            nEnhance = tonumber(tbParam[6 - nParamOffet]) or 0;
        end

        local nOptLv1 = -1;
        local nOptId1 = -1;
        local nOptLv2 = -1;
        local nOptId2 = -1;
        local nOptLv3 = -1;
        local nOptId3 = -1;

        if nBind ~= -1
                and nG == ITEM_G_EQUIP
                and nD ~= ITEM_D_EQUIP_BOOK
                and nD ~= ITEM_D_EQUIP_GREAT_BOOK
                and nD ~= ITEM_D_EQUIP_HORSE
        then
            nOptLv1 = tonumber(tbParam[7 - nParamOffet]) or 0;
            nOptId1 = tonumber(tbParam[8 - nParamOffet]) or 0;
            nOptLv2 = tonumber(tbParam[9 - nParamOffet]) or 0;
            nOptId2 = tonumber(tbParam[10 - nParamOffet]) or 0;
            nOptLv3 = tonumber(tbParam[11 - nParamOffet]) or 0;
            nOptId3 = tonumber(tbParam[12 - nParamOffet]) or 0;
        end

        local tbAward = { tbProp = { nG, nD, nP }, nStack = nStack, nStatus = nBind, nLevel = nEnhance, tbParam = { nOptLv1, nOptId1, nOptLv2, nOptId2, nOptLv3, nOptId3 } };
        local nRetCode = WAward:Give(tbAward, "_wgm_AddItem");
        WGMLog:WriteExeCmdLog("_wgm_AddItem", "Add vËt phÈm tõ gm", "WAward:Give", WItem:GetName(nG, nD, nP), szParam, nRetCode)
    end
end

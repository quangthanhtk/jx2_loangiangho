----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-10
--- Description: c�c h�m li�n quan ��n gm
--- Th� gm s� c� 2 ch� add, 1 l� login, 2 l� trong th� t�n th�
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\functions\\function_gm_server.lua");
Include("\\script\\warlord\\functions\\function_gm_player.lua");
Include("\\script\\gmscript.lua");
----------------------------------------------------------------------------------------------------

g_nGMVersion = 2; -- D�ng �� ki�m tra khi reload script
m_szThisFile = "\\script\\warlord\\functions\\function_gm.lua";
m_tbAdminGotoMap = {
    [1] = {
        szName = "��n c�c th�nh th�",
        tbPos = {
            { "Bi�n Kinh", { 200, 1360, 2872 } },
            { "Tuy�n Ch�u", { 100, 1416, 2958 } },
            { "Th�nh ��", { 300, 1769, 3552 } },
            { "T��ng D��ng", { 350, 1360, 2872 } },
            { "D��ng Ch�u", { 150, 1360, 2872 } },
            { "��i L�", { 400, 1360, 2872 } },
            { "Ph��ng T��ng", { 500, 1360, 2872 } },
        }
    },
    [2] = {
        szName = "Th� l�c ba phe",
        tbPos = {
            { "V� L�m Minh", { 425, 1746, 3197 } },
            { "��i L� Thi�n Long T�", { 6000, 1603, 2808 } },
            { "Th� Ph�n Qu�nh K�t", { 6100, 1648, 3676 } },
            { "T�y H� H�ng Kh�nh", { 6200, 1406, 3138 } },
            { "Th�t L�c Nhai", { 6300, 1382, 3252 } },
            { "Thi�n �m Th�nh ��a", { 6400, 1629, 3267 } },
        }
    },
    --[2] = { szName = "��n c�c m�n ph�i",
    --    tbPos = {
    --
    --    }
    --},

    [3] = {
        szName = "��n chi�n tr��ng Nh�n M�n Quan - Gi�i C�u N�ng Trang",
        tbPos = {
            { 'V�o trung t�m', { 881, 1668, 3365 } },

            { 'V�o khu v�c h�i sinh T�ng', { 881, 1552, 3623 } },
            { 'V�o khu v�c h�i sinh Li�u', { 881, 1786, 3152 } },

            { 'G�c tr�n b�n tr�i b�n ��', { 881, 1598, 3216 } },
            { 'G�c tr�n b�n ph�i b�n ��', { 881, 1742, 3224 } },
            { 'G�c d��i b�n ph�i b�n ��', { 881, 1732, 3507 } },
            { 'G�c d��i b�n tr�i b�n ��', { 881, 1601, 3517 } },
        }
    },
    [4] = {
        szName = "��n chi�n tr��ng Nh�n M�n Quan - Thu Th�p L��ng Th�o",
        tbPos = {
            { 'V�o trung t�m', { 882, 1679, 3377 } },

            { 'V�o khu v�c h�i sinh T�ng', { 882, 1572, 3554 } },
            { 'V�o khu v�c h�i sinh Li�u', { 882, 1767, 3182 } },

            { 'NPC N�n d�n', { 882, 1606, 3263 } },
            { 'NPC Th� l�nh s�n t�c', { 882, 1729, 3534 } },

            { 'G�c tr�n b�n tr�i b�n ��', { 882, 1608, 3265 } },
            { 'G�c tr�n b�n ph�i b�n ��', { 882, 1722, 3269 } },
            { 'G�c d��i b�n ph�i b�n ��', { 882, 1716, 3452 } },
            { 'G�c d��i b�n tr�i b�n ��', { 882, 1613, 3486 } },
        }
    },
    [5] = {
        szName = "��n chi�n tr��ng Nh�n M�n Quan - B�o V� Th�nh Tr�",
        tbPos = {
            { 'L�n Ph�o', { 883, 1728, 2909 } },

            { 'V�o khu v�c h�i sinh T�ng', { 883, 1618, 3365 } },
            { '��n h�u doanh T�ng', { 883, 1639, 3303 } },
            { '��n ti�n doanh T�ng', { 883, 1675, 3141 } },

            { 'V�o khu v�c h�i sinh Li�u', { 883, 1844, 3367 } },
            { '��n h�u doanh Li�u', { 883, 1804, 3307 } },
            { '��n ti�n doanh Li�u', { 883, 1770, 3138 } },
        }
    },
    [6] = {
        szName = "��n chi�n tr��ng Nh�n M�n Quan - Nh�n M�n R�c L�a",
        tbPos = {
            { 'L�n Ph�o', { 884, 1765, 3364 } },

            { 'V�o khu v�c h�i sinh T�ng', { 884, 1565, 3744 } },
            { '��n h�u doanh T�ng', { 884, 1629, 3651 } },
            { '��n ti�n doanh T�ng', { 884, 1666, 3606 } },

            { 'V�o khu v�c h�i sinh Li�u', { 884, 1933, 3740 } },
            { '��n h�u doanh Li�u', { 884, 1899, 3662 } },
            { '��n ti�n doanh Li�u', { 884, 1828, 3611 } },
        }
    },
    [7] = {
        szName = "��n khu v�c b�o danh chi�n tr��ng",
        tbPos = {
            { 'M� Binh Quan Phe T�ng', { 808, 1730, 3038 } },
            { 'M� Binh Quan Phe Li�u', { 808, 1647, 3170 } },
        }
    },

    [8] = {
        szName = "��n khu v�c T�i Nguy�n Chi�n",
        tbPos = {
            { 'Doanh tr�i T�ng (Tri�u T� Quy�n)', { 606, 1234, 2851 } },
            { 'Doanh tr�i Li�u (Ti�u Vi�n Tu�n)', { 606, 1493, 3111 } },
            { 'Mua c�ng c� (Ho�ng Tr� th��ng nh�n)', { 606, 1349, 2994 } },

            { 'B�i 5 R��ng ch�u b�u T�ng', { 606, 1327, 2932 } },
            { 'B�i 12 Thu�c da t�i nguy�n T�ng', { 606, 1365, 2878 } },
            { 'B�i 12 G� t�i nguy�n T�ng', { 606, 1265, 2977 } },

            { 'B�i 5 Thu�c da t�i nguy�n Li�u', { 606, 1400, 3010 } },
            { 'B�i 12 Th�o d��c t�i nguy�n Li�u', { 606, 1468, 2975 } },
            { 'B�i 12 R��ng ch�u b�u Li�u', { 606, 1364, 3072 } },

            { 'B�i 6 G� t�i nguy�n (b�c)', { 606, 1503, 2826 } },
            { 'B�i 5 G� t�i nguy�n (nam)', { 606, 1232, 3044 } },
            { 'B�i 6 R��ng ch�u b�u (nam)', { 606, 1303, 3110 } },
            { 'B�i 5 Th�o d��c t�i nguy�n (nam)', { 606, 1243, 3174 } },
        }
    },
    --[8] = {
    --    szName = "��n khu v�c C�ng Th�nh Chi�n",
    --    tbPos = {
    --        {'��n Long Tr� & ��i K� Trung T�m', {887, 1292, 2779}},
    --        {'��n ��i K� T�y', {887, 138*8, 172*16}},
    --        {'��n ��i K� ��ng', {887, 162*8, 185*16}},
    --        {'��n C�a T�y', {887, 132*8, 176*16}},
    --        {'��n C�a Trung T�m', {887, 147*8, 180*16}},
    --        {'��n C�a ��ng', {887, 156*8, 188*16}},
    --
    --        {'V�o khu v�c chu�n b� phe C�ng', {887, 1132, 3153}},
    --        {'��n �i�m t�p k�t T�y Nam', {887, 986, 2973}},
    --        {'��n �i�m t�p k�t ��ng Nam', {887, 1108, 3067}},
    --
    --        {'V�o khu v�c chu�n b� phe Th�', {887, 1457, 2578}},
    --        {'��n T�y h�u doanh', {887, 171*8, 160*16}},
    --        {'��n ��ng h�u doanh', {887, 186*8, 167*16}},
    --        {'��n T�y ti�n doanh', {887, 150*8, 165*16}},
    --        {'��n ��ng ti�n doanh', {887, 176*8, 179*16}},
    --    }
    --},
    --[9] = {
    --    szName = "��n khu v�c Hoa S�n ��i Chi�n",
    --    tbPos = {
    --        {'L�n b�o r��ng (Hoa S�n)', {969, 1599, 2985}},
    --        {'��n NPC V� L�m ��c S� (Hoa S�n)', {969, 1640, 3227}},
    --        {'��n NPC Tr��ng ��i H�u (Long Tuy�n Th�n)', {106, 1309, 3000}},
    --        --{'V� tr� h�i sinh 1', {1588, 3219}},
    --        --{'V� tr� h�i sinh 2', {1588, 3219}},
    --        --{'V� tr� h�i sinh 3', {1588, 3219}},
    --        --{'V� tr� h�i sinh 4', {1588, 3219}},
    --    }
    --},
    --[10] = {
    --    szName = "��n khu v�c T� Quang C�c",
    --    tbPos = {
    --        {'Khu v�c 1-1 ngo�i ���ng', {926, 1580, 3317}},
    --        {'Khu v�c 1-1 n�i ���ng', {926, 1542, 3146}},
    --        {'Khu v�c 1-2 ngo�i ���ng', {927, 1580, 3317}},
    --        {'Khu v�c 1-2 n�i ���ng', {927, 1542, 3146}},
    --        {'Khu v�c 1-3 ngo�i ���ng', {928, 1580, 3317}},
    --        {'Khu v�c 1-3 n�i ���ng', {928, 1542, 3146}},
    --
    --        {'Khu v�c 2-1 ngo�i ���ng', {929, 1580, 3317}},
    --        {'Khu v�c 2-1 n�i ���ng', {929, 1542, 3146}},
    --        {'Khu v�c 2-2 ngo�i ���ng', {930, 1580, 3317}},
    --        {'Khu v�c 2-2 n�i ���ng', {930, 1542, 3146}},
    --        {'Khu v�c 2-3 ngo�i ���ng', {931, 1580, 3317}},
    --        {'Khu v�c 2-3 n�i ���ng', {931, 1542, 3146}},
    --    }
    --},
    [11] = {
        szName = "��n li�n server",
        tbPos = {
            { "Khu v�c 1v1", { 7100, 1410, 2857 } },
            { "Khu v�c 3v3", { 8000, 1410, 2857 } },
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
    tbReloadCoreScript = { -- ��y l� b�ng danh s�ch c�c script m� warlord hook v�o h� th�ng c�a game
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
    -- 32 l� �� d�i string t�i �a c�a h�m g�c DoScriptByName
    -- 11 l� t�ng �� d�i c�a segment header: XX&YYY&ZZZ&
    -- 2 l� chi�u d�i 2 k� t� cu�i ~~ c�a segment
    -- c�u tr�c c�a 1 segment: XX&YYY&ZZZ&AAAA~~
    -- XX l� id package
    -- YYY l� s� th� t� segment
    -- ZZZ l� t�ng s� segment
    -- AAAA l� data c�a 1 segment

    tbMsgString = {
        [1] = "L�nh �� ���c g�i ��n ng��i ch�i [%s]!",
        [2] = "G�i sai m�c ti�u szRevicerName=[%s] th�c t� l� [%s]!",
        [3] = "Ng��i ch�i [%s] kh�ng t�m th�y ho�c �� r�i m�ng!",
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
            "_wgm_server_LoadDuaTopBXHData_TopBattleMerit", --top chi�n tr��ng
            "_wgm_server_LoadDuaTopBXHData_TopLevel", -- top c�p
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
--- C�c h�m base th� vi�n GM
----------------------------------------------------------------------------------------------------

---H�m t�o ra g�i tin d�ng string
---@param szTargetName string T�n nh�n v�t c�n g�i ��n
---@param bIsShowProcessBar number B�t/t�t hi�n th� thanh ch�y
---@param szScriptFile string Script file path
---@param szFunctionName string T�n h�m c�n th�c thi
---@param tbArgs table B�ng bi�n c�n truy�n v�o
---@return string Chu�i m� ho� s� g�i �i
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

---H�m b�c t�ch g�i tin v� tr�ng th�i ban ��u v� theo ��ng th� t� ��u v�o c�a h�m _wgm_MakeData
---@param tbData table D� li�u nh�n ���c
---@return table Th� t� theo ��u v�o c�a h�m _wgm_MakeData
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

---H�m g�i g�i tin, h�m n�y s� th�c hi�n chia nh� c�u l�nh �� g�i d��i d�ng segment
---c�c segment s� ���c n�i l�i t�i h�m _wgm_RevicePackage khi nh�n ���c g�i tin cu�i c�ng
---@param szTargetName string T�n nh�n v�t nh�n
---@param szScriptFile string Script file path
---@param szFunctionName string T�n h�m s� th�c thi tr�n nh�n v�n v�t nh�n tin
---@param tbArgs table Danh s�ch bi�n input c�a h�m szFunctionName
---@param bIsShowProcessBar number B�t/T�t hi�n th� thanh ch�y
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

---H�m nh�n g�i tin, h�m n�y s� th�c hi�n l�u tr� c�c segment g�i ��n
---n�u nh�n ���c g�i tin cu�i s� th�c hi�n n�i c�c g�i tin l�i v� ch�y ��n h�m _wgm_RevicePackage_cb
---@param szData string D� li�u chia nh� c�a h�m g�i tin _wgm_SendPackage
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

---H�m n�y s� g�i th�c thi tr�n szTargetName khi nh�n �� g�i tin th�nh c�ng
---��ng th�i ki�m tra ��ng ng��i nh�n szRevicerName th� m�i cho th�c thi l�nh
---@param szSenderName string T�n nh�n v�t g�i �i
---@param szRevicerName string T�n nh�n v�t nh�n
---@param bIsShowProcessBar number B�t/T�t hi�n th� thanh ch�y
---@param szScriptFile string Script file path
---@param szFunctionName string T�n h�m s� th�c thi tr�n nh�n v�t nh�n
---@param tbArgs table Danh s�ch bi�n input c�a h�m szFunctionName
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
            --- TODO: Ch� n�y c�n ghi log g�i h�m
            --_wgm_SendPackage(szSenderName, self.szScriptFile, "_wgm_SendPackage_cb", {nRetCode, nRetData});
            --print(format("[SUCCESS][_wgm_RevicePackage][%s] do function complete %s(%s) !", szRevicerName, szFunctionName, szArg), nRetCode, nRetData);
        end
        return nRetCode, nRetData;
    end
    return WEnv.RETCODE_ERROR;
end

---H�m n�y t�o ra �� stop ProcessBar v� th�ng b�o kh�ng t�m th�y player
---n�u g�i tin g�i �i ng��i g�i c� b�t ProcessBar th� s� ���c cancel ProcessBar => t�m th�y player
---@param szRevicerName string T�n nh�n v�t nh�n
function _wgm_StopProgressBar(szRevicerName)
    local self = WGM;
    ProgressSlotCancle();
    WPlayer:Msg(format(self.tbMsgString[3], szRevicerName or ""));
end

---H�m n�y l� h�m g�i tr� c�a szTargetName v� th�c thi tr�n szSenderName
---param szSenderName ch�nh l� szTargetName, t�m th�i ch�a bi�t l�m g� v�i n�
---@param szSenderName string Nh�n v�t g�i �i
---@param szOriginalSenderName string Nh�n v�t g�i g�c (do truy�n qua nhi�u l��t n�n c�n l�u l�i ng��i ��u ti�n g�i l�nh �� ti�n ki�m tra)
---@param szOriginalTargetName string Nh�n v�t nh�n g�c (do truy�n qua nhi�u l��t n�n c�n l�u l�i ng��i ��u ti�n g�i l�nh �� ti�n ki�m tra)
---@param ... table Tham s� tu� bi�n, input c�a h�m th�c thi b�n trong
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

---H�m n�y cho ph�p th�c thi 1 l�nh b�ng c�ch ��u v�o l� t�n nh�n v�t, h�m, v� param
---@param szFindPlayerName string T�n nh�n v�t c�n t�m
---@param fnFunc function H�m c�n th�c thi tr�n nh�n v�t
---@param ... table Tham s� tu� bi�n, input c�a fnFunc
---@return number Gi� tr� tr� v� WEnv.RETCODE_ERROR l� kh�ng t�m th�y nh�n v�t
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

---H�m n�y cho ph�p t�m player b�ng t�n nh�n v�t (loop qua c�c player c�ng GS)
---@param szFindPlayerName string T�n nh�n v�t c�n t�m
---@return number PlayerIndex > 0 c�a nh�n v�t n�u t�m ���c
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

---H�m n�y ki�m tra quy�n s� d�ng theo t�n t�i kho�n h�m ���c khai b�o � tr�n
---@param szFunctionName string T�n h�m c�n ki�m tra quy�n th�c thi
---@param szAccount string T�n t�i kho�n c�n ki�m tra c� quy�n th�c thi h�m kh�ng
---@return number Tr� v� 2 tham s�, return1: WEnv.TRUE l� c� quy�n, return2: group c�a user
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

---H�m n�y s� insert v�o menu Say d�a v�o quy�n c�a player
---@param tbSay table D� li�u Say c�n insert v�o
---@param szFunctionName string T�n h�m s� add v�o
---@param ... table Tham s� tu� bi�n, n�u size > 2 th� gi� tr� th� nh�t l� v� tr� insert v�o b�ng
---@return table D� li�u say ho�n ch�nh c� l�c quy�n truy c�p c�a user
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
--- C�c h�m entrypoint c�a th� gm
----------------------------------------------------------------------------------------------------

---H�m add th� gm khi login, c� check quy�n tr��c khi add
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

---H�m t�o ra say title cho t�ng ch�c v�
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

---H�m reload th� gm, ch� c� t�c d�ng � gs hi�n t�i
function _wgm_ReloadGmItem()
    --dofile("script/warlord/item/gm0_item.lua");
    LoadScript(WGM.szScriptFile); -- c�ch n�y b� ch�m 1 l��t
    LoadScript("\\script\\warlord\\items\\item_gm_card.lua"); -- c�ch n�y b� ch�m 1 l��t
    WPlayer:Msg(date("%Y-%m-%d %H:%M:%S") .. ": GM �� ���c reload!");
end

---H�m entrypoint c�a item gm
---@param nItemIdx number ID c�a th� gm
function _wgm_OpenMenu(nItemIdx)
    local self = WGM;

    if IsBoxLocking() == 1 then
        WNpc:Talk("�� ��m b�o t�i s�n c�a c�c h�, h�y m� kh�a kho tr��c �i.", WEnv.TRUE);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if _wgm_IsHaveAccessFunction("_wgm_OpenMenu_GM") == WEnv.TRUE then
        return _wgm_OpenMenu_GM();
    elseif _wgm_IsHaveAccessFunction("_wgm_OpenMenu_ModLive") == WEnv.TRUE then
        return _wgm_OpenMenu_ModLive();
    elseif nItemIdx ~= WEnv.NULL then
        WItem:DelByIndex(nItemIdx);
        WNpc:Talk("B�n kh�ng c� quy�n s� d�ng v�t ph�m b� thu h�i!", WEnv.TRUE);
    end
end

---H�m menu ri�ng cho GM
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
        _wgm_InsertSay(tbSay, "_wgm_player_ShowPlayerProcessMenu", format("X� l� nh�n v�t [%s]/#_wgm_player_FindPlayerByName(%q)", tbLastPlayerInfo[3], tbLastPlayerInfo[3]));
    end
    _wgm_InsertSay(tbSay, "_wgm_player_FindPlayerByName", "T�m nh�n v�t theo t�n/_wgm_player_FindPlayerByName");

    tinsert(tbSay, g_szSpaceLine);
    _wgm_InsertSay(tbSay, "_wgm_AdminGoto", "Di chuy�n ��n.../_wgm_AdminGoto");
    if WTask:GetBit(WTASKID_GMSTATE_BIT, WTASKID_GMSTATE_BIT_GMBUFF) == 0 then
        _wgm_InsertSay(tbSay, "_wgm_SetAdminState", "Nh�n buff admin (t�ng h�nh, b�t t�, t�c ch�y)/#_wgm_SetAdminState(1)");
    else
        _wgm_InsertSay(tbSay, "_wgm_SetAdminState", "T�t buff admin/#_wgm_SetAdminState(0)");
    end

    tinsert(tbSay, g_szSpaceLine);
    _wgm_InsertSay(tbSay, "_wgm_server_OpenMenu", "Qu�n l� server/_wgm_server_OpenMenu");
    _wgm_InsertSay(tbSay, "_wgm_DoCommand", "Open Console/_wgm_DoCommand");
    _wgm_InsertSay(tbSay, "_wgm_AddItem", "Th�m v�t ph�m/_wgm_AddItem");
    _wgm_InsertSay(tbSay, "_wgm_ReloadGmItem", "Reload GM item/_wgm_ReloadGmItem");

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[!] Thanh l� v�t ph�m/_wgm_ClearBag");
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_SUCCESS;
end

---H�m menu d�nh ri�ng cho ModLive
function _wgm_OpenMenu_ModLive()
    local self = WGM;

    local nMapId, nPosX, nPosY = WPlayer:GetWorldPos();

    local tbSay = { format("Hello Moderator, have a nice day! \n" ..
            "GM Version: <color=green>%d<color> - Server time: <color=green>%s<color> - Total day open: <color=green>%d<color> \n" ..
            "Position: <color=green>%s(%d/%d)<color> - <color=green>%d %d %d<color>",

            g_nGMVersion, date("%Y-%m-%d %H:%M:%S"), WDate:CurrentRunningDay(),
            GetMapName(nMapId), floor(nPosX / 8), floor(nPosY / 16), nMapId, nPosX, nPosY
    ) };

    _wgm_InsertSay(tbSay, "_wgm_AdminGoto", "Di chuy�n ��n.../_wgm_AdminGoto");
    if WTask:GetBit(WTASKID_GMSTATE_BIT, WTASKID_GMSTATE_BIT_GMBUFF) == 0 then
        _wgm_InsertSay(tbSay, "_wgm_SetAdminState", "Nh�n buff admin (t�ng h�nh, b�t t�, t�c ch�y)/#_wgm_SetAdminState(1)");
    else
        _wgm_InsertSay(tbSay, "_wgm_SetAdminState", "T�t buff admin/#_wgm_SetAdminState(0)");
    end

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[!] Thanh l� v�t ph�m/_wgm_ClearBag");
    tinsert(tbSay, "[x] ��ng/nothing");
    WNpc:SayDialog(tbSay);
    return WEnv.RETCODE_SUCCESS;
end

----------------------------------------------------------------------------------------------------
--- C�c h�m c� b�n th�ng d�ng
----------------------------------------------------------------------------------------------------

---H�m di chuy�n c�a gm
---@param nSelect1 number Index c�a tb say c�p 1
---@param nSelect2 number Index c�a tb say c�p 2
function _wgm_AdminGoto(nSelect1, nSelect2)
    if nSelect1 == WEnv.NULL then
        local tbSay = { "M�i ch�n n�i ��n:" };
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
        tinsert(tbSay, "[x] T�m th�i ch�a mu�n �i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if nSelect2 == WEnv.NULL then
        local tbSay = { "M�i ch�n n�i ��n:" };
        for i = 1, getn(m_tbAdminGotoMap[nSelect1].tbPos) do
            tinsert(tbSay, format("%s/#_wgm_AdminGoto(%d, %d)", m_tbAdminGotoMap[nSelect1].tbPos[i][1], nSelect1, i));
        end

        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "<<  Tr� l�i trang tr��c/_wgm_AdminGoto");
        tinsert(tbSay, "[x] T�m th�i ch�a mu�n �i./nothing");
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

---H�m thay th� cho NewWorld, c� check li�n server tr�nh k�t acc
---@param nMapId number MapId, xem trong maps/map_list.ini
---@param nPosX number To� �� b�n �� X*8
---@param nPosY number To� �� b�n �� Y*16
---@param nRule number Quy�n chuy�n map
function _wgm_SafeNewWorld(nMapId, nPosX, nPosY, nRule)
    local tbRealmMap = {
        [6028] = "V� Tr��ng Li�n Server",
        [6029] = "Chi�n tr��ng Th�n trang-Nh�n M�n Quan",
        [6030] = "Chi�n tr��ng Th�o c�c-Nh�n M�n Quan",
        [6031] = "Chi�n tr��ng ph�o ��i-Nh�n M�n Quan",
        [6032] = "Chi�n tr��ng ch�nh-Nh�n M�n Quan",
        [6066] = "B�ch Hoang Th�nh",
        [6067] = "Hoa S�n �i�n",
        [6068] = "Ho�ng Cung Gi�o Tr��ng",
        [6069] = "Uy V� ��i L�i",
        [6070] = "H� L�u Thanh Tuy�n",
        [6071] = "T� C�m �i�n",
        [6072] = "Th�ng Thi�n T�c ��o",
        [6076] = "�n O�n ��i",
        [7100] = "Khu v�c t� th� li�n server", --1v1
        [8000] = "��u Tr��ng Chu�n B�",
        [8001] = "��u Tr��ng Ph�i H�p",
        [8002] = "M� h�nh t�n t�i 2v2",
        [8003] = "M� h�nh t�n t�i 3v3",
        [8004] = "M� h�nh t�n t�i 5v5",
        [8005] = "M� h�nh t� ��i 1v1",
        [8006] = "M� h�nh t� ��i 2v2",
        [8007] = "M� h�nh t� ��i 3v3",
        [8008] = "M� h�nh t� ��i 5v5",
        [8009] = "Khu v�c chu�n b� li�n server",
        [8899] = "Khu li�n server",
        [8907] = "T�y Th�c ��o",
        [8908] = "Chu�n B� Chi�n Tr��ng T�y Th�c ��o 1",
        [8909] = "Chu�n B� Chi�n Tr��ng T�y Th�c ��o 2",
        [8910] = "Chu�n B� Chi�n Tr��ng T�y Th�c ��o 3",
        [8916] = "Nh�n M�n Quan-��a �i�m b� chi�n",
        [8921] = "��i Th�o Nguy�n 1 (pvp)",
        [8922] = "B� l�c V��ng K� (pvp)",
        [8923] = "��i Th�o Nguy�n 2 (pve)",
    };
    local nVersion, bGlbRealm = GetRealmType();
    if bGlbRealm ~= 0 or tbRealmMap[nMapId] ~= WEnv.NULL then
        return ChangeGroupWorld(nMapId, nPosX, nPosY);
    else
        return NewWorld(nMapId, nPosX, nPosY, nRule);
    end
end

---H�m set buff cho admin/mod
---@param bEnable number B�t/t�t buff admin
---@param bShowMsg number Hi�n th� th�ng b�o hay kh�ng, c�i n�y ho�t ��ng trong sync 
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
            WPlayer:Msg("�� nh�n hi�u qu� " .. tbBuffInfo[1]);
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        end
    else
        WTask:SetBit(WTASKID_GMSTATE_BIT, WTASKID_GMSTATE_BIT_GMBUFF, 0);
        for i = 1, nMaxStateBuff do
            RemoveState(nStateIdOffset + i);
        end
        if bShowMsg == 1 then
            WPlayer:Msg("�� h�y hi�u qu� " .. tbBuffInfo[1]);
            SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        end
    end
end

---H�m d�n r��ng, h�m s� kh�ng xo� v�t ph�m �ang b� kho� b�o hi�m
---@param nClearType number C�ch xo� r��ng
---@param bConfirm number X�c nh�n xo� r��ng
function _wgm_ClearBag(nClearType, bConfirm)
    local tbClearBagTypes = {
        [1] = "D�n h�nh trang ch�nh",
        [2] = "D�n h�nh trang m� r�ng",
        [3] = "D�n r��ng b�y b�n",
        [4] = "D�n r��ng th� kh�",
        [5] = "D�n trong h�nh trang v� m� r�ng",
        [6] = "D�n t�t c� (h�nh trang ch�nh-ph�-th� kh�-b�y b�n)",
    };

    if nClearType == WEnv.NULL then
        local tbSay = { "Ch�n c�ch x�a c�c v�t ph�m �ang c� trong r��ng, c�c v�t ph�m kh�a b�o v� s� kh�ng th� t� x�a, thao t�c kh�ng th� ho�n l�i, c�n c�n nh�c tr��c khi s� d�ng:" };

        for i = 1, getn(tbClearBagTypes) do
            tinsert(tbSay, format("%s/#_wgm_ClearBag(%d)", tbClearBagTypes[i], i));
        end

        tinsert(tbSay, g_szSpaceLine);
        tinsert(tbSay, "[x] T�m th�i ch�a c�n ��n/nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if tbClearBagTypes[nClearType] == WEnv.NULL then
        return WEnv.RETCODE_ERROR;
    end

    if bConfirm == WEnv.NULL then
        WNpc:SayConfirm(format("B�n x�c nh�n mu�n <color=green>%s<color>?\n<color=red>Ch� �: thao t�c kh�ng th� ho�n l�i.<color>", tbClearBagTypes[nClearType]),
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
        -- X�a trong h�nh trang ch�nh
        for i = 1, getn(tbMainBag) do
            if GetItemSpecialAttr(tbMainBag[i], "LOCK") ~= 1 then
                DelItemByIndex(tbMainBag[i], -1);
            end
        end
    end
    if nClearType == 2 then
        -- X�a trong h�nh trang m� r�ng
        for i = 1, getn(tbExtBag) do
            if GetItemSpecialAttr(tbExtBag[i], "LOCK") ~= 1 then
                DelItemByIndex(tbExtBag[i], -1);
            end
        end
    end
    if nClearType == 3 then
        -- X�a trong r��ng b�y b�n
        for i = 1, getn(tbStallBag) do
            if GetItemSpecialAttr(tbStallBag[i], "LOCK") ~= 1 then
                DelItemByIndex(tbStallBag[i], -1);
            end
        end
    end
    if nClearType == 4 then
        -- X�a trong r��ng ch�a ��
        for i = 1, getn(tbBox) do
            if GetItemSpecialAttr(tbBox[i], "LOCK") ~= 1 then
                DelItemByIndex(tbBox[i], -1);
            end
        end
    end
    if nClearType == 5 then
        -- X�a t�t c� � h�nh trang ch�nh+m� r�ng
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
        -- X�a t�t c� trong h�nh trang
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
    WPlayer:Msg("�� d�n r��ng xong!");

    -- Th�m l�i item
    local tbAddItem = {
        { tbProp = { 2, 1, 30045 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- C�m Nang ��i S� Ki�n
        { tbProp = { 2, 1, 30240 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Ti�u Ng�o Giang H� L�c
        { tbProp = { 2, 1, 50002 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- T�n Th� L�nh
    };
    if WPlayer:IsSuperAdmin() == WEnv.TRUE
            or WPlayer:IsAdmin() == WEnv.TRUE
            or WPlayer:IsSuperMod() == WEnv.TRUE
            or WPlayer:IsModLive() == WEnv.TRUE
    then
        tinsert(tbAddItem, { tbProp = { 2, 1, 40039 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }); -- Th� GM
        tinsert(tbAddItem, { tbProp = { 0, 200, 40 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }); -- Th�n H�nh B�o �i�n
    end
    if WLib:IsTestServer() == WEnv.TRUE or WTask:GetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_ACTIVETESTCARD) == 1 then
        tinsert(tbAddItem, { tbProp = { 2, 1, 50001 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }); -- Th� Tr�i Nghi�m
    end
    for i = 1, getn(tbAddItem) do
        if WItem:Count(tbAddItem[i].tbProp) <= 0 then
            WItem:DeleteAll(tbAddItem[i].tbProp);
            AddItem(tbAddItem[i].tbProp[1], tbAddItem[i].tbProp[2], tbAddItem[i].tbProp[3], tbAddItem[i].nStack, tbAddItem[i].nStatus);
        end
    end
end

---H�m th�c thi l�nh thay th� cho k�nh h� th�ng, s� d�ng khi server �ang onl b�ng WLib:InputString
---@param szCommand string L�nh ch�y t��ng t� ?gm ds nh�ng kh�ng bao g�m ?gm ds
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
        WNpc:Talk("L�nh n�y kh�ng ���c ph�p s� d�ng!", 1, "_wgm_DoCommand");
        return WEnv.RETCODE_NOTOPEN;
    end

    local szResult = tostring(dostring(szCommand));
    --local tbCoreApi = WLib:Split(szCommand, "\(") or { "unknow" };
    local szCoreApi = "";
    WGMLog:WriteExeCmdLog("_wgm_DoCommand", "Th�c thi l�nh script t� gm", szCoreApi, WPlayer:GetName(), szCommand, szResult);

    WPlayer:Msg("Command: " .. szCommand);
    WPlayer:Msg("Result: " .. szResult);
    _wgm_DoCommand();
end

---H�m add item v�o nh�n v�t
---@param nType number Ki�u truy�n tham s�
---@param szParam string tham s� truy�n v�o t� h�m WLib:InputString
function _wgm_AddItem(nType, szParam)
    local self = WGM;

    nType = tonumber(nType) or 0;
    if nType == 0 then
        local tbSay = { "Ch�n c�ch nh�p m�: \n" ..
                                " - nG nD nP: 3 tham s� b�t bu�c; nS: s� l��ng \n" ..
                                " - nB: -1= ch�a gi�m ��nh, 1= c� th� giao d�ch, 4= kh�a \n" ..
                                " - nE: c��ng h�a 0-15; c�c tham s� nLv nOpt n�u mu�n ng�u nhi�n, �� l� -1 -1\n" };
        tinsert(tbSay, format("%s/#_wgm_AddItem(1)", "T� nh�p m� (nG nD nP nS nB nE)"));
        tinsert(tbSay, format("%s/#_wgm_AddItem(2)", "L�y trang b� - m�o (nP nS nB nE nLv1 nOpt1 nLv2 nOpt 2 nLv3 nOpt3)"));
        tinsert(tbSay, format("%s/#_wgm_AddItem(3)", "L�y trang b� - y ph�c (nP nS nB nE nLv1 nOpt1 nLv2 nOpt 2 nLv3 nOpt3)"));
        tinsert(tbSay, format("%s/#_wgm_AddItem(4)", "L�y trang b� - h� y (nP nS nB nE nLv1 nOpt1 nLv2 nOpt 2 nLv3 nOpt3)"));
        tinsert(tbSay, format("%s/#_wgm_AddItem(5)", "L�y trang b� - nh�n (nP nS nB nE nLv1 nOpt1 nLv2 nOpt 2 nLv3 nOpt3)"));
        tinsert(tbSay, format("%s/#_wgm_AddItem(6)", "L�y trang b� - v� kh� (nD nP nS nB nE nLv1 nOpt1 nLv2 nOpt 2 nLv3 nOpt3)"));
        tinsert(tbSay, format("%s/#_wgm_AddItem(7)", "L�y ng�a (nP nS nB)"));

        tinsert(tbSay, g_szSpaceLine);
        --tinsert(tbSay, "<<  Tr� l�i GM Item/_wgm_OpenMenu");
        tinsert(tbSay, "[x] ��ng/nothing");
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
                WPlayer:Msg("L�i c� ph�p, �t nh�t c� 3 gi� tr� l� s� truy�n v�o: nG nD nP");
                WPlayer:Msg("Th� t� m�: nG nD nP nStack nBind nEnhance");
                WPlayer:Msg("Ho�c: nG nD nP nStack nBind nEnhance nOptLv1 nOptId1 nOptLv2 nOptId2 nOptLv3 nOptId3");
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
                WPlayer:Msg("L�i c� ph�p, �t nh�t c� 1 gi� tr� l� s� truy�n v�o: nP");
                WPlayer:Msg("Th� t� m�: nP nStack nBind nEnhance");
                WPlayer:Msg("Ho�c: nP nStack nBind nEnhance nOptLv1 nOptId1 nOptLv2 nOptId2 nOptLv3 nOptId3");
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
                WPlayer:Msg("L�i c� ph�p, �t nh�t c� 2 gi� tr� l� s� truy�n v�o: nD nP");
                WPlayer:Msg("Th� t� m�: nD nP nStack nBind nEnhance");
                WPlayer:Msg("Ho�c: nD nP nStack nBind nEnhance nOptLv1 nOptId1 nOptLv2 nOptId2 nOptLv3 nOptId3");
                _wgm_AddItem(nType);
                return WEnv.RETCODE_ERROR;
            end

            nParamOffet = 1;

            nG = ITEM_G_EQUIP;
            nD = tonumber(tbParam[2 - nParamOffet]) or 0;
            nP = tonumber(tbParam[3 - nParamOffet]) or 0;

            if nD < 0 or nD > 14 then
                WPlayer:Msg("L�i c� ph�p, nD l� s� gi� tr� t� 0-14");
                WPlayer:Msg("Th� t� m�: nD nP nStack nBind nEnhance");
                WPlayer:Msg("Ho�c: nD nP nStack nBind nEnhance nOptLv1 nOptId1 nOptLv2 nOptId2 nOptLv3 nOptId3");
                _wgm_AddItem(nType);
                return WEnv.RETCODE_ERROR;
            end
        end

        if nType == 7 then
            if getn(tbParam) < 1 then
                WPlayer:Msg("L�i c� ph�p, �t nh�t c� 1 gi� tr� l� s� truy�n v�o: nP");
                WPlayer:Msg("Th� t� m�: nP nStack nBind");
                WPlayer:Msg("Ho�c: nP nStack nBind 0 nOptLv1 nOptId1 nOptLv2 nOptId2 nOptLv3 nOptId3");
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
            WPlayer:Msg("L�i c� ph�p, gi� tr� nP <= 0");
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
        WGMLog:WriteExeCmdLog("_wgm_AddItem", "Add v�t ph�m t� gm", "WAward:Give", WItem:GetName(nG, nD, nP), szParam, nRetCode)
    end
end

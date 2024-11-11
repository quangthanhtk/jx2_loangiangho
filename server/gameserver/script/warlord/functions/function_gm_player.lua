----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-10
--- Description: c�c h�m gm li�n quan ��n player
----------------------------------------------------------------------------------------------------
--- H�m g�i ch�nh m� t�m nh�n v�t
function _wgm_player_FindPlayerByName(szFindPlayerName)
    if szFindPlayerName == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Nh�p t�n ng��i ch�i", 1, 42, 0, _wgm_player_FindPlayerByName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    --szFindPlayerName = gsub(szFindPlayerName or "", "[%p%c%s]", ""); -- c�i n�y kh�ng t�m �c � li�n server v� c� d�u *
    szFindPlayerName = WLib:Replace(WLib:Replace(szFindPlayerName, " ", ""), "/", "");
    if szFindPlayerName == "" then
        WNpc:Talk("T�n nh�n v�t tr�ng!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_LoadPlayerInfo", WEnv.NULL, WEnv.TRUE);
    return WEnv.RETCODE_SUCCESS;
end
----------------------------------------------------------------------------------------------------
--- M� menu x� l� nh�n v�t
function _wgm_player_LoadPlayerInfo(szSenderName, ...)
    local szLastLoginIP, szCurrentLoginIP = WPlayer:GetLoginIP();
    local szLastLoginMAC, szCurrentLoginMAC = WPlayer:GetLoginMAC();
    local nMapId, nPosX, nPosY = WPlayer:GetWorldPos();
    local nPKState, nPKCamp = GetPKFlag();
    local tbPlayerInfo = {
        [1] = szSenderName,
        [2] = WPlayer:GetAccount(),
        [3] = WPlayer:GetName(),
        [4] = WPlayer:GetTongName(),
        [5] = WPlayer:GetSex(),
        [6] = WPlayer:GetBody(),
        [7] = WPlayer:GetBigLevel(),
        [8] = WPlayer:GetExp(),
        [9] = WPlayer:GetRoute(),
        [10] = WLib:GetGSIndex(),
        [11] = GetMapName(nMapId),
        [12] = nMapId,
        [13] = nPosX,
        [14] = nPosY,
        [15] = szLastLoginIP,
        [16] = szCurrentLoginIP,
        [17] = szLastLoginMAC,
        [18] = szCurrentLoginMAC,
        [19] = WItem:CountAll(2, 1, 40039), -- gm item
        [20] = GetGoldCoin() + BigGetItemCount(2, 1, 30230) + (BigGetItemCount(2, 1, 199) * 100) + (BigGetItemCount(2, 1, 30490) * 1000),
        [21] = GetVipJinJuan() + BigGetItemCount(2, 1, 60018) + (BigGetItemCount(2, 1, 60019) * 100),
        [22] = floor((GetSaveMoney() + GetCash()) / 10000) + (BigGetItemCount(2, 1, 539) * 999) + (BigGetItemCount(2, 1, 537) * 360) + (BigGetItemCount(2, 1, 30229) * 4000),
        [23] = WTask:GetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_NEWBIE),
        [24] = WTask:GetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_CAMLOGIN),
        [25] = WTask:GetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_CAMCHAT),
        [26] = WTask:GetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_BATGIAM),
        [27] = WTask:GetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_UNUSE),
        [28] = WTask:GetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_UNUSE),
        [29] = WTask:GetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_UNUSE),
        [30] = IsPlayerDeath(),
        [31] = IsOfflineLive(),
        [32] = IsStalling(),
        [33] = IsGathering(),
        [34] = IsReading(),
        [35] = IsTraining(),
        [36] = IsSleeping(),
        [37] = IsDoingSomething(),
        [38] = GetReputation(),
        [39] = WTask:Get(336), -- s� m�n
        [40] = WTask:Get(701), -- qu�n c�ng
        [41] = WTask:Get(707), -- t�ch l�y
        [42] = WTask:Get(704), -- qu�n h�m
        [43] = GetCreateTime(),
        [44] = GetFightState(),
        [45] = nPKState,
        [46] = nPKCamp,
        [47] = GetPKEnmityState(),
        [48] = mod(WTask:Get(TSK_LUCKY_STAR_201011), 100),
        [49] = WTask:Get(VET_201003_01_TASK_USE_BAOHE_COUNT),
    };

    _wgm_SendPackage(szSenderName, WEnv.NULL, "_wgm_player_ShowPlayerProcessMenu", tbPlayerInfo);
end
function _wgm_player_GetInfoString(tbPlayerInfo, bShowFull)
    if getn(tbPlayerInfo) < 47 then
        return "";
    end

    bShowFull = bShowFull or WEnv.FALSE;

    local szAccount = tbPlayerInfo[2];
    local szPlayerName = tbPlayerInfo[3];
    local szTongName = tbPlayerInfo[4];
    local nSex = tbPlayerInfo[5];
    local nBody = tbPlayerInfo[6];
    local nBigLevel = tbPlayerInfo[7];
    local nExp = tbPlayerInfo[8];
    local nRoute = tbPlayerInfo[9];
    local nGSIndex = tbPlayerInfo[10];
    local szMapName = tbPlayerInfo[11];
    local nMapId = tbPlayerInfo[12];
    local nPosX = tbPlayerInfo[13];
    local nPosY = tbPlayerInfo[14];
    local szCurrentLoginIP = tbPlayerInfo[16];
    local szCurrentLoginMAC = tbPlayerInfo[18];
    local nGMItemCount = tbPlayerInfo[19];
    local nGoldCoin = tbPlayerInfo[20];
    local nGold = tbPlayerInfo[22];
    local bIsForbitLogin = tbPlayerInfo[24];
    local bIsForbitChat = tbPlayerInfo[25];
    local bIsPrision = tbPlayerInfo[26];
    local bIsDeath = tbPlayerInfo[30];
    local bIsOffliveLive = tbPlayerInfo[31];
    local bIsStalling = tbPlayerInfo[32];
    local bIsGathering = tbPlayerInfo[33];
    local bIsReading = tbPlayerInfo[34];
    local bIsSleeping = tbPlayerInfo[36];
    local nDanhVong = tbPlayerInfo[38];
    local nSuMon = tbPlayerInfo[39];
    local nQuanCong = tbPlayerInfo[40];
    local nTichLuyCT = tbPlayerInfo[41];
    local nQuanHam = tbPlayerInfo[42];
    local nCreateTime = tbPlayerInfo[43];
    local nFightState = tbPlayerInfo[44];
    local nPKState = tbPlayerInfo[45];
    local nPKCamp = tbPlayerInfo[46];
    local nPKEnmityState = tbPlayerInfo[47];
    local nNSMMUseCount = tbPlayerInfo[48];
    local nNuOaUseCount = tbPlayerInfo[49];

    local szBodyName = {
        [0] = "unknow",
        [1] = "Ti�u chu�n",
        [2] = "Kh�i ng�",
        [3] = "Ki�u n�",
        [4] = "G�i c�m",
    };

    local tbDoingInfo = {};
    if bIsOffliveLive == 1 then
        tinsert(tbDoingInfo, "�y th�c");
    else
        tinsert(tbDoingInfo, "online");
    end
    if bIsSleeping == 1 then
        tinsert(tbDoingInfo, "ng�");
    end
    if bIsDeath == 1 then
        tinsert(tbDoingInfo, "�� ch�t");
    end
    if bIsStalling == 1 then
        tinsert(tbDoingInfo, "b�y b�n");
    end
    if bIsGathering == 1 then
        tinsert(tbDoingInfo, "thu th�p");
    end
    if bIsReading == 1 then
        tinsert(tbDoingInfo, "luy�n s�ch");
    end
    if nFightState == 1 then
        tinsert(tbDoingInfo, "chi�n ��u");
    else
        tinsert(tbDoingInfo, "phi chi�n ��u");
    end
    if nPKState == 1 then
        if nPKCamp == 0 then
            tinsert(tbDoingInfo, "PK1");
        end
        if nPKCamp == 1 then
            tinsert(tbDoingInfo, "PK2");
        end
        if nPKCamp == 2 then
            tinsert(tbDoingInfo, "PK3");
        end
        if nPKCamp == 3 then
            tinsert(tbDoingInfo, "PK Bang");
        end
    end
    if nPKEnmityState == 1 then
        tinsert(tbDoingInfo, "t� v�");
    end

    local tbQuanHam = {
        [1] = "Binh s�",
        [2] = "Hi�u �y",
        [3] = "�� th�ng",
        [4] = "Ti�n phong",
        [5] = "T��ng qu�n",
        [6] = "Nguy�n so�i",
    };
    local szCampCT = "Ch�a";
    if nQuanCong > 0 then
        szCampCT = "T�ng";
    elseif nQuanCong < 0 then
        szCampCT = "Li�u";
    end

    local nCreateYear, nCreateMonth, nCreateDay, nCreateHour, nCreateMinute, nCreateSecond = GmTime(nCreateTime);
    if szTongName == "" then
        szTongName = "Ch�a gia nh�p";
    end

    -- ch� admin ho�c superadmin m�i c� th� th�y ���c m�t s� th�ng tin quan tr�ng
    local szSayHeader = "";
    if WPlayer:IsSuperAdmin() == WEnv.TRUE or WPlayer:IsAdmin() == WEnv.TRUE then
        -- admin kh�ng th� xem ���c tk c�a superadmin
        if WPlayer:IsSuperAdmin(szAccount) == WEnv.TRUE and WPlayer:IsAdmin() == WEnv.TRUE then
            szAccount = "unknow";
        end
        if nGMItemCount > 0 then
            szAccount = "{r" .. szAccount
            szPlayerName = "{r" .. szPlayerName
        else
            szAccount = "{y" .. szAccount
            szPlayerName = "{y" .. szPlayerName
        end

        szSayHeader = format("%s %s %s \n" ..
                "%s %s %s \n" ..
                "%s %s %s \n" ..
                "%s \n" ..
                "%s %s ",
                WLib:Align("}Acc:    " .. szAccount .. "", 34, 1), WLib:Align("}Coin:  {y" .. WLib:MoneyFormat(nGoldCoin) .. " xu", 28, 1), WLib:Align("}IP:     {y" .. szCurrentLoginIP .. "", 28, 1),
                WLib:Align("}Role:   " .. szPlayerName .. "", 34, 1), WLib:Align("}Gold:  {y" .. WLib:MoneyFormat(nGold) .. " v", 28, 1), WLib:Align("}MAC:    {y" .. szCurrentLoginMAC .. "", 28, 1),
                WLib:Align("}Body:   {g" .. szBodyName[nBody] .. "", 34, 1), WLib:Align("}Level: {g" .. nBigLevel .. "", 28, 1), WLib:Align("}Route:  {g" .. WPlayer:GetRouteName(nRoute) .. "", 28, 1),
                WLib:Align("}Pos:    {g" .. szMapName .. " (" .. (floor(nPosX / 8)) .. "," .. (floor(nPosY / 16)) .. ")} - {gGS_" .. nGSIndex .. "}/{g" .. nMapId .. "}/{g" .. nPosX .. "}/{g" .. nPosY .. "", 89, 1),
                WLib:Align("}Create: {g" .. nCreateYear .. "-" .. nCreateMonth .. "-" .. nCreateDay .. " " .. nCreateHour .. ":" .. nCreateMinute .. ":" .. nCreateSecond .. "", 31, 1), "}State: {g" .. WLib:Join(tbDoingInfo, " - ") .. "");
    else
        if nGMItemCount > 0 then
            szPlayerName = "{r" .. szPlayerName
        else
            szPlayerName = "{y" .. szPlayerName
        end

        szSayHeader = format("%s %s %s \n" ..
                "%s \n" ..
                "%s %s ",
                WLib:Align("}Role:   " .. szPlayerName .. "", 34, 1), WLib:Align("}Level: {g" .. nBigLevel .. "", 28, 1), WLib:Align("}Route:  {g" .. WPlayer:GetRouteName(nRoute) .. "", 28, 1),
                WLib:Align("}Pos:    {g" .. szMapName .. " (" .. (floor(nPosX / 8)) .. "," .. (floor(nPosY / 16)) .. ")} - {gGS_" .. nGSIndex .. "}/{g" .. nMapId .. "}/{g" .. nPosX .. "}/{g" .. nPosY .. "", 89, 1),
                WLib:Align("}Create: {g" .. nCreateYear .. "-" .. nCreateMonth .. "-" .. nCreateDay .. " " .. nCreateHour .. ":" .. nCreateMinute .. ":" .. nCreateSecond .. "", 31, 1), "}State: {g" .. WLib:Join(tbDoingInfo, " - ") .. "");
    end

    if bShowFull == WEnv.TRUE then
        local szExtendHeader = format(" %s  " ..
                "%s  %s  %s  " ..
                "%s  %s  %s  " ..
                "%s  %s  ",
                "}Kinh nghi�m: {g" .. WLib:MoneyFormat(nExp) .. " �",
                "}Danh v�ng: {g" .. WLib:MoneyFormat(nDanhVong) .. " �", "}S� m�n: {g" .. WLib:MoneyFormat(nSuMon) .. " �", "}Bang h�i: {g" .. szTongName .. "",
                "}T�ch l�y CT: {g" .. WLib:MoneyFormat(nTichLuyCT) .. " �", "}Qu�n c�ng: {g" .. WLib:MoneyFormat(nQuanCong) .. " �", "}Qu�n H�m: {g" .. szCampCT .. "-" .. tbQuanHam[abs(nQuanHam)] .. "",
                "}Ng�i Sao MM: {g" .. WLib:MoneyFormat(nNSMMUseCount) .. " c", "}N� Oa BH: {g" .. WLib:MoneyFormat(nNuOaUseCount) .. " c");

        szSayHeader = szSayHeader .. szExtendHeader;
    end
    return WLib:ConvertColorString(szSayHeader);
end
function _wgm_player_ShowPlayerProcessMenu(szSenderName, ...)
    local tbPlayerInfo = arg;
    if getn(arg) == 0 then
        tbPlayerInfo = WPlayer:GetUserData("_wgm_player_ShowPlayerProcessMenu");
    end
    local szSayHeader = _wgm_player_GetInfoString(tbPlayerInfo, WEnv.FALSE);
    if tbPlayerInfo == WEnv.NULL or szSayHeader == "" then
        -- ki�m tra d� li�u
        return WEnv.RETCODE_ERROR;
    end

    WPlayer:SetUserData("_wgm_player_ShowPlayerProcessMenu", tbPlayerInfo);
    local szOriginalSenderName = tbPlayerInfo[1];
    if szOriginalSenderName ~= WPlayer:GetName() then
        -- do h�m n�y ch�y qua 2 h�m send package, c� th� s� sai d� li�u n�n c�n ki�m tra ng��i g�i g�c
        return WEnv.RETCODE_ERROR;
    end
    if _wgm_IsHaveAccessFunction("_wgm_player_ShowPlayerProcessMenu") == WEnv.FALSE then
        -- ki�m tra c� quy�n s� d�ng h�m n�y m�i cho m�
        return WEnv.RETCODE_ERROR;
    end

    local szFindPlayerName = tbPlayerInfo[3];
    local nMapId = tbPlayerInfo[12];
    local nPosX = tbPlayerInfo[13];
    local nPosY = tbPlayerInfo[14];
    local szCurrentLoginMAC = tbPlayerInfo[18];
    local bIsForbitLogin = tbPlayerInfo[24];
    local bIsForbitChat = tbPlayerInfo[25];
    local bIsPrision = tbPlayerInfo[26];
    local bIsOffline = tbPlayerInfo[31];
    local nFightState = tbPlayerInfo[44];

    local tbSay = { szSayHeader };
    _wgm_InsertSay(tbSay, "_wgm_player_FindPlayerByName", "T�m nh�n v�t kh�c theo t�n/_wgm_player_FindPlayerByName");

    tinsert(tbSay, g_szSpaceLine);
    --_wgm_InsertSay(tbSay, "_wgm_player_ShowPlayerProcessMenu", format("Xem chi ti�t nh�n v�t n�y/#_wgm_player_ShowPlayerProcessMenu(%q, 1)", szFindPlayerName));

    if WPlayer:GetName() ~= szFindPlayerName then
        -- M� ch�nh b�n th�n th� kh�ng s� d�ng ���c m�t s� h�m sau
        _wgm_InsertSay(tbSay, "_wgm_player_JumpToPlayer", format("Nh�y ��n v� tr� ng��i ch�i/#_wgm_SafeNewWorld(%d, %d, %d, 1)", nMapId, nPosX, nPosY));
        _wgm_InsertSay(tbSay, "_wgm_player_MovePlayerToHere", format("D�ch chuy�n ng��i ch�i ��n.../#_wgm_player_MovePlayerToHere(%q)", szFindPlayerName));

        if bIsOffline == 1 then
            _wgm_InsertSay(tbSay, "_wgm_player_ForceClearBCH", format("Kick nh�n v�t �� �y th�c (x�a th�i gian BCH)/#_wgm_player_ForceClearBCH(%q)", szFindPlayerName));
        else
            _wgm_InsertSay(tbSay, "_wgm_player_KickoutGame", format("Kick nh�n v�t ra kh�i game/#_wgm_player_KickoutGame(%q)", szFindPlayerName));
        end
        _wgm_InsertSay(tbSay, "_wgm_player_LockAccount", format("Kh�a t�i kho�n v� k�ch kh�i game/#_wgm_player_LockAccount(%q)", szFindPlayerName));
        _wgm_InsertSay(tbSay, "_wgm_player_BanMac", format("C�m ��ng nh�p v� kick c�c nh�n v�t li�n quan/#_wgm_player_BanMac(%q)", szFindPlayerName));
        _wgm_InsertSay(tbSay, "_wgm_player_BanMac", format("L�y ��a ch� mac/#AskClientForString(\"nothing\", %q, 1, 32, \"B�m Ctrl+C copy\")", szCurrentLoginMAC));

        if nMapId >= 881 and nMapId <= 884 then
            -- Ki�m tra trong map chi�n tr��ng
            _wgm_InsertSay(tbSay, "_wgm_player_KickoutBattle", format("Kick kh�i chi�n tr��ng/#_wgm_player_KickoutBattle(%q)", szFindPlayerName));
        end
    end
    _wgm_InsertSay(tbSay, "_wgm_player_ResetBattle", format("Reset ��ng k� chi�n tr��ng/#_wgm_player_ResetBattle(%q)", szFindPlayerName));

    if bIsForbitChat == 1 then
        _wgm_InsertSay(tbSay, "_wgm_player_ForbitChat", format("M� chat (c�n %d)/#_wgm_player_ForbitChat(%q, 0)", WTask:Get(WTASKID_PLAYERSTATE_CAMCHAT_REMAINING), szFindPlayerName));
    else
        _wgm_InsertSay(tbSay, "_wgm_player_ForbitChat", format("C�m chat/#_wgm_player_ForbitChat(%q, 1)", szFindPlayerName));
    end
    --if bIsPrision == 1 then -- chua co ham bat giam
    --    _wgm_InsertSay(tbSay, "_wgm_player_ArrestPlayer", format("Th� t� do (c�n %d)/#_wgm_player_ArrestPlayer(%q, 0)", WTask:Get(WTASKID_PLAYERSTATE_BATGIAM_REMAINING), szFindPlayerName));
    --else
    --    _wgm_InsertSay(tbSay, "_wgm_player_ArrestPlayer", format("B�t giam/#_wgm_player_ArrestPlayer(%q, 1)", szFindPlayerName));
    --end
    if nFightState == 1 then
        _wgm_InsertSay(tbSay, "_wgm_player_SetFightState", format("��a nh�n v�t v� tr�ng th�i phi chi�n ��u/#_wgm_player_SetFightState(%q, 0)", szFindPlayerName));
    else
        _wgm_InsertSay(tbSay, "_wgm_player_SetFightState", format("��a nh�n v�t v� tr�ng th�i chi�n ��u/#_wgm_player_SetFightState(%q, 1)", szFindPlayerName));
    end

    tinsert(tbSay, g_szSpaceLine);
    _wgm_InsertSay(tbSay, "_wgm_player_TempUnlockBox", format("M� kh�a r��ng �� t�m th�i/#_wgm_player_TempUnlockBox(%q)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_ClearBoxPassword", format("X�a m� m� r��ng ��/#_wgm_player_ClearBoxPassword(%q)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_ClearItemPassword", format("X�a m� m� kh�a trang b�/#_wgm_player_ClearItemPassword(%q)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_LoadPlayerTask", format("Qu�n l� task nh�n v�t/#_wgm_player_LoadPlayerTask(%q)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_AddItem", format("Th�m v�t ph�m/#_wgm_player_AddItem(%q)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_SavePlayerData", format("L�u d� li�u nh�n v�t/#_wgm_player_SavePlayerData(%q)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_ModifyGold", format("�i�u ch�nh v�ng c�a nh�n v�t/#_wgm_player_ModifyGold(%q)", szFindPlayerName));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] T�m th�i ch�a c�n x� l�./nothing");
    WNpc:SayDialog(tbSay);
end
----------------------------------------------------------------------------------------------------
--- M� menu x� l� task nh�n v�t
function _wgm_player_LoadPlayerTask(szFindPlayerName)
    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_LoadPlayerTask_OnTarget", WEnv.NULL, WEnv.TRUE);
    return WEnv.RETCODE_SUCCESS;
end
function _wgm_player_LoadPlayerTask_OnTarget(szSenderName, ...)
    local szLastLoginIP, szCurrentLoginIP = WPlayer:GetLoginIP();
    local szLastLoginMAC, szCurrentLoginMAC = WPlayer:GetLoginMAC();
    local nMapId, nPosX, nPosY = WPlayer:GetWorldPos();
    local tbPlayerInfo = {
        [1] = szSenderName,
        [2] = WPlayer:GetAccount(),
        [3] = WPlayer:GetName(),
        [4] = WPlayer:GetTongName(),
        [5] = WPlayer:GetSex(),
        [6] = WPlayer:GetBody(),
        [7] = WPlayer:GetBigLevel(),
        [8] = WPlayer:GetExp(),
        [9] = WPlayer:GetRoute(),
        [10] = GetReputation(),
        [11] = WTask:Get(336), -- s� m�n
        [12] = WTask:Get(701), -- qu�n c�ng
        [13] = WTask:Get(707), -- t�ch l�y
        [14] = WTask:Get(704), -- qu�n h�m
        [15] = WTask:Get(3470), -- ��i Hi�p L�nh: taskbit nh�n th��ng ti�u hao TKL
        [16] = WTask:Get(TASKID_WORLD_BOSS_USE), -- WorldBoss: taskbit  m� r��ng
        [17] = WTask:Get(TASKID_BOOK_POPUR2), -- Ti�n c�p m�t t�ch: �i�m l�ch luy�n
        [18] = WTask:Get(TASKID_BOOK_POPUR2_TOTAL), -- Ti�n c�p m�t t�ch: t�ng �i�m l�ch luy�n
        [19] = WTask:Get(TASKID_EVENT_MONTHLY_ITEM1), -- Monthly Event: t�ng s� item 1 �� d�ng
        [20] = WTask:Get(TASKID_EVENT_MONTHLY_ITEM2), -- Monthly Event: t�ng s� item 2 �� d�ng
        [21] = WTask:Get(TASKID_EVENT_MONTHLY_ITEM3), -- Monthly Event: t�ng s� item 3 �� d�ng
        [22] = WTask:GetBit(TASKID_EVENT_MONTHLY_ACCUMULATE, TASKID_EVENT_MONTHLY_BIT_ACCUMULATE1), -- Monthly Event: tr�ng th�i �� nh�n max item 1
        [23] = WTask:GetBit(TASKID_EVENT_MONTHLY_ACCUMULATE, TASKID_EVENT_MONTHLY_BIT_ACCUMULATE2), -- Monthly Event: tr�ng th�i �� nh�n max item 2
        [24] = WTask:GetBit(TASKID_EVENT_MONTHLY_ACCUMULATE, TASKID_EVENT_MONTHLY_BIT_ACCUMULATE2), -- Monthly Event: tr�ng th�i �� nh�n max item 3
        [25] = mod(WTask:Get(TSK_LUCKY_STAR_201011), 100),
        [26] = WTask:Get(VET_201003_01_TASK_USE_BAOHE_COUNT),
    };

    _wgm_SendPackage(szSenderName, WEnv.NULL, "_wgm_player_ShowPlayerTaskMenu", tbPlayerInfo);
end
function _wgm_player_GetTaskInfoString(tbPlayerInfo, bShowFull)
    if getn(tbPlayerInfo) < 21 then
        return "";
    end

    bShowFull = bShowFull or WEnv.FALSE;

    local szAccount = tbPlayerInfo[2];
    local szPlayerName = tbPlayerInfo[3];
    local szTongName = tbPlayerInfo[4];
    local nSex = tbPlayerInfo[5];
    local nBody = tbPlayerInfo[6];
    local nBigLevel = tbPlayerInfo[7];
    local nExp = tbPlayerInfo[8];
    local nRoute = tbPlayerInfo[9];
    local nDanhVong = tbPlayerInfo[10];
    local nSuMon = tbPlayerInfo[11];
    local nQuanCong = tbPlayerInfo[12];
    local nTichLuyCT = tbPlayerInfo[13];
    local nQuanHam = tbPlayerInfo[14];
    local nDaiHiepLenh = tbPlayerInfo[15];
    local nWorldBoss = tbPlayerInfo[16];
    local nLichLuyen = tbPlayerInfo[17];
    local nLichLuyenTotal = tbPlayerInfo[18];
    local nNSMMUseCount = tbPlayerInfo[25];
    local nNuOaUseCount = tbPlayerInfo[26];

    local szBodyName = {
        [0] = "unknow",
        [1] = "Ti�u chu�n",
        [2] = "Kh�i ng�",
        [3] = "Ki�u n�",
        [4] = "G�i c�m",
    };

    local tbQuanHam = {
        [1] = "Binh s�",
        [2] = "Hi�u �y",
        [3] = "�� th�ng",
        [4] = "Ti�n phong",
        [5] = "T��ng qu�n",
        [6] = "Nguy�n so�i",
    };
    local szCampCT = "Ch�a";
    if nQuanCong > 0 then
        szCampCT = "T�ng";
    elseif nQuanCong < 0 then
        szCampCT = "Li�u";
    end

    if szTongName == "" then
        szTongName = "Ch�a gia nh�p";
    end

    -- ch� admin ho�c superadmin m�i c� th� th�y ���c m�t s� th�ng tin quan tr�ng
    local szSayHeader = "";
    if WPlayer:IsSuperAdmin() == WEnv.TRUE or WPlayer:IsAdmin() == WEnv.TRUE then
        -- admin kh�ng th� xem ���c tk c�a superadmin
        if WPlayer:IsSuperAdmin(szAccount) == WEnv.TRUE and WPlayer:IsAdmin() == WEnv.TRUE then
            szAccount = "unknow";
        end

        szSayHeader = format("%s %s %s \n" ..
                "%s %s ",
                WLib:Align("}Acc:    {y" .. szAccount .. "", 31, 1), WLib:Align("}Level: {g" .. nBigLevel .. "", 28, 1), WLib:Align("}Route:  {g" .. WPlayer:GetRouteName(nRoute) .. "", 30, 1),
                WLib:Align("}Role:   {y" .. szPlayerName .. "", 31, 1), WLib:Align("}Body:  {g" .. szBodyName[nBody] .. "", 28, 1));
    else
        szSayHeader = format("%s %s %s \n" ..
                "%s ",
                WLib:Align("}Role:   {y" .. szPlayerName .. "", 31, 1), WLib:Align("}Level: {g" .. nBigLevel .. "", 28, 1), WLib:Align("}Route:  {g" .. WPlayer:GetRouteName(nRoute) .. "", 30, 1),
                WLib:Align("}Body:   {g" .. szBodyName[nBody] .. "", 31, 1));
    end

    if bShowFull == WEnv.TRUE then
        local szExtendHeader = format("\n%s  " ..
                "%s  %s  %s  " ..
                "%s  %s  %s  " ..
                "%s  %s  ",
                "}Kinh nghi�m: {g" .. WLib:MoneyFormat(nExp) .. " �",
                "}Danh v�ng: {g" .. WLib:MoneyFormat(nDanhVong) .. " �", "}S� m�n: {g" .. WLib:MoneyFormat(nSuMon) .. " �", "}Bang h�i: {g" .. szTongName .. "",
                "}T�ch l�y CT: {g" .. WLib:MoneyFormat(nTichLuyCT) .. " �", "}Qu�n c�ng: {g" .. WLib:MoneyFormat(nQuanCong) .. " �", "}Qu�n H�m: {g" .. szCampCT .. "-" .. tbQuanHam[abs(nQuanHam)] .. "",
                "}Ng�i Sao MM: {g" .. WLib:MoneyFormat(nNSMMUseCount) .. " c", "}N� Oa BH: {g" .. WLib:MoneyFormat(nNuOaUseCount) .. " c");

        szSayHeader = szSayHeader .. szExtendHeader;
    end
    return WLib:ConvertColorString(szSayHeader);
end
function _wgm_player_ShowPlayerTaskMenu(szSenderName, ...)
    local tbPlayerInfo = arg;
    if getn(arg) == 0 then
        tbPlayerInfo = WPlayer:GetUserData("_wgm_player_ShowPlayerTaskMenu");
    end
    local szSayHeader = _wgm_player_GetTaskInfoString(tbPlayerInfo, WEnv.TRUE);
    if tbPlayerInfo == WEnv.NULL or szSayHeader == "" then
        -- ki�m tra d� li�u
        return WEnv.RETCODE_ERROR;
    end

    WPlayer:SetUserData("_wgm_player_ShowPlayerTaskMenu", tbPlayerInfo);
    local szOriginalSenderName = tbPlayerInfo[1];
    if szOriginalSenderName ~= WPlayer:GetName() then
        -- do h�m n�y ch�y qua 2 h�m send package, c� th� s� sai d� li�u n�n c�n ki�m tra ng��i g�i g�c
        return WEnv.RETCODE_ERROR;
    end
    if _wgm_IsHaveAccessFunction("_wgm_player_ShowPlayerTaskMenu") == WEnv.FALSE then
        -- ki�m tra c� quy�n s� d�ng h�m n�y m�i cho m�
        return WEnv.RETCODE_ERROR;
    end

    local szFindPlayerName = tbPlayerInfo[3];
    local nDaiHiepLenh = tbPlayerInfo[15];
    local nWorldBoss = tbPlayerInfo[16];
    local nLichLuyen = tbPlayerInfo[17];
    local nLichLuyenTotal = tbPlayerInfo[18];
    local nMonthlyEventUseItem1 = tbPlayerInfo[19];
    local nMonthlyEventUseItem2 = tbPlayerInfo[20];
    local nMonthlyEventUseItem3 = tbPlayerInfo[21];
    local nMonthlyEventMaxAward1 = tbPlayerInfo[22];
    local nMonthlyEventMaxAward2 = tbPlayerInfo[23];
    local nMonthlyEventMaxAward3 = tbPlayerInfo[24];

    local tbSay = { szSayHeader };
    _wgm_InsertSay(tbSay, "_wgm_player_ModifyDaiHiepLenh", format("�i�u ch�nh ��i Hi�p L�nh (nTaskValue=%d)/#_wgm_player_ModifyDaiHiepLenh(%q, %d)", nDaiHiepLenh, szFindPlayerName, nDaiHiepLenh));
    _wgm_InsertSay(tbSay, "_wgm_player_ModifyWorldBoss", format("�i�u ch�nh Boss th� gi�i (nTaskValue=%d)/#_wgm_player_ModifyWorldBoss(%q, %d)", nWorldBoss, szFindPlayerName, nWorldBoss));
    _wgm_InsertSay(tbSay, "_wgm_player_ModifyPopur2", format("�i�u ch�nh �i�m L�ch Luy�n (nCurPopu2=%d/nTotalPopur2=%d)/#_wgm_player_ModifyPopur2(%q, %d)", nLichLuyen, nLichLuyenTotal, szFindPlayerName, nLichLuyen));
    _wgm_InsertSay(tbSay, "_wgm_player_ModifyMonthlyEvent", format("�i�u ch�nh event h�ng th�ng (e1=%d:%d, e2=%d:%d, e3=%d:%d)/#_wgm_player_ModifyMonthlyEvent(%q, %d)", nMonthlyEventUseItem1, nMonthlyEventMaxAward1, nMonthlyEventUseItem2, nMonthlyEventMaxAward2, nMonthlyEventUseItem3, nMonthlyEventMaxAward3, szFindPlayerName, 0));
    --_wgm_InsertSay(tbSay, "_wgm_player_SetTask", format("Phong l�i qu�n h�m t��ng t�ng/#_wgm_player_SetTask(%q, 704, 5, 0)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_SetTask", format("Set task/#_wgm_player_SetTask(%q)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_SetTaskBit", format("Set task bit/#_wgm_player_SetTaskBit(%q)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_SetTaskByte", format("Set task byte/#_wgm_player_SetTaskByte(%q)", szFindPlayerName));

    tinsert(tbSay, g_szSpaceLine);
    _wgm_InsertSay(tbSay, "_wgm_player_ShowPlayerProcessMenu", format("<<  Tr� l�i qu�n l� nh�n v�t/#_wgm_player_ShowPlayerProcessMenu(%q)", WPlayer:GetName()));

    tinsert(tbSay, "[x] T�m th�i ch�a c�n x� l�./nothing");
    WNpc:SayDialog(tbSay);
end
----------------------------------------------------------------------------------------------------
--- C�c h�m x� l� task m�c ��nh
function _wgm_player_SetTask(szFindPlayerName, nTaskID, nValue, nAccessCode, szMsg)
    if nTaskID == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "nTaskId nVal nAccess", 1, 32, 0, _wgm_player_SetTask, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if type(nTaskID) == "string" then
        local tbInputData = WLib:Split(nTaskID, " ");

        nTaskID = tonumber(tbInputData[1]) or 0;
        nValue = tonumber(tbInputData[2]) or 0;
        nAccessCode = tonumber(tbInputData[3]) or 0;
    else
        nTaskID = tonumber(nTaskID) or 0;
        nValue = tonumber(nValue) or 0;
        nAccessCode = tonumber(nAccessCode) or 0;
    end


    if nTaskID == 0 then
        return 0;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 1, _wgm_player_SetTask, szFindPlayerName, nTaskID, nValue, nAccessCode);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_SetTask_OnTarget", { szMsg, nTaskID, nValue, nAccessCode });
end
function _wgm_player_SetTask_OnTarget(szSenderName, szMsg, nTaskID, nValue, nAccessCode)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    nAccessCode = nAccessCode or 0;
    local nBeforeValue = WTask:Get(nTaskID);
    nRetCode = WTask:Set(nTaskID, nValue, nAccessCode);
    local nAfterValue = WTask:Get(nTaskID);
    WGMLog:WriteRevCmdLog("_wgm_player_SetTask", "Set task nh�n v�t", "_wgm_player_SetTask_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nTaskID, nValue, nAccessCode, nBeforeValue, nAfterValue }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Set task nTaskID=%d nValue=%d nAccessCode=%d nNewValue=%d th�nh c�ng!", nTaskID, nValue, nAccessCode, WTask:Get(nTaskID)) });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Set task nTaskID=%d nValue=%d nAccessCode=%d nNewValue=%d th�t b�i!", nTaskID, nValue, nAccessCode, WTask:Get(nTaskID)) });
    end
    return nRetCode;
end
function _wgm_player_ModifyTask_OnTarget(szSenderName, szMsg, nTaskID, nValue, nAccessCode)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    nAccessCode = nAccessCode or 0;
    local nBeforeValue = WTask:Get(nTaskID);
    nRetCode = WTask:Modify(nTaskID, nValue, nAccessCode);
    local nAfterValue = WTask:Get(nTaskID);
    WGMLog:WriteRevCmdLog("_wgm_player_ModifyTask", "Modify task nh�n v�t", "_wgm_player_ModifyTask_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nTaskID, nValue, nAccessCode, nBeforeValue, nAfterValue }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Modify task nTaskID=%d nValue=%d nAccessCode=%d nNewValue=%d th�nh c�ng!", nTaskID, nValue, nAccessCode, WTask:Get(nTaskID)) });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Modify task nTaskID=%d nValue=%d nAccessCode=%d nNewValue=%d th�t b�i!", nTaskID, nValue, nAccessCode, WTask:Get(nTaskID)) });
    end
    return nRetCode;
end

function _wgm_player_SetTaskByte(szFindPlayerName, nTaskID, nByteID, nValue, nAccessCode, szMsg)
    if nTaskID == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "nTaskId nByteId nVal nAccess", 1, 32, 0, _wgm_player_SetTaskByte, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if type(nTaskID) == "string" then
        local tbInputData = WLib:Split(nTaskID, " ");

        nTaskID = tonumber(tbInputData[1]) or 0;
        nByteID = tonumber(tbInputData[2]) or 0;
        nValue = tonumber(tbInputData[3]) or 0;
        nAccessCode = tonumber(tbInputData[4]) or 0;
    else
        nTaskID = tonumber(nTaskID) or 0;
        nByteID = tonumber(nByteID) or 0;
        nValue = tonumber(nValue) or 0;
        nAccessCode = tonumber(nAccessCode) or 0;
    end


    if nTaskID == 0 then
        return 0;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 1, _wgm_player_SetTaskByte, szFindPlayerName, nTaskID, nByteID, nValue, nAccessCode);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_SetTaskByte_OnTarget", { szMsg, nTaskID, nByteID, nValue, nAccessCode });
end
function _wgm_player_SetTaskByte_OnTarget(szSenderName, szMsg, nTaskID, nByteID, nValue, nAccessCode)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    nAccessCode = nAccessCode or 0;
    local nBeforeValue = WTask:GetByte(nTaskID, nByteID);
    nRetCode = WTask:SetByte(nTaskID, nByteID, nValue, nAccessCode);
    local nAfterValue = WTask:GetByte(nTaskID, nByteID);
    WGMLog:WriteRevCmdLog("_wgm_player_SetTaskByte", "Set task byte nh�n v�t", "_wgm_player_SetTaskByte_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nTaskID, nByteID, nValue, nAccessCode, nBeforeValue, nAfterValue }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Set task byte nTaskID=%d nByteID=%d nValue=%d nAccessCode=%d nNewValue=%d th�nh c�ng!", nTaskID, nByteID, nValue, nAccessCode, WTask:GetByte(nTaskID, nByteID)) });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Set task byte nTaskID=%d nByteID=%d nValue=%d nAccessCode=%d nNewValue=%d th�t b�i!", nTaskID, nByteID, nValue, nAccessCode, WTask:GetByte(nTaskID, nByteID)) });
    end
    return nRetCode;
end

function _wgm_player_SetTaskBit(szFindPlayerName, nTaskID, nBitID, nValue, nAccessCode, szMsg)
    if nTaskID == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "nTaskId nBitId nVal nAccess", 1, 32, 0, _wgm_player_SetTaskBit, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if type(nTaskID) == "string" then
        local tbInputData = WLib:Split(nTaskID, " ");

        nTaskID = tonumber(tbInputData[1]) or 0;
        nBitID = tonumber(tbInputData[2]) or 0;
        nValue = tonumber(tbInputData[3]) or 0;
        nAccessCode = tonumber(tbInputData[4]) or 0;
    else
        nTaskID = tonumber(nTaskID) or 0;
        nBitID = tonumber(nBitID) or 0;
        nValue = tonumber(nValue) or 0;
        nAccessCode = tonumber(nAccessCode) or 0;
    end


    if nTaskID == 0 then
        return 0;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 1, _wgm_player_SetTaskBit, szFindPlayerName, nTaskID, nBitID, nValue, nAccessCode);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_SetTaskBit_OnTarget", { szMsg, nTaskID, nBitID, nValue, nAccessCode });
end
function _wgm_player_SetTaskBit_OnTarget(szSenderName, szMsg, nTaskID, nBitID, nValue, nAccessCode)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    nAccessCode = nAccessCode or 0;
    local nBeforeValue = WTask:GetBit(nTaskID, nBitID);
    nRetCode = WTask:SetBit(nTaskID, nBitID, nValue, nAccessCode);
    local nAfterValue = WTask:GetByte(nTaskID, nBitID);
    WGMLog:WriteRevCmdLog("_wgm_player_SetTaskBit", "Set task bit nh�n v�t", "_wgm_player_SetTaskBit_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nTaskID, nBitID, nValue, nAccessCode, nBeforeValue, nAfterValue }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Set task bit nTaskID=%d nBitID=%d nValue=%d nAccessCode=%d nNewValue=%d th�nh c�ng!", nTaskID, nBitID, nValue, nAccessCode, WTask:GetBit(nTaskID, nBitID)) });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Set task bit nTaskID=%d nBitID=%d nValue=%d nAccessCode=%d nNewValue=%d th�t b�i!", nTaskID, nBitID, nValue, nAccessCode, WTask:GetBit(nTaskID, nBitID)) });
    end
    return nRetCode;
end
----------------------------------------------------------------------------------------------------
--- C�c h�m x� l� task theo t�nh n�ng
function _wgm_player_ModifyDaiHiepLenh(szFindPlayerName, nTaskValue, nBitID, nValue, szMsg)
    local TSK_ID_IB_AWARD = { 3470, 43 };
    local nTaskID = TSK_ID_IB_AWARD[1];
    local nAccessCode = TSK_ID_IB_AWARD[2];
    if nBitID == WEnv.NULL then
        local tbSay = { "<color=green>��i Hi�p L�nh<color>: Ch�n thao t�c v�i tr�ng th�i nh�n th��ng" };

        for nSelectIdx = 1, 7 do
            -- T_IB_AWARD c� 7 index
            local bGetFlag = GetBit(nTaskValue, nSelectIdx);
            if bGetFlag == 1 then
                _wgm_InsertSay(tbSay, "_wgm_player_ModifyDaiHiepLenh", format("Set ch�a nh�n m�c %d/#_wgm_player_ModifyDaiHiepLenh(%q, %d, %d, 0)", nSelectIdx, szFindPlayerName, nTaskValue, nSelectIdx));
            else
                _wgm_InsertSay(tbSay, "_wgm_player_ModifyDaiHiepLenh", format("Set �� nh�n m�c %d/#_wgm_player_ModifyDaiHiepLenh(%q, %d, %d, 1)", nSelectIdx, szFindPlayerName, nTaskValue, nSelectIdx));
            end
        end

        --_wgm_InsertSay(tbSay, "_wgm_player_SetTask_OnTarget", format("Reset task m�c th��ng v� 0/#_wgm_SendPackage(%q, nil, \"_wgm_player_SetTask_OnTarget\", {%q, %d, %d, %d})", szFindPlayerName, "Reset task l�i", nTaskID, 0, nAccessCode));
        tinsert(tbSay, g_szSpaceLine);
        _wgm_InsertSay(tbSay, "_wgm_player_SetTKLUsed", format("Set s� l��ng Thi�n Ki�u L�nh �� d�ng/#_wgm_player_SetTKLUsed(%q)", szFindPlayerName));
        _wgm_InsertSay(tbSay, "_wgm_player_ModifyDaiHiepLenh", format("Reset task m�c th��ng v� 0/#_wgm_player_ModifyDaiHiepLenh(%q, %d, %d, 0)", szFindPlayerName, nTaskValue, -1));

        tinsert(tbSay, g_szSpaceLine);
        _wgm_InsertSay(tbSay, "_wgm_player_ShowPlayerTaskMenu", format("<<  Tr� l�i qu�n l� task nh�n v�t/#_wgm_player_ShowPlayerTaskMenu(%q)", WPlayer:GetName()));

        tinsert(tbSay, "[x] T�m th�i ch�a c�n x� l�./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_ModifyDaiHiepLenh, szFindPlayerName, nTaskValue, nBitID, nValue);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if nBitID == -1 then
        _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_SetTask_OnTarget", { szMsg, nTaskID, nValue, nAccessCode });
    else
        _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_SetTaskBit_OnTarget", { szMsg, nTaskID, nBitID, nValue, nAccessCode });
    end
end

function _wgm_player_SetTKLUsed(szFindPlayerName, nValue, szMsg)
    if nValue == WEnv.NULL then
        WLib:InputNumber("Nh�p s� l��ng...", 0, 10000, 0, _wgm_player_SetTKLUsed, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_SetTKLUsed, szFindPlayerName, nValue);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_SetTKLUsed_OnTarget", { szMsg, nValue });
end
function _wgm_player_SetTKLUsed_OnTarget(szSenderName, szMsg, nValue)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    local TSK_ID_IB_AWARD = { 3470, 43 };
    local nTaskID = TSK_ID_IB_AWARD[1];
    local nAccessCode = TSK_ID_IB_AWARD[2];
    local nBeforeValue = gf_SafeGetTaskWord(nTaskID, 2);
    gf_SafeSetTaskWord(nTaskID, 2, nValue, nAccessCode);
    local nAfterValue = gf_SafeGetTaskWord(nTaskID, 2);
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_SetTKLUsed", "Set s� l�n d�ng TKL", "_wgm_player_SetTKLUsed_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nTaskID, nValue, nAccessCode, nBeforeValue, nAfterValue }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Set s� l��ng TKL �� s� d�ng =%d th�nh c�ng!", nValue) });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Set s� l��ng TKL �� s� d�ng =%d th�t b�i!", nValue) });
    end
    return nRetCode;
end

function _wgm_player_ModifyWorldBoss(szFindPlayerName, nTaskValue, nBitID, nValue, szMsg)
    local nTaskID = TASKID_WORLD_BOSS_USE;
    local nAccessCode = TASK_ACCESS_CODE_WORLD_BOSS;
    if nBitID == WEnv.NULL then
        local tbSay = { "<color=green>Boss th� gi�i<color>: Ch�n thao t�c v�i tr�ng th�i t�nh n�ng" };

        for nSelectIdx = 1, 2 do
            -- TASKID_WORLD_BOSS_USE c� 2 lo�i ��i Chi�n B�o H�p
            local bGetFlag = GetBit(nTaskValue, nSelectIdx);
            if bGetFlag == 1 then
                _wgm_InsertSay(tbSay, "_wgm_player_ModifyWorldBoss", format("Set ch�a nh�n ��i Chi�n B�o H�p %d/#_wgm_player_ModifyWorldBoss(%q, %d, %d, 0)", nSelectIdx, szFindPlayerName, nTaskValue, nSelectIdx));
            else
                _wgm_InsertSay(tbSay, "_wgm_player_ModifyWorldBoss", format("Set �� nh�n ��i Chi�n B�o H�p %d/#_wgm_player_ModifyWorldBoss(%q, %d, %d, 1)", nSelectIdx, szFindPlayerName, nTaskValue, nSelectIdx));
            end
        end

        local nSelectIdx = 3; -- R��ng V�ng ��i Chi�n
        local bGetFlag = GetBit(nTaskValue, nSelectIdx);
        if bGetFlag == 1 then
            _wgm_InsertSay(tbSay, "_wgm_player_ModifyWorldBoss", format("Set ch�a nh�n R��ng V�ng ��i Chi�n/#_wgm_player_ModifyWorldBoss(%q, %d, %d, 0)", szFindPlayerName, nTaskValue, nSelectIdx));
        else
            _wgm_InsertSay(tbSay, "_wgm_player_ModifyWorldBoss", format("Set �� nh�n R��ng V�ng ��i Chi�n/#_wgm_player_ModifyWorldBoss(%q, %d, %d, 1)", szFindPlayerName, nTaskValue, nSelectIdx));
        end

        tinsert(tbSay, g_szSpaceLine);
        _wgm_InsertSay(tbSay, "_wgm_player_ModifyWorldBoss", format("Reset task m� r��ng v� 0/#_wgm_player_ModifyWorldBoss(%q, %d, %d, 0)", szFindPlayerName, nTaskValue, -1));

        tinsert(tbSay, g_szSpaceLine);
        _wgm_InsertSay(tbSay, "_wgm_player_ShowPlayerTaskMenu", format("<<  Tr� l�i qu�n l� task nh�n v�t/#_wgm_player_ShowPlayerTaskMenu(%q)", WPlayer:GetName()));

        tinsert(tbSay, "[x] T�m th�i ch�a c�n x� l�./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_ModifyWorldBoss, szFindPlayerName, nTaskValue, nBitID, nValue);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if nBitID == -1 then
        _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_SetTask_OnTarget", { szMsg, nTaskID, nValue, nAccessCode });
    else
        _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_SetTaskBit_OnTarget", { szMsg, nTaskID, nBitID, nValue, nAccessCode });
    end
end

function _wgm_player_ModifyPopur2(szFindPlayerName, nTaskValue, nBitID, nValue, szMsg)
    local nTaskID = TASKID_BOOK_POPUR2;
    local nAccessCode = 0;
    if nBitID == WEnv.NULL then
        local tbSay = { "<color=green>�i�m l�ch luy�n<color>: Ch�n thao t�c v�i tr�ng th�i t�nh n�ng" };

        _wgm_InsertSay(tbSay, "_wgm_player_ModifyPopur2", format("C�ng th�m �i�m l�ch luy�n/#_wgm_player_ModifyPopur2(%q, %d, 1)", szFindPlayerName, nTaskValue));
        _wgm_InsertSay(tbSay, "_wgm_player_ModifyPopur2", format("Tr� �i�m l�ch luy�n/#_wgm_player_ModifyPopur2(%q, %d, 2)", szFindPlayerName, nTaskValue));

        tinsert(tbSay, g_szSpaceLine);
        _wgm_InsertSay(tbSay, "_wgm_player_ShowPlayerTaskMenu", format("<<  Tr� l�i qu�n l� task nh�n v�t/#_wgm_player_ShowPlayerTaskMenu(%q)", WPlayer:GetName()));

        tinsert(tbSay, "[x] T�m th�i ch�a c�n x� l�./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if nValue == WEnv.NULL then
        local szTitleText = "S� �i�m c�ng...";
        if nBitID ~= 1 then
            szTitleText = "S� �i�m tr�...";
        end
        WLib:InputNumber(szTitleText, 1, 100000, 0, _wgm_player_ModifyPopur2, szFindPlayerName, nTaskValue, nBitID);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_ModifyPopur2, szFindPlayerName, nTaskValue, nBitID, nValue);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    nValue = abs(nValue);
    if nBitID ~= 1 then
        nValue = -abs(nValue);
    end
    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_ModifyPopur2_OnTarget", { szMsg, nValue });
end
function _wgm_player_ModifyPopur2_OnTarget(szSenderName, szMsg, nValue)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    local nTaskID = TASKID_BOOK_POPUR2;
    local nAccessCode = 0;
    local nBeforeValue = WTask:Get(nTaskID) .. "/" .. WTask:Get(TASKID_BOOK_POPUR2_TOTAL);
    nRetCode = WPlayer:ModifyPopur2(nValue);
    local nAfterValue = WTask:Get(nTaskID) .. "/" .. WTask:Get(TASKID_BOOK_POPUR2_TOTAL);
    WGMLog:WriteRevCmdLog("_wgm_player_ModifyPopur2", "Set �i�m l�ch luy�n", "_wgm_player_ModifyPopur2_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nTaskID, nValue, nAccessCode, nBeforeValue, nAfterValue }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] �i�u ch�nh %d �i�m l�ch luy�n th�nh c�ng, gi� tr� m�i =%s!", nValue, nAfterValue) });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] �i�u ch�nh %d �i�m l�ch luy�n th�t b�i, gi� tr� c� =%s!", nValue, nAfterValue) });
    end
    return nRetCode;
end
----------------------------------------------------------------------------------------------------
--- H�m th�m v�t ph�m
function _wgm_player_AddItem(szFindPlayerName, szInput, bConfirm, szMsg)
    if szInput == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "M� v�t ph�m...", 1, 32, 1, _wgm_player_AddItem, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    local szItemName = "";
    local parts = WLib:Split(szInput, " ");
    local nLength = getn(parts);
    if nLength < 3 then
        WPlayer:Msg("Sai c� ph�p, nh�p ��nh d�ng x x x...");
        return WEnv.RETCODE_ERROR;
    else
        szItemName = WItem:GetName(parts[1], parts[2], parts[3]);
        if szItemName == WEnv.NULL or szItemName == "" then
            WPlayer:Msg("V�t ph�m kh�ng t�n t�i!");
            return WEnv.RETCODE_ERROR;
        end
    end

    parts[4] = parts[4] or 1;
    parts[5] = parts[5] or 4;
    if bConfirm ~= 1 then
        local szLock = ITEMSTATUS_NAMES[tonumber(parts[5])] or "unknow";
        WNpc:SayConfirm(format("B�n mu�n th�m v�t ph�m [<color=green>%s<color>]x<color=green>%d (%s)<color> v�o nh�n v�t [<color=yellow>%s<color>]?", szItemName, parts[4], szLock, szFindPlayerName),
                format("_wgm_player_AddItem(%q, %q, 1)", szFindPlayerName, szInput));
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_AddItem, szFindPlayerName, szInput, bConfirm);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    tinsert(parts, 1, szMsg);
    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_AddItem_OnTarget", parts);
end
function _wgm_player_AddItem_OnTarget(szSenderName, szMsg, ...)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    local tbAward = {};
    if getn(arg) >= 3 then
        tbAward = { tbProp = { arg[1], arg[2], arg[3] }, nStack = arg[4] or 1, nStatus = arg[5] or 4 };
        tbAward.szName = WItem:GetName(tbAward.tbProp);
        WAward:Give(tbAward, "_wgm_player_AddItem_OnTarget: " .. szMsg);
        --WNpc:Talk(format("B�n nh�n ���c %d %s!", tbAward.nStack, tbAward.szName)..szNewMsg, WEnv.TRUE);
        nRetCode = WEnv.RETCODE_SUCCESS;
        WGMLog:WriteRevCmdLog("_wgm_player_AddItem", "Add v�t ph�m v�o nh�n v�t", "_wgm_player_AddItem_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, tbAward.tbProp[1], tbAward.tbProp[2], tbAward.tbProp[3], tbAward.nStack, tbAward.nStatus }, szSenderName);
    end
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Th�m %d %s (%s) ��n ng��i ch�i th�nh c�ng!", tbAward.nStack, tbAward.szName, ITEMSTATUS_NAMES[tbAward.nStatus] or "unknow") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Th�m v�t ph�m ��n ng��i ch�i th�t b�i!") });
    end
    return nRetCode;
end
----------------------------------------------------------------------------------------------------
--- C�c h�m x� l� nh�n v�t kh�ng c�ng gs theo m�u nh�t qu�n nh� sau:
--- h�m ch�y tr�n ng��i g�i: "_wgm_player_FuncName" v�i bi�n ��u ti�n lu�n l� szFindPlayerName=t�n ng��i c�n x� l�
--- h�m ch�y tr�n ng��i c�n x� l�: "_wgm_player_FuncName_OnTarget" v�i bi�n ��u ti�n lu�n l� szSenderName= t�n ng��i g�i l�nh
function _wgm_player_ForceClearBCH(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_ForceClearBCH, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_ForceClearBCH_OnTarget", { szMsg });
end
function _wgm_player_ForceClearBCH_OnTarget(szSenderName, szMsg)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    local nBCH = WTask:Get(2501);
    local nDBCH = WTask:Get(2507);
    local nBCTD = WTask:Get(2508);
    WTask:Set(2501, 0); -- B�ch C�u Ho�n
    WTask:Set(2507, 0); -- ��i B�ch C�u ho�n
    WTask:Set(2508, 0); -- B�ch C�u Ti�n ��n
    WNpc:Talk("B�n �� b� h�y gi� �y th�c!" .. szNewMsg, WEnv.TRUE);
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_ForceClearBCH", "X�a th�i gian �y th�c BCH", "_wgm_player_ForceClearBCH_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nBCH, nDBCH, nBCTD }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] X�a gi� ch�i c�a ng��i ch�i th�nh c�ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] X�a gi� ch�i c�a ng��i ch�i th�t b�i!") });
    end
    return nRetCode;
end

function _wgm_player_MovePlayerToHere(szFindPlayerName, nMapId, nPosX, nPosY, szMsg)
    if nMapId == WEnv.NULL then
        local nCurrentMapID, nCurrentPosX, nCurrentPosY = WPlayer:GetWorldPos();
        local tbSay = { format("H�y ch�n n�i mu�n ��a nh�n v�t [<color=yellow>%s<color>] ��n!", szFindPlayerName) };

        _wgm_InsertSay(tbSay, "_wgm_player_MovePlayerToHere", format("D�ch chuy�n ng��i ch�i ��n v� tr� n�y/#_wgm_player_MovePlayerToHere(%q, %d, %d, %d)", szFindPlayerName, nCurrentMapID, nCurrentPosX, nCurrentPosY));
        _wgm_InsertSay(tbSay, "_wgm_player_MovePlayerToRandomCity", format("D�ch chuy�n ng��i ch�i ��n ng�u nhi�n c�c th�nh/#_wgm_player_MovePlayerToRandomCity(%q)", szFindPlayerName));

        tinsert(tbSay, g_szSpaceLine);
        _wgm_InsertSay(tbSay, "_wgm_player_ShowPlayerProcessMenu", format("<<  Tr� l�i qu�n l� nh�n v�t/#_wgm_player_ShowPlayerProcessMenu(%q)", WPlayer:GetName()));

        tinsert(tbSay, "[x] T�m th�i ch�a c�n x� l�./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_MovePlayerToHere, szFindPlayerName, nMapId, nPosX, nPosY);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_MovePlayerToHere_OnTarget", { szMsg, nMapId, nPosX, nPosY });
end
function _wgm_player_MovePlayerToHere_OnTarget(szSenderName, szMsg, nMapId, nPosX, nPosY)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_MovePlayerToHere", "D�ch chuy�n nh�n v�t ��n v� tr� hi�n t�i", "_wgm_player_MovePlayerToHere_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nMapId, nPosX, nPosY }, szSenderName);
    if _wgm_SafeNewWorld(nMapId, nPosX, nPosY, 1) == 1 then
        WNpc:Talk("B�n �� ���c admin d�ch chuy�n ��n v� tr� n�y!" .. szNewMsg, WEnv.TRUE);
    end
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] D�ch chuy�n ng��i ch�i ��n %s(%d/%d) th�nh c�ng!", GetMapName(nMapId) or "map_" .. nMapId, floor(nPosX / 8), floor(nPosY / 16)) });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] D�ch chuy�n ng��i ch�i ��n %s(%d/%d) th�t b�i!", GetMapName(nMapId) or "map_" .. nMapId, floor(nPosX / 8), floor(nPosY / 16)) });
    end
    return nRetCode;
end

function _wgm_player_MovePlayerToRandomCity(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_MovePlayerToRandomCity, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_MovePlayerToRandomCity_OnTarget", { szMsg });
end
function _wgm_player_MovePlayerToRandomCity_OnTarget(szSenderName, szMsg)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    local nRandomCitySelect = random(1, 7); -- 7 th�nh th�, 8 l� v� l�m minh
    local nRandomCityPosSelect = random(1, getn(g_tbCityTransport[nRandomCitySelect][2]));
    local nMapId = g_tbCityTransport[nRandomCitySelect][2][nRandomCityPosSelect][1];
    local nPosX = g_tbCityTransport[nRandomCitySelect][2][nRandomCityPosSelect][2] + random(-5, 5);
    local nPosY = g_tbCityTransport[nRandomCitySelect][2][nRandomCityPosSelect][3] + random(-5, 5);
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_MovePlayerToRandomCity", "D�ch chuy�n nh�n v�t ��n ng�u nhi�n th�nh", "_wgm_player_MovePlayerToRandomCity_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nMapId, nPosX, nPosY }, szSenderName);
    if _wgm_SafeNewWorld(nMapId, nPosX, nPosY, 1) == 1 then
        WNpc:Talk("B�n �� ���c admin d�ch chuy�n ��n v� tr� n�y!" .. szNewMsg, WEnv.TRUE);
    end
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] D�ch chuy�n ng��i ch�i ��n %s(%d/%d) th�nh c�ng!", GetMapName(nMapId) or "map_" .. nMapId, floor(nPosX / 8), floor(nPosY / 16)) });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] D�ch chuy�n ng��i ch�i ��n %s(%d/%d) th�t b�i!", GetMapName(nMapId) or "map_" .. nMapId, floor(nPosX / 8), floor(nPosY / 16)) });
    end
    return nRetCode;
end

function _wgm_player_LockAccount(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_LockAccount, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == "" then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_LockAccount, szFindPlayerName);
        WNpc:Talk("C�n ghi r� l� do kh�a t�i kho�n n�y!", WEnv.TRUE);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_LockAccount_OnTarget", { szMsg });
end
function _wgm_player_LockAccount_OnTarget(szSenderName, szMsg)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    nRetCode = WIpMac:SetLockAccountFlag(1, szMsg, szSenderName);
    WGMLog:WriteRevCmdLog("_wgm_player_LockAccount", "K�ch nh�n v�t", "_wgm_player_LockAccount_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Kh�a t�i kho�n th�nh c�ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Kh�a t�i kho�n th�t b�i!") });
    end
    return _wgm_player_KickoutGame_OnTarget(szSenderName, szMsg);
end

function _wgm_player_KickoutGame(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_KickoutGame, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == "" then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_KickoutGame, szFindPlayerName);
        WNpc:Talk("C�n ghi r� l� do kick nh�n v�t n�y!", WEnv.TRUE);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_KickoutGame_OnTarget", { szMsg });
end
function _wgm_player_KickoutGame_OnTarget(szSenderName, szMsg)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    nRetCode = WIpMac:KickoutGame(szMsg, szSenderName);
    WGMLog:WriteRevCmdLog("_wgm_player_KickoutGame", "K�ch nh�n v�t", "_wgm_player_KickoutGame_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] K�ch nh�n v�t th�nh c�ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] K�ch nh�n v�t th�t b�i!") });
    end
    return nRetCode;
end

function _wgm_player_BanMac(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_BanMac, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == "" then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_BanMac, szFindPlayerName);
        WNpc:Talk("C�n ghi r� l� do c�m ��ng nh�p!", WEnv.TRUE);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_BanMac_OnTarget", { szMsg });
end
function _wgm_player_BanMac_OnTarget(szSenderName, szMsg)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    nRetCode = WIpMac:SetBanMacFlag(1, szMsg, szSenderName);
    local nOldPlayerIdx = PlayerIndex;
    local szOldPlayerName = WPlayer:GetName();
    local szOldLastLoginIP, szOldCurrentLoginIP = WPlayer:GetLoginIP();
    local szOldLastLoginMAC, szOldCurrentLoginMAC = WPlayer:GetLoginMAC();
    WGMLog:WriteRevCmdLog("_wgm_player_BanMac", "Ch�n ��a ch� MAC", "_wgm_player_BanMac_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, szOldCurrentLoginMAC }, szSenderName);

    local nFoundPlayerIdx = FirstPlayer();
    while nFoundPlayerIdx > 0 do
        PlayerIndex = nFoundPlayerIdx;
        local szFoundLastLoginIP, szFoundCurrentLoginIP = WPlayer:GetLoginIP();
        local szFoundLastLoginMAC, szFoundCurrentLoginMAC = WPlayer:GetLoginMAC();
        if szOldCurrentLoginIP == szFoundCurrentLoginIP and szOldCurrentLoginMAC == szFoundCurrentLoginMAC and szOldPlayerName ~= WPlayer:GetName() then
            ExitGame();
        end
        PlayerIndex = nOldPlayerIdx;
        nFoundPlayerIdx = NextPlayer(nFoundPlayerIdx);
    end

    PlayerIndex = nOldPlayerIdx;
    ExitGame();
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Ch�n ��ng nh�p th�nh c�ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Ch�n ��ng nh�p th�t b�i!") });
    end
    return nRetCode;
end

function _wgm_player_KickoutBattle(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_KickoutBattle, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == "" then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_KickoutBattle, szFindPlayerName);
        WNpc:Talk("C�n ghi r� l� do kick nh�n v�t n�y!", WEnv.TRUE);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_KickoutBattle_OnTarget", { szMsg });
end
function _wgm_player_KickoutBattle_OnTarget(szSenderName, szMsg)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    local tbMissionID = {
        [1] = 25, -- th�n trang
        [2] = 26, -- th�o c�c
        [3] = 27, -- ph�o ��i
        [4] = 28, -- nh�n m�n quan
        [5] = 40, -- ng�c m�n quan
    };
    local PT_SIGN_UP = 711;
    local nSignUpData = WTask:Get(PT_SIGN_UP);
    local nBattleType = floor(nSignUpData / 10);
    local nCamp = mod(nSignUpData, 10);
    local MISSION_ID = tbMissionID[nBattleType];
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_KickoutBattle", "Lo�i kh�i chi�n tr��ng", "_wgm_player_KickoutBattle_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg }, szSenderName);
    if _wgm_SafeNewWorld(400, 1519 + random(-5, 5), 2983 + random(-5, 5), 1) ~= 0 then
        DelMSPlayer(MISSION_ID, nCamp); -- X�a nh�n v�t kh�i chi�n tr��ng
        WTask:Set(PT_SIGN_UP, 0); -- X�a ��ng k� chi�n tr��ng
        WNpc:Talk("B�n �� b� admin lo�i kh�i chi�n tr��ng!" .. szNewMsg, WEnv.TRUE);
    end
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Lo�i kh�i chi�n tr��ng th�nh c�ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Lo�i kh�i chi�n tr��ng th�t b�i!") });
    end
    return nRetCode;
end

function _wgm_player_ResetBattle(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_ResetBattle, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == "" then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_ResetBattle, szFindPlayerName);
        WNpc:Talk("C�n ghi r� l� do reset chi�n tr��ng nh�n v�t n�y!", WEnv.TRUE);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_ResetBattle_OnTarget", { szMsg });
end
function _wgm_player_ResetBattle_OnTarget(szSenderName, szMsg)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    local tbMissionID = {
        [1] = 25, -- th�n trang
        [2] = 26, -- th�o c�c
        [3] = 27, -- ph�o ��i
        [4] = 28, -- nh�n m�n quan
        [5] = 40, -- ng�c m�n quan
    };
    local PT_SIGN_UP = 711;
    local PT_BATTLE_DATE = 712;
    local nSignUpData = WTask:Get(PT_SIGN_UP);
    local nBattleType = floor(nSignUpData / 10);
    local nCamp = mod(nSignUpData, 10);
    local MISSION_ID = tbMissionID[nBattleType];
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_ResetBattle", "Lo�i kh�i chi�n tr��ng", "_wgm_player_ResetBattle_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg }, szSenderName);

    WTask:Set(PT_BATTLE_DATE, 0); -- Xo� l�ch s� ��ng k� chi�n tr��ng
    WTask:Set(PT_SIGN_UP, 0); -- X�a ��ng k� chi�n tr��ng
    WNpc:Talk("B�n �� ���c admin reset ��ng k� chi�n tr��ng!" .. szNewMsg, WEnv.TRUE);
    local nMapId = WPlayer:GetWorldPos();
    if nMapId >= 881 and nMapId <= 884 then
        DelMSPlayer(MISSION_ID, nCamp); -- X�a nh�n v�t kh�i chi�n tr��ng
        _wgm_SafeNewWorld(200, 1360 + random(-5, 5), 2877 + random(-5, 5), 1);
    end
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Reset ��ng k� chi�n tr��ng th�nh c�ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Reset ��ng k� chi�n tr��ng th�t b�i!") });
    end
    return nRetCode;
end

function _wgm_player_ForbitChat(szFindPlayerName, bFlag, nTime, szMsg)
    nTime = nTime or 15;
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Time;L� do...", 1, 32, 0, _wgm_player_ForbitChat, szFindPlayerName, bFlag, nTime);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    local tbMsgParams = WLib:Split(szMsg, ";");
    if getn(tbMsgParams) > 1 and tonumber(tbMsgParams[1]) ~= WEnv.NULL then
        nTime = tonumber(tbMsgParams[1]);
        szMsg = tbMsgParams[2];
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_ForbitChat_OnTarget", { szMsg, bFlag, nTime });
end
function _wgm_player_ForbitChat_OnTarget(szSenderName, szMsg, bFlag, nTime)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    SetChatFlag(bFlag);
    WTask:SetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_CAMCHAT, bFlag);
    if bFlag == 1 then
        WTask:Set(WTASKID_PLAYERSTATE_CAMCHAT_TOTALTIME, nTime);
        WTask:Set(WTASKID_PLAYERSTATE_CAMCHAT_REMAINING, nTime);
        WNpc:Talk("B�n �� b� c�m chat do s� d�ng ng�n t� kh�ng ph� h�p!" .. szNewMsg, WEnv.TRUE);
    else
        WTask:Set(WTASKID_PLAYERSTATE_CAMCHAT_TOTALTIME, 0);
        WTask:Set(WTASKID_PLAYERSTATE_CAMCHAT_REMAINING, 0);
        WNpc:Talk("B�n �� ���c m� chat tr� l�i, h�y c�n tr�ng ng�n t�!" .. szNewMsg, WEnv.TRUE);
    end
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_ForbitChat", "C�m chat nh�n v�t", "_wgm_player_ForbitChat_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, bFlag, nTime }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        if bFlag == 1 then
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[SUCCESS] C�m chat nh�n v�t th�nh c�ng!") });
        else
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[SUCCESS] M� chat nh�n v�t th�nh c�ng!") });
        end
    else
        if bFlag == 1 then
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[FAIL] C�m chat nh�n v�t th�t b�i!") });
        else
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[FAIL] M� chat nh�n v�t th�t b�i!") });
        end
    end
    return nRetCode;
end

function _wgm_player_ArrestPlayer(szFindPlayerName, bFlag, nTime, szMsg)
    nTime = nTime or 15;
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Time;L� do...", 1, 32, 0, _wgm_player_ArrestPlayer, szFindPlayerName, bFlag, nTime);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    local tbMsgParams = WLib:Split(szMsg, ";");
    if getn(tbMsgParams) > 1 and tonumber(tbMsgParams[1]) ~= WEnv.NULL then
        nTime = tonumber(tbMsgParams[1]);
        szMsg = tbMsgParams[2];
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_ArrestPlayer_OnTarget", { szMsg, bFlag, nTime });
end
function _wgm_player_ArrestPlayer_OnTarget(szSenderName, szMsg, bFlag, nTime)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    nTime = nTime or 15;
    WTask:SetBit(WTASKID_PLAYERSTATE_BIT, WTASKID_PLAYERSTATE_BIT_BATGIAM, bFlag);
    if bFlag == 1 then
        WTask:Set(WTASKID_PLAYERSTATE_BATGIAM_TOTALTIME, nTime);
        WTask:Set(WTASKID_PLAYERSTATE_BATGIAM_REMAINING, nTime);
        WNpc:Talk("B�n �� b� b�t giam!" .. szNewMsg, WEnv.TRUE);
    else
        WTask:Set(WTASKID_PLAYERSTATE_BATGIAM_TOTALTIME, 0);
        WTask:Set(WTASKID_PLAYERSTATE_BATGIAM_REMAINING, 0);
        WNpc:Talk("B�n �� ���c th� t� do!" .. szNewMsg, WEnv.TRUE);
    end
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_ArrestPlayer", "B�t giam nh�n v�t", "_wgm_player_ArrestPlayer_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, bFlag, nTime }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        if bFlag == 1 then
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[SUCCESS] B�t giam nh�n v�t th�nh c�ng!") });
        else
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[SUCCESS] Ph�ng th�ch nh�n v�t th�nh c�ng!") });
        end
    else
        if bFlag == 1 then
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[FAIL] B�t giam nh�n v�t th�t b�i!") });
        else
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[FAIL] Ph�ng th�ch nh�n v�t th�t b�i!") });
        end
    end
    return nRetCode;
end

function _wgm_player_SetFightState(szFindPlayerName, bFlag, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_SetFightState, szFindPlayerName, bFlag);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_SetFightState_OnTarget", { szMsg, bFlag });
end
function _wgm_player_SetFightState_OnTarget(szSenderName, szMsg, bFlag)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    SetFightState(bFlag);
    if bFlag == 1 then
        WNpc:Talk("Tr�ng th�i nh�n v�t ���c ��t th�nh chi�n ��u!" .. szNewMsg, WEnv.TRUE);
    else
        WNpc:Talk("Tr�ng th�i nh�n v�t ���c ��t th�nh phi chi�n ��u!" .. szNewMsg, WEnv.TRUE);
    end
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_SetFightState", "Set tr�ng th�i chi�n ��u nh�n v�t", "_wgm_player_SetFightState_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, bFlag }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        if bFlag == 1 then
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[SUCCESS] ��a nh�n v�t v� tr�ng th�i chi�n ��u th�nh c�ng!") });
        else
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[SUCCESS] ��a nh�n v�t v� tr�ng th�i chi�n ��u th�nh c�ng!") });
        end
    else
        if bFlag == 1 then
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[FAIL] ��a nh�n v�t v� tr�ng th�i chi�n ��u th�t b�i!") });
        else
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[FAIL] ��a nh�n v�t v� tr�ng th�i chi�n ��u th�t b�i!") });
        end
    end
    return nRetCode;
end

function _wgm_player_TempUnlockBox(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_TempUnlockBox, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_TempUnlockBox_OnTarget", { szMsg });
end
function _wgm_player_TempUnlockBox_OnTarget(szSenderName, szMsg)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    UnlockBox();
    WNpc:Talk("B�n �� ���c m� kh�a r��ng �� t�m th�i!\n<color=red>Ch� � b�o qu�n t�i s�n sau khi m� kh�a!<color>" .. szNewMsg, WEnv.TRUE);
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_TempUnlockBox", "M� r��ng t�m th�i", "_wgm_player_TempUnlockBox_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] M� kh�a r��ng t�m th�i th�nh c�ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] M� kh�a r��ng t�m th�i th�t b�i!") });
    end
    return nRetCode;
end

function _wgm_player_ClearBoxPassword(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_ClearBoxPassword, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_ClearBoxPassword_OnTarget", { szMsg });
end
function _wgm_player_ClearBoxPassword_OnTarget(szSenderName, szMsg)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    CancelBoxPassword();
    WNpc:Talk("B�n �� ���c m� kh�a r��ng ��!\n<color=red>Ch� � b�o qu�n t�i s�n sau khi m� kh�a!<color>" .. szNewMsg, WEnv.TRUE);
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_ClearBoxPassword", "X�a pass r��ng", "_wgm_player_ClearBoxPassword_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] M� kh�a r��ng th�nh c�ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] M� kh�a r��ng th�t b�i!") });
    end
    return nRetCode;
end

function _wgm_player_ClearItemPassword(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_ClearItemPassword, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_ClearItemPassword_OnTarget", { szMsg });
end
function _wgm_player_ClearItemPassword_OnTarget(szSenderName, szMsg)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    UnLockAllItem();
    WNpc:Talk("B�n �� ���c m� kh�a t�t c� c�c trang b� tr�n ng��i, h�y tr� l�i �� ho�n t�t qu� tr�nh!\n<color=red>Ch� � b�o qu�n t�i s�n sau khi m� kh�a!<color>" .. szNewMsg, WEnv.TRUE);
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_ClearItemPassword", "X�a pass kh�a trang b�", "_wgm_player_ClearItemPassword_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] M� kh�a v�t ph�m th�nh c�ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] M� kh�a v�t ph�m th�t b�i!") });
    end
    return nRetCode;
end

function _wgm_player_SavePlayerData(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_SavePlayerData, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_SavePlayerData_OnTarget", { szMsg });
end
function _wgm_player_SavePlayerData_OnTarget(szSenderName, szMsg)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    SaveNow();
    WNpc:Talk("B�n �� ���c admin l�u d� li�u nh�n v�t!" .. szNewMsg, WEnv.TRUE);
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_SavePlayerData", "L�u d� li�u nh�n v�t", "_wgm_player_SavePlayerData_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] L�u d� li�u nh�n v�t th�nh c�ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] L�u d� li�u nh�n v�t th�t b�i!") });
    end
    return nRetCode;
end

function _wgm_player_ModifyGold(szFindPlayerName, nAddOrRemove, nGoldModify, bForce, szMsg)
    nAddOrRemove = tonumber(nAddOrRemove) or 0;
    bForce = tonumber(bForce) or 0;
    local nGoldMin = 1;
    local nGoldMax = 100000 - 1;

    if nAddOrRemove == 0 then
        local tbSay = { "Ch�n thao t�c:" };

        _wgm_InsertSay(tbSay, "_wgm_player_ModifyGold", format("Tr� v�ng nh�n v�t n�y/#_wgm_player_ModifyGold(%q, %d)", szFindPlayerName, -1));
        _wgm_InsertSay(tbSay, "_wgm_player_ModifyGold", format("C�ng v�ng nh�n v�t n�y/#_wgm_player_ModifyGold(%q, %d)", szFindPlayerName, 1));

        tinsert(tbSay, g_szSpaceLine);
        _wgm_InsertSay(tbSay, "_wgm_player_ShowPlayerProcessMenu", format("<<  Tr� l�i qu�n l� nh�n v�t/#_wgm_player_ShowPlayerProcessMenu(%q)", WPlayer:GetName()));

        tinsert(tbSay, "[x] T�m th�i ch�a c�n x� l�./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    nGoldModify = abs(tonumber(nGoldModify) or 0);
    if nGoldModify == 0 then
        local szAddOrRemoveSymbol = "";
        if nAddOrRemove == 1 then
            szAddOrRemoveSymbol = "c�ng";
        end
        if nAddOrRemove == -1 then
            szAddOrRemoveSymbol = "tr�";
        end

        WLib:InputNumber("Nh�p v�ng " .. szAddOrRemoveSymbol .. "...", nGoldMin, nGoldMax, nAddOrRemove, _wgm_player_ModifyGold, szFindPlayerName, nAddOrRemove);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "L� do...", 1, 32, 0, _wgm_player_ModifyGold, szFindPlayerName, nAddOrRemove, nGoldModify, bForce);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_ModifyGold_OnTarget", { nAddOrRemove, nGoldModify, bForce, szMsg });
end
function _wgm_player_ModifyGold_OnTarget(szSenderName, nAddOrRemove, nGoldModify, bForce, szMsg)
    local szNewMsg = "";
    if szMsg ~= "" then
        szNewMsg = "\nMessage: " .. szMsg;
    end
    local nRetCode = WEnv.RETCODE_ERROR;

    --- START TODO
    nGoldModify = abs(tonumber(nGoldModify) or 0);
    bForce = abs(tonumber(bForce) or 0);

    local nGoldMin = 1;
    local nGoldMax = 100000 - 1;
    if nGoldModify < nGoldMin or nGoldModify > nGoldMax then
        return WEnv.RETCODE_ERROR;
    end

    local nGoldInBag = floor(GetCash() / 10000);
    local nGoldInBox = floor(GetSaveMoney() / 10000);

    local nGold360 = WItem:CountAll(2, 1, 537); -- T� Kim H�ng Bao
    local nGold999 = WItem:CountAll(2, 1, 539); -- ��i h�ng bao ho�ng kim
    local nGold4000 = WItem:CountAll(2, 1, 30229); -- B�ch Kim H�ng Bao

    local nProcessStep = 0;
    local nProcessStepDone = 0;
    local nProcessStepGold = 0;
    local tbProcessResultMsg = {};
    local szAddOrRemoveSymbol = "";
    local nBeforeTotalGold = nGoldInBag + nGoldInBox + (nGold360 * 360) + (nGold999 * 999) + (nGold4000 * 4000);

    local nProcessGoldRemain = nGoldModify;
    local tbProcessTask = {
        [1] = { nType = "GoldItem", nNeed = 0, nBeforeValue = nGold4000, szName = "V�ng bao 4000v", tbProp = { 2, 1, 30229 }, nValue = 4000 },
        [2] = { nType = "GoldItem", nNeed = 0, nBeforeValue = nGold999, szName = "V�ng bao 999v", tbProp = { 2, 1, 539 }, nValue = 999 },
        [3] = { nType = "GoldItem", nNeed = 0, nBeforeValue = nGold360, szName = "V�ng bao 360v", tbProp = { 2, 1, 537 }, nValue = 360 },
        [4] = { nType = "GoldInBox", nNeed = 0, nBeforeValue = nGoldInBox, szName = "V�ng th� kh�" },
        [5] = { nType = "GoldInBag", nNeed = 0, nBeforeValue = nGoldInBag, szName = "V�ng h�nh trang" },
    };

    if nAddOrRemove == 1 then
        -- tr��ng h�p c�ng v�ng
        szAddOrRemoveSymbol = "+";
        tbProcessTask[5].nNeed = nGoldModify;
        nProcessGoldRemain = 0;
        nProcessStep = 1;
    elseif nAddOrRemove == -1 then
        -- tr��ng h�p tr� v�ng
        szAddOrRemoveSymbol = "-";
        if nGoldInBag + nGoldInBox >= nGoldModify then
            -- tr��ng h�p c� �� ti�n m�t
            if nGoldInBag >= nGoldModify then
                tbProcessTask[5].nNeed = nGoldModify;
                nProcessStep = 1;
            elseif nGoldInBag < nGoldModify then
                tbProcessTask[5].nNeed = nGoldInBag;
                tbProcessTask[4].nNeed = nGoldModify - tbProcessTask[5].nNeed;
                nProcessStep = 2;
            end
        else

            for i = 1, getn(tbProcessTask) do
                if tbProcessTask[i].nType == "GoldItem" then
                    for j = 1, tbProcessTask[i].nBeforeValue do
                        if nProcessGoldRemain <= 0 then
                            break ;
                        end

                        if nProcessGoldRemain <= (nGoldInBox + nGoldInBag) then
                            -- tr��ng h�p c� �� ti�n trong ng��i v� th� kh�
                            --print("break1", i, nProcessGoldRemain, (nGoldInBox + nGoldInBag), tbProcessTask[i].szName);
                            break ;
                        end

                        if nProcessGoldRemain + (tbProcessTask[i].nNeed * tbProcessTask[i].nValue) - (nGoldInBox + nGoldInBag) >= nGoldModify then
                            -- tr��ng h�p m� ra s� �� ti�n
                            --print("break2", i, nProcessGoldRemain, (tbProcessTask[i].nNeed * tbProcessTask[i].nValue), tbProcessTask[i].szName);
                            break ;
                        end

                        tbProcessTask[i].nNeed = tbProcessTask[i].nNeed + 1;
                        nProcessGoldRemain = nProcessGoldRemain - tbProcessTask[i].nValue;
                    end

                    if tbProcessTask[i].nNeed > 0 then
                        nProcessStep = nProcessStep + 1;
                    end
                end

                if tbProcessTask[i].nType == "GoldInBox" or tbProcessTask[i].nType == "GoldInBag" then
                    if nProcessGoldRemain <= 0 then
                        break ;
                    end

                    if nProcessGoldRemain >= tbProcessTask[i].nBeforeValue then
                        tbProcessTask[i].nNeed = tbProcessTask[i].nBeforeValue;
                    end

                    if nProcessGoldRemain < tbProcessTask[i].nBeforeValue then
                        tbProcessTask[i].nNeed = nProcessGoldRemain;
                    end

                    nProcessStep = nProcessStep + 1;
                    nProcessGoldRemain = nProcessGoldRemain - tbProcessTask[i].nNeed;
                end
            end

        end
    end

    if bForce == 1 or nProcessGoldRemain <= 0 then

        for i = 1, getn(tbProcessTask) do
            if tbProcessTask[i].nNeed > 0 then
                if tbProcessTask[i].nType == "GoldItem" then
                    if nAddOrRemove == -1 then
                        if BigDelItem(tbProcessTask[i].tbProp[1], tbProcessTask[i].tbProp[2], tbProcessTask[i].tbProp[3], tbProcessTask[i].nNeed) == 1 then
                            nProcessStepDone = nProcessStepDone + 1;
                            nProcessStepGold = nProcessStepGold + (tbProcessTask[i].nNeed * tbProcessTask[i].nValue);
                            tinsert(tbProcessResultMsg, format("%s: %s%s c�i", tbProcessTask[i].szName, szAddOrRemoveSymbol, WLib:MoneyFormat(tbProcessTask[i].nNeed)));
                            WPlayer:Msg(format("B�n b� tr� %s c�i %s!", WLib:MoneyFormat(tbProcessTask[i].nNeed), WItem:GetName(tbProcessTask[i].tbProp)));
                        end
                    end
                end

                if tbProcessTask[i].nType == "GoldInBox" or tbProcessTask[i].nType == "GoldInBag" then
                    if nAddOrRemove == 1 then
                        Earn(tbProcessTask[i].nNeed * 10000);
                        nProcessStepDone = nProcessStepDone + 1;
                        tinsert(tbProcessResultMsg, format("%s: %s%s v�ng", tbProcessTask[i].szName, szAddOrRemoveSymbol, WLib:MoneyFormat(tbProcessTask[i].nNeed)));
                    end

                    if nAddOrRemove == -1 then
                        if tbProcessTask[i].nType == "GoldInBox" then
                            if PaySaveMoney(tbProcessTask[i].nNeed * 10000) == 1 then
                                nProcessStepDone = nProcessStepDone + 1;
                                nProcessStepGold = nProcessStepGold + tbProcessTask[i].nNeed;
                                tinsert(tbProcessResultMsg, format("%s: %s%s v�ng", tbProcessTask[i].szName, szAddOrRemoveSymbol, WLib:MoneyFormat(tbProcessTask[i].nNeed)));
                            end
                        end

                        if tbProcessTask[i].nType == "GoldInBag" then
                            if Pay(tbProcessTask[i].nNeed * 10000) == 1 then
                                nProcessStepDone = nProcessStepDone + 1;
                                nProcessStepGold = nProcessStepGold + tbProcessTask[i].nNeed;
                                tinsert(tbProcessResultMsg, format("%s: %s%s v�ng", tbProcessTask[i].szName, szAddOrRemoveSymbol, WLib:MoneyFormat(tbProcessTask[i].nNeed)));
                            end
                        end
                    end
                end
            end
        end

    end

    --print("ProcessTask", nGoldModify, nProcessGoldRemain, tbProcessTask[1].nNeed, tbProcessTask[2].nNeed, tbProcessTask[3].nNeed, tbProcessTask[4].nNeed, tbProcessTask[5].nNeed);

    if nProcessStepGold > 0 and nProcessStepGold > nGoldModify then
        WPlayer:AddGold(nProcessStepGold - nGoldModify); -- nh�n l�i s� d� khi tr� c�c item v�ng bao l�m tr�n s�
        tinsert(tbProcessResultMsg, format("%s: %s%s v�ng", tbProcessTask[5].szName, "+", WLib:MoneyFormat(nProcessStepGold - nGoldModify)));
    end

    szNewMsg = szNewMsg .. "\n" .. WLib:Join(tbProcessResultMsg, ", ");

    if nProcessStepDone ~= 0 then
        if nProcessStep == nProcessStepDone then
            nRetCode = WEnv.RETCODE_SUCCESS;
        end

        WNpc:Talk("B�n �� ���c admin �i�u ch�nh " .. szAddOrRemoveSymbol .. "" .. WLib:MoneyFormat(nGoldModify) .. " v�ng c�a nh�n v�t!" .. szNewMsg, WEnv.TRUE);
        WGMLog:WriteRevCmdLog("_wgm_player_ModifyGold", "�i�u ch�nh v�ng nh�n v�t", "_wgm_player_ModifyGold_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, nAddOrRemove, nGoldModify, bForce, szMsg, WLib:Join(tbProcessResultMsg, ", ") }, szSenderName);
    end
    --- END TODO

    local nAfterGoldInBag = floor(GetCash() / 10000);
    local nAfterGoldInBox = floor(GetSaveMoney() / 10000);
    local nAfterGold360 = WItem:CountAll(2, 1, 537); -- T� Kim H�ng Bao
    local nAfterGold999 = WItem:CountAll(2, 1, 539); -- ��i h�ng bao ho�ng kim
    local nAfterGold4000 = WItem:CountAll(2, 1, 30229); -- B�ch Kim H�ng Bao
    local nAfterTotalGold = nAfterGoldInBag + nAfterGoldInBox + (nAfterGold360 * 360) + (nAfterGold999 * 999) + (nAfterGold4000 * 4000);
    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] �i�u ch�nh v�ng nh�n v�t th�nh c�ng, t�ng tr��c %s v�ng, t�ng sau %s v�ng, �i�u ch�nh %s%s v�ng!",
                        WLib:MoneyFormat(nBeforeTotalGold), WLib:MoneyFormat(nAfterTotalGold), szAddOrRemoveSymbol, WLib:MoneyFormat(nGoldModify)) });
        for i = 1, getn(tbProcessResultMsg) do
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[SUCCESS] �� x� l�: %s!", tbProcessResultMsg[i]) });
        end
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] �i�u ch�nh v�ng nh�n v�t th�t b�i, t�ng c� th� %s%s v�ng, �� nh�p v�o %s v�ng!",
                        szAddOrRemoveSymbol, WLib:MoneyFormat(nBeforeTotalGold), WLib:MoneyFormat(nGoldModify)) });
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Hi�n c�: %s v�ng h�nh trang, %s v�ng th� kh�, %s v�ng bao 360, %s v�ng bao 999, %d v�ng bao 4000!",
                        WLib:MoneyFormat(nGoldInBag), WLib:MoneyFormat(nGoldInBox), WLib:MoneyFormat(nGold360), WLib:MoneyFormat(nGold999), WLib:MoneyFormat(nGold4000)) });
        for i = 1, getn(tbProcessResultMsg) do
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[FAIL] �� x� l�: %s!", tbProcessResultMsg[i]) });
        end
    end
    return nRetCode;
end

----------------------------------------------------------------------------------------------------

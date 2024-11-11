----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-10
--- Description: c¸c hµm gm liªn quan ®Õn player
----------------------------------------------------------------------------------------------------
--- Hµm gäi chÝnh më t×m nh©n vËt
function _wgm_player_FindPlayerByName(szFindPlayerName)
    if szFindPlayerName == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "NhËp tªn ng­êi ch¬i", 1, 42, 0, _wgm_player_FindPlayerByName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    --szFindPlayerName = gsub(szFindPlayerName or "", "[%p%c%s]", ""); -- c¸i nµy kh«ng t×m ®c ë liªn server v× cã dÊu *
    szFindPlayerName = WLib:Replace(WLib:Replace(szFindPlayerName, " ", ""), "/", "");
    if szFindPlayerName == "" then
        WNpc:Talk("Tªn nh©n vËt trèng!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end

    _wgm_SendPackage(szFindPlayerName, WEnv.NULL, "_wgm_player_LoadPlayerInfo", WEnv.NULL, WEnv.TRUE);
    return WEnv.RETCODE_SUCCESS;
end
----------------------------------------------------------------------------------------------------
--- Më menu xö lý nh©n vËt
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
        [39] = WTask:Get(336), -- s­ m«n
        [40] = WTask:Get(701), -- qu©n c«ng
        [41] = WTask:Get(707), -- tÝch lòy
        [42] = WTask:Get(704), -- qu©n hµm
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
        [1] = "Tiªu chuÈn",
        [2] = "Kh«i ng«",
        [3] = "KiÒu n÷",
        [4] = "Gîi c¶m",
    };

    local tbDoingInfo = {};
    if bIsOffliveLive == 1 then
        tinsert(tbDoingInfo, "ñy th¸c");
    else
        tinsert(tbDoingInfo, "online");
    end
    if bIsSleeping == 1 then
        tinsert(tbDoingInfo, "ngñ");
    end
    if bIsDeath == 1 then
        tinsert(tbDoingInfo, "®· chÕt");
    end
    if bIsStalling == 1 then
        tinsert(tbDoingInfo, "bµy b¸n");
    end
    if bIsGathering == 1 then
        tinsert(tbDoingInfo, "thu thËp");
    end
    if bIsReading == 1 then
        tinsert(tbDoingInfo, "luyÖn s¸ch");
    end
    if nFightState == 1 then
        tinsert(tbDoingInfo, "chiÕn ®Êu");
    else
        tinsert(tbDoingInfo, "phi chiÕn ®Êu");
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
        tinsert(tbDoingInfo, "tû vâ");
    end

    local tbQuanHam = {
        [1] = "Binh sÜ",
        [2] = "HiÖu óy",
        [3] = "§« thèng",
        [4] = "Tiªn phong",
        [5] = "T­íng qu©n",
        [6] = "Nguyªn so¸i",
    };
    local szCampCT = "Ch­a";
    if nQuanCong > 0 then
        szCampCT = "Tèng";
    elseif nQuanCong < 0 then
        szCampCT = "Liªu";
    end

    local nCreateYear, nCreateMonth, nCreateDay, nCreateHour, nCreateMinute, nCreateSecond = GmTime(nCreateTime);
    if szTongName == "" then
        szTongName = "Ch­a gia nhËp";
    end

    -- chØ admin hoÆc superadmin míi cã thÓ thÊy ®­îc mét sè th«ng tin quan träng
    local szSayHeader = "";
    if WPlayer:IsSuperAdmin() == WEnv.TRUE or WPlayer:IsAdmin() == WEnv.TRUE then
        -- admin kh«ng thÓ xem ®­îc tk cña superadmin
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
                "}Kinh nghiÖm: {g" .. WLib:MoneyFormat(nExp) .. " ®",
                "}Danh väng: {g" .. WLib:MoneyFormat(nDanhVong) .. " ®", "}S­ m«n: {g" .. WLib:MoneyFormat(nSuMon) .. " ®", "}Bang héi: {g" .. szTongName .. "",
                "}TÝch lòy CT: {g" .. WLib:MoneyFormat(nTichLuyCT) .. " ®", "}Qu©n c«ng: {g" .. WLib:MoneyFormat(nQuanCong) .. " ®", "}Qu©n Hµm: {g" .. szCampCT .. "-" .. tbQuanHam[abs(nQuanHam)] .. "",
                "}Ng«i Sao MM: {g" .. WLib:MoneyFormat(nNSMMUseCount) .. " c", "}N÷ Oa BH: {g" .. WLib:MoneyFormat(nNuOaUseCount) .. " c");

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
        -- kiÓm tra d÷ liÖu
        return WEnv.RETCODE_ERROR;
    end

    WPlayer:SetUserData("_wgm_player_ShowPlayerProcessMenu", tbPlayerInfo);
    local szOriginalSenderName = tbPlayerInfo[1];
    if szOriginalSenderName ~= WPlayer:GetName() then
        -- do hµm nµy ch¹y qua 2 hµm send package, cã thÓ sÏ sai d÷ liÖu nªn cÇn kiÓm tra ng­êi göi gèc
        return WEnv.RETCODE_ERROR;
    end
    if _wgm_IsHaveAccessFunction("_wgm_player_ShowPlayerProcessMenu") == WEnv.FALSE then
        -- kiÓm tra cã quyÒn sö dông hµm nµy míi cho më
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
    _wgm_InsertSay(tbSay, "_wgm_player_FindPlayerByName", "T×m nh©n vËt kh¸c theo tªn/_wgm_player_FindPlayerByName");

    tinsert(tbSay, g_szSpaceLine);
    --_wgm_InsertSay(tbSay, "_wgm_player_ShowPlayerProcessMenu", format("Xem chi tiÕt nh©n vËt nµy/#_wgm_player_ShowPlayerProcessMenu(%q, 1)", szFindPlayerName));

    if WPlayer:GetName() ~= szFindPlayerName then
        -- Më chÝnh b¶n th©n th× kh«ng sö dông ®­îc mét sè hµm sau
        _wgm_InsertSay(tbSay, "_wgm_player_JumpToPlayer", format("Nh¶y ®Õn vÞ trÝ ng­êi ch¬i/#_wgm_SafeNewWorld(%d, %d, %d, 1)", nMapId, nPosX, nPosY));
        _wgm_InsertSay(tbSay, "_wgm_player_MovePlayerToHere", format("DÞch chuyÓn ng­êi ch¬i ®Õn.../#_wgm_player_MovePlayerToHere(%q)", szFindPlayerName));

        if bIsOffline == 1 then
            _wgm_InsertSay(tbSay, "_wgm_player_ForceClearBCH", format("Kick nh©n vËt ®· ñy th¸c (xãa thêi gian BCH)/#_wgm_player_ForceClearBCH(%q)", szFindPlayerName));
        else
            _wgm_InsertSay(tbSay, "_wgm_player_KickoutGame", format("Kick nh©n vËt ra khái game/#_wgm_player_KickoutGame(%q)", szFindPlayerName));
        end
        _wgm_InsertSay(tbSay, "_wgm_player_LockAccount", format("Khãa tµi kho¶n vµ kÝch khái game/#_wgm_player_LockAccount(%q)", szFindPlayerName));
        _wgm_InsertSay(tbSay, "_wgm_player_BanMac", format("CÊm ®¨ng nhËp vµ kick c¸c nh©n vËt liªn quan/#_wgm_player_BanMac(%q)", szFindPlayerName));
        _wgm_InsertSay(tbSay, "_wgm_player_BanMac", format("LÊy ®Þa chØ mac/#AskClientForString(\"nothing\", %q, 1, 32, \"BÊm Ctrl+C copy\")", szCurrentLoginMAC));

        if nMapId >= 881 and nMapId <= 884 then
            -- KiÓm tra trong map chiÕn tr­êng
            _wgm_InsertSay(tbSay, "_wgm_player_KickoutBattle", format("Kick khái chiÕn tr­êng/#_wgm_player_KickoutBattle(%q)", szFindPlayerName));
        end
    end
    _wgm_InsertSay(tbSay, "_wgm_player_ResetBattle", format("Reset ®¨ng ký chiÕn tr­êng/#_wgm_player_ResetBattle(%q)", szFindPlayerName));

    if bIsForbitChat == 1 then
        _wgm_InsertSay(tbSay, "_wgm_player_ForbitChat", format("Më chat (cßn %d)/#_wgm_player_ForbitChat(%q, 0)", WTask:Get(WTASKID_PLAYERSTATE_CAMCHAT_REMAINING), szFindPlayerName));
    else
        _wgm_InsertSay(tbSay, "_wgm_player_ForbitChat", format("CÊm chat/#_wgm_player_ForbitChat(%q, 1)", szFindPlayerName));
    end
    --if bIsPrision == 1 then -- chua co ham bat giam
    --    _wgm_InsertSay(tbSay, "_wgm_player_ArrestPlayer", format("Th¶ tù do (cßn %d)/#_wgm_player_ArrestPlayer(%q, 0)", WTask:Get(WTASKID_PLAYERSTATE_BATGIAM_REMAINING), szFindPlayerName));
    --else
    --    _wgm_InsertSay(tbSay, "_wgm_player_ArrestPlayer", format("B¾t giam/#_wgm_player_ArrestPlayer(%q, 1)", szFindPlayerName));
    --end
    if nFightState == 1 then
        _wgm_InsertSay(tbSay, "_wgm_player_SetFightState", format("§­a nh©n vËt vÒ tr¹ng th¸i phi chiÕn ®Êu/#_wgm_player_SetFightState(%q, 0)", szFindPlayerName));
    else
        _wgm_InsertSay(tbSay, "_wgm_player_SetFightState", format("§­a nh©n vËt vÒ tr¹ng th¸i chiÕn ®Êu/#_wgm_player_SetFightState(%q, 1)", szFindPlayerName));
    end

    tinsert(tbSay, g_szSpaceLine);
    _wgm_InsertSay(tbSay, "_wgm_player_TempUnlockBox", format("Më khãa r­¬ng ®å t¹m thêi/#_wgm_player_TempUnlockBox(%q)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_ClearBoxPassword", format("Xãa m· më r­¬ng ®å/#_wgm_player_ClearBoxPassword(%q)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_ClearItemPassword", format("Xãa m· më khãa trang bÞ/#_wgm_player_ClearItemPassword(%q)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_LoadPlayerTask", format("Qu¶n lý task nh©n vËt/#_wgm_player_LoadPlayerTask(%q)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_AddItem", format("Thªm vËt phÈm/#_wgm_player_AddItem(%q)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_SavePlayerData", format("L­u d÷ liÖu nh©n vËt/#_wgm_player_SavePlayerData(%q)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_ModifyGold", format("§iÒu chØnh vµng cña nh©n vËt/#_wgm_player_ModifyGold(%q)", szFindPlayerName));

    tinsert(tbSay, g_szSpaceLine);
    tinsert(tbSay, "[x] T¹m thêi ch­a cÇn xö lý./nothing");
    WNpc:SayDialog(tbSay);
end
----------------------------------------------------------------------------------------------------
--- Më menu xö lý task nh©n vËt
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
        [11] = WTask:Get(336), -- s­ m«n
        [12] = WTask:Get(701), -- qu©n c«ng
        [13] = WTask:Get(707), -- tÝch lòy
        [14] = WTask:Get(704), -- qu©n hµm
        [15] = WTask:Get(3470), -- §¹i HiÖp LÖnh: taskbit nhËn th­ëng tiªu hao TKL
        [16] = WTask:Get(TASKID_WORLD_BOSS_USE), -- WorldBoss: taskbit  më r­¬ng
        [17] = WTask:Get(TASKID_BOOK_POPUR2), -- TiÕn cÊp mËt tÞch: ®iÓm lÞch luyÖn
        [18] = WTask:Get(TASKID_BOOK_POPUR2_TOTAL), -- TiÕn cÊp mËt tÞch: tæng ®iÓm lÞch luyÖn
        [19] = WTask:Get(TASKID_EVENT_MONTHLY_ITEM1), -- Monthly Event: tæng sè item 1 ®· dïng
        [20] = WTask:Get(TASKID_EVENT_MONTHLY_ITEM2), -- Monthly Event: tæng sè item 2 ®· dïng
        [21] = WTask:Get(TASKID_EVENT_MONTHLY_ITEM3), -- Monthly Event: tæng sè item 3 ®· dïng
        [22] = WTask:GetBit(TASKID_EVENT_MONTHLY_ACCUMULATE, TASKID_EVENT_MONTHLY_BIT_ACCUMULATE1), -- Monthly Event: tr¹ng th¸i ®· nhËn max item 1
        [23] = WTask:GetBit(TASKID_EVENT_MONTHLY_ACCUMULATE, TASKID_EVENT_MONTHLY_BIT_ACCUMULATE2), -- Monthly Event: tr¹ng th¸i ®· nhËn max item 2
        [24] = WTask:GetBit(TASKID_EVENT_MONTHLY_ACCUMULATE, TASKID_EVENT_MONTHLY_BIT_ACCUMULATE2), -- Monthly Event: tr¹ng th¸i ®· nhËn max item 3
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
        [1] = "Tiªu chuÈn",
        [2] = "Kh«i ng«",
        [3] = "KiÒu n÷",
        [4] = "Gîi c¶m",
    };

    local tbQuanHam = {
        [1] = "Binh sÜ",
        [2] = "HiÖu óy",
        [3] = "§« thèng",
        [4] = "Tiªn phong",
        [5] = "T­íng qu©n",
        [6] = "Nguyªn so¸i",
    };
    local szCampCT = "Ch­a";
    if nQuanCong > 0 then
        szCampCT = "Tèng";
    elseif nQuanCong < 0 then
        szCampCT = "Liªu";
    end

    if szTongName == "" then
        szTongName = "Ch­a gia nhËp";
    end

    -- chØ admin hoÆc superadmin míi cã thÓ thÊy ®­îc mét sè th«ng tin quan träng
    local szSayHeader = "";
    if WPlayer:IsSuperAdmin() == WEnv.TRUE or WPlayer:IsAdmin() == WEnv.TRUE then
        -- admin kh«ng thÓ xem ®­îc tk cña superadmin
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
                "}Kinh nghiÖm: {g" .. WLib:MoneyFormat(nExp) .. " ®",
                "}Danh väng: {g" .. WLib:MoneyFormat(nDanhVong) .. " ®", "}S­ m«n: {g" .. WLib:MoneyFormat(nSuMon) .. " ®", "}Bang héi: {g" .. szTongName .. "",
                "}TÝch lòy CT: {g" .. WLib:MoneyFormat(nTichLuyCT) .. " ®", "}Qu©n c«ng: {g" .. WLib:MoneyFormat(nQuanCong) .. " ®", "}Qu©n Hµm: {g" .. szCampCT .. "-" .. tbQuanHam[abs(nQuanHam)] .. "",
                "}Ng«i Sao MM: {g" .. WLib:MoneyFormat(nNSMMUseCount) .. " c", "}N÷ Oa BH: {g" .. WLib:MoneyFormat(nNuOaUseCount) .. " c");

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
        -- kiÓm tra d÷ liÖu
        return WEnv.RETCODE_ERROR;
    end

    WPlayer:SetUserData("_wgm_player_ShowPlayerTaskMenu", tbPlayerInfo);
    local szOriginalSenderName = tbPlayerInfo[1];
    if szOriginalSenderName ~= WPlayer:GetName() then
        -- do hµm nµy ch¹y qua 2 hµm send package, cã thÓ sÏ sai d÷ liÖu nªn cÇn kiÓm tra ng­êi göi gèc
        return WEnv.RETCODE_ERROR;
    end
    if _wgm_IsHaveAccessFunction("_wgm_player_ShowPlayerTaskMenu") == WEnv.FALSE then
        -- kiÓm tra cã quyÒn sö dông hµm nµy míi cho më
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
    _wgm_InsertSay(tbSay, "_wgm_player_ModifyDaiHiepLenh", format("§iÒu chØnh §¹i HiÖp LÖnh (nTaskValue=%d)/#_wgm_player_ModifyDaiHiepLenh(%q, %d)", nDaiHiepLenh, szFindPlayerName, nDaiHiepLenh));
    _wgm_InsertSay(tbSay, "_wgm_player_ModifyWorldBoss", format("§iÒu chØnh Boss thÕ giíi (nTaskValue=%d)/#_wgm_player_ModifyWorldBoss(%q, %d)", nWorldBoss, szFindPlayerName, nWorldBoss));
    _wgm_InsertSay(tbSay, "_wgm_player_ModifyPopur2", format("§iÒu chØnh ®iÓm LÞch LuyÖn (nCurPopu2=%d/nTotalPopur2=%d)/#_wgm_player_ModifyPopur2(%q, %d)", nLichLuyen, nLichLuyenTotal, szFindPlayerName, nLichLuyen));
    _wgm_InsertSay(tbSay, "_wgm_player_ModifyMonthlyEvent", format("§iÒu chØnh event h»ng th¸ng (e1=%d:%d, e2=%d:%d, e3=%d:%d)/#_wgm_player_ModifyMonthlyEvent(%q, %d)", nMonthlyEventUseItem1, nMonthlyEventMaxAward1, nMonthlyEventUseItem2, nMonthlyEventMaxAward2, nMonthlyEventUseItem3, nMonthlyEventMaxAward3, szFindPlayerName, 0));
    --_wgm_InsertSay(tbSay, "_wgm_player_SetTask", format("Phong l¹i qu©n hµm t­íng tèng/#_wgm_player_SetTask(%q, 704, 5, 0)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_SetTask", format("Set task/#_wgm_player_SetTask(%q)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_SetTaskBit", format("Set task bit/#_wgm_player_SetTaskBit(%q)", szFindPlayerName));
    _wgm_InsertSay(tbSay, "_wgm_player_SetTaskByte", format("Set task byte/#_wgm_player_SetTaskByte(%q)", szFindPlayerName));

    tinsert(tbSay, g_szSpaceLine);
    _wgm_InsertSay(tbSay, "_wgm_player_ShowPlayerProcessMenu", format("<<  Trë l¹i qu¶n lý nh©n vËt/#_wgm_player_ShowPlayerProcessMenu(%q)", WPlayer:GetName()));

    tinsert(tbSay, "[x] T¹m thêi ch­a cÇn xö lý./nothing");
    WNpc:SayDialog(tbSay);
end
----------------------------------------------------------------------------------------------------
--- C¸c hµm xö lý task mÆc ®Þnh
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
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 1, _wgm_player_SetTask, szFindPlayerName, nTaskID, nValue, nAccessCode);
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
    WGMLog:WriteRevCmdLog("_wgm_player_SetTask", "Set task nh©n vËt", "_wgm_player_SetTask_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nTaskID, nValue, nAccessCode, nBeforeValue, nAfterValue }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Set task nTaskID=%d nValue=%d nAccessCode=%d nNewValue=%d thµnh c«ng!", nTaskID, nValue, nAccessCode, WTask:Get(nTaskID)) });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Set task nTaskID=%d nValue=%d nAccessCode=%d nNewValue=%d thÊt b¹i!", nTaskID, nValue, nAccessCode, WTask:Get(nTaskID)) });
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
    WGMLog:WriteRevCmdLog("_wgm_player_ModifyTask", "Modify task nh©n vËt", "_wgm_player_ModifyTask_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nTaskID, nValue, nAccessCode, nBeforeValue, nAfterValue }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Modify task nTaskID=%d nValue=%d nAccessCode=%d nNewValue=%d thµnh c«ng!", nTaskID, nValue, nAccessCode, WTask:Get(nTaskID)) });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Modify task nTaskID=%d nValue=%d nAccessCode=%d nNewValue=%d thÊt b¹i!", nTaskID, nValue, nAccessCode, WTask:Get(nTaskID)) });
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
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 1, _wgm_player_SetTaskByte, szFindPlayerName, nTaskID, nByteID, nValue, nAccessCode);
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
    WGMLog:WriteRevCmdLog("_wgm_player_SetTaskByte", "Set task byte nh©n vËt", "_wgm_player_SetTaskByte_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nTaskID, nByteID, nValue, nAccessCode, nBeforeValue, nAfterValue }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Set task byte nTaskID=%d nByteID=%d nValue=%d nAccessCode=%d nNewValue=%d thµnh c«ng!", nTaskID, nByteID, nValue, nAccessCode, WTask:GetByte(nTaskID, nByteID)) });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Set task byte nTaskID=%d nByteID=%d nValue=%d nAccessCode=%d nNewValue=%d thÊt b¹i!", nTaskID, nByteID, nValue, nAccessCode, WTask:GetByte(nTaskID, nByteID)) });
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
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 1, _wgm_player_SetTaskBit, szFindPlayerName, nTaskID, nBitID, nValue, nAccessCode);
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
    WGMLog:WriteRevCmdLog("_wgm_player_SetTaskBit", "Set task bit nh©n vËt", "_wgm_player_SetTaskBit_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nTaskID, nBitID, nValue, nAccessCode, nBeforeValue, nAfterValue }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Set task bit nTaskID=%d nBitID=%d nValue=%d nAccessCode=%d nNewValue=%d thµnh c«ng!", nTaskID, nBitID, nValue, nAccessCode, WTask:GetBit(nTaskID, nBitID)) });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Set task bit nTaskID=%d nBitID=%d nValue=%d nAccessCode=%d nNewValue=%d thÊt b¹i!", nTaskID, nBitID, nValue, nAccessCode, WTask:GetBit(nTaskID, nBitID)) });
    end
    return nRetCode;
end
----------------------------------------------------------------------------------------------------
--- C¸c hµm xö lý task theo tÝnh n¨ng
function _wgm_player_ModifyDaiHiepLenh(szFindPlayerName, nTaskValue, nBitID, nValue, szMsg)
    local TSK_ID_IB_AWARD = { 3470, 43 };
    local nTaskID = TSK_ID_IB_AWARD[1];
    local nAccessCode = TSK_ID_IB_AWARD[2];
    if nBitID == WEnv.NULL then
        local tbSay = { "<color=green>§¹i HiÖp LÖnh<color>: Chän thao t¸c víi tr¹ng th¸i nhËn th­ëng" };

        for nSelectIdx = 1, 7 do
            -- T_IB_AWARD cã 7 index
            local bGetFlag = GetBit(nTaskValue, nSelectIdx);
            if bGetFlag == 1 then
                _wgm_InsertSay(tbSay, "_wgm_player_ModifyDaiHiepLenh", format("Set ch­a nhËn mèc %d/#_wgm_player_ModifyDaiHiepLenh(%q, %d, %d, 0)", nSelectIdx, szFindPlayerName, nTaskValue, nSelectIdx));
            else
                _wgm_InsertSay(tbSay, "_wgm_player_ModifyDaiHiepLenh", format("Set ®· nhËn mèc %d/#_wgm_player_ModifyDaiHiepLenh(%q, %d, %d, 1)", nSelectIdx, szFindPlayerName, nTaskValue, nSelectIdx));
            end
        end

        --_wgm_InsertSay(tbSay, "_wgm_player_SetTask_OnTarget", format("Reset task mèc th­ëng vÒ 0/#_wgm_SendPackage(%q, nil, \"_wgm_player_SetTask_OnTarget\", {%q, %d, %d, %d})", szFindPlayerName, "Reset task lçi", nTaskID, 0, nAccessCode));
        tinsert(tbSay, g_szSpaceLine);
        _wgm_InsertSay(tbSay, "_wgm_player_SetTKLUsed", format("Set sè l­îng Thiªn Kiªu LÖnh ®· dïng/#_wgm_player_SetTKLUsed(%q)", szFindPlayerName));
        _wgm_InsertSay(tbSay, "_wgm_player_ModifyDaiHiepLenh", format("Reset task mèc th­ëng vÒ 0/#_wgm_player_ModifyDaiHiepLenh(%q, %d, %d, 0)", szFindPlayerName, nTaskValue, -1));

        tinsert(tbSay, g_szSpaceLine);
        _wgm_InsertSay(tbSay, "_wgm_player_ShowPlayerTaskMenu", format("<<  Trë l¹i qu¶n lý task nh©n vËt/#_wgm_player_ShowPlayerTaskMenu(%q)", WPlayer:GetName()));

        tinsert(tbSay, "[x] T¹m thêi ch­a cÇn xö lý./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_ModifyDaiHiepLenh, szFindPlayerName, nTaskValue, nBitID, nValue);
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
        WLib:InputNumber("NhËp sè l­îng...", 0, 10000, 0, _wgm_player_SetTKLUsed, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_SetTKLUsed, szFindPlayerName, nValue);
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
    WGMLog:WriteRevCmdLog("_wgm_player_SetTKLUsed", "Set sè lÇn dïng TKL", "_wgm_player_SetTKLUsed_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nTaskID, nValue, nAccessCode, nBeforeValue, nAfterValue }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Set sè l­îng TKL ®· sö dông =%d thµnh c«ng!", nValue) });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Set sè l­îng TKL ®· sö dông =%d thÊt b¹i!", nValue) });
    end
    return nRetCode;
end

function _wgm_player_ModifyWorldBoss(szFindPlayerName, nTaskValue, nBitID, nValue, szMsg)
    local nTaskID = TASKID_WORLD_BOSS_USE;
    local nAccessCode = TASK_ACCESS_CODE_WORLD_BOSS;
    if nBitID == WEnv.NULL then
        local tbSay = { "<color=green>Boss thÕ giíi<color>: Chän thao t¸c víi tr¹ng th¸i tÝnh n¨ng" };

        for nSelectIdx = 1, 2 do
            -- TASKID_WORLD_BOSS_USE cã 2 lo¹i §¹i ChiÕn B¶o H¹p
            local bGetFlag = GetBit(nTaskValue, nSelectIdx);
            if bGetFlag == 1 then
                _wgm_InsertSay(tbSay, "_wgm_player_ModifyWorldBoss", format("Set ch­a nhËn §¹i ChiÕn B¶o H¹p %d/#_wgm_player_ModifyWorldBoss(%q, %d, %d, 0)", nSelectIdx, szFindPlayerName, nTaskValue, nSelectIdx));
            else
                _wgm_InsertSay(tbSay, "_wgm_player_ModifyWorldBoss", format("Set ®· nhËn §¹i ChiÕn B¶o H¹p %d/#_wgm_player_ModifyWorldBoss(%q, %d, %d, 1)", nSelectIdx, szFindPlayerName, nTaskValue, nSelectIdx));
            end
        end

        local nSelectIdx = 3; -- R­¬ng Vµng §¹i ChiÕn
        local bGetFlag = GetBit(nTaskValue, nSelectIdx);
        if bGetFlag == 1 then
            _wgm_InsertSay(tbSay, "_wgm_player_ModifyWorldBoss", format("Set ch­a nhËn R­¬ng Vµng §¹i ChiÕn/#_wgm_player_ModifyWorldBoss(%q, %d, %d, 0)", szFindPlayerName, nTaskValue, nSelectIdx));
        else
            _wgm_InsertSay(tbSay, "_wgm_player_ModifyWorldBoss", format("Set ®· nhËn R­¬ng Vµng §¹i ChiÕn/#_wgm_player_ModifyWorldBoss(%q, %d, %d, 1)", szFindPlayerName, nTaskValue, nSelectIdx));
        end

        tinsert(tbSay, g_szSpaceLine);
        _wgm_InsertSay(tbSay, "_wgm_player_ModifyWorldBoss", format("Reset task më r­¬ng vÒ 0/#_wgm_player_ModifyWorldBoss(%q, %d, %d, 0)", szFindPlayerName, nTaskValue, -1));

        tinsert(tbSay, g_szSpaceLine);
        _wgm_InsertSay(tbSay, "_wgm_player_ShowPlayerTaskMenu", format("<<  Trë l¹i qu¶n lý task nh©n vËt/#_wgm_player_ShowPlayerTaskMenu(%q)", WPlayer:GetName()));

        tinsert(tbSay, "[x] T¹m thêi ch­a cÇn xö lý./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_ModifyWorldBoss, szFindPlayerName, nTaskValue, nBitID, nValue);
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
        local tbSay = { "<color=green>§iÓm lÞch luyÖn<color>: Chän thao t¸c víi tr¹ng th¸i tÝnh n¨ng" };

        _wgm_InsertSay(tbSay, "_wgm_player_ModifyPopur2", format("Céng thªm ®iÓm lÞch luyÖn/#_wgm_player_ModifyPopur2(%q, %d, 1)", szFindPlayerName, nTaskValue));
        _wgm_InsertSay(tbSay, "_wgm_player_ModifyPopur2", format("Trõ ®iÓm lÞch luyÖn/#_wgm_player_ModifyPopur2(%q, %d, 2)", szFindPlayerName, nTaskValue));

        tinsert(tbSay, g_szSpaceLine);
        _wgm_InsertSay(tbSay, "_wgm_player_ShowPlayerTaskMenu", format("<<  Trë l¹i qu¶n lý task nh©n vËt/#_wgm_player_ShowPlayerTaskMenu(%q)", WPlayer:GetName()));

        tinsert(tbSay, "[x] T¹m thêi ch­a cÇn xö lý./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if nValue == WEnv.NULL then
        local szTitleText = "Sè ®iÓm céng...";
        if nBitID ~= 1 then
            szTitleText = "Sè ®iÓm trõ...";
        end
        WLib:InputNumber(szTitleText, 1, 100000, 0, _wgm_player_ModifyPopur2, szFindPlayerName, nTaskValue, nBitID);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_ModifyPopur2, szFindPlayerName, nTaskValue, nBitID, nValue);
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
    WGMLog:WriteRevCmdLog("_wgm_player_ModifyPopur2", "Set ®iÓm lÞch luyÖn", "_wgm_player_ModifyPopur2_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nTaskID, nValue, nAccessCode, nBeforeValue, nAfterValue }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] §iÒu chØnh %d ®iÓm lÞch luyÖn thµnh c«ng, gi¸ trÞ míi =%s!", nValue, nAfterValue) });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] §iÒu chØnh %d ®iÓm lÞch luyÖn thÊt b¹i, gi¸ trÞ cò =%s!", nValue, nAfterValue) });
    end
    return nRetCode;
end
----------------------------------------------------------------------------------------------------
--- Hµm thªm vËt phÈm
function _wgm_player_AddItem(szFindPlayerName, szInput, bConfirm, szMsg)
    if szInput == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "M· vËt phÈm...", 1, 32, 1, _wgm_player_AddItem, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    local szItemName = "";
    local parts = WLib:Split(szInput, " ");
    local nLength = getn(parts);
    if nLength < 3 then
        WPlayer:Msg("Sai có ph¸p, nhËp ®Þnh d¹ng x x x...");
        return WEnv.RETCODE_ERROR;
    else
        szItemName = WItem:GetName(parts[1], parts[2], parts[3]);
        if szItemName == WEnv.NULL or szItemName == "" then
            WPlayer:Msg("VËt phÈm kh«ng tån t¹i!");
            return WEnv.RETCODE_ERROR;
        end
    end

    parts[4] = parts[4] or 1;
    parts[5] = parts[5] or 4;
    if bConfirm ~= 1 then
        local szLock = ITEMSTATUS_NAMES[tonumber(parts[5])] or "unknow";
        WNpc:SayConfirm(format("B¹n muèn thªm vËt phÈm [<color=green>%s<color>]x<color=green>%d (%s)<color> vµo nh©n vËt [<color=yellow>%s<color>]?", szItemName, parts[4], szLock, szFindPlayerName),
                format("_wgm_player_AddItem(%q, %q, 1)", szFindPlayerName, szInput));
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_AddItem, szFindPlayerName, szInput, bConfirm);
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
        --WNpc:Talk(format("B¹n nhËn ®­îc %d %s!", tbAward.nStack, tbAward.szName)..szNewMsg, WEnv.TRUE);
        nRetCode = WEnv.RETCODE_SUCCESS;
        WGMLog:WriteRevCmdLog("_wgm_player_AddItem", "Add vËt phÈm vµo nh©n vËt", "_wgm_player_AddItem_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, tbAward.tbProp[1], tbAward.tbProp[2], tbAward.tbProp[3], tbAward.nStack, tbAward.nStatus }, szSenderName);
    end
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Thªm %d %s (%s) ®Õn ng­êi ch¬i thµnh c«ng!", tbAward.nStack, tbAward.szName, ITEMSTATUS_NAMES[tbAward.nStatus] or "unknow") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Thªm vËt phÈm ®Õn ng­êi ch¬i thÊt b¹i!") });
    end
    return nRetCode;
end
----------------------------------------------------------------------------------------------------
--- C¸c hµm xö lý nh©n vËt kh«ng cïng gs theo mÉu nhÊt qu¸n nh­ sau:
--- hµm ch¹y trªn ng­êi gäi: "_wgm_player_FuncName" víi biÕn ®Çu tiªn lu«n lµ szFindPlayerName=tªn ng­êi cÇn xö lý
--- hµm ch¹y trªn ng­êi cÇn xö lý: "_wgm_player_FuncName_OnTarget" víi biÕn ®Çu tiªn lu«n lµ szSenderName= tªn ng­êi göi lÖnh
function _wgm_player_ForceClearBCH(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_ForceClearBCH, szFindPlayerName);
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
    WTask:Set(2501, 0); -- B¹ch C©u Hoµn
    WTask:Set(2507, 0); -- §¹i B¹ch C©u hoµn
    WTask:Set(2508, 0); -- B¹ch C©u Tiªn ®¬n
    WNpc:Talk("B¹n ®· bÞ hñy giê ñy th¸c!" .. szNewMsg, WEnv.TRUE);
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_ForceClearBCH", "Xãa thêi gian ñy th¸c BCH", "_wgm_player_ForceClearBCH_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nBCH, nDBCH, nBCTD }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Xãa giê ch¬i cña ng­êi ch¬i thµnh c«ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Xãa giê ch¬i cña ng­êi ch¬i thÊt b¹i!") });
    end
    return nRetCode;
end

function _wgm_player_MovePlayerToHere(szFindPlayerName, nMapId, nPosX, nPosY, szMsg)
    if nMapId == WEnv.NULL then
        local nCurrentMapID, nCurrentPosX, nCurrentPosY = WPlayer:GetWorldPos();
        local tbSay = { format("H·y chän n¬i muèn ®­a nh©n vËt [<color=yellow>%s<color>] ®Õn!", szFindPlayerName) };

        _wgm_InsertSay(tbSay, "_wgm_player_MovePlayerToHere", format("DÞch chuyÓn ng­êi ch¬i ®Õn vÞ trÝ nµy/#_wgm_player_MovePlayerToHere(%q, %d, %d, %d)", szFindPlayerName, nCurrentMapID, nCurrentPosX, nCurrentPosY));
        _wgm_InsertSay(tbSay, "_wgm_player_MovePlayerToRandomCity", format("DÞch chuyÓn ng­êi ch¬i ®Õn ngÉu nhiªn c¸c thµnh/#_wgm_player_MovePlayerToRandomCity(%q)", szFindPlayerName));

        tinsert(tbSay, g_szSpaceLine);
        _wgm_InsertSay(tbSay, "_wgm_player_ShowPlayerProcessMenu", format("<<  Trë l¹i qu¶n lý nh©n vËt/#_wgm_player_ShowPlayerProcessMenu(%q)", WPlayer:GetName()));

        tinsert(tbSay, "[x] T¹m thêi ch­a cÇn xö lý./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_MovePlayerToHere, szFindPlayerName, nMapId, nPosX, nPosY);
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
    WGMLog:WriteRevCmdLog("_wgm_player_MovePlayerToHere", "DÞch chuyÓn nh©n vËt ®Õn vÞ trÝ hiÖn t¹i", "_wgm_player_MovePlayerToHere_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nMapId, nPosX, nPosY }, szSenderName);
    if _wgm_SafeNewWorld(nMapId, nPosX, nPosY, 1) == 1 then
        WNpc:Talk("B¹n ®· ®­îc admin dÞch chuyÓn ®Õn vÞ trÝ nµy!" .. szNewMsg, WEnv.TRUE);
    end
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] DÞch chuyÓn ng­êi ch¬i ®Õn %s(%d/%d) thµnh c«ng!", GetMapName(nMapId) or "map_" .. nMapId, floor(nPosX / 8), floor(nPosY / 16)) });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] DÞch chuyÓn ng­êi ch¬i ®Õn %s(%d/%d) thÊt b¹i!", GetMapName(nMapId) or "map_" .. nMapId, floor(nPosX / 8), floor(nPosY / 16)) });
    end
    return nRetCode;
end

function _wgm_player_MovePlayerToRandomCity(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_MovePlayerToRandomCity, szFindPlayerName);
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
    local nRandomCitySelect = random(1, 7); -- 7 thµnh thÞ, 8 lµ vâ l©m minh
    local nRandomCityPosSelect = random(1, getn(g_tbCityTransport[nRandomCitySelect][2]));
    local nMapId = g_tbCityTransport[nRandomCitySelect][2][nRandomCityPosSelect][1];
    local nPosX = g_tbCityTransport[nRandomCitySelect][2][nRandomCityPosSelect][2] + random(-5, 5);
    local nPosY = g_tbCityTransport[nRandomCitySelect][2][nRandomCityPosSelect][3] + random(-5, 5);
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_MovePlayerToRandomCity", "DÞch chuyÓn nh©n vËt ®Õn ngÉu nhiªn thµnh", "_wgm_player_MovePlayerToRandomCity_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, nMapId, nPosX, nPosY }, szSenderName);
    if _wgm_SafeNewWorld(nMapId, nPosX, nPosY, 1) == 1 then
        WNpc:Talk("B¹n ®· ®­îc admin dÞch chuyÓn ®Õn vÞ trÝ nµy!" .. szNewMsg, WEnv.TRUE);
    end
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] DÞch chuyÓn ng­êi ch¬i ®Õn %s(%d/%d) thµnh c«ng!", GetMapName(nMapId) or "map_" .. nMapId, floor(nPosX / 8), floor(nPosY / 16)) });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] DÞch chuyÓn ng­êi ch¬i ®Õn %s(%d/%d) thÊt b¹i!", GetMapName(nMapId) or "map_" .. nMapId, floor(nPosX / 8), floor(nPosY / 16)) });
    end
    return nRetCode;
end

function _wgm_player_LockAccount(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_LockAccount, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == "" then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_LockAccount, szFindPlayerName);
        WNpc:Talk("CÇn ghi râ lý do khãa tµi kho¶n nµy!", WEnv.TRUE);
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
    WGMLog:WriteRevCmdLog("_wgm_player_LockAccount", "KÝch nh©n vËt", "_wgm_player_LockAccount_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Khãa tµi kho¶n thµnh c«ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Khãa tµi kho¶n thÊt b¹i!") });
    end
    return _wgm_player_KickoutGame_OnTarget(szSenderName, szMsg);
end

function _wgm_player_KickoutGame(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_KickoutGame, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == "" then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_KickoutGame, szFindPlayerName);
        WNpc:Talk("CÇn ghi râ lý do kick nh©n vËt nµy!", WEnv.TRUE);
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
    WGMLog:WriteRevCmdLog("_wgm_player_KickoutGame", "KÝch nh©n vËt", "_wgm_player_KickoutGame_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] KÝch nh©n vËt thµnh c«ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] KÝch nh©n vËt thÊt b¹i!") });
    end
    return nRetCode;
end

function _wgm_player_BanMac(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_BanMac, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == "" then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_BanMac, szFindPlayerName);
        WNpc:Talk("CÇn ghi râ lý do cÊm ®¨ng nhËp!", WEnv.TRUE);
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
    WGMLog:WriteRevCmdLog("_wgm_player_BanMac", "ChÆn ®Þa chØ MAC", "_wgm_player_BanMac_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, szOldCurrentLoginMAC }, szSenderName);

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
                { format("[SUCCESS] ChÆn ®¨ng nhËp thµnh c«ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] ChÆn ®¨ng nhËp thÊt b¹i!") });
    end
    return nRetCode;
end

function _wgm_player_KickoutBattle(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_KickoutBattle, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == "" then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_KickoutBattle, szFindPlayerName);
        WNpc:Talk("CÇn ghi râ lý do kick nh©n vËt nµy!", WEnv.TRUE);
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
        [1] = 25, -- th«n trang
        [2] = 26, -- th¶o cèc
        [3] = 27, -- ph¸o ®µi
        [4] = 28, -- nh¹n m«n quan
        [5] = 40, -- ngäc m«n quan
    };
    local PT_SIGN_UP = 711;
    local nSignUpData = WTask:Get(PT_SIGN_UP);
    local nBattleType = floor(nSignUpData / 10);
    local nCamp = mod(nSignUpData, 10);
    local MISSION_ID = tbMissionID[nBattleType];
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_KickoutBattle", "Lo¹i khái chiÕn tr­êng", "_wgm_player_KickoutBattle_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg }, szSenderName);
    if _wgm_SafeNewWorld(400, 1519 + random(-5, 5), 2983 + random(-5, 5), 1) ~= 0 then
        DelMSPlayer(MISSION_ID, nCamp); -- Xãa nh©n vËt khái chiÕn tr­êng
        WTask:Set(PT_SIGN_UP, 0); -- Xãa ®¨ng ký chiÕn tr­êng
        WNpc:Talk("B¹n ®· bÞ admin lo¹i khái chiÕn tr­êng!" .. szNewMsg, WEnv.TRUE);
    end
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Lo¹i khái chiÕn tr­êng thµnh c«ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Lo¹i khái chiÕn tr­êng thÊt b¹i!") });
    end
    return nRetCode;
end

function _wgm_player_ResetBattle(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_ResetBattle, szFindPlayerName);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == "" then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_ResetBattle, szFindPlayerName);
        WNpc:Talk("CÇn ghi râ lý do reset chiÕn tr­êng nh©n vËt nµy!", WEnv.TRUE);
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
        [1] = 25, -- th«n trang
        [2] = 26, -- th¶o cèc
        [3] = 27, -- ph¸o ®µi
        [4] = 28, -- nh¹n m«n quan
        [5] = 40, -- ngäc m«n quan
    };
    local PT_SIGN_UP = 711;
    local PT_BATTLE_DATE = 712;
    local nSignUpData = WTask:Get(PT_SIGN_UP);
    local nBattleType = floor(nSignUpData / 10);
    local nCamp = mod(nSignUpData, 10);
    local MISSION_ID = tbMissionID[nBattleType];
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_ResetBattle", "Lo¹i khái chiÕn tr­êng", "_wgm_player_ResetBattle_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg }, szSenderName);

    WTask:Set(PT_BATTLE_DATE, 0); -- Xo¸ lÞch sö ®¨ng ký chiÕn tr­êng
    WTask:Set(PT_SIGN_UP, 0); -- Xãa ®¨ng ký chiÕn tr­êng
    WNpc:Talk("B¹n ®· ®­îc admin reset ®¨ng ký chiÕn tr­êng!" .. szNewMsg, WEnv.TRUE);
    local nMapId = WPlayer:GetWorldPos();
    if nMapId >= 881 and nMapId <= 884 then
        DelMSPlayer(MISSION_ID, nCamp); -- Xãa nh©n vËt khái chiÕn tr­êng
        _wgm_SafeNewWorld(200, 1360 + random(-5, 5), 2877 + random(-5, 5), 1);
    end
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Reset ®¨ng ký chiÕn tr­êng thµnh c«ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Reset ®¨ng ký chiÕn tr­êng thÊt b¹i!") });
    end
    return nRetCode;
end

function _wgm_player_ForbitChat(szFindPlayerName, bFlag, nTime, szMsg)
    nTime = nTime or 15;
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Time;Lý do...", 1, 32, 0, _wgm_player_ForbitChat, szFindPlayerName, bFlag, nTime);
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
        WNpc:Talk("B¹n ®· bÞ cÊm chat do sö dông ng«n tõ kh«ng phï hîp!" .. szNewMsg, WEnv.TRUE);
    else
        WTask:Set(WTASKID_PLAYERSTATE_CAMCHAT_TOTALTIME, 0);
        WTask:Set(WTASKID_PLAYERSTATE_CAMCHAT_REMAINING, 0);
        WNpc:Talk("B¹n ®· ®­îc më chat trë l¹i, h·y cÈn träng ng«n tõ!" .. szNewMsg, WEnv.TRUE);
    end
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_ForbitChat", "CÊm chat nh©n vËt", "_wgm_player_ForbitChat_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, bFlag, nTime }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        if bFlag == 1 then
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[SUCCESS] CÊm chat nh©n vËt thµnh c«ng!") });
        else
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[SUCCESS] Më chat nh©n vËt thµnh c«ng!") });
        end
    else
        if bFlag == 1 then
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[FAIL] CÊm chat nh©n vËt thÊt b¹i!") });
        else
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[FAIL] Më chat nh©n vËt thÊt b¹i!") });
        end
    end
    return nRetCode;
end

function _wgm_player_ArrestPlayer(szFindPlayerName, bFlag, nTime, szMsg)
    nTime = nTime or 15;
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Time;Lý do...", 1, 32, 0, _wgm_player_ArrestPlayer, szFindPlayerName, bFlag, nTime);
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
        WNpc:Talk("B¹n ®· bÞ b¾t giam!" .. szNewMsg, WEnv.TRUE);
    else
        WTask:Set(WTASKID_PLAYERSTATE_BATGIAM_TOTALTIME, 0);
        WTask:Set(WTASKID_PLAYERSTATE_BATGIAM_REMAINING, 0);
        WNpc:Talk("B¹n ®· ®­îc th¶ tù do!" .. szNewMsg, WEnv.TRUE);
    end
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_ArrestPlayer", "B¾t giam nh©n vËt", "_wgm_player_ArrestPlayer_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, bFlag, nTime }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        if bFlag == 1 then
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[SUCCESS] B¾t giam nh©n vËt thµnh c«ng!") });
        else
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[SUCCESS] Phãng thÝch nh©n vËt thµnh c«ng!") });
        end
    else
        if bFlag == 1 then
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[FAIL] B¾t giam nh©n vËt thÊt b¹i!") });
        else
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[FAIL] Phãng thÝch nh©n vËt thÊt b¹i!") });
        end
    end
    return nRetCode;
end

function _wgm_player_SetFightState(szFindPlayerName, bFlag, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_SetFightState, szFindPlayerName, bFlag);
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
        WNpc:Talk("Tr¹ng th¸i nh©n vËt ®­îc ®Æt thµnh chiÕn ®Êu!" .. szNewMsg, WEnv.TRUE);
    else
        WNpc:Talk("Tr¹ng th¸i nh©n vËt ®­îc ®Æt thµnh phi chiÕn ®Êu!" .. szNewMsg, WEnv.TRUE);
    end
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_SetFightState", "Set tr¹ng th¸i chiÕn ®Êu nh©n vËt", "_wgm_player_SetFightState_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg, bFlag }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        if bFlag == 1 then
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[SUCCESS] §­a nh©n vËt vÒ tr¹ng th¸i chiÕn ®Êu thµnh c«ng!") });
        else
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[SUCCESS] §­a nh©n vËt vÒ tr¹ng th¸i chiÕn ®Êu thµnh c«ng!") });
        end
    else
        if bFlag == 1 then
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[FAIL] §­a nh©n vËt vÒ tr¹ng th¸i chiÕn ®Êu thÊt b¹i!") });
        else
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[FAIL] §­a nh©n vËt vÒ tr¹ng th¸i chiÕn ®Êu thÊt b¹i!") });
        end
    end
    return nRetCode;
end

function _wgm_player_TempUnlockBox(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_TempUnlockBox, szFindPlayerName);
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
    WNpc:Talk("B¹n ®· ®­îc më khãa r­¬ng ®å t¹m thêi!\n<color=red>Chó ý b¶o qu¶n tµi s¶n sau khi më khãa!<color>" .. szNewMsg, WEnv.TRUE);
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_TempUnlockBox", "Më r­¬ng t¹m thêi", "_wgm_player_TempUnlockBox_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Më khãa r­¬ng t¹m thêi thµnh c«ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Më khãa r­¬ng t¹m thêi thÊt b¹i!") });
    end
    return nRetCode;
end

function _wgm_player_ClearBoxPassword(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_ClearBoxPassword, szFindPlayerName);
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
    WNpc:Talk("B¹n ®· ®­îc më khãa r­¬ng ®å!\n<color=red>Chó ý b¶o qu¶n tµi s¶n sau khi më khãa!<color>" .. szNewMsg, WEnv.TRUE);
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_ClearBoxPassword", "Xãa pass r­¬ng", "_wgm_player_ClearBoxPassword_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Më khãa r­¬ng thµnh c«ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Më khãa r­¬ng thÊt b¹i!") });
    end
    return nRetCode;
end

function _wgm_player_ClearItemPassword(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_ClearItemPassword, szFindPlayerName);
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
    WNpc:Talk("B¹n ®· ®­îc më khãa tÊt c¶ c¸c trang bÞ trªn ng­êi, h·y trë l¹i ®Ó hoµn tÊt qu¸ tr×nh!\n<color=red>Chó ý b¶o qu¶n tµi s¶n sau khi më khãa!<color>" .. szNewMsg, WEnv.TRUE);
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_ClearItemPassword", "Xãa pass khãa trang bÞ", "_wgm_player_ClearItemPassword_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] Më khãa vËt phÈm thµnh c«ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] Më khãa vËt phÈm thÊt b¹i!") });
    end
    return nRetCode;
end

function _wgm_player_SavePlayerData(szFindPlayerName, szMsg)
    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_SavePlayerData, szFindPlayerName);
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
    WNpc:Talk("B¹n ®· ®­îc admin l­u d÷ liÖu nh©n vËt!" .. szNewMsg, WEnv.TRUE);
    nRetCode = WEnv.RETCODE_SUCCESS;
    WGMLog:WriteRevCmdLog("_wgm_player_SavePlayerData", "L­u d÷ liÖu nh©n vËt", "_wgm_player_SavePlayerData_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, szMsg }, szSenderName);
    --- END TODO

    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] L­u d÷ liÖu nh©n vËt thµnh c«ng!") });
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] L­u d÷ liÖu nh©n vËt thÊt b¹i!") });
    end
    return nRetCode;
end

function _wgm_player_ModifyGold(szFindPlayerName, nAddOrRemove, nGoldModify, bForce, szMsg)
    nAddOrRemove = tonumber(nAddOrRemove) or 0;
    bForce = tonumber(bForce) or 0;
    local nGoldMin = 1;
    local nGoldMax = 100000 - 1;

    if nAddOrRemove == 0 then
        local tbSay = { "Chän thao t¸c:" };

        _wgm_InsertSay(tbSay, "_wgm_player_ModifyGold", format("Trõ vµng nh©n vËt nµy/#_wgm_player_ModifyGold(%q, %d)", szFindPlayerName, -1));
        _wgm_InsertSay(tbSay, "_wgm_player_ModifyGold", format("Céng vµng nh©n vËt nµy/#_wgm_player_ModifyGold(%q, %d)", szFindPlayerName, 1));

        tinsert(tbSay, g_szSpaceLine);
        _wgm_InsertSay(tbSay, "_wgm_player_ShowPlayerProcessMenu", format("<<  Trë l¹i qu¶n lý nh©n vËt/#_wgm_player_ShowPlayerProcessMenu(%q)", WPlayer:GetName()));

        tinsert(tbSay, "[x] T¹m thêi ch­a cÇn xö lý./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    nGoldModify = abs(tonumber(nGoldModify) or 0);
    if nGoldModify == 0 then
        local szAddOrRemoveSymbol = "";
        if nAddOrRemove == 1 then
            szAddOrRemoveSymbol = "céng";
        end
        if nAddOrRemove == -1 then
            szAddOrRemoveSymbol = "trõ";
        end

        WLib:InputNumber("NhËp vµng " .. szAddOrRemoveSymbol .. "...", nGoldMin, nGoldMax, nAddOrRemove, _wgm_player_ModifyGold, szFindPlayerName, nAddOrRemove);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if szMsg == WEnv.NULL then
        WLib:InputString(WEnv.NULL, "Lý do...", 1, 32, 0, _wgm_player_ModifyGold, szFindPlayerName, nAddOrRemove, nGoldModify, bForce);
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

    local nGold360 = WItem:CountAll(2, 1, 537); -- Tö Kim Hång Bao
    local nGold999 = WItem:CountAll(2, 1, 539); -- §¹i hång bao hoµng kim
    local nGold4000 = WItem:CountAll(2, 1, 30229); -- B¹ch Kim Hång Bao

    local nProcessStep = 0;
    local nProcessStepDone = 0;
    local nProcessStepGold = 0;
    local tbProcessResultMsg = {};
    local szAddOrRemoveSymbol = "";
    local nBeforeTotalGold = nGoldInBag + nGoldInBox + (nGold360 * 360) + (nGold999 * 999) + (nGold4000 * 4000);

    local nProcessGoldRemain = nGoldModify;
    local tbProcessTask = {
        [1] = { nType = "GoldItem", nNeed = 0, nBeforeValue = nGold4000, szName = "Vµng bao 4000v", tbProp = { 2, 1, 30229 }, nValue = 4000 },
        [2] = { nType = "GoldItem", nNeed = 0, nBeforeValue = nGold999, szName = "Vµng bao 999v", tbProp = { 2, 1, 539 }, nValue = 999 },
        [3] = { nType = "GoldItem", nNeed = 0, nBeforeValue = nGold360, szName = "Vµng bao 360v", tbProp = { 2, 1, 537 }, nValue = 360 },
        [4] = { nType = "GoldInBox", nNeed = 0, nBeforeValue = nGoldInBox, szName = "Vµng thñ khè" },
        [5] = { nType = "GoldInBag", nNeed = 0, nBeforeValue = nGoldInBag, szName = "Vµng hµnh trang" },
    };

    if nAddOrRemove == 1 then
        -- tr­êng hîp céng vµng
        szAddOrRemoveSymbol = "+";
        tbProcessTask[5].nNeed = nGoldModify;
        nProcessGoldRemain = 0;
        nProcessStep = 1;
    elseif nAddOrRemove == -1 then
        -- tr­êng hîp trõ vµng
        szAddOrRemoveSymbol = "-";
        if nGoldInBag + nGoldInBox >= nGoldModify then
            -- tr­êng hîp cã ®ñ tiÒn mÆt
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
                            -- tr­êng hîp cã ®ñ tiÒn trong ng­êi vµ thñ khè
                            --print("break1", i, nProcessGoldRemain, (nGoldInBox + nGoldInBag), tbProcessTask[i].szName);
                            break ;
                        end

                        if nProcessGoldRemain + (tbProcessTask[i].nNeed * tbProcessTask[i].nValue) - (nGoldInBox + nGoldInBag) >= nGoldModify then
                            -- tr­êng hîp më ra sÏ ®ñ tiÒn
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
                            tinsert(tbProcessResultMsg, format("%s: %s%s c¸i", tbProcessTask[i].szName, szAddOrRemoveSymbol, WLib:MoneyFormat(tbProcessTask[i].nNeed)));
                            WPlayer:Msg(format("B¹n bÞ trõ %s c¸i %s!", WLib:MoneyFormat(tbProcessTask[i].nNeed), WItem:GetName(tbProcessTask[i].tbProp)));
                        end
                    end
                end

                if tbProcessTask[i].nType == "GoldInBox" or tbProcessTask[i].nType == "GoldInBag" then
                    if nAddOrRemove == 1 then
                        Earn(tbProcessTask[i].nNeed * 10000);
                        nProcessStepDone = nProcessStepDone + 1;
                        tinsert(tbProcessResultMsg, format("%s: %s%s vµng", tbProcessTask[i].szName, szAddOrRemoveSymbol, WLib:MoneyFormat(tbProcessTask[i].nNeed)));
                    end

                    if nAddOrRemove == -1 then
                        if tbProcessTask[i].nType == "GoldInBox" then
                            if PaySaveMoney(tbProcessTask[i].nNeed * 10000) == 1 then
                                nProcessStepDone = nProcessStepDone + 1;
                                nProcessStepGold = nProcessStepGold + tbProcessTask[i].nNeed;
                                tinsert(tbProcessResultMsg, format("%s: %s%s vµng", tbProcessTask[i].szName, szAddOrRemoveSymbol, WLib:MoneyFormat(tbProcessTask[i].nNeed)));
                            end
                        end

                        if tbProcessTask[i].nType == "GoldInBag" then
                            if Pay(tbProcessTask[i].nNeed * 10000) == 1 then
                                nProcessStepDone = nProcessStepDone + 1;
                                nProcessStepGold = nProcessStepGold + tbProcessTask[i].nNeed;
                                tinsert(tbProcessResultMsg, format("%s: %s%s vµng", tbProcessTask[i].szName, szAddOrRemoveSymbol, WLib:MoneyFormat(tbProcessTask[i].nNeed)));
                            end
                        end
                    end
                end
            end
        end

    end

    --print("ProcessTask", nGoldModify, nProcessGoldRemain, tbProcessTask[1].nNeed, tbProcessTask[2].nNeed, tbProcessTask[3].nNeed, tbProcessTask[4].nNeed, tbProcessTask[5].nNeed);

    if nProcessStepGold > 0 and nProcessStepGold > nGoldModify then
        WPlayer:AddGold(nProcessStepGold - nGoldModify); -- nhËn l¹i sè d­ khi trõ c¸c item vµng bao lµm trßn sè
        tinsert(tbProcessResultMsg, format("%s: %s%s vµng", tbProcessTask[5].szName, "+", WLib:MoneyFormat(nProcessStepGold - nGoldModify)));
    end

    szNewMsg = szNewMsg .. "\n" .. WLib:Join(tbProcessResultMsg, ", ");

    if nProcessStepDone ~= 0 then
        if nProcessStep == nProcessStepDone then
            nRetCode = WEnv.RETCODE_SUCCESS;
        end

        WNpc:Talk("B¹n ®· ®­îc admin ®iÒu chØnh " .. szAddOrRemoveSymbol .. "" .. WLib:MoneyFormat(nGoldModify) .. " vµng cña nh©n vËt!" .. szNewMsg, WEnv.TRUE);
        WGMLog:WriteRevCmdLog("_wgm_player_ModifyGold", "§iÒu chØnh vµng nh©n vËt", "_wgm_player_ModifyGold_OnTarget", WPlayer:GetAccount(), WPlayer:GetName(), nRetCode, { szSenderName, nAddOrRemove, nGoldModify, bForce, szMsg, WLib:Join(tbProcessResultMsg, ", ") }, szSenderName);
    end
    --- END TODO

    local nAfterGoldInBag = floor(GetCash() / 10000);
    local nAfterGoldInBox = floor(GetSaveMoney() / 10000);
    local nAfterGold360 = WItem:CountAll(2, 1, 537); -- Tö Kim Hång Bao
    local nAfterGold999 = WItem:CountAll(2, 1, 539); -- §¹i hång bao hoµng kim
    local nAfterGold4000 = WItem:CountAll(2, 1, 30229); -- B¹ch Kim Hång Bao
    local nAfterTotalGold = nAfterGoldInBag + nAfterGoldInBox + (nAfterGold360 * 360) + (nAfterGold999 * 999) + (nAfterGold4000 * 4000);
    if nRetCode == WEnv.RETCODE_SUCCESS then
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[SUCCESS] §iÒu chØnh vµng nh©n vËt thµnh c«ng, tæng tr­íc %s vµng, tæng sau %s vµng, ®iÒu chØnh %s%s vµng!",
                        WLib:MoneyFormat(nBeforeTotalGold), WLib:MoneyFormat(nAfterTotalGold), szAddOrRemoveSymbol, WLib:MoneyFormat(nGoldModify)) });
        for i = 1, getn(tbProcessResultMsg) do
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[SUCCESS] §· xö lý: %s!", tbProcessResultMsg[i]) });
        end
    else
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] §iÒu chØnh vµng nh©n vËt thÊt b¹i, tæng cã thÓ %s%s vµng, ®· nhËp vµo %s vµng!",
                        szAddOrRemoveSymbol, WLib:MoneyFormat(nBeforeTotalGold), WLib:MoneyFormat(nGoldModify)) });
        _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                { format("[FAIL] HiÖn cã: %s vµng hµnh trang, %s vµng thñ khè, %s vµng bao 360, %s vµng bao 999, %d vµng bao 4000!",
                        WLib:MoneyFormat(nGoldInBag), WLib:MoneyFormat(nGoldInBox), WLib:MoneyFormat(nGold360), WLib:MoneyFormat(nGold999), WLib:MoneyFormat(nGold4000)) });
        for i = 1, getn(tbProcessResultMsg) do
            _wgm_SendPackage(szSenderName, WEnv.NULL, "Msg2Player",
                    { format("[FAIL] §· xö lý: %s!", tbProcessResultMsg[i]) });
        end
    end
    return nRetCode;
end

----------------------------------------------------------------------------------------------------

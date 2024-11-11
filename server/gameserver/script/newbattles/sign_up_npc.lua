Import("\\script\\lib\\globalfunctions.lua");

Include("\\script\\newbattles\\battlestatistic.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\newbattles\\battleaward.lua");
Include("\\script\\online\\viet_2008_51\\viet_51_function.lua");
Include("\\script\\task\\happiness_bag\\happiness_bag.lua");

Include("\\script\\meridian\\meridian_award_zhenqi.lua")--½±ÀøÕæÆøµÄ½Ó¿Ú
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

--g_sNpcNameºÍg_nNpcCamp¶¼ÊÇÒ»¸öÈ«¾Ö±äÁ¿£¬ËüÃÇÔÚÏôÔ¶Â¥ºÍÕÔÑÓÄêµÄ½Å±¾ÉÏ¶¨Òå

function battle_main()
    BT_NewBattleClear();
    if GetLevel() < 40 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: ChiÕn tr­êng lµ n¬i nguy hiÓm, ®îi ng­¬i luyÖn tËp thªm mét thêi gian ®¹t cÊp <color=yellow>40<color> råi h·y quay l¹i!");
        return 0;
    end ;
    if GetPlayerRoute() == 0 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: V« danh tiÓu tèt nh­ ng­¬i mµ còng muèn tham gia cuéc chiÕn Tèng-Liªu µ? Gia nhËp m«n ph¸i råi h·y tÝnh.");
        return 0;
    end ;
    local nDate = tonumber(date("%y%m%d"));
    local nSignUpTime = BT_GetData(PT_BATTLE_DATE);    --»ñÈ¡Íæ¼Ò±¨ÃûµÄÊÇÄÄÒ»³¡´ÎµÄÕ½³¡
    local nSignUpInfo = BT_GetData(PT_SIGN_UP);        --»ñÈ¡Íæ¼Ò±¨ÃûµÄÇé¿ö£ºÄÄ¸öÕ½³¡£¬ÄÄ·½
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
    --ÐÂÑ¡ÏîÖ»ÄÜ¼ÓÔÚÏÂÃæµÚÎå¸öÑ¡ÏîÖ®ºó
    local selTab = {
        "B¸o danh " .. tBattleName[VILLAGE_ID] .. " [Tèng " .. nSongPlayerCountV .. " ng­êi]: [Liªu " .. nLiaoPlayerCountV .. " ng­êi]/#sign_up(" .. VILLAGE_ID .. ")",
        "B¸o danh " .. tBattleName[RESOURCE_ID] .. " [Tèng " .. nSongPlayerCountR .. " ng­êi]: [Liªu " .. nLiaoPlayerCountR .. " ng­êi]/#sign_up(" .. RESOURCE_ID .. ")",
        "B¸o danh " .. tBattleName[EMPLACEMENT_ID] .. " [Tèng " .. nSongPlayerCountE .. " ng­êi]: [Liªu " .. nLiaoPlayerCountE .. " ng­êi]/#sign_up(" .. EMPLACEMENT_ID .. ")",
        "B¸o danh " .. tBattleName[MAINBATTLE_ID] .. " [Tèng " .. nSongPlayerCountM .. " ng­êi]: [Liªu " .. nLiaoPlayerCountM .. " ng­êi]/#sign_up(" .. MAINBATTLE_ID .. ")",
        "Ta muèn vµo chiÕn tr­êng " .. tBattleName[nBattleType] .. " [Tèng " .. nSongPlayerMSCount .. " ng­êi]: [Liªu " .. nLiaoPlayerMSCount .. " ng­êi]/#join_battle(" .. nBattleType .. ")",
        "Xem sè liÖu thèng kª/BTS_ViewBattleStatistic",
        "Ta muèn nhËn phÇn th­ëng chiÕn tr­êng/get_battle_award",
        "§æi phÇn th­ëng chiÕn tr­êng/battle_regular_award",
        "Tham gia ®¸nh gi¸ qu©n hµm/assess_rank",
        "Ta muèn ®­îc h­íng dÉn vÒ chiÕn tr­êng/get_battle_book",
        "Ta muèn chuéc l¹i qu©n c«ng bÞ tæn thÊt/get_lost_jungong",
        "KÕt thóc ®èi tho¹i/nothing",
    }
    local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
    if nGlobalState == 0 then
        for i = 1, 5 do
            tremove(selTab, 1);
        end
        Say("<color=green>" .. g_sNpcName .. "<color>: §¹i qu©n ch­a xuÊt ph¸t, luyÖn tËp mét thêi gian råi h·y quay l¹i.", getn(selTab), selTab);
        return 0;
    end
    if BT_GetCamp() == SONGLIAO_ID - g_nNpcCamp then
        if 3 - g_nNpcCamp == SONG_ID then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: NÕu ng­¬i ®· chän §¹i Tèng ta còng kh«ng c­ìng Ðp, xin b¶o träng!");
        else
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: NÕu ng­¬i ®· chän §¹i Liªu ta còng kh«ng c­ìng Ðp, xin b¶o träng!");
        end
        return 0;
    end
    local nBattleSegment = mod(nGlobalState, 10);    --»ñÈ¡Õ½³¡µ±Ç°´¦ÓÚÄÄ¸ö½×¶Î
    if nBattleSegment == 2 or nBattleSegment == 4 then
        --Õ½³¡½øÐÐÖÐ
        if nDate * 1000 + nGlobalState - 1 == nSignUpTime then
            --Èç¹ûÖ®Ç°ÓÐ±¨Ãû
            for i = 1, 4 do
                tremove(selTab, 1);
            end
            --LongDaiKa: fix lçi khi dïng GM lo¹i bá player ra khái chiÕn tr­êng
            if nBattleType == 0 then
                tremove(selTab, 1); -- xãa dßng vµo chiÕn tr­êng
                Say("<color=green>" .. g_sNpcName .. "<color>: Vµo chiÕn tr­êng? Tr­íc ®ã ng­¬i ®· cã biÓu hiÖn kh«ng tèt nªn ®· bÞ lo¹i khái danh s¸ch nh©n sÜ tham gia råi.", getn(selTab), selTab);
                return 0;
            end
            Say("<color=green>" .. g_sNpcName .. "<color>: Vµo chiÕn tr­êng? Tr­íc ®ã ng­¬i ®· b¸o danh tham gia <color=yellow>" .. tBattleName[nBattleType] .. "<color>.", getn(selTab), selTab);
            return 0;
        else
            --LongDaiKa: mod l¹i theo tõng tÝnh n¨ng yªu cÇu ®ãng giíi h¹n thêi gian ®¨ng ký
            --BT_SetData(PT_SIGN_UP, 0);
            if nSignUpInfo == 0 then
                tremove(selTab,5); -- xãa dßng vµo chiÕn tr­êng ®· b¸o danh
            end
            if nBattleSegment == 4 then
                if g_WCFG_NEWBATTLES_MAIN.bDisableRegisterTimeLimit ~= WEnv.TRUE
                    or nSignUpInfo == MAINBATTLE_ID*10+g_nNpcCamp
                then
                    tremove(selTab,4); --4=nh¹n m«n quan
                end
                tremove(selTab,3); --3= ph¸o ®µi
                tremove(selTab,2); --2= th¶o cèc
                tremove(selTab,1); --1= th«n trang
            elseif nBattleSegment == 2 then
                tremove(selTab,4); --4=nh¹n m«n quan
                if g_WCFG_NEWBATTLES_EMPLACEMENT.bDisableRegisterTimeLimit ~= WEnv.TRUE
                    or g_WCFG_NEWBATTLES_EMPLACEMENT:IsDateOpen() ~= WEnv.TRUE
                    or nSignUpInfo == EMPLACEMENT_ID*10+g_nNpcCamp
                then
                    tremove(selTab,3); --3= ph¸o ®µi
                end
                if g_WCFG_NEWBATTLES_RESOURCE.bDisableRegisterTimeLimit ~= WEnv.TRUE
                    or g_WCFG_NEWBATTLES_RESOURCE:IsDateOpen() ~= WEnv.TRUE
                    or nSignUpInfo == RERESOURCE_ID*10+g_nNpcCamp
                then
                    tremove(selTab,2); --2= th¶o cèc
                end
                if g_WCFG_NEWBATTLES_VILLAGE.bDisableRegisterTimeLimit ~= WEnv.TRUE
                    or g_WCFG_NEWBATTLES_VILLAGE:IsDateOpen() ~= WEnv.TRUE
                    or nSignUpInfo == VILLAGE_ID*10+g_nNpcCamp
                then
                    tremove(selTab,1); --1= th«n trang
                end
            end

            -- gèc
            --Ö®Ç°Ã»ÓÐ±¨Ãû
            --for i = 1, 5 do
            --    tremove(selTab, 1)
            --end
            Say("<color=green>" .. g_sNpcName .. "<color>: Thêi gian b¸o danh ®· kÕt thóc, xin ®îi trËn sau!", getn(selTab), selTab);
        end
        return 0;
    elseif nDate * 1000 + nGlobalState == nSignUpTime then
        --ÔÚ±¨Ãû½×¶Î£»±¨¹ýÃûµÄ
        for i = 1, 4 do
            tremove(selTab, 1);
        end
        Say("<color=green>" .. g_sNpcName .. "<color>: Vµo chiÕn tr­êng? Tr­íc ®ã ng­¬i ®· b¸o danh tham gia <color=yellow>" .. tBattleName[nBattleType] .. "<color>.", getn(selTab), selTab);
        return 0;
    elseif nBattleSegment == 1 then
        --¸±Õ½³¡±¨ÃûÖÐ£»Î´±¨¹ýÃûµÄ
        tremove(selTab, 4);    --È¥µôÖ÷Õ½³¡±¨Ãû
        tremove(selTab, 4);    --È¥µô½øÈëÕ½³¡Ñ¡Ïî
    elseif nBattleSegment == 3 then
        --Ö÷Õ½³¡±¨ÃûÖÐ£»Î´±¨¹ýÃûµÄ
        for i = 1, 3 do
            tremove(selTab, 1)
        end
        tremove(selTab, 2);    --È¥µô½øÈëÕ½³¡Ñ¡Ïî
    end

    --local nWeekly = tonumber(date('%w'));
    --if nWeekly == 0 or nWeekly == 6 then --LongDaiKa: t7 & cn chØ cã ct ph¸o
        if nBattleSegment == 1 or nBattleSegment == 2 then -- 1,2: ctp 3,4: ctc
            if g_WCFG_NEWBATTLES_EMPLACEMENT:IsDateOpen() ~= WEnv.TRUE then
                tremove(selTab,3); --3= ph¸o ®µi
            end
            if g_WCFG_NEWBATTLES_RESOURCE:IsDateOpen() ~= WEnv.TRUE then
                tremove(selTab,2); --2= th¶o cèc
            end
            if g_WCFG_NEWBATTLES_VILLAGE:IsDateOpen() ~= WEnv.TRUE then
                tremove(selTab,1); --1= th«n trang
            end
        end
   -- end

    Say("<color=green>" .. g_sNpcName .. "<color>: Xin chän chiÕn tr­êng muèn tham gia.", getn(selTab), selTab);
end;

function sign_up(nBattleType)
    --ÅÐ¶ÏÕ½³¡Ê±¼äÓëÍæ¼ÒµÈ¼¶
    if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: H·y tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã ®Õn gÆp ta.");
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
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Ng­¬i ch­a nhËn phÇn th­ëng lÇn tr­íc.");
        return 0;
    end ;
    if GetPKValue() >= 4 then
        --ºìÃû²»ÄÜ½øÕ½³¡
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: Téi ¸c tµy trêi kh«ng thÓ tham gia chiÕn tr­êng!");
        return 0;
    end ;
    local nCamp = g_nNpcCamp;
    local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
    if nGlobalState == 0 then
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: §¹i qu©n ch­a xuÊt ph¸t, luyÖn tËp mét thêi gian råi h·y quay l¹i.");
        return 0;
    end
    local nBattleSegment = mod(nGlobalState, 10);    --»ñÈ¡Õ½³¡µ±Ç°´¦ÓÚÄÄ¸ö½×¶Î
    if nBattleSegment == 2 or nBattleSegment == 4 then
        if (nBattleType == MAINBATTLE_ID and g_WCFG_NEWBATTLES_MAIN.bDisableRegisterTimeLimit == WEnv.TRUE)
            or (nBattleType == EMPLACEMENT_ID and g_WCFG_NEWBATTLES_EMPLACEMENT.bDisableRegisterTimeLimit == WEnv.TRUE)
            or (nBattleType == RESOURCE_ID and g_WCFG_NEWBATTLES_RESOURCE.bDisableRegisterTimeLimit == WEnv.TRUE)
            or (nBattleType == VILLAGE_ID and g_WCFG_NEWBATTLES_VILLAGE.bDisableRegisterTimeLimit == WEnv.TRUE)
        then
        else -- gèc
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: TrËn chiÕn ®· diÔn ra nh÷ng ai ch­a tham gia vui lßng ®îi trËn sau.");
            return 0;
        end
    end
    local nMaxPlayer, nPlayerDiff = 0, 0;
    local nCountCS = gf_GetPlayerRebornCount() * 100 + GetLevel()
    if nBattleType < 4 then
        if nCountCS < 592 then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Nhá h¬n chuyÓn sinh 5 cÊp 92 kh«ng thÓ tham gia chiÕn tr­êng phô.");
            return 0;
        end
    else
        if nCountCS < 690 then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Nhá h¬n chuyÓn sinh 6 cÊp 90 kh«ng thÓ tham gia chiÕn tr­êng chÝnh.");
            return 0;
        end ;
    end ;
    if nBattleType == 4 then
        if GetReputation() < 4000 then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: B¹n kh«ng ®ñ 4000 ®iÓm danh väng ®Ó b¸o danh tham gia chiÕn tr­êng chÝnh");
            return 0;
        end
    end
    --local sMedicineStr = "";
    --if nBattleType == VILLAGE_MAP_ID or nBattleType == EMPLACEMENT_MAP_ID then
    --sMedicineStr = "ÔÚÈ·ÈÏ±¨Ãû<color=yellow>"..tBattleName[].."ºó£¬Äã¿ÉÒÔÃâ·Ñ»ñµÃ";
    --end;
    local nLoopLeft = mf_GetMissionV(tBTMSInfo[nBattleType][1], MV_TIMER_LOOP, nBattleMapID);
    local nBattleState = mf_GetMissionV(tBTMSInfo[nBattleType][1], MV_BATTLE_STATE, nBattleMapID);
    local selTab = {
        "§ång ý/#sign_up_confirm(" .. nBattleType .. ",0)",
        "Ta muèn sö dông b¸o danh VIP (kh«ng bÞ giíi h¹n sè ng­êi chªnh lÖch, chØ dµnh cho ng­êi cã Qu©n hµm Nguyªn So¸i, T­íng Qu©n phe " .. tCampNameZ[nCamp] .. "). L­u ý: phÝ b¸o danh 99 vµng! /#sign_up_confirm(" .. nBattleType .. ",1)",
        "Ta suy nghÜ l¹i!/nothing",
    }
    if nLoopLeft >= 24 and nBattleType == MAINBATTLE_ID and nBattleState == MS_STATE_READY then
        if nCurRank < 5 then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Thêi gian <color=yellow>3 phót <color>®Çu chØ cho phÐp <color=yellow>nh÷ng ng­êi cã Qu©n hµm T­íng Qu©n vµ Nguyªn So¸i<color> b¸o danh.");
            return 0;
        end ;
        tremove(selTab, 1);
    else
        tremove(selTab, 2);
    end ;
    if g_nNpcCamp == SONG_ID then
        Say("<color=green>" .. g_sNpcName .. "<color>: <color=red>Chó ý: Thó c­ng sÏ biÕn mÊt sau khi vµo chiÕn tr­êng. <color>B¹n muèn gia nhËp <color=yellow>phe Tèng<color>?", getn(selTab), selTab);
    else
        Say("<color=green>" .. g_sNpcName .. "<color>: <color=red>Chó ý: Thó c­ng sÏ biÕn mÊt sau khi vµo chiÕn tr­êng. <color>B¹n muèn gia nhËp <color=yellow>phe Liªu<color>?", getn(selTab), selTab);
    end ;
end;

function sign_up_confirm_bk(nBattleType, nSignUpType)
    --ÅÐ¶ÏÕ½³¡Ê±¼ä¡¢×î´óÈËÊý¡¢×î´óÈËÊý²î
    local nCamp = g_nNpcCamp;
    local nCurCamp = BT_GetCurCamp();
    local nCurRank = BT_GetCurRank();
    local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
    nSignUpType = nSignUpType or 0;
    if nGlobalState == 0 then
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: §¹i qu©n ch­a xuÊt ph¸t, luyÖn tËp mét thêi gian råi h·y quay l¹i.");
        return 0;
    end ;
    local nBattleSegment = mod(nGlobalState, 10);    --»ñÈ¡Õ½³¡µ±Ç°´¦ÓÚÄÄ¸ö½×¶Î
    if nBattleSegment == 2 or nBattleSegment == 4 then
        if (nBattleType == MAINBATTLE_ID and g_WCFG_NEWBATTLES_MAIN.bDisableRegisterTimeLimit == WEnv.TRUE)
            or (nBattleType == EMPLACEMENT_ID and g_WCFG_NEWBATTLES_EMPLACEMENT.bDisableRegisterTimeLimit == WEnv.TRUE)
            or (nBattleType == RESOURCE_ID and g_WCFG_NEWBATTLES_RESOURCE.bDisableRegisterTimeLimit == WEnv.TRUE)
            or (nBattleType == VILLAGE_ID and g_WCFG_NEWBATTLES_VILLAGE.bDisableRegisterTimeLimit == WEnv.TRUE)
        then
        else -- gèc
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: TrËn chiÕn ®· diÔn ra nh÷ng ai ch­a tham gia vui lßng ®îi trËn sau.");
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
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: HiÖn t¹i chiÕn tr­êng<color> ®· ®Çy, mêi c¸c anh hïng chän chiÕn tr­êng hoÆc phe kh¸c.");
        return 0;
    end ;
    if nSignUpType == 1 then
        if nCurRank < 5 then
            --ÏÈ·æÒÔÉÏ¾üÏÎ²»ÄÜÊ¹ÓÃ¾ü¹¦ÕÂ
            Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: Qu©n hµm cña b¹n hiÖn t¹i qu¸ thÊp, kh«ng thÓ b¸o danh VIP.");
            return 0;
        end ;
        if nCurCamp ~= g_nNpcCamp then
            Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: Ng­¬i ë phe ®èi ®Þch còng muèn b¸o danh VIP sao?");
            return 0;
        end
        if GetCash() < 990000 then
            Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: VÞ anh hïng nµy h×nh nh­ kh«ng mang ®ñ ng©n l­îng.");
            return 0;
        end
        Pay(990000)
    else
        if nCurPlayerCount - nOppositePlayerCount >= nPlayerDiff then
            Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: HiÖn sè ng­êi Tèng-Liªu ®«i bªn b¸o danh ®¹t tèi ®a <color=yellow>" .. nPlayerDiff .. " ng­êi<color>, mêi c¸c anh hïng chän chiÕn tr­êng hoÆc phe kh¸c");
            Msg2Player("Sè ng­êi hiÖn t¹i kho¶ng " .. nPlayerDiff);
            return 0;
        end
        if nBattleType == MAINBATTLE_ID then
            if GetCash() < 100000 then
                Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: VÞ anh hïng nµy h×nh nh­ kh«ng mang ®ñ ng©n l­îng ®Ó ®ãng gãp cho chiÕn tr­êng chÝnh.");
                return 0;
            end
            Pay(100000)
            ModifyExp(1000000)
            Msg2Player("§¹i hiÖp nhËn ®­îc 1000000 ®iÓm kinh nghiÖm cho sù gan d¹ xung phong giÕt giÆc !!!")
        end
    end

    _w_BattleJoin_SignupCounting(nBattleType, nSignUpType); --LongDaiKa: qu¶n lý ®Õm l­ît ®¨ng ký tham gia

    battle_LogSignUp(nBattleType, nCamp)
    BT_SetData(PT_SIGN_UP, nBattleType * 10 + nCamp);
    BT_SetData(PT_BATTLE_DATE, tonumber(date("%y%m%d")) * 1000 + nGlobalState);
    BT_AddSignUpPlayerCount(nBattleType, nCamp);
    --WriteLogEx("Tong Lieu loai "..nBattleType, "Tham gia phe "..nCamp);
    gf_WriteLogEx("NEW TONG LIEU", "®¨ng ký thµnh c«ng", 1, "TL " .. nBattleType)
    if nCamp == SONG_ID then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: B¹n ®· b¸o danh tham gia <color=yellow>phe Tèng<color>, xin chuÈn bÞ chê khai chiÕn!");
    else
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: B¹n ®· b¸o danh tham gia <color=yellow>phe Liªu<color>, xin chuÈn bÞ chê khai chiÕn!");
    end ;
end;

function join_battle(nBattleType)
    if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: H·y tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã ®Õn gÆp ta.");
        return 0;
    end
    local nDate = tonumber(date("%y%m%d"));
    local nCamp = g_nNpcCamp
    local nCurCamp = BT_GetCurCamp();
    local nCurRank = BT_GetCurRank();
    local nSignUpTime = BT_GetData(PT_BATTLE_DATE);    --»ñÈ¡Íæ¼Ò±¨ÃûµÄÊÇÄÄÒ»³¡Õ½³¡
    local nSignUpInfo = BT_GetData(PT_SIGN_UP);        --»ñÈ¡Íæ¼Ò±¨ÃûµÄÇé¿ö£ºÄÄ¸öÕ½³¡£¬ÄÄ·½
    local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
    local nMaxPlayer = SUB_BATTLE_MAX_PLAYER;
    local nDiffPlayerCount = SUB_BATTLE_PLAYER_DIFF;
    if nGlobalState == 0 then
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: §¹i qu©n ch­a xuÊt ph¸t, luyÖn tËp mét thêi gian råi h·y quay l¹i.");
        return 0;
    end ;
    if nDate * 1000 + nGlobalState - nSignUpTime > 1 then
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: Ng­¬i ch­a b¸o danh kh«ng thÓ tham gia chiÕn tr­êng.");
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
        "Mau ®­a bæn t­íng vµo chiÕn tr­êng (cÇn 99 vµng, kh«ng giíi h¹n sè ng­êi chªnh lÖch)/#join_battle_use_VIP_confirm(" .. nBattleType .. ")",
        "§Ó ta suy nghÜ thªm/nothing",
    }
    if tPlayerCount[nCamp] >= nMaxPlayer then
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: Phe nµy ®· cã <color=yellow>" .. nMaxPlayer .. "<color> ng­êi, khi kh¸c h·y quay l¹i!");
        return 0;
    end ;
    if tPlayerCount[nCamp] - tPlayerCount[SONGLIAO_ID - nCamp] >= nDiffPlayerCount then
        if nCurRank >= 5 and nBattleType == MAINBATTLE_ID and nCurCamp == nCamp then
            Say("<color=green>" .. g_sNpcName .. "<color>: Binh lùc phe nµy ®· ®ñ, b¹n cã thÓ <color=yellow>sö dông lèi ®i VIP vµo chiÕn tr­êng<color> hoÆc ®îi bªn ngoµi, hiÖn sè ng­êi 2 phe trong chiÕn tr­êng lµ: <color=yellow>Tèng [" .. nSongPlayerCount .. "]:[" .. nLiaoPlayerCount .. "] Liªu<color>.", getn(selTab), selTab);
            Msg2Player("Sè ng­êi hiÖn t¹i kho¶ng " .. nDiffPlayerCount);
        else
            Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: Binh lùc phe nµy ®· ®ñ, B»ng h÷u h·y quay l¹i sau nhÐ! Sè ng­êi ®«i bªn hiÖn lµ: <color=yellow>Tèng [" .. nSongPlayerCount .. "]:[" .. nLiaoPlayerCount .. "] Liªu<color>.");
            Msg2Player("Sè ng­êi hiÖn t¹i kho¶ng " .. nDiffPlayerCount);
        end
        return 0;
    end
    BT_SetData(PT_BATTLE_TYPE, nBattleType);    --¸ù¾ÝnSignUpInfoÒ²¿ÉÒÔµÃµ½nBattleType£¬ÕâÀïÔÙ±£´æÒ»´Î»á²»»á¶àÓàÄØ£¿
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
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: VÞ anh hïng nµy h×nh nh­ kh«ng mang ®ñ ng©n l­îng.");
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
        Talk(1, "main", "<color=green>" .. g_sNpcName .. "<color>: Ch¼ng ph¶i ng­¬i cã quyÓn s¸ch sao?");
    end ;
end;

function battle_shouxian()
    local nValue = GetTask(701)
    if g_nNpcCamp == SONG_ID and nValue < 0 then
        -- ÔÚÕÔÑÓÄê·½²»ÄÜ½øÐÐÁÉ·½ÊÚÏÎ
        Say("<color=green>" .. g_sNpcName .. "<color>: Ng­¬i kh«ng ph¶i phe Tèng kh«ng thÓ nhËn qu©n hµm", 0)
    elseif g_nNpcCamp == LIAO_ID and nValue > 0 then
        -- ÏôÔ¶Â¥·½²»ÄÜ½øÐÐËÎ·½ÊÚÏÎ
        Say("<color=green>" .. g_sNpcName .. "<color>: Ng­¬i kh«ng ph¶i phe Liªu kh«ng thÓ nhËn qu©n hµm", 0)
    else
        Say("<color=green>" .. g_sNpcName .. "<color>: NÕu tuÇn nµy ch­a tham gia qua chiÕn tr­êng mµ muèn nhËn xÕp h¹ng qu©n c«ng ta ph¶i tham gia nghi thøc trao qu©n hµm, cßn nÕu ng­êi ch¬i ®· tham gia qua sÏ mÆc ®Þnh tham gia nhËn qu©n hµm, <color=yellow>21 giê tèi thø 6 h»ng tuÇn<color> cö hµnh nghi thøc trao qu©n hµm cho ng­êi ch¬i <color=yellow>online vµ tham gia nhËn qu©n hµm<color>, nhËn xong ta cã thÓ <color=yellow>®¨ng nhËp l¹i hoÆc ®Õn ®©y<color> nhËn qu©n hµm míi nhÊt.", 2, "Tham gia nhËn qu©n hµm/battle_shouxian_yes", "Kh«ng cÇn/nothing")
    end
end

function battle_shouxian_yes()
    SetRankPoint(5, 701, 1)
    SetTask(TSK_TRANS_POINT_ALLOW, 1)
end

function update_cur_rank()
    CalcBattleRank()
    UpdateBattleMaxRank()
    Say("<color=green>" .. g_sNpcName .. "<color>: Qu©n hµm cña ng­¬i ®· ®­îc thay ®æi.", 0)
end

function record_cur_rank()
    Say("<color=green>"..g_sNpcName.."<color>: XÐt duyÖt qu©n hµm vÜnh viÔn lµ thèng kª sè tuÇn b¹n duy tr× ®­îc qu©n hµm, nÕu tÝch lòy sè tuÇn gi÷ qu©n hµm Nguyªn So¸i ®¹t 15 lÇn trë lªn, b¹n sÏ nhËn ®­îc Qu©n hµm Nguyªn So¸i VÜnh ViÔn, nÕu sè tuÇn duy tr× qu©n hµm T­íng + sè lÇn duy tr× Nguyªn So¸i >= 10 b¹n cã thÓ nhËn ®­îc qu©n hµm T­íng Qu©n vÜnh viÔn, sè tuÇn duy tr× T­íng + So¸i + Tiªn Phong >=10 sÏ nhËn ®­îc qu©n hµm Tiªn Phong VÜnh ViÔn. Së h÷u qu©n hµm vÜnh viÔn sÏ cã thÓ trang bÞ t­¬ng øng vÜnh viÔn.",2,"Tham gia xÐt duyÖt t­ c¸ch/record_cur_rank_yes","Rêi khái/nothing")
end

function record_cur_rank_yes()
    update_cur_rank()	-- §æi míi l¹i qu©n hµm
    local nBodyRecordWeek = GetTask(768)
    local nWeek = GetTask(763)
    if nBodyRecordWeek >= nWeek then
        Say("<color=green>"..g_sNpcName.."<color>: Ngµi ®· tham gia xÐt duyÖt t­ c¸ch lÇn nµy, t×nh h×nh duy tr× qu©n hµm hiÖn t¹i nh­ sau:\n§¹t qu©n hµm Nguyªn So¸i <color=green>"..GetTask(765).."<color> lÇn, qu©n hµm T­íng Qu©n <color=green>"..GetTask(766).."<color> lÇn, qu©n hµm Tiªn Phong <color=green>"..GetTask(767).."<color> lÇn", 0)
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
        Say("<color=green>"..g_sNpcName.."<color>: Ngµi ®· tham gia xÐt duyÖt t­ c¸ch lÇn nµy, triÒu ®×nh ®· ghi chÐp l¹i c«ng lao to cña ng­¬i, t×nh h×nh duy tr× qu©n hµm hiÖn t¹i cña ngµi nh­ sau:\n§¹t qu©n hµm Nguyªn So¸i <color=green>"..GetTask(765).."<color> lÇn, qu©n hµm T­íng Qu©n <color=green>"..GetTask(766).."<color> lÇn, qu©n hµm Tiªn Phong <color=green>"..GetTask(767).."<color> lÇn", 0)
        WriteLog("[ChiÕn tr­êng] player:"..GetName().." event:record rank Nguyªn So¸i: "..GetTask(765).." T­íng Qu©n:"..GetTask(766).." Tiªn Phong:"..GetTask(767))
    end
end

function get_yongjiu_yuanshuai()
    if GetTask(765) >= 15 then
        Say("<color=green>"..g_sNpcName.."<color>: Ngµi ®· lµ Nguyªn So¸i vÜnh viÔn, kh«ng cÇn tham gia ®¸nh gi¸ Nguyªn So¸i vÜnh viÔn", 0)
        return
    end

    SetRankPoint(5, 701, 1) -- Thªm vµo b¶ng xÕp h¹ng qu©n c«ng
    local nValue = GetTask(701)
    if g_nNpcCamp == SONG_ID and nValue < 0 then
        Say("<color=green>"..g_sNpcName.."<color>: Ng­êi phe Liªu kh«ng thÓ tham gia ®¸nh gi¸ qu©n hµm Nguyªn So¸i vÜnh viÔn phe Tèng", 0)
        return
    elseif g_nNpcCamp == LIAO_ID and nValue > 0 then
        Say("<color=green>"..g_sNpcName.."<color>: Ng­êi phe Tèng kh«ng thÓ tham gia ®¸nh gi¸ qu©n hµm Nguyªn So¸i vÜnh viÔn phe Liªu", 0)
        return
    elseif abs(nValue) < 20e6 then
        Say("<color=green>"..g_sNpcName.."<color>: Qu©n c«ng cña ngµi ch­a ®ñ 20 triÖu, kh«ng thÓ tham gia ®¸nh gi¸ Nguyªn So¸i VÜnh ViÔn, khi qu©n c«ng ®¹t 20 triÖu cã thÓ ®Õn <color=yellow>TiÓu Ph­¬ng<color>-Phe Tèng hoÆc <color=yellow>TiÓu Ngäc<color>-Phe Liªu ®Ó ®¸nh gi¸.", 0)
        return
    end

    SetTask(765, 15)
    WriteLog("[new battle] player="..GetName().." event=NhËn ®­îc Nguyªn So¸i vÜnh viÔn("..GetTask(701)..")")

    local szCamp = ""
    local szSex = ""
    if nValue < 0 then
        szCamp = "§¹i Liªu"
    else
        szCamp = "§¹i Tèng"
    end

    if GetSex() == 1 then
        szSex = "ThiÕu hiÖp"
    elseif GetSex() == 2 then
        szSex = "N÷ hiÖp"
    end

    Say("<color=green>"..g_sNpcName.."<color>:"..szSex.." tËn trung v× n­íc, cóc cung tÉn tóy, ®Æc biÖt khen tÆng danh hiÖu Nguyªn So¸i "..szCamp.." vÜnh viÔn, th«ng c¸o thiªn h¹, dÜ óy qu©n t©m.", 0)
    AddGlobalNews("Ng­êi ch¬i "..GetName().." tËn trung v× n­íc, cóc cung tÉn tóy, ®Æc biÖt khen tÆng danh hiÖu Nguyªn So¸i"..szCamp.." vÜnh viÔn, th«ng c¸o thiªn h¹, dÜ óy qu©n t©m")
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
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Mau ®i tham gia chiÕn tr­êng råi ®Õn ®©y l·nh th­ëng!");
        return 0;
    end
    if g_nNpcCamp ~= nLastCamp then
        if nLastCamp == SONG_ID then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: LÇn tr­íc b¹n ®· tham gia phe <color=yellow>Tèng<color>, mêi ®Õn ®iÓm b¸o danh l·nh th­ëng!")
        else
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: LÇn tr­íc b¹n ®· tham gia phe <color=yellow>Liªu<color>, mêi ®Õn ®iÓm b¸o danh l·nh th­ëng!")
        end
        return 0;
    end
    local selTab = {
        format("Dïng %s (PhÇn th­ëng qu©n c«ng gÊp %d lÇn, kinh nghiÖm gÊp %d lÇn)/#get_battle_award_confirm(%d)", tbJUNGONGZHANG[1][1], tbJUNGONGZHANG[1][5], tbJUNGONGZHANG[1][6], 1),
        format("Dïng %s (PhÇn th­ëng qu©n c«ng gÊp %d lÇn, kinh nghiÖm gÊp %d lÇn)/#get_battle_award_confirm(%d)", tbJUNGONGZHANG[2][1], tbJUNGONGZHANG[2][5], tbJUNGONGZHANG[2][6], 2),
        format("Dïng %s (PhÇn th­ëng qu©n c«ng gÊp %d lÇn, kinh nghiªm gÊp %d lÇn)/#get_battle_award_confirm(%d)", tbJUNGONGZHANG[3][1], tbJUNGONGZHANG[3][5], tbJUNGONGZHANG[3][6], 3),
        format("Dïng %s (PhÇn th­ëng qu©n c«ng %d lÇn, phÇn th­ëng kinh nghiÖm gÊp %d lÇn)/#get_battle_award_confirm(%d)", tbJUNGONGZHANG[4][1], tbJUNGONGZHANG[4][5], tbJUNGONGZHANG[4][6], 4),
        "Kh«ng dïng/not_use_jungongzhang_confirm",
        "Ch­a muèn nhËn th­ëng/nothing",
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
    local szExpAward = "Mçi ngµy mçi ng­êi chØ cã thÓ nhËn phÇn th­ëng 1 lÇn";
    local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
    if nGetExpAwardCount >= 1 and nLastBattle == MAINBATTLE_ID then
        --Èç¹ûµ±Ìì»ñµÃ¹ý¾­Ñé½±Àø
        nExpAward = 0;
        szExpAward = "Mçi ngµy mçi ng­êi chØ cã thÓ nhËn phÇn th­ëng 1 lÇn, <color=yellow>h«m nay b¹n ®· nhËn qua phÇn th­ëng<color>.";
    end
    if nLastBattle ~= MAINBATTLE_ID then
        --Èç¹ûÊÇÐ¡Õ½³¡
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
        --Èç¹ûÊÇIB°æ±¾
        szSay = "PhÇn th­ëng kinh nghiÖm lÇn tr­íc b¹n nhËn lµ <color=yellow>" .. nExpAward .. " ®iÓm<color>, " .. szExpAward .. " phÇn th­ëng tÝch lòy lµ <color=yellow>" .. nPointAward .. " ®iÓm<color> tÝch lòy, <color=yellow>" .. nJunGongAward .. " ®iÓm<color> qu©n c«ng. <color=yellow>B¹n cã thÓ dïng qu©n c«ng ch­¬ng ®Ó nh©n ®«i phÇn th­ëng qu©n c«ng vµ phÇn th­ëng kinh nghiÖm<color>.";
    else
        szSay = "PhÇn th­ëng kinh nghiÖm lÇn tr­íc b¹n nhËn lµ <color=yellow>" .. nExpAward .. " ®iÓm<color>, " .. szExpAward .. ", cã thÓ chuyÓn <color=yellow>" .. nGoldenExpAward .. " ®iÓm<color> søc kháe thµnh ®iÓm kinh nghiÖm, phÇn th­ëng tÝch lòy lµ <color=yellow>" .. nPointAward .. " ®iÓm<color> tÝch lòy, <color=yellow>" .. nJunGongAward .. " ®iÓm<color> qu©n c«ng. <color=yellow>B¹n cã thÓ dïng qu©n c«ng ch­¬ng ®Ó nh©n ®«i phÇn th­ëng qu©n c«ng<color>."
    end

    Say("<color=green>" .. g_sNpcName .. "<color>: " .. szSay, getn(selTab), selTab);
end

function get_battle_award_confirm(nType)
    local nCurCamp = BT_GetCurCamp();
    local nLastCamp = BT_GetData(PT_LAST_CAMP);
    if nLastCamp ~= nCurCamp then
        Talk(1, "get_battle_award", "<color=green>" .. g_sNpcName .. "<color>: Ng­¬i tham gia chiÕn tr­êng phe cña ®èi ph­¬ng, kh«ng thÓ dïng Qu©n C«ng Ch­¬ng/§¹i Qu©n C«ng Ch­¬ng/Huy Hoµng Qu©n C«ng Ch­¬ng/Vinh Dù Qu©n C«ng Ch­¬ng, h·y chän dßng kh«ng dïng Qu©n C«ng Ch­¬ng ®Ó nhËn th­ëng.");
        return 0;
    end ;
    local selTab = {
        format("§óng/#get_all_award(%d)", nType),
        "Sai/nothing",
    }
    Say("<color=green>" .. g_sNpcName .. "<color>: Ng­¬i muèn sö dông <color=yellow>" .. tbJUNGONGZHANG[nType][1] .. "<color>?", getn(selTab), selTab);
end;

function get_all_award(nType)-- hµm gèc
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
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Hµnh trang cña b¹n kh«ng ®ñ chç trèng!");
        return 0;
    end ;

    if nType ~= 0 then
        if nTimePassed <= ITEM_SPYCLOTH_TIME then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: HiÖu qu¶ mÆt n¹ Gi¸n §iÖp cña b¹n vÉn cßn, kh«ng thÓ sö dông phÇn th­ëng qu©n c«ng nhËn phÇn th­ëng. Thêi gian sö dông mÆt n¹ Gi¸n §iÖp: <color=yellow>" .. tf_GetTimeString(ITEM_SPYCLOTH_TIME - nTimePassed) .. "<color>.")
            return 0
        end
        if DelItem(tbJUNGONGZHANG[nType][2], tbJUNGONGZHANG[nType][3], tbJUNGONGZHANG[nType][4], 1) == 1 then
            FireEvent("event_ib_cost",tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1);
        else
            Talk(1, "get_battle_award", "<color=green>" .. g_sNpcName .. "<color>: Ng­¬i kh«ng mang theo <color=yellow>" .. tbJUNGONGZHANG[nType][1] .. "<color> th× ph¶i!")
            return 0
        end
    end

    --===========
    --ÏÈÇåÀí±äÁ¿ ·ÀÖ¹¶à´ÎÁì½±
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
        --Èç¹ûÊÇÐ¡Õ½³¡
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
        Msg2Player("B¹n nhËn ®­îc " .. nExpAward .. " ®iÓm kinh nghiÖm");
        --ÎäÁÖvipÁî
        _vc_JoinSmallBattle();
    else
        --´óÕ½³¡½±Àø
        --< Added by SunZhuoshi
        HBRewardInBigBattleField();
        -->
        if nGetExpAwardCount < 1 then
            --Èç¹û»ñÈ¡´óÕ½³¡½±Àø´ÎÊýÐ¡ÓÚ1
            ModifyExp(nExpAward);
            Msg2Player("B¹n nhËn ®­îc " .. nExpAward .. " ®iÓm kinh nghiÖm");
            --ModifyExp(5000000); --LongDaiKa: mod bá th­ëng thªm exp
            --Msg2Player("B¹n nhËn thªm ®­îc 5000000 ®iÓm kinh nghiÖm");
            BT_SetData(PT_GET_EXP_AWARD_COUNT, nGetExpAwardCount + 1);
            BT_SetData(PT_GET_EXP_AWARD_DATE, nDate);
        else
            nExpAward = 0;
            Msg2Player("H«m nay b¹n ®· nhËn 1 lÇn phÇn th­ëng kinh nghiÖm, mçi ngµy chØ cã thÓ nhËn 1 lÇn");
        end
        --nhiÖm vô lµm giµu
        if CFG_NhiemVuLamGiau == 1 then
            if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 10) == 0 then
                gf_SetTaskBit(TSK_LAMGIAU, 10, 1, 0)
                TaskTip("Hoµn thµnh nhiÖm vô lµm giµu: Hoµn thµnh nhiÖm vô Nh¹n M«n Rùc Löa.")
            end
        end
        --ÎäÁÖvipÁî
        _vc_JoinBigbattle();
    end
    -----------------------Chuçi nhiÖm vô §ång Hµnh
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
    -- Ô½ÄÏ2008 5.1 »î¶¯½±Àø
    local is_main_batter = (nLastBattle == MAINBATTLE_ID) or 0;
    local is_winner = (nLastCamp == nLastResult) or 0
    viet_51_battle_award(is_main_batter, is_winner);

    --ÕæÆø½±Àø
    AwardZhenQi_ZhanChang(is_main_batter, is_winner)

    if IB_VERSION ~= 1 then
        --Èç¹ûÊÇÊÕ·Ñ°æ±¾£¬Ôö¼Ó½¡¿µ×ª¾­Ñé½±Àø
        gf_GoldenExp2Exp(nGoldenExpAward);
    end
    BT_SetData(PT_TOTALPOINT, BT_GetData(PT_TOTALPOINT) + nPointAward);
    SetRankPoint(RANK_BATTLE_POINT, BATTLE_OFFSET + PT_TOTALPOINT, 1);    --Ö´ÐÐSetRankPoint»áË¥¼õ¾ü¹¦
    Msg2Player("B¹n nhËn ®­îc " .. nPointAward .. " ®iÓm tÝch lòy chiÕn tr­êng");
    if nTimePassed <= ITEM_SPYCLOTH_TIME then
        nJunGongAward = 0;
        Msg2Player("HiÖu qu¶ mÆt n¹ Gi¸n §iÖp: B¹n kh«ng nhËn ®­îc qu©n c«ng");
    end
    local nCurRankPoint = BT_GetData(PT_RANKPOINT);    --»ñÈ¡Ë¥¼õºóµÄ¾ü¹¦
    if nLastCamp == SONG_ID then
        BT_SetData(PT_RANKPOINT, nCurRankPoint + nJunGongAward);
    else
        BT_SetData(PT_RANKPOINT, nCurRankPoint - nJunGongAward);
    end
    SetRankPoint(RANK_BATTLE_CONTRIBUTION, BATTLE_OFFSET + PT_RANKPOINT, 1);
    Msg2Player("B¹n nhËn ®­îc " .. tCampNameZ[nLastCamp] .. " Ph­¬ng " .. nJunGongAward .. " ®iÓm c«ng tr¹ng");
    local tMocRuong = {
        [0] = { "Kh«ng", 1 },
        [1] = { "Qu©n C«ng Ch­¬ng", 2 },
        [2] = { "Qu©n C«ng §¹i", 4 },
        [3] = { "Qu©n C«ng Huy Hoµng", 8 },
        [4] = { "Qu©n C«ng Vinh Dù", 16 },
    };
    gf_AddItemEx2({ 2, 1, 30340, tMocRuong[nType][2] }, "Méc R­¬ng lo¹i " .. tMocRuong[nType][1], "ThÇn Tµi B¶o R­¬ng", "Tèng Liªu", 0, 1)
    --ÎäÁÖ¹¦Ñ«
    if nLastBattle ~= MAINBATTLE_ID then
        --Èç¹ûÊÇÐ¡Õ½³¡
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
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: HiÖu qu¶ mÆt n¹ Gi¸n §iÖp cña b¹n vÉn cßn, kh«ng thÓ sö dông phÇn th­ëng qu©n c«ng nhËn phÇn th­ëng. Thêi gian sö dông mÆt n¹ Gi¸n §iÖp: <color=yellow>" .. tf_GetTimeString(ITEM_SPYCLOTH_TIME - nTimePassed) .. "<color>.")
            return 0
        end
        if DelItem(tbJUNGONGZHANG[nType][2], tbJUNGONGZHANG[nType][3], tbJUNGONGZHANG[nType][4], 1) == 1 then
            FireEvent("event_ib_cost",tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1);
        else
            Talk(1, "get_battle_award", "<color=green>" .. g_sNpcName .. "<color>: Ng­¬i kh«ng mang theo <color=yellow>" .. tbJUNGONGZHANG[nType][1] .. "<color> th× ph¶i!")
            return 0
        end
    end

    WTask:ResetDaily();

    if nLastBattle ~= MAINBATTLE_ID then
        --< Added by SunZhuoshi
        HBRewardInSmallBattleField();
        -->
        --ÎäÁÖvipÁî
        _vc_JoinSmallBattle();
    else
        --´óÕ½³¡½±Àø
        --< Added by SunZhuoshi
        HBRewardInBigBattleField();
        -->
        --nhiÖm vô lµm giµu
        if CFG_NhiemVuLamGiau == 1 then
            if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 10) == 0 then
                gf_SetTaskBit(TSK_LAMGIAU, 10, 1, 0)
                TaskTip("Hoµn thµnh nhiÖm vô lµm giµu: Hoµn thµnh nhiÖm vô Nh¹n M«n Rùc Löa.")
            end
        end
        --ÎäÁÖvipÁî
        _vc_JoinBigbattle();
    end ;
    -----------------------Chuçi nhiÖm vô §ång Hµnh
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
    -- Ô½ÄÏ2008 5.1 »î¶¯½±Àø
    local is_main_batter = (nLastBattle == MAINBATTLE_ID) or 0;
    local is_winner = (nLastCamp == nLastResult) or 0
    viet_51_battle_award(is_main_batter, is_winner);
    --ÕæÆø½±Àø
    AwardZhenQi_ZhanChang(is_main_batter, is_winner);
    SetRankPoint(RANK_BATTLE_CONTRIBUTION, BATTLE_OFFSET + PT_RANKPOINT, 1);
    --ÎäÁÖ¹¦Ñ«
    if nLastBattle ~= MAINBATTLE_ID then
        --Èç¹ûÊÇÐ¡Õ½³¡
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

        --ÏÈÇåÀí±äÁ¿ ·ÀÖ¹¶à´ÎÁì½±
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
        "Sö dông qu©n c«ng ch­¬ng/get_battle_award",
        "Kh«ng muèn dïng qu©n c«ng nµo hÕt/#not_use_jungongzhang_confirm2(0)",
    }
    Say("<color=green>" .. g_sNpcName .. "<color>: Ng­¬i kh«ng dïng qu©n c«ng ch­¬ng sao?", getn(selTab), selTab);
end;

function not_use_jungongzhang_confirm2()
    local nCurCamp = BT_GetCurCamp();
    local nLastCamp = BT_GetData(PT_LAST_CAMP);
    local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
    local nTimePassed = GetTime() - nSpyClothTime;
    if nLastCamp == nCurCamp or nTimePassed <= ITEM_SPYCLOTH_TIME then
        --Èç¹û²Î¼ÓµÄÊÇ±¾·½ÕóÓª»ò¼äµý×°ÊøÔÚÓÐÐ§Ê±¼äÄÚ
        get_all_award(0);
        return 0;
    end ;
    local selTab = {
        "§ång ý/#get_all_award(0)",
        "Tho¸t/nothing",
    }
    Say("<color=green>" .. g_sNpcName .. "<color>: B¹n tham gia chiÕn tr­êng phe ®èi ph­¬ng, trùc tiÕp nhËn th­ëng sÏ bÞ khÊu trõ ®iÓm qu©n c«ng, cã thÓ sö dông <color=yellow>mÆt n¹ Gi¸n §iÖp<color> lµm qu©n c«ng b¹n bÞ khÊu trõ thµnh 0. NÕu b¹n vÉn muèn nhËn phÇn th­ëng h·y chän x¸c nhËn, nÕu b¹n muèn suy nghÜ thªm hay chän Rêi khái.", getn(selTab), selTab);
end;

function assess_rank()
    local selTab = {
        --"Ta muèn tham gia xÐt duyÖt t­ c¸ch qu©n hµm vÜnh viÔn lÇn nµy/record_cur_rank", --LongDaiKa: ®ãng qu©n hµm vÜnh viÔn
        "Ta muèn nhËn qu©n hµm qu©n c«ng tuÇn nµy/battle_shouxian",
        "§æi míi qu©n hµm/update_cur_rank",
        --"Qu©n c«ng cña ta ®· ®¹t 20 triÖu, ta muèn tham gia ®¸nh gi¸ Nguyªn So¸i vÜnh viÔn/get_yongjiu_yuanshuai", --LongDaiKa: ®ãng qu©n hµm vÜnh viÔn
        "Quay l¹i néi dung tr­íc./main",
        "KÕt thóc ®èi tho¹i/nothing",
    }
    Say("<color=green>" .. g_sNpcName .. "<color>: Ng­¬i muèn tham gia trao qu©n hµm tuÇn nµy ­?", getn(selTab), selTab);
end;

function battle_regular_award()
    local selTab = {
        "§æi trang bÞ chiÕn tr­êng/BTA_Main",
        "Ta muèn ®æi 100000 ®iÓm tÝch lòy lÊy H¹ y cña Tµng KiÕm cÊp 70/want_cangjian_equip",
        "Ta muèn ®æi 30000 ®iÓm tÝch lòy lÊy LÖnh bµi bang héi/want_ling_pai",
        "Ta muèni 1000 ®iÓm tÝch lòy lÊy ®iÓm kinh nghiÖm/want_exp_award",
        "Quay l¹i néi dung tr­íc./main",
        "KÕt thóc ®èi tho¹i/nothing",
    }
    if IB_VERSION == 1 then
        --IB°æ±¾Ã»ÓÐ»ý·Ö»»×°±¸¡¢¾­Ñé¡¢»áÃËÁîÅÆ½±Àø
        tremove(selTab, 2);
        tremove(selTab, 3);
        --		tremove(selTab,2);
    end ;
    Say("<color=green>" .. g_sNpcName .. "<color>: Ng­¬i muèn ®æi phÇn th­ëng nµo?", getn(selTab), selTab);
end;

function want_ling_pai()
    local selTab = {
        "§ång ý/give_ling_pai",
        "Hñy bá/nothing",
    }
    Say("<color=green>" .. g_sNpcName .. "<color>: §æi <color=yellow>LÖnh bµi bang héi<color> cÇn <color=yellow>30000 ®iÓm tÝch lòy<color>, b¹n x¸c nhËn muèn ®æi?", getn(selTab), selTab);
end;

function give_ling_pai()
    local nCurPoint = BT_GetData(PT_TOTALPOINT);
    local nNeedPoint = 30000;
    if nCurPoint < nNeedPoint then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Xin lçi! §iÓm tÝch lòy cña b¹n kh«ng ®ñ ");
        return 0;
    end ;
    if gf_JudgeRoomWeight(1, 30) ~= 1 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Hµnh trang cña b¹n kh«ng ®ñ chç trèng!");
        return 0;
    end ;
    BT_SetData(PT_TOTALPOINT, nCurPoint - nNeedPoint);
    local nRetCode = AddItem(2, 0, 125, 1);
    if nRetCode == 1 then
        Msg2Player("B¹n ®· ®æi mét LÖnh bµi bang héi");
        WriteLog("[phÇn th­ëng chiÕn trËn]:" .. GetName() .. " ®· ®æi mét lÖnh bµi bang héi");
    else
        WriteLog("[phÇn th­ëng bÞ lçi]" .. GetName() .. "Khi ®æi lÖnh bµi bang héi AddItem b¸o lçi, nRetCode:" .. nRetCode);
    end ;
end;

function want_cangjian_equip()
    local selTab = {
        "§ång ý/give_cangjian_equip",
        "Hñy bá/nothing",
    }
    Say("<color=green>" .. g_sNpcName .. "<color>: Muèn ®æi <color=yellow>H¹ y Tµng KiÕm cÊp 70<color> cÇn <color=yellow>100000 ®iÓm tÝch lòy<color>, b¹n x¸c nhËn muèn ®æi?", getn(selTab), selTab);
end;

function give_cangjian_equip()
    local nCurPoint = BT_GetData(PT_TOTALPOINT);
    local nNeedPoint = 100000;
    if nCurPoint < nNeedPoint then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Xin lçi! §iÓm tÝch lòy cña b¹n kh«ng ®ñ ");
        return 0;
    end ;
    if gf_JudgeRoomWeight(1, 100) ~= 1 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Hµnh trang cña b¹n kh«ng ®ñ chç trèng!");
        return 0;
    end ;
    if gf_CheckPlayerRoute() ~= 1 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: B¹n ph¶i gia nhËp m«n ph¸i míi cã thÓ ®æi H¹ y Tµng KiÕm");
        return 0;
    end ;
    local nRoute = GetPlayerRoute();
    local nBody = GetBody();
    local nNum = nRoute * 100 + 70 + nBody;
    BT_SetData(PT_TOTALPOINT, nCurPoint - nNeedPoint);
    local nRetCode = AddItem(0, 101, nNum, 1, 1, -1, -1, -1, -1, -1, -1);
    if nRetCode == 1 then
        Msg2Player("B¹n ®æi " .. nNeedPoint .. " ®iÓm tÝch lòy lÊy 1 H¹ y Tµng KiÕm cÊp 70");
        WriteLog("[phÇn th­ëng chiÕn trËn]:" .. GetName() .. " ®æi lÊy H¹ y Tµng KiÕm cÊp 70");
    else
        WriteLog("[phÇn th­ëng bÞ lçi]" .. GetName() .. "§æi lÊy H¹ y Tµng KiÕm cÊp 70 AddItem b¸o lçi, nRetCode:" .. nRetCode);
    end ;
end;

function want_exp_award()
    local nCurPoint = BT_GetData(PT_TOTALPOINT);
    local nNeedPoint = 1000;
    local nLevel = GetLevel();
    if nLevel < 40 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Xin lçi! Nh©n vËt d­íi cÊp <color=yellow>40<color> kh«ng thÓ ®æi phÇn th­ëng kinh nghiÖm");
        return 0;
    end ;
    local nDate = tonumber(date("%y%m%d"));
    if nDate > BT_GetData(PT_EXCHANGE_EXP_DATE) then
        BT_SetData(PT_EXCHANGE_EXP_COUNT, 0);
    end ;
    local nCurCount = BT_GetData(PT_EXCHANGE_EXP_COUNT);
    if nCurCount >= 20 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Xin lçi! H«m nay b¹n ®· nhËn <color=yellow>20<color> lÇn phÇn th­ëng ®iÓm kinh nghiÖm, mçi ngµy chØ cã thÓ ®æi ®iÓm tÝch lòy lÊy ®iÓm kinh nghiÖm 20 lÇn");
        return 0;
    end ;
    if nCurPoint < nNeedPoint then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Xin lçi! §iÓm tÝch lòy cña b¹n kh«ng ®ñ ");
        return 0;
    end ;
    local nExpAward = floor((((nLevel ^ 2) / 1600) ^ 2) * 20000);
    nCurCount = nCurCount + 1;
    BT_SetData(PT_TOTALPOINT, nCurPoint - nNeedPoint);
    BT_SetData(PT_EXCHANGE_EXP_COUNT, nCurCount);
    BT_SetData(PT_EXCHANGE_EXP_DATE, nDate);
    ModifyExp(nExpAward);
    Msg2Player("B¹n ®æi " .. nNeedPoint .. " ®iÓm tÝch lòy ®æi lÊy " .. nExpAward .. " ®iÓm kinh nghiÖm, ®©y lµ lÇn ®æi ®iÓm kinh nghiÖm thø " .. nCurCount .. ".");
    WriteLog("[phÇn th­ëng chiÕn trËn]:" .. nLevel .. "-(cÊp):" .. GetName() .. " ®· dïng ®iÓm tÝch lòy ®æi" .. nExpAward .. " ®iÓm kinh nghiÖm");
end;

function change_camp()
    local nDate = tonumber(date("%y%m%d"));
    if nDate > 070920 then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Thêi gian ®æi phe miÔn phÝ ®· qua, c¸c vÞ ®¹i hiÖp h·y cÈn träng khi chän phe!");
        return 0;
    end ;
    if BT_GetData(PT_CHANGE_CAMP_COUNT) >= MAX_CHANGE_CAMP then
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: B¹n ®· ®æi qu©n c«ng <color=yellow>" .. MAX_CHANGE_CAMP .. "<color> lÇn, kh«ng thÓ ®æi tiÕp.");
        return 0;
    end ;
    local selTab = {
        "Tèng/#change_camp_confirm(1)",
        "Liªu/#change_camp_confirm(2)",
        "Ta suy nghÜ l¹i/nothing",
    }
    local nJunGong = BT_GetData(PT_RANKPOINT);
    local szStr = "";
    if nJunGong < 0 then
        szStr = "B¹n ®ang thuéc phe Liªu, qu©n c«ng hiÖn t¹i:" .. abs(nJunGong) .. ".";
    elseif nJunGong > 0 then
        szStr = "B¹n ®ang thuéc phe Tèng, qu©n c«ng hiÖn t¹i:" .. abs(nJunGong) .. ".";
    else
        Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Qu©n c«ng hiÖn t¹i cña b¹n lµ 0, kh«ng cÇn ph¶i chuyÓn qu©n c«ng.");
        return 0;
    end ;
    local nChangeCampCount = BT_GetData(PT_CHANGE_CAMP_COUNT);
    Say("<color=green>" .. g_sNpcName .. "<color>: " .. szStr .. "Ng­¬i muèn cèng hiÕn cho phe nµo? <color=yellow>Tr­íc 20/9<color> ta cã thÓ gióp ng­êi ®æi qu©n c«ng miÔn phÝ 3 lÇn. HiÖn giê ng­¬i cã thÓ chuyÓn ®æi qu©n c«ng <color=yellow>" .. (MAX_CHANGE_CAMP - nChangeCampCount) .. "<color> lÇn.", getn(selTab), selTab);
end;

function change_camp_confirm(nCamp)
    local nJunGong = BT_GetData(PT_RANKPOINT);
    local szStr = "";
    local nChangeCampCount = BT_GetData(PT_CHANGE_CAMP_COUNT);
    if nJunGong <= 0 then
        if nCamp == LIAO_ID then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Ng­¬i ®· lµ T­íng sÜ phe Liªu, kh«ng cÇn chuyÓn ®æi qu©n c«ng!");
            return 0;
        end ;
        szStr = "B¹n ®· ®æi sang phe Tèng, qu©n c«ng cña b¹n lµ: <color=yellow>" .. abs(nJunGong) .. "<color>. B¹n cßn <color=yellow>" .. (MAX_CHANGE_CAMP - nChangeCampCount - 1) .. "<color> lÇn ®æi phe miÔn phÝ";
    elseif nJunGong > 0 then
        if nCamp == SONG_ID then
            Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: Ng­¬i ®· lµ T­íng sÜ phe Tèng, kh«ng cÇn chuyÓn ®æi qu©n c«ng!");
            return 0;
        end ;
        szStr = "B¹n ®· ®æi sang phe Liªu, qu©n c«ng cña b¹n lµ: <color=yellow>" .. abs(nJunGong) .. "<color>. B¹n cßn <color=yellow>" .. (MAX_CHANGE_CAMP - nChangeCampCount - 1) .. "<color> lÇn ®æi phe miÔn phÝ";
    end ;
    BT_SetData(PT_RANKPOINT, -nJunGong);
    BT_SetData(PT_CHANGE_CAMP_COUNT, nChangeCampCount + 1);
    Talk(1, "", "<color=green>" .. g_sNpcName .. "<color>: " .. szStr);
end;


function get_lost_jungong()
    local selTab = {
        "§óng vËy, ta muèn chuéc l¹i/ask_for_jungong",
        "Ta suy nghÜ thªm mét chót/nothing",
    }
    local nLostJunGong = BT_GetData(PT_DEATH_LOST_JUNGONG);
    Say("Tæng qu©n c«ng ngµi tæn thÊt hiÖn lµ <color=yellow>"..nLostJunGong.."<color> ®iÓm, mçi qu©n c«ng ch­¬ng <color=yellow>cã thÓ chuéc l¹i 1000 ®iÓm qu©n c«ng<color>, ngµi x¸c ®Þnh muèn chuéc l¹i sao",getn(selTab),selTab);
end;

function ask_for_jungong()
    local nLostJunGong = BT_GetData(PT_DEATH_LOST_JUNGONG);
    if nLostJunGong == 0 then
        Talk(1,"","HiÖn ngµi kh«ng cã qu©n c«ng bÞ tæn thÊt, kh«ng cÇn chuéc l¹i.");
        return 0;
    end;
    AskClientForNumber("ask_for_jungong_callback",1,nLostJunGong,"Ngµi muèn chuéc bao nhiªu qu©n c«ng?");
end;

function ask_for_jungong_callback(nJunGong)
    local nLostJunGong = BT_GetData(PT_DEATH_LOST_JUNGONG);
    if nJunGong > nLostJunGong or nJunGong == 0 then
        return 0;
    end;
    local nNeedItemNum = ceil(nJunGong/1000);
    local selTab = {
        "§óng vËy, ta x¸c ®Þnh chuéc l¹i/#get_lost_jungong_confirm("..nJunGong..")",
        "T¹m kh«ng chuéc/noting",
    }
    Say("Ngµi x¸c ®Þnh chuéc l¹i <color=yellow>"..nJunGong.."<color> ®iÓm qu©n c«ng sao? CÇn tèn <color=yellow>"..nNeedItemNum.."<color> Qu©n C«ng Ch­¬ng.",getn(selTab),selTab);
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
            Msg2Player("Ng­¬i sö dông "..nNeedItemNum.." c¸i Qu©n C«ng Ch­¬ng, kh«i phôc "..nJunGong.." ®iÓm qu©n c«ng phe Tèng");
            WriteLog("[Chuéc Qu©n C«ng]:"..GetName().." Sö dông "..nNeedItemNum.." c¸i Qu©n C«ng Ch­¬ng, kh«i phôc "..nJunGong.." ®iÓm qu©n c«ng phe Tèng");
        else
            BT_SetData(PT_RANKPOINT,BT_GetData(PT_RANKPOINT)-nJunGong);
            Msg2Player("Ng­¬i sö dông "..nNeedItemNum.." c¸i Qu©n C«ng Ch­¬ng, kh«i phôc "..nJunGong.." ®iÓm qu©n c«ng phe Liªu");
            WriteLog("[Chuéc Qu©n C«ng]:"..GetName().." Sö dông "..nNeedItemNum.." c¸i Qu©n C«ng Ch­¬ng, kh«i phôc "..nJunGong.." ®iÓm qu©n c«ng phe Liªu");
        end;
        BT_SetData(PT_DEATH_LOST_JUNGONG,nLostJunGong-nJunGong);
        SetRankPoint(5,701,1);	--Tham gia xÕp h¹ng qu©n c«ng
    else
        Talk(1,"get_lost_jungong","Qu©n C«ng Ch­¬ng cña ngµi ch­a ®ñ, cÇn cã <color=yellow>"..nNeedItemNum.."<color> Qu©n C«ng Ch­¬ng míi cã thÓ chuéc l¹i <color=yellow>"..nJunGong.."<color> ®iÓm qu©n c«ng.");
    end;
end;


Include("\\script\\missions\\wantedboss\\mission.lua")



function CheckCondition(nBossID, nBossType)
    -- client·¢ËÍÇëÇóµ½gs, ½øÐÐ³õ²½¼ì²é, Ã»ÎÊÌâÔÙ·¢µ½relayÈ¥
    if wb_player_check() == 0 then
        Talk(1,"","Lv59 trë lªn, ®· häc hÕt kü n¨ng Lv55, cã thÓ tham gia ho¹t ®éng nµy!")
        return 0;
    end
    if wb_check_map() == 0 then
        Talk(1,"","ChØ trong c¸c thµnh chÝnh míi ®­îc thùc hiÖn thao t¸c nµy!")
        return 0;
    end
    if wb_check_date() == 0 then
        Say(format("<color=green>%s<color>: Ho¹t ®éng %s ®· kÕt thóc!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end
    if wb_check_time() == 0 then
        Say(format("<color=green>%s<color>: Cã thÓ tham gia %s trong thêi gian 8:00-23:00 mçi ngµy, hiÖn kh«ng trong thêi gian ho¹t ®éng!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end
    if GetMapLoadCount(this.realMapID) >= WB_MISSION_MAX then
        Say(format("<color=green>%s<color>: HiÖn cã rÊt nhiÒu hiÖp sÜ tham gia truy s¸t môc tiªu nµy, h·y quay l¹i sau!", WB_NPC_NAME), 0);
        return 0;
    end
    local tTicket = WB_TICKET[nBossType + 1] -- nBossTypeÊÇ´Ó0Base£¬ÐèÒª+1
    local nTeamSize = GetTeamSize()
    if nBossType < 2 then
        if nTeamSize > 0 then
            Talk(1,"",format("<color=green>%s<color>: §é khã nµy kh«ng cho phÐp tæ ®éi khiªu chiÕn!", WB_NPC_NAME))
            return 0;
        end
        if GetItemCount(tTicket[1],tTicket[2],tTicket[3]) < tTicket[4] then
            Talk(1,"",format("<color=green>%s<color>: Trªn ng­êi kh«ng ®ñ %s!", WB_NPC_NAME, tTicket[5]))
            return 0;
        end
        return 1;
    else
        local tError = {}
        if nTeamSize > 0 then
            if GetTeamMember(1) ~= PlayerIndex then
                Talk(1, "", format("<color=green>%s<color>: ChØ ®éi tr­ëng ®­îc tiÕn hµnh thao t¸c.", WB_NPC_NAME))
                return 0;
            end
            local oldIndex = PlayerIndex
            for i = 1, nTeamSize do
                PlayerIndex = GetTeamMember(i)
                if GetItemCount(tTicket[1],tTicket[2],tTicket[3]) < tTicket[4] then
                    tinsert(tError, format("[%s] mang kh«ng ®ñ [%s]!", GetName(), tTicket[5]))
                end
            end
            PlayerIndex = oldIndex
        else
            tinsert(tError, format("§é khã nµy chØ cho phÐp tæ ®éi khiªu chiÕn!", tTicket[5]))
        end
        if getn(tError) > 0 then
            local szErr = "§iÒu kiÖn truy s¸t BOSS:\n"
            for i = 1, getn(tError) do
                szErr = format("%s\n  <color=red>%s<color>",szErr, tError[i])
            end
            Talk(1,"",format("<color=green>%s<color>:%s", WB_NPC_NAME, szErr))
            return 0;
        end
        return 1;
    end
    return 0;
end

function EnterMission(nBossID, nBossTemplete, nBossType)
    -- relay·¢»ØÀ´¿ªÆô¸±±¾Ö¸Áî£¬ÐèÒªÔÙ´Î¼ì²é£¬²¢¿Û³ýÏàÓ¦µÄÃÅÆ±
    if wb_check_map() == 0 then
        Talk(1,"","ChØ trong c¸c thµnh chÝnh míi ®­îc thùc hiÖn thao t¸c nµy!")
        return 0;
    end
    if wb_check_date() == 0 then
        Say(format("<color=green>%s<color>: Ho¹t ®éng %s ®· kÕt thóc!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end
    if wb_check_time() == 0 then
        Say(format("<color=green>%s<color>: Cã thÓ tham gia %s trong thêi gian 8:00-23:00 mçi ngµy, hiÖn kh«ng trong thêi gian ho¹t ®éng!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end
    if GetMapLoadCount(this.realMapID) >= WB_MISSION_MAX then
        Say(format("<color=green>%s<color>: HiÖn cã rÊt nhiÒu hiÖp sÜ tham gia truy s¸t môc tiªu nµy, h·y quay l¹i sau!", WB_NPC_NAME), 0);
        return 0;
    end

    local nTeamSize = GetTeamSize()
    local tError = {}
    local ticket = WB_TICKET[nBossType + 1]
    if nTeamSize > 0 then
        local oldPlayerIndex = PlayerIndex
        for i = 1, nTeamSize do
            PlayerIndex = GetTeamMember(i)
            if DelItem(ticket[1], ticket[2], ticket[3], ticket[4]) ~= 1 then
                tinsert(tError, format("[%s] mang kh«ng ®ñ [%s].", GetName(), ticket[5]))
            end
        end

        for i = 1, nTeamSize do
            PlayerIndex = GetTeamMember(i)
            for j = 1, getn(tError) do
                Msg2Player(tError[j])
            end
        end
        PlayerIndex = oldPlayerIndex
        if getn(tError) > 0 then
            return 0;
        end
    else
        if DelItem(ticket[1], ticket[2], ticket[3], ticket[4]) ~= 1 then
            tinsert(tError, format("[%s] mang kh«ng ®ñ [%s].", GetName(), WB_TICKET[5]))
        end
        for j = 1, getn(tError) do
            Msg2Player(tError[j])
        end
        if getn(tError) > 0 then
            return 0;
        end
    end

    this.realMapID = tWantedBossMAP[nBossType].realMapID;
    local nDynamicMapId, nDynamicMapIdx = tWBMission:Create();
    RemoveNpcInSubworld(nDynamicMapId)

    SetMissionVBySubWorldIdx(nDynamicMapIdx, tWBMission.mvBossDifficult, nBossType)
    SetMissionVBySubWorldIdx(nDynamicMapIdx, tWBMission.mvBossTemplete, nBossTemplete)
    SetMissionVBySubWorldIdx(nDynamicMapIdx, tWBMission.mvBossID, nBossID)
    SetMissionVBySubWorldIdx(nDynamicMapIdx, tWBMission.mvTeamSize, nTeamSize)
    
    tWBMission:TeamEnter(nDynamicMapId, 1);
    return 1;
end

function OnDeath() -- BOSS Death
    local nBossType = GetMissionV(tWBMission.mvBossDifficult)
    SetMissionV(tWBMission.mvResult, 1)
    WantedBossChallengeFinished(GetMissionV(tWBMission.mvBossID), 1)
    wb_runtime_stat(WB_STAT_BOSSDEATH, nBossType, 1)
    tWBMission.msCamp:turnPlayer(1, 
        function()
            local nIdx = GetMissionV(tWBMission.mvBossDifficult) + 1
            local tAward = tWB_AWARD[nIdx]
            
            SetTask(WB_TSKID_KILLBOSS, GetTask(WB_TSKID_KILLBOSS) + 1)
            
            local nKillCoinGot = GetTask(WB_TSKID_DAILY_KILLCOIN)
            local nCanGet = min(tAward.Bounty, WB_KILL_COIN_DAILY_LIMIT - nKillCoinGot)
            SetTask(WB_TSKID_DAILY_KILLCOIN, nKillCoinGot + nCanGet)
            SetTask(WB_TSKID_COIN, GetTask(WB_TSKID_COIN) + nCanGet)
            SetTask(WB_TSKID_RATING, GetTask(WB_TSKID_RATING) + tAward.Rating)
            Msg2Player(format("Khiªu chiÕn thµnh c«ng! NhËn ®­îc TiÒn Th­ëng %d, §iÓm Truy S¸t %d!!", nCanGet, tAward.Rating))
            
            for i = 1 , getn(tWB_ACHIEVEMENT_TARGET) do
                local tTarget = tWB_ACHIEVEMENT_TARGET[i]
                if GetTask(tTarget.tskid) == tTarget.target then
                    wb_do_achievement_award(i)
                end
            end

        end
    )
    finish_current_stage()
end

function OnBossKilledByFriend(nBossID, nBossTemplete, nBossType)
    local boss = tBOSS[nBossTemplete]
    Msg2Player(format("BOSS [%s] mµ hiÖp sÜ chia sÎ ®· bÞ h¶o h÷u tiªu diÖt! Ng­êi cung cÊp manh mèi ®­îc chia %d.", 
        boss.name, 
        boss.shareCoin
    ))
end

function OnGetFriendBounty(nGotBounty)
    if nGotBounty == 0 then
        Say("\n<color=yellow>HiÖn kh«ng thÓ nhËn th­ëng!<color>\n\n",0)
        return
    end
    local nGot = GetTask(WB_TSKID_DAILY_BOUNTY_GOT)
    local nBefore = nGot - nGotBounty
    wb_runtime_stat(WB_STAT_GETBOUNTY, 0, nGotBounty)
    if nBefore <= 0 then
        wb_runtime_stat(WB_STAT_GETBOUNTY1, 0, 1)
    elseif nBefore <= 3000 and nGot > 3000 then
        wb_runtime_stat(WB_STAT_GETBOUNTY3000, 0, 1)
    elseif nBefore <= 6000 and nGot > 6000 then
        wb_runtime_stat(WB_STAT_GETBOUNTY6000, 0, 1)
    end
end

function BuyFlag()
    if wb_player_check() == 0 then
        Talk(1,"","Lv59 trë lªn, ®· häc hÕt kü n¨ng Lv55, cã thÓ tham gia ho¹t ®éng nµy!")
        return 0;
    end
    if wb_check_map() == 0 then
        Talk(1,"","ChØ trong c¸c thµnh chÝnh míi ®­îc thùc hiÖn thao t¸c nµy!")
        return 0;
    end
    if wb_check_date() == 0 then
        Say(format("<color=green>%s<color>: Ho¹t ®éng %s ®· kÕt thóc!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end

    local nSent = GetTask(WB_TSKID_FLAG_SENT)
    local szTitle = format("<color=green>%s<color>: TÆng cÇn tèn <color=red>%s<color>, gióp t¨ng møc chia lîi h«m nay thªm %d!\n\n    <color=gold>Mçi ngµy ®­îc tÆng %d/%d lÇn<color>.\n\n", WB_NPC_NAME, tFlag[1], tFlag[3], nSent, tFlag[4])
    local tbSay = {}
    if nSent < tFlag[4] then
        tinsert(tbSay, "X¸c nhËn tÆng/ConfirmSendFlag")
    end
    tinsert(tbSay, "Hñy bá/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function ConfirmSendFlag()
    local tItem = tFlag[2]
    if DelItem(tItem[1],tItem[2],tItem[3],tItem[4]) == 1 then
        local nExtBounty = GetTask(WB_TSKID_ADD_MAX_DAILY_BOUNTY)
        SetTask(WB_TSKID_ADD_MAX_DAILY_BOUNTY, nExtBounty + tFlag[3])
        SetTask(WB_TSKID_FLAG_SENT, GetTask(WB_TSKID_FLAG_SENT)+1)
        -- Ë¢ÐÂÒ»ÏÂ¿Í»§¶Ë½çÃæ
        WantedBossUpdateUIView()
        wb_runtime_stat(WB_STAT_ADDEXBOUNTY, 0, 1)
    else
        Talk(1,"",format("<color=green>%s<color>: Trªn ng­êi kh«ng ®ñ ®¹o cô!", WB_NPC_NAME))
    end
end


function CreateBossFailed(nReason)
    if nReason == 1 then
        local _,Idx = gf_AddItemEx2({2,1,31298,1,4}, "Manh Mèi", "Truy S¸t BOSS hoµn tÊt sÏ hoµn tr¶ Manh Mèi")
        gf_SetItemExpireTime(Idx, WB_END_DATE.y, WB_END_DATE.m, WB_END_DATE.d, 23, 59, 0);
    end
end

function OnBossCreated(nBossID, nTemp, nType)
    wb_runtime_stat(WB_STAT_CREATEBOSS, nType, 1)
end
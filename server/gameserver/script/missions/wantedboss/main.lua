
Include("\\script\\missions\\wantedboss\\mission.lua")



function CheckCondition(nBossID, nBossType)
    -- client发送请求到gs, 进行初步检查, 没问题再发到relay去
    if wb_player_check() == 0 then
        Talk(1,"","Lv59 tr� l猲,  h鋍 h誸 k� n╪g Lv55, c� th� tham gia ho箃 ng n祔!")
        return 0;
    end
    if wb_check_map() == 0 then
        Talk(1,"","Ch� trong c竎 th祅h ch輓h m韎 頲 th鵦 hi謓 thao t竎 n祔!")
        return 0;
    end
    if wb_check_date() == 0 then
        Say(format("<color=green>%s<color>: Ho箃 ng %s  k誸 th骳!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end
    if wb_check_time() == 0 then
        Say(format("<color=green>%s<color>: C� th� tham gia %s trong th阨 gian 8:00-23:00 m鏸 ng祔, hi謓 kh玭g trong th阨 gian ho箃 ng!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end
    if GetMapLoadCount(this.realMapID) >= WB_MISSION_MAX then
        Say(format("<color=green>%s<color>: Hi謓 c� r蕋 nhi襲 hi謕 s� tham gia truy s竧 m鬰 ti猽 n祔, h穣 quay l筰 sau!", WB_NPC_NAME), 0);
        return 0;
    end
    local tTicket = WB_TICKET[nBossType + 1] -- nBossType是从0Base，需要+1
    local nTeamSize = GetTeamSize()
    if nBossType < 2 then
        if nTeamSize > 0 then
            Talk(1,"",format("<color=green>%s<color>: ч kh� n祔 kh玭g cho ph衟 t� i khi猽 chi課!", WB_NPC_NAME))
            return 0;
        end
        if GetItemCount(tTicket[1],tTicket[2],tTicket[3]) < tTicket[4] then
            Talk(1,"",format("<color=green>%s<color>: Tr猲 ngi kh玭g  %s!", WB_NPC_NAME, tTicket[5]))
            return 0;
        end
        return 1;
    else
        local tError = {}
        if nTeamSize > 0 then
            if GetTeamMember(1) ~= PlayerIndex then
                Talk(1, "", format("<color=green>%s<color>: Ch� i trng 頲 ti課 h祅h thao t竎.", WB_NPC_NAME))
                return 0;
            end
            local oldIndex = PlayerIndex
            for i = 1, nTeamSize do
                PlayerIndex = GetTeamMember(i)
                if GetItemCount(tTicket[1],tTicket[2],tTicket[3]) < tTicket[4] then
                    tinsert(tError, format("[%s] mang kh玭g  [%s]!", GetName(), tTicket[5]))
                end
            end
            PlayerIndex = oldIndex
        else
            tinsert(tError, format("ч kh� n祔 ch� cho ph衟 t� i khi猽 chi課!", tTicket[5]))
        end
        if getn(tError) > 0 then
            local szErr = "襲 ki謓 truy s竧 BOSS:\n"
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
    -- relay发回来开启副本指令，需要再次检查，并扣除相应的门票
    if wb_check_map() == 0 then
        Talk(1,"","Ch� trong c竎 th祅h ch輓h m韎 頲 th鵦 hi謓 thao t竎 n祔!")
        return 0;
    end
    if wb_check_date() == 0 then
        Say(format("<color=green>%s<color>: Ho箃 ng %s  k誸 th骳!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end
    if wb_check_time() == 0 then
        Say(format("<color=green>%s<color>: C� th� tham gia %s trong th阨 gian 8:00-23:00 m鏸 ng祔, hi謓 kh玭g trong th阨 gian ho箃 ng!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end
    if GetMapLoadCount(this.realMapID) >= WB_MISSION_MAX then
        Say(format("<color=green>%s<color>: Hi謓 c� r蕋 nhi襲 hi謕 s� tham gia truy s竧 m鬰 ti猽 n祔, h穣 quay l筰 sau!", WB_NPC_NAME), 0);
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
                tinsert(tError, format("[%s] mang kh玭g  [%s].", GetName(), ticket[5]))
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
            tinsert(tError, format("[%s] mang kh玭g  [%s].", GetName(), WB_TICKET[5]))
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
            Msg2Player(format("Khi猽 chi課 th祅h c玭g! Nh薾 頲 Ti襫 Thng %d, 觤 Truy S竧 %d!!", nCanGet, tAward.Rating))
            
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
    Msg2Player(format("BOSS [%s] m� hi謕 s� chia s�  b� h秓 h鱱 ti猽 di謙! Ngi cung c蕄 manh m鑙 頲 chia %d.", 
        boss.name, 
        boss.shareCoin
    ))
end

function OnGetFriendBounty(nGotBounty)
    if nGotBounty == 0 then
        Say("\n<color=yellow>Hi謓 kh玭g th� nh薾 thng!<color>\n\n",0)
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
        Talk(1,"","Lv59 tr� l猲,  h鋍 h誸 k� n╪g Lv55, c� th� tham gia ho箃 ng n祔!")
        return 0;
    end
    if wb_check_map() == 0 then
        Talk(1,"","Ch� trong c竎 th祅h ch輓h m韎 頲 th鵦 hi謓 thao t竎 n祔!")
        return 0;
    end
    if wb_check_date() == 0 then
        Say(format("<color=green>%s<color>: Ho箃 ng %s  k誸 th骳!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end

    local nSent = GetTask(WB_TSKID_FLAG_SENT)
    local szTitle = format("<color=green>%s<color>: T苙g c莕 t鑞 <color=red>%s<color>, gi髉 t╪g m鴆 chia l頸 h玬 nay th猰 %d!\n\n    <color=gold>M鏸 ng祔 頲 t苙g %d/%d l莕<color>.\n\n", WB_NPC_NAME, tFlag[1], tFlag[3], nSent, tFlag[4])
    local tbSay = {}
    if nSent < tFlag[4] then
        tinsert(tbSay, "X竎 nh薾 t苙g/ConfirmSendFlag")
    end
    tinsert(tbSay, "H駓 b�/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function ConfirmSendFlag()
    local tItem = tFlag[2]
    if DelItem(tItem[1],tItem[2],tItem[3],tItem[4]) == 1 then
        local nExtBounty = GetTask(WB_TSKID_ADD_MAX_DAILY_BOUNTY)
        SetTask(WB_TSKID_ADD_MAX_DAILY_BOUNTY, nExtBounty + tFlag[3])
        SetTask(WB_TSKID_FLAG_SENT, GetTask(WB_TSKID_FLAG_SENT)+1)
        -- 刷新一下客户端界面
        WantedBossUpdateUIView()
        wb_runtime_stat(WB_STAT_ADDEXBOUNTY, 0, 1)
    else
        Talk(1,"",format("<color=green>%s<color>: Tr猲 ngi kh玭g  o c�!", WB_NPC_NAME))
    end
end


function CreateBossFailed(nReason)
    if nReason == 1 then
        local _,Idx = gf_AddItemEx2({2,1,31298,1,4}, "Manh M鑙", "Truy S竧 BOSS ho祅 t蕋 s� ho祅 tr� Manh M鑙")
        gf_SetItemExpireTime(Idx, WB_END_DATE.y, WB_END_DATE.m, WB_END_DATE.d, 23, 59, 0);
    end
end

function OnBossCreated(nBossID, nTemp, nType)
    wb_runtime_stat(WB_STAT_CREATEBOSS, nType, 1)
end
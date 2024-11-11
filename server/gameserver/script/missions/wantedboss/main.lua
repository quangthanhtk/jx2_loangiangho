
Include("\\script\\missions\\wantedboss\\mission.lua")



function CheckCondition(nBossID, nBossType)
    -- client��������gs, ���г������, û�����ٷ���relayȥ
    if wb_player_check() == 0 then
        Talk(1,"","Lv59 tr� l�n, �� h�c h�t k� n�ng Lv55, c� th� tham gia ho�t ��ng n�y!")
        return 0;
    end
    if wb_check_map() == 0 then
        Talk(1,"","Ch� trong c�c th�nh ch�nh m�i ���c th�c hi�n thao t�c n�y!")
        return 0;
    end
    if wb_check_date() == 0 then
        Say(format("<color=green>%s<color>: Ho�t ��ng %s �� k�t th�c!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end
    if wb_check_time() == 0 then
        Say(format("<color=green>%s<color>: C� th� tham gia %s trong th�i gian 8:00-23:00 m�i ng�y, hi�n kh�ng trong th�i gian ho�t ��ng!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end
    if GetMapLoadCount(this.realMapID) >= WB_MISSION_MAX then
        Say(format("<color=green>%s<color>: Hi�n c� r�t nhi�u hi�p s� tham gia truy s�t m�c ti�u n�y, h�y quay l�i sau!", WB_NPC_NAME), 0);
        return 0;
    end
    local tTicket = WB_TICKET[nBossType + 1] -- nBossType�Ǵ�0Base����Ҫ+1
    local nTeamSize = GetTeamSize()
    if nBossType < 2 then
        if nTeamSize > 0 then
            Talk(1,"",format("<color=green>%s<color>: �� kh� n�y kh�ng cho ph�p t� ��i khi�u chi�n!", WB_NPC_NAME))
            return 0;
        end
        if GetItemCount(tTicket[1],tTicket[2],tTicket[3]) < tTicket[4] then
            Talk(1,"",format("<color=green>%s<color>: Tr�n ng��i kh�ng �� %s!", WB_NPC_NAME, tTicket[5]))
            return 0;
        end
        return 1;
    else
        local tError = {}
        if nTeamSize > 0 then
            if GetTeamMember(1) ~= PlayerIndex then
                Talk(1, "", format("<color=green>%s<color>: Ch� ��i tr��ng ���c ti�n h�nh thao t�c.", WB_NPC_NAME))
                return 0;
            end
            local oldIndex = PlayerIndex
            for i = 1, nTeamSize do
                PlayerIndex = GetTeamMember(i)
                if GetItemCount(tTicket[1],tTicket[2],tTicket[3]) < tTicket[4] then
                    tinsert(tError, format("[%s] mang kh�ng �� [%s]!", GetName(), tTicket[5]))
                end
            end
            PlayerIndex = oldIndex
        else
            tinsert(tError, format("�� kh� n�y ch� cho ph�p t� ��i khi�u chi�n!", tTicket[5]))
        end
        if getn(tError) > 0 then
            local szErr = "�i�u ki�n truy s�t BOSS:\n"
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
    -- relay��������������ָ���Ҫ�ٴμ�飬���۳���Ӧ����Ʊ
    if wb_check_map() == 0 then
        Talk(1,"","Ch� trong c�c th�nh ch�nh m�i ���c th�c hi�n thao t�c n�y!")
        return 0;
    end
    if wb_check_date() == 0 then
        Say(format("<color=green>%s<color>: Ho�t ��ng %s �� k�t th�c!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end
    if wb_check_time() == 0 then
        Say(format("<color=green>%s<color>: C� th� tham gia %s trong th�i gian 8:00-23:00 m�i ng�y, hi�n kh�ng trong th�i gian ho�t ��ng!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end
    if GetMapLoadCount(this.realMapID) >= WB_MISSION_MAX then
        Say(format("<color=green>%s<color>: Hi�n c� r�t nhi�u hi�p s� tham gia truy s�t m�c ti�u n�y, h�y quay l�i sau!", WB_NPC_NAME), 0);
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
                tinsert(tError, format("[%s] mang kh�ng �� [%s].", GetName(), ticket[5]))
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
            tinsert(tError, format("[%s] mang kh�ng �� [%s].", GetName(), WB_TICKET[5]))
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
            Msg2Player(format("Khi�u chi�n th�nh c�ng! Nh�n ���c Ti�n Th��ng %d, �i�m Truy S�t %d!!", nCanGet, tAward.Rating))
            
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
    Msg2Player(format("BOSS [%s] m� hi�p s� chia s� �� b� h�o h�u ti�u di�t! Ng��i cung c�p manh m�i ���c chia %d.", 
        boss.name, 
        boss.shareCoin
    ))
end

function OnGetFriendBounty(nGotBounty)
    if nGotBounty == 0 then
        Say("\n<color=yellow>Hi�n kh�ng th� nh�n th��ng!<color>\n\n",0)
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
        Talk(1,"","Lv59 tr� l�n, �� h�c h�t k� n�ng Lv55, c� th� tham gia ho�t ��ng n�y!")
        return 0;
    end
    if wb_check_map() == 0 then
        Talk(1,"","Ch� trong c�c th�nh ch�nh m�i ���c th�c hi�n thao t�c n�y!")
        return 0;
    end
    if wb_check_date() == 0 then
        Say(format("<color=green>%s<color>: Ho�t ��ng %s �� k�t th�c!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end

    local nSent = GetTask(WB_TSKID_FLAG_SENT)
    local szTitle = format("<color=green>%s<color>: T�ng c�n t�n <color=red>%s<color>, gi�p t�ng m�c chia l�i h�m nay th�m %d!\n\n    <color=gold>M�i ng�y ���c t�ng %d/%d l�n<color>.\n\n", WB_NPC_NAME, tFlag[1], tFlag[3], nSent, tFlag[4])
    local tbSay = {}
    if nSent < tFlag[4] then
        tinsert(tbSay, "X�c nh�n t�ng/ConfirmSendFlag")
    end
    tinsert(tbSay, "H�y b�/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function ConfirmSendFlag()
    local tItem = tFlag[2]
    if DelItem(tItem[1],tItem[2],tItem[3],tItem[4]) == 1 then
        local nExtBounty = GetTask(WB_TSKID_ADD_MAX_DAILY_BOUNTY)
        SetTask(WB_TSKID_ADD_MAX_DAILY_BOUNTY, nExtBounty + tFlag[3])
        SetTask(WB_TSKID_FLAG_SENT, GetTask(WB_TSKID_FLAG_SENT)+1)
        -- ˢ��һ�¿ͻ��˽���
        WantedBossUpdateUIView()
        wb_runtime_stat(WB_STAT_ADDEXBOUNTY, 0, 1)
    else
        Talk(1,"",format("<color=green>%s<color>: Tr�n ng��i kh�ng �� ��o c�!", WB_NPC_NAME))
    end
end


function CreateBossFailed(nReason)
    if nReason == 1 then
        local _,Idx = gf_AddItemEx2({2,1,31298,1,4}, "Manh M�i", "Truy S�t BOSS ho�n t�t s� ho�n tr� Manh M�i")
        gf_SetItemExpireTime(Idx, WB_END_DATE.y, WB_END_DATE.m, WB_END_DATE.d, 23, 59, 0);
    end
end

function OnBossCreated(nBossID, nTemp, nType)
    wb_runtime_stat(WB_STAT_CREATEBOSS, nType, 1)
end
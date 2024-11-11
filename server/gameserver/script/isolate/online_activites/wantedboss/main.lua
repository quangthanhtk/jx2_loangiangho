--����ģ�黯��һ����׼���ļ�����ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������������Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�������ջص�Ӱ��Ч��
Include("\\script\\missions\\wantedboss\\head.lua")
Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\biwudahui\\tournament\\tournament_head.lua")
Include("\\script\\mail\\mail_lux.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "wantedboss",
    szViewName 			= "V� L�m Truy S�t L�nh",
    nTalkBeginDate		= WB_BEGIN_DATE.ymd,
    nBeginDate 			= WB_BEGIN_DATE.ymd,
    nEndDate 			= WB_END_DATE.ymd,
}
 

function wb_on_event(tData)
    local nNeedRate = tData[4][1]
    local rate = random(1,100)
    if gf_JudgeRoomWeight(1, 100) ~= 1 then
        return 0
    end
    if rate <= nNeedRate then
        local _,Idx = gf_AddItemEx({2,1,31298,1,4}, "Manh M�i")
        gf_SetItemExpireTime(Idx, WB_END_DATE.y, WB_END_DATE.m, WB_END_DATE.d, 23, 59, 0);
    end
end

t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskId, nAcessCode = 0},
   {id={"tsk_free_search", WB_TSKID_DAILY_FREE_SEARCH, 0}, clear = "daily" }, 
   {id={"tsk_daily_tickey", WB_TSKID_DAILY_TICKET, 0}, clear = "daily" }, 
   {id={"tsk_daily_max_bounty", WB_TSKID_ADD_MAX_DAILY_BOUNTY, 0}, clear = "daily" }, 
   {id={"tsk_daily_bounty_got", WB_TSKID_DAILY_BOUNTY_GOT, 0}, clear = "daily" }, 
   {id={"tsk_daily_flag_sent", WB_TSKID_FLAG_SENT, 0}, clear = "daily" },   
   {id={"tsk_daily_kill_coin", WB_TSKID_DAILY_KILLCOIN, 0}, clear = "daily" },   
   
}

function UpdatePlayerTaskVersion()
    local nTskVersion = GetTask(WB_TASK_VERSION)
    if nTskVersion < WB_VERSION then
        SetTask(WB_TASK_VERSION, WB_VERSION)

        -- do task clear
        SetTask(WB_TSKID_RATING, 0)     -- ͨ�������
        SetTask(WB_TSKID_COIN, 0)       -- �ͽ�
        SetTask(WB_TSKID_KILLBOSS, 0)   -- ���Ƴɾ͵Ļ�ɱBOSS����

        -- clear equip shop taskid
        for i = 3545, 3568 do
            SetTask(i, 0)
        end

        for i = 3579, 3580 do
            SetTask(i, 0)
        end
    end
end

t_isolate_user_batch_watch_list = {
    {"event_mission_stage_finish", {"jiandangyanyun", 5},       wb_on_event,    { 20,}  },
    {"event_mission_stage_finish", {"jiandangyanyun", 6},       wb_on_event,    { 20 }  },
    {"event_mission_stage_finish", {"jiandangyanyunhero", 5},   wb_on_event,    { 20 }  },
    {"event_mission_stage_finish", {"jiandangyanyunhero", 6},   wb_on_event,    { 20 }  },
    
    {"event_mission_stage_finish", {"taiyi", 6},                wb_on_event,    { 20 }  },
    {"event_mission_stage_finish", {"taiyihero", 6},            wb_on_event,    { 20 } },
    
    {"event_mission_stage_finish", {"new_taixu", 30},            wb_on_event,   { 20 }  },
    {"event_mission_stage_finish", {"dixuangong", 3},           wb_on_event,    { 20 }  },
    {"event_mission_stage_finish", {"wanjianzhong", 4},         wb_on_event,    { 20 }  },
    {"event_mission_stage_finish", {"liangshan", 4},            wb_on_event,    { 20 }  },

    -- {"event_mission_award", {"biwudahui", -1, -1, 0},           wb_on_event,    { 50 }  },
    -- {"event_mission_award", {"kfbattle", -1, -1, 0},            wb_on_event,    { 50 }  },

    {"event_mission_task_award", {"pvp","yunbiao", -1}, 	    wb_on_event,    { 20 },  },
	{"event_mission_task_award", {"pvp","duobiao", -1}, 	    wb_on_event,    { 20 },  },
	{"event_mission_task_award", {"pvp","baozang", -1}, 	    wb_on_event,    { 20 },  },
}

function on_add_watches() 
    isolate_watch_npc_talk(WB_NPC_NAME, 100, "wb_talk2npc")
    isolate_watch_npc_talk(WB_NPC_NAME, 200, "wb_talk2npc")
    isolate_watch_npc_talk(WB_NPC_NAME, 300, "wb_talk2npc")
    isolate_watch_npc_talk(WB_NPC_NAME, 150, "wb_talk2npc")
    isolate_watch_npc_talk(WB_NPC_NAME, 350, "wb_talk2npc")
    isolate_watch_npc_talk(WB_NPC_NAME, 400, "wb_talk2npc")
    isolate_watch_npc_talk(WB_NPC_NAME, 500, "wb_talk2npc")
    isolate_watch_item_talk(2,1,31298, "wb_boss_clue")
    isolate_watch_item_talk(2,1,31304, "wb_boss_clue_bag")
end

function wb_boss_clue_bag(nIndex)
    if wb_check_date() == 0 then
        Say(format("%s �� k�t th�c!", tWBMission.name), 0);
        return 0;
    end
    if gf_JudgeRoomWeight(1, 100) ~= 1 then
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
		return 0
	end
    if DelItemByIndex(nIndex, 1) == 1 then
        local _,Idx = gf_AddItemEx({2,1,31298,5,4}, "Manh M�i")
        gf_SetItemExpireTime(Idx, WB_END_DATE.y, WB_END_DATE.m, WB_END_DATE.d, 23, 59, 0);
    end
end

function wb_boss_clue(nIndex)
    if wb_check_time() == 0 then
        Say("C� th� tham gia trong th�i gian 8:00-23:00 m�i ng�y, hi�n kh�ng trong th�i gian ho�t ��ng!", 0);
        return 0;
    end
    if gf_JudgeRoomWeight(1, 100) ~= 1 then
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
		return 0
	end
    if DelItemByIndex(nIndex, 1) == 1 then
        local nRand = random(10000)
        local nBossType = 0
        if nRand < 1000 then
            nBossType = 3;
        elseif nRand < 4000 then
            nBossType = 2;
        elseif nRand < 6000 then
            nBossType = 1;
        else
            nBossType = 0;
        end
        WantedBossCreateBoss(nBossType)
    end
end


function wb_talk2npc()
    if wb_check_date() == 0 then
        Say(format("<color=green>%s<color>: %s �� k�t th�c!", WB_NPC_NAME, tWBMission.name), 0);
        return 0;
    end
    local szTitle = format("<color=green>%s<color>:%s", WB_NPC_NAME, "C� th� ��n ��y xem Danh S�ch Truy S�t L�nh.")
    local tSay = {}
    tinsert(tSay, "Xem Truy S�t L�nh/wb_showlist")
    tinsert(tSay, "Ti�m Treo Th��ng/wb_shop")
    tinsert(tSay, "H�y b�/nothing")
    Say(szTitle, getn(tSay), tSay)
end

function wb_showlist()
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
    WantedBossOpenUI()
end

function wb_shop()
    SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3114, "Ti�m Th��ng Truy S�t"))
end

function on_event_server_start() 
    CreateNpc(WB_NPC_TEMP, WB_NPC_NAME, 100, 1491, 3009)
    CreateNpc(WB_NPC_TEMP, WB_NPC_NAME, 200, 1385, 2703)
    CreateNpc(WB_NPC_TEMP, WB_NPC_NAME, 300, 1773, 3524)
    CreateNpc(WB_NPC_TEMP, WB_NPC_NAME, 150, 1689, 3110)
    CreateNpc(WB_NPC_TEMP, WB_NPC_NAME, 350, 1490, 3011)
    CreateNpc(WB_NPC_TEMP, WB_NPC_NAME, 500, 1856, 3114)
    CreateNpc(WB_NPC_TEMP, WB_NPC_NAME, 400, 1515, 2841)
end

function on_event_player_login(nExchangeComing) 
    if wb_player_check() ~= 1 then
        -- 90������ѧ��55�����ܲ��ܲ���û
        return
    end
    UpdatePlayerTaskVersion()
    local nLastGet = GetTask(WB_TSKID_DAILY_TICKET)
    local nDate = tonumber(date("%Y%m%d"))
    if nDate > nLastGet then
        SetTask(WB_TSKID_DAILY_TICKET, nDate)
        sendScriptMail(
			WB_NPC_NAME, 
			GetName(), 
			"V� L�m Truy S�t L�nh", 
			format("Trong ho�t ��ng, m�i ng�y nh�n ���c:\n\n    %d B�ch Ng�n Truy S�t L�nh\n    %d Ho�ng Kim Truy S�t L�nh\n\nH�y nh�n qua ��nh k�m.", 4, 1),
			[[SendScript2VM("\\script\\missions\\wantedboss\\head.lua", "wb_daily_ticket_award()")]], 
			"wb_daily_tickey_check")
    end
end
--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
-- function on_first_login_clear(nLastLoginDate)--isolate���ߺ��һ�ε�¼ʱ������
-- 	t_Fix_201606:fix_up(nLastLoginDate)
-- end 




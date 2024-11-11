Import("\\script\\ksgvn\\lib.lua")
Import("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Include("\\script\\ksgvn\\autoexec\\ksg_system_head.lua")
Include("\\script\\ksgvn\\autoexec\\ksg_system_listener.lua")

Import('\\script\\ksgvn\\event\\monthly\\monthly.lua')

t_isolate_base_cfg = { --����һ������������
    nPriority = 1,
    szEngName = "ksg_system",
    szViewName = "V� L�m 2",
    nTalkBeginDate = 0,
    nBeginDate = 0,
    nEndDate = 0,
}

t_isolate_task_list = { --ģ���õ��������������id={szTaskName,nTaskGroupIdx},

}

function on_add_watches()
    for _, tbItemTalk in g_tbItemTalkCfg do
        local nG, nD, nP = KsgLib:UnPack(tbItemTalk.tbProp)
        isolate_watch_item_talk(nG, nD, nP, tbItemTalk.szFunc)
    end
    for i = KSG_ITEMPACK_START, KSG_ITEMPACK_END do
        isolate_watch_item_talk(2, 1, i, "_ksg_HandleItemPack")
    end
    for k, tbNpcCfg in g_tbNpcTalkCfg do
        AddMisEvent("event_talk_npc", tbNpcCfg.szName, tbNpcCfg.nMapId, tbNpcCfg.szFuncExecuteAt, tbNpcCfg.szHandleFunc, tbNpcCfg.szTalk)
    end

    isolate_watch_event("event_ib_cost", "_ksg_ib_cost", PackItemId(2, 97, 236))--�콾�����Ѽ���

    -- Monthly event
    isolate_watch_item_talk(MONTHLY_EVENT_AWARD1[1], MONTHLY_EVENT_AWARD1[2], MONTHLY_EVENT_AWARD1[3], "monthlyEvent_OnUseItem")
    isolate_watch_item_talk(MONTHLY_EVENT_AWARD2[1], MONTHLY_EVENT_AWARD2[2], MONTHLY_EVENT_AWARD2[3], "monthlyEvent_OnUseItem")
    isolate_watch_item_talk(MONTHLY_EVENT_AWARD3[1], MONTHLY_EVENT_AWARD3[2], MONTHLY_EVENT_AWARD3[3], "monthlyEvent_OnUseItem")
end

function on_event_player_login(nExchangeComing)
    if KsgLib:IsInDualTopTime() then
        KsgPlayer:Msg("Ho�t ��ng �ua TOP �ang di�n ra. Th�ng tin chi ti�t ho�t ��ng ��ng ��o c� th� xem t�i trang ch�.")
    end
    if KsgLib:IsTestServer() then
        KsgPlayer:Msg("C�m �n b�n �� tham gia m�y ch� th� nghi�m! N�u trong qu� tr�nh h�nh t�u g�p v�n �� kh�c m�c, h�y li�n h� ngay FanPage �� ���c h� tr�!")
    end
    --KsgPlayer:Msg(format("S� ki�n %s �ang di�n ra r�t n�o nhi�t, h�y mau ��n t�m Li�n Chi t�i Bi�n Kinh �� tham gia.", g_monthlyEvent_Name))
end

function on_event_player_logout()

end

function on_event_daily_clear(nCurDate, nLastDate)

end

function on_event_weekly_clear(nCurWeek, nLastWeek)
    
end

function on_event_monthly_clear(nCurMonth, nLastMonth)

end

function _ksg_ib_cost(tEvent, data, para)

end

function _ksg_handle_monthlyEvent_Item(nItemIndex)
    monthlyEvent_OnUseItem(nItemIndex)
end

t_isolate_user_batch_watch_list = {--{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), {task_name, s� t�i qu� v� l�m, th��ng l�nh jx2, hu�n ch��ng jx2, s� �i�m phong hoa}}
    { "event_player_daily_online_minute", { 60 }, _ksg_onActivityFinish_Online60Min, { "Online 60 ph�t" }, },
    { "event_player_daily_online_minute", { 180 }, _ksg_onActivityFinish_Online180Min, { "Online 180 ph�t" }, },
    
    { "event_mission_stage_finish", { "liangshan", -1 }, _ksg_onActivityFinish_LSB, { "Ho�n th�nh �i L��ng S�n B�c" }, },
    { "event_mission_stage_finish", { "wanjianzhong", -1 }, _ksg_onActivityFinish_VKT, { "Ho�n th�nh �i V�n Ki�m Tr�ng" }, },
    { "event_mission_stage_finish", { "dixuangong", -1 }, _ksg_onActivityFinish_DHC, { "Ho�n th�nh �i ��a Huy�n Cung" }, },

    { "event_mission_stage_finish", { "jiandangyanyun", -1 }, _ksg_onActivityFinish_KDYV, { "Ho�n th�nh �i Ki�m ��ng Y�n V�n" }, },
    { "event_mission_stage_finish", { "jiandangyanyunhero", -1 }, _ksg_onActivityFinish_KDYV, { "Ho�n th�nh �i Ki�m ��ng Y�n V�n Anh H�ng" }, },
    
    
    { "event_mission_stage_finish", { "taiyi", -1 }, _ksg_onActivityFinish_TNT, { "Ho�n th�nh �i Th�i Nh�t Th�p" }, },
    { "event_mission_stage_finish", { "taiyihero", -1 }, _ksg_onActivityFinish_TNT, { "Ho�n th�nh �i Th�i Nh�t Th�p - Anh h�ng" }, },
    
    { "event_mission_stage_finish", { "new_taixu", -1 }, _ksg_onActivityFinish_TH, { "Ho�n th�nh �i Th�i H�" }, },
    { "event_mission_stage_finish", { "cangjian", -1 }, _ksg_onActivityFinish_TK, { "Qua �i t�ng ki�m" }, },
    { "event_mission_stage_finish", { "tuquangcac", -1, }, _ksg_onActivityFinish_TQC, { "Qua �i T� Quang C�c" }, },
    { "event_mission_stage_finish", { "tuquangcac", 5, }, _ksg_onActivityFinish_TQC5, { "Qua �i 5 T� Quang C�c" }, },
    { "event_mission_stage_finish", { "tuquangcac", 6, }, _ksg_onActivityFinish_TQC6, { "Qua �i 6 T� Quang C�c" }, },

    { "event_mission_award", { "newbattle", -1, -1, -1 }, _ksg_onActivityFinish_NewBattle, { "Nh�n th��ng chi�n tr��ng" }, },
    { "event_mission_award", { "tianmenzhen", -1, -1, -1 }, _ksg_onActivityFinish_TMT, { "Nh�n th��ng Thi�n M�n Tr�n" }, },

    { "event_mission_award", { "kfbattle", -1, -1, -1 }, _ksg_onActivityFinish_TMTLSV, { "L�nh th��ng 1 l�n Thi�n M�n Tr�n LSV" }, },
    { "event_mission_award", { "hieplo", -1, -1, -1 }, _ksg_onActivityFinish_HiepLo, { "Nh�n th��ng Hi�p L� LSV" }, },
    { "event_mission_award", { "phaodaichien", -1, -1, -1 }, _ksg_onActivityFinish_PDLSV, { "Nh�n th��ng Ph�o ��i chi�n LSV" }, },

    { "event_mission_task_award", { "pvp", "yunbiao", -1 }, _ksg_onActivityFinish_VanTieu, { "Ho�n th�nh 1 l�n v�n ti�u" }, },
    { "event_mission_task_award", { "pvp", "duobiao", -1 }, _ksg_onActivityFinish_CuopTieu, { "Ho�n th�nh 1 l�n c��p ti�u" }, },

    { "event_mission_task_award", { "planttree", "plantseedtree", -1 }, _ksg_onActivityFinish_TuiHG, { "Tr�ng th�nh c�ng c�y t�i h�t gi�ng" }, },
    { "event_mission_task_award", { "planttree", "bigtreeprize", -1 }, _ksg_onActivityFinish_BNL, { "Thu ho�ch b�t nh� l�n" }, },
    { "event_mission_task_award", { "planttree", "smalltreeprize", -1 }, _ksg_onActivityFinish_BNN, { "Thu ho�ch c�y b�t nh� nh�" }, },
    { "event_mission_task_award", { "planttree", "plant4lingtree", -1 }, _ksg_onActivityFinish_CayTuLinh, { "Tr�ng th�nh c�ng c�y t� linh" }, },
    --{ "event_mission_task_award", { "planttree", "plantbigtree", -1 }, _ksg_onActivityFinish_BNL, { "Tr�ng th�nh c�ng c�y b�t nh� l�n" }, },

    -- KSG events
    { "event_mission_task_award", { "ksgsystem", "thuonghoi", -1 }, _ksg_onActivityFinish_ThuongHoi, { "Ho�n th�nh th��ng h�i" }, },
    --{ "event_mission_task_award", { "ksgsystem", "nvsumon", -1 }, _ksg_onActivityFinish_NhiemVuSuMon, { "Ho�n th�nh s� m�n" }, },
    { "event_mission_task_award", { "ksgsystem", "nvsumon_new", -1 }, _ksg_onActivityFinish_NhiemVuSuMon_New, { "Ho�n th�nh s� m�n m�i" }, },
    { "event_mission_task_award", { "ksgsystem", "newresourcebattle", -1, }, _ksg_onActivityFinish_NewResBattle, { "Nh�n th��ng nhi�m v� T�i Nguy�n Chi�n" }, },
    { "event_mission_task_award", { "ksgsystem", "luckystar", 16, }, _ksg_onActivityFinish_LuckyStar, { "D�ng 16 sao may m�n" }, },
    { "event_mission_task_award", { "ksgsystem", "luckystar", 32, }, _ksg_onActivityFinish_LuckyStar, { "D�ng 32 sao may m�n" }, },
    { "event_mission_task_award", { "ksgsystem", "nuoabaohap", 100, }, _ksg_onActivityFinish_NuOa, { "D�ng 100 n� oa b�o h�p" }, },
    { "event_mission_task_award", { "ksgsystem", "nuoabaohap", 200, }, _ksg_onActivityFinish_NuOa, { "D�ng 200 n� oa b�o h�p" }, },
    { "event_mission_affairs", { "worldboss", "killboss", -1 }, _ksg_onActivityFinish_KillWorldBoss, { "Th��ng k�ch s�t boss ho�ng kim" }, },
    { "event_mission_box_award", { "worldboss", "small", -1 }, _ksg_onActivityFinish_OpenSmallBox_WorldBoss, { "Th��ng m� r��ng nh� boss HK" }, },
    { "event_mission_box_award", { "worldboss", "gold", -1 }, _ksg_onActivityFinish_OpenGoldBox_WorldBoss, { "Th��ng m� r��ng v�ng boss HK" }, },
}

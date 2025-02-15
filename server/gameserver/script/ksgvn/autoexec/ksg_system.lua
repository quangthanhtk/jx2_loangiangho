Import("\\script\\ksgvn\\lib.lua")
Import("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Include("\\script\\ksgvn\\autoexec\\ksg_system_head.lua")
Include("\\script\\ksgvn\\autoexec\\ksg_system_listener.lua")

Import('\\script\\ksgvn\\event\\monthly\\monthly.lua')

t_isolate_base_cfg = { --这是一个必填配置项
    nPriority = 1,
    szEngName = "ksg_system",
    szViewName = "V� L﹎ 2",
    nTalkBeginDate = 0,
    nBeginDate = 0,
    nEndDate = 0,
}

t_isolate_task_list = { --模块用到的任务变量配置id={szTaskName,nTaskGroupIdx},

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

    isolate_watch_event("event_ib_cost", "_ksg_ib_cost", PackItemId(2, 97, 236))--天骄令消费计数

    -- Monthly event
    isolate_watch_item_talk(MONTHLY_EVENT_AWARD1[1], MONTHLY_EVENT_AWARD1[2], MONTHLY_EVENT_AWARD1[3], "monthlyEvent_OnUseItem")
    isolate_watch_item_talk(MONTHLY_EVENT_AWARD2[1], MONTHLY_EVENT_AWARD2[2], MONTHLY_EVENT_AWARD2[3], "monthlyEvent_OnUseItem")
    isolate_watch_item_talk(MONTHLY_EVENT_AWARD3[1], MONTHLY_EVENT_AWARD3[2], MONTHLY_EVENT_AWARD3[3], "monthlyEvent_OnUseItem")
end

function on_event_player_login(nExchangeComing)
    if KsgLib:IsInDualTopTime() then
        KsgPlayer:Msg("Ho箃 ng 畊a TOP 產ng di詎 ra. Th玭g tin chi ti誸 ho箃 ng ng o c� th� xem t筰 trang ch�.")
    end
    if KsgLib:IsTestServer() then
        KsgPlayer:Msg("C秏 琻 b筺  tham gia m竬 ch� th� nghi謒! N誹 trong qu� tr譶h h祅h t萿 g苝 v蕁  kh骳 m綾, h穣 li猲 h� ngay FanPage  頲 h� tr�!")
    end
    --KsgPlayer:Msg(format("S� ki謓 %s 產ng di詎 ra r蕋 n竜 nhi謙, h穣 mau n t譵 Li猲 Chi t筰 Bi謓 Kinh  tham gia.", g_monthlyEvent_Name))
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

t_isolate_user_batch_watch_list = {--{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), {task_name, s� t骾 qu� v� l﹎, thng l謓h jx2, hu﹏ chng jx2, s� 甶觤 phong hoa}}
    { "event_player_daily_online_minute", { 60 }, _ksg_onActivityFinish_Online60Min, { "Online 60 ph髏" }, },
    { "event_player_daily_online_minute", { 180 }, _ksg_onActivityFinish_Online180Min, { "Online 180 ph髏" }, },
    
    { "event_mission_stage_finish", { "liangshan", -1 }, _ksg_onActivityFinish_LSB, { "Ho祅 th祅h 秈 Lng S琻 B筩" }, },
    { "event_mission_stage_finish", { "wanjianzhong", -1 }, _ksg_onActivityFinish_VKT, { "Ho祅 th祅h 秈 V筺 Ki誱 Tr騨g" }, },
    { "event_mission_stage_finish", { "dixuangong", -1 }, _ksg_onActivityFinish_DHC, { "Ho祅 th祅h 秈 мa Huy襫 Cung" }, },

    { "event_mission_stage_finish", { "jiandangyanyun", -1 }, _ksg_onActivityFinish_KDYV, { "Ho祅 th祅h 秈 Ki誱 Хng Y課 V﹏" }, },
    { "event_mission_stage_finish", { "jiandangyanyunhero", -1 }, _ksg_onActivityFinish_KDYV, { "Ho祅 th祅h 秈 Ki誱 Хng Y課 V﹏ Anh H飊g" }, },
    
    
    { "event_mission_stage_finish", { "taiyi", -1 }, _ksg_onActivityFinish_TNT, { "Ho祅 th祅h 秈 Th竔 Nh蕋 Th竝" }, },
    { "event_mission_stage_finish", { "taiyihero", -1 }, _ksg_onActivityFinish_TNT, { "Ho祅 th祅h 秈 Th竔 Nh蕋 Th竝 - Anh h飊g" }, },
    
    { "event_mission_stage_finish", { "new_taixu", -1 }, _ksg_onActivityFinish_TH, { "Ho祅 th祅h 秈 Th竔 H�" }, },
    { "event_mission_stage_finish", { "cangjian", -1 }, _ksg_onActivityFinish_TK, { "Qua 秈 t祅g ki誱" }, },
    { "event_mission_stage_finish", { "tuquangcac", -1, }, _ksg_onActivityFinish_TQC, { "Qua 秈 T� Quang C竎" }, },
    { "event_mission_stage_finish", { "tuquangcac", 5, }, _ksg_onActivityFinish_TQC5, { "Qua 秈 5 T� Quang C竎" }, },
    { "event_mission_stage_finish", { "tuquangcac", 6, }, _ksg_onActivityFinish_TQC6, { "Qua 秈 6 T� Quang C竎" }, },

    { "event_mission_award", { "newbattle", -1, -1, -1 }, _ksg_onActivityFinish_NewBattle, { "Nh薾 thng chi課 trng" }, },
    { "event_mission_award", { "tianmenzhen", -1, -1, -1 }, _ksg_onActivityFinish_TMT, { "Nh薾 thng Thi猲 M玭 Tr薾" }, },

    { "event_mission_award", { "kfbattle", -1, -1, -1 }, _ksg_onActivityFinish_TMTLSV, { "L穘h thng 1 l莕 Thi猲 M玭 Tr薾 LSV" }, },
    { "event_mission_award", { "hieplo", -1, -1, -1 }, _ksg_onActivityFinish_HiepLo, { "Nh薾 thng Hi謕 L� LSV" }, },
    { "event_mission_award", { "phaodaichien", -1, -1, -1 }, _ksg_onActivityFinish_PDLSV, { "Nh薾 thng Ph竜 i chi課 LSV" }, },

    { "event_mission_task_award", { "pvp", "yunbiao", -1 }, _ksg_onActivityFinish_VanTieu, { "Ho祅 th祅h 1 l莕 v薾 ti猽" }, },
    { "event_mission_task_award", { "pvp", "duobiao", -1 }, _ksg_onActivityFinish_CuopTieu, { "Ho祅 th祅h 1 l莕 cp ti猽" }, },

    { "event_mission_task_award", { "planttree", "plantseedtree", -1 }, _ksg_onActivityFinish_TuiHG, { "Tr錸g th祅h c玭g c﹜ t骾 h箃 gi鑞g" }, },
    { "event_mission_task_award", { "planttree", "bigtreeprize", -1 }, _ksg_onActivityFinish_BNL, { "Thu ho筩h b竧 nh� l韓" }, },
    { "event_mission_task_award", { "planttree", "smalltreeprize", -1 }, _ksg_onActivityFinish_BNN, { "Thu ho筩h c﹜ b竧 nh� nh�" }, },
    { "event_mission_task_award", { "planttree", "plant4lingtree", -1 }, _ksg_onActivityFinish_CayTuLinh, { "Tr錸g th祅h c玭g c﹜ t� linh" }, },
    --{ "event_mission_task_award", { "planttree", "plantbigtree", -1 }, _ksg_onActivityFinish_BNL, { "Tr錸g th祅h c玭g c﹜ b竧 nh� l韓" }, },

    -- KSG events
    { "event_mission_task_award", { "ksgsystem", "thuonghoi", -1 }, _ksg_onActivityFinish_ThuongHoi, { "Ho祅 th祅h thng h閕" }, },
    --{ "event_mission_task_award", { "ksgsystem", "nvsumon", -1 }, _ksg_onActivityFinish_NhiemVuSuMon, { "Ho祅 th祅h s� m玭" }, },
    { "event_mission_task_award", { "ksgsystem", "nvsumon_new", -1 }, _ksg_onActivityFinish_NhiemVuSuMon_New, { "Ho祅 th祅h s� m玭 m韎" }, },
    { "event_mission_task_award", { "ksgsystem", "newresourcebattle", -1, }, _ksg_onActivityFinish_NewResBattle, { "Nh薾 thng nhi謒 v� T礽 Nguy猲 Chi課" }, },
    { "event_mission_task_award", { "ksgsystem", "luckystar", 16, }, _ksg_onActivityFinish_LuckyStar, { "D飊g 16 sao may m緉" }, },
    { "event_mission_task_award", { "ksgsystem", "luckystar", 32, }, _ksg_onActivityFinish_LuckyStar, { "D飊g 32 sao may m緉" }, },
    { "event_mission_task_award", { "ksgsystem", "nuoabaohap", 100, }, _ksg_onActivityFinish_NuOa, { "D飊g 100 n� oa b秓 h筽" }, },
    { "event_mission_task_award", { "ksgsystem", "nuoabaohap", 200, }, _ksg_onActivityFinish_NuOa, { "D飊g 200 n� oa b秓 h筽" }, },
    { "event_mission_affairs", { "worldboss", "killboss", -1 }, _ksg_onActivityFinish_KillWorldBoss, { "Thng k輈h s竧 boss ho祅g kim" }, },
    { "event_mission_box_award", { "worldboss", "small", -1 }, _ksg_onActivityFinish_OpenSmallBox_WorldBoss, { "Thng m� rng nh� boss HK" }, },
    { "event_mission_box_award", { "worldboss", "gold", -1 }, _ksg_onActivityFinish_OpenGoldBox_WorldBoss, { "Thng m� rng v祅g boss HK" }, },
}

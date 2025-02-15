--这是模块化的一个标准主文件，各模块只需要实现对应的标准事件处理函数，不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调，以免空回调影响效率
Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\isolate\\online_activites\\monthly_goals\\mg_head.lua")

t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= g_mgOpen,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "MothlyGoals",
    szViewName 			= "Hi謕 Kh竎h H祅h",
    nTalkBeginDate      = 0,
    nBeginDate  		= 0,
    nEndDate 			= 0,
}
 
t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskId, nAcessCode = 0},
   -- {id={"tsk_free_search", TASKID, 0}, clear = "daily" },    
}

function mg_FinishBitCondition(tEvent, data, para)
  mg_DebugPrint("tEvent = ", tEvent)  
  if mg_CheckDate() ~= 1 then return end

  mg_DebugPrint(format("\n===== mg_FinishBitCondition() nConditonID=%d =====",
      tEvent[4][1]) )
  ActSetBitCdtFinish(tEvent[4][1])
end

function mg_ModifyTask(tEvent, data, para)
  mg_DebugPrint("tEvent = ", tEvent)
  mg_DebugPrint("data = ", data)
  if mg_CheckDate() ~= 1 then return end
 
  mg_DebugPrint(format("\n===== mg_ModifyTask() TaskID=%d nChange=%d =====",
      tEvent[4][1], tEvent[4][2] or data[4] or 1) )
  gf_ModifyTask(tEvent[4][1], tEvent[4][2] or data[4] or 1)
end

function mg_OnKillBoss(tEvent, data, para)
  mg_DebugPrint("tEvent = ", tEvent)
  mg_DebugPrint("data = ", data)
  if mg_CheckDate() ~= 1 then return end

  local nActBitCdtId = g_mgBossName2CdtID[GetNpcName(tonumber(data[3]))]
  mg_DebugPrint(format("\n===== mg_OnKillBoss() szBossName=%s nConditonID=%d =====",
      GetNpcName(tonumber(data[3])), nActBitCdtId or -1) )
  if not nActBitCdtId then 
    return
  end
  ActSetBitCdtFinish(nActBitCdtId)
end

g_mgBossName2CdtID = {
    --
    ["C藀 Th阨 V� T鑞g Giang"] = 243, 
    ["Tri  Tinh Ng� D鬾g"] = 244, 
    ["C鰑 V╪ Long S� Ti課"] = 245, 
    ["Ti觰 Tuy襫 Phong S礽 Ti課"] = 246, 
    ["Чi o Quan Th緉g"] = 247, 
    ["Nh藀 V﹏ Long C玭g T玭 Th緉g"] = 248, 
    ["B竜 T� u L﹎ Xung"] = 249, 
    ["Hoa H遖 Thng L� Tr� Th﹎"] = 250, 
    ["H綾 To祅 Phong L� Qu�"] = 251, 
    ["H祅h Gi� V� T遪g"] = 252, 
    ["B謓h Quan S竎 Dng H飊g"] = 253, 
    ["Phanh M謓h Tam Lang Th筩h T�"] = 254, 
    ["Nh蕋 Trng Thanh H� Tam Nng"] = 255, 
    ["Song Thng Tng фng B譶h"] = 256, 
    ["Thanh Di謓 Th� Dng Tr�"] = 257, 
    ["T輈h L辌h H醓 T莕 Minh"] = 258, 
    ["T髖 B竛 Ti猲 Phong Nh蕋 Ph祄"] = 259, 
    ["Song Ti猲 H� Di猲 Chc"] = 260, 
    --
    ["Thi猲  S竧 Th� Tinh Anh"] = 262,
    ["Thi猲  Чi Tinh Anh"] = 263,
    ["Thi猲  T輓 S� Tinh Anh"] = 264,
    ["Thi猲  M藅 Th竚 Tinh Anh"] = 265,
    ["B筩h K� Tinh Anh"] = 266,
    ["H錸g K� Ch� H錸g Tinh"] = 267,
    ["H綾 K� Ch� � Mai V�"] = 268,
    ["Lam K� Ch� Lam 萵 H筩"] = 269,
    ["Ho祅g K� Ch� Ho祅g Si猽"] = 270,
    ["B筩h K� Ch� B筩h L╪g Ti猽"] = 271,
    ["L玦 Л阯g Ch� Phng Ch﹗"] = 272,
    ["H醓 Л阯g Ch� Ti襫 Ch輈h"] = 273,
    ["Phong Л阯g Ch� Phong Tr莕"] = 274,
    ["Uy觧 Nhu V﹏"] = 275,
    ["Uy觧 Thanh Nhi"] = 276,
    --
    ["Nh薽 Ng� H祅h"] = 304,
    ["Thng Th莕 Doanh Thi猲"] = 305,
    ["B綾 L鬰 L﹎ Minh Ch�"] = 306,
    ["L穘h Hng L╪g"] = 307,
    ["Уo Hoa Фo Ch� Ho祅g Long"] = 308,
    ["T﹜ V鵦 Thng Lang B� Vng"] = 309,
    ["Ng鋍 S琻 Chi Linh Thi猲 C鰑"] = 310,
    ["U Tr筩h Chi 秐h Minh V�"] = 311,
    --
    ["B� Phi Y猲"] = 312,
    ["H� C秐h Th緉g"] = 313,
    ["Nhi誴 Чi Ch飝"] = 314,
    ["C玭 L玭 N�"] = 315,
    ["B飅 H祅g"] = 316,
    ["Li評 Ngh�"] = 317,
    ["H錸g Tuy課"] = 318,
}

t_isolate_user_batch_watch_list = {
    {"event_mission_stage_finish", {"liangshan", 3}, mg_FinishBitCondition, {494, "Vt ph� b秐 Lng S琻-秈 3"},  },
    -- {"event_mission_task_award",   {"liangshan", "1chuyan",    -1}, mg_FinishBitCondition, {222, "完成梁山[初演挑战]任务"},  },
    -- {"event_mission_task_award",   {"liangshan", "2zhongyong", -1}, mg_FinishBitCondition, {223, "完成梁山[忠勇挑战]任务"},  },
    {"event_mission_task_award",   {"liangshan", "3duojun",    -1},    mg_FinishBitCondition, {242,"Ho祅 th祅h nhi謒 v� [Khi猽 Chi課 Lng S琻 箃 Qu﹏]"},  },
    {TeamEvent("event_mission_affairs"), {"liangshan", "killboss",-1}, mg_OnKillBoss, {"Di謙 BOSS Lng S琻"} },

   
    {"event_mission_stage_finish", {"dixuangong", 3},        mg_FinishBitCondition, {224, "Vt ph� b秐 мa Huy襫 Cung-秈 3"},  },
    -- {"event_mission_affairs",      {"dixuangong", "flop",1}, mg_ModifyTask, {TASKID_DC_MG_DXG_FLOP_FREE_NUM,1,"地玄宫免费翻牌%d/3次"},  },
    -- {"event_mission_affairs",      {"dixuangong", "flop",2}, mg_FinishBitCondition, {226, "地玄宫付费翻牌"},  },
    {TeamEvent("event_mission_affairs"), {"dixuangong", "killboss",-1}, mg_OnKillBoss, {"Di謙 BOSS мa Huy襫 Cung"} },

    {"event_mission_stage_finish", {"wanjianzhong", 3}, mg_FinishBitCondition, {495, "Vt ph� b秐 V筺 Ki誱 Tr騨g-秈 3"},  },
    --{"event_mission_task_award",   {"wanjianzhong", "1daily_pass",  -1}, mg_FinishBitCondition, {227,"完成万剑冢每日任务"},  },
    {"event_mission_task_award",   {"wanjianzhong", "3weekly_pass", -1}, mg_ModifyTask, {TASKID_MC_MG_FINISH_WJZ_WEEK_TASK_NUM,1,"Ho祅 th祅h nhi謒 v� tu莕 V筺 Ki誱 Tr騨g"},  },

    -- {"event_mission_stage_finish", {"jiandangyanyun",     5},    mg_FinishBitCondition, {228,"通关剑荡燕云副本"} },
    -- {"event_mission_stage_finish", {"jiandangyanyunhero", 5},    mg_FinishBitCondition, {228,"通关剑荡燕云副本"} },
    {"event_mission_affairs",      {"jiandangyanyun", "flop",2}, mg_FinishBitCondition, {229,"Ki誱 Хng Y課 V﹏-L藅 B礽 Tr� Ph�"} },
    {"event_mission_affairs",      {"jiandangyanyun", "flop",2}, mg_ModifyTask, {TASKID_MC_MG_JDYY_FLOP_PAY_NUM,1,"Ki誱 Хng Y課 V﹏-L藅 B礽 Tr� Ph� %d/30 l莕"} },

    {"event_mission_stage_finish", {"new_taixu", 25}, mg_FinishBitCondition, {230,"Vt 秈 Th竔 H� 25"},  },

    {"event_mission_stage_finish", {"taiyi",     6}, mg_ModifyTask, {TASKID_MC_MG_FINISH_TYT_MISSION_NUM,1,"Vt Th竔 Nh蕋 Th竝 %d/30 l莕 (Thng/Anh h飊g)"} },
    {"event_mission_stage_finish", {"taiyihero", 6}, mg_ModifyTask, {TASKID_MC_MG_FINISH_TYT_MISSION_NUM,1,"Vt Th竔 Nh蕋 Th竝 %d/30 l莕 (Thng/Anh h飊g)"} },
    
    {"event_mission_task_award",   {"planttree", "plant4lingtree", -1}, mg_FinishBitCondition, {231,"Tr錸g 1 C﹜ T� Linh"},  },
    {"event_mission_task_award",   {"planttree", "smalltreeprize", -1}, mg_FinishBitCondition, {232,"Tr錸g 1 C﹜ B竧 Nh�-Nh�"},  },
    {"event_mission_task_award",   {"planttree", "plantseedtree",  -1}, mg_FinishBitCondition, {492,"Tr錸g 1 C﹜ H箃 Gi鑞g"},  },
    {"event_mission_task_award",   {"planttree", "bigtreeprize",   -1}, mg_ModifyTask, {TASKID_MC_MG_BIG_BORE_TREE_AWARD_TIME,1,"Tr錸g v� thu ho筩h %d/4 C﹜ B竧 Nh� L韓"},  },
    {"event_mission_task_award",   {"pvp",       "yunbiao",        -1}, mg_FinishBitCondition, {233,"Ho祅 th祅h 1 l莕 V薾 Ti猽"},  },
    {"event_mission_task_award",   {"pvp",       "duobiao",        -1}, mg_FinishBitCondition, {493,"Ho祅 th祅h 1 l莕 箃 Ti猽"},  },

    {"event_mission_award",   {"newbattle",-1,-1,4},    mg_FinishBitCondition, {234,"Ho祅 th祅h 1 l莕 Chi課 Trng Nh筺 M玭 Quan (Nh薾 thng)"},  },
    {"event_mission_award",   {"kfbattle",-1,-1,-1},    mg_FinishBitCondition, {235,"Ho祅 th祅h 1 l莕 Thi猲 M玭 Tr薾 Li猲 Server (Nh薾 thng)"},  },
    {"event_mission_award",   {"ziyuanzhan",-1,-1,-1},  mg_FinishBitCondition, {496,"Nh薾 thng T鑞g Li猽 T礽 Nguy猲 Chi課 (Ng祔)"},  },
    {"event_mission_award",   {"ziyuanzhan",-1,-1,-1},  mg_ModifyTask, {TASKID_MC_MG_SOURCE_BATTLE_AWARDCOUNT,1,"Nh薾 thng chi課 trng T礽 Nguy猲 Chi課 %d/40 l莕"},  },

    {"event_task_award",      {"tong_daily_task", -1},     mg_ModifyTask, {TASKID_DC_MG_FINISH_TONG_TASK_NUM,1,"Ho祅 th祅h nhi謒 v� ng祔 bang h閕 %d/10 l莕"},  },
    {"event_task_award",      {"tong_daily_task", -1},     mg_ModifyTask, {TASKID_MC_MG_FINISH_TONG_TASK_NUM,1,"Ho祅 th祅h nhi謒 v� ng祔 bang h閕 %d/100 l莕"},  },
    {"event_equip_operation", {"upgradebookapp",-1,-1,-1}, mg_FinishBitCondition, {241,"Ti課 C蕄 Ch﹏ V� M藅 T辌h 1 l莕"},  },

    {"event_gain_item", {PackItemId(2,1,31239)}, mg_ModifyTask, {TASKID_MC_MG_MAKE_SOUL_MEDICINE_NUM,1,"Luy謓 Linh Ph竎h Кn %d/1"},  },
    {"event_cost_item", {PackItemId(2,1,30297)}, mg_ModifyTask, {TASKID_DC_MG_FIRECRAKER_USE_NUM,nil,"S� d鬾g %d/50 Ph竜 Chi課 Th緉g"},  },
    {"event_cost_item", {PackItemId(2,1,30154)}, mg_ModifyTask, {TASKID_MC_MG_NVWA_BOX_USECOUNT,nil,"D飊g %d/100 N� Oa B秓 H筽"},  },
    {"event_cost_item", {PackItemId(2,1,30191)}, mg_ModifyTask, {TASKID_MC_MG_LUCKYSTAR_USECOUNT,nil,"D飊g %d/16 Ng玦 Sao May M緉"},  },
    -- {"event_cost_item", {PackItemId(2,1,31170)}, mg_ModifyTask, {TASKID_MC_MG_USE_AMAZIONG_COIN_NUM,nil,"使用%d/20个神奇金币"},  },

    -- {"event_mission_affairs", {"one_road_battle", "honor", "10kill_in_10s"},  mg_FinishBitCondition, {291, "十步杀一人"},  },
    -- {"event_mission_affairs", {"one_road_battle", "honor", "freeze_thief"},   mg_FinishBitCondition, {292, "站住，小偷！"},  },
    -- {"event_mission_affairs", {"one_road_battle", "honor", "striker_master"}, mg_FinishBitCondition, {293, "剿匪名将"},  },
    -- {"event_mission_affairs", {"one_road_battle", "honor", "tower_breaker_master"}, mg_FinishBitCondition, {294, "毁塔高手"},  },

    --{"event_equip_operation", {"yunling",-1,-1,-1}, mg_FinishBitCondition, {295,"通过蕴灵道具或千变盒进行一次蕴灵"},  },
    --{"event_ib_cost",     {PackItemId(2,1,30642)},  mg_ModifyTask, {TASKID_MC_MG_USE_RYJGZ_NUM,nil,"使用%d/15个荣耀军功章"},  },
    {"event_task_award", {"jubaozhai",-1}, mg_ModifyTask, {TASKID_MC_MG_STONE_LOTTERY_NUM,1,"R髏 thng Huy襫 Th筩h T� B秓 Trai %d/50 l莕"},  },

    --{"event_task_award",  {"daily_reg_accum",28},    mg_FinishBitCondition, {299,"获得豪华签到礼包"},  },
    --{"event_mission_stage_finish", {"tong_activity", 3}, mg_FinishBitCondition, {300,"完成一次惊世窃贼"}  },

    {"event_equip_operation", {"quench_lp", 1,-1,-1}, mg_FinishBitCondition, {301,"T╪g c蕄 Thng H秈 Ch﹗ th祅h c玭g 1 l莕"}  },
    {"event_equip_operation", {"quench_lp",-1,-1,20}, mg_ModifyTask, {TASKID_MC_MG_QUENCH_LP_LV20_NUM,1,"T玦 luy謓 %d/10 Thng H秈 Ch﹗ n Lv20"}  },

    {TeamEvent("event_mission_affairs"), {"worldboss", "killboss",-1}, mg_OnKillBoss, {"Di謙 BOSS Th� Gi韎"} },
    {TeamEvent("event_mission_affairs"), {"tongboss",  "killboss",-1}, mg_OnKillBoss, {"Di謙 BOSS Bang"} },
    {TeamEvent("event_kill_npc"), {"Tr莕 L鏸",-1},          mg_FinishBitCondition, {319, "Di謙 BOSS Ma V鵦 [Tr莕 L鏸]"} },
    {TeamEvent("event_kill_npc"), {"Thi猲  Gi竜 Ma V鵦 S�",-1}, mg_FinishBitCondition, {320, "Di謙 BOSS Ma V鵦 [Thi猲  Gi竜-Ma V鵦 Chuy猲 S鴀"} },
    {TeamEvent("event_kill_npc"), {"Thi猲  Gi竜 у tr鋘g thng",-1}, mg_FinishBitCondition, {321, "Di謙 BOSS Ma V鵦 [Thi猲  Gi竜 у Tr鋘g Thng]"} },
}

-- function on_add_watches() end
-- function on_event_server_start() end
-- function on_event_player_login(nExchangeComing) end

--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
-- function on_first_login_clear(nLastLoginDate)--isolate上线后第一次登录时的清理
-- 	t_Fix_201606:fix_up(nLastLoginDate)
-- end 




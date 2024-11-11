--ÕâÊÇÄ£¿é»¯µÄÒ»¸ö±ê×¼Ö÷ÎÄ¼þ£¬¸÷Ä£¿éÖ»ÐèÒªÊµÏÖ¶ÔÓ¦µÄ±ê×¼ÊÂ¼þ´¦Àíº¯Êý£¬²»ÐèÒª¹ØÐÄÕâÐ©º¯ÊýÊ²Ã´Ê±ºò±»µ÷ÓÃ
--Ä£¿é¸úÄ£¿éÖ®¼ä²»ÄÜÓÐIncludeºÍµ÷ÓÃ¹ØÏµ
--ËùÒÔÃ¿¸öÄ£¿éÊÇ¶ÀÁ¢µÄ
--²»ÐèÒªµÄhandlerÇë×¢ÊÍµ÷£¬ÒÔÃâ¿Õ»Øµ÷Ó°ÏìÐ§ÂÊ
Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\isolate\\online_activites\\monthly_goals\\mg_head.lua")

t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= g_mgOpen,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ð§ >0:Ä£¿éÓÐÐ§£¬ÊýÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "MothlyGoals",
    szViewName 			= "HiÖp Kh¸ch Hµnh",
    nTalkBeginDate      = 0,
    nBeginDate  		= 0,
    nEndDate 			= 0,
}
 
t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskId, nAcessCode = 0},
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
    ["CËp Thêi Vò Tèng Giang"] = 243, 
    ["Tri §a Tinh Ng« Dông"] = 244, 
    ["Cöu V¨n Long Sö TiÕn"] = 245, 
    ["TiÓu TuyÒn Phong Sµi TiÕn"] = 246, 
    ["§¹i §ao Quan Th¾ng"] = 247, 
    ["NhËp V©n Long C«ng T«n Th¾ng"] = 248, 
    ["B¸o Tö §Çu L©m Xung"] = 249, 
    ["Hoa Hßa Th­îng Lç TrÝ Th©m"] = 250, 
    ["H¾c Toµn Phong Lý Quú"] = 251, 
    ["Hµnh Gi¶ Vâ Tßng"] = 252, 
    ["BÖnh Quan S¸c D­¬ng Hïng"] = 253, 
    ["Phanh MÖnh Tam Lang Th¹ch Tó"] = 254, 
    ["NhÊt Tr­îng Thanh Hæ Tam N­¬ng"] = 255, 
    ["Song Th­¬ng T­íng §æng B×nh"] = 256, 
    ["Thanh DiÖn Thó D­¬ng TrÝ"] = 257, 
    ["TÝch LÞch Háa TÇn Minh"] = 258, 
    ["Tóy B¸n Tiªn Phong NhÊt Phµm"] = 259, 
    ["Song Tiªn H« Diªn Ch­íc"] = 260, 
    --
    ["Thiªn ¢m S¸t Thñ Tinh Anh"] = 262,
    ["Thiªn ¢m §¹i Tinh Anh"] = 263,
    ["Thiªn ¢m TÝn Sø Tinh Anh"] = 264,
    ["Thiªn ¢m MËt Th¸m Tinh Anh"] = 265,
    ["B¹ch Kú Tinh Anh"] = 266,
    ["Hång Kú Chñ Hång Tinh"] = 267,
    ["H¾c Kú Chñ ¤ Mai Vò"] = 268,
    ["Lam Kú Chñ Lam Èn H¹c"] = 269,
    ["Hoµng Kú Chñ Hoµng Siªu"] = 270,
    ["B¹ch Kú Chñ B¹ch L¨ng Tiªu"] = 271,
    ["L«i §­êng Chñ Ph­¬ng Ch©u"] = 272,
    ["Háa §­êng Chñ TiÒn ChÝch"] = 273,
    ["Phong §­êng Chñ Phong TrÇn"] = 274,
    ["UyÓn Nhu V©n"] = 275,
    ["UyÓn Thanh Nhi"] = 276,
    --
    ["NhËm Ng· Hµnh"] = 304,
    ["Th­¬ng ThÇn Doanh Thiªn"] = 305,
    ["B¾c Lôc L©m Minh Chñ"] = 306,
    ["L·nh H­¬ng L¨ng"] = 307,
    ["§µo Hoa §¶o Chñ Hoµng Long"] = 308,
    ["T©y Vùc Th­¬ng Lang B¸ V­¬ng"] = 309,
    ["Ngäc S¬n Chi Linh Thiªn Cöu"] = 310,
    ["U Tr¹ch Chi ¶nh Minh Vâ"] = 311,
    --
    ["Bé Phi Yªn"] = 312,
    ["H¹ C¶nh Th¾ng"] = 313,
    ["NhiÕp §¹i Chïy"] = 314,
    ["C«n L«n N«"] = 315,
    ["Bïi Hµng"] = 316,
    ["LiÔu NghÞ"] = 317,
    ["Hång TuyÕn"] = 318,
}

t_isolate_user_batch_watch_list = {
    {"event_mission_stage_finish", {"liangshan", 3}, mg_FinishBitCondition, {494, "V­ît phã b¶n L­¬ng S¬n-¶i 3"},  },
    -- {"event_mission_task_award",   {"liangshan", "1chuyan",    -1}, mg_FinishBitCondition, {222, "Íê³ÉÁºÉ½[³õÑÝÌôÕ½]ÈÎÎñ"},  },
    -- {"event_mission_task_award",   {"liangshan", "2zhongyong", -1}, mg_FinishBitCondition, {223, "Íê³ÉÁºÉ½[ÖÒÓÂÌôÕ½]ÈÎÎñ"},  },
    {"event_mission_task_award",   {"liangshan", "3duojun",    -1},    mg_FinishBitCondition, {242,"Hoµn thµnh nhiÖm vô [Khiªu ChiÕn L­¬ng S¬n §o¹t Qu©n]"},  },
    {TeamEvent("event_mission_affairs"), {"liangshan", "killboss",-1}, mg_OnKillBoss, {"DiÖt BOSS L­¬ng S¬n"} },

   
    {"event_mission_stage_finish", {"dixuangong", 3},        mg_FinishBitCondition, {224, "V­ît phã b¶n §Þa HuyÒn Cung-¶i 3"},  },
    -- {"event_mission_affairs",      {"dixuangong", "flop",1}, mg_ModifyTask, {TASKID_DC_MG_DXG_FLOP_FREE_NUM,1,"µØÐþ¹¬Ãâ·Ñ·­ÅÆ%d/3´Î"},  },
    -- {"event_mission_affairs",      {"dixuangong", "flop",2}, mg_FinishBitCondition, {226, "µØÐþ¹¬¸¶·Ñ·­ÅÆ"},  },
    {TeamEvent("event_mission_affairs"), {"dixuangong", "killboss",-1}, mg_OnKillBoss, {"DiÖt BOSS §Þa HuyÒn Cung"} },

    {"event_mission_stage_finish", {"wanjianzhong", 3}, mg_FinishBitCondition, {495, "V­ît phã b¶n V¹n KiÕm Tròng-¶i 3"},  },
    --{"event_mission_task_award",   {"wanjianzhong", "1daily_pass",  -1}, mg_FinishBitCondition, {227,"Íê³ÉÍò½£Ú£Ã¿ÈÕÈÎÎñ"},  },
    {"event_mission_task_award",   {"wanjianzhong", "3weekly_pass", -1}, mg_ModifyTask, {TASKID_MC_MG_FINISH_WJZ_WEEK_TASK_NUM,1,"Hoµn thµnh nhiÖm vô tuÇn V¹n KiÕm Tròng"},  },

    -- {"event_mission_stage_finish", {"jiandangyanyun",     5},    mg_FinishBitCondition, {228,"Í¨¹Ø½£µ´ÑàÔÆ¸±±¾"} },
    -- {"event_mission_stage_finish", {"jiandangyanyunhero", 5},    mg_FinishBitCondition, {228,"Í¨¹Ø½£µ´ÑàÔÆ¸±±¾"} },
    {"event_mission_affairs",      {"jiandangyanyun", "flop",2}, mg_FinishBitCondition, {229,"KiÕm §·ng YÕn V©n-LËt Bµi Tr¶ PhÝ"} },
    {"event_mission_affairs",      {"jiandangyanyun", "flop",2}, mg_ModifyTask, {TASKID_MC_MG_JDYY_FLOP_PAY_NUM,1,"KiÕm §·ng YÕn V©n-LËt Bµi Tr¶ PhÝ %d/30 lÇn"} },

    {"event_mission_stage_finish", {"new_taixu", 25}, mg_FinishBitCondition, {230,"V­ît ¶i Th¸i H­ 25"},  },

    {"event_mission_stage_finish", {"taiyi",     6}, mg_ModifyTask, {TASKID_MC_MG_FINISH_TYT_MISSION_NUM,1,"V­ît Th¸i NhÊt Th¸p %d/30 lÇn (Th­êng/Anh hïng)"} },
    {"event_mission_stage_finish", {"taiyihero", 6}, mg_ModifyTask, {TASKID_MC_MG_FINISH_TYT_MISSION_NUM,1,"V­ît Th¸i NhÊt Th¸p %d/30 lÇn (Th­êng/Anh hïng)"} },
    
    {"event_mission_task_award",   {"planttree", "plant4lingtree", -1}, mg_FinishBitCondition, {231,"Trång 1 C©y Tø Linh"},  },
    {"event_mission_task_award",   {"planttree", "smalltreeprize", -1}, mg_FinishBitCondition, {232,"Trång 1 C©y B¸t Nh·-Nhá"},  },
    {"event_mission_task_award",   {"planttree", "plantseedtree",  -1}, mg_FinishBitCondition, {492,"Trång 1 C©y H¹t Gièng"},  },
    {"event_mission_task_award",   {"planttree", "bigtreeprize",   -1}, mg_ModifyTask, {TASKID_MC_MG_BIG_BORE_TREE_AWARD_TIME,1,"Trång vµ thu ho¹ch %d/4 C©y B¸t Nh· Lín"},  },
    {"event_mission_task_award",   {"pvp",       "yunbiao",        -1}, mg_FinishBitCondition, {233,"Hoµn thµnh 1 lÇn VËn Tiªu"},  },
    {"event_mission_task_award",   {"pvp",       "duobiao",        -1}, mg_FinishBitCondition, {493,"Hoµn thµnh 1 lÇn §o¹t Tiªu"},  },

    {"event_mission_award",   {"newbattle",-1,-1,4},    mg_FinishBitCondition, {234,"Hoµn thµnh 1 lÇn ChiÕn Tr­êng Nh¹n M«n Quan (NhËn th­ëng)"},  },
    {"event_mission_award",   {"kfbattle",-1,-1,-1},    mg_FinishBitCondition, {235,"Hoµn thµnh 1 lÇn Thiªn M«n TrËn Liªn Server (NhËn th­ëng)"},  },
    {"event_mission_award",   {"ziyuanzhan",-1,-1,-1},  mg_FinishBitCondition, {496,"NhËn th­ëng Tèng Liªu Tµi Nguyªn ChiÕn (Ngµy)"},  },
    {"event_mission_award",   {"ziyuanzhan",-1,-1,-1},  mg_ModifyTask, {TASKID_MC_MG_SOURCE_BATTLE_AWARDCOUNT,1,"NhËn th­ëng chiÕn tr­êng Tµi Nguyªn ChiÕn %d/40 lÇn"},  },

    {"event_task_award",      {"tong_daily_task", -1},     mg_ModifyTask, {TASKID_DC_MG_FINISH_TONG_TASK_NUM,1,"Hoµn thµnh nhiÖm vô ngµy bang héi %d/10 lÇn"},  },
    {"event_task_award",      {"tong_daily_task", -1},     mg_ModifyTask, {TASKID_MC_MG_FINISH_TONG_TASK_NUM,1,"Hoµn thµnh nhiÖm vô ngµy bang héi %d/100 lÇn"},  },
    {"event_equip_operation", {"upgradebookapp",-1,-1,-1}, mg_FinishBitCondition, {241,"TiÕn CÊp Ch©n Vâ MËt TÞch 1 lÇn"},  },

    {"event_gain_item", {PackItemId(2,1,31239)}, mg_ModifyTask, {TASKID_MC_MG_MAKE_SOUL_MEDICINE_NUM,1,"LuyÖn Linh Ph¸ch §¬n %d/1"},  },
    {"event_cost_item", {PackItemId(2,1,30297)}, mg_ModifyTask, {TASKID_DC_MG_FIRECRAKER_USE_NUM,nil,"Sö dông %d/50 Ph¸o ChiÕn Th¾ng"},  },
    {"event_cost_item", {PackItemId(2,1,30154)}, mg_ModifyTask, {TASKID_MC_MG_NVWA_BOX_USECOUNT,nil,"Dïng %d/100 N÷ Oa B¶o H¹p"},  },
    {"event_cost_item", {PackItemId(2,1,30191)}, mg_ModifyTask, {TASKID_MC_MG_LUCKYSTAR_USECOUNT,nil,"Dïng %d/16 Ng«i Sao May M¾n"},  },
    -- {"event_cost_item", {PackItemId(2,1,31170)}, mg_ModifyTask, {TASKID_MC_MG_USE_AMAZIONG_COIN_NUM,nil,"Ê¹ÓÃ%d/20¸öÉñÆæ½ð±Ò"},  },

    -- {"event_mission_affairs", {"one_road_battle", "honor", "10kill_in_10s"},  mg_FinishBitCondition, {291, "Ê®²½É±Ò»ÈË"},  },
    -- {"event_mission_affairs", {"one_road_battle", "honor", "freeze_thief"},   mg_FinishBitCondition, {292, "Õ¾×¡£¬Ð¡Íµ£¡"},  },
    -- {"event_mission_affairs", {"one_road_battle", "honor", "striker_master"}, mg_FinishBitCondition, {293, "½Ë·ËÃû½«"},  },
    -- {"event_mission_affairs", {"one_road_battle", "honor", "tower_breaker_master"}, mg_FinishBitCondition, {294, "»ÙËþ¸ßÊÖ"},  },

    --{"event_equip_operation", {"yunling",-1,-1,-1}, mg_FinishBitCondition, {295,"Í¨¹ýÔÌÁéµÀ¾ß»òÇ§±äºÐ½øÐÐÒ»´ÎÔÌÁé"},  },
    --{"event_ib_cost",     {PackItemId(2,1,30642)},  mg_ModifyTask, {TASKID_MC_MG_USE_RYJGZ_NUM,nil,"Ê¹ÓÃ%d/15¸öÈÙÒ«¾ü¹¦ÕÂ"},  },
    {"event_task_award", {"jubaozhai",-1}, mg_ModifyTask, {TASKID_MC_MG_STONE_LOTTERY_NUM,1,"Rót th­ëng HuyÒn Th¹ch Tô B¶o Trai %d/50 lÇn"},  },

    --{"event_task_award",  {"daily_reg_accum",28},    mg_FinishBitCondition, {299,"»ñµÃºÀ»ªÇ©µ½Àñ°ü"},  },
    --{"event_mission_stage_finish", {"tong_activity", 3}, mg_FinishBitCondition, {300,"Íê³ÉÒ»´Î¾ªÊÀÇÔÔô"}  },

    {"event_equip_operation", {"quench_lp", 1,-1,-1}, mg_FinishBitCondition, {301,"T¨ng cÊp Th­¬ng H¶i Ch©u thµnh c«ng 1 lÇn"}  },
    {"event_equip_operation", {"quench_lp",-1,-1,20}, mg_ModifyTask, {TASKID_MC_MG_QUENCH_LP_LV20_NUM,1,"T«i luyÖn %d/10 Th­¬ng H¶i Ch©u ®Õn Lv20"}  },

    {TeamEvent("event_mission_affairs"), {"worldboss", "killboss",-1}, mg_OnKillBoss, {"DiÖt BOSS ThÕ Giíi"} },
    {TeamEvent("event_mission_affairs"), {"tongboss",  "killboss",-1}, mg_OnKillBoss, {"DiÖt BOSS Bang"} },
    {TeamEvent("event_kill_npc"), {"TrÇn Lçi",-1},          mg_FinishBitCondition, {319, "DiÖt BOSS Ma Vùc [TrÇn Lçi]"} },
    {TeamEvent("event_kill_npc"), {"Thiªn ¢m Gi¸o Ma Vùc Sø",-1}, mg_FinishBitCondition, {320, "DiÖt BOSS Ma Vùc [Thiªn ¢m Gi¸o-Ma Vùc Chuyªn Sø]"} },
    {TeamEvent("event_kill_npc"), {"Thiªn ¢m Gi¸o §å träng th­¬ng",-1}, mg_FinishBitCondition, {321, "DiÖt BOSS Ma Vùc [Thiªn ¢m Gi¸o §å Träng Th­¬ng]"} },
}

-- function on_add_watches() end
-- function on_event_server_start() end
-- function on_event_player_login(nExchangeComing) end

--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
-- function on_first_login_clear(nLastLoginDate)--isolateÉÏÏßºóµÚÒ»´ÎµÇÂ¼Ê±µÄÇåÀí
-- 	t_Fix_201606:fix_up(nLastLoginDate)
-- end 




--����ģ�黯��һ����׼���ļ�����ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������������Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�������ջص�Ӱ��Ч��
Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\isolate\\online_activites\\monthly_goals\\mg_head.lua")

t_isolate_base_cfg = { --����һ������������
    nPriority 			= g_mgOpen,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "MothlyGoals",
    szViewName 			= "Hi�p Kh�ch H�nh",
    nTalkBeginDate      = 0,
    nBeginDate  		= 0,
    nEndDate 			= 0,
}
 
t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskId, nAcessCode = 0},
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
    ["C�p Th�i V� T�ng Giang"] = 243, 
    ["Tri �a Tinh Ng� D�ng"] = 244, 
    ["C�u V�n Long S� Ti�n"] = 245, 
    ["Ti�u Tuy�n Phong S�i Ti�n"] = 246, 
    ["��i �ao Quan Th�ng"] = 247, 
    ["Nh�p V�n Long C�ng T�n Th�ng"] = 248, 
    ["B�o T� ��u L�m Xung"] = 249, 
    ["Hoa H�a Th��ng L� Tr� Th�m"] = 250, 
    ["H�c To�n Phong L� Qu�"] = 251, 
    ["H�nh Gi� V� T�ng"] = 252, 
    ["B�nh Quan S�c D��ng H�ng"] = 253, 
    ["Phanh M�nh Tam Lang Th�ch T�"] = 254, 
    ["Nh�t Tr��ng Thanh H� Tam N��ng"] = 255, 
    ["Song Th��ng T��ng ��ng B�nh"] = 256, 
    ["Thanh Di�n Th� D��ng Tr�"] = 257, 
    ["T�ch L�ch H�a T�n Minh"] = 258, 
    ["T�y B�n Ti�n Phong Nh�t Ph�m"] = 259, 
    ["Song Ti�n H� Di�n Ch��c"] = 260, 
    --
    ["Thi�n �m S�t Th� Tinh Anh"] = 262,
    ["Thi�n �m ��i Tinh Anh"] = 263,
    ["Thi�n �m T�n S� Tinh Anh"] = 264,
    ["Thi�n �m M�t Th�m Tinh Anh"] = 265,
    ["B�ch K� Tinh Anh"] = 266,
    ["H�ng K� Ch� H�ng Tinh"] = 267,
    ["H�c K� Ch� � Mai V�"] = 268,
    ["Lam K� Ch� Lam �n H�c"] = 269,
    ["Ho�ng K� Ch� Ho�ng Si�u"] = 270,
    ["B�ch K� Ch� B�ch L�ng Ti�u"] = 271,
    ["L�i ���ng Ch� Ph��ng Ch�u"] = 272,
    ["H�a ���ng Ch� Ti�n Ch�ch"] = 273,
    ["Phong ���ng Ch� Phong Tr�n"] = 274,
    ["Uy�n Nhu V�n"] = 275,
    ["Uy�n Thanh Nhi"] = 276,
    --
    ["Nh�m Ng� H�nh"] = 304,
    ["Th��ng Th�n Doanh Thi�n"] = 305,
    ["B�c L�c L�m Minh Ch�"] = 306,
    ["L�nh H��ng L�ng"] = 307,
    ["��o Hoa ��o Ch� Ho�ng Long"] = 308,
    ["T�y V�c Th��ng Lang B� V��ng"] = 309,
    ["Ng�c S�n Chi Linh Thi�n C�u"] = 310,
    ["U Tr�ch Chi �nh Minh V�"] = 311,
    --
    ["B� Phi Y�n"] = 312,
    ["H� C�nh Th�ng"] = 313,
    ["Nhi�p ��i Ch�y"] = 314,
    ["C�n L�n N�"] = 315,
    ["B�i H�ng"] = 316,
    ["Li�u Ngh�"] = 317,
    ["H�ng Tuy�n"] = 318,
}

t_isolate_user_batch_watch_list = {
    {"event_mission_stage_finish", {"liangshan", 3}, mg_FinishBitCondition, {494, "V��t ph� b�n L��ng S�n-�i 3"},  },
    -- {"event_mission_task_award",   {"liangshan", "1chuyan",    -1}, mg_FinishBitCondition, {222, "�����ɽ[������ս]����"},  },
    -- {"event_mission_task_award",   {"liangshan", "2zhongyong", -1}, mg_FinishBitCondition, {223, "�����ɽ[������ս]����"},  },
    {"event_mission_task_award",   {"liangshan", "3duojun",    -1},    mg_FinishBitCondition, {242,"Ho�n th�nh nhi�m v� [Khi�u Chi�n L��ng S�n �o�t Qu�n]"},  },
    {TeamEvent("event_mission_affairs"), {"liangshan", "killboss",-1}, mg_OnKillBoss, {"Di�t BOSS L��ng S�n"} },

   
    {"event_mission_stage_finish", {"dixuangong", 3},        mg_FinishBitCondition, {224, "V��t ph� b�n ��a Huy�n Cung-�i 3"},  },
    -- {"event_mission_affairs",      {"dixuangong", "flop",1}, mg_ModifyTask, {TASKID_DC_MG_DXG_FLOP_FREE_NUM,1,"��������ѷ���%d/3��"},  },
    -- {"event_mission_affairs",      {"dixuangong", "flop",2}, mg_FinishBitCondition, {226, "���������ѷ���"},  },
    {TeamEvent("event_mission_affairs"), {"dixuangong", "killboss",-1}, mg_OnKillBoss, {"Di�t BOSS ��a Huy�n Cung"} },

    {"event_mission_stage_finish", {"wanjianzhong", 3}, mg_FinishBitCondition, {495, "V��t ph� b�n V�n Ki�m Tr�ng-�i 3"},  },
    --{"event_mission_task_award",   {"wanjianzhong", "1daily_pass",  -1}, mg_FinishBitCondition, {227,"�����ڣÿ������"},  },
    {"event_mission_task_award",   {"wanjianzhong", "3weekly_pass", -1}, mg_ModifyTask, {TASKID_MC_MG_FINISH_WJZ_WEEK_TASK_NUM,1,"Ho�n th�nh nhi�m v� tu�n V�n Ki�m Tr�ng"},  },

    -- {"event_mission_stage_finish", {"jiandangyanyun",     5},    mg_FinishBitCondition, {228,"ͨ�ؽ������Ƹ���"} },
    -- {"event_mission_stage_finish", {"jiandangyanyunhero", 5},    mg_FinishBitCondition, {228,"ͨ�ؽ������Ƹ���"} },
    {"event_mission_affairs",      {"jiandangyanyun", "flop",2}, mg_FinishBitCondition, {229,"Ki�m ��ng Y�n V�n-L�t B�i Tr� Ph�"} },
    {"event_mission_affairs",      {"jiandangyanyun", "flop",2}, mg_ModifyTask, {TASKID_MC_MG_JDYY_FLOP_PAY_NUM,1,"Ki�m ��ng Y�n V�n-L�t B�i Tr� Ph� %d/30 l�n"} },

    {"event_mission_stage_finish", {"new_taixu", 25}, mg_FinishBitCondition, {230,"V��t �i Th�i H� 25"},  },

    {"event_mission_stage_finish", {"taiyi",     6}, mg_ModifyTask, {TASKID_MC_MG_FINISH_TYT_MISSION_NUM,1,"V��t Th�i Nh�t Th�p %d/30 l�n (Th��ng/Anh h�ng)"} },
    {"event_mission_stage_finish", {"taiyihero", 6}, mg_ModifyTask, {TASKID_MC_MG_FINISH_TYT_MISSION_NUM,1,"V��t Th�i Nh�t Th�p %d/30 l�n (Th��ng/Anh h�ng)"} },
    
    {"event_mission_task_award",   {"planttree", "plant4lingtree", -1}, mg_FinishBitCondition, {231,"Tr�ng 1 C�y T� Linh"},  },
    {"event_mission_task_award",   {"planttree", "smalltreeprize", -1}, mg_FinishBitCondition, {232,"Tr�ng 1 C�y B�t Nh�-Nh�"},  },
    {"event_mission_task_award",   {"planttree", "plantseedtree",  -1}, mg_FinishBitCondition, {492,"Tr�ng 1 C�y H�t Gi�ng"},  },
    {"event_mission_task_award",   {"planttree", "bigtreeprize",   -1}, mg_ModifyTask, {TASKID_MC_MG_BIG_BORE_TREE_AWARD_TIME,1,"Tr�ng v� thu ho�ch %d/4 C�y B�t Nh� L�n"},  },
    {"event_mission_task_award",   {"pvp",       "yunbiao",        -1}, mg_FinishBitCondition, {233,"Ho�n th�nh 1 l�n V�n Ti�u"},  },
    {"event_mission_task_award",   {"pvp",       "duobiao",        -1}, mg_FinishBitCondition, {493,"Ho�n th�nh 1 l�n �o�t Ti�u"},  },

    {"event_mission_award",   {"newbattle",-1,-1,4},    mg_FinishBitCondition, {234,"Ho�n th�nh 1 l�n Chi�n Tr��ng Nh�n M�n Quan (Nh�n th��ng)"},  },
    {"event_mission_award",   {"kfbattle",-1,-1,-1},    mg_FinishBitCondition, {235,"Ho�n th�nh 1 l�n Thi�n M�n Tr�n Li�n Server (Nh�n th��ng)"},  },
    {"event_mission_award",   {"ziyuanzhan",-1,-1,-1},  mg_FinishBitCondition, {496,"Nh�n th��ng T�ng Li�u T�i Nguy�n Chi�n (Ng�y)"},  },
    {"event_mission_award",   {"ziyuanzhan",-1,-1,-1},  mg_ModifyTask, {TASKID_MC_MG_SOURCE_BATTLE_AWARDCOUNT,1,"Nh�n th��ng chi�n tr��ng T�i Nguy�n Chi�n %d/40 l�n"},  },

    {"event_task_award",      {"tong_daily_task", -1},     mg_ModifyTask, {TASKID_DC_MG_FINISH_TONG_TASK_NUM,1,"Ho�n th�nh nhi�m v� ng�y bang h�i %d/10 l�n"},  },
    {"event_task_award",      {"tong_daily_task", -1},     mg_ModifyTask, {TASKID_MC_MG_FINISH_TONG_TASK_NUM,1,"Ho�n th�nh nhi�m v� ng�y bang h�i %d/100 l�n"},  },
    {"event_equip_operation", {"upgradebookapp",-1,-1,-1}, mg_FinishBitCondition, {241,"Ti�n C�p Ch�n V� M�t T�ch 1 l�n"},  },

    {"event_gain_item", {PackItemId(2,1,31239)}, mg_ModifyTask, {TASKID_MC_MG_MAKE_SOUL_MEDICINE_NUM,1,"Luy�n Linh Ph�ch ��n %d/1"},  },
    {"event_cost_item", {PackItemId(2,1,30297)}, mg_ModifyTask, {TASKID_DC_MG_FIRECRAKER_USE_NUM,nil,"S� d�ng %d/50 Ph�o Chi�n Th�ng"},  },
    {"event_cost_item", {PackItemId(2,1,30154)}, mg_ModifyTask, {TASKID_MC_MG_NVWA_BOX_USECOUNT,nil,"D�ng %d/100 N� Oa B�o H�p"},  },
    {"event_cost_item", {PackItemId(2,1,30191)}, mg_ModifyTask, {TASKID_MC_MG_LUCKYSTAR_USECOUNT,nil,"D�ng %d/16 Ng�i Sao May M�n"},  },
    -- {"event_cost_item", {PackItemId(2,1,31170)}, mg_ModifyTask, {TASKID_MC_MG_USE_AMAZIONG_COIN_NUM,nil,"ʹ��%d/20��������"},  },

    -- {"event_mission_affairs", {"one_road_battle", "honor", "10kill_in_10s"},  mg_FinishBitCondition, {291, "ʮ��ɱһ��"},  },
    -- {"event_mission_affairs", {"one_road_battle", "honor", "freeze_thief"},   mg_FinishBitCondition, {292, "վס��С͵��"},  },
    -- {"event_mission_affairs", {"one_road_battle", "honor", "striker_master"}, mg_FinishBitCondition, {293, "�˷�����"},  },
    -- {"event_mission_affairs", {"one_road_battle", "honor", "tower_breaker_master"}, mg_FinishBitCondition, {294, "��������"},  },

    --{"event_equip_operation", {"yunling",-1,-1,-1}, mg_FinishBitCondition, {295,"ͨ��������߻�ǧ��н���һ������"},  },
    --{"event_ib_cost",     {PackItemId(2,1,30642)},  mg_ModifyTask, {TASKID_MC_MG_USE_RYJGZ_NUM,nil,"ʹ��%d/15����ҫ������"},  },
    {"event_task_award", {"jubaozhai",-1}, mg_ModifyTask, {TASKID_MC_MG_STONE_LOTTERY_NUM,1,"R�t th��ng Huy�n Th�ch T� B�o Trai %d/50 l�n"},  },

    --{"event_task_award",  {"daily_reg_accum",28},    mg_FinishBitCondition, {299,"��ú���ǩ�����"},  },
    --{"event_mission_stage_finish", {"tong_activity", 3}, mg_FinishBitCondition, {300,"���һ�ξ�������"}  },

    {"event_equip_operation", {"quench_lp", 1,-1,-1}, mg_FinishBitCondition, {301,"T�ng c�p Th��ng H�i Ch�u th�nh c�ng 1 l�n"}  },
    {"event_equip_operation", {"quench_lp",-1,-1,20}, mg_ModifyTask, {TASKID_MC_MG_QUENCH_LP_LV20_NUM,1,"T�i luy�n %d/10 Th��ng H�i Ch�u ��n Lv20"}  },

    {TeamEvent("event_mission_affairs"), {"worldboss", "killboss",-1}, mg_OnKillBoss, {"Di�t BOSS Th� Gi�i"} },
    {TeamEvent("event_mission_affairs"), {"tongboss",  "killboss",-1}, mg_OnKillBoss, {"Di�t BOSS Bang"} },
    {TeamEvent("event_kill_npc"), {"Tr�n L�i",-1},          mg_FinishBitCondition, {319, "Di�t BOSS Ma V�c [Tr�n L�i]"} },
    {TeamEvent("event_kill_npc"), {"Thi�n �m Gi�o Ma V�c S�",-1}, mg_FinishBitCondition, {320, "Di�t BOSS Ma V�c [Thi�n �m Gi�o-Ma V�c Chuy�n S�]"} },
    {TeamEvent("event_kill_npc"), {"Thi�n �m Gi�o �� tr�ng th��ng",-1}, mg_FinishBitCondition, {321, "Di�t BOSS Ma V�c [Thi�n �m Gi�o �� Tr�ng Th��ng]"} },
}

-- function on_add_watches() end
-- function on_event_server_start() end
-- function on_event_player_login(nExchangeComing) end

--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
-- function on_first_login_clear(nLastLoginDate)--isolate���ߺ��һ�ε�¼ʱ������
-- 	t_Fix_201606:fix_up(nLastLoginDate)
-- end 




--����ģ�黯��һ����׼���ļ�����ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������������Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�������ջص�Ӱ��Ч��

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "longmenPop",
    szViewName 			= "Qu�n Tr� Long M�n-Danh V�ng",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}
LM_POP = 3581

LM_TSKID_FINISH_PRETASK = 3583      -- �Ƿ���ɿ������ſ�ջ����������

LM_TSKID_WEEKLY_MISSION = 3584      -- ���ſ�ջ�ܳ������� byte1:����id������ byte2����ȡ������

LM_TSKID_DAILY_MISSION = 3585       -- ���ſ�ջ�ճ������� byte1:����id������ byte2����ȡ������

LM_WEEKLY_MISSION_LIMIT = 70
LM_DAILY_MISSION_LIMIT = 10

LM_POP_LEVEL = {
    [1] = {0,       "<color=gray>S� Nh�p Giang H�<color>"},
    [2] = {3000,    "<color=green2>B�c L� T�i N�ng<color>"},
    [3] = {6000,    "<color=green>Danh N�i Nh� C�n<color>"},
    [4] = {10500,   "<color=blue2>C�ng Danh Hi�n H�ch<color>"},
    [5] = {16500,   "<color=yellow>Vang Danh Thi�n H�<color>"},
    [6] = {24000,   "<color=red2>V�n Ng��i Ng��ng M�<color>"},
}

t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskId, nAcessCode = 0},
   {id={"daily_task", LM_TSKID_DAILY_MISSION, 0}, clear = "daily" }, 
   {id={"weekly_task", LM_TSKID_WEEKLY_MISSION, 0}, clear = "weekly" }, 
}

----------------------------------------------------------------------------------------------
-- �ճ�������ܳ����� 
-- ���ڿ�����ʱ��û���������ĳ��ָ��ʣ���˱�ṹ��̫�ø�
-- �������һ���±����ԭ�����ʵ�ָ��ʿ���
-- support up to 255 missions
tWeeklyTask = { 
    -------------------------------------------------------------------------------------------------
    647,648,649,650,651,652,                    -- �������� [1-6] ������ɾ��ʱ��ҲҪ�޸� tWeeklyTaskType
    -------------------------------------------------------------------------------------------------
    607,608,609,610,611,612,613,614,615,616,
    617,618,619,620,621,622,623,624,625,626,    -- Ѱ������ [7-26] ������ɾ��ʱ��ҲҪ�޸� tWeeklyTaskType
    -------------------------------------------------------------------------------------------------
    627,628,629,630,631,632,633,634,635,636,
    637,638,639,640,641,642,643,644,645,646,    -- ��ɱ���� [27-tail] ������ɾ��ʱ��ҲҪ�޸� tDailyTaskType
    -------------------------------------------------------------------------------------------------
}
tWeeklyTaskType = {
    missionTask = {1, 6},                       -- �������� Idx��Χ��[1, 6]
    seekTask    = {7, 26},                      -- Ѱ������ Idx��Χ��[7, 26]
    killTask    = {27, getn(tWeeklyTask)},       -- ��ɱ���� Idx��Χ��[7, tail]
}
function lm_get_weekly_type_range()
    local rand = random(1,1000)
    if rand <= 300 then
        return tWeeklyTaskType.missionTask
    elseif rand <= 600 then
        return tWeeklyTaskType.seekTask
    end
    return tWeeklyTaskType.killTask
end
-- support up to 255 missions
tDailyTask = {
    -------------------------------------------------------------------------------------------------
    673,674,675,676,677,678,                    -- �������� [1-6] ������ɾ��ʱ��ҲҪ�޸� tDailyTaskType
    -------------------------------------------------------------------------------------------------
    653,654,655,656,657,658,659,660,661,662,
    663,664,665,666,667,668,669,670,671,672,    -- ��ɱ���� [7-tail] ������ɾ��ʱ��ҲҪ�޸� tDailyTaskType
    -------------------------------------------------------------------------------------------------
}
tDailyTaskType = {
    missionTask = {1, 6},                       -- �������� Idx��Χ��[1, 6]
    killTask    = {7, getn(tDailyTask)},        -- ��ɱ���� Idx��Χ��[7, tail]
}
function lm_get_daily_type_range()
    local rand = random(1,1000)
    if rand <= 300 then
        return tDailyTaskType.missionTask
    end
    return tDailyTaskType.killTask
end
----------------------------------------------------------------------------------------------


function lm_gtask_awardItem(nTaskId, tItem, szItemName)
    local hasMission = tGtTaskManage:IsGetGTaskID(nTaskId)          -- �ж�Ӧ����
    local itemCount = BigGetItemCount(tItem[1],tItem[2],tItem[3])   -- �Ѿ��ж��ټ���Ӧ����
    if itemCount > 0 or hasMission == 0 then
        return
    end
    if gf_JudgeRoomWeight(tItem[4], 100) ~= 1 then
        Msg2Player(format("H�nh trang kh�ng �� ch�, kh�ng th� nh�n %s!", szItemName))
        return 
    end
    gf_AddItemEx(tItem, szItemName)
end

function lm_pass_dixuangong()
    lm_gtask_awardItem(601, {2,1,31305,1,4}, "��a Huy�n Cung �n")
    lm_gtask_awardItem(647, {2,1,31305,1,4}, "��a Huy�n Cung �n")
    lm_gtask_awardItem(673, {2,1,31305,1,4}, "��a Huy�n Cung �n")
end

function lm_pass_wanjian()
    lm_gtask_awardItem(648, {2,1,31308,1,4}, "B�ch Luy�n Th�n Thi�t")
    lm_gtask_awardItem(674, {2,1,31308,1,4}, "B�ch Luy�n Th�n Thi�t")
end

function lm_pass_liangshan()
    lm_gtask_awardItem(649, {2,1,31309,1,4}, "T�i Xuy�n V�n Ti�n")
    lm_gtask_awardItem(675, {2,1,31309,1,4}, "T�i Xuy�n V�n Ti�n")
end

function lm_pass_jdyy()
    lm_gtask_awardItem(650, {2,1,31310,1,4}, "Khai S�n Ph�")
    lm_gtask_awardItem(676, {2,1,31310,1,4}, "Khai S�n Ph�")
end

function lm_pass_newtaixu()
    lm_gtask_awardItem(651, {2,1,31311,1,4}, "Th�i H� Th�ch")
    lm_gtask_awardItem(677, {2,1,31311,1,4}, "Th�i H� Th�ch")
end

function lm_pass_taiyi()
    lm_gtask_awardItem(652, {2,1,31312,1,4}, "Th� Tay L�nh C�ng")
    lm_gtask_awardItem(678, {2,1,31312,1,4}, "Th� Tay L�nh C�ng")
end

function lm_kill_xinyihua()
    lm_gtask_awardItem(603, {2,1,31306,1,4}, "C�u Chuy�n Minh Huy L�")
end

function lm_finish_gtask(para1, para2)
    local gTaskId = para1[2][1]
    local szType = para1[4][1]
    if szType == "daily" then
        local taskCounter = gf_GetTaskByte(LM_TSKID_DAILY_MISSION, 2)
        if taskCounter == 0 then
            AddRuntimeStat(73, 1, 0, 1) --������ſ�ջ�ճ����������
        end
        AddRuntimeStat(73, 2, 0, 1)     --������ſ�ջ�ճ�����Ĵ���
    else
        local taskCounter = gf_GetTaskByte(LM_TSKID_WEEKLY_MISSION, 2)
        if taskCounter == 0 then
            AddRuntimeStat(74, 1, 0, 1) --������ſ�ջ�ܳ����������
        end
        AddRuntimeStat(74, 2, 0, 1)     --������ſ�ջ�ܳ�����Ĵ���
    end
end


t_isolate_user_batch_watch_list = {--{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), {nMaterialType, nNum}}
    {"event_mission_stage_finish", {"dixuangong", 3}, 	        lm_pass_dixuangong, {""}  },	
    {"event_mission_stage_finish", {"liangshan", 4}, 			lm_pass_liangshan,  {""}  },	
	{"event_mission_stage_finish", {"wanjianzhong", 4}, 		lm_pass_wanjian,    {""}  },	
    {"event_mission_stage_finish", {"jiandangyanyun", 5},       lm_pass_jdyy,       {""}  },    
    {"event_mission_stage_finish", {"jiandangyanyun", 6},       lm_pass_jdyy,       {""}  },    
    {"event_mission_stage_finish", {"jiandangyanyunhero", 5},   lm_pass_jdyy,       {""}  },
    {"event_mission_stage_finish", {"jiandangyanyunhero", 6},   lm_pass_jdyy,       {""}  },
    {"event_mission_stage_finish", {"new_taixu", 30},           lm_pass_newtaixu,   {""}  },    
	{"event_mission_stage_finish", {"taiyi", 6}, 				lm_pass_taiyi,      {""}  },	
    {"event_mission_stage_finish", {"taiyihero", 6}, 			lm_pass_taiyi,      {""}  },	
}

for i = 1,getn(tWeeklyTask) do
    tinsert(t_isolate_user_batch_watch_list, {"event_finish_gtask",{tWeeklyTask[i]}, lm_finish_gtask,{"weekly"}})
    tinsert(t_isolate_user_batch_watch_list, {"event_jump_gtask",{tWeeklyTask[i]}, lm_finish_gtask,{"weekly"}})
end
for i = 1,getn(tDailyTask) do
    tinsert(t_isolate_user_batch_watch_list, {"event_finish_gtask",{tDailyTask[i]}, lm_finish_gtask,{"daily"}})
    tinsert(t_isolate_user_batch_watch_list, {"event_jump_gtask",{tDailyTask[i]}, lm_finish_gtask,{"daily"}})
end

function lm_getRandomTask(tTaskList, szTaskType, tTypeRange)
    local taskidx = get_task_byte(szTaskType, 1)
    local taskCounter = get_task_byte(szTaskType, 2)
    if taskidx == 0 then
        -- Ŀǰû������
        taskidx = random(tTypeRange[1],tTypeRange[2])
        set_task_byte(szTaskType, 1, taskidx)
        return tTaskList[taskidx]
    end
    if tGtTask:check_task_isfinish(tTaskList[taskidx]) == 1 then
        -- ���ϴ�������Ѿ������
        ClearGTask(tTaskList[taskidx])
        -- ������������ �������һ������
        taskidx = random(1,getn(tTaskList))
        set_task_byte(szTaskType, 1, taskidx)
        set_task_byte(szTaskType, 2, taskCounter + 1)  -- ������+1
        return tTaskList[taskidx]
    end
    -- ���ϵ�����û�����
    return tTaskList[taskidx]
end

function lm_get_weekly_mission(weeklyGtaskId)
    if tGtTaskManage:IsGetGTaskID(weeklyGtaskId) == 1 then
        -- �Ѿ���ȡ������
        local tbSay = {}
        local szTitle = format("<color=green>%s<color>: Ng��i v�n ch�a ho�n th�nh nhi�m v� hi�n t�i.", GetTargetNpcName())
        tinsert(tbSay, "Ta s� xong ngay/nothing")
        Say(szTitle, getn(tbSay), tbSay)
        return 
    end
    -- ClearGTask(weeklyGtaskId)
    DirectGetGTask(weeklyGtaskId, 1)
end

function lm_check_pop()
    local nPop = GetTask(LM_POP)
    local szPop = LM_POP_LEVEL[1][2]
    local level = 1
    for i = 1,getn(LM_POP_LEVEL)  do
        if LM_POP_LEVEL[i][1] <= nPop then
            level = i
        else
            break
        end
    end
    szPop = LM_POP_LEVEL[level][2]
    Talk(1,"",format("<color=green>%s<color>: Nay th�i cu�c r�i ren, vi�c l�m �n ng�y c�ng kh� kh�n, sau n�y h�y c� g�ng h�n.\n\n      Danh v�ng hi�n t�i: %s (<color=yellow>%d<color>)\n", GetTargetNpcName(), szPop, GetTask(LM_POP)))
end

function lm_talk2sunerlian()
    if GetTask(LM_TSKID_FINISH_PRETASK) == 0 then
        Talk(1, "", format("<color=green>%s<color>: Nhi�m v� g�? Hi�p s� ch�c �ang ��a, b�n ti�m l� n�i bu�n b�n, l�m g� c� nhi�m v� cho ��i hi�p tr�n giang h�. Nh�ng nghe n�i g�n ��y �o�n ���ng ��n T�y V�c r�t n�o nhi�t, th��ng nh�n Ba T� � Ph�ng T��ng g�n ��y mang r�t nhi�u m�n �� qu� c�a T�y V�c ��n, ng��i c� th� ��n �� th� v�n may.", GetTargetNpcName()))
        return
    end
    local weeklyGtaskId = lm_getRandomTask(tWeeklyTask, "weekly_task", lm_get_weekly_type_range())
    local weeklyCounter = get_task_byte("weekly_task", 2)
    local szTitle = format("<color=green>%s<color>: Qu�n tr� l� n�i l�m �n, m�i h�ng ghi c� � ��y r�i. Nhi�m v� tu�n n�y c�n: <color=green>%d<color>", GetTargetNpcName(), LM_WEEKLY_MISSION_LIMIT - weeklyCounter)
    local tbSay = {}
    if LM_WEEKLY_MISSION_LIMIT - weeklyCounter > 0 then
        tinsert(tbSay, format("Ta mu�n nh�n nhi�m v�/#lm_get_weekly_mission(%d)", weeklyGtaskId))
    end
    tinsert(tbSay, "Xem Danh v�ng/lm_check_pop")
    tinsert(tbSay, "H�y b�/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function lm_answerwrong()
    Talk(1,"", format("<color=green>%s<color>: Ha ha, xem ra hi�p s� l� ng��i t� xa ��n.", GetTargetNpcName()) )
end

function lm_get_daily_mission(dailyGtaskId)
    if tGtTaskManage:IsGetGTaskID(dailyGtaskId) == 1 then
        -- �Ѿ���ȡ������
        local tbSay = {}
        local szTitle = format("<color=green>%s<color>: Ng��i v�n ch�a ho�n th�nh nhi�m v� hi�n t�i.", GetTargetNpcName())
        tinsert(tbSay, "Ta s� xong ngay/nothing")
        Say(szTitle, getn(tbSay), tbSay)
        return 
    end
    DirectGetGTask(dailyGtaskId, 1)
end

function lm_talk2lihua()
    local szTitle = ""
    local tbSay = {}
    if GetTask(LM_TSKID_FINISH_PRETASK) == 0 then
        szTitle = format("<color=green>%s<color>: M�a gi� kh�p n�i c�ng kh�ng b�ng m�a � Qu�n Tr� Long M�n.\n\n", GetTargetNpcName())
        tinsert(tbSay,"Tr�i trong xanh th� n�y, ��u ra m�a gi�?/lm_answerwrong")
        Say(szTitle, getn(tbSay), tbSay)
        return
    end
    local dailyGtaskId = lm_getRandomTask(tDailyTask, "daily_task", lm_get_daily_type_range())
    local dailyCounter = get_task_byte("daily_task", 2)
    szTitle = format("<color=green>%s<color>: Ha ha, th� ra l� ng��i c�ng ngh�, sau n�y ph�i g�p g� th��ng xuy�n. C�ng vi�c � ch� ta ��u ghi � ��y, xem �i.\n    Nhi�m v� h�m nay c�n: <color=green>%d<color>\n", GetTargetNpcName(), LM_DAILY_MISSION_LIMIT - dailyCounter)
    if LM_DAILY_MISSION_LIMIT - dailyCounter > 0 then 
        tinsert(tbSay,format("Ta ��n nh�n nhi�m v�/#lm_get_daily_mission(%d)", dailyGtaskId))
    end
    tinsert(tbSay,"C�o T�/nothing")
    Say(szTitle, getn(tbSay), tbSay)

end

function on_add_watches()
    isolate_watch_npc_talk("T�n Nh� Li�n", 507, "lm_talk2sunerlian")
    isolate_watch_npc_talk("L� Hoa", 507, "lm_talk2lihua")
    isolate_watch_event("event_kill_npc", "lm_kill_xinyihua", "T�n Di Hoa", 505)
    isolate_watch_item_talk(2, 1, 31319, "lm_usecake") --���Ƹ��
end

function lm_usecake(nItemIdx)
    if GetTask(LM_TSKID_FINISH_PRETASK) == 0 then
        Talk(1,"","Ch�a m� Danh V�ng Qu�n Tr� Long M�n")
        return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        SetTask(LM_POP, GetTask(LM_POP) + 10)
        Msg2Player(format("Nh�n ���c %d �i�m Danh V�ng Qu�n Tr� Long M�n", 10))
    end
end

function on_event_server_start()
	CreateNpc("lmkz_caoshaoqing", "T�o Thi�u Khanh", 507,1638,3210)
    CreateNpc("lmkz_yangzhao", "D��ng Chi�u", 507,1865,3281)
    CreateNpc("lmkz_yangzhao1", "D��ng Chi�u", 507,1700,3438)
    CreateNpc("lmkz_xingyihua", "T�n Di Hoa", 505,1392,2804)
    CreateNpc("lmkz_bjtz", "Th�m T� Bi�n Kinh", 507,1855,3209)
    CreateNpc("lmkz_ansha1","Ng� L�i",327,1537,2795)
    CreateNpc("lmkz_ansha2","�o�n V� Tr�ch",403,1386,3051)
    CreateNpc("lmkz_ansha3","M�ng Ngh�",408,1297,3018)
    CreateNpc("lmkz_ansha4","Nguy�n Tr� Sinh",104,1553,2865)
    CreateNpc("lmkz_ansha5","T�n Chi Tr�",109,1482,2975)
    CreateNpc("lmkz_ansha6","Gi�i Tr�n",207,1399,2763)
    CreateNpc("lmkz_ansha7","Th�i B�t Thi�n",217,1908,2925)
    CreateNpc("lmkz_ansha8","Phan H�",604,1527,3041)
    CreateNpc("lmkz_ansha9","Ti�u V�n Lan",601,1382,2882)
    CreateNpc("lmkz_ansha10","M�nh Du B�nh",506,1438,2838)
    CreateNpc("lmkz_ansha11","Vi�n H�o",505,1389,2797)
    CreateNpc("lmkz_ansha12","Y�n L�ng V�n",309,1455,3083)
    CreateNpc("lmkz_ansha13","L� B�ng T�",406,1415,3049)
    CreateNpc("lmkz_ansha14","Giang Thi�n S�n",326,1525,2879)
    CreateNpc("lmkz_ansha15","Ng�u Nh�",202,1448,2797)
    CreateNpc("lmkz_ansha16","Tam Thi�u Gia",302,1326,3122)
    CreateNpc("lmkz_ansha17","�n V� Ph�c",508,1617,3235)
    CreateNpc("lmkz_ansha18","Lam B�o Kh�ch",401,1592,3114)
    CreateNpc("lmkz_ansha19","D� Xoa",307,1585,3053)
    CreateNpc("lmkz_ansha20","Phi T��ng Qu�n",314,1576,3263)

end


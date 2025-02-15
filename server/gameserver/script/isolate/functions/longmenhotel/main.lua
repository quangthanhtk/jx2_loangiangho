--这是模块化的一个标准主文件，各模块只需要实现对应的标准事件处理函数，不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调，以免空回调影响效率

Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
Import("\\script\\lib\\globalfunctions.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "longmenPop",
    szViewName 			= "Qu竛 Tr� Long M玭-Danh V鋘g",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}
LM_POP = 3581

LM_TSKID_FINISH_PRETASK = 3583      -- 是否完成开启龙门客栈声望任务链

LM_TSKID_WEEKLY_MISSION = 3584      -- 龙门客栈周常任务标记 byte1:任务id索引， byte2：接取计数器

LM_TSKID_DAILY_MISSION = 3585       -- 龙门客栈日常任务标记 byte1:任务id索引， byte2：接取计数器

LM_WEEKLY_MISSION_LIMIT = 70
LM_DAILY_MISSION_LIMIT = 10

LM_POP_LEVEL = {
    [1] = {0,       "<color=gray>S� Nh藀 Giang H�<color>"},
    [2] = {3000,    "<color=green2>B閏 L� T礽 N╪g<color>"},
    [3] = {6000,    "<color=green>Danh N鎖 Nh� C錸<color>"},
    [4] = {10500,   "<color=blue2>C玭g Danh Hi觧 H竎h<color>"},
    [5] = {16500,   "<color=yellow>Vang Danh Thi猲 H�<color>"},
    [6] = {24000,   "<color=red2>V筺 Ngi Ngng M�<color>"},
}

t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskId, nAcessCode = 0},
   {id={"daily_task", LM_TSKID_DAILY_MISSION, 0}, clear = "daily" }, 
   {id={"weekly_task", LM_TSKID_WEEKLY_MISSION, 0}, clear = "weekly" }, 
}

----------------------------------------------------------------------------------------------
-- 日常任务和周常任务 
-- 初期开发的时候没有设计任务的出现概率，因此表结构不太好改
-- 这里采用一张新表配合原任务表实现概率控制
-- support up to 255 missions
tWeeklyTask = { 
    -------------------------------------------------------------------------------------------------
    647,648,649,650,651,652,                    -- 副本任务 [1-6] 新增或删除时，也要修改 tWeeklyTaskType
    -------------------------------------------------------------------------------------------------
    607,608,609,610,611,612,613,614,615,616,
    617,618,619,620,621,622,623,624,625,626,    -- 寻物任务 [7-26] 新增或删除时，也要修改 tWeeklyTaskType
    -------------------------------------------------------------------------------------------------
    627,628,629,630,631,632,633,634,635,636,
    637,638,639,640,641,642,643,644,645,646,    -- 击杀任务 [27-tail] 新增或删除时，也要修改 tDailyTaskType
    -------------------------------------------------------------------------------------------------
}
tWeeklyTaskType = {
    missionTask = {1, 6},                       -- 副本任务 Idx范围：[1, 6]
    seekTask    = {7, 26},                      -- 寻物任务 Idx范围：[7, 26]
    killTask    = {27, getn(tWeeklyTask)},       -- 击杀任务 Idx范围：[7, tail]
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
    673,674,675,676,677,678,                    -- 副本任务 [1-6] 新增或删除时，也要修改 tDailyTaskType
    -------------------------------------------------------------------------------------------------
    653,654,655,656,657,658,659,660,661,662,
    663,664,665,666,667,668,669,670,671,672,    -- 击杀任务 [7-tail] 新增或删除时，也要修改 tDailyTaskType
    -------------------------------------------------------------------------------------------------
}
tDailyTaskType = {
    missionTask = {1, 6},                       -- 副本任务 Idx范围：[1, 6]
    killTask    = {7, getn(tDailyTask)},        -- 击杀任务 Idx范围：[7, tail]
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
    local hasMission = tGtTaskManage:IsGetGTaskID(nTaskId)          -- 有对应任务
    local itemCount = BigGetItemCount(tItem[1],tItem[2],tItem[3])   -- 已经有多少件对应道具
    if itemCount > 0 or hasMission == 0 then
        return
    end
    if gf_JudgeRoomWeight(tItem[4], 100) ~= 1 then
        Msg2Player(format("H祅h trang kh玭g  ch�, kh玭g th� nh薾 %s!", szItemName))
        return 
    end
    gf_AddItemEx(tItem, szItemName)
end

function lm_pass_dixuangong()
    lm_gtask_awardItem(601, {2,1,31305,1,4}, "мa Huy襫 Cung 膎")
    lm_gtask_awardItem(647, {2,1,31305,1,4}, "мa Huy襫 Cung 膎")
    lm_gtask_awardItem(673, {2,1,31305,1,4}, "мa Huy襫 Cung 膎")
end

function lm_pass_wanjian()
    lm_gtask_awardItem(648, {2,1,31308,1,4}, "B竎h Luy謓 Th莕 Thi誸")
    lm_gtask_awardItem(674, {2,1,31308,1,4}, "B竎h Luy謓 Th莕 Thi誸")
end

function lm_pass_liangshan()
    lm_gtask_awardItem(649, {2,1,31309,1,4}, "T骾 Xuy猲 V﹏ Ti詎")
    lm_gtask_awardItem(675, {2,1,31309,1,4}, "T骾 Xuy猲 V﹏ Ti詎")
end

function lm_pass_jdyy()
    lm_gtask_awardItem(650, {2,1,31310,1,4}, "Khai S琻 Ph�")
    lm_gtask_awardItem(676, {2,1,31310,1,4}, "Khai S琻 Ph�")
end

function lm_pass_newtaixu()
    lm_gtask_awardItem(651, {2,1,31311,1,4}, "Th竔 H� Th筩h")
    lm_gtask_awardItem(677, {2,1,31311,1,4}, "Th竔 H� Th筩h")
end

function lm_pass_taiyi()
    lm_gtask_awardItem(652, {2,1,31312,1,4}, "Th� Tay L謓h C玭g")
    lm_gtask_awardItem(678, {2,1,31312,1,4}, "Th� Tay L謓h C玭g")
end

function lm_kill_xinyihua()
    lm_gtask_awardItem(603, {2,1,31306,1,4}, "C鰑 Chuy觧 Minh Huy L�")
end

function lm_finish_gtask(para1, para2)
    local gTaskId = para1[2][1]
    local szType = para1[4][1]
    if szType == "daily" then
        local taskCounter = gf_GetTaskByte(LM_TSKID_DAILY_MISSION, 2)
        if taskCounter == 0 then
            AddRuntimeStat(73, 1, 0, 1) --完成龙门客栈日常任务的人数
        end
        AddRuntimeStat(73, 2, 0, 1)     --完成龙门客栈日常任务的次数
    else
        local taskCounter = gf_GetTaskByte(LM_TSKID_WEEKLY_MISSION, 2)
        if taskCounter == 0 then
            AddRuntimeStat(74, 1, 0, 1) --完成龙门客栈周常任务的人数
        end
        AddRuntimeStat(74, 2, 0, 1)     --完成龙门客栈周常任务的次数
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
        -- 目前没接任务
        taskidx = random(tTypeRange[1],tTypeRange[2])
        set_task_byte(szTaskType, 1, taskidx)
        return tTaskList[taskidx]
    end
    if tGtTask:check_task_isfinish(tTaskList[taskidx]) == 1 then
        -- 身上存的任务已经完成了
        ClearGTask(tTaskList[taskidx])
        -- 清掉这个任务标记 重新随机一个任务
        taskidx = random(1,getn(tTaskList))
        set_task_byte(szTaskType, 1, taskidx)
        set_task_byte(szTaskType, 2, taskCounter + 1)  -- 计数器+1
        return tTaskList[taskidx]
    end
    -- 身上的任务还没有完成
    return tTaskList[taskidx]
end

function lm_get_weekly_mission(weeklyGtaskId)
    if tGtTaskManage:IsGetGTaskID(weeklyGtaskId) == 1 then
        -- 已经领取了任务
        local tbSay = {}
        local szTitle = format("<color=green>%s<color>: Ngi v蒼 ch璦 ho祅 th祅h nhi謒 v� hi謓 t筰.", GetTargetNpcName())
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
    Talk(1,"",format("<color=green>%s<color>: Nay th阨 cu閏 r鑙 ren, vi謈 l祄 ╪ ng祔 c祅g kh� kh╪, sau n祔 h穣 c� g緉g h琻.\n\n      Danh v鋘g hi謓 t筰: %s (<color=yellow>%d<color>)\n", GetTargetNpcName(), szPop, GetTask(LM_POP)))
end

function lm_talk2sunerlian()
    if GetTask(LM_TSKID_FINISH_PRETASK) == 0 then
        Talk(1, "", format("<color=green>%s<color>: Nhi謒 v� g�? Hi謕 s� ch綾 產ng a, b鎛 ti謒 l� n琲 bu玭 b竛, l祄 g� c� nhi謒 v� cho i hi謕 tr猲 giang h�. Nh璶g nghe n鉯 g莕 y 畂筺 阯g n T﹜ V鵦 r蕋 n竜 nhi謙, thng nh﹏ Ba T� � Ph鬾g Tng g莕 y mang r蕋 nhi襲 m鉵  qu� c馻 T﹜ V鵦 n, ngi c� th� n  th� v薾 may.", GetTargetNpcName()))
        return
    end
    local weeklyGtaskId = lm_getRandomTask(tWeeklyTask, "weekly_task", lm_get_weekly_type_range())
    local weeklyCounter = get_task_byte("weekly_task", 2)
    local szTitle = format("<color=green>%s<color>: Qu竛 tr� l� n琲 l祄 ╪, m鑙 h祅g ghi c� � y r錳. Nhi謒 v� tu莕 n祔 c遪: <color=green>%d<color>", GetTargetNpcName(), LM_WEEKLY_MISSION_LIMIT - weeklyCounter)
    local tbSay = {}
    if LM_WEEKLY_MISSION_LIMIT - weeklyCounter > 0 then
        tinsert(tbSay, format("Ta mu鑞 nh薾 nhi謒 v�/#lm_get_weekly_mission(%d)", weeklyGtaskId))
    end
    tinsert(tbSay, "Xem Danh v鋘g/lm_check_pop")
    tinsert(tbSay, "H駓 b�/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function lm_answerwrong()
    Talk(1,"", format("<color=green>%s<color>: Ha ha, xem ra hi謕 s� l� ngi t� xa n.", GetTargetNpcName()) )
end

function lm_get_daily_mission(dailyGtaskId)
    if tGtTaskManage:IsGetGTaskID(dailyGtaskId) == 1 then
        -- 已经领取了任务
        local tbSay = {}
        local szTitle = format("<color=green>%s<color>: Ngi v蒼 ch璦 ho祅 th祅h nhi謒 v� hi謓 t筰.", GetTargetNpcName())
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
        szTitle = format("<color=green>%s<color>: M璦 gi� kh緋 n琲 c騨g kh玭g b籲g m璦 � Qu竛 Tr� Long M玭.\n\n", GetTargetNpcName())
        tinsert(tbSay,"Tr阨 trong xanh th� n祔, u ra m璦 gi�?/lm_answerwrong")
        Say(szTitle, getn(tbSay), tbSay)
        return
    end
    local dailyGtaskId = lm_getRandomTask(tDailyTask, "daily_task", lm_get_daily_type_range())
    local dailyCounter = get_task_byte("daily_task", 2)
    szTitle = format("<color=green>%s<color>: Ha ha, th� ra l� ngi c飊g ngh�, sau n祔 ph秈 g苝 g� thng xuy猲. C玭g vi謈 � ch� ta u ghi � y, xem 甶.\n    Nhi謒 v� h玬 nay c遪: <color=green>%d<color>\n", GetTargetNpcName(), LM_DAILY_MISSION_LIMIT - dailyCounter)
    if LM_DAILY_MISSION_LIMIT - dailyCounter > 0 then 
        tinsert(tbSay,format("Ta n nh薾 nhi謒 v�/#lm_get_daily_mission(%d)", dailyGtaskId))
    end
    tinsert(tbSay,"C竜 T�/nothing")
    Say(szTitle, getn(tbSay), tbSay)

end

function on_add_watches()
    isolate_watch_npc_talk("T玭 Nh� Li猲", 507, "lm_talk2sunerlian")
    isolate_watch_npc_talk("L� Hoa", 507, "lm_talk2lihua")
    isolate_watch_event("event_kill_npc", "lm_kill_xinyihua", "T﹏ Di Hoa", 505)
    isolate_watch_item_talk(2, 1, 31319, "lm_usecake") --特制糕点
end

function lm_usecake(nItemIdx)
    if GetTask(LM_TSKID_FINISH_PRETASK) == 0 then
        Talk(1,"","Ch璦 m� Danh V鋘g Qu竛 Tr� Long M玭")
        return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        SetTask(LM_POP, GetTask(LM_POP) + 10)
        Msg2Player(format("Nh薾 頲 %d 甶觤 Danh V鋘g Qu竛 Tr� Long M玭", 10))
    end
end

function on_event_server_start()
	CreateNpc("lmkz_caoshaoqing", "T祇 Thi誹 Khanh", 507,1638,3210)
    CreateNpc("lmkz_yangzhao", "Dng Chi猽", 507,1865,3281)
    CreateNpc("lmkz_yangzhao1", "Dng Chi猽", 507,1700,3438)
    CreateNpc("lmkz_xingyihua", "T﹏ Di Hoa", 505,1392,2804)
    CreateNpc("lmkz_bjtz", "Th竚 T� Bi謓 Kinh", 507,1855,3209)
    CreateNpc("lmkz_ansha1","Ng� L鏸",327,1537,2795)
    CreateNpc("lmkz_ansha2","祅 V� Tr筩h",403,1386,3051)
    CreateNpc("lmkz_ansha3","M玭g Ngh�",408,1297,3018)
    CreateNpc("lmkz_ansha4","Nguy猲 Tr� Sinh",104,1553,2865)
    CreateNpc("lmkz_ansha5","T﹏ Chi Tr�",109,1482,2975)
    CreateNpc("lmkz_ansha6","Gi秈 Tr﹏",207,1399,2763)
    CreateNpc("lmkz_ansha7","Th阨 B蕋 Thi猲",217,1908,2925)
    CreateNpc("lmkz_ansha8","Phan H�",604,1527,3041)
    CreateNpc("lmkz_ansha9","Ti猽 V﹏ Lan",601,1382,2882)
    CreateNpc("lmkz_ansha10","M筺h Du B譶h",506,1438,2838)
    CreateNpc("lmkz_ansha11","Vi猲 H筼",505,1389,2797)
    CreateNpc("lmkz_ansha12","Y課 L╪g V﹏",309,1455,3083)
    CreateNpc("lmkz_ansha13","L� B祅g T�",406,1415,3049)
    CreateNpc("lmkz_ansha14","Giang Thi猲 S琻",326,1525,2879)
    CreateNpc("lmkz_ansha15","Ng璾 Nh�",202,1448,2797)
    CreateNpc("lmkz_ansha16","Tam Thi誹 Gia",302,1326,3122)
    CreateNpc("lmkz_ansha17"," V� Ph骳",508,1617,3235)
    CreateNpc("lmkz_ansha18","Lam B祇 Kh竎h",401,1592,3114)
    CreateNpc("lmkz_ansha19","D� Xoa",307,1585,3053)
    CreateNpc("lmkz_ansha20","Phi Tng Qu﹏",314,1576,3263)

end


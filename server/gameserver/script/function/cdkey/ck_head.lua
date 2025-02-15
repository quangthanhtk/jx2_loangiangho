--begin-------------------------------------------------------------------------把cdkey变成一个isolate
Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\script\\ksgvn\\lib.lua")
t_isolate_base_cfg = { --这是一个必填配置项
    nPriority = 1, --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName = "cdkey",
    szViewName = "Chu Tc L謓h " .. EVENT_CODE_PERIOD,
    nTalkBeginDate = EVENT_CODE_TALK_BEGIN_DATE,
    nBeginDate = EVENT_CODE_BEGIN_DATE,
    nEndDate = EVENT_CODE_END_DATE,
    nTaskGroup = 9, --!!!修改cdk活动的nTaskGroup必须更新活动界面配置
    nTaskGroupVersion = 35,
}

g_ckDebug = 0 --show debug info? 1:yes 0:no 

function _handler_event_cost_ib(data, para)
    local nItemPackId, nNum = unpack(data)
    _ck_SetCostIB(nNum)
end

function ck_DebugPrint(szStr, tTable)
    if g_ckDebug ~= 1 then
        return
    end
    if szStr then
        print("\n" .. szStr)
    end
    if tTable then
        gf_PrintTable(tTable)
    end
end

function ck_FinishTask(tEvent, data, para)
    ck_DebugPrint("tEvent = ", tEvent)
    ck_DebugPrint("data = ", data)
    if mg_CheckDate() ~= 1 then
        return
    end

    ck_DebugPrint(format("\n===== ck_FinishTask() nTaskIndex=%d =====", tEvent[4][1]))
    ck_global_set_task_finish(tEvent[4][1])
end

--新加的cdkey任务完成逻辑用事件实现
--旧的任务完成逻辑分散在全世界，可以逐步转移成新实现
t_isolate_user_batch_watch_list = {
    { "event_mission_task_award", { "planttree", "bigtreeprize", -1 }, ck_FinishTask, { 1309, "Tr錸g v� thu ho筩h 1 C﹜ B竧 Nh� L韓" }, },
    { "event_mission_award", { "newbattle", -1, -1, 4 }, ck_FinishTask, { 1310, "Nh薾 thng chi課 trng Nh筺 M玭 Li謙 H醓" }, },
    { "event_mission_award", { "ziyuanzhan", -1, -1, -1 }, ck_FinishTask, { 1311, "Tham gia T鑞g Li猽 T礽 Nguy猲 Chi課 v� nh薾 thng 1 l莕" }, },
    { "event_mission_award", { "ziyuanzhan", -1, -1, -1 }, ck_FinishTask, { 2216, "Tham gia T鑞g Li猽 T礽 Nguy猲 Chi課 v� nh薾 thng 1 l莕" }, },
}

function on_add_watches()
    isolate_watch_npc_talk("Чi S� ho箃 ng", 100, "handle_npc_talk_huodongdashi")
    isolate_watch_npc_talk("Чi S� ho箃 ng", 200, "handle_npc_talk_huodongdashi")
    isolate_watch_npc_talk("Чi S� ho箃 ng", 300, "handle_npc_talk_huodongdashi")
    isolate_watch_event("event_ib_cost", "_handler_event_cost_ib", PackItemId(2, 97, 236))--天骄令消费计数
end

function on_init_ok()
    --!!!!!!变量变更务必留意更新通用条件检测配置activity_interface_condition.txt
    CK_TASK_GROUP = AcivityBase.TaskGroup
    CK_TASK_GROUP.Task1 = 1 --1,2,3位分别表示武林新秀，老战友，活跃着,4-11位勇往直前任务，百战杀怪任务12-16记录,17-21完成,百战副本任务22-26记录，27-31接取
    CK_TASK_GROUP.Task2 = 2 --(新)用于重新组织数据后的百战任务1~31 --(旧)百战副本任务1-5可交，6-10完成，--百战PVP任务11-17记录，18-24接取，25-31可交
    CK_TASK_GROUP.Task3 = 3 --(新)用于重新组织数据后的百战任务1~7  --(旧)百战PVP任务1-7完成,8-10杀怪加成，11-13副本加成，14-16pvp加成, 17+是速战速决任务
    CK_TASK_GROUP.Task4 = 4 --任务标记
    CK_TASK_GROUP.Task5 = 5 --大富翁消费任务计数
    CK_TASK_GROUP.Score = 6 --活跃度
    CK_TASK_GROUP.Award = 7 --按位标记奖励
    isolate_enable_event_dispatch(-1) --打开talk-date的event dispatch开关
end
--活动是否开启
function ck_IsOpen()
    if gDebug:is_debug() == 1 then
        --调试模式
        return 1
    end
    return isolate_in_talk_date(nil, 0);
    --return gf_CheckDuration(CK_START_TIME, CK_END_TIME);
end
function ck_CanAct()
    if gDebug:is_debug() == 1 then
        --调试模式
        return 1
    end
    return isolate_in_talk_date(nil, 1)
    --return gf_CheckDuration(CK_START_TIME, CK_START_ACT);
end

--激活称号
function ck_ActTilte()
    local tSay = {
        "V� L﹎ T﹏ T�/ck_ActTilte_1",
        --		"老战友/ck_ActTilte_2",
        "Ngi N╪g чng/ck_ActTilte_3",
        "\nT玦 ch� xem xem th玦/nothing",
    }
    local _start, _end_act, _end = isolate_get_dates()
    local msg = format("Th阨 gian ng璶g k輈h ho箃 %s", isolate_get_str_date(_end_act));
    --local msg = format("激活截止日期为%d/%d/%d", CK_START_ACT[3], CK_START_ACT[2], CK_START_ACT[1]);
    Say(CK_NPC_NAME .. format("%s mu鑞 k輈h ho箃 danh hi謚 n祇?<color=red>%s<color>", gf_GetPlayerSexName(), msg), getn(tSay), tSay);
end

--活动大使npc会话
function handle_npc_talk_huodongdashi(nNpcIndex)
    local szTitle = format("%s %s", CK_NPC_NAME, "H穣 nhanh ch鉵g m阨 b筺 b� n c飊g ch琲 tr� ch琲 n祇! B筺 b� c祅g nhi襲 th� s� c� th猰 nhi襲 ni襪 vui!")

    local tSay = {
        "Gi韎 thi謚 ho箃 ng/ck_ActInfo",
        "K輈h ho箃 danh hi謚/ck_ActTilte",
        "Ti課 T韎/ck_TaskForward",
        format("%s/#ck_task_group_talk1(1)", "Nhi謒 v� h祅g ng祔"), --"百战不殆任务/ck_BaiZhanBuDai",
        format("%s/#ck_task_group_talk1(2)", "Nhi謒 v� trng th祅h"), --"速战速决任务/ck_FastTask",
        "Nhi謒 v� Чi Ph� g/ck_ZiloTask",
        "Xem 甶觤 n╪g ng/ck_QueryScore",
        "Xem thi猲 ki猽 l謓h  d飊g/cdk_QueryUseTianJiaoLingNum",
        "觤 n╪g ng i ph莕 thng/ck_ScoreAward",
        format("\n%s/nothing", "K誸 th骳 i tho筰"),
    }
    Say(szTitle, getn(tSay), tSay)
end

function on_event_daily_clear(nCurDate, nLastDate)
    ck_DailyReset()
end

function checkUiDate()
    local nDate = gf_TodayDate()
    if nDate >= t_isolate_base_cfg.nTalkBeginDate and nDate <= t_isolate_base_cfg.nEndDate then
        return 1
    end
    return 0
end

function on_event_player_login(nExchangeComing)
    if checkUiDate() == 1 then
        SendShowCDkeyIcon()
    end

    if ck_GetTitleType() == 0 then
        isolate_disable_event_dispatch(PlayerIndex) --关掉没有激活CDKey玩家的所有event dispatch
    end

    ck_get_random_task()
end
--end-------------------------------------------------------------------------把cdkey变成一个isolate


Include("\\script\\function\\cdkey\\ck_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")
Import("\\script\\lib\\date.lua")
Include("\\script\\misc\\taskmanager.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\online_activites\\activity_head.lua")

CK_NPC_NAME = "<color=green> Чi S� ho箃 ng: <color>";

function cdk_QueryUseTianJiaoLingNum()
    Say(CK_NPC_NAME .. format("T鎛g s� Thi猲 Ki猽 L謓h %s  s� d鬾g l�: <color=gold>%d<color> c竔.", gf_GetPlayerSexName(), ck_GetCostIB()), 0);
end

--活动界面领奖调用
function ck_GetTaskAwardByUI(nTaskIndex)
    if checkUiDate() ~= 1 then
        Talk(1, "", "Ho箃 ng  qu� h筺")
        return 0;
    end

    local nRet = 0;
    if not nTaskIndex or nTaskIndex <= 0 then
        return 0;
    end

    if CK_SCROE_AWARD_TABLE[nTaskIndex - CK_TASK_INDEX_BEGIN_SCORE_AWARD + 1] then
        nRet = ck_get_score_award(nTaskIndex - CK_TASK_INDEX_BEGIN_SCORE_AWARD + 1)

    elseif CK_TASK_IB_COST[nTaskIndex - CK_TASK_INDEX_BEGIN_IB + 1] then
        nRet = ck_GetIBTaskAward(nTaskIndex - CK_TASK_INDEX_BEGIN_IB + 1)

    elseif CK_TASK_ZILON_ATRR[nTaskIndex - CK_TASK_INDEX_BEGIN_ZILON + 1] then
        nRet = ck_GetZiloTaskAward(nTaskIndex - CK_TASK_INDEX_BEGIN_ZILON + 1)

    elseif T_CK_TASK_LIST[nTaskIndex] then
        nRet = _ck_task_award(nTaskIndex);

    else
        nRet = 0;
    end

    return nRet or 0;
end

--每日清理
function ck_DailyReset()
    if gDebug:is_debug() ~= 1 then
        --调试模式
        if ck_IsOpen() ~= 1 then
            return 0;
        end
        if ck_GetTitleType() == 0 then
            return 0;
        end
    end

    --重置百战不殆任务
    for i = 12, 31 do
        CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, i, 0);
    end
    CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Task2, 0);
    for i = 1, 16 do
        CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, i, 0);
    end
    --删除百战不殆的任务
    for i = 234, 238 do
        DirectDeleteTask(i)
    end
    ck_task_daily_clear()
end

--获得当天索引
function ck_GetRandIndex(nMax)
    local today = Date();
    local wDay = today:week();
    if wDay == 0 then
        wDay = 7
    end
    return mod(wDay, nMax) + 1;
end

--获取类型
function ck_GetTitleType()
    if IsTitleExist(68, 1) == 1 then
        return 1;
    end

    if IsTitleExist(68, 2) == 1 then
        return 2;
    end

    if IsTitleExist(68, 3) == 1 then
        return 3;
    end

    return 0;
end

--获得贡献度
function ck_GetCkScore()
    return CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score);
end

--增加积分
function ck_AddCkScore(nAdd)
    if not nAdd or nAdd < 0 then
        return 0;
    end
    if CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score) <= 0 then
        -- 第一次增加积分，认为玩家参与了cdkey
        AddRuntimeStat(80, 1, 0, 1)
    end
    CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Score, CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score) + nAdd);
    Msg2Player(format("觤 n╪g ng t╪g %d, t鎛g 甶觤 l� %d", nAdd, CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score)));
end

--活动介绍
function ck_ActInfo(nIndex)
    local strTitle = {
        "Trong th阨 gian ho箃 ng, ngi ch琲 s� nh薾 頲 danh hi謚 ph� h頿 v韎 甶襲 ki謓 c馻 b秐 th﹏. T蕋 c� danh hi謚 u c� hi謚 l鵦 l� 2 th竛g, v� khi nh﹏ v藅 th緋 s竛g danh hi謚 th� kh竛g t蕋 c� s� t╪g 10 甶觤. Ngi ch琲 ph秈 k輈h ho箃 danh hi謚 m韎 c� th� nh薾 nhi謒 v�. Nhi謒 v� Tr╩ Tr薾 Tr╩ Th緉g, m鏸 ng祔 ch� 頲 l祄 1 l莕. Nhi謒 v� T鑓 Chi課 T鑓 Th緉g v� Чi Ph� g th� trong th阨 gian ho箃 ng ch� 頲 ho祅 th祅h 1 l莕. Nhi謒 v� Tr╩ Tr薾 Tr╩ Th緉g c� th� ho祅 th祅h theo c� nh﹏ v� t� i, n誹 t� i th� ph莕 thng s� cao h琻. Ho祅 th祅h c竎 m鬰 nhi謒 v� s� nh薾 頲 甶觤 kinh nghi謒 v�  n╪g ng. T輈h l騳  n╪g ng c� th� i ph莕 thng phong ph�.",
        "Ngi n╪g ng t� i tham gia nhi謒 v� Tr╩ Tr薾 Tr╩ Th緉g c� x竎 su蕋 cao nh蕋 nh薾 頲 ph莕 thng cao.", --和老战友
        "Nhi謒 v� D騨g C秏 Ti課 T韎 ch� xu蕋 hi謓 t筰 server m韎,trong server m韎 ngi ch琲 c蕄 10 v�  k輈h ho箃 danh hi謚 V� L﹎ T﹏ T� m韎 頲 nh薾 nhi謒 v�.Ho祅 th祅h xong nhi謒 v� n祔 v� t n c蕄 90, gamer V� L﹎ T﹏ T� m韎 頲 ti誴 nh薾 nhi謒 v� Tr╩ Tr薾 Tr╩ Th緉g,T鑓 Chi課 T鑓 Th緉g v� Чi Ph� g.",
    }
    local tbSay = {};
    nIndex = nIndex or 1;
    local Msg = strTitle[nIndex];
    if Msg then
        tbSay.msg = CK_NPC_NAME .. Msg;
        tbSay.sel = {
            { "\n r髏 lui", "nothing" },
        };
        if strTitle[nIndex + 1] then
            tinsert(tbSay.sel, 1, { "Trang k�", format("#ck_ActInfo(%d)", nIndex + 1) })
        end
        temp_Talk(tbSay);
    end
end

function ck_ActTilte_1()
    if ck_CanAct() ~= 1 then
        Say(CK_NPC_NAME .. "Th阨 gian k輈h ho箃  k誸 th骳,kh玭g th� k輈h ho箃 danh hi謚 n鱝", 0);
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
        Say(CK_NPC_NAME .. format("Х nh薾 danh hi謚 <color=gold>[%s]<color> r錳", "V� L﹎ T﹏ T�"), 0)
        return 0;
    end

    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
        Say(CK_NPC_NAME .. format("Х nh薾 danh hi謚 <color=gold>[%s]<color> r錳", "Ngi N╪g чng"), 0)
        return 0;
    end
    DebugOutput(GetExtPoint(1), GetExtPoint(2))
    if GetExtPoint(1) ~= 1 and GetExtPoint(2) ~= 1 then
        if CK_ES_SWITCH == 0 then
            Say(CK_NPC_NAME .. "M竬 ch� n祔 t筸 th阨 kh玭g m� nh薾 danh hi謚 <color=gold>V� L﹎ T﹏ T�<color>!", 0);
            --return 0;
        end
        CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 1, 1);
        PayExtPoint(1, 1);
        AddTitle(68, 1);
        SetTitleTime(68, 1, GetTime() + (60 * 24 * 3600));
        Msg2Player(format("Nh薾 頲 danh hi謚 [%s]", "V� L﹎ T﹏ T�"))
        Say(CK_NPC_NAME .. format("Nh薾 頲 danh hi謚 <color=gold>[%s]<color>", "V� L﹎ T﹏ T�"), 0)
        gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 1)");
        isolate_enable_event_dispatch(PlayerIndex) --打开该玩家的所有event dispatch
        ck_get_random_task()
        return 1;
    end
    Say(CK_NPC_NAME .. "Nh﹏ v藅 n祔 kh玭g  甶襲 ki謓, kh玭g th� nh薾 danh hi謚!", 0);
end

function ck_ActTilte_2()
    if ck_CanAct() ~= 1 then
        Say(CK_NPC_NAME .. "Th阨 gian k輈h ho箃  k誸 th骳,kh玭g th� k輈h ho箃 danh hi謚 n鱝", 0);
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
        Say(CK_NPC_NAME .. format("Х nh薾 danh hi謚 <color=gold>[%s]<color> r錳", "V� L﹎ T﹏ T�"), 0)
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 2) ~= 0 then
        Say(CK_NPC_NAME .. format("Х nh薾 danh hi謚 <color=gold>[%s]<color> r錳", "L穙 Chi課 H鱱"), 0)
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
        Say(CK_NPC_NAME .. format("Х nh薾 danh hi謚 <color=gold>[%s]<color> r錳", "Ngi N╪g чng"), 0)
        return 0;
    end
    DebugOutput(GetExtPoint(3), GetExtPoint(4))
    if GetExtPoint(3) == 1 and GetExtPoint(4) ~= 1 then
        CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 2, 1);
        PayExtPoint(3, 1);
        AddTitle(68, 2);
        SetTitleTime(68, 2, GetTime() + (60 * 24 * 3600));
        Msg2Player(format("Nh薾 頲 danh hi謚 [%s]", "L穙 Chi課 H鱱"))
        Say(CK_NPC_NAME .. format("Nh薾 頲 danh hi謚 <color=gold>[%s]<color>", "L穙 Chi課 H鱱"), 0)
        gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 2)");
        isolate_enable_event_dispatch(PlayerIndex) --打开该玩家的所有event dispatch
        ck_get_random_task()
        return 1;
    end
    Say(CK_NPC_NAME .. "Nh﹏ v藅 n祔 kh玭g  甶襲 ki謓, kh玭g th� nh薾 danh hi謚!", 0);
end

function ck_ActTilte_3()
    if ck_CanAct() ~= 1 then
        Say(CK_NPC_NAME .. "Th阨 gian k輈h ho箃  k誸 th骳,kh玭g th� k輈h ho箃 danh hi謚 n鱝", 0);
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
        Say(CK_NPC_NAME .. format("Х nh薾 danh hi謚 <color=gold>[%s]<color> r錳", "V� L﹎ T﹏ T�"), 0)
        return 0;
    end

    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
        Say(CK_NPC_NAME .. format("Х nh薾 danh hi謚 <color=gold>[%s]<color> r錳", "Ngi N╪g чng"), 0)
        return 0;
    end
    DebugOutput(GetExtPoint(5), GetExtPoint(6))
    if GetExtPoint(5) == 1 and GetExtPoint(6) ~= 1 then
        CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 3, 1);
        PayExtPoint(5, 1);
        AddTitle(68, 3);
        SetTitleTime(68, 3, GetTime() + (60 * 24 * 3600));
        Msg2Player(format("Nh薾 頲 danh hi謚 [%s]", "Ngi N╪g чng"))
        Say(CK_NPC_NAME .. format("Nh薾 頲 danh hi謚 <color=gold>[%s]<color>", "Ngi N╪g чng"), 0)
        gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 3)");
        isolate_enable_event_dispatch(PlayerIndex) --打开该玩家的所有event dispatch
        ck_get_random_task()
        return 1;
    end
    Say(CK_NPC_NAME .. "Nh﹏ v藅 n祔 kh玭g  甶襲 ki謓, kh玭g th� nh薾 danh hi謚!", 0);
end

function ck_TaskForward_finish()
    local nRebornLv = gf_GetPlayerRebornCount()
    local nLevel = nRebornLv * 100 + GetLevel()
    local nFaction = GetPlayerFaction()
    if nFaction ~= 0 and nLevel < 90 then
        SetLevel(90, 1);                                  --90级
        Msg2Player("T╪g th祅h c玭g!");
        Talk(1, "", "<color=yellow>T╪g th祅h c玭g, h穣 ng nh藀 l筰!<color>")
        PlaySound("\\sound\\sound_i016.wav");
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
    else
        Talk(1, "", "<color=red>C莕 di c蕄 90 v�  gia nh藀 m玭 ph竔!<color>")
    end
end

--Task1:4-11位勇往直前任务
function ck_TaskForward()
    if CK_ES_SWITCH == 0 then
        Say(CK_NPC_NAME .. "M竬 ch� n祔 t筸 th阨 kh玭g m� chu鏸 nhi謒 v� <color=red>D騨g C秏 Ti課 T韎<color>", 0)
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 1 then
        Say(CK_NPC_NAME .. format("Ch� c� <color=gold>[%s]<color> m韎 頲 nh薾 nhi謒 v� n祔", "V� L﹎ T﹏ T�"), 0)
        return 0;
    end
    if GetLevel() >= 90 or gf_GetPlayerRebornCount() > 0 then
        Say(CK_NPC_NAME .. "Nh﹏ v藅 c蕄 90 tr� l猲 ho芻  chuy觧 sinh kh玭g th� tham gia nhi謒 v� n祔!", 0);
        return 0;
    end
    local tSay = {}

    tinsert(tSay, "\nT╪g c蕄 ngay!/ck_TaskForward_finish");
    tinsert(tSay, "\nT玦 ch� xem xem th玦/nothing");
    Say(CK_NPC_NAME .. "Nhi謒 v� D騨g C秏 Ti課 T韎 c� th� gi髉 ngi nhanh ch鉵g t╪g c蕄!" .. "<color=gold>Nh﹏ v藅 di Lv90 v�  k輈h ho箃 code, ch� c莕 gia nh藀 m玭 ph竔, s� t╪g ngay n Lv90!<color>", getn(tSay), tSay);
end

function ck_TaskFoward_do(nTaskID, nTaskIndex)
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex) ~= 0 then
        Say(CK_NPC_NAME .. "Nhi謒 v� n祔  ho祅 th祅h!", 0);
        return 0;
    end
    if nTaskIndex > 4 and CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex - 1) ~= 1 then
        Say(CK_NPC_NAME .. "Ch璦 ho祅 th祅h nhi謒 v� trc ", 0);
        return 0;
    end
    if tGtTask:check_cur_task(nTaskID) == 0 then
        DirectGetGTask(nTaskID, 1)
    else
        if DirectIsTaskFinish(nTaskID) then
            if 1 == DirectFinishGTask(nTaskID, 2) then
                CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex, 1);
                Msg2Player("Х ho祅 th祅h nhi謒 v�!")
            else
                Msg2Player("Nhi謒 v� kh竎 thng, kh玭g th� ho祅 th祅h!");
            end
        else
            Say(CK_NPC_NAME .. "Nhi謒 v� v蒼 ch璦 ho祅 th祅h!", 0);
        end
    end
end

--勇往直前奖励(对外)
function ck_TaskForward_Award()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    if GetLevel() < 90 and gf_GetPlayerRebornCount() <= 0 then
        SetLevel(90, 1);
        PlaySound("\\sound\\sound_i016.wav");
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
        Say(CK_NPC_NAME .. format("Ъng c蕄 nh﹏ v藅  n﹏g cao n %d c蕄, xin ng nh藀 l筰!", 90), 1, "Жng nh藀 l筰/ExitGame");
    end
end

function ck_CheckCondition(bHideMsg)
    if gDebug:is_debug() == 1 then
        --调试模式
        return 1
    end
    local nKind = ck_GetTitleType();
    if nKind == 0 then
        if not bHideMsg then
            Say(CK_NPC_NAME .. "V蒼 ch璦 nh薾 v� k輈h ho箃 danh hi謚 n祇, kh玭g th� tham gia nhi謒 v�!", 0);
        end
        return 0;
    end
    if GetLevel() < 90 and gf_GetPlayerRebornCount() <= 0 then
        if not bHideMsg then
            Say(CK_NPC_NAME .. format("Щng c蕄 nh﹏ v藅 kh玭g  %d c蕄, kh玭g th� tham gia nhi謒 v� !", 90), 0);
        end
        return 0;
    end
    return 1;
end

function ck_BaiZhanBuDai()
    if ck_CheckCondition() ~= 1 then
        return 0;
    end
    local tSay = {
        --"\n杀怪任务/ck_BZBD_Kill",
        format("\n%s/#ck_task_group_talk2(1,1)", "Nhi謒 v� Th� L鵦 Ba Phe"),
        format("\n%s/#ck_task_group_talk2(1,2)", "Nhi謒 v� ph� b秐"),
        format("\n%s/#ck_task_group_talk2(1,3)", "Nhi謒 v� PVP"),
        --"\n副本任务/ck_BZBD_Raid",
        --"\nPVP任务/ck_BZBD_PVP",
        "\nT玦 ch� xem xem th玦/nothing",
    }
    Say(CK_NPC_NAME .. "Nhi謒 v� <color=gold>Tr╩ Tr薾 Tr╩ Th緉g<color>, nh薾 ng蓇 nhi猲 h籲g ng祔, nh薾 頲 nhi襲 kinh nghi謒 v�  n╪g ng!", getn(tSay), tSay);
end

--Task3：加成
function ck_BZBD_GetType(nIndex1, nIndex2, nIndex3)
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex3) == 1 then
        return 0.8;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex2) == 1 then
        return 0.8;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex1) == 1 then
        return 0.8;
    end
    return 0;
end

function ck_BZBD_SetType(nIndex1, nIndex2, nIndex3)
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex1, 0)
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 0)
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex3, 0)
    local nSize = gf_GetTeamSize();
    if nSize <= 1 then
        return 0;
    end
    --print("nSize =", nSize)
    local oldPlayerIndex = PlayerIndex;
    local nSelfType = ck_GetTitleType();
    if nSelfType == 0 then
        return 0;
    end
    --print("nSelfType =", nSelfType)
    if nSelfType == 1 then
        for i = 1, nSize do
            PlayerIndex = GetTeamMember(i);
            if PlayerIndex ~= oldPlayerIndex then
                if ck_GetTitleType() == 1 then
                    PlayerIndex = oldPlayerIndex
                    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex3, 1)
                    return 1;
                end
            end
        end
    end
    if nSelfType == 2 then
        for i = 1, nSize do
            PlayerIndex = GetTeamMember(i);
            if PlayerIndex ~= oldPlayerIndex then
                if ck_GetTitleType() == 3 then
                    PlayerIndex = oldPlayerIndex
                    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 1)
                    return 1;
                end
            end
        end
    end
    if nSelfType == 3 then
        for i = 1, nSize do
            PlayerIndex = GetTeamMember(i);
            if PlayerIndex ~= oldPlayerIndex then
                if ck_GetTitleType() == 3 then
                    PlayerIndex = oldPlayerIndex
                    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex1, 1)
                end
                if ck_GetTitleType() == 2 then
                    PlayerIndex = oldPlayerIndex
                    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 1)
                end
            end
        end
    end
    PlayerIndex = oldPlayerIndex;
    --print("nIndex1 =", CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex1))
    --print("nIndex2 =", CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex2))
    --print("nIndex3 =", CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex3))
end

--杀怪任务奖励(对外)
function ck_BZBD_Kill_Award()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    local nParam = ck_BZBD_GetType(8, 9, 10);
    gf_ModifyExp(floor(3000000 * (1 + nParam)));
    ck_AddCkScore(floor(10 * (1 + nParam)));
end

--杀怪任务对外接口
--仅设置加成系数
function _ck_BZBD_Kill_Set()
    --print("_ck_BZBD_Kill_Set()")
    gf_TeamOperateEX(function()
        if ck_IsOpen() ~= 1 then
            return 0;
        end
        if ck_GetTitleType() == 0 then
            return 0;
        end
        local nCount = 0;
        local nTaskIndex = 0;
        for i = 12, 16 do
            --print(i, CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i))
            if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) ~= 0 then
                nCount = nCount + 1;
                nTaskIndex = i - 11;
            end
        end
        --print("nCount =", nCount)
        if nCount ~= 2 then
            return 0;
        end
        ck_BZBD_SetType(8, 9, 10);
    end);
end


--使用白驹丸
function _ck_UseItemBaiJu()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 21, 1);
end

--使用三清丸
function _ck_UseItemSanQing()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 22, 1);
end

--使用六神丸
function _ck_UseItemLiuShen()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 23, 1);
end


--种植小般若树种
function _ck_PlantSmallBanRuo()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 25, 1);
end

TASKID_NVWA_BOX_USECOUNT = 3537 --手动加入taskmanager中对应的group里
--使用女娲宝盒
function _ck_UseItemNvWa()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 27, 1);

    local nUse = GetTask(TASKID_NVWA_BOX_USECOUNT)
    SetTask(TASKID_NVWA_BOX_USECOUNT, nUse + 1)
    if nUse + 1 >= 10 then
        ck_global_set_task_finish(2214)
    end
end

--使用幸运星
function _ck_UseItemLuckyStart()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 28, 1);
end

TASKID_CDK_FIRECRAKER_USE_COUNT = 3607
TASKID_DC_CDK_FIRECRAKER_USE_COUNT = 3608

--使用胜利爆竹
function _ck_UseItemFirecraker()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end

    local nUse = GetTask(TASKID_CDK_FIRECRAKER_USE_COUNT) + 1
    local nUseDaily = GetTask(TASKID_DC_CDK_FIRECRAKER_USE_COUNT) + 1
    SetTask(TASKID_CDK_FIRECRAKER_USE_COUNT, nUse)
    SetTask(TASKID_DC_CDK_FIRECRAKER_USE_COUNT, nUseDaily)
    if nUse >= 50 then
        ck_global_set_task_finish(2215);
    end
    if nUseDaily >= 50 then
        ck_global_set_task_finish(1308);
    end
end

function ck_ZiloTask()
    if ck_CheckCondition() ~= 1 then
        return 0;
    end
    local tSay = {
        "\nNhi謒 v� t輈h l騳 thu閏 t輓h/ck_ZiloTask_1",
        "\nNhi謒 v� ti猽 ph� Thi猲 Ki猽 L謓h/ck_ZiloTask_2",
        "\nT玦 ch� xem xem th玦/nothing",
    }
    Say(CK_NPC_NAME .. "Nhi謒 v� <color=gold>Чi Ph� g<color>, trong th阨 gian ho箃 ng ch� 頲 ho祅 th祅h 1 l莕, c� th� nh薾 頲 nhi襲 kinh nghi謒 v�  n╪g ng!", getn(tSay), tSay);
end

--Task4：1-7完成情况
function ck_ZiloTask_1(bTalk)
    local nTaskIndex = 0;
    for i = CK_TASK_ZILON_ATRR_BEGIN, getn(CK_TASK_ZILON_ATRR) do
        if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, i) ~= 1 then
            nTaskIndex = i;
            break ;
        end
    end
    if nTaskIndex == 0 then
        Say(CK_NPC_NAME .. format("Ch骳 m鮪g %s  ho祅 th祅h to祅 b� <color=gold>nhi謒 v� t輈h l騳 thu閏 t輓h<color>!", gf_GetPlayerSexName()), 0)
        return 0;
    end
    local tCell = CK_TASK_ZILON_ATRR[nTaskIndex];
    if not tCell then
        return 0;
    end
    if not bTalk then
        local tSay = {
            "\nTa mu鑞 ho祅 th祅h/#ck_ZiloTask_1(1)",
            "\nT玦 ch� xem xem th玦/nothing",
        }
        local Str = format("Nh﹏ v藅  t chuy觧 sinh %d c蕄 %d, t輈h l騳 %d 甶觤 danh v鋘g, %d 甶觤 s� m玭, %d 甶觤 c玭g tr筺g", tCell[2][1], tCell[2][2], tCell[2][3], tCell[2][4], tCell[2][5]);
        local Msg = format("T猲 nhi謒 v�: <color=gold>%s<color>\n襲 ki謓 nhi謒 v�:\n  %s\nHng d蒼 nhi謒 v�:\n  %s\nPh莕 thng nhi謒 v�:\n觤 kinh nghi謒: %d,  n╪g ng: %d", tCell[1], Str, "N� l鵦 t輈h l騳 s� gi髉 b秐 th﹏ ng祔 c祅g l韓 m筺h", tCell[3][1], tCell[3][2]);
        Say(CK_NPC_NAME .. Msg, getn(tSay), tSay);
        return 0;
    end

    if ck_GetZiloTaskAward(nTaskIndex) == 1 then
        ck_ZiloTask_1();
    end
end

function ck_GetZiloTaskAward(nTaskIndex)
    if ck_CheckCondition() ~= 1 then
        return 0;
    end

    if not nTaskIndex
            or nTaskIndex < CK_TASK_ZILON_ATRR_BEGIN
            or nTaskIndex > getn(CK_TASK_ZILON_ATRR) then
        return 0;
    end

    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, nTaskIndex) ~= 0 then
        Say(CK_NPC_NAME .. "Х ho祅 th祅h nhi謒 v� n祔!", 0);
        return 0;
    end

    local tCell = CK_TASK_ZILON_ATRR[nTaskIndex];
    if not tCell then
        return 0;
    end

    if gf_GetPlayerRebornCount() < tCell[2][1] then
        Say(CK_NPC_NAME .. format("C蕄 chuy觧 sinh c馻 %s kh玭g  <color=red>%d<color>", gf_GetPlayerSexName(), tCell[2][1]), 0);
        return 0;
    end
    if GetLevel() < tCell[2][2] and gf_GetPlayerRebornCount() <= tCell[2][1] then
        Say(CK_NPC_NAME .. format("Ъng c蕄 c馻 %s kh玭g  <color=red>%d<color>", gf_GetPlayerSexName(), tCell[2][2]), 0);
        return 0;
    end
    if GetReputation() < tCell[2][3] then
        Say(CK_NPC_NAME .. format("觤 t輈h l騳 danh v鋘g c馻 %s kh玭g  <color=red>%d<color> 甶觤", gf_GetPlayerSexName(), tCell[2][3]), 0);
        return 0;
    end
    if GetTask(336) < tCell[2][4] then
        Say(CK_NPC_NAME .. format("觤 t輈h l騳 s� m玭 c馻 %s kh玭g  <color=red>%d<color> 甶觤", gf_GetPlayerSexName(), tCell[2][4]), 0);
        return 0;
    end
    if abs(GetTask(701)) < tCell[2][5] then
        Say(CK_NPC_NAME .. format("觤 t輈h l騳 c玭g tr筺g c馻 %s kh玭g  <color=red>%d<color> 甶觤", gf_GetPlayerSexName(), tCell[2][5]), 0);
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task4, nTaskIndex, 1);
    --奖励
    gf_ModifyExp(tCell[3][1]);
    ck_AddCkScore(tCell[3][2]);
    Msg2Player("Nhi謒 v� ho祅 th祅h!");

    return 1;
end

--Task4：8-12完成情况
function ck_ZiloTask_2(bTalk)
    local nTaskIndex = 0;
    for i = CK_TASK_IB_COST_BEGIN, CK_TASK_IB_COST_BEGIN + getn(CK_TASK_IB_COST) - 1 do
        if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, i) ~= 1 then
            nTaskIndex = i - CK_TASK_IB_COST_BEGIN + 1;
            break ;
        end
    end
    if nTaskIndex == 0 then
        Say(CK_NPC_NAME .. format("Ch骳 m鮪g %s  ho祅 th祅h to祅 b� <color=gold>nhi謒 v� ti猽 ph�<color>!", gf_GetPlayerSexName()), 0)
        return 0;
    end
    local tCell = CK_TASK_IB_COST[nTaskIndex];
    if not tCell then
        return 0;
    end
    if not bTalk then
        local tSay = {
            "\nTa mu鑞 ho祅 th祅h/#ck_ZiloTask_2(1)",
            "\nT玦 ch� xem xem th玦/nothing",
        }
        local Str = format("Trong 秈 b蕋 k� c馻 мa Huy襫 Cung, V筺 Ki誱 Tr騨g, Lng S琻 v� Th竔 Nh蕋 Th竝 t輈h l騳 s� d鬾g %d Thi猲 Ki猽 L謓h  m� rng", tCell[2]);
        local Msg = format("T猲 nhi謒 v�: <color=gold>%s<color>\n襲 ki謓 nhi謒 v�:\n  %s\nHng d蒼 nhi謒 v�:\n  %s\nPh莕 thng nhi謒 v�:\n觤 kinh nghi謒: %d,  n╪g ng: %d", tCell[1], Str, "D飊g Thi猲 Ki猽 L謓h  m� rng s� nh薾 頲 ph莕 thng phong ph�", tCell[3][1], tCell[3][2]);
        Say(CK_NPC_NAME .. Msg, getn(tSay), tSay);
        return 0;
    end

    if ck_GetIBTaskAward(nTaskIndex) == 1 then
        ck_ZiloTask_2();
    end
end

function ck_GetIBTaskAward(nTaskIndex)
    if ck_CheckCondition() ~= 1 then
        return 0;
    end

    if not nTaskIndex
            or nTaskIndex <= 0
            or nTaskIndex > getn(CK_TASK_IB_COST) then
        return 0;
    end

    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, CK_TASK_IB_COST_BEGIN + nTaskIndex - 1) ~= 0 then
        Say(CK_NPC_NAME .. "Х ho祅 th祅h nhi謒 v� n祔!", 0);
        return 0;
    end

    local tCell = CK_TASK_IB_COST[nTaskIndex];
    if not tCell then
        return 0;
    end

    if ck_GetCostIB() < tCell[2] then
        Say(CK_NPC_NAME .. format("� 秈 hi謓 t筰, s� lng Thi猲 Ki猽 L謓h do %s ti猽 ph� kh玭g  <color=red>%d<color> c竔", gf_GetPlayerSexName(), tCell[2]), 0);
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task4, CK_TASK_IB_COST_BEGIN + nTaskIndex - 1, 1);
    --奖励
    gf_ModifyExp(tCell[3][1]);
    ck_AddCkScore(tCell[3][2]);
    Msg2Player("Nhi謒 v� ho祅 th祅h!");

    return 1
end

--关卡消费天骄令Task5
function ck_GetCostIB()
    return CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Task5);
end

--关卡消费对外接口Task5
function _ck_SetCostIB(nNum)
    if ck_IsOpen() ~= 1 then
        --print("SetCostIB",nNum,"not open")
        return 0;
    end
    if ck_GetTitleType() == 0 then
        --print("SetCostIB",nNum,"no titile")
        return 0;
    end
    nNum = nNum or 1;
    --print("GetCostIB",ck_GetCostIB(),CK_TASK_GROUP.Task5)
    CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Task5, ck_GetCostIB() + tonumber(nNum));
end

function ck_QueryScore()
    Say(CK_NPC_NAME .. format("%s b﹜ gi� 甶觤 n╪g ng l� <color=gold>%d<color>!", gf_GetPlayerSexName(), ck_GetCkScore()), 0);
end

function ck_ScoreAward()
    local nScore = ck_GetCkScore();
    local tMsg = {
        [0] = "Ch璦 nh薾",
        [1] = "Х nh薾",
    }
    local tSay = {};
    for i = 1, getn(CK_SCROE_AWARD_TABLE) do
        local nAwardedFlagId = CK_SCROE_AWARD_TABLE[i][1][7];
        --local nType = CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, i);
        local nType = ActCheckCondition(nAwardedFlagId)
        tinsert(tSay, format("Thng 甶觤 n╪g ng t %d (%s)/#ck_view_score_award(%d)", CK_SCROE_AWARD_TABLE[i][1][1], tMsg[nType], i));
    end
    tinsert(tSay, "T筰 h� ch� xem qua th玦/nothing");
    Say(CK_NPC_NAME .. format("觤 n╪g ng hi謓 t筰 c馻 %s l� <color=gold>%d<color>, h穣 ch鋘 ph莕 thng mu鑞 nh薾!", gf_GetPlayerSexName(), nScore), getn(tSay), tSay);
end

function ActiveTitle(nType)
    --print("111111111111")
    if nType == 0 then
        ck_ActTilte_1()
    elseif nType == 1 then
        ck_ActTilte_3()
    end
end

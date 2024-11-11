--begin-------------------------------------------------------------------------��cdkey���һ��isolate
Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\script\\ksgvn\\lib.lua")
t_isolate_base_cfg = { --����һ������������
    nPriority = 1, --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName = "cdkey",
    szViewName = "Chu T��c L�nh " .. EVENT_CODE_PERIOD,
    nTalkBeginDate = EVENT_CODE_TALK_BEGIN_DATE,
    nBeginDate = EVENT_CODE_BEGIN_DATE,
    nEndDate = EVENT_CODE_END_DATE,
    nTaskGroup = 9, --!!!�޸�cdk���nTaskGroup������»��������
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

--�¼ӵ�cdkey��������߼����¼�ʵ��
--�ɵ���������߼���ɢ��ȫ���磬������ת�Ƴ���ʵ��
t_isolate_user_batch_watch_list = {
    { "event_mission_task_award", { "planttree", "bigtreeprize", -1 }, ck_FinishTask, { 1309, "Tr�ng v� thu ho�ch 1 C�y B�t Nh� L�n" }, },
    { "event_mission_award", { "newbattle", -1, -1, 4 }, ck_FinishTask, { 1310, "Nh�n th��ng chi�n tr��ng Nh�n M�n Li�t H�a" }, },
    { "event_mission_award", { "ziyuanzhan", -1, -1, -1 }, ck_FinishTask, { 1311, "Tham gia T�ng Li�u T�i Nguy�n Chi�n v� nh�n th��ng 1 l�n" }, },
    { "event_mission_award", { "ziyuanzhan", -1, -1, -1 }, ck_FinishTask, { 2216, "Tham gia T�ng Li�u T�i Nguy�n Chi�n v� nh�n th��ng 1 l�n" }, },
}

function on_add_watches()
    isolate_watch_npc_talk("��i S� ho�t ��ng", 100, "handle_npc_talk_huodongdashi")
    isolate_watch_npc_talk("��i S� ho�t ��ng", 200, "handle_npc_talk_huodongdashi")
    isolate_watch_npc_talk("��i S� ho�t ��ng", 300, "handle_npc_talk_huodongdashi")
    isolate_watch_event("event_ib_cost", "_handler_event_cost_ib", PackItemId(2, 97, 236))--�콾�����Ѽ���
end

function on_init_ok()
    --!!!!!!�����������������ͨ�������������activity_interface_condition.txt
    CK_TASK_GROUP = AcivityBase.TaskGroup
    CK_TASK_GROUP.Task1 = 1 --1,2,3λ�ֱ��ʾ�������㣬��ս�ѣ���Ծ��,4-11λ����ֱǰ���񣬰�սɱ������12-16��¼,17-21���,��ս��������22-26��¼��27-31��ȡ
    CK_TASK_GROUP.Task2 = 2 --(��)����������֯���ݺ�İ�ս����1~31 --(��)��ս��������1-5�ɽ���6-10��ɣ�--��սPVP����11-17��¼��18-24��ȡ��25-31�ɽ�
    CK_TASK_GROUP.Task3 = 3 --(��)����������֯���ݺ�İ�ս����1~7  --(��)��սPVP����1-7���,8-10ɱ�ּӳɣ�11-13�����ӳɣ�14-16pvp�ӳ�, 17+����ս�پ�����
    CK_TASK_GROUP.Task4 = 4 --������
    CK_TASK_GROUP.Task5 = 5 --���������������
    CK_TASK_GROUP.Score = 6 --��Ծ��
    CK_TASK_GROUP.Award = 7 --��λ��ǽ���
    isolate_enable_event_dispatch(-1) --��talk-date��event dispatch����
end
--��Ƿ���
function ck_IsOpen()
    if gDebug:is_debug() == 1 then
        --����ģʽ
        return 1
    end
    return isolate_in_talk_date(nil, 0);
    --return gf_CheckDuration(CK_START_TIME, CK_END_TIME);
end
function ck_CanAct()
    if gDebug:is_debug() == 1 then
        --����ģʽ
        return 1
    end
    return isolate_in_talk_date(nil, 1)
    --return gf_CheckDuration(CK_START_TIME, CK_START_ACT);
end

--����ƺ�
function ck_ActTilte()
    local tSay = {
        "V� L�m T�n T�/ck_ActTilte_1",
        --		"��ս��/ck_ActTilte_2",
        "Ng��i N�ng ��ng/ck_ActTilte_3",
        "\nT�i ch� xem xem th�i/nothing",
    }
    local _start, _end_act, _end = isolate_get_dates()
    local msg = format("Th�i gian ng�ng k�ch ho�t %s", isolate_get_str_date(_end_act));
    --local msg = format("�����ֹ����Ϊ%d/%d/%d", CK_START_ACT[3], CK_START_ACT[2], CK_START_ACT[1]);
    Say(CK_NPC_NAME .. format("%s mu�n k�ch ho�t danh hi�u n�o?<color=red>%s<color>", gf_GetPlayerSexName(), msg), getn(tSay), tSay);
end

--���ʹnpc�Ự
function handle_npc_talk_huodongdashi(nNpcIndex)
    local szTitle = format("%s %s", CK_NPC_NAME, "H�y nhanh ch�ng m�i b�n b� ��n c�ng ch�i tr� ch�i n�o! B�n b� c�ng nhi�u th� s� c� th�m nhi�u ni�m vui!")

    local tSay = {
        "Gi�i thi�u ho�t ��ng/ck_ActInfo",
        "K�ch ho�t danh hi�u/ck_ActTilte",
        "Ti�n T�i/ck_TaskForward",
        format("%s/#ck_task_group_talk1(1)", "Nhi�m v� h�ng ng�y"), --"��ս��������/ck_BaiZhanBuDai",
        format("%s/#ck_task_group_talk1(2)", "Nhi�m v� tr��ng th�nh"), --"��ս�پ�����/ck_FastTask",
        "Nhi�m v� ��i Ph� �ng/ck_ZiloTask",
        "Xem �i�m n�ng ��ng/ck_QueryScore",
        "Xem thi�n ki�u l�nh �� d�ng/cdk_QueryUseTianJiaoLingNum",
        "�i�m n�ng ��ng ��i ph�n th��ng/ck_ScoreAward",
        format("\n%s/nothing", "K�t th�c ��i tho�i"),
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
        isolate_disable_event_dispatch(PlayerIndex) --�ص�û�м���CDKey��ҵ�����event dispatch
    end

    ck_get_random_task()
end
--end-------------------------------------------------------------------------��cdkey���һ��isolate


Include("\\script\\function\\cdkey\\ck_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")
Import("\\script\\lib\\date.lua")
Include("\\script\\misc\\taskmanager.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\online_activites\\activity_head.lua")

CK_NPC_NAME = "<color=green> ��i S� ho�t ��ng: <color>";

function cdk_QueryUseTianJiaoLingNum()
    Say(CK_NPC_NAME .. format("T�ng s� Thi�n Ki�u L�nh %s �� s� d�ng l�: <color=gold>%d<color> c�i.", gf_GetPlayerSexName(), ck_GetCostIB()), 0);
end

--������콱����
function ck_GetTaskAwardByUI(nTaskIndex)
    if checkUiDate() ~= 1 then
        Talk(1, "", "Ho�t ��ng �� qu� h�n")
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

--ÿ������
function ck_DailyReset()
    if gDebug:is_debug() ~= 1 then
        --����ģʽ
        if ck_IsOpen() ~= 1 then
            return 0;
        end
        if ck_GetTitleType() == 0 then
            return 0;
        end
    end

    --���ð�ս��������
    for i = 12, 31 do
        CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, i, 0);
    end
    CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Task2, 0);
    for i = 1, 16 do
        CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, i, 0);
    end
    --ɾ����ս����������
    for i = 234, 238 do
        DirectDeleteTask(i)
    end
    ck_task_daily_clear()
end

--��õ�������
function ck_GetRandIndex(nMax)
    local today = Date();
    local wDay = today:week();
    if wDay == 0 then
        wDay = 7
    end
    return mod(wDay, nMax) + 1;
end

--��ȡ����
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

--��ù��׶�
function ck_GetCkScore()
    return CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score);
end

--���ӻ���
function ck_AddCkScore(nAdd)
    if not nAdd or nAdd < 0 then
        return 0;
    end
    if CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score) <= 0 then
        -- ��һ�����ӻ��֣���Ϊ��Ҳ�����cdkey
        AddRuntimeStat(80, 1, 0, 1)
    end
    CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Score, CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score) + nAdd);
    Msg2Player(format("�i�m n�ng ��ng t�ng %d, t�ng �i�m l� %d", nAdd, CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score)));
end

--�����
function ck_ActInfo(nIndex)
    local strTitle = {
        "Trong th�i gian ho�t ��ng, ng��i ch�i s� nh�n ���c danh hi�u ph� h�p v�i �i�u ki�n c�a b�n th�n. T�t c� danh hi�u ��u c� hi�u l�c l� 2 th�ng, v� khi nh�n v�t th�p s�ng danh hi�u th� kh�ng t�t c� s� t�ng 10 �i�m. Ng��i ch�i ph�i k�ch ho�t danh hi�u m�i c� th� nh�n nhi�m v�. Nhi�m v� Tr�m Tr�n Tr�m Th�ng, m�i ng�y ch� ���c l�m 1 l�n. Nhi�m v� T�c Chi�n T�c Th�ng v� ��i Ph� �ng th� trong th�i gian ho�t ��ng ch� ���c ho�n th�nh 1 l�n. Nhi�m v� Tr�m Tr�n Tr�m Th�ng c� th� ho�n th�nh theo c� nh�n v� t� ��i, n�u t� ��i th� ph�n th��ng s� cao h�n. Ho�n th�nh c�c m�c nhi�m v� s� nh�n ���c �i�m kinh nghi�m v� �� n�ng ��ng. T�ch l�y �� n�ng ��ng c� th� ��i ph�n th��ng phong ph�.",
        "Ng��i n�ng ��ng t� ��i tham gia nhi�m v� Tr�m Tr�n Tr�m Th�ng c� x�c su�t cao nh�t nh�n ���c ph�n th��ng cao.", --����ս��
        "Nhi�m v� D�ng C�m Ti�n T�i ch� xu�t hi�n t�i server m�i,trong server m�i ng��i ch�i c�p 10 v� �� k�ch ho�t danh hi�u V� L�m T�n T� m�i ���c nh�n nhi�m v�.Ho�n th�nh xong nhi�m v� n�y v� ��t ��n c�p 90, gamer V� L�m T�n T� m�i ���c ti�p nh�n nhi�m v� Tr�m Tr�n Tr�m Th�ng,T�c Chi�n T�c Th�ng v� ��i Ph� �ng.",
    }
    local tbSay = {};
    nIndex = nIndex or 1;
    local Msg = strTitle[nIndex];
    if Msg then
        tbSay.msg = CK_NPC_NAME .. Msg;
        tbSay.sel = {
            { "\n r�t lui", "nothing" },
        };
        if strTitle[nIndex + 1] then
            tinsert(tbSay.sel, 1, { "Trang k�", format("#ck_ActInfo(%d)", nIndex + 1) })
        end
        temp_Talk(tbSay);
    end
end

function ck_ActTilte_1()
    if ck_CanAct() ~= 1 then
        Say(CK_NPC_NAME .. "Th�i gian k�ch ho�t �� k�t th�c,kh�ng th� k�ch ho�t danh hi�u n�a", 0);
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
        Say(CK_NPC_NAME .. format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "V� L�m T�n T�"), 0)
        return 0;
    end

    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
        Say(CK_NPC_NAME .. format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "Ng��i N�ng ��ng"), 0)
        return 0;
    end
    DebugOutput(GetExtPoint(1), GetExtPoint(2))
    if GetExtPoint(1) ~= 1 and GetExtPoint(2) ~= 1 then
        if CK_ES_SWITCH == 0 then
            Say(CK_NPC_NAME .. "M�y ch� n�y t�m th�i kh�ng m� nh�n danh hi�u <color=gold>V� L�m T�n T�<color>!", 0);
            --return 0;
        end
        CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 1, 1);
        PayExtPoint(1, 1);
        AddTitle(68, 1);
        SetTitleTime(68, 1, GetTime() + (60 * 24 * 3600));
        Msg2Player(format("Nh�n ���c danh hi�u [%s]", "V� L�m T�n T�"))
        Say(CK_NPC_NAME .. format("Nh�n ���c danh hi�u <color=gold>[%s]<color>", "V� L�m T�n T�"), 0)
        gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 1)");
        isolate_enable_event_dispatch(PlayerIndex) --�򿪸���ҵ�����event dispatch
        ck_get_random_task()
        return 1;
    end
    Say(CK_NPC_NAME .. "Nh�n v�t n�y kh�ng �� �i�u ki�n, kh�ng th� nh�n danh hi�u!", 0);
end

function ck_ActTilte_2()
    if ck_CanAct() ~= 1 then
        Say(CK_NPC_NAME .. "Th�i gian k�ch ho�t �� k�t th�c,kh�ng th� k�ch ho�t danh hi�u n�a", 0);
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
        Say(CK_NPC_NAME .. format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "V� L�m T�n T�"), 0)
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 2) ~= 0 then
        Say(CK_NPC_NAME .. format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "L�o Chi�n H�u"), 0)
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
        Say(CK_NPC_NAME .. format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "Ng��i N�ng ��ng"), 0)
        return 0;
    end
    DebugOutput(GetExtPoint(3), GetExtPoint(4))
    if GetExtPoint(3) == 1 and GetExtPoint(4) ~= 1 then
        CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 2, 1);
        PayExtPoint(3, 1);
        AddTitle(68, 2);
        SetTitleTime(68, 2, GetTime() + (60 * 24 * 3600));
        Msg2Player(format("Nh�n ���c danh hi�u [%s]", "L�o Chi�n H�u"))
        Say(CK_NPC_NAME .. format("Nh�n ���c danh hi�u <color=gold>[%s]<color>", "L�o Chi�n H�u"), 0)
        gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 2)");
        isolate_enable_event_dispatch(PlayerIndex) --�򿪸���ҵ�����event dispatch
        ck_get_random_task()
        return 1;
    end
    Say(CK_NPC_NAME .. "Nh�n v�t n�y kh�ng �� �i�u ki�n, kh�ng th� nh�n danh hi�u!", 0);
end

function ck_ActTilte_3()
    if ck_CanAct() ~= 1 then
        Say(CK_NPC_NAME .. "Th�i gian k�ch ho�t �� k�t th�c,kh�ng th� k�ch ho�t danh hi�u n�a", 0);
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
        Say(CK_NPC_NAME .. format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "V� L�m T�n T�"), 0)
        return 0;
    end

    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
        Say(CK_NPC_NAME .. format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "Ng��i N�ng ��ng"), 0)
        return 0;
    end
    DebugOutput(GetExtPoint(5), GetExtPoint(6))
    if GetExtPoint(5) == 1 and GetExtPoint(6) ~= 1 then
        CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 3, 1);
        PayExtPoint(5, 1);
        AddTitle(68, 3);
        SetTitleTime(68, 3, GetTime() + (60 * 24 * 3600));
        Msg2Player(format("Nh�n ���c danh hi�u [%s]", "Ng��i N�ng ��ng"))
        Say(CK_NPC_NAME .. format("Nh�n ���c danh hi�u <color=gold>[%s]<color>", "Ng��i N�ng ��ng"), 0)
        gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 3)");
        isolate_enable_event_dispatch(PlayerIndex) --�򿪸���ҵ�����event dispatch
        ck_get_random_task()
        return 1;
    end
    Say(CK_NPC_NAME .. "Nh�n v�t n�y kh�ng �� �i�u ki�n, kh�ng th� nh�n danh hi�u!", 0);
end

function ck_TaskForward_finish()
    local nRebornLv = gf_GetPlayerRebornCount()
    local nLevel = nRebornLv * 100 + GetLevel()
    local nFaction = GetPlayerFaction()
    if nFaction ~= 0 and nLevel < 90 then
        SetLevel(90, 1);                                  --90��
        Msg2Player("T�ng th�nh c�ng!");
        Talk(1, "", "<color=yellow>T�ng th�nh c�ng, h�y ��ng nh�p l�i!<color>")
        PlaySound("\\sound\\sound_i016.wav");
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
    else
        Talk(1, "", "<color=red>C�n d��i c�p 90 v� �� gia nh�p m�n ph�i!<color>")
    end
end

--Task1:4-11λ����ֱǰ����
function ck_TaskForward()
    if CK_ES_SWITCH == 0 then
        Say(CK_NPC_NAME .. "M�y ch� n�y t�m th�i kh�ng m� chu�i nhi�m v� <color=red>D�ng C�m Ti�n T�i<color>", 0)
        return 0;
    end
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 1 then
        Say(CK_NPC_NAME .. format("Ch� c� <color=gold>[%s]<color> m�i ���c nh�n nhi�m v� n�y", "V� L�m T�n T�"), 0)
        return 0;
    end
    if GetLevel() >= 90 or gf_GetPlayerRebornCount() > 0 then
        Say(CK_NPC_NAME .. "Nh�n v�t c�p 90 tr� l�n ho�c �� chuy�n sinh kh�ng th� tham gia nhi�m v� n�y!", 0);
        return 0;
    end
    local tSay = {}

    tinsert(tSay, "\nT�ng c�p ngay!/ck_TaskForward_finish");
    tinsert(tSay, "\nT�i ch� xem xem th�i/nothing");
    Say(CK_NPC_NAME .. "Nhi�m v� D�ng C�m Ti�n T�i c� th� gi�p ng��i nhanh ch�ng t�ng c�p!" .. "<color=gold>Nh�n v�t d��i Lv90 v� �� k�ch ho�t code, ch� c�n gia nh�p m�n ph�i, s� t�ng ngay ��n Lv90!<color>", getn(tSay), tSay);
end

function ck_TaskFoward_do(nTaskID, nTaskIndex)
    if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex) ~= 0 then
        Say(CK_NPC_NAME .. "Nhi�m v� n�y �� ho�n th�nh!", 0);
        return 0;
    end
    if nTaskIndex > 4 and CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex - 1) ~= 1 then
        Say(CK_NPC_NAME .. "Ch�a ho�n th�nh nhi�m v� tr��c ��", 0);
        return 0;
    end
    if tGtTask:check_cur_task(nTaskID) == 0 then
        DirectGetGTask(nTaskID, 1)
    else
        if DirectIsTaskFinish(nTaskID) then
            if 1 == DirectFinishGTask(nTaskID, 2) then
                CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex, 1);
                Msg2Player("�� ho�n th�nh nhi�m v�!")
            else
                Msg2Player("Nhi�m v� kh�c th��ng, kh�ng th� ho�n th�nh!");
            end
        else
            Say(CK_NPC_NAME .. "Nhi�m v� v�n ch�a ho�n th�nh!", 0);
        end
    end
end

--����ֱǰ����(����)
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
        Say(CK_NPC_NAME .. format("��ng c�p nh�n v�t �� n�ng cao ��n %d c�p, xin ��ng nh�p l�i!", 90), 1, "��ng nh�p l�i/ExitGame");
    end
end

function ck_CheckCondition(bHideMsg)
    if gDebug:is_debug() == 1 then
        --����ģʽ
        return 1
    end
    local nKind = ck_GetTitleType();
    if nKind == 0 then
        if not bHideMsg then
            Say(CK_NPC_NAME .. "V�n ch�a nh�n v� k�ch ho�t danh hi�u n�o, kh�ng th� tham gia nhi�m v�!", 0);
        end
        return 0;
    end
    if GetLevel() < 90 and gf_GetPlayerRebornCount() <= 0 then
        if not bHideMsg then
            Say(CK_NPC_NAME .. format("��ng c�p nh�n v�t kh�ng �� %d c�p, kh�ng th� tham gia nhi�m v� !", 90), 0);
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
        --"\nɱ������/ck_BZBD_Kill",
        format("\n%s/#ck_task_group_talk2(1,1)", "Nhi�m v� Th� L�c Ba Phe"),
        format("\n%s/#ck_task_group_talk2(1,2)", "Nhi�m v� ph� b�n"),
        format("\n%s/#ck_task_group_talk2(1,3)", "Nhi�m v� PVP"),
        --"\n��������/ck_BZBD_Raid",
        --"\nPVP����/ck_BZBD_PVP",
        "\nT�i ch� xem xem th�i/nothing",
    }
    Say(CK_NPC_NAME .. "Nhi�m v� <color=gold>Tr�m Tr�n Tr�m Th�ng<color>, nh�n ng�u nhi�n h�ng ng�y, nh�n ���c nhi�u kinh nghi�m v� �� n�ng ��ng!", getn(tSay), tSay);
end

--Task3���ӳ�
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

--ɱ��������(����)
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

--ɱ���������ӿ�
--�����üӳ�ϵ��
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


--ʹ�ð׾���
function _ck_UseItemBaiJu()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 21, 1);
end

--ʹ��������
function _ck_UseItemSanQing()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 22, 1);
end

--ʹ��������
function _ck_UseItemLiuShen()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 23, 1);
end


--��ֲС��������
function _ck_PlantSmallBanRuo()
    if ck_IsOpen() ~= 1 then
        return 0;
    end
    if ck_GetTitleType() == 0 then
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 25, 1);
end

TASKID_NVWA_BOX_USECOUNT = 3537 --�ֶ�����taskmanager�ж�Ӧ��group��
--ʹ��Ů洱���
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

--ʹ��������
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

--ʹ��ʤ������
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
        "\nNhi�m v� t�ch l�y thu�c t�nh/ck_ZiloTask_1",
        "\nNhi�m v� ti�u ph� Thi�n Ki�u L�nh/ck_ZiloTask_2",
        "\nT�i ch� xem xem th�i/nothing",
    }
    Say(CK_NPC_NAME .. "Nhi�m v� <color=gold>��i Ph� �ng<color>, trong th�i gian ho�t ��ng ch� ���c ho�n th�nh 1 l�n, c� th� nh�n ���c nhi�u kinh nghi�m v� �� n�ng ��ng!", getn(tSay), tSay);
end

--Task4��1-7������
function ck_ZiloTask_1(bTalk)
    local nTaskIndex = 0;
    for i = CK_TASK_ZILON_ATRR_BEGIN, getn(CK_TASK_ZILON_ATRR) do
        if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, i) ~= 1 then
            nTaskIndex = i;
            break ;
        end
    end
    if nTaskIndex == 0 then
        Say(CK_NPC_NAME .. format("Ch�c m�ng %s �� ho�n th�nh to�n b� <color=gold>nhi�m v� t�ch l�y thu�c t�nh<color>!", gf_GetPlayerSexName()), 0)
        return 0;
    end
    local tCell = CK_TASK_ZILON_ATRR[nTaskIndex];
    if not tCell then
        return 0;
    end
    if not bTalk then
        local tSay = {
            "\nTa mu�n ho�n th�nh/#ck_ZiloTask_1(1)",
            "\nT�i ch� xem xem th�i/nothing",
        }
        local Str = format("Nh�n v�t �� ��t chuy�n sinh %d c�p %d, t�ch l�y %d �i�m danh v�ng, %d �i�m s� m�n, %d �i�m c�ng tr�ng", tCell[2][1], tCell[2][2], tCell[2][3], tCell[2][4], tCell[2][5]);
        local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d", tCell[1], Str, "N� l�c t�ch l�y s� gi�p b�n th�n ng�y c�ng l�n m�nh", tCell[3][1], tCell[3][2]);
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
        Say(CK_NPC_NAME .. "�� ho�n th�nh nhi�m v� n�y!", 0);
        return 0;
    end

    local tCell = CK_TASK_ZILON_ATRR[nTaskIndex];
    if not tCell then
        return 0;
    end

    if gf_GetPlayerRebornCount() < tCell[2][1] then
        Say(CK_NPC_NAME .. format("C�p chuy�n sinh c�a %s kh�ng �� <color=red>%d<color>", gf_GetPlayerSexName(), tCell[2][1]), 0);
        return 0;
    end
    if GetLevel() < tCell[2][2] and gf_GetPlayerRebornCount() <= tCell[2][1] then
        Say(CK_NPC_NAME .. format("��ng c�p c�a %s kh�ng �� <color=red>%d<color>", gf_GetPlayerSexName(), tCell[2][2]), 0);
        return 0;
    end
    if GetReputation() < tCell[2][3] then
        Say(CK_NPC_NAME .. format("�i�m t�ch l�y danh v�ng c�a %s kh�ng �� <color=red>%d<color> �i�m", gf_GetPlayerSexName(), tCell[2][3]), 0);
        return 0;
    end
    if GetTask(336) < tCell[2][4] then
        Say(CK_NPC_NAME .. format("�i�m t�ch l�y s� m�n c�a %s kh�ng �� <color=red>%d<color> �i�m", gf_GetPlayerSexName(), tCell[2][4]), 0);
        return 0;
    end
    if abs(GetTask(701)) < tCell[2][5] then
        Say(CK_NPC_NAME .. format("�i�m t�ch l�y c�ng tr�ng c�a %s kh�ng �� <color=red>%d<color> �i�m", gf_GetPlayerSexName(), tCell[2][5]), 0);
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task4, nTaskIndex, 1);
    --����
    gf_ModifyExp(tCell[3][1]);
    ck_AddCkScore(tCell[3][2]);
    Msg2Player("Nhi�m v� ho�n th�nh!");

    return 1;
end

--Task4��8-12������
function ck_ZiloTask_2(bTalk)
    local nTaskIndex = 0;
    for i = CK_TASK_IB_COST_BEGIN, CK_TASK_IB_COST_BEGIN + getn(CK_TASK_IB_COST) - 1 do
        if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, i) ~= 1 then
            nTaskIndex = i - CK_TASK_IB_COST_BEGIN + 1;
            break ;
        end
    end
    if nTaskIndex == 0 then
        Say(CK_NPC_NAME .. format("Ch�c m�ng %s �� ho�n th�nh to�n b� <color=gold>nhi�m v� ti�u ph�<color>!", gf_GetPlayerSexName()), 0)
        return 0;
    end
    local tCell = CK_TASK_IB_COST[nTaskIndex];
    if not tCell then
        return 0;
    end
    if not bTalk then
        local tSay = {
            "\nTa mu�n ho�n th�nh/#ck_ZiloTask_2(1)",
            "\nT�i ch� xem xem th�i/nothing",
        }
        local Str = format("Trong �i b�t k� c�a ��a Huy�n Cung, V�n Ki�m Tr�ng, L��ng S�n v� Th�i Nh�t Th�p t�ch l�y s� d�ng %d Thi�n Ki�u L�nh �� m� r��ng", tCell[2]);
        local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d", tCell[1], Str, "D�ng Thi�n Ki�u L�nh �� m� r��ng s� nh�n ���c ph�n th��ng phong ph�", tCell[3][1], tCell[3][2]);
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
        Say(CK_NPC_NAME .. "�� ho�n th�nh nhi�m v� n�y!", 0);
        return 0;
    end

    local tCell = CK_TASK_IB_COST[nTaskIndex];
    if not tCell then
        return 0;
    end

    if ck_GetCostIB() < tCell[2] then
        Say(CK_NPC_NAME .. format("� �i hi�n t�i, s� l��ng Thi�n Ki�u L�nh do %s ti�u ph� kh�ng �� <color=red>%d<color> c�i", gf_GetPlayerSexName(), tCell[2]), 0);
        return 0;
    end
    CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task4, CK_TASK_IB_COST_BEGIN + nTaskIndex - 1, 1);
    --����
    gf_ModifyExp(tCell[3][1]);
    ck_AddCkScore(tCell[3][2]);
    Msg2Player("Nhi�m v� ho�n th�nh!");

    return 1
end

--�ؿ������콾��Task5
function ck_GetCostIB()
    return CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Task5);
end

--�ؿ����Ѷ���ӿ�Task5
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
    Say(CK_NPC_NAME .. format("%s b�y gi� �i�m n�ng ��ng l� <color=gold>%d<color>!", gf_GetPlayerSexName(), ck_GetCkScore()), 0);
end

function ck_ScoreAward()
    local nScore = ck_GetCkScore();
    local tMsg = {
        [0] = "Ch�a nh�n",
        [1] = "�� nh�n",
    }
    local tSay = {};
    for i = 1, getn(CK_SCROE_AWARD_TABLE) do
        local nAwardedFlagId = CK_SCROE_AWARD_TABLE[i][1][7];
        --local nType = CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, i);
        local nType = ActCheckCondition(nAwardedFlagId)
        tinsert(tSay, format("Th��ng �i�m n�ng ��ng ��t %d (%s)/#ck_view_score_award(%d)", CK_SCROE_AWARD_TABLE[i][1][1], tMsg[nType], i));
    end
    tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
    Say(CK_NPC_NAME .. format("�i�m n�ng ��ng hi�n t�i c�a %s l� <color=gold>%d<color>, h�y ch�n ph�n th��ng mu�n nh�n!", gf_GetPlayerSexName(), nScore), getn(tSay), tSay);
end

function ActiveTitle(nType)
    --print("111111111111")
    if nType == 0 then
        ck_ActTilte_1()
    elseif nType == 1 then
        ck_ActTilte_3()
    end
end

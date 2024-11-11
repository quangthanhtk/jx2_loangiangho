
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\nian_monster.lua")
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\god_fu.lua")
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\head.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч,��ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "spring2021", --2021 reOpen
    szViewName 			= SF2019_ACT_NAME,
    nTalkBeginDate		= SF2019_FULL_BEGIN_DATE,
    nBeginDate 			= SF2019_FULL_BEGIN_DATE,
    nEndDate 			= SF2019_FULL_END_DATE,
    nTaskGroup 			= SF2019_TASKGROUP[1],
    nTaskGroupVersion	= SF2019_TASKGROUP[2],
}

testItem = {2,1,31269}

t_isolate_user_batch_watch_list = {--{szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), {nMaterialType, nNum}}
    {"event_server_time", {9, 0}, 	NM2019_CreateLittleMonster,	{}  },
    {"event_server_time", {1, 0}, 	NM2019_ClearLittleMonster,	{}  },
    {"event_kill_npc", {"Ti�u Ni�n Th� G�y R�i", 106}, NM2019_OnKillLittleMonster,	{}  },
    {"event_kill_npc", {"Ti�u Ni�n Th� G�y R�i", 202}, NM2019_OnKillLittleMonster,	{}  },
    {"event_kill_npc", {"Ti�u Ni�n Th� G�y R�i", 600}, NM2019_OnKillLittleMonster,	{}  },
    {"event_kill_npc", {"Ti�u Ni�n Th� G�y R�i", 507}, NM2019_OnKillLittleMonster,	{}  },
    {"event_kill_npc", {"Ti�u Ni�n Th� G�y R�i", 327}, NM2019_OnKillLittleMonster,	{}  },

    {"event_kill_npc", {"T�m B�o Nh�n", 506}, ZZ2019_OnKillMonster,	{"T�m B�o Nh�n"}  },
    {"event_kill_npc", {"Sa M�c H�nh Nh�n", 506}, ZZ2019_OnKillMonster,	{"Sa M�c H�nh Nh�n"}  },
    {"event_kill_npc", {"Nh�t Ph�m ���ng �m S�y S�", 503}, ZZ2019_OnKillMonster,	{"Nh�t Ph�m ���ng �m S�y S�"}  },
    {"event_kill_npc", {"K� ��o m�", 503}, ZZ2019_OnKillMonster,	{"K� ��o m�"}  },

    -- ����/̫һ 100%���1����Ҷ ������1��
    {"event_mission_stage_finish", {"jiandangyanyun", 5},   ZZ2019_OnMissionCompleted,{ 1, 10000,}  },
    {"event_mission_stage_finish", {"jiandangyanyun", 6},   ZZ2019_OnMissionCompleted,{ 1, 10000,}  },
    {"event_mission_stage_finish", {"jiandangyanyunhero", 5},   ZZ2019_OnMissionCompleted,{ 1, 10000,}  },
    {"event_mission_stage_finish", {"jiandangyanyunhero", 6},   ZZ2019_OnMissionCompleted,{ 1, 10000,}  },
    
    {"event_mission_stage_finish", {"taiyi", 6},            ZZ2019_OnMissionCompleted,{ 1, 10000,}  },
    {"event_mission_stage_finish", {"taiyihero", 6},        ZZ2019_OnMissionCompleted,{ 1, 10000,} },
    -- ����/��/��ɽ 20%���1����Ҷ ������1��
    {"event_mission_stage_finish", {"dixuangong", 3},   ZZ2019_OnMissionCompleted,{ 1, 2000,}  },
    {"event_mission_stage_finish", {"wanjianzhong", 4}, ZZ2019_OnMissionCompleted,{ 1, 2000,}  },
    {"event_mission_stage_finish", {"liangshan", 4},    ZZ2019_OnMissionCompleted,{ 1, 2000,}  },
}

t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskGroupIdx},
    {id={"littleBox", 1,}, clear="daily" }, --ÿ��ʹ��С���ޱ���Ĵ��� 2822
    {id={"firework", 2,}, clear="daily" }, --ÿ��ʹ�ñ���ը���޵Ĵ���  2823
    {id={"godfu_award", 3,}, clear="daily" }, --ÿ����ȡ������ 2824
    {id={"use_zz", 4,}, clear="daily" }, --ÿ��ʹ�����ӵĴ��� 2825
    {id={"godfu_award_cnt", 5,}, }, --�ۼ���ȡ������ 2826
    {id={"use_guild_firework", 6,}, }, --�ڰ�Ὺ�극����ʹ�ñ���Ĵ��� 2827
    {id={"qrj_award", 7,}, }, --��bit�� 1-���˽ڻ�콱��� 2-���˽��������ñ�� 2828
    {id={"do_jingjiu", 8,}, }, --���𾴾� 2829
    {id={"award_jingjiu", 9,}, }, --���𾴾� 2830
}
function on_add_watches()
    isolate_watch_item_talk(tLittleMonsterItem[1], tLittleMonsterItem[2], tLittleMonsterItem[3], "NM2019_On_open_little_monster_box")
    isolate_watch_item_talk(tFireworkItem[1].item[1], tFireworkItem[1].item[2], tFireworkItem[1].item[3], "NM2019_OnUseFirework")
    isolate_watch_item_talk(tFireworkItem[2].item[1], tFireworkItem[2].item[2], tFireworkItem[2].item[3], "NM2019_OnUseFirework")
    isolate_watch_item_talk(tZZ[1], tZZ[2], tZZ[3], "ZZ2019_OnUseZZ")
    isolate_watch_item_talk(2, 1, 31288, "SP2019_OnUseAwardTicket")
    
    -- isolate_watch_npc_talk(tFushen[2], 200, "FS2019_OnTalk2Fushen")

-------------------------------------------------------------------------------------------
    if SF2019_DEBUG == 1 then
        isolate_watch_item_talk(testItem[1], testItem[2], testItem[3], "test_func")
    end
end


function on_event_server_start()
    NM2019_OnSeverStart()
    FS2019_OnSeverStart()
end

function test_func()
    local szTitle = "��o C� Th� Nghi�m"
    local tbSay = {}
    tinsert(tbSay, "X�a bi�n l��ng/debug_resetAll")
    tinsert(tbSay, "G�i Ti�u Ni�n Th�/NM2019_CreateLittleMonster")
    tinsert(tbSay, "X�a Ti�u Ni�n Th�/NM2019_ClearLittleMonster")
    tinsert(tbSay, "nothing/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function debug_resetAll()
    set_task("littleBox", 0)
    set_task("firework", 0)
    set_task("godfu_award", 0)
    local tTaskId = {
        586,587,588,589,590,591,592,593,
    }
    for i = 586, 600 do
        ClearGTask(i)
    end
end
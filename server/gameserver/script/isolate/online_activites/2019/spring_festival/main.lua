
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\nian_monster.lua")
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\god_fu.lua")
Include("\\script\\isolate\\online_activites\\2019\\spring_festival\\head.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效,数值越大越先加载 1 default
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
    {"event_kill_npc", {"Ti觰 Ni猲 Th� G﹜ R鑙", 106}, NM2019_OnKillLittleMonster,	{}  },
    {"event_kill_npc", {"Ti觰 Ni猲 Th� G﹜ R鑙", 202}, NM2019_OnKillLittleMonster,	{}  },
    {"event_kill_npc", {"Ti觰 Ni猲 Th� G﹜ R鑙", 600}, NM2019_OnKillLittleMonster,	{}  },
    {"event_kill_npc", {"Ti觰 Ni猲 Th� G﹜ R鑙", 507}, NM2019_OnKillLittleMonster,	{}  },
    {"event_kill_npc", {"Ti觰 Ni猲 Th� G﹜ R鑙", 327}, NM2019_OnKillLittleMonster,	{}  },

    {"event_kill_npc", {"T莔 B秓 Nh﹏", 506}, ZZ2019_OnKillMonster,	{"T莔 B秓 Nh﹏"}  },
    {"event_kill_npc", {"Sa M筩 H祅h Nh﹏", 506}, ZZ2019_OnKillMonster,	{"Sa M筩 H祅h Nh﹏"}  },
    {"event_kill_npc", {"Nh蕋 Ph萴 Л阯g 竚 S竬 S�", 503}, ZZ2019_OnKillMonster,	{"Nh蕋 Ph萴 Л阯g 竚 S竬 S�"}  },
    {"event_kill_npc", {"K� o m�", 503}, ZZ2019_OnKillMonster,	{"K� o m�"}  },

    -- 剑荡/太一 100%获得1个粽叶 （材料1）
    {"event_mission_stage_finish", {"jiandangyanyun", 5},   ZZ2019_OnMissionCompleted,{ 1, 10000,}  },
    {"event_mission_stage_finish", {"jiandangyanyun", 6},   ZZ2019_OnMissionCompleted,{ 1, 10000,}  },
    {"event_mission_stage_finish", {"jiandangyanyunhero", 5},   ZZ2019_OnMissionCompleted,{ 1, 10000,}  },
    {"event_mission_stage_finish", {"jiandangyanyunhero", 6},   ZZ2019_OnMissionCompleted,{ 1, 10000,}  },
    
    {"event_mission_stage_finish", {"taiyi", 6},            ZZ2019_OnMissionCompleted,{ 1, 10000,}  },
    {"event_mission_stage_finish", {"taiyihero", 6},        ZZ2019_OnMissionCompleted,{ 1, 10000,} },
    -- 地玄/万剑/梁山 20%获得1个粽叶 （材料1）
    {"event_mission_stage_finish", {"dixuangong", 3},   ZZ2019_OnMissionCompleted,{ 1, 2000,}  },
    {"event_mission_stage_finish", {"wanjianzhong", 4}, ZZ2019_OnMissionCompleted,{ 1, 2000,}  },
    {"event_mission_stage_finish", {"liangshan", 4},    ZZ2019_OnMissionCompleted,{ 1, 2000,}  },
}

t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskGroupIdx},
    {id={"littleBox", 1,}, clear="daily" }, --每日使用小年兽宝箱的次数 2822
    {id={"firework", 2,}, clear="daily" }, --每日使用鞭炮炸年兽的次数  2823
    {id={"godfu_award", 3,}, clear="daily" }, --每日领取福神奖励 2824
    {id={"use_zz", 4,}, clear="daily" }, --每日使用粽子的次数 2825
    {id={"godfu_award_cnt", 5,}, }, --累计领取福神奖励 2826
    {id={"use_guild_firework", 6,}, }, --在帮会开年饭副本使用爆竹的次数 2827
    {id={"qrj_award", 7,}, }, --分bit用 1-情人节活动领奖标记 2-情人节任务重置标记 2828
    {id={"do_jingjiu", 8,}, }, --发起敬酒 2829
    {id={"award_jingjiu", 9,}, }, --发起敬酒 2830
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
    local szTitle = "Чo C� Th� Nghi謒"
    local tbSay = {}
    tinsert(tbSay, "X鉧 bi課 lng/debug_resetAll")
    tinsert(tbSay, "G鋓 Ti觰 Ni猲 Th�/NM2019_CreateLittleMonster")
    tinsert(tbSay, "X鉧 Ti觰 Ni猲 Th�/NM2019_ClearLittleMonster")
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
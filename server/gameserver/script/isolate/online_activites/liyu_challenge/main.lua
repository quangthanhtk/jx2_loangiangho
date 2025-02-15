--这是模块化的一个标准主文件，各模块只需要实现对应的标准事件处理函数，不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调，以免空回调影响效率
Import("\\settings\\static_script\\lib\\item_define.lua")
Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\script\\lib\\globalfunctions.lua")
-- Include("\\script\\lib\\sdb.lua")
Include("\\script\\isolate\\online_activites\\liyu_challenge\\liyu_mission2.lua")
Include("\\script\\isolate\\online_activites\\liyu_challenge\\data.lua")
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Include("\\script\\function\\ornament\\ornament.lua")

t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "liyu_challenge",
    szViewName 			= "Chi課 u b秓 v� C� Ch衟",
    nTalkBeginDate		= 20160915,
    nBeginDate 			= 20160915,
    nEndDate 			= 20161003,
    nTaskGroup 			= 2,
    nTaskGroupVersion	= 24,
}

LIYU_ONLINE_TIME        = 180*60--180*60-- 每日在线任务需要的时间，单位s
LIYU_WATERING_LIMIT     = 10            -- 每日玩家可浇水10次
LIYU_NPC_LIMIT          = 20            -- 天阴教头目BOSS数量限制
LIYU_NPC_LIFE_TIME      = 20*60         -- 天阴教头目BOSS存活时间
LIYU_MISSION_END_DATE   = 161001        -- 2016 10 01 任务部分结束，领奖流程开始
LIYU_HIGH_MED_LIMIT     = 100           -- 使用高级解药的每日次数限制
LIYU_TOP_MED_LIMIT      = 200           -- 使用高级解药的每日次数限制
LIYU_WATER_EXP          = 1000000       -- 浇水活动获得的经验
LIYU_CATCH_EXP          = 500000        -- 除虫活动获得的经验
LIYU_CATCH_ADD_SCORE    = 5             -- 捉虫加的分数
LIYU_WATER_ADD_SCORE    = 1             -- 浇水加的分数
LIYU_POP_CATCH_BUG      = 5             -- 除虫增加多少点折冲社声望
LIYU_POP_WATER          = 10            -- 浇水增加多少点折冲社声望
LIYU_MAX_POP_PER_DAY    = 100

LIYU_TONG_DATE_LIMIT    = 7*24*3600     -- 至少需要加入帮会这么长时间
LIYU_SEF_SCORE_LIMIT    = 150           -- 个人至少需要获得150分才能参与领奖
LIYU_POWER_OF_PIECE     = 150           -- 一个红枫碎片换150风华积分
LIYU_GIVE_MED_EXP1      = 500000        -- 提交低级解药的经验
LIYU_GIVE_MED_EXP2      = 800000        -- 中
LIYU_GIVE_MED_EXP3      = 1000000       -- 高
LIYU_GIVE_MED_EXP4      = 1000000       -- 特
LIYU_SUMMON_BOSS_SCORE  = 14            -- 召唤天阴大头目 14分
LIYU_SLAIN_BOSS_SCORE   = 7             -- 杀死天阴大头目 7分
LIYU_BOSSSOCRE_PER_MED  = 20            -- 每瓶高级解药多少BOSS积分
liyu_szNpcName = "<color=gold>S� Gi� L� H閕:<color>"
liyu_main_npc = {
    {"9y_jrds","S� Gi� L� H閕",200,1370,2866},
    {"9y_jrds","S� Gi� L� H閕",300,1743,3510},
    {"9y_jrds","S� Gi� L� H閕",100,1413,2981},
}


liyu_local_buf = {
    -- ["tongName"] = {"tongName", "Player1", nScore1, "Player2", nScore2, "Player3", nScore3, totalScore };    
}


liyu_xianyaotree_npc = {
    template    = "9y_bhxys",
    name        = "C﹜ Ti猲 Dc (Bang)",
    script      = "\\script\\isolate\\online_activites\\liyu_challenge\\npc_caiyaoren.lua",
    pos         = {300,1740,3494}
}
liyu_caiyao_npc = {
    pos = {
            -- 泉州府西:
        {105,1550,3185}, {105,1498,3174}, {105,1533,3079}, {105,1582,2987}, {105,1503,3050},
        {105,1570,2907}, {105,1509,2943}, {105,1463,2991}, {105,1425,3083}, {105,1450,2885},
            -- 泉州府北:
        {108,1426,3124}, {108,1426,3124}, {108,1559,3160}, {108,1590,3087}, {108,1553,2968},
        {108,1490,2920}, {108,1422,2897}, {108,1403,2984}, {108,1452,3045}, {108,1400,3090},
            -- 成都府西:
        {301,1594,3146}, {301,1522,3161}, {301,1452,3054}, {301,1532,3055}, {301,1595,2959},
        {301,1568,2855}, {301,1514,2784}, {301,1444,2855}, {301,1502,2904}, {301,1404,2963},
            -- 成都府南:
        {304,1515,2837}, {304,1415,2921}, {304,1478,2969}, {304,1576,3008}, {304,1510,3031},
        {304,1422,3035}, {304,1484,3116}, {304,1574,3159}, {304,1479,3151}, {304,1404,3161},
            -- 成都府北:
        {308,1464,3216}, {308,1426,3136}, {308,1405,3046}, {308,1406,2988}, {308,1476,2982},
        {308,1486,3076}, {308,1547,3127}, {308,1584,3068}, {308,1519,3018}, {308,1582,2984},
            -- 汴京府南：
        {201,1539,2832}, {201,1491,2889}, {201,1483,2814}, {201,1429,2830}, {201,1421,2959},
        {201,1528,2946}, {201,1592,3004}, {201,1514,3064}, {201,1418,3100}, {201,1585,3153},
            -- 汴京府东:
        {205,1631,2910}, {205,1605,3029}, {205,1782,2857}, {205,1753,3014}, {205,1598,3185},
        {205,1651,3307}, {205,1768,3111}, {205,1854,3023}, {205,1830,3200}, {205,1796,3362},
            -- 汴京府西:
        {203,1512,3137}, {203,1556,3039}, {203,1573,2923}, {203,1505,3003}, {203,1417,3095},
        {203,1401,2986}, {203,1387,2894}, {203,1419,2817}, {203,1492,2807}, {203,1558,2815},
    },
    template    = "9y_cyr",
    name        = "Ngi H竔 Thu鑓",
    lifetime    = 60*10,
    script      = "\\script\\isolate\\online_activites\\liyu_challenge\\npc_caiyaoren.lua",
}

liyu_caiyao = {
    {1276,2967}, {1327,3109}, {1525,2977},
    {1283,2947}, {1330,3152}, {1537,3071},
    {1290,2928}, {1316,3197}, {1569,3016},
    {1302,2909}, {1371,3056}, {1527,3133},
    {1318,2902}, {1389,3014}, {1516,3189},
    {1321,2867}, {1399,2960}, {1489,3128},
    {1343,2840}, {1458,2835}, {1456,3158},
    {1370,2817}, {1438,2787}, {1459,3080},
    {1369,2760}, {1460,2966}, {1429,3047},
    {1377,2877}, {1505,2883}, {1407,3082},
    {1350,2931}, {1511,2827}, {1398,3134},
    {1339,2973}, {1524,2773}, {1408,3184},
    {1323,3017}, {1531,2918}, {1304,3067},
    {1572,2871},
}

liyu_tb_tree_award = {
    [1]={{2,1,30912,100,-1,"Hi謕 Ngh躠 Chi Ch鴑g"}},
    [2]={{2,1,30912,200,-1,"Hi謕 Ngh躠 Chi Ch鴑g"}},
    [3]={{2,95,2084,5,4,"H祇 Hi謕 L謓h"}},
    [4]={{2,1,30534,5,4,"Thi誸 Tinh c蕄 2"}},
    [5]={{2,1,30913,7,4,"уng T� Chi Nguy謓"}},
    [6]={{2,1,30730,4,4,"Kinh M筩h уng Nh﹏"}},
    [7]={{2,1,30730,6,4,"Kinh M筩h уng Nh﹏"}},
    [8]={{2,1,30731,2,4,"Kinh M筩h Ng﹏ Nh﹏"}},
    [9]={
        {2,1,30731,4,4,"Kinh M筩h Ng﹏ Nh﹏"},
        {2,1,31058,9,4,"Phi誹 Khi猽 Chi課"},
    },
    [10]={
        {2,1,30731,8,4,"Kinh M筩h Ng﹏ Nh﹏"},
        {2,1,31058,15,4,"Phi誹 Khi猽 Chi課"},
        {2,1,31162,1,4,"H閜 Ngo筰 Trang Di謕 Thng Thu Phong"}
    },
}

liyu_tb_tong_award = {
    [1]={{2,95,2084,10,-1,"H祇 Hi謕 L謓h"}},
    [2]={{2,1,30534,10,-1,"Thi誸 Tinh c蕄 2"}},
    [3]={{2,1,30913,14,-1,"уng T� Chi Nguy謓"}},
    [4]={{2,1,30730,8,-1,"Kinh M筩h уng Nh﹏"}},
    [5]={{2,1,31064,1,-1,"V葃 K� L﹏"}},
    [6]={{2,1,31058,6,4,"Phi誹 Khi猽 Chi課"},},
    [7]={{2,1,31058,9,4,"Phi誹 Khi猽 Chi課"},},
    [8]={
        {2,1,31058,15,4,"Phi誹 Khi猽 Chi課"},
        {2,1,31162,1,4,"H閜 Ngo筰 Trang Di謕 Thng Thu Phong"},
    },
    [9]={
        --{2,1,31162,1,4,"叶上秋风外装礼盒"},
        {2,1,31074,1,1,"Kh綾 B秐 Linh Ho箃 C蕄 2 (竜)"},
    },
}


function _refresh_caiyaonpc()
    if liyu_check_ms_date() ~= 1 then  return end
    Msg2Global("Ngi H竔 Thu鑓  xu蕋 hi謓 � g莕 c竎 th祅h l韓, c竎 i hi謕 h穣 n  t譵  l蕐 nguy猲 li謚 thu鑓.")
    local pos = liyu_caiyao_npc.pos;
    for group = 0,7 do
        local nRand = random(0,5)
        for j=1,5 do
            local i = j+nRand+group*10;
            local npcidx = CreateNpc(liyu_caiyao_npc.template,liyu_caiyao_npc.name,pos[i][1],pos[i][2],pos[i][3])
            SetNpcLifeTime(npcidx,liyu_caiyao_npc.lifetime)
            SetNpcScript(npcidx,liyu_caiyao_npc.script)
        end
    end
end



function handle_count_time()
    local bHas = 0;
    for key,var in liyu_local_buf do
        bHas = 1;
        break;
    end
    if bHas == 1 then
        liyu_writeFile();
    else
        liyu_readFile();
    end
end

function _refresh_both()
    if liyu_check_ms_date() ~= 1 then return end
    _refresh_caiyaonpc()
    Msg2Global("Qu竔 C� Ch� xu蕋 hi謓 t筰 Long Tuy襫 Th玭 nh t蕁 c玭g th玭 d﹏, m阨 c竎 hi謕 s� s� d飊g thu鑓 gi秈  gi秈 c鴘 Qu竔 C� Ch� H� у.")
    for i=1,getn(liyu_monster_npc.pos) do
        local nNpcidx = CreateNpc(liyu_monster_npc.template,liyu_monster_npc.name,liyu_monster_npc.pos[i][1],liyu_monster_npc.pos[i][2],liyu_monster_npc.pos[i][3])
        SetNpcLifeTime(nNpcidx,3600*4)
    end
end

function liyu_handle_leave_tong(...)
    local nCurScore = get_task("tskid_sef_score")
    if nCurScore == 0 then return end 
    local nNewScore = floor(nCurScore/2);
    set_task("tskid_sef_score",nNewScore)
    Msg2Player(format("Do b筺 ra kh醝 bang h閕 trong th阨 gian ho箃 ng,  c鑞g hi課 ho箃 ng s� b� tr� n %d 甶觤.",nNewScore))
end

t_isolate_user_batch_watch_list = { 
	{"event_server_tick_minute",{1},handle_count_time,{ }},
    {"event_server_time", {18, 0},  _refresh_both ,{ }  },
    {"event_server_time", {18, 30}, _refresh_caiyaonpc,{ }  },
    {"event_server_time", {19, 0},  _refresh_caiyaonpc,{ }  },
    {"event_server_time", {19, 30}, _refresh_caiyaonpc,{ }  },
    {"event_server_time", {20, 0},  _refresh_caiyaonpc,{ }  },
    {"event_server_time", {20, 30}, _refresh_caiyaonpc,{ }  },
    {"event_server_time", {21, 0},  _refresh_caiyaonpc,{ }  },
    {"event_player_tong_operation", {"leave",-1,-1}, liyu_handle_leave_tong, },
}

LIYU_DC_TSK_BIT = {
    yaocaibox = 1,  -- 每日一次开启药材宝箱
    shovel    = 2,  -- 每日一次领取采药铲
}
LIYU_DC_TSK_BYTE = {
    high_med = 1,   -- 使用高级解药次数
    top_med  = 2,   -- 使用特级解药次数
    add_pop  = 3,   -- 每天获得折冲社声望次数
}

LIYU_TSK_BIT_AWARD  ={
    tong = 1,
    tree = 2,
}

t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskGroupIdx},
   {id={"tskid_daily_end_time", 1,}, clear="daily" },   -- 每日在线任务计时 初始化为0 开启任务后为任务完成的时间(GetTime()生成数) 领奖后为-1
   {id={"tskid_once_dc", 2,}, clear="daily" },          -- 每日只能执行一次的操作，定义32位整形按位存取，存取规则定义在table LIYU_DC_TSK_BIT
   {id={"tskid_byte", 3,}, clear="daily" },             -- 按字节存储的整形任务变量，最高255
   {id={"tskid_caiyao_pos", 4,} },                      -- 记录当前采药铲可以使用的坐标。
   {id={"tskid_sef_score", 5,} },                       -- 记录自己仙药树的得分
   {id={"tskid_watering", 6,}, clear="daily" },         -- 记录自己每日浇水的次数
   {id={"tskid_getpop", 7,}, clear="daily" },           -- 记录每日获得的折冲社声望
   {id={"tskid_getaward", 8,}, },                       -- 记录是否领奖
   {id={"tskid_bossscore", 9,}, },                       -- 召唤和击杀BOSS的奖励点数
}

function on_add_watches() 
	isolate_watch_npc_talk("S� Gi� L� H閕", 100, "liyu_handle_talk2jieridashi")      --与节日大使对话
    isolate_watch_npc_talk("S� Gi� L� H閕", 200, "liyu_handle_talk2jieridashi")
    isolate_watch_npc_talk("S� Gi� L� H閕", 300, "liyu_handle_talk2jieridashi")
    isolate_watch_npc_talk("C﹜ Ti猲 Dc (Bang)", 300, "liyu_handle_talk2yaoxiantree")       --与药仙树对话
    isolate_watch_npc_talk("Qu竔 C� Ch衟 H� у", 106, "liyu_handle_talk2liyuguai")   --与鲤鱼怪对话
    isolate_watch_event("event_kill_npc", "liyu_handle_on_kill_npc", "", 111)   --在清溪洞杀怪
    isolate_watch_item_talk(2,1,31151, "handle_on_use_yaocai_box")              --打开药材宝箱
    isolate_watch_item_talk(2,1,31158, "handle_on_use_shovel")                  --使用采药铲
    isolate_watch_item_talk(2,1,31156, "handle_on_use_bucket")                  --使用水桶
    isolate_watch_item_talk(2,1,31159, "handle_on_use_flares")                  --使用求救信号弹
    isolate_watch_item_talk(2,1,31164, "liyu_use_chinese_piece")                --使用中国剑碎片
    
    isolate_watch_event("event_kill_npc", "liyu_handle_on_kill_boss", "", 106)   --在龙泉村杀怪
end

-- liyu_npc_cnt = 0;
liyu_boss = {}



---------------------------------------杀BOSS-------------------------------------------

function liyu_refresh_boss()
    if liyu_check_ms_date() ~= 1 then return end
    for i = 1,getn(liyu_boss) do
        local szNpcName = GetNpcName(liyu_boss[i])
        if szNpcName ~= "Thi猲  Чi u M鬰" and szNpcName ~= "Thi猲  Ti觰 u M鬰" then
            tremove(liyu_boss,i);
        end
    end
end

function handle_on_use_flares(nIndex)
    if liyu_check_ms_date() ~= 1 then Talk(1,"","Ho箃 ng  k誸 th骳") return end
    if liyu_condition_check(1) ~= 1 then
        Talk(1,"",format("V韎 th鵦 l鵦 hi謓 t筰 c馻 %s, t� � g鋓 u M鬰 ch l� qu� nguy hi觤. H穣 r蘮 luy謓 th猰 r錳 ti課 h祅h. (<color=red>C莕 c蕄 90 tr� l猲 v� h鋍  k� n╪g c蕄 55<color>)",szSex))
        return 
    end
    local szSex = "Hi謕 s�" if GetSex()==2 then szSex = "N� hi謕 " end
    local m,x,y = GetWorldPos()
    if m ~= 106 then
        Talk(1,"","Ph竜 T輓 Hi謚 ch� 頲 d飊g � <color=red>Long Tuy襫 Th玭<color>")
        return 
    end
    liyu_refresh_boss()
    if getn(liyu_boss) >= LIYU_NPC_LIMIT then
        Talk(1,"","Hi謓 c� qu� nhi襲 t輓 hi謚 c莡 c鴘, h穣 th� l筰 sau.")
        return
    end

    if DelItem(2,1,31159,1) == 1 then
        local npcid = CreateNpc("9y_tydtm","Thi猲  Чi u M鬰",m,x,y);
        tinsert(liyu_boss,npcid);
        SetNpcLifeTime(npcid,LIYU_NPC_LIFE_TIME)
        set_task("tskid_bossscore",get_task("tskid_bossscore")+LIYU_SUMMON_BOSS_SCORE)
        Msg2Player(format("B筺  s� d鬾g Ph竜 T輓 Hi謚 C莡 C鴘, nh薾 頲 %d 甶觤 t輈h ho箃 ng.",LIYU_SUMMON_BOSS_SCORE))
    end
end

function liyu_handle_on_kill_boss(data, para)
    if liyu_check_ms_date() ~= 1 then return end
    if liyu_condition_check(1) ~= 1 then return end;
    if data[1] ~= "Thi猲  Ti觰 u M鬰" and data[1] ~= "Thi猲  Чi u M鬰" then return end;
    SetNpcLifeTime(data[3],3)
    for i = 1, getn(liyu_boss) do
        if liyu_boss[i] == data[3] then
            tremove(liyu_boss,i)
            break;
        end
    end
    if data[1] == "Thi猲  Ti觰 u M鬰" then
        -- gf_AddItemEx({2,1,31153,1}, "中级的解药")
        -- -- AddRuntimeStat(46,1,2,1)
    else
        -- gf_AddItemEx({2,1,31154,1}, "高级的解药") --解药改为兑换形式发放
        -- -- AddRuntimeStat(46,1,3,1)
        set_task("tskid_bossscore",get_task("tskid_bossscore")+LIYU_SLAIN_BOSS_SCORE)   -- 添加兑换积分
        Msg2Player(format("B筺  ti猽 Thi猲  Чi u M鬰, nh薾 頲 %d 甶觤 t輈h ho箃 ng.",LIYU_SLAIN_BOSS_SCORE))
    end
end
--------------------------------------------------------------------------------------

function liyu_handle_talk2yaoxiantree()
    if liyu_condition_check(1) ~= 1 then
        local szTitle = "M閠 C﹜ Ti猲 Dc th莕 k�. (<color=red>C蕄 90 tr� l猲 v� h鋍  k� n╪g c蕄 55 m韎 頲 tham gia ho箃 ng.<color>)"
        local tSay = {}
        tinsert(tSay,"R阨 kh醝/nothing")
        Say(szTitle,getn(tSay),tSay)
        return
    end
    local nDate = tonumber(date("%y%m%d"))
    if nDate < LIYU_MISSION_END_DATE then
        liyu_handle_talk2xianyaotree_ms()
    else
        liyu_handle_talk2xianyaotree_award()
    end
end

function liyu_handle_talk2xianyaotree_award()
    local szTongName = GetTongName();
    local szTitle = "M閠 C﹜ Ti猲 Dc th莕 k�"
    local tSay = {}
    if liyu_local_buf[szTongName] == nil then
        tinsert(tSay,"R阨 kh醝/nothing")
    else
        local nSefScore = get_task("tskid_sef_score")
        local nTotScore = liyu_local_buf[szTongName][8];
        szTitle = szTitle..format(",  trng th祅h hi謓 t筰 c馻 C﹜ Ti猲 Dc (Bang) l�: %s 甶觤, c鑞g hi課 ho箃 ng c馻 b筺 l�: %s 甶觤(<color=red>l璾 �: khi ho箃 ng k誸 th骳, 輙 nh蕋 ph秈 v祇 bang 7 ng祔 m韎 c� th� nh薾 thng. Ra kh醝 bang h閕 s� b� tr� m閠 n鯽  c鑞g hi課 bang h閕! <color>)", nTotScore, nSefScore)
        tinsert(tSay,"Xem x誴 h筺g  c鑞g hi課 ho箃 ng C﹜ Ti猲 Dc (Bang)/liyu_show_tong_list")
        tinsert(tSay,"Nh薾 thng trng th祅h C﹜ Ti猲 Dc/liyu_get_tree_award")
        tinsert(tSay,"Nh薾 thng x誴 h筺g  c鑞g hi課 ho箃 ng C﹜ Ti猲 Dc (Bang)/liyu_get_tong_award")
        -- tinsert(tSay,"test加帮会贡献度10000/test_add_score")
        
        tinsert(tSay,"R阨 kh醝/nothing")
    end
    Say(szTitle,getn(tSay),tSay)
end
function liyu_get_bucket()
     if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
     if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"","Kh玭g gian h祅h trang kh玭g ") return end
     if BigGetItemCount(2,1,31156) == 0 and  BigGetItemCount(2,1,31157) == 0 and IsTongMember()~=0 then
        gf_AddItemEx({2,1,31156,1}, "Th飊g Nc")
     else
        Talk(1,"","B筺 ch璦 v祇 bang ho芻  c� Th飊g Nc, kh玭g th� nh薾 ti誴.")
     end
end
function liyu_handle_talk2xianyaotree_ms()
    local szTongName = GetTongName();
    local szTitle = "M閠 C﹜ Ti猲 Dc th莕 k�"
    local tSay = {}
    if liyu_local_buf[szTongName] == nil then
        tinsert(tSay,format("M� C﹜ Ti猲 Dc (Bang)/#liyu_open_xianyao(\"%s\")",szTongName))
        tinsert(tSay,"Quay l筰 sau!/nothing")
    else
        local nSefScore = get_task("tskid_sef_score")
        local nTotScore = liyu_local_buf[szTongName][8];
        szTitle = szTitle..format(",  trng th祅h hi謓 t筰 c馻 C﹜ Ti猲 Dc (Bang) l�: %s 甶觤, c鑞g hi課 ho箃 ng c馻 b筺 l�: %s 甶觤(<color=red>l璾 �: khi ho箃 ng k誸 th骳, 輙 nh蕋 ph秈 v祇 bang 7 ng祔 m韎 c� th� nh薾 thng. Ra kh醝 bang h閕 s� b� tr� m閠 n鯽  c鑞g hi課 bang h閕! <color>)", nTotScore, nSefScore)
        tinsert(tSay,"Nh薾 Th飊g Nc/liyu_get_bucket")
        tinsert(tSay,format("Ti nc cho C﹜ Ti猲 Dc (H玬 nay c遪 c� th� ti %d l莕)/#liyu_water(%d)",LIYU_WATERING_LIMIT-get_task("tskid_watering"),LIYU_WATERING_LIMIT-get_task("tskid_watering")))
        tinsert(tSay,"Tr� s﹗ cho C﹜ Ti猲 Dc/liyu_catch_bug_talk")
        tinsert(tSay,"Xem x誴 h筺g  c鑞g hi課 ho箃 ng C﹜ Ti猲 Dc (Bang)/liyu_show_tong_list")
        tinsert(tSay,"Gi韎 thi謚 c竎h ch琲 C﹜ Ti猲 Dc (Bang)/liyu_tree_detail")
        tinsert(tSay,"R阨 kh醝/nothing")
    end
    Say(szTitle,getn(tSay),tSay)
end

function handle_on_use_bucket(nIndex)
    if liyu_check_ms_date() ~= 1 then Talk(1,"","Ho箃 ng  k誸 th骳") return end
    if liyu_condition_check() ~= 1 then return end
    local m,x,y = GetWorldPos()
    if m ~= 203 then
        Talk(1,"","H穣 n <color=green>T﹜ Bi謓 Kinh (198,176)<color> l蕐 nc") 
        return
    end
    local k = floor(sqrt((x-1582)^2+(y-2824)^2));
    if k >= 0 and k <= 5 then
        if DelItemByIndex(nIndex,1) == 1 then
            gf_AddItemEx({2,1,31157,1}, "Th飊g Nc y Nc")
        else
            error("C� l鏸 khi l蕐 nc")
        end
    else
        Talk(1,"","H穣 n <color=green>T﹜ Bi謓 Kinh (198,176)<color> l蕐 nc") 
        return
    end
end

function liyu_add_score(nScore)
    if liyu_check_ms_date() ~= 1 then return end
    local szTongName = GetTongName();
    local szPlayerName = GetSafeName();

    local nMyScore = get_task("tskid_sef_score")
    nMyScore = nMyScore+nScore
    set_task("tskid_sef_score",nMyScore);
    
    if liyu_local_buf[szTongName] == nil then
        print("[error]function liyu_add_score(nScore) error!")
        return 
    end

    local tInfo = liyu_local_buf[szTongName];
    local tPlayer = {}
    local nTotal = tInfo[8]+nScore;
    

    if tInfo[2] == szPlayerName then tInfo[3] = nMyScore;
    elseif tInfo[4] == szPlayerName then tInfo[5] = nMyScore;
    elseif tInfo[6] == szPlayerName then tInfo[7] = nMyScore;
    else tinsert(tPlayer,{szPlayerName,nMyScore})
    end
    tinsert(tPlayer,{tInfo[2],tInfo[3]})
    tinsert(tPlayer,{tInfo[4],tInfo[5]})
    tinsert(tPlayer,{tInfo[6],tInfo[7]})
    local cmp = function(t1,t2)
        return t1[2]>t2[2]
    end
    sort(tPlayer,cmp)
    liyu_local_buf[szTongName] = {szTongName,tPlayer[1][1],tPlayer[1][2],tPlayer[2][1],tPlayer[2][2],tPlayer[3][1],tPlayer[3][2],nTotal}
end

function liyu_water_award()
    if liyu_condition_check()~=1 then return end
    if gf_Judge_Room_Weight(2, 0) == 1 then
        local nRand = random(1,100)
        if nRand <= 10 then
            gf_AddItemEx({2,1,31152,1}, "Thu鑓 Gi秈-Th蕄")
            -- AddRuntimeStat(46,1,1,1)
        end
        local nRand = random(1,100)
        if nRand <= 10 then
            gf_AddItemEx({2,1,31118,1}, "Йn Ho祅g Huy襫 Thi誸")
        end
    else
        Talk(1,"","Ch� tr鑞g t骾 kh玭g , h穣 ch鮝 2 � tr鑞g t骾.");
        return 0;
    end 
    local szTongName = GetTongName()
    local szPlayerName = GetSafeName()
    local nGotPop = get_task("tskid_getpop")
    if IsUsePop(6) == 1 then                        -- 如果折冲社声望可用，则增加声望。
        AddPop(6,LIYU_POP_WATER)
        Msg2Player(format("Nh薾 頲 danh v鋘g Chi誸 Xung X� %d 甶觤",LIYU_POP_WATER))
    else
        Msg2Player("Do b筺 kh玭g m� danh v鋘g Chi誸 Xung X�, n猲 kh玭g th� nh薾 thng danh v鋘g Chi誸 Xung X�.")
    end 
    gf_Modify("Exp", LIYU_WATER_EXP);
    liyu_add_score(LIYU_WATER_ADD_SCORE)
    return 1;
end

function liyu_water(nWatering)
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    local nCnt = GetItemCount(2,1,31157)
    if nCnt < 1 then
        Talk(1,"liyu_handle_talk2yaoxiantree","Th飊g Nc c馻 b筺 ch璦 c� nc, kh玭g th� ti nc.")
        return
    end
    if nWatering <= 0 then
        Talk(1,"","H玬 nay b筺  ti qu� nhi襲 nc cho C﹜ Ti猲 Dc, ng祔 mai h穣 quay l筰.")
        return
    end
    if DelItem(2,1,31157,1) == 1 then
        if liyu_water_award() == 0 then
            AddItem(2,1,31157,1)
            return 
        end
        set_task("tskid_watering",get_task("tskid_watering")+1);
        Talk(1,"","Ti nc th祅h c玭g")
        gf_AddItemEx({2,1,31156,1}, "Th飊g Nc")
    else
        error("C� l鏸 khi ti nc")
    end
end

function liyu_catch_bug_talk()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    Talk(1,"liyu_catch_bug","M阨 b筺 n閜<color=yellow> Thu鑓 Tr� S﹗<color>.")
end

function liyu_catch_bug()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    if liyu_condition_check() ~= 1 then return end; 
    local nCnt = GetItemCount(2,1,31160)
    if nCnt > 1000 then nCnt = 1000 end
    AskClientForNumber("liyu_catch_bug_CB", 0, nCnt, "C莕 d飊g bao nhi猽?");
end



function liyu_catch_bug_award(nNum)
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    local szTongName = GetTongName()
    local szPlayerName = GetSafeName()
    gf_Modify("Exp", LIYU_CATCH_EXP*nNum);               -- 增加经验。

    local nGotPop = get_task("tskid_getpop")

    if IsUsePop(6) == 1 then                        -- 如果折冲社声望可用，则增加声望。
        if nGotPop+LIYU_POP_CATCH_BUG*nNum <= LIYU_MAX_POP_PER_DAY then
            AddPop(6,LIYU_POP_CATCH_BUG*nNum)
            set_task("tskid_getpop",nGotPop+LIYU_POP_CATCH_BUG*nNum)
            Msg2Player(format("Nh薾 頲 danh v鋘g Chi誸 Xung X� %d 甶觤",LIYU_POP_CATCH_BUG*nNum))
        else
            AddPop(6,LIYU_MAX_POP_PER_DAY-nGotPop)
            set_task("tskid_getpop",LIYU_MAX_POP_PER_DAY)
            Msg2Player(format("Nh薾 頲 danh v鋘g Chi誸 Xung X� %d 甶觤",LIYU_MAX_POP_PER_DAY-nGotPop))
            Msg2Player(format("M鏸 ng祔 nhi襲 nh蕋 ch� c� th� nh薾 頲 %d 甶觤 danh v鋘g Chi誸 Xung X� th玭g qua ho箃 ng tr� s﹗.",LIYU_MAX_POP_PER_DAY))
        end
    else
        Msg2Player("Do b筺 kh玭g m� danh v鋘g Chi誸 Xung X�, n猲 kh玭g th� nh薾 thng danh v鋘g Chi誸 Xung X�.")
    end 
    liyu_add_score(LIYU_CATCH_ADD_SCORE*nNum)
    return 1;
end

function liyu_catch_bug_CB(nNum)
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    if nNum == 0 then return end
    if DelItem(2,1,31160,nNum) == 1 then
        Talk(1,"","Tr� s﹗ th祅h c玭g")
        liyu_catch_bug_award(nNum)
    else
        Talk(1,"","Thu鑓 Tr� S﹗ kh玭g , kh玭g th� tr� s﹗")
    end
end

function liyu_show_tong_list()
    local szTongName = GetTongName();
    local tTmp = liyu_local_buf[szTongName]
    if tTmp == nil then -- 一般不会出现这种情况(=。=)
        return  
    end
    local szShow = format("Bang: <color=gold>%s<color>",szTongName)
--   1.%s      活动贡献度：%d点
--   2.%s      活动贡献度：%d点
--   3.%s      活动贡献度：%d点]],szTongName,tTmp[2],tTmp[3],tTmp[4],tTmp[5],tTmp[6],tTmp[7]);
    if tTmp[2]~=nil and tTmp[2]~="" then szShow = szShow..format("\n\n1. %s          ч c鑞g hi課 ho箃 ng: %d 甶觤",tTmp[2],tTmp[3]) else szShow="Hi謓 kh玭g c� x誴 h筺g." end
    if tTmp[4]~=nil and tTmp[4]~="" then szShow = szShow..format("\n2.%s           c鑞g hi課 ho箃 ng: %d 甶觤.",tTmp[4],tTmp[5]) end
    if tTmp[6]~=nil and tTmp[6]~="" then szShow = szShow..format("\n3.%s           c鑞g hi課 ho箃 ng: %d 甶觤.",tTmp[6],tTmp[7]) end
    local tSay = {}
    tinsert(tSay,"V� trang trc/liyu_handle_talk2yaoxiantree")
    tinsert(tSay,"Quay l筰 sau!/nothing")
    Say(szShow,getn(tSay),tSay)
end


function liyu_give_item( tItems )
    local nCnt = getn(tItems)
    if gf_Judge_Room_Weight(nCnt, 100*nCnt) == 1 then
        for i=1,nCnt do
            gf_AddItemEx({tItems[i][1],tItems[i][2],tItems[i][3],tItems[i][4],tItems[i][5]}, tItems[i][6])
        end
    else
        Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
        return 0;
    end 
    return 1;
end

function liyu_get_tree_award()
    if liyu_condition_check()~=1 then return end;
    if GetTime()-GetJoinTongTime() < LIYU_TONG_DATE_LIMIT then
        Talk(1,"","Ngi v祇 bang ch璦  7 ng祔 kh玭g th� tham gia nh薾 thng")
        Msg2Player("Ngi v祇 bang ch璦  7 ng祔 kh玭g th� tham gia nh薾 thng")
        return
    end
    if get_task("tskid_sef_score") < LIYU_SEF_SCORE_LIMIT then
        Talk(1,"","Ngi c�  c鑞g hi課 c� nh﹏ kh玭g  150 kh玭g th� tham gia nh薾 thng")
        Msg2Player("Ngi c�  c鑞g hi課 c� nh﹏ kh玭g  150 kh玭g th� tham gia nh薾 thng")
        return
    end
    local szTongName = GetTongName();
    if liyu_local_buf[szTongName] == nil then return end; -- 一般不会出现这种奇葩情况=。=
    local bTreeAward = get_task_bit("tskid_getaward",LIYU_TSK_BIT_AWARD.tree)
    if bTreeAward == 1 then
        Talk(1,"","B筺  nh薾 ph莕 thng trng th祅h C﹜ Ti猲 Dc r錳.")
        Msg2Player("B筺  nh薾 ph莕 thng trng th祅h C﹜ Ti猲 Dc r錳.")
        return
    end
    local nTotal = liyu_local_buf[szTongName][8] 
    if nTotal < 500 then
        Talk(1,"","Bang h閕 v韎  trng th祅h hi謓 t筰 c馻 C﹜ Ti猲 Dc (Bang) th蕄 h琻 500 s� kh玭g c� ph莕 thng.")
        return 
    end
    if      nTotal>=500 and nTotal<1500     then if liyu_give_item(liyu_tb_tree_award[1]) == 0 then return end -- AddRuntimeStat(46,7,1,1)
    elseif  nTotal>=1500 and nTotal<2500    then if liyu_give_item(liyu_tb_tree_award[2]) == 0 then return end -- AddRuntimeStat(46,7,2,1)
    elseif  nTotal>=2500 and nTotal<3500    then if liyu_give_item(liyu_tb_tree_award[3]) == 0 then return end -- AddRuntimeStat(46,7,3,1)
    elseif  nTotal>=3500 and nTotal<7500    then if liyu_give_item(liyu_tb_tree_award[4]) == 0 then return end -- AddRuntimeStat(46,7,4,1)
    elseif  nTotal>=7500 and nTotal<12600   then if liyu_give_item(liyu_tb_tree_award[5]) == 0 then return end -- AddRuntimeStat(46,7,5,1)
    elseif  nTotal>=12600 and nTotal<27000  then if liyu_give_item(liyu_tb_tree_award[6]) == 0 then return end -- AddRuntimeStat(46,7,6,1)
    elseif  nTotal>=27000 and nTotal<34500  then if liyu_give_item(liyu_tb_tree_award[7]) == 0 then return end -- AddRuntimeStat(46,7,7,1)
    elseif  nTotal>=34500 and nTotal<51750  then if liyu_give_item(liyu_tb_tree_award[8]) == 0 then return end -- AddRuntimeStat(46,7,8,1)
    elseif  nTotal>=51750 and nTotal<71250  then if liyu_give_item(liyu_tb_tree_award[9]) == 0 then return end -- AddRuntimeStat(46,7,9,1)
    else                                         if liyu_give_item(liyu_tb_tree_award[10])== 0 then return end -- AddRuntimeStat(46,7,10,1)
    end
    set_task_bit("tskid_getaward",LIYU_TSK_BIT_AWARD.tree,1)
end

function liyu_get_tong_award()
    if liyu_condition_check()~=1 then return end;
    if GetTime()-GetJoinTongTime() < LIYU_TONG_DATE_LIMIT then
        Talk(1,"","Ngi v祇 bang ch璦  7 ng祔 kh玭g th� tham gia nh薾 thng")
        Msg2Player("Ngi v祇 bang ch璦  7 ng祔 kh玭g th� tham gia nh薾 thng")
        return
    end
    if get_task("tskid_sef_score") < LIYU_SEF_SCORE_LIMIT then
        Talk(1,"","Ngi c�  c鑞g hi課 c� nh﹏ kh玭g  150 kh玭g th� tham gia nh薾 thng")
        Msg2Player("Ngi c�  c鑞g hi課 c� nh﹏ kh玭g  150 kh玭g th� tham gia nh薾 thng")
        return
    end
    local szTongName = GetTongName();
    if liyu_local_buf[szTongName] == nil then return end; -- 一般不会出现这种奇葩情况=。=
    local bTongAward = get_task_bit("tskid_getaward",LIYU_TSK_BIT_AWARD.tong)
    if bTongAward == 1 then
        Talk(1,"","B筺  nh薾 ph莕 thng x誴 h筺g  c鑞g hi課 ho箃 ng C﹜ Ti猲 Dc (Bang) r錳.")
        Msg2Player("B筺  nh薾 ph莕 thng x誴 h筺g  c鑞g hi課 ho箃 ng C﹜ Ti猲 Dc (Bang) r錳.")
        return
    end
    local nTotal = liyu_local_buf[szTongName][8]
    if nTotal < 1500 then
        Talk(1,"","Bang c�  trng th祅h C﹜ Ti猲 Dc di 1500 甶觤 kh玭g c� ph莕 thng x誴 h筺g  c鑞g hi課 ho箃 ng C﹜ Ti猲 Dc (Bang).")
        return 
    end
    if  GetSafeName() ~= liyu_local_buf[szTongName][2] and 
        GetSafeName() ~= liyu_local_buf[szTongName][4] and
        GetSafeName() ~= liyu_local_buf[szTongName][6] then
        Talk(1,"",format("B筺 kh玭g ph秈 Top 3  c鑞g hi課 c馻 bang <color=yellow>%s<color>, kh玭g th� nh薾 thng x誴 h筺g  c鑞g hi課 ho箃 ng C﹜ Ti猲 Dc (Bang).",szTongName))
        return
    end
    if      nTotal>=1500 and nTotal<2500   then if liyu_give_item(liyu_tb_tong_award[1]) == 0 then return end -- AddRuntimeStat(46,8,1,1)
    elseif  nTotal>=2500 and nTotal<3500   then if liyu_give_item(liyu_tb_tong_award[2]) == 0 then return end -- AddRuntimeStat(46,8,2,1)
    elseif  nTotal>=3500 and nTotal<7500   then if liyu_give_item(liyu_tb_tong_award[3]) == 0 then return end -- AddRuntimeStat(46,8,3,1)
    elseif  nTotal>=7500 and nTotal<12600  then if liyu_give_item(liyu_tb_tong_award[4]) == 0 then return end -- AddRuntimeStat(46,8,4,1)
    elseif  nTotal>=12600 and nTotal<27000 then if liyu_give_item(liyu_tb_tong_award[5]) == 0 then return end -- AddRuntimeStat(46,8,5,1)
    elseif  nTotal>=27000 and nTotal<34500 then if liyu_give_item(liyu_tb_tong_award[6]) == 0 then return end -- AddRuntimeStat(46,8,6,1)
    elseif  nTotal>=34500 and nTotal<51750 then if liyu_give_item(liyu_tb_tong_award[7]) == 0 then return end -- AddRuntimeStat(46,8,7,1)
    elseif  nTotal>=51750 and nTotal<71250 then if liyu_give_item(liyu_tb_tong_award[8]) == 0 then return end -- AddRuntimeStat(46,8,8,1)
    else                                        if liyu_give_item(liyu_tb_tong_award[9]) == 0 then return end -- AddRuntimeStat(46,8,9,1)
    end
    set_task_bit("tskid_getaward",LIYU_TSK_BIT_AWARD.tong,1)
end


function liyu_tree_detail()
    local szStr1 = "<color=green>1.<color> Ngi ch琲 c� th� t譵 C﹜ Ti猲 Dc c馻 bang m譶h  ti nc,ngi ch琲  v祇 bang c� th� nh薾 Th飊g Nc t筰 C﹜ Ti猲 Dc bang h閕,ti課 h祅h ti nc 1 l莕.Ngi ch琲 c� th� ti nc 10 l莕 m鏸 ng祔.M鏸 l莕 ti nc, ngi ch琲 s� 頲 thng Kinh nghi謒 v� c� t� l� nh薾 頲 Thu鑓 Gi秈-Th蕄 v� Йn Ho祅g Huy襫 Thi誸,s� gi髉 C﹜ Ti猲 Dc c馻 bang t╪g 1 甶觤  trng th祅h v� nh薾 頲 1 甶觤 c鑞g hi課 ho箃 ng."
    local szStr2 = "<color=green>2.<color> Ngi ch琲 c� th� n ch� Чi S� L� H閕 d飊g Thi猲 Ki猽 L謓h mua Thu鑓 Tr� S﹗.Ngi ch琲 c� th� n ch� C﹜ Ti猲 Dc c馻 bang  n閜 Thu鑓 Tr� S﹗.M鏸 l莕 n閜 Thu鑓 Tr� S﹗, ngi ch琲 s� 頲 nh薾 thng Kinh nghi謒,danh v鋘g Chi誸 Xung X� v� Thu鑓 Gi秈 -Cao, ng th阨 gi髉 C﹜ Ti猲 Dc t╪g 5 甶觤 trng th祅h v� nh薾 頲 5 甶觤 c鑞g hi課 ho箃 ng.Danh v鋘g Chi誸 Xung X� nh薾 頲 khi n閜 Thu鑓 Tr� S﹗ m鏸 ng祔 t鑙 產 100 甶觤."
    local szStr3 = "<color=green>3.<color> Khi ho箃 ng k誸 th骳, t飝 theo  trng th祅h c馻 C﹜ Ti猲 Dc, ngi ch琲 c馻 bang s� nh薾 頲 ph莕 thng tng 鴑g. ч trng th祅h c馻 C﹜ Ti猲 Dc chia l祄: M鴆 1: 500 甶觤; M鴆 2: 1500 甶觤; M鴆 3: 2500 甶觤; M鴆 4: 3500 甶觤; M鴆 5: 7500 甶觤; M鴆 6: 12600 甶觤; M鴆 7: 27000 甶觤; M鴆 8: 34500 甶觤; M鴆 9: 51750 甶觤; M鴆 10: 71250 甶觤 "
    local szStr4 = "<color=green>4.<color> Sau khi ho箃 ng k誸 th骳, s� x誴 h筺g  c鑞g hi課 ho箃 ng c馻 th祅h vi猲 trong bang.V祇 00:00 ng祔 1/10 n 24:00 ng祔 3/10 s� c╪ c� th� h筺g  ph竧 thng.T飝 theo m鴆  trng th祅h C﹜ Ti猲 Dc (Bang)t 頲,ngi ch琲 s� nh薾 頲 ph莕 thng kh竎 nhau."
    --local szStr5 = "<color=green>5.<color> 仙药树成长度档次划分为：第一档：1500-2499点间 第二档：2500-3499点间 第三档：3500-7499点间 第四档：7500-12599点间 第五档：12600-26999点间 第六档：27000-34499点间 第七档：34500-51749点间  第八档：51750-71249点间 第九档：大于等于71250点。"
	local szStr6 = "<color=green>5.<color> 襲 ki謓 nh薾 thng: 1. Th祅h vi猲 v祇 bang ch璦  7 ng祔 kh玭g th� nh薾 thng. 2. Nh薾 thng C﹜ Ti猲 Dc (Bang) y猽 c莡 ngi ch琲 c�  c鑞g hi課 ho箃 ng t 150 甶觤 m韎 頲 nh薾."
	Talk(5,"liyu_handle_talk2yaoxiantree",szStr1,szStr2,szStr3,szStr4,szStr6)
end

function liyu_open_xianyao(szTongName)
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    if IsTongMember() == 0 then
        Talk(1,"","B筺 ch璦 v祇 bang, kh玭g th� m� C﹜ Ti猲 Dc (Bang).")
        return 
    end;
    local nRight = GetTongDuty();
    if nRight ~= 1 and nRight ~= 2 and nRight ~= 3 then
        Talk(1,"","Quy襫 c馻 b筺 kh玭g   m� C﹜ Ti猲 Dc (Bang), h穣 nh� bang ch�, ph� bang ch� ho芻 trng l穙 n m�.")
        return
    end  
    if liyu_local_buf[szTongName] ~= nil then
        Talk(1,"","Bang c馻 b筺  m� C﹜ Ti猲 Dc, kh玭g c莕 m� l筰.")
        return
    end
    liyu_local_buf[szTongName]={ szTongName,"",0,"",0,"",0,0 };
    liyu_handle_talk2yaoxiantree()
end

function liyu_shovel_cd(nCnt)
    local tItems = GetRoomItems(pos_equiproom)
    for i, item_idx in tItems do
        local nG, nD, nP = GetItemInfoByIndex(item_idx);
        if nG == 2 and nD == 1 and nP == 31158 then
            SetItemUseLapse(item_idx,nCnt*18);
        end
    end
end

function liyu_caiyao_award()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    local nRand = random(1,100);
    local bBox = 0;
    local nCnt = 0;
    if     nRand <= 1 then    nCnt = 0; bBox = 1;
    elseif nRand <= 5 then    nCnt = 10;
    elseif nRand <= 20 then   nCnt = 7;
    elseif nRand <= 50 then   nCnt = 5
    else                      nCnt = 3;
    end 
    if gf_Judge_Room_Weight(1, 0) == 1 then
        gf_AddItemEx({2,1,31151,bBox}, "Rng Nguy猲 Li謚 Thu鑓")
        gf_AddItemEx({2,1,31150,nCnt}, "Nguy猲 li謚 thu鑓 gi秈")
        return 1;
    else
        Talk(1,"","Kh玭g gian h祅h trang kh玭g ");
        return 0;
    end
end

function handle_on_use_shovel(nIndex)
    if liyu_check_ms_date() ~= 1 then Talk(1,"","Ho箃 ng  k誸 th骳") return end
    if liyu_condition_check() ~= 1 then return end
    local pos = get_task("tskid_caiyao_pos");
    local posx = floor(pos/10000);
    local posy = floor(mod(pos,10000));
    local m,x,y = GetWorldPos()
    if m ~= 510 then
        Talk(1,"","X蝞g H竔 Thu鑓 ch� 頲 d飊g � Dc Vng чng")
        return
    end
    local k = floor(sqrt((x-posx)^2+(y-posy)^2));
    if k<=3 and k>=0 then
        if DelItemByIndex(nIndex,1) == 1 then
            if liyu_caiyao_award()==1 then
                liyu_get_pos_random();
            else
                AddItem(2,1,31158,1)
                return
            end
        else
            error("L鏸 d飊g X蝞g H竔 Thu鑓.")
        end
    else
        liyu_shovel_cd(5) -- cd 5s
        Talk(1,"","C遪 c竎h v� tr� nguy猲 li謚 <color=yellow>".. floor(k/2).." bc<color>!");
    end
end

function handle_on_use_yaocai_box(nIndex)
    if liyu_check_ms_date() ~= 1 then Talk(1,"","Ho箃 ng  k誸 th骳") return end
    if liyu_condition_check() ~= 1 then return end
    if get_task_bit("tskid_once_dc",LIYU_DC_TSK_BIT.yaocaibox) == 1 then
        Talk(1,"","M鏸 ng祔 m鏸 ngi ch� 頲 d飊g 1 Rng Nguy猲 Li謚 Thu鑓.")
        return
    end
    set_task_bit("tskid_once_dc",LIYU_DC_TSK_BIT.yaocaibox,1)
    if DelItem(2,1,31151,1) == 1 then
        if gf_Judge_Room_Weight(1, 0) == 1 then    
            gf_AddItemEx({2,1,31150,30}, "Nguy猲 li謚 thu鑓 gi秈")
        else
            Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
            set_task_bit("tskid_once_dc",LIYU_DC_TSK_BIT.yaocaibox,0);
        end
    end
end

function liyu_handle_on_kill_npc(data, para)
    if liyu_check_ms_date() ~= 1 then return end
    if liyu_condition_check(1) ~= 1 then return end
    local nRand = random(1,1000);
    if data[1] == "Thi猲  S竧 Th�" then
        if nRand <= 800 then
            if gf_Judge_Room_Weight(1, 0) == 1 then
                gf_AddItemEx({2,1,31161,1}, "Кn Thu鑓 Gi秈")
            else
                Msg2Player("H祅h trang c馻 b筺 kh玭g  � tr鑞g, kh玭g th� nh薾 頲 o c� ho箃 ng.")
            end
        elseif nRand <=810 then
            if gf_Judge_Room_Weight(1, 0) == 1 then
                gf_AddItemEx({2,1,31159,1}, "Ph竜 T輓 Hi謚 C莡 C鴘")
                -- AddRuntimeStat(46,3,1,1)
            else
                Msg2Player("H祅h trang c馻 b筺 kh玭g  � tr鑞g, kh玭g th� nh薾 頲 o c� ho箃 ng.")
            end
        end
    elseif data[1] == "Thi猲  V� S�"or data[1] == "Thi猲  Ti詎 Th�" then
        if nRand <= 30 then
            if gf_Judge_Room_Weight(1, 0) == 1 then
                gf_AddItemEx({2,1,31161,1}, "Кn Thu鑓 Gi秈");
            else
                Msg2Player("H祅h trang c馻 b筺 kh玭g  � tr鑞g, kh玭g th� nh薾 頲 o c� ho箃 ng.")
            end
        elseif nRand <=31 then
            if gf_Judge_Room_Weight(1, 0) == 1 then
                gf_AddItemEx({2,1,31159,1}, "Ph竜 T輓 Hi謚 C莡 C鴘")
                -- AddRuntimeStat(46,3,1,1)
            else
                Msg2Player("H祅h trang c馻 b筺 kh玭g  � tr鑞g, kh玭g th� nh薾 頲 o c� ho箃 ng.")
            end
        end
    end
end

function liyu_check_ms_date()
    local nDate = tonumber(date("%y%m%d"))
    if nDate < LIYU_MISSION_END_DATE then
        return 1;
    end
    return 0;
end

function liyu_condition_check(bFlag)    -- bFlag 为空时，表示自动提醒。否则表示仅做返回，不提醒。
    -- c)90级以上学满55级技能
    local nLv = GetLevel();
    local nTrans = gf_GetTransCount();
    local level = nTrans*100 + nLv;
    local res =1;
    if level < 90 then res = 0 end
    if gf_Check55FullSkill() ~= 1 then res = 0 end;
    if res == 0 then
        if bFlag == nil then
            Talk(1,"","C蕄 90 tr� l猲 v� h鋍  k� n╪g c蕄 55 m韎 頲 tham gia ho箃 ng n祔.")
        end
    end
    return res;
end

function liyu_handle_talk2jieridashi()
    if liyu_check_ms_date() ~= 1 then Talk(1,"","Ho箃 ng  k誸 th骳") return end
    local szTitle = format("%s, sau cu閏 chi課 Tr魕 Long S琻, i qu﹏ Thi猲  Gi竜 i b筰, r髏 kh醝 Trung Nguy猲, nh璶g v蒼 c遪 m閠 s� ph莕 t� Thi猲  Gi竜 l萵 tr鑞 mu鑞 ti誴 t鬰 ph� ho筰 s� b譶h y猲 c馻 Trung Nguy猲. T誸 Trung Thu 產ng n g莕, b鋘 Thi猲  Gi竜 n祔  chi誱 l躰h Thanh Kh� чng, c遪 nh d飊g thu鑓 bi課 C� Ch衟 �  th祅h Qu竔 C� t蕁 c玭g th玭 d﹏, ph� ho筰 h譶h tng t鑤 p c馻 C� Ch衟 trong l遪g m鋓 ngi",
    liyu_szNpcName
    )
    local tSay = {}

    tinsert(tSay,"Xem ho箃 ng 1/liyu_check_act1")
    tinsert(tSay,"Xem ho箃 ng 2/liyu_check_act2")
    if liyu_condition_check(1) == 1 then 
        tinsert(tSay,"Ch� Thu鑓 Gi秈/liyu_make_med")
        tinsert(tSay,"Nhi謒 v� t輈h l騳 online h籲g ng祔/liyu_daily_task")
        tinsert(tSay,"Nh薾 5 X蝞g H竔 Thu鑓/liyu_get_shovel")
        tinsert(tSay,"Mua Ph竜 T輓 Hi謚 C莡 C鴘/liyu_buy_flares")
        tinsert(tSay,"D飊g 1 Thi猲 Cang L謓h mua Ph竜 T輓 Hi謚 C莡 C鴘/liyu_buy_flares_with_tiangang")
        tinsert(tSay,"Mua Thu鑓 Tr� S﹗/liyu_buy_insecticide")
        tinsert(tSay,"D飊g 1 Thi猲 M玭 Kim L謓h mua Thu鑓 Tr� S﹗/liyu_buy_insecticide_with_tianmen")
        tinsert(tSay,"D飊g M秐h i H閜 Ngo筰 Trang H錸g Phong/liyu_get_chinese_box")
        tinsert(tSay,"S� d鬾g 甶觤 t輈h ho箃 ng i Thu鑓 Gi秈-Cao/liyu_buy_med_by_bossscore_talk")
        -- tinsert(tSay,"Test init/init")
        -- tinsert(tSay,"_refresh_caiyaonpc init/_refresh_caiyaonpc")
        -- tinsert(tSay,"liyu_writeFile/liyu_writeFile")
        -- tinsert(tSay,"add()/add_score")
    else
        szTitle = szTitle.."<color=red>C蕄 90 tr� l猲 v� h鋍  k� n╪g c蕄 55 m韎 頲 tham gia ho箃 ng n祔.<color>"
    end
    tinsert(tSay,"R阨 kh醝/nothing")
    Say(szTitle,getn(tSay),tSay)
end

function liyu_buy_med_by_bossscore_talk()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    if liyu_condition_check()~=1 then return end;
    local nScore = get_task("tskid_bossscore")
    local szTitle = format("觤 t輈h ho箃 ng hi謓 t筰 c馻 b筺 l�: %d 甶觤\n<color=red>l璾 �: i 1 Thu鑓 Gi秈-Cao s� ti猽 hao 20 甶觤 t輈h ho箃 ng<color>",nScore)
    local tbSay = {}
    tinsert(tbSay,format("i Thu鑓 Gi秈-Cao/#liyu_buy_med_by_bossscore(%d)",nScore))
    tinsert(tbSay,"R阨 kh醝/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function liyu_buy_med_by_bossscore(nScore)
    local nCnt = floor( nScore/LIYU_BOSSSOCRE_PER_MED );
    if nCnt > 1000 then  nCnt = 1000 end
    AskClientForNumber("liyu_buy_med_by_bossscoreCB", 0, nCnt, "C莕 i bao nhi猽 c竔?");
end 

function liyu_buy_med_by_bossscoreCB(nNum)
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    if nNum == 0 then return end;
    local nScore = get_task("tskid_bossscore")
    if nScore < nNum * LIYU_BOSSSOCRE_PER_MED then
        WriteLog("liyu_buy_med_by_bossscoreCB error")
        return 
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then
        Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
        return 
    end
    gf_AddItemEx({2,1,31154,nNum}, "Thu鑓 Gi秈-Cao") --解药改为兑换形式发放
    -- AddRuntimeStat(46,1,3,nNum)
    set_task("tskid_bossscore",nScore-nNum * LIYU_BOSSSOCRE_PER_MED)
end

function liyu_get_chinese_box()
    if gf_Judge_Room_Weight(1, 0) == 1 then
        if DelItem(2,1,31164,100)==1 then
            gf_AddItemEx({2,1,31163,1}, "H閜 Ngo筰 Trang H錸g Phong")
        else
            Talk(1,"","M秐h B� Ngo筰 Trang H錸g Phong kh玭g  100, kh玭g th� i")
            return 
        end
    else
        Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
        return
    end
end

function liyu_use_chinese_piece()
    local nCnt = GetItemCount(2,1,31164)
    AskClientForNumber("liyu_use_chinese_pieceCB", 0, nCnt, "C莕 d飊g bao nhi猽?");
end
function liyu_use_chinese_pieceCB(nNum)
    if DelItem(2,1,31164,nNum) then
        ornament_add_score(nNum*LIYU_POWER_OF_PIECE)
        Msg2Player(format("Nh薾 頲 %d 甶觤 Phong Hoa!",nNum*LIYU_POWER_OF_PIECE))
    else
        Talk(1,"","S� d鬾g th蕋 b筰")
    end
end


function liyu_check_act1()
    local szTitle = format("%s g莕 y Thanh Kh� чng b� b鋘 t祅 d� c馻 Thi猲  Gi竜 chi誱 l躰h, ch髇g nh d飊g thu鑓 l祄 C� Ch衟 �  bi課 th祅h Qu竔 C� t蕁 c玭g th玭 d﹏, ph� ho筰 h譶h tng t鑤 p c馻 C� Ch衟 trong l遪g m鋓 ngi. V� L﹎ Minh ph竧 hi謓 頲 ﹎ m璾 c馻 ch髇g, b竜 v韎 S� Gi� L� H閕 hi謚 tri謚 c竎 hi謕 kh竎h n ti猽 di謙 ch髇g, tham gia ho箃 ng t譵 thu鑓 gi秈 s� nh薾 頲 ph莕 thng phong ph�. <color=red>C竎 hi謕 kh竎h n Thanh Kh� чng ti猽 di謙 Thi猲  V� S�, Thi猲  Ti詎 Th� v� Thi猲  S竧 Th� s� nh薾 頲 Кn Thu鑓 Gi秈. S� d鬾g Ph竜 T輓 Hi謚 C莡 C鴘 v� ti猽 di謙 Thi猲  Чi u M鬰 c� th� nh薾 頲 甶觤 t輈h ho箃 ng, s� d鬾g 甶觤 t輈h ho箃 ng c� th� i Thu鑓 Gi秈-Cao t筰 ho箃 ng i s�.<color>Bang ch�, ph� bang ch� ho芻 trng l穙 c馻 bang c遪 c� th� n Th祅h Й m� C﹜ Ti猲 Dc (Bang)  th祅h vi猲 bang nh薾 頲 Thu鑓 Gi秈.",liyu_szNpcName)
    local tSay = {}
    tinsert(tSay,"V� trang trc/liyu_handle_talk2jieridashi")
    tinsert(tSay,"Quay l筰 sau!/nothing")
    Say(szTitle,getn(tSay),tSay)
end

function liyu_check_act2()
    local szSex = "Hi謕 s�" if GetSex()==2 then szSex = "N� hi謕 " end
    local szTitle = format("%s, g莕 y Thanh Kh� чng b� b鋘 t祅 d� c馻 Thi猲  Gi竜 chi誱 l躰h, ch髇g nh d飊g thu鑓 l祄 C� Ch衟 �  bi課 th祅h Qu竔 C� t蕁 c玭g th玭 d﹏. S� Gi� L� H閕 hi謚 tri謚 c竎 hi謕 kh竎h d飊g Thu鑓 Gi秈 trong tay gi秈 c鴘 Qu竔 C� Ch衟 b� Thi猲  Gi竜 甶襲 khi觧. %s c� th� n <color=green>Long Tuy襫 Th玭 {176,183}<color> gi秈 c鴘 Qu竔 C� Ch衟 H� у. N閜 Thu鑓 Gi秈-Th蕄 v� Thu鑓 Gi秈-Trung s� nh薾 頲 Rng L� H閕-Thng, n閜 Thu鑓 Gi秈-Cao s� nh薾 頲 Rng L� H閕-Cao, n閜 Thu鑓 Gi秈 c Bi謙 s� nh薾 頲 Rng L� H閕-H祇 Hoa.",liyu_szNpcName,szSex)
    local tSay = {}
    tinsert(tSay,"V� trang trc/liyu_handle_talk2jieridashi")
    tinsert(tSay,"Quay l筰 sau!/nothing")
    Say(szTitle,getn(tSay),tSay)
end
function liyu_make_med()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    local szSex = "Hi謕 s�" if GetSex()==2 then szSex = "N� hi謕 " end
    local szTitle = "Ch� Thu鑓 Gi秈"
    local tSay = {}
    tinsert(tSay,"N閜 1 Кn Thu鑓 Gi秈 v� 1 Nguy猲 li謚 thu鑓 gi秈/#liyu_handin_med(1)")
    tinsert(tSay,"N閜 1 Кn Thu鑓 Gi秈 v� 2 Nguy猲 li謚 thu鑓 gi秈/#liyu_handin_med(2)")
    tinsert(tSay,"N閜 1 Кn Thu鑓 Gi秈 v� 3 Nguy猲 li謚 thu鑓 gi秈/#liyu_handin_med(3)")
    tinsert(tSay,"V� trang trc/liyu_handle_talk2jieridashi")
    tinsert(tSay,"Quay l筰 sau!/nothing")
    Say(szTitle,getn(tSay),tSay)
end
function liyu_handin_med( nCnt )
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    -- 制作解药
    if DelItem(2,1,31161,1) ~= 1 then
        Talk(1,"","B筺 kh玭g c� Кn Thu鑓 Gi秈, kh玭g th� ch� thu鑓 gi秈.")
        return
    end
    if DelItem(2,1,31150,nCnt) ~= 1 then
        Talk(1,"","Nguy猲 li謚 kh玭g , ch� thu鑓 gi秈 th蕋 b筰.")
        AddItem(2,1,31161,1)
        return
    end

    if gf_Judge_Room_Weight(1, 0) == 1 then
        local nRand = random(1,100)
        if nCnt == 1 then
            if nRand <=50 then
                gf_AddItemEx({2,1,31152,1}, "Thu鑓 Gi秈-Th蕄")
                -- AddRuntimeStat(46,1,1,1)
            else
                Talk(1,"","Ch� thu鑓 gi秈 th蕋 b筰")
                Msg2Player("Ch� thu鑓 gi秈 th蕋 b筰")
                return
            end
        elseif nCnt == 2 then
            gf_AddItemEx({2,1,31152,1}, "Thu鑓 Gi秈-Th蕄")
            -- AddRuntimeStat(46,1,1,1)
        else 
            gf_AddItemEx({2,1,31153,1}, "Thu鑓 Gi秈-Trung")
            -- AddRuntimeStat(46,1,2,1)
        end
    else
        AddItem(2,1,31161,1)
        AddItem(2,1,31150,nCnt)
        Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
    end

end

function liyu_daily_task()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    local szSex = "Hi謕 s�" if GetSex()==2 then szSex = "N� hi謕 " end
    local szTitle = ""
    local tSay = {}

    local nEndTime = get_task("tskid_daily_end_time")
    local nCurTime = GetTime();
    local nRes     = nEndTime - nCurTime;
    if nEndTime == 0 then
        szTitle = format("%s, trc ti猲 h穣 m� nhi謒 v� online ng祔.",liyu_szNpcName)
        tinsert(tSay,"B総 u m gi� online/liyu_start_daily_task")
    elseif nEndTime == -1 then
        szTitle = format("%s, h玬 nay b筺  ho祅 th祅h nhi謒 v� online ng祔, ng祔 mai h穣 quay l筰.",liyu_szNpcName)
    elseif nRes <= 0 then
        szTitle = format("%s,  ho祅 th祅h nhi謒 v� online ng祔, c� th� nh薾 thng.",liyu_szNpcName)
        tinsert(tSay,"Nh薾 l蕐 ph莕 thng./liyu_give_daily_award")
    else
        local nHour = floor( nRes/3600 )
        local nMin  = floor((nRes - nHour*3600)/60)
        szTitle = format("%s,  ho祅 th祅h nhi謒 v� c莕 online th猰 %d gi� %d ph髏.",liyu_szNpcName,nHour,nMin)
        if nRes < 60 then
            szTitle = format("%s,  ho祅 th祅h nhi謒 v� c莕 online th猰 <1 ph髏.",liyu_szNpcName)
        end
    end
    tinsert(tSay,"V� trang trc/liyu_handle_talk2jieridashi")
    tinsert(tSay,"R阨 kh醝/nothing")
    Say(szTitle,getn(tSay),tSay)
end

function liyu_start_daily_task()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    local nEndTime = get_task("tskid_daily_end_time")
    if nEndTime ~= 0 then
        Talk(1,"liyu_daily_task","B筺  m� nhi謒 v� online ng祔, kh玭g th� m� l筰")
        return 0;
    end
    local nCurTime = GetTime()
    set_task("tskid_daily_end_time",nCurTime+LIYU_ONLINE_TIME);
    Talk(1,"liyu_daily_task","B筺  m� nhi謒 v� online ng祔.")
end

function liyu_give_daily_award()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    if gf_Judge_Room_Weight(1, 0) == 1 then
        set_task("tskid_daily_end_time",-1)
        gf_AddItemEx({2,1,31153,2}, "Thu鑓 Gi秈-Trung")
        -- AddRuntimeStat(46,1,2,2)
        -- AddRuntimeStat(46,9,1,1)
    else
        Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
    end
end

function liyu_get_pos_random()
    local nRand = random( 1,getn(liyu_caiyao) );
    set_task("tskid_caiyao_pos",liyu_caiyao[nRand][1]*10000+liyu_caiyao[nRand][2]);
end

function liyu_get_shovel()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    if liyu_condition_check()~=1 then return end;
    if get_task_bit("tskid_once_dc",LIYU_DC_TSK_BIT.shovel) == 1 then
        Talk(1,"liyu_handle_talk2jieridashi","M鏸 ng祔 m鏸 ngi ch� 頲 nh薾 x蝞g 1 l莕.")
        return
    end
    if gf_Judge_Room_Weight(1, 0) == 1 then
        set_task_bit("tskid_once_dc",LIYU_DC_TSK_BIT.shovel,1)    
        gf_AddItemEx({2,1,31158,5}, "X蝞g H竔 Thu鑓")
        liyu_get_pos_random();
    else
        Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
    end
end

function liyu_buy_flares()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    if liyu_condition_check()~=1 then return end
    if DelItem(2,97,236,1) ~= 1 then
        Talk(1,"","B筺 kh玭g c�  Thi猲 Ki猽 L謓h")
        return
    end 
    if gf_Judge_Room_Weight(1, 0) == 1 then
        gf_AddItemEx({2,1,31159,1}, "Ph竜 T輓 Hi謚 C莡 C鴘")
        -- AddRuntimeStat(46,3,1,1)
    else
        Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
        AddItem(2,97,236,1)
    end
end
function liyu_buy_flares_with_tiangang()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    if liyu_condition_check()~=1 then return end
    if DelItem(2,95,204,1) ~= 1 then
        Talk(1,"","B筺 kh玭g c�  Thi猲 Cang L謓h")
        return
    end 
    if gf_Judge_Room_Weight(1, 0) == 1 then
        gf_AddItemEx({2,1,31159,40}, "Ph竜 T輓 Hi謚 C莡 C鴘")
        -- AddRuntimeStat(46,3,1,40)
        -- AddRuntimeStat(46,5,1,1)
    else
        Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
        AddItem(2,95,204,1)
    end
end

function liyu_buy_insecticide()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    if liyu_condition_check()~=1 then return end
    if DelItem(2,97,236,1) ~= 1 then
        Talk(1,"","B筺 kh玭g c�  Thi猲 Ki猽 L謓h")
        return
    end 
    if gf_Judge_Room_Weight(1, 0) == 1 then
        gf_AddItemEx({2,1,31160,1}, "Thu鑓 Tr� S﹗")
        -- AddRuntimeStat(46,4,1,1)
    else
        Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
        AddItem(2,97,236,1)
    end
end
function liyu_buy_insecticide_with_tianmen()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho箃 ng  k誸 th骳") return end
    if liyu_condition_check()~=1 then return end
    if DelItem(2,1,30370,1) ~= 1 then
        Talk(1,"","B筺 kh玭g c�  Thi猲 M玭 Kim L謓h")
        return
    end 
    if gf_Judge_Room_Weight(1, 0) == 1 then
        gf_AddItemEx({2,1,31160,40}, "Thu鑓 Tr� S﹗")
        -- AddRuntimeStat(46,4,1,40)
        -- AddRuntimeStat(46,6,1,1)
    else
        Talk(1,"","Kh玭g gian h祅h trang kh玭g ")
        AddItem(2,1,30370,1)
    end
end

function on_event_server_start()
    liyu_readFile()
    for i=1,getn(liyu_main_npc) do
        CreateNpc(liyu_main_npc[i][1],liyu_main_npc[i][2],liyu_main_npc[i][3],liyu_main_npc[i][4],liyu_main_npc[i][5]);
    end
    CreateNpc(liyu_xianyaotree_npc.template,liyu_xianyaotree_npc.name,liyu_xianyaotree_npc.pos[1],liyu_xianyaotree_npc.pos[2],liyu_xianyaotree_npc.pos[3]);
end
--以下为应用模块的可选配置，只要定义了这些变量和函数，系统就会自动注册和回调
--t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskGroupIdx},
--    {id={"id_score", 1,}, clear="daily"|"weekly"|"monthly", byte_score=1, byte_award=2, }, 
--}
--t_isolate_user_batch_watch_list = { {szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), ...}, }
--t_isolate_batch_export_gdata = { name = data, }
--t_isolate_batch_import_gdata = { name1, name2, }
-- function on_event_player_login(nExchangeComing) end
-- function on_event_daily_clear(nCurDate, nLastDate) end
--function on_init() end
--function on_init_ok() end
--function on_uninit() end
--function on_export_gdata() end
--function on_import_gdata() end
--function on_add_watches() end
--function on_new_day(nToday) end
--function on_event_player_logout() end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
--function on_first_login_clear() end --isolate上线后第一次登录时的清理
----------------------------------------------------------------
--                         Debug                              --
----------------------------------------------------------------
-- function init()
--     set_task("tskid_daily_end_time",0)
--     set_task("tskid_once_dc",0)
--     set_task("tskid_getaward",0)
--     set_task("tskid_watering",0)
-- end

-- function test_add_score()
--     local szTongName = GetTongName();
--     if liyu_local_buf[szTongName] == nil then return end
--     liyu_local_buf[szTongName][8] = liyu_local_buf[szTongName][8] + 10000
-- end
-- function add_score()
--     set_task("tskid_bossscore",1000);
-- end
---------------------------------------SDB-------------------------------------------
-- SDB已废弃不用，现在采用文件形式保存数据。
-- LIYU_SDBKEY = "liyuchallenge"
-- -- File_name   = "\\script\\isolate\\online_activites\\liyu_challenge\\liyu_sdb.lua"
-- function liyu_readFile()()
--     local sdb = SDB(LIYU_SDBKEY, 0, 0);
-- 	sdb:apply2(liyu_readFile()_cb)
-- end
-- function liyu_readFile()_cb(nCount, data)
--     liyu_local_buf = {};
--     local tTemp = {}
--     for i = 1, nCount do
--         local tTmp = data["head"..i]
--         tTemp = {tTmp[1],tTmp[2],tTmp[3],tTmp[4],tTmp[5],tTmp[6],tTmp[7],tTmp[8]};
--         liyu_local_buf[tTmp[1]] = tTemp;
--     end
-- end

-- function liyu_writeFile()
--     local sdb = SDB(LIYU_SDBKEY, 0, 0);
--     sdb:delete()
--     local sdb = SDB(LIYU_SDBKEY, 0, 0);
--     local i = 1;
--     for key,var in liyu_local_buf do
--         local tTmp = var
--         local id = "head"..i;
--         sdb[id] = {"ssdsdsdd", tTmp[1],tTmp[2],tTmp[3],tTmp[4],tTmp[5],tTmp[6],tTmp[7],tTmp[8]};
--         i = i + 1;
--     end
-- end

---------------------------------------SDB-------------------------------------------
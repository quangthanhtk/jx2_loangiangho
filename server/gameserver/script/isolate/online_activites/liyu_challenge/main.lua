--����ģ�黯��һ����׼���ļ�����ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������������Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�������ջص�Ӱ��Ч��
Import("\\settings\\static_script\\lib\\item_define.lua")
Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\script\\lib\\globalfunctions.lua")
-- Include("\\script\\lib\\sdb.lua")
Include("\\script\\isolate\\online_activites\\liyu_challenge\\liyu_mission2.lua")
Include("\\script\\isolate\\online_activites\\liyu_challenge\\data.lua")
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Include("\\script\\function\\ornament\\ornament.lua")

t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "liyu_challenge",
    szViewName 			= "Chi�n ��u b�o v� C� Ch�p",
    nTalkBeginDate		= 20160915,
    nBeginDate 			= 20160915,
    nEndDate 			= 20161003,
    nTaskGroup 			= 2,
    nTaskGroupVersion	= 24,
}

LIYU_ONLINE_TIME        = 180*60--180*60-- ÿ������������Ҫ��ʱ�䣬��λs
LIYU_WATERING_LIMIT     = 10            -- ÿ����ҿɽ�ˮ10��
LIYU_NPC_LIMIT          = 20            -- ������ͷĿBOSS��������
LIYU_NPC_LIFE_TIME      = 20*60         -- ������ͷĿBOSS���ʱ��
LIYU_MISSION_END_DATE   = 161001        -- 2016 10 01 ���񲿷ֽ������콱���̿�ʼ
LIYU_HIGH_MED_LIMIT     = 100           -- ʹ�ø߼���ҩ��ÿ�մ�������
LIYU_TOP_MED_LIMIT      = 200           -- ʹ�ø߼���ҩ��ÿ�մ�������
LIYU_WATER_EXP          = 1000000       -- ��ˮ���õľ���
LIYU_CATCH_EXP          = 500000        -- ������õľ���
LIYU_CATCH_ADD_SCORE    = 5             -- ׽��ӵķ���
LIYU_WATER_ADD_SCORE    = 1             -- ��ˮ�ӵķ���
LIYU_POP_CATCH_BUG      = 5             -- �������Ӷ��ٵ��۳�������
LIYU_POP_WATER          = 10            -- ��ˮ���Ӷ��ٵ��۳�������
LIYU_MAX_POP_PER_DAY    = 100

LIYU_TONG_DATE_LIMIT    = 7*24*3600     -- ������Ҫ��������ô��ʱ��
LIYU_SEF_SCORE_LIMIT    = 150           -- ����������Ҫ���150�ֲ��ܲ����콱
LIYU_POWER_OF_PIECE     = 150           -- һ�������Ƭ��150�绪����
LIYU_GIVE_MED_EXP1      = 500000        -- �ύ�ͼ���ҩ�ľ���
LIYU_GIVE_MED_EXP2      = 800000        -- ��
LIYU_GIVE_MED_EXP3      = 1000000       -- ��
LIYU_GIVE_MED_EXP4      = 1000000       -- ��
LIYU_SUMMON_BOSS_SCORE  = 14            -- �ٻ�������ͷĿ 14��
LIYU_SLAIN_BOSS_SCORE   = 7             -- ɱ��������ͷĿ 7��
LIYU_BOSSSOCRE_PER_MED  = 20            -- ÿƿ�߼���ҩ����BOSS����
liyu_szNpcName = "<color=gold>S� Gi� L� H�i:<color>"
liyu_main_npc = {
    {"9y_jrds","S� Gi� L� H�i",200,1370,2866},
    {"9y_jrds","S� Gi� L� H�i",300,1743,3510},
    {"9y_jrds","S� Gi� L� H�i",100,1413,2981},
}


liyu_local_buf = {
    -- ["tongName"] = {"tongName", "Player1", nScore1, "Player2", nScore2, "Player3", nScore3, totalScore };    
}


liyu_xianyaotree_npc = {
    template    = "9y_bhxys",
    name        = "C�y Ti�n D��c (Bang)",
    script      = "\\script\\isolate\\online_activites\\liyu_challenge\\npc_caiyaoren.lua",
    pos         = {300,1740,3494}
}
liyu_caiyao_npc = {
    pos = {
            -- Ȫ�ݸ���:
        {105,1550,3185}, {105,1498,3174}, {105,1533,3079}, {105,1582,2987}, {105,1503,3050},
        {105,1570,2907}, {105,1509,2943}, {105,1463,2991}, {105,1425,3083}, {105,1450,2885},
            -- Ȫ�ݸ���:
        {108,1426,3124}, {108,1426,3124}, {108,1559,3160}, {108,1590,3087}, {108,1553,2968},
        {108,1490,2920}, {108,1422,2897}, {108,1403,2984}, {108,1452,3045}, {108,1400,3090},
            -- �ɶ�����:
        {301,1594,3146}, {301,1522,3161}, {301,1452,3054}, {301,1532,3055}, {301,1595,2959},
        {301,1568,2855}, {301,1514,2784}, {301,1444,2855}, {301,1502,2904}, {301,1404,2963},
            -- �ɶ�����:
        {304,1515,2837}, {304,1415,2921}, {304,1478,2969}, {304,1576,3008}, {304,1510,3031},
        {304,1422,3035}, {304,1484,3116}, {304,1574,3159}, {304,1479,3151}, {304,1404,3161},
            -- �ɶ�����:
        {308,1464,3216}, {308,1426,3136}, {308,1405,3046}, {308,1406,2988}, {308,1476,2982},
        {308,1486,3076}, {308,1547,3127}, {308,1584,3068}, {308,1519,3018}, {308,1582,2984},
            -- �꾩���ϣ�
        {201,1539,2832}, {201,1491,2889}, {201,1483,2814}, {201,1429,2830}, {201,1421,2959},
        {201,1528,2946}, {201,1592,3004}, {201,1514,3064}, {201,1418,3100}, {201,1585,3153},
            -- �꾩����:
        {205,1631,2910}, {205,1605,3029}, {205,1782,2857}, {205,1753,3014}, {205,1598,3185},
        {205,1651,3307}, {205,1768,3111}, {205,1854,3023}, {205,1830,3200}, {205,1796,3362},
            -- �꾩����:
        {203,1512,3137}, {203,1556,3039}, {203,1573,2923}, {203,1505,3003}, {203,1417,3095},
        {203,1401,2986}, {203,1387,2894}, {203,1419,2817}, {203,1492,2807}, {203,1558,2815},
    },
    template    = "9y_cyr",
    name        = "Ng��i H�i Thu�c",
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
    [1]={{2,1,30912,100,-1,"Hi�p Ngh�a Chi Ch�ng"}},
    [2]={{2,1,30912,200,-1,"Hi�p Ngh�a Chi Ch�ng"}},
    [3]={{2,95,2084,5,4,"H�o Hi�p L�nh"}},
    [4]={{2,1,30534,5,4,"Thi�t Tinh c�p 2"}},
    [5]={{2,1,30913,7,4,"��ng T� Chi Nguy�n"}},
    [6]={{2,1,30730,4,4,"Kinh M�ch ��ng Nh�n"}},
    [7]={{2,1,30730,6,4,"Kinh M�ch ��ng Nh�n"}},
    [8]={{2,1,30731,2,4,"Kinh M�ch Ng�n Nh�n"}},
    [9]={
        {2,1,30731,4,4,"Kinh M�ch Ng�n Nh�n"},
        {2,1,31058,9,4,"Phi�u Khi�u Chi�n"},
    },
    [10]={
        {2,1,30731,8,4,"Kinh M�ch Ng�n Nh�n"},
        {2,1,31058,15,4,"Phi�u Khi�u Chi�n"},
        {2,1,31162,1,4,"H�p Ngo�i Trang Di�p Th��ng Thu Phong"}
    },
}

liyu_tb_tong_award = {
    [1]={{2,95,2084,10,-1,"H�o Hi�p L�nh"}},
    [2]={{2,1,30534,10,-1,"Thi�t Tinh c�p 2"}},
    [3]={{2,1,30913,14,-1,"��ng T� Chi Nguy�n"}},
    [4]={{2,1,30730,8,-1,"Kinh M�ch ��ng Nh�n"}},
    [5]={{2,1,31064,1,-1,"V�y K� L�n"}},
    [6]={{2,1,31058,6,4,"Phi�u Khi�u Chi�n"},},
    [7]={{2,1,31058,9,4,"Phi�u Khi�u Chi�n"},},
    [8]={
        {2,1,31058,15,4,"Phi�u Khi�u Chi�n"},
        {2,1,31162,1,4,"H�p Ngo�i Trang Di�p Th��ng Thu Phong"},
    },
    [9]={
        --{2,1,31162,1,4,"Ҷ�������װ���"},
        {2,1,31074,1,1,"Kh�c B�n Linh Ho�t C�p 2 (�o)"},
    },
}


function _refresh_caiyaonpc()
    if liyu_check_ms_date() ~= 1 then  return end
    Msg2Global("Ng��i H�i Thu�c �� xu�t hi�n � g�n c�c th�nh l�n, c�c ��i hi�p h�y ��n �� t�m �� l�y nguy�n li�u thu�c.")
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
    Msg2Global("Qu�i C� Ch� xu�t hi�n t�i Long Tuy�n Th�n ��nh t�n c�ng th�n d�n, m�i c�c hi�p s� s� d�ng thu�c gi�i �� gi�i c�u Qu�i C� Ch� H� ��.")
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
    Msg2Player(format("Do b�n ra kh�i bang h�i trong th�i gian ho�t ��ng, �� c�ng hi�n ho�t ��ng s� b� tr� ��n %d �i�m.",nNewScore))
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
    yaocaibox = 1,  -- ÿ��һ�ο���ҩ�ı���
    shovel    = 2,  -- ÿ��һ����ȡ��ҩ��
}
LIYU_DC_TSK_BYTE = {
    high_med = 1,   -- ʹ�ø߼���ҩ����
    top_med  = 2,   -- ʹ���ؼ���ҩ����
    add_pop  = 3,   -- ÿ�����۳�����������
}

LIYU_TSK_BIT_AWARD  ={
    tong = 1,
    tree = 2,
}

t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskGroupIdx},
   {id={"tskid_daily_end_time", 1,}, clear="daily" },   -- ÿ�����������ʱ ��ʼ��Ϊ0 ���������Ϊ������ɵ�ʱ��(GetTime()������) �콱��Ϊ-1
   {id={"tskid_once_dc", 2,}, clear="daily" },          -- ÿ��ֻ��ִ��һ�εĲ���������32λ���ΰ�λ��ȡ����ȡ��������table LIYU_DC_TSK_BIT
   {id={"tskid_byte", 3,}, clear="daily" },             -- ���ֽڴ洢������������������255
   {id={"tskid_caiyao_pos", 4,} },                      -- ��¼��ǰ��ҩ������ʹ�õ����ꡣ
   {id={"tskid_sef_score", 5,} },                       -- ��¼�Լ���ҩ���ĵ÷�
   {id={"tskid_watering", 6,}, clear="daily" },         -- ��¼�Լ�ÿ�ս�ˮ�Ĵ���
   {id={"tskid_getpop", 7,}, clear="daily" },           -- ��¼ÿ�ջ�õ��۳�������
   {id={"tskid_getaward", 8,}, },                       -- ��¼�Ƿ��콱
   {id={"tskid_bossscore", 9,}, },                       -- �ٻ��ͻ�ɱBOSS�Ľ�������
}

function on_add_watches() 
	isolate_watch_npc_talk("S� Gi� L� H�i", 100, "liyu_handle_talk2jieridashi")      --����մ�ʹ�Ի�
    isolate_watch_npc_talk("S� Gi� L� H�i", 200, "liyu_handle_talk2jieridashi")
    isolate_watch_npc_talk("S� Gi� L� H�i", 300, "liyu_handle_talk2jieridashi")
    isolate_watch_npc_talk("C�y Ti�n D��c (Bang)", 300, "liyu_handle_talk2yaoxiantree")       --��ҩ�����Ի�
    isolate_watch_npc_talk("Qu�i C� Ch�p H� ��", 106, "liyu_handle_talk2liyuguai")   --������ֶԻ�
    isolate_watch_event("event_kill_npc", "liyu_handle_on_kill_npc", "", 111)   --����Ϫ��ɱ��
    isolate_watch_item_talk(2,1,31151, "handle_on_use_yaocai_box")              --��ҩ�ı���
    isolate_watch_item_talk(2,1,31158, "handle_on_use_shovel")                  --ʹ�ò�ҩ��
    isolate_watch_item_talk(2,1,31156, "handle_on_use_bucket")                  --ʹ��ˮͰ
    isolate_watch_item_talk(2,1,31159, "handle_on_use_flares")                  --ʹ������źŵ�
    isolate_watch_item_talk(2,1,31164, "liyu_use_chinese_piece")                --ʹ���й�����Ƭ
    
    isolate_watch_event("event_kill_npc", "liyu_handle_on_kill_boss", "", 106)   --����Ȫ��ɱ��
end

-- liyu_npc_cnt = 0;
liyu_boss = {}



---------------------------------------ɱBOSS-------------------------------------------

function liyu_refresh_boss()
    if liyu_check_ms_date() ~= 1 then return end
    for i = 1,getn(liyu_boss) do
        local szNpcName = GetNpcName(liyu_boss[i])
        if szNpcName ~= "Thi�n �m ��i ��u M�c" and szNpcName ~= "Thi�n �m Ti�u ��u M�c" then
            tremove(liyu_boss,i);
        end
    end
end

function handle_on_use_flares(nIndex)
    if liyu_check_ms_date() ~= 1 then Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    if liyu_condition_check(1) ~= 1 then
        Talk(1,"",format("V�i th�c l�c hi�n t�i c�a %s, t� � g�i ��u M�c ��ch l� qu� nguy hi�m. H�y r�n luy�n th�m r�i ti�n h�nh. (<color=red>C�n c�p 90 tr� l�n v� h�c �� k� n�ng c�p 55<color>)",szSex))
        return 
    end
    local szSex = "Hi�p s�" if GetSex()==2 then szSex = "N� hi�p " end
    local m,x,y = GetWorldPos()
    if m ~= 106 then
        Talk(1,"","Ph�o T�n Hi�u ch� ���c d�ng � <color=red>Long Tuy�n Th�n<color>")
        return 
    end
    liyu_refresh_boss()
    if getn(liyu_boss) >= LIYU_NPC_LIMIT then
        Talk(1,"","Hi�n c� qu� nhi�u t�n hi�u c�u c�u, h�y th� l�i sau.")
        return
    end

    if DelItem(2,1,31159,1) == 1 then
        local npcid = CreateNpc("9y_tydtm","Thi�n �m ��i ��u M�c",m,x,y);
        tinsert(liyu_boss,npcid);
        SetNpcLifeTime(npcid,LIYU_NPC_LIFE_TIME)
        set_task("tskid_bossscore",get_task("tskid_bossscore")+LIYU_SUMMON_BOSS_SCORE)
        Msg2Player(format("B�n �� s� d�ng Ph�o T�n Hi�u C�u C�u, nh�n ���c %d �i�m t�ch ho�t ��ng.",LIYU_SUMMON_BOSS_SCORE))
    end
end

function liyu_handle_on_kill_boss(data, para)
    if liyu_check_ms_date() ~= 1 then return end
    if liyu_condition_check(1) ~= 1 then return end;
    if data[1] ~= "Thi�n �m Ti�u ��u M�c" and data[1] ~= "Thi�n �m ��i ��u M�c" then return end;
    SetNpcLifeTime(data[3],3)
    for i = 1, getn(liyu_boss) do
        if liyu_boss[i] == data[3] then
            tremove(liyu_boss,i)
            break;
        end
    end
    if data[1] == "Thi�n �m Ti�u ��u M�c" then
        -- gf_AddItemEx({2,1,31153,1}, "�м��Ľ�ҩ")
        -- -- AddRuntimeStat(46,1,2,1)
    else
        -- gf_AddItemEx({2,1,31154,1}, "�߼��Ľ�ҩ") --��ҩ��Ϊ�һ���ʽ����
        -- -- AddRuntimeStat(46,1,3,1)
        set_task("tskid_bossscore",get_task("tskid_bossscore")+LIYU_SLAIN_BOSS_SCORE)   -- ��Ӷһ�����
        Msg2Player(format("B�n �� ti�u Thi�n �m ��i ��u M�c, nh�n ���c %d �i�m t�ch ho�t ��ng.",LIYU_SLAIN_BOSS_SCORE))
    end
end
--------------------------------------------------------------------------------------

function liyu_handle_talk2yaoxiantree()
    if liyu_condition_check(1) ~= 1 then
        local szTitle = "M�t C�y Ti�n D��c th�n k�. (<color=red>C�p 90 tr� l�n v� h�c �� k� n�ng c�p 55 m�i ���c tham gia ho�t ��ng.<color>)"
        local tSay = {}
        tinsert(tSay,"R�i kh�i/nothing")
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
    local szTitle = "M�t C�y Ti�n D��c th�n k�"
    local tSay = {}
    if liyu_local_buf[szTongName] == nil then
        tinsert(tSay,"R�i kh�i/nothing")
    else
        local nSefScore = get_task("tskid_sef_score")
        local nTotScore = liyu_local_buf[szTongName][8];
        szTitle = szTitle..format(", �� tr��ng th�nh hi�n t�i c�a C�y Ti�n D��c (Bang) l�: %s �i�m,�� c�ng hi�n ho�t ��ng c�a b�n l�: %s �i�m(<color=red>l�u �: khi ho�t ��ng k�t th�c, �t nh�t ph�i v�o bang 7 ng�y m�i c� th� nh�n th��ng. Ra kh�i bang h�i s� b� tr� m�t n�a �� c�ng hi�n bang h�i! <color>)", nTotScore, nSefScore)
        tinsert(tSay,"Xem x�p h�ng �� c�ng hi�n ho�t ��ng C�y Ti�n D��c (Bang)/liyu_show_tong_list")
        tinsert(tSay,"Nh�n th��ng tr��ng th�nh C�y Ti�n D��c/liyu_get_tree_award")
        tinsert(tSay,"Nh�n th��ng x�p h�ng �� c�ng hi�n ho�t ��ng C�y Ti�n D��c (Bang)/liyu_get_tong_award")
        -- tinsert(tSay,"test�Ӱ�ṱ�׶�10000/test_add_score")
        
        tinsert(tSay,"R�i kh�i/nothing")
    end
    Say(szTitle,getn(tSay),tSay)
end
function liyu_get_bucket()
     if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
     if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"","Kh�ng gian h�nh trang kh�ng ��") return end
     if BigGetItemCount(2,1,31156) == 0 and  BigGetItemCount(2,1,31157) == 0 and IsTongMember()~=0 then
        gf_AddItemEx({2,1,31156,1}, "Th�ng N��c")
     else
        Talk(1,"","B�n ch�a v�o bang ho�c �� c� Th�ng N��c, kh�ng th� nh�n ti�p.")
     end
end
function liyu_handle_talk2xianyaotree_ms()
    local szTongName = GetTongName();
    local szTitle = "M�t C�y Ti�n D��c th�n k�"
    local tSay = {}
    if liyu_local_buf[szTongName] == nil then
        tinsert(tSay,format("M� C�y Ti�n D��c (Bang)/#liyu_open_xianyao(\"%s\")",szTongName))
        tinsert(tSay,"Quay l�i sau!/nothing")
    else
        local nSefScore = get_task("tskid_sef_score")
        local nTotScore = liyu_local_buf[szTongName][8];
        szTitle = szTitle..format(", �� tr��ng th�nh hi�n t�i c�a C�y Ti�n D��c (Bang) l�: %s �i�m,�� c�ng hi�n ho�t ��ng c�a b�n l�: %s �i�m(<color=red>l�u �: khi ho�t ��ng k�t th�c, �t nh�t ph�i v�o bang 7 ng�y m�i c� th� nh�n th��ng. Ra kh�i bang h�i s� b� tr� m�t n�a �� c�ng hi�n bang h�i! <color>)", nTotScore, nSefScore)
        tinsert(tSay,"Nh�n Th�ng N��c/liyu_get_bucket")
        tinsert(tSay,format("T��i n��c cho C�y Ti�n D��c (H�m nay c�n c� th� t��i %d l�n)/#liyu_water(%d)",LIYU_WATERING_LIMIT-get_task("tskid_watering"),LIYU_WATERING_LIMIT-get_task("tskid_watering")))
        tinsert(tSay,"Tr� s�u cho C�y Ti�n D��c/liyu_catch_bug_talk")
        tinsert(tSay,"Xem x�p h�ng �� c�ng hi�n ho�t ��ng C�y Ti�n D��c (Bang)/liyu_show_tong_list")
        tinsert(tSay,"Gi�i thi�u c�ch ch�i C�y Ti�n D��c (Bang)/liyu_tree_detail")
        tinsert(tSay,"R�i kh�i/nothing")
    end
    Say(szTitle,getn(tSay),tSay)
end

function handle_on_use_bucket(nIndex)
    if liyu_check_ms_date() ~= 1 then Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    if liyu_condition_check() ~= 1 then return end
    local m,x,y = GetWorldPos()
    if m ~= 203 then
        Talk(1,"","H�y ��n <color=green>T�y Bi�n Kinh (198,176)<color> l�y n��c") 
        return
    end
    local k = floor(sqrt((x-1582)^2+(y-2824)^2));
    if k >= 0 and k <= 5 then
        if DelItemByIndex(nIndex,1) == 1 then
            gf_AddItemEx({2,1,31157,1}, "Th�ng N��c ��y N��c")
        else
            error("C� l�i khi l�y n��c")
        end
    else
        Talk(1,"","H�y ��n <color=green>T�y Bi�n Kinh (198,176)<color> l�y n��c") 
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
            gf_AddItemEx({2,1,31152,1}, "Thu�c Gi�i-Th�p")
            -- AddRuntimeStat(46,1,1,1)
        end
        local nRand = random(1,100)
        if nRand <= 10 then
            gf_AddItemEx({2,1,31118,1}, "��n Ho�ng Huy�n Thi�t")
        end
    else
        Talk(1,"","Ch� tr�ng t�i kh�ng ��, h�y ch�a 2 � tr�ng t�i.");
        return 0;
    end 
    local szTongName = GetTongName()
    local szPlayerName = GetSafeName()
    local nGotPop = get_task("tskid_getpop")
    if IsUsePop(6) == 1 then                        -- ����۳����������ã�������������
        AddPop(6,LIYU_POP_WATER)
        Msg2Player(format("Nh�n ���c danh v�ng Chi�t Xung X� %d �i�m",LIYU_POP_WATER))
    else
        Msg2Player("Do b�n kh�ng m� danh v�ng Chi�t Xung X�, n�n kh�ng th� nh�n th��ng danh v�ng Chi�t Xung X�.")
    end 
    gf_Modify("Exp", LIYU_WATER_EXP);
    liyu_add_score(LIYU_WATER_ADD_SCORE)
    return 1;
end

function liyu_water(nWatering)
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    local nCnt = GetItemCount(2,1,31157)
    if nCnt < 1 then
        Talk(1,"liyu_handle_talk2yaoxiantree","Th�ng N��c c�a b�n ch�a c� n��c, kh�ng th� t��i n��c.")
        return
    end
    if nWatering <= 0 then
        Talk(1,"","H�m nay b�n �� t��i qu� nhi�u n��c cho C�y Ti�n D��c, ng�y mai h�y quay l�i.")
        return
    end
    if DelItem(2,1,31157,1) == 1 then
        if liyu_water_award() == 0 then
            AddItem(2,1,31157,1)
            return 
        end
        set_task("tskid_watering",get_task("tskid_watering")+1);
        Talk(1,"","T��i n��c th�nh c�ng")
        gf_AddItemEx({2,1,31156,1}, "Th�ng N��c")
    else
        error("C� l�i khi t��i n��c")
    end
end

function liyu_catch_bug_talk()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    Talk(1,"liyu_catch_bug","M�i b�n n�p<color=yellow> Thu�c Tr� S�u<color>.")
end

function liyu_catch_bug()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    if liyu_condition_check() ~= 1 then return end; 
    local nCnt = GetItemCount(2,1,31160)
    if nCnt > 1000 then nCnt = 1000 end
    AskClientForNumber("liyu_catch_bug_CB", 0, nCnt, "C�n d�ng bao nhi�u?");
end



function liyu_catch_bug_award(nNum)
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    local szTongName = GetTongName()
    local szPlayerName = GetSafeName()
    gf_Modify("Exp", LIYU_CATCH_EXP*nNum);               -- ���Ӿ��顣

    local nGotPop = get_task("tskid_getpop")

    if IsUsePop(6) == 1 then                        -- ����۳����������ã�������������
        if nGotPop+LIYU_POP_CATCH_BUG*nNum <= LIYU_MAX_POP_PER_DAY then
            AddPop(6,LIYU_POP_CATCH_BUG*nNum)
            set_task("tskid_getpop",nGotPop+LIYU_POP_CATCH_BUG*nNum)
            Msg2Player(format("Nh�n ���c danh v�ng Chi�t Xung X� %d �i�m",LIYU_POP_CATCH_BUG*nNum))
        else
            AddPop(6,LIYU_MAX_POP_PER_DAY-nGotPop)
            set_task("tskid_getpop",LIYU_MAX_POP_PER_DAY)
            Msg2Player(format("Nh�n ���c danh v�ng Chi�t Xung X� %d �i�m",LIYU_MAX_POP_PER_DAY-nGotPop))
            Msg2Player(format("M�i ng�y nhi�u nh�t ch� c� th� nh�n ���c %d �i�m danh v�ng Chi�t Xung X� th�ng qua ho�t ��ng tr� s�u.",LIYU_MAX_POP_PER_DAY))
        end
    else
        Msg2Player("Do b�n kh�ng m� danh v�ng Chi�t Xung X�, n�n kh�ng th� nh�n th��ng danh v�ng Chi�t Xung X�.")
    end 
    liyu_add_score(LIYU_CATCH_ADD_SCORE*nNum)
    return 1;
end

function liyu_catch_bug_CB(nNum)
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    if nNum == 0 then return end
    if DelItem(2,1,31160,nNum) == 1 then
        Talk(1,"","Tr� s�u th�nh c�ng")
        liyu_catch_bug_award(nNum)
    else
        Talk(1,"","Thu�c Tr� S�u kh�ng ��, kh�ng th� tr� s�u")
    end
end

function liyu_show_tong_list()
    local szTongName = GetTongName();
    local tTmp = liyu_local_buf[szTongName]
    if tTmp == nil then -- һ�㲻������������(=��=)
        return  
    end
    local szShow = format("Bang: <color=gold>%s<color>",szTongName)
--   1.%s      ����׶ȣ�%d��
--   2.%s      ����׶ȣ�%d��
--   3.%s      ����׶ȣ�%d��]],szTongName,tTmp[2],tTmp[3],tTmp[4],tTmp[5],tTmp[6],tTmp[7]);
    if tTmp[2]~=nil and tTmp[2]~="" then szShow = szShow..format("\n\n1. %s          �� c�ng hi�n ho�t ��ng: %d �i�m",tTmp[2],tTmp[3]) else szShow="Hi�n kh�ng c� x�p h�ng." end
    if tTmp[4]~=nil and tTmp[4]~="" then szShow = szShow..format("\n2.%s          �� c�ng hi�n ho�t ��ng: %d �i�m.",tTmp[4],tTmp[5]) end
    if tTmp[6]~=nil and tTmp[6]~="" then szShow = szShow..format("\n3.%s          �� c�ng hi�n ho�t ��ng: %d �i�m.",tTmp[6],tTmp[7]) end
    local tSay = {}
    tinsert(tSay,"V� trang tr��c/liyu_handle_talk2yaoxiantree")
    tinsert(tSay,"Quay l�i sau!/nothing")
    Say(szShow,getn(tSay),tSay)
end


function liyu_give_item( tItems )
    local nCnt = getn(tItems)
    if gf_Judge_Room_Weight(nCnt, 100*nCnt) == 1 then
        for i=1,nCnt do
            gf_AddItemEx({tItems[i][1],tItems[i][2],tItems[i][3],tItems[i][4],tItems[i][5]}, tItems[i][6])
        end
    else
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
        return 0;
    end 
    return 1;
end

function liyu_get_tree_award()
    if liyu_condition_check()~=1 then return end;
    if GetTime()-GetJoinTongTime() < LIYU_TONG_DATE_LIMIT then
        Talk(1,"","Ng��i v�o bang ch�a �� 7 ng�y kh�ng th� tham gia nh�n th��ng")
        Msg2Player("Ng��i v�o bang ch�a �� 7 ng�y kh�ng th� tham gia nh�n th��ng")
        return
    end
    if get_task("tskid_sef_score") < LIYU_SEF_SCORE_LIMIT then
        Talk(1,"","Ng��i c� �� c�ng hi�n c� nh�n kh�ng �� 150 kh�ng th� tham gia nh�n th��ng")
        Msg2Player("Ng��i c� �� c�ng hi�n c� nh�n kh�ng �� 150 kh�ng th� tham gia nh�n th��ng")
        return
    end
    local szTongName = GetTongName();
    if liyu_local_buf[szTongName] == nil then return end; -- һ�㲻����������������=��=
    local bTreeAward = get_task_bit("tskid_getaward",LIYU_TSK_BIT_AWARD.tree)
    if bTreeAward == 1 then
        Talk(1,"","B�n �� nh�n ph�n th��ng tr��ng th�nh C�y Ti�n D��c r�i.")
        Msg2Player("B�n �� nh�n ph�n th��ng tr��ng th�nh C�y Ti�n D��c r�i.")
        return
    end
    local nTotal = liyu_local_buf[szTongName][8] 
    if nTotal < 500 then
        Talk(1,"","Bang h�i v�i �� tr��ng th�nh hi�n t�i c�a C�y Ti�n D��c (Bang) th�p h�n 500 s� kh�ng c� ph�n th��ng.")
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
        Talk(1,"","Ng��i v�o bang ch�a �� 7 ng�y kh�ng th� tham gia nh�n th��ng")
        Msg2Player("Ng��i v�o bang ch�a �� 7 ng�y kh�ng th� tham gia nh�n th��ng")
        return
    end
    if get_task("tskid_sef_score") < LIYU_SEF_SCORE_LIMIT then
        Talk(1,"","Ng��i c� �� c�ng hi�n c� nh�n kh�ng �� 150 kh�ng th� tham gia nh�n th��ng")
        Msg2Player("Ng��i c� �� c�ng hi�n c� nh�n kh�ng �� 150 kh�ng th� tham gia nh�n th��ng")
        return
    end
    local szTongName = GetTongName();
    if liyu_local_buf[szTongName] == nil then return end; -- һ�㲻����������������=��=
    local bTongAward = get_task_bit("tskid_getaward",LIYU_TSK_BIT_AWARD.tong)
    if bTongAward == 1 then
        Talk(1,"","B�n �� nh�n ph�n th��ng x�p h�ng �� c�ng hi�n ho�t ��ng C�y Ti�n D��c (Bang) r�i.")
        Msg2Player("B�n �� nh�n ph�n th��ng x�p h�ng �� c�ng hi�n ho�t ��ng C�y Ti�n D��c (Bang) r�i.")
        return
    end
    local nTotal = liyu_local_buf[szTongName][8]
    if nTotal < 1500 then
        Talk(1,"","Bang c� �� tr��ng th�nh C�y Ti�n D��c d��i 1500 �i�m kh�ng c� ph�n th��ng x�p h�ng �� c�ng hi�n ho�t ��ng C�y Ti�n D��c (Bang).")
        return 
    end
    if  GetSafeName() ~= liyu_local_buf[szTongName][2] and 
        GetSafeName() ~= liyu_local_buf[szTongName][4] and
        GetSafeName() ~= liyu_local_buf[szTongName][6] then
        Talk(1,"",format("B�n kh�ng ph�i Top 3 �� c�ng hi�n c�a bang <color=yellow>%s<color>, kh�ng th� nh�n th��ng x�p h�ng �� c�ng hi�n ho�t ��ng C�y Ti�n D��c (Bang).",szTongName))
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
    local szStr1 = "<color=green>1.<color> Ng��i ch�i c� th� t�m C�y Ti�n D��c c�a bang m�nh �� t��i n��c,ng��i ch�i �� v�o bang c� th� nh�n Th�ng N��c t�i C�y Ti�n D��c bang h�i,ti�n h�nh t��i n��c 1 l�n.Ng��i ch�i c� th� t��i n��c 10 l�n m�i ng�y.M�i l�n t��i n��c, ng��i ch�i s� ���c th��ng Kinh nghi�m v� c� t� l� nh�n ���c Thu�c Gi�i-Th�p v� ��n Ho�ng Huy�n Thi�t,s� gi�p C�y Ti�n D��c c�a bang t�ng 1 �i�m �� tr��ng th�nh v� nh�n ���c 1 �i�m c�ng hi�n ho�t ��ng."
    local szStr2 = "<color=green>2.<color> Ng��i ch�i c� th� ��n ch� ��i S� L� H�i d�ng Thi�n Ki�u L�nh mua Thu�c Tr� S�u.Ng��i ch�i c� th� ��n ch� C�y Ti�n D��c c�a bang �� n�p Thu�c Tr� S�u.M�i l�n n�p Thu�c Tr� S�u, ng��i ch�i s� ���c nh�n th��ng Kinh nghi�m,danh v�ng Chi�t Xung X� v� Thu�c Gi�i -Cao, ��ng th�i gi�p C�y Ti�n D��c t�ng 5 �i�m tr��ng th�nh v� nh�n ���c 5 �i�m c�ng hi�n ho�t ��ng.Danh v�ng Chi�t Xung X� nh�n ���c khi n�p Thu�c Tr� S�u m�i ng�y t�i �a 100 �i�m."
    local szStr3 = "<color=green>3.<color> Khi ho�t ��ng k�t th�c, t�y theo �� tr��ng th�nh c�a C�y Ti�n D��c, ng��i ch�i c�a bang s� nh�n ���c ph�n th��ng t��ng �ng. �� tr��ng th�nh c�a C�y Ti�n D��c chia l�m: M�c 1: 500 �i�m; M�c 2: 1500 �i�m; M�c 3: 2500 �i�m; M�c 4: 3500 �i�m; M�c 5: 7500 �i�m; M�c 6: 12600 �i�m; M�c 7: 27000 �i�m; M�c 8: 34500 �i�m; M�c 9: 51750 �i�m; M�c 10: 71250 �i�m "
    local szStr4 = "<color=green>4.<color> Sau khi ho�t ��ng k�t th�c, s� x�p h�ng �� c�ng hi�n ho�t ��ng c�a th�nh vi�n trong bang.V�o 00:00 ng�y 1/10 ��n 24:00 ng�y 3/10 s� c�n c� th� h�ng �� ph�t th��ng.T�y theo m�c �� tr��ng th�nh C�y Ti�n D��c (Bang)��t ���c,ng��i ch�i s� nh�n ���c ph�n th��ng kh�c nhau."
    --local szStr5 = "<color=green>5.<color> ��ҩ���ɳ��ȵ��λ���Ϊ����һ����1500-2499��� �ڶ�����2500-3499��� ��������3500-7499��� ���ĵ���7500-12599��� ���嵵��12600-26999��� ��������27000-34499��� ���ߵ���34500-51749���  �ڰ˵���51750-71249��� �ھŵ������ڵ���71250�㡣"
	local szStr6 = "<color=green>5.<color> �i�u ki�n nh�n th��ng: 1. Th�nh vi�n v�o bang ch�a �� 7 ng�y kh�ng th� nh�n th��ng. 2. Nh�n th��ng C�y Ti�n D��c (Bang) y�u c�u ng��i ch�i c� �� c�ng hi�n ho�t ��ng ��t 150 �i�m m�i ���c nh�n."
	Talk(5,"liyu_handle_talk2yaoxiantree",szStr1,szStr2,szStr3,szStr4,szStr6)
end

function liyu_open_xianyao(szTongName)
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    if IsTongMember() == 0 then
        Talk(1,"","B�n ch�a v�o bang, kh�ng th� m� C�y Ti�n D��c (Bang).")
        return 
    end;
    local nRight = GetTongDuty();
    if nRight ~= 1 and nRight ~= 2 and nRight ~= 3 then
        Talk(1,"","Quy�n c�a b�n kh�ng �� �� m� C�y Ti�n D��c (Bang), h�y nh� bang ch�, ph� bang ch� ho�c tr��ng l�o ��n m�.")
        return
    end  
    if liyu_local_buf[szTongName] ~= nil then
        Talk(1,"","Bang c�a b�n �� m� C�y Ti�n D��c, kh�ng c�n m� l�i.")
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
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
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
        gf_AddItemEx({2,1,31151,bBox}, "R��ng Nguy�n Li�u Thu�c")
        gf_AddItemEx({2,1,31150,nCnt}, "Nguy�n li�u thu�c gi�i")
        return 1;
    else
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
        return 0;
    end
end

function handle_on_use_shovel(nIndex)
    if liyu_check_ms_date() ~= 1 then Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    if liyu_condition_check() ~= 1 then return end
    local pos = get_task("tskid_caiyao_pos");
    local posx = floor(pos/10000);
    local posy = floor(mod(pos,10000));
    local m,x,y = GetWorldPos()
    if m ~= 510 then
        Talk(1,"","X�ng H�i Thu�c ch� ���c d�ng � D��c V��ng ��ng")
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
            error("L�i d�ng X�ng H�i Thu�c.")
        end
    else
        liyu_shovel_cd(5) -- cd 5s
        Talk(1,"","C�n c�ch v� tr� nguy�n li�u <color=yellow>".. floor(k/2).." b��c<color>!");
    end
end

function handle_on_use_yaocai_box(nIndex)
    if liyu_check_ms_date() ~= 1 then Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    if liyu_condition_check() ~= 1 then return end
    if get_task_bit("tskid_once_dc",LIYU_DC_TSK_BIT.yaocaibox) == 1 then
        Talk(1,"","M�i ng�y m�i ng��i ch� ���c d�ng 1 R��ng Nguy�n Li�u Thu�c.")
        return
    end
    set_task_bit("tskid_once_dc",LIYU_DC_TSK_BIT.yaocaibox,1)
    if DelItem(2,1,31151,1) == 1 then
        if gf_Judge_Room_Weight(1, 0) == 1 then    
            gf_AddItemEx({2,1,31150,30}, "Nguy�n li�u thu�c gi�i")
        else
            Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
            set_task_bit("tskid_once_dc",LIYU_DC_TSK_BIT.yaocaibox,0);
        end
    end
end

function liyu_handle_on_kill_npc(data, para)
    if liyu_check_ms_date() ~= 1 then return end
    if liyu_condition_check(1) ~= 1 then return end
    local nRand = random(1,1000);
    if data[1] == "Thi�n �m S�t Th�" then
        if nRand <= 800 then
            if gf_Judge_Room_Weight(1, 0) == 1 then
                gf_AddItemEx({2,1,31161,1}, "��n Thu�c Gi�i")
            else
                Msg2Player("H�nh trang c�a b�n kh�ng �� � tr�ng, kh�ng th� nh�n ���c ��o c� ho�t ��ng.")
            end
        elseif nRand <=810 then
            if gf_Judge_Room_Weight(1, 0) == 1 then
                gf_AddItemEx({2,1,31159,1}, "Ph�o T�n Hi�u C�u C�u")
                -- AddRuntimeStat(46,3,1,1)
            else
                Msg2Player("H�nh trang c�a b�n kh�ng �� � tr�ng, kh�ng th� nh�n ���c ��o c� ho�t ��ng.")
            end
        end
    elseif data[1] == "Thi�n �m V� S�"or data[1] == "Thi�n �m Ti�n Th�" then
        if nRand <= 30 then
            if gf_Judge_Room_Weight(1, 0) == 1 then
                gf_AddItemEx({2,1,31161,1}, "��n Thu�c Gi�i");
            else
                Msg2Player("H�nh trang c�a b�n kh�ng �� � tr�ng, kh�ng th� nh�n ���c ��o c� ho�t ��ng.")
            end
        elseif nRand <=31 then
            if gf_Judge_Room_Weight(1, 0) == 1 then
                gf_AddItemEx({2,1,31159,1}, "Ph�o T�n Hi�u C�u C�u")
                -- AddRuntimeStat(46,3,1,1)
            else
                Msg2Player("H�nh trang c�a b�n kh�ng �� � tr�ng, kh�ng th� nh�n ���c ��o c� ho�t ��ng.")
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

function liyu_condition_check(bFlag)    -- bFlag Ϊ��ʱ����ʾ�Զ����ѡ������ʾ�������أ������ѡ�
    -- c)90������ѧ��55������
    local nLv = GetLevel();
    local nTrans = gf_GetTransCount();
    local level = nTrans*100 + nLv;
    local res =1;
    if level < 90 then res = 0 end
    if gf_Check55FullSkill() ~= 1 then res = 0 end;
    if res == 0 then
        if bFlag == nil then
            Talk(1,"","C�p 90 tr� l�n v� h�c �� k� n�ng c�p 55 m�i ���c tham gia ho�t ��ng n�y.")
        end
    end
    return res;
end

function liyu_handle_talk2jieridashi()
    if liyu_check_ms_date() ~= 1 then Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    local szTitle = format("%s, sau cu�c chi�n Tr�y Long S�n, ��i qu�n Thi�n �m Gi�o ��i b�i, r�t kh�i Trung Nguy�n, nh�ng v�n c�n m�t s� ph�n t� Thi�n �m Gi�o l�n tr�n mu�n ti�p t�c ph� ho�i s� b�nh y�n c�a Trung Nguy�n. T�t Trung Thu �ang ��n g�n, b�n Thi�n �m Gi�o n�y �� chi�m l�nh Thanh Kh� ��ng, c�n ��nh d�ng thu�c bi�n C� Ch�p � �� th�nh Qu�i C� t�n c�ng th�n d�n, ph� ho�i h�nh t��ng t�t ��p c�a C� Ch�p trong l�ng m�i ng��i",
    liyu_szNpcName
    )
    local tSay = {}

    tinsert(tSay,"Xem ho�t ��ng 1/liyu_check_act1")
    tinsert(tSay,"Xem ho�t ��ng 2/liyu_check_act2")
    if liyu_condition_check(1) == 1 then 
        tinsert(tSay,"Ch� Thu�c Gi�i/liyu_make_med")
        tinsert(tSay,"Nhi�m v� t�ch l�y online h�ng ng�y/liyu_daily_task")
        tinsert(tSay,"Nh�n 5 X�ng H�i Thu�c/liyu_get_shovel")
        tinsert(tSay,"Mua Ph�o T�n Hi�u C�u C�u/liyu_buy_flares")
        tinsert(tSay,"D�ng 1 Thi�n Cang L�nh mua Ph�o T�n Hi�u C�u C�u/liyu_buy_flares_with_tiangang")
        tinsert(tSay,"Mua Thu�c Tr� S�u/liyu_buy_insecticide")
        tinsert(tSay,"D�ng 1 Thi�n M�n Kim L�nh mua Thu�c Tr� S�u/liyu_buy_insecticide_with_tianmen")
        tinsert(tSay,"D�ng M�nh ��i H�p Ngo�i Trang H�ng Phong/liyu_get_chinese_box")
        tinsert(tSay,"S� d�ng �i�m t�ch ho�t ��ng ��i Thu�c Gi�i-Cao/liyu_buy_med_by_bossscore_talk")
        -- tinsert(tSay,"Test init/init")
        -- tinsert(tSay,"_refresh_caiyaonpc init/_refresh_caiyaonpc")
        -- tinsert(tSay,"liyu_writeFile/liyu_writeFile")
        -- tinsert(tSay,"add()/add_score")
    else
        szTitle = szTitle.."<color=red>C�p 90 tr� l�n v� h�c �� k� n�ng c�p 55 m�i ���c tham gia ho�t ��ng n�y.<color>"
    end
    tinsert(tSay,"R�i kh�i/nothing")
    Say(szTitle,getn(tSay),tSay)
end

function liyu_buy_med_by_bossscore_talk()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    if liyu_condition_check()~=1 then return end;
    local nScore = get_task("tskid_bossscore")
    local szTitle = format("�i�m t�ch ho�t ��ng hi�n t�i c�a b�n l�: %d �i�m\n<color=red>l�u �: ��i 1 Thu�c Gi�i-Cao s� ti�u hao 20 �i�m t�ch ho�t ��ng<color>",nScore)
    local tbSay = {}
    tinsert(tbSay,format("��i Thu�c Gi�i-Cao/#liyu_buy_med_by_bossscore(%d)",nScore))
    tinsert(tbSay,"R�i kh�i/nothing")
    Say(szTitle,getn(tbSay),tbSay)
end

function liyu_buy_med_by_bossscore(nScore)
    local nCnt = floor( nScore/LIYU_BOSSSOCRE_PER_MED );
    if nCnt > 1000 then  nCnt = 1000 end
    AskClientForNumber("liyu_buy_med_by_bossscoreCB", 0, nCnt, "C�n ��i bao nhi�u c�i?");
end 

function liyu_buy_med_by_bossscoreCB(nNum)
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    if nNum == 0 then return end;
    local nScore = get_task("tskid_bossscore")
    if nScore < nNum * LIYU_BOSSSOCRE_PER_MED then
        WriteLog("liyu_buy_med_by_bossscoreCB error")
        return 
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
        return 
    end
    gf_AddItemEx({2,1,31154,nNum}, "Thu�c Gi�i-Cao") --��ҩ��Ϊ�һ���ʽ����
    -- AddRuntimeStat(46,1,3,nNum)
    set_task("tskid_bossscore",nScore-nNum * LIYU_BOSSSOCRE_PER_MED)
end

function liyu_get_chinese_box()
    if gf_Judge_Room_Weight(1, 0) == 1 then
        if DelItem(2,1,31164,100)==1 then
            gf_AddItemEx({2,1,31163,1}, "H�p Ngo�i Trang H�ng Phong")
        else
            Talk(1,"","M�nh B� Ngo�i Trang H�ng Phong kh�ng �� 100, kh�ng th� ��i")
            return 
        end
    else
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
        return
    end
end

function liyu_use_chinese_piece()
    local nCnt = GetItemCount(2,1,31164)
    AskClientForNumber("liyu_use_chinese_pieceCB", 0, nCnt, "C�n d�ng bao nhi�u?");
end
function liyu_use_chinese_pieceCB(nNum)
    if DelItem(2,1,31164,nNum) then
        ornament_add_score(nNum*LIYU_POWER_OF_PIECE)
        Msg2Player(format("Nh�n ���c %d �i�m Phong Hoa!",nNum*LIYU_POWER_OF_PIECE))
    else
        Talk(1,"","S� d�ng th�t b�i")
    end
end


function liyu_check_act1()
    local szTitle = format("%s g�n ��y Thanh Kh� ��ng b� b�n t�n d� c�a Thi�n �m Gi�o chi�m l�nh, ch�ng ��nh d�ng thu�c l�m C� Ch�p � �� bi�n th�nh Qu�i C� t�n c�ng th�n d�n, ph� ho�i h�nh t��ng t�t ��p c�a C� Ch�p trong l�ng m�i ng��i. V� L�m Minh ph�t hi�n ���c �m m�u c�a ch�ng, b�o v�i S� Gi� L� H�i hi�u tri�u c�c hi�p kh�ch ��n ti�u di�t ch�ng, tham gia ho�t ��ng t�m thu�c gi�i s� nh�n ���c ph�n th��ng phong ph�. <color=red>C�c hi�p kh�ch ��n Thanh Kh� ��ng ti�u di�t Thi�n �m V� S�, Thi�n �m Ti�n Th� v� Thi�n �m S�t Th� s� nh�n ���c ��n Thu�c Gi�i. S� d�ng Ph�o T�n Hi�u C�u C�u v� ti�u di�t Thi�n �m ��i ��u M�c c� th� nh�n ���c �i�m t�ch ho�t ��ng, s� d�ng �i�m t�ch ho�t ��ng c� th� ��i Thu�c Gi�i-Cao t�i ho�t ��ng ��i s�.<color>Bang ch�, ph� bang ch� ho�c tr��ng l�o c�a bang c�n c� th� ��n Th�nh �� m� C�y Ti�n D��c (Bang) �� th�nh vi�n bang nh�n ���c Thu�c Gi�i.",liyu_szNpcName)
    local tSay = {}
    tinsert(tSay,"V� trang tr��c/liyu_handle_talk2jieridashi")
    tinsert(tSay,"Quay l�i sau!/nothing")
    Say(szTitle,getn(tSay),tSay)
end

function liyu_check_act2()
    local szSex = "Hi�p s�" if GetSex()==2 then szSex = "N� hi�p " end
    local szTitle = format("%s, g�n ��y Thanh Kh� ��ng b� b�n t�n d� c�a Thi�n �m Gi�o chi�m l�nh, ch�ng ��nh d�ng thu�c l�m C� Ch�p � �� bi�n th�nh Qu�i C� t�n c�ng th�n d�n. S� Gi� L� H�i hi�u tri�u c�c hi�p kh�ch d�ng Thu�c Gi�i trong tay gi�i c�u Qu�i C� Ch�p b� Thi�n �m Gi�o �i�u khi�n. %s c� th� ��n <color=green>Long Tuy�n Th�n {176,183}<color> gi�i c�u Qu�i C� Ch�p H� ��. N�p Thu�c Gi�i-Th�p v� Thu�c Gi�i-Trung s� nh�n ���c R��ng L� H�i-Th��ng, n�p Thu�c Gi�i-Cao s� nh�n ���c R��ng L� H�i-Cao, n�p Thu�c Gi�i ��c Bi�t s� nh�n ���c R��ng L� H�i-H�o Hoa.",liyu_szNpcName,szSex)
    local tSay = {}
    tinsert(tSay,"V� trang tr��c/liyu_handle_talk2jieridashi")
    tinsert(tSay,"Quay l�i sau!/nothing")
    Say(szTitle,getn(tSay),tSay)
end
function liyu_make_med()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    local szSex = "Hi�p s�" if GetSex()==2 then szSex = "N� hi�p " end
    local szTitle = "Ch� Thu�c Gi�i"
    local tSay = {}
    tinsert(tSay,"N�p 1 ��n Thu�c Gi�i v� 1 Nguy�n li�u thu�c gi�i/#liyu_handin_med(1)")
    tinsert(tSay,"N�p 1 ��n Thu�c Gi�i v� 2 Nguy�n li�u thu�c gi�i/#liyu_handin_med(2)")
    tinsert(tSay,"N�p 1 ��n Thu�c Gi�i v� 3 Nguy�n li�u thu�c gi�i/#liyu_handin_med(3)")
    tinsert(tSay,"V� trang tr��c/liyu_handle_talk2jieridashi")
    tinsert(tSay,"Quay l�i sau!/nothing")
    Say(szTitle,getn(tSay),tSay)
end
function liyu_handin_med( nCnt )
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    -- ������ҩ
    if DelItem(2,1,31161,1) ~= 1 then
        Talk(1,"","B�n kh�ng c� ��n Thu�c Gi�i, kh�ng th� ch� thu�c gi�i.")
        return
    end
    if DelItem(2,1,31150,nCnt) ~= 1 then
        Talk(1,"","Nguy�n li�u kh�ng ��, ch� thu�c gi�i th�t b�i.")
        AddItem(2,1,31161,1)
        return
    end

    if gf_Judge_Room_Weight(1, 0) == 1 then
        local nRand = random(1,100)
        if nCnt == 1 then
            if nRand <=50 then
                gf_AddItemEx({2,1,31152,1}, "Thu�c Gi�i-Th�p")
                -- AddRuntimeStat(46,1,1,1)
            else
                Talk(1,"","Ch� thu�c gi�i th�t b�i")
                Msg2Player("Ch� thu�c gi�i th�t b�i")
                return
            end
        elseif nCnt == 2 then
            gf_AddItemEx({2,1,31152,1}, "Thu�c Gi�i-Th�p")
            -- AddRuntimeStat(46,1,1,1)
        else 
            gf_AddItemEx({2,1,31153,1}, "Thu�c Gi�i-Trung")
            -- AddRuntimeStat(46,1,2,1)
        end
    else
        AddItem(2,1,31161,1)
        AddItem(2,1,31150,nCnt)
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
    end

end

function liyu_daily_task()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    local szSex = "Hi�p s�" if GetSex()==2 then szSex = "N� hi�p " end
    local szTitle = ""
    local tSay = {}

    local nEndTime = get_task("tskid_daily_end_time")
    local nCurTime = GetTime();
    local nRes     = nEndTime - nCurTime;
    if nEndTime == 0 then
        szTitle = format("%s, tr��c ti�n h�y m� nhi�m v� online ng�y.",liyu_szNpcName)
        tinsert(tSay,"B�t ��u ��m gi� online/liyu_start_daily_task")
    elseif nEndTime == -1 then
        szTitle = format("%s, h�m nay b�n �� ho�n th�nh nhi�m v� online ng�y, ng�y mai h�y quay l�i.",liyu_szNpcName)
    elseif nRes <= 0 then
        szTitle = format("%s, �� ho�n th�nh nhi�m v� online ng�y, c� th� nh�n th��ng.",liyu_szNpcName)
        tinsert(tSay,"Nh�n l�y ph�n th��ng./liyu_give_daily_award")
    else
        local nHour = floor( nRes/3600 )
        local nMin  = floor((nRes - nHour*3600)/60)
        szTitle = format("%s, �� ho�n th�nh nhi�m v� c�n online th�m %d gi� %d ph�t.",liyu_szNpcName,nHour,nMin)
        if nRes < 60 then
            szTitle = format("%s, �� ho�n th�nh nhi�m v� c�n online th�m <1 ph�t.",liyu_szNpcName)
        end
    end
    tinsert(tSay,"V� trang tr��c/liyu_handle_talk2jieridashi")
    tinsert(tSay,"R�i kh�i/nothing")
    Say(szTitle,getn(tSay),tSay)
end

function liyu_start_daily_task()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    local nEndTime = get_task("tskid_daily_end_time")
    if nEndTime ~= 0 then
        Talk(1,"liyu_daily_task","B�n �� m� nhi�m v� online ng�y, kh�ng th� m� l�i")
        return 0;
    end
    local nCurTime = GetTime()
    set_task("tskid_daily_end_time",nCurTime+LIYU_ONLINE_TIME);
    Talk(1,"liyu_daily_task","B�n �� m� nhi�m v� online ng�y.")
end

function liyu_give_daily_award()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    if gf_Judge_Room_Weight(1, 0) == 1 then
        set_task("tskid_daily_end_time",-1)
        gf_AddItemEx({2,1,31153,2}, "Thu�c Gi�i-Trung")
        -- AddRuntimeStat(46,1,2,2)
        -- AddRuntimeStat(46,9,1,1)
    else
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
    end
end

function liyu_get_pos_random()
    local nRand = random( 1,getn(liyu_caiyao) );
    set_task("tskid_caiyao_pos",liyu_caiyao[nRand][1]*10000+liyu_caiyao[nRand][2]);
end

function liyu_get_shovel()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    if liyu_condition_check()~=1 then return end;
    if get_task_bit("tskid_once_dc",LIYU_DC_TSK_BIT.shovel) == 1 then
        Talk(1,"liyu_handle_talk2jieridashi","M�i ng�y m�i ng��i ch� ���c nh�n x�ng 1 l�n.")
        return
    end
    if gf_Judge_Room_Weight(1, 0) == 1 then
        set_task_bit("tskid_once_dc",LIYU_DC_TSK_BIT.shovel,1)    
        gf_AddItemEx({2,1,31158,5}, "X�ng H�i Thu�c")
        liyu_get_pos_random();
    else
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
    end
end

function liyu_buy_flares()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    if liyu_condition_check()~=1 then return end
    if DelItem(2,97,236,1) ~= 1 then
        Talk(1,"","B�n kh�ng c� �� Thi�n Ki�u L�nh")
        return
    end 
    if gf_Judge_Room_Weight(1, 0) == 1 then
        gf_AddItemEx({2,1,31159,1}, "Ph�o T�n Hi�u C�u C�u")
        -- AddRuntimeStat(46,3,1,1)
    else
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
        AddItem(2,97,236,1)
    end
end
function liyu_buy_flares_with_tiangang()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    if liyu_condition_check()~=1 then return end
    if DelItem(2,95,204,1) ~= 1 then
        Talk(1,"","B�n kh�ng c� �� Thi�n Cang L�nh")
        return
    end 
    if gf_Judge_Room_Weight(1, 0) == 1 then
        gf_AddItemEx({2,1,31159,40}, "Ph�o T�n Hi�u C�u C�u")
        -- AddRuntimeStat(46,3,1,40)
        -- AddRuntimeStat(46,5,1,1)
    else
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
        AddItem(2,95,204,1)
    end
end

function liyu_buy_insecticide()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    if liyu_condition_check()~=1 then return end
    if DelItem(2,97,236,1) ~= 1 then
        Talk(1,"","B�n kh�ng c� �� Thi�n Ki�u L�nh")
        return
    end 
    if gf_Judge_Room_Weight(1, 0) == 1 then
        gf_AddItemEx({2,1,31160,1}, "Thu�c Tr� S�u")
        -- AddRuntimeStat(46,4,1,1)
    else
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
        AddItem(2,97,236,1)
    end
end
function liyu_buy_insecticide_with_tianmen()
    if liyu_check_ms_date() ~= 1 then  Talk(1,"","Ho�t ��ng �� k�t th�c") return end
    if liyu_condition_check()~=1 then return end
    if DelItem(2,1,30370,1) ~= 1 then
        Talk(1,"","B�n kh�ng c� �� Thi�n M�n Kim L�nh")
        return
    end 
    if gf_Judge_Room_Weight(1, 0) == 1 then
        gf_AddItemEx({2,1,31160,40}, "Thu�c Tr� S�u")
        -- AddRuntimeStat(46,4,1,40)
        -- AddRuntimeStat(46,6,1,1)
    else
        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
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
--����ΪӦ��ģ��Ŀ�ѡ���ã�ֻҪ��������Щ�����ͺ�����ϵͳ�ͻ��Զ�ע��ͻص�
--t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskGroupIdx},
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
--function on_first_login_clear() end --isolate���ߺ��һ�ε�¼ʱ������
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
-- SDB�ѷ������ã����ڲ����ļ���ʽ�������ݡ�
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
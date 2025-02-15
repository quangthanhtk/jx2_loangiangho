--这是模块化的一个标准主文件，各模块只需要实现对应的标准事件处理函数，不需要关心这些函数什么时候被调用
--模块跟模块之间不能有Include和调用关系
--所以每个模块是独立的
--不需要的handler请注释调，以免空回调影响效率

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\lib\\normal_exchange.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
Include("\\script\\function\\ornament\\ornament.lua")
t_isolate_base_cfg = { --这是一个必填配置项
    nPriority 			= 1,        --加载优先级 <=0:模块失效 >0:模块有效，数值越大越先加载 1 default
    szEngName 			= "ChristmasActivity",
    szViewName 			= "Event Gi竛g Sinh 2016",
    nTalkBeginDate		= 20161215,
    nBeginDate 			= 20161215,
    nEndDate 			= 20161226,
    nTaskGroup 			= 3,
    nTaskGroupVersion	= 21,
}


CHEFU_NAME      = "<color=green>Xa Phu<color>:"
TREE_NAME       = "<color=green>C﹜ Th玭g Gi竛g Sinh<color>:"
CA2016_STAYTIME = 30*60                              -- 在青沙河战场停留的时间 sec
CA2016_BELL_USE_LIM = 20
CA2016_BOX_USE_LIM = 20 
CA2016_BRANCH_USE_LIM = 20 
CA2016_CHRISTMASDATE1 = 20161225
CA2016_CHRISTMASDATE2 = 20161224
CA2016_HFT_ENDDATE = 20161225                       -- 天阴教黑风堂地图结束日期
CA2016_HFT_OPEN_BEGIN = 1000
CA2016_HFT_OPEN_END   = 2330
CA2016_BOSS_NAME   = "H綾 Phong Л阯g Ch�"
CA2016_BATTLE_TIME_TICK = 5                         -- 黑风堂每5s进行一次计时

CA2016_FLY_COST = {2, 97, 236, 1, "<color=red>1 Thi猲 Ki猽 L謓h<color>"}
CA2016_BELL     = {2, 1, 31179, 6,   "<color=red>6 Chu玭g Gi竛g Sinh<color>"}
CA2016_BOX      = {2, 1, 31178, 12,   "<color=red>12 H閜 Qu� Gi竛g Sinh<color>"}
CA2016_BRANCH   = {2, 1, 31180, 3,   "<color=red>3 Nh竛h Th玭g<color>"}


CA2016_BF_MAPS = {8020, 8021, 8022}                  -- 天阴教黑风堂入口

CA2016_BF_ENTRY = {
    ["300"] = {8020, 1639, 3241},   -- gs1
    ["200"] = {8021, 1639, 3241},   -- gs2
    ["100"] = {8022, 1639, 3241},   -- gs3
}

CA2016_BF_EXIT  = {                                   -- 返回主城位置
    ["8022"] = {100,  1427, 2996},
    ["8021"] = {200,  1385, 2883},
    ["8020"] = {300,  1756, 3538},
}

CA2016_LIHE_NPC = {
    {502,1562,2903},
    {502,1554,2909},
    {502,1562,2909},	
    {502,1557,2919},		
    {502,1580,2910},		
    {502,1584,2901},		
    {502,1588,2910},		
    {502,1581,2922},
}

CA2016_CHEFU_NPC = {
    {502,1604,2897},
    {8020,1488,3331},		
    {8020,1462,3042},		
    {8020,1612,3201},		
    {8020,1710,3099},		
    {8020,1754,3353},
}

CA2016_NPC_POS = {
    {8020,1464,3338},{8020,1477,3354},{8020,1486,3333},{8020,1493,3309},{8020,1509,3326},
    {8020,1464,3291},{8020,1485,3271},{8020,1501,3256},{8020,1526,3230},{8020,1555,3256},
    {8020,1449,3239},{8020,1407,3228},{8020,1386,3192},{8020,1420,3162},{8020,1444,3189},
    {8020,1560,3217},{8020,1493,3193},{8020,1470,3167},{8020,1498,3137},{8020,1482,3112},
    {8020,1579,3235},{8020,1486,3052},{8020,1449,3088},{8020,1426,3060},{8020,1447,3032},
    {8020,1607,3263},{8020,1478,3008},{8020,1501,3032},{8020,1529,3103},{8020,1548,3127},
    {8020,1629,3245},{8020,1585,3125},{8020,1563,3141},{8020,1547,3161},{8020,1530,3145},
    {8020,1596,3213},{8020,1553,3063},{8020,1576,3055},{8020,1605,3085},{8020,1631,3076},
    {8020,1589,3191},{8020,1671,3071},{8020,1695,3072},{8020,1715,3023},{8020,1743,3039},
    {8020,1614,3169},{8020,1747,3099},{8020,1749,3070},{8020,1728,3056},{8020,1722,3081},
    {8020,1632,3188},{8020,1722,3117},{8020,1687,3115},{8020,1657,3120},{8020,1681,3144},
    {8020,1630,3212},{8020,1770,3182},{8020,1794,3181},{8020,1817,3206},{8020,1790,3230},
    {8020,1610,3200},{8020,1712,3170},{8020,1739,3195},{8020,1743,3218},{8020,1736,3250},
    {8020,1738,3278},{8020,1715,3301},{8020,1732,3322},{8020,1756,3317},{8020,1782,3344},
    {8020,1765,3365},{8020,1745,3386},{8020,1723,3361},{8020,1747,3353},{8020,1694,3282},
    {8020,1697,3249},{8020,1682,3233},{8020,1715,3217},{8020,1672,3259},{8020,1645,3265},
    {8020,1659,3290},{8020,1632,3296},{8020,1633,3329},{8020,1660,3327},{8020,1693,3321},
    {8020,1603,3331},{8020,1582,3320},{8020,1586,3285},{8020,1547,3327},{8020,1522,3350},
    {8020,1500,3356},{8020,1524,3291},{8020,1648,3227},{8020,1678,3193},{8020,1648,3164},
    {8020,1630,3146},{8020,1606,3142},{8020,1586,3159},{8020,1560,3186},{8020,1543,3202},
}

CA2016_BOSS_POS = {
    {8020,1472,3216},{8020,1465,3046},{8020,1510,3084},{8020,1571,3109},{8020,1531,3060},	
    {8020,1652,3068},{8020,1774,3076},{8020,1701,3089},{8020,1745,3158},{8020,1762,3207},	
}

CA2016_CHRISTMAS_PACKAGE = {
    {{0,120,41,1,5},"T骾 Gi竛g Sinh H筺h Ph骳"},
    {{0,120,39,1,4},"T骾 Gi竛g Sinh Ch璦 y"},
}

CA2016_KILLNPC_NORMAL_AWARD = {
    {item = {2, 1, 31178, 1, 4}, name = "H閜 qu� gi竛g sinh", rate = 70,      maxrate = 10000, time = 0},
    {item = {2, 1, 31179, 1, 4}, name = "Chu玭g Gi竛g Sinh", rate = 30,      maxrate = 10000, time = 0},
    {item = {2, 1, 31180, 1, 4}, name = "Nh竛h Th玭g Gi竛g Sinh", rate = 0,       maxrate = 10000, time = 0},
}

CA2016_KILLNPC_SPECIAL_AWARD = {
    {1, 500, "H閜 qu� gi竛g sinh", {2, 1, 31178, 1, 1}, 0, 0},
    {1, 400, "Chu玭g Gi竛g Sinh", {2, 1, 31179, 1, 1}, 0, 0},
    {1, 100, "Nh竛h Th玭g Gi竛g Sinh", {2, 1, 31180, 1, 1}, 0, 0},
    {1, 100  , "Chu玭g Gi竛g Sinh (п)",  {{ 
                                {"Chu玭g Gi竛g Sinh (п)",{0,	120, 25, 1, 1}}, 
                                {"Chu玭g Gi竛g Sinh (п)",{0,	120, 26, 1, 1}}, 
                                {"Chu玭g Gi竛g Sinh (п)",{0,	120, 27, 1, 1}},
                                {"Chu玭g Gi竛g Sinh (п)",{0,	120, 28, 1, 1}},   }}, 30*24*3600, 1},
    {1, 50  , "Chu玭g Gi竛g Sinh (Lam)",{{   
                                {"Chu玭g Gi竛g Sinh (Lam)",{0,	120, 29, 1, 1}}, 
                                {"Chu玭g Gi竛g Sinh (Lam)",{0,	120, 30, 1, 1}}, 
                                {"Chu玭g Gi竛g Sinh (Lam)",{0,	120, 31, 1, 1}},
                                {"Chu玭g Gi竛g Sinh (Lam)",{0,	120, 32, 1, 1}}, }}, 30*24*3600, 1},
    {1, 0  , "Chu玭g Gi竛g Sinh (T輒)",{{   
                                {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 33, 1, 1}}, 
                                {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 34, 1, 1}}, 
                                {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 35, 1, 1}},
                                {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 36, 1, 1}}, }}, 30*24*3600, 1},
    {1, 100, "Tu莕 L閏",         {0,	105, 35, 1, 1, -1, -1, -1, -1, -1, -1}, 30*24*3600, 0},
    {1, 0  , "Chu玭g Gi竛g Sinh (п)", {{   
                                {"Chu玭g Gi竛g Sinh (п)",{0,	120, 25, 1, 5}}, 
                                {"Chu玭g Gi竛g Sinh (п)",{0,	120, 26, 1, 5}}, 
                                {"Chu玭g Gi竛g Sinh (п)",{0,	120, 27, 1, 5}},
                                {"Chu玭g Gi竛g Sinh (п)",{0,	120, 28, 1, 5}}, }}, 0, 1},
    {1, 1   , "Chu玭g Gi竛g Sinh (Lam)",{{   
                                {"Chu玭g Gi竛g Sinh (Lam)",{0,	120, 29, 1, 5}}, 
                                {"Chu玭g Gi竛g Sinh (Lam)",{0,	120, 30, 1, 5}}, 
                                {"Chu玭g Gi竛g Sinh (Lam)",{0,	120, 31, 1, 5}},
                                {"Chu玭g Gi竛g Sinh (Lam)",{0,	120, 32, 1, 5}}, }}, 0, 1},
    {1, 0   , "Chu玭g Gi竛g Sinh (T輒)",{{   
                                {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 33, 1, 5}}, 
                                {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 34, 1, 5}}, 
                                {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 35, 1, 5}},
                                {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 36, 1, 5}}, }}, 0, 1},
    {1, 1000, "Tranh S綾 Y猲 Hoa", {2, 1,  189, 1, 1}, 0, 0},
    {1, 1000, "Lam S綾 Y猲 Hoa", {2, 1,  190, 1, 1}, 0, 0},
    {1, 1000, "X輈h M筩 H醓 Di謒", {2, 1,  191, 1, 1}, 0, 0},
    {1, 1000, "Lam M筩 H醓 Di謒", {2, 1,  192, 1, 1}, 0, 0},
    {0, 4749, "", {}, 0, 0}, -- 什么的都没有随机到
}

CA2016_KILLNPC_BOSS_AWARD = {
    {1, 500, "H閜 qu� gi竛g sinh", {2, 1, 31178, 1, 1}, 0, 0},
    {1, 400, "Chu玭g Gi竛g Sinh", {2, 1, 31179, 1, 1}, 0, 0},
    {1, 100, "Nh竛h Th玭g Gi竛g Sinh", {2, 1, 31180, 1, 1}, 0, 0},
    {1, 100  , "Chu玭g Gi竛g Sinh (п)",  {{ 
                                {"Chu玭g Gi竛g Sinh (п)",{0,	120, 25, 1, 1}}, 
                                {"Chu玭g Gi竛g Sinh (п)",{0,	120, 26, 1, 1}}, 
                                {"Chu玭g Gi竛g Sinh (п)",{0,	120, 27, 1, 1}},
                                {"Chu玭g Gi竛g Sinh (п)",{0,	120, 28, 1, 1}},   }}, 30*24*3600, 1},
    {1, 50  , "Chu玭g Gi竛g Sinh (Lam)",{{   
                                {"Chu玭g Gi竛g Sinh (Lam)",{0,	120, 29, 1, 1}}, 
                                {"Chu玭g Gi竛g Sinh (Lam)",{0,	120, 30, 1, 1}}, 
                                {"Chu玭g Gi竛g Sinh (Lam)",{0,	120, 31, 1, 1}},
                                {"Chu玭g Gi竛g Sinh (Lam)",{0,	120, 32, 1, 1}}, }}, 30*24*3600, 1},
    {1, 0  , "Chu玭g Gi竛g Sinh (T輒)",{{   
                                {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 33, 1, 1}}, 
                                {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 34, 1, 1}}, 
                                {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 35, 1, 1}},
                                {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 36, 1, 1}}, }}, 30*24*3600, 1},
    {1, 100, "Tu莕 L閏",         {0,	105, 35, 1, 1, -1, -1, -1, -1, -1, -1}, 30*24*3600, 0},
    {1, 0  , "Chu玭g Gi竛g Sinh (п)", {{   
                                {"Chu玭g Gi竛g Sinh (п)",{0,	120, 25, 1, 5}}, 
                                {"Chu玭g Gi竛g Sinh (п)",{0,	120, 26, 1, 5}}, 
                                {"Chu玭g Gi竛g Sinh (п)",{0,	120, 27, 1, 5}},
                                {"Chu玭g Gi竛g Sinh (п)",{0,	120, 28, 1, 5}}, }}, 0, 1},
    {1, 1   , "Chu玭g Gi竛g Sinh (Lam)",{{   
                                {"Chu玭g Gi竛g Sinh (Lam)",{0,	120, 29, 1, 5}}, 
                                {"Chu玭g Gi竛g Sinh (Lam)",{0,	120, 30, 1, 5}}, 
                                {"Chu玭g Gi竛g Sinh (Lam)",{0,	120, 31, 1, 5}},
                                {"Chu玭g Gi竛g Sinh (Lam)",{0,	120, 32, 1, 5}}, }}, 0, 1},
    {1, 0   , "Chu玭g Gi竛g Sinh (T輒)",{{   
                                {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 33, 1, 5}}, 
                                {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 34, 1, 5}}, 
                                {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 35, 1, 5}},
                                {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 36, 1, 5}}, }}, 0, 1},
    {1, 1000, "Tranh S綾 Y猲 Hoa", {2, 1,  189, 1, 1}, 0, 0},
    {1, 1000, "Lam S綾 Y猲 Hoa", {2, 1,  190, 1, 1}, 0, 0},
    {1, 1000, "X輈h M筩 H醓 Di謒", {2, 1,  191, 1, 1}, 0, 0},
    {1, 1000, "Lam M筩 H醓 Di謒", {2, 1,  192, 1, 1}, 0, 0},
    {1, 100, "Ma o Th筩h C蕄 1", {2, 1,  30428, 1, 1}, 0, 0},
    {1, 100, "Ma o Th筩h C蕄 2", {2, 1,  30429, 1, 1}, 0, 0},
    {1, 100, "Ma o Th筩h C蕄 3", {2, 1,  30430, 1, 1}, 0, 0},
    {1, 50,  "Th秓 Ph箃 L猲h ",    {2, 1,  30915, 1, 1}, 0, 0},
    {1, 100, "V� Gi竛g sinh", {2, 1,   31181, 1, 1}, 0, 0},
    {1, 20,  "竜 Cho祅g Thi誸 Huy誸", {0, 152, 27, 1, 1}, 0, 0},
    {1, 20,  "Huy Chng Thi誸 Huy誸", {0, 153, 27, 1, 1}, 0, 0},
    {1, 20,  "Chi課 H礽 Thi誸 Huy誸", {0, 154, 27, 1, 1}, 0, 0},
    {1, 20,  "Huy Chng Du Hi謕", {0, 153, 26, 1, 1}, 0, 0},
    {1, 20,  "竜 Cho祅g Du Hi謕", {0, 152, 26, 1, 1}, 0, 0},
    {1, 20,  "Trng H礽 Du Hi謕", {0, 154, 26, 1, 1}, 0, 0},
    {1, 20,  "Huy Chng V﹏ Du", {0, 153, 28, 1, 1}, 0, 0},
    {1, 20,  "竜 Cho祅g V﹏ Du", {0, 152, 28, 1, 1}, 0, 0},
    {1, 20,  "Чo H礽 V﹏ Du", {0, 154, 28, 1, 1}, 0, 0},
    {1, 1000, "Hu﹏ chng anh h飊g", {2, 1,  30499, 1, 1}, 0, 0},
    {0, 3119, "", {}, 0, 0}, -- 什么的都没有随机到
}

function CA2016_recall_to_city()
    local m,_,_ = GetWorldPos();
    local szM = tostring(m)
    if m == CA2016_BF_MAPS[1] or m == CA2016_BF_MAPS[2] or m == CA2016_BF_MAPS[3] then
        SetLogoutRV(0)
        SetFightState(0)
        local tPos = CA2016_BF_EXIT[szM]
        NewWorld(tPos[1],tPos[2],tPos[3])
        return 
    end
    NewWorld(300,  1756, 3538)
end

function CA2016_give_award(nAwardIdx, type) -- normal is default
    local tbAward   = CA2016_KILLNPC_NORMAL_AWARD[nAwardIdx];
    local nRand = random(1, tbAward.maxrate);
    if nRand <= tbAward.rate then 
        local _,nIdx = gf_AddItemEx(tbAward.item, tbAward.name);
        if tbAward.time ~= 0 then SetItemExpireTime(nIdx, tbAward.time); end
    end
end

CA2016_NPC_LIST = {
    {"C﹜ gi竛g sinh c bi謙", "C﹜ th玭g gi竜 h閕", 502, 1570, 2910},
} 

CA2016_DC_TSKID_BYTE = {
    usebell     = { "tskid_dc_byte1", 1 }, -- 按字节记录铃铛装扮的使用次数（每日清零） -- set_task_byte -- get_task_byte
    usebox      = { "tskid_dc_byte1", 2 },
    usebranch   = { "tskid_dc_byte1", 3 },
}

t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskGroupIdx},
   {id={"tskid_time_remain", 1,} },   -- 进入青沙河战场后记录结束时间
   {id={"tskid_dc_byte1", 2,}, clear="daily" },
   {id={"tskid_exchange_bell", 3,} }, -- 记录是否兑换了圣诞铃铛
   {id={"tskid_christmas_package", 4,} }, -- 记录是否领过了圣诞包裹
   {id={"tskid_exchange_package", 5,} }, -- 记录是否兑换过了圣诞包裹
   {id={"tskid_exchange_purplebell", 6,} },    -- 记录是否兑换过了圣诞包裹
   {id={"tskid_dc_hft", 7,}, clear="daily" },  -- 黑风堂一天最多去4次
}

function handle_count_time()
    local oldPlayer = PlayerIndex;
    for i = 1, getn(CA2016_BF_MAPS) do
        local tPlayer = GetMapPlayer(CA2016_BF_MAPS[i]);
        if tPlayer and type(tPlayer) == "table" then
            for _, m in tPlayer do
                PlayerIndex = m;
                local nTimeRemain = get_task("tskid_time_remain");
                nTimeRemain = nTimeRemain - CA2016_BATTLE_TIME_TICK;
                set_task("tskid_time_remain",nTimeRemain);
                if nTimeRemain <= 0 then
                    CA2016_recall_to_city()
                    SetLogoutRV(0)
                    SetFightState(0)
                end
                if nTimeRemain <= 60 and nTimeRemain > 60 - CA2016_BATTLE_TIME_TICK then
                    Msg2Player("S� r阨 kh醝 b秐  Thi猲  Gi竜 H綾 Phong Л阯g trong 1 ph髏")
                end
            end
        end
    end
    PlayerIndex = oldPlayer;
end

function handle_player_death(para1,para2)
    local nM = para2[1];
    if nM ==CA2016_BF_MAPS[1] or nM == CA2016_BF_MAPS[2] or nM == CA2016_BF_MAPS[3] then
        SetFightState(0)
        SetLogoutRV(0)
        RevivePlayer(1)
    end
end

function handle_refresh_boss()
    --刷新boss
    Msg2Global("H綾 Phong Л阯g Ch�  xu蕋 hi謓 t筰 Thi猲  Gi竜 H綾 Phong Л阯g, c竎 i hi謕 mau n  nh b筰 h緉, gi祅h l蕐 ph莕 thng phong ph�!")
    for i = 1, getn(CA2016_BF_MAPS) do
        local tPos = CA2016_BOSS_POS[random(1,getn(CA2016_BOSS_POS))]
        local npcidx = CreateNpc("sdhd_hfttz","H綾 Phong Л阯g Ch�",CA2016_BF_MAPS[i],tPos[2],tPos[3])
        SetNpcLifeTime(npcidx,30*60)
    end
end

t_isolate_user_batch_watch_list = {
    {"event_server_tick",       {CA2016_BATTLE_TIME_TICK},     handle_count_time,  { }},
    {"event_player_death",      {-1}, 	 handle_player_death,{ }},
    {"event_server_time",       {10, 0}, handle_refresh_boss,{ }},
    {"event_server_time",       {11, 0}, handle_refresh_boss,{ }},
    {"event_server_time",       {12, 0}, handle_refresh_boss,{ }},
    {"event_server_time",       {13, 0}, handle_refresh_boss,{ }},
    {"event_server_time",       {14, 0}, handle_refresh_boss,{ }},
    {"event_server_time",       {15, 0}, handle_refresh_boss,{ }},
    {"event_server_time",       {16, 0}, handle_refresh_boss,{ }},
    {"event_server_time",       {17, 0}, handle_refresh_boss,{ }},
    {"event_server_time",       {18, 0}, handle_refresh_boss,{ }},
    {"event_server_time",       {19, 0}, handle_refresh_boss,{ }},
    {"event_server_time",       {20, 0}, handle_refresh_boss,{ }},
    {"event_server_time",       {21, 0}, handle_refresh_boss,{ }},
    {"event_server_time",       {22, 0}, handle_refresh_boss,{ }},
}

function on_add_watches() 
	isolate_watch_npc_talk("Xa phu Tuy襫 Ch﹗", 100, "CA2016_handle_talk2chefu")
    isolate_watch_npc_talk("Xa phu", 200, "CA2016_handle_talk2chefu")
    isolate_watch_npc_talk("Xa phu", 300, "CA2016_handle_talk2chefu")
    isolate_watch_npc_talk("Gi竜 s�", 300, "CA2016_handle_talk2churchman")                            -- 传教士
    isolate_watch_npc_talk(CA2016_NPC_LIST[1][2], CA2016_NPC_LIST[1][3], "CA2016_handle_talk2shengdanshu")    -- 圣诞树
    isolate_watch_event("event_kill_npc", "CA2016_handle_on_kill_npc_normal", "", 600)
    isolate_watch_event("event_kill_npc", "CA2016_handle_on_kill_npc_normal", "", 601)
    isolate_watch_event("event_kill_npc", "CA2016_handle_on_kill_npc_normal", "", 602)
    isolate_watch_kill_npc("H綾 Phong Л阯g е T�", CA2016_BF_MAPS[1], "CA2016_handle_on_kill_npc_special")
    isolate_watch_kill_npc("H綾 Phong Л阯g е T�", CA2016_BF_MAPS[2], "CA2016_handle_on_kill_npc_special")
    isolate_watch_kill_npc("H綾 Phong Л阯g е T�", CA2016_BF_MAPS[3], "CA2016_handle_on_kill_npc_special")
    isolate_watch_kill_npc(CA2016_BOSS_NAME, CA2016_BF_MAPS[1], "CA2016_handle_on_kill_boss")
    isolate_watch_kill_npc(CA2016_BOSS_NAME, CA2016_BF_MAPS[2], "CA2016_handle_on_kill_boss")
    isolate_watch_kill_npc(CA2016_BOSS_NAME, CA2016_BF_MAPS[3], "CA2016_handle_on_kill_boss")
    isolate_watch_npc_talk("Xa phu", 502, "CA2016_handle_talk2mapchefu")
    isolate_watch_npc_talk("H閜 qu�", 502, "CA2016_handle_talk2lihe")
    isolate_watch_npc_talk("Xa phu", 8020, "CA2016_handle_talk2mapchefu")
    isolate_watch_npc_talk("Xa phu", 8021, "CA2016_handle_talk2mapchefu")
    isolate_watch_npc_talk("Xa phu", 8022, "CA2016_handle_talk2mapchefu")
    
end

function CA2016_handle_talk2lihe()
    local tbTalk = {
        "<color=green>H閜 Qu�<color>: Gi竛g sinh vui v�!",
        "<color=green>H閜 Qu�<color>: B筺 c� nh譶 th蕐 g Gi� Noel kh玭g?",
        "<color=green>H閜 Qu�<color>: Qu� u � tr猲 c﹜ th玭g k譨!",
    }
    local nRand = random(1, getn(tbTalk))
    Talk(1,"",tbTalk[nRand])
end


----------------------------------------------------------------------------------------------------------------------
--Description   
--车夫传送到华山：502,1597,2995
--车夫传送天阴教黑风堂: 每次传送扣除1个天骄令,每次进入只能待30分钟,时间到之后会被传送出去,每次击杀黑风堂的怪物时会获得10点修为.
----------------------------------------------------------------------------------------------------------------------
function CA2016_hft_check()
    local nDate = tonumber(date("%Y%m%d")) 
    if nDate > CA2016_HFT_ENDDATE then return 0 end
    local nTime = tonumber(date("%H%M"))
    if nTime < CA2016_HFT_OPEN_BEGIN then return 0 end 
    if nTime > CA2016_HFT_OPEN_END then return 0 end 
    return 1
end

function CA2016_handle_talk2chefu()
    local szTitle   = CHEFU_NAME.."";
    local tbSay     = {};
    local nDate     = tonumber(date("%Y%m%d")) 
    tinsert(tbSay,format("Лa ta n ch� C﹜ Th玭g � Hoa S琻/#NewWorld(%d,%d,%d)",CA2016_NPC_LIST[1][3],CA2016_NPC_LIST[1][4],CA2016_NPC_LIST[1][5]));
    if CA2016_hft_check()==1 then 
        tinsert(tbSay,"Лa ta n Thi猲  Gi竜 H綾 Phong Л阯g (M鏸 ng祔 l骳 10:00 - 23:30 頲 v祇)/CA2016_fly2HFTbattlefield");
    else 
        tinsert(tbSay,"Лa ta n Thi猲  Gi竜 H綾 Phong Л阯g (Х ng)/#Talk(1,\"CA2016_handle_talk2chefu\",\"B秐  Thi猲  Gi竜 H綾 Phong Л阯g  ng.\")") 
    end
    tinsert(tbSay,"T� b�/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function CA2016_fly2HFTbattlefield()
    -- 如果提前退出地图，还可以无消耗继续进入，直到呆满一小时
    local nTimeRemain = get_task("tskid_time_remain");
    local nTime = GetTime(); 
    local m,_,_ = GetWorldPos();
    local szMap = tostring(m);
    if nTimeRemain > 0 then
          NewWorld(CA2016_BF_ENTRY[szMap][1],CA2016_BF_ENTRY[szMap][2],CA2016_BF_ENTRY[szMap][3])
          SetLogoutRV(1);	--设置登陆点为城市重生点
          SetFightState(1)
          return
    end
    -- 正常进入
    local nTimes = get_task("tskid_dc_hft")
    if nTimes >= 4 then Talk(1,"","M鏸 ng祔 c� t鑙 產 4 l莕 v祇 b秐  H綾 Phong Л阯g.")return end;
    local nCnt = GetItemCount(CA2016_FLY_COST[1],CA2016_FLY_COST[2],CA2016_FLY_COST[3])
    if nCnt < CA2016_FLY_COST[4] then
        Talk(1,"",CHEFU_NAME.."дn Thi猲  Gi竜 H綾 Phong Л阯g c莕"..CA2016_FLY_COST[5]..".");
        return
    end
    local szTitle   = format("%s n Thi猲  Gi竜 H綾 Phong Л阯g c莕 %s, v� ch� 頲 �  <color=red>%d ph髏<color>, kh竎h quan mu鑞 n  kh玭g?",CHEFU_NAME,CA2016_FLY_COST[5],floor(CA2016_STAYTIME/60));
    local tbSay     = {};
    tinsert(tbSay,"Л頲/CA2016_fly2HFTbattlefieldConfirm");
    tinsert(tbSay,"T� b�/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function CA2016_fly2HFTbattlefieldConfirm()
    local m,_,_ = GetWorldPos();
    local szMap = tostring(m);
    if DelItem(CA2016_FLY_COST[1],CA2016_FLY_COST[2],CA2016_FLY_COST[3],CA2016_FLY_COST[4]) == 1 then
        local nTime = GetTime();
        NewWorld(CA2016_BF_ENTRY[szMap][1],CA2016_BF_ENTRY[szMap][2],CA2016_BF_ENTRY[szMap][3])
        SetLogoutRV(1);	--设置登陆点为城市重生点
        SetFightState(1)
        set_task("tskid_time_remain",CA2016_STAYTIME);
        set_task("tskid_dc_hft",get_task("tskid_dc_hft")+1)
    end
end


----------------------------------------------------------------------------------------------------------------------
--Description   
--普通地图：大草原一,大草原二,王旗部落 600,601,602
--特殊地图：天阴教黑风堂,打怪有大概率掉落圣诞装扮材料,小概率掉落外装挂件和圣诞坐骑,微概率掉落永久外装挂件,天阴教黑风堂掉落的各种道具都可以交易 天阴教黑风堂
----------------------------------------------------------------------------------------------------------------------
function CA2016_handle_on_kill_npc_normal(data, para)
    -- Msg2Player("[Debug] killing in normal map --2016ChristmasActivity");
    for i = 1, getn(CA2016_KILLNPC_NORMAL_AWARD) do
        CA2016_give_award(i, 'normal');
    end
end
function CA2016_handle_on_kill_npc_special(data, para)
    -- Msg2Player("[Debug] killing in special map --2016ChristmasActivity");
    gf_EventGiveRandAward(CA2016_KILLNPC_SPECIAL_AWARD, gf_SumRandBase(CA2016_KILLNPC_SPECIAL_AWARD), 15, "Ph莕 thng H綾 Phong Л阯g е T�", "Ho箃 ng Song Цn 2016")
    ModifyPopur(10);
    Msg2Player("B筺  nh薾 頲 10 甶觤 tu vi")
end


function CA2016_handle_on_kill_boss(...)
    -- Msg2Player("[Debug] boss is killed --2016ChristmasActivity");
    gf_EventGiveRandAward(CA2016_KILLNPC_BOSS_AWARD, gf_SumRandBase(CA2016_KILLNPC_BOSS_AWARD), 30, "Ph莕 thng H綾 Phong Л阯g Ch�", "Ho箃 ng Song Цn 2016") -- 三次随机
    gf_EventGiveRandAward(CA2016_KILLNPC_BOSS_AWARD, gf_SumRandBase(CA2016_KILLNPC_BOSS_AWARD), 30, "Ph莕 thng H綾 Phong Л阯g Ch�", "Ho箃 ng Song Цn 2016")
    gf_EventGiveRandAward(CA2016_KILLNPC_BOSS_AWARD, gf_SumRandBase(CA2016_KILLNPC_BOSS_AWARD), 30, "Ph莕 thng H綾 Phong Л阯g Ch�", "Ho箃 ng Song Цn 2016")
    ModifyPopur(10);
    Msg2Player("B筺  nh薾 頲 10 甶觤 tu vi")
end

----------------------------------------------------------------------------------------------------------------------
--Description   
--与圣诞树对话，将圣诞装扮挂到圣诞树上，必然获得积分,概率获得圣诞袜子。可以批量装扮
--铃铛，礼盒，树枝
----------------------------------------------------------------------------------------------------------------------
function CA2016_handle_talk2shengdanshu()
    local szTitle   = TREE_NAME.."Gi竛g sinh vui v�! M鏸 lo筰 v藅 li謚 頲 trang tr� 20 l莕/ng祔. N誹 may m緉 s� nh薾 頲 V� Gi竛g Sinh  nha.";
    local tbSay     = {};
    tinsert(tbSay,format("D飊g Chu玭g trang tr� (M鏸 l莕 t鑞 %d Chu玭g Gi竛g Sinh)/#CA2016_dress_up(%d)",CA2016_BELL[4],1));
    tinsert(tbSay,format("D飊g H閜 Qu� trang tr� (M鏸 l莕 t鑞 %d H閜 Qu� Gi竛g Sinh)/#CA2016_dress_up(%d)",CA2016_BOX[4],2));
    tinsert(tbSay,format("D飊g Nh竛h Th玭g trang tr� (M鏸 l莕 t鑞 %d Nh竛h Th玭g)/#CA2016_dress_up(%d)",CA2016_BRANCH[4],3));
    -- tinsert(tbSay,"Debug_reflash_tskid/reflash_tskid");
    tinsert(tbSay,"T� b�/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function CA2016_dress_up(nType)
    local USELIM = CA2016_DC_TSKID_BYTE;
    if nType == 1 then
        local used = get_task_byte(USELIM.usebell[1],USELIM.usebell[2])
        if used >= CA2016_BELL_USE_LIM then Talk(1,"","S� l莕 trang tr� h玬 nay  h誸.") return end
        local nNum = GetItemCount(CA2016_BELL[1],CA2016_BELL[2],CA2016_BELL[3])
        if nNum < CA2016_BELL[4] then Talk(1,"",format("D飊g %s trang tr� c莕 輙 nh蕋 %s.",TREE_NAME,CA2016_BELL[5])) return end
        
        nNum = floor(nNum/CA2016_BELL[4])
        nNum = min(CA2016_BELL_USE_LIM - used, nNum);
        AskClientForNumber("CA2016_dress_up_with_bell", 1, nNum, "Trang tr� bao nhi猽 l莕?"); 
    elseif nType == 2 then
        local used = get_task_byte(USELIM.usebox[1],USELIM.usebox[2])
        if used >= CA2016_BOX_USE_LIM then Talk(1,"","S� l莕 trang tr� h玬 nay  h誸.") return end
        local nNum = GetItemCount(CA2016_BOX[1],CA2016_BOX[2],CA2016_BOX[3])
        if nNum < CA2016_BOX[4] then Talk(1,"",format("D飊g %s trang tr� c莕 輙 nh蕋 %s.",TREE_NAME,CA2016_BOX[5])) return end

        nNum = floor(nNum/CA2016_BOX[4])
        nNum = min(CA2016_BOX_USE_LIM - used, nNum);
        AskClientForNumber("CA2016_dress_up_with_box", 1, nNum, "Trang tr� bao nhi猽 l莕?"); 

    elseif nType == 3 then
        local used = get_task_byte(USELIM.usebranch[1],USELIM.usebranch[2])
        if used >= CA2016_BRANCH_USE_LIM then Talk(1,"","S� l莕 trang tr� h玬 nay  h誸.") return end
        local nNum = GetItemCount(CA2016_BRANCH[1],CA2016_BRANCH[2],CA2016_BRANCH[3])
        if nNum < CA2016_BRANCH[4] then Talk(1,"",format("D飊g %s trang tr� c莕 輙 nh蕋 %s.",TREE_NAME,CA2016_BRANCH[5])) return end
        nNum = floor(nNum/CA2016_BRANCH[4])
        nNum = min(CA2016_BRANCH_USE_LIM - used, nNum);
        AskClientForNumber("CA2016_dress_up_with_branch", 1, nNum, "Trang tr� bao nhi猽 l莕?"); 
    end

end

function CA2016_DressUp_Award()
    local szAward = "sdhd_sdsjl"
	if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
		return 0
	end
	if CustomAwardGiveGroup(szAward, 0) > 0 then     --二号参数为是否给予全部奖励,如果是则1
		return 1
	end
	return 0
end

function CA2016_dress_up_with_bell(nNum)
    if nNum <= 0 then return end;
    local nUsed = get_task_byte(CA2016_DC_TSKID_BYTE.usebell[1],CA2016_DC_TSKID_BYTE.usebell[2])
    if DelItem(CA2016_BELL[1],CA2016_BELL[2],CA2016_BELL[3],nNum*CA2016_BELL[4]) == 1 then
        -- Msg2Player(format("[Debug] give dress up BELL award mult %d --2016ChristmasActivity",nNum));
        set_task_byte(CA2016_DC_TSKID_BYTE.usebell[1],CA2016_DC_TSKID_BYTE.usebell[2],nUsed+nNum);
        for i = 1, nNum do
            CA2016_DressUp_Award()
        end
    end
end
function CA2016_dress_up_with_box(nNum)
    if nNum <= 0 then return end;
    local nUsed = get_task_byte(CA2016_DC_TSKID_BYTE.usebox[1],CA2016_DC_TSKID_BYTE.usebox[2])
    if DelItem(CA2016_BOX[1],CA2016_BOX[2],CA2016_BOX[3],nNum*CA2016_BOX[4]) == 1 then
        -- Msg2Player(format("[Debug] give dress up BOX award mult %d --2016ChristmasActivity",nNum));
        set_task_byte(CA2016_DC_TSKID_BYTE.usebox[1],CA2016_DC_TSKID_BYTE.usebox[2],nUsed+nNum);
        for i = 1, nNum do
            CA2016_DressUp_Award()
        end
    end
end
function CA2016_dress_up_with_branch(nNum)
    if nNum <= 0 then return end;
    local nUsed = get_task_byte(CA2016_DC_TSKID_BYTE.usebranch[1],CA2016_DC_TSKID_BYTE.usebranch[2])
    if DelItem(CA2016_BRANCH[1],CA2016_BRANCH[2],CA2016_BRANCH[3],nNum*CA2016_BRANCH[4]) == 1 then
        -- Msg2Player(format("[Debug] give dress up BRANCH award mult %d --2016ChristmasActivity",nNum));
        set_task_byte(CA2016_DC_TSKID_BYTE.usebranch[1],CA2016_DC_TSKID_BYTE.usebranch[2],nUsed+nNum);
        for i = 1, nNum do
            CA2016_DressUp_Award()
        end
    end
end
----------------------------------------------------------------------------------------------------------------------
--Description   
--成都西洋传教士增加一个代币商店,消耗圣诞积分,兑换道具,此商店到12月26日24:00之后关闭
----------------------------------------------------------------------------------------------------------------------
function CA2016_handle_talk2churchman()
    local szTitle   = "<color=green>Gi竜 S�<color>:".."Gi竛g sinh s緋 n, l� v藅 do V� L﹎ Minh chu萵 b�  b� Thi猲  Gi竜 tr閙 甶 h琻 n鯽, phi襫 c竎 v� i hi謕 v祇 ng祔 15/12 - 24h 26/12 n Чi Th秓 Nguy猲 1-2, b� l筩 Vng K� c騨g c� th� t譵 Xa Phu di chuy觧 n Thi猲  Gi竜 H綾 Phong Л阯g (H綾 Phong Л阯g m鏸 ng祔 頲 v祇 t鑙 產 4 l莕, m鏸 l莕 頲 � l筰 30 ph髏)  t譵 qu� gi竛g sinh b� m蕋, a ch髇g v� nh Hoa S琻  trang tr� C﹜ Th玭g. Trang tr� xong s� nh薾 頲 ph莕 thng, n誹 may m緉 c遪 nh薾 頲 V� Gi竛g Sinh. Thu th藀 頲 s� V� nh蕋 nh r錳 n g苝 ta i Trang S鴆 Gi竛g Sinh. Ngo礽 ra v祇 ng祔 l� gi竛g sinh (24-25/12), m鋓 ngi c� th� n g苝 ta nh薾 1 T骾 Gi竛g Sinh v� Chu玭g. C竎 v� hi謕 s�, ch骳 c竎 v� gi竛g sinh vui v�!";
    local tbSay     = {};
    local bFlag = get_task("tskid_christmas_package")
    local bExch = get_task("tskid_exchange_package")
    local bExch2 = get_task("tskid_exchange_purplebell")
    local nCurDate = tonumber(date("%Y%m%d"))
    tinsert(tbSay,"T鑞 10 V� Gi竛g Sinh v� 300 V祅g i 1 Chu玭g Gi竛g Sinh (п) v躰h vi詎/CA2016_exchange_bell");
    if (nCurDate==CA2016_CHRISTMASDATE1 or nCurDate == CA2016_CHRISTMASDATE2) and bFlag ~= 1 then tinsert(tbSay,"Nh薾 1 T骾 Gi竛g Sinh H筺h Ph骳 v� 1 Chu玭g Gi竛g Sinh (T輒)/CA2016_get_Christmas_package") end;
    if bFlag == 1 and ( bExch == 0 or bExch2 == 0 )then tinsert(tbSay,"фi T骾 Gi竛g Sinh H筺h Ph骳 (v躰h vi詎) v� Chu玭g Gi竛g Sinh (T輒) (v躰h vi詎)/CA2016_exchange_package") end;
    -- tinsert(tbSay,"reset/reset_churchman");
    -- tinsert(tbSay,"addscore/addscore_churchman");
    tinsert(tbSay,"T� b�/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end


function CA2016_get_Christmas_package()
    local bFlag = get_task("tskid_christmas_package")
    if nFlag == 1 then Talk(1,"CA2016_handle_talk2churchman","M鏸 ngi ch� 頲 nh薾 m閠 l莕 th玦.") return end
    if gf_Judge_Room_Weight(2, 0) ~= 1 then Talk(1,"","Kh玭g gian h祅h trang kh玭g ") return end
    local _,nIdx1 = gf_AddItemEx(CA2016_CHRISTMAS_PACKAGE[1][1],CA2016_CHRISTMAS_PACKAGE[1][2])
    SetItemExpireTime(nIdx1, 30*24*3600)
    local tBell =   { 
        {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 33, 1, 4}}, 
        {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 34, 1, 4}}, 
        {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 35, 1, 4}},
        {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 36, 1, 4}},
    }
    local nBody = GetBody()
    local tAward = tBell[nBody];
    local _,nIdx2 = gf_AddItemEx(tAward[2], tAward[1]);
    SetItemExpireTime(nIdx2, 30*24*3600)
    set_task("tskid_christmas_package",1)
end

function CA2016_exchange_package()
    local szTitle   = "<color=green>Gi竜 S�<color>:".."Gi竛g sinh n r錳, c竎 i hi謕 c� th� n g苝 ta nh薾 qu� gi竛g sinh.";
    local tbSay     = {};
    if get_task("tskid_exchange_purplebell") ~= 1 then tinsert(tbSay,"1 Thi猲 Cang L謓h, 1 Thi猲 M玭 Kim L謓h, 300 甶觤 Phong Hoa, 甧m Chu玭g Gi竛g Sinh (T輒) c� th阨 h筺 i th祅h Chu玭g Gi竛g Sinh (T輒) v躰h vi詎/#CA2016_exchange_package_confirm(1)"); end
    if get_task("tskid_exchange_package") ~= 1 then tinsert(tbSay,"2 Thi猲 Cang L謓h, 2 Thi猲 M玭 Kim L謓h, 1000 甶觤 Phong Hoa, 甧m T骾 Gi竛g Sinh H筺h Ph骳 c� th阨 h筺 i th祅h T骾 Gi竛g Sinh H筺h Ph骳 v躰h vi詎/#CA2016_exchange_package_confirm(2)"); end
    if get_task("tskid_exchange_purplebell") ~= 1 then tinsert(tbSay,"100 V� Gi竛g Sinh, 1000 甶觤 Phong Hoa, 甧m Chu玭g Gi竛g Sinh (T輒) c� th阨 h筺 i th祅h Chu玭g Gi竛g Sinh (T輒) v躰h vi詎/#CA2016_exchange_package_confirm(3)"); end
    tinsert(tbSay,"T� b�/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function CA2016_exchange_package_confirm(nType)
    local tBell =   { 
        {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 33, 1, 5}}, 
        {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 34, 1, 5}}, 
        {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 35, 1, 5}},
        {"Chu玭g Gi竛g Sinh (T輒)",{0,	120, 36, 1, 5}},
    }
    local nBody = GetBody()
    local tAward = tBell[nBody];
    local nBell = GetItemCount(tAward[2][1],tAward[2][2],tAward[2][3])
    local nFenghua = ornament_get_score()
    local nTianG = GetItemCount(2,95,204)
    local nTianM = GetItemCount(2,1,30370)
    local nWazi = GetItemCount(2,1,31181)
    local nPackage = GetItemCount(CA2016_CHRISTMAS_PACKAGE[1][1][1],CA2016_CHRISTMAS_PACKAGE[1][1][2],CA2016_CHRISTMAS_PACKAGE[1][1][3])
    if nType == 1 then
        if nBell < 1 then Talk(1,"","H穣 c蕋 Chu玭g Gi竛g Sinh (T輒) v祇 h祅h trang")return end
        if nTianG < 1 then Talk(1,"","Thi猲 Cang L謓h kh玭g ") return end
        if nTianM < 1 then Talk(1,"","Thi猲 M玭 Kim L謓h kh玭g ") return end
        if nFenghua < 300 then Talk(1,"","觤 Phong Hoa kh玭g ")return end
        if DelItem(2,95,204,1) ~= 1 then return end
        if DelItem(2,1,30370,1) ~= 1 then return end
        ornament_add_score(-300)
        Msg2Player(format("B筺  m蕋 300 甶觤 Phong Hoa, c遪 %s 甶觤",ornament_get_score()))
    elseif nType == 2 then
        if nPackage < 1 then Talk(1,"","H穣 c蕋 T骾 Gi竛g Sinh H筺h Ph骳 v祇 h祅h trang")return end
        if nTianG < 2 then Talk(1,"","Thi猲 Cang L謓h kh玭g ") return end
        if nTianM < 2 then Talk(1,"","Thi猲 M玭 Kim L謓h kh玭g ") return end
        if nFenghua < 1000 then Talk(1,"","觤 Phong Hoa kh玭g ")return end
        if DelItem(2,95,204,2) ~= 1 then return end
        if DelItem(2,1,30370,2) ~= 1 then return end
        ornament_add_score(-1000)
        Msg2Player(format("B筺  m蕋 1000 甶觤 Phong Hoa, c遪 %s 甶觤",ornament_get_score()))
    else
        if nBell < 1 then Talk(1,"","H穣 c蕋 Chu玭g Gi竛g Sinh (T輒) v祇 h祅h trang")return end
        if nWazi < 100 then  Talk(1,"","V� Gi竛g Sinh kh玭g ")return end
        if nFenghua < 1000 then Talk(1,"","觤 Phong Hoa kh玭g ")return end
        if DelItem(2,1,31181,100) ~= 1 then return end
        ornament_add_score(-1000)
        Msg2Player(format("B筺  m蕋 1000 甶觤 Phong Hoa, c遪 %s 甶觤",ornament_get_score()))
    end

    if nType == 1 or nType == 3 then
        if DelItem(tAward[2][1],tAward[2][2],tAward[2][3],1) ~= 1 then return end
        local _,nIdx2 = gf_AddItemEx(tAward[2], tAward[1]);
        set_task("tskid_exchange_purplebell",1)
    else
        if DelItem(CA2016_CHRISTMAS_PACKAGE[1][1][1],CA2016_CHRISTMAS_PACKAGE[1][1][2],CA2016_CHRISTMAS_PACKAGE[1][1][3],1) ~= 1 then return end
        gf_AddItemEx(CA2016_CHRISTMAS_PACKAGE[1][1],CA2016_CHRISTMAS_PACKAGE[1][2])
        set_task("tskid_exchange_package",1)
    end
    
end

function CA2016_exchange_bell()
    local szNpcName   = "<color=green>Gi竜 S�<color>:"
    local bHasExchange = get_task("tskid_exchange_bell")
    if bHasExchange == 1 then
        Talk(1,"",szNpcName.."M鏸 ngi ch� 頲 i 1 l莕.");
        return
    end
    local nCnt = GetItemCount(2,1,31181)
    local nCash = GetCash()
    if nCnt < 10 then
        Talk(1,"",szNpcName.."V� Gi竛g Sinh trong h祅h trang kh玭g  10.");
        return
    end
    if nCash < 3000000 then
        Talk(1,"",szNpcName.."Ti襫 tr猲 ngi kh玭g .");
        return
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"","Kh玭g gian h祅h trang kh玭g ") return end
    DelItem(2,1,31181,10) 
    Pay(3000000)
    local tBell =   { 
        {"Chu玭g Gi竛g Sinh (п)",{0,	120, 25, 1, 5}}, 
        {"Chu玭g Gi竛g Sinh (п)",{0,	120, 26, 1, 5}}, 
        {"Chu玭g Gi竛g Sinh (п)",{0,	120, 27, 1, 5}},
        {"Chu玭g Gi竛g Sinh (п)",{0,	120, 28, 1, 5}},
    }
    local nBody = GetBody()
    local tAward = tBell[nBody];
    local _,nIdx = gf_AddItemEx(tAward[2], tAward[1]);
    set_task("tskid_exchange_bell",1)
end


function CA2016_handle_talk2mapchefu()
    local szNpcName   = "<color=green>Xa Phu<color>: T玦 c� th� a ng礽 v� th祅h ch輓h, ng礽 mu鑞 v� kh玭g?"
    local tbSay     = {};
    tinsert(tbSay,"Л頲/CA2016_recall_to_city")
    tinsert(tbSay,"T� b�/nothing")
    Say(szNpcName,getn(tbSay),tbSay)
end


function CA2016_CreateTraps()
	local tPos = {
		{{1438, 3373}, {1447, 3382}, "\\script\\isolate\\online_activites\\christmas\\2016_12\\trap.lua"},
		{{1443, 3367}, {1444, 3388}, "\\script\\isolate\\online_activites\\christmas\\2016_12\\trap.lua"},
	};

    for j = 1, getn(CA2016_BF_MAPS) do
        local mapID = CA2016_BF_MAPS[j]
        for _, t in tPos do
            local tPoint = gf_Line(t[1][1], t[1][2], t[2][1], t[2][2]);
            for i = 1, getn(tPoint) do
                AddMapTrap(mapID, tPoint[i][1]*32, tPoint[i][2]*32, t[3]);
            end
        end
    end
end


function on_event_server_start() 
    local NPC       = CA2016_NPC_LIST[1];                               -- "圣诞树"
    local npcIdx    = CreateNpc(NPC[1],NPC[2],NPC[3],NPC[4],NPC[5]);
     
    for i = 1, getn(CA2016_NPC_POS) do
        CreateNpc("sdhd_hftdz","H綾 Phong Л阯g е T�",CA2016_BF_MAPS[1],CA2016_NPC_POS[i][2],CA2016_NPC_POS[i][3])
        CreateNpc("sdhd_hftdz","H綾 Phong Л阯g е T�",CA2016_BF_MAPS[2],CA2016_NPC_POS[i][2],CA2016_NPC_POS[i][3])  -- 补刷新增两个地图的NPC
        CreateNpc("sdhd_hftdz","H綾 Phong Л阯g е T�",CA2016_BF_MAPS[3],CA2016_NPC_POS[i][2],CA2016_NPC_POS[i][3])
    end
    for i = 1, getn(CA2016_LIHE_NPC) do
        CreateNpc("Event gi竛g sinh VN","H閜 qu�",CA2016_LIHE_NPC[i][1],CA2016_LIHE_NPC[i][2],CA2016_LIHE_NPC[i][3])
    end
    for i = 1, getn(CA2016_CHEFU_NPC) do
        CreateNpc("Xa phu","Xa phu",CA2016_CHEFU_NPC[i][1],CA2016_CHEFU_NPC[i][2],CA2016_CHEFU_NPC[i][3])
        if CA2016_CHEFU_NPC[i][1] == CA2016_BF_MAPS[1] then                                                -- 补刷新增两个地图的车夫
            CreateNpc("Xa phu","Xa phu",CA2016_BF_MAPS[2],CA2016_CHEFU_NPC[i][2],CA2016_CHEFU_NPC[i][3])
            CreateNpc("Xa phu","Xa phu",CA2016_BF_MAPS[3],CA2016_CHEFU_NPC[i][2],CA2016_CHEFU_NPC[i][3])
        end
    end
    CA2016_CreateTraps()
end

--------------------------------------------------

function addscore_churchman()
    ornament_add_score(5000)
end

function reflash_tskid()
    set_task("tskid_dc_byte1",0);
end

function reset_churchman()
    set_task("tskid_christmas_package",0)
    set_task("tskid_exchange_package",0)
    set_task("tskid_exchange_purplebell",0)
    AddItem(2,95,204,100)
    AddItem(2,1,30370,100)
    AddItem(2,1,31181,100)
end
-- function on_event_player_login(nExchangeComing)
-- end
-- function on_event_player_logout() 
-- end
--以下为应用模块的可选配置，只要定义了这些变量和函数，系统就会自动注册和回调
--t_isolate_task_list={ --模块用到的任务变量配置id={szTaskName,nTaskGroupIdx},
--    {id={"id_score", 1,}, clear="daily"|"weekly"|"monthly", byte_score=1, byte_award=2, }, 
--}
--t_isolate_user_batch_watch_list = { {szEventId, {event_para...}, pfn_elem_handler(tEvent, data, para), ...}, }
--t_isolate_batch_export_gdata = { name = data, }
--t_isolate_batch_import_gdata = { name1, name2, }
--function on_init() end
--function on_init_ok() end
--function on_uninit() end
--function on_export_gdata() end
--function on_import_gdata() end
--function on_add_watches() end
--function on_new_day(nToday) end




--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end
--function on_first_login_clear() end --isolate上线后第一次登录时的清理



-- 1 玩家在特殊地图中下线后上线，如何处理
-- 2 特殊地图计时方式，进入地图内部计时还是按时间计时

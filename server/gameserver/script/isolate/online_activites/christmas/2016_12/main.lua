--����ģ�黯��һ����׼���ļ�����ģ��ֻ��Ҫʵ�ֶ�Ӧ�ı�׼�¼�������������Ҫ������Щ����ʲôʱ�򱻵���
--ģ���ģ��֮�䲻����Include�͵��ù�ϵ
--����ÿ��ģ���Ƕ�����
--����Ҫ��handler��ע�͵�������ջص�Ӱ��Ч��

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\lib\\normal_exchange.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
Include("\\script\\function\\ornament\\ornament.lua")
t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч����ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "ChristmasActivity",
    szViewName 			= "Event Gi�ng Sinh 2016",
    nTalkBeginDate		= 20161215,
    nBeginDate 			= 20161215,
    nEndDate 			= 20161226,
    nTaskGroup 			= 3,
    nTaskGroupVersion	= 21,
}


CHEFU_NAME      = "<color=green>Xa Phu<color>:"
TREE_NAME       = "<color=green>C�y Th�ng Gi�ng Sinh<color>:"
CA2016_STAYTIME = 30*60                              -- ����ɳ��ս��ͣ����ʱ�� sec
CA2016_BELL_USE_LIM = 20
CA2016_BOX_USE_LIM = 20 
CA2016_BRANCH_USE_LIM = 20 
CA2016_CHRISTMASDATE1 = 20161225
CA2016_CHRISTMASDATE2 = 20161224
CA2016_HFT_ENDDATE = 20161225                       -- �����̺ڷ��õ�ͼ��������
CA2016_HFT_OPEN_BEGIN = 1000
CA2016_HFT_OPEN_END   = 2330
CA2016_BOSS_NAME   = "H�c Phong ���ng Ch�"
CA2016_BATTLE_TIME_TICK = 5                         -- �ڷ���ÿ5s����һ�μ�ʱ

CA2016_FLY_COST = {2, 97, 236, 1, "<color=red>1 Thi�n Ki�u L�nh<color>"}
CA2016_BELL     = {2, 1, 31179, 6,   "<color=red>6 Chu�ng Gi�ng Sinh<color>"}
CA2016_BOX      = {2, 1, 31178, 12,   "<color=red>12 H�p Qu� Gi�ng Sinh<color>"}
CA2016_BRANCH   = {2, 1, 31180, 3,   "<color=red>3 Nh�nh Th�ng<color>"}


CA2016_BF_MAPS = {8020, 8021, 8022}                  -- �����̺ڷ������

CA2016_BF_ENTRY = {
    ["300"] = {8020, 1639, 3241},   -- gs1
    ["200"] = {8021, 1639, 3241},   -- gs2
    ["100"] = {8022, 1639, 3241},   -- gs3
}

CA2016_BF_EXIT  = {                                   -- ��������λ��
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
    {{0,120,41,1,5},"T�i Gi�ng Sinh H�nh Ph�c"},
    {{0,120,39,1,4},"T�i Gi�ng Sinh Ch�a ��y"},
}

CA2016_KILLNPC_NORMAL_AWARD = {
    {item = {2, 1, 31178, 1, 4}, name = "H�p qu� gi�ng sinh", rate = 70,      maxrate = 10000, time = 0},
    {item = {2, 1, 31179, 1, 4}, name = "Chu�ng Gi�ng Sinh", rate = 30,      maxrate = 10000, time = 0},
    {item = {2, 1, 31180, 1, 4}, name = "Nh�nh Th�ng Gi�ng Sinh", rate = 0,       maxrate = 10000, time = 0},
}

CA2016_KILLNPC_SPECIAL_AWARD = {
    {1, 500, "H�p qu� gi�ng sinh", {2, 1, 31178, 1, 1}, 0, 0},
    {1, 400, "Chu�ng Gi�ng Sinh", {2, 1, 31179, 1, 1}, 0, 0},
    {1, 100, "Nh�nh Th�ng Gi�ng Sinh", {2, 1, 31180, 1, 1}, 0, 0},
    {1, 100  , "Chu�ng Gi�ng Sinh (��)",  {{ 
                                {"Chu�ng Gi�ng Sinh (��)",{0,	120, 25, 1, 1}}, 
                                {"Chu�ng Gi�ng Sinh (��)",{0,	120, 26, 1, 1}}, 
                                {"Chu�ng Gi�ng Sinh (��)",{0,	120, 27, 1, 1}},
                                {"Chu�ng Gi�ng Sinh (��)",{0,	120, 28, 1, 1}},   }}, 30*24*3600, 1},
    {1, 50  , "Chu�ng Gi�ng Sinh (Lam)",{{   
                                {"Chu�ng Gi�ng Sinh (Lam)",{0,	120, 29, 1, 1}}, 
                                {"Chu�ng Gi�ng Sinh (Lam)",{0,	120, 30, 1, 1}}, 
                                {"Chu�ng Gi�ng Sinh (Lam)",{0,	120, 31, 1, 1}},
                                {"Chu�ng Gi�ng Sinh (Lam)",{0,	120, 32, 1, 1}}, }}, 30*24*3600, 1},
    {1, 0  , "Chu�ng Gi�ng Sinh (T�m)",{{   
                                {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 33, 1, 1}}, 
                                {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 34, 1, 1}}, 
                                {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 35, 1, 1}},
                                {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 36, 1, 1}}, }}, 30*24*3600, 1},
    {1, 100, "Tu�n L�c",         {0,	105, 35, 1, 1, -1, -1, -1, -1, -1, -1}, 30*24*3600, 0},
    {1, 0  , "Chu�ng Gi�ng Sinh (��)", {{   
                                {"Chu�ng Gi�ng Sinh (��)",{0,	120, 25, 1, 5}}, 
                                {"Chu�ng Gi�ng Sinh (��)",{0,	120, 26, 1, 5}}, 
                                {"Chu�ng Gi�ng Sinh (��)",{0,	120, 27, 1, 5}},
                                {"Chu�ng Gi�ng Sinh (��)",{0,	120, 28, 1, 5}}, }}, 0, 1},
    {1, 1   , "Chu�ng Gi�ng Sinh (Lam)",{{   
                                {"Chu�ng Gi�ng Sinh (Lam)",{0,	120, 29, 1, 5}}, 
                                {"Chu�ng Gi�ng Sinh (Lam)",{0,	120, 30, 1, 5}}, 
                                {"Chu�ng Gi�ng Sinh (Lam)",{0,	120, 31, 1, 5}},
                                {"Chu�ng Gi�ng Sinh (Lam)",{0,	120, 32, 1, 5}}, }}, 0, 1},
    {1, 0   , "Chu�ng Gi�ng Sinh (T�m)",{{   
                                {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 33, 1, 5}}, 
                                {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 34, 1, 5}}, 
                                {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 35, 1, 5}},
                                {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 36, 1, 5}}, }}, 0, 1},
    {1, 1000, "Tranh S�c Y�n Hoa", {2, 1,  189, 1, 1}, 0, 0},
    {1, 1000, "Lam S�c Y�n Hoa", {2, 1,  190, 1, 1}, 0, 0},
    {1, 1000, "X�ch M�c H�a Di�m", {2, 1,  191, 1, 1}, 0, 0},
    {1, 1000, "Lam M�c H�a Di�m", {2, 1,  192, 1, 1}, 0, 0},
    {0, 4749, "", {}, 0, 0}, -- ʲô�Ķ�û�������
}

CA2016_KILLNPC_BOSS_AWARD = {
    {1, 500, "H�p qu� gi�ng sinh", {2, 1, 31178, 1, 1}, 0, 0},
    {1, 400, "Chu�ng Gi�ng Sinh", {2, 1, 31179, 1, 1}, 0, 0},
    {1, 100, "Nh�nh Th�ng Gi�ng Sinh", {2, 1, 31180, 1, 1}, 0, 0},
    {1, 100  , "Chu�ng Gi�ng Sinh (��)",  {{ 
                                {"Chu�ng Gi�ng Sinh (��)",{0,	120, 25, 1, 1}}, 
                                {"Chu�ng Gi�ng Sinh (��)",{0,	120, 26, 1, 1}}, 
                                {"Chu�ng Gi�ng Sinh (��)",{0,	120, 27, 1, 1}},
                                {"Chu�ng Gi�ng Sinh (��)",{0,	120, 28, 1, 1}},   }}, 30*24*3600, 1},
    {1, 50  , "Chu�ng Gi�ng Sinh (Lam)",{{   
                                {"Chu�ng Gi�ng Sinh (Lam)",{0,	120, 29, 1, 1}}, 
                                {"Chu�ng Gi�ng Sinh (Lam)",{0,	120, 30, 1, 1}}, 
                                {"Chu�ng Gi�ng Sinh (Lam)",{0,	120, 31, 1, 1}},
                                {"Chu�ng Gi�ng Sinh (Lam)",{0,	120, 32, 1, 1}}, }}, 30*24*3600, 1},
    {1, 0  , "Chu�ng Gi�ng Sinh (T�m)",{{   
                                {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 33, 1, 1}}, 
                                {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 34, 1, 1}}, 
                                {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 35, 1, 1}},
                                {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 36, 1, 1}}, }}, 30*24*3600, 1},
    {1, 100, "Tu�n L�c",         {0,	105, 35, 1, 1, -1, -1, -1, -1, -1, -1}, 30*24*3600, 0},
    {1, 0  , "Chu�ng Gi�ng Sinh (��)", {{   
                                {"Chu�ng Gi�ng Sinh (��)",{0,	120, 25, 1, 5}}, 
                                {"Chu�ng Gi�ng Sinh (��)",{0,	120, 26, 1, 5}}, 
                                {"Chu�ng Gi�ng Sinh (��)",{0,	120, 27, 1, 5}},
                                {"Chu�ng Gi�ng Sinh (��)",{0,	120, 28, 1, 5}}, }}, 0, 1},
    {1, 1   , "Chu�ng Gi�ng Sinh (Lam)",{{   
                                {"Chu�ng Gi�ng Sinh (Lam)",{0,	120, 29, 1, 5}}, 
                                {"Chu�ng Gi�ng Sinh (Lam)",{0,	120, 30, 1, 5}}, 
                                {"Chu�ng Gi�ng Sinh (Lam)",{0,	120, 31, 1, 5}},
                                {"Chu�ng Gi�ng Sinh (Lam)",{0,	120, 32, 1, 5}}, }}, 0, 1},
    {1, 0   , "Chu�ng Gi�ng Sinh (T�m)",{{   
                                {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 33, 1, 5}}, 
                                {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 34, 1, 5}}, 
                                {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 35, 1, 5}},
                                {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 36, 1, 5}}, }}, 0, 1},
    {1, 1000, "Tranh S�c Y�n Hoa", {2, 1,  189, 1, 1}, 0, 0},
    {1, 1000, "Lam S�c Y�n Hoa", {2, 1,  190, 1, 1}, 0, 0},
    {1, 1000, "X�ch M�c H�a Di�m", {2, 1,  191, 1, 1}, 0, 0},
    {1, 1000, "Lam M�c H�a Di�m", {2, 1,  192, 1, 1}, 0, 0},
    {1, 100, "Ma �ao Th�ch C�p 1", {2, 1,  30428, 1, 1}, 0, 0},
    {1, 100, "Ma �ao Th�ch C�p 2", {2, 1,  30429, 1, 1}, 0, 0},
    {1, 100, "Ma �ao Th�ch C�p 3", {2, 1,  30430, 1, 1}, 0, 0},
    {1, 50,  "Th�o Ph�t L�nh ",    {2, 1,  30915, 1, 1}, 0, 0},
    {1, 100, "V� Gi�ng sinh", {2, 1,   31181, 1, 1}, 0, 0},
    {1, 20,  "�o Cho�ng Thi�t Huy�t", {0, 152, 27, 1, 1}, 0, 0},
    {1, 20,  "Huy Ch��ng Thi�t Huy�t", {0, 153, 27, 1, 1}, 0, 0},
    {1, 20,  "Chi�n H�i Thi�t Huy�t", {0, 154, 27, 1, 1}, 0, 0},
    {1, 20,  "Huy Ch��ng Du Hi�p", {0, 153, 26, 1, 1}, 0, 0},
    {1, 20,  "�o Cho�ng Du Hi�p", {0, 152, 26, 1, 1}, 0, 0},
    {1, 20,  "Tr��ng H�i Du Hi�p", {0, 154, 26, 1, 1}, 0, 0},
    {1, 20,  "Huy Ch��ng V�n Du", {0, 153, 28, 1, 1}, 0, 0},
    {1, 20,  "�o Cho�ng V�n Du", {0, 152, 28, 1, 1}, 0, 0},
    {1, 20,  "��o H�i V�n Du", {0, 154, 28, 1, 1}, 0, 0},
    {1, 1000, "Hu�n ch��ng anh h�ng", {2, 1,  30499, 1, 1}, 0, 0},
    {0, 3119, "", {}, 0, 0}, -- ʲô�Ķ�û�������
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
    {"C�y gi�ng sinh ��c bi�t", "C�y th�ng gi�o h�i", 502, 1570, 2910},
} 

CA2016_DC_TSKID_BYTE = {
    usebell     = { "tskid_dc_byte1", 1 }, -- ���ֽڼ�¼����װ���ʹ�ô�����ÿ�����㣩 -- set_task_byte -- get_task_byte
    usebox      = { "tskid_dc_byte1", 2 },
    usebranch   = { "tskid_dc_byte1", 3 },
}

t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskGroupIdx},
   {id={"tskid_time_remain", 1,} },   -- ������ɳ��ս�����¼����ʱ��
   {id={"tskid_dc_byte1", 2,}, clear="daily" },
   {id={"tskid_exchange_bell", 3,} }, -- ��¼�Ƿ�һ���ʥ������
   {id={"tskid_christmas_package", 4,} }, -- ��¼�Ƿ������ʥ������
   {id={"tskid_exchange_package", 5,} }, -- ��¼�Ƿ�һ�����ʥ������
   {id={"tskid_exchange_purplebell", 6,} },    -- ��¼�Ƿ�һ�����ʥ������
   {id={"tskid_dc_hft", 7,}, clear="daily" },  -- �ڷ���һ�����ȥ4��
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
                    Msg2Player("S� r�i kh�i b�n �� Thi�n �m Gi�o H�c Phong ���ng trong 1 ph�t")
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
    --ˢ��boss
    Msg2Global("H�c Phong ���ng Ch� �� xu�t hi�n t�i Thi�n �m Gi�o H�c Phong ���ng, c�c ��i hi�p mau ��n �� ��nh b�i h�n, gi�nh l�y ph�n th��ng phong ph�!")
    for i = 1, getn(CA2016_BF_MAPS) do
        local tPos = CA2016_BOSS_POS[random(1,getn(CA2016_BOSS_POS))]
        local npcidx = CreateNpc("sdhd_hfttz","H�c Phong ���ng Ch�",CA2016_BF_MAPS[i],tPos[2],tPos[3])
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
	isolate_watch_npc_talk("Xa phu Tuy�n Ch�u", 100, "CA2016_handle_talk2chefu")
    isolate_watch_npc_talk("Xa phu", 200, "CA2016_handle_talk2chefu")
    isolate_watch_npc_talk("Xa phu", 300, "CA2016_handle_talk2chefu")
    isolate_watch_npc_talk("Gi�o s�", 300, "CA2016_handle_talk2churchman")                            -- ����ʿ
    isolate_watch_npc_talk(CA2016_NPC_LIST[1][2], CA2016_NPC_LIST[1][3], "CA2016_handle_talk2shengdanshu")    -- ʥ����
    isolate_watch_event("event_kill_npc", "CA2016_handle_on_kill_npc_normal", "", 600)
    isolate_watch_event("event_kill_npc", "CA2016_handle_on_kill_npc_normal", "", 601)
    isolate_watch_event("event_kill_npc", "CA2016_handle_on_kill_npc_normal", "", 602)
    isolate_watch_kill_npc("H�c Phong ���ng �� T�", CA2016_BF_MAPS[1], "CA2016_handle_on_kill_npc_special")
    isolate_watch_kill_npc("H�c Phong ���ng �� T�", CA2016_BF_MAPS[2], "CA2016_handle_on_kill_npc_special")
    isolate_watch_kill_npc("H�c Phong ���ng �� T�", CA2016_BF_MAPS[3], "CA2016_handle_on_kill_npc_special")
    isolate_watch_kill_npc(CA2016_BOSS_NAME, CA2016_BF_MAPS[1], "CA2016_handle_on_kill_boss")
    isolate_watch_kill_npc(CA2016_BOSS_NAME, CA2016_BF_MAPS[2], "CA2016_handle_on_kill_boss")
    isolate_watch_kill_npc(CA2016_BOSS_NAME, CA2016_BF_MAPS[3], "CA2016_handle_on_kill_boss")
    isolate_watch_npc_talk("Xa phu", 502, "CA2016_handle_talk2mapchefu")
    isolate_watch_npc_talk("H�p qu�", 502, "CA2016_handle_talk2lihe")
    isolate_watch_npc_talk("Xa phu", 8020, "CA2016_handle_talk2mapchefu")
    isolate_watch_npc_talk("Xa phu", 8021, "CA2016_handle_talk2mapchefu")
    isolate_watch_npc_talk("Xa phu", 8022, "CA2016_handle_talk2mapchefu")
    
end

function CA2016_handle_talk2lihe()
    local tbTalk = {
        "<color=green>H�p Qu�<color>: Gi�ng sinh vui v�!",
        "<color=green>H�p Qu�<color>: B�n c� nh�n th�y �ng Gi� Noel kh�ng?",
        "<color=green>H�p Qu�<color>: Qu� ��u � tr�n c�y th�ng k�a!",
    }
    local nRand = random(1, getn(tbTalk))
    Talk(1,"",tbTalk[nRand])
end


----------------------------------------------------------------------------------------------------------------------
--Description   
--�����͵���ɽ��502,1597,2995
--�����������̺ڷ���: ÿ�δ��Ϳ۳�1���콾��,ÿ�ν���ֻ�ܴ�30����,ʱ�䵽֮��ᱻ���ͳ�ȥ,ÿ�λ�ɱ�ڷ��õĹ���ʱ����10����Ϊ.
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
    tinsert(tbSay,format("��a ta ��n ch� C�y Th�ng � Hoa S�n/#NewWorld(%d,%d,%d)",CA2016_NPC_LIST[1][3],CA2016_NPC_LIST[1][4],CA2016_NPC_LIST[1][5]));
    if CA2016_hft_check()==1 then 
        tinsert(tbSay,"��a ta ��n Thi�n �m Gi�o H�c Phong ���ng (M�i ng�y l�c 10:00 - 23:30 ���c v�o)/CA2016_fly2HFTbattlefield");
    else 
        tinsert(tbSay,"��a ta ��n Thi�n �m Gi�o H�c Phong ���ng (�� ��ng)/#Talk(1,\"CA2016_handle_talk2chefu\",\"B�n �� Thi�n �m Gi�o H�c Phong ���ng �� ��ng.\")") 
    end
    tinsert(tbSay,"T� b�/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function CA2016_fly2HFTbattlefield()
    -- �����ǰ�˳���ͼ�������������ļ������룬ֱ������һСʱ
    local nTimeRemain = get_task("tskid_time_remain");
    local nTime = GetTime(); 
    local m,_,_ = GetWorldPos();
    local szMap = tostring(m);
    if nTimeRemain > 0 then
          NewWorld(CA2016_BF_ENTRY[szMap][1],CA2016_BF_ENTRY[szMap][2],CA2016_BF_ENTRY[szMap][3])
          SetLogoutRV(1);	--���õ�½��Ϊ����������
          SetFightState(1)
          return
    end
    -- ��������
    local nTimes = get_task("tskid_dc_hft")
    if nTimes >= 4 then Talk(1,"","M�i ng�y c� t�i �a 4 l�n v�o b�n �� H�c Phong ���ng.")return end;
    local nCnt = GetItemCount(CA2016_FLY_COST[1],CA2016_FLY_COST[2],CA2016_FLY_COST[3])
    if nCnt < CA2016_FLY_COST[4] then
        Talk(1,"",CHEFU_NAME.."��n Thi�n �m Gi�o H�c Phong ���ng c�n"..CA2016_FLY_COST[5]..".");
        return
    end
    local szTitle   = format("%s ��n Thi�n �m Gi�o H�c Phong ���ng c�n %s, v� ch� ���c � �� <color=red>%d ph�t<color>, kh�ch quan mu�n ��n �� kh�ng?",CHEFU_NAME,CA2016_FLY_COST[5],floor(CA2016_STAYTIME/60));
    local tbSay     = {};
    tinsert(tbSay,"���c/CA2016_fly2HFTbattlefieldConfirm");
    tinsert(tbSay,"T� b�/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function CA2016_fly2HFTbattlefieldConfirm()
    local m,_,_ = GetWorldPos();
    local szMap = tostring(m);
    if DelItem(CA2016_FLY_COST[1],CA2016_FLY_COST[2],CA2016_FLY_COST[3],CA2016_FLY_COST[4]) == 1 then
        local nTime = GetTime();
        NewWorld(CA2016_BF_ENTRY[szMap][1],CA2016_BF_ENTRY[szMap][2],CA2016_BF_ENTRY[szMap][3])
        SetLogoutRV(1);	--���õ�½��Ϊ����������
        SetFightState(1)
        set_task("tskid_time_remain",CA2016_STAYTIME);
        set_task("tskid_dc_hft",get_task("tskid_dc_hft")+1)
    end
end


----------------------------------------------------------------------------------------------------------------------
--Description   
--��ͨ��ͼ�����ԭһ,���ԭ��,���첿�� 600,601,602
--�����ͼ�������̺ڷ���,����д���ʵ���ʥ��װ�����,С���ʵ�����װ�Ҽ���ʥ������,΢���ʵ���������װ�Ҽ�,�����̺ڷ��õ���ĸ��ֵ��߶����Խ��� �����̺ڷ���
----------------------------------------------------------------------------------------------------------------------
function CA2016_handle_on_kill_npc_normal(data, para)
    -- Msg2Player("[Debug] killing in normal map --2016ChristmasActivity");
    for i = 1, getn(CA2016_KILLNPC_NORMAL_AWARD) do
        CA2016_give_award(i, 'normal');
    end
end
function CA2016_handle_on_kill_npc_special(data, para)
    -- Msg2Player("[Debug] killing in special map --2016ChristmasActivity");
    gf_EventGiveRandAward(CA2016_KILLNPC_SPECIAL_AWARD, gf_SumRandBase(CA2016_KILLNPC_SPECIAL_AWARD), 15, "Ph�n th��ng H�c Phong ���ng �� T�", "Ho�t ��ng Song ��n 2016")
    ModifyPopur(10);
    Msg2Player("B�n �� nh�n ���c 10 �i�m tu vi")
end


function CA2016_handle_on_kill_boss(...)
    -- Msg2Player("[Debug] boss is killed --2016ChristmasActivity");
    gf_EventGiveRandAward(CA2016_KILLNPC_BOSS_AWARD, gf_SumRandBase(CA2016_KILLNPC_BOSS_AWARD), 30, "Ph�n th��ng H�c Phong ���ng Ch�", "Ho�t ��ng Song ��n 2016") -- �������
    gf_EventGiveRandAward(CA2016_KILLNPC_BOSS_AWARD, gf_SumRandBase(CA2016_KILLNPC_BOSS_AWARD), 30, "Ph�n th��ng H�c Phong ���ng Ch�", "Ho�t ��ng Song ��n 2016")
    gf_EventGiveRandAward(CA2016_KILLNPC_BOSS_AWARD, gf_SumRandBase(CA2016_KILLNPC_BOSS_AWARD), 30, "Ph�n th��ng H�c Phong ���ng Ch�", "Ho�t ��ng Song ��n 2016")
    ModifyPopur(10);
    Msg2Player("B�n �� nh�n ���c 10 �i�m tu vi")
end

----------------------------------------------------------------------------------------------------------------------
--Description   
--��ʥ�����Ի�����ʥ��װ��ҵ�ʥ�����ϣ���Ȼ��û���,���ʻ��ʥ�����ӡ���������װ��
--��������У���֦
----------------------------------------------------------------------------------------------------------------------
function CA2016_handle_talk2shengdanshu()
    local szTitle   = TREE_NAME.."Gi�ng sinh vui v�! M�i lo�i v�t li�u ���c trang tr� 20 l�n/ng�y. N�u may m�n s� nh�n ���c V� Gi�ng Sinh �� nha.";
    local tbSay     = {};
    tinsert(tbSay,format("D�ng Chu�ng trang tr� (M�i l�n t�n %d Chu�ng Gi�ng Sinh)/#CA2016_dress_up(%d)",CA2016_BELL[4],1));
    tinsert(tbSay,format("D�ng H�p Qu� trang tr� (M�i l�n t�n %d H�p Qu� Gi�ng Sinh)/#CA2016_dress_up(%d)",CA2016_BOX[4],2));
    tinsert(tbSay,format("D�ng Nh�nh Th�ng trang tr� (M�i l�n t�n %d Nh�nh Th�ng)/#CA2016_dress_up(%d)",CA2016_BRANCH[4],3));
    -- tinsert(tbSay,"Debug_reflash_tskid/reflash_tskid");
    tinsert(tbSay,"T� b�/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function CA2016_dress_up(nType)
    local USELIM = CA2016_DC_TSKID_BYTE;
    if nType == 1 then
        local used = get_task_byte(USELIM.usebell[1],USELIM.usebell[2])
        if used >= CA2016_BELL_USE_LIM then Talk(1,"","S� l�n trang tr� h�m nay �� h�t.") return end
        local nNum = GetItemCount(CA2016_BELL[1],CA2016_BELL[2],CA2016_BELL[3])
        if nNum < CA2016_BELL[4] then Talk(1,"",format("D�ng %s trang tr� c�n �t nh�t %s.",TREE_NAME,CA2016_BELL[5])) return end
        
        nNum = floor(nNum/CA2016_BELL[4])
        nNum = min(CA2016_BELL_USE_LIM - used, nNum);
        AskClientForNumber("CA2016_dress_up_with_bell", 1, nNum, "Trang tr� bao nhi�u l�n?"); 
    elseif nType == 2 then
        local used = get_task_byte(USELIM.usebox[1],USELIM.usebox[2])
        if used >= CA2016_BOX_USE_LIM then Talk(1,"","S� l�n trang tr� h�m nay �� h�t.") return end
        local nNum = GetItemCount(CA2016_BOX[1],CA2016_BOX[2],CA2016_BOX[3])
        if nNum < CA2016_BOX[4] then Talk(1,"",format("D�ng %s trang tr� c�n �t nh�t %s.",TREE_NAME,CA2016_BOX[5])) return end

        nNum = floor(nNum/CA2016_BOX[4])
        nNum = min(CA2016_BOX_USE_LIM - used, nNum);
        AskClientForNumber("CA2016_dress_up_with_box", 1, nNum, "Trang tr� bao nhi�u l�n?"); 

    elseif nType == 3 then
        local used = get_task_byte(USELIM.usebranch[1],USELIM.usebranch[2])
        if used >= CA2016_BRANCH_USE_LIM then Talk(1,"","S� l�n trang tr� h�m nay �� h�t.") return end
        local nNum = GetItemCount(CA2016_BRANCH[1],CA2016_BRANCH[2],CA2016_BRANCH[3])
        if nNum < CA2016_BRANCH[4] then Talk(1,"",format("D�ng %s trang tr� c�n �t nh�t %s.",TREE_NAME,CA2016_BRANCH[5])) return end
        nNum = floor(nNum/CA2016_BRANCH[4])
        nNum = min(CA2016_BRANCH_USE_LIM - used, nNum);
        AskClientForNumber("CA2016_dress_up_with_branch", 1, nNum, "Trang tr� bao nhi�u l�n?"); 
    end

end

function CA2016_DressUp_Award()
    local szAward = "sdhd_sdsjl"
	if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
		return 0
	end
	if CustomAwardGiveGroup(szAward, 0) > 0 then     --���Ų���Ϊ�Ƿ����ȫ������,�������1
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
--�ɶ����󴫽�ʿ����һ�������̵�,����ʥ������,�һ�����,���̵굽12��26��24:00֮��ر�
----------------------------------------------------------------------------------------------------------------------
function CA2016_handle_talk2churchman()
    local szTitle   = "<color=green>Gi�o S�<color>:".."Gi�ng sinh s�p ��n, l� v�t do V� L�m Minh chu�n b� �� b� Thi�n �m Gi�o tr�m �i h�n n�a, phi�n c�c v� ��i hi�p v�o ng�y 15/12 - 24h 26/12 ��n ��i Th�o Nguy�n 1-2, b� l�c V��ng K� c�ng c� th� t�m Xa Phu di chuy�n ��n Thi�n �m Gi�o H�c Phong ���ng (H�c Phong ���ng m�i ng�y ���c v�o t�i �a 4 l�n, m�i l�n ���c � l�i 30 ph�t) �� t�m qu� gi�ng sinh b� m�t, ��a ch�ng v� ��nh Hoa S�n �� trang tr� C�y Th�ng. Trang tr� xong s� nh�n ���c ph�n th��ng, n�u may m�n c�n nh�n ���c V� Gi�ng Sinh. Thu th�p ���c s� V� nh�t ��nh r�i ��n g�p ta ��i Trang S�c Gi�ng Sinh. Ngo�i ra v�o ng�y l� gi�ng sinh (24-25/12), m�i ng��i c� th� ��n g�p ta nh�n 1 T�i Gi�ng Sinh v� Chu�ng. C�c v� hi�p s�, ch�c c�c v� gi�ng sinh vui v�!";
    local tbSay     = {};
    local bFlag = get_task("tskid_christmas_package")
    local bExch = get_task("tskid_exchange_package")
    local bExch2 = get_task("tskid_exchange_purplebell")
    local nCurDate = tonumber(date("%Y%m%d"))
    tinsert(tbSay,"T�n 10 V� Gi�ng Sinh v� 300 V�ng ��i 1 Chu�ng Gi�ng Sinh (��) v�nh vi�n/CA2016_exchange_bell");
    if (nCurDate==CA2016_CHRISTMASDATE1 or nCurDate == CA2016_CHRISTMASDATE2) and bFlag ~= 1 then tinsert(tbSay,"Nh�n 1 T�i Gi�ng Sinh H�nh Ph�c v� 1 Chu�ng Gi�ng Sinh (T�m)/CA2016_get_Christmas_package") end;
    if bFlag == 1 and ( bExch == 0 or bExch2 == 0 )then tinsert(tbSay,"��i T�i Gi�ng Sinh H�nh Ph�c (v�nh vi�n) v� Chu�ng Gi�ng Sinh (T�m) (v�nh vi�n)/CA2016_exchange_package") end;
    -- tinsert(tbSay,"reset/reset_churchman");
    -- tinsert(tbSay,"addscore/addscore_churchman");
    tinsert(tbSay,"T� b�/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end


function CA2016_get_Christmas_package()
    local bFlag = get_task("tskid_christmas_package")
    if nFlag == 1 then Talk(1,"CA2016_handle_talk2churchman","M�i ng��i ch� ���c nh�n m�t l�n th�i.") return end
    if gf_Judge_Room_Weight(2, 0) ~= 1 then Talk(1,"","Kh�ng gian h�nh trang kh�ng ��") return end
    local _,nIdx1 = gf_AddItemEx(CA2016_CHRISTMAS_PACKAGE[1][1],CA2016_CHRISTMAS_PACKAGE[1][2])
    SetItemExpireTime(nIdx1, 30*24*3600)
    local tBell =   { 
        {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 33, 1, 4}}, 
        {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 34, 1, 4}}, 
        {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 35, 1, 4}},
        {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 36, 1, 4}},
    }
    local nBody = GetBody()
    local tAward = tBell[nBody];
    local _,nIdx2 = gf_AddItemEx(tAward[2], tAward[1]);
    SetItemExpireTime(nIdx2, 30*24*3600)
    set_task("tskid_christmas_package",1)
end

function CA2016_exchange_package()
    local szTitle   = "<color=green>Gi�o S�<color>:".."Gi�ng sinh ��n r�i, c�c ��i hi�p c� th� ��n g�p ta nh�n qu� gi�ng sinh.";
    local tbSay     = {};
    if get_task("tskid_exchange_purplebell") ~= 1 then tinsert(tbSay,"1 Thi�n Cang L�nh, 1 Thi�n M�n Kim L�nh, 300 �i�m Phong Hoa, �em Chu�ng Gi�ng Sinh (T�m) c� th�i h�n ��i th�nh Chu�ng Gi�ng Sinh (T�m) v�nh vi�n/#CA2016_exchange_package_confirm(1)"); end
    if get_task("tskid_exchange_package") ~= 1 then tinsert(tbSay,"2 Thi�n Cang L�nh, 2 Thi�n M�n Kim L�nh, 1000 �i�m Phong Hoa, �em T�i Gi�ng Sinh H�nh Ph�c c� th�i h�n ��i th�nh T�i Gi�ng Sinh H�nh Ph�c v�nh vi�n/#CA2016_exchange_package_confirm(2)"); end
    if get_task("tskid_exchange_purplebell") ~= 1 then tinsert(tbSay,"100 V� Gi�ng Sinh, 1000 �i�m Phong Hoa, �em Chu�ng Gi�ng Sinh (T�m) c� th�i h�n ��i th�nh Chu�ng Gi�ng Sinh (T�m) v�nh vi�n/#CA2016_exchange_package_confirm(3)"); end
    tinsert(tbSay,"T� b�/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function CA2016_exchange_package_confirm(nType)
    local tBell =   { 
        {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 33, 1, 5}}, 
        {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 34, 1, 5}}, 
        {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 35, 1, 5}},
        {"Chu�ng Gi�ng Sinh (T�m)",{0,	120, 36, 1, 5}},
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
        if nBell < 1 then Talk(1,"","H�y c�t Chu�ng Gi�ng Sinh (T�m) v�o h�nh trang")return end
        if nTianG < 1 then Talk(1,"","Thi�n Cang L�nh kh�ng ��") return end
        if nTianM < 1 then Talk(1,"","Thi�n M�n Kim L�nh kh�ng ��") return end
        if nFenghua < 300 then Talk(1,"","�i�m Phong Hoa kh�ng ��")return end
        if DelItem(2,95,204,1) ~= 1 then return end
        if DelItem(2,1,30370,1) ~= 1 then return end
        ornament_add_score(-300)
        Msg2Player(format("B�n �� m�t 300 �i�m Phong Hoa, c�n %s �i�m",ornament_get_score()))
    elseif nType == 2 then
        if nPackage < 1 then Talk(1,"","H�y c�t T�i Gi�ng Sinh H�nh Ph�c v�o h�nh trang")return end
        if nTianG < 2 then Talk(1,"","Thi�n Cang L�nh kh�ng ��") return end
        if nTianM < 2 then Talk(1,"","Thi�n M�n Kim L�nh kh�ng ��") return end
        if nFenghua < 1000 then Talk(1,"","�i�m Phong Hoa kh�ng ��")return end
        if DelItem(2,95,204,2) ~= 1 then return end
        if DelItem(2,1,30370,2) ~= 1 then return end
        ornament_add_score(-1000)
        Msg2Player(format("B�n �� m�t 1000 �i�m Phong Hoa, c�n %s �i�m",ornament_get_score()))
    else
        if nBell < 1 then Talk(1,"","H�y c�t Chu�ng Gi�ng Sinh (T�m) v�o h�nh trang")return end
        if nWazi < 100 then  Talk(1,"","V� Gi�ng Sinh kh�ng ��")return end
        if nFenghua < 1000 then Talk(1,"","�i�m Phong Hoa kh�ng ��")return end
        if DelItem(2,1,31181,100) ~= 1 then return end
        ornament_add_score(-1000)
        Msg2Player(format("B�n �� m�t 1000 �i�m Phong Hoa, c�n %s �i�m",ornament_get_score()))
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
    local szNpcName   = "<color=green>Gi�o S�<color>:"
    local bHasExchange = get_task("tskid_exchange_bell")
    if bHasExchange == 1 then
        Talk(1,"",szNpcName.."M�i ng��i ch� ���c ��i 1 l�n.");
        return
    end
    local nCnt = GetItemCount(2,1,31181)
    local nCash = GetCash()
    if nCnt < 10 then
        Talk(1,"",szNpcName.."V� Gi�ng Sinh trong h�nh trang kh�ng �� 10.");
        return
    end
    if nCash < 3000000 then
        Talk(1,"",szNpcName.."Ti�n tr�n ng��i kh�ng ��.");
        return
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"","Kh�ng gian h�nh trang kh�ng ��") return end
    DelItem(2,1,31181,10) 
    Pay(3000000)
    local tBell =   { 
        {"Chu�ng Gi�ng Sinh (��)",{0,	120, 25, 1, 5}}, 
        {"Chu�ng Gi�ng Sinh (��)",{0,	120, 26, 1, 5}}, 
        {"Chu�ng Gi�ng Sinh (��)",{0,	120, 27, 1, 5}},
        {"Chu�ng Gi�ng Sinh (��)",{0,	120, 28, 1, 5}},
    }
    local nBody = GetBody()
    local tAward = tBell[nBody];
    local _,nIdx = gf_AddItemEx(tAward[2], tAward[1]);
    set_task("tskid_exchange_bell",1)
end


function CA2016_handle_talk2mapchefu()
    local szNpcName   = "<color=green>Xa Phu<color>: T�i c� th� ��a ng�i v� th�nh ch�nh, ng�i mu�n v� kh�ng?"
    local tbSay     = {};
    tinsert(tbSay,"���c/CA2016_recall_to_city")
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
    local NPC       = CA2016_NPC_LIST[1];                               -- "ʥ����"
    local npcIdx    = CreateNpc(NPC[1],NPC[2],NPC[3],NPC[4],NPC[5]);
     
    for i = 1, getn(CA2016_NPC_POS) do
        CreateNpc("sdhd_hftdz","H�c Phong ���ng �� T�",CA2016_BF_MAPS[1],CA2016_NPC_POS[i][2],CA2016_NPC_POS[i][3])
        CreateNpc("sdhd_hftdz","H�c Phong ���ng �� T�",CA2016_BF_MAPS[2],CA2016_NPC_POS[i][2],CA2016_NPC_POS[i][3])  -- ��ˢ����������ͼ��NPC
        CreateNpc("sdhd_hftdz","H�c Phong ���ng �� T�",CA2016_BF_MAPS[3],CA2016_NPC_POS[i][2],CA2016_NPC_POS[i][3])
    end
    for i = 1, getn(CA2016_LIHE_NPC) do
        CreateNpc("Event gi�ng sinh VN","H�p qu�",CA2016_LIHE_NPC[i][1],CA2016_LIHE_NPC[i][2],CA2016_LIHE_NPC[i][3])
    end
    for i = 1, getn(CA2016_CHEFU_NPC) do
        CreateNpc("Xa phu","Xa phu",CA2016_CHEFU_NPC[i][1],CA2016_CHEFU_NPC[i][2],CA2016_CHEFU_NPC[i][3])
        if CA2016_CHEFU_NPC[i][1] == CA2016_BF_MAPS[1] then                                                -- ��ˢ����������ͼ�ĳ���
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
--����ΪӦ��ģ��Ŀ�ѡ���ã�ֻҪ��������Щ�����ͺ�����ϵͳ�ͻ��Զ�ע��ͻص�
--t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskGroupIdx},
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
--function on_first_login_clear() end --isolate���ߺ��һ�ε�¼ʱ������



-- 1 ����������ͼ�����ߺ����ߣ���δ���
-- 2 �����ͼ��ʱ��ʽ�������ͼ�ڲ���ʱ���ǰ�ʱ���ʱ

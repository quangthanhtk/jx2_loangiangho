--ÕâÊÇÄ£¿é»¯µÄÒ»¸ö±ê×¼Ö÷ÎÄ¼þ£¬¸÷Ä£¿éÖ»ÐèÒªÊµÏÖ¶ÔÓ¦µÄ±ê×¼ÊÂ¼þ´¦Àíº¯Êý£¬²»ÐèÒª¹ØÐÄÕâÐ©º¯ÊýÊ²Ã´Ê±ºò±»µ÷ÓÃ
--Ä£¿é¸úÄ£¿éÖ®¼ä²»ÄÜÓÐIncludeºÍµ÷ÓÃ¹ØÏµ
--ËùÒÔÃ¿¸öÄ£¿éÊÇ¶ÀÁ¢µÄ
--²»ÐèÒªµÄhandlerÇë×¢ÊÍµ÷£¬ÒÔÃâ¿Õ»Øµ÷Ó°ÏìÐ§ÂÊ

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\settings\\static_script\\lib\\item_define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\lib\\normal_exchange.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
Include("\\script\\function\\ornament\\ornament.lua")
t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ð§ >0:Ä£¿éÓÐÐ§£¬ÊýÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "ChristmasActivity",
    szViewName 			= "Event Gi¸ng Sinh 2016",
    nTalkBeginDate		= 20161215,
    nBeginDate 			= 20161215,
    nEndDate 			= 20161226,
    nTaskGroup 			= 3,
    nTaskGroupVersion	= 21,
}


CHEFU_NAME      = "<color=green>Xa Phu<color>:"
TREE_NAME       = "<color=green>C©y Th«ng Gi¸ng Sinh<color>:"
CA2016_STAYTIME = 30*60                              -- ÔÚÇàÉ³ºÓÕ½³¡Í£ÁôµÄÊ±¼ä sec
CA2016_BELL_USE_LIM = 20
CA2016_BOX_USE_LIM = 20 
CA2016_BRANCH_USE_LIM = 20 
CA2016_CHRISTMASDATE1 = 20161225
CA2016_CHRISTMASDATE2 = 20161224
CA2016_HFT_ENDDATE = 20161225                       -- ÌìÒõ½ÌºÚ·çÌÃµØÍ¼½áÊøÈÕÆÚ
CA2016_HFT_OPEN_BEGIN = 1000
CA2016_HFT_OPEN_END   = 2330
CA2016_BOSS_NAME   = "H¾c Phong §­êng Chñ"
CA2016_BATTLE_TIME_TICK = 5                         -- ºÚ·çÌÃÃ¿5s½øÐÐÒ»´Î¼ÆÊ±

CA2016_FLY_COST = {2, 97, 236, 1, "<color=red>1 Thiªn Kiªu LÖnh<color>"}
CA2016_BELL     = {2, 1, 31179, 6,   "<color=red>6 Chu«ng Gi¸ng Sinh<color>"}
CA2016_BOX      = {2, 1, 31178, 12,   "<color=red>12 Hép Quµ Gi¸ng Sinh<color>"}
CA2016_BRANCH   = {2, 1, 31180, 3,   "<color=red>3 Nh¸nh Th«ng<color>"}


CA2016_BF_MAPS = {8020, 8021, 8022}                  -- ÌìÒõ½ÌºÚ·çÌÃÈë¿Ú

CA2016_BF_ENTRY = {
    ["300"] = {8020, 1639, 3241},   -- gs1
    ["200"] = {8021, 1639, 3241},   -- gs2
    ["100"] = {8022, 1639, 3241},   -- gs3
}

CA2016_BF_EXIT  = {                                   -- ·µ»ØÖ÷³ÇÎ»ÖÃ
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
    {{0,120,41,1,5},"Tói Gi¸ng Sinh H¹nh Phóc"},
    {{0,120,39,1,4},"Tói Gi¸ng Sinh Ch­a §Çy"},
}

CA2016_KILLNPC_NORMAL_AWARD = {
    {item = {2, 1, 31178, 1, 4}, name = "Hép quµ gi¸ng sinh", rate = 70,      maxrate = 10000, time = 0},
    {item = {2, 1, 31179, 1, 4}, name = "Chu«ng Gi¸ng Sinh", rate = 30,      maxrate = 10000, time = 0},
    {item = {2, 1, 31180, 1, 4}, name = "Nh¸nh Th«ng Gi¸ng Sinh", rate = 0,       maxrate = 10000, time = 0},
}

CA2016_KILLNPC_SPECIAL_AWARD = {
    {1, 500, "Hép quµ gi¸ng sinh", {2, 1, 31178, 1, 1}, 0, 0},
    {1, 400, "Chu«ng Gi¸ng Sinh", {2, 1, 31179, 1, 1}, 0, 0},
    {1, 100, "Nh¸nh Th«ng Gi¸ng Sinh", {2, 1, 31180, 1, 1}, 0, 0},
    {1, 100  , "Chu«ng Gi¸ng Sinh (§á)",  {{ 
                                {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 25, 1, 1}}, 
                                {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 26, 1, 1}}, 
                                {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 27, 1, 1}},
                                {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 28, 1, 1}},   }}, 30*24*3600, 1},
    {1, 50  , "Chu«ng Gi¸ng Sinh (Lam)",{{   
                                {"Chu«ng Gi¸ng Sinh (Lam)",{0,	120, 29, 1, 1}}, 
                                {"Chu«ng Gi¸ng Sinh (Lam)",{0,	120, 30, 1, 1}}, 
                                {"Chu«ng Gi¸ng Sinh (Lam)",{0,	120, 31, 1, 1}},
                                {"Chu«ng Gi¸ng Sinh (Lam)",{0,	120, 32, 1, 1}}, }}, 30*24*3600, 1},
    {1, 0  , "Chu«ng Gi¸ng Sinh (TÝm)",{{   
                                {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 33, 1, 1}}, 
                                {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 34, 1, 1}}, 
                                {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 35, 1, 1}},
                                {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 36, 1, 1}}, }}, 30*24*3600, 1},
    {1, 100, "TuÇn Léc",         {0,	105, 35, 1, 1, -1, -1, -1, -1, -1, -1}, 30*24*3600, 0},
    {1, 0  , "Chu«ng Gi¸ng Sinh (§á)", {{   
                                {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 25, 1, 5}}, 
                                {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 26, 1, 5}}, 
                                {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 27, 1, 5}},
                                {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 28, 1, 5}}, }}, 0, 1},
    {1, 1   , "Chu«ng Gi¸ng Sinh (Lam)",{{   
                                {"Chu«ng Gi¸ng Sinh (Lam)",{0,	120, 29, 1, 5}}, 
                                {"Chu«ng Gi¸ng Sinh (Lam)",{0,	120, 30, 1, 5}}, 
                                {"Chu«ng Gi¸ng Sinh (Lam)",{0,	120, 31, 1, 5}},
                                {"Chu«ng Gi¸ng Sinh (Lam)",{0,	120, 32, 1, 5}}, }}, 0, 1},
    {1, 0   , "Chu«ng Gi¸ng Sinh (TÝm)",{{   
                                {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 33, 1, 5}}, 
                                {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 34, 1, 5}}, 
                                {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 35, 1, 5}},
                                {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 36, 1, 5}}, }}, 0, 1},
    {1, 1000, "Tranh S¾c Yªn Hoa", {2, 1,  189, 1, 1}, 0, 0},
    {1, 1000, "Lam S¾c Yªn Hoa", {2, 1,  190, 1, 1}, 0, 0},
    {1, 1000, "XÝch M¹c Háa DiÖm", {2, 1,  191, 1, 1}, 0, 0},
    {1, 1000, "Lam M¹c Háa DiÖm", {2, 1,  192, 1, 1}, 0, 0},
    {0, 4749, "", {}, 0, 0}, -- Ê²Ã´µÄ¶¼Ã»ÓÐËæ»úµ½
}

CA2016_KILLNPC_BOSS_AWARD = {
    {1, 500, "Hép quµ gi¸ng sinh", {2, 1, 31178, 1, 1}, 0, 0},
    {1, 400, "Chu«ng Gi¸ng Sinh", {2, 1, 31179, 1, 1}, 0, 0},
    {1, 100, "Nh¸nh Th«ng Gi¸ng Sinh", {2, 1, 31180, 1, 1}, 0, 0},
    {1, 100  , "Chu«ng Gi¸ng Sinh (§á)",  {{ 
                                {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 25, 1, 1}}, 
                                {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 26, 1, 1}}, 
                                {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 27, 1, 1}},
                                {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 28, 1, 1}},   }}, 30*24*3600, 1},
    {1, 50  , "Chu«ng Gi¸ng Sinh (Lam)",{{   
                                {"Chu«ng Gi¸ng Sinh (Lam)",{0,	120, 29, 1, 1}}, 
                                {"Chu«ng Gi¸ng Sinh (Lam)",{0,	120, 30, 1, 1}}, 
                                {"Chu«ng Gi¸ng Sinh (Lam)",{0,	120, 31, 1, 1}},
                                {"Chu«ng Gi¸ng Sinh (Lam)",{0,	120, 32, 1, 1}}, }}, 30*24*3600, 1},
    {1, 0  , "Chu«ng Gi¸ng Sinh (TÝm)",{{   
                                {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 33, 1, 1}}, 
                                {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 34, 1, 1}}, 
                                {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 35, 1, 1}},
                                {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 36, 1, 1}}, }}, 30*24*3600, 1},
    {1, 100, "TuÇn Léc",         {0,	105, 35, 1, 1, -1, -1, -1, -1, -1, -1}, 30*24*3600, 0},
    {1, 0  , "Chu«ng Gi¸ng Sinh (§á)", {{   
                                {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 25, 1, 5}}, 
                                {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 26, 1, 5}}, 
                                {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 27, 1, 5}},
                                {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 28, 1, 5}}, }}, 0, 1},
    {1, 1   , "Chu«ng Gi¸ng Sinh (Lam)",{{   
                                {"Chu«ng Gi¸ng Sinh (Lam)",{0,	120, 29, 1, 5}}, 
                                {"Chu«ng Gi¸ng Sinh (Lam)",{0,	120, 30, 1, 5}}, 
                                {"Chu«ng Gi¸ng Sinh (Lam)",{0,	120, 31, 1, 5}},
                                {"Chu«ng Gi¸ng Sinh (Lam)",{0,	120, 32, 1, 5}}, }}, 0, 1},
    {1, 0   , "Chu«ng Gi¸ng Sinh (TÝm)",{{   
                                {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 33, 1, 5}}, 
                                {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 34, 1, 5}}, 
                                {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 35, 1, 5}},
                                {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 36, 1, 5}}, }}, 0, 1},
    {1, 1000, "Tranh S¾c Yªn Hoa", {2, 1,  189, 1, 1}, 0, 0},
    {1, 1000, "Lam S¾c Yªn Hoa", {2, 1,  190, 1, 1}, 0, 0},
    {1, 1000, "XÝch M¹c Háa DiÖm", {2, 1,  191, 1, 1}, 0, 0},
    {1, 1000, "Lam M¹c Háa DiÖm", {2, 1,  192, 1, 1}, 0, 0},
    {1, 100, "Ma §ao Th¹ch CÊp 1", {2, 1,  30428, 1, 1}, 0, 0},
    {1, 100, "Ma §ao Th¹ch CÊp 2", {2, 1,  30429, 1, 1}, 0, 0},
    {1, 100, "Ma §ao Th¹ch CÊp 3", {2, 1,  30430, 1, 1}, 0, 0},
    {1, 50,  "Th¶o Ph¹t Lªnh ",    {2, 1,  30915, 1, 1}, 0, 0},
    {1, 100, "Ví Gi¸ng sinh", {2, 1,   31181, 1, 1}, 0, 0},
    {1, 20,  "¸o Choµng ThiÕt HuyÕt", {0, 152, 27, 1, 1}, 0, 0},
    {1, 20,  "Huy Ch­¬ng ThiÕt HuyÕt", {0, 153, 27, 1, 1}, 0, 0},
    {1, 20,  "ChiÕn Hµi ThiÕt HuyÕt", {0, 154, 27, 1, 1}, 0, 0},
    {1, 20,  "Huy Ch­¬ng Du HiÖp", {0, 153, 26, 1, 1}, 0, 0},
    {1, 20,  "¸o Choµng Du HiÖp", {0, 152, 26, 1, 1}, 0, 0},
    {1, 20,  "Tr­êng Hµi Du HiÖp", {0, 154, 26, 1, 1}, 0, 0},
    {1, 20,  "Huy Ch­¬ng V©n Du", {0, 153, 28, 1, 1}, 0, 0},
    {1, 20,  "¸o Choµng V©n Du", {0, 152, 28, 1, 1}, 0, 0},
    {1, 20,  "§¹o Hµi V©n Du", {0, 154, 28, 1, 1}, 0, 0},
    {1, 1000, "Hu©n ch­¬ng anh hïng", {2, 1,  30499, 1, 1}, 0, 0},
    {0, 3119, "", {}, 0, 0}, -- Ê²Ã´µÄ¶¼Ã»ÓÐËæ»úµ½
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
    {"C©y gi¸ng sinh ®Æc biÖt", "C©y th«ng gi¸o héi", 502, 1570, 2910},
} 

CA2016_DC_TSKID_BYTE = {
    usebell     = { "tskid_dc_byte1", 1 }, -- °´×Ö½Ú¼ÇÂ¼Áåîõ×°°çµÄÊ¹ÓÃ´ÎÊý£¨Ã¿ÈÕÇåÁã£© -- set_task_byte -- get_task_byte
    usebox      = { "tskid_dc_byte1", 2 },
    usebranch   = { "tskid_dc_byte1", 3 },
}

t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskGroupIdx},
   {id={"tskid_time_remain", 1,} },   -- ½øÈëÇàÉ³ºÓÕ½³¡ºó¼ÇÂ¼½áÊøÊ±¼ä
   {id={"tskid_dc_byte1", 2,}, clear="daily" },
   {id={"tskid_exchange_bell", 3,} }, -- ¼ÇÂ¼ÊÇ·ñ¶Ò»»ÁËÊ¥µ®Áåîõ
   {id={"tskid_christmas_package", 4,} }, -- ¼ÇÂ¼ÊÇ·ñÁì¹ýÁËÊ¥µ®°ü¹ü
   {id={"tskid_exchange_package", 5,} }, -- ¼ÇÂ¼ÊÇ·ñ¶Ò»»¹ýÁËÊ¥µ®°ü¹ü
   {id={"tskid_exchange_purplebell", 6,} },    -- ¼ÇÂ¼ÊÇ·ñ¶Ò»»¹ýÁËÊ¥µ®°ü¹ü
   {id={"tskid_dc_hft", 7,}, clear="daily" },  -- ºÚ·çÌÃÒ»Ìì×î¶àÈ¥4´Î
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
                    Msg2Player("SÏ rêi khái b¶n ®å Thiªn ¢m Gi¸o H¾c Phong §­êng trong 1 phót")
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
    --Ë¢ÐÂboss
    Msg2Global("H¾c Phong §­êng Chñ ®· xuÊt hiÖn t¹i Thiªn ¢m Gi¸o H¾c Phong §­êng, c¸c ®¹i hiÖp mau ®Õn ®ã ®¸nh b¹i h¾n, giµnh lÊy phÇn th­ëng phong phó!")
    for i = 1, getn(CA2016_BF_MAPS) do
        local tPos = CA2016_BOSS_POS[random(1,getn(CA2016_BOSS_POS))]
        local npcidx = CreateNpc("sdhd_hfttz","H¾c Phong §­êng Chñ",CA2016_BF_MAPS[i],tPos[2],tPos[3])
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
	isolate_watch_npc_talk("Xa phu TuyÒn Ch©u", 100, "CA2016_handle_talk2chefu")
    isolate_watch_npc_talk("Xa phu", 200, "CA2016_handle_talk2chefu")
    isolate_watch_npc_talk("Xa phu", 300, "CA2016_handle_talk2chefu")
    isolate_watch_npc_talk("Gi¸o sÜ", 300, "CA2016_handle_talk2churchman")                            -- ´«½ÌÊ¿
    isolate_watch_npc_talk(CA2016_NPC_LIST[1][2], CA2016_NPC_LIST[1][3], "CA2016_handle_talk2shengdanshu")    -- Ê¥µ®Ê÷
    isolate_watch_event("event_kill_npc", "CA2016_handle_on_kill_npc_normal", "", 600)
    isolate_watch_event("event_kill_npc", "CA2016_handle_on_kill_npc_normal", "", 601)
    isolate_watch_event("event_kill_npc", "CA2016_handle_on_kill_npc_normal", "", 602)
    isolate_watch_kill_npc("H¾c Phong §­êng §Ö Tö", CA2016_BF_MAPS[1], "CA2016_handle_on_kill_npc_special")
    isolate_watch_kill_npc("H¾c Phong §­êng §Ö Tö", CA2016_BF_MAPS[2], "CA2016_handle_on_kill_npc_special")
    isolate_watch_kill_npc("H¾c Phong §­êng §Ö Tö", CA2016_BF_MAPS[3], "CA2016_handle_on_kill_npc_special")
    isolate_watch_kill_npc(CA2016_BOSS_NAME, CA2016_BF_MAPS[1], "CA2016_handle_on_kill_boss")
    isolate_watch_kill_npc(CA2016_BOSS_NAME, CA2016_BF_MAPS[2], "CA2016_handle_on_kill_boss")
    isolate_watch_kill_npc(CA2016_BOSS_NAME, CA2016_BF_MAPS[3], "CA2016_handle_on_kill_boss")
    isolate_watch_npc_talk("Xa phu", 502, "CA2016_handle_talk2mapchefu")
    isolate_watch_npc_talk("Hép quµ", 502, "CA2016_handle_talk2lihe")
    isolate_watch_npc_talk("Xa phu", 8020, "CA2016_handle_talk2mapchefu")
    isolate_watch_npc_talk("Xa phu", 8021, "CA2016_handle_talk2mapchefu")
    isolate_watch_npc_talk("Xa phu", 8022, "CA2016_handle_talk2mapchefu")
    
end

function CA2016_handle_talk2lihe()
    local tbTalk = {
        "<color=green>Hép Quµ<color>: Gi¸ng sinh vui vÎ!",
        "<color=green>Hép Quµ<color>: B¹n cã nh×n thÊy ¤ng Giµ Noel kh«ng?",
        "<color=green>Hép Quµ<color>: Quµ ®Òu ë trªn c©y th«ng k×a!",
    }
    local nRand = random(1, getn(tbTalk))
    Talk(1,"",tbTalk[nRand])
end


----------------------------------------------------------------------------------------------------------------------
--Description   
--³µ·ò´«ËÍµ½»ªÉ½£º502,1597,2995
--³µ·ò´«ËÍÌìÒõ½ÌºÚ·çÌÃ: Ã¿´Î´«ËÍ¿Û³ý1¸öÌì½¾Áî,Ã¿´Î½øÈëÖ»ÄÜ´ý30·ÖÖÓ,Ê±¼äµ½Ö®ºó»á±»´«ËÍ³öÈ¥,Ã¿´Î»÷É±ºÚ·çÌÃµÄ¹ÖÎïÊ±»á»ñµÃ10µãÐÞÎª.
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
    tinsert(tbSay,format("§­a ta ®Õn chç C©y Th«ng ë Hoa S¬n/#NewWorld(%d,%d,%d)",CA2016_NPC_LIST[1][3],CA2016_NPC_LIST[1][4],CA2016_NPC_LIST[1][5]));
    if CA2016_hft_check()==1 then 
        tinsert(tbSay,"§­a ta ®Õn Thiªn ¢m Gi¸o H¾c Phong §­êng (Mçi ngµy lóc 10:00 - 23:30 ®­îc vµo)/CA2016_fly2HFTbattlefield");
    else 
        tinsert(tbSay,"§­a ta ®Õn Thiªn ¢m Gi¸o H¾c Phong §­êng (§· ®ãng)/#Talk(1,\"CA2016_handle_talk2chefu\",\"B¶n ®å Thiªn ¢m Gi¸o H¾c Phong §­êng ®· ®ãng.\")") 
    end
    tinsert(tbSay,"Tõ bá/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function CA2016_fly2HFTbattlefield()
    -- Èç¹ûÌáÇ°ÍË³öµØÍ¼£¬»¹¿ÉÒÔÎÞÏûºÄ¼ÌÐø½øÈë£¬Ö±µ½´ôÂúÒ»Ð¡Ê±
    local nTimeRemain = get_task("tskid_time_remain");
    local nTime = GetTime(); 
    local m,_,_ = GetWorldPos();
    local szMap = tostring(m);
    if nTimeRemain > 0 then
          NewWorld(CA2016_BF_ENTRY[szMap][1],CA2016_BF_ENTRY[szMap][2],CA2016_BF_ENTRY[szMap][3])
          SetLogoutRV(1);	--ÉèÖÃµÇÂ½µãÎª³ÇÊÐÖØÉúµã
          SetFightState(1)
          return
    end
    -- Õý³£½øÈë
    local nTimes = get_task("tskid_dc_hft")
    if nTimes >= 4 then Talk(1,"","Mçi ngµy cã tèi ®a 4 lÇn vµo b¶n ®å H¾c Phong §­êng.")return end;
    local nCnt = GetItemCount(CA2016_FLY_COST[1],CA2016_FLY_COST[2],CA2016_FLY_COST[3])
    if nCnt < CA2016_FLY_COST[4] then
        Talk(1,"",CHEFU_NAME.."§Õn Thiªn ¢m Gi¸o H¾c Phong §­êng cÇn"..CA2016_FLY_COST[5]..".");
        return
    end
    local szTitle   = format("%s ®Õn Thiªn ¢m Gi¸o H¾c Phong §­êng cÇn %s, vµ chØ ®­îc ë ®ã <color=red>%d phót<color>, kh¸ch quan muèn ®Õn ®ã kh«ng?",CHEFU_NAME,CA2016_FLY_COST[5],floor(CA2016_STAYTIME/60));
    local tbSay     = {};
    tinsert(tbSay,"§­îc/CA2016_fly2HFTbattlefieldConfirm");
    tinsert(tbSay,"Tõ bá/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function CA2016_fly2HFTbattlefieldConfirm()
    local m,_,_ = GetWorldPos();
    local szMap = tostring(m);
    if DelItem(CA2016_FLY_COST[1],CA2016_FLY_COST[2],CA2016_FLY_COST[3],CA2016_FLY_COST[4]) == 1 then
        local nTime = GetTime();
        NewWorld(CA2016_BF_ENTRY[szMap][1],CA2016_BF_ENTRY[szMap][2],CA2016_BF_ENTRY[szMap][3])
        SetLogoutRV(1);	--ÉèÖÃµÇÂ½µãÎª³ÇÊÐÖØÉúµã
        SetFightState(1)
        set_task("tskid_time_remain",CA2016_STAYTIME);
        set_task("tskid_dc_hft",get_task("tskid_dc_hft")+1)
    end
end


----------------------------------------------------------------------------------------------------------------------
--Description   
--ÆÕÍ¨µØÍ¼£º´ó²ÝÔ­Ò»,´ó²ÝÔ­¶þ,ÍõÆì²¿Âä 600,601,602
--ÌØÊâµØÍ¼£ºÌìÒõ½ÌºÚ·çÌÃ,´ò¹ÖÓÐ´ó¸ÅÂÊµôÂäÊ¥µ®×°°ç²ÄÁÏ,Ð¡¸ÅÂÊµôÂäÍâ×°¹Ò¼þºÍÊ¥µ®×øÆï,Î¢¸ÅÂÊµôÂäÓÀ¾ÃÍâ×°¹Ò¼þ,ÌìÒõ½ÌºÚ·çÌÃµôÂäµÄ¸÷ÖÖµÀ¾ß¶¼¿ÉÒÔ½»Ò× ÌìÒõ½ÌºÚ·çÌÃ
----------------------------------------------------------------------------------------------------------------------
function CA2016_handle_on_kill_npc_normal(data, para)
    -- Msg2Player("[Debug] killing in normal map --2016ChristmasActivity");
    for i = 1, getn(CA2016_KILLNPC_NORMAL_AWARD) do
        CA2016_give_award(i, 'normal');
    end
end
function CA2016_handle_on_kill_npc_special(data, para)
    -- Msg2Player("[Debug] killing in special map --2016ChristmasActivity");
    gf_EventGiveRandAward(CA2016_KILLNPC_SPECIAL_AWARD, gf_SumRandBase(CA2016_KILLNPC_SPECIAL_AWARD), 15, "PhÇn th­ëng H¾c Phong §­êng §Ö Tö", "Ho¹t ®éng Song §¸n 2016")
    ModifyPopur(10);
    Msg2Player("B¹n ®· nhËn ®­îc 10 ®iÓm tu vi")
end


function CA2016_handle_on_kill_boss(...)
    -- Msg2Player("[Debug] boss is killed --2016ChristmasActivity");
    gf_EventGiveRandAward(CA2016_KILLNPC_BOSS_AWARD, gf_SumRandBase(CA2016_KILLNPC_BOSS_AWARD), 30, "PhÇn th­ëng H¾c Phong §­êng Chñ", "Ho¹t ®éng Song §¸n 2016") -- Èý´ÎËæ»ú
    gf_EventGiveRandAward(CA2016_KILLNPC_BOSS_AWARD, gf_SumRandBase(CA2016_KILLNPC_BOSS_AWARD), 30, "PhÇn th­ëng H¾c Phong §­êng Chñ", "Ho¹t ®éng Song §¸n 2016")
    gf_EventGiveRandAward(CA2016_KILLNPC_BOSS_AWARD, gf_SumRandBase(CA2016_KILLNPC_BOSS_AWARD), 30, "PhÇn th­ëng H¾c Phong §­êng Chñ", "Ho¹t ®éng Song §¸n 2016")
    ModifyPopur(10);
    Msg2Player("B¹n ®· nhËn ®­îc 10 ®iÓm tu vi")
end

----------------------------------------------------------------------------------------------------------------------
--Description   
--ÓëÊ¥µ®Ê÷¶Ô»°£¬½«Ê¥µ®×°°ç¹Òµ½Ê¥µ®Ê÷ÉÏ£¬±ØÈ»»ñµÃ»ý·Ö,¸ÅÂÊ»ñµÃÊ¥µ®Íà×Ó¡£¿ÉÒÔÅúÁ¿×°°ç
--Áåîõ£¬ÀñºÐ£¬Ê÷Ö¦
----------------------------------------------------------------------------------------------------------------------
function CA2016_handle_talk2shengdanshu()
    local szTitle   = TREE_NAME.."Gi¸ng sinh vui vÎ! Mçi lo¹i vËt liÖu ®­îc trang trÝ 20 lÇn/ngµy. NÕu may m¾n sÏ nhËn ®­îc Ví Gi¸ng Sinh ®ã nha.";
    local tbSay     = {};
    tinsert(tbSay,format("Dïng Chu«ng trang trÝ (Mçi lÇn tèn %d Chu«ng Gi¸ng Sinh)/#CA2016_dress_up(%d)",CA2016_BELL[4],1));
    tinsert(tbSay,format("Dïng Hép Quµ trang trÝ (Mçi lÇn tèn %d Hép Quµ Gi¸ng Sinh)/#CA2016_dress_up(%d)",CA2016_BOX[4],2));
    tinsert(tbSay,format("Dïng Nh¸nh Th«ng trang trÝ (Mçi lÇn tèn %d Nh¸nh Th«ng)/#CA2016_dress_up(%d)",CA2016_BRANCH[4],3));
    -- tinsert(tbSay,"Debug_reflash_tskid/reflash_tskid");
    tinsert(tbSay,"Tõ bá/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function CA2016_dress_up(nType)
    local USELIM = CA2016_DC_TSKID_BYTE;
    if nType == 1 then
        local used = get_task_byte(USELIM.usebell[1],USELIM.usebell[2])
        if used >= CA2016_BELL_USE_LIM then Talk(1,"","Sè lÇn trang trÝ h«m nay ®· hÕt.") return end
        local nNum = GetItemCount(CA2016_BELL[1],CA2016_BELL[2],CA2016_BELL[3])
        if nNum < CA2016_BELL[4] then Talk(1,"",format("Dïng %s trang trÝ cÇn Ýt nhÊt %s.",TREE_NAME,CA2016_BELL[5])) return end
        
        nNum = floor(nNum/CA2016_BELL[4])
        nNum = min(CA2016_BELL_USE_LIM - used, nNum);
        AskClientForNumber("CA2016_dress_up_with_bell", 1, nNum, "Trang trÝ bao nhiªu lÇn?"); 
    elseif nType == 2 then
        local used = get_task_byte(USELIM.usebox[1],USELIM.usebox[2])
        if used >= CA2016_BOX_USE_LIM then Talk(1,"","Sè lÇn trang trÝ h«m nay ®· hÕt.") return end
        local nNum = GetItemCount(CA2016_BOX[1],CA2016_BOX[2],CA2016_BOX[3])
        if nNum < CA2016_BOX[4] then Talk(1,"",format("Dïng %s trang trÝ cÇn Ýt nhÊt %s.",TREE_NAME,CA2016_BOX[5])) return end

        nNum = floor(nNum/CA2016_BOX[4])
        nNum = min(CA2016_BOX_USE_LIM - used, nNum);
        AskClientForNumber("CA2016_dress_up_with_box", 1, nNum, "Trang trÝ bao nhiªu lÇn?"); 

    elseif nType == 3 then
        local used = get_task_byte(USELIM.usebranch[1],USELIM.usebranch[2])
        if used >= CA2016_BRANCH_USE_LIM then Talk(1,"","Sè lÇn trang trÝ h«m nay ®· hÕt.") return end
        local nNum = GetItemCount(CA2016_BRANCH[1],CA2016_BRANCH[2],CA2016_BRANCH[3])
        if nNum < CA2016_BRANCH[4] then Talk(1,"",format("Dïng %s trang trÝ cÇn Ýt nhÊt %s.",TREE_NAME,CA2016_BRANCH[5])) return end
        nNum = floor(nNum/CA2016_BRANCH[4])
        nNum = min(CA2016_BRANCH_USE_LIM - used, nNum);
        AskClientForNumber("CA2016_dress_up_with_branch", 1, nNum, "Trang trÝ bao nhiªu lÇn?"); 
    end

end

function CA2016_DressUp_Award()
    local szAward = "sdhd_sdsjl"
	if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
		return 0
	end
	if CustomAwardGiveGroup(szAward, 0) > 0 then     --¶þºÅ²ÎÊýÎªÊÇ·ñ¸øÓèÈ«²¿½±Àø,Èç¹ûÊÇÔò1
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
--³É¶¼Î÷Ñó´«½ÌÊ¿Ôö¼ÓÒ»¸ö´ú±ÒÉÌµê,ÏûºÄÊ¥µ®»ý·Ö,¶Ò»»µÀ¾ß,´ËÉÌµêµ½12ÔÂ26ÈÕ24:00Ö®ºó¹Ø±Õ
----------------------------------------------------------------------------------------------------------------------
function CA2016_handle_talk2churchman()
    local szTitle   = "<color=green>Gi¸o SÜ<color>:".."Gi¸ng sinh s¾p ®Õn, lÔ vËt do Vâ L©m Minh chuÈn bÞ ®· bÞ Thiªn ¢m Gi¸o trém ®i h¬n nöa, phiÒn c¸c vÞ ®¹i hiÖp vµo ngµy 15/12 - 24h 26/12 ®Õn §¹i Th¶o Nguyªn 1-2, bé l¹c V­¬ng Kú còng cã thÓ t×m Xa Phu di chuyÓn ®Õn Thiªn ¢m Gi¸o H¾c Phong §­êng (H¾c Phong §­êng mçi ngµy ®­îc vµo tèi ®a 4 lÇn, mçi lÇn ®­îc ë l¹i 30 phót) ®Ó t×m quµ gi¸ng sinh bÞ mÊt, ®­a chóng vÒ ®Ønh Hoa S¬n ®Ó trang trÝ C©y Th«ng. Trang trÝ xong sÏ nhËn ®­îc phÇn th­ëng, nÕu may m¾n cßn nhËn ®­îc Ví Gi¸ng Sinh. Thu thËp ®­îc sè Ví nhÊt ®Þnh råi ®Õn gÆp ta ®æi Trang Søc Gi¸ng Sinh. Ngoµi ra vµo ngµy lÔ gi¸ng sinh (24-25/12), mäi ng­êi cã thÓ ®Õn gÆp ta nhËn 1 Tói Gi¸ng Sinh vµ Chu«ng. C¸c vÞ hiÖp sÜ, chóc c¸c vÞ gi¸ng sinh vui vÎ!";
    local tbSay     = {};
    local bFlag = get_task("tskid_christmas_package")
    local bExch = get_task("tskid_exchange_package")
    local bExch2 = get_task("tskid_exchange_purplebell")
    local nCurDate = tonumber(date("%Y%m%d"))
    tinsert(tbSay,"Tèn 10 Ví Gi¸ng Sinh vµ 300 Vµng ®æi 1 Chu«ng Gi¸ng Sinh (§á) vÜnh viÔn/CA2016_exchange_bell");
    if (nCurDate==CA2016_CHRISTMASDATE1 or nCurDate == CA2016_CHRISTMASDATE2) and bFlag ~= 1 then tinsert(tbSay,"NhËn 1 Tói Gi¸ng Sinh H¹nh Phóc vµ 1 Chu«ng Gi¸ng Sinh (TÝm)/CA2016_get_Christmas_package") end;
    if bFlag == 1 and ( bExch == 0 or bExch2 == 0 )then tinsert(tbSay,"§æi Tói Gi¸ng Sinh H¹nh Phóc (vÜnh viÔn) vµ Chu«ng Gi¸ng Sinh (TÝm) (vÜnh viÔn)/CA2016_exchange_package") end;
    -- tinsert(tbSay,"reset/reset_churchman");
    -- tinsert(tbSay,"addscore/addscore_churchman");
    tinsert(tbSay,"Tõ bá/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end


function CA2016_get_Christmas_package()
    local bFlag = get_task("tskid_christmas_package")
    if nFlag == 1 then Talk(1,"CA2016_handle_talk2churchman","Mçi ng­êi chØ ®­îc nhËn mét lÇn th«i.") return end
    if gf_Judge_Room_Weight(2, 0) ~= 1 then Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ") return end
    local _,nIdx1 = gf_AddItemEx(CA2016_CHRISTMAS_PACKAGE[1][1],CA2016_CHRISTMAS_PACKAGE[1][2])
    SetItemExpireTime(nIdx1, 30*24*3600)
    local tBell =   { 
        {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 33, 1, 4}}, 
        {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 34, 1, 4}}, 
        {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 35, 1, 4}},
        {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 36, 1, 4}},
    }
    local nBody = GetBody()
    local tAward = tBell[nBody];
    local _,nIdx2 = gf_AddItemEx(tAward[2], tAward[1]);
    SetItemExpireTime(nIdx2, 30*24*3600)
    set_task("tskid_christmas_package",1)
end

function CA2016_exchange_package()
    local szTitle   = "<color=green>Gi¸o SÜ<color>:".."Gi¸ng sinh ®Õn råi, c¸c ®¹i hiÖp cã thÓ ®Õn gÆp ta nhËn quµ gi¸ng sinh.";
    local tbSay     = {};
    if get_task("tskid_exchange_purplebell") ~= 1 then tinsert(tbSay,"1 Thiªn Cang LÖnh, 1 Thiªn M«n Kim LÖnh, 300 ®iÓm Phong Hoa, ®em Chu«ng Gi¸ng Sinh (TÝm) cã thêi h¹n ®æi thµnh Chu«ng Gi¸ng Sinh (TÝm) vÜnh viÔn/#CA2016_exchange_package_confirm(1)"); end
    if get_task("tskid_exchange_package") ~= 1 then tinsert(tbSay,"2 Thiªn Cang LÖnh, 2 Thiªn M«n Kim LÖnh, 1000 ®iÓm Phong Hoa, ®em Tói Gi¸ng Sinh H¹nh Phóc cã thêi h¹n ®æi thµnh Tói Gi¸ng Sinh H¹nh Phóc vÜnh viÔn/#CA2016_exchange_package_confirm(2)"); end
    if get_task("tskid_exchange_purplebell") ~= 1 then tinsert(tbSay,"100 Ví Gi¸ng Sinh, 1000 ®iÓm Phong Hoa, ®em Chu«ng Gi¸ng Sinh (TÝm) cã thêi h¹n ®æi thµnh Chu«ng Gi¸ng Sinh (TÝm) vÜnh viÔn/#CA2016_exchange_package_confirm(3)"); end
    tinsert(tbSay,"Tõ bá/nothing");
    Say(szTitle,getn(tbSay),tbSay);
end

function CA2016_exchange_package_confirm(nType)
    local tBell =   { 
        {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 33, 1, 5}}, 
        {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 34, 1, 5}}, 
        {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 35, 1, 5}},
        {"Chu«ng Gi¸ng Sinh (TÝm)",{0,	120, 36, 1, 5}},
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
        if nBell < 1 then Talk(1,"","H·y cÊt Chu«ng Gi¸ng Sinh (TÝm) vµo hµnh trang")return end
        if nTianG < 1 then Talk(1,"","Thiªn Cang LÖnh kh«ng ®ñ") return end
        if nTianM < 1 then Talk(1,"","Thiªn M«n Kim LÖnh kh«ng ®ñ") return end
        if nFenghua < 300 then Talk(1,"","§iÓm Phong Hoa kh«ng ®ñ")return end
        if DelItem(2,95,204,1) ~= 1 then return end
        if DelItem(2,1,30370,1) ~= 1 then return end
        ornament_add_score(-300)
        Msg2Player(format("B¹n ®· mÊt 300 ®iÓm Phong Hoa, cßn %s ®iÓm",ornament_get_score()))
    elseif nType == 2 then
        if nPackage < 1 then Talk(1,"","H·y cÊt Tói Gi¸ng Sinh H¹nh Phóc vµo hµnh trang")return end
        if nTianG < 2 then Talk(1,"","Thiªn Cang LÖnh kh«ng ®ñ") return end
        if nTianM < 2 then Talk(1,"","Thiªn M«n Kim LÖnh kh«ng ®ñ") return end
        if nFenghua < 1000 then Talk(1,"","§iÓm Phong Hoa kh«ng ®ñ")return end
        if DelItem(2,95,204,2) ~= 1 then return end
        if DelItem(2,1,30370,2) ~= 1 then return end
        ornament_add_score(-1000)
        Msg2Player(format("B¹n ®· mÊt 1000 ®iÓm Phong Hoa, cßn %s ®iÓm",ornament_get_score()))
    else
        if nBell < 1 then Talk(1,"","H·y cÊt Chu«ng Gi¸ng Sinh (TÝm) vµo hµnh trang")return end
        if nWazi < 100 then  Talk(1,"","Ví Gi¸ng Sinh kh«ng ®ñ")return end
        if nFenghua < 1000 then Talk(1,"","§iÓm Phong Hoa kh«ng ®ñ")return end
        if DelItem(2,1,31181,100) ~= 1 then return end
        ornament_add_score(-1000)
        Msg2Player(format("B¹n ®· mÊt 1000 ®iÓm Phong Hoa, cßn %s ®iÓm",ornament_get_score()))
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
    local szNpcName   = "<color=green>Gi¸o SÜ<color>:"
    local bHasExchange = get_task("tskid_exchange_bell")
    if bHasExchange == 1 then
        Talk(1,"",szNpcName.."Mçi ng­êi chØ ®­îc ®æi 1 lÇn.");
        return
    end
    local nCnt = GetItemCount(2,1,31181)
    local nCash = GetCash()
    if nCnt < 10 then
        Talk(1,"",szNpcName.."Ví Gi¸ng Sinh trong hµnh trang kh«ng ®ñ 10.");
        return
    end
    if nCash < 3000000 then
        Talk(1,"",szNpcName.."TiÒn trªn ng­êi kh«ng ®ñ.");
        return
    end
    if gf_Judge_Room_Weight(1, 0) ~= 1 then Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ") return end
    DelItem(2,1,31181,10) 
    Pay(3000000)
    local tBell =   { 
        {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 25, 1, 5}}, 
        {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 26, 1, 5}}, 
        {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 27, 1, 5}},
        {"Chu«ng Gi¸ng Sinh (§á)",{0,	120, 28, 1, 5}},
    }
    local nBody = GetBody()
    local tAward = tBell[nBody];
    local _,nIdx = gf_AddItemEx(tAward[2], tAward[1]);
    set_task("tskid_exchange_bell",1)
end


function CA2016_handle_talk2mapchefu()
    local szNpcName   = "<color=green>Xa Phu<color>: T«i cã thÓ ®­a ngµi vÒ thµnh chÝnh, ngµi muèn vÒ kh«ng?"
    local tbSay     = {};
    tinsert(tbSay,"§­îc/CA2016_recall_to_city")
    tinsert(tbSay,"Tõ bá/nothing")
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
    local NPC       = CA2016_NPC_LIST[1];                               -- "Ê¥µ®Ê÷"
    local npcIdx    = CreateNpc(NPC[1],NPC[2],NPC[3],NPC[4],NPC[5]);
     
    for i = 1, getn(CA2016_NPC_POS) do
        CreateNpc("sdhd_hftdz","H¾c Phong §­êng §Ö Tö",CA2016_BF_MAPS[1],CA2016_NPC_POS[i][2],CA2016_NPC_POS[i][3])
        CreateNpc("sdhd_hftdz","H¾c Phong §­êng §Ö Tö",CA2016_BF_MAPS[2],CA2016_NPC_POS[i][2],CA2016_NPC_POS[i][3])  -- ²¹Ë¢ÐÂÔöÁ½¸öµØÍ¼µÄNPC
        CreateNpc("sdhd_hftdz","H¾c Phong §­êng §Ö Tö",CA2016_BF_MAPS[3],CA2016_NPC_POS[i][2],CA2016_NPC_POS[i][3])
    end
    for i = 1, getn(CA2016_LIHE_NPC) do
        CreateNpc("Event gi¸ng sinh VN","Hép quµ",CA2016_LIHE_NPC[i][1],CA2016_LIHE_NPC[i][2],CA2016_LIHE_NPC[i][3])
    end
    for i = 1, getn(CA2016_CHEFU_NPC) do
        CreateNpc("Xa phu","Xa phu",CA2016_CHEFU_NPC[i][1],CA2016_CHEFU_NPC[i][2],CA2016_CHEFU_NPC[i][3])
        if CA2016_CHEFU_NPC[i][1] == CA2016_BF_MAPS[1] then                                                -- ²¹Ë¢ÐÂÔöÁ½¸öµØÍ¼µÄ³µ·ò
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
--ÒÔÏÂÎªÓ¦ÓÃÄ£¿éµÄ¿ÉÑ¡ÅäÖÃ£¬Ö»Òª¶¨ÒåÁËÕâÐ©±äÁ¿ºÍº¯Êý£¬ÏµÍ³¾Í»á×Ô¶¯×¢²áºÍ»Øµ÷
--t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskGroupIdx},
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
--function on_first_login_clear() end --isolateÉÏÏßºóµÚÒ»´ÎµÇÂ¼Ê±µÄÇåÀí



-- 1 Íæ¼ÒÔÚÌØÊâµØÍ¼ÖÐÏÂÏßºóÉÏÏß£¬ÈçºÎ´¦Àí
-- 2 ÌØÊâµØÍ¼¼ÆÊ±·½Ê½£¬½øÈëµØÍ¼ÄÚ²¿¼ÆÊ±»¹ÊÇ°´Ê±¼ä¼ÆÊ±

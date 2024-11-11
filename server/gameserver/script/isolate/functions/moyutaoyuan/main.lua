Include("\\settings\\static_script\\isolate\\base\\isolate_base.lua")
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\biwudahui\\tournament\\tournament_head.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua"); --LongDaiKa: th�m v�o �� d�ng g_WCFG
----------------------------------------------------------------------------------------------------

t_isolate_base_cfg = { --����һ������������
    nPriority 			= 1,        --�������ȼ� <=0:ģ��ʧЧ >0:ģ����Ч,��ֵԽ��Խ�ȼ��� 1 default
    szEngName 			= "moyutaoyuan",
    szViewName 			= "Ma V�c ��o Nguy�n",
    nTalkBeginDate		= 0,
    nBeginDate 			= 0,
    nEndDate 			= 0,
}

TaoYuan_EnterPos = {8904,1636,3200}
TaoYuan_EnterNpc = {
    name = "Ti�u Phu",
    templete = "myty_qiaofu",
    Pos = {405,1315,2955},
}

TaoYuan_CampPlayer = "camp_player"
TaoYuan_CampMonster = "camp_enemy"
TaoYuan_DailyTimeLimit = 60 -- min
TaoYuan_EnterCost = 500000 -- 50��

TaoYuan_DeathCnt = {0,0,0,0} -- ��ͼ�Ĺ�����������
TaoYuan_Refresh_tyjzs = {0,0,0,0} -- ������רʹ���´�ˢ�µ�ʱ��,0��ʾĿǰ������
TaoYuan_Refresh_cl = 0 -- ���ڵ��´�ˢ�µ�ʱ��,0��ʾĿǰ������

TaoYuan_PlayerRevivePos = {4068,11150}
-- TaskId
TaoYuan_TaskIdAccessCode = 20171011
TaoYuan_TskUsedTime = 3489
TaoYuan_TskUseJuziShoushu = 3490
TaoYuan_TskUsedTimeWeek = 3498

TaoYuan_TskMission = {
    3491,
    3492,
    3493,
    3494,
    3495,
    3496,
    3497,    
}

TaoYuan_Boss = {
    tyjzs = {
        name = "Thi�n �m Gi�o Ma V�c S�",
        templete = "myty_tianyinjiaozhuanshi",
        nextRefresh = 0,
    },
    cl = {
        name = "Tr�n L�i",
        templete = "myty_chenlei1",
        nextRefresh = 0,
    },
}

TaoYuan_TalkNpc_ChenLei_Pos = {   -- ���ڶԻ�NPCÿ30�������ˢ�µ�λ��
    {8901,3971,11163},
}

TaoYuan_npc = {
    {
        name = "Thi�n �m T�n S� L�c ���ng",
        templete = "myty_miludetianyinjiaotu",
        pos = {8903,1550,2919},
        script = "\\script\\isolate\\functions\\moyutaoyuan\\npcs\\miludetianyinjiaotu.lua"
    },
    {
        name = "T��ng L� Huy�n S�ch",
        templete = "myty_xianglixuance",
        pos = {8901,4080,11141},
        script = "\\script\\isolate\\functions\\moyutaoyuan\\npcs\\xianglixuance.lua"
    },
    {
        name = "Vui m�ng",
        templete = "myty_gaoxing",
        pos = {8901,4041,11180},
        script = "\\script\\isolate\\functions\\moyutaoyuan\\npcs\\gaoxing.lua"
    },
    {
        name = "C�i Th�",
        templete = "myty_gaishi",
        pos = {8901,4097,11155},
        script = "\\script\\isolate\\functions\\moyutaoyuan\\npcs\\gaishi.lua"
    },
    {
        name = "Long V�n",
        templete = "myty_longyun",
        pos = {8901,4084,11173},
        script = "\\script\\isolate\\functions\\moyutaoyuan\\npcs\\longyun.lua"
    },
}

function TaoYuan_SetTask(taskId,Value)
    SetTask(taskId, Value, TaoYuan_TaskIdAccessCode)
end

function TaoYuan_SetWeeklyTask(taskId,Value)
    local nCurWeek = tonumber(date("%y%W"));
    SetTask(TaoYuan_TskUsedTimeWeek,nCurWeek)
    SetTask(taskId, Value, TaoYuan_TaskIdAccessCode)
end

function TaoYuan_GetWeeklyTask(taskId)
    local realVar = GetTask(taskId)
    local nCurWeek = tonumber(date("%y%W"));
    local nVarWeek = GetTask(TaoYuan_TskUsedTimeWeek);
    if nCurWeek ~= nVarWeek then
        return 0
    end
    return realVar
end


function TaoYuan_CreateNpc(szTemplete, szName, m, x, y, szCamp, param1, param2, param3, param4)
    if param1 == nil then
        local idx = CreateNpc(szTemplete, szName, m, x, y)
        SetCampToNpc(idx, szCamp)
    else 
        local nNum, tIdx = CreateNpc(szTemplete, szName, m, x, y, param1, param2, param3, param4)
        for i = 1, nNum do
            SetCampToNpc(tIdx[i], szCamp)
        end
    end
end

TaoYuan_OutPos = {
    {300,1760,3547},
    {200,1378,2882},
    {100,1411,2973},
}

TaoYuan_BanishPos = {
    {
        {1691,3128},	{1709,3149},	{1705,3129},	{1707,3109},	{1707,3109},	{1719,3122},	
        {1719,3122},	{1729,3096},	{1729,3096},	{1761,3068},	{1774,3053},	{1781,3075},	
        {1793,3062},	{1793,3062},	{1796,3039},	{1810,3050},	{1710,3033},	{1814,3016},	
        {1826,3024},	{1839,3021},	{1839,3000},	{1852,2988},	{1862,3000},	{1875,2992},	
        {1868,2972},	{1881,2970},	{1892,2973},	{1901,2953},	{1896,2936},	{1909,2929},	
        {1924,2937},	{1919,2918},	{1945,2913},	{1948,2890},	{1963,2896},	{1966,2872},	
        {1982,2863},	{1997,2858},	{1994,2837},	{2006,2823},	{2020,2824},	{2035,2812},	
    },
    {
        {1120,3165}, {1138,3129}, {1150,3083}, {1118,3022}, {1126,3010}, {1136,2989}, {1135,2957},
        {1181,2917}, {1217,2915}, {1255,2933}, {1284,2954}, {1325,2958}, {1338,2917}, {1399,2919},
        {1430,2930}, {1456,2955}, {1489,2951}, {1513,2914}, {1581,2957}, {1561,3016}, {1549,3033},
        {1573,3051}, {1560,3075}, {1536,3120}, {1520,3153}, {1508,3171}, {1484,3203}, {1454,3204},
        {1425,3202}, {1381,3192}, {1329,3203}, {1293,3203}, {1252,3203}, {1219,3211}, {1195,3210},
        {1157,3201}, {1133,3195}, {1170,3166}, {1193,3129}, {1210,3087}, {1176,3056}, {1219,3067},
        {1261,3080}, {1274,3055}, {1250,3006}, {1270,2977}, {1222,2986}, {1190,2979}, {1260,3081},
        {1217,3066}, {1210,3089}, {1193,3130}, {1228,3163}, {1238,3149}, {1296,3089}, {1352,3154},
        {1385,3128}, {1361,3088}, {1392,3042}, {1409,3017}, {1425,2969}, {1402,2965}, {1365,2962},
        {1403,3040}, {1455,3081}, {1410,3088}, {1372,3088}, {1384,3130}, {1350,3154}, {1395,3172},
        {1511,3169}, {1521,3143}, {1537,3118}, {1503,3098}, {1513,3081}, {1487,3079}, {1512,3021},
        {1528,2996}, {1518,2953}, {1545,2969}, 
    },
    {
        {1687,3973}, {1896,3844}, {1775,3767}, {1872,3612}, {1826,3459}, {1759,3246},
        {1741,3947}, {1816,3844}, {1870,3760}, {1848,3572}, {1839,3389}, {1870,3242},
        {1790,3951}, {1633,3617}, {1909,3756}, {1910,3560}, {1790,3384}, {1628,3897},
        {1839,3934}, {1715,3893}, {1892,3675}, {1896,3496}, {1765,3320}, {1659,3833},
        {1896,3921}, {1748,3819}, {1626,3811}, {1906,3407}, {1813,3236}, {1663,3741},
        {1629,3699}, {1711,3699}, {1754,3656}, {1706,3588}, {1671,3544}, {1627,3520},
        {1627,3412}, {1712,3512}, {1749,3565}, {1792,3598}, {1753,3658}, {1782,3523},
        {1745,3468}, {1695,3388}, {1638,3274}, {1715,3263}, 	
    },
    {
        {3972,11081}, {3981,11101}, {3985,11121}, {4000,11121}, {4004,11143}, {4016,11156},
        {4006,11183}, {4022,11209}, {4028,11230}, {4044,11239}, {4054,11225}, {4070,11215},
        {4083,11214}, {4090,11206}, {4094,11223}, {4104,11221}, {4115,11231}, {4114,11248},
        {4104,11244}, {4102,11277}, {3976,11234}, {3961,11221}, {3986,11206}, {3999,11188},
        {4144,10922}, {4130,10898}, {4095,10874}, {4090,10838}, {4114,10813}, {4145,10802},
        {4142,10846}, {4173,10825}, {4198,10856}, {4175,10890},	{4018,11027}, {4034,11058}, 
        {4034,11017}, {4055,10992}, {4072,11012}, {4121,11037}, {4040,11024},	
    }
}

TaoYuan_MapId2Info = {
    [8901] = 4,
    [8902] = 3,
    [8903] = 2,
    [8904] = 1,
}

TaoYuan_MapInfo = {
    {
        name = "H�nh Lang U Minh",
        mapid = 8904,
        enterpos = {1636,3200},
        backpos = {2039,2802},
        leavenpc = {
            name = "Ti�u Phu",
            templete = "myty_qiaofu",
            Pos = {1638, 3189},
        },
        trap = {
            {{2041,2792},{2046,2795},"\\script\\isolate\\functions\\moyutaoyuan\\Trap\\trap_forward.lua"},
        },
        guard = {
            name = "Di T�ch C�",
            templete = "myty_shouwei",
            Pos = {
                {1657,3164}, {1671,3178},
            }
        },
        monster = {
            monsterlist = {
                {
                    name = "X�ch Li",
                    templete = "myty_chichi",
                },
                {
                    name = "B� V��ng Hoa",
                    templete = "myty_bawanghua",
                }
            },
            Pos = { 
                    {1691,3128},	{1709,3149},	{1705,3129},	{1707,3109},	{1707,3109},	{1719,3122},	
                    {1719,3122},	{1729,3096},	{1729,3096},	{1761,3068},	{1774,3053},	{1781,3075},	
                    {1793,3062},	{1793,3062},	{1796,3039},	{1810,3050},	{1710,3033},	{1814,3016},	
                    {1826,3024},	{1839,3021},	{1839,3000},	{1852,2988},	{1862,3000},	{1875,2992},	
                    {1868,2972},	{1881,2970},	{1892,2973},	{1901,2953},	{1896,2936},	{1909,2929},	
                    {1924,2937},	{1919,2918},	{1945,2913},	{1948,2890},	{1963,2896},	{1966,2872},	
                    {1982,2863},	{1997,2858},	{1994,2837},	{2006,2823},	{2020,2824},	{2035,2812},	
            },
        },
    },
    {
        name = "S�ch ��o B� Hoang",
        mapid = 8903,
        enterpos = {1097,3280},
        backpos = {1127,2927},
        -- guard = {},
        guard = {
            name = "Di T�ch C�",
            templete = "myty_shouwei",
            Pos = {
                {1127,2925},{1106,3279},
            }
        },
        leavenpc = {
            name = "Ti�u Phu",
            templete = "myty_qiaofu",
            Pos = {1093, 3269},
        },
        trap = {
            {{1089,3281},{1098,3301},"\\script\\isolate\\functions\\moyutaoyuan\\Trap\\trap_back.lua"},
            {{1125,2928},{1125,2924},"\\script\\isolate\\functions\\moyutaoyuan\\Trap\\trap_forward.lua"},
        },
        bossPos = {
            {1428,3203},{1358,3020},{1136,2990},
        },
        monster = {
            monsterlist = {
                {
                    name = "X�ch Li",
                    templete = "myty_chichi",
                },
                {
                    name = "B� V��ng Hoa",
                    templete = "myty_bawanghua",
                },
                {
                    name = "V� l�m nh�n s� t�m kho b�u",
                    templete = "myty_xunbaodewulinshi",
                },
            },
            Pos = {
                {1120,3165}, {1138,3129}, {1150,3083}, {1118,3022}, {1126,3010}, {1136,2989}, {1135,2957},
                {1181,2917}, {1217,2915}, {1255,2933}, {1284,2954}, {1325,2958}, {1338,2917}, {1399,2919},
                {1430,2930}, {1456,2955}, {1489,2951}, {1513,2914}, {1581,2957}, {1561,3016}, {1549,3033},
                {1573,3051}, {1560,3075}, {1536,3120}, {1520,3153}, {1508,3171}, {1484,3203}, {1454,3204},
                {1425,3202}, {1381,3192}, {1329,3203}, {1293,3203}, {1252,3203}, {1219,3211}, {1195,3210},
                {1157,3201}, {1133,3195}, {1170,3166}, {1193,3129}, {1210,3087}, {1176,3056}, {1219,3067},
                {1261,3080}, {1274,3055}, {1250,3006}, {1270,2977}, {1222,2986}, {1190,2979}, {1260,3081},
                {1217,3066}, {1210,3089}, {1193,3130}, {1228,3163}, {1238,3149}, {1296,3089}, {1352,3154},
                {1385,3128}, {1361,3088}, {1392,3042}, {1409,3017}, {1425,2969}, {1402,2965}, {1365,2962},
                {1403,3040}, {1455,3081}, {1410,3088}, {1372,3088}, {1384,3130}, {1350,3154}, {1395,3172},
                {1511,3169}, {1521,3143}, {1537,3118}, {1503,3098}, {1513,3081}, {1487,3079}, {1512,3021},
                {1528,2996}, {1518,2953}, {1545,2969}, 
            }
        },
    },
    {
        name = "M� C�c",
        mapid = 8902,
        guard = {
            name = "Di T�ch C�",
            templete = "myty_shouwei",
            Pos = {
                {1632,3977},{1904,3249},
            }
        },
        enterpos = {1623,3988},
        backpos = {1909,3245},
        leavenpc = {
            name = "Ti�u Phu",
            templete = "myty_qiaofu",
            Pos = {1893, 3945},
        },
        trap = {
            {{1615,3996},{1627,3996},"\\script\\isolate\\functions\\moyutaoyuan\\Trap\\trap_back.lua"},
            {{1904,3239},{1913,3239},"\\script\\isolate\\functions\\moyutaoyuan\\Trap\\trap_forward.lua"},
        },
        teleport_trap = {
            {1733,3772},{1894,3988},{1788,3533},{1781,3463},{1885,3365},
        },
        teleport_pos = {
            {1774,3855}, {1656,3468}, {1845,3675}, {1709,3244}, {1817,3309}, {1868,3757}, {1665,3679},
        },
        monster = {
            monsterlist = {
                {
                    name = "Nhu�n H�",
                    templete = "myty_runxia",
                },
                {
                    name = "Vi�m Th��ng",
                    templete = "myty_yanshang",
                },
                {
                    name = "Kh�c Tr�c",
                    templete = "myty_quzhi",
                },
                {
                    name = "T�ng c�ch",
                    templete = "myty_congge",
                },
                {
                    name = "Gi� S�c",
                    templete = "myty_jiase",
                },
                {
                    name = "X�ch Li",
                    templete = "myty_chichi",
                },
                {
                    name = "B� V��ng Hoa",
                    templete = "myty_bawanghua",
                },
                {
                    name = "V� l�m nh�n s� t�m kho b�u",
                    templete = "myty_xunbaodewulinshi",
                },
            },
            Pos_max3  = {
                {1684,3308}, {1721,3344}, {1752,3412}, {1791,3465}, {1826,3547}, {1863,3489},
                {1875,3389}, {1810,3650}, {1762,3705}, {1733,3775}, {1680,3880}, {1660,3927},
            },
            Pos_max10 = {
                {1687,3973}, {1896,3844}, {1775,3767}, {1872,3612}, {1826,3459}, {1759,3246},
                {1741,3947}, {1816,3844}, {1870,3760}, {1848,3572}, {1839,3389}, {1870,3242},
                {1790,3951}, {1633,3617}, {1909,3756}, {1910,3560}, {1790,3384}, {1628,3897},
                {1839,3934}, {1715,3893}, {1892,3675}, {1896,3496}, {1765,3320}, {1659,3833},
                {1896,3921}, {1748,3819}, {1626,3811}, {1906,3407}, {1813,3236}, {1663,3741},
                {1629,3699}, {1711,3699}, {1754,3656}, {1706,3588}, {1671,3544}, {1627,3520},
                {1627,3412}, {1712,3512}, {1749,3565}, {1792,3598}, {1753,3658}, {1782,3523},
                {1745,3468}, {1695,3388}, {1638,3274}, {1715,3263}, 	
            },
        },
    },
    {
        name = "Th� Ngo�i ��o Vi�n",
        mapid = 8901,
        guard = {
            name = "Di T�ch C�",
            templete = "myty_shouwei",
            Pos = {
                {4055,11135},{4034,11138},{4034,11138},
            }
        },
        leavenpc = {
            name = "Ti�u Phu",
            templete = "myty_qiaofu",
            Pos = {4043,11166},
        },
        enterpos = {3968,11221},
        trap = {
            {{3958,11219},{3968,11232},"\\script\\isolate\\functions\\moyutaoyuan\\Trap\\trap_back.lua"},

            {{4034,11135},{4046,11135},"\\script\\isolate\\functions\\moyutaoyuan\\Trap\\trap_peace.lua"},

            {{4030,11141},{4041,11141},"\\script\\isolate\\functions\\moyutaoyuan\\Trap\\trap_battle.lua"},
        },

        monster = {
            monsterlist = {
                {
                    name = "Nhu�n H�",
                    templete = "myty_runxia",
                },
                {
                    name = "Vi�m Th��ng",
                    templete = "myty_yanshang",
                },
                {
                    name = "Kh�c Tr�c",
                    templete = "myty_quzhi",
                },
                {
                    name = "T�ng c�ch",
                    templete = "myty_congge",
                },
                {
                    name = "Gi� S�c",
                    templete = "myty_jiase",
                },
            },
            Pos_10 = {
                { {4000,11253}, {4024,11289}, {4054,11288}, {3987,11312}, {3965,11287}, },
                { {4018,11027}, {4034,11058}, {4034,11017}, {4055,10992}, {4072,11012}, {4121,11037}, {4040,11024},},
                { {3991,10990}, {3979,10974}, {4006,10957}, {4035,10941}, {4043,10911}, {4063,10926}, },
                { {4040,11018}, {4180,10992}, {4177,11049}, {4161,11088}, {4204,11072}, {4200,11102}, },
                { {4253,11053}, {4288,11026}, {4273,10997}, {4242,11007}, {4215,10942}, {4198,10980}, },
            },
            Pos_random5 = {
                {4144,10922}, {4130,10898}, {4095,10874}, {4090,10838}, {4114,10813}, {4145,10802},
                {4142,10846}, {4173,10825}, {4198,10856}, {4175,10890},	{4138,10811}, {4114,10845}, 
                {4123,10865}, {4150,10877}, {4160,10842},				
            },
            Pos_random1 = {
                {3972,11081}, {3981,11101}, {3985,11121}, {4000,11121}, {4004,11143}, {4016,11156},
                {4006,11183}, {4022,11209}, {4028,11230}, {4044,11239}, {4054,11225}, {4070,11215},
                {4083,11214}, {4090,11206}, {4094,11223}, {4104,11221}, {4115,11231}, {4114,11248},
                {4104,11244}, {4102,11277}, {3976,11234}, {3961,11221}, {3986,11206}, {3999,11188},
            },
        },
    },
}

t_isolate_task_list={ --ģ���õ��������������id={szTaskName,nTaskId, nAcessCode = 0},
--    {id={"id_self_liveness", TongExt_TSKID_SELF_LIVENESS, TSKACCESSCODE_LIVENESS} }, 
--    {id={"id_devotion_limit", TongExt_TSKID_DEVOTION_LIMIT, 0}, clear = "weekly" }, 
--    {id={"id_liveness_per_week", TongExt_TSKID_LIVENESSPERWEEK, 0}, clear = "weekly" }, 
--    {id={"id_rob_limit", TongExt_TSKID_ROB_LIMIT, 0}, clear = "daily" }, 
--    {id={"id_handin_mat_limit_week1", 3481, 0}, clear = "weekly" }, 
}

function TaoYuan_player_min_tick()
    local m,_,_ = GetWorldPos()
    if  m ~= TaoYuan_MapInfo[1].mapid and 
        m ~= TaoYuan_MapInfo[2].mapid and
        m ~= TaoYuan_MapInfo[3].mapid and
        m ~= TaoYuan_MapInfo[4].mapid then
        return
    end
    TaoYuan_SetWeeklyTask(TaoYuan_TskUsedTime, TaoYuan_GetWeeklyTask(TaoYuan_TskUsedTime) + 1)

    local weekDay = tonumber(date("%w"))
    if weekDay == 0 then weekDay = 7 end
    local resTime = TaoYuan_DailyTimeLimit * weekDay - TaoYuan_GetWeeklyTask(TaoYuan_TskUsedTime)
    -- Msg2Player(format("[debug]ʣ��%d����",resTime))
    if resTime <= 0  then
        TaoYuan_LeaveMap()
        return
    end
    if mod(resTime, 10) == 0 or resTime < 10 then
        Msg2Player(format("Th�i gian c� th� � l�i Ma V�c c�n %d ph�t",resTime))
    end
end

function TaoYuan_server_1min_tick()
    if g_WCFG_MAVUC:IsDateOpen(-1) ~= WEnv.TRUE then
        return WEnv.RETCODE_NOTOPEN;
    end

    local curMin = tonumber(date("%M"))
    local curHour = tonumber(date("%H"))
    if mod(curHour,2) == 1 and curMin < 50 then
        return
    end
    if mod(curHour,2) == 0 and curMin > 20 then
        return
    end

    if curMin == 50 then -- �����㻹��10��
        Msg2SubWorld(format("Ti�u Phu xu�t hi�n � Ch�n N�i V� L�ng, �ng b�o tin l�i v�o [Ma V�c] %d ph�t sau s� m�.",10))
    elseif curMin == 55 then -- �����㻹��5��
        Msg2SubWorld(format("Ti�u Phu xu�t hi�n � Ch�n N�i V� L�ng, �ng b�o tin l�i v�o [Ma V�c] %d ph�t sau s� m�.",5))
    elseif curMin == 59 then -- �����㻹��5��
        Msg2SubWorld(format("Ti�u Phu xu�t hi�n � Ch�n N�i V� L�ng, �ng b�o tin l�i v�o [Ma V�c] %d ph�t sau s� m�.",1))
    elseif curMin == 0 then -- ����
        Msg2SubWorld("L�i v�o [Ma V�c] �� xu�t hi�n, hi�p kh�ch mu�n t�m kho b�u mau ��n Ch�n N�i V� L�ng t�m Ti�u Phu.")
    elseif curMin == 10 then -- ����֮��10����
        Msg2SubWorld(format("L�i v�o [Ma V�c] %d ph�t sau s� ��ng, h�y mau t�m Ti�u Phu �� v�o.",10))
    elseif curMin == 20 then 
        Msg2SubWorld("L�i v�o [Ma V�c] �� bi�n m�t.")
    end
    
end

function TaoYuan_server_5min_tick()
    if TaoYuan_Refresh_tyjzs[2] ~= 0 and GetTime() > TaoYuan_Refresh_tyjzs[2] then-- ��2��ͼˢ������ħ��רʹ
        TaoYuan_CreateLittleBoss(2, TaoYuan_MapInfo[2].bossPos)
    end
    -- if TaoYuan_Refresh_tyjzs[3] ~= 0 and GetTime() > TaoYuan_Refresh_tyjzs[3] then-- ��3��ͼˢ������ħ��רʹ
    --     TaoYuan_CreateLittleBoss(3, TaoYuan_MapInfo[3].monster.Pos_max10)
    -- end
    -- if TaoYuan_Refresh_tyjzs[4] ~= 0 and GetTime() > TaoYuan_Refresh_tyjzs[4] then-- ��3��ͼˢ������ħ��רʹ
    --     TaoYuan_CreateLittleBoss(4, TaoYuan_MapInfo[4].monster.Pos_random1)
    -- end
    if TaoYuan_Refresh_cl ~= 0 and GetTime() > TaoYuan_Refresh_cl then
        TaoYuan_CreateBigBoss()
        Msg2SubWorld("Tr�n L�i: B�ng h�u V� L�m Minh h�y ��n t� th� v�i ta n�o!")
    end
end

function TaoYuan_RefreshTalkNpcChenlei()
    local posId = random(1,getn(TaoYuan_TalkNpc_ChenLei_Pos))
    local pos = TaoYuan_TalkNpc_ChenLei_Pos[posId]
    local idx = CreateNpc("myty_chenlei2","Tr�n L�i",pos[1],pos[2],pos[3])
    SetNpcScript(idx,"\\script\\isolate\\functions\\moyutaoyuan\\npcs\\chenlei.lua")
    SetNpcLifeTime(idx, 30*60)
end
function TaoYuan_OnPlayerDeath()
    local m,x,y = GetWorldPos()
    if m == TaoYuan_MapInfo[4].mapid then
        SetPos(TaoYuan_PlayerRevivePos[1],TaoYuan_PlayerRevivePos[2])
        RevivePlayer(0)
        Msg2Player("Ng��i b� tr�ng th��ng �� ���c ��a v�o khu an to�n")
        return
    end
    if m == TaoYuan_MapInfo[1].mapid or m == TaoYuan_MapInfo[2].mapid or m == TaoYuan_MapInfo[3].mapid then
        NewWorld(8904,1643,3193)
        RevivePlayer(0)
        Msg2Player("Ng��i b� tr�ng th��ng �� ���c ��a v� l�i v�o Ma V�c")
        return
    end
end

function TaoYuan_GTaskFinished(taskId,param)
    if taskId == 569 or taskId == 570 then
        AddRuntimeStat(63,taskId-568,0,1)
        return
    end
    AddRuntimeStat(65,taskId-570,0,1)
end
function TaoYuan_GTaskJumped(taskId,param)
    AddRuntimeStat(64,taskId-568,0,1)
end

function TaoYuan_GTaskFinished_569(param) TaoYuan_GTaskFinished(569,param) end
function TaoYuan_GTaskFinished_570(param) TaoYuan_GTaskFinished(570,param) end
function TaoYuan_GTaskFinished_571(param) TaoYuan_GTaskFinished(571,param) end
function TaoYuan_GTaskFinished_572(param) TaoYuan_GTaskFinished(572,param) end
function TaoYuan_GTaskFinished_573(param) TaoYuan_GTaskFinished(573,param) end
function TaoYuan_GTaskFinished_574(param) TaoYuan_GTaskFinished(574,param) end
function TaoYuan_GTaskFinished_575(param) TaoYuan_GTaskFinished(575,param) end



function TaoYuan_GTaskJumped_569(param) TaoYuan_GTaskJumped(569, param) end
function TaoYuan_GTaskJumped_570(param) TaoYuan_GTaskJumped(570, param) end

t_isolate_user_batch_watch_list = {
    {"event_player_tick_minute",{1}, TaoYuan_player_min_tick, { }},
    {"event_server_tick_minute",{1}, TaoYuan_server_1min_tick,{ }},
    {"event_server_tick_minute",{5}, TaoYuan_server_5min_tick,{ }},
    {"event_server_tick_minute",{30}, TaoYuan_RefreshTalkNpcChenlei,{ }},
    {"event_player_death",      {-1}, 	 TaoYuan_OnPlayerDeath,{ }},

    {"event_finish_gtask",{569},TaoYuan_GTaskFinished_569,{}},
    {"event_finish_gtask",{570},TaoYuan_GTaskFinished_570,{}},
    {"event_finish_gtask",{571},TaoYuan_GTaskFinished_571,{}},
    {"event_finish_gtask",{572},TaoYuan_GTaskFinished_572,{}},
    {"event_finish_gtask",{573},TaoYuan_GTaskFinished_573,{}},
    {"event_finish_gtask",{574},TaoYuan_GTaskFinished_574,{}},
    {"event_finish_gtask",{575},TaoYuan_GTaskFinished_575,{}},

    {"event_jump_gtask",{569},TaoYuan_GTaskJumped_569,{}},
    {"event_jump_gtask",{570},TaoYuan_GTaskJumped_570,{}},
    
}



function on_add_watches()
    isolate_watch_item_talk(2, 1, 31246, "TaoYuan_UseJuzishoushu")--ʹ����������
    isolate_watch_item_talk(2, 1, 31245, "TaoYuan_UseHaoxiaBag")--ʹ�ú������ϰ�
    isolate_watch_event("event_kill_npc", "TaoYuan_on_kill_npc", "", TaoYuan_MapInfo[2].mapid)
    isolate_watch_event("event_kill_npc", "TaoYuan_on_kill_npc", "", TaoYuan_MapInfo[3].mapid)
    isolate_watch_event("event_kill_npc", "TaoYuan_on_kill_npc", "", TaoYuan_MapInfo[4].mapid)
    isolate_watch_npc_talk(TaoYuan_EnterNpc.name, TaoYuan_EnterNpc.Pos[1], "TaoYuan_EnterMapTalk");
    for i = 1, getn(TaoYuan_MapInfo) do
        local Info = TaoYuan_MapInfo[i]
        isolate_watch_event("event_player_enter_map", "TaoYuan_OnEnterMap", Info.mapid)
        if Info.leavenpc ~= nil then
            isolate_watch_npc_talk(Info.leavenpc.name, Info.mapid, "TaoYuan_LeaveMapTalk");
        end
    end
end

function TaoYuan_CreateLittleBoss(Idx, tPos)
    local PosId = random(1, getn(tPos))
    TaoYuan_CreateNpc(
        TaoYuan_Boss.tyjzs.templete,
        TaoYuan_Boss.tyjzs.name,
        TaoYuan_MapInfo[Idx].mapid,
        tPos[PosId][1],
        tPos[PosId][2],
        TaoYuan_CampMonster
    )
    TaoYuan_Refresh_tyjzs[Idx] = 0
    Msg2SubWorld(format(" %s �� xu�t hi�n",TaoYuan_Boss.tyjzs.name))
end

function TaoYuan_CreateBigBoss()
    TaoYuan_CreateNpc(
        TaoYuan_Boss.cl.templete,
        TaoYuan_Boss.cl.name,
        TaoYuan_MapInfo[4].mapid,
        4188,10799,
        TaoYuan_CampMonster
    )
    TaoYuan_Refresh_cl = 0
end

function TaoYuan_CreateBossWhenSvrStart()
    TaoYuan_CreateLittleBoss(2, TaoYuan_MapInfo[2].bossPos)
    -- TaoYuan_CreateLittleBoss(3, TaoYuan_MapInfo[3].monster.Pos_max10)
    -- TaoYuan_CreateLittleBoss(4, TaoYuan_MapInfo[4].monster.Pos_random1)
    TaoYuan_CreateBigBoss()
end

function TaoYuan_MainKillTask(Param) -- ���߻�ɱ���˵�������ͽ
    if  Param ~= "Thi�n �m Gi�o �� tr�ng th��ng" then
        return
    end
    AddRuntimeStat(62,2,0,1)
    if GetTeamSize() == 0 then  -- δ���
        if BigGetItemCount(2,1,31243) == 0 then -- ��û���
            if tGtTask:check_cur_task(567) == 1 then
                if gf_JudgeRoomWeight(1, 100, "") == 1 then
                    AddItem(2,1,31243,1);
                end
            end
        end
        return
    end
    local oldPlayerIdx = PlayerIndex;
	for i = 1, GetTeamSize() do
        PlayerIndex = GetTeamMember(i);
		if BigGetItemCount(2,1,31243) == 0 then -- ��û���
            if tGtTask:check_cur_task(567) == 1 then
                if gf_JudgeRoomWeight(1, 100, "") == 1 then
                    AddItem(2,1,31243,1);
                end
            end
        end
	end
	PlayerIndex = oldPlayerIdx;
end

function TaoYuan_on_kill_npc(tParam)
    local m,x,y = GetWorldPos()
    local nMapidx = TaoYuan_MapId2Info[m]
    local tdyingBossPos = {
        {8902,1664,3725},
        {8902,1870,3618},
        {8902,1637,3278},
    }
    if nMapidx == 1 then -- ��һ��ͼ���ü���
        return
    end

    if  tParam[1] == TaoYuan_Boss.tyjzs.name then  -- ɱ����СBOSS
        TaoYuan_Refresh_tyjzs[nMapidx] = GetTime() + 3600*3 -- 3Сʱ��ˢ��
        AddRuntimeStat(62,1,0,1)
    end
    if  tParam[1] == TaoYuan_Boss.cl.name then
        TaoYuan_Refresh_cl = GetTime() + 3600*6
        AddRuntimeStat(62,3,0,1)

        if tGtTask:check_cur_task(583)==1 then -- ���������ɱBOSS�������е�࣬����
            if GetTeamSize() > 0 then
                local oldPlayerIndex = PlayerIndex
                for i = 1, GetTeamSize() do
                    PlayerIndex = GetTeamMember(i)
                    if GetFreeItemRoom() < 1 then
                        Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
                    else
                        AddItem(2,1,31259,1,4)
                    end
                end
                PlayerIndex = oldPlayerIndex
            else
                if GetFreeItemRoom() < 1 then
                    Talk(1,"","Kh�ng gian h�nh trang kh�ng ��")
                else
                    AddItem(2,1,31259,1,4)
                end
            end
        end

    end
    TaoYuan_MainKillTask(tParam[1]) -- ���߻�ɱ���˵�������ͽ

    if TaoYuan_DeathCnt[nMapidx] < 500 then
        TaoYuan_DeathCnt[nMapidx] = TaoYuan_DeathCnt[nMapidx] + 1
    else
        TaoYuan_DeathCnt[nMapidx] = 0
        if nMapidx == 3 then        -- �������˵�������ͽֻ��map3��;Ͽ��ˢ��
            local pos = random(1,getn(tdyingBossPos))
            TaoYuan_CreateNpc(
                "myty_zhongshangdetianyinjiaotu",
                "Thi�n �m Gi�o �� tr�ng th��ng",
                tdyingBossPos[pos][1],
                tdyingBossPos[pos][2],
                tdyingBossPos[pos][3],
                TaoYuan_CampMonster
            )
            Msg2Map(8901,"C� ng��i trong M� �� S�n C�c ph�t hi�n d�u v�t c�a Thi�n �m Gi�o �� tr�ng th��ng!")
            Msg2Map(8902,"C� ng��i trong M� �� S�n C�c ph�t hi�n d�u v�t c�a Thi�n �m Gi�o �� tr�ng th��ng!")
            Msg2Map(8903,"C� ng��i trong M� �� S�n C�c ph�t hi�n d�u v�t c�a Thi�n �m Gi�o �� tr�ng th��ng!")
            Msg2Map(8904,"C� ng��i trong M� �� S�n C�c ph�t hi�n d�u v�t c�a Thi�n �m Gi�o �� tr�ng th��ng!")
        end
    end
end

function TaoYuan_OnEnterMap(tParam)
    local mapId = tParam[1]
    if mapId == TaoYuan_MapInfo[1].mapid then
        SetFightState(1)
    end
    CastState("state_invincibility",100 ,18*5)
    SetCampToPlayer(TaoYuan_CampPlayer)
    LeaveTeam()
end

function TaoYuan_LeaveMapTalk()
    local szNpcName = GetTargetNpcName();
    local szTitle = format("<color=green>%s<color>: Ta kh�ng mu�n �i n�a, c� mu�n tr� v� kh�ng?", szNpcName)
    local tbSay = {
        "���c, ch�ng ta v� th�i/TaoYuan_LeaveMap",
        "Ta c�n mu�n �i v�i v�ng/nothing",
    }
    Say(szTitle,getn(tbSay),tbSay)
end

function TaoYuan_LeaveMap()
    local randPos = random(1,getn(TaoYuan_OutPos))
    local tPos = TaoYuan_OutPos[randPos]
    SetFightState(0)
    NewWorld(tPos[1],tPos[2],tPos[3])
    LeaveTeam()
end

function TaoYuan_CreateLeaveNpc(nMapidx)
    local Info = TaoYuan_MapInfo[nMapidx]
    if Info.leavenpc ~= nil then
        local npcidx = TaoYuan_CreateNpc(
            Info.leavenpc.templete,
            Info.leavenpc.name,
            Info.mapid,
            Info.leavenpc.Pos[1],
            Info.leavenpc.Pos[2],
            TaoYuan_CampPlayer
            )
    end
end

-- ��tMonsterList�����ѡ��mMin-nMax������ˢ��
function TaoYuan_CreateRandomMonster(tMonstList, m, x, y, nMin, nMax)
    if tMonstList == nil then
        return
    end
    local cnt = random(nMin, nMax)
    for j = 1, cnt do 
        local monsterId = random(1,getn(tMonstList))
        local monster = tMonstList[monsterId]
        TaoYuan_CreateNpc(
            monster.templete,
            monster.name,
            m,
            x,
            y,
            TaoYuan_CampMonster
        )
    end
end

function TaoYuan_CreateMonster1()
    local monster = TaoYuan_MapInfo[1].monster
    local mapid = TaoYuan_MapInfo[1].mapid
    if monster == nil then
        return 
    end
    for i = 1, getn(monster.Pos) do 
        TaoYuan_CreateRandomMonster(
            monster.monsterlist,
            mapid,
            monster.Pos[i][1],
            monster.Pos[i][2],
            1,
            1
        )
    end
end

function TaoYuan_CreateMonster2()
    local monster = TaoYuan_MapInfo[2].monster
    local mapid = TaoYuan_MapInfo[2].mapid
    if monster == nil then
        return 
    end
    for i = 1, getn(monster.Pos) do 
        TaoYuan_CreateRandomMonster(
            monster.monsterlist,
            mapid,
            monster.Pos[i][1],
            monster.Pos[i][2],
            1,
            2
        )
    end
end

function TaoYuan_CreateMonster3()
    local monster = TaoYuan_MapInfo[3].monster
    local mapId = TaoYuan_MapInfo[3].mapid
    if monster == nil then
        return
    end
    for i = 1, getn(monster.Pos_max3) do 
        TaoYuan_CreateRandomMonster(
            monster.monsterlist,
            mapId,
            monster.Pos_max3[i][1],
            monster.Pos_max3[i][2],
            1,
            2
        )
    end
    for i = 1, getn(monster.Pos_max10) do 
        TaoYuan_CreateRandomMonster(
            monster.monsterlist,
            mapId,
            monster.Pos_max10[i][1],
            monster.Pos_max10[i][2],
            2,
            5
        )
    end
end

function TaoYuan_CreateMonster4()
    local monster = TaoYuan_MapInfo[4].monster
    local mapId = TaoYuan_MapInfo[4].mapid
    if monster == nil then
        return
    end
    for i = 1, getn(monster.Pos_10) do 
        for j = 1, getn(monster.Pos_10[i]) do
            TaoYuan_CreateNpc(
                monster.monsterlist[i].templete,
                monster.monsterlist[i].name,
                mapId,
                monster.Pos_10[i][j][1],
                monster.Pos_10[i][j][2],
                TaoYuan_CampMonster,
                -1,
                5,
                1,
                5
            )
        end
    end
    for i = 1, getn(monster.Pos_random5) do
        TaoYuan_CreateRandomMonster(
            monster.monsterlist,
            mapId,
            monster.Pos_random5[i][1],
            monster.Pos_random5[i][2],
            2,
            3,
            TaoYuan_CampMonster
        )
    end

    for i = 1, getn(monster.Pos_random1) do
        TaoYuan_CreateRandomMonster(
            monster.monsterlist,
            mapId,
            monster.Pos_random1[i][1],
            monster.Pos_random1[i][2],
            1,
            1,
            TaoYuan_CampMonster
        )
    end
end

function TaoYuan_CreateGuard(nMapidx)
    local guard = TaoYuan_MapInfo[nMapidx].guard
    local mapId = TaoYuan_MapInfo[nMapidx].mapid
    if guard == nil then
        return
    end
    for i = 1, getn(guard.Pos) do
        local npcIdx = TaoYuan_CreateNpc(
            guard.templete,
            guard.name,
            mapId,
            guard.Pos[i][1],
            guard.Pos[i][2],
            TaoYuan_CampPlayer
        )
    end
end

function TaoYuan_AddTraps(nMapidx)
    local tPos = TaoYuan_MapInfo[nMapidx].trap
    if tPos == nil then
        return
    end
    local mapID = TaoYuan_MapInfo[nMapidx].mapid
    for _, t in tPos do
        local tPoint = gf_Line(t[1][1], t[1][2], t[2][1], t[2][2]);
        for i = 1, getn(tPoint) do
            AddMapTrap(mapID, tPoint[i][1]*32, tPoint[i][2]*32, t[3]);
        end
    end
end

function TaoYuan_AddSquareTrap(mapID, nX, nY, nHalfEdge, szScript)
    local lines = {
        {{nX-nHalfEdge, nY-nHalfEdge}, {nX+nHalfEdge, nY-nHalfEdge}},
        {{nX-nHalfEdge, nY-nHalfEdge}, {nX-nHalfEdge, nY+nHalfEdge}},
        {{nX+nHalfEdge, nY+nHalfEdge}, {nX+nHalfEdge, nY-nHalfEdge}},
        {{nX+nHalfEdge, nY+nHalfEdge}, {nX-nHalfEdge, nY+nHalfEdge}},
    }
    for _, t in lines do
        local tPoint = gf_Line(t[1][1], t[1][2], t[2][1], t[2][2]);
        for i = 1, getn(tPoint) do
            AddMapTrap(mapID, tPoint[i][1]*32, tPoint[i][2]*32, szScript);
        end
    end
end

function TaoYuan_CreateTeleportTrap()
    local trap = TaoYuan_MapInfo[3].teleport_trap
    for i = 1, getn(trap) do
        local pos = trap[i]
        TaoYuan_AddSquareTrap(TaoYuan_MapInfo[3].mapid, pos[1], pos[2], 10, "\\script\\isolate\\functions\\moyutaoyuan\\Trap\\trap_teleport.lua")
    end
    
    -- ��;Ͽ�ȵĶ��ش��͵�
    TaoYuan_AddSquareTrap(TaoYuan_MapInfo[3].mapid, 1887,3498, 10, "\\script\\isolate\\functions\\moyutaoyuan\\Trap\\trap_unique_teleport.lua")
end

function TaoYuan_CreateEnterNpc()
    local pos = TaoYuan_EnterNpc.Pos
    local name = TaoYuan_EnterNpc.name
    local temp = TaoYuan_EnterNpc.templete
    CreateNpc(temp, name, pos[1], pos[2], pos[3])
end

function TaoYuan_EnterMapTalk()
    if g_WCFG_MAVUC:IsDateOpen(1) ~= WEnv.TRUE then
        return WEnv.RETCODE_NOTOPEN;
    end

    local szName = format("<color=green>%s<color>:",TaoYuan_EnterNpc.name)
    local nHour = tonumber(date("%H"))
    local nMin  = tonumber(date("%M"))
    if mod(nHour, 2) == 1 or nMin > 20 then-- ����ʱ��
        Talk(1,"",szName.."Ng��i ��n mu�n r�i, l�i v�o Ma V�c �� ��ng.")
        return
    end

    local nLv = GetLevel();
    local nTrans = gf_GetTransCount();
    local level = nTrans*100 + nLv;
    if level < 690 then
        Talk(1,"",szName.."Trong Ma V�c r�t nguy hi�m, ch� c� hi�p s� 6 chuy�n 90 c�p tr� l�n c� th� v�o ���c")
        return
    end


    local usedTime = TaoYuan_GetWeeklyTask(TaoYuan_TskUsedTime)
    local weekDay = tonumber(date("%w"))
    if weekDay == 0 then weekDay = 7 end
    local resTime = TaoYuan_DailyTimeLimit * weekDay - usedTime
    local szTitle = szName.."Mu�n ��n Ma V�c, h�y ��a ta 50 V�ng ta s� d�n ���ng. Ma V�c c� b� tr�n, ��o c� chuy�n ti�p nh� Th�n H�nh B�o �i�n s� kh�ng d�ng ���c.."
    local szTitle = format("%s (C�n c� th� � khu v�c n�y <color=red>%d<color> ph�t )",szTitle, resTime)
    local tbSay = {}
    if resTime > 0 then tinsert(tbSay, "S� g�, c� x�ng v�o (Chuy�n ti�p v�o khu v�c)/TaoYuan_EnterMap") end
    tinsert(tbSay, "B� �i, ta kh�ng �i n�a/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function TaoYuan_EnterMap()
    if (GetCash() >= TaoYuan_EnterCost) then
        Pay(TaoYuan_EnterCost)
    else
        Talk(1,"","V�n mang theo tr�n ng��i kh�ng ��")
        return
    end
    local nTrans = gf_GetTransCount();
    AddRuntimeStat(61, nTrans - 5, 0, 1); -- Trans-5 == 1 ��ʾ��6ת��ʼ
    NewWorld(TaoYuan_EnterPos[1],TaoYuan_EnterPos[2],TaoYuan_EnterPos[3])
end

function TaoYuan_UseHaoxiaBag(nIndex)
    local g,d,p = GetItemInfoByIndex(nIndex)
    local szAward = "haoxiacailiaobao"
    if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
        return 0
    end
    if DelItemByIndex(nIndex, 1) == 1 then
        if CustomAwardGiveGroup(szAward, 0) > 0 then   --���Ų���Ϊ�Ƿ����ȫ������
            return 1
        else
            AddItem(g,d,p, 1,4)
        end
    end
end

function TaoYuan_UseJuzishoushu(nItem)
    if GetTask(TaoYuan_TskUseJuziShoushu) == 0 then
        if DelItemByIndex(nItem, 1) ~= 1 then
            Msg2Player("S� d�ng th�t b�i")
            return
        end
        TaoYuan_SetWeeklyTask(TaoYuan_TskUsedTime, TaoYuan_GetWeeklyTask(TaoYuan_TskUsedTime) - 60)
        
        local usedTime = TaoYuan_GetWeeklyTask(TaoYuan_TskUsedTime)
        local weekDay = tonumber(date("%w"))
        if weekDay == 0 then weekDay = 7 end
        local resTime = TaoYuan_DailyTimeLimit * weekDay - usedTime


        Talk(1,"",format("S� d�ng th�nh c�ng, hi�n t�i ng��i c� th� � l�i Ma V�c ��o Vi�n %d ph�t.",resTime))
        TaoYuan_SetTask(TaoYuan_TskUseJuziShoushu, 1)
    else 
        Talk(1,"","M�i ng�y ch� ���c d�ng 1 l�n S� Tay C� T�, h�m nay �� d�ng.")
        return
    end
end

function TaoYuan_CreateTalkNpc()
    for i = 1, getn(TaoYuan_npc) do
        local npc = TaoYuan_npc[i]
        local idx = CreateNpc(npc.templete,npc.name,npc.pos[1],npc.pos[2],npc.pos[3])
        SetNpcScript(idx,npc.script)
    end
end
function TaoYuan_CreateFunctionNpc()
	local nNpcIdx = CreateNpc("R��ng �� Trung Nguy�n","Th� kh�",8901,4064,11124);
    SetNpcScript(nNpcIdx,"\\script\\biwudahui\\npc\\npc_itemkeeper.lua");
    local npcIndex = CreateNpc("Ch��ng d��c T�y Nam", "Ch� D��c �i�m", 8901,4056,11147);
    SetNpcScript(npcIndex, "\\script\\������\\����\\npc\\ҩ���ϰ�.lua");
end;

function on_event_server_start() 
    TaoYuan_CreateEnterNpc()
    for i = 1, getn(TaoYuan_MapInfo) do
        ClearMapNpc(TaoYuan_MapInfo[i].mapid)
        ClearMapTrap(TaoYuan_MapInfo[i].mapid)
        TaoYuan_CreateLeaveNpc(i)
        TaoYuan_CreateGuard(i)
        TaoYuan_AddTraps(i)
    end
    TaoYuan_CreateMonster1()
    TaoYuan_CreateMonster2()
    TaoYuan_CreateMonster3()
    TaoYuan_CreateMonster4()
    SetCampRelation(TaoYuan_CampPlayer, TaoYuan_CampMonster, 8)
    TaoYuan_CreateTeleportTrap()
    TaoYuan_CreateBossWhenSvrStart()
    TaoYuan_CreateTalkNpc()
    TaoYuan_RefreshTalkNpcChenlei()
    TaoYuan_CreateFunctionNpc()
end

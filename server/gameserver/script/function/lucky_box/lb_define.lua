--测试
DebugOutput = nothing

--活动开启时间
LB_START_TIME = {2014,6,13,0,0,0};
LB_STOP_TIME = {2024,7,1,0,0,0};

--奖励配置表
LB_AWARD_CONFIG = "\\script\\function\\lucky_box\\lucky_box.txt"

--免费开启次数
LB_FREE_USE_MAX = 80;
--收费开启次数
LB_IB_ITEM_USE_MAX = 1000;

--免费消耗
LB_FREE_COST_ITEM = {2, 1, 30499, 2, "Hu﹏ chng anh h飊g"};
--收费消耗
LB_IB_COST_ITEM = {2, 1, 30230, 3, "Hu﹏ chng anh h飊g"};

-------------
EVENT_QUAYTHUONG_MAX_LOTTERY_NUM=10000;

----------------Ph莕 thng m鑓 quay thng
g_tbQuayThuong_AccumulateAward = {
    { nRequireNum = 100, szName = "Moc Thuong 500",
      tbAward = {
          { tbProp = { 2, 102, 225 }, nStack = 10},
          { tbProp = { 2, 1, 30912 }, nStack = 1000 },
          { tbProp = { 2, 1, 31402 }, nStack = 100},
          { tbProp = { 2, 1, 31401 }, nStack = 100 },
        }
    },
    { nRequireNum = 200, szName = "B� 甶觧 25", tbAward = { tbProp = { 2, 1, 40058 }, nStack = 2, nStatus = 4 }, },
    { nRequireNum = 500, szName = "B� 甶觧 27", tbAward = { tbProp = { 2, 1, 40057 }, nStack = 2, nStatus = 4 }, },
    { nRequireNum = 1000, szName = "T骾  qu� 6", tbAward = { tbProp = { 2, 1, 31123 }, nStack = 5, nStatus = 4 }, },
    { nRequireNum = 1500, szName = "C� Kim Th筩h", tbAward = { tbProp = { 2, 201, 14 }, nStack = 3, nStatus = 4 }, },
    { nRequireNum = 2000, szName = "Thng h秈 Di Ch﹗ 5", tbAward = { tbProp = { 2, 102, 223 }, nStack = 5, nStatus = 4 }, },
    { nRequireNum = 2500, szName = "Thi猲 M玭 Kim L謓h", tbAward = { tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 4 }, },
    { nRequireNum = 3000, szName = "Thi猲 Cang L謓h", tbAward = { tbProp = {  2, 95, 204 }, nStack = 5, nStatus = 4 }, },
    { nRequireNum = 4000, szName = "Th玭 Nguy謙 L謓h", tbAward = { tbProp = { 2, 1, 31256 }, nStack = 1, nStatus = 4 }, },
    { nRequireNum = 5000, szName = "觤 Tinh Ng鋍", tbAward = { tbProp = { 2, 201, 16 }, nStack = 1, nStatus = 4 }, },
    --{ nRequireNum = 3000, szName = "1 B� Thi猲 H� V� Song +15", tbAward = { nFunc = "WItem:AddSuit_ThienHaVoSong(15, 4, 'T� B秓 Trai')" }, },
    --{ nRequireNum = 1000, szName = "4 Qu﹏ C玭g Huy Ho祅g", tbAward = { tbProp = { 2, 1, 9977 }, nStack = 4, nStatus = 1, nExpiredTime = 7 * 24 * 3600 }, },
    --{ nRequireNum = 20000, szName = "2 C� Ph�-T骾 T祅 Quy觧", tbAward = { tbProp = { 2, 1, 50028 }, nStatus = 1, nStack = 2, nQuality = szRareMsg }, },
    --{ nRequireNum = EVENT_TUBAOTRAI_MAX_LOTTERY_NUM, szName = "3 C� Ph�-T骾 T祅 Quy觧", tbAward = { tbProp = { 2, 1, 50028 }, nStatus = 1, nStack = 3, nQuality = szRareMsg }, },
}




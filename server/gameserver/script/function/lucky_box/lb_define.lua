--²âÊÔ
DebugOutput = nothing

--»î¶¯¿ªÆôÊ±¼ä
LB_START_TIME = {2014,6,13,0,0,0};
LB_STOP_TIME = {2024,7,1,0,0,0};

--½±ÀøÅäÖÃ±í
LB_AWARD_CONFIG = "\\script\\function\\lucky_box\\lucky_box.txt"

--Ãâ·Ñ¿ªÆô´ÎÊý
LB_FREE_USE_MAX = 80;
--ÊÕ·Ñ¿ªÆô´ÎÊý
LB_IB_ITEM_USE_MAX = 1000;

--Ãâ·ÑÏûºÄ
LB_FREE_COST_ITEM = {2, 1, 30499, 2, "Hu©n ch­¬ng anh hïng"};
--ÊÕ·ÑÏûºÄ
LB_IB_COST_ITEM = {2, 1, 30230, 3, "Hu©n ch­¬ng anh hïng"};

-------------
EVENT_QUAYTHUONG_MAX_LOTTERY_NUM=10000;

----------------PhÇn th­ëng mèc quay th­ëng
g_tbQuayThuong_AccumulateAward = {
    { nRequireNum = 100, szName = "Moc Thuong 500",
      tbAward = {
          { tbProp = { 2, 102, 225 }, nStack = 10},
          { tbProp = { 2, 1, 30912 }, nStack = 1000 },
          { tbProp = { 2, 1, 31402 }, nStack = 100},
          { tbProp = { 2, 1, 31401 }, nStack = 100 },
        }
    },
    { nRequireNum = 200, szName = "BÝ ®iÓn 25", tbAward = { tbProp = { 2, 1, 40058 }, nStack = 2, nStatus = 4 }, },
    { nRequireNum = 500, szName = "BÝ ®iÓn 27", tbAward = { tbProp = { 2, 1, 40057 }, nStack = 2, nStatus = 4 }, },
    { nRequireNum = 1000, szName = "Tói ®¸ quý 6", tbAward = { tbProp = { 2, 1, 31123 }, nStack = 5, nStatus = 4 }, },
    { nRequireNum = 1500, szName = "Cæ Kim Th¹ch", tbAward = { tbProp = { 2, 201, 14 }, nStack = 3, nStatus = 4 }, },
    { nRequireNum = 2000, szName = "Th­¬ng h¶i Di Ch©u 5", tbAward = { tbProp = { 2, 102, 223 }, nStack = 5, nStatus = 4 }, },
    { nRequireNum = 2500, szName = "Thiªn M«n Kim LÖnh", tbAward = { tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = 4 }, },
    { nRequireNum = 3000, szName = "Thiªn Cang LÖnh", tbAward = { tbProp = {  2, 95, 204 }, nStack = 5, nStatus = 4 }, },
    { nRequireNum = 4000, szName = "Th«n NguyÖt LÖnh", tbAward = { tbProp = { 2, 1, 31256 }, nStack = 1, nStatus = 4 }, },
    { nRequireNum = 5000, szName = "§iÓm Tinh Ngäc", tbAward = { tbProp = { 2, 201, 16 }, nStack = 1, nStatus = 4 }, },
    --{ nRequireNum = 3000, szName = "1 Bé Thiªn H¹ V« Song +15", tbAward = { nFunc = "WItem:AddSuit_ThienHaVoSong(15, 4, 'Tô B¶o Trai')" }, },
    --{ nRequireNum = 1000, szName = "4 Qu©n C«ng Huy Hoµng", tbAward = { tbProp = { 2, 1, 9977 }, nStack = 4, nStatus = 1, nExpiredTime = 7 * 24 * 3600 }, },
    --{ nRequireNum = 20000, szName = "2 Cæ Phæ-Tói Tµn QuyÓn", tbAward = { tbProp = { 2, 1, 50028 }, nStatus = 1, nStack = 2, nQuality = szRareMsg }, },
    --{ nRequireNum = EVENT_TUBAOTRAI_MAX_LOTTERY_NUM, szName = "3 Cæ Phæ-Tói Tµn QuyÓn", tbAward = { tbProp = { 2, 1, 50028 }, nStatus = 1, nStack = 3, nQuality = szRareMsg }, },
}




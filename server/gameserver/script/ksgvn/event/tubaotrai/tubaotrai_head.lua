local szRareMsg = "Chóc mõng %s nhËn th­ëng mèc Tô B¶o Trai thu ®­îc %d %s"

EVENT_TUBAOTRAI_MAX_LOTTERY_NUM = 3000

g_tbTuBaoTrai_AccumulateAward = {
    { nRequireNum = 500, szName = "Mèc quay 500",
          tbAward = {
            { tbProp = { 2, 102, 225 }, nStack = 10},
            { tbProp = { 2, 1, 30912 }, nStack = 1000 },
            { tbProp = { 2, 1, 31402 }, nStack = 100},
            { tbProp = { 2, 1, 31401 }, nStack = 100 },
        },
    },
    { nRequireNum = 1000, szName = "Mèc quay 1000",
          tbAward = {
              { tbProp = { 2, 102, 225 }, nStack = 20}, -- Ch©u 7
              { tbProp = { 2, 1, 30912 }, nStack = 2000 },--HiÖp NghÜa Chi Chøng
              { tbProp = { 2, 1, 31402 }, nStack = 200}, -- TÈy T©m Th¹ch Lv7
              { tbProp = { 2, 1, 31401 }, nStack = 200 }, -- LuyÖn lo 7
              { tbProp = { 2, 1, 40137 }, nStack = 2000 }, -- Bot chau Tinh Anh
              { tbProp = { 2, 1, 40046 }, nStack = 100 }, -- M¶nh Tïy BiÕn Ch©u 7
          },
    },
    { nRequireNum = 1500, szName = "Mèc quay 1500",
          tbAward = {
              { tbProp = { 2, 1, 30912 }, nStack = 3000 },--HiÖp NghÜa Chi Chøng
              { tbProp = { 2, 1, 40046 }, nStack = 400 }, -- M¶nh Tïy BiÕn Ch©u 7
              { tbProp = { 2, 1, 40137 }, nStack = 5000 }, -- Bot chau Tinh Anh
              { tbProp = { 2, 1, 31614 }, nStack = 50}, --TÈy T©m Th¹ch Lv8
              { tbProp = { 2, 1, 31615 }, nStack = 50 },--LuyÖn L« Th¹ch Lv8
              { tbProp = { 2, 1, 40030 }, nStack = 10 }, --Tói ®¸ quý 8
          },
    },
    { nRequireNum = 2000, szName = "Mèc quay 2000",
          tbAward = {
              { tbProp = { 2, 1, 30912 }, nStack = 5000 },--HiÖp NghÜa Chi Chøng
              { tbProp = { 2, 1, 40046 }, nStack = 500 }, -- M¶nh Tïy BiÕn Ch©u 7
              { tbProp = { 2, 102, 225 }, nStack = 30}, -- Ch©u 7
              { tbProp = { 2, 1, 31614 }, nStack = 100}, --TÈy T©m Th¹ch Lv8
              { tbProp = { 2, 1, 31615 }, nStack = 100 },--LuyÖn L« Th¹ch Lv8
              { tbProp = { 2, 1, 40030 }, nStack = 20 }, --Tói ®¸ quý 8
              { tbProp = { 2, 1, 31248 }, nStack = 20 }, --Tô linh quyÕt
          },
    },
    { nRequireNum = EVENT_TUBAOTRAI_MAX_LOTTERY_NUM, szName = "Mèc quay 3000",
          tbAward = {
              { tbProp = { 2, 1, 30912 }, nStack = 10000 },--HiÖp NghÜa Chi Chøng
              { tbProp = { 2, 1, 40046 }, nStack = 800 }, -- M¶nh Tïy BiÕn Ch©u 7
              { tbProp = { 2, 102, 225 }, nStack = 40}, -- Ch©u 7
              { tbProp = { 2, 1, 31614 }, nStack = 150}, --TÈy T©m Th¹ch Lv8
              { tbProp = { 2, 1, 31615 }, nStack = 150 },--LuyÖn L« Th¹ch Lv8
              { tbProp = { 2, 1, 40030 }, nStack = 30 }, --Tói ®¸ quý 8
              { tbProp = { 2, 1, 31248 }, nStack = 50 }, --Tô linh quyÕt
              { tbProp = { 2, 1, 40137 }, nStack = 10000 }, -- Bot chau Tinh Anh
          },
    },
    --{ nRequireNum = 2000, szName = "5 uy Hæ Hån", tbAward = { tbProp = { 2, 1, 31294 }, nStack = 5, nStatus = 1 }, },
    --{ nRequireNum = 2500, szName = "20 Th­¬ng H¶i Di Ch©u 6", tbAward = { tbProp = { 2, 102, 224 }, nStack = 20, nStatus = 1 }, },
    --{ nRequireNum = 2500, szName = "V¨n søc tïy chän Lv3", tbAward = { nFunc ="tubaotrai_ChonVanSuc3_demo"}, },
    --{ nRequireNum = 2500, szName = "1 Bé Thiªn H¹ V« Song +15", tbAward = { nFunc = "WItem:AddSuit_ThienHaVoSong(15, 4, 'Tô B¶o Trai')" }, },
    --{ nRequireNum = 3000, szName = "10 Th­¬ng h¶i Di ch©u 7", tbAward = { tbProp = { 2, 102, 225 }, nStack = 10, nStatus = 1 }, },
   -- { nRequireNum = 4000, szName = "5 Thiªn cang lÖnh", tbAward = { tbProp = { 2, 95, 204 }, nStack = 5, nStatus = 1 }, },
    --{ nRequireNum = 5000, szName = "20 Th­¬ng H¶i Di Ch©u 7", tbAward = { tbProp = { 2, 102, 225 }, nStack = 20, nStatus = 1 }, },
    --{ nRequireNum = 3000, szName = "1 Bé Thiªn H¹ V« Song +15", tbAward = { nFunc = "WItem:AddSuit_ThienHaVoSong(15, 4, 'Tô B¶o Trai')" }, },

    --{ nRequireNum = 1000, szName = "4 Qu©n C«ng Huy Hoµng", tbAward = { tbProp = { 2, 1, 9977 }, nStack = 4, nStatus = 1, nExpiredTime = 7 * 24 * 3600 }, },
    --{ nRequireNum = 2000, szName = "1 Tói §¸ Quý cÊp 6", tbAward = { tbProp = { 2, 1, 31123 }, nStack = 1, nStatus = 1 }, },
    --{ nRequireNum = 3000, szName = "2 Tói §¸ Quý cÊp 6", tbAward = { tbProp = { 2, 1, 31123 }, nStack = 2, nStatus = 1, }, },
    --{ nRequireNum = 7000, szName = "50 Th­¬ng H¶i Di Ch©u 7", tbAward = { tbProp = { 2, 102, 225 }, nStack = 50, nStatus = 1, }, },
    --{ nRequireNum = 8000, szName = "1 Th­¬ng H¶i Ch©u cÊp 7 (ch­a gi¸m ®Þnh)", tbAward = { tbProp = { 2, 102, 224 }, nStatus = 1, nStack = 1, nQuality = szRareMsg }, },
    --{ nRequireNum = 20000, szName = "1 cÆp V« Cùc minh Tinh", tbAward = { nFunc = "KsgItem:AddJewelry(31130, 2)" }, },
    --{ nRequireNum = 30000, szName = "Nãn V« Song ChiÕn ThÇn", tbAward = { nFunc = "KsgItem:AddSuitCap(30651, 15)" }, },
    --{ nRequireNum = 45000, szName = "¸o V«ng Song ChiÕn ThÇn", tbAward = { nFunc = "KsgItem:AddSuitCloth(30651, 15)" }, },
    --{ nRequireNum = EVENT_TUBAOTRAI_MAX_LOTTERY_NUM, szName = "QuÇn V« Song ChiÕn ThÇn", tbAward = { nFunc = "KsgItem:AddSuitShoe(30651, 15)" }, },
}

g_tbTuBaoTrai_TaskAward = {
    tbProp = { 2, 1, 30997 }, nStatus = 4, nStack = 1
}

g_tbTuBaoTrai_VIPGift = {
    tbProp = { 2, 1, 30997 }, nStatus = 4, nStack = 10
}

EVENT_TUBAOTRAI_TYPE_FREE = 1
EVENT_TUBAOTRAI_TYPE_IB = 2

g_tbTuBaoTrai_ItemCost = {
    [EVENT_TUBAOTRAI_TYPE_FREE] = {
        tbItems = {
            { tbProp = { 2, 1, 30230 }, nCount = 5 }
        }
    },
    [EVENT_TUBAOTRAI_TYPE_IB] = {
        tbItems = {
            { tbProp = { 2, 1, 30230 }, nCount = 5 }
        }
    }
}

g_tbtVanSucCap3 = {
    [1] = { szShowName = "Kh¾c B¶n Hoµn Mü cÊp 3 (§Çu)", nP =  31261 },
    [2] = { szShowName = "Kh¾c B¶n Hoµn Mü cÊp 3(¸o)", nP =  31262 },
    [3] = { szShowName = "Kh¾c B¶n Hoµn Mü cÊp 3 (QuÇn)", nP =  31263 },
    [4] = { szShowName = "Kh¾c B¶n Hoµn Mü cÊp 3 (NhÉn)", nP =  31264 },
    [5] = { szShowName = "Kh¾c B¶n Hoµn Mü cÊp 3 (Ngäc Béi)", nP =  31265 },
}


g_szTuBaoNpcName = "<color=green>Chñ Th­¬ng Héi<color>: "
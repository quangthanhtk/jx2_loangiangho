local szRareMsg = "Ch�c m�ng %s nh�n th��ng m�c T� B�o Trai thu ���c %d %s"

EVENT_TUBAOTRAI_MAX_LOTTERY_NUM = 3000

g_tbTuBaoTrai_AccumulateAward = {
    { nRequireNum = 500, szName = "M�c quay 500",
          tbAward = {
            { tbProp = { 2, 102, 225 }, nStack = 10},
            { tbProp = { 2, 1, 30912 }, nStack = 1000 },
            { tbProp = { 2, 1, 31402 }, nStack = 100},
            { tbProp = { 2, 1, 31401 }, nStack = 100 },
        },
    },
    { nRequireNum = 1000, szName = "M�c quay 1000",
          tbAward = {
              { tbProp = { 2, 102, 225 }, nStack = 20}, -- Ch�u 7
              { tbProp = { 2, 1, 30912 }, nStack = 2000 },--Hi�p Ngh�a Chi Ch�ng
              { tbProp = { 2, 1, 31402 }, nStack = 200}, -- T�y T�m Th�ch Lv7
              { tbProp = { 2, 1, 31401 }, nStack = 200 }, -- Luy�n lo 7
              { tbProp = { 2, 1, 40137 }, nStack = 2000 }, -- Bot chau Tinh Anh
              { tbProp = { 2, 1, 40046 }, nStack = 100 }, -- M�nh T�y Bi�n Ch�u 7
          },
    },
    { nRequireNum = 1500, szName = "M�c quay 1500",
          tbAward = {
              { tbProp = { 2, 1, 30912 }, nStack = 3000 },--Hi�p Ngh�a Chi Ch�ng
              { tbProp = { 2, 1, 40046 }, nStack = 400 }, -- M�nh T�y Bi�n Ch�u 7
              { tbProp = { 2, 1, 40137 }, nStack = 5000 }, -- Bot chau Tinh Anh
              { tbProp = { 2, 1, 31614 }, nStack = 50}, --T�y T�m Th�ch Lv8
              { tbProp = { 2, 1, 31615 }, nStack = 50 },--Luy�n L� Th�ch Lv8
              { tbProp = { 2, 1, 40030 }, nStack = 10 }, --T�i �� qu� 8
          },
    },
    { nRequireNum = 2000, szName = "M�c quay 2000",
          tbAward = {
              { tbProp = { 2, 1, 30912 }, nStack = 5000 },--Hi�p Ngh�a Chi Ch�ng
              { tbProp = { 2, 1, 40046 }, nStack = 500 }, -- M�nh T�y Bi�n Ch�u 7
              { tbProp = { 2, 102, 225 }, nStack = 30}, -- Ch�u 7
              { tbProp = { 2, 1, 31614 }, nStack = 100}, --T�y T�m Th�ch Lv8
              { tbProp = { 2, 1, 31615 }, nStack = 100 },--Luy�n L� Th�ch Lv8
              { tbProp = { 2, 1, 40030 }, nStack = 20 }, --T�i �� qu� 8
              { tbProp = { 2, 1, 31248 }, nStack = 20 }, --T� linh quy�t
          },
    },
    { nRequireNum = EVENT_TUBAOTRAI_MAX_LOTTERY_NUM, szName = "M�c quay 3000",
          tbAward = {
              { tbProp = { 2, 1, 30912 }, nStack = 10000 },--Hi�p Ngh�a Chi Ch�ng
              { tbProp = { 2, 1, 40046 }, nStack = 800 }, -- M�nh T�y Bi�n Ch�u 7
              { tbProp = { 2, 102, 225 }, nStack = 40}, -- Ch�u 7
              { tbProp = { 2, 1, 31614 }, nStack = 150}, --T�y T�m Th�ch Lv8
              { tbProp = { 2, 1, 31615 }, nStack = 150 },--Luy�n L� Th�ch Lv8
              { tbProp = { 2, 1, 40030 }, nStack = 30 }, --T�i �� qu� 8
              { tbProp = { 2, 1, 31248 }, nStack = 50 }, --T� linh quy�t
              { tbProp = { 2, 1, 40137 }, nStack = 10000 }, -- Bot chau Tinh Anh
          },
    },
    --{ nRequireNum = 2000, szName = "5 uy H� H�n", tbAward = { tbProp = { 2, 1, 31294 }, nStack = 5, nStatus = 1 }, },
    --{ nRequireNum = 2500, szName = "20 Th��ng H�i Di Ch�u 6", tbAward = { tbProp = { 2, 102, 224 }, nStack = 20, nStatus = 1 }, },
    --{ nRequireNum = 2500, szName = "V�n s�c t�y ch�n Lv3", tbAward = { nFunc ="tubaotrai_ChonVanSuc3_demo"}, },
    --{ nRequireNum = 2500, szName = "1 B� Thi�n H� V� Song +15", tbAward = { nFunc = "WItem:AddSuit_ThienHaVoSong(15, 4, 'T� B�o Trai')" }, },
    --{ nRequireNum = 3000, szName = "10 Th��ng h�i Di ch�u 7", tbAward = { tbProp = { 2, 102, 225 }, nStack = 10, nStatus = 1 }, },
   -- { nRequireNum = 4000, szName = "5 Thi�n cang l�nh", tbAward = { tbProp = { 2, 95, 204 }, nStack = 5, nStatus = 1 }, },
    --{ nRequireNum = 5000, szName = "20 Th��ng H�i Di Ch�u 7", tbAward = { tbProp = { 2, 102, 225 }, nStack = 20, nStatus = 1 }, },
    --{ nRequireNum = 3000, szName = "1 B� Thi�n H� V� Song +15", tbAward = { nFunc = "WItem:AddSuit_ThienHaVoSong(15, 4, 'T� B�o Trai')" }, },

    --{ nRequireNum = 1000, szName = "4 Qu�n C�ng Huy Ho�ng", tbAward = { tbProp = { 2, 1, 9977 }, nStack = 4, nStatus = 1, nExpiredTime = 7 * 24 * 3600 }, },
    --{ nRequireNum = 2000, szName = "1 T�i �� Qu� c�p 6", tbAward = { tbProp = { 2, 1, 31123 }, nStack = 1, nStatus = 1 }, },
    --{ nRequireNum = 3000, szName = "2 T�i �� Qu� c�p 6", tbAward = { tbProp = { 2, 1, 31123 }, nStack = 2, nStatus = 1, }, },
    --{ nRequireNum = 7000, szName = "50 Th��ng H�i Di Ch�u 7", tbAward = { tbProp = { 2, 102, 225 }, nStack = 50, nStatus = 1, }, },
    --{ nRequireNum = 8000, szName = "1 Th��ng H�i Ch�u c�p 7 (ch�a gi�m ��nh)", tbAward = { tbProp = { 2, 102, 224 }, nStatus = 1, nStack = 1, nQuality = szRareMsg }, },
    --{ nRequireNum = 20000, szName = "1 c�p V� C�c minh Tinh", tbAward = { nFunc = "KsgItem:AddJewelry(31130, 2)" }, },
    --{ nRequireNum = 30000, szName = "N�n V� Song Chi�n Th�n", tbAward = { nFunc = "KsgItem:AddSuitCap(30651, 15)" }, },
    --{ nRequireNum = 45000, szName = "�o V�ng Song Chi�n Th�n", tbAward = { nFunc = "KsgItem:AddSuitCloth(30651, 15)" }, },
    --{ nRequireNum = EVENT_TUBAOTRAI_MAX_LOTTERY_NUM, szName = "Qu�n V� Song Chi�n Th�n", tbAward = { nFunc = "KsgItem:AddSuitShoe(30651, 15)" }, },
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
    [1] = { szShowName = "Kh�c B�n Ho�n M� c�p 3 (��u)", nP =  31261 },
    [2] = { szShowName = "Kh�c B�n Ho�n M� c�p 3(�o)", nP =  31262 },
    [3] = { szShowName = "Kh�c B�n Ho�n M� c�p 3 (Qu�n)", nP =  31263 },
    [4] = { szShowName = "Kh�c B�n Ho�n M� c�p 3 (Nh�n)", nP =  31264 },
    [5] = { szShowName = "Kh�c B�n Ho�n M� c�p 3 (Ng�c B�i)", nP =  31265 },
}


g_szTuBaoNpcName = "<color=green>Ch� Th��ng H�i<color>: "
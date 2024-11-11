Import("\\script\\ksgvn\\lib.lua")
Include("\\script\\ksgvn\\event\\bachbaoruong\\bachbaoruong_award.lua")

----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------

MAX_OPEN_BOX_COUNT = 5000

g_szNpcName = g_szNpcName or "<color=yellow>R­¬ng B¸u VËt: <color>"

_g_tbExchangeBox = {
    [1] = {
        szDesc = "Sö dông 10 xu ®Ó më r­¬ng",
        tbCondition = {
            tbItems = {
                { szName = "Xu", tbProp = { 2, 1, 30230 }, nCount = 10 }
            },
        }
    },
    --[2] = {
    --    szDesc = "Sö dông 888 vµng ®Ó më r­¬ng",
    --    tbCondition = {
    --        nGold = 888
    --    },
    --    nLimit = 500,
    --},
}

_g_tbBoxPos = {
    { 304, 1532, 2892 },
    { 304, 1543, 2897 },
    { 304, 1533, 2913 },
    { 304, 1540, 2998 },
    { 304, 1551, 2997 },
    { 304, 1551, 3014 },
    { 304, 1541, 3015 },
    { 304, 1505, 2980 },
    { 304, 1494, 2980 },
    { 304, 1493, 2994 },
    { 108, 1416, 3159 },
    { 108, 1429, 3166 },
    { 108, 1420, 3179 },
    { 108, 1500, 3155 },
    { 108, 1508, 3146 },
    { 108, 1510, 3162 },
    { 108, 1489, 2961 },
    { 108, 1500, 2974 },
    { 108, 1487, 2979 },
    { 108, 1491, 2971 },
}
_g_tbBoxPosLocal = {
    { 350, 1394, 2977 },
    { 350, 1434, 2935 },
    { 100, 1477, 2908 },
    { 100, 1393, 2917 },
    { 200, 1413, 2835 },
    { 200, 1303, 2766 },
    { 300, 1813, 3559 },
    { 300, 1700, 3460 },
    { 500, 1690, 3100 },
    { 500, 1758, 3111 },
    { 150, 1654, 3111 },
    { 150, 1659, 3143 },
    { 400, 1471, 3053 },
    { 400, 1551, 2942 },
}

BOX_AWARD_EXP = 10e6
--{ tbProp = { 2, 1, 31391 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- X· Qu©n Táa Linh Th¹ch 1
--{ tbProp = { 2, 1, 31392 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- X· Qu©n Táa Linh Th¹ch 2
--{ tbProp = { 2, 1, 31393 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- X· Qu©n Táa Linh Th¹ch 3
--{ tbProp = { 2, 1, 31394 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- X· Qu©n Táa Linh Th¹ch 4
--{ tbProp = { 2, 1, 31395 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- X· Qu©n Táa Linh Th¹ch 5
--{ tbProp = { 2, 1, 31396 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- X· Qu©n Táa Linh Th¹ch 6
_g_tbBoxAward = {
    --{ nFunc = format("WItem:AddWeapon_VKNT(%d, %d, %d)", 8, WEnv.TRUE, 1), nRate = 5 }, -- Vò khÝ nguyªn tö cÊp 86 ngÉu nhiªn
    --{ nFunc = format("WItem:AddWeapon_VKNT(%d, %d, %d)", 9, WEnv.TRUE, 1), nRate = 5 }, -- Vò khÝ nguyªn tö cÊp 96 ngÉu nhiªn

    { nFunc = "BbrAward:GiveRandomWeapon(9)", nRate = 7.5 }, -- Vò khÝ nguyªn tö cÊp 96 ngÉu nhiªn
    { tbProp = { 2, 1, 31391 }, nStack = 1, nRate = 5 }, -- X· Qu©n Táa Linh Th¹ch 1
    { tbProp = { 2, 1, 40049 }, nStack = 5, nRate = 3 }, -- M¶nh BÝ §iÓn 30
    { tbProp = { 0, 112, 224 }, nStack = 1, nRate = 4 }, -- MËt TÞch Tiªu Dao
    { tbProp = { 2, 1, 31505 }, nStack = 1, nRate = 1 }, -- Tói §¸ Quý CÊp 7
    { tbProp = { 2, 1, 31392 }, nStack = 1, nRate = 5 }, -- X· Qu©n Táa Linh Th¹ch 2
    { tbProp = { 2, 102, 225 }, nStack = 1, nRate = 1 }, -- Th­¬ng H¶i Ch©u CÊp 7 (Ch­a gi¸m ®Þnh)
    { tbProp = { 2, 1, 30424 }, nStack = 1, nRate = 7 }, -- C­êng hãa quyÓn 12
    { tbProp = { 2, 1, 30425 }, nStack = 1, nRate = 5 }, -- C­êng hãa quyÓn 13
    { tbProp = { 2, 1, 30426 }, nStack = 1, nRate = 3 }, -- C­êng hãa quyÓn 14
    { tbProp = { 2, 1, 30427 }, nStack = 1, nRate = 2 }, -- C­êng hãa quyÓn 15

    --{ tbProp = { 2, 1, 1113 }, nStack = 1, nRate = 2 }, -- §¹i §Þnh Hån
    { tbProp = { 2, 1, 31239 }, nStack = 1, nRate = 2 }, -- Linh Ph¸ch §¬n
    { tbProp = { 2, 1, 31393 }, nStack = 1, nRate = 2 }, -- X· Qu©n Táa Linh Th¹ch 3
    { tbProp = { 2, 1, 31394 }, nStack = 1, nRate = 1.5 }, -- X· Qu©n Táa Linh Th¹ch 4
    { tbProp = { 2, 1, 31395 }, nStack = 1, nRate = 1 }, -- X· Qu©n Táa Linh Th¹ch 5
    { tbProp = { 2, 1, 31396 }, nStack = 1, nRate = 3 }, -- X· Qu©n Táa Linh Th¹ch 6

    { tbProp = { 2, 1, 30847 }, nStack = 1, nRate = 4 }, -- Håi Tiªn §¬n
    { tbProp = { 2, 114, 143 }, nStack = 1, nRate = 10 }, -- Ch©n Vâ Hån Th¹ch
    { tbProp = { 2, 102, 224 }, nStack = 1, nRate = 4 }, -- Th­¬ng H¶i Ch©u CÊp 6


    { tbProp = { 2, 1, 30390 }, nStack = 100, nRate = 2 }, -- M¶nh Thiªn Cang
    { tbProp = { 2, 1, 30410 }, nStack = 20, nRate = 2 }, -- M¶nh Thiªn M«n
    { tbProp = { 2, 1, 40030 }, nStack = 1, nRate = 2 }, -- Tói ®¸ quý lv8
    { tbProp = { 2, 1, 30729  }, nStack = 10, nRate = 4 }, -- Kim Ngäc DiÖp
    { tbProp = { 2, 1, 1001}, nStack = 1, nRate = 4 }, --  Hßa ThÞ BÝch
    { tbProp = { 2, 102, 223}, nStack = 1, nRate = 3 }, --  Th­¬ng h¶i di ch©u 5

    { tbProp = { 2, 1, 40050 }, nStack = 5, nRate = 1 }, -- M¶nh bÝ ®iÓn 32
    { tbProp = { 2, 1, 31248 }, nStatus = 1, nRate = 1 }, -- Tô Linh QuyÕt
    { tbProp = { 2, 1, 31614 }, nStack = 10, nRate = 3 }, -- TÈy T©m Th¹ch Lv8
    { tbProp = { 2, 1, 31615 }, nStack = 10, nRate = 3 }, -- LuyÖn L« ThiÕt Lv8
    { tbProp = { 2, 1, 31252 }, nStack = 10, nRate = 2}, -- §æi Linh Th¹ch-Cao 4
    { tbProp = { 2, 1, 31253 }, nStack = 10, nRate = 1}, -- §æi Linh Th¹ch-Cao 5
   { tbProp = { 2, 1, 31254 }, nStack = 10, nRate = 1}, -- §æi Linh Th¹ch-Cao 6
}

_g_tbAccumulateAward = {
    [300] = {
        -- { tbProp = { 2, 1, 50282 }, nStatus = ITEMSTATUS_LOCK, nStack = 1 }, -- Tói gÊm V·n T×nh Trang
        { tbProp = { 0, 112, 224 },nStatus = ITEMSTATUS_TRADE, nStack = 5 }, -- MËt TÞch Tiªu Dao
    },
    [600] = {
        {tbProp = { 2, 102, 224 },nStatus = ITEMSTATUS_TRADE, nStack = 50 }, -- Th­¬ng H¶i Ch©u CÊp 6
    },
    [1000] = {
        -- { nFunc = format("WItem:AddSuit_VoCucTinhMinh(%d)", 4) },
        { tbProp = { 2, 102, 224 },nStatus = ITEMSTATUS_TRADE, nStack = 100}, -- Th­¬ng H¶i Ch©u CÊp 6
    },
    [1500] = {
        { tbProp = { 2, 1, 40050 },nStatus = ITEMSTATUS_TRADE, nStack = 100 }, -- M¶nh BÝ §iÓn 32
        { tbProp = { 2, 1, 40030 }, nStatus = ITEMSTATUS_TRADE, nStack = 8 }, -- Tói ®¸ quý lv8
        { tbProp = { 2, 102, 225 }, nStack = 20 }, -- Th­¬ng H¶i Ch©u CÊp 7
    },
    [2000] = {
        { tbProp = { 2, 1, 31396 }, nStack = 10 }, -- X· Qu©n Táa Linh Th¹ch 6
        { tbProp = { 2, 102, 225 }, nStatus = ITEMSTATUS_TRADE, nStack = 30 }, -- Th­¬ng H¶i Ch©u CÊp 7 (Ch­a gi¸m ®Þnh)
        { tbProp = { 2, 1, 40050 },nStatus = ITEMSTATUS_TRADE, nStack = 200 }, -- M¶nh BÝ §iÓn 32
        { tbProp = { 2, 1, 40030 }, nStatus = ITEMSTATUS_TRADE, nStack = 10 }, -- Tói ®¸ quý lv8
    },
    [3000] = {
        { tbProp = { 2, 102, 225 }, nStatus = ITEMSTATUS_TRADE, nStack = 50 }, -- Th­¬ng H¶i Ch©u CÊp 7 (Ch­a gi¸m ®Þnh)
        { tbProp = { 2, 1, 31396 }, nStack = 20 }, -- X· Qu©n Táa Linh Th¹ch 6
        { tbProp = { 2, 1, 40030 }, nStatus = ITEMSTATUS_TRADE, nStack = 20 }, -- Tói ®¸ quý lv8
        { tbProp = { 2, 1, 40050 },nStatus = ITEMSTATUS_TRADE, nStack = 300 }, -- M¶nh BÝ §iÓn 32
        { nFunc = "AddTitle(200,2)" },
    },
    [4000] = {
        -- { tbProp = { 2, 102, 225 }, nStatus = 1, nStack = 50 }, -- Th­¬ng H¶i Ch©u CÊp 7 (Ch­a gi¸m ®Þnh)
        { tbProp = { 2, 1, 31239 }, nStack = 100 }, -- Linh Ph¸ch §¬n
    },
    --[5000] = {
    --    { tbProp = { 2, 1, 40050 }, nStack = 200, nStatus = ITEMSTATUS_TRADE }, -- M¶nh bÝ ®iÓn 32
    --    { nFunc = "AddTitle(200,1)" },
    --    { nFunc = "SetTitleTime(200, 1, GetTime() + (30 * 24 * 3600))" },
    --},
}

_g_tbWeapon = {
    [WEAPON_TYPE_BAOTAY] = 14,
    [WEAPON_TYPE_CHAM] = 53,
    [WEAPON_TYPE_KIEM] = 36,
    [WEAPON_TYPE_DAO] = 64,
    [WEAPON_TYPE_CUNG] = 119,
    [WEAPON_TYPE_CON] = 40,
    [WEAPON_TYPE_THUONG] = 108,
    [WEAPON_TYPE_SONGDAO] = 12,
    [WEAPON_TYPE_TRUONG] = 97,
    [WEAPON_TYPE_BUT] = 86,
    [WEAPON_TYPE_DAN] = 75,
    [WEAPON_TYPE_TRAO] = 12,
    [WEAPON_TYPE_LINHNU] = 12,
    [WEAPON_TYPE_VUTIEN] = 12,
}

_g_tbWeaponAttribute = {
    [7] = {
        {
            nAttributeId = 285,
            nRate = 1.1,
            tbLevelCfg = {
                { nLevel = 5, nRate = 90 },
                { nLevel = 6, nRate = 9 },
                { nLevel = 7, nRate = 1 },
            }
        },
        {
            nAttributeId = 304,
            nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 41,
            nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 42,
            nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 49,
            nRate = 6,
            tbLevelCfg = {
                { nLevel = 6, nRate = 50 },
                { nLevel = 7, nRate = 50 },
            }
        },
        {
            nAttributeId = 50,
            nRate = 1.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 252,
            nRate = 0.4,
            tbLevelCfg = {
                { nLevel = 4, nRate = 85 },
                { nLevel = 5, nRate = 12 },
                { nLevel = 6, nRate = 3 },
            }
        },
        {
            nAttributeId = 268,
            nRate = 1,
            tbLevelCfg = {
                { nLevel = 5, nRate = 80 },
                { nLevel = 6, nRate = 15 },
                { nLevel = 7, nRate = 5 },
            }
        },
        {
            nAttributeId = 53,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 54,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 63,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 64,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 390,
            nRate = 0.5,
            tbLevelCfg = {
                { nLevel = 3, nRate = 70 },
                { nLevel = 4, nRate = 20 },
                { nLevel = 5, nRate = 10 },
            }
        },
        {
            nAttributeId = 85,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 86,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 94, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 95, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 96, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 97, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 98, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 102, nRate = 4,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 111, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 277, nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 278, nRate = 4,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 308, nRate = 0.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 70 },
                { nLevel = 6, nRate = 20 },
                { nLevel = 7, nRate = 10 },
            }
        },
    },
    [8] = {
        {
            nAttributeId = 285,
            nRate = 0.8,
            tbLevelCfg = {
                { nLevel = 5, nRate = 90 },
                { nLevel = 6, nRate = 9 },
                { nLevel = 7, nRate = 1 },
            }
        },
        {
            nAttributeId = 304,
            nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 41, nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 42, nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 49, nRate = 6,
            tbLevelCfg = {
                { nLevel = 6, nRate = 50 },
                { nLevel = 7, nRate = 50 },
            }
        },
        {
            nAttributeId = 50, nRate = 1.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 252, nRate = 0.6,
            tbLevelCfg = {
                { nLevel = 3, nRate = 70 },
                { nLevel = 4, nRate = 25 },
                { nLevel = 5, nRate = 5 },
            }
        },
        {
            nAttributeId = 268, nRate = 1,
            tbLevelCfg = {
                { nLevel = 5, nRate = 80 },
                { nLevel = 6, nRate = 15 },
                { nLevel = 7, nRate = 5 },
            }
        },
        {
            nAttributeId = 53, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 54, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 63, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 64, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 390, nRate = 0.6,
            tbLevelCfg = {
                { nLevel = 3, nRate = 70 },
                { nLevel = 4, nRate = 20 },
                { nLevel = 5, nRate = 10 },
            }
        },
        {
            nAttributeId = 85, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 86, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 94, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 95, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 96, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 97, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 98, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 102, nRate = 4,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 111, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 277, nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 278, nRate = 4,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 308, nRate = 0.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 70 },
                { nLevel = 6, nRate = 20 },
                { nLevel = 7, nRate = 10 },
            }
        },
    },
    [9] = {
        {
            nAttributeId = 285, nRate = 0.8,
            tbLevelCfg = {
                { nLevel = 5, nRate = 90 },
                { nLevel = 6, nRate = 9 },
                { nLevel = 7, nRate = 1 },
            }
        },
        {
            nAttributeId = 304, nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 41, nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 42, nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 49, nRate = 6,
            tbLevelCfg = {
                { nLevel = 6, nRate = 50 },
                { nLevel = 7, nRate = 50 },
            }
        },
        {
            nAttributeId = 50, nRate = 1.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 252, nRate = 0.6,
            tbLevelCfg = {
                { nLevel = 3, nRate = 70 },
                { nLevel = 4, nRate = 25 },
                { nLevel = 5, nRate = 5 },
            }
        },
        {
            nAttributeId = 268, nRate = 1,
            tbLevelCfg = {
                { nLevel = 5, nRate = 80 },
                { nLevel = 6, nRate = 15 },
                { nLevel = 7, nRate = 5 },
            }
        },
        {
            nAttributeId = 53, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 54, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 63, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 64, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 390, nRate = 0.6,
            tbLevelCfg = {
                { nLevel = 3, nRate = 70 },
                { nLevel = 4, nRate = 20 },
                { nLevel = 5, nRate = 10 },
            }
        },
        {
            nAttributeId = 85, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 86, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 94, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 95, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 96, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 97, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 98, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 102, nRate = 4,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 111, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 277, nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 278, nRate = 4,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 308, nRate = 0.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 70 },
                { nLevel = 6, nRate = 20 },
                { nLevel = 7, nRate = 10 },
            }
        },
    }
}

_g_tbPetBookRates = {
    [6] = {
        { nBookId = 87, nRate = 5.4 },
        { nBookId = 88, nRate = 6.4 },
        { nBookId = 89, nRate = 6.4 },
        { nBookId = 90, nRate = 6.4 },
        { nBookId = 91, nRate = 6 },
        { nBookId = 92, nRate = 6 },
        { nBookId = 93, nRate = 5 },
        { nBookId = 94, nRate = 5 },
        { nBookId = 95, nRate = 5 },
        { nBookId = 96, nRate = 5 },
        { nBookId = 97, nRate = 5 },
        { nBookId = 98, nRate = 5 },
        { nBookId = 99, nRate = 5 },
        { nBookId = 100, nRate = 5 },
        { nBookId = 101, nRate = 5 },
        { nBookId = 102, nRate = 5 },
        { nBookId = 103, nRate = 5.4 },
        { nBookId = 104, nRate = 5 },
        { nBookId = 105, nRate = 1.5 },
        { nBookId = 106, nRate = 1.5 },
    }
}

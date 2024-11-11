----------------------------------------------------------------------------------------------------
--- Author: Quang Thanh
--- Modified: 2023-01-19
--- Description: ßi”m n®ng Æ‰ng hµng ngµy
----------------------------------------------------------------------------------------------------

WDIEMNANGDONG = {
    szClassName = "WDIEMNANGDONG",
    fnDebug = nothing,
    
    nDateOpen = 20230119,
    nDateClose = 20230120,

    tbBoxPos = {
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
    },
    
    tbBoxPosLocal = {
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
    },
    
    tbExchanceBox = {
        [1] = {
            szDesc = "Sˆ dÙng 20 xu Æ” mÎ r≠¨ng",
            tbCondition = {
                tbItems = {
                    { tbProp = { 2, 1, 30230 }, nCount = 20 }, -- Xu vÀt ph»m
                },
            }
        },
        [2] = {
            szDesc = "Sˆ dÙng 2000 vµng Æ” mÎ r≠¨ng",
            tbCondition = {
                nGold = 2000
            }
        },
    },
    
    nMaxOpenBoxCount = 5000,
    nTaskSave = WTASKID_RUONG_QUY_MAO_OPEN_COUNT,
    nOpenWaitTime = 3,
};
tbNangDong_AccumulateAward = {
    {
        nRequireNum = 1000,
        szName = "MËc th≠Îng 1000",
        tbAward = {
            { tbProp = { 2, 1, 30562 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, --- Phogn th≠Îng l÷nh Chi’n CuÂng - Ph∏ QU©n - Du Hi÷p
            { tbProp = { 2, 1, 30815 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, --- Phogn th≠Îng l÷nh Chi’n CuÂng - Ph∏ QU©n - Du Hi÷p
            { tbProp = { 2, 1, 30560 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, --- Phogn th≠Îng l÷nh Chi’n CuÂng - Ph∏ QU©n - Du Hi÷p
            ---nFunc = "WItem:AddSuit_ThienHaVoSong(15, 4, 'TÙ B∂o Trai')" },
            ---nFunc = "KsgAward:SetDieuDuong(0, 4)
            { nFunc = "KsgAward:SetDieuDuong(10, 4)" }, --BÈ Di÷u D≠¨ng +10
        },
    },
    {
        nRequireNum = 1500,
        szName = "MËc th≠Îng 1500",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 2000,
        szName = "MËc th≠Îng 2000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 2500,
        szName = "MËc th≠Îng 2500",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 3000,
        szName = "MËc th≠Îng 3000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 3500,
        szName = "MËc th≠Îng 3500",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 4000,
        szName = "MËc th≠Îng 4000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 4500,
        szName = "MËc th≠Îng 4500",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 5000,
        szName = "MËc th≠Îng 5000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 6000,
        szName = "MËc th≠Îng 6000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 7000,
        szName = "MËc th≠Îng 7000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 8000,
        szName = "MËc th≠Îng 8000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 9000,
        szName = "MËc th≠Îng 1000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 10000,
        szName = "MËc th≠Îng 10000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 11000,
        szName = "MËc th≠Îng 11000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 12000,
        szName = "MËc th≠Îng 12000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 13000,
        szName = "MËc th≠Îng 13000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 14000,
        szName = "MËc th≠Îng 14000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 15000,
        szName = "MËc th≠Îng 15000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 16000,
        szName = "MËc th≠Îng 16000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 17000,
        szName = "MËc th≠Îng 17000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 18000,
        szName = "MËc th≠Îng 18000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
};
tbTKL_DoiThuong = {
    {
        nRequireNum = 500,
        nTaskBitID = 11,
        szName = "1000 Æi”m N®ng ßÈng",

    },
    {
        nRequireNum = 1000,
        nTaskBitID = 12,
        szName = "1000 Æi”m N®ng ßÈng",
    },
    {
        nRequireNum = 1500,
        nTaskBitID = 13,
        szName = "1000 Æi”m N®ng ßÈng",
    },
    {
        nRequireNum = 2000,
        nTaskBitID = 14,
        szName = "1000 Æi”m N®ng ßÈng",
    },
};

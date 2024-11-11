----------------------------------------------------------------------------------------------------
--- Author: Quang Thanh
--- Modified: 2023-01-19
--- Description: �i�m n�ng ��ng h�ng ng�y
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
            szDesc = "S� d�ng 20 xu �� m� r��ng",
            tbCondition = {
                tbItems = {
                    { tbProp = { 2, 1, 30230 }, nCount = 20 }, -- Xu v�t ph�m
                },
            }
        },
        [2] = {
            szDesc = "S� d�ng 2000 v�ng �� m� r��ng",
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
        szName = "M�c th��ng 1000",
        tbAward = {
            { tbProp = { 2, 1, 30562 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, --- Phogn th��ng l�nh Chi�n Cu�ng - Ph� QU�n - Du Hi�p
            { tbProp = { 2, 1, 30815 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, --- Phogn th��ng l�nh Chi�n Cu�ng - Ph� QU�n - Du Hi�p
            { tbProp = { 2, 1, 30560 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, --- Phogn th��ng l�nh Chi�n Cu�ng - Ph� QU�n - Du Hi�p
            ---nFunc = "WItem:AddSuit_ThienHaVoSong(15, 4, 'T� B�o Trai')" },
            ---nFunc = "KsgAward:SetDieuDuong(0, 4)
            { nFunc = "KsgAward:SetDieuDuong(10, 4)" }, --B� Di�u D��ng +10
        },
    },
    {
        nRequireNum = 1500,
        szName = "M�c th��ng 1500",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 2000,
        szName = "M�c th��ng 2000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 2500,
        szName = "M�c th��ng 2500",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 3000,
        szName = "M�c th��ng 3000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 3500,
        szName = "M�c th��ng 3500",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 4000,
        szName = "M�c th��ng 4000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 4500,
        szName = "M�c th��ng 4500",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 5000,
        szName = "M�c th��ng 5000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 6000,
        szName = "M�c th��ng 6000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 7000,
        szName = "M�c th��ng 7000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 8000,
        szName = "M�c th��ng 8000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 9000,
        szName = "M�c th��ng 1000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 10000,
        szName = "M�c th��ng 10000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 11000,
        szName = "M�c th��ng 11000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 12000,
        szName = "M�c th��ng 12000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 13000,
        szName = "M�c th��ng 13000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 14000,
        szName = "M�c th��ng 14000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 15000,
        szName = "M�c th��ng 15000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 16000,
        szName = "M�c th��ng 16000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 17000,
        szName = "M�c th��ng 17000",
        tbAward = {
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
            { tbProp = { 2, 1, 31244 }, nStack = nAmount, nStatus = ITEMSTATUS_LOCK },
        },
    },
    {
        nRequireNum = 18000,
        szName = "M�c th��ng 18000",
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
        szName = "1000 �i�m N�ng ��ng",

    },
    {
        nRequireNum = 1000,
        nTaskBitID = 12,
        szName = "1000 �i�m N�ng ��ng",
    },
    {
        nRequireNum = 1500,
        nTaskBitID = 13,
        szName = "1000 �i�m N�ng ��ng",
    },
    {
        nRequireNum = 2000,
        nTaskBitID = 14,
        szName = "1000 �i�m N�ng ��ng",
    },
};

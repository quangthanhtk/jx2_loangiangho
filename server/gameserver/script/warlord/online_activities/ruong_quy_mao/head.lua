----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-01-19
--- Description: c�c ��nh ngh�a d�ng trong event t�t 2023 R��ng Qu� M�o
----------------------------------------------------------------------------------------------------

WRUONGQUYMAO = {
    szClassName = "WRUONGQUYMAO",
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
    
    tbRandomAward = {
        { nFunc = format("WItem:AddWeapon_VKNT(%d, %d, %d, %q)", 8, WEnv.TRUE, ITEMSTATUS_TRADE), nRate = 10 }, -- V� kh� nguy�n t� c�p 86 ng�u nhi�n
        { nFunc = format("WItem:AddWeapon_VKNT(%d, %d, %d, %q)", 9, WEnv.TRUE, ITEMSTATUS_TRADE), nRate = 10 }, -- V� kh� nguy�n t� c�p 96 ng�u nhi�n

        { tbProp = { 2, 1, 40048 }, nStack = 10, nRate = 5 }, -- M�nh B� �i�n 27
        { tbProp = { 2, 1, 40049 }, nStack = 10, nRate = 1 }, -- M�nh B� �i�n 30
        { tbProp = { 0, 112, 224 }, nStack = 1, nRate = 5 }, -- M�t T�ch Ti�u Dao
        { tbProp = { 2, 1, 40049 }, nStack = 1, nRate = 5 }, -- T�i �� Qu� C�p 7
        { tbProp = { 2, 1, 40037 }, nStack = 1, nRate = 5 }, -- T�i K� N�ng B�H Lv6
        { tbProp = { 2, 102, 214 }, nStack = 1, nRate = 10 }, -- Th��ng H�i Ch�u C�p 7 (Ch�a gi�m ��nh)
        { tbProp = { 2, 1, 30424 }, nStack = 1, nRate = 5 }, -- C��ng h�a quy�n 12
        { tbProp = { 2, 1, 30425 }, nStack = 1, nRate = 4 }, -- C��ng h�a quy�n 13
        { tbProp = { 2, 1, 30426 }, nStack = 1, nRate = 3 }, -- C��ng h�a quy�n 14
        { tbProp = { 2, 1, 30427 }, nStack = 1, nRate = 2 }, -- C��ng h�a quy�n 15
        { tbProp = { 2, 1, 1113 }, nStack = 1, nRate = 1 }, -- ��i ��nh H�n
        { tbProp = { 2, 114, 143 }, nStack = 1, nRate = 10 }, -- Ch�n V� H�n Th�ch
        { tbProp = { 2, 95, 5830 }, nStack = 1, nRate = 4 }, -- Kh�i L�i C� Quan Nh�n
        { tbProp = { 2, 1, 30526 }, nStack = 1, nRate = 10 }, -- T�y T�m Th�ch Lv6
        { tbProp = { 2, 1, 30532 }, nStack = 1, nRate = 10 }, -- Luy�n L� Thi�t Lv6
    },

    tbAccumulateAward = {
        [100] = {
            { tbProp = { 2, 1, 40048 }, nStatus = ITEMSTATUS_TRADE, nStack = 100 }, -- M�nh B� �i�n 30
        },
        [200] = {
            { tbProp = { 2, 1, 50282 }, nStatus = ITEMSTATUS_TRADE, nStack = 1 }, -- T�i g�m V�n T�nh Trang
        },
        [500] = {
            { tbProp = { 2, 1, 31307 }, nStatus = ITEMSTATUS_TRADE, nStack = 1 }, -- Chi�u Y�u K�
        },
        [1000] = {
            { nFunc = format("WItem:AddSuit_VoCucTinhMinh(%d)", ITEMSTATUS_LOCK) },
        },
        [1500] = {
            { tbProp = { 2, 1, 40049 }, nStatus = ITEMSTATUS_TRADE, nStack = 300 }, -- M�nh B� �i�n 30
        },
        [2000] = {
            { tbProp = { 2, 1, 50304 }, nStatus = ITEMSTATUS_TRADE, nStack = 1 }, -- L� bao Song Song Y�n
        },
        [3000] = {
            { tbProp = { 2, 102, 225 }, nStatus = ITEMSTATUS_TRADE, nStack = 50 }, -- Th��ng H�i Ch�u C�p 7 (Ch�a gi�m ��nh)
        },
        [5000] = {
            { nFunc = format("WItem:AddSuit_VoSongChienThan(%d, %d)", 10, ITEMSTATUS_LOCK) },
        },
    }
};

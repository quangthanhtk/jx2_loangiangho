Import("\\script\\ksgvn\\constants.lua")

GLB_VALUE_SERVER_ID = 1023

g_tbServerCfg = {
    [1] = {
        szName = "B�ch H�",
        tbTimeOpen = { nHour = 10, nDay = 25, nMonth = 5, nYear = 2020, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20200525, nEndDate = 20200725, nGetTongAwardDate = 20200727 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 1,
        bOpenGMCard = 0,

        bOpenTop = 1,
    },
    [2] = {
        szName = "Thanh Long",
        tbTimeOpen = { nHour = 10, nDay = 12, nMonth = 7, nYear = 2020, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20200712, nEndDate = 20200912, nGetTongAwardDate = 20200914 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 1,
        bOpenGMCard = 0,

        bOpenTop = 1,
    },
    [3] = {
        szName = "Phi �ng",
        tbTimeOpen = { nHour = 10, nDay = 20, nMonth = 8, nYear = 2020, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20200820, nEndDate = 20201020, nGetTongAwardDate = 20201022 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 1,
        bOpenGMCard = 0,

        bOpenTop = 1,
    },
    [4] = {
        szName = "T�ng Long",
        tbTimeOpen = { nHour = 10, nDay = 8, nMonth = 11, nYear = 2020, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20201108, nEndDate = 20210108, nGetTongAwardDate = 20210110 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 1,
        bOpenGMCard = 0,

        bOpenTop = 1,
    },
    [5] = {
        szName = "Phi Long", -- T�ng Long g�p v�i Phi �ng
        tbTimeOpen = { nHour = 10, nDay = 8, nMonth = 11, nYear = 2020, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20201108, nEndDate = 20210108, nGetTongAwardDate = 20210110 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 1,
        bOpenGMCard = 0,

        bOpenTop = 1,
    },
    [6] = {
        szName = "Ng�a H�",
        tbTimeOpen = { nHour = 10, nDay = 14, nMonth = 1, nYear = 2021, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20210114, nEndDate = 20210226, nGetTongAwardDate = 20210228 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 1,
        bOpenGMCard = 0,

        bOpenTop = 1,
    },
    [7] = {
        szName = "Long H� M�n",-- Phi Long g�p v�i Ng�a H�
        tbTimeOpen = { nHour = 10, nDay = 14, nMonth = 1, nYear = 2021, },
        tbTimeTest = { nStartDate = 20200510, nEndDate = 20200515 },
        tbTimeTop = { nStartDate = 20210114, nEndDate = 20210226, nGetTongAwardDate = 20210228 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 1,
        bOpenGMCard = 0,

        bOpenTop = 0,
    },
    [8] = {
        szName = "Th��ng Long",-- Jx2VTD
        tbTimeOpen = { nHour = 19, nDay = 10, nMonth = 9, nYear = 2022, },
        tbTimeTest = { nStartDate = 20220910, nEndDate = 20220923 },
        tbTimeTop = { nStartDate = 20210925, nEndDate = 20210925, nGetTongAwardDate = 20210925 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 0,
    },
    [9] = {
        szName = "Chu T��c",
        tbTimeOpen = { nHour = 19, nDay = 07, nMonth = 04, nYear = 2024, },
        tbTimeTest = { nStartDate = 20240326, nEndDate = 20240406 },
        tbTimeTop = { nStartDate = 20221209, nEndDate = 20230109, nGetTongAwardDate = 20230109 },

        bOpenTestCard = 0,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 0,
    },
    [100] = {
        szName = "Th� nghi�m",
        tbTimeOpen = { nHour = 19, nDay = 12, nMonth = 11, nYear = 2022, },
        tbTimeTest = { nStartDate = 20221112, nEndDate = 20241212 },
        tbTimeTop = { nStartDate = 20220925, nEndDate = 20221025, nGetTongAwardDate = 20221025 },

        bOpenTestCard = 1,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 0,
        bOpenGMCard = 0,

        bOpenTop = 0,
    },
    [150] = {
        szName = "Li�n ��u",
        tbTimeOpen = { nHour = 10, nDay = 10, nMonth = 5, nYear = 2020, },
        tbTimeTest = { nStartDate = 20080808, nEndDate = 20080808 },
        tbTimeTop = { nStartDate = 20080808, nEndDate = 20080808, nGetTongAwardDate = 20080808 },

        bOpenTestCard = 1,
        bOpenNewPlayerCard = 1,
        bOpenAdminCard = 1,
        bOpenGMCard = 1,

        bOpenTop = 1,
    },
}

g_tbServerDefaultCfg = {
    szName = "V� L�m 2",
    tbTimeOpen = { nHour = 10, nDay = 10, nMonth = 5, nYear = 2020, },
    tbTimeTest = { nStartDate = 20080808, nEndDate = 20080808 },
    tbTimeTop = { nStartDate = 20080808, nEndDate = 20080808, nGetTongAwardDate = 20080808 },

    bOpenTestCard = 1,
    bOpenNewPlayerCard = 0,
    bOpenAdminCard = 1,
    bOpenGMCard = 0,

    bOpenTop = 0,
}

g_tbLoginCfg = {
    [1] = {
        bCondition = 'bOpenTestCard',
        tbProp = { 2, 1, 50001 },
        szRequireRule = 'player',
        szMsg = "C�c h� nh�n ���c <color=yellow>1 Th� Tr�i Nghi�m<color>, d�ng �� tr�i nghi�m t�nh n�ng c�a game, xin ki�m tra t�i h�nh trang! Ch�c b�n ch�i game vui v�!"
    },
    [2] = {
        bCondition = 'bOpenNewPlayerCard',
        tbProp = { 2, 1, 50002 },
        szRequireRule = 'player',
        szMsg = "C�c h� nh�n ���c <color=yellow>1 T�n Th� L�nh<color>, xin ki�m tra t�i h�nh trang!"
    },
    [3] = {
        bCondition = 'bOpenGMCard',
        tbProp = { 2, 1, 50004 },
        szRequireRule = 'gm',
        szMsg = "B�n l� GM, nh�n ���c <color=yellow>th� h� tr�<color>!"
    },
    [4] = {
        bCondition = 'bOpenAdminCard',
        tbProp = { 2, 1, 50003 },
        szRequireRule = 'admin',
        szMsg = "B�n l� Admin, nh�n ���c <color=yellow>th� qu�n l� server<color>!"
    },
}

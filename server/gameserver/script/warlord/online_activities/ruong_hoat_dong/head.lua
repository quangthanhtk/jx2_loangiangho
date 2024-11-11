----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-15
--- Description: ��nh ngh�a c�c tham s� cho event m� r��ng ho�t ��ng
----------------------------------------------------------------------------------------------------

WRUONGHD = {
    szClassName = "WRUONGHD",

    tbActivityInfo = {
        szActivityName = "Ho�t ��ng t�ch lu� m� r��ng",
        szActivitySayTitle = "Thu th�p v� m� <color=white>R��ng Ho�t ��ng<color> nh�n m�nh gh�p �� ��i l�y v�t ph�m ��c bi�t!",
        tbActivitySayOption = {
            [1] = "�ua TOP t�ch lu� m� r��ng/WRUONGHD_Act1",
            [2] = "��i m�nh gh�p V� L�m 2/WRUONGHD_Act2",
        },
    },

    tbTopDef = {
        [1] = { szName = "3 top �i�m t�ch lu� c�a h�m qua",
                nTopLimit = 3,
                nTaskId = WTASKID_DUATOP_AWARD_GIVE_RHD_STATUS_BIT,
                nTaskBitId = WTASKID_DUATOP_AWARD_GIVE_RHD_STATUS_BIT_TOP_YESTERDAY,
                szDataFilePath = "\\data\\warlord\\duatop_ruonghoatdong\\top_3_yesterday.txt",
                szSuccessDataFilePath = "data/warlord/duatop_ruonghoatdong/top_3_yesterday_success.txt",
                szDataLabel = "�i�m",
                fnDataStrFormal = WLib.MoneyFormat,
                tbAwardDef = {
                    [1] = {
                        szName = "Top 1",
                        tbAwards = {
                            { szName = "1 b� V� Song Chi�n Th�n+15 (kh�a)", nFunc = format("WItem:AddSuit_VoSongChienThan(%d, %d, %q)", 15, ITEMSTATUS_LOCK, "Nh�n top1 �i�m RHD") },
                        },
                        tbConditions = {
                            nRoomReq = 3 + 2,
                        },
                    },
                    [2] = {
                        szName = "Top 2",
                        tbAwards = {
                            { szName = "1 b� V� Song Chi�n Th�n+14 (kh�a)", nFunc = format("WItem:AddSuit_VoSongChienThan(%d, %d, %q)", 14, ITEMSTATUS_LOCK, "Nh�n top1 �i�m RHD") },
                        },
                        tbConditions = {
                            nRoomReq = 3 + 2,
                        },
                    },
                    [3] = {
                        szName = "Top 3",
                        tbAwards = {
                            { szName = "1 b� V� Song Chi�n Th�n+13 (kh�a)", nFunc = format("WItem:AddSuit_VoSongChienThan(%d, %d, %q)", 13, ITEMSTATUS_LOCK, "Nh�n top1 �i�m RHD") },
                        },
                        tbConditions = {
                            nRoomReq = 3 + 2,
                        },
                    },
                }
        },
    },

    szSdbKeyPrefix = "_w_ruonghoatdong_", -- suffix c� d�ng yyyyMMdd
    nMinPointReq = 2000,

    nMaxVSCT = 5, -- gi�i h�n ��i th��ng v� song to�n server
    szDataFilePath_VSCT = "data/warlord/online_activities/ruong_hoat_dong/doi_vosongchienthan.txt",

    tbMaterialType = {
        [PackItemId(2, 1, 40064)] = { tbProp = { 2, 1, 40064 }, nCount = 1 }, -- M�nh [V�]
        [PackItemId(2, 1, 40065)] = { tbProp = { 2, 1, 40065 }, nCount = 1 }, -- M�nh [L�m]
        [PackItemId(2, 1, 40066)] = { tbProp = { 2, 1, 40066 }, nCount = 1 }, -- M�nh [2]
        [PackItemId(2, 1, 40067)] = { tbProp = { 2, 1, 40067 }, nCount = 1 }, -- M�nh [Huy�n]
        [PackItemId(2, 1, 40068)] = { tbProp = { 2, 1, 40068 }, nCount = 1 }, -- M�nh [Tho�i]
    },
    tbExchanceGoods = {
        {
            szName = "2 B�nh �t Ch�n G� = 1 m�nh gh�p",
            tbGoods = { tbProp = { 2, 1, 1124 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 B�nh �t B�t B�o = 1 m�nh gh�p",
            tbGoods = { tbProp = { 2, 1, 1125 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 Th�t Hoa T� Nguy�n T�n (l�c c�n) = 1 m�nh gh�p",
            tbGoods = { tbProp = { 1, 0, 266 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 Th�t Hoa T� Nguy�n T�n (l�c th�n) = 1 m�nh gh�p",
            tbGoods = { tbProp = { 1, 0, 267 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 Th�t Hoa T� Nguy�n T�n (l�c ��ng) = 1 m�nh gh�p",
            tbGoods = { tbProp = { 1, 0, 268 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 Th�t Hoa T� Nguy�n T�n (l�c n�i) = 1 m�nh gh�p",
            tbGoods = { tbProp = { 1, 0, 269 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 Th�t Hoa T� Nguy�n T�n (n�i c�n) = 1 m�nh gh�p",
            tbGoods = { tbProp = { 1, 0, 270 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 Th�t Hoa T� Nguy�n T�n (n�i th�n) = 1 m�nh gh�p",
            tbGoods = { tbProp = { 1, 0, 271 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 Th�t Hoa T� Nguy�n T�n (n�i ��ng) = 1 m�nh gh�p",
            tbGoods = { tbProp = { 1, 0, 272 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 Th�t Hoa T� Nguy�n T�n (th�n c�n) = 1 m�nh gh�p",
            tbGoods = { tbProp = { 1, 0, 273 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 Th�t Hoa T� Nguy�n T�n (th�n ��ng) = 1 m�nh gh�p",
            tbGoods = { tbProp = { 1, 0, 274 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 Th�t Hoa T� Nguy�n T�n (��ng c�n) = 1 m�nh gh�p",
            tbGoods = { tbProp = { 1, 0, 275 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "1 L�ng Ba Vi B� to�n t�p = 200 m�nh gh�p",
            tbGoods = { tbProp = { 0, 112, 158 }, nStack = 1, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 200 }
        },
        {
            szName = "1 M�t T�ch Ti�u Dao = 200 m�nh gh�p",
            tbGoods = { tbProp = { 0, 112, 224 }, nStack = 1, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 200 }
        },
        {
            szName = "1 Ch�n V� H�n Th�ch = 10 m�nh gh�p",
            tbGoods = { tbProp = { 0, 112, 224 }, nStack = 1, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 10 }
        },
        {
            szName = "1 M�nh B� �i�n 25 = 1 m�nh gh�p",
            tbGoods = { tbProp = { 2, 1, 40047 }, nStack = 1, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "1 M�nh B� �i�n 27 = 5 m�nh gh�p",
            tbGoods = { tbProp = { 2, 1, 40048 }, nStack = 1, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 5 }
        },
        {
            szName = "1 M�nh B� �i�n 30 = 20 m�nh gh�p",
            tbGoods = { tbProp = { 2, 1, 40049 }, nStack = 1, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 20 }
        },
        {
            szName = "1 M�nh T�y Bi�n Ch�u 7 = 20 m�nh gh�p",
            tbGoods = { tbProp = { 2, 1, 40046 }, nStack = 1, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 20 }
        },
        {
            szName = "1 Th��ng H�i Ch�u C�p 7 = 10 m�nh gh�p",
            tbGoods = { tbProp = { 2, 1, 40046 }, nStack = 1, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 20 }
        },
    },

    tbBoxAward = {
        { tbProp = { 2, 1, 40064 }, nStack = 1, nRate = 50.00 }, -- M�nh [V�]
        { tbProp = { 2, 1, 40065 }, nStack = 1, nRate = 30.00 }, -- M�nh [L�m]
        { tbProp = { 2, 1, 40066 }, nStack = 1, nRate = 19.98 }, -- M�nh [2]
        { tbProp = { 2, 1, 40067 }, nStack = 1, nRate = 0.01 }, -- M�nh [Huy�n]
        { tbProp = { 2, 1, 40068 }, nStack = 1, nRate = 0.01 }, -- M�nh [Tho�i]
    },

    tbLockBoxAward = {
        { tbProp = { 2, 1, 40064 }, nStack = 1, nRate = 50.00, nStatus = ITEMSTATUS_LOCK }, -- M�nh [V�]
        { tbProp = { 2, 1, 40065 }, nStack = 1, nRate = 30.00, nStatus = ITEMSTATUS_LOCK }, -- M�nh [L�m]
        { tbProp = { 2, 1, 40066 }, nStack = 1, nRate = 19.98, nStatus = ITEMSTATUS_LOCK }, -- M�nh [2]
        { tbProp = { 2, 1, 40067 }, nStack = 1, nRate = 0.01, nStatus = ITEMSTATUS_LOCK }, -- M�nh [Huy�n]
        { tbProp = { 2, 1, 40068 }, nStack = 1, nRate = 0.01, nStatus = ITEMSTATUS_LOCK }, -- M�nh [Tho�i]
    },
};

WRUONGHD = WDuaTop:RegType("duatop_ruonghoatdong", WRUONGHD);

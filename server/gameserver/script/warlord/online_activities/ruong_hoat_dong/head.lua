----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-12-15
--- Description: §Þnh nghÜa c¸c tham sè cho event më r­¬ng ho¹t ®éng
----------------------------------------------------------------------------------------------------

WRUONGHD = {
    szClassName = "WRUONGHD",

    tbActivityInfo = {
        szActivityName = "Ho¹t ®éng tÝch luü më r­¬ng",
        szActivitySayTitle = "Thu thËp vµ më <color=white>R­¬ng Ho¹t §éng<color> nhËn m¶nh ghÐp ®Ó ®æi lÊy vËt phÈm ®Æc biÖt!",
        tbActivitySayOption = {
            [1] = "§ua TOP tÝch luü më r­¬ng/WRUONGHD_Act1",
            [2] = "§æi m¶nh ghÐp Vâ L©m 2/WRUONGHD_Act2",
        },
    },

    tbTopDef = {
        [1] = { szName = "3 top ®iÓm tÝch luü cña h«m qua",
                nTopLimit = 3,
                nTaskId = WTASKID_DUATOP_AWARD_GIVE_RHD_STATUS_BIT,
                nTaskBitId = WTASKID_DUATOP_AWARD_GIVE_RHD_STATUS_BIT_TOP_YESTERDAY,
                szDataFilePath = "\\data\\warlord\\duatop_ruonghoatdong\\top_3_yesterday.txt",
                szSuccessDataFilePath = "data/warlord/duatop_ruonghoatdong/top_3_yesterday_success.txt",
                szDataLabel = "§iÓm",
                fnDataStrFormal = WLib.MoneyFormat,
                tbAwardDef = {
                    [1] = {
                        szName = "Top 1",
                        tbAwards = {
                            { szName = "1 bé V« Song ChiÕn ThÇn+15 (khãa)", nFunc = format("WItem:AddSuit_VoSongChienThan(%d, %d, %q)", 15, ITEMSTATUS_LOCK, "NhËn top1 ®iÓm RHD") },
                        },
                        tbConditions = {
                            nRoomReq = 3 + 2,
                        },
                    },
                    [2] = {
                        szName = "Top 2",
                        tbAwards = {
                            { szName = "1 bé V« Song ChiÕn ThÇn+14 (khãa)", nFunc = format("WItem:AddSuit_VoSongChienThan(%d, %d, %q)", 14, ITEMSTATUS_LOCK, "NhËn top1 ®iÓm RHD") },
                        },
                        tbConditions = {
                            nRoomReq = 3 + 2,
                        },
                    },
                    [3] = {
                        szName = "Top 3",
                        tbAwards = {
                            { szName = "1 bé V« Song ChiÕn ThÇn+13 (khãa)", nFunc = format("WItem:AddSuit_VoSongChienThan(%d, %d, %q)", 13, ITEMSTATUS_LOCK, "NhËn top1 ®iÓm RHD") },
                        },
                        tbConditions = {
                            nRoomReq = 3 + 2,
                        },
                    },
                }
        },
    },

    szSdbKeyPrefix = "_w_ruonghoatdong_", -- suffix cã d¹ng yyyyMMdd
    nMinPointReq = 2000,

    nMaxVSCT = 5, -- giíi h¹n ®æi th­ëng v« song toµn server
    szDataFilePath_VSCT = "data/warlord/online_activities/ruong_hoat_dong/doi_vosongchienthan.txt",

    tbMaterialType = {
        [PackItemId(2, 1, 40064)] = { tbProp = { 2, 1, 40064 }, nCount = 1 }, -- M¶nh [Vâ]
        [PackItemId(2, 1, 40065)] = { tbProp = { 2, 1, 40065 }, nCount = 1 }, -- M¶nh [L©m]
        [PackItemId(2, 1, 40066)] = { tbProp = { 2, 1, 40066 }, nCount = 1 }, -- M¶nh [2]
        [PackItemId(2, 1, 40067)] = { tbProp = { 2, 1, 40067 }, nCount = 1 }, -- M¶nh [HuyÒn]
        [PackItemId(2, 1, 40068)] = { tbProp = { 2, 1, 40068 }, nCount = 1 }, -- M¶nh [Tho¹i]
    },
    tbExchanceGoods = {
        {
            szName = "2 B¸nh Ýt Ch©n Gµ = 1 m¶nh ghÐp",
            tbGoods = { tbProp = { 2, 1, 1124 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 B¸nh Ýt B¸t B¶o = 1 m¶nh ghÐp",
            tbGoods = { tbProp = { 2, 1, 1125 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 ThÊt Hoa Tô Nguyªn T¸n (lùc c¨n) = 1 m¶nh ghÐp",
            tbGoods = { tbProp = { 1, 0, 266 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 ThÊt Hoa Tô Nguyªn T¸n (lùc th©n) = 1 m¶nh ghÐp",
            tbGoods = { tbProp = { 1, 0, 267 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 ThÊt Hoa Tô Nguyªn T¸n (lùc ®æng) = 1 m¶nh ghÐp",
            tbGoods = { tbProp = { 1, 0, 268 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 ThÊt Hoa Tô Nguyªn T¸n (lùc néi) = 1 m¶nh ghÐp",
            tbGoods = { tbProp = { 1, 0, 269 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 ThÊt Hoa Tô Nguyªn T¸n (néi c¨n) = 1 m¶nh ghÐp",
            tbGoods = { tbProp = { 1, 0, 270 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 ThÊt Hoa Tô Nguyªn T¸n (néi th©n) = 1 m¶nh ghÐp",
            tbGoods = { tbProp = { 1, 0, 271 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 ThÊt Hoa Tô Nguyªn T¸n (néi ®æng) = 1 m¶nh ghÐp",
            tbGoods = { tbProp = { 1, 0, 272 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 ThÊt Hoa Tô Nguyªn T¸n (th©n c¨n) = 1 m¶nh ghÐp",
            tbGoods = { tbProp = { 1, 0, 273 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 ThÊt Hoa Tô Nguyªn T¸n (th©n ®æng) = 1 m¶nh ghÐp",
            tbGoods = { tbProp = { 1, 0, 274 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "2 ThÊt Hoa Tô Nguyªn T¸n (®æng c¨n) = 1 m¶nh ghÐp",
            tbGoods = { tbProp = { 1, 0, 275 }, nStack = 2, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "1 L¨ng Ba Vi Bé toµn tËp = 200 m¶nh ghÐp",
            tbGoods = { tbProp = { 0, 112, 158 }, nStack = 1, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 200 }
        },
        {
            szName = "1 MËt TÞch Tiªu Dao = 200 m¶nh ghÐp",
            tbGoods = { tbProp = { 0, 112, 224 }, nStack = 1, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 200 }
        },
        {
            szName = "1 Ch©n Vâ Hån Th¹ch = 10 m¶nh ghÐp",
            tbGoods = { tbProp = { 0, 112, 224 }, nStack = 1, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 10 }
        },
        {
            szName = "1 M¶nh BÝ §iÓn 25 = 1 m¶nh ghÐp",
            tbGoods = { tbProp = { 2, 1, 40047 }, nStack = 1, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 1 }
        },
        {
            szName = "1 M¶nh BÝ §iÓn 27 = 5 m¶nh ghÐp",
            tbGoods = { tbProp = { 2, 1, 40048 }, nStack = 1, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 5 }
        },
        {
            szName = "1 M¶nh BÝ §iÓn 30 = 20 m¶nh ghÐp",
            tbGoods = { tbProp = { 2, 1, 40049 }, nStack = 1, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 20 }
        },
        {
            szName = "1 M¶nh Tïy BiÕn Ch©u 7 = 20 m¶nh ghÐp",
            tbGoods = { tbProp = { 2, 1, 40046 }, nStack = 1, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 20 }
        },
        {
            szName = "1 Th­¬ng H¶i Ch©u CÊp 7 = 10 m¶nh ghÐp",
            tbGoods = { tbProp = { 2, 1, 40046 }, nStack = 1, nStatus = ITEMSTATUS_LOCK },
            tbConsume = { nCount = 20 }
        },
    },

    tbBoxAward = {
        { tbProp = { 2, 1, 40064 }, nStack = 1, nRate = 50.00 }, -- M¶nh [Vâ]
        { tbProp = { 2, 1, 40065 }, nStack = 1, nRate = 30.00 }, -- M¶nh [L©m]
        { tbProp = { 2, 1, 40066 }, nStack = 1, nRate = 19.98 }, -- M¶nh [2]
        { tbProp = { 2, 1, 40067 }, nStack = 1, nRate = 0.01 }, -- M¶nh [HuyÒn]
        { tbProp = { 2, 1, 40068 }, nStack = 1, nRate = 0.01 }, -- M¶nh [Tho¹i]
    },

    tbLockBoxAward = {
        { tbProp = { 2, 1, 40064 }, nStack = 1, nRate = 50.00, nStatus = ITEMSTATUS_LOCK }, -- M¶nh [Vâ]
        { tbProp = { 2, 1, 40065 }, nStack = 1, nRate = 30.00, nStatus = ITEMSTATUS_LOCK }, -- M¶nh [L©m]
        { tbProp = { 2, 1, 40066 }, nStack = 1, nRate = 19.98, nStatus = ITEMSTATUS_LOCK }, -- M¶nh [2]
        { tbProp = { 2, 1, 40067 }, nStack = 1, nRate = 0.01, nStatus = ITEMSTATUS_LOCK }, -- M¶nh [HuyÒn]
        { tbProp = { 2, 1, 40068 }, nStack = 1, nRate = 0.01, nStatus = ITEMSTATUS_LOCK }, -- M¶nh [Tho¹i]
    },
};

WRUONGHD = WDuaTop:RegType("duatop_ruonghoatdong", WRUONGHD);

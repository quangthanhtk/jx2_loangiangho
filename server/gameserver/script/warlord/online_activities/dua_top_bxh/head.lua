----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-01-13
--- Description: §Þnh nghÜa c¸c tham sè ®ua top
----------------------------------------------------------------------------------------------------

WDUATOPBXH = {
    szClassName = "WDUATOPBXH",
    fnDebug = nothing,
    
    nGiveAwardTime = 202301151600, -- thêi gian trao top, ®Þnh d¹ng: YYYYmmddHHMM
    
    tbTopDef = {
        [1] = { szName = "5 top c«ng tr¹ng phe Tèng",
                nTaskId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT,
                nTaskBitId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_MERIT,
                szDataFilePath = "\\data\\warlord\\duatopbxh\\top_5_congtrang_tong.txt",
                szDataLabel = "C«ng tr¹ng",
                fnDataStrFormal = WLib.MoneyFormat,
                tbAwardDef = {
                    [1] = {
                        szName = "Top 1 c«ng tr¹ng phe Tèng",
                        tbAwards = {
                            { szName = "1 bé V« Song ChiÕn ThÇn +15", nFunc = format("WItem:AddSuit_VoSongChienThan(%d, %d, %q)", 15, ITEMSTATUS_TRADE, "NhËn top1 CT Tèng") },
                            { szName = "M¶nh BÝ §iÓn 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M¶nh Tïy BiÕn Ch©u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                            { szName = "Phong Bao 10k VND", tbProp = { 2, 1, 40062 }, nStack = 500 },
                        },
                        tbConditions = {
                            nRoomReq = 3 + 3,
                        },
                    },
                    [2] = {
                        szName = "Top 2 c«ng tr¹ng phe Tèng",
                        tbAwards = {
                            { szName = "M¶nh BÝ §iÓn 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M¶nh Tïy BiÕn Ch©u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                            { szName = "Phong Bao 10k VND", tbProp = { 2, 1, 40062 }, nStack = 300 },
                        },
                        tbConditions = {
                            nRoomReq = 3,
                        },
                    },
                    [3] = {
                        szName = "Top 3 c«ng tr¹ng phe Tèng",
                        tbAwards = {
                            { szName = "M¶nh BÝ §iÓn 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M¶nh Tïy BiÕn Ch©u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                            { szName = "Phong Bao 10k VND", tbProp = { 2, 1, 40062 }, nStack = 200 },
                        },
                        tbConditions = {
                            nRoomReq = 3,
                        },
                    },
                    [4] = {
                        szName = "Top 4 c«ng tr¹ng phe Tèng",
                        tbAwards = {
                            { szName = "M¶nh BÝ §iÓn 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M¶nh Tïy BiÕn Ch©u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                        },
                        tbConditions = {
                            nRoomReq = 2,
                        },
                    },
                    [5] = {
                        szName = "Top 5 c«ng tr¹ng phe Tèng",
                        tbAwards = {
                            { szName = "M¶nh BÝ §iÓn 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M¶nh Tïy BiÕn Ch©u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                        },
                        tbConditions = {
                            nRoomReq = 2,
                        },
                    },

                }
        },

        [2] = { szName = "5 top c«ng tr¹ng phe Liªu",
                nTaskId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT,
                nTaskBitId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_MERIT,
                szDataFilePath = "\\data\\warlord\\duatopbxh\\top_5_congtrang_lieu.txt",
                szDataLabel = "C«ng tr¹ng",
                fnDataStrFormal = WLib.MoneyFormat,
                tbAwardDef = {
                    [1] = {
                        szName = "Top 1 c«ng tr¹ng phe Liªu",
                        tbAwards = {
                            { szName = "1 bé V« Song ChiÕn ThÇn +15", nFunc = format("WItem:AddSuit_VoSongChienThan(%d, %d, %q)", 15, ITEMSTATUS_TRADE, "NhËn top1 CT Tèng") },
                            { szName = "M¶nh BÝ §iÓn 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M¶nh Tïy BiÕn Ch©u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                            { szName = "Phong Bao 10k VND", tbProp = { 2, 1, 40062 }, nStack = 500 },
                        },
                        tbConditions = {
                            nRoomReq = 3 + 3,
                        },
                    },
                    [2] = {
                        szName = "Top 2 c«ng tr¹ng phe Liªu",
                        tbAwards = {
                            { szName = "M¶nh BÝ §iÓn 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M¶nh Tïy BiÕn Ch©u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                            { szName = "Phong Bao 10k VND", tbProp = { 2, 1, 40062 }, nStack = 300 },
                        },
                        tbConditions = {
                            nRoomReq = 3,
                        },
                    },
                    [3] = {
                        szName = "Top 3 c«ng tr¹ng phe Liªu",
                        tbAwards = {
                            { szName = "M¶nh BÝ §iÓn 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M¶nh Tïy BiÕn Ch©u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                            { szName = "Phong Bao 10k VND", tbProp = { 2, 1, 40062 }, nStack = 200 },
                        },
                        tbConditions = {
                            nRoomReq = 3,
                        },
                    },
                    [4] = {
                        szName = "Top 4 c«ng tr¹ng phe Liªu",
                        tbAwards = {
                            { szName = "M¶nh BÝ §iÓn 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M¶nh Tïy BiÕn Ch©u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                        },
                        tbConditions = {
                            nRoomReq = 2,
                        },
                    },
                    [5] = {
                        szName = "Top 5 c«ng tr¹ng phe Liªu",
                        tbAwards = {
                            { szName = "M¶nh BÝ §iÓn 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M¶nh Tïy BiÕn Ch©u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                        },
                        tbConditions = {
                            nRoomReq = 2,
                        },
                    },

                }
        },
    },
};

WDUATOPBXH = WDuaTop:RegType("duatopbxh", WDUATOPBXH);

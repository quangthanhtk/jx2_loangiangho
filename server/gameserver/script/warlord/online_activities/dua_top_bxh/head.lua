----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2023-01-13
--- Description: ��nh ngh�a c�c tham s� �ua top
----------------------------------------------------------------------------------------------------

WDUATOPBXH = {
    szClassName = "WDUATOPBXH",
    fnDebug = nothing,
    
    nGiveAwardTime = 202301151600, -- th�i gian trao top, ��nh d�ng: YYYYmmddHHMM
    
    tbTopDef = {
        [1] = { szName = "5 top c�ng tr�ng phe T�ng",
                nTaskId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT,
                nTaskBitId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_MERIT,
                szDataFilePath = "\\data\\warlord\\duatopbxh\\top_5_congtrang_tong.txt",
                szDataLabel = "C�ng tr�ng",
                fnDataStrFormal = WLib.MoneyFormat,
                tbAwardDef = {
                    [1] = {
                        szName = "Top 1 c�ng tr�ng phe T�ng",
                        tbAwards = {
                            { szName = "1 b� V� Song Chi�n Th�n +15", nFunc = format("WItem:AddSuit_VoSongChienThan(%d, %d, %q)", 15, ITEMSTATUS_TRADE, "Nh�n top1 CT T�ng") },
                            { szName = "M�nh B� �i�n 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M�nh T�y Bi�n Ch�u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                            { szName = "Phong Bao 10k VND", tbProp = { 2, 1, 40062 }, nStack = 500 },
                        },
                        tbConditions = {
                            nRoomReq = 3 + 3,
                        },
                    },
                    [2] = {
                        szName = "Top 2 c�ng tr�ng phe T�ng",
                        tbAwards = {
                            { szName = "M�nh B� �i�n 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M�nh T�y Bi�n Ch�u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                            { szName = "Phong Bao 10k VND", tbProp = { 2, 1, 40062 }, nStack = 300 },
                        },
                        tbConditions = {
                            nRoomReq = 3,
                        },
                    },
                    [3] = {
                        szName = "Top 3 c�ng tr�ng phe T�ng",
                        tbAwards = {
                            { szName = "M�nh B� �i�n 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M�nh T�y Bi�n Ch�u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                            { szName = "Phong Bao 10k VND", tbProp = { 2, 1, 40062 }, nStack = 200 },
                        },
                        tbConditions = {
                            nRoomReq = 3,
                        },
                    },
                    [4] = {
                        szName = "Top 4 c�ng tr�ng phe T�ng",
                        tbAwards = {
                            { szName = "M�nh B� �i�n 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M�nh T�y Bi�n Ch�u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                        },
                        tbConditions = {
                            nRoomReq = 2,
                        },
                    },
                    [5] = {
                        szName = "Top 5 c�ng tr�ng phe T�ng",
                        tbAwards = {
                            { szName = "M�nh B� �i�n 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M�nh T�y Bi�n Ch�u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                        },
                        tbConditions = {
                            nRoomReq = 2,
                        },
                    },

                }
        },

        [2] = { szName = "5 top c�ng tr�ng phe Li�u",
                nTaskId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT,
                nTaskBitId = WTASKID_DUATOPBXH_AWARD_GIVE_STATUS_BIT_MERIT,
                szDataFilePath = "\\data\\warlord\\duatopbxh\\top_5_congtrang_lieu.txt",
                szDataLabel = "C�ng tr�ng",
                fnDataStrFormal = WLib.MoneyFormat,
                tbAwardDef = {
                    [1] = {
                        szName = "Top 1 c�ng tr�ng phe Li�u",
                        tbAwards = {
                            { szName = "1 b� V� Song Chi�n Th�n +15", nFunc = format("WItem:AddSuit_VoSongChienThan(%d, %d, %q)", 15, ITEMSTATUS_TRADE, "Nh�n top1 CT T�ng") },
                            { szName = "M�nh B� �i�n 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M�nh T�y Bi�n Ch�u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                            { szName = "Phong Bao 10k VND", tbProp = { 2, 1, 40062 }, nStack = 500 },
                        },
                        tbConditions = {
                            nRoomReq = 3 + 3,
                        },
                    },
                    [2] = {
                        szName = "Top 2 c�ng tr�ng phe Li�u",
                        tbAwards = {
                            { szName = "M�nh B� �i�n 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M�nh T�y Bi�n Ch�u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                            { szName = "Phong Bao 10k VND", tbProp = { 2, 1, 40062 }, nStack = 300 },
                        },
                        tbConditions = {
                            nRoomReq = 3,
                        },
                    },
                    [3] = {
                        szName = "Top 3 c�ng tr�ng phe Li�u",
                        tbAwards = {
                            { szName = "M�nh B� �i�n 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M�nh T�y Bi�n Ch�u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                            { szName = "Phong Bao 10k VND", tbProp = { 2, 1, 40062 }, nStack = 200 },
                        },
                        tbConditions = {
                            nRoomReq = 3,
                        },
                    },
                    [4] = {
                        szName = "Top 4 c�ng tr�ng phe Li�u",
                        tbAwards = {
                            { szName = "M�nh B� �i�n 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M�nh T�y Bi�n Ch�u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
                        },
                        tbConditions = {
                            nRoomReq = 2,
                        },
                    },
                    [5] = {
                        szName = "Top 5 c�ng tr�ng phe Li�u",
                        tbAwards = {
                            { szName = "M�nh B� �i�n 32", tbProp = { 2, 1, 40050 }, nStack = 2000 },
                            { szName = "M�nh T�y Bi�n Ch�u 7", tbProp = { 2, 1, 40046 }, nStack = 1000 },
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

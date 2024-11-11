----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-08-17
--- Description: quµ th¨ng cÊp vµ mét sè hµm cho ng­êi ch¬i míi
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\functions\\function_book.lua");
----------------------------------------------------------------------------------------------------
function _w_newbieaward_UpLevel(nBigLevel, nRebornRoute)
    nBigLevel = tonumber(nBigLevel) or 0;
    if nBigLevel == 0 then
        return WEnv.RETCODE_ERROR;
    end

    if nBigLevel > 99 then
        if nRebornRoute == WEnv.NULL then
            local tbSay = { "H·y chän h­íng chuyÓn sinh phï hîp:" };
            for _nRebornRoute, _szRouteName in g_tbRebornRouteNames do
                tinsert(tbSay, format("ChuyÓn sinh theo h­íng %s/#_w_newbieaward_UpLevel(%d, %d)", _szRouteName, nBigLevel, _nRebornRoute));
            end

            tinsert(tbSay, "\nT¹m thêi ch­a muèn nhËn./nothing");
            WNpc:SayDialog(tbSay);
            return WEnv.RETCODE_NEEDCONFIRM;
        end
    end

    nRebornRoute = tonumber(nRebornRoute);
    KsgReborn:PlayerRebornWithNews(nBigLevel, nRebornRoute);
end

function _w_newbieaward_GiveBattleSuit(nSuitType, nEnhanceLevel, nBattleCamp)
    nSuitType = tonumber(nSuitType) or 0;
    nEnhanceLevel = tonumber(nEnhanceLevel) or 0;

    if nBattleCamp == WEnv.NULL then
        local nCampPoint = WPlayer:GetHonor(WEnv.TRUE);
        if nCampPoint == 0 then
            local tbSay = { "H·y chän phe chiÕn tr­êng:" };
            tinsert(tbSay, format("Gia nhËp vµ nhËn trang bÞ phe %s/#_w_newbieaward_GiveBattleSuit(%d, %d)", WEnv.BATTLECAMP_NAMES[WEnv.BATTLECAMP_TONG], nEnhanceLevel, WEnv.BATTLECAMP_TONG));
            tinsert(tbSay, format("Gia nhËp vµ nhËn trang bÞ phe %s/#_w_newbieaward_GiveBattleSuit(%d, %d)", WEnv.BATTLECAMP_NAMES[WEnv.BATTLECAMP_LIEU], nEnhanceLevel, WEnv.BATTLECAMP_LIEU));

            tinsert(tbSay, "\nT¹m thêi ch­a muèn nhËn./nothing");
            WNpc:SayDialog(tbSay);
            return WEnv.RETCODE_NEEDCONFIRM;
        elseif nCampPoint > 0 then
            nBattleCamp = WEnv.BATTLECAMP_TONG;
        else
            nBattleCamp = WEnv.BATTLECAMP_LIEU;
        end
    end

    nBattleCamp = tonumber(nBattleCamp or WEnv.BATTLECAMP_TONG);
    if nBattleCamp == WEnv.BATTLECAMP_TONG then
        if WTask:Get(704) == 0 then
            WTask:Set(704, 1);
        end
        if WTask:Get(701) == 0 then
            WTask:Set(701, 1);
        end
    elseif nBattleCamp == WEnv.BATTLECAMP_LIEU then
        if WTask:Get(704) == 0 then
            WTask:Set(704, -1);
        end
        if WTask:Get(701) == 0 then
            WTask:Set(701, -1);
        end
    end

    if nSuitType == 1 then
        KsgItem:AddBattleSuit_HoaPhung_Tuong(nEnhanceLevel);
    end
end

--- Hµm lùa chän cho phÇn th­ëng nFunc, nAwardIdx lµ param0
--- c¸c param replace nµy ®Òu kiÓu string, l­u ý ®æi l¹i trong hµm xö lý cña tõng hµm phÇn th­ëng
function _w_newbieaward_PrepareParam(nAwardIdx, nRebornRoute, nBattleCamp)
    --- param1
    if nRebornRoute == WEnv.NULL then
        local tbSay = { "H·y chän h­íng chuyÓn sinh phï hîp:" };
        for _nRebornRoute, _szRouteName in g_tbRebornRouteNames do
            tinsert(tbSay, format("ChuyÓn sinh theo h­íng %s/#WNewbieAward.tbAwardDef[%d].fnPrepareParam(%d, %d)", _szRouteName, nAwardIdx, nAwardIdx, _nRebornRoute));
        end

        tinsert(tbSay, "\nT¹m thêi ch­a muèn nhËn./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    --- param2
    if nBattleCamp == WEnv.NULL then
        local nCampPoint = WPlayer:GetHonor(WEnv.TRUE);
        if nCampPoint == 0 then
            local tbSay = { "H·y chän phe chiÕn tr­êng:" };
            tinsert(tbSay, format("Gia nhËp phe %s/#WNewbieAward.tbAwardDef[%d].fnPrepareParam(%d, %d, %d)", WEnv.BATTLECAMP_NAMES[WEnv.BATTLECAMP_TONG], nAwardIdx, nAwardIdx, nRebornRoute, WEnv.BATTLECAMP_TONG));
            tinsert(tbSay, format("Gia nhËp phe %s/#WNewbieAward.tbAwardDef[%d].fnPrepareParam(%d, %d, %d)", WEnv.BATTLECAMP_NAMES[WEnv.BATTLECAMP_LIEU], nAwardIdx, nAwardIdx, nRebornRoute, WEnv.BATTLECAMP_LIEU));

            tinsert(tbSay, "\nT¹m thêi ch­a muèn nhËn./nothing");
            WNpc:SayDialog(tbSay);
            return WEnv.RETCODE_NEEDCONFIRM;
        elseif nCampPoint > 0 then
            nBattleCamp = WEnv.BATTLECAMP_TONG;
        else
            nBattleCamp = WEnv.BATTLECAMP_LIEU;
        end
    end

    WNewbieAward:GiveAward(nAwardIdx, nRebornRoute, nBattleCamp);
    return WEnv.RETCODE_SUCCESS;
end

enumWNewbieAwardStatusCode = {
    AWARD_CAN_GET = 1,
    AWARD_HAS_GET = 2,
    AWARD_NOT_AVAILABLE = 3,
    AWARD_NEED_GET_BEFORE = 4,
    AWARD_REQ_LEVEL = 5,
    AWARD_REQ_JOIN_ROUTE = 6,
    AWARD_REQ_ROOM = 7,
    AWARD_REQ_MERIT = 8,
};
WNewbieAward = {
    szClassName = "WNewbieAward",
    tbTopDef = {
        [1] = { szName = "§¹t 500,000 ®iÓm c«ng tr¹ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_100K,
                tbAwardDef = {
                    [1] = {
                        szName = "§¹t 500,000 ®iÓm c«ng tr¹ng",
                        tbAwards = {
                            { tbProp = { 2, 1, 30912 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- HiÖp NghÜa Chi Chøng
                            { tbProp = { 2, 1, 31402 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, --  tÈy  T©m 7
                            { tbProp = { 2, 1, 31401 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« 7
                            { tbProp = { 2, 1, 1001 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- Hßa ThÞ BÝch
                        },
                        tbConditions = {
                            nRoomReq = 2,
                            nMeritReq = 500000,
                        },
                    },
                }
        },
        [2] = { szName = "§¹t 1.000,000 ®iÓm c«ng tr¹ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_200K,
                tbAwardDef = {
                    [1] = {
                        szName = "§¹t 1.000,000 ®iÓm c«ng tr¹ng",
                        tbAwards = {
                            { nFunc = "_w_newbie_Give_ThanhLongTuong(0)" }, -- Thanh Long T­íng
                            { tbProp = { 2, 1, 30912 }, nStack = 1500, nStatus = ITEMSTATUS_LOCK }, -- HiÖp NghÜa Chi Chøng
                            { tbProp = { 2, 1, 31402 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, --  tÈy  T©m 7
                            { tbProp = { 2, 1, 31401 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« 7
                        },
                        tbConditions = {
                            nRoomReq = 6,
                            nMeritReq = 1000000,
                        },
                    },
                }
        },
        [3] = { szName = "§¹t 2.000,000 ®iÓm c«ng tr¹ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_300K,
                tbAwardDef = {
                    [1] = {
                        szName = "§¹t 2.000,000 ®iÓm c«ng tr¹ng",
                        tbAwards = {
                            { tbProp = { 2, 1, 30912 }, nStack = 300, nStatus = ITEMSTATUS_LOCK }, -- HiÖp NghÜa Chi Chøng
                            { tbProp = { 2, 1, 31402 }, nStack = 40, nStatus = ITEMSTATUS_LOCK }, --  tÈy  T©m 7
                            { tbProp = { 2, 1, 31401 }, nStack = 40, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« 7
                            { tbProp = { 2, 5, 204 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, --Thiªn Cang
                            { tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Thiªn M«n lÖnh
                            { nFactionPoint = 1500 }, -- §iÓm Cèng hiÕn bang ph¸i

                        },
                        tbConditions = {
                            nRoomReq = 1,
                            nMeritReq = 2000000,
                        },
                    },
                }
        },
        [4] = { szName = "§¹t 3,000,000 ®iÓm c«ng tr¹ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_500K,
                tbAwardDef = {
                    [1] = {
                        szName = "§¹t 3000,000 ®iÓm  c«ng tr¹ng",
                        tbAwards = {
                            { tbProp = { 2, 1, 30912 }, nStack = 5000, nStatus = ITEMSTATUS_LOCK }, -- HiÖp NghÜa Chi Chøng
                            { tbProp = { 2, 1, 31402 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, --  tÈy  T©m 7
                            { tbProp = { 2, 1, 31401 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« 7
                            { tbProp = { 2, 5, 204 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, --Thiªn Cang
                            { tbProp = { 2, 1, 30370 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Thiªn M«n lÖnh
                            { tbProp = { 2, 1, 1001 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Hßa ThÞ BÝch
                            { nFactionPoint = 2000 }, -- §iÓm Cèng hiÕn bang ph¸i
                            { tbProp = { 2, 1, 31122 }, nStack = 20 }, -- Linh Khi ruc ro
                        },
                        tbConditions = {
                            nRoomReq = 1,
                            nMeritReq = 3000000,
                        },
                    },
                }
        },
        [5] = { szName = "§¹t 4,000,000 ®iÓm c«ng tr¹ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_1000K,
                tbAwardDef = {
                    [1] = {
                        szName = "§¹t 4,000,000 ®iÓm c«ng tr¹ng",
                        tbAwards = {
                            { tbProp = { 2, 1, 30912 }, nStack = 6000, nStatus = ITEMSTATUS_LOCK }, -- HiÖp NghÜa Chi Chøng
                            { tbProp = { 2, 1, 31122 }, nStack = 30 }, -- Linh Khi ruc ro
                            { tbProp = { 2, 1, 31402 }, nStack = 60, nStatus = ITEMSTATUS_LOCK }, --  tÈy  T©m 7
                            { tbProp = { 2, 1, 31401 }, nStack = 60, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« 7
                            { tbProp = { 2, 95, 204 }, nStack = 15, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Cang LÖnh
                            { tbProp = { 2, 1, 30370 }, nStack = 15, nStatus = ITEMSTATUS_LOCK },  --Thiªn M«n Kim LÖnh
                            { tbProp = { 2, 1, 1001 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Hßa ThÞ BÝch
                            { nFactionPoint = 3000 }, -- §iÓm Cèng hiÕn bang ph¸i
                        },
                        tbConditions = {
                            nRoomReq = 1,
                            nMeritReq = 4000000,
                        },
                    },
                }
        },
        [6] = { szName = "§¹t 5,000,000 ®iÓm c«ng tr¹ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_2000K,
                tbAwardDef = {
                    [1] = {
                        szName = "§¹t 5,000,000 ®iÓm c«ng tr¹ng",
                        tbAwards = {
                            { tbProp = { 2, 1, 30912 }, nStack = 7000, nStatus = ITEMSTATUS_LOCK }, -- HiÖp NghÜa Chi Chøng
                            { tbProp = { 2, 1, 31122 }, nStack = 40 }, -- Linh Khi ruc ro
                            { tbProp = { 2, 1, 31402 }, nStack = 70, nStatus = ITEMSTATUS_LOCK }, --  tÈy  T©m 7
                            { tbProp = { 2, 1, 31401 }, nStack = 70, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« 7
                            { tbProp = { 2, 95, 204 }, nStack = 15, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Cang LÖnh
                            { tbProp = { 2, 1, 30370 }, nStack = 15, nStatus = ITEMSTATUS_LOCK },  --Thiªn M«n Kim LÖnh
                            { tbProp = { 2, 1, 1001 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Hßa ThÞ BÝch
                            { nFactionPoint = 4000 }, -- §iÓm Cèng hiÕn bang ph¸i
                        },
                        tbConditions = {
                            nRoomReq = 4,
                            nMeritReq = 5000000,
                        },
                    },
                }
        },
        [7] = { szName = "§¹t 6,000,000 ®iÓm c«ng tr¹ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_3000K,
                tbAwardDef = {
                    [1] = {
                        szName = "§¹t 6,000,000 ®iÓm c«ng tr¹ng",
                        tbAwards = {
                            { tbProp = { 2, 1, 30912 }, nStack = 8000, nStatus = ITEMSTATUS_LOCK }, -- HiÖp NghÜa Chi Chøng
                            { tbProp = { 2, 1, 31122 }, nStack = 50 }, -- Linh Khi ruc ro
                            { tbProp = { 2, 1, 31402 }, nStack = 80, nStatus = ITEMSTATUS_LOCK }, --  tÈy  T©m 7
                            { tbProp = { 2, 1, 31401 }, nStack = 80, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« 7
                            { tbProp = { 2, 95, 204 }, nStack = 15, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Cang LÖnh
                            { tbProp = { 2, 1, 30370 }, nStack = 15, nStatus = ITEMSTATUS_LOCK },  --Thiªn M«n Kim LÖnh
                            {  tbProp = { 2, 102, 214  }, nStack = 20, nStatus = ITEMSTATUS_LOCK },  --Di Ch©u 7
                            { nFactionPoint = 4000 }, -- §iÓm Cèng hiÕn bang ph¸i
                        },
                        tbConditions = {
                            nRoomReq = 2,
                            nMeritReq = 6000000,
                        },
                    },
                }
        },
        [8] = { szName = "§¹t 7,000,000 ®iÓm c«ng tr¹ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_4000K,
                tbAwardDef = {
                    [1] = {
                        szName = "§¹t 7,000,000 ®iÓm c«ng tr¹ng",
                        tbAwards = {
                            { tbProp = { 2, 1, 30912 }, nStack = 10000, nStatus = ITEMSTATUS_LOCK }, -- HiÖp NghÜa Chi Chøng
                            { tbProp = { 2, 1, 31122 }, nStack = 60 }, -- Linh Khi ruc ro
                            { tbProp = { 2, 1, 31614 }, nStack = 30,nStatus = ITEMSTATUS_LOCK }, -- TÈy t©m 8
                            { tbProp = { 2, 1, 31615 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« 8
                            { tbProp = { 2, 95, 204 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Cang LÖnh
                            { tbProp = { 2, 1, 30370 }, nStack = 20, nStatus = ITEMSTATUS_LOCK },  --Thiªn M«n Kim LÖnh
                            {  tbProp = { 2, 102, 214  }, nStack = 40, nStatus = ITEMSTATUS_LOCK },  --Di Ch©u 7
                            { nFactionPoint = 5000 }, -- §iÓm Cèng hiÕn bang ph¸i
                        },
                        tbConditions = {
                            nRoomReq = 6,
                            nMeritReq = 7000000,
                        },
                    },
                }
        },
        [9] = { szName = "§¹t 8,000,000 ®iÓm c«ng tr¹ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_5000K,
                tbAwardDef = {
                    [1] = {
                        szName = "§¹t 8,000,000 ®iÓm c«ng tr¹ng",
                        tbAwards = {
                            { szName = "Set Chu T­íc T­íng", nFunc = "_w_newbie_Give_ChuTuocTuong(15)" },
                            { tbProp = { 2, 1, 30912 }, nStack = 15000, nStatus = ITEMSTATUS_LOCK }, -- HiÖp NghÜa Chi Chøng
                            { tbProp = { 2, 1, 31122 }, nStack = 60 }, -- Linh Khi ruc ro
                            { tbProp = { 2, 1, 31614 }, nStack = 50,nStatus = ITEMSTATUS_LOCK }, -- TÈy t©m 8
                            { tbProp = { 2, 1, 31615 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn L« 8
                            { tbProp = { 2, 95, 204 }, nStack = 25, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Cang LÖnh
                            { tbProp = { 2, 1, 30370 }, nStack = 25, nStatus = ITEMSTATUS_LOCK },  --Thiªn M«n Kim LÖnh
                            {  tbProp = { 2, 102, 214  }, nStack = 50, nStatus = ITEMSTATUS_LOCK },  --Di Ch©u 7
                            { nFactionPoint = 6000 }, -- §iÓm Cèng hiÕn bang ph¸i
                        },
                        tbConditions = {
                            nRoomReq = 3,
                            nMeritReq = 8000000,
                        },
                    },
                }
        },
        [10] = { szName = "§¹t 9,000,000 ®iÓm c«ng tr¹ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_6000K,
                tbAwardDef = {
                    [1] = {
                        szName = "§¹t 9,000,000 ®iÓm c«ng tr¹ng",
                        tbAwards = {
                            { szName = "Trang søc v« cùc tinh minh", nFunc = "KsgItem:AddJewelry(31130, 2)" },
                            { tbProp = { 2, 1, 30912 }, nStack = 20000, nStatus = ITEMSTATUS_LOCK }, -- HiÖp NghÜa Chi Chøng
                            --{ tbProp = { 2, 1, 31122 }, nStack = 60 }, -- Linh Khi ruc ro
                            { tbProp = { 2, 1, 31761 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- TÈy t©m 9
                            { tbProp = { 2, 1, 31762 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- LuyÖn l« 9
                            { tbProp = { 2, 95, 204 }, nStack = 40, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Cang LÖnh
                            { tbProp = { 2, 1, 30370 }, nStack = 40, nStatus = ITEMSTATUS_LOCK },  --Thiªn M«n Kim LÖnh
                            {  tbProp = { 2, 102, 226  }, nStack = 30, nStatus = ITEMSTATUS_LOCK },  --Di Ch©u 8
                            { nFactionPoint = 7000 }, -- §iÓm Cèng hiÕn bang ph¸i
                        },
                        tbConditions = {
                            nRoomReq = 1,
                            nMeritReq = 9000000,
                        },
                    },
                }
        },
        [11] = { szName = "§¹t 10,000,000 ®iÓm c«ng tr¹ng",
                 nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                 nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_8000K,
                 tbAwardDef = {
                     [1] = {
                         szName = "§¹t 10,000,000 ®iÓm c«ng tr¹ng",
                         tbAwards = {
                             { tbProp = { 2, 1, 30912 }, nStack = 25000, nStatus = ITEMSTATUS_LOCK }, -- HiÖp NghÜa Chi Chøng
                             --{ tbProp = { 2, 1, 31122 }, nStack = 60 }, -- Linh Khi ruc ro
                             { tbProp = { 2, 1, 31761 }, nStack = 50,  nStatus = ITEMSTATUS_LOCK }, -- TÈy t©m 9
                             { tbProp = { 2, 1, 31762 }, nStack = 50,  nStatus = ITEMSTATUS_LOCK }, -- LuyÖn l« 9
                             { tbProp = { 2, 95, 204 }, nStack = 40, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Cang LÖnh
                             { tbProp = { 2, 1, 30370 }, nStack = 40, nStatus = ITEMSTATUS_LOCK },  --Thiªn M«n Kim LÖnh
                             {  tbProp = { 2, 102, 226  }, nStack = 40, nStatus = ITEMSTATUS_LOCK },  --Di Ch©u 8
                             { nFactionPoint = 10000 }, -- §iÓm Cèng hiÕn bang ph¸i
                         },
                         tbConditions = {
                             nRoomReq = 2,
                             nMeritReq = 10000000,
                         },
                     },
                 }
        },
        --[12] = { szName = "§¹t 10,000,000 ®iÓm c«ng tr¹ng",
        --         nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
        --         nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_10000K,
        --         tbAwardDef = {
        --             [1] = {
        --                 szName = "§¹t 10,000,000 ®iÓm c«ng tr¹ng",
        --                 tbAwards = {
        --                     { tbProp = { 2,95,204 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Thiªn Cang LÖnh
        --                     { tbProp = { 2, 1, 30370 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Thiªn M«n Kim LÖnh
        --                 },
        --                 tbConditions = {
        --                     nRoomReq = 2,
        --                     nMeritReq = 10000000,
        --                 },
        --             },
        --         }
        --},
        --[12] = {
        --    nTaskId = WTASKID_LEVEL_AWARD_BIT,
        --    nTaskBitId = WTASKID_LEVEL_AWARD_BIT_LV1092,
        --    tbAwardDef = {
        --        [1] = {
        --            szName = "NhËn th­ëng ®¹t chuyÓn sinh 10 CÊp 92",
        --            fnPrepareParam = _w_newbieaward_PrepareParam,
        --            tbAwards = {
        --                { szName = "Ch©n Vâ Hån Th¹ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
        --                { szName = "BÝ ®iÓn 25%", tbProp = {2,1,40047 }, nStack = 100, nStatus = 4 },
        --                { szName = "Linh Ph¸ch §¬n", tbProp = { 2, 1, 31239 }, nStack = 2, nStatus = 4 },
        --                { szName = "LÖnh bµi cèng hiÕn bang béi", tbProp = { 2, 1, 30914 }, nStack = 5, nStatus = 4 },
        --                { szName = "TiÓu §Þnh Hån", tbProp = {  2, 1, 1067 }, nStack = 1, nStatus = 4 },
        --                { szName = "§¹i §Þnh Hån", tbProp = { 2, 1, 1113 }, nStack = 1, nStatus = 4 },
        --            },
        --            tbConditions = {
        --                nLevelReq = 1092,
        --                nRoomReq = 10,
        --                bJoinRouteReq = WEnv.TRUE,
        --            },
        --        },
        --    },
        --},
        --
        --[13] = {
        --    nTaskId = WTASKID_LEVEL_AWARD_BIT,
        --    nTaskBitId = WTASKID_LEVEL_AWARD_BIT_LV1093,
        --    tbAwardDef = {
        --        [1] = {
        --            szName = "NhËn th­ëng ®¹t chuyÓn sinh 10 cÊp 93",
        --            fnPrepareParam = _w_newbieaward_PrepareParam,
        --            tbAwards = {
        --                { szName = "Ch©n Vâ Hån Th¹ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
        --                { szName = "BÝ ®iÓn 25%", tbProp = {2,1,40047 }, nStack = 100, nStatus = 4 },
        --                { szName = "Linh Ph¸ch §¬n", tbProp = { 2, 1, 31239 }, nStack = 2, nStatus = 4 },
        --                { szName = "LÖnh bµi cèng hiÕn bang béi", tbProp = { 2, 1, 30914 }, nStack = 5, nStatus = 4 },
        --                { szName = "Thiªn Th¹ch Linh Th¹ch", tbProp = {  2, 1, 1068 }, nStack = 1, nStatus = 4 },
        --                { szName = "Thiªn Th¹ch Tinh Th¹ch", tbProp = { 2, 1, 1009 }, nStack = 20, nStatus = 4 },
        --            },
        --            tbConditions = {
        --                nLevelReq = 1093,
        --                nRoomReq = 10,
        --                bJoinRouteReq = WEnv.TRUE,
        --            },
        --        },
        --    },
        --},
        --
        --[14] = {
        --    nTaskId = WTASKID_LEVEL_AWARD_BIT,
        --    nTaskBitId = WTASKID_LEVEL_AWARD_BIT_LV1094,
        --    tbAwardDef = {
        --        [1] = {
        --            szName = "NhËn th­ëng ®¹t chuyÓn sinh 10 cÊp 94",
        --            fnPrepareParam = _w_newbieaward_PrepareParam,
        --            tbAwards = {
        --                { szName = "Ch©n Vâ Hån Th¹ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
        --                { szName = "BÝ ®iÓn 25%", tbProp = {2,1,40047 }, nStack = 100, nStatus = 4 },
        --                { szName = "Linh Ph¸ch §¬n", tbProp = { 2, 1, 31239 }, nStack = 4, nStatus = 4 },
        --                { szName = "LÖnh bµi cèng hiÕn bang béi", tbProp = { 2, 1, 30914 }, nStack = 5, nStatus = 4 },
        --                { szName = "Bïa c­êng hãa 12", tbProp = {  2, 1, 30424 }, nStack = 10, nStatus = 4 },
        --                { szName = "C­êng Hãa QuyÓn 13", tbProp = { 2, 1, 30425 }, nStack = 10, nStatus = 4 },
        --            },
        --            tbConditions = {
        --                nLevelReq = 1094,
        --                nRoomReq = 9,
        --                bJoinRouteReq = WEnv.TRUE,
        --            },
        --        },
        --    },
        --},
        --[15] = {
        --    nTaskId = WTASKID_LEVEL_AWARD_BIT,
        --    nTaskBitId = WTASKID_LEVEL_AWARD_BIT_LV1095,
        --    tbAwardDef = {
        --        [1] = {
        --            szName = "NhËn th­ëng ®¹t chuyÓn sinh 10 cÊp 95",
        --            fnPrepareParam = _w_newbieaward_PrepareParam,
        --            tbAwards = {
        --                { szName = "Ch©n Vâ Hån Th¹ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
        --                { szName = "BÝ ®iÓn 25%", tbProp = {2,1,40047 }, nStack = 100, nStatus = 4 },
        --                { szName = "Linh Ph¸ch §¬n", tbProp = { 2, 1, 31239 }, nStack = 4, nStatus = 4 },
        --                { szName = "LÖnh bµi cèng hiÕn bang béi", tbProp = { 2, 1, 30914 }, nStack = 5, nStatus = 4 },
        --                { szName = "Bïa c­êng hãa 12", tbProp = {  2, 1, 30424 }, nStack = 10, nStatus = 4 },
        --                { szName = "C­êng Hãa QuyÓn 13", tbProp = { 2, 1, 30425 }, nStack = 10, nStatus = 4 },
        --            },
        --            tbConditions = {
        --                nLevelReq = 1095,
        --                nRoomReq = 11,
        --                bJoinRouteReq = WEnv.TRUE,
        --            },
        --        },
        --    },
        --},
        --[16] = {
        --    nTaskId = WTASKID_LEVEL_AWARD_BIT,
        --    nTaskBitId = WTASKID_LEVEL_AWARD_BIT_LV1096,
        --    tbAwardDef = {
        --        [1] = {
        --            szName = "NhËn th­ëng ®¹t chuyÓn sinh 10 cÊp 96",
        --            fnPrepareParam = _w_newbieaward_PrepareParam,
        --            tbAwards = {
        --                { szName = "100 m¶nh C¬ Quan mÆc Gia", tbProp = { 2, 1, 31244  }, nStack = 100, nStatus = 4 },
        --                { szName = "Håi tiªn ®¬n", tbProp = {2,1,30847 }, nStack = 20, nStatus = 4 },
        --                { szName = "Linh Ph¸ch §¬n", tbProp = { 2, 1, 31239 }, nStack = 5, nStatus = 4 },
        --                { szName = "Tói ®¸ quý cÊp 7", tbProp = { 2, 1, 31505}, nStack = 2, nStatus = 4 },
        --                { szName = "2 Th­¬ng H¶i Di Ch©u 5",nFunc = "_w_newbie_Give_ThuongHaiDiChau(5, 2)" },
        --            },
        --            tbConditions = {
        --                nLevelReq = 1096,
        --                nRoomReq = 11,
        --                bJoinRouteReq = WEnv.TRUE,
        --            },
        --        },
        --    },
        --},
        --[17] = {
        --    nTaskId = WTASKID_LEVEL_AWARD_BIT,
        --    nTaskBitId = WTASKID_LEVEL_AWARD_BIT_LV1097,
        --    tbAwardDef = {
        --        [1] = {
        --            szName = "NhËn th­ëng ®¹t chuyÓn sinh 10 cÊp 97",
        --            fnPrepareParam = _w_newbieaward_PrepareParam,
        --            tbAwards = {
        --                { szName = "200 m¶nh C¬ Quan mÆc Gia", tbProp = { 2, 1, 31244  }, nStack = 200, nStatus = 4 },
        --                { szName = "Håi tiªn ®¬n", tbProp = {2,1,30847 }, nStack = 30, nStatus = 4 },
        --                { szName = "Linh Ph¸ch §¬n", tbProp = { 2, 1, 31239 }, nStack = 10, nStatus = 4 },
        --                { szName = "Tói ®¸ quý cÊp 7", tbProp = { 2, 1, 31505 }, nStack = 2, nStatus = 4 },
        --                { szName = "2 Th­¬ng H¶i Di Ch©u 5",nFunc = "_w_newbie_Give_ThuongHaiDiChau(5, 2)" },
        --            },
        --            tbConditions = {
        --                nLevelReq = 1097,
        --                nRoomReq = 11,
        --                bJoinRouteReq = WEnv.TRUE,
        --            },
        --        },
        --    },
        --},
        --[18] = {
        --    nTaskId = WTASKID_LEVEL_AWARD_BIT,
        --    nTaskBitId = WTASKID_LEVEL_AWARD_BIT_LV1098,
        --    tbAwardDef = {
        --        [1] = {
        --            szName = "NhËn th­ëng ®¹t chuyÓn sinh 10 cÊp 98",
        --            fnPrepareParam = _w_newbieaward_PrepareParam,
        --            tbAwards = {
        --                { szName = "500 m¶nh C¬ Quan mÆc Gia", tbProp = { 2, 1, 31244  }, nStack = 500, nStatus = 4 },
        --                { szName = "Håi tiªn ®¬n", tbProp = {2,1,30847 }, nStack = 30, nStatus = 4 },
        --                { szName = "Linh Ph¸ch §¬n", tbProp = { 2, 1, 31239 }, nStack = 10, nStatus = 4 },
        --                { szName = "Tói ®¸ quý cÊp 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 4 },
        --                { szName = "5 Th­¬ng H¶i Di Ch©u 5",nFunc = "_w_newbie_Give_ThuongHaiDiChau(5, 5)"},
        --            },
        --            tbConditions = {
        --                nLevelReq = 1098,
        --                nRoomReq = 11,
        --                bJoinRouteReq = WEnv.TRUE,
        --            },
        --        },
        --    },
        --},
        --[19] = {
        --    nTaskId = WTASKID_LEVEL_AWARD_BIT,
        --    nTaskBitId = WTASKID_LEVEL_AWARD_BIT_LV1099,
        --    tbAwardDef = {
        --        [1] = {
        --            szName = "NhËn th­ëng ®¹t chuyÓn sinh 10 cÊp 99",
        --            fnPrepareParam = _w_newbieaward_PrepareParam,
        --            tbAwards = {
        --                { szName = "500 m¶nh C¬ Quan mÆc Gia", tbProp = { 2, 1, 31244  }, nStack = 500, nStatus = 4 },
        --                { szName = "Håi tiªn ®¬n", tbProp = {2,1,30847 }, nStack = 50, nStatus = 4 },
        --                { szName = "Linh Ph¸ch §¬n", tbProp = { 2, 1, 31239 }, nStack = 15, nStatus = 4 },
        --                { szName = "Tói ®¸ quý cÊp 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 4 },
        --                { szName = "5 Th­¬ng H¶i Di Ch©u 5",nFunc = "_w_newbie_Give_ThuongHaiDiChau(5, 5)" },
        --                { szName = "90 Hãa M¹ch C¶nh",nFunc = "_w_newbie_Give_HoaCanh(90)"},
        --            },
        --            tbConditions = {
        --                nLevelReq = 1099,
        --                nRoomReq = 11,
        --                bJoinRouteReq = WEnv.TRUE,
        --            },
        --        },
        --    },
        --},
    },
    tbAwardDef_bk = {
        [1] = {
            szName = "NhËn th­ëng ®¹t cÊp 73",
            fnPrepareParam = _w_newbieaward_PrepareParam,
            tbAwards = {
                --{ szName = "Trùc tiÕp chuyÓn sinh 7 cÊp 98", nFunc = "_w_newbieaward_UpLevel(798, param1)" },
                --{ szName = "ThÇn hµnh b¶o ®iÓn", tbProp = { 0, 200, 40 }, nStack = 1, nStatus = 4 },
                --{ szName = "Bét Tr©n Ch©u", tbProp = { 2, 102, 215 }, nStack = 200, nStatus = 4 },
                --{ szName = "1 bé Háa Phông T­íng+0", nFunc = "_w_newbieaward_GiveBattleSuit(1, 0, param2)" },
                --{ szName = "Tói §¸ Quý CÊp 3", tbProp = { 2, 1, 31000 }, nStack = 20, nStatus = 4 },
                --{ szName = "KÝch ho¹t kinh m¹ch Vâ T«n", nFunc = "KsgPlayer:MeridianLevelUp(4)" },
                --{ szName = "1 bé v¨n søc cÊp 2+0", nFunc = "KsgAward:SetVanSuc(2)" },
                --{ szName = "1 bé DiÖu D­¬ng+0", nFunc = "KsgAward:SetDieuDuong(0, 4)" },
                --{ szName = "1 bé V« H¹ Hµo HiÖp+0", nFunc = "KsgAward:SetLenhBaiVoHaHaoHiep(0)" },
                --{ szName = "3 bé Kim xµ 4+0", nFunc = "kgm_NhanKimXa(4, 0)" },
                --{ szName = "1 MËt tÞch 70 siªu cÊp luyÖn s½n 10t 4pl 95%", nFunc = "_w_book_AddBookByType(1,5,10,4,95,95,95,95)" },
                --{ szName = "M¶nh MËt TÞch Cao CÊp", tbProp = { 2, 1, 40026 }, nStack = 30, nStatus = 4 },
                --{ szName = "R­¬ng YÕu QuyÕt_S¬", tbProp = { 2, 1, 50005 }, nStack = 2, nStatus = 4 },
                { szName = "L¨ng Ba Vi Bé toµn tËp", tbProp = { 0, 112, 158 }, nStack = 1, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 73,
                nRoomReq = 1 + 1 + 7 + 1 + 1 + 5 + 6 + 9 + 1 + 9 + 1 + 1 + 1,
                bJoinRouteReq = WEnv.TRUE,
            },
        },
        [2] = {
            szName = "NhËn th­ëng ®¹t chuyÓn sinh 7 cÊp 99",
            fnPrepareParam = _w_newbieaward_PrepareParam,
            tbAwards = {
                --{ szName = "Trùc tiÕp chuyÓn sinh 8 cÊp 95", nFunc = "_w_newbieaward_UpLevel(895, param1)" },
                --{ szName = "ThiÕt Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 200, nStatus = 4 },
                --{ szName = "Bét Tr©n Ch©u", tbProp = { 2, 102, 215 }, nStack = 300, nStatus = 4 },
                --{ szName = "Tói §¸ Quý CÊp 4", tbProp = { 2, 1, 31001 }, nStack = 10, nStatus = 4 },
                --{ szName = "§ång TÕ Chi NguyÖn", tbProp = { 2, 1, 30913 }, nStack = 30, nStatus = 4 },
                --{ szName = "HiÖp NghÜa Chi Chøng", tbProp = { 2, 1, 30912 }, nStack = 200, nStatus = 4 },
                --{ szName = "Håi Tiªn §¬n", tbProp = { 2, 1, 30847 }, nStack = 200, nStatus = 4 },
                --{ szName = "Ch©n Vâ Hån Th¹ch", tbProp = { 2, 114, 143 }, nStack = 2, nStatus = 4 },
                --{ szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 1, nStatus = 4 },
                { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 799,
                nRoomReq = 9,
                bJoinRouteReq = WEnv.TRUE,
            },
        },
        [3] = {
            szName = "NhËn th­ëng ®¹t chuyÓn sinh 8 cÊp 99",
            fnPrepareParam = _w_newbieaward_PrepareParam,
            tbAwards = {
                --{ szName = "Trùc tiÕp chuyÓn sinh 9 cÊp 95", nFunc = "_w_newbieaward_UpLevel(995, param1)" },
                --{ szName = "ThiÕt Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 200, nStatus = 4 },
                --{ szName = "Bét Tr©n Ch©u", tbProp = { 2, 102, 215 }, nStack = 300, nStatus = 4 },
                --{ szName = "Tói §¸ Quý CÊp 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                --{ szName = "§ång TÕ Chi NguyÖn", tbProp = { 2, 1, 30913 }, nStack = 30, nStatus = 4 },
                --{ szName = "HiÖp NghÜa Chi Chøng", tbProp = { 2, 1, 30912 }, nStack = 200, nStatus = 4 },
                --{ szName = "Håi Tiªn §¬n", tbProp = { 2, 1, 30847 }, nStack = 200, nStatus = 4 },
                --{ szName = "Ch©n Vâ Hån Th¹ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                --{ szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 4 },
                { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 899,
                nRoomReq = 9,
            },
        },
        [4] = {
            szName = "NhËn th­ëng ®¹t chuyÓn sinh 9 cÊp 99",
            fnPrepareParam = _w_newbieaward_PrepareParam,
            tbAwards = {
                --{ szName = "Trùc tiÕp chuyÓn sinh 10 cÊp 90", nFunc = "_w_newbieaward_UpLevel(1090, param1)" },
                --{ szName = "ThiÕt Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 200, nStatus = 4 },
                --{ szName = "Bét Tr©n Ch©u", tbProp = { 2, 102, 215 }, nStack = 500, nStatus = 4 },
                --{ szName = "Tói §¸ Quý CÊp 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                --{ szName = "§ång TÕ Chi NguyÖn", tbProp = { 2, 1, 30913 }, nStack = 30, nStatus = 4 },
                --{ szName = "HiÖp NghÜa Chi Chøng", tbProp = { 2, 1, 30912 }, nStack = 100, nStatus = 4 },
                --{ szName = "Håi Tiªn §¬n", tbProp = { 2, 1, 30847 }, nStack = 50, nStatus = 4 },
                --{ szName = "Ch©n Vâ Hån Th¹ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                --{ szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 4 },
                { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 999,
                nRoomReq = 9,
            },
        },
        [5] = {
            szName = "NhËn th­ëng ®¹t chuyÓn sinh 10 cÊp 95",
            tbAwards = {
                { szName = "Ch©n Vâ Hån Th¹ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "BÝ ®iÓn 25%", tbProp = {2,1,40047 }, nStack = 1, nStatus = 4 },
                { szName = "Linh Ph¸ch §¬n", tbProp = { 2, 1, 31239 }, nStack = 4, nStatus = 4 },
                { szName = "LÖnh bµi cèng hiÕn bang béi", tbProp = { 2, 1, 30914 }, nStack = 5, nStatus = 4 },
                { szName = "Bïa c­êng hãa 12", tbProp = {  2, 1, 30424 }, nStack = 10, nStatus = 4 },
                { szName = "C­êng Hãa QuyÓn 13", tbProp = { 2, 1, 30425 }, nStack = 10, nStatus = 4 },
                { szName = "M¶nh Kim Xµ 6", tbProp = { 2, 1, 31384 }, nStack = 50, nStatus = 4 },
                --
                --{ szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 4 },
                --{ szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = 4 },
                --{ szName = "Th­¬ng H¶i Ch©u CÊp 7 (Ch­a gi¸m ®Þnh)", tbProp = { 2, 102, 214 }, nStack = 1, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 1095,
                nRoomReq = 11,
            },
        },
        [6] = {
            szName = "NhËn th­ëng ®¹t chuyÓn sinh 10 cÊp 96",
            tbAwards = {
                { szName = "M¶nh C¬ Quan MÆc Gia", tbProp = { 2, 1, 31244 }, nStack = 100, nStatus = 4 },
                { szName = "Trøng Thó C­ng-Siªu", tbProp = { 2, 1, 31169 }, nStack = 5, nStatus = 4 },
                { szName = "Bét Tr©n Ch©u", tbProp = { 2, 102, 215 }, nStack = 500, nStatus = 4 },
                { szName = "Tói §¸ Quý CÊp 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                { szName = "ThiÕt Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 50, nStatus = 4 },
                { szName = "§ång TÕ Chi NguyÖn", tbProp = { 2, 1, 30913 }, nStack = 50, nStatus = 4 },
                { szName = "Håi Tiªn §¬n", tbProp = { 2, 1, 30847 }, nStack = 50, nStatus = 4 },
                { szName = "Ch©n Vâ Hån Th¹ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 1, nStatus = 4 },
                { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = 4 },
                { szName = "Th­¬ng H¶i Ch©u CÊp 7 (Ch­a gi¸m ®Þnh)", tbProp = { 2, 102, 214 }, nStack = 1, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 1096,
                nRoomReq = 11,
            },
        },
        [7] = {
            szName = "NhËn th­ëng ®¹t chuyÓn sinh 10 cÊp 97",
            tbAwards = {
                { szName = "M¶nh C¬ Quan MÆc Gia", tbProp = { 2, 1, 31244 }, nStack = 200, nStatus = 4 },
                { szName = "Trøng Thó C­ng-Siªu", tbProp = { 2, 1, 31169 }, nStack = 5, nStatus = 4 },
                { szName = "Bét Tr©n Ch©u", tbProp = { 2, 102, 215 }, nStack = 500, nStatus = 4 },
                { szName = "Tói §¸ Quý CÊp 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                { szName = "ThiÕt Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 50, nStatus = 4 },
                { szName = "HiÖp NghÜa Chi Chøng", tbProp = { 2, 1, 30912 }, nStack = 50, nStatus = 4 },
                { szName = "Håi Tiªn §¬n", tbProp = { 2, 1, 30847 }, nStack = 50, nStatus = 4 },
                { szName = "Ch©n Vâ Hån Th¹ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 1, nStatus = 4 },
                { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = 4 },
                { szName = "Th­¬ng H¶i Ch©u CÊp 7 (Ch­a gi¸m ®Þnh)", tbProp = { 2, 102, 214 }, nStack = 2, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 1097,
                nRoomReq = 11,
            },
        },
        [8] = {
            szName = "NhËn th­ëng ®¹t chuyÓn sinh 10 cÊp 98",
            tbAwards = {
                { szName = "M¶nh C¬ Quan MÆc Gia", tbProp = { 2, 1, 31244 }, nStack = 200, nStatus = 4 },
                { szName = "Trøng Thó C­ng-Siªu", tbProp = { 2, 1, 31169 }, nStack = 5, nStatus = 4 },
                { szName = "Bét Tr©n Ch©u", tbProp = { 2, 102, 215 }, nStack = 500, nStatus = 4 },
                { szName = "Tói §¸ Quý CÊp 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                { szName = "ThiÕt Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 50, nStatus = 4 },
                { szName = "HiÖp NghÜa Chi Chøng", tbProp = { 2, 1, 30912 }, nStack = 100, nStatus = 4 },
                { szName = "Håi Tiªn §¬n", tbProp = { 2, 1, 30847 }, nStack = 50, nStatus = 4 },
                { szName = "Ch©n Vâ Hån Th¹ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 1, nStatus = 4 },
                { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = 4 },
                { szName = "Th­¬ng H¶i Ch©u CÊp 7 (Ch­a gi¸m ®Þnh)", tbProp = { 2, 102, 214 }, nStack = 5, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 1098,
                nRoomReq = 11,
            },
        },
        [9] = {
            szName = "NhËn th­ëng ®¹t chuyÓn sinh 10 cÊp 99",
            tbAwards = {
                { szName = "Håi Méng §¬n", tbProp = { 2, 1, 31260 }, nStack = 1, nStatus = 4 },
                { szName = "M¶nh C¬ Quan MÆc Gia", tbProp = { 2, 1, 31244 }, nStack = 1000, nStatus = 1 },
                { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 1 },
                { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = 1 },
                { szName = "Th­¬ng H¶i Ch©u CÊp 7 (Ch­a gi¸m ®Þnh)", tbProp = { 2, 102, 225 }, nStack = 5, nStatus = 1 },
                { szName = "H¾c B¹ch Kú", tbProp = { 2, 1, 31168 }, nStack = 2, nStatus = 4 },
                { szName = "90 Hãa M¹ch C¶nh",szFunc = "_w_newbie_Give_HoaCanh(90)" },
            },
            tbConditions = {
                nLevelReq = 1099,
                nRoomReq = 6,
            },
        },
    },
    nAwardGiveStatusTaskId = WTASKID_NEWBIE_AWARD_GIVE_STATUS,
};

----------------------------------------------------------------------------------------------------
--- Lib functions: c¸c hµm cña th­ viÖn

---KiÓm tra ®iÒu kiÖn cña nh©n vËt, khai b¸o ë tbTopDef[nType].tbAwar®ef[nAwardIdx].tbCondition
---@param nType number ID lo¹i phÇn th­ëng
---@param nAwardIdx table ID phÇn thu­ëng
---@return number, table return1 number: WEnv.TRUE ®· ®ñ ®iÒu kiÖn nhËn, WEnv.FALSE ch­a ®ñ ®k nhËn; return2 table: c¸c ®iÒu kiÖn
function WNewbieAward:GetAwardCondition(nType, nAwardIdx)
    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local tbAwardCondition = tbAwardDef[nAwardIdx].tbConditions or {};

    -- KiÓm tra level
    local tbCheckInfo = {};
    local nRetCode = enumWNewbieAwardStatusCode.AWARD_CAN_GET;

    -- KiÓm tra cÊp ®é
    if tbAwardCondition.nLevelReq and tbAwardCondition.nLevelReq > 0 then
        local nPlayerLevel = WPlayer:GetBigLevel();
        if tbAwardCondition.nLevelReq > nPlayerLevel then
            tinsert(tbCheckInfo, format("<color=red>§¹t %s<color>", WLib:Level2String(tbAwardCondition.nLevelReq)));
            nRetCode = enumWNewbieAwardStatusCode.AWARD_REQ_LEVEL;
        else
            tinsert(tbCheckInfo, format("<color=green>§¹t %s<color>", WLib:Level2String(tbAwardCondition.nLevelReq)));
        end
    end

    -- KiÓm tra gia nhËp m«n ph¸i
    if tbAwardCondition.bJoinRouteReq and tbAwardCondition.bJoinRouteReq == WEnv.TRUE then
        if WPlayer:IsJoinedRoute() ~= WEnv.TRUE then
            tinsert(tbCheckInfo, "<color=red>Gia nhËp m«n ph¸i<color>");
            nRetCode = enumWNewbieAwardStatusCode.AWARD_REQ_JOIN_ROUTE;
        else
            tinsert(tbCheckInfo, "<color=green>Gia nhËp m«n ph¸i<color>");
        end
    end
    
    -- KiÓm tra qu©n c«ng
    if tbAwardCondition.nMeritReq and tbAwardCondition.nMeritReq > 0 then
        if tbAwardCondition.nMeritReq > WPlayer:GetHonor() then
            tinsert(tbCheckInfo, format("<color=red>§¹t c«ng tr¹ng %s<color>", WLib:MoneyFormat(tbAwardCondition.nMeritReq)));
            nRetCode = enumWNewbieAwardStatusCode.AWARD_REQ_MERIT;
        else
            tinsert(tbCheckInfo, format("<color=green>§¹t c«ng tr¹ng %s<color>", WLib:MoneyFormat(tbAwardCondition.nMeritReq)));
        end
    end

    -- KiÓm tra søc lùc
    if tbAwardCondition.nRoomReq and tbAwardCondition.nRoomReq > 0 then
        if WLib:CheckInv(tbAwardCondition.nRoomReq + 3, 1000, WEnv.FALSE) ~= WEnv.TRUE then
            tinsert(tbCheckInfo, format("<color=red>Hµnh trang %d «<color>", tbAwardCondition.nRoomReq));
            tinsert(tbCheckInfo, "<color=red>Søc lùc 1000<color>");
            nRetCode = enumWNewbieAwardStatusCode.AWARD_REQ_ROOM;
        else
            tinsert(tbCheckInfo, format("<color=green>Hµnh trang %d «<color>", tbAwardCondition.nRoomReq));
            tinsert(tbCheckInfo, "<color=green>Søc lùc 1000<color>");
        end
    end


    return nRetCode, tbCheckInfo;
end

---LÊy ra c¸c tªn phÇn th­ëng ®­îc khai b¸o ë tbTopDef[nType].tbAwar®ef[nAwardIdx].szName
---@param nType number ID lo¹i phÇn th­ëng
---@param nAwardIdx table ID phÇn thu­ëng
function WNewbieAward:GetAwardItemName(nType, nAwardIdx)
    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local tbAwardItem = tbAwardDef[nAwardIdx].tbAwards;
    ---KiªÓm tra ®¸nh gi¸ qu©n haµm

    -- LÊy th«ng tin phÇn th­ëng
    local tbAwardItemName = {};
    for nItemDefineIdx = 1, getn(tbAwardItem) do
        if tbAwardItem[nItemDefineIdx] ~= WEnv.NULL then
            if type(tbAwardItem[nItemDefineIdx].tbProp) == 'table' then
                if type(tbAwardItem[nItemDefineIdx].szName) == "string" then
                    tinsert(tbAwardItemName, format("%d %s", tbAwardItem[nItemDefineIdx].nStack, tbAwardItem[nItemDefineIdx].szName));
                else
                    tinsert(tbAwardItemName, format("%d %s", tbAwardItem[nItemDefineIdx].nStack, WItem:GetName(tbAwardItem[nItemDefineIdx].tbProp)));
                end
            else
                tinsert(tbAwardItemName, tbAwardItem[nItemDefineIdx].szName);
            end
        end
    end
    return tbAwardItemName;
end

---HiÓn thÞ danh s¸ch ng­êi nhËn th­ëng
---@param nType number ID lo¹i phÇn th­ëng
function WNewbieAward:ShowAwardList(nType)
    nType = tonumber(nType) or 0;
    
    local tbSay = { "KiÓm tra c¸c phÇn quµ hÊp hÉn" };

    if getn(self.tbTopDef) == 1 then
        nType = 1;
    end

    if nType == 0 then
        for k, v in pairs(self.tbTopDef) do
            if getn(v.tbAwardDef) == 1 then
                tinsert(tbSay, format("%s/#WNewbieAward:ShowAwardList(%d)", v.tbAwardDef[1].szName, k));
            else
                tinsert(tbSay, format("%s/#WNewbieAward:ShowAwardList(%d)", v.szName, k));
            end
        end

        tinsert(tbSay, "\nTa chØ xem qua th«i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    if self.tbTopDef[nType] == WEnv.NULL then
        return WEnv.RETCODE_ERROR;
    end
    
    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;

    if getn(tbAwardDef) == 1 then
        self:ShowAwardInfo(nType, 1);
        return WEnv.RETCODE_SUCCESS;
    end

    local tbAwardHasGet = {};
    for nAwardIdx = 1, getn(tbAwardDef) do
        if tbAwardDef[nAwardIdx] ~= WEnv.NULL then
            local szGiveStatus = "(chän ®Ó xem chi tiÕt)";
            local nCheckCode, tbCheckInfo = self:GetAwardCondition(nType, nAwardIdx)
            if nCheckCode == enumWNewbieAwardStatusCode.AWARD_CAN_GET then
                szGiveStatus = "(cã thÓ nhËn)";
            elseif nCheckCode == enumWNewbieAwardStatusCode.AWARD_HAS_GET then
                szGiveStatus = "(®· nhËn)";
            elseif nCheckCode == enumWNewbieAwardStatusCode.AWARD_NEED_GET_BEFORE then
                szGiveStatus = "(cÇn nhËn quµ tr­íc ®ã)";
            end
            if nCheckCode == enumWNewbieAwardStatusCode.AWARD_HAS_GET then
                tinsert(tbAwardHasGet, format("%s %s/#WNewbieAward:ShowAwardInfo(%d)", tbAwardDef[nAwardIdx].szName, szGiveStatus, nType, nAwardIdx));
            elseif nCheckCode == enumWNewbieAwardStatusCode.AWARD_CAN_GET then
                tinsert(tbSay, format("%s %s/#WNewbieAward:ShowAwardInfo(%d)", tbAwardDef[nAwardIdx].szName, szGiveStatus, nType, nAwardIdx));
            elseif nCheckCode ~= enumWNewbieAwardStatusCode.AWARD_NOT_AVAILABLE then
                tinsert(tbSay, format("%s %s/#WNewbieAward:ShowAwardInfo(%d)", tbAwardDef[nAwardIdx].szName, szGiveStatus, nType, nAwardIdx));
            end
        end
    end

    local nTotalReadyGet = getn(tbAwardHasGet);
    for nAwardIdx = 1, nTotalReadyGet do
        tinsert(tbSay, tbAwardHasGet[nAwardIdx]);
    end

    tinsert(tbSay, "\nTa chØ xem qua th«i./nothing");
    WNpc:SayDialog(tbSay);
end

---HiÓn thÞ chi tiÕt phÇn th­ëng
---@param nType number ID lo¹i phÇn th­ëng
---@param nAwardIdx table ID phÇn thu­ëng
function WNewbieAward:ShowAwardInfo(nType, nAwardIdx)
    nType = tonumber(nType) or 0;
    nAwardIdx = tonumber(nAwardIdx) or 0;

    if nType == 0 or nAwardIdx == 0 then
        return WEnv.RETCODE_NOTOPEN;
    end

    -- KiÓm tra phÇn th­ëng kh«ng cßn n÷a
    if self.tbTopDef[nType] == WEnv.NULL or self.tbTopDef[nType].tbAwardDef == WEnv.NULL then
        local tbSay = { "PhÇn th­ëng nµy ®· hÕt h¹n hoÆc kh«ng cßn xuÊt hiÖn trªn giang hå n÷a!" };
        tinsert(tbSay, "Ta ®· hiÓu råi./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- LÊy th«ng tin phÇn th­ëng
    local nCheckCode, tbCheckInfo = self:GetAwardCondition(nType, nAwardIdx);
    local tbAwardItemName = self:GetAwardItemName(nType, nAwardIdx);

    -- HiÓn thÞ ®iÒu kiÖn vµ trao th­ëng
    local tbSay = {};
    tinsert(tbSay, format("%s/#%s:ShowAwardList()", "Xem l¹i danh s¸ch nhËn th­ëng", self.szClassName));
    tinsert(tbSay, format("%s/nothing", "Ta chØ xem qua th«i."));

    local tbSayTitleInfoLines = {};
    local szAwardStatus = "";

    if WTask:GetBit(self.tbTopDef[nType].nTaskId, self.tbTopDef[nType].nTaskBitId) == 1 then
        szAwardStatus = "(<color=white>®· nhËn<color>)";
    else
        if nCheckCode == enumWNewbieAwardStatusCode.AWARD_CAN_GET then
            szAwardStatus = "(<color=green>cã thÓ nhËn<color>)";
            tinsert(tbSay, 1, format("\nNhËn th­ëng/#%s:GiveAward(%d, %d)", self.szClassName, nType, nAwardIdx));
        else
            szAwardStatus = "(<color=red>ch­a ®¹t yªu cÇu<color>)";
        end
        tbSayTitleInfoLines[3] = format("\nYªu cÇu mµu ®á lµ ch­a ®¹t: \n%s", WLib:Join(tbCheckInfo, ", "));
    end

    tbSayTitleInfoLines[1] = format("<color=green>%s %s<color>", self.tbTopDef[nType].tbAwardDef[nAwardIdx].szName, szAwardStatus);
    tbSayTitleInfoLines[2] = format("<color=yellow>%s<color>", WLib:Join(tbAwardItemName, "<color>, <color=yellow>"));

    -- ChÌn header lªn ®Çu tbSay
    tinsert(tbSay, 1, WLib:Join(tbSayTitleInfoLines, "\n"));
    WNpc:SayDialog(tbSay);
end

---Trao phÇn th­ëng
---@param nType number ID lo¹i phÇn th­ëng
---@param nAwardIdx table ID phÇn thu­ëng
---@param arg table Tham sè thªm kh«ng b¾t buéc, kÕt hîp víi tbTopDef[nType].tbAwar®ef[nAwardIdx].fnPrepareParam lùa chän g× ®ã ®Ó cã tham sè ®Çu vµo cô thÓ cña hµm nhËn th­ëng
function WNewbieAward:GiveAward(nType, nAwardIdx, ...)
    nType = tonumber(nType) or 0;
    nAwardIdx = tonumber(nAwardIdx) or 0;
    if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
        return Talk(1, '', GetName()..' h·y tham gia ®¸nh gi¸ qu©n hµm, nhËn qu©n c«ng qu©n hµm tuÇn nµy vµ ®æi míi qu©n hµm. Sau ®ã míi cã thÓ nhËn th­ëng ®­îc!.');
    end

    if nType == 0 or nAwardIdx == 0 then
        return WEnv.RETCODE_NOTOPEN;
    end

    --WNpc:Talk("PhÇn th­ëng nµy t¹m thêi ch­a thÓ nhËn!");
    --do return WEnv.RETCODE_NOTOPEN; end

    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local szAwardName = tbAwardDef[nAwardIdx].szName;
    local tbAwardItem = tbAwardDef[nAwardIdx].tbAwards;
    local nCheckCode, tbCheckInfo = self:GetAwardCondition(nType, nAwardIdx);

    -- KiÓm tra phÇn th­ëng kh«ng cßn n÷a
    if self.tbTopDef[nType] == WEnv.NULL or tbAwardDef[nAwardIdx] == WEnv.NULL then
        local tbSay = { "PhÇn th­ëng nµy ®· hÕt h¹n hoÆc kh«ng cßn xuÊt hiÖn trªn giang hå n÷a!" };
        tinsert(tbSay, "Ta ®· hiÓu råi./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- KiÓm tra ®· nhËn råi ch­a
    if WTask:GetBit(self.tbTopDef[nType].nTaskId, self.tbTopDef[nType].nTaskBitId) ~= 0 then
        local tbSay = { "<sex> ®· nhËn phÇn th­ëng nµy tr­íc ®ã råi kh«ng thÓ nhËn thªm!" };
        tinsert(tbSay, "Ta ®· hiÓu råi./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- KiÓm tra hîp lÖ
    if nCheckCode ~= enumWNewbieAwardStatusCode.AWARD_CAN_GET then
        local tbSay = { "B¹n kh«ng ®¹t ®iÒu kiÖn nhËn th­ëng mµu ®á d­íi ®©y: \n" .. WLib:Join(tbCheckInfo, ", ") };
        tinsert(tbSay, "Ta ®· hiÓu råi./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- Setup param cho quµ d¹ng fnFunc
    if type(tbAwardDef[nAwardIdx].fnPrepareParam) == "function" and getn(arg) == 0 then
        tbAwardDef[nAwardIdx].fnPrepareParam(nType, nAwardIdx);
        return WEnv.RETCODE_NEEDCONFIRM;
    end
    local tbAwardNew = new(tbAwardItem);
    for k, v in pairs(tbAwardNew) do
        if k ~= "n" and v ~= WEnv.NULL and v.nFunc ~= WEnv.NULL then
            for i = 1, getn(arg) do
                v.nFunc = WLib:Replace(v.nFunc, "param" .. i, arg[i]);
            end
        end
    end

    -- L­u phÇn th­ëng ®· nhËn råi
    WTask:SetBit(self.tbTopDef[nType].nTaskId, self.tbTopDef[nType].nTaskBitId, 1);

    -- NhËn quµ
    local nRetCode = WAward:Give(tbAwardNew, szAwardName);
    if nRetCode == WEnv.RETCODE_SUCCESS then
    else
        WNpc:Talk("NhËn th­ëng thÊt b¹i, vui lßng liªn hÖ admin!", WEnv.TRUE);
    end
    return nRetCode;
end

function WNewbieAward:GetOnlineAward(nOnlineMin)
    local nToday = WDate:Today();
    if m_tbTetAward[nToday] == WEnv.NULL 
        or m_tbTetAward[nToday][nOnlineMin] == WEnv.NULL
    then
        return WEnv.RETCODE_NOTOPEN;
    end

    if WTask:GetBit(WTASKID_TREO_ONLINE_NHAN_THUONG_BIT, m_tbTetAward[nToday][nOnlineMin].nBit) ~= 0 then
        WNpc:Talk("<sex> ®· nhËn phÇn th­ëng nµy råi, kh«ng thÓ nhËn thªm!!");
        return WEnv.RETCODE_DENY;
    end

    if WTask:Get(WTASKID_TREO_ONLINE_MIN_DAILY_COUNT) >= nOnlineMin then
        WTask:SetBit(WTASKID_TREO_ONLINE_NHAN_THUONG_BIT, m_tbTetAward[nToday][nOnlineMin].nBit, 1);
        WAward:Give(m_tbTetAward[nToday][nOnlineMin].tbAward);
        WPlayer:Msg("NhËn th­ëng online thµnh c«ng!");
    else
        WPlayer:Msg(format("Cßn %d phót n÷a míi cã thÓ nhËn phÇn th­ëng nµy!", abs(nOnlineMin - WTask:Get(WTASKID_TREO_ONLINE_MIN_DAILY_COUNT))));
    end
end

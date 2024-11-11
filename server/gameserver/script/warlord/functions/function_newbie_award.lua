----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-08-17
--- Description: qu� th�ng c�p v� m�t s� h�m cho ng��i ch�i m�i
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
            local tbSay = { "H�y ch�n h��ng chuy�n sinh ph� h�p:" };
            for _nRebornRoute, _szRouteName in g_tbRebornRouteNames do
                tinsert(tbSay, format("Chuy�n sinh theo h��ng %s/#_w_newbieaward_UpLevel(%d, %d)", _szRouteName, nBigLevel, _nRebornRoute));
            end

            tinsert(tbSay, "\nT�m th�i ch�a mu�n nh�n./nothing");
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
            local tbSay = { "H�y ch�n phe chi�n tr��ng:" };
            tinsert(tbSay, format("Gia nh�p v� nh�n trang b� phe %s/#_w_newbieaward_GiveBattleSuit(%d, %d)", WEnv.BATTLECAMP_NAMES[WEnv.BATTLECAMP_TONG], nEnhanceLevel, WEnv.BATTLECAMP_TONG));
            tinsert(tbSay, format("Gia nh�p v� nh�n trang b� phe %s/#_w_newbieaward_GiveBattleSuit(%d, %d)", WEnv.BATTLECAMP_NAMES[WEnv.BATTLECAMP_LIEU], nEnhanceLevel, WEnv.BATTLECAMP_LIEU));

            tinsert(tbSay, "\nT�m th�i ch�a mu�n nh�n./nothing");
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

--- H�m l�a ch�n cho ph�n th��ng nFunc, nAwardIdx l� param0
--- c�c param replace n�y ��u ki�u string, l�u � ��i l�i trong h�m x� l� c�a t�ng h�m ph�n th��ng
function _w_newbieaward_PrepareParam(nAwardIdx, nRebornRoute, nBattleCamp)
    --- param1
    if nRebornRoute == WEnv.NULL then
        local tbSay = { "H�y ch�n h��ng chuy�n sinh ph� h�p:" };
        for _nRebornRoute, _szRouteName in g_tbRebornRouteNames do
            tinsert(tbSay, format("Chuy�n sinh theo h��ng %s/#WNewbieAward.tbAwardDef[%d].fnPrepareParam(%d, %d)", _szRouteName, nAwardIdx, nAwardIdx, _nRebornRoute));
        end

        tinsert(tbSay, "\nT�m th�i ch�a mu�n nh�n./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_NEEDCONFIRM;
    end

    --- param2
    if nBattleCamp == WEnv.NULL then
        local nCampPoint = WPlayer:GetHonor(WEnv.TRUE);
        if nCampPoint == 0 then
            local tbSay = { "H�y ch�n phe chi�n tr��ng:" };
            tinsert(tbSay, format("Gia nh�p phe %s/#WNewbieAward.tbAwardDef[%d].fnPrepareParam(%d, %d, %d)", WEnv.BATTLECAMP_NAMES[WEnv.BATTLECAMP_TONG], nAwardIdx, nAwardIdx, nRebornRoute, WEnv.BATTLECAMP_TONG));
            tinsert(tbSay, format("Gia nh�p phe %s/#WNewbieAward.tbAwardDef[%d].fnPrepareParam(%d, %d, %d)", WEnv.BATTLECAMP_NAMES[WEnv.BATTLECAMP_LIEU], nAwardIdx, nAwardIdx, nRebornRoute, WEnv.BATTLECAMP_LIEU));

            tinsert(tbSay, "\nT�m th�i ch�a mu�n nh�n./nothing");
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
        [1] = { szName = "��t 500,000 �i�m c�ng tr�ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_100K,
                tbAwardDef = {
                    [1] = {
                        szName = "��t 500,000 �i�m c�ng tr�ng",
                        tbAwards = {
                            { tbProp = { 2, 1, 30912 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Hi�p Ngh�a Chi Ch�ng
                            { tbProp = { 2, 1, 31402 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, --  t�y  T�m 7
                            { tbProp = { 2, 1, 31401 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� 7
                            { tbProp = { 2, 1, 1001 }, nStack = 1, nStatus = ITEMSTATUS_LOCK }, -- H�a Th� B�ch
                        },
                        tbConditions = {
                            nRoomReq = 2,
                            nMeritReq = 500000,
                        },
                    },
                }
        },
        [2] = { szName = "��t 1.000,000 �i�m c�ng tr�ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_200K,
                tbAwardDef = {
                    [1] = {
                        szName = "��t 1.000,000 �i�m c�ng tr�ng",
                        tbAwards = {
                            { nFunc = "_w_newbie_Give_ThanhLongTuong(0)" }, -- Thanh Long T��ng
                            { tbProp = { 2, 1, 30912 }, nStack = 1500, nStatus = ITEMSTATUS_LOCK }, -- Hi�p Ngh�a Chi Ch�ng
                            { tbProp = { 2, 1, 31402 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, --  t�y  T�m 7
                            { tbProp = { 2, 1, 31401 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� 7
                        },
                        tbConditions = {
                            nRoomReq = 6,
                            nMeritReq = 1000000,
                        },
                    },
                }
        },
        [3] = { szName = "��t 2.000,000 �i�m c�ng tr�ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_300K,
                tbAwardDef = {
                    [1] = {
                        szName = "��t 2.000,000 �i�m c�ng tr�ng",
                        tbAwards = {
                            { tbProp = { 2, 1, 30912 }, nStack = 300, nStatus = ITEMSTATUS_LOCK }, -- Hi�p Ngh�a Chi Ch�ng
                            { tbProp = { 2, 1, 31402 }, nStack = 40, nStatus = ITEMSTATUS_LOCK }, --  t�y  T�m 7
                            { tbProp = { 2, 1, 31401 }, nStack = 40, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� 7
                            { tbProp = { 2, 5, 204 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, --Thi�n Cang
                            { tbProp = { 2, 1, 30370 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- Thi�n M�n l�nh
                            { nFactionPoint = 1500 }, -- �i�m C�ng hi�n bang ph�i

                        },
                        tbConditions = {
                            nRoomReq = 1,
                            nMeritReq = 2000000,
                        },
                    },
                }
        },
        [4] = { szName = "��t 3,000,000 �i�m c�ng tr�ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_500K,
                tbAwardDef = {
                    [1] = {
                        szName = "��t 3000,000 �i�m  c�ng tr�ng",
                        tbAwards = {
                            { tbProp = { 2, 1, 30912 }, nStack = 5000, nStatus = ITEMSTATUS_LOCK }, -- Hi�p Ngh�a Chi Ch�ng
                            { tbProp = { 2, 1, 31402 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, --  t�y  T�m 7
                            { tbProp = { 2, 1, 31401 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� 7
                            { tbProp = { 2, 5, 204 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, --Thi�n Cang
                            { tbProp = { 2, 1, 30370 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Thi�n M�n l�nh
                            { tbProp = { 2, 1, 1001 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- H�a Th� B�ch
                            { nFactionPoint = 2000 }, -- �i�m C�ng hi�n bang ph�i
                            { tbProp = { 2, 1, 31122 }, nStack = 20 }, -- Linh Khi ruc ro
                        },
                        tbConditions = {
                            nRoomReq = 1,
                            nMeritReq = 3000000,
                        },
                    },
                }
        },
        [5] = { szName = "��t 4,000,000 �i�m c�ng tr�ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_1000K,
                tbAwardDef = {
                    [1] = {
                        szName = "��t 4,000,000 �i�m c�ng tr�ng",
                        tbAwards = {
                            { tbProp = { 2, 1, 30912 }, nStack = 6000, nStatus = ITEMSTATUS_LOCK }, -- Hi�p Ngh�a Chi Ch�ng
                            { tbProp = { 2, 1, 31122 }, nStack = 30 }, -- Linh Khi ruc ro
                            { tbProp = { 2, 1, 31402 }, nStack = 60, nStatus = ITEMSTATUS_LOCK }, --  t�y  T�m 7
                            { tbProp = { 2, 1, 31401 }, nStack = 60, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� 7
                            { tbProp = { 2, 95, 204 }, nStack = 15, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Cang L�nh
                            { tbProp = { 2, 1, 30370 }, nStack = 15, nStatus = ITEMSTATUS_LOCK },  --Thi�n M�n Kim L�nh
                            { tbProp = { 2, 1, 1001 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- H�a Th� B�ch
                            { nFactionPoint = 3000 }, -- �i�m C�ng hi�n bang ph�i
                        },
                        tbConditions = {
                            nRoomReq = 1,
                            nMeritReq = 4000000,
                        },
                    },
                }
        },
        [6] = { szName = "��t 5,000,000 �i�m c�ng tr�ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_2000K,
                tbAwardDef = {
                    [1] = {
                        szName = "��t 5,000,000 �i�m c�ng tr�ng",
                        tbAwards = {
                            { tbProp = { 2, 1, 30912 }, nStack = 7000, nStatus = ITEMSTATUS_LOCK }, -- Hi�p Ngh�a Chi Ch�ng
                            { tbProp = { 2, 1, 31122 }, nStack = 40 }, -- Linh Khi ruc ro
                            { tbProp = { 2, 1, 31402 }, nStack = 70, nStatus = ITEMSTATUS_LOCK }, --  t�y  T�m 7
                            { tbProp = { 2, 1, 31401 }, nStack = 70, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� 7
                            { tbProp = { 2, 95, 204 }, nStack = 15, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Cang L�nh
                            { tbProp = { 2, 1, 30370 }, nStack = 15, nStatus = ITEMSTATUS_LOCK },  --Thi�n M�n Kim L�nh
                            { tbProp = { 2, 1, 1001 }, nStack = 5, nStatus = ITEMSTATUS_LOCK }, -- H�a Th� B�ch
                            { nFactionPoint = 4000 }, -- �i�m C�ng hi�n bang ph�i
                        },
                        tbConditions = {
                            nRoomReq = 4,
                            nMeritReq = 5000000,
                        },
                    },
                }
        },
        [7] = { szName = "��t 6,000,000 �i�m c�ng tr�ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_3000K,
                tbAwardDef = {
                    [1] = {
                        szName = "��t 6,000,000 �i�m c�ng tr�ng",
                        tbAwards = {
                            { tbProp = { 2, 1, 30912 }, nStack = 8000, nStatus = ITEMSTATUS_LOCK }, -- Hi�p Ngh�a Chi Ch�ng
                            { tbProp = { 2, 1, 31122 }, nStack = 50 }, -- Linh Khi ruc ro
                            { tbProp = { 2, 1, 31402 }, nStack = 80, nStatus = ITEMSTATUS_LOCK }, --  t�y  T�m 7
                            { tbProp = { 2, 1, 31401 }, nStack = 80, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� 7
                            { tbProp = { 2, 95, 204 }, nStack = 15, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Cang L�nh
                            { tbProp = { 2, 1, 30370 }, nStack = 15, nStatus = ITEMSTATUS_LOCK },  --Thi�n M�n Kim L�nh
                            {  tbProp = { 2, 102, 214  }, nStack = 20, nStatus = ITEMSTATUS_LOCK },  --Di Ch�u 7
                            { nFactionPoint = 4000 }, -- �i�m C�ng hi�n bang ph�i
                        },
                        tbConditions = {
                            nRoomReq = 2,
                            nMeritReq = 6000000,
                        },
                    },
                }
        },
        [8] = { szName = "��t 7,000,000 �i�m c�ng tr�ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_4000K,
                tbAwardDef = {
                    [1] = {
                        szName = "��t 7,000,000 �i�m c�ng tr�ng",
                        tbAwards = {
                            { tbProp = { 2, 1, 30912 }, nStack = 10000, nStatus = ITEMSTATUS_LOCK }, -- Hi�p Ngh�a Chi Ch�ng
                            { tbProp = { 2, 1, 31122 }, nStack = 60 }, -- Linh Khi ruc ro
                            { tbProp = { 2, 1, 31614 }, nStack = 30,nStatus = ITEMSTATUS_LOCK }, -- T�y t�m 8
                            { tbProp = { 2, 1, 31615 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� 8
                            { tbProp = { 2, 95, 204 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Cang L�nh
                            { tbProp = { 2, 1, 30370 }, nStack = 20, nStatus = ITEMSTATUS_LOCK },  --Thi�n M�n Kim L�nh
                            {  tbProp = { 2, 102, 214  }, nStack = 40, nStatus = ITEMSTATUS_LOCK },  --Di Ch�u 7
                            { nFactionPoint = 5000 }, -- �i�m C�ng hi�n bang ph�i
                        },
                        tbConditions = {
                            nRoomReq = 6,
                            nMeritReq = 7000000,
                        },
                    },
                }
        },
        [9] = { szName = "��t 8,000,000 �i�m c�ng tr�ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_5000K,
                tbAwardDef = {
                    [1] = {
                        szName = "��t 8,000,000 �i�m c�ng tr�ng",
                        tbAwards = {
                            { szName = "Set Chu T��c T��ng", nFunc = "_w_newbie_Give_ChuTuocTuong(15)" },
                            { tbProp = { 2, 1, 30912 }, nStack = 15000, nStatus = ITEMSTATUS_LOCK }, -- Hi�p Ngh�a Chi Ch�ng
                            { tbProp = { 2, 1, 31122 }, nStack = 60 }, -- Linh Khi ruc ro
                            { tbProp = { 2, 1, 31614 }, nStack = 50,nStatus = ITEMSTATUS_LOCK }, -- T�y t�m 8
                            { tbProp = { 2, 1, 31615 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, -- Luy�n L� 8
                            { tbProp = { 2, 95, 204 }, nStack = 25, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Cang L�nh
                            { tbProp = { 2, 1, 30370 }, nStack = 25, nStatus = ITEMSTATUS_LOCK },  --Thi�n M�n Kim L�nh
                            {  tbProp = { 2, 102, 214  }, nStack = 50, nStatus = ITEMSTATUS_LOCK },  --Di Ch�u 7
                            { nFactionPoint = 6000 }, -- �i�m C�ng hi�n bang ph�i
                        },
                        tbConditions = {
                            nRoomReq = 3,
                            nMeritReq = 8000000,
                        },
                    },
                }
        },
        [10] = { szName = "��t 9,000,000 �i�m c�ng tr�ng",
                nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_6000K,
                tbAwardDef = {
                    [1] = {
                        szName = "��t 9,000,000 �i�m c�ng tr�ng",
                        tbAwards = {
                            { szName = "Trang s�c v� c�c tinh minh", nFunc = "KsgItem:AddJewelry(31130, 2)" },
                            { tbProp = { 2, 1, 30912 }, nStack = 20000, nStatus = ITEMSTATUS_LOCK }, -- Hi�p Ngh�a Chi Ch�ng
                            --{ tbProp = { 2, 1, 31122 }, nStack = 60 }, -- Linh Khi ruc ro
                            { tbProp = { 2, 1, 31761 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- T�y t�m 9
                            { tbProp = { 2, 1, 31762 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- Luy�n l� 9
                            { tbProp = { 2, 95, 204 }, nStack = 40, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Cang L�nh
                            { tbProp = { 2, 1, 30370 }, nStack = 40, nStatus = ITEMSTATUS_LOCK },  --Thi�n M�n Kim L�nh
                            {  tbProp = { 2, 102, 226  }, nStack = 30, nStatus = ITEMSTATUS_LOCK },  --Di Ch�u 8
                            { nFactionPoint = 7000 }, -- �i�m C�ng hi�n bang ph�i
                        },
                        tbConditions = {
                            nRoomReq = 1,
                            nMeritReq = 9000000,
                        },
                    },
                }
        },
        [11] = { szName = "��t 10,000,000 �i�m c�ng tr�ng",
                 nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
                 nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_8000K,
                 tbAwardDef = {
                     [1] = {
                         szName = "��t 10,000,000 �i�m c�ng tr�ng",
                         tbAwards = {
                             { tbProp = { 2, 1, 30912 }, nStack = 25000, nStatus = ITEMSTATUS_LOCK }, -- Hi�p Ngh�a Chi Ch�ng
                             --{ tbProp = { 2, 1, 31122 }, nStack = 60 }, -- Linh Khi ruc ro
                             { tbProp = { 2, 1, 31761 }, nStack = 50,  nStatus = ITEMSTATUS_LOCK }, -- T�y t�m 9
                             { tbProp = { 2, 1, 31762 }, nStack = 50,  nStatus = ITEMSTATUS_LOCK }, -- Luy�n l� 9
                             { tbProp = { 2, 95, 204 }, nStack = 40, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Cang L�nh
                             { tbProp = { 2, 1, 30370 }, nStack = 40, nStatus = ITEMSTATUS_LOCK },  --Thi�n M�n Kim L�nh
                             {  tbProp = { 2, 102, 226  }, nStack = 40, nStatus = ITEMSTATUS_LOCK },  --Di Ch�u 8
                             { nFactionPoint = 10000 }, -- �i�m C�ng hi�n bang ph�i
                         },
                         tbConditions = {
                             nRoomReq = 2,
                             nMeritReq = 10000000,
                         },
                     },
                 }
        },
        --[12] = { szName = "��t 10,000,000 �i�m c�ng tr�ng",
        --         nTaskId = WTASKID_MERITPOINT_AWARD_BIT,
        --         nTaskBitId = WTASKID_MERITPOINT_AWARD_BIT_10000K,
        --         tbAwardDef = {
        --             [1] = {
        --                 szName = "��t 10,000,000 �i�m c�ng tr�ng",
        --                 tbAwards = {
        --                     { tbProp = { 2,95,204 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Cang L�nh
        --                     { tbProp = { 2, 1, 30370 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, -- Thi�n M�n Kim L�nh
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
        --            szName = "Nh�n th��ng ��t chuy�n sinh 10 C�p 92",
        --            fnPrepareParam = _w_newbieaward_PrepareParam,
        --            tbAwards = {
        --                { szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
        --                { szName = "B� �i�n 25%", tbProp = {2,1,40047 }, nStack = 100, nStatus = 4 },
        --                { szName = "Linh Ph�ch ��n", tbProp = { 2, 1, 31239 }, nStack = 2, nStatus = 4 },
        --                { szName = "L�nh b�i c�ng hi�n bang b�i", tbProp = { 2, 1, 30914 }, nStack = 5, nStatus = 4 },
        --                { szName = "Ti�u ��nh H�n", tbProp = {  2, 1, 1067 }, nStack = 1, nStatus = 4 },
        --                { szName = "��i ��nh H�n", tbProp = { 2, 1, 1113 }, nStack = 1, nStatus = 4 },
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
        --            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 93",
        --            fnPrepareParam = _w_newbieaward_PrepareParam,
        --            tbAwards = {
        --                { szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
        --                { szName = "B� �i�n 25%", tbProp = {2,1,40047 }, nStack = 100, nStatus = 4 },
        --                { szName = "Linh Ph�ch ��n", tbProp = { 2, 1, 31239 }, nStack = 2, nStatus = 4 },
        --                { szName = "L�nh b�i c�ng hi�n bang b�i", tbProp = { 2, 1, 30914 }, nStack = 5, nStatus = 4 },
        --                { szName = "Thi�n Th�ch Linh Th�ch", tbProp = {  2, 1, 1068 }, nStack = 1, nStatus = 4 },
        --                { szName = "Thi�n Th�ch Tinh Th�ch", tbProp = { 2, 1, 1009 }, nStack = 20, nStatus = 4 },
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
        --            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 94",
        --            fnPrepareParam = _w_newbieaward_PrepareParam,
        --            tbAwards = {
        --                { szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
        --                { szName = "B� �i�n 25%", tbProp = {2,1,40047 }, nStack = 100, nStatus = 4 },
        --                { szName = "Linh Ph�ch ��n", tbProp = { 2, 1, 31239 }, nStack = 4, nStatus = 4 },
        --                { szName = "L�nh b�i c�ng hi�n bang b�i", tbProp = { 2, 1, 30914 }, nStack = 5, nStatus = 4 },
        --                { szName = "B�a c��ng h�a 12", tbProp = {  2, 1, 30424 }, nStack = 10, nStatus = 4 },
        --                { szName = "C��ng H�a Quy�n 13", tbProp = { 2, 1, 30425 }, nStack = 10, nStatus = 4 },
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
        --            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 95",
        --            fnPrepareParam = _w_newbieaward_PrepareParam,
        --            tbAwards = {
        --                { szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
        --                { szName = "B� �i�n 25%", tbProp = {2,1,40047 }, nStack = 100, nStatus = 4 },
        --                { szName = "Linh Ph�ch ��n", tbProp = { 2, 1, 31239 }, nStack = 4, nStatus = 4 },
        --                { szName = "L�nh b�i c�ng hi�n bang b�i", tbProp = { 2, 1, 30914 }, nStack = 5, nStatus = 4 },
        --                { szName = "B�a c��ng h�a 12", tbProp = {  2, 1, 30424 }, nStack = 10, nStatus = 4 },
        --                { szName = "C��ng H�a Quy�n 13", tbProp = { 2, 1, 30425 }, nStack = 10, nStatus = 4 },
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
        --            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 96",
        --            fnPrepareParam = _w_newbieaward_PrepareParam,
        --            tbAwards = {
        --                { szName = "100 m�nh C� Quan m�c Gia", tbProp = { 2, 1, 31244  }, nStack = 100, nStatus = 4 },
        --                { szName = "H�i ti�n ��n", tbProp = {2,1,30847 }, nStack = 20, nStatus = 4 },
        --                { szName = "Linh Ph�ch ��n", tbProp = { 2, 1, 31239 }, nStack = 5, nStatus = 4 },
        --                { szName = "T�i �� qu� c�p 7", tbProp = { 2, 1, 31505}, nStack = 2, nStatus = 4 },
        --                { szName = "2 Th��ng H�i Di Ch�u 5",nFunc = "_w_newbie_Give_ThuongHaiDiChau(5, 2)" },
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
        --            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 97",
        --            fnPrepareParam = _w_newbieaward_PrepareParam,
        --            tbAwards = {
        --                { szName = "200 m�nh C� Quan m�c Gia", tbProp = { 2, 1, 31244  }, nStack = 200, nStatus = 4 },
        --                { szName = "H�i ti�n ��n", tbProp = {2,1,30847 }, nStack = 30, nStatus = 4 },
        --                { szName = "Linh Ph�ch ��n", tbProp = { 2, 1, 31239 }, nStack = 10, nStatus = 4 },
        --                { szName = "T�i �� qu� c�p 7", tbProp = { 2, 1, 31505 }, nStack = 2, nStatus = 4 },
        --                { szName = "2 Th��ng H�i Di Ch�u 5",nFunc = "_w_newbie_Give_ThuongHaiDiChau(5, 2)" },
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
        --            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 98",
        --            fnPrepareParam = _w_newbieaward_PrepareParam,
        --            tbAwards = {
        --                { szName = "500 m�nh C� Quan m�c Gia", tbProp = { 2, 1, 31244  }, nStack = 500, nStatus = 4 },
        --                { szName = "H�i ti�n ��n", tbProp = {2,1,30847 }, nStack = 30, nStatus = 4 },
        --                { szName = "Linh Ph�ch ��n", tbProp = { 2, 1, 31239 }, nStack = 10, nStatus = 4 },
        --                { szName = "T�i �� qu� c�p 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 4 },
        --                { szName = "5 Th��ng H�i Di Ch�u 5",nFunc = "_w_newbie_Give_ThuongHaiDiChau(5, 5)"},
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
        --            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 99",
        --            fnPrepareParam = _w_newbieaward_PrepareParam,
        --            tbAwards = {
        --                { szName = "500 m�nh C� Quan m�c Gia", tbProp = { 2, 1, 31244  }, nStack = 500, nStatus = 4 },
        --                { szName = "H�i ti�n ��n", tbProp = {2,1,30847 }, nStack = 50, nStatus = 4 },
        --                { szName = "Linh Ph�ch ��n", tbProp = { 2, 1, 31239 }, nStack = 15, nStatus = 4 },
        --                { szName = "T�i �� qu� c�p 7", tbProp = { 2, 1, 31505 }, nStack = 5, nStatus = 4 },
        --                { szName = "5 Th��ng H�i Di Ch�u 5",nFunc = "_w_newbie_Give_ThuongHaiDiChau(5, 5)" },
        --                { szName = "90 H�a M�ch C�nh",nFunc = "_w_newbie_Give_HoaCanh(90)"},
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
            szName = "Nh�n th��ng ��t c�p 73",
            fnPrepareParam = _w_newbieaward_PrepareParam,
            tbAwards = {
                --{ szName = "Tr�c ti�p chuy�n sinh 7 c�p 98", nFunc = "_w_newbieaward_UpLevel(798, param1)" },
                --{ szName = "Th�n h�nh b�o �i�n", tbProp = { 0, 200, 40 }, nStack = 1, nStatus = 4 },
                --{ szName = "B�t Tr�n Ch�u", tbProp = { 2, 102, 215 }, nStack = 200, nStatus = 4 },
                --{ szName = "1 b� H�a Ph�ng T��ng+0", nFunc = "_w_newbieaward_GiveBattleSuit(1, 0, param2)" },
                --{ szName = "T�i �� Qu� C�p 3", tbProp = { 2, 1, 31000 }, nStack = 20, nStatus = 4 },
                --{ szName = "K�ch ho�t kinh m�ch V� T�n", nFunc = "KsgPlayer:MeridianLevelUp(4)" },
                --{ szName = "1 b� v�n s�c c�p 2+0", nFunc = "KsgAward:SetVanSuc(2)" },
                --{ szName = "1 b� Di�u D��ng+0", nFunc = "KsgAward:SetDieuDuong(0, 4)" },
                --{ szName = "1 b� V� H� H�o Hi�p+0", nFunc = "KsgAward:SetLenhBaiVoHaHaoHiep(0)" },
                --{ szName = "3 b� Kim x� 4+0", nFunc = "kgm_NhanKimXa(4, 0)" },
                --{ szName = "1 M�t t�ch 70 si�u c�p luy�n s�n 10t 4pl 95%", nFunc = "_w_book_AddBookByType(1,5,10,4,95,95,95,95)" },
                --{ szName = "M�nh M�t T�ch Cao C�p", tbProp = { 2, 1, 40026 }, nStack = 30, nStatus = 4 },
                --{ szName = "R��ng Y�u Quy�t_S�", tbProp = { 2, 1, 50005 }, nStack = 2, nStatus = 4 },
                { szName = "L�ng Ba Vi B� to�n t�p", tbProp = { 0, 112, 158 }, nStack = 1, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 73,
                nRoomReq = 1 + 1 + 7 + 1 + 1 + 5 + 6 + 9 + 1 + 9 + 1 + 1 + 1,
                bJoinRouteReq = WEnv.TRUE,
            },
        },
        [2] = {
            szName = "Nh�n th��ng ��t chuy�n sinh 7 c�p 99",
            fnPrepareParam = _w_newbieaward_PrepareParam,
            tbAwards = {
                --{ szName = "Tr�c ti�p chuy�n sinh 8 c�p 95", nFunc = "_w_newbieaward_UpLevel(895, param1)" },
                --{ szName = "Thi�t Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 200, nStatus = 4 },
                --{ szName = "B�t Tr�n Ch�u", tbProp = { 2, 102, 215 }, nStack = 300, nStatus = 4 },
                --{ szName = "T�i �� Qu� C�p 4", tbProp = { 2, 1, 31001 }, nStack = 10, nStatus = 4 },
                --{ szName = "��ng T� Chi Nguy�n", tbProp = { 2, 1, 30913 }, nStack = 30, nStatus = 4 },
                --{ szName = "Hi�p Ngh�a Chi Ch�ng", tbProp = { 2, 1, 30912 }, nStack = 200, nStatus = 4 },
                --{ szName = "H�i Ti�n ��n", tbProp = { 2, 1, 30847 }, nStack = 200, nStatus = 4 },
                --{ szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 2, nStatus = 4 },
                --{ szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 1, nStatus = 4 },
                { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 799,
                nRoomReq = 9,
                bJoinRouteReq = WEnv.TRUE,
            },
        },
        [3] = {
            szName = "Nh�n th��ng ��t chuy�n sinh 8 c�p 99",
            fnPrepareParam = _w_newbieaward_PrepareParam,
            tbAwards = {
                --{ szName = "Tr�c ti�p chuy�n sinh 9 c�p 95", nFunc = "_w_newbieaward_UpLevel(995, param1)" },
                --{ szName = "Thi�t Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 200, nStatus = 4 },
                --{ szName = "B�t Tr�n Ch�u", tbProp = { 2, 102, 215 }, nStack = 300, nStatus = 4 },
                --{ szName = "T�i �� Qu� C�p 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                --{ szName = "��ng T� Chi Nguy�n", tbProp = { 2, 1, 30913 }, nStack = 30, nStatus = 4 },
                --{ szName = "Hi�p Ngh�a Chi Ch�ng", tbProp = { 2, 1, 30912 }, nStack = 200, nStatus = 4 },
                --{ szName = "H�i Ti�n ��n", tbProp = { 2, 1, 30847 }, nStack = 200, nStatus = 4 },
                --{ szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                --{ szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 4 },
                { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 899,
                nRoomReq = 9,
            },
        },
        [4] = {
            szName = "Nh�n th��ng ��t chuy�n sinh 9 c�p 99",
            fnPrepareParam = _w_newbieaward_PrepareParam,
            tbAwards = {
                --{ szName = "Tr�c ti�p chuy�n sinh 10 c�p 90", nFunc = "_w_newbieaward_UpLevel(1090, param1)" },
                --{ szName = "Thi�t Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 200, nStatus = 4 },
                --{ szName = "B�t Tr�n Ch�u", tbProp = { 2, 102, 215 }, nStack = 500, nStatus = 4 },
                --{ szName = "T�i �� Qu� C�p 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                --{ szName = "��ng T� Chi Nguy�n", tbProp = { 2, 1, 30913 }, nStack = 30, nStatus = 4 },
                --{ szName = "Hi�p Ngh�a Chi Ch�ng", tbProp = { 2, 1, 30912 }, nStack = 100, nStatus = 4 },
                --{ szName = "H�i Ti�n ��n", tbProp = { 2, 1, 30847 }, nStack = 50, nStatus = 4 },
                --{ szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                --{ szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 4 },
                { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 999,
                nRoomReq = 9,
            },
        },
        [5] = {
            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 95",
            tbAwards = {
                { szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "B� �i�n 25%", tbProp = {2,1,40047 }, nStack = 1, nStatus = 4 },
                { szName = "Linh Ph�ch ��n", tbProp = { 2, 1, 31239 }, nStack = 4, nStatus = 4 },
                { szName = "L�nh b�i c�ng hi�n bang b�i", tbProp = { 2, 1, 30914 }, nStack = 5, nStatus = 4 },
                { szName = "B�a c��ng h�a 12", tbProp = {  2, 1, 30424 }, nStack = 10, nStatus = 4 },
                { szName = "C��ng H�a Quy�n 13", tbProp = { 2, 1, 30425 }, nStack = 10, nStatus = 4 },
                { szName = "M�nh Kim X� 6", tbProp = { 2, 1, 31384 }, nStack = 50, nStatus = 4 },
                --
                --{ szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 4 },
                --{ szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = 4 },
                --{ szName = "Th��ng H�i Ch�u C�p 7 (Ch�a gi�m ��nh)", tbProp = { 2, 102, 214 }, nStack = 1, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 1095,
                nRoomReq = 11,
            },
        },
        [6] = {
            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 96",
            tbAwards = {
                { szName = "M�nh C� Quan M�c Gia", tbProp = { 2, 1, 31244 }, nStack = 100, nStatus = 4 },
                { szName = "Tr�ng Th� C�ng-Si�u", tbProp = { 2, 1, 31169 }, nStack = 5, nStatus = 4 },
                { szName = "B�t Tr�n Ch�u", tbProp = { 2, 102, 215 }, nStack = 500, nStatus = 4 },
                { szName = "T�i �� Qu� C�p 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                { szName = "Thi�t Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 50, nStatus = 4 },
                { szName = "��ng T� Chi Nguy�n", tbProp = { 2, 1, 30913 }, nStack = 50, nStatus = 4 },
                { szName = "H�i Ti�n ��n", tbProp = { 2, 1, 30847 }, nStack = 50, nStatus = 4 },
                { szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 1, nStatus = 4 },
                { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = 4 },
                { szName = "Th��ng H�i Ch�u C�p 7 (Ch�a gi�m ��nh)", tbProp = { 2, 102, 214 }, nStack = 1, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 1096,
                nRoomReq = 11,
            },
        },
        [7] = {
            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 97",
            tbAwards = {
                { szName = "M�nh C� Quan M�c Gia", tbProp = { 2, 1, 31244 }, nStack = 200, nStatus = 4 },
                { szName = "Tr�ng Th� C�ng-Si�u", tbProp = { 2, 1, 31169 }, nStack = 5, nStatus = 4 },
                { szName = "B�t Tr�n Ch�u", tbProp = { 2, 102, 215 }, nStack = 500, nStatus = 4 },
                { szName = "T�i �� Qu� C�p 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                { szName = "Thi�t Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 50, nStatus = 4 },
                { szName = "Hi�p Ngh�a Chi Ch�ng", tbProp = { 2, 1, 30912 }, nStack = 50, nStatus = 4 },
                { szName = "H�i Ti�n ��n", tbProp = { 2, 1, 30847 }, nStack = 50, nStatus = 4 },
                { szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 1, nStatus = 4 },
                { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = 4 },
                { szName = "Th��ng H�i Ch�u C�p 7 (Ch�a gi�m ��nh)", tbProp = { 2, 102, 214 }, nStack = 2, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 1097,
                nRoomReq = 11,
            },
        },
        [8] = {
            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 98",
            tbAwards = {
                { szName = "M�nh C� Quan M�c Gia", tbProp = { 2, 1, 31244 }, nStack = 200, nStatus = 4 },
                { szName = "Tr�ng Th� C�ng-Si�u", tbProp = { 2, 1, 31169 }, nStack = 5, nStatus = 4 },
                { szName = "B�t Tr�n Ch�u", tbProp = { 2, 102, 215 }, nStack = 500, nStatus = 4 },
                { szName = "T�i �� Qu� C�p 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                { szName = "Thi�t Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 50, nStatus = 4 },
                { szName = "Hi�p Ngh�a Chi Ch�ng", tbProp = { 2, 1, 30912 }, nStack = 100, nStatus = 4 },
                { szName = "H�i Ti�n ��n", tbProp = { 2, 1, 30847 }, nStack = 50, nStatus = 4 },
                { szName = "Ch�n V� H�n Th�ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 1, nStatus = 4 },
                { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = 4 },
                { szName = "Th��ng H�i Ch�u C�p 7 (Ch�a gi�m ��nh)", tbProp = { 2, 102, 214 }, nStack = 5, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 1098,
                nRoomReq = 11,
            },
        },
        [9] = {
            szName = "Nh�n th��ng ��t chuy�n sinh 10 c�p 99",
            tbAwards = {
                { szName = "H�i M�ng ��n", tbProp = { 2, 1, 31260 }, nStack = 1, nStatus = 4 },
                { szName = "M�nh C� Quan M�c Gia", tbProp = { 2, 1, 31244 }, nStack = 1000, nStatus = 1 },
                { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 1 },
                { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = 1 },
                { szName = "Th��ng H�i Ch�u C�p 7 (Ch�a gi�m ��nh)", tbProp = { 2, 102, 225 }, nStack = 5, nStatus = 1 },
                { szName = "H�c B�ch K�", tbProp = { 2, 1, 31168 }, nStack = 2, nStatus = 4 },
                { szName = "90 H�a M�ch C�nh",szFunc = "_w_newbie_Give_HoaCanh(90)" },
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
--- Lib functions: c�c h�m c�a th� vi�n

---Ki�m tra �i�u ki�n c�a nh�n v�t, khai b�o � tbTopDef[nType].tbAwar�ef[nAwardIdx].tbCondition
---@param nType number ID lo�i ph�n th��ng
---@param nAwardIdx table ID ph�n thu��ng
---@return number, table return1 number: WEnv.TRUE �� �� �i�u ki�n nh�n, WEnv.FALSE ch�a �� �k nh�n; return2 table: c�c �i�u ki�n
function WNewbieAward:GetAwardCondition(nType, nAwardIdx)
    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local tbAwardCondition = tbAwardDef[nAwardIdx].tbConditions or {};

    -- Ki�m tra level
    local tbCheckInfo = {};
    local nRetCode = enumWNewbieAwardStatusCode.AWARD_CAN_GET;

    -- Ki�m tra c�p ��
    if tbAwardCondition.nLevelReq and tbAwardCondition.nLevelReq > 0 then
        local nPlayerLevel = WPlayer:GetBigLevel();
        if tbAwardCondition.nLevelReq > nPlayerLevel then
            tinsert(tbCheckInfo, format("<color=red>��t %s<color>", WLib:Level2String(tbAwardCondition.nLevelReq)));
            nRetCode = enumWNewbieAwardStatusCode.AWARD_REQ_LEVEL;
        else
            tinsert(tbCheckInfo, format("<color=green>��t %s<color>", WLib:Level2String(tbAwardCondition.nLevelReq)));
        end
    end

    -- Ki�m tra gia nh�p m�n ph�i
    if tbAwardCondition.bJoinRouteReq and tbAwardCondition.bJoinRouteReq == WEnv.TRUE then
        if WPlayer:IsJoinedRoute() ~= WEnv.TRUE then
            tinsert(tbCheckInfo, "<color=red>Gia nh�p m�n ph�i<color>");
            nRetCode = enumWNewbieAwardStatusCode.AWARD_REQ_JOIN_ROUTE;
        else
            tinsert(tbCheckInfo, "<color=green>Gia nh�p m�n ph�i<color>");
        end
    end
    
    -- Ki�m tra qu�n c�ng
    if tbAwardCondition.nMeritReq and tbAwardCondition.nMeritReq > 0 then
        if tbAwardCondition.nMeritReq > WPlayer:GetHonor() then
            tinsert(tbCheckInfo, format("<color=red>��t c�ng tr�ng %s<color>", WLib:MoneyFormat(tbAwardCondition.nMeritReq)));
            nRetCode = enumWNewbieAwardStatusCode.AWARD_REQ_MERIT;
        else
            tinsert(tbCheckInfo, format("<color=green>��t c�ng tr�ng %s<color>", WLib:MoneyFormat(tbAwardCondition.nMeritReq)));
        end
    end

    -- Ki�m tra s�c l�c
    if tbAwardCondition.nRoomReq and tbAwardCondition.nRoomReq > 0 then
        if WLib:CheckInv(tbAwardCondition.nRoomReq + 3, 1000, WEnv.FALSE) ~= WEnv.TRUE then
            tinsert(tbCheckInfo, format("<color=red>H�nh trang %d �<color>", tbAwardCondition.nRoomReq));
            tinsert(tbCheckInfo, "<color=red>S�c l�c 1000<color>");
            nRetCode = enumWNewbieAwardStatusCode.AWARD_REQ_ROOM;
        else
            tinsert(tbCheckInfo, format("<color=green>H�nh trang %d �<color>", tbAwardCondition.nRoomReq));
            tinsert(tbCheckInfo, "<color=green>S�c l�c 1000<color>");
        end
    end


    return nRetCode, tbCheckInfo;
end

---L�y ra c�c t�n ph�n th��ng ���c khai b�o � tbTopDef[nType].tbAwar�ef[nAwardIdx].szName
---@param nType number ID lo�i ph�n th��ng
---@param nAwardIdx table ID ph�n thu��ng
function WNewbieAward:GetAwardItemName(nType, nAwardIdx)
    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local tbAwardItem = tbAwardDef[nAwardIdx].tbAwards;
    ---Ki��m tra ��nh gi� qu�n ha�m

    -- L�y th�ng tin ph�n th��ng
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

---Hi�n th� danh s�ch ng��i nh�n th��ng
---@param nType number ID lo�i ph�n th��ng
function WNewbieAward:ShowAwardList(nType)
    nType = tonumber(nType) or 0;
    
    local tbSay = { "Ki�m tra c�c ph�n qu� h�p h�n" };

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

        tinsert(tbSay, "\nTa ch� xem qua th�i./nothing");
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
            local szGiveStatus = "(ch�n �� xem chi ti�t)";
            local nCheckCode, tbCheckInfo = self:GetAwardCondition(nType, nAwardIdx)
            if nCheckCode == enumWNewbieAwardStatusCode.AWARD_CAN_GET then
                szGiveStatus = "(c� th� nh�n)";
            elseif nCheckCode == enumWNewbieAwardStatusCode.AWARD_HAS_GET then
                szGiveStatus = "(�� nh�n)";
            elseif nCheckCode == enumWNewbieAwardStatusCode.AWARD_NEED_GET_BEFORE then
                szGiveStatus = "(c�n nh�n qu� tr��c ��)";
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

    tinsert(tbSay, "\nTa ch� xem qua th�i./nothing");
    WNpc:SayDialog(tbSay);
end

---Hi�n th� chi ti�t ph�n th��ng
---@param nType number ID lo�i ph�n th��ng
---@param nAwardIdx table ID ph�n thu��ng
function WNewbieAward:ShowAwardInfo(nType, nAwardIdx)
    nType = tonumber(nType) or 0;
    nAwardIdx = tonumber(nAwardIdx) or 0;

    if nType == 0 or nAwardIdx == 0 then
        return WEnv.RETCODE_NOTOPEN;
    end

    -- Ki�m tra ph�n th��ng kh�ng c�n n�a
    if self.tbTopDef[nType] == WEnv.NULL or self.tbTopDef[nType].tbAwardDef == WEnv.NULL then
        local tbSay = { "Ph�n th��ng n�y �� h�t h�n ho�c kh�ng c�n xu�t hi�n tr�n giang h� n�a!" };
        tinsert(tbSay, "Ta �� hi�u r�i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- L�y th�ng tin ph�n th��ng
    local nCheckCode, tbCheckInfo = self:GetAwardCondition(nType, nAwardIdx);
    local tbAwardItemName = self:GetAwardItemName(nType, nAwardIdx);

    -- Hi�n th� �i�u ki�n v� trao th��ng
    local tbSay = {};
    tinsert(tbSay, format("%s/#%s:ShowAwardList()", "Xem l�i danh s�ch nh�n th��ng", self.szClassName));
    tinsert(tbSay, format("%s/nothing", "Ta ch� xem qua th�i."));

    local tbSayTitleInfoLines = {};
    local szAwardStatus = "";

    if WTask:GetBit(self.tbTopDef[nType].nTaskId, self.tbTopDef[nType].nTaskBitId) == 1 then
        szAwardStatus = "(<color=white>�� nh�n<color>)";
    else
        if nCheckCode == enumWNewbieAwardStatusCode.AWARD_CAN_GET then
            szAwardStatus = "(<color=green>c� th� nh�n<color>)";
            tinsert(tbSay, 1, format("\nNh�n th��ng/#%s:GiveAward(%d, %d)", self.szClassName, nType, nAwardIdx));
        else
            szAwardStatus = "(<color=red>ch�a ��t y�u c�u<color>)";
        end
        tbSayTitleInfoLines[3] = format("\nY�u c�u m�u �� l� ch�a ��t: \n%s", WLib:Join(tbCheckInfo, ", "));
    end

    tbSayTitleInfoLines[1] = format("<color=green>%s %s<color>", self.tbTopDef[nType].tbAwardDef[nAwardIdx].szName, szAwardStatus);
    tbSayTitleInfoLines[2] = format("<color=yellow>%s<color>", WLib:Join(tbAwardItemName, "<color>, <color=yellow>"));

    -- Ch�n header l�n ��u tbSay
    tinsert(tbSay, 1, WLib:Join(tbSayTitleInfoLines, "\n"));
    WNpc:SayDialog(tbSay);
end

---Trao ph�n th��ng
---@param nType number ID lo�i ph�n th��ng
---@param nAwardIdx table ID ph�n thu��ng
---@param arg table Tham s� th�m kh�ng b�t bu�c, k�t h�p v�i tbTopDef[nType].tbAwar�ef[nAwardIdx].fnPrepareParam l�a ch�n g� �� �� c� tham s� ��u v�o c� th� c�a h�m nh�n th��ng
function WNewbieAward:GiveAward(nType, nAwardIdx, ...)
    nType = tonumber(nType) or 0;
    nAwardIdx = tonumber(nAwardIdx) or 0;
    if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
        return Talk(1, '', GetName()..' h�y tham gia ��nh gi� qu�n h�m, nh�n qu�n c�ng qu�n h�m tu�n n�y v� ��i m�i qu�n h�m. Sau �� m�i c� th� nh�n th��ng ���c!.');
    end

    if nType == 0 or nAwardIdx == 0 then
        return WEnv.RETCODE_NOTOPEN;
    end

    --WNpc:Talk("Ph�n th��ng n�y t�m th�i ch�a th� nh�n!");
    --do return WEnv.RETCODE_NOTOPEN; end

    local tbAwardDef = self.tbTopDef[nType].tbAwardDef;
    local szAwardName = tbAwardDef[nAwardIdx].szName;
    local tbAwardItem = tbAwardDef[nAwardIdx].tbAwards;
    local nCheckCode, tbCheckInfo = self:GetAwardCondition(nType, nAwardIdx);

    -- Ki�m tra ph�n th��ng kh�ng c�n n�a
    if self.tbTopDef[nType] == WEnv.NULL or tbAwardDef[nAwardIdx] == WEnv.NULL then
        local tbSay = { "Ph�n th��ng n�y �� h�t h�n ho�c kh�ng c�n xu�t hi�n tr�n giang h� n�a!" };
        tinsert(tbSay, "Ta �� hi�u r�i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- Ki�m tra �� nh�n r�i ch�a
    if WTask:GetBit(self.tbTopDef[nType].nTaskId, self.tbTopDef[nType].nTaskBitId) ~= 0 then
        local tbSay = { "<sex> �� nh�n ph�n th��ng n�y tr��c �� r�i kh�ng th� nh�n th�m!" };
        tinsert(tbSay, "Ta �� hi�u r�i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- Ki�m tra h�p l�
    if nCheckCode ~= enumWNewbieAwardStatusCode.AWARD_CAN_GET then
        local tbSay = { "B�n kh�ng ��t �i�u ki�n nh�n th��ng m�u �� d��i ��y: \n" .. WLib:Join(tbCheckInfo, ", ") };
        tinsert(tbSay, "Ta �� hi�u r�i./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- Setup param cho qu� d�ng fnFunc
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

    -- L�u ph�n th��ng �� nh�n r�i
    WTask:SetBit(self.tbTopDef[nType].nTaskId, self.tbTopDef[nType].nTaskBitId, 1);

    -- Nh�n qu�
    local nRetCode = WAward:Give(tbAwardNew, szAwardName);
    if nRetCode == WEnv.RETCODE_SUCCESS then
    else
        WNpc:Talk("Nh�n th��ng th�t b�i, vui l�ng li�n h� admin!", WEnv.TRUE);
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
        WNpc:Talk("<sex> �� nh�n ph�n th��ng n�y r�i, kh�ng th� nh�n th�m!!");
        return WEnv.RETCODE_DENY;
    end

    if WTask:Get(WTASKID_TREO_ONLINE_MIN_DAILY_COUNT) >= nOnlineMin then
        WTask:SetBit(WTASKID_TREO_ONLINE_NHAN_THUONG_BIT, m_tbTetAward[nToday][nOnlineMin].nBit, 1);
        WAward:Give(m_tbTetAward[nToday][nOnlineMin].tbAward);
        WPlayer:Msg("Nh�n th��ng online th�nh c�ng!");
    else
        WPlayer:Msg(format("C�n %d ph�t n�a m�i c� th� nh�n ph�n th��ng n�y!", abs(nOnlineMin - WTask:Get(WTASKID_TREO_ONLINE_MIN_DAILY_COUNT))));
    end
end

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
};
WNewbieAward = {
    tbAwardDef = {
        [1] = {
            szName = "NhËn th­ëng ®¹t cÊp 73",
            fnPrepareParam = _w_newbieaward_PrepareParam,
            tbAwards = {
                { szName = "Trùc tiÕp chuyÓn sinh 7 cÊp 98", nFunc = "_w_newbieaward_UpLevel(798, param1)" },
                { szName = "ThÇn hµnh b¶o ®iÓn", tbProp = { 0, 200, 40 }, nStack = 1, nStatus = 4 },
                { szName = "Bét Tr©n Ch©u", tbProp = { 2, 102, 215 }, nStack = 200, nStatus = 4 },
                { szName = "1 bé Háa Phông T­íng+0", nFunc = "_w_newbieaward_GiveBattleSuit(1, 0, param2)" },
                { szName = "Tói §¸ Quý CÊp 3", tbProp = { 2, 1, 31000 }, nStack = 20, nStatus = 4 },
                { szName = "KÝch ho¹t kinh m¹ch Vâ T«n", nFunc = "KsgPlayer:MeridianLevelUp(4)" },
                { szName = "1 bé v¨n søc cÊp 2+0", nFunc = "KsgAward:SetVanSuc(2)" },
                { szName = "1 bé DiÖu D­¬ng+0", nFunc = "KsgAward:SetDieuDuong(0, 4)" },
                { szName = "1 bé V« H¹ Hµo HiÖp+0", nFunc = "KsgAward:SetLenhBaiVoHaHaoHiep(0)" },
                { szName = "3 bé Kim xµ 4+0", nFunc = "kgm_NhanKimXa(4, 0)" },
                { szName = "1 MËt tÞch 70 siªu cÊp luyÖn s½n 10t 4pl 95%", nFunc = "_w_book_AddBookByType(1,5,10,4,95,95,95,95)" },
                { szName = "M¶nh MËt TÞch Cao CÊp", tbProp = { 2, 1, 40026 }, nStack = 30, nStatus = 4 },
                { szName = "R­¬ng YÕu QuyÕt_S¬", tbProp = { 2, 1, 50005 }, nStack = 2, nStatus = 4 },
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
                { szName = "Trùc tiÕp chuyÓn sinh 8 cÊp 95", nFunc = "_w_newbieaward_UpLevel(895, param1)" },
                { szName = "ThiÕt Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 200, nStatus = 4 },
                { szName = "Bét Tr©n Ch©u", tbProp = { 2, 102, 215 }, nStack = 300, nStatus = 4 },
                { szName = "Tói §¸ Quý CÊp 4", tbProp = { 2, 1, 31001 }, nStack = 10, nStatus = 4 },
                { szName = "§ång TÕ Chi NguyÖn", tbProp = { 2, 1, 30913 }, nStack = 30, nStatus = 4 },
                { szName = "HiÖp NghÜa Chi Chøng", tbProp = { 2, 1, 30912 }, nStack = 200, nStatus = 4 },
                { szName = "Håi Tiªn §¬n", tbProp = { 2, 1, 30847 }, nStack = 200, nStatus = 4 },
                { szName = "Ch©n Vâ Hån Th¹ch", tbProp = { 2, 114, 143 }, nStack = 2, nStatus = 4 },
                { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 1, nStatus = 4 },
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
                { szName = "Trùc tiÕp chuyÓn sinh 9 cÊp 95", nFunc = "_w_newbieaward_UpLevel(995, param1)" },
                { szName = "ThiÕt Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 200, nStatus = 4 },
                { szName = "Bét Tr©n Ch©u", tbProp = { 2, 102, 215 }, nStack = 300, nStatus = 4 },
                { szName = "Tói §¸ Quý CÊp 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                { szName = "§ång TÕ Chi NguyÖn", tbProp = { 2, 1, 30913 }, nStack = 30, nStatus = 4 },
                { szName = "HiÖp NghÜa Chi Chøng", tbProp = { 2, 1, 30912 }, nStack = 200, nStatus = 4 },
                { szName = "Håi Tiªn §¬n", tbProp = { 2, 1, 30847 }, nStack = 200, nStatus = 4 },
                { szName = "Ch©n Vâ Hån Th¹ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 4 },
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
                { szName = "Trùc tiÕp chuyÓn sinh 10 cÊp 90", nFunc = "_w_newbieaward_UpLevel(1090, param1)" },
                { szName = "ThiÕt Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 200, nStatus = 4 },
                { szName = "Bét Tr©n Ch©u", tbProp = { 2, 102, 215 }, nStack = 500, nStatus = 4 },
                { szName = "Tói §¸ Quý CÊp 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                { szName = "§ång TÕ Chi NguyÖn", tbProp = { 2, 1, 30913 }, nStack = 30, nStatus = 4 },
                { szName = "HiÖp NghÜa Chi Chøng", tbProp = { 2, 1, 30912 }, nStack = 100, nStatus = 4 },
                { szName = "Håi Tiªn §¬n", tbProp = { 2, 1, 30847 }, nStack = 50, nStatus = 4 },
                { szName = "Ch©n Vâ Hån Th¹ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 4 },
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
                { szName = "ThiÕt Tinh Lv3", tbProp = { 2, 1, 30535 }, nStack = 200, nStatus = 4 },
                { szName = "Trøng Thó C­ng-Siªu", tbProp = { 2, 1, 31169 }, nStack = 5, nStatus = 4 },
                { szName = "Bét Tr©n Ch©u", tbProp = { 2, 102, 215 }, nStack = 500, nStatus = 4 },
                { szName = "Tói §¸ Quý CÊp 4", tbProp = { 2, 1, 31001 }, nStack = 20, nStatus = 4 },
                { szName = "§ång TÕ Chi NguyÖn", tbProp = { 2, 1, 30913 }, nStack = 50, nStatus = 4 },
                { szName = "HiÖp NghÜa Chi Chøng", tbProp = { 2, 1, 30912 }, nStack = 100, nStatus = 4 },
                { szName = "Håi Tiªn §¬n", tbProp = { 2, 1, 30847 }, nStack = 50, nStatus = 4 },
                { szName = "Ch©n Vâ Hån Th¹ch", tbProp = { 2, 114, 143 }, nStack = 5, nStatus = 4 },
                { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 4 },
                { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = 4 },
                { szName = "Th­¬ng H¶i Ch©u CÊp 7 (Ch­a gi¸m ®Þnh)", tbProp = { 2, 102, 214 }, nStack = 1, nStatus = 4 },
            },
            tbConditions = {
                nLevelReq = 1095,
                nRoomReq = 11,
            },
        },
        [6] = {
            szName = "NhËn th­ëng ®¹t chuyÓn sinh 10 cÊp 96",
            tbAwards = {
                { szName = "M¶nh C¬ Quan MÆc Gia", tbProp = { 2, 1, 31244 }, nStack = 200, nStatus = 4 },
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
                { szName = "Th­¬ng H¶i Ch©u CÊp 7 (Ch­a gi¸m ®Þnh)", tbProp = { 2, 102, 214 }, nStack = 2, nStatus = 4 },
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
            },
            tbConditions = {
                nLevelReq = 1099,
                nRoomReq = 6,
            },
        },
    },
    nAwardGiveStatusTaskId = WTASKID_NEWBIE_AWARD_GIVE_STATUS,
};

function WNewbieAward:CheckAwardCondition(nAwardIdx)
    local tbAwardDef = self.tbAwardDef;
    local nAwardGiveStatus = WTask:Get(self.nAwardGiveStatusTaskId);
    local nPlayerLevel = WPlayer:GetBigLevel();

    local tbAwardCondition = tbAwardDef[nAwardIdx].tbConditions or {};

    -- KiÓm tra quµ ®· khai b¸o ch­a
    if tbAwardDef[nAwardIdx] == WEnv.NULL then
        return enumWNewbieAwardStatusCode.AWARD_NOT_AVAILABLE, "PhÇn th­ëng nµy ®· hÕt h¹n hoÆc kh«ng cßn xuÊt hiÖn trªn giang hå n÷a!";
    end

    -- KiÓm tra ®· nhËn quµ
    if nAwardGiveStatus >= nAwardIdx then
        -- RemoveAward(nAwardIdx); -- Xãa hép quµ
        return enumWNewbieAwardStatusCode.AWARD_HAS_GET, "PhÇn th­ëng nµy b¹n ®· nhËn tr­íc ®ã råi!";
    end

    -- KiÓm tra level
    local tbCheckInfo = {};
    local nRetCode = enumWNewbieAwardStatusCode.AWARD_CAN_GET;

    -- KiÓm tra cÊp ®é
    if tbAwardCondition.nLevelReq and tbAwardCondition.nLevelReq > 0 then
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

    -- ChÆn ch­a nhËn quµ tr­íc ®ã
    if nRetCode == enumWNewbieAwardStatusCode.AWARD_CAN_GET and nAwardIdx - nAwardGiveStatus > 1 then
        local nRetAward = 0;
        for i = nAwardGiveStatus + 1, nAwardIdx do
            if tbAwardDef[i] ~= WEnv.NULL then
                nRetAward = nRetAward + 1;
            end
            -- Dõng khi > 1 ®Ó tiÕt kiÖm tµi nguyªn
            if nRetAward > 1 then
                break ;
            end
        end
        if nRetAward > 1 then
            return enumWNewbieAwardStatusCode.AWARD_NEED_GET_BEFORE, "B¹n ch­a nhËn quµ tr­íc ®ã!";
        end
    end

    return nRetCode, tbCheckInfo;
end

function WNewbieAward:GetAwardItemName(nAwardIdx)
    local tbAwardDef = self.tbAwardDef;
    local tbAwardItem = tbAwardDef[nAwardIdx].tbAwards;

    -- LÊy th«ng tin phÇn th­ëng
    local tbAwardItemName = {};
    for nItemDefineIdx = 1, getn(tbAwardItem) do
        if tbAwardItem[nItemDefineIdx] ~= WEnv.NULL then
            if type(tbAwardItem[nItemDefineIdx].tbProp) == 'table' then
                tinsert(tbAwardItemName, format("%d %s", tbAwardItem[nItemDefineIdx].nStack, tbAwardItem[nItemDefineIdx].szName));
            else
                tinsert(tbAwardItemName, tbAwardItem[nItemDefineIdx].szName);
            end
        end
    end
    return tbAwardItemName;
end

function WNewbieAward:GiveAwardConfirm(nAwardIdx)
    local tbAwardDef = self.tbAwardDef;
    local szAwardName = tbAwardDef[nAwardIdx].szName;
    local tbAwardItem = tbAwardDef[nAwardIdx].tbAwards;
    local nCheckCode, tbCheckInfo = self:CheckAwardCondition(nAwardIdx);

    -- KiÓm tra phÇn th­ëng ®· nhËn hoÆc kh«ng cßn n÷a
    if nCheckCode == enumWNewbieAwardStatusCode.AWARD_NOT_AVAILABLE
            or nCheckCode == enumWNewbieAwardStatusCode.AWARD_HAS_GET
    then
        local tbSay = { tbCheckInfo };
        tinsert(tbSay, "Ta ®· hiÓu råi./nothing");
        WNpc:SayDialog(tbSay);
        return WEnv.RETCODE_ERROR;
    end

    -- LÊy th«ng tin phÇn th­ëng
    local tbAwardItemName = self:GetAwardItemName(nAwardIdx);

    -- HiÓn thÞ ®iÒu kiÖn vµ trao th­ëng
    local tbSay = {};
    local szAwardStatus = "";
    if nCheckCode == enumWNewbieAwardStatusCode.AWARD_HAS_GET then
        szAwardStatus = "<color=white>®· nhËn<color>";
        tbSay = { "\nTa chØ xem qua th«i./nothing" };
    else
        if nCheckCode == enumWNewbieAwardStatusCode.AWARD_CAN_GET then
            szAwardStatus = "<color=green>cã thÓ nhËn<color>";
            tbSay = {
                format("NhËn th­ëng\n /#WNewbieAward:GiveAward(%d)", nAwardIdx),
                "T¹m thêi ch­a cÇn ®Õn./nothing",
            };
        else
            szAwardStatus = "<color=red>ch­a ®¹t yªu cÇu<color>";
            tbSay = {
                "\n§Ó ta xem l¹i./nothing",
            };
        end
    end

    local tbInfoLines = {};
    tbInfoLines[1] = format("<color=green>%s (%s)<color>", szAwardName, szAwardStatus);
    tbInfoLines[2] = format("<color=yellow>%s<color>", WLib:Join(tbAwardItemName, "<color>, <color=yellow>"));
    tbInfoLines[3] = format("\nYªu cÇu mµu ®á lµ ch­a ®¹t: \n%s", WLib:Join(tbCheckInfo, ", "));

    -- ChÌn header lªn ®Çu table
    tinsert(tbSay, 1, WLib:Join(tbInfoLines, "\n"));
    WNpc:SayDialog(tbSay);
end

function WNewbieAward:GiveAward(nAwardIdx, ...)
    -- if nAwardIdx == 80 then
    -- Say('PhÇn quµ nµy t¹m ®ßng, Admin sÏ th«ng b¸o vÒ phÇn quµ nµy sau!', 0);
    -- return 0;
    -- end

    local tbAwardDef = self.tbAwardDef;
    local nCheckCode, tbCheckInfo = self:CheckAwardCondition(nAwardIdx);

    -- KiÓm tra phÇn th­ëng ®· nhËn hoÆc kh«ng cßn n÷a
    if nCheckCode == enumWNewbieAwardStatusCode.AWARD_NOT_AVAILABLE
            or nCheckCode == enumWNewbieAwardStatusCode.AWARD_HAS_GET
    then
        local tbSay = { tbCheckInfo };
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
        tbAwardDef[nAwardIdx].fnPrepareParam(nAwardIdx);
        return WEnv.RETCODE_NEEDCONFIRM;
    end
    local tbAwardNew = new(tbAwardDef[nAwardIdx].tbAwards);
    for k, v in pairs(tbAwardNew) do
        if k ~= "n" and v ~= WEnv.NULL and v.nFunc ~= WEnv.NULL then
            for i = 1, getn(arg) do
                v.nFunc = WLib:Replace(v.nFunc, "param" .. i, arg[i]);
            end
        end
    end

    -- L­u phÇn th­ëng ®· nhËn råi
    WTask:Set(self.nAwardGiveStatusTaskId, nAwardIdx);
    -- RemoveAward(nAwardIdx); Xãa hép quµ

    -- NhËn quµ
    local nRetCode = WAward:Give(tbAwardNew, tbAwardDef[nAwardIdx].szName);
    if nRetCode == WEnv.RETCODE_SUCCESS then
    else
        WNpc:Talk("NhËn th­ëng thÊt b¹i, vui lßng liªn hÖ admin!", WEnv.TRUE);
    end
    return nRetCode;
end

function WNewbieAward:OpenAwardList()
    local tbAwardDef = self.tbAwardDef;
    local nTotalAwardCount = getn(tbAwardDef);

    local tbSay = { "Mau th¨ng cÊp ®Ó së h÷u nh÷ng phÇn th­ëng gi¸ trÞ!" };
    local tbAwardHasGet = {};
    for nAwardIdx = 1, nTotalAwardCount do
        if tbAwardDef[nAwardIdx] ~= WEnv.NULL then
            local szGiveStatus = "(chän ®Ó xem chi tiÕt)";
            local nCheckCode, tbCheckInfo = self:CheckAwardCondition(nAwardIdx);
            if nCheckCode == enumWNewbieAwardStatusCode.AWARD_CAN_GET then
                szGiveStatus = "(cã thÓ nhËn)";
            elseif nCheckCode == enumWNewbieAwardStatusCode.AWARD_HAS_GET then
                szGiveStatus = "(®· nhËn)";
            elseif nCheckCode == enumWNewbieAwardStatusCode.AWARD_NEED_GET_BEFORE then
                szGiveStatus = "(cÇn nhËn quµ tr­íc ®ã)";
            end
            if nCheckCode == enumWNewbieAwardStatusCode.AWARD_HAS_GET then
                tinsert(tbAwardHasGet, format("%s %s/#WNewbieAward:GiveAwardConfirm(%d)", tbAwardDef[nAwardIdx].szName, szGiveStatus, nAwardIdx));
            elseif nCheckCode == enumWNewbieAwardStatusCode.AWARD_CAN_GET then
                tinsert(tbSay, format("%s %s/#WNewbieAward:GiveAwardConfirm(%d)", tbAwardDef[nAwardIdx].szName, szGiveStatus, nAwardIdx));
            elseif nCheckCode ~= enumWNewbieAwardStatusCode.AWARD_NOT_AVAILABLE then
                tinsert(tbSay, format("%s %s/#WNewbieAward:GiveAwardConfirm(%d)", tbAwardDef[nAwardIdx].szName, szGiveStatus, nAwardIdx));
            end
        end
    end

    local nTotalReadyGet = getn(tbAwardHasGet);
    for nAwardIdx = 1, nTotalReadyGet do
        tinsert(tbSay, tbAwardHasGet[nAwardIdx]);
    end

    tinsert(tbSay, "\nTa chØ xem qua./nothing");
    WNpc:SayDialog(tbSay);
end

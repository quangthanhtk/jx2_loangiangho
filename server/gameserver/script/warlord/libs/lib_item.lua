----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: c¸c hµm liªn quan ®Õn vËt phÈm
----------------------------------------------------------------------------------------------------
Include("\\settings\\static_script\\lib\\item_define.lua");
Include("\\script\\warlord\\defines\\define_item.lua");
----------------------------------------------------------------------------------------------------
WItem = {};
----------------------------------------------------------------------------------------------------

function WItem:GetName(...)
    local nArgSize = getn(arg);
    if nArgSize == 1 then
        local param1 = arg[1];
        if type(param1) == "table" then
            local nG, nD, nP = WLib:UnPack(param1);
            if nG == 2 and nD == 1 and nP == 30230 then
                return "Xu";
            end
            return GetItemName(nG or 0, nD, nP) or "Kh«ng râ";
        end
        if type(param1) == "number" then
            return GetItemName(param1) or "Kh«ng râ";
        end
    end
    if nArgSize == 3 then
        local nG, nD, nP = WLib:UnPack(arg);
        return GetItemName(nG or 0, nD, nP) or "Kh«ng râ";
    end
    return "Kh«ng râ";
end

function WItem:Delete(...)
    local nArgSize = getn(arg);
    if nArgSize == 2 then
        local tbItem = arg[1];
        local nCount = arg[2];
        if type(tbItem) == "table" and type(nCount) == "number" then
            local nG, nD, nP = WLib:UnPack(tbItem);
            return self:DelItem(nG, nD, nP, nCount);
        end
    end
    if nArgSize == 4 then
        local nG, nD, nP, nCount = WLib:UnPack(arg);
        return self:DelItem(nG, nD, nP, nCount);
    end
    return WEnv.RETCODE_ERROR;
end

function WItem:DelByIndex(nItemIdx, nQuantity)
    nQuantity = nQuantity or 1;
    local tbItemInfo = GetItemInfoByIndex(nItemIdx, 1);
    local tbItemTemplaceInfo = GetItemTemplateInfo(tbItemInfo.genre, tbItemInfo.detail, tbItemInfo.particular);
    local nRetCode = WEnv.RETCODE_ERROR;

    if tbItemTemplaceInfo.StackCount > 0 then
        if DelItemByIndex(nItemIdx, nQuantity) == 1 then
            nRetCode = WEnv.RETCODE_SUCCESS;
        end
    else
        if nQuantity == 1 then
            if DelItemByIndex(nItemIdx, -1) == 1 then
                nRetCode = WEnv.RETCODE_SUCCESS;
            end
        else
            nRetCode = self:DelItem(tbItemInfo.genre, tbItemInfo.detail, tbItemInfo.particular, nQuantity);
        end
    end
    return nRetCode;
end

function WItem:DelItem(nGenre, nDetail, nParticular, nQuantity)
    if DelItem(nGenre, nDetail, nParticular, nQuantity) == 1 then
        return WEnv.RETCODE_SUCCESS;
    else
        return WEnv.RETCODE_ERROR;
    end
end

function WItem:Count(...)
    local nArgSize = getn(arg);
    if nArgSize == 1 then
        local tbItem = arg[1];
        if type(tbItem) == "table" then
            local nG, nD, nP = WLib:UnPack(tbItem);
            return GetItemCount(nG, nD, nP);
        end
    end
    if nArgSize == 3 then
        local nG, nD, nP = WLib:UnPack(arg);
        return GetItemCount(nG, nD, nP);
    end
    return 0;
end

function WItem:CountAll(...)
    local nArgSize = getn(arg);
    if nArgSize == 1 then
        local tbItem = arg[1];
        if type(tbItem) == "table" then
            local nG, nD, nP = WLib:UnPack(tbItem);
            return BigGetItemCount(nG, nD, nP);
        end
    end
    if nArgSize == 3 then
        local nG, nD, nP = WLib:UnPack(arg);
        return BigGetItemCount(nG, nD, nP);
    end
    return 0;
end

function WItem:DeleteAll(...)
    local nArgSize = getn(arg);
    if nArgSize == 1 then
        local tbItem = arg[1];
        if type(tbItem) == "table" then
            local nG, nD, nP = WLib:UnPack(tbItem);
            local nCount = self:CountAll(nG, nD, nP);
            if BigDelItem(nG, nD, nP, nCount) == 1 then
                return WEnv.RETCODE_SUCCESS;
            end
        end
    end
    if nArgSize == 3 then
        local nG, nD, nP = WLib:UnPack(arg);
        local nCount = self:CountAll(nG, nD, nP);
        if BigDelItem(nG, nD, nP, nCount) == 1 then
            return WEnv.RETCODE_SUCCESS;
        end
    end
    return WEnv.RETCODE_ERROR;
end

----------------------------------------------------------------------------------------------------
--- Core add item
--- Add 1 trang bÞ b×nh th­êng
function WItem:AddOnce(nSetId, nStatus, nLevel, nType, szLogTitle)
    nStatus = tonumber(nStatus) or ITEMSTATUS_LOCK;
    nLevel = tonumber(nLevel) or 0;
    szLogTitle = szLogTitle or "AddOnce";
    local tbAward = {
        { tbProp = { ITEM_G_EQUIP, nType, nSetId }, nStatus = nStatus, nLevel = nLevel },
    };
    return WAward:Give(tbAward, szLogTitle);
end
--- Add 1 trang bÞ theo body
function WItem:AddOnceByBody(nStartId, nStatus, nLevel, nType, szLogTitle)
    nStatus = tonumber(nStatus) or ITEMSTATUS_LOCK;
    nLevel = tonumber(nLevel) or 0;
    szLogTitle = szLogTitle or "AddOnceByBody";
    local nBody = WPlayer:GetBody();
    local nPosition = nBody - 1;
    local nSetId = nStartId + nPosition;
    local tbAward = {
        { tbProp = { ITEM_G_EQUIP, nType, nSetId }, nStatus = nStatus, nLevel = nLevel },
    };
    return WAward:Give(tbAward, szLogTitle);
end
--- Add 1 trang bÞ theo hÖ ph¸i
function WItem:AddOnceByRoute(nStartId, nStatus, nLevel, nType, szLogTitle)
    nStatus = tonumber(nStatus) or ITEMSTATUS_LOCK;
    nLevel = tonumber(nLevel) or 0;
    szLogTitle = szLogTitle or "AddOnceByRoute";
    local nPosition = WPlayer:GetRouteBodyOffset();
    local nSetId = nStartId + nPosition;
    local tbAward = {
        { tbProp = { ITEM_G_EQUIP, nType, nSetId }, nStatus = nStatus, nLevel = nLevel },
    };
    return WAward:Give(tbAward, szLogTitle);
end
--- Hµm lÊy ra vÞ trÝ cña mãn ®å ®Çu tiªn theo ph¸i
--- vd: ¸o tld ntc c¸ch ¸o tlt ntc lµ 2 ®¬n vÞ (1ntc+1nkn)
--- t­¬ng tù c¸ch ¸o víi ¸o ntc dm lµ 6 (3 bé 2 kiÓu h×nh)
function WItem:RouteOffset(nRoute, bNotIncludeNewFaction)
    nRoute = nRoute or WPlayer:GetRoute();
    if bNotIncludeNewFaction and (nRoute == ROUTE_DUONGMON_NHAMHIEP or nRoute == ROUTE_CONLON_KIEMTON) then
        return nil;
    end
    return g_tbFactionRoutes_Offset[nRoute];
end
----------------------------------------------------------------------------------------------------
--- Common add cap item
function WItem:AddCap(nSetId, nStatus, nLevel, szLogTitle)
    return self:AddOnce(nSetId, nStatus, nLevel, ITEM_D_EQUIP_HEAD, szLogTitle);
end

function WItem:AddCapByBody(nStartId, nStatus, nLevel, szLogTitle)
    return self:AddOnceByBody(nStartId, nStatus, nLevel, ITEM_D_EQUIP_HEAD, szLogTitle);
end

function WItem:AddCapByRoute(nStartId, nStatus, nLevel, szLogTitle)
    return self:AddOnceByRoute(nStartId, nStatus, nLevel, ITEM_D_EQUIP_HEAD, szLogTitle);
end
----------------------------------------------------------------------------------------------------
--- Common add cloth item
function WItem:AddCloth(nSetId, nStatus, nLevel, szLogTitle)
    return self:AddOnce(nSetId, nStatus, nLevel, ITEM_D_EQUIP_CLOTH, szLogTitle);
end

function WItem:AddClothByBody(nStartId, nStatus, nLevel, szLogTitle)
    return self:AddOnceByBody(nStartId, nStatus, nLevel, ITEM_D_EQUIP_CLOTH, szLogTitle);
end

function WItem:AddClothByRoute(nStartId, nStatus, nLevel, szLogTitle)
    return self:AddOnceByRoute(nStartId, nStatus, nLevel, ITEM_D_EQUIP_CLOTH, szLogTitle);
end
----------------------------------------------------------------------------------------------------
--- Common add shoe item
function WItem:AddShoe(nSetId, nStatus, nLevel, szLogTitle)
    return self:AddOnce(nSetId, nStatus, nLevel, ITEM_D_EQUIP_FOOT, szLogTitle);
end

function WItem:AddShoeByBody(nStartId, nStatus, nLevel, szLogTitle)
    return self:AddOnceByBody(nStartId, nStatus, nLevel, ITEM_D_EQUIP_FOOT, szLogTitle);
end

function WItem:AddShoeByRoute(nStartId, nStatus, nLevel, szLogTitle)
    return self:AddOnceByRoute(nStartId, nStatus, nLevel, ITEM_D_EQUIP_FOOT, szLogTitle);
end
----------------------------------------------------------------------------------------------------
--- Common add coat item
function WItem:AddCoatCapByBody(nStartId, nStatus, nLevel, szLogTitle)
    return self:AddOnceByBody(nStartId, nStatus, nLevel, ITEM_D_EQUIP_COAT_CAP, szLogTitle);
end

function WItem:AddCoatClothByBody(nStartId, nStatus, nLevel, szLogTitle)
    return self:AddOnceByBody(nStartId, nStatus, nLevel, ITEM_D_EQUIP_COAT_CLOTH, szLogTitle);
end

function WItem:AddCoatShoeByBody(nStartId, nStatus, nLevel, szLogTitle)
    return self:AddOnceByBody(nStartId, nStatus, nLevel, ITEM_D_EQUIP_COAT_TROUSERS, szLogTitle);
end
----------------------------------------------------------------------------------------------------
--- Common add orn item
function WItem:AddOrnCapByBody(nStartId, nStatus, nLevel, szLogTitle)
    return self:AddOnceByBody(nStartId, nStatus, nLevel, ITEM_D_EQUIP_ORNAMENT_CAP, szLogTitle);
end

function WItem:AddOrnClothByBody(nStartId, nStatus, nLevel, szLogTitle)
    return self:AddOnceByBody(nStartId, nStatus, nLevel, ITEM_D_EQUIP_ORNAMENT_CLOTH, szLogTitle);
end

function WItem:AddOrnShoeByBody(nStartId, nStatus, nLevel, szLogTitle)
    return self:AddOnceByBody(nStartId, nStatus, nLevel, ITEM_D_EQUIP_ORNAMENT_FOOT, szLogTitle);
end
----------------------------------------------------------------------------------------------------
--- Common add ring item
function WItem:AddJewelry(nStartRingId, nQuantity, szLogTitle, nStatus)
    nQuantity = tonumber(nQuantity) or 1;
    szLogTitle = szLogTitle or "AddJewelry";
    if type(nStartRingId) == "table" then
        local tbAward = {};
        for i = 1, getn(nStartRingId) do
            tinsert(tbAward, self:AddOnce(nStartRingId[i], nStatus, 0, ITEM_D_EQUIP_ADORN, szLogTitle));
        end
        return tbAward;
    end
    if type(nStartRingId) == "number" then
        local tbAward = {};
        for i = nStartRingId, nStartRingId + nQuantity - 1 do
            tinsert(tbAward, self:AddOnce(i, nStatus, 0, ITEM_D_EQUIP_ADORN, szLogTitle));
        end
        return tbAward;
    end
end

function WItem:AddJewelryByBody(nStartRingId, nQuantity, szLogTitle, nStatus)
    nStartRingId = nStartRingId + nQuantity * (WPlayer:GetBody() - 1);
    return self:AddJewelry(nStartRingId, nQuantity, szLogTitle, nStatus);
end

function WItem:AddJewelryByRoute(nStartRingId, szLogTitle, nStatus)
    local nPosition = WPlayer:GetRouteBodyOffset();
    nStartRingId = nStartRingId + nPosition;
    return self:AddJewelry(nStartRingId, 1, szLogTitle, nStatus);
end
----------------------------------------------------------------------------------------------------
--- Common add horse item
function WItem:AddHorse(nHorseId, nStatus, nExpiredTime, szLogTitle)
    nStatus = tonumber(nStatus) or ITEMSTATUS_LOCK;
    nExpiredTime = tonumber(nExpiredTime) or 0;
    local tbAward = {
        { tbProp = { ITEM_G_EQUIP, ITEM_D_EQUIP_HORSE, nHorseId }, nStatus = nStatus, nExpiredTime = nExpiredTime },
    };
    return WAward:Give(tbAward, szLogTitle);
end
----------------------------------------------------------------------------------------------------
--- Common add weapon
function WItem:AddWeaponByRoute(nWeaponId, nStatus, nLevel, szLogTitle)
    local nWeaponType = WPlayer:GetWeaponTypeByRoute();
    return self:AddOnce(nWeaponId, nStatus, nLevel, nWeaponType, szLogTitle);
end

function WItem:AddWeaponByBodyIndex(nWeaponSetStartId, nStatus, nLevel, szLogTitle)
    local nBodyOffset = WPlayer:GetRouteBodyOffset();
    local nWeaponId = nWeaponSetStartId + nBodyOffset;
    self:AddWeaponByRoute(nWeaponId, nStatus, nLevel, szLogTitle)
end

function WItem:AddWeaponByRouteIndex(nWeaponSetStartId, nStatus, nLevel, szLogTitle)
    local nWeaponId = nWeaponSetStartId + WPlayer:GetRouteIndex() - 1;
    self:AddWeaponByRoute(nWeaponId, nStatus, nLevel, szLogTitle);
end

function WItem:AddWeaponByRouteOffset(nStartSetId, nLevel, szLogTitle, nStatus)
    local nRouteOffset = self:RouteOffset();
    local nBodyOffset = WPlayer:GetRouteBodyOffset();
    local nWeaponId = nStartSetId + nRouteOffset + nBodyOffset;
    return self:AddWeaponByRoute(nWeaponId, nStatus, nLevel, szLogTitle);
end
----------------------------------------------------------------------------------------------------
--- Common add suit
function WItem:AddSuit(nSetId, nLevel, szLogTitle, nStatus)
    self:AddCap(nSetId, nStatus, nLevel, szLogTitle);
    self:AddCloth(nSetId, nStatus, nLevel, szLogTitle);
    self:AddShoe(nSetId, nStatus, nLevel, szLogTitle);
end

function WItem:AddSuitByBody(nStartId, nLevel, szLogTitle, nStatus)
    self:AddCapByBody(nStartId, nStatus, nLevel, szLogTitle);
    self:AddClothByBody(nStartId, nStatus, nLevel, szLogTitle);
    self:AddShoeByBody(nStartId, nStatus, nLevel, szLogTitle);
end

function WItem:AddSuitByRoute(nStartId, nLevel, szLogTitle, nStatus)
    self:AddCapByRoute(nStartId, nStatus, nLevel, szLogTitle);
    self:AddClothByRoute(nStartId, nStatus, nLevel, szLogTitle);
    self:AddShoeByRoute(nStartId, nStatus, nLevel, szLogTitle);
end

function WItem:AddSuitByRouteOffset(nStartSetId, nLevel, szLogTitle, nStatus)
    local nRouteOffset = self:RouteOffset();
    local nBodyOffset = WPlayer:GetRouteBodyOffset();
    return self:AddSuit(nStartSetId + nRouteOffset + nBodyOffset, nLevel, szLogTitle, nStatus);
end

function WItem:AddCoatByBody(nStartId, nStatus, nLevel, szLogTitle)
    self:AddCoatCapByBody(nStartId, nStatus, nLevel, szLogTitle);
    self:AddCoatClothByBody(nStartId, nStatus, nLevel, szLogTitle);
    self:AddCoatShoeByBody(nStartId, nStatus, nLevel, szLogTitle);
end

function WItem:AddOrnByBody(nStartId, nStatus, nLevel, szLogTitle)
    self:AddOrnCapByBody(nStartId, nStatus, nLevel, szLogTitle);
    self:AddOrnClothByBody(nStartId, nStatus, nLevel, szLogTitle);
    self:AddOrnShoeByBody(nStartId, nStatus, nLevel, szLogTitle);
end

----------------------------------------------------------------------------------------------------
--- Add bé trang bÞ ®Æc biÖt
function WItem:AddSuit_SuMon3(nLevel, nStatus, nGiveType, szLogTitle)
    nLevel = tonumber(nLevel) or 0;
    nGiveType = nGiveType or GIVETYPE_SUIT_RING_WEAPON;
    szLogTitle = szLogTitle or "NhËn trang bÞ SM3";

    local nRoute = WPlayer:GetRoute();

    if nGiveType >= GIVETYPE_SUIT then
        self:AddSuitByRoute(g_tbEquipSet_SuMon3[nRoute].nEquipStartId, nLevel, szLogTitle, nStatus)
    end

    if nGiveType >= GIVETYPE_SUIT_RING then
        self:AddJewelryByRoute(g_tbEquipSet_SuMon3[nRoute].nRing1StartId, szLogTitle, nStatus);
        self:AddJewelryByRoute(g_tbEquipSet_SuMon3[nRoute].nRing2StartId, szLogTitle, nStatus);
    end

    if nGiveType >= GIVETYPE_SUIT_RING_WEAPON then
        self:AddWeaponByBodyIndex(g_tbEquipSet_SuMon3[nRoute].nWeaponStartId, nStatus, nLevel, szLogTitle);
    end
end

function WItem:AddSuit_SuMon4(nLevel, nStatus, nGiveType, szLogTitle)
    nLevel = tonumber(nLevel) or 0;
    nGiveType = nGiveType or GIVETYPE_SUIT_RING_WEAPON;
    szLogTitle = szLogTitle or "NhËn trang bÞ SM4";

    local nRoute = WPlayer:GetRoute();

    if nGiveType >= GIVETYPE_SUIT then
        self:AddSuitByRoute(g_tbEquipSet_SuMon4[nRoute].nEquipStartId, nLevel, szLogTitle, nStatus);
    end

    if nGiveType >= GIVETYPE_SUIT_RING then
        self:AddJewelryByRoute(g_tbEquipSet_SuMon4[nRoute].nRing1StartId, szLogTitle, nStatus);
        self:AddJewelryByRoute(g_tbEquipSet_SuMon4[nRoute].nRing2StartId, szLogTitle, nStatus);
    end

    if nGiveType >= GIVETYPE_SUIT_RING_WEAPON then
        self:AddWeaponByBodyIndex(g_tbEquipSet_SuMon4[nRoute].nWeaponStartId, nStatus, nLevel, szLogTitle);
    end
end

function WItem:AddSuit_SuMon5(nLevel, nStatus, nGiveType, szLogTitle)
    nLevel = tonumber(nLevel) or 0;
    nGiveType = nGiveType or GIVETYPE_SUIT_RING_WEAPON;
    szLogTitle = szLogTitle or "NhËn trang bÞ SM5";

    local nRoute = WPlayer:GetRoute();

    if nGiveType >= GIVETYPE_SUIT then
        self:AddSuitByRoute(g_tbEquipSet_SuMon5[nRoute].nEquipStartId, nLevel, szLogTitle, nStatus);
    end

    if nGiveType >= GIVETYPE_SUIT_RING then
        self:AddJewelryByRoute(g_tbEquipSet_SuMon5[nRoute].nRing1StartId, szLogTitle, nStatus);
        self:AddJewelryByRoute(g_tbEquipSet_SuMon5[nRoute].nRing2StartId, szLogTitle, nStatus);
    end

    if nGiveType >= GIVETYPE_SUIT_RING_WEAPON then
        self:AddWeaponByBodyIndex(g_tbEquipSet_SuMon5[nRoute].nWeaponStartId, nStatus, nLevel, szLogTitle);
    end
end

function WItem:AddSuit_Buff35(nLevel, nStatus, nGiveType, szLogTitle)
    nLevel = tonumber(nLevel) or 0;
    nStatus = tonumber(nStatus) or ITEMSTATUS_LOCK;
    nGiveType = nGiveType or GIVETYPE_SUIT_RING_WEAPON;
    szLogTitle = szLogTitle or "NhËn trang bÞ buff 35%";

    local nBody = WPlayer:GetBody();
    local bRoute = WPlayer:GetRoute();

    if nGiveType >= GIVETYPE_SUIT then
        local tbAward = g_tbEquipSet_Buff35[nBody];
        tbAward[1].nLevel = nLevel;
        tbAward[2].nLevel = nLevel;
        tbAward[3].nLevel = nLevel;
        WAward:Give(tbAward, szLogTitle);
    end

    if nGiveType >= GIVETYPE_SUIT_RING then
        local tbAward = {};
        if WPlayer:GetSex() == WEnv.SEX_FEMALE then
            tinsert(tbAward, { tbProp = { ITEM_G_EQUIP, ITEM_D_EQUIP_ADORN, 1 }, nStatus = nStatus, tbParam = { 7, 41, 7, 42 } });
            tinsert(tbAward, { tbProp = { ITEM_G_EQUIP, ITEM_D_EQUIP_ADORN, 2 }, nStatus = nStatus, tbParam = { 7, 41, 7, 42 } });
        else
            tinsert(tbAward, { tbProp = { ITEM_G_EQUIP, ITEM_D_EQUIP_ADORN, 6 }, nStatus = nStatus, tbParam = { 7, 41, 7, 42 } });
            tinsert(tbAward, { tbProp = { ITEM_G_EQUIP, ITEM_D_EQUIP_ADORN, 7 }, nStatus = nStatus, tbParam = { 7, 41, 7, 42 } });
        end
        WAward:Give(tbAward, szLogTitle);
    end

    if nGiveType >= GIVETYPE_SUIT_RING_WEAPON then
        local tbAward = {};
        local nWeaponType = WPlayer:GetWeaponTypeByRoute();
        local nWeaponP = 40001;
        if bRoute == ROUTE_CONLON_KIEMTON then
            -- lo¹i kiÕm kh¸c c¸c ph¸i kh¸c
            nWeaponP = 40005;
        end
        if nWeaponType then
            tinsert(tbAward, { tbProp = { ITEM_G_EQUIP, nWeaponType, nWeaponP + WPlayer:GetBody() - 1 }, nStatus = nStatus, nLevel = nLevel, tbParam = { 7, 41, 7, 42, 7, 304 } });
        end
        WAward:Give(tbAward, szLogTitle);
    end
end

function WItem:AddSuit_ChienCuong(nLevel, nStatus, nGiveType, szLogTitle)
    nLevel = tonumber(nLevel) or 0;
    nGiveType = nGiveType or GIVETYPE_SUIT_RING_WEAPON;
    szLogTitle = szLogTitle or "NhËn trang bÞ ChiÕn Cuång";

    local nRoute = WPlayer:GetRoute();

    if nGiveType >= GIVETYPE_SUIT then
        if nRoute >= ROUTE_DUONGMON_NHAMHIEP then
            self:AddSuit(g_tbEquipSet_ChienCuong[nRoute].nEquipStartId, nLevel, szLogTitle, nStatus);
        else
            self:AddSuitByRoute(g_tbEquipSet_ChienCuong[nRoute].nEquipStartId, nLevel, szLogTitle, nStatus);
        end
    end

    if nGiveType >= GIVETYPE_SUIT_RING then
        -- bé nµy kh«ng cã nhÉn
    end

    if nGiveType >= GIVETYPE_SUIT_RING_WEAPON then
        if nRoute >= ROUTE_DUONGMON_NHAMHIEP then
            self:AddWeaponByRoute(g_tbEquipSet_ChienCuong[nRoute].nWeaponId, nStatus, nLevel, szLogTitle);
        else
            self:AddWeaponByBodyIndex(g_tbEquipSet_ChienCuong[nRoute].nWeaponId, nStatus, nLevel, szLogTitle);
        end
    end
end

function WItem:AddSuit_DieuDuong(nLevel, nStatus, nGiveType, szLogTitle)
    nLevel = tonumber(nLevel) or 0;
    nGiveType = nGiveType or GIVETYPE_SUIT_RING_WEAPON;
    szLogTitle = szLogTitle or "NhËn trang bÞ DiÖu D­¬ng";

    local nRoute = WPlayer:GetRoute();

    if nGiveType >= GIVETYPE_SUIT then
        self:AddSuitByRoute(g_tbEquipSet_DieuDuong[nRoute].nEquipStartId, nLevel, szLogTitle, nStatus);
    end

    if nGiveType >= GIVETYPE_SUIT_RING then
        self:AddJewelry(3190, 5, szLogTitle, nStatus);
    end

    if nGiveType >= GIVETYPE_SUIT_RING_WEAPON then
        self:AddWeaponByRoute(g_tbEquipSet_DieuDuong[nRoute].nWeaponId, nStatus, nLevel, szLogTitle);
    end
end

function WItem:AddSuit_AmHuyet(nLevel, nStatus, nGiveType, szLogTitle)
    nLevel = tonumber(nLevel) or 0;
    nGiveType = nGiveType or GIVETYPE_SUIT_RING_WEAPON;
    szLogTitle = szLogTitle or "NhËn trang bÞ Èm HuyÕt";

    local nRoute = WPlayer:GetRoute();
    if nGiveType >= GIVETYPE_SUIT then
        self:AddSuit(g_tbEquipSet_AmHuyet[nRoute].nEquipStartId, nLevel, szLogTitle, nStatus);
    end

    if nGiveType >= GIVETYPE_SUIT_RING then
        self:AddJewelry(g_tbEquipSet_AmHuyet[nRoute].nRing1StartId, 2, szLogTitle, nStatus);
        self:AddJewelry(g_tbEquipSet_AmHuyet[nRoute].nRing2StartId, 2, szLogTitle, nStatus);
    end

    if nGiveType >= GIVETYPE_SUIT_RING_WEAPON then
        if nRoute >= ROUTE_DUONGMON_NHAMHIEP then
            self:AddWeaponByRoute(g_tbEquipSet_AmHuyet[nRoute].nWeaponStartId, nStatus, nLevel, szLogTitle);
        else
            self:AddWeaponByRouteIndex(g_tbEquipSet_AmHuyet[nRoute].nWeaponStartId, nStatus, nLevel, szLogTitle);
        end
    end
end

function WItem:AddSuit_VanSuc(nLevel, nStatus, szLogTitle)
    nStatus = tonumber(nStatus) or ITEMSTATUS_LOCK;
    szLogTitle = szLogTitle or "NhËn V¨n Søc Lv" .. nLevel;

    nLevel = tonumber(nLevel) or 1;
    if WLib:CheckInv(5 + 3, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end
    if nLevel < 1 or nLevel > 5 then
        return WEnv.RETCODE_ERROR;
    end
    local nStart, nEnd = 31068, 31072;
    if nLevel == 2 then
        nStart, nEnd = 31073, 31077;
    end
    if nLevel == 3 then
        nStart, nEnd = 31261, 31265;
    end
    if nLevel == 4 then
        nStart, nEnd = 31405, 31409;
    end
    if nLevel == 5 then
        nStart, nEnd = 31618, 31622;
    end
    local tbAward = {};
    for i = nStart, nEnd do
        tinsert(tbAward, { tbProp = { ITEM_G_OTHER, ITEM_D_OTHER_MYSTER, i }, nStack = 1, nStatus = nStatus });
    end
    WAward:Give(tbAward, szLogTitle);
end

function WItem:AddSuit_VoSongChienThan(nLevel, nStatus, szLogTitle)
    nLevel = tonumber(nLevel) or 0;
    szLogTitle = szLogTitle or "NhËn trang bÞ V« Song ChiÕn ThÇn";

    self:AddCapByBody(30651, nStatus, nLevel, szLogTitle);
    self:AddClothByBody(30651, nStatus, nLevel, szLogTitle);
    self:AddShoeByBody(30651, nStatus, nLevel, szLogTitle);
end

function WItem:AddSuit_VoCucTinhMinh(nStatus, szLogTitle)
    szLogTitle = szLogTitle or "NhËn trang bÞ V« Cùc Minh Tinh";
    self:AddJewelry({ 31130, 31131 }, 1, szLogTitle, nStatus);
end

function WItem:AddSuit_ThienHaVoSong(nLevel, nStatus, szLogTitle)
    nLevel = tonumber(nLevel) or 0;
    szLogTitle = szLogTitle or "NhËn trang bÞ Thiªn H¹ V« Song";

    self:AddCapByBody(30207, nStatus, nLevel, szLogTitle);
    self:AddClothByBody(30207, nStatus, nLevel, szLogTitle);
    self:AddShoeByBody(30207, nStatus, nLevel, szLogTitle);
end

----------------------------------------------------------------------------------------------------
--- Add uÈn linh
function WItem:AddCixiu_Cap(nSetId, nStatus, szLogTitle)
    return self:AddOnce(nSetId, nStatus, 0, ITEM_D_EQUIP_WENSHI_H, szLogTitle);
end

function WItem:AddCixiu_Cloth(nSetId, nStatus, szLogTitle)
    return self:AddOnce(nSetId, nStatus, 0, ITEM_D_EQUIP_WENSHI_C, szLogTitle);
end

function WItem:AddCixiu_Shoe(nSetId, nStatus, szLogTitle)
    return self:AddOnce(nSetId, nStatus, 0, ITEM_D_EQUIP_WENSHI_T, szLogTitle);
end
----------------------------------------------------------------------------------------------------
--- Add ®¸ quý
function WItem:AddGem(nStack, nStatus, nLevel, nType, szLogTitle)
    nStack = tonumber(nStack) or 1;
    nStatus = tonumber(nStatus) or ITEMSTATUS_LOCK;
    nLevel = tonumber(nLevel) or 0;
    szLogTitle = szLogTitle or "AddGem";
    local nGemId = nType * 100 + nLevel;
    local tbAward = {
        { tbProp = { ITEM_G_OTHER, ITEM_D_OTHER_GEM, nGemId }, nStack = nStack, nStatus = nStatus, nLevel = nLevel },
    };
    return WAward:Give(tbAward, szLogTitle);
end
----------------------------------------------------------------------------------------------------
--- Add ®¸ quý
function WItem:AddToken(nLevel, szLogTitle)
    return self:AddOnce(nLevel, ITEMSTATUS_LOCK, 0, ITEM_D_EQUIP_TOKENS, szLogTitle);
end

---Hµm thªm vò khÝ nguyªn tö
---@param nLevel number CÊp vò khÝ: 7 8 9 ...
---@param bRandom number WEnv.FALSE= add vò khÝ theo hÖ ph¸i, mÆc ®Þnh lµ WEnv.TRUE= add vò khÝ random
---@param nStatus number Tr¹ng th¸i ®å kho¸
---@param szLogTitle string Tiªu ®Ò ghi log ng¾n gän
function WItem:AddWeapon_VKNT(nLevel, bRandom, nStatus, szLogTitle)
    nLevel = tonumber(nLevel) or 0;
    bRandom = bRandom or WEnv.TRUE;
    nStatus = nStatus or ITEMSTATUS_LOCK;
    szLogTitle = szLogTitle or "NhËn vò khÝ nguyªn tö Lv" .. nLevel;

    if nLevel < 7 or nLevel > 9 then
        return WEnv.RETCODE_ERROR;
    end

    local nWeaponId, nWeaponRoute = 0, 0;

    if bRandom == WEnv.TRUE then
        nWeaponId, nWeaponRoute = WLib:RandomTableValue(g_tbWeapon76, 1);
    else
        nWeaponId, nWeaponRoute = g_tbWeapon76[WPlayer:GetRoute()], WPlayer:GetRoute();
    end
    if not nWeaponId then
        return WEnv.RETCODE_ERROR;
    end

    if nLevel > 7 then
        nWeaponId = nWeaponId + abs(nLevel - 7);
    end

    if not g_tbWeaponSpeicalAttribute[nLevel] then
        return WEnv.RETCODE_ERROR;
    end

    local tbWeaponAttrCfgList = g_tbWeaponSpeicalAttribute[nLevel];
    local tbParam = { -1, -1, -1, -1, -1, -1 };
    for i = 1, 6 do
        if mod(i, 2) == 0 then
            local tbWeaponRandomAttr, nAttrCfgIndex = WLib:Random(tbWeaponAttrCfgList)
            while not tbWeaponRandomAttr or WLib:IsInTable(tbWeaponRandomAttr.nAttributeId, tbParam) do
                tbWeaponRandomAttr, nAttrCfgIndex = WLib:Random(tbWeaponAttrCfgList)
            end

            local tbWeaponRandomAttrLevel = WLib:Random(tbWeaponRandomAttr.tbLevelCfg);
            tbParam[i] = tbWeaponRandomAttr.nAttributeId;
            tbParam[i - 1] = tbWeaponRandomAttrLevel.nLevel;
        end
    end
    local tbAward = {
        tbProp = { ITEM_G_EQUIP, nWeaponRoute, nWeaponId }, tbParam = tbParam, nStatus = nStatus,
    };
    WAward:Give(tbAward, szLogTitle);
end

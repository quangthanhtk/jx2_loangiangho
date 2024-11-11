----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item r­¬ng ho¹t ®éng phã b¶n ®Þa huyÒn cung
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------


function OnUse(nItemIdx)
    if WLib:CheckInv(10, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    local tbRandomAward = {
        {nExp = 300000000, nRate = 20.00 }, --  -exp
        {nExp = 500000000, nRate = 15.00 }, --  - exp
        {nExp = 700000000, nRate = 5.00 }, --  - exp
        { tbProp = { 2, 1, 30492 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- ves Tieu Y bac
        { tbProp = { 2, 1, 30491 }, nStack = 1, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, -- Ve Tieu y Vang
        { tbProp = { 2, 102, 225 }, nStack = 1, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, -- Thuong hai 7
        { tbProp = { 2, 1, 40137 }, nStack = 1000, nRate = 4.00,nStatus = ITEMSTATUS_TRADE}, -- Bot Tran Chau Tinh Anh
        { tbProp = { 2, 1, 40143 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- M¶nh HuyÒn Thoai
        { tbProp = { 2, 1, 50257 }, nStack = 1, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, -- ThÎ më r­¬ng
        { tbProp = { 1, 0, 266 }, nStack = 20, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --ThÊt HoaTuju Nguyen Tan
        { tbProp = { 1, 0, 267 }, nStack = 20, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --ThÊt HoaTuju Nguyen Tan
        { tbProp = { 1, 0, 268 }, nStack = 20, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --ThÊt HoaTuju Nguyen Tan
        { tbProp = { 1, 0, 269 }, nStack = 20, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --ThÊt HoaTuju Nguyen Tan
        { tbProp = { 1, 0, 270 }, nStack = 20, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --ThÊt HoaTuju Nguyen Tan
        { tbProp = { 1, 0, 271 }, nStack = 20, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --ThÊt HoaTuju Nguyen Tan
        { tbProp = { 1, 0, 272 }, nStack =20, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --ThÊt HoaTuju Nguyen Tan
        { tbProp = { 1, 0, 273 }, nStack = 20, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --ThÊt HoaTuju Nguyen Tan
        { tbProp = { 1, 0, 274 }, nStack = 20, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --ThÊt HoaTuju Nguyen Tan
        { tbProp = { 1, 0, 275 }, nStack = 20, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --ThÊt HoaTuju Nguyen Tan
        { tbProp = { 2,0,141 }, nStack = 1, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --Tieu Kiep Tan
        { tbProp = { 2,1,30373 }, nStack = 20, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --Khac Ban Hoan my
        { tbProp = { 2, 1, 1124 }, nStack = 5, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- Banh it chan Ga
        { tbProp = { 2, 1, 1125 }, nStack = 5, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- Banh it bat Bao
        { tbProp = { 2, 1, 31614 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- Tay Tam 8
        { tbProp = { 2, 1, 31615 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- Luyen Lo 8
        { tbProp = { 2, 114, 143 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- Chan Vo hon  THac
        { tbProp = { 2, 1, 31248 }, nStack = 1, nRate = 6.00,nStatus = ITEMSTATUS_TRADE }, -- Tu Linh QUyet
    };
    local tbAward = {
        { szName = "Linh Ph¸ch d¬n", tbProp = { 2, 1, 31239 }, nStack = 50, nStatus = 1 },  --- Linh Ph¸ch d¬n
        { szName = "Manh Co Quan mac Gia", tbProp = { 2, 1, 31244 }, nStack = 2000, nStatus = 1 },  -- Manh Co Quan mac Gia
    };
    local addValue= GetTask(WTASKID_MAMNGUQUA2024) or 0;
    if addValue>=1000 then
        Msg2Player("B¹n ®· sö ®ông ®ñ giíi h¹n "..addValue.." M©m Ngò Qu¶")
        return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        local szKey = "item_mamnguqua"
        local nOpenType=1;
        WAward:GiveByRandom(tbRandomAward, format("%s_%d", szKey, nOpenType));
        SetTask(WTASKID_MAMNGUQUA2024,addValue+1);
        if addValue==999 then
            WAward:Give(tbAward, "1000_MamNguQua");
        end
    else
        WNpc:Talk("Thu håi vËt phÈm thÊt b¹i!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end
end

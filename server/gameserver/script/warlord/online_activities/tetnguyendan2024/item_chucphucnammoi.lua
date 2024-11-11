----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item r≠¨ng hoπt ÆÈng ph„ b∂n Æﬁa huy“n cung
----------------------------------------------------------------------------------------------------
Include("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------


function OnUse(nItemIdx)
    if WLib:CheckInv(10, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    local tbRandomAward = {
        {nExp = 500000000, nRate = 15.00 }, --  -exp
        {nExp = 1000000000, nRate = 10.00 }, --  - exp
        {nExp = 1000000000, nRate = 5.00 }, --  - exp
        { nFunc = "event_give_phonghoa_2024(5000)", nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- 5000dPhongHoa
        { nFunc = "event_give_phonghoa_2024(10000)", nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, -- 10000dPhongHoa
        { tbProp = { 2, 102, 225 }, nStack = 1, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, -- Thuong hai 7
        { tbProp = { 2, 1, 40137 }, nStack = 1000, nRate = 4.00,nStatus = ITEMSTATUS_TRADE}, -- Bot Tran Chau Tinh Anh
        { tbProp = { 2, 1, 40143 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- M∂nh Huy“n Thoai
        { tbProp = { 2, 1, 30370 }, nStack = 2, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, --Thien cang Lenh
        { tbProp = { 2, 95, 204 }, nStack = 2, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, --Thien Mon Kim Lenh
        { tbProp = { 2, 1, 31604 }, nStack = 2, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --Tinh van Toa Linh Thach
        { tbProp = { 2, 1, 31605 }, nStack = 2, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --Tinh van Toa Linh Thach
        { tbProp = { 2, 1, 31606 }, nStack = 2, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --Tinh van Toa Linh Thach
        { tbProp = { 2, 1, 31607 }, nStack = 2, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --Tinh van Toa Linh Thach
        { tbProp = { 2, 1, 31608 }, nStack = 2, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --Tinh van Toa Linh Thach
        { tbProp = { 2, 1, 31609 }, nStack = 2, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --Tinh van Toa Linh Thach
        { tbProp = { 2, 1, 31614 }, nStack = 5, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, -- Tay Tam 8
        { tbProp = { 2, 1, 31615 }, nStack = 5, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, -- Luyen Lo 8
        { tbProp = { 2, 1, 31514 }, nStack = 1, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, -- chu tuoc hon
        { tbProp = { 2, 1, 1124 }, nStack = 5, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- Banh it chan Ga
        { tbProp = { 2, 1, 1125 }, nStack = 5, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- Banh it bat Bao
        { tbProp = { 2, 1, 31614 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- Tay Tam 8
        { tbProp = { 2, 1, 31615 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- Luyen Lo 8
        { tbProp = { 2, 1, 30687 }, nStack = 50, nRate = 10.00,nStatus = ITEMSTATUS_TRADE }, -- Thai Nhat Lenh
        { tbProp = { 2, 1, 31515 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- Chu Tuoc Tinh Hoa
    };
    local tbAward = {
        { szName = "ThŒ Ph∏t S∏ng VÚ Kh›", tbProp = { 2, 1, 31507 }, nStack = 5, nStatus = 1 },  --- The Phat Sang Vu Khi
        --{ szName = "C©y ßµo", tbProp = { 2, 1, 31244 }, nStack = 2000, nStatus = 1 },  -- Manh Co Quan mac Gia
    };
    local nCheckTienXuMM=GetTask(WTASKID_TIENXUMAYMAN2024) or 0;
    local addValue= GetTask(WTASKID_CHUCPHUCMAYMAN2024) or 0;
    if nCheckTienXuMM <1000 then
        WNpc:Talk("Bπn ch≠a sˆ dÙng ÆÒ 1000 ßÂng Ti“n Xu May Mæn n™n kh´ng mÎ Æ≠Óc", WEnv.TRUE);
        return
    end
    if addValue>=1000 then
        Msg2Player("Bπn Æ∑ sˆ ÆÙng ÆÒ giÌi hπn "..addValue.." M©m NgÚ Qu∂")
        return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        local szKey = "item_TienXuMayMan"
        local nOpenType=1;
        WAward:GiveByRandom(tbRandomAward, format("%s_%d", szKey, nOpenType));
        SetTask(WTASKID_CHUCPHUCMAYMAN2024,addValue+1);
        if addValue==999 then
            WAward:Give(tbAward, "The_phat_sang");
            AddTitle(200, 2)
            Msg2Player("Bπn nhÀn Æ≠Óc danh hi÷u Chi’n Th«n")
        end
    else
        WNpc:Talk("Thu hÂi vÀt ph»m th t bπi!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end
end
function event_give_phonghoa_2024(nValue)
    local nPoint = nValue or 0;
    SetTask(3407,GetTask(3407)+nPoint)
    Msg2Player("NhÀn Æ≠c "..nPoint.." Æi”m Phong Hoa")
end
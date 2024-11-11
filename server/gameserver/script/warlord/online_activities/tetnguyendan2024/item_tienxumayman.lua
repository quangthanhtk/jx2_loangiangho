----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item r��ng ho�t ��ng ph� b�n ��a huy�n cung
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
        --{ tbProp = { 2, 1, 30492 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- ves Tieu Y bac
        { nFunc = "event_give_phonghoa_2024(1000)", nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- 1000dPhongHoa
        { nFunc = "event_give_phonghoa_2024(5000)", nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, -- 5000dPhongHoa
        --{ tbProp = { 2, 1, 30491 }, nStack = 1, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, -- Ve Tieu y Vang
        { tbProp = { 2, 102, 225 }, nStack = 1, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, -- Thuong hai 7
        { tbProp = { 2, 1, 40137 }, nStack = 1000, nRate = 4.00,nStatus = ITEMSTATUS_TRADE}, -- Bot Tran Chau Tinh Anh
        { tbProp = { 2, 1, 40143 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- M�nh Huy�n Thoai
        { tbProp = { 2, 1, 31604 }, nStack = 2, nRate = 2.00,nStatus = ITEMSTATUS_TRADE }, --Tinh van Toa Linh Thach
        { tbProp = { 2, 1, 31605 }, nStack = 2, nRate = 2.00,nStatus = ITEMSTATUS_TRADE }, --Tinh van Toa Linh Thach
        { tbProp = { 2, 1, 31606 }, nStack = 2, nRate = 2.00,nStatus = ITEMSTATUS_TRADE }, --Tinh van Toa Linh Thach
        { tbProp = { 2, 1, 31607 }, nStack = 2, nRate = 2.00,nStatus = ITEMSTATUS_TRADE }, --Tinh van Toa Linh Thach
        { tbProp = { 2, 1, 31608 }, nStack = 2, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --Tinh van Toa Linh Thach
        { tbProp = { 2, 1, 31609 }, nStack = 2, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, --Tinh van Toa Linh Thach
        { tbProp = { 2, 1, 31614 }, nStack = 5, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, -- Tay Tam 8
        { tbProp = { 2, 1, 31615 }, nStack = 5, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, -- Luyen Lo 8
        { tbProp = { 2, 1, 50257 }, nStack = 1, nRate = 1.00,nStatus = ITEMSTATUS_TRADE }, -- Th� m� r��ng
        { tbProp = { 2, 1, 1124 }, nStack = 5, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- Banh it chan Ga
        { tbProp = { 2, 1, 1125 }, nStack = 5, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- Banh it bat Bao
        { tbProp = { 2, 1, 31614 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- Tay Tam 8
        { tbProp = { 2, 1, 31615 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- Luyen Lo 8
        { tbProp = { 2, 114, 143 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_TRADE }, -- Chan Vo hon  THac
        { tbProp = { 2, 1, 31248 }, nStack = 1, nRate = 6.00,nStatus = ITEMSTATUS_TRADE }, -- Tu Linh QUyet
    };
    local tbAward = {
        { szName = "C�y ��o", tbProp = { 2, 1, 31239 }, nStack = 50, nStatus = 1 },  --- Linh Ph�ch d�n
        { szName = "C�y ��o", tbProp = { 2, 1, 31244 }, nStack = 2000, nStatus = 1 },  -- Manh Co Quan mac Gia
    };
    local nCheckMamNguQua=GetTask(WTASKID_MAMNGUQUA2024) or 0;
    local addValue= GetTask(WTASKID_TIENXUMAYMAN2024) or 0;
    if nCheckMamNguQua <1000 then
        WNpc:Talk("B�n ch�a s� ��ng �� 1000 M�m Ng� Qu� n�n kh�ng m� ���c", WEnv.TRUE);
        --Msg2Player("B�n ch�a s� ��ng �� 1000 M�m Ng� Qu� n�n kh�ng m� ���c")
        return
    end
    if addValue>=1000 then
        Msg2Player("B�n �� s� ��ng �� gi�i h�n "..addValue.." M�m Ng� Qu�")
        return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        local szKey = "item_TienXuMayMan"
        local nOpenType=1;
        WAward:GiveByRandom(tbRandomAward, format("%s_%d", szKey, nOpenType));
        SetTask(WTASKID_TIENXUMAYMAN2024,addValue+1);
        if addValue==999 then
            AddTitle(200, 1)
            Msg2Player("B�n nh�n ���c danh hi�u Ph� V��ng")
        end
    else
        WNpc:Talk("Thu h�i v�t ph�m th�t b�i!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end
end
function event_give_phonghoa_2024(nValue)
    local nPoint = nValue or 0;
    SetTask(3407,GetTask(3407)+nPoint)
    Msg2Player("Nh�n ��c "..nPoint.." �i�m Phong Hoa")
end

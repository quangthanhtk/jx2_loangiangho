----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-30
--- Description: item m�nh m�t t�ch cao c�p ��i ra m�t t�ch 20%
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_szNpcName = "<color=green>T�i Kim X�<color>: ";



function OnUse(nItemIdx)
    if WLib:CheckInv(40, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    local tbAward = {
        { tbProp = { 2, 97, 236 }, nStack = 5000, nStatus = ITEMSTATUS_LOCK }, -- Thi�n ki�u l�nh
        { tbProp = { 2, 1, 40046 }, nStack = 500, nStatus = ITEMSTATUS_LOCK }, -- M�nh T�y Bi�n Ch�u 7
        { tbProp = { 2, 102, 225 }, nStack = 50, nStatus = ITEMSTATUS_LOCK }, --th��ng h�i di ch�u 7
        { tbProp = {2,1,40030 }, nStack = 20, nStatus = ITEMSTATUS_LOCK }, --t�i  �� qu� 8
        { tbProp = {2,114,144 }, nStack = 10, nStatus = ITEMSTATUS_LOCK }, --��i Ch�n V� H�n Th�ch
        { tbProp = { 2, 1, 40017 }, nStack = 2000, nStatus = ITEMSTATUS_LOCK }, -- Ruong dia huyen cung
        { tbProp = { 2, 1, 40018 }, nStack = 2000, nStatus = ITEMSTATUS_LOCK }, -- Ruong LSB
        { tbProp = { 2, 1, 31766 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Ruong Thai hu
        { tbProp = { 2, 1, 31767 }, nStack = 1000, nStatus = ITEMSTATUS_LOCK }, -- Ruong Tang Kiem
        { tbProp = { 2, 95, 204 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- Thi�n Cang l�nh
        { tbProp = { 2, 1, 30370 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- Thi�n m�n Kim L�nh
        { tbProp = { 2, 1, 31239 }, nStack = 30, nStatus = ITEMSTATUS_LOCK }, -- Linh Ph�ch �n
    };
    if WItem:DelByIndex(nItemIdx, 1) ~= WEnv.RETCODE_SUCCESS then
        WNpc:Talk("Thu h�i v�t ph�m th�t b�i!", WEnv.TRUE);
        return WEnv.RETCODE_ERROR;
    end
    WAward:Give(tbAward, "ThanhVanDaiPhu");

end

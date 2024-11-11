----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item t�i/r��ng m� ra c�c v�t ph�m con
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
----------------------------------------------------------------------------------------------------
m_NORMAL_ITEM =
{	-- 10 lo�i lak Th�t hoa t� nguy�n t�n
    [1] = {1,0,266},
    [2] = {1,0,267},
    [3] = {1,0,268},
    [4] = {1,0,269},
    [5] = {1,0,270},
    [6] = {1,0,271},
    [7] = {1,0,272},
    [8] = {1,0,273},
    [9] = {1,0,274},
    [10] = {1,0,275}
}
function give_ThatHoaTuNguyenTan()
    local nRandom= random(1,10)
    local tbAward = {
        { tbProp = m_NORMAL_ITEM[nRandom], nStack = 10, nStatus = ITEMSTATUS_TRADE }, -- Th�t hoa t� nguy�n t�n
    };
    WAward:Give(tbAward, "Bia");

end

m_tbPackItemList = {
    [PackItemId(2, 1, 40160)] = {
                                  nTaskID=4091,
                                  szName = "Bia V�a H�",
                                  tbItems = {
                                      { tbProp = { 2, 102, 223 }, nStack = 1, nRate = 5.00 }, -- 1th��ng h�i di ch�u c5
                                      { tbProp = { 2, 102, 224 }, nStack = 1, nRate = 3.00 }, -- 1th��ng h�i di ch�u c6
                                      { tbProp = { 2, 102, 225 }, nStack = 1, nRate = 2.00 }, -- 1th��ng h�i di ch�u c7
                                      { tbProp = { 2, 1, 1009 }, nStack = 1, nRate = 2.00 }, -- 1 Thi�n th�ch tinh th�ch
                                      { tbProp = { 2, 1, 30847 }, nStack = 1, nRate = 5.00 }, -- H�i ti�n ��n
                                      { tbProp = { 2, 1, 30410 }, nStack = 2, nRate = 5.00 }, -- M�nh thi�n cang
                                      { tbProp = { 2, 1, 30370 }, nStack = 1, nRate = 2.00 }, -- Thi�n m�n kim l�nh
                                      { tbProp = { 2, 114, 143 }, nStack = 1, nRate = 5.00 }, -- Ch�n V� H�n Th�ch
                                      { tbProp = { 2, 1, 1125 }, nStack = 1, nRate = 5.00 }, -- b�nh �t B�c B�o
                                      { tbProp = { 2, 1, 1124 }, nStack = 1, nRate = 3.00 }, -- b�nh �t ch�n g�
                                      { tbProp = { 2, 1, 31394 }, nStack = 1, nRate = 3.00 }, -- X� Qu�n T�a Linh Th�ch 4
                                      { tbProp = { 2, 1, 31395 }, nStack = 1, nRate = 3.00 }, -- X� Qu�n T�a Linh Th�ch 5
                                      { tbProp = { 2, 1, 31396 }, nStack = 1, nRate = 3.00 }, -- X� Qu�n T�a Linh Th�ch 6
                                      { tbProp = { 2, 1, 30912 }, nStack = 10, nRate = 2.00 }, -- Hi�p Ngh�a chi Ch�ng
                                      { tbProp = { 2, 1, 9999 }, nStack = 1, nRate = 3.00 }, -- qu�n c�ng ch��ng
                                      { tbProp = { 2, 1, 9998 }, nStack = 1, nRate = 2.00 }, -- qu�n c�ng ��i
                                      { tbProp = { 2, 1, 30499 }, nStack = 50, nRate = 5.00 }, -- Hu�n ch��ng anh h�ng
                                      { tbProp = { 2, 1, 30428 }, nStack = 1, nRate = 1.50 }, -- 1ma �ao th�ch c1
                                      { tbProp = { 2, 1, 30429 }, nStack = 1, nRate = 4.00 }, -- 1ma �ao th�ch c2
                                      { tbProp = { 2, 1, 30430 }, nStack = 1, nRate = 3.00 }, -- 1ma �ao th�ch c3
                                      { tbProp = { 2, 1, 31122 }, nStack = 5, nRate = 3.00 }, -- Linh kh� r�c r�
                                      { tbProp = { 2, 1, 31614 }, nStack = 1, nRate = 3.00 }, -- Luy�n L� Thi�t C8
                                      { tbProp = { 2, 1, 31401 }, nStack = 1, nRate = 5.00 }, -- Luy�n L� Thi�t C7
                                      { tbProp = { 2, 1, 30532 }, nStack = 1, nRate = 6.00 }, -- Luy�n L� Thi�t lv6
                                      { tbProp = { 2, 1, 30687 }, nStack = 5, nRate = 7.00 }, -- Th�i Nh�t L�nh
                                      { tbProp = { 2, 201, 15 }, nStack = 1, nRate = 0.50, nStatus = ITEMSTATUS_TRADE }, -- �i�m Tinh Ng�c
                                      { tbProp = { 2, 1, 30218 }, nStack = 1, nRate = 2.00 }, -- Tr�ng ng�u nhi�n
                                      { nFunc = "give_ThatHoaTuNguyenTan()",nRate=10 }, -- Th�t Hoa t� nguy�n
                                  },
    },
    [PackItemId(2, 1, 40161)] = {
                                  nTaskID=4092,
                                  szName = "Bia ��c Bi�t",
                                  tbItems = {
                                      { tbProp = { 2, 102, 223 }, nStack = 1, nRate = 5.00 }, -- 1th��ng h�i di ch�u c5
                                      { tbProp = { 2, 102, 224 }, nStack = 1, nRate = 3.00 }, -- 1th��ng h�i di ch�u c6
                                      { tbProp = { 2, 102, 225 }, nStack = 1, nRate = 2.00 }, -- 1th��ng h�i di ch�u c7
                                      { tbProp = { 2, 1, 1009 }, nStack = 1, nRate = 5.00 }, -- 1 Thi�n th�ch tinh th�ch
                                      { tbProp = { 2, 1, 30847 }, nStack = 1, nRate = 5.00 }, -- H�i ti�n ��n
                                      { tbProp = { 2, 1, 30390 }, nStack = 10, nRate = 5.00 }, -- M�nh thi�n cang
                                      { tbProp = { 2, 95, 204 }, nStack = 1, nRate = 2.00 }, -- Thi�n cang
                                      { tbProp = { 2, 114, 143 }, nStack = 1, nRate = 5.00 }, -- Ch�n V� H�n Th�ch
                                      { tbProp = { 2, 1, 30424 }, nStack = 1, nRate = 5.00 }, -- 1 B�a c��ng h�a 12
                                      { tbProp = { 2, 1, 30425 }, nStack = 1, nRate = 5.00 }, -- 1 B�a c��ng h�a 13
                                      { tbProp = { 2, 1, 30426 }, nStack = 1, nRate = 3.00 }, -- 1 B�a c��ng h�a 14
                                      { tbProp = { 2, 1, 30427 }, nStack = 1, nRate = 3.00 }, -- 1 B�a c��ng h�a 15
                                      { tbProp = { 2, 1, 3204 }, nStack = 1, nRate = 2.00 }, -- 1 Ng Th�i Lung T�y
                                      { tbProp = { 2, 1, 31394 }, nStack = 1, nRate = 3.00 }, -- X� Qu�n T�a Linh Th�ch 4
                                      { tbProp = { 2, 1, 31395 }, nStack = 1, nRate = 3.00 }, -- X� Qu�n T�a Linh Th�ch 5
                                      { tbProp = { 2, 1, 31396 }, nStack = 1, nRate = 2.00 }, -- X� Qu�n T�a Linh Th�ch 6
                                      { tbProp = { 2, 1, 30912 }, nStack = 10, nRate = 2.00 }, -- Hi�p Ngh�a chi Ch�ng
                                      { tbProp = { 2, 1, 9999 }, nStack = 1, nRate = 4.00 }, -- qu�n c�ng ch��ng
                                      { tbProp = { 2, 1, 9998 }, nStack = 1, nRate = 5.00 }, -- qu�n c�ng ��i
                                      { tbProp = { 2, 1, 30218 }, nStack = 1, nRate = 3.00 }, -- Tr�ng ng�u nhi�n
                                      { tbProp = { 2, 1, 30499 }, nStack = 50, nRate = 3.00 }, -- Hu�n ch��ng anh h�ng
                                      { tbProp = { 2, 1, 31122 }, nStack = 5, nRate = 2.00 }, -- Linh kh� r�c r�
                                      { tbProp = { 2, 1, 30526 }, nStack = 1, nRate = 5.00 }, -- Tay Tam Thach lv6
                                      { tbProp = { 2, 1, 31402 }, nStack = 1, nRate = 4.00 }, -- Tay Tam Thach lv7
                                      { tbProp = { 2, 1, 31615 }, nStack = 1, nRate = 2.00 }, -- Tay Tam Thach lv8
                                      { nFunc = "give_ThatHoaTuNguyenTan()",nRate=10 },  -- Th�t Hoa t� nguy�n
                                  },
    },
}
tbAward_event2024 = {
    [4091]={
        { tbProp = { 2, 1, 31244 }, nStack = 500, nStatus = ITEMSTATUS_TRADE }, -- M�nh c� quan m�c Gia
        { tbProp = { 2, 1, 50257 }, nStack = 50, nStatus = ITEMSTATUS_TRADE }, -- L�nh b�i m� r�ng r��ng
        { tbProp = { 2, 1, 31239 }, nStack = 20, nStatus = ITEMSTATUS_TRADE } -- Linh Ph�ch ��n
    },
    [4092]={
        { tbProp = { 2, 1, 31244 }, nStack = 1000, nStatus = ITEMSTATUS_TRADE }, -- M�nh c� quan m�c Gia
        { tbProp = { 2, 1, 31239 }, nStack = 30, nStatus = ITEMSTATUS_TRADE }, -- Linh Ph�ch ��n
        { tbProp = { 2, 1, 30912 }, nStack = 10000, nStatus = ITEMSTATUS_TRADE }, -- Hi�p Ngh�a chi Ch�ng
        { nPhongHoa = 60000 } -- �i�m Phong Hoa
    },
};
function OnUse(nItemIdx)
    if WLib:CheckInv(5, 100) ~= WEnv.TRUE then
        return WEnv.RETCODE_NEEDROOM;
    end

    local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
    local nPackItemtId = PackItemId(nGenre, nDetail, nParticular);
    if m_tbPackItemList[nPackItemtId] ~= WEnv.NULL then
        if WItem:DelByIndex(nItemIdx, 1) == WEnv.RETCODE_SUCCESS then
            WAward:Give(m_tbPackItemList[nPackItemtId].tbItems, m_tbPackItemList[nPackItemtId].szName);
            SetTask(m_tbPackItemList[nPackItemtId].nTaskID,GetTask(m_tbPackItemList[nPackItemtId].nTaskID)+1)
            local Point =GetTask(m_tbPackItemList[nPackItemtId].nTaskID);
            local iDaWard=m_tbPackItemList[nPackItemtId].nTaskID
            if Point==2000 then
                WAward:Give(tbAward_event2024[iDaWard],"Moc_Thuong_200")
            end
            return WEnv.RETCODE_SUCCESS;
        else
            WNpc:Talk("Thu h�i th�t b�i.", 1);
            return WEnv.RETCODE_CONSUMEERROR;
        end
    else
        WNpc:Talk("B�n trong tr�ng r�ng, kh�ng thu ���c g�.", 1);
        return WEnv.RETCODE_CONSUMEERROR;
    end
end

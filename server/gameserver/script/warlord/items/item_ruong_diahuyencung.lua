----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item r��ng ho�t ��ng ph� b�n ��a huy�n cung
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\items\\item_box_base.lua");
----------------------------------------------------------------------------------------------------
m_tbItem = inherit(WItemBoxBase, {
    szKey = "item_ruong_diahuyencung",
    szName = "R��ng ��a Huy�n Cung",

    nOpenTypeTaskTempId = WTASKTEMP_RUONG_DHC_OPENTYPE,

    bEnableLimitDaily = WEnv.FALSE,
    nLimitDailyTaskId = WTASKID_RUONG_DHC_DAILY_COUNT,
    nLimitDailyCount = 0,

    tbAwardTypes = {
        [1] = { szName = "M� b�ng 1 Thi�n Ki�u L�nh",
                tbItemConsumes = {
                    tbItems = {
                        { tbProp = { 2, 1, 40018 }, nCount = 1 }, -- R��ng ��a Huy�n Cung
                        { tbProp = { 2, 97, 236 }, nCount = 1 }, -- Thi�n Ki�u L�nh
                    },
                },
                tbFixedAward = {
                    { nExp = 1 },
                    --{ nChanKhi = 50 },
                    { nGold = 10000 },
                    --{ nPopur2 = 1 },
                },
                tbRandomAward = {
                    { tbProp = { 2, 1, 31401 }, nStack = 1, nRate = 2.00 }, -- Luy�n l� thi�t c7
                    { tbProp = { 2, 1, 30532 }, nStack = 1, nRate = 3.00 }, -- Luy�n l� thi�t c6
                    { tbProp = { 2, 1, 30531 }, nStack = 1, nRate = 6.00 }, -- Luy�n l� thi�t c5
                    { tbProp = { 2, 1, 30530 }, nStack = 1, nRate = 10.00 }, -- Luy�n l� thi�t c4
                    { tbProp = { 2, 102, 221 }, nStack = 1, nRate = 13.00 }, -- 1th��ng h�i di ch�u c4
                    { tbProp = { 2, 1, 30499 }, nStack = 50, nRate = 1.100 }, -- Hu�n ch��ng anh h�ng
                    { tbProp = { 2, 1, 30410 }, nStack = 1, nRate = 10.00 }, -- M�nh thi�n m�n
                    { tbProp = { 2, 1, 30847 }, nStack = 1, nRate = 3.00 }, -- H�i ti�n ��n
                    { tbProp = { 2, 1, 9999 }, nStack = 1, nRate = 2.00 }, -- Qu�n c�ng ch��ng
                    { tbProp = { 2, 1, 9998 }, nStack = 1, nRate = 2.00 }, -- Qu�n c�ng ��i
                    { tbProp = { 2, 0, 554 }, nStack = 1, nRate = 5.00 }, -- Tu ch�n y�u qu�t
                    { tbProp = { 2, 0, 553 }, nStack = 1, nRate = 2.00 }, -- ��i Nh�n S�m
                    { tbProp = { 2, 0, 552 }, nStack = 1, nRate = 2.00 }, -- Ti�u nh�n s�m
                    { tbProp = { 2, 1, 30428 }, nStack = 1, nRate = 1.00 }, -- 1ma �ao th�ch c1
                    { tbProp = { 2, 1, 30429 }, nStack = 1, nRate = 1.00 }, -- 1ma �ao th�ch c2
                    { tbProp = { 2, 1, 30430 }, nStack = 1, nRate = 1.00 }, -- 1ma �ao th�ch c3
                    { tbProp = { 2, 102, 224 }, nStack = 1, nRate = 1.00 }, -- 1th��ng h�i di ch�u 6
                    { tbProp = { 2, 1, 31505 }, nStack = 1, nRate = 0.5 }, -- T�i �� Qu� C�p 7
                    { tbProp = { 2, 1, 30370 }, nStack = 1, nRate = 0.75 }, -- Thi�n m�n kim l�nh
                    { tbProp = { 2, 1, 30731 }, nStack = 1, nRate = 0.50 }, -- Kinh m�ch ng�n nh�n
                    { tbProp = { 2, 102, 225 }, nStack = 1, nRate = 0.50 }, -- 1th��ng h�i di ch�u 7
                    { tbProp = { 2, 1, 30544 }, nStack = 1, nRate = 0.50 }, -- T�i Kim X� 3
                    { tbProp = { 2, 1, 1009 }, nStack = 1, nRate = 0.50 }, -- 1 Thi�n th�ch tinh th�ch
                    { tbProp = { 2, 1, 30424 }, nStack = 1, nRate = 3.00 }, -- 1 B�a c��ng h�a 12
                    { tbProp = { 2, 1, 30425 }, nStack = 1, nRate = 2.00 }, -- 1 B�a c��ng h�a 13
                    { tbProp = { 2, 1, 30426 }, nStack = 1, nRate = 1.00 }, -- 1 B�a c��ng h�a 14
                    { tbProp = { 2, 1, 30427 }, nStack = 1, nRate = 0.30 }, -- 1 B�a c��ng h�a 15
                    { tbProp = { 2, 1, 3204 }, nStack = 1, nRate = 1.00 } , -- 1 NG� TH�I LUNG T�Y
                    { tbProp = { 2, 1, 40047 }, nStack = 1, nRate = 1.00 }, -- 1 M�nh b� �i�n 25
                    { tbProp = { 2, 1, 40037 }, nStack = 1, nRate = 1.00 }, -- 1 T�i k� n�ng BDH c�p 6
                    { tbProp = { 2, 201, 16 }, nStack = 1, nRate = 0.01,nStatus = ITEMSTATUS_TRADE }, -- 1 �i�m tinh ng�c - nh�
                    { tbProp = { 2, 1, 31096 }, nStack = 1, nRate = 10.00 }, -- 1 L�u tinh
                    { tbProp = { 2, 201, 13 }, nStack = 1, nRate = 10.00 }, -- 1 Thi�n v�n th�ch
                },
        },
    },
});
m_szNpcName = format("<color=green>%s<color>: ", m_tbItem.szName);

function OnUse(nItemIdx)
    m_tbItem:OnUse(nItemIdx);
end

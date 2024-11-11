----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item r��ng ho�t ��ng ph� b�n ki�m ��ng y�n v�n
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\items\\item_box_base.lua");
----------------------------------------------------------------------------------------------------
m_tbRandomArmoryBoxLv1 = {
    { [1] = { szName = "Kh�c B�n V� C�p 1 (��u)", tbProp = { 2, 1, 31068 }, nStack = 1, nStatus = 3 }, nRate = 20.00 },
    { [1] = { szName = "Kh�c B�n V� C�p 1 (�o)", tbProp = { 2, 1, 31069 }, nStack = 1, nStatus = 3 }, nRate = 20.00 },
    { [1] = { szName = "Kh�c B�n V� C�p 1 (Qu�n)", tbProp = { 2, 1, 31070 }, nStack = 1, nStatus = 3 }, nRate = 20.00 },
    { [1] = { szName = "Kh�c B�n V� C�p 1 (Nh�n)", tbProp = { 2, 1, 31071 }, nStack = 1, nStatus = 3 }, nRate = 20.00 },
    { [1] = { szName = "Kh�c B�n V� C�p 1 (Ng�c B�i)", tbProp = { 2, 1, 31072 }, nStack = 1, nStatus = 3 }, nRate = 20.00 },
};
m_tbItem = inherit(WItemBoxBase, {
    szKey = "item_ruong_kiemdangyenvan",
    szName = "R��ng Ki�m ��ng Y�n V�n",

    nOpenTypeTaskTempId = WTASKTEMP_RUONG_KDYV_OPENTYPE,

    bEnableLimitDaily = WEnv.FALSE,
    nLimitDailyTaskId = WTASKID_RUONG_KDYV_DAILY_COUNT,
    nLimitDailyCount = 0,

    tbAwardTypes = {
        [1] = { szName = "M� mi�n ph�",
                tbItemConsumes = {
                    tbItems = {
                        { tbProp = { 2, 1, 40020 }, nCount = 1 }, -- R��ng Ki�m ��ng Y�n V�n
                    },
                },
                tbFixedAward = {
                    { nExp = 2000000 },
                    { nChanKhi = 50 },
                },
                tbRandomAward = {
                    { tbProp = { 2,1,30525}, nStack = 1, nRate = 6.00 }, -- H�i Ti�n ��n
                    { tbProp = { 2,1,30531}, nStack = 1, nRate = 6.00}, -- H�i Ti�n ��n
                    { tbProp = { 2,102, 208}, nStack = 1, nRate = 24.00}, -- 1 Th��ng H�i Di Ch�u 1
                    { tbProp = { 2,102, 209}, nStack = 1, nRate = 5.00},-- 1 Th��ng H�i Di Ch�u2
                    { tbProp = { 2,102, 210}, nStack = 1, nRate = 3.00}, --1 Th��ng H�i Di Ch�u3
                    { tbProp = { 2,102, 211},nStack = 1, nRate = 1.00 }, -- 1 Th��ng H�i Di Ch�u4
                    { tbProp = { 2,1,30847}, nStack = 1, nRate = 10.00,nStatus = ITEMSTATUS_LOCK}, -- H�i Ti�n ��n
                    { tbProp = { 2, 1, 30731 }, nStack = 1, nRate = 5.00,nStatus = ITEMSTATUS_LOCK }, -- Kinh m�ch ng�n nh�n
                    { tbProp = { 2, 1, 30998 }, nStack = 1, nRate = 3.375,nStatus = ITEMSTATUS_LOCK }, -- T�i �� qu� 1
                    { tbProp = { 2, 1, 30999 }, nStack = 1, nRate = 3.375 ,nStatus = ITEMSTATUS_LOCK}, -- T�i �� qu� 2
                    { tbProp = { 2, 1, 31000 }, nStack = 1, nRate = 3.375,nStatus = ITEMSTATUS_LOCK }, -- T�i �� qu� 3
                    { tbProp = { 2, 1, 31001 }, nStack = 1, nRate = 1.00,nStatus = ITEMSTATUS_LOCK}, -- T�i �� qu� 4
                    { tbProp = { 2, 1, 30071 }, nStack = 10, nRate = 3.250,nStatus = ITEMSTATUS_LOCK }, -- 10 Nh�n S�m v�n n�m
                    { tbProp = { 2, 1, 31096 }, nStack = 1, nRate = 5.500,nStatus = ITEMSTATUS_LOCK }, -- 1 L�u Kim
                    { tbProp = { 2, 201, 13 }, nStack = 1, nRate = 5.500 ,nStatus = ITEMSTATUS_LOCK}, -- 1 Thi�n V�n Th�ch
                    { tbProp = { 2, 1, 31233 }, nStack = 1, nRate = 3.375 }, -- Phi�u ��i ngo�i trang
                    { tbProp = { 2, 1, 31386 }, nStack = 1, nRate = 3.375 ,nStatus = ITEMSTATUS_LOCK}, -- M�nh Th� C��i
                    { tbProp = { 2, 1, 31320 }, nStack = 1, nRate = 1.00 ,nStatus = ITEMSTATUS_LOCK}, -- v� ��i trang s�c ngo�i trang
                    { tbProp = { 2, 1, 9999 }, nStack = 1, nRate =1.00 ,nStatus = ITEMSTATUS_LOCK}, -- Qu�n C�ng Ch��ng
                    { tbProp = { 2, 1, 9998 }, nStack = 1, nRate = 1.00 ,nStatus = ITEMSTATUS_LOCK}, -- Qu�n C�ng ��i
                    { tbProp = { 2, 1, 9977 }, nStack = 1, nRate = 1.00,nStatus = ITEMSTATUS_LOCK }, -- Qu�n Huy Ho�ng
                    { tbProp = { 0, 105, 199 }, nStack = 1, nRate = 0.50 }, -- Th� c��i linh ngh�
                    { tbProp = {0,105, 209 }, nStack = 1, nRate = 0.50 }, -- Phong s��ng ki�m
                    { tbProp = { 0, 105, 30058 }, nStack = 1, nRate = 0.50 }, -- H�ng Li�n hoa
                },
        },
    },
});
m_szNpcName = format("<color=green>%s<color>: ", m_tbItem.szName);

function OnUse(nItemIdx)
    m_tbItem:OnUse(nItemIdx);
end

----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item r��ng ho�t ��ng ph� b�n l��ng s�n b�c
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\items\\item_box_base.lua");
----------------------------------------------------------------------------------------------------
m_tbItem = inherit(WItemBoxBase, {
    szKey = "item_ruong_vang_luongsonbac",
    szName = "R��ng V�ng L��ng S�n B�c",

    --nOpenTypeTaskTempId = WTASKTEMP_RUONG_LSB_OPENTYPE,

    --bEnableLimitDaily = WEnv.FALSE,
    --nLimitDailyTaskId = WTASKID_RUONG_LSB_DAILY_COUNT,
    --nLimitDailyCount = 0,

    tbAwardTypes = {
        [1] = { szName = "M� mi�n ph�",
                tbItemConsumes = {
                    tbItems = {
                        { tbProp = { 2, 1, 40126 }, nCount = 1 }, -- R��ng L��ng S�n B�c
                    },
                },
                tbFixedAward = {
                    { nExp = 2000000 },
                    { nChanKhi = 50 },
                },
                tbRandomAward = {
                    { tbProp = { 2, 1, 9999 }, nStack = 1, nRate = 5.00 }, -- Qu�n C�ng Ch��ng
                    { tbProp = { 2, 1, 9998 }, nStack = 1, nRate = 5.00 }, -- Qu�n c�ng ��i
                    { tbProp = { 2, 1, 9977 }, nStack = 1, nRate = 5.00 }, -- Qu�n c�ng huy ho�ng
                    { tbProp = { 2, 1, 30425 }, nStack = 1, nRate = 12.00 }, -- B�a c��ng h�a 13
                    { tbProp = { 2, 1, 1009 }, nStack = 1, nRate = 20.00 }, -- Thi�n th�ch tinh th�ch
                    { tbProp = { 2, 1, 1113 }, nStack = 1, nRate = 1.00 }, -- ��i ��nh h�n
                    { tbProp = { 2, 95, 204 }, nStack = 1, nRate = 0.50 }, -- Thi�n cang l�nh
                    { tbProp = { 2, 1, 30499 }, nStack = 10, nRate = 50.00 }, -- Hu�n ch��ng anh h�ng
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

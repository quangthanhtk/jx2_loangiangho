----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item r­¬ng ho¹t ®éng phã b¶n l­¬ng s¬n b¹c
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\items\\item_box_base.lua");
----------------------------------------------------------------------------------------------------
m_tbItem = inherit(WItemBoxBase, {
    szKey = "item_ruong_vang_luongsonbac",
    szName = "R­¬ng Vµng L­¬ng S¬n B¹c",

    --nOpenTypeTaskTempId = WTASKTEMP_RUONG_LSB_OPENTYPE,

    --bEnableLimitDaily = WEnv.FALSE,
    --nLimitDailyTaskId = WTASKID_RUONG_LSB_DAILY_COUNT,
    --nLimitDailyCount = 0,

    tbAwardTypes = {
        [1] = { szName = "Më miÔn phÝ",
                tbItemConsumes = {
                    tbItems = {
                        { tbProp = { 2, 1, 40126 }, nCount = 1 }, -- R­¬ng L­¬ng S¬n B¹c
                    },
                },
                tbFixedAward = {
                    { nExp = 2000000 },
                    { nChanKhi = 50 },
                },
                tbRandomAward = {
                    { tbProp = { 2, 1, 9999 }, nStack = 1, nRate = 5.00 }, -- Qu©n C«ng Ch­¬ng
                    { tbProp = { 2, 1, 9998 }, nStack = 1, nRate = 5.00 }, -- Qu©n c«ng §¹i
                    { tbProp = { 2, 1, 9977 }, nStack = 1, nRate = 5.00 }, -- Qu©n c«ng huy hoµng
                    { tbProp = { 2, 1, 30425 }, nStack = 1, nRate = 12.00 }, -- Bïa c­êng hãa 13
                    { tbProp = { 2, 1, 1009 }, nStack = 1, nRate = 20.00 }, -- Thiªn th¹ch tinh th¹ch
                    { tbProp = { 2, 1, 1113 }, nStack = 1, nRate = 1.00 }, -- ®¹i ®Þnh hån
                    { tbProp = { 2, 95, 204 }, nStack = 1, nRate = 0.50 }, -- Thiªn cang lÖnh
                    { tbProp = { 2, 1, 30499 }, nStack = 10, nRate = 50.00 }, -- Hu©n ch­¬ng anh hïng
                    { tbProp = { 0, 105, 199 }, nStack = 1, nRate = 0.50 }, -- Thó c­ìi linh nghª
                    { tbProp = {0,105, 209 }, nStack = 1, nRate = 0.50 }, -- Phong s­¬ng kiÕm
                    { tbProp = { 0, 105, 30058 }, nStack = 1, nRate = 0.50 }, -- Hång Liªn hoa
                },
        },
    },
});
m_szNpcName = format("<color=green>%s<color>: ", m_tbItem.szName);

function OnUse(nItemIdx)
    m_tbItem:OnUse(nItemIdx);
end

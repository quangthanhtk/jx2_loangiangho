----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item r­¬ng ho¹t ®éng phã b¶n l­¬ng s¬n b¹c
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\items\\item_box_base.lua");
----------------------------------------------------------------------------------------------------
m_tbItem = inherit(WItemBoxBase, {
    szKey = "item_ruong_luongsonbac",
    szName = "R­¬ng Tµng KiÕm",

    nOpenTypeTaskTempId = WTASKTEMP_RUONG_LSB_OPENTYPE,

    bEnableLimitDaily = WEnv.FALSE,
    nLimitDailyTaskId = WTASKID_RUONG_TANGKIEM_DAILY_COUNT,
    nLimitDailyCount = 0,

    tbAwardTypes = {
        [1] = { szName = "Më b»ng 1 Thiªn Kiªu LÖnh",
                tbItemConsumes = {
                    tbItems = {
                        { tbProp = { 2, 1, 31767 }, nCount = 1 }, -- R­¬ng Thai hu
                        { tbProp = { 2, 97, 236 }, nCount = 1 }, -- Thiªn Kiªu LÖnh
                    },
                },
                tbFixedAward = {
                    { nExp = 1 },
                    --{ nChanKhi = 50 },
                    --{ nGold = 10000 },
                   -- { nPopur2 = 1 },

                },
                tbRandomAward = {
                    { tbProp = { 2, 1, 31615 }, nStack = 1, nRate = 2.00 }, -- Tay Tam Thach lv8
                    { tbProp = { 2, 1, 31402 }, nStack = 1, nRate = 3.00 }, -- Tay Tam Thach lv7
                    { tbProp = { 2, 1, 30526 }, nStack = 1, nRate = 4.00 }, -- Tay Tam Thach lv6
                    { tbProp = { 2, 1, 30525 }, nStack = 1, nRate = 5.00 }, -- Tay Tam Thach lv5
                    { tbProp = { 2, 1, 30524 }, nStack = 1, nRate = 10.00 }, -- Tay Tam Thach lv4
                    { tbProp = { 2, 102, 222 }, nStack = 1, nRate = 10.00 }, -- 1th­¬ng h¶i di ch©u c4
                    { tbProp = { 2, 102, 223 }, nStack = 1, nRate = 10.00 }, -- 1th­¬ng h¶i di ch©u c5
                    { tbProp = { 2, 102, 224 }, nStack = 1, nRate = 4.00 }, -- 1th­¬ng h¶i di ch©u c6
                    { tbProp = { 2, 102, 225 }, nStack = 1, nRate = 3.00 }, -- 1th­¬ng h¶i di ch©u c7
                    { tbProp = { 2, 1, 30424 }, nStack = 1, nRate = 15.00 }, -- 1 Bïa c­êng hãa 12
                    { tbProp = { 2, 1, 30425 }, nStack = 1, nRate = 15.00 }, -- 1 Bïa c­êng hãa 13
                    { tbProp = { 2, 1, 30426 }, nStack = 1, nRate = 5.00 }, -- 1 Bïa c­êng hãa 14
                    { tbProp = { 2, 1, 30427 }, nStack = 1, nRate = 2.00 }, -- 1 Bïa c­êng hãa 15
                    { tbProp = { 2, 1, 31505   }, nStack = 1, nRate = 10.00 }, -- Tui ®¸ qu 7
                    { tbProp = { 2, 1, 40030   }, nStack = 1, nRate = 1.00 }, -- Tui ®¸ qu 8
                    { tbProp = { 2, 201, 16 }, nStack = 1, nRate = 1.00 }, -- 1 §iÓm tinh ngäc - nhá

                },
        },
    },
});
m_szNpcName = format("<color=green>%s<color>: ", m_tbItem.szName);

function OnUse(nItemIdx)
    m_tbItem:OnUse(nItemIdx);
end

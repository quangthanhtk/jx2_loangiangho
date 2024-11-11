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
    szName = "R­¬ng L­¬ng S¬n B¹c",

    nOpenTypeTaskTempId = WTASKTEMP_RUONG_LSB_OPENTYPE,

    bEnableLimitDaily = WEnv.FALSE,
    nLimitDailyTaskId = WTASKID_RUONG_LSB_DAILY_COUNT,
    nLimitDailyCount = 0,

    tbAwardTypes = {
        [1] = { szName = "Më b»ng 1 Thiªn Kiªu LÖnh",
                tbItemConsumes = {
                    tbItems = {
                        { tbProp = { 2, 1, 40017 }, nCount = 1 }, -- R­¬ng L­¬ng S¬n B¹c
                        { tbProp = { 2, 97, 236 }, nCount = 1 }, -- Thiªn Kiªu LÖnh
                    },
                },
                tbFixedAward = {
                    { nExp = 1 },
                    --{ nChanKhi = 50 },
                    { nGold = 10000 },
                   -- { nPopur2 = 1 },

                },
                tbRandomAward = {
                    { tbProp = { 2, 1, 31402 }, nStack = 1, nRate = 2.00 }, -- Tay Tam Thach lv7
                   { tbProp = { 2, 1, 30526 }, nStack = 1, nRate = 3.00 }, -- Tay Tam Thach lv6
                    { tbProp = { 2, 1, 30525 }, nStack = 1, nRate = 6.00 }, -- Tay Tam Thach lv5
                    { tbProp = { 2, 1, 30524 }, nStack = 1, nRate = 10.00 }, -- Tay Tam Thach lv4
                    { tbProp = { 2, 1, 31001  }, nStack = 1, nRate = 13.00 }, -- Tui da quy 4
                    { tbProp = { 2, 1, 30390 }, nStack = 5, nRate = 10.00 }, -- M¶nh thiªn cang--
                    { tbProp = { 2, 1, 30499 }, nStack = 50, nRate = 1.00 }, -- Hu©n ch­¬ng anh hïng
                    { tbProp = { 2, 1, 30847 }, nStack = 1, nRate = 2.65 }, -- Håi tiªn ®¬n
                    { tbProp = { 2, 1, 9999 }, nStack = 1, nRate = 2.10 }, -- Qu©n c«ng ch­¬n
                    { tbProp = { 2, 1, 9998 }, nStack = 1, nRate = 2.00 }, -- Qu©n c«ng §¹i
                    { tbProp = { 2, 0, 554 }, nStack = 1, nRate = 5.00 }, -- yÕu quyÕt
                    { tbProp = { 2, 0, 553 }, nStack = 1, nRate = 2.00 }, -- §¹i Nh©n S©m
                    { tbProp = { 2, 0, 552 }, nStack = 1, nRate = 2.00 }, -- TiÓu nh©n s©m
                    { tbProp = { 2, 1, 30428 }, nStack = 1, nRate = 1.00 }, -- 1ma ®ao th¹ch c1
                    { tbProp = { 2, 1, 30429 }, nStack = 1, nRate = 1.00 }, -- 1ma ®ao th¹ch c2
                    { tbProp = { 2, 1, 30430 }, nStack = 1, nRate = 1.00 }, -- 1ma ®ao th¹ch c3
                    { tbProp = { 2, 102, 223 }, nStack = 1, nRate = 2.00 }, -- 1th­¬ng h¶i di ch©u c5
                    { tbProp = { 2, 102, 224 }, nStack = 1, nRate = 0.50 }, -- 1th­¬ng h¶i di ch©u c6
                    { tbProp = { 2, 102, 225 }, nStack = 1, nRate = 0.50 }, -- 1th­¬ng h¶i di ch©u c7
                    { tbProp = { 2,95,204 }, nStack = 1, nRate = 0.75 }, -- 1thiªn mn kim lÖnh
                    { tbProp = { 2, 1, 30731 }, nStack = 1, nRate = 0.50 }, -- 1 Kinh m¹ch ng©n nh©n
                    { tbProp = { 2, 1, 31123   }, nStack = 1, nRate = 1.00 }, -- Tui ®¸ qu 6
                    { tbProp = { 2, 1, 30544 }, nStack = 1, nRate = 0.50 }, -- Tói Kim Xµ 3
                    { tbProp = { 2, 1, 1009 }, nStack = 1, nRate = 0.50 }, -- 1 Thiªn th¹ch tinh th¹ch
                    { tbProp = { 2, 1, 30424 }, nStack = 1, nRate = 3.00 }, -- 1 Bïa c­êng hãa 12
                    { tbProp = { 2, 1, 30425 }, nStack = 1, nRate = 2.00 }, -- 1 Bïa c­êng hãa 13
                    { tbProp = { 2, 1, 30426 }, nStack = 1, nRate = 1.00 }, -- 1 Bïa c­êng hãa 14
                    { tbProp = { 2, 1, 30427 }, nStack = 1, nRate = 0.30 }, -- 1 Bïa c­êng hãa 15
                    --{ tbProp = { 2, 1, 31241 }, nStack = 1, nRate = 1.69 }, -- 1 HuyÕt bå ®Ò
                    { tbProp = { 2, 1, 3204 }, nStack = 1, nRate = 1.00 } , -- 1 NGò TH¸I LUNG TóY
                    { tbProp = { 2, 201, 13 }, nStack = 1, nRate = 10.00 }, -- 1 Thiªn v¨n th¹ch
                    { tbProp = { 2, 1, 31096 }, nStack = 1, nRate = 10.00 }, -- 1 L­u tinh
                    { tbProp = { 2, 1, 40037 }, nStack = 1, nRate = 1.00 }, -- 1 Tói kü n¨ng BDH cÊp 6
                    { tbProp = { 2, 1, 40047 }, nStack = 1, nRate = 1.69 }, -- 1 M¶nh bÝ ®iÓn 25
                    { tbProp = { 2, 201, 16 }, nStack = 1, nRate = 0.01,nStatus = ITEMSTATUS_TRADE }, -- 1 §iÓm tinh ngäc - nhá

                },
        },
    },
});
m_szNpcName = format("<color=green>%s<color>: ", m_tbItem.szName);

function OnUse(nItemIdx)
    m_tbItem:OnUse(nItemIdx);
end

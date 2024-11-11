----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item r­¬ng ho¹t ®éng phã b¶n ®Þa huyÒn cung
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\items\\item_box_base.lua");
----------------------------------------------------------------------------------------------------
m_tbItem = inherit(WItemBoxBase, {
    szKey = "item_ruong_diahuyencung",
    szName = "R­¬ng §Þa HuyÒn Cung",

    nOpenTypeTaskTempId = WTASKTEMP_RUONG_DHC_OPENTYPE,

    bEnableLimitDaily = WEnv.FALSE,
    nLimitDailyTaskId = WTASKID_RUONG_DHC_DAILY_COUNT,
    nLimitDailyCount = 0,

    tbAwardTypes = {
        [1] = { szName = "Më b»ng 1 Thiªn Kiªu LÖnh",
                tbItemConsumes = {
                    tbItems = {
                        { tbProp = { 2, 1, 40018 }, nCount = 1 }, -- R­¬ng §Þa HuyÒn Cung
                        { tbProp = { 2, 97, 236 }, nCount = 1 }, -- Thiªn Kiªu LÖnh
                    },
                },
                tbFixedAward = {
                    { nExp = 1 },
                    --{ nChanKhi = 50 },
                    { nGold = 10000 },
                    --{ nPopur2 = 1 },
                },
                tbRandomAward = {
                    { tbProp = { 2, 1, 31401 }, nStack = 1, nRate = 2.00 }, -- LuyÖn l« thiÕt c7
                    { tbProp = { 2, 1, 30532 }, nStack = 1, nRate = 3.00 }, -- LuyÖn l« thiÕt c6
                    { tbProp = { 2, 1, 30531 }, nStack = 1, nRate = 6.00 }, -- LuyÖn l« thiÕt c5
                    { tbProp = { 2, 1, 30530 }, nStack = 1, nRate = 10.00 }, -- LuyÖn l« thiÕt c4
                    { tbProp = { 2, 102, 221 }, nStack = 1, nRate = 13.00 }, -- 1th­¬ng h¶i di ch©u c4
                    { tbProp = { 2, 1, 30499 }, nStack = 50, nRate = 1.100 }, -- Hu©n ch­¬ng anh hïng
                    { tbProp = { 2, 1, 30410 }, nStack = 1, nRate = 10.00 }, -- M¶nh thiªn m«n
                    { tbProp = { 2, 1, 30847 }, nStack = 1, nRate = 3.00 }, -- Håi tiªn ®¬n
                    { tbProp = { 2, 1, 9999 }, nStack = 1, nRate = 2.00 }, -- Qu©n c«ng ch­¬ng
                    { tbProp = { 2, 1, 9998 }, nStack = 1, nRate = 2.00 }, -- Qu©n c«ng ®¹i
                    { tbProp = { 2, 0, 554 }, nStack = 1, nRate = 5.00 }, -- Tu ch©n yÕu quÕt
                    { tbProp = { 2, 0, 553 }, nStack = 1, nRate = 2.00 }, -- §¹i Nh©n S©m
                    { tbProp = { 2, 0, 552 }, nStack = 1, nRate = 2.00 }, -- TiÓu nh©n s©m
                    { tbProp = { 2, 1, 30428 }, nStack = 1, nRate = 1.00 }, -- 1ma ®ao th¹ch c1
                    { tbProp = { 2, 1, 30429 }, nStack = 1, nRate = 1.00 }, -- 1ma ®ao th¹ch c2
                    { tbProp = { 2, 1, 30430 }, nStack = 1, nRate = 1.00 }, -- 1ma ®ao th¹ch c3
                    { tbProp = { 2, 102, 224 }, nStack = 1, nRate = 1.00 }, -- 1th­¬ng h¶i di ch©u 6
                    { tbProp = { 2, 1, 31505 }, nStack = 1, nRate = 0.5 }, -- Tói §¸ Quý CÊp 7
                    { tbProp = { 2, 1, 30370 }, nStack = 1, nRate = 0.75 }, -- Thiªn m«n kim lÖnh
                    { tbProp = { 2, 1, 30731 }, nStack = 1, nRate = 0.50 }, -- Kinh m¹ch ng©n nh©n
                    { tbProp = { 2, 102, 225 }, nStack = 1, nRate = 0.50 }, -- 1th­¬ng h¶i di ch©u 7
                    { tbProp = { 2, 1, 30544 }, nStack = 1, nRate = 0.50 }, -- Tói Kim Xµ 3
                    { tbProp = { 2, 1, 1009 }, nStack = 1, nRate = 0.50 }, -- 1 Thiªn th¹ch tinh th¹ch
                    { tbProp = { 2, 1, 30424 }, nStack = 1, nRate = 3.00 }, -- 1 Bïa c­êng hãa 12
                    { tbProp = { 2, 1, 30425 }, nStack = 1, nRate = 2.00 }, -- 1 Bïa c­êng hãa 13
                    { tbProp = { 2, 1, 30426 }, nStack = 1, nRate = 1.00 }, -- 1 Bïa c­êng hãa 14
                    { tbProp = { 2, 1, 30427 }, nStack = 1, nRate = 0.30 }, -- 1 Bïa c­êng hãa 15
                    { tbProp = { 2, 1, 3204 }, nStack = 1, nRate = 1.00 } , -- 1 NGò TH¸I LUNG TóY
                    { tbProp = { 2, 1, 40047 }, nStack = 1, nRate = 1.00 }, -- 1 M¶nh bÝ ®iÓn 25
                    { tbProp = { 2, 1, 40037 }, nStack = 1, nRate = 1.00 }, -- 1 Tói kü n¨ng BDH cÊp 6
                    { tbProp = { 2, 201, 16 }, nStack = 1, nRate = 0.01,nStatus = ITEMSTATUS_TRADE }, -- 1 §iÓm tinh ngäc - nhá
                    { tbProp = { 2, 1, 31096 }, nStack = 1, nRate = 10.00 }, -- 1 L­u tinh
                    { tbProp = { 2, 201, 13 }, nStack = 1, nRate = 10.00 }, -- 1 Thiªn v¨n th¹ch
                },
        },
    },
});
m_szNpcName = format("<color=green>%s<color>: ", m_tbItem.szName);

function OnUse(nItemIdx)
    m_tbItem:OnUse(nItemIdx);
end

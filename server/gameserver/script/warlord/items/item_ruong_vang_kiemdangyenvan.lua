----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: item r­¬ng ho¹t ®éng phã b¶n kiÕm ®·ng yªn v©n
----------------------------------------------------------------------------------------------------
Import("\\script\\warlord\\preload.lua");
Include("\\script\\warlord\\items\\item_box_base.lua");
----------------------------------------------------------------------------------------------------
m_tbRandomArmoryBoxLv1 = {
    { [1] = { szName = "Kh¾c B¶n Vì CÊp 1 (§Çu)", tbProp = { 2, 1, 31068 }, nStack = 1, nStatus = 3 }, nRate = 20.00 },
    { [1] = { szName = "Kh¾c B¶n Vì CÊp 1 (¸o)", tbProp = { 2, 1, 31069 }, nStack = 1, nStatus = 3 }, nRate = 20.00 },
    { [1] = { szName = "Kh¾c B¶n Vì CÊp 1 (QuÇn)", tbProp = { 2, 1, 31070 }, nStack = 1, nStatus = 3 }, nRate = 20.00 },
    { [1] = { szName = "Kh¾c B¶n Vì CÊp 1 (NhÉn)", tbProp = { 2, 1, 31071 }, nStack = 1, nStatus = 3 }, nRate = 20.00 },
    { [1] = { szName = "Kh¾c B¶n Vì CÊp 1 (Ngäc Béi)", tbProp = { 2, 1, 31072 }, nStack = 1, nStatus = 3 }, nRate = 20.00 },
};
m_tbItem = inherit(WItemBoxBase, {
    szKey = "item_ruong_vang_kiemdangyenvan",
    szName = "R­¬ng KiÕm §·ng Yªn V©n",

    nOpenTypeTaskTempId = WTASKTEMP_RUONG_KDYV_OPENTYPE,

    bEnableLimitDaily = WEnv.FALSE,
    nLimitDailyTaskId = WTASKID_RUONG_KDYV_DAILY_COUNT,
    nLimitDailyCount = 0,

    tbAwardTypes = {
        [1] = { szName = "Më tèn 1 Thiªn Kiªu LÖnh",
                tbItemConsumes = {
                    tbItems = {
                        { tbProp = { 2, 1, 40128 }, nCount = 1 }, -- R­¬ng KiÕm §·ng Yªn V©n
                        { tbProp = { 2, 97, 236 }, nCount = 1 }, -- Thiªn Kiªu LÖnh
                    },
                },
                tbFixedAward = {
                    { nExp = 2000000 },
                    { nChanKhi = 50 },
                },
                tbRandomAward = {
                    { tbProp = { 2,1, 31073}, nStack = 1, nRate = 0.100}, -- 1 V¨n Søc Hoµn Mü CÊp 2 ( ®Çu)
                    { tbProp = { 2,1, 31074}, nStack = 1, nRate = 0.100},-- 1 1 V¨n Søc Hoµn Mü CÊp 2 (¸o)
                    { tbProp = { 2,1, 31075}, nStack = 1, nRate = 0.100}, --1 1 V¨n Søc Hoµn Mü CÊp 2 (quÇn)
                    { tbProp = { 2,1, 31076},nStack = 1, nRate = 0.100 }, -- 1 1 V¨n Søc Hoµn Mü CÊp 2 (nhÉn)
                    { tbProp = { 2,1, 31077},nStack = 1, nRate = 0.100 }, -- 1 1 V¨n Søc Hoµn Mü CÊp 2 (béi)
                    { tbProp = { 2,1, 30499}, nStack = 2, nRate = 5.00}, -- 1 Hu©n Ch­¬ng Anh Hïng
                    { tbProp = { 2,1, 30499}, nStack = 4, nRate = 5.00}, -- 1 Hu©n Ch­¬ng Anh Hïng
                    { tbProp = { 2,1, 30499}, nStack = 10, nRate = 5.00}, -- 1 Hu©n Ch­¬ng Anh Hïng
                    { tbProp = { 2,102, 219}, nStack = 1, nRate = 26.00}, -- 1 Th­¬ng H¶i Di Ch©u 1
                    { tbProp = { 2,102, 220}, nStack = 1, nRate = 15.00},-- 1 Th­¬ng H¶i Di Ch©u2
                    { tbProp = { 2,102, 221}, nStack = 1, nRate = 6.00}, --1 Th­¬ng H¶i Di Ch©u3
                    { tbProp = { 2,102, 222},nStack = 1, nRate = 2.30 }, -- 1 Th­¬ng H¶i Di Ch©u4
                    { tbProp = { 2,102, 223}, nStack = 1, nRate = 0.10}, -- 1 Th­¬ng H¶i Di Ch©u 5
                    { tbProp = { 2,1, 30847}, nStack = 1, nRate = 10.00}, -- 1 Håi Tiªn §¬n
                    { tbProp = { 2,1,30731}, nStack = 1, nRate =5.00}, -- 1  Kinh M¹ch Ng©n Nh©n
                    { tbProp = {  2, 1, 31096}, nStack = 1, nRate = 10.00}, -- 1 L­u Kim
                    { tbProp = { 2, 201, 13}, nStack = 1, nRate = 10.00}, -- 1 Thiªn V¨n Th¹ch
                    { tbProp = { 2, 201, 14}, nStack = 1, nRate = 10.00}, -- 1 Cæ Kim Th¹ch
                },
        },
    },
});
m_szNpcName = format("<color=green>%s<color>: ", m_tbItem.szName);

function OnUse(nItemIdx)
    m_tbItem:OnUse(nItemIdx);
end

WItemUpgrade:RegType({
    nGroupId = 8,
    szLogTitle = "upgrade_thuongungtuong_loihotuong_trangsuc3_100",
    szFeatureName = "N©ng cÊp T¦T Phï thµnh L«i Hæ T­íng Phï 100%", nDateOpen = 1, nDateClose = 1, -- ngµy më tÝnh n¨ng, 1= lu«n më; 0= lu«n ®ãng; ®Þnh d¹ng yyyymmdd tøc lµ ®Þnh ngµy s½n
    szPutinTitle = "§Æt vµo trang søc T¦T Phï",
    nPutinNum = 1,
    szConsumeInfo = " vµ <color=white>1 Th­¬ng ¦ng T­íng Qu©n Phï<color>",
    tbMaterialConsume = {
        nBattlePoint = 16000,
        tbItems = {
            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nCount = 3 },
            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nCount = 3 },
            { szName = "M¶nh Chu T­íc", tbProp = { 2, 1, 40016 }, nCount = 7 },
            { szName = "Hoµng Kim §¹i Hång Bao", tbProp = { 2, 1, 539 }, nCount = 15 },
        },
    },
    nMatchBodyMode = 4, -- ChÕ ®é tù ®éng tr¶ vÒ vËt phÈm phï hîp víi kiÓu h×nh ng­êi n©ng cÊp, 1= gi÷ nguyªn, 2= auto
    nEnhanceReq = 0, -- Yªu cÇu ®é c­êng hãa tõ mÊy? gi¸ trÞ =0 lµ ko kiÓm tra
    nEnhanceMode = 4, -- ChÕ ®é gi÷ c­êng hãa: gi¸ trÞ =1 lµ gi÷ nguyªn ®é c­êng hãa; =2 lµ trõ ®i 1 ®¬n vÞ; =3 lµ nÕu >= 7 th× vÒ l¹i 7, nÕu < 7 th× vÒ 0; 4= lµ vÒ 0
    nMaxRandom = 10000, -- Random tõ 1 -> m_nMaxRandom
    nLuckyNum = 10000, -- Trong kho¶ng tõ 1 -> m_nLuckyNum sÏ ra thµnh c«ng, gi¸ trÞ =0 lµ thÊt b¹i toµn tËp; =m_nMaxRandom lµ 100% thµnh c«ng
    nDoWaitTime = 3, -- TÝnh b»ng gi©y
    tbItemAllowUpgrade = {
        { [1] = { "Tèng Th­¬ng ¦ng T­íng Qu©n Phï", { 0, 102, 30060 } }, nSex = 1, nBody = 1, nRoute = 0, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Tèng Th­¬ng ¦ng T­íng Qu©n Phï", { 0, 102, 30061 } }, nSex = 1, nBody = 2, nRoute = 0, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Tèng Th­¬ng ¦ng T­íng Qu©n Phï", { 0, 102, 30062 } }, nSex = 2, nBody = 3, nRoute = 0, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Tèng Th­¬ng ¦ng T­íng Qu©n Phï", { 0, 102, 30063 } }, nSex = 2, nBody = 4, nRoute = 0, nCamp = WEnv.BATTLECAMP_TONG },

        { [1] = { "Liªu Th­¬ng ¦ng T­íng Qu©n Phï", { 0, 102, 30096 } }, nSex = 1, nBody = 1, nRoute = 0, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Liªu Th­¬ng ¦ng T­íng Qu©n Phï", { 0, 102, 30097 } }, nSex = 1, nBody = 2, nRoute = 0, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Liªu Th­¬ng ¦ng T­íng Qu©n Phï", { 0, 102, 30098 } }, nSex = 2, nBody = 3, nRoute = 0, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Liªu Th­¬ng ¦ng T­íng Qu©n Phï", { 0, 102, 30099 } }, nSex = 2, nBody = 4, nRoute = 0, nCamp = WEnv.BATTLECAMP_LIEU },
    },
    tbTargetItem = {
        { [1] = { "Tèng L«i Hæ T­íng Phï", { 0, 102, 30165 } }, nSex = 1, nBody = 1, nRoute = 0, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Tèng L«i Hæ T­íng Phï", { 0, 102, 30166 } }, nSex = 1, nBody = 2, nRoute = 0, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Tèng L«i Hæ T­íng Phï", { 0, 102, 30167 } }, nSex = 2, nBody = 3, nRoute = 0, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Tèng L«i Hæ T­íng Phï", { 0, 102, 30168 } }, nSex = 2, nBody = 4, nRoute = 0, nCamp = WEnv.BATTLECAMP_TONG },

        { [1] = { "Liªu L«i Hæ T­íng Phï", { 0, 102, 30201 } }, nSex = 1, nBody = 1, nRoute = 0, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Liªu L«i Hæ T­íng Phï", { 0, 102, 30202 } }, nSex = 1, nBody = 2, nRoute = 0, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Liªu L«i Hæ T­íng Phï", { 0, 102, 30203 } }, nSex = 2, nBody = 3, nRoute = 0, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Liªu L«i Hæ T­íng Phï", { 0, 102, 30204 } }, nSex = 2, nBody = 4, nRoute = 0, nCamp = WEnv.BATTLECAMP_LIEU },
    },
});

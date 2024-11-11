WItemUpgrade:RegType({
    nGroupId = 6,
    szLogTitle = "upgrade_st_ph_trangsuc_100",
    szFeatureName = "N©ng cÊp trang søc S¸t Tinh thµnh Ph¸ Hån 100%", nDateOpen = 1, nDateClose = 1, -- ngµy më tÝnh n¨ng, 1= lu«n më; 0= lu«n ®ãng; ®Þnh d¹ng yyyymmdd tøc lµ ®Þnh ngµy s½n
    szPutinTitle = "§Æt vµo trang søc ST",
    nPutinNum = 1,
    szConsumeInfo = " vµ <color=white>1 trang søc S¸t Tinh<color>",
    tbMaterialConsume = {
        tbItems = {
            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nCount = 20 },
            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nCount = 20 },
           -- { szName = "Hoµng Kim §¹i Hång Bao", tbProp = { 2, 1, 539 }, nCount = 15 },
        },
    },
    nMatchBodyMode = 4, -- ChÕ ®é tù ®éng tr¶ vÒ vËt phÈm phï hîp víi kiÓu h×nh ng­êi n©ng cÊp, 1= gi÷ nguyªn, 2= auto
    nEnhanceReq = 0, -- Yªu cÇu ®é c­êng hãa tõ mÊy? gi¸ trÞ =0 lµ ko kiÓm tra
    nEnhanceMode = 4, -- ChÕ ®é gi÷ c­êng hãa: gi¸ trÞ =1 lµ gi÷ nguyªn ®é c­êng hãa; =2 lµ trõ ®i 1 ®¬n vÞ; =3 lµ nÕu >= 7 th× vÒ l¹i 7, nÕu < 7 th× vÒ 0; 4= lµ vÒ 0
    nMaxRandom = 10000, -- Random tõ 1 -> m_nMaxRandom
    nLuckyNum = 10000, -- Trong kho¶ng tõ 1 -> m_nLuckyNum sÏ ra thµnh c«ng, gi¸ trÞ =0 lµ thÊt b¹i toµn tËp; =m_nMaxRandom lµ 100% thµnh c«ng
    nDoWaitTime = 3, -- TÝnh b»ng gi©y
    tbItemAllowUpgrade = {
        { [1] = { "S¸t Tinh-Cöu Linh Háa Giíi", { 0, 102, 31850 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "S¸t Tinh-Ng­ng Ngäc Thæ Hoµn", { 0, 102, 31851 } }, nSex = 0, nBody = 0, nRoute = 0 },
    },
    tbTargetItem = {
        -- Trang bÞ gèc
        --{[1]={"NhÉn Ph¸ Hån", {0,102,32160}}, nSex=0, nBody=0, nRoute=0},
        --{[1]={"D©y §eo NhiÕp T©m", {0,102,32161}}, nSex=0, nBody=0, nRoute=0},

        -- LÖnh bµi gèc
        --{[1]={"Ph¸ Hån LÖnh (Trang Søc)", {2,1,31533}}, nSex=0, nBody=0, nRoute=0},
        --{[1]={"Ph¸ Hån LÖnh (Trang Søc)", {2,1,31533}}, nSex=0, nBody=0, nRoute=0},

        -- LÖnh bµi mod b¶o l­u c­êng hãa
        { [1] = { "Ph¸ Hån LÖnh (Trang Søc)", { 2, 1, 40010 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "Ph¸ Hån LÖnh (Trang Søc)", { 2, 1, 40010 } }, nSex = 0, nBody = 0, nRoute = 0 },
    },
});

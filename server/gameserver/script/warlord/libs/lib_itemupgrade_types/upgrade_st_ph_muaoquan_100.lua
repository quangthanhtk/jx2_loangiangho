WItemUpgrade:RegType({
    nGroupId = 6,
    szLogTitle = "upgrade_st_ph_muaoquan_100",
    szFeatureName = "N©ng cÊp mò/¸o/quÇn S¸t Tinh thµnh Ph¸ Hån 100%", nDateOpen = 1, nDateClose = 1, -- ngµy më tÝnh n¨ng, 1= lu«n më; 0= lu«n ®ãng; ®Þnh d¹ng yyyymmdd tøc lµ ®Þnh ngµy s½n
    szPutinTitle = "§Æt vµo mò/¸o/quÇn ST",
    nPutinNum = 1,
    szConsumeInfo = " vµ <color=white>1 trang bÞ S¸t Tinh (mò/¸o/quÇn) c­êng hãa 15<color>",
    tbMaterialConsume = {
        tbItems = {
            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nCount = 15 },
            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nCount = 15 },
            --{ szName = "Hoµng Kim §¹i Hång Bao", tbProp = { 2, 1, 539 }, nCount = 20 },
        },
    },
    nMatchBodyMode = 4, -- ChÕ ®é tù ®éng tr¶ vÒ vËt phÈm phï hîp víi kiÓu h×nh ng­êi n©ng cÊp, 1= gi÷ nguyªn, 2= auto
    nEnhanceReq = 0, -- Yªu cÇu ®é c­êng hãa tõ mÊy? gi¸ trÞ =0 lµ ko kiÓm tra
    nEnhanceMode = 1, -- ChÕ ®é gi÷ c­êng hãa: gi¸ trÞ =1 lµ gi÷ nguyªn ®é c­êng hãa; =2 lµ trõ ®i 1 ®¬n vÞ; =3 lµ nÕu >= 7 th× vÒ l¹i 7, nÕu < 7 th× vÒ 0; 4= lµ vÒ 0
    nMaxRandom = 10000, -- Random tõ 1 -> m_nMaxRandom
    nLuckyNum = 10000, -- Trong kho¶ng tõ 1 -> m_nLuckyNum sÏ ra thµnh c«ng, gi¸ trÞ =0 lµ thÊt b¹i toµn tËp; =m_nMaxRandom lµ 100% thµnh c«ng
    nDoWaitTime = 3, -- TÝnh b»ng gi©y
    tbItemAllowUpgrade = {
        { [1] = { "MÆt N¹ S¸t Tinh", { 0, 103, 865 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "¸o S¸t Tinh", { 0, 100, 865 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "QuÇn S¸t Tinh", { 0, 101, 865 } }, nSex = 0, nBody = 0, nRoute = 0 },
    },
    tbTargetItem = {
        -- Trang bÞ gèc
        --{[1]={"MÆt N¹ Ph¸ Hån", {0,103,32347}}, nSex=0, nBody=0, nRoute=0},
        --{[1]={"¸o Ph¸ Hån", {0,100,32347}}, nSex=0, nBody=0, nRoute=0},
        --{[1]={"QuÇn Ph¸ Hån", {0,101,32347}}, nSex=0, nBody=0, nRoute=0},

        -- LÖnh bµi gèc
        --{[1]={"Ph¸ Hån LÖnh (§Çu)", {2,1,31529}}, nSex=0, nBody=0, nRoute=0},
        --{[1]={"Ph¸ Hån LÖnh (¸o)", {2,1,31530}}, nSex=0, nBody=0, nRoute=0},
        --{[1]={"Ph¸ Hån LÖnh (QuÇn)", {2,1,31531}}, nSex=0, nBody=0, nRoute=0},

        -- LÖnh bµi mod b¶o l­u c­êng hãa
        { [1] = { "Ph¸ Hån LÖnh (§Çu)", { 2, 1, 40006 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "Ph¸ Hån LÖnh (¸o)", { 2, 1, 40007 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "Ph¸ Hån LÖnh (QuÇn)", { 2, 1, 40008 } }, nSex = 0, nBody = 0, nRoute = 0 },
    },
});

WItemUpgrade:RegType({
    nGroupId = 5,
    szLogTitle = "upgrade_ah_st_muaoquan_100",
    szFeatureName = "N©ng c p mÚ/∏o/qu«n »m Huy’t thµnh S∏t Tinh 100%", nDateOpen = 1, nDateClose = 1, -- ngµy mÎ t›nh n®ng, 1= lu´n mÎ; 0= lu´n Æ„ng; Æﬁnh dπng yyyymmdd t¯c lµ Æﬁnh ngµy sΩn
    szPutinTitle = "ß∆t vµo mÚ/∏o/qu«n »H",
    nPutinNum = 1,
    szConsumeInfo = " vµ <color=white>1 trang bﬁ »m Huy’t (mÚ/∏o/qu«n) c≠Íng h„a 15<color>",
    tbMaterialConsume = {
        tbItems = {
            { szName = "Thi™n Cang L÷nh", tbProp = { 2, 95, 204 }, nCount = 10 },
            { szName = "Thi™n M´n Kim L÷nh", tbProp = { 2, 1, 30370 }, nCount = 10 },
           -- { szName = "Hoµng Kim ßπi HÂng Bao", tbProp = { 2, 1, 539 }, nCount = 15 },
        },
    },
    nMatchBodyMode = 4, -- Ch’ ÆÈ t˘ ÆÈng tr∂ v“ vÀt ph»m phÔ hÓp vÌi ki”u h◊nh ng≠Íi n©ng c p, 1= gi˜ nguy™n, 2= auto
    nEnhanceReq = 0, -- Y™u c«u ÆÈ c≠Íng h„a tı m y? gi∏ trﬁ =0 lµ ko ki”m tra
    nEnhanceMode = 1, -- Ch’ ÆÈ gi˜ c≠Íng h„a: gi∏ trﬁ =1 lµ gi˜ nguy™n ÆÈ c≠Íng h„a; =2 lµ trı Æi 1 Æ¨n vﬁ; =3 lµ n’u >= 7 th◊ v“ lπi 7, n’u < 7 th◊ v“ 0; 4= lµ v“ 0
    nMaxRandom = 10000, -- Random tı 1 -> m_nMaxRandom
    nLuckyNum = 10000, -- Trong kho∂ng tı 1 -> m_nLuckyNum sœ ra thµnh c´ng, gi∏ trﬁ =0 lµ th t bπi toµn tÀp; =m_nMaxRandom lµ 100% thµnh c´ng
    nDoWaitTime = 3, -- T›nh bªng gi©y
    tbItemAllowUpgrade = {
        { [1] = { "»m Huy’t ß«u", { 0, 103, 30610 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "»m Huy’t Y", { 0, 100, 30610 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "»m Huy’t Trang", { 0, 101, 30610 } }, nSex = 0, nBody = 0, nRoute = 0 },
    },
    tbTargetItem = {
        -- Trang bﬁ gËc
        --{[1]={"M∆t Nπ S∏t Tinh", {0,103,865}}, nSex=0, nBody=0, nRoute=0},
        --{[1]={"∏o S∏t Tinh", {0,100,865}}, nSex=0, nBody=0, nRoute=0},
        --{[1]={"Qu«n S∏t Tinh", {0,101,865}}, nSex=0, nBody=0, nRoute=0},

        -- L÷nh bµi gËc
        --{[1]={"S∏t Tinh L÷nh Bµi (ß«u)", {2,1,31313}}, nSex=0, nBody=0, nRoute=0},
        --{[1]={"S∏t Tinh L÷nh Bµi (∏o)", {2,1,31314}}, nSex=0, nBody=0, nRoute=0},
        --{[1]={"S∏t Tinh L÷nh Bµi (Qu«n)", {2,1,31315}}, nSex=0, nBody=0, nRoute=0},

        -- L÷nh bµi mod b∂o l≠u c≠Íng h„a
        { [1] = { "S∏t Tinh L÷nh Bµi (ß«u)", { 2, 1, 40001 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "S∏t Tinh L÷nh Bµi (∏o)", { 2, 1, 40002 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "S∏t Tinh L÷nh Bµi (Qu«n)", { 2, 1, 40003 } }, nSex = 0, nBody = 0, nRoute = 0 },
    },
});

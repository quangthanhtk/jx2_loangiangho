WItemUpgrade:RegType({
    nGroupId = 3,
    szLogTitle = "upgrade_hh_hhvh_vukhi_100",
    szFeatureName = "N©ng c p vÚ kh› Hµo Hi÷p thµnh Hµo Hi÷p V´ Hπ 100%", nDateOpen = 1, nDateClose = 1, -- ngµy mÎ t›nh n®ng, 1= lu´n mÎ; 0= lu´n Æ„ng; Æﬁnh dπng yyyymmdd t¯c lµ Æﬁnh ngµy sΩn
    szPutinTitle = "ß∆t vµo vÚ kh› HH",
    nPutinNum = 1,
    szConsumeInfo = " vµ <color=white>1 vÚ kh› Hµo Hi÷p c≠Íng h„a 12 trÎ l™n<color>",
    tbMaterialConsume = {
        tbItems = {
            { szName = "Thi™n Cang L÷nh", tbProp = { 2, 95, 204 }, nCount = 8 },
            { szName = "Thi™n M´n Kim L÷nh", tbProp = { 2, 1, 30370 }, nCount = 8 },
            { szName = "Hoµng Kim ßπi HÂng Bao", tbProp = { 2, 1, 539 }, nCount = 20 },
        },
    },
    nMatchBodyMode = 4, -- Ch’ ÆÈ t˘ ÆÈng tr∂ v“ vÀt ph»m phÔ hÓp vÌi ki”u h◊nh ng≠Íi n©ng c p, 1= gi˜ nguy™n, 2= auto
    nEnhanceReq = 12, -- Y™u c«u ÆÈ c≠Íng h„a tı m y? gi∏ trﬁ =0 lµ ko ki”m tra
    nEnhanceMode = 4, -- Ch’ ÆÈ gi˜ c≠Íng h„a: gi∏ trﬁ =1 lµ gi˜ nguy™n ÆÈ c≠Íng h„a; =2 lµ trı Æi 1 Æ¨n vﬁ; =3 lµ n’u >= 7 th◊ v“ lπi 7, n’u < 7 th◊ v“ 0; 4= lµ v“ 0nMaxRandom = 10000, -- Random tı 1 -> m_nMaxRandom
    nMaxRandom = 10000, -- Random tı 1 -> m_nMaxRandom
    nLuckyNum = 10000, -- Trong kho∂ng tı 1 -> m_nLuckyNum sœ ra thµnh c´ng, gi∏ trﬁ =0 lµ th t bπi toµn tÀp; =m_nMaxRandom lµ 100% thµnh c´ng
    nDoWaitTime = 3, -- T›nh bªng gi©y
    tbItemAllowUpgrade = {
        { [1] = { "Hµo Hi÷p ßao", { 0, 3, 30724 } }, nSex = 0, nBody = 0, nRoute = 2 },
        { [1] = { "Hµo Hi÷p Tr≠Óng", { 0, 8, 30725 } }, nSex = 0, nBody = 0, nRoute = 3 },
        { [1] = { "Hµo Hi÷p ThÒ", { 0, 0, 30726 } }, nSex = 0, nBody = 0, nRoute = 4 },
        { [1] = { "Hµo Hi÷p Ch©m", { 0, 1, 30727 } }, nSex = 0, nBody = 0, nRoute = 6 },
        { [1] = { "Hµo Hi÷p Ki’m", { 0, 2, 30728 } }, nSex = 0, nBody = 0, nRoute = 8 },
        { [1] = { "Hµo Hi÷p C«m", { 0, 10, 30729 } }, nSex = 0, nBody = 0, nRoute = 9 },
        { [1] = { "Hµo Hi÷p ThÒ", { 0, 0, 30730 } }, nSex = 0, nBody = 0, nRoute = 11 },
        { [1] = { "Hµo Hi÷p C´n", { 0, 5, 30731 } }, nSex = 0, nBody = 0, nRoute = 12 },
        { [1] = { "Hµo Hi÷p Ki’m", { 0, 2, 30732 } }, nSex = 0, nBody = 0, nRoute = 14 },
        { [1] = { "Hµo Hi÷p BÛt", { 0, 9, 30733 } }, nSex = 0, nBody = 0, nRoute = 15 },
        { [1] = { "Hµo Hi÷p Th≠¨ng", { 0, 6, 30734 } }, nSex = 0, nBody = 0, nRoute = 17 },
        { [1] = { "Hµo Hi÷p Cung", { 0, 4, 30735 } }, nSex = 0, nBody = 0, nRoute = 18 },
        { [1] = { "Hµo Hi÷p Song ßao", { 0, 7, 30736 } }, nSex = 0, nBody = 0, nRoute = 20 },
        { [1] = { "Hµo Hi÷p Tr∂o", { 0, 11, 30737 } }, nSex = 0, nBody = 0, nRoute = 21 },
        { [1] = { "Hµo Hi÷p Ki’m", { 0, 2, 30738 } }, nSex = 0, nBody = 0, nRoute = 23 },
        { [1] = { "Hµo Hi÷p ßao", { 0, 3, 30739 } }, nSex = 0, nBody = 0, nRoute = 25 },
        { [1] = { "Hµo Hi÷p BÛt", { 0, 9, 30740 } }, nSex = 0, nBody = 0, nRoute = 26 },
        { [1] = { "Hµo Hi÷p Tr∂o", { 0, 11, 30741 } }, nSex = 0, nBody = 0, nRoute = 27 },
        { [1] = { "Hµo Hi÷p Phi’n", { 0, 13, 30742 } }, nSex = 0, nBody = 0, nRoute = 29 },
        { [1] = { "Hµo Hi÷p ßﬁch", { 0, 12, 30743 } }, nSex = 0, nBody = 0, nRoute = 30 },
        { [1] = { "Hµo Hi÷p ChÒy", { 0, 12, 32162 } }, nSex = 0, nBody = 0, nRoute = 31 },
        { [1] = { "Hµo Hi÷p Ki’m", { 0, 12, 32190 } }, nSex = 0, nBody = 0, nRoute = 32 },
    },
    tbTargetItem = {
        -- L÷nh bµi gËc
        --{[1]={"V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", {2,1,30973}}, nSex=0, nBody=0, nRoute=0},

        -- L÷nh bµi mÌi mod b∂o l≠u c≠Íng h„a
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V´ Hπ Hµo Hi÷p L÷nh (VÚ Kh›)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
    },
});

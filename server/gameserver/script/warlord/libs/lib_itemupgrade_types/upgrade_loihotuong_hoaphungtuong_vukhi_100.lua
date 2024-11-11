WItemUpgrade:RegType({
    nGroupId = 9,
    szLogTitle = "upgrade_loihotuong_hoaphungtuong_vukhi_100",
    szFeatureName = "Hîp thµnh vò khİ Háa Phông T­íng 100%", nDateOpen = 1, nDateClose = 1, -- ngµy më tİnh n¨ng, 1= lu«n më; 0= lu«n ®ãng; ®Şnh d¹ng yyyymmdd tøc lµ ®Şnh ngµy s½n
    szPutinTitle = "§Æt vµo",
    nPutinNum = 1,
    szConsumeInfo = "",
    tbMaterialConsume = {
        nBattlePoint = 20000,
        tbItems = {
            { szName = "Thiªn Cang LÖnh", tbProp = { 2, 95, 204 }, nCount = 15 },
            { szName = "Thiªn M«n Kim LÖnh", tbProp = { 2, 1, 30370 }, nCount = 5 },
            { szName = "M¶nh Chu T­íc", tbProp = { 2, 1, 40016 }, nCount = 13 },
            { szName = "Hoµng Kim §¹i Hång Bao", tbProp = { 2, 1, 539 }, nCount = 20 },
        },
    },
    nMatchBodyMode = 3, -- ChÕ ®é tù ®éng tr¶ vÒ vËt phÈm phï hîp víi kiÓu h×nh ng­êi n©ng cÊp, 1= gi÷ nguyªn, 2= auto
    nEnhanceReq = 0, -- Yªu cÇu ®é c­êng hãa tõ mÊy? gi¸ trŞ =0 lµ ko kiÓm tra
    nEnhanceMode = 4, -- ChÕ ®é gi÷ c­êng hãa: gi¸ trŞ =1 lµ gi÷ nguyªn ®é c­êng hãa; =2 lµ trõ ®i 1 ®¬n vŞ; =3 lµ nÕu >= 7 th× vÒ l¹i 7, nÕu < 7 th× vÒ 0; 4= lµ vÒ 0
    nMaxRandom = 10000, -- Random tõ 1 -> m_nMaxRandom
    nLuckyNum = 10000, -- Trong kho¶ng tõ 1 -> m_nLuckyNum sÏ ra thµnh c«ng, gi¸ trŞ =0 lµ thÊt b¹i toµn tËp; =m_nMaxRandom lµ 100% thµnh c«ng
    nDoWaitTime = 3, -- Tİnh b»ng gi©y
    tbItemAllowUpgrade = { -- Môc ®İch thiÕt kÕ tb nµy theo h­íng 1:1, n:1, ®èi víi n:n th× sö dông hµm fnGetNewItem
        -- ChÌn thªm cét F vµo b¶ng, paste lÖnh vµo vµ söa m· hµng cho ®óng
        -- ="{[1]={""&A1170&"", {"&B1170&","&C1170&","&D1170&"}}, [2]={""&A1314&"", {"&B1314&","&C1314&","&D1314&"}}, nSex="&R1314&", nBody="&S1314&", nRoute="&AD1314&"},"
        -- Trang bŞ gèc
        { [1] = { "M¶nh Chu T­íc", { 2, 1, 40016 } }, [2] = { "M¶nh Chu T­íc", { 2, 1, 40016 } }, nSex = 1, nBody = 1, nRoute = 15, nCamp = WEnv.BATTLECAMP_TONG },
    },
    GetNewItem = function(self, nTypeIdx, tbPutItemInfo, nSex, nBody, nRoute, nCamp)
        -- Hµm dïng cho n:n, nÕu define hµm nµy sÏ ­u tiªn ch¹y khi t×m item cÇn n©ng lªn
        local nCodeG = tbPutItemInfo.nGenre;
        local nCodeD = tbPutItemInfo.nDetail;
        local nCodeP = tbPutItemInfo.nParticular;
        local tbTypeConfigs = WItemUpgrade:GetTypeConfigs(nTypeIdx);

        if nTypeIdx == 0 or tbTypeConfigs == WEnv.NULL or tbPutItemInfo == WEnv.NULL then
            return WEnv.NULL;
        end

        local tbNewItem_Mu = {};

        local tbNewItem_Ao = {};

        local tbNewItem_Quan = {};

        local tbNewItem_Ngoc = {};

        local tbNewItem_VuKhi = {
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 3, 30432 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 3, 30432 } }, nSex = 1, nBody = 1, nRoute = 2, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 3, 30433 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 3, 30433 } }, nSex = 1, nBody = 2, nRoute = 2, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Tr­îng (Cao CÊp)", { 0, 8, 30434 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Tr­îng (Cao CÊp)", { 0, 8, 30434 } }, nSex = 1, nBody = 1, nRoute = 3, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Tr­îng (Cao CÊp)", { 0, 8, 30435 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Tr­îng (Cao CÊp)", { 0, 8, 30435 } }, nSex = 1, nBody = 2, nRoute = 3, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Thñ (Cao CÊp)", { 0, 0, 30436 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Thñ (Cao CÊp)", { 0, 0, 30436 } }, nSex = 1, nBody = 1, nRoute = 4, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Thñ (Cao CÊp)", { 0, 0, 30437 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Thñ (Cao CÊp)", { 0, 0, 30437 } }, nSex = 1, nBody = 2, nRoute = 4, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Ch©m (Cao CÊp)", { 0, 1, 30438 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Ch©m (Cao CÊp)", { 0, 1, 30438 } }, nSex = 1, nBody = 1, nRoute = 6, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Ch©m (Cao CÊp)", { 0, 1, 30439 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Ch©m (Cao CÊp)", { 0, 1, 30439 } }, nSex = 1, nBody = 2, nRoute = 6, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Ch©m (Cao CÊp)", { 0, 1, 30440 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Ch©m (Cao CÊp)", { 0, 1, 30440 } }, nSex = 2, nBody = 3, nRoute = 6, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Ch©m (Cao CÊp)", { 0, 1, 30441 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Ch©m (Cao CÊp)", { 0, 1, 30441 } }, nSex = 2, nBody = 4, nRoute = 6, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i KiÕm (Cao CÊp)", { 0, 2, 30442 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i KiÕm (Cao CÊp)", { 0, 2, 30442 } }, nSex = 2, nBody = 3, nRoute = 8, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i KiÕm (Cao CÊp)", { 0, 2, 30443 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i KiÕm (Cao CÊp)", { 0, 2, 30443 } }, nSex = 2, nBody = 4, nRoute = 8, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i CÇm (Cao CÊp)", { 0, 10, 30444 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i CÇm (Cao CÊp)", { 0, 10, 30444 } }, nSex = 2, nBody = 3, nRoute = 9, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i CÇm (Cao CÊp)", { 0, 10, 30445 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i CÇm (Cao CÊp)", { 0, 10, 30445 } }, nSex = 2, nBody = 4, nRoute = 9, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Thñ (Cao CÊp)", { 0, 0, 30446 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Thñ (Cao CÊp)", { 0, 0, 30446 } }, nSex = 1, nBody = 1, nRoute = 11, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Thñ (Cao CÊp)", { 0, 0, 30447 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Thñ (Cao CÊp)", { 0, 0, 30447 } }, nSex = 1, nBody = 2, nRoute = 11, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Thñ (Cao CÊp)", { 0, 0, 30448 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Thñ (Cao CÊp)", { 0, 0, 30448 } }, nSex = 2, nBody = 3, nRoute = 11, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Thñ (Cao CÊp)", { 0, 0, 30449 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Thñ (Cao CÊp)", { 0, 0, 30449 } }, nSex = 2, nBody = 4, nRoute = 11, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i C«n (Cao CÊp)", { 0, 5, 30450 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i C«n (Cao CÊp)", { 0, 5, 30450 } }, nSex = 1, nBody = 1, nRoute = 12, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i C«n (Cao CÊp)", { 0, 5, 30451 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i C«n (Cao CÊp)", { 0, 5, 30451 } }, nSex = 1, nBody = 2, nRoute = 12, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i C«n (Cao CÊp)", { 0, 5, 30452 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i C«n (Cao CÊp)", { 0, 5, 30452 } }, nSex = 2, nBody = 3, nRoute = 12, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i C«n (Cao CÊp)", { 0, 5, 30453 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i C«n (Cao CÊp)", { 0, 5, 30453 } }, nSex = 2, nBody = 4, nRoute = 12, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i KiÕm (Cao CÊp)", { 0, 2, 30454 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i KiÕm (Cao CÊp)", { 0, 2, 30454 } }, nSex = 1, nBody = 1, nRoute = 14, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i KiÕm (Cao CÊp)", { 0, 2, 30455 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i KiÕm (Cao CÊp)", { 0, 2, 30455 } }, nSex = 1, nBody = 2, nRoute = 14, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i KiÕm (Cao CÊp)", { 0, 2, 30456 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i KiÕm (Cao CÊp)", { 0, 2, 30456 } }, nSex = 2, nBody = 3, nRoute = 14, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i KiÕm (Cao CÊp)", { 0, 2, 30457 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i KiÕm (Cao CÊp)", { 0, 2, 30457 } }, nSex = 2, nBody = 4, nRoute = 14, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Bót (Cao CÊp)", { 0, 9, 30458 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Bót (Cao CÊp)", { 0, 9, 30458 } }, nSex = 1, nBody = 1, nRoute = 15, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Bót (Cao CÊp)", { 0, 9, 30459 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Bót (Cao CÊp)", { 0, 9, 30459 } }, nSex = 1, nBody = 2, nRoute = 15, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Bót (Cao CÊp)", { 0, 9, 30460 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Bót (Cao CÊp)", { 0, 9, 30460 } }, nSex = 2, nBody = 3, nRoute = 15, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Bót (Cao CÊp)", { 0, 9, 30461 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Bót (Cao CÊp)", { 0, 9, 30461 } }, nSex = 2, nBody = 4, nRoute = 15, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Th­¬ng (Cao CÊp)", { 0, 6, 30462 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Th­¬ng (Cao CÊp)", { 0, 6, 30462 } }, nSex = 1, nBody = 1, nRoute = 17, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Th­¬ng (Cao CÊp)", { 0, 6, 30463 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Th­¬ng (Cao CÊp)", { 0, 6, 30463 } }, nSex = 1, nBody = 2, nRoute = 17, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Th­¬ng (Cao CÊp)", { 0, 6, 30464 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Th­¬ng (Cao CÊp)", { 0, 6, 30464 } }, nSex = 2, nBody = 3, nRoute = 17, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Th­¬ng (Cao CÊp)", { 0, 6, 30465 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Th­¬ng (Cao CÊp)", { 0, 6, 30465 } }, nSex = 2, nBody = 4, nRoute = 17, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Cung (Cao CÊp)", { 0, 4, 30466 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Cung (Cao CÊp)", { 0, 4, 30466 } }, nSex = 1, nBody = 1, nRoute = 18, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Cung (Cao CÊp)", { 0, 4, 30467 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Cung (Cao CÊp)", { 0, 4, 30467 } }, nSex = 1, nBody = 2, nRoute = 18, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Cung (Cao CÊp)", { 0, 4, 30468 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Cung (Cao CÊp)", { 0, 4, 30468 } }, nSex = 2, nBody = 3, nRoute = 18, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Cung (Cao CÊp)", { 0, 4, 30469 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Cung (Cao CÊp)", { 0, 4, 30469 } }, nSex = 2, nBody = 4, nRoute = 18, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 7, 30470 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 7, 30470 } }, nSex = 1, nBody = 1, nRoute = 20, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 7, 30471 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 7, 30471 } }, nSex = 1, nBody = 2, nRoute = 20, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 7, 30472 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 7, 30472 } }, nSex = 2, nBody = 3, nRoute = 20, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 7, 30473 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 7, 30473 } }, nSex = 2, nBody = 4, nRoute = 20, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Tr¶o (Cao CÊp)", { 0, 11, 30474 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Tr¶o (Cao CÊp)", { 0, 11, 30474 } }, nSex = 1, nBody = 1, nRoute = 21, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Tr¶o (Cao CÊp)", { 0, 11, 30475 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Tr¶o (Cao CÊp)", { 0, 11, 30475 } }, nSex = 1, nBody = 2, nRoute = 21, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Tr¶o (Cao CÊp)", { 0, 11, 30476 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Tr¶o (Cao CÊp)", { 0, 11, 30476 } }, nSex = 2, nBody = 3, nRoute = 21, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Tr¶o (Cao CÊp)", { 0, 11, 30477 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Tr¶o (Cao CÊp)", { 0, 11, 30477 } }, nSex = 2, nBody = 4, nRoute = 21, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i KiÕm (Cao CÊp)", { 0, 2, 30478 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i KiÕm (Cao CÊp)", { 0, 2, 30478 } }, nSex = 1, nBody = 1, nRoute = 23, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i KiÕm (Cao CÊp)", { 0, 2, 30479 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i KiÕm (Cao CÊp)", { 0, 2, 30479 } }, nSex = 1, nBody = 2, nRoute = 23, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 3, 30480 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 3, 30480 } }, nSex = 1, nBody = 1, nRoute = 25, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 3, 30481 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 3, 30481 } }, nSex = 1, nBody = 2, nRoute = 25, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 3, 30482 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 3, 30482 } }, nSex = 2, nBody = 3, nRoute = 25, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 3, 30483 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i §ao (Cao CÊp)", { 0, 3, 30483 } }, nSex = 2, nBody = 4, nRoute = 25, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Bót (Cao CÊp)", { 0, 9, 30484 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Bót (Cao CÊp)", { 0, 9, 30484 } }, nSex = 1, nBody = 1, nRoute = 26, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Bót (Cao CÊp)", { 0, 9, 30485 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Bót (Cao CÊp)", { 0, 9, 30485 } }, nSex = 1, nBody = 2, nRoute = 26, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Bót (Cao CÊp)", { 0, 9, 30486 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Bót (Cao CÊp)", { 0, 9, 30486 } }, nSex = 2, nBody = 3, nRoute = 26, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Bót (Cao CÊp)", { 0, 9, 30487 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Bót (Cao CÊp)", { 0, 9, 30487 } }, nSex = 2, nBody = 4, nRoute = 26, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Tr¶o (Cao CÊp)", { 0, 11, 30488 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Tr¶o (Cao CÊp)", { 0, 11, 30488 } }, nSex = 1, nBody = 1, nRoute = 27, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Tr¶o (Cao CÊp)", { 0, 11, 30489 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Tr¶o (Cao CÊp)", { 0, 11, 30489 } }, nSex = 1, nBody = 2, nRoute = 27, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Tr¶o (Cao CÊp)", { 0, 11, 30490 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Tr¶o (Cao CÊp)", { 0, 11, 30490 } }, nSex = 2, nBody = 3, nRoute = 27, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i Tr¶o (Cao CÊp)", { 0, 11, 30491 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i Tr¶o (Cao CÊp)", { 0, 11, 30491 } }, nSex = 2, nBody = 4, nRoute = 27, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i PhiÕn (Cao CÊp)", { 0, 13, 30492 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i PhiÕn (Cao CÊp)", { 0, 13, 30492 } }, nSex = 2, nBody = 3, nRoute = 29, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i PhiÕn (Cao CÊp)", { 0, 13, 30493 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i PhiÕn (Cao CÊp)", { 0, 13, 30493 } }, nSex = 2, nBody = 4, nRoute = 29, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i §Şch (Cao CÊp)", { 0, 12, 30494 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i §Şch (Cao CÊp)", { 0, 12, 30494 } }, nSex = 2, nBody = 3, nRoute = 30, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông Nguyªn So¸i §Şch (Cao CÊp)", { 0, 12, 30495 } }, [2] = { "Tèng_Háa Phông Nguyªn So¸i §Şch (Cao CÊp)", { 0, 12, 30495 } }, nSex = 2, nBody = 4, nRoute = 30, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng-Háa Phông T­íng Qu©n Chñy (Cao)", { 0, 14, 32167 } }, [2] = { "Tèng-Háa Phông T­íng Qu©n Chñy (Cao)", { 0, 14, 32167 } }, nSex = 0, nBody = 0, nRoute = 31, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "Tèng_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 32195 } }, [2] = { "Tèng_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 32195 } }, nSex = 0, nBody = 0, nRoute = 32, nCamp = WEnv.BATTLECAMP_TONG },

            { [1] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 3, 30536 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 3, 30536 } }, nSex = 1, nBody = 1, nRoute = 2, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 3, 30537 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 3, 30537 } }, nSex = 1, nBody = 2, nRoute = 2, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Tr­îng (Cao CÊp)", { 0, 8, 30538 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Tr­îng (Cao CÊp)", { 0, 8, 30538 } }, nSex = 1, nBody = 1, nRoute = 3, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Tr­îng (Cao CÊp)", { 0, 8, 30539 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Tr­îng (Cao CÊp)", { 0, 8, 30539 } }, nSex = 1, nBody = 2, nRoute = 3, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Thñ (Cao CÊp)", { 0, 0, 30540 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Thñ (Cao CÊp)", { 0, 0, 30540 } }, nSex = 1, nBody = 1, nRoute = 4, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Thñ (Cao CÊp)", { 0, 0, 30541 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Thñ (Cao CÊp)", { 0, 0, 30541 } }, nSex = 1, nBody = 2, nRoute = 4, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Ch©m (Cao CÊp)", { 0, 1, 30542 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Ch©m (Cao CÊp)", { 0, 1, 30542 } }, nSex = 1, nBody = 1, nRoute = 6, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Ch©m (Cao CÊp)", { 0, 1, 30543 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Ch©m (Cao CÊp)", { 0, 1, 30543 } }, nSex = 1, nBody = 2, nRoute = 6, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Ch©m (Cao CÊp)", { 0, 1, 30544 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Ch©m (Cao CÊp)", { 0, 1, 30544 } }, nSex = 2, nBody = 3, nRoute = 6, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Ch©m (Cao CÊp)", { 0, 1, 30545 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Ch©m (Cao CÊp)", { 0, 1, 30545 } }, nSex = 2, nBody = 4, nRoute = 6, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 30546 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 30546 } }, nSex = 2, nBody = 3, nRoute = 8, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 30547 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 30547 } }, nSex = 2, nBody = 4, nRoute = 8, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n CÇm (Cao CÊp)", { 0, 10, 30548 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n CÇm (Cao CÊp)", { 0, 10, 30548 } }, nSex = 2, nBody = 3, nRoute = 9, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n CÇm (Cao CÊp)", { 0, 10, 30549 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n CÇm (Cao CÊp)", { 0, 10, 30549 } }, nSex = 2, nBody = 4, nRoute = 9, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Thñ (Cao CÊp)", { 0, 0, 30550 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Thñ (Cao CÊp)", { 0, 0, 30550 } }, nSex = 1, nBody = 1, nRoute = 11, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Thñ (Cao CÊp)", { 0, 0, 30551 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Thñ (Cao CÊp)", { 0, 0, 30551 } }, nSex = 1, nBody = 2, nRoute = 11, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Thñ (Cao CÊp)", { 0, 0, 30552 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Thñ (Cao CÊp)", { 0, 0, 30552 } }, nSex = 2, nBody = 3, nRoute = 11, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Thñ (Cao CÊp)", { 0, 0, 30553 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Thñ (Cao CÊp)", { 0, 0, 30553 } }, nSex = 2, nBody = 4, nRoute = 11, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n C«n (Cao CÊp)", { 0, 5, 30554 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n C«n (Cao CÊp)", { 0, 5, 30554 } }, nSex = 1, nBody = 1, nRoute = 12, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n C«n (Cao CÊp)", { 0, 5, 30555 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n C«n (Cao CÊp)", { 0, 5, 30555 } }, nSex = 1, nBody = 2, nRoute = 12, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n C«n (Cao CÊp)", { 0, 5, 30556 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n C«n (Cao CÊp)", { 0, 5, 30556 } }, nSex = 2, nBody = 3, nRoute = 12, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n C«n (Cao CÊp)", { 0, 5, 30557 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n C«n (Cao CÊp)", { 0, 5, 30557 } }, nSex = 2, nBody = 4, nRoute = 12, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 30558 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 30558 } }, nSex = 1, nBody = 1, nRoute = 14, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 30559 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 30559 } }, nSex = 1, nBody = 2, nRoute = 14, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 30560 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 30560 } }, nSex = 2, nBody = 3, nRoute = 14, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 30561 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 30561 } }, nSex = 2, nBody = 4, nRoute = 14, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Bót (Cao CÊp)", { 0, 9, 30562 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Bót (Cao CÊp)", { 0, 9, 30562 } }, nSex = 1, nBody = 1, nRoute = 15, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Bót (Cao CÊp)", { 0, 9, 30563 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Bót (Cao CÊp)", { 0, 9, 30563 } }, nSex = 1, nBody = 2, nRoute = 15, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Bót (Cao CÊp)", { 0, 9, 30564 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Bót (Cao CÊp)", { 0, 9, 30564 } }, nSex = 2, nBody = 3, nRoute = 15, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Bót (Cao CÊp)", { 0, 9, 30565 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Bót (Cao CÊp)", { 0, 9, 30565 } }, nSex = 2, nBody = 4, nRoute = 15, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Th­¬ng (Cao CÊp)", { 0, 6, 30566 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Th­¬ng (Cao CÊp)", { 0, 6, 30566 } }, nSex = 1, nBody = 1, nRoute = 17, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Th­¬ng (Cao CÊp)", { 0, 6, 30567 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Th­¬ng (Cao CÊp)", { 0, 6, 30567 } }, nSex = 1, nBody = 2, nRoute = 17, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Th­¬ng (Cao CÊp)", { 0, 6, 30568 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Th­¬ng (Cao CÊp)", { 0, 6, 30568 } }, nSex = 2, nBody = 3, nRoute = 17, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Th­¬ng (Cao CÊp)", { 0, 6, 30569 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Th­¬ng (Cao CÊp)", { 0, 6, 30569 } }, nSex = 2, nBody = 4, nRoute = 17, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Cung (Cao CÊp)", { 0, 4, 30570 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Cung (Cao CÊp)", { 0, 4, 30570 } }, nSex = 1, nBody = 1, nRoute = 18, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Cung (Cao CÊp)", { 0, 4, 30571 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Cung (Cao CÊp)", { 0, 4, 30571 } }, nSex = 1, nBody = 2, nRoute = 18, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Cung (Cao CÊp)", { 0, 4, 30572 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Cung (Cao CÊp)", { 0, 4, 30572 } }, nSex = 2, nBody = 3, nRoute = 18, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Cung (Cao CÊp)", { 0, 4, 30573 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Cung (Cao CÊp)", { 0, 4, 30573 } }, nSex = 2, nBody = 4, nRoute = 18, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 7, 30574 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 7, 30574 } }, nSex = 1, nBody = 1, nRoute = 20, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 7, 30575 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 7, 30575 } }, nSex = 1, nBody = 2, nRoute = 20, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 7, 30576 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 7, 30576 } }, nSex = 2, nBody = 3, nRoute = 20, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 7, 30577 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 7, 30577 } }, nSex = 2, nBody = 4, nRoute = 20, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Tr¶o (Cao CÊp)", { 0, 11, 30578 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Tr¶o (Cao CÊp)", { 0, 11, 30578 } }, nSex = 1, nBody = 1, nRoute = 21, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Tr¶o (Cao CÊp)", { 0, 11, 30579 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Tr¶o (Cao CÊp)", { 0, 11, 30579 } }, nSex = 1, nBody = 2, nRoute = 21, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Tr¶o (Cao CÊp)", { 0, 11, 30580 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Tr¶o (Cao CÊp)", { 0, 11, 30580 } }, nSex = 2, nBody = 3, nRoute = 21, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Tr¶o (Cao CÊp)", { 0, 11, 30581 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Tr¶o (Cao CÊp)", { 0, 11, 30581 } }, nSex = 2, nBody = 4, nRoute = 21, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 30582 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 30582 } }, nSex = 1, nBody = 1, nRoute = 23, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 30583 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 30583 } }, nSex = 1, nBody = 2, nRoute = 23, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 3, 30584 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 3, 30584 } }, nSex = 1, nBody = 1, nRoute = 25, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 3, 30585 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 3, 30585 } }, nSex = 1, nBody = 2, nRoute = 25, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 3, 30586 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 3, 30586 } }, nSex = 2, nBody = 3, nRoute = 25, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 3, 30587 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n §ao (Cao CÊp)", { 0, 3, 30587 } }, nSex = 2, nBody = 4, nRoute = 25, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Bót (Cao CÊp)", { 0, 9, 30588 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Bót (Cao CÊp)", { 0, 9, 30588 } }, nSex = 1, nBody = 1, nRoute = 26, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Bót (Cao CÊp)", { 0, 9, 30589 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Bót (Cao CÊp)", { 0, 9, 30589 } }, nSex = 1, nBody = 2, nRoute = 26, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Bót (Cao CÊp)", { 0, 9, 30590 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Bót (Cao CÊp)", { 0, 9, 30590 } }, nSex = 2, nBody = 3, nRoute = 26, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Bót (Cao CÊp)", { 0, 9, 30591 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Bót (Cao CÊp)", { 0, 9, 30591 } }, nSex = 2, nBody = 4, nRoute = 26, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Tr¶o (Cao CÊp)", { 0, 11, 30592 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Tr¶o (Cao CÊp)", { 0, 11, 30592 } }, nSex = 1, nBody = 1, nRoute = 27, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Tr¶o (Cao CÊp)", { 0, 11, 30593 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Tr¶o (Cao CÊp)", { 0, 11, 30593 } }, nSex = 1, nBody = 2, nRoute = 27, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Tr¶o (Cao CÊp)", { 0, 11, 30594 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Tr¶o (Cao CÊp)", { 0, 11, 30594 } }, nSex = 2, nBody = 3, nRoute = 27, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n Tr¶o (Cao CÊp)", { 0, 11, 30595 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n Tr¶o (Cao CÊp)", { 0, 11, 30595 } }, nSex = 2, nBody = 4, nRoute = 27, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n PhiÕn (Cao CÊp)", { 0, 13, 30596 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n PhiÕn (Cao CÊp)", { 0, 13, 30596 } }, nSex = 2, nBody = 3, nRoute = 29, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n PhiÕn (Cao CÊp)", { 0, 13, 30597 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n PhiÕn (Cao CÊp)", { 0, 13, 30597 } }, nSex = 2, nBody = 4, nRoute = 29, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n §Şch (Cao CÊp)", { 0, 12, 30598 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n §Şch (Cao CÊp)", { 0, 12, 30598 } }, nSex = 2, nBody = 3, nRoute = 30, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n §Şch (Cao CÊp)", { 0, 12, 30599 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n §Şch (Cao CÊp)", { 0, 12, 30599 } }, nSex = 2, nBody = 4, nRoute = 30, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu-Háa Phông T­íng Qu©n Chñy (Cao)", { 0, 14, 32179 } }, [2] = { "Liªu-Háa Phông T­íng Qu©n Chñy (Cao)", { 0, 14, 32179 } }, nSex = 0, nBody = 0, nRoute = 31, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 32207 } }, [2] = { "Liªu_Háa Phông T­íng Qu©n KiÕm (Cao CÊp)", { 0, 2, 32207 } }, nSex = 0, nBody = 0, nRoute = 32, nCamp = WEnv.BATTLECAMP_LIEU },
        };

        local tbNewItem_Khac = {};

        -- Ph©n lo¹i ra ®Ó gi¶m t¶i vßng lÆp nÆng svr
        local tbNewItem = {};
        if nCodeG == 0 and nCodeD == 103 then
            tbNewItem = tbNewItem_Mu;
        elseif nCodeG == 0 and nCodeD == 100 then
            tbNewItem = tbNewItem_Ao;
        elseif nCodeG == 0 and nCodeD == 101 then
            tbNewItem = tbNewItem_Quan;
        elseif nCodeG == 0 and nCodeD == 102 then
            tbNewItem = tbNewItem_Ngoc;
        elseif nCodeG == 0 and (nCodeD >= 0 and nCodeD <= 14) then
            tbNewItem = tbNewItem_VuKhi;
        else
            tbNewItem = tbNewItem_Khac;
        end

        tbNewItem = tbNewItem_VuKhi;
        for _, tbRow in pairs(tbNewItem) do
            if _ ~= "n"
                    and nCodeG == tbRow[2][2][1] and nCodeD == tbRow[2][2][2]
                    and (nSex == tbRow.nSex or tbRow.nSex == 0)
                    and (nBody == tbRow.nBody or tbRow.nBody == 0)
                    and (nRoute == tbRow.nRoute or tbRow.nRoute == 0)
                    and (nCamp == tbRow.nCamp or tbRow.nCamp == 0)
            then
                return tbRow[2];
            end
        end

        return WEnv.NULL;
    end,
});

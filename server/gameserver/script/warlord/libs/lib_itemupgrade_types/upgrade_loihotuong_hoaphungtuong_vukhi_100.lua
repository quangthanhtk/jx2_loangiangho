WItemUpgrade:RegType({
    nGroupId = 9,
    szLogTitle = "upgrade_loihotuong_hoaphungtuong_vukhi_100",
    szFeatureName = "H�p th�nh v� kh� H�a Ph�ng T��ng 100%", nDateOpen = 1, nDateClose = 1, -- ng�y m� t�nh n�ng, 1= lu�n m�; 0= lu�n ��ng; ��nh d�ng yyyymmdd t�c l� ��nh ng�y s�n
    szPutinTitle = "��t v�o",
    nPutinNum = 1,
    szConsumeInfo = "",
    tbMaterialConsume = {
        nBattlePoint = 20000,
        tbItems = {
            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nCount = 15 },
            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nCount = 5 },
            { szName = "M�nh Chu T��c", tbProp = { 2, 1, 40016 }, nCount = 13 },
            { szName = "Ho�ng Kim ��i H�ng Bao", tbProp = { 2, 1, 539 }, nCount = 20 },
        },
    },
    nMatchBodyMode = 3, -- Ch� �� t� ��ng tr� v� v�t ph�m ph� h�p v�i ki�u h�nh ng��i n�ng c�p, 1= gi� nguy�n, 2= auto
    nEnhanceReq = 0, -- Y�u c�u �� c��ng h�a t� m�y? gi� tr� =0 l� ko ki�m tra
    nEnhanceMode = 4, -- Ch� �� gi� c��ng h�a: gi� tr� =1 l� gi� nguy�n �� c��ng h�a; =2 l� tr� �i 1 ��n v�; =3 l� n�u >= 7 th� v� l�i 7, n�u < 7 th� v� 0; 4= l� v� 0
    nMaxRandom = 10000, -- Random t� 1 -> m_nMaxRandom
    nLuckyNum = 10000, -- Trong kho�ng t� 1 -> m_nLuckyNum s� ra th�nh c�ng, gi� tr� =0 l� th�t b�i to�n t�p; =m_nMaxRandom l� 100% th�nh c�ng
    nDoWaitTime = 3, -- T�nh b�ng gi�y
    tbItemAllowUpgrade = { -- M�c ��ch thi�t k� tb n�y theo h��ng 1:1, n:1, ��i v�i n:n th� s� d�ng h�m fnGetNewItem
        -- Ch�n th�m c�t F v�o b�ng, paste l�nh v�o v� s�a m� h�ng cho ��ng
        -- ="{[1]={""&A1170&"", {"&B1170&","&C1170&","&D1170&"}}, [2]={""&A1314&"", {"&B1314&","&C1314&","&D1314&"}}, nSex="&R1314&", nBody="&S1314&", nRoute="&AD1314&"},"
        -- Trang b� g�c
        { [1] = { "M�nh Chu T��c", { 2, 1, 40016 } }, [2] = { "M�nh Chu T��c", { 2, 1, 40016 } }, nSex = 1, nBody = 1, nRoute = 15, nCamp = WEnv.BATTLECAMP_TONG },
    },
    GetNewItem = function(self, nTypeIdx, tbPutItemInfo, nSex, nBody, nRoute, nCamp)
        -- H�m d�ng cho n:n, n�u define h�m n�y s� �u ti�n ch�y khi t�m item c�n n�ng l�n
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
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 3, 30432 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 3, 30432 } }, nSex = 1, nBody = 1, nRoute = 2, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 3, 30433 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 3, 30433 } }, nSex = 1, nBody = 2, nRoute = 2, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr��ng (Cao C�p)", { 0, 8, 30434 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr��ng (Cao C�p)", { 0, 8, 30434 } }, nSex = 1, nBody = 1, nRoute = 3, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr��ng (Cao C�p)", { 0, 8, 30435 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr��ng (Cao C�p)", { 0, 8, 30435 } }, nSex = 1, nBody = 2, nRoute = 3, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Th� (Cao C�p)", { 0, 0, 30436 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Th� (Cao C�p)", { 0, 0, 30436 } }, nSex = 1, nBody = 1, nRoute = 4, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Th� (Cao C�p)", { 0, 0, 30437 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Th� (Cao C�p)", { 0, 0, 30437 } }, nSex = 1, nBody = 2, nRoute = 4, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Ch�m (Cao C�p)", { 0, 1, 30438 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Ch�m (Cao C�p)", { 0, 1, 30438 } }, nSex = 1, nBody = 1, nRoute = 6, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Ch�m (Cao C�p)", { 0, 1, 30439 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Ch�m (Cao C�p)", { 0, 1, 30439 } }, nSex = 1, nBody = 2, nRoute = 6, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Ch�m (Cao C�p)", { 0, 1, 30440 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Ch�m (Cao C�p)", { 0, 1, 30440 } }, nSex = 2, nBody = 3, nRoute = 6, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Ch�m (Cao C�p)", { 0, 1, 30441 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Ch�m (Cao C�p)", { 0, 1, 30441 } }, nSex = 2, nBody = 4, nRoute = 6, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Ki�m (Cao C�p)", { 0, 2, 30442 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Ki�m (Cao C�p)", { 0, 2, 30442 } }, nSex = 2, nBody = 3, nRoute = 8, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Ki�m (Cao C�p)", { 0, 2, 30443 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Ki�m (Cao C�p)", { 0, 2, 30443 } }, nSex = 2, nBody = 4, nRoute = 8, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i C�m (Cao C�p)", { 0, 10, 30444 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i C�m (Cao C�p)", { 0, 10, 30444 } }, nSex = 2, nBody = 3, nRoute = 9, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i C�m (Cao C�p)", { 0, 10, 30445 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i C�m (Cao C�p)", { 0, 10, 30445 } }, nSex = 2, nBody = 4, nRoute = 9, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Th� (Cao C�p)", { 0, 0, 30446 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Th� (Cao C�p)", { 0, 0, 30446 } }, nSex = 1, nBody = 1, nRoute = 11, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Th� (Cao C�p)", { 0, 0, 30447 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Th� (Cao C�p)", { 0, 0, 30447 } }, nSex = 1, nBody = 2, nRoute = 11, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Th� (Cao C�p)", { 0, 0, 30448 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Th� (Cao C�p)", { 0, 0, 30448 } }, nSex = 2, nBody = 3, nRoute = 11, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Th� (Cao C�p)", { 0, 0, 30449 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Th� (Cao C�p)", { 0, 0, 30449 } }, nSex = 2, nBody = 4, nRoute = 11, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i C�n (Cao C�p)", { 0, 5, 30450 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i C�n (Cao C�p)", { 0, 5, 30450 } }, nSex = 1, nBody = 1, nRoute = 12, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i C�n (Cao C�p)", { 0, 5, 30451 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i C�n (Cao C�p)", { 0, 5, 30451 } }, nSex = 1, nBody = 2, nRoute = 12, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i C�n (Cao C�p)", { 0, 5, 30452 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i C�n (Cao C�p)", { 0, 5, 30452 } }, nSex = 2, nBody = 3, nRoute = 12, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i C�n (Cao C�p)", { 0, 5, 30453 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i C�n (Cao C�p)", { 0, 5, 30453 } }, nSex = 2, nBody = 4, nRoute = 12, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Ki�m (Cao C�p)", { 0, 2, 30454 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Ki�m (Cao C�p)", { 0, 2, 30454 } }, nSex = 1, nBody = 1, nRoute = 14, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Ki�m (Cao C�p)", { 0, 2, 30455 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Ki�m (Cao C�p)", { 0, 2, 30455 } }, nSex = 1, nBody = 2, nRoute = 14, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Ki�m (Cao C�p)", { 0, 2, 30456 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Ki�m (Cao C�p)", { 0, 2, 30456 } }, nSex = 2, nBody = 3, nRoute = 14, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Ki�m (Cao C�p)", { 0, 2, 30457 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Ki�m (Cao C�p)", { 0, 2, 30457 } }, nSex = 2, nBody = 4, nRoute = 14, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i B�t (Cao C�p)", { 0, 9, 30458 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i B�t (Cao C�p)", { 0, 9, 30458 } }, nSex = 1, nBody = 1, nRoute = 15, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i B�t (Cao C�p)", { 0, 9, 30459 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i B�t (Cao C�p)", { 0, 9, 30459 } }, nSex = 1, nBody = 2, nRoute = 15, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i B�t (Cao C�p)", { 0, 9, 30460 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i B�t (Cao C�p)", { 0, 9, 30460 } }, nSex = 2, nBody = 3, nRoute = 15, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i B�t (Cao C�p)", { 0, 9, 30461 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i B�t (Cao C�p)", { 0, 9, 30461 } }, nSex = 2, nBody = 4, nRoute = 15, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Th��ng (Cao C�p)", { 0, 6, 30462 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Th��ng (Cao C�p)", { 0, 6, 30462 } }, nSex = 1, nBody = 1, nRoute = 17, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Th��ng (Cao C�p)", { 0, 6, 30463 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Th��ng (Cao C�p)", { 0, 6, 30463 } }, nSex = 1, nBody = 2, nRoute = 17, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Th��ng (Cao C�p)", { 0, 6, 30464 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Th��ng (Cao C�p)", { 0, 6, 30464 } }, nSex = 2, nBody = 3, nRoute = 17, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Th��ng (Cao C�p)", { 0, 6, 30465 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Th��ng (Cao C�p)", { 0, 6, 30465 } }, nSex = 2, nBody = 4, nRoute = 17, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Cung (Cao C�p)", { 0, 4, 30466 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Cung (Cao C�p)", { 0, 4, 30466 } }, nSex = 1, nBody = 1, nRoute = 18, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Cung (Cao C�p)", { 0, 4, 30467 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Cung (Cao C�p)", { 0, 4, 30467 } }, nSex = 1, nBody = 2, nRoute = 18, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Cung (Cao C�p)", { 0, 4, 30468 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Cung (Cao C�p)", { 0, 4, 30468 } }, nSex = 2, nBody = 3, nRoute = 18, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Cung (Cao C�p)", { 0, 4, 30469 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Cung (Cao C�p)", { 0, 4, 30469 } }, nSex = 2, nBody = 4, nRoute = 18, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 7, 30470 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 7, 30470 } }, nSex = 1, nBody = 1, nRoute = 20, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 7, 30471 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 7, 30471 } }, nSex = 1, nBody = 2, nRoute = 20, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 7, 30472 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 7, 30472 } }, nSex = 2, nBody = 3, nRoute = 20, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 7, 30473 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 7, 30473 } }, nSex = 2, nBody = 4, nRoute = 20, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr�o (Cao C�p)", { 0, 11, 30474 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr�o (Cao C�p)", { 0, 11, 30474 } }, nSex = 1, nBody = 1, nRoute = 21, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr�o (Cao C�p)", { 0, 11, 30475 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr�o (Cao C�p)", { 0, 11, 30475 } }, nSex = 1, nBody = 2, nRoute = 21, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr�o (Cao C�p)", { 0, 11, 30476 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr�o (Cao C�p)", { 0, 11, 30476 } }, nSex = 2, nBody = 3, nRoute = 21, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr�o (Cao C�p)", { 0, 11, 30477 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr�o (Cao C�p)", { 0, 11, 30477 } }, nSex = 2, nBody = 4, nRoute = 21, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Ki�m (Cao C�p)", { 0, 2, 30478 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Ki�m (Cao C�p)", { 0, 2, 30478 } }, nSex = 1, nBody = 1, nRoute = 23, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Ki�m (Cao C�p)", { 0, 2, 30479 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Ki�m (Cao C�p)", { 0, 2, 30479 } }, nSex = 1, nBody = 2, nRoute = 23, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 3, 30480 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 3, 30480 } }, nSex = 1, nBody = 1, nRoute = 25, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 3, 30481 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 3, 30481 } }, nSex = 1, nBody = 2, nRoute = 25, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 3, 30482 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 3, 30482 } }, nSex = 2, nBody = 3, nRoute = 25, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 3, 30483 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i �ao (Cao C�p)", { 0, 3, 30483 } }, nSex = 2, nBody = 4, nRoute = 25, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i B�t (Cao C�p)", { 0, 9, 30484 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i B�t (Cao C�p)", { 0, 9, 30484 } }, nSex = 1, nBody = 1, nRoute = 26, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i B�t (Cao C�p)", { 0, 9, 30485 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i B�t (Cao C�p)", { 0, 9, 30485 } }, nSex = 1, nBody = 2, nRoute = 26, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i B�t (Cao C�p)", { 0, 9, 30486 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i B�t (Cao C�p)", { 0, 9, 30486 } }, nSex = 2, nBody = 3, nRoute = 26, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i B�t (Cao C�p)", { 0, 9, 30487 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i B�t (Cao C�p)", { 0, 9, 30487 } }, nSex = 2, nBody = 4, nRoute = 26, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr�o (Cao C�p)", { 0, 11, 30488 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr�o (Cao C�p)", { 0, 11, 30488 } }, nSex = 1, nBody = 1, nRoute = 27, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr�o (Cao C�p)", { 0, 11, 30489 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr�o (Cao C�p)", { 0, 11, 30489 } }, nSex = 1, nBody = 2, nRoute = 27, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr�o (Cao C�p)", { 0, 11, 30490 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr�o (Cao C�p)", { 0, 11, 30490 } }, nSex = 2, nBody = 3, nRoute = 27, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr�o (Cao C�p)", { 0, 11, 30491 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Tr�o (Cao C�p)", { 0, 11, 30491 } }, nSex = 2, nBody = 4, nRoute = 27, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Phi�n (Cao C�p)", { 0, 13, 30492 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Phi�n (Cao C�p)", { 0, 13, 30492 } }, nSex = 2, nBody = 3, nRoute = 29, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i Phi�n (Cao C�p)", { 0, 13, 30493 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i Phi�n (Cao C�p)", { 0, 13, 30493 } }, nSex = 2, nBody = 4, nRoute = 29, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i ��ch (Cao C�p)", { 0, 12, 30494 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i ��ch (Cao C�p)", { 0, 12, 30494 } }, nSex = 2, nBody = 3, nRoute = 30, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng Nguy�n So�i ��ch (Cao C�p)", { 0, 12, 30495 } }, [2] = { "T�ng_H�a Ph�ng Nguy�n So�i ��ch (Cao C�p)", { 0, 12, 30495 } }, nSex = 2, nBody = 4, nRoute = 30, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng-H�a Ph�ng T��ng Qu�n Ch�y (Cao)", { 0, 14, 32167 } }, [2] = { "T�ng-H�a Ph�ng T��ng Qu�n Ch�y (Cao)", { 0, 14, 32167 } }, nSex = 0, nBody = 0, nRoute = 31, nCamp = WEnv.BATTLECAMP_TONG },
            { [1] = { "T�ng_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 32195 } }, [2] = { "T�ng_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 32195 } }, nSex = 0, nBody = 0, nRoute = 32, nCamp = WEnv.BATTLECAMP_TONG },

            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 3, 30536 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 3, 30536 } }, nSex = 1, nBody = 1, nRoute = 2, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 3, 30537 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 3, 30537 } }, nSex = 1, nBody = 2, nRoute = 2, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr��ng (Cao C�p)", { 0, 8, 30538 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr��ng (Cao C�p)", { 0, 8, 30538 } }, nSex = 1, nBody = 1, nRoute = 3, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr��ng (Cao C�p)", { 0, 8, 30539 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr��ng (Cao C�p)", { 0, 8, 30539 } }, nSex = 1, nBody = 2, nRoute = 3, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Th� (Cao C�p)", { 0, 0, 30540 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Th� (Cao C�p)", { 0, 0, 30540 } }, nSex = 1, nBody = 1, nRoute = 4, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Th� (Cao C�p)", { 0, 0, 30541 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Th� (Cao C�p)", { 0, 0, 30541 } }, nSex = 1, nBody = 2, nRoute = 4, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Ch�m (Cao C�p)", { 0, 1, 30542 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Ch�m (Cao C�p)", { 0, 1, 30542 } }, nSex = 1, nBody = 1, nRoute = 6, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Ch�m (Cao C�p)", { 0, 1, 30543 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Ch�m (Cao C�p)", { 0, 1, 30543 } }, nSex = 1, nBody = 2, nRoute = 6, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Ch�m (Cao C�p)", { 0, 1, 30544 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Ch�m (Cao C�p)", { 0, 1, 30544 } }, nSex = 2, nBody = 3, nRoute = 6, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Ch�m (Cao C�p)", { 0, 1, 30545 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Ch�m (Cao C�p)", { 0, 1, 30545 } }, nSex = 2, nBody = 4, nRoute = 6, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 30546 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 30546 } }, nSex = 2, nBody = 3, nRoute = 8, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 30547 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 30547 } }, nSex = 2, nBody = 4, nRoute = 8, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n C�m (Cao C�p)", { 0, 10, 30548 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n C�m (Cao C�p)", { 0, 10, 30548 } }, nSex = 2, nBody = 3, nRoute = 9, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n C�m (Cao C�p)", { 0, 10, 30549 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n C�m (Cao C�p)", { 0, 10, 30549 } }, nSex = 2, nBody = 4, nRoute = 9, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Th� (Cao C�p)", { 0, 0, 30550 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Th� (Cao C�p)", { 0, 0, 30550 } }, nSex = 1, nBody = 1, nRoute = 11, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Th� (Cao C�p)", { 0, 0, 30551 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Th� (Cao C�p)", { 0, 0, 30551 } }, nSex = 1, nBody = 2, nRoute = 11, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Th� (Cao C�p)", { 0, 0, 30552 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Th� (Cao C�p)", { 0, 0, 30552 } }, nSex = 2, nBody = 3, nRoute = 11, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Th� (Cao C�p)", { 0, 0, 30553 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Th� (Cao C�p)", { 0, 0, 30553 } }, nSex = 2, nBody = 4, nRoute = 11, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n C�n (Cao C�p)", { 0, 5, 30554 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n C�n (Cao C�p)", { 0, 5, 30554 } }, nSex = 1, nBody = 1, nRoute = 12, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n C�n (Cao C�p)", { 0, 5, 30555 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n C�n (Cao C�p)", { 0, 5, 30555 } }, nSex = 1, nBody = 2, nRoute = 12, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n C�n (Cao C�p)", { 0, 5, 30556 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n C�n (Cao C�p)", { 0, 5, 30556 } }, nSex = 2, nBody = 3, nRoute = 12, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n C�n (Cao C�p)", { 0, 5, 30557 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n C�n (Cao C�p)", { 0, 5, 30557 } }, nSex = 2, nBody = 4, nRoute = 12, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 30558 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 30558 } }, nSex = 1, nBody = 1, nRoute = 14, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 30559 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 30559 } }, nSex = 1, nBody = 2, nRoute = 14, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 30560 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 30560 } }, nSex = 2, nBody = 3, nRoute = 14, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 30561 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 30561 } }, nSex = 2, nBody = 4, nRoute = 14, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n B�t (Cao C�p)", { 0, 9, 30562 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n B�t (Cao C�p)", { 0, 9, 30562 } }, nSex = 1, nBody = 1, nRoute = 15, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n B�t (Cao C�p)", { 0, 9, 30563 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n B�t (Cao C�p)", { 0, 9, 30563 } }, nSex = 1, nBody = 2, nRoute = 15, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n B�t (Cao C�p)", { 0, 9, 30564 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n B�t (Cao C�p)", { 0, 9, 30564 } }, nSex = 2, nBody = 3, nRoute = 15, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n B�t (Cao C�p)", { 0, 9, 30565 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n B�t (Cao C�p)", { 0, 9, 30565 } }, nSex = 2, nBody = 4, nRoute = 15, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Th��ng (Cao C�p)", { 0, 6, 30566 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Th��ng (Cao C�p)", { 0, 6, 30566 } }, nSex = 1, nBody = 1, nRoute = 17, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Th��ng (Cao C�p)", { 0, 6, 30567 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Th��ng (Cao C�p)", { 0, 6, 30567 } }, nSex = 1, nBody = 2, nRoute = 17, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Th��ng (Cao C�p)", { 0, 6, 30568 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Th��ng (Cao C�p)", { 0, 6, 30568 } }, nSex = 2, nBody = 3, nRoute = 17, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Th��ng (Cao C�p)", { 0, 6, 30569 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Th��ng (Cao C�p)", { 0, 6, 30569 } }, nSex = 2, nBody = 4, nRoute = 17, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Cung (Cao C�p)", { 0, 4, 30570 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Cung (Cao C�p)", { 0, 4, 30570 } }, nSex = 1, nBody = 1, nRoute = 18, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Cung (Cao C�p)", { 0, 4, 30571 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Cung (Cao C�p)", { 0, 4, 30571 } }, nSex = 1, nBody = 2, nRoute = 18, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Cung (Cao C�p)", { 0, 4, 30572 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Cung (Cao C�p)", { 0, 4, 30572 } }, nSex = 2, nBody = 3, nRoute = 18, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Cung (Cao C�p)", { 0, 4, 30573 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Cung (Cao C�p)", { 0, 4, 30573 } }, nSex = 2, nBody = 4, nRoute = 18, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 7, 30574 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 7, 30574 } }, nSex = 1, nBody = 1, nRoute = 20, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 7, 30575 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 7, 30575 } }, nSex = 1, nBody = 2, nRoute = 20, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 7, 30576 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 7, 30576 } }, nSex = 2, nBody = 3, nRoute = 20, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 7, 30577 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 7, 30577 } }, nSex = 2, nBody = 4, nRoute = 20, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr�o (Cao C�p)", { 0, 11, 30578 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr�o (Cao C�p)", { 0, 11, 30578 } }, nSex = 1, nBody = 1, nRoute = 21, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr�o (Cao C�p)", { 0, 11, 30579 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr�o (Cao C�p)", { 0, 11, 30579 } }, nSex = 1, nBody = 2, nRoute = 21, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr�o (Cao C�p)", { 0, 11, 30580 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr�o (Cao C�p)", { 0, 11, 30580 } }, nSex = 2, nBody = 3, nRoute = 21, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr�o (Cao C�p)", { 0, 11, 30581 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr�o (Cao C�p)", { 0, 11, 30581 } }, nSex = 2, nBody = 4, nRoute = 21, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 30582 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 30582 } }, nSex = 1, nBody = 1, nRoute = 23, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 30583 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 30583 } }, nSex = 1, nBody = 2, nRoute = 23, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 3, 30584 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 3, 30584 } }, nSex = 1, nBody = 1, nRoute = 25, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 3, 30585 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 3, 30585 } }, nSex = 1, nBody = 2, nRoute = 25, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 3, 30586 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 3, 30586 } }, nSex = 2, nBody = 3, nRoute = 25, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 3, 30587 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n �ao (Cao C�p)", { 0, 3, 30587 } }, nSex = 2, nBody = 4, nRoute = 25, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n B�t (Cao C�p)", { 0, 9, 30588 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n B�t (Cao C�p)", { 0, 9, 30588 } }, nSex = 1, nBody = 1, nRoute = 26, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n B�t (Cao C�p)", { 0, 9, 30589 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n B�t (Cao C�p)", { 0, 9, 30589 } }, nSex = 1, nBody = 2, nRoute = 26, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n B�t (Cao C�p)", { 0, 9, 30590 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n B�t (Cao C�p)", { 0, 9, 30590 } }, nSex = 2, nBody = 3, nRoute = 26, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n B�t (Cao C�p)", { 0, 9, 30591 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n B�t (Cao C�p)", { 0, 9, 30591 } }, nSex = 2, nBody = 4, nRoute = 26, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr�o (Cao C�p)", { 0, 11, 30592 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr�o (Cao C�p)", { 0, 11, 30592 } }, nSex = 1, nBody = 1, nRoute = 27, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr�o (Cao C�p)", { 0, 11, 30593 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr�o (Cao C�p)", { 0, 11, 30593 } }, nSex = 1, nBody = 2, nRoute = 27, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr�o (Cao C�p)", { 0, 11, 30594 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr�o (Cao C�p)", { 0, 11, 30594 } }, nSex = 2, nBody = 3, nRoute = 27, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr�o (Cao C�p)", { 0, 11, 30595 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Tr�o (Cao C�p)", { 0, 11, 30595 } }, nSex = 2, nBody = 4, nRoute = 27, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Phi�n (Cao C�p)", { 0, 13, 30596 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Phi�n (Cao C�p)", { 0, 13, 30596 } }, nSex = 2, nBody = 3, nRoute = 29, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Phi�n (Cao C�p)", { 0, 13, 30597 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Phi�n (Cao C�p)", { 0, 13, 30597 } }, nSex = 2, nBody = 4, nRoute = 29, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n ��ch (Cao C�p)", { 0, 12, 30598 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n ��ch (Cao C�p)", { 0, 12, 30598 } }, nSex = 2, nBody = 3, nRoute = 30, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n ��ch (Cao C�p)", { 0, 12, 30599 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n ��ch (Cao C�p)", { 0, 12, 30599 } }, nSex = 2, nBody = 4, nRoute = 30, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u-H�a Ph�ng T��ng Qu�n Ch�y (Cao)", { 0, 14, 32179 } }, [2] = { "Li�u-H�a Ph�ng T��ng Qu�n Ch�y (Cao)", { 0, 14, 32179 } }, nSex = 0, nBody = 0, nRoute = 31, nCamp = WEnv.BATTLECAMP_LIEU },
            { [1] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 32207 } }, [2] = { "Li�u_H�a Ph�ng T��ng Qu�n Ki�m (Cao C�p)", { 0, 2, 32207 } }, nSex = 0, nBody = 0, nRoute = 32, nCamp = WEnv.BATTLECAMP_LIEU },
        };

        local tbNewItem_Khac = {};

        -- Ph�n lo�i ra �� gi�m t�i v�ng l�p n�ng svr
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

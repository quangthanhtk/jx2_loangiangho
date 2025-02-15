WItemUpgrade:RegType({
    nGroupId = 12,
    szLogTitle = "upgrade_uyhotuong_chutuoctuong_vukhi_100",
    szFeatureName = "N�ng c�p v� kh� Uy H� T��ng th�nh Chu T��c T��ng 100%", nDateOpen = 1, nDateClose = 1, -- ng�y m� t�nh n�ng, 1= lu�n m�; 0= lu�n ��ng; ��nh d�ng yyyymmdd t�c l� ��nh ng�y s�n
    szPutinTitle = "��t v�o v� kh� UHT",
    nPutinNum = 1,
    szConsumeInfo = " v� <color=white>1 v� kh� Uy H� T��ng c��ng h�a 15<color>",
    tbMaterialConsume = {
        nBattlePoint = 100000,
        tbItems = {
            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nCount = 16 },
            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nCount = 16 },
            { szName = "M�nh Chu T��c", tbProp = { 2, 1, 40016 }, nCount = 46 },
            { szName = "Ho�ng Kim ��i H�ng Bao", tbProp = { 2, 1, 539 }, nCount = 20 },
        },
    },
    nMatchBodyMode = 4, -- Ch� �� t� ��ng tr� v� v�t ph�m ph� h�p v�i ki�u h�nh ng��i n�ng c�p, 1= gi� nguy�n, 2= auto
    nEnhanceReq = 15, -- Y�u c�u �� c��ng h�a t� m�y? gi� tr� =0 l� ko ki�m tra
    nEnhanceMode = 1, -- Ch� �� gi� c��ng h�a: gi� tr� =1 l� gi� nguy�n �� c��ng h�a; =2 l� tr� �i 1 ��n v�; =3 l� n�u >= 7 th� v� l�i 7, n�u < 7 th� v� 0; 4= l� v� 0
    nMaxRandom = 10000, -- Random t� 1 -> m_nMaxRandom
    nLuckyNum = 10000, -- Trong kho�ng t� 1 -> m_nLuckyNum s� ra th�nh c�ng, gi� tr� =0 l� th�t b�i to�n t�p; =m_nMaxRandom l� 100% th�nh c�ng
    nDoWaitTime = 3, -- T�nh b�ng gi�y
    tbItemAllowUpgrade = {
        { [1] = { "T�ng-Uy H� T��ng Qu�n �ao (Cao)", { 0, 3, 32263 } }, nSex = 0, nBody = 0, nRoute = 2, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n Tr��ng (Cao)", { 0, 8, 32264 } }, nSex = 0, nBody = 0, nRoute = 3, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n Th� (Cao)", { 0, 0, 32265 } }, nSex = 0, nBody = 0, nRoute = 4, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n Ch�m (Cao)", { 0, 1, 32266 } }, nSex = 0, nBody = 0, nRoute = 6, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n Ki�m (Cao)", { 0, 2, 32267 } }, nSex = 0, nBody = 0, nRoute = 8, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n C�m (Cao)", { 0, 10, 32268 } }, nSex = 0, nBody = 0, nRoute = 9, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n Th� (Cao)", { 0, 0, 32269 } }, nSex = 0, nBody = 0, nRoute = 11, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n C�n (Cao)", { 0, 5, 32270 } }, nSex = 0, nBody = 0, nRoute = 12, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n Ki�m (Cao)", { 0, 2, 32271 } }, nSex = 0, nBody = 0, nRoute = 14, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n B�t (Cao)", { 0, 9, 32272 } }, nSex = 0, nBody = 0, nRoute = 15, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n Th��ng (Cao)", { 0, 6, 32273 } }, nSex = 0, nBody = 0, nRoute = 17, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n Cung (Cao)", { 0, 4, 32274 } }, nSex = 0, nBody = 0, nRoute = 18, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n Song �ao (Cao)", { 0, 7, 32275 } }, nSex = 0, nBody = 0, nRoute = 20, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n Tr�o (Cao)", { 0, 11, 32276 } }, nSex = 0, nBody = 0, nRoute = 21, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n Ki�m (Cao)", { 0, 2, 32277 } }, nSex = 0, nBody = 0, nRoute = 23, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n �ao (Cao)", { 0, 3, 32278 } }, nSex = 0, nBody = 0, nRoute = 25, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n B�t (Cao)", { 0, 9, 32279 } }, nSex = 0, nBody = 0, nRoute = 26, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n Tr�o (Cao)", { 0, 11, 32280 } }, nSex = 0, nBody = 0, nRoute = 27, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n Phi�n (Cao)", { 0, 13, 32281 } }, nSex = 0, nBody = 0, nRoute = 29, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n ��ch (Cao)", { 0, 12, 32282 } }, nSex = 0, nBody = 0, nRoute = 30, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n Ch�y (Cao)", { 0, 14, 32283 } }, nSex = 0, nBody = 0, nRoute = 31, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n Ki�m (Cao)", { 0, 2, 32284 } }, nSex = 0, nBody = 0, nRoute = 32, nCamp = WEnv.BATTLECAMP_TONG },

        { [1] = { "Li�u-Uy H� T��ng Qu�n �ao (Cao)", { 0, 3, 32395 } }, nSex = 0, nBody = 0, nRoute = 2, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n Tr��ng (Cao)", { 0, 8, 32396 } }, nSex = 0, nBody = 0, nRoute = 3, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n Th� (Cao)", { 0, 0, 32397 } }, nSex = 0, nBody = 0, nRoute = 4, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n Ch�m (Cao)", { 0, 1, 32398 } }, nSex = 0, nBody = 0, nRoute = 6, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n Ki�m (Cao)", { 0, 2, 32399 } }, nSex = 0, nBody = 0, nRoute = 8, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n C�m (Cao)", { 0, 10, 32400 } }, nSex = 0, nBody = 0, nRoute = 9, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n Th� (Cao)", { 0, 0, 32401 } }, nSex = 0, nBody = 0, nRoute = 11, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n C�n (Cao)", { 0, 5, 32402 } }, nSex = 0, nBody = 0, nRoute = 12, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n Ki�m (Cao)", { 0, 2, 32403 } }, nSex = 0, nBody = 0, nRoute = 14, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n B�t (Cao)", { 0, 9, 32404 } }, nSex = 0, nBody = 0, nRoute = 15, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n Th��ng (Cao)", { 0, 6, 32405 } }, nSex = 0, nBody = 0, nRoute = 17, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n Cung (Cao)", { 0, 4, 32406 } }, nSex = 0, nBody = 0, nRoute = 18, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n Song �ao (Cao)", { 0, 7, 32407 } }, nSex = 0, nBody = 0, nRoute = 20, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n Tr�o (Cao)", { 0, 11, 32408 } }, nSex = 0, nBody = 0, nRoute = 21, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n Ki�m (Cao)", { 0, 2, 32409 } }, nSex = 0, nBody = 0, nRoute = 23, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n �ao (Cao)", { 0, 3, 32410 } }, nSex = 0, nBody = 0, nRoute = 25, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n B�t (Cao)", { 0, 9, 32411 } }, nSex = 0, nBody = 0, nRoute = 26, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n Tr�o (Cao)", { 0, 11, 32412 } }, nSex = 0, nBody = 0, nRoute = 27, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n Phi�n (Cao)", { 0, 13, 32413 } }, nSex = 0, nBody = 0, nRoute = 29, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n ��ch (Cao)", { 0, 12, 32414 } }, nSex = 0, nBody = 0, nRoute = 30, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n Ch�y (Cao)", { 0, 14, 32415 } }, nSex = 0, nBody = 0, nRoute = 31, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n Ki�m (Cao)", { 0, 2, 32416 } }, nSex = 0, nBody = 0, nRoute = 32, nCamp = WEnv.BATTLECAMP_LIEU },
    },
    tbTargetItem = {
        { [1] = { "T�ng-Chu T��c T��ng �ao (Cao)", { 0, 3, 32549 } }, nSex = 0, nBody = 0, nRoute = 2, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng Tr��ng (Cao)", { 0, 8, 32550 } }, nSex = 0, nBody = 0, nRoute = 3, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng Th� (Cao)", { 0, 0, 32551 } }, nSex = 0, nBody = 0, nRoute = 4, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng Ch�m (Cao)", { 0, 1, 32552 } }, nSex = 0, nBody = 0, nRoute = 6, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng Ki�m (Cao)", { 0, 2, 32553 } }, nSex = 0, nBody = 0, nRoute = 8, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng C�m (Cao)", { 0, 10, 32554 } }, nSex = 0, nBody = 0, nRoute = 9, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng Th� (Cao)", { 0, 0, 32555 } }, nSex = 0, nBody = 0, nRoute = 11, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng C�n (Cao)", { 0, 5, 32556 } }, nSex = 0, nBody = 0, nRoute = 12, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng Ki�m (Cao)", { 0, 2, 32557 } }, nSex = 0, nBody = 0, nRoute = 14, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng B�t (Cao)", { 0, 9, 32558 } }, nSex = 0, nBody = 0, nRoute = 15, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng Th��ng (Cao)", { 0, 6, 32559 } }, nSex = 0, nBody = 0, nRoute = 17, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng Cung (Cao)", { 0, 4, 32560 } }, nSex = 0, nBody = 0, nRoute = 18, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng Song �ao (Cao)", { 0, 7, 32561 } }, nSex = 0, nBody = 0, nRoute = 20, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng Tr�o (Cao)", { 0, 11, 32562 } }, nSex = 0, nBody = 0, nRoute = 21, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng Ki�m (Cao)", { 0, 2, 32563 } }, nSex = 0, nBody = 0, nRoute = 23, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng �ao (Cao)", { 0, 3, 32564 } }, nSex = 0, nBody = 0, nRoute = 25, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng B�t (Cao)", { 0, 9, 32565 } }, nSex = 0, nBody = 0, nRoute = 26, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng Tr�o (Cao)", { 0, 11, 32566 } }, nSex = 0, nBody = 0, nRoute = 27, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng Phi�n (Cao)", { 0, 13, 32567 } }, nSex = 0, nBody = 0, nRoute = 29, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng ��ch (Cao)", { 0, 12, 32568 } }, nSex = 0, nBody = 0, nRoute = 30, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng Ch�y (Cao)", { 0, 14, 32569 } }, nSex = 0, nBody = 0, nRoute = 31, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng Ki�m (Cao)", { 0, 2, 32570 } }, nSex = 0, nBody = 0, nRoute = 32, nCamp = WEnv.BATTLECAMP_TONG },

        { [1] = { "Li�u-Chu T��c T��ng �ao (Cao)", { 0, 3, 32681 } }, nSex = 0, nBody = 0, nRoute = 2, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng Tr��ng (Cao)", { 0, 8, 32682 } }, nSex = 0, nBody = 0, nRoute = 3, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng Th� (Cao)", { 0, 0, 32683 } }, nSex = 0, nBody = 0, nRoute = 4, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng Ch�m (Cao)", { 0, 1, 32684 } }, nSex = 0, nBody = 0, nRoute = 6, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng Ki�m (Cao)", { 0, 2, 32685 } }, nSex = 0, nBody = 0, nRoute = 8, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng C�m (Cao)", { 0, 10, 32686 } }, nSex = 0, nBody = 0, nRoute = 9, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng Th� (Cao)", { 0, 0, 32687 } }, nSex = 0, nBody = 0, nRoute = 11, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng C�n (Cao)", { 0, 5, 32688 } }, nSex = 0, nBody = 0, nRoute = 12, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng Ki�m (Cao)", { 0, 2, 32689 } }, nSex = 0, nBody = 0, nRoute = 14, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng B�t (Cao)", { 0, 9, 32690 } }, nSex = 0, nBody = 0, nRoute = 15, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng Th��ng (Cao)", { 0, 6, 32691 } }, nSex = 0, nBody = 0, nRoute = 17, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng Cung (Cao)", { 0, 4, 32692 } }, nSex = 0, nBody = 0, nRoute = 18, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng Song �ao (Cao)", { 0, 7, 32693 } }, nSex = 0, nBody = 0, nRoute = 20, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng Tr�o (Cao)", { 0, 11, 32694 } }, nSex = 0, nBody = 0, nRoute = 21, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng Ki�m (Cao)", { 0, 2, 32695 } }, nSex = 0, nBody = 0, nRoute = 23, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng �ao (Cao)", { 0, 3, 32696 } }, nSex = 0, nBody = 0, nRoute = 25, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng B�t (Cao)", { 0, 9, 32697 } }, nSex = 0, nBody = 0, nRoute = 26, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng Tr�o (Cao)", { 0, 11, 32698 } }, nSex = 0, nBody = 0, nRoute = 27, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng Phi�n (Cao)", { 0, 13, 32699 } }, nSex = 0, nBody = 0, nRoute = 29, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng ��ch (Cao)", { 0, 12, 32700 } }, nSex = 0, nBody = 0, nRoute = 30, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng Ch�y (Cao)", { 0, 14, 32701 } }, nSex = 0, nBody = 0, nRoute = 31, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng Ki�m (Cao)", { 0, 2, 32702 } }, nSex = 0, nBody = 0, nRoute = 32, nCamp = WEnv.BATTLECAMP_LIEU },
    },
});

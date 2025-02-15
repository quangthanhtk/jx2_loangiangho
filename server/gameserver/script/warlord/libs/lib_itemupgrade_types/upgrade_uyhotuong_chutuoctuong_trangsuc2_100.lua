WItemUpgrade:RegType({
    nGroupId = 12,
    szLogTitle = "upgrade_uyhotuong_chutuoctuong_trangsuc2_100",
    szFeatureName = "N�ng c�p UHT L�nh K� th�nh Chu T��c T��ng L�nh K� 100%", nDateOpen = 1, nDateClose = 1, -- ng�y m� t�nh n�ng, 1= lu�n m�; 0= lu�n ��ng; ��nh d�ng yyyymmdd t�c l� ��nh ng�y s�n
    szPutinTitle = "��t v�o UHT L�nh K�",
    nPutinNum = 1,
    szConsumeInfo = " v� <color=white>1 Uy H� T��ng Qu�n L�nh K�<color>",
    tbMaterialConsume = {
        nBattlePoint = 100000,
        tbItems = {
            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nCount = 16 },
            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nCount = 16 },
            { szName = "M�nh Chu T��c", tbProp = { 2, 1, 40016 }, nCount = 46 },
            { szName = "Ho�ng Kim ��i H�ng Bao", tbProp = { 2, 1, 539 }, nCount = 15 },
        },
    },
    nMatchBodyMode = 4, -- Ch� �� t� ��ng tr� v� v�t ph�m ph� h�p v�i ki�u h�nh ng��i n�ng c�p, 1= gi� nguy�n, 2= auto
    nEnhanceReq = 15, -- Y�u c�u �� c��ng h�a t� m�y? gi� tr� =0 l� ko ki�m tra
    nEnhanceMode = 1, -- Ch� �� gi� c��ng h�a: gi� tr� =1 l� gi� nguy�n �� c��ng h�a; =2 l� tr� �i 1 ��n v�; =3 l� n�u >= 7 th� v� l�i 7, n�u < 7 th� v� 0; 4= l� v� 0
    nMaxRandom = 10000, -- Random t� 1 -> m_nMaxRandom
    nLuckyNum = 10000, -- Trong kho�ng t� 1 -> m_nLuckyNum s� ra th�nh c�ng, gi� tr� =0 l� th�t b�i to�n t�p; =m_nMaxRandom l� 100% th�nh c�ng
    nDoWaitTime = 3, -- T�nh b�ng gi�y
    tbItemAllowUpgrade = {
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31564 } }, nSex = 0, nBody = 0, nRoute = 2, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31565 } }, nSex = 0, nBody = 0, nRoute = 3, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31566 } }, nSex = 0, nBody = 0, nRoute = 4, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31567 } }, nSex = 0, nBody = 0, nRoute = 6, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31568 } }, nSex = 0, nBody = 0, nRoute = 8, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31569 } }, nSex = 0, nBody = 0, nRoute = 9, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31570 } }, nSex = 0, nBody = 0, nRoute = 11, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31571 } }, nSex = 0, nBody = 0, nRoute = 12, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31572 } }, nSex = 0, nBody = 0, nRoute = 14, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31573 } }, nSex = 0, nBody = 0, nRoute = 15, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31574 } }, nSex = 0, nBody = 0, nRoute = 17, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31575 } }, nSex = 0, nBody = 0, nRoute = 18, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31576 } }, nSex = 0, nBody = 0, nRoute = 20, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31577 } }, nSex = 0, nBody = 0, nRoute = 21, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31578 } }, nSex = 0, nBody = 0, nRoute = 23, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31579 } }, nSex = 0, nBody = 0, nRoute = 25, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31580 } }, nSex = 0, nBody = 0, nRoute = 26, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31581 } }, nSex = 0, nBody = 0, nRoute = 27, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31582 } }, nSex = 0, nBody = 0, nRoute = 29, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31583 } }, nSex = 0, nBody = 0, nRoute = 30, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31584 } }, nSex = 0, nBody = 0, nRoute = 31, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31585 } }, nSex = 0, nBody = 0, nRoute = 32, nCamp = WEnv.BATTLECAMP_TONG },

        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31718 } }, nSex = 0, nBody = 0, nRoute = 2, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31719 } }, nSex = 0, nBody = 0, nRoute = 3, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31720 } }, nSex = 0, nBody = 0, nRoute = 4, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31721 } }, nSex = 0, nBody = 0, nRoute = 6, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31722 } }, nSex = 0, nBody = 0, nRoute = 8, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31723 } }, nSex = 0, nBody = 0, nRoute = 9, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31724 } }, nSex = 0, nBody = 0, nRoute = 11, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31725 } }, nSex = 0, nBody = 0, nRoute = 12, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31726 } }, nSex = 0, nBody = 0, nRoute = 14, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31727 } }, nSex = 0, nBody = 0, nRoute = 15, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31728 } }, nSex = 0, nBody = 0, nRoute = 17, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31729 } }, nSex = 0, nBody = 0, nRoute = 18, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31730 } }, nSex = 0, nBody = 0, nRoute = 20, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31731 } }, nSex = 0, nBody = 0, nRoute = 21, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31732 } }, nSex = 0, nBody = 0, nRoute = 23, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31733 } }, nSex = 0, nBody = 0, nRoute = 25, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31734 } }, nSex = 0, nBody = 0, nRoute = 26, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31735 } }, nSex = 0, nBody = 0, nRoute = 27, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31736 } }, nSex = 0, nBody = 0, nRoute = 29, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31737 } }, nSex = 0, nBody = 0, nRoute = 30, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31738 } }, nSex = 0, nBody = 0, nRoute = 31, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "Li�u-Uy H� T��ng Qu�n L�nh K�", { 0, 102, 31739 } }, nSex = 0, nBody = 0, nRoute = 32, nCamp = WEnv.BATTLECAMP_TONG },
    },
    tbTargetItem = {
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31874 } }, nSex = 0, nBody = 0, nRoute = 2, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31875 } }, nSex = 0, nBody = 0, nRoute = 3, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31876 } }, nSex = 0, nBody = 0, nRoute = 4, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31877 } }, nSex = 0, nBody = 0, nRoute = 6, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31878 } }, nSex = 0, nBody = 0, nRoute = 8, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31879 } }, nSex = 0, nBody = 0, nRoute = 9, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31880 } }, nSex = 0, nBody = 0, nRoute = 11, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31881 } }, nSex = 0, nBody = 0, nRoute = 12, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31882 } }, nSex = 0, nBody = 0, nRoute = 14, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31883 } }, nSex = 0, nBody = 0, nRoute = 15, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31884 } }, nSex = 0, nBody = 0, nRoute = 17, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31885 } }, nSex = 0, nBody = 0, nRoute = 18, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31886 } }, nSex = 0, nBody = 0, nRoute = 20, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31887 } }, nSex = 0, nBody = 0, nRoute = 21, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31888 } }, nSex = 0, nBody = 0, nRoute = 23, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31889 } }, nSex = 0, nBody = 0, nRoute = 25, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31890 } }, nSex = 0, nBody = 0, nRoute = 26, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31891 } }, nSex = 0, nBody = 0, nRoute = 27, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31892 } }, nSex = 0, nBody = 0, nRoute = 29, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31893 } }, nSex = 0, nBody = 0, nRoute = 30, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31894 } }, nSex = 0, nBody = 0, nRoute = 31, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng-Chu T��c T��ng L�nh K�", { 0, 102, 31895 } }, nSex = 0, nBody = 0, nRoute = 32, nCamp = WEnv.BATTLECAMP_TONG },

        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32028 } }, nSex = 0, nBody = 0, nRoute = 2, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32029 } }, nSex = 0, nBody = 0, nRoute = 3, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32030 } }, nSex = 0, nBody = 0, nRoute = 4, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32031 } }, nSex = 0, nBody = 0, nRoute = 6, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32032 } }, nSex = 0, nBody = 0, nRoute = 8, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32033 } }, nSex = 0, nBody = 0, nRoute = 9, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32034 } }, nSex = 0, nBody = 0, nRoute = 11, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32035 } }, nSex = 0, nBody = 0, nRoute = 12, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32036 } }, nSex = 0, nBody = 0, nRoute = 14, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32037 } }, nSex = 0, nBody = 0, nRoute = 15, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32038 } }, nSex = 0, nBody = 0, nRoute = 17, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32039 } }, nSex = 0, nBody = 0, nRoute = 18, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32040 } }, nSex = 0, nBody = 0, nRoute = 20, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32041 } }, nSex = 0, nBody = 0, nRoute = 21, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32042 } }, nSex = 0, nBody = 0, nRoute = 23, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32043 } }, nSex = 0, nBody = 0, nRoute = 25, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32044 } }, nSex = 0, nBody = 0, nRoute = 26, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32045 } }, nSex = 0, nBody = 0, nRoute = 27, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32046 } }, nSex = 0, nBody = 0, nRoute = 29, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32047 } }, nSex = 0, nBody = 0, nRoute = 30, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32048 } }, nSex = 0, nBody = 0, nRoute = 31, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u-Chu T��c T��ng L�nh K�", { 0, 102, 32049 } }, nSex = 0, nBody = 0, nRoute = 32, nCamp = WEnv.BATTLECAMP_LIEU },
    },
});

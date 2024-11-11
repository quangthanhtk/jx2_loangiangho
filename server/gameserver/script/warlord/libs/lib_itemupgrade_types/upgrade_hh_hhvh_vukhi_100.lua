WItemUpgrade:RegType({
    nGroupId = 3,
    szLogTitle = "upgrade_hh_hhvh_vukhi_100",
    szFeatureName = "N�ng c�p v� kh� H�o Hi�p th�nh H�o Hi�p V� H� 100%", nDateOpen = 1, nDateClose = 1, -- ng�y m� t�nh n�ng, 1= lu�n m�; 0= lu�n ��ng; ��nh d�ng yyyymmdd t�c l� ��nh ng�y s�n
    szPutinTitle = "��t v�o v� kh� HH",
    nPutinNum = 1,
    szConsumeInfo = " v� <color=white>1 v� kh� H�o Hi�p c��ng h�a 12 tr� l�n<color>",
    tbMaterialConsume = {
        tbItems = {
            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nCount = 8 },
            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nCount = 8 },
            { szName = "Ho�ng Kim ��i H�ng Bao", tbProp = { 2, 1, 539 }, nCount = 20 },
        },
    },
    nMatchBodyMode = 4, -- Ch� �� t� ��ng tr� v� v�t ph�m ph� h�p v�i ki�u h�nh ng��i n�ng c�p, 1= gi� nguy�n, 2= auto
    nEnhanceReq = 12, -- Y�u c�u �� c��ng h�a t� m�y? gi� tr� =0 l� ko ki�m tra
    nEnhanceMode = 4, -- Ch� �� gi� c��ng h�a: gi� tr� =1 l� gi� nguy�n �� c��ng h�a; =2 l� tr� �i 1 ��n v�; =3 l� n�u >= 7 th� v� l�i 7, n�u < 7 th� v� 0; 4= l� v� 0nMaxRandom = 10000, -- Random t� 1 -> m_nMaxRandom
    nMaxRandom = 10000, -- Random t� 1 -> m_nMaxRandom
    nLuckyNum = 10000, -- Trong kho�ng t� 1 -> m_nLuckyNum s� ra th�nh c�ng, gi� tr� =0 l� th�t b�i to�n t�p; =m_nMaxRandom l� 100% th�nh c�ng
    nDoWaitTime = 3, -- T�nh b�ng gi�y
    tbItemAllowUpgrade = {
        { [1] = { "H�o Hi�p �ao", { 0, 3, 30724 } }, nSex = 0, nBody = 0, nRoute = 2 },
        { [1] = { "H�o Hi�p Tr��ng", { 0, 8, 30725 } }, nSex = 0, nBody = 0, nRoute = 3 },
        { [1] = { "H�o Hi�p Th�", { 0, 0, 30726 } }, nSex = 0, nBody = 0, nRoute = 4 },
        { [1] = { "H�o Hi�p Ch�m", { 0, 1, 30727 } }, nSex = 0, nBody = 0, nRoute = 6 },
        { [1] = { "H�o Hi�p Ki�m", { 0, 2, 30728 } }, nSex = 0, nBody = 0, nRoute = 8 },
        { [1] = { "H�o Hi�p C�m", { 0, 10, 30729 } }, nSex = 0, nBody = 0, nRoute = 9 },
        { [1] = { "H�o Hi�p Th�", { 0, 0, 30730 } }, nSex = 0, nBody = 0, nRoute = 11 },
        { [1] = { "H�o Hi�p C�n", { 0, 5, 30731 } }, nSex = 0, nBody = 0, nRoute = 12 },
        { [1] = { "H�o Hi�p Ki�m", { 0, 2, 30732 } }, nSex = 0, nBody = 0, nRoute = 14 },
        { [1] = { "H�o Hi�p B�t", { 0, 9, 30733 } }, nSex = 0, nBody = 0, nRoute = 15 },
        { [1] = { "H�o Hi�p Th��ng", { 0, 6, 30734 } }, nSex = 0, nBody = 0, nRoute = 17 },
        { [1] = { "H�o Hi�p Cung", { 0, 4, 30735 } }, nSex = 0, nBody = 0, nRoute = 18 },
        { [1] = { "H�o Hi�p Song �ao", { 0, 7, 30736 } }, nSex = 0, nBody = 0, nRoute = 20 },
        { [1] = { "H�o Hi�p Tr�o", { 0, 11, 30737 } }, nSex = 0, nBody = 0, nRoute = 21 },
        { [1] = { "H�o Hi�p Ki�m", { 0, 2, 30738 } }, nSex = 0, nBody = 0, nRoute = 23 },
        { [1] = { "H�o Hi�p �ao", { 0, 3, 30739 } }, nSex = 0, nBody = 0, nRoute = 25 },
        { [1] = { "H�o Hi�p B�t", { 0, 9, 30740 } }, nSex = 0, nBody = 0, nRoute = 26 },
        { [1] = { "H�o Hi�p Tr�o", { 0, 11, 30741 } }, nSex = 0, nBody = 0, nRoute = 27 },
        { [1] = { "H�o Hi�p Phi�n", { 0, 13, 30742 } }, nSex = 0, nBody = 0, nRoute = 29 },
        { [1] = { "H�o Hi�p ��ch", { 0, 12, 30743 } }, nSex = 0, nBody = 0, nRoute = 30 },
        { [1] = { "H�o Hi�p Ch�y", { 0, 12, 32162 } }, nSex = 0, nBody = 0, nRoute = 31 },
        { [1] = { "H�o Hi�p Ki�m", { 0, 12, 32190 } }, nSex = 0, nBody = 0, nRoute = 32 },
    },
    tbTargetItem = {
        -- L�nh b�i g�c
        --{[1]={"V� H� H�o Hi�p L�nh (V� Kh�)", {2,1,30973}}, nSex=0, nBody=0, nRoute=0},

        -- L�nh b�i m�i mod b�o l�u c��ng h�a
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "V� H� H�o Hi�p L�nh (V� Kh�)", { 2, 1, 40014 } }, nSex = 0, nBody = 0, nRoute = 0 },
    },
});

WItemUpgrade:RegType({
    nGroupId = 5,
    szLogTitle = "upgrade_ah_st_trangsuc_100",
    szFeatureName = "N�ng c�p trang s�c �m Huy�t th�nh S�t Tinh 100%", nDateOpen = 1, nDateClose = 1, -- ng�y m� t�nh n�ng, 1= lu�n m�; 0= lu�n ��ng; ��nh d�ng yyyymmdd t�c l� ��nh ng�y s�n
    szPutinTitle = "��t v�o trang s�c �H",
    nPutinNum = 1,
    szConsumeInfo = " v� <color=white>1 trang s�c �m Huy�t<color>",
    tbMaterialConsume = {
        tbItems = {
            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nCount = 15 },
            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nCount = 15 },
            --{ szName = "Ho�ng Kim ��i H�ng Bao", tbProp = { 2, 1, 539 }, nCount = 15 },
        },
    },
    nMatchBodyMode = 4, -- Ch� �� t� ��ng tr� v� v�t ph�m ph� h�p v�i ki�u h�nh ng��i n�ng c�p, 1= gi� nguy�n, 2= auto
    nEnhanceReq = 0, -- Y�u c�u �� c��ng h�a t� m�y? gi� tr� =0 l� ko ki�m tra
    nEnhanceMode = 4, -- Ch� �� gi� c��ng h�a: gi� tr� =1 l� gi� nguy�n �� c��ng h�a; =2 l� tr� �i 1 ��n v�; =3 l� n�u >= 7 th� v� l�i 7, n�u < 7 th� v� 0; 4= l� v� 0
    nMaxRandom = 10000, -- Random t� 1 -> m_nMaxRandom
    nLuckyNum = 10000, -- Trong kho�ng t� 1 -> m_nLuckyNum s� ra th�nh c�ng, gi� tr� =0 l� th�t b�i to�n t�p; =m_nMaxRandom l� 100% th�nh c�ng
    nDoWaitTime = 3, -- T�nh b�ng gi�y
    tbItemAllowUpgrade = {
        -- Trang b� g�c
        --{[1]={"�m Huy�t T� Gi�i", {0,102,31272}}, nSex=0, nBody=0, nRoute=0},
        --{[1]={"�m Huy�t H�u Gi�i", {0,102,31273}}, nSex=0, nBody=0, nRoute=0},

        -- L�nh b�i mod b�o l�u c��ng h�a
        { [1] = { "�m Huy�t T� Gi�i", { 0, 102, 31272 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "�m Huy�t H�u Gi�i", { 0, 102, 31273 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "�m Huy�t B�i", { 0, 102, 31414 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "�m Huy�t Tr�y", { 0, 102, 31415 } }, nSex = 0, nBody = 0, nRoute = 0 },
    },
    tbTargetItem = {
        -- Trang b� g�c
        --{[1]={"S�t Tinh-C�u Linh H�a Gi�i", {0,102,31850}}, nSex=0, nBody=0, nRoute=0},
        --{[1]={"S�t Tinh-Ng�ng Ng�c Th� Ho�n", {0,102,31851}}, nSex=0, nBody=0, nRoute=0},

        -- L�nh b�i g�c
        --{[1]={"S�t Tinh L�nh B�i (Trang S�c)", {2,1,31317}}, nSex=0, nBody=0, nRoute=0},

        -- L�nh b�i mod b�o l�u c��ng h�a
        { [1] = { "S�t Tinh L�nh B�i (Trang S�c)", { 2, 1, 40005 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "S�t Tinh L�nh B�i (Trang S�c)", { 2, 1, 40005 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "S�t Tinh L�nh B�i (Trang S�c)", { 2, 1, 40005 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "S�t Tinh L�nh B�i (Trang S�c)", { 2, 1, 40005 } }, nSex = 0, nBody = 0, nRoute = 0 },
    },
});

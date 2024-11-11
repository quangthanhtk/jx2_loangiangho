WItemUpgrade:RegType({
    nGroupId = 2,
    szLogTitle = "upgrade_cc_hh_trangsuc2_100",
    szFeatureName = "N�ng c�p trang s�c Di�u D��ng Thi�n Cung l�n H�o Hi�p B�i 100%", nDateOpen = 1, nDateClose = 1, -- ng�y m� t�nh n�ng, 1= lu�n m�; 0= lu�n ��ng; ��nh d�ng yyyymmdd t�c l� ��nh ng�y s�n
    szPutinTitle = "��t v�o trang s�c DDTC",
    nPutinNum = 1,
    szConsumeInfo = " v� <color=white>1 trang s�c Di�u D��ng Thi�n Cung b�t k�<color>",
    tbMaterialConsume = {
        tbItems = {
            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nCount = 5 },
            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nCount = 5 },
            { szName = "Ho�ng Kim ��i H�ng Bao", tbProp = { 2, 1, 539 }, nCount = 10 },
        },
    },
    nMatchBodyMode = 3, -- Ch� �� t� ��ng tr� v� v�t ph�m ph� h�p v�i ki�u h�nh ng��i n�ng c�p, 1= gi� nguy�n, 2= auto
    nEnhanceReq = 0, -- Y�u c�u �� c��ng h�a t� m�y? gi� tr� =0 l� ko ki�m tra
    nEnhanceMode = 4, -- Ch� �� gi� c��ng h�a: gi� tr� =1 l� gi� nguy�n �� c��ng h�a; =2 l� tr� �i 1 ��n v�; =3 l� n�u >= 7 th� v� l�i 7, n�u < 7 th� v� 0; 4= l� v� 0
    nMaxRandom = 10000, -- Random t� 1 -> m_nMaxRandom
    nLuckyNum = 10000, -- Trong kho�ng t� 1 -> m_nLuckyNum s� ra th�nh c�ng, gi� tr� =0 l� th�t b�i to�n t�p; =m_nMaxRandom l� 100% th�nh c�ng
    nDoWaitTime = 3, -- T�nh b�ng gi�y
    tbItemAllowUpgrade = {
        { [1] = { "Di�u D��ng Thi�n Cung-� L�n B�o Gi�i", { 0, 102, 3190 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "Di�u D��ng Thi�n Cung-T� Giao Ng�c B�i", { 0, 102, 3191 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "Di�u D��ng Thi�n Cung-V�n H� L�nh", { 0, 102, 3192 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "Di�u D��ng Thi�n Cung-X�ch T��c Ho�n", { 0, 102, 3193 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "Di�u D��ng Thi�n Cung-B�ch Quy Li�n", { 0, 102, 3194 } }, nSex = 0, nBody = 0, nRoute = 0 },
    },
    tbTargetItem = {
        { [1] = { "H�o Hi�p B�i", { 0, 102, 31127 } }, nSex = 0, nBody = 0, nRoute = 0 },
    },
});

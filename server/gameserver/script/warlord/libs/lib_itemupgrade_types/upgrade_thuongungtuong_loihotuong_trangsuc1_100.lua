WItemUpgrade:RegType({
    nGroupId = 8,
    szLogTitle = "upgrade_thuongungtuong_loihotuong_trangsuc1_100",
    szFeatureName = "N�ng c�p T�T L�nh th�nh L�i H� T��ng B�i 100%", nDateOpen = 1, nDateClose = 1, -- ng�y m� t�nh n�ng, 1= lu�n m�; 0= lu�n ��ng; ��nh d�ng yyyymmdd t�c l� ��nh ng�y s�n
    szPutinTitle = "��t v�o trang s�c T�T L�nh",
    nPutinNum = 1,
    szConsumeInfo = " v� <color=white>1 Th��ng �ng T��ng Qu�n L�nh<color>",
    tbMaterialConsume = {
        nBattlePoint = 16000,
        tbItems = {
            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nCount = 3 },
            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nCount = 3 },
            { szName = "M�nh Chu T��c", tbProp = { 2, 1, 40016 }, nCount = 7 },
            { szName = "Ho�ng Kim ��i H�ng Bao", tbProp = { 2, 1, 539 }, nCount = 15 },
        },
    },
    nMatchBodyMode = 4, -- Ch� �� t� ��ng tr� v� v�t ph�m ph� h�p v�i ki�u h�nh ng��i n�ng c�p, 1= gi� nguy�n, 2= auto
    nEnhanceReq = 0, -- Y�u c�u �� c��ng h�a t� m�y? gi� tr� =0 l� ko ki�m tra
    nEnhanceMode = 4, -- Ch� �� gi� c��ng h�a: gi� tr� =1 l� gi� nguy�n �� c��ng h�a; =2 l� tr� �i 1 ��n v�; =3 l� n�u >= 7 th� v� l�i 7, n�u < 7 th� v� 0; 4= l� v� 0
    nMaxRandom = 10000, -- Random t� 1 -> m_nMaxRandom
    nLuckyNum = 10000, -- Trong kho�ng t� 1 -> m_nLuckyNum s� ra th�nh c�ng, gi� tr� =0 l� th�t b�i to�n t�p; =m_nMaxRandom l� 100% th�nh c�ng
    nDoWaitTime = 3, -- T�nh b�ng gi�y
    tbItemAllowUpgrade = {
        { [1] = { "T�ng Th��ng �ng T��ng Qu�n L�nh", { 0, 102, 30052 } }, nSex = 1, nBody = 1, nRoute = 0, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng Th��ng �ng T��ng Qu�n L�nh", { 0, 102, 30053 } }, nSex = 1, nBody = 2, nRoute = 0, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng Th��ng �ng T��ng Qu�n L�nh", { 0, 102, 30054 } }, nSex = 2, nBody = 3, nRoute = 0, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng Th��ng �ng T��ng Qu�n L�nh", { 0, 102, 30055 } }, nSex = 2, nBody = 4, nRoute = 0, nCamp = WEnv.BATTLECAMP_TONG },

        { [1] = { "Li�u Th��ng �ng T��ng Qu�n L�nh", { 0, 102, 30088 } }, nSex = 1, nBody = 1, nRoute = 0, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u Th��ng �ng T��ng Qu�n L�nh", { 0, 102, 30089 } }, nSex = 1, nBody = 2, nRoute = 0, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u Th��ng �ng T��ng Qu�n L�nh", { 0, 102, 30090 } }, nSex = 2, nBody = 3, nRoute = 0, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u Th��ng �ng T��ng Qu�n L�nh", { 0, 102, 30091 } }, nSex = 2, nBody = 4, nRoute = 0, nCamp = WEnv.BATTLECAMP_LIEU },
    },
    tbTargetItem = {
        { [1] = { "T�ng L�i H� T��ng B�i", { 0, 102, 30157 } }, nSex = 1, nBody = 1, nRoute = 0, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng L�i H� T��ng B�i", { 0, 102, 30158 } }, nSex = 1, nBody = 2, nRoute = 0, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng L�i H� T��ng B�i", { 0, 102, 30159 } }, nSex = 2, nBody = 3, nRoute = 0, nCamp = WEnv.BATTLECAMP_TONG },
        { [1] = { "T�ng L�i H� T��ng B�i", { 0, 102, 30160 } }, nSex = 2, nBody = 4, nRoute = 0, nCamp = WEnv.BATTLECAMP_TONG },

        { [1] = { "Li�u L�i H� T��ng B�i", { 0, 102, 30193 } }, nSex = 1, nBody = 1, nRoute = 0, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u L�i H� T��ng B�i", { 0, 102, 30194 } }, nSex = 1, nBody = 2, nRoute = 0, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u L�i H� T��ng B�i", { 0, 102, 30195 } }, nSex = 2, nBody = 3, nRoute = 0, nCamp = WEnv.BATTLECAMP_LIEU },
        { [1] = { "Li�u L�i H� T��ng B�i", { 0, 102, 30196 } }, nSex = 2, nBody = 4, nRoute = 0, nCamp = WEnv.BATTLECAMP_LIEU },
    },
});

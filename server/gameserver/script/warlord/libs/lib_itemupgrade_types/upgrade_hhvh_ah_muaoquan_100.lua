WItemUpgrade:RegType({
    nGroupId = 4,
    szLogTitle = "upgrade_hhvh_ah_muaoquan_100",
    szFeatureName = "N�ng c�p m�/�o/qu�n H�o Hi�p V� H� th�nh �m Huy�t 100%", nDateOpen = 1, nDateClose = 1, -- ng�y m� t�nh n�ng, 1= lu�n m�; 0= lu�n ��ng; ��nh d�ng yyyymmdd t�c l� ��nh ng�y s�n
    szPutinTitle = "��t v�o m�/�o/qu�n HHVH",
    nPutinNum = 1,
    szConsumeInfo = " v� <color=white>1 trang b� H�o Hi�p V� H� (m�/�o/qu�n) c��ng h�a 15<color>",
    tbMaterialConsume = {
        tbItems = {
            { szName = "Thi�n Cang L�nh", tbProp = { 2, 95, 204 }, nCount = 15 },
            { szName = "Thi�n M�n Kim L�nh", tbProp = { 2, 1, 30370 }, nCount = 15 },
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
        { [1] = { "N�n H�o Hi�p-V� H�", { 0, 103, 30569 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "�o H�o Hi�p-V� H�", { 0, 100, 30569 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "Qu�n H�o Hi�p-V� H�", { 0, 101, 30569 } }, nSex = 0, nBody = 0, nRoute = 0 },
    },
    tbTargetItem = {
        -- Trang b� g�c
        { [1] = { "�m Huy�t ��u", { 0, 103, 30610 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "�m Huy�t Y", { 0, 100, 30610 } }, nSex = 0, nBody = 0, nRoute = 0 },
        { [1] = { "�m Huy�t Trang", { 0, 101, 30610 } }, nSex = 0, nBody = 0, nRoute = 0 },

        -- L�nh b�i g�c
        --{[1]={"�m Huy�t ��u", {2,1,31523}}, nSex=0, nBody=0, nRoute=0},
        --{[1]={"�o �m Huy�t", {2,1,31524}}, nSex=0, nBody=0, nRoute=0},
        --{[1]={"Qu�n �m Huy�t", {2,1,31525}}, nSex=0, nBody=0, nRoute=0},
    },
});

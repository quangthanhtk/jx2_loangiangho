Include("\\script\\ksgvn\\event\\newplayer\\newplayer_award.lua")

_g_tbAward_Giftcode_NewPlayer = {
    { nFunc = "KsgItem:AddOrnClothByBody(231)", },
    { tbProp = { 0, 112, 158 }, nStack = 1, nStatus = 4 }, -- L�ng Ba Vi B� to�n t�p
    { tbProp = { 0, 102, 30037 }, nStack = 1, nStatus = 4 }, -- Thi�n ��a Gi�i
    { tbProp = { 0, 102, 30038 }, nStack = 1, nStatus = 4 }, -- Nh�t Nguy�t Gi�i
}

g_tbNewPlayerGift_Daily = { --LongDaiKa: ��ng ph�n th��ng ng��i b�nh th��ng nh�n
    --{ tbProp = { 2, 1, 50016 }, nStack = 10, nStatus = 4 }, -- T�i Qu� V� L�m
    --{ tbProp = { 2, 0, 554 }, nStack = 2, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Tu Ch�n Y�u Quy�t
    --{ tbProp = { 2, 0, 504 }, nStack = 3, nStatus = 4, nExpiredTime = 24 * 3600 }, -- C�y b�t nh� nh�
    --{ tbProp = { 2, 0, 398 }, nStack = 3, nStatus = 4, nExpiredTime = 24 * 3600 }, -- C�y b�t nh� l�n
    --{ tbProp = { 2, 1, 30269 }, nStack = 3, nStatus = 4, nExpiredTime = 24 * 3600 }, -- C�y t� linh
    --{ tbProp = { 2, 97, 236 }, nStack = 2, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Thi�n Ki�u L�nh
    --{ tbProp = { 2, 1, 30154 }, nStack = 5, nStatus = 4, nExpiredTime = 24 * 3600 }, -- N� Oa B�o H�p
    --{ tbProp = { 2, 1, 30191 }, nStack = 2, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Ng�i Sao May M�n
}

g_tbNewPlayerGift_Daily_VIP = {
    --goc ksgvn
    --{ tbProp = { 2, 1, 50016 }, nStack = 20, nStatus = 4 }, -- T�i Qu� V� L�m
    --{ tbProp = { 2, 0, 554 }, nStack = 4, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Tu Ch�n Y�u Quy�t
    --{ tbProp = { 2, 0, 504 }, nStack = 3, nStatus = 4, nExpiredTime = 24 * 3600 }, -- C�y b�t nh� nh�
    --{ tbProp = { 2, 0, 398 }, nStack = 3, nStatus = 4, nExpiredTime = 24 * 3600 }, -- C�y b�t nh� l�n
    --{ tbProp = { 2, 1, 30269 }, nStack = 3, nStatus = 4, nExpiredTime = 24 * 3600 }, -- C�y t� linh
    --{ tbProp = { 2, 1, 30087 }, nStack = 2, nStatus = 4, nExpiredTime = 24 * 3600 }, -- T�i h�t gi�ng
    --{ tbProp = { 2, 97, 236 }, nStack = 5, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Thi�n Ki�u L�nh
    --{ tbProp = { 2, 1, 30154 }, nStack = 10, nStatus = 4, nExpiredTime = 24 * 3600 }, -- N� Oa B�o H�p
    --{ tbProp = { 2, 1, 30191 }, nStack = 4, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Ng�i Sao May M�n

    -- jx2vtd
    { tbProp = { 2, 0, 554 }, nStack = 10, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Tu Ch�n Y�u Quy�t
    { tbProp = { 2, 1, 30524 }, nStack = 5, nStatus = 4, nExpiredTime = 24 * 3600 }, -- T�y T�m Th�ch Lv4
    { tbProp = { 2, 1, 30530 }, nStack = 5, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Luy�n L� Thi�t Lv4
    { tbProp = { 2, 1, 30999 }, nStack = 5, nStatus = 4, nExpiredTime = 24 * 3600 }, -- T�i �� Qu� C�p 2
    { tbProp = { 2, 1, 30730 }, nStack = 15, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Kinh M�ch ��ng Nh�n
    { tbProp = { 2, 1, 30731 }, nStack = 10, nStatus = 4, nExpiredTime = 24 * 3600 }, -- Kinh M�ch Ng�n Nh�n
    { tbProp = { 2, 1, 40026 }, nStack = 1, nStatus = 4, nExpiredTime = 24 * 3600 }, -- M�nh M�t T�ch Cao C�p
}

g_tbNewPlayerGift_Weekly = { --LongDaiKa: ��ng ph�n th��ng ng��i b�nh th��ng
    --{ tbProp = { 2, 95, 204 }, nStack = 1, nStatus = 4 }, -- Thi�n Cang L�nh
    --{ tbProp = { 2, 1, 30370 }, nStack = 1, nStatus = 4 }, -- Thi�n M�n Kim L�nh
    --{ nPopur2 = 100 }, -- �i�m L�ch luy�n
    --{ nPhongHoa = 100 }, -- �i�m Phong Hoa
}

g_tbNewPlayerGift_Weekly_VIP = {
    --goc ksgvn
    --{ tbProp = { 2, 95, 204 }, nStack = 2, nStatus = 4 }, -- Thi�n Cang L�nh
    --{ tbProp = { 2, 1, 30370 }, nStack = 2, nStatus = 4 }, -- Thi�n M�n Kim L�nh
    --{ tbProp = { 2, 1, 31122 }, nStack = 1, nStatus = 4 }, -- Linh Kh� R�c R�
    --{ tbProp = { 2, 1, 31386 }, nStack = 100, nStatus = 4 }, -- M�nh Th� C��i
    --{ nPopur2 = 200 }, -- �i�m L�ch luy�n
    --{ nPhongHoa = 200 }, -- �i�m Phong Hoa

    -- jx2vtd
    { tbProp = { 2, 1, 31169 }, nStack = 1, nStatus = 4, nExpiredTime = 7 * 24 * 3600 }, -- Tr�ng Th� C�ng-Si�u
    { tbProp = { 2, 114, 143 }, nStack = 2, nStatus = 4, nExpiredTime = 7 * 24 * 3600 }, -- Ch�n V� H�n Th�ch
    { tbProp = { 2, 1, 30913 }, nStack = 2, nStatus = 4, nExpiredTime = 7 * 24 * 3600 }, -- ��ng T� Chi Nguy�n
    { tbProp = { 2, 1, 30912 }, nStack = 10, nStatus = 4, nExpiredTime = 7 * 24 * 3600 }, -- Hi�p Ngh�a Chi Ch�ng
    { tbProp = { 2, 1, 31244 }, nStack = 100, nStatus = 4, nExpiredTime = 7 * 24 * 3600 }, -- M�nh C� Quan M�c Gia
}

g_tbNewPlayer_AwardSupportReborn = {
    [1] = {
        nAwardLevel = 890,
        tbAwardBonus = { tbProp = { 2, 1, 50253 }, nStatus = 4, nStack = 2 },
        tbCondition = {
            nBigLevel = 73,
            nRepute = 3000,
            nFactionPoint = 4000,
            nHonor = 50000,
        },
        tbAward = {
            { nRebornCustom = 890, szCallback = "NewPlayerAward_Mach2" },
            { nFunc = "NewPlayerAward:ChienCuong()" },
            { tbProp = { 0, 102, 8844 }, nStatus = 4, nStack = 1 }, -- Huy Ho�ng Qu�t Kh�i
            { tbProp = { 0, 102, 8845 }, nStatus = 4, nStack = 1 }, -- Vinh D� Qu�t Kh�i,
            { tbProp = { 0, 152, 9 }, nStatus = 4, nStack = 1 }, -- Kx �m ch�
            { tbProp = { 0, 153, 9 }, nStatus = 4, nStack = 1 }, -- Kx �m ch�
            { tbProp = { 0, 154, 9 }, nStatus = 4, nStack = 1 }, -- Kx �m ch�
            { tbProp = { 0, 112, 158 }, nStatus = 4, nStack = 1 }, -- L�ng ba vi b� to�n t�p
            { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 2000 }, -- Hi�p Ngh�a Chi Ch�ng
            { tbProp = { 2, 1, 50005 }, nStatus = 4 }, -- R��ng YQ
            { nFunc = "NewPlayerAward:SetVanSuc(1)" },
            { nFunc = "NewPlayerAward:ThuongHaiChau(1, 7)" },
            { tbProp = { 2, 1, 30945 }, nStatus = 4, nStack = 1 }, -- L�nh B�i H�o Hi�p �o
            { tbProp = { 2, 1, 30944 }, nStatus = 4, nStack = 1 }, -- L�nh B�i H�o Hi�p N�n
            { tbProp = { 2, 1, 30946 }, nStatus = 4, nStack = 1 }, -- L�nh B�i H�o Hi�p Qu�n
        }
    },
    [2] = {
        nAwardLevel = 990,
        tbAwardBonus = { tbProp = { 2, 1, 50253 }, nStatus = 4, nStack = 5 },
        tbCondition = {
            nBigLevel = 892,
            nRepute = 6000,
            nFactionPoint = 6000,
            nHonor = 150000,
        },
        tbAward = {
            { nReborn = 990 },
            { tbProp = { 2, 1, 50005 }, nStatus = 4 }, -- R��ng YQ
            { nFunc = "NewPlayerAward:Gem(1, 8)" },
            { nFunc = "NewPlayerAward:Gem(2, 8)" },
            { nFunc = "NewPlayerAward:Gem(3, 6)" },
            { nFunc = "NewPlayerAward:Gem(4, 4)" },
            { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 2000 }, -- Hi�p Ngh�a Chi Ch�ng
            { nMeridianLevel = 3 },
            { nChanKhi = 100000 },
        }
    },
    [3] = {
        nAwardLevel = 1090,
        tbAwardBonus = { tbProp = { 2, 1, 50253 }, nStatus = 4, nStack = 10 },
        tbCondition = {
            nBigLevel = 992,
            tbItems = {
                { tbProp = { 2, 1, 30814 }, nCount = 2 }, -- Ph�c sinh ��n
            },
        },
        tbAward = {
            { nReborn = 1090 },
            { nFunc = "NewPlayerAward:Gem(3, 6)" },
            { nFunc = "NewPlayerAward:Gem(4, 6)" },
            { nFunc = "NewPlayerAward:Gem(5, 4)" },
            { tbProp = { 2, 1, 30912 }, nStatus = 4, nStack = 2000 }, -- Hi�p Ngh�a Chi Ch�ng
            { nMeridianLevel = 4 },
            { nChanKhi = 100000 },
        }
    },
    [4] = {
        nAwardLevel = 1095,
        tbCondition = {
            nBigLevel = 1095,
            tbItems = {
                { tbProp = { 2, 1, 30814 }, nCount = 5 }, -- Ph�c sinh ��n
            },
        },
        tbAward = {
            { tbProp = { 2, 1, 31313 }, nStatus = 4, nStack = 1 }, -- L�nh b�i S�t Tinh (N�n)
            { tbProp = { 2, 1, 31261 }, nStatus = 4, nStack = 1 }, -- Kh�c b�n ho�n m� c�p 3 (N�n)
        }
    },
    [5] = {
        nAwardLevel = 1096,
        tbCondition = {
            nBigLevel = 1096,
        },
        tbAward = {
            { tbProp = { 2, 1, 31314 }, nStatus = 4, nStack = 1 }, -- L�nh b�i S�t Tinh (�o)
            { tbProp = { 2, 1, 31262 }, nStatus = 4, nStack = 1 }, -- Kh�c b�n ho�n m� c�p 3 (�o)
        }
    },
    [6] = {
        nAwardLevel = 1098,
        tbCondition = {
            nBigLevel = 1098,
            tbItems = {
                { tbProp = { 2, 95, 204 }, nCount = 5 }, -- Thi�n Cang L�nh
                { tbProp = { 2, 1, 30370 }, nCount = 5 }, -- Thi�n M�n Kim L�nh
            }
        },
        tbAward = {
            { tbProp = { 2, 1, 31315 }, nStatus = 4, nStack = 1 }, -- L�nh b�i S�t Tinh (Qu�n)
            { tbProp = { 2, 1, 31263 }, nStatus = 4, nStack = 1 }, -- Kh�c b�n ho�n m� c�p 3 (Qu�n)
        },
    },
    [7] = {
        nAwardLevel = 1099,
        tbCondition = {
            nBigLevel = 1099,
            tbItems = {
                { tbProp = { 2, 1, 30230 }, nCount = 10000 }, -- Xu
            }
        },
        tbAward = {
            { nFunc = "NewPlayerAward:ActiveHoaCanh()" },
            { nFunc = "NewPlayerAward:VSCTRandom()" },
            { tbProp = { 2, 1, 31264 }, nStatus = 4, nStack = 1 }, -- Kh�c b�n Ho�n M� c�p 3 (Nh�n)
            { tbProp = { 2, 1, 31265 }, nStatus = 4, nStack = 1 }, -- Kh�c b�n Ho�n M� c�p 3 (Ng�c B�i)
        },
    },
}

g_szNpcName = "<color=green>T�n Th� L�nh<color>: "
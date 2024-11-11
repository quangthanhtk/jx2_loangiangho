-- Ph�n th��ng m�c t�ch l�y ti�u xu
_g_tbAward_Spend_Money = {
    [PackItemId(2, 1, 50006)] = {
        { tbProp = { 2, 0, 554 }, nStatus = 1, nExpiredTime = 7 * 24 * 3600, nStack = 5 }, -- Tu Ch�n YQ
        { tbProp = { 2, 0, 504 }, nStatus = 1, nExpiredTime = 7 * 24 * 3600, nStack = 5 }, -- C�y b�t nh� nh�
        { tbProp = { 2, 1, 30847 }, nStatus = 1, nStack = 2 }, -- H�i Ti�n ��n
        { nFunc = "KsgAward:ReceiveGem(3, 3)" },
    },
    [PackItemId(2, 1, 50007)] = {
        { tbProp = { 2, 0, 554 }, nStatus = 1, nExpiredTime = 7 * 24 * 3600, nStack = 5 }, -- Tu Ch�n YQ
        { tbProp = { 2, 0, 398 }, nStatus = 1, nExpiredTime = 7 * 24 * 3600, nStack = 5 }, -- C�y b�t nh�
        { tbProp = { 2, 1, 1009 }, nStatus = 1, nStack = 20 }, -- Thi�n Th�ch Tinh Th�ch
        { tbProp = { 2, 1, 30847 }, nStatus = 1, nStack = 4 }, -- H�i Ti�n ��n
        { nFunc = "KsgAward:ReceiveGem(4, 3)" },
    },
    [PackItemId(2, 1, 50008)] = {
        { tbProp = { 2, 1, 31244 }, nStatus = 1, nStack = 36 }, -- M�nh c� quan M�c Gia
        { tbProp = { 2, 102, 215 }, nStatus = 1, nStack = 15 }, -- B�t Tr�n Ch�u
        { tbProp = { 2, 1, 30847 }, nStatus = 1, nStack = 6 }, -- H�i Ti�n ��n
        { nFunc = "KsgAward:ReceiveGem(5, 2)" },
    },
    [PackItemId(2, 1, 50009)] = {
        { nFunc = "KsgAward:ThuongHaiChau(3, 1, 1)" },
        { tbProp = { 2, 1, 31244 }, nStatus = 1, nStack = 80 }, -- M�nh c� quan M�c Gia
        { tbProp = { 2, 102, 215 }, nStatus = 1, nStack = 15 }, -- B�t Tr�n Ch�u
        { tbProp = { 2, 1, 30847 }, nStatus = 1, nStack = 8 }, -- H�i Ti�n ��n
        { nFunc = "KsgAward:ReceiveGem(6, 1)" },
    },
    [PackItemId(2, 1, 50010)] = {
        { nFunc = "KsgAward:ThuongHaiChau(4, 1, 1)" },
        { tbProp = { 2, 1, 31244 }, nStatus = 1, nStack = 100 }, -- M�nh c� quan M�c Gia
        { tbProp = { 2, 102, 215 }, nStatus = 1, nStack = 15 }, -- B�t Tr�n Ch�u
        { nPhongHoa = 10000 }, -- Diem phong hoa
        { tbProp = { 2, 1, 30814 }, nStatus = 1, nStack = 1 }, -- Ph�c Sinh ��n
        { nFunc = "KsgAward:ReceiveGem(6, 1)" },
    },
    [PackItemId(2, 1, 50011)] = {
        { nFunc = "KsgAward:ThuongHaiChau(5, 1, 1)" },
        { tbProp = { 2, 1, 31244 }, nStatus = 1, nStack = 120 }, -- M�nh c� quan M�c Gia
        { tbProp = { 2, 102, 215 }, nStatus = 1, nStack = 30 }, -- B�t Tr�n Ch�u
        { tbProp = { 2, 1, 31248 }, nStatus = 1, nStack = 2 }, -- T� Linh Quy�t
        { tbProp = { 2, 1, 50028 }, nStatus = 1, nStack = 1 }, -- C� ph� - T�i T�n Quy�n
        { nFunc = "KsgAward:ReceiveGem(6, 1)" },
    },
    [PackItemId(2, 1, 50012)] = {
        { nFunc = "KsgAward:ThuongHaiChau(6, 1, 1)" },
        { tbProp = { 2, 1, 31244 }, nStatus = 1, nStack = 240 }, -- M�nh c� quan M�c Gia
        { tbProp = { 2, 1, random(31397, 31399) }, nStatus = 1, nStack = 150 }, -- M�nh Kim X� 7 Ng�u Nhi�n
        { tbProp = { 2, 102, 215 }, nStatus = 1, nStack = 45 }, -- B�t Tr�n Ch�u
        { tbProp = { 2, 1, 31248 }, nStatus = 1, nStack = 3 }, -- T� Linh Quy�t
        { tbProp = { 2, 1, 50028 }, nStatus = 1, nStack = 1 }, -- C� ph� - T�i T�n Quy�n
    },
    [PackItemId(2, 1, 50013)] = {
        { nFunc = "KsgAward:ThuongHaiChau(6, 1, 1)" },
        { tbProp = { 2, 1, 31244 }, nStatus = 1, nStack = 300 }, -- M�nh c� quan M�c Gia
        { tbProp = { 2, 1, random(31397, 31399) }, nStatus = 1, nStack = 200 }, -- M�nh Kim X� 7 Ng�u Nhi�n
        { tbProp = { 2, 102, 215 }, nStatus = 1, nStack = 60 }, -- B�t Tr�n Ch�u
        { tbProp = { 2, 1, 31248 }, nStatus = 1, nStack = 4 }, -- T� Linh Quy�t
        { tbProp = { 2, 1, 50028 }, nStatus = 1, nStack = 1 }, -- C� ph� - T�i T�n Quy�n
    },
    [PackItemId(2, 1, 50014)] = {
        { nFunc = "KsgAward:ThuongHaiChau(7, 1, 1)" },
        { tbProp = { 2, 1, 31244 }, nStatus = 1, nStack = 800 }, -- M�nh c� quan M�c Gia
        { tbProp = { 2, 1, random(31397, 31399) }, nStatus = 1, nStack = 300 }, -- M�nh Kim X� 7 Ng�u Nhi�n
        { tbProp = { 2, 102, 215 }, nStatus = 1, nStack = 90 }, -- B�t Tr�n Ch�u
        { tbProp = { 2, 1, 31248 }, nStatus = 1, nStack = 5 }, -- T� Linh Quy�t
        { tbProp = { 2, 1, 50028 }, nStatus = 1, nStack = 1 }, -- C� ph� - T�i T�n Quy�n
    },
    [PackItemId(2, 1, 50015)] = {
        { nFunc = "KsgAward:ThuongHaiChau(7, 1, 1)" },
        { tbProp = { 2, 1, 31244 }, nStatus = 1, nStack = 1600 }, -- M�nh c� quan M�c Gia
        { tbProp = { 2, 1, random(31397, 31399) }, nStatus = 1, nStack = 400 }, -- M�nh Kim X� 7 Ng�u Nhi�n
        { tbProp = { 2, 102, 215 }, nStatus = 1, nStack = 120 }, -- B�t Tr�n Ch�u
        { tbProp = { 2, 1, 50266 }, nStatus = 1, nStack = 1 }, -- Th� ngo�i trang ch� t�n
        { tbProp = { 2, 1, 50028 }, nStatus = 1, nStack = 2 }, -- C� ph� - T�i T�n Quy�n
    }
}

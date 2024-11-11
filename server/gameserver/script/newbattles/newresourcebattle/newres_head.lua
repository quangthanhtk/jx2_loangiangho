Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\newbattles\\newresourcebattle\\newres_pos.lua");

SONG_ID = 1
LIAO_ID = 2
ALL_ID = 3

MAX_CAMP = 300
MAX_POINT = 2000

MAP_ID = 606

DEATH_SCRIPT = "\\script\\newbattles\\newresourcebattle\\playerdeath.lua"

tCamp = {
    [0] = "Trung l�p",
    [1] = "T�ng",
    [2] = "Li�u",
    [3] = "hai phe",
}

tCampNameP = {
    [ALL_ID] = "noaligned",
    [SONG_ID] = "dasong",
    [LIAO_ID] = "daliao",
}

tItem = {
    { "Cu�c Chim", { 0, 200, 11, 1 }, { 5, 11, 10 } },
    { "Thi�t Ph�", { 0, 200, 14, 1 }, { 1, 21, 10 } },
    { "Ch� B� �ao", { 0, 200, 12, 1 }, { 2, 41, 10 } },
    { "Cu�c Thu�c", { 0, 200, 16, 1 }, { 4, 1, 10 } },
    { "��u H�n", { 2, 1, 1157, 1 } },
    { "Cu�c C�ng C�ng", { 0, 200, 23, 1 }, { 5, 11, 10 } },
    { "B�n C� ph�", { 0, 200, 26, 1 }, { 1, 21, 10 } },
    { "L�i Th�n �ao", { 0, 200, 24, 1 }, { 2, 41, 10 } },
    { "Cu�c Th�n N�ng", { 0, 200, 28, 1 }, { 4, 1, 10 } },
}

tBattleItem = {
    [1] = { "L��ng th�o-s� c�p", 2, 0, 588, 1 },
    [2] = { "L��ng th�o-trung c�p", 2, 0, 589, 1 },
    [3] = { "L��ng th�o-cao c�p", 2, 0, 590, 1 },
    [4] = { "Cu�c l��ng th�o", 2, 0, 591, 1 },
    [5] = { "H��ng d�n chi�n tr��ng", 2, 0, 595, 0 },
    [6] = { "Huy�n thi�t kho�ng th�ch", 2, 0, 594, 1 },
    [7] = { "S�n t�c-binh k�", 2, 0, 593, 1 },
    [8] = { "S�n t�c-chi�n c�", 2, 0, 592, 1 },
    [9] = { "Sinh Sinh H�a T�n", 1, 0, 205, 1 },
    [10] = { "Ng�c Cao t�n", 1, 0, 204, 1 },
    [11] = { "V�n V�t Quy Nguy�n ��n", 1, 0, 206, 1 }
}

tBattleMed = {
    { "Ch�nh Nguy�n H�i T�m ��n(c.tr��ng)", 1, 0, 207, 80, "ph�c h�i t�t c� nh�ng k� n�ng b� ��ng b�ng", 0 },
    { "Ng� Chuy�n Linh B�o ��n (c.tr��ng)", 1, 0, 208, 50, "Xu�t chi�u+5, duy tr� trong 10 gi�y", 0 },
    { "Th�n Gi�p ��n (chi�n tr��ng)", 1, 0, 209, 50, "Ngo�i ph�ng 100%, duy tr� trong 5 gi�y", 0 },
    { "Th�n Tr�o ��n (chi�n tr��ng)", 1, 0, 210, 50, "N�i ph�ng 100%, duy tr� 5 gi�y", 0 },
    { "Th�ng C�n T�n (chi�n tr��ng)", 1, 0, 211, 50, "Mi�n d�ch l�m ch�m, duy tr� trong 10 gi�y", 0 },
    { "Ho�t Huy�t T�n (chi�n tr��ng)", 1, 0, 212, 50, "Mi�n d�ch gi�m t�c, duy tr� trong 10 gi�y", 0 },
    { "S��ng L�c T�n (chi�n tr��ng)", 1, 0, 213, 50, "Mi�n d�ch t� li�t, duy tr� trong 10 gi�y", 0 },
    { "C� Th�ch T�n (chi�n tr��ng)", 1, 0, 215, 50, "Mi�n d�ch ��y lui, duy tr� trong 10 gi�y", 0 },
    { "Kim Cang T�n (chi�n tr��ng)", 1, 0, 216, 50, "Mi�n d�ch ��nh ng�, duy tr� trong 10 gi�y", 0 },
    { "�� Th�n T�n (chi�n tr��ng)", 1, 0, 217, 50, "Mi�n d�ch m� man, duy tr� trong 10 gi�y", 0 },
    { "Ng�ng H�n T�n (chi�n tr��ng)", 1, 0, 218, 50, "Mi�n d�ch h�n lo�n, duy tr� trong 10 gi�y", 0 },
    { "Th�n Phong T�n (chi�n tr��ng)", 1, 0, 219, 50, "Mi�n d�ch ��nh th�n, duy tr� trong 10 gi�y", 0 },
    { "V� �y T�n (chi�n tr��ng)", 1, 0, 220, 50, "Mi�n cho�ng, duy tr� trong 10 gi�y", 0 },
    -- { "Th�t X�o Linh ��n (chi�n tr��ng)", 1, 0, 223, 200, "Ti�u v� ��ch, duy tr� trong 3 gi�y", 0 },
    -- { "V� C�c Ti�n ��n (chi�n tr��ng)", 1, 0, 224, 500, "��i v� ��ch, duy tr� trong 6 gi�y", 0 },
    { "Sinh Sinh H�a T�n", 1, 0, 205, 10, "Nhanh ch�ng ph�c h�i sinh l�c v� n�i l�c", 0 },
    { "Ng�c Cao t�n", 1, 0, 204, 10, "Nhanh ch�ng ph�c h�i sinh l�c", 0 },
    { "V�n V�t Quy Nguy�n ��n", 1, 0, 206, 8, "Nhanh ch�ng ph�c h�i n�i l�c", 0 },
    { "Th�t Khi�u Nguy�n B�o ��n(ctr��ng)", 1, 0, 225, 500, "Xu�t chi�u+10, duy tr� trong 15 gi�y", 4 },
    -- { "Th�ng Thi�n V� C�c ��n (ctr��ng)", 1, 0, 227, 1000, "V� ��ch, duy tr� trong 9 gi�y", 4 },
}

tAwardRank = {
    [4] = { 100000000, 1600 },
    [1] = { 120000000, 3200 },
    [2] = { 130000000, 8000 },
    [3] = { 140000000, 16000 },
    [5] = { 150000000, 22400 },
    --	[6] = {50000000,1600},
}

tJungongItem = {
    --g�c
    --[1] = { "Qu�n C�ng Ch��ng", { 2, 1, 9999 }, 1.5, 2, 2 },
    --[2] = { "Huy Hi�u Chi�n C�ng (��i)", { 2, 1, 9998 }, 2, 5, 4 },
    --[3] = { "Huy Hi�u Chi�n C�ng Huy Ho�ng", { 2, 1, 9977 }, 2.5, 10, 6 },
    --[4] = { "Kh�ng", { 0, 0, 0 }, 1, 1, 1 },

    --LongDaiKa: s�a cho ��ng nh�t t�n
    [1] = { "Qu�n C�ng Ch��ng", { 2, 1, 9999 }, 1.5, 2, 2 },
    [2] = { "Qu�n C�ng ��i", { 2, 1, 9998 }, 2, 5, 4 },
    [3] = { "Qu�n C�ng Huy Ho�ng", { 2, 1, 9977 }, 2.5, 10, 6 },
    [4] = { "Kh�ng d�ng QCC", { 0, 0, 0 }, 1, 1, 1 },
    [5] = { "Qu�n C�ng Vinh D�", { 2, 1, 30642 }, 2.5, 10, 6 },
}

--�ᾭ���޸ĵ�������д����

szMaterialItem = "phoenix_flower"  --which MaterialItem group of tActivityItems to use
tFinalPrizeSelection = {--���ս�����ѡ��
    [1] = { "exp2g_shengwang10k_shimen10k", "finish_pet_task", "exp1g_500MMT", },
    [2] = { "exp2g_shengwang10k_shimen10k", "exp1g_zhenqi", "exp1g_500MMT", },
    [3] = { "ib_final1", },
}

--never modify below
-------------------------------------------------------------------------
_tActivityItems = { --all history used items define here, recycle used
    ["firecracker"] = { --201604���ձ���
        { "Ng�i Ph�o", { 2, 200, 1 } },
        { "�ng Ph�ng", { 2, 200, 2 } },
        { "Thu�c N�", { 2, 200, 3 } },
        { "Ph�o Hoa Huy Ho�ng", { 2, 200, 4 } },
        { "Ph�o Hoa R�c R�", { 2, 200, 5 } },
        { "Ph�o Hoa ��i L�", { 2, 200, 6 } },
    },
    ["soups"] = { --201605
        { "C�c lo�i ��u", { 2, 200, 7 } },
        { "���ng Ph�n", { 2, 200, 8 } },
        { "H�t Sen", { 2, 200, 9 } },
        { "Ch� ba m�u", { 2, 200, 10 } },
        { "Ch� Th�p C�m", { 2, 200, 11 } },
        { "Ch� Sen", { 2, 200, 12 } },
    },
    ["toys"] = { --201606
        { "Di�u Gi�y", { 2, 200, 13 } },
        { "Con Quay", { 2, 200, 14 } },
        { "Robot", { 2, 200, 15 } },
        { "H�p �� Ch�i Nh�", { 2, 200, 16 } },
        { "H�p �� Ch�i L�n", { 2, 200, 17 } },
        { "Th�ng �� Ch�i", { 2, 200, 18 } },
    },
    ["phoenix_flower"] = { --201607
        { "B�t M�c", { 2, 200, 19 } },
        { "T�p V�", { 2, 200, 20 } },
        { "Hoa Ph�ng Ho�ng", { 2, 200, 21 } },
        { "K� Y�u", { 2, 200, 22 } },
        { "L�u B�t", { 2, 200, 23 } },
        { "S� Tay K� Ni�m", { 2, 200, 24 } },
    },
    ["tanabata"] = {--201608
        { "N��c M�t Ch�c N�", { 2, 200, 25 } },
        { "��a Hoa Ng�u Lang", { 2, 200, 26 } },
        { "C�u � Th��c", { 2, 200, 27 } },
        { "H�p Qu� Ng�u Lang", { 2, 200, 28 } },
        { "H�p Qu� Ch�c N�", { 2, 200, 29 } },
        { "H�p Qu� Uy�n ��ng", { 2, 200, 30 } },
    },
    ["mooncake"] = {--201609
        { "B�t m�", { 2, 200, 31 } },
        { "Nh�n B�nh", { 2, 200, 32 } },
        { "Nh�n B�nh Th�p C�m", { 2, 200, 33 } },
        { "B�nh trung thu", { 2, 200, 34 } },
        { "B�nh ��c bi�t", { 2, 200, 35 } },
        { "B�nh th�p c�m", { 2, 200, 36 } },
    },
    ["scent"] = {--201610
        { "X� h��ng", { 2, 200, 37 } },
        { "T�i Th�m", { 2, 200, 38 } },
        { "T�i Th�m ��c Bi�t", { 2, 200, 39 } },
        { "N��c hoa th��ng ", { 2, 200, 40 } },
        { "N��c Hoa Kh�", { 2, 200, 41 } },
        { "N��c Hoa N�ng N�n", { 2, 200, 42 } },
    },
    ["teacher_gift"] = {--201611
        { "T�i Qu�", { 2, 200, 43 } },
        { "Gi�y B�c", { 2, 200, 44 } },
        { "Thi�p T�n S�", { 2, 200, 45 } },
        { "H�p Qu� B�c", { 2, 200, 46 } },
        { "H�p Qu� B�ch Kim", { 2, 200, 47 } },
        { "H�p Qu� T�n s�", { 2, 200, 48 } },
    },
    ["christmas_tree"] = {--201612
        { "C�y th�ng gi�o h�i", { 2, 200, 49 } },
        { "V�t Trang Tr�", { 2, 200, 50 } },
        { "Ng�i Sao Gi�ng Sinh", { 2, 200, 51 } },
        { "C�y Th�ng An L�nh", { 2, 200, 52 } },
        { "C�y Th�ng �m �p", { 2, 200, 53 } },
        { "C�y Th�ng Gi�ng Sinh", { 2, 200, 54 } },
    },
    ["zongzi"] = {--201701
        { "L� Dong", { 2, 200, 55 } },
        { "G�o n�p", { 2, 200, 56 } },
        { "��u Xanh Th�t Heo", { 2, 200, 57 } },
        { "B�nh T�t", { 2, 200, 58 } },
        { "B�nh Ch�ng", { 2, 200, 59 } },
        { "B�nh Ch�ng Th�p C�m", { 2, 200, 60 } },
    },
    ["spring_gift"] = {--201702
        { "Tr�i c�y", { 2, 200, 74 } },
        { "B�t Nghi�n Gi�y M�c", { 2, 200, 75 } },
        { "H�ng bao", { 2, 200, 76 } },
        { "M�m Ng� Qu�", { 2, 200, 77 } },
        { "C�u ��i ��", { 2, 200, 78 } },
        { "L� X� ��i C�t", { 2, 200, 79 } },
    },
    ["perfume"] = {--201703
        { "H� Ph�ch", { 2, 200, 80 } },
        { "T�i X� H��ng", { 2, 200, 81 } },
        { "Ph�ng Huy�t H��ng", { 2, 200, 82 } },
        { "N��c Hoa Kh�", { 2, 200, 83 } },
        { "N��c Hoa Tinh Ch�t", { 2, 200, 84 } },
        { "Qu�c S�c Thi�n H��ng", { 2, 200, 85 } },
    },
}
--tConfig�����Ļ��ͻ�����Ը�����õ���һЩ������д������
--�������ϵ���
tMainActivityMaterials = {
    _tActivityItems[szMaterialItem][1],
    _tActivityItems[szMaterialItem][2],
    _tActivityItems[szMaterialItem][3],
}
--�������ղ�Ʒ����
tMainActivityProducts = {
    _tActivityItems[szMaterialItem][4],
    _tActivityItems[szMaterialItem][5],
    _tActivityItems[szMaterialItem][6],
}

tConfig = {
    tMaterials = tMainActivityMaterials,
    tProducts = tMainActivityProducts,
    tFinalPrizeSel = tFinalPrizeSelection,
}
--TSK_EVENTCHINH_MORONG = 2733	--Bit 1,2,3,4 s� d�ng nh�n ph�n th��ng cu�i 
TSK_EVENTCHINH_MORONG = 2540    --Bit 1,2,3,4 s� d�ng nh�n ph�n th��ng cu�i
tCheckTask = {--task s� d�ng (KS), bit nh�n th��ng cu�i (KS), 2765 l� task nh�n th��ng cu�i (KS), task nh�n th��ng m� r�ng (VN)
    [1] = { 2762, 1, 2765, 2540, _tActivityItems[szMaterialItem][4][1], },
    [2] = { 2763, 2, 2765, 2540, _tActivityItems[szMaterialItem][5][1], },
    [3] = { 2764, 3, 2765, 2540, _tActivityItems[szMaterialItem][6][1], },
}
_tActivityItems = nil--�����û����
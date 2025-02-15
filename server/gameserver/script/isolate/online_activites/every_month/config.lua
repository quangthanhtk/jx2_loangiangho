--会经常修改的配置项写这里

szMaterialItem = "phoenix_flower"  --which MaterialItem group of tActivityItems to use
tFinalPrizeSelection = {--最终奖励的选择
    [1] = { "exp2g_shengwang10k_shimen10k", "finish_pet_task", "exp1g_500MMT", },
    [2] = { "exp2g_shengwang10k_shimen10k", "exp1g_zhenqi", "exp1g_500MMT", },
    [3] = { "ib_final1", },
}

--never modify below
-------------------------------------------------------------------------
_tActivityItems = { --all history used items define here, recycle used
    ["firecracker"] = { --201604节日爆竹
        { "Ng遡 Ph竜", { 2, 200, 1 } },
        { "鑞g Ph鉵g", { 2, 200, 2 } },
        { "Thu鑓 N�", { 2, 200, 3 } },
        { "Ph竜 Hoa Huy Ho祅g", { 2, 200, 4 } },
        { "Ph竜 Hoa R鵦 R�", { 2, 200, 5 } },
        { "Ph竜 Hoa Чi L�", { 2, 200, 6 } },
    },
    ["soups"] = { --201605
        { "C竎 lo筰 u", { 2, 200, 7 } },
        { "Л阯g Ph蘮", { 2, 200, 8 } },
        { "H箃 Sen", { 2, 200, 9 } },
        { "Ch� ba m祏", { 2, 200, 10 } },
        { "Ch� Th藀 C萴", { 2, 200, 11 } },
        { "Ch� Sen", { 2, 200, 12 } },
    },
    ["toys"] = { --201606
        { "Di襲 Gi蕐", { 2, 200, 13 } },
        { "Con Quay", { 2, 200, 14 } },
        { "Robot", { 2, 200, 15 } },
        { "H閜 у Ch琲 Nh�", { 2, 200, 16 } },
        { "H閜 у Ch琲 L韓", { 2, 200, 17 } },
        { "Th飊g у Ch琲", { 2, 200, 18 } },
    },
    ["phoenix_flower"] = { --201607
        { "B髏 M鵦", { 2, 200, 19 } },
        { "T藀 V�", { 2, 200, 20 } },
        { "Hoa Ph鬾g Ho祅g", { 2, 200, 21 } },
        { "K� Y誹", { 2, 200, 22 } },
        { "L璾 B髏", { 2, 200, 23 } },
        { "S� Tay K� Ni謒", { 2, 200, 24 } },
    },
    ["tanabata"] = {--201608
        { "Nc M総 Ch鴆 N�", { 2, 200, 25 } },
        { "сa Hoa Ng璾 Lang", { 2, 200, 26 } },
        { "C莡 � Thc", { 2, 200, 27 } },
        { "H閜 Qu� Ng璾 Lang", { 2, 200, 28 } },
        { "H閜 Qu� Ch鴆 N�", { 2, 200, 29 } },
        { "H閜 Qu� Uy猲 Μng", { 2, 200, 30 } },
    },
    ["mooncake"] = {--201609
        { "B閠 m�", { 2, 200, 31 } },
        { "Nh﹏ B竛h", { 2, 200, 32 } },
        { "Nh﹏ B竛h Th藀 C萴", { 2, 200, 33 } },
        { "B竛h trung thu", { 2, 200, 34 } },
        { "B竛h c bi謙", { 2, 200, 35 } },
        { "B竛h th藀 c萴", { 2, 200, 36 } },
    },
    ["scent"] = {--201610
        { "X� hng", { 2, 200, 37 } },
        { "T骾 Th琺", { 2, 200, 38 } },
        { "T骾 Th琺 c Bi謙", { 2, 200, 39 } },
        { "Nc hoa thng ", { 2, 200, 40 } },
        { "Nc Hoa Kh�", { 2, 200, 41 } },
        { "Nc Hoa N錸g N祅", { 2, 200, 42 } },
    },
    ["teacher_gift"] = {--201611
        { "T骾 Qu�", { 2, 200, 43 } },
        { "Gi蕐 B筩", { 2, 200, 44 } },
        { "Thi謕 T玭 S�", { 2, 200, 45 } },
        { "H閜 Qu� B筩", { 2, 200, 46 } },
        { "H閜 Qu� B筩h Kim", { 2, 200, 47 } },
        { "H閜 Qu� T玭 s�", { 2, 200, 48 } },
    },
    ["christmas_tree"] = {--201612
        { "C﹜ th玭g gi竜 h閕", { 2, 200, 49 } },
        { "V藅 Trang Tr�", { 2, 200, 50 } },
        { "Ng玦 Sao Gi竛g Sinh", { 2, 200, 51 } },
        { "C﹜ Th玭g An L祅h", { 2, 200, 52 } },
        { "C﹜ Th玭g 蕀 竝", { 2, 200, 53 } },
        { "C﹜ Th玭g Gi竛g Sinh", { 2, 200, 54 } },
    },
    ["zongzi"] = {--201701
        { "L� Dong", { 2, 200, 55 } },
        { "G筼 n誴", { 2, 200, 56 } },
        { "u Xanh Th辴 Heo", { 2, 200, 57 } },
        { "B竛h T衪", { 2, 200, 58 } },
        { "B竛h Ch璶g", { 2, 200, 59 } },
        { "B竛h Ch璶g Th藀 C萴", { 2, 200, 60 } },
    },
    ["spring_gift"] = {--201702
        { "Tr竔 c﹜", { 2, 200, 74 } },
        { "B髏 Nghi猲 Gi蕐 M鵦", { 2, 200, 75 } },
        { "H錸g bao", { 2, 200, 76 } },
        { "M﹎ Ng� Qu�", { 2, 200, 77 } },
        { "C﹗ цi п", { 2, 200, 78 } },
        { "L� X� Чi C竧", { 2, 200, 79 } },
    },
    ["perfume"] = {--201703
        { "H� Ph竎h", { 2, 200, 80 } },
        { "T骾 X� Hng", { 2, 200, 81 } },
        { "Ph鬾g Huy誸 Hng", { 2, 200, 82 } },
        { "Nc Hoa Kh�", { 2, 200, 83 } },
        { "Nc Hoa Tinh Ch蕋", { 2, 200, 84 } },
        { "Qu鑓 S綾 Thi猲 Hng", { 2, 200, 85 } },
    },
}
--tConfig会跟别的活动冲突，所以副活动会用到的一些配置项写在外面
--三个材料道具
tMainActivityMaterials = {
    _tActivityItems[szMaterialItem][1],
    _tActivityItems[szMaterialItem][2],
    _tActivityItems[szMaterialItem][3],
}
--三个最终产品道具
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
--TSK_EVENTCHINH_MORONG = 2733	--Bit 1,2,3,4 s� d鬾g nh薾 ph莕 thng cu鑙 
TSK_EVENTCHINH_MORONG = 2540    --Bit 1,2,3,4 s� d鬾g nh薾 ph莕 thng cu鑙
tCheckTask = {--task s� d鬾g (KS), bit nh薾 thng cu鑙 (KS), 2765 l� task nh薾 thng cu鑙 (KS), task nh薾 thng m� r閚g (VN)
    [1] = { 2762, 1, 2765, 2540, _tActivityItems[szMaterialItem][4][1], },
    [2] = { 2763, 2, 2765, 2540, _tActivityItems[szMaterialItem][5][1], },
    [3] = { 2764, 3, 2765, 2540, _tActivityItems[szMaterialItem][6][1], },
}
_tActivityItems = nil--这个表没用了
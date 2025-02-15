----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: Khai b�o c�c thi�t l�p li�n quan t�i equipshop
----------------------------------------------------------------------------------------------------
Include("\\script\\ksgvn\\constants.lua")
----------------------------------------------------------------------------------------------------

-- VNG SHOP
EQUIP_SHOP_YEUQUYET_CAOCAP = 3101;
EQUIP_SHOP_EXCHANGE_BANGHOI = 3068;
EQUIP_SHOP_CHANQUYEN_TINHHOA = 3072;

-- KSGVN SHOP
EQUIP_SHOP_EXCHANGE_NGANPHIEU = 3033

EQUIP_SHOP_AWARD_SPEND_MONEY = 1000
EQUIP_SHOP_EXCHANGE_TTLL = 1001
EQUIP_SHOP_EXCHANGE_KX5 = 1002
EQUIP_SHOP_EXCHANGE_KX6 = 1003
EQUIP_SHOP_EXCHANGE_KX7 = 1004
EQUIP_SHOP_EXCHANGE_HHVH = 1005
EQUIP_SHOP_EXCHANGE_SATTINH = 1006
EQUIP_SHOP_EXCHANGE_VANSUC_4 = 1007
EQUIP_SHOP_EXCHANGE_SATTINH_TRACVIET = 1008
EQUIP_SHOP_EXCHANGE_COPHO = 1009
EQUIP_SHOP_EXCHANGE_COPHO_TANQUYEN = 1010
EQUIP_SHOP_EXCHANGE_TIENDIEU = 1011
EQUIP_SHOP_EXCHANGE_HORSE = 1012
EQUIP_SHOP_EXCHANGE_COAT = 1013
EQUIP_SHOP_EXCHANGE_ORN = 1014
EQUIP_SHOP_EXCHANGE_HBVS = 1015
EQUIP_SHOP_EXCHANGE_TONG_HVT_PHONGCU = 1016
EQUIP_SHOP_EXCHANGE_TONG_HVT_TRANGSUC = 1017
EQUIP_SHOP_EXCHANGE_TONG_HVS_PHONGCU = 1018
EQUIP_SHOP_EXCHANGE_TONG_HVS_TRANGSUC = 1019
EQUIP_SHOP_EXCHANGE_LIEU_HVT_PHONGCU = 1020
EQUIP_SHOP_EXCHANGE_LIEU_HVT_TRANGSUC = 1021
EQUIP_SHOP_EXCHANGE_LIEU_HVS_PHONGCU = 1022
EQUIP_SHOP_EXCHANGE_LIEU_HVS_TRANGSUC = 1023

-- Jx2Vtd.Com
EQUIP_SHOP_EXCHANGE_CHIENCUONG = 501;
EQUIP_SHOP_EXCHANGE_HAOHIEP = 502;
EQUIP_SHOP_EXCHANGE_HAOHIEPVOHA = 503;
EQUIP_SHOP_EXCHANGE_AMHUYET = 504;
EQUIP_SHOP_EXCHANGE_SATTINH = 505;
EQUIP_SHOP_EXCHANGE_PHAHON = 506;
EQUIP_SHOP_EXCHANGE_TONG_TUT = 507;
EQUIP_SHOP_EXCHANGE_LIEU_TUT = 508;
EQUIP_SHOP_EXCHANGE_TONG_LHT = 509;
EQUIP_SHOP_EXCHANGE_LIEU_LHT = 510;
EQUIP_SHOP_EXCHANGE_TONG_HPT = 511;
EQUIP_SHOP_EXCHANGE_LIEU_HPT = 512;
EQUIP_SHOP_EXCHANGE_TONG_TLT = 513;
EQUIP_SHOP_EXCHANGE_LIEU_TLT = 514;
EQUIP_SHOP_EXCHANGE_TONG_UHT = 515;
EQUIP_SHOP_EXCHANGE_LIEU_UHT = 516;
EQUIP_SHOP_EXCHANGE_TONG_CTT = 517;
EQUIP_SHOP_EXCHANGE_LIEU_CTT = 518;
EQUIP_SHOP_EXCHANGE_KIMXA3 = 519;
EQUIP_SHOP_EXCHANGE_KIMXA4 = 520;
EQUIP_SHOP_EXCHANGE_KIMXA5 = 521;
EQUIP_SHOP_EXCHANGE_KIMXA6 = 522;
EQUIP_SHOP_EXCHANGE_KIMXA7 = 523;
EQUIP_SHOP_EXCHANGE_KIMXA8 = 524;
EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV2 = 525;
EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV3 = 526;
EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV4 = 527;
EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV5 = 528;
EQUIP_SHOP_EXCHANGE_TAYTAMTHACH = 529;
EQUIP_SHOP_EXCHANGE_LUYENLOTHIET = 530;
EQUIP_SHOP_EXCHANGE_THUONGHAIDICHAU = 531;
EQUIP_SHOP_EXCHANGE_DAQUY = 532;
EQUIP_SHOP_EXCHANGE_ROUTEBOOK_SUPER = 533;
EQUIP_SHOP_EXCHANGE_TICHLUY_CHIENTRUONG = 534;
EQUIP_SHOP_BUY_COMMON_BOOK = 535;
EQUIP_SHOP_EXCHANGE_TONG_UHS = 536;
EQUIP_SHOP_EXCHANGE_LIEU_UHS = 537;
EQUIP_SHOP_EXCHANGE_UANLINH8 = 538;
EQUIP_SHOP_EXCHANGE_VSCT = 539;
EQUIP_SHOP_EXCHANGE_LinhThach = 540;
EQUIP_SHOP_EXCHANGE_CHIENKHISATTHAN=541;
EQUIP_SHOP_EXCHANGE_TONG_CTSOAI = 542;
EQUIP_SHOP_EXCHANGE_LIEU_CTSOAI = 543;
EQUIP_SHOP_EXCHANGE_TONG_TLSOAI = 544;
EQUIP_SHOP_EXCHANGE_LIEU_TLSOAI = 545;
EQUIP_SHOP_EXCHANGE_UANLINH7 = 546;
EQUIP_SHOP_EXCHANGE_THUCUNG = 547;
EQUIP_SHOP_EXCHANGE_LANGSUONG = 548;
EQUIP_SHOP_EXCHANGE_KIMXA9 = 549;
EQUIP_SHOP_EXCHANGE_TONG_THANUNGSOAI = 550;
EQUIP_SHOP_EXCHANGE_TONG_THANUNGTUONG = 552;
EQUIP_SHOP_EXCHANGE_LIEU_THANUNGSOAI = 551;
EQUIP_SHOP_EXCHANGE_LIEU_THANUNGTUONG = 553;

g_tbEquipShop = {
    [EQUIP_SHOP_YEUQUYET_CAOCAP] = "��i Y�u Quy�t Th�t Truy�n",
    [EQUIP_SHOP_EXCHANGE_BANGHOI] = "Ti�m Bang H�i",
    [EQUIP_SHOP_CHANQUYEN_TINHHOA] = "Ti�m Ch�n V� Tinh Hoa",

    --[EQUIP_SHOP_EXCHANGE_NGANPHIEU] = "Ti�m Ng�n Phi�u",
    --[EQUIP_SHOP_AWARD_SPEND_MONEY] = "Th��ng ti�u ph�",
    --[EQUIP_SHOP_EXCHANGE_TTLL] = "Gh�p T�y T�m Luy�n L� Th�ch",
    --[EQUIP_SHOP_EXCHANGE_KX5] = "Ti�m r�n Kim X� c�p 5",
    --[EQUIP_SHOP_EXCHANGE_KX6] = "Ti�m r�n Kim X� c�p 6",
    --[EQUIP_SHOP_EXCHANGE_KX7] = "Ti�m r�n Kim X� c�p 7",
    --[EQUIP_SHOP_EXCHANGE_HHVH] = "Ti�m H�o Hi�p V� H�",
    --[EQUIP_SHOP_EXCHANGE_SATTINH] = "Ti�m S�t Tinh",
    --[EQUIP_SHOP_EXCHANGE_SATTINH_TRACVIET] = "R�n S�t Tinh Tr�c Vi�t",
    --[EQUIP_SHOP_EXCHANGE_VANSUC_4] = "Ti�m V�n S�c Ho�n M� c�p 4",
    [EQUIP_SHOP_EXCHANGE_COPHO] = "Ti�m C� ph�",
    [EQUIP_SHOP_EXCHANGE_COPHO_TANQUYEN] = "Ti�m C� ph� t�n quy�n",
    [EQUIP_SHOP_EXCHANGE_TIENDIEU] = "Ti�m Ti�n �i�u",
    [EQUIP_SHOP_EXCHANGE_HORSE] = "Ti�m t�a k� Truy�n Thuy�t",
    [EQUIP_SHOP_EXCHANGE_COAT] = "Ti�m ngo�i trang Ch� T�n",
    [EQUIP_SHOP_EXCHANGE_ORN] = "Linh Lung C�c",
    --[EQUIP_SHOP_EXCHANGE_HBVS] = "��i H�c B�ch V� Song",
    --[EQUIP_SHOP_EXCHANGE_TONG_HVT_PHONGCU] = "T�ng_Ti�m ph�ng c� H�n V� T��ng Qu�n",
    --[EQUIP_SHOP_EXCHANGE_TONG_HVT_TRANGSUC] = "T�ng_Ti�m trang s�c H�n V� T��ng Qu�n",
    --[EQUIP_SHOP_EXCHANGE_TONG_HVS_PHONGCU] = "T�ng_Ti�m ph�ng c� H�n V� Nguy�n So�i",
    --[EQUIP_SHOP_EXCHANGE_TONG_HVS_TRANGSUC] = "T�ng_Ti�m trang s�c H�n V� Nguy�n So�i",
    --[EQUIP_SHOP_EXCHANGE_LIEU_HVT_PHONGCU] = "Li�u_Ti�m ph�ng c� H�n V� T��ng Qu�n",
    --[EQUIP_SHOP_EXCHANGE_LIEU_HVT_TRANGSUC] = "Li�u_Ti�m trang s�c H�n V� T��ng Qu�n",
    --[EQUIP_SHOP_EXCHANGE_LIEU_HVS_PHONGCU] = "Li�u_Ti�m ph�ng c� H�n V� Nguy�n So�i",
    --[EQUIP_SHOP_EXCHANGE_LIEU_HVS_TRANGSUC] = "Li�u_Ti�m trang s�c H�n V� Nguy�n So�i",

    [EQUIP_SHOP_EXCHANGE_CHIENCUONG] = "Ti�m T�n V�t",
    [EQUIP_SHOP_EXCHANGE_HAOHIEP] = "Ti�m H�o Hi�p",
    [EQUIP_SHOP_EXCHANGE_HAOHIEPVOHA] = "Ti�m H�o Hi�p V� H�",
    [EQUIP_SHOP_EXCHANGE_AMHUYET] = "Ti�m �m Huy�t",
    [EQUIP_SHOP_EXCHANGE_SATTINH] = "Ti�m S�t Tinh",
    [EQUIP_SHOP_EXCHANGE_PHAHON] = "Ti�m Ph� H�n",
    [EQUIP_SHOP_EXCHANGE_TONG_TUT] = "T�ng_Ti�m Th��ng �ng T��ng",
    [EQUIP_SHOP_EXCHANGE_LIEU_TUT] = "Li�u_Ti�m Th��ng �ng T��ng",
    [EQUIP_SHOP_EXCHANGE_TONG_LHT] = "T�ng_Ti�m L�i H� T��ng",
    [EQUIP_SHOP_EXCHANGE_LIEU_LHT] = "Li�u_Ti�m L�i H� T��ng",
    [EQUIP_SHOP_EXCHANGE_TONG_HPT] = "T�ng_Ti�m H�a Ph�ng T��ng",
    [EQUIP_SHOP_EXCHANGE_LIEU_HPT] = "Li�u_Ti�m H�a Ph�ng T��ng",
    [EQUIP_SHOP_EXCHANGE_TONG_TLT] = "T�ng_Ti�m Thanh Long T��ng",
    [EQUIP_SHOP_EXCHANGE_LIEU_TLT] = "T�ng_Ti�m Thanh Long T��ng",
    [EQUIP_SHOP_EXCHANGE_TONG_UHT] = "T�ng_Ti�m Uy H� T��ng",
    [EQUIP_SHOP_EXCHANGE_LIEU_UHT] = "Li�u_Ti�m Uy H� T��ng",
    [EQUIP_SHOP_EXCHANGE_TONG_UHS] = "T�ng_Ti�m Uy H� So�i",
    [EQUIP_SHOP_EXCHANGE_LIEU_UHS] = "Li�u_Ti�m Uy H� So�i",
    [EQUIP_SHOP_EXCHANGE_TONG_CTT] = "T�ng_Ti�m Chu T��c T��ng",
    [EQUIP_SHOP_EXCHANGE_LIEU_CTT] = "Li�u_Ti�m Chu T��c T��ng",
    [EQUIP_SHOP_EXCHANGE_KIMXA3] = "Ti�m Kim x� c�p 3",
    [EQUIP_SHOP_EXCHANGE_KIMXA4] = "Ti�m Kim x� c�p 4",
    [EQUIP_SHOP_EXCHANGE_KIMXA5] = "Ti�m Kim x� c�p 5",
    [EQUIP_SHOP_EXCHANGE_KIMXA6] = "Ti�m Kim x� c�p 6",
    [EQUIP_SHOP_EXCHANGE_KIMXA7] = "Ti�m Kim x� c�p 7",
    [EQUIP_SHOP_EXCHANGE_KIMXA8] = "Ti�m Kim x� c�p 8",
    [EQUIP_SHOP_EXCHANGE_KIMXA9] = "Ti�m Kim x� c�p 9",
    [EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV2] = "Ti�m Kh�c B�n Ho�n M� C�p 2",
    [EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV3] = "Ti�m Kh�c B�n Ho�n M� C�p 3",
    [EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV4] = "Ti�m Kh�c B�n Ho�n M� C�p 4",
    [EQUIP_SHOP_EXCHANGE_KHACBAN_HOANMY_LV5] = "Ti�m Kh�c B�n Ho�n M� C�p 5",
    [EQUIP_SHOP_EXCHANGE_TAYTAMTHACH] = "Ti�m T�y T�m Th�ch",
    [EQUIP_SHOP_EXCHANGE_LUYENLOTHIET] = "Ti�m Luy�n L� Thi�t",
    [EQUIP_SHOP_EXCHANGE_THUONGHAIDICHAU] = "Ti�m Th��ng H�i Di Ch�u",
    [EQUIP_SHOP_EXCHANGE_DAQUY] = "Ti�m �� Qu�",
    [EQUIP_SHOP_EXCHANGE_ROUTEBOOK_SUPER] = "Ti�m M�t T�ch M�n Ph�i Si�u C�p",
    [EQUIP_SHOP_EXCHANGE_TICHLUY_CHIENTRUONG] = "Ti�m T�ch L�y Chi�n Tr��ng",
    [EQUIP_SHOP_BUY_COMMON_BOOK] = "Ti�m m�t t�ch s� c�p",
    [EQUIP_SHOP_EXCHANGE_UANLINH8] = "Ti�m U�n Linh Lv8",
    [EQUIP_SHOP_EXCHANGE_VSCT] = "Ti�m V� Song Chi�n Th�n",
    [EQUIP_SHOP_EXCHANGE_LinhThach] = "Ti�m Linh Th�ch",
    [EQUIP_SHOP_EXCHANGE_CHIENKHISATTHAN] = "Ti�m Chi�n Kh� S�t Th�n",
    [EQUIP_SHOP_EXCHANGE_TONG_CTSOAI] = "T�ng- Chu T��c So�i",
    [EQUIP_SHOP_EXCHANGE_LIEU_CTSOAI] = "Li�u - Chu T��c So�i",
    [EQUIP_SHOP_EXCHANGE_TONG_TLSOAI] = "T�ng- Thanh Long So�i",
    [EQUIP_SHOP_EXCHANGE_LIEU_TLSOAI] = "T�ng- Thanh Long So�i",
    [EQUIP_SHOP_EXCHANGE_UANLINH7] = "Ti�m U�n Linh Lv7",
    [EQUIP_SHOP_EXCHANGE_THUCUNG] = "Ti�m Th� C�ng",
    [EQUIP_SHOP_EXCHANGE_LANGSUONG] = "Ti�m L�ng S��ng",
    [EQUIP_SHOP_EXCHANGE_TONG_THANUNGSOAI] = "T�ng- Th�n �ng So�i  ",
    [EQUIP_SHOP_EXCHANGE_TONG_THANUNGTUONG] = "T�ng- Th�n �ng T��ng ",
    [EQUIP_SHOP_EXCHANGE_LIEU_THANUNGSOAI] = "Li�u- Th�n �ng So�i",
    [EQUIP_SHOP_EXCHANGE_LIEU_THANUNGTUONG] = "Li�u- Th�n �ng T��ng",
}

g_tbSaveAttrMap = {
    [14565001] = 2825,
    [14566001] = 2827,
    [14567001] = 2829,
    [14568001] = 2831,
    [14569001] = 2832,
    [14570001] = 2833,
    [14571001] = 2834,
    [14572001] = 2835,
    [14573001] = 2836,
    [14574001] = 2837,
    [14575001] = 2838,
    [14576001] = 2839,
    [14577001] = 2841,
    [14578001] = 2842,
    [14579001] = 2843,
    [14580001] = 2844,
    [14581001] = 2845,
    [14582001] = 2846,
    [14583001] = 2847,
    [14584001] = 2848,
    [14585001] = 2850,
    [14586001] = 2851,
    [14587001] = 2852,
    [14588001] = 2853,
    [14589001] = 2855,
    [14591001] = 2857,
    [14592001] = 2858,
    [14593001] = 2859,
    [14594001] = 2860,
    [14595001] = 2861,
    [14596001] = 2862,
    [14597001] = 2863,
    [14598001] = 2864,
    [14599001] = 2866,
    [14600001] = 2867,
    [14601001] = 2868,
    [14602001] = 2869,
    [14603001] = 2870,
    [14604001] = 2871,
    [14605001] = 2872,
    [14606001] = 2873,
    [496001] = 2875,
    [14607001] = 2876,
    [14608001] = 2877,
    [14609001] = 2878,
    [14610001] = 2879,
    [14635001] = 2880,
    [14611001] = 2881,
    [14612001] = 2882,
    [14614001] = 2884,
    [14615001] = 2886,
    [14616001] = 2887,
    [14617001] = 2889,
    [14618001] = 2891,
    [14619001] = 2892,
    [14613001] = 2894,
    [14620001] = 2896,
    [14621001] = 2897,
    [14622001] = 2898,
    [14623001] = 2899,
    [14624001] = 2900,
    [14625001] = 2901,
    [14626001] = 2903,
    [14627001] = 2904,
    [14628001] = 2905,
    [14629001] = 2907,
    [14630001] = 2908,
    [14631001] = 2909,
    [14632001] = 2910,
    [14633001] = 2911,
    [14634001] = 2912,
    [13342004] = 2486,
    [13356002] = 2487,
    [13344003] = 2488,
    [13343003] = 2489,
    [14219002] = 2491,
    [14220002] = 2492,
    [14221001] = 2493,
    [14222002] = 2494,
    [13345008] = 2496,
    [13346008] = 2497,
    [13347008] = 2498,
    [13348008] = 2499,
    [13349008] = 2500,
    [14968001]=	3215,
    [14969001]=	3216,
    [14970001]=	3217,
    [14971001]=	3218,
    [14972001]=	3219,
    [14973001]=	3220,
    [14974001]=	3221,
    [14975001]=	3222,
    [14976001]=	3223,
    [14977001]=	3225,
    [14978001]=	3226,
    [14979001]=	3227,
    [14980001]=	3228,
    [14981001]=	3229,
    [14982001]=	3231,
    [14983001]=	3232,
    [14984001]=	3233,
    [14985001]=	3234,
    [14986001]=	3236,
    [14988001]=	3238,
    [14989001]=	3239,
    [14990001]=	3240,
    [14991001]=	3241,
    [14992001]=	3242,
    [14993001]=	3243,
    [14994001]=	3244,
    [14995001]=	3245,
    [14996001]=	3247,
    [14997001]=	3248,
    [14998001]=	3249,
    [14999001]=	3250,
    [15000001]=	3251,
    [15001001]=	3254,
    [15002001]=	3255,
    [15003001]=	3256,
    [15004001]=	3257,
    [15005001]=	3258,
    [15006001]=	3259,
    [15007001]=	3260,
    [15009001]=	3262,
    [15010001]=	3264,
    [15011001]=	3265,
    [15012001]=	3267,
    [15013001]=	3269,
    [15014001]=	3270,
    [15008001]=	3272,
    [15015001]=	3274,
    [15016001]=	3275,
    [15017001]=	3276,
    [15018001]=	3277,
    [15019001]=	3278,
    [15020001]=	3279,
    [15021001]=	3281,
    [15022001]=	3282,
    [15023001]=	3283,
    [15024001]=	3284,
    [15025001]=	3286,
    [15026001]=	3287,
    [15027001]=	3288,
    [15028001]=	3290,
    [15029001]=	3291,
    [15030001]=	3292,
    [15031001]=	3294,
    [15029001]=	3295,
    [15030001]=	3296,
    [15032001]=	3298,
    [15029001]=	3299,
    [15030001]=	3300,
    [15036001]=	3302,
    [15037001]=	3303,
    [15038001]=	3304,
    [15039001]=	3305,
    [15035001]=	3306,
    [10000001]=	10000
}
g_tbSavefixnewbie = {
    [15491001]=3623,
    [15492001]=3625,
    [15493001]=3627,
    [15494001]=3629,
    [15495001]=3630,
    [15496001]=3631,
    [15497001]=3632,
    [15498001]=3633,
    [15499001]=3634,
    [15500001]=3635,
    [15501001]=3636,
    [15502001]=3637,
    [15503001]=3639,
    [15504001]=3640,
    [15505001]=3641,
    [15506001]=3642,
    [15507001]=3643,
    [15508001]=3645,
    [15509001]=3646,
    [15510001]=3647,
    [15511001]=3648,
    [15512001]=3650,
    [15514001]=3652,
    [15515001]=3653,
    [15516001]=3654,
    [15517001]=3655,
    [15518001]=3656,
    [15519001]=3657,
    [15520001]=3659,
    [15521001]=3660,
    [15522001]=3661,
    [15523001]=3662,
    [15524001]=3663,
    [496001]=3665,
    [15525001]=3666,
    [15526001]=3667,
    [15527001]=3668,
    [15528001]=3669,
    [15529001]=3670,
    [15530001]=3671,
    [15531001]=3672,
    [15533001]=3674,
    [15534001]=3676,
    [15535001]=3677,
    [15536001]=3679,
    [15537001]=3681,
    [15538001]=3682,
    [15532001]=3684,
    [15539001]=3686,
    [15540001]=3687,
    [15541001]=3688,
    [15542001]=3689,
    [15543001]=3690,
    [15544001]=3691,
    [15545001]=3693,
    [15546001]=3694,
    [15547001]=3695,
    [15548001]=3696,
    [15549001]=3698,
    [15550001]=3699,
    [15551001]=3700,
    [10000001]=	10001,
    [10001001]=	10001
}

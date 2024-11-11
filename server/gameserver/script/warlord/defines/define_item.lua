----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-09-07
--- Description: c¸c thiÕt lËp liªn quan tíi item
----------------------------------------------------------------------------------------------------
Include("\\settings\\static_script\\lib\\item_define.lua");
----------------------------------------------------------------------------------------------------
--- khai b¸o qu©n c«ng ch­¬ng

QCC_NONE = 0;
QCC_NORNAL = 1;
QCC_DAI = 2;
QCC_HUYHOANG = 3;
QCC_VINHDU = 4;
QCC_NAMES = {
    [QCC_NONE] = "Kh«ng dïng QCC",
    [QCC_NORNAL] = "Qu©n C«ng Ch­¬ng",
    [QCC_DAI] = "Qu©n C«ng §¹i",
    [QCC_HUYHOANG] = "Qu©n C«ng Huy Hoµng",
    [QCC_VINHDU] = "Qu©n C«ng Vinh Dù",
};

--- khai b¸o tØ lÖ nhËn th­ëng b»ng qu©n c«ng ch­¬ng
g_tbQCCBonusRateCfg = {
    [QCC_NONE] = { nHonorRate = 1, nExpRate = 1, nBattlePointRate = 1 },
    [QCC_NORNAL] = { nHonorRate = 2, nExpRate = 2, nBattlePointRate = 2 },
    [QCC_DAI] = { nHonorRate = 5, nExpRate = 3, nBattlePointRate = 3 },
    [QCC_HUYHOANG] = { nHonorRate = 10, nExpRate = 4, nBattlePointRate = 4 },
    [QCC_VINHDU] = { nHonorRate = 14, nExpRate = 5, nBattlePointRate = 5 },
};

----------------------------------------------------------------------------------------------------
--- khai b¸o c¸c vËt phÈm cã thÓ add c­êng hãa trong n©ng cÊp equipshop
--- chØ cÇn cã define vµ value ~= nil lµ cã thÓ l­u c­êng hãa

g_tbSpecialItemCanEnhance = {
    -- [PackItemId(nG, nD, nP)] = 1,
    [PackItemId(2, 1, 40001)] = 1, -- S¸t Tinh LÖnh Bµi (§Çu)
    [PackItemId(2, 1, 40002)] = 1, -- S¸t Tinh LÖnh Bµi (¸o)
    [PackItemId(2, 1, 40003)] = 1, -- S¸t Tinh LÖnh Bµi (QuÇn)
    [PackItemId(2, 1, 40004)] = 1, -- S¸t Tinh LÖnh Bµi (Vò KhÝ)

    [PackItemId(2, 1, 40006)] = 1, -- Ph¸ Hån LÖnh (§Çu)
    [PackItemId(2, 1, 40007)] = 1, -- Ph¸ Hån LÖnh (¸o)
    [PackItemId(2, 1, 40008)] = 1, -- Ph¸ Hån LÖnh (QuÇn)
    [PackItemId(2, 1, 40009)] = 1, -- Ph¸ Hån LÖnh (Vò KhÝ)

    [PackItemId(2, 1, 40011)] = 1, -- V« H¹ Hµo HiÖp LÖnh (Nãn)
    [PackItemId(2, 1, 40012)] = 1, -- V« H¹ Hµo HiÖp LÖnh (¸o)
    [PackItemId(2, 1, 40013)] = 1, -- V« H¹ Hµo HiÖp LÖnh (QuÇn)
    [PackItemId(2, 1, 40014)] = 1, -- V« H¹ Hµo HiÖp LÖnh (Vò KhÝ)
};

g_tbItemDHaveEnhance = {
    ITEM_D_EQUIP_HEAD,
    ITEM_D_EQUIP_CLOTH,
    ITEM_D_EQUIP_FOOT,

    ITEM_D_WEAPON_BAOTAY,
    ITEM_D_WEAPON_AMKHI,
    ITEM_D_WEAPON_KIEM,
    ITEM_D_WEAPON_DAO,
    ITEM_D_WEAPON_CUNG,
    ITEM_D_WEAPON_CON,
    ITEM_D_WEAPON_THUONG,
    ITEM_D_WEAPON_SONGDAO,
    ITEM_D_WEAPON_TRUONG,
    ITEM_D_WEAPON_BUT,
    ITEM_D_WEAPON_DAN,
    ITEM_D_WEAPON_TRAO,
    ITEM_D_WEAPON_SAO,
    ITEM_D_WEAPON_QUAT,
    ITEM_D_WEAPON_SONGCHUY,

    ITEM_D_EQUIP_ARMORY_HEAD,
    ITEM_D_EQUIP_ARMORY_CLOTH,
    ITEM_D_EQUIP_ARMORY_FOOT,
    ITEM_D_EQUIP_ARMORY_ADORN,
    ITEM_D_EQUIP_ARMORY_BADGE,

    ITEM_D_EQUIP_CAPE,
    ITEM_D_EQUIP_CLOAK,
    ITEM_D_EQUIP_BADGE,
};

----------------------------------------------------------------------------------------------------
--- khai b¸o c¸c bé trang bÞ

g_tbEquipSet_SuMon3 = {
    [ROUTE_THIEULAM_DAO] = { nEquipStartId = 221, nWeaponStartId = 221, nRing1StartId = 221, nRing2StartId = 223 },
    [ROUTE_THIEULAM_TRUONG] = { nEquipStartId = 321, nWeaponStartId = 321, nRing1StartId = 321, nRing2StartId = 323 },
    [ROUTE_THIEULAM_QUYEN] = { nEquipStartId = 421, nWeaponStartId = 421, nRing1StartId = 421, nRing2StartId = 423 },
    [ROUTE_DUONGMON_AMKHI] = { nEquipStartId = 621, nWeaponStartId = 621, nRing1StartId = 621, nRing2StartId = 625 },
    [ROUTE_NGAMI_KIEM] = { nEquipStartId = 821, nWeaponStartId = 821, nRing1StartId = 821, nRing2StartId = 823 },
    [ROUTE_NGAMI_DAN] = { nEquipStartId = 921, nWeaponStartId = 921, nRing1StartId = 921, nRing2StartId = 923 },
    [ROUTE_CAIBANG_QUYEN] = { nEquipStartId = 1121, nWeaponStartId = 1121, nRing1StartId = 1121, nRing2StartId = 1125 },
    [ROUTE_CAIBANG_BONG] = { nEquipStartId = 1221, nWeaponStartId = 1221, nRing1StartId = 1221, nRing2StartId = 1225 },
    [ROUTE_VODANG_KIEM] = { nEquipStartId = 1421, nWeaponStartId = 1421, nRing1StartId = 1421, nRing2StartId = 1425 },
    [ROUTE_VODANG_BUT] = { nEquipStartId = 1521, nWeaponStartId = 1521, nRing1StartId = 1521, nRing2StartId = 1525 },
    [ROUTE_DUONGGIA_THUONG] = { nEquipStartId = 1721, nWeaponStartId = 1721, nRing1StartId = 1721, nRing2StartId = 1725 },
    [ROUTE_DUONGGIA_CUNG] = { nEquipStartId = 1821, nWeaponStartId = 1821, nRing1StartId = 1821, nRing2StartId = 1825 },
    [ROUTE_NGUDOC_HIEP] = { nEquipStartId = 2021, nWeaponStartId = 2021, nRing1StartId = 1921, nRing2StartId = 1925 },
    [ROUTE_NGUDOC_TA] = { nEquipStartId = 2121, nWeaponStartId = 2121, nRing1StartId = 2121, nRing2StartId = 2125 },
    [ROUTE_CONLON_THIENSU] = { nEquipStartId = 23121, nWeaponStartId = 23121, nRing1StartId = 23121, nRing2StartId = 23125 },
    [ROUTE_MINHGIAO_THANHCHIEN] = { nEquipStartId = 25121, nWeaponStartId = 25121, nRing1StartId = 25121, nRing2StartId = 25125 },
    [ROUTE_MINHGIAO_TRANBINH] = { nEquipStartId = 26121, nWeaponStartId = 26121, nRing1StartId = 26121, nRing2StartId = 26125 },
    [ROUTE_MINHGIAO_HUYETNHAN] = { nEquipStartId = 27121, nWeaponStartId = 27121, nRing1StartId = 27121, nRing2StartId = 27125 },
    [ROUTE_THUYYEN_VUTIEN] = { nEquipStartId = 29121, nWeaponStartId = 29121, nRing1StartId = 29121, nRing2StartId = 29125 },
    [ROUTE_THUYYEN_LINHNU] = { nEquipStartId = 30121, nWeaponStartId = 30121, nRing1StartId = 30121, nRing2StartId = 30125 },
    [ROUTE_DUONGMON_NHAMHIEP] = { nEquipStartId = 31109, nWeaponStartId = 31109, nRing1StartId = 31420, nRing2StartId = 31424 },
    [ROUTE_CONLON_KIEMTON] = { nEquipStartId = 32105, nWeaponStartId = 32105, nRing1StartId = 31446, nRing2StartId = 31448 },
};

g_tbEquipSet_SuMon4 = {
    [ROUTE_THIEULAM_DAO] = { nEquipStartId = 231, nWeaponStartId = 231, nRing1StartId = 231, nRing2StartId = 235 },
    [ROUTE_THIEULAM_TRUONG] = { nEquipStartId = 331, nWeaponStartId = 331, nRing1StartId = 331, nRing2StartId = 335 },
    [ROUTE_THIEULAM_QUYEN] = { nEquipStartId = 431, nWeaponStartId = 431, nRing1StartId = 431, nRing2StartId = 435 },
    [ROUTE_DUONGMON_AMKHI] = { nEquipStartId = 631, nWeaponStartId = 631, nRing1StartId = 631, nRing2StartId = 635 },
    [ROUTE_NGAMI_KIEM] = { nEquipStartId = 831, nWeaponStartId = 831, nRing1StartId = 831, nRing2StartId = 835 },
    [ROUTE_NGAMI_DAN] = { nEquipStartId = 931, nWeaponStartId = 931, nRing1StartId = 931, nRing2StartId = 935 },
    [ROUTE_CAIBANG_QUYEN] = { nEquipStartId = 1131, nWeaponStartId = 1131, nRing1StartId = 1131, nRing2StartId = 1135 },
    [ROUTE_CAIBANG_BONG] = { nEquipStartId = 1231, nWeaponStartId = 1231, nRing1StartId = 1231, nRing2StartId = 1235 },
    [ROUTE_VODANG_KIEM] = { nEquipStartId = 1431, nWeaponStartId = 1431, nRing1StartId = 1431, nRing2StartId = 1435 },
    [ROUTE_VODANG_BUT] = { nEquipStartId = 1531, nWeaponStartId = 1531, nRing1StartId = 1531, nRing2StartId = 1535 },
    [ROUTE_DUONGGIA_THUONG] = { nEquipStartId = 1731, nWeaponStartId = 1731, nRing1StartId = 1731, nRing2StartId = 1735 },
    [ROUTE_DUONGGIA_CUNG] = { nEquipStartId = 1831, nWeaponStartId = 1831, nRing1StartId = 1831, nRing2StartId = 1835 },
    [ROUTE_NGUDOC_HIEP] = { nEquipStartId = 2031, nWeaponStartId = 2031, nRing1StartId = 1931, nRing2StartId = 1935 },
    [ROUTE_NGUDOC_TA] = { nEquipStartId = 2131, nWeaponStartId = 2131, nRing1StartId = 2131, nRing2StartId = 2135 },
    [ROUTE_CONLON_THIENSU] = { nEquipStartId = 23131, nWeaponStartId = 23131, nRing1StartId = 23131, nRing2StartId = 23135 },
    [ROUTE_MINHGIAO_THANHCHIEN] = { nEquipStartId = 25131, nWeaponStartId = 25131, nRing1StartId = 25131, nRing2StartId = 25135 },
    [ROUTE_MINHGIAO_TRANBINH] = { nEquipStartId = 26131, nWeaponStartId = 26131, nRing1StartId = 26131, nRing2StartId = 26135 },
    [ROUTE_MINHGIAO_HUYETNHAN] = { nEquipStartId = 27131, nWeaponStartId = 27131, nRing1StartId = 27131, nRing2StartId = 27135 },
    [ROUTE_THUYYEN_VUTIEN] = { nEquipStartId = 29131, nWeaponStartId = 29131, nRing1StartId = 29131, nRing2StartId = 29135 },
    [ROUTE_THUYYEN_LINHNU] = { nEquipStartId = 30131, nWeaponStartId = 30131, nRing1StartId = 30131, nRing2StartId = 30135 },
    [ROUTE_DUONGMON_NHAMHIEP] = { nEquipStartId = 31113, nWeaponStartId = 31113, nRing1StartId = 31428, nRing2StartId = 31432 },
    [ROUTE_CONLON_KIEMTON] = { nEquipStartId = 32105, nWeaponStartId = 32105, nRing1StartId = 31450, nRing2StartId = 31452 },
};

g_tbEquipSet_SuMon5 = {
    [ROUTE_THIEULAM_DAO] = { nEquipStartId = 241, nWeaponStartId = 241, nRing1StartId = 241, nRing2StartId = 245 },
    [ROUTE_THIEULAM_TRUONG] = { nEquipStartId = 341, nWeaponStartId = 341, nRing1StartId = 341, nRing2StartId = 345 },
    [ROUTE_THIEULAM_QUYEN] = { nEquipStartId = 441, nWeaponStartId = 441, nRing1StartId = 441, nRing2StartId = 445 },
    [ROUTE_DUONGMON_AMKHI] = { nEquipStartId = 641, nWeaponStartId = 641, nRing1StartId = 641, nRing2StartId = 645 },
    [ROUTE_NGAMI_KIEM] = { nEquipStartId = 841, nWeaponStartId = 841, nRing1StartId = 841, nRing2StartId = 845 },
    [ROUTE_NGAMI_DAN] = { nEquipStartId = 941, nWeaponStartId = 941, nRing1StartId = 941, nRing2StartId = 945 },
    [ROUTE_CAIBANG_QUYEN] = { nEquipStartId = 1141, nWeaponStartId = 1141, nRing1StartId = 1141, nRing2StartId = 1145 },
    [ROUTE_CAIBANG_BONG] = { nEquipStartId = 1241, nWeaponStartId = 1241, nRing1StartId = 1241, nRing2StartId = 1245 },
    [ROUTE_VODANG_KIEM] = { nEquipStartId = 1441, nWeaponStartId = 1441, nRing1StartId = 1441, nRing2StartId = 1445 },
    [ROUTE_VODANG_BUT] = { nEquipStartId = 1541, nWeaponStartId = 1541, nRing1StartId = 1541, nRing2StartId = 1545 },
    [ROUTE_DUONGGIA_THUONG] = { nEquipStartId = 1741, nWeaponStartId = 1741, nRing1StartId = 1741, nRing2StartId = 1745 },
    [ROUTE_DUONGGIA_CUNG] = { nEquipStartId = 1841, nWeaponStartId = 1841, nRing1StartId = 1841, nRing2StartId = 1845 },
    [ROUTE_NGUDOC_HIEP] = { nEquipStartId = 2041, nWeaponStartId = 2041, nRing1StartId = 2041, nRing2StartId = 2045 },
    [ROUTE_NGUDOC_TA] = { nEquipStartId = 2141, nWeaponStartId = 2141, nRing1StartId = 2141, nRing2StartId = 2145 },
    [ROUTE_CONLON_THIENSU] = { nEquipStartId = 23141, nWeaponStartId = 23141, nRing1StartId = 23141, nRing2StartId = 23145 },
    [ROUTE_MINHGIAO_THANHCHIEN] = { nEquipStartId = 25141, nWeaponStartId = 25141, nRing1StartId = 25141, nRing2StartId = 25145 },
    [ROUTE_MINHGIAO_TRANBINH] = { nEquipStartId = 26141, nWeaponStartId = 26141, nRing1StartId = 26141, nRing2StartId = 26145 },
    [ROUTE_MINHGIAO_HUYETNHAN] = { nEquipStartId = 27141, nWeaponStartId = 27141, nRing1StartId = 27141, nRing2StartId = 27145 },
    [ROUTE_THUYYEN_VUTIEN] = { nEquipStartId = 29141, nWeaponStartId = 29141, nRing1StartId = 29141, nRing2StartId = 29145 },
    [ROUTE_THUYYEN_LINHNU] = { nEquipStartId = 30141, nWeaponStartId = 30141, nRing1StartId = 30141, nRing2StartId = 30145 },
    [ROUTE_DUONGMON_NHAMHIEP] = { nEquipStartId = 31117, nWeaponStartId = 31117, nRing1StartId = 31436, nRing2StartId = 31440 },
    [ROUTE_CONLON_KIEMTON] = { nEquipStartId = 32109, nWeaponStartId = 32109, nRing1StartId = 31454, nRing2StartId = 31456 },
};

g_tbEquipSet_Buff35 = {
    [BODY_NAM_TIEUCHUAN] = {
        { tbProp = { 0, 103, 1 }, nStack = 1, nStatus = 4, tbParam = { 7, 41, 7, 42 } }, -- ThiÕu HiÖp C©n
        { tbProp = { 0, 100, 1 }, nStack = 1, nStatus = 4, tbParam = { 7, 41, 7, 42 } }, -- HiÖp ThiÕu bè y
        { tbProp = { 0, 101, 1 }, nStack = 1, nStatus = 4, tbParam = { 7, 41, 7, 42 } }, -- HiÖp ThiÕu Bè Trang
    },
    [BODY_NAM_KHOINGO] = {
        { tbProp = { 0, 103, 19 }, nStack = 1, nStatus = 4, tbParam = { 7, 41, 7, 42 } }, -- HiÖp ThiÕu bè c©n
        { tbProp = { 0, 100, 19 }, nStack = 1, nStatus = 4, tbParam = { 7, 41, 7, 42 } }, -- HiÖp ThiÕu y
        { tbProp = { 0, 101, 19 }, nStack = 1, nStatus = 4, tbParam = { 7, 41, 7, 42 } }, -- HiÖp ThiÕu trang
    },
    [BODY_NU_GOICAM] = {
        { tbProp = { 0, 103, 37 }, nStack = 1, nStatus = 4, tbParam = { 7, 41, 7, 42 } }, -- §µo Méc Tr©m
        { tbProp = { 0, 100, 37 }, nStack = 1, nStatus = 4, tbParam = { 7, 41, 7, 42 } }, -- Th¸i Th­êng
        { tbProp = { 0, 101, 37 }, nStack = 1, nStatus = 4, tbParam = { 7, 41, 7, 42 } }, -- Th¸i Tó Trang
    },
    [BODY_NU_KIEUNU] = {
        { tbProp = { 0, 103, 55 }, nStack = 1, nStatus = 4, tbParam = { 7, 41, 7, 42 } }, -- §µo Méc thoa
        { tbProp = { 0, 100, 55 }, nStack = 1, nStatus = 4, tbParam = { 7, 41, 7, 42 } }, -- Vò Th­êng
        { tbProp = { 0, 101, 55 }, nStack = 1, nStatus = 4, tbParam = { 7, 41, 7, 42 } }, -- ThiÓn Th¶o Tó Trang
    },
};

g_tbCommonWeaponP = {
    [1] = {
        [ITEM_D_WEAPON_BAOTAY] = 1, -- hé thñ
        [ITEM_D_WEAPON_AMKHI] = 40, -- ¸m khÝ
        [ITEM_D_WEAPON_KIEM] = 14, -- kiÕm
        [ITEM_D_WEAPON_DAO] = 53, -- ®ao
        [ITEM_D_WEAPON_CUNG] = 108, -- cung
        [ITEM_D_WEAPON_CON] = 27, -- c«n
        [ITEM_D_WEAPON_THUONG] = 97, -- th­¬ng
        [ITEM_D_WEAPON_SONGDAO] = 1, -- song ®ao
        [ITEM_D_WEAPON_TRUONG] = 86, -- tr­îng
        [ITEM_D_WEAPON_BUT] = 75, -- bót
        [ITEM_D_WEAPON_DAN] = 64, -- ®µn
        [ITEM_D_WEAPON_TRAO] = 1, -- tr¶o
        [ITEM_D_WEAPON_SAO] = 1, -- tiªu
        [ITEM_D_WEAPON_QUAT] = 1, -- qu¹t
        [ITEM_D_WEAPON_SONGCHUY] = 1, -- dao g¨m
    },
};

g_tbEquipSet_AmHuyet = {
    [ROUTE_THIEULAM_DAO] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_THIEULAM_TRUONG] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_THIEULAM_QUYEN] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_DUONGMON_AMKHI] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_NGAMI_KIEM] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_NGAMI_DAN] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_CAIBANG_QUYEN] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_CAIBANG_BONG] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_VODANG_KIEM] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_VODANG_BUT] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_DUONGGIA_THUONG] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_DUONGGIA_CUNG] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_NGUDOC_HIEP] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_NGUDOC_TA] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_CONLON_THIENSU] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_MINHGIAO_THANHCHIEN] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_MINHGIAO_TRANBINH] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_MINHGIAO_HUYETNHAN] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_THUYYEN_VUTIEN] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_THUYYEN_LINHNU] = { nEquipStartId = 30610, nWeaponStartId = 30884, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_DUONGMON_NHAMHIEP] = { nEquipStartId = 30610, nWeaponStartId = 32164, nRing1StartId = 31272, nRing2StartId = 31414 },
    [ROUTE_CONLON_KIEMTON] = { nEquipStartId = 30610, nWeaponStartId = 32192, nRing1StartId = 31272, nRing2StartId = 31414 },
};

g_tbCixiuSet = {
    [1] = {
        [ITEM_D_EQUIP_WENSHI_H] = { nStartId = 1, nEndId = 17 },
        [ITEM_D_EQUIP_WENSHI_C] = { nStartId = 1, nEndId = 17 },
        [ITEM_D_EQUIP_WENSHI_T] = { nStartId = 1, nEndId = 17 },
    },
    [2] = {
        [ITEM_D_EQUIP_WENSHI_H] = { nStartId = 18, nEndId = 34 },
        [ITEM_D_EQUIP_WENSHI_C] = { nStartId = 18, nEndId = 34 },
        [ITEM_D_EQUIP_WENSHI_T] = { nStartId = 18, nEndId = 34 },
    },
    [3] = {
        [ITEM_D_EQUIP_WENSHI_H] = { nStartId = 35, nEndId = 51 },
        [ITEM_D_EQUIP_WENSHI_C] = { nStartId = 35, nEndId = 51 },
        [ITEM_D_EQUIP_WENSHI_T] = { nStartId = 35, nEndId = 51 },
    },
    [4] = {
        [ITEM_D_EQUIP_WENSHI_H] = { nStartId = 53, nEndId = 68 },
        [ITEM_D_EQUIP_WENSHI_C] = { nStartId = 53, nEndId = 69 },
        [ITEM_D_EQUIP_WENSHI_T] = { nStartId = 53, nEndId = 68 },
    },
    [5] = {
        [ITEM_D_EQUIP_WENSHI_H] = { nStartId = 69, nEndId = 84 },
        [ITEM_D_EQUIP_WENSHI_C] = { nStartId = 70, nEndId = 86 },
        [ITEM_D_EQUIP_WENSHI_T] = { nStartId = 69, nEndId = 84 },
    },
    [6] = {
        [ITEM_D_EQUIP_WENSHI_H] = { nStartId = 85, nEndId = 100 },
        [ITEM_D_EQUIP_WENSHI_C] = { nStartId = 87, nEndId = 103 },
        [ITEM_D_EQUIP_WENSHI_T] = { nStartId = 85, nEndId = 100 },
    },
    [7] = {
        [ITEM_D_EQUIP_WENSHI_H] = { nStartId = 101, nEndId = 116 },
        [ITEM_D_EQUIP_WENSHI_C] = { nStartId = 104, nEndId = 120 },
        [ITEM_D_EQUIP_WENSHI_T] = { nStartId = 101, nEndId = 116 },
    },
    [8] = {
        [ITEM_D_EQUIP_WENSHI_H] = { nStartId = 141, nEndId = 154 },
        [ITEM_D_EQUIP_WENSHI_C] = { nStartId = 145, nEndId = 161 },
        [ITEM_D_EQUIP_WENSHI_T] = { nStartId = 141, nEndId = 156 },
    },
}

g_tbGemType = {
    [1] = "HuyÕt TrÝch Th¹ch",
    [2] = "NguyÖt B¹ch Th¹ch",
    [3] = "Hæ Ph¸ch Th¹ch",
    [4] = "H¾c DiÖu Th¹ch",
}

----------------------------------------------------------------------------------------------------
--- khai b¸o mËt tÞch

g_tbCommonBook = {
    { tbProp = { 0, 112, 78 } }, -- L¨ng Ba Vi Bé
    { tbProp = { 0, 107, 55 } }, -- KhÝ LiÖu ThuËt
    { tbProp = { 0, 107, 59 } }, -- Kim ThiÒn Phæ
    { tbProp = { 0, 107, 60 } }, -- Tu La MËt TÞch
    { tbProp = { 0, 107, 63 } }, -- Ngò Quû MËt TÞch
    { tbProp = { 0, 107, 64 } }, -- Thiªn Hµ MËt TÞch
    { tbProp = { 0, 107, 65 } }, -- Tö Hµ MËt TÞch
    { tbProp = { 0, 107, 66 } }, -- Chiªm Y Phæ
    { tbProp = { 0, 107, 155 } }, -- Ngò Hµnh MËt TÞch
    { tbProp = { 0, 107, 159 } }, -- Tø Linh ChiÕn ý Phæ
    { tbProp = { 0, 107, 160 } }, -- Tø Linh Thiªn ý Phæ
    { tbProp = { 0, 107, 161 } }, -- Tø Linh Tö ý Phæ
    { tbProp = { 0, 107, 162 } }, -- Tø Linh ChiÕn ý Phæ
    { tbProp = { 0, 107, 163 } }, -- Tø Linh Thiªn Y Phæ
    { tbProp = { 0, 107, 164 } }, -- Tø Linh Tö Y Phæ
    { tbProp = { 0, 107, 165 } }, -- Tø Linh V« Song Phæ
};

----------------------------------------------------------------------------------------------------
--- khai b¸o vò khÝ

--- Danh s¸ch vò khÝ 76, ®Ó lÊy ra vò khÝ 86, 96 th× dïng c«ng thøc nWeaponId + abs(nLevel - 7)
g_tbWeapon76 = {
    [WEAPON_TYPE_BAOTAY] = 14,
    [WEAPON_TYPE_CHAM] = 53,
    [WEAPON_TYPE_KIEM] = 36,
    [WEAPON_TYPE_DAO] = 64,
    [WEAPON_TYPE_CUNG] = 119,
    [WEAPON_TYPE_CON] = 40,
    [WEAPON_TYPE_THUONG] = 108,
    [WEAPON_TYPE_SONGDAO] = 12,
    [WEAPON_TYPE_TRUONG] = 97,
    [WEAPON_TYPE_BUT] = 86,
    [WEAPON_TYPE_DAN] = 75,
    [WEAPON_TYPE_TRAO] = 12,
    [WEAPON_TYPE_LINHNU] = 12,
    [WEAPON_TYPE_VUTIEN] = 12,
};

--- Danh s¸ch option cña vò khÝ nguyªn tö
g_tbWeaponSpeicalAttribute = {
    [7] = {
        {
            nAttributeId = 285,
            nRate = 1.1,
            tbLevelCfg = {
                { nLevel = 5, nRate = 90 },
                { nLevel = 6, nRate = 9 },
                { nLevel = 7, nRate = 1 },
            }
        },
        {
            nAttributeId = 304,
            nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 41,
            nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 42,
            nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 49,
            nRate = 6,
            tbLevelCfg = {
                { nLevel = 6, nRate = 50 },
                { nLevel = 7, nRate = 50 },
            }
        },
        {
            nAttributeId = 50,
            nRate = 1.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 252,
            nRate = 0.4,
            tbLevelCfg = {
                { nLevel = 4, nRate = 85 },
                { nLevel = 5, nRate = 12 },
                { nLevel = 6, nRate = 3 },
            }
        },
        {
            nAttributeId = 268,
            nRate = 1,
            tbLevelCfg = {
                { nLevel = 5, nRate = 80 },
                { nLevel = 6, nRate = 15 },
                { nLevel = 7, nRate = 5 },
            }
        },
        {
            nAttributeId = 53,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 54,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 63,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 64,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 390,
            nRate = 0.5,
            tbLevelCfg = {
                { nLevel = 3, nRate = 70 },
                { nLevel = 4, nRate = 20 },
                { nLevel = 5, nRate = 10 },
            }
        },
        {
            nAttributeId = 85,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 86,
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 94, 
            nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 95, 
            nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 96, 
            nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 97, 
            nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 98, 
            nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 102, 
            nRate = 4,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 111, 
            nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 277,
            nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 278, 
            nRate = 4,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 308, 
            nRate = 0.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 70 },
                { nLevel = 6, nRate = 20 },
                { nLevel = 7, nRate = 10 },
            }
        },
    },
    [8] = {
        {
            nAttributeId = 285,
            nRate = 0.8,
            tbLevelCfg = {
                { nLevel = 5, nRate = 90 },
                { nLevel = 6, nRate = 9 },
                { nLevel = 7, nRate = 1 },
            }
        },
        {
            nAttributeId = 304,
            nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 41, 
            nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 42, 
            nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 49, 
            nRate = 6,
            tbLevelCfg = {
                { nLevel = 6, nRate = 50 },
                { nLevel = 7, nRate = 50 },
            }
        },
        {
            nAttributeId = 50, 
            nRate = 1.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 252, 
            nRate = 0.6,
            tbLevelCfg = {
                { nLevel = 3, nRate = 70 },
                { nLevel = 4, nRate = 25 },
                { nLevel = 5, nRate = 5 },
            }
        },
        {
            nAttributeId = 268, 
            nRate = 1,
            tbLevelCfg = {
                { nLevel = 5, nRate = 80 },
                { nLevel = 6, nRate = 15 },
                { nLevel = 7, nRate = 5 },
            }
        },
        {
            nAttributeId = 53, 
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 54, 
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 63, 
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 64, 
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 390, 
            nRate = 0.6,
            tbLevelCfg = {
                { nLevel = 3, nRate = 70 },
                { nLevel = 4, nRate = 20 },
                { nLevel = 5, nRate = 10 },
            }
        },
        {
            nAttributeId = 85, 
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 86, 
            nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 94, 
            nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 95, 
            nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 96, 
            nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 97, 
            nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 98, 
            nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 102, 
            nRate = 4,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 111, 
            nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 277, 
            nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 278, 
            nRate = 4,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 308, 
            nRate = 0.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 70 },
                { nLevel = 6, nRate = 20 },
                { nLevel = 7, nRate = 10 },
            }
        },
    },
    [9] = {
        {
            nAttributeId = 285, nRate = 0.8,
            tbLevelCfg = {
                { nLevel = 5, nRate = 90 },
                { nLevel = 6, nRate = 9 },
                { nLevel = 7, nRate = 1 },
            }
        },
        {
            nAttributeId = 304, nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 41, nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 42, nRate = 6,
            tbLevelCfg = {
                { nLevel = 5, nRate = 60 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 10 },
            }
        },
        {
            nAttributeId = 49, nRate = 6,
            tbLevelCfg = {
                { nLevel = 6, nRate = 50 },
                { nLevel = 7, nRate = 50 },
            }
        },
        {
            nAttributeId = 50, nRate = 1.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 252, nRate = 0.6,
            tbLevelCfg = {
                { nLevel = 3, nRate = 70 },
                { nLevel = 4, nRate = 25 },
                { nLevel = 5, nRate = 5 },
            }
        },
        {
            nAttributeId = 268, nRate = 1,
            tbLevelCfg = {
                { nLevel = 5, nRate = 80 },
                { nLevel = 6, nRate = 15 },
                { nLevel = 7, nRate = 5 },
            }
        },
        {
            nAttributeId = 53, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 54, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 63, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 64, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 40 },
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 390, nRate = 0.6,
            tbLevelCfg = {
                { nLevel = 3, nRate = 70 },
                { nLevel = 4, nRate = 20 },
                { nLevel = 5, nRate = 10 },
            }
        },
        {
            nAttributeId = 85, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 86, nRate = 3.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 50 },
                { nLevel = 6, nRate = 30 },
                { nLevel = 7, nRate = 20 },
            }
        },
        {
            nAttributeId = 94, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 95, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 96, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 97, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 98, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 102, nRate = 4,
            tbLevelCfg = {
                { nLevel = 6, nRate = 40 },
                { nLevel = 7, nRate = 60 },
            }
        },
        {
            nAttributeId = 111, nRate = 7,
            tbLevelCfg = {
                { nLevel = 6, nRate = 60 },
                { nLevel = 7, nRate = 40 },
            }
        },
        {
            nAttributeId = 277, nRate = 3,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 278, nRate = 4,
            tbLevelCfg = {
                { nLevel = 4, nRate = 80 },
                { nLevel = 5, nRate = 15 },
                { nLevel = 6, nRate = 5 },
            }
        },
        {
            nAttributeId = 308, nRate = 0.5,
            tbLevelCfg = {
                { nLevel = 5, nRate = 70 },
                { nLevel = 6, nRate = 20 },
                { nLevel = 7, nRate = 10 },
            }
        },
    }
};

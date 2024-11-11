----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-11
--- Description: c¸c h»ng sè cña game, ®Ó kh«ng phô thuéc vµo c¸c tham sè
--- cña c¸c server kh¸c nªn míi sinh ra file nµy
----------------------------------------------------------------------------------------------------
ITEM_G_EQUIP = 0; -- trang bÞ mÆc lªn ng­êi
ITEM_G_USE = 1; -- vËt phÈm sö dông tiªu hao
ITEM_G_OTHER = 2; -- vËt phÈm kh¸c
----------------------------------------------------------------------------------------------------
ITEM_D_WEAPON_BAOTAY = 0;
ITEM_D_WEAPON_AMKHI = 1;
ITEM_D_WEAPON_KIEM = 2;
ITEM_D_WEAPON_DAO = 3;
ITEM_D_WEAPON_CUNG = 4;
ITEM_D_WEAPON_CON = 5;
ITEM_D_WEAPON_THUONG = 6;
ITEM_D_WEAPON_SONGDAO = 7;
ITEM_D_WEAPON_TRUONG = 8;
ITEM_D_WEAPON_BUT = 9;
ITEM_D_WEAPON_DAN = 10;
ITEM_D_WEAPON_TRAO = 11;
ITEM_D_WEAPON_SAO = 12;
ITEM_D_WEAPON_QUAT = 13;
ITEM_D_WEAPON_SONGCHUY = 14;
----------------------------------------------------------------------------------------------------
ITEM_D_EQUIP_CLOTH = 100;
ITEM_D_EQUIP_FOOT = 101;
ITEM_D_EQUIP_ADORN = 102;
ITEM_D_EQUIP_HEAD = 103;
ITEM_D_EQUIP_CLOAK = 104;
ITEM_D_EQUIP_HORSE = 105;
ITEM_D_EQUIP_PET = 106; -- c¸i nµy kh«ng sö dông
ITEM_D_EQUIP_BOOK = 107;
ITEM_D_EQUIP_COAT_CAP = 108;
ITEM_D_EQUIP_COAT_CLOTH = 109;
ITEM_D_EQUIP_COAT_TROUSERS = 110;
ITEM_D_EQUIP_COAT_SET = 111; -- c¸i nµy kh«ng sö dông
ITEM_D_EQUIP_GREAT_BOOK = 112;
ITEM_D_EQUIP_ARMORY_CLOTH = 113;
ITEM_D_EQUIP_ARMORY_FOOT = 114;
ITEM_D_EQUIP_ARMORY_ADORN = 115;
ITEM_D_EQUIP_ARMORY_HEAD = 116;
ITEM_D_EQUIP_ARMORY_BADGE = 117;
ITEM_D_EQUIP_DRESS_SMOCK = 118;
ITEM_D_EQUIP_ORNAMENT_CAP = 119;
ITEM_D_EQUIP_ORNAMENT_CLOTH = 120;
ITEM_D_EQUIP_ORNAMENT_FOOT = 121;
ITEM_D_EQUIP_LEFT_PEARL = 122;

ITEM_D_EQUIP_WENSHI_H = 148;
ITEM_D_EQUIP_WENSHI_C = 149;
ITEM_D_EQUIP_WENSHI_T = 150;
ITEM_D_EQUIP_WENSHI_SET = 151; -- c¸i nµy kh«ng sö dông

ITEM_D_EQUIP_CAPE = 152;
ITEM_D_EQUIP_BADGE = 153;
ITEM_D_EQUIP_SHOE = 154;
ITEM_D_EQUIP_TOKENS = 155;
----------------------------------------------------------------------------------------------------
ITEM_D_USE_MEDICINE = 0;
ITEM_D_USE_FOOD = 1;
ITEM_D_USE_MEDICINE_RESOURCE = 2;
ITEM_D_USE_FOOD_RESOURCE = 3;
ITEM_D_USE_TELEPORT = 4;
ITEM_D_USE_CORPSE = 6;
ITEM_D_USE_CORPSE_GGS = 7;
----------------------------------------------------------------------------------------------------
ITEM_D_OTHER_QUEST = 0; -- vËt phÈm nhiÖm vô
ITEM_D_OTHER_MYSTER = 1; -- vËt phÈm thÇn bÝ
ITEM_D_OTHER_COMPOUND = 2;
ITEM_D_OTHER_SKILL_COST = 3;
ITEM_D_OTHER_STONE = 4;
ITEM_D_OTHER_SCROLL = 5;
ITEM_D_OTHER_ADDENDA = 6;
ITEM_D_OTHER_ORIGIN_WOOD = 7;
ITEM_D_OTHER_ORIGIN_STONE = 8;
ITEM_D_OTHER_ORIGIN_SILK = 9;
ITEM_D_OTHER_ORIGIN_SKIN = 10;
ITEM_D_OTHER_ANQI = 11;
ITEM_D_OTHER_BATTLE = 12;
ITEM_D_OTHER_SERIES_STONE = 13;
ITEM_D_OTHER_TREASURE_SHOW = 14;
ITEM_D_OTHER_ARROW = 15;
ITEM_D_OTHER_GU_MATRIX = 16;
ITEM_D_OTHER_GU_INSECT = 17;
ITEM_D_OTHER_LING_STONE = 18;
ITEM_D_OTHER_LIFE_SCROLL = 19;
ITEM_D_OTHER_SUNMMON = 20;
ITEM_D_OTHER_LING_SHI_PEIFANG = 21;
ITEM_D_OTHER_GEM = 22;
ITEM_D_OTHER_SKILL_APP = 23;
ITEM_D_OTHER_PET_SKILL_BOOK = 150;
ITEM_D_OTHER_EF_LOCK_RAND = 151;
ITEM_D_OTHER_ACTIVITY_ITEM = 200;
----------------------------------------------------------------------------------------------------
--- khai b¸o c¸c vËt phÈm mÆc trªn ng­êi
--- sö dông hµm GetPlayerEquipIndex(x) sÏ tr¶ vÒ nItemIdx cña vËt phÈm
--- víi x lµ sè ®­îc khai b¸o d­íi ®©y
ITEMPART_HEAD = 0;
ITEMPART_BODY = 1;
ITEMPART_WEAPON = 2;
ITEMPART_FOOT = 3;
ITEMPART_RING = 4;
ITEMPART_RING2 = 5;
ITEMPART_MASK = 6;
ITEMPART_CLOTH = 7;
ITEMPART_OUTFOOT = 8;
ITEMPART_GREAT_BOOK = 9;
ITEMPART_HORSE = 10;
ITEMPART_BOOK = 11;
ITEMPART_WEAPON_EXTEND = 12;
ITEMPART_INNERSTONE1 = 13;
ITEMPART_INNERSTONE2 = 14;
ITEMPART_INNERSTONE3 = 15;
ITEMPART_INNERSTONE4 = 16;

ITEMPART_CAPE = 17;
ITEMPART_BADGE = 18;
ITEMPART_SHOE = 19;

ITEMPART_TOKENS = 20;

ITEMPART_ORNAMENT_CAP = 21;
ITEMPART_ORNAMENT_CLOTH = 22;
ITEMPART_ORNAMENT_FOOT = 23;

ITEMPART_ARMORY_HEAD = 24;
ITEMPART_ARMORY_BODY = 25;
ITEMPART_ARMORY_FOOT = 26;
ITEMPART_ARMORY_RING1 = 27;
ITEMPART_ARMORY_RING2 = 28;

ITEMPART_LEFT_PEARL1 = 29;
ITEMPART_LEFT_PEARL2 = 30;
ITEMPART_LEFT_PEARL3 = 31;
ITEMPART_LEFT_PEARL4 = 32;
ITEMPART_LEFT_PEARL5 = 33;
ITEMPART_LEFT_PEARL6 = 34;
ITEMPART_LEFT_PEARL7 = 35;

ITEMPART_NUM = 36;
----------------------------------------------------------------------------------------------------
--- khai b¸o c¸c vÞ trÝ cña vËt phÈm
--- dïng hµm GetItemPlace(nItemIdx) sÏ tr¶ vÒ 3 gi¸ trÞ x, y, z
--- x lµ gi¸ trÞ d­íi ®©y
ITEMPOS_HAND = 0; -- con trá chuét
ITEMPOS_EQUIP = 1; -- mÆc lªn ng­êi
ITEMPOS_EQUIPROOM = 2; -- hµnh trang
ITEMPOS_REPOSITORYROOM = 3; -- thñ khè
ITEMPOS_IMMEDIACY = 4; -- thanh phÝm t¾t 123456789
ITEMPOS_TRADESELF = 5; -- r­¬ng giao dÞch
ITEMPOS_TRADEOTHER = 6; -- r­¬ng giao dÞch cña ®èi ph­¬ng
ITEMPOS_STALLSELF = 7; -- r­¬ng bµy b¸n
ITEMPOS_COMPOSE = 8; -- « nguyªn liÖu
ITEMPOS_STALLOTHER = 9; -- r­¬ng bµy b¸n cña ®èi ph­¬ng
ITEMPOS_SLAVEITEM = 10; -- gièng nh­ ®¸ quý, g¾n vµo vËt phÈm kh¸c
ITEMPOS_PACKAGEITEM = 11;
ITEMPOS_BAGUA_COMPOSE = 12; -- « hîp thµnh b¸t qu¸i
ITEMPOS_BAGUA_DESPOSE = 13; -- « t¸ch b¸t qu¸i
ITEMPOS_BAGUA_PARTITEM = 14; -- trang bÞ trong bé b¸t qu¸i
ITEMPOS_BAGUA_ITEM = 15; -- trang bÞ trong bé b¸t qu¸i

ITEMPOS_UPGRADE_SC_EQUIPMENT = 16; -- « n©ng cÊp trang bÞ tµng kiÕm
ITEMPOS_UPGRADE_SC_MATERIAL = 17; -- nguyªn liÖu n©ng cÊp trang bÞ tµng kiÕm
ITEMPOS_SMELT_CIRCLE = 18; -- « t¸ch trang bÞ
ITEMPOS_OFFLINE_TRADE = 19; -- giao dÞch ngo¹i tuyÕn
ITEMPOS_COMPOSE_SILING_MOUNT_BASE = 20; -- « hîp thµnh thó c­ìi???
ITEMPOS_COMPOSE_SILING_MOUNT_MATERIAL = 21; -- « nguyªn liÖu hîp thµnh

ITEMPOS_PET_BOOK = 22; -- « giao diÖn s¸ch thó c­ng
ITEMPOS_SKILL_APP = 23; -- « giao diÖn ®¸ skill
ITEMPOS_LEFT_PEARL_BAG = 24; -- « giao diÖn tói ch©u

ITEMPOS_NUM = 26;
----------------------------------------------------------------------------------------------------
--- khai b¸o tr¹ng th¸i khãa cña ®å
--- th­êng sö dông trong hµm AddItem, tham sè thø 5 t­¬ng øng d­íi ®©y
--- sö dông hµm GetItemSpecialAttr(nItemIdx,"BIND") == 1 => khãa
ITEMSTATUS_UNIND = -1;
ITEMSTATUS_TRADE = 1;
ITEMSTATUS_LOCK_NOTSELL = 2;
ITEMSTATUS_EQUIP_LOCK = 3;
ITEMSTATUS_LOCK = 4;
ITEMSTATUS_NAMES = {
    [ITEMSTATUS_UNIND] = "ch­a gi¸m ®Þnh",
    [ITEMSTATUS_TRADE] = "kh«ng khãa",
    [ITEMSTATUS_LOCK_NOTSELL] = "khãa, kh«ng thÓ b¸n shop",
    [ITEMSTATUS_EQUIP_LOCK] = "cã thÓ gd, mÆc lªn ng­êi sÏ khãa",
    [ITEMSTATUS_LOCK] = "khãa",
};
----------------------------------------------------------------------------------------------------
--- khai b¸o nGiveType
GIVETYPE_SUIT = 1;
GIVETYPE_SUIT_RING = 2;
GIVETYPE_SUIT_RING_WEAPON = 3;
----------------------------------------------------------------------------------------------------
--- khai b¸o nFeed
ITEMFEED_12 = 1000000;
----------------------------------------------------------------------------------------------------
--- khai b¸o battle rank
BATTLERANK_BINHSI = 1;
BATTLERANK_HIEUUY = 2;
BATTLERANK_DOTHONG = 3;
BATTLERANK_TIENPHONG = 4;
BATTLERANK_TUONGQUAN = 5;
BATTLERANK_NGUYENSOAI = 6;
BATTLERANK_NAMES = {
    [BATTLERANK_BINHSI] = "Binh sÜ",
    [BATTLERANK_HIEUUY] = "HiÖu óy",
    [BATTLERANK_DOTHONG] = "§« thèng",
    [BATTLERANK_TIENPHONG] = "Tiªn phong",
    [BATTLERANK_TUONGQUAN] = "T­íng qu©n",
    [BATTLERANK_NGUYENSOAI] = "Nguyªn so¸i",
};
--- xem trong file: \script\global\battlefield_callback.lua
BATTLERANK_POINTS = {
    [BATTLERANK_BINHSI] = 0,
    [BATTLERANK_HIEUUY] = 15000,
    [BATTLERANK_DOTHONG] = 50000,
    [BATTLERANK_TIENPHONG] = 80000,
    [BATTLERANK_TUONGQUAN] = 120000,
    [BATTLERANK_NGUYENSOAI] = 250000,
};
----------------------------------------------------------------------------------------------------
--- khai b¸o battle camp
BATTLECAMP_TONG = 1;
BATTLECAMP_LIEU = 2;
BATTLECAMP_NAMES = {
    [BATTLECAMP_TONG] = "Tèng",
    [BATTLECAMP_LIEU] = "Liªu",
};
----------------------------------------------------------------------------------------------------
--- khai b¸o giíi tÝnh
SEX_MALE = 1;
SEX_FEMALE = 2;
SEX_ALL = 3;
SEX_NAMES = {
    [SEX_MALE] = "Nam",
    [SEX_FEMALE] = "N÷",
    [SEX_ALL] = "Kh«ng ph©n biÖt Nam N÷",
};

----------------------------------------------------------------------------------------------------
--- khai b¸o sortype trong relay và các hàm khác
ORDER_BY_NONE=0;
ORDER_BY_ASC=1;
ORDER_BY_DESC=2;

----------------------------------------------------------------------------------------------------
--- khai b¸o tr¹ng th¸i nh©n vËt, gäi b»ng hµm IsHaveState(nState)
PLAYERSTATE_RIDING = 2;

----------------------------------------------------------------------------------------------------
--- khai b¸o c¸c h»ng sè vÒ thêi gian
DATETIME_SEC_ONE_HOUR = 3600;
DATETIME_SEC_ONE_DAY = 86400;
DATETIME_SEC_ONE_WEEK = 604800;
DATETIME_SEC_ONE_MONTH = 2592000;

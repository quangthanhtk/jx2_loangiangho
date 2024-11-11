----------------------------------------------------------------------------------------------------
--- Author: Long Thai
--- Modified: 2022-10-11
--- Description: c�c h�ng s� c�a game, �� kh�ng ph� thu�c v�o c�c tham s�
--- c�a c�c server kh�c n�n m�i sinh ra file n�y
----------------------------------------------------------------------------------------------------
ITEM_G_EQUIP = 0; -- trang b� m�c l�n ng��i
ITEM_G_USE = 1; -- v�t ph�m s� d�ng ti�u hao
ITEM_G_OTHER = 2; -- v�t ph�m kh�c
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
ITEM_D_EQUIP_PET = 106; -- c�i n�y kh�ng s� d�ng
ITEM_D_EQUIP_BOOK = 107;
ITEM_D_EQUIP_COAT_CAP = 108;
ITEM_D_EQUIP_COAT_CLOTH = 109;
ITEM_D_EQUIP_COAT_TROUSERS = 110;
ITEM_D_EQUIP_COAT_SET = 111; -- c�i n�y kh�ng s� d�ng
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
ITEM_D_EQUIP_WENSHI_SET = 151; -- c�i n�y kh�ng s� d�ng

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
ITEM_D_OTHER_QUEST = 0; -- v�t ph�m nhi�m v�
ITEM_D_OTHER_MYSTER = 1; -- v�t ph�m th�n b�
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
--- khai b�o c�c v�t ph�m m�c tr�n ng��i
--- s� d�ng h�m GetPlayerEquipIndex(x) s� tr� v� nItemIdx c�a v�t ph�m
--- v�i x l� s� ���c khai b�o d��i ��y
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
--- khai b�o c�c v� tr� c�a v�t ph�m
--- d�ng h�m GetItemPlace(nItemIdx) s� tr� v� 3 gi� tr� x, y, z
--- x l� gi� tr� d��i ��y
ITEMPOS_HAND = 0; -- con tr� chu�t
ITEMPOS_EQUIP = 1; -- m�c l�n ng��i
ITEMPOS_EQUIPROOM = 2; -- h�nh trang
ITEMPOS_REPOSITORYROOM = 3; -- th� kh�
ITEMPOS_IMMEDIACY = 4; -- thanh ph�m t�t 123456789
ITEMPOS_TRADESELF = 5; -- r��ng giao d�ch
ITEMPOS_TRADEOTHER = 6; -- r��ng giao d�ch c�a ��i ph��ng
ITEMPOS_STALLSELF = 7; -- r��ng b�y b�n
ITEMPOS_COMPOSE = 8; -- � nguy�n li�u
ITEMPOS_STALLOTHER = 9; -- r��ng b�y b�n c�a ��i ph��ng
ITEMPOS_SLAVEITEM = 10; -- gi�ng nh� �� qu�, g�n v�o v�t ph�m kh�c
ITEMPOS_PACKAGEITEM = 11;
ITEMPOS_BAGUA_COMPOSE = 12; -- � h�p th�nh b�t qu�i
ITEMPOS_BAGUA_DESPOSE = 13; -- � t�ch b�t qu�i
ITEMPOS_BAGUA_PARTITEM = 14; -- trang b� trong b� b�t qu�i
ITEMPOS_BAGUA_ITEM = 15; -- trang b� trong b� b�t qu�i

ITEMPOS_UPGRADE_SC_EQUIPMENT = 16; -- � n�ng c�p trang b� t�ng ki�m
ITEMPOS_UPGRADE_SC_MATERIAL = 17; -- nguy�n li�u n�ng c�p trang b� t�ng ki�m
ITEMPOS_SMELT_CIRCLE = 18; -- � t�ch trang b�
ITEMPOS_OFFLINE_TRADE = 19; -- giao d�ch ngo�i tuy�n
ITEMPOS_COMPOSE_SILING_MOUNT_BASE = 20; -- � h�p th�nh th� c��i???
ITEMPOS_COMPOSE_SILING_MOUNT_MATERIAL = 21; -- � nguy�n li�u h�p th�nh

ITEMPOS_PET_BOOK = 22; -- � giao di�n s�ch th� c�ng
ITEMPOS_SKILL_APP = 23; -- � giao di�n �� skill
ITEMPOS_LEFT_PEARL_BAG = 24; -- � giao di�n t�i ch�u

ITEMPOS_NUM = 26;
----------------------------------------------------------------------------------------------------
--- khai b�o tr�ng th�i kh�a c�a ��
--- th��ng s� d�ng trong h�m AddItem, tham s� th� 5 t��ng �ng d��i ��y
--- s� d�ng h�m GetItemSpecialAttr(nItemIdx,"BIND") == 1 => kh�a
ITEMSTATUS_UNIND = -1;
ITEMSTATUS_TRADE = 1;
ITEMSTATUS_LOCK_NOTSELL = 2;
ITEMSTATUS_EQUIP_LOCK = 3;
ITEMSTATUS_LOCK = 4;
ITEMSTATUS_NAMES = {
    [ITEMSTATUS_UNIND] = "ch�a gi�m ��nh",
    [ITEMSTATUS_TRADE] = "kh�ng kh�a",
    [ITEMSTATUS_LOCK_NOTSELL] = "kh�a, kh�ng th� b�n shop",
    [ITEMSTATUS_EQUIP_LOCK] = "c� th� gd, m�c l�n ng��i s� kh�a",
    [ITEMSTATUS_LOCK] = "kh�a",
};
----------------------------------------------------------------------------------------------------
--- khai b�o nGiveType
GIVETYPE_SUIT = 1;
GIVETYPE_SUIT_RING = 2;
GIVETYPE_SUIT_RING_WEAPON = 3;
----------------------------------------------------------------------------------------------------
--- khai b�o nFeed
ITEMFEED_12 = 1000000;
----------------------------------------------------------------------------------------------------
--- khai b�o battle rank
BATTLERANK_BINHSI = 1;
BATTLERANK_HIEUUY = 2;
BATTLERANK_DOTHONG = 3;
BATTLERANK_TIENPHONG = 4;
BATTLERANK_TUONGQUAN = 5;
BATTLERANK_NGUYENSOAI = 6;
BATTLERANK_NAMES = {
    [BATTLERANK_BINHSI] = "Binh s�",
    [BATTLERANK_HIEUUY] = "Hi�u �y",
    [BATTLERANK_DOTHONG] = "�� th�ng",
    [BATTLERANK_TIENPHONG] = "Ti�n phong",
    [BATTLERANK_TUONGQUAN] = "T��ng qu�n",
    [BATTLERANK_NGUYENSOAI] = "Nguy�n so�i",
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
--- khai b�o battle camp
BATTLECAMP_TONG = 1;
BATTLECAMP_LIEU = 2;
BATTLECAMP_NAMES = {
    [BATTLECAMP_TONG] = "T�ng",
    [BATTLECAMP_LIEU] = "Li�u",
};
----------------------------------------------------------------------------------------------------
--- khai b�o gi�i t�nh
SEX_MALE = 1;
SEX_FEMALE = 2;
SEX_ALL = 3;
SEX_NAMES = {
    [SEX_MALE] = "Nam",
    [SEX_FEMALE] = "N�",
    [SEX_ALL] = "Kh�ng ph�n bi�t Nam N�",
};

----------------------------------------------------------------------------------------------------
--- khai b�o sortype trong relay v� c�c h�m kh�c
ORDER_BY_NONE=0;
ORDER_BY_ASC=1;
ORDER_BY_DESC=2;

----------------------------------------------------------------------------------------------------
--- khai b�o tr�ng th�i nh�n v�t, g�i b�ng h�m IsHaveState(nState)
PLAYERSTATE_RIDING = 2;

----------------------------------------------------------------------------------------------------
--- khai b�o c�c h�ng s� v� th�i gian
DATETIME_SEC_ONE_HOUR = 3600;
DATETIME_SEC_ONE_DAY = 86400;
DATETIME_SEC_ONE_WEEK = 604800;
DATETIME_SEC_ONE_MONTH = 2592000;

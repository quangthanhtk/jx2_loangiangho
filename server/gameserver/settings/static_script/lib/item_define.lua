------------------------------------------------------------------------
--enum ITEMGENRE
	item_equip				= 0;	-- ×°±¸
	item_use				= 1;	-- ÏûºÄÆ·
	item_other				= 2;	-- ÆäËûÔÓÎï
	item_number				= 3;	-- ÀàĞÍÊıÄ¿
--enum ITEMGENRE
------------------------------------------------------------------------

------------------------------------------------------------------------
--enum enumEQUIP_DETAIL
	enumWD_BEGIN			= 0; --c¸c define D vò khİ gèc lµ + thªm 1 nªn bŞ sai
	enumWD_CUFF				= 0;	--È­
	enumWD_RANGE			= 1;	--°µ
	enumWD_SWORD			= 2;	--½£
	enumWD_BLADE			= 3;	--µ¶
	enumWD_BOW				= 4;	--¹­
	enumWD_STAFF			= 5;	--¹÷
	enumWD_LANCE			= 6;	--Ç¹
	enumWD_DUAL_BLADE		= 7;	--Ë«µ¶
	enumWD_CLUB				= 8;	--ÎıÕÈ
	enumWD_BRUSH			= 9;	--±Ê
	enumWD_STRING			= 10;	--ÇÙ
	enumWD_CLAW				= 11;	--×¦
	enumWD_STAFF_FLUTE		= 12;	--µÑ×Ó·¨ÕÈ
	enumWD_STAFF_PLANT		= 13;	--Ö²Îï·¨ÕÈ
	enumWD_DUAL_DAGGER		= 14;	--Ë«Ø°Ê×
	enumWD_NUM				= 15;	--ÎäÆ÷ÖÖÀàÊıÁ¿
	enumBD_CLOTH			= 100;	--ÒÂ
	enumBD_FOOT				= 101;	--Ğ¬
	enumBD_ADORN			= 102;	--ÊÎ
	enumBD_HEAD				= 103;	--Ã±
	enumBD_CLOAK			= 104;	--Åû
	enumBD_HORSE			= 105;	--Âí
	enumBD_PET				= 106;	--³èÎï
	enumBD_BOOK				= 107;	--ÃØ¼®
	enumBD_COAT_CAP			= 108;	--ÍâÌ×Ã±×Ó
	enumBD_COAT_CLOTH		= 109;	--ÍâÌ×ÒÂ·ş
	enumBD_COAT_TROUSERS	= 110;	--ÍâÌ×Ğ¬×Ó
	enumBD_COAT_SET			= 111;	--ÍâÌ×Ì××°
	enumBD_GREAT_BOOK		= 112;	--ÕòÅÉÃØ¼®
	enumBD_ARMORY_CLOTH		= 113;	--ÎÆÊÎ-ÒÂ
	enumBD_ARMORY_FOOT		= 114;	--ÎÆÊÎ-Ğ¬
	enumBD_ARMORY_ADORN		= 115;	--ÎÆÊÎ-ÊÎ
	enumBD_ARMORY_HEAD		= 116;	--ÎÆÊÎ-Ã±
	enumBD_ARMORY_BADGE			= 117;	--
	enumBD_DRESS_SMOCK		= 118;	--
	enumBD_ORNAMENT_CAP		= 119;	--ÊÎÆ·-Ã±
	enumBD_ORNAMENT_CLOTH	= 120;	--ÊÎÆ·-ÒÂ
	enumBD_ORNAMENT_FOOT	= 121;	--ÊÎÆ·-Ğ¬
	enumBD_LEFT_PEARL		= 122;	--²×º£ÒÅÖé

	enumBD_END				= 123;	--Íê½á±ê¼Ç
	enumBD_NUM				= enumBD_END - enumBD_CLOTH;

	_enumWENSHI_BEGIN 		= 148; --------
	enumWENSHI_H 			= _enumWENSHI_BEGIN;--ÎÆÊÎ-Í·
	enumWENSHI_C 			= 149;				--ÎÆÊÎ-ÒÂ
	enumWENSHI_T 			= 150;				--ÎÆÊÎ-×°
	enumWENSHI_SET 			= 151;				--ÎÆÊÎ-Ì××°
	_enumWENSHI_TMP1_ 		= 152;
	_enumWENSHI_END = _enumWENSHI_TMP1_ - 1;--------

	enumBD_CAPE 			= 152;	--Åû·ç
	enumBD_BADGE 			= 153;	--»ÕÕÂ
	enumBD_SHOE 			= 154;	--Ğ¬×Ó
	enumBD_TOKENS 			= 155;	--ÁîÅÆ

	enumTD_TOOLS			= 200;	--¹¤¾ßÀàĞÍ
	enumTD_END				= 201;	--Íê½á±ê¼Ç
	enumTD_NUM				= enumTD_END - enumTD_TOOLS;
	enumED_INNER_STONE		= 210;	--ÄÚµ¤
	enumED_NUM				= enumWD_NUM + enumBD_NUM;
--enum enumEQUIP_DETAIL
------------------------------------------------------------------------

------------------------------------------------------------------------
--enum enumUSE_DETAIL
	enumUS_MEDICINE			= 0;	--µ¤Ò©
	enumUS_FOOD				= 1;	--Ê³Îï
	enumUS_MEDICINE_RESOURCE= 2;	--²İÒ©(¿ÉºÏ³Éµ¤Ò©£¬Ò²¿ÉÒÔ³Ô)
	enumUS_FOOD_RESOURCE	= 3;	--Ê³²Ä(¿ÉºÏ³ÉÊ³Îï£¬Ò²¿ÉÒÔ³Ô)
	enumUS_TELEPORT			= 4;	--´«ËÍÀà
	enumUS_CORPSE			= 6;	--·âÊ¬·û
	enumUS_CORPSE_GGS		= 7;	--¿ç·ş·âÊ¬·û(Òª±»¿ÓËÀ)
	_enumUS_TMP1_			= 8;
	_enumUS_EAT_END = _enumUS_TMP1_ - 1;--------
	enumUS_NUM				= 8;
--enum enumUSE_DETAIL
------------------------------------------------------------------------

------------------------------------------------------------------------
--enum enumOTHER_DETAIL
	enumOD_QUEST			= 0;	--ÈÎÎñÎïÆ·
	enumOD_MYSTER			= 1;	--ÉñÃØÎïÆ·
	enumOD_COMPOUND			= 2;	--ºÏ³ÉÎïÆ·
	enumOD_SKILL_COST		= 3;	--¼¼ÄÜÏûºÄÎïÆ·
	enumOD_STONE			= 4;	--Ø³Ê¯
	enumOD_SCROLL			= 5;	--¾íÖá
	enumOD_ADDENDA			= 6;	--Îä¹¦ĞÄµÃ
	enumOD_ORIGIN_WOOD		= 7;	--Ô­Ä¾
	enumOD_ORIGIN_STONE		= 8;	--Ô­Ê¯
	enumOD_ORIGIN_SILK		= 9;	--Ô­Ê¬
	enumOD_ORIGIN_SKIN		= 10;	--Ô²Æ¤
	enumOD_ANQI				= 11;	--°µÆ÷
	enumOD_BATTLE			= 12;	--Õ½³¡×¨ÓÃÎïÆ·
	enumOD_SERIES_STONE		= 13;	--ÎåĞĞÊ¯
	enumOD_TREASURE_SHOW	= 14;	--²Ø±¦Í¼
	enumOD_ARROW			= 15;	--¼ıÊ¸
	enumOD_GU_MATRIX		= 16;	--¹ÆÄ¸
	enumOD_GU_INSECT		= 17;	--¹Æ³æ
	enumOD_LING_STONE		= 18;	--ÁéÊ¯
	enumOD_LIFE_SCROLL		= 19;	--Éú»î¼¼ÄÜ¾íÖá - Jeep tag
	enumOD_SUNMMON			= 20;	--ÕÙ»½µÀ¾ß/³èÎïÅÆ
	enumOD_LING_SHI_PEIFANG	= 21;	--ÁéÊ¯ºÏ³ÉÅä·½
	enumOD_GEM				= 22;	--VN±¦Ê¯
	enumOD_SKILL_APP 		= 23; 	--¼¼ÄÜÊ¯
	_enumOD_VN_BEGIN 		= 150;	--Ô½ÄÏ°æ±¾Õ¼ÓÃµÄID¶Î
	enumOD_PET_SKILL_BOOK	= _enumOD_VN_BEGIN;	--³èÎï¼¼ÄÜÊé
	enumOD_EF_LOCK_RAND		= 151;	--ËøÁéÊ¯ ¿ÉÒÔËø¶¨Ñø³É×°±¸µÄÒ»¸öÊôĞÔ
	enumOD_ACTIVITY_ITEM	= 200;	--»î¶¯µÀ¾ß

	enumOD_NUM				= 201;
--enum enumOTHER_DETAIL
------------------------------------------------------------------------

------------------------------------------------------------------------
--enum ITEM_PART
	itempart_head			= 0;	-- Í·
	itempart_body			= 1;	-- ÄÚÒÂ
	itempart_weapon			= 2;	-- ±øÆ÷
	itempart_foot			= 3;	-- ½Å²¿
	itempart_ring			= 4;	-- ×°ÊÎÀ¸1
	itempart_ring2			= 5;	-- ×°ÊÎÀ¸2
	itempart_mask			= 6;	-- Ãæ¾ß
	itempart_cloth			= 7;	-- ÍâÒÂ
	itempart_outfoot		= 8;	-- ÏÂ°ëÉíµÄÍâÌ×
	itempart_great_book		= 9;	-- ¸±ÃØ¼®
	itempart_horse			= 10;	-- Âí
	itempart_book			= 11;	-- ÃØ¼®
	itempart_weapon_extend	= 12;	-- ÎäÆ÷À©Õ¹(°µÆ÷;¼ıÊ¸)
	itempart_innerstone1	= 13;	-- ÄÚµ¤1
	itempart_innerstone2	= 14;	-- ÄÚµ¤2
	itempart_innerstone3	= 15;	-- ÄÚµ¤3
	itempart_innerstone4	= 16;	-- ÄÚµ¤4

	itempart_cape			= 17;	-- Åû·ç
	itempart_badge			= 18;	-- »ÕÕÂ
	itempart_shoe			= 19;	-- Ğ¬×Ó

	itempart_tokens			= 20;	--

	itempart_ornament_cap	= 21;	-- ÊÎÆ·-Ã±
	itempart_ornament_cloth	= 22;	-- ÊÎÆ·-ÒÂ
	itempart_ornament_foot	= 23;	-- ÊÎÆ·-Ğ¬

	itempart_armory_head	= 24;	-- ÎÆÊÎ-¹Ú
	itempart_armory_body	= 25;	-- ÎÆÊÎ-ÒÂ
	itempart_armory_foot	= 26;	-- ÎÆÊÎ-×°
	itempart_armory_ring1	= 27;	-- ÎÆÊÎ-½äÖ¸1
	itempart_armory_ring2	= 28;	-- ÎÆÊÎ-½äÖ¸2
	
	itempart_left_pearl_1	= 29;	-- ²×º£ÒÅÖé1ºÅÎ»
	itempart_left_pearl_2	= 30;	-- ²×º£ÒÅÖé2ºÅÎ»
	itempart_left_pearl_3	= 31;	-- ²×º£ÒÅÖé3ºÅÎ»
	itempart_left_pearl_4	= 32;	-- ²×º£ÒÅÖé4ºÅÎ»
	itempart_left_pearl_5	= 33;	-- ²×º£ÒÅÖé5ºÅÎ»
	itempart_left_pearl_6	= 34;	-- ²×º£ÒÅÖé6ºÅÎ»
	itempart_left_pearl_7	= 35;	-- ²×º£ÒÅÖé7ºÅÎ»

	itempart_num			= 36;
--enum ITEM_PART
------------------------------------------------------------------------

------------------------------------------------------------------------
--enum ITEM_POSITION
	pos_hand				= 0;	-- ÊÖÉÏ
	pos_equip				= 1;	-- ×°±¸×ÅµÄ
	pos_equiproom			= 2;	-- µÀ¾ßÀ¸
	pos_repositoryroom		= 3;	-- ÖüÎïÏä
	pos_immediacy			= 4;	-- ¿ì½İÎïÆ·
	pos_tradeself			= 5;	-- ×Ô¼ºµÄ½»Ò×À¸
	pos_tradeother			= 6;	-- ±ğÈËµÄ½»Ò×À¸
	pos_stallself			= 7;	-- ×Ô¼ºµÄ°ÚÌ¯¿Õ¼ä
	pos_compose				= 8;	-- ºÏ³ÉÏä¸½¼ÓÎïÆ·Ïä
	pos_stallother			= 9;	-- ±ğÈËµÄ°ÚÌ¯¿Õ¼ä
	pos_slaveitem			= 10;	-- ÊÇÒ»¸ö×éºÏÎïÆ·ÖĞµÄÅä¼ş
	pos_packageitem			= 11;	-- ÊÇÒ»¸ö×éºÏÎïÆ·µÄÈİÆ÷ÎïÆ·
	pos_bagua_compose		= 12;	-- °ËØÔºÏ³ÉµÄÌí¼ÓÎï
	pos_bagua_depose		= 13;	-- °ËØÔ´òÉ¢Ì××°µÄÌí¼ÓÎï
	pos_bagua_part_item		= 14;	-- °ËØÔºÏ³ÉËùĞèµÄÎïÆ·ÈİÆ÷
	pos_bagua_item			= 15;	-- Éú³ÉµÄ°ËØÔÌ××°ÈİÆ÷

    pos_upgrade_sc_equipment= 16;
    pos_upgrade_sc_material	= 17;
   	pos_smelt_circle		= 18;	-- ÄÚµ¤ĞŞÁ¶ÈİÆ÷
	pos_offline_trade		= 19;	-- ÏßÏÂ½»Ò×
	pos_compose_siling_mount_base		= 20;	-- ºÏ³ÉËÄÁé×øÆï»ù´¡ÎïÆ·À¸
	pos_compose_siling_mount_material	= 21;	-- ºÏ³ÉËÄÁé×øÆï²ÄÁÏÀ¸

	pos_pet_book			= 22;	--³èÎïĞŞÊé½çÃæ
	pos_skill_app			= 23;	--¼¼ÄÜÊ¯
	pos_left_pearl_bag		= 24;	--²×º£ÒÅÖé×¨Êô±³°ü
--enum ITEM_POSITION
------------------------------------------------------------------------

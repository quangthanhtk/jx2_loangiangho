------------------------------------------------------------------------
--enum ITEMGENRE
	item_equip				= 0;	-- 装备
	item_use				= 1;	-- 消耗品
	item_other				= 2;	-- 其他杂物
	item_number				= 3;	-- 类型数目
--enum ITEMGENRE
------------------------------------------------------------------------

------------------------------------------------------------------------
--enum enumEQUIP_DETAIL
	enumWD_BEGIN			= 0; --c竎 define D v� kh� g鑓 l� + th猰 1 n猲 b� sai
	enumWD_CUFF				= 0;	--拳
	enumWD_RANGE			= 1;	--暗
	enumWD_SWORD			= 2;	--剑
	enumWD_BLADE			= 3;	--刀
	enumWD_BOW				= 4;	--弓
	enumWD_STAFF			= 5;	--棍
	enumWD_LANCE			= 6;	--枪
	enumWD_DUAL_BLADE		= 7;	--双刀
	enumWD_CLUB				= 8;	--锡杖
	enumWD_BRUSH			= 9;	--笔
	enumWD_STRING			= 10;	--琴
	enumWD_CLAW				= 11;	--爪
	enumWD_STAFF_FLUTE		= 12;	--笛子法杖
	enumWD_STAFF_PLANT		= 13;	--植物法杖
	enumWD_DUAL_DAGGER		= 14;	--双匕首
	enumWD_NUM				= 15;	--武器种类数量
	enumBD_CLOTH			= 100;	--衣
	enumBD_FOOT				= 101;	--鞋
	enumBD_ADORN			= 102;	--饰
	enumBD_HEAD				= 103;	--帽
	enumBD_CLOAK			= 104;	--披
	enumBD_HORSE			= 105;	--马
	enumBD_PET				= 106;	--宠物
	enumBD_BOOK				= 107;	--秘籍
	enumBD_COAT_CAP			= 108;	--外套帽子
	enumBD_COAT_CLOTH		= 109;	--外套衣服
	enumBD_COAT_TROUSERS	= 110;	--外套鞋子
	enumBD_COAT_SET			= 111;	--外套套装
	enumBD_GREAT_BOOK		= 112;	--镇派秘籍
	enumBD_ARMORY_CLOTH		= 113;	--纹饰-衣
	enumBD_ARMORY_FOOT		= 114;	--纹饰-鞋
	enumBD_ARMORY_ADORN		= 115;	--纹饰-饰
	enumBD_ARMORY_HEAD		= 116;	--纹饰-帽
	enumBD_ARMORY_BADGE			= 117;	--
	enumBD_DRESS_SMOCK		= 118;	--
	enumBD_ORNAMENT_CAP		= 119;	--饰品-帽
	enumBD_ORNAMENT_CLOTH	= 120;	--饰品-衣
	enumBD_ORNAMENT_FOOT	= 121;	--饰品-鞋
	enumBD_LEFT_PEARL		= 122;	--沧海遗珠

	enumBD_END				= 123;	--完结标记
	enumBD_NUM				= enumBD_END - enumBD_CLOTH;

	_enumWENSHI_BEGIN 		= 148; --------
	enumWENSHI_H 			= _enumWENSHI_BEGIN;--纹饰-头
	enumWENSHI_C 			= 149;				--纹饰-衣
	enumWENSHI_T 			= 150;				--纹饰-装
	enumWENSHI_SET 			= 151;				--纹饰-套装
	_enumWENSHI_TMP1_ 		= 152;
	_enumWENSHI_END = _enumWENSHI_TMP1_ - 1;--------

	enumBD_CAPE 			= 152;	--披风
	enumBD_BADGE 			= 153;	--徽章
	enumBD_SHOE 			= 154;	--鞋子
	enumBD_TOKENS 			= 155;	--令牌

	enumTD_TOOLS			= 200;	--工具类型
	enumTD_END				= 201;	--完结标记
	enumTD_NUM				= enumTD_END - enumTD_TOOLS;
	enumED_INNER_STONE		= 210;	--内丹
	enumED_NUM				= enumWD_NUM + enumBD_NUM;
--enum enumEQUIP_DETAIL
------------------------------------------------------------------------

------------------------------------------------------------------------
--enum enumUSE_DETAIL
	enumUS_MEDICINE			= 0;	--丹药
	enumUS_FOOD				= 1;	--食物
	enumUS_MEDICINE_RESOURCE= 2;	--草药(可合成丹药，也可以吃)
	enumUS_FOOD_RESOURCE	= 3;	--食材(可合成食物，也可以吃)
	enumUS_TELEPORT			= 4;	--传送类
	enumUS_CORPSE			= 6;	--封尸符
	enumUS_CORPSE_GGS		= 7;	--跨服封尸符(要被坑死)
	_enumUS_TMP1_			= 8;
	_enumUS_EAT_END = _enumUS_TMP1_ - 1;--------
	enumUS_NUM				= 8;
--enum enumUSE_DETAIL
------------------------------------------------------------------------

------------------------------------------------------------------------
--enum enumOTHER_DETAIL
	enumOD_QUEST			= 0;	--任务物品
	enumOD_MYSTER			= 1;	--神秘物品
	enumOD_COMPOUND			= 2;	--合成物品
	enumOD_SKILL_COST		= 3;	--技能消耗物品
	enumOD_STONE			= 4;	--爻石
	enumOD_SCROLL			= 5;	--卷轴
	enumOD_ADDENDA			= 6;	--武功心得
	enumOD_ORIGIN_WOOD		= 7;	--原木
	enumOD_ORIGIN_STONE		= 8;	--原石
	enumOD_ORIGIN_SILK		= 9;	--原尸
	enumOD_ORIGIN_SKIN		= 10;	--圆皮
	enumOD_ANQI				= 11;	--暗器
	enumOD_BATTLE			= 12;	--战场专用物品
	enumOD_SERIES_STONE		= 13;	--五行石
	enumOD_TREASURE_SHOW	= 14;	--藏宝图
	enumOD_ARROW			= 15;	--箭矢
	enumOD_GU_MATRIX		= 16;	--蛊母
	enumOD_GU_INSECT		= 17;	--蛊虫
	enumOD_LING_STONE		= 18;	--灵石
	enumOD_LIFE_SCROLL		= 19;	--生活技能卷轴 - Jeep tag
	enumOD_SUNMMON			= 20;	--召唤道具/宠物牌
	enumOD_LING_SHI_PEIFANG	= 21;	--灵石合成配方
	enumOD_GEM				= 22;	--VN宝石
	enumOD_SKILL_APP 		= 23; 	--技能石
	_enumOD_VN_BEGIN 		= 150;	--越南版本占用的ID段
	enumOD_PET_SKILL_BOOK	= _enumOD_VN_BEGIN;	--宠物技能书
	enumOD_EF_LOCK_RAND		= 151;	--锁灵石 可以锁定养成装备的一个属性
	enumOD_ACTIVITY_ITEM	= 200;	--活动道具

	enumOD_NUM				= 201;
--enum enumOTHER_DETAIL
------------------------------------------------------------------------

------------------------------------------------------------------------
--enum ITEM_PART
	itempart_head			= 0;	-- 头
	itempart_body			= 1;	-- 内衣
	itempart_weapon			= 2;	-- 兵器
	itempart_foot			= 3;	-- 脚部
	itempart_ring			= 4;	-- 装饰栏1
	itempart_ring2			= 5;	-- 装饰栏2
	itempart_mask			= 6;	-- 面具
	itempart_cloth			= 7;	-- 外衣
	itempart_outfoot		= 8;	-- 下半身的外套
	itempart_great_book		= 9;	-- 副秘籍
	itempart_horse			= 10;	-- 马
	itempart_book			= 11;	-- 秘籍
	itempart_weapon_extend	= 12;	-- 武器扩展(暗器;箭矢)
	itempart_innerstone1	= 13;	-- 内丹1
	itempart_innerstone2	= 14;	-- 内丹2
	itempart_innerstone3	= 15;	-- 内丹3
	itempart_innerstone4	= 16;	-- 内丹4

	itempart_cape			= 17;	-- 披风
	itempart_badge			= 18;	-- 徽章
	itempart_shoe			= 19;	-- 鞋子

	itempart_tokens			= 20;	--

	itempart_ornament_cap	= 21;	-- 饰品-帽
	itempart_ornament_cloth	= 22;	-- 饰品-衣
	itempart_ornament_foot	= 23;	-- 饰品-鞋

	itempart_armory_head	= 24;	-- 纹饰-冠
	itempart_armory_body	= 25;	-- 纹饰-衣
	itempart_armory_foot	= 26;	-- 纹饰-装
	itempart_armory_ring1	= 27;	-- 纹饰-戒指1
	itempart_armory_ring2	= 28;	-- 纹饰-戒指2
	
	itempart_left_pearl_1	= 29;	-- 沧海遗珠1号位
	itempart_left_pearl_2	= 30;	-- 沧海遗珠2号位
	itempart_left_pearl_3	= 31;	-- 沧海遗珠3号位
	itempart_left_pearl_4	= 32;	-- 沧海遗珠4号位
	itempart_left_pearl_5	= 33;	-- 沧海遗珠5号位
	itempart_left_pearl_6	= 34;	-- 沧海遗珠6号位
	itempart_left_pearl_7	= 35;	-- 沧海遗珠7号位

	itempart_num			= 36;
--enum ITEM_PART
------------------------------------------------------------------------

------------------------------------------------------------------------
--enum ITEM_POSITION
	pos_hand				= 0;	-- 手上
	pos_equip				= 1;	-- 装备着的
	pos_equiproom			= 2;	-- 道具栏
	pos_repositoryroom		= 3;	-- 贮物箱
	pos_immediacy			= 4;	-- 快捷物品
	pos_tradeself			= 5;	-- 自己的交易栏
	pos_tradeother			= 6;	-- 别人的交易栏
	pos_stallself			= 7;	-- 自己的摆摊空间
	pos_compose				= 8;	-- 合成箱附加物品箱
	pos_stallother			= 9;	-- 别人的摆摊空间
	pos_slaveitem			= 10;	-- 是一个组合物品中的配件
	pos_packageitem			= 11;	-- 是一个组合物品的容器物品
	pos_bagua_compose		= 12;	-- 八卦合成的添加物
	pos_bagua_depose		= 13;	-- 八卦打散套装的添加物
	pos_bagua_part_item		= 14;	-- 八卦合成所需的物品容器
	pos_bagua_item			= 15;	-- 生成的八卦套装容器

    pos_upgrade_sc_equipment= 16;
    pos_upgrade_sc_material	= 17;
   	pos_smelt_circle		= 18;	-- 内丹修炼容器
	pos_offline_trade		= 19;	-- 线下交易
	pos_compose_siling_mount_base		= 20;	-- 合成四灵坐骑基础物品栏
	pos_compose_siling_mount_material	= 21;	-- 合成四灵坐骑材料栏

	pos_pet_book			= 22;	--宠物修书界面
	pos_skill_app			= 23;	--技能石
	pos_left_pearl_bag		= 24;	--沧海遗珠专属背包
--enum ITEM_POSITION
------------------------------------------------------------------------

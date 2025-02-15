YWZ_SYSTEM_SWITCH = 1;

--Task define------------------------
YWZ_TASK_1 = 3387;
YWZ_TASK_2 = 3388;

--Limit----
YWZ_WEEK_TASK_LIMIT = 50; --周常任务上限
YWZ_EX_TASK_AWARD = 15; --上交天骄令获取额外奖励上限

--周常任务列表
YWZ_WEEK_TASK_TABLE = {
	{20, "Th莕 Уn H� Ph竝", "Th蕋 L筩 Nhai (174,222)"},
	{20, "Nh藅 n h� ph竝", "Th蕋 L筩 Nhai (191,200)"},
	{20, "Giang H� Ti猽 Ti觰", "Th蕋 L筩 Nhai (179,194)"},
	{20, "Hoa T玭g M玭 Nh﹏", "Th蕋 L筩 Nhai (181,205)"},
	{20, "Nhai Thng S琻 T芻", "Th蕋 L筩 Nhai (160,209)"},
	{20, "Nguy謙 Уn H� Ph竝", "Th蕋 L筩 Nhai (149,202)"},
	{20, "Tinh Уn H� Ph竝", "Th蕋 L筩 Nhai (172,183)"},
}

--RelayShareData---------------------
YWZ_SHARE_DATA = "_YWZ_DATA_";
-- 0, 0 [势力编号（大理1，吐蕃2，西夏3）] = 势力贡献度
-- 0, 1 [GetName()] = 个人积分(大理)
-- 0, 2 [GetName()] = 个人积分(吐蕃)
-- 0, 3 [GetName()] = 个人积分(西夏)
-- 1, 0 ["WeekFlag"] = gf_GetWeekly() --跨周重置标记

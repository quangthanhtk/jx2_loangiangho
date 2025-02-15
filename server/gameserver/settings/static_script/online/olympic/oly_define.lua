--数据定义

--szLogTitle = "奥运活动";
--szLogTitle = "重燃圣火活动";
--szLogTitle = "圣火坛活动"
szLogTitle = "Ho箃 ng Th竛h H醓 Уn"
HuoTanNpcName = "Ho� n"
HuoZhongName = "Ng鋘 L鯽"

Flame_Table = {
	{2,1,30894,1,"Ng鋘 L鯽 п"},
	{2,1,30895,1,"Ng鋘 L鯽 L鬰"},
	{2,1,30896,1,"Ng鋘 L鯽 V祅g"},
	{2,1,30897,1,"Ng鋘 L鯽 Lam"},
	{2,1,30898,1,"Ng鋘 L鯽 n"},
}

WuCai_Shenshi = {2,1,30900,1,"Ng� S綾 Chi Tinh"};
WuCai_ShenHuoZhong = {2,1,30899,1,"Ng鋘 L鯽 Ng� S綾"}

Compose_ShengHuo_Num_1 = 5;
Compose_ShenShi_Num_1 = 1;

Compose_ShengHuo_Num_2 = 9;
Compose_Coin_Num_2 = 50;

OLY_IB_FIRE_MAX_NUM = 30;--最大点火次数

Guess_Flag = 99; --猜对数字标识值
OLY_MAX_RAND = 100; --random最大值
OLY_MAX_GUESS = 5; --最大猜数字次数
OLY_MAX_AWARD_NUM = 3; --奖励次数

--记录天罡里数目
Glb_Oly_TGL_NUM = 2016;

--幸运数字时间段s
OLY_TIME_START = 21 * 3600;
OLY_TIME_MID = OLY_TIME_START + 1800;
OLY_TIME_END = OLY_TIME_START + 3600;
OLY_MAX_LUCK_NUM = 9999; --最大输入幸运数

--记录当天21点relay生成的幸运数
Glb_Oly_Luck_NUM = 2017;

--Relay共享数据结构
OLY_SHARE_STRING = "aok"
OLY_SHARE_ITEM = "ok"
OLY_SHARE_KEY1 = "key1_201508"
OLY_SHARE_KEY2 = "key2_201508"
OLY_SHARE_KEY3 = "key3_201508"

--记录发出的天罡令数目
Oly_Record = {
	szKey = OLY_SHARE_STRING..OLY_SHARE_KEY1,
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = OLY_SHARE_ITEM..OLY_SHARE_KEY1,
}
--Relay生成随机幸运数字
Oly_Record2 = {
	szKey = OLY_SHARE_STRING..OLY_SHARE_KEY2,
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = OLY_SHARE_ITEM..OLY_SHARE_KEY2,
}
--记录幸运数字中奖人数
Oly_Record3 = {
	szKey = OLY_SHARE_STRING..OLY_SHARE_KEY3,
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = OLY_SHARE_ITEM..OLY_SHARE_KEY3,
}

--最大登记数目
MAX_WIN_NUM = 10;

--天罡碎片兑换天罡令
OLY_EXCHANGE_BASE = 1000;

--
OLY_EXP_2 = 666000;
OLY_EXP_3 = 999000;



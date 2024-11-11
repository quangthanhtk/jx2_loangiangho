Include("\\script\\newbattles\\functions.lua");
--达鲁古城战场的新奖励

--获得不适用任何东西能够换取的军功数
function get_dlgc_base_jungong()
	--败场或者平局给予900+300*（活跃值/100)
	--胜场给予1200+300*（活跃值/100)
	return BT_GetData(PT_JUNGONG_AWARD);
end

--军功加成基础值
--1为外传，0为免费区，2为收费区
if _JX2WZ == 1 then
	g_nBonusJungong = 1050;
else
	g_nBonusJungong = 1000;
end
--胜负军功基础
if _JX2WZ == 1 then
	g_tBaseJungong = {
		[0] = 900,
		[1] = 1000,
		[2] = 1200,
	}
else
	g_tBaseJungong = {
		[0] = 400,
		[1] = 600,
		[2] = 900,
	}
end

g_tActivityAward = {
	{150,  1,   300},
	{300,  1.2, 450},
	{501, 1.5,   550},
	{901, 1.8, 650},
	{1301, 2,   760},
	{2001, 2.5,   850},
	{2501, 3,   960},
};

--胜负经验基础
g_tBaseExp = {
	[0] = 2,
	[1] = 3,
	[2] = 4,
}

g_tBaseDPL = {
	[0] = 5,
	[1] = 10,
	[2] = 25,
};

--军功章或vip加成系数
g_tTicketRatio = {
	[0] = 1,
	[1] = 2,
	[2] = 5,
	[3] = 10,
	[4] = 1,  --vip卡
	[5] = 1.5,  --vip卡
	[6] = 3,  --vip卡
	[7] = 1,  --vip卡
	[8] = 1.5,--贵宾虎纹卡
	[9] = 1.5,--至尊虎纹卡
}

--使用军功章/vip领取军功
function get_dlgc_bonus_jungong(nType)
	return g_nBonusJungong * (g_tTicketRatio[nType] - 1);
end

--军功补领基础值
--1为外传，0为免费区，2为收费区
if _JX2WZ == 1 then
	g_nBulingJungong = 1000;
else
	g_nBulingJungong = 700;
end

--使用军功章/vip补领军功
function get_dlgc_buling_jungong(nType)
	return g_nBulingJungong + get_dlgc_bonus_jungong(nType)
end

--根据胜负来计算军功 0:平局 1:负 2:胜
function calculate_dlgc_jungong(nType)
	return g_tBaseJungong[nType] + 300 * (BT_GetData(PTNC_ACTIVITY) / 100);
end

--获得不适用任何东西能够换取的经验
function get_dlgc_base_exp()
	return BT_GetData(PT_EXP_AWARD);
end

--使用军功章/vip获取额外的经验
function get_dlgc_bonus_exp(nType)
	local nLevel = GetLevel();
	return nLevel * nLevel * 10 * 30 * g_tTicketRatio[nType];
end

--补领经验
function get_dlgc_buling_exp(nType)
	local nLevel = GetLevel();
	return nLevel * nLevel * 300 * 2 + get_dlgc_bonus_exp(nType);
end

--根据胜负来计算经验 0:平局 1:负 2:胜
function calculate_dlgc_exp(nType)
	local nLevel = GetLevel();
	local nExp = nLevel * nLevel * 300 * g_tBaseExp[nType] + nLevel * nLevel * 300 * (BT_GetData(PTNC_ACTIVITY) / 100);
	if BT_GetData(PTNC_ACTIVITY) < 5 then
		nExp = 0;
	end
	return nExp;
end



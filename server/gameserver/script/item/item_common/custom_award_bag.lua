--通用奖励组发奖道具脚本
Import("\\script\\lib\\globalfunctions.lua")

g_tItem2CustomAwardInfo = {
--	[gf_PackItemGDP(g, d, p)] 	  = {szAward, bGiveAll, {RuntimeStat}, }, --ItemName

	[gf_PackItemGDP(2, 1, 31508)] = {"fenghua3",		0, nil,}, --风华大使的礼物
	[gf_PackItemGDP(2, 1, 31509)] = {"suolingshixiang",	0, nil,}, --锁灵石箱
	[gf_PackItemGDP(2, 1, 31510)] = {"yizhu5_7",		0, nil,}, --闪烁的沧海遗珠(未鉴定)
}

function OnUse(nItemIdx)
	local nItemIdx = tonumber(nItemIdx)
	local g,d,p = GetItemInfoByIndex(nItemIdx)
	local tInfo = g_tItem2CustomAwardInfo[gf_PackItemGDP(g, d, p)]

	if not tInfo then
		Talk(1,"","Чo c� l鏸, xin li猲 h� CSKH.")
		return 0
	end

	local szAward  = tInfo[1]
	local bGiveAll = tInfo[2]
	local tRsInfo  = tInfo[3]

	if CustomAwardCheckCondition(szAward) ~= 1 then
		return 0
	end

	gf_SetLogCaption(szAward)
	
	if gf_DelItemByIndex(nItemIdx, 1) ~= 1 then
		return 0
	end

	if CustomAwardGiveGroup(szAward, bGiveAll) <= 0 then   --二号参数为是否给予全部奖励
		return 0
	end
	
	if tRsInfo and getn(tRsInfo) >= 4 then
		AddRuntimeStat(tRsInfo[1], tRsInfo[2], tRsInfo[3], tRsInfo[4])
	end

	gf_SetLogCaption("")

	return 1
end